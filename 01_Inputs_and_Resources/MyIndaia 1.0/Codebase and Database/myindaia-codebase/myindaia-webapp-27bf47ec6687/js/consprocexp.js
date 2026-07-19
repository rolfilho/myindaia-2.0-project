/***************************************************
Consulta de Processos
****************************************************/	

var appCPE = {
	    firstLoad: true,
		isLoading: true,
		novaPesquisa: false,
		redirected: false,		
		qtdResultAtual: 0,
		//htmlMain: document.querySelector('.main').innerHTML,
		spinner: document.querySelector('.loader'),
		cardTemplate: document.querySelector('.cardTemplate'),
		resultPesquisa: document.querySelector('.result-pesquisa'),
		container: document.querySelector('.sec-container'),
		addDialog: document.querySelector('.dialog-container'),
	  };

	  
if (window.location.toString().indexOf("consproexp") >= 0){
	
	appCPE.toggleAddDialog = function(visible) {
		if (visible) {
		  appCPE.addDialog.classList.add('dialog-container--visible');
		} else {
		  appCPE.addDialog.classList.remove('dialog-container--visible');
		}
	};

	appCPE.getProcessos = function(pedido, numero, container, ddedue, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual) {	
		var url = servidor+':'+porta+'/indaia/api/Service/ProcessosExpo';			
		appCPE.isLoading = true;
		appCPE.spinner.removeAttribute('hidden');
		
		// TODO add cache logic here
		if ('caches' in window) {
		  /*
		   * Check if the service worker has already cached this city's weather
		   * data. If the service worker has the data, then display the cached
		   * data while the app fetches the latest data.
		   */
		  caches.match(url).then(function(response) {
			if (response) {
			  response.json().then(function updateFromCache(json) {
				var results = json.query.results;
				appCPE.updateForecastCard(results);
			  });
			}
		  });
		}
		// Fetch the latest data.
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
		  if (request.readyState === XMLHttpRequest.DONE) {
			if (request.status === 200) {
			  var response = JSON.parse(request.response);
			  var results = response;//.query.results;
			  appCPE.updateForecastCard(results);
			}
		  }
		};
		
		request.open('POST', url);
		//request.setRequestHeader( 'Access-Control-Allow-Origin', '*');
		request.setRequestHeader( 'Content-Type', 'application/json' );
		
		if (localStorage._cs){
			request.setRequestHeader( 'authorization', 'Bearer '+localStorage._cs );
		}else{
			//throw new UserException("Usuário não autenticado.");
			exit;
		}

		//request.withCredentials = false;
		var obj = { Numero: numero, 
		            Pedido: pedido, 
					Container: container, 
					DDeDUe: ddedue, 
					Mercadoria: mercadoria,
					Exportador: exportador, 
					BL: bl, 
					Cliente: cliente, 
					StatusAtual: statusatual,
					QtdResultAtual: qtdResultAtual
				};

		var myJSON = JSON.stringify(obj);
		request.send(myJSON);
	  };
		  
	appCPE.updateForecastCard = function(data) {
		var idCard = 0;	
		if(data.value.length === 0){
			appCPE.container.querySelector('.alert').removeAttribute('hidden');
			appCPE.container.querySelector('.alert').textContent = strNoRecordFound();
		}else{
			appCPE.container.querySelector('.alert').setAttribute('hidden', true);

			for (var i=0;i<data.value.length;i++) {
				var id = data.value[i].$id;
				var numeroProcesso = data.value[i].Numero;
				var nomeCliente = data.value[i].NomeCliente;
				var refPadraoCliente = data.value[i].RefPadraoCliente;
				var cdViaTransporte = data.value[i].CdViaTransporte;
				
				if (parseInt(appCPE.qtdResultAtual, 0) == 0) {
					appCPE.qtdResultAtual = data.value[i].QtdProcessos;
				}

				//var card = appCPE.visibleCards[id];
				
				//if (!card) {
					var card = appCPE.cardTemplate.cloneNode(true);
					//var card = document.querySelector('.cardTemplate').cloneNode(true);
					card.classList.remove('cardTemplate');
					card.classList.add('linhaResult');

					
					card.removeAttribute('hidden');
					idCard++;
					card.querySelector('.ac-input').setAttribute('id', 'ac-'+idCard);
					card.querySelector('.ac-input').setAttribute('name', 'ac-'+idCard);				
					if (appCPE.redirected) {
						card.querySelector('.ac-input').setAttribute('checked', true);								
					}

					card.querySelector('.ac-label').setAttribute('for', 'ac-'+idCard);
					for (var j=0;j<3;j++) {
						idCard++;
						card.querySelectorAll('.ac-text .ac-sub .ac-input')[j].setAttribute('id', 'ac-'+idCard);
						card.querySelectorAll('.ac-text .ac-sub .ac-input')[j].setAttribute('name', 'ac-'+idCard);
						card.querySelectorAll('.ac-text .ac-sub .ac-label')[j].setAttribute('for', 'ac-'+idCard);
					}
					
					//Cabeçalho
					card.querySelector('.ac-label').textContent = refPadraoCliente + ' - ' + numeroProcesso + ' - ' + nomeCliente;
					
					//Timeline				
					var tempDate = new Date(data.value[i].EventosFixos.Liberacao);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.StepProgress .Liberacao').classList.remove('is-done');
					}else{
						card.querySelector('.StepProgress .Liberacao .time').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.LiberacaoPrevisto);
					if (tempDate > 0){
						card.querySelector('.StepProgress .Liberacao .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
					}


					var tempDate = new Date(data.value[i].EventosFixos.Carregamento);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.StepProgress .Carregamento').classList.remove('is-done');
					}else{
						card.querySelector('.StepProgress .Carregamento .time').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.CarregamentoPrevisto);
					if (tempDate > 0){
						card.querySelector('.StepProgress .Carregamento .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
					}


					var tempDate = new Date(data.value[i].EventosFixos.Desembaraco);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.StepProgress .Desembaraco').classList.remove('is-done');
					}else{
						card.querySelector('.StepProgress .Desembaraco .time').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.DesembaracoPrevisto);
					if (tempDate > 0){
						card.querySelector('.StepProgress .Desembaraco .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
					}


					if ((cdViaTransporte == '04') || (cdViaTransporte == '01')){ //04=Aéreo, 01=Marítimo

						card.querySelector('.StepProgress .Saida').classList.remove('hide');

						if (cdViaTransporte == '04') { 
							card.querySelector('.StepProgress .Saida .strSaidaAereo').classList.remove('hide');
						};
						if (cdViaTransporte == '01') {		
							card.querySelector('.StepProgress .Saida .strSaidaAereo').classList.remove('hide');
					    }						

						var tempDate = new Date(data.value[i].EventosFixos.Saida);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.StepProgress .Saida').classList.remove('is-done');
						}else{
							card.querySelector('.StepProgress .Saida .time').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.SaidaPrevisto);
						if (tempDate > 0){
							card.querySelector('.StepProgress .Saida .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
						}

					} else {

						card.querySelector('.StepProgress .Cruze').classList.remove('hide');
					    card.querySelector('.StepProgress .ChegadaFronteira').classList.remove('hide');


						var tempDate = new Date(data.value[i].EventosFixos.Cruze);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.StepProgress .Cruze').classList.remove('is-done');
						}else{
							card.querySelector('.StepProgress .Cruze .time').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.CruzePrevisto);
						if (tempDate > 0){
							card.querySelector('.StepProgress .Cruze .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
						}	

						var tempDate = new Date(data.value[i].EventosFixos.ChegadaFronteira);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.StepProgress .ChegadaFronteira').classList.remove('is-done');
						}else{
							card.querySelector('.StepProgress .ChegadaFronteira .time').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.ChegadaFronteiraPrevisto);
						if (tempDate > 0){
							card.querySelector('.StepProgress .ChegadaFronteira .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
						}						
					}			


					// Timeline Horizontal
					var tempDate = new Date(data.value[i].EventosFixos.Liberacao);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.timeline .Liberacao').classList.remove('complete');
					}else{
						card.querySelector('.timeline .Liberacao .timestamp .date').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.LiberacaoPrevisto);
					if (tempDate > 0){
						card.querySelector('.timeline .Liberacao .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
					}

					var tempDate = new Date(data.value[i].EventosFixos.Carregamento);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.timeline .Carregamento').classList.remove('complete');
					}else{
						card.querySelector('.timeline .Carregamento .timestamp .date').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.CarregamentoPrevisto);
					if (tempDate > 0){
						card.querySelector('.timeline .Carregamento .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
					}


					var tempDate = new Date(data.value[i].EventosFixos.Desembaraco);
					if ((tempDate <= 0) || isNaN(tempDate)){
						card.querySelector('.timeline .Desembaraco').classList.remove('complete');
					}else{
						card.querySelector('.timeline .Desembaraco .timestamp .date').textContent = dateStringLang(tempDate);
					}
					var tempDate = new Date(data.value[i].EventosFixos.DesembaracoPrevisto);
					if (tempDate > 0){
						card.querySelector('.timeline .Desembaraco .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
					}


					if ((cdViaTransporte == '04') || (cdViaTransporte == '01')){ //04=Aéreo, 01=Marítimo
						
						card.querySelector('.timeline .Saida').classList.remove('hide');
						
						if (cdViaTransporte == '04') { 
							card.querySelector('.timeline .Saida .strSaidaAereo').classList.remove('hide');
						};
						if (cdViaTransporte == '01') {		
							card.querySelector('.timeline .Saida .strSaidaAereo').classList.remove('hide');
					    }
												
					
						var tempDate = new Date(data.value[i].EventosFixos.Saida);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.timeline .Saida').classList.remove('complete');
						}else{
							card.querySelector('.timeline .Saida .timestamp .date').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.SaidaPrevisto);
						if (tempDate > 0){
							card.querySelector('.timeline .Saida .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
						}
					} else {

						card.querySelector('.timeline .Cruze').classList.remove('hide');
					    card.querySelector('.timeline .ChegadaFronteira').classList.remove('hide');


						var tempDate = new Date(data.value[i].EventosFixos.Cruze);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.timeline .Cruze').classList.remove('complete');
						}else{
							card.querySelector('.timeline .Cruze .timestamp .date').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.CruzePrevisto);
						if (tempDate > 0){
							card.querySelector('.timeline .Cruze .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.ChegadaFronteira);
						if ((tempDate <= 0) || isNaN(tempDate)){
							card.querySelector('.timeline .ChegadaFronteira').classList.remove('complete');
						}else{
							card.querySelector('.timeline .ChegadaFronteira .timestamp .date').textContent = dateStringLang(tempDate);
						}
						var tempDate = new Date(data.value[i].EventosFixos.ChegadaFronteiraPrevisto);
						if (tempDate > 0){
							card.querySelector('.timeline .ChegadaFronteira .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
						}
					}

					
					//Dados Básicos
					var dadosBasicos = card.querySelectorAll('.ac-text .ac-sub .ac-sub-text')[0];
					dadosBasicos.querySelector('.dadosBasicos .refCliente .valor').textContent = data.value[i].RefCliente;
					dadosBasicos.querySelector('.dadosBasicos .paisDestino .valor').textContent = data.value[i].PaisDestino;
					dadosBasicos.querySelector('.dadosBasicos .canal .valor').textContent = data.value[i].Canal;
					dadosBasicos.querySelector('.dadosBasicos .mercadoria .valor').textContent = data.value[i].Mercadoria;
					dadosBasicos.querySelector('.dadosBasicos .pesoBruto .valor').textContent = mascaraValor(data.value[i].PesoBruto.toFixed(2));
					dadosBasicos.querySelector('.dadosBasicos .pesoLiquido .valor').textContent = mascaraValor(data.value[i].PesoLiquido.toFixed(2));
					dadosBasicos.querySelector('.dadosBasicos .qtdConteiners .valor').textContent = data.value[i].QtdConteiners;
					/*var tempDate = new Date(data.value[i].LiberacaoProcesso);
					if (tempDate > 0)
					  dadosBasicos.querySelector('.dadosBasicos .liberacaoProcesso .valor').textContent = dateStringLang(tempDate);
					var tempDate = new Date(data.value[i].CarregamentoFabrica);
					if (tempDate > 0)
					dadosBasicos.querySelector('.dadosBasicos .carregamentoFabrica .valor').textContent = dateStringLang(tempDate);
					var tempDate = new Date(data.value[i].Desembaraco);
					if (tempDate > 0)
					dadosBasicos.querySelector('.dadosBasicos .desembaraco .valor').textContent = dateStringLang(tempDate);
					var tempDate = new Date(data.value[i].SaidaVeiculo);
					if (tempDate > 0)
					dadosBasicos.querySelector('.dadosBasicos .saidaVeiculo .valor').textContent = dateStringLang(tempDate);
					*/
					//Eventos
					for (var e=0;e<data.value[i].Eventos.length;e++) {
						var eventoCodigo = data.value[i].Eventos[e].Codigo;
						var eventoNome = data.value[i].Eventos[e].Nome;
						var eventoRealizado = data.value[i].Eventos[e].Realizado;
						var eventoNotifica = data.value[i].Eventos[e].Notifica;
						
						var sessaoEventos = card.querySelectorAll('.ac-text .ac-sub .ac-sub-text')[1];
						var tabelaEventos = sessaoEventos.querySelector('.eventos');
						var itemEvento = tabelaEventos.querySelector('.evento');
						
						var item = itemEvento.cloneNode(true);	
						item.removeAttribute('hidden');												
						item.querySelector('.nome').textContent = eventoNome
						item.querySelector('.notify').setAttribute('codigo', eventoCodigo);						
						item.querySelector('.notify').setAttribute('processo', numeroProcesso);
						if (eventoNotifica){
							item.querySelector('.notify').setAttribute('checked', true);
						}
						var tempDate = new Date(eventoRealizado);					
						if (tempDate > 0){
							item.querySelector('.realizado').textContent = dateStringLangWithHour(tempDate);
						}else{
							item.querySelector('.realizado').textContent = "-";
						}

						tabelaEventos.appendChild(item);										
					}
					
					//Documentos
					for (var e=0;e<data.value[i].Documentos.length;e++) {
						var tipodocumento = data.value[i].Documentos[e].Tipodocumento;
						var descricao = data.value[i].Documentos[e].Descricao;
						var dataCriacao = data.value[i].Documentos[e].DataCriacao;
						var nomeArquivo = data.value[i].Documentos[e].NomeArquivo;
						var pathArquivo = data.value[i].Documentos[e].Path;
						var extFile = nomeArquivo.split('.').pop().toUpperCase();
					
						var sessaoDocumentos = card.querySelectorAll('.ac-text .ac-sub .ac-sub-text')[2];
						var tabelaDocumentos = sessaoDocumentos.querySelector('.documentos');
						var itemDocumento = tabelaDocumentos.querySelector('.documento');
						
						var item = itemDocumento.cloneNode(true);	
						item.removeAttribute('hidden');		
						var downfile = item.querySelector('.tipoDocumento .linkpdf'); 
						downfile.textContent = tipodocumento;
						downfile.setAttribute('fileName', nomeArquivo);
						if (extFile==='PDF')
							downfile.setAttribute('path', servidor+':'+porta+'/indaia/filelisting/'+pathArquivo+'#view=FitH');
						else
							downfile.setAttribute('path', servidor+':'+porta+'/indaia/filelisting/'+pathArquivo);
						//item.querySelector('.tipoDocumento').textContent = tipodocumento;
						var tempDate = new Date(dataCriacao);
						if (tempDate > 0){
							item.querySelector('.dataCriacao').textContent = dateStringLang(tempDate);
						}else{
							item.querySelector('.dataCriacao').textContent = "-";
						}
						
						tabelaDocumentos.appendChild(item);
					}				
				
					appCPE.container.appendChild(card);			
					
				//}	
			}
		}
		if (appCPE.isLoading) {
		  appCPE.spinner.setAttribute('hidden', true);
		  appCPE.container.removeAttribute('hidden');
 		  appCPE.resultPesquisa.removeAttribute('hidden');
		  appCPE.isLoading = false;
		}
		pagination(appCPE.novaPesquisa, String(appCPE.qtdResultAtual));		
	}		  
	document.getElementById('butFilter').addEventListener('click', function() {
		appCPE.toggleAddDialog(true);		
	});
	
/* 
	Botão Aplica Filtro
	Usando a função load do jquery para recarretar a DIV container
	de modo que aguarde o load antes de prosseguir para pegar a os
	processos
*/


	if (window.location.toString().indexOf("?") >= 0) {
		var vUrl = window.location.search;
		var vUrlParametro = new URLSearchParams(vUrl);

		var vNumero = vUrlParametro.get('numero');

		appCPE.redirected = true;
		appCPE.getProcessos('', vNumero, '', '', '', '', '', '', '', '');
		appCPE.toggleAddDialog(false);
		appCPE.firstLoad = false;		
	}

	document.getElementById('butApplyFilter').addEventListener('click', function() {			
		pesquisa(true);
	});	

	document.getElementById('butCancel').addEventListener('click', function() {
		appCPE.toggleAddDialog(false);
	});		  	


	function pesquisa(novaPesquisa){
		var qtd = 0;
		var pedido = document.getElementById('pedido').value;
		var refIndaia = document.getElementById('refIndaia').value;
		var container = document.getElementById('nrcontainer').value;
		var ddedue = document.getElementById('ddedue').value;
		var mercadoria = document.getElementById('mercadoria').value;
		var exportador = document.getElementById('exportador').value;
		var bl = document.getElementById('numerobl').value;
		var cliente = document.getElementById('cliente').value;
		var statusatual = document.getElementById('statusatual').value;
		var qtdResultAtual = String($('#sec-container').children('.linhaResult').length);
		if (pedido=="") {qtd++}
		if (refIndaia=="") {qtd++}
		if (container=="") {qtd++}
		if (ddedue=="") {qtd++}
		if (mercadoria=="") {
			qtd++	
		} else{
			if (statusatual=="") {
			 	alert("Favor selecionar um status. Necessário na pesquisa por mercadoria.");
			 	return false;				
			 }
		}	
		if (exportador=="") {
			qtd++	
		} else{
			if (statusatual=="") {
			 	alert("Favor selecionar um status. Necessário na pesquisa por exportador.");
			 	return false;				
			 }
		}
		if (bl=="") {qtd++}		
		if (cliente=="") {
			qtd++	
		} else{
			if (statusatual=="") {
			 	alert("Favor selecionar um status. Necessário na pesquisa por cliente.");
			 	return false;				
			 }
		}
		if (statusatual=="") {qtd++}
		if (qtdResultAtual=="") {qtd++}
		
		if (qtd>8){
			alert("Você deve informar pelo menos uma das opções de filtro.");
			return false;
		}

		appCPE.novaPesquisa = novaPesquisa;

		if (appCPE.novaPesquisa) {
			$("#sec-container").load(location.href+" #sec-container>*", function() {			
				appCPE.getProcessos(pedido, refIndaia, container, ddedue, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual);
				appCPE.toggleAddDialog(false);
				appCPE.firstLoad = false;
			});
		} else {
			appCPE.getProcessos(pedido, refIndaia, container, ddedue, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual);
			appCPE.toggleAddDialog(false);
			appCPE.firstLoad = false;		
		}

	};
	
//if (Object.keys(appCPE.visibleCards).length==0) {
	if (appCPE.firstLoad){
		appCPE.toggleAddDialog(true);  
	} 
}
