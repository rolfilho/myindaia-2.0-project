unit PGSM255;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_delegacia = class(TDataModule)
    ds_delegacia: TDataSource;
    qry_delegacia_: TQuery;
    us_delegacia: TUpdateSQL;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_lista_CD_DELEGACIA: TStringField;
    qry_lista_NM_DELEGACIA: TStringField;
    qry_delegacia_CD_DELEGACIA: TStringField;
    qry_delegacia_NM_DELEGACIA: TStringField;
    qry_ult_delegacia_: TQuery;
    qry_ult_delegacia_ULTIMO: TStringField;
    procedure qry_delegacia_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_delegacia: Tdatm_delegacia;

implementation

uses GSMLIB, PGSM254;

{$R *.DFM}

procedure Tdatm_delegacia.qry_delegacia_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(E);
end;

procedure Tdatm_delegacia.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_delegacia_.Close;
  qry_delegacia_.ParamByName('CD_DELEGACIA').AsString := qry_lista_CD_DELEGACIA.AsString;
  qry_delegacia_.Prepare;
  qry_delegacia_.Open;

  frm_delegacia.VerDelegacia;
end;

procedure Tdatm_delegacia.qry_lista_AfterOpen(DataSet: TDataSet);
begin
  if qry_lista_.RecordCount = 0 then
    qry_lista_AfterScroll(nil);
end;

end.
