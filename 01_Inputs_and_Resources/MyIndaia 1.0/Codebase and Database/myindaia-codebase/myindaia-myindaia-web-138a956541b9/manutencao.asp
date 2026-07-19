<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do sistema
'Arquivo de Script e HTML: Site em manutenção
'
'Modificado por Alexandre Gonçalves Neto em 09/08/2005
'
'---------------------------------------------------------------------------
%>
<!--#include file="includes/inc_utils.asp"-->
<%
'tenta conectar novamente
Call sub_AbreConexao("INDAIA10", "MYINDAIA", SQLUSERNAME, SQLPASSWORD)
'caso obtenha sucesso redireciona para a autenticação
If Err.Number = 0 Then
  Session.Abandon
  Response.Redirect("http://"& Request.ServerVariables("SERVER_NAME") &"/")
End If

in_show = True
cd_tela = "003"
nm_tela = tx_lang_003001(cd_lang)
tx_erro = Request.QueryString("tx_erro")
%>
<html>
<head>
<!--#include file="includes/lay_title.asp"-->
<style type="text/css">
<!--
.style2 {font-size: 18}
-->
</style>
</head>

<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
  <tr valign="top">
    <td height="87">
	<!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
	  <!--#include file="includes/lay_header.asp" -->
	<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
	</td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <form action="logon.asp" method="post" name="frm_logon" onSubmit="return fnc_ValidaLogin(this);">
        <tr>
          <td height="75" align="center"><h4><b><%= tx_lang_002001(cd_lang)%></b></h4></td>
        </tr>
        <tr>
          <td align="center" class="style2"><%= tx_lang_003002(cd_lang)%>.<br>
			  	<%= tx_lang_003003(cd_lang)%>.</td>
        </tr>
        <tr>
          <td height="25" align="center"><%= tx_lang_002010(cd_lang)%> Net Track: <a href="http://intra.indaialogistica.com.br" target="_blank"><%= tx_lang_A00005(cd_lang)%>.</a></td>
        </tr>
      </form>
    </table></td>
  </tr>
  <tr>
    <td height="16">
	<!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
	  <!--#include file="includes/lay_bottom.asp" -->
	<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
	</td>
  </tr>
</table>
</body>
</html>
<!--#include file="includes/inc_ends.asp"-->