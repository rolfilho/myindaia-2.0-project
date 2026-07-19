(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGDI037.PAS - Formulário - Ajuste de Impressão do ICMS

AUTOR: Leandro Stipanich

DATA: ?

Manutenção: Leandro Stipanich

*************************************************************************************************)

unit PGGP037;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Db, Grids, DBGrids, ComCtrls, Menus,
  Buttons;

type
  Tfrm_ajuste_impressao_icms = class(TForm)
    pgctrl_ajuste_imp: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_rs: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label001: TLabel;
    Label002: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    dbedt_linha_cgc: TDBEdit;
    dbedt_col_cgc: TDBEdit;
    dbedt_linha_contribuinte: TDBEdit;
    dbedt_col_contribuinte: TDBEdit;
    dbedt_col_dt_refer: TDBEdit;
    dbedt_linha_endereco: TDBEdit;
    dbedt_col_endereco: TDBEdit;
    dbedt_linha_cep: TDBEdit;
    dbedt_col_cep: TDBEdit;
    dbedt_col_telefone: TDBEdit;
    dbedt_col_dt_vencimento: TDBEdit;
    dbedt_linha_nr_registro: TDBEdit;
    dbedt_col_nr_registro: TDBEdit;
    dbedt_linha_texto: TDBEdit;
    dbedt_col_texto: TDBEdit;
    dbedt_col_cd_receita: TDBEdit;
    dbedt_col_valor: TDBEdit;
    dbedt_linha_espec_receita: TDBEdit;
    dbedt_col_espec_receita: TDBEdit;
    dbedt_linha_vl_total: TDBEdit;
    dbedt_col_vl_total: TDBEdit;
    DBGrid1: TDBGrid;
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
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    btn_co_unid_neg: TSpeedButton;
    ts_dados_sp: TTabSheet;
    Panel2: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    btn_co_unid_neg2: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    dbedt_linha_contribuinte2: TDBEdit;
    dbedt_col_contribuinte2: TDBEdit;
    dbedt_col_municipio2: TDBEdit;
    dbedt_linha_end2: TDBEdit;
    dbedt_col_end2: TDBEdit;
    dbedt_col_uf2: TDBEdit;
    dbedt_col_tel: TDBEdit;
    dbedt_col_cae: TDBEdit;
    dbedt_col_cd_receita2: TDBEdit;
    dbedt_col_div_at: TDBEdit;
    dbedt_linha_ref: TDBEdit;
    dbedt_col_ref: TDBEdit;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    dbedt_col_cgc_cpf: TDBEdit;
    dbedt_linha_aiim: TDBEdit;
    dbedt_col_aiim: TDBEdit;
    dbedt_linha_juros: TDBEdit;
    dbedt_col_juros: TDBEdit;
    dbedt_linha_acrescimo: TDBEdit;
    dbedt_col_acrescimo: TDBEdit;
    dbedt_col_honorario: TDBEdit;
    dbedt_col_dt_venc: TDBEdit;
    dbedt_linha_dt_venc: TDBEdit;
    dbedt_col_nr_insc_est2: TDBEdit;
    dbedt_linha_municipio2: TDBEdit;
    dbedt_col_vl_receita: TDBEdit;
    dbedt_linha_vl_receita: TDBEdit;
    dbedt_linha_honorario: TDBEdit;
    dbedt_linha_total: TDBEdit;
    dbedt_col_total: TDBEdit;
    dbedt_linha_div_at: TDBEdit;
    dbedt_linha_obs: TDBEdit;
    dbedt_col_obs: TDBEdit;
    dbedt_linha_multa: TDBEdit;
    dbedt_col_multa: TDBEdit;
    Label37: TLabel;
    dbedt_linha_nr_registro2: TDBEdit;
    dbedt_col_nr_registro2: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedt_linha_cgcChange(Sender: TObject);
    procedure dbedt_linha_cgcExit(Sender: TObject);
    procedure dbedt_col_cgcExit(Sender: TObject);
    procedure dbedt_linha_contribuinteExit(Sender: TObject);
    procedure dbedt_col_contribuinteExit(Sender: TObject);
    procedure dbedt_col_dt_referExit(Sender: TObject);
    procedure dbedt_linha_enderecoExit(Sender: TObject);
    procedure dbedt_col_enderecoExit(Sender: TObject);
    procedure dbedt_col_cepExit(Sender: TObject);
    procedure dbedt_col_telefoneExit(Sender: TObject);
    procedure dbedt_col_dt_vencimentoExit(Sender: TObject);
    procedure dbedt_linha_nr_registroExit(Sender: TObject);
    procedure dbedt_col_nr_registroExit(Sender: TObject);
    procedure dbedt_linha_textoExit(Sender: TObject);
    procedure dbedt_col_textoExit(Sender: TObject);
    procedure dbedt_col_cd_receitaExit(Sender: TObject);
    procedure dbedt_col_valorExit(Sender: TObject);
    procedure dbedt_linha_espec_receitaExit(Sender: TObject);
    procedure dbedt_col_espec_receitaExit(Sender: TObject);
    procedure dbedt_linha_vl_totalExit(Sender: TObject);
    procedure dbedt_col_vl_totalExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_linha_cepExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    function  Grava  : Boolean;
    function  VerAlt : Boolean;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure pgctrl_ajuste_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_linha_dt_vencExit(Sender: TObject);
    procedure dbedt_col_dt_vencExit(Sender: TObject);
    procedure dbedt_linha_contribuinte2Exit(Sender: TObject);
    procedure dbedt_col_contribuinte2Exit(Sender: TObject);
    procedure dbedt_col_cd_receita2Exit(Sender: TObject);
    procedure dbedt_linha_end2Exit(Sender: TObject);
    procedure dbedt_col_end2Exit(Sender: TObject);
    procedure dbedt_col_nr_insc_est2Exit(Sender: TObject);
    procedure dbedt_linha_municipio2Exit(Sender: TObject);
    procedure dbedt_col_municipio2Exit(Sender: TObject);
    procedure dbedt_col_uf2Exit(Sender: TObject);
    procedure dbedt_col_telExit(Sender: TObject);
    procedure dbedt_col_caeExit(Sender: TObject);
    procedure dbedt_col_cgc_cpfExit(Sender: TObject);
    procedure dbedt_linha_div_atExit(Sender: TObject);
    procedure dbedt_col_div_atExit(Sender: TObject);
    procedure dbedt_linha_obsExit(Sender: TObject);
    procedure dbedt_col_obsExit(Sender: TObject);
    procedure dbedt_linha_refExit(Sender: TObject);
    procedure dbedt_col_refExit(Sender: TObject);
    procedure dbedt_linha_aiimExit(Sender: TObject);
    procedure dbedt_col_aiimExit(Sender: TObject);
    procedure dbedt_linha_vl_receitaExit(Sender: TObject);
    procedure dbedt_col_vl_receitaExit(Sender: TObject);
    procedure dbedt_linha_jurosExit(Sender: TObject);
    procedure dbedt_col_jurosExit(Sender: TObject);
    procedure dbedt_linha_multaExit(Sender: TObject);
    procedure dbedt_col_multaExit(Sender: TObject);
    procedure dbedt_linha_acrescimoExit(Sender: TObject);
    procedure dbedt_col_acrescimoExit(Sender: TObject);
    procedure dbedt_linha_honorarioExit(Sender: TObject);
    procedure dbedt_col_honorarioExit(Sender: TObject);
    procedure dbedt_linha_totalExit(Sender: TObject);
    procedure dbedt_col_totalExit(Sender: TObject);
    procedure dbedt_linha_nr_registro2Exit(Sender: TObject);
    procedure dbedt_col_nr_registro2Exit(Sender: TObject);
  private
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    { Private declarations }
  public
    { Public declarations }
    str_cd_documento : String;
  end;

