<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Liquidação de Contratos de Câmbio Exportação
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
nm_tela = "Exportação >> Contrato de Câmbio >> Liquidação"
in_show = false
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
var vCodUser = '<%= Session("cd_usuario")%>';
var gCodMenu = '<%= cd_menu%>';
var gCodSubm = '<%= cd_subm%>';
var gCodDocto = '<%= cd_docto%>';
var gVlPago = 0

function ConsultaFaturas(nCodImportador) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 550;
	var vHeight = 450;
	var vTop    = (y-vHeight)/2;
	var vLeft   = (x-vWidth)/2;
	
	var vPagina = 'ccfaturas.asp?vCodImportador='+nCodImportador;
	var vFeatures = 'top='+vTop+',left='+vLeft+',width='+vWidth+',height='+vHeight+',resizable=no';
	window.open(vPagina, 'ConsFaturas', vFeatures);
}

function ExibeFaturas(nExibir) {
	var txErro = new String;
	with (document.frmContLiquida) {
		if (nExibir) {
			if ((edtCodImportador.value == '') && (edtTxFaturas.value == '')) {
				txErro += '\nPara iniciar a liquidação deve ser informado o importador ou a(s) fatura(s)!';
			} else {
				if (edtCodImportador.value != '' && edtNmImportador.value == '') {
					txErro += '\nO importador informado não é válido!';
				}
				if (edtVlPago.value == '') {
					txErro += '\nVocê deve informar o valor para liquidar faturas!';
				} else {
					var vValue = parseFloat(edtVlPago.value);
					if (vValue == 0) txErro += '\nO valor pago não pode ser igual a zero!';
				}
			}
			//verifica se ocorreram erros, se não exibe faturas a serem liquidadas.
			if (txErro.length > 0) {
				alert('Verifique os erros abaixo:'+txErro);
				edtCodImportador.focus();
			} else {
				edtCodImportador.readOnly = true;
				edtVlPago.readOnly = true;
				edtVlTotal.value = '0,00';
				edtVlSaldo.value = edtVlPago.value;
				btnVisualizar.disabled = true;
				CarregaViaGet('divCorpo','liqfaturas','cd_menu='+gCodMenu+'&cd_subm='+gCodSubm+'&cd_docto='+gCodDocto+
					'&edtCodImportador='+edtCodImportador.value+'&edtTxFaturas='+edtTxFaturas.value);
			}
		}
		else {
			document.getElementById('divCorpo').innerHTML = '';
			btnVisualizar.disabled = false;
			edtVlPago.readOnly = false;
			edtVlPago.value = '0,00';
			edtVlTotal.value = '0,00';
			edtVlSaldo.value = '0,00';
			edtCodImportador.readOnly = false;
			edtCodImportador.value = '';
			edtCodImportador.focus();
			edtNmImportador.value = '';
		}
	}
}

function ExibeNotaFiscal(nCheckBox) {
	var tdFatura = document.getElementById('tdFatura'+nCheckBox.value);
	var vNrProcesso = document.getElementById('hdnNrProcesso'+nCheckBox.value).value;
	var vNrFatura = document.getElementById('hdnNrFatura'+nCheckBox.value).value;
	//verifica o check, se é para exibir ou ocultar 
	if (nCheckBox.checked) {  //exibe
		CarregaViaGet(tdFatura.id, 'liqnotas', 'vNrProcesso='+vNrProcesso+'&vNrFatura='+vNrFatura);
		tdFatura.style.display = '';
	} else {                  //oculta
		CalculaLiquidacao(false);
		tdFatura.innerHTML = '';
		tdFatura.style.display = 'none';
	}
	document.getElementById('edtVlTotalLiq'+nCheckBox.value).value = '0,00';
}

