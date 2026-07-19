<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim rap_arquivo, arquivo_exclui,objFSO2, tx_caminho2, tx_caminho_destino
rap_arquivo = Request("vNrRap")
arquivo_exclui = Request("arquivo")
vInDebug = false
tx_caminho_destino = "\arquivo\upload\" & Trim(rap_arquivo) & Trim(Session("GrupoUsuario") & "\" & arquivo_exclui)
Set objFSO2 = Server.CreateObject("Scripting.FileSystemObject")
tx_caminho2 = Server.MapPath(tx_caminho_destino)
objFSO2.DeleteFile tx_caminho2
%>