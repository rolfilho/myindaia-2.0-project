<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Estatisticas/Geral
'Arquivo de Script e HTML: Totais Geral 
'
'Autor Alexandre Gonçalves Neto
'Criado: 04/06/2006
'
'Manutenção: 12/09/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim nr_dia
Dim nr_wday
Dim vl_total_sem
Dim vl_total_mes
Dim vl_total_ano
Dim vl_total_dia
Dim vl_total_sem_ant
Dim vl_total_mes_ant
Dim vl_total_ano_ant
Dim vl_total_dia_ant
Dim vl_var_sem
Dim vl_var_mes
Dim vl_var_ano
Dim vl_top_dia
Dim dt_top_dia
Dim vl_porcentagem
dim arrTotalDia(27,2)
dim vlCalcAdm, vlCalcCli
dim vTxHtmlBarra, vTxHtmlDia

in_show = True
cd_tela = "EST001"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

dt_hoje = Date
nr_wday = Weekday(dt_hoje)

dt_ini = DateAdd("d", -(nr_wday + 6), dt_hoje)
dt_fim = DateAdd("d", -nr_wday, dt_hoje)

With objcmd
	.CommandTimeOut = 300
	.CommandText    = "sp_estat_total_geral"
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("@vl_total_ano"    , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_mes"    , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_sem"    , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_dia"    , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_ano_ant", adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_mes_ant", adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_sem_ant", adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_total_dia_ant", adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@vl_top_dia"      , adInteger, adParamOutPut)
	.Parameters.Append = .CreateParameter("@dt_top_dia"      , adDate   , adParamOutPut)
	.Execute nrec, , adExecuteNoRecords
	vl_total_ano     = .Parameters("@vl_total_ano")
	vl_total_mes     = .Parameters("@vl_total_mes")
	vl_total_sem     = .Parameters("@vl_total_sem")
	vl_total_dia     = .Parameters("@vl_total_dia")
	vl_total_ano_ant = .Parameters("@vl_total_ano_ant")
	vl_total_mes_ant = .Parameters("@vl_total_mes_ant")
	vl_total_sem_ant = .Parameters("@vl_total_sem_ant")
	vl_total_dia_ant = .Parameters("@vl_total_dia_ant")
	vl_top_dia       = .Parameters("@vl_top_dia")
	dt_top_dia       = .Parameters("@dt_top_dia")
End With
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
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
		<td width="100%" height="75" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td colspan="3" height="20" class="titulo">..::: Estatísticas Web :::..</td>
				</tr>
				<tr>
					<td>&nbsp;Total Semana: </td>
					<td align="right"><%= vl_total_sem%>&nbsp;</td>
					<td>&nbsp;Semana Anterior: </td>
					<td align="right"><%= vl_total_sem_ant%>&nbsp;</td>
					<td align="right"><%
vl_var_sem = vl_total_sem / vl_total_sem_ant * 100
Response.Write(FormatNumber(vl_var_sem, 2) &"%")
%>
						&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;Total Mês: </td>
					<td align="right"><%= vl_total_mes%>&nbsp;</td>
					<td>&nbsp;Mês Anterior: </td>
					<td align="right"><%= vl_total_mes_ant%>&nbsp;</td>
					<td align="right"><%
vl_var_mes = vl_total_mes / vl_total_mes_ant * 100
Response.Write(FormatNumber(vl_var_mes, 2) &"%")
%>
						&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;Total Ano: </td>
					<td align="right"><%= vl_total_ano%>&nbsp;</td>
					<td>&nbsp;Ano Anterior: </td>
					<td align="right"><%= vl_total_ano_ant%>&nbsp;</td>
					<td align="right"><%
vl_var_ano = vl_total_ano / vl_total_ano_ant * 100
Response.Write(FormatNumber(vl_var_ano, 2) &"%")
%>
						&nbsp;</td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td colspan="2" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td height="16" class="toprelat">Qtde. de pesquisas por dia nas 4 últimas semanas.</td>
								</tr>
								<tr>
									<td><%
