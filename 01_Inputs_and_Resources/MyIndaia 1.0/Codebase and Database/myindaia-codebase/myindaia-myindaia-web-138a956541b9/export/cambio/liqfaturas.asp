<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Liquidação de Contratos de Câmbio Exportação
'Autor: Alexandre Neto
'Data: 09/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<table width="760" border="0" cellpadding="0" cellspacing="0" style="border:3px solid #FFFFFF;table-layout:fixed;">
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")

dim vTpExibe : vTpExibe = Request.QueryString("vTpExibe")
dim vCodImportador : vCodImportador = Request.QueryString("edtCodImportador")
dim vTxFaturas : vTxFaturas = Request.QueryString("edtTxFaturas")
dim vNrFatura, vSQLcliente

sql = ""
if fnc_TestaVar(vCodImportador) then sql = " AND PE.CD_IMPORTADOR = '"&vCodImportador&"' "
if fnc_TestaVar(vTxFaturas) then sql = sql &" AND PC.NR_FATURA_CDE IN ('"& Replace(vTxFaturas, ";", "','") &"')"

vSQLcliente = ""
if InStr(CODCLIENTE, Session("cd_cargo")) > 0 then
	vSQLcliente = " INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = PE.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
end if

if objrs.State = adStateOpen then objrs.Close
sql = "SELECT PC.NR_PROCESSO, PC.NR_FATURA_CDE, (ISNULL(SUM(PC.VL_VINCULADO), 0) - ISNULL(VL_LIQUIDADO, 0)) AS VL_SALDO "&_
			"FROM TPROCESSO_EXP PE (NOLOCK) "& vSQLcliente &_
			"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PC (NOLOCK) ON (PC.NR_PROCESSO = PE.NR_PROCESSO) "&_
			"    LEFT JOIN ( "&_
			"      SELECT NR_PROCESSO, NR_FATURA_CDE, ISNULL(SUM(VL_LIQUIDADO), 0) AS VL_LIQUIDADO "&_
			"      FROM TPROCESSO_EXP_CONT_CAMB_LIQ (NOLOCK) "&_
			"      GROUP BY NR_PROCESSO, NR_FATURA_CDE "&_
			"    ) PL ON (PL.NR_PROCESSO = PC.NR_PROCESSO AND PL.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
			"WHERE PC.CD_STATUS_VINC = '3' "& sql &_
			"GROUP BY PC.NR_PROCESSO, PC.NR_FATURA_CDE, VL_LIQUIDADO "&_
			"HAVING (ISNULL(SUM(PC.VL_VINCULADO), 0) - ISNULL(VL_LIQUIDADO, 0)) > 0 "&_
			"ORDER BY RIGHT('000000000000000'+PC.NR_FATURA_CDE, 15) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
%>
	<col width="20" />
	<col width="60" />
	<col width="70" />
	<col width="230" />
	<col width="75" />
	<col width="230" />
	<col width="75" />
	<%
	do while not objrs.Eof
		vNrFatura = Replace(Trim(objrs.Fields.Item("NR_FATURA_CDE").Value), "/", "")
%>
	<tr class="trFatura" align="right" height="21">
		<td align="center"><input type="checkbox" name="chkInFatura" value="<%= vNrFatura%>" onclick="ExibeNotaFiscal(this);" />
			<input type="hidden" name="hdnNrProcesso" id="hdnNrProcesso<%= vNrFatura%>" value="<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>" />
			<input type="hidden" name="hdnNrFatura" id="hdnNrFatura<%= vNrFatura%>" value="<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>" /></td>
		<td align="left">Invoice:</td>
		<td><%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%></td>
		<td>Valor Total:</td>
		<td><%= FormatNumber(objrs.Fields.Item("VL_SALDO").Value, 2)%></td>
		<td>Total a Liquidar:</td>
		<td><input type="text" name="edtVlTotalLiq" id="edtVlTotalLiq<%= vNrFatura%>" class="edtValorLiq" value="0,00" readonly />&nbsp;</td>
	</tr>
	<tr>
		<td colspan="7" id="tdFatura<%= vNrFatura%>" style="display:none;padding: 2px 0px 4px 0px;"></td>
	</tr>
	<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
	sql = "SELECT NEWID()"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	vTxHTML = "<tr height='16'>"&_
		"<td colspan='6' id='tdInfo' align='left' class='tdInfo'>&nbsp;</td>"&_
		"<td align='right'><input type='hidden' name='hdnQtdFatura' value='"& objrs.RecordCount &"' />"&_
		"  <input type='hidden' name='hdnIdLiquidacao' value='"& objrsx.Fields.Item(0).value &"'>"&_
		"  <input name='btnLiquidar' type='submit' class='button' value='Liquidar' tabindex='5' style='width:70px;' disabled></td></tr>"
else
	vTxHTML = "<tr height='16'>"&_
		"<td colspan='7' align='left'>&nbsp;N&atilde;o existem faturas para esse cliente &agrave; serem liquidadas.&nbsp;</td></tr>"
end if
Response.Write(Server.URLEncode(vTxHTML))
objrs.Close

vInDebug = true
%>
</table>
<!--#include virtual="/includes/inc_ends.asp" -->