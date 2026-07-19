<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Limitador
'
'Autor Alexandre Gonçalves Neto
'Criado: 06/02/2007
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim cd_evento 'evento limitador

in_show   = False
cd_tela   = "ADM017"
cd_menu   = Request.QueryString("cd_menu")
cd_subm   = Request.QueryString("cd_subm")
cd_docto  = Request.QueryString("cd_docto")
nm_tela   = fnc_NomeTela(cd_menu, cd_subm, cd_docto, Null)
tx_erro   = Request.QueryString("tx_erro")
tx_campo  = CStr(Request.QueryString("tx_campo"))
tx_ordem  = CStr(Request.QueryString("tx_ordem"))
nr_pagina = CInt(Request.QueryString("nr_pagina"))
tx_link   = "personal.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto
Session("sql_pagina") = Session("sql_pagina") &"<br>QUERYSTRING: "& Request.QueryString &"<br>"

'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(tx_campo) Then tx_campo = "M06_NM_VIEW"
If Not fnc_TestaVar(tx_ordem) Then tx_ordem = "ASC"
If nr_pagina = 0 Then nr_pagina = 1

'recupera informação dos registro
cd_view = Trim(Request.QueryString("cd_view"))
cd_user = Trim(Request.QueryString("cd_user"))
'exclui o registro
If Request.QueryString("in_acao") = "excluir" Then
	If Trim(cd_view) = "" Then
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
							tx_lang_004019(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
	Else
		'seleciona a personalização
		sql = "SELECT M06_IN_PADRAO FROM M06_VIEW ( NOLOCK ) WHERE M06_CD_VIEW = '"& cd_view &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		If Not objrs.Fields.Item("M06_IN_PADRAO").Value Then
			'apaga os registros da tabela view_filtro
			sql = "DELETE FROM M13_VIEW_FILTRO WHERE M13_CD_VIEW = '"& cd_view &"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			'apaga os registros da tabela view_campo
			sql = "DELETE FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '"& cd_view &"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			'apaga a view selecionanda 
			sql = "DELETE FROM M06_VIEW WHERE M06_CD_VIEW = '"& cd_view &"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			tx_erro = tx_lang_004020(cd_lang) &"."
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004021(cd_lang)
		End If
		objrs.Close
	End If
End If

objrs.PageSize = nr_reg_pagina
'seleciona a lista de personalizações
sql = "SELECT "&_
			"  M06_CD_VIEW, M06_CD_MENU, M06_CD_SUBM, M06_CD_USUARIO, M06_NM_VIEW, M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, "&_
			"  M06_IN_EMAIL, M06_IN_PRINT, M06_IN_PADRAO, M06_TP_RELAT, M06_TP_QUEBRA, M06_TP_REF_CLI, M06_CD_EVENTO, M06_NR_DIAS, "&_
			"  M06_TX_ORDEM, M06_IN_DOCTOS, M01_NM_MENU, M02_NM_SUBM, NM_USUARIO, AP_USUARIO, NM_EVENTO "&_
			"FROM M06_VIEW ( NOLOCK ) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = M06_CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU+M02_CD_SUBM = M06_CD_MENU+M06_CD_SUBM) "&_
			"  INNER JOIN TUSUARIO (NOLOCK) ON (CD_USUARIO = M06_CD_USUARIO) "&_
			"  LEFT  JOIN TEVENTO  (NOLOCK) ON (CD_EVENTO = M06_CD_EVENTO) "&_
			"WHERE '"& cd_user &"' IN (M06_CD_USUARIO, '') "&_
			"ORDER BY M06_CD_MENU, M06_CD_SUBM, M06_CD_USUARIO, "& tx_campo &" "& tx_ordem
With objcmd
  .CommandTimeOut = 120
  .CommandText    = sql
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'coloca na pagina
If objrs.PageCount < nr_pagina Then nr_pagina = objrs.PageCount
objrs.AbsolutePage = nr_pagina
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem%>&nr_pagina="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function fnc_AbreEdicao(tx_link, in_acao, cd_view) {
  features = "top=20,left=20,width=750,height=550,scrollbars=no,menubar=no,status=yes";
	window.open(tx_link+'<%= "&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina%>&in_acao='+in_acao+'&cd_view='+cd_view,'EditaView',features);
}

