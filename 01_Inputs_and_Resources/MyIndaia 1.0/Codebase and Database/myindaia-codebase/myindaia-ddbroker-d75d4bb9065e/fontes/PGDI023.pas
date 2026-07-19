unit PGDI023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Mask, DBTables, DBCtrls, DB, ShellApi,
  ComCtrls, Menus, Clipbrd, StrUtils, Funcoes, UCRPE32, MSHTML,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type

  Tdados_emissao_icms = record
   NR_PROCESSO        : string;
   NM_EMPRESA         : string;
   CGC                : string;
   IE                 : string;
   IN_IE              : Integer;
   ENDERECO           : string;
   BAIRRO             : string;
   CIDADE             : string;
   IBGE_CIDADE        : string;
   COD_TOM_PR         : string;
   UF                 : string;
   CEP                : string;
   TELEFONE           : string;
   NR_DI              : Integer;
   DT_REGISTRO_DI     : TDateTime;
   REF_CLIENTE        : string;
   VL_FISCAL          : Double;
   VL_ICMS_AFRMM      : Double;
   PC_ICMS            : Double;
   II                 : Double;
   IPI                : Double;
   AD                 : Double;
   MCV                : Double;
   VL_FRETE           : Double;
   VL_SEGURO          : Double;
   PIS                : Double;
   COFINS             : Double;
   TX_SISCOMEX        : Double;
   VL_BASE_CALC_ICMS  : Double;
   VL_AFRMM_ITEM      : Double;
   VL_FECP            : Double;
   VL_TOTAL           : Double;
   OBS                : WideString;
  end;

  Tfrm_icms_online = class(TForm)
    Panel1: TPanel;
    PnlBotoes: TPanel;
    btn_sair: TBitBtn;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Label4: TLabel;
    combo_tipo_icms: TComboBox;
    edt_chave: TEdit;
    Label6: TLabel;
    pnl_desp: TPanel;
    Label5: TLabel;
    btn_co_desp: TSpeedButton;
    msk_cd_desp: TMaskEdit;
    msk_nm_desp: TEdit;
    lbl_data_venc: TLabel;
    lbl_data_base: TLabel;
    msk_data_base: TDateTimePicker;
    msk_vencimento: TDateTimePicker;
    mi_icms: TMainMenu;
    mi_imprimir: TMenuItem;
    mi_sair: TMenuItem;
    NB: TNotebook;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dbgrd_icms: TDBGrid;
    pnl_hint: TPanel;
    shp_hint: TShape;
    lbl_hint: TLabel;
    lbl_emitidos: TLabel;
    btn_encolhe: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    crp_darj: TCRPE;
    BtnGerar: TBitBtn;
    PopupGerar: TPopupMenu;
    mnuICMSImportacao: TMenuItem;
    mnuFundodeCombate: TMenuItem;
    btn_Imprimir: TSpeedButton;
    ckbInSemAdicao: TCheckBox;
    procedure btn_encolheClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure combo_tipo_icmsExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_data_baseExit(Sender: TObject);
    procedure dbgrd_icmsDblClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_despClick(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_despExit(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure mnuICMSImportacaoClick(Sender: TObject);
    procedure mnuFundodeCombateClick(Sender: TObject);
    procedure ckbInSemAdicaoClick(Sender: TObject);
  private
    { Private declarations }
    lAbertura : Boolean;
    TAB_MAIN : TQuery;
    FClosing: Boolean;
    procedure ExecICMSOnLine(pProcesso: string);
    function RetScriptOutrasUFs: TStringList;
    function VerificaMarinhaMercante(pNr_processo: string): Boolean;
    function VerificaInscEstadualCnpj(pCd_Empresa : string) : Boolean;
    function GetTributacao: integer;
    function GetObs: WideString;
    function ValidaSiteIcmsOutrasUfs: Boolean;
    function FormataCNPJ(pCNPJ: String): String;
    function FormataCEP(pCEP: String): String;
    function PegaValorArmazenagem: Double;
    procedure AtualizaICMS_Dados_Emissao_Icms(ValorArmazenagem: Double);
    procedure GetDadosEmissaoIcms;
    procedure EmiteIcmsSP;
    procedure EmiteIcmsOutrasUFs;
    procedure EmiteIcmsPR;
    procedure EmiteIcmsBA;
    procedure EmiteIcmsSC;
    procedure PreparaTab_Main;
    procedure GeraDARJ(const pTipo : string);
    procedure DoOnWebDocumentDARJ_GNRE_RJ(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant); //RJ
    procedure DoOnWebDocumentDARJ_GNRE_OutrasUFs(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant); //PE e demais estados do site
    procedure DoOnWebDocumentDARJ_GNRE_PR(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant); //PR
    procedure DoOnWebDocumentDARJ_GNRE_BA(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant); //BA
    procedure DoOnWebDocumentDARJ_GNRE_SC(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant); //SC
    procedure DoAfterExecuteScriptICMS(Sender: TObject; const pDisp: IDispatch; const URL: OleVariant; //SP
       var Language: String; var Script: String);
    procedure DoExecTimmerAux_BA(Sender: TObject);
    procedure DoExecTimmerAux_OutrasUFs(Sender: TObject);
    procedure AguardaCarregar(seg: Integer = 1);
    procedure GeraArqDadosIcms(uf_icms: String);
    procedure AguardaImpressaoIcmsChromium;
    function usuarioLogado: String;
    procedure VerificaSeAtualizaValores(uf_icms: String);
  public
    str_cd_unid_oscila : String[2];
    procedure Atualiza_Tela_ICMS;
    procedure GeraArquivoParametros(pTipo, pVencto, pProcesso : String);
    procedure VerificaImpressao(pProcesso: String);
  end;

  procedure BlockInput(ABlockInput : boolean); stdcall; external 'USER32.DLL';

var
  frm_icms_online: Tfrm_icms_online;
  Dados_Emissao_Icms: Tdados_emissao_icms;
  PaginaNaoCarregada: Boolean;

implementation

{$R *.DFM}
                                                       
uses PGDI024, PGSM046, PGGP001, GSMLIB, PGSM018, PGSM044, PGGP017, ConsOnLineEx, uWebModulo,
  OleCtrls, SHDocVw;

procedure Tfrm_icms_online.btn_encolheClick(Sender: TObject);
begin
  if pnl_hint.Width = 400 then
  begin
    btn_encolhe.Left     := 0;
    btn_encolhe.Caption  := '>>';
    pnl_hint.Width       := 20;
    shp_hint.Visible     := False;
    lbl_hint.Visible     := False;
    lbl_emitidos.Visible := False;
  end
  else
  begin
    btn_encolhe.Left     := 377;
    btn_encolhe.Caption  := '<<';
    pnl_hint.Width       := 400;
    shp_hint.Visible     := True;
    lbl_hint.Visible     := True;
    lbl_emitidos.Visible := True;
  end;
end;

procedure Tfrm_icms_online.Atualiza_Tela_ICMS;
var
  vDtBase : String;
  i : Integer;
begin
  for i := 1 to Length( FormatDateTime( FData, msk_data_base.Date ) ) do
    if Copy( FormatDateTime( FData, msk_data_base.Date ), i, 1 ) <> '/' then
      vDtBase := vDtBase + Copy( FormatDateTime( FData, msk_data_base.Date ), i, 1 );
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( msk_data_base.Date <> 0 ) then
  begin
    if combo_tipo_icms.ItemIndex = 3 then
    begin
      with datm_icms_online do
      begin
        qry_processos_cat63_exoneracao_.Close;
        qry_processos_cat63_exoneracao_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
        qry_processos_cat63_exoneracao_.ParamByName('DT_BASE').AsString      := vDtBase;
        //if qry_processos_cat63_exoneracao_.SQL[qry_processos_cat63_exoneracao_.SQL.Count-1] = 'AND D.IN_EXON_IMPRESSO = ''1''' then
        //  qry_processos_cat63_exoneracao_.SQL.Delete(qry_processos_cat63_exoneracao_.SQL.Count-1);
        qry_processos_cat63_exoneracao_.Prepare;
        qry_processos_cat63_exoneracao_.Open;

        qry_processos_cat63_icms_.Close;
        qry_processos_cat63_icms_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
        qry_processos_cat63_icms_.ParamByName('DT_BASE').AsString      := vDtBase;
        //if qry_processos_cat63_icms_.SQL[qry_processos_cat63_icms_.SQL.Count-1] = 'AND D.IN_ICMS_IMPRESSO = ''1''' then
        //  qry_processos_cat63_icms_.SQL.Delete(qry_processos_cat63_icms_.SQL.Count-1);
        qry_processos_cat63_icms_.Prepare;
        qry_processos_cat63_icms_.Open;
      end;
    end
    else
    begin
      with datm_icms_online do
      begin
        qry_lista_processos_.Close;
        qry_lista_processos_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
        qry_lista_processos_.ParamByName('CD_TIPO_ICMS').AsString := IntToStr (combo_tipo_icms.ItemIndex + 1);
        qry_lista_processos_.ParamByName('DT_BASE').AsString      := vDtBase;
        //if Copy(Trim(qry_lista_processos_.SQL[qry_lista_processos_.SQL.Count-1]), 1, 9) = 'AND D.IN_' then
        //  qry_lista_processos_.SQL.Delete(qry_lista_processos_.SQL.Count-1);
        qry_lista_processos_.ParamByName('IN_SEM_ADICAO').AsBoolean := ckbInSemAdicao.checked;
        qry_lista_processos_.Prepare;
        qry_lista_processos_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_icms_online.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_icms_online.combo_tipo_icmsExit(Sender: TObject);
begin
  if combo_tipo_icms.ItemIndex = 3 then
    NB.PageIndex := 1
  else NB.PageIndex := 0;
  Atualiza_Tela_ICMS;
  if combo_tipo_icms.ItemIndex = 2 then
    pnl_desp.Visible := True
  else
    pnl_desp.Visible := False;
end;

procedure Tfrm_icms_online.msk_cd_unid_negExit(Sender: TObject);
begin
  if str_cd_unid_oscila = msk_cd_unid_neg.Text then
     Exit;
  with datm_icms_online do
  begin
    if Trim( msk_cd_unid_neg.Text ) <> '' then
      ValCodEdt( msk_cd_unid_neg );
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    if qry_unid_neg_.RecordCount > 0 then
       edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString
    else
       edt_nm_unid_neg.Clear;
    qry_unid_neg_.Close;
  end;
  if Not lAbertura then
    Atualiza_Tela_ICMS;
end;

procedure Tfrm_icms_online.msk_data_baseExit(Sender: TObject);
begin
  Atualiza_Tela_ICMS;
end;

procedure Tfrm_icms_online.dbgrd_icmsDblClick(Sender: TObject);
var
  vStatus : String;
  vNrProcesso : String[18];
begin

  with TQuery.Create(application) do
  begin
    if combo_tipo_icms.ItemIndex = 2 then
    begin
      if ( datm_icms_online.qry_lista_processos_.FieldByName('IN_EXON_IMPRESSO').AsString = '2' ) then
      begin
        BoxMensagem( 'Procedimento não permitido! Exoneração já impressa!', 2 );
        Exit;
      end;

      if ( datm_icms_online.qry_lista_processos_.FieldByName('IN_EXON_IMPRESSO').AsString = '1' ) then
        vStatus := '0'
      else vStatus := '1';

      DatabaseName := 'DBBROKER';
      SQL.CLear;
      SQL.Add('UPDATE TDECLARACAO_IMPORTACAO SET IN_EXON_IMPRESSO = ''' + vStatus + ''' WHERE NR_PROCESSO = ''' + datm_icms_online.qry_lista_processos_.FieldByName('NR_PROCESSO').AsString + '''');
      ExecSQL;
      Free;
    end
    else
    begin
      if ( datm_icms_online.qry_lista_processos_.FieldByName('IN_ICMS_IMPRESSO').AsString = '2' ) then
      begin
        BoxMensagem( 'Procedimento não permitido! I.C.M.S já impresso!', 2 );
        Exit;
      end;

      if ( datm_icms_online.qry_lista_processos_.FieldByName('IN_ICMS_IMPRESSO').AsString = '1' ) then
        vStatus := '0'
      else vStatus := '1';

      DatabaseName := 'DBBROKER';
      SQL.CLear;
      SQL.Add('UPDATE TDECLARACAO_IMPORTACAO SET IN_ICMS_IMPRESSO = ''' + vStatus + ''' WHERE NR_PROCESSO = ''' + datm_icms_online.qry_lista_processos_.FieldByName('NR_PROCESSO').AsString + '''');
      ExecSQL;
      Free;
    end;
  end;
  vNrProcesso := datm_icms_online.qry_lista_processos_.FieldByName('NR_PROCESSO').AsString;
  Atualiza_Tela_ICMS;
  datm_icms_online.qry_lista_processos_.Locate( 'NR_PROCESSO', vNrProcesso, [] );
end;

procedure Tfrm_icms_online.PreparaTab_Main;
var
  i : integer;
  vDtBase : String;
  vProcesso: String;
begin
  for i := 1 to Length( FormatDateTime( FData, msk_data_base.Date ) ) do
    if Copy( FormatDateTime( FData, msk_data_base.Date ), i, 1 ) <> '/' then
      vDtBase := vDtBase + Copy( FormatDateTime( FData, msk_data_base.Date ), i, 1 );

  with datm_icms_online do
  begin
    if ( combo_tipo_icms.ItemIndex = 3 ) then
    begin
      //qry_processos_cat63_exoneracao_.SQL.Add('AND D.IN_EXON_IMPRESSO = ''1''');
      qry_processos_cat63_exoneracao_.Close;
      qry_processos_cat63_exoneracao_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
      qry_processos_cat63_exoneracao_.ParamByName('DT_BASE').AsString      := vDtBase;
      qry_processos_cat63_exoneracao_.Prepare;
      qry_processos_cat63_exoneracao_.Open;
      if not qry_processos_cat63_exoneracao_.IsEmpty then
        TAB_MAIN := qry_processos_cat63_exoneracao_
      else
      begin
        //qry_processos_cat63_icms_.SQL.Add('AND D.IN_ICMS_IMPRESSO = ''1''');
        qry_processos_cat63_icms_.Close;
        qry_processos_cat63_icms_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
        qry_processos_cat63_icms_.ParamByName('DT_BASE').AsString      := vDtBase;
        qry_processos_cat63_icms_.Prepare;
        qry_processos_cat63_icms_.Open;
        TAB_MAIN := qry_processos_cat63_icms_;
      end;
    end
    else
    begin
      vProcesso := qry_lista_processos_NR_PROCESSO.AsString;
      qry_lista_processos_.Close;
      //qry_lista_processos_.SQL.Delete( qry_lista_processos_.SQL.Count - 1 );
      //if ( combo_tipo_icms.ItemIndex = 0 ) or ( combo_tipo_icms.ItemIndex = 1 ) then
      //  qry_lista_processos_.SQL.Add('AND D.IN_ICMS_IMPRESSO = ''1''')
      //else if ( combo_tipo_icms.ItemIndex = 2 ) then
      //  qry_lista_processos_.SQL.Add('AND D.IN_EXON_IMPRESSO = ''1''');
      qry_lista_processos_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
      qry_lista_processos_.ParamByName('CD_TIPO_ICMS').AsString := IntToStr (combo_tipo_icms.ItemIndex + 1);
      qry_lista_processos_.ParamByName('DT_BASE').AsString      := vDtBase;
      qry_lista_processos_.Prepare;
      qry_lista_processos_.Open;
      qry_lista_processos_.Locate('NR_PROCESSO', vProcesso, [loCaseInsensitive]);
      TAB_MAIN := qry_lista_processos_;
    end;
  end;
end;

procedure Tfrm_icms_online.btn_imprimirClick(Sender: TObject);
begin
  (******************************************************************************************************************)
  (* As regras de exibição dos botões 'Gerar' e 'Imprimir' estão na unit PGDI024 em qry_lista_processos_AfterScroll *)
  (* Botão Gerar: Emissão do ICMS para os clientes do RJ                                                            *)
  (* Botão Imprimir: Emite do ICMS para os clientes de SP ou Outros estados                                         *)
  (******************************************************************************************************************)


  if datm_icms_online.qry_lista_processos_UF_CLIENTE.AsString = 'BA' then
    EmiteIcmsBA
  else if datm_icms_online.qry_lista_processos_UF_CLIENTE.AsString = 'SP' then
    EmiteIcmsSP
  else if datm_icms_online.qry_lista_processos_UF_CLIENTE.AsString = 'PR' then
    EmiteIcmsPR
  else if datm_icms_online.qry_lista_processos_UF_CLIENTE.AsString = 'SC' then
    EmiteIcmsSC
  else if ValidaSiteIcmsOutrasUfs then
    EmiteIcmsOutrasUFs
  else
    ShowMessage('Site não cadastrado para as UFs Cliente x Despacho.');
end;

procedure Tfrm_icms_online.GeraArquivoParametros(pTipo, pVencto, pProcesso : String);
var
  ListParametros : TStringList;
begin
  ListParametros := TStringList.Create;
  if pTipo = '0' then
    ListParametros.Add('GARE')
  else if pTipo = '1' then
    ListParametros.Add('GNRE')
  else if pTipo = '2' then
    ListParametros.Add('EXONERACAO');

  ListParametros.Add(pVencto);
  ListParametros.Add(pProcesso);
  if pTipo = '2' then
    ListParametros.Add(msk_cd_desp.text);

  ListParametros.SaveToFile(ExtractFilePath(Application.ExeName) + 'DDBrowser\pBrowser.txt');
  ListParametros.Free;
end;

procedure Tfrm_icms_online.FormCreate(Sender: TObject);
begin
  FClosing := False;
  Application.CreateForm(Tdatm_icms_online, datm_icms_online);
//  Application.CreateForm(Tfrm_icms_online_depesas, frm_icms_online_depesas);
end;

procedure Tfrm_icms_online.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FClosing := True;
  crp_darj.Free;
  datm_icms_online.qry_di_imp_.Close;
  datm_icms_online.Free;
  action := caFree;
end;

procedure Tfrm_icms_online.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_icms_online.btn_co_despClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2204';

  Application.CreateForm(Tfrm_despachante, frm_despachante);
  with frm_despachante do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_desp.Text := Cons_OnLine_Texto;
  end;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0202';

  msk_cd_despExit(nil);
end;

procedure Tfrm_icms_online.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then
    Exit;
  fLocaliza(datm_icms_online.qry_lista_processos_,
                ( msk_cd_unid_neg.Text + str_cd_produto + edt_chave.Text ), 'NR_PROCESSO');
  edt_chave.Text := '';
end;

procedure Tfrm_icms_online.FormShow(Sender: TObject);
begin

  lAbertura := True;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  with datm_icms_online do
  begin
    qry_usuario_.Close;
    qry_usuario_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
    qry_usuario_.Close;
  end;
  lAbertura := False;
  msk_data_base.Date := dt_server;
  msk_data_baseExit(nil);
  msk_vencimento.Date := dt_server;
  combo_tipo_icms.ItemIndex := 0;

  msk_data_base.SetFocus;
end;

procedure Tfrm_icms_online.msk_cd_unid_negEnter(Sender: TObject);
begin
  str_cd_unid_oscila := msk_cd_unid_neg.Text;
end;

procedure Tfrm_icms_online.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_icms_online.msk_cd_despExit(Sender: TObject);
begin
  if Trim( msk_cd_desp.Text ) <> '' then
  begin
    ValCodEdt(msk_cd_desp);
    with datm_icms_online do
    begin
      qry_despachante_.Close;
      qry_despachante_.ParamByName('CD_DESPACHANTE').AsString := msk_cd_desp.Text;
      qry_despachante_.Prepare;
      qry_despachante_.Open;
      msk_nm_desp.Text := qry_despachante_AP_DESPACHANTE.AsString;
      if Trim( msk_nm_desp.Text ) = '' then
      begin
        BoxMensagem( 'Despachante não cadastrado!', 2 );
        msk_cd_desp.SetFocus;
        qry_despachante_.Close;
        Exit;
      end;
      qry_despachante_.Close;
    end;
  end
  else
  begin
    msk_nm_desp.Text := '';
  end;
end;

procedure Tfrm_icms_online.ExecICMSOnLine(pProcesso : string);

    function ExecFile(F: string;Janela:THAndle):string;
    var
       r: string;
    begin
       result := '';
       case ShellExecute(Janela, nil, PChar(F), nil, nil, SW_SHOWNORMAL) of
          ERROR_FILE_NOT_FOUND: r := 'O Arquivo específicado não foi encontrado.';
          ERROR_PATH_NOT_FOUND: r := 'O caminho específicado não existe';
          ERROR_BAD_FORMAT: r := 'The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).';
          SE_ERR_ACCESSDENIED: r := 'Windows 95 only: The operating system denied access to the specified file.';
          SE_ERR_ASSOCINCOMPLETE: r := 'The filename association is incomplete or invalid.';
          SE_ERR_DDEBUSY: r := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
          SE_ERR_DDEFAIL: r := 'The DDE transaction failed.';
          SE_ERR_DDETIMEOUT: r := 'The DDE transaction could not be completed because the request timed out.';
          SE_ERR_DLLNOTFOUND: r := 'Windows 95 only: The specified dynamic-link library was not found.';
          SE_ERR_NOASSOC: r := 'There is no application associated with the given filename extension.';
          SE_ERR_OOM: r := 'Windows 95 only: There was not enough memory to complete the operation.';
          SE_ERR_SHARE: r := 'A sharing violation occurred.';
       else
          Exit;
       end;
       result := r;
    end;

var
   i, vTributacao : integer;
   vRefCli, vObsAux , vStrAux, vStrAux2 : String;
   TXTSaida : TStringList;
   vIN_EMBUT_FRT_ITENS, vIN_EMBUT_SEG_ITENS, vMarinhaMercante : Boolean;
   VlFiscal : Real;
   vDataAux : TDateTime;
   Ano, Mes, Dia : Word;
   qryAux: TQuery;
   qryAFRMM: TQuery;
   vCD_TRIBUTACAO_ICMS: String;
   vObsAuxAFRMM: String;
   vVL_ICMS_A_RECOLHER_AFRMM, vTotal: Double;
   vSomaValorAfrmmItem: Double;

begin

  TXTSaida         := TStringList.Create;
  vMarinhaMercante := VerificaMarinhaMercante(pProcesso);

  qryAux := TQuery.Create(application);

  with qryAux do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*)');
    SQL.Add('FROM TADICAO_DE_IMPORTACAO');
    SQL.Add('WHERE NR_PROCESSO = ''' + pProcesso + '''');
    Open;
    Close;

    SQL.Clear;
    SQL.Add('  SELECT DISTINCT EN.CGC_EMPRESA, EN.END_BAIRRO,');
    SQL.Add('       DI.CD_TRIBUTACAO_ICMS,');
    SQL.Add('       DI.DT_REGISTRO_DI,');
    SQL.Add('       EN.NM_EMPRESA,');
    SQL.Add('       (EN.END_EMPRESA + '', '' + EN.END_NUMERO) AS ENDERECO,');
    SQL.Add('       EN.END_CIDADE,');
    SQL.Add('       EN.END_UF,');
    SQL.Add('       EN.END_CEP,');
    SQL.Add('       CASE EN.IE_EMPRESA');
    SQL.Add('         WHEN ''ISENTO'' THEN ''''');
    SQL.Add('         ELSE EN.IE_EMPRESA');
    SQL.Add('       END IE_EMPRESA,');
    SQL.Add('       Replace(U.NR_FONE,''-'','''') AS NR_TELEFONE,');
    SQL.Add('       EN.NR_CAE,');
    SQL.Add('       CASE EN.IE_EMPRESA');
    SQL.Add('         WHEN ''ISENTO'' THEN ''N''');
    SQL.Add('         ELSE ''S''');
    SQL.Add('       END IN_CAD_CONTR,');
    SQL.Add('       CC.NM_EMAIL,');
    SQL.Add('       ISNULL( DI.CD_MOEDA_MLE, ''010'' ) AS CD_MOEDA,');
    SQL.Add('       CONVERT( NUMERIC( 10, 2 ),( SELECT SUM( VL_BASE_CALC_ADVAL )');
    SQL.Add('                                   FROM   TRIBUTO');
    SQL.Add('                                   WHERE  NR_PROCESSO = :NR_PROCESSO AND');
    SQL.Add('                                          CD_RECEITA_IMPOSTO = ''0001'' ) ) AS VL_MOEDA,');
    SQL.Add('       DI.NR_DECLARACAO_IMP,');
    if combo_tipo_icms.ItemIndex <> 3 then
    begin
      SQL.Add('       DI.VL_TOT_ICMS, ');
      SQL.Add('       ( SELECT SUM( VL_ICMS_A_RECOLHER_AFRMM ) FROM TADICAO_DE_IMPORTACAO AD ');
      SQL.Add('         WHERE AD.NR_PROCESSO = DI.NR_PROCESSO ) AS VL_ICMS_A_RECOLHER_AFRMM,');
    end
    else
    begin
      if not vMarinhaMercante then
        SQL.Add('       (SELECT SUM(VL_ICMS_CALCULADO) FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = :NR_PROCESSO) VL_TOT_ICMS,')
      else //Rodrigo Capra - inclusão da Marinha Mercante no cálculo do ICMS - 08/04/2008
        SQL.Add('       (SELECT SUM(VL_ICMS_DEVIDO_AFRMM) FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = :NR_PROCESSO) VL_ICMS_A_RECOLHER_AFRMM,');
    end;
    SQL.Add('       DI.QT_ADICOES, DI.IN_EMBUT_FRT_ITENS, DI.IN_EMBUT_SEG_ITENS, RA.CODIGO, CONVERT(DECIMAL(15,2),DI.VL_TOTAL_TX_SCX) VL_TOTAL_TX_SCX,');
    SQL.Add('       UR.END_UF AS END_UF_DI');
    SQL.Add('FROM TDECLARACAO_IMPORTACAO DI');
    SQL.Add('   INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = DI.CD_IMPORTADOR');
    SQL.Add('   LEFT JOIN TCLIENTE_CONTATO CC ON CC.CD_CLIENTE = EN.CD_EMPRESA');
    SQL.Add('   INNER JOIN TUNID_NEG U ON U.CD_UNID_NEG = SUBSTRING(DI.NR_PROCESSO, 1, 2)');
    SQL.Add('   LEFT JOIN TREC_ALFANDEGADO RA ON RA.CODIGO = DI.CD_RECINTO_ALFAND --AND CC.NM_EMAIL IS NOT NULL');
    SQL.Add('   LEFT JOIN TURF UR ON UR.CODIGO = DI.CD_URF_DESPACHO');
    SQL.Add('WHERE DI.NR_PROCESSO = :NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := pProcesso;
//    Clipboard.AsText := SQL.Text;
//    Exit;
//    showmessage(Sql.Text);
    Open;

    vVL_ICMS_A_RECOLHER_AFRMM := FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat;

    vCD_TRIBUTACAO_ICMS := FieldByName('CD_TRIBUTACAO_ICMS').AsString;

    vIN_EMBUT_FRT_ITENS := FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean;
    vIN_EMBUT_SEG_ITENS := FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean;

    TXTSaida.Add('javascript');
    TXTSaida.Add('if( ( document.getElementById("rblTipo_0") != null ) ){');
    TXTSaida.Add('    document.getElementById("rblTipo_0").checked = "checked";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtCpf") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtCpf").value = "'+ FieldByName('CGC_EMPRESA').AsString +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtNumDoc") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtNumDoc").value = "'+ FieldByName('NR_DECLARACAO_IMP').AsString +'";');
    TXTSaida.Add('}');
//    TXTSaida.Add('if ( ( document.getElementById("BTNCONSULTAR") != null ) ){');
//    TXTSaida.Add('    document.getElementById("BTNCONSULTAR").click();');
//    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtIE") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtIE").value = "'+ StringReplace(FieldByName('IE_EMPRESA').AsString,'.','',[rfReplaceAll]) +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtCnae") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtCnae").value = "'+ StringReplace(StringReplace(FieldByName('NR_CAE').AsString,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]) +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("ckbCadastro") != null ) ){');
    TXTSaida.Add('    document.getElementById("ckbCadastro").checked = false;');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtEndereco") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtEndereco").value = "'+ StringReplace(FieldByName('ENDERECO').AsString,'"','',[rfReplaceAll]) +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtBairro") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtBairro").value = "'+ FieldByName('END_BAIRRO').AsString +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtMunicipio") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtMunicipio").value = "'+ FieldByName('END_CIDADE').AsString +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtCep") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtCep").value = "'+ FieldByName('END_CEP').AsString +'";');
    TXTSaida.Add('}');

    TXTSaida.Add('if( ( document.getElementById("ddlUF") != null ) ){');
    TXTSaida.Add('    document.getElementById("ddlUF").value = "'+ FieldByName('END_UF').AsString +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtDdd") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtDdd").value = "'+Copy(FieldByName('NR_TELEFONE').AsString,3,2)+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtFone") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtFone").value = "'+ trim(Copy(FieldByName('NR_TELEFONE').AsString,Pos(')',FieldByName('NR_TELEFONE').AsString)+1,10)) +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtEmail") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtEmail").value = "'+ FieldByName('NM_EMAIL').AsString +'";');
    TXTSaida.Add('}');

    TXTSaida.Add('if( ( document.getElementById("txtDemais") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtDemais").value = "'+FormatFloat('##0.00', FieldByName('VL_TOTAL_TX_SCX').AsCurrency)+'";');
    TXTSaida.Add('}');
