<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Estatisticas/Relatórios
'Arquivo de Script e HTML: Exibe utilização de usuários x menus
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

If fnc_TestaVar(Request("tx_campo")) and fnc_TestaVar(Request("tx_ordem")) Then
	tx_campo = Request("tx_campo")
	tx_ordem = Request("tx_ordem")
Else
	tx_campo = "M16_VL_TOTAL"
	tx_ordem = "DESC"
End If

If Not (nr_ano = DatePart("yyyy", Date) and nr_mes = DatePart("m", Date)) Then
	'verifica se já existem dados para o ano e mês definidos acima
	sql = "SELECT COUNT(*) AS VL_TOTAL "&_
				"FROM M16_ESTAT_USER "&_
				"WHERE M16_NR_ANO = "& nr_ano &_
				"  AND M16_NR_MES = "& nr_mes
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
				<form action="?<%= "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view%>" name="frmUser" method="post" onSubmit="return fnc_Valida(this);">
					<input type="hidden" name="tx_campo" value="<%= tx_campo%>">
					<input type="hidden" name="tx_ordem" value="<%= tx_ordem%>">
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
If tx_campo = "NM_CARGO" Then tx_campo = "NM_GRUPO"
If tx_campo <> "M16_VL_TOTAL" Then sql = ", M16_VL_TOTAL DESC" Else sql = ""
sql = "SELECT M16_ESTAT_USER.*, U.NM_USUARIO, G.NM_GRUPO "&_
			"FROM M16_ESTAT_USER (NOLOCK) "&_
			"  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = M16_CD_USUARIO) "&_
			"  LEFT JOIN TGRUPO   G (NOLOCK) ON (G.CD_GRUPO   = M16_CD_GRUPO) "&_
			"WHERE M16_NR_ANO = "& nr_ano &_
			"  AND M16_NR_MES = "& nr_mes &_
			"  AND M16_CD_CARGO IN ('040','055','060') "&_
			"ORDER BY "& tx_campo &" "& tx_ordem & sql
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then
	tx_link = "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view &"&nr_ano="& nr_ano &"&nr_mes="& nr_mes &"&tx_campo="
%>
					<tr>
						<td bgcolor="#336699"><table border="0" cellspacing="1" cellpadding="0">
							<tr class="toprelat">
								<td rowspan="2"><a href="?<%= tx_link &"NM_USUARIO&tx_ordem=ASC"%>">Usuário</a></td>
								<td rowspan="2"><a href="?<%= tx_link &"NM_GRUPO&tx_ordem=ASC"%>">Grupo Empresarial</a></td>
								<td rowspan="2"><a href="?<%= tx_link &"M16_VL_TOTAL&tx_ordem=DESC"%>">Total Consultas</a></td>
								<td colspan="7">Importação</td>
								<td colspan="5">Exportação</td>
								<td colspan="3">Financeiro</td>
								<td colspan="1">Serviços</td>
							</tr>
							<tr height="30" class="toprelat">
								<td width="65">Tracking</td>
								<td width="65">KPI por Serviço</td>
								<td width="65">Alertas</td>
								<td width="65">Custeio</td>
								<td width="65">Controle LI </td>
								<td width="65">KPI por Embarque</td>
								<td width="65">Demurrage</td>
								<td width="65">Tracking</td>
								<td width="65">KPI por Embarque</td>
								<td width="65">Alertas</td>
								<!--<td width="65">Invetory Level</td>-->
								<td width="65">Mapa de Borderô</td>
								<td width="65">GSI</td>
								<td width="65">Conta Corrente</td>
								<td width="65">Cash Flow</td>
								<td width="65">Solicitação de Numerário</td>
								<td width="65">Tranportadora</td>
							</tr>
							<%
	tx_quebra = ""
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
							<tr bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 1<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%>&nbsp;</nobr></td>
								<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_GRUPO").Value%>&nbsp;</nobr></td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0101").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0102").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0103").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0104").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0105").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0106").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0107").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0201").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0202").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0203").Value%>&nbsp;</td>
								<!--<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0204").Value%>&nbsp;</td>-->
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0205").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0206").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0601").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0602").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0603").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0801").Value%>&nbsp;</td>
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
objrs.Close

If tx_campo = "NM_GRUPO" Then tx_campo = "NM_CARGO"
If tx_campo <> "M16_VL_TOTAL" Then sql = ", M16_VL_TOTAL DESC" Else sql = ""
sql = "SELECT M16_ESTAT_USER.*, U.NM_USUARIO, C.NM_CARGO "&_
			"FROM M16_ESTAT_USER (NOLOCK) "&_
			"  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = M16_CD_USUARIO) "&_
			"  LEFT JOIN BROKER.DBO.TCARGO C (NOLOCK) ON (C.CD_CARGO = M16_CD_CARGO) "&_
			"WHERE M16_NR_ANO = "& nr_ano &_
			"  AND M16_NR_MES = "& nr_mes &_
			"  AND M16_CD_CARGO NOT IN ('040','055','060') "&_
			"ORDER BY "& tx_campo &" "& tx_ordem & sql
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Response.write sql
response.end
If objrs.RecordCount > 0 Then
	tx_link = "cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_view &"&nr_ano="& nr_ano &"&nr_mes="& nr_mes &"&tx_campo="
%>
					<tr>
						<td bgcolor="#336699"><table border="0" cellspacing="1" cellpadding="0">
							<tr class="toprelat">
								<td rowspan="2"><a href="?<%= tx_link &"NM_USUARIO&tx_ordem=ASC"%>">Usuário</a></td>
								<td rowspan="2"><a href="?<%= tx_link &"NM_CARGO&tx_ordem=ASC"%>">Cargo</a></td>
								<td rowspan="2"><a href="?<%= tx_link &"M16_VL_TOTAL&tx_ordem=DESC"%>">Total Consultas</a></td>
								<td colspan="7">Importação</td>
								<td colspan="5">Exportação</td>
								<td colspan="3">Financeiro</td>
								<td colspan="1">Serviços</td>
							</tr>
							<tr height="30" class="toprelat">
								<td width="65">Tracking</td>
								<td width="65">KPI por Serviço</td>
								<td width="65">Alertas</td>
								<td width="65">Custeio</td>
								<td width="65">Controle LI </td>
								<td width="65">KPI por Embarque</td>
								<td width="65">Demurrage</td>
								<td width="65">Tracking</td>
								<td width="65">KPI por Embarque</td>
								<td width="65">Alertas</td>
								<!--<td width="65">Invetory Level</td>-->
								<td width="65">Mapa de Borderô</td>
								<td width="65">GSI</td>
								<td width="65">Conta Corrente</td>
								<td width="65">Cash Flow</td>
								<td width="65">Solicitação de Numerário</td>
								<td width="65">Tranportadora</td>
							</tr>
							<%
	tx_quebra = ""
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
							<tr bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, 2<%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%>&nbsp;</nobr></td>
								<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_CARGO").Value%>&nbsp;</nobr></td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_TOTAL").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0101").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0102").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0103").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0104").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0105").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0106").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0107").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0201").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0202").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0203").Value%>&nbsp;</td>
								<!--<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0204").Value%>&nbsp;</td>-->
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0205").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0206").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0601").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0602").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0603").Value%>&nbsp;</td>
								<td align="right">&nbsp;<%= objrs.Fields.Item("M16_VL_MENU_0801").Value%>&nbsp;</td>
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