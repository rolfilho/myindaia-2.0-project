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
Dim Permisso 'Permissão para definir o tipo de exibição
Dim tp_exibir_Export 'Permissão para exibir apenas os campos autorizados
Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim msg ' mensagem para exportação - status exibir
Dim CheckMenu,checkPassagem
Dim cd_cargo1
Dim opcao_kpi
Dim tp_limitador, aux_quebra



'tp_exibir_Export=0
in_show = True
cd_tela = "004"
nm_tela = tx_lang_004001(cd_lang) &" &gt;&gt; "
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
tx_erro = Request("tx_erro")
in_acao = Request("in_acao")


'Identificando o usuário, e grupo de empresas que ele têm acesso:

sql = " SELECT  TG.CD_GRUPO, TG.IN_EXIBE_PEDIDO_SITE AS PERMISSO" &_
    " from       TPERMISSAO_GRUPO     TP " &_
    " INNER JOIN TGRUPO         TG (NOLOCK) ON(TP.CD_GRUPO=TG.CD_GRUPO) " &_
    " WHERE  TP.CD_USUARIO='"&session("cd_usuario") & "'"
	Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
If objrsx.eof or isnull(objrsx("PERMISSO"))then
   permisso=0
else
   permisso=objrsx("PERMISSO")
End if
Objrsx.Close
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

'--------------------------  :: NOVO EXPORTAÇÃO EM TESTE:: --------------------------------------------------
'If in_acao = "NovoExp" Then
'	cd_user      = Session("cd_usuario")
'	cd_view      = cd_user &"-"& cd_menu & cd_subm &"-"
'	nm_view      = ""
'	in_embarque  = 1
'	in_dt_prev   = 0
'	in_download  = 0
'	in_email     = 0
'	in_print     = 0
'	in_doctos    = 0
'	in_padrao    = 0
'	tp_relat     = 0
'	tp_quebra    = 2
'	tp_ref_cli   = ""
'	cd_evento    = ""
'	nr_dias      = Null
'	cd_ordem     = ""
'	tp_ordem     = 0
'	array_filtro = ""
'	array_campo  = ""
'	tp_relat=Request("tp_relat")
'	nm_tela = tx_lang_004002(cd_lang) &" "& nm_tela
'	'in_tipo = "NovoExp"
'	tp_exibir_Export=0
'End If
'------------------------------------------------------------------------------------
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
	tp_relat     = 0
	tp_quebra    = 2
	tp_ref_cli   = ""
	cd_evento    = ""
	nr_dias      = Null
	cd_ordem     = Null
	tp_ordem     = 0
	array_filtro = ""
	array_campo  = ""
	nm_tela = tx_lang_004002(cd_lang) &" "& nm_tela
	in_tipo = "incluir"
	'tp_exibir_Export=0
