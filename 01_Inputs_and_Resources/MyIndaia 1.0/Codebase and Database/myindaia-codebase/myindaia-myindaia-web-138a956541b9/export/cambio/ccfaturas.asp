<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Arquivo de Script e HTML: Listagem de Contratos de CÃ¢mbio ExportaÃ§Ã£o
'Autor Alexandre Neto
'CriaÃ§Ã£o: 24/08/2007
'ManutenÃ§Ã£o: 02/10/2007
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrContrato : vNrContrato = Request("vNrContrato")
dim vNrBanco : vNrBanco = Request("vNrBanco")
dim vCodImportador : vCodImportador = Request("vCodImportador")
dim vTpAcao : vTpAcao = Request("vTpAcao")
dim vTxTitulo, vTxLink, vTxFaturas, aFaturas, vSQLcliente

if fnc_TestaVar(vNrContrato) or fnc_TestaVar(vNrBanco) then
	vTxTitulo = "Faturas p/ C&acirc;mbio Pronto "& vNrContrato &"/"& vNrBanco
	vTxLink = "vNrContrato="& vNrContrato &"&vNrBanco="& vNrBanco &"&vTpAcao="
	vTpAcao = "salvar"
else
	vTxTitulo = "Consulta de Faturas p/ Liquida&ccedil;&atilde;o"
	vTxLink = "vCodImportador="& vCodImportador &"&vTpAcao="
	vTpAcao = "exibir"
end if
vTxLink = vTxLink & vTpAcao

if (Request.Form <> "") and (vTpAcao="salvar") then
	vTxFaturas = Request.Form("chkNrFaturaSel")
	if vTxFaturas <> "" then
		aFaturas = Split(vTxFaturas, " , ", -1)
		'apaga as faturas para salvar os novos registros
		sql = "DELETE TCONT_CAMB_FATURA "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
					"  AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		'salva as faturas selecionadas
		for x = 0 to UBound(aFaturas)
			sql = "INSERT INTO TCONT_CAMB_FATURA (NR_CONT_CAMB, NR_BANCO, NR_FATURA_CDE) "&_
						"VALUES ("&fncValSQL(vNrContrato, 0)&", "&fncValSQL(vNrBanco, 0)&", "&fncValSQL(aFaturas(x), 0)&")"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
		next
		'salva na tabela de contrato as faturas
		if objrs.State = adStateOpen then objrs.Close
		sql = "SELECT NR_FATURA_CDE "&_
					"FROM TCONT_CAMB_FATURA (NOLOCK) "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
					"  AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		if objrs.RecordCount > 0 then
			vTxFaturas = ""
			do while not objrs.Eof
				vTxFaturas = vTxFaturas & objrs.Fields.Item("NR_FATURA_CDE").Value
				objrs.MoveNext
				if objrs.Eof then exit do else vTxFaturas = vTxFaturas &";"
			loop
			sql = "UPDATE TCONT_CAMB SET TX_FATURAS = '"& vTxFaturas &"' "&_
						"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
						"  AND NR_BANCO = '"&vNrBanco&"'"
		else
			sql = "UPDATE TCONT_CAMB SET TX_FATURAS = NULL "&_
						"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
						"  AND NR_BANCO = '"&vNrBanco&"'"
		end if
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
	end if
elseif (Request.Form <> "") and (vTpAcao="exibir") then
	
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
var gTpAcao = '<%= vTpAcao%>';

function SelecionaFaturas(nForm) {
  var vTxFaturas = new String();
	if (isNaN(nForm.chkNrFaturaSel.length)) {
		if (nForm.chkNrFaturaSel.checked) vTxFaturas = nForm.chkNrFaturaSel.value+';';
	}
	else {
		for (i = 0; i < nForm.chkNrFaturaSel.length; i++) {
			if (nForm.chkNrFaturaSel[i].checked) vTxFaturas += nForm.chkNrFaturaSel[i].value+';';
		}
	}
	window.opener.document.getElementById('edtTxFaturas').value = vTxFaturas;
	window.close();
}

