<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Controle de Contratos de Câmbio Exportação
'Autor: Alexandre Neto
'Data: 09/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
tx_erro = Request.QueryString("tx_erro")
nm_tela = "Exportação >> Contrato de Câmbio >> Cadastro"

dim vTpAcao : vTpAcao = Trim(Request("vTpAcao")) 
dim vTpStatus : vTpStatus = Trim(Request("vTpStatus"))
dim vNrContrato : vNrContrato = Trim(Request("vNrContrato"))
dim vNrBanco : vNrBanco = Trim(Request("vNrBanco"))
dim vNrBancoCred, vCodExportador, vCodCorretora, vCodMoedaCont, vTxFaturas, vInCambioPronto
dim vDtFechamento, vDtAdiantamento, vDtVenctoLiq, vDtVenctoDoc
dim vVlContrato, vVlProjecao, vVlTaxaCambio, vVlTaxaJuros, vVlComissaoAg

if not fnc_TestaVar(vTpAcao) then vTpAcao = "listar"
if not fnc_TestaVar(vTpStatus) then vTpStatus = 1
in_show = (vTpAcao = "listar")

if (vTpAcao = "editar") or (vTpAcao = "salvar") or (vTpAcao = "visualizar") then
	'verifica se está incluindo ou alterando o rap
	if (Request.Form <> "") and (vTpAcao="salvar") then
		vNrContrato     = Request.Form("edtNrContrato")
		vNrBanco        = Request.Form("edtNrBanco")
		vNrBancoCred    = Request.Form("edtNrBancoCred")
		vCodExportador  = Request.Form("edtCodExportador")
		vCodMoedaCont   = Request.Form("edtCodMoedaCont")
		vDtFechamento   = Request.Form("edtDtFechamento")
		vDtAdiantamento = Request.Form("edtDtAdiantamento")
		vDtVenctoLiq    = Request.Form("edtDtVenctoLiq")
		vDtVenctoDoc    = Request.Form("edtDtVenctoDoc")
		vVlContrato     = Request.Form("edtVlContrato")
		vVlTaxaCambio   = Request.Form("edtVlTaxaCambio")
		vVlTaxaJuros    = Request.Form("edtVlTaxaJuros")
		vVlComissaoAg   = Request.Form("edtVlComissaoAg")
		vTxFaturas      = Request.Form("edtTxFaturas")
		vInCambioPronto = Request.Form("rdgInCambioPronto")
		'verifica se já existe o contrato
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT COUNT(*) FROM TCONT_CAMB (NOLOCK) "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		if objrs.Fields.Item(0).Value > 0 then
			sql = "UPDATE TCONT_CAMB SET "&_
						"  CD_EXPORTADOR    = "&fncValSQL(vCodExportador, 0)&", "&_
						"  CD_CORRETORA     = "&fncValSQL(vCodCorretora, 0)&", "&_
						"  CD_MOEDA_NEGOC   = "&fncValSQL(vCodMoedaCont, 0)&", "&_
						"  IN_CAMBIO_PRONTO = "&fncValSQL(vInCambioPronto, 0)&", "&_
						"  TX_FATURAS       = "&fncValSQL(vTxFaturas, 2)&", "&_
						"  DT_FECHAMENTO    = "&fncValSQL(vDtFechamento, 1)&", "&_
						"  DT_ADIANTAMENTO  = "&fncValSQL(vDtAdiantamento, 1)&", "&_
						"  DT_VENC_LIQ      = "&fncValSQL(vDtVenctoLiq, 1)&", "&_
						"  DT_VENC_DOCTO    = "&fncValSQL(vDtVenctoDoc, 1)&", "&_
						"  VL_NEGOC         = "&fncValSQL(vVlContrato, 3)&", "&_
						"  VL_TAXA_CAMBIAL  = "&fncValSQL(vVlTaxaCambio, 3)&", "&_
						"  VL_TAXA_JUROS    = "&fncValSQL(vVlTaxaJuros, 3)&", "&_
						"  VL_COMISSAO_AG   = "&fncValSQL(vVlComissaoAg, 3)&", "&_
						"  NR_BANCO_CRED    = "&fncValSQL(vNrBancoCred, 0)&" "&_
						"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
		else
			sql = "INSERT INTO TCONT_CAMB ( NR_CONT_CAMB, NR_BANCO, NR_BANCO_CRED, CD_USUARIO_CRIA, DT_CRIA_CONT, "&_
						"  CD_STATUS_CONT, CD_EXPORTADOR, CD_CORRETORA, CD_MOEDA_NEGOC, IN_CAMBIO_PRONTO, TX_FATURAS, "&_
						"  DT_FECHAMENTO, DT_ADIANTAMENTO, DT_VENC_LIQ, DT_VENC_DOCTO, "&_
						"  VL_NEGOC, VL_TAXA_CAMBIAL, VL_TAXA_JUROS, VL_COMISSAO_AG ) "&_
						"VALUES ("&fncValSQL(vNrContrato, 0)&", "&fncValSQL(vNrBanco, 0)&", "&fncValSQL(vNrBancoCred, 0)&", '"&Session("cd_usuario")&"', GETDATE(), '2', "&_
						"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodCorretora, 0)&", "&fncValSQL(vCodMoedaCont, 0)&", "&fncValSQL(vInCambioPronto, 0)&", "&fncValSQL(vTxFaturas, 2)&", "&_
						"  "&fncValSQL(vDtFechamento, 1)&", "&fncValSQL(vDtAdiantamento, 1)&", "&fncValSQL(vDtVenctoLiq, 1)&", "&fncValSQL(vDtVenctoDoc, 1)&", "&_
						"  "&fncValSQL(vVlContrato, 3)&", "&fncValSQL(vVlTaxaCambio, 3)&", "&fncValSQL(vVlTaxaJuros, 3)&", "&fncValSQL(vVlComissaoAg, 3)&" ) "
		end if
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
	end if
	if objrs.State = adStateOpen then objrs.Close()
