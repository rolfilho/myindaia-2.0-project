var tokenAuth = '';


(function() {
	
	'use strict'; 	
  
  	function includeJs(jsFilePath) {
		var js = document.createElement("script");
		js.type = "text/javascript";
		js.src = jsFilePath;
		document.body.appendChild(js);
	}

	includeJs("./js/config.js");
  
	var app = {
		tokenAuth: "",
		isLoading: true,
		visibleCards: {},
		selectedCities: [],
		spinner: document.querySelector('.loader'),
		cardTemplate: document.querySelector('.cardTemplate'),
		container: document.querySelector('.accordion'),
		addDialog: document.querySelector('.dialog-container'),
	  };
	  
	if (app.tokenAuth !== ""){
		document.getElementById("login").style.display = 'none';
	}	  
/*	
	function logado(){
		return app.tokenAuth !== "";
	}

	
	if (window.indexedDB) {
	  var request = indexedDB.open("comicsDB", 1);

	  request.onerror = function(e){
		console.log(e);
	  }	 	
*/	
	  
  
//Início Login    
  app.login = function(User, Password){
	app.isLoading = true;
	//Salvar no localStorage
	//localStorage.setItem('estado', 'GO');	
	//Lendo localStorage
	//localStorage.estado;
	
	//app.spinner.removeAttribute('hidden');  
	var urlBase = 'http://'+servidor+':'+porta+'/indaia/api/Service/';
	
	if (ambiente=='Dev'){
		console.log('urlBase: ' + urlBase);
	}
	
	var url = urlBase+'Login';
	
	if ('caches' in window) {
	    caches.match(url).then(function(response) {
        if (response) {
		response.json().then(function updateFromCache(json) {
            var results = json.query.results;
			if (ambiente=='Dev'){
				console.log('From Cache');
				console.log(results);
			}
			
			app.tokenAuth = results.value[0].$value;
			if (ambiente=='Dev'){
				console.log('app.tokenAuth: ' + app.tokenAuth);
			}
          });
        }
      });
    }
	
	if (localStorage.tokenAuth) {
		app.tokenAuth = localStorage.tokenAuth;
	}else{	
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
		  if (request.readyState === XMLHttpRequest.DONE) {
			if (request.status === 200) {
			  var response = JSON.parse(request.response);
			  var results = response;//.query.results;	
			  if (ambiente=='Dev'){
				console.log(results);
			  }
			  //app.updateForecastCard(results);
			  app.tokenAuth = results.value[0].$value;
			  localStorage.setItem('tokenAuth', app.tokenAuth);
			  if (ambiente=='Dev'){
				console.log(app.tokenAuth);
			  }
			}
		  }
		};
	}
	
	request.onload = function () {
		// Requisição finalizada. Faça o processamento aqui.
	};
	
	if (app.tokenAuth == ''){			
		request.open('POST', url);
		//request.setRequestHeader( 'Access-Control-Allow-Origin', '*');
		request.setRequestHeader( 'Content-Type', 'application/json' );
		//request.withCredentials = false;
		var nome = User;
		var senha = Password;
		var obj = { UserName: nome, Password: senha };
		var myJSON = JSON.stringify(obj);	
		if (ambiente=='Dev'){
			console.log(myJSON);
		}	
		request.send(myJSON);		
	}
  }
  
  document.getElementById('butLoginConfirm').addEventListener('click', function() {
	var usuario = document.getElementById('usuario').value;
	var senha = document.getElementById('senha').value;
    
	app.login(usuario, senha);    
	//app.toggleAddDialog(false);
  });
//Fim Login  
  
  app.getForecast = function(dataInicial, dataFinal, processo) {
	//http://localhost:2001/indaia/api/TProcesso?$filter=DtAbertura%20ge%202018-01-02%20and%20DtAbertura%20gt%202018-01-02&$top=10&$expand=ProcessoExp
	//http://localhost:2001/indaia/api/TProcesso?$filter=DtAbertura%20ge%202018-01-02%20and%20DtAbertura%20gt%202018-01-02&$top=10&$expand=Cliente
	var url = 'http://e6510:2001/indaia/api/TProcesso?$filter=DtAbertura%20ge%20'+dataInicial+'%20and%20DtAbertura%20gt%20'+dataFinal+'&$top=20&$expand=Cliente';
	
	app.isLoading = true;
	app.spinner.removeAttribute('hidden');  
    
	if ('caches' in window) {
      caches.match(url).then(function(response) {
        if (response) {
          response.json().then(function updateFromCache(json) {
            var results = json.query.results;
            console.log(results);
            app.updateForecastCard(results);
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
		  for (var i=0;i<results.value.length;i++) {
            console.log(results.value[i].Name);
		  }
		  console.log(results);
          app.updateForecastCard(results);
        }
      }
    };
    request.open('GET', url);
	//request.setRequestHeader( 'Access-Control-Allow-Origin', '*');
    //request.setRequestHeader( 'Content-Type', 'application/json' );
	//request.withCredentials = false;
    request.send();
  };
  
  app.updateForecastCard = function(data) {
	
	for (var i=0;i<data.value.length;i++) {
		var id = data.value[i].$id;
		var NrProcesso = data.value[i].NrProcesso;
        var NomeCliente = data.value[i].Cliente.NmEmpresa;

		var card = app.visibleCards[id];
		if (!card) {
			card = app.cardTemplate.cloneNode(true);		  
			card.classList.remove('cardTemplate');
			card.querySelector('.titulo').textContent = NrProcesso;
			card.querySelector('.content .cliente .valor').textContent = NomeCliente;
			card.querySelector('.content .abertura .valor').textContent = data.value[i].DtAbertura;
			card.querySelector('.content .pesoliquido .valor').textContent = data.value[i].VlPesoLiquido;
			card.querySelector('.content .pesobruto .valor').textContent = data.value[i].VlPesoBruto;
			card.removeAttribute('hidden');
			app.container.appendChild(card);		  
			app.visibleCards[id] = card;
		}	
    }
	if (app.isLoading) {
      app.spinner.setAttribute('hidden', true);
      app.container.removeAttribute('hidden');
      app.isLoading = false;
    }
  }

  app.toggleAddDialog = function(visible) {
    if (visible) {
      app.addDialog.classList.add('dialog-container--visible');
    } else {
      app.addDialog.classList.remove('dialog-container--visible');
    }
  };  

  // TODO add service worker code here
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker
             .register('./sw.js')
             .then(function() { console.log('Service Worker Registered'); });
  }


})();

function login(usuario, senha){
	
}