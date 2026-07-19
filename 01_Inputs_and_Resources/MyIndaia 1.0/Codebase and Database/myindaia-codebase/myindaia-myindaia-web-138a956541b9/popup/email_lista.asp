<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'------------------------------------------------------------------
'Sistema MyIndaia - Pop-ups
'Arquivo de Script e HTML: Lista e-mails de usários da Indaiá
'
'Criado: 05/10/2006
'Autor: Alexandre Gonçalves Neto
'Modificado: 
'------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim tx_email
Dim tx_nome
'se o usuário for cliente, exibe apenas usuários da indaiá, se não, exibe todos.
If InStr("040;055;060", Session("cd_cargo")) > 0 Then
	sql = "  AND US.CD_CARGO NOT IN ('040','055','060')"
ELse
	sql = ""
End If
'verfica se existe numero de processo
If fnc_TestaVar(Request("nr_processo")) Then
	sql = sql &_
				"  AND UH.CD_UNID_NEG = '"& Mid(Request("nr_processo"), 1, 2) &"' "&_
				"  AND UH.CD_PRODUTO  = '"& Mid(Request("nr_processo"), 3, 2) &"' "
End If
sql = "SELECT DISTINCT US.NM_USUARIO, US.NM_EMAIL "&_
			"FROM BROKER.DBO.TUSUARIO US (NOLOCK), BROKER.DBO.TUSUARIO_HABILITACAO UH (NOLOCK) "&_
			"WHERE US.CD_USUARIO *= UH.CD_USUARIO "&_
			"  AND ISNULL(US.IN_ATIVO, 1) = 1 "&_
			"  AND ISNULL(UH.IN_ATIVO, 1) = 1"& sql
'Response.Write(sql)
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divEmail {
	position:absolute;
	left:0px;
	top:45px;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}

.listatit {
	color: #FFFFFF;
	background: #336699;
	border: solid #EFEFEF;
	padding: 0 0 0 3;
}
</style>

<script language="javascript">
<!--
function fnc_EnviaLista() {
	/*var tolist  = unescape(document.frmListaMail.tx_para_form.value);
	var cclist  = unescape(document.frmListaMail.tx_copia_form.value);
	var bcclist = unescape(document.frmListaMail.tx_oculta_form.value);*/
	var tolist  = "";
	var cclist  = "";
	var bcclist = "";
	
	for (var i = 0; i < document.frmListaMail.elements.length; i++) {
		var e = document.frmListaMail.elements[i];
		if (e.name=="tx_para" && e.checked && e.value != '') {
			if (tolist != '') { tolist += '; ' };
				tolist += e.value;
		}
		if (e.name=="tx_copia" && e.checked && e.value != '') {
			if (cclist != '') { cclist += '; ' };
				cclist += e.value;
		}
		if (e.name=="tx_oculta" && e.checked && e.value != '') {
			if (bcclist != '') { bcclist += '; ' };
				bcclist += e.value;
		}
	}
	window.opener.document.frmSendMail.tx_para.value   = tolist;
	window.opener.document.frmSendMail.tx_copia.value  = cclist;
	window.opener.document.frmSendMail.tx_oculta.value = bcclist;
	window.close();
}
//-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF">
	<form name="frmListaMail" action="#" method="post" onSubmit="fnc_EnviaLista();">
		<!--<input name="tx_para_form" type="hidden" value="<%= Request("tx_para")%>">
		<input name="tx_copia_form" type="hidden" value="<%= Request("tx_copia")%>">
		<input name="tx_oculta_form" type="hidden" value="<%= Request("tx_oculta")%>">-->
		<tr>
			<td colspan="4" height="25" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="titpopup">&nbsp;Lista de e-mails Indaiá</td>
						<td width="25"><a href="#" onClick="window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
					</tr>
				</table></td>
		</tr>
		<tr height="20">
			<td width="38" class="listatit" style="border-width: 1 1 1 1;">Para</td>
			<td width="37" class="listatit" style="border-width: 1 1 1 0;">Cópia</td>
			<td width="264" class="listatit" style="border-width: 1 1 1 0;">Nome</td>
			<td width="261" class="listatit" style="border-width: 1 1 1 0;">E-mail</td>
		</tr>
		<tr>
			<td colspan="4"><div id="email" class="divEmail">
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<%
Do While Not objrs.Eof
	tx_nome  = objrs.Fields.Item("NM_USUARIO").Value
	tx_email = objrs.Fields.Item("NM_EMAIL").Value
	x = objrs.AbsolutePosition
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'verifica se o e-mail já foi solicitado
	If InStr(Request("tx_para")  , tx_email) > 0 Then y = " checked" Else y = ""
	If InStr(Request("tx_copia") , tx_email) > 0 Then w = " checked" Else w = ""
	If InStr(Request("tx_oculta"), tx_email) > 0 Then z = " checked" Else z = ""
%>
						<tr bgcolor="<%= bgcolor%>" height="16">
							<td align="center"><input name="tx_para" id="nome<%= x%>" type="checkbox" value="<%= tx_email%>"<%= y%>></td>
							<td align="center"><input name="tx_copia" id="copia<%= x%>" type="checkbox" value="<%= tx_email%>"<%= w%>></td>
							<input name="tx_oculta" type="hidden" value="">
							<td>&nbsp;<label for="nome<%= x%>"><%= tx_nome%></label></td>
							<td>&nbsp;<%= tx_email%></td>
						</tr>
						<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
						<tr>
							<td width="40"></td>
							<td width="40"></td>
							<td width="260"></td>
							<td width="240"></td>
						</tr>
					</table>
				</div></td>
		</tr>
		<tr height="35">
			<td colspan="4" align="center"><input name="btnCancelar" type="button" class="button" value="Cancelar" onClick="javascript:window.close();">
				<input name="btnOk" type="submit" class="button" value="Concluir"></td>
		</tr>
		<tr height="15">
			<td colspan="4" align="center" bgcolor="#DBDADA"><p><b><a href="http://www.indaialogistica.com.br/" target="_blank">Indaiá Logística Internacional</a></b></p></td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