end if

if vTpAcao = "deletar" then
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT COUNT(*) FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
				"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'verifica se existe faturas vinculadas, se não existir, exclui registro
	if objrs.Fields.Item(0).Value = 0 then
		sql = "DELETE TCONT_CAMB WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'" 
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute sql
	else
		tx_erro = "O Contrato só pode ser excluído se não existirem faturas vinculadas!"
	end if
	
	vTpAcao = "listar"       		 
	Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=listar&tx_erro="&Server.URLEncode(tx_erro))	
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" type="text/javascript">
<!--
var vCodUser = '<%= Session("cd_usuario")%>';
var vCodMenu = '<%= cd_menu%>';
var vCodSubm = '<%= cd_subm%>';
var vCodDocto = '<%= cd_docto%>';

function ValidaContrato(vDiv, vNrContrato, vNrBanco, vTpAcao) {
	//verifica se o contrato e banco estão preenchidos
	if (vNrContrato != '' && vNrBanco != '' && vTpAcao == 'novo') {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","ccvalida.asp?vTpValida=0&vNrContrato="+vNrContrato+"&vNrBanco="+vNrBanco, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vCorpo.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function ConsultaFaturas(nNrContrato, nNrBanco) {
	if (nNrContrato != '' && nNrBanco != '') {
		if (!document.frmContCambio.edtTxFaturas.disabled) {
			var vPagina = 'ccfaturas.asp?vNrContrato='+nNrContrato+'&vNrBanco='+nNrBanco;
			var vFeatures = 'top=100,left=20,width=400,height=450,resizable=no';
			window.open(vPagina, 'ConsFaturas', vFeatures);
		} else {
			alert('ATENÇÃO:\n\nPara incluir faturas o contrato tem que ser câmbio pronto.');
		}
	} else {
		alert('ATENÇÃO\n\nPara incluir faturas no câmbio pronto é necessário informar o nr. do Contrato e Banco.');
	}
}

function ExibeLiquidacao(nNrFatura, nExibir) {
	var divLiquidacao = document.getElementById('divLiquidacao');
	if (nExibir) {
		CarregaViaGet('divLiquidacao', 'liqfatura', 'vNrFatura='+nNrFatura);
		if (document.layers) getMouseLoc;     //NS
		else if (document.all) getMouseLoc(); //IE
		divLiquidacao.style.top = mouseLocation.y+40;
		divLiquidacao.style.left = mouseLocation.x+65;
		divLiquidacao.style.visibility = 'visible';
	} else {
		divLiquidacao.style.visibility = 'hidden';
	}
}

function ExibeJuros(nNrContrato, nNrBanco, nExibir) {
	var divJuros = document.getElementById('divJuros');
	if (nExibir) {
		CarregaViaGet('divJuros', 'ccjuros', 'vNrContrato='+nNrContrato+'&vNrBanco='+nNrBanco);
		if (document.layers) getMouseLoc;     //NS
		else if (document.all) getMouseLoc(); //IE
		divJuros.style.top = mouseLocation.y+215;
		divJuros.style.left = mouseLocation.x-100;
		divJuros.style.visibility = 'visible';
	} else {
		divJuros.style.visibility = 'hidden';
	}
}

function abreFaturasVinc(vNrContrato, vNrBanco) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 300;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	 
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=yes,status=yes";
	window.open('ccfatura.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrContrato='+vNrContrato+'&vNrBanco='+vNrBanco,"diagnostico",features);
}

