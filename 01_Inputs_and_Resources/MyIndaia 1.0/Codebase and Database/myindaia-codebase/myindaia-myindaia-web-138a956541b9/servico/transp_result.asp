<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Prestadores de Serviços / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 01/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_cntr 'numero do container
Dim nr_nota 'numero da nota fiscal
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_comodo = "1"
in_show  = False
cd_tela  = "IMP031"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
Session("flag_alteracao") = "0"
tx_path_excel = "/servico/transp_excel"

If Request.TotalBytes > 0 Then
	nr_processo = Request.Form("nr_processo") 
	nr_cntr     = Request.Form("nr_cntr")
	'atualiza os valores de container
	If fnc_TestaVar(nr_processo) and fnc_TestaVar(nr_cntr) Then
		Session("flag_alteracao") = "1"
		sql = "UPDATE BROKER.DBO.TPROCESSO_CNTR SET "
		sql = sql &" DT_ENTREGA_FABRICA = "
		If IsDate(Request.Form("dt_ent_fabrica")) Then sql = sql &"CONVERT(datetime, '"& Request.Form("dt_ent_fabrica") &"', 103), " Else sql = sql &"NULL, "
		sql = sql &" DT_RET_CNTR_FABRICA = "
		If IsDate(Request.Form("dt_ret_fabrica")) Then sql = sql &"CONVERT(datetime, '"& Request.Form("dt_ret_fabrica") &"', 103), " Else sql = sql &"NULL, "
		sql = sql &" DT_RETIRADA_PORTO = "
		If IsDate(Request.Form("dt_retirada_porto")) Then sql = sql &"CONVERT(datetime, '"& Request.Form("dt_retirada_porto") &"', 103), " Else sql = sql &"NULL, "		
        sql = sql &" DT_DEVOLUCAO_CNTR = "
		If IsDate(Request.Form("dt_devolucao_cntr")) Then sql = sql &"CONVERT(datetime, '"& Request.Form("dt_devolucao_cntr") &"', 103)  " Else sql = sql &"NULL  "
		sql = sql &"WHERE NR_PROCESSO = '"& nr_processo &"' AND NR_CNTR = '"& nr_cntr &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
	else
		'atualiza o followup
		sql = "UPDATE FU SET DT_REALIZACAO = "
		If IsDate(Request.Form("dt_ent_fabrica")) Then sql = sql &"CONVERT(datetime, '"& Request.Form("dt_ent_fabrica") &"', 103), " Else sql = sql &"NULL, "
		sql = sql&"IN_APLICAVEL = '1', CD_RESP_REALIZACAO = '"& Session("cd_usuario") &"' "&_ 
							"FROM BROKER.DBO.TFOLLOWUP FU WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_EVENTO = '164'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
	End If
End If

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "kpi_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function fnc_ValidaData(edit) {
  var valida = true;
	
	if (edit.value!='') {
		if (getValidDate(edit.value)==undefined) {
			alert('Atenção: Data inválida!');
			valida = false;
			edit.select();
			edit.focus();
		}
	}
	return valida;
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
<style type="text/css">
<!--
#apDiv1 {
	visibility: hidden;
}
-->
#apDiv3 {
	visibility: hidden;
}

#apDiv4 {
	visibility: hidden;
}



</style>
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="50" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr height="35" class="gridtit">
						<td>Nr. Pedido</td>
						<td>Nr. Ref. Indaiá</td>
						<td>Nr. Contâiner</td>
						<td>Nr. Conhecimento</td>
						<td>Cliente</td>
						<td>C.N.P.J.</td>
                        <td>Chegada Porto/Aeroporto/Fronteira</td>
						<td>Data Vencimento da Demurrage</td>
                 		<td>Data de Entrega a Transp.</td>
						<td>Data da Entrega na Fábrica</td>
						<td>Data da Retirada da Fábrica</td>
						<td>Devolução Contâiner</td>
                        <td>Data da Retirada do Porto</td>
                        <%If Session("cd_cargo")="055" Then%>
						<td>&nbsp;OK&nbsp;</td>
                        <%End If%>
					</tr>
					<%
