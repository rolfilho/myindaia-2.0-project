unit TMServiceApiImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  TMServiceApi,
  System.Generics.Collections;

type
  IUser = interface

  end;

  TUser = class(TInterfacedObject, IUser)
  private
    FId: Integer;
    FUserName: string;
    FCNPJ: string;
    FTipo: string;
  published
    property Id: Integer read FId write FId;
    property UserName: string read FUserName write FUserName;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Tipo: string read FTipo write FTipo;
  end;

  [ServiceImplementation]
  TTMServiceApiService = class(TInterfacedObject, IService)
  private
    function GetUser: TUser;
    function IncluirPlanilhaTransportadora(UserId: Integer): Integer;
    function IncluirPlanilhaDespachante(UserId: Integer): Integer;
    procedure IncluirLinhaPlanilhaTransportadora(IdPlanilha, Linha: Integer; Item: TLinhaTrasportadora);
    procedure IncluirLinhaPlanilhaDespachante(IdPlanilha, Linha: Integer; Item: TLinhaDespachante);
    procedure ExcluirLinhaPlanilhaDespachante(QtdDiasParaManter: integer);
    procedure ExcluirLinhaPlanilhaTransportadora(QtdDiasParaManter: integer);
  public
    function Info: string;
    function InfoTransport(Itens: TList<TLinhaTrasportadora>): TResult;
    function InfoBroker(Itens: TList<TLinhaDespachante>): TResult;

  end;

const
  JWT_SECRET = '2d013705c915';

implementation

uses
  System.IOUtils, XData.Sys.Exceptions,
  Bcl.Jose.Core.JWT, Bcl.Jose.Core.Builder, Sparkle.Middleware.Jwt, Security,
  Aurelius.Criteria.Base, Aurelius.Criteria.Linq, Aurelius.Drivers.Interfaces,
  FireDAC.Comp.Client,FireDAC.Phys.MSSQL,
  System.SysUtils, Data.DB, TMDataModule, Utils,
  FireDAC.Stan.Param;

function TTMServiceApiService.GetUser: TUser;
var
  User: IUserIdentity;
begin
  Result := TUser.Create;
  User := TXDataOperationContext.Current.Request.User;
  if User = nil then
    raise EXDataHttpUnauthorized.Create('Usuário não autenticado');
  if not User.Claims.Exists('username') then
    raise EXDataHttpForbidden.Create('Não há privilégios suficientes. Informações de autenticação inválidas');
  Result.UserName := User.Claims['username'].AsString;
  if Result.UserName = '' then
    raise EXDataHttpForbidden.Create('Não há privilégios suficientes. Nome não informado.');
  Result.Id := User.Claims['id'].AsInt64;
  Result.CNPJ := User.Claims['cnpj'].AsString;
  Result.Tipo := User.Claims['tipo'].AsString;
end;

function GetSQLIncluirLinhaPlanilhaTransportadora: string;
begin
  Result := 'INSERT INTO planilha_transportadora_linhas '+
           '(id_planilha_transportadora '+
           ',nr_linha '+
           ',cd_servico '+
           ',nm_bu '+
           ',nr_cnpj_empresa '+
           ',nm_pedidos '+
           ',cd_tipo_container '+
           ',nm_container_carga_solta '+
           ',nr_cte '+
           ',cd_terminal_carga '+
           ',nm_local_entrega '+
           ',dt_chegada_saida '+
           ',dt_presenca_carga '+
           ',dt_desembaraco '+
           ',hr_liberacao_documentos '+
           ',dt_efetiva_liberacao_documentos '+
           ',dt_retirada_documentos '+
           ',dt_terminal '+
           ',dt_programacao_entrega '+
           ',dt_efetiva_entrega '+
           ',nm_cliente_tdc '+
           ',nm_cidade_tdc '+
           ',tx_observacao1 '+
           ',dt_coleta_vazio '+
           ',dt_efetiva_entrega_vazio '+
           ',nm_transportadora_devolucao '+
           ',nm_depot_entrega '+
           ',nr_di_booking '+
           ',fl_k10) '+
     'VALUES '+
           '(:id_planilha_transportadora '+
           ',:nr_linha '+
           ',:cd_servico '+
           ',:nm_bu '+
           ',:nr_cnpj_empresa '+
           ',:nm_pedidos '+
           ',:cd_tipo_container '+
           ',:nm_container_carga_solta '+
           ',:nr_cte '+
           ',:cd_terminal_carga '+
           ',:nm_local_entrega '+
           ',:dt_chegada_saida '+
           ',:dt_presenca_carga '+
           ',:dt_desembaraco '+
           ',:hr_liberacao_documentos '+
           ',:dt_efetiva_liberacao_documentos '+
           ',:dt_retirada_documentos '+
           ',:dt_terminal '+
           ',:dt_programacao_entrega '+
           ',:dt_efetiva_entrega '+
           ',:nm_cliente_tdc '+
           ',:nm_cidade_tdc '+
           ',:tx_observacao1 '+
           ',:dt_coleta_vazio '+
           ',:dt_efetiva_entrega_vazio '+
           ',:nm_transportadora_devolucao '+
           ',:nm_depot_entrega '+
           ',:nr_di_booking '+
           ',:fl_k10) ';
