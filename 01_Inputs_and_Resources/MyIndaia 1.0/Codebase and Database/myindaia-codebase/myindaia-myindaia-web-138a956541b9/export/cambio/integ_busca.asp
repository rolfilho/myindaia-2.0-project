<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 01/03/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1800

Dim sql_s, sql_f, sql_w
Dim vGrupoAux
Dim vDtIni, vDtFim, vTipo




cd_tela = "EXC001"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
vDtIni  = Request.QueryString("dtIni")
vDtFim  = Request.QueryString("dtFim")
vTipo   = Request.QueryString("tipo")

if Request.Form() <> "" then
%>
<script language="javascript">
<!--
window.focus();
window.open('integra_txt.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&dtIni=<%= vDtIni %>&dtFim=<%= vDtFim %>&tipo=<%= vTipo %>&reemite=<%= Request.Form("escolha")%>','download','top=100,left=20,width=250,height=175,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');
-->
</script>

<%
Response.End()
end if


%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div id="textInLoad" style="position:absolute; top:8; left:8" >
<%
'verifica se há registros
sql_s = ""
sql_f = ""
sql_w = ""

Select case vTipo
  Case 1
			if InStr("040;055;060", Session("cd_cargo")) > 0 then
				sql_f = sql_f& " INNER JOIN TPERMISSAO P (NOLOCK) ON P.CD_CLIENTE = C.CD_EXPORTADOR AND P.CD_USUARIO = '"& Session("cd_usuario") &"' "
			end if 
			
			'verifica se o arquivo já foi criado
			if objrs.State = adStateOpen then objrs.Close()
			sql_s = "SELECT COUNT(*) FROM TCONT_CAMB C (NOLOCK) INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = C.CD_EXPORTADOR  "
			sql_w = " WHERE DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
							"   AND ISNULL(IN_EMITIDO, '0') = '1' "
			sql = sql_s&sql_f&sql_w
   Case 2
	 
	 Case 3
	 
	 Case 4
	   
	 Case 5
end Select	 

Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	 
if objrs.Fields.Item(0).Value = 0 then 'não há nada reemitido
%>
<script language="javascript">
<!--
window.open('integra_txt.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&dtIni=<%= vDtIni %>&dtFim=<%= vDtFim %>&tipo=<%= vTipo %>&reemite=1','download','top=100,left=20,width=250,height=175,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');

-->
</script>

<%
Response.End()
else
%>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <form name="frmPergunta" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&dtIni=<%= vDtIni %>&dtFim=<%= vDtFim %>&tipo=<%= vTipo %>" method="post" /> 
	<tr>
		<td height="25" align="center"  class="titpopup">Existem registros já emitidos! Gostaria de gerá-los novamente? </td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr>
		<td><input name="escolha" type="radio" value="1" checked>&nbsp;Gerr todos novamente</td>
	</tr>
	<tr>
 	  <td><input name="escolha" type="radio" value="0">&nbsp;Emitir apenas os não gerados</td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr>
		<td height="35" align="center"><input type="submit" class="button" value="Confirma">&nbsp;
 		<input type="button" class="button" value="Cancelar" onClick="javascript:window.close();"></td>
	</tr>
</table>
<%
end if
%>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->