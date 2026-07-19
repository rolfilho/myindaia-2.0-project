unit PGSM165;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, Db, DBGrids, ComCtrls, Menus, DBCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tdatm_inst_negoc = class(TDataModule)
    ds_inst_negoc: TDataSource;
    qry_inst_negoc_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_pais: TDataSource;
    qry_pais_: TQuery;
    ds_inst_negoc_pais: TDataSource;
    qry_inst_negoc_pais_: TQuery;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_inst_negoc_CD_INST_NEGOC: TStringField;
    qry_inst_negoc_NM_INST_NEGOC: TStringField;
    qry_inst_negoc_pais_CD_INST_NEGOC: TStringField;
    qry_inst_negoc_pais_CD_PAIS: TStringField;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_inst_negoc_IN_ATIVO: TStringField;
    qry_inst_negoc_LookAtivo: TStringField;
    qry_ult_inst_negoc_: TQuery;
    qry_ult_inst_negoc_ULTIMO: TStringField;
    qry_inst_negoc_pais_LookPais: TStringField;
    qry_inst_negoc_pais_LookInstNegoc: TStringField;
    sp_exclui_inst_negoc: TStoredProc;
    procedure qry_inst_negoc_AfterScroll(DataSet: TDataSet);
    procedure qry_pais_AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Nr_Ordem : Integer;
    { Public declarations }
  end;

var
  datm_inst_negoc: Tdatm_inst_negoc;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM166;

procedure Tdatm_inst_negoc.qry_inst_negoc_AfterScroll(DataSet: TDataSet);
begin
  with qry_inst_negoc_pais_ do
  begin
    Close;
    ParamByName('CD_INST_NEGOC').AsString := qry_inst_negoc_CD_INST_NEGOC.AsString;
    Prepare;
    Open;
  end;
end;

procedure Tdatm_inst_negoc.qry_pais_AfterDelete(DataSet: TDataSet);
begin
  with frm_inst_negoc do
  begin
    if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
       ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
    begin
      dbnvg.DataSource := ds_inst_negoc;
    end
    else
    begin
      dbnvg.DataSource := ds_inst_negoc_pais;
    end;
  end;
end;



end.