'seleciona os relatórios que retornaram dados realizados pelos administradores
sql = "SELECT COUNT(*) AS VL_TOTAL, DATEPART(d, DT_EMISSAO) AS NR_DIA "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND CD_USUARIO IN (SELECT CD_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_CARGO = '001') "&_
			"  AND DT_EMISSAO BETWEEN  DATEADD(Day, -28, '"& dt_hoje &"') AND DATEADD(Day, -1, '"& dt_hoje &"') "&_
			"GROUP BY DT_EMISSAO "&_
			"ORDER BY DT_EMISSAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

for x = 0 to 27
	arrTotalDia(x,0) = DatePart("d", DateAdd("d", -(28-x), dt_hoje))
	if not objrs.Eof then nr_dia = objrs.Fields.Item("NR_DIA").Value Else nr_dia = Null
	if nr_dia = arrTotalDia(x,0) then
		arrTotalDia(x,1) = objrs.Fields.Item("VL_TOTAL").Value
		objrs.MoveNext
	else
		arrTotalDia(x,1) = 0
	end if
next
objrs.Close
'seleciona os relatórios que retornaram dados por clientes e usuários
sql = "SELECT COUNT(*) AS VL_TOTAL, DATEPART(d, DT_EMISSAO) AS NR_DIA "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND CD_USUARIO NOT IN (SELECT CD_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_CARGO = '001') "&_
			"  AND DT_EMISSAO BETWEEN  DATEADD(Day, -28, '"& dt_hoje &"') AND DATEADD(Day, -1, '"& dt_hoje &"') "&_
			"GROUP BY DT_EMISSAO "&_
			"ORDER BY DT_EMISSAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

for x = 0 to 27
	if not objrs.Eof then nr_dia = objrs.Fields.Item("NR_DIA").Value Else nr_dia = Null
	if nr_dia = arrTotalDia(x,0) then
		arrTotalDia(x,2) = objrs.Fields.Item("VL_TOTAL").Value
		objrs.MoveNext
	else
		arrTotalDia(x,2) = 0
	end if
next
objrs.Close

vTxHtmlBarra = "<table width=100% border=0 cellspacing=1 cellpadding=0>"&_
	"<tr height=100 bgcolor=""#FEFEFE""><td class=""toprelat"">total por dia</td>"
vTxHtmlDia = "</tr><tr bgcolor=""#EDEDED""><td width=16% class=""toprelat"">dias</td>"

