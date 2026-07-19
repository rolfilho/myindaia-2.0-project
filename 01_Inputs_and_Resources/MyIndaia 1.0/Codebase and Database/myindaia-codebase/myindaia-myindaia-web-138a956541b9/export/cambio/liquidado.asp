<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Liquidação de Contratos de Câmbio Exportação
'Autor: Alexandre Neto
'Data: 16/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%'esta parte é somente utilizada como testes, como é muita variavel é um saco refazer, então deixei aqui
if 1 = 2 then 'é óbvio que para visualizar mude o 2 para 1 ou vice-versa, mas...
	Response.Write("<p style='font-size:12px;'>C&oacute;d. Importador: "& Request.Form("edtCodImportador"))
	Response.Write("<br>Valor Liquidar: "& Request.Form("edtVlPago"))
	Response.Write("<br>Valor Total: "& Request.Form("edtVlTotal"))
	Response.Write("<br>Saldo: "& Request.Form("edtVlSaldo"))
	Response.Write("<br>hdnNrFatura: "& Request.Form("hdnNrFatura"))
	Response.Write("<br>hdnIdLiquidacao "& Request.Form("hdnIdLiquidacao"))
	aNrFatura = split(Request.Form("hdnNrFatura"), ", ", -1)
	aVlPagoFat = split(Request.Form("edtVlTotalLiq"), ", ", -1)
	for x = 0 to UBound(aNrFatura)
		if aVlPagoFat(x) > 0 then
			Response.Write("<p style='font-size:12px;'>Fatura: "& aNrFatura(x) &" valor: "& aVlPagoFat(x))
			z = Replace(aNrFatura(x), "/", "")
			aNrNota = split(Request.Form("chkInNota"& z), ", ", -1)
			aVlSaldo = split(Request.Form("hdnVlSaldo"& z), ", ", -1)
			aVlPago = split(Request.Form("edtVlPago"& z), ", ", -1)
			aNrDocto = split(Request.Form("edtNrDoctoCont"& z), ", ", -1)
			aNrCred = split(Request.Form("edtNrNotaCred"& z), ", ", -1)
			for y = 0 to UBound(aNrNota)
				Response.Write("<br>Nota Fiscal: "&aNrNota(y))
				Response.Write("<br>Valor Nota: "&aVlSaldo(y))
				Response.Write("<br>Valor Liquidado: "& aVlPago(y))
				Response.Write("<br>Docto Contabil: "& aNrDocto(y))
				if UBound(aNrCred) > -1 then
					Response.Write("<br>Nota Crédito: "& aNrCred(y))
				else
					Response.Write("<br>Nota Crédito: ")
				end if
			next
		end if
	next
	Response.End() 'aqui encerra o script, não realiza a inclusão
end if
%>
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
tx_erro  = Request.QueryString("tx_erro")
in_show  = true

dim vTpAcao : vTpAcao = Request("vTpAcao")
dim vCodImportador : vCodImportador = Request("edtCodImportador")
dim vIdLiquidacao : vIdLiquidacao = Request("vIdLiquidacao")
dim vNrFatura, vNrNota, vVlNota, vVlPago, vVlTotal, vVlSaldo, vDtIni, vDtFim, vNrCred, vVlCred, vSQLcliente, vSQLqtde
dim aNrProcesso, aNrFatura, aVlPagoFat, aNrNota, aVlSaldo, aVlPago, aNrDocto, aNrCred

