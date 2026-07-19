<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'-----------------------------------------------------------------------------------------------------------------------------------
'Descrição: busca de registros
'Autor: Alexandre Gonçalves Neto - Data: 21/09/2007
'Manutenção(nome, data - alteração, versão):
'1. Alexandre, 21/09/2007 - reformulação da página, v2.0.0
'2.
'-----------------------------------------------------------------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300
dim ap_filtro   'nome do filtro selecionado para a consulta
dim tx_usado    'filtros usados para a consulta
dim ap_filtros  'nome dos filtros utilizados
dim cd_filtros  'código dos filtros utilizados
dim tx_filtros  'textos dos filtros utilizados na consulta
dim in_dt_null  'identifica se o relatório terá retorno de datas nulas
dim cd_ev_dado  'código do dado do evento selecionado como limitador
Dim vl_total_num 'valor total de numerários recebidos
Dim vl_total_des 'valor total de despesas pagas
Dim vl_total_sld 'valor total do saldos(devedor ou credor)
dim vTxFiltro, vSqlSession
'recupera o código da personalização e o filtro utilizado na pesquisa
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
vSqlSession = "sql_"&ap_menu&"_"&ap_subm
Session(vSqlSession) = Null
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
'recupera os filtros utilizados e faz tratamento dos dados enviados.
Do While Not objrsx.Eof
	'agrupa os códigos dos filtros utilizados
	cd_filtros = cd_filtros & objrsx.Fields.Item("M10_CD_DADO").Value &";"
	'seleciona o apelido do filtro
	ap_filtro  = objrsx.Fields.Item("M10_AP_FILTRO").Value
	'verifica o tipo de filtro e o meio de obter do form/querystring
	Select Case objrsx.Fields.Item("M11_TP_FROM").Value 
		Case "0","2"
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
				tx_filtros = tx_filtros & Request(ap_filtro) &";"
				tx_usado   = tx_usado &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &": "& Request(ap_filtro) &";\n"
				'verifica se o campo é especifico(tipo nr_processo, nr_cntr)
				If InStr(tx_pesquisa, objrsx.Fields.Item("M10_CD_DADO").Value) > 0 Then
					in_dt_null = False
					cd_evento  = Null
				End If
			Else
				tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &";\n"
			End If
		Case "1"
			If IsDate(Request(ap_filtro&"i")) or IsDate(Request(ap_filtro&"f")) Then
				tx_filtros = tx_filtros & Request(ap_filtro&"i") &"@"& Request(ap_filtro&"f") &";"
				tx_usado   = tx_usado &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &" de "& Request(ap_filtro&"i") &" à "& Request(ap_filtro&"f") &";\n"
				in_dt_null = False
			Else
				If IsDate(Request(ap_filtro&"i")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(inicial);\n"
				If IsDate(Request(ap_filtro&"f")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(final);\n"
			End If
	End Select
	objrsx.MoveNext
	If objrsx.Eof Then Exit Do
Loop
If objrsx.State = adStateOpen Then objrsx.Close()
'caso ocorra algum erro redireciona para tela de busca e informa erros
If Len(tx_erro) > 0 Then
  Call sub_FechaConexao
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00028(cd_lang) &".\n"& tx_erro
  Response.Redirect("/engine/filtros.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_view="&cd_view&"&erro="&Server.URLEncode(tx_erro))
  Response.End
End If
'verifica se o produto foi desgnado como filtro
If Not (InStr(cd_filtros, "0002") > 0) Then
	cd_filtros = "0002;"& cd_filtros
	ap_filtros = "cd_produto','"& ap_filtros
	select case cd_menu
		case "01"
			if cd_subm <> "01" then tx_filtros = "01;"& tx_filtros
		case "02"
			tx_filtros = "02;"& tx_filtros
	end select
End If
'para os cargos abaixo é obrigatório ter a pesquisa por empresa e área
If InStr(CODCLIENTE, Session("cd_cargo")) > 0 Then
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
  If Not fnc_TestaVar(cd_evento) Then
		select case cd_menu&cd_subm 
			case "0101"
				If tp_relat = 0 Then cd_evento = "088" 'desembaraço
				If tp_relat = 1 Then cd_evento = "161" 'embarque
				If tp_relat = 2 Then cd_evento = "092" 'faturamento
			case "0102","0105","0106","0107","0801"
				cd_evento = "088" 'desembaraço
			case "0103","0203","0604"
				cd_evento = null
			case "0104","0601","0605"
				cd_evento = "092" 'faturamento
			case "0201","0202","0205"
				cd_evento = "132" 'embarque
			case "0602","0603"
				cd_evento = "162" 'chegada
			case else
				cd_evento = "092" 'faturamento(padrão)
		end select
	End If
	'recupera o código do filtro e adciona aos filtros.
	If objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT M10_CD_DADO FROM M10_DADOS (NOLOCK) WHERE M10_CD_BROKER = '"& cd_evento &"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'adiciona o evento limitador na querystring de pesquisa
	if objrsx.RecordCount > 0 then
		'verifica se a qtde de dias é valido
		If Not fnc_TestaVar(nr_dias) Then nr_dias = 30
		'define as datas do evento limitador
		cd_ev_dado = objrsx.Fields.Item("M10_CD_DADO").Value
		dt_eventoi = fnc_mascara(DateAdd("d", -nr_dias, Date), 5)
		dt_eventof = fnc_mascara(Date, 5)
		cd_filtros = cd_filtros & cd_ev_dado &";"
		tx_filtros = tx_filtros & dt_eventoi &"@"& dt_eventof &";"
	end if
	If objrsx.State = adStateOpen Then objrsx.Close()
End if
'salva na session os dados da pesquisa
Session("sql_pagina") = Session("sql_pagina") &_
	"<br>"& cd_filtros &"<br>"&"<br>"& tx_filtros &"<br>"&_
	"in_dt_null = "& in_dt_null &"<br>"&"cd_ev_dado = "& cd_ev_dado &"<br>"&_
	"dt_eventoi = "& dt_eventoi &"<br>"&"dt_eventof = "& dt_eventof &"<br>"
'::::: CONSULTA ATRAVES DE STORED PORCEDURE :::::
With objcmd
	.CommandTimeOut = 60
	.CommandText    = vNmSProc
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("@cd_view"   , adChar   , adParamInput, 12, cd_view)
	if not ((cd_menu = "01" or cd_menu = "02") and (cd_subm = "03")) then
		.Parameters.Append = .CreateParameter("@cd_ev_dado", adChar   , adParamInput, 4, cd_ev_dado)
		.Parameters.Append = .CreateParameter("@in_dt_null", adBoolean, adParamInput, 1, in_dt_null)
	end if
	.Parameters.Append = .CreateParameter("@cd_filtros", adVarChar, adParamInput, 1024, cd_filtros)
	.Parameters.Append = .CreateParameter("@tx_filtros", adVarChar, adParamInput, 1024, tx_filtros)
	.Parameters.Append = .CreateParameter("@nr_ident"  , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@nr_result" , adInteger, adParamOutPut)
	if cd_menu&cd_subm = "0601" then
		.Parameters.Append = .CreateParameter("@vl_total_num" , adDouble , adParamOutPut)
		.Parameters.Append = .CreateParameter("@vl_total_des" , adDouble , adParamOutPut)
		.Parameters.Append = .CreateParameter("@vl_total_sld" , adDouble , adParamOutPut)
	end if
	.Execute nrec, , adExecuteNoRecords
	nr_ident  = .Parameters("@nr_ident")
	nr_result = .Parameters("@nr_result")
	if cd_menu&cd_subm = "0601" then
		vl_total_num = .Parameters("@vl_total_num")
		vl_total_des = .Parameters("@vl_total_des")
		vl_total_sld = .Parameters("@vl_total_sld")
	end if
End With
'verifica se foram encontrados registros
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
  str = "/"&ap_menu&"/"&ap_subm&"_result.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident
	if cd_menu&cd_subm = "0601" then str = str &"&vl_total_num="& vl_total_num &"&vl_total_des="& vl_total_des &"&vl_total_sld="& vl_total_sld
	str = str &"&"& tx_usado
Else
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00029(cd_lang) &".\n"& tx_usado
  'escreve a url para redirecionamento
  str = "/engine/filtros.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro)
End If
'redirecina para a tela de acordo com o resultado
Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include virtual="/includes/inc_ends.asp" -->