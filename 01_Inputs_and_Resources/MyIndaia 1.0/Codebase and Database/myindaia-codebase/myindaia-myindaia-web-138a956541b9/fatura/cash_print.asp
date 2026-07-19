<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá Web: Financeiro - Cash Flow
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/07/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim vl_proc_prev 'total dos valores previstos do processo
Dim vl_proc_pago 'total dos valores pagos do processo

in_show = False
cd_tela = "FAT008"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
nr_cols = Request.QueryString("nr_cols")
nr_cols_data = Request.QueryString("nr_cols_data")
nr_cols_item = Request.QueryString("nr_cols_item")
ap_filtros   = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_fat_cash_flow")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_fat_cash_flow") &"<br>"
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="overflow: auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
	<tr height="40">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
		<td class="pgridtit"<% If in_dt_prev Then Response.Write(" colspan='3'")%>><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	Else
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
%>
		<td class="pgridtit" colspan="2"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
		Else
%>
		<td class="pgridtit" rowspan="2"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
		End If
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
	</tr>
	<tr>
		<%
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
		If in_dt_prev Then
%>
		<td class="fonte"><%= tx_lang_A00033(cd_lang)%></td>
		<td class="fonte"><%= tx_lang_A00034(cd_lang)%></td>
		<td class="fonte"><%= tx_lang_A00035(cd_lang)%></td>
		<%
		End If
	Else
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
%>
		<td class="fonte"><%= tx_lang_A00033(cd_lang)%></td>
		<td class="fonte"><%= tx_lang_A00088(cd_lang)%></td>
		<%
		End If
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
	</tr>
	<%
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
	</tr>
	<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
	<tr>
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	vl_proc_prev = 0
	vl_proc_pago = 0
	'dados do prcesso
	nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
	nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
	'exibe as informaçõe de acordo com a personalização
	Do While Not objrsv.Eof
		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= Mid(nr_processo, 5, Len(nr_processo))%>&nbsp;</nobr></td>
		<%
			Case "0018" 'Nr. do Processo
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
			Case "0019" 'Nr. do Processo
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
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
		  	str = ""
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						If CInt(objrsx.Fields.Item("NR_ITEM_PO").Value) > 0 Then str = str &"/"& CInt(objrsx.Fields.Item("NR_ITEM_PO").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & "<br>"
					Loop
				End If
%>
		<td align="left" class="pgridsub"><%= str%></td>
		<%
				objrsx.Close()
			Case "0066" 'tipo de pedido
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_frete(CInt(str)) Else str = "n/a"
%>
		<td align="center" class="pgridsub"><nobr><%= str%></nobr></td>
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
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA, "&_
								"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
								"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
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
		<td align="left" class="pgridsub" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
				objrsx.Close
			Case "0408" 'Total do Processo
				If fnc_TestaVar(vl_proc_prev) Then vl_proc_prev = FormatNumber(vl_proc_prev, 2) Else vl_proc_prev = 0
				If fnc_TestaVar(vl_proc_pago) Then vl_proc_pago = FormatNumber(vl_proc_pago, 2) Else vl_proc_pago = 0
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= vl_proc_prev%>&nbsp;</nobr></td>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= vl_proc_pago%>&nbsp;</nobr></td>
		<%
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
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
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</nobr></td>
		<td align="center" class="pgridsub"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
		<%
						End If
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara( y, 5 )%></font>&nbsp;</nobr></td>
		<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
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
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= y%>&nbsp;</nobr></td>
		<%
						Else
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
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
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
		<%
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
	</tr>
	<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
	<tr>
		<td height="15" colspan="<%= nr_cols%>" align="left" class="pgridbottom"><nobr><%= tx_lang_A00030(cd_lang) &" "& objrs.RecordCount &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
	</tr>
	<%
objrsv.Close
objrs.Close
%>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->