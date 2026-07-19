<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Financeiro: Volumes
'Arquivo de Script e HTML: Impressão do resultado
'
'Autor Kleber Guedes
'Criado: 02/08/2007
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1200

Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim cdProdutoQuebra
Dim tpProduto

in_show = False
cd_tela = "FAT020"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_volumes")
  .CommandType    = adCmdText
End With
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_track") &"<br>"
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

nrec = 0
cd_campo_quebra = ""
cdProdutoQuebra = ""
objrsv.MoveFirst
TpProduto = Trim(objrs.Fields.Item("CD_PRODUTO").Value)
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	If cdProdutoQuebra <> TpProduto Then
		'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= aTpProduto( CInt(tpProduto) - 1 )%></td>
	</tr>
<%
	End If
 	cdProdutoQuebra = TpProduto
  TpProduto = Trim(objrs.Fields.Item("CD_PRODUTO").Value)

	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
	'quando muda campo definido no tipo de quebra, exibe o valor
	If UCase(cd_campo_quebra) <> UCase(objrs.Fields.Item(tipo_quebra( tp_quebra )).Value) Then
%>
	<tr>
		<td height="20" colspan="<%= nr_cols%>" class="pgridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
	</tr>
	<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
	<tr height="14">
		<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	Do While Not objrsv.Eof
		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		nr_processo  = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
				str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
		<td align="center" class="pgridsub"><nobr>&nbsp;<%= Mid( str, 5, Len(str) )%>&nbsp;</nobr></a></td>
		<%
			Case "0018" 'Nr.Referencia - Item
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
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						nr_referencia = nr_referencia &"&nbsp;"& Trim(objrsx.Fields.Item(nm_campo_rel).Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia &"<br>"
					Loop
				Else
					nr_referencia = "&nbsp;"
				End If
%>
		<td align="left" class="pgridsub"><%= nr_referencia%></a></td>
		<%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0066" 'tipo de frete
				Response.Write(fncExibeFrete(1, objrs.Fields.Item(nm_campo_rel).Value))
			case "0126","0133" 'importador/exportador
				Response.Write(fncImpExp(1, objrs.Fields.Item(nm_campo_rel).Value, Mid(nr_processo, 3, 2)))
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
      Case "0173" 'peso bruto
        Select Case tpProduto
				Case "01", "02"
					If objrsx.State = adStateOpen Then objrsx.Close()
					if tpProduto = "01" then
						sql = "SELECT ISNULL(PB_CARGA, 0) AS VALOR "&_
									" FROM TDECLARACAO_IMPORTACAO (NOLOCK) "&_
									" WHERE NR_PROCESSO = '"& nr_processo &"' "
					elseif tpProduto =  "02" then
						sql = "SELECT ISNULL(VL_PESO_BRUTO, 0) AS VALOR "&_
									" FROM TPROCESSO_EXP (NOLOCK) "&_
									" WHERE NR_PROCESSO = '"& nr_processo &"' "				
					End If 								
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If (objrsx.RecordCount > 0) then
					  if fnc_TestaVar(objrsx.Fields.Item("VALOR").Value) Then
  						str = Trim(objrsx.Fields.Item("VALOR").Value)
            Else
      				str = objrs.Fields.Item(nm_campo_rel).Value
    					if not fnc_TestaVar(str) then  str =  "&nbsp;"						
  					End If
					else
     				str = objrs.Fields.Item(nm_campo_rel).Value
   					if not fnc_TestaVar(str) then  str =  "&nbsp;"						
					End If	
				Case Else	
  				str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then  str =  "&nbsp;"				
				End Select	
				Response.Write(fncExibeNumeroPadrao(1, str, 3))
      Case "0561" 'cubagem
				if tpProduto =  "02" then				
  				If objrsx.State = adStateOpen Then objrsx.Close()

          sql = "SELECT ISNULL(VL_PESO_BRUTO, 0) AS VALOR "&_
					      " FROM TPROCESSO_EXP (NOLOCK) "&_
								" WHERE NR_PROCESSO = '"& nr_processo &"' "				

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If (objrsx.RecordCount > 0) then 
					  if fnc_TestaVar(objrsx.Fields.Item("VALOR").Value) Then
  						str = Trim(objrsx.Fields.Item("VALOR").Value)
  					Else	
  						str = objrs.Fields.Item(nm_campo_rel).Value
  						if not fnc_TestaVar(str) then  str =  "&nbsp;"				
  					End If	
					else
						str = objrs.Fields.Item(nm_campo_rel).Value
						if not fnc_TestaVar(str) then  str =  "&nbsp;"							
					End If	
        else
  				str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then  str =  "&nbsp;"				
				End If 												
				Response.Write(fncExibeNumeroPadrao(1, str, 3))			
			Case "0555" 'país de origem caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
									" WHERE CODIGO = (SELECT TOP 1 ISNULL(CD_PAIS_ORIG_MERC, '') "&_
									"                    FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
									"                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
						Else
							If objrsx.State = adStateOpen Then objrsx.Close()
							'seleciona o país de acordo com o primeiro item da DI
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
						objrsx.Close()
					End If
				End If				
				Response.Write(fncExibeTextoPadrao(1, str))			
			Case "0574" 'valor FOB
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT ISNULL(VL_TOT_MLE_MNEG, 0) AS TOTAL_FOB FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  if fnc_TestaVar(objrsx.Fields.Item("TOTAL_FOB").Value) then
						  str = Trim(objrsx.Fields.Item("TOTAL_FOB").Value)
						  End If
						End If
  					objrsx.Close()
					End If
				End If			
				Response.Write(fncExibeNumeroPadrao(1, str, 2))				  
			Case "0575" 'valor Frete
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT ISNULL(VL_TOTAL_FRETE_MNEG, 0) AS TOTAL_FRETE FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  if fnc_TestaVar(objrsx.Fields.Item("TOTAL_FRETE").Value) then
						  str = Trim(objrsx.Fields.Item("TOTAL_FRETE").Value)
						  End If
						End If
  					objrsx.Close()
					End If
				End If			
				Response.Write(fncExibeNumeroPadrao(1, str, 2))				

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
	'If nrec > 30 Then Response.Flush()
	nrec = nrec + 1
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
