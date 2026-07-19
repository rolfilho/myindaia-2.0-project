<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Dados da Personalização
'
'Autor Alexandre Gonçalves Neto
'Criado: 18/10/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_dado 'codigo do dado que esta sendo editado 
Dim nm_dado, nm_eng, nm_esp, ap_filtro, ap_campo, tp_dado, tp_consulta
Dim nm_tabela, nm_chave, nm_descricao, cd_broker, in_filtro, in_campo, in_ativo
Dim in_tipo 'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao 'ação que está ocorrendo na tabela

in_show   = True
cd_tela   = "ADM014"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "dados_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem

'seta variáveis para a inclusão de um novo registro
If in_acao = "novo" Then
  cd_dado      = ""
  nm_dado      = ""
  nm_eng       = ""
  nm_esp       = ""
  ap_filtro    = ""
  ap_campo     = ""
  tp_dado      = 0
  tp_consulta  = 0
  nm_tabela    = ""
  nm_chave     = ""
  nm_descricao = ""
  cd_broker    = ""
  in_filtro    = 0
  in_campo     = 0
  in_ativo     = 1
  in_tipo = "incluir"
End If
'inclui o registro novo
If in_acao = "incluir" Then
	cd_dado      = CStr(Request.Form("cd_dado"))
	nm_dado      = CStr(Request.Form("nm_dado"))
	nm_eng       = CStr(Request.Form("nm_eng"))
	nm_esp       = CStr(Request.Form("nm_esp"))
	ap_filtro    = CStr(Request.Form("ap_filtro"))
	ap_campo     = CStr(Request.Form("ap_campo"))
	tp_dado      = CInt(Request.Form("tp_dado"))
	tp_consulta  = CInt(Request.Form("tp_consulta"))
	nm_tabela    = CStr(Request.Form("nm_tabela"))
	nm_chave     = CStr(Request.Form("nm_chave"))
	nm_descricao = CStr(Request.Form("nm_descricao"))
	cd_broker    = CStr(Request.Form("cd_broker"))
	in_filtro    = CInt(Request.Form("in_filtro"))
	in_campo     = CInt(Request.Form("in_campo"))
	in_ativo     = CInt(Request.Form("in_ativo"))
	in_tipo      = "incluir"
	'verifica se as variaves não estão vazias
  If nm_dado = "" or (in_filtro = 1 and ap_filtro = "") or (in_campo = 1 and ap_campo = "") Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(nm_dado)                     Then tx_erro = tx_erro & "- Nome do Dado da Personalização;\n"
		If Not fnc_TestaVar(ap_filtro) and in_filtro = 1 Then tx_erro = tx_erro & "- Dado marcado como filtro e sem descrição;\n"
		If Not fnc_TestaVar(ap_campo)  and in_campo  = 1 Then tx_erro = tx_erro & "- Dado marcado como campo e sem descrição\n"
  Else
		'não foram verificados erros, define padrões
		If Not fnc_TestaVar(tp_dado)     Then tp_dado     = 0
		If Not fnc_TestaVar(tp_consulta) Then tp_consulta = 0
		If Not fnc_TestaVar(in_filtro)   Then in_filtro   = 0
		If Not fnc_TestaVar(in_campo)    Then in_campo    = 0
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		'cria o código para o dado
		sql = "SELECT MAX(M10_CD_DADO) AS ULTIMO FROM M10_DADOS (NOLOCK)"
		'Response.Write(sql &"<br>")
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  	'cria o código para o registro
		cd_dado = fnc_AddZeros(objrs.Fields.Item("ULTIMO").Value + 1, 4)
		objrs.Close
		'caso seja nulo, seta o código para 0001
		If Not fnc_TestaVar(cd_dado) Then cd_dado = "0001"
		'cria a instrução sql de inclusão
		sql = "INSERT INTO M10_DADOS ( "&_
					"  M10_CD_DADO, M10_NM_DADO, M10_NM_ENG, M10_NM_ESP, M10_AP_FILTRO, M10_AP_CAMPO, M10_TP_DADO, M10_TP_CONSULTA, "&_
					"  M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, M10_IN_FILTRO, M10_IN_CAMPO, M10_IN_ATIVO "&_
					") "&_
					"VALUES ( '"& cd_dado &"', '"& nm_dado &"', "& fnc_QuotedSQL(nm_eng) &", "& fnc_QuotedSQL(nm_esp) &", "&_
						fnc_QuotedSQL(ap_filtro) &", "& fnc_QuotedSQL(ap_campo) &", '"& tp_dado &"', '"& tp_consulta &"', "&_
						fnc_QuotedSQL(nm_tabela) &", "& fnc_QuotedSQL(nm_chave)   &", "& fnc_QuotedSQL(nm_descricao) &", "&_
						fnc_QuotedSQL(cd_broker) &", "& in_filtro &", "& in_campo &", "& in_ativo &_
					")"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - DADO da Personalização "& cd_dado &"("& cd_dado &") incluído com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"dados_edt","dados",1,1)&"&in_acao=lista&cd_dado="&cd_dado&"';"&_
										 "document.location='"&tx_link&"&in_acao=editar&cd_dado="&cd_dado&"&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
		Else
	  	tx_erro = "(CAD02):\n - DADO da Personalização "& cd_dado &"("& cd_dado &") não incluído."
		End If
  End If
