// JavaScript Document
// Função para iniciarmos o Ajax no browser do cliente.
function openAjax() {
	var ajax;
	
	try{
		ajax = new XMLHttpRequest(); // XMLHttpRequest para browsers decentes, como: Firefox, Safari, dentre outros.
	}catch(ee){
		try{
			ajax = new ActiveXObject("Msxml2.XMLHTTP"); // Para o IE da MS
		}catch(e){
			try{
				ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Para o IE da MS
			}catch(E){
				ajax = false;
			}
		}
	}
	return ajax;
}

function FastLookup(vTabela, vCampos, vReturn, vCodigo, vEdit) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
		var vCod = vCodigo.value; //código que iremos pesquisar na tabela
		vDesc.value = "";
		if (vCod != '' || vCod != undefined) {
			vCod = vCod.replace(" ","");
			if (vCod.length > 0 && vCod != 0) {
				//validamos o código para que ele tenha o tamanho certo defindo na tabela
				for (i = vCod.length; i < vCodigo.maxLength; i++)
					vCod = '0'+ String(vCod);
				vCodigo.value = vCod;
				//iniciamos a busca através do ajax
				var ajax = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax.open("GET","/popup/fast_lookup.asp?vTabela="+vTabela+"&vCampos="+vCampos+"&vReturn="+vReturn+"&vCodigo="+vCod, true); 
				ajax.onreadystatechange = function() {
					if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
						vDesc.value = "processando...";
					}
					if(ajax.readyState == 4) { //agora exibe o que interessa
						if(ajax.status == 200) {
							var vResult = ajax.responseText; //resultado da busca
							if (vResult.indexOf('erro')!=0) {
								vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
								vResult = unescape(vResult); //continua resolvendo problemas de acento
								vCodigo.style.background = 'white';
								vDesc.value = vResult;
							} else {
								alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
								vCodigo.style.background = 'red';
								vDesc.value = "";
							}
						} else {
							alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
							vDesc.value = "";
						}
					}
				}
				ajax.send(null); // submete
			} 
			else if (vCod != '') {
				alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
				vDesc.value = ""
			}
		}
	}
}

function ExibeListaRap(vDiv, vTpExibe, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		document.getElementById('pNrRap').value = '';
		document.getElementById('pNrCDE').value = '';
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/export/integra_rap_lista.asp?"+vFeatures+"&pNrRap="+pesqNrRap+"&pNrCDE="+pesqNrCDE+"&vTpExibe="+vTpExibe, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
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
		pesqNrRap = '';
		pesqNrCDE = '';
	}
}

function ExibeListaPack(vDiv, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;
		var w = 600;
		var z = 400;
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//define a posição do div e exibe na tela
		vCorpo.style.width = w;
		vCorpo.style.height = z;
		vCorpo.style.left = (x-w)/2;
		vCorpo.style.top = (y-z)/2;
		vCorpo.style.visibility = "visible";
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/export/integra_rap_pack.asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
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

function ExibeListaCont(vDiv, vTpExibe, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/export/cont_cambio_lista.asp?"+vFeatures+"&vTpExibe="+vTpExibe, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
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

function ExibeListaFatura(vDiv, vTpExibe, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/export/cont_liquida_fatura.asp?"+vFeatures+"&vTpExibe="+vTpExibe, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
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

function ExibeListaFaturaNum(vDiv, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/export/cont_liquida_fatura_num.asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
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

function ValidaContrato(vDiv, vNrContrato, vNrBanco) {
	//verifica se o contrato e banco estão preenchidos
	if (vNrContrato != '' && vNrBanco != '' && vTpAcao == 'novo') {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/includes/validacao.asp?vTpValida=0&vNrContrato="+vNrContrato+"&vNrBanco="+vNrBanco, true); 
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