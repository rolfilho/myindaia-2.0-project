if ((window.location.toString().indexOf("processosemandamentoimp") >= 0) && (localStorage._cs) ) {
	var spinner = document.querySelector(".loader");
    spinner.removeAttribute("hidden");	

	
	function BuscaQtdProcessosEmAndamentoImp(){

		var url = servidor+':'+porta+'/indaia/api/Service/ProcessosEmAndamentoImpo';
		
		// Fetch the latest data.
		
		var request = new XMLHttpRequest();
		request.onreadystatechange = function() {
		  if (request.readyState === XMLHttpRequest.DONE) {
			if (request.status === 200) {
			  var response = JSON.parse(request.response);
			  var results = response;//.query.results;
			  carregaQtdProcessosEmAndamentoImp(results);
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

	function carregaQtdProcessosEmAndamentoImp(data) {
		if(data.value.length > 0){		

			document.querySelector('#conteudo-index').removeAttribute('hidden');						

			for (var i=0;i<data.value.length;i++) {

				var RefIndaia = data.value[i].RefIndaia;
				var NrPO = data.value[i].NrPO;
				var ClienteImportador = data.value[i].ClienteImportador;
				var Mercadoria = data.value[i].Mercadoria;
				var Exportador = data.value[i].Exportador;
				var DeliveryDateRevisadaRealizado = data.value[i].DeliveryDateRevisadaRealizado;
				var DeliveryDateRevisadaPrevisto = data.value[i].DeliveryDateRevisadaPrevisto;
				var EmbarqueRealizado = data.value[i].EmbarqueRealizado;
				var EmbarquePrevisto = data.value[i].EmbarquePrevisto;
				var ChegadaRealizado = data.value[i].ChegadaRealizado;
				var ChegadaPrevisto = data.value[i].ChegadaPrevisto;
				var RegistroDIRealizado = data.value[i].RegistroDIRealizado;
				var RegistroDIPrevisto = data.value[i].RegistroDIPrevisto;
				var DesembaracoRealizado = data.value[i].DesembaracoRealizado;
				var DesembaracoPrevisto = data.value[i].DesembaracoPrevisto;
				var EntregaProgramadaRealizado = data.value[i].EntregaProgramadaRealizado;
				var EntregaProgramadaPrevisto = data.value[i].EntregaProgramadaPrevisto;
				var EntregaFabricaRealizado = data.value[i].EntregaFabricaRealizado;				
				var EntregaFabricaPrevisto = data.value[i].EntregaFabricaPrevisto;
				
				var painelInicial = document.querySelectorAll('.painelInicial')[0];
				painelInicial.removeAttribute('hidden');																		
				var tabelaProcessos = painelInicial.querySelector('.processosEmAndamento');
				var bodyProcessos = tabelaProcessos.querySelector('.bodyProcessosEmAndamento');			
				var processo = bodyProcessos.querySelector('.processoEmAndamento');
				
				var nodeProcesso = processo.cloneNode(true);	
				nodeProcesso.removeAttribute('hidden');												

				nodeProcesso.querySelector('.RefIndaia').textContent = RefIndaia
				nodeProcesso.querySelector('.RefIndaia').setAttribute("hRef",  'consproimp.html?numero=' + RefIndaia );				
				nodeProcesso.querySelector('.NrPO').textContent = NrPO
				nodeProcesso.querySelector('.ClienteImportador').textContent = ClienteImportador
				nodeProcesso.querySelector('.Mercadoria').textContent = Mercadoria
				nodeProcesso.querySelector('.Exportador').textContent = Exportador

				
				var vDeliveryDateRevisadaRealizado = new Date(DeliveryDateRevisadaRealizado);					
				var vDeliveryDateRevisadaPrevisto = new Date(DeliveryDateRevisadaPrevisto);								
				nodeProcesso.querySelector('.DeliveryDateRevisada .Realizado').textContent = "A: " + dateStringLang(vDeliveryDateRevisadaRealizado);
				nodeProcesso.querySelector('.DeliveryDateRevisada .Previsto').textContent = "E: " + dateStringLang(vDeliveryDateRevisadaPrevisto);					

				if (vDeliveryDateRevisadaRealizado > 0) {
					if (compareDates(dateStringLang(vDeliveryDateRevisadaRealizado), dateStringLang(vDeliveryDateRevisadaPrevisto))) {
						nodeProcesso.querySelector('.DeliveryDateRevisada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.DeliveryDateRevisada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.DeliveryDateRevisada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}

				var vEmbarqueRealizado = new Date(EmbarqueRealizado);					
				var vEmbarquePrevisto = new Date(EmbarquePrevisto);								
				nodeProcesso.querySelector('.Embarque .Realizado').textContent = "A: " + dateStringLang(vEmbarqueRealizado);
				nodeProcesso.querySelector('.Embarque .Previsto').textContent = "E: " + dateStringLang(vEmbarquePrevisto);					

				if (vEmbarqueRealizado > 0) {
					if (compareDates(dateStringLang(vEmbarqueRealizado), dateStringLang(vEmbarquePrevisto))) {
						nodeProcesso.querySelector('.Embarque .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.Embarque .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.Embarque .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				var vChegadaRealizado = new Date(ChegadaRealizado);					
				var vChegadaPrevisto = new Date(ChegadaPrevisto);								
				nodeProcesso.querySelector('.Chegada .Realizado').textContent = "A: " + dateStringLang(vChegadaRealizado);
				nodeProcesso.querySelector('.Chegada .Previsto').textContent = "E: " + dateStringLang(vChegadaPrevisto);					

				if (vChegadaRealizado > 0) {
					if (compareDates(dateStringLang(vChegadaRealizado), dateStringLang(vChegadaPrevisto))) {
						nodeProcesso.querySelector('.Chegada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.Chegada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.Chegada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	


				var vRegistroDIRealizado = new Date(RegistroDIRealizado);					
				var vRegistroDIPrevisto = new Date(RegistroDIPrevisto);								
				nodeProcesso.querySelector('.RegistroDI .Realizado').textContent = "A: " + dateStringLang(vRegistroDIRealizado);
				nodeProcesso.querySelector('.RegistroDI .Previsto').textContent = "E: " + dateStringLang(vRegistroDIPrevisto);					

				if (vRegistroDIRealizado > 0) {
					if (compareDates(dateStringLang(vRegistroDIRealizado), dateStringLang(vRegistroDIPrevisto))) {
						nodeProcesso.querySelector('.RegistroDI .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.RegistroDI .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.RegistroDI .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	


				var vDesembaracoRealizado = new Date(DesembaracoRealizado);					
				var vDesembaracoPrevisto = new Date(DesembaracoPrevisto);								
				nodeProcesso.querySelector('.Desembaraco .Realizado').textContent = "A: " + dateStringLang(vDesembaracoRealizado);
				nodeProcesso.querySelector('.Desembaraco .Previsto').textContent = "E: " + dateStringLang(vDesembaracoPrevisto);					

				if (vDesembaracoRealizado > 0) {
					if (compareDates(dateStringLang(vDesembaracoRealizado), dateStringLang(vDesembaracoPrevisto))) {
						nodeProcesso.querySelector('.Desembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.Desembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.Desembaraco .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				var vEntregaProgramadaRealizado = new Date(EntregaProgramadaRealizado);					
				var vEntregaProgramadaPrevisto = new Date(EntregaProgramadaPrevisto);								
				nodeProcesso.querySelector('.EntregaProgramada .Realizado').textContent = "A: " + dateStringLang(vEntregaProgramadaRealizado);
				nodeProcesso.querySelector('.EntregaProgramada .Previsto').textContent = "E: " + dateStringLang(vEntregaProgramadaPrevisto);					

				if (vEntregaProgramadaRealizado > 0) {
					if (compareDates(dateStringLang(vEntregaProgramadaRealizado), dateStringLang(vEntregaProgramadaPrevisto))) {
						nodeProcesso.querySelector('.EntregaProgramada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.EntregaProgramada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.EntregaProgramada .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}	

				
				var vEntregaFabricaRealizado = new Date(EntregaFabricaRealizado);					
				var vEntregaFabricaPrevisto = new Date(EntregaFabricaPrevisto);								
				nodeProcesso.querySelector('.EntregaFabrica .Realizado').textContent = "A: " + dateStringLang(vEntregaFabricaRealizado);
				nodeProcesso.querySelector('.EntregaFabrica .Previsto').textContent = "E: " + dateStringLang(vEntregaFabricaPrevisto);					

				if (vEntregaFabricaRealizado > 0) {
					if (compareDates(dateStringLang(vEntregaFabricaRealizado), dateStringLang(vEntregaFabricaPrevisto))) {
						nodeProcesso.querySelector('.EntregaFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#50c878" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';
                    } else {
						nodeProcesso.querySelector('.EntregaFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#e03a3e" d="M9,20.42L2.79,14.21L5.62,11.38L9,14.77L18.88,4.88L21.71,7.71L9,20.42Z" /></svg>';//"&#10004;";
                    }                                                        

				} else {
						nodeProcesso.querySelector('.EntregaFabrica .IconeRealizado').
						outerHTML  = '<svg style="width:30px;height:30px" viewBox="0 0 24 24"><path fill="#828282" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>';
				}					


				bodyProcessos.appendChild(nodeProcesso);										
			}			
		}
	  spinner.setAttribute("hidden", true);
	}

	BuscaQtdProcessosEmAndamentoImp();
}
