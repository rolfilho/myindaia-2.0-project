<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Licensa de Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor: Alexandre Gonçalves Neto
'Criado: 29/10/2005
'
'Manutenção: 05/09/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "IMP020"
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
  .CommandText    = Session("sql_liantes")
  .CommandType    = adCmdText
End With
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
	<tr class="pgridtit">
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
col = objrsv.RecordCount 'qtde de uni&atilde;o de coluns
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
	<tr>
		<td height="20" colspan="<%= col%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
	</tr>
	<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
	<tr height="14">
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do prcesso
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'Aplica personalização nos campos
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid(nr_processo, 5, Len(nr_processo))%>&nbsp;</nobr></td>
		<%
	    Case "0018","0094","0096","0097","0098","0099","0100","0101" 'Nr.Referencia - Item
				nr_referencia = Null
				str = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA"
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
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT NR_ITEM, CD_MERCADORIA, ISNULL( TX_DESC_DET_MERC, '' ) AS TX_MERCADORIA "&_
							"FROM TLICENCA_ITENS ( NOLOCK ) "&_
							"WHERE SUBSTRING( NR_PROCESSO, 1, 14 ) = '"& nr_processo &"' "&_
							"ORDER BY NR_ITEM"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
					If Len(x) > 40 Then x = Left(x, 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("NR_ITEM").Value ) &" - "
						str = str &"("& Trim( objrsx.Fields.Item("CD_MERCADORIA").Value ) &")"
						str = str & Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then
						str = str & Trim( objrsx.Fields.Item("TX_MERCADORIA").Value )
					Else
						str = "Descrição não Disponível."
					End If
					If Len(str) > 40 Then x = Left(str, 40) &"..." Else x = str
				End If
%>
		<td align="left" class="pgridsub"><nobr><%= x%></nobr></td>
		<%
				objrsx.Close
			Case "0075","0226","0227" 'Registro, Deferimento e Vencimento da LI
			  str = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = ""
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara(str, 5)%>&nbsp;</nobr></td>
		<%
			Case "0225","0229" 'nr da LI, nr LI substituida
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = fnc_Mascara(str, 1) Else str = ""
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(str) Then str = ""
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						'verifica se o evento é aplicavel.
						If (Not fnc_TestaVar(w)) or (w = 0) Then
							color = "#999999"
							x = "-"
							y = "Não Aplicável"
							z = "-"
						Else
							x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
							y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
							z = Null
							If IsDate(x) and IsDate(y) Then
								z = fnc_DiasUteisKPI(x, y, 0)
							ElseIf IsDate(y) Then
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
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
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
	<tr height="15">
		<td colspan="<%= col%>" align="left" class="pgridbottom"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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