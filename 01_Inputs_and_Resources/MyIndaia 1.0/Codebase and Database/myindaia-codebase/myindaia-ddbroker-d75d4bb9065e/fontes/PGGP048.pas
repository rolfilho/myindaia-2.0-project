unit PGGP048;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_ajuste_impressao_exoneracao = class(TForm)
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_col_processo: TDBEdit;
    dbedt_linha_uf_sec: TDBEdit;
    dbedt_linha_empresa: TDBEdit;
    dbedt_col_empresa: TDBEdit;
    dbedt_col_uf_sec: TDBEdit;
    dbedt_col_nr_di: TDBEdit;
    dbedt_col_dt_reg_di: TDBEdit;
    dbedt_linha_ie: TDBEdit;
    dbedt_col_ie: TDBEdit;
    dbedt_col_cnpj: TDBEdit;
    dbedt_col_cae: TDBEdit;
    dbedt_col_desemb: TDBEdit;
    dbedt_col_ufarm: TDBEdit;
    dbedt_linha_end: TDBEdit;
    dbedt_col_end: TDBEdit;
    dbedt_col_bairro: TDBEdit;
    dbedt_linha_cep: TDBEdit;
    dbedt_col_cep: TDBEdit;
    dbedt_col_municipio: TDBEdit;
    dbedt_col_uf_emp: TDBEdit;
    dbedt_col_vl_cif: TDBEdit;
    dbedt_linha_adicao: TDBEdit;
    dbedt_col_adicao: TDBEdit;
    dbedt_col_classe: TDBEdit;
    dbedt_col_trat: TDBEdit;
    dbedt_col_fund_legal: TDBEdit;
    dbedt_col_valor_mcv: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_linha_data: TDBEdit;
    Label18: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbedt_col_tel: TDBEdit;
    dbedt_col_representante: TDBEdit;
    dbedt_col_data: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    dbedt_linha_obs: TDBEdit;
    dbedt_col_obs: TDBEdit;
    Label29: TLabel;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    function  Grava : Boolean;
    function  Consiste : Boolean;
    function   VerAlt : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure pgctrl_ajuste_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_linha_uf_secExit(Sender: TObject);
    procedure dbedt_col_uf_secExit(Sender: TObject);
    procedure dbedt_linha_empresaExit(Sender: TObject);
    procedure dbedt_col_empresaExit(Sender: TObject);
    procedure dbedt_col_processoExit(Sender: TObject);
    procedure dbedt_col_nr_diExit(Sender: TObject);
    procedure dbedt_col_dt_reg_diExit(Sender: TObject);
    procedure dbedt_linha_ieExit(Sender: TObject);
    procedure dbedt_col_ieExit(Sender: TObject);
    procedure dbedt_col_cnpjExit(Sender: TObject);
    procedure dbedt_col_caeExit(Sender: TObject);
    procedure dbedt_col_desembExit(Sender: TObject);
    procedure dbedt_col_ufarmExit(Sender: TObject);
    procedure dbedt_linha_endExit(Sender: TObject);
    procedure dbedt_col_endExit(Sender: TObject);
    procedure dbedt_col_bairroExit(Sender: TObject);
    procedure dbedt_linha_cepExit(Sender: TObject);
    procedure dbedt_col_cepExit(Sender: TObject);
    procedure dbedt_col_municipioExit(Sender: TObject);
    procedure dbedt_col_uf_empExit(Sender: TObject);
    procedure dbedt_col_telExit(Sender: TObject);
    procedure dbedt_col_vl_cifExit(Sender: TObject);
    procedure dbedt_linha_adicaoExit(Sender: TObject);
    procedure dbedt_col_adicaoExit(Sender: TObject);
    procedure dbedt_col_classeExit(Sender: TObject);
    procedure dbedt_col_tratExit(Sender: TObject);
    procedure dbedt_col_fund_legalExit(Sender: TObject);
    procedure dbedt_col_valor_mcvExit(Sender: TObject);
    procedure dbedt_linha_dataExit(Sender: TObject);
    procedure dbedt_col_dataExit(Sender: TObject);
    procedure dbedt_col_representanteExit(Sender: TObject);
    procedure dbedt_linha_obsExit(Sender: TObject);
    procedure dbedt_col_obsExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_documento : String[3];
  end;

var
  frm_ajuste_impressao_exoneracao: Tfrm_ajuste_impressao_exoneracao;

implementation

uses PGGP050, PGGP017, GSMLIB;

{$R *.DFM}

procedure Tfrm_ajuste_impressao_exoneracao.btn_sairClick(Sender: TObject);
begin
  Close
end;

procedure Tfrm_ajuste_impressao_exoneracao.btn_incluirClick(
  Sender: TObject);
