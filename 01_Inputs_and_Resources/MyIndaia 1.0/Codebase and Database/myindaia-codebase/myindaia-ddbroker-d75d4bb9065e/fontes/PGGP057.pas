(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP057.PAS - frm_ajuste_impressao_nf_serv

AUTOR: Leandro Stipanich

DATA: 31/01/2002

Manutenção: Leandro Stipanich

Data: 08/10/2001 - Ajuste de Impressão de Nota Fiscal de Serviço
*************************************************************************************************)

unit PGGP057;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_ajuste_impressao_nf_serv = class(TForm)
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
    dbedt_col_n_referencia: TDBEdit;
    dbedt_linha_n_referencia: TDBEdit;
    dbedt_linha_emissao: TDBEdit;
    dbedt_col_vencimento: TDBEdit;
    dbedt_col_emissao: TDBEdit;
    dbedt_col_razao_social: TDBEdit;
    dbedt_linha_razao_social: TDBEdit;
    dbedt_col_codigo: TDBEdit;
    dbedt_linha_endereco: TDBEdit;
    dbedt_col_endereco: TDBEdit;
    dbedt_col_bairro: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    dbedt_linha_municipio: TDBEdit;
    dbedt_col_municipio: TDBEdit;
    Label11: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbedt_col_cnpj: TDBEdit;
    dbedt_linha_cnpj: TDBEdit;
    dbedt_col_cep: TDBEdit;
    dbedt_col_uf: TDBEdit;
    Label20: TLabel;
    Label23: TLabel;
    dbedt_col_ie: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbedt_col_s_referencia: TDBEdit;
    dbedt_linha_s_referencia: TDBEdit;
    dbedt_linha_area: TDBEdit;
    dbedt_col_analista: TDBEdit;
    dbedt_col_area: TDBEdit;
    dbedt_col_nat_despacho: TDBEdit;
    dbedt_linha_nat_despacho: TDBEdit;
    dbedt_col_modal: TDBEdit;
    dbedt_linha_veiculo: TDBEdit;
    dbedt_col_veiculo: TDBEdit;
    dbedt_col_destino: TDBEdit;
    dbedt_col_origem: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    dbedt_col_peso_liquido: TDBEdit;
    dbedt_linha_volumes: TDBEdit;
    dbedt_col_peso_bruto: TDBEdit;
    dbedt_col_volumes: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    dbedt_col_valor_fob: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedt_col_obs: TDBEdit;
    dbedt_linha_obs: TDBEdit;
    dbedt_linha_valor_fob: TDBEdit;
    dbedt_col_servicos: TDBEdit;
    dbedt_col_indaia: TDBEdit;
    dbedt_col_nao_tributavel: TDBEdit;
    dbedt_linha_nao_tributavel: TDBEdit;
    dbedt_col_sub_total_tributavel: TDBEdit;
    dbedt_linha_comissao: TDBEdit;
    dbedt_col_comissao: TDBEdit;
    dbedt_col_total_tributavel: TDBEdit;
    dbedt_linha_total_geral: TDBEdit;
    dbedt_col_total_geral: TDBEdit;
    Label40: TLabel;
    dbedt_linha_total_tributavel: TDBEdit;
    dbedt_col_irrf: TDBEdit;
    dbedt_col_iss: TDBEdit;
    Label42: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    dbedt_col_descricao: TDBEdit;
    dbedt_linha_di: TDBEdit;
    dbedt_col_di: TDBEdit;
    dbedt_col_valor_cif: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    dbedt_col_cliente: TDBEdit;
    dbedt_linha_descricao: TDBEdit;
    Label39: TLabel;
    dbedt_nr_linhas: TDBEdit;
    Label41: TLabel;
    dbedt_nr_ult_nf_serv: TDBEdit;
    dbedt_linha_iss: TDBEdit;
    dbedt_linha_irrf: TDBEdit;
    Label43: TLabel;
    dbedt_linha_cofins: TDBEdit;
    dbedt_col_cofins: TDBEdit;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_linha_emissaoChange(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure dbedt_linha_emissaoExit(Sender: TObject);
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
    procedure dbedt_col_emissaoExit(Sender: TObject);
    procedure dbedt_col_vencimentoExit(Sender: TObject);
    procedure dbedt_linha_n_referenciaExit(Sender: TObject);
    procedure dbedt_col_n_referenciaExit(Sender: TObject);
    procedure dbedt_col_razao_socialExit(Sender: TObject);
    procedure dbedt_linha_razao_socialExit(Sender: TObject);
    procedure dbedt_col_codigoExit(Sender: TObject);
    procedure dbedt_linha_enderecoExit(Sender: TObject);
    procedure dbedt_col_enderecoExit(Sender: TObject);
    procedure dbedt_col_bairroExit(Sender: TObject);
    procedure dbedt_linha_municipioExit(Sender: TObject);
    procedure dbedt_col_municipioExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_col_ufExit(Sender: TObject);
    procedure dbedt_col_cepExit(Sender: TObject);
    procedure dbedt_linha_cnpjExit(Sender: TObject);
    procedure dbedt_col_cnpjExit(Sender: TObject);
    procedure dbedt_col_ieExit(Sender: TObject);
    procedure dbedt_linha_areaExit(Sender: TObject);
    procedure dbedt_col_areaExit(Sender: TObject);
    procedure dbedt_col_analistaExit(Sender: TObject);
    procedure dbedt_linha_s_referenciaExit(Sender: TObject);
    procedure dbedt_col_s_referenciaExit(Sender: TObject);
    procedure dbedt_linha_nat_despachoExit(Sender: TObject);
    procedure dbedt_col_nat_despachoExit(Sender: TObject);
    procedure dbedt_col_modalExit(Sender: TObject);
    procedure dbedt_linha_veiculoExit(Sender: TObject);
    procedure dbedt_col_veiculoExit(Sender: TObject);
    procedure dbedt_col_origemExit(Sender: TObject);
    procedure dbedt_col_destinoExit(Sender: TObject);
    procedure dbedt_linha_volumesExit(Sender: TObject);
    procedure dbedt_col_volumesExit(Sender: TObject);
    procedure dbedt_col_peso_brutoExit(Sender: TObject);
    procedure dbedt_col_peso_liquidoExit(Sender: TObject);
    procedure dbedt_linha_valor_fobExit(Sender: TObject);
    procedure dbedt_col_valor_fobExit(Sender: TObject);
    procedure dbedt_col_valor_cifExit(Sender: TObject);
    procedure dbedt_linha_diExit(Sender: TObject);
    procedure dbedt_col_diExit(Sender: TObject);
    procedure dbedt_linha_descricaoExit(Sender: TObject);
    procedure dbedt_col_descricaoExit(Sender: TObject);
    procedure dbedt_col_clienteExit(Sender: TObject);
    procedure dbedt_col_indaiaExit(Sender: TObject);
    procedure dbedt_col_servicosExit(Sender: TObject);
    procedure dbedt_linha_obsExit(Sender: TObject);
    procedure dbedt_col_obsExit(Sender: TObject);
    procedure dbedt_linha_nao_tributavelExit(Sender: TObject);
    procedure dbedt_col_nao_tributavelExit(Sender: TObject);
    procedure dbedt_col_sub_total_tributavelExit(Sender: TObject);
    procedure dbedt_linha_comissaoExit(Sender: TObject);
    procedure dbedt_col_comissaoExit(Sender: TObject);
    procedure dbedt_linha_total_geralExit(Sender: TObject);
    procedure dbedt_col_total_geralExit(Sender: TObject);
    procedure dbedt_linha_total_tributavelExit(Sender: TObject);
    procedure dbedt_col_total_tributavelExit(Sender: TObject);
    procedure dbedt_linha_issExit(Sender: TObject);
    procedure dbedt_col_issExit(Sender: TObject);
    procedure dbedt_linha_irrfExit(Sender: TObject);
    procedure dbedt_col_irrfExit(Sender: TObject);
    procedure dbedt_nr_ult_nf_servExit(Sender: TObject);
    procedure dbedt_nr_linhasExit(Sender: TObject);
    procedure dbedt_col_cofinsExit(Sender: TObject);
    procedure dbedt_linha_cofinsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_unid_neg_ajuste : String[2];
    str_nr_bco_ajuste : String[3];
  end;

var
  frm_ajuste_impressao_nf_serv: Tfrm_ajuste_impressao_nf_serv;

implementation

uses PGGP058, GSMLIB, PGGP017, PGSM018;

{$R *.DFM}

procedure Tfrm_ajuste_impressao_nf_serv.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ajuste_impressao_nf_serv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_ajuste_impressao_nf_serv do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_nf_serv.Destroy;
  Action := caFree;

  Application.ProcessMessages;
end;

procedure Tfrm_ajuste_impressao_nf_serv.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_nf_serv, datm_ajuste_impressao_nf_serv );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_nf_serv.FormShow(Sender: TObject);
begin
  with datm_ajuste_impressao_nf_serv do
  begin

    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;

    qry_lista_.Close;
    qry_lista_.Prepare;
    qry_lista_.Open;

    btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );

  end;

  pgctrl_ajuste_imp.ActivePAge := ts_lista;
