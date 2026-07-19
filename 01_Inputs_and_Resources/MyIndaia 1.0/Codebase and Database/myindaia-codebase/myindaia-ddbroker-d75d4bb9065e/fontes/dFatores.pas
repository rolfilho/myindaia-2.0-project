unit dFatores;

interface

uses
  SysUtils, Classes, Variants, DBTables, DB, Funcoes;

type
  TdatmFatores = class(TDataModule)
    dsFatores: TDataSource;
    qryFatores: TQuery;
    qryFatoresCD_FATOR: TAutoIncField;
    qryFatoresNM_FATOR: TStringField;
    qryFatoresDS_FATOR: TStringField;
    qryFatoresCD_UNID_NEG: TStringField;
    qryFatoresCD_PRODUTO: TStringField;
    qryFatoresIN_OPCIONAL: TStringField;
    qryFatoresCD_GRUPO: TStringField;
    qryFatoresNM_CAMPO_PROCESSO: TStringField;
    qryFatoresNM_TABELA: TStringField;
    qryFatoresNM_CAMPO_CHAVE_TABELA: TStringField;
    qryFatoresNM_CAMPO_RETORNO_TABELA: TStringField;
    qryFatoresCD_COMPARADOR: TStringField;
    qryFatoresNM_SQL: TStringField;
    qryFatoresNM_RETORNO: TStringField;
    updFatores: TUpdateSQL;
    dsUnidades: TDataSource;
    qryUnidades: TQuery;
    dsProdutos: TDataSource;
    qryProdutos: TQuery;
    dsGrupos: TDataSource;
    qryGrupos: TQuery;
    dsCamposProcesso: TDataSource;
    qryCamposProcesso: TQuery;
    dsTabelas: TDataSource;
    qryTabelas: TQuery;
    dsCamposTabela: TDataSource;
    qryCamposTabela: TQuery;
    dsComparadores: TDataSource;
    qryComparadores: TQuery;
    dsOpcional: TDataSource;
    qryOpcional: TQuery;
    qryUnidadesCD_UNID_NEG: TStringField;
    qryUnidadesNM_UNID_NEG: TStringField;
    qryProdutosCD_PRODUTO: TStringField;
    qryProdutosNM_PRODUTO: TStringField;
    qryProdutosTP_PRODUTO: TStringField;
    qryGruposCD_GRUPO: TStringField;
    qryGruposNM_GRUPO: TStringField;
    qryCamposProcessoNM_TABELA: TStringField;
    qryCamposProcessoNM_COLUNA: TStringField;
    qryCamposProcessoDS_TIPO: TStringField;
    qryCamposProcessoIS_PERMITE_NULO: TBooleanField;
    qryTabelasID_TABELA: TIntegerField;
    qryTabelasNM_TABELA: TStringField;
    qryCamposTabelaNM_TABELA: TStringField;
    qryCamposTabelaNM_COLUNA: TStringField;
    qryComparadoresCD_COMPARADOR: TStringField;
    qryComparadoresNM_COMPARADOR: TStringField;
    qryOpcionalCD_OPCIONAL: TIntegerField;
    qryOpcionalNM_OPCIONAL: TStringField;
    dsServicos: TDataSource;
    qryServicos: TQuery;
    qryServicosCD_SERVICO: TIntegerField;
    qryServicosNM_SERVICO: TStringField;
    qryServicosCD_CLASSIFICACAO: TStringField;
    qryServicosCD_VIA_TRANSPORTE: TStringField;
    qryFatoresLK_NM_UNID_NEG: TStringField;
    qryFatoresLK_NM_PRODUTO: TStringField;
    qryFatoresLK_NM_OPCIONAL: TStringField;
    qryFatoresLK_NM_GRUPO: TStringField;
    qryFatoresLK_NM_COMPARADOR: TStringField;
    dsFatoresServicos: TDataSource;
    qryFatoresServicos: TQuery;
    updFatoresServicos: TUpdateSQL;
    qryFatoresServicosCD_FATOR: TIntegerField;
    qryFatoresServicosCD_SERVICO: TIntegerField;
    qryFatoresServicosLK_NM_SERVICO: TStringField;
    dsFatoresCampos: TDataSource;
    qryFatoresCampos: TQuery;
    updFatoresCampos: TUpdateSQL;
    qryFatoresCamposCD_FATOR: TIntegerField;
    qryFatoresCamposNM_CAMPO_PROCESSO: TStringField;
    qryFatoresCamposNM_FATOR_CAMPO: TStringField;
    qryFatoresCamposNM_LOOKUP_TABELA: TStringField;
    qryFatoresCamposNM_LOOKUP_SQL: TStringField;
    qryFatoresCamposNM_LOOKUP_CAMPO_CHAVE: TStringField;
    qryFatoresCamposNM_LOOKUP_CAMPO_RETORNO: TStringField;
    dsFatoresTriggers: TDataSource;
    qryFatoresTriggers: TQuery;
    updFatoresTriggers: TUpdateSQL;
    qryFatoresTriggersCD_FATOR: TIntegerField;
    qryFatoresTriggersNM_TABELA: TStringField;
    qryFatoresTriggersNM_CAMPOS_CHAVE: TStringField;
    qryFatoresTriggersNM_CAMPOS_UPDATE: TStringField;
    dsFatoresEvento: TDataSource;
    qryFatoresEvento: TQuery;
    updFatoresEvento: TUpdateSQL;
    qryFatoresEventoCD_FATOR: TIntegerField;
    qryFatoresEventoCD_EVENTO: TStringField;
    qryFatoresEventoCD_EVENTO_ANTERIOR: TStringField;
    qryFatoresEventoCD_EVENTO_BASE: TStringField;
    qryFatoresEventoPZ_EVENTO_BASE: TIntegerField;
    qryFatoresEventoNR_PRIORIDADE: TIntegerField;
    qryFatoresEventoIN_ALTERAR: TStringField;
    qryFatoresEventoIN_EXCLUIR: TStringField;
    qryFatoresEventoCD_SERVICO: TIntegerField;
    dsEventos: TDataSource;
    qryEventos: TQuery;
    qryEventosCD_EVENTO: TStringField;
    qryEventosNM_EVENTO: TStringField;
    qryFatoresEventoLK_NM_EVENTO: TStringField;
    qryFatoresEventoLK_NM_EVENTO_ANTERIOR: TStringField;
    qryFatoresEventoLK_NM_EVENTO_BASE: TStringField;
    qryFatoresEventoLK_NM_SERVICO: TStringField;
    qryFatoresEventoIN_INCLUIR: TStringField;
    qryFatoresEventoNM_OPERACAO: TStringField;
    qryFatoresEventoIN_PRAZO_UTIL: TStringField;
    qryFatoresEventoIN_PRAZO_FERIADO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryFatoresAfterScroll(DataSet: TDataSet);
    procedure qryFatoresAfterPost(DataSet: TDataSet);
    procedure qryFatoresServicosNewRecord(DataSet: TDataSet);
    procedure dsFatoresStateChange(Sender: TObject);
    procedure qryFatoresEventoCalcFields(DataSet: TDataSet);
    procedure qryFatoresEventoAfterPost(DataSet: TDataSet);
  private
    FPodeModificar, FPodeIncluir, FPodeExcluir: Boolean;
    FOnStateChange: TNotifyEvent;
  public
    property PodeModificar: Boolean read FPodeModificar;
    property PodeIncluir: Boolean read FPodeIncluir;
    property PodeExcluir: Boolean read FPodeExcluir;
    property OnStateChange: TNotifyEvent read FOnStateChange write FOnStateChange;
  end;