var
  frm_ajuste_impressao_icms: Tfrm_ajuste_impressao_icms;

implementation

uses PGGP038, PGGP017, GSMLIB, PGSM018;

{$R *.DFM}


procedure Tfrm_ajuste_impressao_icms.FormShow(Sender: TObject);
begin
  case StrToInt(str_cd_documento) of
    1 : Caption := 'Ajuste de Impressão - ICMS - Rio Grande do Sul';
    2 : Caption := 'Ajuste de Impressão - ICMS - São Paulo';
    3 : Caption := 'Ajuste de Impressão - ICMS - Santos';
  end;

  if StrToInt(str_cd_documento) = 1 then
     ts_dados_sp.TabVisible := False
  else if StrToInt(str_cd_documento) = 2 then
     ts_dados_rs.TabVisible := False;

  with datm_ajuste_impressao_icms do
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

procedure Tfrm_ajuste_impressao_icms.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_icms, datm_ajuste_impressao_icms );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_cgcChange(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     btn_mi( False, True, True, False );      
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_cgcExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_cgc.Text, dbedt_linha_cgc );
end;

procedure Tfrm_ajuste_impressao_icms.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_cgcExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cgc.Text, dbedt_col_cgc );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_contribuinteExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_contribuinte.Text, dbedt_linha_contribuinte );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_contribuinteExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_contribuinte.Text, dbedt_col_contribuinte );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_dt_referExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_dt_refer.Text, dbedt_col_dt_refer );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_enderecoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_endereco.Text, dbedt_linha_endereco );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_enderecoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_endereco.Text, dbedt_col_endereco );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_cepExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cep.Text, dbedt_col_cep );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_telefoneExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_telefone.Text, dbedt_col_telefone );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_dt_vencimentoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_dt_vencimento.Text, dbedt_col_dt_vencimento );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_nr_registroExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_registro.Text, dbedt_linha_nr_registro );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_nr_registroExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_registro.Text, dbedt_col_nr_registro );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_textoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_texto.Text, dbedt_linha_texto );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_textoExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_texto.Text, dbedt_col_texto );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_cd_receitaExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_cd_receita.Text, dbedt_col_cd_receita );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_valorExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_valor.Text, dbedt_col_valor );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_espec_receitaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_espec_receita.Text, dbedt_linha_espec_receita );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_espec_receitaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_espec_receita.Text, dbedt_col_espec_receita );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_vl_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_vl_total.Text, dbedt_linha_vl_total );

