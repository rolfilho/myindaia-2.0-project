<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Documentos
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
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim cd_docto_cad
Dim nm_docto_cad
Dim ap_docto
Dim nr_ordem
Dim in_ativo
Dim in_tipo  'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao  'ação que está ocorrendo na tabela

in_show   = True
cd_tela   = "ADM008"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "doctos_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem

Function fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
  Dim return
	
	sql = "SELECT MAX(M08_NR_ORDEM) AS VL_MAX_NR_ORDEM "&_
				"FROM M08_DOCTOS (NOLOCK) "&_
				"WHERE M08_CD_MENU = '"& cd_menu_cad &"' "&_
				"  AND M08_CD_SUBM = '"& cd_subm_cad &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly
	
	If Not fnc_TestaVar(objrs.Fields.Item("VL_MAX_NR_ORDEM").Value) Then
		return = 1
	Else
		return = objrs.Fields.Item("VL_MAX_NR_ORDEM").Value + 1
	End If
	objrs.Close
	
	fnc_UltimoNrOrdem = return
End Function

'seta variáveis para a inclusão de um novo registro
If in_acao = "novo" Then
	cd_menu_cad  = CStr(Request("cd_menu_cad"))
	cd_subm_cad  = CStr(Request("cd_subm_cad"))
	cd_docto_cad = ""
	nm_docto     = ""
	ap_docto     = ""
	nr_ordem     = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
	in_ativo     = 1
	in_tipo      = "incluir"
End If
'inclui o registro novo
If in_acao = "incluir" Then
  cd_menu_cad  = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad  = CStr(Request.Form("cd_subm_cad"))
	cd_docto_cad = CStr(Request.Form("cd_docto_cad"))
	nm_docto     = CStr(Request.Form("nm_docto"))
	ap_docto     = CStr(Request.Form("ap_docto"))
	nr_ordem     = CInt(Request.Form("nr_ordem"))
  in_ativo     = CInt(Request.Form("in_ativo"))
	in_tipo      = "incluir"
	'verifica se as variaves não estão vazias
  If cd_menu_cad = "" or cd_subm_cad = "" or nm_docto = "" or ap_docto = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(cd_menu_cad) Then tx_erro = tx_erro & "- Código do Menu;\n"
		If Not fnc_TestaVar(cd_subm_cad) Then tx_erro = tx_erro & "- Código do Sub-Menu;\n"
		If Not fnc_TestaVar(nm_docto)    Then tx_erro = tx_erro & "- Nome do Documento;\n"
		If Not fnc_TestaVar(ap_docto)    Then tx_erro = tx_erro & "- Apelido do Documento;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(nr_ordem)    Then nr_ordem = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		If Not fnc_TestaVar(in_ativo)    Then in_ativo = 1
		'cria o código do limitador
		sql = "SELECT MAX(M08_CD_DOCTO) AS CD_ULTIMO "&_
					"FROM M08_DOCTOS "&_
					"WHERE M08_CD_MENU = '"& cd_menu_cad &"' "&_
					"  AND M08_CD_SUBM = '"& cd_subm_cad &"' "
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		If Not fnc_TestaVar(objrs.Fields.Item("CD_ULTIMO").Value) Then
			'caso seja nulo, seta o código para 0001
			cd_docto_cad = cd_menu_cad&cd_subm_cad&"-D0001"
		Else
			'cria o código para o registro
			cd_docto_cad = cd_menu_cad&cd_subm_cad&"-D"&fnc_AddZeros(Mid(objrs.Fields.Item("CD_ULTIMO").Value, 7, 4) + 1, 4)
		End If
		objrs.Close
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		'monta a instrução sql de inclusão de sub-menu
		sql = "INSERT INTO M08_DOCTOS ( "&_
					"  M08_CD_DOCTO, M08_CD_MENU, M08_CD_SUBM, M08_NM_DOCTO, M08_AP_DOCTO, M08_NR_ORDEM, M08_IN_ATIVO ) "&_
					"VALUES ( "&_
					"  '"& cd_docto_cad &"', '"& cd_menu_cad &"', '"& cd_subm_cad &"', '"& nm_docto &"', '"& ap_docto &"', "&_
					"  "& nr_ordem &", "& in_ativo &" )"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'altera o numero da ordem
	  	If (nr_ordem-num) > 0 Then
	    	'numero de ordem muito maior que o ultimo, altera para um valor depois do ultimo
				sql = "UPDATE M08_DOCTOS SET "&_
			  			"  M08_NR_ORDEM = "& num &" "&_
			  			"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
	  	Elseif nr_ordem < num Then
	    	'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
				sql = "UPDATE M08_DOCTOS SET "&_
			  			"  M08_NR_ORDEM = M08_NR_ORDEM + 1 "&_
			  			"WHERE M08_CD_MENU  = '"& cd_menu_cad  &"' "&_
							"  AND M08_CD_SUBM  = '"& cd_subm_cad  &"' "&_
							"  AND M08_CD_DOCTO <>'"& cd_docto_cad &"' "&_
			  			"  AND M08_NR_ORDEM >= "& nr_ordem
	  	Else
	    	sql = Null
	  	End If
	  	'Response.Write(sql &"<br>")
	  	If fnc_TestaVar(sql) Then objcnn.Execute(sql)
			
			If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos documentos.\n"& err.Description
			
			in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - DOCUMENTO "& cd_docto_cad &"("& cd_docto_cad &") incluído com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"doctos_edt","doctos",1,1)&"&in_acao=lista&cd_docto_cad="&cd_docto_cad&"';"&_
										 "document.location='"&tx_link&"&in_acao=editar&cd_docto_cad="&cd_docto_cad&"&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
		Else
	  	tx_erro = "(CAD02):\n - DOCUMENTO "& cd_docto_cad &"("& cd_docto_cad &") não incluído."
		End If
  End If
