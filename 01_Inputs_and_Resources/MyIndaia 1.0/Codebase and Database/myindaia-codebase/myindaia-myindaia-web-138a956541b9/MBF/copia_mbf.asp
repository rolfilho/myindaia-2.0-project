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
Dim cd_usuario, cd_usuario_para, cd_mbf, cd_grupo, cd_cliente, nm_mbf, tipo
Dim cnstr, cnnBroker, cmdBroker

Set cnnBroker = Server.CreateObject("ADODB.Connection")
Set cmdBroker = Server.CreateObject("ADODB.Command")
cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
				"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
				"User ID=sa;Password=123;"
On error resume next
cnnBroker.Open cnstr
cmdBroker.ActiveConnection = cnnBroker

cd_usuario = Request.QueryString("cd_usuario")
cd_usuario_para = Request.QueryString("cd_usuario_para")
cd_mbf     = Request.QueryString("cd_mbf")
cd_grupo   = Request.QueryString("cd_grupo")
cd_cliente = Request.QueryString("cd_cliente")
cd_area    = Request.QueryString("cd_area")
nm_mbf     = Request.QueryString("nm_mbf")
tipo       = Request.QueryString("tipo")

if cd_usuario_para = "" Then cd_usuario_para = "0000" 
if nm_mbf          = "" Then nm_mbf = "EM BRANCO" 
if cd_grupo        = "" Then cd_grupo = "000" 
if cd_cliente      = "" Then cd_cliente = "00000" 
if cd_area         = "" Then cd_area = "00" 

'Response.write cd_mbf & "<br>"
'Response.write cd_usuario & "<br>"
'Response.write cd_usuario_para & "<br>"
'Response.write cd_grupo & "<br>"
'Response.write cd_cliente & "<br>"
'Response.write cd_area & "<br>"
'Response.write nm_mbf & "<br>"
'Response.write tipo & "<br>"
'Response.end

With cmdBroker
	.CommandTimeOut = 9999
	.CommandText    = "sp_cria_mbf_duplica"
	.CommandType    = adCmdStoredProc	
    .Parameters.Append = .CreateParameter("@cd_mbf" , adInteger, adParamInput, 0, cd_mbf)
	.Parameters.Append = .CreateParameter("@cd_usuario"  , adChar   , adParamInput, 4, cd_usuario)   
    .Parameters.Append = .CreateParameter("@cd_usuario_para"  , adChar   , adParamInput, 4, cd_usuario_para)    
	.Parameters.Append = .CreateParameter("@cd_grupo", adChar   , adParamInput, 3, cd_grupo)
    .Parameters.Append = .CreateParameter("@cd_cliente", adChar   , adParamInput, 5, cd_cliente)
    .Parameters.Append = .CreateParameter("@cd_area", adChar   , adParamInput, 2, cd_area)
    .Parameters.Append = .CreateParameter("@nm_mbf", adVarChar , adParamInput, 1024, nm_mbf)
    .Parameters.Append = .CreateParameter("@tipo", adChar , adParamInput, 1, tipo)
	.Execute , , adExecuteNoRecords
End With

set cmdBroker = nothing
set cnnBroker = nothing
Response.end
%>