end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_vl_totalExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_vl_total.Text, dbedt_col_vl_total );

end;

procedure Tfrm_ajuste_impressao_icms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_ajuste_impressao_icms do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_icms.Destroy;
  Action := caFree;

  Application.ProcessMessages;
end;


procedure Tfrm_ajuste_impressao_icms.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then Close;
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_cepExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_cep.Text, dbedt_linha_cep );
end;

procedure Tfrm_ajuste_impressao_icms.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ajuste_impressao_icms.btn_salvarClick(Sender: TObject);
begin
  if not Grava then Exit;
end;

procedure Tfrm_ajuste_impressao_icms.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_icms.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False,True,True,False );

  with datm_ajuste_impressao_icms do
  begin
    pgctrl_ajuste_imp.SetFocus;
    qry_ajuste_impressao_.DisableControls;
    qry_ajuste_impressao_.Cancel;
    qry_ajuste_impressao_.Append;
    qry_ajuste_impressao_.EnableControls;
  end;

  if StrToInt(str_cd_documento) = 1 then
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_rs;
    dbedt_cd_unid_neg.SetFocus;
  end
  else if StrToInt(str_cd_documento) = 2 then
  begin
    pgctrl_ajuste_imp.ActivePage := ts_dados_sp;
    dbedt_cd_unid_neg2.SetFocus;
  end;
end;


procedure Tfrm_ajuste_impressao_icms.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_icms do
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

procedure Tfrm_ajuste_impressao_icms.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_icms.Cancelar;
var
  str_unidade : String[2];
begin
  with datm_ajuste_impressao_icms do
  begin

    if qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
      qry_ajuste_impressao_.Cancel;

    str_unidade := qry_ajuste_impressao_CD_UNID_NEG.AsString;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    fLocaliza( qry_ajuste_impressao_, str_unidade, 'CD_UNID_NEG' );

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );

  end;
end;

function Tfrm_ajuste_impressao_icms.Grava : Boolean;
var
  str_unidade : String[2];