function abreImpressao(vNrContrato, vNrBanco) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 700;
	var vHeight = 600;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('ccprint.asp?vNrContrato='+vNrContrato+'&vNrBanco='+vNrBanco,"imprimir",features);
}

function abreUpload(vNrContrato, vNrBanco) {	
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 210;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=no";
	window.open('ccupload.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrContrato='+vNrContrato+'&vNrBanco='+vNrBanco,"upload",features);
}

function ExecutaAcao(nTipo, nAcao) {
	//executa as ações definidas nos botões
	var vLink = 'cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=';
	if (nTipo==0) { //botão novo
		if (nAcao=='novo' || nAcao=='editar') {
			if (confirm('Tem certeza que deseja criar um novo Contrato?\nOs dados editados serão perdidos!')) { document.location=vLink+'novo';			}
		} else { document.location=vLink+'novo'; }
	}
	if (nTipo==2) { //botão cancelar
		if (nAcao=='novo' || nAcao=='editar') {
			PreencheForm();
			if (nAcao=='novo') document.location=vLink+'listar';
		}
	}
	if (nTipo==3) { //botão excluir
		if (nAcao=='novo') {
			alert('Esta instrução ainda não foi criada, utilize o botão cancelar!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar vizualizando o contrato ou utilizar o comando na coluna "Excluir"!')}
			else {
				if (confirm('Tem certeza em excluir esse contrato?!')) {
					document.location=vLink+'deletar&vNrContrato=<%'= %>';
				}
			}
		}
	}
	if (nTipo==5) { //botão imprimir
		if (nAcao=='novo') {
			alert('Este Contrato deve ser salvo para ser impresso!');
		} else {
			if (nAcao=='listar') {
				alert('Você deve estar vizualizando o contrato para imprimir!');
			} else {
				abreImpressao('<%= vNrContrato%>', '<%= vNrBanco%>');
			}
		}
	}
	if (nTipo==6) { //botão upload
		if (nAcao=='listar') {
			alert('Você deve estar vizualizando o contrato para realizar o upload!');
		} else {
			abreUpload('<%= vNrContrato%>', '<%= vNrBanco%>');
		}
	}
	if (nTipo==7) { //botão listar
		document.location=vLink+'listar';
	}
}

function CambioPronto(vRadio) {
	with (document.frmContCambio) {
		edtVlComissaoAg.disabled = (vRadio.value == 0);
		edtTxFaturas.disabled    = (vRadio.value == 0);
	}
}

function ValidaForm(vForm, vTpAcao) {
	var txErro = new String;
	var vValue;
	if (vTpAcao=='novo' || vTpAcao=='editar' || vTpAcao=='salvar') {
		with (vForm) {
			//verificação do nr de contrato e banco
			if (vTpAcao=='novo') {
				if (edtNrContrato.value == '' || edtNrBanco.value == '') {
					if (edtNrContrato.value == '') txErro += '\nO Nr. do CONTRATO deve ser informado!';
					if (edtNrBanco.value    == '') txErro += '\nO Nr. do BANCO deve ser informado!';
				} else {
					if (vNrContrato.value != '' && vNrBanco.value != '') {
						txErro += '\nJá existe um Nr. de CONTRATO cadastrado para o banco informado!';
					}
				}
			}
		}
		//verifica se ocorreram erros, se não exibe faturas a serem liquidadas.
		if (txErro.length > 0) {
			alert('Verifique os erros abaixo:'+txErro);
			return false;
		}
	} else {
		alert('ATENÇÃO:\n\nModo de edição não esta habilitado!\nPor favor selecione um contrato de câmbio.');
		return false;
	}
	return true;
}
-->
</script>
<style type="text/css">
<!--
.edtDisabled {
	background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
#divLiquidacao {
	position:absolute;
	width:393px;
	height:180px;
	z-index:2;
	visibility: hidden;
	overflow:auto;
	border:2px solid #666666;
}
#divJuros {
	position:absolute;
	width:200px;
	z-index:2;
	visibility: hidden;
	overflow:auto;
	border:2px solid #666666;
}
-->
</style>
</head>

