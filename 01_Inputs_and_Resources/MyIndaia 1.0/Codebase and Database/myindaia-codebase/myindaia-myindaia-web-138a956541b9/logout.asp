<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'Sistema MyIndaia - Logon do Sistema
'Arquivo de Script: Saída do Sistema
'Modificado por Alexandre Gonçalves Neto em 15/03/2005

%>
<!--#include file="includes/inc_utils.asp" -->
<%

dim cnnBroker, cmdBroker, rsBroker
sub subConectaBroker(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnBroker = Server.CreateObject("ADODB.Connection")
	set cmdBroker = Server.CreateObject("ADODB.Command")
	set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnBroker.Open cnstr
end sub

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
end sub

call subConectaBroker("INDAIA10","BROKER","MYINDAIAWEB","myindaiaweb") 
With cmdBroker
    sql = "UPDATE TUSUARIO SET IN_ONLINE = '0', " & _
    " DT_ULT_ACESSO = '" & Session("dt_acesso") & "'" &_
    " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
    cnnBroker.Execute(sql)
End With
call subFechaBroker()

On Error Resume Next
Session.Abandon
Session("cd_idioma") = ""
Session("login_valido") = false
Session("in_valida") = false
Session("confere_importador") = 0
Session("importador_valido") = 0
Response.Redirect("http://"& Request.ServerVariables("SERVER_NAME") &"/?cd_idioma="& Session("cd_idioma"))
%>