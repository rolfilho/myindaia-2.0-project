unit PGGP066;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppVar, ppBands, ppRegion, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppDBBDE;

type                                     
  Tdatm_release = class(TDataModule)
    qry_lista_: TQuery;
    qry_ttp_release_: TQuery;
    qry_lista_NR_VERSAO: TStringField;
    qry_lista_NR_ITEM: TStringField;
    qry_lista_PATH_TELA: TStringField;
    qry_lista_TX_PENDENCIA: TMemoField;
    qry_lista_TX_ALTERACOES: TMemoField;
    qry_lista_TX_RELEASE: TMemoField;
    qry_lista_TP_RELEASE: TStringField;
    qry_ttp_release_TP_RELEASE: TStringField;
    qry_ttp_release_NM_TP_RELEASE: TStringField;
    ds_lista: TDataSource;
    ds_ttp_release: TDataSource;
    qry_lista_Look_release: TStringField;
    qry_ult_release_: TQuery;
    qry_ult_release_ULTIMO: TStringField;
    procedure qry_lista_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_release: Tdatm_release;

implementation

{$R *.DFM}

uses PGGP065, GSMLIB;


procedure Tdatm_release.qry_lista_BeforePost(DataSet: TDataSet);
begin
  if qry_lista_.State in [dsInsert] then
  begin
    with qry_ult_release_ do
    begin
      Close;
      Prepare;
      ParamByName('NR_VERSAO').AsString := qry_lista_.FieldByName('NR_VERSAO').AsString;
      Open;
    end;
    qry_lista_NR_ITEM.AsString := UltCod(qry_ult_release_, qry_ult_release_ULTIMO);
  end;
end;


end.

