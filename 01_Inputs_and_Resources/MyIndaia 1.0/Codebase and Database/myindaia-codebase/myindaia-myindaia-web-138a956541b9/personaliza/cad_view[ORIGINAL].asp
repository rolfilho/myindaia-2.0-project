<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Personalização do Site
'Arquivo de Script e HTML: Cadastro de Personalizações
'
'Modificado por Alexandre Gonçalves Neto em 18/01/2006
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim in_padrao   'identificador de visualização padrão(0-não; 1-sim)
Dim in_download 'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_email	  'identificador para disponibilizar o recebimento do relátorio no e-mail(0-não; 1-sim)
Dim in_print	  'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_doctos   'identificador para disponibilizar a visualização de documentos scaneados(0-não; 1-sim)
Dim cd_evento	  'código do evento para alerta/exclusão
Dim nr_dias		  'número de dias para o relatório de exclusão
Dim cd_ordem    'nome dos campos de ordenação
Dim tp_ordem    'ordenação do campo(0-ascendente; 1-descendente)
Dim array_filtro'fitros da persanalização
Dim array_campo	'campos da persanalização
Dim script_filtro'nome do script do filtro
Dim script_campo 'nome do script do campo
Dim nm_page      'nome da pagina de filtros
Dim in_tipo      'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao      'ação que está ocorrendo no cadastro
Dim ex_embarque, ex_dt_prev, ex_download, ex_email, ex_print, ex_doctos
Dim ex_relat, ex_quebra, ex_evento, ex_dias, ex_ordem
Dim nr_max_filtro, nr_max_campo 'qtde máx. de filtros e campos por relatório.

in_show = True
cd_tela = "004"
nm_tela = tx_lang_004001(cd_lang) &" &gt;&gt; "
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
tx_erro = Request("tx_erro")
in_acao = Request("in_acao")

'recupera o nome do menu e sub-menu
sql = "SELECT RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, "&_
			"  M02_EX_EMBARQUE, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, "&_
			"  M02_EX_EVENTO, M02_EX_DIAS, M02_EX_ORDEM, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO "&_
			"FROM M02_SUBM ( NOLOCK ) " &_
			" INNER JOIN M01_MENU ( NOLOCK ) ON M01_CD_MENU = M02_CD_MENU " &_
			"WHERE M02_CD_MENU = '"& cd_menu &"' "&_
			"  AND M02_CD_SUBM = '"& cd_subm &"' "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'escreve o nome do menu e submenu para aparecer na tela
nm_tela = nm_tela & objrs.Fields.Item("M01_NM_MENU").Value &" &gt;&gt; "& objrs.Fields.Item("M02_NM_SUBM").Value
'monta o nome da pagina de filtro
nm_page = "/"& objrs.Fields.Item("M01_AP_MENU").Value &"/"& objrs.Fields.Item("M02_AP_SUBM").Value
'verifica quais opções serão exibidas no cadastro
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
nr_max_filtro = objrs.Fields.Item("M02_NR_MAX_FILTRO").Value
nr_max_campo  = objrs.Fields.Item("M02_NR_MAX_CAMPO").Value
objrs.Close

'prepara para uma nova inclusão, coloca os valores padrão nas variáveis
If in_acao = "novo" Then
	cd_user      = Session("cd_usuario")
	cd_view      = cd_user &"-"& cd_menu & cd_subm &"-"
	nm_view      = ""
	in_embarque  = 1
	in_dt_prev   = 0
	in_download  = 0
	in_email     = 0
	in_print     = 0
	in_doctos    = 0
	in_padrao    = 0
	tp_relat     = 2
	tp_quebra    = 2
	tp_ref_cli   = ""
	cd_evento    = ""
	nr_dias      = Null
	cd_ordem     = ""
	tp_ordem     = 0
	array_filtro = ""
	array_campo  = ""
	nm_tela = tx_lang_004002(cd_lang) &" "& nm_tela
	in_tipo = "incluir"
