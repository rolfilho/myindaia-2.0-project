{ Diagnóstico e Recuperação de DI
  Autor: Edvaldo de Andrade  }

unit PGDI040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, Menus, ExtCtrls, Funcoes, DbTables;

type
  Tfrm_di_rec_diag = class(TForm)
    gbox_monitor: TGroupBox;
    lbl_Capas: TLabel;
    Label4: TLabel;
    lbl_processos: TLabel;
    lbl_mensagem: TLabel;
    DBGSiscomexDI: TDBGrid;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_diag_DI: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    mi_menu: TMainMenu;
    mi_diag_di: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_diag_DIClick(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Pesquisa : String;
    a_str_indices : Array[0..2] Of String[60];

    procedure ConsultaDI;
    procedure GetDI;
    procedure AbreSiscomex;
    procedure AbreBroker;
    procedure FechaSiscomex;
    procedure FechaBroker;
  public
    { Public declarations }
    str_rec_diag : String[1]; { 1-Recuperação / 2-Diagnóstico }
    function Conv_Data( cData : String ) : String;
    function Conv_Valor( cNumero : String; nPosInt : Byte; nPosDec : Byte) : Double;
  end;

var
  frm_di_rec_diag: Tfrm_di_rec_diag;
  nProcesso, nAdicao, nItem : longint;
  cProcSCX, cProcBroker, cAdicao : String;
  cTipoDecla, cMoedaFrete, cMoedaSeguro : String;
  cCursor  : TCursor;

  nTA_DI_MNeg, nTD_DI_MNeg : Double;
  nTA_Ad_MN, nTD_Ad_MN : Double;
  nQtde_Ad, nTFob_Calc, nTPL_Calc : Double;
  nFre_Ad, nCIF_Ad, nFOB_Ad, nSeg_Ad : double;
  nAcr_Ad, nDed_Ad, nPL_Ad : Double;
  nFob_Item, nFob_unitario : Double;
  nPl_Item, nFre_Item,nSeg_Item : Double;
  nTA_Ad_MNeg, nTD_Ad_MNeg : Double;
  lCancelar : Boolean;

implementation

uses PGDI041, PGGP001, PGGP017, GSMLIB;

{$R *.DFM}

procedure Tfrm_di_rec_diag.btn_cancelarClick(Sender: TObject);
begin
  lbl_mensagem.Caption := 'Recuperação sendo abortada!!!';
  Application.ProcessMessages;

  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;

  btn_diag_di.Enabled  := True;
  mi_diag_di.Enabled   := True;

  btn_sair.Enabled     := True;
  mi_sair.Enabled      := True;

  lCancelar            := True;
end;

procedure Tfrm_di_rec_diag.FormShow(Sender: TObject);
begin
  with datm_di_rec_diag do
  begin
    lCancelar           := False;
    edt_chave.Text         := '';
    cCursor             := Screen.Cursor;
    Screen.Cursor       := crHourGlass;

    IMPORT.Connected    := True;

    QR_CapaDI.Close;
    QR_CapaDI.Prepare;
    QR_CapaDI.Open;

    btn_diag_di.Enabled := True;
    mi_diag_di.Enabled  := True;

    btn_sair.Enabled    := True;
    mi_sair.Enabled     := True;
    Screen.Cursor       := cCursor;

    if str_rec_diag = '1' then Caption := 'Recuperação de Declaração de Importação'
    else                       Caption := 'Diagnóstico de Declaração de Importação';

    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_di_rec_diag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_di_rec_diag do
  begin
//    qry_unid_neg_.Close;
//    qry_grupo_.Close;
//    qry_cliente_.Close;
    QR_CapaDI.Close;
    IMPORT.Connected := False;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_di_rec_diag.ConsultaDI;
//var
//  nLin : Integer;
begin
{
  with datm_di_rec_diag do
  begin
    lbl_mensagem.Caption := 'Consultando Processo ... ';

    if ( QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString <> '' ) then
    begin
      cProcBroker := QR_CapaDI.FieldByName('NR_IDENT_USUARIO').AsString;
      if qry_di_.Locate('CA1901',cProcBroker,[loPartialKey] ) then
      begin
        qry_di_.Edit;
        qry_di_.FieldByName('NR_DECLARACAO_IMP').AsString := QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString;
        if QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString <> '' then
        begin
          qry_di_.FieldByName('DT_TRANSMISSAO').AsString := QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString;
        end;
        qry_di_.FieldByName('NR_DECL_IMP_PROT').AsString := QR_CapaDI.FieldByName('NR_DECL_IMP_PROT').AsString;
        qry_di_.FieldByName('CA19236').AsString := 'T';
        qry_di_.FieldByName('CA19238').AsString := ' '; //Maquina Siscomex
        if QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString <> '' then
        begin
          qry_di_.FieldByName('CD19239').AsString := Conv_Data(datm_di_rec_diag.QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString);
        end;
        qry_di_.Post;
      end;

      if qry_di_.FieldByName('CA1901').AsString = afl002.FieldByName('CA0201').AsString then
      begin
        afl002.Edit;
        afl002.FieldByName('CA0205').AsString := qry_di_.FieldByName('CA1933').AsString;
        afl002.FieldByName('CD0206').AsString := qry_di_.FieldByName('CD1934').AsString;
        afl002.FieldByName('CA0207').AsString := qry_di_.FieldByName('CA19237').AsString;
        afl002.FieldByName('CD0208').AsString := qry_di_.FieldByName('CD19239').AsString;
        afl002.FieldByName('CA0204').AsString := 'T';
        afl002.Post;
      end;

      if datm_di_rec_diag.afl016.Locate('CA1601',cProcBroker,[loPartialKey] ) then
      begin
        while Not ( afl016.Eof ) and ( afl016.FieldByName('CA1601').AsString =
          QR_CapaDI.FieldByName('NR_IDENT_USUARIO').AsString ) do
        begin
          afl016.Delete;
        end;
      end;
    end
    else
    begin
      cProcBroker := QR_CapaDI.FieldByName('NR_IDENT_USUARIO').AsString;
      if qry_di_.Locate('CA1901',cProcBroker,[loPartialKey] ) then
      begin
        qry_di_.Edit;
        qry_di_.FieldByName('CA19237').AsString := QR_CapaDI.FieldByName('NR_DECL_IMP_PROT').AsString;
        if QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString <> '' then
        begin
          qry_di_.FieldByName('CD19239').AsString := Conv_Data( QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString );
        end;
        QR_Diag_DI.Close;
        QR_Diag_DI.Sql[0] := 'SELECT * FROM DIAGNÓSTICO_ERROS WHERE NR_DECL_IMP_PROT = "'+
        QR_CapaDI.FieldByName('NR_DECL_IMP_PROT').AsString + '" ';
        QR_Diag_DI.Open;

        if QR_Diag_DI.RecordCount > 0 then
        begin
          nLin := 1;
          frmErrosDiag.SGErros.RowCount := QR_Diag_DI.RecordCount + 2;
          frmErrosDiag.SGErros.Cells[0,0] := 'Processo';
          frmErrosDiag.SGErros.Cells[1,0] := 'Adição';
          frmErrosDiag.SGErros.Cells[2,0] := 'Mensagem';
          while not QR_Diag_DI.EOF do
          begin
            afl016.Edit;
            afl016.FieldByName('CA1601').AsString := qry_di_.FieldByName('CA1901').AsString ;
            afl016.FieldByName('CA1602').AsString := QR_CapaDI.FieldByName('NR_OP_IMP_MICRO').AsString;
            afl016.FieldByName('CA1603').AsString := QR_CapaDI.FieldByName('TX_MENSAGEM_ERRO').AsString;
            afl016.Post;

            frmErrosDiag.SGErros.Cells[0,nLin] := cProcBroker ;
            frmErrosDiag.SGErros.Cells[1,nLin] := afl016.FieldByName('CA1602').AsString;
            frmErrosDiag.SGErros.Cells[2,nLin] := afl016.FieldByName('CA1603').AsString;

            inc(nLin);

            QR_Diag_DI.Next;
          end;
          qry_di_.FieldByName('CA19236').AsString := 'E';
        end
        else
        begin
          qry_di_.FieldByName('CA19236').AsString := 'N'; // Não Obteve resposta da Transmissão
        end;
        qry_di_.Post;
      end;
    end;

    inc(nProcesso);
    lbl_processos.Caption := IntToStr(nProcesso);
  end;
  }
end;

procedure Tfrm_di_rec_diag.GetDI;
begin
  with datm_di_rec_diag do
  begin
    lbl_mensagem.caption := 'Recuperando Capa Declaração ... ';
    Application.ProcessMessages;

    cProcBroker := Trim(QR_CapaDI.FieldByName('calcNR_IDENT_USUARIO').AsString);
    cProcSCX    := QR_CapaDI.FieldByName('NR_DECL_IMP_MICRO').AsString;

    qry_di_.Close;
    qry_di_.ParamByName('NR_PROCESSO').AsString := cProcBroker;
    qry_di_.Prepare;
    qry_di_.Open;
    if Not qry_di_.EOF then
    begin
      qry_di_.Edit;
      if cProcSCX <> '' then
      begin
        qry_di_.FieldByName('NR_PROCESSO_SISCOMEX').AsString := cProcSCX;
      end;

      if QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString <> '' then
      begin
        qry_di_.FieldByName('NR_DECLARACAO_IMP').AsString := QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString :=  cProcBroker;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if Not qry_processo_.EOF then
        begin
          { atualiza NR. DA apenas se for processo IE - kleber guedes 24/01/2006 }
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            CLose;
            //SQL.Add('SELECT CD_TIPO_DECLARACAO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = ' +  QuotedStr(QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString));
            // Comentado acima e utilizando abaixo para utilizar o número do processo. Pois nesse momento ainda não se tem o número da declaração na DI para o filtro acima - Michel - 05/10/2010
            SQL.Add('SELECT CD_TIPO_DECLARACAO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = ' +  QuotedStr(cProcBroker));
            Prepare;
            Open;
            if Fields[0].AsString = '02' then //tipo da declaração (processo IE)
              Cria_SQL( 'UPDATE TPROCESSO SET NR_DI = ' + QuotedStr( QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString ) +
                        ', NR_DA = ' + QuotedStr( QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString ) +
                        ' WHERE NR_PROCESSO = ' + QuotedStr( cProcBroker ) )
            else
              Cria_SQL( 'UPDATE TPROCESSO SET NR_DI = ' + QuotedStr( QR_CapaDI.FieldByName('NR_DECLARACAO_IMP').AsString ) +
                        ' WHERE NR_PROCESSO = ' + QuotedStr( cProcBroker ) );

            Free;
          end;

          if QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString <> '' then
          begin
            CloseStoredProc(sp_atz_evento);
            sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := cProcBroker;
            sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_REG_DI';
            sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( Copy( QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString, 1, 2 ) + '/' +
                                                                                 Copy( QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString, 3, 2 ) + '/' +
                                                                                 Copy( QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString, 5, 4 ) );
            ExecStoredProc(sp_atz_evento);
            CloseStoredProc(sp_atz_evento);
          end;

          {Distribui S.D.A. Automaticamente}
          qry_cliente_servico_.Close;
          qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := qry_processo_.FieldByName('CD_UNID_NEG').AsString;
          qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := qry_processo_.FieldByName('CD_PRODUTO').AsString;
          qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := qry_processo_.FieldByName('CD_CLIENTE').AsString;
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := qry_processo_.FieldByName('CD_SERVICO').AsString;
          qry_cliente_servico_.Prepare;
          qry_cliente_servico_.Open;
          if qry_cliente_servico_.RecordCount > 0 then
          begin
            if qry_cliente_servico_.FieldByName('IN_INCIDE_SDA').AsString = '1' then
            begin
              Cria_SQL( 'UPDATE TPROCESSO_SDA SET IN_DISTR = "1", CD_USUARIO_DISTR = ' + QuotedStr( str_cd_usuario ) +
                        ' WHERE NR_PROCESSO = ' + QuotedStr( cProcBroker ) );

              CloseStoredProc(sp_distribui_sda);
              sp_distribui_sda.ParamByName('@cd_unid_neg').AsString := qry_processo_.FieldByName('CD_UNID_NEG').AsString;
              sp_distribui_sda.ParamByName('@cd_produto').AsString  := qry_processo_.FieldByName('CD_PRODUTO').AsString;
              sp_distribui_sda.ParamByName('@cd_usuario').AsString  := str_cd_usuario;
              ExecStoredProc(sp_distribui_sda);
              CloseStoredProc(sp_distribui_sda);
            end;
          end;
        end;
        qry_cliente_servico_.Close;
        qry_processo_.Close;
      end;
      if QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString <> '' then
      begin
        qry_di_.FieldByName('DT_REGISTRO_DI').AsString := QR_CapaDI.FieldByName('DT_REGISTRO_DI').AsString;
      end;
      if QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString <> '' then
      begin
         qry_di_.FieldByName('DT_TRANSMISSAO').AsString := QR_CapaDI.FieldByName('DT_TRANSMISSAO').AsString;
      end;
      if QR_CapaDI.FieldByName('NR_DECL_IMP_PROT').AsString <> '' then
      begin
        qry_di_.FieldByName('NR_DECL_IMP_PROT').AsString := QR_CapaDI.FieldByName('NR_DECL_IMP_PROT').AsString;
      end;
    end;

    if lCancelar then
    begin
      qry_di_.Cancel;
      Exit;
    end;
    qry_di_.Post;
    qry_di_.Close;

    CloseStoredProc(sp_di_distribui_deb_com);
    sp_di_distribui_deb_com.ParamByName('@nr_processo').AsString := cProcBroker;
    ExecStoredProc(sp_di_distribui_deb_com);
    if sp_di_distribui_deb_com.ParamByName('Result').AsInteger = 1 then
      BoxMensagem( 'Tributos não incluídos no financeiro - INFORME AO SETOR FINANCEIRO!', 2 );
    CloseStoredProc(sp_di_distribui_deb_com);

    Inc(nProcesso);
    lbl_processos.Caption := IntToStr(nProcesso);
  end;
end;

function Tfrm_di_rec_diag.Conv_Valor( cNumero : String; nPosInt : Byte; nPosDec : Byte) : Double;
begin
  Conv_Valor := StrToFloat( Copy(cNumero, 1, nPosInt - nPosDec ) + ',' + Copy( cNumero, nPosInt - nPosDec + 1, nPosDec ) );
end;

function Tfrm_di_rec_diag.Conv_Data(cData : String) : String;
var
  cDia : String;
  cMes : String;
  cAno : String;
begin
  if Pos('/',cData) = 0 then
  begin
    cDia := Copy(cData, 1, 2);
    cMes := Copy(cData, 3, 2);
    cAno := Copy(cData, 5, 4);
    Conv_Data := cDia + '/' + cMes + '/' + cAno;
  end
  else
  begin
    Conv_Data := cData;
  end;
end;

{ tabelas do siscomex }
procedure Tfrm_di_rec_diag.AbreSiscomex;
begin
  Application.ProcessMessages;
  if str_rec_diag = '2' then
  begin { Diagnóstico DI }
    {Abrir Tabelas de Diagnóstico}
  end;
end;

procedure Tfrm_di_rec_diag.FechaSiscomex;
begin
  Application.ProcessMessages;
  datm_di_rec_diag.QR_Diag_DI.Active := false;
  if str_rec_diag = '2' then
  begin
    {Fechar Tabelas de Diagnóstico}
  end;
end;

{ tabelas do DDBroker }
procedure Tfrm_di_rec_diag.AbreBroker;
begin
  Application.ProcessMessages;
  if str_rec_diag = '2' then
  begin
    {Abrir Tabelas de Diagnóstico}
  end;
end;

procedure Tfrm_di_rec_diag.FechaBroker;
begin
  Application.ProcessMessages;
  if str_rec_diag = '2' then
  begin
    {Fechar Tabelas de Diagnóstico}
  end;
end;

procedure Tfrm_di_rec_diag.FormCreate(Sender: TObject);
begin
  a_str_indices[0] := 'calcNR_IDENT_USUARIO';
  a_str_indices[1] := 'NR_DECLARACAO_IMP';
  a_str_indices[2] := 'NR_DECL_IMP_PROT';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Nº D.I.');
    Items.Add('Nº Transmissão');
    ItemIndex := 0;
  end;
  cb_ordem.ItemIndex := 0;

 { Inicializa o Data Module para Diagnóstico de DI}
  Application.CreateForm( Tdatm_di_rec_diag, datm_di_rec_diag );
end;

procedure Tfrm_di_rec_diag.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_di_rec_diag.btn_diag_DIClick(Sender: TObject);
var
  i : integer;
begin
  lCancelar := False;
  nProcesso := 0;
  nAdicao   := 0;
  nItem     := 0;

  if DBGSiscomexDI.SelectedRows.Count = 0 then
  begin
    BoxMensagem( 'Nenhum processo selecionado!', 2 );
    Exit;
  end;
  try
    btn_diag_di.Enabled  := False;
    mi_diag_di.Enabled   := False;

    btn_sair.Enabled     := False;
    mi_sair.Enabled      := False;

    edt_chave.Enabled    := False;

    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;

    datm_main.db_broker.StartTransaction;

    {abertura das tabelas Import SISCOMEX}
    lbl_processos.Caption := IntToStr(nProcesso);
    lbl_mensagem.Caption  := 'Acessando Tabelas Siscomex ... ';
    AbreSiscomex;
    lbl_mensagem.Caption  := 'Acessando Tabelas DDBroker ... ';
    AbreBroker;
    for i := 0 to DBGSiscomexDI.SelectedRows.Count - 1 do
    begin
      if lCancelar then break;

      DBGSiscomexDI.DataSource.DataSet.GotoBookmark(TBookmark(DBGSiscomexDI.SelectedRows[i]));
      if str_rec_diag = '1' then
      begin
        GetDI;
      end
      else
      begin
        ConsultaDI;
      end;
      Application.ProcessMessages;
    end;
    lbl_mensagem.Caption := 'Fechando Tabelas Siscomex ... ';
    FechaSiscomex;
    lbl_mensagem.Caption := 'Fechando Tabelas DDBroker ... ';
    FechaBroker;
    btn_diag_di.Enabled  := True;
    mi_diag_di.Enabled   := True;
    btn_sair.Enabled     := True;
    mi_sair.Enabled      := True;

    btn_cancelar.Enabled := True;
    mi_cancelar.Enabled  := True;

    if lCancelar then
    begin
      lbl_mensagem.Caption:= 'Recuperação abortada! Aguardando Instrução...';
    end
    else
    begin
      lbl_mensagem.caption := 'Aguardando Instrução... ';
    end;
    edt_chave.Enabled := True;
    datm_main.db_broker.Commit;

  except
    on E: Exception do
    begin
      btn_cancelarClick(nil);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_di_rec_diag.cb_ordemChange(Sender: TObject);
begin
  Pesquisa := datm_di_rec_diag.QR_CapaDI.FieldByName('calcNR_IDENT_USUARIO').AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_di_rec_diag.QR_CapaDI.Close;
  datm_di_rec_diag.QR_CapaDI.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_di_rec_diag.QR_CapaDI.Prepare;
  datm_di_rec_diag.QR_CapaDI.Open;
  Localiza( datm_di_rec_diag.QR_CapaDI, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_di_rec_diag.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_di_rec_diag.QR_CapaDI, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_di_rec_diag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

end.
