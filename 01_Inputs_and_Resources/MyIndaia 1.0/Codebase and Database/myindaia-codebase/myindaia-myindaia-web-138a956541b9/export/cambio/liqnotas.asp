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
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border:1px solid #336699;">
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")

nr_processo = Request.QueryString("vNrProcesso")
dim vNrFatura : vNrFatura = Request.QueryString("vNrFatura")
dim vNrNota, vVlNota, vVlLiq, vVlSaldo

if objrs.State = adStateOpen then objrs.Close
sql = "SELECT ISNULL(NF.NR_NF,'&nbsp;') AS NR_NF, NF.DT_NOTA, "&_
			"  ISNULL(NF.VL_NOTA/NF.VL_TAXA, 0) AS VL_NOTA, ISNULL(VL_LIQUIDADO, 0) AS VL_LIQ "&_
			"FROM TPROCESSO_EXP_ITEM EI (NOLOCK) "&_
			"  INNER JOIN TPROCESSO_EXP_NF NF (NOLOCK) ON (NF.NR_NF = EI.NR_NF) "&_
			"  LEFT JOIN ( "&_
			"    SELECT NR_PROCESSO, NR_FATURA_CDE, NR_NF, ISNULL(SUM(VL_LIQUIDADO), 0) AS VL_LIQUIDADO "&_
			"    FROM TPROCESSO_EXP_CONT_CAMB_LIQ (NOLOCK) "&_
			"    GROUP BY NR_PROCESSO, NR_FATURA_CDE, NR_NF "&_
			"  ) PL ON (PL.NR_PROCESSO = EI.NR_PROCESSO AND PL.NR_FATURA_CDE = EI.NR_PEDIDO AND PL.NR_NF = EI.NR_NF) "&_
			"WHERE EI.NR_PROCESSO = '"& nr_processo &"' AND EI.NR_PEDIDO = '"& vNrFatura &"' "&_
			"GROUP BY NF.NR_NF, NF.VL_NOTA, NF.VL_TAXA, NF.DT_NOTA, VL_LIQUIDADO "&_
			"HAVING (ISNULL(NF.VL_NOTA/NF.VL_TAXA, 0) - ISNULL(VL_LIQUIDADO, 0)) > 0 "&_
			"ORDER BY NF.NR_NF"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
%>
	<tr height="35" bgcolor="#EEEEEE">
		<td width="20" style="border-bottom:1px solid #336699;border-right:1px solid #336699;">&nbsp;</td>
		<td width="75" class="tdNota">Nota<br>Fiscal</td>
		<td width="65" class="tdNota">Valor</td>
		<td width="90" class="tdNota">Emiss&atilde;o</td>
		<td width="65" class="tdNota">Valor<br>Liquidado</td>
		<td width="65" class="tdNota">Saldo a<br>Liquidar</td>
		<td width="75" class="tdNota">Docto.<br>Cont&aacute;bil</td>
		<td width="75" class="tdNota">Valor a<br>Liquidar</td>
		<td width="20" class="tdNota">&nbsp;</td>
		<td width="60" class="tdNota">&nbsp;</td>
		<td width="50" class="tdNota">Cr&eacute;dito?</td>
		<td width="75" class="tdNota">Nota de<br>Cr&eacute;dito</td>
	</tr>
	<tr>
		<td colspan="12"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	<%
	vNrFatura = Replace(vNrFatura, "/", "")
	do while not objrs.Eof
		vNrNota = Trim(objrs.Fields.Item("NR_NF").Value)
		vVlNota = FormatNumber(objrs.Fields.Item("VL_NOTA").Value, 2)
		vVlLiq = FormatNumber(objrs.Fields.Item("VL_LIQ").Value, 2)
		vVlSaldo = FormatNumber(objrs.Fields.Item("VL_NOTA").Value - objrs.Fields.Item("VL_LIQ").Value, 2)
