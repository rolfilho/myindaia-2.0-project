<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Custo Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 03/08/2005
'Manutenção: 19/06/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1000

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim col_0 'qtde de colunas com informações básicas
Dim col_1 'qtde de colunas com valores de despesas
Dim col_2 'qtde de colunas com valores da DI
Dim col_3 'qtde de colunas com valores totais
Dim vl_linha 'valor total da linha

Dim nr_qtde_quebras 'qtde de quebras de registros(grupo, cliente, area, modal)
Dim nr_row_xls_ini 'primeira linha com valor de custos da quebra
Dim nr_row_xls_fim 'ultima linha com valor de custos da quebra

Dim nr_proc_quebra 'numero do processo para quebra
Dim nr_qtde_procs 'qtde de processos(desembaraços)
Dim nr_row_proc_i 'primeira linha do processo
Dim nr_row_proc_f 'ultima linha do processo

Dim nr_row_xls_fixo 'constante da qtde de linhas de cabeçalho
Dim nr_col_xls      'coluna do excel com valor de custo
Dim nrs_rows_subs   'numero das linhas com sub-totais
Dim tx_formula      'texto com a formula de calculo de subtotais para exiber o total geral

cd_tela = "EXC008"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

col_0 = Request.QueryString("col_0")
col_1 = Request.QueryString("col_1")
col_2 = Request.QueryString("col_2")
col_3 = Request.QueryString("col_3")
If Not fnc_TestaVar(col_0) Then col_0 = 0
If Not fnc_TestaVar(col_1) Then col_1 = 0
If Not fnc_TestaVar(col_2) Then col_2 = 0
If Not fnc_TestaVar(col_3) Then col_3 = 0

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\imp_custo_"& Session("cd_usuario") &"_"&_
					Year(Date) & Month(Date) & Day(Date) &"_"&_
					Hour(Time) & Minute(Time) & Second(Time) &".xls"

Function fnc_ColunaExcel(nr_col)
  Dim alfabeto
  Dim coluna
  Dim divisor
  Dim resto
  
  nr_col   = nr_col - 1
  alfabeto = Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
  
  resto   = ( nr_col Mod 26 )
  divisor = ( nr_col \ 26 )
  If nr_col > 25 Then coluna = alfabeto(divisor - 1) & alfabeto(resto) Else coluna = alfabeto(resto)
  
  fnc_ColunaExcel = coluna
