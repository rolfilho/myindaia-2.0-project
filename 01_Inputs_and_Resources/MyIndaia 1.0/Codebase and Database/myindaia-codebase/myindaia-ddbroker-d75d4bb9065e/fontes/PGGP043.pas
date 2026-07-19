unit pggp043;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_ajuste_impressao_gnre = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_ajuste_imp: TPageControl;
    ts_lista: TTabSheet;
    DBGrid1: TDBGrid;
    ts_dados: TTabSheet;
    Panel1: TPanel;
    Label001: TLabel;
    Label002: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedt_col_cd_uf_fav: TDBEdit;
    dbedt_linha_cd_uf_fav: TDBEdit;
    dbedt_linha_uf_fav: TDBEdit;
    dbedt_linha_venc: TDBEdit;
    dbedt_col_venc: TDBEdit;
    dbedt_col_uf_fav: TDBEdit;
    dbedt_linha_cd_receita: TDBEdit;
    dbedt_col_cd_receita: TDBEdit;
    dbedt_linha_imp_exp: TDBEdit;
    dbedt_col_imp_exp: TDBEdit;
    dbedt_linha_insc_est: TDBEdit;
    dbedt_col_insc_est: TDBEdit;
    dbedt_linha_cnpj: TDBEdit;
    dbedt_col_cnpj: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedt_linha_end: TDBEdit;
    dbedt_col_end: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbedt_linha_docto_origem: TDBEdit;
    dbedt_col_docto_origem: TDBEdit;
    dbedt_linha_municipio: TDBEdit;
    dbedt_col_municipio: TDBEdit;
    dbedt_linha_uf: TDBEdit;
    dbedt_col_uf: TDBEdit;
    dbedt_linha_cep: TDBEdit;
    dbedt_col_cep: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_linha_tel: TDBEdit;
    dbedt_col_tel: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbedt_linha_ref: TDBEdit;
    dbedt_col_ref: TDBEdit;
    dbedt_linha_vl_princ: TDBEdit;
    dbedt_col_vl_princ: TDBEdit;
    dbedt_linha_nr_ref: TDBEdit;
    dbedt_col_nr_ref: TDBEdit;
    dbedt_linha_nm_banco: TDBEdit;
    dbedt_col_nm_banco: TDBEdit;
    dbedt_linha_conta: TDBEdit;
    dbedt_col_conta: TDBEdit;
    dbedt_linha_agencia: TDBEdit;
    dbedt_col_agencia: TDBEdit;
    dbedt_linha_nr_banco: TDBEdit;
    dbedt_col_nr_banco: TDBEdit;
    dbedt_linha_total: TDBEdit;
    dbedt_col_total: TDBEdit;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_linha_uf_favChange(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure dbedt_linha_uf_favExit(Sender: TObject);
    procedure dbedt_col_uf_favExit(Sender: TObject);
    procedure dbedt_linha_vencExit(Sender: TObject);
    procedure dbedt_col_vencExit(Sender: TObject);
    procedure dbedt_linha_cd_uf_favExit(Sender: TObject);
    procedure dbedt_col_cd_uf_favExit(Sender: TObject);
    procedure dbedt_linha_cd_receitaExit(Sender: TObject);
    procedure dbedt_col_cd_receitaExit(Sender: TObject);
    procedure dbedt_linha_imp_expExit(Sender: TObject);
    procedure dbedt_col_imp_expExit(Sender: TObject);
    procedure dbedt_linha_insc_estExit(Sender: TObject);
    procedure dbedt_col_insc_estExit(Sender: TObject);
    procedure dbedt_linha_cnpjExit(Sender: TObject);
    procedure dbedt_col_cnpjExit(Sender: TObject);
    procedure dbedt_linha_endExit(Sender: TObject);
    procedure dbedt_col_endExit(Sender: TObject);
    procedure dbedt_linha_docto_origemExit(Sender: TObject);
    procedure dbedt_col_docto_origemExit(Sender: TObject);
    procedure dbedt_linha_municipioExit(Sender: TObject);
    procedure dbedt_col_municipioExit(Sender: TObject);
    procedure dbedt_linha_ufExit(Sender: TObject);
    procedure dbedt_col_ufExit(Sender: TObject);
    procedure dbedt_linha_cepExit(Sender: TObject);
    procedure dbedt_col_cepExit(Sender: TObject);
    procedure dbedt_linha_telExit(Sender: TObject);
    procedure dbedt_col_telExit(Sender: TObject);
    procedure dbedt_linha_refExit(Sender: TObject);
    procedure dbedt_col_refExit(Sender: TObject);
    procedure dbedt_linha_vl_princExit(Sender: TObject);
    procedure dbedt_col_vl_princExit(Sender: TObject);
    procedure dbedt_linha_nr_refExit(Sender: TObject);
    procedure dbedt_col_nr_refExit(Sender: TObject);
    procedure dbedt_linha_nm_bancoExit(Sender: TObject);
    procedure dbedt_col_nm_bancoExit(Sender: TObject);
    procedure dbedt_linha_contaExit(Sender: TObject);
    procedure dbedt_col_contaExit(Sender: TObject);
    procedure dbedt_linha_agenciaExit(Sender: TObject);
    procedure dbedt_col_agenciaExit(Sender: TObject);
    procedure dbedt_linha_nr_bancoExit(Sender: TObject);
    procedure dbedt_col_nr_bancoExit(Sender: TObject);
    procedure dbedt_linha_totalExit(Sender: TObject);
    procedure dbedt_col_totalExit(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    function Grava : Boolean;
    function VerAlt : Boolean;
    function Consiste : Boolean;
    procedure Cancelar;
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_ajuste_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_documento : String[3];
  end;

var
  frm_ajuste_impressao_gnre: Tfrm_ajuste_impressao_gnre;

implementation

uses pggp044, GSMLIB, PGGP017;

{$R *.DFM}


procedure Tfrm_ajuste_impressao_gnre.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ajuste_impressao_gnre.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Close;
end;



procedure Tfrm_ajuste_impressao_gnre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_ajuste_impressao_gnre do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_gnre.Destroy;
  Action := caFree;

  Application.ProcessMessages;
end;

procedure Tfrm_ajuste_impressao_gnre.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_gnre, datm_ajuste_impressao_gnre );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_gnre.FormShow(Sender: TObject);
begin
  with datm_ajuste_impressao_gnre do
  begin

    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );

  end;

  pgctrl_ajuste_imp.ActivePAge := ts_lista;
