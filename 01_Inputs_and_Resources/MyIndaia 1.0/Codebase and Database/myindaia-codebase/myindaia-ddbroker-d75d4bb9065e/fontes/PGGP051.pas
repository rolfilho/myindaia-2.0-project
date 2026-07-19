(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP051.PAS - frm_ajuste_impressao_boleto

AUTOR: Leandro Stipanich

DATA: 05/10/2001

Manutenção: Leandro Stipanich

*************************************************************************************************)

unit PGGP051;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Db, DBTables;

type
  Tfrm_ajuste_impressao_boleto = class(TForm)
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
    dbedt_col_dt_docto: TDBEdit;
    dbedt_linha_dt_docto: TDBEdit;
    dbedt_linha_local_pagto: TDBEdit;
    dbedt_col_dt_vencto: TDBEdit;
    dbedt_col_local_pagto: TDBEdit;
    dbedt_col_nr_docto: TDBEdit;
    dbedt_linha_vl_docto: TDBEdit;
    dbedt_col_vl_docto: TDBEdit;
    dbedt_linha_tx_instr: TDBEdit;
    dbedt_col_tx_instr: TDBEdit;
    dbedt_linha_nr_fatura: TDBEdit;
    dbedt_col_nr_fatura: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    dbedt_linha_sacado: TDBEdit;
    dbedt_col_sacado: TDBEdit;
    btn_co_banco: TSpeedButton;
    dbedt_nr_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    Label12: TLabel;
    Label11: TLabel;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Inclui_Zeros( cNum : String; oCampo : TDBEdit );
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_linha_local_pagtoChange(Sender: TObject);
    procedure pgctrl_ajuste_impChange(Sender: TObject);
    procedure dbedt_linha_local_pagtoExit(Sender: TObject);
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
    procedure dbedt_col_local_pagtoExit(Sender: TObject);
    procedure dbedt_col_dt_venctoExit(Sender: TObject);
    procedure dbedt_linha_dt_doctoExit(Sender: TObject);
    procedure dbedt_col_dt_doctoExit(Sender: TObject);
    procedure dbedt_col_nr_doctoExit(Sender: TObject);
    procedure dbedt_linha_vl_doctoExit(Sender: TObject);
    procedure dbedt_col_vl_doctoExit(Sender: TObject);
    procedure dbedt_linha_tx_instrExit(Sender: TObject);
    procedure dbedt_col_tx_instrExit(Sender: TObject);
    procedure dbedt_linha_nr_faturaExit(Sender: TObject);
    procedure dbedt_col_nr_faturaExit(Sender: TObject);
    procedure dbedt_linha_sacadoExit(Sender: TObject);
    procedure dbedt_col_sacadoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_nr_bancoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_unid_neg_ajuste : String[2];
    str_nr_bco_ajuste : String[3];
  end;

var
  frm_ajuste_impressao_boleto: Tfrm_ajuste_impressao_boleto;

implementation

uses PGGP052, GSMLIB, PGGP017, PGSM018;

{$R *.DFM}

procedure Tfrm_ajuste_impressao_boleto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ajuste_impressao_boleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_ajuste_impressao_boleto do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.Free;
  end;

  datm_ajuste_impressao_boleto.Destroy;
  Action := caFree;

  Application.ProcessMessages;
end;

procedure Tfrm_ajuste_impressao_boleto.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_ajuste_impressao_boleto, datm_ajuste_impressao_boleto );
  Screen.Cursor := crArrow;
end;

procedure Tfrm_ajuste_impressao_boleto.FormShow(Sender: TObject);
begin
  with datm_ajuste_impressao_boleto do
  begin

    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;

    qry_bco_.Close;
    qry_bco_.Prepare;
    qry_bco_.Open;

    qry_lista_.Close;
    qry_lista_.Prepare;
    qry_lista_.Open;

    btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );

  end;

  pgctrl_ajuste_imp.ActivePAge := ts_lista;
end;

