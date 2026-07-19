<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Acesso de Usuário
'
'Autor Alexandre Gonçalves Neto
'Criado: 19/10/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
Session("in_valida") = true
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_menu_cad 'codigo do menu que esta sendo editado
Dim cd_subm_cad 'codigo do sub-menu que esta sendo editado
Dim nm_user, in_acesso 'campos da tabela M01_MENU
Dim in_tipo 'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao 'ação que está ocorrendo na tabela

in_show   = False
cd_tela   = "ADM018"
cd_user   = Request.QueryString("cd_user")
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "permissao_edt2.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem&"&cd_user="&cd_user
Session("sql_pagina") = Session("sql_pagina") &"<br>QUERYSTRING: "& Request.QueryString &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>FORM: "& Request.Form &"<br>"
'abre cadastro pra um novo registro

If Request("in_ok")="1" Then
%>
<script>
alert('ATENÇÃO: Alteração realizada com sucesso!');
</script>
<%	
End If			


If in_acao = "novo" Then
	cd_user   = ""
	nm_user   = ""
	in_acesso = 0 
	in_tipo   = "incluir"
End If

'inclui o registro novo
If in_acao = "incluir" Then
	nm_user = ""
	in_tipo = "alterar"
	'verifica se o usuário foi informado corretamente
	If fnc_TestaVar(cd_user) Then
		cont = 0
		For Each matriz In Request.Form("cd_menu_subm")
			'verifica se a variavel de controle de acesso é valida, se não assume zero
			in_acesso = Request.Form("in_acesso"& matriz)
			If Not fnc_TestaVar(in_acesso) Then in_acesso = 0
				'verifica de o menu e sub-menus estão informados corretamente, caso contrário não inclui
				cd_menu_cad = Left(matriz, 2)
				cd_subm_cad = Right(matriz, 2)
				If fnc_TestaVar(cd_menu_cad) and fnc_TestaVar(cd_subm_cad) Then
					sql = "INSERT INTO M09_ACESSO (M09_CD_USUARIO, M09_CD_MENU, M09_CD_SUBM, M09_IN_ACESSO) "&_
								"VALUES ('"& cd_user &"', '"& cd_menu_cad &"', '"& cd_subm_cad &"', "& in_acesso &") "
					Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
					objcnn.Execute(sql)
				Else
					cont = cont + 1
				End If
		Next
		'informa erros
		If cont > 1 Then
			tx_erro = "CAD: Falha ao dar acesso ao usuário("&cd_user&")."
		Else					
			tx_link = tx_link&"&in_acao=editar&in_ok=1"
			Response.Redirect(tx_link)
			'nm_user = fnc_ConsultaLookup("TUSUARIO","CD_USUARIO",cd_user,"NM_USUARIO")							
		End If
	End If
End If

'edita os registros
If in_acao = "editar" Then
	in_tipo = "alterar"
	
	sql = "SELECT DISTINCT M09_CD_USUARIO, NM_USUARIO " &_
				"FROM M09_ACESSO ( NOLOCK ), TUSUARIO ( NOLOCK ) " &_
				"WHERE M09_CD_USUARIO = CD_USUARIO "&_
				"  AND M09_CD_USUARIO = '"& cd_user &"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly
	
	If objrs.RecordCount < 1 Then
		tx_erro = "(CAD03):\n Usuário "& cd_user &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_user=&tx_erro="& Server.URLEncode(tx_erro))
	Else
		cd_user = CStr(objrs.Fields.Item("M09_CD_USUARIO").Value)
		nm_user = CStr(objrs.Fields.Item("NM_USUARIO").Value)
	End If
	objrs.Close