End If
'recebe os valores do formulário, verifica se estão corretos e inclui na tabela
If in_acao = "incluir" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	'*************** flavio
	If nm_view="" then 
	tx_erro="O campo DESCRIÇÃO da Personalização é obrigatório!"
			Response.Redirect("?in_acao=novo&checkPassagem=nm_view&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
		Response.End()
	End If
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
	opcao_kpi    = Request.Form("opcao_kpi")
	tp_limitador = Request.Form("tp_limitador")
	cd_ordem     = Null
	tp_ordem     = 0
'	If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
'	If Request("cd_filtro")="" then 'flavio
'	tx_erro="Não foi selecionado nenhum FILTRO" ' flavio
'			Response.Redirect("?in_acao=novo&checkPassagem=filtro&nm_view="&Request.Form("nm_view")&"&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
'				'nm_view=Request.Form("nm_view")
'
'		Response.End()
'	End If
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
		Case "1302" 'Numerario x Despesas Pagas
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
		
		in_print = 1
		in_download = 1

		
		'monta o select para inclusão da personalização
		sql = "INSERT INTO M06_VIEW ( " &_
					"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW,   "&_
					"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT,  "&_
					"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
					"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS, M06_IN_KPI, M06_TP_LIMITADOR " &_
					") " &_
					"VALUES ("&_
						fnc_QuotedSQL(cd_view) &", "& fnc_QuotedSQL(cd_menu) &", "& fnc_QuotedSQL(cd_subm) &", "&_
						fnc_QuotedSQL(cd_user) &", "& fnc_QuotedSQL(nm_view) &", "&_
						in_embarque &", "& in_dt_prev &", "& in_download &", "& in_email &", "& in_print &", "&_ 
						in_padrao &", "& fnc_QuotedSQL(tp_relat) &", "& fnc_QuotedSQL(tp_quebra) &", "&_
						fnc_QuotedSQL(tp_ref_cli) &", "& fnc_QuotedSQL(cd_evento) &", "& fnc_QuotedSQL(nr_dias) &", "&_
						fnc_QuotedSQL(cd_ordem) &", "& fnc_QuotedSQL(tp_ordem) &", "& in_doctos &", "& fnc_QuotedSQL(opcao_kpi) &", "& fnc_QuotedSQL(tp_limitador) &")"
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
				"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS, M06_IN_KPI, M06_TP_LIMITADOR " &_
				"FROM M06_VIEW ( NOLOCK ) " &_
				"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu      = objrs.Fields.Item("M06_CD_MENU").Value
		cd_subm      = objrs.Fields.Item("M06_CD_SUBM").Value
		cd_user      = objrs.Fields.Item("M06_CD_USUARIO").Value
		cd_view      = objrs.Fields.Item("M06_CD_VIEW").Value
		nm_view      = objrs.Fields.Item("M06_NM_VIEW").Value
		in_embarque  = objrs.Fields.Item("M06_IN_EMBARQUE").Value
		in_dt_prev   = objrs.Fields.Item("M06_IN_DT_PREV").Value
		in_download  = objrs.Fields.Item("M06_IN_DOWNLOAD").Value
		in_email     = objrs.Fields.Item("M06_IN_EMAIL").Value
		in_print     = objrs.Fields.Item("M06_IN_PRINT").Value
		in_doctos    = objrs.Fields.Item("M06_IN_DOCTOS").Value
		in_padrao    = objrs.Fields.Item("M06_IN_PADRAO").Value
		tp_relat     = objrs.Fields.Item("M06_TP_RELAT").Value
		tp_quebra    = objrs.Fields.Item("M06_TP_QUEBRA").Value
		tp_ref_cli   = objrs.Fields.Item("M06_TP_REF_CLI").Value
		cd_evento    = objrs.Fields.Item("M06_CD_EVENTO").Value
		nr_dias      = objrs.Fields.Item("M06_NR_DIAS").Value
		opcao_kpi    = objrs.Fields.Item("M06_IN_KPI").Value
		tp_limitador = objrs.Fields.Item("M06_TP_LIMITADOR").Value
		cd_ordem     = Null
		tp_ordem     = 0
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
	opcao_kpi    = Request.Form("opcao_kpi")
	tp_limitador = Request.Form("tp_limitador")
	cd_ordem     = Null
	tp_ordem     = 0
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
		Case "1302" 'Numerario x Despesas Pagas
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
		
		in_print = 1
		in_download = 1
		
		'monta o select para inclusão da personalização
		sql = "UPDATE M06_VIEW SET " &_
					"  M06_NM_VIEW      = "& fnc_QuotedSQL(nm_view) &", "&_
					"  M06_IN_EMBARQUE  = "& in_embarque &", "&_
					"  M06_IN_DT_PREV   = "& in_dt_prev  &", "&_
					"  M06_IN_DOWNLOAD  = "& in_download &", "&_
					"  M06_IN_EMAIL     = "& in_email    &", "&_
					"  M06_IN_PRINT     = "& in_print    &", "&_
					"  M06_IN_DOCTOS    = "& in_doctos   &", "&_
					"  M06_IN_PADRAO    = "& in_padrao   &", "&_
					"  M06_TP_RELAT     = "& fnc_QuotedSQL(tp_relat)   &", "&_
					"  M06_TP_QUEBRA    = "& fnc_QuotedSQL(tp_quebra)  &", "&_
					"  M06_TP_REF_CLI   = "& fnc_QuotedSQL(tp_ref_cli) &", "&_
					"  M06_CD_EVENTO    = "& fnc_QuotedSQL(cd_evento)  &", "&_
					"  M06_NR_DIAS      = "& fnc_QuotedSQL(nr_dias)    &", "&_
					"  M06_CD_CAMPO     = "& fnc_QuotedSQL(cd_ordem)   &", "&_
					"  M06_TP_ORDEM     = "& fnc_QuotedSQL(tp_ordem)   &", "&_
					"  M06_IN_KPI       = "& fnc_QuotedSQL(opcao_kpi)   &",  "&_
					"  M06_TP_LIMITADOR = "& fnc_QuotedSQL(tp_limitador)   &"  "&_
					"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view) 
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		
		'verifica se ocorreram erros, se sim, informa usuário

		If Err.Number = 0  Then  '--------------------------------------------------------------MENSAGEM DE ERRO
			if isnull(tp_exibir_Export) then 
			tx_erro = tx_lang_004017(cd_lang) &"!"
			end if
			'Response.Redirect("../IMPORT/teste.asp?var1="&tp_exibir_Export&"")
			'verifica se a nova view é padrão
			'If in_padrao Then
		    '		sql = "UPDATE M06_VIEW SET " &_
			'				"  M06_IN_PADRAO = 0 " &_
			'				"WHERE M06_CD_VIEW   <> "& fnc_QuotedSQL(cd_view) &_
			'				"  AND M06_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
			'				"  AND M06_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
			'				"  AND M06_CD_USUARIO = "& fnc_QuotedSQL(cd_user)
			'	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			'	objcnn.Execute(sql)
			'End If
			
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
                    If Left(Left(str, cont - 1), 3) = "kpi" Then
                      tp_kpi = Right(Left(str, cont - 1), 1)
                    Else
                      tp_kpi = "0"
                    End If
                    
                    If tp_kpi = "2" Then
                      sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					    "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					    ") " &_
					    "VALUES ( "&_
				        fnc_QuotedSQL(cd_view) &", "&_
					    fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					    UBound(matriz) - num  &_
					    ", " & fnc_QuotedSQL("0") &  ", " & fnc_QuotedSQL("2") &  " )"
					  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					  objcnn.Execute(sql)
                      
                      sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					    "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					    ") " &_
					    "VALUES ( "&_
				        fnc_QuotedSQL(cd_view) &", "&_
					    fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					    UBound(matriz) - num  &_
					    ", " & fnc_QuotedSQL("1") &  ", " & fnc_QuotedSQL("2") &  " )"
					  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					  objcnn.Execute(sql)
                    Else
					sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					  "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					  ") " &_
					  "VALUES ( "&_
				      fnc_QuotedSQL(cd_view) &", "&_
					  fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					  UBound(matriz) - num  &_
					  ", " & fnc_QuotedSQL(tp_kpi) &  ", " & fnc_QuotedSQL(tp_kpi) &" )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					End If
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
'vdata = color: #0000FF
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.vtxt {
	color: #000000;
}
.vdata {
	color: #0066cc;
}

.kpi {
	color: #CAA637;
}

.style2 {color: #0066cc}

.edtLabel {
    background-color:transparent;
	border: 0;
	color: #0066cc
}
</style>
<script language="javascript" type="text/javascript">
<!--
function ExcluiRelatorio(){
  if (confirm('Deseja realmente excluir o relatório selecionado?')){
    document.location='?in_acao=excluir&cd_view=<%= cd_view%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';
  }
}


function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div_info = document.getElementById(vDiv1);
		var div_info_corpo = document.getElementById(vDiv2);
		var div_info_rodape = document.getElementById(vDiv3);
		var div_frame = document.getElementById('divFrame');
		div_info.style.display = "none";
		div_info_corpo.style.display = "none";
		div_info_rodape.style.display = "none";
		div_frame.style.visibility = "hidden";
	}	
}

function ExibeDetalhes(vDiv, vDiv2, vDiv3, tipo) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;	
		
		var w = 500;
		var z = 300;
		var div_info = document.getElementById(vDiv); 
		var div_info_corpo = document.getElementById(vDiv2); 
		var div_info_rodape = document.getElementById(vDiv3); 
		var div_frame = document.getElementById('divFrame');
		
				
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		var x1 = ((x-250)-w)/2;
		var x2 = Math.round(x1);
		//alert(div_info.style.width);
		//alert(x);//1280
		//alert(y);//1024
		div_frame.style.width = w;
		div_frame.style.height = z;
		div_frame.style.left = (x2);
		div_frame.style.top = ((y4)/2)-26;
		div_frame.style.visibility = "visible";
		div_frame.style.filter= "alpha(opacity=0)";
		
		
		div_info.style.width = w;
		div_info.style.height = 26;
		div_info.style.left = (x2);
		div_info.style.top = ((y4)/2)-26;
		div_info.style.display = "block";
		div_info.style.filter= "alpha(opacity=92)";
		
		div_info_corpo.style.width = w;
		div_info_corpo.style.height = z;
		div_info_corpo.style.left = (x2);
		div_info_corpo.style.top = ((y4)/2)-2;
		div_info_corpo.style.display = "block";
		div_info_corpo.style.filter= "alpha(opacity=91)";
		
		div_info_rodape.style.width = w;
		div_info_rodape.style.height = 26;
		div_info_rodape.style.left = (x2);
		div_info_rodape.style.top = ((y4)/2)+298;
		div_info_rodape.style.display = "block";
		div_info_rodape.style.filter= "alpha(opacity=92)";
	}
}

