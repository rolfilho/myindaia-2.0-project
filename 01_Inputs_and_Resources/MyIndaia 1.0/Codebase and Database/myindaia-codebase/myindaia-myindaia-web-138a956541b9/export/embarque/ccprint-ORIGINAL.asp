<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim vNrRap : vNrRap = Trim(Request("vNrRap"))
dim vNrCde, vVolume, vTpStatus, vDtStatus, vHrStatus

if not fnc_TestaVar(vNrRap) then tx_erro = " - Código da Instrução não definido;\n"

function fncSelecionaLogo(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case CInt(nTipo)
		case 0 vReturn = "logo_sg0.jpg"
		case 1 vReturn = "logo_sg1.jpg"
		case 2 vReturn = "logo_sg2.jpg"
		case 3 vReturn = "logo_sg3.jpg"
		case else vReturn = "logo_no.jpg"
	end select
	fncSelecionaLogo = vReturn
end function

function fncExibeForma(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case nTipo
		case 0 vReturn = " Gr&aacute;fica"
		case 1 vReturn = " A Remeter"
		case else vReturn = ""
	end select
	fncExibeForma = vReturn
end function

sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO, "&_

			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_EXPORTADOR), '&nbsp;') AS NM_EXPORTADOR, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_FABRICANTE), '&nbsp;') AS NM_FABRICANTE, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '&nbsp;') AS NM_CLIENTE, "&_
			"  ISNULL((SELECT RTRIM(NM_PAIS) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS), '&nbsp;') AS NM_PAIS, "&_
			"  ISNULL((SELECT RTRIM(NM_TERMO_PAGTO) FROM TTERMO_PAGTO (NOLOCK) WHERE CD_TERMO_PAGTO = R.CD_TERMO_PAGTO), '&nbsp;') AS NM_TERMO_PAGTO, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_AGENTE_COMISSAO), '&nbsp;') AS NM_AGENTE_COMISSAO, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_DEP_COLETA), '&nbsp;') AS NM_DEP_COLETA, "&_
			"  ISNULL((SELECT RTRIM(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = R.CD_VIA_TRANSPORTE), '&nbsp;') AS NM_VIA_TRANSPORTE, "&_
			"  ISNULL((SELECT RTRIM(NM_AGENTE) FROM TAGENTE (NOLOCK) WHERE CD_AGENTE = R.CD_EMBARCADOR), '&nbsp;') AS NM_EMBARCADOR, "&_
			"  ISNULL((SELECT RTRIM(NM_EMBARCACAO) FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = R.CD_EMBARCACAO), '&nbsp;') AS NM_EMBARCACAO, "&_
			"  ISNULL((SELECT RTRIM(NM_LOCAL_EMB) FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = R.CD_LOCAL_ORIGEM), '&nbsp;') AS NM_LOCAL_ORIGEM, "&_
			"  ISNULL((SELECT RTRIM(NM_LOCAL_EMB) FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = R.CD_LOCAL_DESTINO), '&nbsp;') AS NM_LOCAL_DESTINO, "&_
			"  ISNULL((SELECT RTRIM(NM_MOEDA) FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = R.CD_MOEDA_MLE), '&nbsp;') AS NM_MOEDA_MLE, "&_
			"  CD_LOGOMARCA, CD_INCOTERM, CD_NOTIFY, CD_CONSIGNATARIO, CD_FORMA_PAGAR, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
			"  ISNULL(NR_FORNECIMENTO, '&nbsp;') AS NR_FORNECIMENTO, ISNULL(NR_CDE, '&nbsp;') AS NR_CDE, ISNULL(NR_VIAGEM, '&nbsp;') AS NR_VIAGEM, "&_
			"  ISNULL(NR_ATO_CONCESSORIO, '&nbsp;') AS NR_ATO_CONCESSORIO, ISNULL(NR_INSPECAO, '&nbsp;') AS NR_INSPECAO, "&_
			"  ISNULL(NR_NOTA_CREDITO, '&nbsp;') AS NR_NOTA_CREDITO, "&_
			"  CAST(IN_FABR_EXPO as char(1)) AS IN_FABR_EXPO, CAST(IN_TRIANGULACAO as char(1)) AS IN_TRIANGULACAO, "&_
			"  CAST(IN_PERMISSO as char(1)) AS IN_PERMISSO, CAST(IN_DECL_EMBALAGEM as char(1)) AS IN_DECL_EMBALAGEM, "&_
			"  CAST(IN_CONSULADO as char(1)) AS IN_CONSULADO, CAST(IN_PALLET_EXPURGO as char(1)) AS IN_PALLET_EXPURGO, "&_
			"  CAST(IN_EXPURGO as char(1)) AS IN_EXPURGO, CAST(IN_INSPECAO as char(1)) AS IN_INSPECAO, "&_
			"  CAST(IN_CARTA_CREDITO as char(1)) AS IN_CARTA_CREDITO, CAST(IN_CADIVI as char(1)) AS IN_CADIVI, "&_
			"  CAST(IN_AMOSTRA as char(1)) AS IN_AMOSTRA, CAST(IN_ANTECIPADO as char(1)) AS IN_ANTECIPADO, "&_
			"  DT_FATURAMENTO, DT_EMBARQUE, ISNULL(TX_ORGAO,'&nbsp;') AS TX_ORGAO, ISNULL(TX_LOCAL_INSPECAO,'&nbsp;') AS TX_LOCAL_INSPECAO, "&_
			"  ISNULL(TX_LOCAL_EXPURGO,'&nbsp;') AS TX_LOCAL_EXPURGO, ISNULL(TX_EMBALAGEM,'&nbsp;') AS TX_EMBALAGEM, "&_
			"  ISNULL(TX_MARCACAO,'&nbsp;') AS TX_MARCACAO, ISNULL(TX_INST_EMB, '&nbsp;') AS TX_INST_EMB, ISNULL(TX_MOTIVO_DESC, '&nbsp;') AS TX_MOTIVO_DESC, "&_
			"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_FRETE_INT, 0) AS VL_FRETE_INT, ISNULL(VL_SEGURO, 0) AS VL_SEGURO, "&_
			"  ISNULL(VL_ACRESCIMO, 0) AS VL_ACRESCIMO, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(VL_COMISSAO, 0) AS VL_COMISSAO, "&_
			"  ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, "&_
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL "&_
			"FROM TRAP R (NOLOCK) "&_
			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'**********************************************************************************************************
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "select NM_USUARIO from tusuario WHERE CD_USUARIO="&objrs.Fields.Item("CD_USUARIO_CRIADOR").Value&""
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'**********************************************************************************************************

