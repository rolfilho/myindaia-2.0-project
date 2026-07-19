<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Administração
'Arquivo de Script e HTML: Edição de Sub-Menu
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
Dim cd_subm_cad
Dim nm_subm_cad
Dim ap_subm_cad
Dim nm_eng
Dim nm_esp
Dim ex_embarque
Dim ex_dt_prev
Dim ex_download
Dim ex_email
Dim ex_print
Dim ex_doctos
Dim ex_relat
Dim ex_quebra
Dim ex_evento
Dim ex_dias
Dim ex_ordem
Dim nr_ordem
Dim in_ativo
Dim nr_max_filtro
Dim nr_max_campo
Dim in_view 
Dim in_tipo  'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao  'ação que está ocorrendo na tabela

in_show   = True
cd_tela   = "ADM004"
cd_menu   = Request("cd_menu")
cd_subm   = Request("cd_subm")
cd_docto  = Request("cd_docto")
in_acao   = Request("in_acao")
tx_erro   = Request("tx_erro")
tx_campo  = CStr(Request("tx_campo"))
tx_ordem  = CStr(Request("tx_ordem"))
nr_pagina = CInt(Request("nr_pagina"))
tx_link   = "subm_edt.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&tx_campo="&tx_campo&"&tx_ordem="&tx_ordem

Function fnc_UltimoNrOrdem(cd_menu_cad)
  Dim return
	
	sql = "SELECT MAX(M02_NR_ORDEM) AS VL_MAX_NR_ORDEM FROM M02_SUBM (NOLOCK) WHERE M02_CD_MENU = '"& cd_menu_cad &"'"
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
	cd_subm_cad = ""
	nm_subm_cad = ""
	ap_subm_cad = ""
	nm_eng      = ""
	nm_esp      = ""
	ex_embarque = 1
	ex_dt_prev  = 1
	ex_download = 1
	ex_email    = 0
	ex_print    = 1
	ex_doctos   = 0
	ex_relat    = 0
	ex_quebra   = 1
	ex_evento   = 1
	ex_dias     = 1
	ex_ordem    = 0
	nr_ordem    = fnc_UltimoNrOrdem(cd_menu_cad)
	in_ativo    = 1
	nr_max_filtro = 25
	nr_max_campo  = 75
	in_view     = 1
	in_tipo     = "incluir"
