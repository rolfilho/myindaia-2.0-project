<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Importação / Tracking
'Arquivo de Script e HTML: Filtros do Relatório
'
'Autor: Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 23/05/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Session("sql_not_fiscal") = Null
Response.Buffer = true

Dim tipo_ordenacao, tipo_ordenacao_varios
Dim exibe_resumo1
Dim tx_filtros_varios
Dim tx_ordenacao_varios
Dim total_filtro
Dim total_ordenacao
Dim total_filtro_parcial
Dim total_ordenacao_parcial
Dim cont_filtro
Dim cont_ordenacao
Dim ap_filtro_teste
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim tx_usado    'filtros usados para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim cd_filtros, cd_filtros2, cd_filtros2_total, cont_cd_filtros2_total  'código dos filtros utilizados
Dim tx_filtros , tx_filtros2, tx_filtros2_total, cont_tx_filtros2_parcial, tx_filtros2_parcial 'textos dos filtros utilizados na consulta
Dim combo_filtros, combo_filtros_total, cont_combo_filtros_parcial, combo_filtros_parcial
Dim tx_filtros_aux 'textos dos filtros utilizados na consulta e que vão ser usados no if
Dim in_dt_null  'identifica se o relatório terá retorno de datas nulas
Dim cd_ev_dado  'código do dado do evento selecionado como limitador
dim vTxFiltro   'valor do filtro
dim dt_inicial
dim dt_final
'recupera o código da personalização e o filtro utilizado na pesquisa
in_show = False
cd_tela = "IMP002"
cd_view = Request("cd_view")
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")

tp_limitador = Request.form("tp_limitador")
nr_dias = Request.form("nr_dias")
combo_auxs = Replace(Request("combo_aux"),", ", "','")
ap_filtros = Replace(Request("filtro"),", ","','")
in_dt_null = True
cd_ev_dado = Null

if ap_filtros = "pesquisa" Then
Response.Redirect("not_fiscal_filtros.asp?cd_menu="& cd_menu & "&cd_subm="& cd_subm& "&in_pesquisa=1")
End If

'recupera as informações da personalização e filtros
in_view_filtro = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
	cont_ordenacao = 0
	total_ordenacao = 0	
	
	total_ordenacao = Request("contador_total_ordenacao")
	total_ordenacao_parcial = Request("contador_ordenacao")
	
	tipo_ordenacao = tipo_ordenacao & fnc_verificaMask(Request("tipo_ordenacao"))
	tx_ordenacao = tx_ordenacao & (Request("ordenacao"))
	For cont_ordenacao = 0 to total_ordenacao
		If not IsEmpty(Request("ordenacao_" & cont_ordenacao)) Then
			tx_ordenacao_varios = "*" & (Request("ordenacao_" & cont_ordenacao))
			tipo_ordenacao_varios = "*" & fnc_verificaMask(Request("tipo_ordenacao_" & cont_ordenacao))
			tx_ordenacao = tx_ordenacao & tx_ordenacao_varios
			tipo_ordenacao = tipo_ordenacao & tipo_ordenacao_varios
		End If
	Next
	tx_ordenacao = tx_ordenacao & ";"
	tipo_ordenacao = tipo_ordenacao & ";"
	
	sql = " UPDATE M06_VIEW SET M06_CD_CAMPO = '" 	& tx_ordenacao & "', M06_TP_ORDEM = '" & tipo_ordenacao & "'"&_
	     " FROM M06_VIEW WHERE M06_CD_VIEW = '" & cd_view & "'"
	objcnn.Execute(sql)
	

