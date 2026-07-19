<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Pop-up Detalhe de Processo
'Arquivo de Script e HTML: Exibe os contêiners da mesma PO e Processo
'
'Modificado por Alexandre Gonçalves Neto em 08/07/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 120

Dim nr_dias_cobrar
Dim nr_dias_corridos

cd_tela = "PUP001"
nm_tela = "Detalhe Processo "
cd_menu = "03"
cd_subm = "03"
cd_view = ""
tx_erro = Request.QueryString("tx_erro")

'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

'recupera o numero da PO, Item e Processo
nr_referencia = Trim(Request.QueryString("nr_referencia"))
nr_processo   = Trim(Request.QueryString("nr_processo"))

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
Session("sql_cntr") = Null
' ***** SELECIONA OS DETALHES DOS CONTÊINERS DO PROCESSO *****
If Mid(nr_processo, 3, 2) = "01" Then sql = "162"
If Mid(nr_processo, 3, 2) = "02" Then sql = "132"
'Response.Write(sql &"<br>")
sql = "SELECT DISTINCT "&_
			"   C.NR_PROCESSO, C.NR_CNTR, C.DT_CHEGADA_FABR, C.IN_DEMURRAGE, C.IN_DESOVA, C.IN_AVARIA, C.VL_AVARIA, " &_
			"	  C.IN_LAVAGEM, C.VL_LAVAGEM, C.DT_ENTREGA_FABRICA, C.NR_FREE_TIME, C.DT_DEMURRAGE, " &_
			"   C.DT_CARREGAMENTO, C.DT_ENTREGA_FABRICA, C.DT_RET_CNTR_FABRICA, C.DT_ENTRADA_PATIO_TRANSP, " &_
			"	  C.DT_DEVOLUCAO_CNTR, C.CD_STATUS_CNTR, C.VL_DEPOSITO, C.TX_DEPOSITO, "&_
			"   ( C.VL_DEPOSITO * C.TX_DEPOSITO ) AS VL_CONVERTIDO, C.IN_DEPOSITADO, C.IN_DEVOLVIDO, "&_
			"   A.NM_ARMAZEM, T.NM_TRANSP_ROD, Y.NM_TP_CNTR, " &_
			"   R.CD_REFERENCIA, P.NR_VIAGEM, E.NM_EMBARCACAO, P.NR_CONHECIMENTO_MASTER AS NR_MBL, " &_
			"	  P.NR_CONHECIMENTO AS NR_HBL, N.NM_UNID_NEG, U.NM_PRODUTO, F.DT_REALIZACAO AS DT_ETA "&_
			"FROM TPROCESSO_CNTR C ( NOLOCK ) " &_
			"  INNER JOIN TPROCESSO    P ( NOLOCK ) ON ( P.NR_PROCESSO   = C.NR_PROCESSO ) " &_
			"  INNER JOIN TFOLLOWUP    F ( NOLOCK ) ON ( F.NR_PROCESSO   = C.NR_PROCESSO AND F.CD_EVENTO = '"& sql &"' ) " &_
			"  LEFT  JOIN TREF_CLIENTE R ( NOLOCK ) ON ( R.NR_PROCESSO   = C.NR_PROCESSO AND R.TP_REFERENCIA = '01' ) " &_
			"  LEFT  JOIN TUNID_NEG    N ( NOLOCK ) ON ( N.CD_UNID_NEG   = P.CD_UNID_NEG ) " &_
			"  LEFT  JOIN TPRODUTO     U ( NOLOCK ) ON ( U.CD_PRODUTO    = P.CD_PRODUTO ) " &_
			"  LEFT  JOIN TARMAZEM     A ( NOLOCK ) ON ( A.CD_ARMAZEM    = P.CD_ARMAZEM_DESCARGA ) " &_
			"  LEFT  JOIN TEMBARCACAO  E ( NOLOCK ) ON ( E.CD_EMBARCACAO = P.CD_EMBARCACAO ) " &_
			"  LEFT  JOIN TTRANSP_ROD  T ( NOLOCK ) ON ( T.CD_TRANSP_ROD = P.CD_TRANSP_NAC ) " &_
			"  LEFT  JOIN TTP_CNTR     Y ( NOLOCK ) ON ( Y.TP_CNTR       = C.TP_CNTR ) " &_
			"WHERE C.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND C.TP_CNTR    <> '01' " &_
			"ORDER BY C.NR_CNTR"
'Response.Write(sql &"<br>")
Session("sql_cntr") = sql

With objcmd
	.CommandTimeOut = 60
	.CommandText    = Session("sql_cntr")
	.CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'informações para as telas de impressão e download
