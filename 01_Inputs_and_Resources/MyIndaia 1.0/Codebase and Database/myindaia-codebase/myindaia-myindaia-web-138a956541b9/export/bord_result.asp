<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação
'Arquivo de Script e HTML: Resultado do Relatório de Borderô
'
'Autor: Alexandre Gonçalves Neto
'Criado: 20/01/2006
'
'Manutenção: 29/09/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s		'monta o select da query com os campos a serem exibidos
Dim sql_f		'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w		'monta o where da query
Dim sql_o		'monta a ordenação da query
Dim pagina 	'pagina inicial da ordenação
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim tp_situacao 'situção dos arquivos de borderô(0-Não enviados; 1-Enviados)
Dim tp_status   'Status dos arquivos a´pos envio(0-À Imprimir; 1-Impresso; 2-Revisado)
Dim dt_enviado  'data de envio dos aruivos para o site
Dim dt_leitura  'data de leitura dos arquivos no site
Dim tx_path_det'caminho do arquivo de detalhe de processo

in_comodo = "1"
in_show  = False
cd_tela  = "EXP015"
nm_tela  = "Exportação >> Borderô >> Resultado da Busca: Período de "
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
nr_data  = Request.QueryString("nr_data")
ap_filtros = Replace(Request.QueryString("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
'Session("sql_exp_bordero") = Null
If Not fnc_TestaVar(Session("sql_exp_bordero")) Then
	'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.NR_REFERENCIA, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
					"  PB.TP_SITUACAO, PB.TP_STATUS, PB.DT_ENVIADO, PB.DT_LEITURA, "
	'tabelas da busca
	sql_f = "FROM TREL_EXP_BORDERO R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO     PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TPROC_BORDERO PB (NOLOCK) ON (PB.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TFLP_EXPORT   FE (NOLOCK) ON (FE.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TSERVICO      SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "
                    "  LEFT  JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO) "&_
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   =  "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then sql_o = sql_o &" R."& tipo_quebra(tp_quebra) &" ASC, "
	
    If fnc_TestaVar(cd_ordem) and InStr(cd_ordem, "X") = 0 Then
		cd_ordem  = Left(cd_ordem, Len(cd_ordem)-1)
		tp_ordem  = Left(tp_ordem, Len(tp_ordem)-1)
		dados_ordem_total = Split(cd_ordem, "*", -1)
		tipo_ordem_total  = Split(tp_ordem, "*", -1)

		For cont_ordem_total = 0 to UBound(dados_ordem_total)
			dados_ordem = Split(dados_ordem_total(cont_ordem_total), "%", -1)
			If tipo_ordem_total(cont_ordem_total) = 0 Then
				tipo_ordem_total(cont_ordem_total) = " ASC"
			Else
				tipo_ordem_total(cont_ordem_total) = " DESC"
			End if
			tx_dados_ordem = tx_dados_ordem & dados_ordem(1) & tipo_ordem_total(cont_ordem_total) & ", "
		Next
		tx_dados_ordem = Left(tx_dados_ordem, Len(tx_dados_ordem)-2) 
		sql_o = sql_o &	tx_dados_ordem
	Else
	    If in_embarque Then
		    sql_o = sql_o & " R.NR_PROCESSO ASC "
	    Else
		    sql_o = sql_o & " R.NR_REFERENCIA ASC "
	    End If
	End If
    
	'inicia a montagem dos campos que serão selecionados
	nr_data = 0 'qtde de eventos selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		'verifica se o campo é montado dinamicamente e de acordo com valores padrão
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_CONSULTA")
				Case 0 'pega o valor direto da tabela indicada no "FROM"
					'verifica o tipo de dado
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case 0, 5 'campos de texto
							sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case 1 'campos de data
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								'datas de follow-up de desembaraço
								nr_data = nr_data + 1
								sql_s = sql_s &_
												" FE.RLZ_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" FE.PVT_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" FE.IN_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &"  AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							Else
								'Outras datas vindas de outras tabelas
								sql_s = sql_s &_
												" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
						Case 2, 3, 4 'campos numericos
							sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End Select
				Case 1 'o valor vem atraves da consulta em outra tabela
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 2 'campos que retornam numeros para consulta em array
					sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 3 'campos que são calculados.
					sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M10_AP_CAMPO").Value &", '') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else
			'campos que não podem ser montados a partir de um padrão
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_exp_bordero") = sql_s & sql_f & sql_w & sql_o
Else
  If not fnc_TestaVar(nr_data) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO (NOLOCK) " &_
					"  INNER JOIN M12_CAMPO (NOLOCK) ON (M12_CD_CAMPO = M14_CD_CAMPO) " &_
					"  INNER JOIN M10_DADOS (NOLOCK) ON (M10_CD_DADO  = M12_CD_DADO ) " &_
					"WHERE M14_CD_VIEW     = '"& cd_view &"' "&_
					"  AND M12_TP_EXIBIR  >= '"& Session("tp_exibir") &"' "&_
					"  AND M12_IN_ATIVO    =  1  "&_
					"  AND M10_IN_ATIVO    =  1  "&_
					"  AND M10_TP_DADO     = '1' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_data = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
End If
'Response.Write(Session("sql_exp_bordero"))
Session("sql_pagina") = Session("sql_pagina") & Session("sql_exp_bordero") &"<br><br>"
With objcmd
	.CommandTimeOut = 120
	.CommandText    = Session("sql_exp_bordero")
	.CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("referencia") <> "" Then
  'escolhe o tipo da referencia
'  If Request("tipo_referencia") = "01" Then
  str = "NR_REFERENCIA = '"& Request("referencia") &"'"
  'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
	pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
	tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
  nr_referencia = ""
  objrs.AbsolutePage = CInt(pagina)
End If

'col = (objrsv.RecordCount - nr_data) + (nr_data * 3)
col = objrsv.RecordCount + 1
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/export/bord_print"
tx_path_excel = "/excel/exp_bordero"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "bord_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function abreDocs(nr_processo) {
	features = "top=100,left=20,width=350,height=250,resizable=yes";
  window.open('/detalhe/scan_docs_processo.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"scan_docs_processo",features);
}
//-->
</script>
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="50" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<%
Dim tx_tit_cols
Dim tx_sub_cols

tx_tit_cols = ""
tx_sub_cols = ""
objrsv.MoveFirst
'se tiver data prevista define se colunas e linhas seram agrupadas
If in_dt_prev Then 
  vl_colspan  = " colspan='3'"
	vl_rowspan  = " rowspan='2'"
	For x = 1 to nr_data
		tx_sub_cols = tx_sub_cols &_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00033(cd_lang) &"</td>"&_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00034(cd_lang) &"</td>"&_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00035(cd_lang) &"</td>"
	Next
	tx_sub_cols = "<tr height='15' class='gridsub'>"& tx_sub_cols &"</tr>"
Else
  vl_colspan  = ""
	vl_rowspan  = ""
End If
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
		tx_tit_cols = tx_tit_cols &"<td"& vl_colspan &" style='background-color:" & cabec_result & ";'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>"
	Else
    tx_tit_cols = tx_tit_cols &"<td"& vl_rowspan &" style='background-color:" & cabec_result & ";'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>"
	End If
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
Response.Write("<tr class='gridtit' style='background-color:" & cabec_result & ";'><td>Situação/Status</td>"& tx_tit_cols &"</tr>"& tx_sub_cols)

cd_campo_quebra = ""
nrec = 0
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
					<tr>
						<td height="20" colspan="<%= col%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
	'Situação/Status do Borderô
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	tx_path_det = "/detalhe/exp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&filtro=nr_processo&nr_processo="& nr_processo
	tp_situacao = objrs.Fields.Item("TP_SITUACAO").Value
	tp_status   = objrs.Fields.Item("TP_STATUS").Value
	dt_enviado  = objrs.Fields.Item("DT_ENVIADO").Value
	dt_leitura  = objrs.Fields.Item("DT_LEITURA").Value
	
  If tp_situacao = "0" or Not fnc_TestaVar(tp_situacao) Then
		str = "À enviar"
  Else
		str = "<a href='#' onClick=""abreDocs('"& nr_processo &"');"">Enviado"
		If fnc_TestaVar(tp_status) Then str = str &" / "& status_bordero(tp_status)
		If fnc_TestaVar(dt_leitura) Then
			If DateDiff("s", dt_enviado, dt_leitura) Then
				str = "<font color='#FF0000'>"& str &"</font></a>"
			End If 
		End if
	End If
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<td><nobr><%= str%></nobr></td>
						<%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="center"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= Mid(nr_processo, 5, 18)%></a>&nbsp;</nobr></td>
						<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0468" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					str           = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						str           = ""
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					Else
						nr_referencia = Null
						str           = Null
					End If
					objrsx.Close()
				End If
%>
            <td align="left" title="<%= str%>"></nobr>&nbsp;<a href="<%= tx_path_det%>"><%= nr_referencia%></a>&nbsp;</nobr></td>
            <%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
							"FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'se não achar a mercadoria, procura na tprocesso
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Left(Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value,"""","'")), 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as mercadorias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value,"""","'"))
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop 
				Else
					str = "Descrição não Disponível."
				End If
%>
						<td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
				objrsx.Close
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
						y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
						z = Null
						
						If (Not fnc_TestaVar(w)) or (w = 0) Then
							color = "#999999" 'cor da fonte
							x = "-" 'data prevista
							y = "Não Aplicável" 'data realizada
							z = "-" 'diferença de dias
						Else
							'se a data prevista existir
							If IsDate(x) Then
								'se a data realizada existir
								If IsDate(y) Then
									z = fnc_DiasUteisKPI(x, y, 0)
								Else
									z = fnc_DiasUteisKPI(x, Date(), 0)
								End If
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									z     = "+"& z
									color = "#FF0000" 'vermelho
								End If
							End If
						End If
						'verifica se exibe a data prevista
						If in_dt_prev Then
%>
            <td align="center"><nobr>&nbsp;<%= fnc_Mascara(x, 5)%>&nbsp;</nobr></td>
						<td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
						<%
						End If
%>
            <td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara(y, 5)%></font>&nbsp;</nobr></td>
						<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "4" 'exibe os campos com valor inteiro
						z = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(z) Then z = "" 
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(z) < 10
							z = "#"& z
						Loop
						z = Replace(z, "#", "&nbsp;")
%>
						<td align="right"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
						<%
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
					</tr>
					<%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit">
						<td height="15" colspan="<%= nr_cols%>" align="left" style="background-color:<%=cabec_result%>;"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
					<%
objrsv.Close
objrs.Close
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
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

