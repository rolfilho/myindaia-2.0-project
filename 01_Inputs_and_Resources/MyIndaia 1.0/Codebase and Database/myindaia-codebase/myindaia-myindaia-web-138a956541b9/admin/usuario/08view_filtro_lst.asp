<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração do Site
'Arquivo de Script e HTML: Exibe os filtros selecionados para a personalização
'
'Modificado por Alexandre Gonçalves Neto em 29/06/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp" -->
<!--#include virtual="/includes/inc_execs.asp" -->
<%
Dim in_tipo  'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao  'ação que está ocorrendo no cadastro
Dim cd_filtro 'código do filtro da personalização

cd_view   = Request("cd_view")
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_filtro = Request("cd_filtro")
in_acao   = Request("in_acao")
tx_erro   = ""

If in_acao = "incluir" Then
  'incluir campo na personalização
  sql = "INSERT INTO M08_VIEW_FILTRO ( M08_CD_VIEW, M08_CD_FILTRO ) " &_
  		"VALUES ('"& cd_view &"', " &_
				"'"& cd_filtro &"')"
  objcnn.Execute(sql)
  If Err.Number <> 0 Then
	tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, filtro não incluído na personalização."
  End If
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/config.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
-->
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="3"><select name="cd_filtros" class="select" id="filtros" style="width: 269px;" onChange="MM_jumpMenu('self',this,0)">
		<option value="" selected>Selecione os filtros da Personalização</option>
		<%
sql = "SELECT M05_CD_FILTRO, M05_NM_FILTRO " &_
	  "FROM M05_FILTRO ( NOLOCK ) " &_
	  "WHERE M05_CD_MENU = '"& cd_menu &"' " &_
	  "  AND M05_CD_SUBM = '"& cd_subm &"' " &_
	  "  AND M05_CD_FILTRO NOT IN ( SELECT M08_CD_FILTRO " &_
	  "							  	FROM M08_VIEW_FILTRO " &_
	  "							  	WHERE M08_CD_VIEW = '"& cd_view &"' ) " &_
	  "  AND M05_IN_ATIVO = 1 " &_
	  "ORDER BY M05_NR_ORDEM"
objrsx.Open sql, objcnn, 3, 1

Do While Not objrsx.Eof
%>
		<option value="08view_filtro_lst.asp?cd_menu=<%= cd_menu%>&amp;cd_subm=<%= cd_subm%>&amp;cd_view=<%= cd_view%>&amp;cd_filtro=<%= objrsx("M05_CD_FILTRO")%>&amp;in_acao=incluir"><%= objrsx("M05_CD_FILTRO")&" - "&objrsx("M05_NM_FILTRO")%></option>
		<%
  objrsx.MoveNext
  If objrsx.Eof Then Exit Do
Loop
objrsx.Close
%>
     </select></td>
  </tr>
  <%
sql = "SELECT M08_CD_FILTRO, M05_NM_FILTRO " &_
	  "FROM M06_VIEW ( NOLOCK ) " &_
		"INNER JOIN M08_VIEW_FILTRO ( NOLOCK ) ON M08_CD_VIEW   = M06_CD_VIEW " &_
		"INNER JOIN M05_FILTRO      ( NOLOCK ) ON M05_CD_MENU   = M06_CD_MENU " &_
											 "AND M05_CD_SUBM   = M06_CD_SUBM " &_
											 "AND M05_CD_FILTRO = M08_CD_FILTRO " &_
	  "WHERE M06_CD_VIEW  = '"& cd_view &"' " &_
	  "  AND M05_IN_ATIVO = 1 " &_
	  "ORDER BY M08_CD_FILTRO "
objrs.Open sql, objcnn, 3, 1

If objrs.RecordCount < 1 Then
%>
  <tr>
    <td colspan="3"><p>A personalização(view) <b><%= cd_view%></b> não possui filtros personalizados.</p></td>
  </tr>
  <%
Else
  Do While Not objrs.Eof
%>
  <tr>
    <td width="15" class="gridexec"><a href="08view_filtro_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&cd_filtro=<%= objrs("M08_CD_FILTRO")%>&in_acao=excluir" target="_self"><img src="../../imagens/icones/16x16/button_drop.gif" alt="Clique aqui para excluir este campo da personalização" width="11" height="13" border="0"></a></td>
    <td width="20" class="gridview"><%= objrs("M08_CD_FILTRO")%></td>
    <td width="85%" class="gridview"><%= objrs("M05_NM_FILTRO")%></td>
  </tr>
  <%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
End If
objrs.Close
%>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->