begin
  btn_mi( False,True,True,False );

  with datm_ajuste_impressao_exoneracao do
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

procedure Tfrm_ajuste_impressao_exoneracao.btn_salvarClick(
  Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_ajuste_impressao_exoneracao.btn_cancelarClick(
  Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_exoneracao.btn_excluirClick(
  Sender: TObject);
begin
  with datm_ajuste_impressao_exoneracao do
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

procedure Tfrm_ajuste_impressao_exoneracao.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_exoneracao.Cancelar;
var
  str_unidade : String;
begin
  with datm_ajuste_impressao_exoneracao do
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

function Tfrm_ajuste_impressao_exoneracao.Grava : Boolean;
var
  str_unidade : String[2];
begin

  Grava := True;

  with datm_ajuste_impressao_exoneracao do
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

function Tfrm_ajuste_impressao_exoneracao.Consiste : Boolean;
begin

  Consiste := True;

  if Trim( dbedt_cd_unid_neg.Text ) = '' then
  begin
    Consiste := False;
    Exit;
  end
  else ValidCodigo( dbedt_cd_unid_neg );

end;

function Tfrm_ajuste_impressao_exoneracao.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_ajuste_imp.ActivePage = ts_dados then
  begin
    if ( datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [ dsEdit,dsInsert ] ) then
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

procedure Tfrm_ajuste_impressao_exoneracao.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_cd_unid_negChange(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     btn_mi( False,True,True,False );
end;

procedure Tfrm_ajuste_impressao_exoneracao.pgctrl_ajuste_impChange(
  Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista
end;

procedure Tfrm_ajuste_impressao_exoneracao.pgctrl_ajuste_impChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_uf_secExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_uf_sec.Text, dbedt_linha_uf_sec );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_uf_secExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_uf_sec.Text, dbedt_col_uf_sec );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_empresaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_empresa.Text, dbedt_linha_empresa );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_empresaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_empresa.Text, dbedt_col_empresa );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_processoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_processo.Text, dbedt_col_processo );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_nr_diExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_nr_di.Text, dbedt_col_nr_di );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_dt_reg_diExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_dt_reg_di.Text, dbedt_col_dt_reg_di );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_ieExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_ie.Text, dbedt_linha_ie );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_ieExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_ie.Text, dbedt_col_ie );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_cnpjExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cnpj.Text, dbedt_col_cnpj );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_caeExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cae.Text, dbedt_col_cae );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_desembExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_desemb.Text, dbedt_col_desemb );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_ufarmExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_ufarm.Text, dbedt_col_ufarm );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_endExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_end.Text, dbedt_linha_end );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_endExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_end.Text, dbedt_col_end );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_bairroExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_bairro.Text, dbedt_col_bairro );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_cepExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cep.Text, dbedt_linha_cep );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_cepExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cep.Text, dbedt_col_cep );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_municipioExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_municipio.Text, dbedt_col_municipio );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_uf_empExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_uf_emp.Text, dbedt_col_uf_emp );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_telExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_tel.Text, dbedt_col_tel );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_vl_cifExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_cif.Text, dbedt_col_vl_cif );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_adicaoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_adicao.Text, dbedt_linha_adicao );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_adicaoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_adicao.Text, dbedt_col_adicao );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_classeExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_classe.Text, dbedt_col_classe );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_tratExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_trat.Text, dbedt_col_trat );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_fund_legalExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_fund_legal.Text, dbedt_col_fund_legal );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_valor_mcvExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_valor_mcv.Text, dbedt_col_valor_mcv );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_dataExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_data.Text, dbedt_linha_data );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_dataExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_data.Text, dbedt_col_data );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_representanteExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_representante.Text, dbedt_col_representante );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_linha_obsExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_obs.Text, dbedt_linha_obs );
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_col_obsExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_obs.Text, dbedt_col_obs );
end;

procedure Tfrm_ajuste_impressao_exoneracao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ajuste_impressao_exoneracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_ajuste_impressao_exoneracao do
  begin
    qry_unidade_.Close;
    qry_unidade_.Free;

    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_exoneracao.Destroy;
  Action := caFree;

  Application.ProcessMessages;

end;

procedure Tfrm_ajuste_impressao_exoneracao.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_exoneracao, datm_ajuste_impressao_exoneracao );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_exoneracao.FormShow(Sender: TObject);
begin
  with datm_ajuste_impressao_exoneracao do
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

  pgctrl_ajuste_imp.ActivePage := ts_lista;
end;

procedure Tfrm_ajuste_impressao_exoneracao.dbedt_cd_unid_negExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_exoneracao.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    ValidCodigo( dbedt_cd_unid_neg )
end;

end.
