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
<% Response.Charset="ISO-8859-1" %>
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim objfso      'objeto para o sistema de arquivos
Dim sql_s       'monta o select da query com os campos a serem exibidos
Dim sql_f       'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w       'monta o where da query
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_cntr    'qtde de containers
Dim str_lcl     'qtde de pallets/carga solta
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_cliente  'código do cliente
Dim Hr_evento ,evento     'Checagem do evento para exibição do horário (observações)
Dim flag_resumo, in_verifica_importador

in_show = False
cd_tela = "DET007"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))

If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "02"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel   = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel   = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel   = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_processo   = CStr(Request.QueryString("nr_processo"))

'seleciona os dados da view
in_view_campo = 1
flag_resumo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
in_btn_excel = 0
in_btn_lupa = 1
Session("sql_exp_proc_resumo") = Null
If Not fnc_TestaVar(Session("sql_exp_proc_resumo")) Then
  'dados básicos do relatório
	sql_s = "SELECT PR.NR_PROCESSO, PR.CD_UNID_NEG, PR.CD_PRODUTO, PR.CD_EMBARCACAO, PR.NR_VIAGEM, PR.NR_VOO, PR.NR_CAMINHAO, "&_
					"  PR.CD_CLIENTE, ISNULL(SV.CD_VIA_TRANSPORTE, SN.CD_VIA_TRANSPORTE) AS CD_VIA_TRANSPORTE, "
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
					"  LEFT JOIN TSERVICO      SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
                    "  LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO) "&_
					"  LEFT  JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PR.NR_PROCESSO) "
	'requisitos da pesquisa
	sql_w = "WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w
	Session("sql_exp_proc_resumo") = sql
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_proc_resumo") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 120
  .CommandText = Session("sql_exp_proc_resumo")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'inclui o numero do processo no nome da tela
nm_tela     = nm_tela &": "& Mid(nr_processo, 5, Len(nr_processo))
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
			"&nr_referencia="& nr_referencia

tx_path_file  = "/detalhe/exp_proc_print"
tx_path_excel = "/excel/det_export"
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->

<style type="text/css">
<!--
-->
</style>
</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/30/seta.jpg';" bgcolor="#FFFFFF">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<td width="88%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
            <div id="divInfo2" class="divInfo" style="overflow:hidden">
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="26" bgcolor="#b4c7db" >
<tr>
<td width="96%" align="center" valign="middle"><center><div id="divTitulo"></div></center></td>
<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfoCorpo2','divInfoRodape2','divInfo2');"><img src="/imagens/30/btn_fechar.gif" width="18" height="17" border="0" alt="Fechar"></a>&nbsp;</td>
</tr>
</table>
 </div>
<div id="divInfoCorpo2" class="divDetalhes"></div>       
<div id="divInfoRodape2" class="divInfo" style="overflow:hidden">
<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td>
    </td>
    </tr>
</table>
 </div> 
  <table width="100%" border="0" cellspacing="2" cellpadding="0" >
					<tr>
						<td height="100%" valign="top"><%
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
%><br />
                                &nbsp;<font size="2"><b><%= Mid(Request.QueryString("nr_processo"),5,15)%></b></font> <img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="600" border="0" height="3px" align="middle">
								<table width="100%" border="0" cellspacing="1" cellpadding="1" style="border: solid 1px <%=bg_detalhes_borda%>;">                                 
								<%
			Case 1
%>
								 <tr height="0">
									<td width="15%"></td>
									<td width="35%"></td>
									<td width="15%"></td>
									<td width="35%"></td>
								</tr>
                                </table><br />
                                 &nbsp;<font size="2"><b><%= tx_lang_A00051(cd_lang)%></b></font> <img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="600" border="0" height="3px" align="middle">
                                <table width="100%" border="0" cellspacing="1" cellpadding="1" style="border: solid 1px <%=bg_detalhes_borda%>;"> 								
								<%
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
%>
								<tr bgcolor="<%= bgcolor%>">
									<%
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
        If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL(IN_MBF,'1') IN_MBF  FROM BROKER.DBO.TPROCESSO WHERE NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= UCase(Mid(nr_processo, 5, Len(nr_processo)))%>&nbsp;&nbsp;&nbsp;<input id="chkMBF" type="checkbox" <%If objrsx.Fields.Item("IN_MBF").Value <> "0" Then%>checked<%End If%> onclick="mudaMBF(this, '<%= nr_processo%>')" />MBF</td>
									<%
            objrsx.Close
            		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= tipo_canal(x)%>&nbsp;</td>
									<%
		Case "0044" 'embarcação / vôo / caminhão
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
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
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_VOO").Value%></td>
									<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_CAMINHAO").Value%></td>
									<%
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%></td>
									<%
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL( TX_MERCADORIA, '') AS AP_MERCADORIA "&_
						"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
							"FROM TPROCESSO ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str_merc%></td>
									<%
			objrsx.Close
		Case "0097" 'numero das referencias (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE TP_REFERENCIA NOT IN ('50','51','52') and NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
					
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td style="padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" border="0">
											<%
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					nr_item_clnte = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(nr_item_clnte) Then nr_item_clnte = CInt(nr_item_clnte) Else nr_item_clnte = 0
					If nr_item_clnte <> 0 Then str_refs(x) = str_refs(x) &"/"& nr_item_clnte
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop

				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						Response.Write("<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>")
						Response.Write("<td>"& str_refs(x) &"</td></tr>")
					End If
				Next