function CriaNotaCredito(nNrFatura, nNrNota, nId) {
	var chkInCredito = document.getElementById('chkInCredito'+nNrFatura+nNrNota+'_'+nId);
	var vVlSaldo = document.getElementById('hdnVlSaldo'+nNrFatura+nNrNota+'_'+nId).value;
	var vVlPago = document.getElementById('edtVlPago'+nNrFatura+nNrNota+'_'+nId).value;
	//verifica se a linha já é nota de credito
	if (chkInCredito.checked && vVlSaldo == vVlPago) {
		alert("ATENÇÃO:\n\nO valor total da nota já esta selecionado!\n"+
			"Não é possível cria uma nova linha para esat nota.");
	}
	else {
		var trNota = document.getElementById('trNota'+nNrFatura+nNrNota+'_'+nId);
		var tdNota = document.getElementById('tdNota'+nNrFatura+nNrNota+'_'+nId);
		var vVlNota = document.getElementById('tdVlNota'+nNrFatura+nNrNota+'_'+nId).innerHTML;
		var vDtNota = document.getElementById('tdDtNota'+nNrFatura+nNrNota+'_'+nId).innerHTML;
		trNota.style.display = '';
		vVlSaldo = ConverteParaNumero(vVlSaldo);
		vVlPago = ConverteParaNumero(vVlPago);
		vVlSaldo -= vVlPago;
		CarregaViaGet(tdNota.id, 'liqcredito', 'vNrFatura='+nNrFatura+'&vNrNota='+nNrNota+'&vId='+nId+'&vVlSaldo='+vVlSaldo+'&vVlNota='+vVlNota+'&vDtNota='+vDtNota);
		CalculaLiquidacao(false);
	}
}

function AtivaNotaCredito(nNrFatura, nNrNota, nId) {
	var chkInNota = document.getElementById('chkInNota'+nNrFatura+nNrNota+'_'+nId);
	var edtNrDoctoCont = document.getElementById('edtNrDoctoCont'+nNrFatura+nNrNota+'_'+nId);
	var chkInCredito = document.getElementById('chkInCredito'+nNrFatura+nNrNota+'_'+nId);
	var edtNrNotaCred = document.getElementById('edtNrNotaCred'+nNrFatura+nNrNota+'_'+nId);
	
	if (chkInCredito.checked) {
		chkInNota.checked = true;
		edtNrDoctoCont.value = '';
		edtNrNotaCred.readOnly = false;
		edtNrNotaCred.value = '';
	}
	else {
		edtNrDoctoCont = document.getElementById('hdnNrDoctoCont'+nNrFatura+nNrNota+'_'+nId).value;
		edtNrNotaCred.readOnly = true;
		edtNrNotaCred.value = '';
	}
	CalculaLiquidacao(false);
}

function ValidaValorPago(nNrFatura, nNrNota, nId) {
	var chkInNota = document.getElementById('chkInNota'+nNrFatura+nNrNota+'_'+nId);
	var hdnVlSaldo = document.getElementById('hdnVlSaldo'+nNrFatura+nNrNota+'_'+nId);
	var edtVlPago = document.getElementById('edtVlPago'+nNrFatura+nNrNota+'_'+nId);
	var vVlSaldo = ConverteParaNumero(hdnVlSaldo.value);
	var vVlPago = ConverteParaNumero(edtVlPago.value);
	//verifica se a conversão para numero esta correta.
	if (vVlPago == null) {
		alert('ERRO:\n\nErro ao converter de texto para número o valor da nota e/ou valor a ser pago!' +
			'\nPor favor entre em contato com o suporte(<%= SUPORTEMAIL%>)');
	}
	else {
		//verifica se o valor informado é menor que o da nota
		if (vVlPago > vVlSaldo) {
			alert('O valor informado não pode ser maior que o valor à liquidar da nota fiscal!');
			edtVlPago.select();
			edtVlPago.focus();
		}
		else if (vVlPago == 0) {
			alert('O valor informado não pode ser zero!');
			edtVlPago.select();
			edtVlPago.focus();
		}
		else {
			//se não estiver checado, checa
			if (!chkInNota.checked) chkInNota.checked = true;
			//verifica se o valor pago mudou
			if (vVlPago != gVlPago) {
				var trNota = document.getElementById('trNota'+nNrFatura+nNrNota+'_'+nId);
				var tdNota = document.getElementById('tdNota'+nNrFatura+nNrNota+'_'+nId);
				var imgNovaNota = document.getElementById('imgNovaNota'+nNrFatura+nNrNota+'_'+nId);
				var tdParcial = document.getElementById('tdParcial'+nNrFatura+nNrNota+'_'+nId);
				//oculta a nota de crédito
				if (trNota.style.display == '') {
					tdNota.innerHTML = '';
					trNota.style.display = 'none';
				}
				//se o valor pago for igual ao da nota não exibe o botão
				if (vVlPago == vVlSaldo) {
					imgNovaNota.style.display = 'none';
					tdParcial.innerHTML = '&nbsp;';
				}
				else {
					imgNovaNota.style.display = '';
					tdParcial.innerHTML = '<i><b>parcial</b></i>';
				}
				CalculaLiquidacao(false);
			}
		}
	}
}