end;

function GetSQLIncluirLinhaPlanilhaDespachante: string;
begin
  Result := 'INSERT INTO planilha_despachante_linhas '+
           '(id_planilha_despachante '+
           ',nr_linha '+
           ',cd_servico '+
           ',nm_sbu '+
           ',nr_cnpj_empresa '+
           ',nm_pedidos '+
           ',nr_cnpj_despachante '+
           ',nr_processo '+
           ',tx_produtos '+
           ',nr_nota_fiscal '+
           ',cd_tipo_container '+
           ',nm_container_carga_solta '+
           ',cd_terminal_carga '+
           ',nr_cnpj_transportadora '+
           ',dt_chegada_saida '+
           ',dt_presenca_carga '+
           ',dt_desembaraco '+
           ',dt_liberacao_documentos '+
           ',nr_di_booking '+
           ',dt_necessidade '+
           ',nm_armador '+
           ',nm_armador_tco '+
           ',nm_exportador '+
           ',fl_glosum) '+
           'VALUES '+
           '(:id_planilha_despachante '+
           ',:nr_linha '+
           ',:cd_servico '+
           ',:nm_sbu '+
           ',:nr_cnpj_empresa '+
           ',:nm_pedidos '+
           ',:nr_cnpj_despachante '+
           ',:nr_processo '+
           ',:tx_produtos '+
           ',:nr_nota_fiscal '+
           ',:cd_tipo_container '+
           ',:nm_container_carga_solta '+
           ',:cd_terminal_carga '+
           ',:nr_cnpj_transportadora '+
           ',:dt_chegada_saida '+
           ',:dt_presenca_carga '+
           ',:dt_desembaraco '+
           ',:dt_liberacao_documentos '+
           ',:nr_di_booking '+
           ',:dt_necessidade '+
           ',:nm_armador '+
           ',:nm_armador_tco '+
           ',:nm_exportador '+
           ',:fl_glosum) ';
end;

procedure SetPramValue(Param: TFDParam; Value: string); overload;
begin
  if Value.IsEmpty then
  begin
    Param.DataType := ftString;
    Param.Clear;
  end
  else
    Param.AsString := Value;
end;

procedure SetPramValue(Param: TFDParam; Value: Integer); overload;
begin
  Param.AsInteger := Value;
end;

procedure SetPramValue(Param: TFDParam; Value: TDateTime); overload;
begin
  if Value > 0 then
    Param.AsDateTime := Value
  else
  begin
    Param.DataType := ftDateTime;
    Param.Clear;
  end
end;

procedure TTMServiceApiService.ExcluirLinhaPlanilhaDespachante(QtdDiasParaManter: integer);
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text :=
    'DELETE linha ' +
    'FROM planilha_despachante_linhas linha ' +
    'inner join planilhas_despachantes planilha  on planilha.id = linha.id_planilha_despachante ' +
    'where dt_planilha < (getdate() - :dias) ';
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dias'), QtdDiasParaManter);
  FireDacMSSQL.Executa.ExecSQL;
end;

procedure TTMServiceApiService.ExcluirLinhaPlanilhaTransportadora(QtdDiasParaManter: integer);
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text :=
    'DELETE linha ' +
    'FROM planilha_transportadora_linhas linha ' +
    'inner join planilhas_transportadoras planilha  on planilha.id = linha.id_planilha_transportadora ' +
    'where dt_planilha < (getdate() - :dias) ';
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dias'), QtdDiasParaManter);
  FireDacMSSQL.Executa.ExecSQL;
end;