//    TXTSaida.Add('if ( ( document.getElementById("BTNCONTINUAR") != null ) ){');
//    TXTSaida.Add('    document.getElementById("BTNCONTINUAR").click();');
//    TXTSaida.Add('}');

    TXTSaida.Add('if( ( document.getElementById("ddlArmazem") != null )  ){');
    TXTSaida.Add('    document.getElementById("ddlArmazem").value = "'+FieldByName('CODIGO').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtDataVenc") != null ) ){');
    if combo_tipo_icms.ItemIndex <> 3 then
      TXTSaida.Add('    document.getElementById("txtDataVenc").value = "' + FormatDateTime('dd/mm/yyyy',msk_vencimento.Date)+'";')
    else
    begin
      vDataAux := IncMonth(msk_vencimento.Date);
      DecodeDate(vDataAux,Ano,Mes,Dia);
      TXTSaida.Add('    document.getElementById("txtDataVenc").value = "'+FormatDateTime('dd/mm/yyyy',PoeOuTiraDiasUteis(0,'+',EncodeDate(Ano,Mes,1)))+'";');
    end;
    TXTSaida.Add('    txtDataVenc = "True";');
    TXTSaida.Add('}');

    TXTSaida.Add('if( ( document.getElementById("txtReceita") != null ) ){');
    if vMarinhaMercante then
      TXTSaida.Add('    document.getElementById("txtReceita").value = "'+ FormatFloat('###,##0.00', FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat) +'";')
    else
      TXTSaida.Add('    document.getElementById("txtReceita").value = "'+ FormatFloat('###,##0.00', FieldByName('VL_TOT_ICMS').AsFloat) +'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtRef") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtRef").value = "'+FormatDateTime('mm/yyyy',now)+'";');
    TXTSaida.Add('}');
//    if combo_tipo_icms.ItemIndex = 2 then begin
//      TXTSaida.Add('if ( ( document.getElementById("btnGera") != null ) ){');
//      TXTSaida.Add('    document.getElementById("btnGera").click();');
//      TXTSaida.Add('}');
//    end else begin
//      TXTSaida.Add('if ( ( document.getElementById("btnGera") != null ) ){');
//      TXTSaida.Add('    document.getElementById("btnGera").click();');
//      TXTSaida.Add('}');
//    end;

    TXTSaida.Add('if( ( document.getElementById("txtValorDI") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtValorDI").value = "'+FormatFloat('###,##0.00', FieldByName('VL_MOEDA').AsCurrency)+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("ddlUfDi") != null ) ){');
    TXTSaida.Add('    document.getElementById("ddlUfDi").value = "'+FieldByName('END_UF_DI').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("txtDataSiscomex") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtDataSiscomex").value = "'+Copy(FieldByName('DT_REGISTRO_DI').AsString,1,2)+'/'+Copy(FieldByName('DT_REGISTRO_DI').AsString,3,2)+'/'+Copy(FieldByName('DT_REGISTRO_DI').AsString,5,4)+'";');
    TXTSaida.Add('}');

    SQL.Clear;
    SQL.Add('SELECT DISTINCT');
    SQL.Add('       DE.NM_DESPACHANTE,');
    SQL.Add('       DE.CPF_DESPACHANTE,');
    SQL.Add('       (RTRIM(UN.END_UNID_NEG) + ''   '' + UN.END_NUMERO) AS END_DESP,');
    SQL.Add('       UN.END_BAIRRO,');
    SQL.Add('       UN.END_CIDADE AS CIDADE_DESP,');
    SQL.Add('       UN.END_CEP AS CEP_DESP,');
    SQL.Add('       UN.END_UF AS UF_DESP,');
    SQL.Add('       UN.NR_FONE');
    SQL.Add('FROM   TDESPACHANTE DE, TUNID_NEG UN');
    SQL.Add('WHERE  DE.CD_DESPACHANTE = ''008''');  // Utilizava o código 002 (Rene) - Michel - 06/04/2009 - Ocorrência 08313/09, Agora foi mudado de Denilza (018) para Celina (008)
    SQL.Add('AND    UN.CD_UNID_NEG = SUBSTRING('''+pProcesso+''',1,2)');
    Open;

    TXTSaida.Add('if( ( document.getElementById("TXTNOMEREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTNOMEREP").value = "'+FieldByName('NM_DESPACHANTE').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTCPFREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTCPFREP").value = "'+FieldByName('CPF_DESPACHANTE').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTENDERECOREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTENDERECOREP").value = "'+FieldByName('END_DESP').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTBAIRROREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTBAIRROREP").value = "'+FieldByName('END_BAIRRO').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTMUNICIPIOREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTMUNICIPIOREP").value = "'+FieldByName('CIDADE_DESP').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTCEPREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTCEPREP").value = "'+FieldByName('CEP_DESP').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("DDLUFREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("DDLUFREP").value = "'+FieldByName('UF_DESP').AsString+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTDDDREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTDDDREP").value = "'+Copy(FieldByName('NR_FONE').AsString,2,2)+'";');
    TXTSaida.Add('}');
    TXTSaida.Add('if( ( document.getElementById("TXTFONEREP") != null ) ){');
    TXTSaida.Add('    document.getElementById("TXTFONEREP").value = "'+Copy(FieldByName('NR_FONE').AsString,Pos(')',FieldByName('NR_FONE').AsString)+1,10)+'";');
    TXTSaida.Add('}');

    SQL.Clear;
    SQL.Add('SELECT AI.PC_REDUCAO_ICMS,');
    SQL.Add('       AI.PC_ICMS,');
    SQL.Add('       CASE AI.PC_ICMS');
    //SQL.Add('       	 WHEN 25.0 THEN ''5''');
    //SQL.Add('       	 WHEN 18.0 THEN ''4''');
    //SQL.Add('       	 WHEN 12.0 THEN ''3''');
    //SQL.Add('       	 WHEN 8.8 THEN ''2''');
    //SQL.Add('       	 WHEN 7.0 THEN ''1''');
    //SQL.Add(' 	       WHEN 5.6 THEN ''0''');

    SQL.Add('       	 WHEN 25.0 THEN ''25''');
    SQL.Add('       	 WHEN 18.0 THEN ''18''');
    SQL.Add('       	 WHEN 12.0 THEN ''12''');
    SQL.Add('       	 WHEN 8.8 THEN ''8.8''');
    SQL.Add('       	 WHEN 7.0 THEN ''7''');
    SQL.Add(' 	       WHEN 5.6 THEN ''5.6''');
    SQL.Add('	         ELSE ''1''');
    SQL.Add('       END DDLICMS,');
    SQL.Add('       AI.CD_MERC_NBM_SH AS NBM,');
    //Rodrigo Capra - 08/04/2008  IIF's
    SQL.Add('       (SUBSTRING(CONVERT(CHAR,CONVERT(NUMERIC(10,2),' + IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS - vl_icms_calculado','VL_BASE_CALC_ICMS_AFRMM - VL_ICMS_DEVIDO_AFRMM') + ')),1,LEN(CONVERT(CHAR,CONVERT(NUMERIC(10,2),' + IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS - vl_icms_calculado','VL_BASE_CALC_ICMS_AFRMM - VL_ICMS_DEVIDO_AFRMM') + ')))-3))+ '','' +');
    SQL.Add('       (SUBSTRING(CONVERT(CHAR,CONVERT(NUMERIC(10,2),' + IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS - vl_icms_calculado','VL_BASE_CALC_ICMS_AFRMM - VL_ICMS_DEVIDO_AFRMM') + ')),LEN(CONVERT(CHAR,CONVERT(NUMERIC(10,2),' +   IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS - vl_icms_calculado','VL_BASE_CALC_ICMS_AFRMM - VL_ICMS_DEVIDO_AFRMM') + ')))-1,2)) AS VALOR_TOTAL,');

    SQL.Add('       ''ALIQ. ICMS:'' + CONVERT(varchar, AI.PC_ICMS ) + ''%'' + ');
    SQL.Add('        CASE ISNULL( AI.PC_REDUCAO_ICMS, 0 )');
    SQL.Add('            WHEN 0 THEN    ''  '' ');
    SQL.Add('             ELSE   ''<BR>''  + CONVERT(varchar, AI.PC_REDUCAO_ICMS ) +   ''%''');
    SQL.Add('         END AS STR_PC_ICMS, VL_PIS, VL_COFINS, CD_TRIBUTACAO_ICMS,');
    SQL.Add('         vl_merc_loc_emb_mn, VL_BASE_CALC_II, FL.NM_FUND_LEGAL DESCRICAO, AI.PC_REDUCAO_ICMS, AI.NR_ADICAO,');
    SQL.Add('        CASE ISNULL(E.CD_TRIB, '''')');
    SQL.Add('            WHEN '''' THEN CASE CD_TRIBUTACAO_ICMS');
    SQL.Add('                             WHEN ''5'' THEN ''2''');
    SQL.Add('                             WHEN ''6'' THEN ''5''');
    SQL.Add('                             WHEN ''7'' THEN ''3''');
    SQL.Add('                             WHEN ''3'' THEN ''4''');
    SQL.Add('                             WHEN ''6'' THEN ''6''');
    SQL.Add('                         END');
    SQL.Add('        ELSE E.CD_TRIB');
    SQL.Add('        END AS DDL_CD_TRIBUTACAO_ICMS');
    SQL.Add(' FROM TADICAO_DE_IMPORTACAO AI');
    SQL.Add('    LEFT JOIN TRIBUTO T ON T.NR_PROCESSO = AI.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002''');
    SQL.Add('    LEFT JOIN TTP_EXONERACAO FL ON FL.CD_EX = AI.CD_FUND_LEGAL_ICMS');
    SQL.Add('    LEFT JOIN TTP_EXONERACAO E ON E.CD_EX = AI.CD_FUND_LEGAL_ICMS');
    SQL.Add('WHERE  AI.NR_PROCESSO = :NR_PROCESSO');
    SQL.Add('ORDER BY AI.PC_ICMS, AI.PC_REDUCAO_ICMS');
    ParamByName('NR_PROCESSO').AsString := pProcesso;
    Open;
//    showmessage(Sql.Text);

    i := 0;
    while not EOF do
    begin

      vStrAux  := copy('000',0,3-length(IntToStr(i))) + IntToStr(i);
      vStrAux2 := copy('000',0,3-length(IntToStr(i+2))) + IntToStr(i+1);

      // exoneração ( script )
      TXTSaida.Add('if( ( document.getElementById("lblErro") == null ) ) {');
      TXTSaida.Add('    if( ( document.getElementById("txtNumAdicao") != null ) ) {');
      TXTSaida.Add('        document.getElementById("txtNumAdicao").value = "' + FieldByName('NR_ADICAO').AsString + '";');
      TXTSaida.Add('     }                                                           ');
      TXTSaida.Add('     if( ( document.getElementById("txtNCMAdicao") != null ) ) {');
      TXTSaida.Add('        document.getElementById("txtNCMAdicao").value = "' + FieldByName('NBM').AsString + '";');
      TXTSaida.Add('     }                                                          ');
      TXTSaida.Add('     if( ( document.getElementById("txtValAdicao") != null ) ) {');
      if combo_tipo_icms.ItemIndex = 2 then // Se for exoneração coloca o valor da mercadoria no local de embarque - Michel - 13/10/2009
        TXTSaida.Add('        document.getElementById("txtValAdicao").value = "' + FormatFloat('0.00', FieldByName('VL_BASE_CALC_II').AsFloat) + '";')
      else
        TXTSaida.Add('        document.getElementById("txtValAdicao").value = "' + FieldByName('VALOR_TOTAL').AsString + '";');
      TXTSaida.Add('     }                                                          ');
      //TXTSaida.Add('     if( ( document.getElementById("DDLTIPOADICAO") != null ) ) {');
      //TXTSaida.Add('        document.getElementById("DDLTIPOADICAO").value = document.getElementById("DDLTIPOADICAO").options('+FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsString+').value;');
      //TXTSaida.Add('     }                                                          ');
      TXTSaida.Add('     if( ( document.getElementById("txtFunAdicao") != null ) ) {');
      TXTSaida.Add('        document.getElementById("txtFunAdicao").value = "');
      with TMemo.Create(nil) do
      begin
        Parent := frm_icms_online;
        WordWrap := False;
        WantReturns := False;
        Visible := False;
        Lines.Add(Copy(FieldByName('DESCRICAO').AsString,1,Length(FieldByName('DESCRICAO').AsString)-2));
        for i := 0 to Lines.Count - 1 do
          TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + StringReplace(Lines.Strings[i], '"', '\"', [rfReplaceAll]) + ' ';
        Free;
      end;
      TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + '";';
      TXTSaida.Add('     }                                                          ');
      TXTSaida.Add('}                                                             ');

//      TXTSaida.Add('if( ( document.getElementById("lblErro") != null ) ) {');
//      TXTSaida.Add('    if ( ( document.getElementById("DTGADICAO:_CTL2:_CTL0") != null ) ){');
//      TXTSaida.Add('        document.getElementById("DTGADICAO:_CTL2:_CTL0").click();');
//      TXTSaida.Add('    }');

      // GARE ( script )
      TXTSaida.Add('    if( ( document.getElementById("lblAdicao") != null ) ) {');
      TXTSaida.Add('                                                             ');
      TXTSaida.Add('        if( ( document.getElementById("ckbTributado") != null ) ){');
      if FieldByName('CD_TRIBUTACAO_ICMS').AsInteger in [1,4,5] then
        TXTSaida.Add('          document.getElementById("ckbTributado").checked = false;')
      else TXTSaida.Add('          document.getElementById("ckbTributado").checked = true;');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("ddlIcms") != null ) ){');
      TXTSaida.Add('            document.getElementById("ddlIcms").value = document.getElementById("ddlIcms").options('+FieldByName('DDLICMS').AsString+').value;');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtFob") != null ) ){');
      TXTSaida.Add('            document.getElementById("txtFob").value = "'+FormatFloat('##0.00', FieldByName('vl_merc_loc_emb_mn').AsFloat)+'";');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtTributado") != null ) ){');
      TXTSaida.Add('            document.getElementById("txtTributado").value = "');
      with TMemo.Create(nil) do
      begin
        Parent := frm_icms_online;
        WordWrap := False;
        WantReturns := False;
        Visible := False;
        Lines.Add(FieldByName('DESCRICAO').AsString);
        for i := 0 to Lines.Count - 1 do
          TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + StringReplace(Lines.Strings[i], '"', '\"', [rfReplaceAll]) + ' ';
        i := Lines.Count;
        Free;
      end;
      TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + '";';
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtBCVal") != null ) ){');
      if FieldByName('PC_REDUCAO_ICMS').AsFloat > 0 then
        TXTSaida.Add('            document.getElementById("txtBCVal").value = "'+FormatFloat('##0.00', FieldByName('PC_REDUCAO_ICMS').AsFloat)+'";')
      else
        TXTSaida.Add('            document.getElementById("txtBCVal").value = "";');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtBC") != null ) ){');
      if FieldByName('PC_REDUCAO_ICMS').AsFloat > 0 then
        TXTSaida.Add('            document.getElementById("txtBCVal").value = "'+FormatFloat('##0.00', FieldByName('PC_REDUCAO_ICMS').AsFloat)+'";')
      else
        TXTSaida.Add('            document.getElementById("txtBCVal").value = "";');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtPisVal") != null ) ){');
      TXTSaida.Add('            document.getElementById("txtPisVal").value = "'+FieldByName('VL_PIS').AsString+'";');
      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("txtCofinsVal") != null ) ){');
      TXTSaida.Add('            document.getElementById("txtCofinsVal").value = "'+FieldByName('VL_COFINS').AsString+'";');
      TXTSaida.Add('        }');
//      TXTSaida.Add('        if ( ( document.getElementById("BTNALTERAR") != null ) ){');
//      TXTSaida.Add('            document.getElementById("BTNALTERAR").click();');
//      TXTSaida.Add('        }');
      TXTSaida.Add('        if( ( document.getElementById("lblAliqIcms") != null ) ){');
      TXTSaida.Add('            alert("A aliquota do ICMS foi alterada, você deve justificar a alteração.");');
      TXTSaida.Add('        }');
      TXTSaida.Add('   }');
      //TXTSaida.Add('}');
      Next;
      i := i + 1;

    end;

    vTributacao := 0;
    case combo_tipo_icms.ItemIndex of
      0: vTributacao := 1;
      1: vTributacao := 1;
      2: vTributacao := 3;
      3: vTributacao := 3;
    end;

    SQL.Clear;
    SQL.Add('SELECT CONVERT(NUMERIC(10,2),(SUM((AD.VL_MERC_LOC_EMB_MN + AD.VL_ACRESCIMOS_MN - AD.VL_DEDUCOES_MN + AD.VL_FRETE_MERC_MN + AD.VL_SEG_MERC_MN)))) AS VL_FISCAL, ');
    if vCD_TRIBUTACAO_ICMS = '4' then {Se for REDUÇÃO}
      SQL.Add('AD.PC_REDUCAO_ICMS, E.NM_FUND_LEGAL, AD.PC_ICMS,');

    if combo_tipo_icms.ItemIndex = 3 then
      SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.' + IIF(not vMarinhaMercante,'VL_ICMS_CALCULADO','VL_ICMS_DEVIDO_AFRMM') + ')) AS ICMS,')
    else
      SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.' + IIF(not vMarinhaMercante,'VL_ICMS_A_RECOLHER','VL_ICMS_A_RECOLHER_AFRMM') + ')) AS ICMS,');

    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(II.VL_IPT_A_RECOLHER)) AS II,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_TX_SCX_AD)) AS TX_SCX,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(IPI.VL_IPT_A_RECOLHER)) AS IPI,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(DU.VL_IPT_A_RECOLHER)) AS AD, ');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_MERC_VENDA_MN)) AS MCV, ');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.' + IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS','VL_BASE_CALC_ICMS_AFRMM') + ')) AS BASE_CALCULO,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_FRETE_MERC_MN)) AS VL_FRETE,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_SEG_MERC_MN)) AS VL_SEGURO,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_PIS)) AS PIS, CONVERT(NUMERIC(10,2),SUM(AD.VL_COFINS)) AS COFINS,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.VL_TX_SCX_AD)) AS TX_SISCOMEX,');
    SQL.Add('       CONVERT(NUMERIC(10,2),SUM(AD.' + IIF(not vMarinhaMercante,'VL_BASE_CALC_ICMS','VL_BASE_CALC_ICMS_AFRMM') + ')) AS VL_BASE_CALC_ICMS');

    //if vMarinhaMercante then
    //  SQL.Add('       , (SELECT VL_PAGTO FROM TSOLIC_PAGTO WHERE CD_ITEM = (SELECT CD_ITEM_AFRMM FROM tparametros) AND CD_STATUS =''7'' AND nr_processo = ''' + pProcesso + ''') as VL_AFRMM');

    SQL.Add('FROM   TADICAO_DE_IMPORTACAO AD');
    SQL.Add('INNER JOIN TDECLARACAO_IMPORTACAO D');
    SQL.Add('  ON ( ( D.NR_PROCESSO = AD.NR_PROCESSO ) )');
    SQL.Add('LEFT JOIN TRIBUTO II');
    SQL.Add('  ON ( ( II.NR_PROCESSO  = AD.NR_PROCESSO ) AND');
    SQL.Add('       ( II.NR_ADICAO    = AD.NR_ADICAO   ) AND');
    SQL.Add('       ( II.CD_RECEITA_IMPOSTO = ''0001''   ) )');
    SQL.Add('LEFT JOIN TRIBUTO IPI');
    SQL.Add('  ON ( ( IPI.NR_PROCESSO  = AD.NR_PROCESSO ) AND');
    SQL.Add('       ( IPI.NR_ADICAO    = AD.NR_ADICAO   ) AND');
    SQL.Add('       ( IPI.CD_RECEITA_IMPOSTO = ''0002''   ) )');
    SQL.Add('LEFT JOIN TRIBUTO DU');
    SQL.Add('  ON ( ( DU.NR_PROCESSO  = AD.NR_PROCESSO ) AND');
    SQL.Add('       ( DU.NR_ADICAO    = AD.NR_ADICAO   ) AND');
    SQL.Add('       ( DU.CD_RECEITA_IMPOSTO = ''0003''   ) )');
    SQL.Add('LEFT JOIN TTP_EXONERACAO E');
    SQL.Add('  ON (E.CD_EX = AD.CD_FUND_LEGAL_ICMS)');
    SQL.Add('WHERE ( AD.NR_PROCESSO = ''' + pProcesso + ''' ) AND ( (');
    SQL.Add('        ( '''+IntToStr(vTributacao)+''' IN (''1'',''2'',''4'') ) AND');
    SQL.Add('        (((AD.CD_TRIBUTACAO_ICMS = ''1'') AND (( AD.CD_FUND_LEGAL_ICMS IS NULL ) OR ( AD.CD_FUND_LEGAL_ICMS = '''' ))');
    SQL.Add('         ) OR (AD.CD_TRIBUTACAO_ICMS = ''4''))');
    SQL.Add('        ) OR (');
    SQL.Add('        ( '''+IntToStr(vTributacao)+''' = ''3'' ) AND');
    SQL.Add('        ( ( AD.CD_FUND_LEGAL_ICMS IS NOT NULL ) AND ( AD.CD_FUND_LEGAL_ICMS <> '''' ) ) ) )');
    if vCD_TRIBUTACAO_ICMS = '4' then {Se for REDUÇÃO}
      SQL.Add('        GROUP BY AD.NR_PROCESSO, AD.PC_REDUCAO_ICMS, E.NM_FUND_LEGAL, AD.PC_ICMS ');
    Prepare;
    Open;
