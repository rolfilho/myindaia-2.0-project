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
Dim in_tipo 	 'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao 	 'ação que está ocorrendo no cadastro
Dim cd_usuario, nm_view, in_dt_prev, in_download, in_email, in_padrao, in_system, cd_evento, nr_dias

cd_tela = "06"
in_acao = CStr(Request("in_acao"))
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

If in_acao = "novo" Then
  cd_menu     = CStr(Request.QueryString("cd_menu"))
  cd_subm     = CStr(Request.QueryString("cd_subm"))
  cd_usuario  = ""
  nm_view     = ""
  in_dt_prev  = 0
  in_padrao   = 0
  in_download = 0
  in_email    = 0
  in_system   = 0
  cd_evento   = ""
  nr_dias     = ""
  in_tipo     = "incluir"
End If

If in_acao = "incluir" Then
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
  
  If cd_menu = "" or cd_subm = "" or cd_usuario = "" or cd_view = "" or nm_view = "" Then
	tx_erro = "ATENÇÃO: ocorreram os seguintes erros:\n"
	If cd_menu    = "" Then tx_erro = tx_erro &"- Código do menu não definido;\n"
	If cd_subm    = "" Then tx_erro = tx_erro &"- Código do sub-menu não definido;\n"
	If cd_usuario = "" Then tx_erro = tx_erro &"- Código do usuário não definido;\n"
	If cd_view    = "" Then tx_erro = tx_erro &"- Código da view não foi criado;\n"
	If nm_view    = "" Then tx_erro = tx_erro &"- Nome da view não preenchido;\n"
  Else
  	'seleciona o último código de filtro e número de ordem
	sql = "SELECT MAX(M06_CD_VIEW) AS ULTIMO " &_
		  "FROM M06_VIEW ( NOLOCK ) " &_
		  "WHERE M06_CD_MENU    = '"& cd_menu &"' " &_
		  "  AND M06_CD_SUBM    = '"& cd_subm &"' " &_
		  "  AND M06_CD_USUARIO = '"& cd_usuario &"'"
	'Response.Write(sql &"<br>")
	objrs.Open sql, objcnn, 3, 1
	'cria o código para o registro
	If IsNull(objrs("ULTIMO")) Then
	  cd_view   = cd_view &"01"
	  in_padrao = "1"
	Else
	  cd_view = cd_view & fnc_AddZeros(Right(objrs("ULTIMO"), 2) + 1, 2)
	End If
	objrs.Close
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
	
	sql = "INSERT INTO M06_VIEW ( " &_
		  "  M06_CD_VIEW, M06_CD_MENU, M06_CD_SUBM, M06_CD_USUARIO, M06_NM_VIEW, M06_IN_DT_PREV, " &_
		  "	 M06_IN_PADRAO, M06_IN_DOWNLOAD, M06_IN_EMAIL, M06_IN_SYSTEM, M06_CD_EVENTO, M06_NR_DIAS " &_
		  ") " &_
		  "VALUES ('"& cd_view     &"', " &_
				  "'"& cd_menu     &"', " &_
				  "'"& cd_subm     &"', " &_
				  "'"& cd_usuario  &"', " &_
				  "'"& nm_view     &"', " &_
				  "'"& in_dt_prev  &"', " &_
				  "'"& in_padrao   &"', " &_
				  "'"& in_download &"', " &_
				  "'"& in_email    &"', " &_
				  "'"& in_system   &"', " &_
				  "'"& cd_evento   &"', " &_
				  "'"& nr_dias     &"')"
	'Response.Write(sql &"<br>")
	objcnn.Execute(sql)
	If Err.Number = 0 Then
	  in_tipo = "alterar"
	  tx_erro = "Personalização incluída com sucesso!"
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
	  'seleciona o numero da página onde o registro irá aparecer.
	  sql = "SELECT"
	  'Response.Write(sql &"<br>")
	  objrs.Open sql, objcnn, 3, 1
	  
	  Response.Redirect("06view_nav.asp?in_acao=editar&cd_view="& cd_view &"c&=M06_CD_VIEW&o=ASC&p="& pagina)
	Else
	  in_tipo = "incluir"
	  tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, Personalização não incluída."
	End If
  End If
End If

