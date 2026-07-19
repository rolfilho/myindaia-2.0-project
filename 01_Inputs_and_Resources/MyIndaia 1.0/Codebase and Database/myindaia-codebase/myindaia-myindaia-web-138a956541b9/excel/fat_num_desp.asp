<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Numerário x Despesas Pagas
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
Server.ScriptTimeout = 9999

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
'Dim objrsf   'objejo para armazenar dados do faturamento
Dim in_num   'identificador que guardar se tem ou não numerario para o processo/fatura
Dim in_desp  'identificador que guardar se tem ou não despesas para o processo/fatura
Dim vl_item  'valor do item do faturamento
Dim vl_desp  'armazema o valor total de despesas pagas pela indaiá
Dim vl_num   'valor do numerario
Dim vl_saldo 'valor do sado de numerario - despesas
Dim vl_total_num   'valor total dos numerarios
Dim vl_total_desp  'valor total das despesas
Dim vl_total_saldo 'valor total do saldo
Dim in_restitui    'verifica se existe restituição de valor na fatura
Dim in_despesas    'verifica se será mostradas as despesas detalhadamente
Dim in_faturado    'verifica se serão exibidos valores de processos faturados, não faturados ou ambos
Dim nr_proc_quebra 'verifica o numero do processo para exibir os valores de acordo com a fatura
Dim nr_solic_fat   'numero da solitacacao de fatura
Dim htm_num   'estrutura html para exibir o numerário
Dim htm_desp  'estrutura html para exibir as despesas
Dim htm_saldo 'estrutura html para exibir o saldo
Dim array_num(10), array_desp(10), array_saldo(10)

Set objrsf = Server.CreateObject("ADODB.RecordSet")

cd_tela = "EXC015"
tp_relat = CStr(Request.QueryString("tp_relat"))
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\fat_num_desp_"& Session("cd_usuario") &"_"&_
		  Year(Date) & Month(Date) & Day(Date) &"_"&_
		  Hour(Time) & Minute(Time) & Second(Time) &".xls"

