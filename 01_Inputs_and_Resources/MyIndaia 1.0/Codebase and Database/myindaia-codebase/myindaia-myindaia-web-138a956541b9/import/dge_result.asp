<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Pagamento de Demurrage
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor: Alexandre Gonçalves Neto
'Criado: 13/01/2006
'
'Manutenção: 15/03/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s	'monta o select da query com os campos a serem exibidos
Dim sql_f	'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w	'monta o where da query
Dim sql_o	'monta a ordenação da query
Dim pagina 	'pagina inicial da ordenação
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados

in_comodo = "1"
in_show  = False
cd_tela  = "IMP025"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
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
'Session("sql_imp_demurrage") = Null
If Not fnc_TestaVar(Session("sql_demurrage")) Then
  'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.NR_CNTR, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.NR_FATURA, R.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados

	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &_
									" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","11","21","31","41"'String - Lookup
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "10"'Data
					If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
						'datas de follow-up de desembaraço
						nr_data = nr_data + 1
						sql_s = sql_s &_
										" F"& nr_data &".DT_REALIZACAO AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
										" F"& nr_data &".DT_PREVISTA   AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
										" F"& nr_data &".IN_APLICAVEL  AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						sql_f = sql_f &_
										" LEFT JOIN TFOLLOWUP F"& nr_data &" ( NOLOCK ) ON ( F"& nr_data &".NR_PROCESSO = PR.NR_PROCESSO AND F"& nr_data &".CD_EVENTO = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"') "
					Else
						'Outras datas vindas de outras tabelas
						sql_s = sql_s &_
										" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End If
				Case "20","30","40"'Decimal, Moeda,Inteiro
					sql_s = sql_s &_
									" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else 'Campos problema!!! Essse MyIndaia... ai, ai...
		  Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0015","0050","0056","0057","0059" 'Dados do contâiner
					sql_s = sql_s &_
									" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "0048","0060","0510"
					sql_s = sql_s &_
									" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
  sql_f = "FROM TREL_IMP_DEMURRAGE R (NOLOCK) "&_
					"  INNER JOIN BROKER.DBO.TPROCESSO      PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  INNER JOIN BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) ON (PC.NR_PROCESSO = R.NR_PROCESSO AND PC.NR_CNTR = R.NR_CNTR) "& sql_f
	'requisitos da pesquisa
  sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' " &_
					"  AND R.NR_IDENT   =  "& nr_ident &" "
  'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then
		sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
	End If

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
	    sql_o = sql_o &" R.NR_PROCESSO ASC, R.NR_CNTR ASC"
	End If
  'finaliza a construção do select do relatório e salva na Session
  Session("sql_imp_demurrage") = sql_s & sql_f & sql_w & sql_o
Else
	If not fnc_TestaVar(nr_data) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
					"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
					"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
					"WHERE M14_CD_VIEW     = "& fnc_QuotedSQL(cd_view) &_
					"  AND M12_TP_EXIBIR  >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
					"  AND M12_IN_ATIVO    = 1 " &_
					"  AND M10_IN_ATIVO    = 1 " &_
					"  AND M10_TP_DADO     = '1' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_data = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_demurrage") &"<br>"
'Response.Write(Session("sql_imp_demurrage"))
'response.end
With objcmd
	.CommandTimeOut = 120
	.CommandText    = Session("sql_imp_demurrage")
	.CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
objrs.AbsolutePage = CInt(pagina)

col = objrsv.RecordCount
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/import/dge_print"
tx_path_excel = "/excel/imp_dmge"

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
	var target = "/import/dge_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
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
		<td width="100%" height="44" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<tr class="gridtit" style="background-color:<%=cabec_result%>;">
						<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
