unit PGSM139;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_mod_follow_up = class(TDataModule)
    ds_mod_follow_up: TDataSource;
    qry_mod_follow_up_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_mod_follow_up_evento: TDataSource;
    qry_mod_follow_up_evento_: TQuery;
    ds_evento: TDataSource;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_evento_AP_EVENTO: TStringField;
    qry_sel_cd_mod_follow_up: TQuery;
    qry_sel_cd_mod_follow_upCD_FOLLOW_UP: TStringField;
    qry_mod_follow_up_CD_FOLLOW_UP: TStringField;
    qry_mod_follow_up_NM_FOLLOW_UP: TStringField;
    qry_mod_follow_up_IN_ATIVO: TStringField;
    qry_mod_follow_up_IN_ARM_DESC: TStringField;
    qry_mod_follow_up_IN_MERCADORIA: TStringField;
    qry_mod_follow_up_IN_NR_DI: TStringField;
    qry_mod_follow_up_IN_OBS: TStringField;
    qry_mod_follow_up_IN_EMBARCACAO: TStringField;
    qry_mod_follow_up_lokk_ativo: TStringField;
    qry_mod_follow_up_evento_CD_FOLLOW_UP: TStringField;
    qry_mod_follow_up_evento_CD_EVENTO: TStringField;
    qry_mod_follow_up_evento_NR_ORDEM: TIntegerField;
    qry_mod_follow_up_evento_look_evento: TStringField;
    procedure ds_mod_follow_upStateChange(Sender: TObject);
    procedure ds_mod_follow_up_eventoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    Nr_Ordem : Integer;
    { Public declarations }
  end;

var
  datm_mod_follow_up: Tdatm_mod_follow_up;

implementation
uses GSMLIB, PGSM138;
{$R *.DFM}

procedure Tdatm_mod_follow_up.ds_mod_follow_upStateChange(Sender: TObject);
begin
  if qry_mod_follow_up_.state in [dsedit, dsinsert]
  then frm_mod_follow_up.btn_mi(False, True, True, False);
end;

procedure Tdatm_mod_follow_up.ds_mod_follow_up_eventoStateChange(
  Sender: TObject);
begin
  if qry_mod_follow_up_evento_.state in [dsedit, dsinsert]
  then frm_mod_follow_up.btn_mi(False, True, True, False);
end;

end.
