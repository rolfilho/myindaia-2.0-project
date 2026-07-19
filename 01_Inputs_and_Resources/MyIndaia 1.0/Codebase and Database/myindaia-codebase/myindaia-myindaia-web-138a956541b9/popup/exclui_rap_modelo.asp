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
vInDebug = false
Dim rap_excluir
	rap_excluir = Request("rap")
	
	If objrsx.State = adStateOpen then objrsx.Close()	
	sql = "DELETE FROM TRAP WHERE CD_RAP+CD_RAP_ANO = '"&rap_excluir&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	objcnn.Execute(sql)			
%>
<!--#include virtual="/includes/inc_ends.asp" -->