End Function

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
	'exibe o titulo dos grupos de colunas
	objtxt.WriteLine("  <tr height='20'>")
	If col_0 > 0 Then objtxt.WriteLine("    <td colspan='"& col_0 &"' class='gridtop'>&nbsp;&nbsp;Dados Básicos</td>")
	If col_1 > 0 Then objtxt.WriteLine("    <td colspan='"& col_1 &"' class='gridtop'>&nbsp;&nbsp;Despesas </td>")
	If col_2 > 0 Then objtxt.WriteLine("    <td colspan='"& col_2 &"' class='gridtop'>&nbsp;&nbsp;Valores da D.I.</td>")
	If col_3 > 0 Then objtxt.WriteLine("    <td colspan='"& col_3 &"' class='gridtop'>&nbsp;&nbsp;Totais</td>")
	objtxt.WriteLine("  </tr>")
	'exibe titulo das colunas
	objrsv.MoveFirst
	objtxt.WriteLine("  <tr height='50'>")
	Do While Not objrsv.Eof
		row = ""
		If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
			If in_dt_prev Then row = " colspan='3'"
			objtxt.WriteLine("    <td class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
		Else
			If in_dt_prev Then row = " rowspan='2'"
			If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
				objtxt.WriteLine("    <td width='110' class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
			Else
				objtxt.WriteLine("    <td class='gridtit'"& row &">"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>")
			End If
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	objtxt.WriteLine("  </tr>")
	'verifica se vão ser exibidas dats previstas
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
	nr_qtde_quebras = 0
	nr_row_xls_fixo = 7
	nr_proc_quebra  = ""
	nr_qtde_procs   = 0
	'valor da linha inicial para realiza a soma dos processos
	nr_row_xls_ini  = objrs.AbsolutePosition + nr_row_xls_fixo
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar(tp_quebra) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'qtde de quebras
				nr_qtde_quebras = nr_qtde_quebras + 1
				'se tiver mais de uma quebra soma-se 2 ao valor da linha fixa
				If nr_qtde_quebras > 1 Then nr_row_xls_fixo = nr_row_xls_fixo + 1
				'valor da linha inicial para realiza a soma dos processos
				nr_row_xls_ini  = objrs.AbsolutePosition + nr_qtde_quebras + nr_qtde_procs + nr_row_xls_fixo
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("  <tr>")
				objtxt.WriteLine("    <td height='20' colspan='"& nr_cols &"' class='gridtop'>"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td>")
				objtxt.WriteLine("  </tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End If
		objtxt.WriteLine("  <tr height='15'>")
		
		'verifica se o o processo no cursor de registro é diferente do anterior
		If nr_proc_quebra <> objrs.Fields.Item("NR_PROCESSO").Value Then
			nr_row_proc_i = objrs.AbsolutePosition + nr_qtde_quebras + nr_qtde_procs + nr_row_xls_fixo
		End If
		nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
		
		vl_linha = 0
		
		If objrsv.Eof Then objrsv.MoveFirst
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			'dados do prcesso
			nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
			nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
			nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& Mid(nr_processo, 5, Len(nr_processo)) &"</td>")
  			Case "0010" 'país de Procedência caso não tenha na capa pega o primeiro item
	  			str = objrs.Fields.Item(nm_campo_rel).Value
  				if not fnc_TestaVar(str) then
    				If objrsx.State = adStateOpen Then objrsx.Close()
	  		    	'seleciona a referencia de acordo com o tipo
		      		sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
			  	  	      " WHERE CODIGO = (SELECT CD_PAIS_PROC_CARGA "&_
 	 					    	  "                    FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
 							      "                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
      				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					  If objrsx.RecordCount > 0 Then
    					str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
	  			  Else
	    			  str = "&nbsp;"
  					End If
	  				objrsx.Close()
		  		End If
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"</td>")
				Case "0018" 'nr. da referencia
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& nr_referencia &"</td>")
				Case "0019" 'nr. item da referencia
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& nr_item_clnte &"</td>")
				Case "0015" 'Tipo de contâiner
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& str &"</td>")
				Case "0017" 'canal de liberacao
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = 4
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& tipo_canal(str) &"</td>")
				Case "0045" 'Exibe o nr. da viagem com mascara
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 4) &"</td>")
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
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
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
					objtxt.WriteLine("    <td align='left' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>")
					objrsx.Close()				
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de importação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(M.NM_MERCADORIA, DM.TX_DESC_DET_MERC) AS TX_MERCADORIA "&_
								"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
								"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "&_
								"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
								"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")
					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA "&_
									"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
									"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
									"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
									"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
						If objrsx.RecordCount < 1 Then
							objrsx.Close
							sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA "&_
										"FROM TPROCESSO ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = '"& nr_processo &"' "
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
					
					objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
					objrsx.Close
				Case "0283" 'Exibe o nr. da DI com mascara
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"'>"& fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 1) &"</td>")
				Case "0407" 'valor da comissão
					sql = "SELECT ISNULL( SUM( DISTINCT VL_ITEM_AREA ), 0 ) AS VL_COMISSAO "&_
								"FROM TFAT_CALCULO_RATEIO_DESP F ( NOLOCK ) "&_
								"  INNER JOIN TITEM I ( NOLOCK ) ON ( I.CD_ITEM = F.CD_ITEM ) "&_
								"WHERE F.NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND F.CD_REFERENCIA = '"& nr_referencia &"/"& nr_item_clnte &"' "&_
								"  AND I.CD_TIPO_ITEM  = 'R'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					x = objrsx.Fields.Item("VL_COMISSAO").Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
					
					objtxt.WriteLine("    <td class='decimal2' bgcolor='"& bgcolor &"' x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'></td>")
					objrsx.Close
				Case "0408" 'valor total da linha
					x = vl_linha
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
					
					objtxt.WriteLine("    <td class='decimal2' bgcolor='"& bgcolor &"' x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'></td>")

'--------------------------------------------------------------------------------------------------------------
			Case "0608" ' Condição de pagamento 14/04/2008
			sql="select CD_MODALIDADE_PAGTO,TP.DESCRICAO AS DESCRICAO from tdeclaracao_importacao TI INNER JOIN TMODALID_PAGAMENTO TP (NOLOCK) ON  TI.CD_MODALIDADE_PAGTO = TP.CODIGO"
			objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DESCRICAO").value					
			End If
			'response.Redirect("teste.asp?var1="&nm_campo_rel&"")
			objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
			objrsx.Close()

			Case "0611"
			     sql="select DT_FATURA from  tdocumento_instrucao where CD_TIPO_DCTO_INSTR = '01' and NR_PROCESSO =  '"& nr_processo &"'"
			 	 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DT_FATURA").value					
			End If
			objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
			objrsx.Close()

				Case "0442" 'taxa SISCOMEX
					 sql="select VL_TX_SCX_ITEM, VL_TAXA_SISCOMEX from TFATURAMENTO_RATEIO where NR_PROCESSO =  '"& nr_processo &"' and NR_REFERENCIA=  '"& nr_referencia &"' and NR_ITEM_CLIENTE=  '"& nr_item_clnte&"'"
					 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
				If objrsx.eof then
					str="-"
				Else
					If objrsx.fields.item("VL_TAXA_SISCOMEX").value=0 or isnull(objrsx.fields.item("VL_TAXA_SISCOMEX").value) then
						str=objrsx.fields.item("VL_TX_SCX_ITEM").value		
					Else
						str=objrsx.fields.item("VL_TAXA_SISCOMEX").value		
					End If
				End If
					objtxt.WriteLine("    <td class='decimal2' bgcolor='"& bgcolor &"' x:num='"& fnc_ConvertToExcel(str, 1, 2) &"'></td>")
				objrsx.Close()


