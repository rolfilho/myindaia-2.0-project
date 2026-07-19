unit PGSM320;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_item_contabil = class(TDataModule)
    qry_mod_receb_: TQuery;
    qry_mod_receb_CD_MOD_CONTABIL: TStringField;
    qry_mod_receb_NM_MOD_CONTABIL: TStringField;
    qry_mod_pagto_: TQuery;
    qry_mod_pagto_CD_MOD_CONTABIL: TStringField;
    qry_mod_pagto_NM_MOD_CONTABIL: TStringField;
    ds_item_contabil: TDataSource;
    qry_item_contabil_: TQuery;
    qry_item_contabil_CD_ITEM_CONTABIL: TStringField;
    qry_item_contabil_NM_ITEM_CONTABIL: TStringField;
    qry_item_contabil_IN_CONTABILIZA: TStringField;
    qry_item_contabil_IN_PAGTO_DEB_PROVISAO: TStringField;
    qry_item_contabil_IN_PAGTO_CRE_PROVISAO: TStringField;
    qry_item_contabil_IN_PAGTO_DEB_BAIXA: TStringField;
    qry_item_contabil_IN_PAGTO_CRE_BAIXA: TStringField;
    qry_item_contabil_IN_RECEB_DEB_PROVISAO: TStringField;
    qry_item_contabil_IN_RECEB_CRE_PROVISAO: TStringField;
    qry_item_contabil_IN_RECEB_DEB_BAIXA: TStringField;
    qry_item_contabil_IN_RECEB_CRE_BAIXA: TStringField;
    qry_item_contabil_CD_MODULO_RECEB_PROV: TStringField;
    qry_item_contabil_CD_MODULO_RECEB_BAIX: TStringField;
    qry_item_contabil_CD_MODULO_PAGTO_PROV: TStringField;
    qry_item_contabil_Look_mod_pagto_baixa: TStringField;
    qry_item_contabil_Look_mod_pagto_prov: TStringField;
    qry_item_contabil_Look_mod_receb_baixa: TStringField;
    qry_item_contabil_Look_mod_receb_prov: TStringField;
    qry_item_contabil_CD_HIST_CONTABIL: TStringField;
    qry_item_contabil_NM_HIST_COMPLEMENTAR: TStringField;
    qry_item_contabil_CD_MODULO_PAGTO_BAIX: TStringField;
    qry_item_contabil_NR_OUTRO_PAGTO_CRE_PROVISAO: TStringField;
    qry_item_contabil_NR_OUTRO_PAGTO_CRE_BAIXA: TStringField;
    qry_item_contabil_NR_OUTRO_PAGTO_DEB_PROVISAO: TStringField;
    qry_item_contabil_NR_OUTRO_PAGTO_DEB_BAIXA: TStringField;
    qry_item_contabil_NR_OUTRO_RECEB_CRE_PROVISAO: TStringField;
    qry_item_contabil_NR_OUTRO_RECEB_CRE_BAIXA: TStringField;
    qry_item_contabil_NR_OUTRO_RECEB_DEB_PROVISAO: TStringField;
    qry_item_contabil_NR_OUTRO_RECEB_DEB_BAIXA: TStringField;
    qry_item_contabil_calc_in_contabiliza: TStringField;
    qry_item_contabil_CD_HIST_RECEB_PROVISAO: TStringField;
    qry_item_contabil_CD_HIST_RECEB_BAIXA: TStringField;
    qry_item_contabil_CD_HIST_PAGTO_PROVISAO: TStringField;
    qry_item_contabil_CD_HIST_PAGTO_BAIXA: TStringField;
    qry_item_contabil_NM_HIST_PAGTO_PROVISAO: TStringField;
    qry_item_contabil_NM_HIST_RECEB_PROVISAO: TStringField;
    qry_item_contabil_NM_HIST_RECEB_BAIXA: TStringField;
    qry_item_contabil_NM_HIST_PAGTO_BAIXA: TStringField;
    qry_item_contabil_CD_HIST_RECEB_PROVISAOII: TStringField;
    qry_item_contabil_CD_HIST_PAGTO_PROVISAOII: TStringField;
    qry_item_contabil_CD_HIST_RECEB_BAIXAII: TStringField;
    qry_item_contabil_CD_HIST_PAGTO_BAIXAII: TStringField;
    qry_item_contabil_NM_HIST_RECEB_PROVISAOII: TStringField;
    qry_item_contabil_NM_HIST_RECEB_BAIXAII: TStringField;
    qry_item_contabil_NM_HIST_PAGTO_PROVISAOII: TStringField;
    qry_item_contabil_NM_HIST_PAGTO_BAIXAII: TStringField;
    UpdateSQL1: TUpdateSQL;
    procedure qry_item_contabil_BeforePost(DataSet: TDataSet);
    procedure qry_item_contabil_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_item_contabil: Tdatm_item_contabil;

implementation

{$R *.DFM}

procedure Tdatm_item_contabil.qry_item_contabil_BeforePost(
  DataSet: TDataSet);
begin
 if datm_item_contabil.qry_item_contabil_.State in [dsInsert] then
    begin
      with Tquery.Create(Application) do
        begin
          DataBaseName:= 'DBBROKER';
          Sql.Add('SELECT ISNULL(MAX(CD_ITEM_CONTABIL),"000") FROM TITEM_CONTABIL');
          Open;
          qry_item_contabil_CD_ITEM_CONTABIL.AsString := formatfloat('000',(strtofloat(Fields[0].AsString) + 1));
          Free;
        end;
    end;

end;

procedure Tdatm_item_contabil.qry_item_contabil_CalcFields(
  DataSet: TDataSet);
begin
if datm_item_contabil.qry_item_contabil_IN_CONTABILIZA.AsString = '1' then
    datm_item_contabil.qry_item_contabil_calc_in_contabiliza.AsString := 'Sim'
  else
    datm_item_contabil.qry_item_contabil_calc_in_contabiliza.AsString := 'Não';


end;

end.