function SomaNotas(nInNota, nVlPago, nInCredito) {
	var vVlPago = 0;
	if (isNaN(nInNota.length)) {
		if (nInNota.checked && !nInCredito.checked) vVlPago = ConverteParaNumero(nVlPago.value);
	}
	else {
		for (j = 0; j < nInNota.length; j++) {
			if (nInNota[j].checked && !nInCredito[j].checked) vVlPago += ConverteParaNumero(nVlPago[j].value);
		}
	}
	return vVlPago;
}

function CalculaLiquidacao(nExibeAlerta) {
	var vVlTotal = vVlFatura = 0;
	with (document.frmContLiquida) {
		var vVlPago = ConverteParaNumero(edtVlPago.value);
		if (isNaN(chkInFatura.length)) {
			var objInNota = eval('chkInNota'+chkInFatura.value);
			var objVlPago = eval('edtVlPago'+chkInFatura.value);
			var objInCredito = eval('chkInCredito'+chkInFatura.value);
			vVlFatura = SomaNotas(objInNota, objVlPago, objInCredito);
			vVlTotal = vVlFatura;
			edtVlTotalLiq.value = vVlFatura.format(2,',','.');
		}
		else {
			for (i = 0; i < chkInFatura.length; i++) {
				if (chkInFatura[i].checked) {
					var objInNota = eval('chkInNota'+chkInFatura[i].value);
					var objVlPago = eval('edtVlPago'+chkInFatura[i].value);
					var objInCredito = eval('chkInCredito'+chkInFatura[i].value);
					vVlFatura = SomaNotas(objInNota, objVlPago, objInCredito);
					vVlTotal += vVlFatura;
					edtVlTotalLiq[i].value = vVlFatura.format(2,',','.');
				}
			}
		}
		//exibe informações de saldo e habilita/desabilita o botão para vincular
		var tdInfo = document.getElementById('tdInfo');
		var vVlSaldo = Math.round((vVlPago - vVlTotal)*100)/100;
		edtVlTotal.value = vVlTotal.format(2,',','.');
		if (vVlSaldo < 0) {
			tdInfo.innerHTML = 'Saldo: '+ edtVlSaldo.value +'; Total selecionado: <font color="#FF0000">'+ vVlTotal.format(2,',','.') +"</font>";
			if (nExibeAlerta) alert('ERRO:\n\nO total selecionado não pode ser maior que o valor a liquidar!');
			//edtVlSaldo.value = '0,00';
			btnLiquidar.disabled = true;
			return false;
		}
		if (vVlSaldo > 0) {
			tdInfo.innerHTML = 'Saldo: '+ vVlSaldo.format(2,',','.') +'; Total selecionado: <font color="#0000FF">'+vVlTotal.format(2,',','.') +"</font>";
			if (nExibeAlerta) alert('ERRO:\n\nO total selecionado é menor que o valor a liquidar!');
			edtVlSaldo.value = vVlSaldo.format(2,',','.');
			btnLiquidar.disabled = true;
			return false;
		}
		if (vVlSaldo == 0) {
			tdInfo.innerHTML = 'Saldo: 0; Total selecionado: '+vVlTotal.format(2,',','.');
			edtVlSaldo.value = '0,00';
			btnLiquidar.disabled = false;
		}
	}
	return true;
}

