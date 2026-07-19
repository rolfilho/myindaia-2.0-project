// JavaScript Document
// Função para iniciarmos o Ajax no browser do cliente.
function ExibeListaRap(vDiv, vTpExibe, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		document.getElementById('pNrRap').value = '';
		document.getElementById('pNrCDE').value = '';
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","/embarque/integra_rap_lista.asp?"+vFeatures+"&pNrRap="+pesqNrRap+"&pNrCDE="+pesqNrCDE+"&vTpExibe="+vTpExibe, true); 
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
		ajax.open("GET","/embarque/integra_rap_pack.asp?"+vFeatures, true); 
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