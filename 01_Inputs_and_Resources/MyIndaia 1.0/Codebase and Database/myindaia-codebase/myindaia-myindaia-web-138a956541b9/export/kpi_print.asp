<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação: Metrics por Embarque
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 06/07/2006
'
'Manutenção: 02/03/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "EXP008"
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
  .CommandText    = Session("sql_exp_kpi")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_kpi") &"<br>"
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
	<tr height="15" class="pgridsub">
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
	<tr height="14">
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'Response.Write(nm_campo_rel)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
				str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid( str, 5, Len(str) )%>&nbsp;</nobr></td>
		<%
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
			Case "0017" 'canal de liberacao
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 4
%>
		<td align="center" class="pgridsub">&nbsp;<img src="/imagens/icones/16x16/tp_canal_<%= Trim(str)%>.gif" width="17" height="16">&nbsp;</td>
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
				End If
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT CD_MERCADORIA, ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
							"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				If objrsx.RecordCount > 0 Then
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
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then 
						str = str & Trim( objrsx.Fields.Item("TX_MERCADORIA").Value )
					Else
						str = "Descrição não Disponível."
					End If
				End If
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= Left(str, 40)%>&nbsp;</nobr></td>
		<%
				objrsx.Close
			Case "0103" 'sim/não campo in_urgente
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 0
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= sim_nao(str)%>&nbsp;</nobr></td>
		<%
			Case "0118","0123" 'Nr. Nota Fiscal / Nr. RE
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0118" Then
					sql = "SELECT NR_NF AS NUMERO "&_
								"FROM TPROCESSO_EXP_NF ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
								"ORDER BY NR_NF"
				End If
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0123" Then
					sql = "SELECT NR_RE AS NUMERO "&_
								"FROM TPROCESSO_EXP_RE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
								"ORDER BY NR_RE"
				End If
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
		<td class="pgridsub"><nobr>&nbsp;<%= Left(w, 6)%>&nbsp;</nobr></td>
		<%
			Case "0154" 'Indicados do saque Borderô
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
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
						y = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(y) Then y = Null 
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara( y, 5 )%>&nbsp;</nobr></td>
		<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr><%= x%></nobr></td>
		<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr><%= x%></nobr></td>
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
		<td align="right" class="pgridsub"><nobr><%= z%>&nbsp;</nobr></td>
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
		<td colspan="<%= nr_cols%>" align="left" class="pgridbottom"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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