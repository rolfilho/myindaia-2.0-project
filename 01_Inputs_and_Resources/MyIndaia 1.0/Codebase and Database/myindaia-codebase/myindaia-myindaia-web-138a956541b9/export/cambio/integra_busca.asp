<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Programa: Gverifica se já foi gerado o arquivo de integração contábil
'Autor: 
'Criado: 
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% 'Response.Redirect("../../IMPORT/teste.asp?var1="&Session("sql_pagina")&"")

dim sql_s, sql_f, sql_w
dim vGrupoAux, vInReemite
dim vDtIni, vDtFim, vTipo

cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
vDtIni  = Request.QueryString("dtIni")
vDtFim  = Request.QueryString("dtFim")
vTipo   = Request.QueryString("tipo")
if Request.Form() <> "" then
	vInReemite = Request.Form("vInReemite")
	if not fnc_TestaVar(vInReemite) then vInReemite = 0
%>
<script language="javascript">
	window.focus();
	window.open('integra_txt.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&dtIni=<%= vDtIni %>&dtFim=<%= vDtFim %>&tipo=<%= vTipo %>&reemite=<%= vInReemite%>','download','top=100,left=20,width=360,height=400,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');
</script>
<%
Response.End()
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Contrato de Câmbio - Download</title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
'verifica se há registros
if objrs.State = adStateOpen then objrs.Close()
sql_s = "SELECT COUNT(*) "
sql_f = "FROM TCONT_CAMB CC (NOLOCK) "
sql_w = "  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '0' "

if InStr("040;055;060", Session("cd_cargo")) > 0 then
	sql_f = sql_f& " INNER JOIN TPERMISSAO PC (NOLOCK) ON (PC.CD_CLIENTE = CC.CD_EXPORTADOR AND PC.CD_USUARIO = '"& Session("cd_usuario") &"') "
end if 

'verifica se o arquivo já foi criado
select case vTipo
	case 1, 5 'Fechamento de cambio banco ACC DC / CAmbio Pronto
		if vTipo = 1 then x = "0"
		if vTipo = 5 then x = "1"
		sql_w = "WHERE CC.DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
						"  AND ISNULL(CC.IN_EMITIDO, '0') = '1' "&_
						"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '"& x &"' "
	case 2 'Vinculação de contrato ACC x ACE
	'Response.Redirect("../../import/teste.asp?var1="&vTipo&"")

		sql_f = sql_f &"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PE (NOLOCK) ON (PE.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PE.NR_BANCO = CC.NR_BANCO) "
		sql_w = "WHERE PE.DT_VINCULADO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
						"  AND ISNULL(PE.IN_EMITIDO, '0') = '1' "& sql_w
	case 3 'Provisão de juros
		sql_f = sql_f &"  INNER JOIN TCONT_CAMB_JUROS CJ (NOLOCK) ON (CJ.NR_CONT_CAMB = CC.NR_CONT_CAMB AND CJ.NR_BANCO = CC.NR_BANCO) "
		sql_w = "WHERE CC.DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
						"  AND ISNULL(CJ.IN_EMITIDO, '0') = '1' "& sql_w
	case 4 'pagamento de cliente ACE
		sql_f = sql_f &"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PE (NOLOCK) ON (PE.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PE.NR_BANCO = CC.NR_BANCO) "&_
						"  INNER JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PE.NR_PROCESSO AND PL.NR_FATURA_CDE = PE.NR_FATURA_CDE) "
		sql_w = "WHERE PL.DT_LIQUIDADO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
						"  AND ISNULL(PL.IN_EMITIDO, '0') = '1' "& sql_w
end select
'monta a query para execução

sql = sql_s&sql_f&sql_w
'Response.Redirect("../../IMPORT/teste.asp?var1="&sql&"")
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.Fields.Item(0).Value = 0 then 'não há nada reemitido
%>
<script language="javascript">
<!--
window.open('integra_txt.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&dtIni=<%= vDtIni %>&dtFim=<%= vDtFim %>&tipo=<%= vTipo %>&reemite=1','download','top=100,left=20,width=360,height=380,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');
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
  <tr height="20">
    <td></td>
  </tr>
  <tr>
    <td><input name="vInReemite" type="radio" value="1" checked>
      &nbsp;Gerar todos novamente</td>
  </tr>
  <tr>
    <td><input name="vInReemite" type="radio" value="0">
      &nbsp;Emitir apenas os não gerados</td>
  </tr>
  <tr height="20">
    <td></td>
  </tr>
  <tr>
    <td height="35" align="center"><input type="submit" class="button" value="Confirma">
      &nbsp;
      <input type="button" class="button" value="Cancelar" onClick="javascript:window.close();"></td>
  </tr>
</table>
<%
end if
%>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->
