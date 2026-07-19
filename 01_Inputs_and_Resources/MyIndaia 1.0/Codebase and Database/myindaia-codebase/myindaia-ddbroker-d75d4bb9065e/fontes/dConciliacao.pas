unit dConciliacao;

interface        

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_conciliacao = class(TDataModule)
    ds_caixa: TDataSource;
    qry_caixa_: TQuery;
    qry_caixa_CD_COLIGADA: TStringField;
    qry_caixa_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_NR_LANCAMENTO: TStringField;
    qry_caixa_CD_UNID_NEG: TStringField;
    qry_caixa_VL_LANCAMENTO: TFloatField;
    qry_caixa_CD_BANCO: TStringField;
    qry_caixa_NR_CHEQUE: TStringField;
    qry_caixa_IN_CONCILIACAO: TStringField;
    qry_caixa_NM_HISTORICO: TStringField;
    qry_caixa_NR_PROCESSO: TStringField;
    qry_caixa_CD_ITEM: TStringField;
    qry_caixa_CD_CT_CONTABIL: TStringField;
    qry_caixa_DT_CONCILIACAO: TDateTimeField;
    qry_caixa_CalcStatus: TStringField;
    qry_caixa_CalcProcesso: TStringField;
    qry_nao_conciliado_: TQuery;
    qry_nao_conciliado_CONCILIADO: TFloatField;
    qry_conciliado_: TQuery;
    FloatField1: TFloatField;
    qry_banco_padrao_: TQuery;
    qry_banco_padrao_CD_BANCO_CONCILIACAO: TStringField;
    qry_caixa_CD_FAVORECIDO: TStringField;
    qry_caixa_TP_NATUREZA: TStringField;
    ds_conc_: TDataSource;
    qry_conc_: TQuery;
    qry_conc_NR_IDENTIFICADOR: TIntegerField;
    qry_conc_VL_LANCAMENTO: TFloatField;
    qry_conc_DT_LANCAMENTO: TDateTimeField;
    qry_conc_NM_HISTORICO: TStringField;
    qry_conc_NR_DOCUMENTO: TStringField;
    qry_conc_NM_CATEGORIA: TIntegerField;
    qry_conc_TP_NATUREZA: TStringField;
    qry_conc_IN_CPMF: TStringField;
    ds_caixa_docto: TDataSource;
    qry_caixa_docto_: TQuery;
    qry_caixa_docto_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_docto_VL_LANCAMENTO: TFloatField;
    qry_caixa_docto_CD_BANCO: TStringField;
    qry_caixa_docto_NR_CHEQUE: TStringField;
    qry_caixa_docto_TP_NATUREZA: TStringField;
    qry_caixa_docto_NR_LANCAMENTO: TStringField;
    qry_caixa_docto_NM_HISTORICO: TStringField;
    qry_le_arq_txt_: TQuery;
    IntegerField4: TIntegerField;
    FloatField3: TFloatField;
    DateTimeField2: TDateTimeField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    qry_conc_IN_CONCILIADO: TStringField;
    qry_le_arq_txt_IN_CONCILIADO: TStringField;
    qry_caixa_docto_CD_COLIGADA: TStringField;
    qry_conc_CD_UNID_NEG: TStringField;
    qry_conc_CD_BANCO: TStringField;
    qry_caixa_TP_PAGAMENTO: TStringField;
    qry_conc_NR_SEQ: TAutoIncField;
    qry_conc_NR_LANCAMENTO: TStringField;
    qry_le_arq_txt_NR_SEQ: TAutoIncField;
    qry_le_arq_txt_CD_UNID_NEG: TStringField;
    qry_le_arq_txt_CD_BANCO: TStringField;
    qry_le_arq_txt_NR_LANCAMENTO: TStringField;
    qry_conc_lanc_: TQuery;
    IntegerField1: TIntegerField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    AutoIncField1: TAutoIncField;
    StringField12: TStringField;
    ds_conc_lanc_: TDataSource;
    qry_caixa_docto_NR_SEQ_CONCILIACAO: TIntegerField;
    qry_caixa_NR_SEQ_CONCILIACAO: TIntegerField;
    qry_caixa_IN_CONCILIACAO_AUTOM: TStringField;
    sp_concilia: TStoredProc;
    qry_caixa_docto_NR_PROCESSO: TStringField;
    qry_caixa_IN_CONTABILIZA: TStringField;
    qry_caixa_CalcConciliacao: TStringField;
    qry_caixa_CalcContabilizacao: TStringField;
    qry_caixa_CalcForma: TIntegerField;
    qry_caixa_VL_INSS: TFloatField;
    qry_caixa_VL_IR: TFloatField;
    qry_caixa_VL_PISCOFINS: TFloatField;
    qry_caixa_VL_ISS: TFloatField;
    qry_caixa_docto_CD_UNID_NEG: TStringField;
    qry_caixa_docto_CD_CT_CONTABIL: TStringField;
    qry_caixa_docto_IN_CONCILIACAO: TStringField;
    qry_caixa_docto_DT_CONCILIACAO: TDateTimeField;
    qry_caixa_docto_CD_USUARIO_CONCILIACAO: TStringField;
    qry_caixa_docto_IN_CONCILIACAO_AUTOM: TStringField;
    qry_caixa_NM_ITEM: TStringField;
    updCaixaDocto: TUpdateSQL;
    procedure qry_caixa_CalcFields(DataSet: TDataSet);
    procedure qry_caixa_docto_AfterDelete(DataSet: TDataSet);
    procedure qry_caixa_docto_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_conciliacao: Tdatm_conciliacao;

