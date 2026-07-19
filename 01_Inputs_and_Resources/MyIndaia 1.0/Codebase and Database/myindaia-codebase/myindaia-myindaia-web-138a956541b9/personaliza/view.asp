<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Personalização do Site
'Arquivo de Script e HTML: Cadastro de Personalizações
'
'Modificado por Alexandre Gonçalves Neto em 18/01/2006
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vTpAcao : vTpAcao = Request("vTpAcao")
dim vNmView
dim vInExEmbarq, vInExCalKPI, vInExDtPrev, vInExDown, vInExEmail, vInExPrint, vInExDocto, vInExTpRel, vInExQuebra, vInExOrdem
dim vQtdeFiltro, vQtdeCampo
dim vInEmbarq, vInCalKPI, vInDtPrev, vInDown, vInEmail, vInPrint, vInDocto
dim vTpRelat, vTpQuebra, vCodOrdem, vTpOrdem

in_show = True
cd_tela = "004"
nm_tela = tx_lang_004001(cd_lang) &" &gt;&gt; "
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
tx_erro = Request("tx_erro")

'recupera o nome do menu e sub-menu
sql = "SELECT RTRIM("& tx_lang_menu &") AS M01_NM_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, "&_
			"  M02_EX_EMBARQUE, M02_EX_CALC_KPI, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, "&_
			"  M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, M02_EX_ORDEM, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO "&_
			"FROM M02_SUBM (NOLOCK) " &_
			" INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = M02_CD_MENU) " &_
			"WHERE M02_CD_MENU = '"& cd_menu &"' AND M02_CD_SUBM = '"& cd_subm &"' "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'escreve o nome do menu e submenu para aparecer na tela
nm_tela = nm_tela & objrs.Fields.Item("M01_NM_MENU").Value &" &gt;&gt; "& objrs.Fields.Item("M02_NM_SUBM").Value
'verifica quais opções serão exibidas no cadastro
vInExEmbarq = objrs.Fields.Item("M02_EX_EMBARQUE").Value
vInExCalKPI = objrs.Fields.Item("M02_EX_CALC_KPI").Value
vInExDtPrev = objrs.Fields.Item("M02_EX_DT_PREV").Value
vInExDown   = objrs.Fields.Item("M02_EX_DOWNLOAD").Value
vInExEmail  = objrs.Fields.Item("M02_EX_EMAIL").Value
vInExPrint  = objrs.Fields.Item("M02_EX_PRINT").Value
vInExDocto  = objrs.Fields.Item("M02_EX_DOCTOS").Value
vInExTpRel  = objrs.Fields.Item("M02_EX_RELAT").Value
vInExQuebra = objrs.Fields.Item("M02_EX_QUEBRA").Value
vInExOrdem  = objrs.Fields.Item("M02_EX_ORDEM").Value
vQtdeFiltro = objrs.Fields.Item("M02_NR_MAX_FILTRO").Value
vQtdeCampo  = objrs.Fields.Item("M02_NR_MAX_CAMPO").Value
objrs.Close

if vTpAcao = "novo" then
	cd_user   = Session("cd_usuario")
	cd_view   = cd_user &"-"& cd_menu & cd_subm &"-"
	vNmView   = ""
	vInEmbarq = 1
	vInCalKPI = 0
	vInDtPrev = 0
	vInDown   = 0
	vInEmail  = 0
	vInPrint  = 0
	vInDocto  = 0
	vTpRelat  = 2
	vTpQuebra = 2
	vCodOrdem = ""
	vTpOrdem  = 0
	nm_tela   = tx_lang_004002(cd_lang) &" "& nm_tela
end if


