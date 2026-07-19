<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação: Tracking
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 01/05/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1200

Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
dim Descontos,chk_frete,chk_seguro,check_Fob,tx_dolar,tx_mle ' variáveis para checagem de calculos FOB
dim dt_inicial, dt_final

in_show = False
cd_tela = "IMP004"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_imp_track")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_track") &"<br>"
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="overflow: auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
	<%
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
			vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00095(cd_lang)&"</td><td>"&tx_lang_A00096(cd_lang)&"</td><td>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00033(cd_lang)&"</td><td>"&tx_lang_A00034(cd_lang)&"</td><td>"&tx_lang_A00035(cd_lang)&"</td>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else
            vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						nr_cols = nr_cols + 1
					end if
				case else
					vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'exibe a linha com os cabeçalhos
if Len(vTxLinha(0)) > 0 then
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=30 class='pgridtit'>"&vTxLinha(0)&"</tr>")
end if
'exibe a linha com os sub-cabeçalhos
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='pgridsub'>"&vTxLinha(1)&"</tr>")
end if

cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
	nr_proc_des   = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
	nr_proc_adm   = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
	If Not fnc_TestaVar(nr_processo) Then nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
	nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value )
	nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value )
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
	</tr>
	<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
	<tr valign="top">
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização nos registros do relatório
	Do While Not objrsv.Eof
		nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0015" 'Tipo de contâiner
				Response.Write(fncExibeTipoContr(1, objrs.Fields.Item(nm_campo_rel).Value))
			Case "0017" 'canal de liberacao
				Response.Write(fncExibeCanal(1, objrs.Fields.Item(nm_campo_rel).Value))
			Case "0018" 'Nr. do pedido
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
			Case "0019" 'Nr. do item cliente
				If fnc_TestaVar(nr_item_clnte) Then
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
		<%
				Else
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;&nbsp;</nobr></td>
		<%
				End If
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
								  
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("DT_FATURA").value
				  End If

%>
         <td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
         
         <%Case "0650" 'RETIFICAÇÕES
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
					  " FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
					  " WHERE TP.NR_PROCESSO= '"& nr_processo &"'"

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					'Response.write sql
					'Response.end
					
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
					%>

					<td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
         
<%			 					
			Case "0062" 'fornecedor da Di ou Exportador do Detalhe mercadoria
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) "&_
					      " WHERE CD_EMPRESA = (SELECT TOP 1 CD_EXPORTADOR "&_
 	 						  "                      FROM TDETALHE_MERCADORIA ( NOLOCK ) "&_
 							  "                      WHERE NR_PROCESSO   = '"& nr_processo &"') "
  				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Trim(objrsx.Fields.Item("NM_EMPRESA").Value)
				  Else
			  	  str = "&nbsp;"
					End If

				End If
%>
         <td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
         
<%
'------------------------------------------0064 Total FOB 14/04/2008,17/04/08
			Case "0064","0628" ', - 0628 INCLUIDO EM 28/7/08
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select IN_EMBUT_FRT_ITENS,IN_EMBUT_SEG_ITENS,CONVERT(DECIMAL(16,6),isnull(tx_mle,tx_dolar)) as tx_mle,CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" %>
        			<td class="pgridsub"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%
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
						sql="SELECT CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN)) AS VALOR_PURO, "&_
						" CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0)))) AS VALOR_SEM_FRETE, "&_
						" CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-VL_SEGURO_ITEM_MN)) AS VALOR_SEM_SEGURO, "&_
						" CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0))-VL_SEGURO_ITEM_MN)) AS VALOR_SEM_FRETE_SEGURO "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						'----------------------------------------------------------------------------------------------------			
						'response.Redirect("teste.asp?var1="&check_Fob&"")
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
						'response.Redirect("teste.asp?var1="&IsNumeric(tx_mle)&"")
						If objrsv.Fields.Item("M10_CD_DADO").Value = 0064 then
							str=(str/tx_mle)
						else
							str=str/tx_dolar
						end if
						str=FormatNumber(str,2)
