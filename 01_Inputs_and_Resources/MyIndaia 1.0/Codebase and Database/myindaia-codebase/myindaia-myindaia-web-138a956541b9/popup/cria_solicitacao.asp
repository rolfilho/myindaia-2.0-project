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
Dim cnnSuporte, cmdSuporte, rsSuporte
Dim nr_ocorrencia
Dim nm_motivo, cd_grupo_ocorrencia, texto_aux, nm_grupo_ocorrencia
nm_motivo = Request("nm_motivo")
cd_grupo_ocorrencia = Request("cd_grupo_ocorrencia")
nm_grupo_ocorrencia = Request("nm_grupo_ocorrencia")

If cd_grupo_ocorrencia <> "0" Then
	texto_aux = "(Cliente - " & Trim(nm_grupo_ocorrencia) & ")"
Else
	texto_aux = "(Usuário interno)"	
End If

'recupera as variaveis para montagem da consulta
vInDebug = false
'monta a instrução sql
	Dim cnstr 'string de conexão
	Set cnnSuporte = Server.CreateObject("ADODB.Connection")
	Set cmdSuporte = Server.CreateObject("ADODB.Command")
	Set rsSuporte  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA05;Initial Catalog=SUPORTE;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnSuporte.Open cnstr
	cmdSuporte.ActiveConnection = cnnSuporte
	
	sql = "SELECT RIGHT('00000' + ISNULL(CONVERT(VARCHAR, MAX(LEFT(CD_OCORRENCIA, 5)) +1), 1), 5) + "&_
	" RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2) AS OCORRENCIA"&_
	" FROM TOCORRENCIA"&_
	" WHERE YEAR(DT_ABERTURA) = YEAR(GETDATE())"
	rsSuporte.Open sql, cnnSuporte, adOpenStatic, adlockReadOnly, adcmdtext
	nr_ocorrencia = rsSuporte.Fields.Item("OCORRENCIA").Value

	sql = "INSERT INTO TOCORRENCIA(CD_OCORRENCIA, CD_USUARIO, DT_ABERTURA, CD_CAMINHO_1, CD_CAMINHO_2, CD_CAMINHO_3, CD_CAMINHO_4, NM_MOTIVO, CD_STATUS, CD_DELEGADO) "&_
    " VALUES('" & nr_ocorrencia & "', '" & Session("cd_usuario") &  "', GETDATE(), '01', '001', '0002', '00205', '" & texto_aux & " " & nm_motivo & "', '0013', '0013')"
	cnnSuporte.Execute(sql)
	
	if rsSuporte.State  = adStateOpen then rsSuporte.Close
	if cmdSuporte.State  = adStateOpen then cmdSuporte.Close
	if cnnSuporte.State  = adStateOpen then cnnSuporte.Close
	set rsSuporte = nothing
	set cmdSuporte = nothing
	set cnnSuporte = nothing
%>

<!--#include virtual="/includes/inc_ends.asp" -->