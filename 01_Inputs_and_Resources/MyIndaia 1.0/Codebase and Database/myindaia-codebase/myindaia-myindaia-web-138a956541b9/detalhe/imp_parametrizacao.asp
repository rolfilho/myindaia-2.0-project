<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: Parametização de DI
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
Function fnc_ExibeCanal(cd_canal, in_exibe_nome)
	Dim return
	Dim tp_canal
	Dim nm_canal
	
	Select Case cd_canal
		Case "V" tp_canal = 0
		Case "D" tp_canal = 2
		Case "A" tp_canal = 3
		Case "L" tp_canal = 1
		Case "N" tp_canal = 7
		Case Else tp_canal = 4
	End Select
	
	nm_canal = tipo_canal(tp_canal)
	return = "<img src='/imagens/30/tp_canal_"& tp_canal &".gif' height=16 width=16 align=absmiddle>"
	
	If in_exibe_nome Then
		return = return &" "& nm_canal
	End If
	
	fnc_ExibeCanal = return
End Function

Dim dt_danou
Dim tx_danou
nr_processo = Request.QueryString("nr_processo")

'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

sql = "SELECT TOP 1 PP.NR_DI, PP.DATA_CONSULTA, PP.HORA_CONSULTA, PP.CD_CANAL, PP.TX_ETAPA, PP.TX_FISCAL, "&_
			"  PP.DATA_SITUACAO, PP.TX_SITUACAO, PP.DATA_EXAME, PP.TX_EXAME, PP.DATA_RETIFICA, PP.TX_RETIFICA, "&_
			"  PP.TX_AFRMM, PP.TX_ICMS, FU.DT_REALIZACAO AS DT_REGISTRO_DI, "&_
			" (SELECT DESCRICAO FROM TURF (NOLOCK) WHERE CODIGO = '0'+PP.CD_PORTO) AS NM_PORTO, "&_
			" (SELECT AP_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = PR.CD_UNID_NEG) AS AP_UNID_NEG "&_
			"FROM BROKER.DBO.TPROCESSO_PARAMETRIZACAO PP (NOLOCK) "&_
			"  INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_DI = PP.NR_DI) "&_
			"  INNER JOIN TFOLLOWUP FU (NOLOCK) ON (FU.NR_PROCESSO = PR.NR_PROCESSO AND FU.CD_EVENTO = '021') "&_
			"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
			"ORDER BY PP.DATA_CONSULTA DESC, PP.HORA_CONSULTA DESC "
'Response.Write(sql)
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divParam {
	position:absolute;
	left:0px;
	top:25px;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}