<body onLoad="<% if vTpAcao <> "listar" then%>PreencheForm();<% End If %>">
<div id="divLiquidacao"></div>
<div id="divJuros"></div>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
	<form name="frmContCambio" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=salvar" method="post" onSubmit="return ValidaForm(this,'<%= vTpAcao%>');">
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
			</td>
			<td width="100%" valign="top" bgcolor="#FCFCFC" style="border: 1px #CCCCCC solid;"><table width="100%" border="0" cellpadding="0" cellspacing="1">
					<tr height="30">
						<td colspan="8" class="titulo">..::: Contratos de Câmbio :::..</td>
					</tr>
					<tr height="40" align="center">
						<td width="45"><img name="btnNovo" src="/imagens/icones/32x32/btn_novo.jpg" class="btnImagem" alt="Novo Contrato" onClick="ExecutaAcao(0,'<%= vTpAcao%>');"></td>
						<td width="45"><input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Salvar Edição" value="Submit"></td>
						<td width="45"><img name="btnCancelar" src="/imagens/icones/32x32/btn_cancelar.gif" class="btnImagem" alt="Cancelar Edição" onClick="ExecutaAcao(2,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnExcluir" src="/imagens/icones/32x32/btn_excluir.gif" class="btnImagem" alt="Excluir" onClick="ExecutaAcao(3,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnPrint" src="/imagens/icones/32x32/btn_print.gif" class="btnImagem" alt="Imprimir" onClick="ExecutaAcao(5,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnLista" src="/imagens/icones/32x32/btn_listar.gif" class="btnImagem" alt="Listar Contratos" onClick="ExecutaAcao(7,'<%= vTpAcao%>');"></td>
						<td width="45"><img name="btnUpload" src="/imagens/icones/32x32/btn_upload.gif" class="btnImagem" alt="Upload de Arquivo" onClick="ExecutaAcao(6,'<%= vTpAcao%>');"></td>
						<td width="60%">&nbsp;</td>
					</tr>
					<%
if vTpAcao = "listar" then
%>
					<tr height="25">
						<td colspan="11" style="border-top: 1px solid #CCCCCC; padding: 5px 0px 0px 0px;">&nbsp;<b>Exibir contratos:</b>
							<select name="cmbExibeCont" id="cmbExibeCont" class="select" style="width:100px;" onChange="CarregaViaGet('divCorpo', 'cclista', 'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vTpStatus='+this.options[this.selectedIndex].value);">
								<option value="5"></option>
								<option value="2">Disponíveis</option>
								<option value="3">Embarcadas</option>
								<option value="4">Liquidadas</option>
							</select></td>
					</tr>
					<%
else
%>
					<tr height="25">
						<td colspan="11" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Cadastro de Contrato de Câmbio</b></td>
					</tr>
					<%
end if

vl_heigth = 22
%>
				</table></td>
		</tr>
		<tr>
			<td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
				<div id="divCorpo" class="formClass">
					<%
