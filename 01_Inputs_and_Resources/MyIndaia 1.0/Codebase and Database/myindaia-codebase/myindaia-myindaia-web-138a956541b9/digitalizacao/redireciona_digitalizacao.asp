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
Select Case Request("idioma")
  Case 0
    Response.Redirect("/digitalizacao/digitalizacao_principal.aspx?produto="& Request("produto") &"&usuario="& Session("cd_usuario")&"&pg=1" )
  Case 1
    Response.Redirect("/digitalizacao/digitalizacao_principal_i.aspx?produto="& Request("produto") &"&usuario="& Session("cd_usuario")&"&pg=1" )
  Case 2
    Response.Redirect("/digitalizacao/digitalizacao_principal_e.aspx?produto="& Request("produto") &"&usuario="& Session("cd_usuario")&"&pg=1" )
  Case Else
    Response.Redirect("/digitalizacao/digitalizacao_principal.aspx?produto="& Request("produto") &"&usuario="& Session("cd_usuario")&"&pg=1" )
End Select
%>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>