<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação: Custo
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 19/06/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim col_0 'qtde de colunas com informações básicas
Dim col_1 'qtde de colunas com valores de despesas
Dim col_2 'qtde de colunas com valores da DI
Dim col_3 'qtde de colunas com valores totais
Dim vl_linha     'valor total da referencia/item no processo
Dim nr_qtd_cols_vl 'qtde de colunas com valor monetário  
Dim vl_col_proc()  'valor total da coluna do processo
Dim vl_col_quebra()'valor total da coluna da quebra de registro
Dim vl_col_total() 'valor total da coluna

in_show = False
cd_tela = "IMP017"
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
col_0 = Request.QueryString("col_0")
col_1 = Request.QueryString("col_1")
col_2 = Request.QueryString("col_2")
col_3 = Request.QueryString("col_3")
If Not fnc_TestaVar(col_0) Then col_0 = 0
If Not fnc_TestaVar(col_1) Then col_1 = 0
If Not fnc_TestaVar(col_2) Then col_2 = 0
If Not fnc_TestaVar(col_3) Then col_3 = 0

nr_qtd_cols_vl = CInt(col_1)+CInt(col_2)+CInt(col_3)
ReDim vl_col_proc(nr_qtd_cols_vl)
ReDim vl_col_quebra(nr_qtd_cols_vl)
ReDim vl_col_total(nr_qtd_cols_vl)

With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_imp_custo")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_custo") &"<br>"
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
	<tr>
		<%
If col_0 > 0 Then
%>
		<td height="20" colspan="<%= col_0%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dados Básicos</td>
		<%
End If

If col_1 > 0 Then
%>
		<td height="20" colspan="<%= col_1%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Despesas</td>
		<%
End If

If col_2 > 0 Then
%>
		<td height="20" colspan="<%= col_2%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valores da D.I.</td>
		<%
End If

If col_3 > 0 Then
%>
		<td height="20" colspan="<%= col_3%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Totais</td>
		<%
End If
%>
	</tr>
	<tr class="pgridtit">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
		<td<% If in_dt_prev Then Response.Write(" colspan='3'")%> height="15"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	Else
%>
		<td<% If in_dt_prev Then Response.Write(" rowspan='2'")%>><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
	</tr>
	<%
If in_dt_prev Then
%>
	<tr height="15" class="pgridsub">
		<%
	For x = 1 to nr_data
%>
		<td><%= tx_lang_A00033(cd_lang)%></td>
		<td><%= tx_lang_A00034(cd_lang)%></td>
		<td><%= tx_lang_A00035(cd_lang)%></td>
		<%
	Next
%>
	</tr>
	<%
End If

cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
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
	vl_linha = 0
	num = 0