End If
'inicia o modo de edição
If in_acao = "editar" Then
  cd_docto_cad = CStr(Request("cd_docto_cad"))
	in_tipo      = "alterar"
	
	sql = "SELECT M08_CD_DOCTO, M08_CD_MENU, M08_CD_SUBM, M08_NM_DOCTO, M08_AP_DOCTO, M08_NR_ORDEM, M08_IN_ATIVO "&_
				"FROM M08_DOCTOS (NOLOCK) " &_
				"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
	'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu_cad  = objrs.Fields.Item("M08_CD_MENU").Value
		cd_subm_cad  = objrs.Fields.Item("M08_CD_SUBM").Value
		cd_docto_cad = objrs.Fields.Item("M08_CD_DOCTO").Value
		nm_docto     = objrs.Fields.Item("M08_NM_DOCTO").Value
		ap_docto     = objrs.Fields.Item("M08_AP_DOCTO").Value
		nr_ordem     = objrs.Fields.Item("M08_NR_ORDEM").Value
		in_ativo     = objrs.Fields.Item("M08_IN_ATIVO").Value
	Else
		tx_erro = "(CAD03):\n DOCUMENTO "& cd_docto_cad &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_docto_cad=&tx_erro="& Server.URLEncode(tx_erro))
  End If
  objrs.Close
End If
'altera os dados do menu selecionado
If in_acao = "alterar" Then
	cd_menu_cad  = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad  = CStr(Request.Form("cd_subm_cad"))
	cd_docto_cad = CStr(Request.Form("cd_docto_cad"))
	nm_docto     = CStr(Request.Form("nm_docto"))
	ap_docto     = CStr(Request.Form("ap_docto"))
	nr_ordem     = CInt(Request.Form("nr_ordem"))
  in_ativo     = CInt(Request.Form("in_ativo"))
	in_tipo      = "alterar"
	'verifica se as variaves não estão vazias
  If cd_docto_cad = "" or nm_docto = "" or ap_docto = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(cd_docto_cad) Then tx_erro = tx_erro & "- Código do Documento;\n"
		If Not fnc_TestaVar(nm_docto)     Then tx_erro = tx_erro & "- Nome do Documento;\n"
		If Not fnc_TestaVar(ap_docto)     Then tx_erro = tx_erro & "- Apelido do Documento;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(nr_ordem) Then nr_ordem = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		If Not fnc_TestaVar(in_ativo) Then in_ativo = 1
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		'monta a instrução sql de inclusão de sub-menu
		sql = "UPDATE M08_DOCTOS SET "&_
					"  M08_NM_DOCTO = '"& nm_docto &"', "&_
					"  M08_AP_DOCTO = '"& ap_docto &"', "&_
					"  M08_NR_ORDEM =  "& nr_ordem &", "&_
					"  M08_IN_ATIVO =  "& in_ativo &"  "&_
					"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'altera o numero da ordem
	  	If (nr_ordem-num) > 0 Then
	    	'numero de ordem muito maior que o ultimo, altera para um valor depois do ultimo
				sql = "UPDATE M08_DOCTOS SET "&_
			  			"  M08_NR_ORDEM = "& num &" "&_
			  			"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
	  	Elseif nr_ordem < num Then
	    	'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
				sql = "UPDATE M08_DOCTOS SET "&_
			  			"  M08_NR_ORDEM = M08_NR_ORDEM + 1 "&_
			  			"WHERE M08_CD_MENU  = '"& cd_menu_cad  &"' "&_
							"  AND M08_CD_SUBM  = '"& cd_subm_cad  &"' "&_
							"  AND M08_CD_DOCTO <>'"& cd_docto_cad &"' "&_
			  			"  AND M08_NR_ORDEM >= "& nr_ordem
	  	Else
	    	sql = Null
	  	End If
	  	'Response.Write(sql &"<br>")
	  	If fnc_TestaVar(sql) Then objcnn.Execute(sql)
			
			If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos documentos.\n"& err.Description
			
			tx_erro = "(CAD12):\n - DOCUMENTO "& cd_docto_cad &"("& cd_docto_cad &") alterado com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"doctos_edt","doctos",1,1)&"&in_acao=lista&cd_docto_cad="&cd_docto_cad&"'</script>")
		Else
	  	tx_erro = "(CAD04):\n - DOCUMENTO "& cd_docto_cad &"("& cd_docto_cad &") não alterado."
		End If
  End If
