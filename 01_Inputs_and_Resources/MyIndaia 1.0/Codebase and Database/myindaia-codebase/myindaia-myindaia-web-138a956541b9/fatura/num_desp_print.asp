<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Fatura: Numerario x Despesas Pagas
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 09/02/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim objrsf   'objejo para armazenar dados do faturamento
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
Dim hmt_num   'estrutura html para exibir o numerário
Dim hmt_desp  'estrutura html para exibir as despesas
Dim hmt_saldo 'estrutura html para exibir o saldo

Set objrsf = Server.CreateObject("ADODB.RecordSet")

in_show = False
cd_tela = "FAT004"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_faturado = Request.QueryString("in_faturado")
If Not fnc_TestaVar(in_faturado) Then in_faturado = "X"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_fat_num_desp")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.fonte {
	font-size: 8px;
}
</style>
</head>
<body style="overflow: auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table width="100%" border="0" cellspacing="1" cellpadding="0">
	<tr class="pgridtit">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
		<td <% If in_dt_prev Then Response.Write("colspan='3'")%> height="15" class="pgridtit"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	Else
%>
		<td <% If in_dt_prev Then Response.Write("rowspan='2'")%> class="pgridtit"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
		<td <% If in_dt_prev Then Response.Write("rowspan='2'")%>><table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td colspan="2" class="pgridtit"><%= tx_lang_A00073(cd_lang)%></td>
				</tr>
				<tr>
					<td align="center" class='fonte'><%= tx_lang_A00077(cd_lang)%></td>
					<td align="center" class='fonte'><%= tx_lang_A00078(cd_lang)%></td>
				</tr>
			</table></td>
		<td <% If in_dt_prev Then Response.Write("rowspan='2'")%> class="pgridtit"><%= tx_lang_A00074(cd_lang)%></td>
		<td <% If in_dt_prev Then Response.Write("rowspan='2'")%> class="pgridtit"><%= tx_lang_A00075(cd_lang)%></td>
	</tr>
	<%
If in_dt_prev Then
%>
	<tr height="15" class="pgridsub" align="center">
		<%
	For x = 1 to nr_data
%>
		<td width="100" class='fonte'><%= tx_lang_A00033(cd_lang)%></td>
		<td width="50" class='fonte'><%= tx_lang_A00034(cd_lang)%></td>
		<td width="100" class='fonte'><%= tx_lang_A00035(cd_lang)%></td>
		<%
	Next
%>
	</tr>
	<%
Else
	cont = 0
End If

cd_campo_quebra = ""
nr_proc_quebra  = ""
objrsv.MoveFirst
'zera as variaveis que conteram os totais
vl_total_num   = 0
vl_total_desp  = 0
vl_total_saldo = 0
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
  'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
  If fnc_TestaVar( tp_quebra ) Then
    'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
	<tr>
		<td height="20" colspan="<%= nr_cols + 3%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
	</tr>
	<%
    End If
    cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
  End If
