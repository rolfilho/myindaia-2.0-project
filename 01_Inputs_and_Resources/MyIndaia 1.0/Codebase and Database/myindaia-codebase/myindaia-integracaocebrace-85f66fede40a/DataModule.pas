unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    BrokerConnection: TFDConnection;
    QueryConsulta: TFDQuery;
    QueryConsultaPROCESSNUMBERID: TStringField;
    QueryConsultaPROCESSBROKERID: TStringField;
    QueryConsultaVESSEL: TStringField;
    QueryConsultaRESERVE: TMemoField;
    QueryConsultaURFCLEARENCE: TStringField;
    QueryConsultaCARRIER: TStringField;
    QueryConsultaPLANNEDDATESHIP: TDateField;
    QueryConsultaSHIPDATE: TDateField;
    QueryConsultaPLANNEDDATELOAD: TDateField;
    QueryConsultaTRANSITTIME: TIntegerField;
    QueryConsultaDDE: TStringField;
    QueryConsultaDDECHANNEL: TStringField;
    QueryConsultaDDEDATE: TDateField;
    QueryConsultaAVERBACAODATE: TDateField;
    QueryConsultaDUENUMBER: TStringField;
    QueryConsultaDUEDATE: TDateField;
    QueryConsultaRUCNUMBER: TStringField;
    QueryConsultaRUCDATE: TDateField;
    QueryConsultaACCESSKEY: TStringField;
    QueryConsultaPROCESSNUMBERID_1: TStringField;
    QueryConsultaMASTER: TStringField;
    QueryConsultaHOUSE: TStringField;
    QueryConsultaISSUEDATE: TDateField;
    QueryConsultaRELEASEDATE: TDateField;
    QueryConsultaPROCESSNUMBERID_2: TStringField;
    QueryConsultaSONUMBER: TStringField;
    QueryConsultaVSART: TStringField;
    QueryConsultaPROCESSNUMBERID_3: TStringField;
    QueryConsultaSONUMBER_1: TStringField;
    QueryConsultaPARVW: TStringField;
    QueryConsultaKUNDE_D: TStringField;
    QueryConsultaPARVW_1: TStringField;
    QueryConsultaKUNDE_D_1: TStringField;
    FDQuery1: TFDQuery;
  private
    procedure ConfiguraConexaoBroker(const Servidor, Banco, Usuario,
      Senha: string);
    { Private declarations }
  public
    { Public declarations }
    function LerConfiguracao(const Chave: string): string;
    function Conectar: Boolean;
    procedure EscreveConfiguracao(const Chave, Valor: string);
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.ConfiguraConexaoBroker(const Servidor, Banco, Usuario,
  Senha: string);
begin
  BrokerConnection.Close;
  BrokerConnection.Params.Values['Server'] := Servidor;
  BrokerConnection.Params.Values['Database'] := Banco;
  BrokerConnection.Params.Values['User_Name'] := Usuario;
  BrokerConnection.Params.Values['Password'] := Senha;
  BrokerConnection.Params.Values['DriverID'] := 'MSSQL';
  BrokerConnection.Open;
end;

function TDataModule1.Conectar: Boolean;
begin
  try
    BrokerConnection.Connected := TRUE;
  except
    result := false;
//    on E: Exception do
//      Log('Não foi possível conectar ao banco de dados. ' + e.Message, Logar);

  end;
end;

function TDataModule1.LerConfiguracao(const Chave: string): string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT VALOR FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE';
  FDQuery1.ParamByName('CHAVE').AsString := Chave;
  FDQuery1.Open;
  if not FDQuery1.IsEmpty then
    Result := FDQuery1.Fields[0].AsString;
end;

procedure TDataModule1.EscreveConfiguracao(const Chave, Valor: string);
var
  Aux: string;
  procedure ExecuteQuery;
  begin
    FDQuery1.ParamByName('CHAVE').AsString := Chave;
    FDQuery1.ParamByName('VALOR').AsString := Valor;
    FDQuery1.ExecSQL;
  end;
begin
  Aux := LerConfiguracao(Chave);
  if not Aux.Equals(Valor) then
  begin
    try
      {if LerChave(Chave) = Chave then
        FDQuery.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE'
      else}
      FDQuery1.SQL.Text := 'SELECT * FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE ';
      FDQuery1.Open;
      if FDQuery1.IsEmpty then
        FDQuery1.SQL.Text := 'INSERT INTO CONFIGURACAO_GERAL (CHAVE,VALOR) VALUES (:CHAVE,:VALOR)'
      else
        FDQuery1.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE';
      ExecuteQuery;
    except
      on E: Exception do
      begin
        if E.Message.Contains('The duplicate key value') then
        begin
          FDQuery1.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE';
          ExecuteQuery;
        end
        else
          raise;
      end;
    end;
  end;
end;

end.
