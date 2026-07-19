<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Menu
'
'Autor Alexandre Gonçalves Neto
'Criado: 27/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim nm_menu_cad
Dim ap_menu_cad
Dim nm_eng
Dim nm_esp
Dim nr_ordem
Dim in_ativo 
Dim in_tipo  'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao  'ação que está ocorrendo na tabela

in_show   = True
cd_tela   = "ADM002"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "menu_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem

Function fnc_UltimoNrOrdem()
  Dim return
	
	sql = "SELECT MAX(M01_NR_ORDEM) AS VL_MAX_NR_ORDEM FROM M01_MENU (NOLOCK)"
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
	cd_menu_cad = ""
	nm_menu_cad = ""
	ap_menu_cad = ""
	nm_eng      = ""
	nm_esp      = ""
	nr_ordem    = fnc_UltimoNrOrdem()
	in_ativo    = 1 
	in_tipo     = "incluir"
End If
'inclui um novo registro na tabela
If in_acao = "incluir" Then
  cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
  nm_menu_cad = CStr(Request.Form("nm_menu_cad"))
  ap_menu_cad = CStr(Request.Form("ap_menu_cad"))
	nm_eng      = CStr(Request.Form("nm_eng"))
	nm_esp      = CStr(Request.Form("nm_esp"))
  nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
  in_tipo     = "incluir"
  
  sql = "SELECT ISNULL(MAX(M01_CD_MENU), 0) AS CD_ULTIMO FROM M01_MENU (NOLOCK)"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  'cria o código para o registro
  cd_menu_cad = fnc_AddZeros(objrs.Fields.Item("CD_ULTIMO").Value + 1, 2)
  objrs.Close
  'caso seja nulo, seta o código para 001
  If Not fnc_TestaVar(cd_menu_cad) Then cd_menu_cad = "01"
  
  'verifica se as variaves não estão vazias/nulas
  If cd_menu_cad = "" or nm_menu_cad = "" or ap_menu_cad = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If cd_menu_cad = "" Then tx_erro = tx_erro & "- Código do Menu;\n"
		If nm_menu_cad = "" Then tx_erro = tx_erro & "- Nome do Menu;\n"
		If ap_menu_cad = "" Then tx_erro = tx_erro & "- Apelido do Menu;\n"
  Else
		If Not fnc_TestaVar(nr_ordem) Then nr_ordem = fnc_UltimoNrOrdem()
		If Not fnc_TestaVar(in_ativo) Then in_ativo = 1
		'seleciona o ultimo numero da ordem
		num = fnc_UltimoNrOrdem()
		if nr_ordem > num then nr_ordem = num
		'monta a instrução sql de inclusão
		sql = "INSERT INTO M01_MENU (M01_CD_MENU, M01_NM_MENU, M01_NM_ENG, M01_NM_ESP, M01_AP_MENU, M01_NR_ORDEM, M01_IN_ATIVO) "&_
	  	  	"VALUES ('"&cd_menu_cad&"', '"&nm_menu_cad&"', "&fnc_QuotedSQL(nm_eng)&", "&fnc_QuotedSQL(nm_esp)&", '"&ap_menu_cad&"', "&nr_ordem&", "&in_ativo&")"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
	  	'altera o numero da ordem
	  	If nr_ordem < num Then
	    	'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
				sql = "UPDATE M01_MENU SET "&_
			  			"  M01_NR_ORDEM = M01_NR_ORDEM + 1 "&_
			  			"WHERE M01_CD_MENU  <> '"& cd_menu_cad &"' "&_
			  			"  AND M01_NR_ORDEM >=  "& nr_ordem
				'Response.Write(sql &"<br>")
				objcnn.Execute(sql) 
			
				If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos campos.\n"& err.Description
	  	End If
	  
	  	in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - MENU "& cd_menu_cad &"("& nm_menu_cad &") incluído com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"menu_edt","menu",1,1)&"&in_acao=lista&cd_menu_cad="&cd_menu_cad&"';"&_
										 "document.location='"&tx_link&"&in_acao=editar&cd_menu_cad="&cd_menu_cad&"&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
		Else
	  	tx_erro = "(CAD02):\n - MENU "& cd_menu_cad &"("& nm_menu_cad &") não incluído."
		End If
  End If
