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
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "001"
nm_tela = "Escolha a consulta desejada >>"
tx_erro = Request.QueryString("tx_erro")

'err.Raise "232",script,"FALHA!!!"
%>
<html>
<head>
<!--#include file="includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include file="includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include file="includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="350">
						<td align="center"><%
'dim rsSchema
'set rsSchema = objcnn.OpenSchema(1)

'do while not rsSchema.Eof
'	Response.Write(rsSchema("CATALOG_NAME")&"<br>")
'	rsSchema.MoveNext
'loop

'rsSchema.Close
'set rsSchema = nothing
if Session("cd_cargo") = "001" then
	dim arrCnnString, strTable
	strTable = "<table border=1 cellspacing=1 cellpadding=1><col width=135><col width=135>"&_
						 "<tr><td align=center colspan=2 style=""font-size:12px;""><b>Conexão de Dados Info</b></td></tr>"
	arrCnnString = Split(objcnn.ConnectionString,";",-1)
	
	for x = 0 to Ubound(arrCnnString)
		if InStr(arrCnnString(x),"Data Source") > 0 then color = " style=""color:#FF0000""" else color = ""
		strTable = strTable&"<tr><td>"&Replace(arrCnnString(x),"=","</td><td"&color&"><b>&nbsp;")&"</b></td></tr>"
	next
	Response.Write(strTable&"</table>Estas informações são exibidas apenas para os administradores.")
end if
%>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include file="includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include file="includes/inc_ends.asp"-->
