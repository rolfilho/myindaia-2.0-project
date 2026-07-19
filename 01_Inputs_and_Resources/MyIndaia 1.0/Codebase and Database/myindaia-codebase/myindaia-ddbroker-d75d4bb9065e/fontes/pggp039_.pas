unit PGGP039;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Db, Buttons, ComCtrls, Menus, Grids,
  DBGrids;

type
  Tfrm_ajuste_impressao_sda = class(TForm)
    pgctrl_ajuste_imp: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_sp: TTabSheet;
    Panel1: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    dbedt_linha_doc: TDBEdit;
    dbedt_col_doc: TDBEdit;
    dbedt_linha_impexp: TDBEdit;
    dbedt_col_impexp: TDBEdit;
    dbedt_linha_desp: TDBEdit;
    dbedt_col_desp: TDBEdit;
    dbedt_linha_vl_sda: TDBEdit;
    dbedt_col_cpf: TDBEdit;
    dbedt_col_vl_sda: TDBEdit;
    dbedt_col_dt_entrada: TDBEdit;
    dbedt_linha_taxa: TDBEdit;
    dbedt_col_taxa: TDBEdit;
    dbedt_linha_vl_total: TDBEdit;
    dbedt_col_vl_total: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    DBGrid1: TDBGrid;
    dbedt_col_imp: TDBEdit;
    dbedt_col_exp: TDBEdit;
    lbl_imp: TLabel;
    lbl_exp: TLabel;
    lbl_nr_conh: TLabel;
    dbedt_col_nr_conh: TDBEdit;
    dbedt_linha_nr_proc: TDBEdit;
    dbedt_col_nr_proc: TDBEdit;
    lbl_processo: TLabel;
    lbl_col2: TLabel;
    lbl_linha2: TLabel;
    dbedt_linha_referencia: TDBEdit;
    dbedt_linha_conh_master: TDBEdit;
    lbl_referencia: TLabel;
    lbl_master: TLabel;
    ts_dados_sts: TTabSheet;
    Panel2: TPanel;
    Label21: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label20: TLabel;
    Label19: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbedt_linha_valor_total: TDBEdit;
    dbedt_linha_vl_taxa: TDBEdit;
    dbedt_linha_valor_sda: TDBEdit;
    dbedt_col_valor_sda: TDBEdit;
    dbedt_linha_processo: TDBEdit;
    dbedt_linha_imp_exp: TDBEdit;
    dbedt_col_processo: TDBEdit;
    dbedt_col_cnpj: TDBEdit;
    dbedt_col_imp_exp: TDBEdit;
    dbedt_col_oper_exp: TDBEdit;
    dbedt_col_oper_imp: TDBEdit;
    dbedt_linha_oper_imp: TDBEdit;
    dbedt_linha_referen: TDBEdit;
    ts_dados_rs: TTabSheet;
    Panel3: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label26: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    dbedt_linha_vl_total2: TDBEdit;
    dbedt_linha_taxa2: TDBEdit;
    dbedt_linha_vl_sda2: TDBEdit;
    dbedt_linha_urf_desp2: TDBEdit;
    dbedt_linha_nr_conh2: TDBEdit;
    dbedt_linha_nr_proc2: TDBEdit;
    dbedt_linha_desp2: TDBEdit;
    dbedt_linha_impexp2: TDBEdit;
    dbedt_linha_doc2: TDBEdit;
    dbedt_col_doc2: TDBEdit;
    dbedt_col_oper2: TDBEdit;
    dbedt_col_impexp2: TDBEdit;
    dbedt_col_desp2: TDBEdit;
    dbedt_col_cpf2: TDBEdit;
    dbedt_col_nr_proc2: TDBEdit;
    dbedt_col_nr_conh2: TDBEdit;
    dbedt_col_urf_desp2: TDBEdit;
    dbedt_col_vl_sda2: TDBEdit;
    dbedt_col_dt_emissao2: TDBEdit;
    dbedt_col_taxa2: TDBEdit;
    dbedt_col_vl_total2: TDBEdit;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    dbedt_cd_unid_neg3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    SpeedButton2: TSpeedButton;
    Label47: TLabel;
    Cmbbx_mod_doc: TComboBox;
    Label40: TLabel;
    dbedt_col_nm_compl_sda: TDBEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    dbedt_linha_vl_cif: TDBEdit;
    dbedt_col_vl_cif: TDBEdit;
    dbedt_linha_veiculo: TDBEdit;
    dbedt_col_cgc: TDBEdit;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label18: TLabel;
    ts_dados_rj: TTabSheet;
    Panel4: TPanel;
    Label22: TLabel;
    SpeedButton3: TSpeedButton;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    dbedt_cd_unid_neg4: TDBEdit;
    dbedt_nm_unid_neg4: TDBEdit;
    dbedt_col_valor_total2: TDBEdit;
    dbedt_col_taxa3: TDBEdit;
    dbedt_linha_valor_sda2: TDBEdit;
    dbedt_col_valor_sda2: TDBEdit;
    dbedt_linha_processo2: TDBEdit;
    dbedt_linha_imp_exp2: TDBEdit;
    dbedt_col_processo2: TDBEdit;
    dbedt_col_cnpj2: TDBEdit;
    dbedt_col_imp_exp2: TDBEdit;
    dbedt_col_oper_exp2: TDBEdit;
    dbedt_col_oper_imp2: TDBEdit;
    dbedt_linha_oper_imp2: TDBEdit;
    dbedt_linha_desp3: TDBEdit;
    dbedt_col_desp3: TDBEdit;
    dbedt_linha_cnpj2: TDBEdit;
    Label56: TLabel;
    dbedt_linha_nr_cpf: TDBEdit;
    dbedt_col_nr_cpf: TDBEdit;
    Label57: TLabel;
    dbedt_col_dt_emissao3: TDBEdit;
    dbedt_linha_dt_emissao: TDBEdit;
    dbedt_linhas_guia: TDBEdit;
    Label58: TLabel;
    Label59: TLabel;
    dbedt_linha_conta_corrente: TDBEdit;
    dbedt_col_conta_corrente: TDBEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedt_linha_docChange(Sender: TObject);
    procedure dbedt_linha_docExit(Sender: TObject);
    procedure dbedt_col_docExit(Sender: TObject);
    procedure dbedt_linha_impexpExit(Sender: TObject);
    procedure dbedt_col_impexpExit(Sender: TObject);
    procedure dbedt_linha_despExit(Sender: TObject);
    procedure dbedt_col_despExit(Sender: TObject);
    procedure dbedt_col_cpfExit(Sender: TObject);
    procedure dbedt_col_vl_sdaExit(Sender: TObject);
    procedure dbedt_col_dt_entradaExit(Sender: TObject);
    procedure dbedt_linha_taxaExit(Sender: TObject);
    procedure dbedt_col_taxaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_linha_vl_sdaExit(Sender: TObject);
    procedure dbedt_linha_vl_totalExit(Sender: TObject);
    procedure dbedt_col_vl_totalExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function VerAlt   : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_ajuste_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure dbedt_col_expExit(Sender: TObject);
    procedure dbedt_col_impExit(Sender: TObject);
    procedure dbedt_col_nr_conhExit(Sender: TObject);
    procedure dbedt_linha_nr_procExit(Sender: TObject);
    procedure dbedt_col_nr_procExit(Sender: TObject);
    procedure dbedt_linha_referenciaExit(Sender: TObject);
    procedure dbedt_linha_conh_masterExit(Sender: TObject);
    procedure dbedt_linha_oper_impExit(Sender: TObject);
    procedure dbedt_cd_unid_neg2Exit(Sender: TObject);
    procedure dbedt_col_oper_impExit(Sender: TObject);
    procedure dbedt_col_oper_expExit(Sender: TObject);
    procedure dbedt_linha_imp_expExit(Sender: TObject);
    procedure dbedt_col_imp_expExit(Sender: TObject);
    procedure dbedt_col_cnpjExit(Sender: TObject);
    procedure dbedt_linha_processoExit(Sender: TObject);
    procedure dbedt_col_processoExit(Sender: TObject);
    procedure dbedt_linha_referenExit(Sender: TObject);
    procedure dbedt_linha_valor_sdaExit(Sender: TObject);
    procedure dbedt_col_valor_sdaExit(Sender: TObject);
    procedure dbedt_linha_vl_taxaExit(Sender: TObject);
    procedure dbedt_linha_valor_totalExit(Sender: TObject);
    procedure dbedt_cd_unid_neg3Exit(Sender: TObject);
    procedure dbedt_linha_doc2Exit(Sender: TObject);
    procedure dbedt_col_doc2Exit(Sender: TObject);
    procedure dbedt_col_oper2Exit(Sender: TObject);
    procedure dbedt_linha_impexp2Exit(Sender: TObject);
    procedure dbedt_col_impexp2Exit(Sender: TObject);
    procedure dbedt_linha_desp2Exit(Sender: TObject);
    procedure dbedt_col_desp2Exit(Sender: TObject);
    procedure dbedt_col_cpf2Exit(Sender: TObject);
    procedure dbedt_linha_nr_proc2Exit(Sender: TObject);
    procedure dbedt_col_nr_proc2Exit(Sender: TObject);
    procedure dbedt_linha_nr_conh2Exit(Sender: TObject);
    procedure dbedt_col_nr_conh2Exit(Sender: TObject);
    procedure dbedt_linha_urf_desp2Exit(Sender: TObject);
    procedure dbedt_col_urf_desp2Exit(Sender: TObject);
    procedure dbedt_linha_vl_sda2Exit(Sender: TObject);
    procedure dbedt_col_vl_sda2Exit(Sender: TObject);
    procedure dbedt_col_dt_emissao2Exit(Sender: TObject);
    procedure dbedt_linha_taxa2Exit(Sender: TObject);
    procedure dbedt_col_taxa2Exit(Sender: TObject);
    procedure dbedt_linha_vl_total2Exit(Sender: TObject);
    procedure dbedt_col_vl_total2Exit(Sender: TObject);
    procedure Cmbbx_mod_docChange(Sender: TObject);
    procedure dbedt_linha_vl_cifExit(Sender: TObject);
    procedure dbedt_col_vl_cifExit(Sender: TObject);
    procedure dbedt_linha_veiculoExit(Sender: TObject);
    procedure dbedt_col_cgcExit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure dbedt_linha_oper_imp2Exit(Sender: TObject);
    procedure dbedt_col_oper_imp2Exit(Sender: TObject);
    procedure dbedt_col_oper_exp2Exit(Sender: TObject);
    procedure dbedt_linha_imp_exp2Exit(Sender: TObject);
    procedure dbedt_col_imp_exp2Exit(Sender: TObject);
    procedure dbedt_linha_cnpj2Exit(Sender: TObject);
    procedure dbedt_col_cnpj2Exit(Sender: TObject);
    procedure dbedt_linha_desp3Exit(Sender: TObject);
    procedure dbedt_col_desp3Exit(Sender: TObject);
    procedure dbedt_linha_nr_cpfExit(Sender: TObject);
    procedure dbedt_col_nr_cpfExit(Sender: TObject);
    procedure dbedt_linha_valor_sda2Exit(Sender: TObject);
    procedure dbedt_col_valor_sda2Exit(Sender: TObject);
    procedure dbedt_col_taxa3Exit(Sender: TObject);
    procedure dbedt_col_valor_total2Exit(Sender: TObject);
    procedure dbedt_linha_processo2Exit(Sender: TObject);
    procedure dbedt_col_processo2Exit(Sender: TObject);
    procedure dbedt_linha_dt_emissaoExit(Sender: TObject);
    procedure dbedt_col_dt_emissao3Exit(Sender: TObject);
    procedure dbedt_cd_unid_neg4Exit(Sender: TObject);
    procedure dbedt_linhas_guiaExit(Sender: TObject);
    procedure dbedt_linha_conta_correnteExit(Sender: TObject);
    procedure dbedt_col_conta_correnteExit(Sender: TObject);
  private
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    { Private declarations }
  public
    { Public declarations }
    str_cd_documento : String;
  end;

