<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Filtros
'
'Autor Alexandre Gonçalves Neto
'Criado: 13/10/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim cd_dado
Dim cd_filtro
Dim tp_exibir
Dim tp_grupo
Dim tx_from
Dim tx_where
Dim nr_ordem
Dim in_ativo
Dim in_check
Dim in_obrigado
Dim in_tipo  'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao  'ação que está ocorrendo na tabela

in_show   = True
cd_tela   = "ADM010"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "filtros_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem

Function fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
  Dim return
	
	sql = "SELECT MAX(M11_NR_ORDEM) AS VL_MAX_NR_ORDEM "&_
				"FROM M11_FILTRO (NOLOCK) "&_
				"WHERE M11_CD_MENU = '"& cd_menu_cad &"' "&_
				"  AND M11_CD_SUBM = '"& cd_subm_cad &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly
	
	If objrs.Fields.Item("VL_MAX_NR_ORDEM").Value = 0 Then
		return = 1
	Else
		return = objrs.Fields.Item("VL_MAX_NR_ORDEM").Value + 1
	End If
	objrs.Close
	
	fnc_UltimoNrOrdem = return
End Function

'seta variáveis para a inclusão de um novo registro
If in_acao = "novo" Then
	cd_menu_cad = CStr(Request("cd_menu_cad"))
	cd_subm_cad = CStr(Request("cd_subm_cad"))
	cd_dado     = CStr(Request("cd_dado"))
	cd_filtro   = ""
	tp_exibir   = 2
	tp_grupo    = 0
	tx_from     = ""
	tx_where    = ""
	nr_ordem    = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
	in_ativo    = 1
	in_check    = 0
	in_obrigado = 0
	in_tipo     = "incluir"
End If
'inclui o registro novo
If in_acao = "incluir" Then
  cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad = CStr(Request.Form("cd_subm_cad"))
	cd_dado     = CStr(Request.Form("cd_dado"))
	cd_filtro   = CStr(Request.Form("cd_filtro"))
	tp_exibir   = CInt(Request.Form("tp_exibir"))
	tp_grupo    = CInt(Request.Form("tp_grupo"))
	tx_from     = CStr(Request.Form("tx_from"))
	tx_where    = CStr(Request.Form("tx_where"))
	nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
	in_check    = CInt(Request.Form("in_check"))
	in_obrigado = CInt(Request.Form("in_obrigado"))
	in_tipo     = "incluir"
	'verifica se as variaves não estão vazias
  If cd_menu_cad = "" or cd_subm_cad = "" or cd_dado = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(cd_menu_cad) Then tx_erro = tx_erro & "- Código do Menu;\n"
		If Not fnc_TestaVar(cd_subm_cad) Then tx_erro = tx_erro & "- Código do Sub-Menu;\n"
		If Not fnc_TestaVar(cd_dado)     Then tx_erro = tx_erro & "- Código do Dado;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(cd_filtro)   Then cd_filtro   = cd_menu_cad&cd_subm_cad&"-F"&cd_dado
		If Not fnc_TestaVar(tp_exibir)   Then tp_exibir   = 2
		If Not fnc_TestaVar(tp_grupo)    Then tp_grupo    = 0
		If Not fnc_TestaVar(nr_ordem)    Then nr_ordem    = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		If Not fnc_TestaVar(in_check)    Then in_check    = 0
		If Not fnc_TestaVar(in_obrigado) Then in_obrigado = 0
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		'monta a instrução sql de inclusão de sub-menu
		sql = "INSERT INTO M11_FILTRO ( "&_
					"  M11_CD_FILTRO, M11_CD_MENU, M11_CD_SUBM, M11_CD_DADO, M11_TP_EXIBIR, M11_TP_GRUPO, "&_
					"  M11_TX_FROM, M11_TX_WHERE, M11_NR_ORDEM, M11_IN_ATIVO, M11_IN_CHECK, M11_IN_OBRIGADO ) "&_
					"VALUES ( "&_
					"  '"& cd_filtro &"', '"& cd_menu_cad &"', '"& cd_subm_cad &"', '"& cd_dado &"', "& tp_exibir &", "& tp_grupo &", "&_
					"  '"& tx_from &"', '"& tx_where &"', "& nr_ordem &", "& in_ativo &", "& in_check &", "& in_obrigado &" )"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'altera o numero da ordem
	  	If (nr_ordem-num) > 0 Then
	    	'numero de ordem muito maior que o ultimo, altera para um valor depois do ultimo
				sql = "UPDATE M11_FILTRO SET "&_
			  			"  M11_NR_ORDEM = "& num &" "&_
			  			"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
	  	Elseif nr_ordem < num Then
	    	'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
				sql = "UPDATE M11_FILTRO SET "&_
			  			"  M11_NR_ORDEM = M11_NR_ORDEM + 1 "&_
			  			"WHERE M11_CD_MENU   = '"& cd_menu_cad &"' "&_
							"  AND M11_CD_SUBM   = '"& cd_subm_cad &"' "&_
							"  AND M11_CD_FILTRO <>'"& cd_filtro   &"' "&_
			  			"  AND M11_NR_ORDEM  >= "& nr_ordem
	  	Else
	    	sql = Null
	  	End If
	  	'Response.Write(sql &"<br>")
	  	If fnc_TestaVar(sql) Then objcnn.Execute(sql)
			
			If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos filtro.\n"& err.Description
			
			in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - FILTRO "& cd_filtro &"("& cd_filtro &") incluído com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"filtros_edt","filtros",1,1)&"&in_acao=lista&cd_filtro="&cd_filtro&"';"&_
										 "document.location='"&tx_link&"&in_acao=editar&cd_filtro="&cd_filtro&"&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
		Else
	  	tx_erro = "(CAD02):\n - FILTRO "& cd_filtro &"("& cd_filtro &") não incluído."
		End If
  End If
