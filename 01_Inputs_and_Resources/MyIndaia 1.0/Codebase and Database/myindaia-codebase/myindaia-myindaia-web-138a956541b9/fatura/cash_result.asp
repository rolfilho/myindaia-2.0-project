<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB: Financeiro - Cash Flow
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor: Alexandre Gonçalves Neto
'Criado: 11/04/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s 'monta o select da query com os campos a serem exibidos
Dim sql_f 'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w 'monta o where da query
Dim sql_o 'monta a ordenação da query
Dim pagina'pagina inicial da ordenação
Dim ap_filtro    'nome do filtro selecionado para a consulta
Dim ap_filtros   'nome dos filtros utilizados
Dim tx_path_det  'caminho do arquivo de detalhe de processo
Dim vl_proc_prev 'total dos valores previstos do processo
Dim vl_proc_pago 'total dos valores pagos do processo

in_comodo = "1"
in_show  = False
cd_tela  = "FAT007"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request.QueryString("p"))
nr_cols_data = Request.QueryString("nr_cols_data")
nr_cols_item = Request.QueryString("nr_cols_item")
ap_filtros   = Replace(Request.QueryString("filtro"),", ","','")
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
'Session("sql_fat_cash_flow") = Null
If Not fnc_TestaVar(Session("sql_fat_cash_flow")) Then
	'dados básicos do relatório
	If in_embarque Then 
		sql_s = "  (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE ( NOLOCK ) WHERE NR_PROCESSO = R.NR_PROCESSO) AS NR_REFERENCIA, "&_
						"  (SELECT TOP 1 NR_ITEM_PO    FROM TREF_CLIENTE ( NOLOCK ) WHERE NR_PROCESSO = R.NR_PROCESSO) AS NR_ITEM_CLIENTE, "
	Else
		sql_s = " R.NR_REFERENCIA, R.NR_ITEM_CLIENTE, "
	End If
	sql_s = "SELECT DISTINCT "&_
					"  "& sql_s &" R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados
	nr_cols_data = 0 'qtde de eventos selecionados
	nr_cols_item = 0 'qtde de colunas com valor previsto/pago selecionadas
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		'verifica se o campo é montado dinamicamente e de acordo com valores padrão
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_CONSULTA")
				Case 0 'pega o valor direto da tabela indicada no "FROM"
					'verifica o tipo de dado
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case 0, 5 'campos de texto
							sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case 1 'campos de data
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								nr_cols_data = nr_cols_data + 1
								If in_embarque Then 
									sql_s = sql_s &_
												" F"& nr_cols_data &".DT_REALIZACAO AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_cols_data &".DT_PREVISTA AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_cols_data &".IN_APLICAVEL AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
									sql_f = sql_f &_
												" LEFT JOIN TFOLLOWUP F"& nr_cols_data &" ( NOLOCK ) ON ( F"& nr_cols_data &".NR_PROCESSO = PR.NR_PROCESSO AND F"& nr_cols_data &".CD_EVENTO = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"') "
								Else
									sql_s = sql_s &_
													" FI.IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" FI.PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" FI.RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								End If
							Else
								sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
						Case 2, 3, 4 'campos numericos
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								sql_s = sql_s &_
												"  ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PREV, 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &"_PREV, "&_
												"  ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PAGO, 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &"_PAGO, "
								nr_cols_item = nr_cols_item + 1
							Else
								sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
					End Select
				Case 1 'o valor vem atraves da consulta em outra tabela
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 2 'campos que retornam numeros para consulta em array
					sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 3 'campos que são calculados.
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
	sql_f = "FROM TREL_FAT_CASH_FLOW R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO   PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) "& sql_f
	If in_embarque Then
	  'no caso de embarque, a tabela de cahs flow tem de ser agrupada para soma dos valores.
		sql_f = sql_f &_
						"  INNER JOIN (SELECT NR_PROCESSO, CD_MOEDA_FRETE, ISNULL( SUM(VL_FRETE_MNEG), 0) AS VL_FRETE_MNEG, "
		objrsv.MoveFirst
		Do While Not objrsv.Eof
			'verifica se o campo é montado dinamicamente e de acordo com valores padrão
			If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
				If objrsv.Fields.Item("M10_TP_CONSULTA") = 0 and objrsv.Fields.Item("M10_TP_DADO").Value = 3 and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then 			
					sql_f = sql_f &_
									"  SUM("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PREV) AS "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PREV, "&_
									"  SUM("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PAGO) AS "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &"_PAGO, "
				End If
			End If
			objrsv.MoveNext
			If objrsv.Eof Then
				sql_f = Left( sql_f, Len(sql_f)-2 ) &" "
				Exit Do
			End If
		Loop
		sql_f = sql_f &_
						" FROM TCASH_FLOW (NOLOCK) "&_
            " GROUP BY NR_PROCESSO, CD_MOEDA_FRETE) CF ON ( CF.NR_PROCESSO = R.NR_PROCESSO ) "
	Else
		sql_f = sql_f &_
						"  INNER JOIN TFLP_IMPORT FI ( NOLOCK ) ON ( FI.NR_PROCESSO_DES = R.NR_PROCESSO AND FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE ) "&_
						"  INNER JOIN TCASH_FLOW  CF ( NOLOCK ) ON ( CF.NR_PROCESSO = R.NR_PROCESSO AND CF.NR_REFERENCIA = R.NR_REFERENCIA AND CF.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE ) "
	End If
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   =  "& nr_ident &" "
  'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then
		sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
	End If
	If in_embarque Then
		sql_o = sql_o &" R.NR_PROCESSO ASC "
	Else
		sql_o = sql_o &" R.NR_REFERENCIA ASC, R.NR_ITEM_CLIENTE ASC "
	End If
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w & sql_o
	Session("sql_fat_cash_flow") = sql
