<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% Response.Charset="ISO-8859-1" %>
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
Dim cnnBroker, cmdBroker, rsBroker
'recupera as variaveis para montagem da consulta
vInDebug = false
'monta a instrução sql
	Dim cnstr 'string de conexão
	Set cnnBroker = Server.CreateObject("ADODB.Connection")
	Set cmdBroker = Server.CreateObject("ADODB.Command")
	Set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnBroker.Open cnstr

	cmdBroker.ActiveConnection = cnnBroker
	sql = "SELECT TX_ACAO_" & Request("btn") & " AS ACAO FROM TAVISOS_WEB WHERE CD_AVISO = '" & Request("aviso") & "' AND CD_USUARIO = '" & Request("usuario") & "'"
	rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
    acao = rsBroker.Fields.Item("ACAO").Value

    if fnc_TestaVar(acao) Then
        sql = acao
        cnnBroker.Execute(sql)
    End If

    sql = "UPDATE TAVISOS_WEB SET IN_VISUALIZADO = '1', BTN_ESCOLHIDO = '" & Request("btn") & "' WHERE CD_USUARIO = '" & Request("usuario") & "' AND CD_AVISO = '" & Request("aviso") & "'"
	cnnBroker.Execute(sql)

	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
%>

<!--#include virtual="/includes/inc_ends.asp" -->