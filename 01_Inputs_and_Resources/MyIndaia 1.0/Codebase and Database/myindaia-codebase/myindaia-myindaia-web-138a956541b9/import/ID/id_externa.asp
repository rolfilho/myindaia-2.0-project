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
dim vCaminho, TxArquivo, id_codigo

vCaminho = Server.MapPath("/arquivo/upload/")
TxArquivo =  vCaminho & "\" & Request.QueryString("arquivo")

id_codigo = Trim(objIntegra.IntegraPlanilhaWhirlpool("INDAIA10", TxArquivo, CStr(Request.QueryString("usuario")))) 

if id_codigo <> "" Then
    If id_codigo = "LI" Then
      Response.Redirect("/import/ID/id_edita.aspx?acao=lista&erro=2") 
    Else
      Response.Redirect("/import/ID/id_edita.aspx?acao=editar&id_codigo="&id_codigo&"&erro=0") 
    End If
Else
    Response.Redirect("/import/ID/id_edita.aspx?acao=lista&erro=1") 
End If
set objIntegra = nothing
%>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>