var
  datmFatores: TdatmFatores;

implementation

uses
  PGGP017, GSMLIB;

{$R *.dfm}

{ TdatmFatores }

procedure TdatmFatores.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  FPodeModificar := False;
  FPodeIncluir := False;
  FPodeExcluir := False;
  AtribuiDireitos(FPodeModificar, FPodeIncluir, FPodeExcluir);
  FPodeModificar := FPodeModificar or (str_cd_cargo = '001');
  FPodeIncluir   := FPodeIncluir or (str_cd_cargo = '001');
  FPodeExcluir   := FPodeExcluir or (str_cd_cargo = '001');
  for I := 0 to ComponentCount -1 do
    if (Components[I] is TQuery) and (Components[I].Tag in [1, 2]) and not TQuery(Components[I]).Active then
      TQuery(Components[I]).Open;

  dsFatores.AutoEdit := FPodeIncluir or FPodeModificar;
  dsFatoresServicos.AutoEdit := FPodeIncluir or FPodeModificar;
  dsFatoresCampos.AutoEdit := FPodeIncluir or FPodeModificar;
  dsFatoresTriggers.AutoEdit := FPodeIncluir or FPodeModificar;
  dsFatoresEvento.AutoEdit := FPodeIncluir or FPodeModificar;
end;