End If
'altera o registro
If in_acao = "alterar" Then
	in_tipo = "alterar"
	'verifica se o usuário foi informado corretamente
	If cd_user = "" Then
		Response.Redirect("http://www.myindaiaweb.com.br/admin/usuario/permissao_edt2.asp?cd_menu=00&cd_subm=02&cd_docto=0002-D0001&tx_campo=NM_USUARIO&tx_ordem=ASC&nr_pagina=10&in_acao=editar&cd_user="&cd_user)
	Else
		cont = 0
		For Each matriz In Request.Form("cd_menu_subm")
			'verifica se a variavel de controle de acesso é valida, se não assume zero
			in_acesso = Request.Form("in_acesso"& matriz)
			If Not fnc_TestaVar(in_acesso) Then in_acesso = 0
			'verifica de o menu e sub-menus estão informados corretamente, caso contrário não inclui
			cd_menu_cad = Left(matriz, 2)
			cd_subm_cad = Right(matriz, 2)
			If fnc_TestaVar(cd_menu_cad) and fnc_TestaVar(cd_subm_cad) Then
                sql = " DELETE FROM M09_ACESSO WHERE M09_CD_USUARIO = '" & cd_user & "' AND M09_CD_MENU = '" & cd_menu_cad & "' AND M09_CD_SUBM = '"& cd_subm_cad &"'"
		        Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
		        objcnn.Execute(sql)
                
                sql = "INSERT INTO M09_ACESSO (M09_CD_USUARIO, M09_CD_MENU, M09_CD_SUBM, M09_IN_ACESSO) "&_
					"VALUES ('"& cd_user &"', '"& cd_menu_cad &"', '"& cd_subm_cad &"', "& in_acesso &") "
				Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
				objcnn.Execute(sql)
			Else
				cont = cont + 1
			End If
		Next
		'informa erros
		If cont > 1 Then
			tx_erro = "CAD: Falha ao alterar o acesso do usuário("&cd_user&")."
			Response.Redirect(tx_link&"&in_acao=editar&cd_user="&cd_user&"&tx_erro="& Server.URLEncode(tx_erro))
		Else
			%>
            <script>
			alert('ATENÇÃO: Alteração realizada com sucesso!');
			</script>
            <%
		End If
	End If
