<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração do Site
'Arquivo de Script e HTML: Cadastro de Personalizações
'
'Modificado por Alexandre Gonçalves Neto em 08/07/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/cfg_utils.asp" -->
<!--#include virtual="/includes/cfg_execs.asp" -->
<%
Dim cd_usuario, nm_view, in_dt_prev, in_download, in_email, in_padrao, in_system, cd_evento, nr_dias

cd_tela = "06"
tx_erro = CStr(Request("tx_erro"))

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

If CStr(Request("in_acao")) = "editar" Then 'seleciona o registro para alteração e exibe na tela
  cd_view = Request("cd_view")
  'seleciona a personalização
  sql = "SELECT M06_CD_VIEW, M06_CD_MENU, M06_CD_SUBM, M06_CD_USUARIO, M06_NM_VIEW, M06_IN_PADRAO, " &_
		"  M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL, M06_IN_SYSTEM, M06_CD_EVENTO, M06_NR_DIAS " &_
		"FROM M06_VIEW ( NOLOCK ) " &_
		"WHERE M06_CD_VIEW = '"& cd_view &"'"
  'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, 3, 1
  
  If objrs.RecordCount < 1 Then
	tx_erro = "ATENÇÃO: Registro não encontrado, por favor verifique os dados informados."
	Response.Redirect("view_cadastro.asp?in_acao=novo&tx_erro="& Server.URLEncode(tx_erro))
  Else
	cd_view     = CStr(objrs("M06_CD_VIEW"))
	cd_menu     = CStr(objrs("M06_CD_MENU"))
	cd_subm     = CStr(objrs("M06_CD_SUBM"))
	cd_usuario  = CStr(objrs("M06_CD_USUARIO"))
	nm_view     = CStr(objrs("M06_NM_VIEW"))
	in_dt_prev  = CInt(objrs("M06_IN_DT_PREV"))
	in_padrao   = CInt(objrs("M06_IN_PADRAO"))
	in_download = CInt(objrs("M06_IN_DOWNLOAD"))
	in_email    = CInt(objrs("M06_IN_EMAIL"))
	in_system   = CInt(objrs("M06_IN_SYSTEM"))
	cd_evento   = CStr(objrs("M06_CD_EVENTO"))
	nr_dias     = CInt(objrs("M06_NR_DIAS"))
  End If
  objrs.Close
End If

If CStr(Request("in_acao")) = "alterar" Then 'efetua o uptade na tabela
  cd_menu     = CStr(Request.Form("cd_menu"))
  cd_subm     = CStr(Request.Form("cd_subm"))
  cd_usuario  = CStr(Request.Form("cd_usuario"))
  cd_view	  = CStr(Request.Form("cd_view"))
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
	  tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, a personalização não foi alterada."
	End If
  End If
End If
%>
<html>
<head>
<title>Sistema:<%= Application("nm_versao")%>- Versão:<%= Application("cd_versao")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/config.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
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
//-->
</script>
</head>
<body onLoad="fnc_FocusCampo();">
<table width="100%" border="0" cellpadding="0" cellspacing="1">
  <form action="06view_cad.asp" method="post" name="cadview" onSubmit="return fnc_ValidaForm(this);">
    <tr>
      <td height="35" class="titulo" colspan="2">&nbsp;Edição de Personaliza&ccedil;&atilde;o</td>
    </tr>
    <tr>
      <td height="30" class="label"><label for="menu">Menu:</label></td>
      <%
'seleciona o menu
sql = "SELECT M01_CD_MENU, M01_NM_MENU " &_
  	  	"FROM M01_MENU ( NOLOCK ) " &_
	  	"WHERE M01_CD_MENU = '"& cd_menu &"' " &_ 
	  	"ORDER BY M01_CD_MENU"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
	  <td class="dados"><%= objrs.Fields.Item("M01_CD_MENU").Value &" - "& objrs.Fields.Item("M01_NM_MENU").Value%>
        <input name="cd_menu" type="hidden" value="<%= cd_menu%>"></td>
		<%
objrs.Close
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
objrs.Open sql, objcnn, 3, 1
%>
	  <td class="dados"><%= objrs.Fields.Item("M02_CD_SUBM").Value &" - "& objrs.Fields.Item("M02_NM_SUBM").Value%>
        <input name="cd_subm" type="hidden" value="<%= cd_subm%>"></td>
		<%
objrs.Close
%>
    </tr>
    <tr>
      <td height="30" class="label"><label for="user">Usuário:</label></td>
      <%
'seleciona o usuário
sql = "SELECT CD_USUARIO, NM_USUARIO, CD_CARGO " &_
	  "FROM TUSUARIO ( NOLOCK ) " &_
	  "WHERE CD_USUARIO = '"& cd_usuario &"' "&_
	  "ORDER BY CD_CARGO"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1

If Trim(objrs("CD_CARGO")) = "040" Then str = "(cliente)" Else str = "(interno)"
%>
	  <td class="dados"><%= objrs.Fields.Item("CD_USUARIO").Value &" - "& objrs.Fields.Item("NM_USUARIO").Value & str%>
        <input name="cd_usuario" type="hidden" value="<%= cd_usuario%>"></td>
		<%
objrs.Close
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
objrs.Open sql, objcnn, 3, 1
'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
If Not objrs.Eof then
%>
    <tr>
      <td height="25" class="label"><label for="evento">Evento:</label></td>
      <td class="dados"><input name="cd_evento" type="text" class="editbox" id="evento" style="width: 25px;" tabindex="2" onBlur="fnc_ConsultaCodigo('evento');" value="<%= cd_evento%>" maxlength="3"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        <select name="nm_evento" class="select" style="width:195px;" onChange="fnc_InsereCodigo('evento');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
          <option selected value="">Selecione um Evento...</option>
          <%
  Do While Not objrs.Eof
    selected = ""
    If Trim(cd_evento) = objrs("M03_CD_EVENTO") Then selected = " selected"
%>
          <option value="<%= objrs("M03_CD_EVENTO")%>"<%= selected%>><%= objrs("NM_EVENTO")%></option>
          <%
    objrs.MoveNext
    If objrs.Eof Then Exit Do
  Loop
%>
        </select>
        <b>Dias:</b>
        <input name="nr_dias" type="text" class="editbox" style="width: 25px;" value="<%= nr_dias%>" maxlength="3"></td>
    </tr>
    <%
End If

objrs.Close

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
      <td class="label"><label for="padrao">Padrão:</label></td>
      <td class="dados"><input name="in_padrao" type="checkbox" id="padrao" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('padrao');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        torna a personaliza&ccedil;&atilde;o padrão</td>
    </tr>
    <%
checked = ""
If CBool(in_system) Then checked = " checked"
%>
    <tr>
      <td class="label"><label for="sistema">Sistema:</label></td>
      <td class="dados"><input name="in_system" type="checkbox" id="sistema" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('system');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
        torna a personalização de sistema</td>
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
        <input name="limpar" type="reset" class="button" value="Resetar">
        <input name="cancel" type="button" class="button" value="Fechar" onClick="javascript:window.close();"></td>
    </tr>
  </form>
</table>
</body>
</html>
<!--#include virtual="/includes/cfg_ends.asp" -->