%>
	<tr height="15">
		<%
  If objrsv.Eof Then objrsv.MoveFirst
	  
  Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
	    	nr_processo = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid( nr_processo, 5, Len(nr_processo) )%>&nbsp;</nobr></td>
		<%
	  	Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					str = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = "referências"& vbcrlf
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					Else
						nr_referencia = Null
						str = Null
					End If
					objrsx.Close()
				End If
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= nr_referencia%>&nbsp;</nobr></td>
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
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="left" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
		  		Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						x = Null
						y = Null
						z = Null
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						
						If (Not fnc_TestaVar(w)) or (w = 0) Then
							x = "-" 'data prevista
							y = "Não Aplicável" 'data realizada
							z = "-" 'diferença de dias
							color = "#999999"   'cor da fonte
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
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									z = "+"& z
									color = "#FF0000" 'vermelho
								End If
							End If
						End If
						
						If in_dt_prev Then
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
		    		x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 4 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
		  		Case "4" 'exibe os campos com valor inteiro
		    		If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
						  matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
		  			  w = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
				      y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
						  x = fnc_DiasUteisKPI(objrs.Fields.Item(w).Value, objrs.Fields.Item(y).Value, Request.QueryString("in_dias_util"))
						Else
						  x = objrs.Fields.Item(nm_campo_rel).Value
						End If
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(x) < 20
		  			  x = "#"& x
				  	Loop
					  	x = Replace(x, "#", "&nbsp;")
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
				End Select
    End Select
		objrsv.MoveNext
    If objrsv.Eof Then Exit Do
  Loop
	
	If nr_proc_quebra <> objrs.Fields.Item("NR_PROCESSO").Value Then
		hmt_num   = Null 
		hmt_desp  = Null
		hmt_saldo = Null
		nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
		
		Do While nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
			vl_desp   = 0
			vl_num    = 0
			vl_saldo  = 0
			nr_processo  = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
			nr_solic_fat = Trim(objrs.Fields.Item("NR_SOLIC_FAT").Value)
			
			If Not fnc_TestaVar(nr_solic_fat) Then
				str = " IS NULL "
			Else
				str = " = "& fnc_QuotedSQL(nr_solic_fat)
			End If
			'::::: CALCULO DE NUMERARIO :::::
			in_num  = False
			vl_item = 0
			in_restitui = False
			sql = "SELECT MAX(DT_LANCAMENTO) AS DT_LANCAMENTO, ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
						"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
						"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
						"  AND NR_SOLIC_FAT "& str &_
						"  AND IN_CANCELADO = 0 "&_
						"  AND ( "& fnc_QuotedSQL(in_faturado) &" IN ( IN_FATURADO, 'X' ) ) "&_
						"  AND CD_ITEM = '991' "
			'Response.Write(sql &"<br>")
			objrsf.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			'seleciona os itens restituidos
			If objrsf.RecordCount > 0 Then
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_RESTITUI "&_
							"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
							"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
							"  AND NR_SOLIC_FAT "& str &_
							"  AND IN_CANCELADO = 0 "&_
							"  AND ( "& fnc_QuotedSQL(in_faturado) &" IN ( IN_FATURADO, 'X' ) ) "&_
							"  AND CD_ITEM IN ( '992', '993' ) "
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 0 Then in_restitui = True
				
				vl_item = objrsf.Fields.Item("VL_ITEM").Value
				If in_restitui Then
					vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
				End If
				vl_num = vl_num + vl_item
				
				If Round(vl_item) > 0 Then
					hmt_num = hmt_num &_
						"<tr height='15'><td align='center' class='fonte'><nobr>&nbsp;"& fnc_Mascara(objrsf.Fields.Item("DT_LANCAMENTO").Value, 5) &"&nbsp;</nobr></td>"&_
						"<td align='right' class='fonte'><nobr>&nbsp;"& FormatCurrency(vl_item, 2) &"&nbsp;</nobr></td></tr>"
				  in_num = True
				End If
				objrsx.Close()
			End If
			objrsf.Close()
			vl_total_num = vl_total_num + vl_num
			
			'::::: CALCULO DE DESPESAS  :::::
			in_desp = False
			vl_item = 0
			in_restitui = False
			sql = "SELECT ISNULL(SUM(F.VL_ITEM), 0) AS VL_ITEM "&_
						"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
						"WHERE F.CD_ITEM = I.CD_ITEM "&_
						"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
						"  AND F.NR_SOLIC_FAT "& str &_
						"  AND F.IN_CANCELADO = 0 "&_
						"  AND F.IN_RESTITUI  = 0 "&_
						"  AND ( "& fnc_QuotedSQL(in_faturado) &" IN ( F.IN_FATURADO, 'X' ) ) "&_
						"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
						"  AND F.CD_ITEM < 900 "&_
						"	 AND I.CD_TIPO_ITEM <> 'N' "&_
						"GROUP BY F.NR_PROCESSO, F.NR_SOLIC_FAT "
			'Response.Write(sql &"<br>")
			objrsf.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsf.RecordCount > 0 Then
				'seleciona os itens restituidos
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
							"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
							"WHERE F.CD_ITEM = I.CD_ITEM "&_
							"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
							"  AND F.NR_SOLIC_FAT "& str &_
							"  AND F.IN_CANCELADO = 0 "&_
							"  AND F.IN_RESTITUI  = 1 "&_
							"  AND ( "& fnc_QuotedSQL(in_faturado) &" IN ( F.IN_FATURADO, 'X' ) ) "&_
							"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
							"  AND F.CD_ITEM < 900 "&_
							"	 AND I.CD_TIPO_ITEM <> 'N' "&_
							"GROUP BY F.NR_PROCESSO, F.NR_SOLIC_FAT"
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 0 Then in_restitui = True
				
				vl_item = objrsf.Fields.Item("VL_ITEM").Value
				If in_restitui Then
					vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
				End If
				vl_desp = vl_desp + vl_item
				
				If Round(vl_item) > 0 Then
					hmt_desp = hmt_desp &_
						"<tr height='15'><td align='right' class='fonte'><nobr>&nbsp;"& FormatCurrency(vl_item, 2) &"&nbsp;</nobr></td></tr>"
				  in_desp = True
				End If
				objrsx.Close()
			End If
			objrsf.Close()
			vl_total_desp = vl_total_desp + vl_desp
			
			'::::: CALCULO DO SALDO     :::::
			vl_item = 0
			num     = 0
			vl_saldo = vl_num - vl_desp
			vl_saldo = Round(vl_saldo, 2)
			If Not fnc_TestaVar(vl_saldo) or vl_saldo = 0 Then
				vl_saldo = 0
			Else
				If vl_saldo > 0 Then
					sql = "SELECT CD_ITEM, VL_ITEM, DT_LANCAMENTO "&_
								"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
								"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
								"  AND IN_CANCELADO = 0 "&_
								"  AND CD_ITEM = '997' "&_
								"  AND VL_ITEM = "& Replace(Abs(vl_saldo), ",", ".")
				End If
				If vl_saldo < 0 Then
					sql = "SELECT CD_ITEM, VL_ITEM, DT_LANCAMENTO "&_
								"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
								"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
								"  AND IN_CANCELADO = 0 "&_
								"  AND CD_ITEM = '998' "&_
								"  AND VL_ITEM = "& Replace(Abs(vl_saldo), ",", ".")
				End If
				'Response.Write(sql &"<br>")
				objrsf.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsf.RecordCount > 0 Then
					vl_item = objrsf.Fields.Item("VL_ITEM").Value
					'verifica se o tipo de saldo é devedor ou credor e faz a liquidação
					If objrsf.Fields.Item("CD_ITEM").Value = "997" Then
						vl_saldo = vl_saldo - vl_item
					End If
					If objrsf.Fields.Item("CD_ITEM").Value = "998" Then
						vl_saldo = vl_saldo + vl_item
					End If
					'num = objrsf.Fields.Item("VL_ITEM").Value
				End If
				objrsf.Close
			End If
			vl_total_saldo = vl_total_saldo + vl_saldo
			
			If Round(vl_saldo, 0) < 0 Then
				color = "color=#FF0000;"
			Else
				color = "color=#0000FF;"
			End If
			
			If in_num or in_desp Then
				hmt_saldo = hmt_saldo &_
					"<tr height='15'><td align='right' class='fonte'><nobr><span style='"& color &"'>&nbsp;"& FormatCurrency(vl_saldo, 2) &"&nbsp;</span></nobr></td></tr>"
			End If
			
			If (Not in_num) and in_desp Then
				hmt_num = hmt_num &"<tr height='15'><td>&nbsp;</td><td>&nbsp;</td></tr>"
			End If
			If in_num and (Not in_desp) Then
				hmt_desp = hmt_desp &"<tr height='15'><td>&nbsp;</td></tr>"
			End If

			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
%>
		<td valign="top" class="pgridsub"><table width="100%" cellpadding="0" cellspacing="0" border="0">
				<%= hmt_num%>
			</table></td>
		<td valign="top" class="pgridsub"><table width="100%" cellpadding="0" cellspacing="0" border="0">
				<%= hmt_desp%>
			</table></td>
		<td valign="top" class="pgridsub"><table width="100%" cellpadding="0" cellspacing="0" border="0">
				<%= hmt_saldo%>
			</table></td>
			<%
		objrs.MovePrevious
	End If
%>
	</tr>
	<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
	<tr height="20">
		<td colspan="<%= nr_cols%>" align="left" class="pgridbottom"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
		<td align="right" class="pgridbottom"><nobr>&nbsp;<%= FormatCurrency(vl_total_num, 2)%>&nbsp;</nobr></td>
		<td align="right" class="pgridbottom"><nobr>&nbsp;<%= FormatCurrency(vl_total_desp, 2)%>&nbsp;</nobr></td>
		<td align="right" class="pgridbottom"><nobr>&nbsp;<%= FormatCurrency(vl_total_saldo, 2)%>&nbsp;</nobr></td>
	</tr>
	<%
objrsv.Close
objrs.Close

Set objrsf = Nothing
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
