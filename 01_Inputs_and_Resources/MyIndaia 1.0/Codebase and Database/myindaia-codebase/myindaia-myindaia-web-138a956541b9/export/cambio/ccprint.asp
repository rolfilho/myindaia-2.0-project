<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Contratos de Câmbio Exportação
'Arquivo de Script e HTML: Impressão do Contrato
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrContrato, vNrBanco

vNrContrato = Trim(Request("vNrContrato"))
vNrBanco = Trim(Request("vNrBanco"))
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

tx_erro = ""
if not fnc_TestaVar(vNrContrato) then tx_erro = tx_erro&" - Nr. do Contrato não definido;\n"
if not fnc_TestaVar(vNrBanco) then tx_erro = tx_erro&" - Nr. do Banco não definido;\n"

if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT NR_CONT_CAMB, NR_BANCO, CD_USUARIO_CRIA, DT_CRIA_CONT, CD_STATUS_CONT, "&_
			"  (SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = C.CD_EXPORTADOR) AS NM_EXPORTADOR, "&_
			"  (SELECT RTRIM(NM_MOEDA) FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = C.CD_MOEDA_NEGOC) AS NM_MOEDA_NEGOC, "&_
			"  CAST(IN_CAMBIO_PRONTO as char(1)) AS IN_CAMBIO_PRONTO, ISNULL(TX_FATURAS, '') AS TX_FATURAS, "&_
			"  DT_FECHAMENTO, DT_ADIANTAMENTO, DT_VENC_LIQ, DT_VENC_DOCTO, ISNULL(VL_NEGOC, 0) AS VL_NEGOC, "&_
			"  ISNULL(VL_TAXA_CAMBIAL, 0) AS VL_TAXA_CAMBIAL, ISNULL(VL_TAXA_JUROS, 0) AS VL_TAXA_JUROS, ISNULL(VL_COMISSAO_AG, 0) AS VL_COMISSAO_AG "&_
			"FROM TCONT_CAMB C (NOLOCK) "&_
			"WHERE C.NR_CONT_CAMB = '"&vNrContrato&"' AND C.NR_BANCO = '"&vNrBanco&"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_heigth = 20
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="overflow: auto;">
<table width="670" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td rowspan="2" width="160"></td>
					<td colspan="2" class="titulo">Contrato de Câmbio <%= vNrContrato%></td>
				</tr>
				<tr>
					<td><%= objrs.Fields.Item("NM_EXPORTADOR").Value%><b><br>
						Nr. Banco: <%= vNrBanco%></b></td>
					<td align="right"></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<col width="100">
				<col width="220">
				<col width="100">
				<col width="240">
				<tr height="<%= vl_heigth%>">
					<td><b>Valor do Contrato:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_NEGOC").Value, 2)%></td>
					<td><b>Proje&ccedil;&atilde;o de Valor:</b></td>
					<td></td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>Exportador:</b></td>
					<td><%= objrs.Fields.Item("NM_EXPORTADOR").Value%></td>
					<td><b>Moeda do Contrato:</b></td>
					<td><%= objrs.Fields.Item("NM_MOEDA_NEGOC").Value%></td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>Dt. Fechamento:</b></td>
					<td><%= fnc_Mascara(objrs.Fields.Item("DT_FECHAMENTO").Value, 5)%></td>
					<td><b>Dt. Adiantamento:</b></td>
					<td><%= fnc_Mascara(objrs.Fields.Item("DT_ADIANTAMENTO").Value, 5)%></td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>Taxa Cambial:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value, 2)%></td>
					<td><b>Taxa de Juros:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_TAXA_JUROS").Value, 2)%></td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>Vencto. da Liquida&ccedil;&atilde;o:</b></td>
					<td><%= fnc_Mascara(objrs.Fields.Item("DT_VENC_LIQ").Value, 5)%></td>
					<td><b>Vencto. dos Doctos.:</b></td>
					<td><%= fnc_Mascara(objrs.Fields.Item("DT_VENC_DOCTO").Value, 5)%></td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>C&acirc;mbio Pronto:</b></td>
					<td><%= sim_nao(objrs.Fields.Item("IN_CAMBIO_PRONTO").Value)%></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="<%= vl_heigth%>">
					<td><b>Comiss&atilde;o do Agente:</b></td>
					<td><%= FormatNumber(objrs.Fields.Item("VL_COMISSAO_AG").Value, 2)%></td>
					<td><b>Faturas:</b></td>
					<td><%= objrs.Fields.Item("TX_FATURAS").Value%></td>
				</tr>
			</table>
			<%
'exibe os fornecimentos desse rap
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT P.NR_FATURA_CDE, ISNULL(P.VL_VINCULADO, 0) AS VL_VINCULADO, P.DT_VINCULADO, "&_
			"  ISNULL((SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_IMPORTADOR), '') AS NM_IMPORTADOR "&_
			"FROM TPROCESSO_EXP_CONT_CAMB P (NOLOCK), TPROCESSO_EXP E (NOLOCK) "&_
			"WHERE P.NR_CONT_CAMB = '"&vNrContrato&"' "&_
			"  AND P.NR_BANCO     = '"&vNrBanco&"' "&_
			"  AND P.NR_PROCESSO  = E.NR_PROCESSO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then 
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr height="35">
					<td colspan="9" style="font-size:12px">Faturas Vinculadas ao Contrato</td>
				</tr>
				<tr height="18">
					<td class="pgridtit">&nbsp;Nr. Fatura</td>
					<td class="pgridtit">&nbsp;Dt. Vinculação</td>
					<td class="pgridtit">&nbsp;Importador/Cliente</td>
					<td class="pgridtit">&nbsp;Valor Vinculado</td>
				</tr>
				<%
	'lista RAP´s para exibi-las em tela
	do while not objrs.Eof
%>
				<tr height="16" style="vertical-align: top;">
					<td class="pgridsub"><%= objrs.Fields.Item("NR_FATURA_CDE").Value%>&nbsp;</td>
					<td class="pgridsub" align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_VINCULADO").Value, 5)%>&nbsp;</td>
					<td class="pgridsub"><%= objrs.Fields.Item("NM_IMPORTADOR").Value%>&nbsp;</td>
					<td class="pgridsub" align="right"><%= FormatNumber(objrs.Fields.Item("VL_VINCULADO").Value, 2)%>&nbsp;</td>
				</tr>
				<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
%>
			</table>
			<%
end if
objrs.Close()
%>
		</td>
	</tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->
