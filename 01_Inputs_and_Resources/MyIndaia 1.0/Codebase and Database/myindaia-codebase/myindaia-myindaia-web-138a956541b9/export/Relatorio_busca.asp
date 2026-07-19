<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação / Tracking
'Arquivo de Script e HTML: Filtros do Relatório
'
'Autor: Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 25/05/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Session("sql_exp_track") = Null

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim tx_usado    'filtros usados para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim cd_filtros  'array dos códigos de filtros utilizados
Dim tx_filtros  'array dos filtros utilizados na consulta
Dim in_dt_null  'identifica se o relatório terá retorno de datas nulas
Dim cd_ev_dado  'código do dado do evento selecionado como limitador
dim vTxFiltro   'valor do filtro
'recupera o código da personalização e o filtro utilizado na pesquisa
in_show = False
cd_tela = "EXP002"
cd_view = Request("cd_view")
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
ap_filtros = Replace(Request("filtro"),", ","','")
in_dt_null = True
cd_ev_dado = Null
'recupera as informações da personalização e filtros
in_view_filtro = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
'seleciona os dados dos filtros selecionandos
sql = "SELECT M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_AP_FILTRO, M10_CD_BROKER, M11_TP_FROM "&_
			"FROM M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
			"WHERE M11_CD_MENU = '"& cd_menu &"' "&_
			"  AND M11_CD_SUBM = '"& cd_subm &"' "&_
			"  AND M11_CD_DADO = M10_CD_DADO "&_
			"  AND M10_AP_FILTRO IN ('"& ap_filtros &"') "&_
			"ORDER BY M11_NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")