End If
'recebe os valores do formulário, verifica se estão corretos e inclui na tabela
If in_acao = "incluir" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
	nr_dias      = Request.Form("nr_dias")
	cd_ordem     = Request.Form("cd_ordem")
	tp_ordem     = Request.Form("tp_ordem")
	array_filtro = Request("cd_filtro")
	array_campo  = Request("cd_campo")
	nm_tela = tx_lang_004003(cd_lang) &" "& nm_tela
	in_tipo = "incluir"
	'verifica se ocorreram erros de preenchimento
	tx_erro = ""
	If Not fnc_TestaVar(cd_menu) Then tx_erro = tx_erro &"\n- "& tx_lang_004006(cd_lang) &";"
	If Not fnc_TestaVar(cd_subm) Then tx_erro = tx_erro &"\n- "& tx_lang_004007(cd_lang) &";"
	If Not fnc_TestaVar(cd_user) Then tx_erro = tx_erro &"\n- "& tx_lang_004008(cd_lang) &";"
	If Not fnc_TestaVar(cd_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004009(cd_lang) &";"
	If Not fnc_TestaVar(nm_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004010(cd_lang) &";"
	Select Case cd_menu&cd_subm
		Case "0106"
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
		Case "0107"
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
		Case "0601" 'Numerario x Despesas Pagas
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
	End Select
	'se acontecerem erros informa o usuário
	If Len(tx_erro) > 0 Then
		tx_erro = tx_lang_A00002(cd_lang) &":"& tx_lang_A00003 &"\n"& tx_erro &"\n"&_
							tx_lang_004013(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
	Else
		'seleciona o último código de filtro e número de ordem
		sql = "SELECT SUBSTRING(MAX(M06_CD_VIEW), 11, 2) AS ULTIMO " &_
					"FROM M06_VIEW ( NOLOCK ) " &_
					"WHERE M06_CD_MENU    = '"& cd_menu &"' "&_
					"  AND M06_CD_SUBM    = '"& cd_subm &"' "&_
					"  AND M06_CD_USUARIO = '"& cd_user &"' "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'cria o código para o registro
		If Not fnc_TestaVar(objrs.Fields.Item("ULTIMO").Value) Then
			cd_view   = cd_view &"01"
			in_padrao = 1
		Else
			'seleciona o total de personalizações do ususario deste menu/submenu e que não seja de sistema
			sql = "SELECT COUNT(*) AS VIEWS "&_
						"FROM M06_VIEW ( NOLOCK ) "&_
						"WHERE M06_CD_MENU    = '"& cd_menu &"' "&_
						"  AND M06_CD_SUBM    = '"& cd_subm &"' "&_
						"  AND M06_CD_USUARIO = '"& cd_user &"' "&_
						"  AND M06_IN_SYSTEM  = 0 "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.Fields.Item("VIEWS").Value = 99 Then
				tx_erro = tx_lang_A00002(cd_lang) &":\n\n - "& tx_lang_004016(cd_lang) &"."
				Response.Redirect("cad_lista.asp?tx_erro="& Server.URLEncode(tx_erro))
				Response.End()
			Else
				If CInt(objrs.Fields.Item("ULTIMO").Value) <> objrsx.Fields.Item("VIEWS").Value Then
					'busca pelo código vago
					With objcmd
						.CommandTimeOut = 60
						.CommandText    = "sp_view_codigo_vago"
						.CommandType    = adCmdStoredProc
						.Parameters.Append = .CreateParameter("@cd_usuario", adChar   , adParamInput, 4, cd_user)
						.Parameters.Append = .CreateParameter("@cd_menu"   , adChar   , adParamInput, 2, cd_menu)
						.Parameters.Append = .CreateParameter("@cd_subm"   , adChar   , adParamInput, 2, cd_subm)
						.Parameters.Append = .CreateParameter("@cd_view_nr", adInteger, adParamOutPut)
						.Execute nrec, , adExecuteNoRecords
						cd_view = cd_view & fnc_AddZeros(CStr(.Parameters("@cd_view_nr")), 2)
					End With
				Else
					cd_view = cd_view & fnc_AddZeros(CInt(objrs.Fields.Item("ULTIMO").Value) + 1, 2)
				End If
			End If
			If objrsx.Fields.Item("VIEWS").Value = 0 and objrsx.RecordCount > 0 Then in_padrao = 1
			objrsx.Close
		End If
		objrs.Close
		'coloca o valor padrão nas variaveis numéricas
		If Not fnc_TestaVar(in_embarque) Then in_embarque  = 1
		If Not fnc_TestaVar(in_dt_prev)  Then in_dt_prev   = 0
		If Not fnc_TestaVar(in_download) Then in_download  = 0
		If Not fnc_TestaVar(in_email)    Then in_email     = 0
		If Not fnc_TestaVar(in_print)    Then in_print     = 0
		If Not fnc_TestaVar(in_doctos)   Then in_doctos    = 0
		If Not fnc_TestaVar(in_padrao)   Then in_padrao    = 0
		If Not fnc_TestaVar(tp_relat)    Then tp_relat     = 0
		'If Not fnc_TestaVar(tp_quebra)   Then tp_quebra    = "2"
		'If Not fnc_TestaVar(tp_ref_cli)  Then tp_ref_cli   = "01"
		if not fnc_TestaVar(cd_evento)   then nr_dias      = null
		If Not fnc_TestaVar(nr_dias)     Then nr_dias      = Null
		
		'monta o select para inclusão da personalização
		sql = "INSERT INTO M06_VIEW ( " &_
					"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW,   "&_
					"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT,  "&_
					"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
					"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS " &_
					") " &_
					"VALUES ("&_
						fnc_QuotedSQL(cd_view) &", "& fnc_QuotedSQL(cd_menu) &", "& fnc_QuotedSQL(cd_subm) &", "&_
						fnc_QuotedSQL(cd_user) &", "& fnc_QuotedSQL(nm_view) &", "&_
						in_embarque &", "& in_dt_prev &", "& in_download &", "& in_email &", "& in_print &", "&_ 
						in_padrao &", "& fnc_QuotedSQL(tp_relat) &", "& fnc_QuotedSQL(tp_quebra) &", "&_
						fnc_QuotedSQL(tp_ref_cli) &", "& fnc_QuotedSQL(cd_evento) &", "& fnc_QuotedSQL(nr_dias) &", "&_
						fnc_QuotedSQL(cd_ordem) &", "& fnc_QuotedSQL(tp_ordem) &", "& in_doctos &")"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
			in_tipo = "alterar"
			tx_erro = tx_lang_004014(cd_lang) &"!"
			
			'verifica se a nova view é padrão
			If in_padrao Then
				sql = "UPDATE M06_VIEW SET " &_
							"  M06_IN_PADRAO = 0 " &_
							"WHERE M06_CD_VIEW   <> "& fnc_QuotedSQL(cd_view) &_
							"  AND M06_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
							"  AND M06_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
							"  AND M06_CD_USUARIO = "& fnc_QuotedSQL(cd_user)
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
			End If
			
			'inclui os filtros da personalização
			cont = 1
			num  = 0
			str  = array_filtro
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_filtro
				cont = InStr(str,",")
				
				If cont <> 0 Then
				sql = "INSERT INTO M13_VIEW_FILTRO ( "&_
							"  M13_CD_VIEW, M13_CD_FILTRO, M13_NR_ORDEM "&_
							" ) " &_
							"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
							" )"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
				
				num = num + 1
				str = Right(str, Len(str) - cont)
				End If
			Loop
			
			'inclui os campos da personalização
			cont = 1
			num  = 0
			str  = array_campo
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_campo
				cont = InStr(str,",")
				
				If cont <> 0 Then
					sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
								"  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM "&_
								") " &_
								"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
								" )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					
					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
								tx_lang_004015(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		End If
	End If
End If
'prepara a personalização para ser alterada
If in_acao = "editar" Then
	cd_view = CStr(Request("cd_view"))
	nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
	in_tipo = "alterar"
	
	'seleciona a personalização
	sql = "SELECT "&_
				"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW  , "&_
				"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT , "&_
				"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
				"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS " &_
				"FROM M06_VIEW ( NOLOCK ) " &_
				"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu     = objrs.Fields.Item("M06_CD_MENU").Value
		cd_subm     = objrs.Fields.Item("M06_CD_SUBM").Value
		cd_user     = objrs.Fields.Item("M06_CD_USUARIO").Value
		cd_view     = objrs.Fields.Item("M06_CD_VIEW").Value
		nm_view     = objrs.Fields.Item("M06_NM_VIEW").Value
		in_embarque = objrs.Fields.Item("M06_IN_EMBARQUE").Value
		in_dt_prev  = objrs.Fields.Item("M06_IN_DT_PREV").Value
		in_download = objrs.Fields.Item("M06_IN_DOWNLOAD").Value
		in_email    = objrs.Fields.Item("M06_IN_EMAIL").Value
		in_print    = objrs.Fields.Item("M06_IN_PRINT").Value
		in_doctos   = objrs.Fields.Item("M06_IN_DOCTOS").Value
		in_padrao   = objrs.Fields.Item("M06_IN_PADRAO").Value
		tp_relat    = objrs.Fields.Item("M06_TP_RELAT").Value
		tp_quebra   = objrs.Fields.Item("M06_TP_QUEBRA").Value
		tp_ref_cli  = objrs.Fields.Item("M06_TP_REF_CLI").Value
		cd_evento   = objrs.Fields.Item("M06_CD_EVENTO").Value
		nr_dias     = objrs.Fields.Item("M06_NR_DIAS").Value
		cd_ordem    = objrs.Fields.Item("M06_CD_CAMPO").Value
		tp_ordem    = objrs.Fields.Item("M06_TP_ORDEM").Value
	Else
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n - "& tx_lang_004016(cd_lang) &"."
		Response.Redirect("?in_acao=novo&tx_erro="& Server.URLEncode(tx_erro))
		Response.End()
	End If
	objrs.Close
End If
'alterar dados da personalização
If in_acao = "alterar" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
	nr_dias      = Request.Form("nr_dias")
	cd_ordem     = Request.Form("cd_ordem")
	tp_ordem     = Request.Form("tp_ordem")
	array_filtro = Request("cd_filtro")
	array_campo  = Request("cd_campo")
	nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
	in_tipo = "alterar"
	
	'verifica se ocorreram erros de preenchimento
	tx_erro = ""
	If Not fnc_TestaVar(cd_menu) Then tx_erro = tx_erro &"\n- "& tx_lang_004006(cd_lang) &";"
	If Not fnc_TestaVar(cd_subm) Then tx_erro = tx_erro &"\n- "& tx_lang_004007(cd_lang) &";"
	If Not fnc_TestaVar(cd_user) Then tx_erro = tx_erro &"\n- "& tx_lang_004008(cd_lang) &";"
	If Not fnc_TestaVar(cd_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004009(cd_lang) &";"
	If Not fnc_TestaVar(nm_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004010(cd_lang) &";"
	Select Case cd_menu&cd_subm
		Case "0106"
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
		Case "0107"
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
		Case "0601" 'Numerario x Despesas Pagas
			If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
			If Not fnc_TestaVar(array_campo)  Then tx_erro = tx_erro &"\n- "& tx_lang_004012(cd_lang) &";"
	End Select
	'se acontecerem erros informa o usuário
	If Len(tx_erro) > 0 Then
		tx_erro = tx_lang_A00002(cd_lang) &":"& tx_lang_A00003 &"\n"& tx_erro &"\n"&_
							tx_lang_004013(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
	Else
		'coloca o valor padrão nas variaveis numéricas
		If Not fnc_TestaVar(in_embarque) Then in_embarque  = 1
		If Not fnc_TestaVar(in_dt_prev)  Then in_dt_prev   = 0
		If Not fnc_TestaVar(in_download) Then in_download  = 0
		If Not fnc_TestaVar(in_email)    Then in_email     = 0
		If Not fnc_TestaVar(in_print)    Then in_print     = 0
		If Not fnc_TestaVar(in_doctos)   Then in_doctos    = 0
		If Not fnc_TestaVar(in_padrao)   Then in_padrao    = 0
		If Not fnc_TestaVar(tp_relat)    Then tp_relat     = 2
		'If Not fnc_TestaVar(tp_quebra)   Then tp_quebra    = "2"
		'If Not fnc_TestaVar(tp_ref_cli)  Then tp_ref_cli   = "01"
		if not fnc_TestaVar(cd_evento)   then nr_dias      = null
		If Not fnc_TestaVar(nr_dias)     Then nr_dias      = Null
		
		'monta o select para inclusão da personalização
		sql = "UPDATE M06_VIEW SET " &_
					"  M06_NM_VIEW     = "& fnc_QuotedSQL(nm_view) &", "&_
					"  M06_IN_EMBARQUE = "& in_embarque &", "&_
					"  M06_IN_DT_PREV  = "& in_dt_prev  &", "&_
					"  M06_IN_DOWNLOAD = "& in_download &", "&_
					"  M06_IN_EMAIL    = "& in_email    &", "&_
					"  M06_IN_PRINT    = "& in_print    &", "&_
					"  M06_IN_DOCTOS   = "& in_doctos   &", "&_
					"  M06_IN_PADRAO   = "& in_padrao   &", "&_
					"  M06_TP_RELAT    = "& fnc_QuotedSQL(tp_relat)   &", "&_
					"  M06_TP_QUEBRA   = "& fnc_QuotedSQL(tp_quebra)  &", "&_
					"  M06_TP_REF_CLI  = "& fnc_QuotedSQL(tp_ref_cli) &", "&_
					"  M06_CD_EVENTO   = "& fnc_QuotedSQL(cd_evento)  &", "&_
					"  M06_NR_DIAS     = "& fnc_QuotedSQL(nr_dias)    &", "&_
					"  M06_CD_CAMPO    = "& fnc_QuotedSQL(cd_ordem)   &", "&_
					"  M06_TP_ORDEM    = "& fnc_QuotedSQL(tp_ordem)   &"  "&_
					"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view) 
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			tx_erro = tx_lang_004017(cd_lang) &"!"
			
			'verifica se a nova view é padrão
			If in_padrao Then
				sql = "UPDATE M06_VIEW SET " &_
							"  M06_IN_PADRAO = 0 " &_
							"WHERE M06_CD_VIEW   <> "& fnc_QuotedSQL(cd_view) &_
							"  AND M06_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
							"  AND M06_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
							"  AND M06_CD_USUARIO = "& fnc_QuotedSQL(cd_user)
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
			End If
			
			'Exclui os campos e filtros
			sql = "DELETE FROM M13_VIEW_FILTRO " &_
						"WHERE M13_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			sql = "DELETE FROM M14_VIEW_CAMPO " &_
						"WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			
			'inclui os filtros da personalização
			cont = 1
			num  = 0
			str  = array_filtro
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_filtro
				cont = InStr(str,",")
			
				If cont <> 0 Then
					sql = "INSERT INTO M13_VIEW_FILTRO ( "&_
								"  M13_CD_VIEW, M13_CD_FILTRO, M13_NR_ORDEM "&_
								" ) " &_
								"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
								" )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
			
					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
			
			'inclui os campos da personalização
			cont = 1
			num  = 0
			str  = array_campo
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_campo
				cont = InStr(str,",")
				
				If cont <> 0 Then
					sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
								"  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM "&_
								") " &_
								"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
								" )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					
					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
								tx_lang_004018(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		End If
	End If
End If
'exclui uma personalização
If in_acao = "excluir" Then
	cd_view = CStr(Request("cd_view"))
	
	If Trim(cd_view) = "" Then
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
							tx_lang_004019(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		Response.Redirect("?in_acao=editar&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
	Else
		'seleciona a personalização
		sql = "SELECT M06_IN_PADRAO " &_
					"FROM M06_VIEW ( NOLOCK ) " &_
					"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		in_padrao = objrs.Fields.Item("M06_IN_PADRAO").Value
		
		If Not in_padrao Then
			'apaga os registros da tabela view_filtro
			sql = "DELETE FROM M13_VIEW_FILTRO " &_
						"WHERE M13_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			'apaga os registros da tabela view_campo
			sql = "DELETE FROM M14_VIEW_CAMPO " &_
						"WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			'apaga a view selecionanda 
			sql = "DELETE FROM M06_VIEW " &_
						"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			tx_erro = tx_lang_004020(cd_lang) &"."
			Response.Redirect("?in_acao=novo&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004021(cd_lang)
			Response.Redirect("?in_acao=editar&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
		End If
		objrs.Close
	End If
End If
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.vtxt {
	color: #000000;
}
.vdata {
	color: #0000FF;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function getValidDate(Q) { var d, m, D, U // y!=0
	if ((D = /^(3[0-1]|[0-2]\d)\/(0\d|1[0-2])\/(\d{4})$/.exec(Q)) != null) {
		with (D = new Date(D[3], m=(D[2]-1), d=D[1]))
		if (getMonth()==m && getDate()==d) return D
		return U 
	}
}

function VerifyFormView(form) {
	var valida = true;
	//Titulo do Modelo
	if (form.nm_view.value == '') {
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004022(cd_lang) &".');")%>
		document.frmview.nm_view.focus();
		valida = false;      
	}
	//Evento de alerta
	if ((form.cd_menu.value=='01' || form.cd_menu.value=='02') && form.cd_subm.value=='03') {
		if (form.cd_evento.options[form.cd_evento.selectedIndex].value=='') {
			<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004023(cd_lang) &".');")%>
			document.frmview.filtro.focus();
			valida = false;
		}
	}
	//Filtros
	if (form.array_filtro.length == 0){
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004011(cd_lang) &".');")%>
		document.frmview.filtro.focus();
		valida = false;
	} else {
		if (form.array_filtro.length > <%= nr_max_filtro%>) {
			<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n "& tx_lang_004024(cd_lang) &" "& nr_max_filtro &" "& tx_lang_A00015(cd_lang) &".\n"& tx_lang_004025(cd_lang) &".');")%>
			document.frmview.array_filtro.focus();
			valida = false;
		}
	}
	//Campos
	if (form.array_campo.length == 0){
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004012(cd_lang) &".');")%>
		document.frmview.campo.focus();
		valida = false;
	} else {
		if (form.array_campo.length > <%= nr_max_campo%>) {
			<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n "& tx_lang_004024(cd_lang) &" "& nr_max_campo &" "& tx_lang_A00016(cd_lang) &".\n"& tx_lang_004026(cd_lang) &".');")%>
			document.frmview.array_campo.focus();
			valida = false;
		}
	}
	return valida;
}

function combo_altera(origem, destino, todos) {
	if (todos == true) {
		//se for todos os registros
		for (var c = 0; c <= origem.length -1; c++) {
			var valor = origem.options[c].value;
			var item  = origem.options[c].text;
			destino.options[destino.length] = new Option(item, valor);
		}
		origem.length = 0;
	} else {
		//se for um registro só
		var sel = origem.selectedIndex;
		if (sel >= 0) { 
			//pega os dados do registro selecionado na orgiem
			var valor = origem.options[origem.selectedIndex].value;
			var item  = origem.options[origem.selectedIndex].text;
			//inclui o registro no destino
			destino.options[destino.length] = new Option(item, valor);
			//tira o registro da origem
			for (var c = 0; c <= origem.length - 2; c++) {
				if (c >= sel) {
					origem.options[c].value = origem.options[c + 1].value;
					origem.options[c].text  = origem.options[c + 1].text;  
				}
			}
			origem.length = origem.length - 1;
		}
	}
	//altera a qtde de filtros/campos utilizados
	document.frmview.qtd_filtro.value = document.frmview.array_filtro.length;
	document.frmview.qtd_campo.value  = document.frmview.array_campo.length;
}

function combo_valor(campo, valor) {
  valor.value = "";
  for (var c = 0; c < campo.length; c++) {
    valor.value = campo.options[c].value + "," + valor.value; 
  }
}

function fnc_Processo(campo) {
	if(campo.checked) {
		document.frmview.tp_ref_cli.value = "";
		document.frmview.tp_ref_cli.style.background = "#CCCCCC";
		document.frmview.tp_ref_cli.disabled = true;
	}
	else {
		document.frmview.tp_ref_cli.value = "01";
		document.frmview.tp_ref_cli.style.background = "#FFFFFF";
		document.frmview.tp_ref_cli.disabled = false;
	}
}

function fnc_Referencia(campo) {
	if(campo.value != "") {
		document.frmview.in_embarque.checked = false;
	}
	else {
		document.frmview.in_embarque.checked = true;
	}
}

function fnc_EventoLimitadorChange(objSelect) {
<%
If ex_dias Then
%>
	if(objSelect.options[objSelect.selectedIndex].value=='') {
		document.frmview.nr_dias.value = '';
		document.frmview.nr_dias.disabled = true;
	}
	else {
		document.frmview.nr_dias.disabled = false;
		document.frmview.nr_dias.value = '-1';
		document.frmview.nr_dias.select();
		document.frmview.nr_dias.focus();
	}
<%
End If
%>
}
-->
</script>
</head>
<body onLoad="document.frmview.nm_view.focus();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
  <tr valign="top">
    <td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
      <div id="dv_corpo" class="divMainTop">
        <table width="650" border="0" cellspacing="0" cellpadding="2" align="center">
          <form name="frmview" action="<%= script &"?cd_lang="& cd_lang%>" method="post" onSubmit="return VerifyFormView(this);">
            <tr>
              <td width="20%" align="right" class="label"><label for="nome"><%= tx_lang_004027(cd_lang)%></label></td>
              <td width="80%">&nbsp;&nbsp;
                <input name="nm_view" type="text" class="editbox" id="nome" style="width:250px;" value="<%= nm_view%>" maxlength="30">
              </td>
            </tr>
            <%
If ex_evento Then
	'seleciona todos os eventos referentes a sub-&aacute;rea
	sql = "SELECT RTRIM(M10_CD_BROKER) AS CD_EVENTO, RTRIM("& tx_lang_dado &") AS NM_EVENTO, M03_NR_ORDEM "&_
				"FROM M03_LIMITADOR ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M03_CD_MENU    = '"& cd_menu &"' "&_
				"  AND M03_CD_SUBM    = '"& cd_subm &"' "&_
				"  AND M03_IN_ATIVO   = 1 "&_
				"  AND M03_TP_EXIBIR >= '"& Session("tp_exibir") &"' "&_
				"  AND M03_CD_DADO    = M10_CD_DADO "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY M03_NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
	'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
	If Not objrs.Eof then
%>
            <tr>
              <td align="right" class="label"><label for="evento"><%= tx_lang_004028(cd_lang)%></label></td>
              <td>&nbsp;&nbsp;
                <select name="cd_evento" class="select" style="width:250px;" onChange="fnc_EventoLimitadorChange(this);">
                  <option value="" selected><%= tx_lang_004029(cd_lang)%></option>
                  <%
		Do While Not objrs.Eof
			selected = ""
			If cd_evento = Trim(objrs.Fields.Item("CD_EVENTO").Value) Then selected = " selected"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = Trim(objrs.Fields.Item("NM_EVENTO").Value)
			Else
				nm_campo_rel = Trim(objrs.Fields.Item("CD_EVENTO").Value) &" - "& Trim(objrs.Fields.Item("NM_EVENTO").Value)
			End If
%>
                  <option value="<%= objrs.Fields.Item("CD_EVENTO").Value%>"<%= selected%>><%= nm_campo_rel%></option>
                  <%
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
%>
                </select>
								<%
		If ex_dias Then
%>
                <b><%= tx_lang_004030(cd_lang)%>:</b>
                <input class="editbox" type="text" name="nr_dias" size="2" maxlength="3" value="<%= nr_dias%>">
								<%
		End If
%>
              </td>
            </tr>
            <%
	End If
	objrs.Close
End If

If ex_relat Then
 Select Case cd_menu&cd_subm
   Case "0101"
%>
            <tr>
              <td align="right" class="label"><%= tx_lang_004031(cd_lang)%></td>
              <td>&nbsp;&nbsp;
                <input name="tp_relat" type="radio" value="2" id="ambos"<%If tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="ambos"><%= tx_lang_004032(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="adm"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="adm"><%= tx_lang_004033(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="0" id="des"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004034(cd_lang)%></label></td>
            </tr>
            <%
    Case "0604"
%>
            <tr>
              <td align="right" class="label"><%= tx_lang_004031(cd_lang)%></td>
              <td>&nbsp;&nbsp;
                <input name="tp_relat" type="radio" value="0" id="grupo"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="grupo"><%= tx_lang_005005(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="cliente"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="cliente"><%= tx_lang_005006(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="2" id="processo"<%If tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="processo"><%= tx_lang_005007(cd_lang)%></label></td>
            </tr>
            <%
	End Select					
End If

If ex_quebra Then
%>
            <tr>
              <td align="right" class="label"><label for="quebra"><%= tx_lang_004038(cd_lang)%></label></td>
              <td>&nbsp;&nbsp;
                <select name="tp_quebra" class="select" id="quebra" style="width:250px;">
                  <option value="" selected><%= tx_lang_004039(cd_lang)%></option>
                  <%
	For cont = 0 to UBound(tipo_quebra)
		selected = ""
		If cont = 0 and Not Session("cargo_interno") = "1" Then cont = 1
		If tp_quebra = CStr(cont) Then selected = " selected"
%>
                  <option value="<%= cont%>"<%= selected%>><%= nm_tp_quebra(cont)%></option>
                  <%
	Next
%>
                </select></td>
            </tr>
            <%
End If

If ex_ordem Then
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT M07_CD_DADO, M10_NM_DADO "&_
				"FROM M07_VIEW_ORDEM (NOLOCK) "&_
				"  INNER JOIN M10_DADOS (NOLOCK) ON (M10_CD_DADO = M07_CD_DADO) "&_
				"WHERE M07_CD_MENU+M07_CD_SUBM = '"&cd_menu&cd_subm&"'"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	if objrsx.RecordCount > 0 then
%>
            <tr>
              <td align="right" class="label"><label for="odernar"><%= tx_lang_004035(cd_lang)%></label></td>
              <td>&nbsp;&nbsp;
                <select name="cd_ordem" class="select" id="ordernar">
									<option value="" selected></option>
									<%
	str = ""
	do while not objrsx.Eof
		if cd_ordem = objrsx.Fields.Item(0).Value Then selected = " selected" else selected = ""
		str = str&"<option value='"&objrsx.Fields.Item(0).Value&"'"&selected&">"&objrsx.Fields.Item(1).Value&"</option>"
		objrsx.MoveNext
		if objrsx.Eof then exit do else str = str & vbcrlf
	loop
	Response.Write(str)
%>
                </select>
                <select name="tp_ordem" class="select">
                  <option value="0"<% if tp_ordem = "0" then Response.Write("selected")%>>A -> Z (crescente)</option>
                  <option value="1"<% if tp_ordem = "1" then Response.Write("selected")%>>Z -> A (decrescente)</option>
                </select></td>
            </tr>
            <%
	end if
	if objrsx.State = adStateOpen then objrsx.Close()
End If

If ex_embarque Then
	str = ""
	If in_embarque Then str = " background: #CCCCCC;"
%>
            <tr>
              <td align="right" class="label"><label for="embarque"><%= tx_lang_004040(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_embarque" id="embarque" value="1"<%If in_embarque Then Response.Write(" checked")%> onClick="fnc_Processo(this);">
                <%= tx_lang_004041(cd_lang)%>.</td>
            </tr>
						<tr>
              <td align="right" class="label"><label for="tp_ref"><%= tx_lang_004042(cd_lang)%></label></td>
              <td>&nbsp;&nbsp;
                <select name="tp_ref_cli" class="select" id="tp_ref" style="width:250px; <%= str%>"<%If in_embarque Then Response.Write(" disabled")%> onChange="fnc_Referencia(this);">
                  <option value="" selected><%= tx_lang_004043(cd_lang)%></option>
                  <%
	For cont = 0 to UBound(tipo_referencia)
		selected = ""
		str = "0"& CStr(cont+1)
		If tp_ref_cli = str Then selected = " selected"
%>
                  <option value="<%= str%>"<%= selected%>><%= tipo_referencia(cont)%></option>
                  <%
	Next
%>
                </select></td>
            </tr>
            <%
End If
%>
            <tr>
              <td align="right" class="label"><label for="padrao"><%= tx_lang_004046(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_padrao" id="padrao" value="1"<%If in_padrao Then Response.Write(" checked")%>>
                <%= tx_lang_004047(cd_lang)%>.</td>
            </tr>
            <%
If ex_dt_prev Then
%>
            <tr>
              <td align="right" class="label"><label for="prev"><%= tx_lang_004044(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_dt_prev" id="prev" value="1"<%If in_dt_prev Then Response.Write(" checked")%>>
                <%= tx_lang_004045(cd_lang)%>.</td>
            </tr>
            <%
End If

If ex_download Then
%>
            <tr>
              <td align="right" class="label"><label for="download"><%= tx_lang_004048(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_download" id="download" value="1"<%If in_download Then Response.Write(" checked")%>>
                <%= tx_lang_004049(cd_lang)%>.</td>
            </tr>
            <%
End If

If ex_email Then
%>
            <tr>
              <td align="right" class="label"><label for="email"><%= tx_lang_004050(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_email" id="email" value="1"<%If in_email Then Response.Write(" checked")%>>
                <%= tx_lang_004051(cd_lang)%>.</td>
            </tr>
            <%
End If

If ex_print Then
%>
            <tr>
              <td align="right" class="label"><label for="print"><%= tx_lang_004052(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_print" id="print" value="1"<%If in_print Then Response.Write(" checked")%>>
                <%= tx_lang_004053(cd_lang)%>.</td>
            </tr>
            <%
End If

If ex_doctos Then
%>
            <tr>
              <td align="right" class="label"><label for="doctos"><%= tx_lang_004062(cd_lang)%></label></td>
              <td>&nbsp;
                <input type="checkbox" name="in_doctos" id="doctos" value="1"<%If in_doctos Then Response.Write(" checked")%>>
                <%= tx_lang_004063(cd_lang)%>.</td>
            </tr>
            <%
End If

'seleciona todos os filtros referentes ao menu/submenu
If objrsx.State = 1 Then objrsx.Close
sql = "SELECT COUNT(*) AS FILTROS " &_
			"FROM M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) " &_
			"WHERE M11_CD_DADO    = M10_CD_DADO "&_
			"  AND M11_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
			"  AND M11_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
			"  AND M11_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
			"  AND M11_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Se o result do filtro estiver no fim da tabela, isto &eacute;,
'n&atilde;o existem filtros para essa sub-&aacute;rea, ent&atilde;o n&atilde;o exibe os selects de filtro
If objrsx.Fields.Item("FILTROS").Value > 0 then
	script_filtro = "combo_valor(this.form.array_filtro,this.form.cd_filtro);"
%>
            <tr>
              <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="center"><b><%= tx_lang_004058(cd_lang)%></b></td>
                    <td align="center"><%= tx_lang_004054(cd_lang)%></td>
                    <td align="center"><b><%= tx_lang_004059(cd_lang)%></b></td>
                  </tr>
                  <tr align="center">
                    <td><select size="10" name="filtro" onClick="combo_altera(document.frmview.filtro,document.frmview.array_filtro,false);" class="select" style="width: 250;">
                        <!-- <select name="campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" onkeypress="if(event.keyCode == 13) combo_altera(document.frmview.campo,document.frmview.array_campo,false);"> -->
												<%
	'seleciona os filtros disponíveis para adcionar na personalização do relatório
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M11_CD_FILTRO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
				"FROM M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M11_CD_DADO    = M10_CD_DADO "&_
				"  AND M11_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
				"  AND M11_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
				"  AND M11_CD_FILTRO NOT IN ( "&_
				"    SELECT M13_CD_FILTRO "&_
				"    FROM M13_VIEW_FILTRO ( NOLOCK ) "&_
				"    WHERE M13_CD_VIEW = "& fnc_QuotedSQL(cd_view) &" ) "&_
				"  AND M11_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M11_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY "& tx_lang_dado 
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "vdata"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "vtxt"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("M11_CD_FILTRO").Value%>" class="<%= color%>"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
	
	'seleciona os filtros já adicionados a personalização
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M11_CD_FILTRO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
				"FROM M13_VIEW_FILTRO ( NOLOCK ), M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M11_CD_DADO    = M10_CD_DADO "&_
				"  AND M13_CD_FILTRO  = M11_CD_FILTRO "&_
				"  AND M13_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M11_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M11_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY "& tx_lang_dado 
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
                      </select></td>
                    <td><input type="button" value=">>" class="button" onClick="combo_altera(document.frmview.filtro,document.frmview.array_filtro,true);" name="button1">
                      <br>
                      <br>
                      <input type="button" value="<<" class="button" onClick="combo_altera(document.frmview.array_filtro,document.frmview.filtro,true);" name="button2">
											<br>
											<br>
											<br>
											<span style="color:#999999;"><%= tx_lang_004055(cd_lang)%><br>
											<%= tx_lang_004056(cd_lang)%></span><br>
											<input name="qtd_filtro" type="text" class="editbox" style="width:25px;color:#999999;text-align:center" readonly value="<%= objrs.RecordCount%>"></td>
                    <td><select size="10" name="array_filtro" onClick="combo_altera(document.frmview.array_filtro,document.frmview.filtro,false);" class="select" style="width:250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
												<%
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "vdata"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "vtxt"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
												<option value="<%= objrs.Fields.Item("M11_CD_FILTRO").Value%>" class="<%= color%>"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
					  %>
                      </select></td>
                  </tr>
                </table></td>
            </tr>
            <% 
End If
objrsx.Close

'verifica se existem campos para esse menu e sub-menu
If objrsx.State = 1 Then objrsx.Close
sql = "SELECT COUNT(*) AS CAMPOS "&_
			"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
			"WHERE M12_CD_DADO    = M10_CD_DADO "&_
			"  AND M12_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
			"  AND M12_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
			"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Se o result do campo estiver no fim da tabela, isto &eacute;,
'n&atilde;o existem campos para esse sub-menu, ent&atilde;o n&atilde;o exibe os selects de campo
If objrsx.Fields.Item("CAMPOS").Value > 0 then
	script_campo = "combo_valor(this.form.array_campo,this.form.cd_campo);"
%>
            <tr>
              <td colspan="2"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="center"><b><%= tx_lang_004060(cd_lang)%></b></td>
                    <td align="center"><%= tx_lang_004054(cd_lang)%></td>
                    <td align="center"><b><%= tx_lang_004061(cd_lang)%></b></td>
                  </tr>
                  <tr align="center">
                    <td><select class="select" size=10 name="campo" onClick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" style="width: 250;">
                        <!-- <select name="campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" onkeypress="if(event.keyCode == 13) combo_altera(document.frmview.campo,document.frmview.array_campo,false);"> -->
												<%
	'seleciona os campos disponíveis para adcionar na personalização do relatório
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M12_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
				"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND M12_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
				"  AND M12_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
				"  AND M12_CD_CAMPO NOT IN ( "&_
				"    SELECT M14_CD_CAMPO "&_
				"    FROM M14_VIEW_CAMPO ( NOLOCK ) "&_
				"    WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view) &" ) "&_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY "& tx_lang_dado 
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "vdata"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "vtxt"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" class="<%= color%>"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
	
	'seleciona os campos utilizados na personalização
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M12_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, M10_CD_BROKER "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ), M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND M14_CD_CAMPO   = M12_CD_CAMPO "&_
				"  AND M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY "& tx_lang_dado 
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
                      </select></td>
                    <td><input type="button" value=">>" class="button" onClick="combo_altera(document.frmview.campo,document.frmview.array_campo,true);" name="button1">
                      <br>
                      <br>
                      <input type="button" value="<<" class="button" onClick="combo_altera(document.frmview.array_campo,document.frmview.campo,true);" name="button2">
											<br>
											<br>
											<br>
											<span style="color:#999999;"><%= tx_lang_004055(cd_lang)%><br>
											<%= tx_lang_004057(cd_lang)%></span><br>
											<input name="qtd_campo" type="text" class="editbox" style="width:25px;color:#999999;text-align:center" readonly value="<%= objrs.RecordCount%>"></td>
                    <td><select size=10 name="array_campo" onClick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);" class="select" style="width: 250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
												<%
	Do While Not objrs.Eof
	  If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "vdata"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "vtxt"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" class="<%= color%>"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
%>
                      </select></td>
                  </tr>
                </table></td>
            </tr>
            <%
End If
objrsx.Close
%>
            <tr align="center">
              <td colspan="2" height="30" valign="bottom"><input type="hidden" name="in_acao" value="<%= in_tipo%>">
                <input type="hidden" name="cd_view" value="<%= cd_view%>">
                <input type="hidden" name="cd_menu" value="<%= cd_menu%>">
                <input type="hidden" name="cd_subm" value="<%= cd_subm%>">
                <input type="hidden" name="cd_user" value="<%= cd_user%>">
                <input type="hidden" name="cd_campo" value="<%= array_campo%>">
                <input type="hidden" name="cd_filtro" value="<%= array_filtro%>">
                <input type="submit" name="btn_cadastrar" class="button" value="<%= tx_lang_A00017(cd_lang)%>" onMouseOver="<%= script_campo & script_filtro%>">
                <input type="reset" name="btn_cancelar" class="button" value="<%= tx_lang_A00018(cd_lang)%>">
                <%
If in_padrao = 1 Then in_padrao = True
If in_tipo = "alterar" and Not in_padrao Then
%>
                <input type="button" name="btn_excluir" class="button" value="<%= tx_lang_A00019(cd_lang)%>" onClick="document.location='?in_acao=excluir&cd_view=<%= cd_view%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';">
                <%
End If
%>
              </td>
            </tr>
            <%
If in_tipo <> "incluir" and Len(nm_page) > 0 Then
%>
            <tr align="center">
              <td height="20" colspan="2"><a href="<%= nm_page&"_filtros.asp?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>"><%= tx_lang_004064(cd_lang)%>.</a></td>
            </tr>
            <%
End If
%>
          </form>
        </table>
      </div>
      <!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
      <!--#include virtual="/includes/lay_bottom.asp" -->
      <!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
    </td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
