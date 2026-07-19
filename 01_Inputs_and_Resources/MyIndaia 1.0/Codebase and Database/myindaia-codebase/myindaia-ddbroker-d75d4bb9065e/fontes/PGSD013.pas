unit PGSD013;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, Buttons, Grids, DBGrids,
  DBCtrls, DBCGrids, Menus, ToolEdit, DosLib, Printers, Funcoes,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_sda_emissao = class(TForm)
    Mensagem: TStatusBar;
    mi_menu: TMainMenu;
    mi_sair: TMenuItem;
    mi_emitir: TMenuItem;
    dbgrd_sda: TDBGrid;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    dbgrd_desp: TDBGrid;
    Shape1: TShape;
    Shape2: TShape;
    Panel5: TPanel;
    Shape3: TShape;
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_celula: TMaskEdit;
    edt_nm_celula: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_celula: TSpeedButton;
    msk_dt_final_base: TDateEdit;
    Label6: TLabel;
    msk_cd_produto: TMaskEdit;
    Label1: TLabel;
    edt_nm_produto: TEdit;
    lbl_mod_sda: TLabel;
    dblkpcbox_mod_sda: TDBLookupComboBox;
    btn_co_produto: TSpeedButton;
    lblCelula: TLabel;
    btn_sair: TSpeedButton;
    btn_emitir: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    lbl_pesquisa: TLabel;
    edt_chave: TEdit;
    lbl_ordem_pesquisa: TLabel;
    cb_ordem: TComboBox;
    cbValorValido: TCheckBox;
    btnCalcular: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    msk_dt_inicial_base: TDateEdit;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_emitirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_celulaEnter(Sender: TObject);
    procedure msk_cd_celulaExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure dbgrd_sdaDblClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure dbgrd_sdaKeyPress(Sender: TObject; var Key: Char);
    procedure msk_dt_final_baseEnter(Sender: TObject);
    procedure msk_dt_final_baseExit(Sender: TObject);
    procedure cbValorValidoClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure dbgrd_sdaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure msk_dt_inicial_baseEnter(Sender: TObject);
    procedure msk_dt_inicial_baseExit(Sender: TObject);

  private
    { Private declarations }
    lstSDA:TStringList;
    impressora : String;
    Pesquisa : String;
    cd_unid_neg, cd_produto, cd_celula : String[2];
    str_dt_final_base : String[10];
    str_dt_inicial_base : String[10];    
    a_str_indices : Array[0..0] Of String[60];
    str_cnpj_cpf, str_cr, str_imp, str_exp, str_fob_cif, {str_mn,}
    str_ref_cli, str_dt_ent, str_vl_tx_contr_social, str_nm_tx_contr_social, str_nr_di,
    str_nr_sd, str_veiculo,str_TipoDoc,str_guiaTipo,str_guiaDeclaracao, str_vl_sda : String;
    strPathDefault:String;
    procedure Atualiza_Tela_SDA;
    procedure GeraArquivoSDA;
    procedure geraXML(vIETIPODOC,
      vIEDOC, vIENOME, vIEENDERECO, vIECIDADE, vIEBAIRRO, vIECEP,
      vIEESTADO, vGUIATIPO, vGUIAREGISTRO, vGUIADECLARACAO,
      vGUIACONHECIMENTO, vGUIAREFERENCIA, vGUIACHEGADA, vGUIAVEICULO,
      vGUIALINHA1, vGUIALINHA2, vGUIALINHA3, vGUIAVALOR,
      vGUIABANCO: String);
    function retira_ponto_hifen_barra(texto: String): String;
    function geraArquivo : String;
  public
    { Public declarations }
  end;

var
  frm_sda_emissao: Tfrm_sda_emissao;
  Saida : String;
  Txt : TextFile;
  lstXML:TStringList;
implementation

uses PGGP001, PGGP017, GSMLIB, ConsOnLineEx, PGSD014, PGSM018, PGSM010, PGSM044;

{$R *.DFM}

procedure Tfrm_sda_emissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(lstSDA);
  with datm_sda_emissao do
  begin
    qry_processo_sda_.Close;
    cds_processo_sda_.close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_celula_.Close;
    qry_desp_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sda_emissao.msk_cd_unid_negExit(Sender: TObject);
