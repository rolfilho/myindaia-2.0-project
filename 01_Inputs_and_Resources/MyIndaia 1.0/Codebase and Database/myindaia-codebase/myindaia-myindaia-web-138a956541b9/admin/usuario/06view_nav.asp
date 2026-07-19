<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração do Site
'Arquivo de Script e HTML: Visualização de Personalizações
'
'Modificado por Alexandre Gonçalves Neto em 29/06/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/cfg_utils.asp" -->
<!--#include virtual="/includes/cfg_execs.asp" -->
<%
Dim in_tipo 'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao 'ação que está ocorrendo na tabela
Dim cd_usuario, nm_view, in_dt_prev, in_download, in_email, in_padrao, in_system, cd_evento, nr_dias

cd_tela = "06"
tx_erro = Request("tx_erro")
campo   = CStr(Request.QueryString("c"))
ordem   = CStr(Request.QueryString("o"))
pagina  = CInt(Request.QueryString("p"))

'verifica se as variaves não são nulas/vazio
If Not fnc_TestaVar(campo) Then campo = "M06_CD_VIEW"
If Not fnc_TestaVar(ordem) Then ordem = "ASC"
If pagina = 0 Then pagina = 1

'Response.Write("cd_menu     = "& Request.Form("cd_menu") &"<br>")
'Response.Write("cd_subm     = "& Request.Form("cd_subm") &"<br>")
'Response.Write("cd_usuario  = "& Request.Form("cd_usuario") &"<br>")
'Response.Write("cd_view     = "& cd_usuario &"-"& cd_menu & cd_subm &"-" &"<br>")
'Response.Write("nm_view     = "& Request.Form("nm_view") &"<br>")
'Response.Write("in_dt_prev  = "& Request.Form("in_dt_prev") &"<br>")
'Response.Write("in_padrao   = "& Request.Form("in_padrao") &"<br>")
'Response.Write("in_download = "& Request.Form("in_download") &"<br>")
'Response.Write("in_email    = "& Request.Form("in_email") &"<br>")
'Response.Write("in_system   = "& Request.Form("in_system") &"<br>")
'Response.Write("cd_evento   = "& Request.Form("cd_evento") &"<br>")
'Response.Write("nr_dias     = "& Request.Form("nr_dias") &"<br>")

