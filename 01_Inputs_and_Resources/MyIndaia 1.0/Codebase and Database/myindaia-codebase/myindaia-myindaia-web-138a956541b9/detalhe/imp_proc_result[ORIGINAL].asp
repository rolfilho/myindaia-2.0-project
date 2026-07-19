<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 01/08/2006
'
'Manutenção: 01/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim objfso      'objeto para o sistema de arquivos
Dim sql_s       'monta o select da query com os campos a serem exibidos
Dim sql_f       'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w       'monta o where da query
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_cliente  'código do cliente
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_li      'exibe imformações da li
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim tp_relat_rel'tipo do relatorio
Dim nr_di       'numero do registro da DI no SISCOMEX
Dim in_custo

in_show = False
cd_tela = "DET003"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "01"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
tp_relat_rel  = Request.QueryString("tp_relat")
in_custo = False
'seleciona os dados da view
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
Session("sql_imp_proc") = Null
If Not fnc_TestaVar(Session("sql_imp_proc")) Then
  'dados básicos do relatório
	sql_s = "SELECT PR.NR_PROCESSO, PR.CD_UNID_NEG, PR.CD_PRODUTO, PR.CD_EMBARCACAO, PR.NR_VIAGEM, PR.NR_VOO, PR.NR_CAMINHAO, "&_
					"  PR.CD_CLIENTE, SV.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &_
						" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "10" 'Datas direto de tabela
					sql_s = sql_s &_
						" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","11","21","31","41"'String - Lookup
					sql_s = sql_s &_
						" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
						"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
						"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
						" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "20","30","40"'Decimal, Moeda, Inteiro
					sql_s = sql_s &_
						" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0440","0441","0442","0479" 'pis/cofins/taxa siscomex/total tributos
					sql_s = sql_s &_
						"("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
  sql_f = "FROM TPROCESSO PR (NOLOCK) "&_
					"  INNER JOIN TSERVICO      SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
					"  LEFT  JOIN TPROCESSO_SDA PS (NOLOCK) ON (PS.NR_PROCESSO = PR.NR_PROCESSO) "&_
					"	 LEFT  JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "
	'requisitos da pesquisa
	sql_w = "WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w
	Session("sql_imp_proc") = sql
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_proc") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 120
  .CommandText = Session("sql_imp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'inclui o numero do processo no nome da tela
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value
cd_cliente  = objrs.Fields.Item("CD_CLIENTE").Value
'informações para as telas de impressão e download
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&cd_menu_rel="& cd_menu_rel &_
			"&cd_subm_rel="& cd_subm_rel &_
			"&cd_view_rel="& cd_view_rel &_
			"&nr_processo="& nr_processo &_
			"&cd_unid_neg="& cd_unid_neg &_
			"&cd_produto="& cd_produto &_
			"&cd_cliente="& cd_cliente &_
			"&nr_referencia="& nr_referencia &_
			"&nr_item_clnte="& nr_item_clnte

tx_path_file  = "/detalhe/imp_proc_print"
tx_path_excel = "/excel/det_import"
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function abreNavio(cd_embarcacao, nr_viagem) {
	features = "top=100,left=20,width=400,height=350,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_navio_imp.asp?cd_embarcacao='+cd_embarcacao+'&nr_viagem='+nr_viagem+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win0",features);
}

function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win2",features);
}

function abreLI(nr_processo, nrLi) {
	features = "top=20,left=20,width=750,height=550,scrollbars=yes,menubar=no";
	window.open('/detalhe/registro_li.asp?nr_processo='+nr_processo+'&nr_li='+nrLi+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win3",features);
}

function abreNotaFiscal(nr_processo) {
	features = "top=100,left=20,width=550,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_nota_fiscal_imp.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win4",features);
}
	
function abreFatComercial(nr_processo) {
	features = "top=100,left=20,width=550,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_fat_comercial.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win5",features);
}

function abreFaturamento(nr_processo) {
	features = "top=100,left=20,width=500,height=350,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_faturamento.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win6",features);
}

