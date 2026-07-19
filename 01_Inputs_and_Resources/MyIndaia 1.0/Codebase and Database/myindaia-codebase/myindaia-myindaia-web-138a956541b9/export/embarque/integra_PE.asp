<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Server.ScriptTimeout = 300
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim vNrRap

vNrRap = Request.QueryString("nr_rap")
vNrRap = Right("0000000"&vNrRap, 8)

dim vTpExibe : vTpExibe = Request.QueryString("vTpExibe")
dim vTxCampo : vTxCampo = Request.QueryString("vTxCampo")
dim vTxOrdem : vTxOrdem = Request.QueryString("vTxOrdem")
dim pNrRap : pNrRap = Request.QueryString("pNrRap")
dim pNrCDE : pNrCDE = Request.QueryString("pNrCDE")
dim vNrCde, vTpAcao, vTxStatus, vNrID
dim pagina, sql_s, sql_f, sql_w, sql_o
dim vQtde, vQtdeRest
dim vCheck
dim check
dim nAux, vStatusAux
dim ArrCheck, ArrPedido, ArrItem, ArrQtde, ArrQtdeRest
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function ValidaIntegracao(vForm) {
  var valida = true;
  return valida;
-->
}	
</script>
<style type="text/css">
.divInteg {
	border: 1px solid #999999;
	background: #DCDCDC;
	width: 100%;
	height: 100%;
	overflow: scroll;
}
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td class="titpopup">&nbsp;Integrar Pedidos na RAP <%= Mid(vNrRap, 1, 6) + "/" + Mid(vNrRap, 7, 2)%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<%
'após clicar em integrar
if Request.TotalBytes > 0 then
	ArrCheck    = Split(Request.Form("checar") , ", ", -1)
	ArrPedido   = Split(Request.Form("hdnPed") , ", ", -1)
	ArrItem     = Split(Request.Form("hdnItem"), ", ", -1)
	ArrQtde     = Split(Request.Form("qtde")   , ", ", -1)
	ArrQtdeRest = Split(Request.Form("hdnqtde"), ", ", -1)
	vStatusAux = 0
	nAux = 0

	For Each check in Request.Form("checar")
		vQtde = 0 
		vQtde = ArrQtde(ArrCheck(nAux))
		vQtdeRest = 0
		vQtdeRest = ArrQtdeRest(ArrCheck(nAux))
		
		if FormatNumber(vQtde, 2) <= FormatNumber(vQtdeRest, 2) then
	 
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "UPDATE TPE_ITEM SET QT_BAIXADA = ISNULL(QT_BAIXADA, 0) + ISNULL("& Replace(vQtde, ",", ".") &", 0) " &_
						"WHERE NR_PEDIDO = '"& ArrPedido(ArrCheck(nAux)) &"' AND NR_ITEM = '"& ArrItem(ArrCheck(nAux)) &"' "	
			'Response.Write(sql)
			objcnn.Execute(sql)
		else
    %>
	<script language="javascript">
<!--
	alert("Quantidade selecionada inválida ou maior que a disponível!");
-->
</script>
	<%
		vStatusAux = 1 
		end if	
		nAux = nAux + 1
	Next
	if vStatusAux = 0 then
%>
	<script language="javascript">
<!--
 alert("Pedidos integrados com sucesso!");
 window.close();
 window.opener.location.href='cadastro.asp?cd_menu=&cd_subm=&cd_docto=&vNrRap=<%=vNrRap %>&vTpAcao=salvar';
-->
</script>
	<%
	end if
end if

'verifica se a pagina é zero, se for seta para 1
if pagina = 0 then pagina = 1
nr_reg_pagina  = 30
'lista RAP´s para exibi-las em tela
if objrs.State = adStateOpen then objrs.Close()
sql_s = "SELECT PE.CD_PRODUTO, PE.TX_DESC, "&_
        "  RTRIM(LTRIM(PE.CD_RAP)) + '/' + RTRIM(LTRIM(PE.CD_RAP_ANO)) AS RAP, RTRIM(LTRIM(PE.CD_RAP)) + RTRIM(LTRIM(PE.CD_RAP_ANO)) AS VRAP, "&_
				"  RTRIM(LTRIM(PE.NR_PEDIDO)) AS NR_PEDIDO, RTRIM(LTRIM(PE.NR_ITEM)) AS NR_ITEM, ISNULL(PE.QT_FORN_PEDIDO, 0) AS QT_TOTAL, "&_
        "  ISNULL(PE.QT_FORN_PEDIDO, 0) - ISNULL(PE.QT_BAIXADA, 0) AS QT_RESTANTE, ISNULL(PE.QT_BAIXADA, 0) AS QT_BAIXADA "
sql_f = "FROM TPE_ITEM PE (NOLOCK) "
sql_w = "WHERE ISNULL(PE.QT_FORN_PEDIDO, 0) - ISNULL(PE.QT_BAIXADA, 0) > 0  AND "&_
        "      ((RTRIM(LTRIM(PE.CD_RAP)) = '"& Mid(vNrRap, 1, 6) &"' AND PE.CD_RAP_ANO = '"& Mid(vNrRap, 7, 2) &"') OR (ISNULL(PE.CD_RAP, '') = '')) "