.divDanou {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
	background:#FFFFFF;
	padding: 2px;
}
.divHistorico {
	position:absolute;
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
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
	<tr height="25" bgcolor="#b4c7db" align="center">
        <td><b><%= tx_lang_POP056(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td>
	</tr>
	<tr>
		<td><div id="parametrizacao" class="divParam">
				<%
If objrs.Eof Then
	Response.Write("Não foram encontrados dados da parametrização para este processo.")
Else
%>
				<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr height="20">
						<td colspan="4"><span style="font-weight:bold; color:#0000FF;"><%= objrs.Fields.Item("NM_PORTO").Value%></span></td>
					</tr>
					<tr>
						<td width="25%"><b>Número da DI</b><br>
							<fieldset style="height: 18px; width: 95px; padding: 0 0 0 5; background:#EFEFEF;">
							<%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%>
							</fieldset></td>
						<td width="25%"><b>Registro da DI</b><br>
							<fieldset style="height: 18px; width: 85px; text-align:center; background:#EFEFEF;">
							<%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%>
							</fieldset></td>
						<td width="25%"><b>Unidade</b><br>
							<fieldset style="height: 18px; width: 85px; text-align:center; background:#EFEFEF;">
							<%= objrs.Fields.Item("AP_UNID_NEG").Value%>
							</fieldset></td>
						<td width="25%"><b>Data/Hora da Consulta</b><br>
							<fieldset style="height: 18px; width: 140px; text-align:center; background:#EFEFEF;">
							<%= fnc_Mascara(objrs.Fields.Item("DATA_CONSULTA").Value, 5) &" às "& Left(objrs.Fields.Item("HORA_CONSULTA").Value, 2) &":"& Right(objrs.Fields.Item("HORA_CONSULTA").Value, 2)%>
							</fieldset></td>
					</tr>
					<tr>
						<td colspan="4"><b>AFRM</b><br>
							<fieldset style="height: 18px; padding: 0 3 2 5; background:#EFEFEF;">
							<%= objrs.Fields.Item("TX_AFRMM").Value%>
							</fieldset></td>
					</tr>
					<tr>
						<td colspan="4"><b>ICMS</b><br>
							<fieldset style="height: 18px; padding: 0 3 2 5; background:#EFEFEF;">
							<%= objrs.Fields.Item("TX_ICMS").Value%>
							</fieldset></td>
					</tr>
					<tr>
						<td colspan="4"><b>Situação</b><br>
							<fieldset style="height: 18px; padding: 2 0 5 5; background:#EFEFEF;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="3"><span style="color:#0000FF;">Descrição da Sitação do Despacho</span><br>
										<%= objrs.Fields.Item("TX_SITUACAO").Value%></td>
								</tr>
								<tr>
									<td style="color:#0000FF;">Etapa do Despacho</td>
									<td><%
	If fnc_TestaVar(objrs.Fields.Item("DATA_SITUACAO").Value) Then
		Response.Write("<span style='color:#0000FF;'>Data</span> "& fnc_Mascara(objrs.Fields.Item("DATA_SITUACAO").Value, 5))
	End If
%>
									</td>
									<td><span style='color:#0000FF;'>Canal</span> <%= fnc_ExibeCanal(objrs.Fields.Item("CD_CANAL").Value, 1)%></td>
								</tr>
								<tr>
									<td><%= objrs.Fields.Item("TX_ETAPA").Value%></td>
								</tr>
							</table>
							</fieldset></td>
					</tr>
					<tr>
						<td colspan="4"><span style="color:#0000FF;">Funcionário/Fiscal Responsável</span> <%= objrs.Fields.Item("TX_FISCAL").Value%></td>
					</tr>
					<%
	If fnc_TestaVar(objrs.Fields.Item("TX_EXAME").Value) or fnc_TestaVar(objrs.Fields.Item("TX_RETIFICA").Value) Then
		x = "color:#666666;"
		y = "color:#666666;"
		w = ""
		z = ""
		'exame documental
		If fnc_TestaVar(objrs.Fields.Item("TX_EXAME").Value) Then
			dt_danou = fnc_Mascara(objrs.Fields.Item("DATA_EXAME").Value, 5)
			tx_danou = Replace(objrs.Fields.Item("TX_EXAME").Value, "", "<br>")
			x = "color:#0000FF;"
			w = " checked"
		End If
		'retificação
		If fnc_TestaVar(objrs.Fields.Item("TX_RETIFICA").Value) Then
			dt_danou = fnc_Mascara(objrs.Fields.Item("DATA_RETIFICA").Value, 5)
			tx_danou = Replace(objrs.Fields.Item("TX_RETIFICA").Value, "", "<br>")
			y = "color:#0000FF;"
			z = " checked"
		End If
%>
					<tr>
						<td colspan="4"><b>Interrompido</b><br>
							<fieldset style="padding: 2 5 5 5; background:#EFEFEF;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr height="20">
									<td width="15"><input type="radio" readonly<%= w%>></td>
									<td width="30%" style="<%= x%>">para Exame Documental</td>
									<td width="15"><input type="radio" readonly<%= z%>></td>
									<td width="30%" style="<%= y%>">para Retificação</td>
									<td width="30%"><span style="color:#0000FF;">Data</span> <%= dt_danou%></td>
								</tr>
								<tr height="40">
									<td colspan="5"><div id="danou" class="divDanou"> <%= tx_danou%> </div></td>
								</tr>
							</table>
							</fieldset></td>
					</tr>
					<%
	End If
	objrs.Close
	'seleciona as consultas anteriores
	sql = "SELECT PP.NR_DI, PP.DATA_CONSULTA, PP.HORA_CONSULTA, PP.CD_CANAL, PP.TX_ETAPA, PP.TX_FISCAL, "&_
				"  PP.DATA_SITUACAO, PP.TX_SITUACAO, PP.TX_AFRMM, PP.TX_ICMS "&_
				"FROM BROKER.DBO.TPROCESSO_PARAMETRIZACAO PP (NOLOCK) "&_
				"  INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_DI = PP.NR_DI) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY PP.DATA_CONSULTA DESC, PP.HORA_CONSULTA DESC "
	'Response.Write(sql)
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vl_heigth = ((objrs.RecordCount + 1) * 17) + 21
%>
					<tr>
						<td colspan="4"><span style="font-weight:bold; color:#0000FF;">Histórico de Consultas</span>
							<fieldset style=" height:<%= vl_heigth%>px; padding: 0px;">
							<div id="historico" class="divHistorico">
								<table width="100%" border="0" cellspacing="1" cellpadding="0">
									<tr height="16" style=" color:#0000FF;">
										<td></td>
										<td>Data</td>
										<td>Hora</td>
										<td>Etapa</td>
										<td>Fiscal</td>
										<td><nobr>Dt. Situação</nobr></td>
										<td>Situação</td>
										<td>AFRMM</td>
										<td>ICMS</td>
									</tr>
									<%
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
									<tr height="16" bgcolor="<%= bgcolor%>">
										<td><%= fnc_ExibeCanal(objrs.Fields.Item("CD_CANAL").Value, 0)%></td>
										<td><nobr><%= fnc_Mascara(objrs.Fields.Item("DATA_CONSULTA").Value, 5)%>&nbsp;</nobr></td>
										<td><nobr><%= Left(objrs.Fields.Item("HORA_CONSULTA").Value, 2) &":"& Right(objrs.Fields.Item("HORA_CONSULTA").Value, 2)%>&nbsp;</nobr></td>
										<td><nobr><%= objrs.Fields.Item("TX_ETAPA").Value%>&nbsp;</nobr></td>
										<td><nobr><%= objrs.Fields.Item("TX_FISCAL").Value%>&nbsp;</nobr></td>
										<td><nobr><%= fnc_Mascara(objrs.Fields.Item("DATA_SITUACAO").Value, 5)%>&nbsp;</nobr></td>
										<td><nobr><%= objrs.Fields.Item("TX_SITUACAO").Value%>&nbsp;</nobr></td>
										<td><nobr><%= objrs.Fields.Item("TX_AFRMM").Value%>&nbsp;</nobr></td>
										<td><nobr><%= objrs.Fields.Item("TX_ICMS").Value%>&nbsp;</nobr></td>
									</tr>
									<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
								</table>
							</div>
							</fieldset></td>
					</tr>
					<%
End If
objrs.Close
%>
				</table>
			</div></td>
	</tr>
	<tr align="center" bgcolor="#b4c7db">
		<td height="30"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
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
