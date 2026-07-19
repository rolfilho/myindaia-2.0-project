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
<% Response.Charset="ISO-8859-1" %>
<%
vInDebug = false
'recupera as variaveis para montagem da consulta
Dim cd_usuario, cd_mbf
Dim cnstr, cnnBroker, cmdBroker

Set cnnBroker = Server.CreateObject("ADODB.Connection")
Set cmdBroker = Server.CreateObject("ADODB.Command")
cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
				"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
				"User ID=sa;Password=123;"
On error resume next
cnnBroker.Open cnstr

cd_usuario = Request.QueryString("cd_usuario")
cd_mbf     = Request.QueryString("cd_mbf")

cmdBroker.ActiveConnection = cnnBroker
sql = "DELETE FROM TMBF_INFO WHERE CD_MBF = " & cd_mbf & " AND CD_USUARIO = '" & cd_usuario & "'" 
cnnBroker.Execute(sql)

set cmdBroker = nothing
set cnnBroker = nothing
Response.end
%>