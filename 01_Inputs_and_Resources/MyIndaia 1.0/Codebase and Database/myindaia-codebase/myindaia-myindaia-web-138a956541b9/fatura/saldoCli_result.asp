<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Prestadores de Serviços / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'Autor Kleber Guedes
'Criado: 18/07/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_cntr 'numero do container
Dim nr_nota 'numero da nota fiscal
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim vl_count 'quantidade de registros
Dim nr_aux 'auxiliar na construção do colspan final

in_comodo = "1"
in_show  = False
cd_tela  = "FAT016"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%

'Session("sql_saldo_cli") = Null
If Not fnc_TestaVar(Session("sql_saldo_cli")) Then
	'verifica se existe container no processo
	sql = " ISNULL(SUM(VL_NUMERARIO), 0) AS NUMERARIO, "&_
				" ISNULL(SUM(VL_DESPESA), 0) AS DESPESA, "&_
				" ISNULL(ISNULL(SUM(VL_NUMERARIO), 0) + ISNULL(SUM(VL_DESPESA), 0), 0) AS NUMERARIO_DESPESA, "&_
				" ISNULL(SUM(VL_CREDOR), 0) AS CREDOR, "&_
				" ISNULL(SUM(VL_DEVEDOR), 0) AS DEVEDOR, "&_
				" ISNULL(ISNULL(SUM(VL_CREDOR), 0) + ISNULL(SUM(VL_DEVEDOR), 0), 0) AS CREDOR_DEVEDOR, "&_
				" ISNULL(ISNULL(SUM(VL_NUMERARIO), 0) + ISNULL(SUM(VL_DESPESA), 0) + ISNULL(SUM(VL_CREDOR), 0) + ISNULL(SUM(VL_DEVEDOR), 0), 0) AS SALDO_TOTAL, "&_
				" ISNULL(SUM(VL_HONORARIO), 0)  AS HONORARIO, "&_
				" ISNULL(SUM(VL_DEVEDOR_VENC), 0) AS DEVEDOR_VENC, "&_
				" ISNULL((CASE ISNULL(SUM(VL_QT_FATURAS),1) "&_
				"           WHEN 0 THEN 0 "&_
				"           ELSE ISNULL(SUM(VL_DIAS_ATRASO), 0)/ISNULL(SUM(VL_QT_FATURAS),1) "&_
				"         END), 0) AS DIAS_ATRASO "&_
				"  FROM TREL_SALDO_CLI SC (NOLOCK) "
	
	Select Case tp_relat
		Case "0"
			sql = " SELECT G.NM_GRUPO AS GRUPO, " & sql &_ 
						"  INNER JOIN TGRUPO G ON SC.CD_GRUPO = G.CD_GRUPO "&_
						" WHERE SC.CD_USUARIO = '"& Session("cd_usuario") &"'  AND SC.NR_IDENT = "& nr_ident &" "&_
						" GROUP BY SC.CD_GRUPO, G.NM_GRUPO "&_				
						" ORDER BY G.NM_GRUPO "
		Case "1"
			sql = " SELECT RTRIM(LTRIM(EN.NM_EMPRESA)) + "&_
						" CASE ISNULL(EN.AP_EMPRESA, '') "&_
						"   WHEN '' THEN '' "&_
						"   ELSE ' (' + RTRIM(LTRIM(EN.AP_EMPRESA)) + ')' "&_
						" END AS EMPRESA,  "&_
						" ISNULL(G.NM_GRUPO, '') AS GRUPO, "& sql &_
						"  LEFT  JOIN TGRUPO G ON SC.CD_GRUPO = G.CD_GRUPO "&_
						"  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = SC.CD_CLIENTE "&_
						" WHERE SC.CD_USUARIO = '"& Session("cd_usuario") &"'  AND SC.NR_IDENT = "& nr_ident &" "&_	
						" GROUP BY SC.CD_GRUPO, G.NM_GRUPO,  EN.NM_EMPRESA, EN.AP_EMPRESA "&_
						" ORDER BY G.NM_GRUPO, EN.NM_EMPRESA, EN.AP_EMPRESA "
		Case "2"
			sql = " SELECT SUBSTRING(SC.NR_PROCESSO, 5, 14) AS NR_PROCESSO, "&_
						" RTRIM(LTRIM(EN.NM_EMPRESA)) +  "&_
						" CASE ISNULL(EN.AP_EMPRESA, '') "&_
						"   WHEN '' THEN '' "&_
						"   ELSE ' (' + RTRIM(LTRIM(EN.AP_EMPRESA)) + ')' "&_
						" END AS EMPRESA, "&_
						" ISNULL(G.NM_GRUPO, '') AS GRUPO, "& sql &_
						"  LEFT  JOIN TGRUPO G ON SC.CD_GRUPO = G.CD_GRUPO "&_
						"  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = SC.CD_CLIENTE "&_
						" WHERE SC.CD_USUARIO = '"& Session("cd_usuario") &"'  AND SC.NR_IDENT = "& nr_ident &" "&_	
						" GROUP BY SC.CD_GRUPO, G.NM_GRUPO,  EN.NM_EMPRESA, EN.AP_EMPRESA, SC.NR_PROCESSO "&_
						" ORDER BY G.NM_GRUPO, EN.NM_EMPRESA, EN.AP_EMPRESA, SC.NR_PROCESSO "
	End Select	
	Session("sql_saldo_cli") = sql
