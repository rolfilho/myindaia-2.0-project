// JavaScript Document
<!--
//Desativa todos os objetos do form menos o filtro selecionado
function DesativaObjetos(chkFiltro) {
	with (document.frmFiltros) {
		for(i = 0; i < filtro.length; i++) {
			if (chkFiltro != filtro[i]) {
				if (filtro[i].value=='cd_unid_neg' || filtro[i].value=='cd_produto') {
					eval(filtro[i].value+'.style.background="#ffffff"');
					eval(filtro[i].value+'.disabled=false');
				}
				else {
					filtro[i].disabled = true;			
					if (filtro[i].value.substring(0,2) != 'dt') {
						eval(filtro[i].value+'.style.background="#cccccc"');
						eval(filtro[i].value+'.disabled=true');
					} else {
						eval(filtro[i].value+'i.style.background="#cccccc"');
						eval(filtro[i].value+'i.disabled=true');
						eval(filtro[i].value+'f.style.background="#cccccc"');
						eval(filtro[i].value+'f.disabled=true');
					}
				}
			}
		}
		//tratamento para filtros que dependem de outros filtros
		if (chkFiltro.value == 'nr_ref_pedido') {
			for(j = 0; j < filtro.length; j++) {
				if (filtro[j].value=='nr_item_cliente') {
					filtro[j].disabled = false;
					eval(filtro[j].value+'.style.background="#ffffff"');
					eval(filtro[j].value+'.disabled=false');
				}
			}
		}
		if (chkFiltro.value == 'nr_item_cliente') {
			for(j = 0; j < filtro.length; j++) {
				if (filtro[j].value=='nr_ref_pedido') {
					filtro[j].disabled = false;
					filtro[j].checked = true;
					eval(filtro[j].value+'.style.background="#ffffff"');
					eval(filtro[j].value+'.disabled=false');
				}
			}
		}
	}
}
//Ativa todos objetos do form
function AtivaObjetos(chkFiltro) {
	with (document.frmFiltros) {
		//if (chkFiltro.value.substring(0,7)=='nr_proc' || chkFiltro.value.substring(0,7)=='nr_ref_' || chkFiltro.value == 'nr_item_cliente')
		for(i = 0; i < filtro.length; i++) {
			if (chkFiltro != filtro[i]) {
				if (filtro[i].value=='cd_unid_neg' || filtro[i].value=='cd_produto') {
					eval(filtro[i].value+'.style.background="#ffffff"');
					eval(filtro[i].value+'.disabled=false');
				} else {
					filtro[i].disabled = false;			
					if (filtro[i].value.substring(0,2) != 'dt') {
						eval(filtro[i].value+'.style.background="white"');
						eval(filtro[i].value+'.disabled=false');
					} else {
						eval(filtro[i].value+'i.style.background="white"');
						eval(filtro[i].value+'i.disabled=false');
						eval(filtro[i].value+'f.style.background="white"');
						eval(filtro[i].value+'f.disabled=false');
					}
				}
			}
		}
	}
}
//desativa os filtros de acordo com o filtro selecionado
function DesativaRegras(chkFiltro) {
	with (document.frmFiltros) {
		if (chkFiltro.checked) {
			//	regras para o check de grupo
			if (chkFiltro.value=='cd_grupo') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='cd_cliente') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para o check de cliente
			if (chkFiltro.value=='cd_cliente') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='cd_grupo') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para o check de AREA
			if (chkFiltro.value=='cd_area') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='cd_subarea') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para o check de SUB-AREA
			if (chkFiltro.value=='cd_subarea') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='cd_area') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para check vôo
			if (chkFiltro.value=='nr_voo') {
				for(j = 0; j < filtro.length; j++) {				
					if (filtro[j].value=='cd_embarcacao') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
					if (filtro[j].value=='nr_viagem') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
					if (filtro[j].value=='nr_cntr') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para check cntr
			if (chkFiltro.value=='nr_cntr') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='nr_voo') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
				}
			}
			//	regras para check navio
			if (chkFiltro.value=='cd_embarcacao') {
				for(j = 0; j < filtro.length; j++) {				
					if (filtro[j].value=='nr_voo') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
					if (filtro[j].value=='nr_viagem') {
	//					filtro[j].checked = true;
	//					filtro[j].disabled = true;
					}
				}
			}
			//	regras para check viagem				
			if (chkFiltro.value=='nr_viagem') {
				for(j = 0; j < filtro.length; j++){				
					if (filtro[j].value=='nr_voo') {
						filtro[j].checked = false;
						filtro[j].disabled = true;
						eval(filtro[j].value+'.style.background="#cccccc"');
						eval(filtro[j].value+'.disabled=true');
					}
					if (filtro[j].value=='cd_embarcacao') {
						filtro[j].checked = true;
	//					filtro[j].disabled = true;
					}
				}
			}
			//	regras para check transporte				
			if (chkFiltro.value=='cd_via_transp' && chkFiltro.checked) {
				if (cd_via_transp[cd_via_transp.selectedIndex].value=='01') {
					for(j = 0; j < filtro.length; j++){				
						if (filtro[j].value=='nr_voo') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.style.background="#cccccc"');
							eval(filtro[j].value+'.disabled=true');
						}
						if (filtro[j].value=='nr_cntr') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.style.background="white"');
							eval(filtro[j].value+'.disabled=false');
						}
						if (filtro[j].value=='cd_embarcacao') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.style.background="white"');
							eval(filtro[j].value+'.disabled=false');
						if (filtro[j].checked) MarcaFiltro(filtro[j])
						}
						if (filtro[j].value=='nr_viagem') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.style.background="white"');
							eval(filtro[j].value+'.disabled=false');
							if (filtro[j].checked) MarcaFiltro(filtro[j])
						}
					}
				}
				if (cd_via_transp[cd_via_transp.selectedIndex].value=='04' ) {
					for(j = 0; j < filtro.length; j++) {
						if (filtro[j].value=='cd_embarcacao') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.style.background="#cccccc"');
							eval(filtro[j].value+'.disabled=true');
						}
						if (filtro[j].value=='nr_viagem') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.style.background="#cccccc"');
							eval(filtro[j].value+'.disabled=true');
						}
						if (filtro[j].value=='nr_cntr') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.style.background="#cccccc"');
							eval(filtro[j].value+'.disabled=true');
						}
						if (filtro[j].value=='nr_voo') {
							filtro[j].checked = false;
							filtro[j].disabled = false;
						}
					}
				}
			}
		}
	}
}
//ativa as regras selecionadas
function AtivaRegras(chkFiltro) {
	with (document.frmFiltros) {
		for(i = 0; i < filtro.length; i++) {
			if (chkFiltro != filtro[i]) {
				filtro[i].disabled = false;			
				if (filtro[i].value.substring(0,2) != 'dt') {
					eval(filtro[i].value+'.style.background="white"');
					eval(filtro[i].value+'.disabled=false');
				} else {
					eval(filtro[i].value+'i.style.background="white"');
					eval(filtro[i].value+'i.disabled=false');
					eval(filtro[i].value+'f.style.background="white"');
					eval(filtro[i].value+'f.disabled=false');
				}
			}
			//	regras para check navio
			if (chkFiltro.value=='cd_embarcacao') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='nr_voo') filtro[j].checked = false;
					if (filtro[j].value=='nr_viagem') filtro[j].checked = false;
				}
			}
			//	regras para check viagem
			if (chkFiltro.value=='nr_viagem') {
				for(j = 0; j < filtro.length; j++) {
					if (filtro[j].value=='nr_voo') filtro[j].checked = false;
					if (filtro[j].value=='nr_navio') filtro[j].checked = false;
				}
			}
		}
	}
}

