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

dim objIntegra : set objIntegra = Server.CreateObject("MyCOM.IntegraPlan")

'Response.write objIntegra.GeraID(Request.QueryString("id"), CStr(Request.QueryString("tipo")))
'Response.end

select case objIntegra.GeraID(Request.QueryString("id"), CStr(Request.QueryString("tipo")))
	case 0					
		If CStr(Request.QueryString("tipo")) = "2" Then
			Response.Redirect("/import/ID/id_edita.aspx?autorizada=1&acao=editar&id_codigo="&Request.QueryString("id"))
		Else
			Response.write "OK"
			Response.end
		End If	
	case else
		If Cstr(Request.QueryString("tipo")) = "2" Then
			Response.Redirect("/import/ID/id_edita.aspx?autorizada=2&acao=editar&id_codigo="&Request.QueryString("id"))
		Else
			Response.write "NAO"
			Response.end
		End If
End Select
set objIntegra = nothing
%>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>