<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel dos resultados de Demurrage
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
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

cd_tela  = "EXC011"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_dmge_"& Session("cd_usuario") &"_"&_
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
	cd_campo_quebra = ""
    If objrsv.Eof Then objrsv.MoveFirst
    objtxt.WriteLine("  <tr>")
	Do While Not objrsv.Eof
	  objtxt.WriteLine("    <td"& w &" valign='top' class='gridtit'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
	  objrsv.MoveNext
	  If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
	Do While Not objrs.Eof
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"

        if fnc_TestaVar(tp_quebra) Then
		  If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
			  'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
			  objtxt.WriteLine("  <tr>")
			  objtxt.WriteLine("    <td height='20' colspan='"& col &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td>")
			  objtxt.WriteLine("  </tr>")
		  End If
		  cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
        End If
		
		objtxt.WriteLine("  <tr height='15'>")
		
		If objrsv.Eof Then objrsv.MoveFirst
		'dados do prcesso
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
        nr_cntr = Trim(objrs.Fields.Item("NR_CNTR").Value) 
    nr_fatura = Trim(objrs.Fields.Item("NR_FATURA").Value) 
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'><nobr>"& Mid(nr_processo, 5, Len(nr_processo)) &"</nobr></td>")
				Case "0015" 'Tipo de contâiner
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1) Else str = ""
					objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'><nobr>"& str &"</nobr></td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101" 'Nr.Referencia - Item
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
									"FROM BROKER.DBO.TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
									"ORDER BY CD_REFERENCIA, NR_ITEM_PO "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & "<br>"
							Loop
						End If
					End If
					objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'>"& nr_referencia &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0019" 'Nr. do Item do Pedido/Referencia
					nr_item_clnte = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_item_clnte = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
									"FROM BROKER.DBO.TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '01' "&_
									"ORDER BY CD_REFERENCIA, NR_ITEM_PO "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_item_clnte = nr_item_clnte & Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_item_clnte = nr_item_clnte &"<br>"
							Loop
						End If
					End If
					objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'>"& nr_item_clnte &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0046" 'Nr. Contâiner
					objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'>"& fnc_Mascara( objrs.Fields.Item(nm_campo_rel).Value, 0 ) &"</td>")
				Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str &"<nobr>&nbsp;"& Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";&nbsp;</nobr><br>"
					Loop
				Else
					str = "Descrição não Disponível."
				End If
				objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
				objrsx.Close
                Case "2181","2182", "2183","2184","2185","2186","2187", "2188","2189","2190","2191", "2192","2193","2194","2195","0056","0510", "0060", "0054", "0055" 
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT TOP 1 C.NR_PERIODO, C.IN_PARCIAL, C.DT_INICIO, C.DT_FIM, FD.NM_TP_FAT_DEM NM_MOTIVO, C.DT_INICIO_DEMURRAGE, C.DT_FIM_DEMURRAGE, " & _
                " CONVERT(VARCHAR, F.DT_PAGTO, 103) DT_PAGTO, CONVERT(VARCHAR, P.DT_DEMURRAGE, 103) DT_VENCTO, ISNULL(C.VL_TOTAL, 0) VL_TOTAL, (ISNULL(C.VL_TOTAL, 0) - ISNULL(C.VL_DESCONTO, 0)) VL_COM_DESCONTO, "&_
                " C.NR_DIAS_COBRADOS NR_DIAS_COBRADOS, F.IN_ACORDO, ISNULL(C.VL_DIARIA, 0) VL_DIARIA, ISNULL(C.VL_FATURA_MNEG, 0) VL_FATURA_MNEG, MB.NM_MOEDA, ISNULL(C.VL_FATURA_MN, 0) VL_FATURA_MN, " &_
                " ISNULL(C.VL_DESCONTO_MNEG, 0) VL_DESCONTO_MNEG, ISNULL(C.VL_DESCONTO, 0) VL_DESCONTO, ISNULL(C.VL_ACRESCIMO_MNEG, 0) VL_ACRESCIMO_MNEG, ISNULL(C.VL_ACRESCIMO, 0) VL_ACRESCIMO, ISNULL(C.VL_DEPOSITO, 0) VL_DEPOSITO "&_
                    " FROM BROKER.DBO.TDEM_FAT_CNTR C " & _
                    " INNER JOIN BROKER.DBO.TDEM_FAT F ON F.NR_FATURA = C.NR_FATURA "&_
                    "    AND F.CD_UNID_NEG = C.CD_UNID_NEG " &_
                    " INNER JOIN BROKER.DBO.TTP_FAT_DEM FD ON FD.TP_FAT_DEM = F.TP_FAT_DEM "&_
                    " LEFT JOIN BROKER.DBO.TPROCESSO_CNTR P ON P.NR_PROCESSO = C.NR_PROCESSO "&_
                    "                                      AND P.NR_CNTR = C.NR_CNTR "&_
                    " LEFT JOIN BROKER.DBO.TMOEDA_BROKER MB ON MB.CD_MOEDA = C.CD_MOEDA_FATURA "&_
                    " WHERE C.NR_FATURA = '" & nr_fatura & "'" & _
                    "  AND C.NR_PROCESSO = '" & nr_processo & "' " & _
                    "  AND C.NR_CNTR = '" & nr_cntr & "' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

                str = ""
                If objrsx.RecordCount > 0 Then
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0056" Then str = objrsx.Fields.Item("NM_MOTIVO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0054" Then str = FormatNumber(objrsx.Fields.Item("VL_TOTAL").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0055" Then str = FormatNumber(objrsx.Fields.Item("VL_COM_DESCONTO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0060" Then str = objrsx.Fields.Item("DT_PAGTO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "0510" Then str = objrsx.Fields.Item("DT_VENCTO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2181" Then str = objrsx.Fields.Item("NR_PERIODO").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2182" Then str =  sim_nao(objrsx.Fields.Item("IN_PARCIAL").Value)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2183" Then str = "De: " & objrsx.Fields.Item("DT_INICIO").Value & " Até: " & objrsx.Fields.Item("DT_FIM").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2184" Then str = objrsx.Fields.Item("NR_DIAS_COBRADOS").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2185" Then str =  sim_nao(objrsx.Fields.Item("IN_ACORDO").Value)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2186" Then str = FormatNumber(objrsx.Fields.Item("VL_DIARIA").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2187" Then str = FormatNumber(objrsx.Fields.Item("VL_FATURA_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2188" Then str = FormatNumber(objrsx.Fields.Item("VL_FATURA_MN").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2189" Then str = FormatNumber(objrsx.Fields.Item("VL_DESCONTO_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2190" Then str = FormatNumber(objrsx.Fields.Item("VL_DESCONTO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2191" Then str = FormatNumber(objrsx.Fields.Item("VL_ACRESCIMO_MNEG").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2192" Then str = FormatNumber(objrsx.Fields.Item("VL_ACRESCIMO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2193" Then str = FormatNumber(objrsx.Fields.Item("VL_DEPOSITO").Value, 2)
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2194" Then str = objrsx.Fields.Item("NM_MOEDA").Value
                  If objrsv.Fields.Item("M10_CD_DADO").Value = "2195" Then str = "De: " & objrsx.Fields.Item("DT_INICIO_DEMURRAGE").Value & " Até: " & objrsx.Fields.Item("DT_FIM_DEMURRAGE").Value
                End If
                If InStr("0054;0055;2186;2187;2188;2189;2190;2191;2192;2193", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
                  objtxt.WriteLine("    <td width='125' class='moeda' style='background-color:"& bgcolor &";' x:num='"& fnc_ConvertToExcel(str, 1, 4) &"'></td>")
                Else
                  objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
				End If
                objrsx.Close 
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td style='text-align:left; background-color:"& bgcolor &"; vertical-align:top;'><nobr>"& str &"</nobr></td>")
						Case "1" 'exibe os campos de datas
							color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
							numx 	= Null
							numy 	= Null
							numz 	= Null
							y = Null
							y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
							
							If in_dt_prev Then
								x = Null
								z = Null
								w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
								
								If (Not fnc_TestaVar(w)) or (w = 0) Then
									x = "-" 'data prevista
									y = "-" 'data realizada
									z = "-" 'diferença de dias
								Else
									x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
									If IsDate(x) Then
										'se a data realizada existir
										If IsDate(y) Then
											z = fnc_DiasUteisKPI(x, y, 1)
										Else
											z = fnc_DiasUteisKPI(x, Date(), 1)
										End If
										'muda a cor do lead-time conforme o resultado
										If z < 0 Then 
											color = "#0000FF" 'azul
										ElseIf z > 0 Then
											color = "#FF0000" 'vermelho
										End If
									End If
									
									If Not IsDate(x) Then x = 0 Else x = fnc_ConvertToExcel(x, 3, 0)
									
									If x > 0 Then numx = "x:num='"& x &"'" Else x = ""
									If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = "-"
								End If
								objtxt.WriteLine("    <td class='data' style='background-color:"& bgcolor &";' "& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td class='inteiro' style='background-color:"& bgcolor &"; color:"& color &";' "& numz &">"& z &"</td>")
							End If
							
							If Not IsDate(y) Then y = 0 Else y = fnc_ConvertToExcel(y, 3, 0)
							If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
							
							objtxt.WriteLine("    <td class='data' style='background-color:"& bgcolor &"; color:"& color &";' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' class='decimal2' style='background-color:"& bgcolor &";' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td width='125' class='moeda' style='background-color:"& bgcolor &";' x:num='"& fnc_ConvertToExcel(x, 1, 4) &"'></td>")
						Case "4" 'exibe os campos com valor inteiro
							If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
								matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
								x = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
								y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
								z = fnc_DiasUteisKPI(objrs.Fields.Item("RLZ_"& x).Value, objrs.Fields.Item("RLZ_"& y).Value, Request.QueryString("in_dias_util"))
							Else
								z = objrs.Fields.Item(nm_campo_rel).Value
							End If
							numz  = "" 'valor exibido no excel
							
							If IsNull(z) Then
								z = "-" 'diferença de dias
							Else
								z = fnc_ConvertToExcel(z, 0, 0)
							End If
							If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							
							objtxt.WriteLine("    <td class='inteiro' style='text-align:right; vertical-align:middle; background-color:"& bgcolor &"; color:"& color &";' "& numz &">"& z &"</td>")
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
	objtxt.WriteLine("    <td height='15' colspan='"& col &"' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
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
  .CommandText    = Session("sql_imp_demurrage")
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