<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Liquidação de Contratos de Câmbio Exportação
'Autor: Alexandre Neto
'Data: 19/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrFatura : vNrFatura = Request.QueryString("vNrFatura")
dim vNrNota
'seleciona as liquidaçãoe dessa fatura.
sql = "SELECT PL.NR_NF, NR_LIQUIDACAO, VL_LIQUIDADO, DT_LIQUIDADO, NR_NOTA_CREDITO, VL_QTDE_NOTA "&_
			"FROM TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) "&_
			"  INNER JOIN ( "&_
			"    SELECT NR_NF, NR_FATURA_CDE, COUNT(*) AS VL_QTDE_NOTA "&_
			"    FROM TPROCESSO_EXP_CONT_CAMB_LIQ (NOLOCK) "&_
			"    GROUP BY NR_NF, NR_FATURA_CDE "&_
			"  ) QN ON (QN.NR_FATURA_CDE = PL.NR_FATURA_CDE AND QN.NR_NF = PL.NR_NF) "&_
			"WHERE PL.NR_FATURA_CDE = '"&vNrFatura&"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;Liquida&ccedil;&atilde;o Fatura: <%= vNrFatura%></td>
					<td width="25"><a href="#" onClick="ExibeLiquidacao('', false);"><img src="/imagens/icones/16x16/btn_close.gif" alt="Fechar" width="17" height="17" border="0"></a></td>
				</tr>
			</table>
	</tr>
	<tr>
		<td valign="top" style="padding:3px;"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699" style="padding: 2px 2px 0px 2px;">
				<col width="70">
				<col width="70">
				<col width="70">
				<col width="70">
				<tr height="18">
					<td class="gridtit">Nr. Nota Fiscal</td>
					<td class="gridtit">Nr. Liquida&ccedil;&atilde;o</td>
					<td class="gridtit">Dt. Liquida&ccedil;&atilde;o</td>
					<td class="gridtit">Cr&eacute;dito?</td>
					<td class="gridtit">Valor Liquidado</td>
				</tr>
				<%
if objrs.RecordCount > 0 then
	'lista a liquidação
	do while not objrs.Eof
%>
				<tr height="16" align="center" valign="top" bgcolor="#FFFFFF">
					<%
		'verfica se a nota anterior é diferente da atual, se for exibe na tela
		if vNrNota <> objrs.Fields.Item("NR_NF").Value then
%>
						<td rowspan="<%= objrs.Fields.Item("VL_QTDE_NOTA").Value%>"><%= objrs.Fields.Item("NR_NF").Value%></td>
						<%
		end if
		vNrNota = objrs.Fields.Item("NR_NF").Value
%>
					<td><%= fnc_AddZeros(objrs.Fields.Item("NR_LIQUIDACAO").Value, 3)%></td>
					<td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_LIQUIDADO").Value, 5)%></td>
					<td style="font-family:Wingdings;color:#00CC33;font-weight:bold;font-size:12px;">
					<%
		if fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value) then
			Response.Write("&uuml;")
		else
			Response.Write("&nbsp;")
		end if
%>
					</td>
					<td align="right"><%= FormatNumber(objrs.Fields.Item("VL_LIQUIDADO").Value, 2)%></td>
				</tr>
				<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
else
	Response.Write("<tr class='gridtit'><td colspan='4' align='left'>&nbsp;N&atilde;o existem registros de liquida&ccedil;&atilde;o para esta fatura.</td></tr>")
end if
objrs.Close()
vInDebug = false
%>
			</table></td>
	</tr>
</table>
<!--#include virtual="/includes/inc_ends.asp" -->