End If
'inicia o modo de edição
If in_acao = "editar" Then
	cd_dado = CStr(Request("cd_dado"))
	in_tipo = "alterar"
  
  If objrs.State = 1 Then objrs.Close
  sql = "SELECT M10_CD_DADO, M10_NM_DADO, M10_NM_ENG, M10_NM_ESP, M10_AP_FILTRO, M10_AP_CAMPO, M10_TP_DADO, M10_TP_CONSULTA, "&_
				"  M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, M10_IN_FILTRO, M10_IN_CAMPO, M10_IN_ATIVO "&_
				"FROM M10_DADOS (NOLOCK) "&_
				"WHERE M10_CD_DADO = '"& cd_dado &"'"
  'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
	If objrs.RecordCount > 0 Then
		cd_dado      = objrs.Fields.Item("M10_CD_DADO").Value
		nm_dado      = objrs.Fields.Item("M10_NM_DADO").Value
		nm_eng       = objrs.Fields.Item("M10_NM_ENG").Value
		nm_esp       = objrs.Fields.Item("M10_NM_ESP").Value
		ap_filtro    = objrs.Fields.Item("M10_AP_FILTRO").Value
		ap_campo     = objrs.Fields.Item("M10_AP_CAMPO").Value
    tp_dado      = objrs.Fields.Item("M10_TP_DADO").Value
		tp_consulta  = objrs.Fields.Item("M10_TP_CONSULTA").Value
		nm_tabela    = objrs.Fields.Item("M10_NM_TABELA").Value
		nm_chave     = objrs.Fields.Item("M10_NM_CHAVE").Value
		nm_descricao = objrs.Fields.Item("M10_NM_DESCRICAO").Value
		cd_broker    = objrs.Fields.Item("M10_CD_BROKER").Value
		in_filtro    = objrs.Fields.Item("M10_IN_FILTRO").Value
		in_campo     = objrs.Fields.Item("M10_IN_CAMPO").Value
		in_ativo     = objrs.Fields.Item("M10_IN_ATIVO").Value
  Else
		tx_erro = "(CAD03):\n DADO da Personalização "& cd_dado &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_dado=&tx_erro="& Server.URLEncode(tx_erro))
  End If
  objrs.Close