function clickKpi(objeto){
	var div_kpi = document.getElementById('divKpiSelecionado');
	var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
	var contador_kpi = document.getElementById('contador_kpi').value;
	var kpi_selecionado = document.getElementById('kpi_selecionado');
	var kpi_id_selecionado = document.getElementById('kpi_id_selecionado');
	var kpi_codigo_selecionado = document.getElementById('kpi_codigo_selecionado');
	var contador_total_kpi = document.getElementById('contador_total_kpi').value;
	var contador_total_kpi_aux = document.getElementById('contador_total_kpi_aux').value;
	var codigo_kpi = eval("document.getElementById('kpi_codigo"+ objeto.id +"').value");
	
	
	if (objeto.checked){
		contador_kpi++;
	}else{
		contador_kpi--;
		document.getElementById('kpi_selecionado').value = "";
		document.getElementById('kpi_id_selecionado').value = "";
		document.getElementById('kpi_codigo_selecionado').value = "";
	}

	document.getElementById('contador_kpi').value = contador_kpi;
	if (document.getElementById('contador_kpi').value < 2){
		kpi_selecionado.value = objeto.value;
		kpi_id_selecionado.value = objeto.id;
		kpi_codigo_selecionado.value = codigo_kpi;
	}	
	if (document.getElementById('contador_kpi').value == 2){
		contador_total_kpi++;
		contador_total_kpi_aux++;
		document.getElementById('contador_total_kpi').value = contador_total_kpi;
		document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
		div_kpi_nao.style.display = 'none';
		div_kpi.style.display = 'block';
		
		if (!eval("document.getElementById('flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi +"')")){
		var texto_kpi = "<div id='kpi"+ document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi +"'><input type='text' style='display:none' value='0' id='tipo_kpi"+ contador_total_kpi +"'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi"+ contador_total_kpi +"_tp1' onclick='alteraCheckKPI(this);' checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi"+ contador_total_kpi +"_tp2' onclick='alteraCheckKPI(this);'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:retiraKpi(\"" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "\");'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;&nbsp;<input type='text' style='display:none' name='codigo_kpi"+ contador_total_kpi +"' id='codigo_kpi"+ contador_total_kpi +"' value='kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "'><input type='text' style='display:none' name='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' id='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' value='kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' ><input type='text' style='display:none' name='texto_kpi" + contador_total_kpi + "' id='texto_kpi" + contador_total_kpi + "' value='(KPI) " + document.getElementById('kpi_selecionado').value + " x " + objeto.value + "' >" + document.getElementById('kpi_selecionado').value + " x " + objeto.value + "<br></div>";
		div_kpi.innerHTML += texto_kpi;
		}else{
		contador_total_kpi--;
		contador_total_kpi_aux--;
		document.getElementById('contador_total_kpi').value = contador_total_kpi;
		document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
		}
		document.getElementById('kpi_selecionado').value = "";
		document.getElementById('kpi_id_selecionado').value = "";
		document.getElementById('kpi_codigo_selecionado').value = "";
		document.getElementById('contador_kpi').value = 0;
		var total_kpi = document.all.kpi.length;
		for (i=0; i< total_kpi;i++){	
			if (document.all.kpi[i].checked){
				document.all.kpi[i].checked = false;
			}
		}	
	}
}

function retiraKpi(kpi){
	var texto = eval("document.all.flag_kpi" + kpi + ".value;");
	for (j = 0; j <= document.frmview.array_campo.length-1; j++){
		if (texto == document.frmview.array_campo.options[j].value){
		document.frmview.array_campo.remove(j);
		break;
		}
	}
	
	var div_kpi = document.getElementById('divKpiSelecionado');
	var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
   	var linha_texto = eval("document.getElementById('kpi"+ kpi+"');");
   	var removido_texto = div_kpi.removeChild(linha_texto);  
	var contador_total_kpi_aux = document.getElementById('contador_total_kpi_aux').value;
	contador_total_kpi_aux--;
	document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
	
	if (document.getElementById('contador_total_kpi_aux').value == 0){
		div_kpi.style.display = 'none';
		div_kpi_nao.style.display = 'block';
	}		
}

function confirmaKpi(){
	FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');
	var total = document.getElementById('contador_total_kpi').value;
	
	for (i = 1; i <= total; i++) {
		if (eval("document.getElementById('codigo_kpi" + i +"')")){
			var valor  = eval("document.all.codigo_kpi" + i + ".value;");
			var texto  = eval("document.all.texto_kpi" + i + ".value;");
            var tipo  = eval("document.all.tipo_kpi" + i + ".value;");
            valor = valor + "_" + tipo;
			var confere = 0;
			for (j = 0; j <= document.frmview.array_campo.length-1; j++){
				if (texto == document.frmview.array_campo.options[j].text){
				confere = 1;
				break;
				}
			}
			if (confere == 0){
				document.frmview.array_campo.options[document.frmview.array_campo.length] = new Option(texto, valor);
				document.frmview.array_campo.options[document.frmview.array_campo.length-1].style.color = "#CAA637";
			}
		}
	}
}

function mudaOpcaoKpi(objeto){
	if (objeto.checked){
		document.getElementById('opcao_kpi2').value = "1";
		document.frmview.opcao_kpi.value = "1";
	}else{
		document.getElementById('opcao_kpi2').value = "0";
		document.frmview.opcao_kpi.value = "0";
	}
}

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
	//Filtros   - flavio
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
		if (form.nr_dias.value < -1) {
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n Campo NÚMERO DE DIAS Inválido.');")%>
		document.frmview.nr_dias.focus();
		document.frmview.nr_dias.select();
		valida = false;      
	}
	return valida;
}