sql_o = "ORDER BY PE.CD_RAP_ANO DESC , PE.CD_RAP DESC "
'verifica o cargo do usuario
if InStr("040;055;060", Session("cd_cargo")) > 0 then
	sql_f = sql_f&" INNER JOIN TRAP R (NOLOCK) ON R.CD_RAP = PE.CD_RAP AND R.CD_RAP_ANO = PE.CD_RAP_ANO "&_
              	" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "

end if

sql = sql_s & sql_f & sql_w & sql_o
'response.redirect("teste.asp?vnrrap="&sql)

Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>" 'ESTA TRAVANDO AQUI NESTA SESSION
with objcmd
	.CommandTimeOut = 60
	.CommandText    = sql
	.CommandType    = adCmdText
end with
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'NAO PASSA POR AQUI QUANDO USUARIO JANE
if objrs.RecordCount > 0 then
	nrec = 0
%>
	<tr height="100%">
		<td style="padding: 5px;"><div id="divInteg" class="divInteg">
				<table>
					<tr height="25">
						<td> Selecione os pedidos que deseja integrar e insira a quantidade desejada... </td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" style="padding: 2px 2px 0px 2px;" bgcolor="#336699">
					<tr height="18">
						<td width="20"  class="gridtit">&nbsp;</td>
						<td width="50"  class="gridtit">Qtde. a Baixar&nbsp;</td>
						<td width="70"  class="gridtit">Qtde. Restante&nbsp;</td>
						<td width="70"  class="gridtit">Qtde. Total&nbsp;</td>
						<td width="100" class="gridtit">Nr. Pedido&nbsp;</td>
						<td width="75"  class="gridtit">Nr. Item&nbsp;</td>
						<td width="70"  class="gridtit">Nr. RAP&nbsp;</td>
						<td width="80"  class="gridtit">Produto&nbsp;</td>
						<td width="315"  class="gridtit">Descrição&nbsp;</td>
					</tr>
					<form name="frmIntegraPE" action="?nr_rap=<%=vNrRap%>" method="post" onSubmit="return ValidaIntegracao(this);">
						<%
	'do while nrec < objrs.PageSize and not objrs.Eof

	do while not objrs.Eof
		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
    vNrID = objrs.Fields.Item("NR_PEDIDO").Value &  objrs.Fields.Item("NR_ITEM").Value
		vCheck = false
		if vNrRAP = objrs.Fields.Item("VRAP").Value then vCheck = true
%>
						<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
							<input type="hidden" name="hdnPed"  id="hdnPed<%= nRec %>" value="<%=objrs.Fields.Item("NR_PEDIDO").Value %>">
							<input type="hidden" name="hdnItem" id="hdnItem<%= nRec %>" value="<%= objrs.Fields.Item("NR_ITEM").Value %>">
							<input type="hidden" name="hdnQtde" id="hdnQtde<%= nRec %>" value="<%= objrs.Fields.Item("QT_RESTANTE").Value %>">
							<%
    if vCheck then
  		Response.Write("<td><input name='checar' id='chk"&nRec&"' type='checkbox' tabindex='"&nRec&"' value='"& nRec &"' checked=true></td>")				
		else
  		Response.Write("<td><input name='checar' id='chk"&nRec&"' type='checkbox' tabindex='"&nRec&"' value='"& nRec &"' ></td>")		
		end if
%>
							<td><input name="qtde" id="qtde<%= nRec %>" class="editbox" value="<%= objrs.Fields.Item("QT_RESTANTE").Value %>" size="5"></td>
							<td align="right"><%= FormatNumber(objrs.Fields.Item("QT_RESTANTE").Value, 2)%></td>
							<td align="right"><%= FormatNumber(objrs.Fields.Item("QT_TOTAL").Value, 2)%></td>
							<td><%= objrs.Fields.Item("NR_PEDIDO").Value%></td>
							<td><%= objrs.Fields.Item("NR_ITEM").Value%></td>
							<td><%= objrs.Fields.Item("RAP").Value %></td>
							<td><%= objrs.Fields.Item("CD_PRODUTO").Value %></td>
							<td><%= objrs.Fields.Item("TX_DESC").Value %></td>
						</tr>
						<%
		nrec = nrec + 1
		objrs.MoveNext
		if objrs.Eof then Exit Do
	loop
'objrs.Close()
%>
						<input name='btnLiquidar' type='submit' class='button' value='Integrar' style='width:70px;' >
					</form>
				</table>
			</div></td>
	</tr>
	<%
else
%>
	<tr>
		<td><p align="center"><b> Não existem arquivos a serem integrados... </b></p></td>
	</tr>
	<%
end if
%>
	<tr height="15" align="center" bgcolor="#DBDADA">
		<td colspan="3"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
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
