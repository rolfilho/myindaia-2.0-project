unit PGFI020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ConsOnlineEx;

type
  Tdatm_pesq_fin = class(TDataModule)
    ds_adm: TDataSource;
    qry_unid_neg_: TQuery;
    qry_favorecido_: TQuery;
    qry_ct_contabil_: TQuery;
    qry_historico_: TQuery;
    qry_banco_: TQuery;
    qry_produto_: TQuery;
    qry_item_: TQuery;
    qry_processo_: TQuery;
    ds_fat: TDataSource;
    qry_adm_: TQuery;
    qry_adm_DT_MOVIMENTO: TDateTimeField;
    qry_adm_NR_LANCAMENTO: TStringField;
    qry_adm_CD_FAVORECIDO: TStringField;
    qry_adm_CD_UNID_NEG: TStringField;
    qry_adm_IN_CANCELADO: TStringField;
    qry_adm_IN_TRANSFERIDO: TStringField;
    qry_adm_NM_HISTORICO: TStringField;
    qry_adm_VL_LANCAMENTO: TFloatField;
    qry_adm_TP_NATUREZA: TStringField;
    qry_adm_TP_PAGAMENTO: TStringField;
    qry_adm_CD_BANCO: TStringField;
    qry_adm_NR_CHEQUE: TStringField;
    qry_adm_CD_ACESSO: TStringField;
    qry_adm_CD_AUX: TStringField;
    qry_adm_CD_CT_CONTABIL: TStringField;
    qry_adm_CD_CT_CUSTO: TStringField;
    qry_adm_TP_LANCAMENTO: TStringField;
    qry_adm_VL_IR: TFloatField;
    qry_adm_TP_PROCEDENCIA: TStringField;
    qry_adm_CD_HIST_PADRAO: TStringField;
    qry_adm_DT_CANCELADO: TDateTimeField;
    qry_adm_IN_CONTABILIZA: TStringField;
    qry_adm_LookCtContabil: TStringField;
    qry_adm_LookNatureza: TStringField;
    qry_adm_LookCancelado: TStringField;
    qry_adm_LookFavorecido: TStringField;
    qry_adm_LookHistorico: TStringField;
    qry_adm_LookContabiliza: TStringField;
    qry_adm_LookBanco: TStringField;
    qry_adm_LookCtCusto: TStringField;
    qry_adm_LookUnidNeg: TStringField;
    qry_tp_natureza_: TQuery;
    qry_yes_no_: TQuery;
    qry_ct_custo_: TQuery;
    qry_fat_: TQuery;
    qry_fat_DT_MOVIMENTO: TDateTimeField;
    qry_fat_NR_LANCAMENTO: TStringField;
    qry_fat_CD_UNID_NEG: TStringField;
    qry_fat_TP_LANCAMENTO: TStringField;
    qry_fat_TP_PROCEDENCIA: TStringField;
    qry_fat_IN_CANCELADO: TStringField;
    qry_fat_IN_TRANSFERIDO: TStringField;
    qry_fat_NM_HISTORICO: TStringField;
    qry_fat_VL_LANCAMENTO: TFloatField;
    qry_fat_TP_NATUREZA: TStringField;
    qry_fat_TP_PAGAMENTO: TStringField;
    qry_fat_CD_BANCO: TStringField;
    qry_fat_NR_CHEQUE: TStringField;
    qry_fat_CD_FAVORECIDO: TStringField;
    qry_fat_NR_PROCESSO: TStringField;
    qry_fat_CD_ITEM: TStringField;
    qry_fat_VL_IR: TFloatField;
    qry_fat_VL_ASSIST: TFloatField;
    qry_fat_CD_DESPACHANTE: TStringField;
    qry_fat_IN_RESTITUI: TStringField;
    qry_fat_LookUnidNeg: TStringField;
    qry_fat_LookFavorecido: TStringField;
    qry_fat_LookBanco: TStringField;
    qry_fat_LookCancelado: TStringField;
    qry_fat_LookItem: TStringField;
    qry_fat_LookDespachante: TStringField;
    qry_fat_CalcNrProcesso: TStringField;
    qry_fat_LookProduto: TStringField;
    qry_fat_LookRestitui: TStringField;
    qry_fat_LookCliente: TStringField;
    qry_fat_LookCdProduto: TStringField;
    qry_fat_LookCdCliente: TStringField;
    qry_despachante_: TQuery;
    qry_cliente_: TQuery;
    qry_fat_CD_CT_CONTABIL: TStringField;
    qry_fat_LookContabil: TStringField;
    qry_adm_DT_CONCILIACAO: TDateTimeField;
    qry_fat_DT_CONCILIACAO: TDateTimeField;
    procedure qry_adm_CalcFields(DataSet: TDataSet);
    procedure qry_fat_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_fin: Tdatm_pesq_fin;

