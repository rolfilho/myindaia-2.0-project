if ((window.location.toString().indexOf("processosemandamentoexp") >= 0) && (localStorage._cs) ) {
	var spinner = document.querySelector(".loader");
    spinner.removeAttribute("hidden");	

	
	function BuscaQtdProcessosEmAndamentoExp(){

		var url = servidor+':'+porta+'/indaia/api/Service/ProcessosEmAndamentoExpo';
		
		// Fetch the latest data.
		
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
		  if (request.readyState === XMLHttpRequest.DONE) {
			if (request.status === 200) {
			  var response = JSON.parse(request.response);
			  var results = response;//.query.results;
			  carregaQtdProcessosEmAndamentoExp(results);
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

	function carregaQtdProcessosEmAndamentoExp(data) {
		if(data.value.length > 0){		

			document.querySelector('#conteudo-index').removeAttribute('hidden');						

			for (var i=0;i<data.value.length;i++) {

				var NumeroProcesso = data.value[i].NumeroProcesso;
				var RefEmbarque = data.value[i].RefEmbarque;
				var NomeCliente = data.value[i].NomeCliente;
				var Mercadoria = data.value[i].Mercadoria;
				var DataCarregamentoFabrica = data.value[i].DataCarregamentoFabrica;
				var DataCarregamentoFabricaPrevisao = data.value[i].DataCarregamentoFabricaPrevisao;
				// var DataEntregaCargaTermEmbarque = data.value[i].DataEntregaCargaTermEmbarque;
				// var DataEntregaCargaTermEmbarquePrevisao = data.value[i].DataEntregaCargaTermEmbarquePrevisao;

				var DataDesembaraco = data.value[i].DataDesembaraco;
				var DataDesembaracoPrevisao = data.value[i].DataDesembaracoPrevisao;
				var DataSaida = data.value[i].DataSaida;
				var DataSaidaPrevisao = data.value[i].DataSaidaPrevisao;
				var DataEnvioDocumentos = data.value[i].DataEnvioDocumentos;
				var DataEnvioDocumentosPrevisao = data.value[i].DataEnvioDocumentosPrevisao;
				var DataChegadaDestino = data.value[i].DataChegadaDestino;
				var DataChegadaDestinoPrevisao = data.value[i].DataChegadaDestinoPrevisao;

				
				var painelInicial = document.querySelectorAll('.painelInicial')[0];
				painelInicial.removeAttribute('hidden');																		
				var tabelaProcessos = painelInicial.querySelector('.processosEmAndamento');
				var bodyProcessos = tabelaProcessos.querySelector('.bodyProcessosEmAndamento');			
				var processo = bodyProcessos.querySelector('.processoEmAndamento');
				
				var nodeProcesso = processo.cloneNode(true);	
				nodeProcesso.removeAttribute('hidden');												

				nodeProcesso.querySelector('.NumeroProcesso').textContent = NumeroProcesso
				nodeProcesso.querySelector('.NumeroProcesso').setAttribute("hRef",  'consproexp.html?numero=' + NumeroProcesso );
				nodeProcesso.querySelector('.RefEmbarque').textContent = RefEmbarque
				nodeProcesso.querySelector('.NomeCliente').textContent = NomeCliente
				nodeProcesso.querySelector('.Mercadoria').textContent = Mercadoria

				
				var vDataCarregamentoFabricaPrevisao = new Date(DataCarregamentoFabricaPrevisao);					
				if (vDataCarregamentoFabricaPrevisao > 0){
					nodeProcesso.querySelector('.DataCarregamentoFabricaPrevisao').textContent = dateStringLang(vDataCarregamentoFabricaPrevisao);
				}

				var vDataCarregamentoFabrica = new Date(DataCarregamentoFabrica);					
					nodeProcesso.querySelector('.DataCarregamentoFabrica .Realizado').textContent = "A: " + dateStringLang(vDataCarregamentoFabrica);
					nodeProcesso.querySelector('.DataCarregamentoFabrica .Previsto').textContent = "E: " + dateStringLang(vDataCarregamentoFabricaPrevisao);					
				if (vDataCarregamentoFabrica > 0) {    
					if (compareDates(dateStringLang(vDataCarregamentoFabrica), dateStringLang(vDataCarregamentoFabricaPrevisao))) {
						nodeProcesso.querySelector('.DataCarregamentoFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DataCarregamentoFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DataCarregamentoFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				// var vDataEntregaCargaTermEmbarque = new Date(DataEntregaCargaTermEmbarque);					
				// var vDataEntregaCargaTermEmbarquePrevisao = new Date(DataEntregaCargaTermEmbarquePrevisao);								
				// nodeProcesso.querySelector('.DataEntregaCargaTermEmbarque .Realizado').textContent = "A: " + dateStringLang(vDataEntregaCargaTermEmbarque);
				// nodeProcesso.querySelector('.DataEntregaCargaTermEmbarque .Previsto').textContent = "E: " + dateStringLang(vDataEntregaCargaTermEmbarquePrevisao);					

				// if (vDataEntregaCargaTermEmbarque > 0) {
				// 	if (compareDates(dateStringLang(vDataEntregaCargaTermEmbarque), dateStringLang(vDataEntregaCargaTermEmbarquePrevisao))) {
				// 		nodeProcesso.querySelector('.DataEntregaCargaTermEmbarque .IconeRealizado').
				// 		outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
    //                 } else {
				// 		nodeProcesso.querySelector('.DataEntregaCargaTermEmbarque .IconeRealizado').
				// 		outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
    //                 }                                                        

				// } else {
				// 		nodeProcesso.querySelector('.DataEntregaCargaTermEmbarque .IconeRealizado').
				// 		outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				// }				


				var vDataDesembaraco = new Date(DataDesembaraco);					
				var vDataDesembaracoPrevisao = new Date(DataDesembaracoPrevisao);								
				nodeProcesso.querySelector('.DataDesembaraco .Realizado').textContent = "A: " + dateStringLang(vDataDesembaraco);
				nodeProcesso.querySelector('.DataDesembaraco .Previsto').textContent = "E: " + dateStringLang(vDataDesembaracoPrevisao);					

				if (vDataDesembaraco > 0) {
					if (compareDates(dateStringLang(vDataDesembaraco), dateStringLang(vDataDesembaracoPrevisao))) {
						nodeProcesso.querySelector('.DataDesembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DataDesembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DataDesembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				var vDataSaida = new Date(DataSaida);					
				var vDataSaidaPrevisao = new Date(DataSaidaPrevisao);								
				nodeProcesso.querySelector('.DataSaida .Realizado').textContent = "A: " + dateStringLang(vDataSaida);
				nodeProcesso.querySelector('.DataSaida .Previsto').textContent = "E: " + dateStringLang(vDataSaidaPrevisao);					

				if (vDataSaida > 0) {
					if (compareDates(dateStringLang(vDataSaida), dateStringLang(vDataSaidaPrevisao))) {
						nodeProcesso.querySelector('.DataSaida .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DataSaida .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DataSaida .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	


				var vDataEnvioDocumentos = new Date(DataEnvioDocumentos);					
				var vDataEnvioDocumentosPrevisao = new Date(DataEnvioDocumentosPrevisao);								
				nodeProcesso.querySelector('.DataEnvioDocumentos .Realizado').textContent = "A: " + dateStringLang(vDataEnvioDocumentos);
				nodeProcesso.querySelector('.DataEnvioDocumentos .Previsto').textContent = "E: " + dateStringLang(vDataEnvioDocumentosPrevisao);					

				if (vDataEnvioDocumentos > 0) {
					if (compareDates(dateStringLang(vDataEnvioDocumentos), dateStringLang(vDataEnvioDocumentosPrevisao))) {
						nodeProcesso.querySelector('.DataEnvioDocumentos .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DataEnvioDocumentos .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DataEnvioDocumentos .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	


				var vDataChegadaDestino = new Date(DataChegadaDestino);					
				var vDataChegadaDestinoPrevisao = new Date(DataChegadaDestinoPrevisao);								
				nodeProcesso.querySelector('.DataChegadaDestino .Realizado').textContent = "A: " + dateStringLang(vDataChegadaDestino);
				nodeProcesso.querySelector('.DataChegadaDestino .Previsto').textContent = "E: " + dateStringLang(vDataChegadaDestinoPrevisao);					

				if (vDataChegadaDestino > 0) {
					if (compareDates(dateStringLang(vDataChegadaDestino), dateStringLang(vDataChegadaDestinoPrevisao))) {
						nodeProcesso.querySelector('.DataChegadaDestino .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DataChegadaDestino .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DataChegadaDestino .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				bodyProcessos.appendChild(nodeProcesso);										
			}			
		}
	  spinner.setAttribute("hidden", true);
	}

	BuscaQtdProcessosEmAndamentoExp();
}