function combo_altera(origem, destino, todos) {
	if (todos == true) {
		//se for todos os registros
		for (var c = 0; c <= origem.length -1; c++) {
			var valor = origem.options[c].value;
			var item  = origem.options[c].text;
			var cor   = origem.options[c].style.color;
			destino.options[destino.length] = new Option(item, valor);
			destino.options[destino.length-1].style.color = cor;
		}
		origem.length = 0;
	} else {
		//se for um registro só
		var sel = origem.selectedIndex;
		if (sel >= 0) { 
			//pega os dados do registro selecionado na orgiem
			var valor = origem.options[origem.selectedIndex].value;
			var item  = origem.options[origem.selectedIndex].text;
			var cor   = origem.options[origem.selectedIndex].style.color;
			//inclui o registro no destino
			destino.options[destino.length] = new Option(item, valor);
			destino.options[destino.length-1].style.color = cor;
			//tira o registro da origem
			for (var c = 0; c <= origem.length - 2; c++) {
				if (c >= sel) {
					origem.options[c].value = origem.options[c + 1].value;
					origem.options[c].text  = origem.options[c + 1].text;
					origem.options[c].style.color  = origem.options[c + 1].style.color;  
				}
			}
			origem.length = origem.length - 1;
		}
	}
	//altera a qtde de filtros/campos utilizados
	document.frmview.qtd_filtro.value = '[' + document.frmview.array_filtro.length + ']';
	document.frmview.qtd_campo.value  = '[' + document.frmview.array_campo.length  + ']';
}

function combo_valor(campo, valor) {    
  valor.value = "";
  for (var c = 0; c < campo.length; c++) {
    valor.value = campo.options[c].value + "," + valor.value; 
  }
}

function rElemento(objeto){
    return document.getElementById(objeto);
}

function movimenta(tipo,combo) {
    var elemento = rElemento(combo);
    var item_list = elemento.selectedIndex;
    
    if (item_list == -1){
        alert("Primeiramente, selecione um campo.");
    }else {
        var item_old_val = elemento[item_list].value;
        var item_old_txt = elemento[item_list].text;
        var item_old_cor = elemento[item_list].style.color;
		
        var novo_item_list = item_list + (tipo? -1 : 1);
    
        if (novo_item_list >= 0 && novo_item_list <= elemento.length-1){
            elemento.selectedIndex = 0
            elemento[item_list].value = elemento[novo_item_list].value
            elemento[item_list].text = elemento[novo_item_list].text
			elemento[item_list].style.color = elemento[novo_item_list].style.color
            elemento[novo_item_list].value = item_old_val
			elemento[novo_item_list].text = item_old_txt
			elemento[novo_item_list].style.color = item_old_cor
			elemento.selectedIndex = novo_item_list
        }else{
			elemento.selectedIndex = item_list
		}        
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
		fnc_desabilita();	
	}
	else {
		document.frmview.rd_nao.disabled = false;
		document.frmview.rd_sim.disabled = false;
		document.frmview.rd_nao.checked = true;
		document.frmview.rd_sim.checked = true;
		fnc_rd_sim();
	}
<%
End If
%>
}

function fnc_desabilita_novo(acao){
if (document.frmview.cd_evento && document.frmview.rd_nao && document.frmview.rd_sim && document.frmview.nr_dias){
	if (acao == "novo"){
			document.frmview.rd_nao.checked = false;
			document.frmview.rd_sim.checked = false;
			document.frmview.rd_nao.disabled = true;
			document.frmview.rd_sim.disabled = true;
			document.frmview.nr_dias.value = '';
			document.frmview.nr_dias.readOnly=true;			
	}
	if (acao == "alterar" || acao == "editar" || acao == "incluir"){
		if (document.frmview.cd_evento.value == ''){
			document.frmview.rd_sim.checked = false;
			document.frmview.rd_nao.disabled = true;
			document.frmview.rd_sim.disabled = true;
			document.frmview.nr_dias.value = '';
			document.frmview.nr_dias.readOnly=true;		
		}else{
			if (document.frmview.rd_nao.checked){
				fnc_rd_nao();
			}	
		}
	}	
}
}

function fnc_desabilita(){
		document.frmview.rd_nao.checked = false;
		document.frmview.rd_sim.checked = false;
		document.frmview.rd_nao.disabled = true;
		document.frmview.rd_sim.disabled = true;
		document.frmview.nr_dias.value = '';
		document.frmview.nr_dias.readOnly=true;
		document.frmview.tp_limitador.value = "0";
}

function fnc_rd_sim(){
	if (document.frmview.rd_sim.checked){
		document.frmview.nr_dias.readOnly=false;
		document.frmview.nr_dias.value='';
		document.frmview.nr_dias.style.color='black';
		document.frmview.nr_dias.focus();
		if(!document.frmview.rd_nao.checked){
			document.frmview.tp_limitador.value = "2";
		}else{
			document.frmview.tp_limitador.value = "3";
		}
	}else{
		if(document.frmview.rd_nao.checked){
			fnc_rd_nao();
		}else{
			document.frmview.cd_evento.value = '';
			fnc_desabilita();
		}
	}
}

function fnc_rd_nao(){
	if (document.frmview.rd_nao.checked){
		if (!document.frmview.rd_sim.checked){
		document.frmview.nr_dias.style.color='white';
		document.frmview.nr_dias.value='-1';
		document.frmview.nr_dias.readOnly=true;
		document.frmview.tp_limitador.value = "1";
		}else{
		document.frmview.nr_dias.focus();
		document.frmview.tp_limitador.value = "3";
		}
	}else{
		if(document.frmview.rd_sim.checked){ 
		var valor_nr_dias = document.frmview.nr_dias.value;
			fnc_rd_sim();
			document.frmview.nr_dias.value = valor_nr_dias;
		}else{
			document.frmview.cd_evento.value = '';
			fnc_desabilita();
		}
	}
}

function fnc_iniciaQtd(){
    document.frmview.qtd_filtro.value = '[' + document.frmview.array_filtro.length + ']';
    document.frmview.qtd_campo.value  = '[' + document.frmview.array_campo.length  + ']';
	var total = document.getElementById('campo').options.length;
	if(total > 75){
	document.getElementById('divAddTodos').style.display = 'none';
	document.getElementById('divAddTodosDes').style.display = 'block';
	}else{
	document.getElementById('divAddTodos').style.display = 'block';
	document.getElementById('divAddTodosDes').style.display = 'none';
	}
}