End If
'inicia o modo de edição
If in_acao = "editar" Then
  cd_menu_cad = CStr(Request("cd_menu_cad"))
  in_tipo     = "alterar"
  
  sql = "SELECT M01_CD_MENU, M01_NM_MENU, M01_NM_ENG, M01_NM_ESP, M01_AP_MENU, M01_NR_ORDEM, M01_IN_ATIVO " &_
				"FROM M01_MENU ( NOLOCK ) " &_
				"WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
  'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
  If objrs.RecordCount > 0 Then
		cd_menu_cad = objrs.Fields.Item("M01_CD_MENU").Value
		nm_menu_cad = objrs.Fields.Item("M01_NM_MENU").Value
		ap_menu_cad = objrs.Fields.Item("M01_AP_MENU").Value
		nm_eng      = objrs.Fields.Item("M01_NM_ENG").Value
		nm_esp      = objrs.Fields.Item("M01_NM_ESP").Value
		nr_ordem    = objrs.Fields.Item("M01_NR_ORDEM").Value
		in_ativo    = objrs.Fields.Item("M01_IN_ATIVO").Value
	Else
		tx_erro = "(CAD03):\n MENU "& cd_menu_cad &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_menu_cad=&tx_erro="& Server.URLEncode(tx_erro))
  End If
  objrs.Close
End If
'altera os dados do menu selecionado
If in_acao = "alterar" Then
  cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
  nm_menu_cad = CStr(Request.Form("nm_menu_cad"))
  ap_menu_cad = CStr(Request.Form("ap_menu_cad"))
	nm_eng      = CStr(Request.Form("nm_eng"))
	nm_esp      = CStr(Request.Form("nm_esp"))
  nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
  in_tipo     = "alterar"
  'verifica se as variaves não estão vazias
  If cd_menu_cad = "" or nm_menu_cad = "" or ap_menu_cad = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If cd_menu_cad = "" Then tx_erro = tx_erro & "- Código do Menu;\n"
		If nm_menu_cad = "" Then tx_erro = tx_erro & "- Nome do Menu;\n"
		If ap_menu_cad = "" Then tx_erro = tx_erro & "- Apelido do Menu;\n"
  Else
    If Not fnc_TestaVar(nr_ordem) Then nr_ordem = fnc_UltimoNrOrdem()
		If Not fnc_TestaVar(in_ativo) Then in_ativo = 1
		'cria o ultimo numero de ordem
		num = fnc_UltimoNrOrdem()
		if nr_ordem > num then nr_ordem = num
		'seleciona o numero atual de ordem
		x = fnc_ConsultaLookup("M01_MENU","M01_CD_MENU",cd_menu_cad,"M01_NR_ORDEM")
		'atualiza a tabela com os novos dados
		sql = "UPDATE M01_MENU SET" &_
	  	  	"  M01_NM_MENU  = '"& nm_menu_cad &"', "&_
					"  M01_NM_ENG   =  "& fnc_QuotedSQL(nm_eng) &", "&_
					"  M01_NM_ESP   =  "& fnc_QuotedSQL(nm_esp) &", "&_
		  		"  M01_AP_MENU  = '"& ap_menu_cad &"', "&_
		  		"  M01_NR_ORDEM =  "& nr_ordem    &", "&_
		  		"  M01_IN_ATIVO =  "& in_ativo    &"  "&_
		  		"WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
	  	'verifica se houve alteração no nr. de oredem
			if CInt(nr_ordem) <> CInt(x) then
				if CInt(nr_ordem) < CInt(x) then
					sql = "UPDATE M01_MENU SET "&_
								"  M01_NR_ORDEM = M01_NR_ORDEM + 1 "&_
								"WHERE M01_CD_MENU  <>'"& cd_menu_cad &"' "&_
								"  AND M01_NR_ORDEM BETWEEN "& nr_ordem &" AND "& x
				elseif CInt(nr_ordem) > CInt(x) then
					sql = "UPDATE M01_MENU SET "&_
								"  M01_NR_ORDEM = M01_NR_ORDEM - 1 "&_
								"WHERE M01_CD_MENU  <>'"& cd_menu_cad &"' "&_
								"  AND M01_NR_ORDEM BETWEEN "& x &" AND "& nr_ordem
				end if
				'Response.Write(sql &"<br>")
				objcnn.Execute(sql) 
			
				If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação do Menu.\n"& err.Description
	  	end if
			
		  in_tipo = "alterar"
		  tx_erro = "(CAD12):\n - MENU "& cd_menu_cad &"("& nm_menu_cad &") alterado com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"menu_edt","menu",1,1)&"&in_acao=lista&cd_menu_cad="&cd_menu_cad&"'</script>")
		Else
	  	tx_erro = "(CAD04):\n - MENU "& cd_menu_cad &"("& nm_menu_cad &") não alterado."
		End If
  End If
