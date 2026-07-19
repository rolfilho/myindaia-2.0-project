unit PGPE006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_itens = class(TDataModule)
    ds_pe: TDataSource;
    qry_pe_: TQuery;
    qry_pe_NR_PROCESSO: TStringField;
    ds_pe_itens_: TDataSource;
    qry_pe_itens_: TQuery;
    qry_exec_sp_: TQuery;
    qry_pe_itens_NR_PROCESSO: TStringField;
    qry_pe_itens_NR_ITEM: TStringField;
    qry_pe_itens_NR_PEDIDO_IMP: TStringField;
    qry_pe_itens_CD_MERCADORIA: TStringField;
    qry_pe_itens_CD_NCM: TStringField;
    qry_pe_itens_CD_NALADI_SH: TStringField;
    qry_pe_itens_CD_UNID_MEDIDA: TStringField;
    qry_pe_itens_CD_EMBALAGEM: TStringField;
    qry_pe_itens_CD_CLASSIF_EMBALAGEM: TStringField;
    qry_pe_itens_CD_FABR_EXPO: TStringField;
    qry_pe_itens_QT_POR_EMB: TFloatField;
    qry_pe_itens_QT_EMBALAGEM: TFloatField;
    qry_pe_itens_QT_MERCADORIA: TFloatField;
    qry_pe_itens_VL_UNITARIO: TFloatField;
    qry_pe_itens_VL_PESO_LIQ_UNIT: TFloatField;
    qry_pe_itens_VL_COMPRIMENTO_EMB: TFloatField;
    qry_pe_itens_VL_LARGURA_EMB: TFloatField;
    qry_pe_itens_VL_ALTURA_EMB: TFloatField;
    qry_pe_itens_VL_PESO_EMB: TFloatField;
    qry_pe_itens_VL_TOT_ITEM: TFloatField;
    qry_pe_itens_VL_TOT_PESO_LIQ: TFloatField;
    qry_pe_itens_VL_TOT_PESO_BRUTO: TFloatField;
    qry_pe_itens_VL_CUBAGEM: TFloatField;
    qry_pe_itens_VL_MLE: TFloatField;
    qry_pe_itens_VL_MCV: TFloatField;
    qry_pe_itens_TX_MERCADORIA: TMemoField;
    qry_pe_itens_VL_POR_EMB: TFloatField;
    qry_pe_QT_TOTAL_ITENS: TStringField;
    qry_ncm_: TQuery;
    qry_ncm_CODIGO: TStringField;
    qry_ncm_DESCRICAO: TStringField;
    qry_ncm_UNIDADE_MEDIDA: TStringField;
    qry_naladi_: TQuery;
    qry_naladi_Codigo: TStringField;
    qry_naladi_Descricao: TStringField;
    qry_embalagem_: TQuery;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_pe_itens_LookNmEmbalagem: TStringField;
    qry_unid_medida_: TQuery;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_pe_itens_LookNmUnidade: TStringField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_emp_nac_CD_GRUPO: TStringField;
    qry_pe_VL_TOT_QTDE_PROD: TFloatField;
    qry_pe_VL_TOT_QTDE_EMBALAGEM: TFloatField;
    qry_pe_VL_TOT_CUBAGEM: TFloatField;
    qry_pe_VL_PESO_LIQUIDO: TFloatField;
    qry_pe_VL_TOT_EXW: TFloatField;
    qry_pe_VL_TOT_FOB: TFloatField;
    qry_pe_VL_FRETE: TFloatField;
    qry_pe_VL_SEGURO: TFloatField;
    qry_pe_VL_TOT_MCV: TFloatField;
    qry_mercadoria_: TQuery;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_AP_MERCADORIA: TStringField;
    qry_mercadoria_NM_MERCADORIA: TMemoField;
    qry_mercadoria_PL_MERCADORIA: TFloatField;
    qry_mercadoria_VL_UNITARIO: TFloatField;
    qry_mercadoria_CD_IMPORTADOR: TStringField;
    qry_mercadoria_CD_GRUPO: TStringField;
    qry_mercadoria_CD_UN_MED_COMERC: TStringField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_CD_NALADI_SH: TStringField;
    qry_mercadoria_CD_NALADI_NCCA: TStringField;
    qry_mercadoria_CD_EXPORTADOR: TStringField;
    qry_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    qry_mercadoria_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_CD_TIPO_CALCULO: TStringField;
    qry_mercadoria_CD_FABR_EXPO: TStringField;
    qry_mercadoria_CD_FABRICANTE: TStringField;
    qry_mercadoria_lookup_: TQuery;
    qry_mercadoria_lookup_CD_MERCADORIA: TStringField;
    qry_mercadoria_lookup_AP_MERCADORIA: TStringField;
    qry_pe_itens_LookNmMercadoria: TStringField;
    qry_mercadoria_CD_EMBALAGEM: TStringField;
    qry_mercadoria_QT_POR_EMBALAGEM: TFloatField;
    qry_pe_CD_UNID_NEG: TStringField;
    qry_pe_itens_CD_UNID_NEG: TStringField;
    qry_pe_CD_LINGUA_PEDIDO: TStringField;
    qry_mercadoria_TX_DESC_INGLES: TMemoField;
    qry_mercadoria_TX_DESC_ESP: TMemoField;
    qry_pe_CD_EXPORTADOR: TStringField;
    qry_embalagem_CD_EMBALAGEM_SUP: TStringField;
    qry_embalagem_QT_EMBALAGEM_SUP: TFloatField;
    qry_pe_itens_CD_EMBALAGEM_SUP: TStringField;
    qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField;
    qry_pe_itens_QT_POR_EMB_SUP: TFloatField;
    qry_pe_itens_QT_EMBALAGEM_SUP: TFloatField;
    qry_emb_sup: TQuery;
    StringField1: TStringField;
    qry_pe_itens_LookNmEmbSup: TStringField;
    qry_pe_itens_VL_POR_EMB_SUP: TFloatField;
    qry_pe_itens_CD_EMBALAGEM_CLIENTE: TStringField;
    qry_pe_itens_CD_FABRICANTE: TStringField;
    qry_pe_itens_NR_PEDIDO: TStringField;
    ds_emp_est: TDataSource;
    qry_emp_est_: TQuery;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_pe_itens_LookFabricante: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_emb_supNM_EMBALAGEM_S: TStringField;
    procedure qry_pe_itens_BeforeEdit(DataSet: TDataSet);
    procedure qry_pe_itens_BeforeInsert(DataSet: TDataSet);

  private
    procedure VerificaEstado(Habilita : Boolean);

  public
    { Public declarations }
  end;

