<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Personalização
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/02/2007
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim in_padrao   'identificador de visualização padrão(0-não; 1-sim)
Dim in_download 'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_email	  'identificador para disponibilizar o recebimento do relátorio no e-mail(0-não; 1-sim)
Dim in_print	  'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_doctos   'identificador para disponibilizar a visualização de documentos scaneados(0-não; 1-sim)
Dim cd_evento	  'código do evento para alerta/exclusão
Dim nr_dias		  'número de dias para o relatório de exclusão
Dim cd_ordem_1, cd_ordem_2 'nome dos campos de ordenação
Dim tp_ordem_1, tp_ordem_2 'ordenação do campo(0-ascendente; 1-descendente)
Dim in_tipo 'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao 'ação que está ocorrendo na tabela
Dim ex_embarque, ex_dt_prev, ex_download, ex_email, ex_print, ex_doctos
Dim ex_relat, ex_quebra, ex_evento, ex_dias, ex_ordem
Dim nr_max_filtro, nr_max_campo 'qtde máx. de filtros e campos por relatório.

in_show   = False
cd_tela   = "ADM016"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "personal_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem
Session("sql_pagina") = Session("sql_pagina") &"<br>QUERYSTRING: "& Request.QueryString &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>FORM: "& Request.Form &"<br>"
'abre cadastro pra um novo registro
If in_acao = "novo" Then
	cd_user      = ""
	cd_view      = ""
	nm_view      = ""
	in_embarque  = 1
	in_dt_prev   = 0
	in_download  = 0
	in_email     = 0
	in_print     = 0
	in_doctos    = 0
	in_padrao    = 0
	tp_relat     = 2
	tp_quebra    = 2
	tp_ref_cli   = ""
	cd_evento    = ""
	nr_dias      = Null
	cd_ordem_1   = ""
	cd_ordem_2   = ""
	tp_ordem_1   = 0
	tp_ordem_2   = 0 
	in_tipo   = "incluir"
End If
'recebe os valores do formulário, verifica se estão corretos e inclui na tabela
If in_acao = "incluir" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
	nr_dias      = Request.Form("nr_dias")
	cd_ordem_1   = Request.Form("cd_ordem_1")
	cd_ordem_2   = Request.Form("cd_ordem_2")
	tp_ordem_1   = Request.Form("tp_ordem_1")
	tp_ordem_2   = Request.Form("tp_ordem_2")
	in_tipo      = "incluir"
End If
'prepara a personalização para ser alterada
If in_acao = "editar" Then
	cd_view = CStr(Request("cd_view"))
	nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
	in_tipo = "alterar"
	
	'seleciona a personalização
	sql = "SELECT "&_
				"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW  , "&_
				"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT , "&_
				"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
				"  M06_NR_DIAS    , M06_TX_ORDEM  , M06_IN_DOCTOS " &_
				"FROM M06_VIEW ( NOLOCK ) " &_
				"WHERE M06_CD_VIEW = '"& cd_view &"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu     = objrs.Fields.Item("M06_CD_MENU").Value
		cd_subm     = objrs.Fields.Item("M06_CD_SUBM").Value
		cd_user     = objrs.Fields.Item("M06_CD_USUARIO").Value
		cd_view     = objrs.Fields.Item("M06_CD_VIEW").Value
		nm_view     = objrs.Fields.Item("M06_NM_VIEW").Value
		in_embarque = objrs.Fields.Item("M06_IN_EMBARQUE").Value
		in_dt_prev  = objrs.Fields.Item("M06_IN_DT_PREV").Value
		in_download = objrs.Fields.Item("M06_IN_DOWNLOAD").Value
		in_email    = objrs.Fields.Item("M06_IN_EMAIL").Value
		in_print    = objrs.Fields.Item("M06_IN_PRINT").Value
		in_doctos   = objrs.Fields.Item("M06_IN_DOCTOS").Value
		in_padrao   = objrs.Fields.Item("M06_IN_PADRAO").Value
		tp_relat    = objrs.Fields.Item("M06_TP_RELAT").Value
		tp_quebra   = objrs.Fields.Item("M06_TP_QUEBRA").Value
		tp_ref_cli  = objrs.Fields.Item("M06_TP_REF_CLI").Value
		cd_evento   = objrs.Fields.Item("M06_CD_EVENTO").Value
		nr_dias     = objrs.Fields.Item("M06_NR_DIAS").Value
		tx_ordem    = objrs.Fields.Item("M06_TX_ORDEM").Value
	Else
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n - "& tx_lang_004016(cd_lang) &"."
		Response.Redirect("?in_acao=novo&tx_erro="& Server.URLEncode(tx_erro))
		Response.End()
	End If
	objrs.Close