End If
'exclui o resgistro da base de dados
If in_acao = "excluir" Then
  cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	If Trim(cd_menu_cad) = "" Then
		tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
	Else
		'verifica se não existem sub-menus utilizando o registro
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_
					"FROM M02_SUBM (NOLOCK) "&_
					"WHERE M02_CD_MENU = '"& cd_menu_cad &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly', adCmdTable
		
		If objrs.Fields.Item("VL_TOTAL").Value > 0 Then
			tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("VL_TOTAL").Value &" Sub-Menus utilizando o Menu "& cd_menu_cad &".\n Você pode desativar este menu, caso não queira que ele apareça no site."
		Else
			objrs.Close
			'seleciona o numero de ordem antes da exclusão
			sql = "SELECT M01_NR_ORDEM FROM M01_MENU ( NOLOCK ) WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdTable
			nr_ordem = objrs.Fields.Item("M01_NR_ORDEM").Value-1
			'exclui o registro
			sql = "DELETE FROM M01_MENU WHERE M01_CD_MENU = '"& cd_menu_cad &"'"
			objcnn.Execute(sql)
			
			If Err.Number = 0 Then
				sql = "UPDATE M01_MENU SET M01_NR_ORDEM = M01_NR_ORDEM-1 WHERE M01_NR_ORDEM > "& nr_ordem
				objcnn.Execute(sql)
				tx_erro = "CAD(13):\n - Código: " & cd_menu_cad &"."
				'redireciona para a página de cadastro
				Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"menu_edt","menu",1,1)&"&in_acao=lista&cd_menu_cad='</script>")
				Response.Redirect(tx_link &"&in_acao=novo&cd_menu_cad=&tx_erro="& Server.URLEncode(tx_erro))
			Else
				tx_erro = "CAD(07):\n - Não foi possível excluir o MENU "& cd_menu_cad
				Response.Redirect(tx_link &"&in_acao=editar&cd_menu_cad="&cd_menu_cad&"&tx_erro="& Server.URLEncode(tx_erro))
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
	top: 35px;
	left: 0px;
	width: 100%;
	height: 100%;
	z-index: 1;
	overflow: auto;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function fnc_ValidaForm(form) {
  var valida = true;
  //VALIDA O NOME DO MENU
  if (form.nm_menu.value == '') {
    eval('form.nm_menu_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- NOME DO MENU não especificao!');
		eval('form.nm_menu_cad.style.background="white"');
		valida = false;
  }
  //VALIDA O APELIDO DO MENu
  if (form.ap_menu.value == '') {
    eval('form.ap_menu_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- APELIDO DO MENU não especificao!');
		eval('form.ap_menu_cad.style.background="white"');
		valida = false;
  }
  return valida
}
//-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroMenu" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td class="admtitulo" height="35">&nbsp;Edição de Menu</td>
		</tr>
		<tr>
			<td valign="top"><div id="Edicao" class="divEdicao">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr height="30">
							<td width="30%" class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><%
If Not fnc_TestaVar(cd_menu_cad) Then
%>
								Novo Registro
								<input name="cd_menu_cad" type="hidden" value="<%= cd_menu_cad%>">
								<%
Else
%>
								<input name="cd_menu_cad" type="text" disabled class="editbox" id="codigo" style="width:50px; background-color: #CCCCCC;" tabindex="0" value="<%= cd_menu_cad%>" maxlength="2">
								<input name="cd_menu_cad" type="hidden" value="<%= cd_menu_cad%>">
								<%
End If
%>
							</td>
						</tr>
						<tr>
							<td class="admlabel"><label for="nome">Nome:</label></td>
							<td class="admdados"><input name="nm_menu_cad" type="text" class="admeditbox" id="nome" size="36" maxlength="50" value="<%= nm_menu_cad%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="eng">Inglês:</label></td>
							<td class="admdados"><input name="nm_eng" type="text" class="admeditbox" id="eng" size="36" maxlength="50" value="<%= nm_eng%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="esp">Espanhol:</label></td>
							<td class="admdados"><input name="nm_esp" type="text" class="admeditbox" id="esp" size="36" maxlength="50" value="<%= nm_esp%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="apelido">Apelido:</label></td>
							<td class="admdados"><input name="ap_menu_cad" type="text" class="admeditbox" id="apelido" size="36" maxlength="10" value="<%= ap_menu_cad%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="ordem">Nr. Ordem:</label></td>
							<td class="admdados"><input name="nr_ordem" type="text" class="admeditbox" id="ordem" size="5" maxlength="3" value="<%= nr_ordem%>">
								&ordm;</td>
						</tr>
						<tr>
							<td class="admlabel">Ativo:</td>
							<td class="admdados"><input name="in_ativo" type="radio" class="admradio" id="sim" value="1"<% If in_ativo = 1 or in_ativo = True Then Response.Write(" checked")%>>
								<label for="sim">Sim</label>
								<input name="in_ativo" type="radio" class="admradio" id="nao" value="0"<% If in_ativo = 0 or in_ativo = False Then Response.Write(" checked")%>>
								<label for="nao">N&atilde;o</label></td>
						</tr>
					</table>
				</div></td>
		</tr>
		<tr bgcolor="#DDDDDD" height="35">
			<td colspan="2" align="center"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
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
document.frmCadastroMenu.nm_menu_cad.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