%>
		<tr align="center" height="21">
			<td width="20" bgcolor="#EEEEEE" style="border-right:1px solid #336699;"><input type="checkbox" name="chkInNota<%= vNrFatura%>" id="chkInNota<%= vNrFatura & vNrNota%>_0" value="<%= vNrNota%>" onclick="if (this.checked) ValidaValorPago('<%= vNrFatura%>', '<%= vNrNota%>', 0); CalculaLiquidacao(false);" />
				<input type="hidden" name="hdnNrNota<%= vNrFatura%>" id="hdnNrNota<%= vNrFatura & vNrNota%>_0" value="<%= vNrNota%>" />
				<input type="hidden" name="hdnVlSaldo<%= vNrFatura%>" id="hdnVlSaldo<%= vNrFatura & vNrNota%>_0" value="<%= vVlSaldo%>" />
				<input type="hidden" name="hdnNrDoctoCont<%= vNrFatura%>" id="hdnNrDoctoCont<%= vNrFatura & vNrNota%>_0" value="" /></td>
			<td width="50" align="right"><%= vNrNota%></td>
			<td width="85" align="right" style="padding-right:5px;" id="tdVlNota<%= vNrFatura & vNrNota%>_0"><%= vVlNota%></td>
			<td width="80" id="tdDtNota<%= vNrFatura & vNrNota%>_0"><%= fnc_Mascara(objrs.Fields.Item("DT_NOTA").Value, 5)%></td>
			<td width="70" align="right" style="padding-right:5px;"><%= vVlLiq%></td>
			<td width="70" align="right" style="padding-right:5px;"><%= vVlSaldo%></td>
			<td width="75"><input type="text" name="edtNrDoctoCont<%= vNrFatura%>" id="edtNrDoctoCont<%= vNrFatura & vNrNota%>_0" class="editbox" maxlength="10" style="width:70px;" /></td>
			<td width="75"><input type="text" name="edtVlPago<%= vNrFatura%>" id="edtVlPago<%= vNrFatura & vNrNota%>_0" class="editbox" style="width:70px; text-align:right;" value="<%= vVlSaldo%>" onBlur="ValidaValorPago('<%= vNrFatura%>', '<%= vNrNota%>', 0);" onFocus="gVlPago = ConverteParaNumero(this.value);" onKeyPress="return(MascaraValor(this,'.',',',2,event));"></td>
			<td width="20" align="left"><img src="/imagens/icones/16x16/btn_add_row.jpg" id="imgNovaNota<%= vNrFatura & vNrNota%>_0" class="imgNota" style="display:none;" align="absmiddle" onClick="CriaNotaCredito('<%= vNrFatura%>', '<%= vNrNota%>', 0);" />&nbsp;</td>
			<td width="60" id="tdParcial<%= vNrFatura & vNrNota%>_0" class="tdParcial">&nbsp;</td>
			<td width="50"><input type="checkbox" name="chkInCredito<%= vNrFatura%>" id="chkInCredito<%= vNrFatura & vNrNota%>_0" value="1" onClick="AtivaNotaCredito('<%= vNrFatura%>', '<%= vNrNota%>', 0);" /></td>
			<td width="75"><input type="text" name="edtNrNotaCred<%= vNrFatura%>" id="edtNrNotaCred<%= vNrFatura & vNrNota%>_0" class="editbox" maxlength="10" style="width:70px;" readonly /></td>
		</tr>
		<tr id="trNota<%= vNrFatura & vNrNota%>_0" height="21" style="display:none;">
			<td colspan="12" id="tdNota<%= vNrFatura & vNrNota%>_0"></td>
		</tr>
	<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
else
	vTxHTML = "<tr height='16' class='gridtit'>"&_
		"<td colspan='9' align='left'>&nbsp;N&atilde;o foram encontradas as Notas Fiscais da fatura, entre em contato com o suporte.&nbsp;</td></tr>"
end if
Response.Write(Server.URLEncode(vTxHTML))
objrs.Close

vInDebug = false
%>
		</table></td>
	</tr>
</table>
<!--#include virtual="/includes/inc_ends.asp" -->