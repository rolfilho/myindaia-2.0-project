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
Dim objStream 	'objeto para abrir e ler o arquivo
Dim arquivo 	'nome do arquivo

cd_tela = "EXC000"
tx_erro = Request.QueryString("tx_erro")
arquivo = Request.QueryString("arquivo")

Response.AddHeader "pragma","no-cache"
Response.CacheControl = "private"
Response.Expires = -1
Response.Buffer = True
Response.AddHeader "Content-Type","application/vnd.ms-excel"
Response.AddHeader "Content-Disposition","attachment; filename=\excel\arquivo"& arquivo
'Response.AddHeader "Content-Length",fcn_PropArquivo("\excel\arquivo"& arquivo, 3)
Response.Flush

Set objStream = Server.CreateObject("ADODB.Stream")
objStream.Open
objStream.Type = adTypeBinary

objStream.LoadFromFile Server.MapPath("\excel\arquivo"& arquivo)
Response.BinaryWrite objStream.Read
objStream.Close
Set objStream = Nothing
Response.Flush
%>