end;

procedure Tfrm_ajuste_impressao_nf_serv.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_nf_serv.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_emissaoChange(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ajuste_impressao_nf_serv.pgctrl_ajuste_impChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_nf_serv.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False, True, True, False );

  with datm_ajuste_impressao_nf_serv do
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

procedure Tfrm_ajuste_impressao_nf_serv.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_nf_serv do
  begin

    if BoxMensagem( 'Este Ajuste de Impressão será excluído! Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_.Delete;

      datm_main.db_broker.Commit;

      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;

      btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );
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

procedure Tfrm_ajuste_impressao_nf_serv.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_nf_serv.Cancelar;
begin
  with datm_ajuste_impressao_nf_serv do
  begin

    if qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
      qry_ajuste_impressao_.Cancel;

    btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );
  end;
end;

function Tfrm_ajuste_impressao_nf_serv.Grava : Boolean;
begin
  Grava := True;

  with datm_ajuste_impressao_nf_serv do
  begin
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_.Post;

      str_cd_unid_neg_ajuste := qry_ajuste_impressao_CD_UNID_NEG.AsString;

      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate( 'CD_UNID_NEG', str_cd_unid_neg_ajuste, [loCaseInsensitive]);

      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        qry_ajuste_impressao_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );
        Grava := False;
        Exit;
      end;
    end;

    btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );
  end;
