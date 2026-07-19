// JavaScript Document
<!--

function toggleAll(item) {
	//Desativa todos os objetos do form
	for(i=0; i< document.frmbusca.filtro.length;i++) {
		if (item != document.frmbusca.filtro[i]) {
			if (document.frmbusca.filtro[i].value=='cd_unid_neg') {
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#ffffff"');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=false');
					eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			} else {
				document.frmbusca.filtro[i].disabled = true;
				eval(' var d = document.frmbusca.'+document.frmbusca.filtro[i].value);
				if (d) {
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
				}
				eval('d = document.frmbusca.'+document.frmbusca.filtro[i].value+'i');
				if (d) {
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.disabled=true');
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.disabled=true');
				}
			}
		}
	}
}

function enableAll(item) {
	//Ativa todos objetos do form
	if (item.value=='nr_processo' || item.value=='nr_ref_pedido' || item.value=='nr_ref_ordem' || item.value=='nr_ref_remessa' || 
			item.value=='nr_ref_outras' || item.value=='nr_ref_book' || item.value=='nr_ref_seek' || item.value=='nr_ref_sap' || 
			item.value=='nr_ref_easy' || item.value=='nr_ref_courrier')
		for(i=0; i< document.frmbusca.filtro.length;i++) {
			if (item != document.frmbusca.filtro[i]) {
				if (document.frmbusca.filtro[i].value=='cd_unid_neg') {
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#ffffff"');
					eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=false');
				} else {
					document.frmbusca.filtro[i].disabled = false;			
					eval(' var d = document.frmbusca.'+document.frmbusca.filtro[i].value);
					if (d) {
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=false');
					}
					eval('d = document.frmbusca.'+document.frmbusca.filtro[i].value+'i');
					if (d) {
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.disabled=false');
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.disabled=false');
					}
				}
			}
		}
}

