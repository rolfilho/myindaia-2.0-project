unit dmConfiguracoes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, MyGlobal;

type
  TdtmConfiguracoes = class(TDataModule)
    FDQuery: TFDQuery;
  private
    { Private declarations }
  public
    procedure PersistirConfiguracoes;
    procedure EscreveConfiguracao(const Chave, Valor: string);
    function LerConfiguracao(const Chave: string): string;
    procedure CarregarConfiguracoes;

    { Public declarations }
  end;

var
  dtmConfiguracoes: TdtmConfiguracoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TdtmConfiguracoes.PersistirConfiguracoes;
begin
  if Config.DraftAmbiente <> ConfigOld.DraftAmbiente then
    EscreveConfiguracao(cfgDraftAmbiente, Config.DraftAmbiente);

  if Config.DraftEndFtpProducao <> ConfigOld.DraftEndFtpProducao then
    EscreveConfiguracao(cfgDraftEndFtpProducao, Config.DraftEndFtpProducao);

  if Config.DraftEndFtpHomologacao <> ConfigOld.DraftEndFtpHomologacao then
    EscreveConfiguracao(cfgDraftEndFtpHomologacao, Config.DraftEndFtpHomologacao);

  if Config.DraftUsuarioFtpProducao <> ConfigOld.DraftUsuarioFtpProducao then
    EscreveConfiguracao(cfgDraftUsuarioFtpProducao, Config.DraftUsuarioFtpProducao);

  if Config.DraftUsuarioFtpHomologacao <> ConfigOld.DraftUsuarioFtpHomologacao then
    EscreveConfiguracao(cfgDraftUsuarioFtpHomologacao, Config.DraftUsuarioFtpHomologacao);

  if Config.DraftSenhaFtpProducao <> ConfigOld.DraftSenhaFtpProducao then
    EscreveConfiguracao(cfgDraftSenhaFtpProducao, Config.DraftSenhaFtpProducao);

  if Config.DraftSenhaFtpHomologacao <> ConfigOld.DraftSenhaFtpHomologacao then
    EscreveConfiguracao(cfgDraftSenhaFtpHomologacao, Config.DraftSenhaFtpHomologacao);

end;

procedure TdtmConfiguracoes.EscreveConfiguracao(const Chave, Valor: string);
var
  Aux: string;
  procedure ExecuteQuery;
  begin
    FDQuery.ParamByName('CHAVE').AsString := Chave;
    FDQuery.ParamByName('VALOR').AsString := Valor;
    FDQuery.ExecSQL;
  end;
begin
  Aux := LerConfiguracao(Chave);
  if not Aux.Equals(Valor) then
  begin
    try
      {if LerChave(Chave) = Chave then
        FDQuery.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE'
      else}
      FDQuery.SQL.Text := 'SELECT * FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE ';
      FDQuery.Open;
      if FDQuery.IsEmpty then
        FDQuery.SQL.Text := 'INSERT INTO CONFIGURACAO_GERAL (CHAVE,VALOR) VALUES (:CHAVE,:VALOR)'
      else
        FDQuery.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE';
      ExecuteQuery;
    except
      on E: Exception do
      begin
        if E.Message.Contains('The duplicate key value') then
        begin
          FDQuery.SQL.Text := 'UPDATE CONFIGURACAO_GERAL SET VALOR = :VALOR WHERE CHAVE = :CHAVE';
          ExecuteQuery;
        end
        else
          raise;
      end;
    end;
  end;
end;

procedure TdtmConfiguracoes.CarregarConfiguracoes;
begin
  Config.DraftAmbiente := LerConfiguracao(cfgDraftAmbiente);
  ConfigOld.DraftAmbiente := Config.DraftAmbiente;

  Config.DraftEndFtpProducao := LerConfiguracao(cfgDraftEndFtpProducao);
  ConfigOld.DraftEndFtpProducao := Config.DraftEndFtpProducao;
  Config.DraftEndFtpHomologacao := LerConfiguracao(cfgDraftEndFtpHomologacao);
  ConfigOld.DraftEndFtpHomologacao := Config.DraftEndFtpHomologacao;
  Config.DraftUsuarioFtpProducao := LerConfiguracao(cfgDraftUsuarioFtpProducao);
  ConfigOld.DraftUsuarioFtpProducao := Config.DraftUsuarioFtpProducao;
  Config.DraftUsuarioFtpHomologacao := LerConfiguracao(cfgDraftUsuarioFtpHomologacao);
  ConfigOld.DraftUsuarioFtpHomologacao := Config.DraftUsuarioFtpHomologacao;
  Config.DraftSenhaFtpProducao := LerConfiguracao(cfgDraftSenhaFtpProducao);
  ConfigOld.DraftSenhaFtpProducao := Config.DraftSenhaFtpProducao;
  Config.DraftSenhaFtpHomologacao := LerConfiguracao(cfgDraftSenhaFtpHomologacao);
  ConfigOld.DraftSenhaFtpHomologacao := Config.DraftSenhaFtpHomologacao;

end;

function TdtmConfiguracoes.LerConfiguracao(const Chave: string): string;
begin
  FDQuery.Close;
  FDQuery.SQL.Text := 'SELECT VALOR FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE';
  FDQuery.ParamByName('CHAVE').AsString := Chave;
  FDQuery.Open;
  if not FDQuery.IsEmpty then
    Result := FDQuery.Fields[0].AsString;
end;

end.
