<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
Response.Buffer = True
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
Server.ScriptTimeout = 9999

Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim numz
Dim tpCourrier, tpProduto
  Dim objfso 'objeto do sistema de arquivos 

cd_tela  = "EXC002"
cd_menu  = CStr(Request.QueryString("cd_menu"))
cd_subm  = CStr(Request.QueryString("cd_subm"))
cd_view  = CStr(Request.QueryString("cd_view"))
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
nr_cols  = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Sub subGeraExcel(caminho, arquivo)
  Dim objtxt 'objeto para a criação de arquivos
  'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
	Set objtxt = objfso.CreateTextFile(caminho & arquivo,True, False)
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
	%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
	'exibe titulo das colunas
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
	
	nrec            = 0
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
	response.flush
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td></tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
		'inicia uma nova linha de registro
		vTxExcel = "  <tr height='15'>"
		
		If in_doctos Then
			'Response.Redirect("../IMPORT/teste.asp?var1="&Server.MapPath("/docs/"& nr_processo)&"")
			If objfso.FolderExists(Server.MapPath("/docs/"& nr_processo)) or objfso.FolderExists(Server.MapPath("/docs_novo/"& nr_processo)) Then
				vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"'><nobr>"& tx_lang_004074(cd_lang) &"</nobr></td>"
			Else
				vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"'><nobr>"& tx_lang_A00059(cd_lang) &"</nobr></td>"
			End If
		End If
		
		If objrsv.Eof Then objrsv.MoveFirst
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
		response.flush
			nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			nr_processo  = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>"& Mid( str, 5, Len(str) ) &"</td>"
				Case "0009"
					If isnull(ltrim(rtrim(objrs.Fields.Item("in_courrier").Value))) then tpCourrier=""
					If objrs.Fields.Item("IN_COURRIER").Value="1" then tpCourrier=" (Courrier)" else tpCourrier="" end if
					str=objrs.Fields.Item(nm_campo_rel).Value& tpCourrier
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
					
				Case "0015" 'Tipo de contâiner
					vTxExcel = vTxExcel&fncExibeTipoContr(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case "0017" 'canal de liberacao
					vTxExcel = vTxExcel&fncExibeCanal(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case "0548"
					nr_rap = Null
					If objrsx.State = adStateOpen Then objrsx.Close()
                        sql = "SELECT CD_RAP+'/'+CD_RAP_ANO AS NR_RAP FROM TRAP WHERE NR_PROCESSO='" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						nr_rap = ""
						If objrsx.RecordCount > 0 Then
					      Do While Not objrsx.Eof
							nr_rap = nr_rap & Trim(objrsx.Fields.Item("NR_RAP").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else nr_rap = nr_rap & vbcrlf & " "
						  Loop
					    End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_rap &"</td>" 
					objrsx.Close()
					
				Case "0669"
					cd_volume = Null
					linha_vl = Null
					
					If objrsx.State = adStateOpen Then objrsx.Close()
                        sql = "SELECT DISTINCT PV.CD_VOLUME AS CD_VOLUME"&_ 
							  " FROM TRAP_PACK_VOLUME PV( NOLOCK )"&_
							  " INNER JOIN TRAP TR ON (TR.CD_RAP+TR.CD_RAP_ANO = PV.CD_RAP+PV.CD_RAP_ANO)"&_
							  " WHERE TR.NR_PROCESSO ='"& nr_processo & "'"						
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						cd_volume = ""
					    linha_vl = ""
						
						If objrsx.RecordCount > 0 Then
							Do While Not objrsx.Eof
								If Len(cd_volume & Trim(objrsx.Fields.Item("CD_VOLUME").Value)) > 120 Then
							       linha_vl = linha_vl & cd_volume & vbcrlf & " "
								   cd_volume = Trim(objrsx.Fields.Item("CD_VOLUME").Value)
								Else
								   cd_volume = cd_volume & Trim(objrsx.Fields.Item("CD_VOLUME").Value) & ", "
								End If
								objrsx.MoveNext
							Loop
							linha_vl = linha_vl & Left(cd_volume, Len(cd_volume)-2)								
						End If
						
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& linha_vl &"</td>" 
					objrsx.Close()	
					
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0486","0780" 'Nr. do Pedido/Referencia
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
									"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						nr_referencia = ""
						'se existir referencia, exibe na tela
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia &" "& Trim(objrsx.Fields.Item(nm_campo_rel).Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & vbcrlf
							Loop
						End If
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>"
					objrsx.Close()
					Case "0700" 'Fatura Indaiá
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT F.NR_NOTA_FATURA AS FATURA, F.TP_TIPO_FAT AS TIPO, CONVERT(VARCHAR,F.DT_FATURA,103) AS DATA FROM TS_FATURA F "&_
					  " INNER JOIN TS_FATURA_PROCESSO FP ON (FP.CD_UNID_NEG = F.CD_UNID_NEG "&_
                      " AND FP.CD_PRODUTO = F.CD_PRODUTO "&_
                      " AND FP.NR_SOLICITACAO = F.NR_SOLICITACAO) "&_
                      " WHERE FP.NR_PROCESSO = '" & nr_processo & "'"&_
                      " AND F.IN_IMP_NF_SERV = '1'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str = ""
				If objrsx.RecordCount > 0 Then
					Do While Not objrsx.Eof
						str = str & Trim(objrsx.Fields.Item("FATURA").Value) & " - " & Trim(objrsx.Fields.Item("DATA").Value) 
						If Trim(objrsx.Fields.Item("TIPO").Value) = "F" Then
							str = str & " (Fatura Indaiá)"
						Else
							str = str & " (Nota de débito Indaiá)"
						End if
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & "<br>"
					Loop
				End If
				objrsx.Close()
				vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>" & str & "</td>"	
					Case "0046" 'NR CONTAINER
						If objrsx.State = adStateOpen Then objrsx.Close()
							sql = "SELECT NR_CNTR AS NR_CNTR, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
									"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
									"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
							'agrupa todas as referencias na string para aparecerem como hint
							str = ""
							If objrsx.RecordCount > 0 Then
								'agrupa todas as referencias na string para aparecerem como hint
								Do While Not objrsx.Eof
									str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)
									objrsx.MoveNext
									If objrsx.Eof Then Exit Do Else str = str &"<br>"
								Loop
						End If
						objrsx.Close()
				  	    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
						
						Case "0768" 'NR CONTAINER
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT TC.NM_CARRETA AS NM_CARRETA FROM tprocesso_cntr TPC (NOLOCK)"&_
										" INNER JOIN TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
										" INNER JOIN TTP_CARRETA TC (NOLOCK) ON TC.CD_CARRETA = TPC.CD_CARRETA "&_
										" WHERE TP.NR_PROCESSO= '"& nr_processo &"' "&_
										" ORDER BY TPC.NR_CNTR "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
									Do While Not objrsx.Eof
										str = str &Trim(objrsx.Fields.Item("NM_CARRETA").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str &"<br>"
									Loop
								End If
								objrsx.Close()
						 vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
						Case "0687" 'deposito de coleta
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT (SUBSTRING(CGC_EMPRESA,1,2)+'.'+SUBSTRING(CGC_EMPRESA,3,3)+'.'+SUBSTRING(CGC_EMPRESA,6,3)+'/'+SUBSTRING(CGC_EMPRESA,9,4)+'-'+SUBSTRING(CGC_EMPRESA,13,2)) AS CNPJ"&_
                                      " FROM  TEMPRESA_NAC TEN "&_
                                      " INNER JOIN TRAP TRP ON (TRP.CD_DEP_COLETA = TEN.CD_EMPRESA AND TRP.NR_PROCESSO ='"& nr_processo &"')"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
									Do While Not objrsx.Eof
										str = str & Trim(objrsx.Fields.Item("CNPJ").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str & vbcrlf
									Loop
								End If
								objrsx.Close()
			
								vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>" & str & "</td>"

				Case "0579" 'Nr. do Pedido/Referencia
					nr_referencia = Null
					If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
						nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					Else
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA, DT_REFERENCIA "&_
									"FROM TREF_CLIENTE ( NOLOCK ) "&_
									"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
									"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
									"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'se existir referencia, exibe na tela
						nr_referencia = ""
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias
							Do While Not objrsx.Eof
								nr_referencia = nr_referencia &" "& Trim(objrsx.Fields.Item(nm_campo_rel).Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & vbcrlf
							Loop
						End If
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>"
					objrsx.Close()
				Case "0066" 'tipo de frete
			  	vTxExcel = vTxExcel&fncExibeFrete(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case  "0766"
					 'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT CD_IMPORTACAO "&_
												" FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"  WHERE NR_PROCESSO = '"& nr_processo &"'"&_
												"  ORDER BY I.CD_MERCADORIA "
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'se não achar a mercadoria, procura na tprocesso
																	
									str = ""
									If objrsx.RecordCount > 0 Then
										Do While Not objrsx.Eof
											if fnc_TestaVar(Trim(objrsx.Fields.Item("CD_IMPORTACAO").Value)) Then
												str = str & Trim(objrsx.Fields.Item("CD_IMPORTACAO").Value) 
											else
												str = str & "-" 
											end if	
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str & "<br>"
										Loop 
									Else
										str = ""
									End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
									objrsx.Close
				
				
				Case "0084" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(M.AP_MERCADORIA, '') AS TX_MERCADORIA "&_
								"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
								"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
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
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop 
					If Len(str) = 0 Then str = "Descrição não Disponível."
					
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
					objrsx.Close
					
					'Flávio em 8/5/2008  ===================================================================	
					Case "0085" 'Agente de carga
							If objrsx.state = adStateOpen then objrsx.Close()
							sql="select tp.NR_PROCESSO,tp.cd_agente,ta.nm_agente as agente from tprocesso tp, tagente ta where NR_PROCESSO= '"& nr_processo &"' and ta.cd_agente=tp.cd_agente"
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
							str=""
							If objrsx.eof  Then
								 str = "&nbsp;"
							Else
								str = Trim(objrsx.Fields.Item("agente").Value)
							End If
							'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
							objrsx.Close()
							vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
					 
					 Case "0662" 
						dim tp_consignatario
								If objrsx.state = adStateOpen then objrsx.Close()
								sql = "SELECT TP_CONSIGNATARIO FROM TPROCESSO_EXP "&_
								      " WHERE NR_PROCESSO ='"& nr_processo & "'"  
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								tp_consignatario = ""
								If objrsx.eof  Then
									tp_consignatario = null
								Else
									tp_consignatario = objrsx.Fields.Item("TP_CONSIGNATARIO").Value
								End If
								
								str=""
								If tp_consignatario = 0 Then 'Importador
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
										  " AND TEE.IN_IMPORTADOR = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText							
									If objrsx.RecordCount > 0 Then	
									str = Rtrim(objrsx.Fields.Item("NOME").Value)
									End If
								End If
								
								If tp_consignatario = 1 Then 'Agente
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
										  " AND TEE.IN_AGENTE = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText		
									str = Rtrim(objrsx.Fields.Item("NOME").Value)
								End If
								
								If tp_consignatario = 3 Then 'Banco
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
										  " AND TEE.IN_BANCO = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									str = Rtrim(objrsx.Fields.Item("NOME").Value)			
								End If
								
								If tp_consignatario = 2 Then 'Transportadora
									sql = "SELECT TTP.NM_TRANSP_ITL AS NOME"&_
										  " FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TTRANSP_ITL TTP ON TTP.CD_TRANSP_ITL = TPE.CD_CONSIGNATARIO"&_
										  " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									str = Rtrim(objrsx.Fields.Item("NOME").Value)	
								End If
								
								If tp_consignatario = 4 Then 'Despachante
									sql = "SELECT TDE.NM_DESPACHANTE AS NOME"&_
									      " FROM TPROCESSO_EXP TPE"&_
									      " INNER JOIN TDESPACHANTE TDE ON TDE.CD_DESPACHANTE = TPE.CD_CONSIGNATARIO"&_
									      " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									str = Rtrim(objrsx.Fields.Item("NOME").Value)	
								End If
                                'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()
							vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
						
						Case "0598" 'Cód.Mercadoria
									'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT ISNULL( M.AP_MERCADORIA, '') AS TX_MERCADORIA ,M.CD_MERCADORIA "&_
												"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"WHERE NR_PROCESSO = '"& nr_processo &"'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										x = Left(Trim(Replace(objrsx.Fields.Item("CD_MERCADORIA").Value,"""","'")), 40)
										If objrsx.RecordCount > 1 Then x = x &"..."
										'agrupa todas as mercadorias na string para aparecerem como hint
										Do While Not objrsx.Eof
											str = str & Trim(Replace(objrsx.Fields.Item("CD_MERCADORIA").Value,"""","'"))
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop 
									Else
										str = "Código não Disponível."
									End If
									vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
									objrsx.Close
					
				Case "0103", "0470","0701" 'sim/não campo in_urgente
					vTxExcel = vTxExcel&fncExibeSimNao(2, objrs.Fields.Item(nm_campo_rel).Value)
				case "0118","0123","0131" 'Nr. Nota Fiscal / Nr. RE / Nr. Doc. Instrução
							If ltrim(rtrim(objrs.Fields.Item("IN_PRODUTO_IMPORTADO").Value))="1" Then 
								tpProduto=" (Produto Importado)" 
							Else 
								tpProduto="" 
							End if
					vTxExcel = vTxExcel&fncExibeTabelaExp(2, objrsv.Fields.Item("M10_CD_DADO").Value, tpProduto)
				Case "0154" 'Indicadores do saque Borderô
					str = objrs.Fields.Item(nm_campo_rel).Value
					If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>"& str &"</td>"
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
							str = str &"&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &""
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					Else
						str = "&nbsp;"& tx_lang_A00041(cd_lang)
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
					objrsx.Close()
				
			Case  "KPIX"
			dim data1, data2, dia, total_fds, total_str, sinal
			str = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If data_dif_inicial = "DT_EV003DE" Then
				data_dif_inicial = "DT_EV003"
			End If
			
			If data_dif_final = "DT_EV003DE" Then
				data_dif_final = "DT_EV003"
			End If
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			"FROM TFLP_EXPORT (nolock) WHERE NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
			
			If objrsx.RecordCount > 0 Then
			If Not fnc_TestaVar(objrsx.Fields.Item("DIFERENCA").Value) Then
				str = ""
			Else			
			str = objrsx.Fields.Item("DIFERENCA").Value	
			If in_kpi_opcao = "1" Then
				data1 = objrsx.Fields.Item("DT_INICIAL").Value
				data2 = objrsx.Fields.Item("DT_FINAL").Value
				cont_str = 0
				total_fds = 0
				
				If str < 0 Then
					total_str = str * (-1)
					sinal = "-"
				Else
					sinal = ""
					total_str = str
				End If 
						
					Do While Not cont_str >=  total_str
						If objrsx.State = adStateOpen Then objrsx.Close
						sql = "SELECT DATEPART(WEEKDAY , '" & data1 & "') AS DIA"&_
						" FROM TFLP_EXPORT (nolock) WHERE NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						dia = objrsx.Fields.Item("DIA").Value
						
						If InStr("1;7", dia) > 0 Then
							total_fds = total_fds + 1
						End If	
						
						If str < 0 Then
							data1 = data1 - 1
						Else
							data1 = data1 + 1
						End If 
						cont_str = cont_str + 1
					Loop
				
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT " & str & " - ("& sinal & "(SELECT COUNT(*)  FROM TFERIADO WHERE DT_FERIADO BETWEEN RLZ_" & data_dif_inicial &  " AND RLZ_"& data_dif_final &" AND DT_FERIADO NOT IN (RLZ_" & data_dif_inicial &  ",RLZ_"& data_dif_final &") AND DATEPART(WEEKDAY,DT_FERIADO) NOT IN ('1','7'))) - ("& sinal &"" &_
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_EXPORT (nolock) WHERE NR_PROCESSO = '" & nr_processo & "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				
				If Not isNull(objrsx.Fields.Item("DIFERENCA_TOTAL").Value) Then
					str = objrsx.Fields.Item("DIFERENCA_TOTAL").Value
				Else
					str = ""
				End If
			Else
				If isNull(str) Then
					str = ""						
				Else
					str = str				
				End If
			End If 
			End If
			Else
              str = ""
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' x:num='"& str &"' ></td>"
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
							str = str &"&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &""
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					Else
						str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
					objrsx.Close()
				case "0499" 'qtde de produtos
					vTxExcel = vTxExcel&fncQtdeProdutosExp(2)
				Case "0531" 'status do processo
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
				Case "0548" 'código da rap
					vTxExcel = vTxExcel&fncExibeRap(2, nr_processo)
  			Case "0560" 'qtde de faturas por processo
	  			vTxExcel = vTxExcel&fncEmbalagemExp(2)
  			Case "0577" 'qtde de faturas por processo
	   			vTxExcel = vTxExcel&fncQtdeFaturasExp(2)
			Case "0559" 'ENTRADA DE CONTAINER NO ARMAZÉM
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DT_ENT_ARM AS DATA, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
							"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
							"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Trim(objrsx.Fields.Item("DATA").Value)
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"						
				Case "0758"
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Replace(Replace(objrsx.Fields.Item("TX_OBSERVACAO").Value, "'", "´"), vbcrlf, "<br>")
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"

			Case "0677" 'Agente de carga
			If objrsx.state = adStateOpen then objrsx.Close()
			sql = "SELECT ISNULL(SUM(VL_NOTA),'0') AS SOMA_NOTA "&_
				" FROM TPROCESSO_EXP_NF ( NOLOCK ) "&_
				" WHERE NR_PROCESSO = '"& nr_processo &"' "
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
			str=""
			str = Trim(objrsx.Fields.Item("SOMA_NOTA").Value)
			objrsx.Close()
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& FormatNumber(str,2) &"</td>"	
			Case "0800" 'Agente de carga
			If objrsx.state = adStateOpen then objrsx.Close()
						sql = "SELECT COUNT(PV.CD_VOLUME) AS VOLUME"&_ 
								  " FROM TRAP_PACK_VOLUME PV( NOLOCK )"&_
								  " INNER JOIN TRAP TR ON (TR.CD_RAP+TR.CD_RAP_ANO = PV.CD_RAP+PV.CD_RAP_ANO)"&_
								  " WHERE TR.NR_PROCESSO ='"& nr_processo & "'"
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
			str=""
			str = Trim(objrsx.Fields.Item("VOLUME").Value)
			objrsx.Close()
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"	
			
			Case "0182","0485" ' Analista Cliente 23/05/2008
				  If objrsv.Fields.Item("M10_CD_DADO").Value = "0182" Then 
			  If objrsx.state = adstateOpen then objrsx.close()
					SQL=" select u.nm_usuario as contato from tprocesso p inner join tusuario u on (u.cd_usuario = p.cd_analista_cliente) "&_
					"where p.nr_processo ='"&nr_processo&"'" 
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
					  If objrsx.eof then
						 str="-"
					  else
						  str= objrsx.fields.item("CONTATO").value
					  End If	
			Else
			  If objrsx.state = adstateOpen then objrsx.close()
					SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
					" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
					" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
					"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
					  If objrsx.eof then
						 str="-"
					  else
						  str= objrsx.fields.item("CONTATO").value
					  End If
			End If		    
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							If objrsv.Fields.Item("M10_CD_DADO").Value="0595" Then
								Select case objrs.Fields.Item(nm_campo_rel).Value 'nm_campo_rel = TP_Estufagem
									Case "0"
										nm_campo_rel="LCL"
									Case "1"
										nm_campo_rel="FCL"
									Case "2"
										nm_campo_rel="Carga solta"
									Case else
										nm_campo_rel="Em branco"
								End select
							 	vTxExcel = vTxExcel&fncExibeTextoPadrao(2, nm_campo_rel) 
							Else																
								vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item(nm_campo_rel).Value) 								
							End if
						Case "1" 'exibe os campos de datas
							if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
								vTxExcel = vTxExcel&fncExibeDataEventoFup(2, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
							else
								vTxExcel = vTxExcel&fncExibeDataPadrao(2, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
							end if
						Case "2" 'exibe os campos com valor decimal
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 2)
						Case "3" 'exibe os campos com valor monetário
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 4)
						Case "4" 'exibe os campos com valor inteiro
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 0)
						Case "5" 'exibe os campos do tipo memo
							vTxExcel = vTxExcel&fncExibeMemoPadrao(2, objrs.Fields.Item(nm_campo_rel).Value)
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		objtxt.WriteLine(vTxExcel&"  </tr>")
		objrs.MoveNext
		If objrs.Eof Then Exit Do
		nrec = nrec + 1
	Loop
	
	objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td colspan='"& nr_cols &"' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
  objtxt.WriteLine("  </tr>")
	
  objtxt.WriteLine("</table></body></html>")
  objtxt.Close()
	
	if objrs.Eof then
		sql = "UPDATE TRELATORIOS SET TX_ARQUIVO = '"&arquivo&"' "&_
					"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
					"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
		objcnn.Execute(sql)
	end if
	
  Set objtxt = Nothing
  Set objfso = Nothing
End Sub

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%= nm_menu &" - "& nm_subm%></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div id="textInLoad" style="position:absolute; top:50; left:38;">
<table width="170" height="70" border="1" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center"><span class="style1">CARREGANDO...</span><br>
			por favor aguarde, o relatório esta sendo criado.</td>
	</tr>
</table>
</div>
<%
'Response.Flush()
'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"
'verifica se o arquivo já foi criado
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT TX_ARQUIVO FROM TRELATORIOS (NOLOCK) "&_
			"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
			"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'Response.write Session("sql_exp_track")
'Response.end

if not fnc_TestaVar(objrs.Fields.Item(0).Value) then
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_exp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'gera o nome do arquivo
	vTxArquivo = "TrackingExp"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	
	Call subGeraExcel(vTxCaminho, vTxArquivo)
else
	vTxArquivo = objrs.Fields.Item(0).Value
end if

%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Planilha Excel<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
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
textInLoad.style.display="none";
window.focus();
window.open('http://www.myindaiaweb.com.br/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->