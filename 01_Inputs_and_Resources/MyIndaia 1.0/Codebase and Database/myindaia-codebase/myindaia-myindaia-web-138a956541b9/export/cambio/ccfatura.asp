<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Contratos de Câmbio Exportação
'Arquivo de Script e HTML: Embarques/Faturas vinculadas aos contratos
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrContrato, vNrBanco, vTxIcones

vNrContrato = Request.QueryString("vNrContrato")
vNrBanco = Request.QueryString("vNrBanco")

sql = "SELECT PC.NR_FATURA_CDE, ISNULL(PC.VL_VINCULADO, 0) AS VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, "&_
			"  ISNULL(SUM(PL.VL_LIQUIDADO), 0) AS VL_LIQUIDADO, ISNULL(EE.NM_EMPRESA, '') AS NM_IMPORTADOR "&_
			"FROM TCONT_CAMB CC (NOLOCK) "&_
			"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PC (NOLOCK) ON (PC.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PC.NR_BANCO = CC.NR_BANCO) "&_
			"  INNER JOIN ( "&_
			"    SELECT NR_PROCESSO, NR_FATURA_CDE, ISNULL(SUM(VL_VINCULADO), 0) AS VL_TOTAL_VINC "&_
			"    FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
			"    GROUP BY NR_PROCESSO, NR_FATURA_CDE "&_
			"  ) PT ON (PT.NR_PROCESSO = PC.NR_PROCESSO AND PT.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
			"  LEFT JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PC.NR_PROCESSO AND PL.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
			"  INNER JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PC.NR_PROCESSO) "&_
			"  INNER JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = PE.CD_IMPORTADOR)  "&_
			"WHERE CC.NR_CONT_CAMB = '"&vNrContrato&"' AND CC.NR_BANCO = '"&vNrBanco&"' "&_
			"GROUP BY PC.NR_FATURA_CDE, PC.VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, EE.NM_EMPRESA"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/ajax.js"></script>
<script language="javascript" type="text/javascript">
<!--
function ExibeLiquidacao(nNrFatura, nExibir) {
	var divLiquidacao = document.getElementById('divLiquidacao');
	if (nExibir) {
		CarregaViaGet('divLiquidacao', 'liqfatura', 'vNrFatura='+nNrFatura);
		divLiquidacao.style.top = 40;
		divLiquidacao.style.left = 55;
		divLiquidacao.style.visibility = 'visible';
		for (i=100; i>25; i--) eval("divFatura.style.filter = 'Alpha(style=0,opacity="+i+")'");
	} else {
		divLiquidacao.style.visibility = 'hidden';
		eval("divFatura.style.filter = ''");
	}
}
-->
</script>
<style type="text/css">
<!--
#divFatura {
	position:absolute;
	left:3px;
	top:28px;
	width:493px;
	height:235px;
	z-index:1;
	visibility: visible;
	overflow:auto;
}
#divLiquidacao {
	position:absolute;
	left:50px;
	top:58px;
	width:393px;
	height:180px;
	z-index:2;
	visibility: hidden;
	overflow:auto;
	border:2px solid #666666;
}
-->
</style>
</head>
<body>
<div id="divFatura">
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
		<col width="70">
		<col width="70">
		<col width="200">
		<col width="70">
		<tr height="18">
			<td class="gridtit">&nbsp;Nr. Fatura</td>
			<td class="gridtit">&nbsp;Dt. Vinculação</td>
			<td class="gridtit">&nbsp;Importador/Cliente</td>
			<td class="gridtit">&nbsp;Valor Vinculado</td>
		</tr>
		<%
if objrs.RecordCount > 0 then
	'lista faturas vinculadas aos contratos
	do while not objrs.Eof
		'verifica a situação da fatura
		if objrs.Fields.Item("VL_LIQUIDADO").Value = 0 then
			bgcolor = "#FFFFFF" 'em aberto
		elseif objrs.Fields.Item("VL_LIQUIDADO").Value < objrs.Fields.Item("VL_TOTAL_VINC").Value then
			bgcolor = "#DDFFDD" 'parcial
		else
			bgcolor = "#CCFFFF" 'liquidada
		end if
		'verifica se a fatura está presente em mais de um contrato
		vTxIcones = ""
		if objrs.Fields.Item("VL_TOTAL_VINC").Value > objrs.Fields.Item("VL_VINCULADO").Value then
			sql = "SELECT NR_CONT_CAMB, NR_BANCO FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
						"WHERE NR_FATURA_CDE = '"& objrs.Fields.Item("NR_FATURA_CDE").Value &"'"&_
						"  AND (NR_CONT_CAMB <> '"&vNrContrato&"' OR NR_BANCO <> '"&vNrBanco&"')"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			'caso esteja, exibe pequenos icones ao lado da fatura para cada contrato
			if objrsx.RecordCount > 0 then
				do while not objrsx.Eof
					x = objrsx.Fields.Item("NR_CONT_CAMB").Value
					y = objrsx.Fields.Item("NR_BANCO").Value
					vTxIcones = vTxIcones&"<img src='/imagens/icones/btn_ver_outro.gif' width=9 height=11 border=0 align=absmiddle style=""cursor: hand;"" "&_
						"alt='Ver contrato "&x&"/banco "&y&"' onclick=""document.location='cont_cambio_fatura.asp?vNrContrato="&x&"&vNrBanco="&y&"'""></a>"
					objrsx.MoveNext
					if not objrsx.Eof then vTxIcones = vTxIcones&" "
				loop
			end if
			objrsx.Close()
		end if
%>
		<tr height="16" bgcolor="<%= bgcolor%>">
			<td style="padding-left:3px;"><a href="#" title="clique para visualizar as liquidações." onClick="ExibeLiquidacao('<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>', true);"><%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%></a>&nbsp;<%= vTxIcones%></td>
			<td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_VINCULADO").Value, 5)%>&nbsp;</td>
			<td style="padding-left:3px;"><%= objrs.Fields.Item("NM_IMPORTADOR").Value%></td>
			<td align="right"><%= FormatNumber(objrs.Fields.Item("VL_VINCULADO").Value, 2)%>&nbsp;</td>
		</tr>
		<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
else
	Response.Write("<tr class='gridtit'><td colspan='10' align='left'>&nbsp;Não existem faturas vinculadas ao contrato.&nbsp;</td></tr>")
end if
objrs.Close()
%>
	</table>
</div>
<div id="divLiquidacao"></div>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;Faturas Vinculadas: Contrato <%= vNrContrato%> / Banco <%= vNrBanco%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" alt="Fechar Janela" width="17" height="17" border="0"></a></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr height="20" bgcolor="#DBDADA">
		<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="15">&nbsp;</td>
					<td width="15" bgcolor="#FFFFFF" style="border: #000000 1px solid;">&nbsp;</td>
					<td width="75"><b>&nbsp;em aberto</b></td>
					<td width="15" bgcolor="#DDFFDD" style="border: #006600 1px solid;">&nbsp;</td>
					<td width="75"><b>&nbsp;parcial</b></td>
					<td width="15" bgcolor="#CCFFFF" style="border: #0000FF 1px solid;">&nbsp;</td>
					<td><b>&nbsp;liquidada</b></td>
				</tr>
			</table></td>
	</tr>
	<tr height="15" align="center">
		<td bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
				Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