procedure TTMServiceApiService.IncluirLinhaPlanilhaDespachante(IdPlanilha,
  Linha: Integer; Item: TLinhaDespachante);
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text := GetSQLIncluirLinhaPlanilhaDespachante;
  SetPramValue(FireDacMSSQL.Executa.ParamByName('id_planilha_despachante'), IdPlanilha);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_linha'), Linha);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_servico'), Item.Servico);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_sbu'), Item.SBU);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_cnpj_empresa'), Item.CNPJ_Empresa);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_pedidos'), Item.Pedidos);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_cnpj_despachante'), Item.CPNJ_Despachante);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_processo'), Item.Processo);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('tx_produtos'), Item.Produtos);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_nota_fiscal'), Item.NotaFiscal);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_tipo_container'), Item.TipoContainer);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_container_carga_solta'), Item.ContainerCargaSolta);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_terminal_carga'), Item.TerminalCarga);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_cnpj_transportadora'), Item.CNPJ_Transportadora);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_chegada_saida'), Item.ChegadaSaida);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_presenca_carga'), Item.PresencaCarga);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_desembaraco'), Item.Desembaraco);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_liberacao_documentos'), Item.LiberacaoDocumentos);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_di_booking'), Item.DiBooking);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_necessidade'), Item.Necessidade);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_armador'), Item.Armador);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_armador_tco'), Item.ArmadorTco);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_exportador'), Item.Exportador);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('fl_glosum'), Item.Glosum);
  FireDacMSSQL.Executa.ExecSQL;
end;

procedure TTMServiceApiService.IncluirLinhaPlanilhaTransportadora(IdPlanilha,
  Linha: Integer; Item: TLinhaTrasportadora);
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text := GetSQLIncluirLinhaPlanilhaTransportadora;
  SetPramValue(FireDacMSSQL.Executa.ParamByName('id_planilha_transportadora'), IdPlanilha);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_linha'), Linha);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_servico'), Item.Servico);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_bu'), Item.BU);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_cnpj_empresa'), Item.CNPJ);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_pedidos'), Item.Pedidos);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_tipo_container'), Item.TipoContainer);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_container_carga_solta'), Item.ContainerCargaSolta);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_cte'), Item.CTE);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('cd_terminal_carga'), Item.TerminalCarga);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_local_entrega'), Item.LocalEntrega);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_chegada_saida'), Item.ChegadaSaida);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_presenca_carga'), Item.PresencaCarga);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_desembaraco'), Item.Desembaraco);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('hr_liberacao_documentos'), Item.HoraLiberacaoDoc);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_efetiva_liberacao_documentos'), Item.EfetivaLiberacaoDoc);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_retirada_documentos'), Item.RetiradaDocumento);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_terminal'), Item.Terminal);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_programacao_entrega'), Item.ProgramacaoEntrega);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_efetiva_entrega'), Item.EfetivaEntrega);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_cliente_tdc'), Item.NomeClienteTdc);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_cidade_tdc'), Item.NomeCidadeTdc);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('tx_observacao1'), Item.Observacao);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_coleta_vazio'), Item.DataColetaVazio);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('dt_efetiva_entrega_vazio'), Item.EfetivaEntregaVazio);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_transportadora_devolucao'), Item.NomeTranspDevolucao);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nm_depot_entrega'), Item.NomeDepotEntrega);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('nr_di_booking'), Item.NrDiBooking);
  SetPramValue(FireDacMSSQL.Executa.ParamByName('fl_k10'), Item.K10);
  FireDacMSSQL.Executa.ExecSQL;
end;

function TTMServiceApiService.IncluirPlanilhaTransportadora(UserId: Integer): Integer;
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text := 'INSERT INTO PLANILHAS_TRANSPORTADORAS (ID_USUARIO, DT_PLANILHA) '+
    ' VALUES(1, getdate()); '+
    'SELECT @@IDENTITY';
  FireDacMSSQL.Executa.Open();
  Result := FireDacMSSQL.Executa.Fields[0].AsInteger;
  FireDacMSSQL.Executa.Close;
end;

function TTMServiceApiService.IncluirPlanilhaDespachante(UserId: Integer): Integer;
begin
  FireDacMSSQL.Executa.Close;
  FireDacMSSQL.Executa.SQL.Text := 'INSERT INTO PLANILHAS_DESPACHANTES (ID_USUARIO, DT_PLANILHA) '+
    ' VALUES(1, getdate()); '+
    'SELECT @@IDENTITY';
  FireDacMSSQL.Executa.Open();
  Result := FireDacMSSQL.Executa.Fields[0].AsInteger;
  FireDacMSSQL.Executa.Close;
