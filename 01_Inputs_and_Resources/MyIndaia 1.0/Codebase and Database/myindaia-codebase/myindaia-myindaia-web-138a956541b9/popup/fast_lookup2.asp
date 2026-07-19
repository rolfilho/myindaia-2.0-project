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
dim vTabela
dim vCampos
dim vCodigo
dim vInstrucao
dim vDescricao: vDescricao = ""
'recupera as variaveis para montagem da consulta
vTabela = Request("vTabela")
vCampos = Request("vCampos")
vReturn = Request("vReturn")
vCodigo = Request("vCodigo")
vInstrucao = Request("vInstrucao")
vInDebug = false
'monta a instrução sql

			Dim cnstr, cnnBroker, cmdBroker
			Set cnnBroker = Server.CreateObject("ADODB.Connection")
			Set cmdBroker = Server.CreateObject("ADODB.Command")
			cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
							"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
							"User ID=MYINDAIAWEB;Password=myindaiaweb;"
			On error resume next
			cnnBroker.Open cnstr
			cmdBroker.ActiveConnection = cnnBroker
			sql = "SELECT CONVERT(VARCHAR,"&vReturn&") FROM "&vTabela&" (NOLOCK) WHERE "&vCampos&" = '"&vCodigo&"'"
			objrs.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
			if objrs.RecordCount > 0 then
				vDescricao = objrs.Fields.Item(0).Value
				Response.Write(vDescricao)
			else
				Response.Write("erro")
			End if
		
			objrs.Close()

%>
<!--#include virtual="/includes/inc_ends.asp" -->