var
  datm_pe_itens: Tdatm_pe_itens;

implementation

uses pgli003, gsmlib, PGPE003;

{$R *.DFM}

procedure Tdatm_pe_itens.VerificaEstado(Habilita : Boolean);
begin
  frm_PE_itens.btn_novo_item.Enabled  := not Habilita;
  frm_PE_itens.mi_novo_item.Enabled   := not Habilita;
  frm_PE_itens.btn_salvar.Enabled     := Habilita;
  frm_PE_itens.mi_salvar.Enabled      := Habilita;
  frm_PE_itens.btn_cancelar.Enabled   := Habilita;
  frm_PE_itens.mi_cancelar.Enabled    := Habilita;
  frm_PE_itens.btn_duplicar.Enabled   := not Habilita;
  frm_PE_itens.mi_duplicar.Enabled    := not Habilita;
end;

procedure Tdatm_pe_itens.qry_pe_itens_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
  frm_PE_itens.btn_novo_item.Enabled := False;
  frm_PE_itens.btn_capa_pe.Enabled   := False;
  frm_PE_itens.btn_excluir.Enabled   := False;
  frm_PE_itens.btn_duplicar.Enabled  := False;
  frm_PE_itens.mi_novo_item.Enabled  := False;
  frm_PE_itens.mi_excluir.Enabled    := False;
  frm_PE_itens.mi_duplicar.Enabled   := False;
end;

procedure Tdatm_pe_itens.qry_pe_itens_BeforeInsert(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;







end.