function DesativaUnico(chkFiltro) {
	with (document.frmFiltros) {
		if (chkFiltro.value!='cd_unid_neg' && chkFiltro.value!='cd_produto') 
			for(i = 0; i < filtro.length; i++){
				if (filtro[i].value=='nr_processo') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_pedido') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_item_cliente') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_ordem') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_remessa') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_outras') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_book') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_seek') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_sap') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_easy') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
				if (filtro[i].value=='nr_ref_courrier') {
					filtro[i].disabled = true;			
					filtro[i].checked = false;			
					eval(filtro[i].value+'.disabled=true');
					eval(filtro[i].value+'.style.background="#cccccc"');
				}
			}
	}
}

function AtivaUnico(chkFiltro) {
	with (document.frmFiltros) {
		if (chkFiltro.value.substring(0,7)=='nr_proc' || chkFiltro.value.substring(0,7)=='nr_ref_' || chkFiltro.value == 'nr_item_cliente')
			for(i = 0; i < filtro.length; i++) {
				if (filtro[i].value=='nr_processo') filtro[i].disabled = false;
				//if (filtro[i].value=='nr_ref_pedido') filtro[i].disabled = false;
				//if (filtro[i].value=='nr_item_cliente') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_pedido' || filtro[i].value=='nr_item_cliente') {
					for(j = 0; j < filtro.length; j++)
						if (filtro[j].value=='nr_ref_pedido' || filtro[j].value=='nr_item_cliente') filtro[j].disabled = false;
				}
				if (filtro[i].value=='nr_ref_ordem') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_remessa') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_outras') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_book') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_seek') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_sap') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_easy') filtro[i].disabled = false;
				if (filtro[i].value=='nr_ref_courrier') filtro[i].disabled = false;
			}
	}
}

