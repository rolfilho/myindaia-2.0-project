{ Data module Licença Importação
  Autor: Edvaldo de Andrade }
  
unit PGLI008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_trans_LI = class(TDataModule)
    REGIMP: TDatabase;
    qry_li_scx_: TQuery;
    TB_Numerador_LI: TTable;
    RS_Item_LI: TQuery;
    RS_Dest_NCM: TQuery;
    RS_Proc_Anuente: TQuery;
    RS_Diag_LI: TQuery;
    qry_li_scx_NR_TRAT_IMP_MICRO: TStringField;
    qry_li_scx_NR_IDENT_USUARIO: TStringField;
    qry_li_scx_NR_OPER_TRAT_PROT: TStringField;
    qry_li_scx_CD_AUTORIZ_TRANSM: TStringField;
    qry_li_scx_NR_OPER_TRAT_PREV: TStringField;
    qry_li_scx_NR_LI_SUBSTITUIDO: TStringField;
    qry_li_scx_CD_ORIGEM_LI: TStringField;
    qry_li_scx_NR_DECL_IMP_VINC: TStringField;
    qry_li_scx_NR_ADI_IMP_VINC: TStringField;
    qry_li_scx_NR_SEQ_RETI_VINC: TStringField;
    qry_li_scx_CD_TIPO_IMPORTADOR: TStringField;
    qry_li_scx_NR_IMPORTADOR: TStringField;
    qry_li_scx_CD_PAIS_IMPORTADOR: TStringField;
    qry_li_scx_NM_IMPORTADOR: TStringField;
    qry_li_scx_NR_TEL_IMPORTADOR: TStringField;
    qry_li_scx_ED_LOGR_IMPORTADOR: TStringField;
    qry_li_scx_ED_NR_IMPORTADOR: TStringField;
    qry_li_scx_ED_COMPL_IMPO: TStringField;
    qry_li_scx_ED_BA_IMPORTADOR: TStringField;
    qry_li_scx_ED_MUN_IMPORTADOR: TStringField;
    qry_li_scx_ED_UF_IMPORTADOR: TStringField;
    qry_li_scx_ED_CEP_IMPORTADOR: TStringField;
    qry_li_scx_CD_ATIV_ECON_IMPO: TStringField;
    qry_li_scx_NR_CPF_REPR_LEGAL: TStringField;
    qry_li_scx_CD_URF_ENTR_MERC: TStringField;
    qry_li_scx_NM_FORN_ESTR: TStringField;
    qry_li_scx_ED_LOGR_FORN_ESTR: TStringField;
    qry_li_scx_ED_NR_FORN_ESTR: TStringField;
    qry_li_scx_ED_COMPL_FORN_ESTR: TStringField;
    qry_li_scx_ED_CIDAD_FORN_ESTR: TStringField;
    qry_li_scx_ED_ESTAD_FORN_ESTR: TStringField;
    qry_li_scx_CD_PAIS_AQUIS_MERC: TStringField;
    qry_li_scx_CD_MERCADORIA_NCM: TStringField;
    qry_li_scx_CD_PAIS_PROC_MERC: TStringField;
    qry_li_scx_CD_AUSENCIA_FABRIC: TStringField;
    qry_li_scx_NM_FABRICANTE_MERC: TStringField;
    qry_li_scx_ED_LOGR_FABRIC: TStringField;
    qry_li_scx_ED_NR_FABRIC: TStringField;
    qry_li_scx_ED_COMPL_FABRIC: TStringField;
    qry_li_scx_ED_CIDAD_FABRIC: TStringField;
    qry_li_scx_ED_ESTADO_FABRIC: TStringField;
    qry_li_scx_CD_PAIS_ORIG_MERC: TStringField;
    qry_li_scx_CD_MERC_NALADI_NCC: TStringField;
    qry_li_scx_CD_MERC_NALADI_SH: TStringField;
    qry_li_scx_PL_MERCADORIA: TStringField;
    qry_li_scx_QT_UN_ESTATISTICA: TStringField;
    qry_li_scx_CD_MOEDA_NEGOCIADA: TStringField;
    qry_li_scx_QT_DIA_LIMITE_PGTO: TStringField;
    qry_li_scx_CD_INCOTERMS_VENDA: TStringField;
    qry_li_scx_VL_MERC_MNEG_EMB: TStringField;
    qry_li_scx_VL_TOT_DOLAR_EMB: TStringField;
    qry_li_scx_CD_TIPO_ACORDO_TAR: TStringField;
    qry_li_scx_CD_ACORDO_ALADI: TStringField;
    qry_li_scx_CD_REGIME_TRIBUTAR: TStringField;
    qry_li_scx_CD_FUND_LEG_REGIME: TStringField;
    qry_li_scx_CD_COBERT_CAMBIAL: TStringField;
    qry_li_scx_CD_MODALIDADE_PGTO: TStringField;
    qry_li_scx_CD_ORGAO_FIN_INTER: TStringField;
    qry_li_scx_CD_MOTIVO_SEM_COB: TStringField;
    qry_li_scx_CD_AGENCIA_SECEX: TStringField;
    qry_li_scx_CD_URF_DESPACHO: TStringField;
    qry_li_scx_IN_REST_DATA_EMB_LI: TStringField;
    qry_li_scx_IN_MATERIAL_USADO: TBooleanField;
    qry_li_scx_IN_BEM_ENCOMENDA: TBooleanField;
    qry_li_scx_NR_ATO_DRAWBACK: TStringField;
    qry_li_scx_NR_COMUNIC_COMPRA: TStringField;
    qry_li_scx_DT_REG_OPER_TRAT: TStringField;
    qry_li_scx_DT_ATU_OPER_MICRO: TStringField;
    qry_li_scx_IN_SALVO_DIAG: TBooleanField;
    qry_li_scx_IN_SELECAO_DIAG: TBooleanField;
    qry_li_scx_TX_INFO_COMPL: TMemoField;
    qry_li_scx_CD_SITUAC_OP_TRAT: TStringField;
    qry_li_scx_DT_SITUAC_OP_TRAT: TStringField;
    qry_li_scx_DT_VALID_OP_TRAT: TStringField;
    qry_li_scx_CD_CANCEL_OP_TRAT: TStringField;
    qry_li_scx_DT_CANCEL_OP_TRAT: TStringField;
    qry_li_scx_NR_CPF_CANC_ANUENC: TStringField;
    qry_li_scx_NR_LI_SUBSTITUTIVO: TStringField;
    TB_Ag_Secex: TTable;
    TABSISCO: TDatabase;
    RS_TB: TQuery;
    qry_li_: TQuery;
    qry_li_itens_: TQuery;
    ds_li_lista: TDataSource;
    qry_li_lista_: TQuery;
    qry_emp_nac_: TQuery;
    qry_emp_est_: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_trans_LI: Tdatm_trans_LI;

implementation

{$R *.DFM}













end.
