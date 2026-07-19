unit dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConexoesIntegracoes;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    qryArquivosProcessos: TFDQuery;
    qryArquivosProcessosNR_PROCESSO: TStringField;
    qryArquivosProcessosDT_REALIZACAO: TSQLTimeStampField;
    qryArquivosProcessosNM_ARQUIVO: TStringField;
    qryArquivosProcessosNOME_ARQUIVO_DESTINO: TStringField;
    qryFilaProcessos: TFDQuery;
    qryFilaProcessosNR_PROCESSO: TStringField;
    qryFilaArqFaturamentoExpo: TFDQuery;
    qryFilaArqFaturamentoExpoNR_PROCESSO: TStringField;
    qryFilaArqFaturamentoExpoCREATED: TSQLTimeStampField;
    qryFilaArqFaturamentoExpoNM_ARQUIVO: TStringField;
    qryFilaArqFaturamentoExpoNOME_ARQUIVO_DESTINO: TStringField;
    qryUpdateDoc: TFDQuery;
    qryFilaArqFaturamentoImpo: TFDQuery;
    qryFilaArqFaturamentoImpoNR_PROCESSO: TStringField;
    qryFilaArqFaturamentoImpoCREATED: TSQLTimeStampField;
    qryFilaArqFaturamentoImpoNM_ARQUIVO: TStringField;
    qryFilaArqFaturamentoImpoNOME_ARQUIVO_DESTINO: TStringField;
    qryFilaArqFaturamentoExpoDT_ENVIO_CLIENTE: TSQLTimeStampField;
    qryFilaArqFaturamentoImpoDT_ENVIO_CLIENTE: TSQLTimeStampField;
    qryAtualizaEvento: TFDQuery;
    qryFilaProcessosEv141: TFDQuery;
    StringField1: TStringField;
    qryArquivosProcessosEv141: TFDQuery;
    qryArquivosProcessosEv141CD_TIPO_DOCTO: TIntegerField;
    qryArquivosProcessosEv141NR_PROCESSO: TStringField;
    qryArquivosProcessosEv141DT_REALIZACAO: TSQLTimeStampField;
    qryArquivosProcessosEv141NM_ARQUIVO: TStringField;
    qryArquivosProcessosEv141NOME_ARQUIVO_DESTINO: TStringField;
  public
    { Public declarations }
    function Conectar: Boolean;
    function LerConfiguracao(const Chave: string): string;
    procedure ConfiguraConexaoBroker(const Servidor, Banco, Usuario, Senha: string);
    procedure EscreveConfiguracao(const Chave, Valor: string);
    procedure CarregarConfiguracoes;
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



procedure TDataModule1.CarregarConfiguracoes;
begin
//  if not Boolean.TryToParse(dmdMain.LerConfiguracao(cfgCertOrigemFecomercioRascunho),Config.FecomecioModoRascunho) then
//    Config.FecomecioModoRascunho := False;
//  Config.FecomecioUsuarioServico := dmdMain.LerConfiguracao(cfgCertOrigemFecomercioUsuario);
//  ConfigOld.FecomecioUsuarioServico := Config.FecomecioUsuarioServico;
//  Config.FecomecioSenhaServico := dmdMain.LerConfiguracao(cfgCertOrigemFecomercioSenha);
//  ConfigOld.FecomecioSenhaServico := Config.FecomecioSenhaServico;
//  Config.FecomecioURLServico := dmdMain.LerConfiguracao(cfgCertOrigemFecomecioURLServico);
//  ConfigOld.FecomecioURLServico := Config.FecomecioURLServico;
//  //
//  Config.CACBAmbiente := dmdMain.LerConfiguracao(cfgCertOrigemCACBAmbiente);
//  ConfigOld.CACBAmbiente := Config.CACBAmbiente;
//  Config.CACBAmbiente := Config.CACBAmbiente;
//  ConfigOld.CACBAmbiente := Config.CACBAmbiente;
//  Config.CACBUsuarioServico := dmdMain.LerConfiguracao(cfgCertOrigemCACBUsuario);
//  ConfigOld.CACBUsuarioServico := Config.CACBUsuarioServico;
//  Config.CACBSenhaServico := dmdMain.LerConfiguracao(cfgCertOrigemCACBSenha);
//  ConfigOld.CACBSenhaServico := Config.CACBSenhaServico;
//  Config.CACBURLProducao := dmdMain.LerConfiguracao(cfgCertOrigemCACBURLProducao);
//  ConfigOld.CACBURLProducao := Config.CACBURLProducao;
//  Config.CACBURLHomolocao := dmdMain.LerConfiguracao(cfgCertOrigemCACBURLHomologacao);
//  ConfigOld.CACBURLHomolocao := Config.CACBURLHomolocao;
//  Config.CACBAno := dmdMain.LerConfiguracao(cfgCertOrigemCACBAno);
//  ConfigOld.CACBAno := Config.CACBAno;
//  Config.CACBQtdCerticados := dmdMain.LerConfiguracao(cfgCertOrigemCACBQtdCertificados);
//  ConfigOld.CACBQtdCerticados := Config.CACBQtdCerticados;
//  Config.CACBAssinaCerticados := StrToIntDef(dmdMain.LerConfiguracao(cfgcfgCertOrigemCACBAssinaCerticados),0).ToBoolean;
//  ConfigOld.CACBAssinaCerticados := Config.CACBAssinaCerticados;  //
//  //
//  Config.FIESPAmbiente := dmdMain.LerConfiguracao(cfgCertOrigemFIESPAmbiente);
//  ConfigOld.FIESPAmbiente := Config.FIESPAmbiente;
//  Config.FIESPAmbiente := Config.FIESPAmbiente;
//  ConfigOld.FIESPAmbiente := Config.FIESPAmbiente;
//  Config.FIESPUsuarioServico := dmdMain.LerConfiguracao(cfgCertOrigemFIESPUsuario);
//  ConfigOld.FIESPUsuarioServico := Config.FIESPUsuarioServico;
//  Config.FIESPSenhaServico := dmdMain.LerConfiguracao(cfgCertOrigemFIESPSenha);
//  ConfigOld.FIESPSenhaServico := Config.FIESPSenhaServico;
//  Config.FIESPURLProducao := dmdMain.LerConfiguracao(cfgCertOrigemFIESPURLProducao);
//  ConfigOld.FIESPURLProducao := Config.FIESPURLProducao;
//  Config.FIESPURLHomolocao := dmdMain.LerConfiguracao(cfgCertOrigemFIESPURLHomologacao);
//  ConfigOld.FIESPURLHomolocao := Config.FIESPURLHomolocao;
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