%>
						<td><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<%
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
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do prcesso
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
    nr_cntr = Trim(objrs.Fields.Item("NR_CNTR").Value) 
    nr_fatura = Trim(objrs.Fields.Item("NR_FATURA").Value) 
	'Aplica personalização nos campos
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="center"><a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= Mid(nr_processo, 5, Len(nr_processo))%></nobr></a></td>
						<%
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%
	    Case "0018","0094","0096","0097","0098","0099","0100","0101" 'Nr.Referencia - Item
				nr_referencia = Null
				str = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
								"FROM BROKER.DBO.TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = "referências"& vbcrlf
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					End If
				End If
%>
            <td align="left" title="<%= str%>"><a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= nr_referencia%></nobr></a></td>
            <%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0019" 'Nr. do Item do Pedido/Referencia
				nr_referencia = Null
				nr_item_clnte = Null
				str = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
					nr_item_clnte = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					str = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
								"FROM BROKER.DBO.TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '01'"&_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = ""
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_item_clnte = Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value ) &"/"& Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"; "& vbcrlf
						Loop
					End If
				End If
				nr_processo = Trim( objrs.Fields.Item("NR_PROCESSO").Value )
%>
            <td align="left" title="<%= str%>"><a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= nr_item_clnte%></nobr></a></td>
            <%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0046" 'Nr. Contâiner
%>
						<td><nobr><%= fnc_Mascara( objrs.Fields.Item(nm_campo_rel).Value, 0 )%></nobr></td>
						<%
