<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação: Metrics por Embarque
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Alexandre Gonçalves Neto
'Criado: 05/01/2006
'
'Manutenção: 02/06/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "IMP023"
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
	.CommandText    = Session("sql_imp_kpi")
	.CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_kpi") &"<br>"
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
	<tr class="pgridtit">
		<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
%>
		<td><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
		<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
	</tr>
	<%
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
%>
	<tr>
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
				str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid( str, 5, Len(str) )%>&nbsp;</nobr></td>
		<%
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
		<%
			Case "0017" 'canal de liberação
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
		<td align="center" class="pgridsub">&nbsp;<img src="/imagens/icones/16x16/tp_canal_<%= Trim(x)%>.gif" width="17" height="16">&nbsp;</td>
		<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr.Referencia - Item
				str = ""
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					nr_item_clnte = ""
					str = nr_referencia & nr_item_clnte
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
							nr_item_clnte = Trim(objrsx.Fields.Item("NR_ITEM_PO").Value)
							str = str & nr_referencia &"/"& nr_item_clnte
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & "<br>"
						Loop
					End If
				End If
%>
		<td align="left" class="pgridsub"><%= str%></td>
		<%
				objrsx.Close()
			Case "0062" 'Fornecedor
				If objrsx.State = 1 Then objrsx.Close()
				'seleciona o fornecedor da referencia exibida. Tem de verificar se o fornecedor é o exportador.
				sql = "SELECT DISTINCT CD_EXPORTADOR, "&_
							" ( SELECT NM_EMPRESA FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = DM.CD_EXPORTADOR ) AS NM_FORNECEDOR "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ) "&_
							"WHERE DM.NR_PROCESSO = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				Do While Not objrsx.Eof
					str = str &"<nobr>"& Trim( objrsx.Fields.Item(nm_campo_rel).Value ) &"</nobr>"
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str = str &";<br>"
				Loop
				objrsx.MoveFirst
%>
		<td align="left" class="pgridsub"><%= str%></td>
		<%
				objrsx.Close()
			Case "0064","0067" 'Valor FOB(Na Moeda/R$)
				'verifica se o frete é prepaid, se for subtrai o valor do frete do FOB
				If objrs.Fields.Item("TP_FRETE").Value = "1" Then
					'frete prepaid
					x = objrs.Fields.Item(nm_campo_rel).Value
					y = objrs.Fields.Item("VL_TOTAL_FRETE_MNEG").Value
					'converte para moeda nacional
					y = y * objrs.Fields.Item("TX_FRETE").Value
					'verifica qual campo será exibido e retorna o valor do frete
					If objrsv.Fields.Item("M10_CD_DADO").Value = "0067" Then
						'subtrai o frete e mantém o valor na moeda nacional
						z = (x - y)
					Else
						'converte para moeda nacional o mle
						x = x * objrs.Fields.Item("TX_MLE").Value
						'subtrai o frete e convete para a moeda negociada
						If objrs.Fields.Item("TX_MLE").Value > 0 Then
							z = (x - y) / objrs.Fields.Item("TX_MLE").Value
						Else
							z = y
						End If
					End If
				Else
					'frete collect
					z = objrs.Fields.Item(nm_campo_rel).Value
				End If
				
				If fnc_TestaVar(z) Then z = FormatCurrency( z, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
		<%
			Case "0066" 'Tipo de Frete ( Collect/Prepaid )
				x = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(x) Then x = tipo_frete(x) Else x = "Não especificado"
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
			Case "0170" 'qtde e tipo de Container
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
							"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "&_
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
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "&_
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
 							  "                   WHERE NR_PROCESSO   = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"') "
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
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= fnc_Mascara( objrs.Fields.Item(nm_campo_rel).Value, 5 )%>&nbsp;</nobr></td>
		<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
		<td align="right" class="pgridsub"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
		<%
					Case "4" 'exibe os campos com valor inteiro
						z = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(z) Then z = "" 
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
	If objrs.Eof Then Exit Do
Loop
%>
	<tr height="15">
		<td colspan="<%= nr_cols%>" align="left" class="pgridbottom"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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