var
  frm_ajuste_impressao_sda: Tfrm_ajuste_impressao_sda;

implementation

uses PGGP040, PGGP017, GSMLIB, PGSM018;

{$R *.DFM}

procedure Tfrm_ajuste_impressao_sda.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_ajuste_impressao_sda.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_sda.FormShow(Sender: TObject);
begin
  case StrToInt(str_cd_documento) of
    1 : Caption := 'Ajuste de Impressão - SDA - Rio Grande do Sul';
    2 : Caption := 'Ajuste de Impressão - SDA - São Paulo';
    3 : Caption := 'Ajuste de Impressão - SDA - Santos';
    4 : Caption := 'Ajuste de Impressão - SDA - Rio de Janeiro';
  end;

  with datm_ajuste_impressao_sda do
  begin
    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );

    if ts_dados_rs.TabVisible then
    begin
      if qry_ajuste_impressao_TP_DOCUMENTO.AsString = '1' then
         Cmbbx_mod_doc.ItemIndex := 1
      else
         Cmbbx_mod_doc.ItemIndex := 0;
    end;
  end;

  ts_dados_rj.TabVisible  := str_cd_documento = '004'; //Rio de Janeiro
  ts_dados_sts.TabVisible := str_cd_documento = '003'; //Santos
  ts_dados_sp.TabVisible  := str_cd_documento = '002'; //São Paulo
  ts_dados_rs.TabVisible  := str_cd_documento = '001'; //Rio Grande do Sul

  pgctrl_ajuste_imp.ActivePage := ts_lista;