begin
  if cd_unid_neg = Trim( msk_cd_unid_neg.Text ) then
    Exit;

  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_sda_emissao do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      if Trim( edt_nm_unid_neg.Text ) = '' then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end;
      qry_unid_neg_.Close;
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_emissao.msk_cd_produtoExit(Sender: TObject);
begin
  if cd_produto = Trim( msk_cd_produto.Text ) then
    Exit;

  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    with datm_sda_emissao do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      if Trim( edt_nm_produto.Text ) = '' then
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
        Exit;
      end;
      qry_produto_.Close;
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_emissao.FormShow(Sender: TObject);
begin
  a_str_indices[0] := 'NR_PROCESSO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;
  cb_ordem.ItemIndex := 0;

  msk_cd_unid_neg.text := str_cd_unid_neg;
  msk_cd_produto.text  := str_cd_produto;
  msk_dt_final_base.Date     := dt_server;
  msk_dt_inicial_base.Date   := dt_server - 30;

  //msk_cd_unid_negExit(nil);
  //msk_cd_produtoExit(nil);
  //msk_dt_baseExit(nil);

  with datm_sda_emissao do
  begin
    qry_usuario_.Close;
    qry_usuario_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
    if qry_usuario_.RecordCount > 0 then
    begin
      msk_cd_celula.Text := qry_usuario_.FieldByName('CD_CELULA').AsString;
      msk_cd_celulaExit( frm_celula );
    end;
    qry_usuario_.Close;

    qry_mod_sda_.Close;
    qry_mod_sda_.Prepare;
    qry_mod_sda_.Open;
  end;
  edt_chave.SetFocus;
  msk_cd_celula.Text := '';
  msk_dt_inicial_base.Text := '  /  /    ';
  msk_dt_final_base.Text := '  /  /    ';
  Atualiza_Tela_SDA;

  lstSDA:=TStringList.Create;
end;

procedure Tfrm_sda_emissao.FormCreate(Sender: TObject);
var
buff : PCHAR;
begin
  { Inicializa o Data Module Emissão de Guias de SDA}
  Application.CreateForm( Tdatm_sda_emissao, datm_sda_emissao );
  Shape3.brush.color := clPnlClaroBroker;
  Shape2.brush.color := clMenuBroker;
//  datm_sda_emissao.qry_processo_sda_.Filter:='soma >=50 ';
  datm_sda_emissao.cds_processo_sda_.Filter:='soma >=50 ';

  buff:= StrAlloc(500);
  if GetEnvironmentVariable('USERPROFILE', BUFF, 500) > 0 then
     strPathDefault:=string(buff)+'\Desktop\SDA';

  if not DirectoryExists(strPathDefault) then
     CreateDir(strPathDefault);  
end;

procedure Tfrm_sda_emissao.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sda_emissao Do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_emissao.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sda_emissao do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    With frm_produto Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_sda_emissao.btn_emitirClick(Sender: TObject);
var
  vOk:Boolean;
  arquivo : string;
