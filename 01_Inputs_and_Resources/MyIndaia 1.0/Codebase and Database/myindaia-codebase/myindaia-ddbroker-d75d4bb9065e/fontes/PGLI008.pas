unit PGLI008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_trans_LI = class(TDataModule)
    REGIMP: TDatabase;
    qry_li_scx_: TQuery;
    tbl_Numerador_LI_: TTable;
    qry_li_itens_scx_: TQuery;
    qry_dest_NCM_scx_: TQuery;
    qry_proc_anuentes_scx_: TQuery;                                               
    RS_Diag_LI: TQuery;
    TABSISCO: TDatabase;
    RS_TB: TQuery;
    qry_li_: TQuery;
    qry_li_itens_: TQuery;
    ds_li_lista: TDataSource;
    qry_li_lista_: TQuery;
    qry_emp_nac_: TQuery;
    qry_emp_est_: TQuery;
    qry_unid_med_broker_: TQuery;
    qry_proc_anuentes_: TQuery;
    qry_ag_secex_: TQuery;
    qry_li_lista_DT_PROCESSO_LI: TDateTimeField;
    qry_li_lista_NR_REGISTRO_LI: TStringField;
    qry_li_lista_DT_REGISTRO_LI: TDateTimeField;
    qry_li_lista_NR_PROCESSO: TStringField;
    qry_li_lista_NM_EMPRESA: TStringField;
    qry_li_lista_CalcNrProcesso: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_IDENT_USUARIO: TStringField;
    qry_li_NR_ATO_DRAWBACK: TStringField;
    qry_li_NR_COMUNICADO_COMPRA: TStringField;
    qry_li_NR_REGISTRO_LI: TStringField;
    qry_li_CD_MOD_PAGAMENTO: TStringField;
    qry_li_CD_IMPORTADOR: TStringField;
    qry_li_CD_ACORDO_ALADI: TStringField;
    qry_li_CD_REGIME_TRIBUTACAO: TStringField;
    qry_li_CD_FUND_LEGAL: TStringField;
    qry_li_CD_AGENCIA_SECEX: TStringField;
    qry_li_CD_PAIS_PROCEDENCIA: TStringField;
    qry_li_CD_INCOTERM: TStringField;
    qry_li_CD_INSTITUICAO_FINANC: TStringField;
    qry_li_CD_MOT_SEM_COBERTURA: TStringField;
    qry_li_CD_CONDICAO_MERC: TStringField;
    qry_li_CD_MOEDA_FOB: TStringField;
    qry_li_CD_URF_DESPACHO: TStringField;
    qry_li_CD_URF_ENTRADA: TStringField;
    qry_li_CD_MOEDA_FRETE: TStringField;
    qry_li_CD_MOEDA_SEGURO: TStringField;
    qry_li_CD_MOEDA_MLE: TStringField;
    qry_li_CD_TIPO_IMPORTADOR: TStringField;
    qry_li_CD_SERVICO: TStringField;
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_QT_DIAS_COBERTURA: TIntegerField;
    qry_li_QT_TOTAL_PES_LIQ: TFloatField;
    qry_li_QT_MED_ESTATISTICA: TFloatField;
    qry_li_QT_TOTAL_ITEM: TStringField;
    qry_li_TP_CAMBIO: TStringField;
    qry_li_TP_ACORDO_ALADI: TStringField;
    qry_li_TX_INFO_COMPLEMENTAR: TMemoField;
    qry_li_VL_FRETE_MOEDA: TFloatField;
    qry_li_VL_SEGURO_MOEDA: TFloatField;
    qry_li_VL_DESPESA_MOEDA: TFloatField;
    qry_li_VL_DESCONTO_MOEDA: TFloatField;
    qry_li_VL_TOTAL_MOEDA: TFloatField;
    qry_li_NR_PROCESSO_SISCOMEX: TStringField;
    qry_li_IN_MONTADA: TStringField;
    qry_numera_li_: TQuery;
    qry_li_NR_LI_SUBSTITUIDO: TStringField;
    qry_li_IN_EMBUT_FRT_ITENS: TStringField;
    procedure qry_li_lista_CalcFields(DataSet: TDataSet);
    procedure qry_li_lista_AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_trans_LI: Tdatm_trans_LI;

implementation

{$R *.DFM}

procedure Tdatm_trans_LI.qry_li_lista_CalcFields(DataSet: TDataSet);
begin
  qry_li_lista_CalcNrProcesso.AsString := Copy(qry_li_lista_NR_PROCESSO.AsString, 5, 16);
end;

procedure Tdatm_trans_LI.qry_li_lista_AfterOpen(DataSet: TDataSet);
begin
  qry_li_.Close;
  qry_li_.Prepare;
  qry_li_.Open;
end;

end.
