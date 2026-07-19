<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação: Alerta
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 30/06/2006
'
'Manutenção: 07/06/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim tx_status  'status dos processos

in_show = False
cd_tela = "IMP012"
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
  .CommandText    = Session("sql_imp_alerta")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_alerta") &"<br>"
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
	<tr class="pgridtit">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
%>
		<td rowspan="2"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
		<td colspan="3" height="15"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_BROKER",cd_evento,tx_lang_dado)%></td>
	</tr>
	<tr height="15" class="pgridsub">
		<td><%= tx_lang_A00033(cd_lang)%></td>
    <td><%= tx_lang_A00034(cd_lang)%></td>
    <td><%= tx_lang_A00035(cd_lang)%></td>
	</tr>
	<%
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If cd_campo_quebra <> objrs.Fields.Item("CD_STATUS").Value Then
	  If objrs.Fields.Item("CD_STATUS").Value = "A" Then tx_status = " "& tx_lang_A00036(cd_lang)
		If objrs.Fields.Item("CD_STATUS").Value = "B" Then tx_status = " "& tx_lang_A00037(cd_lang)
		If objrs.Fields.Item("CD_STATUS").Value = "C" Then tx_status = " "& tx_lang_A00038(cd_lang)
		If objrs.Fields.Item("CD_STATUS").Value = "D" Then tx_status = " "& tx_lang_A00039(cd_lang)
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= objrs.Fields.Item("VL_TOTAL").Value & tx_status%></td>
	</tr>
	<%
	End If
	cd_campo_quebra = objrs.Fields.Item("CD_STATUS").Value
%>
	<tr>
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
				str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="center" class="pgridsub"><nobr><%= Mid( str, 5, Len(str) )%></nobr></td>
		<%
			Case "0017" 'canal de liberação
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
		<td align="center" class="pgridsub"><img src="/imagens/icones/16x16/tp_canal_<%= Trim(x)%>.gif" width="17" height="16"></td>
		<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr.Referencia - Item
				nr_processo   = Trim( objrs.Fields.Item("NR_PROCESSO").Value )
				nr_referencia = Null
				str           = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
								"ORDER BY CD_REFERENCIA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
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
		<td align="left" class="pgridsub"><nobr><%= nr_referencia%></nobr></td>
		<%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0019" 'Nr.Referencia - Item
				nr_processo   = Trim( objrs.Fields.Item("NR_PROCESSO").Value )
				nr_referencia = Null
				nr_item_clnte = Null
				str           = Null
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item("NR_REFERENCIA").Value
					nr_item_clnte = objrs.Fields.Item("NR_ITEM_CLIENTE").Value
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"'"&_
								"  AND TP_REFERENCIA = '01' "&_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = "referencias / itens"& vbcrlf
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						nr_item_clnte = Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value ) &"/"& Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					End If
				End If
%>
		<td align="left" class="pgridsub"><nobr><%= nr_item_clnte%></nobr></td>
		<%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="left" class="pgridsub"><nobr><%= str%></nobr></td>
		<%
					Case "1" 'exibe os campos de datas
%>
		<td align="center" class="pgridsub"><nobr><%= fnc_Mascara( objrs.Fields.Item(nm_campo_rel).Value, 5 )%></nobr></td>
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
	
	nr_dias = objrs.Fields.Item("NR_DIAS").Value
	color   = "#000000" 'azul
	If nr_dias < 0 Then 
		color = "#0000FF" 'azul
	ElseIf nr_dias > 0 Then
		nr_dias = "+"& nr_dias
		color = "#FF0000" 'vermelho
	End If
	If InStr("C;D;", objrs.Fields.Item("CD_STATUS").Value) > 0 Then dt_hoje = Date() Else dt_hoje = ""
%>
		<td align="right" class="pgridsub"><nobr><%= fnc_Mascara(objrs.Fields.Item("DT_PREVISTA").Value, 5)%>&nbsp;</nobr></td>
		<td align="right" class="pgridsub"><nobr><font color="<%= color%>"><%= nr_dias%></font>&nbsp;</nobr></td>
		<td align="right" class="pgridsub"><nobr><font color="<%= color%>"><%= fnc_Mascara(dt_hoje, 5)%></font>&nbsp;</nobr></td>
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
