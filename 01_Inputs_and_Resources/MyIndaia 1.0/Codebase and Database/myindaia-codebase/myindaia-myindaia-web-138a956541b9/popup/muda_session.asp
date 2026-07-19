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
Dim nome_session, valor_session
'recupera as variaveis para montagem da consulta
nome_session = Request("session")
valor_session = Request("valor")

vInDebug = false
Session(nome_session) = valor_session
%>

<!--#include virtual="/includes/inc_ends.asp" -->