'verifica se existe container no processo
sql = "SELECT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
			"  PR.NR_CONHECIMENTO, PC.NR_CNTR, PC.DT_DEMURRAGE, PC.DT_ENTREGA_FABRICA, PC.DT_RET_CNTR_FABRICA, "&_
			"  PC.DT_ENTRADA_PATIO_TRANSP, PC.DT_DEVOLUCAO_CNTR, PC.DT_RETIRADA_PORTO, EN.NM_EMPRESA, EN.CGC_EMPRESA, ISNULL(CONVERT(VARCHAR, F.DT_REALIZACAO, 103),'') AS DT_REALIZACAO "&_
			"FROM TREL_SERV_TRANSP R (NOLOCK) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) ON (PC.NR_PROCESSO = R.NR_PROCESSO AND PC.NR_CNTR = R.NR_CNTR) "&_
			"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA = PR.CD_CLIENTE)"&_
            "  LEFT JOIN  BROKER.DBO.TFOLLOWUP F (NOLOCK) ON (F.NR_PROCESSO = R.NR_PROCESSO AND F.CD_EVENTO = '162') "&_ 
			"WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' AND R.NR_IDENT = "& nr_ident &" AND PR.TP_ESTUFAGEM IN ('0','1') "&_
			"ORDER BY R.NR_PROCESSO, R.NR_CNTR"
Session("sql_transp") = sql			
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText


if objrs.RecordCount > 0 then
	'Exibe os resultados do relatório e aplica a personalização
	Do While not objrs.Eof
		'dados do prcesso
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		nr_cntr     = Trim(objrs.Fields.Item("NR_CNTR").Value)
		If objrsx.State = adStateOpen Then objrsx.Close()
		sql = "SELECT RC.CD_REFERENCIA, ISNULL(RC.NR_ITEM_PO, '0000') AS NR_ITEM_CLIENTE "&_
					"FROM TREF_CLIENTE RC (NOLOCK) "&_
					"WHERE RC.NR_PROCESSO = '"& nr_processo &"' AND RC.TP_REFERENCIA = '01' "&_
					"ORDER BY RC.CD_REFERENCIA, RC.NR_ITEM_PO"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'agrupa todas as referencias na string para aparecerem como hint
		If objrsx.RecordCount > 0 Then
			nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
			Do While Not objrsx.Eof
				str = str & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
				objrsx.MoveNext
				If objrsx.Eof Then Exit Do Else str = str & vbcrlf
			Loop
		Else
			nr_referencia = Null
			str = Null
		End If
		'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<form name="frmgrava" action="<%= url%>" method="post">
							<input type="hidden" name="nr_processo" value="<%= nr_processo%>">
							<input type="hidden" name="nr_cntr" value="<%= nr_cntr%>">
							<td title="<%= str%>"><nobr><%= nr_referencia%></nobr></td>
							<td><nobr><%= Mid(nr_processo, 5, Len(nr_processo))%></nobr></td>
							<td><nobr><%= fnc_Mascara(nr_cntr, 0)%></nobr></td>
							<td><nobr><%= objrs.Fields.Item("NR_CONHECIMENTO").Value%></nobr></td>
							<td><nobr><%= objrs.Fields.Item("NM_EMPRESA").Value%></nobr></td>
							<td><nobr><%= objrs.Fields.Item("CGC_EMPRESA").Value%></nobr></td>
                            <td><nobr><%= objrs.Fields.Item("DT_REALIZACAO").Value%></nobr></td>
							<td align="center"><nobr><%= fnc_Mascara(objrs.Fields.Item("DT_DEMURRAGE").Value, 5)%></nobr></td>
                            <td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_ENTRADA_PATIO_TRANSP").Value, 5)%></td>
                            <%If Session("cd_cargo")="055" Then%>                            
							<td align="center"><input class="editbox" type="text" name="dt_ent_fabrica" value="<%= fnc_Mascara(objrs.Fields.Item("DT_ENTREGA_FABRICA").Value, 5)%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);"></td>
                            <td align="center"><input class="editbox" type="text" name="dt_ret_fabrica" value="<%= fnc_Mascara(objrs.Fields.Item("DT_RET_CNTR_FABRICA").Value, 5)%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);"></td>
                            <td align="center"><input class="editbox" type="text" name="dt_devolucao_cntr" value="<%= fnc_Mascara(objrs.Fields.Item("DT_DEVOLUCAO_CNTR").Value, 5)%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);"></td>
                            <td align="center"><input class="editbox" type="text" name="dt_retirada_porto" value="<%= fnc_Mascara(objrs.Fields.Item("DT_RETIRADA_PORTO").Value, 5)%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);"></td>
                            <td align="center"><input class="botao" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></td>
                            <%Else%>
                            <td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_ENTREGA_FABRICA").Value, 5)%></td>
                            <td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_RET_CNTR_FABRICA").Value, 5)%></td>
                             <td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_DEVOLUCAO_CNTR").Value, 5)%></td>
                             <td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_RETIRADA_PORTO").Value, 5)%></td>
                            <%End If%>
						</form>
					</tr>
					<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