If in_acao = "editar" Then 'seleciona o registro para alteração e exibe na tela
  cd_view = Request("cd_view")
  in_tipo = "alterar"
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
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/includes/config.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function fnc_FocusCampo() {
  with (document.cadview) {
    if (cd_menu.value == '') cd_menu.focus()
	else if (cd_subm.value    == '') cd_subm.focus()
	else if (cd_usuario.value == '') cd_usuario.focus()
	else nm_view.focus();
  }
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
	if (campo == 'menu') {
	  var codigo = cd_menu.value;
	  if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
	    for (i = codigo.length; i < 2; i++)
	      codigo = '0'+ String(codigo);
		cd_menu.value = codigo;
	    nm_menu.value = codigo;
	    eval("self.location = '<%= script%>?in_acao=novo&cd_menu="+codigo+"'");
      }
	  else {
	    cd_menu.value = '';
	    nm_menu.value = '';
	  }
    }
    if (campo == 'subm') {
	  var codigo = cd_subm.value;
	  if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
	    for (i = codigo.length; i < 2; i++)
	      codigo = '0'+ String(codigo);
		cd_subm.value = codigo;
	    nm_subm.value = codigo;
	    eval("self.location = '<%= script%>?in_acao=novo&cd_menu=<%= cd_menu%>&cd_subm="+codigo+"'");
      }
	  else {
	    cd_subm.value = '';
	    nm_subm.value = '';
	  }
    }
	if (campo == 'usuario') {
	  var codigo = cd_usuario.value;
	  if (codigo.length > 0 && codigo.length <= 4 && codigo != 0) {
	    for (i = codigo.length; i < 4; i++)
	      codigo = '0'+ String(codigo);
		cd_usuario.value = codigo;
	    nm_usuario.value = codigo;
      }
	  else {
	    cd_usuario.value = '';
	    nm_usuario.value = '';
	  }
    }
	if (campo == 'evento') {
	  var codigo = cd_evento.value;
	  if (codigo.length > 0 && codigo.length <= 3 && codigo != 0) {
	    for (i = codigo.length; i < 3; i++)
	      codigo = '0'+ String(codigo);
		cd_evento.value = codigo;
	    nm_evento.value = codigo;
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
    if (campo == 'menu') {
	  cd_menu.value = nm_menu.options[nm_menu.selectedIndex].value;
	  eval("self.location = '<%= script%>?in_acao=novo&cd_menu="+cd_menu.value+"'");
    }
    if (campo == 'subm') {
	  cd_subm.value = nm_subm.options[nm_subm.selectedIndex].value;
	  eval("self.location = '<%= script%>?in_acao=novo&cd_menu=<%= cd_menu%>&cd_subm="+cd_subm.value+"'");
    }
	if (campo == 'usuario') {
	  cd_usuario.value = nm_usuario.options[nm_usuario.selectedIndex].value;
	  nm_view.selected;
	  nm_view.focused;
    }
	if (campo == 'evento') {
	  cd_evento.value = nm_evento.options[nm_evento.selectedIndex].value;
	  nr_dias.selected;
	  nr_dias.focused;
    }
  }
}