end;

procedure Tfrm_ajuste_impressao_sda.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_sda, datm_ajuste_impressao_sda );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_docChange(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     btn_mi( False,True,True, False );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_docExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_doc.Text, dbedt_linha_doc );
end;

procedure Tfrm_ajuste_impressao_sda.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';
  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_docExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_doc.Text, dbedt_col_doc );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_impexpExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_impexp.Text, dbedt_linha_impexp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_impexpExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_impexp.Text, dbedt_col_impexp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_despExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_desp.Text, dbedt_linha_desp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_despExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_desp.Text, dbedt_col_desp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_cpfExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cpf.Text, dbedt_col_cpf );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_vl_sdaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_sda.Text, dbedt_col_vl_sda );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_dt_entradaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_dt_entrada.Text, dbedt_col_dt_entrada );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_taxaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_taxa.Text, dbedt_linha_taxa );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_taxaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_taxa.Text, dbedt_col_taxa );
end;

procedure Tfrm_ajuste_impressao_sda.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  with datm_ajuste_impressao_sda do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_sda.Destroy;
  Action := caFree;

  Application.ProcessMessages;
end;

procedure Tfrm_ajuste_impressao_sda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_sdaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_sda.Text, dbedt_linha_vl_sda );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_total.Text, dbedt_linha_vl_total );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_vl_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_total.Text, dbedt_col_vl_total );
end;

