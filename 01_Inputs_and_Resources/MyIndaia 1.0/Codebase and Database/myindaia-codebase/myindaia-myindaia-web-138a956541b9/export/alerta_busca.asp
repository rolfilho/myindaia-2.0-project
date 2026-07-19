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
in_alerta = Request.QueryString("in_alerta")
in_interno = Request.QueryString("in_interno")
in_envia_agora = Request.QueryString("enviar_agora")
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<%If in_alerta <> "1" Then%>
<!--#include virtual="/includes/inc_execs.asp"-->
<%Else
  Session("tp_exibir2") = 0
  Session("cd_usuario") = Left(Request.QueryString("cd_view"), 4)
  Session("cargo_interno") = in_interno
  Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
End If
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Session("sql_alerta_exp_track") = Null
Response.Buffer = true

Dim tipo_ordenacao, tipo_ordenacao_varios
Dim exibe_resumo1
Dim str_1
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
Dim cd_filtros, cd_filtros2, cd_filtros2_total, cont_cd_filtros2_total
Dim tx_filtros , tx_filtros2, tx_filtros2_total, cont_tx_filtros2_parcial, tx_filtros2_parcial
Dim combo_filtros, combo_filtros_total, cont_combo_filtros_parcial, combo_filtros_parcial
Dim in_dt_null  'identifica se o relatório terá retorno de datas nulas
Dim cd_ev_dado  'código do dado do evento selecionado como limitador
Dim tx_filtros_aux
dim vTxFiltro   'valor do filtro
dim dt_inicial
dim dt_final
'recupera o código da personalização e o filtro utilizado na pesquisa
in_show = False
cd_tela = "EXP002"
cd_view = Request("cd_view")
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")

tp_limitador = Request.form("tp_limitador")
nr_dias = Request.form("nr_dias")
combo_auxs = Replace(Request("combo_aux"),", ", "','")
ap_filtros = Replace(Request("filtro"),", ","','")
in_dt_null = True
cd_ev_dado = Null

%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
	


'para os cargos abaixo é obrigatório ter a pesquisa por empresa e área
If Not Session("cargo_interno") = "1" Then
	'verifica se não foi selecionada a busca por grupo/empresa do cliente
	If Not (InStr(cd_filtros, "0005") > 0) and Not (InStr(cd_filtros, "0006") > 0) Then
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

    If fnc_TestaVar(cd_modal_view) Then
        cd_filtros = "0009;"& cd_filtros
        ap_filtros = "cd_modal','"& ap_filtros
		tx_filtros =  cd_modal_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_transp_view) Then
        cd_filtros = "0058;"& cd_filtros
        ap_filtros = "cd_transp_rod','"& ap_filtros
		tx_filtros =  cd_transp_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_importador_view) Then
        cd_filtros = "0126;"& cd_filtros
        ap_filtros = "cd_importador','"& ap_filtros
		tx_filtros =  cd_importador_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If
Else
    If fnc_TestaVar(cd_grupo_view) Then
        cd_filtros = "0005;"& cd_filtros
        ap_filtros = "cd_grupo','"& ap_filtros
		tx_filtros =  cd_grupo_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_cliente_view) Then
        cd_filtros = "0006;"& cd_filtros
        ap_filtros = "cd_cliente','"& ap_filtros
		tx_filtros =  cd_cliente_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_modal_view) Then
        cd_filtros = "0009;"& cd_filtros
        ap_filtros = "cd_modal','"& ap_filtros
		tx_filtros =  cd_modal_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_unid_view) Then
        cd_filtros = "0001;"& cd_filtros
        ap_filtros = "cd_unid_neg','"& ap_filtros
		tx_filtros =  cd_unid_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_area_view) Then
        cd_filtros = "0007;"& cd_filtros
        ap_filtros = "cd_area','"& ap_filtros
		tx_filtros =  cd_area_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_celula_view) Then
        cd_filtros = "0594;"& cd_filtros
        ap_filtros = "cd_celula','"& ap_filtros
		tx_filtros =  cd_celula_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_transp_view) Then
        cd_filtros = "0058;"& cd_filtros
        ap_filtros = "cd_transp_rod','"& ap_filtros
		tx_filtros =  cd_transp_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_armador_view) Then
        cd_filtros = "0085;"& cd_filtros
        ap_filtros = "cd_agente','"& ap_filtros
		tx_filtros =  cd_armador_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If

    If fnc_TestaVar(cd_importador_view) Then
        cd_filtros = "0126;"& cd_filtros
        ap_filtros = "cd_importador','"& ap_filtros
		tx_filtros =  cd_importador_view & ";" & tx_filtros
		tx_combo_auxs = "1;" & tx_combo_auxs
    End If
End If

