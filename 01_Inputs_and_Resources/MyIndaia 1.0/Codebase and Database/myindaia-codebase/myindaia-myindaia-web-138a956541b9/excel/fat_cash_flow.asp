<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel dos resultados do Cash Flow
'
'Autor: Alexandre Gonçalves Neto
'Criado: 12/07/2006
'Modificado: 
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
Dim vl_proc_prev 'total dos valores previstos do processo
Dim vl_proc_pago 'total dos valores pagos do processo

cd_tela = "EXC010"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_cols = CInt(Request.QueryString("nr_cols"))
nr_cols_data = Request.QueryString("nr_cols_data")
nr_cols_item = Request.QueryString("nr_cols_item")
ap_filtros   = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_cash_flow_"& Session("cd_usuario") &"_"&_
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
	objtxt.WriteLine("  <tr height='30'>")
	Do While Not objrsv.Eof
		row = ""
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
			If in_dt_prev Then row = " colspan='3'"
			objtxt.WriteLine("    <td class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		Else
			If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
				objtxt.WriteLine("    <td class='gridtit' width='180' colspan='2'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
			Else
				objtxt.WriteLine("    <td class='gridtit' rowspan='2'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
			End If
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
	objrsv.MoveFirst
	objtxt.WriteLine("  <tr>")
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
			If in_dt_prev Then
				objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00033(cd_lang) &"</td>")
				objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00034(cd_lang) &"</td>")
				objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00035(cd_lang) &"</td>")
			End If
		Else
			If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "30" and fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
				objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00033(cd_lang) &"</td>")
				objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00088(cd_lang) &"</td>")
			End If
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
  Do While Not objrs.Eof
    If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
    'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("  <tr>")
				objtxt.WriteLine("    <td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td>")
				objtxt.WriteLine("  </tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
		objtxt.WriteLine("  <tr height='15'>")
		
		If objrsv.Eof Then objrsv.MoveFirst
		vl_proc_prev = 0
		vl_proc_pago = 0
		'dados do prcesso
		nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
		nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& Mid(nr_processo, 5, Len(nr_processo)) &"</td>")
				Case "0018" 'nr. da referencia
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& nr_referencia &"</td>")
				Case "0019" 'nr. item da referencia
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& nr_item_clnte &"</td>")
				Case "0094","0096","0097","0098","0099","0100","0101","0374" 'Nr. do Pedido/Referencia
					'verifica o tipo de relatório
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, ISNULL( NR_ITEM_PO, 0) AS NR_ITEM_PO "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& objrs.Fields.Item("NR_PROCESSO").Value &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
					'escreve no excel
					objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
					'fecha a consulta
					objrsx.Close()
				Case "0066" 'tipo de pedido
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_frete(CInt(str)) Else str = "n/a"
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"'>"& str &"</td>")
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(M.NM_MERCADORIA, DM.TX_DESC_DET_MERC) AS TX_MERCADORIA "&_
								"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
								"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "&_
								"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
								"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA "&_
									"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
									"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
									"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
									"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
						If objrsx.RecordCount < 1 Then
							objrsx.Close
							sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA "&_
										"FROM TPROCESSO ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = '"& nr_processo &"' "
							Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						End If
					End If
					
					str = ""
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
					If Len(str) = 0 Then str = "Descrição não Disponível."
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close
				Case "0408" 'Total do Processo
					If fnc_TestaVar(vl_proc_prev) Then vl_proc_prev = FormatNumber(vl_proc_prev, 2) Else vl_proc_prev = 0
					If fnc_TestaVar(vl_proc_pago) Then vl_proc_pago = FormatNumber(vl_proc_pago, 2) Else vl_proc_pago = 0
					'converte para o excel 
					numx = " x:num='"& fnc_ConvertToExcel(vl_proc_prev, 1, 2) &"'"
					numy = " x:num='"& fnc_ConvertToExcel(vl_proc_pago, 1, 2) &"'"
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;'"& numx &"></td>")
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;'"& numy &"></td>")
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
						Case "1" 'exibe os campos de datas
							'cor da data e dias de atraso/antecedencia
							color = "#OOOOOO"
							'dados da planilha excel
							numx 	= Null
							numy 	= Null
							numz 	= Null
							'seleciona os dados da tabela para calculos
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
							x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
							y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
							'verifica se o evento é aplicavel
							If fnc_TestaVar(w) and (w = 1) Then
								'verifica se as datas são validas, se não igual a zero
								If IsDate(x) Then dt_ini = x Else x = 0
								If IsDate(y) Then dt_fim = y Else y = 0
								'calcula diferenca de dias
								z = fnc_DiasUteisKPI(dt_ini, dt_fim, 0)
								'se as datas forem diferentes de zero, converte para o excel
								If x <> 0 Then numx = "x:num='"& fnc_ConvertToExcel(x, 3, 0) &"'" Else x = ""
								If y <> 0 Then numy = "x:num='"& fnc_ConvertToExcel(y, 3, 0) &"'" Else y = ""
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then color = "#0000FF" 'azul
								If z > 0 Then color = "#FF0000" 'vermelho
								If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							Else
								x = ""
								y = "Não Aplicável"
								z = ""
								color = "#999999"
							End If
							'verifica se serão exibidas datas previstas
							If in_dt_prev Then
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='vertical-align:middle;' "& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='inteiro' style='color:"& color &";vertical-align:middle;' "& numz &">"& z &"</td>")
							End If							
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='color:"& color &";vertical-align:middle;' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal4' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								'dados da planilha excel
								numx 	= Null
								numy 	= Null
								'seleciona os dados da tabela para calculos
								x = objrs.Fields.Item(nm_campo_rel &"_PREV").Value
								y = objrs.Fields.Item(nm_campo_rel &"_PAGO").Value
								If fnc_TestaVar(x) Then x = FormatNumber(x, 2) Else x = 0
								If fnc_TestaVar(y) Then y = FormatNumber(y, 2) Else y = 0
								'soma ao total do processo
								vl_proc_prev = vl_proc_prev + x
								vl_proc_pago = vl_proc_pago + y
								'converte para o excel 
								If x <> 0 Then numx = " x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'" Else x = ""
								If y <> 0 Then numy = " x:num='"& fnc_ConvertToExcel(y, 1, 2) &"'" Else y = ""
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;'"& numx &"></td>")
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;'"& numy &"></td>")
							Else
								x = objrs.Fields.Item(nm_campo_rel).Value
								If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'></td>")
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
							numz  = "" 'valor exibido no excel
							If IsNull(z) Then z = "-" Else z = fnc_ConvertToExcel(z, 0, 0)
							If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							objtxt.WriteLine("    <td class='inteiro' style='text-align:right; vertical-align:middle; background-color:"& bgcolor &";' "& numz &">"& z &"</td>")
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		objtxt.WriteLine("  </tr>")
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	'escreve linha com a quantidade de registros
	objtxt.WriteLine("  <tr>")
	objtxt.WriteLine("    <td height='15' colspan='"& nr_cols &"' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
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
  .CommandText    = Session("sql_fat_cash_flow")
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