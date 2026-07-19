<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Estatisticas/Relatórios
'Arquivo de Script e HTML: Exibe utilização de menus x usuários
'
'Autor Alexandre Gonçalves Neto
'Criado: 25/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim nr_ano
Dim nr_mes
Dim tx_quebra

in_show = True
cd_tela = "EST003"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_docto")
tx_erro = Request.QueryString("tx_erro")

If fnc_TestaVar(Request("nr_ano")) and fnc_TestaVar(Request("nr_mes")) Then
	nr_ano = CInt(Request("nr_ano"))
	nr_mes = CInt(Request("nr_mes"))
Else
	nr_ano = DatePart("yyyy", Date)
	nr_mes = DatePart("m", Date)
End If

If Not (nr_ano = DatePart("yyyy", Date) and nr_mes = DatePart("m", Date)) Then
	'verifica se já existem dados para o ano e mês definidos acima
	sql = "SELECT COUNT(*) AS VL_TOTAL "&_
				"FROM M15_ESTAT_MENU "&_
				"WHERE M15_NR_ANO = "& nr_ano &_
				"  AND M15_NR_MES = "& nr_mes
	'Response.Write(sql &"<br>")
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	num = objrsx.Fields.Item("VL_TOTAL").Value
	objrsx.Close
Else
	num = 0
End If

If num = 0 Then
	With objcmd
		.CommandTimeOut = 120
		.CommandText    = "sp_estat_menu_user"
		.CommandType    = adCmdStoredProc
		.Parameters.Append = .CreateParameter("@nr_mes", adInteger, adParamInput, , nr_mes)
		.Parameters.Append = .CreateParameter("@nr_ano", adInteger, adParamInput, , nr_ano)
		.Execute nrec, , adExecuteNoRecords
	End With
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function fnc_Valida(form) {
  var valida = true;

	return valida;
}
-->
</script>
</head>

<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="75" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<form action="?<%= "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view%>" name="frmMenu" method="post" onSubmit="return fnc_Valida(this);">
					<tr>
						<td class="titulo" height="20">Utilização Menu x Usuário</td>
					</tr>
					<tr>
						<td align="center" valign="middle" height="55"><label for="nr_mes"><b>Mês</b></label>
							<select class="select" name="nr_mes" tabindex="1" id="nr_mes">
							<%
For	x = 1 to 12
	If x = nr_mes Then selected = " selected" Else selected = ""
	Response.Write("<option value='"& x &"'"& selected &">"& meses(x-1) &"</option>")
Next
%>
							</select>
							<label for="nr_ano"><b>Ano</b></label>
							<select class="select" name="nr_ano" tabindex="2" id="nr_ano">
							<%
For	x = 2005 to Year(Date)
	If x = nr_ano Then selected = " selected" Else selected = ""
	Response.Write("<option value='"& x &"'"& selected &">"& x &"</option>")
Next
%>
							</select>
							<input type="hidden" name="dt_hoje">
							<input class="button" type="submit" name="btnEnviar" value="Ok" tabindex="3">
						</td>
					</tr>
				</form>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<%
'seleciona dados dos usuários cliente
sql = "SELECT M15_CD_MENU, M15_CD_SUBM, M15_CD_USUARIO, M15_CD_GRUPO, M15_VL_TOTAL, M15_VL_CHEIO, M15_VL_VAZIO, "&_
			"  M15_VL_PER_CHEIO, M01_NM_MENU, M02_NM_SUBM, U.NM_USUARIO, G.NM_GRUPO "&_
			"FROM M15_ESTAT_MENU (NOLOCK) "&_
			"  INNER JOIN M01_MENU  (NOLOCK) ON (M01_CD_MENU  = M15_CD_MENU) "&_
			"  INNER JOIN M02_SUBM  (NOLOCK) ON (M02_CD_MENU  = M15_CD_MENU AND M02_CD_SUBM = M15_CD_SUBM) "&_
			"  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = M15_CD_USUARIO) "&_
			"  LEFT JOIN TGRUPO   G (NOLOCK) ON (G.CD_GRUPO   = M15_CD_GRUPO) "&_
			"WHERE M15_NR_ANO = "& nr_ano &_
			"  AND M15_NR_MES = "& nr_mes &_
			"  AND M15_CD_CARGO IN ('040','055','060') "&_
			"ORDER BY M15_CD_MENU ASC, M15_CD_SUBM ASC, M15_VL_TOTAL DESC"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

sql = "SELECT M15_CD_MENU, M15_CD_SUBM, SUM(M15_VL_TOTAL) AS VL_TOTAL, SUM(M15_VL_CHEIO) AS VL_CHEIO, "&_
			"  SUM(M15_VL_VAZIO) AS VL_VAZIO, ((SUM(M15_VL_CHEIO)*100)/SUM(M15_VL_TOTAL)) AS VL_PER_CHEIO "&_
			"FROM M15_ESTAT_MENU (NOLOCK) "&_
			"WHERE M15_NR_ANO = "& nr_ano &_
			"  AND M15_NR_MES = "& nr_mes &_
			"  AND M15_CD_CARGO IN ('040','055','060') "&_
			"GROUP BY M15_CD_MENU, M15_CD_SUBM "&_
			"ORDER BY M15_CD_MENU ASC, M15_CD_SUBM ASC"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then
