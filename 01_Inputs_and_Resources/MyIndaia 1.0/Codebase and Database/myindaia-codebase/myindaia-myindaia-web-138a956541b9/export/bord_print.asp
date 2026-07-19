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
Server.ScriptTimeout = 1000

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "EXP016"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
With objcmd
	.CommandTimeOut = 120
	.CommandText    = Session("sql_exp_bordero")
	.CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") & Session("sql_exp_bordero") &"<br><br>"
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="overflow: auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
	<tr>
		<td class="pgridtit">Situa&ccedil;&atilde;o/Status</td>
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
		<td class="pgridtit" <% If in_dt_prev Then Response.Write("colspan='3'")%> height="15"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	Else
%>
		<td class="pgridtit" <% If in_dt_prev Then Response.Write("rowspan='2'")%>><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
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
	<tr height="15">
		<%
	For x = 1 to nr_data
%>
		<td class="pgridsub"><%= tx_lang_A00033(cd_lang)%></td>
		<td class="pgridsub"><%= tx_lang_A00034(cd_lang)%></td>
		<td class="pgridsub"><%= tx_lang_A00035(cd_lang)%></td>
		<%
	Next
%>
	</tr>
	<%
End If

cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relat&oacute;rio e aplica a personaliza&ccedil;&atilde;o
Do While Not objrs.Eof
	'verifica se o relat&oacute;rio vai ser quebrado por grupo, cliente, area ou modalidade
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
	'Situa&ccedil;&atilde;o/Status do Border&ocirc;
	x = objrs.Fields.Item("TP_SITUACAO").Value
	y = objrs.Fields.Item("TP_STATUS").Value
	
	If x = "0" or Not fnc_TestaVar(x) Then
		str = "&Agrave; enviar"
	Else
		str = "Docs."
		If fnc_TestaVar(y) Then str = str &" / "& status_bordero(y)
	End If
%>
	<tr height="15">
		<td class="pgridsub"><nobr><%= str%></nobr></td>
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do prcesso
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'Exibe os detalhes do Bordero
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personaliza&ccedil;&atilde;o do usu&aacute;rio
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
		<td class="pgridsub" align="center"><nobr><%= Mid(nr_processo, 5, 18)%></nobr></td>
		<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0468" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					str = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
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
					Else
						nr_referencia = Null
						str = Null
					End If
					objrsx.Close()
				End If
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
							"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'se não tiver pega a descrição na manutenção
				If objrsx.RecordCount < 1 Then
					objrsx.Close()
					sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then 
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
				Else
					str = "Descrição não Disponível."
				End If
				
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= Left(str, 40)%>&nbsp;</nobr></td>
		<%
				objrsx.Close
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
						<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
						y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
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
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 4 )
%>
						<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
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
	<tr class="pgridbottom">
		<td height="15" colspan="<%= nr_cols%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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
