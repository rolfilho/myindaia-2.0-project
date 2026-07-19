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
Dim cod_criptogrado
cod_criptografado = Request.QueryString("cod")
If objrsx.state=adstateOpen then objrsx.close()
sql = "SELECT MASTER.DBO.FN_DESCRIPROGRAFA('" & cod_criptografado & "') AS RESULTADO"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
%>
<script language="javascript">
//var features = "top=10,left=10,width=700,height=500,scrollbars=yes,menubar=no,location=no,status=no";
//popup = window.open('/<%=Trim(objrsx.Fields.Item("RESULTADO").Value)%>','_blank',features);
</script>
<html>
<head>
<title>Documentos Digitalizados</title>
</head>
<FRAMESET ROWS="12%, 88%"> 
<FRAME SRC="/includes/lay_header.asp">
<FRAME SRC="/<%=Trim(objrsx.Fields.Item("RESULTADO").Value)%>"> 
</FRAMESET><noframes></noframes>
</html>




<!--#include file="includes/inc_ends.asp"-->