if vTpAcao <> "listar" then
	if vTpAcao = "novo" then
		vNrContrato     = ""
		vNrBanco        = ""
		vCodExportador  = ""
		vCodMoedaCont   = ""
		vDtFechamento   = ""
		vDtAdiantamento = ""
		vDtVenctoLiq    = ""
		vDtVenctoDoc    = ""
		vVlContrato     = 0
		vVlTaxaCambio   = 0
		vVlTaxaJuros    = 0
		vVlComissaoAg   = 0
		vTxFaturas      = ""
		vInCambioPronto = 0
	else
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT NR_CONT_CAMB, NR_BANCO, NR_BANCO_CRED, CD_USUARIO_CRIA, DT_CRIA_CONT, CD_STATUS_CONT, "&_
					"  CD_EXPORTADOR, CD_CORRETORA, CD_MOEDA_NEGOC, IN_CAMBIO_PRONTO, TX_FATURAS, "&_
					"  DT_FECHAMENTO, DT_ADIANTAMENTO, DT_VENC_LIQ, DT_VENC_DOCTO, "&_
					"  ISNULL(VL_NEGOC, 0) AS VL_NEGOC, ISNULL(VL_TAXA_CAMBIAL, 0) AS VL_TAXA_CAMBIAL, "&_
					"  ISNULL(VL_TAXA_JUROS, 0) AS VL_TAXA_JUROS, ISNULL(VL_COMISSAO_AG, 0) AS VL_COMISSAO_AG "&_
					"FROM TCONT_CAMB (NOLOCK) "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'define variaveis para exibição no form
		vNrContrato     = objrs.Fields.Item("NR_CONT_CAMB").Value
		vNrBanco        = objrs.Fields.Item("NR_BANCO").Value
		vNrBancoCred    = objrs.Fields.Item("NR_BANCO_CRED").Value
		vCodExportador  = objrs.Fields.Item("CD_EXPORTADOR").Value
		vCodMoedaCont   = objrs.Fields.Item("CD_MOEDA_NEGOC").Value
		vDtFechamento   = objrs.Fields.Item("DT_FECHAMENTO").Value
		vDtAdiantamento = objrs.Fields.Item("DT_ADIANTAMENTO").Value
		vDtVenctoLiq    = objrs.Fields.Item("DT_VENC_LIQ").Value
		vDtVenctoDoc    = objrs.Fields.Item("DT_VENC_DOCTO").Value
		vVlContrato     = objrs.Fields.Item("VL_NEGOC").Value
		vVlTaxaCambio   = objrs.Fields.Item("VL_TAXA_CAMBIAL").Value
		vVlTaxaJuros    = objrs.Fields.Item("VL_TAXA_JUROS").Value
		vVlComissaoAg   = objrs.Fields.Item("VL_COMISSAO_AG").Value
		vTxFaturas      = objrs.Fields.Item("TX_FATURAS").Value
		vInCambioPronto = objrs.Fields.Item("IN_CAMBIO_PRONTO").Value
		'busca o valor dos juros
		if objrsx.State = adStateOpen then objrsx.Close
		sql = "SELECT ISNULL(SUM(VL_JUROS), 0) FROM TCONT_CAMB_JUROS (NOLOCK)"&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		vVlProjecao	= objrsx.Fields.Item(0).Value + vVlContrato
	end if
%>
					<table width="750" border="0" cellspacing="0" cellpadding="0" style="padding: 0px 0px 0px 2px;">
						<col width="130">
						<col width="100">
						<col width="150">
						<col width="130">
						<col width="240">
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtNrContrato">N&ordm; do Contrato:</label></td>
							<td><input name="edtNrContrato" type="text" class="editbox" id="edtNrContrato" style="width: 100px;text-transform:uppercase;" tabindex="1" maxlength="6" onBlur="ValidaContrato('divValida',this.value,document.frmContCambio.edtNrBanco.value,'<%= vTpAcao%>');"></td>
							<td rowspan="2"><div id="divValida"></div></td>
							<td><label class="label" for="edtVlContrato">Valor do Contrato:</label></td>
							<td><input name="edtVlContrato" type="text" class="editbox" id="edtVlContrato" style="width: 100px; text-align:right;" tabindex="2" onBlur="ValidaValor(this);" onKeyPress="return(MascaraValor(this,'.',',',2,event));"></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtNrBanco">N&ordm; do Banco:</label></td>
							<td><input name="edtNrBanco" type="text" class="editbox" id="edtNrBanco" style="width: 100px;text-transform:uppercase;" tabindex="3" maxlength="8" onBlur="ValidaContrato('divValida',document.frmContCambio.edtNrContrato.value,this.value,'<%= vTpAcao%>');"></td>
							<td><label class="label" for="edtVlProjecao">Proje&ccedil;&atilde;o de Valor:</label></td>
							<td><nobr><input name="edtVlProjecao" type="text" class="editbox" id="edtVlProjecao" style="width:100px; text-align:right;" readonly>
								<img src="/imagens/icones/16x16/btn_juros.gif" width="16" height="16" border="0" alt="Visualizar juros mensal" style="cursor: hand;" align="absmiddle" onClick="ExibeJuros('<%= vNrContrato%>', '<%= vNrBanco%>', true)"></nobr></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtCodExportador">Exportador:</label></td>
							<td colspan="2"><nobr>
								<input name="edtCodExportador" type="text" class="editbox" id="edtCodExportador" style="width: 40px;" tabindex="4" onBlur="FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmExportador');" maxlength="5">
								<input type='text' name='edtNmExportador' class='edtDisabled' readonly>
								<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(4,'Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','edtCodExportador','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','','edtCodExportador');"
	end if