If in_acao = "alterar" Then 'efetua o uptade na tabela
  cd_menu     = CStr(Request.Form("cd_menu"))
  cd_subm     = CStr(Request.Form("cd_subm"))
  cd_usuario  = CStr(Request.Form("cd_usuario"))
  cd_view	  = CStr(cd_usuario &"-"& cd_menu & cd_subm &"-")
  nm_view     = CStr(Request.Form("nm_view"))
  in_dt_prev  = CInt(Request.Form("in_dt_prev"))
  in_padrao   = CInt(Request.Form("in_padrao"))
  in_download = CInt(Request.Form("in_download"))
  in_email    = 0'CInt(Request.Form("in_email"))
  in_system   = CInt(Request.Form("in_system"))
  cd_evento   = CStr(Request.Form("cd_evento"))
  nr_dias     = CInt(Request.Form("nr_dias"))
  'verifica se os dados foram informados corretamente
  If cd_menu = "" or cd_subm = "" or cd_usuario = "" or cd_view = "" or nm_view = "" Then
	tx_erro = "ATENÇÃO: ocorreram os seguintes erros:\n"
	If cd_menu    = "" Then tx_erro = tx_erro &"- Código do menu não definido;\n"
	If cd_subm    = "" Then tx_erro = tx_erro &"- Código do sub-menu não definido;\n"
	If cd_usuario = "" Then tx_erro = tx_erro &"- Código do usuário não definido;\n"
	If cd_view    = "" Then tx_erro = tx_erro &"- Código da view não foi criado;\n"
	If nm_view    = "" Then tx_erro = tx_erro &"- Nome da view não preenchido;\n"
  Else
	'verifica se esta é a unica view do usuário
	sql = "SELECT COUNT(M06_CD_VIEW) AS NR_VIEW " &_
		  "FROM M06_VIEW ( NOLOCK ) " &_
		  "WHERE M06_CD_MENU    = '"& cd_menu    &"' "&_
		  "  AND M06_CD_SUBM    = '"& cd_subm    &"' "&_
		  "  AND M06_CD_USUARIO = '"& cd_usuario &"' "&_
		  "  AND M06_IN_SYSTEM  = 0"
	'Response.Write(sql)
	objrsx.Open sql, objcnn, 3, 1
	'verifica quantas views tem o usuario, se for apenas uma, ela será a padrão
	If CInt(objrsx("NR_VIEW")) = 1 Then in_padrao = 1
	objrsx.Close
	
	sql = "UPDATE M06_VIEW " &_
		  "SET M06_NM_VIEW     = '"& nm_view     &"', " &_
			  "M06_IN_DT_PREV  = '"& in_dt_prev  &"', " &_
			  "M06_IN_PADRAO   = '"& in_padrao   &"', " &_
			  "M06_IN_DOWNLOAD = '"& in_download &"', " &_
			  "M06_IN_EMAIL    = '"& in_email    &"', " &_
			  "M06_IN_SYSTEM   = '"& in_system   &"', " &_
			  "M06_CD_EVENTO   = '"& cd_evento   &"', " &_
			  "M06_NR_DIAS     = '"& nr_dias     &"' " &_
		  "WHERE M06_CD_VIEW = '"& cd_view &"'"
	'Response.Write(sql)
	objcnn.Execute(sql)
	'verifica se ocorreram erros, se sim, informa usuário
	If Err.Number = 0 Then
	  in_tipo = "alterar"
	  tx_erro = "Personalização alterada com sucesso!"
	  'verifica se foi cadastrado o evento
	  If Not fnc_TestaVar(cd_evento) Then
	    sql = "UPDATE M06_VIEW "&_
			  "SET M06_CD_EVENTO = NULL, "&_
			  "    M06_NR_DIAS   = 0 "&_
			  "WHERE M06_CD_VIEW = '"& cd_view &"'"
	    'Response.Write(sql)
		objcnn.Execute(sql)
	  End If
	  'verifica se a nova view é padrão
	  If in_padrao Then
	    sql = "UPDATE M06_VIEW " &_
			  "   SET M06_IN_PADRAO  = '0' " &_
			  " WHERE M06_CD_VIEW   <> '"& cd_view &"' " &_
			  "   AND M06_CD_MENU    = '"& cd_menu &"' " &_
			  "   AND M06_CD_SUBM    = '"& cd_subm &"' " &_
			  "   AND M06_CD_USUARIO = '"& cd_usuario &"'"
		'Response.Write(sql)
		objcnn.Execute(sql)
	  End If
	  'verifica se a nova view é padrão
	  If in_system Then
	    sql = "UPDATE M06_VIEW " &_
			  "   SET M06_IN_SYSTEM  = '0' " &_
			  " WHERE M06_CD_VIEW   <> '"& cd_view &"' " &_
			  "   AND M06_CD_MENU    = '"& cd_menu &"' " &_
			  "   AND M06_CD_SUBM    = '"& cd_subm &"' " &_
			  "   AND M06_CD_USUARIO = '"& cd_usuario &"'"
		'Response.Write(sql)
		objcnn.Execute(sql)
	  End If
	Else
	  in_tipo = "alterar"
	  tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, a personalização não foi alterada."
	End If
  End If
End If

If in_acao = "excluir" Then
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

nr_reg_pagina  = 1
objrs.PageSize = nr_reg_pagina

sql = "SELECT "&_
	  "  M06_CD_MENU, M06_CD_SUBM, M06_CD_VIEW, M06_CD_USUARIO, "&_
	  "  M06_NM_VIEW, M06_IN_DT_PREV, M06_IN_PADRAO, M06_IN_DOWNLOAD, M06_IN_EMAIL, " &_
	  "  ISNULL( M06_CD_EVENTO, '') AS M06_CD_EVENTO, M06_NR_DIAS " &_
	  "FROM M06_VIEW ( NOLOCK ) " &_
	  "ORDER BY M06_CD_MENU, M06_CD_SUBM, "& campo &" "& ordem
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 3

If objrs.PageCount < pagina Then pagina = objrs.PageCount

