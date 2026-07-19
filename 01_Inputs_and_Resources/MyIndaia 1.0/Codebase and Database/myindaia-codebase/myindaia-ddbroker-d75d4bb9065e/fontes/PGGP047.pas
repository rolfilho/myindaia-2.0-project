unit PGGP047;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_ajuste_impressao_darf = class(TForm)
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
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_col_n_ref: TDBEdit;
    dbedt_linha_n_ref: TDBEdit;
    dbedt_linha_periodo: TDBEdit;
    dbedt_linha_cpf_cnpj: TDBEdit;
    dbedt_col_cpf_cnpj: TDBEdit;
    dbedt_col_periodo: TDBEdit;
    dbedt_col_cd_receita: TDBEdit;
    dbedt_linha_s_ref: TDBEdit;
    dbedt_col_s_ref: TDBEdit;
    dbedt_linha_nr_ref: TDBEdit;
    dbedt_col_nr_ref: TDBEdit;
    dbedt_linha_importador: TDBEdit;
    dbedt_col_importador: TDBEdit;
    dbedt_linha_tel_unidade: TDBEdit;
    dbedt_col_tel_unidade: TDBEdit;
    dbedt_linha_master: TDBEdit;
    dbedt_col_master: TDBEdit;
    dbedt_col_filhote: TDBEdit;
    dbedt_col_vl_princ: TDBEdit;
    dbedt_linha_motivo1: TDBEdit;
    dbedt_col_motivo1: TDBEdit;
    dbedt_linha_motivo2: TDBEdit;
    dbedt_col_motivo2: TDBEdit;
    dbedt_linha_vl_juros: TDBEdit;
    dbedt_col_vl_juros: TDBEdit;
    dbedt_linha_vl_total: TDBEdit;
    dbedt_col_vl_total: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label18: TLabel;
    dbedt_linha_dt_vencto: TDBEdit;
    dbedt_col_dt_vencto: TDBEdit;
    Label19: TLabel;
    dbedt_col_vl_multa: TDBEdit;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    function  Grava : Boolean;
    function  Consiste : Boolean;
    function  VerAlt : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure pgctrl_ajuste_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_linha_periodoExit(Sender: TObject);
    procedure dbedt_col_periodoExit(Sender: TObject);
    procedure dbedt_col_cpf_cnpjExit(Sender: TObject);
    procedure dbedt_linha_cpf_cnpjExit(Sender: TObject);
    procedure dbedt_linha_n_refExit(Sender: TObject);
    procedure dbedt_col_n_refExit(Sender: TObject);
    procedure dbedt_col_cd_receitaExit(Sender: TObject);
    procedure dbedt_linha_s_refExit(Sender: TObject);
    procedure dbedt_col_s_refExit(Sender: TObject);
    procedure dbedt_col_nr_refExit(Sender: TObject);
    procedure dbedt_linha_nr_refExit(Sender: TObject);
    procedure dbedt_linha_importadorExit(Sender: TObject);
    procedure dbedt_col_importadorExit(Sender: TObject);
    procedure dbedt_linha_tel_unidadeExit(Sender: TObject);
    procedure dbedt_col_tel_unidadeExit(Sender: TObject);
    procedure dbedt_col_masterExit(Sender: TObject);
    procedure dbedt_linha_masterExit(Sender: TObject);
    procedure dbedt_col_filhoteExit(Sender: TObject);
    procedure dbedt_col_vl_princExit(Sender: TObject);
    procedure dbedt_col_motivo1Exit(Sender: TObject);
    procedure dbedt_linha_motivo1Exit(Sender: TObject);
    procedure dbedt_linha_motivo2Exit(Sender: TObject);
    procedure dbedt_col_motivo2Exit(Sender: TObject);
    procedure dbedt_linha_vl_jurosExit(Sender: TObject);
    procedure dbedt_col_vl_jurosExit(Sender: TObject);
    procedure dbedt_linha_vl_totalExit(Sender: TObject);
    procedure dbedt_col_vl_totalExit(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_col_vl_multaExit(Sender: TObject);
    procedure dbedt_linha_dt_venctoExit(Sender: TObject);
    procedure dbedt_col_dt_venctoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_documento : String[3];
  end;

var
  frm_ajuste_impressao_darf: Tfrm_ajuste_impressao_darf;

implementation

uses PGGP049, PGGP017, GSMLIB, PGSM018;

{$R *.DFM}


procedure Tfrm_ajuste_impressao_darf.btn_sairClick(Sender: TObject);
begin
  Close
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_cd_unid_negChange(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
     btn_mi( False,True,True,False );
end;

procedure Tfrm_ajuste_impressao_darf.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_darf.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False,True,True,False );

  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_darf.Cancelar;
begin
  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

function Tfrm_ajuste_impressao_darf.Consiste : Boolean;
begin

  Consiste := True;

  if Trim( dbedt_cd_unid_neg.Text ) = '' then
  begin
    Consiste := False;
    Exit;
  end
  else ValidCodigo( dbedt_cd_unid_neg );

end;

function Tfrm_ajuste_impressao_darf.Grava : Boolean;
begin

  Grava := True;

  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.pgctrl_ajuste_impChange(
  Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_darf.pgctrl_ajuste_impChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_darf.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_ajuste_imp.ActivePage = ts_dados then
  begin
    if ( datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [ dsEdit,dsInsert ] ) then
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

procedure Tfrm_ajuste_impressao_darf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  with datm_ajuste_impressao_darf do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_darf.Destroy;
  Action := caFree;

  Application.ProcessMessages;

end;

procedure Tfrm_ajuste_impressao_darf.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_darf, datm_ajuste_impressao_darf );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_darf.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_ajuste_impressao_darf.FormShow(Sender: TObject);
begin
  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_ajuste_impressao_darf do
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

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_periodoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_periodo.Text, dbedt_linha_periodo );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_periodoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_periodo.Text, dbedt_col_periodo );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_cpf_cnpjExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cpf_cnpj.Text, dbedt_col_cpf_cnpj );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_cpf_cnpjExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_cpf_cnpj.Text, dbedt_linha_cpf_cnpj );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_n_refExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_n_ref.Text, dbedt_linha_n_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_n_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_n_ref.Text, dbedt_col_n_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_cd_receitaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_cd_receita.Text, dbedt_col_cd_receita );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_s_refExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_s_ref.Text, dbedt_linha_s_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_s_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_s_ref.Text, dbedt_col_s_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_nr_refExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_nr_ref.Text, dbedt_col_nr_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_nr_refExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_nr_ref.Text, dbedt_linha_nr_ref );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_importadorExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_importador.Text, dbedt_linha_importador );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_importadorExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_importador.Text, dbedt_col_importador );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_tel_unidadeExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_tel_unidade.Text, dbedt_linha_tel_unidade );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_tel_unidadeExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_tel_unidade.Text, dbedt_col_tel_unidade );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_masterExit(Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_master.Text, dbedt_col_master );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_masterExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_master.Text, dbedt_linha_master );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_filhoteExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_filhote.Text, dbedt_col_filhote );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_vl_princExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_princ.Text, dbedt_col_vl_princ );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_motivo1Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_motivo1.Text, dbedt_col_motivo1 );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_motivo1Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_motivo1.Text, dbedt_linha_motivo1 );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_motivo2Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_motivo2.Text, dbedt_linha_motivo2 );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_motivo2Exit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_motivo2.Text, dbedt_col_motivo2 );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_vl_jurosExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_vl_juros.Text, dbedt_linha_vl_juros );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_vl_jurosExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_juros.Text, dbedt_col_vl_juros );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_vl_totalExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_vl_total.Text, dbedt_linha_vl_total );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_vl_totalExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_total.Text, dbedt_col_vl_total );
end;

procedure Tfrm_ajuste_impressao_darf.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_cd_unid_negExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    ValidCodigo( dbedt_cd_unid_neg );
end;



procedure Tfrm_ajuste_impressao_darf.dbedt_col_vl_multaExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_col_vl_multa.Text, dbedt_col_vl_multa );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_linha_dt_venctoExit(
  Sender: TObject);
begin
  if (datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert]) then
    Inclui_Zeros( dbedt_linha_dt_vencto.Text, dbedt_linha_dt_vencto );
end;

procedure Tfrm_ajuste_impressao_darf.dbedt_col_dt_venctoExit(
  Sender: TObject);
begin
  if ( datm_ajuste_impressao_darf.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_dt_vencto.Text, dbedt_col_dt_vencto );
end;

end.
