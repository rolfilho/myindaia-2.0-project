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
Session("flag_alteracao") = "1"

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
<%'exibe titulo das colunas
	objtxt.WriteLine("<tr height='35'><nobr><td class='gridtit'>&nbsp;Transportadora&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Doctos. disponibilizados para transportadora&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Doctos. retirados pela transportadora&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Data da programação&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Nr. Pedido&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Analista Cliente&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Mercadoria&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Nr. Ref. Indaiá&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Local de Retirada Container (Terminal)&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Saída do Terminal&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Local de entrega/CNPJ&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Nr. Contâiner&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Tipo do contâiner&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;CTRC&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Armazenagem no K10?&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Data de saída K10&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Reutilização na exportação?&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Transportadora (K10)&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Data de devolução container vazio&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Local de devolução do container vazio&nbsp;</nobr></td>")
	objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Frota/Motorista Subida&nbsp;</nobr></td>")
    objtxt.WriteLine("<td class='gridtit'><nobr>&nbsp;Frota/Motorista Descida&nbsp;</nobr></td>")
	vTxExcel = "  <tr height='15'>"
	
	
	if objrs.State = adStateOpen then objrs.Close
sql = "SELECT PR.CD_TRANSP_NAC, TR.NM_TRANSP_ROD AS NM_TRANSP,  R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
	  "	CONVERT(VARCHAR,F041.DT_REALIZACAO,103) AS EV041, CONVERT(VARCHAR,F669.DT_REALIZACAO,103) AS EV669, " &_
      " (SELECT REPLACE(REPLACE(MASTER.DBO.RowConcat(DISTINCT RTRIM(RC.CD_REFERENCIA)+'/'+RC.NR_ITEM_PO+'<br> ')+'#!','<br> #!',''),'#!','') FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK) WHERE RC.NR_PROCESSO = R.NR_PROCESSO AND RC.TP_REFERENCIA = '01') AS PEDIDO, " &_
	  " (SELECT COUNT(PC1.NR_CNTR) FROM TPROCESSO_CNTR PC1 WHERE PC1.NR_PROCESSO = R.NR_PROCESSO) AS QTDE_CNTR, " & _
      " CC.NM_CONTATO, (SELECT REPLACE(REPLACE(MASTER.DBO.RowConcat(DISTINCT RTRIM(M.AP_MERCADORIA)+'<br> ')+'#!','<br> #!',''),'#!','')  " &_
	  "                  FROM BROKER.DBO.TMERCADORIA M (NOLOCK) " &_
      "                  INNER JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.CD_MERCADORIA = M.CD_MERCADORIA) " &_
      "                  WHERE DM.NR_PROCESSO = R.NR_PROCESSO) AS MERCADORIA, " &_
      " SUBSTRING(PR.NR_PROCESSO,5,15) AS PROCESSO, PC.CD_LOCAL_RET_CNTR, PC.CNPJ_LOCAL_ENTREGA, PC.NR_CNTR, TC.NM_TP_CNTR, PC.NR_CTRC, PC.IN_ARMAZEM_FABRICA, " &_
      " CASE PC.IN_ARMAZEM_FABRICA WHEN '1' THEN 'Sim' ELSE 'Não' END IN_ARMAZEM_FABRICA_OBS, PC.IN_REUTILIZA_EXP, CASE PC.IN_REUTILIZA_EXP WHEN '1' THEN 'Sim' ELSE 'Não' END IN_REUTILIZA_EXP_OBS, CONVERT(VARCHAR, PC.DT_DEVOLUCAO_CNTR,103) AS DT_DEVOLUCAO, PC.TX_LOCAL_DEVOLUCAO_CNTR, " &_