End If
'alterar dados da personalização
If in_acao = "alterar" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
	nr_dias      = Request.Form("nr_dias")
	cd_ordem_1   = Request.Form("cd_ordem_1")
	cd_ordem_2   = Request.Form("cd_ordem_2")
	tp_ordem_1   = Request.Form("tp_ordem_1")
	tp_ordem_2   = Request.Form("tp_ordem_2")
	in_tipo = "alterar"
End If
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
			'exibe a mensagem de sucesso e redireciona a página
			tx_erro = tx_lang_004020(cd_lang) &"."
			Response.Redirect(tx_link &"&in_acao=novo&cd_view=&tx_erro="& Server.URLEncode(tx_erro))
		Else
			'informa o erro e posiciona em edição
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004021(cd_lang)
			Response.Redirect(tx_link &"&in_acao=editar&cd_view="&cd_view&"&tx_erro="& Server.URLEncode(tx_erro))
		End If
		objrs.Close
	End If
End If
'recupera o nome do menu e sub-menu
cd_menu_cad = CStr(Request("cd_menu_cad"))
cd_subm_cad = CStr(Request("cd_subm_cad"))
if not fnc_TestaVar(cd_menu_cad) then cd_menu_cad = Mid(cd_view, 6, 2)
if not fnc_TestaVar(cd_subm_cad) then cd_subm_cad = Mid(cd_view, 8, 2)

if fnc_TestaVar(cd_menu_cad) and fnc_TestaVar(cd_subm_cad) then
	sql = "SELECT RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, "&_
				"  M02_EX_EMBARQUE, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, "&_
				"  M02_EX_EVENTO, M02_EX_DIAS, M02_EX_ORDEM, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO "&_
				"FROM M02_SUBM ( NOLOCK ) " &_
				" INNER JOIN M01_MENU ( NOLOCK ) ON M01_CD_MENU = M02_CD_MENU " &_
				"WHERE M02_CD_MENU = '"& cd_menu_cad &"' "&_
				"  AND M02_CD_SUBM = '"& cd_subm_cad &"' "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'verifica quais opções serão exibidas no cadastro
	ex_embarque = objrs.Fields.Item("M02_EX_EMBARQUE").Value
	ex_dt_prev  = objrs.Fields.Item("M02_EX_DT_PREV").Value
	ex_download = objrs.Fields.Item("M02_EX_DOWNLOAD").Value
	ex_email    = objrs.Fields.Item("M02_EX_EMAIL").Value
	ex_print    = objrs.Fields.Item("M02_EX_PRINT").Value
	ex_doctos   = objrs.Fields.Item("M02_EX_DOCTOS").Value
	ex_relat    = objrs.Fields.Item("M02_EX_RELAT").Value
	ex_quebra   = objrs.Fields.Item("M02_EX_QUEBRA").Value
	ex_evento   = objrs.Fields.Item("M02_EX_EVENTO").Value
	ex_dias     = objrs.Fields.Item("M02_EX_DIAS").Value
	ex_ordem    = objrs.Fields.Item("M02_EX_ORDEM").Value
	nr_max_filtro = objrs.Fields.Item("M02_NR_MAX_FILTRO").Value
	nr_max_campo  = objrs.Fields.Item("M02_NR_MAX_CAMPO").Value
	objrs.Close