'recupera os filtros utilizados e faz tratamento dos dados enviados.
Do While Not objrsx.Eof
	'agrupa os códigos dos filtros utilizados
	cd_filtros = cd_filtros & objrsx.Fields.Item("M10_CD_DADO").Value &";"
	'seleciona o apelido do filtro
	'Response.Redirect("../IMPORT/teste.asp?var1="&ap_filtros&"")

	ap_filtro  = objrsx.Fields.Item("M10_AP_FILTRO").Value
	'verifica o tipo de filtro e o meio de obter do form/querystring
	If objrsx.Fields.Item("M11_TP_FROM").Value = "0" Then
		If fnc_TestaVar(Request(ap_filtro)) Then
			select case objrsx.Fields.Item("M10_CD_DADO").Value
				case "0548" 'numero da rap
					vTxFiltro = Trim(Request(ap_filtro))
					str = ""
					for cont = 1 to len(vTxFiltro)
						if IsNumeric(Mid(vTxFiltro, cont, 1)) then str = str & Mid(vTxFiltro, cont, 1)
					next
					if Len(str) < 8 then str = fnc_AddZeros(str, 8)
					vTxFiltro = str
				case else
					vTxFiltro = Request(ap_filtro)

			end select
			tx_filtros = tx_filtros & vTxFiltro &";"
			tx_usado   = tx_usado &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &": "& Request(ap_filtro) &";\n"

			'verifica se o campo é especifico(tipo nr_processo, nr_cntr)
			If InStr(tx_pesquisa, objrsx.Fields.Item("M10_CD_DADO").Value) > 0 Then
				in_dt_null = False
				cd_evento  = Null
			End If
		Else
			tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &";\n"
		End If
	Else
	  If IsDate(Request(ap_filtro&"i")) or IsDate(Request(ap_filtro&"f")) Then
	  	tx_filtros = tx_filtros & Request(ap_filtro&"i") &"@"& Request(ap_filtro&"f") &";"
			tx_usado   = tx_usado &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &" de "& Request(ap_filtro&"i") &" à "& Request(ap_filtro&"f") &";\n"
			in_dt_null = False
		Else
			If IsDate(Request(ap_filtro&"i")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(inicial);\n"
			If IsDate(Request(ap_filtro&"f")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(final);\n"
		End If
	End If
	objrsx.MoveNext
	If objrsx.Eof Then Exit Do
Loop
If objrsx.State = adStateOpen Then objrsx.Close()
'caso ocorra algum erro redireciona para tela de busca e informa erros
If tx_erro <> "" Then
  Call sub_FechaConexao
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00028(cd_lang) &".\n"& tx_erro
  Response.Redirect("track_filtros.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_view="&cd_view&"&erro="&Server.URLEncode(tx_erro))
  Response.End
End If

'para os cargos abaixo é obrigatório ter a pesquisa por empresa e área
If InStr("040;055;060", Session("cd_cargo")) > 0 Then
	'verifica se não foi selecionada a busca por grupo/empresa do cliente
	If Not (InStr(cd_filtros, "0005") > 0) and Not (InStr(cd_filtros, "0006") > 0) Then
		cd_filtros = "0005;"& cd_filtros
		ap_filtros = "cd_grupo','"& ap_filtros
		tx_filtros = "X;"& tx_filtros
	End If
	'verifica se não foi selecionada a busca por área/sub-área do cliente
	If Not (InStr(cd_filtros, "0007") > 0) and Not (InStr(cd_filtros, "0008") > 0) Then
		cd_filtros = "0007;"& cd_filtros
		ap_filtros = "cd_area','"& ap_filtros
		tx_filtros = "X;"& tx_filtros
	End If
End If

'se não foi selecionado um periodo, busca o limitador
If in_dt_null or fnc_TestaVar(cd_evento) Then
  'retorna para true o uso de limitador
	in_dt_null = True
	'verifica se o evento é valido
  If Not fnc_TestaVar(cd_evento) Then cd_evento = "132"
	'verifica se a qtde de dias é valido
	If Not fnc_TestaVar(nr_dias) Then nr_dias = 30
	'define as datas do evento limitador
	dt_eventoi = fnc_mascara(DateAdd("d", -nr_dias, Date), 5)
  dt_eventof = fnc_mascara(date, 5)
	
	'recupera o código do filtro e adciona aos filtros.
	If objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT M10_CD_DADO "&_
				"FROM M10_DADOS ( NOLOCK ) "&_
				"WHERE M10_CD_BROKER = '"& cd_evento &"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	cd_ev_dado = objrsx.Fields.Item("M10_CD_DADO").Value
	cd_filtros = cd_filtros & cd_ev_dado &";"
	tx_filtros = tx_filtros & dt_eventoi &"@"& dt_eventof &";"
	
	If objrsx.State = adStateOpen Then objrsx.Close()
End if

Session("sql_pagina") = Session("sql_pagina") &"<br>"& cd_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& tx_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"in_dt_null = "& in_dt_null &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"cd_ev_dado = "& cd_ev_dado &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventoi = "& dt_eventoi &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventof = "& dt_eventof &"<br>"
							
'::::: CONSULTA ATRAVES DE STORED PORCEDURE :::::
With objcmd
	.CommandTimeOut = 300
	.CommandText    = "sp_rel_exp_track"
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("cd_view"   , adChar   , adParamInput,   12, cd_view)
	.Parameters.Append = .CreateParameter("cd_ev_dado", adChar   , adParamInput,    4, cd_ev_dado)
	.Parameters.Append = .CreateParameter("in_dt_null", adBoolean, adParamInput,    1, in_dt_null)
	.Parameters.Append = .CreateParameter("cd_filtros", adVarChar, adParamInput, 1024, cd_filtros)
	.Parameters.Append = .CreateParameter("tx_filtros", adVarChar, adParamInput, 1024, tx_filtros)
	.Parameters.Append = .CreateParameter("nr_ident"  , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("nr_result" , adInteger, adParamOutPut)
	.Execute nrec, , adExecuteNoRecords
	nr_ident  = .Parameters("nr_ident")
	nr_result = .Parameters("nr_result")
	'Response.Redirect("../IMPORT/teste.asp?var1="&nr_ident&"")

End With

If nr_result > 0 Then
  'esvazia a variavel de erro
  tx_erro  = Null
	tx_usado = Null
	ap_filtros = Split(ap_filtros, "','", -1)
	tx_filtros = Split(tx_filtros, ";", -1)

	For cont = 0 To Ubound(ap_filtros)
		tx_usado = tx_usado &"filtro="& ap_filtros(cont) &"&"& ap_filtros(cont) &"="& tx_filtros(cont) &"&"
	Next
	
  'escreve a url para redirecionamento
  str = "/export/Relatorio_result.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
Else
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00029(cd_lang) &".\n"& tx_usado
  'escreve a url para redirecionamento
  str = "/export/Relatorio_filtros.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro)
End If

Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include virtual="/includes/inc_ends.asp" -->