objrs.AbsolutePage = pagina
cd_view     = CStr(objrs("M06_CD_VIEW"))
cd_menu     = CStr(objrs("M06_CD_MENU"))
cd_subm     = CStr(objrs("M06_CD_SUBM"))
cd_usuario  = CStr(objrs("M06_CD_USUARIO"))
nm_view     = CStr(objrs("M06_NM_VIEW"))
in_dt_prev  = CInt(objrs("M06_IN_DT_PREV"))
in_padrao   = CInt(objrs("M06_IN_PADRAO"))
in_download = CInt(objrs("M06_IN_DOWNLOAD"))
in_email    = CInt(objrs("M06_IN_EMAIL"))
cd_evento   = CStr(objrs("M06_CD_EVENTO"))
nr_dias     = CInt(objrs("M06_NR_DIAS"))
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/config.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
function fnc_FocusCampo() {
  document.cadview.nm_view.focus();
}

function fnc_MudaCheck(in_check) {
  with (document.cadview) {
    if (in_check == 'padrao')
	  if (in_system.checked == true) {
	    alert('ATENÇÃO:\n\n A personalização de sistema não pode ser padrão.');
		in_padrao.checked = false;
	  }
	if (in_check == 'system')
	  if (in_padrao.checked == true) {
	    alert('ATENÇÃO:\n\n A personalização padrão não pode ser de sistema.');
		in_system.checked = false;
	  }
  }
}

function fnc_ConsultaCodigo(campo) {
  with (document.cadview) {
	if (campo == 'evento') {
	  var codigo = cd_evento.value;
	  if (codigo.length > 0 && codigo.length <= 3 && codigo != 0) {
	    for (i = codigo.length; i < 3; i++)
	      codigo = '0'+ String(codigo);
		cd_evento.value = codigo;
	    nm_evento.value = codigo;
		nr_dias.select();
	    nr_dias.focus();
      }
	  else {
	    cd_evento.value = '';
	    nm_evento.value = '';
	  }
    }
  }  //encerra o with
}  //encerra a function

function fnc_InsereCodigo(campo) {
  with (document.cadview) {
	if (campo == 'evento') {
	  cd_evento.value = nm_evento.options[nm_evento.selectedIndex].value;
	  nr_dias.select();
	  nr_dias.focus();
    }
  }
}