end if
if objrs.State = adStateOpen then objrs.Close

'verifica se existe container no processo
sql = "SELECT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
			"  PR.NR_CONHECIMENTO, FU.DT_REALIZACAO AS DT_ENTREGA_FABRICA, EN.NM_EMPRESA, EN.CGC_EMPRESA "&_
			"FROM TREL_SERV_TRANSP R (NOLOCK) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO)  "&_
			"  INNER JOIN BROKER.DBO.TFOLLOWUP FU (NOLOCK) ON (FU.NR_PROCESSO = R.NR_PROCESSO AND FU.CD_EVENTO = '164') "&_
			"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA = PR.CD_CLIENTE)"&_
			"WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' AND R.NR_IDENT = "& nr_ident &" AND PR.TP_ESTUFAGEM = '2' "&_
			"ORDER BY R.NR_PROCESSO"					
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
	'Exibe os resultados do relatório e aplica a personalização
	Do While not objrs.Eof
		'dados do prcesso
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		If objrsx.State = adStateOpen Then objrsx.Close()
		sql = "SELECT RC.CD_REFERENCIA, ISNULL(RC.NR_ITEM_PO, '0000') AS NR_ITEM_CLIENTE "&_
					"FROM TREF_CLIENTE RC (NOLOCK) "&_
					"WHERE RC.NR_PROCESSO = '"& nr_processo &"' AND RC.TP_REFERENCIA = '01' "&_
					"ORDER BY RC.CD_REFERENCIA, RC.NR_ITEM_PO"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'agrupa todas as referencias na string para aparecerem como hint
		If objrsx.RecordCount > 0 Then
			nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
			Do While Not objrsx.Eof
				str = str & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) &"/"& Trim(objrsx.Fields.Item("NR_ITEM_CLIENTE").Value)
				objrsx.MoveNext
				If objrsx.Eof Then Exit Do Else str = str & vbcrlf
			Loop
		Else
			nr_referencia = Null
			str           = Null
		End If
		'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<form name="frmgrava" action="<%= url%>" method="post">
							<input type="hidden" name="nr_processo" value="<%= nr_processo%>">
							<input type="hidden" name="nr_cntr" value="">
							<td title="<%= str%>"><nobr><%= nr_referencia%></nobr></td>
							<td><nobr><%= Mid(nr_processo, 5, Len(nr_processo))%></nobr></td>
							<td>&nbsp;</td>
							<td><nobr><%= objrs.Fields.Item("NR_CONHECIMENTO").Value%></nobr></td>
							<td><nobr><%= objrs.Fields.Item("NM_EMPRESA").Value%></nobr></td>
							<td><nobr><%= objrs.Fields.Item("CGC_EMPRESA").Value%></nobr></td>
							<td>&nbsp;</td>
                            <td>&nbsp;</td>
                             <%If Session("cd_cargo")="055" Then%>  
							<td align="center"><input class="editbox" type="text" name="dt_ent_fabrica" value="<%= fnc_Mascara(objrs.Fields.Item("DT_ENTREGA_FABRICA").Value, 5)%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);"></td>
							<%Else%>
                            <td align="center"><%= objrs.Fields.Item("DT_ENTREGA_FABRICA").Value%></td>
                            <%End If %>
                            <td>&nbsp;</td>
							<td>&nbsp;</td>
                            <%If Session("cd_cargo")="055" Then%>     
							<td align="center"><input class="botao" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></td>
                            <%End If %>
						</form>
					</tr>
					<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
end if
if objrs.State = adStateOpen then objrs.Close

'verifica se existe container no processo
sql = "SELECT COUNT(*) FROM TREL_SERV_TRANSP (NOLOCK) "&_
			"WHERE CD_USUARIO = '"& Session("cd_usuario") &"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
					<tr class="gridtit" height="15">
						<td colspan="13" align="left"><nobr><%= tx_lang_A00030(cd_lang) &" "& objrs.Fields.Item(0).Value &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
					</tr>
					<tr height="25">
						<td colspan="13" align="center"><%= "<i>"& tx_lang_A00002(cd_lang) &": "& tx_lang_A00026(cd_lang) &" DD/MM/AAAA.</i>"%></td>
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