End If
'inicia o modo de edição
If in_acao = "editar" Then
  cd_filtro = CStr(Request("cd_filtro"))
	in_tipo   = "alterar"
	
	sql = "SELECT M11_CD_FILTRO, M11_CD_MENU, M11_CD_SUBM, M11_CD_DADO, M11_TP_EXIBIR, M11_TP_GRUPO, "&_
					"  M11_TX_FROM, M11_TX_WHERE, M11_NR_ORDEM, M11_IN_ATIVO, M11_IN_CHECK, M11_IN_OBRIGADO "&_
				"FROM M11_FILTRO ( NOLOCK ) " &_
				"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
	'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu_cad = objrs.Fields.Item("M11_CD_MENU").Value
		cd_subm_cad = objrs.Fields.Item("M11_CD_SUBM").Value
		cd_dado     = objrs.Fields.Item("M11_CD_DADO").Value
		cd_filtro   = objrs.Fields.Item("M11_CD_FILTRO").Value
		tp_exibir   = objrs.Fields.Item("M11_TP_EXIBIR").Value
		tp_grupo    = objrs.Fields.Item("M11_TP_GRUPO").Value
		tx_from     = objrs.Fields.Item("M11_TX_FROM").Value
		tx_where    = objrs.Fields.Item("M11_TX_WHERE").Value
		nr_ordem    = objrs.Fields.Item("M11_NR_ORDEM").Value
		in_ativo    = objrs.Fields.Item("M11_IN_ATIVO").Value
		in_check    = objrs.Fields.Item("M11_IN_CHECK").Value
		in_obrigado = objrs.Fields.Item("M11_IN_OBRIGADO").Value
	Else
		tx_erro = "(CAD03):\n FILTRO "& cd_filtro &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_filtro=&tx_erro="& Server.URLEncode(tx_erro))
  End If
  objrs.Close
