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
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")

dim vNrFatura : vNrFatura = Request.QueryString("vNrFatura")
dim vNrNota : vNrNota = Request.QueryString("vNrNota")
dim vId : vId = Request.QueryString("vId") + 1
dim vVlNota : vVlNota = Request.QueryString("vVlNota")
dim vDtNota : vDtNota = Request.QueryString("vDtNota")
dim vVlSaldo : vVlSaldo = Replace(Request.QueryString("vVlSaldo"), ".", ",")

if fnc_TestaVar(vNrFatura) and fnc_TestaVar(vNrNota) and fnc_TestaVar(vId) then
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center" height="21">
		<td width="20" bgcolor="#EEEEEE" style="border-right:1px solid #336699;"><input type="checkbox" name="chkInNota<%= vNrFatura%>" id="chkInNota<%= vNrFatura & vNrNota &"_"& vId%>" value="<%= vNrNota%>" onclick="if (this.checked) ValidaValorPago('<%= vNrFatura%>', '<%= vNrNota%>', <%= vId%>);" />
			<input type="hidden" name="hdnNrNota<%= vNrFatura%>" id="hdnNrNota<%= vNrFatura & vNrNota &"_"& vId%>" value="<%= vNrNota%>" />
			<input type="hidden" name="hdnVlSaldo<%= vNrFatura%>" id="hdnVlSaldo<%= vNrFatura & vNrNota &"_"& vId%>" value="<%= vVlSaldo%>" />
			<input type="hidden" name="hdnNrDoctoCont<%= vNrFatura%>" id="hdnNrDoctoCont<%= vNrFatura & vNrNota &"_"& vId%>" value="" /></td>
		<td width="50" align="right"><%= vNrNota%></td>
		<td width="85" align="right" style="padding-right:5px;" id="tdVlNota<%= vNrFatura & vNrNota &"_"& vId%>"><%= vVlNota%></td>
		<td width="80" id="tdDtNota<%= vNrFatura & vNrNota &"_"& vId%>"><%= fnc_Mascara(vDtNota, 5)%></td>
		<td width="70" align="right" style="padding-right:5px;"><%= FormatNumber(CDbl(vVlNota) - CDbl(vVlSaldo), 2)%></td>
		<td width="70" align="right" style="padding-right:5px;"><%= FormatNumber(vVlSaldo, 2)%></td>
		<td width="75"><input type="text" name="edtNrDoctoCont<%= vNrFatura%>" id="edtNrDoctoCont<%= vNrFatura & vNrNota &"_"& vId%>" class="editbox" maxlength="10" style="width:70px;" /></td>
		<td width="75"><input type="text" name="edtVlPago<%= vNrFatura%>" id="edtVlPago<%= vNrFatura & vNrNota &"_"& vId%>" class="editbox" style="width:70px; text-align:right;" value="<%= FormatNumber(vVlSaldo, 2)%>" onBlur="ValidaValorPago('<%= vNrFatura%>', '<%= vNrNota%>', <%= vId%>);" onFocus="gVlPago = ConverteParaNumero(this.value);" onKeyPress="return(MascaraValor(this,'.',',',2,event));"></td>
		<td width="20" align="left"><img src="/imagens/icones/16x16/btn_add_row.jpg" id="imgNovaNota<%= vNrFatura & vNrNota &"_"& vId%>" class="imgNota" style="display:none;" align="absmiddle" onClick="CriaNotaCredito('<%= vNrFatura%>', '<%= vNrNota%>', <%= vId%>);" />&nbsp;</td>
		<td width="60" id="tdParcial<%= vNrFatura & vNrNota &"_"& vId%>" class="tdParcial">&nbsp;</td>
		<td width="50"><input type="checkbox" name="chkInCredito<%= vNrFatura%>" id="chkInCredito<%= vNrFatura & vNrNota &"_"& vId%>" value="1" onClick="AtivaNotaCredito('<%= vNrFatura%>', '<%= vNrNota%>', <%= vId%>);" /></td>
		<td width="75"><input type="text" name="edtNrNotaCred<%= vNrFatura%>" id="edtNrNotaCred<%= vNrFatura & vNrNota &"_"& vId%>" class="editbox" maxlength="10" style="width:70px;" readonly /></td>
	</tr>
	<tr id="trNota<%= vNrFatura & vNrNota &"_"& vId%>" height="21" style="display:none;">
		<td colspan="12" id="tdNota<%= vNrFatura & vNrNota &"_"& vId%>"></td>
	</tr>
</table>
<%
end if
vInDebug = false
%>
<!--#include virtual="/includes/inc_ends.asp" -->