Else
  If not fnc_TestaVar(nr_cols_data) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
					"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
					"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
					"WHERE M14_CD_VIEW     = '"& cd_view &"' "&_
					"  AND M12_TP_EXIBIR  >= '"& Session("tp_exibir") &"' "&_
					"  AND M12_IN_ATIVO    = 1 " &_
					"  AND M10_IN_ATIVO    = 1 " &_
					"  AND M10_TP_DADO     = '1' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_cols_data = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
	
	If not fnc_TestaVar(nr_cols_item) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
					"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
					"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
					"WHERE M14_CD_VIEW     = '"& cd_view &"' "&_
					"  AND M12_TP_EXIBIR  >= '"& Session("tp_exibir") &"' "&_
					"  AND M12_IN_ATIVO    = 1 " &_
					"  AND M10_IN_ATIVO    = 1 " &_
					"  AND M10_TP_DADO     = '3' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_cols_item = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
End If
'Response.Write(Session("sql_fat_cash_flow") &"<br>")
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_fat_cash_flow")
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

col = (objrsv.RecordCount - nr_cols_data - (nr_cols_item+1)) + (nr_cols_data * 3) + ((nr_cols_item+1) * 2)
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_cols_data="& nr_cols_data &_
			"&nr_cols_item="& nr_cols_item &_
			"&nr_cols="& col

tx_path_file  = "/fatura/cash_print"
tx_path_excel = "/excel/fat_cash_flow"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "<%= "/"& ap_menu &"/"& ap_subm &"_result.asp"& url &"&p="%>"+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}
//-->
</script>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
  <tr valign="top">
    <td height="105" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<tr height="40" class="gridtit">
					<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
            <td<% If in_dt_prev Then Response.Write(" colspan='3'")%>><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
            <%
	Else
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
%>
            <td colspan="2"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
            <%
		Else
%>
            <td rowspan="2"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
            <%
		End If
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<tr class="gridsub">
<%
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
		If in_dt_prev Then
%>
            <td><%= tx_lang_A00033(cd_lang)%></td>
            <td><%= tx_lang_A00034(cd_lang)%></td>
            <td><%= tx_lang_A00035(cd_lang)%></td>
            <%
		End If
	Else
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
%>
            <td><%= tx_lang_A00033(cd_lang)%></td>
						<td><%= tx_lang_A00088(cd_lang)%></td>
            <%
		End If
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
          <%