End If
'altera os dados do menu selecionado
If in_acao = "alterar" Then
	cd_dado      = CStr(Request.Form("cd_dado"))
	nm_dado      = CStr(Request.Form("nm_dado"))
	nm_eng       = CStr(Request.Form("nm_eng"))
	nm_esp       = CStr(Request.Form("nm_esp"))
	ap_filtro    = CStr(Request.Form("ap_filtro"))
	ap_campo     = CStr(Request.Form("ap_campo"))
	tp_dado      = CStr(Request.Form("tp_dado"))
	tp_consulta  = CStr(Request.Form("tp_consulta"))
	nm_tabela    = CStr(Request.Form("nm_tabela"))
	nm_chave     = CStr(Request.Form("nm_chave"))
	nm_descricao = CStr(Request.Form("nm_descricao"))
	cd_broker    = CStr(Request.Form("cd_broker"))
	in_filtro    = CInt(Request.Form("in_filtro"))
	in_campo     = CInt(Request.Form("in_campo"))
	in_ativo     = CInt(Request.Form("in_ativo"))
	in_tipo      = "incluir"
	'verifica se as variaves não estão vazias
  If nm_dado = "" or (in_filtro = 1 and ap_filtro = "") or (in_campo = 1 and ap_campo = "") Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(nm_dado)                     Then tx_erro = tx_erro & "- Nome do Dado da Personalização;\n"
		If Not fnc_TestaVar(ap_filtro) and in_filtro = 1 Then tx_erro = tx_erro & "- Dado marcado como filtro e sem descrição;\n"
		If Not fnc_TestaVar(ap_campo)  and in_campo  = 1 Then tx_erro = tx_erro & "- Dado marcado como campo e sem descrição\n"
  Else
		'não foram verificados erros, define padrões
		If Not fnc_TestaVar(tp_dado)     Then tp_dado     = 0
		If Not fnc_TestaVar(tp_consulta) Then tp_consulta = 0
		If Not fnc_TestaVar(in_filtro)   Then in_filtro   = 0
		If Not fnc_TestaVar(in_campo)    Then in_campo    = 0
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		'cria a instrução sql de inclusão
		sql = "UPDATE M10_DADOS SET "&_
					"  M10_NM_DADO      = '"& nm_dado                     &"', "&_
					"  M10_NM_ENG       =  "& fnc_QuotedSQL(nm_eng)       &", "&_
					"  M10_NM_ESP       =  "& fnc_QuotedSQL(nm_esp)       &", "&_
					"  M10_AP_FILTRO    =  "& fnc_QuotedSQL(ap_filtro)    &", "&_
					"  M10_AP_CAMPO     =  "& fnc_QuotedSQL(ap_campo)     &", "&_
					"  M10_TP_DADO      = '"& tp_dado                     &"', "&_
					"  M10_TP_CONSULTA  = '"& tp_consulta                 &"', "&_
					"  M10_NM_TABELA    =  "& fnc_QuotedSQL(nm_tabela)    &", "&_
					"  M10_NM_CHAVE     =  "& fnc_QuotedSQL(nm_chave)     &", "&_
					"  M10_NM_DESCRICAO =  "& fnc_QuotedSQL(nm_descricao) &", "&_
					"  M10_CD_BROKER    =  "& fnc_QuotedSQL(cd_broker)    &", "&_
					"  M10_IN_FILTRO    =  "& in_filtro                   &", "&_
					"  M10_IN_CAMPO     =  "& in_campo                    &", "&_
					"  M10_IN_ATIVO     =  "& in_ativo                    &"  "&_
					"WHERE M10_CD_DADO = '"& cd_dado &"'"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - DADO da Personalização "& cd_dado &"("& cd_dado &") alterado com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"dados_edt","dados",1,1)&"&in_acao=lista&cd_dado="&cd_dado&"'</script>")
		Else
	  	tx_erro = "(CAD02):\n - DADO da Personalização "& cd_dado &"("& cd_dado &") não alterado."
		End If
  End If
