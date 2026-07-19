<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300

Dim sem_cobertura
Dim nr_invoice
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo,Data_Fatura
Dim vl_tot_nao_tributavel,vl_sub_tot_tributavel,vl_comissao,vl_tot_geral, dias_Corridos,Buscaprocesso, vl_recuperado
Dim vedtCodItem,vedtNmItem,vdata,vValor,id,vUrl,txCondicao,dtDocs,Condicao,check,ValEmbalagem

Function fnc_ValorSaldo(vl_item, vl_saldo)
'calcula o valor do saldo
  If Not ( objrs("CD_TIPO_ITEM") = "B" or objrs("CD_TIPO_ITEM") = "C" ) Then
    vl_saldo = vl_saldo + vl_item
  Else
    vl_saldo = vl_saldo
  End If
  'retorna o valor do saldo
  fnc_ValorSaldo = vl_saldo
End Function

aCondicao = Array("INVOICE - especial","Registro da DI","Conhecimento Embarque","INVOICE","PROFORMA","")
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nm_tela = tx_lang_A00094(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
<style type="text/css">
td {
	font-size: 10px;
}

.instrucao {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}

.azulEscuro {
	background: #336699;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}
.azulClaro {
	background: #7799CC;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}

.branco {
	background: #FFFFFF;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}

.cinza {
	background: #DDDDDD;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}
.cinzaClaro {
	background: #EEEEEE;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}
.style2 {height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style5 {color: #339966;	font-weight: bold;}
.style6 {color: #FF0000}
.style18 {color: #7799CC}
.style13 {color: #FFFFFF}
.style15 {	color: #7799CC;
	font-weight: bold;
}
.style17 {color: #FF0000; font-weight: bold; }
</style>
</head>
<body style="overflow:auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td>
<%
		If Request.form("AgrupaItens") = "on" Then
	sql = "select NR_PROCESSO, NR_DI, NR_CONHECIMENTO, TP_FRETE, CD_VIA_TRANSPORTE, "&_
	" DT_EMBARQUE, DT_REGISTRO_DI, DT_CHEGADA_CARGA, CD_INCOTERM, VL_TOTAL_FRETE_MN, "&_
	" TX_DOLAR, TX_MLE, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, "&_
	" VL_TOTAL_II, VL_TOTAL_IPI, VL_RECUPERADO, NR_REFERENCIA, NR_ITEM, SUM(QT_MERC_UN_COMERC)AS QT_MERC_UN_COMERC, SUM(VL_MLE_ITEM) AS VL_MLE_ITEM, CD_FABR_EXPO,  "&_
	" CD_MERCADORIA, VL_SDA, VL_INSS, NM_MERCADORIA, IN_TIPO_M_E, NR_CLIENTE, AP_EXPORTADOR, NM_FORNECEDOR, NM_FABRICANTE, "&_
	" VL_CIF_MN, NM_UNID_MED, UNID_MED, NM_MOEDA_MLE, SIGLA_MOEDA_MLE, NM_MOEDA_SEGURO, NM_TRANSP_ROD, NM_EMBARCACAO, "&_
	" NM_LOCAL_EMBARQUE, NM_LOCAL_DESEMBARQUE, CD_GRUPO, DT_ENVIO_DOCS, DT_FATURA, NM_TRANSP, NM_AREA, VL_DESPESA_INDAIA, "&_
	" VL_FRETE_INDAIA, VL_CAPATAZIA, VL_SDA2 "&_
	" from (SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA, ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, DM.CD_UN_MED_COMERC AS UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
				"   CASE DI.CD_MOEDA_MLE WHEN '790' THEN 'BRL' WHEN '220' THEN 'USD' WHEN '978' THEN 'EURO	' "&_
        "     ELSE (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) END AS SIGLA_MOEDA_MLE, "&_
				"  (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO) AS NM_MOEDA_SEGURO,"&_
				"  (SELECT AP_TRANSP_ROD FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = PR.CD_TRANSP_NAC) AS NM_TRANSP_ROD, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMBARQUE, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMBARQUE, "&_
				"  (SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_CLIENTE) AS CD_GRUPO, "&_
				"  (SELECT DATEADD(day, -1, DT_REALIZACAO) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '001') AS DT_ENVIO_DOCS, "&_
				"  (SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '092') AS DT_FATURA, "&_
				"  (SELECT UPPER(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_TRANSP, "&_
				"  (SELECT NM_AREA FROM TAREA (NOLOCK) WHERE CD_AREA = PR.CD_AREA) AS NM_AREA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(CASE CC.IN_RESTITUI "&_
				"                              WHEN '0' THEN CC.VL_ITEM "&_
				"                              ELSE CC.VL_ITEM *(-1) "&_
				"                             END), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC CC ( NOLOCK ) "&_
				" INNER JOIN BROKER.DBO.TS_FATURA TSF (NOLOCK) ON  TSF.CD_UNID_NEG = CC.CD_UNID_NEG "&_
        "  AND TSF.CD_PRODUTO = CC.CD_PRODUTO "&_
        "  AND TSF.NR_SOLICITACAO = CC.NR_SOLIC_FAT "&_
        "  AND TSF.TP_TIPO_FAT = 'F' "&_
				"           WHERE CC.NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(CC.IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CC.CD_ITEM AS INT) < 900), 0)) AS VL_DESPESA_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_FRETE_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA2, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_INSS "&_	
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN VW_SERVICO_GERAL SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' ) as tabela"&_
				" GROUP BY NR_PROCESSO, NR_DI, NR_CONHECIMENTO, TP_FRETE, CD_VIA_TRANSPORTE, "&_
				" DT_EMBARQUE, DT_REGISTRO_DI, DT_CHEGADA_CARGA, CD_INCOTERM, VL_TOTAL_FRETE_MN, "&_
				" TX_DOLAR, TX_MLE, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, "&_
				" VL_TOTAL_II, VL_TOTAL_IPI, VL_RECUPERADO, NR_REFERENCIA, NR_ITEM, CD_FABR_EXPO,  "&_
				" CD_MERCADORIA, VL_SDA, VL_INSS, NM_MERCADORIA, IN_TIPO_M_E, NR_CLIENTE, AP_EXPORTADOR, NM_FORNECEDOR, NM_FABRICANTE, "&_
				" VL_CIF_MN, NM_UNID_MED, UNID_MED, NM_MOEDA_MLE, SIGLA_MOEDA_MLE, NM_MOEDA_SEGURO, NM_TRANSP_ROD, NM_EMBARCACAO, "&_
				" NM_LOCAL_EMBARQUE, NM_LOCAL_DESEMBARQUE, CD_GRUPO, DT_ENVIO_DOCS, DT_FATURA, NM_TRANSP, NM_AREA, VL_DESPESA_INDAIA, "&_
				" VL_FRETE_INDAIA, VL_CAPATAZIA, VL_SDA2"&_
				" ORDER BY NR_REFERENCIA, NR_ITEM"
		else
		sql = "SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA,  ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, DM.CD_UN_MED_COMERC AS UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
				"   CASE DI.CD_MOEDA_MLE WHEN '790' THEN 'BRL' WHEN '220' THEN 'USD' WHEN '978' THEN 'EURO	' "&_
        "     ELSE (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) END AS SIGLA_MOEDA_MLE, "&_
				"  (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO) AS NM_MOEDA_SEGURO,"&_
				"  (SELECT AP_TRANSP_ROD FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = PR.CD_TRANSP_NAC) AS NM_TRANSP_ROD, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMBARQUE, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMBARQUE, "&_
				"  (SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_CLIENTE) AS CD_GRUPO, "&_
				"  (SELECT DATEADD(day, -1, DT_REALIZACAO) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '001') AS DT_ENVIO_DOCS, "&_
				"  (SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '092') AS DT_FATURA, "&_
				"  (SELECT UPPER(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_TRANSP, "&_
				"  (SELECT NM_AREA FROM TAREA (NOLOCK) WHERE CD_AREA = PR.CD_AREA) AS NM_AREA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(CASE CC.IN_RESTITUI "&_
				"                              WHEN '0' THEN CC.VL_ITEM "&_
				"                              ELSE CC.VL_ITEM *(-1) "&_
				"                             END), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC CC ( NOLOCK ) "&_
				" INNER JOIN BROKER.DBO.TS_FATURA TSF (NOLOCK) ON  TSF.CD_UNID_NEG = CC.CD_UNID_NEG "&_
        "  AND TSF.CD_PRODUTO = CC.CD_PRODUTO "&_
        "  AND TSF.NR_SOLICITACAO = CC.NR_SOLIC_FAT "&_
        "  AND TSF.TP_TIPO_FAT = 'F' "&_
				"           WHERE CC.NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(CC.IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CC.CD_ITEM AS INT) < 900), 0)) AS VL_DESPESA_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_FRETE_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA2, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_INSS "&_	
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN VW_SERVICO_GERAL SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
		end if		

	With objcmd
		.CommandTimeOut = 120
		.CommandText = sql
		.CommandType = adCmdText
	End With
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'******************************************************************************************** Flavio - 31/03/2008	
        Buscaprocesso=CStr(Request.QueryString("nr_processo"))
		'Response.Redirect("../IMPORT/teste.asp?var1="&Buscaprocesso&"")
		With objcmd
			.CommandTimeOut = 9999
			.CommandText    = "sp_Importacao_Custeio3"
			.CommandType    = adCmdStoredProc
			.Parameters.Append = .CreateParameter("@nr_processo"   , adChar   , adParamInput,   18, Buscaprocesso )
			.Parameters.Append = .CreateParameter("@vl_tot_nao_tributavel", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_sub_tot_tributavel", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_comissao", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_tot_geral", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_recuperado", adCurrency, adParamOutPut, 14)
			.Execute , , adExecuteNoRecords
			vl_tot_nao_tributavel = .Parameters("@vl_tot_nao_tributavel")
			vl_sub_tot_tributavel = .Parameters("@vl_sub_tot_tributavel")
			vl_comissao = .Parameters("@vl_comissao")
			vl_tot_geral = .Parameters("@vl_tot_geral")
			vl_recuperado = .Parameters("@vl_recuperado")
		End With
'*******************************************************************************************************************		
	If objrs.RecordCount > 0 Then
		'REFERENCIAS
		sql = "SELECT DISTINCT CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND TP_REFERENCIA = '01' ORDER BY CD_REFERENCIA"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_referencia = ""
			Do while not objrsx.Eof
				nr_referencia = nr_referencia & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else nr_referencia = nr_referencia &"<br>"
			Loop
		End If
		objrsx.Close
		'INVOICE 
		sql = "SELECT NR_DCTO_INSTRUCAO,DT_FATURA FROM TDOCUMENTO_INSTRUCAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_TIPO_DCTO_INSTR = '01'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_invoice = ""
		    Data_Fatura=Trim(objrsx.Fields.Item("DT_FATURA").Value)
			Do while not objrsx.Eof
				nr_invoice = nr_invoice & Trim(objrsx.Fields.Item("NR_DCTO_INSTRUCAO").Value)
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else nr_invoice = nr_invoice &"<br>"
			Loop
		End If
		objrsx.Close
		'NOTA FISCAL
		sql = "SELECT NR_NOTA, DT_NOTA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND IN_CANCELADO = '0'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_nf = ""
			dt_nf = ""
			txNotaFiscal = ""
			Do while not objrsx.Eof
				nr_nf = "&nbsp;"& Trim(objrsx.Fields.Item("NR_NOTA").Value) &"&nbsp;&nbsp;"
				dt_nf = fnc_Mascara(objrsx.Fields.Item("DT_NOTA").Value, 5)
				txNotaFiscal = txNotaFiscal & nr_nf & dt_nf
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else txNotaFiscal = txNotaFiscal &"<br>"
			Loop
		End If
		objrsx.Close
		
		'somente para saint goban
		if objrs.Fields.Item("CD_GRUPO") = "028" then
			txObs = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. <u>Retirar o B/L original com o Agente;</u><br>"&_
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <u>Para transporte favor procurar Sr. Rafael(Sigma) - Tel.(13)3203-1112.</u>"
		end if
		
		If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then
					'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA2").Value, 2)
					vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+(objrs.Fields.Item("VL_SDA2").Value*0.2)+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))'-vl_recuperado
		Else
		'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)
		'if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    	'sql = " SELECT COUNT(CD_ITEM) as contador FROM TFATURAMENTO_CC"&_
		'	" WHERE NR_PROCESSO = '" & nr_processo & "'"&_
		'	" AND CD_ITEM IN ('025','032','027','600','599')"
    	'objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		'if objrsx("contador") <> "0" Then
		'	vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))-vl_recuperado
		'Else
			vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))
		'End If

		end if
		'vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+objrs("VL_TOTAL_SEG_MN")-objrs("VL_RECUPERADO")
		
		vlNota = objrs("VL_CIF_MN")+objrs("VL_TOTAL_II")
		vlDesp = objrs("VL_DESPESA_INDAIA")-objrs("VL_RECUPERADO")-objrs("VL_TOTAL_II")-objrs("VL_FRETE_INDAIA")-objrs("VL_CAPATAZIA")
		if objrs("TP_FRETE") = "0" then
			vlDif = objrs("VL_FRETE_INDAIA")-objrs("VL_TOTAL_FRETE_MN")
		else
			vlDif = 0
		end if
		
		select case objrs.fields.item("CD_FABR_EXPO").value
			case 1 vTxFabric = objrs.Fields.Item("AP_EXPORTADOR").Value
			case 2 vTxFabric = objrs.Fields.Item("NM_FABRICANTE").Value
			case 3 vTxFabric = ""
		end select
		
		select case objrs.fields.item("IN_TIPO_M_E").value
			case "M" vTipoImport = "Matéria-Prima"
			case "E" vTipoImport = "Equipamentos"
			case "R" vTipoImport = "Revenda"
			case "C" vTipoImport = "Consumo"
			case "A" vTipoImport = "Ativo"
			case else vTipoImport = ""
		end select
		
		select case objrs.fields.item("IN_TIPO_M_E").value
			case "M","E","R","C","A"  vInIPIRec = "sim"
			case else vInIPIRec = "não"
		end select
''******************************************************************************************** Flavio - 31/03/2008	
'        Buscaprocesso=CStr(Request.QueryString("nr_processo"))
'		'Response.Redirect("../IMPORT/teste.asp?var1="&Buscaprocesso&"")
'		With objcmd
'			.CommandTimeOut = 60
'			.CommandText    = "sp_Importacao_Custeio"
'			.CommandType    = adCmdStoredProc
'			.Parameters.Append = .CreateParameter("@nr_processo"   , adChar   , adParamInput,   14, Buscaprocesso )
'			.Parameters.Append = .CreateParameter("@vl_tot_nao_tributavel", adChar, adParamOutPut, 14)
'			.Parameters.Append = .CreateParameter("@vl_sub_tot_tributavel", adChar, adParamOutPut, 14)
'			.Parameters.Append = .CreateParameter("@vl_comissao", adChar, adParamOutPut, 14)
'			.Parameters.Append = .CreateParameter("@vl_tot_geral", adChar, adParamOutPut, 14)
'			.Execute , , adExecuteNoRecords
'			vl_tot_nao_tributavel = .Parameters("@vl_tot_nao_tributavel")
'			vl_sub_tot_tributavel = .Parameters("@vl_sub_tot_tributavel")
'			vl_comissao = .Parameters("@vl_comissao")
'			vl_tot_geral = Ccur(vl_tot_nao_tributavel)+Ccur(vl_comissao)
'			'.Parameters("@vl_tot_geral")
'		End With
''*******************************************************************************************************************		
		vNrDias = Request.QueryString("nrDias")
		vTxCondicao = Request.QueryString("txCondicao")
		vDtDocto = Request.QueryString("dtDocs")
	'response.Write(vNrDias)
'		With objcmd
'			.CommandTimeOut = 60'
'			.CommandText    = "sp_calc_dias_uteis"
'			.CommandType    = adCmdStoredProc
'			.Parameters.Append = .CreateParameter("@dt_ini", adDate, adParamInput, 10, vDtDocto)
'			.Parameters.Append = .CreateParameter("@nr_dia", adInteger, adParamInput, 4, vNrDias)
'			.Parameters.Append = .CreateParameter("@dt_fim", adDate, adParamOutPut)
'			.Execute , , adExecuteNoRecords
'			vDtVencto = .Parameters("@dt_fim")
'		End With
'	  vDtVencto = DateAdd("d", vNrDias, Data_Fatura)

'		if vTxCondicao = 1 then
'			if Day(vDtVencto) < 15 then
'				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
'			elseif Day(vDtVencto) > 15 then
'				vDtVencto = DateAdd("m", 1, vDtDocto)
'				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
'			end if
'		end if
'		
		if objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" then
			vTipoTransp = objrs.Fields.Item("NM_EMBARCACAO").Value
		else
			vTipoTransp = objrs.Fields.Item("NM_TRANSP").Value
		end if
  end if

if vNrDias = "sem_cobertura" then
			sem_cobertura = 1
		else
			sem_cobertura = 0
		End If
		

If vNrDias = "Antecipado" or vNrDias = "sem_cobertura"  then
	vNrDias=0
	If vTxCondicao = 5 then
		If sem_cobertura = 1 Then
			aCondicao(vTxCondicao)=UCase(tx_lang_TDE026(cd_lang))
		Else
			aCondicao(vTxCondicao)=UCase(tx_lang_TDE027(cd_lang))
		End If
	End if
End if
 
vDtVencto = DateAdd("d", vNrDias, Data_Fatura)
select case vTxCondicao
		Case 0 ' Invoice Especial
			if Day(vDtVencto) < 15 then 'Data_Fatura
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
				'dias_Corridos= DateDiff("d", vDtDocto, vDtVencto)
				dias_Corridos= DateDiff("d", fnc_Mascara(Data_Fatura,5), vDtVencto)
			elseif Day(vDtVencto) > 15 then	  
				vDtVencto = DateAdd("m", 1, vDtVencto)
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
				dias_Corridos= DateDiff("d", Data_Fatura, vDtVencto)
				if Month(vDtVencto) = 1 then
				  vDtVencto = DateAdd("y", 1, vDtVencto)
				end if	
				'vDtVencto = DateSerial(Year(Data_Fatura), Month(Data_Fatura), 15)
			end if
		Case 1 'Registro da Di - dias corridos a partir da data da Di ***************** OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5), vDtVencto)
				
		Case 2 ' Conhecimento de embarque - dias corridos a partir da data do conhecimento  OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5), vDtVencto)
				
		Case 3 'Invoice - dias corridos a partir da data da Invoice =(fnc_Mascara(Data_Fatura, 5))***************** OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(Data_Fatura, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(Data_Fatura, 5), vDtVencto)
		Case 5 'Antecipado 
				vDtVencto = "-"
				dias_Corridos= "0"	
end select

%>
<table border="0" cellspacing="2" cellpadding="0">

	<tr>
	  <td valign="top" style="border: solid 1px #336699;">
		  <table border="0" cellpadding="1" cellspacing="1">
				<col width="275">
				<col width="250">
				<col width="225">
				<col width="135">
				<col width="175">
				<tr height="45">
					<td colspan="5" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><%= tx_lang_A00094(cd_lang)%></b></div></td>
				</tr>
				<tr height="30">
					<td class="azulClaro"><b>REFER&Ecirc;NCIA</b></td>
					<td class="cinza"><div align="center"><%= nr_referencia%></div></td>
					<td class="azulClaro"><b>DATA</b></td>
					<td class="cinza"><div align="center"><%= fnc_Mascara(vDtDocto, 5)%></div></td>
					<td rowspan="2" class="azulClaro"><div align="center" style="font-size:12px;"><b><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></b></div></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;FORNECEDOR:</b></div></td>
					<td colspan="2" class="cinzaClaro"><%= objrs.Fields.Item("NM_FORNECEDOR").Value%></td>
					<td class="cinzaClaro"><%= objrs.Fields.Item("NR_CLIENTE").Value%></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;Documentos:</b></div></td>
					<td class="azulClaro"><b>Original</b></td>
					<td class="azulClaro"><b>C&oacute;pia</b></td>
					<td class="cinza"><%= fnc_Mascara(Data_Fatura, 5)%></td>
				  <td rowspan="3" class="azulEscuro"><div align="center"><b>INFO GERAL PARA DI</b></div></td>
				</tr>
				<tr height="135">
					<td class="cinzaClaro" valign="top"><div align="left">&nbsp;Invoice</div></td>
					<td rowspan="3" class="cinzaClaro" valign="top" style="border-style: none;"><div align="right"><%= nr_invoice%></div></td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
				</tr>
        <tr>
	        <td class="cinzaClaro">&nbsp;</td>
				</tr>
				<tr>
	        <td class="cinzaClaro">&nbsp;</td>
					<td class="azulClaro">TRANSPORTE</td>
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" ><div align="left"><b>&nbsp;NOTAS:</b></div></td>
					<td colspan="3" rowspan="2" class="cinza" style="font-size: 8px;"><%= txObs%></td>
          <td class="cinza"><div align="center"><%= vTipoTransp%></div></td>
				</tr>
				<tr>
					<td class="azulClaro">B/L ou AWB</td>					
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;C&Acirc;MBIO</b></div></td>
					<td class="azulClaro" style="border-style: none;">CONDI&Ccedil;&Otilde;ES</td>
					<td class="azulClaro" style="border-style: none;">VENCTO</td>
					<td class="azulClaro" style="border-style: none;">DIAS(corridos)</td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NR_CONHECIMENTO").Value%></div></td>					
				</tr>
				<tr>
                	<%if aCondicao(vTxCondicao)=UCase(tx_lang_TDE027(cd_lang)) or aCondicao(vTxCondicao)=UCase(tx_lang_TDE026(cd_lang))then%>
                    <td class="cinza">&nbsp;<%= aCondicao(vTxCondicao)%></td>
                     <%else%>
					<td class="cinza">&nbsp;<%= vNrDias &" DIAS "& aCondicao(vTxCondicao)%></td>
                   <%end if%>
					<td class="cinza"><div align="right">
					  <%iF fnc_Mascara(Data_Fatura, 5)<>"" THEN%>
					  <%= fnc_Mascara(vDtVencto, 5)%>
					  <%END IF%>
				    &nbsp;</div></td>
					<td class="cinza"><div align="right"><%=dias_Corridos%>
					    <% 'DateDiff("d", vDtDocto, vDtVencto)%>
			      &nbsp;</div></td>
          <td class="azulClaro">PORTO DE SA&Iacute;DA </td>
				</tr>
				<tr>
				  <td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><strong><span class="style18">.</span>TOTAL DA FATURA</strong> (sem desconto)</div></td>
				  <td class="cinzaClaro"><div align="right"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></div></td>
				  <td class="cinzaClaro"><div align="right"><span class="style5"><%=FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value,2)%>
				      <%'= FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value, 2)%>
			      </span></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
				  <td class="cinzaClaro">&nbsp;</td><%if request("ValEmbalagem")=" "  or request("ValEmbalagem")="" then ValEmbalagem=0 else ValEmbalagem=request("ValEmbalagem") end if%>
			  </tr>
				<tr>
				  <td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b> <span class="style18">.</span>EMBALAGEM</b></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
				  <td class="cinzaClaro"><div align="right"><span class="style17">(<%=FormatNumber(ValEmbalagem,2)%>)</span></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
				  <td class="cinzaClaro">&nbsp;</td>
			  </tr>
				<tr>
					<td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;<span class="style15"><span class="style13">VALOR </span></span><strong>TOTAL DA FATURA</strong></b></div></td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></div></td>
					<td class="cinzaClaro"><div align="right"><strong><%=FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value-ValEmbalagem,2)%></strong></div></td>
					<td class="cinzaClaro">&nbsp;</td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_EMBARQUE").Value%></div></td>
				</tr>
				<tr>
					<td colspan="4" rowspan="2" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>C&Aacute;LCULO CUSTO</b></div></td>
					<td class="azulClaro">DATA SA&Iacute;DA </td>
				</tr>
				<tr>
          <td class="cinza"><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;<%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("TX_MLE").Value, 7)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">PORTO CHEGADA </td>
					</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2"><b>&nbsp;VALOR DA FATURA EM R$</b></td>
					<td><div align="right"><b><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_MLE_MN").Value-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value),2)%></b>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="cinza"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_DESEMBARQUE").Value%></div></td>
				</tr>
				<tr>
					<td colspan="4" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><b>&nbsp;CONTABILIZA&Ccedil;&Atilde;O</b></b></div></td>
					<td class="azulClaro">DATA CHEGADA </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="4" class="style2">&nbsp;DESPESAS:</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_CHEGADA_CARGA").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;<%= Trim(Mid(nr_processo, 5, 13))%></td>
					<td><i>&nbsp;INDAIA</i></td>
					<td><div align="right"><%=formatnumber(vl_tot_geral,2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">FABRICANTE</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;INSS s/ S.D.A. n.&ordm; </td>
					<td><div align="right">
					  <%If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then%>
					  <%= FormatNumber(objrs.Fields.Item("VL_SDA2").Value, 2)%>
					  <%else%>
					  <%= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)%>
					  <%end if%>
				  &nbsp;</div></td>
					<td><div align="right">
					  <%If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then%>
					  <%= FormatNumber(objrs.Fields.Item("VL_SDA2").Value*0.2, 2)%>
					  <%else%>
					  <%= FormatNumber(objrs.Fields.Item("VL_INSS").Value, 2)%>
					  <%end if%>
				  &nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= vTxFabric%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td class="azulClaro">EXPORTADOR</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;IPI SOBRE IMPORTA&Ccedil;&Atilde;O </td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("AP_EXPORTADOR").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;I.C.M.S., COFINS E I.P.I.</td>
					<td>&nbsp;RECUPERADO</td>
					<td><div align="right" style="color: #FF0000;">(<%= FormatNumber(vl_recuperado, 2)%>)&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">INCOTERM</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;SEGURO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style6"><%= LCase(objrs.Fields.Item("NM_MOEDA_SEGURO").Value)%></span></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOT_SEGURO_MNEG").Value, 2)%>&nbsp;</div></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_SEG_MN").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("CD_INCOTERM").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2" >&nbsp;</td>
					<td ><div align="right">0,00&nbsp;</div></td>
					<td >&nbsp;</td>
					<td class="azulClaro">TIPO IMPORTA&Ccedil;&Atilde;O </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;Transporte Nacional</td>
					<td>&nbsp;<span class="style6"><i><b><%= UCase(objrs.Fields.Item("NM_TRANSP_ROD").Value)%></b></i></span></td>
					 <%If objrsx.state = adstateOpen then objrsx.close()
					sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "'"&_
					 " AND CD_ORIGEM_LANC = '5' "&_
					      " AND CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	  
					%>
					<td><div align="right"><%= FormatNumber((objrsx.Fields.Item("VL_ITEM").Value),2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= UCase(vTipoImport)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;Tranporte Internacional </td>
					<td>&nbsp;</td>
					<td><div align="right"><%= FormatNumber(0,2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">MATERIAL</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;Armazenagem</td>
					<td>&nbsp;</td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("NM_MERCADORIA").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td rowspan="3" class="azulEscuro"><div align="center"><b>INFO GERAL CUSTO</b></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2" class="style2"><div style="font-size: 12px;">&nbsp;CUSTO TOTAL DA IMPORTA&Ccedil;&Atilde;O</div></td>
					<td><div align="right"><b><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</b></div></td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>					
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b>&nbsp;NOTA(S) FISCAL NR. </b></td>
					<td><b>&nbsp;VALOR DA N.FISCAL</b></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b>DATA CUSTO</b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td><%= txNotaFiscal%></td>
					<td><div align="right"><%= FormatNumber(vlNota, 2)%>&nbsp;</div></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;NF COMPLEMENTAR </td>
					<td><div align="right"><%= FormatNumber((vlTotal-vlNota-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b>Imposto Importa&ccedil;&atilde;o </b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_II").Value, 2)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b> &nbsp;TOTAL DA MERCADORIA:</b></td>
					<td>&nbsp;</td>
					<td><div align="right"><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center">D.I.</div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2"><b>&nbsp;TOTAL DO IPI: </b></td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
				  <td class="azulClaro"><div align="center">TAXA US$</div></td>	
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;IPI RECUPER&Aacute;VEL? (S/N)</td>
					<td><div align="center"><b><%= vInIPIRec%></b></div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("TX_DOLAR").Value, 7)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center">PLANTA</div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;TOTAL DA NOTA FISCAL: </td>
					<td><div align="right"><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td ><div align="center"><%= objrs.Fields.Item("NM_AREA").Value%></div></td>
				</tr>
			</table>
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr height="45">
					<td colspan="5" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>Despesas</b></div></td>
				</tr>
<%If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT DISTINCT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','027','026','600','599','032','025','002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)
	vl_item  = 0
	vl_saldo = 0
	credito  = "0,00"
	debito   = "0,00"
	saldo    = "0,00"

in_restitui = False
'seleciona os itens restituidos
'If objrsx.State = adStateOpen Then objrsx.Close
'sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
'			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
'			"WHERE F.CD_ITEM = I.CD_ITEM "&_
'			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
'			"  AND F.IN_CANCELADO = 0 "&_
'			"  AND F.IN_RESTITUI  = 1 "&_
'			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
'			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
'			"GROUP BY F.NR_PROCESSO, F.CD_ITEM"
'objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'If objrsx.RecordCount > 0 Then in_restitui = True

If objrs.Eof Then
%>
					<tr>
					  <td>&nbsp;</td>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
Else
  If objrs.RecordCount < 15 Then col = 86 Else col = 70
  contador_b = 1
  Do While Not objrs.Eof
	If objrsf.State = adStateOpen Then objrsf.Close
	sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ITEM = '"&objrs.Fields.Item("CD_ITEM").Value&"' "  &_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM NOT IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
    'alterna a cor das linhas
		If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
		'calculo do valor do item
		vl_item = objrs.Fields.Item("VL_ITEM").Value
		'verifica se ocorreu restituicao
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			str = "CD_ITEM = "& fnc_QuotedSQL(objrs.Fields.Item("CD_ITEM").Value)
			objrsx.Find str, 0, adSearchForward
			'verifica se o registro foi encontrado
'			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 0) > 0 Then
			'verifica se &eacute; d&eacute;bito ou cr&eacute;dito
			credito = ""
			debito  = ""
			If objrs.Fields.Item("TP_NATUREZA").Value = "C" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
			
				vl_saldo = fnc_ValorSaldo(vl_item, vl_saldo)
				'verifica se o saldo &eacute; positivo ou negativo
				If Round(vl_saldo, 0) >= 0 Then
					saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
				Else
					saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
	
				End If
			If varCheck=1 then bgcolor="#FFCC99"
			
				%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td width="342"><%= Trim(objrs.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="62" align="right"><%= saldo%></td>
					</tr>
					<%
			objrs.MoveNext
		Else
			objrs.MoveNext
		End If
		
		If objrs.Eof Then Exit Do
	Loop
End If
%>
<tr height="18">
						<td colspan="3"><i><%= tx_lang_POP030(cd_lang)%></i></td>
						<td colspan="1" align="right"><b><%= tx_lang_POP024(cd_lang)%>:</b></td>
						<td align="right"><b><%= saldo%></b></td>
					</tr>
<%
objrs.Close
'objrsx.Close

                If objrs.State = adStateOpen Then objrsy.Close
If Not InStr("028;949;503", Session("cd_grupo_despacho")) <> 0 Then
    sql = "SELECT DISTINCT NR_PROCESSO_COMPLETO AS NR_PROCESSO, CONVERT(VARCHAR, DT_CALCULO, 103) AS DATA, VL_TOT_ICMS AS VL_ICMS, "&_
    "    VL_TOTAL_IPI AS VL_IPI, ISNULL(VL_PIS,0) AS VL_PIS, ISNULL(VL_COFINS,0) AS VL_COFINS, VL_TRIBUTO_PAGO AS VL_SISCOMEX, VL_TOTAL_II AS VL_II  "&_   
    "    FROM BROKER.DBO.VW_RESUMO_DI "&_
    "    WHERE NR_PROCESSO_COMPLETO = '" & nr_processo & "' "
Else
    sql = "SELECT DISTINCT DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4) AS DATA, SUM(ISNULL(AI.VL_ICMS_A_RECOLHER,0)) AS VL_ICMS, "&_
	" SUM(ISNULL(TR.VL_IPT_A_RECOLHER,0)) AS VL_IPI, SUM(ISNULL(AI.VL_PIS,0)) AS VL_PIS, SUM(ISNULL(AI.VL_COFINS,0)) AS VL_COFINS, SUM(ISNULL(AI.VL_TX_SCX_AD,0)) AS VL_SISCOMEX, SUM(ISNULL(TR2.VL_IPT_A_RECOLHER,0)) AS VL_II "&_
    " FROM TDECLARACAO_IMPORTACAO DI "&_
    " LEFT JOIN TADICAO_DE_IMPORTACAO AI ON (AI.NR_PROCESSO = DI.NR_PROCESSO)"&_
	" LEFT JOIN TRIBUTO TR ON (TR.NR_PROCESSO = AI.NR_PROCESSO AND TR.NR_ADICAO = AI.NR_ADICAO AND TR.CD_RECEITA_IMPOSTO = '0002')" &_
	" LEFT JOIN TRIBUTO TR2 ON (TR2.NR_PROCESSO = AI.NR_PROCESSO AND TR2.NR_ADICAO = AI.NR_ADICAO AND TR2.CD_RECEITA_IMPOSTO = '0001')" &_
    " WHERE DI.NR_PROCESSO = '"& nr_processo & "'"&_
	" GROUP BY DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4)"&_
    " ORDER BY DI.NR_PROCESSO "
End If
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'objrsx.Close
%>
                
				<tr height="45">
					<td colspan="6" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>Impostos/Despesas (Cliente)</b></div></td>
				</tr>
                <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">027-ICMS</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_ICMS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">026-IPI</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_IPI").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">600-PIS/PASEP IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_PIS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">599-COFINS - IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_COFINS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>  
                    <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">032-TAXA SISCOMEX</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_SISCOMEX").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>
                     <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrs.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">025-IMP. DE IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrs.Fields.Item("VL_II").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>     
                      <%
                   If objrsf.State = adStateOpen Then objrsf.Close
	        sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
			
			Do While Not objrsf.Eof
			%>
        		<tr bgcolor="#FFCC99">
					<td width="143" height="20"><%= fnc_Mascara(objrsf.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
					<td width="342"><%= Trim(objrsf.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrsf.Fields.Item("NM_ITEM").Value)%></td>
					<td width="60" align="right">&nbsp;</td>
					<td width="60" align="right"><%= FormatNumber(Trim(objrsf.Fields.Item("VL_ITEM").Value))%></td>
					<td width="62" align="right">&nbsp;</td>
     			</tr>    
            <%
			  objrsf.MoveNext
			Loop
%>  
				</table>
<%
objrs.Close
'objrsx.Close
%>
    </td>
	</tr>
</table>		
</td>
	</tr>
	<tr height="15" align="center">
		<td colspan="3" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