End If
'altera os dados do menu selecionado
If in_acao = "alterar" Then
	cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad = CStr(Request.Form("cd_subm_cad"))
	cd_dado     = CStr(Request.Form("cd_dado"))
	cd_filtro   = CStr(Request.Form("cd_filtro"))
	tp_exibir   = CInt(Request.Form("tp_exibir"))
	tp_grupo    = CInt(Request.Form("tp_grupo"))
	tx_from     = CStr(Request.Form("tx_from"))
	tx_where    = CStr(Request.Form("tx_where"))
	nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
	in_check    = CInt(Request.Form("in_check"))
	in_obrigado = CInt(Request.Form("in_obrigado"))
	in_tipo      = "alterar"
	'verifica se as variaves não estão vazias
  If Not fnc_TestaVar(cd_filtro) Then
		tx_erro = tx_erro &"ATENÇÃO:\n - O código do filtro não é válido, contate o administrador;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(tp_exibir)   Then tp_exibir   = 2
		If Not fnc_TestaVar(tp_grupo)    Then tp_grupo    = 0
		If Not fnc_TestaVar(nr_ordem)    Then nr_ordem    = fnc_ConsultaLookup("M11_FILTRO","M11_CD_FILTRO",cd_filtro,"M11_NR_ORDEM")
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		If Not fnc_TestaVar(in_check)    Then in_check    = 0
		If Not fnc_TestaVar(in_obrigado) Then in_obrigado = 0
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad, cd_subm_cad)
		'seleciona o numero atual de ordem
		x = fnc_ConsultaLookup("M11_FILTRO","M11_CD_FILTRO",cd_filtro,"M11_NR_ORDEM")
		'monta a instrução sql de inclusão de sub-menu
		sql = "UPDATE M11_FILTRO SET "&_
					"  M11_TP_EXIBIR   = "& tp_exibir   &", "&_
					"  M11_TP_GRUPO    = "& tp_grupo    &", "&_
					"  M11_TX_FROM     = "& fnc_QuotedSQL(tx_from)  &", "&_
					"  M11_TX_WHERE    = "& fnc_QuotedSQL(tx_where) &", "&_
					"  M11_NR_ORDEM    = "& nr_ordem    &", "&_
					"  M11_IN_ATIVO    = "& in_ativo    &", "&_
					"  M11_IN_CHECK    = "& in_check    &", "&_
					"  M11_IN_OBRIGADO = "& in_obrigado &"  "&_
					"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'verifica se houve alteração no nr. de oredem
			If CInt(x) <> CInt(nr_ordem) Then
				'altera o numero da ordem
				If (nr_ordem-num) > 0 Then
					'numero de ordem muito maior que o ultimo, altera para um valor depois do ultimo
					sql = "UPDATE M11_FILTRO SET "&_
								"  M11_NR_ORDEM = "& num &" "&_
								"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
				Elseif nr_ordem < num Then
					'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
					sql = "UPDATE M11_FILTRO SET "&_
								"  M11_NR_ORDEM = M11_NR_ORDEM + 1 "&_
								"WHERE M11_CD_MENU   = '"& cd_menu_cad &"' "&_
								"  AND M11_CD_SUBM   = '"& cd_subm_cad &"' "&_
								"  AND M11_CD_FILTRO <>'"& cd_filtro   &"' "&_
								"  AND M11_NR_ORDEM  >= "& nr_ordem
				Else
					sql = Null
				End If
				'Response.Write(sql &"<br>")
				If fnc_TestaVar(sql) Then objcnn.Execute(sql)
			
				If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos filtros.\n"& err.Description
			End If
			
			tx_erro = "(CAD12):\n - FILTRO "& cd_filtro &"("& cd_filtro &") alterado com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"filtros_edt","filtros",1,1)&"&in_acao=lista&cd_filtro="&cd_filtro&"'</script>")
		Else
	  	tx_erro = "(CAD04):\n - FILTRO "& cd_filtro &"("& cd_filtro &") não alterado."
		End If
  End If
