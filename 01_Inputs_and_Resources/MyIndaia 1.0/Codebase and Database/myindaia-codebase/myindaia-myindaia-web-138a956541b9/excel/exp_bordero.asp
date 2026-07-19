<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel dos resultados do KPI Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 16/01/2006
'
'Manutenção: 29/09/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim tp_rel  'código dipo de relatório
Dim nm_rel  'nome do relatório
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

cd_tela = "EXC012"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\exp_bordero_"& Session("cd_usuario") &"_"&_
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
	objtxt.WriteLine("  <tr height='45'>")
	If in_dt_prev Then row = " rowspan='2'" Else row = "width='150'"
	objtxt.WriteLine("    <td class='gridtit'"& row &">Situa&ccedil;&atilde;o/Status</td>")
	
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
			If in_dt_prev Then row = " colspan='3'" Else row = "width='110'"
			objtxt.WriteLine("    <td class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		Else
			If in_dt_prev Then row = " rowspan='2'" Else row = "width='150'"
			objtxt.WriteLine("    <td class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
	If in_dt_prev Then
		objtxt.WriteLine("  <tr height='15'>")
		For x = 1 to nr_data
			objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00033(cd_lang) &"</td>")
			objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00034(cd_lang) &"</td>")
			objtxt.WriteLine("    <td class='gridsub'>"& tx_lang_A00035(cd_lang) &"</td>")
		Next
		objtxt.WriteLine("  </tr>")
	End If
  
	cd_campo_quebra = ""
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
		'Situa&ccedil;&atilde;o/Status do Border&ocirc;
		x = objrs.Fields.Item("TP_SITUACAO").Value
		y = objrs.Fields.Item("TP_STATUS").Value
		
		If x = "0" or Not fnc_TestaVar(x) Then
			str = "&Agrave; enviar"
		Else
			str = "Docs."
			If fnc_TestaVar(y) Then str = str &" / "& status_bordero(y)
		End If
		objtxt.WriteLine("  <tr height='15'>")
		objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'><nobr>"& str &"</nobr></td>")
	
		If objrsv.Eof Then objrsv.MoveFirst
		'dados do prcesso
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& Mid(nr_processo, 5, 13) &"</td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0468" 'Nr. do Pedido/Referencia
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
									"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia &" "& Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & vbcrlf
							Loop
						Else
							nr_referencia = Null
						End If
						objrsx.Close()
					End If
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>")
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					'Response.Write(sql &"<br>")
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					str = ""
					If objrsx.RecordCount < 1 Then
						objrsx.Close()
						sql = "SELECT ISNULL(TX_MERCADORIA, '') AS TX_MERCADORIA "&_
									"FROM TPROCESSO (NOLOCK) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'"))
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop 
					If Len(str) = 0 Then str = "Descrição não Disponível."
					
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
							numx 	= Null
							numy 	= Null
							numz 	= Null
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
							x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
							y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
							z = Null
							
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								color = "#999999"
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
							Else
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
										color = "#FF0000" 'vermelho
									End If
								End If
								
								If Not IsDate(x) Then x = 0 Else x = fnc_ConvertToExcel(x, 3, 0)
								If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
									
								If x > 0 Then numx = "x:num='"& x &"'" Else x = ""
								If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
								If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = "-"
							End If
							'exibe as datas previstas
							If in_dt_prev Then
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='vertical-align:middle;' "& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='inteiro' style='color:"& color &";vertical-align:middle;' "& numz &">"& z &"</td>")
							End If
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='color:"& color &";vertical-align:middle;' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
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
	.CommandText    = Session("sql_exp_bordero")
	.CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
'qtde de uni&atilde;o de coluns

cont = CInt(Request.QueryString("cont"))
If in_dt_prev Then
	col = (objrsv.RecordCount - cont) + (cont * 3)
Else
	col = objrsv.RecordCount
End If
cd_campo_quebra = ""

Call fnc_GeraExcel(caminho, arquivo)
%>
<html>
<head>
<title><%= nm_rel%></title>
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