End If
'inclui o registro novo
If in_acao = "incluir" Then
  cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad = CStr(Request.Form("cd_subm_cad"))
  nm_subm_cad = CStr(Request.Form("nm_subm_cad"))
  ap_subm_cad = CStr(Request.Form("ap_subm_cad"))
	nm_eng      = CStr(Request.Form("nm_eng"))
	nm_esp      = CStr(Request.Form("nm_esp"))
	ex_embarque = CInt(Request.Form("ex_embarque"))
	ex_dt_prev  = CInt(Request.Form("ex_dt_prev"))
	ex_download = CInt(Request.Form("ex_download"))
	ex_email    = CInt(Request.Form("ex_email"))
	ex_print    = CInt(Request.Form("ex_print"))
	ex_doctos   = CInt(Request.Form("ex_doctos"))
	ex_relat    = CInt(Request.Form("ex_relat"))
	ex_quebra   = CInt(Request.Form("ex_quebra"))
	ex_evento   = CInt(Request.Form("ex_evento"))
	ex_dias     = CInt(Request.Form("ex_dias"))
	ex_ordem    = CInt(Request.Form("ex_ordem"))
  nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
	nr_max_filtro = CInt(Request.Form("nr_max_filtro"))
	nr_max_campo  = CInt(Request.Form("nr_max_campo"))
	in_view     = CInt(Request.Form("in_view"))
  in_tipo     = "incluir"
  
  'verifica se as variaves não estão vazias
  If cd_menu_cad = "" or nm_subm_cad = "" or ap_subm_cad = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(cd_menu_cad) Then tx_erro = tx_erro & "- Código do Menu;\n"
		If Not fnc_TestaVar(nm_subm_cad) Then tx_erro = tx_erro & "- Nome do Sub-Menu;\n"
		If Not fnc_TestaVar(ap_subm_cad) Then tx_erro = tx_erro & "- Apelido do Sub-Menu;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(ex_embarque) Then ex_embarque = 1
		If Not fnc_TestaVar(ex_dt_prev)  Then ex_dt_prev  = 1
		If Not fnc_TestaVar(ex_download) Then ex_download = 1
		If Not fnc_TestaVar(ex_email)    Then ex_email    = 0
		If Not fnc_TestaVar(ex_print)    Then ex_print    = 1
		If Not fnc_TestaVar(ex_doctos)   Then ex_doctos   = 0
		If Not fnc_TestaVar(ex_relat)    Then ex_relat    = 0
		If Not fnc_TestaVar(ex_quebra)   Then ex_quebra   = 1
		If Not fnc_TestaVar(ex_evento)   Then ex_evento   = 1
		If Not fnc_TestaVar(ex_dias)     Then ex_dias     = 1
		If Not fnc_TestaVar(ex_ordem)    Then ex_ordem    = 0
		If Not fnc_TestaVar(nr_ordem)    Then nr_ordem    = fnc_UltimoNrOrdem(cd_menu_cad)
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		If Not fnc_TestaVar(nr_max_filtro) Then nr_max_filtro = 25
		If Not fnc_TestaVar(nr_max_campo)  Then nr_max_campo  = 75
		If Not fnc_TestaVar(in_view)     Then in_view     = 1
		'cria o código do limitador
		sql = "SELECT ISNULL(MAX(M02_CD_SUBM), 0) AS CD_ULTIMO "&_
					"FROM M02_SUBM (NOLOCK)"&_
					"WHERE M02_CD_MENU = '"& cd_menu_cad &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'cria o código para o registro
		cd_subm_cad = fnc_AddZeros(objrs.Fields.Item("CD_ULTIMO").Value + 1, 2)
		objrs.Close
		'caso seja nulo, seta o código para 001
		If Not fnc_TestaVar(cd_subm_cad) Then cd_subm_cad = "01"
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad)
		if nr_ordem > num then nr_ordem = num
		'monta a instrução sql de inclusão de sub-menu
		sql = "INSERT INTO M02_SUBM ( "&_
					"  M02_CD_MENU, M02_CD_SUBM, M02_NM_SUBM, M02_NM_ENG, M02_NM_ESP, M02_AP_SUBM, "&_
					"  M02_EX_EMBARQUE, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, "&_
					"  M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, M02_EX_EVENTO, M02_EX_DIAS, M02_EX_ORDEM, "&_
					"  M02_NR_ORDEM, M02_IN_ATIVO, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO, M02_IN_VIEW )"&_
	  	  	"VALUES ('"&_
						 cd_menu_cad &"', '"& cd_subm_cad &"', '"& nm_subm_cad &"', "& fnc_QuotedSQL(nm_eng) &", "& fnc_QuotedSQL(nm_esp) &", '"& ap_subm_cad &"', "&_
						 ex_embarque &", "& ex_dt_prev &", "& ex_download &", "& ex_email &", "& ex_print &", "&_
						 ex_doctos &", "& ex_relat &", "& ex_quebra &", "& ex_evento &", "& ex_dias &", "& ex_ordem &", "&_
						 nr_ordem &", "& in_ativo &", "& nr_max_filtro &", "& nr_max_campo &", "& in_view &")"
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'altera o numero da ordem
	  	if nr_ordem < num Then
	    	'numero da ordem menor que o ultimo, aumenta em 1 os subsequentes ao valor de nr_ordem
				sql = "UPDATE M02_SUBM SET "&_
			  			"  M02_NR_ORDEM = M02_NR_ORDEM + 1 "&_
			  			"WHERE M02_CD_MENU   = '"& cd_menu_cad &"' "&_
							"  AND M02_CD_SUBM  <> '"& cd_subm_cad &"' "&_
			  			"  AND M02_NR_ORDEM >= "& nr_ordem
				'Response.Write(sql &"<br>")
	  		objcnn.Execute(sql)
				
				If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação dos campos.\n"& err.Description
	  	End If
	  	'inclui o menu para todos usuários que tem permissão no site
	  	sql = "INSERT INTO M09_ACESSO ( "&_
						"  M09_CD_USUARIO, M09_CD_MENU, M09_CD_SUBM, M09_IN_ACESSO "&_
						") "&_
						"SELECT DISTINCT "&_
						"  M09_CD_USUARIO, '"& cd_menu_cad &"', '"& cd_subm_cad &"', 0 "&_
						"FROM M09_ACESSO ( NOLOCK ) "
	  	'Response.Write(sql &"<br>")
	  	objcnn.Execute(sql)
			
			in_tipo = "alterar"
	  	tx_erro = "(CAD11):\n - SUB-MENU "& cd_subm_cad &"("& nm_subm_cad &") incluído com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"subm_edt","subm",1,1)&"&in_acao=lista&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad="&cd_subm_cad&"';"&_
										 "document.location='"&tx_link&"&in_acao=editar&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad="&cd_subm_cad&"&tx_erro="& Server.URLEncode(tx_erro)&"';</script>")
		Else
	  	tx_erro = "(CAD02):\n - SUB-MENU "& cd_subm_cad &"("& nm_subm_cad &") não incluído."
		End If
  End If