End If
'exclusão de sub-menu
If in_acao = "excluir" Then
	cd_filtro = CStr(Request.Form("cd_filtro"))
	If Not fnc_TestaVar(cd_filtro) Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		sql = "SELECT COUNT(*) AS TOTAL "&_
					"FROM M11_FILTRO (NOLOCK) "&_
					"  INNER JOIN M13_VIEW_FILTRO (NOLOCK) ON M13_CD_FILTRO = M11_CD_FILTRO "&_
					"WHERE M11_CD_FILTRO = '"&cd_filtro&"'"
		objrs.Open sql, objcnn, 3, 1
		
		If objrs("TOTAL") > 1 Then
	  	tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("TOTAL").Value &" Personalizações utilizando o Filtro "& cd_filtro &".\n Você pode desativar este sub-menu, caso não queira que ele apareça no site."
    Else
      objrs.Close
			'seleciona o numero de ordem antes da exclusão
			sql = "SELECT M11_NR_ORDEM " &_
						"FROM M11_FILTRO ( NOLOCK ) " &_
						"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
			objrs.Open sql, objcnn, 3, 1
			nr_ordem = objrs.Fields.Item("M11_NR_ORDEM").Value - 1
			'exclui o registro selecionado
			sql = "DELETE FROM M11_FILTRO " &_
						"WHERE M11_CD_FILTRO = '"& cd_filtro &"'"
			objcnn.Execute(sql)
			'atualiza a ordem dos sub-menus
			If Err.Number = 0 Then
				sql = "UPDATE M11_FILTRO " &_
							"   SET M11_NR_ORDEM = M11_NR_ORDEM - 1 " &_
							" WHERE M11_CD_MENU  = '"& cd_menu_cad &"' " &_
							"   AND M11_CD_SUBM  = '"& cd_subm_cad &"' " &_
							"   AND M11_NR_ORDEM >  "& nr_ordem
				'Response.Write(sql &"<br>")
				objcnn.Execute(sql)
				
				tx_erro = "CAD(13):\n - Código: " & cd_filtro &"."
				'redireciona para a página de cadastro
				Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"filtros_edt","filtros",1,1)&"&in_acao=lista&cd_filtro='</script>")
				Response.Redirect(tx_link &"&in_acao=novo&cd_filtro=&tx_erro="& Server.URLEncode(tx_erro))
			Else
				tx_erro = "CAD(07):\n -"
				Response.Redirect(tx_link &"&in_acao=editar&cd_filtro="&cd_filtro&"&tx_erro="& Server.URLEncode(tx_erro))
			End If
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
	with (document.frmCadastroFiltro) {
		if (cd_menu_cad.value == '') {
			cd_menu_cad.select();
			cd_menu_cad.focus();
		} else if (cd_subm_cad.value  == '') {
			cd_menu_cad.select();
			cd_subm_cad.focus();
		} else if (cd_dado.value == '') {
			cd_dado.select();
			cd_dado.focus();
		} else { 
			tp_exibir.select();
			tp_exibir.focus();
		}
	}
}

function fnc_ConsultaCodigo(campo) {
	with (document.frmCadastroFiltro) {
		if (campo == 'menu') {
			var codigo = cd_menu_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_menu_cad.value = codigo;
				nm_menu_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_filtro=&cd_menu_cad="+codigo+"'");
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
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_filtro=&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+codigo+"'");
			} else {
				cd_subm_cad.value = '';
				nm_subm_cad.value = '';
			}
		}
		if (campo == 'dado') {
			var codigo = cd_dado.value;
			if (codigo.length > 0 && codigo.length <= 4 && codigo != 0) {
				for (i = codigo.length; i < 4; i++)
					codigo = '0'+ String(codigo);
				cd_dado.value = codigo;
				nm_dado.value = codigo;
			} else {
				cd_dado.value = '';
				nm_dado.value = '';
			}
		}
	}  //encerra o with
}  //encerra a function

