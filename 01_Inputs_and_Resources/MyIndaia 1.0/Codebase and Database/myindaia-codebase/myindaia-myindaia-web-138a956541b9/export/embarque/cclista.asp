<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
Server.ScriptTimeout = 9999
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim vTpExibe : vTpExibe = Request.QueryString("vTpExibe")
dim vTxCampo : vTxCampo = Request.QueryString("vTxCampo")
dim vTxOrdem : vTxOrdem = Request.QueryString("vTxOrdem")
dim pNrRap : pNrRap = Request.QueryString("pNrRap")
dim pNrFornec : pNrFornec = Request.QueryString("pNrFornec")
dim pPais : pPais = Request.QueryString("pPais")
dim pNrCDE : pNrCDE = Request.QueryString("pNrCDE")
dim vNrRap, vNrCde, vNrFornec, vPais, vTpAcao, vTxStatus
dim pagina, sql_s, sql_f, sql_w, sql_o, str2
Dim str_fornecimentos, str_aux, mtz_fornecimentos, j, i

if not fnc_TestaVar(vTxCampo) then vTxCampo = "R.CD_RAP_ANO DESC, R.CD_RAP"
if not fnc_TestaVar(vTxOrdem) then vTxOrdem = "DESC"
'verifica se a pagina é zero, se for seta para 1
if pagina = 0 then pagina = 1
nr_reg_pagina  = 30

sub subVerStatus(pCodStatus, pCodStatusDocto)
	select case pCodStatus
		case 0
			vTpAcao   = "visualizar"
			vTxStatus = "Cancelado<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)&" "&_
									Left(fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7), 5)&"</font>"
		case 1
			vTpAcao   = "editar"
      Select case PcOdStatusDocto
			case 1
  			vTxStatus = "Em Aberto<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)&" "&_
	  								Left(fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7), 5)&"</font>"
			case 2
  			vTxStatus = "Autorizado para Emiss&atilde;o de Doctos.<br>Embarque em Aberto<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)&" "&_
	  								Left(fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7), 5)&"</font>"
  		case 3
	  		nr_processo = objrs.Fields.Item("NR_PROCESSO").Value
			  vTxStatus = "<a href=""/detalhe/exp_proc_result.asp?filtro=nr_processo&nr_processo="&nr_processo&""" title=""Autorizado emiss&atilde;o de Documentos""><b>"&Mid(nr_processo, 5, Len(nr_processo))&"</b></a>"&_
				  					"<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO_PEDIDO").Value, 5)&" "&Left(fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO_PEDIDO").Value, 7), 5)&"</font>"&_
										"<br>Embarque em Aberto<br>"
      end select										
		case 2
			vTpAcao   = "visualizar"
			vTxStatus = "Autorizado<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)&" "&_
									Left(fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7), 5)&"</font>"
		case 3
			nr_processo = objrs.Fields.Item("NR_PROCESSO").Value
			vTpAcao   = "visualizar"
			vTxStatus = "<a href=""/detalhe/exp_proc_result.asp?filtro=nr_processo&nr_processo="&nr_processo&""" title=""Instru&ccedil;&atilde;o Vinculada ao Processo""><b>"&Mid(nr_processo, 5, Len(nr_processo))&"</b></a>"&_
									"<br><font style='font-size:8px;'>"&fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)&" "&Left(fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7), 5)&"</font>"
		case else
			vTpAcao   = "visualizar"
			vTxStatus = ""
	end select
end sub

function fncValidaPedido(nRap, nForn, nPack, nPed, nNrRap)
	dim vTxImagem, vValida
	if nRap and nForn and nPack then
		vTxImagem  = "btn_checktxt.gif"
		vValida    = "true"
	else
		if nPed then 
  		vTxImagem  = "btn_checktxt.gif"
  		vValida    = "true"
		else
  		vTxImagem  = "btn_canceltxt.gif"
  		vValida    = "false"
		end if
	end if
	fncValidaPedido = "<img src='/imagens/30/"&vTxImagem&"' class='imgValida' onClick=""ExibeProblemasRap('"&nNrRap&"', '1');"" onMouseOver=""AlternaImgHint(this,"&vValida&");"">"
end function

