<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração do Site
'Arquivo de Script e HTML: Listagem das personalizações
'
'Modificado por Alexandre Gonçalves Neto em 29/06/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/cfg_utils.asp" -->
<!--#include virtual="/includes/cfg_execs.asp" -->
<%
cd_tela = "06"
tx_erro = Request("tx_erro")
campo   = CStr(Request.QueryString("c"))
ordem   = CStr(Request.QueryString("o"))
pagina  = CInt(Request.QueryString("p"))

'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(campo) Then campo = "M06_CD_VIEW"
If Not fnc_TestaVar(ordem) Then ordem = "ASC"
If pagina = 0 Then pagina = 1

If Not IsEmpty(Request.QueryString("in_dt_prev"))  Then Call sub_CheckView(Request.QueryString("cd_menu"), Request.QueryString("cd_subm"), Request.QueryString("cd_user"), Request.QueryString("cd_view"), "M06_IN_DT_PREV" , Request.QueryString("in_dt_prev"))
If Not IsEmpty(Request.QueryString("in_download")) Then Call sub_CheckView(Request.QueryString("cd_menu"), Request.QueryString("cd_subm"), Request.QueryString("cd_user"), Request.QueryString("cd_view"), "M06_IN_DOWNLOAD", Request.QueryString("in_download"))
'If Not IsEmpty(Request.QueryString("in_email"))    Then Call sub_CheckView(Request.QueryString("cd_menu"), Request.QueryString("cd_subm"), Request.QueryString("cd_user"), Request.QueryString("cd_view"), "M06_IN_EMAIL"   , Request.QueryString("in_email"))
If Not IsEmpty(Request.QueryString("in_padrao"))   Then Call sub_CheckView(Request.QueryString("cd_menu"), Request.QueryString("cd_subm"), Request.QueryString("cd_user"), Request.QueryString("cd_view"), "M06_IN_PADRAO"  , Request.QueryString("in_padrao"))
If Not IsEmpty(Request.QueryString("in_system"))   Then Call sub_CheckView(Request.QueryString("cd_menu"), Request.QueryString("cd_subm"), Request.QueryString("cd_user"), Request.QueryString("cd_view"), "M06_IN_SYSTEM"  , Request.QueryString("in_system"))