//    showmessage(Sql.Text);

    VlFiscal := FieldByName('VL_FISCAL').AsFloat;
    if vIN_EMBUT_FRT_ITENS then
       VlFiscal := VlFiscal - FieldByName('VL_FRETE').AsFloat;
    if vIN_EMBUT_SEG_ITENS then
       VlFiscal := VlFiscal - FieldByName('VL_SEGURO').AsFloat;

    if vCD_TRIBUTACAO_ICMS = '4' then {Se for REDUÇÃO}
    begin

      if qryAux.RecordCount > 1 then
          ShowMessage('Existe diferença nos valores dos campos: "Redução de ICMS", "Fundamento legal" e "Porcentagem de ICMS". ' +
                      'Caso estejam corretos, informar o setor de sistemas, pois  os valores vão sair errados nas observações da guia.');

      qryAFRMM := TQuery.Create(application);
      try
        qryAFRMM.Databasename := 'DBBROKER';
        qryAFRMM.SQL.Clear;
        qryAFRMM.SQL.Add('select sum(VL_AFRMM_ITEM) AS VL_AFRMM_ITEM from TDETALHE_MERCADORIA WHERE NR_PROCESSO = :NR_PROCESSO ');
        qryAFRMM.ParamByName('NR_PROCESSO').AsString := pProcesso;
        qryAFRMM.Open;
        vSomaValorAfrmmItem := 0;
        while not qryAFRMM.Eof do
        begin
          vSomaValorAfrmmItem := vSomaValorAfrmmItem + qryAFRMM.FieldByName('VL_AFRMM_ITEM').AsFloat;
          qryAFRMM.Next;
        end;
        qryAFRMM.Close;
      finally
        qryAFRMM.Free;
      end;

      vTotal := vSomaValorAfrmmItem + VlFiscal +
                FieldByName('II').AsFloat +
                FieldByName('IPI').AsFloat +
                FieldByName('AD').AsFloat +
                FieldByName('PIS').AsFloat +
                FieldByName('COFINS').AsFloat +
                FieldByName('TX_SCX').AsFloat;

      vObsAux := 'N/REF: ' + Copy(pProcesso,5,12) + ' ';
      vObsAux := vObsAux + 'Vl Fiscal R$ '   + FormatFloat ( '###,###,###,##0.00', VlFiscal ) + ' ';
      vObsAux := vObsAux + 'II R$ '          + FormatFloat ( '###,###,###,##0.00', FieldByName('II').AsFloat ) + ' ';
      vObsAux := vObsAux + 'IPI R$ '         + FormatFloat ( '###,###,###,##0.00', FieldByName('IPI').AsFloat ) + ' ';
      vObsAux := vObsAux + 'PIS R$ '         + FormatFloat ( '###,###,###,##0.00', FieldByName('PIS').AsFloat ) + ' ';
      vObsAux := vObsAux + 'COFINS R$ '      + FormatFloat ( '###,###,###,##0.00', FieldByName('COFINS').AsFloat ) + ' ';
      vObsAux := vObsAux + 'Tx.Siscomex R$ ' + FormatFloat ( '###,###,###,##0.00', FieldByName('TX_SISCOMEX').AsFloat ) + ' ';
      vObsAux := vObsAux + ' AFRMM R$ '      + FormatFloat('###,###,###,##0.00', vSomaValorAfrmmItem) + ' ';
      vObsAux := vObsAux + 'Total R$ '       + FormatFloat ( '###,###,###,##0.00', ( vTotal )) + ' ';
      vObsAux := vObsAux + '(Base ICMS R$ '  + FormatFloat ( '###,###,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat ) + ')';

      vObsAux := vObsAux + 'Reducao '        + FormatFloat ( '0.00', FieldByName('PC_REDUCAO_ICMS').AsFloat );
      vObsAux := vObsAux + '% = R$'          + FormatFloat ( '###,###,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat * (FieldByName('PC_REDUCAO_ICMS').AsFloat / 100 )) + ' ';
      vObsAux := vObsAux + 'Base Reduzida = R$' + FormatFloat ( '###,###,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat * ((100 - FieldByName('PC_REDUCAO_ICMS').AsFloat) / 100 ) ) + ' ';
      vObsAux := vObsAux + FieldByName('NM_FUND_LEGAL').AsString + ' ';
      vObsAux := vObsAux + 'VALOR SUSPENSO ' + FormatFloat ( '0.00', FieldByName('PC_REDUCAO_ICMS').AsFloat );
      vObsAux := vObsAux + '% R$'            + FormatFloat ( '###,###,###,##0.00', ((FieldByName('VL_BASE_CALC_ICMS').AsFloat * ((FieldByName('PC_ICMS').AsFloat) / 100)) - vVL_ICMS_A_RECOLHER_AFRMM )) + ' ';
      vObsAux := vObsAux + 'VALOR A RECOLHER ' + FormatFloat ( '0.00', 100 - FieldByName('PC_REDUCAO_ICMS').AsFloat);
      vObsAux := vObsAux + '% R$'            + FormatFloat ( '###,###,###,##0.00', vVL_ICMS_A_RECOLHER_AFRMM) + ' ';
      Close;
    end
    else
    begin

      qryAFRMM := TQuery.Create(application);
      try
        qryAFRMM.Databasename := 'DBBROKER';
        qryAFRMM.SQL.Clear;
        qryAFRMM.SQL.Add('select sum(VL_AFRMM_ITEM) AS VL_AFRMM_ITEM from TDETALHE_MERCADORIA WHERE NR_PROCESSO = :NR_PROCESSO ');
        qryAFRMM.ParamByName('NR_PROCESSO').AsString := pProcesso;
        qryAFRMM.Open;
        vSomaValorAfrmmItem := 0;
        while not qryAFRMM.Eof do
        begin
          vSomaValorAfrmmItem := vSomaValorAfrmmItem + qryAFRMM.FieldByName('VL_AFRMM_ITEM').AsFloat;
          qryAFRMM.Next;
        end;
        qryAFRMM.Close;
      finally
        qryAFRMM.Free;
      end;

      vTotal := vSomaValorAfrmmItem + VlFiscal +
                FieldByName('II').AsFloat +
                FieldByName('IPI').AsFloat +
                FieldByName('AD').AsFloat +
                FieldByName('PIS').AsFloat +
                FieldByName('COFINS').AsFloat +
                FieldByName('TX_SCX').AsFloat;

      vObsAux := 'N/REF: ' + Copy(pProcesso,5,12) + ' ';
      vObsAux := vObsAux + 'Vl Fiscal R$ '   + FormatFloat ( '###,###,###,##0.00', VlFiscal ) + ' ';
      vObsAux := vObsAux + 'II R$ '          + FormatFloat ( '###,###,###,##0.00', FieldByName('II').AsFloat ) + ' ';
      vObsAux := vObsAux + 'IPI R$ '         + FormatFloat ( '###,###,###,##0.00', FieldByName('IPI').AsFloat ) + ' ';
      vObsAux := vObsAux + 'PIS R$ '         + FormatFloat ( '###,###,###,##0.00', FieldByName('PIS').AsFloat ) + ' ';
      vObsAux := vObsAux + 'COFINS R$ '      + FormatFloat ( '###,###,###,##0.00', FieldByName('COFINS').AsFloat ) + ' ';
      vObsAux := vObsAux + 'Tx.Siscomex R$ ' + FormatFloat ( '###,###,###,##0.00', FieldByName('TX_SISCOMEX').AsFloat ) + ' ';
      vObsAux := vObsAux + 'Total R$ '       + FormatFloat ( '###,###,###,##0.00', vTotal) + ' ';
      vObsAux := vObsAux + '(Base ICMS R$ '  + FormatFloat ( '###,###,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat ) + ') ';
      vObsAux := vObsAux + 'AFRMM R$ '   + FormatFloat('###,###,###,##0.00', vSomaValorAfrmmItem);
    end;

    vRefCli := 'S/REF: ';

    SQL.Clear;
    SQL.Add('SELECT DISTINCT CD_REFERENCIA FROM (');
    SQL.Add('SELECT TOP 5 (RTRIM(LTRIM(CD_REFERENCIA))+''/''+RTRIM(LTRIM(NR_ITEM_PO))) CD_REFERENCIA');
    SQL.Add('FROM TREF_CLIENTE R');
    SQL.Add('LEFT JOIN TPROCESSO P ON P.NR_PROCESSO = R.NR_PROCESSO');
    SQL.Add('LEFT JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO');
    SQL.Add('WHERE R.NR_PROCESSO = ' + QuotedStr(pProcesso) + '  AND R.TP_REFERENCIA = G.TP_PEDIDO_BUSCA');
    SQL.Add('ORDER BY NR_SEQUENCIA');
    SQL.Add(') SUB');
    Prepare;
    Open;
    while not EOF do
    begin
      vRefCli := vRefCli + Trim( FieldByName('CD_REFERENCIA').AsString );
      Next;
      if not EOF then vRefCli := vRefCli + ', '
    end;
    vRefCli := vRefCli + ' - ';
    Close;
    vRefCli := vRefCli + vObsAux;

    TXTSaida.Add('if( ( document.getElementById("txtObs") != null ) ){');
    TXTSaida.Add('    document.getElementById("txtObs").value = "');
    with TMemo.Create(nil) do
    begin
      Parent := frm_icms_online;
      WordWrap := False;
      WantReturns := False;
      Visible := False;
      Lines.Add(vRefCli);
      for i := 0 to Lines.Count - 1 do
        TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + Lines.Strings[i] + ' ';
      Free;
    end;
    TXTSaida.Strings[TXTSaida.Count-1] := TXTSaida.Strings[TXTSaida.Count-1] + '";';
    TXTSaida.Add('}');

    Close;
    Free;
  end;

  TXTSaida.SaveToFile(ExtractFilePath(Application.ExeName)+'\'+'myFunctions2.js');  // aletrar quando terminar - tirar o numero 2 - michel

  with Tfrm_Web.Create(Application) do
  begin
    AfterExecuteScript := DoAfterExecuteScriptICMS;
    Navegar('https://www3.fazenda.sp.gov.br/simp', TXTSaida);
  end;
  TXTSaida.Free;

  //ExecFile(ExtractFilePath(Application.ExeName)+'\myICMS.hta',frm_icms_online.Handle);
end;

procedure Tfrm_icms_online.DBGrid4DblClick(Sender: TObject);
var
  vStatus, vNrProcesso : String;
begin
  if (datm_icms_online.qry_processos_cat63_exoneracao_IN_EXONERACAO.AsString = '2') then
  begin
    BoxMensagem('Procedimento não permitido! Exoneração já impressa!', 2);
    Exit;
  end;

  if (datm_icms_online.qry_processos_cat63_exoneracao_IN_EXONERACAO.AsString = '1') then
    vStatus := '0'
  else
    vStatus := '1';

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.CLear;
    SQL.Add('UPDATE TPROCESSO_STATUS_ICMS');
    SQL.Add('SET IN_EXONERACAO = :STATUS');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
    ParamByName('STATUS').AsString := vStatus;
    ParamByName('NR_PROCESSO').AsString := datm_icms_online.qry_processos_cat63_exoneracao_NR_PROCESSO.AsString;
    ExecSQL;
    Free;
  end;

  vNrProcesso := datm_icms_online.qry_processos_cat63_exoneracao_NR_PROCESSO.AsString;
  Atualiza_Tela_ICMS;
  datm_icms_online.qry_processos_cat63_exoneracao_.Locate('NR_PROCESSO', vNrProcesso, []);
end;

procedure Tfrm_icms_online.DBGrid5DblClick(Sender: TObject);
var
  vStatus, vNrProcesso : String;
begin
  if (datm_icms_online.qry_processos_cat63_icms_IN_ICMS_EMITIDO.AsString = '2') then
  begin
    BoxMensagem('Procedimento não permitido! ICMS já impresso!', 2);
    Exit;
  end;

  if (datm_icms_online.qry_processos_cat63_icms_IN_ICMS_EMITIDO.AsString = '1') then
    vStatus := '0'
  else
    vStatus := '1';

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.CLear;
    SQL.Add('UPDATE TPROCESSO_STATUS_ICMS');
    SQL.Add('SET IN_ICMS_EMITIDO = :STATUS');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
    ParamByName('STATUS').AsString := vStatus;
    ParamByName('NR_PROCESSO').AsString := datm_icms_online.qry_processos_cat63_icms_NR_PROCESSO.AsString;
    ExecSQL;
    Free;
  end;

  vNrProcesso := datm_icms_online.qry_processos_cat63_icms_NR_PROCESSO.AsString;
  Atualiza_Tela_ICMS;
  datm_icms_online.qry_processos_cat63_icms_.Locate('NR_PROCESSO', vNrProcesso, []); 
end;

function Tfrm_icms_online.VerificaMarinhaMercante(pNr_processo : string) : Boolean;
//Função que verifica se o grupo da empresa é obrigatório que possua o
//Item "Marinha Mercante" incluído na tabela TSOLIC_PAGTO
begin
//Ocorrência : 04551-08
  if (Copy(pNr_Processo,5,2) = 'IE') or (Copy(pNr_processo,5,2) = 'IN')then
  begin
    Result := False;
    Exit;
  end;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Clear;
    // Query alterada para verificar a flag da empresa - Michel - 08/11/2011
    Sql.Add('SELECT S.CD_VIA_TRANSPORTE, ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS');
    Sql.Add('FROM TGRUPO G, TPROCESSO P, VW_SERVICO_GERAL S, TEMPRESA_NAC E');
    Sql.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
    Sql.Add('  AND G.CD_GRUPO    = P.CD_GRUPO');
    Sql.Add('  AND P.CD_SERVICO  = S.CD_SERVICO');
    Sql.Add('  AND E.CD_EMPRESA  = P.CD_CLIENTE');
    ParamByName('NR_PROCESSO').AsString := pNr_processo;
    Open;
    if (FieldByName('IN_MARINHA_MERCANTE_ICMS').AsString = '1') and (FieldByName('CD_VIA_TRANSPORTE').AsString = '01')then
      Result := True
    else
      Result := False;
    Close;
    Free;
  end;
end;

procedure Tfrm_icms_online.BtnGerarClick(Sender: TObject);
//var
//  pHnd : HWND;
begin
//  if combo_tipo_icms.ItemIndex < 2 then
//  begin
//    Application.CreateForm(Tfrm_Web, frm_Web);
//    with frm_Web do
//    begin
//      AcceptNewWindow := False;
//      OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_RJ;
//      Navegar('http://www1.fazenda.rj.gov.br/projetoGCTBradesco/br/gov/rj/sef/gct/web/emitirdocumentoarrecadacao/DocumentoArrecadacaoController.jpf');
//    end;
//    VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
//  end;


  if combo_tipo_icms.ItemIndex < 2 then
  begin
    //Gera um arquivo INI e abre o ChromiumBrowser por fora lendo esse INI
    GeraArqDadosIcms('RJ');
    ShellExecute(handle,'open',PChar('C:\DDBROKER\ChromiumBrowserBroker\ChromiumBrowserBroker.exe'), '','',SW_SHOWNORMAL);
    AguardaImpressaoIcmsChromium;
    VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
  end;

end;

procedure Tfrm_icms_online.GeraDARJ(const pTipo : string);
var
  vPrograma, vAtiva : THandle;
  vInformacoesComp : string;

  procedure TeclaTab;
  begin
    Delay(100);
    keybd_event(VK_TAB, 0, 0, 0);
  end;

  procedure TeclaAltShiftC;
  begin
    //pressiona e segura o ALT
    keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    //pressiona e segura o SHIFT
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    //pressiona o C
    keybd_event(Ord(67), 0, 0, 0);
    //solta tecla
    keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;

  procedure TeclaAltShiftE;
  begin
    //pressiona e segura o ALT
    keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    //pressiona e segura o SHIFT
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    //pressiona o E
    keybd_event(Ord(69), 0, 0, 0);
    //solta tecla
    keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;


  procedure TeclaCtrlTab;
  begin
    //Pressiona e segura o CTRL
    keybd_event(VK_CONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_TAB, 0, 0, 0);
    //solta tecla
    keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;

  procedure TeclaAltG;
  begin
    //pressiona e segura o ALT
    keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    //pressiona o G(Gerar)
    keybd_event(Ord(71), 0, 0, 0);
    //solta tecla
    keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;

begin
  try
    //BlockInput(True); //trava teclado/mouse
    ActiveControl := nil;
    WinExec('C:\Arquivos de programas\SEF\DARJ - SEF - RJ\DownDarj.exe',SW_RESTORE);
    vPrograma := FindWindow(nil,PChar('Documento de Arrecadação - DARJ'));
    repeat
      vAtiva := GetForegroundWindow;
      Application.ProcessMessages;
      SetForegroundWindow(vPrograma);
    until vAtiva = vPrograma;
    if vPrograma <> 0 then
    begin
      //Caso exista registro, apaga....
      TeclaAltShiftE;
      keybd_event(Ord(83), 0, 0, 0);  //S
      keybd_event(Ord(89), 0, 0, 0);  //Y
      Delay(200);

      //pressiona e segura o ALT
      keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
      keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
      //pressiona o I

      TeclaTab;
      TeclaTab;
      Delay(100);
      keybd_event(Ord(73), 0, 0, 0);
      //solta tecla
      keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);

      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.CLear;
        SQL.Add('select B.AP_EMPRESA, B.CGC_EMPRESA, B.IE_EMPRESA, B.END_EMPRESA, B.END_NUMERO, ');
        SQL.Add('B.END_CIDADE, B.END_CEP, C.NR_DECLARACAO_IMP, C.VL_TOTAL_II, C.VL_TOTAL_IPI, ');
        SQL.Add('C.VL_TOTAL_TX_SCX');
        SQL.Add('from TPROCESSO A, TEMPRESA_NAC B, TDECLARACAO_IMPORTACAO C');
        SQL.Add('WHERE');
        SQL.Add('   A.NR_PROCESSO =:NR_PROCESSO and A.CD_CLIENTE = B.CD_EMPRESA AND');
        SQL.Add('   C.NR_PROCESSO = A.NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString := datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString;
        Open;

        TeclaTab;
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('IE_EMPRESA').AsString));
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('AP_EMPRESA').AsString));
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('CGC_EMPRESA').AsString));
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('END_EMPRESA').AsString));
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('END_CIDADE').AsString));
        TeclaTab;
        PreencheCampo(UpperCase(FieldByName('END_CEP').AsString));

        Delay(500);
        TeclaTab;
        TeclaAltShiftC;
        Delay(100);
        //Volta para a aba "DADOS DARJ"
        TeclaCtrlTab;
        TeclaTab;

        if pTipo = 'I' then     //ICMS IMPORTACAO
        begin
          Delay(100);
          keybd_event(Ord(50), 0, 0, 0);    //aperta o 2 para posicionar o combo no 024-8
          Delay(100);
          keybd_event(VK_RETURN, 0, 0, 0);
          Delay(100);
          keybd_event(VK_RETURN, 0, 0, 0);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          Delay(100);
          keybd_event(VK_UP, 0, 0, 0);
          TeclaTab;
        end
        else //ICMS FECP
        begin
          Delay(100);
          keybd_event(Ord(55), 0, 0, 0);    //aperta o 2 para posicionar o combo no 024-8
          Delay(100);
          keybd_event(VK_RETURN, 0, 0, 0);
          Delay(100);
          keybd_event(VK_RETURN, 0, 0, 0);
        end;

        //Preenche Documento Origem
        PreparaTab_Main;
        if pTipo = 'I' then     //ICMS IMPORTACAO
        begin
          PreencheCampo(FieldByName('NR_DECLARACAO_IMP').AsString);
          TeclaTab;
          PreencheCampo(Copy(FormatDateTime('mm',msk_vencimento.Date),1,3) + '/' + FormatDateTime('yyyy',msk_vencimento.Date));
          TeclaTab;
          PreencheCampo(FormatDateTime('dd/mm/yyyy',msk_vencimento.Date));
          TeclaTab;
          PreencheCampo(FormatDateTime('dd/mm/yyyy',Date));
          TeclaTab;
          ColaTexto((FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_TOT_ICMS').AsFloat -
                                            (TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat *
                                            (StrToFloat(ConsultaLookup('TPARAMETROS','"bla"','bla',
                                            'PC_FUNDO_POBREZA_RJ')) / 100 )))));
        end
        else   //ICMS FECP
        begin
          TeclaTab;
          PreencheCampo('0248');
          TeclaTab;
          PreencheCampo(Copy(FormatDateTime('mm',msk_vencimento.Date),1,3) + '/' + FormatDateTime('yyyy',msk_vencimento.Date));
          TeclaTab;
          PreencheCampo(FormatDateTime('dd/mm/yyyy',msk_vencimento.Date));
          TeclaTab;
          PreencheCampo(FormatDateTime('dd/mm/yyyy',Date));
          TeclaTab;
          ColaTexto(FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat *
                   (StrToFloat(ConsultaLookup('TPARAMETROS','"bla"','bla','PC_FUNDO_POBREZA_RJ')) / 100 )) + '');
        end;

        TeclaTab;
        vInformacoesComp := 'REF ' + datm_icms_online.qry_lista_processos_calc_NR_PROCESSO.AsString                                        + ' - ';
        vInformacoesComp := vInformacoesComp + 'CIF '         + FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat)         + ' - ';
        vInformacoesComp := vInformacoesComp + 'II '          + FormatFloat('#,##0.00', FieldByName('VL_TOTAL_II').AsFloat)                + ' - ';
        vInformacoesComp := vInformacoesComp + 'IPI '         + FormatFloat('#,##0.00', FieldByName('VL_TOTAL_IPI').AsFloat)               + ' - ';
        vInformacoesComp := vInformacoesComp + 'TX SCX '      + FormatFloat('#,##0.00', FieldByName('VL_TOTAL_TX_SCX').AsFloat)            + ' - ';
        vInformacoesComp := vInformacoesComp + 'PIS '         + FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_PIS').AsFloat)            + ' - ';
        vInformacoesComp := vInformacoesComp + 'COFINS '      + FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_COFINS').AsFloat)         + ' - ';
        vInformacoesComp := vInformacoesComp + 'VL TRIB '     + FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat          +
                                                                                        TAB_MAIN.FieldByName('VL_TOTAL_II').AsFloat        +
                                                                                        TAB_MAIN.FieldByName('VL_TOTAL_IPI').AsFloat       +
                                                                                        TAB_MAIN.FieldByName('VL_TAXA_SISCOMEX').AsFloat   +
                                                                                        TAB_MAIN.FieldByName('VL_TOT_PIS_COFINS').AsFloat) + ' - ';

        vInformacoesComp := vInformacoesComp + 'BASE CALC '   + FormatFloat('#,##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat);
        ColaTexto(vInformacoesComp);
        TeclaAltG;  //Gerar DARJ

        Free;
      end;
      {if BoxMensagem('O processo " ' + TAB_MAIN.FieldByName('NR_PROCESSO').AsString + ' " foi emitido corretamente ?', 1) then
      begin
        //pressiona e segura o ALT
        keybd_event(VK_LMENU, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
        //pressiona e segura o SHIFT
        keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
        //pressiona o E
        keybd_event(Ord(69), 0, 0, 0);
        //solta tecla
        keybd_event(VK_LMENU, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
        keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
        Delay(100);
        keybd_event(VK_RETURN, 0, 0, 0);
      end; }
      BlockInput(False);

      {if MessageDlg('O processo " ' + TAB_MAIN.FieldByName('NR_PROCESSO').AsString + ' " foi emitido corretamente ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        try
          with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.CLear;
            SQL.Add( 'UPDATE TDECLARACAO_IMPORTACAO SET DT_ICMS_IMPRESSO = CONVERT(datetime,convert(varchar,getdate(),103),103), IN_ICMS_IMPRESSO = ''2''');
            SQL.Add( '  WHERE NR_PROCESSO = ' + QuotedStr( TAB_MAIN.FieldByName('NR_PROCESSO').AsString ) );
            ExecSQL;
            Free;
          end;
        except
          BoxMensagem( 'Erro na geração do Arquivo de ICMS', 2 );
        end;
      end;}
      VerificaImpressao(TAB_MAIN.FieldByName('NR_PROCESSO').AsString);
    end;
  finally
    BlockInput(False);
  end;
end;

procedure Tfrm_icms_online.mnuICMSImportacaoClick(Sender: TObject);
begin
  if VerificaInscEstadualCnpj(datm_icms_online.qry_lista_processos_CD_IMPORTADOR.AsString) then
    GeraDARJ('I');
end;

procedure Tfrm_icms_online.mnuFundodeCombateClick(Sender: TObject);
begin
  with Tfrm_Web.Create(Application) do
  begin
    OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_RJ;
    Navegar('http://www1.fazenda.rj.gov.br/projetoGCTBradesco/br/gov/rj/sef/gct/web/emitirdocumentoarrecadacao/DocumentoArrecadacaoController.jpf');
  end;
  VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
end;

function Tfrm_icms_online.VerificaInscEstadualCnpj(pCd_Empresa: string): Boolean;
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Add('select IE_EMPRESA, CGC_EMPRESA from TEMPRESA_NAC');
    Sql.Add('where');
    Sql.Add('CD_EMPRESA =:CD_EMPRESA');
    ParamByName('CD_EMPRESA').AsString := pCd_Empresa;
    Open;
    if FieldByName('IE_EMPRESA').AsString = '' then
    begin
      BoxMensagem('O campo "Inscrição Estadual" da empresa precisa estar preenchido para gerar o DARJ', 3);
      Result := False;
      Free;
      Exit;
    end
    else if FieldByName('CGC_EMPRESA').AsString = '' then
    begin
      BoxMensagem('O campo "CGC" da empresa precisa estar preenchido para gerar o DARJ', 3);
      Result := False;
      Free;
      Exit;
    end
    else
      Result := True;
    Free;
  end;
end;

procedure Tfrm_icms_online.VerificaImpressao(pProcesso: String);
begin
  if MessageDlg('O processo " ' + pProcesso + ' " foi emitido corretamente ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      try
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.CLear;
          if (combo_tipo_icms.ItemIndex = 0) or (combo_tipo_icms.ItemIndex = 1) then
          begin
            SQL.Add('UPDATE TDECLARACAO_IMPORTACAO');
            SQL.Add('SET DT_ICMS_IMPRESSO = :DATA,');
            SQL.Add('    IN_ICMS_IMPRESSO = ''2''');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
          end
          else if (combo_tipo_icms.ItemIndex = 2) then
          begin
            SQL.Add('UPDATE TDECLARACAO_IMPORTACAO');
            SQL.Add('SET DT_EXON_IMPRESSO = :DATA,');
            SQL.Add('    IN_EXON_IMPRESSO = ''2''');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
          end
          else if (combo_tipo_icms.ItemIndex = 3) then
          begin
            SQL.Add(' UPDATE TPROCESSO_STATUS_ICMS                 ');
            SQL.Add(' SET IN_ICMS_EMITIDO = CASE IN_ICMS_EMITIDO   ');
            SQL.Add('                           WHEN "1" THEN "2"  ');
            SQL.Add('                       ELSE IN_ICMS_EMITIDO   ');
            SQL.Add('                       END,                   ');
            SQL.Add('     IN_EXONERACAO   = CASE IN_EXONERACAO     ');
            SQL.Add('                           WHEN "1" THEN "2"  ');
            SQL.Add('                       ELSE IN_EXONERACAO     ');
            SQL.Add('                       END                    ');
            SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO             ');
            ParamByName('NR_PROCESSO').AsString := pProcesso;
            ExecSQL;
            Exit;
            // Foi alterado o update para que seja feito diretamente na TPROCESSO_STATUS_ICMS - Michel - 30/06/2009

            // Atualizava também o IN_ICMS_IMPRESSO - Michel - 29/06/2009

            // Se a Exoneração já foi emitida então é ICMS, se não é Exoneração - Michel - 29/06/2009
            {if ConsultaLookUp('TPROCESSO_STATUS_ICMS', 'NR_PROCESSO', TAB_MAIN.FieldByName('NR_PROCESSO').AsString, 'IN_EXONERACAO') = '2' then
            begin
              SQL.Add('UPDATE TPROCESSO_STATUS_ICMS');
              SQL.Add('SET IN_ICMS_EMITIDO = ''1''');
              SQL.Add('WHERE NR_PROCESSO = ''' + pProcesso + '''');
              ExecSQL;
              SQL.CLear;
              SQL.Add('UPDATE TDECLARACAO_IMPORTACAO');
              SQL.Add('SET DT_ICMS_IMPRESSO = :DATA');
              SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
              // Atualizava também o IN_ICMS_IMPRESSO - Michel - 29/06/2009
            end
            else
            begin
              SQL.Add('UPDATE TPROCESSO_STATUS_ICMS');
              SQL.Add('SET IN_EXONERACAO = ''1''');
              SQL.Add('WHERE NR_PROCESSO = ''' +  pProcesso + '''');
              ExecSQL;
              SQL.CLear;
              SQL.Add('UPDATE TDECLARACAO_IMPORTACAO');
              SQL.Add('SET DT_EXON_IMPRESSO = :DATA');
              SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
              // Atualizava também o IN_EXON_IMPRESSO - Michel - 29/06/2009
            end;}
          end;
          ParamByName('DATA').AsDate          := dt_server;
          ParamByName('NR_PROCESSO').AsString := pProcesso;
          ExecSQL;
          Free;
        end;
      except
        on E: Exception do
          BoxMensagem('Erro na atualização do status de ICMS do processo.'#13 + E.Message, 2);
      end;
    end;
end;

function Tfrm_icms_online.GetTributacao: integer;
var
  vTributacao: Integer;
begin
  vTributacao := 0;
  case combo_tipo_icms.ItemIndex of
    0: vTributacao := 1;
    1: vTributacao := 1;
    2: vTributacao := 3;
    3: vTributacao := 3;
  end;
  result := vTributacao;
end;

procedure Tfrm_icms_online.GetDadosEmissaoIcms;
var
  NRProc: String;
begin
  with datm_icms_online do
  begin
    PreparaTab_Main;
    NRProc := TAB_MAIN.FieldByName('NR_PROCESSO').AsString;
    if (Dados_Emissao_Icms.NR_PROCESSO = '') OR (Dados_Emissao_Icms.NR_PROCESSO <> NRProc) then
    begin
      with Dados_Emissao_Icms do
      begin
        with qry_Consulta_DI_ICMS do
        begin
          ParamByName('NR_PROCESSO').Value := NRProc;
          ParamByName('TIPO_ICMS_INDEX').Value := combo_tipo_icms.ItemIndex;
          ParamByName('ICMS_TRIBUTACAO').Value := GetTributacao;
          Open;
          try
            {Add Campos resultado do select à Lista}
            NM_EMPRESA         := FieldByName('NM_EMPRESA').AsString;
            CGC                := FieldByName('CGC_EMPRESA').AsString;
            IE                 := FieldByName('IE_EMPRESA').AsString;
            IN_IE              := FieldByName('IN_IE').AsInteger;
            ENDERECO           := FieldByName('ENDERECO').AsString;
            BAIRRO             := FieldByName('END_BAIRRO').AsString;
            CIDADE             := FieldByName('END_CIDADE').AsString;
            IBGE_CIDADE        := FieldByName('IBGE_CIDADE').AsString;
            COD_TOM_PR         := FieldByName('COD_TOM_CIDADE_PR').AsString;
            UF                 := FieldByName('END_UF').AsString;
            CEP                := FieldByName('END_CEP').AsString;
            TELEFONE           := FieldByName('NR_TELEFONE').AsString;
            NR_DI              := FieldByName('NR_DECLARACAO_IMP').AsInteger;
            DT_REGISTRO_DI     := FieldByName('DT_REGISTRO_DI').Value;
            REF_CLIENTE        := FieldByName('REF_CLIENTE').Value;
            VL_FISCAL          := FieldByName('VL_FISCAL').Value;
            VL_ICMS_AFRMM      := FieldByName('VL_ICMS_AFRMM').Value; //Será alterado se tiver armazenagem
            PC_ICMS            := FieldByName('PC_ICMS').Value;
            II                 := FieldByName('II').Value;
            IPI                := FieldByName('IPI').Value;
            AD                 := FieldByName('AD').Value;
            MCV                := FieldByName('MCV').Value;
            VL_FRETE           := FieldByName('VL_FRETE').Value;
            VL_SEGURO          := FieldByName('VL_SEGURO').Value;
            PIS                := FieldByName('PIS').Value;
            COFINS             := FieldByName('COFINS').Value;
            TX_SISCOMEX        := FieldByName('TX_SISCOMEX').Value;
            VL_BASE_CALC_ICMS  := FieldByName('VL_BASE_CALC_ICMS').Value; //Será alterado se tiver armazenagem
            VL_AFRMM_ITEM      := FieldByName('VL_AFRMM_ITEM').Value;
            VL_FECP            := FieldByName('VL_FECP').Value;
            VL_TOTAL           := (VL_FISCAL + II + IPI + AD + PIS + COFINS + TX_SISCOMEX + VL_AFRMM_ITEM);
          finally
            Close;
          end;
        end;
        {Add Campos Personalizados à Lista}
        NR_PROCESSO        := NRProc;
        OBS                := GetObs;
      end;
    end;
  end;
end;

function Tfrm_icms_online.RetScriptOutrasUFs: TStringList;
var
  vScript: TStringList;
begin
  with Dados_Emissao_Icms do
  begin
    vScript := TStringList.Create;
    vScript.add('if (document.getElementById("ufFavorecida") != null) {' + #13#10 +
                'document.getElementById("ufFavorecida").value = "'+UF+'";' + #13#10 +
                '	$("#ufFavorecida").change(Gnre.limparTela(), Gnre.carregarReceitas(document.getElementById("ufFavorecida").value));' + #13#10 +
                '}' + #13#10 +
                'if (document.getElementById("receita") != null) {' + #13#10 +
                '	document.getElementById("receita").value = "100056";' + #13#10 +
                '	$("#receita").change();' + #13#10 +
                '}');
    if IN_IE = 1 then
    begin
      vScript.Add('if (document.getElementById("optInscrito") != null) {' + #13#10 +
                  '	document.getElementById("optInscrito").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("inscricaoEstadualEmitente") != null) {' + #13#10 +
                  '	document.getElementById("inscricaoEstadualEmitente").value = "'+IE+'"' + #13#10 +
                  '}');
    end else
    begin
      vScript.Add('if (document.getElementById("optNaoInscrito") != null) {' + #13#10 +
                  '	document.getElementById("optNaoInscrito").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("tipoCNPJ") != null) {' + #13#10 +
                  '	document.getElementById("tipoCNPJ").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("documentoEmitente") != null) {' + #13#10 +
                  '	document.getElementById("documentoEmitente").value = "'+CGC+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("razaoSocialEmitente") != null) {' + #13#10 +
                  '	document.getElementById("razaoSocialEmitente").value = "'+NM_EMPRESA+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("enderecoEmitente") != null) {' + #13#10 +
                  '	document.getElementById("enderecoEmitente").value = "'+ENDERECO+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("ufEmitente") != null) {' + #13#10 +
                  '	document.getElementById("ufEmitente").value = "'+UF+'"' + #13#10 +
                  '	$("#ufEmitente").change();' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("municipioEmitente") != null) {' + #13#10 +
                  '	document.getElementById("municipioEmitente").value = "'+IBGE_CIDADE+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("cepEmitente") != null) {' + #13#10 +
                  '	document.getElementById("cepEmitente").value = "'+CEP+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("telefoneEmitente") != null) {' + #13#10 +
                  '	document.getElementById("telefoneEmitente").value = "'+TELEFONE+'"' + #13#10 +
                  '}');
    end;
    vScript.add('if (document.getElementById("tipoDocOrigem") != null) {' + #13#10 +
                '	document.getElementById("tipoDocOrigem").value = "04"' + #13#10 +
                '	$("#tipoDocOrigem").change();' + #13#10 +
                '}' + #13#10 +
                'if (document.getElementById("documentoOrigem") != null) {' + #13#10 +
                '	document.getElementById("documentoOrigem").value = "'+IntToStr(NR_DI)+'"' + #13#10 +
                '}' + #13#10 +
                'if (document.getElementById("dataVencimento") != null) {' + #13#10 +
                '	document.getElementById("dataVencimento").value = "'+FormatDateTime('dd/mm/yyyy', msk_vencimento.date)+'"' + #13#10 +
                '}' + #13#10 +
                'if (document.getElementById("dataPagamento") != null) {' + #13#10 +
                '	document.getElementById("dataPagamento").value = "'+FormatDateTime('dd/mm/yyyy', msk_vencimento.date)+'"' + #13#10 +
                '}' + #13#10 +
                'if (document.getElementById("valorPrincipal") != null) {' + #13#10 +
                '	document.getElementById("valorPrincipal").value =  "'+FloatToStr(VL_ICMS_AFRMM)+'"' + #13#10 +
                '}');
    if IN_IE = 1 then
    begin
      vScript.Add('if (document.getElementById("optInscritoDest") != null) {' + #13#10 +
                  '  document.getElementById("optInscritoDest").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("inscricaoEstadualDestinatario") != null) {' + #13#10 +
                  '  document.getElementById("inscricaoEstadualDestinatario").value = "'+IE+'"' + #13#10 +
                  '}');
    end else
    begin
      vScript.Add('if (document.getElementById("optNaoInscritoDest") != null) {' + #13#10 +
                  '  document.getElementById("optNaoInscritoDest").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("tipoCNPJDest") != null) {' + #13#10 +
                  '  document.getElementById("tipoCNPJDest").click()' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("documentoDestinatario") != null) {' + #13#10 +
                  '  document.getElementById("documentoDestinatario").value = "'+CGC+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("razaoSocialDestinatario") != null) {' + #13#10 +
                  '  document.getElementById("razaoSocialDestinatario").value = "'+NM_EMPRESA+'"' + #13#10 +
                  '}' + #13#10 +
                  'if (document.getElementById("municipioDestinatario") != null) {' + #13#10 +
                  '  document.getElementById("municipioDestinatario").value = "'+IBGE_CIDADE+'"' + #13#10 +
                  '}');
    end;
    vScript.add('if (document.getElementById("captcha") != null) {' + #13#10 +
                '  document.getElementById("captcha").focus()' + #13#10 +
                '}');
    Result := vScript;
  end;
end;

procedure Tfrm_icms_online.DoOnWebDocumentDARJ_GNRE_OutrasUFs(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  vTimer: TTimer;
  Document: OleVariant;
  FormBrowser: Tfrm_web;
  Browser: TWebBrowser;
begin
  FormBrowser := Tfrm_web(Sender);
  Browser := FormBrowser.WebBrowser1;
  if (Sender = nil) or VarIsNull(Browser.OleObject) or VarIsEmpty(Browser.OleObject) or
     VarIsNull(Browser.OleObject.document) or VarIsEmpty(Browser.OleObject.document) then
    Exit;

  Document := Browser.OleObject.document;
  if SameText(Browser.LocationURL, 'http://www.gnre.pe.gov.br/gnre/portal/GNRE_Principal.jsp') then
    Document.getElementsByClassName('btn-block tooltip').item(0).click()
  else if SameText(Browser.LocationURL, 'http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp') then
    FormBrowser.tmrAux.Enabled := True;
end;

procedure Tfrm_icms_online.DoOnWebDocumentDARJ_GNRE_RJ(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  vInformacoesComp: String;
  NRProc, IE, CNPJ, NRDI: String;
  Document: OleVariant;
  I: Integer;
  Browser: TWebBrowser;
  vFormWeb: Tfrm_web;
  function AssignedVariant(AVar: OleVariant): Boolean;
  begin
    Result := not (VarIsNull(AVar) or VarIsEmpty(AVar));
  end;

  procedure Esperar;
  begin
    I := 0;
    while i < 20 do
    begin
      Sleep(100);
      Application.ProcessMessages;
      inc(i);
    end;
  end;

begin
  // Sai se o documento não estiver pronto - Michel - 29/05/2012
  vFormWeb := Tfrm_web(Sender);
  Browser := vFormWeb.WebBrowser1;
  if (Sender = nil) or VarIsNull(Browser.OleObject) or VarIsEmpty(Browser.OleObject) or
     VarIsNull(Browser.OleObject.document) or VarIsEmpty(Browser.OleObject.document) then
    Exit;

  Document := Browser.OleObject.document;

  if SameText(ExtractFileName(StringReplace(Browser.LocationURL, '/', '\', [rfReplaceAll])), 'incluirDebito.do') or
     SameText(ExtractFileName(StringReplace(Browser.LocationURL, '/', '\', [rfReplaceAll])), 'transfereDadosDebitos.do') then
    Exit;

  //ShowMessage(TWebBrowser(Sender).LocationURL)

  // Sai se o tipo de pagamento não existe - Michel
  if VarIsNull(Document.getElementById('tipoPagamentoLista')) or VarIsEmpty(Document.getElementById('tipoPagamentoLista')) then
    Exit;
  Browser.Silent := True;

  NRProc := datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString;
  with TQuery.Create(Application) do
  begin
    try
      DatabaseName := 'DBBROKER';
      SQL.Clear;

      SQL.Add('SELECT DI.NR_PROCESSO, DI.NR_DECLARACAO_IMP, EN.IE_EMPRESA, EN.CGC_EMPRESA');
      SQL.Add('FROM TDECLARACAO_IMPORTACAO DI');
      SQL.Add('   INNER JOIN TEMPRESA_NAC  EN ON EN.CD_EMPRESA = DI.CD_IMPORTADOR');
      SQL.Add('WHERE DI.NR_PROCESSO = ' + QuotedStr(NRProc));
      Open;
      IE   := FieldByName('IE_EMPRESA').AsString;
      CNPJ := FieldByName('CGC_EMPRESA').AsString;
      NRDI := FieldByName('NR_DECLARACAO_IMP').AsString;

      Esperar;
      // Tipo de Pagamento
      try
        Document.getElementById('tipoPagamentoLista').value := '1';
        Document.getElementById('tipoPagamentoLista').onchange();
        Application.ProcessMessages;
      except
        Exit;
      end;

      PreparaTab_Main;

      Esperar;
      // Tipo de Documento
      try
        if combo_tipo_icms.ItemIndex = 0 then
          //Document.getElementById('rdgDarj').click() // Comentado porque não precisa clicar - Michel - 16/05/2012
        else
          Document.getElementById('rdgGnre').click();
      except
      end;

      Document.getElementById('txtDataPagamento').value := FormatDateTime('dd/mm/yyyy', msk_vencimento.Date); // Data de Pagamento

      Esperar;
      Document.getElementById('slcNaturezaLista').value := '5';
      try
        vFormWeb.ExecutaScript('jQuery(''#slcNaturezaLista'')[0].onchange();', 'javascript');
      except
        //Não mostrar o erro para o usuário
      end;

      Document.getElementById('txtCnpjCpf').value := CNPJ;
      Document.getElementById('btnConfirmar').click();

  //    if Trim(Document.getElementById('txtNomeRazaoSocial').value) <> '' then

      Document.getElementById('rdgTipoImportacaoDI').checked := True;          // Tipo Importação
      Document.getElementById('txtNumDocImportacao').value := NRDI;            // Nº do Documento
      Document.getElementById('txtDataFatoGerador').value := FormatDateTime('dd/mm/yyyy',msk_data_base.Date);  // Data Fato Gerador
      Document.getElementById('txtDataVencimento').value := FormatDateTime('dd/mm/yyyy', msk_vencimento.Date); // Data Vencimento

      // Informações Complementares
      SQL.CLear;
      SQL.Add('SELECT B.AP_EMPRESA, B.CGC_EMPRESA, B.IE_EMPRESA, B.END_EMPRESA, B.END_NUMERO, ');
      SQL.Add('       B.END_CIDADE, B.END_CEP, C.NR_DECLARACAO_IMP, C.VL_TOTAL_II, C.VL_TOTAL_IPI, ');
      SQL.Add('       C.VL_TOTAL_TX_SCX');
      SQL.Add('FROM TPROCESSO A, TEMPRESA_NAC B, TDECLARACAO_IMPORTACAO C');
      SQL.Add('WHERE A.NR_PROCESSO = ''' + NRProc + '''');
      SQL.Add('  AND A.CD_CLIENTE  = B.CD_EMPRESA');
      SQL.Add('  AND C.NR_PROCESSO = A.NR_PROCESSO');
      Open;

      vInformacoesComp := 'S/REF:' + ConsultaLookUPSQL(' SELECT TOP 1 CD_REFERENCIA' +
                                                       ' FROM TREF_CLIENTE ' +
                                                       ' WHERE NR_PROCESSO = ''' + NRProc + '''' +
                                                       '   AND TP_REFERENCIA = ''01''' +
                                                       ' ORDER BY NR_SEQUENCIA', 'CD_REFERENCIA');
      vInformacoesComp := vInformacoesComp + '- N/REF:' + datm_icms_online.qry_lista_processos_calc_NR_PROCESSO.AsString                                    + ' ';
      vInformacoesComp := vInformacoesComp + 'CIF '         + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat)         + ' ';
      vInformacoesComp := vInformacoesComp + 'II '          + FormatFloat('##0.00', FieldByName('VL_TOTAL_II').AsFloat)                + ' ';
      vInformacoesComp := vInformacoesComp + 'IPI '         + FormatFloat('##0.00', FieldByName('VL_TOTAL_IPI').AsFloat)               + ' ';
      vInformacoesComp := vInformacoesComp + 'TX SCX '      + FormatFloat('##0.00', FieldByName('VL_TOTAL_TX_SCX').AsFloat)            + ' ';
      vInformacoesComp := vInformacoesComp + 'PIS '         + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_PIS').AsFloat)            + ' ';
      vInformacoesComp := vInformacoesComp + 'COFINS '      + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_COFINS').AsFloat)         + ' ';
      vInformacoesComp := vInformacoesComp + 'VL TRIB '     + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat          +
                                                                                    TAB_MAIN.FieldByName('VL_TOTAL_II').AsFloat        +
                                                                                    TAB_MAIN.FieldByName('VL_TOTAL_IPI').AsFloat       +
                                                                                    TAB_MAIN.FieldByName('VL_TAXA_SISCOMEX').AsFloat   +
                                                                                    TAB_MAIN.FieldByName('VL_TOT_PIS_COFINS').AsFloat) + ' ';

      if Sender = mnuFundodeCombate then // Fundo de Pobreza
        vInformacoesComp := vInformacoesComp + 'BASE CALC '   + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS_FUNDO').AsFloat)
      else
        vInformacoesComp := vInformacoesComp + 'BASE CALC '   + FormatFloat('##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat);

      Document.getElementById('txtJustificativa').value := vInformacoesComp;

      {********** ICMS **********}

      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(CASE ISNULL(DI.IN_CALCULOU_COM_AFRMM, 0)');
      SQL.Add('               WHEN 1 THEN VL_ICMS_A_RECOLHER_AFRMM');
      SQL.Add('           ELSE VL_ICMS_A_RECOLHER');
      SQL.Add('           END) VL_ICMS, ROUND(SUM(CASE ISNULL(AI.IN_FUNDO_POBREZA, 0)');
      SQL.Add('                                       WHEN 1 THEN (CASE ISNULL(DI.IN_CALCULOU_COM_AFRMM, 0)');
      SQL.Add('                                                        WHEN 1 THEN VL_ICMS_A_RECOLHER_AFRMM');
      SQL.Add('                                                    ELSE VL_ICMS_A_RECOLHER');
      SQL.Add('                                                    END / AI.PC_ICMS) * P.PC_FUNDO_POBREZA_RJ');
      SQL.Add('                                   ELSE 0');
      SQL.Add('                                   END), 2) AS VL_FECP');
      SQL.Add('FROM TADICAO_DE_IMPORTACAO AI');
      SQL.Add('   INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = AI.NR_PROCESSO, TPARAMETROS P');
      SQL.Add('WHERE AI.NR_PROCESSO = ' + QuotedStr(NRProc));
      Open;

      // Informado
      Document.getElementById('txtIcmsInformado').value := FormatFloat('0.00', FieldByName('VL_ICMS').AsFloat);
      Document.getElementById('okIcms').click();

      //if combo_tipo_icms.ItemIndex = 0 then
      if FieldByName('VL_FECP').AsFloat > 0 then
      begin
        {********** FECP **********}

        // Informado
        Document.getElementById('txtFecpInformado').value := FormatFloat('0.00', FieldByName('VL_FECP').AsFloat);
        Document.getElementById('okFecp').click();
      end;
    finally
      Close;
      Free;
    end;
  end;
  ShowMessage('ATENÇÃO!!!' +#13#10+
              'Emissão de ICMS RJ em FASE DE TESTE!' +#13#10+
              'Favor conferir se todas as informações estão corretas antes de prosseguir.' +#13#10+
              'Se estiver faltando campos a serem preenchidos, favor fechar e tentar novamente.');
end;

procedure Tfrm_icms_online.DoAfterExecuteScriptICMS(Sender: TObject;
  const pDisp: IDispatch; const URL: OleVariant; var Language,
  Script: String);
var
  NRProc, NRAdicao: String;
  Document: OleVariant;
  vQuery: TQuery;
begin
  // Sai se o documento não estiver pronto - Michel - 29/05/2012
  if (Sender = nil) or VarIsNull(TWebBrowser(Sender).OleObject) or VarIsEmpty(TWebBrowser(Sender).OleObject) or
     VarIsNull(TWebBrowser(Sender).OleObject.document) or VarIsEmpty(TWebBrowser(Sender).OleObject.document) then
    Exit;

  Document := TWebBrowser(Sender).OleObject.document;

  if SameText(ExtractFileName(StringReplace(TWebBrowser(Sender).LocationURL, '/', '\', [rfReplaceAll])), 'incluirDebito.do') or
     SameText(ExtractFileName(StringReplace(TWebBrowser(Sender).LocationURL, '/', '\', [rfReplaceAll])), 'transfereDadosDebitos.do') then
    Exit;


  // Sai se o tipo de DI não existe - Michel
  if VarIsNull(Document.getElementById('ddlTipoAdicao')) or VarIsEmpty(Document.getElementById('ddlTipoAdicao')) or
     VarIsNull(Document.getElementById('txtNumAdicao')) or VarIsEmpty(Document.getElementById('txtNumAdicao')) then
    Exit;

  TWebBrowser(Sender).Silent := True;

  try
    NRProc := datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString;
    NRAdicao := Document.getElementById('txtNumAdicao').value;
  except
    Exit;
  end;

  vQuery := TQuery.Create(Application);
  vQuery.DatabaseName := 'DBBROKER';
  try
    {SQL.Add('SELECT CASE CD_TRIBUTACAO_ICMS');
    SQL.Add('           WHEN "5" THEN "1"');
    SQL.Add('           WHEN "6" THEN "4"');
    SQL.Add('           WHEN "7" THEN "2"');
    SQL.Add('           WHEN "3" THEN "3"');
    SQL.Add('       END DDL_CD_TRIBUTACAO_ICMS');
    SQL.Add('FROM TADICAO_DE_IMPORTACAO');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
    SQL.Add('  AND NR_ADICAO   = :NR_ADICAO');}

    vQuery.SQL.Add('SELECT CASE ISNULL(E.CD_TRIB, "")');
    vQuery.SQL.Add('           WHEN "" THEN CASE CD_TRIBUTACAO_ICMS');
    vQuery.SQL.Add('                            WHEN "4" THEN "2"');
    vQuery.SQL.Add('                            WHEN "5" THEN "2"');
    vQuery.SQL.Add('                            WHEN "6" THEN "5"');
    vQuery.SQL.Add('                            WHEN "7" THEN "3"');
    vQuery.SQL.Add('                            WHEN "3" THEN "4"');
    vQuery.SQL.Add('                            WHEN "6" THEN "6"');
    vQuery.SQL.Add('                        END');
    vQuery.SQL.Add('       ELSE E.CD_TRIB');
    vQuery.SQL.Add('       END AS DDL_CD_TRIBUTACAO_ICMS');
    vQuery.SQL.Add('FROM TADICAO_DE_IMPORTACAO AI');
    vQuery.SQL.Add('   LEFT JOIN TTP_EXONERACAO E ON E.CD_EX = AI.CD_FUND_LEGAL_ICMS');
    vQuery.SQL.Add('WHERE AI.NR_PROCESSO = :NR_PROCESSO');
    vQuery.SQL.Add('  AND AI.NR_ADICAO   = :NR_ADICAO');

    vQuery.ParamByName('NR_PROCESSO').AsString := NRProc;
    vQuery.ParamByName('NR_ADICAO').AsString := NRAdicao;
    vQuery.Open;

    // Tipo de DI
    //if (FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsString <> '') and (Document.getElementById('ddlTipoAdicao').value <> FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsInteger +1) then
    if (vQuery.FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsString <> '') and (Document.getElementById('ddlTipoAdicao').value <> vQuery.FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsInteger) then
      try
        //Document.getElementById('ddlTipoAdicao').value := FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsInteger +1;
        Document.getElementById('ddlTipoAdicao').value := vQuery.FieldByName('DDL_CD_TRIBUTACAO_ICMS').AsInteger;
        Document.parentWindow.execScript('setTimeout(''__doPostBack("ddlTipoAdicao","")'', 0)', 'javascript');
        Application.ProcessMessages;
      except
      end;
  finally
    vQuery.Free;
  end;
end;

procedure Tfrm_icms_online.EmiteIcmsOutrasUFs;
begin
  with Tfrm_Web.Create(Application) do
  begin
    if not ckbInSemAdicao.Checked then
    begin
      GetDadosEmissaoIcms;    
      ExecTimmerAux := DoExecTimmerAux_OutrasUFs;
      OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_OutrasUFs;
    end;
    Navegar('http://www.gnre.pe.gov.br/gnre/portal/GNRE_Principal.jsp');
  end;
  VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
end;

procedure Tfrm_icms_online.EmiteIcmsSP;
var
  vNr_Processo: String;
begin

  if ckbInSemAdicao.Checked then //Se não tiver adição(DI emitida por fora do Broker), abre apenas a página de internet correspondente ao estado.
  begin
      with Tfrm_Web.Create(Application) do
        Navegar('https://www3.fazenda.sp.gov.br/simp');
      VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
      Exit;
  end;

  if dbgrd_icms.Focused then
    vNr_Processo := datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString
  else if DBGrid4.Focused then
    vNr_Processo := datm_icms_online.qry_processos_cat63_exoneracao_NR_PROCESSO.AsString
  else if DBGrid5.Focused then
    vNr_Processo := datm_icms_online.qry_processos_cat63_icms_NR_PROCESSO.AsString;

  PreparaTab_Main;
  TAB_MAIN.Locate('NR_PROCESSO', vNr_Processo, [loCaseInsensitive]);
  with datm_icms_online do
  begin
    {Verifica Bloqueio manual}
    qry_icms_bloqueado_.Close;
    qry_icms_bloqueado_.ParamByName('NR_PROCESSO').AsString := vNr_Processo;
    qry_icms_bloqueado_.Prepare;
    qry_icms_bloqueado_.Open;
    if qry_icms_bloqueado_IN_BLOQUEADO.AsString = '1' then
    begin
      BoxMensagem( 'I.C.M.S. do Processo ' +
                   Copy( TAB_MAIN.FieldByName('NR_PROCESSO').AsString, 5, 14 ) +
                   ' bloqueado para Emissão!', 2 );
    end
    else
    begin
      if ConsultaLookup('TEMPRESA_NAC','CD_EMPRESA',ConsultaLookup('TPROCESSO','NR_PROCESSO', TAB_MAIN.FieldByName('NR_PROCESSO').AsString,'CD_IMPORTADOR'),'END_UF') = 'RJ' then
      begin
        with crp_darj do
        begin
          Connect      := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
          ReportName   := cDir_Rpt + '\relDARJ.RPT';
          Formulas[0]  := 'fProcesso = "' + TAB_MAIN.FieldByName('NR_PROCESSO').AsString + '"';
          Formulas[1]  := 'fCodigoReceita = "024-8"';
          Formulas[2]  := 'fDocumentoOrigem = {TDECLARACAO_IMPORTACAO.NR_DECLARACAO_IMP}';
          Formulas[3]  := 'fVencimento = "' + FormatDateTime('dd"/"mm"/"yyyy',msk_vencimento.Date) + '"';
          Formulas[4]  := 'fPeriodo = "' + Copy(FormatDateTime('mmmm',msk_vencimento.Date),1,3) + '/' + FormatDateTime('yy',msk_vencimento.Date) + '"';
          Formulas[5]  := 'fValorRecolher = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_TOT_ICMS').AsFloat - ( TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat * ( StrToFloat(ConsultaLookup('TPARAMETROS','"bla"','bla','PC_FUNDO_POBREZA_RJ')) / 100 )) ) + '"';
          Formulas[6]  := 'fReceita = "ICMS IMPORTAÇÃO"';
          Formulas[7]  := 'fBaseCalc = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat ) + '"';
          Formulas[8]  := 'fCIF = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat ) + '"';
          Formulas[9]  := 'fValorTrib = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat + TAB_MAIN.FieldByName('VL_TOTAL_II').AsFloat + TAB_MAIN.FieldByName('VL_TOTAL_IPI').AsFloat + TAB_MAIN.FieldByName('VL_TAXA_SISCOMEX').AsFloat + TAB_MAIN.FieldByName('VL_TOT_PIS_COFINS').AsFloat ) + '"';
          Formulas[10] := 'fPIS = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_PIS').AsFloat ) + '"';
          Formulas[11] := 'fCOFINS = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_COFINS').AsFloat ) + '"';
          Execute;
          if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                               ' FROM TADICAO_DE_IMPORTACAO ' +
                               ' WHERE NR_PROCESSO = ' + QuotedStr(TAB_MAIN.FieldByName('NR_PROCESSO').AsString) +
                               '   AND ISNULL(IN_FUNDO_POBREZA, ''0'') = ''1''', 'QTD') <> '0' then
          begin
            Formulas[0]  := 'fProcesso = "' + TAB_MAIN.FieldByName('NR_PROCESSO').AsString + '"';
            // Abaixo utilizava o código 750-1 que foi pedido para ser alterado pelo 754-4 - Michel - 06/04/2008 - Ocorrência 08314/09
            Formulas[1]  := 'fCodigoReceita = "754-4"';
            Formulas[2]  := 'fDocumentoOrigem = "024-8"';
            Formulas[3]  := 'fVencimento = "' + FormatDateTime('dd"/"mm"/"yyyy',msk_vencimento.Date) + '"';
            Formulas[4]  := 'fPeriodo = "' + Copy(FormatDateTime('mmmm',msk_vencimento.Date),1,3) + '/' + FormatDateTime('yy',msk_vencimento.Date) + '"';
            Formulas[5]  := 'fValorRecolher = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat * ( StrToFloat(ConsultaLookup('TPARAMETROS','"bla"','bla','PC_FUNDO_POBREZA_RJ')) / 100 )) + '"';
            Formulas[6]  := 'fReceita = "FUNDO DE COMBATE A POBREZA E DESIGUALDADES SOCIAIS"';
            Formulas[7]  := 'fBaseCalc = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_BASE_CALC_ICMS').AsFloat ) + '"';
            Formulas[8]  := 'fCIF = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat ) + '"';
            Formulas[9]  := 'fValorTrib = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_CIF_MN').AsFloat + TAB_MAIN.FieldByName('VL_TOTAL_II').AsFloat + TAB_MAIN.FieldByName('VL_TOTAL_IPI').AsFloat + TAB_MAIN.FieldByName('VL_TAXA_SISCOMEX').AsFloat + TAB_MAIN.FieldByName('VL_TOT_PIS_COFINS').AsFloat ) + '"';
            Formulas[10] := 'fPIS = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_PIS').AsFloat ) + '"';
            Formulas[11] := 'fCOFINS = "' + FormatFloat('###,###,##0.00', TAB_MAIN.FieldByName('VL_COFINS').AsFloat ) + '"';
            Execute;
          end;
        end;
      end
      else
      begin
        ExecICMSOnLine(TAB_MAIN.FieldByName('NR_PROCESSO').AsString);
        {Realizar evento Impressão do ICMS}
        CloseStoredProc(sp_atz_evento);
        sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := TAB_MAIN.FieldByName('NR_PROCESSO').AsString;
        sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_PAG_ICMS';
        sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
        ExecStoredProc(sp_atz_evento);
        CloseStoredProc(sp_atz_evento);
      end;
    end;
    qry_icms_bloqueado_.Close;

    VerificaImpressao(TAB_MAIN.FieldByName('NR_PROCESSO').AsString);

    TAB_MAIN.Close;
    //if combo_tipo_icms.ItemIndex = 3 then
    //  TAB_MAIN.SQL.Delete( TAB_MAIN.SQL.Count - 1 );

    TAB_MAIN.Prepare;
    TAB_MAIN.Open;
    TAB_MAIN.Locate('NR_PROCESSO', vNr_Processo, [loCaseInsensitive]);
  end;
  Atualiza_Tela_ICMS;
