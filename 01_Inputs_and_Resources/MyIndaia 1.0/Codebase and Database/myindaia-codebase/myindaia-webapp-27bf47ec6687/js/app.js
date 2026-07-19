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
	
	String.prototype.hashCode = function() {
		var hash = 0;
		if (this.length == 0) {
			return hash;
		}
		for (var i = 0; i < this.length; i++) {
			var char = this.charCodeAt(i);
			hash = ((hash<<5)-hash)+char;
			hash = hash & hash; // Convert to 32bit integer
		}
		return hash;
	}
	
	function enableLogin() {
		if ((window.location.toString().indexOf("index") >= 0) || window.location.toString().endsWith("/")){
			if (!localStorage._cs){
				document.querySelector('.frm-login').style.display = 'block';
			}else{
				document.querySelector('.frm-login').style.display = 'none';
				document.querySelector('.menu__list').removeAttribute('hidden');
				document.querySelector('.icone-menu').removeAttribute('hidden');
				document.querySelector('.menu-sup').removeAttribute('hidden');
			}
		}
	}
  
	enableLogin();
	
	var app = {
		tokenAuth: "",
		isLoading: true,
		visibleCards: {},
		spinner: document.querySelector('.loader'),
		cardTemplate: document.querySelector('.cardTemplate'),
		container: document.querySelector('.accordion'),
		addDialog: document.querySelector('.dialog-container'),
	  };
	
	///localStorage.setItem('_csval', app.tokenAuth.hashCode());	
	//if (!app.tokenAuth)
	
	

	includeJs("./js/util.js");
	includeJs("./js/consprocimp.js");
	includeJs("./js/consprocexp.js");
  	//includeJs("./js/processosPorStatus.js");	
//  	includeJs("./js/processosEmAndamento.js");	  	
  	includeJs("./js/processosEmAndamentoImp.js");	  	
  	includeJs("./js/processosEmAndamentoExp.js");	  	  	
  	includeJs("./js/personalizarPaginas.js");	  	  	
	includeJs("./js/client.min.js");


	//if (ambiente=='Dev'){ 
	//	localStorage.setItem('_cs', app.tokenAuth);
	//}
	
//Início Login    
  app.login = function(User, Password){
	app.isLoading = true;
	//Salvar no localStorage
	//localStorage.setItem('estado', 'GO');	
	//Lendo localStorage
	//localStorage.estado;
	
	var urlBase = servidor+':'+porta+'/indaia/api/Service/';
	app.spinner.removeAttribute('hidden');  

	var url = urlBase+'Login';
	
	if ('caches' in window) {
	    caches.match(url).then(function(response) {
        if (response) {
		response.json().then(function updateFromCache(json) {
            var results = json.query.results;
			app.tokenAuth = results.value[0].$value;
			localStorage.setItem('_cs', app.tokenAuth);
			localStorage.setItem('_csval', app.tokenAuth.hashCode());			
          });
        }
      });
    }
	
	if (localStorage._cs) {
		app.tokenAuth = localStorage._cs;
	}else{	
		var request = new XMLHttpRequest();
		
		request.onreadystatechange = function() {
			if (request.readyState === XMLHttpRequest.DONE) {
				if (request.status === 200) {
					var results = JSON.parse(request.response);
					app.tokenAuth = results.Token;				
					localStorage.setItem('_cs', app.tokenAuth);
					localStorage.setItem('_csval', app.tokenAuth.hashCode());
					localStorage.setItem('_lang', results.Idioma);
					localStorage.setItem('Nome', results.Nome);
					localStorage.setItem('_int', results.Interno);
					localStorage.setItem('_gr155', results.Grupo155);					
					app.setDevice();

					window.location.reload();
					document.querySelector('.alert').setAttribute('hidden', true);
				}else{				
					var results = JSON.parse(request.response);
					var res = results.error.message.split(/\s*;\s*/);
					var br = res[0];
					var en = res[1];
					var es = res[2];
					document.querySelector('.alert').innerHTML = i18n(br, en, es);
					document.querySelector('.alert').removeAttribute('hidden');
				}
			}
		};
	}
	
	request.onload = function () {
		// Requisição finalizada. Faça o processamento aqui.
		app.spinner.setAttribute('hidden', true);
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
		request.send(myJSON);		
	}
  }
  
  
    if ((window.location.toString().indexOf("index") >= 0) || window.location.toString().endsWith("/")){ 
	  document.getElementById('butLoginConfirm').addEventListener('click', function() {
		var usuario = document.getElementById('usuario').value;
		var senha = document.getElementById('senha').value;
		//app.toggleAddDialog(false);
		app.login(usuario, senha);    
		
	  });
	}
	