%>
										</table></td>
									<%
			End If
			objrsx.Close
		Case "0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= sim_nao(str)%>&nbsp;</td>
									<%
	 	Case "0123" 'RE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= fnc_Mascara(str, 1)%></td>
									<%
		Case "0159","2325" 'DDE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= fnc_Mascara(str, 3)%></td>
									<%
		Case "0170" 'qtde de containers
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT TP_CNTR, COUNT(*) AS VL_QTDE "&_
						"FROM TPROCESSO_CNTR (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"  AND TP_CNTR <> '01' "&_
						"GROUP BY TP_CNTR "&_
						"ORDER BY TP_CNTR"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_cntr = ""
			If objrsx.RecordCount > 0 then
				Do While Not objrsx.Eof
					str_cntr = str_cntr & objrsx.Fields.Item("VL_QTDE").Value &" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_cntr = str_cntr &"; "
				Loop
			Else
				str_cntr = tx_lang_A00041(cd_lang)
			End If
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str_cntr%>&nbsp;</td>
									<%
		Case "0350" 'qtde de pallets
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT SUM(VL_QTDE) AS VL_QTDE FROM TPROCESSO_CARGA_SOLTA (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_lcl = ""
			If objrsx.Fields.Item("VL_QTDE").Value > 0 then
				Do While Not objrsx.Eof
					str_lcl = str_lcl & objrsx.Fields.Item("VL_QTDE").Value '&" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_lcl = str_lcl &"; "
				Loop
			Else
				str_lcl = tx_lang_A00044(cd_lang)
			End If
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str_lcl%>&nbsp;</td>
									<%
			objrsx.Close
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%>&nbsp;</td>
									<%
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</td>
									<%
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
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
									<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
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
%>								<tr height="0">
									<td width="15%"></td>
									<td width="35%"></td>
									<td width="15%"></td>
									<td width="35%"></td>
								</tr>	
                                							</table></td>
						
					</tr>
                    
				</table>
                <br />
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td width="<%If Session("cd_cargo") <> "088" Then%>45%<%Else%>100%<%End If%>" valign="top">
<!-- **************************************************************** 

						           HISTORICO/FOLLOW-UP

***************************************************************** -->
							<font size="2"><b><%= tx_lang_A00053(cd_lang)%></b></font> <img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="260px" border="0" height="3px" align="middle"/></nobr>
                            <table width="100%" height="100%" border="0" cellspacing="1" cellpadding="0" style="border: solid 1px <%=bg_detalhes_borda%>;" >
								<%
in_verifica_importador = 0								
If Session("cd_cargo") = "088" Then			
	If objrs.State = adStateOpen Then objrs.Close
	sql = " SELECT TOP 1 CD_GRUPO AS GRUPO "&_
   	" FROM TPERMISSAO_EMPRESA_EST PE "&_
    " INNER JOIN TEMPRESA_EST_GRUPO EG ON EG.CD_EMPRESA = PE.CD_EMPRESA "&_
    " WHERE CD_USUARIO ='" & Session("cd_usuario") & "'"
	Objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
	
	grupo_importador = Objrs.Fields.Item("GRUPO").Value
					 
	If objrs.State = adStateOpen Then objrs.Close
	sql = " SELECT CD_EVENTO FROM TGRUPO_IMPORTADOR_EVENTO WHERE CD_GRUPO = '" & grupo_importador &  "' AND CD_PRODUTO = '02'" 		
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText						
				
	If objrs.RecordCount > 0 Then
		in_verifica_importador = 1
	Else
		in_verifica_importador = 0
	End If	
End If
															
If objrs.State = adStateOpen Then objrs.Close
'Seleciona os dados do follow-up
If in_verifica_importador = 1 Then
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM , TF.HR_CARGA AS HORA_CARGA ,  TF.HR_TEMP AS HORA_TEMP ,   TF.HR_IMO AS HORA_IMO ,  TF.HR_GATE AS HORA_GATE ,  TF.HR_DRAFT " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"  INNER JOIN TFLP_EXPORT1 TF ( NOLOCK ) ON ( TF.NR_PROCESSO = F.NR_PROCESSO ) "&_
            "  LEFT JOIN TFLP_EXPORT2 TF2 ( NOLOCK ) ON ( TF2.NR_PROCESSO = TF.NR_PROCESSO ) "&_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO IN (SELECT CD_EVENTO FROM TGRUPO_IMPORTADOR_EVENTO WHERE CD_GRUPO = '" &  grupo_importador &  "' AND CD_PRODUTO = '02' ) " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			" ORDER BY F.NR_ORDEM"
Else
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM , TF.HR_CARGA AS HORA_CARGA ,  TF.HR_TEMP AS HORA_TEMP ,   TF.HR_IMO AS HORA_IMO ,  TF.HR_GATE AS HORA_GATE ,  TF.HR_DRAFT " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"  INNER JOIN TFLP_EXPORT1 TF ( NOLOCK ) ON ( TF.NR_PROCESSO = F.NR_PROCESSO ) "&_
            "  LEFT JOIN TFLP_EXPORT2 TF2 ( NOLOCK ) ON ( TF2.NR_PROCESSO = TF.NR_PROCESSO ) "&_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO NOT IN ('022') " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			" ORDER BY F.NR_ORDEM"
End If			
'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
   img_marcador = ""
   If Not fnc_TestaVar(objrs.Fields.Item("DT_REALIZACAO").Value) and objrs.Fields.Item("IN_APLICAVEL").Value = "1" Then
        if objrsx.State = adStateOpen then objrsx.Close()
        sql = "SELECT COUNT(*) AS CONTADOR FROM TALERTA_MONITORAMENTO WHERE NR_PROCESSO = '" & nr_processo & "' AND CD_EVENTO = '" & objrs.Fields.Item("CD_EVENTO").Value & "' AND DT_ENVIO IS NULL"
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

        img_marcador = "&nbsp;&nbsp;<img alt='Monitorar Evento' src='/imagens/30/marcador"
        if objrsx("CONTADOR") = 0 Then
            img_marcador = img_marcador & "_d"
        End If
        img_marcador = img_marcador & ".gif' border='0' onclick=""alteraMarcador(this,'" & nr_processo & "', '" & objrs.Fields.Item("CD_EVENTO").Value & "', '" & Session("cd_usuario")& "');"" style='cursor:pointer;'>"    
    End If  
    
  If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	evento=objrs.Fields.Item("CD_EVENTO").Value
	Select case evento
		   Case "270" 'Draft
		        Hr_evento=objrs.Fields.Item("HR_DRAFT").Value
		   Case "130" 'IMO
		        Hr_evento=objrs.Fields.Item("HORA_IMO").Value
		   Case "562" 'CARTA DE TEMPERATURA
		        Hr_evento=objrs.Fields.Item("HORA_TEMP").Value
		   Case "271" 'CARGA
		        Hr_evento=objrs.Fields.Item("HORA_CARGA").Value
			'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("HR_GATE").Value&"")	
		   Case else
		        Hr_evento=""
		   'Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"")
	End Select
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
'	if evento=270 then  Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"") end if 

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
									<td title="<%= str%>"><%= Left(str, 50)%><% if Len(str) > 50 then Response.Write("...")%></td>
									<td align="right"><%= "<font color="& color &">"& y & img_marcador & "</font>"%>&nbsp;</td>
								</tr>
								<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close
%>
							</table></td>
                            <%If Session("cd_cargo") <> "088" Then%>
						<td width="55%" valign="top">
<!-- **************************************************************** 

						           OBSERVACOES

***************************************************************** -->
							&nbsp;<font size="2"><b><%= tx_lang_A00054(cd_lang)%></b></font> <img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="380px" border="0" height="3px" align="middle">
							<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="2" style="border: solid 1px <%=bg_detalhes_borda%>;" >
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
								<tr bgcolor="<%=bg_detalhes %>" style="color:#546678;">
									<td height="<%= x+58%>">
                                    <%if Session("cd_cargo") <> "131" Then%>
                                    <div style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;overflow:auto;height:<%= x+54%>" ><%= Replace(Replace(str_obs, "'", "´"), vbcrlf, "<br>")%></div>                                   
									<%End If%>
                                    </td>
								</tr>
							</table></td>
					</tr>
				</table>
			<!-- :::::::::: FIM DO CORPO CENTRAL     :::::::::: -->
		</td>
        <%End If%>
        <td valign="top" width="120"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								<%
'cria o objeto do sistema de arquivos
If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT COUNT(*) AS CONTADOR "&_
	" FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
	" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
	"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
	" WHERE PD.NR_PROCESSO   = '" & nr_processo & "'"&_
	" AND PD.IN_ATIVO      = '1' "&_
	" AND TDD.IN_ENVIA_WEB = '1' "
    objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'cria o objeto do sistema de arquivos
If	objrs.Fields.Item("CONTADOR").Value > 0 Then%>
								<tr height="100">
									<td align="center">&nbsp;<a href='#' onClick="abreDocs('<%= nr_processo %>');"><img src="/imagens/30/digitalizado.gif" border="0" alt="Clique para visualizar os documentos digitalizados."><br>
										<%= tx_lang_A00058(cd_lang)%></a></td>
								</tr>
								<%
End If

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe no processo conteiner
sql = "SELECT DISTINCT R.CD_REFERENCIA, C.NR_PROCESSO " &_
			"FROM TPROCESSO_CNTR C ( NOLOCK ) " &_
			"  INNER JOIN TREF_CLIENTE R ( NOLOCK ) ON R.NR_PROCESSO = C.NR_PROCESSO " &_
			"WHERE C.NR_PROCESSO =  '"& nr_processo &"' " &_
			"  AND C.TP_CNTR     <> '01'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe conteiner do processo/referencia
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreContainer('<%= nr_processo%>');"><img src="/imagens/30/container_on.gif"  border="0" alt="Clique para visualizar os Cont&ecirc;iners."><br>
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
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Carga Solta
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreCargaSolta('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/30/pallet_on.gif" border="0" alt="Clique para visualizar os dados de Carga Solta."><br>
										<%= tx_lang_A00043(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close


'caso tenha na tabela antiga, mostra popUp antiga
If objrs.State = adStateOpen Then objrs.Close
'verifica se existe RE no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_EXP_RE ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe RE
If Not objrs.Eof Then
%>
									<tr height="100">
										<td align="center">&nbsp;<a href="javascript:abreRE('<%= nr_processo%>');"><img src="/imagens/30/libera_imp_on.gif" border="0" alt="Clique para visualizar os dados da LI."><br>
											<%= tx_lang_A00067(cd_lang)%></a></td>
									</tr>
									<%

else
	If objrs.State = adStateOpen Then objrs.Close
	'verifica se existe RE no processo
	sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_EXP_DDE_RE ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'exibe RE
	If Not objrs.Eof Then
%>
									<tr height="100">
										<td align="center">&nbsp;<a href="javascript:abreREAntigo('<%= nr_processo%>');"><img src="/imagens/30/libera_imp_on.gif" border="0" alt="Clique para visualizar os dados da LI."><br>
											<%= tx_lang_A00067(cd_lang)%></a></td>
									</tr>
									<%
	End If
End If	
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe fatura comercial no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			"  AND CD_TIPO_DCTO_INSTR = '01'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFatComercial('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/30/nota_fiscal_on.gif" border="0" alt="Clique para visualizar os dados da Fatura Comercial."><br>
										<%= tx_lang_A00064(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se foi emitida a nota fiscal
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_EXP_NF ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreNotaFiscal('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/30/fatura_com_on.gif" border="0" alt="Clique para visualizar os dados da Nota Fiscal."><br>
										<%= tx_lang_A00065(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If Session("cd_cargo") <> "088" Then

If objrs.State = adStateOpen Then objrs.Close
'verifica se o processo já foi faturado
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TFATURAMENTO_CC ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND IN_CANCELADO = 0"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal, colocar NOT
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFaturamento('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/30/fatura_on.gif" border="0" alt="Clique para visualizar os dados do Faturamento."><br>
										<%= tx_lang_A00066(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

End If
%>
							</table></td>	</tr>
</table>
</td>
</tr>
</table>
</body>
</html>