function MarcaFiltro(chkFiltro) {
	if (chkFiltro.checked) {
		if (chkFiltro.value.substring(0,7)=='nr_proc' || chkFiltro.value.substring(0,7)=='nr_ref_' || chkFiltro.value == 'nr_item_cliente') {
			DesativaObjetos(chkFiltro);
		} else {
			DesativaRegras(chkFiltro);
			DesativaUnico(chkFiltro);
		}
	} else {
		DesmarcaFiltro(chkFiltro);
	}
}	
	
function DesmarcaFiltro(chkFiltro) {
	AtivaObjetos(chkFiltro);
	AtivaRegras(chkFiltro);
	AtivaUnico(chkFiltro);
	with (document.frmFiltros) {
		for(i = 0; i < filtro.length; i++) 
			if (filtro[i].checked) MarcaFiltro(filtro[i]);
	}
}
// controle por entrada de dados
function EntraDados(object) {
	with (document.frmFiltros) {
		for(i = 0; i < filtro.length; i++) {
			if (filtro[i].value==object.name) {
				if (!filtro[i].disabled) {
					filtro[i].checked = true;
					MarcaFiltro(filtro[i]);
				}
			}
			if (object.name.substring(0,2)=='dt') {
				if (filtro[i].value==object.name.substring(0,object.name.length-1)) {
					if (!filtro[i].disabled) {
						filtro[i].checked = true;
						MarcaFiltro(filtro[i]);
					}
				}
			}
		}
	}
}
//altera os filtrs de acordo com o tipo de via de transporte
function MudaTransporte(chkFiltro) {
	with (document.frmFiltros) {
		for(i = 0; i < filtro.length; i++){
			if (filtro[i].value=='cd_via_transp' && filtro[i].checked) {
	//			DesmarcaFiltro(filtro[i]);
				if (chkFiltro[chkFiltro.selectedIndex].value=='01') {
					for(j = 0; j < filtro.length; j++) {
						if (filtro[j].value=='nr_voo') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.disabled=true');
							eval(filtro[j].value+'.style.background="#cccccc"');
						}
						if (filtro[j].value=='nr_cntr') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.disabled=false');
							eval(filtro[j].value+'.style.background="white"');
						}
						if (filtro[j].value=='cd_embarcacao') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.disabled=false');
							eval(filtro[j].value+'.style.background="white"');
							if (filtro[j].checked) MarcaFiltro(filtro[j]);
						}
						if (filtro[j].value=='nr_viagem') {
							filtro[j].disabled = false;
							eval(filtro[j].value+'.disabled=false');
							eval(filtro[j].value+'.style.background="white"');
							if (filtro[j].checked) MarcaFiltro(filtro[j]);
						}
						if (filtro[j].checked) MarcaFiltro(filtro[j]);
					}
				}
				if (chkFiltro[chkFiltro.selectedIndex].value=='04') {
					for(j = 0; j < filtro.length; j++) {
						if (filtro[j].value=='cd_embarcacao') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.disabled=true');
							eval(filtro[j].value+'.style.background="#cccccc"');
						}
						if (filtro[j].value=='nr_viagem') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.disabled=true');
							eval(filtro[j].value+'.style.background="#cccccc"');
						}
						if (filtro[j].value=='nr_cntr') {
							filtro[j].checked = false;
							filtro[j].disabled = true;
							eval(filtro[j].value+'.disabled=true');
							eval(filtro[j].value+'.style.background="#cccccc"');
						}
						if (filtro[j].value=='nr_voo') {
							filtro[j].checked = false;
							filtro[j].disabled = false;
							eval(filtro[j].value+'.disabled=false');
							eval(filtro[j].value+'.style.background="white"');
						}
					}
				}
			}
		}
	}
}
//muda o filtro de status
function MudaStatus(valor) {
	with (document.frmFiltros) {
		if (valor == '1') {
			for(i=0; i < filtro.length; i++) {
				if (filtro[i].value == 'tp_status') {
					filtro[i].checked  = true;
					filtro[i].disabled = false;
				}
			}
			tp_status.disabled = false;
		} else {
			for(i=0; i < filtro.length; i++) {
				if (filtro[i].value == 'tp_status') {
					filtro[i].checked  = false;
					filtro[i].disabled = true;
				}
			}
			tp_status.value    = 'X';
			tp_status.disabled = true;
		}
	}
}
//verifica se as datas digiadas são válidas
function VerificaDatas() {
	with (document.frmFiltros) {
		for(j = 0; j < filtro.length; j++) {
			if (filtro[j].checked && (filtro[j].value.substring(0,2)=='dt')) {
				var dt1 = eval(filtro[j].value+'i.value');
				var dt2 = eval(filtro[j].value+'f.value');
				dt1 = getValidDate(dt1);
				dt2 = getValidDate(dt2);
				if (dt1==undefined) {
					eval(filtro[j].value+'i.style.background=\'red\'');
					alert('Verifique campos data: data inválida!');
					eval(filtro[j].value+'i.style.background="white"');
					eval(filtro[j].value+'i.select()');
					return false;
				}	
				if (dt2==undefined) {
					eval(filtro[j].value+'f.style.background=\'red\'');
					alert('Verifique campos data: data inválida!');
					eval(filtro[j].value+'f.style.background="white"');
					eval(filtro[j].value+'f.select()');
					return false;
				} 
				if (dt2 < dt1) {
					alert('Verifique campos data: data final < data inicial!');
					eval(filtro[j].value+'f.select()');
					return false;
				}
			}
		}
	}
	return true;
}
//verifica a entrada de dados
function VerificaDados() {
	with (document.frmFiltros) {
		for (i = 0; i < filtro.length; i++) {
			if (filtro[i].checked && filtro[i].value.substring(0,2) != 'dt') {
				var d = eval(filtro[i].value);
				d.value = Trim(d.value);
				if (filtro[i].value=='nr_processo') {
					if (d.value.length != 10) {
						d.style.background='red';
						alert(filtro[i].desc+' inválido!');			
						d.style.background='white';
						d.focus();
						return false;
					}
				}
				else {
					if (d.value.length == 0) {
						d.style.background='red';
						alert('ATENÇÃO: filtro '+filtro[i].desc+' está selecionado, mas não foi definido nenhum valor.');			
						d.style.background='white';
						d.focus();
						return false;
					}
				}
			}
		}
	}
	return true;
}
//valida o form de filtros
function ValidaFiltros() {
	return (VerificaDados() && VerificaDatas())		
}
-->