function ValidaDocto(object) {
	if (object.value == '') {
		var vColor = object.style.background;
		object.style.background = '#FFDDDD';
		if (object.name.indexOf('edtNrDoctoCont') != -1)
			alert('Informe o número do Documento Contábil!');
		else
			alert('Informe o número da Nota de Crédito!');
		object.style.background = vColor;
		object.focus();
		return false;
	}
	return true;
}

function ValidaNotaFiscal(nInNota, nVlSaldo, nVlPago, nNrDoctoCont, nInCredito, nNrNotaCred) {
	if (isNaN(nInNota.length)) {
		if (nInNota.checked) {
			if (!ValidaDocto(nNrDoctoCont)) return false;
			if (nInCredito.checked) {
				if (!ValidaDocto(nNrNotaCred)) return false;
			}
		}
		else {
			nInCredito.checked = false;
			nVlSaldo.disabled = true;
			nVlPago.disabled = true;
			nNrDoctoCont.disabled = true;
			nNrNotaCred.disabled = true;
		}
	}
	else {
		for (j = 0; j < nInNota.length; j++) {
			if (nInNota[j].checked) {
				if (!ValidaDocto(nNrDoctoCont[j])) return false;
				if (nInCredito[j].checked) {
					if (!ValidaDocto(nNrNotaCred[j])) return false;
				}
			}
			else {
				nInCredito[j].checked = false;
				nVlSaldo[j].disabled = true;
				nVlPago[j].disabled = true;
				nNrDoctoCont[j].disabled = true;
				nNrNotaCred[j].disabled = true;
			}
		}
	}
	return true;
}

function ValidaForm() {
	if (CalculaLiquidacao(true)) nFatCheck = 0; else return false;
	with (document.frmContLiquida) {
		if (isNaN(chkInFatura.length)) {
			if (chkInFatura.checked) {
				var objInNota = eval('chkInNota'+chkInFatura.value);
				var objVlSaldo = eval('hdnVlSaldo'+chkInFatura.value);
				var objVlPago = eval('edtVlPago'+chkInFatura.value);
				var objNrDoctoCont = eval('edtNrDoctoCont'+chkInFatura.value);
				var objInCredito = eval('chkInCredito'+chkInFatura.value);
				var objNrNotaCred = eval('edtNrNotaCred'+chkInFatura.value);
				if (!ValidaNotaFiscal(objInNota, objVlSaldo, objVlPago, objNrDoctoCont, objInCredito, objNrNotaCred)) {
					AtivaObjetos(frmContLiquida);
					return false;
				}
				nFatCheck++;
			}
		}
		else {
			//caso tenha mais de uma fatura sendo exibida em tela
			for (i = 0; i < chkInFatura.length; i++) {
				if (!chkInFatura[i].checked) continue;
				var objInNota = eval('chkInNota'+chkInFatura[i].value);
				var objVlSaldo = eval('hdnVlSaldo'+chkInFatura[i].value);
				var objVlPago = eval('edtVlPago'+chkInFatura[i].value);
				var objNrDoctoCont = eval('edtNrDoctoCont'+chkInFatura[i].value);
				var objInCredito = eval('chkInCredito'+chkInFatura[i].value);
				var objNrNotaCred = eval('edtNrNotaCred'+chkInFatura[i].value);
				if (!ValidaNotaFiscal(objInNota, objVlSaldo, objVlPago, objNrDoctoCont, objInCredito, objNrNotaCred)) {
					AtivaObjetos(frmContLiquida);
					return false;
				}
				nFatCheck++;
			}
		}
		//se nenhuma fatura for checada, envia aviso
		if (nFatCheck == 0) {
			alert('ATENÇÃO:\n\nSelecione pelo menos uma fatura para liquidar!');
			return false;
		}
		btnLiquidar.disabled = true;
	}
}