end;

function TTMServiceApiService.Info: string;
begin
  if Ambiente = Homologacao then
    Result := 'TM Service Api 1.0.0 - Homologação'
  else
    Result := 'TM Service Api 1.0.0 - Produção';
end;

function TTMServiceApiService.InfoBroker(
  Itens: TList<TLinhaDespachante>): TResult;
var
  I: Integer;
  User: TUser;
  IdPlanilha: Integer;
begin
  User := GetUser;
  IdPlanilha := IncluirPlanilhaDespachante(User.Id);
  for I := 0 to Itens.Count -1 do
  begin
    IncluirLinhaPlanilhaDespachante(IdPlanilha, I+1, Itens.Items[I]);
  end;
  FireDacMSSQL.spProcessaPlanilha.ParamByName('@id_planilha').AsInteger := IdPlanilha;
  FireDacMSSQL.spProcessaPlanilha.ParamByName('@tipo').AsString := 'D';
  FireDacMSSQL.spProcessaPlanilha.ExecProc;
  FireDacMSSQL.Consulta.Close;
  FireDacMSSQL.Consulta.SQL.Text :=
    'select a.nr_linha, a.nm_mensagem_erro, b.nr_processo ' +
    'from validacoes_planilhas_despachantes a ' +
    'inner join planilha_despachante_linhas b on b.id_planilha_despachante = a.id_planilha_despachante and b.nr_linha = a.nr_linha ' +
    'where a.id_planilha_despachante = :id_planilha';
  FireDacMSSQL.Consulta.ParamByName('id_planilha').AsInteger := IdPlanilha;
  FireDacMSSQL.Consulta.Open;
  Result := TResult.Create;
  Result.Planilha := IdPlanilha;
  if FireDacMSSQL.Consulta.IsEmpty then
    Result.Sucesso := True
  else
  begin
    Result.Sucesso := False;
    while not FireDacMSSQL.Consulta.Eof do
    begin
      Result.Mensagens.Add(TMensagens.Create(
        FireDacMSSQL.Consulta.FieldByName('nr_linha').AsInteger,
        'Processo: ' + FireDacMSSQL.Consulta.FieldByName('nr_processo').AsString + ' - ' +
        FireDacMSSQL.Consulta.FieldByName('nm_mensagem_erro').AsString ));
      FireDacMSSQL.Consulta.Next;
    end;
  end;

  ExcluirLinhaPlanilhaDespachante(120);
end;

function TTMServiceApiService.InfoTransport(
  Itens: TList<TLinhaTrasportadora>): TResult;
var
  I: Integer;
  User: TUser;
  IdPlanilha: Integer;
begin
  User := GetUser;
  IdPlanilha := IncluirPlanilhaTransportadora(User.Id);
  for I := 0 to Itens.Count -1 do
  begin
    IncluirLinhaPlanilhaTransportadora(IdPlanilha, I+1, Itens.Items[I]);
  end;
  FireDacMSSQL.spProcessaPlanilha.ParamByName('@id_planilha').AsInteger := IdPlanilha;
  FireDacMSSQL.spProcessaPlanilha.ParamByName('@tipo').AsString := 'T';
  FireDacMSSQL.spProcessaPlanilha.ExecProc;
  FireDacMSSQL.Consulta.Close;
  FireDacMSSQL.Consulta.SQL.Text := 'select nr_linha, nm_mensagem_erro from  '+
    'validacoes_planilhas_transportadoras '+
    'where id_planilha_transportadora = :id_planilha';
  FireDacMSSQL.Consulta.ParamByName('id_planilha').AsInteger := IdPlanilha;
  FireDacMSSQL.Consulta.Open;
  Result := TResult.Create;
  Result.Planilha := IdPlanilha;
  if FireDacMSSQL.Consulta.IsEmpty then
    Result.Sucesso := True
  else
  begin
    Result.Sucesso := False;
    while not FireDacMSSQL.Consulta.Eof do
    begin
      Result.Mensagens.Add(TMensagens.Create(
        FireDacMSSQL.Consulta.FieldByName('nr_linha').AsInteger,
        FireDacMSSQL.Consulta.FieldByName('nm_mensagem_erro').AsString));
      FireDacMSSQL.Consulta.Next;
    end;
  end;

  ExcluirLinhaPlanilhaTransportadora(120);
end;


initialization
  RegisterServiceType(TTMServiceApiService);

end.