End If
'executa a query
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_saldo_cli") &"<br>"
With objcmd
  .CommandTimeOut = 300
  .CommandText    = Session("sql_saldo_cli")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

vl_count = objrs.RecordCount

objrs.AbsolutePage = CInt(pagina)

url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url

tx_path_file  = "/import/track_print"
tx_path_excel = "/fatura/SaldoCli_excel"


'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "saldoCli_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

//-->
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
		<td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr height="15" class="gridtit">
<%	
'por grupo de Clientes
Select Case tp_relat
  Case "0"
    vl_colspan = "11"
    nr_aux = "1"
%>						
						<td rowspan="2">Grupo de Clientes</td>
<%
' por Empresa Nacional
  Case "1"
    vl_colspan = "12"
		nr_aux = "2"
%>
						<td rowspan="2">Cliente</td>
						<td rowspan="2">Grupo de Clientes</td>
<%
'por Referência
  Case "2"
    vl_colspan = "13"
		nr_aux = "3"
%>						
						<td rowspan="2">Nr. Ref. Indaiá</td>
						<td rowspan="2">Cliente</td>					
						<td rowspan="2">Grupo de Clientes</td>	
<%
End Select
%>
						<td colspan="3">Pagamento x Numerário</td>
						<td colspan="3">Faturas</td>
						<td bgcolor="#EDEDED" valign="middle" rowspan="2" border="1" cellspacing="1" cellpadding="1"><font color="#000000"><b>&nbsp;Honorários&nbsp;</b></font></td>
						<td rowspan="2">Saldo Total do Cliente (1+2+3+4)</td>
						<td colspan="2">Faturas Vencidas</td>
					</tr>
					<tr height="35" class="gridtit">
            <td>Recebimento Numerário (1)</td>
            <td>Pagamento de Despesas (2)</td>
            <td>Saldo de Pagamentos x Numerários (1+2)</td>											
            <td>Faturas com saldo Credor (3)</td>
            <td>Faturas com saldo Devedor(4)</td>
            <td>Saldo de Faturas (3+4)</td>
            <td>Faturas com Saldo Devedor Vencidas (5)</td>
            <td>Média de Dias em atraso (6)</td>	
					</tr>																														
					<%


if objrs.RecordCount > 0 then
   nrec = 0

	'Exibe os resultados do relatório e aplica a personalização
	 Do While nrec < objrs.PageSize and Not objrs.Eof
		'dados do prcesso
		'alterna a cor das linhas
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
<%
   Select Case tp_relat
     Case "0"
%>
							<td><nobr><%= objrs.Fields.Item("GRUPO").Value %>&nbsp;</nobr></td>
<%   Case "1"  %>
							<td><nobr><%= objrs.Fields.Item("EMPRESA").Value %>&nbsp;</nobr></td>
							<td><nobr><%= objrs.Fields.Item("GRUPO").Value %>&nbsp;</nobr></td>