'seleciona os dados dos filtros selecionandos
sql = "SELECT M10_CD_DADO, M11_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_AP_FILTRO, M10_CD_BROKER, M11_IN_IGNORA_MASK, M11_TP_FROM, M11_IN_VAZIO, M11_IN_VARIOS "&_
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
	flag_dif = 0	
	in_valor = 0
	cont_filtro = 0
	total_filtro = 0		
	'agrupa os códigos dos filtros utilizados
	cd_filtros = cd_filtros & objrsx.Fields.Item("M10_CD_DADO").Value &";"
	'seleciona o apelido do filtro
	combo_aux = "combo_aux_" & objrsx.Fields.Item("M10_AP_FILTRO").Value
	
	If Not fnc_TestaVar(Request(combo_aux)) Then
		combo_aux = "aux_combo_aux_" & objrsx.Fields.Item("M10_AP_FILTRO").Value
	End if	
	
	If (Request(combo_aux) = 2) Then
		ap_filtro  = "edt_" & objrsx.Fields.Item("M10_AP_FILTRO").Value
	Else		
		If (Request(combo_aux) = 5) or objrsx.Fields.Item("M11_IN_VAZIO").Value Then
		flag_dif = 1
		ap_filtro  = objrsx.Fields.Item("M10_AP_FILTRO").Value
		Else		
		ap_filtro  = objrsx.Fields.Item("M10_AP_FILTRO").Value
		End If
	End If
	
	If InStr("0304", objrsx.Fields.Item("M11_CD_DADO").Value) > 0 then 
		in_valor = 1
	End If
	
	'verifica o tipo de filtro e o meio de obter do form/querystring	
	If objrsx.Fields.Item("M11_TP_FROM").Value = "0" Then	
		If (fnc_TestaVar(Request(ap_filtro)) and flag_dif <> 1) or (flag_dif = 1)  Then
			If objrsx.Fields.Item("M11_IN_IGNORA_MASK").Value Then
				If objrsx.Fields.Item("M11_IN_VARIOS").Value Then
					total_filtro = Request("contador_total_" & objrsx.Fields.Item("M10_AP_FILTRO").Value)
					total_filtro_parcial = Request("contador_" & objrsx.Fields.Item("M10_AP_FILTRO").Value)
					tx_filtros = tx_filtros & fnc_verificaMask(Request(ap_filtro))
					For cont_filtro = 0 to total_filtro-1
						If not IsEmpty(Request(ap_filtro & "_" & cont_filtro)) Then
							tx_filtros_varios = "*" & fnc_verificaMask(Request(ap_filtro & "_" & cont_filtro))
							tx_filtros = tx_filtros & tx_filtros_varios
						End If
					Next
					tx_filtros = tx_filtros & ";"
				Else
					tx_filtros = tx_filtros & fnc_verificaMask(Request(ap_filtro)) &";"
				End If
				tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
			Else
				if in_valor = 1 then
					If objrsx.Fields.Item("M11_IN_VARIOS").Value Then
						total_filtro = Request("contador_total_" & objrsx.Fields.Item("M10_AP_FILTRO").Value)
						tx_filtros = tx_filtros & fnc_mascaraValor(Request(ap_filtro))
						For cont_filtro = 0 to total_filtro-1
							If not IsEmpty(Request(ap_filtro & "_" & cont_filtro)) Then
								tx_filtros_varios = "*" & fnc_mascaraValor(Request(ap_filtro & "_" & cont_filtro))
								tx_filtros = tx_filtros & tx_filtros_varios
							End if
						Next
						tx_filtros = tx_filtros & ";"
					Else	
						tx_filtros = tx_filtros & fnc_mascaraValor(Request(ap_filtro)) &";"
					End If
				tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
				Else	
					If objrsx.Fields.Item("M11_IN_VARIOS").Value Then
						total_filtro = Request("contador_total_" & objrsx.Fields.Item("M10_AP_FILTRO").Value)
						tx_filtros = tx_filtros & (Request(ap_filtro))
						For cont_filtro = 0 to total_filtro-1
							If not IsEmpty(Request(ap_filtro & "_" & cont_filtro)) Then
								tx_filtros_varios =  "*" & (Request(ap_filtro &"_"& cont_filtro))
								tx_filtros = tx_filtros & tx_filtros_varios
							End If
						Next
						tx_filtros = tx_filtros & ";"
					Else	
					tx_filtros = tx_filtros & Request(ap_filtro) &";"
					End If
				tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
				End If
			End if
				
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
	 		tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
	  		tx_filtros = tx_filtros & Request(ap_filtro&"i") &"@"& Request(ap_filtro&"f") &";"
			tx_usado   = tx_usado &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &" de "& Request(ap_filtro&"i") &" à "& Request(ap_filtro&"f") &";\n"
			'response.write tx_usado
			'response.end
			in_dt_null = False			
		Else
			If IsDate(Request(ap_filtro&"i")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(inicial);\n"
			If IsDate(Request(ap_filtro&"f")) Then tx_erro = tx_erro &" - "& objrsx.Fields.Item("M10_NM_DADO").Value &"(final);\n"
		End If
	End If
	objrsx.MoveNext
	If objrsx.Eof Then Exit Do
Loop

If objrsx.State = adStateOpen Then 
objrsx.Close() 
end if
'caso ocorra algum erro redireciona para tela de busca e informa erros
If tx_erro <> "" Then
  Call sub_FechaConexao
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00028(cd_lang) &".\n"& tx_erro
  Response.Redirect("not_fiscal_filtros.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_view="&cd_view&"&erro="&Server.URLEncode(tx_erro))
  Response.End
End If

cd_filtros2 = Replace(ap_filtros, "'", "")
tx_filtros2 = tx_filtros
combo_filtros = tx_combo_auxs

If Not Session("cargo_interno") = "1" Then
	'verifica se não foi selecionada a busca por grupo/empresa do cliente
	If Not (InStr(cd_filtros, "0005") > 0) and Not (InStr(cd_filtros, "0006") > 0) and Not (InStr(cd_filtros, "0661") > 0) Then
		cd_filtros = "0005;"& cd_filtros
		ap_filtros = "cd_grupo','"& ap_filtros
		tx_filtros = "X;"& tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
	End If
	'verifica se não foi selecionada a busca por área/sub-área do cliente
	If Not (InStr(cd_filtros, "0007") > 0) and Not (InStr(cd_filtros, "0008") > 0) Then
		cd_filtros = "0007;"& cd_filtros
		ap_filtros = "cd_area','"& ap_filtros
		tx_filtros = "X;"& tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
	End If
End If

'se não foi selecionado um periodo, busca o limitador
If in_dt_null or fnc_TestaVar(cd_evento) Then
  'retorna para true o uso de limitador
	in_dt_null = True
	'verifica se o evento é valido
'  If Not fnc_TestaVar(cd_evento) Then cd_evento = "132"  linha duplicada e alterada
  If fnc_TestaVar(cd_evento) Then
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
	If fnc_TestaVar(Request(combo_aux)) Then
		tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
	Else
		tx_combo_auxs = tx_combo_auxs & "1;"
	End If	
	If objrsx.State = adStateOpen Then objrsx.Close()
	End if
End if
			
	cd_filtros2   = Left(cd_filtros2, Len(cd_filtros2))
	tx_filtros2   = Left(tx_filtros2, Len(tx_filtros2)-1)
	combo_filtros = Left(combo_filtros, Len(combo_filtros)-1)
	cd_filtros2_total   = Split(cd_filtros2, ",", -1)
	tx_filtros2_total   = Split(tx_filtros2, ";", -1)
	combo_filtros_total = Split(combo_filtros, ";", -1)

    Dim contador_consulta
    If objrsx.State = adStateOpen Then objrsx.Close()
    sql = "SELECT M17_CONTADOR FROM M17_VIEW_CONS ( NOLOCK ) WHERE M17_CD_VIEW = '"& cd_view &"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
    If objrsx.RecordCount > 0 Then
      contador_consulta = objrsx.Fields.Item("M17_CONTADOR").Value  + 1
    Else    
      contador_consulta = 1
    End If
    If objrsx.State = adStateOpen Then objrsx.Close()

	sql = "DELETE FROM M17_VIEW_CONS WHERE M17_CD_VIEW= '" & cd_view & "'"	
	objcnn.Execute(sql)
		
	For cont_cd_filtros2_total = 0 to UBound(cd_filtros2_total)
		if cd_filtros2_total(cont_cd_filtros2_total) <> "pesquisa" Then
			If InStr(tx_filtros2_total(cont_cd_filtros2_total), "*") > 0 Then
				tx_filtros2_parcial  = Split(tx_filtros2_total(cont_cd_filtros2_total), "*", -1)
				For cont_tx_filtros2_parcial = 0 to UBound(tx_filtros2_parcial)
					sql = "INSERT INTO M17_VIEW_CONS (M17_CD_VIEW, M17_CD_FILTRO_DADO, M17_CD_FILTRO_CONS, M17_CD_FILTRO_COMBO, M17_DT_ULT_PESQUISA, M17_CONTADOR) "&_
					" VALUES ('" & cd_view & "','" & cd_filtros2_total(cont_cd_filtros2_total) & "','" & tx_filtros2_parcial(cont_tx_filtros2_parcial) & "','" & combo_filtros_total(cont_cd_filtros2_total) & "', GETDATE(), " & contador_consulta & ") "					
                    objcnn.Execute(sql)
				Next	
			Else	
				sql = "INSERT INTO M17_VIEW_CONS (M17_CD_VIEW, M17_CD_FILTRO_DADO, M17_CD_FILTRO_CONS, M17_CD_FILTRO_COMBO, M17_DT_ULT_PESQUISA, M17_CONTADOR) "&_
				" VALUES ('" & cd_view & "','" & cd_filtros2_total(cont_cd_filtros2_total) & "','" & tx_filtros2_total(cont_cd_filtros2_total) & "','" & combo_filtros_total(cont_cd_filtros2_total) & "', GETDATE(), " & contador_consulta & ") "
                objcnn.Execute(sql)
			End If
		End If
	Next


Session("sql_pagina") = Session("sql_pagina") &"<br>"& cd_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& tx_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"in_dt_null = "& in_dt_null &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"cd_ev_dado = "& cd_ev_dado &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventoi = "& dt_eventoi &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventof = "& dt_eventof &"<br>"

'Response.write "tp_relat" & tp_relat & "<BR>"
'Response.write "cd_view" & cd_view & "<BR>"
'Response.write "cd_ev_dado" & cd_ev_dado & "<BR>"
'Response.write "nr_dias" & nr_dias & "<BR>"
'Response.write "tp_limitador" & tp_limitador & "<BR>"
'Response.write "in_dt_null" & in_dt_null & "<BR>"
'Response.write "cd_filtros" & cd_filtros & "<BR>"
'Response.write "tx_filtros" & tx_filtros & "<BR>"
'Response.write "tx_combo_auxs" & tx_combo_auxs & "<BR>"
'Response.write "tx_ordenacao" & tx_ordenacao & "<BR>"
'Response.write "tipo_ordenacao" & tipo_ordenacao & "<BR>"
'Response.write "cd_usuario" & Session("cd_usuario") & "<BR>"
'Response.end

With objcmd
	.CommandTimeOut = 9999
	.CommandText    = "sp_rel_fat_notas_fiscais_money"
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("@cd_view"   , adChar   , adParamInput,   12, cd_view)
	.Parameters.Append = .CreateParameter("@cd_ev_dado", adChar   , adParamInput,    4, cd_ev_dado)
	.Parameters.Append = .CreateParameter("@in_dt_null", adBoolean, adParamInput,    1, in_dt_null)
	.Parameters.Append = .CreateParameter("@cd_filtros", adVarChar, adParamInput, 1024, cd_filtros)
	.Parameters.Append = .CreateParameter("@tx_filtros", adVarChar, adParamInput, 1024, tx_filtros)
	.Parameters.Append = .CreateParameter("@nr_ident"  , adInteger, adParamOutPut)
    .Parameters.Append = .CreateParameter("@cd_usuario", adChar, adParamInput, 4, Session("cd_usuario"))
	.Parameters.Append = .CreateParameter("@nr_result" , adInteger, adParamOutPut)
	.Execute nrec, , adExecuteNoRecords
	nr_ident  = .Parameters("@nr_ident")
	nr_result = .Parameters("@nr_result")
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
  str = "/faturamy/not_fiscal/not_fiscal_result.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&vl_total_num="& vl_total_num &"&vl_total_des="& vl_total_des &"&vl_total_sld="& vl_total_sld &"&"& tx_usado
Else
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00029(cd_lang) &".\n"& tx_usado
  'escreve a url para redirecionamento
  str = "/faturamy/not_fiscal/not_fiscal_filtros.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro)
End If

Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include virtual="/includes/inc_ends.asp" -->