end;

function Tfrm_icms_online.ValidaSiteIcmsOutrasUfs: Boolean;
var
  vUFCliente, vUFDespacho: string;
begin
  Result := False;
  vUFCliente := datm_icms_online.qry_lista_processos_UF_CLIENTE.AsString;
  vUFDespacho := datm_icms_online.qry_lista_processos_UF_DESPACHO.AsString;

  with datm_icms_online do
  begin
    qry_uf_icms_online.Open;
    qry_uf_icms_online.first;

    while not qry_uf_icms_online.Eof do
    begin
      if (vUFCliente = qry_uf_icms_online.FieldByName('UF_Cliente').AsString) and
         (vUFDespacho = qry_uf_icms_online.FieldByName('UF_Despacho').AsString) then
      begin
        Result := True;
        break;
      end;
      qry_uf_icms_online.Next;
    end;
  end;
end;

procedure Tfrm_icms_online.DoOnWebDocumentDARJ_GNRE_PR(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  vTimer: TTimer;
  Document: OleVariant;
  FormBrowser: Tfrm_web;
  Browser: TWebBrowser;
  i: Integer;
  aux : Integer;

  procedure FecharPagina;
  begin
    FormBrowser.ModalResult := mrCancel;
    PaginaNaoCarregada := True;
  end;

begin
  PaginaNaoCarregada := False;
  FormBrowser := Tfrm_web(Sender);
  Browser := FormBrowser.WebBrowser1;
  Document := Browser.OleObject.document;

  if (Sender = nil) or VarIsNull(Browser.OleObject) or VarIsEmpty(Browser.OleObject) or
     VarIsNull(Browser.OleObject.document) or VarIsEmpty(Browser.OleObject.document) then
    FecharPagina;

  try
    if SameText(Browser.LocationURL, 'http://www.grpr.fazenda.pr.gov.br/grpr/') then
    begin
      with Dados_Emissao_Icms do
      begin
        if not FormBrowser.EsperaCarregarCampo(Document, thselect, nthname, 'Campo01') then
        begin
          FecharPagina;
          Exit;
        end;
        FormBrowser.ExecutaScript('$(''#frmGRPR'').attr("target","_self");', 'javascript');            //NÃO ABRIR EM OUTRA TELA AO CLICAR EM CONTINUAR
        Document.getElementsByName('eGrupo').item(0).click();                                          //TIPO DE IMPOSTO
        Document.getElementsByName('Campo01').item(0).value := '1210';                                 //CÓD IMPOSTO 1210=Recolhimento Antecipado Entradas do Exterior
        Document.getElementsByName('Campo01').item(0).onchange();                                      //CÓD IMPOSTO
        Document.getElementsByName('eTipo').item(1).click();                                           //TIPO CNPJ
        Document.getElementsByName('Campo04').item(0).value := CGC;                                    //CNPJ
        Document.getElementsByName('b1').item(0).click();                                              //BTN CONTINUAR

  //      DADOS DA RECEITA:
        if not FormBrowser.EsperaCarregarCampo(Document, thselect, nthname, 'eTpNumDoc') then
        begin
          FecharPagina;
          Exit;
        end;

        Document.getElementsByName('eTpNumDoc').item(0).value := 'DI';                                 //TIPO DOCUMENTO
        Document.getElementsByName('Campo06').item(0).value   := NR_DI;                                //DI
        Document.getElementsByName('Campo07').item(0).value   := StrToInt(COD_TOM_PR);                 //CIDADE COD "TOM" PR
        Document.getElementsByName('Campo09').item(0).value   := FloatToStr(VL_ICMS_AFRMM);            //VALOR ICMS
        Document.getElementsByName('Campo02').item(0).value   := FormatDateTime('dd/mm/yyyy',
                                                                                msk_vencimento.date);  //DATA VENCIMENTO
        Document.getElementsByName('b1').item(0).click();                                              //BTN CONTINUAR

        if not FormBrowser.EsperaCarregarCampo(Document, thselect, nthname, 'Campo08') then
        begin
          FecharPagina;
          Exit;
        end;

        Document.getElementsByName('Campo08').item(0).value   := '99007';                              //CÓD PRODUTO (SEMPRE ESSE 99007: NÃO CLASSIFICADOS)
        //DESTINATÁRIO:
        Document.getElementsByName('Campo18').item(0).value   := NM_EMPRESA;                           //NOME
        Document.getElementsByName('Campo19_1').item(0).value := CIDADE;                               //MUNICÍPIO
        Document.getElementsByName('Campo19_2').item(0).value := UF;                                   //UF
        Document.getElementsByName('Campo20').item(0).value   := CGC;                                  //CNPJ
        Document.getElementsByName('Campo21').item(0).value   := FormatFloat('###,###,###,##0.00',
                                                                             VL_BASE_CALC_ICMS);       //VALOR BASE CÁLC ICMS
        Document.getElementsByName('Campo22').item(0).value   := PC_ICMS;                              //ALÍQUOTA ICMS
        Document.getElementsByName('Campo23_2').item(0).value := UF;                                   //UF_VEÍCULO

        //INFORMAÇÕES COMPLEMENTARES:
        Document.getElementsByName('Campo24').item(0).value := OBS;                                    //FINALIDADE DO PAGTO MÁX550 CARAC
      end;
    end
  except
    on E: Exception do
    begin
      TrataErro(E);
      FecharPagina;
      Exit;
    end;
  end;
end;

procedure Tfrm_icms_online.EmiteIcmsPR;
begin
  with Tfrm_Web.Create(Application) do
  begin
    if not ckbInSemAdicao.Checked then
    begin
      GetDadosEmissaoIcms;
      OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_PR;
    end;
    Navegar('http://www.grpr.fazenda.pr.gov.br/grpr/');
  end;
  if not PaginaNaoCarregada then
    VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
end;

function Tfrm_icms_online.GetObs(): WideString;
var
  vObsAux: WideString;
begin
  vObsAux := '';
  with Dados_Emissao_Icms do
  begin
    if REF_CLIENTE <> '' then
      vObsAux := 'S/REF: '         + REF_CLIENTE + '  \n' +
                 'N/REF: '         + NR_PROCESSO + '  \n' +
                 'Vl Fiscal R$ '   + FormatFloat('###,###,###,##0.00', VL_FISCAL) + '  \n' +
                 'II R$ '          + FormatFloat('###,###,###,##0.00', II) + '  \n' +
                 'IPI R$ '         + FormatFloat('###,###,###,##0.00', IPI) + '  \n' +
                 'PIS R$ '         + FormatFloat('###,###,###,##0.00', PIS) + '  \n' +
                 'COFINS R$ '      + FormatFloat('###,###,###,##0.00', COFINS) + '  \n' +
                 'Tx.Siscomex R$ ' + FormatFloat('###,###,###,##0.00', TX_SISCOMEX) + '  \n' +
                 'Total R$ '       + FormatFloat('###,###,###,##0.00', VL_TOTAL) + '  \n' +
                 'Base ICMS R$ '   + FormatFloat('###,###,###,##0.00', VL_BASE_CALC_ICMS) + '  \n' +
                 'AFRMM R$ '       + FormatFloat('###,###,###,##0.00', VL_AFRMM_ITEM);
  end;
  Result := vObsAux;
end;

procedure Tfrm_icms_online.EmiteIcmsBA;
begin
//  GetDadosEmissaoIcms;
//
//  with Tfrm_Web.Create(Application) do
//  begin
//    if not UtilizaIE11 then
//      Exit;
//    OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_BA;
//    ExecTimmerAux := DoExecTimmerAux_BA;
//    Navegar('http://sistemas.sefaz.ba.gov.br/sistemas/arasp/pagamento/modulos/dae/pagamento/dae_pagamento.aspx');
//  end;
//    VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);

  //Gera um arquivo INI e abre o ChromiumBrowser por fora lendo esse INI

  GeraArqDadosIcms('BA');
  ShellExecute(handle,'open',PChar('C:\DDBROKER\ChromiumBrowserBroker\ChromiumBrowserBroker.exe'), '','',SW_SHOWNORMAL);
  AguardaImpressaoIcmsChromium;
  VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);