%>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></nobr></td>
							<td><label class="label" for="edtCodMoedaCont">Moeda do Contrato:</label></td>
							<td><nobr>
								<input name="edtCodMoedaCont" type="text" class="editbox" id="edtCodMoedaCont" style="width: 40px;" tabindex="5" onBlur="FastLookup('TMOEDA_BROKER','CD_MOEDA','NM_MOEDA',this,'edtNmMoedaCont');" maxlength="3">
								<input type="text" name="edtNmMoedaCont" readonly class='edtDisabled'>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TMOEDA_BROKER','CD_MOEDA,NM_MOEDA','Código,Descrição','CD_MOEDA','','edtCodMoedaCont');"></nobr></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtDtFechamento">Dt. Fechamento:</label></td>
							<td colspan="2"><input name="edtDtFechamento" type="text" class="editbox" id="edtDtFechamento" style="width: 80px;" tabindex="6" onKeyPress="return(MascaraData(this,'/',event));">
								<img id="btnDtFechamento" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></td>
							<td><label class="label" for="edtDtAdiantamento">Dt. Adiantamento:</label></td>
							<td><input name="edtDtAdiantamento" type="text" class="editbox" id="edtDtAdiantamento" style="width: 80px;" tabindex="7" onKeyPress="return(MascaraData(this,'/',event));">
								<img id="btnDtAdiantamento" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtVlTaxaCambio">Taxa Cambial:</label></td>
							<td colspan="2"><input name="edtVlTaxaCambio" type="text" class="editbox" id="edtVlTaxaCambio" style="width:100px; text-align:right;" tabindex="8" onBlur="ValidaValor(this);" onKeyPress="return(MascaraValor(this,'.',',',4,event));"></td>
							<td><label class="label" for="edtVlTaxaJuros">Taxa de Juros:</label></td>
							<td><input name="edtVlTaxaJuros" type="text" class="editbox" id="edtVlTaxaJuros" style="width:100px; text-align:right;" tabindex="9" onBlur="ValidaValor(this);" onKeyPress="return(MascaraValor(this,'.',',',2,event));"></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtDtVenctoLiq">Vencto. da Liquida&ccedil;&atilde;o:</label></td>
							<td colspan="2"><input name="edtDtVenctoLiq" type="text" class="editbox" id="edtDtVenctoLiq" style="width: 80px;" tabindex="10" onKeyPress="return(MascaraData(this,'/',event));">
								<img id="btnDtVenctoLiq" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></td>
							<td><label class="label" for="edtDtVenctoDoc">Vencto. dos Doctos.:</label></td>
							<td><input name="edtDtVenctoDoc" type="text" class="editbox" id="edtDtVenctoDoc" style="width: 80px;" tabindex="11" onKeyPress="return(MascaraData(this,'/',event));">
								<img id="btnDtVenctoDoc" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="cde">C&acirc;mbio Pronto:</label></td>
							<td colspan="2"><input name="rdgInCambioPronto" type="radio" id="nao0" tabindex="12" value="0" onClick="CambioPronto(this);">
								<label class="label" for="nao0">N&atilde;o</label>

								<input name="rdgInCambioPronto" type="radio" id="sim0" value="1" onClick="CambioPronto(this);">
								<label class="label" for="sim0">Sim</label></td>
							<td><label class="label" for="edtNrBancoCred">Banco de Crédito:</label></td>
							<td><input name="edtNrBancoCred" type="text" class="editbox" id="edtNrBancoCred" style="width: 100px;text-transform:uppercase;" tabindex="13" maxlength="8"></td>
						</tr>
						<tr height="<%= vl_heigth%>">
							<td><label class="label" for="edtVlComissaoAg">Comiss&atilde;o do Agente:</label></td>
							<td colspan="2"><input name="edtVlComissaoAg" type="text" class="editbox" id="edtVlComissaoAg" style="width:100px; text-align:right;" tabindex="14" onBlur="ValidaValor(this);" onKeyPress="return(MascaraValor(this,'.',',',2,event));" disabled></td>
							<td><label class="label" for="edtTxFaturas">Faturas:</label></td>
							<td><input name="edtTxFaturas" type="text" class="editbox" id="edtTxFaturas" style="width: 214px;text-transform:uppercase;" tabindex="15" onKeyUp="ApenasNumero(this,'/;');" maxlength="255" readonly>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consultar Faturas" style="cursor: hand;" align="absmiddle" onClick="ConsultaFaturas('<%= vNrContrato%>','<%= vNrBanco%>');"></td>
						</tr>
					</table>
					<%
	'exibe as faturas vinculadas desse contrato
	if objrs.State = adStateOpen then objrs.Close()
  sql = "SELECT PC.NR_FATURA_CDE, ISNULL(PC.VL_VINCULADO, 0) AS VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, "&_
			"  ISNULL(SUM(PL.VL_LIQUIDADO), 0) AS VL_LIQUIDADO, ISNULL(EE.NM_EMPRESA, '') AS NM_IMPORTADOR "&_
			"FROM TCONT_CAMB CC (NOLOCK) "&_
			"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PC (NOLOCK) ON (PC.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PC.NR_BANCO = CC.NR_BANCO) "&_
			"  INNER JOIN ( "&_
			"    SELECT NR_PROCESSO, NR_FATURA_CDE, ISNULL(SUM(VL_VINCULADO), 0) AS VL_TOTAL_VINC "&_
			"    FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
			"    GROUP BY NR_PROCESSO, NR_FATURA_CDE "&_
			"  ) PT ON (PT.NR_PROCESSO = PC.NR_PROCESSO AND PT.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
			"  LEFT JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PC.NR_PROCESSO AND PL.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
			"  INNER JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PC.NR_PROCESSO) "&_
			"  INNER JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = PE.CD_IMPORTADOR)  "&_
			"WHERE CC.NR_CONT_CAMB = '"&vNrContrato&"' AND CC.NR_BANCO = '"&vNrBanco&"' "&_
			"GROUP BY PC.NR_FATURA_CDE, PC.VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, EE.NM_EMPRESA"
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
	if objrs.RecordCount > 0 then 