function alteraCheckKPI(objeto){
  var id = objeto.id; 
  var id_principal = objeto.id; 
  var texto = objeto.id;
  var j;
  if (Right(objeto.id, 3) == 'tp1'){
    id = id.replace('tp1', 'tp2')
    id_principal = id_principal.replace('_tp1','')
    texto = texto.replace('_tp1','');
    if (objeto.checked){
      if (document.getElementById(id).checked){
        document.getElementById(id_principal).value = 2;
      }else{
        document.getElementById(id_principal).value = 0;
      }
    }else{
      document.getElementById(id).checked = true;
      alteraCheckKPI(document.getElementById(id));
    }  
  }else{
    id = id.replace('tp2', 'tp1')
    id_principal = id_principal.replace('_tp2','')
    texto = texto.replace('_tp2','');
    if (objeto.checked){
      if (document.getElementById(id).checked){
        document.getElementById(id_principal).value = 2;
      }else{
        document.getElementById(id_principal).value = 1;
      }
    }else{
      document.getElementById(id).checked = true;
      alteraCheckKPI(document.getElementById(id));
    }  
  }  
  for (j = 0; j <= document.frmview.array_campo.length-1; j++){
    var texto = texto.replace('tipo_kpi', 'texto_kpi');
    if (document.getElementById(texto).value == document.frmview.array_campo.options[j].text){
      //alert(document.frmview.array_campo.options[j].value);
      document.frmview.array_campo.options[j].value = Left(document.frmview.array_campo.options[j].value, 12) + '_' + document.getElementById(id_principal).value;
      //alert(document.frmview.array_campo.options[j].value);
    }
  }  
}
-->
</script>
</head>
<body onLoad="fnc_iniciaQtd();document.frmview.nm_view.focus();fnc_desabilita_novo('<%=in_acao%>');">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
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
      <%
	  If objrsx.State = adStateOpen Then objrsx.Close()
	  sql_campos = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
				"  AND LEFT(LTRIM(RTRIM(M10_AP_CAMPO)),5) = 'DT_EV' "&_
				"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"		
				
	objrsx.Open sql_campos, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
          <iframe id="divFrame" src="" style="visibility: hidden; position: absolute; z-index: 2;"></iframe><div id="divInfo" class="divInfo" style="overflow:hidden;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
	<tr height="25">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="center" valign="middle">&nbsp;&nbsp;<b><%= tx_lang_CV006(cd_lang)%></b>&nbsp;&nbsp;</td>
					<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');"><img src="/imagens/30/btn_fechar.gif" width="18" height="17" border="0" alt="<%=tx_lang_D00011(cd_lang)%>"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
    </table></div>
    <div id="divInfoCorpo" class="divInfo">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
    <tr valign="top" height="20"><td><br>
    </td></tr>
    <tr valign="top" height="20"><td><br>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center"><tr><td align="left" valign="top">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
    <tr valign="top">
    <td class="gridtit" width="5px"></td><td class="gridtit" ><%=tx_lang_CV009(cd_lang)%></td>
    </tr>
    <%
	If objrsx.RecordCount > 1 Then
		While not objrsx.eof%>
		<tr height="20"><td align="center" width="5px"><input type="checkbox" name="kpi" id="<%= objrsx("M10_AP_CAMPO")%>" value="<%= objrsx("M10_NM_DADO")%>" onClick="clickKpi(this);"><input type="text" name="kpi_codigo<%= objrsx("M10_AP_CAMPO")%>" id="kpi_codigo<%= objrsx("M10_AP_CAMPO")%>" value="<%= objrsx("M10_CD_DADO")%>" style="display:none;"></td><td><nobr><%= objrsx("M10_NM_DADO")%>&nbsp;</nobr></td></tr>
		<%
		objrsx.MoveNext
		Wend
		objrsx.Close
	Else
		%>
		<tr height="20px"><td colspan="2" align="center"><%=tx_lang_CV010(cd_lang)%></td></tr>
		<%
	End If
	%>
    </table>
    </td></tr></table>
    </td></tr>
    <tr valign="top"><td><br><br>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr valign="top"><td align="left" valign="top">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
    <tr valign="top">
    <td class="gridtit" width="10%"><nobr>&nbsp;<%=tx_lang_CV017(cd_lang) %>&nbsp;</nobr></td><td class="gridtit" width="10%"><nobr>&nbsp;<%=tx_lang_CV018(cd_lang) %>&nbsp;</nobr></td><td class="gridtit" width="80%"><%=tx_lang_CV011(cd_lang)%></td>
    </tr>
    <tr height="20">
    <%
	If objrsx.State = adStateOpen Then objrsx.Close()
	sql= " SELECT DISTINCT M14_CD_CAMPO AS CD_CAMPO, (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
	" + ' x ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO, 'X', NULL, NULL, M14_NR_ORDEM, M14_TP_KPI_AUX AS TP_KPI "&_
	" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI'"&_
	" ORDER BY M14_NR_ORDEM"
    'Response.write sql
    'Response.end
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
	If objrsx.RecordCount > 0 Then
	%>
    <td colspan="3"><div id="divKpiSelecionado" style="display:block;">
    <%
	total_contador_kpi = 0
	While Not objrsx.eof
	total_contador_kpi = total_contador_kpi + 1
	%>
	<div id='<%= objrsx.Fields.Item("CD_CAMPO").value%>' style="height:18px;"><input type="text" style="display:none" <%If objrsx.Fields.Item("TP_KPI").value = 0 Then %>value="0"<%Else%>value="1"<%End If %> name="tipo_kpi<%= total_contador_kpi%>" id="tipo_kpi<%= total_contador_kpi%>">  
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="tipo_kpi<%= total_contador_kpi%>_tp1" onclick="alteraCheckKPI(this);"  <%If objrsx.Fields.Item("TP_KPI").value = 0 or objrsx.Fields.Item("TP_KPI").value = 2 Then %>checked<%End If%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="tipo_kpi<%= total_contador_kpi%>_tp2" onclick="alteraCheckKPI(this);" <%If objrsx.Fields.Item("TP_KPI").value = 1 or objrsx.Fields.Item("TP_KPI").value = 2 Then %>checked<%End If%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:retiraKpi('<%= Right(objrsx.Fields.Item("CD_CAMPO").value,9)%>');"><img src="/imagens/30/btn_delete.gif" border="0" style="vertical-align:absmiddle;"></a>&nbsp;&nbsp;<input type="text" style="display:none" value="<%= objrsx.Fields.Item("CD_CAMPO").value%>_<%= objrsx.Fields.Item("TP_KPI").value%>" name="codigo_kpi<%= total_contador_kpi%>" id="codigo_kpi<%= total_contador_kpi%>"><input type="text" style="display:none" value="<%= objrsx.Fields.Item("CD_CAMPO").value%>" name="flag_<%= objrsx.Fields.Item("CD_CAMPO").value%>" id="flag_<%= objrsx.Fields.Item("CD_CAMPO").value%>"><input type="text" style="display:none" value="(KPI) <%= Trim(objrsx.Fields.Item("NM_CAMPO").value)%>" name="texto_kpi<%= total_contador_kpi%>" id="texto_kpi<%= total_contador_kpi%>"><%= objrsx.Fields.Item("NM_CAMPO").value%><br></div>
	<%
	objrsx.MoveNext
	Wend
	objrsx.Close
	%>
    </div>
    <div id="divKpiSelecionadoNao" style="display:none;" align="center"><%=tx_lang_CV012(cd_lang)%></div>
    </td>
    <%Else%>
    <td colspan="3"><div id="divKpiSelecionado" style="display:none;"></div>
    <div id="divKpiSelecionadoNao" style="display:block;" align="center"><%=tx_lang_CV012(cd_lang)%></div>
    </td>
    <%End If%>
    </tr>
    </table>
    </td></tr>
    </table>
    </td></tr>
    </table>
    </div>
    <div id="divInfoRodape" class="divInfo" style="overflow:hidden;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td align="center">
    <input type="text" style="display:none" value="" name="kpi_selecionado" id="kpi_selecionado">
    <input type="text" style="display:none" value="" name="kpi_id_selecionado" id="kpi_id_selecionado">
    <input type="text" style="display:none" value="" name="kpi_codigo_selecionado" id="kpi_codigo_selecionado">
    <input type="text" style="display:none" value="0" name="contador_kpi" id="contador_kpi">
    <input type="text" style="display:none" value="<%= total_contador_kpi%>" name="contador_total_kpi" id="contador_total_kpi">
    <input type="text" style="display:none" value="<%= total_contador_kpi%>" name="contador_total_kpi_aux" id="contador_total_kpi_aux">
    <input name="submit_kpi" type="submit" class="button" value="<%=tx_lang_CV013(cd_lang)%>" onClick="confirmaKpi();">
    </td>
    </tr>
