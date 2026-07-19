<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Cadastro de Filtros da personalização
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/02/2007
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp" -->
<!--#include virtual="/includes/inc_execs.asp" -->
<%
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim cd_filtro   'código do filtro da personalização
Dim in_tipo     'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao     'ação que está ocorrendo no cadastro

cd_view   = Request("cd_view")
cd_filtro = Request("cd_filtro")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")

if fnc_TestaVar(cd_view) then cd_menu_cad = Mid(cd_view, 6, 2)
if fnc_TestaVar(cd_view) then cd_subm_cad = Mid(cd_view, 8, 2)

If in_acao = "incluir" Then
	'incluir campo na personalização
	sql = "INSERT INTO M08_VIEW_FILTRO ( M08_CD_VIEW, M08_CD_FILTRO ) " &_
				"VALUES ('"& cd_view &"', '"& cd_filtro &"')"
	objcnn.Execute(sql)
	If Err.Number <> 0 Then tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, filtro não incluído na personalização."
End If

If in_acao = "excluir" Then
  'exclui o campo da personalização
  sql = "DELETE FROM M08_VIEW_FILTRO " &_
  		"WHERE M08_CD_VIEW   = '"& cd_view &"' " &_
		"  AND M08_CD_FILTRO = '"& cd_filtro &"'"
  objcnn.Execute(sql)
  If Err.Number <> 0 Then
	tx_erro = "ATENÇÃO: Ocorreu um erro inesperado, campo não excluído da personalização."
  End If
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <%
sql = "SELECT M11_CD_FILTRO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
			"FROM M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
			"WHERE M11_CD_DADO    = M10_CD_DADO "&_
			"  AND M11_CD_MENU    = '"& cd_menu_cad &"' "&_
			"  AND M11_CD_SUBM    = '"& cd_subm_cad &"' "&_
			"  AND M11_CD_FILTRO NOT IN ( "&_
			"    SELECT M13_CD_FILTRO "&_
			"    FROM M13_VIEW_FILTRO ( NOLOCK ) "&_
			"    WHERE M13_CD_VIEW = '"& cd_view &"') "&_
			"  AND M11_TP_EXIBIR >= "& Session("tp_exibir") &_
			"  AND M11_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "&_
			"ORDER BY "& tx_lang_dado 
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then
	Do While Not objrs.Eof
%>
  <tr>
    <td class="gridexec"><a href="personal_filtro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&cd_filtro=<%= objrs("M11_CD_FILTRO")%>&in_acao=excluir" target="_self"><img src="/imagens/icones/16x16/button_drop.gif" alt="Clique aqui para excluir este campo da personalização" width="11" height="13" border="0"></a></td>
    <td class="gridview"><nobr><%= objrs.Fields.Item("M10_NM_DADO").Value%></nobr></td>
  </tr>
  <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
Else
%>
  <tr>
    <td colspan="3"><p>A personalização não possui filtros personalizados.</p></td>
  </tr>
  <%
End If
objrs.Close
%>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->