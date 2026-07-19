unit UintegracaoWEB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Mask, ExtCtrls, FileCtrl, DB,
  DBTables, ConsOnlineEx, PGGP017, Funcoes, ADODB, Txtradev, ppDB,
  ppDBPipe, MemTable, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, LibTiffDelphi, LibDelphi, LibJpegDelphi,
  IdMessage, IdSMTP, Gauges, IniFiles, JPEG;

type
  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

type
  Tfrm_upload_img = class(TForm)
    panel: TPanel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    arquivos: TFileListBox;
    dbComex: TDatabase;
    btn_envio: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    lbl_cd_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    ArquivosAux: TFileListBox;
    lblbarra: TLabel;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    tblFig: TMemoryTable;
    tblFigFileName: TStringField;
    ds1: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    Gauge1: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure btn_envioClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    procedure ResizeImage(FileName: string; MaxWidth: Integer);
    procedure SmoothResize(Src, Dst: TBitmap);
    procedure EnviaTiffs;
    procedure EnviaImagens;
    procedure EnviaDemaisArquivos;
  public
    vCriarSession : Boolean ;
    sesCriaAlias, sesCriaAlias2 : TSession;
    MyList, MyList2: TStringList;
    QtdArquivos, QtdArquivosAux, vBarra: integer;
    converter: array of record
                          grupo: string;
                          texto: string;
                          ExisteErro: boolean;
                        end;
    MostrarAviso: boolean;
    vQryTpArquivo, vQryDados1, vQryDados2, vQryDados3: TQuery;
    vPedidos, vEmbalagens: string;
    vQualidadeImagem: TPixelFormat;
    Function EncontraNome(pArquivoOld: string): String;
    { Public declarations }
  end;

var
  frm_upload_img: Tfrm_upload_img;
  vPathOrigem, vPathDestino:   String;
  vPastaOrigem, vPastaDestino: String;
  vArquivoOld, vArquivoNew, vArquivoDel:    String;

implementation

uses DateUtils, PGGP001, Math, PGSM990, GSMLIB;

const
  _EXT_IMAGENS = '(''TIF'', ''JPG'', ''BMP'')'; 

{$R *.dfm}

procedure Tfrm_upload_img.FormCreate(Sender: TObject);
var
  vIni : TIniFile;

begin                  
    vQualidadeImagem := pf4bit;
    vIni := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'CONFIG.INI');
    vPathOrigem  := vIni.ReadString('WIORIGEM', 'PATH', 'ERROR');
    vPathDestino := vIni.ReadString('WIDESTINO', 'PATH', 'ERROR');
    vIni.Free;


//  vPathOrigem  := '\\INDAIA-WEB\Drive_M\WIVIEWER\IMAGEM\';
//  vPathDestino := '\\INDAIA03\Documentos\DOCS_SITE\';
//  vPathOrigem  := 'C:\Imagem\';
//  vPathDestino := 'C:\Docs_Site\';

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', str_cd_unid_neg, 'NM_UNID_NEG');
  edt_nm_produto.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', str_cd_produto, 'NM_PRODUTO');

  {---criação automática de BDE´s necessários a execução ------------------INI---}
  try
    sesCriaAlias := TSession.Create(application);
    sesCriaAlias.SessionName := 'sesCriaAlias';
    sesCriaAlias.Active := True;
    MyList := TStringList.Create;

    sesCriaAlias2 := TSession.Create(application);
    sesCriaAlias2.SessionName := 'sesCriaAlias2';
    sesCriaAlias2.Active := True;
    MyList2 := TStringList.Create;

    try
      if sesCriaAlias.IsAlias('COMEX') Then sesCriaAlias.DeleteAlias('COMEX');
      with MyList do begin
        Add('APPLICATION NAME=MYINDAIA-COMEX');
        Add('BATCH COUNT=500');
        Add('BLOB SIZE=128');
        Add('BLOBS TO CACHE=256');
        Add('DATABASE NAME=COMEX');
        Add('LANGDRIVER=''ascii'' ANSI');
        Add('SERVER NAME=INDAIADES');
        Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
        Add('SQLQRYMODE=SERVER');
        Add('USER NAME=sa');
      end;
      sesCriaAlias.AddAlias('COMEX', 'MSSQL', MyList);
    except
    end;
    MyList.Free;
    sesCriaAlias.Free;
  except
  end;

  try
    try
      if sesCriaAlias2.IsAlias('MYINDAIA') Then sesCriaAlias2.DeleteAlias('MYINDAIA');
      with MyList2 do begin
        Add('APPLICATION NAME=DDBROKER');
        Add('BATCH COUNT=500');
        Add('BLOB SIZE=128');
        Add('BLOBS TO CACHE=256');
        Add('DATABASE NAME=MYINDAIA');
        Add('LANGDRIVER=''ascii'' ANSI');
        Add('SERVER NAME=INDAIA10');
        Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
        Add('SQLQRYMODE=SERVER');
        Add('USER NAME=sa');
      end;
      sesCriaAlias2.AddAlias('MYINDAIA', 'MSSQL', MyList2);
    except
    end;
    MyList2.Free;
    sesCriaAlias2.Free;
  except
  end;
{---criação automática de BDE´s necessários a execução ------------------FIM---}
end;

procedure Tfrm_upload_img.btn_envioClick(Sender: TObject);
var
  vTo: String;
  QtdArquivos, QtdArquivosAux, i, vBarra: integer;
  vQryTpArquivo, vQryDados1, vQryDados2, vQryDados3: TQuery;
  {IdMessage1: TIdMessage;
  IdSMTP1   : TIdSMTP;}
  vPedidos, vEmbalagens: string;
  SR: TSearchRec;
  Body: TStrings;
  Anexos: TStrings;
