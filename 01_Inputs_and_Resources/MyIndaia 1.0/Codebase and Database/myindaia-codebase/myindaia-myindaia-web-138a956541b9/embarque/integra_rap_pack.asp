<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação/Intrução de Embarque/RAP
'Arquivo de Script e HTML: Eibição de Packing List
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
vInDebug = false
dim vNrRap     : vNrRap = Request.QueryString("vNrRap")
dim vCodVolume : vCodVolume = Request.QueryString("vCodVolume")
dim vCodMerc   : vCodMerc = Request.QueryString("vCodMerc")
dim vTpAcao    : vTpAcao = Request.QueryString("vTpAcao")
dim vNrPagina  : vNrPagina = CInt(Request.QueryString("vNrPagina"))

cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
'verifica se teve uma requisição para excluir volume/mercadoria
if vTpAcao = "deletar" then
	'verifica se é para excluir uma mercadoria
	if fnc_TestaVar(vCodMerc) then
		sql = "DELETE TRAP_PACK_LIST WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_VOLUME = '"&vCodVolume&"' AND CD_MERCADORIA = '"&vCodMerc&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		vCodMerc = ""
		tx_erro = "Mercadoria "&vCodMerc&" excluida com sucesso!"
		
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT COUNT(*) FROM TRAP_PACK_LIST (NOLOCK) "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_VOLUME = '"&vCodVolume&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		if objrs.Fields.Item(0).Value = 0 then
			sql = "DELETE TRAP_PACK_VOLUME WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_VOLUME = '"&vCodVolume&"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			vCodVolume = ""
			tx_erro = "\nTodas as mercadorias do volume "&vCodVolume&" foram excluidas. O volume também será exluido."
		end if
	else
		sql = "DELETE TRAP_PACK_LIST WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_VOLUME = '"&vCodVolume&"' "&_
					"DELETE TRAP_PACK_VOLUME WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_VOLUME = '"&vCodVolume&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		vCodVolume = ""
		tx_erro = "O volume "&vCodVolume&" e todas as mercadorias desse volume foram excluidas."
	end if
	
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT COUNT(*) FROM TRAP_PACK_LIST (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
	if objrs.Fields.Item(0).Value = 0 then
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT IN_AMOSTRA FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'caso não existam packing list, apenas torna a rap apta a recebe-los
		if objrs.Fields.Item(0).Value then
			str = "Instrução com mercadorias de amostra, não é necessário incluir o Packing List."
			sql = "UPDATE TRAP SET IN_PACK_VALIDA = 1, TX_VALIDACAO = '"&str&"' WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
		else
			str = "Instrução de embarque pronta para receber o Packing List."
			sql = "UPDATE TRAP SET IN_PACK_VALIDA = 0, TX_VALIDACAO = '"&str&"' WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
		end if
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
	else
		'se já estiverem integrados, executa procedure de verificação
		with objcmd
			.CommandTimeOut = 60
			.CommandText    = "sp_rap_verifica_pack"
			.CommandType    = adCmdStoredProc
			.Parameters.Refresh
			.Parameters("@nrRap") = vNrRap
			.Execute , , adExecuteNoRecords
		end with
	end if
end if
'seleciona os volumes da rap
if objrs.State = adStateOpen then objrs.Close()
objrs.PageSize = 1

sql = "SELECT COUNT(*), LTRIM(RTRIM(CD_VOLUME)) AS CD_VOLUME FROM TRAP_PACK_VOLUME (NOLOCK) "&_
			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' GROUP BY CD_VOLUME ORDER BY CD_VOLUME"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if vNrPagina = 0 then vNrPagina = 1
objrs.AbsolutePage = CInt(vNrPagina)
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td class="titpopup">&nbsp;Packing List - Instru&ccedil;&atilde;o de Embarque <%= Left(vNrRap, 6)&"/"&Right(vNrRap,2)%></td>
					<td align="right"><a href="#" onClick="FechaListaPack('divPackList','divVolume');">[fechar e retornar a edi&ccedil;&atilde;o da rap]<img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" align="absmiddle"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
	<%
if objrs.RecordCount > 0 then
	if not fnc_TestaVar(vCodVolume) then vCodVolume = objrs.Fields.Item("CD_VOLUME").Value
%>
	<tr height="25">
		<td bgcolor="#EEEEEE" style="border: solid 2px #DEDEDE;"><a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vCodVolume=<%= vCodVolume%>&vTpAcao=deletar');"><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir Volume" align="absmiddle"></a> Volume <b><%= vCodVolume%></b>
		<%
	'verifica se &eacute; para exibir anterior
	If vNrPagina > 1 Then
%>
            <a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vNrPagina=1');"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
						<a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vNrPagina=<%=(vNrPagina-1)%>');"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="<%= tx_lang_A00070(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='"& tx_lang_A00069(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='"& tx_lang_A00070(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
            <select name="vNrPagina" class="select" onChange="MM_jumpMenu('self',this,0);">
              <%
	For cont = 1 To objrs.PageCount
		If vNrPagina = cont Then selected = " selected" Else selected = ""
		objrs.AbsolutePage = CInt(cont)
		Response.Write("<option value='"&cont&"'"& selected &">"&objrs.Fields.Item("CD_VOLUME").Value&"</option>")
	Next
	objrs.AbsolutePage = CInt(vNrPagina)
%>
            </select>
            <%
	'verifica se &eacute; para exibir Pr&oacute;xima
	If vNrPagina < objrs.PageCount Then
%>
            <a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vNrPagina=<%=(vNrPagina+1)%>');"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="<%= tx_lang_A00071(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
						<a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vNrPagina=<%=objrs.PageCount%>');"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='"& tx_lang_A00071(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='"& tx_lang_A00072(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
		</td>
	</tr>
	<tr>
		<td valign="top"><div id="divVolume">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
				<tr align="center">
					<td class="gridtit">C&oacute;d. Mercadoria</td>
					<td class="gridtit">Especifica&ccedil;&atilde;o</td>
					<td class="gridtit">Qtde.</td>
					<td class="gridtit">Unidade</td>
					<td class="gridtit">Peso L&iacute;quido </td>
					<td class="gridtit">Erros</td>
					<td class="gridtit">Excluir</td>
				</tr>
				<%
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT P.CD_MERCADORIA, ISNULL(VL_QTDE, 0) AS VL_QTDE, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, "&_
				"  ISNULL(TX_UNID_MEDIDA, '') AS TX_UNID_MEDIDA, ISNULL(AP_MERCADORIA, '') AS NM_MERCADORIA, TP_ERRO_VALIDA "&_
				"FROM TRAP_PACK_LIST P (NOLOCK) " &_
				"  LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = P.CD_MERCADORIA) "&_
				"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
				"  AND CD_VOLUME = '"&vCodVolume&"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	do while not objrs.Eof
%>
				<tr bgcolor="#FFFFFF">
					<td align="center"><%= objrs.Fields.Item("CD_MERCADORIA").Value%></td>
					<td><%= objrs.Fields.Item("NM_MERCADORIA").Value%></td>
					<td align="right"><%= objrs.Fields.Item("VL_QTDE").Value%></td>
					<td align="center"><%= objrs.Fields.Item("TX_UNID_MEDIDA").Value%></td>
					<td align="right"><%= objrs.Fields.Item("VL_PESO_LIQ").Value%></td>
					<td><%= fncExibeTiposErro(objrs.Fields.Item("TP_ERRO_VALIDA").Value, 1)%></td>
					<td align="center"><a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vCodVolume=<%= vCodVolume%>&vCodMerc=<%= objrs.Fields.Item("CD_MERCADORIA").Value%>&vTpAcao=deletar');"><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir Mercadoria"></a></td>
				</tr>
				<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
%>
			</table></div></td>
	</tr>
	<%
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT TX_EMBALAGEM, VL_M3, VL_PESO_BRUTO_TOT, VL_PESO_LIQ_TOT "&_
				"FROM TRAP_PACK_VOLUME (NOLOCK) " &_
				"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
				"  AND CD_VOLUME = '"&vCodVolume&"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
	<tr height="30">
		<td align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE" style="border: solid 1px #DEDEDE;">
				<col width="80" />
				<col width="120" />
				<col width="80" />
				<col width="120" />
				<col width="80" />
				<col width="120" />
				<tr height="15">
					<td><b>Cubagem:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_M3").Value, 3)%></td>
					<td><b>Peso L&iacute;quido:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_PESO_LIQ_TOT").Value, 4)%></td>
					<td><b>Peso Bruto:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO_TOT").Value, 4)%></td>
				</tr>
				<tr height="15">
					<td><b>Embalagem:</b></td>
					<td colspan="5"><%= objrs.Fields.Item("TX_EMBALAGEM").Value%></td>
				</tr>
			</table></td>
	</tr>
	<%
else
%>
	<tr>
		<td>Não existem volumes no packing list dessa instrução.</td>
	</tr>
	<%
end if
%>
</table>
<!--#include virtual="/includes/inc_ends.asp" -->