//Fim Login	

/*
    if ((window.location.toString().indexOf("conspro") >= 0)){ 
		console.log('addEventListener notify click');
		//document.getElementById('notify').addEventListener('click', function() {
		document.querySelector('.notify').addEventListener('click', function() {
		//var usuario = document.getElementById('usuario').value;
		//var senha = document.getElementById('senha').value;
		//app.toggleAddDialog(false);
		console.log('addEventListener notify click');
		var isChecked = $(this).prop("checked");
		var evento = $(this).attr("codigo");
		var processo = $(this).attr("processo");
		SetNotification(processo,codigo,isChecked);		
	  });
	}
*/

//Inicio SetDevice  
  app.setDevice = function(){
	if (localStorage._cs)
	{
		var urlBase = servidor+':'+porta+'/indaia/api/Service/';
		var url = urlBase+'SetDevice';
		var request = new XMLHttpRequest();
		request.open('POST', url);
		request.setRequestHeader( 'Content-Type', 'application/json' );
		request.setRequestHeader( 'authorization', 'Bearer '+localStorage._cs );
		
		var client = new ClientJS();				
		var obj = {
			Token: localStorage._ct,
			Fingerprint: client.getFingerprint().toString(),
			UserAgent: client.getUserAgent(),
			Browser: client.getBrowser(),
			BrowserVersion: client.getBrowserVersion(),
			BrowserMajorVersion: client.getBrowserMajorVersion(),
			Engine: client.getEngine(),
			EngineVersion: client.getEngineVersion(),
			OS: client.getOS(),
			OSVersion: client.getOSVersion(),
			Device: client.getDevice(),
			DeviceType: client.getDeviceType(),
			DeviceVendor: client.getDeviceVendor(),
			CPU: client.getCPU(),
			ColorDepth: client.getColorDepth().toString(),
			CurrentResolution: client.getCurrentResolution(),
			AvailableResolution: client.getAvailableResolution(),
			DeviceXDPI: client.getDeviceXDPI(),
			DeviceYDPI: client.getDeviceYDPI(),
			LocalStorage: client.isLocalStorage().toString(),
			SessionStorage: client.isSessionStorage().toString(),
			Cookie: client.isCookie().toString(),
			TimeZone: client.getTimeZone(),
			Language: client.getLanguage(),
			SystemLanguage: client.getSystemLanguage()
		};
		var myJSON = JSON.stringify(obj);	
		request.send(myJSON);		
	}
  }
//fim SetDevice

// TODO add service worker code here
  if ('serviceWorker' in navigator) {
  	console.log("Registrando SW");
    navigator.serviceWorker
             .register('./sw.js')
             .then(function() { console.log('Service Worker Registrado'); });
  }


})();

	function SetNotification(processo, evento, ativa){
		var url = servidor+':'+porta+'/indaia/api/Service/Notificacao';
		var request = new XMLHttpRequest();		
		request.open('POST', url);
		//request.setRequestHeader( 'Access-Control-Allow-Origin', '*');
		request.setRequestHeader( 'Content-Type', 'application/json' );
		
		if (localStorage._cs)
			request.setRequestHeader( 'authorization', 'Bearer '+localStorage._cs );
		
		var obj = { Processo: processo, 
		            Evento: evento, 
					Ativa: ativa
				};
		var myJSON = JSON.stringify(obj);
		request.send(myJSON);
	}