function fnc_ValidaForm(form) {
  var valida = true;

  //VALIDA O MENU
  if (form.cd_menu.value == '' || form.cd_menu.value == '00') {
	alert('ATENÇÃO: Código do MENU não especificao!');
	valida = false;
  }
  //VALIDA O SUB-MENU
  if (form.cd_subm.value == '' || form.cd_subm.value == '00') {
	alert('ATENÇÃO: Código do SUB-MENU não especificao!');
	valida = false;
  }
  //VALIDA O USUÁRIO
  if (form.cd_usuario.value == '' || form.cd_usuario.value == '0000') {
	alert('ATENÇÃO: Código do USUÁRIO não especificao!');
	valida = false;
  }
  //VALIDA O NOME DO CAMPO
  if (form.nm_view.value == '') {
    eval('form.nm_filtro.style.background="red"');
	alert('ATENÇÃO: NOME DA PERSONALIZAÇÃO não especificao!');
	eval('form.nm_filtro.style.background="white"');
	valida = false;
  }
  
  return valida
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="75"><!--#include file="../../config/idx_top.asp" --></td>
  </tr>
  <tr>
    <td height="45" class="titulo">&nbsp;&nbsp;&nbsp;Gerenciamento de Personalização</td>
  </tr>
  <tr>
    <td valign="top"><table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ir para a página
        <%
'verifica se &eacute; para exibir anterior
If pagina > 1 Then
%>
        <a href="06view_nav.asp?c=<%= campo%>&o=<%= ordem%>&p=1" target="_self"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="Primeira P&aacute;gina" width="19" height="16" border="0" align="absmiddle"></a> 
		<a href="06view_nav.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= (pagina - 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="P&aacute;gina Anterior" width="19" height="16" border="0" align="absmiddle"></a>
        <%
ElseIf objrs.PageCount > 1 Then
  Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='Primeira P&aacute;gina' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='P&aacute;gina Anterior' width='19' height='16' align='absmiddle'>")
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
        <a href="06view_nav.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= (pagina + 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="Pr&oacute;xima P&aacute;gina" width="19" height="16" border="0" align="absmiddle"></a> 
		<a href="06view_nav.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= objrs.PageCount%>" target="_self"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="&Uacute;ltima P&aacute;gina" width="19" height="16" border="0" align="absmiddle"></a>
        <%
ElseIf objrs.PageCount > 1 Then
  Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='Pr&oacute;xima P&aacute;gina' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='&Uacute;ltima P&aacute;gina' width='19' height='16' align='absmiddle'>")
End If
%>
        </p></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1">
          <form action="06view_cad.asp?c=<%= campo%>&o=<%= ordem%>&p=<%= pagina%>" method="post" name="cadview" onSubmit="return fnc_ValidaForm(this);">
            <tr>
              <td height="30" class="label"><label for="menu">Menu:</label></td>
              <%
'seleciona o menu
sql = "SELECT M01_CD_MENU, M01_NM_MENU " &_
  	  	"FROM M01_MENU ( NOLOCK ) " &_
	  	"WHERE M01_CD_MENU = '"& cd_menu &"' " &_ 
	  	"ORDER BY M01_CD_MENU"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1
%>
              <td class="dados"><%= objrsx.Fields.Item("M01_CD_MENU").Value &" - "& objrsx.Fields.Item("M01_NM_MENU").Value%>
                  <input name="cd_menu" type="hidden" value="<%= cd_menu%>"></td>
              <%
objrsx.Close
%>
            </tr>
            <tr>
              <td height="30" class="label"><label for="subm">Sub-Menu:</label></td>
              <%
'seleciona a sub-menu
sql = "SELECT M02_CD_SUBM, M02_NM_SUBM " &_
	  "FROM M02_SUBM ( NOLOCK ) " &_
	  "WHERE M02_CD_MENU = '"& cd_menu &"' "&_
	  "  AND M02_CD_SUBM = '"& cd_subm &"' "&_
	  "ORDER BY M02_CD_SUBM"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1
%>
              <td class="dados"><%= objrsx.Fields.Item("M02_CD_SUBM").Value &" - "& objrsx.Fields.Item("M02_NM_SUBM").Value%>
                  <input name="cd_subm" type="hidden" value="<%= cd_subm%>"></td>
              <%
objrsx.Close
%>
            </tr>
            <tr>
              <td height="30" class="label"><label for="user">Usu&aacute;rio:</label></td>
              <%
'seleciona o usu&aacute;rio
sql = "SELECT CD_USUARIO, NM_USUARIO, CD_CARGO " &_
	  "FROM TUSUARIO ( NOLOCK ) " &_
	  "WHERE CD_USUARIO = '"& cd_usuario &"' "&_
	  "ORDER BY CD_CARGO"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1

If Trim(objrsx("CD_CARGO")) = "040" Then str = "(cliente)" Else str = "(interno)"
%>
              <td class="dados"><%= objrsx.Fields.Item("CD_USUARIO").Value &" - "& objrsx.Fields.Item("NM_USUARIO").Value & str%>
                  <input name="cd_usuario" type="hidden" value="<%= cd_usuario%>"></td>
              <%
objrsx.Close
%>
            </tr>
            <tr>
              <td height="25" class="label"><label for="codigo">C&oacute;digo:</label></td>
              <td class="dados"><input name="cd_view" type="text" disabled class="editbox" id="codigo" style="width: 75px;" value="<%= cd_view%>" maxlength="12"></td>
            </tr>
            <tr>
              <td height="25" class="label"><label for="nome">Nome:</label></td>
              <td class="dados"><input name="nm_view" type="text" class="editbox" id="nome" style="width: 285px;" value="<%= nm_view%>" maxlength="50"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>></td>
            </tr>
            <% 
'seleciona todos o evento ao sub-menu
sql = "SELECT M03_CD_EVENTO, NM_EVENTO " &_
	  "FROM M03_EVENTO ( NOLOCK ) " &_
	  "  INNER JOIN TEVENTO ( NOLOCK ) ON CD_EVENTO = M03_CD_EVENTO " &_
	  "WHERE M03_CD_MENU   = '"& cd_menu   &"' "&_
	  "  AND M03_CD_SUBM   = '"& cd_subm   &"' " 
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1
'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
If Not objrsx.Eof then
%>
            <tr>
              <td height="25" class="label"><label for="evento">Evento:</label></td>
              <td class="dados"><input name="cd_evento" type="text" class="editbox" id="evento" style="width: 25px;" tabindex="2" onBlur="fnc_ConsultaCodigo('evento');" value="<%= cd_evento%>" maxlength="3"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
                  <select name="nm_evento" class="select" style="width:195px;" onChange="fnc_InsereCodigo('evento');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
                    <option selected value="">Selecione um Evento...</option>
                    <%
  Do While Not objrsx.Eof
    selected = ""
    If Trim(cd_evento) = objrsx("M03_CD_EVENTO") Then selected = " selected"
%>
                    <option value="<%= objrsx("M03_CD_EVENTO")%>"<%= selected%>><%= objrsx("NM_EVENTO")%></option>
                    <%
    objrsx.MoveNext
    If objrsx.Eof Then Exit Do
  Loop
%>
                  </select>
                  <b>Dias:</b>
                  <input name="nr_dias" type="text" class="editbox" style="width: 25px;" value="<%= nr_dias%>" maxlength="3"></td>
            </tr>
            <%
End If

objrsx.Close

sql = "SELECT COUNT(*) AS TOTAL "&_
	  "FROM M04_CAMPO ( NOLOCK ) "&_
	  "WHERE M04_CD_MENU = '"& cd_menu &"' "&_
	  "  AND M04_CD_SUBM = '"& cd_subm &"' "
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1
  
If objrsx.Fields.Item("TOTAL").Value > 0 Then
%>
            <tr>
              <td valign="top" class="label"><label for="campos">Campos:</label></td>
              <td class="dados"><iframe src="07view_campo_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&in_acao=" name="frm_campo" frameborder="0" height="104" width="100%" scrolling="yes"></iframe></td>
            </tr>
            <%
End If
objrsx.Close
  
sql = "SELECT COUNT(*) AS TOTAL "&_
	  "FROM M05_FILTRO ( NOLOCK ) "&_
	  "WHERE M05_CD_MENU = '"& cd_menu &"' "&_
	  "  AND M05_CD_SUBM = '"& cd_subm &"' "
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, 3, 1
  
If objrsx.Fields.Item("TOTAL").Value > 0 Then
%>
            <tr>
              <td valign="top" class="label"><label for="filtros">Filtros:</label></td>
              <td class="dados"><iframe src="08view_filtro_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&in_acao=" name="frm_filtro" frameborder="0" height="104" width="100%" scrolling="yes"></iframe></td>
            </tr>
            <%
End If
objrsx.Close

checked = ""
If CBool(in_dt_prev) Then checked = " checked"
%>
            <tr>
              <td class="label"><label for="prevista">Dt. Prevista:</label></td>
              <td class="dados"><input name="in_dt_prev" type="checkbox" id="prevista" value="1"<%= checked%> class="radio"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        visualiza datas previstas</td>
            </tr>
            <%
checked = ""
If CBool(in_padrao) Then checked = " checked"
%>
            <tr>
              <td class="label"><label for="padrao">Padr&atilde;o:</label></td>
              <td class="dados"><input name="in_padrao" type="checkbox" id="padrao" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('padrao');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        torna a personaliza&ccedil;&atilde;o padr&atilde;o</td>
            </tr>
            <%
checked = ""
If CBool(in_system) Then checked = " checked"
%>
            <tr>
              <td class="label"><label for="sistema">Sistema:</label></td>
              <td class="dados"><input name="in_system" type="checkbox" id="sistema" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('system');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        torna a personaliza&ccedil;&atilde;o de sistema</td>
            </tr>
            <%
checked = ""
If CBool(in_download) Then checked = " checked"
%>
            <tr>
              <td class="label"><label for="download">Download:</label></td>
              <td class="dados"><input name="in_download" type="checkbox" id="download" value="1"<%= checked%> class="radio"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        ativa download dos resultados (xls)</td>
            </tr>
            <%
'checked = ""
'If CBool(in_email) Then checked = " checked"
%>
            <!--
		  <tr>
            <td class="label"><label for="email">E-mail:</label></td>
            <td class="dados"><input name="in_email" type="checkbox" id="email" value="1"<%= checked%> class="radio">
            Marque aqui para enviar por e-mail os resultados (pdf) </td>
          </tr>
		  -->
            <tr bgcolor="#DDDDDD">
              <td width="25%">&nbsp;</td>
              <td width="75%" style="padding: 5px;"><input name="in_acao" type="hidden" value="alterar">
                  <input name="enviar" type="submit" class="button" value="Salvar" tabindex="7">
				  <input name="cancel" type="reset" class="button" value="Cancelar"></td>
            </tr>
          </form>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/cfg_ends.asp" -->