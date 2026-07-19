unit PGDI041;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_di_rec_diag = class(TDataModule)
    IMPORT: TDatabase;
    QR_CapaDI: TQuery;
    qry_di_: TQuery;
    ds_grd_di: TDataSource;
    QR_Diag_DI: TQuery;
    QR_CapaDINR_DECL_IMP_MICRO: TStringField;
    QR_CapaDINR_IDENT_USUARIO: TStringField;
    QR_CapaDINR_DECL_IMP_PROT: TStringField;
    QR_CapaDINR_DECLARACAO_IMP: TStringField;
    QR_CapaDIDT_PROCESSAMENTO: TStringField;
    QR_CapaDIDT_TRANSMISSAO: TStringField;
    QR_CapaDIDT_REGISTRO_DI: TStringField;
    QR_CapaDICD_TIPO_DECLARACAO: TStringField;
    QR_CapaDICD_MOTIVO_TRANS: TStringField;
    QR_CapaDICD_TIPO_IMPORTADOR: TStringField;
    QR_CapaDINR_IMPORTADOR: TStringField;
    QR_CapaDICD_PAIS_IMPORTADOR: TStringField;
    QR_CapaDINM_IMPORTADOR: TStringField;
    QR_CapaDINR_TEL_IMPORTADOR: TStringField;
    QR_CapaDIED_LOGR_IMPORTADOR: TStringField;
    QR_CapaDIED_NR_IMPORTADOR: TStringField;
    QR_CapaDIED_COMPL_IMPO: TStringField;
    QR_CapaDIED_BA_IMPORTADOR: TStringField;
    QR_CapaDIED_MUN_IMPORTADOR: TStringField;
    QR_CapaDIED_UF_IMPORTADOR: TStringField;
    QR_CapaDIED_CEP_IMPORTADOR: TStringField;
    QR_CapaDINR_CPF_REPR_LEGAL: TStringField;
    QR_CapaDICD_MODALIDADE_DESP: TStringField;
    QR_CapaDIIN_OPERACAO_FUNDAP: TBooleanField;
    QR_CapaDICD_URF_ENTR_CARGA: TStringField;
    QR_CapaDICD_URF_DESPACHO: TStringField;
    QR_CapaDICD_TIPO_CONSIG: TStringField;
    QR_CapaDINR_CONSIGNATARIO: TStringField;
    QR_CapaDINM_CONSIGNATARIO: TStringField;
    QR_CapaDICD_PAIS_PROC_CARGA: TStringField;
    QR_CapaDICD_VIA_TRANSP_CARG: TStringField;
    QR_CapaDIIN_MULTIMODAL: TBooleanField;
    QR_CapaDINR_VEICULO_TRANSP: TStringField;
    QR_CapaDINM_VEICULO_TRANSP: TStringField;
    QR_CapaDINM_TRANSPORTADOR: TStringField;
    QR_CapaDICD_BANDEIRA_TRANSP: TStringField;
    QR_CapaDICD_TIPO_AG_CARGA: TStringField;
    QR_CapaDINR_AGENTE_CARGA: TStringField;
    QR_CapaDICD_TIPO_DCTO_CARGA: TStringField;
    QR_CapaDINR_DCTO_CARGA: TStringField;
    QR_CapaDINR_DCTO_CARGA_MAST: TStringField;
    QR_CapaDINM_LOCAL_EMBARQUE: TStringField;
    QR_CapaDIDT_EMBARQUE: TStringField;
    QR_CapaDICD_UTIL_DCTO_CARGA: TStringField;
    QR_CapaDIPB_CARGA: TStringField;
    QR_CapaDIPL_CARGA: TStringField;
    QR_CapaDIDT_CHEGADA_CARGA: TStringField;
    QR_CapaDICD_TIPO_MANIFESTO: TStringField;
    QR_CapaDINR_MANIFESTO: TStringField;
    QR_CapaDICD_RECINTO_ALFAND: TStringField;
    QR_CapaDICD_SETOR_ARMAZENAM: TStringField;
    QR_CapaDICD_MOEDA_FRETE: TStringField;
    QR_CapaDIVL_TOT_FRT_PREPAID: TFloatField;
    QR_CapaDIVL_TOT_FRT_COLLECT: TFloatField;
    QR_CapaDIVL_FRETE_TNAC_MNEG: TFloatField;
    QR_CapaDIVL_TOTAL_FRETE_MN: TFloatField;
    QR_CapaDICD_MOEDA_SEGURO: TStringField;
    QR_CapaDIVL_TOT_SEGURO_MNEG: TFloatField;
    QR_CapaDIVL_TOTAL_SEG_MN: TFloatField;
    QR_CapaDICD_MOEDA_DESPESAS: TStringField;
    QR_CapaDIVL_TOT_DESPS_MNEG: TFloatField;
    QR_CapaDIVL_TOT_DESPS_MN: TFloatField;
    QR_CapaDICD_MOEDA_MLE: TStringField;
    QR_CapaDIVL_TOT_MLE_MNEG: TFloatField;
    QR_CapaDIVL_TOTAL_MLE_MN: TFloatField;
    QR_CapaDIIN_MOEDA_UNICA: TBooleanField;
    QR_CapaDITX_INFO_COMPL: TMemoField;
    QR_CapaDICD_TIPO_PGTO_TRIB: TStringField;
    QR_CapaDINR_CONTA_PGTO_TRIB: TStringField;
    sp_atz_evento: TStoredProc;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    sp_di_distribui_deb_com: TStoredProc;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1NR_DECL_IMP_MICRO: TStringField;
    Query1NR_IDENT_USUARIO: TStringField;
    Query1NR_DECL_IMP_PROT: TStringField;
    Query1NR_DECLARACAO_IMP: TStringField;
    Query1DT_PROCESSAMENTO: TStringField;
    Query1DT_TRANSMISSAO: TStringField;
    Query1DT_REGISTRO_DI: TStringField;
    Query1CD_TIPO_DECLARACAO: TStringField;
    Query1CD_MOTIVO_TRANS: TStringField;
    Query1CD_TIPO_IMPORTADOR: TStringField;
    Query1NR_IMPORTADOR: TStringField;
    Query1CD_PAIS_IMPORTADOR: TStringField;
    Query1NM_IMPORTADOR: TStringField;
    Query1NR_TEL_IMPORTADOR: TStringField;
    Query1ED_LOGR_IMPORTADOR: TStringField;
    Query1ED_NR_IMPORTADOR: TStringField;
    Query1ED_COMPL_IMPO: TStringField;
    Query1ED_BA_IMPORTADOR: TStringField;
    Query1ED_MUN_IMPORTADOR: TStringField;
    Query1ED_UF_IMPORTADOR: TStringField;
    Query1ED_CEP_IMPORTADOR: TStringField;
    Query1NR_CPF_REPR_LEGAL: TStringField;
    Query1CD_MODALIDADE_DESP: TStringField;
    Query1IN_OPERACAO_FUNDAP: TBooleanField;
    Query1CD_URF_ENTR_CARGA: TStringField;
    Query1CD_URF_DESPACHO: TStringField;
    Query1CD_TIPO_CONSIG: TStringField;
    Query1NR_CONSIGNATARIO: TStringField;
    Query1NM_CONSIGNATARIO: TStringField;
    Query1CD_PAIS_PROC_CARGA: TStringField;
    Query1CD_VIA_TRANSP_CARG: TStringField;
    Query1IN_MULTIMODAL: TBooleanField;
    Query1NR_VEICULO_TRANSP: TStringField;
    Query1NM_VEICULO_TRANSP: TStringField;
    Query1NM_TRANSPORTADOR: TStringField;
    Query1CD_BANDEIRA_TRANSP: TStringField;
    Query1CD_TIPO_AG_CARGA: TStringField;
    Query1NR_AGENTE_CARGA: TStringField;
    Query1CD_TIPO_DCTO_CARGA: TStringField;
    Query1NR_DCTO_CARGA: TStringField;
    Query1NR_DCTO_CARGA_MAST: TStringField;
    Query1NM_LOCAL_EMBARQUE: TStringField;
    Query1DT_EMBARQUE: TStringField;
    Query1CD_UTIL_DCTO_CARGA: TStringField;
    Query1PB_CARGA: TStringField;
    Query1PL_CARGA: TStringField;
    Query1DT_CHEGADA_CARGA: TStringField;
    Query1CD_TIPO_MANIFESTO: TStringField;
    Query1NR_MANIFESTO: TStringField;
    Query1CD_RECINTO_ALFAND: TStringField;
    Query1CD_SETOR_ARMAZENAM: TStringField;
    Query1CD_MOEDA_FRETE: TStringField;
    Query1VL_TOT_FRT_PREPAID: TFloatField;
    Query1VL_TOT_FRT_COLLECT: TFloatField;
    Query1VL_FRETE_TNAC_MNEG: TFloatField;
    Query1VL_TOTAL_FRETE_MN: TFloatField;
    Query1CD_MOEDA_SEGURO: TStringField;
    Query1VL_TOT_SEGURO_MNEG: TFloatField;
    Query1VL_TOTAL_SEG_MN: TFloatField;
    Query1CD_MOEDA_DESPESAS: TStringField;
    Query1VL_TOT_DESPS_MNEG: TFloatField;
    Query1VL_TOT_DESPS_MN: TFloatField;
    Query1CD_MOEDA_MLE: TStringField;
    Query1VL_TOT_MLE_MNEG: TFloatField;
    Query1VL_TOTAL_MLE_MN: TFloatField;
    Query1IN_MOEDA_UNICA: TBooleanField;
    Query1TX_INFO_COMPL: TMemoField;
    Query1CD_TIPO_PGTO_TRIB: TStringField;
    Query1NR_CONTA_PGTO_TRIB: TStringField;
    qry_cliente_servico_: TQuery;
    sp_distribui_sda: TStoredProc;
    QR_CapaDIcalcNR_IDENT_USUARIO: TStringField;
    procedure QR_CapaDICalcFields(DataSet: TDataSet);
  private
    function AjustaProcesso(AProcesso: String): String;
  public
    { Public declarations }
  end;

var
  datm_di_rec_diag: Tdatm_di_rec_diag;

implementation

{$R *.DFM}

{ Tdatm_di_rec_diag }

function Tdatm_di_rec_diag.AjustaProcesso(AProcesso: String): String;
var
  nProc: Integer;
begin
  Result := Trim(AProcesso);
  if not TryStrToInt(Copy(Result, 1, 4), nProc) then
    Result := '0' + Copy(Result, 1, 1) + '0' + Copy(Result, 2, 20);
end;

procedure Tdatm_di_rec_diag.QR_CapaDICalcFields(DataSet: TDataSet);
begin
  QR_CapaDIcalcNR_IDENT_USUARIO.AsString := AjustaProcesso(QR_CapaDINR_IDENT_USUARIO.AsString);
end;

end.