%>
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr height="25">
							<td style="font-size:12px">Faturas Vinculadas ao Contrato</td>
							<td align="right"><table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="15" bgcolor="#FFFFFF" style="border: #000000 1px solid;">&nbsp;</td>
										<td width="75"><b>&nbsp;em aberto</b></td>
										<td width="15" bgcolor="#DDFFDD" style="border: #006600 1px solid;">&nbsp;</td>
										<td width="55"><b>&nbsp;parcial</b></td>
										<td width="15" bgcolor="#CCFFFF" style="border: #0000FF 1px solid;">&nbsp;</td>
										<td width="60"><b>&nbsp;liquidada</b></td>
									</tr>
								</table></td>
						</tr>
					</table>					
					<table width="750" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
						<col width="70">
						<col width="70">
						<col width="200">
						<col width="70">
						<tr height="18">
							<td class="gridtit">&nbsp;Nr. Fatura</td>
							<td class="gridtit">&nbsp;Dt. Vinculação</td>
							<td class="gridtit">&nbsp;Importador/Cliente</td>
							<td class="gridtit">&nbsp;Valor Vinculado</td>
						</tr>
						<%
		'lista faturas vinculadas aos contratos
		do while not objrs.Eof
			'verifica a situação da fatura
			if objrs.Fields.Item("VL_LIQUIDADO").Value = 0 then
				bgcolor = "#FFFFFF" 'em aberto
			elseif objrs.Fields.Item("VL_LIQUIDADO").Value < objrs.Fields.Item("VL_TOTAL_VINC").Value then
				bgcolor = "#DDFFDD" 'parcial
			else
				bgcolor = "#CCFFFF" 'liquidada
			end if
			'verifica se a fatura está presente em mais de um contrato
			dim vTxIcones : vTxIcones = ""
			if objrs.Fields.Item("VL_TOTAL_VINC").Value > objrs.Fields.Item("VL_VINCULADO").Value then
				if objrsx.State = adStateOpen then objrsx.Close
				sql = "SELECT NR_CONT_CAMB, NR_BANCO FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
							"WHERE NR_FATURA_CDE = '"& objrs.Fields.Item("NR_FATURA_CDE").Value &"'"&_
							"  AND (NR_CONT_CAMB <> '"&vNrContrato&"' OR NR_BANCO <> '"&vNrBanco&"')"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'caso esteja, exibe pequenos icones ao lado da fatura para cada contrato
				if objrsx.RecordCount > 0 then
					do while not objrsx.Eof
						x = objrsx.Fields.Item("NR_CONT_CAMB").Value
						y = objrsx.Fields.Item("NR_BANCO").Value
						vTxIcones = vTxIcones&"<img src='/imagens/icones/btn_ver_outro.gif' width=9 height=11 border=0 align=absmiddle style=""cursor: hand;"" "&_
							"alt='Ver contrato "&x&"/banco "&y&"' onclick=""document.location='faturacc.asp?vNrContrato="&x&"&vNrBanco="&y&"'""></a>"
						objrsx.MoveNext
						if not objrsx.Eof then vTxIcones = vTxIcones&" "
					loop
				end if
				objrsx.Close()
			end if
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
							<td style="padding-left:3px;"><a href="#" title="clique para visualizar as liquidações." onClick="ExibeLiquidacao('<%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%>', true);"><%= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)%></a>&nbsp;<%'= vTxIcones%></td>
							<td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_VINCULADO").Value, 5)%>&nbsp;</td>
							<td style="padding-left:3px;"><%= objrs.Fields.Item("NM_IMPORTADOR").Value%></td>
							<td align="right"><%= FormatNumber(objrs.Fields.Item("VL_VINCULADO").Value, 2)%>&nbsp;</td>
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
end if
%>
				</div>
				<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
		</tr>
		<tr>
			<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
				<!--#include virtual="/includes/lay_bottom.asp" -->
				<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
			</td>
		</tr>
	</form>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