implementation

{$R *.DFM}

uses GSMLIB;

procedure Tdatm_pesq_fin.qry_adm_CalcFields(DataSet: TDataSet);
begin
  // Unidade de Negócio
  qry_adm_LookUnidNeg.AsString := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', qry_adm_CD_UNID_NEG.AsString ,  'NM_UNID_NEG');
  // Natureza
  qry_adm_LookNatureza.AsString := ConsultaLookUP('TTP_NATUREZA', 'CD_NATUREZA', qry_adm_TP_NATUREZA.AsString, 'NM_NATUREZA' );
  // Cancelado
  if qry_adm_IN_CANCELADO.Text = '1' then qry_adm_LookCancelado.Text := 'Sim'
  else qry_adm_LookCancelado.Text := 'Não';
  // Contabiliza
  if qry_adm_IN_CONTABILIZA.Text = '1' then qry_adm_LookContabiliza.Text := 'Sim'
  else qry_adm_LookContabiliza.Text := 'Não';
  // Favorecido
  qry_adm_LookFavorecido.AsString := ConsultaLookUP('TFAVORECIDO', 'CD_FAVORECIDO', qry_adm_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
  // Histórico
  qry_adm_LookHistorico.AsString := ConsultaLookUP('THIST_PADRAO', 'CD_HISTORICO', qry_adm_CD_HIST_PADRAO.AsString, 'NM_HISTORICO' );
  // Banco
  qry_adm_LookBanco.AsString := ConsultaLookUP('TBANCO', 'CD_BANCO', qry_adm_CD_BANCO.AsString , 'NM_BANCO');
  // Conta Custo
  qry_adm_LookCtCusto.AsString := ConsultaLookUP( 'TCT_CUSTO', 'CD_CT_CUSTO', qry_adm_CD_CT_CUSTO.AsString,'NM_CT_CUSTO' );
  // Conta Contábil
  qry_adm_LookCtContabil.AsString :=ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', qry_adm_CD_CT_CONTABIL.AsString,'NM_CT_CONTABIL');
end;

procedure Tdatm_pesq_fin.qry_fat_CalcFields(DataSet: TDataSet);
begin
  //Unidade de negócio
  qry_fat_LookUnidNeg.AsString := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', qry_fat_CD_UNID_NEG.AsString ,  'NM_UNID_NEG');
  //Cód Poduto
  qry_fat_LookCdProduto.AsString := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', qry_fat_NR_PROCESSO.AsString ,  'CD_PRODUTO');
  //Nome Produto
  qry_fat_LookProduto.AsString := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', qry_fat_LookCdProduto.AsString, 'NM_PRODUTO');
  //Favorecido
  qry_fat_LookFavorecido.AsString := ConsultaLookUP('TFAVORECIDO', 'CD_FAVORECIDO', qry_fat_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
  //Banco
  qry_fat_LookBanco.AsString := ConsultaLookUP('TBANCO', 'CD_BANCO', qry_fat_CD_BANCO.AsString , 'NM_BANCO');
  //Cancelado
  if qry_fat_IN_CANCELADO.Text = '1' then qry_fat_LookCancelado.Text := 'Sim'
  else qry_fat_LookCancelado.Text := 'Não';
  //item
  qry_fat_LookItem.AsString := ConsultaLookUP('TITEM', 'CD_ITEM',qry_fat_CD_ITEM.AsString ,'NM_ITEM');
  //Despachante
  qry_fat_LookDespachante.AsString := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE', qry_fat_CD_DESPACHANTE.AsString,'NM_DESPACHANTE');
  //Restitui
  if qry_fat_IN_RESTITUI.Text = '1' then qry_fat_LookRestitui.Text := 'Sim'
  else qry_fat_LookRestitui.Text := 'Não';
  //Cód Cliente
  qry_fat_LookCdCliente.AsString := ConsultaLookUP('TPROCESSO','NR_PROCESSO', qry_fat_NR_PROCESSO.AsString,'CD_CLIENTE');
  //Cliente
  qry_fat_LookCliente.AsString   := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', qry_fat_LookCdCliente.AsString,'NM_EMPRESA');
  //Nr. Processo
  qry_fat_CalcNrProcesso.AsString := Copy( qry_fat_NR_PROCESSO.AsString, 5, 14 );
  //Contra Partida
  qry_fat_LookContabil.AsString := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL', qry_fat_CD_CT_CONTABIL.AsString,'NM_CT_CONTABIL');
end;

end.