'Response.write cd_evento
'Response.end

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
	If cd_evento <> "XXX" Then
        If objrsx.State = adStateOpen Then objrsx.Close
	    sql = "SELECT M10_CD_DADO "&_
				    "FROM M10_DADOS ( NOLOCK ) "&_
				    "WHERE M10_CD_BROKER = '"& cd_evento &"'"
	    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
	    cd_ev_dado = objrsx.Fields.Item("M10_CD_DADO").Value
    Else
        cd_ev_dado = "0611"
    End If
	cd_filtros = cd_filtros & cd_ev_dado &";"
	tx_filtros = tx_filtros & dt_eventoi &"@"& dt_eventof &";"
	If fnc_TestaVar(Request(combo_aux)) Then
		tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
	Else
		tx_combo_auxs = tx_combo_auxs & "1;"
	End If	
	If objrsx.State = adStateOpen Then objrsx.Close()
	End if

    
    'cd_evento_2
    If fnc_TestaVar(cd_evento_2) Then
	'verifica se a qtde de dias é valido
	If Not fnc_TestaVar(nr_dias_2) Then nr_dias_2 = 30
	'define as datas do evento limitador
	dt_eventoi_2 = fnc_mascara(DateAdd("d", -nr_dias_2, Date), 5)
    dt_eventof_2 = fnc_mascara(date, 5)
	'recupera o código do filtro e adciona aos filtros.
    If cd_evento_2 <> "XXX" Then
	    If objrsx.State = adStateOpen Then objrsx.Close
	    sql = "SELECT M10_CD_DADO "&_
				    "FROM M10_DADOS ( NOLOCK ) "&_
				    "WHERE M10_CD_BROKER = '"& cd_evento_2 &"'"
	    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
	    cd_ev_dado_2 = objrsx.Fields.Item("M10_CD_DADO").Value
    Else
      cd_ev_dado_2 = "0611"
    End If
	cd_filtros = cd_filtros & cd_ev_dado_2 &";"
	tx_filtros = tx_filtros & dt_eventoi_2 &"@"& dt_eventof_2 &";"
	If fnc_TestaVar(Request(combo_aux)) Then
		tx_combo_auxs = tx_combo_auxs & Request(combo_aux) &";"
	Else
		tx_combo_auxs = tx_combo_auxs & "1;"
	End If	
	If objrsx.State = adStateOpen Then objrsx.Close()
    Else
    cd_ev_dado_2 = null     
	End if
End if
	
Session("sql_pagina") = Session("sql_pagina") &"<br>"& cd_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& tx_filtros &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"in_dt_null = "& in_dt_null &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"cd_ev_dado = "& cd_ev_dado &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventoi = "& dt_eventoi &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"dt_eventof = "& dt_eventof &"<br>"

'Response.write "tp_relat" & tp_relat & "<BR>"
'Response.write "cd_view" & cd_view & "<BR>"
'Response.write "cd_ev_dado" & cd_ev_dado & "<BR>"
'Response.write "cd_ev_dado_2" & cd_ev_dado_2 & "<BR>"
'Response.write "nr_dias" & nr_dias & "<BR>"
'Response.write "tp_limitador" & tp_limitador & "<BR>"
'Response.write "tp_limitador_2" & tp_limitador_2 & "<BR>"
'Response.write "tp_limitador_aux" & tp_limitador_aux & "<BR>"
'Response.write "tp_limitador_aux_2" & tp_limitador_aux_2 & "<BR>"
'Response.write "in_dt_null" & in_dt_null & "<BR>"
'Response.write "cd_filtros" & cd_filtros & "<BR>"
'Response.write "tx_filtros" & tx_filtros & "<BR>"
'Response.write "tx_combo_auxs" & tx_combo_auxs & "<BR>"
'Response.write "tx_ordenacao" & tx_ordenacao & "<BR>"
'Response.write "tipo_ordenacao" & tipo_ordenacao & "<BR>"
'Response.end

'::::: CONSULTA ATRAVES DE STORED PORCEDURE :::::
With objcmd
	.CommandTimeOut = 9999
	.CommandText    = "sp_rel_exp_alerta_2"
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("@cd_view"   , adChar   , adParamInput,   12, cd_view)
	.Parameters.Append = .CreateParameter("@cd_ev_dado", adChar   , adParamInput,    4, cd_ev_dado)
    .Parameters.Append = .CreateParameter("@cd_ev_dado_2", adChar   , adParamInput,    4, cd_ev_dado_2)
	.Parameters.Append = .CreateParameter("@tp_limitador", adChar, adParamInput, 1, tp_limitador)
    .Parameters.Append = .CreateParameter("@tp_limitador_2", adChar, adParamInput, 1, tp_limitador_2)
    .Parameters.Append = .CreateParameter("@tp_limitador_aux", adChar, adParamInput, 1, tp_limitador_aux)
    .Parameters.Append = .CreateParameter("@tp_limitador_aux_2", adChar, adParamInput, 1, tp_limitador_aux_2)
	'.Parameters.Append = .CreateParameter("@nr_dias", adVarChar, adParamInput, 3, nr_dias)
	.Parameters.Append = .CreateParameter("@in_dt_null", adBoolean, adParamInput,    1, in_dt_null)
	.Parameters.Append = .CreateParameter("@cd_filtros", adVarChar, adParamInput, 1024, cd_filtros)
	.Parameters.Append = .CreateParameter("@tx_filtros", adVarChar, adParamInput, 1024, tx_filtros)
	.Parameters.Append = .CreateParameter("@tx_combo_auxs", adVarChar, adParamInput, 1024, tx_combo_auxs)
	.Parameters.Append = .CreateParameter("@nr_ident"  , adInteger, adParamOutPut)
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
  If in_alerta <> "1" Then
    If in_envia_agora = "1" Then
      str = "/export/alerta_excel.asp?in_envia_agora=1&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
    Else
      str = "/export/alerta_result.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
    End If
  Else
    str = "/export/alerta_excel.asp?in_alerta=" & in_alerta & "&in_interno=" & in_interno & "&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
  End If
Else
  tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00029(cd_lang) &".\n"& tx_usado
  'escreve a url para redirecionamento
  If in_alerta <> "1" Then
    str = "/export/alerta_result.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
  Else
    str = "/export/alerta_excel.asp?in_alerta=" & in_alerta & "&in_interno=" & in_interno & "&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&nr_ident="& nr_ident &"&"& tx_usado
  End If
End If

Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include virtual="/includes/inc_ends.asp" -->