function toggleSelectedRules(item) {
	if (item.checked) {
		//	regras para o check de grupo
		if (item.value=='cd_grupo') {
			for(j=0; j < document.frmbusca.filtro.length; j++) {
				if (document.frmbusca.filtro[j].value=='cd_cliente' || document.frmbusca.filtro[j].value=='cd_cliente2') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
					eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para o check de cliente
		if (item.value=='cd_cliente') {
			for(j=0; j < document.frmbusca.filtro.length; j++) {
				if (document.frmbusca.filtro[j].value=='cd_grupo' || document.frmbusca.filtro[j].value=='cd_cliente2') {
			  	document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para o check de cliente2
		if (item.value=='cd_cliente2') {
			for(j=0; j < document.frmbusca.filtro.length; j++) {
				if (document.frmbusca.filtro[j].value=='cd_grupo' || document.frmbusca.filtro[j].value=='cd_cliente') {
			  	document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para o check de AREA
		if (item.value=='cd_area') {
			for(j=0; j < document.frmbusca.filtro.length; j++) {
				if (document.frmbusca.filtro[j].value=='cd_subarea') {
			  	document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para o check de SUB-AREA
		if (item.value=='cd_subarea') {
			for(j=0; j < document.frmbusca.filtro.length; j++) {
				if (document.frmbusca.filtro[j].value=='cd_area') {
			  	document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para check vôo
		if (item.value=='nr_voo') {
			for(j=0; j< document.frmbusca.filtro.length;j++) {				
				if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
				if (document.frmbusca.filtro[j].value=='nr_viagem') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
				if (document.frmbusca.filtro[j].value=='nr_cntr') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para check cntr
		if (item.value=='nr_cntr') {
			for(j=0; j< document.frmbusca.filtro.length;j++) {
				if (document.frmbusca.filtro[j].value=='nr_voo') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
			}
		}
		//	regras para check navio
		if (item.value=='cd_embarcacao') {
			for(j=0; j< document.frmbusca.filtro.length;j++) {				
				if (document.frmbusca.filtro[j].value=='nr_voo') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
				if (document.frmbusca.filtro[j].value=='nr_viagem') {
//					document.frmbusca.filtro[j].checked = true;
//					document.frmbusca.filtro[j].disabled = true;
				}
			}
		}
		//	regras para check viagem				
		if (item.value=='nr_viagem') {
			for(j=0; j< document.frmbusca.filtro.length;j++){				
				if (document.frmbusca.filtro[j].value=='nr_voo') {
					document.frmbusca.filtro[j].checked = false;
					document.frmbusca.filtro[j].disabled = true;
					
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
					eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
				}
				if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
					document.frmbusca.filtro[j].checked = true;
//					document.frmbusca.filtro[j].disabled = true;
				}
			}
		}
		//	regras para check transporte				
		if (item.value=='cd_via_transp' && item.checked) {
			if (document.frmbusca.cd_via_transp[document.frmbusca.cd_via_transp.selectedIndex].value=='01') {
				for(j=0; j< document.frmbusca.filtro.length;j++){				
					if (document.frmbusca.filtro[j].value=='nr_voo') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_cntr') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
							eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					if (document.frmbusca.filtro[j].checked)
						clickCheck(document.frmbusca.filtro[j])
					}
					
					if (document.frmbusca.filtro[j].value=='nr_viagem') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
							eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
						if (document.frmbusca.filtro[j].checked)
							clickCheck(document.frmbusca.filtro[j])
					}
				}
			}
			if (document.frmbusca.cd_via_transp[document.frmbusca.cd_via_transp.selectedIndex].value=='04' ) {
				for(j=0; j< document.frmbusca.filtro.length;j++) {
					if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
							eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_viagem') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
							eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_cntr') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[j].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_voo') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = false;
					}
				}
			}
		}
	}
}

function enableSelectedRules(item) {
	for(i=0; i< document.frmbusca.filtro.length;i++) {
		if (item != document.frmbusca.filtro[i]) {
			document.frmbusca.filtro[i].disabled = false;			
			if (eval('document.frmbusca.'+document.frmbusca.filtro[i].value)) {
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="white"');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=false');
			}
			if (eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i')) {
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.style.background="white"');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'i.disabled=false');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.style.background="white"');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'f.disabled=false');
			}
		}
		//	regras para check navio
		if (item.value=='cd_embarcacao') {
			for(j=0; j< document.frmbusca.filtro.length;j++) {
				if (document.frmbusca.filtro[j].value=='nr_voo') {
					document.frmbusca.filtro[j].checked = false
				}
				if (document.frmbusca.filtro[j].value=='nr_viagem') {
					document.frmbusca.filtro[j].checked = false
				}
			}
		}
		//	regras para check viagem
		if (item.value=='nr_viagem') {
			for(j=0; j< document.frmbusca.filtro.length;j++) {
				if (document.frmbusca.filtro[j].value=='nr_voo') {
					document.frmbusca.filtro[j].checked = false
				}
				if (document.frmbusca.filtro[j].value=='nr_navio') {
					document.frmbusca.filtro[j].checked = false
				}
			}
		}
	}
}

function toggleFirst(item) {
	if (item.value!='cd_unid_neg') 
		for(i=0; i< document.frmbusca.filtro.length;i++){
			if (document.frmbusca.filtro[i].value=='nr_processo') {
				document.frmbusca.filtro[i].disabled = true;	
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_pedido') {
				document.frmbusca.filtro[i].disabled = true;	
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_ordem') {
				document.frmbusca.filtro[i].disabled = true;	
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_remessa') {
				document.frmbusca.filtro[i].disabled = true;	
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_outras') {
				document.frmbusca.filtro[i].disabled = true;	
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_book') {
				document.frmbusca.filtro[i].disabled = true;
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_seek') {
				document.frmbusca.filtro[i].disabled = true;
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_sap') {
				document.frmbusca.filtro[i].disabled = true;
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_easy') {
				document.frmbusca.filtro[i].disabled = true;
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_courrier') {
				document.frmbusca.filtro[i].disabled = true;
				document.frmbusca.filtro[i].checked = false;			
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.disabled=true');
				eval('document.frmbusca.'+document.frmbusca.filtro[i].value+'.style.background="#DEE6EF"');
				eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
			}
		}
}

function enableFirst(item) {
	if (item.value=='nr_processo' || item.value=='nr_ref_pedido' || item.value=='nr_ref_ordem' || item.value=='nr_ref_remessa' || 
			item.value=='nr_ref_outras' || item.value=='nr_ref_book' || item.value=='nr_ref_seek' || item.value=='nr_ref_sap' || 
			item.value=='nr_ref_easy' || item.value=='nr_ref_courrier')
		for(i=0; i< document.frmbusca.filtro.length;i++) {
			if (document.frmbusca.filtro[i].value=='nr_processo') {
				document.frmbusca.filtro[i].disabled = false;	
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_pedido') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_ordem') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_remessa') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_outras') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_book') {
				document.frmbusca.filtro[i].disabled = false;	
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_seek') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_sap') {
				document.frmbusca.filtro[i].disabled = false;	
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_easy') {
				document.frmbusca.filtro[i].disabled = false;
			}
			if (document.frmbusca.filtro[i].value=='nr_ref_courrier') {
				document.frmbusca.filtro[i].disabled = false;
			}
		}
}

function exibeInfo(filtro){
	if (filtro == 'ordenacao'){
	var divInfoOrdenacao = document.getElementById('divInfoOrdenacao');
	var texto = (eval("document.getElementById('nome_"+ filtro+"').value"));
	var linha_info = "<div id='info_"+ filtro+"'></div>"; 
	divInfoOrdenacao.style.display = 'block';
	if(!eval("document.getElementById('info_"+ filtro  +"')")){
		divInfoOrdenacao.innerHTML = divInfoOrdenacao.innerHTML + linha_info;
	}
	}else{
	var divInfoFiltros = document.getElementById('divInfoFiltros');
	var texto = (eval("document.getElementById('nome_"+ filtro+"').value"));
	var linha_info = "<div id='info_"+ filtro+"'>&nbsp;&nbsp;&nbsp;&nbsp;- "+ texto +": </div>"; 
    divInfoFiltros.style.display = 'block';
	
	if(!eval("document.getElementById('info_"+ filtro  +"')")){
		divInfoFiltros.innerHTML = divInfoFiltros.innerHTML + linha_info;
	}
	}
}

function retiraInfo(filtro){
	var cont_checados = 0;
	var divInfoFiltros = document.getElementById('divInfoFiltros');
   	var linha_texto = eval("document.getElementById('info_"+ filtro+"');");
   	var removido_texto = divInfoFiltros.removeChild(linha_texto);  
		
	for (i=0; i< document.frmbusca.filtro.length;i++){		
		if (document.frmbusca.filtro[i].checked){
			cont_checados = cont_checados + 1;
		}
	}
			
	if (cont_checados == 0){
		divInfoFiltros.style.display = 'none';
	}
}

function clickCheck(item) {	

if (item.checked) {
		exibeInfo(item.value);
		if(eval("document.getElementById('contador_"+ item.value+"')")){						
		if(eval('document.frmbusca.combo_aux_' + item.value + '.value') != 3 && eval('document.frmbusca.combo_aux_' + item.value + '.value') != 4){
		eval("document.frmbusca.img_"+ item.value +".style.display='block'");
		eval("document.frmbusca.img_"+ item.value +"2.style.display='none'");
		}else{
		eval("document.frmbusca.img_"+ item.value +".style.display='none'");
		eval("document.frmbusca.img_"+ item.value +"2.style.display='block'");	
		}		
			if(eval('document.frmbusca.contador_'+ item.value +'.value')==0){
			eval('document.frmbusca.combo_aux_'+ item.value +'.disabled=false');
			}else{
			eval('document.frmbusca.combo_aux_'+ item.value +'.disabled=true');
			}
		}else{
			eval('document.frmbusca.combo_aux_'+ item.value +'.disabled=false');
		}
		

		if (item.value=='nr_processo' || item.value=='nr_ref_pedido' || item.value=='nr_ref_ordem' || item.value=='nr_ref_remessa' || 
				item.value=='nr_ref_outras' || item.value=='nr_ref_book' || item.value=='nr_ref_seek' || item.value=='nr_ref_sap' || 
				item.value=='nr_ref_easy' || item.value=='nr_ref_courrier') {
			toggleAll(item);
		} else {
			toggleSelectedRules(item);
			toggleFirst(item);
		}
	} else {
		retiraInfo(item.value);	
		eval('document.frmbusca.combo_aux_'+ item.value +'.disabled=true');
		if(eval("document.getElementById('contador_"+ item.value  +"')")){
		var filtro_desabilita = item.value
		var total_desabilita = eval('document.frmbusca.contador_total_'+ item.value +'.value');
		var combo_aux_desabilita = eval('document.frmbusca.combo_aux_' + item.value + '.value');		
		var tipo_desabilita = eval('document.frmbusca.controle_' + item.value + '.value ');
		
		if (combo_aux_desabilita != 2){
			var tamanho_desabilita = Left(eval('document.frmbusca.' + item.value + '.style.width'),3);
			if (tipo_desabilita != "combo"){
			eval("document.frmbusca." + item.value + ".value=''");
			}else{
			eval("document.frmbusca." + item.value + ".options[0].selected=true");
			}
		}else{
			var tamanho_desabilita = Left(eval('document.frmbusca.edt_' + item.value + '.style.width'),3);	
			eval("document.frmbusca.edt_" + item.value + ".value=''");
		}

		eval("document.frmbusca.img_"+ item.value +".style.display='none'");
		eval("document.frmbusca.img_"+ item.value +"2.style.display='block'");	
			for (cont_desabilita = 0;cont_desabilita < total_desabilita;cont_desabilita++){
				if (tipo_desabilita == "combo"){
					if (eval("document.getElementById('linha"+filtro_desabilita+cont_desabilita+"')")){
					retiraCombo(filtro_desabilita , eval("'linha"+filtro_desabilita+cont_desabilita+"'"), eval("'linha_ou"+filtro_desabilita+cont_desabilita+"'"), 2);	
					}
				}else{
					if (eval("document.getElementById('linha"+filtro_desabilita+cont_desabilita+"')")){
					retiraEdit(filtro_desabilita , eval("'linha"+filtro_desabilita+cont_desabilita+"'" ), eval("'linha_ou"+filtro_desabilita+cont_desabilita+"'"), 2);
					}
				}
			}
		}
		uncheck(item);
	}
}	
	
function uncheck(item) {
	enableAll(item);
	enableSelectedRules(item);
	enableFirst(item);
	for(i=0; i< document.frmbusca.filtro.length;i++) {
		if (document.frmbusca.filtro[i].checked)
			clickCheck(document.frmbusca.filtro[i]);
	}
}
// change Event (via_transp)
function changeTransport(item) {
	for(i=0; i< document.frmbusca.filtro.length;i++){
		if (document.frmbusca.filtro[i].value=='cd_via_transp' && document.frmbusca.filtro[i].checked) {
//			uncheck(document.frmbusca.filtro[i]);
			if (item[item.selectedIndex].value=='01') {
				for(j=0; j< document.frmbusca.filtro.length;j++) {
					if (document.frmbusca.filtro[j].value=='nr_voo') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_cntr') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');					
					}
					if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
						if (document.frmbusca.filtro[j].checked)
							clickCheck(document.frmbusca.filtro[j]);
					}
					if (document.frmbusca.filtro[j].value=='nr_viagem') {
						document.frmbusca.filtro[j].disabled = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
						if (document.frmbusca.filtro[j].checked)
							clickCheck(document.frmbusca.filtro[j])
					}
					if (document.frmbusca.filtro[j].checked)
						clickCheck(document.frmbusca.filtro[j])
				}
			}
			if (item[item.selectedIndex].value=='04') {
				for(j=0; j< document.frmbusca.filtro.length;j++) {
					if (document.frmbusca.filtro[j].value=='cd_embarcacao') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');

					}
					if (document.frmbusca.filtro[j].value=='nr_viagem') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');


					}
					if (document.frmbusca.filtro[j].value=='nr_cntr') {
						document.frmbusca.filtro[j].checked = false;
						document.frmbusca.filtro[j].disabled = true;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=true');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="#DEE6EF"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');
					}
					if (document.frmbusca.filtro[j].value=='nr_voo') {
						document.frmbusca.filtro[j].checked = false;
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.disabled=false');
						eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'.style.background="white"');
						eval('document.frmbusca.combo_aux_'+document.frmbusca.filtro[i].value+'.disabled=true');

					}
				}
			}
		}
	}
}