End If
'exclui o registro
If in_acao = "excluir" Then
  cd_user = Trim(Request.QueryString("cd_user"))
	
	If Trim(cd_user) = "" Then
		tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
	Else
		'exclui o registro
		sql = "DELETE FROM M09_ACESSO " &_
					"WHERE M09_CD_USUARIO = '"& cd_user &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
		objcnn.Execute(sql)
		
		If Err.Number = 0 Then
			tx_erro = "CAD(13):\n - Código: " & cd_user &"."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"permissao_edt2","permissao",1,1)&"&in_acao=lista&cd_user="&cd_user&"';window.close();</script>")
		Else
			tx_erro = "CAD(07):\n -"
			Response.Redirect(tx_link&"&in_acao=novo&cd_user=&tx_erro="& Server.URLEncode(tx_erro))
		End If
	End If
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divEdicao {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	z-index: 1;
	overflow: auto;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function fnc_ConsultaCodigo() {
	with (document.frmCadastroAcesso) {
		if (cd_user.value.length < 4) {
			codigo = cd_user.value;
			for (i = cd_user.value.length; i < 4; i++)
				codigo = '0'+ String(codigo);
		}
		else var codigo = cd_user.value;
		nm_user.value = codigo;
		cd_user.value = codigo;
	}
}

function fnc_InsereCodigo() {
  with (document.frmCadastroAcesso) {
    cd_user.value = nm_user.options[nm_user.selectedIndex].value;
  }
}

function fnc_ValidaForm(form) {
	var valida = true;
	//VALIDA O USUARIO
	if (form.cd_user.value == '' || form.cd_user.value == '0000') {
		eval('form.cd_user.style.background="red"');
		alert('ATENÇÃO: Código de usuário não especificao!');
		eval('form.cd_user.style.background="white"');
		valida = false;
	} else {
		if (form.cd_user.value != form.nm_user.value) {
			eval('form.cd_user.style.background="red"');
			alert('ATENÇÃO: Código de usuário inválido!');
			eval('form.cd_user.style.background="white"');
			valida = false;
		}
	}
	
	if (valida == false) {
		form.cd_user.focus();
		form.cd_user.select();
	}
	return valida
}
//-->
</script>
</head>
<body<%If in_acao = "novo" or in_acao = "incluir" Then Response.Write(" onLoad='document.frmCadastroAcesso.cd_user.focus();'")%> style="border-width:0;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroAcesso" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td valign="top"><div id="dv_corpo" class="divEdicao"><table height="100%" border="0" cellpadding="0" cellspacing="1">
            
					<%
If in_acao = "novo" or in_acao = "incluir" Then
	sql = "SELECT M02_CD_MENU, M02_CD_SUBM, " &_
				"  ( M02_CD_MENU+M02_CD_SUBM ) AS CD_MENU, ( M01_NM_MENU+'<br>'+M02_NM_SUBM ) AS NM_MENU " &_
				"FROM M02_SUBM ( NOLOCK ) " &_
				"  INNER JOIN M01_MENU ( NOLOCK ) ON ( M01_CD_MENU = M02_CD_MENU AND M01_IN_ATIVO = '1') " &_
                " WHERE M02_IN_ATIVO = '1' " & _
				"ORDER BY M02_CD_MENU, M02_CD_SUBM"
Else
	sql = " SELECT M02_CD_MENU, M02_CD_SUBM, ISNULL(M09_IN_ACESSO,0) AS M09_IN_ACESSO, " &_
		  "		  (M02_CD_MENU+M02_CD_SUBM) AS CD_MENU, (M01_NM_MENU+'<br>'+M02_NM_SUBM) AS NM_MENU " &_
		  "		FROM M01_MENU   ( NOLOCK ) " &_
		  "		  INNER JOIN M02_SUBM  ( NOLOCK ) ON ( M01_CD_MENU = M02_CD_MENU AND M02_IN_ATIVO = '1')  " &_
		  "		  LEFT JOIN M09_ACESSO ( NOLOCK ) ON ( M01_CD_MENU = M09_CD_MENU AND M02_CD_SUBM = M09_CD_SUBM AND M09_CD_USUARIO = '" & cd_user &  "' ) " &_
		  "		WHERE (M02_CD_MENU+M02_CD_SUBM <> '1203') AND M01_IN_ATIVO = '1' " &_
		  "		ORDER BY M02_CD_MENU, M02_CD_SUBM "
End If
Session("sql_pagina") = Session("sql_pagina") &"<br> "& sql &"<br>"
objrsx.Open sql, objcnn, 3, 3

Do While Not objrsx.Eof
	If in_acao = "novo" or in_acao = "incluir" Then
		in_acesso = 0
	Else
		If objrsx.Fields.Item("M09_IN_ACESSO").Value Then in_acesso = 1 Else in_acesso = 0
	End If
%>
									<tr>
										<td width="626" class="admdados"><%= objrsx.Fields.Item("NM_MENU").Value%>
											<input name="cd_menu_subm" type="hidden" value="<%= objrsx.Fields.Item("CD_MENU").Value%>"></td>
										<td width="25" align="center" class="admdados"><input name="in_acesso<%= objrsx.Fields.Item("CD_MENU").Value%>" type="radio" value="1"<% If in_acesso = 1 Then Response.Write("checked")%>></td>
										<td width="25" align="center" class="admdados"><input name="in_acesso<%= objrsx.Fields.Item("CD_MENU").Value%>" type="radio" value="0"<% If in_acesso = 0 Then Response.Write("checked")%>></td>
									</tr>
									<%
  objrsx.MoveNext
Loop
objrsx.Close
%>
								</table>
							</div></td>
</td>
		</tr>
		<tr bgcolor="#DDDDDD" height="30">
			<td align="center"><input name="in_acao" type="hidden" value="<%= in_tipo%>">
				<input name="enviar" type="submit" class="admbutton" value="Salvar" style="width:100px;">
				</td>
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