else
	'erro, não achou os menus da view
	tx_erro = "ERRO:\n\nPara criar e/ou editar uma personalização é necessário definir o menu e sub-menu em que será cadastrada.\n"&_
						"Caso esteja vendo esse erro pela segunda vez, entre em contato com os desenvolvedores."
	Response.Write("<script>alert('"&tx_erro&"');window.close;</script>>")
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divEdicao {
	position: absolute;
	top: 30px;
	left: 0px;
	width: 100%;
	height: 100%;
	z-index: 1;
	overflow: auto;
}
</style>
<script language="javascript">
<!--
function fnc_ConsultaCodigo(campo) {
	with (document.frmCadastroView) {
		if (campo == 'user') {
			if (cd_user.value.length < 4) {
				codigo = cd_user.value;
				for (i = cd_user.value.length; i < 4; i++)
					codigo = '0'+ String(codigo);
			}
			else var codigo = cd_user.value;
			nm_user.value = codigo;
			cd_user.value = codigo;
		}
		if (campo == 'menu') {
			var codigo = cd_menu_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_menu_cad.value = codigo;
				nm_menu_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_view=<%= cd_view%>&cd_menu_cad="+codigo+"'");
			} else {
				cd_menu_cad.value = '';
				nm_menu_cad.value = '';
			}
		}
		if (campo == 'subm') {
			var codigo = cd_subm_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_subm_cad.value = codigo;
				nm_subm_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_view=<%= cd_view%>&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+codigo+"'");
			} else {
				cd_subm_cad.value = '';
				nm_subm_cad.value = '';
			}
		}
	}  //encerra o with
}  //encerra a function