end;

procedure Tfrm_ajuste_impressao_gnre.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_gnre.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_uf_favChange(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     btn_mi( False,True,True,False );
end;

procedure Tfrm_ajuste_impressao_gnre.pgctrl_ajuste_impChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_uf_favExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_uf_fav.Text, dbedt_linha_uf_fav );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_uf_favExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_uf_fav.Text, dbedt_col_uf_fav );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_vencExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_venc.Text, dbedt_linha_venc );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_vencExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_venc.Text, dbedt_col_venc );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_cd_uf_favExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cd_uf_fav.Text, dbedt_linha_cd_uf_fav );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_cd_uf_favExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cd_uf_fav.Text, dbedt_col_cd_uf_fav );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_cd_receitaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cd_receita.Text, dbedt_linha_cd_receita );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_cd_receitaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cd_receita.Text, dbedt_col_cd_receita );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_imp_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_imp_exp.Text, dbedt_linha_imp_exp );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_imp_expExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_imp_exp.Text, dbedt_col_imp_exp );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_insc_estExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_insc_est.Text, dbedt_linha_insc_est );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_insc_estExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_insc_est.Text, dbedt_col_insc_est );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_cnpjExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cnpj.Text, dbedt_linha_cnpj );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_cnpjExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cnpj.Text, dbedt_col_cnpj );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_endExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_end.Text, dbedt_linha_end );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_endExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_end.Text, dbedt_col_end );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_docto_origemExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_docto_origem.Text, dbedt_linha_docto_origem );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_docto_origemExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_docto_origem.Text, dbedt_col_docto_origem );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_municipioExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_municipio.Text, dbedt_linha_municipio );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_municipioExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_municipio.Text, dbedt_col_municipio );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_ufExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_uf.Text, dbedt_linha_uf );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_ufExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_uf.Text, dbedt_col_uf );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_cepExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cep.Text, dbedt_linha_cep );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_cepExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cep.Text, dbedt_col_cep );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_telExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_tel.Text, dbedt_linha_tel );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_telExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_tel.Text, dbedt_col_tel );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_ref.Text, dbedt_linha_ref );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_ref.Text, dbedt_col_ref );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_vl_princExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_vl_princ.Text, dbedt_linha_vl_princ );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_vl_princExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_princ.Text, dbedt_col_vl_princ );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_nr_refExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_nr_ref.Text, dbedt_linha_nr_ref );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_nr_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_nr_ref.Text, dbedt_col_nr_ref );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_nm_bancoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_nm_banco.Text, dbedt_linha_nm_banco );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_nm_bancoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_nm_banco.Text, dbedt_col_nm_banco );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_contaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_conta.Text, dbedt_linha_conta );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_contaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_conta.Text, dbedt_col_conta );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_agenciaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_agencia.Text, dbedt_linha_agencia );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_agenciaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_agencia.Text, dbedt_col_agencia );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_nr_bancoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_nr_banco.Text, dbedt_linha_nr_banco );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_nr_bancoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_nr_banco.Text, dbedt_col_nr_banco );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_linha_totalExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_total.Text, dbedt_linha_total );
end;

procedure Tfrm_ajuste_impressao_gnre.dbedt_col_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_total.Text, dbedt_col_total );
end;

procedure Tfrm_ajuste_impressao_gnre.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False,True,True,False );

  with datm_ajuste_impressao_gnre do
  begin
    pgctrl_ajuste_imp.SetFocus;
    qry_ajuste_impressao_.DisableControls;
    qry_ajuste_impressao_.Cancel;
    qry_ajuste_impressao_.Append;
    qry_ajuste_impressao_.EnableControls;
  end;

  pgctrl_ajuste_imp.ActivePage := ts_dados;
  dbedt_cd_unid_neg.SetFocus;
end;

procedure Tfrm_ajuste_impressao_gnre.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_gnre do
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

procedure Tfrm_ajuste_impressao_gnre.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_gnre.Cancelar;
begin
  with datm_ajuste_impressao_gnre do
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

function Tfrm_ajuste_impressao_gnre.Grava : Boolean;
begin
  Grava := True;

  with datm_ajuste_impressao_gnre do
  begin
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_CD_DOCUMENTO.AsString := str_cd_documento;
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

procedure Tfrm_ajuste_impressao_gnre.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_ajuste_impressao_gnre.pgctrl_ajuste_impChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_gnre.Consiste : Boolean;
begin
  Consiste := True;

  if Trim( dbedt_cd_unid_neg.Text ) = '' then
  begin
    Consiste := False;
    Exit;
  end
  else ValidCodigo( dbedt_cd_unid_neg );

end;

function Tfrm_ajuste_impressao_gnre.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_ajuste_imp.ActivePage = ts_dados then
  begin
    if ( datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [ dsEdit,dsInsert ] ) then
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

procedure Tfrm_ajuste_impressao_gnre.dbedt_cd_unid_negExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_gnre.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg.Text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg );
  end;
end;

end.
