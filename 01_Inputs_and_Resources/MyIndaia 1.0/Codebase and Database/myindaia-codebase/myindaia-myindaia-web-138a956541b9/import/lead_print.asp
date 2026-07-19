<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação / KPI por Serviço
'Arquivo de Script e HTML: Impressão da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 05/01/2006
'
'Manutenção: 09/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
'Totais Grupo
Dim qtd_abaixo
Dim qtd_acima
Dim qtd_grupo
Dim soma_grupo
Dim nr_grupo
'Totais Geral
Dim qtd_ab_geral
Dim qtd_ac_geral
Dim qtd_geral
Dim soma_geral
Dim nr_geral

in_show = False
cd_tela = "IMP023"
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
	.CommandText    = Session("sql_imp_lead")
	.CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_lead") &"<br>"
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
	<tr height="25">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
%>
		<td class="pgridtit"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
	</tr>
	<%
'Totais Grupo
qtd_abaixo   = 0
qtd_acima    = 0
qtd_grupo    = 0
soma_grupo   = 0
nr_grupo     = 0
'Totais Geral
qtd_ab_geral = 0
qtd_ac_geral = 0
qtd_geral    = 0
soma_geral   = 0
nr_geral     = 0

cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'verifica se vai ter uma nova quebra de grupo de serviço
	If cd_campo_quebra <> objrs.Fields.Item("CD_GRUPO").Value Then
		If objrs.AbsolutePosition > 1 Then
%>
	<tr>
		<td class="pgridtotal"><i>Sub-Total</i></td>
		<td class="pgridtotal"><i><%= Round(qtd_grupo, 2)%></i></td>
		<td class="pgridtotal"><i><%= Round(qtd_abaixo, 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><i><%= Round(qtd_acima, 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><i><%= Round((soma_grupo / nr_grupo), 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
	</tr>
	<%
			'zera os Totais por Grupo
			qtd_abaixo   = 0
			qtd_acima    = 0
			qtd_grupo    = 0
			soma_grupo   = 0
			nr_grupo     = 0
		End If
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_ConsultaLookup("TGRUPO_SERVICO","CD_GRUPO",objrs.Fields.Item("CD_GRUPO").Value,"NM_GRUPO")%></td>
	</tr>
	<%
	End If
	cd_campo_quebra = objrs.Fields.Item("CD_GRUPO").Value
	'Totais Grupo
  qtd_abaixo   = qtd_abaixo   + objrs.Fields.Item("VL_META_ABAIXO").Value
  qtd_acima    = qtd_acima    + objrs.Fields.Item("VL_META_ACIMA").Value
  qtd_grupo    = qtd_grupo    + objrs.Fields.Item("VL_TOTAL_PROC").Value
  soma_grupo   = soma_grupo   + objrs.Fields.Item("VL_MEDIA_GRUPO").Value
  nr_grupo     = nr_grupo     + 1
  'Totais Geral
  qtd_ab_geral = qtd_ab_geral + objrs.Fields.Item("VL_META_ABAIXO").Value
  qtd_ac_geral = qtd_ac_geral + objrs.Fields.Item("VL_META_ACIMA").Value
  qtd_geral    = qtd_geral    + objrs.Fields.Item("VL_TOTAL_PROC").Value
  soma_geral   = soma_geral   + objrs.Fields.Item("VL_MEDIA_GRUPO").Value
  nr_geral     = nr_geral     + 1
%>
	<tr height="15">
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica personalização
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td class="pgridsub" align="left"><nobr><%= str%></nobr></td>
		<%
					Case "1" 'exibe os campos de datas
%>
		<td class="pgridsub" align="center"><nobr><%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 5)%></nobr></td>
		<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 1 )
%>
		<td class="pgridsub" align="right"><nobr><%= x%></nobr></td>
		<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 1 )
%>
		<td class="pgridsub" align="right"><nobr><%= x%></nobr></td>
		<%
					Case "4" 'exibe os campos com valor inteiro
						z = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(z) Then z = "" 
%>
		<td class="pgridsub" align="right"><nobr><%= z%>&nbsp;</nobr></td>
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
		<td class="pgridtotal"><i>Sub-Total</i></td>
		<td class="pgridtotal"><i><%= Round(qtd_grupo, 2)%></i></td>
		<td class="pgridtotal"><i><%= Round(qtd_abaixo, 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><i><%= Round(qtd_acima, 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><i><%= Round((soma_grupo / nr_grupo), 2)%></i></td>
		<td class="pgridtotal">&nbsp;</td>
	</tr>
	<tr>
		<td class="pgridtotal"><b>Total</b></td>
		<td class="pgridtotal"><b><%= Round(qtd_geral, 2)%></b></td>
		<td class="pgridtotal"><b><%= Round(qtd_ab_geral, 2)%></b></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><b><%= Round(qtd_ac_geral, 2)%></b></td>
		<td class="pgridtotal">&nbsp;</td>
		<td class="pgridtotal"><b><%= Round((soma_geral / nr_geral), 2)%></b></td>
		<td class="pgridtotal">&nbsp;</td>
	</tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