function fnc_InsereCodigo(campo) {
	with (document.frmCadastroFiltro) {
		if (campo == 'menu') {
			cd_menu_cad.value = nm_menu_cad.options[nm_menu_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_filtro=&cd_menu_cad="+cd_menu_cad.value+"'");
		}
		if (campo == 'subm') {
			cd_subm_cad.value = nm_subm_cad.options[nm_subm_cad.selectedIndex].value;
			eval("self.location = '<%= tx_link%>&in_acao=novo&cd_filtro=&cd_menu_cad=<%= cd_menu_cad%>&cd_subm_cad="+cd_subm_cad.value+"'");
		}
		if (campo == 'dado') {
			cd_dado.value = nm_dado.options[nm_dado.selectedIndex].value;
			//tp_exibir.select();
			tp_exibir.focus();
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
	//VALIDA O DADO DE INFORMACAO
  if (form.cd_dado.value == '') {
    eval('form.cd_dado.style.background="red"');
		alert('ATENÇÃO:\n\n- Código do DADO não especificao!');
		eval('form.cd_dado.style.background="white"');
		valida = false;
  } else {
    if (form.cd_dado.value != form.nm_dado.value) {
      eval('form.cd_dado.style.background="red"');
	  	alert('ATENÇÃO:\n\n- Código do DADO inválido!');
	  	eval('form.cd_dado.style.background="white"');
	  	valida = false;
		}
  }
  return valida
}
//-->
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroFiltro" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td height="30" class="admtitulo">&nbsp;Edição de Filtro</td>
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
								<select name="nm_menu_cad" class="select" style="width: 225px;" onChange="fnc_InsereCodigo('menu');">
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
								<select name="nm_subm_cad" class="select" style="width: 225px;" onChange="fnc_InsereCodigo('subm');"<% If Not fnc_TestaVar(cd_menu_cad) Then Response.Write(" disabled")%>>
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
  	If cd_menu_cad = objrs.Fields.Item("M02_CD_MENU").Value and cd_subm_cad = objrs.Fields.Item("M02_CD_SUBM").Value Then selected = " selected"
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
							<td class="admlabel"><label for="dado">Dado da Pers.:</label></td>
							<%
If in_acao = "novo" or in_acao = "incluir" Then
%>
							<td class="admdados"><input name="cd_dado" id="dado" type="text" class="editbox" style="width:50px;" maxlength="4" tabindex="2" value="<%= cd_dado%>" onBlur="fnc_ConsultaCodigo('dado');"<% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) Then Response.Write(" disabled")%>>
								<select name="nm_dado" class="select" style="width: 225px;" onChange="fnc_InsereCodigo('dado');"<% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) Then Response.Write(" disabled")%>>
									<option selected value="">Selecione um Dado da Personalização...</option>
									<%
  'seleciona os dados da personalização
  sql = "SELECT M10_CD_DADO, M10_NM_DADO, M10_CD_BROKER "&_
				"FROM M10_DADOS ( NOLOCK ) "&_
				"WHERE M10_CD_DADO NOT IN ( "&_
				"    SELECT M11_CD_DADO "&_
				"    FROM M11_FILTRO ( NOLOCK ) "&_
				"    WHERE M11_CD_MENU+M11_CD_SUBM = '"& cd_menu_cad&cd_subm_cad &"' "&_
				"  ) "&_
				"ORDER BY M10_NM_DADO"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  'preenche os valores do select
  Do While Not objrs.Eof
  	selected = ""
  	If cd_dado = objrs.Fields.Item("M10_CD_DADO").Value Then selected = " selected"
		If fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then str = " ("&objrs.Fields.Item("M10_CD_BROKER").Value&")" Else str = ""
%>
									<option value="<%= objrs.Fields.Item("M10_CD_DADO").Value%>"<%= selected%>><%= objrs.Fields.Item("M10_NM_DADO").Value&str%></option>
									<%
  	objrs.MoveNext
  Loop
  objrs.Close
%>
								</select></td>
							<%
Else
  'seleciona o menu do sub-menu
  sql = "SELECT M10_CD_DADO, M10_NM_DADO " &_
				"FROM M10_DADOS ( NOLOCK ) " &_
				"WHERE M10_CD_DADO = '"& cd_dado &"' "
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
							<td class="admdados"><%= objrs.Fields.Item("M10_CD_DADO").Value &" - "& objrs.Fields.Item("M10_NM_DADO").Value%>
								<input name="cd_dado" type="hidden" value="<%= cd_dado%>">
								<input name="nm_dado" type="hidden" value="<%= cd_dado%>"></td>
							<%
  objrs.Close
End If
%>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><%
If Not fnc_TestaVar(cd_filtro) Then
%>
								Novo Registro
								<input name="cd_filtro" type="hidden" value="<%= cd_filtro%>">
								<%
Else
%>
								<input name="cd_filtro" type="text" disabled class="editbox" id="codigo" style="width:50px; background-color: #CCCCCC;" tabindex="0" value="<%= Mid(cd_filtro, 6, 5)%>" maxlength="3">
								<input name="cd_filtro" type="hidden" value="<%= cd_filtro%>">
								<%
End If
%>
							</td>
						</tr>
						<tr>
							<td class="admlabel"><label for="exibe">Exibir:</label></td>
							<td class="admdados"><select name="tp_exibir" id="exibe" class="select" tabindex="3" style="width:225px;"<% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
									<%
For cont = 0 To UBound(tipo_exibir)
  selected = ""
  If CInt(tp_exibir) = cont Then selected = " selected"
%>
									<option value="<%= cont%>"<%= selected%>><%= tipo_exibir(cont)%></option>
									<%
Next
%>
								</select></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="grupo">Grupo:</label></td>
							<td class="admdados"><input name="tp_grupo" type="text" class="editbox" id="grupo" style="width:300px;" maxlength="50" value="<%= tp_grupo%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="from">SQL From:</label></td>
							<td class="admdados"><input name="tx_from" type="text" class="editbox" id="from" style="width:300px;" maxlength="50" value="<%= tx_from%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="where">SQL Where:</label></td>
							<td class="admdados"><input name="tx_where" type="text" class="editbox" id="where" style="width:300px;" maxlength="50" value="<%= tx_where%>"<% If (Not fnc_TestaVar(cd_menu_cad)) and (Not fnc_TestaVar(cd_subm_cad)) Then Response.Write(" disabled")%>></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="ordem">Ordem:</label></td>
							<td class="admdados"><input name="nr_ordem" type="text" class="editbox" id="ordem" style="width:50px;" maxlength="3" value="<%= nr_ordem%>"<% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								&ordm;</td>
						</tr>
						<tr>
							<td class="admlabel">Ativo:</td>
							<td class="admdados"><input name="in_ativo" type="radio" class="radio" id="sim" value="1"<% If in_ativo = 1 or in_ativo = True Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="sim">Sim</label>
								<input name="in_ativo" type="radio" class="radio" id="nao" value="0"<% If in_ativo = 0 or in_ativo = False Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="nao">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Checkado:</td>
							<td class="admdados"><input name="in_check" type="radio" class="radio" id="sim0" value="1"<% If in_check = 1 or in_check = True Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="sim0">Sim</label>
								<input name="in_check" type="radio" class="radio" id="nao0" value="0"<% If in_check = 0 or in_check = False Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="nao0">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Obrigado:</td>
							<td class="admdados"><input name="in_obrigado" type="radio" class="radio" id="sim1" value="1"<% If in_obrigado = 1 or in_obrigado = True Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="sim1">Sim</label>
								<input name="in_obrigado" type="radio" class="radio" id="nao1" value="0"<% If in_obrigado = 0 or in_obrigado = False Then Response.Write(" checked")%><% If Not fnc_TestaVar(cd_menu_cad) or Not fnc_TestaVar(cd_subm_cad) and Not fnc_TestaVar(cd_dado) Then Response.Write(" disabled")%>>
								<label for="nao1">N&atilde;o</label></td>
						</tr>
					</table>
				</div></td>
		</tr>
		<tr bgcolor="#DDDDDD" height="30">
			<td align="center"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
				<input name="enviar" type="submit" class="admbutton" value="Salvar">
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