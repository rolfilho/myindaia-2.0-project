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
if Request("cd_mbf") = "" Then
    If Request("in_interno")  = "1" Then
      Response.Redirect("/MBF/mbf_novo.aspx?usuario="& Request("usuario") & "&cd_menu=" & Request("cd_menu"))
    Else
      Response.Redirect("/default.asp")  
    End If
Else
  If Request("in_interno")  = "1" Then
    Response.Redirect("/MBF/mbf_personaliza.aspx?usuario="& Request("usuario") & "&codigo=" & Request("cd_mbf") & "&cd_menu=" & Request("cd_menu"))
  Else
    Dim cnnMy, cmdMy, rsMy, rsMy2, usuario_criador, mbf_criador
    Dim cnstr 'string de conexão
	Set cnnMy = Server.CreateObject("ADODB.Connection")
	Set cmdMy = Server.CreateObject("ADODB.Command")
	Set rsMy  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnMy.Open cnstr
	cmdMy.ActiveConnection = cnnMy
	
	If rsMy.State = adStateOpen Then rsMy.Close() 
	sql = " SELECT CD_USUARIO_CRIADOR, CD_MBF_CRIADOR FROM TMBF_INFO WHERE CD_USUARIO = '" & Request("usuario") & "' AND CD_MBF = " & Request("cd_mbf") & ""
    rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
    usuario_criador = rsMy("CD_USUARIO_CRIADOR")
    mbf_criador = rsMy("CD_MBF_CRIADOR")
    if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing

    Response.Redirect("/MBF/mbf_apresentacao.aspx?usuario="& usuario_criador & "&codigo=" & mbf_criador & "&cd_menu=" & Request("cd_menu") & "&in_interno=0")
  End If
End If
%>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>