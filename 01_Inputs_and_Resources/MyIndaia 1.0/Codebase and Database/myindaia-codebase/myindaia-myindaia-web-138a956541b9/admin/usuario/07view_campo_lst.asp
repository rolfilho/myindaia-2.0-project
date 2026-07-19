<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração do Site
'Arquivo de Script e HTML: Exibe os campos selecionados para a personalização
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
Dim cd_campo 'código do campo para ser incluído na persoanalização

cd_view  = Request("cd_view")
cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_campo = Request("cd_campo")
in_acao  = Request("in_acao")
tx_erro  = ""

If in_acao = "incluir" Then
  'incluir campo na personalização
  sql = "INSERT INTO M07_VIEW_CAMPO ( M07_CD_VIEW, M07_CD_CAMPO ) " &_
  		"VALUES ('"& cd_view &"', " &_
				"'"& cd_campo &"')"
  objcnn.Execute(sql)
  If Err.Number <> 0 Then
	tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, campo não incluído na personalização."
  End If
End If

If in_acao = "excluir" Then
  'exclui o campo da personalização
  sql = "DELETE FROM M07_VIEW_CAMPO " &_
  		"WHERE M07_CD_VIEW  = '"& cd_view &"' " &_
		"  AND M07_CD_CAMPO = '"& cd_campo &"'"
  objcnn.Execute(sql)
  If Err.Number <> 0 Then
	tx_erro = "ATENÇÃO: Ocorreu um erro inesperado, campo não excluído da personalização."
  End If
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../includes/config.css" rel="stylesheet" type="text/css">
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
	<td colspan="3"><select name="cd_campos" class="select" id="campos" onChange="MM_jumpMenu('self',this,0)" style="width: 269px;">
		<option value="" selected>Selecione os campos da View</option>
		<%
sql = "SELECT M04_CD_CAMPO, M04_NM_CAMPO " &_
	  "FROM M04_CAMPO ( NOLOCK ) " &_
	  "WHERE M04_CD_MENU  = '"& cd_menu &"' " &_
	  "  AND M04_CD_SUBM  = '"& cd_subm &"' " &_
	  "  AND M04_CD_CAMPO NOT IN ( SELECT M07_CD_CAMPO " &_
	  "							   FROM M07_VIEW_CAMPO " &_
	  "							   WHERE M07_CD_VIEW = '"& cd_view &"' ) " &_
	  "  AND M04_IN_ATIVO = 1 " &_
	  "ORDER BY M04_NR_ORDEM"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1

Do While Not objrsx.Eof
%>
		<option value="07view_campo_lst.asp?cd_menu=<%= cd_menu%>&amp;cd_subm=<%= cd_subm%>&amp;cd_view=<%= cd_view%>&amp;cd_campo=<%= objrsx("M04_CD_CAMPO")%>&amp;in_acao=incluir"><%= objrsx("M04_CD_CAMPO")&" - "&objrsx("M04_NM_CAMPO")%></option>
		<%
  objrsx.MoveNext
  If objrsx.Eof Then Exit Do
Loop
objrsx.Close
%>
     </select></td>
  </tr>
  <%
sql = "SELECT M07_CD_CAMPO, M04_NM_CAMPO " &_
	  "FROM M06_VIEW ( NOLOCK ) " &_
		"INNER JOIN M07_VIEW_CAMPO ( NOLOCK ) ON M07_CD_VIEW  = M06_CD_VIEW " &_
		"INNER JOIN M04_CAMPO      ( NOLOCK ) ON M04_CD_MENU  = M06_CD_MENU " &_
											"AND M04_CD_SUBM  = M06_CD_SUBM " &_
											"AND M04_CD_CAMPO = M07_CD_CAMPO " &_
	  "WHERE M06_CD_VIEW  = '"& cd_view &"' " &_
	  "  AND M04_IN_ATIVO = 1 " &_
	  "ORDER BY M04_NR_ORDEM "
objrs.Open sql, objcnn, 3, 1

If objrs.RecordCount < 1 Then
%>
  <tr>
    <td colspan="3"><p>A personalização(view) <b><%= cd_view%></b> não possui campos personalizados.</p></td>
  </tr>
  <%
Else
  Do While Not objrs.Eof
%>
  <tr>
    <td width="15" class="gridexec"><a href="07view_campo_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&cd_campo=<%= objrs("M07_CD_CAMPO")%>&in_acao=excluir" target="_self"><img src="../../imagens/icones/16x16/button_drop.gif" alt="Clique aqui para excluir este campo da personalização" width="11" height="13" border="0"></a></td>
    <td width="20" class="gridview"><%= objrs("M07_CD_CAMPO")%></td>
    <td width="85%" class="gridview"><%= objrs("M04_NM_CAMPO")%></td>
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