vl_heigth = 20
'vNrCde = objrs.Fields.Item("NR_CDE").Value
vNrCde=objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value 'FLAVIO 14/01/2008
if fnc_TestaVar(vNrCde) then
	vNrCde = Replace(Trim(vNrCde),"/","")
	vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
else
	vNrCde = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;"
end if
'verifica o status e exibe a data do ultimo status
select case objrs.Fields.Item("CD_STATUS").Value
	case 0
		vTpStatus = "Cancelado: "
		vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)
		vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7)
	case 2, 3
		vTpStatus = "Autorizado: "
		vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)
		vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7)
	case else
		vTpStatus = ""
		vDtStatus = ""
		vHrStatus = ""
end select
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
fieldset {
	border: #CCCCCC 1px solid;
	height: 100%;
	width: 99%;
	padding: 5px;
}
legend {
	font-weight:bold;
}
.c1 {
	border:dotted #DDDDDD;
	border-width: 0px 0px 1px 0px;
}
.c2 {
	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
}
</style>
</head>

<body style="overflow: auto;">
<table width="670" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td rowspan="2" width="160"><img src="/imagens/<%= fncSelecionaLogo(objrs.Fields.Item("CD_LOGOMARCA").Value)%>"></td>
				<td colspan="2" class="titulo">Instrução de Embarque/Nr.CDE: <b><%= vNrCde%></b></td>
			</tr>
			<tr>
				<td><%= objrs.Fields.Item("NM_EXPORTADOR").Value%><b><br>
				</b></td>
				<td align="right">Abertura: <%= fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)&" "&Left(fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7), 5)%><br>
				Analista: <%=objrsx.Fields.Item("NM_USUARIO").Value%> <br>
					<br>
					<%= vTpStatus&" "&vDtStatus&" "&Left(vHrStatus, 5)%></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td><table width="100%" border="0" cellspacing="0" cellpadding="1">
			<col width="100">
			<col width="220">
			<col width="100">
			<col width="240">
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Amostra?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_AMOSTRA").Value)%></td>
				<td class="c1"><b>Antecipado?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_ANTECIPADO").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Cliente:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_CLIENTE").Value%></td>
				<td class="c1"><b>Fabricante:</b></td>
				<td class="c2">	<%IF sim_nao(objrs.Fields.Item("IN_FABR_EXPO").Value)="Sim" then%><%=objrs.Fields.Item("NM_EXPORTADOR").Value%><%else%>
				<%= objrs.Fields.Item("NM_FABRICANTE").Value%> <%end if%>
				
			</td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Fabr. &eacute; o Exportador?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_FABR_EXPO").Value)%></td>
				<td class="c1"><b>Dt. Faturamento:</b></td>
				<td class="c2"><%= fnc_Mascara(objrs.Fields.Item("DT_FATURAMENTO").Value, 5)%></td>	
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Nr. Fornecimento:</b></td>
				<td class="c2"><%= Replace(Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value),";","; ")%></td>
				<td class="c1"><b>Pa&iacute;s de Destino:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_PAIS").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Dt. Acordada de Embarque:</b></td>
				<td class="c2"><%= fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)%></td>	
				<td class="c1"><b>CADIVI?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_CADIVI").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Drawback:</b></td>
				<td class="c2"><%