%>
        				 <td class="pgridsub"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%			
						objrsx.Close()
					End If
'------------------------------------------0067 Total FOB			
			Case "0094","0096","0097","0098","0099","0100","0101","0374"
				If objrsx.State = adStateOpen Then objrsx.Close()
				'sleeciona a referencia de acordo com o tipo
				sql = "SELECT DISTINCT CD_REFERENCIA, ISNULL( NR_ITEM_PO, 0) AS NR_ITEM_PO "&_
							"FROM TREF_CLIENTE ( NOLOCK ) "&_
							"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO_DES").Value) &_
							"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
							"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = "referência - item"& vbcrlf
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						If CInt(objrsx.Fields.Item("NR_ITEM_PO").Value) > 0 Then str = str &"/"& CInt(objrsx.Fields.Item("NR_ITEM_PO").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				End If
				
				If fnc_TestaVar(x) Then
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
				Else
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;&nbsp;</nobr></td>
		<%
				End If
				If objrsx.State = adStateOpen Then objrsx.Close()
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
							  " AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("PLANEJADOR").Value)
				End If
				%>
			<td align="left" class="pgridsub"><%= str%>&nbsp;</td>
			<%
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
								"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
				End If
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					If tp_relat <> 0 then
						objrsx.Close
						sql = "SELECT I.CD_MERCADORIA, ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA, "&_
									"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA, "&_
									"  ISNULL(I.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
									"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
									"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
									"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
									"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
					
					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT 'não cadastrado' AS CD_MERCADORIA, ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
									"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA, '' AS CD_NCM_SH "&_
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
							str = str &"<nobr>"& Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))&_
										" NCM/SH: "&Trim(objrsx.Fields.Item("CD_NCM_SH").Value) &"</nobr>"
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
%>
			<td align="left" class="pgridsub"><%= str%>&nbsp;</td>
			<%
				objrsx.Close
			Case "0103","0294","0553", "0470" 'sim/não demais campos
				Response.Write(fncExibeSimNao(1, objrs.Fields.Item(nm_campo_rel).Value))
			Case "0130" 'Nr. Fatura Comercial
				str = objrs.Fields.Item("NR_FATURA").Value
				if not fnc_TestaVar(str) then
					sql = "SELECT LTRIM(RTRIM(NR_DCTO_INSTRUCAO)) AS NR_FATURA "&_
								"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
								"  AND NR_DCTO_INSTRUCAO <> '' "&_
								"ORDER BY NR_DCTO_INSTRUCAO"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = ""
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof
							str = str & objrsx.Fields.Item("NR_FATURA").Value
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					End If
					objrsx.Close()
				end if
%>
			<td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
			<%
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
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				Else
					str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
				End If
%>
		<td class="pgridsub"><%= str%></td>
		<%
				objrsx.Close()
			Case "0289" 'tipo de pedido
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then
					x = CInt(str) - 1
%>
		<td align="center" class="pgridsub"><nobr><%= tipo_pedido(x)%></nobr></td>
		<%
				Else
%>
		<td align="center" class="pgridsub"><nobr><%= "n/a"%></nobr></td>
		<%
				End If
			Case "0304","0545" 'qtde embarcada/unidade de medida
				Response.Write(fncQtdeMercDIxPO(1, objrsv.Fields.Item("M10_CD_DADO").Value))
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
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
				End If
