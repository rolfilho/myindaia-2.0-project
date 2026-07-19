<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Modificado por Alexandre Gonçalves Neto em --/--/----
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
in_show = False
cd_tela = "005"
nm_tela = tx_lang_004001(cd_lang) &" >> "& tx_lang_005001(cd_lang)
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
tx_erro = Request.QueryString("tx_erro")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "cad_view.asp?"+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}
//-->
</script>
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
		<td width="100%" valign="top" height="50"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr height="30">
					<td class="titulo">..::: <%= tx_lang_005002(cd_lang)%> :::..</td>
				</tr>
				<tr height="20" align="center">
					<td><b><%= tx_lang_E00003(cd_lang)%>:</b>
						<select name="cad_view" class="select" onChange="MM_jumpMenu('self',this,0);">
							<option value=""><%= tx_lang_005004(cd_lang)%></option>
							<%
sql = "SELECT "&_
			"  M01_CD_MENU, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_NR_ORDEM, "&_
			"  M02_CD_SUBM, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_NR_ORDEM "&_
			"FROM M01_MENU ( NOLOCK ), M02_SUBM ( NOLOCK ), M09_ACESSO ( NOLOCK ) "&_
			"WHERE M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"  AND M09_IN_ACESSO  = 1 "&_
			"  AND M02_CD_MENU  = M09_CD_MENU "&_
			"  AND M02_CD_SUBM  = M09_CD_SUBM "&_
			"  AND M02_IN_ATIVO = 1 "&_
			"  AND M02_IN_VIEW  = 1 "&_
			"  AND M01_CD_MENU  = M02_CD_MENU "&_
			"  AND M01_IN_ATIVO = 1 "&_
			"ORDER BY M01_NR_ORDEM, M02_NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	cd_menu = objrs.Fields.Item("M01_CD_MENU").Value
	nm_menu = objrs.Fields.Item("M01_NM_MENU").Value
	cd_subm = objrs.Fields.Item("M02_CD_SUBM").Value
	nm_subm = objrs.Fields.Item("M02_NM_SUBM").Value
	Response.Write("<option value='cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view='>"& nm_subm &" "& nm_menu &"</option>")
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
						</select></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td width="100%" valign="top"><div id="dv_corpo" class="divMainVie">
				<table width="95%" border="0" cellspacing="1" cellpadding="0" align="center">
					<tr height="25" class="gridtit">
						<td><%= tx_lang_004027(cd_lang)%></td>
						<td><%= tx_lang_004046(cd_lang)%></td>
						<td><%= tx_lang_004048(cd_lang)%></td>
						<td><%= tx_lang_004050(cd_lang)%></td>
						<td><%= tx_lang_004052(cd_lang)%></td>
						<td><%= tx_lang_004038(cd_lang)%></td>
						<td><%= tx_lang_004044(cd_lang)%></td>
						<td><%= tx_lang_004040(cd_lang)%></td>
						<td><%= tx_lang_004042(cd_lang)%></td>
						<td><%= tx_lang_004031(cd_lang)%></td>
						<td><%= tx_lang_004028(cd_lang)%></td>
						<td><%= tx_lang_004030(cd_lang)%></td>
						<td><%= tx_lang_005003(cd_lang)%></td>
					</tr>
					<%
sql = "SELECT "&_
	  "  M06_CD_MENU, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, "&_
	  "  M06_CD_SUBM, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, "&_
	  "  M06_CD_VIEW, M06_NM_VIEW, M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL, "&_
		"  M06_IN_PRINT, M06_IN_PADRAO, M06_TP_RELAT, M06_TP_QUEBRA, M06_TP_REF_CLI, M06_CD_EVENTO, "&_
		"  M06_NR_DIAS "&_
	  "FROM M06_VIEW ( NOLOCK ) "&_
	  "  INNER JOIN M01_MENU ( NOLOCK ) ON ( M01_CD_MENU = M06_CD_MENU ) "&_
	  "  INNER JOIN M02_SUBM ( NOLOCK ) ON ( M02_CD_MENU = M06_CD_MENU AND M02_CD_SUBM = M06_CD_SUBM ) "&_
	  "WHERE M06_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
	  "  AND M06_IN_SYSTEM  = 0 "&_
	  "ORDER BY M06_CD_MENU, M06_CD_SUBM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

nrec = 0
cd_campo_quebra = ""
Do While Not objrs.Eof
  cd_menu = objrs.Fields.Item("M06_CD_MENU").Value
	nm_menu = objrs.Fields.Item("M01_NM_MENU").Value
	cd_subm = objrs.Fields.Item("M06_CD_SUBM").Value
	nm_subm = objrs.Fields.Item("M02_NM_SUBM").Value
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'quando muda campo definido no tipo de quebra, exibe o valor
	If cd_campo_quebra <> cd_menu & cd_subm Then
%>
					<tr height="20">
						<td colspan="13" class="gridtop">&nbsp;<%= nm_subm &" "& nm_menu%></td>
					</tr>
					<%
  End If
  cd_campo_quebra = cd_menu & cd_subm
%>
					<tr bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<td><%= objrs.Fields.Item("M06_NM_VIEW").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_PADRAO").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_DOWNLOAD").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_EMAIL").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_PRINT").Value%></td>
						<td><%= objrs.Fields.Item("M06_TP_QUEBRA").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_DT_PREV").Value%></td>
						<td><%= objrs.Fields.Item("M06_IN_EMBARQUE").Value%></td>
						<td><%= objrs.Fields.Item("M06_TP_REF_CLI").Value%></td>
						<td><%= objrs.Fields.Item("M06_TP_RELAT").Value%></td>
						<td><%= objrs.Fields.Item("M06_CD_EVENTO").Value%></td>
						<td><%= objrs.Fields.Item("M06_NR_DIAS").Value%></td>
						<td><table width="100%"  border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="33%"><a href="#"><img src="/imagens/icones/16x16/button_view.gif" height="13" width="14" border="0" alt="Visualizar"></a></td>
									<td width="33%"><a href="#"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="33%"><a href="#"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
								</tr>
							</table></td>
					</tr>
					<%
  nrec = nrec + 1
	objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
				</table>
			</div></td>
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