function fncValidaRap(nRap, nForn, nPack, nNrRap, nStatus, nDtFaturamento)
	dim vTxImagem, vValida
	if Session("GrupoUsuario") = "241" Then
	if nRap and nForn and nPack and fnc_testaVar(nDtFaturamento) then
		If nStatus = "2" or nStatus = "3" Then
			If nStatus = "2" Then
				vTxImagem  = "leg_verde2.gif"
			Else
				vTxImagem  = "leg_azul2.gif"
			End If
		Else
			vTxImagem  = "leg_amarelo2.gif"
		End If
		vValida    = "true"
	else
		vTxImagem  = "leg_vermelho2.gif"
		vValida    = "false"
	end if
	else
	if nRap and nForn and nPack then
		If nStatus = "2" or nStatus = "3" Then
			If nStatus = "2" Then
				vTxImagem  = "leg_verde2.gif"
			Else
				vTxImagem  = "leg_azul2.gif"
			End If
		Else
			vTxImagem  = "leg_amarelo2.gif"
		End If
		vValida    = "true"
	else
		vTxImagem  = "leg_vermelho2.gif"
		vValida    = "false"
	end if
	end if
	fncValidaRap = "<img src='/imagens/30/"&vTxImagem&"'  class='imgValida' onClick=""ExibeProblemasRap('"&nNrRap&"', '0');"" onMouseOver=""AlternaImgHint(this,"&vValida&");"">"
end function

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
'SELECT ANTIGO
'sql_s = "SELECT R.CD_RAP+'/'+R.CD_RAP_ANO AS NR_RAP, R.CD_RAP, R.CD_RAP_ANO, ISNULL(R.NR_FORNECIMENTO, '') AS NR_FORNECIMENTO, "&_
	'			"  R.NR_CDE, R.NR_PROCESSO, R.CD_STATUS, R.CD_STATUS_DOCTO, R.DT_FINALIZADO_PEDIDO, R.DT_INSERCAO, R.DT_CANCELADO, R.DT_FINALIZADO, "&_
	'			"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_DEP_COLETA), '') AS NM_DEP_COLETA, "&_
	'			"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '') AS NM_CLIENTE, "&_
	'			"  IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, IN_PEDIDO_VALIDA, TX_VALIDACAO "
sql_s = "SELECT TOP 300 R.CD_RAP+'/'+R.CD_RAP_ANO  AS NR_RAP, R.CD_RAP, R.CD_RAP_ANO, ISNULL(R.NR_FORNECIMENTO, '') AS NR_FORNECIMENTO, "&_
				"  R.NR_CDE, ISNULL(R.NR_PROCESSO,'') AS NR_PROCESSO, R.CD_STATUS, R.CD_STATUS_DOCTO, R.DT_FINALIZADO_PEDIDO, R.DT_INSERCAO, R.DT_CANCELADO, R.DT_FINALIZADO, "&_
				"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_DEP_COLETA), '') AS NM_DEP_COLETA, "&_
				"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '') AS NM_CLIENTE, "&_
				"  ISNULL((SELECT PB.NM_PAIS FROM TEMPRESA_EST EE(NOLOCK) INNER JOIN TPAIS_BROKER PB (NOLOCK) ON PB.CD_PAIS = EE.CD_PAIS WHERE EE.CD_EMPRESA = R.CD_CONSIGNATARIO), '') AS NM_PAIS_CONSIGNATARIO, "&_
				"  IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, IN_PEDIDO_VALIDA, TX_VALIDACAO, DT_FATURAMENTO "

sql_f = "FROM TRAP R (NOLOCK) "
sql_w = "WHERE"
sql_o = "ORDER BY "&vTxCampo&" "&vTxOrdem
'verifica o cargo do usuario
'if InStr("040;055;060", Session("cd_cargo")) > 0 then
'	sql_f = sql_f&" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
'end if