End If
'inicia o modo de edição
If in_acao = "editar" Then
  cd_menu_cad = CStr(Request("cd_menu_cad"))
	cd_subm_cad = CStr(Request("cd_subm_cad"))
  in_tipo     = "alterar"
	
	sql = "SELECT M02_CD_MENU, M02_CD_SUBM, M02_NM_SUBM, M02_NM_ENG, M02_NM_ESP, M02_AP_SUBM, "&_
				"  M02_EX_EMBARQUE, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, "&_
				"  M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, M02_EX_EVENTO, M02_EX_DIAS, M02_EX_ORDEM, "&_
				"  M02_NR_ORDEM, M02_IN_ATIVO, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO, M02_IN_VIEW "&_
				"FROM M02_SUBM ( NOLOCK ) " &_
				"WHERE M02_CD_MENU = '"& cd_menu_cad &"' " &_
				"  AND M02_CD_SUBM = '"& cd_subm_cad &"'"
	'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
  If objrs.RecordCount > 0 Then
		cd_menu_cad = objrs.Fields.Item("M02_CD_MENU").Value
		cd_subm_cad = objrs.Fields.Item("M02_CD_SUBM").Value
    nm_subm_cad = objrs.Fields.Item("M02_NM_SUBM").Value
		ap_subm_cad = objrs.Fields.Item("M02_AP_SUBM").Value
		nm_eng      = objrs.Fields.Item("M02_NM_ENG").Value
		nm_esp      = objrs.Fields.Item("M02_NM_ESP").Value
		ex_embarque = objrs.Fields.Item("M02_EX_EMBARQUE").Value
		ex_dt_prev  = objrs.Fields.Item("M02_EX_DT_PREV").Value
		ex_download = objrs.Fields.Item("M02_EX_DOWNLOAD").Value
		ex_email    = objrs.Fields.Item("M02_EX_EMAIL").Value
		ex_print    = objrs.Fields.Item("M02_EX_PRINT").Value
		ex_doctos   = objrs.Fields.Item("M02_EX_DOCTOS").Value
		ex_relat    = objrs.Fields.Item("M02_EX_RELAT").Value
		ex_quebra   = objrs.Fields.Item("M02_EX_QUEBRA").Value
		ex_evento   = objrs.Fields.Item("M02_EX_EVENTO").Value
		ex_dias     = objrs.Fields.Item("M02_EX_DIAS").Value
		ex_ordem    = objrs.Fields.Item("M02_EX_ORDEM").Value
		nr_ordem    = objrs.Fields.Item("M02_NR_ORDEM").Value
		in_ativo    = objrs.Fields.Item("M02_IN_ATIVO").Value
		nr_max_filtro = objrs.Fields.Item("M02_NR_MAX_FILTRO").Value
		nr_max_campo  = objrs.Fields.Item("M02_NR_MAX_CAMPO").Value
		in_view     = objrs.Fields.Item("M02_IN_VIEW").Value
	Else
		tx_erro = "(CAD03):\n SUB-MENU "& cd_subm_cad &" não encontrado."
		Response.Redirect(tx_link&"&in_acao=novo&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad="&cd_subm_cad&"&tx_erro="& Server.URLEncode(tx_erro))
  End If
  objrs.Close
