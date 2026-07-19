<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Exportação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 01/03/2006
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
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

cd_tela = "EXC006"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\exp_kpi_"& Session("cd_usuario") &"_"&_
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
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
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
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& Mid( str, 5, Len(str) ) &"</td>")
				Case "0015" 'Tipo de contâiner
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& str &"</td>")
				Case "0017" 'canal de liberacao
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = 4
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& tipo_canal(str) &"</td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0468" 'Nr. do Pedido/Referencia
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
									"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
									"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia &" "& Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & vbcrlf
							Loop
						End If
					End If
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT CD_MERCADORIA, ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = "& fnc_QuotedSQL( objrs.Fields.Item("NR_PROCESSO").Value )
					'Response.Write(sql &"<br>")
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
									"WHERE NR_PROCESSO = "& fnc_QuotedSQL( objrs.Fields.Item("NR_PROCESSO").Value )
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount > 0 Then 
							str = str & Trim( objrsx.Fields.Item("TX_MERCADORIA").Value )
						Else
							str = "Descrição não Disponível."
						End If
					End If
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'><nobr>"& str &"</nobr></td>")
					objrsx.Close
				Case "0103" 'sim/não campo in_urgente
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = 0
					objtxt.WriteLine("    <td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'><nobr>"& sim_nao(str) &"</nobr></td>")
				Case "0118","0123","0131" 'Nr. Nota Fiscal / Nr. RE / Nr. Doc. Instrução
					Select Case objrsv.Fields.Item("M10_CD_DADO").Value
						Case "0118"
							sql = "SELECT NR_NF AS NUMERO "&_
										"FROM TPROCESSO_EXP_NF ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
										"ORDER BY NR_NF"
						Case "0123"
							sql = "SELECT NR_RE AS NUMERO "&_
										"FROM TPROCESSO_EXP_RE ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
										"ORDER BY NR_RE"
						Case "0131"
							sql = "SELECT NR_DCTO_INSTRUCAO AS NUMERO "&_
										"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
										"  AND NR_DCTO_INSTRUCAO <> '' "&_
										"ORDER BY NR_DCTO_INSTRUCAO"
					End Select
					'Response.Write(sql &"<br>")
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = ""
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("NUMERO").Value )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
					objrsx.Close()
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
				Case "0154" 'Indicadores do saque Borderô
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& str &"</td>")
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							y    = objrs.Fields.Item(nm_campo_rel).Value
							numy = "" 'valor exibido no excel
							
							If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
							If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
							
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='color:"& color &";vertical-align:middle;' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' bgcolor='"& bgcolor &"' class='decimal4' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
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
	
	objtxt.WriteLine("  <tr>")
  objtxt.WriteLine("    <td height='15' colspan='"& nr_cols &"' align='left' class='gridsub'><nobr>Foram encontrados "& objrs.RecordCount &" registros.</nobr></td>")
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
  .CommandText    = Session("sql_exp_kpi")
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
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="/excel/arquivo<%= arquivo%>" target="_blank"><b>clique
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
window.open('download.asp?arquivo=<%= Server.URLEncode(arquivo)%>','download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->