select case vTpExibe
	case 0, 1, 2
		sql_w = sql_w&" R.CD_STATUS = '"&CStr(vTpExibe)&"' AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1' "
		sql_o = sql_o&", R.DT_INSERCAO DESC"
	case 3, 4, 6
		if vTpExibe = 3 then 
			str = ""
			if Session("InDivideEmbarcadosCheck") = "1" Then
			str2 = ""
				sql_w = sql_w&" R.CD_STATUS = '3' AND F.DT_REALIZACAO IS "&str&" NULL AND F1.DT_REALIZACAO IS "&str2&" NULL AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
			Else
				sql_w = sql_w&" R.CD_STATUS = '3' AND F.DT_REALIZACAO IS "&str&" NULL AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
			End If	
		End If
			
		if vTpExibe = 4 then 
			str = "NOT"
			sql_w = sql_w&" R.CD_STATUS = '3' AND F.DT_REALIZACAO IS "&str&" NULL AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
		End If
		
		if vTpExibe = 6 then 
			str  = ""
			str2 = "NOT"
			sql_w = sql_w&" R.CD_STATUS = '3' AND F.DT_REALIZACAO IS "&str&" NULL AND F1.DT_REALIZACAO IS "&str2&" NULL AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
		End If
		sql_f = sql_f&" LEFT JOIN TFOLLOWUP F (NOLOCK) ON (F.NR_PROCESSO = R.NR_PROCESSO AND F.CD_EVENTO = '092') "
		sql_f = sql_f&" LEFT JOIN TFOLLOWUP F1 (NOLOCK) ON (F1.NR_PROCESSO = R.NR_PROCESSO AND F1.CD_EVENTO = '165') "
		sql_o = sql_o&", F.DT_REALIZACAO DESC"
	case 5
		if fnc_TestaVar(pNrRap) Then
			'pNrRap = Replace(pNrRap, "/", "")
			sql_w = sql_w&" R.CD_RAP+'/'+R.CD_RAP_ANO LIKE '%"&pNrRap&"%' AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
		End If
        if fnc_TestaVar(pNrCDE) then
			sql_w = sql_w&" R.NR_CDE = '"&pNrCDE&"' AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
		End If        
        If fnc_TestaVar(pNrFornec) Then
            sql_w = sql_w&" R.NR_FORNECIMENTO LIKE '%"&pNrFornec&"%' AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
        End If 
        If fnc_TestaVar(pPais) Then
           sql_w = sql_w&" (SELECT PB.NM_PAIS FROM TEMPRESA_EST EE (NOLOCK) "&_ 
           " INNER JOIN TPAIS_BROKER PB (NOLOCK) ON PB.CD_PAIS = EE.CD_PAIS "&_
           " WHERE EE.CD_EMPRESA = R.CD_CONSIGNATARIO) LIKE '%" & pPais & "%' "&_
           " AND R.CD_GRUPO = '" & Session("GrupoUsuario") & "' AND ISNULL(R.IN_MODELO,0) <> '1'"
        End If
end select

sql = sql_s & sql_f & sql_w & sql_o

'Response.write sql
'Response.end

Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
with objcmd
	.CommandTimeOut = 9999
	.CommandText    = sql
	.CommandType    = adCmdText
end with
'objrs.PageSize = nr_reg_pagina
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'objrs.AbsolutePage = CInt(pagina)
%>
<style type="text/css">
<!--
.style1 {}
-->
</style>

<table width="98%" border="0" cellpadding="1" cellspacing="1" style="border-color:<%=bg_detalhes_borda%>;border-width:1px;border-style:solid;" bgcolor="#FFFFFF" align="center">
	<tr height="18">
		<td width="16" class="gridtit" style="border:0;background-color:<%=cabec_result%>;">&nbsp;</td>
		<td width="70" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_RAP&vTxOrdem=<%= fncOrdemCampo("NR_RAP", vTxOrdem)%>');">&nbsp;RAP</td>
        <%If Session("GrupoUsuario") = "028" Then%>
		<td width="100" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NM_DEP_COLETA&vTxOrdem=<%= fncOrdemCampo("NM_DEP_COLETA", vTxOrdem)%>');">&nbsp;Dep. Coleta</td>
		<td width="100" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_FORNECIMENTO&vTxOrdem=<%= fncOrdemCampo("NR_FORNECIMENTO", vTxOrdem)%>');">&nbsp;Fornecimentos</td>
        <%Else%>
        <td width="100" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NR_FORNECIMENTO&vTxOrdem=<%= fncOrdemCampo("NR_FORNECIMENTO", vTxOrdem)%>');">&nbsp;Processo</td>
        <%End If%>
		<td width="100" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NM_CLIENTE&vTxOrdem=<%= fncOrdemCampo("NM_CLIENTE", vTxOrdem)%>');">&nbsp;Cliente</td>
        <td width="100" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=NM_PAIS_CONSIGNATARIO&vTxOrdem=<%= fncOrdemCampo("NM_PAIS_CONSIGNATARIO", vTxOrdem)%>');"><nobr>&nbsp;Pa&iacute;s&nbsp;(Recebedor)</nobr></td>
		<td width="60" class="gridtitclick" style="text-align:left;background-color:<%=cabec_result%>;" onclick="ExibeListaRap('divCorpo',<%= vTpExibe%>,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTxCampo=R.NR_PROCESSO, CD_STATUS&vTxOrdem=<%= fncOrdemCampo("CD_STATUS", vTxOrdem)%>');">&nbsp;Status</td>
        <td width="100" class="gridtit" style="border:0;text-align:left;background-color:<%=cabec_result%>;">&nbsp;Ações</td>
	</tr>
	<%