begin
  Grava := True;

  with datm_ajuste_impressao_icms do
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

    str_unidade := qry_ajuste_impressao_CD_UNID_NEG.AsString;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_DOCUMENTO').AsString := str_cd_documento;
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;

    fLocaliza( qry_ajuste_impressao_, str_unidade, 'CD_UNID_NEG' );

    btn_mi( True,False,False,qry_ajuste_impressao_.RecordCount > 0 );

  end;

end;

procedure Tfrm_ajuste_impressao_icms.pgctrl_ajuste_impChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_icms.pgctrl_ajuste_impChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_icms.VerAlt : Boolean;
begin
  VerAlt := True;

  if (pgctrl_ajuste_imp.ActivePage = ts_dados_rs) or
     (pgctrl_ajuste_imp.ActivePage = ts_dados_sp) then
  begin
    if ( datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit] ) or
       ( datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Este Ajuste de Impressão foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
      begin
        {if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;}

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

procedure Tfrm_ajuste_impressao_icms.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_ajuste_impressao_icms do
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

procedure Tfrm_ajuste_impressao_icms.dbedt_cd_unid_negExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg.Text = '' then Exit;
    ValidCodigo( dbedt_cd_unid_neg );
  end;
end;


procedure Tfrm_ajuste_impressao_icms.dbedt_linha_dt_vencExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_dt_venc.Text, dbedt_linha_dt_venc );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_dt_vencExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_dt_venc.Text, dbedt_col_dt_venc );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_contribuinte2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_contribuinte2.Text, dbedt_linha_contribuinte2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_contribuinte2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_contribuinte2.Text, dbedt_col_contribuinte2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_cd_receita2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_cd_receita2.Text, dbedt_col_cd_receita2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_end2Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_end2.Text, dbedt_linha_end2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_end2Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_end2.Text, dbedt_col_end2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_nr_insc_est2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_nr_insc_est2.Text, dbedt_col_nr_insc_est2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_municipio2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_municipio2.Text, dbedt_linha_municipio2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_municipio2Exit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_municipio2.Text, dbedt_col_municipio2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_uf2Exit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_uf2.Text, dbedt_col_uf2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_telExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_tel.Text, dbedt_col_tel );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_caeExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_cae.Text, dbedt_col_cae );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_cgc_cpfExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_cgc_cpf.Text, dbedt_col_cgc_cpf );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_div_atExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_div_at.Text, dbedt_linha_div_at );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_div_atExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_div_at.Text, dbedt_col_div_at );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_obsExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_obs.Text, dbedt_linha_obs );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_obsExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_obs.Text, dbedt_col_obs );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_refExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_ref.Text, dbedt_linha_ref );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_refExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_ref.Text, dbedt_col_ref );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_aiimExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_aiim.Text, dbedt_linha_aiim );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_aiimExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_aiim.Text, dbedt_col_aiim );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_vl_receitaExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_vl_receita.Text, dbedt_linha_vl_receita );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_vl_receitaExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_vl_receita.Text, dbedt_col_vl_receita );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_jurosExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_juros.Text, dbedt_linha_juros );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_jurosExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_juros.Text, dbedt_col_juros );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_multaExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_multa.Text, dbedt_linha_multa );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_multaExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_multa.Text, dbedt_col_multa );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_acrescimoExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_acrescimo.Text, dbedt_linha_acrescimo );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_acrescimoExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_acrescimo.Text, dbedt_col_acrescimo );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_honorarioExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_honorario.Text, dbedt_linha_honorario );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_honorarioExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_honorario.Text, dbedt_col_honorario );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_totalExit(
  Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_linha_total.Text, dbedt_linha_total );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_totalExit(Sender: TObject);
begin
  if datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
    Inclui_Zeros( dbedt_col_total.Text, dbedt_col_total );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_linha_nr_registro2Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_linha_nr_registro2.Text, dbedt_linha_nr_registro2 );
end;

procedure Tfrm_ajuste_impressao_icms.dbedt_col_nr_registro2Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_icms.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     Inclui_Zeros( dbedt_col_nr_registro2.Text, dbedt_col_nr_registro2 );
end;

end.