End If
'exclusão de sub-menu
If in_acao = "excluir" Then
	cd_docto_cad = CStr(Request.Form("cd_docto_cad"))
	If Not fnc_TestaVar(cd_docto_cad) Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		'seleciona o numero de ordem antes da exclusão
		sql = "SELECT M08_NR_ORDEM " &_
					"FROM M08_CD_DOCTOS ( NOLOCK ) " &_
					"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
		objrs.Open sql, objcnn, 3, 1
		nr_ordem = objrs.Fields.Item("M08_NR_ORDEM").Value - 1
		'exclui o registro selecionado
		sql = "DELETE FROM M08_CD_DOCTOS " &_
					"WHERE M08_CD_DOCTO = '"& cd_docto_cad &"'"
		objcnn.Execute(sql)
		'atualiza a ordem dos sub-menus
		If Err.Number = 0 Then
			sql = "UPDATE M08_CD_DOCTOS " &_
						"   SET M08_NR_ORDEM = M08_NR_ORDEM - 1 " &_
						" WHERE M08_CD_MENU  = '"& cd_menu_cad &"' " &_
						"   AND M08_CD_SUBM  = '"& cd_subm_cad &"' " &_
						"   AND M08_NR_ORDEM >  "& nr_ordem
			'Response.Write(sql &"<br>")
			objcnn.Execute(sql)
			
			tx_erro = "CAD(13):\n - Código: " & cd_subm_cad &"."
			'redireciona para a página de cadastro
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"doctos_edt","doctos",1,1)&"&in_acao=lista&cd_docto_cad='</script>")
			Response.Redirect(tx_link &"&in_acao=novo&cd_docto_cad=&tx_erro="& Server.URLEncode(tx_erro))
		Else
			tx_erro = "CAD(07):\n -"
			Response.Redirect(tx_link &"&in_acao=editar&cd_docto_cad="&cd_docto_cad&"&tx_erro="& Server.URLEncode(tx_erro))
		End If
		objrs.Close
  End If
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divEdicao {
	position: absolute;
	top: 30px;
	left: 0px;
	width: 100%;
	height: 100%;
	z-index: 1;
	overflow: auto;
}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function fnc_FocusCampo() {
	with (document.frmCadastroDoctos) {
		if (cd_menu_cad.value == '') {
			cd_menu_cad.select();
			cd_menu_cad.focus();
		} else if (cd_subm_cad.value  == '') {
			cd_menu_cad.select();
			cd_subm_cad.focus();
		} else { 
			nm_docto.select();
			nm_docto.focus();
		}
	}
}

function fnc_ConsultaCodigo(campo) {
	with (document.frmCadastroDoctos) {
		if (campo == 'menu') {
			var codigo = cd_menu_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_menu_cad.value = codigo;
				nm_menu_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_docto_cad=&cd_menu_cad="+codigo+"'");
			} else {
				cd_menu_cad.value = '';
				nm_menu_cad.value = '';
			}
		}
		if (campo == 'subm') {
			var codigo = cd_subm_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_subm_cad.value = codigo;
				nm_subm_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_docto_cad=&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+codigo+"'");
			} else {
				cd_subm_cad.value = '';
				nm_subm_cad.value = '';
			}
		}
	}  //encerra o with
}  //encerra a function

