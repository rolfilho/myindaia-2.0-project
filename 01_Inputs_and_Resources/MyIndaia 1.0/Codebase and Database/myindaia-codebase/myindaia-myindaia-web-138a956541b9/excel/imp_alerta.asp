<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Alerta Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 07/06/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim tx_status  'status dos processos

cd_tela = "EXC003"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_alerta_"& Session("cd_usuario") &"_"&_
					Year(Date) & Month(Date) & Day(Date) &"_"&_
					Hour(Time) & Minute(Time) & Second(Time) &".xls"

Function fnc_GeraExcel(caminho, arquivo)
  Dim objfso 'objeto do sistema de arquivos 
  Dim objtxt 'objeto para a criação de arquivos
  
  'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
  Set objtxt = objfso.CreateTextFile(caminho & arquivo,True, False)
  'inicia a gravação do arquivo xls para download
%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
	'exibe titulo das colunas
	objrsv.MoveFirst
	objtxt.WriteLine("  <tr>")
	Do While Not objrsv.Eof
		objtxt.WriteLine("    <td rowspan='2' class='gridtit'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("    <td colspan='3' height='15' class='gridtit'>"& fnc_ConsultaLookup("TEVENTO","CD_EVENTO",cd_evento,"NM_EVENTO") &"</td>")
					
	objtxt.WriteLine("  </tr>")
	objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td class='gridsub'>Prevista</td>")
  objtxt.WriteLine("    <td class='gridsub'>Dias</td>")
  objtxt.WriteLine("    <td class='gridsub'>Realizada</td>")
  objtxt.WriteLine("  </tr>")
	
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If cd_campo_quebra <> objrs.Fields.Item("CD_STATUS").Value Then
			If objrs.Fields.Item("CD_STATUS").Value = "A" Then tx_status = " processos atrasados"
			If objrs.Fields.Item("CD_STATUS").Value = "B" Then tx_status = " processos a serem realizados hoje"
			If objrs.Fields.Item("CD_STATUS").Value = "C" Then tx_status = " processos realizados com atraso"
			If objrs.Fields.Item("CD_STATUS").Value = "D" Then tx_status = " processos realizados no prazo"
			objtxt.WriteLine("  <tr>")
			objtxt.WriteLine("    <td height='20' colspan='"& nr_cols &"' class='gridtop'>"& objrs.Fields.Item("VL_TOTAL").Value & tx_status &"</td>")
			objtxt.WriteLine("  </tr>")
		End If
		cd_campo_quebra = objrs.Fields.Item("CD_STATUS").Value
		
		objtxt.WriteLine("  <tr height='15'>")
		
		If objrsv.Eof Then objrsv.MoveFirst
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					objtxt.WriteLine("    <td align='center' valign='top' bgcolor='"& bgcolor &"'><nobr>"& Mid( str, 5, Len(str) ) &"</nobr></td>")
				Case "0017" 'canal de liberacao
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = 4
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& tipo_canal(str) &"</td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr. do Pedido/Referencia
					nr_processo   = objrs.Fields.Item("NR_PROCESSO").Value
					nr_referencia = Null
					tp_ref_cli    = Null
					If in_embarque = 0 and objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						Select Case objrsv.Fields.Item("M10_CD_DADO").Value
							Case "0018" tp_ref_cli = "01"
							Case "0094" tp_ref_cli = "02"
							Case "0096" tp_ref_cli = "03"
							Case "0097" tp_ref_cli = "04"
							Case "0098" tp_ref_cli = "05"
							Case "0099" tp_ref_cli = "06"
							Case "0100" tp_ref_cli = "07"
							Case "0101" tp_ref_cli = "08"
							Case "0374" tp_ref_cli = "09"
						End Select
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& tp_ref_cli  &"' "&_
									"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & " <br>"
							Loop
						End If
					End If
					If Not fnc_TestaVar(nr_referencia) Then nr_referencia = ""
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0019" 'Item da referencia pedido
					nr_processo   = objrs.Fields.Item("NR_PROCESSO").Value
					nr_item_clnte = Null
					tp_ref_cli    = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_item_clnte = objrs.Fields.Item(nm_campo_rel).Value
					Else
						Select Case objrsv.Fields.Item("M10_CD_DADO").Value
							Case "0018" tp_ref_cli = "01"
							Case "0094" tp_ref_cli = "02"
							Case "0096" tp_ref_cli = "03"
							Case "0097" tp_ref_cli = "04"
							Case "0098" tp_ref_cli = "05"
							Case "0099" tp_ref_cli = "06"
							Case "0100" tp_ref_cli = "07"
							Case "0101" tp_ref_cli = "08"
							Case "0374" tp_ref_cli = "09"
						End Select
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& tp_ref_cli  &"' "&_
									"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_item_clnte = nr_item_clnte & Trim(objrsx.Fields.Item("NR_ITEM_PO").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_item_clnte = nr_item_clnte & " <br>"
							Loop
						End If
					End If
					If Not fnc_TestaVar(nr_item_clnte) Then nr_item_clnte = ""
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_item_clnte &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td align='left' valign='top' bgcolor='"& bgcolor &"'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							y = fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 5)
							numy = "" 'valor exibido no excel
							
							If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
							If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
							
							objtxt.WriteLine("    <td class='data' style='text-align:right; background-color:"& bgcolor &";' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
						
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal4' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "4" 'exibe os campos com valor inteiro
							z = objrs.Fields.Item(nm_campo_rel).Value
							numz  = "" 'valor exibido no excel
							
							If IsNull(z) Then
								z = "-" 'diferença de dias
							Else
								z = fnc_ConvertToExcel(z, 0, 0)
							End If
							If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							
							objtxt.WriteLine("    <td class='inteiro' style='color:"& color &"; text-align:right; vertical-align:middle; background-color:"& bgcolor &";' "& numz &">"& z &"</td>")
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		'data prevista
		x = fnc_Mascara(objrs.Fields.Item("DT_PREVISTA").Value, 5)
		numx = "" 'valor exibido no excel
		If Not IsDate(x) Then x = 0 Else x = fnc_ConvertToExcel(x, 3, 0)
		If x > 0 Then numx = "x:num='"& x &"'" Else x = ""
		'diferença de dias
		y = objrs.Fields.Item("NR_DIAS").Value
		numy = "" 'valor exibido no excel
		If IsNull(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 0, 0)
		If y > 0 Then numy = "x:num='"& y &"'" Else y = 0
		'data de realização
		z = fnc_Mascara(dt_hoje, 5)
		numz = "" 'valor exibido no excel
		If Not IsDate(z) Then z = "-" Else z = fnc_ConvertToExcel(z, 3, 0)
		If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
		'cor da data
		color = "#000000" 'preto
		If y < 0 Then color = "#0000FF" 'azul
		If y > 0 Then color = "#FF0000" 'vermelho
		
		If InStr("C;D;", objrs.Fields.Item("CD_STATUS").Value) > 0 Then dt_hoje = Date() Else dt_hoje = ""
		objtxt.WriteLine("    <td class='data' style='text-align:right; background-color:"& bgcolor &";' "& numx &">"& x &"</td>")
		objtxt.WriteLine("    <td class='inteiro' style='color:"& color &"; text-align:right; vertical-align:middle; background-color:"& bgcolor &";' "& numy &">"& y &"</td>")
		objtxt.WriteLine("    <td class='data' style='text-align:right; background-color:"& bgcolor &";' "& numz &">"& z &"</td>")
		objtxt.WriteLine("  </tr>")
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	'escreve linha com a quantidade de registros
	objtxt.WriteLine("  <tr>")
  objtxt.WriteLine("    <td height='15' colspan='"& nr_cols &"' align='left' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
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
  .CommandText    = Session("sql_imp_alerta")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'retorna para o primeiro registro do resultado
If objrs.RecordCount  > 0 Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.RecordCount > 0 Then objrsv.MoveFirst

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
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/excel/arquivo<%= arquivo%>" target="_blank"><b>clique
				aqui</b></a>.</p></td>
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