End If
'altera os dados do menu selecionado
If in_acao = "alterar" Then
	cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad = CStr(Request.Form("cd_subm_cad"))
  nm_subm_cad = CStr(Request.Form("nm_subm_cad"))
  ap_subm_cad = CStr(Request.Form("ap_subm_cad"))
	nm_eng      = CStr(Request.Form("nm_eng"))
	nm_esp      = CStr(Request.Form("nm_esp"))
	ex_embarque = CInt(Request.Form("ex_embarque"))
	ex_dt_prev  = CInt(Request.Form("ex_dt_prev"))
	ex_download = CInt(Request.Form("ex_download"))
	ex_email    = CInt(Request.Form("ex_email"))
	ex_print    = CInt(Request.Form("ex_print"))
	ex_doctos   = CInt(Request.Form("ex_doctos"))
	ex_relat    = CInt(Request.Form("ex_relat"))
	ex_quebra   = CInt(Request.Form("ex_quebra"))
	ex_evento   = CInt(Request.Form("ex_evento"))
	ex_dias     = CInt(Request.Form("ex_dias"))
	ex_ordem    = CInt(Request.Form("ex_ordem"))
  nr_ordem    = CInt(Request.Form("nr_ordem"))
  in_ativo    = CInt(Request.Form("in_ativo"))
	nr_max_filtro = CInt(Request.Form("nr_max_filtro"))
	nr_max_campo  = CInt(Request.Form("nr_max_campo"))
	in_view     = CInt(Request.Form("in_view"))
  in_tipo     = "alterar"
  'verifica se as variaves não estão vazias
  If cd_menu_cad = "" or cd_subm_cad = "" or nm_subm_cad = "" or ap_subm_cad = "" Then
    tx_erro = "(CAD01): os seguintes campos devem ser preenchidos.\n"
		If Not fnc_TestaVar(cd_menu_cad) Then tx_erro = tx_erro & "- Código do Menu;\n"
		If Not fnc_TestaVar(cd_subm_cad) Then tx_erro = tx_erro & "- Código do Sub-Menu;\n"
		If Not fnc_TestaVar(nm_subm_cad) Then tx_erro = tx_erro & "- Nome do Sub-Menu;\n"
		If Not fnc_TestaVar(ap_subm_cad) Then tx_erro = tx_erro & "- Apelido do Sub-Menu;\n"
  Else
		'define padrões caso o variavel seja invalida
		If Not fnc_TestaVar(ex_embarque) Then ex_embarque = 1
		If Not fnc_TestaVar(ex_dt_prev)  Then ex_dt_prev  = 1
		If Not fnc_TestaVar(ex_download) Then ex_download = 1
		If Not fnc_TestaVar(ex_email)    Then ex_email    = 0
		If Not fnc_TestaVar(ex_print)    Then ex_print    = 1
		If Not fnc_TestaVar(ex_doctos)   Then ex_doctos   = 0
		If Not fnc_TestaVar(ex_relat)    Then ex_relat    = 0
		If Not fnc_TestaVar(ex_quebra)   Then ex_quebra   = 1
		If Not fnc_TestaVar(ex_evento)   Then ex_evento   = 1
		If Not fnc_TestaVar(ex_dias)     Then ex_dias     = 1
		If Not fnc_TestaVar(ex_ordem)    Then ex_ordem    = 0
		If Not fnc_TestaVar(nr_ordem)    Then nr_ordem    = fnc_UltimoNrOrdem(cd_menu_cad)
		If Not fnc_TestaVar(in_ativo)    Then in_ativo    = 1
		If Not fnc_TestaVar(nr_max_filtro) Then nr_max_filtro = 25
		If Not fnc_TestaVar(nr_max_campo)  Then nr_max_campo  = 75
		If Not fnc_TestaVar(in_view)     Then in_view     = 1
		'seleciona o ultimo número de ordenação
		num = fnc_UltimoNrOrdem(cd_menu_cad)
		if nr_ordem > num then nr_ordem = num
		'seleciona o numero atual de ordem
		x = fnc_ConsultaLookup("M02_SUBM","M02_CD_MENU+M02_CD_SUBM",cd_menu_cad&cd_subm_cad,"M02_NR_ORDEM")
		'atualiza a tabela com os novos dados
		sql = "UPDATE M02_SUBM SET "&_
					"  M02_NM_SUBM     = '"& nm_subm_cad &"', "&_
					"  M02_NM_ENG      = "& fnc_QuotedSQL(nm_eng) &", "&_
					"  M02_NM_ESP      = "& fnc_QuotedSQL(nm_esp) &", "&_
					"  M02_AP_SUBM     = '"& ap_subm_cad &"', "&_
					"  M02_EX_EMBARQUE = "& ex_embarque &", "&_
					"  M02_EX_DT_PREV  = "& ex_dt_prev  &", "&_
					"  M02_EX_DOWNLOAD = "& ex_download &", "&_
					"  M02_EX_EMAIL    = "& ex_email    &", "&_
					"  M02_EX_PRINT    = "& ex_print    &", "&_
					"  M02_EX_DOCTOS   = "& ex_doctos   &", "&_
					"  M02_EX_RELAT    = "& ex_relat    &", "&_
					"  M02_EX_QUEBRA   = "& ex_quebra   &", "&_
					"  M02_EX_EVENTO   = "& ex_evento   &", "&_
					"  M02_EX_DIAS     = "& ex_dias     &", "&_
					"  M02_EX_ORDEM    = "& ex_ordem    &", "&_
				  "  M02_NR_ORDEM    = "& nr_ordem    &", "&_
				  "  M02_IN_ATIVO    = "& in_ativo    &", "&_
					"  M02_NR_MAX_FILTRO = "& nr_max_filtro &", "&_
					"  M02_NR_MAX_CAMPO  = "& nr_max_campo &", "&_
					"  M02_IN_VIEW     = "& in_view &_
				  "WHERE M02_CD_MENU = '"& cd_menu_cad &"' " &_
			  	"  AND M02_CD_SUBM = '"& cd_subm_cad &"' "
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			'verifica se houve alteração no nr. de oredem
			If CInt(x) <> CInt(nr_ordem) Then
				if CInt(nr_ordem) < CInt(x) then
					sql = "UPDATE M02_SUBM SET "&_
								"  M02_NR_ORDEM = M02_NR_ORDEM + 1 "&_
								"WHERE M02_CD_MENU   = '"& cd_menu_cad &"' "&_
								"  AND M02_CD_SUBM  <> '"& cd_subm_cad &"' "&_
								"  AND M02_NR_ORDEM BETWEEN "& nr_ordem &" AND "& x
				elseif CInt(nr_ordem) > CInt(x) then
					sql = "UPDATE M02_SUBM SET "&_
								"  M02_NR_ORDEM = M02_NR_ORDEM - 1 "&_
								"WHERE M02_CD_MENU = '"& cd_menu_cad &"' "&_
								"  AND M02_CD_SUBM = '"& cd_subm_cad &"' "&_
								"  AND M02_NR_ORDEM BETWEEN "& x &" AND "& nr_ordem
				end if
				'Response.Write(sql &"<br>")
				objcnn.Execute(sql)
				
				If err.Number <> 0 Then tx_erro = "ERRO:\n\n - Falha ao alterar a ordenação do Sub-Menu.\n"& err.Description
			End If
			
			tx_erro = "(CAD12):\n - SUB-MENU "& cd_subm &"("& nm_subm &") alterado com sucesso."
			Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"subm_edt","subm",1,1)&"&in_acao=lista&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad="&cd_subm_cad&"'</script>")
		Else
	  	tx_erro = "(CAD04):\n - SUB-MENU "& cd_subm &"("& nm_subm &") não alterado."
		End If
  End If