function abreInstDespachoCusto(nr_processo) {
	features = "top=100,left=20,width=750,height=550,scrollbars=no,menubar=no,status=yes";
	window.open('/detalhe/inst_despacho_custo.asp<%=url%>',"win7",features); 
}

function abreDocs(nr_proc_des, nr_proc_adm, tp_relat) {
	features = "top=100,left=20,width=350,height=250,resizable=yes";
  window.open('/detalhe/scan_docs_processo.asp?nr_proc_des='+nr_proc_des+'&nr_proc_adm='+nr_proc_adm+'&tp_relat='+tp_relat,"scan_docs_processo",features);
}

function abreParametrizacao(nr_processo, tp_relat) {
	features = "top=100,left=20,width=500,height=350,resizable=yes";
  window.open('/detalhe/imp_parametrizacao.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}

function abreStatus(nr_processo, tp_relat) {
	features = "top=100,left=20,width=750,height=550,resizable=yes";
  window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}
-->
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
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainDet">
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td height="100%" valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
								<%
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00050(cd_lang)%> - <a href="#historico" class="light"><%= tx_lang_A00055(cd_lang)%></a> -
										<a href="#observacao" class="light"><%= tx_lang_A00056(cd_lang)%></a> -
										<a href="#" onClick="abreStatus('<%= nr_processo%>','<%= tp_relat%>');" class="light"><%= tx_lang_A00091(cd_lang)%></a></td>
								</tr>
								<%
			Case 1
%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00051(cd_lang)%></td>
								</tr>
								<%
			Case 2

%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00052(cd_lang)%></td>
								</tr>
								<%
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr bgcolor="<%= bgcolor%>">
									<%
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= Mid(nr_processo, 5, Len(nr_processo))%>&nbsp;</td>
									<%
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= "<a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat_rel &"');"">"& tipo_canal(x) &"</a>"%>&nbsp;</td>
									<%
		Case "0044"
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%>
										<%
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						Response.Write("<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>")
					End If
%>
									</td>
									<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
%>
									<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_VOO").Value%></td>
									<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
%>
									<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_CAMINHAO").Value%></td>
									<%
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%></td>
									<%
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
						"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
						"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
						"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
							"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
							"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
								"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				end if
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = "&nbsp;"& str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td><%= str_merc%></td>
									<%
			objrsx.Close
		Case "0097" 'numero da referencia cliente (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					'Response.Redirect("../import/teste.asp?var1="&x&"")
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If NOT fnc_TestaVar(str) Then str = ""
'					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0 [OCORRENCIA NO.: 0399/08]
					If str <> "" Then str_refs(x) = str_refs(x) &"/"& str
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop
			End If
			%>
									<td class="detcampo"><%= Right(objrsv.Fields.Item("M10_NM_DADO").Value, 11)%></td>
									<td style="padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" border="0">
											<%
			if objrsx.RecordCount > 0 then
				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						Response.Write("<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>")
						Response.Write("<td>"& str_refs(x) &"</td></tr>")
					End If
				Next
			else
				Response.Write("<tr><td width='60' valign='top'>&nbsp;Pedido</td>")
				Response.Write("<td>"& nr_referencia&"/"&nr_item_clnte &"</td></tr>")
			end if										
%>
									</table></td>
<%
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= sim_nao(str)%>&nbsp;</td>
									<%
	 	Case "0225" 'Nr de LI
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_LI, DT_DEFERIMENTO, DT_VENCTO "&_
						"FROM TPROCESSO_LI (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY DT_VENCTO DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_li = ""
			If objrsx.RecordCount > 0 Then 
				Do While Not objrsx.Eof
					str_li = str_li &" <a href=""javascript:abreLI('"& Trim(objrs.Fields.Item("NR_PROCESSO").Value)& "','" & Trim(objrsx.Fields.Item(nm_campo_rel).Value) & "');""> "& fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1) &" </a>"
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= str_li%></td>
									<%
			objrsx.Close
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = fnc_Mascara(Trim(str), 1) Else str = ""
			If objrsv.Fields.Item("M10_CD_DADO").Value = "0283" Then 
				str = str &" <a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat_rel &"');""> <i>("& tx_lang_POP056(cd_lang) &")</i></a>"
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= str%></td>
									<%
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%>&nbsp;</td>
									<%
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</td>
									<%
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= z%>&nbsp;</td>
									<%
			End Select
	End Select
	If cont = 3 Then
		cont = 1
%>
								</tr>
								<%
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="0">
									<td width="15%"></td>
									<td width="35%"></td>
									<td width="15%"></td>
									<td width="35%"></td>
								</tr>
						</table></td>
						<td valign="top" width="150" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								<%
'cria o objeto do sistema de arquivos
Set objfso = Server.CreateObject("Scripting.FileSystemObject")
If objFSO.FolderExists(Server.MapPath("/docs/"& nr_processo)) Then							
%>
								<tr height="100">
									<td align="center">&nbsp;<a href='#' onClick="abreDocs('<%= nr_processo %>','<%= nr_processo %>','<%= tp_relat_rel%>');"><img src="/imagens/digitalizado.gif" width="60" height="65" border="0" alt="Clique para vizualizar os documentos digitalizados."><br>
										<%= tx_lang_A00058(cd_lang)%></a></td>
								</tr>
								<%
End If
Set objfso = Nothing

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe no processo conteiner
sql = "SELECT DISTINCT R.CD_REFERENCIA, C.NR_PROCESSO " &_
			"FROM TPROCESSO_CNTR C ( NOLOCK ) " &_
			"  INNER JOIN TREF_CLIENTE R ( NOLOCK ) ON R.NR_PROCESSO = C.NR_PROCESSO " &_
			"WHERE C.NR_PROCESSO =  '"& nr_processo &"' " &_
			"  AND C.TP_CNTR     <> '01'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe conteiner do processo/referencia
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreContainer('<%= nr_processo%>');"><img src="/imagens/container_on.gif" width="75" height="53" border="0" alt="Clique para vizualizar os Cont&ecirc;iners."><br>
										<%= tx_lang_A00040(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe no processo carga solta
sql = "SELECT DISTINCT NR_PROCESSO "&_
			"FROM TPROCESSO_CARGA_SOLTA ( NOLOCK ) "&_
			"WHERE NR_PROCESSO = '"& nr_processo &"' "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Carga Solta
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreCargaSolta('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/pallet_on.gif" width="97" height="66" border="0" alt="Clique para vizualizar os dados de Carga Solta."><br>
										<%= tx_lang_A00043(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe li no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_LI ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreLI('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>','');"><img src="/imagens/libera_imp_on.gif" width="32" height="32" border="0" alt="Clique para vizualizar os dados da LI."><br>
										<%= tx_lang_A00063(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe fatura comercial no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			"  AND CD_TIPO_DCTO_INSTR = '01'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFatComercial('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/nota_fiscal_on.gif" width="58" height="62" border="0" alt="Clique para vizualizar os dados da Fatura Comercial."><br>
										<%= tx_lang_A00064(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se foi emitida a nota fiscal
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_NF ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND IN_CANCELADO = 0"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreNotaFiscal('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/fatura_com_on.gif" width="62" height="65" border="0" alt="Clique para vizualizar os dados da Nota Fiscal."><br>
										<%= tx_lang_A00065(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se o processo ja foi faturado
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TFATURAMENTO_CC ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND IN_CANCELADO = 0"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal, colocar NOT
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFaturamento('<%= nr_processo%>');"><img src="/imagens/fatura_on.gif" width="74" height="66" border="0" alt="Clique para vizualizar os dados do Faturamento."><br>
										<%= tx_lang_A00066(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

'instrução para Despacho
if objrsx.State = adStateOpen then objrsx.Close()
sql = "SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '"& cd_cliente &"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If InStr("040;055;060", Session("cd_cargo")) > 0 Then
	If (Session("cd_cargo") = "040") and (objrsx.Fields.Item("CD_GRUPO").Value = "028") Then in_custo = True
Else
	If objrsx.Fields.Item("CD_GRUPO").Value = "028" Then in_custo = True
End If
objrsx.Close

				If in_custo then
					'verifica se o processo ja foi faturado'
'					sql = "SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_EVENTO = '289'"
'					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
''					'exibe Nota Fiscal, colocar NOT
'					If IsDate(objrsx.Fields.Item("DT_REALIZACAO").Value) Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreInstDespachoCusto('<%= nr_processo %>');"><img src="/imagens/despacho_custo.gif" alt="<%= tx_lang_A00094(cd_lang)%>" width="59" height="66" border="0"><br>
									<%= tx_lang_A00094(cd_lang)%></a></td>
								</tr>

<%
'					End If
'					objrsx.Close 
				End If

%>

							</table></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td width="50%" valign="top" style="border: solid 1px #336699;">
<!-- **************************************************************** 

						           HISTORICO/FOLLOW-UP

***************************************************************** -->
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr class="gridtop" height="16">
									<td><a name="historico"></a>&nbsp;<%= tx_lang_A00053(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00033(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00034(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00035(cd_lang)%></td>
								</tr>
								<%
'Seleciona os dados do follow-up
If objrs.State = adStateOpen Then objrs.Close
If cd_produto <> "06" Then
	sql = " AND F.NR_PROCESSO_DES = '"& nr_processo &"' "
else
	sql = ""
end if
sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.TP_FOLLOWUP, F.NR_ORDEM "&_
			"FROM TFLP_ESTAGIO F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
			"WHERE F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
			"  AND F.CD_EVENTO NOT IN ('022') "&_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			"ORDER BY F.TP_FOLLOWUP, F.NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
	
	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
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
	str = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value)
%>
								<tr bgcolor="<%= bgcolor%>" height="13">
									<td title="<%= str%>"><%= Left(str, 45)%><% if Len(str) > 45 then Response.Write("...")%></td>
									<td align="right"><%= fnc_Mascara( x, 5 )%>&nbsp;</td>
									<td align="center"><%= "<font color="& color &">"& z &"</font>"%></td>
									<td align="right"><%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</td>
								</tr>
								<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close
%>
							</table></td>
						<td width="50%" valign="top" style="border: solid 1px #336699;">
<!-- **************************************************************** 

						           OBSERVACOES

***************************************************************** -->
							<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="2">
								<tr class="gridtop" height="16">
									<td colspan="2">&nbsp;<a name="observacao"></a><%= tx_lang_A00054(cd_lang)%></td>
								</tr>
								<%
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS (NOLOCK) WHERE NR_PROCESSO = "
If cd_produto = "06" Then
	sql = sql&"'"& nr_referencia &"'"
Else
	sql = sql&"'"& nr_processo &"'"
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then str_obs = objrs.Fields.Item("TX_OBSERVACAO").Value else str_obs = ""
If Not fnc_TestaVar(str_obs) Then str_obs = "" 'Else str_obs = Replace(x, vbcrlf, "<br>")
%>
								<tr bgcolor="#EEEEEE">
									<td><iframe name="winObs" frameborder="0" width="100%" height="<%= x%>"></iframe></td>
								</tr>
							</table></td>
					</tr>
				</table>
		  </div>
			<!-- :::::::::: FIM DO CORPO CENTRAL     :::::::::: -->
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
<script language="javascript" type="text/javascript">
<!--
	var obsWin = null;
	var hasObs = false;
  var txtObs = '<p style="font-size: 10px;"><%= Replace(Replace(str_obs, "'", "´"), vbcrlf, "<br>")%></p>';
	var htmlHeader = '<html><head><link href="/includes/styles.css" rel="stylesheet" type="text/css"></head><body style="background-color: #EEEEEE; overflow: auto;">';
	var htmlBotton = '</body></html>';
	
	if (obsWin != null && !obsWin.closed) hasObs=true;
  if (!hasObs) obsWin=window.open("","winObs");
		
  obsWin.document.open();
  obsWin.document.write(htmlHeader+txtObs+htmlBotton);
  obsWin.document.close();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->