begin
{---define pasta de Origem e Destino ------------------------------------INI---}
  btn_envio.Enabled := false;
  btn_envio.Caption := 'Enviando ...';
  Application.ProcessMessages;
  lblbarra.Visible := true;
  vPastaDestino := Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
  vPastaOrigem  := Copy(Trim(msk_nr_processo.Text), 1, 2) + Copy(Trim(msk_nr_processo.Text), 4, 4) + Copy(Trim(msk_nr_processo.Text), 9, 2);
{---define pasta de Origem e Destino ------------------------------------FIM---}

  ForceDirectories(vPathOrigem + vpastaOrigem);
  ForceDirectories(vPathDestino + vPastaDestino);
  
{---verifica existência da Pasta de Origem (no Work Image) --------------INI---}
    if not DirectoryExists(vPathOrigem + vpastaOrigem + '\') then begin
      MessageBox(0, PChar('Não existe nenhuma imagem relacionada a esse processo!' + chr(13) + 'Verifique suas imagens e seu nome no Work Image!'), 'MyIndaiá', 0);
      Exit;
    end;
{---verifica existência da Pasta de Origem (no Work Image) --------------FIM---}

{---apaga imagens do diretorio de Destino ou Cria Pasta (WEB) -----------INI---}
    if DirectoryExists(vPathDestino + vPastaDestino + '\') then begin
      arquivosAux.Directory := vPathDestino + vPastaDestino + '\';
      QtdArquivosAux := arquivosAux.Count;
      if QtdArquivosAux <> 0 then begin
        lblbarra.Caption := 'Excluindo arquivos ...';
        Application.ProcessMessages;
        for i := 0 to QtdArquivosAux - 1 do
        begin
          vArquivoDel := arquivosAux.Directory + '\' + arquivosAux.Items.Strings[i];
          SetFileAttributes(PAnsiChar(vArquivoDel), FILE_ATTRIBUTE_NORMAL);
          DeleteFile(vArquivoDel);
        end;
      end;
    end else
      CreateDir(vPathDestino + vPastaDestino);
{---apaga imagens do diretorio de Destino ou Cria Pasta (WEB) -----------FIM---}

  EnviaTiffs;
  EnviaImagens;
  EnviaDemaisArquivos;

{---faz update na tabela de FollowUP no evento 525, se existir-----------INI---}
    if  ConsultaLookUPSQL('SELECT ISNULL(CH.IN_ENVIA_PDF, "0") ENVIA_PDF FROM TCLIENTE_HABILITACAO  CH (NOLOCK) ' +
                          ' WHERE CH.CD_CLIENTE + CH.CD_UNID_NEG + CH.CD_PRODUTO IN ' +
                          ' (SELECT P.CD_CLIENTE + P.CD_UNID_NEG + P.CD_PRODUTO FROM TPROCESSO P (NOLOCK) ' +
                          '   WHERE NR_PROCESSO = "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" )', 'ENVIA_PDF') = '1' then begin

        lblbarra.Caption := 'Enviando e-mail para Analista Processo ..';
        Application.ProcessMessages;

      vTo := InputBox('Envio de doctos. digitalizados por e-mail', 'Informe os e-mails das pessoas que deverão receber os doctos digitalizados deste processo.' + #13#10 +
                                                                   'Para mais de um e-mail separe-os com ponto-e-vírgula (;)!'
                                         , ConsultaLookUPSQL('SELECT ISNULL(NM_EMAIL, "") AS EMAIL FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO IN (SELECT CD_ANALISTA_COMISSARIA FROM TPROCESSO (NOLOCK) ' +
                                                             ' WHERE NR_PROCESSO = "' +Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '") ', 'EMAIL'));
      if vTo <> '' then begin
{---envia e-mail para o analista do processo se permitir-----------------INI---}

        ArquivosAux.Update;
        ArquivosAux.Mask := '*.*';
        ArquivosAux.Directory := vPathDestino + vPastaDestino + '\';
        ArquivosAux.Refresh;
        ArquivosAux.Update;
        QtdArquivosAux := ArquivosAux.Count;
        i := 0;

        Body := TStringList.Create;
        Anexos := TStringList.Create;
        for i := 0 to QtdArquivosAux - 1 do
          Anexos.Add(vPathDestino + vPastaDestino + '\' + ArquivosAux.Items.Strings[i]);
        {IdMessage1 := TIdMessage.Create(application);
        IdSMTP1    := TIdSMTP.Create(application);

        for i := 0 to QtdArquivosAux - 1 do
          TIdAttachment.Create(IdMessage1.MessageParts, vPathDestino + vPastaDestino + '\' + ArquivosAux.Items.Strings[i]);

        with IdMessage1 do}
        begin
           vQryDados1 := TQuery.Create(application);
           vQryDados2 := TQuery.Create(application);
           vQryDados3 := TQuery.Create(application);

           vQryDados1.DataBaseName := 'DBBROKER';
           vQryDados1.Close;
           vQryDados1.SQL.Clear;
           vQryDados1.SQL.Add('SELECT "Unidade: " + ISNULL((SELECT UN.AP_UNID_NEG FROM TUNID_NEG UN (NOLOCK) WHERE UN.CD_UNID_NEG = P.CD_UNID_NEG), "") AS AP_UNIDADE, ');
           vQryDados1.SQL.Add('       "Produto: " + ISNULL((SELECT PR.NM_PRODUTO  FROM TPRODUTO  PR (NOLOCK) WHERE PR.CD_PRODUTO  = P.CD_PRODUTO), "")  AS NM_PRODUTO, ');
           vQryDados1.SQL.Add('       "Processo: " + ISNULL(SUBSTRING(P.NR_PROCESSO, 5, 14), "") AS PROCESSO, ');
           vQryDados1.SQL.Add('       "Nome do Produto: " + ISNULL(CAST(P.TX_MERCADORIA AS VARCHAR(500)), "") AS PRODUTO, ');
           vQryDados1.SQL.Add('       (CASE ISNULL(P.CD_EMBARCACAO, "") ');
           vQryDados1.SQL.Add('          WHEN "" THEN "Nome do Navio/Vôo: " + P.NR_VOO ');
           vQryDados1.SQL.Add('          ELSE         "Nome do Navio/Vôo: " +(SELECT E.NM_EMBARCACAO FROM TEMBARCACAO E (NOLOCK) WHERE E.CD_EMBARCACAO = P.CD_EMBARCACAO) ');
           vQryDados1.SQL.Add('        END) AS NAVIO_VOO, ');
           vQryDados1.SQL.Add('       (SELECT F.DT_REALIZACAO FROM TFOLLOWUP F WHERE NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = "162")  AS DT_ENTRADA, ');
           vQryDados1.SQL.Add('       "Armazém de descarga/ Local: " + ISNULL((SELECT NM_ARMAZEM FROM TARMAZEM WHERE CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA), "") AS ARMAZEM_DESC, ');
           vQryDados1.SQL.Add('       "Nº da D.I.: " + (CASE ISNULL(P.NR_DI, "") ');
           vQryDados1.SQL.Add('                           WHEN "" THEN "" ');
           vQryDados1.SQL.Add('                           ELSE SUBSTRING(P.NR_DI, 1,2) + "/" + SUBSTRING(P.NR_DI, 3,7) + "-" + SUBSTRING(P.NR_DI, 10,1) ');
           vQryDados1.SQL.Add('                         END) AS DI, ');
           vQryDados1.SQL.Add('       (SELECT F.DT_REALIZACAO FROM TFOLLOWUP F WHERE NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = "021")  AS DT_REG_DI, ');
           vQryDados1.SQL.Add('       (SELECT F.DT_REALIZACAO FROM TFOLLOWUP F WHERE NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = "088")  AS DT_DESEMB, ');
           vQryDados1.SQL.Add('       "Peso Bruto: " + ISNULL(CAST(P.VL_PESO_BRUTO AS VARCHAR(20))  + " kg", "") AS PESO_BRUTO, ');
           vQryDados1.SQL.Add('       "Peso Líquido: " + ISNULL(CAST(P.VL_PESO_LIQUIDO AS VARCHAR(20))  + " kg", "") AS PESO_LIQUIDO, ');
           vQryDados1.SQL.Add('       P.DT_VENCTO_ARMAZENAGEM, ');
           vQryDados1.SQL.Add('       (SELECT F.DT_REALIZACAO FROM TFOLLOWUP F WHERE NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = "041")  AS DT_TRANSP ');
           vQryDados1.SQL.Add('  FROM TPROCESSO P (NOLOCK) ');
           vQryDados1.SQL.Add(' WHERE P.NR_PROCESSO = "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" ');
           vQryDados1.Open;

           vQryDados2.DataBaseName := 'DBBROKER';
           vQryDados2.Close;
           vQryDados2.SQL.Clear;
           vQryDados2.SQL.Add('SELECT RTRIM(CD_REFERENCIA) + "/" + RTRIM(NR_ITEM_PO) + "  " ');
           vQryDados2.SQL.Add(' FROM TREF_CLIENTE WHERE NR_PROCESSO = "'+ Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) +'" ');
           vQryDados2.SQL.Add('AND ISNULL(CD_REFERENCIA, "") <> ""');
           vQryDados2.Open;
           vPedidos := '';
           while not vQryDados2.Eof do begin
             if Length(vPedidos) > 240 then
               vPedidos := vPedidos + '...'
             else
               vPedidos :=  vPedidos + '   ' + vQryDados2.Fields[0].AsString;
             vQryDados2.Next;
           end;

           Body.Add('');
           Body.Add(vQryDados1.Fields[0].AsString + #13#10);
           Body.Add(vQryDados1.Fields[1].AsString + #13#10);
           Body.Add(vQryDados1.Fields[2].AsString + #13#10);
           Body.Add('Nr. do pedido : ' + vPedidos + #13#10);
           Body.Add(vQryDados1.Fields[3].AsString + #13#10);
           Body.Add(vQryDados1.Fields[4].AsString + #13#10);
           Body.Add('Data de entrada: ' + vQryDados1.Fields[5].AsString + #13#10);
           Body.Add(vQryDados1.Fields[6].AsString + #13#10);
           Body.Add(vQryDados1.Fields[7].AsString + #13#10);
           Body.Add('Data do registro da D.I.: ' + vQryDados1.Fields[8].AsString + #13#10);
           Body.Add('Data do Desembaraço: ' + vQryDados1.Fields[9].AsString + #13#10);


           vQryDados3.DataBaseName := 'DBBROKER';
           vQryDados3.Close;
           vQryDados3.SQL.Clear;
           if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text)   , 'TP_ESTUFAGEM') = '1' then begin
             vQryDados3.SQL.Add('SELECT CAST(VL_QTDE AS VARCHAR(20)) + " " + RTRIM(NM_ESPECIE) + ", " ');
             vQryDados3.SQL.Add('  FROM TPROCESSO_CARGA_SOLTA ');
             vQryDados3.SQL.Add(' WHERE NR_PROCESSO = "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" ');
             vQryDados3.SQL.Add('  AND ISNULL(NM_ESPECIE, "") <> "" ');
           end else begin
             vQryDados3.SQL.Add('SELECT CAST(COUNT(*) AS VARCHAR(3)) + " " + RTRIM(C.NM_TP_CNTR) + ", " ');
             vQryDados3.SQL.Add('  FROM TPROCESSO_CNTR PC ');
             vQryDados3.SQL.Add('  LEFT JOIN TTP_CNTR C ON  C.TP_CNTR = PC.TP_CNTR ');
             vQryDados3.SQL.Add(' WHERE PC.NR_PROCESSO = "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" ');
             vQryDados3.SQL.Add(' GROUP BY  C.NM_TP_CNTR ');
           end;
           vEmbalagens := '';
           vQryDados3.Open;
           while not vQryDados3.Eof do begin
             if Length(vEmbalagens) > 240 then
               vEmbalagens := vEmbalagens + '...  '
             else
               vEmbalagens := vEmbalagens +  ' ' + vQryDados3.Fields[0].AsString;
             vQryDados3.Next;
           end;
           vEmbalagens := Copy(vEmbalagens, 1, Length(vEmbalagens) - 1);
           Body.Add('Embalagem: ' + vEmbalagens + #13#10);
           Body.Add(vQryDados1.Fields[10].AsString + #13#10);
           Body.Add(vQryDados1.Fields[11].AsString + #13#10);
           Body.Add('Vencimento Armazenagem: ' + vQryDados1.Fields[12].AsString + #13#10);
           Body.Add('Documentos disponibilizados para a transportadora: ' + vQryDados1.Fields[13].AsString + #13#10);
           Body.Add('');
           Body.Add(' Este é um email gerado automaticamente pelo MyIndaiá.');
           Body.Add(' Dúvidas: myindaia@myindaia.com.br');
           Body.Add('');
           vQryDados1.Free;
           vQryDados2.Free;
           vQryDados3.Free;

           {From.Text                 := Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL'));
           ReplyTo.EMailAddresses    := Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL'));
           Recipients.EMailAddresses := vTo;
           Subject := '[myIndaiáMail] Doctos Digitalizados. Processo nº ' + Trim(msk_nr_processo.Text) + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);}
        end;
        {IdSMTP1.Host := 'mail.indaialogistica.com.br';
        IdSMTP1.Port := 25;
        IdSMTP1.Connect;
        try
          IdSMTP1.Send(IdMessage1)
        except
          ShowMessage('O e-mail não foi enviado pois o endereço de e-mail estava incorreto!');
        end;
        IdSMTP1.Disconnect;
        IdMessage1.MessageParts.Clear;
        IdMessage1.Clear;}
        if not GSMLIB.EnviaEmailDe('[myIndaiáMail] Doctos Digitalizados. Processo nº ' + Trim(msk_nr_processo.Text) + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now),
           Body.Text, vTo, Trim(ConsultaLookUp('TUSUARIO','CD_USUARIO',str_cd_usuario,'NM_EMAIL')), GSMLIB.StringsToArray(Anexos)) then
          ShowMessage('O e-mail não foi enviado pois o endereço de e-mail estava incorreto!');
        Anexos.Free;
        Body.Free;
      end;
    end;
    lblbarra.Caption := 'Atualizando Follow-Up ...';
    Application.ProcessMessages;
    FastExecSQL('UPDATE TFOLLOWUP SET DT_REALIZACAO = "' + Copy(DateToStr(now), 1, 10) + '", CD_RESP_REALIZACAO = "'+ str_cd_usuario +'" ' +
                ' WHERE NR_PROCESSO = "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" ' +
                'AND CD_EVENTO = "525"  AND IN_APLICAVEL = "1" AND ISNULL(DT_REALIZACAO, "") = "" ');
    FastExecSQL('EXEC SP_ATZ_FOLLOWUP "' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '" ');


{---faz update na tabela de FollowUP no evento 525, se existir-----------FIM---}

{---envia e-mail para o analista do processo se permitir-----------------FIM---}

{---fazer update na tabela do MyIndaia WEB com a data atual do envio-----INI---}
  datm_main.db_broker.Connected := false;

  with TDatabase.Create(application) do begin
    lblbarra.Caption := 'Atualizando os registros para a WEB ...';
    Application.ProcessMessages;
    Params.Add('DATABASE NAME=MYINDAIA');
    Params.Add('SERVER NAME=INDAIA10');
    Params.Add('USER NAME=sa');
    Params.Add('PASSWORD=123');
    DatabaseName := 'MYINDAIA';
    AliasName    := 'MYINDAIA';
    DriverName   := 'MSSQL';
    LoginPrompt  := false;
    Connected    := true;


    with TQuery.Create(application) do begin
      DataBaseName := 'MYINDAIA';
      SQL.Clear;
      SQL.Add('SELECT NR_PROCESSO FROM TPROC_BORDERO WHERE NR_PROCESSO = ' +    QuotedStr(Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text)));
      Prepare;
      //ShowMessage(SQL.Text);
      Open;
      if not IsEmpty then //existe registro, realiza update
      begin
        Close;
        SQL.CLear;
        SQL.Add('UPDATE INDAIA10.MYINDAIA.DBO.TPROC_BORDERO ');
        SQL.Add('   SET TP_SITUACAO = ''1'', TP_STATUS   = ''0'', ');
        SQL.Add('       DT_ENVIADO = '  + QuotedStr(DateToStr(now) + ' ' + TimeToStr(now)));
        SQL.Add(' WHERE NR_PROCESSO = ' + QuotedStr(Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text)));
        //ShowMessage(SQL.Text);
        ExecSQl;
      end
      else //não existe, realiza insert
      begin
        Close;
        SQL.CLear;
        SQL.Add('INSERT INTO INDAIA10.MYINDAIA.DBO.TPROC_BORDERO ');
        SQL.Add('    VALUES(' + QuotedStr(Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text)) + ', ');
        SQL.Add('           ''1'',''0'', ');
        SQL.Add(QuotedStr(DateToStr(now) + ' ' + TimeToStr(now)) + ', ');
        SQL.Add('           NULL, NULL)');
        //ShowMessage(SQL.Text);
        ExecSQL;
      end;
      Close;
      Free;

    end;

    Connected := false;
    Close;
    Free;
  end;

  datm_main.db_broker.Connected := true;
{---fazer update na tabela do MyIndaia WEB com a data atual do envio-----FIM---}

{--- Limpar a pasta -----------------------------------------------------INI---}
  FindFirst('C:\ConvertImages\*.*', faAnyFile, SR);
  repeat
    if SR.Attr and faDirectory <> faDirectory then
      DeleteFile('C:\ConvertImages\' + SR.Name);
  until FindNext(SR) <> 0;
{--- Limpar a pasta -----------------------------------------------------FIM---}

  lblbarra.Visible := true;
  lblbarra.Caption := '';
  MessageBox(0, Pchar('O Processo ' + msk_nr_processo.Text + ' foi enviado com sucesso!'), 'MyIndaia', 0);
  btn_envio.Caption := 'Enviar';
  Application.ProcessMessages;
  msk_nr_processo.Clear;
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_upload_img.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 14) NR_PROCESSO_ABR, PR.CD_UNID_NEG, PR.CD_PRODUTO , EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE  PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND  PR.CD_UNID_NEG  = ' + QuotedStr(msk_cd_unid_neg.Text));
  vListAux.Add('  AND  PR.CD_PRODUTO   = ' + QuotedStr(msk_cd_produto.Text));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO_ABR', 'CD_UNID_NEG', 'CD_PRODUTO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Unidade', 'Produto', 'Cliente', 'Data de Abertura'],'NR_PROCESSO_ABR', nil);
  vListAux.Free;
end;

Function Tfrm_upload_img.EncontraNome(pArquivoOld: string): String;
var vImagem, vPagina, vTipo: String;
begin
  vImagem := Copy(pArquivoOld, 1, Pos('.', pArquivoOld) - 1);
  vPagina := Copy(pArquivoOld, Pos('.', pArquivoOld) + 1, 3);
  with frm_upload_img do
  begin
     with TQuery.Create(application) do
     begin

       //verifica o tipo do documento
       DatabaseName := 'DBCOMEX';
       Close;
       SQL.Add('SELECT COD_TIP FROM IMGPAG ');
       SQL.Add(' WHERE IMAGEM = ' + QuotedStr(vImagem));
       SQL.Add(' AND PAGINA   = ' + QuotedStr(vPagina));
       Prepare;
       Open;
       If not IsEmpty then vTipo := Fields[0].AsString
       else   vTipo := 'x';
       Free;

    end;
   //passa o nome do arquivo
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      SQL.Add('SELECT TX_ARQUIVO FROM TTP_DOCTO_COMEX ');
      SQL.Add(' WHERE CD_COMEX = ' + QuotedStr(vTipo));
      Prepare;
      Open;
      //passa o nome do Arquivo
      if vTipo = 'x' then Result := pArquivoOld
      else  Result := Fields[0].AsString + '.' + vPagina;
      Free;
    end;
  end;
end;

procedure Tfrm_upload_img.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');

end;

procedure Tfrm_upload_img.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  End
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_upload_img.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then
 begin
   if Sender = msk_cd_unid_neg               then btn_co_unid_negClick(btn_co_unid_neg)         else
   if Sender = msk_cd_produto                then btn_co_produtoClick(btn_co_produto)           else
   if Sender = msk_nr_processo               then btn_co_processoClick(btn_co_processo);
 end;
end;

procedure Tfrm_upload_img.msk_cd_produtoExit(Sender: TObject);
begin
  msk_cd_produto.text := Copy('00', 1, 2 - Length(msk_cd_produto.text)) + msk_cd_produto.text;
  edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
  if edt_nm_produto.Text = '' then
  begin
    MessageBox(0, 'Produto Inválido ou Inexistente!', 'MyIndaiá', 0);
  end;
end;

procedure Tfrm_upload_img.msk_cd_unid_negExit(Sender: TObject);
begin
  msk_cd_unid_neg.text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.text)) + msk_cd_unid_neg.text;
  edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
  if edt_nm_unid_neg.Text = '' then
  begin
    MessageBox(0, 'Unidade de Negociação Inválida ou Inexistente!', 'MyIndaiá', 0);
  end;
end;

procedure Tfrm_upload_img.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
     btn_envio.Enabled := true;
end;

procedure Tfrm_upload_img.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure Tfrm_upload_img.ppDetailBand1BeforePrint(Sender: TObject);
var
  BMP: TBitmap;
  JPG: TJPEGImage;
  FN: String;

  function ReadTiffIntoBitmap(Filename: String): TBitmap;
  var
    OpenTiff: PTIFF;
    FirstPageWidth,FirstPageHeight: Cardinal;
    FirstPageBitmap: TBitmap;

    procedure TIFFReadRGBAImageSwapRB(Width,Height: Cardinal; Memory: Pointer);
    {$IFDEF DELPHI_5}
    type
      PCardinal = ^Cardinal;
    {$ENDIF}
    var
      m: PCardinal;
      n: Cardinal;
      o: Cardinal;
    begin
      m:=Memory;
      for n:=0 to Width*Height-1 do
      begin
        o:=m^;
        m^:= (o and $FF00FF00) or                {G and A}
            ((o and $00FF0000) shr 16) or        {B}
            ((o and $000000FF) shl 16);          {R}
        Inc(m);
      end;
    end;

  begin
    OpenTiff:=TIFFOpen(Filename,'r');
    TIFFGetField(OpenTiff,TIFFTAG_IMAGEWIDTH,@FirstPageWidth);
    TIFFGetField(OpenTiff,TIFFTAG_IMAGELENGTH,@FirstPageHeight);
    FirstPageBitmap:=TBitmap.Create;
    FirstPageBitmap.PixelFormat:=pf32bit;
    FirstPageBitmap.Width:=FirstPageWidth;
    FirstPageBitmap.Height:=FirstPageHeight;
    TIFFReadRGBAImage(OpenTiff,FirstPageWidth,FirstPageHeight,
                 FirstPageBitmap.Scanline[FirstPageHeight-1],0);
    TIFFClose(OpenTiff);
    TIFFReadRGBAImageSwapRB(FirstPageWidth,FirstPageheight,
                 FirstPageBitmap.Scanline[FirstPageHeight-1]);
    Result:=FirstPageBitmap;
  end;


begin
  ForceDirectories('C:\ConvertImages\');
  FN := 'C:\ConvertImages\' + ExtractFileName(tblFigFileName.AsString);
  try
    if AnsiLowerCase(ExtractFileExt(tblFigFileName.AsString)) = '.tif' then
      BMP := ReadTiffIntoBitmap(tblFigFileName.AsString)
    else if AnsiLowerCase(ExtractFileExt(tblFigFileName.AsString)) = '.jpg' then
    begin
      BMP := TBitmap.Create;
      JPG := TJPEGImage.Create;
      JPG.LoadFromFile(tblFigFileName.AsString);
      BMP.Width  := JPG.Width;
      BMP.Height := JPG.Height;
      BMP.Canvas.Draw(0, 0, JPG);
      JPG.Free;
      BMP.PixelFormat := vQualidadeImagem;
    end
    else if AnsiLowerCase(ExtractFileExt(tblFigFileName.AsString)) = '.bmp' then
    begin
      BMP := TBitmap.Create;
      BMP.LoadFromFile(tblFigFileName.AsString);
      BMP.PixelFormat := vQualidadeImagem;
    end;
    BMP.SaveToFile('C:\Image' + IntToStr(Self.Handle) + '.bmp');
    ResizeImage('C:\Image' + IntToStr(Self.Handle) + '.bmp', 780);
    BMP.LoadFromFile('C:\Image' + IntToStr(Self.Handle) + '.bmp');
    ppImage1.Picture.Assign(BMP);
    DeleteFile('C:\Image' + IntToStr(Self.Handle) + '.bmp');
    BMP.Free;
  except
    ppImage1.Picture.Assign(nil);
  end;

end;

procedure Tfrm_upload_img.SmoothResize(Src, Dst: TBitmap);
var
  x, y: Integer;
  xP, yP: Integer;
  xP2, yP2: Integer;
  SrcLine1, SrcLine2: pRGBArray;
  t3: Integer;
  z, z2, iz2: Integer;
  DstLine: pRGBArray;
  DstGap: Integer;
  w1, w2, w3, w4: Integer;
begin
  Src.PixelFormat := pf24Bit;
  Dst.PixelFormat := pf24Bit;

  if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
    Dst.Assign(Src)
  else
  begin
    DstLine := Dst.ScanLine[0];
    DstGap  := Integer(Dst.ScanLine[1]) - Integer(DstLine);

    xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
    yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
    yP  := 0;

    for y := 0 to pred(Dst.Height) do
    begin
      xP := 0;

      SrcLine1 := Src.ScanLine[yP shr 16];

      if (yP shr 16 < pred(Src.Height)) then
        SrcLine2 := Src.ScanLine[succ(yP shr 16)]
      else
        SrcLine2 := Src.ScanLine[yP shr 16];

      z2  := succ(yP and $FFFF);
      iz2 := succ((not yp) and $FFFF);
      for x := 0 to pred(Dst.Width) do
      begin
        t3 := xP shr 16;
        z  := xP and $FFFF;
        w2 := MulDiv(z, iz2, $10000);
        w1 := iz2 - w2;
        w4 := MulDiv(z, z2, $10000);
        w3 := z2 - w4;
        DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 +
          SrcLine1[t3 + 1].rgbtRed * w2 +
          SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
        DstLine[x].rgbtGreen :=
          (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 +

          SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
        DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 +
          SrcLine1[t3 + 1].rgbtBlue * w2 +
          SrcLine2[t3].rgbtBlue * w3 +
          SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
        Inc(xP, xP2);
      end; {for}
      Inc(yP, yP2);
      DstLine := pRGBArray(Integer(DstLine) + DstGap);
    end; {for}
  end; {if}
end; {SmoothResize}

procedure Tfrm_upload_img.ResizeImage(FileName: string; MaxWidth: Integer);
var
  OldBitmap: TBitmap;
  NewBitmap: TBitmap;
  aWidth: Integer;
begin
  OldBitmap := TBitmap.Create;
  OldBitmap.LoadFromFile(FileName);
  try
//    if LoadJPEGPictureFile(OldBitmap, ExtractFilePath(FileName),
//      ExtractFileName(FileName)) then
    begin
      aWidth := OldBitmap.Width;
      if (OldBitmap.Width > MaxWidth) then
      begin
        aWidth    := MaxWidth;
        NewBitmap := TBitmap.Create;
        try
          NewBitmap.Width  := MaxWidth;
          NewBitmap.Height := MulDiv(MaxWidth, OldBitmap.Height, OldBitmap.Width);
          SmoothResize(OldBitmap, NewBitmap);
          RenameFile(FileName, ChangeFileExt(FileName, '.$$$'));
          NewBitmap.SaveToFile(FileName);
//          if SaveJPEGPictureFile(NewBitmap, ExtractFilePath(FileName),
//            ExtractFileName(FileName), 75) then
//            DeleteFile(ChangeFileExt(FileName, '.$$$'))
//          else
//            RenameFile(ChangeFileExt(FileName, '.$$$'), FileName);
        finally
          NewBitmap.Free;
        end; {try}
      end; {if}
    end; {if}
  finally
    OldBitmap.Free;
  end; {try}
end;

procedure Tfrm_upload_img.EnviaTiffs;
var
  i: Integer;
begin
{---copia imagens da Pasta de Origem (Work Image) para Destino (WEB) ----INI---}
  arquivos.Directory := vPathOrigem + vpastaOrigem + '\';
  QtdArquivos := arquivos.Count;
  SetLength(converter, Arquivos.Count);
  lblbarra.Caption := 'Copiando arquivos ...';
  Application.ProcessMessages;
  for i := 0 to QtdArquivos - 1 do
  begin
    vArquivoOld := arquivos.Directory + '\' + arquivos.Items.Strings[i];
    vArquivoNew := Trim(vPathDestino + vPastaDestino + '\' + EncontraNome(arquivos.Items.Strings[i]));
    if Copy(ExtractFileExt(arquivos.Items.Strings[i]), 2, 1)[1] in ['0','1','2','3','4','5','6','7','8','9'] then
    begin
      vArquivoNew := vArquivoNew + '.tif';
      CopyFile(Pchar(vArquivoOld),Pchar(vArquivoNew),false);
      Converter[i].texto := Copy(vArquivoNew, 1, Length(vArquivoNew) - 4); //tipo + sequencial(.001)
      converter[i].grupo := Copy(vArquivoNew, 1, Length(vArquivoNew) - 8); //sem sequencial (apenas tipo)
    end;
  end;
{---copia imagens da Pasta de Origem (Work Image) para Destino (WEB) ----FIM---}

{---(1) abre query com tipos de arquivos existentes----------------------INI---}
  vQryTpArquivo := TQuery.Create(application);
  with vQryTpArquivo do begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT TX_ARQUIVO FROM TTP_DOCTO_COMEX ');
    Prepare;
    Open;
    MostrarAviso := false;
    arquivosAux.Update;
    arquivosAux.Directory := vPathDestino + vPastaDestino + '\';
    QtdArquivosAux := arquivosAux.Count;
    Gauge1.MaxValue := vQryTpArquivo.RecordCount * QtdArquivosAux;

{---(1.1) para cada tipo de arquivo verifica se existe e cria PDF -------INI---}
    while not vQryTpArquivo.Eof do begin
      MostrarAviso := false;
      arquivosAux.Update;
      arquivosAux.Directory := vPathDestino + vPastaDestino + '\';


{---(1.1.1) se existir arquivos verifica se imagem é do grupo -----------INI---}
      if QtdArquivosAux <> 0 then begin
        lblbarra.Caption := 'Convertendo para PDF. Aguarde...';
        lblbarra.Font.Color := clWhite;
        Application.ProcessMessages;

{---(1.1.2) deleta dados da MemoryTable se existir ----------------------INI---}
        tblFig.Open;
        while not tblFig.Eof do begin
          tblFig.Delete;
          tblFig.Next;
        end;
        tblFig.Close;
        tblFig.Open;


{---(1.1.2) deleta dados da MemoryTable se existir ----------------------FIM---}

{---(1.1.3) verifica se é do grupo e lança no RBuilder ------------------INI---}
        for i := 0 to High(converter) do begin
          Gauge1.Progress := gauge1.Progress + 1;
          Application.ProcessMessages;
          if converter[i].grupo =  vPathDestino + vPastaDestino + '\' + vQryTpArquivo.Fields[0].AsString then begin
            try
              converter[i].ExisteErro := false;
              if FileExists(converter[i].texto + '.tif ') then begin
                //insere dados na tabela
                tblFig.Insert;
                tblFigFileName.AsString := converter[i].texto + '.tif';
                tblFig.Post;
              end else begin
                converter[i].ExisteErro := true;
                MostrarAviso := true;
              end;
            except
              converter[i].ExisteErro := true;
              MostrarAviso := true;
            end;
          end;
        end;
{---(1.1.3) verifica se é do grupo e lança no RBuilder ------------------FIM---}

      end;
{---(1.1.1) se existir arquivos verifica se imagem é do grupo -----------FIM---}
      if not tblFig.IsEmpty then begin
        tblFig.First;
        ppReport1.AllowPrintToArchive :=False;
        ppReport1.AllowPrintToFile :=True;
        ppReport1.ShowPrintDialog := False;
        ppReport1.ShowCancelDialog := False;
        ppReport1.DeviceType := 'PDFFile' ; //PDF;
        ppReport1.SaveAsTemplate := true;
        ppReport1.TextFileName :=   vPathDestino + vPastaDestino + '\' + vQryTpArquivo.Fields[0].AsString + '.pdf'; //traz apenas grupo
        ppReport1.Print;
      end;
      tblFig.Close;
      vQryTpArquivo.Next; //próximo grupo de arquivos
    end;
{---(1.1) para cada tipo de arquivo verifica se existe e cria PDF -------FIM---}
    Gauge1.Progress := 0;
    vQryTpArquivo.Free;
  end;
{---(1) abre query com tipos de arquivos existentes----------------------FIM---}


{---apaga arquivos tiff convertidos com sucesso--------------------------INI---}
  for i := 0 to Length(converter) - 1 do begin
    lblbarra.Caption := 'Excluindo arquivos Auxiliares ...';
    lblbarra.Font.Color := clNavy;
    Application.ProcessMessages;
    if not converter[i].ExisteErro then begin
      DeleteFile(converter[i].texto + '.tif.$$$');
      DeleteFile(converter[i].texto + '.tif.bmp');
      DeleteFile(converter[i].texto + '.tif');
    end;
  end;
{---apaga arquivos tiff convertidos com sucesso--------------------------FIM---}


{---se tem erro, avisa---------------------------------------------------INI---}
     if MostrarAviso then MessageBox(0, Pchar('As imagens deste processo não foram totalmente convertidas!' + chr(13) + 'Contate o suporte para ser realizado uma conversão manual!'), 'MyIndaiá', 0);
{---se tem erro, avisa---------------------------------------------------FIM---}
end;

procedure Tfrm_upload_img.EnviaImagens;
var
  I: Integer;
  FPai, TP: String;
begin
  lblbarra.Caption := 'Convertendo imagens anexadas. Aguarde...';
  lblbarra.Font.Color := clWhite;
  Application.ProcessMessages;
{---(1) Seleciona os arquivos de imagem ativos no banco -----------------INI---}
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)                                                         ');
    SQL.Add('           WHEN ''\'' THEN RTRIM(P.PATH_DIGITALIZACAO)                                                    ');
    SQL.Add('           ELSE RTRIM(P.PATH_DIGITALIZACAO) + ''\''                                                       ');
    SQL.Add('       END + TD.NR_PROCESSO + ''\'' + TD.NM_ARQUIVO AS NM_ARQUIVO,                                        ');
    SQL.Add('       TD.CD_TIPO_DOCTO,                                                                                  ');
    SQL.Add('       CASE ISNULL(TD.NM_ARQUIVO_PAI, '''')                                                               ');
    SQL.Add('           WHEN '''' THEN TD.NM_ARQUIVO                                                                   ');
    SQL.Add('           ELSE TD.NM_ARQUIVO_PAI                                                                         ');
    SQL.Add('       END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO                                                           ');
    SQL.Add('FROM TPROCESSO_DOCTOS TD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = TD.CD_TIPO_DOCTO,   ');
    SQL.Add('   TPARAMETROS P                                                                                          ');
    SQL.Add('WHERE TD.NR_PROCESSO = :NR_PROCESSO                                                                       ');
    SQL.Add('  AND IN_ATIVO       = ''1''                                                                              ');
    SQL.Add('  AND IN_ENVIA_WEB   = ''1''                                                                              ');
    SQL.Add('  AND RIGHT(TD.NM_ARQUIVO, 3) IN ' + _EXT_IMAGENS                                                          );
    SQL.Add('ORDER BY 3, 1                                                                                             ');
    ParamByName('NR_PROCESSO').AsString := Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
    Open;
    First;
    Gauge1.MaxValue := RecordCount;

{---(1.1) Percorre todos os arquivos selecionados -----------------------INI---}
    while not Eof do
    begin

{---(1.1.1) deleta dados da MemoryTable se existir ----------------------INI---}
        tblFig.Open;
        while not tblFig.Eof do begin
          tblFig.Delete;
          tblFig.Next;
        end;
        tblFig.Close;
        tblFig.Open;
{---(1.1.1) deleta dados da MemoryTable se existir ----------------------FIM---}

{---(1.1.2) Percorre todos os arquivos do mesmo pai ---------------------INI---}
      TP   := FieldByName('NM_TIPO_DOCTO').AsString;
      FPai := FieldByName('NM_ARQUIVO_PAI').AsString;
      repeat
        Gauge1.Progress := Gauge1.Progress +1;
        if FileExists(FieldByName('NM_ARQUIVO').AsString) then
        begin
          //insere dados na tabela
          tblFig.Insert;
          tblFigFileName.AsString := FieldByName('NM_ARQUIVO').AsString;
          tblFig.Post;
        end;
        Next;
      until (FPai <> FieldByName('NM_ARQUIVO_PAI').AsString) or Eof;
{---(1.1.2) Percorre todos os arquivos do mesmo pai ---------------------FIM---}

{---(1.1.1) se existir arquivos verifica se imagem é do grupo -----------FIM---}
      if not tblFig.IsEmpty then
      begin
        tblFig.First;
        ppReport1.AllowPrintToArchive :=False;
        ppReport1.AllowPrintToFile :=True;
        ppReport1.ShowPrintDialog := False;
        ppReport1.ShowCancelDialog := False;
        ppReport1.DeviceType := 'PDFFile' ; //PDF;
        ppReport1.SaveAsTemplate := true;
        I := 0;
        repeat
          Inc(I);
        until not FileExists(vPathDestino + vPastaDestino + '\' + TP + '_' + FormatFloat('00', I) + '.pdf');
        ppReport1.TextFileName := vPathDestino + vPastaDestino + '\' + TP + '_' + FormatFloat('00', I) + '.pdf';
        ppReport1.Print;
      end;
      tblFig.Close;
    end;
{---(1.1) Percorre todos os arquivo selecionados ------------------------FIM---}

    Close;
    Free;
  end;
  Gauge1.Progress := 0;
{--- Seleciona os arquivos de imagem ativos no banco --------------------FIM---}
end;

procedure Tfrm_upload_img.EnviaDemaisArquivos;
var
  I: Integer;
  FName, TP: String;
begin
  lblbarra.Caption := 'Copiando arquivos anexados. Aguarde...';
  lblbarra.Font.Color := clWhite;
  Application.ProcessMessages;
{---(1) Seleciona os arquivos de imagem ativos no banco -----------------INI---}
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)                                                             ');
    SQL.Add('           WHEN ''\'' THEN RTRIM(P.PATH_DIGITALIZACAO)                                                        ');
    SQL.Add('           ELSE RTRIM(P.PATH_DIGITALIZACAO) + ''\''                                                           ');
    SQL.Add('       END + TD.NR_PROCESSO + ''\'' + TD.NM_ARQUIVO AS NM_ARQUIVO,                                            ');
    SQL.Add('       TD.CD_TIPO_DOCTO,                                                                                      ');
    SQL.Add('       CASE ISNULL(TD.NM_ARQUIVO_PAI, '''')                                                                   ');
    SQL.Add('           WHEN '''' THEN TD.NM_ARQUIVO                                                                       ');
    SQL.Add('           ELSE TD.NM_ARQUIVO_PAI                                                                             ');
    SQL.Add('       END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO                                                               ');
    SQL.Add('FROM TPROCESSO_DOCTOS TD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = TD.CD_TIPO_DOCTO,       ');
    SQL.Add('   TPARAMETROS P                                                                                              ');
    SQL.Add('WHERE TD.NR_PROCESSO = :NR_PROCESSO                                                                           ');
    SQL.Add('  AND IN_ATIVO       = ''1''                                                                                  ');
    SQL.Add('  AND IN_ENVIA_WEB   = ''1''                                                                                  ');
    SQL.Add('  AND RIGHT(TD.NM_ARQUIVO, 3) NOT IN ' + _EXT_IMAGENS                                                          );
    SQL.Add('ORDER BY 3, 1                                                                                                 ');
    //ShowMessage(SQL.GetText);
    //Exit;
    ParamByName('NR_PROCESSO').AsString := Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
    Open;
    First;
    Gauge1.MaxValue := RecordCount;

{---(1.1) Percorre todos os arquivos selecionados -----------------------INI---}
    while not Eof do
    begin

{---(1.1.1) Copia o arquivo ---------------------------------------------INI---}
      TP := FieldByName('NM_TIPO_DOCTO').AsString;
      I := 0;
      repeat
        Inc(I);
      until not FileExists(vPathDestino + vPastaDestino + '\' + TP + '_' + FormatFloat('00', I) + ExtractFileExt(FieldByName('NM_ARQUIVO').AsString));
      if not CopyFile(PAnsiChar(FieldByName('NM_ARQUIVO').AsString),
         PAnsiChar(vPathDestino + vPastaDestino + '\' + TP + '_' + FormatFloat('00', I) + ExtractFileExt(FieldByName('NM_ARQUIVO').AsString)), False) then
      begin
        MessageDlg('Erro copiando o arquivo ''' + FieldByName('NM_ARQUIVO').AsString + '''.'#13'Tente novamente.', mtError, [mbOk], 0);
        Close;
        Free;
        Exit;
      end;
{---(1.1.1) Copia o arquivo ---------------------------------------------FIM---}

      Next;
    end;
{---(1.1) Percorre todos os arquivo selecionados ------------------------FIM---}

    Close;
    Free;
  end;
  Gauge1.Progress := 0;
{--- Seleciona os arquivos de imagem ativos no banco --------------------FIM---}
end;

end.
