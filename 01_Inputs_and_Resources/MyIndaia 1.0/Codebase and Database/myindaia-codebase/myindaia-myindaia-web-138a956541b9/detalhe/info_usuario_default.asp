<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" 

dim cnnBroker, cmdBroker, rsBroker
dim cnnMy, cmdMy, rsMy
dim sql2

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

sub subConectaMy(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnMy = Server.CreateObject("ADODB.Connection")
	set cmdMy = Server.CreateObject("ADODB.Command")
	set rsMy  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnMy.Open cnstr
end sub

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
end sub

sub subFechaMy()
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing

end sub

Dim cont_usuario_online
cont_usuario_online = 0
if Session("cargo_interno") = "1" then
    sql = " SELECT COUNT(U.CD_USUARIO) - 1 AS CONTADOR " &_
    " FROM TUSUARIO U (NOLOCK)" & _ 
    " INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO "&_
    " WHERE U.IN_ONLINE = '1' " & _
    "   AND C.IN_INTERNO = '1' "&_
    "   AND CONVERT(VARCHAR, U.DT_ULTIMA_ACAO, 103) = CONVERT(VARCHAR, GETDATE(), 103) "&_
    "   AND CONVERT(VARCHAR, U.DT_ULTIMA_ACAO, 108) > CONVERT(VARCHAR, DATEADD(MINUTE, -15, GETDATE()), 108) "
Else
    sql = " SELECT COUNT(DISTINCT U.CD_USUARIO) - 1 AS CONTADOR " &_
    " FROM TPERMISSAO_GRUPO TP (NOLOCK) " &_
    " INNER JOIN TGRUPO   TG (NOLOCK) ON TP.CD_GRUPO = TG.CD_GRUPO " &_
    " INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = TP.CD_USUARIO " &_
    " WHERE TP.CD_GRUPO IN (SELECT CD_GRUPO FROM TPERMISSAO_GRUPO WHERE CD_USUARIO = '" & Request.QueryString("usuario") & "') " &_
    "   AND U.IN_ONLINE = '1'"&_
    "   AND CONVERT(VARCHAR, U.DT_ULTIMA_ACAO, 103) = CONVERT(VARCHAR, GETDATE(), 103)"&_
    "   AND CONVERT(VARCHAR, U.DT_ULTIMA_ACAO, 108) > CONVERT(VARCHAR, DATEADD(MINUTE, -15, GETDATE()), 108) "
End If 
'Response.write sql
'Response.end
call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
if rsBroker("CONTADOR") > 0 Then cont_usuario_online = rsBroker("CONTADOR")

Response.write tx_lang_001004(cd_lang) & cont_usuario_online & tx_lang_001005(cd_lang)
call subFechaBroker()
%>