function verifyDates() {
	var b = true;
	for(j=0; j< document.frmbusca.filtro.length;j++) {
		if (document.frmbusca.filtro[j].checked && (document.frmbusca.filtro[j].value.charAt(0)+document.frmbusca.filtro[j].value.charAt(1)=='dt')) {
			var dt1 = eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'i.value');
			var dt2 = eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'f.value');
			dt1 = getValidDate(dt1);
			dt2 = getValidDate(dt2);
			if (dt1==undefined) {
				eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'i.style.background=\'red\'');
				alert('Verifique campos data: data inválida!');
				eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'i.style.background="white"');
				b=false;
			}	
			if (dt2==undefined) {
				eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'f.style.background=\'red\'');
				alert('Verifique campos data: data inválida!');
				eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'f.style.background="white"');
				b=false;
			} 
			if (b && dt2<dt1) {
				alert('Verifique campos data: data final < data inicial!');
				eval('document.frmbusca.'+document.frmbusca.filtro[j].value+'f.select()');
				b=false;
			}
		}
	}
	return b
}
// controle por input text
function enterInput(object) {
//	alert(object.name.substring(0,object.name.length-1));
	for(u=0;u<document.frmbusca.filtro.length;u++) {
		if (document.frmbusca.filtro[u].value==object.name || 'edt_' + document.frmbusca.filtro[u].value == object.name) {
			if (!document.frmbusca.filtro[u].disabled) {
				document.frmbusca.filtro[u].checked = true;
				clickCheck(document.frmbusca.filtro[u]);
				if(eval("document.getElementById('contador_"+ document.frmbusca.filtro[u].value  +"')")){
					if(eval("document.frmbusca.combo_aux_" + document.frmbusca.filtro[u].value +  ".value")!= 3 && eval("document.frmbusca.combo_aux_" + document.frmbusca.filtro[u].value +  ".value")!= 4){
					eval("document.frmbusca.img_" + document.frmbusca.filtro[u].value +  ".style.display='block';");
					eval("document.frmbusca.img_" + document.frmbusca.filtro[u].value +  "2.style.display='none';");
					}
				}
			}
		}
		if ((object.name.charAt(0)+object.name.charAt(1))=='dt') {
			if (document.frmbusca.filtro[u].value==object.name.substring(0,object.name.length-1)) {
				if (!document.frmbusca.filtro[u].disabled) {
					document.frmbusca.filtro[u].checked = true
					clickCheck(document.frmbusca.filtro[u]);
					if(eval("document.getElementById('contador_"+ document.frmbusca.filtro[u].value  +"')")){
						if(eval("document.frmbusca.combo_aux_" + document.frmbusca.filtro[u].value +  ".value")!= 3 && eval("document.frmbusca.combo_aux_" + document.frmbusca.filtro[u].value +  ".value")!= 4){
						eval("document.frmbusca.img_" + document.frmbusca.filtro[u].value +  ".style.display='block';");
						eval("document.frmbusca.img_" + document.frmbusca.filtro[u].value +  "2.style.display='none';");
						}
					}
				}
			}
		}
	}
}