%>
		<td class="pgridsub"><%= str%></td>
		<%
				objrsx.Close()
			Case "0372" 'Nr. do Processo Administração
				nr_proc_adm = ""
				tx_proc_adm = ""
				
				If tp_relat = 0 Then
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT ISNULL(NR_PROCESSO_ADM, '') AS NR_PROCESSO_ADM "&_
								"FROM TESTAGIO_PROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO_DES = '"& objrs.Fields.Item("NR_PROCESSO_DES").Value &"' "&_
								"ORDER BY NR_PROCESSO_ADM"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_proc_adm = Trim(objrsx.Fields.Item("NR_PROCESSO_ADM").Value) 
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							tx_proc_adm = tx_proc_adm & Trim(objrsx.Fields.Item("NR_PROCESSO_ADM").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else tx_proc_adm = tx_proc_adm & vbcrlf
						Loop
						tx_proc_adm = " title='"& tx_proc_adm &"'"
					End If
					objrsx.Close
				Else
				  nr_proc_adm = Trim( objrs.Fields.Item(nm_campo_rel).Value )
				End If
				
				If fnc_TestaVar(nr_proc_adm) Then
%>
		<td align="center" class="pgridsub"<%= tx_proc_adm%>><nobr>&nbsp;<%= Mid( nr_proc_adm, 5, Len(nr_proc_adm) )%>&nbsp;</nobr></td>
		<%
				Else
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;&nbsp;</nobr></td>
		<%
				End If
			Case "0373" 'Nr. do Processo Desembaraço
				str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
				If fnc_TestaVar(str) Then
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid( str, 5, Len(str) )%>&nbsp;</nobr></td>
		<%
				Else
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;&nbsp;</nobr></td>
		<%
				End If
			Case "0531" 'status do processo
				str = objrs.Fields.Item(nm_campo_rel).Value
				if fnc_TestaVar(str) then str = Trim(str) else str = "&nbsp;"
%>
						<td class="pgridsub"><nobr><%= str%></nobr></td>
						<%
			Case "0544" 'Drawback
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_drawback(CInt(str)) Else str = "n/a"
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
		
			Case "0549" 'Nr. de Nota Fiscal
				'sleeciona a referencia de acordo com o tipo
				sql = "SELECT NR_NOTA FROM TPROCESSO_NF ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str   = Null				
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("NR_NOTA").Value)
					If objrsx.RecordCount > 1 Then str = str &"..."
				End If
				
				If not fnc_TestaVar(str) Then 
				  str = "&nbsp;"
				End If	
%>
				<td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%		
		  objrsx.Close()
			Case "0550" 'data nota fiscal
			  str = objrs.Fields.Item(nm_campo_rel).Value
%>
       <td class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara( str, 5 )%>&nbsp;</nobr></td>
<%		
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
				
%>
						<td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
				<%
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
				
%>
						<td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
				<%
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
			  
				End If
%>
         <td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%

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
				End If
%>
         <td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%
			Case "0581" 'Taxa MLE da adição da DI
			  Response.Write(fncExibeTxMle(1)) 
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						Response.Write(fncExibeTextoPadrao(1, objrs.Fields.Item(nm_campo_rel).Value))
					Case "1" 'exibe os campos de datas
						'verfica se é data de followup
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then
							Response.Write(fncExibeDataEventoFup(1, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						else
							Response.Write(fncExibeDataPadrao(1, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						end if
					Case "2" 'exibe os campos com valor decimal
						Response.Write(fncExibeNumeroPadrao(1, objrs.Fields.Item(nm_campo_rel).Value, 2))
					Case "3" 'exibe os campos com valor monetário
						Response.Write(fncExibeNumeroPadrao(1, objrs.Fields.Item(nm_campo_rel).Value, 4))
					Case "4" 'exibe os campos com valor inteiro
						Response.Write(fncExibeNumeroPadrao(1, objrs.Fields.Item(nm_campo_rel).Value, 0))
					Case "5" 'exibe os campos do tipo memo
						Response.Write(fncExibeMemoPadrao(1, objrs.Fields.Item(nm_campo_rel).Value))
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
	</tr>
	<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
	<tr>
		<td height="15" colspan="<%= nr_cols%>" align="left" class="pgridbottom"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
	</tr>
	<%
objrsv.Close
objrs.Close
%>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->
