<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Licensa de Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor: Alexandre Gonçalves Neto
'Criado: 29/10/2005
'
'Manutenção: 16/03/2006
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

cd_tela  = "EXC009"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_lsa_imp_"& Session("cd_usuario") &"_"&_
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
	objtxt.WriteLine("  <tr>")
	Do While Not objrsv.Eof
		w = ""
		If objrsv.Fields.Item("M10_TP_DADO").Value     = "1" Then w = " width='100'"
		If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then w = " width='120'"
		objtxt.WriteLine("    <td"& w &" valign='top' class='gridtit'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	
	cd_campo_quebra = ""
	Do While Not objrs.Eof
		If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
		If fnc_TestaVar(tp_quebra) Then
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
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& Mid(nr_processo, 5, Len(nr_processo)) &"</td>")
				Case "0018","0094","0096","0097","0098","0099","0100","0101" 'Nr.Referencia - Item
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
									"ORDER BY CD_REFERENCIA"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & vbcrlf
							Loop
						End If
					End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>")
					If objrsx.State = adStateOpen Then objrsx.Close()
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL( TX_DESC_DET_MERC, '' ) AS TX_MERCADORIA "&_
								"FROM TLICENCA_ITENS ( NOLOCK ) "&_
								"WHERE SUBSTRING( NR_PROCESSO, 1, 14 ) = '"& nr_processo &"' "&_
								"ORDER BY NR_ITEM"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					str = ""
					If objrsx.RecordCount > 0 Then
						'descrição que será exibida
						x = Trim( Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'") )
						If Len(x) > 40 Then x = Left(x, 40)
						If objrsx.RecordCount > 1 Then x = x &"..."
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim(Replace( objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'"))
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
						Loop
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
									"FROM TPROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount > 0 Then
							str = str & Trim( objrsx.Fields.Item("TX_MERCADORIA").Value )
						Else
							str = "Descrição não Disponível."
						End If
						If Len(str) > 40 Then x = Left(str, 40) &"..." Else x = str
					End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close
				Case "0075","0226","0227" 'Registro, Deferimento e Vencimento da LI
				  numy = Null
					y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
					y = fnc_ConvertToExcel(y, 3, 0)
					If y > 0 Then numy = " x:num='"& y &"'"
					y = ""
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data'"& numy &">"& y &"</td>")
				Case "0229" 'nr da LI, nr LI substituida
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = fnc_Mascara(str, 1) Else str = ""
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>&nbsp;"& str &"&nbsp;</td>")
                Case "0225" 'nr da LI, nr LI substituida
				 If objrsx.State = adStateOpen Then objrsx.Close()
				    sql = " SELECT NR_LI "&_
                          " FROM TPROCESSO_LI ( NOLOCK ) "&_
					      " WHERE NR_PROCESSO = '"& nr_processo &"' "&_
                          " AND NR_LI NOT IN (SELECT NR_SUBSTITUIDA "&_
                          "                       FROM TPROCESSO_LI "&_
                          "                       WHERE NR_PROCESSO = '"& nr_processo &"' "&_
                          "                         AND NR_SUBSTITUIDA IS NOT NULL)  " 
				    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

                    str = ""
                    If objrsx.RecordCount > 0 Then
                        Do While Not objrsx.Eof
                            str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1) 
                            objrsx.MoveNext
                            if objrsx.Eof Then Exit Do Else str = str & "<br>&nbsp;"
                        Loop
                    End If
                objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>&nbsp;"& str &"&nbsp;</td>")
                Case "0849"
                If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT OA.DESCRICAO AS DESCRICAO, LI.NR_LI" &_
                      " FROM TPROCESSO_LI_ORGAO_ANUENTE LI (NOLOCK) "&_
                      " LEFT JOIN TORGAO_ANUENTES OA (NOLOCK) ON (OA.CODIGO = LI.CD_ORGAO_ANUENTE) "&_
                      " WHERE LI.NR_PROCESSO = '" & nr_processo & "'" 
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                
                str = ""
                If objrsx.RecordCount > 0 Then
                    Do While Not objrsx.Eof
                        str = str & "&nbsp;" & Trim(objrsx.Fields.Item("DESCRICAO").Value) & " (" & Trim(objrsx.Fields.Item("NR_LI").Value) & ")"
                        objrsx.MoveNext
                        if objrsx.Eof Then Exit Do Else str = str & "<br>"
                    Loop
                End If
                objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"&nbsp;</td>")
                If objrsx.State = adStateOpen Then objrsx.Close()
                Case "0673"
                If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT TOP 1 CD_NCM_SH"&_
                      " FROM TLICENCA_ITENS ( NOLOCK ) "&_
					  " WHERE SUBSTRING( NR_PROCESSO, 1, 14 ) = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                
                str = ""
                If objrsx.RecordCount > 0 Then
                  str = Trim(objrsx.Fields.Item("CD_NCM_SH").Value)                         
                End If
                objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"&nbsp;</td>")
                objrsx.Close
                Case "0598"
                If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT CD_MERCADORIA "&_
                      " FROM TLICENCA_ITENS ( NOLOCK ) "&_
					  " WHERE SUBSTRING( NR_PROCESSO, 1, 14 ) = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

                str = ""
                If objrsx.RecordCount > 0 Then
                    Do While Not objrsx.Eof
                        str = str & "&nbsp;" & Trim(objrsx.Fields.Item("CD_MERCADORIA").Value)
                        objrsx.MoveNext
                        if objrsx.Eof Then Exit Do Else str = str & "<br>"
                    Loop
                End If
                objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"&nbsp;</td>")
                If objrsx.State = adStateOpen Then objrsx.Close()
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"</td>")
						Case "1" 'exibe os campos de datas
							color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
							numx 	= Null
							numy 	= Null
							numz 	= Null
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
							
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								color = "#999999"
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
							Else
								y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
								x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
								z = Null
								If IsDate(x) and IsDate(y) Then
									z = fnc_DiasUteisKPI(x, y, 0)
								ElseIf IsDate(y) Then
									z = fnc_DiasUteisKPI(x, Date(), 0)
								End If
								'converte para o excel
								x = fnc_ConvertToExcel(x, 3, 0)
								y = fnc_ConvertToExcel(y, 3, 0)
								'altera a cor de acordo com o KPI
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									color = "#FF0000" 'vermelho
								End If
								
								If x > 0 Then numx = " x:num='"& x &"'" 
								If y > 0 Then numy = " x:num='"& y &"'"
								If IsNumeric(z) Then numz = " x:num='"& z &"'"
								x = ""
								y = ""
								z = ""
							End If
							'exibe datas previstas
							If in_dt_prev Then
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data'"& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='inteiro' style='color:"& color &";'"& numz &">"& z &"</td>")
							End If
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='color:"& color &";'"& numy &">"& y &"</td>")
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
  .CommandText    = Session("sql_lsa_imp")
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