str = objrs.Fields.Item("TP_DRAWBACK").Value
if fnc_TestaVar(str) then str = tipo_drawback(str) else str = ""
Response.Write(str)%></td>
				<td class="c1"><b>Nr Ato Concessório:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NR_ATO_CONCESSORIO").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Permisso?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_PERMISSO").Value)%></td>
				<td class="c1"><b>Processo com triangulação?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_TRIANGULACAO").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Consulado?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_CONSULADO").Value)%></td>
				<td class="c1"><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_DECL_EMBALAGEM").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Pallet Expurgado?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_PALLET_EXPURGO").Value)%></td>
				<td class="c1"><b>Certificado de Expurgo?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_EXPURGO").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Inspe&ccedil;&atilde;o?</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_INSPECAO").Value)%></td>
				<td class="c1"><b>Nr. Inspeção:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NR_INSPECAO").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1">&nbsp;</td>
				<td class="c2">&nbsp;</td>
				<td class="c1"><b>&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</b></td>
				<td class="c2"><%= Trim(objrs.Fields.Item("TX_ORGAO").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Incoterm:</b></td>
				<td class="c2"><%= objrs.Fields.Item("CD_INCOTERM").Value%></td>
				<td class="c1"><b>Condi&ccedil;&atilde;o de Pagamento:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_TERMO_PAGTO").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Valor FOB: </b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_MLE").Value, 2)%></td>
				<td class="c1"><b>Moeda FOB: </b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Acr&eacute;scimo:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_ACRESCIMO").Value, 2)%></td>
				<td class="c1">&nbsp;</td>
				<td class="c2">&nbsp;</td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Desconto:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_DESCONTO").Value, 2)%></td>
				<td class="c1"><b>Motivo Desconto:</b></td>
				<td class="c2"><%= objrs.Fields.Item("TX_MOTIVO_DESC").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Valor Frete:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_FRETE_INT").Value, 2)%></td>
				<td class="c1"><b>Peso Bruto:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO").Value, 4)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Valor Seguro:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_SEGURO").Value, 2)%></td>
				<td class="c1"><b>Peso Líquido:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_PESO_LIQ").Value, 4)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Cubagem:</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_CUBAGEM").Value, 3)%> m³</td>
				<td class="c1">&nbsp;</td>
				<td class="c2">&nbsp;</td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Embalagem:</b></td>
				<td class="c2"><%= objrs.Fields.Item("TX_EMBALAGEM").Value%></td>
				<td class="c1"><b>Qtde Volumes:</b></td>
				<td class="c2"><%= objrs.Fields.Item("VL_QTD_VOL").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Comiss&atilde;o?</b></td>
				<td class="c2"><%= FormatNumber(objrs.Fields.Item("VL_COMISSAO").Value, 2)&"%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value)%></td>
				<td class="c1"><b>Agente Comiss&atilde;o:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_AGENTE_COMISSAO").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Dep. Coleta:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_DEP_COLETA").Value%></td>
				<td class="c1">&nbsp;</td>
				<td class="c2">&nbsp;</td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Via de Transporte:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_VIA_TRANSPORTE").Value%></td>
				<td class="c1"><b>Embarcador:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_EMBARCADOR").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Navio:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_EMBARCACAO").Value%></td>
				<td class="c1"><b>Nr. Viagem:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NR_VIAGEM").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Local de Embarque:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_LOCAL_ORIGEM").Value%></td>	
				<td class="c1"><b>Local de Desembarque:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NM_LOCAL_DESTINO").Value%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Notify:</b></td>
				<td class="c2"><%= fncTipoPessoaExp(objrs.Fields.Item("CD_NOTIFY").Value, objrs.Fields.Item("TP_NOTIFY").Value)%></td>
				<td class="c1"><b>Consignee:</b></td>
				<td class="c2"><%= fncTipoPessoaExp(objrs.Fields.Item("CD_CONSIGNATARIO").Value, objrs.Fields.Item("TP_CONSIGNEE").Value)%></td>
			</tr>
			<tr height="<%= vl_heigth%>">
				<td class="c1"><b>Carta de Crédito:</b></td>
				<td class="c2"><%= sim_nao(objrs.Fields.Item("IN_CARTA_CREDITO").Value)%></td>
				<td class="c1"><b>Nr. Nota de Crédito:</b></td>
				<td class="c2"><%= objrs.Fields.Item("NR_NOTA_CREDITO").Value%></td>
			</tr>
			<tr>		
				<td colspan="2" class="c2"><fieldset><legend>Marca&ccedil;&atilde;o:</legend>
					<%= Replace(Trim(objrs.Fields.Item("TX_MARCACAO").Value), vbcrlf, "<br>")%></fieldset></td>
				<td colspan="2" class="c2"><fieldset><legend>Instru&ccedil;&atilde;o Geral:</legend>
					<%= Replace(Trim(objrs.Fields.Item("TX_INST_EMB").Value), vbcrlf, "<br>")%></fieldset></td>
			</tr>
		</table>
	<%