procedure Tfrm_ajuste_impressao_boleto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ajuste_impressao_boleto.Inclui_Zeros( cNum : String; oCampo : TDBEdit );
begin
  if Trim(cNum) = '' then
     cNum := '0';

  oCampo.Text := StrZero( StrToInt(cNum), 3 );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_local_pagtoChange(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ajuste_impressao_boleto.pgctrl_ajuste_impChange(Sender: TObject);
begin
  dbnvg.Enabled := pgctrl_ajuste_imp.ActivePage = ts_lista;
end;

procedure Tfrm_ajuste_impressao_boleto.btn_incluirClick(Sender: TObject);
begin
  btn_mi( False, True, True, False );

  with datm_ajuste_impressao_boleto do
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

procedure Tfrm_ajuste_impressao_boleto.btn_excluirClick(Sender: TObject);
begin
  with datm_ajuste_impressao_boleto do
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

procedure Tfrm_ajuste_impressao_boleto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ajuste_impressao_boleto.Cancelar;
begin
  with datm_ajuste_impressao_boleto do
  begin

    if qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
      qry_ajuste_impressao_.Cancel;

    btn_mi( True, False, False, qry_ajuste_impressao_.RecordCount > 0 );
  end;
end;

function Tfrm_ajuste_impressao_boleto.Grava : Boolean;
begin
  Grava := True;

  with datm_ajuste_impressao_boleto do
  begin
    try
      datm_main.db_broker.StartTransaction;

      qry_ajuste_impressao_.Post;

      str_cd_unid_neg_ajuste := qry_ajuste_impressao_CD_UNID_NEG.AsString;
      str_nr_bco_ajuste      := qry_ajuste_impressao_NR_BANCO.AsString;

      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate( 'CD_UNID_NEG;NR_BANCO', VarArrayOf( [str_cd_unid_neg_ajuste, str_nr_bco_ajuste]), [loCaseInsensitive]);

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

procedure Tfrm_ajuste_impressao_boleto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_ajuste_impressao_boleto.pgctrl_ajuste_impChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ajuste_impressao_boleto.Consiste : Boolean;
begin
  Consiste := True;

  if datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [ dsInsert,dsEdit ] then
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

    if dbedt_nr_banco.Text <> '' then
    begin
      ValidCodigo( dbedt_nr_banco );
      if Trim( dbedt_nm_banco.Text ) = '' then
      begin
        BoxMensagem( 'Banco inválido!', 2 );
        dbedt_nr_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_ajuste_impressao_boleto.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_ajuste_imp.ActivePage = ts_dados then
  begin
    if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [ dsEdit,dsInsert ] ) then
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

procedure Tfrm_ajuste_impressao_boleto.dbedt_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_local_pagtoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_local_pagto.Text, dbedt_linha_local_pagto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_local_pagtoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_local_pagto.Text, dbedt_col_local_pagto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_dt_venctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_dt_vencto.Text, dbedt_col_dt_vencto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_dt_doctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_dt_docto.Text, dbedt_linha_dt_docto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_dt_doctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_dt_docto.Text, dbedt_col_dt_docto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_nr_doctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_nr_docto.Text, dbedt_col_nr_docto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_vl_doctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_vl_docto.Text, dbedt_linha_vl_docto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_vl_doctoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_vl_docto.Text, dbedt_col_vl_docto );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_tx_instrExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_tx_instr.Text, dbedt_linha_tx_instr );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_tx_instrExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_tx_instr.Text, dbedt_col_tx_instr );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_nr_faturaExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_nr_fatura.Text, dbedt_linha_nr_fatura );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_nr_faturaExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_nr_fatura.Text, dbedt_col_nr_fatura );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_linha_sacadoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_linha_sacado.Text, dbedt_linha_sacado );
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_col_sacadoExit(Sender: TObject);
begin
  if ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
    Inclui_Zeros( dbedt_col_sacado.Text, dbedt_col_sacado );
end;

procedure Tfrm_ajuste_impressao_boleto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = dbedt_nr_banco    then btn_co_bancoClick(nil);
  end;
end;

procedure Tfrm_ajuste_impressao_boleto.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_ajuste_impressao_boleto.qry_ajuste_impressao_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ajuste_impressao_boleto.qry_ajuste_impressao_.State in [dsEdit, dsInsert] ) then
         datm_ajuste_impressao_boleto.qry_ajuste_impressao_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ajuste_impressao_boleto do
  begin
    qry_unidade_.Close;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
  end;
  dbedt_cd_unid_negExit(nil);
end;

procedure Tfrm_ajuste_impressao_boleto.btn_co_bancoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TBCO',
                datm_ajuste_impressao_boleto.qry_ajuste_impressao_NR_BANCO,
                'Bancos', 47, '','TTable');
  dbedt_nr_bancoExit(nil);
end;

procedure Tfrm_ajuste_impressao_boleto.dbedt_nr_bancoExit(Sender: TObject);
begin
  Consiste;
end;


end.