function verifyInputs() {
	var ret = true;
	for (k=0;k<document.frmbusca.filtro.length;k++) {
		if (document.frmbusca.filtro[k].checked && document.frmbusca.filtro[k].value=='nr_processo' && eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[k].value + '.value') != 2) {
			var d = eval('document.frmbusca.'+document.frmbusca.filtro[k].value);
			if (d.value.length<10) {
				d.style.background='red';
				alert('Nr. de Processo/Referência Indaiá Inválido!');			
				d.style.background='white';
				ret = false;
			}
		} else {
				if (document.frmbusca.filtro[k].checked && eval('document.frmbusca.'+document.frmbusca.filtro[k].value)) {
				//alert(document.frmbusca.filtro[k].value);
				if(eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[k].value + '.value') != 2){
					//alert(eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[k].value + '.value'));
					var d = eval('document.frmbusca.'+document.frmbusca.filtro[k].value);
					if (d.value.length==0 && (eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[k].value + '.value') != 5 && eval('document.frmbusca.vazio_' + document.frmbusca.filtro[k].value + '.value') != 'V')) {
						d.style.background='red';
						alert('Verifique campo #'+(k+1));			
						d.style.background='white';
						ret = false;
					}
				}else{
					var d = eval('document.frmbusca.edt_'+document.frmbusca.filtro[k].value);
					if (d.value.length==0) {
						d.style.background='red';
						alert('Verifique campo #'+(k+1));			
						d.style.background='white';
						ret = false;
					}
				
				}
			}
		}
	}
	return ret
}

function validSubmit() {
	return (verifyInputs() && verifyDates())		
}
-->