"	  CONVERT(VARCHAR,PC.DT_SAIDA_ARM,103) AS DT_SAIDA_ARM, LEFT(CONVERT(VARCHAR,PC.DT_SAIDA_ARM,108),5) AS HR_SAIDA_ARM, NM_MOTORISTA, NM_MOTORISTA_DESCIDA, CONVERT(VARCHAR, PC.DT_PROGRAMACAO,103) AS DT_PROGRAMACAO, AZM.NM_ARMAZEM, CONVERT(VARCHAR, PC.DT_SAIDA_K10,103) AS DT_SAIDA_K10, TK10.NM_TRANSP_ROD AS NM_TRANSP_K10 " &_
			"FROM TREL_SERV_TRANSP R (NOLOCK) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO_CNTR PC   (NOLOCK) ON (PC.NR_PROCESSO = PR.NR_PROCESSO AND PC.NR_CNTR = R.NR_CNTR) "&_
            "  INNER JOIN BROKER.DBO.TTRANSP_ROD TR      (NOLOCK) ON (TR.CD_TRANSP_ROD = PR.CD_TRANSP_NAC) "&_
            "  LEFT JOIN BROKER.DBO.TTRANSP_ROD TK10     (NOLOCK) ON (TK10.CD_TRANSP_ROD = TR.CD_TRANSP_ARMAZEM_FABRICA) "&_
            "  INNER JOIN BROKER.DBO.TEMPRESA_NAC EN     (NOLOCK) ON (EN.CD_EMPRESA = R.CD_CLIENTE) "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F041       (NOLOCK) ON (F041.NR_PROCESSO = R.NR_PROCESSO AND F041.CD_EVENTO = '041') "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F669       (NOLOCK) ON (F669.NR_PROCESSO = R.NR_PROCESSO AND F669.CD_EVENTO = '669') "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F276       (NOLOCK) ON (F276.NR_PROCESSO = R.NR_PROCESSO AND F276.CD_EVENTO = '276') "&_
			"  LEFT JOIN BROKER.DBO.TARMAZEM AZM         (NOLOCK) ON (AZM.CD_ARMAZEM = ISNULL(CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ATRACACAO)) "&_
            "  INNER JOIN BROKER.DBO.TCLIENTE_CONTATO CC (NOLOCK) ON (CC.CD_CONTATO = PR.CD_CONTATO AND CC.CD_PRODUTO = PR.CD_PRODUTO AND CC.CD_UNID_NEG = PR.CD_UNID_NEG AND CC.CD_CLIENTE = PR.CD_CLIENTE) "&_
            "  INNER JOIN BROKER.DBO.TTP_CNTR TC         (NOLOCK) ON (TC.TP_CNTR = PC.TP_CNTR) "&_
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
		'alterna a cor das linhas
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		
		If objrs.Fields.Item("IN_REUTILIZA_EXP").Value = "1" Then
			tx_dev_cntr = "n/a"	
		Else
			tx_dev_cntr = objrs.Fields.Item("TX_LOCAL_DEVOLUCAO_CNTR").Value	
		End If
				
        vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" &  objrs.Fields.Item("NM_TRANSP").Value & "&nbsp;</nobr></td>" &_
        "<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("EV041").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("EV669").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto' align='center'>" & fnc_Mascara(objrs.Fields.Item("DT_PROGRAMACAO").Value, 5) & "</td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("PEDIDO").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_CONTATO").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>" & objrs.Fields.Item("MERCADORIA").Value& "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("PROCESSO").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_ARMAZEM").Value& "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>Data: " & objrs.Fields.Item("DT_SAIDA_ARM").Value & "<br>Hora: " & objrs.Fields.Item("HR_SAIDA_ARM").Value& "</td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("CNPJ_LOCAL_ENTREGA").Value & "&nbsp;</nobr></td> "&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & fnc_Mascara(objrs.Fields.Item("NR_CNTR").Value,0) & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_TP_CNTR").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NR_CTRC").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("IN_ARMAZEM_FABRICA_OBS").Value & "&nbsp;</nobr></td>"&_
        "<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("DT_SAIDA_K10").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("IN_REUTILIZA_EXP_OBS").Value & "&nbsp;</nobr></td>"&_
        "<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_TRANSP_K10").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("DT_DEVOLUCAO").Value & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & tx_dev_cntr & "&nbsp;</nobr></td>"&_
		"<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_MOTORISTA").Value & "&nbsp;</nobr></td>"&_
        "<td bgcolor='"& bgcolor &"' class='texto'><nobr>&nbsp;" & objrs.Fields.Item("NM_MOTORISTA_DESCIDA").Value & "&nbsp;</nobr></td>"&_
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
  objtxt.WriteLine("    <td colspan='22' align='left' class='gridsub'>Foram encontrados "&objrs.Fields.Item(0).Value &" registros.</td>")
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