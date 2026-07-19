unit udatm_DocumentosExportacao;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TCliente = (tcPetronas, tcApolo);

  Tdatm_DocumentosExportacao = class(TDataModule)
    SQLConnection: TSQLConnection;
    qryUnidadeNeg: TSQLQuery;
    qryUnidadeNegCD_UNID_NEG: TStringField;
    qryUnidadeNegNM_UNID_NEG: TStringField;
    dspUnidadeNeg: TDataSetProvider;
    cdsUnidadeNeg: TClientDataSet;
    cdsUnidadeNegCD_UNID_NEG: TStringField;
    cdsUnidadeNegNM_UNID_NEG: TStringField;
    dsUnidadeNeg: TDataSource;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoCD_PRODUTO: TStringField;
    cdsProdutoNM_PRODUTO: TStringField;
    dspProduto: TDataSetProvider;
    qryProduto: TSQLQuery;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    qryPackingList: TSQLQuery;
    dspPackingList: TDataSetProvider;
    cdsPackingList: TClientDataSet;
    dsPackingList: TDataSource;
    dsPackingListItem: TDataSource;
    cdsPackingListItem: TClientDataSet;
    dspPackingListItem: TDataSetProvider;
    qryPackingListItem: TSQLQuery;
    qryFaturaComercial: TSQLQuery;
    dspFaturaComercial: TDataSetProvider;
    cdsFaturaComercial: TClientDataSet;
    dsFaturaComercial: TDataSource;
    qryFaturaComercialItem: TSQLQuery;
    dspFaturaComercialItem: TDataSetProvider;
    cdsFaturaComercialItem: TClientDataSet;
    dsFaturaComercialItem: TDataSource;
    qryFaturaComercialItemNR_PROCESSO: TStringField;
    qryFaturaComercialItemCD_MERCADORIA: TStringField;
    qryFaturaComercialItemMERCADORIA_ING: TStringField;
    qryFaturaComercialItemMERCADORIA_ESP: TStringField;
    qryFaturaComercialItemCD_UNID_MEDIDA: TStringField;
    qryFaturaComercialItemUNIDADE_MEDIDA_ING: TStringField;
    qryFaturaComercialItemUNIDADE_MEDIDA_ESP: TStringField;
    qryFaturaComercialItemQT_MERCADORIA: TFloatField;
    qryFaturaComercialItemCD_NCM: TStringField;
    qryFaturaComercialItemCD_NALADI_SH: TStringField;
    qryFaturaComercialItemVL_UNITARIO: TFloatField;
    qryFaturaComercialItemVL_TOT_ITEM: TFloatField;
    qryFaturaComercialItemNR_PEDIDO: TStringField;
    cdsFaturaComercialItemNR_PROCESSO: TStringField;
    cdsFaturaComercialItemCD_MERCADORIA: TStringField;
    cdsFaturaComercialItemMERCADORIA_ING: TStringField;
    cdsFaturaComercialItemMERCADORIA_ESP: TStringField;
    cdsFaturaComercialItemCD_UNID_MEDIDA: TStringField;
    cdsFaturaComercialItemUNIDADE_MEDIDA_ING: TStringField;
    cdsFaturaComercialItemUNIDADE_MEDIDA_ESP: TStringField;
    cdsFaturaComercialItemQT_MERCADORIA: TFloatField;
    cdsFaturaComercialItemCD_NCM: TStringField;
    cdsFaturaComercialItemCD_NALADI_SH: TStringField;
    cdsFaturaComercialItemVL_UNITARIO: TFloatField;
    cdsFaturaComercialItemVL_TOT_ITEM: TFloatField;
    cdsFaturaComercialItemNR_PEDIDO: TStringField;
    cdsFaturaComercialVL_PESO_BRUTO: TFloatField;
    cdsFaturaComercialVL_PESO_LIQUIDO: TFloatField;
    cdsFaturaComercialVL_TOT_CUBAGEM: TFloatField;
    cdsFaturaComercialVL_TOT_EXW: TFloatField;
    cdsFaturaComercialMOEDA_MLE: TStringField;
    cdsFaturaComercialVL_SEGURO: TFloatField;
    cdsFaturaComercialMOEDA_SEGURO: TStringField;
    cdsFaturaComercialVL_FRETE_INT: TFloatField;
    cdsFaturaComercialMOEDA_FRETE: TStringField;
    cdsFaturaComercialDESC_FRETE: TStringField;
    cdsFaturaComercialVL_TOT_DESPESA: TFloatField;
    cdsFaturaComercialVL_ACRESCIMO: TFloatField;
    cdsFaturaComercialVL_DESCONTO: TFloatField;
    cdsFaturaComercialVL_TOTAL_MLE: TFloatField;
    cdsFaturaComercialVL_TOTAL_MVC: TFloatField;
    qryFaturaComercialNR_PROCESSO: TStringField;
    qryFaturaComercialEXPORT_EMPRESA: TStringField;
    qryFaturaComercialEXPORT_CNPJ: TStringField;
    qryFaturaComercialTX_DADOS_BANCARIOS_FATCOM: TStringField;
    qryFaturaComercialEXPORT_CIDADE_NUMERO: TStringField;
    qryFaturaComercialEXPORT_ESTADO_PAIS: TStringField;
    qryFaturaComercialEXPORT_TELEFONE: TStringField;
    qryFaturaComercialEXPORT_CEP: TStringField;
    qryFaturaComercialCIDADE_DATA_ESPANHOL: TStringField;
    qryFaturaComercialCIDADE_DATA_PORTUGUES: TStringField;
    qryFaturaComercialCIDADE_DATA_INGLES: TStringField;
    qryFaturaComercialNR_FATURA: TStringField;
    qryFaturaComercialIMPORT_EMPRESA: TStringField;
    qryFaturaComercialIMPORT_CIDADE_ESTADO: TStringField;
    qryFaturaComercialIMPORT_PAIS_ING: TStringField;
    qryFaturaComercialIMPORT_PAIS_ESP: TStringField;
    qryFaturaComercialIMPORT_PAIS_POR: TStringField;
    qryFaturaComercialCONSIG_EMPRESA: TStringField;
    qryFaturaComercialCONSIG_CIDADE_ESTADO: TStringField;
    qryFaturaComercialCONSIG_PAIS_ING: TStringField;
    qryFaturaComercialCONSIG_PAIS_ESP: TStringField;
    qryFaturaComercialCONSIG_PAIS_POR: TStringField;
    qryFaturaComercialNOTIFY_EMPRESA: TStringField;
    qryFaturaComercialNOTIFY_CIDADE_ESTADO: TStringField;
    qryFaturaComercialNOTIFY_PAIS_ING: TStringField;
    qryFaturaComercialNOTIFY_PAIS_ESP: TStringField;
    qryFaturaComercialNOTIFY_PAIS_POR: TStringField;
    qryFaturaComercialPAIS_ORIGEM: TStringField;
    qryFaturaComercialDS_PORTO_EMBARQUE: TStringField;
    qryFaturaComercialDS_PORTO_DESTINO_ESP: TStringField;
    qryFaturaComercialDS_PORTO_DESTINO_ING: TStringField;
    qryFaturaComercialDS_PORTO_DESTINO_POR: TStringField;
    qryFaturaComercialNM_VIA_TRANSPORTE_ING: TStringField;
    qryFaturaComercialNM_VIA_TRANSPORTE_ESP: TStringField;
    qryFaturaComercialNM_VIA_TRANSPORTE_POR: TStringField;
    qryFaturaComercialPATH_LOGO: TStringField;
    qryFaturaComercialNM_TERMO_PAGTO_ING: TStringField;
    qryFaturaComercialNM_TERMO_PAGTO_ESP: TStringField;
    qryFaturaComercialTX_INF_EMBALAGEM: TStringField;
    qryFaturaComercialINCOTERM: TStringField;
    qryFaturaComercialPAIS_DESTINO_ESP: TStringField;
    qryFaturaComercialPAIS_DESTINO_ING: TStringField;
    qryFaturaComercialPAIS_DESTINO_POR: TStringField;
    qryFaturaComercialCIDADE_ORIGEM: TStringField;
    qryFaturaComercialVL_PESO_BRUTO: TFloatField;
    qryFaturaComercialVL_PESO_LIQUIDO: TFloatField;
    qryFaturaComercialVL_TOT_CUBAGEM: TFloatField;
    qryFaturaComercialVL_TOT_EXW: TFloatField;
    qryFaturaComercialMOEDA_MLE: TStringField;
    qryFaturaComercialVL_SEGURO: TFloatField;
    qryFaturaComercialMOEDA_SEGURO: TStringField;
    qryFaturaComercialVL_FRETE_INT: TFloatField;
    qryFaturaComercialMOEDA_FRETE: TStringField;
    qryFaturaComercialDESC_FRETE: TStringField;
    qryFaturaComercialVL_TOT_DESPESA: TFloatField;
    qryFaturaComercialVL_ACRESCIMO: TFloatField;
    qryFaturaComercialVL_DESCONTO: TFloatField;
    qryFaturaComercialVL_TOTAL_MLE: TFloatField;
    qryFaturaComercialVL_TOTAL_MVC: TFloatField;
    cdsFaturaComercialNR_PROCESSO: TStringField;
    cdsFaturaComercialEXPORT_EMPRESA: TStringField;
    cdsFaturaComercialEXPORT_CNPJ: TStringField;
    cdsFaturaComercialTX_DADOS_BANCARIOS_FATCOM: TStringField;
    cdsFaturaComercialEXPORT_CIDADE_NUMERO: TStringField;
    cdsFaturaComercialEXPORT_ESTADO_PAIS: TStringField;
    cdsFaturaComercialEXPORT_TELEFONE: TStringField;
    cdsFaturaComercialEXPORT_CEP: TStringField;
    cdsFaturaComercialCIDADE_DATA_ESPANHOL: TStringField;
    cdsFaturaComercialCIDADE_DATA_PORTUGUES: TStringField;
    cdsFaturaComercialCIDADE_DATA_INGLES: TStringField;
    cdsFaturaComercialNR_FATURA: TStringField;
    cdsFaturaComercialIMPORT_EMPRESA: TStringField;
    cdsFaturaComercialIMPORT_CIDADE_ESTADO: TStringField;
    cdsFaturaComercialIMPORT_PAIS_ING: TStringField;
    cdsFaturaComercialIMPORT_PAIS_ESP: TStringField;
    cdsFaturaComercialIMPORT_PAIS_POR: TStringField;
    cdsFaturaComercialCONSIG_EMPRESA: TStringField;
    cdsFaturaComercialCONSIG_CIDADE_ESTADO: TStringField;
    cdsFaturaComercialCONSIG_PAIS_ING: TStringField;
    cdsFaturaComercialCONSIG_PAIS_ESP: TStringField;
    cdsFaturaComercialCONSIG_PAIS_POR: TStringField;
    cdsFaturaComercialNOTIFY_EMPRESA: TStringField;
    cdsFaturaComercialNOTIFY_CIDADE_ESTADO: TStringField;
    cdsFaturaComercialNOTIFY_PAIS_ING: TStringField;
    cdsFaturaComercialNOTIFY_PAIS_ESP: TStringField;
    cdsFaturaComercialNOTIFY_PAIS_POR: TStringField;
    cdsFaturaComercialPAIS_ORIGEM: TStringField;
    cdsFaturaComercialDS_PORTO_EMBARQUE: TStringField;
    cdsFaturaComercialDS_PORTO_DESTINO_ESP: TStringField;
    cdsFaturaComercialDS_PORTO_DESTINO_ING: TStringField;
    cdsFaturaComercialDS_PORTO_DESTINO_POR: TStringField;
    cdsFaturaComercialNM_VIA_TRANSPORTE_ING: TStringField;
    cdsFaturaComercialNM_VIA_TRANSPORTE_ESP: TStringField;
    cdsFaturaComercialNM_VIA_TRANSPORTE_POR: TStringField;
    cdsFaturaComercialPATH_LOGO: TStringField;
    cdsFaturaComercialNM_TERMO_PAGTO_ING: TStringField;
    cdsFaturaComercialNM_TERMO_PAGTO_ESP: TStringField;
    cdsFaturaComercialTX_INF_EMBALAGEM: TStringField;
    cdsFaturaComercialINCOTERM: TStringField;
    cdsFaturaComercialPAIS_DESTINO_ESP: TStringField;
    cdsFaturaComercialPAIS_DESTINO_ING: TStringField;
    cdsFaturaComercialPAIS_DESTINO_POR: TStringField;
    cdsFaturaComercialCIDADE_ORIGEM: TStringField;
    qryFaturaComercialItemMERCADORIA_ESP_1: TStringField;
    qryFaturaComercialItemUNIDADE_MEDIDA_POR: TStringField;
    cdsFaturaComercialItemMERCADORIA_ESP_1: TStringField;
    cdsFaturaComercialItemUNIDADE_MEDIDA_POR: TStringField;
    qryPackingListNR_PROCESSO: TStringField;
    qryPackingListEXPORT_EMPRESA: TStringField;
    qryPackingListEXPORT_CNPJ: TStringField;
    qryPackingListEXPORT_CIDADE_NUMERO: TStringField;
    qryPackingListEXPORT_ESTADO_PAIS: TStringField;
    qryPackingListEXPORT_TELEFONE: TStringField;
    qryPackingListEXPORT_CEP: TStringField;
    qryPackingListCIDADE_DATA_ESPANHOL: TStringField;
    qryPackingListCIDADE_DATA_PORTUGUES: TStringField;
    qryPackingListCIDADE_DATA_INGLES: TStringField;
    qryPackingListNR_FATURA: TStringField;
    qryPackingListIMPORT_EMPRESA: TStringField;
    qryPackingListIMPORT_CIDADE_ESTADO: TStringField;
    qryPackingListIMPORT_PAIS_ING: TStringField;
    qryPackingListIMPORT_PAIS_ESP: TStringField;
    qryPackingListIMPORT_PAIS_POR: TStringField;
    qryPackingListPAIS_ORIGEM: TStringField;
    qryPackingListDS_PORTO_EMBARQUE: TStringField;
    qryPackingListDS_PORTO_DESTINO_ESP: TStringField;
    qryPackingListDS_PORTO_DESTINO_ING: TStringField;
    qryPackingListDS_PORTO_DESTINO_POR: TStringField;
    qryPackingListNM_VIA_TRANSPORTE_ING: TStringField;
    qryPackingListNM_VIA_TRANSPORTE_ESP: TStringField;
    qryPackingListNM_VIA_TRANSPORTE_POR: TStringField;
    qryPackingListPATH_LOGO: TStringField;
    qryPackingListTX_INF_EMBALAGEM: TStringField;
    qryPackingListPAIS_DESTINO_ESP: TStringField;
    qryPackingListPAIS_DESTINO_ING: TStringField;
    qryPackingListPAIS_DESTINO_POR: TStringField;
    qryPackingListCIDADE_ORIGEM: TStringField;
    qryPackingListVL_PESO_BRUTO: TFloatField;
    qryPackingListVL_PESO_LIQUIDO: TFloatField;
    qryPackingListVL_TOT_CUBAGEM: TFloatField;
    qryPackingListQT_TOTAL_MERCADORIA: TFloatField;
    cdsPackingListNR_PROCESSO: TStringField;
    cdsPackingListEXPORT_EMPRESA: TStringField;
    cdsPackingListEXPORT_CNPJ: TStringField;
    cdsPackingListEXPORT_CIDADE_NUMERO: TStringField;
    cdsPackingListEXPORT_ESTADO_PAIS: TStringField;
    cdsPackingListEXPORT_TELEFONE: TStringField;
    cdsPackingListEXPORT_CEP: TStringField;
    cdsPackingListCIDADE_DATA_ESPANHOL: TStringField;
    cdsPackingListCIDADE_DATA_PORTUGUES: TStringField;
    cdsPackingListCIDADE_DATA_INGLES: TStringField;
    cdsPackingListNR_FATURA: TStringField;
    cdsPackingListIMPORT_EMPRESA: TStringField;
    cdsPackingListIMPORT_CIDADE_ESTADO: TStringField;
    cdsPackingListIMPORT_PAIS_ING: TStringField;
    cdsPackingListIMPORT_PAIS_ESP: TStringField;
    cdsPackingListIMPORT_PAIS_POR: TStringField;
    cdsPackingListPAIS_ORIGEM: TStringField;
    cdsPackingListDS_PORTO_EMBARQUE: TStringField;
    cdsPackingListDS_PORTO_DESTINO_ESP: TStringField;
    cdsPackingListDS_PORTO_DESTINO_ING: TStringField;
    cdsPackingListDS_PORTO_DESTINO_POR: TStringField;
    cdsPackingListNM_VIA_TRANSPORTE_ING: TStringField;
    cdsPackingListNM_VIA_TRANSPORTE_ESP: TStringField;
    cdsPackingListNM_VIA_TRANSPORTE_POR: TStringField;
    cdsPackingListPATH_LOGO: TStringField;
    cdsPackingListTX_INF_EMBALAGEM: TStringField;
    cdsPackingListPAIS_DESTINO_ESP: TStringField;
    cdsPackingListPAIS_DESTINO_ING: TStringField;
    cdsPackingListPAIS_DESTINO_POR: TStringField;
    cdsPackingListCIDADE_ORIGEM: TStringField;
    cdsPackingListVL_PESO_BRUTO: TFloatField;
    cdsPackingListVL_PESO_LIQUIDO: TFloatField;
    cdsPackingListVL_TOT_CUBAGEM: TFloatField;
    cdsPackingListQT_TOTAL_MERCADORIA: TFloatField;
    qryPackingListItemNR_PROCESSO: TStringField;
    qryPackingListItemCD_MERCADORIA: TStringField;
    qryPackingListItemMERCADORIA_ING: TStringField;
    qryPackingListItemMERCADORIA_ESP: TStringField;
    qryPackingListItemMERCADORIA_POR: TStringField;
    qryPackingListItemCD_UNID_MEDIDA: TStringField;
    qryPackingListItemUNIDADE_MEDIDA_ING: TStringField;
    qryPackingListItemUNIDADE_MEDIDA_ESP: TStringField;
    qryPackingListItemUNIDADE_MEDIDA_POR: TStringField;
    qryPackingListItemQT_MERCADORIA: TFloatField;
    qryPackingListItemVL_TOT_PESO_BRUTO: TFloatField;
    qryPackingListItemVL_TOT_PESO_LIQ: TFloatField;
    qryPackingListItemVL_UNITARIO: TFloatField;
    qryPackingListItemVL_TOT_ITEM: TFloatField;
    qryPackingListItemNR_PEDIDO: TStringField;
    cdsPackingListItemNR_PROCESSO: TStringField;
    cdsPackingListItemCD_MERCADORIA: TStringField;
    cdsPackingListItemMERCADORIA_ING: TStringField;
    cdsPackingListItemMERCADORIA_ESP: TStringField;
    cdsPackingListItemMERCADORIA_POR: TStringField;
    cdsPackingListItemCD_UNID_MEDIDA: TStringField;
    cdsPackingListItemUNIDADE_MEDIDA_ING: TStringField;
    cdsPackingListItemUNIDADE_MEDIDA_ESP: TStringField;
    cdsPackingListItemUNIDADE_MEDIDA_POR: TStringField;
    cdsPackingListItemQT_MERCADORIA: TFloatField;
    cdsPackingListItemVL_TOT_PESO_BRUTO: TFloatField;
    cdsPackingListItemVL_TOT_PESO_LIQ: TFloatField;
    cdsPackingListItemVL_UNITARIO: TFloatField;
    cdsPackingListItemVL_TOT_ITEM: TFloatField;
    cdsPackingListItemNR_PEDIDO: TStringField;
    qryFaturaComercialNOTIFY_NR_CUIT: TStringField;
    qryFaturaComercialCONSIG_NR_CUIT: TStringField;
    cdsFaturaComercialCONSIG_NR_CUIT: TStringField;
    cdsFaturaComercialNOTIFY_NR_CUIT: TStringField;
    qryFaturaComercialIMPORT_NR_CUIT: TStringField;
    cdsFaturaComercialIMPORT_NR_CUIT: TStringField;
    qryFaturaComercialNR_ORDEM: TStringField;
    cdsFaturaComercialNR_ORDEM: TStringField;
    qryPackingListNR_ORDEM: TStringField;
    cdsPackingListNR_ORDEM: TStringField;
    qryGrupo: TSQLQuery;
    qryGrupoCD_GRUPO: TStringField;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    cdsGrupoCD_GRUPO: TStringField;
    qryFaturaComercialNM_AGENTE: TStringField;
    qryPackingListItemEMBALAGEM: TStringField;
    cdsPackingListItemEMBALAGEM: TStringField;
    qryPackingListMODAL: TStringField;
    cdsPackingListMODAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  function GetSQLFaturaComercial(nr_processo : string; idioma: integer; Cliente: TCliente) : string;
  function GetSQLFaturaComercialItens(nr_processo, nr_fatura : string) : string;
  function GetSQLPackingList(nr_processo : string) : string;
  function GetSQLPackingListItens(nr_processo, nr_fatura : string) : string;
  end;

    const
  ID_INGLES = 0;
  ID_ESPANHOL = 1;
  ID_PORTUGUES = 2;


