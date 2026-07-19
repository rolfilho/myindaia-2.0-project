unit uLeiauteSefazMattel;

interface

uses Classes, KrQuery, Dialogs;

type
  TLeiauteSefazMattel = class
  private
    FNomeArquivo: string;
    FHandle: Integer;
    Query: TLocalQuery;
    ValorTotalProdutos: Double;
    ValorPIS: Double;
    ValorCOFINS: Double;
    ValorTaxa: Double;
    ValorBaseIbsCbs: Double;
    ValorIbsUf: Double;
    ValorIbsMun: Double;
    ValorIbsTotal: Double;
    ValorCbs: Double;
    TotalNota: Double;
    TotalBaseCalcICMS: Double;
    TotalBaseCalcICMS30: Double;
    TotalICMS: Double;
    TotalICMSDevido: Double;
    function GetSQLSelect: string;
    function ValorUnitarioTributacao: Double;
    function ValorUnitarioComercializacao: Double;
    function ValorBaseCalculoIPI: Double;
    function ValorBruto: Double;
    function GetRegistro001(NumeroDocumento: Integer): string;
    function GetRegistro002: string;
    function GetRegistro003: string;
    function GetRegistro004: string;
    function GetRegistro005: string;
    function GetRegistro009: string;
    function GetRegistro100: string;
    function GetRegistro102: string;
    function GetRegistro103: string;
    function GetRegistro104: string;
    function GetRegistro113: string;
    procedure SomaValorTotalNota;
    procedure SomaBaseCalcICMS;
    procedure SomaTotalICMS;
    procedure SomaValorProdutos;
    procedure SomaValorPIS;
    procedure SomaValorCOFINS;
    function CodigoPaisBacen: string;
    function GetNumeroDocumento(const Empresa: string): Integer;
    function SequencialAdicao: string;
    function CalculaValorBaseICMS: Double;
    function CalculaValorBaseICMS30: Double;
    function CalculaValorICMSItem: Double;
    procedure SomaTotalICMSDevido;
    function VL_AFRMM_ITEM: string;
    function RequeridosHeader: string;
    function RequeridosItens: string;
    function RequeridosFooter: string;
    function NR_CNTR: string;
    function NumeroVolumes: string;
    procedure SomaValorTaxa;
    procedure SomaBaseIbsCbs;
    procedure SomaIbsUf;
    procedure SomaIbsMun;
    procedure SomaIbsTotal;
    procedure SomaCbs;
  public
    constructor Create(const NomeArquivo: string; Handle: Integer);
    procedure GerarArquivo(const Empresa: string);
  end;

implementation

uses Funcoes, KrHandle, KrFormat, KrUtil, MaskUtils, SysUtils, Math;

{ TLeiauteSefazMattel }

constructor TLeiauteSefazMattel.Create(const NomeArquivo: string;
  Handle: Integer);
begin
  FNomeArquivo := NomeArquivo;
  FHandle := Handle;
end;

