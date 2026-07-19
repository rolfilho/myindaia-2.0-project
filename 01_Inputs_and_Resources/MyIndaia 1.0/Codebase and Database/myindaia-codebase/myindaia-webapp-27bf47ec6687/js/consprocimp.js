/***************************************************
Consulta de Processos
****************************************************/	

var appCPI = {
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
	  
if (window.location.toString().indexOf("consproimp") >= 0) {
	
	appCPI.toggleAddDialog = function(visible) {
		if (visible) {
		  appCPI.addDialog.classList.add('dialog-container--visible');
		} else {
		  appCPI.addDialog.classList.remove('dialog-container--visible');
		}
	};

	appCPI.getProcessos = function(pedido, numero, container, diduimp, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual) {
		var url = servidor+':'+porta+'/indaia/api/Service/ProcessosImpo';		
		appCPI.isLoading = true;
		appCPI.spinner.removeAttribute('hidden');
		
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
				appCPI.updateForecastCard(results);
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
			  appCPI.updateForecastCard(results);
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
					DiDUImp: diduimp, 
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
		  
	appCPI.updateForecastCard = function(data) {
		var idCard = 0;	
		if(data.value.length === 0){
			appCPI.container.querySelector('.alert').removeAttribute('hidden');
			appCPI.container.querySelector('.alert').textContent = strNoRecordFound();
		}else{
			appCPI.container.querySelector('.alert').setAttribute('hidden', true);

		var ndoc = 1;

			for (var i=0;i<data.value.length;i++) {
				var id = data.value[i].$id;
				var numeroProcesso = data.value[i].Numero;
				var nomeCliente = data.value[i].NomeCliente;
				var refPadraoCliente = data.value[i].RefPadraoCliente;
				
				if (parseInt(appCPI.qtdResultAtual, 0) == 0) {
					appCPI.qtdResultAtual = data.value[i].QtdProcessos;
				}
			
				//var card = appCPI.visibleCards[id];
			
			//if (!card) {
				var card = appCPI.cardTemplate.cloneNode(true);
				//var card = document.querySelector('.cardTemplate').cloneNode(true);
				card.classList.remove('cardTemplate');
				card.classList.add('linhaResult');
				
				card.removeAttribute('hidden');
				idCard++;
				card.querySelector('.ac-input').setAttribute('id', 'ac-'+idCard);
				card.querySelector('.ac-input').setAttribute('name', 'ac-'+idCard);				
				if (appCPI.redirected) {
					card.querySelector('.ac-input').setAttribute('checked', true);								
				}

				card.querySelector('.ac-label').setAttribute('for', 'ac-'+idCard);
				for (var j=0;j<3;j++) {
					idCard++;
					card.querySelectorAll('.ac-text .ac-sub .ac-input')[j].setAttribute('id', 'ac-'+idCard);
					card.querySelectorAll('.ac-text .ac-sub .ac-input')[j].setAttribute('name', 'ac-'+idCard);
					card.querySelectorAll('.ac-text .ac-sub .ac-label')[j].setAttribute('for', 'ac-'+idCard);
				}
				
				//CabeÃ§alho
				card.querySelector('.ac-label').textContent = refPadraoCliente + ' - ' + numeroProcesso + ' - ' + nomeCliente;
				
				//Timeline	
/*				var tempDate = new Date(data.value[i].EventosFixos.Etd);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .Etd').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .Etd .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.EtdPrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .Etd .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
				}
*/
				var tempDate = new Date(data.value[i].EventosFixos.Embarque);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .Embarque').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .Embarque .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.EmbarquePrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .Embarque .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
				}			

				var tempDate = new Date(data.value[i].EventosFixos.Chegada);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .Chegada').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .Chegada .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.ChegadaPrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .Chegada .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
				}

				var tempDate = new Date(data.value[i].EventosFixos.Presenca);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .Presenca').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .Presenca .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.PresencaPrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .Presenca .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
				}

				var tempDate = new Date(data.value[i].EventosFixos.Registro);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .Registro').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .Registro .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.RegistroPrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .Registro .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
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

				var tempDate = new Date(data.value[i].EventosFixos.MercadoriaFabrica);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.StepProgress .MercadoriaFabrica').classList.remove('is-done');
				}else{
					card.querySelector('.StepProgress .MercadoriaFabrica .time').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.MercadoriaFabricaPrevisto);
				if (tempDate > 0){
					card.querySelector('.StepProgress .MercadoriaFabrica .Previsto').textContent = " - Prev. " + dateStringLang(tempDate);
				}


				// Timeline Horizontal
/*				var tempDate = new Date(data.value[i].EventosFixos.Etd);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .Etd').classList.remove('complete');
				}else{
					card.querySelector('.timeline .Etd .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.EtdPrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .Etd .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
				}
*/
				var tempDate = new Date(data.value[i].EventosFixos.Embarque);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .Embarque').classList.remove('complete');
				}else{
					card.querySelector('.timeline .Embarque .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.EmbarquePrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .Embarque .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
				}

				var tempDate = new Date(data.value[i].EventosFixos.Chegada);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .Chegada').classList.remove('complete');
				}else{
					card.querySelector('.timeline .Chegada .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.ChegadaPrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .Chegada .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
				}

				var tempDate = new Date(data.value[i].EventosFixos.Presenca);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .Presenca').classList.remove('complete');
				}else{
					card.querySelector('.timeline .Presenca .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.PresencaPrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .Presenca .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
				}

				var tempDate = new Date(data.value[i].EventosFixos.Registro);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .Registro').classList.remove('complete');
				}else{
					card.querySelector('.timeline .Registro .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.RegistroPrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .Registro .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
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

				var tempDate = new Date(data.value[i].EventosFixos.MercadoriaFabrica);
				if ((tempDate <= 0) || isNaN(tempDate)){
					card.querySelector('.timeline .MercadoriaFabrica').classList.remove('complete');
				}else{
					card.querySelector('.timeline .MercadoriaFabrica .timestamp .date').textContent = dateStringLang(tempDate);
				}
				var tempDate = new Date(data.value[i].EventosFixos.MercadoriaFabricaPrevisto);
				if (tempDate > 0){
					card.querySelector('.timeline .MercadoriaFabrica .Previsto').textContent = "Prev. " + dateStringLang(tempDate);
				}				



			
				//Dados Básicos
				var dadosBasicos = card.querySelectorAll('.ac-text .ac-sub .ac-sub-text')[0];
				dadosBasicos.querySelector('.dadosBasicos .refCliente .valor').textContent = data.value[i].RefCliente;
				dadosBasicos.querySelector('.dadosBasicos .canal .valor').textContent = data.value[i].Canal;
				dadosBasicos.querySelector('.dadosBasicos .mercadoria .valor').textContent = data.value[i].Mercadoria;
				dadosBasicos.querySelector('.dadosBasicos .quantidade .valor').textContent = mascaraValor(data.value[i].Quantidade.toFixed(2));
				dadosBasicos.querySelector('.dadosBasicos .pesoLiquido .valor').textContent = mascaraValor(data.value[i].PesoLiquido.toFixed(2));

				var tempDate = new Date(data.value[i].DeliveryDateRevisada);
				if (tempDate > 0)
				  dadosBasicos.querySelector('.dadosBasicos .DeliveryDateRevisada .valor').textContent = dateStringLang(tempDate);

				dadosBasicos.querySelector('.dadosBasicos .ExportadorNome .valor').textContent = data.value[i].Exportador;
				dadosBasicos.querySelector('.dadosBasicos .Anuencias .valor').textContent = data.value[i].Anuencias;
				 //dadosBasicos.querySelector('.dadosBasicos .StatusAtual .valor').textContent = data.value[i].StatusAtual;

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
					
					item.querySelector('.nome').textContent = eventoNome;
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
					
					var tipoDocumentoGrupo = '';

					//Documentos
					for (var e=0;e<data.value[i].Documentos.length;e++) {
						var tipodocumento = data.value[i].Documentos[e].Tipodocumento;
						var descricao = data.value[i].Documentos[e].Descricao;
						var dataCriacao = data.value[i].Documentos[e].DataCriacao;
						var nomeArquivo = data.value[i].Documentos[e].NomeArquivo;
						var pathArquivo = data.value[i].Documentos[e].Path;
						var extFile = nomeArquivo.split('.').pop().toUpperCase();
						var ndoc = ndoc + 1;											

						if (tipoDocumentoGrupo !== tipodocumento) {
							var containerTipoDoc = card.querySelector('.container-tipo-doc');															
							var sessaoTipoDocumento = card.querySelector('.ac-sub-tipo-doc');															
							var tipoDocumentos = sessaoTipoDocumento.cloneNode(true);	
							tipoDocumentos.removeAttribute('hidden');
							tipoDocumentos.querySelector('.ac-label').textContent = tipodocumento;
							tipoDocumentos.querySelector('.ac-input').setAttribute('id', 'ac-sub-doc-'+ndoc);
							tipoDocumentos.querySelector('.ac-input').setAttribute('name', 'ac-sub-doc-'+ndoc);
							tipoDocumentos.querySelector('.ac-label').setAttribute('for', 'ac-sub-doc-'+ndoc);
							var documentos = tipoDocumentos.querySelector('.body-documentos');
							var sessaoDocumento = tipoDocumentos.querySelector('.tr-documento');
							var documento = sessaoDocumento;
						}	
						else {
							var documento = sessaoDocumento.cloneNode(true);	
						}

						var downfile = documento.querySelector('.desc-documento .linkpdf'); 
						downfile.textContent = descricao;
						downfile.setAttribute('fileName', nomeArquivo);
						if (extFile==='PDF')
							downfile.setAttribute('path', servidor+':'+porta+'/indaia/filelisting/'+pathArquivo+'#view=FitH');
						else
							downfile.setAttribute('path', servidor+':'+porta+'/indaia/filelisting/'+pathArquivo);
						var tempDate = new Date(dataCriacao);					
						if (tempDate > 0){
							documento.querySelector('.data-Criacao').textContent = dateStringLang(tempDate);
						}else{
							documento.querySelector('.data-Criacao').textContent = "-";
						}
						

						if (tipoDocumentoGrupo !== tipodocumento) {
							containerTipoDoc.appendChild(tipoDocumentos);
						} else {
							documentos.appendChild(documento);	
						}	
					
						tipoDocumentoGrupo = tipodocumento;	

					}				
					
				
     				appCPI.container.appendChild(card);			
					
				//}	
			}
		}
		if (appCPI.isLoading) {
		  appCPI.spinner.setAttribute('hidden', true);
		  appCPI.container.removeAttribute('hidden');
 		  appCPI.resultPesquisa.removeAttribute('hidden');
		  appCPI.isLoading = false;
		}
		pagination(appCPI.novaPesquisa, String(appCPI.qtdResultAtual));
	}		  
	document.getElementById('butFilter').addEventListener('click', function() {
		appCPI.toggleAddDialog(true);		
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
		appCPI.redirected = true;			
		appCPI.getProcessos('', vNumero, '', '', '', '', '', '', '', '');
		appCPI.toggleAddDialog(false);
		appCPI.firstLoad = false;

	} 

	document.getElementById('butApplyFilter').addEventListener('click', function() {			
		pesquisaImpo(true);
	});	

	document.getElementById('butCancel').addEventListener('click', function() {
		appCPI.toggleAddDialog(false);
	});		  

	function pesquisaImpo(novaPesquisa){
		var qtd = 0;
		var pedido = document.getElementById('pedido').value;
		var refIndaia = document.getElementById('refIndaia').value;
		var container = document.getElementById('nrcontainer').value;
		var diduimp = document.getElementById('diduimp').value;
		var mercadoria = document.getElementById('mercadoria').value;
		var exportador = document.getElementById('exportador').value;
		var bl = document.getElementById('numerobl').value;
		var cliente = document.getElementById('cliente').value;
		var statusatual = document.getElementById('statusatual').value;
		var qtdResultAtual = String($('#sec-container').children('.linhaResult').length);
		if (pedido=="") {qtd++}
		if (refIndaia=="") {qtd++}
		if (container=="") {qtd++}
		if (diduimp=="") {qtd++}
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

		appCPI.novaPesquisa = novaPesquisa;

		if (appCPI.novaPesquisa) {
			$("#sec-container").load(location.href+" #sec-container>*", function() {			
				appCPI.getProcessos(pedido, refIndaia, container, diduimp, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual);
				appCPI.toggleAddDialog(false);
				appCPI.firstLoad = false;
			});
		} else {
			appCPI.getProcessos(pedido, refIndaia, container, diduimp, mercadoria, exportador, bl, cliente, statusatual, qtdResultAtual);
			appCPI.toggleAddDialog(false);
			appCPI.firstLoad = false;		
		}

	};
	
	//if (Object.keys(appCPI.visibleCards).length==0) {
	if (appCPI.firstLoad){
		appCPI.toggleAddDialog(true);  
	  } 
}