End If
'exclusão de sub-menu
If in_acao = "excluir" Then
	cd_menu_cad = CStr(Request.Form("cd_menu_cad"))
	cd_subm_cad = CStr(Request.Form("cd_subm_cad"))
	If Trim(cd_menu_cad) = "" and Trim(cd_subm_cad) = "" Then
    tx_erro = "CAD(05):\n - Nenhum registro selecionado para exclusão"
  Else
		'verifica se não existem eventos, campos, filtros ou viwes utilizando o registro
		sql = "SELECT COUNT(*) AS TOTAL " &_
					"FROM M02_SUBM (NOLOCK) " &_
					"  LEFT JOIN M03_LIMITADOR (NOLOCK) ON M03_CD_MENU = M02_CD_MENU AND M03_CD_SUBM = M02_CD_SUBM " &_
					"  LEFT JOIN M06_VIEW      (NOLOCK) ON M06_CD_MENU = M02_CD_MENU AND M06_CD_SUBM = M02_CD_SUBM " &_
					"  LEFT JOIN M08_DOCTOS    (NOLOCK) ON M08_CD_MENU = M02_CD_MENU AND M08_CD_SUBM = M02_CD_SUBM " &_
					"  LEFT JOIN M11_FILTRO    (NOLOCK) ON M11_CD_MENU = M02_CD_MENU AND M11_CD_SUBM = M02_CD_SUBM " &_
					"  LEFT JOIN M12_CAMPO     (NOLOCK) ON M12_CD_MENU = M02_CD_MENU AND M12_CD_SUBM = M02_CD_SUBM " &_
					"WHERE M02_CD_MENU = '"& cd_menu_cad &"' " &_
					"  AND M02_CD_SUBM = '"& cd_subm_cad &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly', adCmdTable
  
    If objrs("TOTAL") > 1 Then
	  	tx_erro = "CAD(06):\n - Existem "& objrs.Fields.Item("TOTAL").Value &" Campos/Filtros/Limitadores/Personalizações utilizando o Sub-menu "& cd_subm &".\n Você pode desativar este sub-menu, caso não queira que ele apareça no site."
    Else
      objrs.Close
			'seleciona o numero de ordem antes da exclusão
			sql = "SELECT M02_NR_ORDEM " &_
						"FROM M02_SUBM ( NOLOCK ) " &_
						"WHERE M02_CD_MENU = '"& cd_menu_cad &"' " &_
						"  AND M02_CD_SUBM = '"& cd_subm_cad &"'"
			objrs.Open sql, objcnn, 3, 1
			nr_ordem = objrs.Fields.Item("M01_NR_ORDEM").Value - 1
			'exclui o registro selecionado
			sql = "DELETE FROM M02_SUBM " &_
						"WHERE M02_CD_MENU = '"& cd_menu_cad &"' " &_
						"  AND M02_CD_SUBM = '"& cd_subm_cad &"'"
			objcnn.Execute(sql)
			'atualiza a ordem dos sub-menus
			If Err.Number = 0 Then
				sql = "UPDATE M02_SUBM " &_
							"   SET M02_NR_ORDEM = M02_NR_ORDEM - 1 " &_
							" WHERE M02_CD_MENU  = '"& cd_menu_cad &"' " &_
							"   AND M02_NR_ORDEM =  "& nr_ordem
				'Response.Write(sql &"<br>")
				objcnn.Execute(sql)
				'exclui o menu de todos usuários que tem permissão no site
				sql = "DELETE FROM M09_ACESSO "&_
							"WHERE M09_CD_MENU = '"& cd_menu_cad &"' "&_
							"  AND M09_CD_SUBM = '"& cd_subm_cad &"' "
				objcnn.Execute(sql)
				
				tx_erro = "CAD(13):\n - Código: " & cd_subm_cad &"."
				'redireciona para a página de cadastro
				Response.Write("<script>window.opener.location.href='"&Replace(tx_link,"subm_edt","subm",1,1)&"&in_acao=lista&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad='</script>")
				Response.Redirect(tx_link &"&in_acao=novo&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad=&tx_erro="& Server.URLEncode(tx_erro))
			Else
				tx_erro = "CAD(07):\n - Não foi possível excluir o SUB-MENU "& cd_subm_cad
				Response.Redirect(tx_link &"&in_acao=editar&cd_menu_cad="&cd_menu_cad&"&cd_subm_cad="&cd_subm_cad&"&tx_erro="& Server.URLEncode(tx_erro))
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
<script language="JavaScript" type="text/JavaScript">
<!--
function fnc_FocusCampo() {
  with (document.cadsubm) {
    if (cd_menu_cad.value == '') cd_menu_cad.focus()
		else if (nm_subm_cad.value == '') nm_subm_cad.focus()
		else nr_ordem.focus();
  }
}