if objrs.RecordCount > 0 then
	nrec = 0
	'do while nrec < objrs.PageSize and not objrs.Eof
	do while not objrs.Eof
        'If Len(Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value)) >= 54 Then
            str_fornecimentos = ""
            mtz_fornecimentos = Split(objrs.Fields.Item("NR_FORNECIMENTO").Value, ";")    
            j = 0
            For i = 0 to UBound(mtz_fornecimentos)        
                str_fornecimentos =  str_fornecimentos & mtz_fornecimentos(I) & " "
                j = j + 1
                If j = 7 Then
                    str_fornecimentos = str_fornecimentos & "<br>"
                    j = 0
                End If
            Next
        'Else
           str_fornecimentos = Replace(str_fornecimentos, ";", " ")
        'End If
		if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
		vNrRap = objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value
	'	if fnc_TestaVar(objrs.Fields.Item("NR_CDE").Value) then
	'		vNrCde = Replace(Trim(objrs.Fields.Item("NR_CDE").Value),"/","")
	'		vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
	'	else
	'		vNrCde = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;"
	'	end if
		call subVerStatus(objrs.Fields.Item("CD_STATUS").Value, objrs.Fields.Item("CD_STATUS_DOCTO").Value )
%>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
		<td><%= fncValidaRap(objrs.Fields.Item("IN_RAP_VALIDA").Value, objrs.Fields.Item("IN_FORN_VALIDA").Value, objrs.Fields.Item("IN_PACK_VALIDA").Value,vNrRap,objrs.Fields.Item("CD_STATUS").Value,objrs.Fields.Item("DT_FATURAMENTO").Value) %></td>
		<td align="left"><nobr><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>"><%=objrs.Fields.Item("NR_RAP").Value%></a><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>">
			<%if objrs.Fields.Item("NR_CDE").Value<>"" then%>
		</a><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>"><br>
		<span class="style1">(</span></a><span class="style1"><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar"></a><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>"><font style='font-size:8px;'><%=objrs.Fields.Item("NR_CDE").Value%></a><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>">)</a><a href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=editar&vTpExibe=<%=vTpExibe%>">
		<%end if%>
		</a></td>
        <%If Session("GrupoUsuario") = "028" Then%>
		<td align="left" title="<%=objrs.Fields.Item("NM_DEP_COLETA").Value %>"><%If Len(objrs.Fields.Item("NM_DEP_COLETA").Value) > 28 Then Response.write Left(objrs.Fields.Item("NM_DEP_COLETA").Value, 28) & "..." Else Response.write objrs.Fields.Item("NM_DEP_COLETA").Value End If%></td>
        <%End If%>
		<td align="left"><%= str_fornecimentos%></td>
		<td align="left" title="<%=objrs.Fields.Item("NM_CLIENTE").Value %>"><%If Len(objrs.Fields.Item("NM_CLIENTE").Value) > 28 Then Response.write Left(objrs.Fields.Item("NM_CLIENTE").Value, 28) & "..." Else Response.write objrs.Fields.Item("NM_CLIENTE").Value End If%></td>
        <td align="left"><%= Server.URLEncode(objrs.Fields.Item("NM_PAIS_CONSIGNATARIO").Value)%></td>
		<td align="left"><nobr><%= vTxStatus%></nobr></td>
        <td><a href="ccprint.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>" target="_blank"><img src="/imagens/30/rap/imprimir16.gif" height="16" width="16" border="0" alt="Imprimir"></a>&nbsp;
        <a href="cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=duplicar"><img src="/imagens/30/rap/duplicar16.gif" height="16" width="16" border="0" alt="Duplicar"></a>&nbsp;
        <a onclick="if (confirm('Tem certeza em excluir a instrução?')) {location.href = 'cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=deletar&vTpExibe=<%=vTpExibe%>';}"><img src="/imagens/30/rap/lixeira16.gif" height="16" width="16" border="0" alt="Excluir" style="cursor:pointer;"></a></td>
	</tr>
	<%
		'nrec = nrec + 1
		objrs.MoveNext
		if objrs.Eof then Exit Do
	loop	
else	
  %>
  <tr height="15" bgcolor="<%= linha_result%>" align="center" valign="top">
  <td colspan="8">
  <img name="imgAlerta" src="/imagens/30/alerta_32.gif" style="border:0;" align="absmiddle">Não existem instruções para serem exibidas
  </td>
  </tr>
  <%
end if
objrs.Close()
%>
</table>