end;

procedure Tfrm_ajuste_impressao_nf_serv.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_ajuste_impressao_nf_serv.pgctrl_ajuste_impChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_nf_serv.Consiste : Boolean;
begin
  Consiste := True;

  if datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
  begin
    if dbedt_cd_unid_neg.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_unid_neg );
      if Trim( dbedt_nm_unid_neg.Text ) = '' then
      begin
        BoxMensagem( 'Unidade de Negócio inválida!', 2 );
        dbedt_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_ajuste_impressao_nf_serv.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_ajuste_imp.ActivePage = ts_dados then
  begin
    if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [ dsEdit,dsInsert ] ) then
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

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_emissaoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_emissao.Text, dbedt_linha_emissao );

end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_emissaoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_emissao.Text, dbedt_col_emissao );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_vencimentoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_vencimento.Text, dbedt_col_vencimento );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_n_referenciaExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_n_referencia.Text, dbedt_linha_n_referencia );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_n_referenciaExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_n_referencia.Text, dbedt_col_n_referencia );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_razao_socialExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_razao_social.Text, dbedt_col_razao_social );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_razao_socialExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_razao_social.Text, dbedt_linha_razao_social );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_codigoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_codigo.Text, dbedt_col_codigo );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_enderecoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_endereco.Text, dbedt_linha_endereco );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_enderecoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_endereco.Text, dbedt_col_endereco );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_bairroExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_bairro.Text, dbedt_col_bairro );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_municipioExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_municipio.Text, dbedt_linha_municipio );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_municipioExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_municipio.Text, dbedt_col_municipio );
end;