function fnc_ValidaForm(form) {
  var valida = true;

  //VALIDA O MENU
  if (form.cd_menu.value == '' || form.cd_menu.value == '00') {
    eval('form.cd_menu.style.background="red"');
	alert('ATENÇÃO: Código do MENU não especificao!');
	eval('form.cd_menu.style.background="white"');
	valida = false;
  } else {
    if (form.cd_menu.value != form.nm_menu.value) {
      eval('form.cd_menu.style.background="red"');
	  alert('ATENÇÃO: Código do MENU inválido!');
	  eval('form.cd_menu.style.background="white"');
	  valida = false;
	}
  }
  //VALIDA O SUB-MENU
  if (form.cd_subm.value == '' || form.cd_subm.value == '00') {
    eval('form.cd_subm.style.background="red"');
	alert('ATENÇÃO: Código do SUB-MENU não especificao!');
	eval('form.cd_subm.style.background="white"');
	valida = false;
  } else {
    if (form.cd_subm.value != form.nm_subm.value) {
      eval('form.cd_subm.style.background="red"');
	  alert('ATENÇÃO: Código do SUB-MENU inválido!');
	  eval('form.cd_subm.style.background="white"');
	  valida = false;
	}
  }
  //VALIDA O USUÁRIO
  if (form.cd_usuario.value == '' || form.cd_usuario.value == '0000') {
    eval('form.cd_usuario.style.background="red"');
	alert('ATENÇÃO: Código do USUÁRIO não especificao!');
	eval('form.cd_usuario.style.background="white"');
	valida = false;
  } else {
    if (form.cd_usuario.value != form.nm_usuario.value) {
      eval('form.cd_usuario.style.background="red"');
	  alert('ATENÇÃO: Código do USUÁRIO inválido!');
	  eval('form.cd_usuario.style.background="white"');
	  valida = false;
	}
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
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="75"><!--#include file="../../config/idx_top.asp" --></td>
  </tr>
  <tr>
    <td height="45" class="titulo">&nbsp;&nbsp;&nbsp;Cadastro de Personaliza&ccedil;&otilde;es</td>
  </tr>
  <tr>
    <td valign="top"><table width="500" border="0" align="center" cellpadding="0" cellspacing="1">
        <form action="06view_cad.asp" method="post" name="cadview" onSubmit="return fnc_ValidaForm(this);">
          <tr>
            <td height="30" class="label"><label for="menu">Menu:</label></td>
            <td class="dados"><input name="cd_menu" type="text" class="editbox" id="menu" style="width: 35px;" tabindex="0" onBlur="fnc_ConsultaCodigo('menu');" value="<%= cd_menu%>" maxlength="2"<%If in_tipo = "alterar" Then Response.Write(" readonly='true'")%>>
              <select name="nm_menu" class="select" style="width: 300px;" onChange="fnc_InsereCodigo('menu');"<%If in_tipo = "alterar" Then Response.Write(" disabled")%>>
                <option selected value="">Selecione um Menu...</option>
                <%
'seleciona todas as areas
sql = "SELECT M01_CD_MENU, M01_NM_MENU " &_
  	  	"FROM M01_MENU ( NOLOCK ) " &_
	  	"WHERE M01_CD_MENU IN ( SELECT M02_CD_MENU FROM M02_SUBM ( NOLOCK ) ) " &_ 
	  	"ORDER BY M01_CD_MENU"
objrs.Open sql, objcnn, 3, 1
'preenche os valores do select
Do While Not objrs.Eof
  selected = ""
  If cd_menu = objrs("M01_CD_MENU") Then selected = " selected"
%>
                <option value="<%= objrs("M01_CD_MENU")%>"<%= selected%>><%= objrs("M01_NM_MENU")%></option>
                <%
  objrs.MoveNext
Loop
objrs.Close
%>
            </select></td>
          </tr>
          <tr>
            <td height="30" class="label"><label for="subm">Sub-Menu:</label></td>
            <td class="dados"><input name="cd_subm" type="text" class="editbox" id="subm" style="width: 35px;" tabindex="1" onBlur="fnc_ConsultaCodigo('subm');" value="<%= cd_subm%>" maxlength="2"<% If Not fnc_TestaVar(cd_menu) Then Response.Write(" disabled")%><%If in_tipo = "alterar" Then Response.Write(" readonly='true'")%>>
              <select name="nm_subm" class="select" style="width: 300px;" onChange="fnc_InsereCodigo('subm');"<% If Not fnc_TestaVar(cd_menu) Then Response.Write(" disabled")%><%If in_tipo = "alterar" Then Response.Write(" disabled")%>>
                <option selected value="">Selecione um Sub-Menu...</option>
                <%
'seleciona os sub menus
sql = "SELECT M02_CD_MENU, M02_CD_SUBM, M02_NM_SUBM " &_
	  	"FROM M02_SUBM ( NOLOCK ) " &_
	  	"WHERE M02_CD_MENU = '"& cd_menu &"' "&_
		"ORDER BY M02_CD_SUBM"
objrs.Open sql, objcnn, 3, 1
'preenche os valores do select
Do While Not objrs.Eof
  selected = ""
  If cd_menu = objrs("M02_CD_MENU") and cd_subm = objrs("M02_CD_SUBM") Then selected = " selected"
%>
                <option value="<%= objrs("M02_CD_SUBM")%>"<%= selected%>><%= objrs("M02_NM_SUBM")%></option>
                <%
  objrs.MoveNext
Loop
objrs.Close
%>
              </select></td>
          </tr>
          <tr height="30">
            <td height="30" class="label"><label for="user">Usuário:</label></td>
            <td class="dados"><input name="cd_usuario" type="text" class="editbox" id="user" style="width: 35px;" onBlur="fnc_ConsultaCodigo('usuario');" value="<%= cd_usuario%>" maxlength="4"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%><%If in_tipo = "alterar" Then Response.Write(" readonly='true'")%>>
              <select name="nm_usuario" class="select" style="width: 300px;" onChange="fnc_InsereCodigo('usuario');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%><%If in_tipo = "alterar" Then Response.Write(" disabled")%>>
                <option selected>Selecione um Usuário...</option>
                <%
'seleciona todos os usuários do sistema
sql = "SELECT CD_USUARIO, NM_USUARIO, CD_CARGO " &_
	  "FROM TUSUARIO ( NOLOCK ) " &_
	  "ORDER BY CD_CARGO"
'Response.Write(sql&"<br>")
objrs.Open sql, objcnn, 3, 1

Do While Not objrs.Eof
  If Trim(objrs("CD_CARGO")) = "040" Then str = "(cliente)" Else str = "(interno)"
  If Trim(cd_usuario) = objrs("CD_USUARIO") Then selected = " selected"
%>
                <option value="<%= objrs("CD_USUARIO")%>"<%= selected%>><%= objrs("NM_USUARIO") & str%></option>
                <%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop

objrs.Close
%>
              </select></td>
          </tr>
          <% 
'seleciona todos os eventos referentes a sub-&aacute;rea
sql = "SELECT M03_CD_EVENTO, NM_EVENTO " &_
	  "FROM M03_EVENTO ( NOLOCK ) " &_
	  "  INNER JOIN TEVENTO ( NOLOCK ) ON CD_EVENTO = M03_CD_EVENTO " &_
	  "WHERE M03_CD_MENU = '"& cd_menu &"' " &_
	  "  AND M03_CD_SUBM = '"& cd_subm &"'"
'Response.Write(sql)
objrs.Open sql, objcnn, 3, 1
'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
If Not objrs.Eof then
%>
          <tr>
            <td height="30" class="label"><label for="evento">Evento:</label></td>
			<td class="dados"><input name="cd_evento" type="text" class="editbox" id="evento" style="width: 35px;" tabindex="2" onBlur="fnc_ConsultaCodigo('evento');" value="<%= cd_evento%>" maxlength="3"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
			  <select name="nm_evento" class="select" style="width: 250px;" onChange="fnc_InsereCodigo('evento');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
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
%>
          <tr>
            <td height="30" class="label"><label for="codigo">C&oacute;digo:</label></td>
            <td class="dados"><%
If cd_view = "" Then
%>
              Novo Registro
              <input name="cd_view" type="hidden" value="<%= cd_view%>">
              <%
Else
%>
              <input name="cd_view" type="text" disabled class="editbox" id="codigo" style="width: 100px;" value="<%= cd_view%>" maxlength="12">
              <%
End If
%>
            </td>
          </tr>
		  <tr>
            <td height="30" class="label"><label for="nome">Nome:</label></td>
            <td class="dados"><input name="nm_view" type="text" class="editbox" id="nome" style="width: 350px;" value="<%= nm_view%>" maxlength="50"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>></td>
          </tr>
          <%
If in_tipo <> "incluir" Then
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
            <td class="dados"><iframe src="07view_campo_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&in_acao=" name="frm_campo" frameborder="1" height="108" width="100%" scrolling="yes"></iframe></td>
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
            <td class="dados"><iframe src="08view_filtro_lst.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&in_acao=" name="frm_filtro" frameborder="1" height="108" width="100%" scrolling="yes"></iframe></td>
          </tr>
          <%
  End If
  objrsx.Close
End If

checked = ""
If CBool(in_dt_prev) Then checked = " checked"
%>
          <tr>
            <td height="30" class="label"><label for="prevista">Dt. Prevista:</label></td>
            <td class="dados"><input name="in_dt_prev" type="checkbox" id="prevista" value="1"<%= checked%> class="radio"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
              visualiza datas previstas</td>
          </tr>
          <%
checked = ""
If CBool(in_padrao) Then checked = " checked"
%>
          <tr>
            <td height="30" class="label"><label for="padrao">Padrão:</label></td>
            <td class="dados"><input name="in_padrao" type="checkbox" id="padrao" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('padrao');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
              torna a personaliza&ccedil;&atilde;o padrão</td>
          </tr>
          <%
checked = ""
If CBool(in_system) Then checked = " checked"
%>
          <tr>
            <td height="30" class="label"><label for="sistema">Sistema:</label></td>
            <td class="dados"><input name="in_system" type="checkbox" id="sistema" value="1"<%= checked%> class="radio" onClick="fnc_MudaCheck('system');"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
              torna a personalização de sistema</td>
          </tr>
          <%
checked = ""
If CBool(in_download) Then checked = " checked"
%>
          <tr>
            <td height="30" class="label"><label for="download">Download:</label></td>
            <td class="dados"><input name="in_download" type="checkbox" id="download" value="1"<%= checked%> class="radio"<% If Not fnc_TestaVar(cd_menu) or Not fnc_TestaVar(cd_subm) Then Response.Write(" disabled")%>>
              ativa download dos resultados (xls) </td>
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
            <td width="25%" height="35">&nbsp;</td>
            <td width="75%" style="padding: 6px;"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
              <input name="enviar" type="submit" class="button" value="Salvar" tabindex="10">
              <input name="limpar" type="reset" class="button" value="Resetar">
              <input name="cancel" type="button" class="button" value="Cancelar" onClick="javascript:history.back();"></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/cfg_ends.asp" -->
