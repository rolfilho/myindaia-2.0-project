unit PGOU002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ADSCNNCT, AdsData, AdsTable, ADSSET, AdsFunc;

type
  Tdatm_nf_broker_sap = class(TDataModule)
    qry_di_: TQuery;
    AConfiguracao: TAdsSettings;
    AConexao: TAdsConnection;
    qry_servico_: TQuery;
    qry_proc_emb_: TQuery;
    qry_di_CD_IMPORTADOR: TStringField;
    qry_di_CD_VIA_TRANSP_CARG: TStringField;
    qry_di_DT_CHEGADA_CARGA: TStringField;
    qry_di_PL_CARGA: TFloatField;
    qry_di_PB_CARGA: TFloatField;
    qry_di_VL_TOTAL_II: TFloatField;
    qry_di_VL_TOTAL_IPI: TFloatField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_VL_TOT_FRT_MNEG: TFloatField;
    qry_di_VL_TOT_SEGURO_MNEG: TFloatField;
    qry_di_VL_TOTAL_CIF_MN: TFloatField;
    qry_di_VL_TOTAL_MLE_MN: TFloatField;
    qry_di_VL_TOTAL_FRETE_MN: TFloatField;
    qry_di_VL_TOTAL_SEG_MN: TFloatField;
    qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField;
    qry_di_VL_TOT_ICMS: TFloatField;
    qry_di_VL_TOT_ICMS_CALCULADO: TFloatField;
    qry_di_TIPO_SEGURO: TStringField;
    qry_di_PC_SEGURO_MLE: TFloatField;
    qry_di_VL_TOT_FRT_PREPAID: TFloatField;
    qry_di_VL_TOT_FRT_COLLECT: TFloatField;
    qry_di_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_di_FLAG_STATUS_DI: TStringField;
    qry_di_FLAG_TIPO_SEGURO: TStringField;
    qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField;
    qry_di_QT_ADICOES: TIntegerField;
    qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField;
    Atbl_Importador: TAdsTable;
    Atbl_Unidade: TAdsTable;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_NR_REF_CLI: TStringField;
    Atbl_NF: TAdsTable;
    ds_lista: TDataSource;
    Atbl_NFCA1401: TStringField;
    Atbl_NFCD1404: TDateField;
    Atbl_NFCA1427: TStringField;
    Atbl_NFCN1415: TFloatField;
    Atbl_NFCN1416: TFloatField;
    qry_proc_emb_NM_EMBARCACAO: TStringField;
    qry_proc_emb_NR_PROCESSO: TStringField;
    qry_proc_emb_NR_VOO: TStringField;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_proc_emb_CD_SERVICO: TStringField;
    qry_proc_emb_LookViaTransp: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_proc_transp_: TQuery;
    qry_proc_transp_NR_PROCESSO: TStringField;
    qry_proc_transp_CD_TRANSP_NAC: TStringField;
    qry_proc_transp_NM_TRANSP_ROD: TStringField;
    ATbl_NF_Item: TAdsTable;
    Atbl_NFCA1402: TStringField;
    db_broker: TDatabase;
    procedure qry_di_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_nf_broker_sap: Tdatm_nf_broker_sap;

implementation

{$R *.DFM}

procedure Tdatm_nf_broker_sap.qry_di_lista_CalcFields(DataSet: TDataSet);
begin
  qry_di_lista_NR_PROCESSO_AUX.AsString :=
    Copy( qry_di_lista_NR_PROCESSO.AsString, 5, 14 );
  if qry_di_lista_NR_DECLARACAO_IMP.AsString <> '' then
     qry_di_lista_NR_DECLARACAO_IMP_Aux.AsString:=
         Copy( qry_di_lista_NR_DECLARACAO_IMP.AsString,  1, 2 ) + '/' +
         Copy( qry_di_lista_NR_DECLARACAO_IMP.AsString,  3, 7 ) + '-' +
         Copy( qry_di_lista_NR_DECLARACAO_IMP.AsString, 10, 1 );
end;





























end.