procedure Tfrm_ajuste_impressao_nf_serv.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
  end;
end;

procedure Tfrm_ajuste_impressao_nf_serv.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
         datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ajuste_impressao_nf_serv do
  begin
    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
  end;
  dbedt_cd_unid_negExit(nil);
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_ufExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_uf.Text, dbedt_col_uf );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_cepExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_cep.Text, dbedt_col_cep );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_cnpjExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_cnpj.Text, dbedt_linha_cnpj );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_cnpjExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_cnpj.Text, dbedt_col_cnpj );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_ieExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_ie.Text, dbedt_col_ie );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_areaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_area.Text, dbedt_linha_area );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_areaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_area.Text, dbedt_col_area );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_analistaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_analista.Text, dbedt_col_analista );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_s_referenciaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_s_referencia.Text, dbedt_linha_s_referencia );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_s_referenciaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_s_referencia.Text, dbedt_col_s_referencia );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_nat_despachoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_nat_despacho.Text, dbedt_linha_nat_despacho );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_nat_despachoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_nat_despacho.Text, dbedt_col_nat_despacho );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_modalExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_modal.Text, dbedt_col_modal );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_veiculoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_veiculo.Text, dbedt_linha_veiculo );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_veiculoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_veiculo.Text, dbedt_col_veiculo );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_origemExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_origem.Text, dbedt_col_origem );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_destinoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_destino.Text, dbedt_col_destino );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_volumesExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_volumes.Text, dbedt_linha_volumes );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_volumesExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_volumes.Text, dbedt_col_volumes );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_peso_brutoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_peso_bruto.Text, dbedt_col_peso_bruto );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_peso_liquidoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_peso_liquido.Text, dbedt_col_peso_liquido );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_valor_fobExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_valor_fob.Text, dbedt_linha_valor_fob );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_valor_fobExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_valor_fob.Text, dbedt_col_valor_fob );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_valor_cifExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_valor_cif.Text, dbedt_col_valor_cif );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_diExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_di.Text, dbedt_linha_di );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_diExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_di.Text, dbedt_col_di );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_descricaoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_descricao.Text, dbedt_linha_descricao );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_descricaoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_descricao.Text, dbedt_col_descricao );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_clienteExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_cliente.Text, dbedt_col_cliente );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_indaiaExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_indaia.Text, dbedt_col_indaia );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_servicosExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_servicos.Text, dbedt_col_servicos );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_obsExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_obs.Text, dbedt_linha_obs );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_obsExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_obs.Text, dbedt_col_obs );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_nao_tributavelExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_nao_tributavel.Text, dbedt_linha_nao_tributavel );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_nao_tributavelExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_nao_tributavel.Text, dbedt_col_nao_tributavel );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_sub_total_tributavelExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_sub_total_tributavel.Text, dbedt_col_sub_total_tributavel );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_comissaoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_comissao.Text, dbedt_linha_comissao );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_comissaoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_comissao.Text, dbedt_col_comissao );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_total_geralExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_total_geral.Text, dbedt_linha_total_geral );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_total_geralExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_total_geral.Text, dbedt_col_total_geral );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_total_tributavelExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_total_tributavel.Text, dbedt_linha_total_tributavel );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_total_tributavelExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_total_tributavel.Text, dbedt_col_total_tributavel );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_issExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_iss.Text, dbedt_linha_iss );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_issExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_iss.Text, dbedt_col_iss );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_irrfExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_irrf.Text, dbedt_linha_irrf );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_irrfExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_irrf.Text, dbedt_col_irrf );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_nr_ult_nf_servExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    ValidCodigo( dbedt_nr_ult_nf_serv );
end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_nr_linhasExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    ValidCodigo( dbedt_nr_linhas );
end;



procedure Tfrm_ajuste_impressao_nf_serv.dbedt_col_cofinsExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_cofins.Text, dbedt_col_cofins );

end;

procedure Tfrm_ajuste_impressao_nf_serv.dbedt_linha_cofinsExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_nf_serv.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_cofins.Text, dbedt_linha_cofins );
end;

end.