function AtivaObjetos(nForm) {
	for (i = 0; i < nForm.length; i++) {
		if (nForm.elements[i].type != 'button') nForm.elements[i].disabled = false;
  }
}
-->
</script>
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
.edtValorLiq {
	background-color:#336699;
	border-width:0px;
	color:#FFFFFF;
	font-size:9px;
	height:18px;
	padding:3px 0px 0px 0px;
	width:70px;
	font-weight:bold;
	font-style:italic;
	text-align:right;
}
.trFatura {
	color:#FFFFFF;
	font-weight:bold;
	background:#336699;
	border-width:0px;
	font-style:italic;
}
.tdNota {
	border-bottom:1px solid #336699;
	font-style:italic;
	font-weight:bold;
	padding:2px 0px 2px 3px;
}
.tdInfo {
	border:1px solid #336699;
	font-weight:bold;
	height:22px;
	padding:3px;
}
.tdParcial {
	color:#0000FF;
	font-weight:bold;
	font-style:italic;
}
.imgNota {
	width:16px;
	height:16px;
	cursor:hand;
	border-width:0px;
}
-->
</style>
</head>

<body onLoad="document.frmContLiquida.edtCodImportador.focus();document.getElementById('colunaseta').background='/imagens/seta.jpg';">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
	<form name="frmContLiquida" action="liquidado.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=salvar" method="post" onSubmit="return ValidaForm();">
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
            <table border="0" cellpadding="0" cellspacing="5">
					<tr height="30">
						<td colspan="6" class="titulo">..::: Liquidação de Faturas :::..</td>
					</tr>
					<tr>
						<td><label class="label" for="edtCodImportador">Importador</label><br><nobr>
							<input name="edtCodImportador" type="text" class="editbox" id="edtCodImportador" style="width: 40px;" tabindex="1" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmImportador');" maxlength="5">
							<input type="text" name="edtNmImportador" readonly class='edtDisabled'>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLineSQL(6,'Código,Descrição,Apelido,Endereço,Cód. SAP','CD_EMPRESA','edtCodImportador','');"></nobr></td>
						<td><label class="label" for="edtTxFaturas">Fatura</label><br><nobr>
							<input name="edtTxFaturas" type="text" class="editbox" id="edtTxFaturas" style="width: 150px;text-transform:uppercase;" onKeyUp="ApenasNumero(this,'/;');" maxlength="255" readonly>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consultar Faturas" tabindex="2" style="cursor: hand;" align="absmiddle" onClick="ConsultaFaturas(document.frmContLiquida.edtCodImportador.value);"></nobr></td>
						<td><label class="label" for="edtVlPago">Valor Liquidar</label><br>
							<input name="edtVlPago" type="text" class="editbox" id="edtVlPago" style="width: 80px; text-align:right;" tabindex="3" onBlur="ValidaValor(this);" onKeyPress="return MascaraValor(this,'.',',',2,event);"></td>
						<td><label class="label">Total Sel.</label><br>
							<input name="edtVlTotal" type="text" class="editbox" id="edtVlTotal" style="width: 60px; text-align:right;" value="0,00" readonly></td>
						<td><label class="label">Saldo</label><br>
							<input name="edtVlSaldo" type="text" class="editbox" id="edtVlSaldo" style="width: 60px; text-align:right;" value="0,00" readonly></td>
						<td><nobr><input name="btnVisualizar" type="button" class="button" value="Visualizar" tabindex="4" onClick="ExibeFaturas(true);" style="width:75px">
							<input name="btnCancelar" type="button" class="button" value="Cancelar" tabindex="5" onClick="ExibeFaturas(false);" style="width:75px"></nobr></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
				<div id="divCorpo" class="formClass"></div>
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
</div>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->