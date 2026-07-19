<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Financeiro Volumes
'
'Autor: Kleber Guedes
'Criado: 31/07/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1200

Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim numz
Dim cdProdutoQuebra
Dim TpProduto

cd_tela  = "EXC004"
cd_menu  = CStr(Request.QueryString("cd_menu"))
cd_subm  = CStr(Request.QueryString("cd_subm"))
cd_view  = CStr(Request.QueryString("cd_view"))
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
nr_cols  = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Sub subGeraExcel(caminho, arquivo)
  Dim objfso 'objeto do sistema de arquivos 
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
						vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=120 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
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
		if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
		objtxt.WriteLine("<tr height=30>"&vTxLinha(0)&"</tr>")
	end if
	'exibe a linha com os sub-titulos
	if Len(vTxLinha(1)) > 0 then
		objtxt.WriteLine("<tr height=15>"&vTxLinha(1)&"</tr>")
	end if
	
	nrec            = 0
	cd_campo_quebra = ""
	cdProdutoQuebra = ""
	TpProduto = Trim(objrs.Fields.Item("CD_PRODUTO").Value)
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If cdProdutoQuebra <> TpProduto Then
			'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
			objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& aTpProduto(CInt(tpProduto) - 1) &"</td></tr>")
		End If
		cdProdutoQuebra = TpProduto
    TpProduto = Trim(objrs.Fields.Item("CD_PRODUTO").Value)

		If fnc_TestaVar( tp_quebra ) Then
			If UCase(cd_campo_quebra) <> UCase(objrs.Fields.Item(tipo_quebra( tp_quebra )).Value) Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td></tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
		'inicia uma nova linha de registro
		vTxExcel = "  <tr height='15'>"
		If objrsv.Eof Then objrsv.MoveFirst
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			nr_processo  = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0003" 'Nr. do Processo
					str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"'>"& Mid( str, 5, Len(str) ) &"</td>"
				Case "0018" 'Nr. do Pedido
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
				Case "0066" 'tipo de frete
			  	vTxExcel = vTxExcel&fncExibeFrete(2, objrs.Fields.Item(nm_campo_rel).Value)
				case "0126","0133" 'importador/exportador
					vTxExcel = vTxExcel&fncImpExp(2, objrs.Fields.Item(nm_campo_rel).Value, Mid(nr_processo, 3, 2))
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
				vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 3)
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
				vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 3)
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
				vTxExcel = vTxExcel&fncExibeTextoPadrao(2, str)				
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
				vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 2)				
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
				vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, str, 2)	
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
		.CommandTimeOut = 120
		.CommandText    = Session("sql_volumes")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_track") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'gera o nome do arquivo
	vTxArquivo = "Volume"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	
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
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaia.com.br/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
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
window.open('http://www.myindaia.com.br/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->