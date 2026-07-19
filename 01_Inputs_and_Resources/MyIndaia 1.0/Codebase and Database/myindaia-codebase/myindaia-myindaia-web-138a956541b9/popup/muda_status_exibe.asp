<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Funções do sistema
'Arquivo de Script e HTML: Localiza um registro no BD
'
'Autor Kleber Guedes
'Manutenção: Alexandre(26/02/2007)
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim status_exibe
Dim cnnBroker, cmdBroker, rsBroker
status_exibe = Request("status")

If status_exibe = "true" Then
	status_exibe = 0
Else
	status_exibe = 1
End if

vInDebug = false
'monta a instrução sql
	Dim cnstr 'string de conexão
	Set cnnBroker = Server.CreateObject("ADODB.Connection")
	Set cmdBroker = Server.CreateObject("ADODB.Command")
	Set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
					"User ID=MYINDAIAWEB;Password=myindaiaweb;"
	On error resume next
	cnnBroker.Open cnstr
	'Response.Redirect("../IMPORT/teste.asp?var1="&usuario&"")

	'str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	'cnnBroker.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	cmdBroker.ActiveConnection = cnnBroker

	sql = "UPDATE TUSUARIO SET EXIBE_RESUMO =" & status_exibe & " FROM TUSUARIO WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	cnnBroker.Execute(sql)
	Session("exibe_resumo") = status_exibe
	
	
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing

%>

<!--#include virtual="/includes/inc_ends.asp" -->