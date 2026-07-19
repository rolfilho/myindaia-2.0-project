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

Dim nr_invoice
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo

aCondicao = Array("INVOICE","INVOICE - especial","Registro da DI","Conhecimento Embarque")
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
.style1 {background: #CCCCCC; height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style2 {height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style4 {font-size: 8px}
.style5 {color: #339966;	font-weight: bold;}
.style6 {color: #FF0000}
.style7 {font-size: 16px;	font-weight: bold;}
</style>
</head>
<body style="overflow:auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td>
<%
	sql = "SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA, SD.VL_PAGTO AS VL_SDA, (SD.VL_PAGTO*0.2) AS VL_INSS, "&_
				"  ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
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
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CD_ITEM AS INT) < 900), 0) -  "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CD_ITEM AS INT) < 900), 0)) AS VL_DESPESA_INDAIA, "&_
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
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA "&_
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
	'Response.Write(sql)
	With objcmd
		.CommandTimeOut = 120
		.CommandText = sql
		.CommandType = adCmdText
	End With
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	
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
		sql = "SELECT NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUCAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_TIPO_DCTO_INSTR = '01'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_invoice = ""
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
		
		vlTotal = objrs("VL_TOTAL_MLE_MN")+objrs("VL_DESPESA_INDAIA")+objrs("VL_INSS")+objrs("VL_TOTAL_SEG_MN")-objrs("VL_RECUPERADO")
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
			case "M","R" vInIPIRec = "sim"
			case else vInIPIRec = "não"
		end select
		
		vNrDias = Request.QueryString("nrDias")
		vTxCondicao = Request.QueryString("txCondicao")
		vDtDocto = Request.QueryString("dtDocs")
	
		With objcmd
			.CommandTimeOut = 60'
			.CommandText    = "sp_calc_dias_uteis"
			.CommandType    = adCmdStoredProc
			.Parameters.Append = .CreateParameter("@dt_ini", adDate, adParamInput, 10, vDtDocto)
			.Parameters.Append = .CreateParameter("@nr_dia", adInteger, adParamInput, 4, vNrDias)
			.Parameters.Append = .CreateParameter("@dt_fim", adDate, adParamOutPut)
			.Execute , , adExecuteNoRecords
			vDtVencto = .Parameters("@dt_fim")
		End With
	
		if vTxCondicao = 1 then
			if Day(vDtVencto) < 15 then
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
			elseif Day(vDtVencto) > 15 then
				vDtVencto = DateAdd("m", 1, vDtDocto)
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
			end if
		end if
		
		if objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" then
			vTipoTransp = objrs.Fields.Item("NM_EMBARCACAO").Value
		else
			vTipoTransp = objrs.Fields.Item("NM_TRANSP").Value
		end if
  end if
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
					<td class="cinza"><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_ENVIO_DOCS").Value, 5)%></div></td>
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
					<td class="cinza"><%= fnc_Mascara(vDtDocto, 5)%></td>
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
					<td class="cinza">&nbsp;<%= vNrDias &" DIAS "& aCondicao(vTxCondicao)%></td>
					<td class="cinza"><div align="right"><%= fnc_Mascara(vDtVencto, 5)%>&nbsp;</div></td>
					<td class="cinza"><div align="right"><%= DateDiff("d", vDtDocto, vDtVencto)%>&nbsp;</div></td>
          <td class="azulClaro">PORTO DE SA&Iacute;DA </td>
				</tr>
				<tr>
					<td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;VALOR</b></div></td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></div></td>
					<td class="cinzaClaro"><div align="right"><span class="style5"><%= FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value, 2)%></span>&nbsp;</div></td>
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
					<td><div align="right"><b><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_MLE_MN").Value, 2)%></b>&nbsp;</div></td>
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
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_DESPESA_INDAIA").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">FABRICANTE</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;INSS s/ S.D.A. n.&ordm; </td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)%>&nbsp;</div></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_INSS").Value, 2)%>&nbsp;</div></td>
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
					<td><div align="right" style="color: #FF0000;">(<%= FormatNumber(objrs.Fields.Item("VL_RECUPERADO").Value, 2)%>)&nbsp;</div></td>
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
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= UCase(vTipoImport)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;Tranporte Internacional </td>
					<td>&nbsp;</td>
					<td><div align="right">0,00&nbsp;</div></td>
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
					<td><div align="right"><b><%= FormatNumber(vlTotal, 2)%>&nbsp;</b></div></td>
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
					<td><div align="right"><%= FormatNumber(vlTotal-vlNota, 2)%>&nbsp;</div></td>
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
					<td><div align="right"><%= FormatNumber(vlTotal, 2)%>&nbsp;</div></td>
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
					<td><div align="right"><%= FormatNumber(vlTotal, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td ><div align="center"><%= objrs.Fields.Item("NM_AREA").Value%></div></td>
				</tr>
			</table>
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