'exibe os fornecimentos desse rap
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT F.CD_FORNECIMENTO, F.CD_MERCADORIA, VL_QTDE, TX_UNID_MEDIDA, VL_PRECO_UNIT, " &_
			"  ISNULL(NR_PROFORMA, '&nbsp;') AS NR_PROFORMA, ISNULL(NR_ITEM_CLIENTE, '&nbsp;') AS NR_ITEM_CLIENTE, "&_
			"  ISNULL(AP_MERCADORIA, '&nbsp;') AS NM_MERCADORIA, ISNULL(CD_NCM_SH, '&nbsp;') AS CD_NCM_SH, "&_
			"  ISNULL(CD_NALADI_SH, '&nbsp;') AS CD_NALADI_SH " &_
			"FROM TRAP_FORNECIMENTO F (NOLOCK) " &_
			"  LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = F.CD_MERCADORIA) "&_
			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' ORDER BY F.CD_MERCADORIA"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then 
%>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="35">
						<td colspan="9" style="font-size:12px">Fornecimentos Integrados:</td>
					</tr>
					<tr height="18">
						<td class="pgridtit">Nr. Fornec.</td>
						<td class="pgridtit">Item</td>
						<td class="pgridtit">C&oacute;d. Merc.</td>
						<td class="pgridtit">NCM</td>
						<td class="pgridtit">NALADI</td>
						<td class="pgridtit">Descri&ccedil;&atilde;o</td>
						<td class="pgridtit">Unid.</td>
						<td class="pgridtit">Qtde.</td>
						<td class="pgridtit">Valor Un.</td>
						<td class="pgridtit">Proforma</td>
						<td class="pgridtit">Volumes</td>
					</tr>
					<%
	Do While Not objrs.Eof
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT DISTINCT CD_VOLUME FROM TRAP_PACK_LIST FP (NOLOCK) " &_
					" WHERE FP.CD_RAP+FP.CD_RAP_ANO = '"& vNrRap &"' " &_
					"   AND FP.CD_MERCADORIA = '"& objrs("CD_MERCADORIA") &"' "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

		vVolume = ""
		Do While Not objrsx.Eof
			vVolume = vVolume&Trim(objrsx.Fields.Item("CD_VOLUME").Value)
			objrsx.MoveNext 
			If objrsx.Eof Then Exit Do else vVolume = vVolume&", "
		Loop
%>
					<tr height="16" style="text-align: center; vertical-align: top;">
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("CD_FORNECIMENTO").Value%></nobr></td>
						<td class="pgridsub" align="right"><nobr><%= objrs.Fields.Item("NR_ITEM_CLIENTE").Value%></nobr></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("CD_MERCADORIA").Value%></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("CD_NCM_SH").Value%></nobr></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("CD_NALADI_SH").Value%></nobr></td>
						<td class="pgridsub" align="left"><nobr><%= objrs.Fields.Item("NM_MERCADORIA").Value%></nobr></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("TX_UNID_MEDIDA").Value%></nobr></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("VL_QTDE").Value%></nobr></td>
						<td class="pgridsub" align="right"><nobr><%= FormatNumber(objrs.Fields.Item("VL_PRECO_UNIT").Value, 2)%></nobr></td>
						<td class="pgridsub"><nobr><%= objrs.Fields.Item("NR_PROFORMA").Value%></nobr></td>
						<td class="pgridsub" align="left"><%= vVolume%></td>
					</tr>
					<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
			</table>
				<%
End If
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