function fnc_InsereCodigo(campo) {
	with (document.frmCadastroDoctos) {
		if (campo == 'menu') {
			cd_menu_cad.value = nm_menu_cad.options[nm_menu_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_docto_cad=&cd_menu_cad="+cd_menu_cad.value+"'");
		}
		if (campo == 'subm') {
			cd_subm_cad.value = nm_subm_cad.options[nm_subm_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_docto_cad=&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+cd_subm_cad.value+"'");
		}
	}
}

function fnc_ValidaForm(form) {
  var valida = true;
  //VALIDA O MENU
  if (form.cd_menu_cad.value == '') {
    eval('form.cd_menu_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- Código do MENU não especificao!');
		eval('form.cd_menu_cad.style.background="white"');
		valida = false;
  } else {
    if (form.cd_menu_cad.value != form.nm_menu_cad.value) {
      eval('form.cd_menu_cad.style.background="red"');
	  	alert('ATENÇÃO:\n\n- Código do MENU inválido!');
	  	eval('form.cd_menu_cad.style.background="white"');
	  	valida = false;
		}
  }
	//VALIDA O SUB-MENU
  if (form.cd_subm_cad.value == '') {
    eval('form.cd_subm_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- Código do SUB-MENU não especificao!');
		eval('form.cd_subm_cad.style.background="white"');
		valida = false;
  } else {
    if (form.cd_subm_cad.value != form.nm_subm_cad.value) {
      eval('form.cd_subm_cad.style.background="red"');
	  	alert('ATENÇÃO:\n\n- Código do SUB-MENU inválido!');
	  	eval('form.cd_subm_cad.style.background="white"');
	  	valida = false;
		}
  }
	//VALIDA O NOME DO SUB-MENU
  if (form.nm_docto.value == '') {
    eval('form.nm_docto.style.background="red"');
		alert('ATENÇÃO:\n\n- NOME DO DOCUMENTO não especificao!');
		eval('form.nm_docto.style.background="white"');
		valida = false;
  }
  //VALIDA O APELIDO DO SUB-MENU
  if (form.ap_docto.value == '') {
    eval('form.ap_docto.style.background="red"');
		alert('ATENÇÃO:\n\n- APELIDO DO DOCUMENTO não especificao!');
		eval('form.ap_docto.style.background="white"');
		valida = false;
  }
  return valida
}
//-->
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroDoctos" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td height="30" class="admtitulo">&nbsp;Edição de Documentos</td>
		</tr>
		<tr>
			<td valign="top"><div id="Edicao" class="divEdicao">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr height="30">
							<td class="admlabel"><label for="menu">Menu:</label></td>
							<%
If in_acao = "novo" or in_acao = "incluir" Then
%>
							<td class="admdados"><input name="cd_menu_cad" id="menu" type="text" class="editbox" style="width:50px;" maxlength="2" tabindex="0" value="<%= cd_menu_cad%>" onBlur="fnc_ConsultaCodigo('menu');">
								<select name="nm_menu_cad" class="select" style="width: 250px;" onChange="fnc_InsereCodigo('menu');">
									<option selected value="">Selecione um Menu...</option>
									<%
  'seleciona todos os menus ativos
  sql = "SELECT M01_CD_MENU, M01_NM_MENU FROM M01_MENU (NOLOCK) WHERE M01_IN_ATIVO = 1 ORDER BY M01_CD_MENU"
  objrs.Open sql, objcnn, 3, 1
  'preenche os valores do select
  Do While Not objrs.Eof
  	selected = ""
  	If cd_menu_cad = objrs("M01_CD_MENU") Then selected = " selected"
%>
									<option value="<%= objrs("M01_CD_MENU")%>"<%= selected%>><%= objrs("M01_NM_MENU")%></option>
									<%
  	objrs.MoveNext
  Loop
  objrs.Close
%>
								</select></td>
							<%
Else
  'seleciona o menu do sub-menu
  sql = "SELECT M01_CD_MENU, M01_NM_MENU FROM M01_MENU ( NOLOCK ) WHERE M01_CD_MENU = '"& cd_menu &"'"
  objrs.Open sql, objcnn, 3, 1
%>
							<td class="admdados"><%= objrs.Fields.Item("M01_CD_MENU").Value &" - "& objrs.Fields.Item("M01_NM_MENU").Value%>
								<input name="cd_menu_cad" type="hidden" value="<%= cd_menu_cad%>">
								<input name="nm_menu_cad" type="hidden" value="<%= cd_menu_cad%>"></td>
							<%
  objrs.Close
End If
%>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="subm">Sub-Menu:</label></td>
							<%
If in_acao = "novo" or in_acao = "incluir" Then
%>
							<td class="admdados"><input name="cd_subm_cad" id="subm" type="text" class="editbox" style="width:50px;" maxlength="2" tabindex="1" value="<%= cd_subm_cad%>" onBlur="fnc_ConsultaCodigo('subm');"<% If Not fnc_TestaVar(cd_menu_cad) Then Response.Write(" disabled")%>>
								<select name="nm_subm_cad" class="select" style="width: 250px;" onChange="fnc_InsereCodigo('subm');"<% If Not fnc_TestaVar(cd_menu_cad) Then Response.Write(" disabled")%>>
									<option selected value="">Selecione um Sub-Menu...</option>
									<%
  'seleciona os sub menus
  sql = "SELECT M02_CD_MENU, M02_CD_SUBM, M02_NM_SUBM " &_
				"FROM M02_SUBM ( NOLOCK ) " &_
				"WHERE M02_CD_MENU = '"& cd_menu_cad &"' "&_
				"ORDER BY M02_CD_SUBM"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  'preenche os valores do select
  Do While Not objrs.Eof
  	selected = ""
  	If cd_menu_cad&cd_subm_cad = objrs.Fields.Item("M02_CD_MENU").Value&objrs.Fields.Item("M02_CD_SUBM").Value Then selected = " selected"
%>
									<option value="<%= objrs.Fields.Item("M02_CD_SUBM").Value%>"<%= selected%>><%= objrs.Fields.Item("M02_NM_SUBM").Value%></option>
									<%
  	objrs.MoveNext
  Loop
  objrs.Close
%>
								</select></td>
							<%
Else
  'seleciona o menu do sub-menu
  sql = "SELECT M02_CD_SUBM, M02_NM_SUBM " &_
				"FROM M02_SUBM ( NOLOCK ) " &_
				"WHERE M02_CD_MENU = '"& cd_menu_cad &"' "&_
				"  AND M02_CD_SUBM = '"& cd_subm_cad &"' "
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
							<td class="admdados"><%= objrs.Fields.Item("M02_CD_SUBM").Value &" - "& objrs.Fields.Item("M02_NM_SUBM").Value%>
								<input name="cd_subm_cad" type="hidden" value="<%= cd_subm_cad%>">
								<input name="nm_subm_cad" type="hidden" value="<%= cd_subm_cad%>"></td>
							<%
  objrs.Close
End If
%>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><%
If Not fnc_TestaVar(cd_docto_cad) Then
%>
								Novo Registro
								<input name="cd_docto_cad" type="hidden" value="<%= cd_docto_cad%>">
								<%
Else
%>
								<input name="cd_docto_cad" type="text" disabled class="editbox" id="codigo" style="width:50px; background-color: #CCCCCC;" tabindex="0" value="<%= Mid(cd_docto_cad, 6, 5)%>" maxlength="3">
								<input name="cd_docto_cad" type="hidden" value="<%= cd_docto_cad%>">
								<%
End If
%>
							</td>
						</tr>
						<tr>
							<td class="admlabel"><label for="nome">Nome:</label></td>
							<td class="admdados"><input name="nm_docto" type="text" class="editbox" id="nome" style="width:300px;" maxlength="50" value="<%= nm_docto%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="apelido">Apelido:</label></td>
							<td class="admdados"><input name="ap_docto" type="text" class="editbox" id="nome" style="width:300px;" maxlength="10" value="<%= ap_docto%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="ordem">Ordem:</label></td>
							<td class="admdados"><input name="nr_ordem" type="text" class="editbox" id="ordem" style="width:50px;" maxlength="3" value="<%= nr_ordem%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>>
								&ordm;</td>
						</tr>
						<tr>
							<td class="admlabel">Ativo:</td>
							<td class="admdados"><input name="in_ativo" type="radio" class="radio" id="sim" value="1"<% If in_ativo = 1 or in_ativo = True Then Response.Write(" checked")%><% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>>
								<label for="sim">Sim</label>
								<input name="in_ativo" type="radio" class="radio" id="nao" value="0"<% If in_ativo = 0 or in_ativo = False Then Response.Write(" checked")%><% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>>
								<label for="nao">N&atilde;o</label></td>
						</tr>
					</table>
				</div></td>
		</tr>
		<tr bgcolor="#DDDDDD" height="30">
			<td align="center"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
				<input name="enviar" type="submit" class="admbutton" value="Salvar"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>>
				<input name="limpar" type="reset" class="admbutton" value="Cancelar">
				<input name="cancel" type="button" class="admbutton" value="Fechar" onClick="javascript:window.close();"></td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->