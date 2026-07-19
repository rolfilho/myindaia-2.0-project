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
in_alerta = Request.QueryString("in_alerta")
in_interno = Request.QueryString("in_interno")
in_envia_agora = Request.QueryString("in_envia_agora")

%>
<!--#include virtual="/includes/inc_utils.asp"-->
<%If in_alerta <> "1" Then%>
<!--#include virtual="/includes/inc_execs.asp"-->
<%Else
  Session("tp_exibir2") = 0
  Session("cd_usuario") = Left(Request.QueryString("cd_view"), 4)
  Session("cargo_interno") = in_interno
  Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
End If
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
        If objrsv.Fields.Item("M14_TP_KPI").Value = "0" Then
          kpi_cabec = " (" & tx_lang_CV008(cd_lang) & ") "
          classe_kpi = "gridtit3"
        Else
          kpi_cabec = " (" & tx_lang_CV014(cd_lang) & ") "
          classe_kpi = "gridtit3_1"
        End If
		select case objrsv.Fields.Item("M10_CD_DADO").Value
			case "0118"
				vTxLinha(0) = vTxLinha(0) &"<td colspan='4' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
				vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00095(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00096(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00097(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00098(cd_lang)&"</td>"
				vInRowspan = true
				nr_cols = nr_cols + 4
			case else
				select case objrsv.Fields.Item("M10_TP_DADO").Value
					case "1" 'datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
							vTxLinha(0) = vTxLinha(0) &"<td colspan='4' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00033(cd_lang)&"</td><td width=30 class='gridsub'>"&tx_lang_A00034(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00035(cd_lang)&"</td>"
							vInRowspan = true
							nr_cols = nr_cols + 4
						else
							vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=80 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							nr_cols = nr_cols + 1
						end if
					case else
					If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						    vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='" & classe_kpi & "'>"&objrsv.Fields.Item("M10_NM_DADO").Value&kpi_cabec&"</th>"
					    Else
                        If objrsv.Fields.Item("M10_TP_DADO").Value = "A" Then
                            vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit4'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
                        Else
            			    vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
                        End If
					End If
						nr_cols = nr_cols + 1
				end select
		end select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
    
    if in_alerta = "1" Then
        If objrsx.State = adStateOpen Then objrsx.Close()
        sql = "SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO='" & Session("cd_usuario") & "'"
	    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        Session("nm_usuario") = objrsx("NM_USUARIO")
        objrsx.Close
    End If 
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
		If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
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

            If tp_relat = 3 Then
                nr_fatura_exp = objrs.Fields.Item("NR_PEDIDO_EXP").Value
            End If
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
				
				Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0486","0678","0780","0899","0920","1051","1066","1067","1087","2017","2018","2024","2027","2029","2142","2157","2158","2159","2317","2261","2400","2331","2336","2332","2396","2402","2408" 'Nr. do Pedido/Referencia
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
				
				
								Case "0130" 'Nr. Fatura Comercial
				If objrsx.State = adStateOpen Then objrsx.Close()
					str = objrs.Fields.Item("NR_FATURA").Value
					if not fnc_TestaVar(str) then
						sql = "SELECT LTRIM(RTRIM(NR_DCTO_INSTRUCAO)) AS NR_FATURA "&_
									"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
									"  AND NR_DCTO_INSTRUCAO <> '' "&_
									"  AND CD_TIPO_DCTO_INSTR = '01' "&_ 
									"ORDER BY NR_DCTO_INSTRUCAO"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						str = ""
						If objrsx.RecordCount > 0 Then
							Do While Not objrsx.Eof
								str = str & objrsx.Fields.Item("NR_FATURA").Value
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &"<br>"
							Loop
						End If
						objrsx.Close()
					end if
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					
				
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
				  	    
				  	    
				  	    Case "2376" 'CHAVE DE ACESSO NF
						If objrsx.State = adStateOpen Then objrsx.Close()
							sql = "SELECT CHAVE_NOTA AS nf_ch_acesso FROM BROKER.DBO.TPROCESSO_EXP_NF "&_
										" WHERE NR_PROCESSO= '"& nr_processo &"' "
														
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
							'agrupa todas as referencias na string para aparecerem como hint
							str = ""
							If objrsx.RecordCount > 0 Then
								'agrupa todas as referencias na string para aparecerem como hint
								Do While Not objrsx.Eof
									str = str &Trim(objrsx.Fields.Item("nf_ch_acesso").Value)
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
                                Case "0905","0906","0907","0908","0909","0910","0911","0912","0914" 

							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT M.AP_MERCADORIA, A.NR_RE, P.QT_MERCADORIA, P.CD_NCM, P.VL_MLE, P.VL_MCV, P.VL_TOT_PESO_LIQ, CONVERT(VARCHAR, C.DT_DATA, 103) AS DT_RE, D.NR_ATO_CONCESSORIO AS ATO " &_
                                      " FROM BROKER.DBO.TRE_ANEXO_PURO P (NOLOCK) " &_
                                      "  INNER JOIN BROKER.DBO.TRE_ANEXO A (NOLOCK) ON A.NR_PROCESSO = P.NR_PROCESSO " &_
                                      "                                 AND A.CD_RE_ANEXO = P.CD_RE_ANEXO " &_
                                      "                                 AND A.NR_PROCESSO_COMPLEMENTO = P.NR_PROCESSO_COMPLEMENTO "&_
                                      "  INNER JOIN BROKER.DBO.TRE_CAPA C (NOLOCK) ON C.NR_PROCESSO = A.NR_PROCESSO " & _
                                      "                                AND C.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO "&_
                                      "  LEFT JOIN BROKER.DBO.TRE_ANEXO_DRAWBACK D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO "&_
                                      "                                AND D.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO " &_    
                                      "                                AND D.CD_RE_ANEXO = A.CD_RE_ANEXO " &_
                                      "  INNER JOIN BROKER.DBO.TMERCADORIA_EXP M (NOLOCK) ON M.CD_MERCADORIA = P.CD_MERCADORIA "&_
                                      " WHERE P.NR_PROCESSO = '" & nr_processo & "'"&_
                                      " ORDER BY NR_RE"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								                                
                                'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
                                    Select Case objrsv.Fields.Item("M10_CD_DADO").Value
                                        Case "0905"
                                            Do While Not objrsx.Eof
                                            str = str &Trim(objrsx.Fields.Item("AP_MERCADORIA").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0906"
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("NR_RE").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0907"
                                            Do While Not objrsx.Eof
                                            str = str &Trim(objrsx.Fields.Item("CD_NCM").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0908"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("QT_MERCADORIA").Value),4)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0909"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_MLE").Value),2)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0910"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_MCV").Value),2)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0911" 
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_TOT_PESO_LIQ").Value),4)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0912" 
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("DT_RE").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop 
                                        Case "0914" 
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("ATO").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop   
                                    End Select
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>" & str & "</td>"
                Case "0861" 'deposito de coleta
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT (SUBSTRING(TEN.CGC_EMPRESA,1,2)+'.'+SUBSTRING(TEN.CGC_EMPRESA,3,3)+'.'+SUBSTRING(TEN.CGC_EMPRESA,6,3)+'/'+SUBSTRING(TEN.CGC_EMPRESA,9,4)+'-'+SUBSTRING(TEN.CGC_EMPRESA,13,2)) AS CNPJ"&_
                                      " FROM  TEMPRESA_NAC TEN "&_
                                      " INNER JOIN TRAP TRP ON (TRP.CD_DEP_COLETA = TEN.CD_EMPRESA)"&_
                                      " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& objrs.Fields.Item("NR_PEDIDO_EXP").Value & "'"&_
                                      "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
									str = str &Trim(objrsx.Fields.Item("CNPJ").Value)
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>" & str & "</td>"
                        Case "0863" 'peso_liq_unit
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_PESO_LIQ_UNIT * QT_MERCADORIA) AS VL_PESO "&_
                                " FROM TPROCESSO_EXP_ITEM "&_ 
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "  AND NR_PEDIDO = '" & nr_fatura_exp & "' "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("VL_PESO").Value
                                End If
								objrsx.Close()     
                                          
                                 vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 4)
                        Case "0864" 'peso_liq_unit
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_MLE) AS VL_MLE "&_
                                " FROM TPROCESSO_EXP_ITEM "&_ 
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "  AND NR_PEDIDO = '" & nr_fatura_exp & "' "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("VL_MLE").Value
                                End If
								objrsx.Close()               
                                 vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 2)
                         Case "0865" 'SIGLA
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT DISTINCT U.NM_SIGLA AS SIGLA "&_
                                " FROM TPROCESSO_EXP_ITEM E (NOLOCK) "&_
                                "  INNER JOIN TUNID_MEDIDA_BROKER U (NOLOCK) ON U.CD_UNID_MEDIDA = E.CD_UNID_MEDIDA "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("SIGLA").Value
								End If
								objrsx.Close()   
                                vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>" & str & "</td>" 
                        Case "0883" 'DESCONTO
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_DESCONTO) AS DESCONTO "&_
                                " FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("DESCONTO").Value, 2)
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 2)
                        Case "0884" 'ACRESCIMO
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_ACRESCIMO) AS ACRESCIMO "&_
                                " FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("ACRESCIMO").Value, 2)
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 2)
                         Case "0893" 'qtde. fornecimentos
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT COUNT(DISTINCT CD_FORNECIMENTO) AS TOTAL "&_
                                " FROM TRAP_FORNECIMENTO TRP "&_
                                " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& nr_fatura_exp & "'"&_
                                "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("TOTAL").Value
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
                                Case "0913" 'fornecimentos - RAP
                            str = ""
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT DISTINCT CD_FORNECIMENTO "&_
                                " FROM TRAP_FORNECIMENTO TRP "&_
                                " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& nr_fatura_exp & "'"&_
                                "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  Do While Not objrsx.Eof
								    str = str &" "& Trim(objrsx.Fields.Item("CD_FORNECIMENTO").Value)
								    objrsx.MoveNext
								    If objrsx.Eof Then Exit Do Else str = str & vbcrlf
							      Loop 
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
                            Case "0895" 'qtde. fornecimentos
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT COUNT(DISTINCT F.CD_FORNECIMENTO) AS TOTAL "&_
                                " FROM TRAP R "&_
                                "   INNER JOIN TRAP_FORNECIMENTO F (NOLOCK) ON F.CD_RAP = R.CD_RAP "&_
                                "                                          AND F.CD_RAP_ANO = R.CD_RAP_ANO"&_
                                "                                          AND F.CD_GRUPO = R.CD_GRUPO"&_
                                " WHERE R.NR_PROCESSO = '" & nr_processo & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("TOTAL").Value
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"        
                 Case "0897" 'VOLUMES
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT TX_MARCACAO AS DESCRICAO "&_
                                " FROM TPROCESSO_EXP_PEDIDO "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("DESCRICAO").Value
								End If
								objrsx.Close()
                                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
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
					sql = "SELECT ISNULL(TX_MERCADORIA, '') AS TX_MERCADORIA "&_
									"FROM TPROCESSO (NOLOCK) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
					'sql = "SELECT ISNULL(M.AP_MERCADORIA, '') AS TX_MERCADORIA "&_
					'			"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
					'			"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
					'			"WHERE NR_PROCESSO = '"& nr_processo &"' "
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
					 
					  Case "0662","0981","0982","0983" 
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
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE (NOLOCK) ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO "&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_IMPORTADOR = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText		
									
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 1 Then 'Agente
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_AGENTE = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                                    	
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 3 Then 'Banco
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_BANCO = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If	
								End If
								
								If tp_consignatario = 2 Then 'Transportadora
									sql = "SELECT TEE.DESCRICAO AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_CIA_TRANSP,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL_CIA_TRANSP,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS "&_
										  " FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN BROKER.DBO.TTRANSPORTADOR_ITL TEE ON TEE.CODIGO = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 4 Then 'Despachante
									sql = "SELECT TDE.NM_DESPACHANTE AS NOME, '' AS EMPRESA_END, '' END_CIDADE, '' NM_PAIS"&_
									      " FROM TPROCESSO_EXP TPE"&_
									      " INNER JOIN TDESPACHANTE TDE ON TDE.CD_DESPACHANTE = TPE.CD_CONSIGNATARIO"&_
									      " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
                                'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()
							vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
							
							
							Case "2382","2383","2384","2385" 
						dim tp_notify1
								If objrsx.state = adStateOpen then objrsx.Close()
								sql = "SELECT TP_NOTIFY1 FROM TPROCESSO_EXP "&_
								      " WHERE NR_PROCESSO ='"& nr_processo & "'"  
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								tp_notify1 = ""
								If objrsx.eof  Then
									tp_notify1 = null
								Else
									tp_notify1 = objrsx.Fields.Item("TP_NOTIFY1").Value
								End If
								
								str=""
								If tp_notify1 = 0 Then 'Importador
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE (NOLOCK) ON TEE.CD_EMPRESA = TPE.CD_NOTIFY1 "&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_IMPORTADOR = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText		
									
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2382" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2383" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2384" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2385" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_notify1 = 1 Then 'Agente
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_NOTIFY1"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_AGENTE = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                                    	
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2382" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2383" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2384" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2385" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_notify1 = 3 Then 'Banco
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_NOTIFY1"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_BANCO = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2382" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2383" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2384" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2385" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If	
								End If
								
								If tp_notify1 = 2 Then 'Transportadora
									sql = "SELECT TEE.DESCRICAO AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_CIA_TRANSP,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL_CIA_TRANSP,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS "&_
										  " FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN BROKER.DBO.TTRANSPORTADOR_ITL TEE ON TEE.CODIGO = TPE.CD_NOTIFY1"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2382" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2383" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2384" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2385" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_notify1 = 4 Then 'Despachante
									sql = "SELECT TDE.NM_DESPACHANTE AS NOME, '' AS EMPRESA_END, '' END_CIDADE, '' NM_PAIS"&_
									      " FROM TPROCESSO_EXP TPE"&_
									      " INNER JOIN TDESPACHANTE TDE ON TDE.CD_DESPACHANTE = TPE.CD_NOTIFY1"&_
									      " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2382" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2383" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2384" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "2385" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
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
			dim data1, data1_aux, data2, dia, total_fds, total_str, sinal
			str = ""
            str_texto = ""
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
			" FROM TFLP_EXPORT1 F1 (nolock) " &_
            "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
            " WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
            sql = Replace(sql, "RLZ_DT_HOJE", "GETDATE()")
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
			
			If objrsx.RecordCount > 0 Then
			If Not fnc_TestaVar(objrsx.Fields.Item("DIFERENCA").Value) Then
				str = ""
			Else			
			str = objrsx.Fields.Item("DIFERENCA").Value	
			If objrsv.Fields.Item("M14_TP_KPI").Value = "0" Then	
                If objrsx.Fields.Item("DIFERENCA").Value > 50 Then
                    str = "+ de " & CStr(Round((objrsx.Fields.Item("DIFERENCA").Value * 3)/4, 0)) & " dias"
                    str_texto = "1"
                Else
				    data1 = objrsx.Fields.Item("DT_INICIAL").Value
                    data1_aux = objrsx.Fields.Item("DT_INICIAL").Value
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
					" FROM TFLP_EXPORT1 F1 (nolock) "&_
                    "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
                    "WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
						    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						    dia = objrsx.Fields.Item("DIA").Value
						
						    If InStr("1;7", dia) > 0 Then
							  If data1 <> data1_aux Then
						        total_fds = total_fds + 1
                              End If
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
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_EXPORT1 F1 (nolock) "&_
                "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
                "WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
                    sql = Replace(sql, "RLZ_DT_HOJE", "GETDATE()")
				    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				
				    If Not isNull(objrsx.Fields.Item("DIFERENCA_TOTAL").Value) Then
					    str = objrsx.Fields.Item("DIFERENCA_TOTAL").Value
				    Else
					    str = ""
				    End If
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
			 If str_texto = "1" then
                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>" & str & "</td>"
            Else
			    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' x:num='"& str &"' ></td>"
            End If
		    objrsx.Close()		
		Case "ARQ"              
              If objrsx.State = adStateOpen Then objrsx.Close
              cod_arq = CInt(Right(Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value), 4))
              campo_arq = "CD_TIPO_DOCTO" & cod_arq
              campo_arq2 = "STR_CRIPTOGRAFADO" &  cod_arq
              If fnc_TestaVar(objrs.Fields.Item(campo_arq).Value) then
                str= "<a href='https://www.myindaiaweb.com.br/popup/ver_arquivos.asp?cod=" & objrs.Fields.Item(campo_arq2).Value & "' target='_blank'><img src='https://www.myindaiaweb.com.br/imagens/open.gif' border=0 alt='Ver Arquivo(s)'></a>"  
              Else
                str = ""
              End If
                vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='center'>"& str &"</td>"	
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
                Case "0860" 'status do processo (todos)
				    If objrsx.State = adStateOpen Then objrsx.Close()
				    sql = "SELECT CONVERT(VARCHAR, F.DT_ALTERACAO, 103) AS DT_ETAPA, E.NM_ETAPA "&_
                    " FROM TFOLLOWUP_ETAPA F (NOLOCK) "&_
                    " INNER JOIN TETAPA E ON E.CD_ETAPA = F.CD_ETAPA "&_
                    " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                    " ORDER BY DT_ALTERACAO  "
				    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				    'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")
				    str = ""
				    If objrsx.RecordCount > 0 Then
					    'descrição que será exibida
					    Do While Not objrsx.Eof
						    str = str & Trim(objrsx.Fields.Item("DT_ETAPA").Value) & " - " & Trim(objrsx.Fields.Item("NM_ETAPA").Value)
						    objrsx.MoveNext
						    If objrsx.Eof Then Exit Do Else str = str &"<br>"
					    Loop 
				    End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"						  
				    objrsx.Close
				Case "0548" 'código da rap
					vTxExcel = vTxExcel&fncExibeRap(2, nr_processo)
  			Case "0560" 'qtde de faturas por processo
	  			vTxExcel = vTxExcel&fncEmbalagemExp(2)
  			Case "0577" 'qtde de faturas por processo
	   			vTxExcel = vTxExcel&fncQtdeFaturasExp(2)
            Case "0471"
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT ISNULL(S.NM_SERVICO, SN.NM_SERVICO) AS NM_SERVICO "&_
						" FROM TPROCESSO  PR (NOLOCK) "&_
                        " LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = PR.CD_SERVICO " &_
                        " LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO)  " &_
						" WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
            Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
            str = objrsx.Fields.Item("NM_SERVICO").Value	
            vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
            objrsx.Close()	
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
                     Case "0964","0965","0966", "1042", "1043" 'ENTRADA DE CONTAINER NO ARMAZÉM
                Dim campo_cntr
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT NR_CNTR, CONVERT(VARCHAR, DT_SAIDA_FABR, 103) AS DT_SAIDA_FABR, CONVERT(VARCHAR, DT_ENTREGA_FABRICA, 103) AS DT_ENTREGA_FABRICA, "&_
                      " CONVERT(VARCHAR, DT_ENTRADA_PATIO_TRANSP, 103) AS DT_ENTRADA_PATIO_TRANSP, NR_LACRE, TARA_CNTR FROM TPROCESSO_CNTR "&_
					  " WHERE NR_PROCESSO= '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                str=""
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0964" Then campo_cntr = "DT_ENTRADA_PATIO_TRANSP"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0965" Then campo_cntr = "DT_ENTREGA_FABRICA"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0966" Then campo_cntr = "DT_SAIDA_FABR"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1042" Then campo_cntr = "NR_LACRE"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1043" Then campo_cntr = "TARA_CNTR"

				If objrsx.RecordCount > 0 Then
		  		Do While Not objrsx.Eof
						str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)& " - " &Trim(objrsx.Fields.Item(campo_cntr).Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"					
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
			
			
			
			
			
			Case "2339" ' Nr. Chave de acesso DUE
			 If objrsx.state = adstateOpen then objrsx.close()
						sql = "SELECT ISNULL ((SELECT ISNULL(CD_CHAVE_ACESSO_DUE,'Sem chave') AS CHAVE_DUE" &_ 
								  " FROM BROKER.DBO.TPROCESSO_EXP ( NOLOCK )"&_
								   " WHERE NR_PROCESSO ='"& nr_processo & "' ), 'Sem chave') AS CHAVE_DUE"
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
            str=""
			str= Trim(objrsx.Fields.item("CHAVE_DUE").Value)
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
				Case "1013"
                  If objrsx.state = adstateOpen then objrsx.close()	
                  sql = " SELECT E.NM_ETAPA "&_
                  "  FROM BROKER.DBO.TFOLLOWUP_ETAPA FE "&_
                  "    INNER JOIN BROKER.DBO.TETAPA E (NOLOCK) ON E.CD_ETAPA = FE.CD_ETAPA"&_
                  "  WHERE FE.NR_PROCESSO = '"& nr_processo &"'  "&_
                  "    AND E.IN_RETRABALHO = '1'"&_
                  "    AND E.IN_ATIVO = '1'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str = ""
                    If objrsx.eof then
					  str="-"
				    else
					   Do While Not objrsx.Eof
						str = str &Trim(objrsx.Fields.Item("NM_ETAPA").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					  Loop	
				    End If		
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"		
                    objrsx.Close() 	
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
                                If nm_campo_rel = "DT_EV003DE" Then
                                vTxExcel = vTxExcel&fncExibeDataEventoFupAlerta(3, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value, objrs.Fields.Item("VALIDA_DATA_DT_EV003").Value)
                                Else
								vTxExcel = vTxExcel&fncExibeDataEventoFupAlerta(3, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value, objrs.Fields.Item("VALIDA_DATA_"&nm_campo_rel).Value)
                                End If
							else
								vTxExcel = vTxExcel&fncExibeDataPadrao(2, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
							end if
						Case "2" 'exibe os campos com valor decimal
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 3)
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
  objtxt.WriteLine("    <td class='gridsub' style='width:200px;'>"& objrs.RecordCount &" registros encontrados</td>")
  for i = 1 to nr_cols -1
    objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
  next
  objtxt.WriteLine("  </tr>")
	
  objtxt.WriteLine("</table></body></html>")
  objtxt.Close()
	
	if objrs.Eof then
		sql = "UPDATE TRELATORIOS SET TX_ARQUIVO = '"&arquivo&"' "&_
					"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
					"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = '"& nr_ident & "'"
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
<%If in_envia_agora <> "1" Then %>
<div id="textInLoad" style="position:absolute; top:50; left:38;">
<table width="170" height="70" border="1" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center"><span class="style1">CARREGANDO...</span><br>
			por favor aguarde, o relatório esta sendo criado.</td>
	</tr>
</table>
</div>
<%
End If
'Response.Flush()
'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"
'verifica se o arquivo já foi criado
If in_alerta <> "1" and in_envia_agora <> "1" Then   
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_alerta_exp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_alerta_exp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'gera o nome do arquivo
	If in_alerta <> "1" Then
	    vTxArquivo = "Alerta"& Replace(cd_view,"-", "_") &".xls"
    Else
        vTxArquivo = "Alerta"& Replace(cd_view,"-", "_") &".xls"
    End If
	
	Call subGeraExcel(vTxCaminho, vTxArquivo)
Else
    If Not fnc_TestaVar(Session("sql_alerta_exp_track")) Then
      'dados básicos do relatório
    
      sql_s =  "SELECT DISTINCT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE,PR.CD_IMPORTADOR, ISNULL(PR.IN_COURRIER,0) AS IN_COURRIER, ISNULL(PR.IN_PRODUTO_IMPORTADO,0) AS IN_PRODUTO_IMPORTADO , "
      If tp_relat=1 then '1=Pedido 0-embarque
    sql_s=sql_s & " PEI.NR_PROC_PE, PEI.NR_ITEM, "
  End If

  If tp_relat=3 then '1=Pedido 0-embarque
    sql_s=sql_s & " NR_PEDIDO AS NR_PEDIDO_EXP,  "
  end if  
  
	
      'tabelas da busca
      sql_f = " FROM TREL_EXP_TRACK R (NOLOCK) "&_
					    "  INNER JOIN TPROCESSO           PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					    "  LEFT  JOIN TFLP_EXPORT1        FE (NOLOCK) ON (FE.NR_PROCESSO = R.NR_PROCESSO) "&_
                        "  LEFT  JOIN TFLP_EXPORT2        FE2 (NOLOCK) ON (FE2.NR_PROCESSO = R.NR_PROCESSO) "&_
					    "  LEFT  JOIN TPROCESSO_EXP       PE (NOLOCK) ON (PE.NR_PROCESSO = R.NR_PROCESSO) "&_
					    "  LEFT  JOIN TPROCESSO_EXP_SAQUE SQ (NOLOCK) ON (SQ.NR_PROCESSO = R.NR_PROCESSO) "

    if fnc_testaVar(cd_arquivos) Then
                        cd_arquivos_array = Split(cd_arquivos, ";")
                        For I = 0 to UBound(cd_arquivos_array)-1
                            sql_s = sql_s & "  PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO AS CD_TIPO_DOCTO" & cd_arquivos_array(I) & ", MASTER.DBO.FN_CRIPROGRAFA(RTRIM(PR.NR_PROCESSO) + ';' + CONVERT(VARCHAR, PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO)) AS STR_CRIPTOGRAFADO" & cd_arquivos_array(I) & ", "
                            sql_f = sql_f & "  LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS PD" & cd_arquivos_array(I) & " (NOLOCK) ON (PD" & cd_arquivos_array(I) & ".NR_PROCESSO = PR.NR_PROCESSO) AND PD" & cd_arquivos_array(I) & ".IN_ATIVO = '1' AND PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO = " & cd_arquivos_array(I) & " " 
                        Next
                    End If

    					
   If tp_relat= 1 or tp_relat = 3  then ' 1=Pedido 0-embarque
    sql_f = sql_f & "  LEFT JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON (PEI.NR_PROCESSO = R.NR_PROCESSO) " 
End if 
	    'requisitos da pesquisa
	    sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario")&"' AND R.NR_IDENT = '"& nr_ident &"' "
	    'ordenação dos registros  
	    sql_o = "ORDER BY "
	
	    If fnc_TestaVar(tp_quebra) Then
		    if tp_quebra = 4 Then
			    sql_o = sql_o & " PR." & tipo_quebra( tp_quebra ) &" ASC, "
		    Else
			    sql_o = sql_o & " R." & tipo_quebra( tp_quebra ) &" ASC, "
		    End If
	    End If
	
	If fnc_TestaVar(cd_ordenacao_view) and InStr(cd_ordenacao_view, "X") = 0 Then
        If tp_ordenacao_view = 0 Then dados_tp_ordem = " ASC" Else dados_tp_ordem = " DESC"      
        dados_ordem = Split(cd_ordenacao_view, "%")
	    tx_dados_ordem = dados_ordem(1) & dados_tp_ordem
	    sql_o = sql_o &	tx_dados_ordem
    Else
        sql_o = sql_o &" R.NR_PROCESSO ASC"
    End If
	    'Response.Redirect("../IMPORT/teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

	    '**************************************************************************************************
	    'inicia a montagem dos campos que serão selecionados
	    '**************************************************************************************************	
	    If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	    Do While Not objrsv.Eof
		    If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
		    '*=======================================================================================================
		    '- Início Verifica o tipo de consulta
		    '*=======================================================================================================

			    Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") 
							    Case "00","02","50"'String - Tabela Direto, Array
								    sql_s = sql_s &_
									    " ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
									    'Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")

						      '============================================================================================
							    Case "01","21","31","41"'String - Tipo de consulta = Lookup //CÉLULA//
								    sql_s = sql_s &_
									    " ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									    "   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									    "   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									    " ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
									    'If objrsv.Fields.Item("M10_CD_DADO").Value="0049" then
									      ' Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")
									    'end if
						      '============================================================================================
							    Case "10"'Data
								    If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
									    'datas de follow-up de desembaraço
									    sql_s = sql_s &_
													" RLZ_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" PVT_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" IN_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &"  AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
                                                    If objrsv.Fields.Item("M10_AP_CAMPO").Value = "DT_EV003DE" Then
                                                      sql_s = sql_s & " CASE WHEN CONVERT(DATETIME, CONVERT(VARCHAR, EFT_DT_EV003, 103), 103) + 2 >= CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) THEN 1 ELSE 0 END AS VALIDA_DATA_DT_EV003, "
                                                    Else
                                                      sql_s = sql_s & " CASE WHEN CONVERT(DATETIME, CONVERT(VARCHAR, EFT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", 103), 103) + 2 >= CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) THEN 1 ELSE 0 END AS VALIDA_DATA_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
                                                    End If                                                   
                                                    
								    Else
									    'Outras datas vindas de outras tabelas
									    sql_s = sql_s &_
													    " "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								    End If
						      '============================================================================================
							    Case "20","30"'Decimal, Moeda
								    Select Case objrsv.Fields.Item("M10_CD_DADO").Value
										    Case "0063","0173" 'Peso liquido/bruto
												    sql_s = sql_s &_
												    " ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
										    Case Else
											    sql_s = sql_s &_
												    " ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								    End Select
						      '============================================================================================
							    Case "40"'Inteiro
								    sql_s = sql_s &_
									    " ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							    Case "04"'String - Tipo de Consulta com INNER JOIN e sem WHERE
							    sql_s = sql_s &_
								    "(SELECT TOP 1 UPPER("& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								    ")  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
								    ") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			    End Select
			    If objrsv.Fields.Item("M10_CD_DADO").Value = "0716" Then
				    sql_f = sql_f&" LEFT JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON (CH.CD_CLIENTE = R.CD_CLIENTE AND CH.CD_PRODUTO = PR.CD_PRODUTO AND CH.CD_UNID_NEG = PR.CD_UNID_NEG) "
			    End If	'*=======================================================================================================
		    '- Fim Verifica o tipo de consulta
		    '*=======================================================================================================
		    End If
		    objrsv.MoveNext
		    If objrsv.Eof Then Exit Do
	    Loop
	    sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	    'finaliza a construção do select do relatório e salva na Session
	    Session("sql_alerta_exp_track") = sql_s & sql_f & sql_w & sql_o    
    End If

    if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_alerta_exp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_alerta_exp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'gera o nome do arquivo
    vTxArquivo = "Alerta"& Replace(cd_view,"-", "_") &".xls"
	
	Call subGeraExcel(vTxCaminho, vTxArquivo)

    if in_envia_agora = "1" then
      Set objEmail = CreateObject("CDO.Message")
      str = "<html>"
      str = str & "<body style=''font-family:Calibri;''>"
      str = str & "<IMG SRC=https://www.myindaiaweb.com.br/imagens/logo2012_2.jpg><br>"
      str = str & "<IMG SRC=https://www.myindaiaweb.com.br/imagens/barra_tracking.gif><br><br>"

      Select Case Hour(Now)
		Case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11
			str = str & tx_lang_A00060(cd_lang)
		Case 12, 13, 14, 15, 16, 17
			str = str & tx_lang_A00061(cd_lang)
		Case Else
			str = str & tx_lang_A00062(cd_lang)
	  End Select

      str = str & "<br>Esta é uma mensagem gerada automaticamente pelo MyIndaiá.<br>"
      str = str & "Por favor, não responda esse e-mail.<br>"
      str = str & "Caso tenha dúvidas ou se desejar não receber mais esta mensagem, favor entrar em contato com <b>myindaia@myindaia.com.br</b>.<br><br>"
      str = str & "Obrigado,<br>"
      str = str & "<b>Departamento de TI</b><br>"
      str = str & "<IMG SRC=https://www.myindaiaweb.com.br/imagens/logo_indaia.gif><br>"
      str = str & "<IMG SRC=https://www.myindaiaweb.com.br/imagens/recicle2.jpg><br>"
      str = str & "</html>"
      str = str & "</body>"

      If objrsx.state = adstateOpen then objrsx.close()
	  sql = "SELECT M06_NM_VIEW FROM M06_VIEW WHERE M06_CD_VIEW = '" & cd_view & "'"
	  objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
      nm_view = objrsx("M06_NM_VIEW")
      If objrsx.state = adstateOpen then objrsx.close()  

      objEmail.From 		= "alertasweb@myindaia.com.br"
      objEmail.ReplyTo      = "alertasweb@myindaia.com.br"
      objEmail.To 		=  Session("nm_email") 
      objEmail.CC 		= ""
      objEmail.Subject 	= "[myIndaiáWeb] " & nm_view
      objEmail.MIMEFormatted = true
      objEmail.HTMLBody  	= str
      objEmail.AddAttachment(vTxCaminho&vTxArquivo)
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.indaialogistica.com.br" 
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "alertasweb@myindaia.com.br"
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = ""
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
      objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
      objEmail.Configuration.Fields.Update
      if SQLSERVER <> "ANTUERPIA" Then
        objEmail.Send
      End If  

      %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="vertical-align:top;">
					<tr height="100" valign="top">
						<td align="center">
                            <br /><br />
							<strong><img src="/imagens/icones/16x16/ok20.gif" border="0" align="absmiddle">&nbsp;<%=tx_lang_POP111(cd_lang)%></strong><br>											   
							<br>												
						</td>
					</tr>
				</table>
<%
        set objEmail = nothing  
        Response.end
     End If 
End If

%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Planilha Excel<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="https://www.myindaiaweb.com.br/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
				aqui</b></a>.</p></td>
	</tr>
	<tr>
		<td height="35" align="center"><input type="button" class="button" value="X Fechar" onClick="javascript:window.close();"></td>
	</tr>
</table>
</body>
</html>
<% If in_envia_agora <> "1" and in_alerta <> "1" Then %>
<script language="javascript">
<!--
    textInLoad.style.display = "none";
    window.focus();
    window.open('https://www.myindaiaweb.com.br/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>', 'download')
-->
</script>
<%End If%>