%>
	<tr>
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	Do While Not objrsv.Eof
		nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'dados do prcesso
		nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
		nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
		
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= Mid(nr_processo, 5, Len(nr_processo))%>&nbsp;</nobr></td>
		<%
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
%>
         <td class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%			
			
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
			Case "0017" 'canal de liberacao
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 4
%>
		<td align="center" class="pgridsub"><img src="/imagens/icones/16x16/tp_canal_<%= Trim(str)%>.gif" width="17" height="16"></td>
		<%
			Case "0018" 'nr. da referencia
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
		<%
			Case "0019" 'nr. item da referencia
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
		<%
			Case "0045" 'Exibe o nr. da viagem com mascara
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 4)%>&nbsp;</nobr></td>
		<%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(M.NM_MERCADORIA, DM.TX_DESC_DET_MERC) AS TX_MERCADORIA, "&_
							"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA, "&_
								"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
								"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
								"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
									"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
									"FROM TPROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Left(Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value,"""","'")), 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'"))
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
				Else
					str = "Descrição não Disponível."
				End If
%>
		<td align="left" class="pgridsub" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
				objrsx.Close
			Case "0283" 'Exibe o nr. da DI com mascara
%>
		<td align="right" class="pgridsub"><nobr><%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 1)%></nobr></td>
		<%
			Case "0407" 'valor da comissão
				sql = "SELECT ISNULL( SUM( DISTINCT VL_ITEM_AREA ), 0 ) AS VL_COMISSAO "&_
							"FROM TFAT_CALCULO_RATEIO_DESP F ( NOLOCK ) "&_
							"  INNER JOIN TITEM I ( NOLOCK ) ON ( I.CD_ITEM = F.CD_ITEM ) "&_
							"WHERE F.NR_PROCESSO   = '"& nr_processo &"' "&_
							"  AND F.CD_REFERENCIA = '"& nr_referencia &"/"& nr_item_clnte &"' "&_
							"  AND I.CD_TIPO_ITEM  = 'R'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				x = objrsx.Fields.Item("VL_COMISSAO").Value
				vl_linha = vl_linha + x
				'vl_col_proc(num)   = vl_col_proc(num)   + x
				'vl_col_quebra(num) = vl_col_quebra(num) + x
				'vl_col_total(num)  = vl_col_total(num)  + x
				num = num + 1
%>
		<td align="right" class="pgridsub"><nobr><%= FormatNumber(objrsx.Fields.Item("VL_COMISSAO").Value, 2)%></nobr></td>
		<%
				objrsx.Close
			Case "0408" 'valor total da linha
				'vl_col_proc(num)   = vl_col_proc(num)   + vl_linha
				'vl_col_quebra(num) = vl_col_quebra(num) + vl_linha
				'vl_col_total(num)  = vl_col_total(num)  + vl_linha
				num = num + 1
%>
		<td align="right" class="pgridsub"><nobr><%= FormatNumber(vl_linha, 2)%></nobr></td>
		<%
'----------------------------------- 22/04/2008

			Case "0457" 'qtde total de mercadoria
%>
						<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item(nm_campo_rel).Value, 2)%>&nbsp;</nobr></td>
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
						str = str &"<nobr>"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='1' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreContainer('"& nr_processo &"');"">"&_
								"<img src='/imagens/icones/16x16/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
						<%
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
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='0' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreCargaSolta('"& nr_processo &"');"">"&_
								"<img src='/imagens/icones/16x16/pallet.gif' width=22 height=15 border=0 alt='"& tx_lang_A00043(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
						<%
				objrsx.Close()

			Case "0458" 'quantidade do pedido/unidade de medida
				sql = "SELECT NM_UNID_MEDIDA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close()
					sql = "SELECT NM_UNID_MEDIDA "&_
								"FROM TPO_ITEM I (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
								"WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_UNID_MEDIDA  = U.CD_UNID_MEDIDA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount < 1 Then
						objrsx.Close()
						sql = "SELECT '0' AS QT_INICIAL, '' AS NM_UNID_MEDIDA"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
%>
						<td align="right"><nobr>&nbsp;<%= objrsx.Fields.Item(nm_campo_rel).Value%>&nbsp;</nobr></td>
						<%
			objrsx.Close()
			Case "0610" ' Ordem ( Manutenção do processo ) 14/04/2008
				  sql="SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE WHERE TP_REFERENCIA = '02' AND NR_PROCESSO = '"& nr_processo &"'"
				  objrsx.Open sql, objcnn, adOpenStatic, adLockReadonly, adCmdText
				 'response.Redirect("teste.asp?var1="&SQL&"")
				   If objrsx.eof then
					  str="-"
					Else
					  str=objrsx.fields.item(nm_campo_rel).value					
					End If
				  'response.Redirect("teste.asp?var1="&objrsx.fields.item("CD_REFERENCIA").value&"")%>
				  <td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "0608" ' Condição de pagamento 14/04/2008
			sql="select CD_MODALIDADE_PAGTO,TP.DESCRICAO AS DESCRICAO from tdeclaracao_importacao TI INNER JOIN TMODALID_PAGAMENTO TP (NOLOCK) ON  TI.CD_MODALIDADE_PAGTO = TP.CODIGO"
			objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DESCRICAO").value					
			End If
			'response.Redirect("teste.asp?var1="&nm_campo_rel&"")%>
			<td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "0611"
			     sql="select DT_FATURA from  tdocumento_instrucao where CD_TIPO_DCTO_INSTR = '01' and NR_PROCESSO =  '"& nr_processo &"'"
			 	 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DT_FATURA").value					
			End If%>
			<td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "0442" 'taxa SISCOMEX
			     sql="select VL_TX_SCX_ITEM, VL_TAXA_SISCOMEX from TFATURAMENTO_RATEIO where NR_PROCESSO =  '"& nr_processo &"' and NR_REFERENCIA=  '"& nr_referencia &"' and NR_ITEM_CLIENTE=  '"& nr_item_clnte&"'"
			 	 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			'response.Redirect("teste.asp?var1="&objrsx.fields.item("VL_TAXA_SISCOMEX").value&"")
			If objrsx.eof then
				str="-"
			Else
			    If objrsx.fields.item("VL_TAXA_SISCOMEX").value=0 or isnull(objrsx.fields.item("VL_TAXA_SISCOMEX").value) then
					str=objrsx.fields.item("VL_TX_SCX_ITEM").value		
			    Else
					str=objrsx.fields.item("VL_TAXA_SISCOMEX").value		
			    End If
			End If%>
			<td align="right"><nobr>&nbsp;<%=FormatNumber(str,2)%>&nbsp;</nobr></td>				
<%			objrsx.Close()
			'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")
		
'----------------------------------- 22/04/2008
		
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(str) Then str = "&nbsp;"
%>
		<td align="left" class="pgridsub"><nobr><%= str%></nobr></td>
		<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
						y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
						z = Null
						
						If in_dt_prev Then
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
								color = "#999999"   'cor da fonte
							Else
								'se a data prevista existir
								If IsDate(x) Then
									'se a data realizada existir
									If IsDate(y) Then
										z = fnc_DiasUteisKPI(x, y, 0)
									Else
										z = fnc_DiasUteisKPI(x, Date(), 0)
									End If
									'muda a cor do lead-time conforme o resultado
									If z < 0 Then 
										color = "#0000FF" 'azul
									ElseIf z > 0 Then
										z = "+"& z
										color = "#FF0000" 'vermelho
									End If
								End If
							End If
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</nobr></td>
		<td align="center" class="pgridsub"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
		<%
						End If
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara( y, 5 )%></font>&nbsp;</nobr></td>
		<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
					Case "3" 'exibe os campos com valor monetário
						'soma do processo varia de acordo com o Incoterm
						x = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(x) Then x = 0
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
						'vl_col_proc(num)   = vl_col_proc(num)   + x
						'vl_col_quebra(num) = vl_col_quebra(num) + x
						'vl_col_total(num)  = vl_col_total(num)  + x
						num = num + 1
						x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
					Case "4" 'exibe os campos com valor inteiro
						If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
							matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
							x = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
							y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
							z = fnc_DiasUteisKPI(objrs.Fields.Item("RLZ_"& x).Value, objrs.Fields.Item("RLZ_"& y).Value, 0)
						Else
							z = objrs.Fields.Item(nm_campo_rel).Value
						End If
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(z) < 10
							z = "#"& z
						Loop
						z = Replace(z, "#", "&nbsp;")
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
		<%
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
	</tr>
	<%
	objrs.MoveNext
	If objrs.Eof Then
		Response.Write("<tr>")
		Response.Write("  <td colspan='"& col_0 &"' class='pgridtotal'>&nbsp;</td>")
		For num = 0 To Ubound(vl_col_total)-1
			Response.Write("  <td class='pgridtotal'>"& FormatNumber(vl_col_total(num), 2) &"&nbsp;</td>")
		Next
		Response.Write("</tr>")
		Exit Do
	Else
		
	End If
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