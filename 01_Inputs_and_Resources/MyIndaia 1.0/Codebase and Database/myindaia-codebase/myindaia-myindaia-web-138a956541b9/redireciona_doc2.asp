<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Página inicial após autenticação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 17/06/2005
'
'Manutenção: 22/06/2006
'---------------------------------------------------------------------------
Session("in_valida") = true
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->
<%
Dim cod_criptografado, resultado_criptografado, resultado_criptografado_array, diretorio_criptografado, caminho_criptografado 
cod_criptografado = Request.QueryString("cod")
If objrsx.state=adstateOpen then objrsx.close()
sql = "SELECT MASTER.DBO.FN_DESCRIPROGRAFA('" & cod_criptografado & "') AS RESULTADO"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	

resultado =  objrsx.Fields.Item("RESULTADO").Value
If objrsx.State = adStateOpen Then objrsx.Close()
caminho_criptografado = resultado
%>
<html>
<head>
<title>Documentos Digitalizados</title>
</head>
<FRAMESET ROWS="0%, 100%" frameborder="0" e framespacing="0"> 
<FRAME SRC="">
<FRAME SRC="/<%=caminho_criptografado%>" noresize="noresize"> 
</FRAMESET><noframes></noframes>
</html>
<!--#include file="includes/inc_ends.asp"-->