function ValidaForm(nForm) {
	if (gTpAcao == 'salvar') {
		vAlert = 'vincular ao câmbio pronto';
	} else {
		vAlert = 'liquidação';
	}
	if (isNaN(nForm.chkNrFaturaSel.length)) {
		if (!nForm.chkNrFaturaSel.checked) {
			alert('ATENÇÃO:\n\nSelecione ao menos uma fatura para '+vAlert+'!');
			return false;
		}
	} else {
		for (i = 0; i < nForm.chkNrFaturaSel.length; i++) {
			if (nForm.chkNrFaturaSel[i].checked) break;
		}
		if (i == nForm.chkNrFaturaSel.length) {
			alert('ATENÇÃO:\n\nSelecione ao menos uma fatura para '+vAlert+'!');
			return false;
		}
	}
	if (gTpAcao == 'exibir') {
		SelecionaFaturas(nForm);
		return false;
	}
	return true;
}
-->
</script>
<style type="text/css">
<!--
#divFaturas {
	position:absolute;
	top:44px;
	left:0px;
	width:100%;
	height:360px;
	z-index:1;
	overflow:auto;
}
-->
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<form name="frmFaturas" action="?<%= vTxLink%>" method="post" onSubmit="return ValidaForm(this);">
		<tr height="25">
			<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td class="titpopup">&nbsp;<%= vTxTitulo%></td>
						<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="1">
					<tr height="18">
						<td width="18" class="gridtit">#</td>
						<td width="60" class="gridtit">Nr. Fatura</td>
						<td width="40" class="gridtit">Cód.</td>
						<td class="gridtit">Cliente<i>(SAP Code)</i></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><div id="divFaturas">
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
						<col width="22">
						<col width="64">
						<col width="42">
						<col>
						<%
	vSQLcliente = ""
	if InStr(CODCLIENTE, Session("cd_cargo")) > 0 then
		vSQLcliente = " INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMPRESA AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
	end if
	if vTpAcao = "salvar" then
		if objrs.State = adStateOpen then objrs.Close
		sql = "SELECT F.NR_FATURA_CDE, E.NM_EMPRESA +' <i>('+ RTRIM(ISNULL(E.NR_CLIENTE, '')) +')</i>' AS NM_CLIENTE, E.CD_EMPRESA "&_
					"FROM TCONT_CAMB_FATURA F (NOLOCK) "&_
					"  INNER JOIN TRAP R (NOLOCK) ON (R.NR_CDE = F.NR_FATURA_CDE) "&_
					"  INNER JOIN TEMPRESA_EST E (NOLOCK) ON (E.CD_EMPRESA = R.CD_CLIENTE) "& vSQLcliente &_
					"WHERE F.NR_CONT_CAMB = '"&vNrContrato&"' AND F.NR_BANCO = '"&vNrBanco&"' "&_
					"ORDER BY RIGHT('000000000000000'+F.NR_FATURA_CDE, 15) ASC"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'exibe as faturas selecionadas para o contrato de cambio pronto
		if objrs.RecordCount > 0 then
			do while not objrs.Eof
				if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
%>
						<tr height="18" bgcolor="<%= bgcolor%>" align="center">
							<td><input name="chkNrFaturaSel" type="checkbox" value="<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>" checked></td>
							<td><%= objrs.Fields.Item("NR_FATURA_CDE").Value%></td>
							<td align="right" style="padding-right: 2px;"><%= objrs.Fields.Item("CD_EMPRESA").Value%></td>
							<td align="left" style="padding-left: 2px;"><%= objrs.Fields.Item("NM_CLIENTE").Value%></td>
						</tr>
						<%
				objrs.MoveNext
				if objrs.Eof then exit do
			loop
		end if
		
		if objrs.State = adStateOpen then objrs.Close
		sql = "SELECT R.NR_CDE AS NR_FATURA_CDE, E.NM_EMPRESA +' <i>('+ RTRIM(ISNULL(E.NR_CLIENTE, '')) +')</i>' AS NM_CLIENTE, E.CD_EMPRESA "&_
					"FROM TRAP R (NOLOCK) "&_
					"  INNER JOIN TEMPRESA_EST E (NOLOCK) ON (E.CD_EMPRESA = R.CD_CLIENTE) "& vSQLcliente &_
					"  INNER JOIN TCONT_CAMB C (NOLOCK) ON (C.CD_MOEDA_NEGOC = R.CD_MOEDA_MLE) "&_
					"WHERE R.CD_STATUS <> '0' "&_
					"  AND R.NR_CDE NOT IN (SELECT NR_FATURA_CDE FROM TCONT_CAMB_FATURA (NOLOCK)) "&_
					"  AND R.NR_CDE NOT IN (SELECT NR_FATURA_CDE FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK)) "&_
					"  AND C.NR_CONT_CAMB = '"&vNrContrato&"' AND C.NR_BANCO = '"&vNrBanco&"' "&_
					"  AND C.VL_NEGOC <= R.VL_MLE "&_
					"ORDER BY RIGHT('000000000000000'+R.NR_CDE, 15) ASC"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'exibe as faturas selecionaveis para cambio pronto
		if objrs.RecordCount > 0 then
			do while not objrs.Eof
				if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
