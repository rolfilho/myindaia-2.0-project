<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 07/02/2008 - Flávio 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo do desembaraco
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
dim Descontos,chk_frete,chk_seguro,check_Fob,tx_dolar,tx_mle ' variáveis para checagem de calculos FOB
dim Deadline
dim dt_inicial, dt_final


cd_tela = "EXC001"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_ident = Request.QueryString("nr_ident")
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")

Sub subGeraExcel(caminho, arquivo)
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
	
	nrec = 0
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
		nr_proc_des   = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
		nr_proc_adm   = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
		If Not fnc_TestaVar(nr_processo) Then nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
		nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value )
		nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value )
		cd_empresa    = Trim(objrs.Fields.Item("CD_EMPRESA").Value )
		'altera a cor da linha
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	if tp_relat<>0 then
		nr_parcial    = Trim(objrs.Fields.Item("NR_PARCIAL").Value) 
		if objrs("nr_parcial")=0 then bgcolor ="#00FFFF" end if 
	end if
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td></tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
	
		vTxExcel = "  <tr height='15'>"
		
		If in_doctos Then
	  'verifica se os documendo já foram enviados
			If fnc_TestaVar(nr_proc_adm) Then in_proc_adm = objFSO.FolderExists(Server.MapPath("/docs/"& nr_proc_adm)) Else in_proc_adm = False 
			If fnc_TestaVar(nr_proc_des) Then in_proc_des = objFSO.FolderExists(Server.MapPath("/docs/"& nr_proc_des)) Else in_proc_des = False
			If in_proc_adm or in_proc_des Then
			vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"' class='texto'><nobr>"& tx_lang_004074(cd_lang) &"</nobr></td>"
			Else
			vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"' class='texto'><nobr>"& tx_lang_A00059(cd_lang) &"</nobr></td>"
			End If
		End If
		
		'inicia uma nova linha de registro
		If objrsv.Eof Then objrsv.MoveFirst
		
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>"& Mid( str, 5, Len(str) ) &"</td>"
				Case "0015" 'Tipo de contâiner
					vTxExcel = vTxExcel&fncExibeTipoContr(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case "0017" 'canal de liberacao
					vTxExcel = vTxExcel&fncExibeCanal(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case "0018" 'nr. da referencia
			If tp_relat = 0 then 	
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
					" FROM TREF_CLIENTE ( NOLOCK ) "&_
					" WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
					" AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
					" ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					nr_referencia = ""
					If objrsx.RecordCount > 0 Then
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						nr_referencia = nr_referencia & Trim(objrsx.Fields.Item(nm_campo_rel).Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia & "<br>"
					Loop
					End If				
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>" 
			Else			
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>" 
			End If
				Case "0019" 'nr. item da referencia
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>"& nr_item_clnte &"</td>"
				Case "0062" 'fornecedor da DI ou Exportador do Detalhe mercadoria
					str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then
						If objrsx.State = adStateOpen Then objrsx.Close()
							'seleciona a referencia de acordo com o tipo
						sql = "SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) "&_
									" WHERE CD_EMPRESA = (SELECT TOP 1 CD_EXPORTADOR "&_
									"                       FROM TDETALHE_MERCADORIA ( NOLOCK ) "&_
									"                      WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = Trim(objrsx.Fields.Item("NM_EMPRESA").Value)
						Else
							str = "&nbsp;"
						End If
						objrsx.Close()
					End If
					'escreve no excel
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
'------------------------------------------0064 Total FOB 14/04/2008,17/04/08, - 0628 INCLUIDO EM 28/7/08
			Case "0064","0628"
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select IN_EMBUT_FRT_ITENS,IN_EMBUT_SEG_ITENS,CONVERT(DECIMAL(16,6),isnull(tx_mle,tx_dolar)) as tx_mle,CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" 
					    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					Else
						If objrsx("IN_EMBUT_FRT_ITENS").Value=true  then chk_frete="1" else chk_frete="0" end if
						If objrsx("IN_EMBUT_SEG_ITENS").value=true  then chk_seguro="1" else chk_seguro="0" end if
						check_Fob=chk_frete+chk_seguro
						tx_mle=FormatNumber(objrsx.Fields.Item("tx_mle").Value,6)
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						'tx_dolar=objrsx.Fields.Item("tx_dolar").Value
						'response.Redirect("teste.asp?var1="&objrsx.Fields.Item("tx_mle").Value&"")
						'--------------------- objrsx que traz os valores de frete e seguro
						If objrsx.state=adstateOpen then objrsx.close()
						sql="SELECT ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN)),0) AS VALOR_PURO, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0)))),0) AS VALOR_SEM_FRETE, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-VL_SEGURO_ITEM_MN)),0) AS VALOR_SEM_SEGURO, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0))-VL_SEGURO_ITEM_MN)),0) AS VALOR_SEM_FRETE_SEGURO "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						'----------------------------------------------------------------------------------------------------			
						'response.Redirect("teste.asp?var1="&sql&"")
						Select case check_Fob
							Case "00" 'Seguro e frete não estão embutidos 
								 str = FormatNumber(objrsx.Fields.Item("VALOR_PURO").Value,2)
							Case "01"  'Frete não embutido e seguro embutido
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_SEGURO").Value,2)
							Case "11"  'Seguro e frete embutidos
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_FRETE_SEGURO").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
							Case "10"  'Frete embutido e seguro não
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_FRETE").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
						End Select
						'response.Redirect("teste.asp?var1="&str&"")
						If objrsv.Fields.Item("M10_CD_DADO").Value = "0064" then
							if tx_mle = 0 then str = 0 else str = str / tx_mle
						else
							str = str / tx_dolar
						end if
						str=FormatNumber(str,2)
					    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& FormatNumber(str,2) &"</td>"
			
						objrsx.Close()
					End If
'------------------------------------------0067 Total FOB

				Case "0094","0096","0097","0098","0099","0100","0101","0374","0678" 'Nr. do Pedido/Referencia
					'verifica o tipo de relatório
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, ISNULL( NR_ITEM_PO, 0) AS NR_ITEM_PO "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string
					str = ""
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &", "
						Loop
					End If
					'escreve no excel
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					'fecha a consulta
					objrsx.Close()
					
				Case "0686" 'Planejador
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT P.NM_PLANEJADOR AS PLANEJADOR "&_
					" FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
                    " LEFT  JOIN TMERCADORIA M (NOLOCK) ON (M.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
					" INNER JOIN TPLANEJADORES P (NOLOCK) ON (P.CD_PLANEJADOR = M.CD_PLANEJADOR) "&_
                    " WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					If tp_relat <> 0 then
						objrsx.Close
						sql = "SELECT P.NM_PLANEJADOR AS PLANEJADOR "&_
							  " FROM TPO_ITEM I (NOLOCK)"&_
							  " LEFT JOIN TMERCADORIA M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
							  " INNER JOIN TPLANEJADORES P (NOLOCK) ON (P.CD_PLANEJADOR = M.CD_PLANEJADOR) "&_
							  " WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							  " AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"&_
							  " AND I.CD_EMPRESA = '"& cd_empresa &"'" 
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("PLANEJADOR").Value)
				End If
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				objrsx.Close	

				Case "0084","0543" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DM.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA, "&_
								"  ISNULL(DM.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
								"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
								"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "
					If tp_relat <> 0 then
						sql = sql &_
									"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
									"  AND DM.CD_EMPRESA  = '"& cd_empresa &"' "&_
									"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
					End If
					'Response.Write(sql &"<br>")
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
					If objrsx.RecordCount < 1 Then
						If tp_relat <> 0 then
							objrsx.Close
							sql = "SELECT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA, "&_
										"  ISNULL(I.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
										"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
										"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
										"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
										"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
										"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
							'Response.Write(sql &"<br>")
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						End If
	
						If objrsx.RecordCount < 1 Then
							objrsx.Close
							sql = "SELECT 'não cadastrado' AS CD_MERCADORIA, ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA, '' AS CD_NCM_SH "&_
										"FROM TPROCESSO ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = '"& nr_processo &"' "
							'Response.Write(sql &"<br>")
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						End If
					End If
					
					str = ""
					If objrsx.RecordCount > 0 Then
						If objrsv.Fields.Item("M10_CD_DADO").Value = "0084" then
							Do While Not objrsx.Eof
								str = str & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))&_
											" NCM/SH: "&Trim(objrsx.Fields.Item("CD_NCM_SH").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &";<br>"
							Loop
						Else
							Do While Not objrsx.Eof
								str = str & Trim(objrsx.Fields.Item("CD_MERCADORIA").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &";<br>"
							Loop
						End If
					Else
						str = "Descrição não cadastrada."
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close
					
				Case "0225" 'Nr. de Li
				If objrsx.state = adStateOpen then objrsx.Close()
				sql = "SELECT DISTINCT NR_LI FROM TPROCESSO_LI ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' AND IN_SUBSTITUIDA = 0 ORDER BY NR_LI"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = Null
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					x = Trim(objrsx.Fields.Item("NR_LI").Value)
					'If objrsx.RecordCount > 1 Then x = x &"<br>"
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				End If
				
				If fnc_TestaVar(x) Then
						vTxExcel = vTxExcel&"<td bgcolor='"& bgcolor &"' class='texto' title='"& str &"'>"& x &"</td>"
				Else
						vTxExcel = vTxExcel&"<td bgcolor='"& bgcolor &"' class='texto'>&nbsp;</td>"
				End If
				objrsx.Close()	
					
				'Flávio em 19/5/2008  ===================================================================	
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
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close
					
					
				Case "0103","0294","0553","0470" 'di retificada
					vTxExcel = vTxExcel&fncExibeSimNao(2, objrs.Fields.Item(nm_campo_rel).Value)
					
				Case "0066" 'tipo de frete
			  	vTxExcel = vTxExcel&fncExibeFrete(2, objrs.Fields.Item(nm_campo_rel).Value)
				
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
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"					
			Case "0672" 'Valor CIF 
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" 
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					Else
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						If objrsx.state=adstateOpen then objrsx.close()
						sql="SELECT ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_BASE_CALC_II)),0) AS VALOR_CIF "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	

						str = FormatNumber(objrsx.Fields.Item("VALOR_CIF").Value,2) / tx_dolar
						str = FormatNumber(str,2)
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"		
						objrsx.Close()
					End If			
			
			Case "0650" 'RETIFICAÇÕES
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
					  " FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
					  " WHERE TP.NR_PROCESSO= '"& nr_processo &"'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					str = ""
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str &Trim(objrsx.Fields.Item("NM_RETIFICACOES").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
'					If objrsx.RecordCount > 0 Then
'		  				str = Trim(objrsx.Fields.Item("NR_CNTR").Value)
'					 Else
'					   str = "&nbsp;"
'					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
			
					
			Case "0046" 'NR CONTAINER --- 28/04/08
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
'					If objrsx.RecordCount > 0 Then
'		  				str = Trim(objrsx.Fields.Item("NR_CNTR").Value)
'					 Else
'					   str = "&nbsp;"
'					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				
					
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
							  On Error Resume Next
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					Else
						str = "&nbsp;"& tx_lang_A00041(cd_lang)
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close()
					
				Case "0663" 'quantidade do pedido/unidade de medida
				str= ""
					sql = "SELECT NM_SIGLA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close()
					sql = "SELECT NM_SIGLA "&_
								"FROM TPO_ITEM I (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
								"WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
								"  AND I.CD_UNID_MEDIDA  = U.CD_UNID_MEDIDA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					If objrsx.RecordCount < 1 Then
					str = "-"	
					Else
					str = objrsx.Fields.Item(nm_campo_rel).Value			
					End If	
				Else
				str = objrsx.Fields.Item(nm_campo_rel).Value
				End If
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;"&  str &"&nbsp;</nobr></td>"

			objrsx.Close()	
			
				Case "0289" 'tipo de pedido
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then
						x = CInt(str) - 1
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& tipo_pedido(x) &"</td>"
					Else
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>n/a</td>"
					End If
					
			Case  "KPIX"
			
			dim data1, data2, dia, total_fds, total_str, sinal
			str = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			"FROM TFLP_IMPORT "
			If tp_relat = 0 then
				sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
			Else
				sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
				" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
				" AND CD_EMPRESA = '" & cd_empresa & "'"&_
				" AND NR_PARCIAL = '" & nr_parcial & "'"		
			End If
			
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText			
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
						" FROM TFLP_IMPORT  "
						If tp_relat = 0 then
							sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
						Else
							sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
							" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
							" AND CD_EMPRESA = '" & cd_empresa & "'"&_
							" AND NR_PARCIAL = '" & nr_parcial & "'"		
						End If
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
				sql = "SELECT " & str & " - ("& sinal & "(SELECT COUNT(*)  FROM TFERIADO WHERE DT_FERIADO BETWEEN RLZ_" & data_dif_inicial &  " AND RLZ_"& data_dif_final &")) - ("& sinal &"" &_
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_IMPORT "
				
				If tp_relat = 0 then
					sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
				Else
					sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
					" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
					" AND CD_EMPRESA = '" & cd_empresa & "'"&_
					" AND NR_PARCIAL = '" & nr_parcial & "'"		
				End If
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
			 vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' x:num='"& str &"' ></td>"
			 objrsx.Close()	
					
			Case "0304","0545"  'qtde embarcada/unidade de medida
					vTxExcel = vTxExcel&fncQtdeMercDIxPO(2, objrsv.Fields.Item("M10_CD_DADO").Value)
			  
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
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close()
			  
			  Case "0581" 'Taxa MLE da adição da DI
  			  vTxExcel = vTxExcel&fncExibeTxMle(2)
				Case "0350" 'Carga Solta / LCL
				If objrsx.State = adStateOpen Then objrsx.Close
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
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close()
				Case "0372" 'Nr. do Processo Administração
					nr_proc_adm = ""
					If tp_relat = 0 Then
						If objrsx.State = adStateOpen Then objrsx.Close
						sql = "SELECT ISNULL(NR_PROCESSO_ADM, '') AS NR_PROCESSO_ADM "&_
									"FROM TESTAGIO_PROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO_DES = '"& objrs.Fields.Item("NR_PROCESSO_DES").Value &"' "&_
									"ORDER BY NR_PROCESSO_ADM"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'agrupa todas as referencias na string para aparecerem como hint
						If objrsx.RecordCount > 0 Then
							'agrupa todas as referencias na string para aparecerem como hint
							Do While Not objrsx.Eof
								nr_proc_adm = nr_proc_adm & Trim(objrsx.Fields.Item("NR_PROCESSO_ADM").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else nr_proc_adm = nr_proc_adm & vbcrlf
							Loop
						End If
						objrsx.Close
					Else
						nr_proc_adm = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					End If
					
					If fnc_TestaVar(nr_proc_adm) Then
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& Mid( nr_proc_adm, 5, 10 ) &"</td>"
					Else
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'></td>"
					End If
				Case "0373" 'Nr. do Processo Desembaraço
					nr_proc_des = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					If fnc_TestaVar(nr_proc_des) Then
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& Mid( nr_proc_des, 5, 10 ) &"</td>"
					Else
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'></td>"
					End If
				Case "0531" 'status do processo
					str = objrs.Fields.Item(nm_campo_rel).Value
					if fnc_TestaVar(str) then str = Trim(str) else str = ""
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				Case "0544" 'Drawback
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = tipo_drawback(CInt(str)) Else str = "n/a"
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				Case "0549" 'Nr. de Nota Fiscal
					If objrsx.State = adStateOpen Then objrsx.Close()
					'sleeciona a referencia de acordo com o tipo
					sql = "SELECT NR_NOTA FROM TPROCESSO_NF ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					x   = Null				
					str = Null
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						x = Trim(objrsx.Fields.Item("NR_NOTA").Value)
						If objrsx.RecordCount > 1 Then x = x &"..."
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim(objrsx.Fields.Item("NR_NOTA").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & "<br>"
						Loop
					Else
						str = "&nbsp;"
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close()
				Case "0550" 'data nota fiscal
					str = objrs.Fields.Item(nm_campo_rel).Value
					vTxExcel = vTxExcel&"    <td align='center'><nobr>&nbsp;" & fnc_Mascara( str, 5 )& "&nbsp;</nobr></td>"
				Case "0551" 'Quantidade de Adições
					'sleeciona a referencia de acordo com o tipo
					sql = "SELECT QT_ADICOES FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = Null
					'passa quantidade
					If objrsx.RecordCount > 0 Then
						str = Trim(objrsx.Fields.Item("QT_ADICOES").Value)
					Else
						str = "&nbsp;" 
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close()					
				Case "0552" 'Quantidade de Itens da DI
					'soma os itens das adições
					sql = "SELECT SUM(QT_ITENS_ADICAO) AS QT_ITENS FROM TADICAO_DE_IMPORTACAO (NOLOCK) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
								" GROUP BY NR_PROCESSO "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = Null
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						str = Trim(objrsx.Fields.Item("QT_ITENS").Value)
					Else
						str = "&nbsp;" 
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
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
 							  "                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
						Else
							str = "&nbsp;"
						End If
						objrsx.Close()
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				Case "0556" 'país de aquisição, caso não tenha na capa pega o primeiro item
					str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then
						If objrsx.State = adStateOpen Then objrsx.Close()
							'seleciona a referencia de acordo com o tipo
						sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
									" WHERE CODIGO = (SELECT TOP 1 CD_PAIS_AQUISICAO "&_
									"                    FROM TDETALHE_MERCADORIA ( NOLOCK ) "&_
									"                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
						Else
							str = "&nbsp;"
						End If
						objrsx.Close()
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"

			 Case "0611" 'Data da Invoice
			  If objrsx.state = adstateOpen then objrsx.close()	
				  sql="select DT_FATURA from tdocumento_instrucao where nr_processo ='"&nr_processo&"'"
				  
				  If Request.Cookies("datas")("flag") = "1" then
					  dt_inicial = Request.Cookies("datas")("dt_inicial")
					  dt_final = Request.Cookies("datas")("dt_final")  
				  
				  sql = sql & " AND DT_FATURA BETWEEN CONVERT(DATETIME, '" & dt_inicial & "', 103)"&_ 
                              " AND CONVERT(DATETIME, '" & dt_final & "', 103)"
				  End if	  
				  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext	
				 'Response.Redirect("teste.asp?var1="&sql&"")
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("DT_FATURA").value
				  End If		  
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					
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
							vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item(nm_campo_rel).Value)
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
 		'If nrec > 30 Then Response.Flush()
		nrec = nrec + 1
	Loop
	objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td colspan='"& nr_cols &"' align='left' class='gridsub'>Foram encontrados "& objrs.RecordCount &" registros.</td>")
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

'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"

'verifica se o arquivo já foi criado
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT TX_ARQUIVO FROM TRELATORIOS (NOLOCK) "&_
			"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
			"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if not fnc_TestaVar(objrs.Fields.Item(0).Value) then
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 300
		.CommandText    = Session("sql_imp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = "TrackingImp"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	'****************************************************************************************************
	
	Call subGeraExcel(vTxCaminho, vTxArquivo)
else
	vTxArquivo = objrs.Fields.Item(0).Value
end if
%>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Planilha Excel<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
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
window.open('/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>','download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->