</table>
    </div>
        <table width="650" border="0" cellspacing="0" cellpadding="2" align="center">
        <br>
          <form name="frmview" action="<%= script &"?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>" method="post" onSubmit="return VerifyFormView(this);">
          <input type="text" style="display:none" value="<%= opcao_kpi%>" name="opcao_kpi" id="opcao_kpi">
          <input type="text" style="display:none" value="<%= tp_limitador%>" name="tp_limitador" id="tp_limitador">
            <tr>
              <td width="20%" align="right" class="label"><label for="nome" style="color:<%=color_texto%>;"><%= tx_lang_004027(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
              <input name="nm_view" type="text" class="editbox" id="nome" style="width:250px;" value="<%If checkPassagem=nm_view then%><%=request("nm_view")%><%else%><%= nm_view%><%end if%>" maxlength="30">              </td>
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
				"ORDER BY NM_EVENTO"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Response.Redirect("../IMPORT/teste.asp?var1="&tx_erro&"")

	'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
	'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
	If Not objrs.Eof then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="evento"><%= tx_lang_004028(cd_lang)%></label></td>
              <td width="43%" background="/imagens/30/fig_cad1.gif" style="background-repeat:no-repeat;background-position:right;">&nbsp;&nbsp;
                <select name="cd_evento" class="select" style="width:250px;" onChange="fnc_EventoLimitadorChange(this);">
                  <option value="" selected><%= tx_lang_004029(cd_lang)%></option>
                  <%
		Do While Not objrs.Eof
			selected = ""
			If cd_evento = Trim(objrs.Fields.Item("CD_EVENTO").Value) and fnc_TestaVar(nr_dias) Then selected = " selected"
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
                </select>              </td>
              
              <td width="37%" background="/imagens/30/fig_cad2.gif" style="background-repeat:no-repeat;background-position:left;">
<%
		If ex_dias Then

%>				
  <input name="rd_dias" id="rd_nao" type="checkbox" <%if (tp_limitador = "1" or tp_limitador = "3") and fnc_TestaVar(nr_dias) then response.Write("checked") end if%> onClick="fnc_rd_nao();" <%if not fnc_TestaVar(nr_dias) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV001(cd_lang)%><br>
  <input name="rd_dias" id="rd_sim" type="checkbox" <%if (tp_limitador = "2" or tp_limitador = "3") and fnc_TestaVar(nr_dias) then response.Write("checked") end if%> onClick="fnc_rd_sim();" <%if not fnc_TestaVar(nr_dias) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV002(cd_lang)%> <input class="editbox" type="text" name="nr_dias" size="2" maxlength="3" value="<%if nr_dias = "-1" then response.Write("") else response.Write(nr_dias) end if%>"> 
<%=tx_lang_CV003(cd_lang)%>
<%
		End If
%></td>
            </tr>
            <%
	End If
	objrs.Close
End If
'response.Redirect("../import/teste.asp?var='"&ex_relat&"'")



If ex_relat Then
 Select Case cd_menu&cd_subm
   Case "0104"%>
   <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
                <input name="tp_relat" type="radio" value="1" id="pedido"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="pedido"><%= tx_lang_004075(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="0" id="processo"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="radio"><%= tx_lang_005007(cd_lang)%></label>
            </tr>  
   <%  
   Case "0201"
        CheckMenu="Exportação"
		'cd_cargo1 = Request.Cookies("cd_cargo")	
		'response.Write permisso & ","
		'Response.Write cd_cargo1
		'response.end
		
   		'If Session("cd_cargo")=1 or  permisso=1 then
	    tp_exibir_Export=tp_relat
   				'response.Redirect("../import/teste.asp?var='"&Session("cd_cargo")&"'")%>
               <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <% 'tp_exibir_Export=tp_relat
								'Usuário  tem opção de exibição - mostra apenas os campos configurados na tabela
								'Se tp_exibir_Export=1 -> Por Pedido ou   tp_exibir_Export= 0 -> Por embarque%>
								<input name="tp_relat" type="radio"  onClick="alteraCampos('0', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>',1);alteraCampos('0', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 1);" value="0" id="embarque"<%If tp_relat = "0" or tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="embarque"><%= tx_lang_004066(cd_lang)%> <%'=tx_lang_004066(cd_lang)%></label>
								<input name="tp_relat" type="radio" onClick="alteraCampos('3', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 1);alteraCampos('3', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 3);" value="3" id="fatura"<%If tp_relat = "3" Then Response.Write(" checked")%>>
                <label for="fatura"><%= tx_lang_004082(cd_lang)%></label>
                                <input name="tp_relat" type="radio" onClick="alteraCampos('1', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 1);alteraCampos('1', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= nr_max_campo%>', 2);" value="1" id="pedido"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="pedido"><%= tx_lang_004067(cd_lang)%></label></td>
            </tr>
         <%'End If
   Case "0206" 
         CheckMenu="Exportação"%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
                <input name="tp_relat" type="radio" value="0" id="pais"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="pais"><%= tx_lang_004080(cd_lang)%></label>
                <input name="tp_relat" type="radio" value="1" id="familia"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="familia"><%= tx_lang_004081(cd_lang)%></label>
                </td>
            </tr>
            <%		
   Case "0101" 
         CheckMenu="Importação"%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
                <input name="tp_relat" type="radio" value="2" id="ambos"<%If tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="ambos"><%= tx_lang_004032(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="adm"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="adm"><%= tx_lang_004033(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="0" id="des"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004034(cd_lang)%></label></td>
            </tr>
            <%
	   Case "0601" 
         CheckMenu="Outros"%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
								<input name="tp_relat" type="radio" value="0" id="desp_desp"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="adm"><%= tx_lang_004076(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="desp"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004077(cd_lang)%></label><br>&nbsp;&nbsp; 
                <input name="tp_relat" type="radio" value="2" id="rec"<%If tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004078(cd_lang)%></label>
                <input name="tp_relat" type="radio" value="3" id="rec_sda"<%If tp_relat = "3" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004079(cd_lang)%></label>
                </td>
            </tr>
            <%	
			Case "1302" 
         CheckMenu="Outros"%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
								<input name="tp_relat" type="radio" value="0" id="desp_desp"<%If tp_relat = "0" Then Response.Write(" checked")%>>
                <label for="adm"><%= tx_lang_004076(cd_lang)%></label>
								<input name="tp_relat" type="radio" value="1" id="desp"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004077(cd_lang)%></label><br>&nbsp;&nbsp; 
                <input name="tp_relat" type="radio" value="2" id="rec"<%If tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004078(cd_lang)%></label>
                <input name="tp_relat" type="radio" value="3" id="rec_sda"<%If tp_relat = "3" Then Response.Write(" checked")%>>
                <label for="des"><%= tx_lang_004079(cd_lang)%></label>
                </td>
            </tr>
            <%	
    Case "0604"
	      CheckMenu="Outros"
%>
            <tr> <%tp_exibir_Export=2 'Usuário não tem opção de exibição - mostra todos os campos%>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp;
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
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="quebra"><%= tx_lang_004038(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="tp_quebra" class="select" id="quebra" style="width:250px;">
                  <option value="" selected><%= tx_lang_004039(cd_lang)%></option>
                  <%
				  If cd_menu <> "01" then
				  	aux_quebra = 1
				  else
				  	aux_quebra = 0	
				   End If	
	For cont = 0 to UBound(tipo_quebra) - aux_quebra
		selected = ""
		If cont = 0 and InStr("040;055;060", Session("cd_cargo")) > 0 Then cont = 1
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

If ex_embarque Then
	str = ""
	If in_embarque Then str = " background: #CCCCCC;"
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="embarque"><%= tx_lang_004040(cd_lang)%></label></td>
              <td colspan="2">&nbsp;
                <input type="checkbox" name="in_embarque" id="embarque" value="1"<%If in_embarque Then Response.Write(" checked")%> onClick="fnc_Processo(this);">
                <%= tx_lang_004041(cd_lang)%>.</td>
            </tr>
						<tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="tp_ref"><%= tx_lang_004042(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
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
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="padrao"><%= tx_lang_004046(cd_lang)%></label></td>
              <td colspan="2">&nbsp;
                <input type="checkbox" name="in_padrao" id="padrao" value="1"<%If in_padrao Then Response.Write(" checked")%>>
                <%= tx_lang_004047(cd_lang)%>.</td>
            </tr>
            <%
If ex_dt_prev Then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="prev"><%= tx_lang_004044(cd_lang)%></label></td>
              <td colspan="2">&nbsp;
                <input type="checkbox" name="in_dt_prev" id="prev" value="1"<%If in_dt_prev Then Response.Write(" checked")%>>
                <%= tx_lang_004045(cd_lang)%>.</td>
            </tr>
            <%
End If

If ex_doctos Then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="doctos"><%= tx_lang_004062(cd_lang)%></label></td>
              <td colspan="2">&nbsp;
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
              <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="center"><b><%= tx_lang_004058(cd_lang)%></b></td>
                    <td align="center"></td>
                    <td align="center"><b><%= tx_lang_004059(cd_lang)%></b> <input name="qtd_filtro" type="text" style="width:30px;text-align:center;" class="edtLabel" readonly></td>
                    <td align="center">&nbsp;</td>
                  </tr>
                  <tr align="center">
                    <td width="44%"><select size="10" name="filtro" onDblClick="combo_altera(document.frmview.filtro,document.frmview.array_filtro,false);" class="select" style="width: 250;">
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
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "#000000;"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("M11_CD_FILTRO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
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
                      </select>
                      <br>
                      <span class="style2">*   duplo-clique para incluir o filtro</span></td>
                    <td width="4%"><br>
                      <a href="#" onClick="combo_altera(document.frmview.filtro,document.frmview.array_filtro,true);"><img src="/imagens/30/arrow_dir.gif" border="0px" alt="<%= tx_lang_TF019(cd_lang)%>"></a><br>
                      <img src="/imagens/lay_all.gif" border="0px" height="5"><br>
                      <a href="#" onClick="combo_altera(document.frmview.array_filtro,document.frmview.filtro,true);" ><img src="/imagens/30/arrow_esq.gif" border="0px" alt="<%= tx_lang_TF020(cd_lang)%>"></a>
											<br>
											<br>
											</td>
                    <td width="44%">
         <select size="10" name="array_filtro" onDblClick="combo_altera(document.frmview.array_filtro,document.frmview.filtro,false);" class="select" style="width:250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
                        <%
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "#000000;"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                   <option value="<%= objrs.Fields.Item("M11_CD_FILTRO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
					  %>
                      </select>
                      <br>
                      <span class="style2">*   duplo-clique para retirar o filtro</span></td>
                    <td width="8%" align="left"><img src="/imagens/30/arrow_cima.gif" border="0px" style="visibility:hidden"><br>
                    <img src="/imagens/30/arrow_baixo.gif" border="0px" style="visibility:hidden"></td>
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
              <td colspan="3"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="center"><b><%= tx_lang_004060(cd_lang)%></b></td>
                    <td align="center"></td>
                    <td align="center"><div id="divQtdCampos"><b><%= tx_lang_004061(cd_lang)%></b>&nbsp;<input name="qtd_campo" type="text" class="edtLabel" style="width:30px;text-align:center" readonly>
                    </div></td>
                    <td align="center">&nbsp;</td>
                  </tr>
                  <tr align="center">
                    <td width="44%">
                    <div id="divCampos">
                      <select class="select" size=10 name="campo" onDblClick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" style="width: 250;">
                      
                        <!-- <select name="campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" onkeypress="if(event.keyCode == 13) combo_altera(document.frmview.campo,document.frmview.array_campo,false);"> -->
                        <%
'seleciona os campos disponíveis para adcionar na personalização do relatório
' Se tp_exibir_Export=1 Exibe apenas os campos da M12_CAMPO  com tp_exibir_Export=1 e 2
' Se tp_exibir_Export=2 Exibe Todos os campos da M12_CAMPO 
' Se tp_exibir_Export=0 Exibe apenas os campos da M12_CAMPO  com tp_exibir_Export=0 e 2
'Response.Redirect("../import/teste.asp?var1="&tp_exibir_Export&"")
	If objrs.State = 1 Then objrs.Close
	sql_s = "SELECT M12_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA,M12_TP_EXIBIR_EXPORT, M10_CD_BROKER "&_
				"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND M12_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
				"  AND M12_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
				"  AND M12_CD_CAMPO NOT IN ( "&_
				"    SELECT M14_CD_CAMPO "
				
	sql_f = "    FROM M14_VIEW_CAMPO ( NOLOCK ) "&_
			"    WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view) &" ) "&_
			"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "

	Select Case  tp_exibir_Export ' se for selecionado Embarque ou pedido acrescenta....
		 Case  "0" , "1", "3"
			sql_f = sql_f & "  AND M12_TP_EXIBIR_EXPORT IN ('"&tp_exibir_Export&"','2') "
	End select
'Response.Redirect("../import/teste.asp?var1="&sql_F&"")

	sql_o = "ORDER BY "& tx_lang_dado 
	sql = sql_s&sql_f&sql_o				
'Response.Redirect("../import/teste.asp?var1="&tp_exibir_Export&"")
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "#000000;"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close

%>
                      
                      </select>
                       <br>
                      <span class="style2">*   duplo-clique para incluir o campo</span></td>
                      </div>
                      <%	
	'seleciona os campos utilizados na personalização
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M12_CD_CAMPO, RTRIM(M10_NM_DADO) AS M10_NM_DADO, M14_NR_ORDEM, M10_TP_DADO, M10_CD_BROKER, M12_TP_EXIBIR_EXPORT "&_
		" FROM M14_VIEW_CAMPO (NOLOCK) "&_
		" INNER JOIN M12_CAMPO (NOLOCK) ON (M14_CD_CAMPO = M12_CD_CAMPO)"&_
		" INNER JOIN M10_DADOS (NOLOCK) ON (M12_CD_DADO = M10_CD_DADO)"&_
		" WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view) &_
		" AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
		" AND M12_IN_ATIVO = 1 "&_
		" AND M10_IN_ATIVO = 1 "&_
		" UNION "&_
		" SELECT DISTINCT M14_CD_CAMPO + '_' + M14_TP_KPI_AUX AS CD_CAMPO, '(KPI) ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
		" + ' x ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO, M14_NR_ORDEM, 'X', NULL, NULL"&_
		" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI'"&_
		" ORDER BY M14_NR_ORDEM"

        'Response.write sql
        'Response.end
							
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	%>
	
                     
                    <td width="4%"><div id="divAddTodos"><br>
                      <a href="#" onClick="combo_altera(document.frmview.campo,document.frmview.array_campo,true);"><img id src="/imagens/30/arrow_dir.gif" border="0px" alt="<%= tx_lang_TF021(cd_lang)%>"></a><br></div>
                      <div id="divAddTodosDes" style="display:none">
                      <br>
                      <img id src="/imagens/30/arrow_dir_des.gif" border="0px" alt="<%= tx_lang_TF022(cd_lang)%>"></a><br></div>                     
                      <img src="/imagens/lay_all.gif" border="0px" height="5"><br>
                      <a href="#" onClick="combo_altera(document.frmview.array_campo,document.frmview.campo,true);"><img src="/imagens/30/arrow_esq.gif" border="0px" alt="<%= tx_lang_TF023(cd_lang)%>"></a>
					  <br>
                                            <br>
					</td>
                    <td width="44%">
                    <div id="divCamposSelecionados">
                    <select size=10 name="array_campo" onDblClick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);" class="select" style="width: 250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
												<%
	Do While Not objrs.Eof
	  If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			If (objrs.Fields.Item("M10_TP_DADO").Value = "X") Then
			color = "#CAA637;"
			Else
			color = "#000000;"
			End If
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
              
%>
                     <%If objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value=tp_exibir_Export or objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value=2 or isnull(objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value)  then %>   
                     <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
                     <%End If%>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
%>
                      </select>
                      <br>
                      <span class="style2">*   duplo-clique para retirar o campo</span>
                      </div>
                      </td>
                    <td width="8%" align="left"><a href="#" onClick="movimenta(true,'array_campo');"><img src="/imagens/30/arrow_cima.gif" border="0px" alt="<%= tx_lang_TF024(cd_lang)%>"></a><br>
                    <img src="/imagens/lay_all.gif" border="0px" height="3"><br>
                    <a href="#" onClick="movimenta(false,'array_campo');"><img src="/imagens/30/arrow_baixo.gif" border="0px" alt="<%= tx_lang_TF025(cd_lang)%>"></a></td>
                  </tr>
              </table>
              </td>
            </tr>
            <%
End If
objrsx.Close
%>
            <tr align="center">
				<%'Response.write array_campo
                'Response.end%>
              <td colspan="3" height="30" valign="bottom"><input type="hidden" name="in_acao" value="<%= in_tipo%>">
          <input type="hidden" name="cd_view" value="<%= cd_view%>">
          <input type="hidden" name="cd_menu" value="<%= cd_menu%>">
          <input type="hidden" name="cd_subm" value="<%= cd_subm%>">
          <input type="hidden" name="cd_user" value="<%= cd_user%>">
          <input type="hidden" name="cd_campo" value="<%= array_campo%>">
          <input type="hidden" name="cd_filtro" value="<%= array_filtro%>">
          <input type="submit" id="btn_cadastrar" name="btn_cadastrar" class="button" value="" onMouseOver="<%= script_campo & script_filtro%>" style="background-image:url('/imagens/cadastrar2<%If cd_lang=1 Then%>e<%End If%>.gif');background-repeat:no-repeat;border:0px;width:95px;height:28px;background-position:center;vertical-align:bottom;">
          <%If in_tipo <> "incluir" and Len(nm_page) > 0 Then
%>
        <a href="<%= nm_page&"_filtros.asp?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>"><img border=0 src="/imagens/30/filtro2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:history.back();" style="cursor:pointer;"></a>
        <%End If %>      
        <%
If cd_menu&cd_subm = "0101" or cd_menu&cd_subm = "0201" or cd_menu&cd_subm = "0215" Then
%>      
<img border=0 src="/imagens/30/kpi2.gif" align="middle"  onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape' ,1);" style="cursor:pointer;">
<%End If%>    
          <img border=0 src="/imagens/30/cancelar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:document.location='/default.asp';" style="cursor:pointer;">
                <%
If in_tipo = "alterar"  Then
%>
         <img border=0 src="/imagens/30/excluir2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:ExcluiRelatorio();" style="cursor:pointer;">
               <%
End If%>
        </td>
            </tr>
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
