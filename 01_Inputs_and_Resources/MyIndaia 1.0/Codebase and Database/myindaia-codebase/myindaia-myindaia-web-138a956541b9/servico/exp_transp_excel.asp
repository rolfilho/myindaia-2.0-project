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
	
%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
	'exibe titulo das colunas
	objtxt.WriteLine("<tr height='35'><nobr><td class='gridtit'>Nr. Pedido</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Nr. Ref. Indaiá</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Nr. Contâiner</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Nr. Conhecimento</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Cliente</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Tara</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Lacre</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Solicitação de retirada do vazio</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Retirada do vazio</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Chegada na Fábrica</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>Saída da Fábrica</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>Entrega no Terminal</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>Pre-Stacking</nobr></td>")
	
	vTxExcel = "  <tr height='15'>"
	
	
	if objrs.State = adStateOpen then objrs.Close
sql = "SELECT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
			"  PR.NR_CONHECIMENTO, PC.NR_CNTR, CONVERT(VARCHAR,PC.DT_CHEGADA_FABR,103) AS DT_CHEGADA_FABR, LEFT(CONVERT(VARCHAR,PC.DT_CHEGADA_FABR,108),5) AS HR_CHEGADA_FABR, CONVERT(VARCHAR,PC.DT_ENTR_TERMINAL,103) AS DT_ENTR_TERMINAL, LEFT(CONVERT(VARCHAR,PC.DT_ENTR_TERMINAL,108),5) AS HR_ENTR_TERMINAL, CONVERT(VARCHAR,PC.DT_PRE_STACKING,103) AS DT_PRE_STACKING, LEFT(CONVERT(VARCHAR,PC.DT_PRE_STACKING,108),5) AS HR_PRE_STACKING, CONVERT(VARCHAR,PC.DT_SAIDA_FABR,103) AS DT_SAIDA_FABR, LEFT(CONVERT(VARCHAR,PC.DT_SAIDA_FABR,108),5) AS HR_SAIDA_FABR, CONVERT(VARCHAR,PC.DT_SOLIC_RET_VAZIO,103) AS DT_SOLIC_RET_VAZIO, LEFT(CONVERT(VARCHAR,PC.DT_SOLIC_RET_VAZIO,108),5) AS HR_SOLIC_RET_VAZIO, CONVERT(VARCHAR,PC.DT_RET_VAZIO,103) AS DT_RET_VAZIO, LEFT(CONVERT(VARCHAR,PC.DT_RET_VAZIO,108),5) AS HR_RET_VAZIO,  "&_
			"  EN.NM_EMPRESA, PC.TARA_CNTR, PC.NR_LACRE "&_
			"FROM TREL_SERV_TRANSP R (NOLOCK) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) ON (PC.NR_PROCESSO = R.NR_PROCESSO AND PC.NR_CNTR = R.NR_CNTR) "&_
			"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA = PR.CD_CLIENTE)"&_
			"WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' AND R.NR_IDENT = "& nr_ident &" AND PR.TP_ESTUFAGEM IN ('0','1') "&_
			"ORDER BY R.NR_PROCESSO, R.NR_CNTR"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText



if objrs.RecordCount > 0 then
	'Exibe os resultados do relatório e aplica a personalização
	Do While not objrs.Eof
		'dados do prcesso
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		nr_cntr     = Trim(objrs.Fields.Item("NR_CNTR").Value)
		If objrsx.State = adStateOpen Then objrsx.Close()
		sql = "SELECT RC.CD_REFERENCIA, ISNULL(RC.NR_ITEM_PO, '0000') AS NR_ITEM_CLIENTE "&_
					" FROM TREF_CLIENTE RC (NOLOCK) "&_
					" INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = RC.CD_EMPRESA "&_
					" INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = E.CD_GRUPO "&_
					" WHERE RC.NR_PROCESSO = '"& nr_processo &"' AND RC.TP_REFERENCIA = ISNULL(G.TP_PEDIDO_BUSCA,'01') "&_
					"ORDER BY RC.CD_REFERENCIA, RC.NR_ITEM_PO"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'agrupa todas as referencias na string para aparecerem como hint
		If objrsx.RecordCount > 0 Then
			nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
			Do While Not objrsx.Eof
				str = str & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
				objrsx.MoveNext
				If objrsx.Eof Then Exit Do Else str = str & vbcrlf
			Loop
		Else
			nr_referencia = Null
			str = Null
		End If
		'alterna a cor das linhas
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		
		vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"' title='"& str &"' class='texto'><nobr>"& nr_referencia & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & Mid(nr_processo, 5, Len(nr_processo)) & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" &  fnc_Mascara(nr_cntr, 0) & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("NR_CONHECIMENTO").Value & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("NM_EMPRESA").Value & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("TARA_CNTR").Value & "</nobr></td>"&_	
			"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("NR_LACRE").Value & "</nobr></td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_SOLIC_RET_VAZIO").Value & " " & objrs.Fields.Item("HR_SOLIC_RET_VAZIO").Value & "</td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_RET_VAZIO").Value & " " & objrs.Fields.Item("HR_RET_VAZIO").Value & "</td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_CHEGADA_FABR").Value & " " & objrs.Fields.Item("HR_CHEGADA_FABR").Value & "</td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_SAIDA_FABR").Value & " " & objrs.Fields.Item("HR_SAIDA_FABR").Value & "</td>"&_
            "<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_ENTR_TERMINAL").Value & " " & objrs.Fields.Item("HR_ENTR_TERMINAL").Value & "</td>"&_
			"<td bgcolor='"& bgcolor &"' class='texto'>" & objrs.Fields.Item("DT_PRE_STACKING").Value & " " & objrs.Fields.Item("HR_PRE_STACKING").Value & "</td>"&_
					"</tr>"
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
end if


objtxt.WriteLine(vTxExcel) 
vTxExcel = "<tr height='15'>"
if objrs.State = adStateOpen then objrs.Close
'verifica se existe container no processo
sql = "SELECT COUNT(*) FROM TREL_SERV_TRANSP (NOLOCK) "&_
			"WHERE CD_USUARIO = '"& Session("cd_usuario") &"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

  objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td colspan='13' align='left' class='gridsub'>Foram encontrados "&objrs.Fields.Item(0).Value &" registros.</td>")
  objtxt.WriteLine("  </tr>")
  objtxt.WriteLine("</table></body></html>")
  objtxt.Close()

  sql = "UPDATE TRELATORIOS SET TX_ARQUIVO = '"&arquivo&"' "&_
					"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
					"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
  objcnn.Execute(sql)
	
  Set objtxt = Nothing
  Set objfso = Nothing
  if objrs.State = adStateOpen then objrs.Close
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


'Response.write objrs.Fields.Item(0).Value
if fnc_TestaVar(objrs.Fields.Item(0).Value) and Session("flag_alteracao") = "0" then
	'if objrs.State = adStateOpen then objrs.Close()
	'With objcmd
'		.CommandTimeOut = 300
'		.CommandText    = Session("sql_transp")
'		.CommandType    = adCmdText
'	End With
'	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_transp") &"<br>"
'	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'	'retorna para o primeiro registro do resultado
'	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
'	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = objrs.Fields.Item(0).Value
else
	vTxArquivo = "Transp"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"	'****************************************************************************************************
	Call subGeraExcel(vTxCaminho, vTxArquivo)
	Session("flag_alteracao") = "0"
end if
%>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Planilha Excel<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
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
window.open('http://www.myindaiaweb.com.br/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->