var
  datm_DocumentosExportacao: Tdatm_DocumentosExportacao;

implementation

{$R *.dfm}


function Tdatm_DocumentosExportacao.GetSQLFaturaComercial(nr_processo : string; idioma: integer; Cliente: TCliente) : string;
var
  txEmbalagem: string;
  txContrato: string;
begin
  if Cliente = tcPetronas then
  begin
    if idioma = ID_INGLES then
      txContrato := QuotedStr('If there is no contract signed between the parties, the attached PETRONAS General Terms and Conditions shall be apply.')
    else if idioma = ID_ESPANHOL then
      txContrato := QuotedStr('Si no existe acuerdo firmado entre las partes, se aplicarán los Términos y Condiciones Generales de PETRONAS adjuntos.')
    else
      txContrato := '''';

    txEmbalagem :=
    '  ,CASE WHEN (ISNULL(PE.VL_DESCONTO,0) > 0)                           ' + sLineBreak +
    ' 	THEN ISNULL(PEI.TX_INF_EMBALAGEM , '''') + CHAR(13) +              ' + sLineBreak +
    '       ''DESCUENTO POR ACCIÓN COMERCIAL'' + CHAR(13)+ ' + txContrato    + sLineBreak +
    '	  ELSE ISNULL(PEI.TX_INF_EMBALAGEM , '''') + CHAR(13)+ ' + txContrato  + sLineBreak +
    '   END                                           AS TX_INF_EMBALAGEM  ' + sLineBreak;
  end
  else
  begin
    txEmbalagem :=
    '  ,ISNULL(PEI.TX_INF_EMBALAGEM , '''') AS TX_INF_EMBALAGEM  ' + sLineBreak;
  end;

  result :=
  '  SELECT                                                                                                                    ' + sLineBreak +
  '  PE.NR_PROCESSO                                                                            AS NR_PROCESSO                  ' + sLineBreak +
  '  ,(SELECT TOP 1 CD_REFERENCIA                                                                                              ' + sLineBreak +
  '    FROM TREF_CLIENTE                                                                                                       ' + sLineBreak +
  '    WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REFERENCIA = ''02'')                           AS NR_ORDEM                     ' + sLineBreak +
  '  ,CASE WHEN CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,'''')) > 0                                                       ' + sLineBreak +
  '  	    THEN SUBSTRING(ISNULL(EXPORTADOR.NM_EMPRESA,''''),                                                                   ' + sLineBreak +
  '  		       1,(CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,''''))-1))                                                     ' + sLineBreak +
  '  	 ELSE ISNULL(EXPORTADOR.NM_EMPRESA,'''')                                                                                 ' + sLineBreak +
  '   END                                                                                      AS EXPORT_EMPRESA               ' + sLineBreak +
  '  ,SUBSTRING(EXPORTADOR.CGC_EMPRESA,1,2)+''.''+                                                                             ' + sLineBreak +
  '   SUBSTRING(EXPORTADOR.CGC_EMPRESA,3,3)+''.''+                                                                             ' + sLineBreak +
  '   SUBSTRING(EXPORTADOR.CGC_EMPRESA,6,3)+''/''+                                                                             ' + sLineBreak +
  '   SUBSTRING(EXPORTADOR.CGC_EMPRESA,9,4)+''-''+                                                                             ' + sLineBreak +
  '   SUBSTRING(EXPORTADOR.CGC_EMPRESA,13,2)                                                   AS EXPORT_CNPJ                  ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,EXPORTADOR.TX_DADOS_BANCARIOS_FATCOM                                                     AS TX_DADOS_BANCARIOS_FATCOM    ' + sLineBreak +
  '  ,CONVERT(VARCHAR(500),                                                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_EMPRESA,'''')))+'' ''+                                                                 ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_NUMERO,''''))))                                        AS EXPORT_CIDADE_NUMERO         ' + sLineBreak +
  '  ,CONVERT(VARCHAR(500),                                                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_CIDADE,'''')))+'' - ''+                                                                ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_UF,'''')))) +'' - BRASIL''                             AS EXPORT_ESTADO_PAIS           ' + sLineBreak +
  '  ,EXPORTADOR.NR_TELEFONE                                                                   AS EXPORT_TELEFONE              ' + sLineBreak +
  '  ,STUFF(LTRIM(RTRIM(ISNULL(EXPORTADOR.END_CEP,''''))),5,0, ''-'')                          AS EXPORT_CEP                   ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                            ' + sLineBreak +
  '   DBO.FDATAESPANHOL(PE.DT_FATURA)                                                          AS CIDADE_DATA_ESPANHOL         ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                            ' + sLineBreak +
  '   DBO.FDATAPORTUGUES(PE.DT_FATURA)                                                         AS CIDADE_DATA_PORTUGUES        ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                            ' + sLineBreak +
  '   CONVERT(VARCHAR(30),PE.DT_FATURA,107)                                                    AS CIDADE_DATA_INGLES           ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END    AS NR_FATURA                    ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,IMPORTADOR.NM_EMPRESA                                                                    AS IMPORT_EMPRESA               ' + sLineBreak +
  '  ,CONVERT(VARCHAR(500),                                                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_EMPRESA,'''')))+'' ''+                                                                 ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_NUMERO,'''')))+'' '' +                                                                 ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_CIDADE,'''')))+'' - ''+                                                                ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_ESTADO,''''))))                                        AS IMPORT_CIDADE_ESTADO         ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,COALESCE(CASE ISNULL(IMPORTADOR.NR_RUC, '''')  WHEN '''' THEN NULL ELSE ''RUC: ''  + IMPORTADOR.NR_RUC  END              ' + sLineBreak +
  '           ,CASE ISNULL(IMPORTADOR.NR_NIT, '''')  WHEN '''' THEN NULL ELSE ''NIT: ''  + IMPORTADOR.NR_NIT  END              ' + sLineBreak +
  '           ,CASE ISNULL(IMPORTADOR.NR_CUIT, '''') WHEN '''' THEN NULL ELSE ''CUIT: '' + IMPORTADOR.NR_CUIT END)             ' + sLineBreak +
  '                                                                                            AS IMPORT_NR_CUIT               ' + sLineBreak +
  '  ,ISNULL(IMPORTADORPAIS.NM_PAIS_ING,IMPORTADORPAIS.NM_PAIS)                                AS IMPORT_PAIS_ING              ' + sLineBreak +
  '  ,ISNULL(IMPORTADORPAIS.NM_PAIS_ESP,IMPORTADORPAIS.NM_PAIS)                                AS IMPORT_PAIS_ESP              ' + sLineBreak +
  '  ,IMPORTADORPAIS.NM_PAIS                                                                   AS IMPORT_PAIS_POR              ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,CONSIG.NM_EMPRESA                                                                        AS CONSIG_EMPRESA               ' + sLineBreak +
  '  ,CONVERT(VARCHAR(500),                                                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(CONSIG.END_EMPRESA,'''')))+'' ''+                                                                     ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(CONSIG.END_NUMERO,'''')))+'' '' +                                                                     ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(CONSIG.END_CIDADE,'''')))+'' - ''+                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(CONSIG.END_ESTADO,''''))))                                            AS CONSIG_CIDADE_ESTADO         ' + sLineBreak +
  '  ,COALESCE(CASE ISNULL(CONSIG.NR_RUC, '''')  WHEN '''' THEN NULL ELSE ''RUC: ''  + CONSIG.NR_RUC  END                      ' + sLineBreak +
  '           ,CASE ISNULL(CONSIG.NR_NIT, '''')  WHEN '''' THEN NULL ELSE ''NIT: ''  + CONSIG.NR_NIT  END                      ' + sLineBreak +
  '           ,CASE ISNULL(CONSIG.NR_CUIT, '''') WHEN '''' THEN NULL ELSE ''CUIT: '' + CONSIG.NR_CUIT END)  AS CONSIG_NR_CUIT  ' + sLineBreak +
  '  ,ISNULL(CONSIGPAIS.NM_PAIS_ING,CONSIGPAIS.NM_PAIS)                                        AS CONSIG_PAIS_ING              ' + sLineBreak +
  '  ,ISNULL(CONSIGPAIS.NM_PAIS_ESP,CONSIGPAIS.NM_PAIS)                                        AS CONSIG_PAIS_ESP              ' + sLineBreak +
  '  ,CONSIGPAIS.NM_PAIS                                                                       AS CONSIG_PAIS_POR              ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,NOTIFY.NM_EMPRESA                                                                        AS NOTIFY_EMPRESA               ' + sLineBreak +
  '  ,CONVERT(VARCHAR(500),                                                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(NOTIFY.END_EMPRESA,'''')))+'' ''+                                                                     ' + sLineBreak + 
  '   LTRIM(RTRIM(ISNULL(NOTIFY.END_NUMERO,'''')))+'' '' +                                                                     ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(NOTIFY.END_CIDADE,'''')))+'' - ''+                                                                    ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(NOTIFY.END_ESTADO,''''))))                                            AS NOTIFY_CIDADE_ESTADO         ' + sLineBreak + 
  '  ,ISNULL(NOTIFYPAIS.NM_PAIS_ING,NOTIFYPAIS.NM_PAIS)                                        AS NOTIFY_PAIS_ING              ' + sLineBreak +
  '  ,ISNULL(NOTIFYPAIS.NM_PAIS_ESP,NOTIFYPAIS.NM_PAIS)                                        AS NOTIFY_PAIS_ESP              ' + sLineBreak + 
  '  ,NOTIFYPAIS.NM_PAIS                                                                       AS NOTIFY_PAIS_POR              ' + sLineBreak +
  '  ,COALESCE(CASE ISNULL(NOTIFY.NR_RUC, '''')  WHEN '''' THEN NULL ELSE ''RUC: ''  + NOTIFY.NR_RUC  END                      ' + sLineBreak +
  '           ,CASE ISNULL(NOTIFY.NR_NIT, '''')  WHEN '''' THEN NULL ELSE ''NIT: ''  + NOTIFY.NR_NIT  END                      ' + sLineBreak +
  '           ,CASE ISNULL(NOTIFY.NR_CUIT, '''') WHEN '''' THEN NULL ELSE ''CUIT: '' + NOTIFY.NR_CUIT END)  AS NOTIFY_NR_CUIT  ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,''Brasil''                                                                               AS PAIS_ORIGEM                  ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,LTRIM(RTRIM(ISNULL(LOCEMBARQUE.DESCRICAO,'''')))+''-''+                                                                  ' + sLineBreak +
  '   LTRIM(RTRIM(ISNULL(LOCEMBARQUE.CD_UF,''''))) + '' - '' +                                                                 ' + sLineBreak +
  '   ''Brasil''                                                                               AS DS_PORTO_EMBARQUE            ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                     ' + sLineBreak +
  '   ISNULL(PAISDESTINO.NM_PAIS_ESP,PAISDESTINO.NM_PAIS ) AS VARCHAR(200))))                  AS DS_PORTO_DESTINO_ESP         ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                     ' + sLineBreak + 
  '   ISNULL(PAISDESTINO.NM_PAIS_ING,PAISDESTINO.NM_PAIS ) AS VARCHAR(200))))                  AS DS_PORTO_DESTINO_ING         ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                     ' + sLineBreak + 
  '   PAISDESTINO.NM_PAIS  AS VARCHAR(200))))                                                  AS DS_PORTO_DESTINO_POR         ' + sLineBreak +
  '  ,CASE ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                      ' + sLineBreak +
  '   WHEN 7 THEN ''ROAD''                                                                                                     ' + sLineBreak +
  '   WHEN 1 THEN ''SEA''                                                                                                      ' + sLineBreak +
  '   WHEN 4 THEN ''AIR''                                                                                                      ' + sLineBreak +
  '   ELSE VIATRANSP.NM_VIA_TRANSPORTE                                                                                         ' + sLineBreak +
  '   END                                                                                      AS NM_VIA_TRANSPORTE_ING        ' + sLineBreak +
  '  ,VIATRANSP.NM_VIA_TRANSPORTE                                                              AS NM_VIA_TRANSPORTE_ESP        ' + sLineBreak +
  '  ,VIATRANSP.NM_VIA_TRANSPORTE                                                              AS NM_VIA_TRANSPORTE_POR        ' + sLineBreak +
  '  ,EXPORTADOR.PATH_LOGO        									                                           AS PATH_LOGO                    ' + sLineBreak +
  '  ,CAST(TP.TX_TERMO_INGLES AS VARCHAR(300))                                                 AS NM_TERMO_PAGTO_ING           ' + sLineBreak +
  '  ,CAST(TP.TX_TERMO_ESP AS VARCHAR(300))                                                    AS NM_TERMO_PAGTO_ESP           ' + sLineBreak +

  txEmbalagem  + sLineBreak +

  '  ,P.CD_INCOTERM                                                                            AS INCOTERM                     ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(PAISDESTINO.NM_PAIS_ESP , PAISDESTINO.NM_PAIS) AS VARCHAR(50)))) AS PAIS_DESTINO_ESP             ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(PAISDESTINO.NM_PAIS_ING , PAISDESTINO.NM_PAIS) AS VARCHAR(50)))) AS PAIS_DESTINO_ING             ' + sLineBreak +
  '  ,LTRIM(RTRIM(PAISDESTINO.NM_PAIS))                                                        AS PAIS_DESTINO_POR             ' + sLineBreak +
  '  ,ISNULL(EXPORTADOR.END_CIDADE,'''')                                                       AS CIDADE_ORIGEM                ' + sLineBreak +
  '  ,ISNULL(PE.VL_PESO_BRUTO,0)                                                               AS VL_PESO_BRUTO                ' + sLineBreak +
  '  ,ISNULL(PE.VL_PESO_LIQUIDO,0)                                                             AS VL_PESO_LIQUIDO              ' + sLineBreak +
  '  ,ISNULL(PE.VL_TOT_CUBAGEM,0)                                                              AS VL_TOT_CUBAGEM               ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(PE.VL_TOT_EXW,0)                                                                  AS VL_TOT_EXW                   ' + sLineBreak +
  '  ,MOEDAMLE.AP_MOEDA                                                                        AS MOEDA_MLE                    ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(PE.VL_SEGURO,0)                                                                   AS VL_SEGURO                    ' + sLineBreak +
  '  ,MOEDASEGURO.AP_MOEDA                                                                     AS MOEDA_SEGURO                 ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(PE.VL_FRETE_INT, 0)                                                               AS VL_FRETE_INT                 ' + sLineBreak +
  '  ,MOEDAFRETE.AP_MOEDA                                                                      AS MOEDA_FRETE                  ' + sLineBreak +
  '  ,FRETE.DESCRICAO                                                                          AS DESC_FRETE                   ' + sLineBreak +
  '                                                                                                                            ' + sLineBreak +
  '  ,ISNULL(PE.VL_TOT_DESPESA,0)                                                              AS VL_TOT_DESPESA               ' + sLineBreak +
  '  ,ISNULL(PE.VL_ACRESCIMO,0)                                                                AS VL_ACRESCIMO                 ' + sLineBreak +
  '  ,ISNULL(PE.VL_DESCONTO,0)                                                                 AS VL_DESCONTO                  ' + sLineBreak +
  '  ,ISNULL(VL_TOT_EXW,0)+ISNULL(PE.VL_FRETE_INT,0)-ISNULL(PE.VL_DESCONTO,0)                  AS VL_TOTAL_MLE                 ' + sLineBreak +
  '  ,ISNULL(VL_TOT_FOB,0)+ISNULL(PE.VL_FRETE_INT,0)-ISNULL(PE.VL_SEGURO,0)                    AS VL_TOTAL_MVC                 ' + sLineBreak +
  '  ,NM_AGENTE                                                                                AS NM_AGENTE                    ' + sLineBreak +
  '  FROM TPROCESSO_EXP        PE              (NOLOCK)                                                                        ' + sLineBreak +
  '  	   JOIN TPROCESSO        P               (NOLOCK) ON P.NR_PROCESSO          = PE.NR_PROCESSO                             ' + sLineBreak +
  '      JOIN TEMPRESA_NAC     EXPORTADOR      (NOLOCK) ON EXPORTADOR.CD_EMPRESA  = P.CD_CLIENTE                               ' + sLineBreak +
  '       OUTER APPLY(SELECT DISTINCT ISNULL(I.NR_PEDIDO, '''') AS NR_PEDIDO,                                                  ' + sLineBreak +
  '                                   LTRIM(RTRIM(CAST(EP.TX_INF_EMBALAGEM AS VARCHAR(1000)))) AS TX_INF_EMBALAGEM              ' + sLineBreak +
  '                     FROM TPROCESSO_EXP_ITEM I (NOLOCK)                                                                     ' + sLineBreak +
  '                     LEFT                                                                                                   ' + sLineBreak +
  '                     JOIN TPROCESSO_EXP_PEDIDO EP (NOLOCK) ON EP.NR_PROCESSO = I.NR_PROCESSO                                ' + sLineBreak +
  '                                                          AND EP.NR_PEDIDO   = I.NR_PEDIDO                                  ' + sLineBreak +
  '                    WHERE I.NR_PROCESSO = PE.NR_PROCESSO ) PEI                                                              ' + sLineBreak +
  '  LEFT JOIN TTP_FRETE        FRETE           (NOLOCK) ON FRETE.CODIGO           = P.TP_FRETE                                ' + sLineBreak +
  '  LEFT JOIN TTERMO_PAGTO     TP              (NOLOCK) ON TP.CD_TERMO_PAGTO      = PE.CD_TERMO_PAGTO                         ' + sLineBreak +
  '  LEFT JOIN TEMPRESA_EST     IMPORTADOR      (NOLOCK) ON IMPORTADOR.CD_EMPRESA  = PE.CD_IMPORTADOR                          ' + sLineBreak +
  '  LEFT JOIN TPAIS_BROKER     IMPORTADORPAIS  (NOLOCK) ON IMPORTADORPAIS.CD_PAIS = IMPORTADOR.CD_PAIS                        ' + sLineBreak +
  '  LEFT JOIN TEMPRESA_EST     CONSIG          (NOLOCK) ON CONSIG.CD_EMPRESA      = PE.CD_CONSIGNATARIO                       ' + sLineBreak +
  '  LEFT JOIN TPAIS_BROKER     CONSIGPAIS      (NOLOCK) ON CONSIGPAIS.CD_PAIS     = CONSIG.CD_PAIS                            ' + sLineBreak +
  '  LEFT JOIN TEMPRESA_EST     NOTIFY          (NOLOCK) ON NOTIFY.CD_EMPRESA      = PE.CD_NOTIFY1                             ' + sLineBreak +
  '  LEFT JOIN TPAIS_BROKER     NOTIFYPAIS      (NOLOCK) ON NOTIFYPAIS.CD_PAIS     = NOTIFY.CD_PAIS                            ' + sLineBreak +
  '  LEFT JOIN TLOCAL_EMBARQUE  LOCEMBARQUE     (NOLOCK) ON LOCEMBARQUE.CODIGO     = P.CD_LOCAL_EMBARQUE                       ' + sLineBreak +
  '  LEFT JOIN TLOCAL_EMBARQUE  LOCDESEMBARQUE  (NOLOCK) ON LOCDESEMBARQUE.CODIGO  = CASE WHEN                                 ' + sLineBreak +
  '                                                                        ISNULL(P.CD_LOCAL_ENTREGA, '''') <> ''''            ' + sLineBreak +
  '                                                                                       THEN P.CD_LOCAL_ENTREGA              ' + sLineBreak +
  '                                                                                       ELSE P.CD_LOCAL_DESEMBARQUE          ' + sLineBreak +
  '                                                                                  END                                       ' + sLineBreak +
  '  LEFT JOIN TPAIS_BROKER     PAISDESTINO     (NOLOCK) ON PAISDESTINO.CD_PAIS         = P.CD_PAIS_DESTINO                    ' + sLineBreak +
  '  LEFT JOIN TVIA_TRANSPORTE  VIATRANSP       (NOLOCK) ON VIATRANSP.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                 ' + sLineBreak +
  '  LEFT JOIN TMOEDA_BROKER    MOEDAMLE        (NOLOCK) ON MOEDAMLE.CD_MOEDA           = PE.CD_MOEDA                          ' + sLineBreak +
  '  LEFT JOIN TMOEDA_BROKER    MOEDAFRETE      (NOLOCK) ON MOEDAFRETE.CD_MOEDA         = P.CD_MOEDA_FRETE                     ' + sLineBreak +
  '  LEFT JOIN TMOEDA_BROKER    MOEDASEGURO     (NOLOCK) ON MOEDASEGURO.CD_MOEDA        = P.CD_MOEDA_SEGURO                    ' + sLineBreak +
  '  LEFT JOIN TAGENTE          AGENTE          (NOLOCK) ON AGENTE.CD_AGENTE            = PE.CD_AGENTE                         ' + sLineBreak +

 '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO);
end;

function Tdatm_DocumentosExportacao.GetSQLFaturaComercialItens(nr_processo ,nr_fatura : string) : string;
begin
  result :=
  '   SELECT                                                                                                         ' + sLineBreak +
  '     PE.NR_PROCESSO                                                          AS NR_PROCESSO                       ' + sLineBreak +
  '    ,LTRIM(RTRIM(PEI.CD_MERCADORIA))                                         AS CD_MERCADORIA                     ' + sLineBreak +
  '    ,CAST(ISNULL(MERC.TX_DESC_INGLES, MERC.AP_MERCADORIA) AS VARCHAR(200))   AS MERCADORIA_ING                    ' + sLineBreak +
  '    ,CAST(ISNULL(MERC.TX_DESC_ESP, MERC.AP_MERCADORIA) AS VARCHAR(200))      AS MERCADORIA_ESP                    ' + sLineBreak +
  '    ,CAST(MERC.AP_MERCADORIA AS VARCHAR(200))                                AS MERCADORIA_POR                    ' + sLineBreak +
  '    ,isnull(UM.CD_UNID_MEDIDA, '''')                                         AS CD_UNID_MEDIDA                    ' + sLineBreak +
  '    ,LTRIM(RTRIM(CAST(ISNULL(UM.NM_UNID_MEDIDA_ING, UM.NM_UNID_MEDIDA) AS VARCHAR(100))))  AS UNIDADE_MEDIDA_ING  ' + sLineBreak +
  '    ,LTRIM(RTRIM(CAST(ISNULL(UM.NM_UNID_MEDIDA_ESP, UM.NM_UNID_MEDIDA) AS VARCHAR(100))))  AS UNIDADE_MEDIDA_ESP  ' + sLineBreak +
  '    ,LTRIM(RTRIM(UM.NM_UNID_MEDIDA))                                         AS UNIDADE_MEDIDA_POR                ' + sLineBreak +
  '    ,PEI.QT_MERCADORIA                                                       AS QT_MERCADORIA                     ' + sLineBreak +
  '    ,LTRIM(RTRIM(PEI.CD_NCM))                                                AS CD_NCM                            ' + sLineBreak +
  '    ,LTRIM(RTRIM(PEI.CD_NALADI_SH))                                          AS CD_NALADI_SH                      ' + sLineBreak +
  '    ,PEI.VL_UNITARIO                                                         AS VL_UNITARIO                       ' + sLineBreak +
  '    ,PEI.VL_TOT_ITEM                                                         AS VL_TOT_ITEM                       ' + sLineBreak +
  '    ,CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END  AS NR_PEDIDO          ' + sLineBreak +
  '   FROM TPROCESSO_EXP           PE   (NOLOCK)                                                                     ' + sLineBreak +
  '   JOIN TPROCESSO               P    (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                            ' + sLineBreak +
  '   JOIN TPROCESSO_EXP_ITEM      PEI  (NOLOCK) ON PEI.NR_PROCESSO      = PE.NR_PROCESSO                            ' + sLineBreak +
  '   JOIN TMERCADORIA_EXP         MERC (NOLOCK) ON MERC.CD_MERCADORIA   = PEI.CD_MERCADORIA                         ' + sLineBreak +
  '                                             AND MERC.CD_GRUPO        = P.CD_GRUPO                                ' + sLineBreak +
  '   LEFT                                                                                                           ' + sLineBreak +
  '   JOIN TUNID_MEDIDA_BROKER     UM   (NOLOCK) ON UM.CD_UNID_MEDIDA    = PEI.CD_UNID_MEDIDA                        ' + sLineBreak +
  '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO) +  sLineBreak +
  '    AND CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END  =' + QuotedStr(nr_fatura)   +  sLineBreak +
  '  ORDER BY NR_ITEM                                                                                  ' + sLineBreak ;