procedure Tfrm_ajuste_impressao_sda.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_ajuste_impressao_sda do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade);
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then dbedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  end;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_cd_unid_negExit(Sender: TObject);
begin
  if datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg.text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg );
  end;
end;

procedure Tfrm_ajuste_impressao_sda.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ajuste_impressao_sda.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_sda.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False,True,True,False );

  with datm_ajuste_impressao_sda do
  begin
    pgctrl_ajuste_imp.SetFocus;
    qry_ajuste_impressao_.DisableControls;
    qry_ajuste_impressao_.Cancel;
    qry_ajuste_impressao_.Append;
    qry_ajuste_impressao_.EnableControls;
  end;

  if str_cd_documento = '003' then // Santos
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_sts;
    dbedt_cd_unid_neg2.SetFocus;
  end
  else if str_cd_documento = '002' then // São Paulo
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_sp;
    dbedt_cd_unid_neg.SetFocus;
  end
  else if str_cd_documento = '001' then // Rio Grande do Sul
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_rs;
    dbedt_cd_unid_neg3.SetFocus;
  end
  else if str_cd_documento = '004' then // Rio de Janeiro
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_rj;
    dbedt_cd_unid_neg4.SetFocus;
  end;
end;

procedure Tfrm_ajuste_impressao_sda.Cancelar;
begin
  with datm_ajuste_impressao_sda do
  begin
    if qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
      qry_ajuste_impressao_.Cancel;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );
  end;
end;

procedure Tfrm_ajuste_impressao_sda.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_sda do
  begin

    if BoxMensagem( 'Este Ajuste de Impressão será excluído! Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_.Delete;

      datm_main.db_broker.Commit;

      qry_ajuste_impressao_.Close;
      qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
      qry_ajuste_impressao_.Prepare;
      qry_ajuste_impressao_.Open;

      btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );
    except
      on E: Exception do
      begin
        qry_ajuste_impressao_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;

  end;
