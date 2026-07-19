<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Importação / Tracking
'Arquivo de Script e HTML: Filtros do Relatório
'
'Autor: Alexandre Gonçalves Neto
'Criado: 27/06/2005
'
'Manutenção: 25/07/2006
'---------------------------------------------------------------------------
%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Response.Redirect("/import/Pedido/pedido_edita.aspx?acao=lista&usuario="& Session("cd_usuario") )
%>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>