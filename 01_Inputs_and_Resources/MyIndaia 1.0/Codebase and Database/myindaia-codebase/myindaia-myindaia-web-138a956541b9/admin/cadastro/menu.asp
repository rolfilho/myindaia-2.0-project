<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Menu
'
'Autor Alexandre Gonçalves Neto
'Criado: 06/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim nr_ordem
Dim in_ativo

in_show   = True
cd_tela   = "ADM001"
cd_menu   = Request.QueryString("cd_menu")
cd_subm   = Request.QueryString("cd_subm")
cd_docto  = Request.QueryString("cd_docto")
nm_tela   = fnc_NomeTela(cd_menu, cd_subm, cd_docto, Null)
tx_erro   = Request.QueryString("tx_erro")
tx_campo  = CStr(Request.QueryString("tx_campo"))
tx_ordem  = CStr(Request.QueryString("tx_ordem"))
nr_pagina = CInt(Request.QueryString("nr_pagina"))
tx_link   = "menu.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto
'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(tx_campo) Then tx_campo = "M01_NR_ORDEM"
If Not fnc_TestaVar(tx_ordem) Then tx_ordem = "ASC"
If nr_pagina = 0 Then nr_pagina = 1

cd_menu_cad = CStr(Request.QueryString("cd_menu_cad"))
in_ativo    = Request.QueryString("in_ativo")
'verifica se foi solicitado que o menu seja habilitado/desabilitado
If fnc_TestaVar(in_ativo) Then
	Call sub_AtivaRegistro(cd_menu_cad, "M01_MENU", in_ativo)
End If
'exclui o resgistro da base de dados
If Request.QueryString("in_acao") = "excluir" Then
	If Trim(cd_menu_cad) = "" Then
		tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
	Else
		'verifica se não existem sub-menus utilizando o registro
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_
					"FROM M02_SUBM (NOLOCK) "&_
					"WHERE M02_CD_MENU = '"& cd_menu_cad &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly', adCmdTable
		
		If objrs.Fields.Item("VL_TOTAL").Value > 0 Then
			tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("VL_TOTAL").Value &" Sub-Menus utilizando o Menu "& cd_menu_cad &".\n Você pode desativar este menu, caso não queira que ele apareça no site."
		Else
			objrs.Close
			'seleciona o numero de ordem antes da exclusão
			sql = "SELECT M01_NR_ORDEM FROM M01_MENU (NOLOCK) WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly', adCmdTable
			nr_ordem = objrs.Fields.Item("M01_NR_ORDEM").Value-1
			'exclui o registro
			sql = "DELETE FROM M01_MENU WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
			objcnn.Execute(sql)
			
			If Err.Number = 0 Then
				sql = "UPDATE M01_MENU SET M01_NR_ORDEM = M01_NR_ORDEM-1 WHERE M01_NR_ORDEM > "& nr_ordem
				objcnn.Execute(sql)
				tx_erro = "CAD(13):\n - Código: " & cd_menu_cad &"."
				Response.Redirect(tx_link&"&tx_campo="& tx_campo &"&tx_ordem="& tx_ordem &"&nr_pagina="& nr_pagina &"&tx_erro="& Server.URLEncode(tx_erro))
			Else
				tx_erro = "CAD(07):\n - Não foi possível excluir o MENU "& cd_menu_cad
			End If
		End If
		objrs.Close
	End If
End If

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

sql = "SELECT M01_CD_MENU, M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, M01_IN_ATIVO " &_
			"FROM M01_MENU (NOLOCK) " &_
			"ORDER BY "& tx_campo &" "& tx_ordem
'abre a tabela
With objcmd
  .CommandTimeOut = 120
  .CommandText    = sql
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'coloca na pagina que for encontrado o registro
If Request.QueryString("in_acao") = "lista" Then
	str = "M01_CD_MENU = '"& cd_menu_cad &"'"
	'busca o registro
	objrs.Find str, 0, adSearchForward
	'verifica se foi encontrado
	If Not objrs.Eof Then nr_pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
	objrs.MoveFirst
	objrs.AbsolutePage = nr_pagina
Else
	If objrs.PageCount < nr_pagina Then nr_pagina = objrs.PageCount
	objrs.AbsolutePage = nr_pagina
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "<%= tx_link&"tx_campo="&tx_campo&"&tx_ordem="&tx_ordem%>&nr_pagina="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function fnc_AbreEdicao(tx_link, in_acao, cd_menu_cad) {
  features = "top=20,left=20,width=400,height=310,scrollbars=no,menubar=no";
	window.open(tx_link+'<%= "&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina%>&in_acao='+in_acao+'&cd_menu_cad='+cd_menu_cad,'EditaMenu',features);
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
					<td>Cadastro de Menus</td>
				</tr>
				<tr height="35">
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td height="25"><p>
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
							<a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"menu","menu_edt",1,1)%>','novo','');"><b>Clique para criar um Menu</b></a></p></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td width="25" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_CD_MENU&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_NM_MENU&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td width="90" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_AP_MENU&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td width="35" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_NR_ORDEM&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Ordem</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_IN_ATIVO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
						<td width="40" align="center" class="admtit">Exec</td>
					</tr>
					<%
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
%>
					<tr>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M01_CD_MENU").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M01_NM_MENU").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M01_AP_MENU").Value%>&nbsp;</td>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M01_NR_ORDEM").Value%>&ordm;&nbsp;</td>
						<td align="center" class="admcel"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_menu_cad="&objrs.Fields.Item("M01_CD_MENU")&"&in_ativo="&objrs.Fields.Item("M01_IN_ATIVO").Value%>"><img src="/imagens/icones/<%= fnc_CheckImg(objrs.Fields.Item("M01_IN_ATIVO").Value)%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></a></td>
						<td class="admcom"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="50%"><a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"menu","menu_edt",1,1)%>','editar','<%= objrs.Fields.Item("M01_CD_MENU").Value%>');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="50%"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_menu_cad="&objrs.Fields.Item("M01_CD_MENU")&"&in_acao=excluir"%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
								</tr>
							</table></td>
					</tr>
					<%
  cont = cont + 1
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
					<tr height="25">
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_CD_MENU&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_NM_MENU&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_AP_MENU&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_NR_ORDEM&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Ordem</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M01_IN_ATIVO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
						<td class="admtit" align="center">Exec</td>
					</tr>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
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
