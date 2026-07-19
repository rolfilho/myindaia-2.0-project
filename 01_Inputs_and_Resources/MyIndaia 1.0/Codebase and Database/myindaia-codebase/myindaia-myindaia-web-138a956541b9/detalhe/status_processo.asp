<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: Status do Processo
'
'Autor Alexandre Gonçalves Neto
'Criado: 29/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vtxTitulo : vtxTitulo = tx_lang_POP078(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "

nr_processo   = Request.QueryString("nr_processo")
nr_referencia = Request.QueryString("nr_referencia")
nr_item_clnte = Request.QueryString("nr_item_clnte")

'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

if Mid(nr_processo, 3, 2) = "06" then
	sql = "SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_PROCESSO, F.CD_FLP_PO_ITEM_ETAPA, "&_
				"  F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E."& tx_lang_status &" AS NM_ETAPA, U.AP_USUARIO "&_
				"FROM TPO_ITEM I (NOLOCK), TFLP_PO_ITEM_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO U (NOLOCK) "&_
				"WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
				"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
				"  AND I.NR_PROCESSO = F.NR_PROCESSO "&_
				"  AND I.NR_ITEM     = F.NR_ITEM"&_
				"  AND F.CD_ETAPA   *= E.CD_ETAPA "&_
				"  AND F.CD_USUARIO *= U.CD_USUARIO "&_
				"ORDER BY F.CD_FLP_PO_ITEM_ETAPA"
	vtxTitulo = vtxTitulo & nr_referencia &"/"& nr_item_clnte
else
	sql = "SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_PROCESSO, F.CD_FOLLOWUP_ETAPA, "&_
				"  F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E."& tx_lang_status &" AS NM_ETAPA, U.AP_USUARIO "&_
				"FROM TFOLLOWUP_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO U (NOLOCK) "&_
				"WHERE F.NR_PROCESSO = '"& nr_processo &"' "&_
				"  AND F.CD_ETAPA   *= E.CD_ETAPA "&_
				"  AND F.CD_USUARIO *= U.CD_USUARIO "&_
				"ORDER BY F.CD_FOLLOWUP_ETAPA"
	vtxTitulo = vtxTitulo & Mid(nr_processo, 5, Len(nr_processo))
end if
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divStatus {
	position:absolute;
	left:0px;
	top:41px;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
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
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<tr height="25">
		<td colspan="4" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= vtxTitulo%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<tr height="16">
		<td width="50" class="ttbpopup">&nbsp;<%= tx_lang_A00092(cd_lang)%></td>
		<td width="550" class="ttbpopup">&nbsp;<%= tx_lang_004027(cd_lang)%></td>
		<td width="150" class="ttbpopup">&nbsp;<%= tx_lang_A00077(cd_lang)%></td>
	</tr>
	<tr>
		<td colspan="4"><div id="status" class="divStatus">
				<%
If objrs.Eof Then
	Response.Write(tx_lang_A00093(cd_lang))
Else
	If objrs.RecordCount < 30 Then col = 150 Else col = 136
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr height="16" bgcolor="<%= bgcolor%>">
						<td width="50" align="right"><%= objrs.Fields.Item("CD_FOLLOWUP_ETAPA").Value%>&nbsp;</td>
						<td width="550"><%= objrs.Fields.Item("NM_ETAPA").Value%></td>
						<td width="<%= col%>"><%= objrs.Fields.Item("DT_ALTERACAO").Value%></td>
					</tr>
				</table>
				<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
End If
%>
		</div></td>
	</tr>
	<tr height="15" align="center">
		<td colspan="4" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
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