url = "nr_processo="& nr_processo &"&"&_
			"nr_referencia="& nr_referencia &"&"&_
			"folder="& Request.QueryString("folder")

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td height="25" background="/imagens/30/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= nm_tela%></td>
					<td width="25"><a href="#" onClick="window.open('detalhe_cntr_print.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&<%= url%>','Impress&atilde;o','top=20,left=20,width=800,height=600,scrollbars=yes,menubar=no');" class="botao"><img src="/imagens/30/btn_print.gif" width="17" height="17" border="0" alt="Preparar para Impressão"></a></td>
					<!--<td width="25"><img src="/imagens/icones/16x16/btn_excel.gif" width="16" height="16" border="0" alt="Download em Excel"></td>-->
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/30/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td height="20">&nbsp;Produto: <b><%= objrs("NM_PRODUTO")%></b></td>
	</tr>
	<tr>
		<td valign="top"><div id="dv_corpo" style="position:absolute; left:0px; top:45px; width:100%; height:100%; z-index:1; overflow:auto;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<tr height="18" class="gridtit">
						<%
Do While Not objrsv.Eof
%>
						<td><nobr><%= objrsv("M04_NM_CAMPO")%></nobr></td>
						<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<%
Do While Not objrs.Eof
	If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
%>
					<tr height="15" bgcolor="<%= bgcolor%>">
						<%
	If objrsv.Eof Then objrsv.MoveFirst
	
	'executa procedure para contar dias de demurrage
	With objcmd
		.CommandTimeOut = 60
		.CommandText    = "sp_calc_dias_cntr"
		.CommandType    = adCmdStoredProc
		.Parameters.Append = .CreateParameter("@nr_processo"     , adChar   , adParaminput , 18, objrs.Fields.Item("NR_PROCESSO").Value)
		.Parameters.Append = .CreateParameter("@nr_cntr"         , adChar   , adParaminput , 20, objrs.Fields.Item("NR_CNTR").Value)
		.Parameters.Append = .CreateParameter("@nr_dias_corridos", adInteger, adParamOutPut,   , 0)
		.Parameters.Append = .CreateParameter("@nr_dias_cobrar"  , adInteger, adParamOutPut,   , 0)
		.Execute nrec, , adExecuteNoRecords
		nr_dias_cobrar   = .Parameters("@nr_dias_cobrar")
		nr_dias_corridos = .Parameters("@nr_dias_corridos")
		.Parameters.Delete("@nr_processo")
		.Parameters.Delete("@nr_cntr")
		.Parameters.Delete("@nr_dias_corridos")
		.Parameters.Delete("@nr_dias_cobrar")
	End With
	
	Do While Not objrsv.Eof
		Select Case objrsv("M04_CD_CAMPO")
			Case "001" 'Nr. Contêiner
%>
						<td align="center" width="150"><nobr><a href="#" onClick="window.opener.location.href='/<%= Request.QueryString("folder")%>/track_busca.asp?filtro=nr_cntr&nr_cntr=<%= Trim(objrs("NR_CNTR"))%>&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= fnc_Mascara(objrs("NR_CNTR"), 0)%></a>&nbsp;<nobr></td>
						<%
			Case "004","005","029","030" 'campos sim/não
				str = "Não"
				If objrs(UCase(objrsv("M04_AP_CAMPO"))) Then str = "Sim"
%>
						<td align="right"><nobr><%= str%>&nbsp;</nobr></td>
						<%
			Case "006","007","026","027","028"
				x = 0
				y = objrs(UCase(objrsv("M04_AP_CAMPO")))
				If fnc_TestaVar(y) Then x = y
%>
						<td align="right"><nobr><%= FormatNumber(x, 2)%>&nbsp;</nobr></td>
						<%
			Case "013"
%>
						<td align="right"><nobr><%= fnc_Mascara(objrs(UCase(objrsv("M04_AP_CAMPO"))), 4)%>&nbsp;</nobr></td>
						<%
			Case "017" 'dias corridos
%>
						<td align="right"><nobr><%= nr_dias_corridos%>&nbsp;</nobr></td>
						<%
			Case "018" 'dias a cobrar
%>
						<td align="right"><nobr><%= nr_dias_cobrar - objrs.Fields.Item("NR_FREE_TIME").Value%>&nbsp;</nobr></td>
						<%
			Case Else
%>
						<td align="right"><nobr><%= Trim(fnc_Mascara(objrs(UCase(objrsv("M04_AP_CAMPO"))), 5))%>&nbsp;</nobr></td>
						<%
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
					</tr>
					<%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit">
						<td height="15" colspan="<%= objrsv.RecordCount%>" align="left"><nobr>Foram
							encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
					<%
objrsv.Close
objrs.Close
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div></td>
	</tr>
	<!--
  <tr align="center">
    <td height="28"><input name="btn_print" type="button" class="button" onClick="window.open('detalhe_cntr_print.asp?nr_referencia=<%= nr_referencia%>&nr_processo=<%= nr_processo%>','Imprimir','top=20,left=20,width=800,height=600,scrollbars=yes,menubar=no');" value="Imprimir">
	<input name="btn_fechar" type="button" class="button" onClick="window.close()" value="Fechar"></td>
  </tr>
  -->
	<tr>
		<td align="center" bgcolor="#DBDADA" height="15"><p><b><a href="http://www.indaialogistica.com.br/" target="_blank">Indaiá Logística
				Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->