end;

function Tdatm_DocumentosExportacao.GetSQLPackingList(nr_processo : string) : string;
begin
  result :=
	'   SELECT                                                                                                                     ' + sLineBreak +
	'   PE.NR_PROCESSO                                                                AS NR_PROCESSO                               ' + sLineBreak +
  '  ,(SELECT TOP 1 CD_REFERENCIA                                                                                                ' + sLineBreak +
  '    FROM TREF_CLIENTE                                                                                                         ' + sLineBreak +
  '    WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REFERENCIA = ''02'')                AS NR_ORDEM                                  ' + sLineBreak +
	'   ,CASE WHEN CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,'''')) > 0                                                        ' + sLineBreak +
	'   		THEN SUBSTRING(ISNULL(EXPORTADOR.NM_EMPRESA,''''),                                                                     ' + sLineBreak +
	'   			1,(CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,''''))-1))                                                          ' + sLineBreak +
	'   	ELSE ISNULL(EXPORTADOR.NM_EMPRESA,'''')                                                                                  ' + sLineBreak +
	'   END                                                                           AS EXPORT_EMPRESA                            ' + sLineBreak +
	'   ,SUBSTRING(EXPORTADOR.CGC_EMPRESA,1,2)+''.''+                                                                              ' + sLineBreak +
	'   SUBSTRING(EXPORTADOR.CGC_EMPRESA,3,3)+''.''+                                                                               ' + sLineBreak +
	'   SUBSTRING(EXPORTADOR.CGC_EMPRESA,6,3)+''/''+                                                                               ' + sLineBreak +
	'   SUBSTRING(EXPORTADOR.CGC_EMPRESA,9,4)+''-''+                                                                               ' + sLineBreak +
	'   SUBSTRING(EXPORTADOR.CGC_EMPRESA,13,2)                                        AS EXPORT_CNPJ                               ' + sLineBreak +
	'   ,CONVERT(VARCHAR(500),                                                                                                     ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_EMPRESA,'''')))+'' ''+                                                                   ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_NUMERO,''''))))                             AS EXPORT_CIDADE_NUMERO                      ' + sLineBreak +
	'   ,CONVERT(VARCHAR(500),                                                                                                     ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_CIDADE,'''')))+'' - ''+                                                                  ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(EXPORTADOR.END_UF,'''')))) +'' - BRASIL''                  AS EXPORT_ESTADO_PAIS                        ' + sLineBreak +
	'   ,EXPORTADOR.NR_TELEFONE                                                       AS EXPORT_TELEFONE                           ' + sLineBreak +
	'   ,STUFF(LTRIM(RTRIM(ISNULL(EXPORTADOR.END_CEP,''''))),5,0, ''-'')              AS EXPORT_CEP                                ' + sLineBreak +
	'   ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                             ' + sLineBreak +
	'   DBO.FDATAESPANHOL(PE.DT_FATURA)                                               AS CIDADE_DATA_ESPANHOL                      ' + sLineBreak +
	'   ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                             ' + sLineBreak +
	'   DBO.FDATAPORTUGUES(PE.DT_FATURA)                                              AS CIDADE_DATA_PORTUGUES                     ' + sLineBreak +
	'   ,ISNULL(EXPORTADOR.END_CIDADE,'''')  + '' '' +                                                                             ' + sLineBreak +
	'   CONVERT(VARCHAR(30),PE.DT_FATURA,107)                                         AS CIDADE_DATA_INGLES                        ' + sLineBreak +
	'   ,DBO.FDATAPORTUGUES(PE.DT_FATURA)                                             AS DT_FATURA_PT                              ' + sLineBreak +
	'   ,CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END  AS NR_FATURA                       ' + sLineBreak +
	'   ,IMPORTADOR.NM_EMPRESA                                                        AS IMPORT_EMPRESA                            ' + sLineBreak +
	'   ,CONVERT(VARCHAR(500),                                                                                                     ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_EMPRESA,'''')))+'' ''+                                                                   ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_NUMERO,'''')))+'' '' +                                                                   ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_CIDADE,'''')))+'' - ''+                                                                  ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(IMPORTADOR.END_ESTADO,''''))))                             AS IMPORT_CIDADE_ESTADO                      ' + sLineBreak +
	'   ,ISNULL(IMPORTADORPAIS.NM_PAIS_ING,IMPORTADORPAIS.NM_PAIS)                    AS IMPORT_PAIS_ING                           ' + sLineBreak +
	'   ,ISNULL(IMPORTADORPAIS.NM_PAIS_ESP,IMPORTADORPAIS.NM_PAIS)                    AS IMPORT_PAIS_ESP                           ' + sLineBreak +
	'   ,IMPORTADORPAIS.NM_PAIS                                                       AS IMPORT_PAIS_POR                           ' + sLineBreak +
	'   ,''Brasil''                                                                   AS PAIS_ORIGEM                               ' + sLineBreak +
	'   ,LTRIM(RTRIM(ISNULL(LOCEMBARQUE.DESCRICAO,'''')))+''-''+                                                                   ' + sLineBreak +
	'   LTRIM(RTRIM(ISNULL(LOCEMBARQUE.CD_UF,''''))) + '' - '' +                                                                   ' + sLineBreak +
	'   ''Brasil''                                                                    AS DS_PORTO_EMBARQUE                         ' + sLineBreak +
	'   ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                      ' + sLineBreak +
	'   ISNULL(PAISDESTINO.NM_PAIS_ESP,PAISDESTINO.NM_PAIS ) AS VARCHAR(200))))       AS DS_PORTO_DESTINO_ESP                      ' + sLineBreak +
	'   ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                      ' + sLineBreak +
	'   ISNULL(PAISDESTINO.NM_PAIS_ING,PAISDESTINO.NM_PAIS ) AS VARCHAR(200))))       AS DS_PORTO_DESTINO_ING                      ' + sLineBreak +
	'   ,LTRIM(RTRIM(CAST(ISNULL(LOCDESEMBARQUE.DESCRICAO, '''')  + '' - '' +                                                      ' + sLineBreak +
	'   PAISDESTINO.NM_PAIS  AS VARCHAR(200))))                                       AS DS_PORTO_DESTINO_POR                      ' + sLineBreak +
	'   ,CASE ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                       ' + sLineBreak +
	'   WHEN 7 THEN ''ROAD''                                                                                                       ' + sLineBreak +
	'   WHEN 1 THEN ''SEA''                                                                                                        ' + sLineBreak +
	'   WHEN 4 THEN ''AIR''                                                                                                        ' + sLineBreak +
	'   ELSE VIATRANSP.NM_VIA_TRANSPORTE                                                                                           ' + sLineBreak +
	'   END                                                                           AS NM_VIA_TRANSPORTE_ING                     ' + sLineBreak +
	'   ,VIATRANSP.NM_VIA_TRANSPORTE                                                  AS NM_VIA_TRANSPORTE_ESP                     ' + sLineBreak +
	'   ,VIATRANSP.NM_VIA_TRANSPORTE                                                  AS NM_VIA_TRANSPORTE_POR                     ' + sLineBreak +
	'   ,EXPORTADOR.PATH_LOGO                                                         AS PATH_LOGO                                 ' + sLineBreak +
	'   ,ISNULL(PEI.TX_INF_EMBALAGEM , '''')                                           AS TX_INF_EMBALAGEM                         ' + sLineBreak +
	'   ,LTRIM(RTRIM(CAST(ISNULL(PAISDESTINO.NM_PAIS_ESP , PAISDESTINO.NM_PAIS) AS VARCHAR(50))))  AS PAIS_DESTINO_ESP             ' + sLineBreak +
	'   ,LTRIM(RTRIM(CAST(ISNULL(PAISDESTINO.NM_PAIS_ING , PAISDESTINO.NM_PAIS) AS VARCHAR(50))))  AS PAIS_DESTINO_ING             ' + sLineBreak +
	'   ,LTRIM(RTRIM(PAISDESTINO.NM_PAIS))                                                         AS PAIS_DESTINO_POR             ' + sLineBreak +
	'   ,ISNULL(EXPORTADOR.END_CIDADE,'''')                                            AS CIDADE_ORIGEM                            ' + sLineBreak +
	'   ,PE.VL_PESO_BRUTO                                                              AS VL_PESO_BRUTO                            ' + sLineBreak +
	'   ,PE.VL_PESO_LIQUIDO                                                            AS VL_PESO_LIQUIDO                          ' + sLineBreak +
	'   ,PE.VL_TOT_CUBAGEM                                                             AS VL_TOT_CUBAGEM                           ' + sLineBreak +
	'   ,QT_TOTAL_MERCADORIA                                                           AS QT_TOTAL_MERCADORIA                      ' + sLineBreak +
  '   ,(CASE                                                                                                                     ' + sLineBreak +
  '      WHEN SUBSTRING(PE.NR_PROCESSO, 5, 2) = ''EM'' THEN ''SEA''                                                                 ' + sLineBreak +
  '      WHEN SUBSTRING(PE.NR_PROCESSO, 5, 2) = ''EA'' THEN ''AIR''                                                                 ' + sLineBreak +
  '      WHEN SUBSTRING(PE.NR_PROCESSO, 5, 2) = ''ER'' THEN ''ROAD''                                                                ' + sLineBreak +
  '      ELSE SUBSTRING(PE.NR_PROCESSO, 5, 2)                                                                                                                ' + sLineBreak +
  '    END)                                                                          AS MODAL                                    ' + sLineBreak +
	'   																												                                                                   ' + sLineBreak +
	'   FROM TPROCESSO_EXP        PE              (NOLOCK)                                                                         ' + sLineBreak +
	'   JOIN TPROCESSO            P               (NOLOCK) ON P.NR_PROCESSO          = PE.NR_PROCESSO                              ' + sLineBreak +
	'   JOIN TEMPRESA_NAC         EXPORTADOR      (NOLOCK) ON EXPORTADOR.CD_EMPRESA  = P.CD_CLIENTE                                ' + sLineBreak +
	'   OUTER APPLY(SELECT DISTINCT ISNULL(I.NR_PEDIDO, '''') AS NR_PEDIDO,                                                        ' + sLineBreak +
	'   								LTRIM(RTRIM(CAST(EP.TX_INF_EMBALAGEM AS VARCHAR(1000)))) AS TX_INF_EMBALAGEM ,                              ' + sLineBreak +
	'   								SUM(I.QT_MERCADORIA) AS QT_TOTAL_MERCADORIA                                                                ' + sLineBreak +
	'   				FROM TPROCESSO_EXP_ITEM I (NOLOCK)                                                                                 ' + sLineBreak +
	'   				LEFT                                                                                                               ' + sLineBreak +
	'   				JOIN TPROCESSO_EXP_PEDIDO EP (NOLOCK) ON EP.NR_PROCESSO = I.NR_PROCESSO                                            ' + sLineBreak +
	'   														AND EP.NR_PEDIDO   = I.NR_PEDIDO                                                               ' + sLineBreak +
	'   				WHERE I.NR_PROCESSO = PE.NR_PROCESSO                                                                               ' + sLineBreak +
	'   				GROUP BY I.NR_PEDIDO, CAST(EP.TX_INF_EMBALAGEM AS VARCHAR(1000))) PEI                                               ' + sLineBreak +
	'   LEFT JOIN TEMPRESA_EST     IMPORTADOR      (NOLOCK) ON IMPORTADOR.CD_EMPRESA  = PE.CD_IMPORTADOR                           ' + sLineBreak +
	'   LEFT JOIN TPAIS_BROKER     IMPORTADORPAIS  (NOLOCK) ON IMPORTADORPAIS.CD_PAIS = IMPORTADOR.CD_PAIS                         ' + sLineBreak +
	'   LEFT JOIN TLOCAL_EMBARQUE  LOCEMBARQUE     (NOLOCK) ON LOCEMBARQUE.CODIGO     = P.CD_LOCAL_EMBARQUE                        ' + sLineBreak +
	'   LEFT JOIN TLOCAL_EMBARQUE  LOCDESEMBARQUE  (NOLOCK) ON LOCDESEMBARQUE.CODIGO  = CASE WHEN                                  ' + sLineBreak +
	'   																                                               	ISNULL(P.CD_LOCAL_ENTREGA, '''') <> ''''   ' + sLineBreak +
	'   																                                               					THEN P.CD_LOCAL_ENTREGA            ' + sLineBreak +
	'   																                                               					ELSE P.CD_LOCAL_DESEMBARQUE        ' + sLineBreak +
	'   																                                               				END                                  ' + sLineBreak +
	'   LEFT JOIN TPAIS_BROKER     PAISDESTINO     (NOLOCK) ON PAISDESTINO.CD_PAIS         = P.CD_PAIS_DESTINO                     ' + sLineBreak +
	'   LEFT JOIN TVIA_TRANSPORTE  VIATRANSP       (NOLOCK) ON VIATRANSP.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                  ' + sLineBreak +
 '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO);