end;

procedure Tfrm_icms_online.DoOnWebDocumentDARJ_GNRE_BA(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  ValorArmazenagem: Double;
  Document: OleVariant;
  FormBrowser: Tfrm_web;
  Browser: TWebBrowser;
begin
  FormBrowser := Tfrm_web(Sender);
  Browser := FormBrowser.WebBrowser1;
  Document := Browser.OleObject.document;

  if SameText(Browser.LocationURL, 'http://sistemas.sefaz.ba.gov.br/sistemas/arasp/pagamento/modulos/dae/pagamento/dae_pagamento.aspx') then
  begin
    ValorArmazenagem := PegaValorArmazenagem;
    if ValorArmazenagem > 0 then
      AtualizaICMS_Dados_Emissao_Icms(ValorArmazenagem);
  end;

  Tfrm_Web(Sender).tmrAux.Enabled := True;   //TimmerAux chama DoExecTimmerAux_BA
end;

procedure Tfrm_icms_online.DoExecTimmerAux_BA(Sender: TObject);
var
  Document: OleVariant;
  FormBrowser: Tfrm_web;
  Browser: TWebBrowser;
begin
  PaginaNaoCarregada := False;
  FormBrowser := Tfrm_web(Sender);
  Browser := FormBrowser.WebBrowser1;
  Document := Browser.OleObject.document;

  try
    with Dados_Emissao_Icms do
    begin
      if SameText(Browser.LocationURL, 'http://sistemas.sefaz.ba.gov.br/sistemas/arasp/pagamento/modulos/dae/pagamento/dae_pagamento.aspx') then
      begin
        if IN_IE = 1 then
        begin
          Document.getElementById('PHConteudo_ddl_contribuinte_inscrito').value := '903|formulario';              //CÓD IMPOSTO 1210=Recolhimento Antecipado Entradas do Exterior
          Document.getElementById('PHConteudo_ddl_contribuinte_inscrito').onchange();                             //CÓD IMPOSTO
        end
        else if SameText(Browser.LocationURL, 'http://sistemas.sefaz.ba.gov.br/sistemas/arasp/pagamento/modulos/dae/pagamento/dae_pagamento.aspx') then
        begin
          Document.getElementById('PHConteudo_ddl_contribuinte_nao_inscrito').value := '898|formulario';          //CÓD IMPOSTO 1210=Recolhimento Antecipado Entradas do Exterior
          Document.getElementById('PHConteudo_ddl_contribuinte_nao_inscrito').onchange();                         //CÓD IMPOSTO
        end;
      end
      else if SameText(Browser.LocationURL, 'http://sistemas.sefaz.ba.gov.br/sistemas/arasp/pagamento/modulos/dae/pagamento/formulario_dae_pagamento.aspx') then
      begin
        if IN_IE = 1 then
          Document.getElementById('PHconteudoSemAjax_txt_num_inscricao_estad').value := IE                              // INSCRIÇÃO ESTADUAL
        else
        begin
          Document.getElementById('PHconteudoSemAjax_txt_num_cnpj_cpf').value := FormataCNPJ(CGC);                                   // CNPJ
          Document.getElementById('PHconteudoSemAjax_txt_num_cnpj_cpf').onchange();                                     // CNPJ
          Document.getElementById('PHconteudoSemAjax_txt_nom_razao_social').value := NM_EMPRESA;                        // RAZÃO SOCIAL
          Document.getElementById('PHconteudoSemAjax_txt_num_cep').value := FormataCEP(CEP);                                        // CEP
          Document.getElementById('PHconteudoSemAjax_txt_num_cep').onchange();                                          // CEP
          Document.getElementById('PHconteudoSemAjax_ddl_cod_tipo_logradouro').value := 'LOC';
          FormBrowser.EsperaCarregarCampo(Document, thinput, nthid, 'PHconteudoSemAjax_txt_des_logradouro');
          Document.getElementById('PHconteudoSemAjax_txt_des_logradouro').value := UpperCase(ENDERECO);                            // LOGRADOURO
        end;
        Document.getElementById('PHconteudoSemAjax_txt_dtc_vencimento').value := FormatDateTime('dd/mm/yyyy',
                                                                                 msk_vencimento.date);                  //DATA VENCIMENTO
        Document.getElementById('PHconteudoSemAjax_txt_dtc_max_pagamento').value := FormatDateTime('dd/mm/yyyy',
                                                                                    msk_vencimento.date);               //DATA VENCIMENTO
        Document.getElementById('PHconteudoSemAjax_txt_val_principal').value := FormatFloat('###,###,###,##0.00',
                                                                                             VL_ICMS_AFRMM);            //VALOR ICMS
        Document.getElementById('PHconteudoSemAjax_txt_num_di_dsi').value := NR_DI;                                     // NUMERO DA DI
        Document.getElementById('PHconteudoSemAjax_txt_mes_ano_referencia_6anos').value := FormatDateTime('mm/yyyy',
                                                                                           msk_vencimento.date);        // REFERÊNCIA EX: 07/2016
        Document.getElementById('PHconteudoSemAjax_txt_des_informacoes_complementares').value := NR_PROCESSO;           // INFORMAÇÕES COMPLEMENTARES PROCESSO EX: IM-007306-16
      end;
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_icms_online.DoExecTimmerAux_OutrasUFs(Sender: TObject);
begin
  {O timer chama o script para preencher as informações para a impressão da guia}
  Tfrm_web(Sender).ExecutaScript(RetScriptOutrasUFs.Text, 'javascript');
end;

function Tfrm_icms_online.FormataCEP(pCEP: String): String;
begin
  Result := Copy(pCEP,1,2)+'.'+Copy(pCEP,3,3)+'-'+Copy(pCEP,6,3);
end;

function Tfrm_icms_online.FormataCNPJ(pCNPJ: String): String;
begin
  Result := Copy(pCNPJ,1,2)+'.'+Copy(pCNPJ,3,3)+'.'+Copy(pCNPJ,6,3)+'/'+ Copy(pCNPJ,9,4)+'-'+Copy(pCNPJ,13,2);
end;

function Tfrm_icms_online.PegaValorArmazenagem: Double;
var
  ValorDefinido: Boolean;
  ValorDigitado: string;
  ValorArmazenagem: Double;
begin
  ValorDefinido := False;
  while not ValorDefinido do
  begin
    if InputQuery('Valor Armazenagem', 'Digite o valor da armazenagem se este tiver que compor a Base de Cálculo de ICMS', ValorDigitado) then
    begin
      try
        Result := StrToFloat(ValorDigitado);
        ValorDefinido := True;
      except
        ShowMessage('O conteúdo digitado não corresponde a um valor monetário');
        ValorDefinido := False;
      end;
    end
    else
    begin
      ShowMessage('O valor de Armazenagem não irá compor o valor da Base de Cálculo de ICMS');
      Result := 0;
      ValorDefinido := True; //Se o usuário cancela o input ele definiu que o valor é zero(não tem).
    end;
  end;
end;

procedure Tfrm_icms_online.AtualizaICMS_Dados_Emissao_Icms(ValorArmazenagem: Double);
var
  ValorTotalArmazenagem: Double;
begin
  with Dados_Emissao_Icms do
  begin
    ValorTotalArmazenagem := VL_TOTAL + ValorArmazenagem;
    VL_BASE_CALC_ICMS := ValorTotalArmazenagem /(1 - (PC_ICMS/100));
    VL_ICMS_AFRMM := VL_BASE_CALC_ICMS * (PC_ICMS/100);
  end;
end;

procedure Tfrm_icms_online.GeraArqDadosIcms(uf_icms: String);
var
  vArqIni: TStringList;
  vFile: String;
begin
  vFile := 'C:\DDBROKER\' + usuarioLogado + '\DADOSICMS.INI';

  if not DirectoryExists(ExtractFileDir(vFile)) then
    ForceDirectories(ExtractFileDir(vFile));

  if not FileExists(vFile) then
  begin
    DeleteFile('vFile');
  end;

  vArqIni := TStringList.Create();
  try
    if not ckbInSemAdicao.Checked then
    begin
      GetDadosEmissaoIcms;
      VerificaSeAtualizaValores(uf_icms);      
      with Dados_Emissao_Icms do
      begin
        vArqIni.Text := '[DADOS]'        + #13#10 +
                        'IN_TIPO_ICMS='  + IntToStr(combo_tipo_icms.ItemIndex) + #13#10 +
                        'IN_SEM_ADICAO=' + BoolToStr(ckbInSemAdicao.Checked) + #13#10 +
                        'UF_ICMS='       + uf_icms + #13#10 +
                        'NR_PROCESSO='   + NR_PROCESSO + #13#10 +
                        'NM_EMPRESA='    + NM_EMPRESA + #13#10 +
                        'CGC='           + CGC + #13#10 +
                        'NR_DI='         + IntToStr(NR_DI) + #13#10 +
                        'IE='            + IE + #13#10 +
                        'IN_IE='         + IntToStr(IN_IE) + #13#10 +
                        'ENDERECO='      + ENDERECO + #13#10 +
                        'CEP='           + CEP + #13#10 +
                        'DT_BASE='       + FormatDateTime('dd/mm/yyyy', msk_data_base.Date) + #13#10 +
                        'DT_VENCIMENTO=' + FormatDateTime('dd/mm/yyyy', msk_vencimento.Date) + #13#10 +
                        'OBS='           + OBS + #13#10 +
                        'VL_AFRMM_ITEM=' + FloatToStr(VL_AFRMM_ITEM) + #13#10 +
                        'VL_ICMS_AFRMM=' + FloatToStr(VL_ICMS_AFRMM) + #13#10 +
                        'VL_FECP='       + FloatToStr(VL_FECP) + #13#10;
      end
    end
    else
    begin
      vArqIni.Text := '[DADOS]'        + #13#10 +
                      'IN_SEM_ADICAO=' + BoolToStr(ckbInSemAdicao.Checked);
    end;

    vArqIni.SaveToFile(vFile);
  finally
    FreeAndNil(vArqIni);
  end;
end;

procedure Tfrm_icms_online.VerificaSeAtualizaValores(uf_icms: String);
var
  ValorArmazenagem: Double;
begin
  if uf_icms = 'BA' then
  begin
    ValorArmazenagem := PegaValorArmazenagem;
    if ValorArmazenagem > 0 then
      AtualizaICMS_Dados_Emissao_Icms(ValorArmazenagem);
  end;
end;

procedure Tfrm_icms_online.AguardaCarregar(seg: Integer = 1);
var
  i: integer;
  vqtd: Double;
begin
  vqtd := (seg * 1000) / 200;
  I := 0;
  while i < vqtd do
  begin
    Sleep(200);
    Application.ProcessMessages;
    inc(i);
  end;
end;

function Tfrm_icms_online.usuarioLogado: String;
var
lpName : array[0..19] of char;
lpBuffer: array[0..126] of char;
begin
StrPCopy(lpName,'USERNAME');
GetEnvironmentVariable(lpName,lpBuffer,SizeOf(lpBuffer));
Result := StrPas(lpBuffer);
end;

procedure Tfrm_icms_online.EmiteIcmsSC;
begin
  with Tfrm_Web.Create(Application) do
  begin
    if not ckbInSemAdicao.Checked then
    begin
      GetDadosEmissaoIcms;
      OnDocumentComplete := DoOnWebDocumentDARJ_GNRE_SC;
    end;
    Navegar('https://tributario.sef.sc.gov.br/tax.Net/tax.Net.DI/di_consulta_liberacao_simples.aspx');
  end;
  if not PaginaNaoCarregada then
    VerificaImpressao(datm_icms_online.qry_lista_processos_NR_PROCESSO.AsString);
end;

procedure Tfrm_icms_online.DoOnWebDocumentDARJ_GNRE_SC(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  Document: OleVariant;
  FormBrowser: Tfrm_web;
  Browser: TWebBrowser;
begin
  PaginaNaoCarregada := False;
  FormBrowser := Tfrm_web(Sender);
  Browser := FormBrowser.WebBrowser1;
  Document := Browser.OleObject.document;

  try
    with Dados_Emissao_Icms do
    begin
      if SameText(Browser.LocationURL, 'https://tributario.sef.sc.gov.br/tax.Net/tax.Net.DI/di_consulta_liberacao_simples.aspx') then
      begin
        if Document.getElementById('_ctl0__ctl0_Main_Main_txtCodigoDI').value = '' then
        begin
          Document.getElementById('_ctl0__ctl0_Main_Main_txtCodigoDI').value := NR_DI;                                     // NUMERO DA DI
          Document.getElementById('_ctl0__ctl0_Main_Main_txtCPFCNPJ').value := CGC;                        // CNPJ
          Document.getElementById('_ctl0__ctl0_Main_Main_cmdConsultar').click;                        // CNPJ
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_icms_online.ckbInSemAdicaoClick(Sender: TObject);
begin
  Atualiza_Tela_ICMS;
end;

procedure Tfrm_icms_online.AguardaImpressaoIcmsChromium;
var
  H: HWND;
  I: Integer;
  vNomeTela: string;
begin
  vNomeTela := 'Chromium Browser Broker';
  Sleep(1000);
  H := FindWindow(nil, PChar(vNomeTela));
  while H = 0 do  //Se ainda não carregou a página, espera carregar
  begin
    H := FindWindow(nil, PChar(vNomeTela));
    Sleep(100);
  end;

  while H <> 0 do  //Depois que carregou, espera finalizar
  begin
    H := FindWindow(nil, PChar(vNomeTela));
    Sleep(100);
  end;
end;

end.

