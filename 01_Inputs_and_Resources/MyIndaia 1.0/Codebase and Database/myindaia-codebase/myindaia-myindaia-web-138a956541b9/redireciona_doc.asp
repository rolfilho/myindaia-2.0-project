<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Página inicial após autenticação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 17/06/2005
'
'Manutenção: 22/06/2006
'---------------------------------------------------------------------------
Session("in_valida") = true
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->
<html>
<head>
<title>Documentos Digitalizados</title>
</head>
<FRAMESET ROWS="10%, 90%" frameborder="0" e framespacing="0"> 
<FRAME SRC="/includes/lay_header2.asp" scrolling="no" marginheight="0" marginwidth="0" noresize="noresize">
<FRAME SRC="redireciona_doc2.asp?cod=<%= Request.QueryString("cod")%>" noresize="noresize"> 
</FRAMESET><noframes></noframes>
</html>




<!--#include file="includes/inc_ends.asp"-->

