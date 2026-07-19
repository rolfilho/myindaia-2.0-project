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
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim nr_proc_adm, dir_arquivos 'numero do processo de administração de pedido
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
        If objrsv.Fields.Item("M14_TP_KPI").Value = "0" Then
          kpi_cabec = " (" & tx_lang_CV008(cd_lang) & ") "
          classe_kpi = "gridtit3"
        Else
          kpi_cabec = " (" & tx_lang_CV014(cd_lang) & ") "
          classe_kpi = "gridtit3_1"
        End If
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
	
	nrec = 0
	cd_campo_quebra = ""
    linha_reg = 7
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
		If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
	if tp_relat<>0 then
		nr_parcial    = Trim(objrs.Fields.Item("NR_PARCIAL").Value) 
		if objrs("nr_parcial")=0 then bgcolor ="#00FFFF" end if 
	end if
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td></tr>")
                linha_reg = linha_reg + 1
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
	
		vTxExcel = "  <tr height='15'>"
		
        if objrsx.State = adStateOpen Then objrsx.Close
        sql = "SELECT CONVERT(VARCHAR, DT_FERIADO, 103) AS DT_FERIADO FROM TFERIADO WHERE YEAR(DT_FERIADO) = YEAR(GETDATE())"
        objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly
        If objrsx.RecordCount > 0 Then
            Do while not Objrsx.Eof
                str_feriado = str_feriado & objrsx("DT_FERIADO") 
                objrsx.MoveNext
			    If objrsx.Eof Then Exit Do Else str_feriado = str_feriado & ", "
		    Loop
        End If
        
		If in_doctos Then
		 if objrsx.State = adStateOpen Then objrsx.Close
       sql = "SELECT CONVERT(DATETIME,DT_ABERTURA,103) AS DT_ABERTURA FROM TPROCESSO WHERE NR_PROCESSO = '" & nr_processo & "'" 
       Objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly
	   
	   dir_arquivos = "docs"	
	   If Objrsx.RecordCount > 0 Then
		   If Objrsx.Fields.Item("DT_ABERTURA").Value >= CDate("01/06/2009") Then
			 dir_arquivos = "docs_novo"
		   Else
		     dir_arquivos = "docs"	 
		   End If
		End If
	   if objrsx.State = adStateOpen Then objrsx.Close
		
	  'verifica se os documendo já foram enviados
			If fnc_TestaVar(nr_proc_adm) Then in_proc_adm = objFSO.FolderExists(Server.MapPath("/"&dir_arquivos&"/"& nr_proc_adm)) Else in_proc_adm = False 
			If fnc_TestaVar(nr_proc_des) Then in_proc_des = objFSO.FolderExists(Server.MapPath("/"&dir_arquivos&"/"& nr_proc_des)) Else in_proc_des = False
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
				sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA "&_
					" FROM TREF_CLIENTE ( NOLOCK ) "&_
					" WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
					" AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
					" ORDER BY CD_REFERENCIA"
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
				Case "0748"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(DM.CD_NCM_SH,'') AS CD_NCM_SH "&_
							"FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
							"WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
				str = str & objrsx.Fields.Item("CD_NCM_SH").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close		
			Case "0749"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(DM.TX_DESC_DET_MERC,'') AS NM_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
							"WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & objrsx.Fields.Item("NM_MERCADORIA").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close				
			Case "0750"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT M.NM_MOEDA AS MOEDA "&_
				"FROM TDECLARACAO_IMPORTACAO DI (NOLOCK)  "&_
				"INNER JOIN TMOEDA_BROKER M (NOLOCK) ON M.CD_MOEDA = DI.CD_MOEDA_SEGURO "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & objrsx.Fields.Item("MOEDA").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close	
			Case "0751"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT VL_TOT_SEGURO_MNEG AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
			Do While Not objrsx.Eof
				str = str & FormatNumber(objrsx.Fields.Item("SEGURO").Value,2)
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close
			Case "0752"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT VL_TOTAL_SEG_MN AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & FormatNumber(objrsx.Fields.Item("SEGURO").Value,2)
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close			
			Case "0753"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT PC_SEGURO_MLE AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str &  objrsx.Fields.Item("SEGURO").Value & "%"
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close	
			Case "0754"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT SUM(PL_CARGA) AS CARGA "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
			   str = objrsx.Fields.Item("CARGA").Value
			End If
			vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(str, 1, 4) &"'></td>"
			objrsx.Close	
			Case "0755"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT A.NR_ADICAO, (CD_REGIME_TRIBUTAR + ' - ' + T.DESCRICAO) AS TEXTO"&_
                      " FROM TADICAO_DE_IMPORTACAO A (NOLOCK) "&_
                      " INNER JOIN BROKER.DBO.TREG_TRIBUTARIO T (NOLOCK) ON T.CODIGO = A.CD_REGIME_TRIBUTAR "&_
                      " WHERE A.NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & objrsx.Fields.Item("TEXTO").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"
				objrsx.Close
				Case "0799"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = " SELECT NR_ADICAO, NR_ATO_DRAWBACK AS TEXTO"&_
                      " FROM TADICAO_DE_IMPORTACAO "&_                      
                      " WHERE NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & objrsx.Fields.Item("TEXTO").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>&nbsp;"& str &"</td>"			
			Case "0064","0628"
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select IN_EMBUT_FRT_ITENS,IN_EMBUT_SEG_ITENS,CONVERT(DECIMAL(16,6),isnull(tx_mle,tx_dolar)) as tx_mle,CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="" 
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
						If Session("ncm") <> "" Then
						sql = sql & " AND CD_NCM_SH = '" & Trim(objrs.Fields.Item("NR_NCM").Value) & "'"
						End If
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
					    vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(str, 1, 4) &"'></td>"
			
						objrsx.Close()
					End If
