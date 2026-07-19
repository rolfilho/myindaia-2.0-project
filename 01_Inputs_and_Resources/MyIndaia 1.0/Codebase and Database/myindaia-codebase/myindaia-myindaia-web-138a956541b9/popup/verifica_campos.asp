<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
'recupera as variaveis para montagem da consulta
cd_menu = Request("menu")
cd_campo = Request("campo")

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
    sql = "SELECT M12.M12_CD_DADO AS CD_DADO,  CASE WHEN M10_TP_DADO  = '1' AND M10_CD_BROKER IS NOT NULL THEN 'RLZ_' + RTRIM(M10_AP_CAMPO) ELSE CASE WHEN M10_CD_DADO IN ('0373','0018') THEN 'R.' + UPPER(RTRIM(M10_AP_CAMPO)) ELSE UPPER(RTRIM(M10_AP_CAMPO)) END END AS AP_CAMPO"&_
    " FROM M12_CAMPO M12 (NOLOCK) "&_
    "  INNER JOIN M10_DADOS M10 (NOLOCK) ON M10.M10_CD_DADO = M12.M12_CD_DADO "&_
    "  WHERE M12.M12_CD_CAMPO = '" & cd_campo & "' "&_
    "    AND (M12.M12_IN_MONTA_SQL = 1 OR RIGHT('" & cd_campo & "', 4) IN ('0373')) "&_
    "    AND M12.M12_CD_MENU = '" & cd_menu & "' "&_
    "    AND M12.M12_CD_SUBM = '03' "
    rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
    if rsBroker.RecordCount > 0 Then
      Response.write rsBroker("CD_DADO") & "%" & rsBroker("AP_CAMPO") 
    Else
      Response.write "0" 
    End If

	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing

	%>
    

