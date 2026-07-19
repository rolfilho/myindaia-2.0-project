<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: KPI por Serviço importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 03/08/2005
'Modificado: 09/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim numx, numy, numz
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

cd_tela = "EXC010"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_lead_"& Session("cd_usuario") &"_"&_
		  Year(Date) & Month(Date) & Day(Date) &"_"&_
		  Hour(Time) & Minute(Time) & Second(Time) &".xls"

Function fnc_GeraExcel(caminho, arquivo)
  Dim objfso	'objeto do sistema de arquivos 
  Dim objtxt	'objeto para a criação de arquivos
  
  'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
  Set objtxt = objfso.CreateTextFile(caminho & arquivo, True, False)
  'inicia a gravação do arquivo xls para download
%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
  'exibe titulo das colunas
	objrsv.MoveFirst
	objtxt.WriteLine("  <tr>")
	
  Do While Not objrsv.Eof
		objtxt.WriteLine("    <td class='gridtit'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
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
	'Exibe os resultados do relatório e aplica a personalização
  Do While Not objrs.Eof
    'alterna a cor das linhas
		If bgcolor = "#FFFFFF" Then bgcolor = "#CCCCCC" Else bgcolor = "#FFFFFF"
		'verifica se vai ter uma nova quebra de grupo de serviço
		If cd_campo_quebra <> objrs.Fields.Item("CD_GRUPO").Value Then
			If objrs.AbsolutePosition > 1 Then
				objtxt.WriteLine("  <tr>")
				objtxt.WriteLine("    <td class='gridsub' align='right'><i>Sub-Total&nbsp;</i></td>")
				objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_grupo, 2),2), 1, 2) &"'><i></i></td>")
				objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_abaixo, 2),2), 1, 2) &"'><i></i></td>")
				objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
				objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_acima, 2),2), 1, 2) &"'><i></i></td>")
				objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
				objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(soma_grupo / nr_grupo, 2),2), 1, 2) &"'><i></i></td>")
				objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
				objtxt.WriteLine("  </tr>")
				'zera os Totais por Grupo
				qtd_abaixo   = 0
				qtd_acima    = 0
				qtd_grupo    = 0
				soma_grupo   = 0
				nr_grupo     = 0
			End If
			objtxt.WriteLine("  <tr>")
			objtxt.WriteLine("    <td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_ConsultaLookup("TGRUPO_SERVICO","CD_GRUPO",objrs.Fields.Item("CD_GRUPO").Value,"NM_GRUPO") &"</td>")
			objtxt.WriteLine("  </tr>")
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
		objtxt.WriteLine("  <tr height='15'>")
		
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
							If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
							objtxt.WriteLine("    <td align='left' valign='top' bgcolor='"& bgcolor &"'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							y = fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 5)
							numy = "" 'valor exibido no excel
							
							If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
							If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
							
							objtxt.WriteLine("    <td class='data' style='text-align:right; background-color:"& bgcolor &";' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 1 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal1' x:num='"& fnc_ConvertToExcel(x, 1, 1) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 1 ) Else x = 0
						
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal1' x:num='"& fnc_ConvertToExcel(x, 1, 1) &"'></td>")
						Case "4" 'exibe os campos com valor inteiro
							z = objrs.Fields.Item(nm_campo_rel).Value
							If Not fnc_TestaVar(z) Then z = "" 
							objtxt.WriteLine("    <td class='inteiro' style='color:"& color &"; text-align:right; vertical-align:middle; background-color:"& bgcolor &";' "& numz &">"& z &"</td>")
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		objtxt.WriteLine("  </tr>")
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop

	'sub-total do ultimo grupo exibido
	objtxt.WriteLine("  <tr>")
	objtxt.WriteLine("    <td class='gridsub' align='right'><i>Sub-Total&nbsp;</i></td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_grupo, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_abaixo, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_acima, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(soma_grupo / nr_grupo, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("  </tr>")
	'total de todos os serviços
	objtxt.WriteLine("  <tr>")
	objtxt.WriteLine("    <td class='gridsub' align='right'><i>Total&nbsp;</i></td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_geral, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_ab_geral, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(qtd_ac_geral, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("    <td class='gridsub' x:num='"& fnc_ConvertToExcel(FormatNumber(Round(soma_geral / nr_geral, 2),2), 1, 2) &"'><i></i></td>")
	objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
	objtxt.WriteLine("  </tr>")

	'escreve linha com a quantidade de registros
	objtxt.WriteLine("  <tr>")
	objtxt.WriteLine("    <td class='gridsub' style='width:200px;'>"& objrs.RecordCount &" registros encontrados</td>")
  for i = 1 to nr_cols -1
    objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
  next
	objtxt.WriteLine("  </tr>")
	
	objtxt.WriteLine("</table></body></html>")
	objtxt.Close()
	Set objtxt = Nothing
	Set objfso = Nothing
	'retorna o nome do arquivo para o download
	fnc_GeraExcel = arquivo
End Function
	
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
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
'qtde de uni&atilde;o de coluns
col = objrsv.RecordCount

Call fnc_GeraExcel(caminho, arquivo)
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%= nm_menu &" - "& nm_subm%></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
</head>

<body>

<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" class="titpopup">Redirecionando Download</td>
  </tr>
  <tr>
    <td><p align="center">Planilha Excel<br>
	<b><%= Right(arquivo, Len(arquivo) - 1)%></b></p>
    <p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/excel/arquivo<%= arquivo%>" target="_blank"><b>clique aqui</b></a>.</p></td>
  </tr>
  <tr>
    <td height="35" align="center"><input type="button" class="button" value="X Fechar" onClick="javascript:window.close();"></td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
window.open('http://www.myindaiaweb.com.br/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->