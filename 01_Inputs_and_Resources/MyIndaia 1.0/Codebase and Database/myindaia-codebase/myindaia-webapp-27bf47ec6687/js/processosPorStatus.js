if ((window.location.toString().indexOf("index") >= 0) && (localStorage._cs)) {
	var spinner = document.querySelector(".loader");
    spinner.removeAttribute("hidden");	

	
	function BuscaQtdProcessosPorStatus(){

		var url = servidor+':'+porta+'/indaia/api/Service/ProcessosPorStatus';
		
		// Fetch the latest data.
		
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
		  if (request.readyState === XMLHttpRequest.DONE) {
			if (request.status === 200) {
			  var response = JSON.parse(request.response);
			  var results = response;//.query.results;
			  carregaQtdProcessosPorStatus(results);
			} else {
			  spinner.setAttribute("hidden", true);
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
		request.send();
		  
	}

	function carregaQtdProcessosPorStatus(data) {
		if(data.value.length > 0){		

		    var expoAguardandoCarregamento = data.value[0].Expo_AguardandoCarregamento;
		    var expoAguardandoEnvioInvoice = data.value[0].Expo_AguardandoEnvioInvoice;
		    var expoAguardandoEmbarque = data.value[0].Expo_AguardandoEmbarque;
		    var expoAguardandoEnvioDocsOriginais = data.value[0].Expo_AguardandoEnvioDocsOriginais;
		    var expoAguardandoChegadaDestino = data.value[0].Expo_AguardandoChegadaDestino;
		    var impoAguardandoEmbarque = data.value[0].Impo_AguardandoEmbarque;
		    var impoEmbarcadoAguardandoChegada = data.value[0].Impo_EmbarcadoAguardandoChegada;
		    var impoEmDesembaraco = data.value[0].Impo_EmDesembaraco;
		    var impoDesembaracadoAguardandoProgramacaoEntrega = data.value[0].Impo_DesembaracadoAguardandoProgramacaoEntrega;
		    var impoProgramadoAguardandoEntregaFabrica = data.value[0].Impo_ProgramadoAguardandoEntregaFabrica;

			$("#expoAguardandoCarregamento").text(expoAguardandoCarregamento);
			$("#expoAguardandoEnvioInvoice").text(expoAguardandoEnvioInvoice);
			$("#expoAguardandoEmbarque").text(expoAguardandoEmbarque);
			$("#expoAguardandoEnvioDocsOriginais").text(expoAguardandoEnvioDocsOriginais);
			$("#expoAguardandoChegadaDestino").text(expoAguardandoChegadaDestino);
			$("#impoAguardandoEmbarque").text(impoAguardandoEmbarque);
			$("#impoEmbarcadoAguardandoChegada").text(impoEmbarcadoAguardandoChegada);
			$("#impoEmDesembaraco").text(impoEmDesembaraco);
			$("#impoDesembaracadoAguardandoProgramacaoEntrega").text(impoDesembaracadoAguardandoProgramacaoEntrega);
			$("#impoProgramadoAguardandoEntregaFabrica").text(impoProgramadoAguardandoEntregaFabrica);

		}
	  spinner.setAttribute("hidden", true);
	}

	BuscaQtdProcessosPorStatus();
}