Function fnc_GeraExcel(caminho, arquivo)
  Dim objfso 'objeto do sistema de arquivos 
  Dim objtxt 'objeto para a criação de arquivos
  'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
  Set objtxt = objfso.CreateTextFile(caminho&arquivo,True,False)
    'inicia a gravação do arquivo xls para download
	
	dim vTxLinha(1), vInRowspan
	vTxLinha(0) = ""
	vTxLinha(1) = ""
	vInRowspan = false
	nr_cols = 0
	'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
	objrsv.MoveFirst
	Do While Not objrsv.Eof
		select case objrsv.Fields.Item("M10_CD_DADO").Value
			case "0118"
				vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
				vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00095(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00096(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00097(cd_lang)&"</td>"
				vInRowspan = true
				nr_cols = nr_cols + 3
			case else
				select case objrsv.Fields.Item("M10_TP_DADO").Value
					case "1" 'datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
							vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00033(cd_lang)&"</td><td width=30 class='gridsub'>"&tx_lang_A00034(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00035(cd_lang)&"</td>"
							vInRowspan = true
							nr_cols = nr_cols + 3
						else
							vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=80 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							nr_cols = nr_cols + 1
						end if
					case else
						If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=120 class='gridtit3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						Else
							vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=120 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						End If
						nr_cols = nr_cols + 1
				end select
		end select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop	
	If tp_relat = "0" Then
	vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit'>Saldo</th>"	
	End If
%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
	if Len(vTxLinha(0)) > 0 then
		If in_doctos Then
			vTxLinha(0) = "<td#ROW# width=120 class='gridtit'>Documentos Digitalizados</td>"&vTxLinha(0)
  			nr_cols = nr_cols + 1
		End If
		if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
		objtxt.WriteLine("<tr height=30>"&vTxLinha(0)&"</tr>")
	end if
	'exibe a linha com os sub-titulos
	if Len(vTxLinha(1)) > 0 then
		objtxt.WriteLine("<tr height=15>"&vTxLinha(1)&"</tr>")
	end if
	
	nrec = 0
	cd_campo_quebra = ""
	
	
	
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
	If nr_proc_quebra <> objrs.Fields.Item("NR_PROCESSO").Value Then
		If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
		vl_saldo = 0
    End If
	
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("  <tr>")
				objtxt.WriteLine("    <td height='20' colspan='"& nr_cols+4 &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td>")
				objtxt.WriteLine("  </tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
		objtxt.WriteLine("  <tr height='15'>")	
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		
		If objrsv.Eof Then objrsv.MoveFirst
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					objtxt.WriteLine("    <td rowspan='"& num &"' align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'><nobr>"& Mid( str, 5, Len(str) ) &"</nobr></td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr. do Pedido/Referencia
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
					objtxt.WriteLine("    <td rowspan='"& num &"' align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>")
							Case "0730" 'qtde e tipo de Container
				sql = "SELECT CC.CD_ITEM, I.NM_ITEM, CC.VL_ITEM FROM TFATURAMENTO_CC CC (NOLOCK) "&_
				" INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = CC.CD_ITEM) "&_
				" WHERE CC.NR_PROCESSO = '" & nr_processo & "'"&_
				" AND CC.IN_CANCELADO = 0 "&_
             	" AND CC.IN_RESTITUI = 0 "&_
				" AND CC.CD_ITEM_NAO_FAT IS NULL "&_
				"AND I.CD_TIPO_ITEM <> 'N'  "&_
				" AND I.CD_ITEM < 900 "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount >0 Then
				str =""
				Do while Not objrsx.Eof
                  str = str & objrsx.Fields.Item("CD_ITEM").Value & " - " & objrsx.Fields.Item("NM_ITEM").Value & " R$ " & FormatNumber(objrsx.Fields.Item("VL_ITEM").Value,2)
                  objrsx.MoveNext
				  If objrsx.Eof Then Exit Do Else str = str &"<br>"
				Loop
				Else
				  str = ""
				End If	
objtxt.WriteLine("    <td rowspan='"& num &"' align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					
				Case "0170" 'qtde e tipo de Container
					sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
								"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
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
					objtxt.WriteLine("    <td rowspan='"& num &"' align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close()
				Case "0350" 'Carga Solta / LCL
					sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
								"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
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
					objtxt.WriteLine("    <td rowspan='"& num &"' align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close()
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							if InStr("997;998", objrs.Fields.Item("CD_ITEM").Value) > 0 and nm_campo_rel = "NM_ITEM" Then str = "<b>" & str & "</b>"
							if objrs.Fields.Item("VAL_ITEM2").Value < 0 and nm_campo_rel = "NM_ITEM" Then str = str & " (Restituição)"
							objtxt.WriteLine("    <td rowspan='"& num &"' align='left' bgcolor='"& bgcolor &"' style='vertical-align:middle;'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
							numx 	= Null
							numy 	= Null
							numz 	= Null
							x = Null
							y = Null
							z = Null
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								x = "-" 'data prevista
								y = "-" 'data realizada
								z = "-" 'diferença de dias
							Else
								x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
								y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
							'se a data prevista existir
								If IsDate(x) Then
									'se a data realizada existir
									If IsDate(y) Then
										z = fnc_DiasUteisKPI(x, y, 1)
									Else
										z = fnc_DiasUteisKPI(x, Date(), 1)
									End If
								Else
									'se não existe a data prevista a diferença de dias é zero
									z = 0
								End If
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									color = "#FF0000" 'vermelho
								End If
								
								If Not IsDate(x) Then x = 0 Else x = fnc_ConvertToExcel(x, 3, 0)
								If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
										
								If x > 0 Then numx = "x:num='"& x &"'" Else x = ""
								If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
								If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = "-"
							End If
							
							If in_dt_prev Then
								objtxt.WriteLine("    <td rowspan='"& num &"' bgcolor='"& bgcolor &"' class='data' style='vertical-align:middle;' "& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td rowspan='"& num &"' bgcolor='"& bgcolor &"' class='inteiro' style='color:"& color &";vertical-align:middle;' "& numz &">"& z &"</td>")
							End If
							objtxt.WriteLine("    <td rowspan='"& num &"' bgcolor='"& bgcolor &"' class='data' style='color:"& color &";vertical-align:middle;' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							objtxt.WriteLine("    <td rowspan='"& num &"' width='125' bgcolor='"& bgcolor &"' class='decimal2' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 4 ) Else x = 0
							
							objtxt.WriteLine("    <td rowspan='"& num &"' width='125' bgcolor='"& bgcolor &"' class='decimal4' style='vertical-align:middle;' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "4" 'exibe os campos com valor inteiro
							If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
								matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
								w = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
								y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
								x = fnc_DiasUteisKPI(objrs.Fields.Item(w).Value, objrs.Fields.Item(y).Value, Request.QueryString("in_dias_util"))
							Else
								x = objrs.Fields.Item(nm_campo_rel).Value
							End If
							numz  = "" 'valor exibido no excel
							
							If IsNull(x) Then
								z = "-" 'diferença de dias
							Else
								z = fnc_ConvertToExcel(x, 0, 0)
							End If
							If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							
							objtxt.WriteLine("    <td rowspan='"& num &"' class='inteiro' style='color:"& color &"; text-align:right; vertical-align:middle; background-color:"& bgcolor &";' "& numz &">"& z &"</td>")
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		If Session("flag_0747") <> "1" Then
		If Not (InStr("995;996",objrs.Fields.Item("CD_ITEM").Value) > 0) Then
  				If objrs.Fields.Item("TP_NATUREZA").Value = "C" or (InStr("578;994;998",objrs.Fields.Item("CD_ITEM").Value) >0)  Then
					vl_item = objrs.Fields.Item("VAL_ITEM2").Value
				Else
					vl_item = objrs.Fields.Item("VAL_ITEM2").Value * (-1)
				End If
				
  				vl_saldo = Round(vl_saldo + vl_item, 2)
				End If
				
				If vl_saldo >= 0 Then
					saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
				Else
					saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
				End If
		Else
			saldo = "<font color='#999999'>Não Disponível</font>" 		
		End If		
		If tp_relat = "0" Then
				objtxt.WriteLine("<td align='right' bgcolor='"& bgcolor &"'>&nbsp;" & saldo & "&nbsp;</td></tr>")
		End If		
				nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop

	objrsv.Close
	objrs.Close

	Set objrsf = Nothing
	
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
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_fat_num_desp")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst

Call fnc_GeraExcel(caminho, arquivo)
%>
<html>
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