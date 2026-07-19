<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Arquivo de Script e HTML: Listagem de Contratos de Câmbio Exportação
'Autor Alexandre Neto
'Criação: 24/08/2007
'Manutenção: 02/10/2007
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
dim vTpStatus : vTpStatus = Request.QueryString("vTpStatus")
dim vTxCampo : vTxCampo = Request.QueryString("vTxCampo")
dim vTxOrdem : vTxOrdem = Request.QueryString("vTxOrdem")
dim vNrContrato, vNrBanco, vTpAcao, vLink
dim sql_s, sql_f, sql_w, sql_o

if not fnc_TestaVar(vTxCampo) then vTxCampo = "NR_CONT_CAMB"
if not fnc_TestaVar(vTxOrdem) then vTxOrdem = "DESC"

function fncVerStatus(nCodStatus)
	select case nCodStatus
		case 2 vReturn = "Dispon&iacute;vel"
		case 3 vReturn = "Embarcado"
		case 4 vReturn = "Liquidado"
		case else vReturn = ""
	end select
	fncVerStatus = vReturn
end function

function fncOrdemCampo(nCampo, nOrdem)
	if vTxCampo = nCampo then
		if vTxOrdem = "DESC" then vReturn = "ASC" else vReturn = "DESC"
	else
		vReturn = "ASC"
	end if
	fncOrdemCampo = vReturn
end function

'lista Contratos para exibi-las em tela
if objrs.State = adStateOpen then objrs.Close()
sql_s = "SELECT C.NR_CONT_CAMB, C.NR_BANCO, C.CD_STATUS_CONT, C.VL_NEGOC, (C.VL_NEGOC - C.VL_ACE) AS VL_ACC, C.VL_ACE, "&_
				"  CD_MOEDA_NEGOC, DT_FECHAMENTO, DT_VENC_DOCTO, DT_VENC_LIQ, "&_
				"  (SELECT COUNT(*) FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) WHERE NR_CONT_CAMB = C.NR_CONT_CAMB AND NR_BANCO = C.NR_BANCO) AS VL_QTDE_FAT "
sql_f = "FROM TCONT_CAMB C (NOLOCK) "
sql_w = "WHERE C.CD_STATUS_CONT = "
sql_o = "ORDER BY C."&vTxCampo&" "&vTxOrdem
'verifica o cargo do usuario
if InStr(CODCLIENTE, Session("cd_cargo")) > 0 then
	sql_f = sql_f&" INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = C.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
end if
'status selecionado
select case vTpStatus
	case 2, 3, 4
		sql_w = sql_w&"'"&CStr(vTpStatus)&"' "
	case else
		sql_w = ""
end select

sql = sql_s & sql_f & sql_w & sql_o
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<table width="100%" border="0" cellpadding="0" cellspacing="1" style="padding: 2px 2px 0px 2px;" bgcolor="#336699">
	<col width="15">
	<col width="70">
	<col width="70">
	<col width="50">
	<col width="75">
	<col width="75">
	<col width="70">
	<col width="70">
	<col width="70">
	<col width="80">
	<col width="50">
	<tr height="36">
		<td class="gridtit">#&nbsp;</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=NR_CONT_CAMB&vTxOrdem=<%= fncOrdemCampo("NR_CONT_CAMB", vTxOrdem)%>');">Nr. Contrato</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=NR_BANCO&vTxOrdem=<%= fncOrdemCampo("NR_BANCO", vTxOrdem)%>');">Nr. Banco</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=CD_MOEDA_NEGOC&vTxOrdem=<%= fncOrdemCampo("CD_MOEDA_NEGOC", vTxOrdem)%>');">C&oacute;d. Moeda</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=VL_ACC&vTxOrdem=<%= fncOrdemCampo("VL_ACC", vTxOrdem)%>');">Saldo ACC</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=VL_ACE&vTxOrdem=<%= fncOrdemCampo("VL_ACE", vTxOrdem)%>');">Saldo ACE</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=DT_VENC_LIQ&vTxOrdem=<%= fncOrdemCampo("DT_VENC_LIQ", vTxOrdem)%>');">Dt. Vencto.</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=DT_FECHAMENTO&vTxOrdem=<%= fncOrdemCampo("DT_FECHAMENTO", vTxOrdem)%>');">Dt. Fechamento</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=DT_VENC_DOCTO&vTxOrdem=<%= fncOrdemCampo("DT_VENC_DOCTO", vTxOrdem)%>');">Dt. Vencto. Doctos.</td>
		<td class="gridtitclick" onclick="CarregaViaGet('divCorpo','cclista','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus=<%= vTpStatus%>&vTxCampo=CD_STATUS_CONT&vTxOrdem=<%= fncOrdemCampo("CD_STATUS_CONT", vTxOrdem)%>');">Status</td>
		<td class="gridtit">Excluir</td>
	</tr>
	<%
if objrs.RecordCount > 0 then
	do while not objrs.Eof
		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
		vNrContrato = objrs.Fields.Item("NR_CONT_CAMB").Value
		vNrBanco = objrs.Fields.Item("NR_BANCO").Value
		vLink = "cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrContrato="&vNrContrato&"&vNrBanco="&vNrBanco&"&vTpAcao=" 
		if objrs.Fields.Item("VL_QTDE_FAT").Value = 0 then vTpAcao = "editar" else vTpAcao = "visualizar"
%>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
		<td><img src="/imagens/icones/btn_plus.gif" width="11" height="11" alt="Exibir todas faturas vinculadas a este embarque." style="cursor: hand;" onclick="abreFaturasVinc('<%= vNrContrato%>', '<%= vNrBanco%>');"/></td>
		<td><a href="<%= vLink&vTpAcao%>"><%= vNrContrato%></a></td>
		<td><%= vNrBanco%></td>
		<td><%= objrs.Fields.Item("CD_MOEDA_NEGOC").Value%></td>
		<td align="right"><%= FormatNumber(objrs.Fields.Item("VL_ACC").Value, 2)%></td>
		<td align="right"><%= FormatNumber(objrs.Fields.Item("VL_ACE").Value, 2)%></td>
		<td><%= fnc_Mascara(objrs.Fields.Item("DT_VENC_LIQ").Value, 5)%></td>
		<td><%= fnc_Mascara(objrs.Fields.Item("DT_FECHAMENTO").Value, 5)%></td>
		<td><%= fnc_Mascara(objrs.Fields.Item("DT_VENC_DOCTO").Value, 5)%></td>
		<td><%= fncVerStatus(objrs.Fields.Item("CD_STATUS_CONT").Value)%></td>
		<td><a href="<%= vLink%>deletar"><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir"></a></td>
	</tr>
	<%
		objrs.MoveNext
		if objrs.Eof then Exit Do
	loop
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='11' align='left'>&nbsp;Clique no Código do Contrato para editar/visualizar o Contrato de Câmbio.&nbsp;</td>"&_
						"</tr>"
else
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='11' align='left'>&nbsp;Não existem contratos para serem exibidos. Clique no botão Novo para incluir.&nbsp;</td>"&_
						"</tr>"
end if
Response.Write(Server.URLEncode(vTxHTML))
%>
</table>
<%
objrs.Close()
%>
<!--#include virtual="/includes/inc_ends.asp" -->