<%   Case "2"  %>
							<td><nobr><%= objrs.Fields.Item("NR_PROCESSO").Value %>&nbsp;</nobr></td>
							<td><nobr><%= objrs.Fields.Item("EMPRESA").Value %>&nbsp;</nobr></td>
							<td><nobr><%= objrs.Fields.Item("GRUPO").Value %>&nbsp;</nobr></td>	
<% End Select %>							

							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("NUMERARIO").Value, 2) %></nobr></td>
							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("DESPESA").Value, 2) %></nobr></td>
							<td align="right"><nobr><b><%= FormatNumber(objrs.Fields.Item("NUMERARIO_DESPESA").Value, 2) %></b></nobr></td>
							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("CREDOR").Value, 2) %></nobr></td>
							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("DEVEDOR").Value, 2) %></nobr></td>
							<td align="right"><nobr><b><%= FormatNumber(objrs.Fields.Item("CREDOR_DEVEDOR").Value, 2) %></b></nobr></td>
							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("HONORARIO").Value, 2) %></nobr></td>
							<td align="right"><nobr><b><%= FormatNumber(objrs.Fields.Item("SALDO_TOTAL").Value, 2) %></b></nobr></td>
							<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("DEVEDOR_VENC").Value, 2) %></nobr></td>																																																	
							<td align="right"><nobr><%= objrs.Fields.Item("DIAS_ATRASO").Value %></nobr></td>
					</tr>
					<%
 
  	nrec = nrec + 1
		objrs.MoveNext
		If objrs.Eof Then
		  	
  	If objrsx.State = adStateOpen Then objrsx.Close()
		'seleciona a referencia de acordo com o tipo
		sql = "SELECT ISNULL(SUM(VL_NUMERARIO), 0) AS NUMERARIO, "&_
  				" ISNULL(SUM(VL_DESPESA), 0) AS DESPESA, "&_
	  			" ISNULL(ISNULL(SUM(VL_NUMERARIO), 0) + ISNULL(SUM(VL_DESPESA), 0), 0) AS NUMERARIO_DESPESA, "&_
		  		" ISNULL(SUM(VL_CREDOR), 0) AS CREDOR, "&_
  				" ISNULL(SUM(VL_DEVEDOR), 0) AS DEVEDOR, "&_
  				" ISNULL(ISNULL(SUM(VL_CREDOR), 0) + ISNULL(SUM(VL_DEVEDOR), 0), 0) AS CREDOR_DEVEDOR, "&_
  				" ISNULL(ISNULL(SUM(VL_NUMERARIO), 0) + ISNULL(SUM(VL_DESPESA), 0) + ISNULL(SUM(VL_CREDOR), 0) + ISNULL(SUM(VL_DEVEDOR), 0), 0) AS SALDO_TOTAL, "&_
  				" ISNULL(SUM(VL_HONORARIO), 0)  AS HONORARIO, "&_
  				" ISNULL(SUM(VL_DEVEDOR_VENC), 0) AS DEVEDOR_VENC "&_ 
					"  FROM TREl_SALDO_CLI (NOLOCK)" &_
 				  " WHERE CD_USUARIO = '"& Session("cd_usuario") &"'  AND NR_IDENT = "& nr_ident 
						
  	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				
%>
				
					<tr height="15">
              <td colspan="<%= nr_aux %>" class="gridtop">Total </nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("NUMERARIO").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("DESPESA").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("NUMERARIO_DESPESA").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("CREDOR").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("DEVEDOR").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("CREDOR_DEVEDOR").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("HONORARIO").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("SALDO_TOTAL").Value, 2) %>&nbsp;</nobr></td>
							<td class="gridsub" align="right"><nobr><%= FormatNumber(objrsx.Fields.Item("DEVEDOR_VENC").Value, 2) %>&nbsp;</nobr></td>																																																	
							<td class="gridsub">&nbsp;</td>
					</tr>
<%		
		 Exit Do
		End If 
	Loop
end if
				 			


%>

					<tr class="gridtit" height="15">	
						<td colspan=<%= vl_colspan %> align="left"><nobr><%= tx_lang_A00030(cd_lang) &" "& vl_count &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
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