if (vTpAcao = "salvar") and (Request.Form <> "") then
	tx_erro = ""
	vVlPago = Replace(Replace(Request.Form("edtVlPago"), ".", ""), ",", ".")
	vVlTotal = Replace(Replace(Request.Form("edtVlTotal"), ".", ""), ",", ".")
	vVlSaldo = Replace(Replace(Request.Form("edtVlSaldo"), ".", ""), ",", ".")
	vIdLiquidacao = Request.Form("hdnIdLiquidacao")
	'verifica se o valor total é igual ao valor pago e/ou não existe saldo, pois pode ter erros
	if (vVlPago <> vVlTotal) or (vVlSaldo <> 0) then
		tx_erro = "ATENÇÃO:\n\nO total selecionado não pode ser diferente do valor a liquidar e/ou o saldo não pode ser diferente de zero."
		Response.Redirect("liquidacao.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_docto &"&tx_erro="& Server.URLEncode(tx_erro))
	else
		if objrs.State = adStateOpen then objrs.Close
		sql = "SELECT COUNT(*) FROM TPROCESSO_EXP_CONT_CAMB_LIQ WHERE ID_LIQUIDACAO = '"& vIdLiquidacao &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'verifica se já existe liquidação com o identificador
		if objrs.Fields.Item(0).Value = 0 then
			aNrProcesso = Split(Request.Form("hdnNrProcesso"), ", ", -1)
			aNrFatura = Split(Request.Form("hdnNrFatura"), ", ", -1)
			aVlPagoFat = Split(Request.Form("edtVlTotalLiq"), ", ", -1)
			'roda as faturas
			for x = 0 to UBound(aNrFatura)
				if aVlPagoFat(x) > 0 then
					z = Replace(aNrFatura(x), "/", "")
					aNrNota = split(Request.Form("chkInNota"& z), ", ", -1)
					aVlSaldo = split(Request.Form("hdnVlSaldo"& z), ", ", -1)
					aVlPago = split(Request.Form("edtVlPago"& z), ", ", -1)
					aNrDocto = split(Request.Form("edtNrDoctoCont"& z), ", ", -1)
					aNrCred = split(Request.Form("edtNrNotaCred"& z), ", ", -1)
					'roda as notas
					for y = 0 to UBound(aNrNota)
						'cria o numero da liquidação
						if objrs.State = adStateOpen then objrs.Close
						sql = "SELECT ISNULL(MAX(NR_LIQUIDACAO), 0) + 1 FROM TPROCESSO_EXP_CONT_CAMB_LIQ (TABLOCK HOLDLOCK) "&_
									"WHERE NR_PROCESSO = '"& aNrProcesso(x) &"' AND NR_FATURA_CDE = '"& aNrFatura(x) &"' AND NR_NF = '"& Trim(aNrNota(y)) &"'"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						'verifica se existe a nota de crédito
						if UBound(aNrCred) > -1 then
							vNrCred = aNrCred(y)
						else
							vNrCred = ""
						end if
						'cria o registro de liquidação
						sql = "INSERT INTO TPROCESSO_EXP_CONT_CAMB_LIQ (NR_PROCESSO, NR_FATURA_CDE, NR_NF, NR_LIQUIDACAO, ID_LIQUIDACAO, "&_
									"  VL_LIQUIDADO, DT_LIQUIDADO, NR_DOCTO_CONTABIL, NR_NOTA_CREDITO, CD_USUARIO_LIQ) "&_
									"VALUES ('"& aNrProcesso(x) &"', '"& aNrFatura(x) &"', '"& Trim(aNrNota(y)) &"', "& objrs.Fields.Item(0).Value &", "&_
									" '"& vIdLiquidacao &"', "& fncValSQL(aVlPago(y), 3) &", "& fncValSQL(Date, 1) &", "&_
									"  "& fncValSQL(aNrDocto(y), 0) &", "& fncValSQL(vNrCred, 0) &", '"& Session("cd_usuario") &"')"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objcnn.Execute(sql)
					next
				end if
			next
		else
			tx_erro = "ALERTA:\n\nJá foi gerada a liquidação para os dados informados. "&_
				"Isso pode ocorrer devido a uma atualização(refresh/F5) da página visualizada."
		end if
		Response.Redirect("liquidado.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_docto="& cd_docto &_
			"&vTpAcao=visualizar&vIdLiquidacao="& vIdLiquidacao &"&tx_erro="& Server.URLEncode(tx_erro))
	end if
end if

if (vTpAcao = "visualizar") then
	sql = ""
	if fnc_TestaVar(vIdLiquidacao) then
		sql = " PL.ID_LIQUIDACAO = '"& vIdLiquidacao &"' "
		vSQLqtde = "WHERE ID_LIQUIDACAO = '"& vIdLiquidacao &"' "
	else
		vDtIni = Request.Form("edtDtIni")
		vDtFim = Request.Form("edtDtFim")
		if not fnc_TestaVar(vCodImportador) and (not IsDate(vDtIni) and not IsDate(vDtFim)) then
			'caso seja consulta tem que validar a informação
			tx_erro = "ERRO:\n\nOs filtros para busca informados não são validos, verifique abaixo:"
			if fnc_TestaVar(vCodImportador) then tx_erro = tx_erro&"\n - código do importador não especificado;"
			if not IsDate(vDtIni) then tx_erro = tx_erro&"\n - data inicial inválida;"
			if not IsDate(vDtFim) then tx_erro = tx_erro&"\n - data final inválida;"
			if IsDate(vDtIni) and IsDate(vDtFim) then
				if vDtIni > vDtFim then tx_erro = tx_erro&"\n - data final deve ser maior que a data inicial;"
			end if
		else
			if fnc_TestaVar(vCodImportador) then sql = " PE.CD_IMPORTADOR = '"& vCodImportador &"' "
			if IsDate(vDtIni) and IsDate(vDtFim) then
				if fnc_TestaVar(sql) then sql = sql &" AND "
				sql = sql&" PL.DT_LIQUIDADO BETWEEN "& fncValSQL(vDtIni, 1) &" AND "& fncValSQL(vDtFim, 1)
			end if
			vSQLqtde = ""
		end if
	end if
	'verifica se existe where para a consulta
	if fnc_TestaVar(sql) then
		if objrs.State = adStateOpen then objrs.Close
		vSQLcliente = ""
		if InStr(CODCLIENTE, Session("cd_cargo")) > 0 then
			vSQLcliente = " INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = PE.CD_CLIENTE AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
		end if
		sql = "SELECT PL.NR_FATURA_CDE, PL.NR_NF, PL.NR_LIQUIDACAO, PL.VL_LIQUIDADO, PL.DT_LIQUIDADO, PL.NR_DOCTO_CONTABIL, "&_
					"  PL.NR_NOTA_CREDITO, NF.DT_NOTA, (NF.VL_NOTA/NF.VL_TAXA) AS VL_NOTA, QF.VL_QTDE_FATURA, QN.VL_QTDE_NOTA "&_
					"FROM TPROCESSO_EXP PE (NOLOCK) "& vSQLcliente &_
					"  INNER JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PE.NR_PROCESSO) "&_
					"  INNER JOIN TPROCESSO_EXP_NF NF (NOLOCK) ON (NF.NR_PROCESSO = PE.NR_PROCESSO AND NF.NR_NF = PL.NR_NF) "&_
					"  INNER JOIN ( "&_
					"    SELECT NR_FATURA_CDE, COUNT(*) AS VL_QTDE_FATURA "&_
					"    FROM TPROCESSO_EXP_CONT_CAMB_LIQ (NOLOCK) "& vSQLqtde &_
					"    GROUP BY NR_FATURA_CDE "&_
					"  ) QF ON (QF.NR_FATURA_CDE = PL.NR_FATURA_CDE) "&_
					"  INNER JOIN ( "&_
					"    SELECT NR_NF, NR_FATURA_CDE, COUNT(*) AS VL_QTDE_NOTA "&_
					"    FROM TPROCESSO_EXP_CONT_CAMB_LIQ (NOLOCK) "& vSQLqtde &_
					"    GROUP BY NR_NF, NR_FATURA_CDE "&_
					"  ) QN ON (QN.NR_FATURA_CDE = PL.NR_FATURA_CDE AND QN.NR_NF = PL.NR_NF) "&_
					"WHERE "& sql &_
					"ORDER BY RIGHT('000000000000000'+PL.NR_FATURA_CDE, 15), PL.NR_NF, PL.NR_LIQUIDACAO ASC"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
    objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	end if
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<style type="text/css">
<!--
.edtDisabled {
	background-color:#DDDDDD;
	border:solid 1px #333333;
	color:#000000;
	font-size:12px;
	height:18px;
	padding:2px;
	text-transform:uppercase;
	width:140px;
}
-->
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
	<tr height="<%= Application("vl_width_header")%>" valign="top">
		<td colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr height="75">
		<td width="250" valign="top" rowspan="2"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td><div id="dv_corpo" class="divMainTop">
		<td width="100%" valign="top" bgcolor="#FCFCFC" style="border: 1px #CCCCCC solid;">
        <table border="0" cellpadding="0" cellspacing="5" align="center">
			<form name="frmLiquidado" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=visualizar" method="post">
				<tr height="30">
					<td colspan="4" class="titulo">..::: Faturas Liquidadas :::..</td>
				</tr>
				<tr>
					<td><label class="label" for="edtCodImportador">Importador</label><br><nobr>
						<input name="edtCodImportador" type="text" class="editbox" id="edtCodImportador" style="width: 40px;" tabindex="1" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmImportador');" maxlength="5">
						<input type="text" name="edtNmImportador" readonly class='edtDisabled'>
						<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLineSQL(6,'Código,Descrição,Apelido,Endereço,Cód. SAP','CD_EMPRESA','edtCodImportador','');"></nobr></td>
					<td><label class="label" for="edtDtIni">Dt. Inicial:</label><br><nobr>
						<input name="edtDtIni" type="text" class="editbox" id="edtDtIni" style="width: 80px;" tabindex="2" onKeyPress="return(MascaraData(this,'/',event));">
						<img id="btnDtIni" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></nobr></td>
					<td><label class="label" for="edtDtFim">Dt. Final:</label><br><nobr>
						<input name="edtDtFim" type="text" class="editbox" id="edtDtFim" style="width: 80px;" tabindex="3" onKeyPress="return(MascaraData(this,'/',event));">
						<img id="btnDtFim" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></nobr></td>
					<td><input name="btnVisualizar" type="submit" class="button" value="Visualizar" tabindex="4" style="width:75px"></td>
				</tr>
			</form></table></td>
	</tr>
	<tr>
		<td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="divCorpo" class="formClass">
				<%
if objrs.State = adStateOpen then
%>
				<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#336699" style="padding: 2px 3px 0px 2px;">
					<tr height="20">
						<td class="gridtit" rowspan="2">Nr. Invoice</td>
						<td class="gridtit" colspan="3">Nota Fiscal de Saída</td>
						<td class="gridtit" colspan="6">Liquidação</td>
						<!--<td class="gridtit" rowspan="2">Contratos e Valor Vinculado</td>-->
					</tr>
					<tr height="25">
						<td class="gridtit">Número</td>
						<td class="gridtit">Valor</td>
						<td class="gridtit">Data</td>
						<td class="gridtit">Número</td>
						<td class="gridtit">Data</td>
						<td class="gridtit">Valor</td>
						<td class="gridtit">Docto.</td>
						<td class="gridtit">Crédito</td>
						<td class="gridtit">Saldo</td>
					</tr>
					<%
	if objrs.RecordCount > 0 then
		vNrFatura = ""
		vNrNota = ""
		do while not objrs.Eof
			vTxHtml = ""
%>
					<tr height="15" bgcolor="#FFFFFF" align="center" valign="top">
					<%
			'verfica se a fatura anterior é diferente da atual, se for exibe na tela
			if vNrFatura <> objrs.Fields.Item("NR_FATURA_CDE").Value then
				'seleciona os contratos vinculados a fatura
				sql = "SELECT NR_CONT_CAMB, VL_VINCULADO FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
							"WHERE NR_FATURA_CDE = '"&objrs.Fields.Item("NR_FATURA_CDE").Value&"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				vTxHtml = "<td rowspan="& objrs.Fields.Item("VL_QTDE_FATURA").Value &"><table width='100%' border=0 cellpadding=0 cellspacing=0>"
				do while not objrs.Eof
					vTxHtml = vTxHtml&"<tr><td>"&objrsx.Fields.Item("NR_CONT_CAMB").Value&"</td>"&_
						"<td align='right'>"&FormatNumber(objrsx.Fields.Item("VL_VINCULADO").Value, 2)&"</td></tr>"
					objrsx.MoveNext
					if objrsx.Eof then exit do
				loop
				objrsx.Close
				vTxHtml = vTxHtml&"</table></td>"
%>
						<td rowspan="<%= objrs.Fields.Item("VL_QTDE_FATURA").Value%>"><%= objrs.Fields.Item("NR_FATURA_CDE").Value%></td>
						<%
			end if
			vNrFatura = objrs.Fields.Item("NR_FATURA_CDE").Value
			'verfica se a nota anterior é diferente da atual, se for exibe na tela
			if vNrNota <> objrs.Fields.Item("NR_NF").Value then
				vVlNota = objrs.Fields.Item("VL_NOTA").Value
				vVlTotal = 0
%>
						<td rowspan="<%= objrs.Fields.Item("VL_QTDE_NOTA").Value%>"><%= objrs.Fields.Item("NR_NF").Value%></td>
						<td rowspan="<%= objrs.Fields.Item("VL_QTDE_NOTA").Value%>" align="right"><%= FormatNumber(vVlNota, 2)%></td>
						<td rowspan="<%= objrs.Fields.Item("VL_QTDE_NOTA").Value%>"><%= fnc_Mascara(objrs.Fields.Item("DT_NOTA").Value, 5)%></td>
						<%
			end if
			vNrNota = objrs.Fields.Item("NR_NF").Value
			'verifica se o valor liquidado é crédito 
			if fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value) then
				vVlCred = objrs.Fields.Item("VL_LIQUIDADO").Value
				vVlPago = 0
			else
				vVlCred = 0
				vVlPago = objrs.Fields.Item("VL_LIQUIDADO").Value
			end if
			vVlTotal = vVlTotal + objrs.Fields.Item("VL_LIQUIDADO").Value
			vVlSaldo = Abs(vVlNota - vVlTotal)
