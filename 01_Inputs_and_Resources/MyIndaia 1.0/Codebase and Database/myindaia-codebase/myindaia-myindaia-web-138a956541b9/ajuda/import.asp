<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Autor 
'Criado: 
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "AJD001"
nm_tela = tx_lang_A00010(cd_lang) &" >> "& tx_lang_A00086(cd_lang)
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
tx_erro = Request.QueryString("tx_erro")
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="75" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" class="titulo"><p><%= tx_lang_A00086(cd_lang) &" "& tx_lang_A00010(cd_lang)%></p></td>
				</tr>
				<tr>
					<td height="50"><p align="center">
					<%
'seleciona os menus que o usuário tem permissão.
sql = "SELECT M09_CD_MENU, M09_CD_SUBM, "& tx_lang_subm &" AS M02_NM_SUBM, M02_AP_SUBM "&_
			"FROM M09_ACESSO ( NOLOCK ), M02_SUBM ( NOLOCK ) "&_
			"WHERE M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"  AND M09_CD_MENU    = '01' "&_
			"  AND M09_IN_ACESSO  = 1 "&_
			"  AND M09_CD_MENU    = M02_CD_MENU "&_
			"  AND M09_CD_SUBM    = M02_CD_SUBM "&_
			"ORDER BY M09_CD_SUBM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	str = ""
	If cd_subm = objrs.Fields.Item("M09_CD_SUBM").Value Then str = " style='font-weight: bold;'"
  Response.Write("<a href='/ajuda/import.asp?cd_menu="& objrs.Fields.Item("M09_CD_MENU").Value &"&cd_subm="& objrs.Fields.Item("M09_CD_SUBM").Value &"'"& str &">"& objrs.Fields.Item("M02_NM_SUBM").Value &"</a>")
  objrs.MoveNext
	If objrs.Eof Then Exit Do Else Response.Write(" | ")
Loop
objrs.Close
%>
					</p></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="1" cellspacing="0" cellpadding="5" align="center">
					<%
Select Case cd_subm
	Case "01" 'track
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "02" 'lead-time
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "03" 'alerta
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "04" 'custo
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "05" 'controle de li
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "06" 'kpi
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "07" 'demurrage
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "08" 'cash flow
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
End Select
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
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