If Request.QueryString("in_acao") = "excluir" Then
  cd_view = Request("cd_view")
  
  If Trim(cd_view) = "" Then
    tx_erro = "Exclusão não pode ser realizada, dados insuficientes."
	Response.Redirect("view_cadastro.asp?in_acao=editar&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
  Else
    sql = "SELECT M06_CD_USUARIO " &_
		  "FROM M06_VIEW ( NOLOCK ) " &_
		  "WHERE M06_CD_VIEW = '"& cd_view &"'"
	objrs.Open sql, objcnn, 3, 1
	'alterar o codigo do usuario na session para o do programador atual
	If objrs("M06_CD_USUARIO") <> "0627" Then
	  'apaga os registros da tabela view_campo
	  sql = "DELETE FROM M07_VIEW_CAMPO " &_
		  "WHERE M07_CD_VIEW = '"& cd_view &"'"
	  objcnn.Execute(sql)
	  'apaga os registros da tabela view_filtro
	  sql = "DELETE FROM M08_VIEW_FILTRO " &_
		  "WHERE M08_CD_VIEW = '"& cd_view &"'"
	  objcnn.Execute(sql)
	  'apaga a view selecionanda 
	  sql = "DELETE FROM M06_VIEW " &_
		  "WHERE M06_CD_VIEW = '"& cd_view &"'"
	  objcnn.Execute(sql)
	  tx_erro = "Personalização excluída com sucesso."
	  Response.Redirect("06view_cad.asp?in_acao=novo&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
	Else
	  tx_erro = "Personalização padrão do sistema, não pode ser excluída."
	  Response.Redirect("06view_cad.asp?in_acao=editar&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
	End If
	objrs.Close
  End If
End If

nr_reg_pagina  = 20
objrs.PageSize = nr_reg_pagina

sql = "SELECT "&_
	  "  M06_CD_MENU, M01_NM_MENU, " &_
	  "  M06_CD_SUBM, M02_NM_SUBM, " &_
	  "  M06_CD_VIEW, M06_NM_VIEW, M06_CD_USUARIO, M06_TP_REL, M06_CD_EVENTO, M06_NR_DIAS, " &_
	  "	 M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL, M06_IN_PADRAO, M06_IN_SYSTEM " &_
	  "FROM M06_VIEW ( NOLOCK ) " &_
	  "  INNER JOIN M01_MENU ( NOLOCK ) ON ( M01_CD_MENU = M06_CD_MENU ) " &_
	  "  INNER JOIN M02_SUBM ( NOLOCK ) ON ( M02_CD_MENU = M06_CD_MENU AND M02_CD_SUBM = M06_CD_SUBM ) " &_
	  "ORDER BY M06_CD_MENU ASC, M06_CD_SUBM ASC, "& campo &" "& ordem
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 3

If objrs.PageCount < pagina Then pagina = objrs.PageCount

objrs.AbsolutePage = pagina
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/config.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "06view_lst.asp?c=<%= campo%>&o=<%= ordem%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}
//-->
</script>
</head>

<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="75"><!--#include file="../../config/idx_top.asp" --></td>
  </tr>
  <tr>
    <td height="45" class="titulo">&nbsp;&nbsp;&nbsp;Gerenciamento de Personalização</td>
  </tr>
  <tr>
    <td valign="top"><table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20"><p>
        <%
y = ((pagina - 1) * nr_reg_pagina) + 1
z = nr_reg_pagina * pagina
If z > objrs.RecordCount Then z = objrs.RecordCount
%>
		  Exibindo do <%= y%> ao <%= z%> de <%= objrs.RecordCount%> registros.
		  <%
'verifica se &eacute; para exibir anterior
If pagina > 1 Then
%>
            <a href="06view_lst.asp?c=<%= campo%>&o=<%= ordem%>&p=1" target="_self"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="Primeira Página" width="19" height="16" border="0" align="absmiddle"></a>
			<a href="06view_lst.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= (pagina - 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="Página Anterior" width="19" height="16" border="0" align="absmiddle"></a>
			<%
ElseIf objrs.PageCount > 1 Then
  Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='Primeira Página' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='Página Anterior' width='19' height='16' align='absmiddle'>")
End If
'se existitem mais de 20 registros exibe o "Jump Menu"
If objrs.RecordCount > 20 Then
%>
			<select name="nr_pagina" class="select" onChange="MM_jumpMenu('self',this,0);">
			<%
  For x = 1 To objrs.PageCount
    If pagina = x Then selected = " selected" Else selected = ""
    Response.Write("<option value='"& x &"'"& selected &">"& x &"</option>")
  Next
			%>
			</select>
			<%
End If
'verifica se &eacute; para exibir Pr&oacute;xima
If pagina < objrs.PageCount Then
%>
            <a href="06view_lst.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= (pagina + 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="Próxima Página" width="19" height="16" border="0" align="absmiddle"></a>
			<a href="06view_lst.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= objrs.PageCount%>" target="_self"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="Última Página" width="19" height="16" border="0" align="absmiddle"></a>
            <%
ElseIf objrs.PageCount > 1 Then
  Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='Próxima Página' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='Última Página' width='19' height='16' align='absmiddle'>")
End If
%>
        </p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
			  <td width="40" class="gridtit" onClick="document.location='06view_lst.asp?c=M06_CD_USUARIO&o=ASC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">Usu&aacute;rio</td>
			  <td width="25" class="gridtit" onClick="document.location='06view_lst.asp?c=M06_CD_VIEW&o=ASC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">C&oacute;d.</td>
			  <td class="gridtit" onClick="document.location = '06view_lst.asp?c=M06_NM_VIEW&o=ASC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">Nome</td>
			  <td width="35" class="gridtit">Padr&atilde;o</td>
			  <td width="35" class="gridtit">Sys.</td>
			  <td width="35" class="gridtit">Prev.</td>
			  <td width="25" class="gridtit">XLS</td>
			  <!--<td width="25" class="gridtit">PDF</td>
			  <td width="25" class="gridtit">Tipo</td>-->
			  <td width="25" class="gridtit">Evento</td>
			  <td width="25" class="gridtit">Dias</td>
			  <td width="60" align="center" class="gridtit">Comandos</td>
			</tr>
			<%
str  = "0000"
cont = 0
Do While cont < objrs.PageSize and Not objrs.Eof
  If str <> objrs("M06_CD_MENU")&objrs("M06_CD_SUBM") Then
%>
            <tr>
              <td colspan="11" class="gridsub"><%= objrs("M01_NM_MENU") &" - "& objrs("M02_NM_SUBM")%></td>
            </tr>
            <%
  End If
  str = objrs("M06_CD_MENU")&objrs("M06_CD_SUBM")
%>
			<tr>
			  <td align="right" class="gridcel"><%= objrs("M06_CD_USUARIO")%>&nbsp;</td>
			  <td align="right" class="gridcel"><%= Right(objrs("M06_CD_VIEW"), 2)%>&nbsp;</td>
              <td class="gridcel"><a href="#" onClick="javascript:window.open('06view_edt.asp?in_acao=editar&cd_menu=<%= objrs("M06_CD_MENU")%>&cd_subm=<%= objrs("M06_CD_SUBM")%>&cd_view=<%= objrs("M06_CD_VIEW")%>&c=<%= campo%>&o=<%= ordem%>&p=<%= pagina%>','edita_view','top=20,left=20,width=400,height=610');"><%= objrs("M06_NM_VIEW")%></a></td>
			  <td align="center" class="gridcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_SYSTEM"))%>.gif" width="12" height="12"></td>
			  <td align="center" class="gridcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_PADRAO"))%>.gif" width="12" height="12"></td>
			  <td align="center" class="gridcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_DT_PREV"))%>.gif" width="12" height="12"></td>
			  <td align="center" class="gridcel"><img src="/imagens/icones/<%= fnc_CheckImg(objrs("M06_IN_DOWNLOAD"))%>.gif" width="12" height="12"></td>
			  <!--<td align="center" class="gridcel"><img src="/imagens/icones/<%'= fnc_CheckImg(objrs("M06_IN_EMAIL"))%>.gif" width="12" height="12"></td>
			  <td align="center" class="gridcel"><%'= objrs("M06_TP_REL")%>&nbsp;</td>-->
			  <td align="center" class="gridcel"><%= objrs("M06_CD_EVENTO")%>&nbsp;</td>
			  <td align="right" class="gridcel"><%= objrs("M06_NR_DIAS")%>&nbsp;</td>
			  <td class="gridcom"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                  <tr align="center">
                    <td width="33%"><a href="06view_nav.asp?in_acao=editar&cd_menu=<%= objrs("M06_CD_MENU")%>&cd_subm=<%= objrs("M06_CD_SUBM")%>&cd_view=<%= objrs("M06_CD_VIEW")%>c=<%= campo%>&o=<%= ordem%>&p=<%= (((pagina-1)*nr_reg_pagina)+(cont+1))%>"><img src="/imagens/icones/16x16/button_view.gif" height="13" width="14" border="0"></a></td>
                    <td width="33%"><a href="#" onClick="javascript:window.open('06view_edt.asp?in_acao=editar&cd_menu=<%= objrs("M06_CD_MENU")%>&cd_subm=<%= objrs("M06_CD_SUBM")%>&cd_view=<%= objrs("M06_CD_VIEW")%>&c=<%= campo%>&o=<%= ordem%>&p=<%= pagina%>','edita_view','top=20,left=20,width=400,height=610');"><img src="/imagens/icones/16x16/button_edit.gif" height="13" width="12" border="0" alt="Editar"></a></td>
                    <td width="33%"><a href="06view_lst.asp?in_acao=excluir&cd_menu=<%= objrs("M06_CD_MENU")%>&cd_subm=<%= objrs("M06_CD_SUBM")%>&cd_view=<%= objrs("M06_CD_VIEW")%>&c=<%= campo%>&o=<%= ordem%>&p=<%= pagina%>"><img src="/imagens/icones/16x16/button_drop.gif" height="13" width="11" border="0" alt="Excluir"></a></td>
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
			  <td class="gridtit" onClick="document.location = '06view_lst.asp?c=M06_CD_USUARIO&o=DESC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">Usu&aacute;rio</td>
			  <td class="gridtit" onClick="document.location = '06view_lst.asp?c=M06_CD_VIEW&o=DESC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">C&oacute;d.</td>
			  <td class="gridtit" onClick="document.location = '06view_lst.asp?c=M06_NM_VIEW&o=DESC&p=<%= pagina%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">Nome</td>
			  <td class="gridtit">Padr&atilde;o</td>
			  <td class="gridtit">Sys.</td>
			  <td class="gridtit">Prev.</td>
			  <td class="gridtit">XLS</td>
			  <!--<td class="gridtit">PDF</td>
			  <td class="gridtit">Tipo</td>-->
			  <td class="gridtit">Evento</td>
			  <td class="gridtit">Dias</td>
			  <td align="center" class="gridtit">Comandos</td>
			</tr>
		</table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/cfg_ends.asp" -->