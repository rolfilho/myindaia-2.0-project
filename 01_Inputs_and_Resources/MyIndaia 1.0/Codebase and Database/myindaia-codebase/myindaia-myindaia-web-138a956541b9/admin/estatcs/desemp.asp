<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Estatisticas/Desempenho
'Arquivo de Script e HTML: Exibe picos de lentidão e utilização do sistema
'
'Autor Alexandre Gonçalves Neto
'Criado: 14/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim dt_temp
Dim nr_cont
Dim nr_ano
Dim nr_mes
Dim nr_dia
Dim nr_hora
Dim nr_wday
Dim dt_ini_atual
Dim dt_fim_atual
Dim vl_qtde_rel_dia
Dim vl_qtde_des_dia
Dim vl_media_des_dia
Dim vl_porcentagem
Dim array_data(4)

in_show = True
cd_tela = "EST002"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_docto")
tx_erro = Request.QueryString("tx_erro")

If IsDate(Request("dt_hoje")) Then
	dt_hoje = Request("dt_hoje")
Else
	dt_hoje = Date
End If

nr_wday = Weekday(dt_hoje)

dt_ini = DateAdd("d", -(nr_wday + 6), dt_hoje)
dt_fim = DateAdd("d", -nr_wday, dt_hoje)

dt_ini_atual = DateAdd("d", -(nr_wday-1), dt_hoje)
dt_fim_atual = DateAdd("d", (7-nr_wday), dt_hoje)
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function fnc_Valida(form) {
  var valida = true;
	var data = form.nr_dia.value+'/'+form.nr_mes.value+'/'+form.nr_ano.value
	
	if (getValidDate(data)==undefined) {
		alert('Atenção: Data inválida!');
		valida = false;
		form.nr_dia.focus;
	} else {
		if (getValidDate(data) < getValidDate('28/06/2006')) {
			alert('A data informada é menor que 28/06/2006, não há dados para exibir anterior esta data!');
			valida = false;
		}
		if (getValidDate(data) > getValidDate('<%= fnc_Mascara(Date, 5)%>')) {
			alert('A data informada é maior que <%= fnc_Mascara(Date, 5)%>, não há dados para exibir após esta data!');
			valida = false;
		}
		form.dt_hoje.value = data;
	}
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
				<form action="?<%= "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view%>" name="frmLentidao" method="post" onSubmit="return fnc_Valida(this);">
					<tr>
						<td class="titulo" height="20">Picos de Lentidão no Sistema</td>
					</tr>
					<tr>
						<td align="center" valign="middle" height="55"><label for="nr_dia"><b>Dia</b></label>
							<select class="select" name="select" tabindex="0" id="nr_dia">
							<%
For	x = 1 to 31
	If x = Day(dt_hoje) Then selected = " selected" Else selected = ""
	Response.Write("<option value='"& fnc_AddZeros(x, 2) &"'"& selected &">"& x &"</option>")
Next
%>
							</select>
							<label for="nr_mes"><b>Mês</b></label>
							<select class="select" name="nr_mes" tabindex="1" id="nr_mes">
							<%
For	x = 1 to 12
	If x = Month(dt_hoje) Then selected = " selected" Else selected = ""
	Response.Write("<option value='"& fnc_AddZeros(x, 2) &"'"& selected &">"& meses(x-1) &"</option>")
Next
%>
							</select>
							<label for="nr_ano"><b>Ano</b></label>
							<select class="select" name="nr_ano" tabindex="2" id="nr_ano">
							<%
For	x = 2006 to Year(Date)
	If x = Year(dt_hoje) Then selected = " selected" Else selected = ""
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
					<tr>
						<!-- Picos de lentidão nos últimos 5 dias -->
						<%
dt_temp = dt_hoje
nr_cont = 0
Do While nr_cont < 5
	If (DatePart("w", dt_temp) = 1) or (DatePart("w", dt_temp) = 7) Then
		dt_temp = DateAdd("d", -1, dt_temp)
	Else
		sql = "SELECT COUNT(*) AS QTDE FROM TFERIADO WHERE DT_FERIADO = CONVERT(datetime, '"& dt_temp &"', 103)"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		If objrsx.Fields.Item("QTDE").Value > 0 Then
			dt_temp = DateAdd("d", -1, dt_temp)
		Else
			array_data(nr_cont) = dt_temp
			nr_cont = nr_cont + 1
			If nr_cont < 5 Then dt_temp = DateAdd("d", -1, dt_temp)
		End If
		objrsx.Close
	End If
Loop

For nr_cont = UBound(array_data) to 0 Step -1
	'qtde total de paginas com baixa performace
	sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS  "&_
				"FROM TPROCESSAMENTO (NOLOCK) "&_
				"WHERE CONVERT(datetime, CONVERT(varchar(10), DT_OCORRENCIA, 103), 103) = CONVERT(datetime, '"& array_data(nr_cont) &"', 103)"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
	vl_media_des_dia = objrs.Fields.Item("SECS").Value
	objrs.Close
%>
						<td bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td height="16" class="toprelat"><a href="?<%= "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view &"&dt_hoje="& array_data(nr_cont)%>"><font color="#FFFFFF"><%= array_data(nr_cont)%></font></a></td>
								</tr>
								<tr>
									<td><table width="100%" border="0" cellspacing="1" cellpadding="0">
											<tr class="toprelat">
												<td>hora</td>
												<td>qtde. pags.</td>
												<td>média secs</td>
											</tr>
											<%
	'busca de página com baixo desempenho no dia agrupados por hora
	sql = "SELECT DATEPART(hh, DT_OCORRENCIA) AS HORA, COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
				"FROM TPROCESSAMENTO (NOLOCK) "&_
				"WHERE CONVERT(datetime, CONVERT(varchar(10), DT_OCORRENCIA, 103), 103) = CONVERT(datetime, '"& array_data(nr_cont) &"', 103) "&_
				"GROUP BY DATEPART(hh, DT_OCORRENCIA) "&_
				"ORDER BY DATEPART(hh, DT_OCORRENCIA)"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	For x = 0 to 23
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		'se não for fim de arquivo seta a hora obtida na query
		If Not objrs.Eof Then nr_hora = objrs.Fields.Item("HORA").Value Else nr_hora = Null
		'se a hora obtida for igual a hora definida em x, exibe valores
		If nr_hora = Hour(DateAdd("h", x, dt_hoje)) Then
%>
											<tr bgcolor="<%= bgcolor%>">
												<td align="right"><%= x%>&nbsp;</td>
												<td align="right"><%= objrs.Fields.Item("QTDE").Value%>&nbsp;</td>
												<td align="right"><%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%>&nbsp;</td>
											</tr>
											<%
			objrs.MoveNext
		Else
%>
											<tr bgcolor="<%= bgcolor%>">
												<td align="right"><%= x%>&nbsp;</td>
												<td align="right">0&nbsp;</td>
												<td align="right">0&nbsp;</td>
											</tr>
											<%
		End If
	Next
	objrs.Close
%>
											<tr class="gridsub">
												<td>Total:</td>
												<td align="right"><%= vl_qtde_des_dia%></td>
												<td align="right"><%= FormatNumber(vl_media_des_dia, 2)%></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<%
Next

'qtde total de paginas com baixa performace
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS  "&_
			"FROM TPROCESSAMENTO (NOLOCK) WHERE "
For nr_cont = 0 To UBound(array_data)
	sql = sql &"CONVERT(datetime, CONVERT(varchar(10), DT_OCORRENCIA, 103), 103) = CONVERT(datetime, '"& array_data(nr_cont) &"', 103)"
	If nr_cont < UBound(array_data) Then sql = sql &" OR "
Next
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close
%>
						<td bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td height="16" class="toprelat">Total</td>
								</tr>
								<tr>
									<td><table width="100%" border="0" cellspacing="1" cellpadding="0">
											<tr class="toprelat">
												<td>hora</td>
												<td>qtde. pags.</td>
												<td>média secs</td>
											</tr>
											<%
'busca de página com baixo desempenho no dia agrupados por hora
sql = "SELECT DATEPART(hh, DT_OCORRENCIA) AS HORA, COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO (NOLOCK) WHERE "
For nr_cont = 0 To UBound(array_data)
	sql = sql &"CONVERT(datetime, CONVERT(varchar(10), DT_OCORRENCIA, 103), 103) = CONVERT(datetime, '"& array_data(nr_cont) &"', 103)"
	If nr_cont < UBound(array_data) Then sql = sql &" OR "
Next
sql = sql &_
			"GROUP BY DATEPART(hh, DT_OCORRENCIA) "&_
			"ORDER BY DATEPART(hh, DT_OCORRENCIA)"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

For x = 0 to 23
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'se não for fim de arquivo seta a hora obtida na query
	If Not objrs.Eof Then nr_hora = objrs.Fields.Item("HORA").Value Else nr_hora = Null
	'se a hora obtida for igual a hora definida em x, exibe valores
	If nr_hora = Hour(DateAdd("h", x, dt_hoje)) Then
%>
											<tr bgcolor="<%= bgcolor%>">
												<td align="right"><%= x%>&nbsp;</td>
												<td align="right"><%= objrs.Fields.Item("QTDE").Value%>&nbsp;</td>
												<td align="right"><%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%>&nbsp;</td>
											</tr>
											<%
		objrs.MoveNext
	Else
%>
											<tr bgcolor="<%= bgcolor%>">
												<td align="right"><%= x%>&nbsp;</td>
												<td align="right">0&nbsp;</td>
												<td align="right">0&nbsp;</td>
											</tr>
											<%
	End If
Next
objrs.Close
%>
											<tr class="gridsub">
												<td>Total:</td>
												<td align="right"><%= vl_qtde_des_dia%></td>
												<td align="right"><%= FormatNumber(vl_media_des_dia, 2)%></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<!-- Picos de lentidão por usuário cliente -->
						<td colspan="3" valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Usuários Cliente - Semana de <%= dt_ini &" à "& dt_fim%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO IN ('040','055','060')"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS, P.CD_USUARIO, U.NM_USUARIO "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO IN ('040','055','060') "&_
			"GROUP BY P.CD_USUARIO, U.NM_USUARIO "&_
			"ORDER BY AVG(P.NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
								</tr>
							</table></td>
						<td bgcolor="#336699" valign="top" width="50%" colspan="3"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Usuários Cliente - Semana de <%= dt_ini_atual &" à "& dt_fim_atual%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO IN ('040','055','060')"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS, P.CD_USUARIO, U.NM_USUARIO "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO IN ('040','055','060') "&_
			"GROUP BY P.CD_USUARIO, U.NM_USUARIO "&_
			"ORDER BY AVG(P.NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<!-- Picos de lentidão por usuário indaiá -->
						<td colspan="3" valign="top" width="50%" bgcolor="#336699"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Usuários Indaiá - Semana de <%= dt_ini &" à "& dt_fim%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO NOT IN ('040','055','060') "
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS, P.CD_USUARIO, U.NM_USUARIO "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO NOT IN ('040','055','060') "&_
			"GROUP BY P.CD_USUARIO, U.NM_USUARIO "&_
			"ORDER BY AVG(P.NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
								</tr>
							</table></td>
						<td bgcolor="#336699" valign="top" width="50%" colspan="3"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Usuários Indaiá - Semana de <%= dt_ini_atual &" à "& dt_fim_atual%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO NOT IN ('040','055','060')"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS, P.CD_USUARIO, U.NM_USUARIO "&_
			"FROM TPROCESSAMENTO P (NOLOCK), TUSUARIO U (NOLOCK) "&_
			"WHERE P.DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103) "&_
			"  AND U.CD_USUARIO = P.CD_USUARIO "&_
			"  AND U.CD_CARGO NOT IN ('040','055','060') "&_
			"GROUP BY P.CD_USUARIO, U.NM_USUARIO "&_
			"ORDER BY AVG(P.NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<!-- Páginas mais lentas -->
						<td bgcolor="#336699" valign="top" width="50%" colspan="3"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Páginas - Semana de <%= dt_ini &" à "& dt_fim%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO  (NOLOCK) "&_
			"WHERE DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103)"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT NM_PAGINA, COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO  (NOLOCK) "&_
			"WHERE DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim &" 23:59:59.999', 103) "&_
			"GROUP BY NM_PAGINA "&_
			"ORDER BY AVG(NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_PAGINA").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
								</tr>
							</table></td>
						<td bgcolor="#336699" valign="top" width="50%" colspan="3"><table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td colspan="3" height="16" class="toprelat">Páginas - Semana de <%= dt_ini_atual &" à "& dt_fim_atual%></td>
								</tr>
								<%
