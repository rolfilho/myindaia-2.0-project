unit PGLI004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_LI = class(TDataModule)
    qry_empresa_: TQuery;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_li_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_AP_UNID_NEG: TStringField;
    qry_unidade_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    ds_li: TDataSource;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_CD_IMPORTADOR: TStringField;
    qry_li_CD_SERVICO: TStringField;
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_NR_REGISTRO_LI: TStringField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_calc_nr_proc: TStringField;
    qry_li_TP_CAMBIO: TStringField;
    sp_li_duplica: TStoredProc;
    sp_li_desmonta: TStoredProc;
    qry_li_IN_MONTADA: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_li_TP_RATEIO_PESO_LIQ: TStringField;
    qry_li_IN_RATEIO_PESO_LIQ: TStringField;
    qry_li_CD_CONDICAO_MERC: TStringField;
    qry_Adicoes_DI_Copia: TQuery;
    qry_Adicoes_DI_CopiaNR_PROCESSO: TStringField;
    qry_Adicoes_DI_CopiaNR_ADICAO: TStringField;
    qry_Adicoes_DI_CopiaCD_PAIS_PROC_CARGA: TStringField;
    qry_Adicoes_DI_CopiaCD_URF_DESPACHO: TStringField;
    qry_Adicoes_DI_CopiaCD_URF_ENTR_CARGA: TStringField;
    qry_Adicoes_DI_CopiaCD_REGIME_TRIBUTAR: TStringField;
    qry_Adicoes_DI_CopiaCD_FUND_LEG_REGIME: TStringField;
    qry_Adicoes_DI_CopiaCD_TIPO_ACORDO_TAR: TStringField;
    qry_Adicoes_DI_CopiaCD_ACORDO_ALADI: TStringField;
    qry_Adicoes_DI_CopiaCD_COBERT_CAMBIAL: TStringField;
    qry_Adicoes_DI_CopiaCD_MODALIDADE_PGTO: TStringField;
    qry_Adicoes_DI_CopiaPL_MERCADORIA: TFloatField;
    qry_Adicoes_DI_CopiaCD_MOEDA_NEGOCIADA: TStringField;
    qry_Adicoes_DI_Copiavl_merc_loc_emb_mneg: TFloatField;
    qry_Adicoes_DI_CopiaCD_INCOTERMS_VENDA: TStringField;
    qry_Adicoes_DI_CopiaCD_MD_FRETE_MERC: TStringField;
    qry_Adicoes_DI_CopiaVL_FRETE_MERC_MNEG: TFloatField;
    qry_Adicoes_DI_CopiaIN_EMBUT_FRT_ITENS: TBooleanField;
    qry_Itens_DI_Copia: TQuery;
    qry_Itens_DI_CopiaNR_PROCESSO: TStringField;
    qry_Itens_DI_CopiaNR_ADICAO: TStringField;
    qry_Itens_DI_CopiaNR_ITEM: TStringField;
    qry_Itens_DI_CopiaCD_EXPORTADOR: TStringField;
    qry_Itens_DI_CopiaCD_FABR_EXPO: TStringField;
    qry_Itens_DI_CopiaCD_FABRICANTE: TStringField;
    qry_Itens_DI_CopiaCD_MERCADORIA: TStringField;
    qry_Itens_DI_CopiaCD_NALADI_NCCA: TStringField;
    qry_Itens_DI_CopiaCD_NALADI_SH: TStringField;
    qry_Itens_DI_CopiaCD_NCM_SH: TStringField;
    qry_Itens_DI_CopiaCD_PAIS_AQUISICAO: TStringField;
    qry_Itens_DI_CopiaCD_PAIS_ORIGEM: TStringField;
    qry_Itens_DI_CopiaCD_UN_MED_COMERC: TStringField;
    qry_Itens_DI_CopiaPL_MERCADORIA: TFloatField;
    qry_Itens_DI_CopiaQT_MERC_UN_COMERC: TFloatField;
    qry_Itens_DI_CopiaQT_MERC_UN_ESTAT: TFloatField;
    qry_Itens_DI_CopiaTX_DESC_DET_MERC: TMemoField;
    qry_Itens_DI_CopiaNR_ITEM_PO: TStringField;
    qry_Itens_DI_CopiaNR_PROC_PO: TStringField;
    qry_Itens_DI_CopiaVL_UNID_COND_VENDA: TFloatField;
    qry_Itens_DI_CopiaVL_MLE_ITEM: TFloatField;
    qry_Itens_DI_CopiaNR_DESTAQUE_NCM: TStringField;
    qry_LIs_Copia: TQuery;
    qry_LIs_CopiaNR_PROCESSO: TStringField;
    qry_Itens_Pedidos: TQuery;
    qry_Itens_PedidosNR_REFERENCIA: TStringField;
    qry_Itens_PedidosNR_ITEM_CLIENTE: TStringField;
    qry_Itens_PedidosNR_PARCIAL: TIntegerField;
    qry_Itens_PedidosNR_CNTR: TStringField;
    procedure qry_li_CalcFields(DataSet: TDataSet);
    procedure qry_li_AfterScroll(DataSet: TDataSet);
    procedure qry_li_AfterOpen(DataSet: TDataSet);
    procedure qry_li_BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_LI: Tdatm_LI;

implementation

uses PGLI002;

{$R *.DFM}

procedure Tdatm_LI.qry_li_CalcFields(DataSet: TDataSet);
begin
   qry_li_calc_nr_proc.AsString := Copy(qry_li_NR_PROCESSO.AsString, 5, 16);
end;

procedure Tdatm_LI.qry_li_AfterScroll(DataSet: TDataSet);
begin
  with frm_LI do
  begin
    str_nr_processo := qry_li_NR_PROCESSO.AsString;

    if qry_li_IN_MONTADA.AsString = '1' then
    begin
      in_montada := True;
      btn_mi( True, True, True, True, True, True );
    end
    else
    begin
      in_montada := False;
      btn_mi( False, True, True, False, True, False );
    end;
  end;
end;

procedure Tdatm_LI.qry_li_AfterOpen(DataSet: TDataSet);
begin
  with frm_LI do
  begin
    if Not qry_LI_.EOF then
      dbgrd_li.Enabled := True
    else
      dbgrd_li.Enabled := False;
  end;
end;

procedure Tdatm_LI.qry_li_BeforeOpen(DataSet: TDataSet);
begin
  frm_LI.btn_mi(True, False, False, False, False, False);
end;

end.