%>
						<td><%= fnc_AddZeros(objrs.Fields.Item("NR_LIQUIDACAO").Value, 3)%></td>
						<td><%= fnc_Mascara(objrs.Fields.Item("DT_LIQUIDADO").Value, 5)%></td>
						<td align="right"><%= FormatNumber(vVlPago, 2)%></td>
						<td><%= objrs.Fields.Item("NR_DOCTO_CONTABIL").Value%></td>
						<td align="right"><%= FormatNumber(vVlCred, 2)%></td>
						<td align="right"><%= FormatNumber(vVlSaldo, 2)%></td>
						<%'= vTxHtml%>
					</tr>
					<%
			objrs.MoveNext
			if objrs.Eof then Exit Do
		loop
		if objrs.RecordCount > 1 then
			vTxHTML = "Foram encontrados "&objrs.RecordCount&" registros de liquidação."
		else
			vTxHTML = "Uma liquidação encontrada."
		end if
	else
		vTxHTML = "Não foram encontradas liquidações para os filtros utilizados."
	end if
	objrs.Close
%>
			<tr height='16' class='gridtit'>
				<td colspan='10' align='left'>&nbsp;<%= vTxHTML%></td>
			</tr>
		</table>
		<%
end if
%>
			</div>
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
<script language="javascript" type="text/javascript">
<!--
<%if vTpAcao = "visualizar" then%>
with (document.frmLiquidado) {
	edtCodImportador.value = '<%= vCodImportador%>';
	edtDtIni.value = '<%= vDtIni%>';
	edtDtFim.value = '<%= vDtFim%>';
	edtCodImportador.focus();
}
<%end if%>
Calendar.setup({inputField:"edtDtIni",button:"btnDtIni"});
Calendar.setup({inputField:"edtDtFim",button:"btnDtFim"});
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->