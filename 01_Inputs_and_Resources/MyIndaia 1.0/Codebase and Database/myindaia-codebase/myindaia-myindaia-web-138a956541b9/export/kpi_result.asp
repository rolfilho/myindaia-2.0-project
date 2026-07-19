<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação / Metrics por Embarque
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 06/07/2005
'
'Manutenção: 02/03/2006
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
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados

in_comodo = "1"
in_show  = False
cd_tela  = "EXP007"
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
'Session("sql_exp_kpi") = Null
If Not fnc_TestaVar(Session("sql_exp_kpi")) Then
  'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.NR_REFERENCIA, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados
	nr_data = 0 'numero de eventos selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
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
						sql_s = sql_s &"R."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Else
						'Outras datas vindas de outras tabelas
						sql_s = sql_s & objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End If
				Case "20","30","40","43"'Decimal, Moeda,Inteiro
					sql_s = sql_s & objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else 'Campos problema!!! Esse MyIndaia... ai, ai...
		  Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0182" 'Analista Cliente
					sql_s = sql_s &_
									" ( SELECT NM_CONTATO "&_
									"   FROM TCLIENTE_CONTATO ( NOLOCK ) "&_
									"   WHERE CD_CONTATO  = PR.CD_CONTATO  "&_
									"     AND CD_UNID_NEG = PR.CD_UNID_NEG "&_
									"     AND CD_PRODUTO  = PR.CD_PRODUTO  "&_
									"	    AND CD_CLIENTE  = PR.CD_CLIENTE  "&_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "0183","0185","0186" 'Data de emissão das referencias
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									"     AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				'Case "0188" 'Emissão da Nota Fiscal
				'	sql_s = sql_s &_
				'					" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
				'					"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
				'					"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
				'					" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
  sql_f = "FROM TREL_EXP_KPI R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO     PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) "&_
					"  LEFT  JOIN TPROCESSO_EXP PE ( NOLOCK ) ON ( PE.NR_PROCESSO = R.NR_PROCESSO ) "&_
					"  LEFT  JOIN TPROCESSO_EXP_SAQUE  SQ ( NOLOCK ) ON ( SQ.NR_PROCESSO = R.NR_PROCESSO ) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = "& fnc_QuotedSQL(Session("cd_usuario")) &_
					"  AND R.NR_IDENT   = "& nr_ident &" "
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
	    If in_embarque Then
		    sql_o = sql_o &" R.NR_PROCESSO ASC"
	    Else
		    sql_o = sql_o &" R.NR_REFERENCIA ASC"
	    End If
	End If

	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w & sql_o
	Session("sql_exp_kpi") = sql
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
'Response.Write(Session("sql_exp_kpi"))
'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_kpi") &"<br>"

With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_exp_kpi")
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

col = objrsv.RecordCount
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/export/kpi_print"
tx_path_excel = "/excel/exp_kpi"

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
	var target = "kpi_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
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
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;background-color:<%=fundo_result%>;">
					<tr class="gridtit" style="background-color:<%=cabec_result%>;">
						<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
            <td <% If in_dt_prev Then Response.Write("colspan='3'")%> height="15"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
            <%
	Else
%>
            <td <% If in_dt_prev Then Response.Write("rowspan='2'")%>><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
            <%
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<%
If in_dt_prev Then
%>
					<tr height="15" class="gridsub">
					<%
	For x = 1 to nr_data
%>
            <td><%= tx_lang_A00033(cd_lang)%></td>
						<td><%= tx_lang_A00034(cd_lang)%></td>
						<td><%= tx_lang_A00035(cd_lang)%></td>
            <%
	Next
%>
          </tr>
          <%
End If

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
						<td height="20" colspan="<%= col%>" class="gridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
	
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	'pega informações do processo
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'aplica a personalização
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="center"><a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= Mid(nr_processo, 5, Len(nr_processo))%></nobr></a></td>
						<%
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
            <td align="center"><nobr><%= str%></nobr></td>
            <%
			Case "0017" 'canal de liberacao
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 4
%>
						<td align="center"><img src="/imagens/icones/16x16/tp_canal_<%= Trim(str)%>.gif" width="17" height="16"></td>
						<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0468" 'Nr.Referencia - Item
				nr_referencia = Null
				str           = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = "referências"& vbcrlf
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					End If
				End If
%>
            <td align="left" title="<%= str%>"><a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= nr_referencia%></nobr></a></td>
            <%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT CD_MERCADORIA, ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
							"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = "& fnc_QuotedSQL( objrs.Fields.Item("NR_PROCESSO").Value )
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				If objrsx.RecordCount > 0 Then
					str = "Código - Descrição"& vbcrlf
					'descrição que será exibida
					x = Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
					If Len(x) > 40 Then x = Left(x, 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("CD_MERCADORIA").Value ) &" - "
						str = str & Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop 
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = "& fnc_QuotedSQL( objrs.Fields.Item("NR_PROCESSO").Value )
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then 
						str = str & Trim( objrsx.Fields.Item("TX_MERCADORIA").Value )
					Else
						str = "Descrição não Disponível."
					End If
					If Len(str) > 40 Then x = Left(str, 40) &"..." Else x = str
				End If
%>
						<td align="left" title="<%= str%>"><nobr><%= x%></nobr></td>
						<%
				objrsx.Close
				
						Case "0085" 'Agente de carga
								If objrsx.state = adStateOpen then objrsx.Close()
								sql="select tp.NR_PROCESSO,tp.cd_agente,ta.nm_agente as agente from tprocesso tp, tagente ta where NR_PROCESSO= '"& nr_processo &"' and ta.cd_agente=tp.cd_agente"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								str=""
								If objrsx.eof  Then
									 str = "&nbsp;"
								Else
									str = Trim(objrsx.Fields.Item("agente").Value)
								End If
								'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()%>
								<td><nobr><%=str%>&nbsp;</nobr></td>
				
				
		<%	Case "0103" 'sim/não campo in_urgente
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 0
%>
						<td align="center"><nobr><%= sim_nao(str)%></nobr></td>
						<%
			Case "0118","0123" 'Nr. Nota Fiscal / Nr. RE
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0118" Then
					sql = "SELECT NR_NF AS NUMERO "&_
								"FROM TPROCESSO_EXP_NF ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"ORDER BY NR_NF"
				End If
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0123" Then
					sql = "SELECT NR_RE AS NUMERO "&_
								"FROM TPROCESSO_EXP_RE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"ORDER BY NR_RE"
				End If
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				w = ""
				x = 0
				Do While Not objrsx.Eof
					If w <> "" Then w = w & vbcrlf
					w = w & objrsx.Fields.Item("NUMERO").Value
					x = x + 1
					objrsx.MoveNext
				Loop
				objrsx.Close()
%>
						<td <% If x > 1 Then Response.Write("title='"& w &"'")%>><nobr><%= Left(w, 6)%>
							<% If x > 1 Then Response.Write("...")%>
							&nbsp;</nobr></td>
						<%
			Case "0154" 'Indicados do saque Borderô
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)
%>
						<td align="left"><nobr><%= str%></nobr></td>
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
						'Response.Redirect("../IMPORT/teste.asp?var1="&nm_campo_rel&"")
						y = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(y) Then y = Null 
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