%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
#divFiltro {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}
.divCampo {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}
</style>
</head>
<body onLoad="document.frmView.edtNmView.focus();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<form name="frmView" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&vTpAcao=salvar" method="post" onSubmit="return ValidaForm(this,'<%= vTpAcao%>');">
		<tr valign="top">
			<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
				<!--#include virtual="/includes/lay_header.asp" -->
				<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
			</td>
		</tr>
		<tr height="75">
			<td width="250" valign="top" rowspan="2"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
				<!--#include virtual="/includes/lay_menu.asp" -->
				<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
			</td>
			<td width="100%" valign="top" bgcolor="#FCFCFC" style="border: 1px #CCCCCC solid;"><table width="100%" border="0" cellpadding="0" cellspacing="1">
					<tr height="30">
						<td colspan="8" class="titulo">..::: Personaliza&ccedil;&atilde;o de Relat&oacute;rio:::..</td>
					</tr>
					<tr height="40" align="center">
						<td width="45"><img name="btnNovo" src="/imagens/icones/32x32/btn_novo.jpg" class="btnImagem" alt="Novo Contrato" onClick="ExecutaAcao(0,'<%= vTpAcao%>');"></td>
						<td width="45"><input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Salvar Edição" value="Submit"></td>
						<td width="45"><img name="btnCancelar" src="/imagens/icones/32x32/btn_cancelar.gif" class="btnImagem" alt="Cancelar Edição" onClick="ExecutaAcao(2,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnExcluir" src="/imagens/icones/32x32/btn_excluir.gif" class="btnImagem" alt="Excluir" onClick="ExecutaAcao(3,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnLista" src="/imagens/icones/32x32/btn_listar.gif" class="btnImagem" alt="Listar Contratos" onClick="ExecutaAcao(7,'<%= vTpAcao%>');"></td>
						<td width="70%">&nbsp;</td>
					</tr>
					<tr height="25">
						<td colspan="11" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Dados B&aacute;sicos </b></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
				<div id="dv_corpo" class="formClass">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><label for="edtNmView"><%= tx_lang_004027(cd_lang)%></label></td>
							<td><input name="edtNmView" type="text" class="editbox" id="edtNmView" style="width:250px;" value="<%= vNmView%>" maxlength="30"></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<%
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT M11_CD_FILTRO, M13_CD_FILTRO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
			"FROM M11_FILTRO (NOLOCK) "&_
			"  INNER JOIN M10_DADOS (NOLOCK) ON (M10_CD_DADO = M11_CD_DADO) "&_
			"  LEFT JOIN M13_VIEW_FILTRO (NOLOCK) ON (M13_CD_FILTRO = M11_CD_FILTRO AND M13_CD_VIEW = '"&cd_view&"') "&_
			"WHERE M11_CD_MENU = '"&cd_menu&"' "&_
			"  AND M11_CD_SUBM = '"&cd_subm&"' "&_
			"  AND M11_TP_EXIBIR >= '"&Session("tp_exibir")&"' "&_
			"  AND ISNULL(M11_IN_ATIVO, 0) = 1 "&_
			"  AND ISNULL(M10_IN_ATIVO, 0) = 1 "&_
			"ORDER BY M10_NM_DADO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
%>
						<tr height="25">
							<td colspan="4" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Selecione os Filtros</b></td>
						</tr>
						<tr>
							<td colspan="2" width="40%">&nbsp;</td>
							<td colspan="2" width="60%">&nbsp;</td>
						</tr>
						<tr height="200">
							<td colspan="2" width="40%"><div id="divFiltro">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<%
	do while not objrs.Eof
		if fnc_TestaVar(objrs.Fields.Item("M13_CD_FILTRO").Value) then checked = " checked" else checked = ""
%>
										<tr>
											<td><input type="checkbox" name="checkbox" value="checkbox" value="<%= objrs.Fields.Item("M11_CD_FILTRO").Value%>"<%= checked%>></td>
											<td><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<%
		objrs.MoveNext
	loop
%>
									</table>
								</div></td>
								<td colspan="2" width="60%">&nbsp;</td>
						</tr>
						<%
end if
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT M12_CD_CAMPO, M14_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
			"FROM M12_CAMPO (NOLOCK) "&_
			"  INNER JOIN M10_DADOS (NOLOCK) ON (M10_CD_DADO = M12_CD_DADO) "&_
			"  LEFT JOIN M14_VIEW_CAMPO (NOLOCK) ON (M14_CD_CAMPO = M12_CD_CAMPO AND M14_CD_VIEW = '"&cd_view&"') "&_
			"WHERE M12_CD_MENU    = '"&cd_menu&"' "&_
			"  AND M12_CD_SUBM    = '"&cd_subm&"' "&_
			"  AND M12_TP_EXIBIR >= '"&Session("tp_exibir")&"' "&_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "&_
			"ORDER BY M10_NM_DADO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
%>
						<tr height="25">
							<td colspan="4" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Selecione os Campos</b></td>
						</tr>
						<tr>
							<td colspan="2" width="40%">&nbsp;</td>
							<td colspan="2" width="60%">&nbsp;</td>
						</tr>
						<tr height="200">
							<td colspan="2" width="40%"><div id="divCampo" class="popupClass">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<%
	do while not objrs.Eof
		if fnc_TestaVar(objrs.Fields.Item("M14_CD_CAMPO").Value) then checked = " checked" else checked = ""
%>
										<tr>
											<td><input type="checkbox" name="checkbox" value="checkbox" value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>"<%= checked%>></td>
											<td><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
										</tr>
										<%
		objrs.MoveNext
	loop
%>
									</table>
								</div></td>
								<td colspan="2" width="60%">&nbsp;</td>
						</tr>
						<%
end if
if objrs.State = adStateOpen then objrs.Close()
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
	</form>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
