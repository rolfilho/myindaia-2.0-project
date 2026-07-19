<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Documentos
'
'Autor Alexandre Gonçalves Neto
'Criado: 11/10/2006
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
Dim cd_docto_cad
Dim nm_docto_cad
Dim ap_docto
Dim nr_ordem
Dim in_ativo

in_show   = True
cd_tela   = "ADM007"
cd_menu   = Request.QueryString("cd_menu")
cd_subm   = Request.QueryString("cd_subm")
cd_docto  = Request.QueryString("cd_docto")
nm_tela   = fnc_NomeTela(cd_menu, cd_subm, cd_docto, Null)
tx_erro   = Request.QueryString("tx_erro")
tx_campo  = CStr(Request.QueryString("tx_campo"))
tx_ordem  = CStr(Request.QueryString("tx_ordem"))
nr_pagina = CInt(Request.QueryString("nr_pagina"))
tx_link   = "doctos.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto
'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(tx_campo) Then tx_campo = "M08_NR_ORDEM"
If Not fnc_TestaVar(tx_ordem) Then tx_ordem = "ASC"
If nr_pagina = 0 Then nr_pagina = 1

cd_menu_cad  = CStr(Request.QueryString("cd_menu_cad"))
cd_subm_cad  = CStr(Request.QueryString("cd_subm_cad"))
cd_docto_cad = CStr(Request.QueryString("cd_docto_cad"))
in_ativo     = Request.QueryString("in_ativo")
'verifica se foi solicitado que o menu seja habilitado/desabilitado
If fnc_TestaVar(in_ativo) Then
	Call sub_AtivaRegistro(cd_docto_cad, "M08_CD_DOCTOS", in_ativo)
End If
'exclui o resgistro da base de dados
If Request.QueryString("in_acao") = "excluir" Then
	If Trim(cd_docto_cad) = "" Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		'seleciona o numero de ordem antes da exclusão
		sql = "SELECT M08_NR_ORDEM " &_
					"FROM M08_DOCTOS ( NOLOCK ) " &_
					"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
		objrs.Open sql, objcnn, 3, 1
		nr_ordem = objrs.Fields.Item("M08_NR_ORDEM").Value - 1
		'exclui o registro selecionado
		sql = "DELETE FROM M08_DOCTOS " &_
					"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
		objcnn.Execute(sql)
		'atualiza a ordem dos sub-menus
		If Err.Number = 0 Then
			sql = "UPDATE M08_DOCTOS " &_
						"   SET M08_NR_ORDEM = M08_NR_ORDEM - 1 " &_
						" WHERE M08_CD_MENU  = '"& cd_menu_cad &"' " &_
						"   AND M08_CD_SUBM  = '"& cd_subm_cad &"' " &_
						"   AND M08_NR_ORDEM >  "& nr_ordem
			'Response.Write(sql &"<br>")
			objcnn.Execute(sql)
			
			tx_erro = "CAD(13):Registro apagdo com sucesso!\n - Código: " & cd_docto_cad &"."
		Else
			tx_erro = "CAD(07):\n -"
		End If
		objrs.Close
  End If
End If

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

sql = "SELECT M08_CD_DOCTO, M08_CD_MENU, M08_CD_SUBM, M08_NM_DOCTO, M08_AP_DOCTO, "&_
			"  M08_NR_ORDEM, M08_IN_ATIVO, M01_NM_MENU, M02_NM_SUBM "&_
			"FROM M08_DOCTOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU  (NOLOCK) ON (M01_CD_MENU = M08_CD_MENU) "&_
			"  INNER JOIN M02_SUBM  (NOLOCK) ON (M02_CD_MENU+M02_CD_SUBM = M08_CD_MENU+M08_CD_SUBM) "&_
			"ORDER BY M08_CD_MENU, M08_CD_SUBM, "& tx_campo &" "& tx_ordem
'Response.Write(sql)
With objcmd
  .CommandTimeOut = 120
  .CommandText    = sql
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'coloca na pagina que for encontrado o registro
If Request.QueryString("in_acao") = "lista" Then
	str = "M08_CD_DOCTO = '"& Request("cd_docto_cad") &"'"
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

function fnc_AbreEdicao(tx_link, in_acao, cd_docto_cad) {
  features = "top=20,left=20,width=400,height=310,scrollbars=no,menubar=no,status=no";
	window.open(tx_link+'<%= "&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina%>&in_acao='+in_acao+'&cd_docto_cad='+cd_docto_cad,'EditaDocto',features);
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
					<td>Cadastro de Documentos</td>
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
							<a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"doctos","doctos_edt",1,1)%>','novo','','');"><b>Clique para criar um Documento</b></a></p></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td width="75" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_CD_DOCTO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">C&oacute;digo</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_NM_DOCTO&tx_ordem=ASC&p=<%= nr_pagina%>';">Nome</td>
						<td width="50" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_AP_DOCTO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td width="35" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_NR_ORDEM&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Ordem</td>
						<td width="30" class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_IN_ATIVO&tx_ordem=ASC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
						<td width="40" class="admtit" align="center">Exec</td>
					</tr>
					<%
str  = ""
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
	If str <> objrs.Fields.Item("M08_CD_MENU").Value&objrs.Fields.Item("M08_CD_SUBM").Value Then
%>
					<tr>
						<td colspan="7" class="admsub"><%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& objrs.Fields.Item("M01_NM_MENU").Value &")</i>"%></td>
					</tr>
					<%
  End If
  str = objrs.Fields.Item("M08_CD_MENU").Value&objrs.Fields.Item("M08_CD_SUBM").Value
%>
					<tr>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M08_CD_DOCTO").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M08_NM_DOCTO").Value%>&nbsp;</td>
						<td class="admcel"><%= objrs.Fields.Item("M08_AP_DOCTO").Value%>&nbsp;</td>
						<td align="right" class="admcel"><%= objrs.Fields.Item("M08_NR_ORDEM").Value%>&ordm;&nbsp;</td>
						<td align="center" class="admcel"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_docto_cad="&objrs.Fields.Item("M08_CD_DOCTO").Value&"&in_ativo="&objrs.Fields.Item("M08_IN_ATIVO").Value%>"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M08_IN_ATIVO"))%>.gif" width="12" height="12" border="0" align="Clique para ativar/desativar"></a></td>
						<td class="admcom"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr align="center">
									<td width="50%"><a href="#" onClick="fnc_AbreEdicao('<%= Replace(tx_link,"doctos","doctos_edt",1,1)%>','editar','<%= objrs.Fields.Item("M08_CD_DOCTO").Value%>');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
									<td width="50%"><a href="<%= tx_link&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&nr_pagina="&nr_pagina&"&cd_docto_cad="&objrs.Fields.Item("M08_CD_DOCTO").Value&"&in_acao=excluir"%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
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
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_CD_DOCTO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">C&oacute;digo</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_NM_DOCTO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Nome</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_AP_DOCTO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Apelido</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_NR_ORDEM&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Ordem</td>
						<td class="admtit" onClick="document.location='<%= tx_link%>&tx_campo=M08_IN_ATIVO&tx_ordem=DESC&nr_pagina=<%= nr_pagina%>';">Ativo</td>
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