%>
						<tr height="18" bgcolor="<%= bgcolor%>" align="center">
							<td><input name="chkNrFaturaSel" type="checkbox" value="<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>"></td>
							<td><%= objrs.Fields.Item("NR_FATURA_CDE").Value%></td>
							<td align="right" style="padding-right: 2px;"><%= objrs.Fields.Item("CD_EMPRESA").Value%></td>
							<td align="left" style="padding-left: 2px;"><%= objrs.Fields.Item("NM_CLIENTE").Value%></td>
						</tr>
						<%
				objrs.MoveNext
				if objrs.Eof then exit do
			loop
		else
			str = "vincular ao c&acirc;mbio pronto"
		end if
	end if
	
	if vTpAcao = "exibir" then
		if objrs.State = adStateOpen then objrs.Close
		if fnc_TestaVar(vCodImportador) then sql = "  AND CD_IMPORTADOR = '"& vCodImportador &"' "
		sql = "SELECT PC.NR_FATURA_CDE, E.NM_EMPRESA +' <i>('+ RTRIM(ISNULL(E.NR_CLIENTE, '')) +')</i>' AS NM_CLIENTE, E.CD_EMPRESA "&_
					"FROM TPROCESSO_EXP PE (NOLOCK) "&_
					"  INNER JOIN TEMPRESA_EST E (NOLOCK) ON (E.CD_EMPRESA = PE.CD_IMPORTADOR) "&_
					"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PC (NOLOCK) ON (PC.NR_PROCESSO = PE.NR_PROCESSO) "&_
					"  LEFT JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PE.NR_PROCESSO AND PL.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
					"WHERE PC.CD_STATUS_VINC = '3'"& sql &_
					"GROUP BY PC.NR_FATURA_CDE, E.NM_EMPRESA, E.CD_EMPRESA, E.NR_CLIENTE "&_
					"ORDER BY RIGHT('000000000000000'+PC.NR_FATURA_CDE, 15) ASC"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'exibe as faturas que ainda não foram liquidadas
		if objrs.RecordCount > 0 then
			do while not objrs.Eof
				if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
%>
						<tr height="18" bgcolor="<%= bgcolor%>" align="center">
							<td><input name="chkNrFaturaSel" type="checkbox" value="<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>"></td>
							<td><%= objrs.Fields.Item("NR_FATURA_CDE").Value%></td>
							<td align="right" style="padding-right: 2px;"><%= objrs.Fields.Item("CD_EMPRESA").Value%></td>
							<td align="left" style="padding-left: 2px;"><%= objrs.Fields.Item("NM_CLIENTE").Value%></td>
						</tr>
						<%
				objrs.MoveNext
				if objrs.Eof then exit do
			loop
		else
			str = "liquidar"
		end if
	end if
	
	if len(str) > 0 then
%>
						<tr>
							<td colspan="3">N&atilde;o foram encontradas faturas para <%= str%>.</td>
						</tr>
						<%
	end if
%>
					</table>
				</div></td>
		</tr>
		<tr height="30">
			<td colspan="3" align="center"><input type="reset" name="btnCancelar" class="button" style="width:100px;" value="cancelar" onClick="window.close();">
				<input type="submit" name="btnSalvar" class="button" style="width:100px;" value=""></td>
		</tr>
		<tr height="15" align="center">
			<td bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
					Internacional</a></b></p></td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
var btnSalvar = document.getElementById('btnSalvar');
if (gTpAcao == 'exibir') btnSalvar.value = 'ok';
else btnSalvar.value = 'salvar';
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
