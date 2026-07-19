<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Dados da Personalização
'
'Autor Alexandre Gonçalves Neto
'Criado: 16/10/2006
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
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim cd_dado
Dim nr_ordem
Dim in_ativo

in_show   = False
cd_tela   = "ADM013"
cd_menu   = Request.QueryString("cd_menu")
cd_subm   = Request.QueryString("cd_subm")
cd_docto  = Request.QueryString("cd_docto")
nm_tela   = fnc_NomeTela(cd_menu, cd_subm, cd_docto, Null)
tx_erro   = Request.QueryString("tx_erro")
tx_campo  = CStr(Request.QueryString("tx_campo"))
tx_ordem  = CStr(Request.QueryString("tx_ordem"))
nr_pagina = CInt(Request.QueryString("nr_pagina"))
tx_link   = "dados.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto

'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(tx_campo) Then tx_campo = "M10_CD_DADO"
If Not fnc_TestaVar(tx_ordem) Then tx_ordem = "ASC"
If nr_pagina = 0 Then nr_pagina = 1

cd_menu_cad = CStr(Request.QueryString("cd_menu_cad"))
cd_subm_cad = CStr(Request.QueryString("cd_subm_cad"))
cd_dado     = CStr(Request.QueryString("cd_dado"))
in_ativo    = Request.QueryString("in_ativo")
'verifica se foi solicitado que o menu seja habilitado/desabilitado
If fnc_TestaVar(in_ativo) Then
	Call sub_AtivaRegistro(cd_dado, "M10_DADOS", in_ativo)
End If
'exclui o resgistro da base de dados
If Request.QueryString("in_acao") = "excluir" Then
	If Trim(cd_dado) = "" Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		sql = "SELECT COUNT(*) AS TOTAL "&_
					"FROM M10_DADOS (NOLOCK) "&_
					"  INNER JOIN M11_FILTRO (NOLOCK) ON M11_CD_DADO = M10_CD_DADO "&_
					"  INNER JOIN M12_CAMPO  (NOLOCK) ON M12_CD_DADO = M10_CD_DADO "&_
					"WHERE M10_CD_DADO = '"&cd_dado&"'"
		objrs.Open sql, objcnn, 3, 1
		
		If objrs("TOTAL") > 1 Then
	  	tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("TOTAL").Value &" Campos/Filtros utilizando o Dados da pesonalização "& cd_dado &".\n Você pode desativar este sub-menu, caso não queira que ele apareça no site."
    Else
			'exclui o registro selecionado
			sql = "DELETE FROM M10_DADOS " &_
						"WHERE M10_CD_DADO = '"& cd_dado &"'"
			objcnn.Execute(sql)
			'atualiza a ordem dos sub-menus
			If Err.Number = 0 Then
				tx_erro = "CAD(13):\n - Código: " & cd_dado &"."
			Else
				tx_erro = "CAD(07):\n -"
			End If
		End If
		objrs.Close
  End If
End If

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

sql = "SELECT M10_CD_DADO, M10_NM_DADO, M10_AP_FILTRO, M10_AP_CAMPO, M10_TP_DADO, "&_
			"  M10_TP_CONSULTA, M10_CD_BROKER, M10_IN_FILTRO, M10_IN_CAMPO, M10_IN_ATIVO "&_
			"FROM M10_DADOS (NOLOCK) "&_
			"ORDER BY "& tx_campo &" "& tx_ordem
'Response.Write(sql)
With objcmd
  .CommandTimeOut = 120
  .CommandText    = sql
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'coloca na pagina que for encontrado o registro
If Request.QueryString("in_acao") = "lista" Then
	str = "M10_CD_DADO = '"& Request("cd_dado") &"'"
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

function fnc_AbreEdicao(tx_link, in_acao, cd_dado) {
  features = "top=20,left=20,width=400,height=310,scrollbars=no,menubar=no,status=no";
	window.open(tx_link+'<%= "&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina%>&in_acao='+in_acao+'&cd_dado='+cd_dado,'EditaFiltro',features);
}

function fnc_BuscaDados(targ,selObj,restore) {
	var target = "<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&in_acao=lista&cd_dado="%>"+selObj.options[selObj.selectedIndex].value;
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
					<td>Cadastro de Dados da Personalização</td>
				</tr>
				<tr height="35">
					<td>&nbsp;</td>
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
							<a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"dados","dados_edt",1,1)%>','novo','','');"><b>Clique para criar um Dado da Personalização</b></a></p></td>
						<td align="right"><select name="cd_dado" class="select" style="width:200px;" onChange="fnc_BuscaDados('self',this,0)">
								<option selected>Busca de Dados da Personalização...</option>
								<!--#include virtual="/selects/option_adm_dados.txt"-->
							</select>
						</td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainAdm"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td width="25" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_CD_DADO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_NM_DADO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td width="30" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_FILTRO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Filtro</td>
						<td width="40" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_AP_FILTRO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td width="30" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_CAMPO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Campo</td>
						<td width="40" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_AP_CAMPO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td width="40" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_CD_BROKER&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Broker</td>
						<td width="40" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_TP_DADO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Tipo</td>
						<td width="40" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_TP_CONSULTA&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Consulta</td>
						<td width="30" class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_ATIVO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
						<td width="40" class="admtit" align="center">Exec</td>
					</tr>
					<%
str  = ""
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
	If cd_dado = objrs.Fields.Item("M10_CD_DADO").Value Then selected = " style='font-weight:bold;'" Else selected = ""
%>
					<tr<%= selected%>>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M10_CD_DADO").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M10_NM_DADO").Value%>&nbsp;</td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M10_IN_FILTRO"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td class="admcel"><%= objrs.Fields.Item("M10_AP_FILTRO").Value%>&nbsp;</td>
						<td align="center" class="admcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M10_IN_CAMPO"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></td>
						<td class="admcel"><%= objrs.Fields.Item("M10_AP_CAMPO").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M10_CD_BROKER").Value%>&nbsp;</td>
						<td class="admcel"><%= tipo_dado(objrs.Fields.Item("M10_TP_DADO").Value)%>&nbsp;</td>
						<td class="admcel"><%= tipo_consulta(objrs.Fields.Item("M10_TP_CONSULTA").Value)%>&nbsp;</td>
						<td align="center" class="admcel"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_dado="&objrs.Fields.Item("M10_CD_DADO").Value&"&in_ativo="&objrs.Fields.Item("M10_IN_ATIVO").Value%>"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M10_IN_ATIVO"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></a></td>
						<td class="admcom"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="50%"><a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"dados","dados_edt",1,1)%>','editar','<%= objrs.Fields.Item("M10_CD_DADO").Value%>');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="50%"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_dado="&objrs.Fields.Item("M10_CD_DADO").Value&"&in_acao=excluir"%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
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
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_CD_DADO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">C&oacute;d.</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_NM_DADO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_FILTRO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Filtro</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_AP_FILTRO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_CAMPO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Campo</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_AP_CAMPO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_CD_BROKER&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Broker</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_TP_DADO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Tipo</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_TP_CONSULTA&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Consulta</td>
						<td class="admtit" onClick="document.location = '<%= tx_link%>&tx_campo=M10_IN_ATIVO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
						<td class="admtit" align="center">Exec</td>
					</tr>
				</table></div>
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