for x = 0 to 27
	'calcula a porcentagem
	vlCalcAdm = arrTotalDia(x,1) / vl_top_dia * 100
	vlCalcCli = arrTotalDia(x,2) / vl_top_dia * 100
	vTxHtmlBarra = vTxHtmlBarra &_
		"<td><table width=100% height=100% border=0 cellspacing=0 cellpadding=0>"&_
		"<tr height="""&(100-CInt(vlCalcCli+vlCalcAdm))&"%""><td align=""center"" valign=""bottom"">"&arrTotalDia(x,1)+arrTotalDia(x,2)&"</td></tr>"&_
		"<tr height="""&CInt(vlCalcCli)&"%""><td bgcolor=""#00FF00"" title="""&arrTotalDia(x,2)&"""></td></tr>"&_
		"<tr height="""&CInt(vlCalcAdm)&"%""><td bgcolor=""#FF0000"" title="""&arrTotalDia(x,1)&"""></td></tr>"&_
		"</table></td>"
	vTxHtmlDia = vTxHtmlDia&"<td width=3% align=""center"">"&arrTotalDia(x,0)&"</td>"
next
Response.Write(vTxHtmlBarra&vTxHtmlDia&"</tr></table>")
%>
									</td>
								</tr>
								<tr>
									<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr class="gridsub">
												<td>Maior número de pesquisas em um dia: <%= vl_top_dia &" em "& fnc_Mascara(dt_top_dia, 5)%></td>
												<td width="10" bgcolor="#00FF00" style="border:1px solid #000000;">&nbsp;</td>
												<td>&nbsp;Usuários/Clientes</td>
												<td width="10" bgcolor="#FF0000" style="border:1px solid #000000;">&nbsp;</td>
												<td>&nbsp;Administradores</td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos hoje</td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS HOJE :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DT_EMISSAO = CONVERT(datetime, '"& dt_hoje &"', 103) "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_dia * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
						<td valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos Ontem</td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS ONTEM :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DT_EMISSAO = CONVERT(datetime, '"& DateAdd("d", -1, dt_hoje) &"', 103) "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_dia_ant * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_dia_ant%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos na Semana</td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS ESTA SEMANA :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DT_EMISSAO BETWEEN CONVERT(datetime, '"& DateAdd("d", -(nr_wday-1), dt_hoje) &"', 103) AND CONVERT(datetime, '"& dt_hoje &"', 103) "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_sem * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_sem%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
						<td valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Semana Anterior</td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS SEMANA PASSADA :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DT_EMISSAO BETWEEN CONVERT(datetime, '"& dt_ini &"', 103) AND CONVERT(datetime, '"& dt_fim &"', 103) "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_sem_ant * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_sem_ant%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos em <%= MonthName(Month(dt_hoje))%></td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS ESTE MÊS :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DATEPART(yyyy, DT_EMISSAO) = "& DatePart("yyyy", dt_hoje) &" "&_
			"  AND DATEPART(m, DT_EMISSAO)    = "& DatePart("m"   , dt_hoje) &" "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_mes * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 3<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 3<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 3<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_mes%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
						<td valign="top" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos em <%= MonthName(Month(DateAdd("m",-1,dt_hoje)))%></td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS MÊS PASSADO :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DATEPART(yyyy, DT_EMISSAO) = "& DatePart("yyyy", DateAdd("m",-1,dt_hoje)) &" "&_
			"  AND DATEPART(m, DT_EMISSAO)    = "& DatePart("m", DateAdd("m",-1,dt_hoje)) &" "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_mes_ant * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 4<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 4<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 4<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_mes_ant%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos em <%= Year(dt_hoje)%></td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS ESTE ANO :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DATEPART(yyyy, DT_EMISSAO) = "& DatePart("yyyy", dt_hoje) &" "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_ano * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 5<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 5<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 5<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_ano%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
						<td valign="top" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Emitidos em <%= Year(dt_hoje)-1%></td>
								</tr>
								<%
'::::: REALATORIOS EMITIDOS ANO PASSADO :::::
sql = "SELECT CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM, COUNT(*) AS VL_TOTAL "&_
			"FROM TRELATORIOS (NOLOCK) "&_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU = CD_MENU AND M02_CD_SUBM = CD_SUBM) "&_
			"WHERE IN_DADOS = '1' "&_
			"  AND DATEPART(yyyy, DT_EMISSAO) = "& (DatePart("yyyy", dt_hoje) - 1) &" "&_
			"GROUP BY CD_MENU, M01_NM_MENU, CD_SUBM, M02_NM_SUBM "&_
			"ORDER BY COUNT(*) DESC"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'calcula a porcentagem
	vl_porcentagem = objrs.Fields.Item("VL_TOTAL").Value / vl_total_ano_ant * 100
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 6<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 6<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 6<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("M02_NM_SUBM").Value &" <i>("& Left(objrs.Fields.Item("M01_NM_MENU").Value, 3) &")</i>"%></td>
									<td align="right" style="color:#999999">&nbsp;<i><%= objrs.Fields.Item("VL_TOTAL").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(vl_porcentagem, 2)%>%</td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_total_ano_ant%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;100%&nbsp;</td>
								</tr>
							</table></td>
					</tr>
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
<!--
//horário das consultas
SELECT [Hora] = DATEPART(hour, HR_EMISSAO), [Dia] = DATEPART(day, HR_EMISSAO), [Qtde.] = COUNT(*)
FROM TRELATORIOS (NOLOCK)
WHERE YEAR(DT_EMISSAO) = 2007
  AND MONTH(DT_EMISSAO) = 8
GROUP BY DATEPART(hour, HR_EMISSAO), DATEPART(day, HR_EMISSAO)
ORDER BY DATEPART(hour, HR_EMISSAO), DATEPART(day, HR_EMISSAO)
-->