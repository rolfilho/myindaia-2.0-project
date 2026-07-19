<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Embarques / Integrações
'Arquivo de Script e HTML: Listagem da Instrução de Embarque
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrRap, vNrCde, vTpAcao, vTxStatus, vTpExibe, pNrRap, pNrCDE
dim pagina, sql_s, sql_f, sql_w, sql_o, vTxCampo, vTxOrdem

cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
vTpExibe = Request.QueryString("vTpExibe")
vTxCampo = Request.QueryString("vTxCampo")
vTxOrdem = Request.QueryString("vTxOrdem")
pNrRap = Request.QueryString("pNrRap")
pNrCDE = Request.QueryString("pNrCDE")
if not fnc_TestaVar(vTxCampo) then vTxCampo = "RIGHT('000000000000000'+R.NR_CDE, 15)"
if not fnc_TestaVar(vTxOrdem) then vTxOrdem = "DESC"
'verifica se a pagina é zero, se for seta para 1
'if pagina = 0 then pagina = 1
'nr_reg_pagina  = 30

Sub subVerStatus(pCodStatus)
	select case pCodStatus
		case 0
			vTpAcao   = "visualizar"
			vTxStatus = "Cancelado<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)&" "&_
									Left(fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7), 5)&"</font>"
		case 1
			vTpAcao   = "editar"
			vTxStatus = "Em Aberto<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)&" "&_
									Left(fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7), 5)&"</font>"
		case 2
			vTpAcao   = "visualizar"
			vTxStatus = "Autorizado<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)&" "&_
									Left(fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7), 5)&"</font>"
		case 3
			nr_processo = objrs.Fields.Item("NR_PROCESSO").Value
			vTpAcao   = "visualizar"
			vTxStatus = "<a href=""/detalhe/exp_proc_result.asp?filtro=nr_processo&nr_processo="&nr_processo&""" title=""Instrução Vinculada ao Processo""><b>"&Mid(nr_processo, 5, Len(nr_processo))&"</b></a>"&_
									"<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)&" "&Left(fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7), 5)&"</font>"
		case else
			vTpAcao   = "visualizar"
			vTxStatus = ""
	end select
End Sub

Function fncValidaRap(nRap, nForn, nPack, nNrRap)
	dim vTxImagem, vValida
	if nRap and nForn and nPack then
		vTxImagem  = "btn_check.gif"
		vValida    = "true"
	else
		vTxImagem  = "btn_cancel.gif"
		vValida    = "false"
	end if
	
	fncValidaRap = "<img src='/imagens/icones/16x16/"&vTxImagem&"' class='imgValida' onClick=""ExibeProblemasRap('"&nNrRap&"');"" onMouseOver=""AlternaImgHint(this,"&vValida&");"">"
End Function

function fncOrdemCampo(nCampo, nOrdem)
	if vTxCampo = nCampo then
		if vTxOrdem = "DESC" then vReturn = "ASC" else vReturn = "DESC"
	else
		vReturn = "ASC"
	end if
	fncOrdemCampo = vReturn
end function

'lista RAP´s para exibi-las em tela
if objrs.State = adStateOpen then objrs.Close()
sql_s = "SELECT R.CD_RAP+'/'+R.CD_RAP_ANO AS NR_RAP, R.CD_RAP, R.CD_RAP_ANO, ISNULL(R.NR_FORNECIMENTO, '') AS NR_FORNECIMENTO, "&_
				"  R.NR_CDE, R.NR_PROCESSO, R.CD_STATUS, R.DT_INSERCAO, R.DT_CANCELADO, R.DT_FINALIZADO, "&_
				"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_DEP_COLETA), '') AS NM_DEP_COLETA, "&_
				"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '') AS NM_CLIENTE, "&_
				"  IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, TX_VALIDACAO "
sql_f = "FROM TRAP R (NOLOCK) "
sql_w = "WHERE"
sql_o = "ORDER BY "&vTxCampo&" "&vTxOrdem
'verifica o cargo do usuario
if InStr("040;055;060", Session("cd_cargo")) > 0 then
	sql_f = sql_f&" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
end if

select case vTpExibe
	case 0, 1, 2
		sql_w = sql_w&" R.CD_STATUS = '"&CStr(vTpExibe)&"' "
		sql_o = sql_o&", R.DT_INSERCAO DESC"
	case 3, 4
		if vTpExibe = 4 then str = "NOT" else str = ""
		sql_f = sql_f&" LEFT JOIN TFOLLOWUP F (NOLOCK) ON (F.NR_PROCESSO = R.NR_PROCESSO AND F.CD_EVENTO = '092') "
		sql_w = sql_w&" R.CD_STATUS = '3' AND F.DT_REALIZACAO IS "&str&" NULL "
		sql_o = sql_o&", F.DT_REALIZACAO DESC"
	case 5
		if fnc_TestaVar(pNrRap) then
			pNrRap = Replace(pNrRap, "/", "")
			sql_w = sql_w&" R.CD_RAP+R.CD_RAP_ANO = '"&fnc_AddZeros(pNrRap,8)&"' "
		elseif fnc_TestaVar(pNrCDE) then
			sql_w = sql_w&" R.NR_CDE = '"&pNrCDE&"' "
		else
			sql_w = ""
		end if
end select

sql = sql_s & sql_f & sql_w & sql_o
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
With objcmd
	.CommandTimeOut = 60
	.CommandText    = sql
	.CommandType    = adCmdText
End With
'objrs.PageSize = nr_reg_pagina
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'objrs.AbsolutePage = CInt(pagina)
%>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" style="padding: 2px 2px 0px 2px;" bgcolor="#336699">
					<col width="20">
					<col width="70">
					<col width="200">
					<col width="75">
					<col width="75">
					<col width="200">
					<col width="80">
					<col width="50">
					<col width="50">
					<tr height="18">
						<td class="gridtit">&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_RAP&vTxOrdem=<%= fncOrdemCampo("NR_RAP", vTxOrdem)%>');">Nr. Instr.&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NM_DEP_COLETA&vTxOrdem=<%= fncOrdemCampo("NM_DEP_COLETA", vTxOrdem)%>');">Dep. Coleta&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_CDE&vTxOrdem=<%= fncOrdemCampo("NR_CDE", vTxOrdem)%>');">Nr. CDE&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_FORNECIMENTO&vTxOrdem=<%= fncOrdemCampo("NR_FORNECIMENTO", vTxOrdem)%>');">Nr. Fornec.&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NM_CLIENTE&vTxOrdem=<%= fncOrdemCampo("NM_CLIENTE", vTxOrdem)%>');">Cliente&nbsp;</td>
						<td class="gridtitclick" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=R.NR_PROCESSO, CD_STATUS&vTxOrdem=<%= fncOrdemCampo("CD_STATUS", vTxOrdem)%>');">Status&nbsp;</td>
						<td class="gridtit">Duplicar&nbsp;</td>
						<td class="gridtit">Excluir&nbsp;</td>
					</tr>
					<%
if objrs.RecordCount > 0 then
	nrec = 0
	'do while nrec < objrs.PageSize and not objrs.Eof
	do while not objrs.Eof
		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
		vNrRap = objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value
		if fnc_TestaVar(objrs.Fields.Item("NR_CDE").Value) then
			vNrCde = Replace(Trim(objrs.Fields.Item("NR_CDE").Value),"/","")
			vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
		else
			vNrCde = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;"
		end if
		call subVerStatus(objrs.Fields.Item("CD_STATUS").Value)
%>
					<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
						<td><%= fncValidaRap(objrs.Fields.Item("IN_RAP_VALIDA").Value, objrs.Fields.Item("IN_FORN_VALIDA").Value, objrs.Fields.Item("IN_PACK_VALIDA").Value,vNrRap)%></td>
						<td><nobr><a href="integra_rap.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=<%=vTpAcao%>"><%=objrs.Fields.Item("NR_RAP").Value%></a></nobr></td>
						<td align="left"><%= Server.URLEncode(objrs.Fields.Item("NM_DEP_COLETA").Value)%></td>
						<td><%= vNrCde%></td>
						<td><%= Replace(objrs.Fields.Item("NR_FORNECIMENTO").Value,";"," ")%></td>
						<td align="left"><%= Server.URLEncode(objrs.Fields.Item("NM_CLIENTE").Value)%></td>
						<td><nobr><%= vTxStatus%></nobr></td>
						<td><a href="integra_rap.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=duplicar"><img src="/imagens/icones/16x16/btn_duplicar.gif" height="16" width="16" border="0" alt="Duplicar"></a></td>
						<td><a href="integra_rap.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=deletar"><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir"></a></td>
					</tr>
					<%
		'nrec = nrec + 1
		objrs.MoveNext
		if objrs.Eof then Exit Do
	loop
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='9' align='left'>&nbsp;Clique no Código do Rap para editar a Instrução, Fornecimento e Packing List...&nbsp;</td>"&_
						"</tr>"
	Response.Write(Server.URLEncode(vTxHTML))
else
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='9' align='left'>&nbsp;Não existem instruções para serem exibidas. Clique em Nova Instrução para incluir.&nbsp;</td>"&_
						"</tr>"
	Response.Write(Server.URLEncode(vTxHTML))
end if
%>
				</table>
				<%
objrs.Close()
%>
<!--#include virtual="/includes/inc_ends.asp" -->