'--------------------------------------------------------------------------------------------------------------
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							str = objrs.Fields.Item(nm_campo_rel).Value
							If Not fnc_TestaVar(str) Then str = "" Else str =  Trim(str)
							
							objtxt.WriteLine("    <td class='texto' bgcolor='"& bgcolor &"'>"& str &"</td>")
						Case "1" 'exibe os campos de datas
							color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
							numx 	= Null
							numy 	= Null
							numz 	= Null
							w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
							y = objrs.Fields.Item("RLZ_"&nm_campo_rel).Value
							x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
							z = Null
							
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								color = "#999999"
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
							Else
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
								
								If x > 0 Then numx = "x:num='"& x &"'" Else x = ""
								If y > 0 Then numy = "x:num='"& y &"'" Else y = ""
								If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = "-"
							End If
							'exibe datas previstas
							If in_dt_prev Then
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' "& numx &">"& x &"</td>")
								objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='inteiro' style='color:"& color &";' "& numz &">"& z &"</td>")
							End If
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='data' style='color:"& color &";' "& numy &">"& y &"</td>")
						Case "2" 'exibe os campos com valor decimal
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'></td>")
						Case "3" 'exibe os campos com valor monetário
							x = objrs.Fields.Item(nm_campo_rel).Value
							If fnc_TestaVar(x) Then
								Select Case objrs.Fields.Item("CD_INCOTERM").Value
									Case "CIF"
										If InStr(tx_soma_custo, objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
											vl_linha = vl_linha + x
										End If
									Case "CFR"
										If InStr(tx_soma_custo &"0418;", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
											vl_linha = vl_linha + x
										End If
									Case Else
										If InStr(tx_soma_custo &"0370;0418;", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
											vl_linha = vl_linha + x
										End If
								End Select
							End If
							If fnc_TestaVar(x) Then x = FormatNumber( x, 2 ) Else x = 0
							
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(x, 1, 2) &"'></td>")
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
							
							If IsNull(z) Then
								z = "-" 'diferença de dias
							Else
								z = fnc_ConvertToExcel(z, 0, 0)
							End If
							If IsNumeric(z) Then numz = "x:num='"& z &"'" Else z = ""
							
							objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='inteiro' "& numz &">"& z &"</td>")
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		'soma-se 1 a variavel nr_row_xls_fim pois tem que contar a linha do total do ultimo processo
		nr_row_xls_fim = objrs.AbsolutePosition + nr_qtde_quebras + nr_qtde_procs + nr_row_xls_fixo + 1
		nr_row_proc_f  = objrs.AbsolutePosition + nr_qtde_quebras + nr_qtde_procs + nr_row_xls_fixo
		objrs.MoveNext
		
		If objrs.Eof Then
			':::::::::::::::::::::::::::::: SUBTOTAL POR PROCESSO ::::::::::::::::::::::::::::::
			If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
			'soma 1 a qtde de processos
			nr_qtde_procs = nr_qtde_procs + 1
			objtxt.WriteLine("  <tr height='15'>")
			objtxt.WriteLine("    <td colspan='"& col_0 &"' bgcolor='"& bgcolor &"'></td>")
			'soma os valores dos processos da quebra.
			If objrsv.Eof Then objrsv.MoveFirst
			Do While Not objrsv.Eof
				If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
					nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
					objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='subproc' x:num x:fmla='SUM("& nr_col_xls & nr_row_proc_i &":"& nr_col_xls & nr_row_proc_f &")'></td>")
				End If
				objrsv.MoveNext
				If objrsv.Eof Then Exit Do
			Loop
			objtxt.WriteLine("  </tr>")
			
			':::::::::::::::::::::::::::::: SUBTOTAL POR QUEBRA ::::::::::::::::::::::::::::::
			If fnc_TestaVar(tp_quebra) Then
				'se for a ultima linha, exibe o total da ultima quebra
				objtxt.WriteLine("  <tr height='15'>")
				objtxt.WriteLine("    <td colspan='"& col_0 &"' bgcolor='#FFCC99'></td>")
				'guarda o numero da linha que esta o subtotal
				nrs_rows_subs = nrs_rows_subs & (nr_row_xls_fim + 1) &";"
				nrs_rows_subs = Left(nrs_rows_subs, Len(nrs_rows_subs)-1)
				'soma os valores dos processos da quebra.
				If objrsv.Eof Then objrsv.MoveFirst
				Do While Not objrsv.Eof
					If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
						nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
						objtxt.WriteLine("    <td class='subtotal' x:num x:fmla='SUM("& nr_col_xls & nr_row_xls_ini &":"& nr_col_xls & nr_row_xls_fim &")/2'></td>")
					End If
					objrsv.MoveNext
					If objrsv.Eof Then Exit Do
				Loop
				objtxt.WriteLine("  </tr>")
			End If
			':::::::::::::::::::::::::::::: TOTAL FINAL ::::::::::::::::::::::::::::::
			'soma todos os subtotais para obter o total geral
			objtxt.WriteLine("  <tr height='20'>")
			objtxt.WriteLine("    <td colspan='"& col_0 &"' bgcolor='#FFCC99'></td>")
			'soma os valores dos processos do relatorio.
			If objrsv.Eof Then objrsv.MoveFirst
			Do While Not objrsv.Eof
				'verifica se o tipo de dado é monetário
				If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
					'verifica se tem quebra de registros
					If fnc_TestaVar(tp_quebra) Then
						nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
						matriz     = Split(nrs_rows_subs, ";", -1)
						tx_formula = ""
						For cont = 0 to UBound(matriz) 
							tx_formula = nr_col_xls & matriz(cont) &"+"& tx_formula
						Next
						tx_formula = Left(tx_formula, Len(tx_formula)-1) 
						objtxt.WriteLine("    <td class='total' x:num x:fmla='"& tx_formula &"'></td>")
					Else
						nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
						objtxt.WriteLine("    <td class='total' x:num x:fmla='SUM("& nr_col_xls & nr_row_xls_ini &":"& nr_col_xls & nr_row_xls_fim &")/2'></td>")
					End If
				End If
				objrsv.MoveNext
				If objrsv.Eof Then Exit Do
			Loop
			objtxt.WriteLine("  </tr>")
			
			Exit Do
		Else
			':::::::::::::::::::::::::::::: SUBTOTAL POR PROCESSO ::::::::::::::::::::::::::::::
			If nr_proc_quebra <> objrs.Fields.Item("NR_PROCESSO").Value Then
				If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
				'soma 1 a qtde de processos
				nr_qtde_procs = nr_qtde_procs + 1
				objtxt.WriteLine("  <tr height='15'>")
				objtxt.WriteLine("    <td colspan='"& col_0 &"' bgcolor='"& bgcolor &"'></td>")
				'soma os valores dos processos da quebra.
				If objrsv.Eof Then objrsv.MoveFirst
				Do While Not objrsv.Eof
					If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
						nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
						objtxt.WriteLine("    <td bgcolor='"& bgcolor &"' class='subproc' x:num x:fmla='SUM("& nr_col_xls & nr_row_proc_i &":"& nr_col_xls & nr_row_proc_f &")'></td>")
					End If
					objrsv.MoveNext
					If objrsv.Eof Then Exit Do
				Loop
				objtxt.WriteLine("  </tr>")
			End If
			':::::::::::::::::::::::::::::: SUBTOTAL POR QUEBRA ::::::::::::::::::::::::::::::
			If fnc_TestaVar(tp_quebra) Then
				If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
					objtxt.WriteLine("  <tr height='15'>")
					objtxt.WriteLine("    <td colspan='"& col_0 &"' bgcolor='#FFCC99'></td>")
					'guarda o numero da linha que esta o subtotal
					nrs_rows_subs = nrs_rows_subs & (nr_row_xls_fim + 1) &";"
					'soma os valores dos processos da quebra.
					If objrsv.Eof Then objrsv.MoveFirst
					Do While Not objrsv.Eof
						If objrsv.Fields.Item("M10_TP_DADO").Value = "3" Then
							nr_col_xls = fnc_ColunaExcel(objrsv.AbsolutePosition)
							objtxt.WriteLine("    <td class='subtotal' x:num x:fmla='SUM("& nr_col_xls & nr_row_xls_ini &":"& nr_col_xls & nr_row_xls_fim &")/2'></td>")
						End If
						objrsv.MoveNext
						If objrsv.Eof Then Exit Do
					Loop
					objtxt.WriteLine("  </tr>")
				End If
			End If
		End If
	'	Response.Flush()
	Loop
	
	objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td colspan='"& nr_cols &"' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
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
  .CommandText    = Session("sql_imp_custo")
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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