function fnc_ConsultaCodigo(campo) {
	with (document.frmCadastroSubMenu) {
		if (campo == 'menu') {
			var codigo = cd_menu_cad.value;
			if (codigo.length > 0 && codigo.length <= 2 && codigo != 0) {
				for (i = codigo.length; i < 2; i++)
					codigo = '0'+ String(codigo);
				cd_menu_cad.value = codigo;
				nm_menu_cad.value = codigo;
				eval("self.location = '<%= tx_link%>&in_acao=novo&cd_menu_cad="+codigo+"'");
			} else {
				cd_menu_cad.value = '';
				nm_menu_cad.value = '';
			}
		}
	}  //encerra o with
}  //encerra a function

function fnc_InsereCodigo(campo) {
  with (document.frmCadastroSubMenu) {
    if (campo == 'menu') {
	  cd_menu_cad.value = nm_menu_cad.options[nm_menu_cad.selectedIndex].value;
	  eval("self.location = '<%= tx_link%>&in_acao=novo&cd_menu_cad="+cd_menu_cad.value+"'");
    }
  }
}

function fnc_ValidaForm(form) {
  var valida = true;
  //VALIDA O MENU
  if (form.cd_menu_cad.value == '') {
    eval('form.cd_menu_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- Código do SUB-MENU não especificao!');
		eval('form.cd_menu_cad.style.background="white"');
		valida = false;
  } else {
    if (form.cd_menu_cad.value != form.nm_menu_cad.value) {
      eval('form.cd_menu_cad.style.background="red"');
	  	alert('ATENÇÃO:\n\n- Código do SUB-MENU inválido!');
	  	eval('form.cd_menu_cad.style.background="white"');
	  	valida = false;
		}
  }
  //VALIDA O NOME DO SUB-MENU
  if (form.nm_subm_cad.value == '') {
    eval('form.nm_subm_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- NOME DO SUB-MENU não especificao!');
		eval('form.nm_subm_cad.style.background="white"');
		valida = false;
  }
  //VALIDA O APELIDO DO SUB-MENU
  if (form.ap_subm_cad.value == '') {
    eval('form.ap_subm_cad.style.background="red"');
		alert('ATENÇÃO:\n\n- APELIDO DO SUB-MENU não especificao!');
		eval('form.ap_subm_cad.style.background="white"');
		valida = false;
  }
  return valida
}
//-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<form action="<%= tx_link%>" method="post" name="frmCadastroSubMenu" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td height="35" class="admtitulo">&nbsp;Edição de Sub-Menus</td>
		</tr>
		<tr>
			<td valign="top"><div id="Edicao" class="divEdicao">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr>
							<td height="30" class="admlabel"><label for="menu">Menu:</label></td>
							<%