End If
'exclusão de sub-menu
If in_acao = "excluir" Then
	cd_campo = CStr(Request.Form("cd_campo"))
	If Not fnc_TestaVar(cd_campo) Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		sql = "SELECT COUNT(*) AS TOTAL "&_
					"FROM M10_DADOS (NOLOCK) "&_
					"  INNER JOIN M11_FILTRO (NOLOCK) ON M11_CD_DADO = M10_CD_DADO "&_
					"  INNER JOIN M12_CAMPO  (NOLOCK) ON M12_CD_DADO = M10_CD_DADO "&_
					"WHERE M10_CD_DADO = '"&cd_dado&"'"
		objrs.Open sql, objcnn, 3, 1
		
		If objrs("TOTAL") > 1 Then
	  	tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("TOTAL").Value &" Campos/Filtros utilizando o Dados da pesonalização "& cd_dado &".\n Você pode desativar este sub-menu, caso não queira que ele apareça no site."
    Else
			'exclui o registro selecionado
			sql = "DELETE FROM M10_DADOS WHERE M10_CD_DADO = '"& cd_dado &"'"
			objcnn.Execute(sql)
			'atualiza a ordem dos sub-menus
			If Err.Number = 0 Then
				tx_erro = "CAD(13):\n - Código: " & cd_dado &"."
				'redireciona para a página de cadastro
				Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"dados_edt","dados",1,1)&"&in_acao=lista&cd_dado=';")
				Response.Write("document.location='"&tx_link &"&in_acao=novo&cd_dado=&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
			Else
				tx_erro = "CAD(07):\n -"
				Response.Redirect(tx_link &"&in_acao=editar&cd_dado="&cd_dado&"&tx_erro="& Server.URLEncode(tx_erro))
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
<script language="javascript" type="text/javascript">
<!--
function fnc_FocusCampo() {
	with (document.frmCadastroDado) {
		nm_dado.selected;
		nm_dado.focused;
	}
}

function fnc_HabilitaFiltro() {
	with (document.frmCadastroDado) {
		if (in_filtro.checked) {
			in_filtro.checked = false;
			ap_filtro.style.background = "#CCCCCC";
			ap_filtro.disabled = true;
		} else {
			in_filtro.checked = true;
			ap_filtro.style.background = "#FFFFFF";
			ap_filtro.disabled = false;
			ap_filtro.focus();
		}
	}
}

function fnc_ClicaFiltro() {
	with (document.frmCadastroDado) {
		if (!in_filtro.checked) {
			ap_filtro.style.background = "#CCCCCC";
			ap_filtro.disabled = true;
		} else {
			ap_filtro.style.background = "#FFFFFF";
			ap_filtro.disabled = false;
			ap_filtro.focus();
		}
	}
}

function fnc_HabilitaCampo() {
	with (document.frmCadastroDado) {
	if (in_campo.checked) {
		in_campo.checked = false;
		ap_campo.style.background = "#CCCCCC";
		ap_campo.disabled = true;
	} else {
		in_campo.checked = true;
		ap_campo.style.background = "#FFFFFF";
		ap_campo.disabled = false;
		ap_campo.focus();
		}
	}
}

function fnc_ClicaCampo() {
	with (document.frmCadastroDado) {
		if (!in_campo.checked) {
			ap_campo.style.background = "#CCCCCC";
			ap_campo.disabled = true;
		} else {
			ap_campo.style.background = "#FFFFFF";
			ap_campo.disabled = false;
			ap_campo.focus();
		}
	}
}

function fnc_ValidaForm(form) {
  var valida = true;
	//VALIDA O CAMPO
	if (form.in_campo.checked && form.ap_campo.value == '' ) {
		eval('form.ap_campo.style.background="red"');
		alert('ATENÇÃO: APELIDO DO CAMPO não especificado!');
		eval('form.ap_campo.style.background="white"');
		valida = false;
	}
	//VALIDA O FILTRO
	if (form.in_filtro.checked && form.ap_filtro.value == '' ) {
		eval('form.ap_filtro.style.background="red"');
		alert('ATENÇÃO: APELIDO DO FILTRO não especificado!');
		eval('form.ap_filtro.style.background="white"');
		valida = false;
	}
	//VALIDA O NOME DO CAMPO
	if (form.nm_dado.value == '') {
		eval('form.nm_dado.style.background="red"');
		alert('ATENÇÃO: NOME DO DADO não especificado!');
		eval('form.nm_dado.style.background="white"');
		valida = false;
	}
	return valida
}
-->
</script>
</head>
<body onLoad="fnc_FocusCampo();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroDado" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td height="30" class="admtitulo">&nbsp;Edição de Dados Person.</td>
		</tr>
		<tr>
			<td valign="top"><div id="Edicao" class="divEdicao">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr height="30">
							<td class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><%
If cd_dado = "" Then
%>
								Novo Registro
								<input name="cd_dado" type="hidden" value="<%= cd_dado%>">
								<%
Else
%>
								<input name="cd_dado" type="text" disabled class="editbox" id="codigo" style="width: 50px; background-color: #CCCCCC;" tabindex="0" value="<%= cd_dado%>" maxlength="3">
								<input name="cd_dado" type="hidden" value="<%= cd_dado%>">
								<%
End If
%>
							</td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="nome">Nome:</label></td>
							<td class="admdados"><input name="nm_dado" type="text" class="editbox" id="nome" maxlength="50" tabindex="1" value="<%= nm_dado%>" style="width:300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="eng">English:</label></td>
							<td class="admdados"><input name="nm_eng" type="text" class="editbox" id="eng" maxlength="50" tabindex="2" value="<%= nm_eng%>" style="width:300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="esp">Español:</label></td>
							<td class="admdados"><input name="nm_esp" type="text" class="editbox" id="esp" maxlength="50" tabindex="3" value="<%= nm_esp%>" style="width:300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="filtro" onClick="fnc_HabilitaFiltro();">Filtro:</label></td>
							<td class="admdados"><input name="in_filtro" type="checkbox" tabindex="4" onClick="fnc_ClicaFiltro();" value="1"<% If in_filtro = 1 or in_filtro = True Then Response.Write(" checked")%>>
								<input name="ap_filtro" type="text" class="editbox" id="filtro" tabindex="5" value="<%= ap_filtro%>" style="width:275px; text-transform:lowercase;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="campo" onClick="fnc_HabilitaCampo();">Campo:</label></td>
							<td class="admdados"><input name="in_campo" type="checkbox" tabindex="6" onClick="fnc_ClicaCampo();" value="1"<% If in_campo = 1 or in_campo = True Then Response.Write(" checked")%>>
								<input name="ap_campo" type="text" class="editbox" id="campo" tabindex="7" value="<%= ap_campo%>" style="width:275px; text-transform:uppercase;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="tipo">Tipo:</label></td>
							<td class="admdados"><select name="tp_dado" id="tipo" class="select" tabindex="9" style="width: 300px;">
									<%
For cont = 0 To UBound(tipo_dado)
  selected = ""
  If CInt(tp_dado) = cont Then selected = " selected"
%>
									<option value="<%= cont%>"<%= selected%>><%= tipo_dado(cont)%></option>
									<%
Next
%>
								</select></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="consulta">Consulta:</label></td>
							<td class="admdados"><select name="tp_consulta" id="consulta" class="select" tabindex="10" style="width: 300px;">
									<%
For cont = 0 To UBound(tipo_consulta)
  selected = ""
  If CInt(tp_consulta) = cont Then selected = " selected"
%>
									<option value="<%= cont%>"<%= selected%>><%= tipo_consulta(cont)%></option>
									<%
Next
%>
								</select></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="tabela">Tabela:</label></td>
							<td class="admdados"><input name="nm_tabela" type="text" class="editbox" id="tabela" maxlength="50" tabindex="11" value="<%= nm_tabela%>" style="width: 300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="chave">Chave:</label></td>
							<td class="admdados"><input name="nm_chave" type="text" class="editbox" id="chave" maxlength="50" tabindex="12" value="<%= nm_chave%>" style="width: 300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="descricao">Descrição:</label></td>
							<td class="admdados"><input name="nm_descricao" type="text" class="editbox" id="descricao" maxlength="50" tabindex="13" value="<%= nm_descricao%>" style="width: 300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel"><label for="broker">C&oacute;digo Broker :</label></td>
							<td class="admdados"><input name="cd_broker" type="text" class="editbox" id="broker" maxlength="50" tabindex="14" value="<%= cd_broker%>" style="width: 300px;"></td>
						</tr>
						<tr height="30">
							<td class="admlabel">Ativo:</td>
							<td class="admdados"><input name="in_ativo" type="radio" class="radio" id="sim_ativo" tabindex="15" value="1"<% If in_ativo = 1 or in_ativo = True Then Response.Write(" checked")%>>
								<label for="sim_ativo">Sim</label>
								<input name="in_ativo" type="radio" class="radio" id="nao_ativo" value="0"<% If in_ativo = 0 or in_ativo = False Then Response.Write(" checked")%>>
								<label for="nao_ativo">N&atilde;o</label></td>
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
