<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel dos resultados do KPI Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 16/01/2006
'Modificado: 16/01/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

cd_tela = "EXC010"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_kpi_"& Session("cd_usuario") &"_"&_
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
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value 
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0118","0123","0374"
				w = " width='100'"
			Case Else
				w = ""
		End Select

		If objrsv.Fields.Item("M10_TP_DADO").Value = "1" Then w = " width='100'"
		If objrsv.Fields.Item("M10_TP_DADO").Value = "4" Then w = " width='120'"
		
		objtxt.WriteLine("    <td"& w &" class='gridtit'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		
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
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					objtxt.WriteLine("    <td align='center' valign='top' bgcolor='"& bgcolor &"'><nobr>"& Mid( str, 5, Len(str) ) &"</nobr></td>")
				Case "0015" 'Tipo de contâiner
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
					objtxt.WriteLine("    <td align='center' valign='top' bgcolor='"& bgcolor &"'><nobr>"& str &"</nobr></td>")
				Case "0017" 'canal de liberação
					x = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(x) Then x = 4
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"'>"& Trim(tipo_canal(x)) &"</td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr. do Pedido/Referencia
					str = ""
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
						nr_item_clnte = ""
						str = nr_referencia & nr_item_clnte
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
									"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
									"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
								nr_item_clnte = Trim(objrsx.Fields.Item("NR_ITEM_PO").Value)
								str = str & nr_referencia &"/"& nr_item_clnte
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str & "<br>"
							Loop
						End If
					End If
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0062" 'Fornecedor
				If objrsx.State = 1 Then objrsx.Close()
					'seleciona o fornecedor da referencia exibida. Tem de verificar se o fornecedor é o exportador.
					sql = "SELECT DISTINCT NR_PROC_PO, NR_ITEM_PO, CD_EXPORTADOR, "&_
								" ( SELECT NM_EMPRESA FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = DM.CD_EXPORTADOR ) AS NM_FORNECEDOR "&_
								"FROM TDETALHE_MERCADORIA DM ( NOLOCK ) "&_
								"WHERE DM.NR_PROCESSO = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "&_
								"ORDER BY NR_PROC_PO, NR_ITEM_PO"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					str = ""
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item(nm_campo_rel).Value )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"; "& vbcrlf
					Loop
					objtxt.WriteLine("    <td align='left' valign='top' bgcolor='"& bgcolor &"'>"& str &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0064","0067" 'Valor FOB(Na Moeda/R$)
					'verifica se o frete é prepaid, se for subtrai o valor do frete do FOB
					If objrs.Fields.Item("TP_FRETE").Value = "1" Then
							'frete prepaid
							x = objrs.Fields.Item(nm_campo_rel).Value
							y = objrs.Fields.Item("VL_TOTAL_FRETE_MNEG").Value
							'converte para moeda nacional
							y = y * objrs.Fields.Item("TX_FRETE").Value
							'verifica qual campo será exibido e retorna o valor do frete
						If objrsv.Fields.Item("M10_CD_DADO").Value = "0067" Then
							'subtrai o frete e mantém o valor na moeda nacional
							z = (x - y)
						Else
							'converte para moeda nacional o mle
							x = x * objrs.Fields.Item("TX_MLE").Value
							'subtrai o frete e convete para a moeda negociada
							If objrs.Fields.Item("TX_MLE").Value > 0 Then
								z = (x - y) / objrs.Fields.Item("TX_MLE").Value
							Else
								z = y
							End If
						End If
					Else
						'frete collect
						z = objrs.Fields.Item(nm_campo_rel).Value
					End If
					
					If fnc_TestaVar(z) Then z = FormatNumber( z, 4 ) Else z = 0  
					objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal4' x:num='"& fnc_ConvertToExcel(z, 1, 4) &"'></td>")
				Case "0066" 'Tipo de Frete ( Collect/Prepaid )
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = tipo_frete(x) Else x = "Não especificado"
					objtxt.WriteLine("    <td align='center' valign='top' bgcolor='"& bgcolor &"'>"& x &"</td>")
				Case "0170" 'qtde e tipo de Container
					sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
								"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "&_
								"  AND TP_CNTR <> '01' "&_
								"GROUP BY TP_CNTR"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					matriz = Split(nm_campo_rel, ";", -1)
					
					If objrsx.RecordCount > 0 Then
						str = ""
						Do While Not objrsx.Eof
							str = str &"&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					Else
						str = "&nbsp;"& tx_lang_A00041(cd_lang)
					End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>")
					objrsx.Close()

				Case "0350" 'Carga Solta / LCL
					sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
								"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value )&"' "&_
								"GROUP BY NM_ESPECIE"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					matriz = Split(nm_campo_rel, ";", -1)
					
					If objrsx.RecordCount > 0 Then
						str = ""
						Do While Not objrsx.Eof
							str = str &"&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					Else
						str = "&nbsp;"& tx_lang_A00044(cd_lang)
					End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>")
					objrsx.Close()	
				Case "0555" 'país de origem caso não tenha na capa pega o primeiro item
					str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then
						If objrsx.State = adStateOpen Then objrsx.Close()
							'seleciona a referencia de acordo com o tipo
            sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
					      " WHERE CODIGO = (SELECT TOP 1 (CASE ISNULL(CD_PAIS_ORIG_MERC, '') "&_
                "                                 WHEN '' THEN CD_PAIS_AQUIS_MERC "&_
                "                                 ELSE CD_PAIS_ORIG_MERC "&_
                "                               END) "&_ 
 	 						  "                    FROM TADICAO_DE_IMPORTACAO ( NOLOCK ) "&_
 							  "                   WHERE NR_PROCESSO   = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
						Else
							str = "&nbsp;"
						End If
						objrsx.Close()
					End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>")
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
		objtxt.WriteLine("  </tr>")
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
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
  .CommandText    = Session("sql_imp_kpi")
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