function fnc_BuscaView(targ,selObj,restore) {
	var target = "<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&in_acao=lista&cd_user="%>"+selObj.options[selObj.selectedIndex].value;
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
		<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="75" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr height="20">
					<td colspan="2">Cadastro de Personalizações</td>
				</tr>
				<tr height="35">
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td height="20"><p>
							<%
y = ((nr_pagina - 1) * nr_reg_pagina) + 1
z = nr_reg_pagina * nr_pagina
If z > objrs.RecordCount Then z = objrs.RecordCount
%>
							Exibindo do <%= y%> ao <%= z%> de <%= objrs.RecordCount%> registros.
							<%
'verica se existe mais de uma pagina de dados na tabela
If objrs.PageCount > 1 Then
	'verifica se é para exibir anterior
	If nr_pagina > 1 Then
%>
							<a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina=1"%>" target="_self"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="Primeira Página" width="19" height="16" border="0" align="absmiddle"></a> <a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&(nr_pagina-1)%>" target="_self"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="Página Anterior" width="19" height="16" border="0" align="absmiddle"></a>
							<%
	Else
		Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='Primeira Página' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='Página Anterior' width='19' height='16' align='absmiddle'>")
	End If
%>
							<select name="nr_pagina" class="select" onChange="MM_jumpMenu('self',this,0);">
								<%
	For x = 1 To objrs.PageCount
		If nr_pagina = x Then selected = " selected" Else selected = ""
		Response.Write("<option value='"& x &"'"& selected &">"& x &"</option>")
	Next
			%>
							</select>
							<%
	'verifica se &eacute; para exibir Pr&oacute;xima
	If nr_pagina < objrs.PageCount Then
%>
							<a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&(nr_pagina+1)%>" target="_self"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="Próxima Página" width="19" height="16" border="0" align="absmiddle"></a> <a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&objrs.PageCount%>" target="_self"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="Última Página" width="19" height="16" border="0" align="absmiddle"></a>
							<%
	Else
		Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='Próxima Página' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='Última Página' width='19' height='16' align='absmiddle'>")
	End If
End If
%>
							<a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"personal","personal_edt",1,1)%>','novo','','');"><b>Nova Personalização</b></a></p></td>
					<td align="right"><select name="cd_user" class="select" style="width:200px;" onChange="fnc_BuscaView('self',this,0)">
							<option selected>Buscar por usuário</option>
							<!--#include virtual="/selects/option_usuario.txt"-->
						</select>
					</td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainAdm">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="35" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_CD_VIEW&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_NM_VIEW&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_PADRAO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Padrão</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_AP_USUARIO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Usuário</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_QUEBRA&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Quebra</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_RELAT&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Exibir</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_EMBARQUE&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Embarque</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_REF_CLI&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Referência</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DT_PREV&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Dt. Prev.</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DOCTOS&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Doctos.</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DOWNLOAD&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Excel</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_PRINT&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Print</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_EMAIL&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Email</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_CD_EVENTO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Limitador</td>
						<td width="40" class="admtit" align="center">Exec</td>
					</tr>
					<%
str  = ""
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
	If str <> objrs.Fields.Item("M06_CD_MENU").Value&objrs.Fields.Item("M06_CD_SUBM").Value Then
%>
					<tr>
						<td colspan="15" class="admsub"><%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& objrs.Fields.Item("M01_NM_MENU").Value &")</i>"%></td>
					</tr>
					<%
  End If
  str = objrs.Fields.Item("M06_CD_MENU").Value&objrs.Fields.Item("M06_CD_SUBM").Value
	
	if fnc_TestaVar(objrs.Fields.Item("M06_TP_REF_CLI").Value) then tp_ref_cli = tipo_referencia(CInt(objrs.Fields.Item("M06_TP_REF_CLI").Value)-1) else tp_ref_cli = ""
	if fnc_TestaVar(objrs.Fields.Item("M06_TP_QUEBRA").Value) then tp_quebra = tipo_quebra(objrs.Fields.Item("M06_TP_QUEBRA").Value) else tp_quebra = ""
	if fnc_TestaVar(objrs.Fields.Item("M06_TP_RELAT").Value) then tp_relat = tipo_relatorio(objrs.Fields.Item("M06_TP_RELAT").Value) else tp_relat = ""
	if fnc_TestaVar(objrs.Fields.Item("M06_CD_EVENTO").Value) then cd_evento = objrs.Fields.Item("M06_CD_EVENTO").Value &"("& objrs.Fields.Item("M06_NR_DIAS").Value &" dias)" else cd_evento = ""
%>
					<tr>
						<td align="right" class="admcel"><nobr><%= objrs.Fields.Item("M06_CD_VIEW").Value%>&nbsp;</nobr></td>
						<td class="admcel"><nobr><%= objrs.Fields.Item("M06_NM_VIEW").Value%></nobr></td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_PADRAO"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td class="admcel" title="<%= objrs.Fields.Item("NM_USUARIO").Value%>"><%= objrs.Fields.Item("AP_USUARIO").Value%>&nbsp;</td>
						<td class="admcel"><%= tp_quebra%>&nbsp;</td>
						<td class="admcel"><%= tp_relat%>&nbsp;</td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_EMBARQUE"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td class="admcel"><%= tp_ref_cli%>&nbsp;</td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_DT_PREV"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_DOCTOS"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_DOWNLOAD"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_PRINT"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_EMAIL"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td align="right" class="admcel" title="<%= objrs.Fields.Item("NM_EVENTO").Value%>"><%= cd_evento%>&nbsp;</td>
						<td class="admcom"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="50%"><a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"personal","personal_edt",1,1)%>','editar','<%= objrs.Fields.Item("M06_CD_VIEW").Value%>');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="50%"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_user="&objrs.Fields.Item("M06_CD_VIEW").Value&"&in_acao=excluir"%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
								</tr>
							</table></td>
					</tr>
					<%
  cont = cont + 1
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
					<tr>
						<td width="35" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_CD_VIEW&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_NM_VIEW&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_PADRAO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Padrão</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_AP_USUARIO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Usuário</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_QUEBRA&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Quebra</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_RELAT&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Exibir</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_EMBARQUE&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Embarque</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_TP_REF_CLI&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Referência</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DT_PREV&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Dt. Prev.</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DOCTOS&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Doctos.</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_DOWNLOAD&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Excel</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_PRINT&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Print</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_IN_EMAIL&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Email</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M06_CD_EVENTO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Limitador</td>
						<td width="40" class="admtit" align="center">Exec</td>
					</tr>
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