%>
					<tr>
						<td bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
							<tr height="30" class="toprelat">
								<td width="200">&nbsp;Usuário&nbsp;</td>
								<td>&nbsp;Grupo Empresarial&nbsp;</td>
								<td width="65">Total Consultas</td>
								<td width="65">Válidas</td>
								<td width="65">Sem Registros</td>
								<td width="65">% Válidas</td>
							</tr>
							<%
	tx_quebra = ""
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		'verifica se mudou o menu/sub-menu
		If tx_quebra <> objrs.Fields.Item("M15_CD_MENU").Value & objrs.Fields.Item("M15_CD_SUBM").Value Then
%>
							<tr class="gridsub">
								<td colspan="2">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_CHEIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_VAZIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_PER_CHEIO").Value%>&nbsp;</td>
							</tr>
							<%
			objrsx.MoveNext
		End If
		tx_quebra = objrs.Fields.Item("M15_CD_MENU").Value & objrs.Fields.Item("M15_CD_SUBM").Value
%>
							<tr bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<td>&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%>&nbsp;</td>
								<td>&nbsp;<%= objrs.Fields.Item("NM_GRUPO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_CHEIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_VAZIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_PER_CHEIO").Value%>&nbsp;</td>
							</tr>
							<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
							</table></td>
					</tr>
					<%
End If
objrsx.Close
objrs.Close

'seleciona dados dos usuários cliente
sql = "SELECT M15_CD_MENU, M15_CD_SUBM, M15_CD_USUARIO, M15_CD_GRUPO, M15_VL_TOTAL, M15_VL_CHEIO, M15_VL_VAZIO, "&_
			"  M15_VL_PER_CHEIO, M01_NM_MENU, M02_NM_SUBM, U.NM_USUARIO, C.NM_CARGO "&_
			"FROM M15_ESTAT_MENU (NOLOCK) "&_
			"  INNER JOIN M01_MENU  (NOLOCK) ON (M01_CD_MENU  = M15_CD_MENU) "&_
			"  INNER JOIN M02_SUBM  (NOLOCK) ON (M02_CD_MENU  = M15_CD_MENU AND M02_CD_SUBM = M15_CD_SUBM) "&_
			"  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = M15_CD_USUARIO) "&_
			"  LEFT JOIN BROKER.DBO.TCARGO C (NOLOCK) ON (C.CD_CARGO = M15_CD_CARGO) "&_
			"WHERE M15_NR_ANO = "& nr_ano &_
			"  AND M15_NR_MES = "& nr_mes &_
			"  AND M15_CD_CARGO NOT IN ('040','055','060') "&_
			"ORDER BY M15_CD_MENU ASC, M15_CD_SUBM ASC, M15_VL_TOTAL DESC"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

sql = "SELECT M15_CD_MENU, M15_CD_SUBM, SUM(M15_VL_TOTAL) AS VL_TOTAL, SUM(M15_VL_CHEIO) AS VL_CHEIO, "&_
			"  SUM(M15_VL_VAZIO) AS VL_VAZIO, ((SUM(M15_VL_CHEIO)*100)/SUM(M15_VL_TOTAL)) AS VL_PER_CHEIO "&_
			"FROM M15_ESTAT_MENU (NOLOCK) "&_
			"WHERE M15_NR_ANO = "& nr_ano &_
			"  AND M15_NR_MES = "& nr_mes &_
			"  AND M15_CD_CARGO NOT IN ('040','055','060') "&_
			"GROUP BY M15_CD_MENU, M15_CD_SUBM "&_
			"ORDER BY M15_CD_MENU ASC, M15_CD_SUBM ASC"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then
%>
					<tr>
						<td bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
							<tr height="30" class="toprelat">
								<td width="200">&nbsp;Usuário&nbsp;</td>
								<td>&nbsp;Cargo&nbsp;</td>
								<td width="65">Total Consultas</td>
								<td width="65">Válidas</td>
								<td width="65">Sem Registros</td>
								<td width="65">% Válidas</td>
							</tr>
							<%
	tx_quebra = ""
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		'verifica se mudou o menu/sub-menu
		If tx_quebra <> objrs.Fields.Item("M15_CD_MENU").Value & objrs.Fields.Item("M15_CD_SUBM").Value Then
%>
							<tr class="gridsub">
								<td colspan="2">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_CHEIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_VAZIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrsx.Fields.Item("VL_PER_CHEIO").Value%>&nbsp;</td>
							</tr>
							<%
			objrsx.MoveNext
		End If
		tx_quebra = objrs.Fields.Item("M15_CD_MENU").Value & objrs.Fields.Item("M15_CD_SUBM").Value
%>
							<tr bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<td>&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%>&nbsp;</td>
								<td>&nbsp;<%= objrs.Fields.Item("NM_CARGO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_CHEIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_VAZIO").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M15_VL_PER_CHEIO").Value%>&nbsp;</td>
							</tr>
							<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
							</table></td>
					</tr>
					<%
End If
objrsx.Close
objrs.Close
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->