Case "2181","2182", "2183","2184","2185","2186","2187", "2188","2189","2190","2191", "2192","2193","2194","2195","0056","0510", "0060", "0054", "0055" 
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT TOP 1 C.NR_PERIODO, C.IN_PARCIAL, C.DT_INICIO, C.DT_FIM, FD.NM_TP_FAT_DEM NM_MOTIVO, C.DT_INICIO_DEMURRAGE, C.DT_FIM_DEMURRAGE, " & _
                " CONVERT(VARCHAR, F.DT_PAGTO, 103) DT_PAGTO, CONVERT(VARCHAR, P.DT_DEMURRAGE, 103) DT_VENCTO, ISNULL(C.VL_TOTAL, 0) VL_TOTAL, (ISNULL(C.VL_TOTAL, 0) - ISNULL(C.VL_DESCONTO, 0)) VL_COM_DESCONTO, "&_
                " C.NR_DIAS_COBRADOS NR_DIAS_COBRADOS, F.IN_ACORDO, ISNULL(C.VL_DIARIA, 0) VL_DIARIA, ISNULL(C.VL_FATURA_MNEG, 0) VL_FATURA_MNEG, MB.NM_MOEDA, ISNULL(C.VL_FATURA_MN, 0) VL_FATURA_MN, " &_
                " ISNULL(C.VL_DESCONTO_MNEG, 0) VL_DESCONTO_MNEG, ISNULL(C.VL_DESCONTO, 0) VL_DESCONTO, ISNULL(C.VL_ACRESCIMO_MNEG, 0) VL_ACRESCIMO_MNEG, ISNULL(C.VL_ACRESCIMO, 0) VL_ACRESCIMO, ISNULL(C.VL_DEPOSITO, 0) VL_DEPOSITO "&_
                    " FROM BROKER.DBO.TDEM_FAT_CNTR C " & _
                    " INNER JOIN BROKER.DBO.TDEM_FAT F ON F.NR_FATURA = C.NR_FATURA "&_
                    "    AND F.CD_UNID_NEG = C.CD_UNID_NEG " &_
                    " INNER JOIN BROKER.DBO.TTP_FAT_DEM FD ON FD.TP_FAT_DEM = F.TP_FAT_DEM "&_
                    " LEFT JOIN BROKER.DBO.TPROCESSO_CNTR P ON P.NR_PROCESSO = C.NR_PROCESSO "&_
                    "                                      AND P.NR_CNTR = C.NR_CNTR "&_
                    " LEFT JOIN BROKER.DBO.TMOEDA_BROKER MB ON MB.CD_MOEDA = C.CD_MOEDA_FATURA "&_
                    " WHERE C.NR_FATURA = '" & nr_fatura & "'" & _
                    "  AND C.NR_PROCESSO = '" & nr_processo & "' " & _
                    "  AND C.NR_CNTR = '" & nr_cntr & "' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

                str = ""
                If objrsx.RecordCount > 0 Then
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0056" Then str = objrsx.Fields.Item("NM_MOTIVO").Value                  
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0054" Then str = FormatNumber(objrsx.Fields.Item("VL_TOTAL").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0055" Then str = FormatNumber(objrsx.Fields.Item("VL_COM_DESCONTO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0060" Then str = objrsx.Fields.Item("DT_PAGTO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0510" Then str = objrsx.Fields.Item("DT_VENCTO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2181" Then str = objrsx.Fields.Item("NR_PERIODO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2182" Then str =  sim_nao(objrsx.Fields.Item("IN_PARCIAL").Value)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2183" Then str = "De: " & objrsx.Fields.Item("DT_INICIO").Value & " Até: " & objrsx.Fields.Item("DT_FIM").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2184" Then str = objrsx.Fields.Item("NR_DIAS_COBRADOS").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2185" Then str =  sim_nao(objrsx.Fields.Item("IN_ACORDO").Value)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2186" Then str = FormatNumber(objrsx.Fields.Item("VL_DIARIA").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2187" Then str = FormatNumber(objrsx.Fields.Item("VL_FATURA_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2188" Then str = FormatNumber(objrsx.Fields.Item("VL_FATURA_MN").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2189" Then str = FormatNumber(objrsx.Fields.Item("VL_DESCONTO_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2190" Then str = FormatNumber(objrsx.Fields.Item("VL_DESCONTO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2191" Then str = FormatNumber(objrsx.Fields.Item("VL_ACRESCIMO_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2192" Then str = FormatNumber(objrsx.Fields.Item("VL_ACRESCIMO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2193" Then str = FormatNumber(objrsx.Fields.Item("VL_DEPOSITO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2194" Then str = objrsx.Fields.Item("NM_MOEDA").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2195" Then str = "De: " & objrsx.Fields.Item("DT_INICIO_DEMURRAGE").Value & " Até: " & objrsx.Fields.Item("DT_FIM_DEMURRAGE").Value
                End If
%>
						<td><nobr>&nbsp;<%= str %>&nbsp;</nobr></td>

                        <%                        	
	    Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
							"FROM BROKER.DBO.TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM BROKER.DBO.TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Left(Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value,"""","'")), 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
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
						If Not fnc_TestaVar(str) Then str = ""
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						y = Null
						y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
						
						If in_dt_prev Then
							x = Null
							z = Null
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
							
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
								color = "#999999"   'cor da fonte
							Else
								x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
								'se a data prevista existir
								If IsDate(x) Then
									'se a data realizada existir
									If IsDate(y) Then
										z = fnc_DiasUteisKPI(x, y, 1)
									Else
										z = fnc_DiasUteisKPI(x, Date(), 1)
									End If
									'muda a cor do lead-time conforme o resultado
									If z < 0 Then 
										color = "#0000FF" 'azul
									ElseIf z > 0 Then
										z = "+"& z
										color = "#FF0000" 'vermelho
									End If
								End If
							End If
%>
            <td align="center"><nobr>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</nobr></td>
						<td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
						<%
						End If
%>
            <td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara( y, 5 )%></font>&nbsp;</nobr></td>
						<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "4" 'exibe os campos com valor inteiro
						If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
							matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
							x = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
							y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
							z = fnc_DiasUteisKPI(objrs.Fields.Item("RLZ_"& x).Value, objrs.Fields.Item("RLZ_"& y).Value, Request.QueryString("in_dias_util"))
						Else
							z = objrs.Fields.Item(nm_campo_rel).Value
						End If
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
					<tr class="gridtit" style="background-color:<%=cabec_result%>">
						<td height="15" colspan="<%= col%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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