procedure TdatmFatores.qryFatoresAfterScroll(DataSet: TDataSet);
begin
  //qryCamposTabela.Filtered := False;
  //qryCamposTabela.Filter := 'NM_TABELA = ''' + qryFatoresNM_TABELA.AsString + '''';
  //qryCamposTabela.Filtered := True;
end;

procedure TdatmFatores.qryFatoresAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TdatmFatores.qryFatoresServicosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('CD_FATOR').AsInteger := qryFatoresCD_FATOR.AsInteger;
  if Assigned(DataSet.Fields.FindField('CD_UNID_NEG')) then
    DataSet.FieldByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  if Assigned(DataSet.Fields.FindField('CD_PRODUTO')) then
    DataSet.FieldByName('CD_PRODUTO').AsString := str_cd_produto;
  if Assigned(DataSet.Fields.FindField('IN_ALTERAR')) then
    DataSet.FieldByName('IN_ALTERAR').AsString := '0';
  if Assigned(DataSet.Fields.FindField('IN_EXCLUIR')) then
    DataSet.FieldByName('IN_EXCLUIR').AsString := '0';
  if Assigned(DataSet.Fields.FindField('IN_PRAZO_UTIL')) then
    DataSet.FieldByName('IN_PRAZO_UTIL').AsString := '0';
  if Assigned(DataSet.Fields.FindField('IN_PRAZO_FERIADO')) then
    DataSet.FieldByName('IN_PRAZO_FERIADO').AsString := '0';
end;

procedure TdatmFatores.dsFatoresStateChange(Sender: TObject);
begin
  if Assigned(FOnStateChange) then
    FOnStateChange(Sender);
end;

procedure TdatmFatores.qryFatoresEventoCalcFields(DataSet: TDataSet);
begin
  if (qryFatoresEventoIN_ALTERAR.AsString = '1') or (qryFatoresEventoIN_EXCLUIR.AsString = '1') then
    qryFatoresEventoIN_INCLUIR.AsString := '0'
  else
    qryFatoresEventoIN_INCLUIR.AsString := '1';
  if qryFatoresEventoIN_INCLUIR.AsString = '1' then
    qryFatoresEventoNM_OPERACAO.AsString := 'Incluir'
  else if qryFatoresEventoIN_ALTERAR.AsString = '1' then
    qryFatoresEventoNM_OPERACAO.AsString := 'Alterar'
  else if qryFatoresEventoIN_EXCLUIR.AsString = '1' then
    qryFatoresEventoNM_OPERACAO.AsString := 'Excluir'
  else
    qryFatoresEventoNM_OPERACAO.AsString := '';
end;

procedure TdatmFatores.qryFatoresEventoAfterPost(DataSet: TDataSet);
var
  Fator: Integer;
  Evento: String;
  Servico: Integer;
begin
  Fator   := qryFatoresEventoCD_FATOR.AsInteger;
  Evento  := qryFatoresEventoCD_EVENTO.AsString;
  Servico := qryFatoresEventoCD_SERVICO.AsInteger;

  qryFatoresEvento.ApplyUpdates;

  FastExecSQL('EXEC SP_ORDENA_EVENTOS_FATOR :CD_FATOR', [qryFatoresEventoCD_FATOR.AsInteger]);

  qryFatoresEvento.Close;
  qryFatoresEvento.Open;

  qryFatoresEvento.Locate('CD_FATOR;CD_EVENTO;CD_SERVICO', VarArrayOf([Fator, Evento, Servico]), []);
end;

end.