nrec = 0
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
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
					<tr height="16" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	vl_proc_prev = 0
	vl_proc_pago = 0
	'dados do prcesso
	nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
	nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
	'verifica qual o produto
	If Mid(nr_processo, 3, 2) = "01" Then tx_path_det = "/detalhe/imp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&nr_referencia="& nr_referencia &"&nr_item_clnte="& nr_item_clnte &"&filtro=nr_processo&nr_processo="& nr_processo
	If Mid(nr_processo, 3, 2) = "02" Then tx_path_det = "/detalhe/exp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&filtro=nr_processo&nr_processo="& nr_processo
	'exibe as informaçõe de acordo com a personalização
	Do While Not objrsv.Eof
		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="right"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= Mid(nr_processo, 5, Len(nr_processo))%></a>&nbsp;</nobr></td>
						<%
			Case "0018" 'Nr. do pedido
%>
						<td align="right"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= nr_referencia%></a>&nbsp;</nobr></td>
						<%
			Case "0019" 'Nr. do item do pedido
%>
						<td align="right"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= nr_item_clnte%></a>&nbsp;</nobr></td>
						<%
			Case "0094","0096","0097","0098","0099","0100","0101","0374" 'Nr.Referencia - Item
				If objrsx.State = 1 Then objrsx.Close()
				sql = "SELECT DISTINCT CD_REFERENCIA, ISNULL(NR_ITEM_PO, 0) AS NR_ITEM_PO "&_
		     			"FROM TREF_CLIENTE ( NOLOCK ) "&_
		     			"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
		     			"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
		     			"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		  	str = "referências / itens"& vbcrlf
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					If CInt(nr_item_clnte) > 0 Then x = nr_referencia &"/"& CInt(nr_item_clnte)
					If objrsx.RecordCount  > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						If CInt(objrsx.Fields.Item("NR_ITEM_PO").Value) > 0 Then str = str &"/"& CInt(objrsx.Fields.Item("NR_ITEM_PO").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & vbcrlf
					Loop
				Else
					x   = Null
					str = Null
				End If
%>
            <td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
            <%
				objrsx.Close()
			Case "0066" 'tipo de frete
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_frete(CInt(str)) Else str = "n/d"
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(M.NM_MERCADORIA, DM.TX_DESC_DET_MERC) AS TX_MERCADORIA, "&_
							"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA, "&_
								"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
								"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
								"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
									"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
									"FROM TPROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Left(Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value,"""","'")), 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'"))
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
			Case "0408" 'Total do Processo
				If fnc_TestaVar(vl_proc_prev) Then vl_proc_prev = FormatNumber(vl_proc_prev, 2) Else vl_proc_prev = 0
				If fnc_TestaVar(vl_proc_pago) Then vl_proc_pago = FormatNumber(vl_proc_pago, 2) Else vl_proc_pago = 0
%>
						<td align="right"><nobr>&nbsp;<%= vl_proc_prev%>&nbsp;</nobr></td>
						<td align="right"><nobr>&nbsp;<%= vl_proc_pago%>&nbsp;</nobr></td>
						<%
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
										z = fnc_DiasUteisKPI(x, y, 0)
									Else
										z = fnc_DiasUteisKPI(x, Date(), 0)
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
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
							x = objrs.Fields.Item(nm_campo_rel &"_PREV").Value
							y = objrs.Fields.Item(nm_campo_rel &"_PAGO").Value
							If fnc_TestaVar(x) Then x = FormatNumber(x, 2) Else x = 0
							If fnc_TestaVar(y) Then y = FormatNumber(y, 2) Else y = 0
							vl_proc_prev = vl_proc_prev + x
							vl_proc_pago = vl_proc_pago + y
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<td align="right"><nobr>&nbsp;<%= y%>&nbsp;</nobr></td>
						<%
						Else
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
						End If
					Case "4" 'exibe os campos com valor inteiro
						If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
							matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
							x = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
							y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
							z = fnc_DiasUteisKPI(objrs.Fields.Item("RLZ_"& x).Value, objrs.Fields.Item("RLZ_"& y).Value, 0)
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
					<tr class="gridtit">
						<td height="15" colspan="<%= col%>" align="left"><nobr><%= tx_lang_A00030(cd_lang) &" "& objrs.RecordCount &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
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