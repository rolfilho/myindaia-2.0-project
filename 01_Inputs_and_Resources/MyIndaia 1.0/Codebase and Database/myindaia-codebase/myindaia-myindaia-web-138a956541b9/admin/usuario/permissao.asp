<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Permissões
'
'Autor Alexandre Gonçalves Neto
'Criado: 19/10/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

in_show   = True
cd_tela   = "ADM015"
cd_menu   = Request.QueryString("cd_menu")
cd_subm   = Request.QueryString("cd_subm")
cd_docto  = Request.QueryString("cd_docto")
nm_tela   = fnc_NomeTela(cd_menu, cd_subm, cd_docto, Null)
tx_erro   = Request.QueryString("tx_erro")
tx_campo  = CStr(Request.QueryString("tx_campo"))
tx_ordem  = CStr(Request.QueryString("tx_ordem"))
nr_pagina = CInt(Request.QueryString("nr_pagina"))
tx_link   = "permissao.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto
Session("sql_pagina") = Session("sql_pagina") &"<br>QUERYSTRING: "& Request.QueryString &"<br>"
'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(tx_campo) Then tx_campo = "NM_USUARIO"
If Not fnc_TestaVar(tx_ordem) Then tx_ordem = "ASC"
If nr_pagina = 0 Then nr_pagina = 1
'recupera informação dos registro
cd_user   = Trim(Request.QueryString("cd_user"))
'exclui o registro
If Request.QueryString("in_acao") = "excluir" Then
	If Trim(cd_user) = "" Then
		tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
	Else
		'exclui o registro
		sql = "DELETE FROM M09_ACESSO " &_
					"WHERE M09_CD_USUARIO = '"& cd_user &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
		objcnn.Execute(sql)
		
		If Err.Number = 0 Then
			tx_erro = "CAD(13):\n - Código: " & cd_user &"."
		Else
			tx_erro = "CAD(07):\n -"
		End If
	End If
End If

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

sql = "SELECT DISTINCT M09_CD_USUARIO, NM_USUARIO, ISNULL( QT_NR_MENU, 0 ) AS QT_NR_MENU "&_
	  	"FROM M09_ACESSO ( NOLOCK ), TUSUARIO ( NOLOCK ),  "&_
	  	"    ( "&_
	  	"        SELECT COUNT(M09_CD_USUARIO) AS QT_NR_MENU, M09_CD_USUARIO AS QT_CD_USUARIO "&_
	  	"        FROM M09_ACESSO ( NOLOCK ) "&_
			"        WHERE M09_IN_ACESSO = 1 "&_
	  	"        GROUP BY M09_CD_USUARIO "&_
	  	"    ) AS QTDE_MENU "&_
	  	"WHERE M09_CD_USUARIO  = CD_USUARIO "&_
	  	"  AND M09_CD_USUARIO *= QT_CD_USUARIO "&_
	  	"ORDER BY "& tx_campo &" "& tx_ordem
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
With objcmd
  .CommandTimeOut = 120
  .CommandText    = sql
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'coloca na pagina que for encontrado o registro
If Request.QueryString("in_acao") = "lista" Then
	str = "M09_CD_USUARIO = '"& Request("cd_user") &"'"
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
	var target = "<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem%>&nr_pagina="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function fnc_AbreEdicao(tx_link, in_acao, cd_user) {
  features = "top=20,left=20,width=410,height=610,scrollbars=no,menubar=no,status=yes";
	window.open(tx_link+'<%= "&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina%>&in_acao='+in_acao+'&cd_user='+cd_user,'EditaAcesso',features);
}

function fnc_BuscaUser(targ,selObj,restore) {
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
						<td colspan="2">Cadastro de Permissões</td>
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
								<a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"permissao","permissao_edt",1,1)%>','novo','','');"><b>Novo Usuário</b></a></p></td>
						<td align="right"><select name="cd_user" class="select" style="width:200px;" onChange="fnc_BuscaUser('self',this,0)">
								<option selected>Busca de Usuário...</option>
								<!--#include virtual="/selects/option_usuario.txt"-->
							</select>
						</td>
					</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="35" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M09_CD_USUARIO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=NM_USUARIO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=QT_NR_MENU&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Menus</td>
						<td width="40" class="admtit" align="center">Exec</td>
					</tr>
					<%
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
	If cd_user = objrs.Fields.Item("M09_CD_USUARIO").Value Then selected = " style='font-weight:bold;'" Else selected = ""
%>
					<tr<%= selected%>>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M09_CD_USUARIO").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("NM_USUARIO").Value%></td>
						<td align="right" class="admcel"><%= objrs.Fields.Item("QT_NR_MENU").Value%>&nbsp;</td>
						<td class="admcom"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="50%"><a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"permissao","permissao_edt",1,1)%>','editar','<%= objrs.Fields.Item("M09_CD_USUARIO").Value%>');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="50%"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_user="&objrs.Fields.Item("M09_CD_USUARIO").Value&"&in_acao=excluir"%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
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
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M09_CD_USUARIO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=NM_USUARIO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=QT_NR_MENU&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Menus</td>
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