begin
  with datm_sda_emissao do
  begin
    Mensagem.SimpleText := 'Consistindo SDA ...';
    { valida valor SDA(s) }
    vOk:=False;
    cds_processo_sda_.DisableControls;
    cds_processo_sda_.First;
    while Not ( cds_processo_sda_.EOF ) do
    begin
      if cds_Processo_sda_IN_EMITINDO.AsString='1' then
        vOk:=True;

      cds_processo_sda_.Next;
    end;
    cds_processo_sda_.EnableControls;

    if not vOK then
    begin
       ShowMessage('Nenhum registro foi selecionado!!!');
       exit;
    end;

    try
     {
      if msk_cd_unid_neg.text = '02' then
      begin
         arquivo := GeraArquivo;
        if arquivo <> '' then
          showmessage('Arquivo XML criado!!!!'+#13+arquivo);

        if MessageDLG('O Arquivo foi integrado corretamente ?',mtConfirmation,[mbYes,mbNo],0 )=mrYes then
        begin
          cds_processo_sda_.first;
          while not cds_processo_sda_.Eof do
          begin
            if    (datm_sda_emissao.cds_processo_sda_IN_EMITINDO.AsString='1')
              and (datm_sda_emissao.cds_Processo_sda_CD_USUARIO_EMITE.asstring = str_cd_usuario) then
            begin
              Cria_SQL( '  UPDATE TPROCESSO_SDA         '+
                        '  SET CD_STATUS         = "2"  '+
                        '    , IN_EMITE          = "0"  '+
                        '    , CD_USUARIO_EMITE  = ""   '+
                        '    , CD_USUARIO_CANCEL = ""   '+
                        '    , CD_EMISSOR        = ' + QuotedStr( str_cd_usuario ) +
                        '    , DT_CANCEL         = NULL ' +
                        '    , DT_EMISSAO        = CONVERT( datetime, ' + QuotedStr( FormatDateTime( FData, dt_server ) ) + ', 103 ) ' +
                        '  WHERE NR_PROCESSO = ' + QuotedStr( datm_sda_emissao.cds_Processo_sda_NR_PROCESSO.AsString ) );
            end;
            cds_processo_sda_.next;
          end;

          EnviaEmail('[MyIndaia] SDA´s gerados - lote: '+arquivo,
                     '<font face="Courrier New" Size="5pt">'+ lstSDA.Text+'</font>',
                     'marcelo.lima@myindaia.com.br');

          Mensagem.SimpleText := 'Dados Gravados!';
        end;
      end
      else
      begin }
        cds_processo_sda_.first;
        while not cds_processo_sda_.Eof do
        begin
          if    (datm_sda_emissao.cds_processo_sda_IN_EMITINDO.AsString='1')
            and (datm_sda_emissao.cds_Processo_sda_CD_USUARIO_EMITE.asstring = str_cd_usuario) then
          begin
            Cria_SQL( '  UPDATE TPROCESSO_SDA         '+
                      '  SET CD_STATUS         = "1"  '+
                      '    , IN_EMITE          = "1"  '+
                      '    , CD_USUARIO_EMITE  =  ' + QuotedStr( str_cd_usuario ) +
                      '    , DT_EMISSAO        = GETDATE() ' +
                      '  WHERE NR_PROCESSO = ' + QuotedStr( cds_Processo_sda_NR_PROCESSO.AsString ) );
          end;
          cds_processo_sda_.next;
        end;
        
        Mensagem.SimpleText := 'Dados Gravados...';
     // end;
    except on e:exception do
      Mensagem.SimpleText := e.message;
    end;

    cds_processo_sda_.Close;
    cds_processo_sda_.Open;
  end;
end;

function Tfrm_sda_emissao.GeraArquivo : String;
var
  strPath,strFile,vDespachanteCodigo,vDespachanteCPF :String;
begin
  with datm_sda_emissao do
  begin
  vDespachanteCodigo:= qry_desp_NR_REGISTRO.AsString;
  vDespachanteCPF   := retira_ponto_hifen_barra(qry_desp_CPF_DESPACHANTE.AsString);

  lstSDA.Clear;
  lstXML:=TStringList.Create;
  lstXML.Clear;
  lstXML.Add('<?xml version="1.0" encoding="iso-8859-1" ?>');
  lstXML.Add('<GRH>');
  lstXML.Add('    <DESPACHANTE>');
  lstXML.Add('        <DESPACHANTECODIGO>' + vDespachanteCodigo+ '</DESPACHANTECODIGO>');
  lstXML.Add('        <DESPACHANTECPF>'    + vDespachanteCPF + '</DESPACHANTECPF>');
  lstXML.Add('    </DESPACHANTE>');
  lstXML.Add('    <GRHs>');
  lstSDA.Add('DESPACHANTE: '+datm_sda_emissao.qry_desp_NM_DESPACHANTE.AsString);
  lstSDA.Add('---------------------------------------------------------------');

  cds_processo_sda_.First;
  while Not (cds_processo_sda_.EOF) do
  begin
    if cds_processo_sda_IN_EMITE.AsString = '1' then
    begin
      try

        qry_dados_sda_.Close;
        qry_dados_sda_.ParamByName('NR_PROCESSO').AsString := cds_processo_sda_NR_PROCESSO.AsString;
        qry_dados_sda_.Prepare;
        qry_dados_sda_.Open;

        GeraArquivoSDA;
        lstSda.Add('Processo: '+cds_processo_sda_NR_PROCESSO.AsString+'    '+datm_sda_emissao.cds_processo_sda_AP_EMPRESA.AsString)
      except
        Mensagem.SimpleText := 'Erro na geração do Arquivo!';
        cds_processo_sda_.Close;
        Exit
      end;
    end;
    cds_processo_sda_.Next;
  end;

  lstXML.Add('    </GRHs>');
  lstXML.Add('</GRH>');

  strFile:=trim(qry_desp_NR_REGISTRO.AsString)+'_'+FormatDateTime('YYYYMMDDHHNNSS',Now)+'.xml';
  strPath:=strPathDefault+'\'+strFile;

  lstXML.SaveToFile(strPath);

  result := strPath;
  end;
end;

procedure Tfrm_sda_emissao.GeraArquivoSDA;
begin
  with datm_sda_emissao do
  begin
    str_cr           := #13#10;
    {-------------------------------------}
    qry_ref_cli_.Close;
    qry_ref_cli_.ParamByName('NR_PROCESSO').AsString := cds_processo_sda_NR_PROCESSO.AsString;
    qry_ref_cli_.Prepare;
    qry_ref_cli_.Open;
    str_ref_cli := qry_ref_cli_CD_REFERENCIA.AsString;
    qry_ref_cli_.Close;
    {-------------------------------------}

    if msk_cd_produto.Text = '01' then      // Importacao
    begin
      str_guiaTipo:='I';
      qry_DI_.Close;
      qry_DI_.ParamByName('NR_PROCESSO').AsString := cds_processo_sda_NR_PROCESSO.AsString;
      qry_DI_.Prepare;
      qry_DI_.Open;

      if Not qry_di_.EOF then
      begin
        str_nr_di      := qry_di_NR_DECLARACAO_IMP.AsString;
        if Trim( str_nr_di )  <> '' then str_nr_di := Copy( str_nr_di, 1, 2 ) + '/'  + Copy( str_nr_di, 3, 7 ) + '-'  +
                                                      Copy( str_nr_di, 10, 1 );

        str_dt_ent     := qry_di_DT_CHEGADA_CARGA.AsString;
        if Trim( str_dt_ent ) <> '' then str_dt_ent := Copy( str_dt_ent, 1, 2 ) + '/' + Copy( str_dt_ent, 3, 2 ) + '/' +
                                                       Copy( str_dt_ent, 5, 4 );

        str_guiaDeclaracao:=str_nr_di;
      end;
      qry_DI_.Close;
    end
    else                                    // Exportacao
    begin
      str_guiaTipo:='E';
      qry_exp_proc_.Close;
      qry_exp_proc_.ParamByName('NR_PROCESSO').AsString := cds_processo_sda_NR_PROCESSO.AsString;
      qry_exp_proc_.Prepare;
      qry_exp_proc_.Open;
      if Not qry_exp_proc_.EOF then
      begin
        str_nr_sd := qry_exp_proc_NR_SD.AsString;
        str_nr_sd := Copy( str_nr_sd, 1, 10 ) + '-' + Copy( str_nr_sd, 11, 1 );
        str_guiaDeclaracao:=str_nr_sd;
        str_dt_ent:='';
      end;

      qry_exp_proc_.Close;
    end;
    {-------------------------------------}

    if qry_dados_sda_CD_TIPO_PESSOA.AsString = '1' then
    begin
       str_cnpj_cpf := qry_dados_sda_CGC_EMPRESA.AsString;
       str_TipoDoc:='CNPJ';
    end
    else
    begin
       str_cnpj_cpf := qry_dados_sda_CPF_EMPRESA.ASString;
       str_TipoDoc:='CPF';
    end;
    {-------------------------------------}

    if qry_dados_sda_CD_PRODUTO.AsString = '01' then
    begin
      str_fob_cif := 'CIF';
      str_imp     := 'X';
      str_exp     := ' ';
    end
    else
    begin
      str_fob_cif := 'FOB';
      str_imp     := ' ';
      str_exp     := 'X';
    end;
    {-------------------------------------}
//    str_mn        := 'R$';

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    if ( qry_param_VL_TX_CONTR_SOCIAL_SDA.AsFloat > 0 ) and ( qry_dados_sda_IN_COMP_SDA.AsString = '1' ) then
      str_nm_tx_contr_social := 'Compl. Cont. Social'
    else
      str_nm_tx_contr_social := '';
    {-------------------------------------}

    { para o layoutsda }
    if ( qry_param_VL_TX_CONTR_SOCIAL_SDA.AsFloat > 0 ) and ( qry_dados_sda_IN_COMP_SDA.AsString = '1' ) then
    begin
      str_vl_tx_contr_social := Space(51) + 'Compl. Cont. Social ' + Space(3) + FFloatToMsk ( '###,###,##0.00', qry_param_VL_TX_CONTR_SOCIAL_SDA.AsFloat ) + str_cr;
    end
    else
    begin
      str_vl_tx_contr_social := str_cr;
    end;

    {-------------------------------------}
    str_veiculo:='';
    if qry_dados_sda_CD_VIA_TRANSPORTE.AsString = '01' then //Marítima - Embarcação - Viagem
      str_veiculo := Trim( qry_dados_sda_NM_EMBARCACAO.AsString ) + ' ' + qry_dados_sda_NR_VIAGEM.AsString;

    if qry_dados_sda_CD_VIA_TRANSPORTE.AsString = '04' then //Aérea - Vôo
      str_veiculo := Trim( qry_dados_sda_NR_VOO.AsString );

    if qry_dados_sda_CD_VIA_TRANSPORTE.AsString = '07' then //Rodoviaria - Nome da Transportadora   - by carlos 16/03/2012
      str_veiculo := ConsultaLookUPSQL(' select ltrim(rtrim(isnull(NM_TRANSP_ROD,""))) NM_TRANSP_ROD '+
                                       '  from TTRANSP_ROD (NOLOCK) '+
                                       '  where CD_TRANSP_ROD = (select CD_TRANSP_NAC '+
                                       '                           from TPROCESSO '+
                                       '                          where NR_PROCESSO="'+cds_processo_sda_NR_PROCESSO.AsString+'")',
                                       'NM_TRANSP_ROD');

    {-------------------------------------}
    if qry_dados_sda_IN_COMP_SDA.AsString = '1' then
      str_vl_sda:=formatFloat('0.00',(cds_processo_sda_VL_SDA.AsFloat + cds_processo_sda_VL_CONTR_ASSIST.AsFloat + cds_processo_sda_VL_COMPL.AsFloat))
    else
      str_vl_sda:=formatFloat('0.00',(cds_processo_sda_VL_SDA .AsFloat + cds_processo_sda_VL_CONTR_ASSIST.AsFloat));

    {-------------------------------------}

    geraXML(
     str_TipoDoc
    ,str_cnpj_cpf
    ,StringReplace(datm_sda_emissao.qry_dados_sda_NM_EMPRESA.AsString,'&','e',[rfReplaceAll])
    ,qry_dados_sda_END_EMPRESA.AsString
    ,qry_dados_sda_END_CIDADE.AsString
    ,qry_dados_sda_END_BAIRRO.AsString
    ,qry_dados_sda_END_CEP.AsString
    ,qry_dados_sda_END_UF.AsString
    ,str_GuiaTipo
    ,Trim(Copy(cds_processo_sda_NR_PROCESSO.AsString,5,14))
    ,str_GuiaDeclaracao
    ,qry_dados_sda_NR_CONHECIMENTO.AsString
    ,str_ref_cli
    ,str_dt_ent
    ,str_veiculo
    ,''
    ,''
    ,''
    ,StringReplace(str_vl_sda,',','.',[])
    ,'001');
  end;
end;

procedure Tfrm_sda_emissao.geraXML(
  vIETIPODOC,vIEDOC,vIENOME,vIEENDERECO,vIECIDADE,vIEBAIRRO,vIECEP,vIEESTADO,
  vGUIATIPO,vGUIAREGISTRO,vGUIADECLARACAO,vGUIACONHECIMENTO,vGUIAREFERENCIA,vGUIACHEGADA,vGUIAVEICULO,
  vGUIALINHA1,vGUIALINHA2,vGUIALINHA3,vGUIAVALOR,vGUIABANCO:String);
begin
    lstXML.Add('<GRHDETALHES>');
    lstXML.Add('    <IETIPODOC>'        + vIETIPODOC                       +'</IETIPODOC>');
    lstXML.Add('    <IEDOC>'            + retira_ponto_hifen_barra(vIEDOC) +'</IEDOC>');
    lstXML.Add('    <IENOME>'           + copy(vIENOME,1,60)               +'</IENOME>');
    lstXML.Add('    <IEENDERECO>'       + copy(vIEENDERECO,1,60)           +'</IEENDERECO>');
    lstXML.Add('    <IECIDADE>'         + copy(vIECIDADE,1,30)             +'</IECIDADE>');
    lstXML.Add('    <IEBAIRRO>'         + copy(vIEBAIRRO,1,30)             +'</IEBAIRRO>');
    lstXML.Add('    <IECEP>'            + copy(vIECEP,1,8)                 +'</IECEP>');
    lstXML.Add('    <IEESTADO>'         + vIEESTADO                        +'</IEESTADO>');
    lstXML.Add('    <GUIATIPO>'         + vGUIATIPO                        +'</GUIATIPO>');
    lstXML.Add('    <GUIAREGISTRO>'     + copy(vGUIAREGISTRO,1,30)         +'</GUIAREGISTRO>');
    lstXML.Add('    <GUIADECLARACAO>'   + copy(vGUIADECLARACAO,1,30)       +'</GUIADECLARACAO>');
    lstXML.Add('    <GUIACONHECIMENTO>' + copy(vGUIACONHECIMENTO,1,30)     +'</GUIACONHECIMENTO>');
    lstXML.Add('    <GUIAREFERENCIA>'   + copy(vGUIAREFERENCIA,1,30)       +'</GUIAREFERENCIA>');
    lstXML.Add('    <GUIACHEGADA>'      + copy(vGUIACHEGADA,1,30)          +'</GUIACHEGADA>');
    lstXML.Add('    <GUIAVEICULO>'      + copy(vGUIAVEICULO,1,30)          +'</GUIAVEICULO>');
    lstXML.Add('    <GUIALINHA1>'       + copy(vGUIALINHA1,1,60)           +'</GUIALINHA1>');
    lstXML.Add('    <GUIALINHA2>'       + copy(vGUIALINHA2,1,60)           +'</GUIALINHA2>');
    lstXML.Add('    <GUIALINHA3>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA3>');
    lstXML.Add('    <GUIAVALOR>'        + vGUIAVALOR                       +'</GUIAVALOR>');
    lstXML.Add('    <GUIABANCO>'        + vGUIABANCO                       +'</GUIABANCO>');
    lstXML.Add('</GRHDETALHES>');
end;

procedure Tfrm_sda_emissao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sda_emissao.edt_chaveChange(Sender: TObject);
begin
  LocalizaCds( datm_sda_emissao.cds_processo_sda_,  msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_sda_emissao.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_sda_emissao.cds_processo_sda_NR_PROCESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';

  datm_sda_emissao.cds_processo_sda_.Close;
  datm_sda_emissao.cds_processo_sda_.Open;
  
  LocalizaCds(datm_sda_emissao.cds_processo_sda_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_sda_emissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_sda_emissao.msk_cd_celulaEnter(Sender: TObject);
begin
  cd_celula := Trim( msk_cd_celula.Text );
end;

procedure Tfrm_sda_emissao.msk_cd_celulaExit(Sender: TObject);
begin
  if cd_celula = Trim( msk_cd_celula.Text ) then
    Exit;

  if Trim( msk_cd_celula.Text ) <> '' then
  begin
    ValCodEdt(msk_cd_celula);
    with datm_sda_emissao do
    begin
      qry_celula_.Close;
      qry_celula_.ParamByName('CD_CELULA').AsString := msk_cd_celula.Text;
      qry_celula_.Prepare;
      qry_celula_.Open;
      edt_nm_celula.Text := qry_celula_.FieldByName('NM_CELULA').AsString;

      if Trim( edt_nm_celula.Text ) = '' then
      begin
        BoxMensagem( 'Célula incorreta ou inexistente!', 2 );
        msk_cd_celula.SetFocus;
        qry_celula_.Close;
        Exit;
      end;

      qry_celula_.Close;
    end;
  end
  else
  begin
    edt_nm_celula.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_emissao.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_celula   then btn_co_celulaClick(nil);
  end;
end;

procedure Tfrm_sda_emissao.btn_co_celulaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2218';

  Application.CreateForm( Tfrm_celula, frm_celula );
  with frm_celula do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_celula.Text := Cons_OnLine_Texto;
  end;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0901';

  msk_cd_celulaExit(nil);
end;

procedure Tfrm_sda_emissao.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := Trim( msk_cd_unid_neg.Text );
end;

procedure Tfrm_sda_emissao.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := Trim( msk_cd_produto.Text );
end;

procedure Tfrm_sda_emissao.Atualiza_Tela_SDA;
begin
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
  begin
    with datm_sda_emissao do
    begin
      cds_processo_sda_.Close;
      cds_processo_sda_.Params.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
      cds_processo_sda_.Params.ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
      cds_processo_sda_.Params.ParamByName('CD_CELULA').AsString      := msk_cd_celula.Text;
      cds_processo_sda_.Params.ParamByName('CD_DESPACHANTE').AsString := '000';
      cds_processo_sda_.Params.ParamByName('DT_INICIAL_DISTRIBUICAO').AsDate  := msk_dt_inicial_base.Date;
      cds_processo_sda_.Params.ParamByName('DT_FINAL_DISTRIBUICAO').AsDate  := msk_dt_final_base.Date;
      cds_processo_sda_.Open;

      qry_desp_.Close;
      qry_desp_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
      qry_desp_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_desp_.ParamByName('CD_CELULA').AsString     := msk_cd_celula.Text;
      qry_desp_.ParamByName('DT_INICIAL_DISTRIBUICAO').AsDate := msk_dt_inicial_base.Date;
      qry_desp_.ParamByName('DT_FINAL_DISTRIBUICAO').AsDate := msk_dt_final_base.Date;
      qry_desp_.Prepare;
      qry_desp_.Open;
    end;
  end;
end;

procedure Tfrm_sda_emissao.dbgrd_sdaDblClick(Sender: TObject);
var in_emite : String;
    nr_processo_sda  : String[18];
    cd_usuario_emite : String[4];
    cd_despachante   : String[3];
begin
  with datm_sda_emissao do
  begin
    in_emite         := '0';
    cd_usuario_emite := '';

    if not ( datm_sda_emissao.cds_processo_sda_.FieldByName('IN_EMITE').AsString = '1' ) then
    begin
      if cds_processo_sda_SOMA.Value >= 50 then
      begin
        in_emite         := '1';
        cd_usuario_emite := str_cd_usuario;
      end
      else
        Showmessage('Valor minimo permitido de SDA+CONTRIBUIÇÃO --> 50 reais ' );
    end
    else
    begin
//      se já esta gravado para emissao, da update logo.
      Cria_SQL( 'UPDATE TPROCESSO_SDA '+
                '  SET IN_EMITE     = ' + QuotedStr( in_emite ) +
                ', CD_USUARIO_EMITE = ' + QuotedStr( cd_usuario_emite ) +
                '  WHERE NR_PROCESSO = ' +
                QuotedStr( cds_processo_sda_.FieldByName('NR_PROCESSO').AsString ) );
    end;

    cds_Processo_sda_.edit;
    cds_Processo_sda_IN_EMITE.AsString := in_emite;
    if in_emite = '1' then
    begin
      cds_Processo_sda_CD_USUARIO_EMITE.asstring := str_cd_usuario;
      cds_Processo_sda_IN_EMITINDO.AsString      := '1';
    end
    else
    begin
      cds_Processo_sda_CD_USUARIO_EMITE.asstring := '';
      cds_Processo_sda_IN_EMITINDO.AsString      := '0';
    end;


    cds_Processo_sda_.post;

   { Cria_SQL( 'UPDATE TPROCESSO_SDA '+
              '  SET IN_EMITE     = ' + QuotedStr( in_emite ) +
              ', CD_USUARIO_EMITE = ' + QuotedStr( cd_usuario_emite ) +
              '  WHERE NR_PROCESSO = ' +
              QuotedStr( cds_processo_sda_.FieldByName('NR_PROCESSO').AsString ) );      }

    cd_despachante  := qry_desp_.FieldByName('CD_DESPACHANTE').AsString;
    nr_processo_sda := cds_processo_sda_.FieldByName('NR_PROCESSO').AsString;

   // Atualiza_Tela_SDA;
   // qry_desp_.Locate( 'CD_DESPACHANTE', cd_despachante, [] );
   // cds_processo_sda_.Locate( 'NR_PROCESSO', nr_processo_sda, [] );
  end;
end;

procedure Tfrm_sda_emissao.btn_marca_todasClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with datm_sda_emissao do
  begin
    btn_marca_todas.Visible    := False;
    btn_desmarca_todas.Visible := True;
    mi_desmarca.Visible        := True;
    mi_marca.Visible           := False;
    btn_desmarca_todas.Left    := btn_marca_todas.Left;

   { qry_atz_todos_.Close;
    qry_atz_todos_.ParamByName('CD_UNID_NEG').AsString      := msk_cd_unid_neg.Text;
    qry_atz_todos_.ParamByName('CD_PRODUTO').AsString       := msk_cd_produto.Text;
    qry_atz_todos_.ParamByName('CD_CELULA').AsString        := msk_cd_celula.Text;
    qry_atz_todos_.ParamByName('CD_DESPACHANTE').AsString   := datm_sda_emissao.qry_desp_CD_DESPACHANTE.AsString;
    qry_atz_todos_.ParamByName('CD_USUARIO_EMITE').AsString := str_cd_usuario;
    qry_atz_todos_.ParamByName('DT_DISTRIBUICAO').AsDate    := msk_dt_base.Date;
    qry_atz_todos_.ParamByName('IN_EMITE').AsString         := '1';
    qry_atz_todos_.Prepare;
    qry_atz_todos_.ExecSQL;    }

    cds_Processo_sda_.first;
    while not cds_Processo_sda_.eof do
    begin
      cds_Processo_sda_.edit;
      cds_Processo_sda_IN_EMITE.AsString    := '1';
      cds_Processo_sda_IN_EMITINDO.AsString := '1';
      cds_Processo_sda_CD_USUARIO_EMITE.asstring := str_cd_usuario;
      cds_Processo_sda_.post;

      cds_Processo_sda_.next;
    end;

   // Atualiza_Tela_SDA;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sda_emissao.btn_desmarca_todasClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with datm_sda_emissao do
  begin
    btn_marca_todas.Visible    := True;
    btn_desmarca_todas.Visible := False;
    mi_marca.Visible           := True;
    mi_desmarca.Visible        := False;

  {  qry_atz_todos_.Close;
    qry_atz_todos_.ParamByName('CD_UNID_NEG').AsString       := msk_cd_unid_neg.Text;
    qry_atz_todos_.ParamByName('CD_PRODUTO').AsString        := msk_cd_produto.Text;
    qry_atz_todos_.ParamByName('CD_CELULA').AsString         := msk_cd_celula.Text;
    qry_atz_todos_.ParamByName('CD_DESPACHANTE').AsString    := datm_sda_emissao.qry_desp_CD_DESPACHANTE.AsString;
    qry_atz_todos_.ParamByName('CD_USUARIO_EMITE').AsString  := '';
    qry_atz_todos_.ParamByName('DT_DISTRIBUICAO').AsDate     := msk_dt_base.Date;
    qry_atz_todos_.ParamByName('IN_EMITE').AsString          := '0';
    qry_atz_todos_.Prepare;
    qry_atz_todos_.ExecSQL;}

    cds_Processo_sda_.first;
    while not cds_Processo_sda_.eof do
    begin
      cds_Processo_sda_.edit;
      cds_Processo_sda_IN_EMITE.AsString         := '0';
      cds_Processo_sda_CD_USUARIO_EMITE.asstring := '';
      cds_Processo_sda_IN_EMITINDO.AsString      := '0';          
//      cds_processo_sda_CalcSelecao.AsString := '';
      cds_Processo_sda_.post;

      cds_Processo_sda_.next;
    end;

  //  Atualiza_Tela_SDA;

  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sda_emissao.dbgrd_sdaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    dbgrd_sdaDblClick(nil);
end;

procedure Tfrm_sda_emissao.msk_dt_final_baseEnter(Sender: TObject);
begin
  str_dt_final_base := Trim( msk_dt_final_base.Text );
end;

procedure Tfrm_sda_emissao.msk_dt_final_baseExit(Sender: TObject);
begin
  if str_dt_final_base = Trim( msk_dt_final_base.Text ) then
    Exit;

  Atualiza_Tela_SDA;
end;

function Tfrm_sda_emissao.retira_ponto_hifen_barra(texto:String):String;
begin
   result:= StringReplace(StringReplace(StringReplace(texto,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]),'/','',[rfReplaceAll]) ;
end;


procedure Tfrm_sda_emissao.cbValorValidoClick(Sender: TObject);
begin
  if cbValorValido.Checked then
     datm_sda_emissao.cds_processo_sda_.Filtered:=true
  else
     datm_sda_emissao.cds_processo_sda_.Filtered:=false;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_emissao.btnCalcularClick(Sender: TObject);
begin
  with datm_sda_emissao do
    if Trim(cds_processo_sda_NR_PROCESSO.AsString) <> '' then
    begin
      FastExecSQL('EXEC SP_CALCULA_SDA ''' + cds_processo_sda_NR_PROCESSO.AsString + '''');
      cds_processo_sda_.Close;
      cds_processo_sda_.Open;
    end;
end;

procedure Tfrm_sda_emissao.dbgrd_sdaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (datm_sda_emissao.cds_processo_sda_.FieldByName('LOCAL').asString = 'RECIFE') or
     (datm_sda_emissao.cds_processo_sda_.FieldByName('LOCAL').asString ='SALVADOR') then
  begin
    dbgrd_sda.Canvas.Brush.Color := $0080FFFF;//$00D6F0AE;
    dbgrd_sda.Canvas.Font.Color := clBlack;
  end;

  if (Column.FieldName = 'CalcSelecao') then
    if (Column.Field.asString = 'üü') then
      (Sender as TDBGrid).Canvas.Font.Color := clGreen
    else
      (Sender as TDBGrid).Canvas.Font.Color := $000080FF;

  if (Rect.Top = TStringGrid(dbgrd_sda).CellRect(0,TStringGrid(dbgrd_sda).Row).Top) or (gdSelected in State) then
  begin
    dbgrd_sda.Canvas.Brush.Color := $00FF9933;
  end;

   //dbgrd_sda.Canvas.FillRect(Rect);
   dbgrd_sda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_sda_emissao.msk_dt_inicial_baseEnter(Sender: TObject);
begin
  str_dt_inicial_base := Trim( msk_dt_inicial_base.Text );
end;

procedure Tfrm_sda_emissao.msk_dt_inicial_baseExit(Sender: TObject);
begin
  if str_dt_inicial_base = Trim( msk_dt_inicial_base.Text ) then
    Exit;

  Atualiza_Tela_SDA;
end;

end.