implementation

{$R *.dfm}

procedure Tdatm_conciliacao.qry_caixa_CalcFields(DataSet: TDataSet);
begin
  qry_caixa_.FieldByName('CalcProcesso').AsString := Copy( qry_caixa_.FieldByName('NR_PROCESSO').AsString, 5, 10 );

  qry_caixa_.FieldByName('CalcStatus').AsString := '';
  if ( qry_caixa_.FieldByName('IN_CONCILIACAO').AsString = '1' ) then  // selecionado para conciliar/cancelar
    qry_caixa_.FieldByName('CalcStatus').AsString := 'ü'
  else if qry_caixa_.FieldByName('IN_CONCILIACAO').AsString = '2' then // conciliado
    qry_caixa_.FieldByName('CalcStatus').AsString := '2';

  if qry_caixa_.FieldByName('IN_CONCILIACAO').AsString = '1' then
    qry_caixa_.FieldByName('CalcConciliacao').AsString := 'Sim'
  else
    qry_caixa_.FieldByName('CalcConciliacao').AsString := 'Não';

  if qry_caixa_.FieldByName('IN_CONTABILIZA').AsString = '1' then
    qry_caixa_.FieldByName('CalcContabilizacao').AsString := 'Sim'
  else
    qry_caixa_.FieldByName('CalcContabilizacao').AsString := 'Não';

  qry_caixa_.FieldByName('CalcForma').AsInteger := -1;
  if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = '$' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 0
  else if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = 'C' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 1
  else if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = 'T' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 2
  else if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = 'D' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 3
  else if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = 'L' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 4
  else if qry_caixa_.FieldByName('TP_PAGAMENTO').AsString  = 'O' then
    qry_caixa_.FieldByName('CalcForma').AsInteger := 5;

end;


procedure Tdatm_conciliacao.qry_caixa_docto_AfterDelete(DataSet: TDataSet);
begin
  qry_caixa_docto_.ApplyUpdates;
end;

procedure Tdatm_conciliacao.qry_caixa_docto_BeforePost(DataSet: TDataSet);
begin
  qry_caixa_docto_.ApplyUpdates;
end;

end.
