<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'------------------------------------------------------------------
'Sistema MyIndaia - Download de Planilhas Excel
'Arquivo de Script e HTML: inicia download de arquivo
'
'Modificado por Alexandre Gonçalves Neto em 27/05/2005
'
'------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_adovbs.asp"-->
<%
Dim objStream  'objeto para abrir e ler o arquivo
Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo

vTxCaminho = Request.QueryString("vTxCaminho")
vTxArquivo = Request.QueryString("vTxArquivo")

Response.AddHeader "pragma","no-cache"
Response.CacheControl = "private"
Response.Expires = -1
Response.Buffer = True
Response.AddHeader "Content-Type","application/vnd.ms-excel"
Response.AddHeader "Content-Disposition","attachment; filename="&vTxArquivo
'Response.AddHeader "Content-Length",fcn_PropArquivo("\excel\arquivo"& arquivo, 3)
Response.Flush

Set objStream = Server.CreateObject("ADODB.Stream")
objStream.Open
objStream.Type = adTypeBinary
objStream.LoadFromFile vTxCaminho&vTxArquivo
Response.BinaryWrite objStream.Read
objStream.Close
Set objStream = Nothing
Response.Flush
%>