function TLeiauteSefazMattel.GetSQLSelect: string;
begin
  Result := 'SELECT '+            '  DI.NR_PROCESSO, '+
            '  P.SEQ_POSYSTEM, '+
            '  UF_EI.CD_IBGE AS UF_EMI_IBGE,'+
            '  TCFOP.NM_CFOP, '+
            '  GetDate() as DataEmiDocFisc, '+
            '  LOC_IMP.COD_IBGE as COD_IBGE_CIDADE, '+
            '  EI.CGC_EMPRESA, '+
            '  EI.NM_EMPRESA    AS EI_NM_EMPRESA, '+
            '  EI.END_EMPRESA   AS EI_END_EMPRESA, '+
            '  EI.END_NUMERO    AS EI_END_NUMERO, '+
            '  EI.END_COMPLEMENTO EI_END_COMPLEMENTO, '+
            '  EI.END_BAIRRO    AS EI_END_BAIRRO, '+
            '  LOC_IMP.COD_IBGE AS MUN_IMP_COD_IBGE, '+
            '  LOC_IMP.NOME     AS MUN_IMP_NOME, '+
            '  EI.END_UF        AS EI_END_UF, '+
            '  EI.END_CEP       AS EI_END_CEP, '+
            '  PI.CD_SCX_EXP    AS PI_COD_BACEN, '+
            '  PI.NM_PAIS       AS PAIS, '+
            '  EI.NR_TELEFONE, '+
            '  EI.IE_EMPRESA, '+
            '  EE_FO.NM_EMPRESA  AS EE_FO_NM_EMPRESA, '+
            '  EE_FO.END_EMPRESA AS EE_FO_END_EMPRESA, '+
            '  EE_FO.END_NUMERO  AS EE_FO_END_NUMERO, '+
            '  EE_FO.END_COMPL   AS EE_FO_END_COMPL, '+
            '  EE_FA.NM_EMPRESA  AS EE_FA_NM_EMPRESA, '+
            '  EE_FA.END_EMPRESA AS EE_FA_END_EMPRESA, '+
            '  EE_FA.END_NUMERO  AS EE_FA_END_NUMERO, '+
            '  EE_FA.END_COMPL   AS EE_FA_END_COMPL, '+
            '  DI.CD_PAIS_AQUIS_MERC, '+
            '  DI.TX_DOLAR, '+
            '  PE.NM_PAIS    AS PE_NM_PAIS,'+
            '  PE.CD_SCX_EXP AS PE_COD_BACEN, '+
            '  DM.CD_MERCADORIA, '+
            '  M.TX_DESC_ESP, '+
            '  LEFT(LTRIM(RTRIM(CONVERT(VARCHAR(30),M.TX_DESC_ESP))),13)  AS  TX_DESC_ESP_GTIN13, '+
            '  RIGHT(RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(50), '+
            '  M.TX_DESC_ESP), '' '', ''''),CHAR(10), ''''), CHAR(13), ''''))),14) AS  TX_DESC_ESP_GTIN14,  '+
            '  DM.TX_DESC_DET_MERC, '+
            '  DM.CD_NCM_SH, '+
            '  AI.CD_CFOP, '+
            '  DM.QT_MERC_UN_COMERC, '+
            '  DI.IN_EMBUT_FRT_ITENS, '+
            '  DI.IN_EMBUT_SEG_ITENS, '+
            '  DM.VL_MCV_ITEM_MN, '+
            '  DM.VL_FRETE_ITEM_MN, '+
            '  DM.VL_SEGURO_ITEM_MN,'+
            '  DM.VL_ACRESCIMO_ITEM, '+
            '  DI.PB_CARGA, '+
            '  DI.PL_CARGA, '+
            '  DM.PL_MERCADORIA,'+
            '  DM.VL_DESCONTO_MERC, '+
            '  DM.NR_PROC_PO, '+
            '  DM.NR_ITEM_PO, '+
            '  DI.NR_DECLARACAO_IMP,'+
            '  DI.DT_REGISTRO_DI, '+
            '  URF.DESCRICAO AS LOCAL_DESEMBA, '+
            '  URF.END_UF AS UF_DESEMBARACO, '+
            '  FU.DT_REALIZACAO,'+
            '  DM.NR_ADICAO, '+
            '  DM.NR_ITEM, '+
            '  EE_FO.NR_CLIENTE AS EE_FO_NR_CLIENTE, '+
            '  EE_FA.NR_CLIENTE AS EE_FA_NR_CLIENTE, '+
            '  DM.VL_BASE_ICMS_ITEM, '+
            '  AI.PC_ICMS,'+
            '  DM.VL_ICMS_ITEM, '+
            '  DM.VL_BASE_CALC_II, '+
            '  DM.VL_II_ITEM, '+
            '  DM.VL_UNITARIO, '+
            '  TIPI.PC_ALIQ_NORM_ADVAL, '+
            '  DM.VL_IPI_ITEM, '+
            '  DM.VL_AFRMM_ITEM, '+
            '  TII.PC_ALIQ_NORM_ADVAL, '+
            '  AI.ALIQ_PIS, '+
            '  DM.VL_PIS_ITEM, '+
            '  AI.ALIQ_COFINS, '+
            '  DM.VL_COFINS_ITEM, '+
            '  DM.VL_TX_SCX_ITEM, '+
            '  DI.CD_VIA_TRANSP_CARG, '+
            '  AI.VL_BASE_CALC_ICMS_AFRMM, '+
            '  AI.VL_ICMS_CALCULADO, '+
            '  AI.VL_ICMS_A_RECOLHER_AFRMM,	'+
            '  AI.VL_ICMS_A_RECOLHER, '+
            '  AI.VL_ICMS_DEVIDO_AFRMM, '+
            '  AI.PC_REDUCAO_ICMS, '+
            '  AI.VL_BASE_CALC_II AS VL_BASE_CALC_II_AD, '+
            '  DI.VL_TOTAL_FRETE_MN, '+
            '  DI.VL_TOTAL_SEGURO_MN, '+
            '  DI.VL_TOTAL_DEDUCOES_MN, '+
            '  DI.VL_TOTAL_II, '+
            '  DI.VL_TOTAL_IPI, '+
            '  AI.VL_PIS, '+
            '  AI.VL_COFINS, '+
            '  DI.VL_TOTAL_TX_SCX, '+
            '  TR.CNPJ_TRANSP_ROD, '+
            '  TR.NM_TRANSP_ROD, '+
            '  TR.IE_TRANSP_ROD, '+
            '  TR.END_TRANSP_ROD, '+
            '  TR.END_CIDADE, '+
            '  TR.END_UF AS UF_TRANSPORTADOR, '+
            '  EB.QT_VOLUME_CARGA, '+
            '  TPE.DESCRICAO AS TIPO_EMBALAGEM, '+
            '  PCNTR.NR_CNTR, '+
            '  P.NR_DI, '+
            '  CASE WHEN P.CD_CLIENTE = ''03278'' THEN ''51'' ELSE ''90'' END AS COD_ICMS  , '+
            '  CASE WHEN P.CD_CLIENTE = ''03278'' THEN ''2'' ELSE ''3'' END AS SERIE  , '+
            '  DBO.FN_DATA_COM_FUSO_HORARIO() AS DT_ATUAL, '+
            '  CASE WHEN (SELECT COUNT(PC.NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC WHERE PC.NR_PROCESSO = DI.NR_PROCESSO) > 1 THEN '+
            '   ''Transporte fracionado de acordo com artigo 461 do RICMS/2000-SP. Containeres: '' + (Cast(ISNULL(STUFF((SELECT '', '' + LTRIM(RTRIM(PC.NR_CNTR)) '+
            '   FROM BROKER.DBO.TPROCESSO_CNTR PC WITH (NOLOCK) WHERE PC.NR_PROCESSO = DI.NR_PROCESSO FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300))) '+
            '   ELSE NULL END AS INFO_COMPL_CNTR, '+
            '  P.CD_CLIENTE, '+
            '  (DM.VL_BASE_ICMS_ITEM * AI.PC_ICMS) AS vICMSOp, '+
            '  (CASE WHEN AI.PC_REDUCAO_ICMS = 0 THEN 100 ELSE AI.PC_REDUCAO_ICMS END) AS pDif, '+
            '  (( AI.VL_ICMS_DEVIDO_AFRMM / AI.VL_BASE_CALC_II ) * DM.VL_BASE_CALC_II ) - ( ( AI.VL_ICMS_A_RECOLHER / AI.VL_BASE_CALC_II ) * DM.VL_BASE_CALC_II ) AS vICMSDif, ' +
            '  AI.CD_TRIBUTACAO_ICMS, '+
            ' CONVERT(VARCHAR(10),EV838.DT_REALIZACAO,23) AS PREV_ENTREGA,  '+
            ' DM.VL_BASE_IBS_CBS AS BASE_IBS_CBS, '+
            ' AI.ALIQ_IBS_UF AS ALIQ_IBS_UF,   '+
            ' DM.VL_IBS_UF AS VL_IBS_UF,    '+
            ' AI.ALIQ_IBS_MUN AS ALIQ_IBS_MUN,  '+
            ' DM.VL_IBS_MUN AS VL_IBS_MUN,  '+
            ' DM.VL_IBS_UF + DM.VL_IBS_MUN AS VL_TOTAL_IBS,  '+
            ' AI.ALIQ_CBS AS ALIQ_CBS,  '+
            ' DM.VL_CBS AS VL_CBS    '+
             
            'FROM TDECLARACAO_IMPORTACAO         DI       (NOLOCK)     '+
            'INNER  JOIN TDETALHE_MERCADORIA     DM       (NOLOCK)  ON DM.NR_PROCESSO           = DI.NR_PROCESSO         '+
            'INNER  JOIN TPROCESSO_H             H        (NOLOCK)  ON H.HANDLE                 = :HANDLE                '+
            '                                                      AND H.NR_PROCESSO            = RTRIM(DI.NR_PROCESSO)  '+
            'INNER  JOIN TPROCESSO               P        (NOLOCK)  ON P.NR_PROCESSO            = DI.NR_PROCESSO         '+
            'LEFT   JOIN TPROCESSO_CNTR          PCNTR    (NOLOCK)  ON PCNTR.NR_PROCESSO        = P.NR_PROCESSO          '+
            '                                                      AND PCNTR.NR_CNTR            = DM.NR_CNTR             '+
            'LEFT   JOIN TTRANSP_ROD             TR       (NOLOCK)  ON TR.CD_TRANSP_ROD         = P.CD_TRANSP_NAC        '+
            'LEFT   JOIN TEMPRESA_EST            EE_FO    (NOLOCK)  ON EE_FO.CD_EMPRESA         = DI.CD_FORNECEDOR       '+
            'LEFT   JOIN TEMPRESA_EST            EE_FA    (NOLOCK)  ON EE_FA.CD_EMPRESA         = DM.CD_FABRICANTE       '+
            'LEFT   JOIN TEMPRESA_NAC            EI       (NOLOCK)  ON EI.CD_EMPRESA            = DI.CD_IMPORTADOR       '+
            'LEFT   JOIN TUF                     UF_EI    (NOLOCK)  ON UF_EI.CD_UF              = EI.END_UF              '+
            'LEFT   JOIN TPAIS_BROKER            PI       (NOLOCK)  ON PI.CD_PAIS               = EI.CD_PAIS_IMPORTADOR  '+
            'LEFT   JOIN TPAIS_BROKER            PE       (NOLOCK)  ON PE.CD_PAIS               = DI.CD_PAIS_AQUIS_MERC  '+
            'LEFT   JOIN LOCALIDADE              LOC_IMP  (NOLOCK)  ON LOC_IMP.ID               = EI.END_ID_LOCALIDADE   '+
            'LEFT   JOIN TURF                    URF      (NOLOCK)  ON URF.CODIGO               = DI.CD_URF_DESPACHO     '+
            'LEFT   JOIN TMERCADORIA             M        (NOLOCK)  ON M.CD_MERCADORIA          = DM.CD_MERCADORIA       '+
            'LEFT   JOIN TPAGAMENTO_TRIBUTOS     PT       (NOLOCK)  ON PT.NR_PROCESSO           = DI.NR_PROCESSO         '+
            'LEFT   JOIN TEMBALAGEM_CARGA        EB       (NOLOCK)  ON EB.NR_PROCESSO           = DI.NR_PROCESSO         '+
            'LEFT   JOIN TTP_EMBALAGEM           TPE      (NOLOCK)  ON TPE.CODIGO               = EB.CD_TIPO_EMBALAGEM   '+
            'LEFT   JOIN TURF                             (NOLOCK)  ON TURF.CODIGO              = DI.CD_URF_DESPACHO     '+
            'LEFT   JOIN TFOLLOWUP               FU       (NOLOCK)  ON FU.NR_PROCESSO           = DI.NR_PROCESSO         '+
            '                                                      AND FU.CD_EVENTO             = ''088''                '+
            'LEFT   JOIN TRIBUTO                 TII      (NOLOCK)  ON TII.NR_PROCESSO          = DI.NR_PROCESSO         '+
            '                                                      AND TII.NR_ADICAO            = DM.NR_ADICAO           '+
            '                                                      AND TII.CD_RECEITA_IMPOSTO   = ''0001''               '+
            'LEFT   JOIN TRIBUTO                 TIPI     (NOLOCK)  ON TIPI.NR_PROCESSO         = DI.NR_PROCESSO         '+
            '                                                      AND TIPI.NR_ADICAO           = DM.NR_ADICAO           '+
            '                                                      AND TIPI.CD_RECEITA_IMPOSTO  = ''0002''               '+
            'LEFT   JOIN TADICAO_DE_IMPORTACAO   AI       (NOLOCK)  ON AI.NR_PROCESSO           = DI.NR_PROCESSO         '+
            '                                                      AND AI.NR_ADICAO             = DM.NR_ADICAO           '+
            'LEFT   JOIN TCFOP                            (NOLOCK)  ON TCFOP.CD_CFOP            = AI.CD_CFOP             '+
            'LEFT JOIN TFOLLOWUP                 EV838    (NOLOCK)  ON EV838.NR_PROCESSO = DI.NR_PROCESSO AND EV838.CD_EVENTO=''838''  '+

            'WHERE PT.CD_RECEITA_PGTO = 7811 '+
            'ORDER BY '+
            '  DI.NR_PROCESSO, '+
            '  DM.NR_ADICAO, '+
            '  DM.NR_ITEM ';
end;

function TLeiauteSefazMattel.GetRegistro001(NumeroDocumento: Integer): string;
var Linha : String;
begin
  Linha  := {01}Query.FieldByName('UF_EMI_IBGE').AsString+
            {02}FormataAlfaNumerico(Query.FieldByName('NM_CFOP').AsString, 60)+
            {03}' '+
            {04}'55'+
            {05}FormataAlfaNumerico(Query.FieldByName('SERIE').AsString, 3)+
            {06}FormataNumero(NumeroDocumento, 9)+
            {07}FormataData('yyyy-mm-dd', Query.FieldByName('DataEmiDocFisc').AsDateTime)+
            {08}FormataAlfaNumerico(' ', 10)+
            {09}'0'+
            {10}Query.FieldByName('COD_IBGE_CIDADE').AsString+
            {11}FormataAlfaNumerico(' ', 44)+
            {12}FormataAlfaNumerico(' ', 2)+
            {13}FormataAlfaNumerico(' ', 4)+
            {14}FormataAlfaNumerico(' ', 14)+
            {15}FormataAlfaNumerico(' ', 2)+
            {16}FormataAlfaNumerico(' ', 3)+ //TODO: Fixo temporáriamente - Encontrar melhor solução
            {17}FormataAlfaNumerico(' ', 9)+
            {18}'2'+
            {19}'1'+
            {20}'1'+
            {21}' '+
            {22}FormataAlfaNumerico(' ', 20)+
            {23}FormataAlfaNumerico(' ', 8)+
            {24}FormataAlfaNumerico(' ', 18)+
            {25}FormataAlfaNumerico(' ', 256)+
            {26}'3'+
            {27}'0'+
            {28}'9'+
            Query.FieldByName('DT_ATUAL').AsString+
            ' '+
            Query.FieldByName('COD_IBGE_CIDADE').AsString+
            '    '+
            Query.FieldByName('PREV_ENTREGA').AsString;


  result := Linha;
end;

function TLeiauteSefazMattel.GetRegistro002: string;
begin
  Result := {01}FormataAlfaNumerico(Query.FieldByName('CGC_EMPRESA').AsString, 14)+
            {02}FormataAlfaNumerico(' ', 11)+
            {03}FormataAlfaNumerico(Query.FieldByName('EI_NM_EMPRESA').AsString, 60)+
            {04}FormataAlfaNumerico(' ', 60)+
            {05}FormataAlfaNumerico(Query.FieldByName('EI_END_EMPRESA').AsString, 60)+
            {06}FormataAlfaNumerico(Query.FieldByName('EI_END_NUMERO').AsString, 60)+
            {07}FormataAlfaNumerico(Query.FieldByName('EI_END_COMPLEMENTO').AsString, 60);
end;        

function TLeiauteSefazMattel.CodigoPaisBacen: string;
begin
  Result := Query.FieldByName('PI_COD_BACEN').AsString;//Copy(Query.FieldByName('PI_COD_BACEN').AsString, 2, 4);
end;

function TLeiauteSefazMattel.GetRegistro003: string;
begin
  Result := {08}FormataAlfaNumerico(Query.FieldByName('EI_END_BAIRRO').AsString,60, True)+
            {09}FormataNumero(Query.FieldByName('MUN_IMP_COD_IBGE').AsInteger, 7)+
            {10}FormataAlfaNumerico(Query.FieldByName('MUN_IMP_NOME').AsString, 60, True)+
            {11}FormataAlfaNumerico(Query.FieldByName('EI_END_UF').AsString, 2, True)+
            {12}FormataAlfaNumerico(Query.FieldByName('EI_END_CEP').AsString, 8, True)+
            {13}CodigoPaisBacen+
            {14}FormataAlfaNumerico(Query.FieldByName('PAIS').AsString, 60)+
            {15}FormataAlfaNumerico(Query.FieldByName('NR_TELEFONE').AsString, 14, True)+
            {16}FormataAlfaNumerico(Query.FieldByName('IE_EMPRESA').AsString, 14, True)+
            {17}FormataAlfaNumerico(' ', 14)+
            {18}FormataAlfaNumerico(' ', 15)+
            {19}FormataAlfaNumerico(' ', 15)+
            {20}'3';
end;

function TLeiauteSefazMattel.GetRegistro004: string;
begin
  Result := {01}FormataAlfaNumerico(' ', 14)+
            {02}FormataAlfaNumerico(' ', 11)+
            {03}FormataAlfaNumerico(Query.FieldByName('EE_FO_NM_EMPRESA').AsString, 60, True)+
            {04}FormataAlfaNumerico(Query.FieldByName('EE_FO_END_EMPRESA').AsString, 60, True)+
            {05}FormataAlfaNumerico(Query.FieldByName('EE_FO_END_NUMERO').AsString, 60, True)+
            {06}FormataAlfaNumerico(Query.FieldByName('EE_FO_END_COMPL').AsString, 60, True)+
            {07}FormataAlfaNumerico('2000002', 20);
end;

function TLeiauteSefazMattel.GetRegistro005: string;
begin
  Result := {07}FormataAlfaNumerico(' ', 60)+ //Manual 85
            {08}FormataAlfaNumerico('9999999', 7)+
            {09}FormataAlfaNumerico('EXTERIOR', 60)+
            {10}'EX'+
            {11}FormataAlfaNumerico(' ', 8)+
            {12}FormataNumero(Query.FieldByName('PE_COD_BACEN').AsInteger, 4)+
            {13}FormataAlfaNumerico(Query.FieldByName('PE_NM_PAIS').AsString, 60, True)+
            {14}FormataAlfaNumerico(' ', 14)+
            {15}FormataAlfaNumerico(' ', 14)+
            {16}FormataAlfaNumerico(' ', 9)+
            {17}FormataAlfaNumerico(' ', 350)+
            {18}FormataAlfaNumerico('9', 1)+
            FormataAlfaNumerico(' ', 61);
end;

function TLeiauteSefazMattel.ValorUnitarioTributacao: Double;
begin
  Result := ((Query.FieldByName('VL_ACRESCIMO_ITEM').AsFloat / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat) +
             Query.FieldByName('VL_UNITARIO').AsFloat) * Query.FieldByName('TX_DOLAR').AsFloat;
end;

function TLeiauteSefazMattel.ValorUnitarioComercializacao: Double;
begin
  Result := ((Query.FieldByName('VL_ACRESCIMO_ITEM').AsFloat / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat) +
             Query.FieldByName('VL_UNITARIO').AsFloat) * Query.FieldByName('TX_DOLAR').AsFloat;
end;

function TLeiauteSefazMattel.ValorBruto: Double;
begin
  Result := Query.FieldByName('VL_BASE_CALC_II').AsFloat;
end;

function TLeiauteSefazMattel.ValorBaseCalculoIPI: Double;
begin
  Result := Query.FieldByName('VL_BASE_CALC_II').AsFloat + Query.FieldByName('VL_II_ITEM').AsFloat;
end;

function TLeiauteSefazMattel.SequencialAdicao: string;
var
  T: Integer;
begin
  T := Length(Query.FieldByName('NR_ITEM').AsString);
  Result := Copy(Query.FieldByName('NR_ITEM').AsString, T-1, 2);
end;

function TLeiauteSefazMattel.CalculaValorBaseICMS: Double;
var
  Soma: Double;
begin
  Soma := ((Query.FieldByName('VL_BASE_CALC_II').AsFloat+
             Query.FieldByName('VL_II_ITEM').AsFloat+
             Query.FieldByName('VL_IPI_ITEM').AsFloat+
             Query.FieldByName('VL_PIS_ITEM').AsFloat+
             Query.FieldByName('VL_COFINS_ITEM').AsFloat+
             Query.FieldByName('VL_TX_SCX_ITEM').AsFloat+
             Query.FieldByName('VL_AFRMM_ITEM').AsFloat)/
             ((100-Query.FieldByName('PC_ICMS').AsFloat)/100));
  Result := RoundTo(Soma - (Soma * (Query.FieldByName('PC_REDUCAO_ICMS').AsFloat/100)), -2);
end;

function TLeiauteSefazMattel.CalculaValorBaseICMS30: Double;
begin
  Result := RoundTo((((Query.FieldByName('VL_BASE_CALC_II').AsFloat+
             Query.FieldByName('VL_II_ITEM').AsFloat+
             Query.FieldByName('VL_IPI_ITEM').AsFloat+
             Query.FieldByName('VL_PIS_ITEM').AsFloat+
             Query.FieldByName('VL_COFINS_ITEM').AsFloat+
             Query.FieldByName('VL_TX_SCX_ITEM').AsFloat+
             Query.FieldByName('VL_AFRMM_ITEM').AsFloat)/
             ((100-Query.FieldByName('PC_ICMS').AsFloat)/100)) * (Query.FieldByName('PC_REDUCAO_ICMS').AsFloat/100)), -2);
end;


function TLeiauteSefazMattel.CalculaValorICMSItem: Double;
begin
  if (Query.FieldByName('CD_CLIENTE').AsString = '03278') and (Query.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7')then
    Result := 0
  else
    Result := (CalculaValorBaseICMS * Query.FieldByName('PC_ICMS').AsFloat) / 100;
end;

function TLeiauteSefazMattel.VL_AFRMM_ITEM: string;
begin
  Result := FormataValor(Query.FieldByName('VL_AFRMM_ITEM').AsFloat, 16, 2, True)
end;

function TLeiauteSefazMattel.GetRegistro009: string;
var
  Linha: string;
begin
  Linha :=  {01}FormataAlfaNumerico(Query.FieldByName('CD_MERCADORIA').AsString, 60, True)+
            {02}FormataAlfaNumerico(Query.FieldByName('TX_DESC_ESP_GTIN13').AsString, 14, True)+
            {03}FormataAlfaNumerico(Query.FieldByName('TX_DESC_DET_MERC').AsString, 120, True)+
            {04}FormataAlfaNumerico(Query.FieldByName('CD_NCM_SH').AsString, 8, True)+
            {05}FormataAlfaNumerico(' ', 3)+
            {06}FormataAlfaNumerico(' ', 2)+
            {07}FormataAlfaNumerico(Query.FieldByName('CD_CFOP').AsString, 4, True)+
            {08}FormataAlfaNumerico('UN', 6)+
            {09}FormataAlfaNumerico(' ', 6)+
            {10}FormataValor(Query.FieldByName('QT_MERC_UN_COMERC').AsFloat, 15, 4, True)+
            {11}FormataValor(ValorBruto / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat, 21, 8, True)+
            {12}FormataValor(Query.FieldByName('QT_MERC_UN_COMERC').AsFloat, 15, 4, True)+
            {13}FormataValor(ValorBruto / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat, 21, 8, True)+
            {14}FormataValor(ValorBruto, 16, 2, True)+
            {15}FormataAlfaNumerico(' ', 16)+
            {16}FormataAlfaNumerico(' ', 16)+
            {17}FormataAlfaNumerico(' ', 16)+
            {18}FormataAlfaNumerico('1', 1)+
            {19}FormataAlfaNumerico(' ', 15)+
            {20}FormataAlfaNumerico(' ', 6)+
            {21}FormataNumero(Query.FieldByName('NR_DECLARACAO_IMP').AsString, 12)+ //Formato : 999999999999
            {22}FormataData('yyyy-mm-dd', ConverteData(Query.FieldByName('DT_REGISTRO_DI').AsString))+ //AAAA-MM-DD
            {23}FormataAlfaNumerico(Query.FieldByName('LOCAL_DESEMBA').AsString, 60, True)+
            {24}FormataAlfaNumerico(Query.FieldByName('UF_DESEMBARACO').AsString, 2, True)+
            {25}FormataData('yyyy-mm-dd', Query.FieldByName('DT_REALIZACAO').AsDateTime)+
            {26}FormataAlfaNumerico('2000002', 60)+
            {27}FormataNumero(Query.FieldByName('NR_ADICAO').AsInteger, 3)+
            {28}FormataAlfaNumerico(SequencialAdicao, 2, True)+
            {29}FormataAlfaNumerico(Query.FieldByName('EE_FA_NR_CLIENTE').AsString, 60, True)+
            {30}FormataAlfaNumerico(' ', 16)+
            {31}FormataAlfaNumerico('1', 1)+
            {32}FormataAlfaNumerico(Query.FieldByName('COD_ICMS').AsString, 2, True)+
            {33}FormataAlfaNumerico(' ', 15)+
            {34}FormataAlfaNumerico(' ', 15)+
            {35}FormataAlfaNumerico('3', 1)+
            {36}FormataValor(CalculaValorBaseICMS, 16, 2, True)+
            {37}FormataValor(Query.FieldByName('PC_ICMS').AsFloat, 6, 2, True)+
            {38}FormataValor(CalculaValorICMSItem , 16, 2, True)+
            {39}FormataAlfaNumerico('3', 1)+
            {40}FormataAlfaNumerico(' ', 6)+
            {41}FormataAlfaNumerico(' ', 6)+
            {42}FormataAlfaNumerico(' ', 16)+
            {43}FormataAlfaNumerico(' ', 6)+
            {44}FormataAlfaNumerico(' ', 16)+
            {45}FormataValor(Query.FieldByName('PC_REDUCAO_ICMS').AsFloat, 6, 2, True)+
            {46}FormataAlfaNumerico(' ', 5)+
            {47}FormataAlfaNumerico(' ', 14)+
            {48}FormataAlfaNumerico(' ', 7)+
            {49}FormataAlfaNumerico(' ', 12)+
            {50}FormataAlfaNumerico(' ', 3)+
            {51}FormataAlfaNumerico('00', 2)+
            {52}FormataValor(ValorBaseCalculoIPI, 16, 2, True)+
            {53}FormataAlfaNumerico(' ', 17)+
            {54}FormataAlfaNumerico(' ', 16)+
            {55}FormataValor(Query.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat, 6, 2, True)+
            {56}FormataValor(Query.FieldByName('VL_IPI_ITEM').AsFloat, 16, 2, True)+
            {57}FormataValor(Query.FieldByName('VL_BASE_CALC_II').AsFloat, 16, 2, True)+
            {58}FormataValor(Query.FieldByName('VL_AFRMM_ITEM').AsFloat, 16, 2, True)+
            {59}FormataValor(Query.FieldByName('VL_II_ITEM').AsFloat, 16, 2, True)+
            {60}FormataValor(0, 16, 2, True)+
            {61}FormataAlfaNumerico('50', 2)+
            {62}FormataValor(Query.FieldByName('VL_BASE_CALC_II').AsFloat, 16, 2, True)+
            {63}FormataValor(Query.FieldByName('ALIQ_PIS').AsFloat, 6, 2, True)+
            {64}FormataAlfaNumerico(' ', 17)+
            {65}FormataAlfaNumerico(' ', 16)+
            {66}FormataValor(Query.FieldByName('VL_PIS_ITEM').AsFloat, 16, 2, True)+
            {67}FormataAlfaNumerico(' ', 16)+
            {68}FormataAlfaNumerico(' ', 6)+
            {69}FormataAlfaNumerico(' ', 17)+
            {70}FormataAlfaNumerico(' ', 16)+
            {71}FormataValor(Query.FieldByName('VL_PIS_ITEM').AsFloat, 16, 2, True)+
            {72}FormataAlfaNumerico('50', 2)+
            {73}FormataValor(Query.FieldByName('VL_BASE_CALC_II').AsFloat, 16, 2, True)+
            {74}FormataValor(Query.FieldByName('ALIQ_COFINS').AsFloat, 6, 2, True)+
            {75}FormataAlfaNumerico(' ', 17)+
            {76}FormataAlfaNumerico(' ', 16)+
            {77}FormataValor(Query.FieldByName('VL_COFINS_ITEM').AsFloat, 16, 2, True)+
            FormataAlfaNumerico(' ', 41)+
            {127}FormataAlfaNumerico(StringReplace(Query.FieldByName('CD_VIA_TRANSP_CARG').AsString, '0', ' ', [rfReplaceAll]), 2, True)+
            {128}VL_AFRMM_ITEM+
            {129}FormataAlfaNumerico('1', 1)+
            FormataAlfaNumerico(' ', 7)+
            {50}FormataAlfaNumerico('999', 3)+
            FormataAlfaNumerico(' ', 377)+
            {109}FormataAlfaNumerico('0', 9)+
            {105}FormataAlfaNumerico('0', 9)+
            FormataAlfaNumerico(' ', 84)+
            {125}FormataValor(Query.FieldByName('VL_TX_SCX_ITEM').AsFloat, 16, 2, True)+
            {126}FormataAlfaNumerico(' ', 16);

            InsertStrAt(1307, 16,  FormataAlfaNumerico(' ', 16), Linha);
            InsertStrAt(1323, 7, FormataAlfaNumerico(' ', 7), Linha);
            InsertStrAt(1331, 16,  FormataAlfaNumerico(' ', 16), Linha);
            InsertStrAt(1347, 16,  FormataAlfaNumerico(' ', 16), Linha);
            InsertStrAt(1371, 16,  FormataAlfaNumerico(Query.FieldByName('TX_DESC_ESP_GTIN14').AsString, 14, True), Linha);


            if Query.FieldByName('CD_CLIENTE').AsString = '03278' then
            begin
              InsertStrAt(2242, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00',(CalculaValorBaseICMS * Query.FieldByName('PC_ICMS').AsFloat)/100), ',', '.', []), 16), Linha);
              InsertStrAt(2258, 8,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('pDif').AsFloat), ',', '.', []), 8), Linha);
              InsertStrAt(2266, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', (CalculaValorBaseICMS * Query.FieldByName('PC_ICMS').AsFloat)/100), ',', '.', []), 16), Linha);
            end;


            InsertStrAt(2404, 3,  '000', Linha);
            InsertStrAt(2407, 6,  '000001', Linha);
            InsertStrAt(2413, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('BASE_IBS_CBS').AsFloat), ',', '.', []), 16), Linha);
            InsertStrAt(2429, 8,  FormataAlfaNumerico(StringReplace(FormatFloat('0.0000', Query.FieldByName('ALIQ_IBS_UF').AsFloat), ',', '.', []), 8), Linha);
            InsertStrAt(2493, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('VL_IBS_UF').AsFloat), ',', '.', []), 16), Linha);
            InsertStrAt(2509, 8,  FormataAlfaNumerico(StringReplace(FormatFloat('0.0000', Query.FieldByName('ALIQ_IBS_MUN').AsFloat), ',', '.', []), 8), Linha);
            InsertStrAt(2573, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('VL_IBS_MUN').AsFloat), ',', '.', []), 16), Linha);
            InsertStrAt(2589, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('VL_TOTAL_IBS').AsFloat), ',', '.', []), 16), Linha);
            InsertStrAt(2605, 8,  FormataAlfaNumerico(StringReplace(FormatFloat('0.0000', Query.FieldByName('ALIQ_CBS').AsFloat), ',', '.', []), 8), Linha);
            InsertStrAt(2669, 16,  FormataAlfaNumerico(StringReplace(FormatFloat('0.00', Query.FieldByName('VL_CBS').AsFloat), ',', '.', []), 16), Linha);
            InsertStrAt(2951, 15,  FormataAlfaNumerico(Query.FieldByName('NR_DECLARACAO_IMP').AsString, 15, True), Linha);


            
  Result := Linha;
end;

function TLeiauteSefazMattel.GetRegistro100: string;
var
  Linha: string;
begin
  Linha :=  {01}FormataValor(TotalBaseCalcICMS, 16, 2, True)+
            {02}FormataValor(TotalICMS, 16, 2, True)+
            {03}FormataAlfaNumerico(' ', 16)+
            {04}FormataAlfaNumerico(' ', 16)+
            {05}FormataValor(ValorTotalProdutos, 16, 2, True)+
            {06}FormataAlfaNumerico(' ', 16)+
            {07}FormataAlfaNumerico(' ', 16)+
            {08}FormataAlfaNumerico(' ', 16)+
            {09}FormataValor(Query.FieldByName('VL_TOTAL_II').AsFloat, 16, 2, True)+
            {10}FormataValor(Query.FieldByName('VL_TOTAL_IPI').AsFloat, 16, 2, True)+
            {11}FormataValor(ValorPIS, 16, 2, True)+
            {12}FormataValor(ValorCOFINS, 16, 2, True)+
            {13}FormataValor(ValorTaxa, 16, 2, True)+
            {14}FormataValor(TotalNota, 16, 2, True)+
            {15}FormataValor(0, 16, 2, True)+
            {16}FormataValor(0, 16, 2, True);
            InsertStrAt(305, 16, FormataValor(0, 16, 2, True), Linha);
            InsertStrAt(321, 16, FormataValor(0, 16, 2, True), Linha);
            InsertStrAt(337, 16, FormataValor(0, 16, 2, True), Linha);
            InsertStrAt(353, 16, FormataValor(0, 16, 2, True), Linha);
  Result := Linha;
end;

function TLeiauteSefazMattel.GetRegistro102: string;
begin
  Result := {01}FormataAlfaNumerico('0', 1)+
            {02}FormataNumero(Query.FieldByName('CNPJ_TRANSP_ROD').AsString, 14)+
            {03}FormataAlfaNumerico(' ', 11)+
            {04}FormataAlfaNumerico(Query.FieldByName('NM_TRANSP_ROD').AsString, 60)+
            {05}FormataAlfaNumerico(SomenteNumero(Query.FieldByName('IE_TRANSP_ROD').AsString), 14)+
            {06}FormataAlfaNumerico(Query.FieldByName('END_TRANSP_ROD').AsString, 60)+
            {07}FormataAlfaNumerico(Query.FieldByName('END_CIDADE').AsString, 60)+
            {08}FormataAlfaNumerico(Query.FieldByName('UF_TRANSPORTADOR').AsString, 2)+
            {09}FormataAlfaNumerico(' ', 16)+
            {10}FormataAlfaNumerico(' ', 16)+
            {11}FormataAlfaNumerico(' ', 6)+
            {12}FormataAlfaNumerico(' ', 16)+
            {13}FormataAlfaNumerico(' ', 4)+
            {14}FormataAlfaNumerico(' ', 7)+
            '';
end;

function TLeiauteSefazMattel.NR_CNTR: string;
begin
  Result := FormataAlfaNumerico(Query.FieldByName('NR_CNTR').AsString, 60);
  if Result = '' then
    Result := FormataAlfaNumerico(' ', 60)
end;

function TLeiauteSefazMattel.NumeroVolumes: string;
begin
  Result := Copy(Query.FieldByName('NR_CNTR').AsString, 5, 7);
  Result := FormataAlfaNumerico(Result, 60);
  if Result = '' then
    Result := FormataAlfaNumerico(' ', 60)
end;

function TLeiauteSefazMattel.GetRegistro103: string;
begin
  Result := {15}FormataAlfaNumerico('AAA0000', 7)+
            {16}FormataAlfaNumerico('SP', 2)+
            {17}FormataAlfaNumerico(' ', 20)+
            {18}FormataAlfaNumerico(' ', 8)+
            {19}FormataAlfaNumerico(' ', 2)+
            {20}FormataAlfaNumerico(' ', 20)+
            {21}FormataAlfaNumerico(' ', 1)+
            {22}FormataNumero(Query.FieldByName('QT_VOLUME_CARGA').AsInteger, 15)+
            {23}FormataAlfaNumerico(Query.FieldByName('TIPO_EMBALAGEM').AsString, 60)+
            {24}NR_CNTR+
            {25}NumeroVolumes+
            {26}FormataValor(Query.FieldByName('PL_CARGA').AsFloat, 16, 3, True)+
            {27}FormataValor(Query.FieldByName('PB_CARGA').AsFloat, 16, 3, True)+
            {27}FormataAlfaNumerico(' ', 60)+
            '';
end;


function TLeiauteSefazMattel.GetRegistro104: string;
var
  Linha: string;
begin
  Linha :=  FormataAlfaNumerico(' ', 16);
            InsertStrAt(17, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', ValorBaseIbsCbs), ',', '.', []), 16), Linha);
            InsertStrAt(33, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(49, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(65, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', ValorIbsUf), ',', '.', []), 16), Linha);
            InsertStrAt(81, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(97, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(113, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', ValorIbsMun), ',', '.', []), 16), Linha);
            InsertStrAt(129, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', ValorIbsTotal), ',', '.', []), 16), Linha);
            InsertStrAt(145, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(161, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(177, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(193, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(209, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', ValorCbs), ',', '.', []), 16), Linha);
            InsertStrAt(225, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
            InsertStrAt(241, 16, FormataAlfaNumerico(StringReplace(FormatFloat('0.00', 0), ',', '.', []), 16), Linha);
  Result := Linha;
end;



procedure TLeiauteSefazMattel.SomaValorTotalNota;
begin
  TotalNota := TotalNota + Query.FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat;
{    Query.FieldByName('VL_BASE_CALC_II').AsFloat +
    Query.FieldByName('VL_FRETE_ITEM_MN').AsFloat +
    Query.FieldByName('VL_TX_SCX_ITEM').AsFloat +
    Query.FieldByName('VL_II_ITEM').AsFloat +
    Query.FieldByName('VL_IPI_ITEM').AsFloat +
    Query.FieldByName('VL_PIS_ITEM').AsFloat +
    Query.FieldByName('VL_COFINS_ITEM').AsFloat +
    Query.FieldByName('VL_ICMS_ITEM').AsFloat +
    Query.FieldByName('VL_AFRMM_ITEM').AsFloat;}
end;

procedure TLeiauteSefazMattel.SomaBaseCalcICMS;
begin
  TotalBaseCalcICMS := TotalBaseCalcICMS + CalculaValorBaseICMS;
  TotalBaseCalcICMS30 := TotalBaseCalcICMS30 + CalculaValorBaseICMS30;
end;

procedure TLeiauteSefazMattel.SomaTotalICMS;
begin
  TotalICMS := TotalICMS + CalculaValorICMSItem;
end;

procedure TLeiauteSefazMattel.SomaTotalICMSDevido;
begin
  TotalICMSDevido := TotalICMSDevido + (Query.FieldByName('VL_ICMS_DEVIDO_AFRMM').AsFloat - Query.FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat);
end;

procedure TLeiauteSefazMattel.SomaValorProdutos;
begin
  ValorTotalProdutos := ValorTotalProdutos + Query.FieldByName('VL_BASE_CALC_II').AsFloat;
end;

procedure TLeiauteSefazMattel.SomaValorPIS;
begin
  ValorPIS := ValorPIS + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_PIS_ITEM').AsFloat));
end;

procedure TLeiauteSefazMattel.SomaValorCOFINS;
begin
  ValorCOFINS := ValorCOFINS + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_COFINS_ITEM').AsFloat));
end;

procedure TLeiauteSefazMattel.SomaValorTaxa;
begin
  ValorTaxa := ValorTaxa + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_TX_SCX_ITEM').AsFloat));
end;


procedure TLeiauteSefazMattel.SomaBaseIbsCbs;
begin
  ValorBaseIbsCbs := ValorBaseIbsCbs + StrToFloat(FormatFloat('#0.00', Query.FieldByName('BASE_IBS_CBS').AsFloat));
end;



procedure TLeiauteSefazMattel.SomaIbsUf;
begin
  ValorIbsUf := ValorIbsUf + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_IBS_UF').AsFloat));
end;


procedure TLeiauteSefazMattel.SomaIbsMun;
begin
  ValorIbsMun := ValorIbsMun + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_IBS_MUN').AsFloat));
end;


procedure TLeiauteSefazMattel.SomaIbsTotal;
begin
  ValorIbsTotal := ValorIbsTotal + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_TOTAL_IBS').AsFloat));
end;


procedure TLeiauteSefazMattel.SomaCbs;
begin
  ValorCbs := ValorCbs + StrToFloat(FormatFloat('#0.00', Query.FieldByName('VL_CBS').AsFloat));
end;





function TLeiauteSefazMattel.GetNumeroDocumento(const Empresa: string): Integer;
var
  Seq: Integer;
  Q: TLocalQuery;
begin
  if Empresa = '' then
    raise Exception.Create('Empresa não informada.');
  if Query.FieldByName('SEQ_POSYSTEM').IsNull then
  begin
    Seq := ProximoSequencial('TPROCESSO_SEQ_POSYSTEM|'+Empresa);
    Q := AutoQuery.Query('UPDATE TPROCESSO SET SEQ_POSYSTEM = :SEQ_POSYSTEM WHERE NR_PROCESSO = :NR_PROCESSO');
    Q.ParamByName('SEQ_POSYSTEM').AsInteger := Seq;
    Q.ParamByName('NR_PROCESSO').AsString := Query.FieldByName('NR_PROCESSO').AsString;
    Q.ExecSQL;
    Result := Seq;
  end
  else
    Result := Query.FieldByName('SEQ_POSYSTEM').AsInteger;
end;

procedure TLeiauteSefazMattel.GerarArquivo(const Empresa: string);
var
  NR_Processo: string;
  Lista: TStrings;
  I: Integer;
  QtdItens: Integer;
  Seq: Integer;
  NR_Adicao: string;
  Msg: string;
begin
  Lista := TStringList.Create;
  try
    Query := AutoQuery.Query(GetSQLSelect);
    Query.ParamByName('HANDLE').AsInteger := FHandle;
    Query.Open;
    if (Query.IsEmpty) or Query.FieldByName('NR_PROCESSO').IsNull then
    begin
      ShowMessage('Operação cancelada.'#13#10'Verifique se todas as informações processo foram fornecidas.');
      Abort;
    end;
    Seq := GetNumeroDocumento(Empresa);
    QtdItens := 8;
    NR_Adicao := '';
    while not Query.Eof do
    begin
      ValorTotalProdutos := 0;
      ValorPIS := 0;
      ValorCOFINS := 0;
      ValorTaxa := 0;
      ValorBaseIbsCbs := 0;
      ValorIbsUf := 0;
      ValorIbsMun := 0;
      ValorIbsTotal := 0;
      ValorCbs := 0;
      TotalNota := 0;
      TotalBaseCalcICMS := 0;
      TotalICMS := 0;
      TotalICMSDevido := 0;
      ValorTotalProdutos := 0;
      NR_Processo := Query.FieldByName('NR_PROCESSO').AsString;
      Msg := RequeridosHeader;
      Lista.Add(GetRegistro001(Seq));
      Lista.Add(GetRegistro002);
      Lista.Add(GetRegistro003);
      Lista.Add(GetRegistro004);
      Lista.Add(GetRegistro005);
      Lista.Add('         ');
      Lista.Add('         ');
      Lista.Add('         ');
      repeat
        Msg := Msg + RequeridosItens;
        Lista.Add(GetRegistro009);
        Inc(QtdItens);
        SomaBaseCalcICMS;
        SomaTotalICMS;
        SomaValorProdutos;
        SomaValorCOFINS;
        SomaValorTaxa;
        SomaBaseIbsCbs;
        SomaIbsUf;
        SomaIbsMun;
        SomaIbsTotal;
        SomaCbs;
        if NR_Adicao <> Query.FieldByName('NR_ADICAO').AsString then
        begin
          SomaValorTotalNota;
          SomaTotalICMSDevido;
        end;
        SomaValorPIS;
        NR_Adicao := Query.FieldByName('NR_ADICAO').AsString;
        Query.Next;
      until Query.Eof or
            (NR_Processo <> Query.FieldByName('NR_PROCESSO').AsString);
    end;
    for I := 1 to 99 - QtdItens do
      Lista.Add('         ');
    Msg := Msg + RequeridosFooter;
    Lista.Add(GetRegistro100);
    Lista.Add('         ');{101}
    Lista.Add(GetRegistro102);
    Lista.Add(GetRegistro103);
    Lista.Add(GetRegistro104);{104}
    Lista.Add('         ');{105}
    Lista.Add('         ');{106}
    Lista.Add('         ');{107}
    Lista.Add('         ');{108}
    Lista.Add('         ');{109}
    Lista.Add('         ');{110}
    Lista.Add('         ');{111}
    Lista.Add('         ');{112}
    Lista.Add(GetRegistro113); {113}
    Lista.Add(GetRegistro113); {114} // issue IMPO-560
    //Lista.Add('         ');{114}
    Lista.Add('         ');{115}
    Lista.Add('         ');{116}
    Lista.Add('         ');{117}
    Lista.Add('         ');{118}
    Lista.Add('         ');{119}
    Lista.Add('danfe@mattel.com                   mattel.danfe@myindaia.com.br       ');
    Lista.Add('         ');{121}
    Lista.Add('         ');{122}
    Lista.Add('         ');{123}
    Lista.Add('N/Ref: ' + Query.FieldByName('NR_PROCESSO').AsString +
              ' S/Ref: ' + Query.FieldByName('NR_PROC_PO').AsString +
              ' DI: ' + Query.FieldByName('NR_DI').AsString +
              ' Valor Pis: ' + FormatFloat(',0.00', ValorPIS) +
              ' Valor Cofins: ' + FormatFloat(',0.00', ValorCOFINS) +
              ' Valor II: ' + FormatFloat(',0.00', Query.FieldByName('VL_TOTAL_II').AsFloat) +
              ' Taxa USD ' + FormatFloat(',0.0000', Query.FieldByName('TX_DOLAR').AsFloat)); {124}

    if Query.FieldByName('CD_CLIENTE').AsString = '03278' then {126}
    begin
      if (Query.FieldByName('CD_CLIENTE').AsString = '03278') and (Query.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') then
        Lista.Add('ICMS DIFERIDO _TRATAMENTO TRIBUTÁRIO DIFERENCIADO N° 235000005198010, RESOLUÇÃO N° 235000009124657_'+
                  ' _IMPORTAÇÃO - INCREMENTO DE INVESTIMENTOS -ATIVIDADE PORTUÁRIA E AEROPORTUARIA. TRATAMENTO DIVERSOS, DISPENSA DE GARANTIA MEDIANTE PAGTO, ANTECIPADO._')
      else
        Lista.Add('_TRATAMENTO TRIBUTÁRIO DIFERENCIADO N° 235000005198010, RESOLUÇÃO N° 235000009124657_'+
                  ' _IMPORTAÇÃO - INCREMENTO DE INVESTIMENTOS -ATIVIDADE PORTUÁRIA E AEROPORTUARIA. TRATAMENTO DIVERSOS, DISPENSA DE GARANTIA MEDIANTE PAGTO, ANTECIPADO._');
    end
    else
    begin
      Lista.Add(' Suspensão de 30% do ICMS devido no desembaraço aduaneiro, conforme Regime Especial Eletrônico nº 1210/2015, nos termos da Portaria CAT '); {125}
      Lista.Add('nº 108/2013 ' +
                ' BC DO ICMS 100% ' + FormatFloat(',0.00', TotalNota) +
                ' - BC DO ICMS 30% ' + FormatFloat(',0.00', TotalBaseCalcICMS30) +
                ' VALOR DO ICMS SUSPENSO ' + FormatFloat(',0.00', TotalICMSDevido) );
    end;

	  Lista.Add('         ');{127}
    Lista.Add('         ');{128}
    Lista.Add(Query.FieldByName('INFO_COMPL_CNTR').AsString);{129}

    for I := 1 to 18 do
      Lista.Add('         ');
    FNomeArquivo := StringReplace(FNomeArquivo, '.txt', '_'+FormataNumero(Seq,4)+'.txt', [rfReplaceAll]);
    if Msg <> '' then
    begin
      ShowMessage('Não foi possível gerar o arquivo.'+#13#10+'Motivos:'+Msg);
      Abort;
    end;
    Lista.SaveToFile(FNomeArquivo);
  finally
    Lista.Free;
  end;
end;

function TLeiauteSefazMattel.RequeridosHeader: string;
begin
  Result := '';
  if Trim(Query.FieldByName('UF_EMI_IBGE').AsString) = '' then
    Result := #13#10 + {001-01}'Favor informar cliente na DI (UF)';
  if Trim(Query.FieldByName('NM_CFOP').AsString) = '' then
    Result := #13#10 + {001-02}'Favor informar CFOP na adição da DI';
  if Trim(Query.FieldByName('COD_IBGE_CIDADE').AsString) = '' then
    Result := #13#10 + {001-10}'Favor informar cliente na DI (Cod IBGE)';

  if Trim(Query.FieldByName('CGC_EMPRESA').AsString) = '' then
    Result := #13#10 + {002-01}'Favor informar cliente na DI (CNPJ)';
  if Trim(Query.FieldByName('EI_NM_EMPRESA').AsString) = '' then
    Result := #13#10 + {002-02}'Favor informar cliente na DI (Razão Social)';
  if Trim(Query.FieldByName('EI_END_EMPRESA').AsString) = '' then
    Result := #13#10 + {002-05}'Favor informar cliente na DI (endereço)';
  if Trim(Query.FieldByName('EI_END_NUMERO').AsString) = '' then
    Result := #13#10 + {002-06}'Favor informar cliente na DI (numero-endereço)';

  if Trim(Query.FieldByName('EI_END_BAIRRO').AsString) = '' then
    Result := #13#10 + {003-08}'Favor informar cliente na DI (bairro';
  if Query.FieldByName('MUN_IMP_COD_IBGE').AsInteger = 0 then
    Result := #13#10 + {003-09}'Favor informar cliente na DI (Cod. Municipio)';
  if Trim(Query.FieldByName('EI_END_UF').AsString) = '' then
    Result := #13#10 + {003-11}'Favor informar cliente na DI (UF)';
  if Trim(Query.FieldByName('EI_END_CEP').AsString) = '' then
    Result := #13#10 + {003-12}'Favor informar cliente na DI (CEP)';
  if Trim(CodigoPaisBacen) = '' then
    Result := #13#10 + {003-13}'Favor informar cliente na DI (PAIS-BACEN)';
  if Trim(Query.FieldByName('NR_TELEFONE').AsString) = '' then
    Result := #13#10 + {003-15}'Favor informar cliente na DI (Telefone)';
  if Trim(Query.FieldByName('IE_EMPRESA').AsString) = '' then
    Result := #13#10 + {003-16}'Favor informar cliente na DI (Insc. Estadual)';

  if Trim(Query.FieldByName('EE_FO_NM_EMPRESA').AsString) = '' then
    Result := #13#10 + {004-03}'Favor informar o Exportador na DI';
  if Trim(Query.FieldByName('EE_FO_END_EMPRESA').AsString) = '' then
    Result := #13#10 + {004-04}'Favor informar o Exportador na DI(Endereço)';
  if Trim(Query.FieldByName('EE_FO_END_NUMERO').AsString) = '' then
    Result := #13#10 + {004-05}'Favor informar o Exportador na DI(Numero-Endereço)';
  if Trim(Query.FieldByName('EE_FO_END_COMPL').AsString) = '' then
    Result := #13#10 + {004-06}'Favor informar o Exportador na DI(Complemento)';

  if Query.FieldByName('PE_COD_BACEN').AsInteger = 0 then
    Result := #13#10 + {005-12}'Favor informar o Exportador (Pais)';
  if Trim(Query.FieldByName('PE_NM_PAIS').AsString) = '' then
    Result := #13#10 + {005-13}'Favor informar o Exportador (Pais)';
end;

function TLeiauteSefazMattel.RequeridosItens: string;
begin
  Result := '';
  if Trim(Query.FieldByName('CD_MERCADORIA').AsString) = '' then
    Result := #13#10 + {009-01}'Favor informar código da Mercadoria';

  if Trim(Query.FieldByName('TX_DESC_ESP_GTIN13').AsString) = '' then
    Result := #13#10 + {009-02}'Favor informar código EAN (Cadastro de mercadoria) '
                              + Query.FieldByName('CD_MERCADORIA').AsString;

  if (length(Query.FieldByName('TX_DESC_ESP').AsString) < 27) {and (now >= strtodatetime('02/07/2018 00:00'))} then
    Result := #13#10 + {009-02}'Favor informar código GTIN14 (Cadastro de mercadoria, campo "descrição espanhol", armazena o GTIN13 + GTIN14) '
                               +Query.FieldByName('CD_MERCADORIA').AsString;

  if Trim(Query.FieldByName('TX_DESC_DET_MERC').AsString) = '' then
    Result := #13#10 + {009-03}'Favor informar descrição da mercadoria';
  if Trim(Query.FieldByName('CD_NCM_SH').AsString) = '' then
    Result := #13#10 + {009-04}'Favor informar a NCM nos itens da DI';
  if Trim(Query.FieldByName('CD_CFOP').AsString) = '' then
    Result := #13#10 + {009-07}'Favor informar CFOP nas adições';
  if Query.FieldByName('QT_MERC_UN_COMERC').AsFloat = 0 then
    Result := #13#10 + {009-10}'Favor informar quantidade comercializada nos itens da DI';
  if (ValorBruto / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat) = 0 then
    Result := #13#10 + {009-11}'Favor informar Valor Unitário';
  if Query.FieldByName('QT_MERC_UN_COMERC').AsFloat = 0 then
    Result := #13#10 + {009-12}'Favor informar quantidade comercializada nos itens da DI';
  if ValorBruto = 0 then
    Result := #13#10 + {009-14}'Favor informar o valor CIF';
  if Trim(Query.FieldByName('NR_DECLARACAO_IMP').AsString) = '' then
    Result := #13#10 + {009-21}'Favor informar numero da DI';
  if ConverteData(Query.FieldByName('DT_REGISTRO_DI').AsString) = 0 then
    Result := #13#10 + {009-22}'Favor informar data da DI';
  if Trim(Query.FieldByName('LOCAL_DESEMBA').AsString) = '' then
    Result := #13#10 + {009-23}'Favor informar Armazem de Descarga (URF DESPACHO)';
  if Trim(Query.FieldByName('UF_DESEMBARACO').AsString) = '' then
    Result := #13#10 + {009-24}'Favor informar Armazem de Descarga (UF)';
  if Query.FieldByName('DT_REALIZACAO').AsDateTime = 0 then
    Result := #13#10 + {009-25}'Favor informar preencher data de Desembaraço no follow-up do processo';
  if Trim(Query.FieldByName('EE_FA_NR_CLIENTE').AsString) = '' then
    Result := #13#10 + {009-29}'Favor informar Exportador/Fabricante(cod cliente)';
  if CalculaValorBaseICMS = 0 then
    Result := #13#10 + {009-36}'Favor informar Base do ICMS';
  if (CalculaValorICMSItem = 0) and not ((Query.FieldByName('CD_CLIENTE').AsString = '03278') and (Query.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7')) then
    Result := #13#10 + {009-37}'Favor informar alíquota do ICMS';
  if ValorBaseCalculoIPI = 0 then
    Result := #13#10 + {009-52}'Favor informar base de calculo do IPI';
  if Query.FieldByName('VL_BASE_CALC_II').AsFloat = 0 then
    Result := #13#10 + {009-57}'Favor informar BASE do II';
  if Query.FieldByName('VL_TX_SCX_ITEM').AsFloat = 0 then
    Result := #13#10 + {009-125}'Favor informar valor da taxa de Siscomex';
end;

function TLeiauteSefazMattel.RequeridosFooter: string;
begin
  if TotalBaseCalcICMS = 0 then
    Result := #13#10 + {100-01}'Favor verificar base de calculo do ICMS';
  if Query.FieldByName('VL_TOTAL_TX_SCX').AsFloat = 0 then
    Result := #13#10 + {100-13}'Favor verificar valor da Taxa de Siscomex';

  if Trim(Query.FieldByName('CNPJ_TRANSP_ROD').AsString) = '' then
    Result := #13#10 + {102-02}'Favor verificar dados da transportadora (CNPJ)';
  if Trim(Query.FieldByName('NM_TRANSP_ROD').AsString) = '' then
    Result := #13#10 + {100-04}'Favor verificar dados da transportadora (Razão Social)';
  if Trim(SomenteNumero(Query.FieldByName('IE_TRANSP_ROD').AsString)) = '' then
    Result := #13#10 + {100-05}'Favor verificar dados da transportadora (Inscrição Estadual)';
  if Trim(Query.FieldByName('END_TRANSP_ROD').AsString) = '' then
    Result := #13#10 + {002-06}'Favor verificar dados da transportadora (Endereço)';
  if Trim(Query.FieldByName('END_CIDADE').AsString) = '' then
    Result := #13#10 + {002-07}'Favor verificar dados da transportadora (Municipio)';
  if Trim(Query.FieldByName('UF_TRANSPORTADOR').AsString) = '' then
    Result := #13#10 + {002-08}'Favor verificar dados da transportadora (UF)';

  if Query.FieldByName('QT_VOLUME_CARGA').AsInteger = 0 then
    Result := #13#10 + {103-22}'Favor informar volumes da DI';
  if Trim(Query.FieldByName('TIPO_EMBALAGEM').AsString) = '' then
    Result := #13#10 + {103-23}'Favor informar volumes da DI';

  if (Trim(NR_CNTR) = '') and
     (not (Trim(Query.FieldByName('CD_VIA_TRANSP_CARG').AsString) = '04')) then
    Result := #13#10 + {103-24}'Favor verificar a numeração dos containeres';
  if (Trim(NumeroVolumes) = '') and
     (not (Trim(Query.FieldByName('CD_VIA_TRANSP_CARG').AsString) = '04')) then
    Result := #13#10 + {103-25}'Favor verificar a numeração dos containeres';

  if Query.FieldByName('PL_CARGA').AsFloat = 0 then
    Result := #13#10 + {103-26}'Favor informar peso liquido na DI';
  if Query.FieldByName('PB_CARGA').AsFloat = 0 then
    Result := #13#10 + {103-27}'Favor informar peso bruto na DI';
end;

function TLeiauteSefazMattel.GetRegistro113: string;
var
  Linha: string;
begin
  InsertStrAt(195, 2, '90', Linha);
  InsertStrAt(197, 16, FormataValor(0, 16, 2, True), Linha);
  Result := Linha;
end;

end.