If in_acao = "novo" or in_acao = "incluir" Then
%>
							<td class="admdados"><input name="cd_menu_cad" id="menu" type="text" class="editbox" style="width: 50px;" maxlength="2" tabindex="0" value="<%= cd_menu_cad%>" onBlur="fnc_ConsultaCodigo('menu');">
								<select name="nm_menu_cad" class="select" style="width: 150px;" onChange="fnc_InsereCodigo('menu');">
									<option selected value="">Selecione um Menu...</option>
									<%
  'seleciona todos os menus ativos
  sql = "SELECT M01_CD_MENU, M01_NM_MENU FROM M01_MENU ( NOLOCK ) WHERE M01_IN_ATIVO = 1 ORDER BY M01_CD_MENU"
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
  'seleciona o nome do menu
  sql = "SELECT M01_CD_MENU, M01_NM_MENU FROM M01_MENU (NOLOCK) WHERE M01_CD_MENU = '"&cd_menu&"'"
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
							<td width="30%" class="admlabel"><label for="codigo">C&oacute;digo:</label></td>
							<td class="admdados"><%
If Not fnc_TestaVar(cd_subm_cad) Then
%>
								Novo Registro
								<input name="cd_subm_cad" type="hidden" value="<%= cd_subm_cad%>">
								<%
Else
%>
								<input name="cd_subm_cad" type="text" disabled class="editbox" id="codigo" style="width:50px; background-color: #CCCCCC;" tabindex="0" value="<%= cd_subm_cad%>" maxlength="2">
								<input name="cd_subm_cad" type="hidden" value="<%= cd_subm_cad%>">
								<%
