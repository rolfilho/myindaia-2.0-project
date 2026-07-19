<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Gestão da Qualidade
'Arquivo de Script e HTML: Listagem dos Documentos
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/06/2006
'
'Manutenção: --/--/----
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim objFSO 'objeto para o sistema de arquivos
Dim objPasta 'pasta onde estarão os arquivos
Dim caminho 'caminho da pasta onde estão os arquivos
Dim arquivo 'nome dos arquivos para download

in_show = True
cd_tela = "QLD008"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

sql = "SELECT M08_NM_DOCTO, M08_AP_DOCTO "&_
			"FROM M08_DOCTOS ( NOLOCK ) "&_
			"WHERE M08_CD_DOCTO = "& fnc_QuotedSQL(Request.QueryString("cd_docto"))
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

caminho = Server.MapPath("/DOCS_QLD/CONTROLE")

Set objFSO   = Server.CreateObject("Scripting.FileSystemObject")
Set objPasta = objFSO.GetFolder(caminho)
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" rowspan="3" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td height="50" align="center"><font size="2"><b>..::: CONTROLE DE DOCUMENTOS E REGISTROS :::..</b></font><br></td>
	</tr>
	<tr>
		<td height="25" align="center"><b><%= objrs.Fields.Item("M08_NM_DOCTO").Value%></b><br></td>
	</tr>
	<tr>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr height="16">
						<td width="350" align="left">&nbsp;<b>Nome</b></td>
						<td width="50" align="left">&nbsp;<b>Tamanho</b></td>
						<td width="100" align="left">&nbsp;<b>Modificado</b></td>
					</tr>
					<%
'recupera o nome dos arquivos e preenche a tabela
For Each arquivo in objPasta.Files
%>
					<tr height="16">
						<td align="left">&nbsp;<a href="/DOCS_QLD/CONTROLE/<%= arquivo.Name%>" target="_blank"><%= arquivo.Name%></a></td>
						<td align="right">&nbsp;<%= Round( arquivo.Size / 1024, 1 )%> KB</td>
						<td align="left">&nbsp;<%= fnc_Mascara(arquivo.DateLastModified, 5)%></td>
					</tr>
					<%
Next
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->