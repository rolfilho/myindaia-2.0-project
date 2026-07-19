<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: PAgamento de Despesas x Numerário
'
'Autor Alexandre Gonçalves Neto
'Criado: 07/02/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim vl_item  'valor do item do faturamento
Dim vl_total 'armazema o valor total

'recebe dados para consulta
nr_processo  = Request.QueryString("nr_processo")
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

vl_item  = 0
vl_total = 0

sql = "SELECT DISTINCT "&_
			"  N.NR_PROCESSO, N.NR_SOLICITACAO, N.NR_LANCAMENTO, N.CD_ITEM, "&_
			"  I."& tx_lang_item &" AS NM_ITEM, N.VL_SOLICITADO, N.CD_STATUS, N.TP_DESTINO "&_
			"FROM TNUMERARIO_ITEM N ( NOLOCK ), TITEM I ( NOLOCK ) "&_
			"WHERE N.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
			"  AND N.CD_STATUS IN ( 'P','A' ) "&_
			"  AND ISNULL( N.VL_SOLICITADO, 0 ) <> 0 "&_
			"  AND ISNULL( N.IN_CANCELADO, '0' ) = '0' "&_
			"  AND N.CD_ITEM = I.CD_ITEM "
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.fatura {
	position:absolute;
	left:0px;
	top:41px;
	width:400px;
	height:181px;
	z-index:1;
	overflow:auto;
}

.saldo {
	color: #000000;
	font-weight: bold;
	background: #EEEEEE;
	border: solid 1px;
	border-color: #AAAAAA #333333 #333333 #AAAAAA;
}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

MM_reloadPage(true);
//-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DDDDDD">
	<tr height="25">
		<td colspan="3" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= tx_lang_POP007(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<tr height="16">
		<td width="230" class="ttbpopup">&nbsp;<%= tx_lang_A00074(cd_lang)%></td>
		<td width="75" class="ttbpopup">&nbsp;<%= tx_lang_A00080(cd_lang)%></td>
		<td width="105" class="ttbpopup">&nbsp;<%= tx_lang_A00078(cd_lang)%></td>
	</tr>
	<tr>
		<td colspan="3"><div id="fatura" class="fatura">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<%
If objrs.RecordCount > 0 Then
	If objrs.RecordCount < 15 Then col = 83 Else col = 67
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'calculo do valor do item
		vl_item  = objrs.Fields.Item("VL_SOLICITADO").Value
		vl_total = vl_total + vl_item
%>
					<tr>
						<td align="left" width="" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 1px;"><nobr>&nbsp;<%= objrs.Fields.Item("NM_ITEM").Value%></nobr></td>
						<td align="left" width="75" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 0px;"><nobr>&nbsp;<%= objrs.Fields.Item("CD_STATUS").Value%></nobr></td>
						<td align="left" width="20" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr>R$&nbsp;</nobr></td>
						<td align="right" width="<%= col%>" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr><%= FormatNumber(vl_item, 2)%>&nbsp;</nobr></td>
					</tr>
					<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
Else
%>
					<tr>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
End If
%>
				</table>
			</div></td>
	</tr>
	<tr height="62">
		<td colspan="3"><table width="125" height="100%" border="0" align="right" cellpadding="0" cellspacing="1">
				<tr>
					<td width="125" class="saldo" align="center" style="font-size:12px;">Total<br>
						R$ <%= FormatNumber(vl_total, 2)%></td>
				</tr>
			</table></td>
	</tr>
	<tr height="15" align="center">
		<td colspan="3" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
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