<%if vTpAcao = "listar" then%>
var vTpStatus = document.frmContCambio.cmbExibeCont.options[document.frmContCambio.cmbExibeCont.selectedIndex].value
CarregaViaGet('divCorpo', 'cclista', 'cd_menu='+vCodMenu+'&cd_subm='+vCodSubm+'&cd_docto='+vCodDocto+'&vTpStatus='+vTpStatus);
<%else%>
function PreencheForm() {
	// trazer os selecionados
	document.frmContCambio.onReset;
	with (document.frmContCambio) {
		edtNrContrato.value     = '<%= vNrContrato%>';
		edtNrBanco.value        = '<%= vNrBanco%>';
		edtNrBancoCred.value    = '<%= vNrBancoCred%>';
		edtCodExportador.value  = '<%= vCodExportador%>';
		edtCodMoedaCont.value   = '<%= vCodMoedaCont%>';
		edtDtFechamento.value   = '<%= vDtFechamento%>';
		edtDtAdiantamento.value = '<%= vDtAdiantamento%>';
		edtDtVenctoLiq.value    = '<%= vDtVenctoLiq%>';
		edtDtVenctoDoc.value    = '<%= vDtVenctoDoc%>';
		edtVlContrato.value     = '<%= FormatNumber(vVlContrato, 2)%>';
		edtVlProjecao.value     = '<%= FormatNumber(vVlProjecao, 2)%>';
		edtVlTaxaCambio.value   = '<%= FormatNumber(vVlTaxaCambio, 4)%>';
		edtVlTaxaJuros.value    = '<%= FormatNumber(vVlTaxaJuros, 2)%>';
		edtVlComissaoAg.value   = '<%= FormatNumber(vVlComissaoAg, 2)%>';
		edtTxFaturas.value      = '<%= vTxFaturas%>';
		//radio groups
		rdgInCambioPronto[<%=FormatNumber(vInCambioPronto, 0)%>].checked = true; 
		//simula a entrada no campo de código para executar a busca
		if (edtCodExportador.value != '') edtCodExportador.focus();
		if (edtCodMoedaCont.value  != '') edtCodMoedaCont.focus();
		CambioPronto(rdgInCambioPronto[<%=FormatNumber(vInCambioPronto, 0)%>]);
		if ('<%= vTpAcao%>' != 'novo') {
			edtNrContrato.readonly = true;
			edtNrBanco.readonly    = true;
		}
		edtNrContrato.focus();
	}
	Calendar.setup({inputField:"edtDtFechamento",button:"btnDtFechamento"});
	Calendar.setup({inputField:"edtDtAdiantamento",button:"btnDtAdiantamento"});
	Calendar.setup({inputField:"edtDtVenctoLiq",button:"btnDtVenctoLiq"});
	Calendar.setup({inputField:"edtDtVenctoDoc",button:"btnDtVenctoDoc"});
}
<%
end if
%>
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->