end;

function Tdatm_DocumentosExportacao.GetSQLPackingListItens(nr_processo , nr_fatura: string) : string;
begin
  result :=
  ' SELECT                                                                                                           ' + sLineBreak +
  '   PE.NR_PROCESSO                                                          AS NR_PROCESSO                         ' + sLineBreak +
  '  ,LTRIM(RTRIM(PEI.CD_MERCADORIA))                                         AS CD_MERCADORIA                       ' + sLineBreak +
  '  ,CAST(ISNULL(MERC.TX_DESC_INGLES, MERC.AP_MERCADORIA) AS VARCHAR(200))   AS MERCADORIA_ING                      ' + sLineBreak +
  '  ,CAST(ISNULL(MERC.TX_DESC_ESP, MERC.AP_MERCADORIA) AS VARCHAR(200))      AS MERCADORIA_ESP                      ' + sLineBreak +
  '  ,CAST(MERC.AP_MERCADORIA AS VARCHAR(200))                                AS MERCADORIA_POR                      ' + sLineBreak +
  '  ,ISNULL(UM.CD_UNID_MEDIDA, '''')                                         AS CD_UNID_MEDIDA                      ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(UM.NM_UNID_MEDIDA_ING, UM.NM_UNID_MEDIDA) AS VARCHAR(100))))  AS UNIDADE_MEDIDA_ING    ' + sLineBreak +
  '  ,LTRIM(RTRIM(CAST(ISNULL(UM.NM_UNID_MEDIDA_ESP, UM.NM_UNID_MEDIDA) AS VARCHAR(100))))  AS UNIDADE_MEDIDA_ESP    ' + sLineBreak +
  '  ,LTRIM(RTRIM(UM.NM_UNID_MEDIDA))                                         AS UNIDADE_MEDIDA_POR                  ' + sLineBreak +
  '  ,PEI.QT_MERCADORIA                                                       AS QT_MERCADORIA                       ' + sLineBreak +
  '  ,PEI.VL_TOT_PESO_BRUTO                                                   AS VL_TOT_PESO_BRUTO                   ' + sLineBreak +
  '  ,PEI.VL_TOT_PESO_LIQ                                                     AS VL_TOT_PESO_LIQ                     ' + sLineBreak +
  '  ,PEI.VL_UNITARIO                                                         AS VL_UNITARIO                         ' + sLineBreak +
  '  ,PEI.VL_TOT_ITEM                                                         AS VL_TOT_ITEM                         ' + sLineBreak +
  '  ,CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END  AS NR_PEDIDO            ' + sLineBreak +
  '  ,CAST(PEI.VL_LARGURA_EMB AS VARCHAR(10)) + '' X '' +                                                            ' + sLineBreak +
  '   CAST(PEI.VL_ALTURA_EMB AS VARCHAR(10)) + '' X '' +                                                          '  + sLineBreak +
  '   CAST(PEI.VL_COMPRIMENTO_EMB AS VARCHAR(10))                             AS EMBALAGEM                           ' + sLineBreak +
  ' FROM TPROCESSO_EXP           PE   (NOLOCK)                                                                       ' + sLineBreak +
  ' JOIN TPROCESSO               P    (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                              ' + sLineBreak +
  ' JOIN TPROCESSO_EXP_ITEM      PEI  (NOLOCK) ON PEI.NR_PROCESSO      = PE.NR_PROCESSO                              ' + sLineBreak +
  ' JOIN TMERCADORIA_EXP         MERC (NOLOCK) ON MERC.CD_MERCADORIA   = PEI.CD_MERCADORIA                           ' + sLineBreak +
  '                                           AND MERC.CD_GRUPO        = P.CD_GRUPO                                  ' + sLineBreak +
  ' LEFT                                                                                                             ' + sLineBreak +
  ' JOIN TUNID_MEDIDA_BROKER     UM   (NOLOCK) ON UM.CD_UNID_MEDIDA    = PEI.CD_UNID_MEDIDA                          ' + sLineBreak +
  '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO) +  sLineBreak +
  '    AND CASE WHEN ISNULL(LTRIM(PEI.NR_PEDIDO), '''') = '''' THEN ''_'' ELSE PEI.NR_PEDIDO END  =' + QuotedStr(nr_fatura)   +  sLineBreak +
  '  ORDER BY NR_ITEM                                                                                  ' + sLineBreak ;
end;



end.