end;

procedure Tfrm_ajuste_impressao_sda.pgctrl_ajuste_impChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_sda.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_ajuste_imp.ActivePage = ts_dados_sp ) or
     ( pgctrl_ajuste_imp.ActivePage = ts_dados_rs ) or
     ( pgctrl_ajuste_imp.ActivePage = ts_dados_sts ) or
     ( pgctrl_ajuste_imp.ActivePage = ts_dados_rj ) then
  begin
    if ( datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit] ) or
       ( datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Este Ajuste de Impressão foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;

        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else Cancelar;
    end;
  end;
end;

function Tfrm_ajuste_impressao_sda.Grava : Boolean;
begin
  Grava := True;

  with datm_ajuste_impressao_sda do
  begin
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_CD_DOCUMENTO.AsString := str_cd_documento;

      if ts_dados_rs.TabVisible then
      begin
        if Cmbbx_mod_doc.ItemIndex = 1 then
           qry_ajuste_impressao_TP_DOCUMENTO.AsString := '1'
        else
           qry_ajuste_impressao_TP_DOCUMENTO.AsString := '0'
      end;

      qry_ajuste_impressao_.Post;

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        qry_ajuste_impressao_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );
        Grava := False;
        Exit;
      end;
    end;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );
  end;

end;

function Tfrm_ajuste_impressao_sda.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl_ajuste_imp.ActivePage = ts_dados_sp then
  begin
    if dbedt_cd_unid_neg.text = '' then
    begin
      Consiste := False;
      Exit;
    end
    else ValidCodigo( dbedt_cd_unid_neg );
  end

  else if pgctrl_ajuste_imp.ActivePage = ts_dados_sts then
  begin
    if dbedt_cd_unid_neg2.text = '' then
    begin
      Consiste := False;
      Exit;
    end
    else ValidCodigo( dbedt_cd_unid_neg2 );
  end

  else if pgctrl_ajuste_imp.ActivePage = ts_dados_rs then
  begin
    if dbedt_cd_unid_neg3.text = '' then
    begin
      Consiste := False;
      Exit;
    end
    else ValidCodigo( dbedt_cd_unid_neg3 );
  end

  else if pgctrl_ajuste_imp.ActivePage = ts_dados_rj then
  begin
    if dbedt_cd_unid_neg4.text = '' then
    begin
      Consiste := False;
      Exit;
    end
    else ValidCodigo( dbedt_cd_unid_neg4 );
  end;

end;

procedure Tfrm_ajuste_impressao_sda.pgctrl_ajuste_impChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_exp.Text, dbedt_col_exp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_impExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_imp.Text, dbedt_col_imp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_nr_conhExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_conh.Text, dbedt_col_nr_conh );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_nr_procExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_proc.Text, dbedt_linha_nr_proc );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_nr_procExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_proc.Text, dbedt_col_nr_proc );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_referenciaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_referencia.Text, dbedt_linha_referencia );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_conh_masterExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_conh_master.Text, dbedt_linha_conh_master );
end;
              