function fnc_InsereCodigo(campo) {
	with (document.frmCadastroView) {
		if (campo == 'user') {
			cd_user.value = nm_user.options[nm_user.selectedIndex].value;
		}
		if (campo == 'menu') {
			cd_menu_cad.value = nm_menu_cad.options[nm_menu_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_view=&cd_menu_cad="+cd_menu_cad.value+"'");
		}
		if (campo == 'subm') {
			cd_subm_cad.value = nm_subm_cad.options[nm_subm_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_view=&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+cd_subm_cad.value+"'");
		}
	}
}
-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroView" onSubmit="return fnc_ValidaForm(this);">
		<tr height="30">
			<td class="admtitulo" colspan="2">&nbsp;Edição de Personalização</td>
		</tr>
		<tr>
			<td valign="top" width="50%"><div id="Edicao" class="divEdicao">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr height="30">
							<td class="admlabel"><label for="user">Usuário:</label></td>
							<td class="admdados"><%
'seleciona todos os usuários do sistema
sql = "SELECT CD_USUARIO, NM_USUARIO, CD_CARGO FROM TUSUARIO ( NOLOCK ) ORDER BY CD_CARGO"
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If in_acao = "novo" or in_acao = "incluir" Then
%>
								<input name="cd_user" id="user" type="text" class="editbox" style="width:30px;" maxlength="4" onBlur="fnc_ConsultaCodigo('user');">
								<select name="nm_user" class="select" style="width:250px;" onChange="fnc_InsereCodigo('user');">
									<option selected>Selecione um Usuário...</option>
									<%
	Do While Not objrs.Eof
		select case objrs.Fields.Item("CD_CARGO").Value
			case "040" str = "(cliente)"
			case "055" str = "(transportadora)"
			case "060" str = "(seguradora)"
			case else str = "(interno)"
		end select
%>
									<option value="<%= objrs.Fields.Item("CD_USUARIO").Value%>"><%= objrs.Fields.Item("NM_USUARIO").Value & str%></option>
									<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
								</select>
								<%
Else
	'busca o registro
	str = "CD_USUARIO = '"& cd_user &"'"
	objrs.Find str, 0, adSearchForward
%>
								<input name="cd_user" id="user" type="text" readonly class="editbox" style="width:30px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("CD_USUARIO").Value)%>">
								<input name="nm_user" id="user" type="text" readonly class="editbox" style="width:200px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("NM_USUARIO").Value)%>">
								<%
End If
objrs.Close
%>
							</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="menu">Menu:</label></td>
							<td class="admdados"><%
'seleciona todos os menus ativos
sql = "SELECT M01_CD_MENU, M01_NM_MENU FROM M01_MENU (NOLOCK) WHERE M01_IN_ATIVO = 1 ORDER BY M01_CD_MENU"
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If in_acao = "novo" or in_acao = "incluir" Then
%>
								<input name="cd_menu_cad" id="menu" type="text" class="editbox" style="width:50px;" maxlength="2" tabindex="0" value="<%= cd_menu_cad%>" onBlur="fnc_ConsultaCodigo('menu');">
								<select name="nm_menu_cad" class="select" style="width: 225px;" onChange="fnc_InsereCodigo('menu');">
									<option selected value="">Selecione um Menu...</option>
									<%
  'preenche os valores do select
  Do While Not objrs.Eof
  	selected = ""
  	If cd_menu_cad = objrs.Fields.Item("M01_CD_MENU").Value Then selected = " selected"
%>
									<option value="<%= objrs.Fields.Item("M01_CD_MENU").Value%>"<%= selected%>><%= objrs.Fields.Item("M01_NM_MENU").Value%></option>
									<%
  	objrs.MoveNext
  Loop
%>
								</select>
								<%
Else
  'busca o registro
	str = "M01_CD_MENU = '"& cd_menu_cad &"'"
	objrs.Find str, 0, adSearchForward
%>
								<input name="cd_menu_cad" id="user" type="text" readonly class="editbox" style="width:30px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("M01_CD_MENU").Value)%>">
								<input name="nm_menu_cad" id="user" type="text" readonly class="editbox" style="width:200px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("M01_NM_MENU").Value)%>">
								<%
End If
objrs.Close
%>
							</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="subm">Sub-Menu:</label></td>
							<td class="admdados"><%
'seleciona os sub menus
sql = "SELECT M02_CD_MENU, M02_CD_SUBM, M02_NM_SUBM FROM M02_SUBM ( NOLOCK ) WHERE M02_CD_MENU = '"& cd_menu_cad &"' ORDER BY M02_CD_SUBM"
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If in_acao = "novo" or in_acao = "incluir" Then
%>
								<input name="cd_subm_cad" id="subm" type="text" class="editbox" style="width:50px;" maxlength="2" tabindex="1" value="<%= cd_subm_cad%>" onBlur="fnc_ConsultaCodigo('subm');"<% If Not fnc_TestaVar(cd_menu_cad) Then Response.Write(" disabled")%>>
								<select name="nm_subm_cad" class="select" style="width: 225px;" onChange="fnc_InsereCodigo('subm');"<% If Not fnc_TestaVar(cd_menu_cad) Then Response.Write(" disabled")%>>
									<option selected value="">Selecione um Sub-Menu...</option>
									<%
  
  'preenche os valores do select
  Do While Not objrs.Eof
  	selected = ""
  	If cd_menu_cad = objrs.Fields.Item("M02_CD_MENU").Value and cd_subm_cad = objrs.Fields.Item("M02_CD_SUBM").Value Then selected = " selected"
%>
									<option value="<%= objrs.Fields.Item("M02_CD_SUBM").Value%>"<%= selected%>><%= objrs.Fields.Item("M02_NM_SUBM").Value%></option>
									<%
  	objrs.MoveNext
  Loop
%>
								</select>
								<%
Else
	'busca o registro
	str = "M02_CD_SUBM = '"& cd_subm_cad &"'"
	objrs.Find str, 0, adSearchForward
%>
								<input name="cd_subm_cad" id="user" type="text" readonly class="editbox" style="width:30px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("M02_CD_SUBM").Value)%>">
								<input name="nm_subm_cad" id="user" type="text" readonly class="editbox" style="width:200px;background:#CCCCCC;" value="<%= Trim(objrs.Fields.Item("M02_NM_SUBM").Value)%>">
								<%
End If
objrs.Close
%>
							</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><input name="cd_view" type="text" readonly class="editbox" id="codigo" style="width: 100px; background-color:#CCCCCC;" tabindex="0" value="<%= cd_view%>" maxlength="3">
								<input name="cd_view" type="hidden" value="<%= cd_view%>">
							</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="nome">Nome:</label></td>
							<td class="admdados"><input name="nm_view" type="text" class="editbox" id="nome" style="width: 250px;" tabindex="1" value="<%= nm_view%>" maxlength="50"></td>
						</tr>
						<%
If ex_evento Then
	'seleciona todos os eventos referentes a sub-&aacute;rea
	sql = "SELECT RTRIM(M10_CD_BROKER) AS CD_EVENTO, RTRIM("& tx_lang_dado &") AS NM_EVENTO, M03_NR_ORDEM "&_
				"FROM M03_LIMITADOR ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M03_CD_MENU    = '"& cd_menu &"' "&_
				"  AND M03_CD_SUBM    = '"& cd_subm &"' "&_
				"  AND M03_IN_ATIVO   = 1 "&_
				"  AND M03_TP_EXIBIR >= '"& Session("tp_exibir") &"' "&_
				"  AND M03_CD_DADO    = M10_CD_DADO "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY M03_NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
	'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
	If Not objrs.Eof then
%>
						<tr height="30">
							<td class="admlabel"><label for="evento"><%= tx_lang_004028(cd_lang)%></label></td>
							<td class="admdados"><select name="cd_evento" class="select" style="width:250px;" onChange="fnc_EventoLimitadorChange(this);">
									<option value="" selected><%= tx_lang_004029(cd_lang)%></option>
									<%
		Do While Not objrs.Eof
			selected = ""
			If cd_evento = Trim(objrs.Fields.Item("CD_EVENTO").Value) Then selected = " selected"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = Trim(objrs.Fields.Item("NM_EVENTO").Value)
			Else
				nm_campo_rel = Trim(objrs.Fields.Item("CD_EVENTO").Value) &" - "& Trim(objrs.Fields.Item("NM_EVENTO").Value)
			End If
%>
									<option value="<%= objrs.Fields.Item("CD_EVENTO").Value%>"<%= selected%>><%= nm_campo_rel%></option>
									<%
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
%>
								</select>
								<%
		If ex_dias Then
%>
								<b><%= tx_lang_004030(cd_lang)%>:</b>
								<input class="editbox" type="text" name="nr_dias" size="2" maxlength="3" value="<%= nr_dias%>">
								<%
		End If
%>
							</td>
						</tr>
						<%
	End If
	objrs.Close
End If

If ex_relat Then
%>
						<tr height="30">
							<td class="admlabel"><%= tx_lang_004031(cd_lang)%></td>
							<td class="admdados"><input name="tp_relat" type="radio" value="2" id="ambos"<%If tp_relat = "2" Then Response.Write(" checked")%>>
								<label for="ambos"><%= tx_lang_004032(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="adm"<%If tp_relat = "1" Then Response.Write(" checked")%>>
								<label for="adm"><%= tx_lang_004033(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="0" id="des"<%If tp_relat = "0" Then Response.Write(" checked")%>>
								<label for="des"><%= tx_lang_004034(cd_lang)%></label></td>
						</tr>
						<%
End If

If ex_ordem Then 'Desativado
%>
						<tr height="30">
							<td class="admlabel"><label for="odernar"><%= tx_lang_004035(cd_lang)%></label></td>
							<td class="admdados"><select name="cd_ordem_1" class="select" id="ordernar">
									<option value="" selected><%= tx_lang_004036(cd_lang)%></option>
								</select>
								<select name="tp_ordem_1" class="select">
									<option value="0">A -> Z</option>
									<option value="1">Z -> A</option>
								</select>
								<select name="cd_ordem_2" class="select">
									<option value="" selected><%= tx_lang_004037(cd_lang)%></option>
								</select>
								<select name="tp_ordem_2" class="select">
									<option value="0">A -> Z</option>
									<option value="1">Z -> A</option>
								</select></td>
						</tr>
						<%
End If

If ex_quebra Then
%>
						<tr height="30">
							<td class="admlabel"><label for="quebra"><%= tx_lang_004038(cd_lang)%></label></td>
							<td class="admdados"><select name="tp_quebra" class="select" id="quebra" style="width:250px;">
									<option value="" selected><%= tx_lang_004039(cd_lang)%></option>
									<%
	For cont = 0 to UBound(tipo_quebra)
		selected = ""
		If cont = 0 and InStr("040;055;060", Session("cd_cargo")) > 0 Then cont = 1
		If tp_quebra = CStr(cont) Then selected = " selected"
%>
									<option value="<%= cont%>"<%= selected%>><%= nm_tp_quebra(cont)%></option>
									<%
	Next
%>
								</select></td>
						</tr>
						<%
End If

If ex_embarque Then
	str = ""
	If in_embarque Then str = " background: #CCCCCC;"
%>
						<tr height="30">
							<td class="admlabel"><label for="embarque"><%= tx_lang_004040(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_embarque" id="embarque" value="1"<%If in_embarque Then Response.Write(" checked")%> onClick="fnc_Processo(this);">
								<%= tx_lang_004041(cd_lang)%>.</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="tp_ref"><%= tx_lang_004042(cd_lang)%></label></td>
							<td class="admdados"><select name="tp_ref_cli" class="select" id="tp_ref" style="width:250px; <%= str%>"<%If in_embarque Then Response.Write(" disabled")%> onChange="fnc_Referencia(this);">
									<option value="" selected><%= tx_lang_004043(cd_lang)%></option>
									<%
	For cont = 0 to UBound(tipo_referencia)
		selected = ""
		str = "0"& CStr(cont+1)
		If tp_ref_cli = str Then selected = " selected"
%>
									<option value="<%= str%>"<%= selected%>><%= tipo_referencia(cont)%></option>
									<%
	Next
%>
								</select></td>
						</tr>
						<%
End If
%>
						<tr height="30">
							<td class="admlabel"><label for="padrao"><%= tx_lang_004046(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_padrao" id="padrao" value="1"<%If in_padrao Then Response.Write(" checked")%>>
								<%= tx_lang_004047(cd_lang)%>.</td>
						</tr>
						<%
If ex_dt_prev Then
%>
						<tr height="30">
							<td class="admlabel"><label for="prev"><%= tx_lang_004044(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_dt_prev" id="prev" value="1"<%If in_dt_prev Then Response.Write(" checked")%>>
								<%= tx_lang_004045(cd_lang)%>.</td>
						</tr>
						<%
End If

If ex_download Then
%>
						<tr height="30">
							<td class="admlabel"><label for="download"><%= tx_lang_004048(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_download" id="download" value="1"<%If in_download Then Response.Write(" checked")%>>
								<%= tx_lang_004049(cd_lang)%>.</td>
						</tr>
						<%
End If

If ex_email Then
%>
						<tr height="30">
							<td class="admlabel"><label for="email"><%= tx_lang_004050(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_email" id="email" value="1"<%If in_email Then Response.Write(" checked")%>>
								<%= tx_lang_004051(cd_lang)%>.</td>
						</tr>
						<%
End If

If ex_print Then
%>
						<tr>
							<td class="admlabel"><label for="print"><%= tx_lang_004052(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_print" id="print" value="1"<%If in_print Then Response.Write(" checked")%>>
								<%= tx_lang_004053(cd_lang)%>.</td>
						</tr>
						<%
End If

If ex_doctos Then
%>
						<tr height="30">
							<td class="admlabel"><label for="doctos"><%= tx_lang_004062(cd_lang)%></label></td>
							<td class="admdados"><input type="checkbox" name="in_doctos" id="doctos" value="1"<%If in_doctos Then Response.Write(" checked")%>>
								<%= tx_lang_004063(cd_lang)%>.</td>
						</tr>
						<%
End If
%>
					</table>
				</div></td>
			<td width="50%" valign="top"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="50%">
						<td><iframe src="/admin/usuario/personal_filtro.asp?in_acao=<%= in_tipo%>&cd_view=<%= cd_view%>" frameborder="0" width="100%" height="100%"></iframe></td>
					</tr>
					<tr height="50%">
						<td><iframe frameborder="0" width="220" height="150"></iframe></td>
					</tr>
				</table></td>
		</tr>
		<tr bgcolor="#DDDDDD" height="30">
			<td align="center" colspan="2"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
				<input name="enviar" type="submit" class="admbutton" value="Salvar">
				<input name="limpar" type="reset" class="admbutton" value="Cancelar">
				<input name="cancel" type="button" class="admbutton" value="Fechar" onClick="javascript:window.close();"></td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript">
<!--
<%if in_acao = "lista" then%>
window.opener.location.href='<%= Replace(tx_link,"_edt","",1,1)%>&in_acao=lista&cd_view=<%= cd_view%>';
<%end if%>
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
