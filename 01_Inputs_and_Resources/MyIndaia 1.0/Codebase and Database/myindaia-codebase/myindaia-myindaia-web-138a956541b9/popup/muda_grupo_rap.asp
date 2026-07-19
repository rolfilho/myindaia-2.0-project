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
Dim exibe_detalhe_atual
Dim cnnBroker, cmdBroker, rsBroker
'recupera as variaveis para montagem da consulta
exibe_detalhe_atual = Request("status")
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

	sql = "UPDATE TUSUARIO SET GRUPO_RAP = '" & exibe_detalhe_atual &  "' FROM TUSUARIO WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	cnnBroker.Execute(sql)
	Session("grupo_rap") = exibe_detalhe_atual
	Session("GrupoUsuario") = exibe_detalhe_atual
	
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
%>

<!--#include virtual="/includes/inc_ends.asp" -->