End If
%>
							</td>
						</tr>
						<tr>
							<td class="admlabel"><label for="nome">Nome:</label></td>
							<td class="admdados"><input name="nm_subm_cad" type="text" class="editbox" id="nome" style="width:200px;" maxlength="50" value="<%= nm_subm_cad%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="eng">Inglês:</label></td>
							<td class="admdados"><input name="nm_eng" type="text" class="admeditbox" id="eng" style="width:200px;" maxlength="50" value="<%= nm_eng%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="esp">Espanhol:</label></td>
							<td class="admdados"><input name="nm_esp" type="text" class="admeditbox" id="esp" style="width:200px;" maxlength="50" value="<%= nm_esp%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="apelido">Apelido:</label></td>
							<td class="admdados"><input name="ap_subm_cad" type="text" class="editbox" id="nome" style="width:200px;" maxlength="10" value="<%= ap_subm_cad%>"></td>
						</tr>
						<tr>
							<td class="admlabel">Embarque:</td>
							<td class="admdados"><input name="ex_embarque" type="radio" class="radio" id="sim0" value="1"<% If ex_embarque = 1 or ex_embarque = True Then Response.Write(" checked")%>>
								<label for="sim0">Sim</label>
								<input name="ex_embarque" type="radio" class="radio" id="nao0" value="0"<% If ex_embarque = 0 or ex_embarque = False Then Response.Write(" checked")%>>
								<label for="nao0">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Data Prevista:</td>
							<td class="admdados"><input name="ex_dt_prev" type="radio" class="radio" id="sim1" value="1"<% If ex_dt_prev = 1 or ex_dt_prev = True Then Response.Write(" checked")%>>
								<label for="sim1">Sim</label>
								<input name="ex_dt_prev" type="radio" class="radio" id="nao1" value="0"<% If ex_dt_prev = 0 or ex_dt_prev = False Then Response.Write(" checked")%>>
								<label for="nao1">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Download:</td>
							<td class="admdados"><input name="ex_download" type="radio" class="radio" id="sim2" value="1"<% If ex_download = 1 or ex_download = True Then Response.Write(" checked")%>>
								<label for="sim2">Sim</label>
								<input name="ex_download" type="radio" class="radio" id="nao2" value="0"<% If ex_download = 0 or ex_download = False Then Response.Write(" checked")%>>
								<label for="nao2">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Email:</td>
							<td class="admdados"><input name="ex_email" type="radio" class="radio" id="sim3" value="1"<% If ex_email = 1 or ex_email = True Then Response.Write(" checked")%>>
								<label for="sim3">Sim</label>
								<input name="ex_email" type="radio" class="radio" id="nao3" value="0"<% If ex_email = 0 or ex_email = False Then Response.Write(" checked")%>>
								<label for="nao3">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Impressão:</td>
							<td class="admdados"><input name="ex_print" type="radio" class="radio" id="sim4" value="1"<% If ex_print = 1 or ex_print = True Then Response.Write(" checked")%>>
								<label for="sim4">Sim</label>
								<input name="ex_print" type="radio" class="radio" id="nao4" value="0"<% If ex_print = 0 or ex_print = False Then Response.Write(" checked")%>>
								<label for="nao4">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Documentos:</td>
							<td class="admdados"><input name="ex_doctos" type="radio" class="radio" id="sim5" value="1"<% If ex_doctos = 1 or ex_doctos = True Then Response.Write(" checked")%>>
								<label for="sim5">Sim</label>
								<input name="ex_doctos" type="radio" class="radio" id="nao5" value="0"<% If ex_doctos = 0 or ex_doctos = False Then Response.Write(" checked")%>>
								<label for="nao5">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Quebra:</td>
							<td class="admdados"><input name="ex_quebra" type="radio" class="radio" id="sim6" value="1"<% If ex_quebra = 1 or ex_quebra = True Then Response.Write(" checked")%>>
								<label for="sim6">Sim</label>
								<input name="ex_quebra" type="radio" class="radio" id="nao6" value="0"<% If ex_quebra = 0 or ex_quebra = False Then Response.Write(" checked")%>>
								<label for="nao6">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Limitador:</td>
							<td class="admdados"><input name="ex_evento" type="radio" class="radio" id="sim7" value="1"<% If ex_evento = 1 or ex_evento = True Then Response.Write(" checked")%>>
								<label for="sim7">Sim</label>
								<input name="ex_evento" type="radio" class="radio" id="nao7" value="0"<% If ex_evento = 0 or ex_evento = False Then Response.Write(" checked")%>>
								<label for="nao7">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Dias:</td>
							<td class="admdados"><input name="ex_dias" type="radio" class="radio" id="sim8" value="1"<% If ex_dias = 1 or ex_dias = True Then Response.Write(" checked")%>>
								<label for="sim8">Sim</label>
								<input name="ex_dias" type="radio" class="radio" id="nao8" value="0"<% If ex_dias = 0 or ex_dias = False Then Response.Write(" checked")%>>
								<label for="nao8">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel">Ordenação:</td>
							<td class="admdados"><input name="ex_ordem" type="radio" class="radio" id="sim9" value="1"<% If ex_ordem = 1 or ex_ordem = True Then Response.Write(" checked")%>>
								<label for="sim9">Sim</label>
								<input name="ex_ordem" type="radio" class="radio" id="nao9" value="0"<% If ex_ordem = 0 or ex_ordem = False Then Response.Write(" checked")%>>
								<label for="nao9">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="filtros">Máx. Filtros:</label></td>
							<td class="admdados"><input name="nr_max_filtro" type="text" class="editbox" id="filtros" style="width:50px;" maxlength="2" value="<%= nr_max_filtro%>"></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="campos">Máx. Campos:</label></td>
							<td class="admdados"><input name="nr_max_campo" type="text" class="editbox" id="campos" style="width:50px;" maxlength="2" value="<%= nr_max_campo%>"></td>
						</tr>
						<tr>
							<td class="admlabel">Personaliza:</td>
							<td class="admdados"><input name="in_view" type="radio" class="radio" id="sim10" value="1"<% If in_view = 1 or in_view = True Then Response.Write(" checked")%>>
								<label for="sim10">Sim</label>
								<input name="in_view" type="radio" class="radio" id="nao10" value="0"<% If in_view = 0 or in_view = False Then Response.Write(" checked")%>>
								<label for="nao10">N&atilde;o</label></td>
						</tr>
						<tr>
							<td class="admlabel"><label for="ordem">Ordem:</label></td>
							<td class="admdados"><input name="nr_ordem" type="text" class="editbox" id="ordem" style="width:50px;" maxlength="3" value="<%= nr_ordem%>">
								&ordm;</td>
						</tr>
						<tr>
							<td class="admlabel">Ativo:</td>
							<td class="admdados"><input name="in_ativo" type="radio" class="radio" id="sim" value="1"<% If in_ativo = 1 or in_ativo = True Then Response.Write(" checked")%>>
								<label for="sim">Sim</label>
								<input name="in_ativo" type="radio" class="radio" id="nao" value="0"<% If in_ativo = 0 or in_ativo = False Then Response.Write(" checked")%>>
								<label for="nao">N&atilde;o</label></td>
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