procedure Tfrm_ajuste_impressao_sda.dbedt_linha_oper_impExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_oper_imp.Text, dbedt_linha_oper_imp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_cd_unid_neg2Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg2.text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg2 );
  end;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_oper_impExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_oper_imp.Text, dbedt_col_oper_imp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_oper_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_oper_exp.Text, dbedt_col_oper_exp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_imp_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_imp_exp.Text, dbedt_linha_imp_exp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_imp_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_imp_exp.Text, dbedt_col_imp_exp );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_cnpjExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cnpj.Text, dbedt_col_cnpj );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_processoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_processo.Text, dbedt_linha_processo );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_processoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_processo.Text, dbedt_col_processo );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_referenExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_referen.Text, dbedt_linha_referen );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_valor_sdaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_valor_sda.Text, dbedt_linha_valor_sda );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_valor_sdaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_valor_sda.Text, dbedt_col_valor_sda );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_taxaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_taxa.Text, dbedt_linha_vl_taxa );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_valor_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_valor_total.Text, dbedt_linha_valor_total );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_cd_unid_neg3Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg3.text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg3 );
  end;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_doc2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_doc2.Text, dbedt_linha_doc2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_doc2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_doc2.Text, dbedt_col_doc2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_oper2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_oper2.Text, dbedt_col_oper2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_impexp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_impexp2.Text, dbedt_linha_impexp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_impexp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_impexp2.Text, dbedt_col_impexp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_desp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_desp2.Text, dbedt_linha_desp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_desp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_desp2.Text, dbedt_col_desp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_cpf2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cpf2.Text, dbedt_col_cpf2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_nr_proc2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_proc2.Text, dbedt_linha_nr_proc2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_nr_proc2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_proc2.Text, dbedt_col_nr_proc2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_nr_conh2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_conh2.Text, dbedt_linha_nr_conh2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_nr_conh2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_conh2.Text, dbedt_col_nr_conh2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_urf_desp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_urf_desp2.Text, dbedt_linha_urf_desp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_urf_desp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_urf_desp2.Text, dbedt_col_urf_desp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_sda2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_sda2.Text, dbedt_linha_vl_sda2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_vl_sda2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_sda2.Text, dbedt_col_vl_sda2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_dt_emissao2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_dt_emissao2.Text, dbedt_col_dt_emissao2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_taxa2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_taxa2.Text, dbedt_linha_taxa2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_taxa2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_taxa2.Text, dbedt_col_taxa2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_total2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_total2.Text, dbedt_linha_vl_total2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_vl_total2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_total2.Text, dbedt_col_vl_total2 );
end;

procedure Tfrm_ajuste_impressao_sda.Cmbbx_mod_docChange(Sender: TObject);
var
  nNum, Code : Integer;

begin
  Val( datm_ajuste_impressao_sda.qry_ajuste_impressao_TP_DOCUMENTO.AsString, nNum, Code );
  if (nNum  <> Cmbbx_mod_doc.ItemIndex) then
  begin
    btn_mi( False,True,True, False );
    datm_ajuste_impressao_sda.qry_ajuste_impressao_.Edit;
  end;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_vl_cifExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_cif.Text, dbedt_linha_vl_cif );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_vl_cifExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_cif.Text, dbedt_col_vl_cif );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_veiculoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_veiculo.Text, dbedt_linha_veiculo );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_cgcExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cgc.Text, dbedt_col_cgc );
end;

procedure Tfrm_ajuste_impressao_sda.DBEdit1Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( (Sender as TDBEdit).Text, (Sender as TDBEdit) );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_oper_imp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_oper_imp2.Text, dbedt_linha_oper_imp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_oper_imp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_oper_imp2.Text, dbedt_col_oper_imp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_oper_exp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_oper_exp2.Text, dbedt_col_oper_exp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_imp_exp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_imp_exp2.Text, dbedt_linha_imp_exp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_imp_exp2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_imp_exp2.Text, dbedt_col_imp_exp2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_cnpj2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_cnpj2.Text, dbedt_linha_cnpj2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_cnpj2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cnpj2.Text, dbedt_col_cnpj2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_desp3Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_desp3.Text, dbedt_linha_desp3 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_desp3Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_desp3.Text, dbedt_col_desp3 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_nr_cpfExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_cpf.Text, dbedt_linha_nr_cpf );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_nr_cpfExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_cpf.Text, dbedt_col_nr_cpf );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_valor_sda2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_valor_sda2.Text, dbedt_linha_valor_sda2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_valor_sda2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_valor_sda2.Text, dbedt_col_valor_sda2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_taxa3Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_taxa3.Text, dbedt_col_taxa3 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_valor_total2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_valor_total2.Text, dbedt_col_valor_total2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_processo2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_processo2.Text, dbedt_linha_processo2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_processo2Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_processo2.Text, dbedt_col_processo2 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_dt_emissaoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_dt_emissao.Text, dbedt_linha_dt_emissao );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_dt_emissao3Exit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_dt_emissao3.Text, dbedt_col_dt_emissao3 );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_cd_unid_neg4Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg4.text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg4 );
  end;
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linhas_guiaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linhas_guia.Text, dbedt_linhas_guia );
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_linha_conta_correnteExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_conta_corrente.Text, dbedt_linha_conta_corrente);
end;

procedure Tfrm_ajuste_impressao_sda.dbedt_col_conta_correnteExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_sda.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_conta_corrente.Text, dbedt_col_conta_corrente );
end;

end.