'------------------------------------------0067 Total FOB
                Case "0067"
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select IN_EMBUT_FRT_ITENS,CONVERT(DECIMAL(16,6),isnull(tx_mle,tx_dolar)) as tx_mle from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="" 
					    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					Else
						If objrsx("IN_EMBUT_FRT_ITENS").Value=true  then chk_frete="1" else chk_frete="0" end if
						check_Fob=chk_frete
						tx_mle=FormatNumber(objrsx.Fields.Item("tx_mle").Value,6)
						'response.Redirect("teste.asp?var1="&objrsx.Fields.Item("tx_mle").Value&"")
						'--------------------- objrsx que traz os valores de frete e seguro
						If objrsx.state=adstateOpen then objrsx.close()
						sql="SELECT ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN)),0) AS VALOR_PURO, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0)))),0) AS VALOR_SEM_FRETE "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						
						
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						'----------------------------------------------------------------------------------------------------			
						'response.Redirect("teste.asp?var1="&sql&"")
						Select case check_Fob
							Case "0" 'frete não embutido 
								 str = FormatNumber(objrsx.Fields.Item("VALOR_PURO").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
							Case "1"  'Frete não embutido e seguro embutido
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_FRETE").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
						End Select
						End If
						str=FormatNumber(str,2)
					    vTxExcel = vTxExcel&" <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(str, 1, 4) &"'></td>"
			
						objrsx.Close()
					'End If
					

				Case "0094","0096","0097","0098","0099","0100","0101","0374","0678","0899","2024","2032","2033","2034","2120","2121" 'Nr. do Pedido/Referencia
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

				Case "0084","0543","1052","1053" 'Mercadoria
					'verifica se já existe as mercadorias cadastradas no processo de exportação
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT DM.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA, ISNULL(M.CD_FINALIDADE_MERC,'') CD_FINALIDADE_MERC, "&_
								"  ISNULL(DM.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
								"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
								"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "
					If tp_relat <> 0 then
						sql = sql &_
									"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
									"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
					End If
					'Response.Write(sql &"<br>")
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount < 1 or objrsv.Fields.Item("M10_CD_DADO").Value = "0084" Then
						If tp_relat <> 0 then
							objrsx.Close
							sql = "SELECT DISTINCT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA, ISNULL(M.CD_FINALIDADE_MERC,'') CD_FINALIDADE_MERC, "&_
										"  ISNULL(I.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
										"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
										"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
										"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
										"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
										"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
							'Response.Write(sql &"<br>")
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						End If
	
						If objrsx.RecordCount < 1 or objrsv.Fields.Item("M10_CD_DADO").Value = "0084" Then
							objrsx.Close
							sql = "SELECT 'não cadastrado' AS CD_MERCADORIA, ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA, '' AS CD_NCM_SH, '' CD_FINALIDADE_MERC "&_
										"FROM TPROCESSO ( NOLOCK ) "&_
										"WHERE NR_PROCESSO = '"& nr_processo &"' "
							'Response.Write(sql &"<br>")
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						End If
					End If
					
					str = ""
					If objrsx.RecordCount > 0 Then
						Select Case objrsv.Fields.Item("M10_CD_DADO").Value
					Case "0084"
							Do While Not objrsx.Eof
								If Trim(objrsx.Fields.Item("AP_MERCADORIA").Value) <> "" Then
								str = str & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
								   if Trim(objrsx.Fields.Item("CD_NCM_SH").Value) <> "" Then
								     str = str & " NCM/SH: "&Trim(objrsx.Fields.Item("CD_NCM_SH").Value)
								   End If		
								End If			
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &"<br>"
							Loop
					Case "0543"
							Do While Not objrsx.Eof
								str = str & Trim(objrsx.Fields.Item("CD_MERCADORIA").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &"<br>"
							Loop
					Case "1052"                        
                            Do While Not objrsx.Eof
								str = str & Trim(objrsx.Fields.Item("AP_MERCADORIA").Value)
								objrsx.MoveNext
								If objrsx.Eof Then Exit Do Else str = str &"<br>"
							Loop
                     Case "1053"          
                           str = ""
                            If Trim(objrsx.Fields.Item("CD_FINALIDADE_MERC").Value) <> "" Then             
                            Do While Not objrsx.Eof
                                If objrsf.State = adStateOpen Then objrsf.Close()
                                sql = " SELECT NM_FINALIDADE_MERC FROM BROKER.DBO.TFINALIDADE_MERC WHERE CD_FINALIDADE_MERC = '" & Trim(objrsx.Fields.Item("CD_FINALIDADE_MERC").Value)  & "'"
						        objrsf.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText  
                                if objrsf.RecordCount > 0 Then                        
                                   str = str & Trim(objrsf.Fields.Item("NM_FINALIDADE_MERC").Value)
                                End If
                                objrsf.Close
							    objrsx.MoveNext
							    If objrsx.Eof Then Exit Do Else str = str &"<br>"
						    Loop
                            Else
                              str = ""
                            End If
                       End Select            	
					Else
						str = "Descrição não cadastrada."
					End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					objrsx.Close
					
				Case "0225" 'Nr. de Li
				If objrsx.state = adStateOpen then objrsx.Close()
				sql = "SELECT DISTINCT NR_LI, IN_SUBSTITUIDA, NR_SUBSTITUIDA FROM TPROCESSO_LI ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' ORDER BY NR_LI"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = Null
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					'If objrsx.RecordCount > 1 Then x = x &"<br>"
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						x = Trim(objrsx.Fields.Item("IN_SUBSTITUIDA").Value)
						If x = 0 Then
							str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1)
						Else
							str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1) & " (substitutiva da " &  fnc_Mascara(Trim(objrsx.Fields.Item("NR_SUBSTITUIDA").Value), 1) & ")"
						End If		
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				End If
				
				If fnc_TestaVar(x) Then
						vTxExcel = vTxExcel&"<td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
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
				Case "0567" 
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT VL_MLE_ITEM "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.NR_PARCIAL  = '"& nr_parcial &"' "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
				If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_TOTAL "&_
								" FROM TPO_ITEM I (NOLOCK) "&_
								" WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					If objrsx.RecordCount < 1 Then
						str = FormatNumber(0,2)	
					Else
						if fnc_TestaVar(objrsx.Fields.Item("VL_TOTAL").Value) Then
						  str = FormatNumber(objrsx.Fields.Item("VL_TOTAL").Value,2)
						Else
						  str = FormatNumber(0,2)	
						End If
					End If	
				Else
				str = FormatNumber(objrsx.Fields.Item("VL_MLE_ITEM").Value,2)	
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
			Case "0723","0735"
			    If objrsv.Fields.Item("M10_CD_DADO").Value  = "0723" Then
			      cd_aliq = "0001"
			    Else
			      cd_aliq = "0002"
			    End If 
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT PC_ALIQ_NORM_ADVAL, M.NR_ADICAO "&_
							" FROM TADICAO_DE_IMPORTACAO M (NOLOCK) "&_
							" INNER JOIN TRIBUTO T (NOLOCK) ON (T.NR_PROCESSO = M.NR_PROCESSO AND T.NR_ADICAO = M.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = '" & cd_aliq & "' ) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "' &_
							' "  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							' "  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							' "  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							' "  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							' "  GROUP BY M.NR_ADICAO, PC_ALIQ_NORM_ADVAL"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 0 Then
                  If objrsx.RecordCount > 1 Then				
				    Do While Not objrsx.eof
					  str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item("PC_ALIQ_NORM_ADVAL").Value,2)				
				      objrsx.MoveNext
				      If objrsx.eof Then Exit Do Else str = str & "<br>"
				    Loop
				  Else
					str = FormatNumber(objrsx.Fields.Item("PC_ALIQ_NORM_ADVAL").Value,2)	
				  End If
                End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
           Case "2352","2353"
			    If objrsv.Fields.Item("M10_CD_DADO").Value  = "2352" Then
			      cd_aliq = "0001"
			    Else
			      cd_aliq = "0002"
			    End If 
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT PC_ALIQ_REDUZIDA, M.NR_ADICAO "&_
							" FROM TADICAO_DE_IMPORTACAO M (NOLOCK) "&_
							" INNER JOIN TRIBUTO T (NOLOCK) ON (T.NR_PROCESSO = M.NR_PROCESSO AND T.NR_ADICAO = M.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = '" & cd_aliq & "' ) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' " ' &_
							' "  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							' "  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							' "  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							' "  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							' "  GROUP BY M.NR_ADICAO, PC_ALIQ_NORM_ADVAL"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str=""
                If objrsx.RecordCount > 0 Then
                  If objrsx.RecordCount > 1 Then				
				    Do While Not objrsx.eof
					  str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item("PC_ALIQ_REDUZIDA").Value,2)				
				      objrsx.MoveNext
				      If objrsx.eof Then Exit Do Else str = str & "<br>"
				    Loop
				  Else
					str = FormatNumber(objrsx.Fields.Item("PC_ALIQ_REDUZIDA").Value,2)	
				  End If
                End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				
				
		Case "2354"
			    If objrsv.Fields.Item("M10_CD_DADO").Value  = "2354" Then
			      cd_aliq = "0001"
			    Else
			      cd_aliq = "0002"
			    End If 
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT PC_ALIQ_ACOR_TARIF, M.NR_ADICAO "&_
							" FROM TADICAO_DE_IMPORTACAO M (NOLOCK) "&_
							" INNER JOIN TRIBUTO T (NOLOCK) ON (T.NR_PROCESSO = M.NR_PROCESSO AND T.NR_ADICAO = M.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = '" & cd_aliq & "' ) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' " ' &_
							' "  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							' "  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							' "  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							' "  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							' "  GROUP BY M.NR_ADICAO, PC_ALIQ_NORM_ADVAL"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str=""
                If objrsx.RecordCount > 0 Then
                  If objrsx.RecordCount > 1 Then				
				    Do While Not objrsx.eof
					  str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item("PC_ALIQ_ACOR_TARIF").Value,2)				
				      objrsx.MoveNext
				      If objrsx.eof Then Exit Do Else str = str & "<br>"
				    Loop
				  Else
					str = FormatNumber(objrsx.Fields.Item("PC_ALIQ_ACOR_TARIF").Value,2)	
				  End If
                End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				
            Case "0736","0737","0738"
			   Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			     Case "0736"
				   cd_aliq = "ALIQ_PIS"
				 Case "0737"
				   cd_aliq = "ALIQ_COFINS"
				 Case "0738"
				   cd_aliq = "PC_ICMS"
				 
					   
			   End Select  
			   str = 0
			   If objrsx.State = adStateOpen Then objrsx.Close
			   sql = "SELECT " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							"  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  GROUP BY M.NR_ADICAO, " & cd_aliq
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 1 Then
				str=""
				Do While Not objrsx.eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)				
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>"
				Loop
				Else
					If objrsx.RecordCount > 0 Then
					str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					else
					If objrsx.State = adStateOpen Then objrsx.Close
				    	sql = "SELECT " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "&_
							" WHERE M.NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					    Else
							str = " - "
						End If	
					End If
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>" 
				
				
			Case "2350","2351"
			   Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			     Case "2350"
					   cd_aliq = "ALIQ_PIS_REDUZIDA"
				 Case "2351"
					   cd_aliq = "ALIQ_COFINS_REDUZIDA"
					   
			   End Select  
			   str = 0
			   If objrsx.State = adStateOpen Then objrsx.Close
			   sql = "SELECT ISNULL(" & cd_aliq & ",0) AS " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM BROKER.DBO.TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							"  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  GROUP BY M.NR_ADICAO, " & cd_aliq
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 1 Then
				str=""
				Do While Not objrsx.eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)				
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>"
				Loop
				Else
					If objrsx.RecordCount > 0 Then
					str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					else
					If objrsx.State = adStateOpen Then objrsx.Close
				    	sql = "SELECT " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM BROKER.DBO.TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "&_
							" WHERE M.NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					    Else
							str = " - "
						End If	
					End If
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>" 
        
				Case "0103","0294","0553","0470","0701","2321","2330","2333","2422" 'di retificada
					vTxExcel = vTxExcel&fncExibeSimNao(2, objrs.Fields.Item(nm_campo_rel).Value)
				 Case "0900","0901"
            Dim cd_arm_des, cd_rec, cd_set
			if objrsx.State = adStateOpen then objrsx.Close()
            sql = "SELECT ISNULL(CD_ARMAZEM_DESCARGA,'') AS  CD_ARMAZEM_DESCARGA FROM TPROCESSO WHERE NR_PROCESSO = '" & nr_processo & "'"
            objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
            cd_arm_des = objrsx.Fields.Item("CD_ARMAZEM_DESCARGA").Value	
            objrsx.Close()	

            If cd_arm_des <> "" Then
            sql = "SELECT CD_RECINTO FROM BROKER.DBO.TARMAZEM (NOLOCK) WHERE CD_ARMAZEM = '" & cd_arm_des & "'"
            objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
            If 	objrsx.RecordCount > 0 Then
            cd_rec = objrsx.Fields.Item("CD_RECINTO").Value	
            Else
            cd_rec = ""
            End If 
            objrsx.Close()	

            If objrsv.Fields.Item("M10_CD_DADO").Value = "0901" Then
                sql = "SELECT TOP 1 CD_SETOR FROM BROKER.DBO.TARMAZEM (NOLOCK) WHERE CD_RECINTO = '" & cd_rec & "'"
                objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                If 	objrsx.RecordCount > 0 Then
                cd_set = objrsx.Fields.Item("CD_SETOR").Value	
                Else
                cd_set = ""
                End If
                objrsx.Close()	
                str = cd_set
            Else
                str = cd_rec
            End If
            Else
                str = ""
            End If 
            vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"	
				Case "0066" 'tipo de frete
			  	vTxExcel = vTxExcel&fncExibeFrete(2, objrs.Fields.Item(nm_campo_rel).Value)
				Case "1076"
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(TX_OBS,'') TX_OBS FROM TFLP_PO_ITEM I (nolock) "&_
							" WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
                                "  AND I.NR_PARCIAL      = '"& nr_parcial &"' "&_
                                "  AND I.CD_EVENTO = '022'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Replace(Replace(objrsx.Fields.Item("TX_OBS").Value, "'", "´"), vbcrlf, "<br>")
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
                    Case "1077"
			  If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT ISNULL(TP_STATUS_CRODA, 0) TP_STATUS_CRODA FROM TPO_ITEM I "&_
							" WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
                                "  AND I.NR_PARCIAL      = '"& nr_parcial &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                    'Response.write sql
                    'Response.end

					If objrsx.RecordCount > 0 Then
		  			Select Case objrsx.Fields.Item("TP_STATUS_CRODA").Value                        
                        Case 1
                          str = "ON TIME"
                        Case 2                 
                          str = "RISCO"
                        Case Else
                          str = "&nbsp;"
                    End Select
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
                     Case "2016"
			  If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TOP 1 UPPER(VT.NM_VIA_TRANSPORTE) AS TRANSP "& _
                          " FROM TPO_ITEM I "&_
                          "  INNER JOIN BROKER.DBO.TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = I.ID_CODIGO_INSTR_DESEMB "&_
                          "  INNER JOIN TVIA_TRANSPORTE VT ON VT.CD_VIA_TRANSPORTE = ID.CD_MODAL "&_
						  " WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
						  "  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
						  "  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
                          "  AND I.NR_PARCIAL      = '"& nr_parcial &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                    'Response.write sql
                    'Response.end

					If objrsx.RecordCount > 0 Then
		  			str = objrsx.Fields.Item("TRANSP").Value
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
                    Case "2016"
			  If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TOP 1 UPPER(VT.NM_VIA_TRANSPORTE) AS TRANSP "& _
                          " FROM TPO_ITEM I "&_
                          "  INNER JOIN BROKER.DBO.TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = I.ID_CODIGO_INSTR_DESEMB "&_
                          "  INNER JOIN TVIA_TRANSPORTE VT ON VT.CD_VIA_TRANSPORTE = ID.CD_MODAL "&_
						  " WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
						  "  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
						  "  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
                          "  AND I.NR_PARCIAL      = '"& nr_parcial &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                    'Response.write sql
                    'Response.end

					If objrsx.RecordCount > 0 Then
		  			str = objrsx.Fields.Item("TRANSP").Value
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
                    Case "0930"
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_NOTES "&_
							" WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Replace(Replace(objrsx.Fields.Item("TX_OBSERVACAO").Value, "'", "´"), vbcrlf, "<br>")
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& str &"</td>"
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
				case "0118"
					vTxExcel = vTxExcel&fncExibeTabelaNf(2, objrsv.Fields.Item("M10_CD_DADO").Value, 0)
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
			Case "0961" 'RETIFICAÇÕES
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql =  "SELECT NR_PROCESSO_INSTR FROM TPROCESSO_DI "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					str = ""
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str &Trim(objrsx.Fields.Item("NR_PROCESSO_INSTR").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
			

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
				
				Case "0046" 'NR CONTAINER --- 28/04/08
  				If objrsx.State = adStateOpen Then objrsx.Close()

                Case "0821" 
             If objrsx.State = adStateOpen Then objrsx.Close()
				    str = ""
					sql = "SELECT CONVERT(VARCHAR,MAX(DT_DESOVA),103) AS data FROM tprocesso_cntr "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' " & _
                            " AND DT_DESOVA IS NOT NULL"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					if objrsx.RecordCount > 0 then
					  str = objrsx.Fields.Item("data").Value
					End If
					objrsx.Close()
                    vTxExcel = vTxExcel&fncExibeDataPadrao(2, str)
	
				Case "0050" 'free time
				    str= ""
    				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TOP 1 NR_FREE_TIME AS NR_FREE_TIME FROM tprocesso_cntr "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					
					if objrsx.RecordCount > 0 then
					  str = objrsx.Fields.Item("NR_FREE_TIME").Value
					End If
					objrsx.Close()
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				
					
				Case "0170" 'qtde e tipo de Container
				If objrsx.State = adStateOpen Then objrsx.Close
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
				If tp_relat = 0 then 
					sql = "SELECT NM_SIGLA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				Else
					sql = "SELECT NM_SIGLA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				End If			
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
			
			dim data1, data1_aux, data2, dia, total_fds, total_str, sinal
			str = ""
            str_texto = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			"FROM TFLP_IMPORT1 F1 "&_
            "  LEFT JOIN TFLP_IMPORT2 F2 (NOLOCK) "
			If tp_relat = 0 then
				sql = sql & " ON F2.NR_PROCESSO_DES = F1.NR_PROCESSO_DES "&_
				" WHERE F1.NR_PROCESSO_DES = '" & nr_processo & "'"
			Else
				sql = sql & " ON F2.NR_REFERENCIA = F1.NR_REFERENCIA "&_
                " AND F2.NR_ITEM_CLIENTE = F1.NR_ITEM_CLIENTE "&_
                " AND F2.CD_EMPRESA = F1.CD_EMPRESA "&_
                " AND F2.NR_PARCIAL = F1.NR_PARCIAL "&_
                " WHERE F1.NR_REFERENCIA = '" & nr_referencia & "'"&_
				" AND F1.NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
				" AND F1.CD_EMPRESA = '" & cd_empresa & "'"&_
				" AND F1.NR_PARCIAL = '" & nr_parcial & "'"		
			End If
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
					    " FROM TFLP_IMPORT1 F1 "&_
                        "  LEFT JOIN TFLP_IMPORT2 F2 (NOLOCK) "
						    If tp_relat = 0 then
							    sql = sql & " ON F2.NR_PROCESSO_DES = F1.NR_PROCESSO_DES "&_
						    " WHERE F1.NR_PROCESSO_DES = '" & nr_processo & "'"
						    Else
							    sql = sql & " ON F2.NR_REFERENCIA = F1.NR_REFERENCIA "&_
                            " AND F2.NR_ITEM_CLIENTE = F1.NR_ITEM_CLIENTE "&_
                            " AND F2.CD_EMPRESA = F1.CD_EMPRESA "&_
                            " AND F2.NR_PARCIAL = F1.NR_PARCIAL "&_
						    " WHERE F1.NR_REFERENCIA = '" & nr_referencia & "'"&_
						    " AND F1.NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
						    " AND F1.CD_EMPRESA = '" & cd_empresa & "'"&_
						    " AND F1.NR_PARCIAL = '" & nr_parcial & "'"		
						    End If
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
				    total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_IMPORT1 F1 "&_
                        "  LEFT JOIN TFLP_IMPORT2 F2 (NOLOCK) "
				
				    If tp_relat = 0 then
					    sql = sql & " ON F2.NR_PROCESSO_DES = F1.NR_PROCESSO_DES "&_
						    " WHERE F1.NR_PROCESSO_DES = '" & nr_processo & "'"
				    Else
					    sql = sql & " ON F2.NR_REFERENCIA = F1.NR_REFERENCIA "&_
                            " AND F2.NR_ITEM_CLIENTE = F1.NR_ITEM_CLIENTE "&_
                            " AND F2.CD_EMPRESA = F1.CD_EMPRESA "&_
                            " AND F2.NR_PARCIAL = F1.NR_PARCIAL "&_
						    " WHERE F1.NR_REFERENCIA = '" & nr_referencia & "'"&_
						    " AND F1.NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
						    " AND F1.CD_EMPRESA = '" & cd_empresa & "'"&_
						    " AND F1.NR_PARCIAL = '" & nr_parcial & "'"	
				    End If
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
                    
                Case "0964","0965","0966", "1042", "1043","2096" 'ENTRADA DE CONTAINER NO ARMAZÉM
                Dim campo_cntr
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT NR_CNTR, CONVERT(VARCHAR, DT_SAIDA_FABR, 103) AS DT_SAIDA_FABR, CONVERT(VARCHAR, DT_ENTREGA_FABRICA, 103) AS DT_ENTREGA_FABRICA, "&_
                      " CONVERT(VARCHAR, DT_ENTRADA_PATIO_TRANSP, 103) AS DT_ENTRADA_PATIO_TRANSP, NR_LACRE, TARA_CNTR, "&_
                      " CONVERT(VARCHAR, DT_ENT_ARM + NR_FREE_TIME, 103) DT_VENC_DEMURRAGE "&_
                      " FROM TPROCESSO_CNTR "&_
					  " WHERE NR_PROCESSO= '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                str=""
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0964" Then campo_cntr = "DT_ENTRADA_PATIO_TRANSP"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0965" Then campo_cntr = "DT_ENTREGA_FABRICA"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0966" Then campo_cntr = "DT_SAIDA_FABR"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1042" Then campo_cntr = "NR_LACRE"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1043" Then campo_cntr = "TARA_CNTR"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "2096" Then campo_cntr = "DT_VENC_DEMURRAGE"

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
			  Case "0902" 'BANDEIRA DO NAVIO
			  If objrsx.state = adstateOpen then objrsx.close()	
				  sql= " SELECT P.DESCRICAO AS NM_PAIS "&_
                  " FROM TPROCESSO PR "& _
                  " INNER JOIN TEMBARCACAO E (NOLOCK) ON E.CD_EMBARCACAO = PR.CD_EMBARCACAO " &_
                  " INNER JOIN TPAIS P (NOLOCK) ON P.CODIGO = E.CD_BANDEIRA " & _
                  "WHERE PR.NR_PROCESSO ='"&nr_processo&"'"
				  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext	
								  
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("NM_PAIS").value
				  End If
				  objrsx.Close()
				 vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
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
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& Mid( nr_proc_des, 5, 12 ) &"</td>"
					Else
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'></td>"
					End If
				Case "0531" 'status do processo
					str = objrs.Fields.Item(nm_campo_rel).Value
					if fnc_TestaVar(str) then str = Trim(str) else str = ""
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
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
                     Case "0831" 
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="" 
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
					Else
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						If objrsx.state=adstateOpen then objrsx.close()
						sql = "SELECT SUM(VL_FRETE_ITEM_MN) AS FRETE "&_
				            " FROM TDETALHE_MERCADORIA DM  "&_
				            " WHERE NR_PROCESSO =  '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	

						str = FormatNumber(objrsx.Fields.Item("FRETE").Value,2) / tx_dolar
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(str, 1, 2) & "'></td>"	
						objrsx.Close()
					End If	
				Case "0550" 'data nota fiscal
					str = objrs.Fields.Item(nm_campo_rel).Value
					vTxExcel = vTxExcel&"    <td align='center'><nobr>&nbsp;" & fnc_Mascara( str, 5 )& "&nbsp;</nobr></td>"
				Case "0551" 'Quantidade de Adições
                If objrsx.State = adStateOpen Then objrsx.Close()
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
					If objrsx.State = adStateOpen Then objrsx.Close()
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
  Case "0877" 'Data da Invoice
			       If objrsx.state = adstateOpen then objrsx.close()	
				  sql="select DT_FATURA from tdocumento_instrucao where nr_processo ='"&nr_processo&"'"
				  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext	
								  
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("DT_FATURA").value
				  End If
				  objrsx.Close()
				  vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
                Case "2131" 'Data da Invoice
			       If objrsx.state = adstateOpen then objrsx.close()	
				  sql="select NR_DCTO_INSTRUCAO from tdocumento_instrucao where nr_processo ='"&nr_processo&"'"
				  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext	
								  
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("NR_DCTO_INSTRUCAO").value
				  End If
				  objrsx.Close()
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
					objrsx.Close()
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
                    objrsx.Close()
                Case "1010"
                  If objrsx.state = adstateOpen then objrsx.close()	
                  sql = " SELECT NR_LI, OA.DESCRICAO "&_
                        " FROM TPROCESSO_LI_ORGAO_ANUENTE LO (NOLOCK) "&_
                        " INNER JOIN TORGAO_ANUENTES OA (NOLOCK) ON OA.CODIGO = LO.CD_ORGAO_ANUENTE "&_
                        " WHERE LO.NR_PROCESSO = '" & nr_processo & "'   "&_
                        " ORDER BY NR_LI DESC, OA.DESCRICAO ASC"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str = ""
                    If objrsx.eof then
					  str="-"
				    else
					  Do While Not objrsx.Eof
						str = str &fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value),1)& " - "&Trim(objrsx.Fields.Item("DESCRICAO").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					  Loop	
				    End If		
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"		
                    objrsx.Close()			
                Case "1011"
                  If objrsx.state = adstateOpen then objrsx.close()	
                  sql = " SELECT NR_LI, OA.DESCRICAO, ISNULL(CONVERT(VARCHAR, LO.DT_DEFERIMENTO, 103),'-') AS DT_DEFERIMENTO "&_
                        " FROM TPROCESSO_LI_ORGAO_ANUENTE LO (NOLOCK) "&_
                        " INNER JOIN TORGAO_ANUENTES OA (NOLOCK) ON OA.CODIGO = LO.CD_ORGAO_ANUENTE "&_
                        " WHERE LO.NR_PROCESSO = '" & nr_processo & "'   "&_
                        " ORDER BY NR_LI DESC, OA.DESCRICAO ASC"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str = ""
                    If objrsx.eof then
					  str="-"
				    else
					   Do While Not objrsx.Eof
						str = str &Trim(objrsx.Fields.Item("DT_DEFERIMENTO").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					  Loop	
				    End If		
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"		
                    objrsx.Close()
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
                Case "1025"
                  If objrsx.state = adstateOpen then objrsx.close()	
                   sql =" SELECT ISNULL(CASE E.IN_MARINHA_MERCANTE_ICMS "&_
                       "             WHEN '1' THEN DI.VL_ICMS_A_RECOLHER_AFRMM  "&_
                       "         ELSE DI2.VL_TOT_ICMS  "&_
                       "         END,0) AS VALOR_ICMS_CLIENTE "&_
                       " FROM TPROCESSO P  "&_
                       " INNER JOIN BROKER.DBO.VW_RESUMO_DI DI ON DI.NR_PROCESSO_COMPLETO = P.NR_PROCESSO "&_
                       " INNER JOIN TDECLARACAO_IMPORTACAO DI2 ON DI2.NR_PROCESSO = P.NR_PROCESSO "&_
                       " INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE "&_
                       " WHERE DI.NR_PROCESSO_COMPLETO = '" & nr_processo & "' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str = ""
                    If Not objrsx.eof then
						str = FormatNumber(objrsx.Fields.Item("VALOR_ICMS_CLIENTE").Value, 4)
				    End If		
                    vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"		
                    objrsx.Close()
                 Case "2133"
                  If objrsx.state = adstateOpen then objrsx.close()	
                   'sql = "SELECT SUM(VL_ITEM) AS VL_MARINHA FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "' and CD_ITEM = '160' AND IN_CANCELADO = 0"
                   sql = "SELECT SUM(VL_AFRMM_ITEM) AS VL_MARINHA FROM BROKER.DBO.TDETALHE_MERCADORIA WHERE NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str=""
                    If fnc_TestaVar(objrsx.Fields.Item("VL_MARINHA").Value) then
						str = FormatNumber(objrsx.Fields.Item("VL_MARINHA").Value, 4)					  
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
								If InStr("838", objrsv.Fields.Item("M10_CD_BROKER").Value) Then
                                  vTxExcel = vTxExcel&fncExibeDataEventoFup(3, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
                                Else
                                  If cd_empresa = "00500"  or cd_empresa = "03185" then
                                    vTxExcel = vTxExcel&fncExibeDataEventoFup(2, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
                                 Else
								    vTxExcel = vTxExcel&fncExibeDataEventoFupAlerta(2, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value, objrs.Fields.Item("VALIDA_DATA_"&nm_campo_rel).Value)
                                  End If
                                End If
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
        linha_reg = linha_reg + 1
		objrs.MoveNext
		If objrs.Eof Then Exit Do
 		'If nrec > 30 Then Response.Flush()
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
					"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = '"& nr_ident & "' "
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
'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"

If in_alerta <> "1" and in_envia_agora <> "1" Then
    'verifica se o arquivo já foi criado
    
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_alerta_imp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_alerta_imp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = "Alerta"& Replace(cd_view,"-", "_") &".xls"
	'****************************************************************************************************	
	Call subGeraExcel(vTxCaminho, vTxArquivo)
Else
    'Session("sql_imp_track") = Null
    If Not fnc_TestaVar(Session("sql_alerta_imp_track")) Then
    'dados básicos do relatório
    Select Case tp_relat
	    Case 0 'desembaraço
		    sql_s = "SELECT DISTINCT "&_
						    "  (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO_DES AND TP_REFERENCIA = '01') AS NR_REFERENCIA, "&_
						    "  (SELECT TOP 1 NR_ITEM_PO FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO_DES AND TP_REFERENCIA = '01') AS NR_ITEM_CLIENTE, "&_
						    "  (SELECT TOP 1 NR_PROCESSO_ADM FROM TESTAGIO_PROCESSO (NOLOCK) WHERE NR_PROCESSO_DES = R.NR_PROCESSO_DES) AS NR_PROCESSO_ADM, "
	    Case 1, 2 'adm , ambos
		    sql_s = "SELECT DISTINCT "&_
						    "  R.NR_REFERENCIA, R.NR_ITEM_CLIENTE, R.DT_ULT_ALTERACAO, R.NR_PROCESSO_ADM, POI.QT_INICIAL, R.NR_PARCIAL, "
			
		    If  tp_relat=1 then  'ADM
  			    sql_w = " AND ((POI.NR_PARCIAL > 0 ) ) "	
		    else  'AMBOS
			    ' sql_w = " AND ( (POI.QT_INICIAL>0 AND POI.NR_PARCIAL = 0) OR (POI.NR_PARCIAL > 0 ) ) "		
		    sql_w = " AND ( (POI.QT_INICIAL>0 AND POI.NR_PARCIAL = 0) OR (POI.NR_PARCIAL > 0 ) or POI.NR_PARCIAL IS NULL) "						  
		    end if 
    End Select
    sql_s = sql_s &"  R.NR_PROCESSO_DES, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, R.CD_EMPRESA, DI.CD_FORNECEDOR, PR.CD_IMPORTADOR, "
	
    If inStr("0611", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 then
	    sql_s = sql_s &"  "& objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
    end if
	
	
    'tabelas da busca

    sql_f = " FROM TREL_IMP_TRACK R (NOLOCK) "&_
				    "  LEFT JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO_DES) "&_
				    "  LEFT JOIN TPROCESSO GP (NOLOCK) ON (GP.NR_PROCESSO = R.NR_PROCESSO_ADM) "&_
				    "  LEFT JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = ISNULL(PR.CD_SERVICO, GP.CD_SERVICO)) "&_
                    "  LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (SN.CD_SERVICO = ISNULL(PR.CD_SERVICO, GP.CD_SERVICO)) "&_
				    "  LEFT JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				    "  LEFT JOIN TPO PO (NOLOCK) ON (PO.NR_PROCESSO = R.NR_REFERENCIA AND PO.CD_EMPRESA = R.CD_CLIENTE) "
				    '"  LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = R.NR_PARCIAL) "&_
				    '"  LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = R.NR_PARCIAL) "
				    '" LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE) "&_
				    '" LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.DT_ULT_ALTERACAO = R.DT_ULT_ALTERACAO) "	
				    
                    if fnc_testaVar(cd_arquivos) Then
                        cd_arquivos_array = Split(cd_arquivos, ";")
                        For I = 0 to UBound(cd_arquivos_array)-1
                            sql_s = sql_s & "  PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO AS CD_TIPO_DOCTO" & cd_arquivos_array(I) & ", MASTER.DBO.FN_CRIPROGRAFA(RTRIM(PR.NR_PROCESSO) + ';' + CONVERT(VARCHAR, PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO)) AS STR_CRIPTOGRAFADO" & cd_arquivos_array(I) & ", "
                            sql_f = sql_f & "  LEFT JOIN BROKER.DBO.TPROCESSO_DOCTOS PD" & cd_arquivos_array(I) & " (NOLOCK) ON (PD" & cd_arquivos_array(I) & ".NR_PROCESSO = PR.NR_PROCESSO) AND PD" & cd_arquivos_array(I) & ".IN_ATIVO = '1' AND PD" & cd_arquivos_array(I) & ".CD_TIPO_DOCTO = " & cd_arquivos_array(I) & " " 
                        Next
                    End If

                    
                    Select Case tp_relat
						Case 0  'desembaraço
								'Response.Redirect("teste.asp?var1="&tp_relat&"")
						     sql_f=sql_f & " LEFT JOIN TFLP_IMPORT1 FI (NOLOCK) ON (FI.NR_PROCESSO_DES = R.NR_PROCESSO_DES AND (ISNULL(R.NR_PROCESSO_ADM,'') = '' OR (ISNULL(R.NR_PROCESSO_ADM,'') <> '' AND ISNULL(R.NR_PROCESSO_ADM,'') = ISNULL(FI.NR_PROCESSO_ADM,''))))  "&_
                                           " LEFT JOIN TFLP_IMPORT2 FI2 (NOLOCK) ON (FI2.NR_PROCESSO_DES = R.NR_PROCESSO_DES AND (ISNULL(R.NR_PROCESSO_ADM,'') = '' OR (ISNULL(R.NR_PROCESSO_ADM,'') <> '' AND ISNULL(R.NR_PROCESSO_ADM,'') = ISNULL(FI2.NR_PROCESSO_ADM,''))))  "&_
							 			   " LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.CD_EMPRESA = R.CD_EMPRESA) "&_
                                           " LEFT JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.NR_PROCESSO = R.NR_PROCESSO_DES AND DM.NR_PROC_PO = R.NR_REFERENCIA AND DM.NR_ITEM_PO = R.NR_ITEM_CLIENTE AND DM.NR_PARCIAL = R.NR_PARCIAL) "	
			   
						Case 1, 2 'adm , ambos
						     sql_f= sql_f & " LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = R.NR_PARCIAL AND POI.CD_EMPRESA = R.CD_EMPRESA) "&_
								   " LEFT JOIN TFLP_IMPORT1 FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = R.NR_PARCIAL AND FI.CD_EMPRESA = R.CD_EMPRESA)"&_	
                                   " LEFT JOIN TFLP_IMPORT2 FI2 (NOLOCK) ON (FI2.NR_REFERENCIA = R.NR_REFERENCIA AND FI2.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI2.NR_PARCIAL = R.NR_PARCIAL AND FI2.CD_EMPRESA = R.CD_EMPRESA)"&_	
                                   " LEFT JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.NR_PROCESSO = R.NR_PROCESSO_DES AND DM.NR_PROC_PO = R.NR_REFERENCIA AND DM.NR_ITEM_PO = R.NR_ITEM_CLIENTE AND DM.NR_PARCIAL = R.NR_PARCIAL) "	
					End Select
					
    If inStr("0611", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 then
	    dt_inicial = Request.Cookies("datas")("dt_inicial")
	    dt_final = Request.Cookies("datas")("dt_final")
	 
	    sql_f= sql_f & " INNER JOIN "& objrsv.Fields.Item("M10_NM_TABELA").Value &" "& objrsv.Fields.Item("M10_CD_ALIAS").Value &_
		                " ON " & objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = R.NR_PROCESSO_DES "&_
					    " AND "& objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &" BETWEEN CONVERT(DATETIME, '" & dt_inicial & "', 103)"&_ 
                        " AND CONVERT(DATETIME, '" & dt_final & "', 103)"
    end if
    'Response.Redirect("teste.asp?var1="&sql_s&sql_f&"")
    'requisitos da pesquisa
    sql_w = "WHERE R.CD_USUARIO ='"& Session("cd_usuario") &"' "&_
				    "  AND R.NR_IDENT   = '"& nr_ident & "' " & sql_w&" "
    ' ordenação dos registros  
    sql_o = "ORDER BY "
	
	
    If fnc_TestaVar(tp_quebra) Then
	    If tp_quebra = 4 then
		    sql_o = sql_o &" PR."& tipo_quebra( tp_quebra ) &" ASC, "
	    Else
		    If tp_quebra = 5 then 
			    sql_o = sql_o &" DI."& tipo_quebra( tp_quebra ) &" ASC, "
		    Else
			    sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
		    End If	
	    End if
    End If
	
    If fnc_TestaVar(cd_ordenacao_view) and InStr(cd_ordenacao_view, "X") = 0 Then
        If tp_ordenacao_view = 0 Then dados_tp_ordem = " ASC" Else dados_tp_ordem = " DESC"      
        dados_ordem = Split(cd_ordenacao_view, "%")
	    tx_dados_ordem = dados_ordem(1) & dados_tp_ordem
	    sql_o = sql_o &	tx_dados_ordem
    Else
        If tp_relat = 0 Then sql_o = sql_o &" R.NR_PROCESSO_DES ASC" 
        If tp_relat = 1 Then sql_o = sql_o &" R.NR_PROCESSO_ADM ASC, R.NR_PARCIAL, R.CD_EMPRESA" 
        If tp_relat = 2 Then sql_o = sql_o &" R.NR_REFERENCIA ASC, R.NR_ITEM_CLIENTE ASC, R.NR_PARCIAL, R.CD_EMPRESA "
    End If

    'inicia a montagem dos campos que serão selecionados
				
    If objrsv.RecordCount > 0 Then objrsv.MoveFirst

    Do While Not objrsv.Eof
	    If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
		    'Tabela Direto
		    If objrsv.Fields.Item("M10_TP_CONSULTA") = "0" Then
			    Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				    Case "0","5" 'String/Text
					    sql_s = sql_s &" ISNULL("&objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value&",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				    Case "1" 'Datetime
					    If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
			            'Response.end
						    'datas de follow-up de desembaraço
						    sql_s = sql_s &_
										    " RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
										    " PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_                                            
										    " IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value  &", "&_
                                            " CASE WHEN CONVERT(DATETIME, CONVERT(VARCHAR, EFT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", 103), 103) + 2 >= CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) THEN 1 ELSE 0 END AS VALIDA_DATA_"& objrsv.Fields.Item("M10_AP_CAMPO").Value& ", "
					    Else
						    'Outras datas vindas de outras tabelas
						    sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					    End If
				    Case "2","3","4" 'Decimal/Moeda/Inteiro
					    sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			    End Select
		    End If
		    'Lookup
		    If objrsv.Fields.Item("M10_TP_CONSULTA") = "1" Then
			    sql_s = sql_s &_
							    "(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
							    "  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							    "  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
							    ") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
		    End If
		    'Array
		    If objrsv.Fields.Item("M10_TP_CONSULTA") = "2" Then
			    sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
		    End If
		    'INNER JOIN
		    If objrsv.Fields.Item("M10_TP_CONSULTA") = "3" Then
			    sql_s = sql_s &_
							    "(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
							    "  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
							    "  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
							    ") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
		    End If
		    'INNER JOIN SEM WHERE
		    If objrsv.Fields.Item("M10_TP_CONSULTA") = "4" Then
		    sql_s = sql_s &_
							    "(SELECT TOP 1 UPPER("& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
							    ")  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
							    ") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
		    End If
			
		    If objrsv.Fields.Item("M10_CD_DADO").Value = "0716" Then
			    sql_f = sql_f&" LEFT JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON (CH.CD_CLIENTE = R.CD_CLIENTE AND CH.CD_PRODUTO = PR.CD_PRODUTO AND CH.CD_UNID_NEG = PR.CD_UNID_NEG) "
		    End If
	    Else
		    'Response.write objrsv.Fields.Item("M10_CD_DADO").Value
		    'Response.end
		    'outros campos que não podem ser montados dinamicamente
		    select case objrsv.Fields.Item("M10_CD_DADO").Value
			    case "0531"
				    sql_s = sql_s&" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				    sql_f = sql_f&" LEFT JOIN VW_ULTIMA_ETAPA EP (NOLOCK) ON (EP.NR_PROCESSO = PR.NR_PROCESSO) "&_
											    " LEFT JOIN VW_ULTIMA_ETAPA_ITEM EI (NOLOCK) ON (EI.NR_PROCESSO = POI.NR_PROCESSO AND EI.NR_ITEM = POI.NR_ITEM AND EI.CD_EMPRESA = POI.CD_EMPRESA) "							
		    end select
	    End If
	    objrsv.MoveNext
	    If objrsv.Eof Then
		    sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
		    Exit Do
	    End If
    Loop
	    'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

    'finaliza a construção do select do relatório e salva na Session
    Session("sql_alerta_imp_track") = sql_s & sql_f & sql_w & sql_o
    End If


    'Response.write Session("sql_alerta_imp_track")
    'Response.end


    if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_alerta_imp_track")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_alerta_imp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly

	    'retorna para o primeiro registro do resultado
	    If objrs.RecordCount  > 0 Then objrs.MoveFirst
	    'retorna para o primeiro registro da personalização
	    If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	    '***************************************************************************************************
	    'gera o nome do arquivo
        vTxArquivo = "Alerta"& Replace(cd_view,"-", "_") &".xls"

	    '****************************************************************************************************
	
	    Call subGeraExcel(vTxCaminho, vTxArquivo)
    
        If in_envia_agora = "1" Then
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
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
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