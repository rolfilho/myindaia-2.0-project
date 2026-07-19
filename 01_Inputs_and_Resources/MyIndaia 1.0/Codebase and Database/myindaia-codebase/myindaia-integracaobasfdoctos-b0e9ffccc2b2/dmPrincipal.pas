unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

const
  cfgBasfDoctos_DirOrigem = 'BasfDoctos_DirLocalFtp';
  cfgBasfDoctos_DirDestino = 'BasfDoctos_DirEnvioFtp';
  cfgBasfDoctos_IntervaloMinutos = 'BasfDoctos_IntervaloMinutos';
  cfgBasfDoctos_DiasLog = 'BasfDoctos_DiasLog';

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryArquivosProcessos: TFDQuery;
    qryArquivosProcessosNR_PROCESSO: TStringField;
    qryArquivosProcessosDT_REALIZACAO: TSQLTimeStampField;
    qryArquivosProcessosNM_ARQUIVO: TStringField;
    qryArquivosProcessosNOME_ARQUIVO_DESTINO: TStringField;
    qryFilaProcessos: TFDQuery;
    qryFilaProcessosNR_PROCESSO: TStringField;
    qryAtualizaEvento636: TFDQuery;
    FDQuery1: TFDQuery;
  public
    { Public declarations }
    DirOrigem: String;
    DirDestino: String;
    IntervaloMinutos: String;
    DiasLog: String;
    ArquivosLog: String;
    function Conectar: Boolean;
    function LerConfiguracao(const Chave: string): string;
    procedure ConfiguraConexaoBroker(const Servidor, Banco, Usuario, Senha: string);
    procedure EscreveConfiguracao(const Chave, Valor: string);

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

function TDataModule1.LerConfiguracao(const Chave: string): string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT VALOR FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE';
  FDQuery1.ParamByName('CHAVE').AsString := Chave;
  FDQuery1.Open;
  if not FDQuery1.IsEmpty then
    Result := FDQuery1.Fields[0].AsString;
end;


procedure TDataModule1.ConfiguraConexaoBroker(const Servidor, Banco, Usuario,
  Senha: string);
begin
  FDConnection1.Close;
  FDConnection1.Params.Values['Server'] := Servidor;
  FDConnection1.Params.Values['Database'] := Banco;
  FDConnection1.Params.Values['User_Name'] := Usuario;
  FDConnection1.Params.Values['Password'] := Senha;
  FDConnection1.Params.Values['DriverID'] := 'MSSQL';
  FDConnection1.Open;
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
