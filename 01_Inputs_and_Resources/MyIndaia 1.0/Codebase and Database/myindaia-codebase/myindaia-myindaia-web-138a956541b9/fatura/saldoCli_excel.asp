<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Exportação
'
'Autor: Kleber Guedes
'Criado: 19/07/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim nr_row_xls_ini 'primeira linha com valor de custos da quebra
Dim nr_row_xls_fim 'ultima linha com valor de custos da quebra
Dim nr_row_atual 'linha atual do excel
Dim nr_aux

Dim numz

cd_tela  = "EXC003"
cd_menu  = CStr(Request.QueryString("cd_menu"))
cd_subm  = CStr(Request.QueryString("cd_subm"))
cd_view  = CStr(Request.QueryString("cd_view"))
nr_ident = Request.QueryString("nr_ident")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Function fnc_ColunaExcel(nr_col)
  Dim alfabeto
  Dim coluna
  Dim divisor
  Dim resto
  
  nr_col   = nr_col - 1
  alfabeto = Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
  
  resto   = ( nr_col Mod 26 )
  divisor = ( nr_col \ 26 )
  If nr_col > 25 Then coluna = alfabeto(divisor - 1) & alfabeto(resto) Else coluna = alfabeto(resto)
  
  fnc_ColunaExcel = coluna
End Function


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
	'exibe título das colunas

  'por grupo de Clientes
  Select Case tp_relat
    Case "0"
      nr_cols = 11
			nr_aux = 1
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=120 class='gridtit'>Grupo de Clientes </td>"
  ' por Empresa Nacional
    Case "1"
      nr_cols = 12
			nr_aux = 2			
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=120 class='gridtit'>Cliente </td>"
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=120 class='gridtit'>Grupo de Clientes </td>"
  'por Referência
    Case "2"
      nr_cols = 13
			nr_aux = 3			
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=80  class='gridtit'>Nr. Ref. Indaiá </td>"
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=120 class='gridtit'>Cliente </td>"
      vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=120 class='gridtit'>Grupo de Clientes </td>"
  End Select

  vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>Pagamento x Numerário</td>"
  vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>Faturas</td>"
  vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=105 class='graytit'>Honorários</td>"
  vTxLinha(0) = vTxLinha(0) &"<td rowspan='2' width=105 class='gridtit'>Saldo Total do Cliente (1+2+3+4)</td>"
  vTxLinha(0) = vTxLinha(0) &"<td colspan='2' class='gridtit'>Faturas Vencidas</td>"
 
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Recebimento Numerário (1)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Pagamento de Despesas (2)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Saldo de Pagamentos x Numerários (1+2)</td>"											
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Faturas com saldo Credor (3)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Faturas com saldo Devedor(4)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Saldo de Faturas (3+4)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Faturas com Saldo Devedor Vencidas (5)</td>"
  vTxLinha(1) = vTxLinha(1) &"<td width=105 class='gridtit'>Média de Dias em atraso (6)</td>"																										

%>
<!--#include virtual="/includes/xls_header.asp" -->
<%

	'exibe titulo das colunas
	objtxt.WriteLine("<tr height=15>"&vTxLinha(0)&"</tr>")
	objtxt.WriteLine("<tr height=40>"&vTxLinha(1)&"</tr>")
	
	nrec            = 0
	cd_campo_quebra = ""
	
	'inicia contador de linhas
	nr_row_xls_ini = 8
	nr_row_atual = 8
	nr_row_xls_fim = 8
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		
		'inicia uma nova linha de registro
		vTxExcel = "  <tr height='15'>"
		
    Select Case tp_relat
      Case "0"
        vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("GRUPO").Value)
      Case "1"  
        vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("EMPRESA").Value)
        vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("GRUPO").Value)
      Case "2"  
        vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("NR_PROCESSO").Value)
        vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("EMPRESA").Value)
				vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("GRUPO").Value)
    End Select 							
    vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("NUMERARIO").Value, 2)
		vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("DESPESA").Value, 2)
  	vTxExcel = vTxExcel&"    <td class='decimal2' style='font-weight:bold;' bgcolor='"& bgcolor &"' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 1) & nr_row_atual &":"& fnc_ColunaExcel(nr_aux + 2)& nr_row_atual &")'></td>"
  	vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("CREDOR").Value, 2)
		vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("DEVEDOR").Value, 2)
  	vTxExcel = vTxExcel&"    <td class='decimal2' style='font-weight:bold;' bgcolor='"& bgcolor &"' x:num x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 4) & nr_row_atual &":"& fnc_ColunaExcel(nr_aux + 5)& nr_row_atual &")'></td>"
		vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("HONORARIO").Value, 2)
  	vTxExcel = vTxExcel&"    <td class='decimal2' style='font-weight:bold;' bgcolor='"& bgcolor &"' x:num x:fmla='"& fnc_ColunaExcel(nr_aux + 3) & nr_row_atual &"+"& fnc_ColunaExcel(nr_aux + 6)& nr_row_atual &"'></td>"
		vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item("DEVEDOR_VENC").Value, 2)
		vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("DIAS_ATRASO").Value)

		objtxt.WriteLine(vTxExcel&"  </tr>")
    nr_row_atual = nr_row_atual + 1
		nr_row_xls_fim = nr_row_xls_fim + 1
		objrs.MoveNext
		If objrs.Eof Then Exit Do
		'If nrec > 30 Then Response.Flush()
		nrec = nrec + 1
	Loop
  
	'linha de total
	
	nr_row_xls_fim = nr_row_xls_fim - 1
  vTxExcel = "  <tr height='15'>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' colspan='"& nr_aux &"'> Total </td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 1)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 1) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 2)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 2) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 3)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 3) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 4)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 4) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 5)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 5) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 6)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 6) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 7)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 7) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 8)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 8) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal' x:num NumberFormat:'0.00' x:fmla='SUM("& fnc_ColunaExcel(nr_aux + 9)  & nr_row_xls_ini &":"& fnc_ColunaExcel(nr_aux + 9) & nr_row_xls_fim &")'></td>"
 	vTxExcel = vTxExcel&"    <td class='subtotal'></td>"

  objtxt.WriteLine(vTxExcel&"  </tr>")

  
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
		.CommandText    = Session("sql_saldo_cli")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_saldo_cli") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'gera o nome do arquivo
	vTxArquivo = "SaldoCli"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	
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