sql = "SELECT COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO  (NOLOCK) "&_
			"WHERE DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103)"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_qtde_des_dia  = objrs.Fields.Item("QTDE").Value
vl_media_des_dia = objrs.Fields.Item("SECS").Value
objrs.Close

sql = "SELECT NM_PAGINA, COUNT(*) AS QTDE, ISNULL(AVG(NR_SEGUNDOS), 0) AS SECS "&_
			"FROM TPROCESSAMENTO  (NOLOCK) "&_
			"WHERE DT_OCORRENCIA BETWEEN CONVERT(datetime, '"& dt_ini_atual &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fim_atual &" 23:59:59.999', 103) "&_
			"GROUP BY NM_PAGINA "&_
			"ORDER BY AVG(NR_SEGUNDOS) DESC"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Do While Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr height="12" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
									<td align="left">&nbsp;<%= objrs.Fields.Item("NM_PAGINA").Value%></td>
									<td align="right">&nbsp;<i><%= objrs.Fields.Item("QTDE").Value%></i></td>
									<td align="right">&nbsp;<%= FormatNumber(objrs.Fields.Item("SECS").Value, 2)%></td>
								</tr>
								<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="13" class="gridsub">
									<td align="right" width="76%">&nbsp;Total:&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= vl_qtde_des_dia%>&nbsp;</td>
									<td align="right" width="12%">&nbsp;<%= FormatNumber(vl_media_des_dia, 2)%>&nbsp;</td>
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