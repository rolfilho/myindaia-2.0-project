<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Arquivo de Script e HTML: Upload de contrato de câmbio
'Autor Alexandre Neto
'Criado: 01/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'variaveis de controle do form
dim vTitulo, vCaminho, vArquivo, vOk
dim vNrContrato : vNrContrato = Request.QueryString("vNrContrato")
dim vNrBanco : vNrBanco = Request.QueryString("vNrBanco")
dim vInUpLoad : vInUpLoad = Request.QueryString("vInUpLoad")

'variaveis para inclusão de dados
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
tx_erro  = Request.QueryString("tx_erro")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

if vInUpLoad = 1 then
	'salva o nome do arquivo na tabela
	if objrs.State = adStateOpen then objrs.Close
	sql = "SELECT * FROM TCONT_CAMB (NOLOCK) "&_
				"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
				"  AND NR_BANCO = '"&vNrBanco&"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdTable
	'verifica se já existe o contrato salvo no sistema
	if objrs.RecordCount > 0 then
		sql = "UPDATE TCONT_CAMB SET TX_ARQUIVO = '"&Request.QueryString("vNewArq")&"' "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' "&_
					"  AND NR_BANCO = '"&vNrBanco&"'"
		objcnn.Execute(sql)
	else
		'se não existir tem que informar o sistema para guardar o nome do arquivo
	end if
	objrs.Close
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
var vCodUser = <%= Session("cd_usuario")%>;

function ValidaForm(vForm) {
	if (vForm.vArqOri.value == '') {
		alert('Informe o arquivo para iniciar o envio ao servidor!');
		vForm.vArqOri.focus();
		return false;
	}
	return true;
}
-->
</script>
<style type="text/css">
.divInteg {
	border: 1px solid #999999;
	background: #DCDCDC;
	width: 100%;
	height: 100%;
	overflow: scroll;
}
</style>
</head>

<body onLoad="document.frmIntegra.vArqOri.focus();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<form name="frmIntegra" action="/arquivo/upsalvar.asp" method="post" enctype="multipart/form-data" onSubmit="return ValidaForm(this);">
		<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
		<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
		<input type="hidden" name="cd_docto" value="<%= cd_docto%>">
		<input type="hidden" name="vQryStr" value="vNrContrato=<%=vNrContrato%>&vNrBanco=<%=vNrBanco%>">
		<input type="hidden" name="vScript" value="<%= Request.ServerVariables("SCRIPT_NAME")%>">
		<input type="hidden" name="vExtensao" value="pdf,tif,jpg">
		<tr height="25">
			<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td class="titpopup">&nbsp;Upload de contrato de câmbio</td>
						<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
					</tr>
				</table></td>
		</tr>
		<tr height="25">
			<td style="padding: 5px;">Selecione o arquivo com o contrato de câmbio digitalizado
				<input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
		</tr>
		<tr height="25">
			<td align="center" valign="bottom">&nbsp;
				<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo">
				<input type="button" name="btnCancelar" class="button" value="Cancelar" onClick="window.close();"></td>
		</tr>
		<tr height="15" align="center" bgcolor="#DBDADA">
			<td colspan="3"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
//exibe infos da integração
<%'if fnc_TestaVar(vOk) then Response.Write(vOk) %>
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
