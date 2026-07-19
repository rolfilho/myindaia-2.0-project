unit PGSM239;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, Db, DBGrids, ComCtrls, Menus, DBCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tdatm_grupo_item = class(TDataModule)
    ds_grupo_item: TDataSource;
    qry_grupo_item_: TQuery;
    qry_item_: TQuery;
    ds_grupo_item_item: TDataSource;
    qry_grupo_item_item_: TQuery;
    qry_ult_grupo_item_: TQuery;
    qry_grupo_item_CD_GRUPO_ITEM: TStringField;
    qry_grupo_item_NM_GRUPO_ITEM: TStringField;
    qry_grupo_item_item_CD_GRUPO_ITEM: TStringField;
    qry_grupo_item_item_CD_ITEM: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_ult_grupo_item_ULTIMO: TStringField;
    qry_grupo_item_item_LookItem: TStringField;
    sp_exclui_grupo_item: TStoredProc;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_grupo_item_CD_ACESSO_CRE: TStringField;
    qry_grupo_item_CD_AUX_CRE: TStringField;
    qry_grupo_item_CD_CT_CONTABIL_CRE: TStringField;
    qry_grupo_item_CD_ACESSO_DEB: TStringField;
    qry_grupo_item_CD_AUX_DEB: TStringField;
    qry_grupo_item_CD_CT_CONTABIL_DEB: TStringField;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_grupo_item_LookAcessoCre: TStringField;
    qry_grupo_item_LookAuxCre: TStringField;
    qry_grupo_item_NM_DESC_CONTABIL: TStringField;
    qry_grupo_item_LookAcessoDeb: TStringField;
    qry_grupo_item_LookAuxDeb: TStringField;
    procedure qry_grupo_item_AfterScroll(DataSet: TDataSet);
    procedure qry_item_AfterDelete(DataSet: TDataSet);
    procedure qry_grupo_item_CD_CT_CONTABIL_CREChange(Sender: TField);
    procedure qry_grupo_item_CD_CT_CONTABIL_DEBChange(Sender: TField);
  private
    // Private declarations
  public
    Nr_Ordem : Integer;
    // Public declarations
  end;

var
  datm_grupo_item: Tdatm_grupo_item;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM238;

procedure Tdatm_grupo_item.qry_grupo_item_AfterScroll(DataSet: TDataSet);
begin
  with qry_grupo_item_item_ do
  begin
    Close;
    ParamByName('CD_GRUPO_ITEM').AsString := qry_grupo_item_CD_GRUPO_ITEM.AsString;
    Prepare;
    Open;
  end;
end;

procedure Tdatm_grupo_item.qry_item_AfterDelete(DataSet: TDataSet);
begin
  with frm_grupo_item do
  begin
    if ( pgctrl_grupo_item.ActivePage = ts_dados_basicos ) or
       ( pgctrl_grupo_item.ActivePage = ts_lista ) then
    begin
      dbnvg.DataSource := ds_grupo_item;
    end
    else
    begin
      dbnvg.DataSource := ds_grupo_item_item;
    end;
  end;
end;

procedure Tdatm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_CREChange(
  Sender: TField);
begin                                                       
  qry_grupo_item_CD_ACESSO_CRE.AsString  := qry_grupo_item_LookAcessoCre.AsString;
  qry_grupo_item_CD_AUX_CRE.AsString     := qry_grupo_item_LookAuxCre.AsString;
end;

procedure Tdatm_grupo_item.qry_grupo_item_CD_CT_CONTABIL_DEBChange(
  Sender: TField);
begin
  qry_grupo_item_CD_ACESSO_DEB.AsString  := qry_grupo_item_LookAcessoDeb.AsString;
  qry_grupo_item_CD_AUX_DEB.AsString     := qry_grupo_item_LookAuxDeb.AsString;
end;

end.
