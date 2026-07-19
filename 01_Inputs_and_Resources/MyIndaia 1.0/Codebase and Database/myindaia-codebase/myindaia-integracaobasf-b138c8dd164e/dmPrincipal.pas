unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryInsereEventosNaFilaHoje: TFDQuery;
    qryMainLeg: TFDQuery;
    qryFilaHoje: TFDQuery;
    qryAtzEnvioFila: TFDQuery;
    qryMainLegMainLeg: TStringField;
    qryMainLegBooking: TStringField;
    qryMainLegCodigoEvento: TStringField;
    qryMainLegValorEvento: TStringField;
    qryFilaHojePendente: TFDQuery;
    qryDeleteConsultasAntigas: TFDQuery;
    qryMainLegTransportDocument: TStringField;
  public
    { Public declarations }
    function Conectar: Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDataModule1.Conectar: Boolean;
begin
  try
    FDConnection1.Connected := TRUE;
  except
    result := false;
//    on E: Exception do
//      Log('Não foi possível conectar ao banco de dados. ' + e.Message, Logar);

  end;
end;

end.
