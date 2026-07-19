var isDOM = (document.getElementById ? true : false);
var isIE4 = ((document.all && !isDOM) ? true : false);
var isNS4 = (document.layers ? true : false);
var isNS = navigator.appName == "Netscape";

function fnc_ValidaData(campo) {
    var valor = campo.value;
    var date = campo.value;
    if (Trim(date) != "") {
        var ardt = new Array;
        var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
        ardt = date.split("/");
        erro = false;
        if (date.search(ExpReg) == -1) {
            erro = true;
        }
        else if (((ardt[1] == 4) || (ardt[1] == 6) || (ardt[1] == 9) || (ardt[1] == 11)) && (ardt[0] > 30))
            erro = true;
        else if (ardt[1] == 2) {
            if ((ardt[0] > 28) && ((ardt[2] % 4) != 0))
                erro = true;
            if ((ardt[0] > 29) && ((ardt[2] % 4) == 0))
                erro = true;
        }
        if (erro) {
            alert("ATENÇÃO: Data Inválida!");
            campo.focus();
            campo.value = "";
            return false;
        }
        return true;
    } else {
        return true;
    }
}

function Left(str, n){
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}

function Right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}

function openAjax() {
	var ajax;
	try {
		ajax = new XMLHttpRequest(); // XMLHttpRequest para browsers decentes, como: Firefox, Safari, dentre outros.
	}
	catch(ee) {
		try {
			ajax = new ActiveXObject("Msxml2.XMLHTTP"); // Para o IE da MS
		}
		catch(e) {
			try {
				ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Para o IE da MS
			}
			catch(E) {
				ajax = false;
			}
		}
	}
	return ajax;
}

function alteraMarcador(imagem, processo, evento, usuario, todos, eventos_marcados) {
    var name_todos;
    if (todos != '1'){
        marcador = new Image(14, 15)
        marcadord = new Image(14, 15)
        marcadord.src = "/imagens/30/marcador_d.gif";
        marcador.src = "/imagens/30/marcador.gif";
    }else{
        marcador = new Image(20, 20)
        marcadord = new Image(20, 20)
        marcadord.src = "/imagens/30/marcador_d3.gif";
        marcador.src = "/imagens/30/marcador_3.gif";    
    }
    if (imagem.src == marcadord.src) {
        var ajax = openAjax();
        ajax.open("GET", "/popup/altera_marcador.asp?processo=" + processo + "&evento=" + evento + "&usuario=" + usuario + "&eventos_marcados=" + eventos_marcados + "&tipo=1", true);
        ajax.send(null); // submete
        imagem.src = marcador.src;
        if (todos == '1') {
            marcador2 = new Image(14, 15)
            marcador2.src = "/imagens/30/marcador.gif";
            name_todos = 'marcadorEvento' + evento;
            for (i = 0; i <= 30; i++) {
                if (document.getElementsByName(name_todos).item(i)) {
                    document.getElementsByName(name_todos).item(i).src = marcador2.src;
                }
            }
        }
    } else {
        var ajax = openAjax();
        ajax.open("GET", "/popup/altera_marcador.asp?processo=" + processo + "&evento=" + evento + "&usuario=" + usuario + "&eventos_marcados=" + eventos_marcados + "&tipo=2", true);
        ajax.send(null); // submete
        imagem.src = marcadord.src;
        
        if (todos == '1') {
            marcadord2 = new Image(14, 15)
            marcadord2.src = "/imagens/30/marcador_d.gif";
            name_todos = 'marcadorEvento' + evento;
            for (i = 0; i <= 30; i++) {
                if (document.getElementsByName(name_todos).item(i)) {
                    document.getElementsByName(name_todos).item(i).src = marcadord2.src;
                }
            }
        }
    }
    /*PARA TESTAR A QUERY
    ajax.onreadystatechange = function () {
    if (ajax.readyState == 4) {
    var vResult = ajax.responseText;
    alert(vResult);
    }
    }
    */
}

function alteraCampos(tipo, destino, menu, subm, tp_exibir, cd_view, array_campo, nr_max_campo, tipo_campo) {
	if (document.getElementById) {
		var campo ="";
		var array_campo = document.getElementById(array_campo);
		var array_campo_total = array_campo.options.length;
		for (i = 0; i < array_campo_total; i++){
			//alert('oi');
			campo = campo + array_campo.options[i].value + ", ";
		}
		var vObj = document.getElementById(destino); //div onde a pagina será carregada
		var vAjax = openAjax(); //iniciamos o ajax
		//usado o GET para que se possa usar filtros querystring
		vAjax.open("GET","/popup/altera_campos.asp?tipo="+tipo+"&destino="+destino+"&menu="+menu+"&subm="+subm+"&tp_exibir="+tp_exibir+"&cd_view="+cd_view+"&array_campo="+campo+"&nr_max_campo="+nr_max_campo+"&tipo_campo="+tipo_campo,true); 
		vAjax.onreadystatechange = function() {
			if(vAjax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vObj.innerHTML = "<br>&nbsp;Aguarde, carregando...";
			}
			if(vAjax.readyState == 4) { //agora exibe o que interessa
				if(vAjax.status == 200) {
					var vResult = vAjax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vObj.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro, entre em contato com suporte@myindaia.com.br!');
					vObj.innerHTML = vAjax.responseText;
				}
			}
		}
		vAjax.send(null); // submete
	}
}

function alteraQtdCampos(tipo, destino, menu, subm, tp_exibir, cd_view, array_campo, nr_max_campo, tipo_campo) {
	if (document.getElementById){
	    if (tipo_campo == 1) {alert("ATENÇÃO:\n\nOs campos específicos da exibição 'Por pedido' e 'Por fatura' serão excluídos do seu relatório.");}
	    if (tipo_campo == 2) {alert("ATENÇÃO:\n\nOs campos específicos da exibição 'Por embarque' e 'Por fatura' serão excluídos do seu relatório.");}
	    if (tipo_campo == 3) {alert("ATENÇÃO:\n\nOs campos específicos da exibição 'Por embarque' e 'Por pedido' serão excluídos do seu relatório.");}
		var campo ="";
		var array_campo = document.getElementById(array_campo);
		var array_campo_total = array_campo.options.length;
		for (i = 0; i < array_campo_total; i++){
			campo = campo + array_campo.options[i].value + ", ";
		}
			
		var vObj = document.getElementById(destino); //div onde a pagina será carregada
		var vAjax = openAjax(); //iniciamos o ajax
		//usado o GET para que se possa usar filtros querystring
		vAjax.open("GET","/popup/altera_qtdcampos.asp?tipo="+tipo+"&destino="+destino+"&menu="+menu+"&subm="+subm+"&tp_exibir="+tp_exibir+"&cd_view="+cd_view+"&array_campo="+campo+"&nr_max_campo="+nr_max_campo+"&tipo_campo="+tipo_campo,true); 
		vAjax.onreadystatechange = function() {
			if(vAjax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vObj.innerHTML = "<br>&nbsp;Aguarde, carregando...";
			}
			if(vAjax.readyState == 4) { //agora exibe o que interessa
				if(vAjax.status == 200) {
					var vResult = vAjax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vObj.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro, entre em contato com suporte@myindaia.com.br!');
					vObj.innerHTML = vAjax.responseText;
				}
			}
		}
		vAjax.send(null); // submete
    }
}

function CarregaViaGet(nElementId, nPage, nFeatures) {
	if (document.getElementById) {
		var vObj = document.getElementById(nElementId); //div onde a pagina será carregada
		var vAjax = openAjax(); //iniciamos o ajax
		//usado o GET para que se possa usar filtros querystring
		vAjax.open("GET", nPage+".asp?"+nFeatures, true);
		vAjax.onreadystatechange = function() {
			if(vAjax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vObj.innerHTML = "<br>&nbsp;Aguarde, carregando...";
			}
			if(vAjax.readyState == 4) { //agora exibe o que interessa
				if(vAjax.status == 200) {
					var vResult = vAjax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vObj.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro, entre em contato com suporte@myindaia.com.br!');
					vObj.innerHTML = vAjax.responseText;
				}
			}
		}
		vAjax.send(null); // submete
	}
}

function altera_Session(session, valor){
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_session.asp?session="+session+"&valor="+valor, true);
		ajax.send(null); // submete
	}
}

function mudaIdioma(cd_lang){
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_idioma.asp?cd_lang="+cd_lang, true);
		ajax.send(null); // submete
	}
}

function mudaMBF(status, processo) {
    var vStatus = status.checked;
    if (document.getElementById) {
        var ajax = openAjax();
        ajax.open("GET", "/popup/muda_mbf.asp?status=" + vStatus + "&processo=" + processo, true);
        ajax.send(null); // submete
    }
}

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

function mudaTema(tema) {
    if (document.getElementById) {
        var ajax = openAjax();
        ajax.open("GET", "/popup/muda_tema.asp?tema=" + tema, true);       
        ajax.send(null); // submete
    }
    sleep(1000);
}

function mudaStatusExibe(status){
	var vStatus = status.checked;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_status_exibe.asp?status="+vStatus, true);
		ajax.send(null); // submete
	}
}

function logout() {
    if (window.event.clientX < 0 && window.event.clientY < 0) {
        if (document.getElementById) {
            var ajax = openAjax();
            ajax.open("GET", "logout.asp", true);
            ajax.send(null); // submete
        }
    }
}

function criaSolicitacao(motivo){
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/cria_solicitacao.asp", true);
		ajax.send(null); // submete
	}
	FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');
}

function mudaExibeDetalhe(status){
	var vStatus = status;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_exibe_detalhe.asp?status="+vStatus, true);
		ajax.send(null); // submete
	}
}

function MudaGrupo(combo){
	var vStatus = combo.value;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_grupo_rap.asp?status="+vStatus, true);
		ajax.send(null); // submete
	}
}

function FastLookup(vTabela, vCampos, vReturn, vCodigo, vEdit) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
		var vCod = vCodigo.value; //código que iremos pesquisar na tabela
		if (vCod != '' || vCod != undefined) {
			vCod = vCod.replace(" ","");
			if (vCod.length > 0 && vCod != 0) {
				//validamos o código para que ele tenha o tamanho certo defindo na tabela
				for (i = vCod.length; i < vCodigo.maxLength; i++)
					vCod = '0'+ String(vCod);
				vCodigo.value = vCod;
				//iniciamos a busca através do ajax
				var ajax = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax.open("GET","/popup/fast_lookup.asp?vTabela="+vTabela+"&vCampos="+vCampos+"&vReturn="+vReturn+"&vCodigo="+vCod, true); 
				ajax.onreadystatechange = function() {
					if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
						vDesc.value = "processando...";
					}
					if(ajax.readyState == 4) { //agora exibe o que interessa
						if(ajax.status == 200) {
							var vResult = ajax.responseText; //resultado da busca
							if (vResult.indexOf('erro')!=0) {
								vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
								vResult = unescape(vResult); //continua resolvendo problemas de acento
								vDesc.value = vResult;
							} else {
								var vColor = vCodigo.style.background;
								vCodigo.style.background = '#FFDDDD';
								alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
								vCodigo.style.background = vColor;
								vCodigo.focus();
								vDesc.value = "";
							}
						} else {
							alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
							vDesc.value = "";
							vCodigo.focus();
						}
					}
				}
				ajax.send(null); // submete
			} 
			else if (vCod != '') {
				alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
				vDesc.value = ""
			}
		}
	}
}

function getRef(id) {
	if (isDOM) return document.getElementById(id);
	if (isIE4) return document.all[id];
	if (isNS4) return document.layers[id];
}

function Point(x,y) {
	this.x = x;
	this.y = y;
}
mouseLocation = new Point(-500,-500);

function getMouseLoc(e) {
  if(!document.all) {  //NS
    mouseLocation.x = e.pageX;
    mouseLocation.y = e.pageY;
  }
  else {               //IE
    mouseLocation.x = event.x + document.body.scrollLeft;
    mouseLocation.y = event.y + document.body.scrollTop;
  }
  return true;
}
//NS init:
if(document.layers){
	document.captureEvents(Event.MOUSEMOVE);
	document.onMouseMove = getMouseLoc;
}

function getSty(id) {
	x = getRef(id);
	return (isNS4 ? getRef(id) : getRef(id).style);
}

// Validação de data, por Jean Rodrigues
function getValidDate(Q) {
	var d, m, D, U // y!=0
	if ((D = /^(3[0-1]|[0-2]\d)\/(0\d|1[0-2])\/(\d{4})$/.exec(Q)) != null) {
		with (D = new Date(D[3], m=(D[2]-1), d=D[1]))
		if (getMonth()==m && getDate()==d) return D
		return U 
	}

}

//validação de email, por Alexandre Neto
function fnc_ValidaEmail(vEmail) {
	re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
	//verifica se o email é válido
	if(!re.test(vEmail)) {
		alert("ATENÇÃO: E-mail("+vEmail+") Inválido! Por favor verifique o e-mail digitado.");
		return false;
	}
	return true;
}

function ValidaData(nData, nObject) {
	if (nData.length == 0) return false;
	var vDt = getValidDate(nData);
	if (vDt == undefined) {
		alert('A data digitada é inválida!');
		if (nObject != undefined) nObject.select();
		return false;
	}
	return true;
}

function ConverteParaNumero(nValorTexto) {
	if (isNaN(nValorTexto)) {
		nValorTexto = nValorTexto.replace(/\./g,"");
		nValorTexto = nValorTexto.replace(/\,/g,".");
	}
	nValorTexto = parseFloat(nValorTexto);
	return (isNaN(nValorTexto) ? null : nValorTexto);
}

function Trim(nStr){
	nStr = nStr.replace(/\s+/g," ");
	nStr = nStr.replace(/^ /,"");
	nStr = nStr.replace(/ $/,"");
	return nStr;
}

var scrollerHeight = 88;
var pauseBetweenImages = 3000;
var imageIdx = 0;

function moveRightEdge() {
	var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;

	if (isNS4) {
		yMenuFrom   = divMenu.top;
		yMenuTo     = windows.pageYOffset + 116;
	} else if (isDOM) {
		yMenuFrom   = parseInt (divMenu.style.top, 10);
		yMenuTo     = (isNS ? window.pageYOffset : document.body.scrollTop) + 116;
	}
	timeoutNextCheck = 18;

	if (yMenuFrom != yMenuTo) {
		yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
		if (yMenuTo < yMenuFrom)
			yOffset = -yOffset;
		if (isNS4)
			divMenu.top += yOffset;
		else if (isDOM)
			divMenu.style.top = parseInt (divMenu.style.top, 10) + yOffset;
			timeoutNextCheck = 10;
	}
	setTimeout ("moveRightEdge()", timeoutNextCheck);
}

var pasta_open  = "";
var pasta_close = "";
var lupa        = "";
var menu_open   = "";
var menu_close  = "";

function preload() {
  if(document.images) {
	pasta_open     = new Image(18,16);
	pasta_close    = new Image(16,16);
	lupa           = new Image(16,16);
	menu_open      = new Image(9, 100);
	menu_open_fim  = new Image(9, 100);
	menu_close     = new Image(9, 100);
	menu_close_fim = new Image(9, 100);
	seta           = new Image(7,48)
	seta_virada = new Image(7, 48)
	seta_cima = new Image(9, 100);
	seta_baixo = new Image(9, 100);
	pasta_open.src  = "/imagens/30/folder_open.gif";
	pasta_close.src = "/imagens/30/folder_close.gif";
	lupa.src        = "/imagens/30/button_view.gif";
	menu_open.src = "/imagens/30/minus_t.gif";
	menu_open_fim.src = "/imagens/30/minus_t_fim.gif";
	menu_close.src = "/imagens/30/plus_t.gif";
	menu_close_fim.src = "/imagens/30/plus_t_fim.gif";
	seta.src        = "/imagens/30/seta.jpg";
	seta_virada.src = "/imagens/30/seta_virada.jpg";
	seta_cima.src = "/imagens/30/seta_cima3.gif";
	seta_baixo.src = "/imagens/30/seta_baixo3.gif";
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                     INÍCIO MOSTRA                                                             //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//apDiv2=Menus
//apDiv3=quadro de busca por pedido/item
//apDiv4=quadro de busca por Ref_indaia
//Aberto = 1
//Fechado = 0 
//Recebesetor = identifica o ítem de menu que foi selecionado.
//tipo = importação = 9  exportação = 0 (Define qual foi clicado)
//tipo vindo da barra de abre/fecha menu= 1=importação e 0=outros
function mostraBuscaMais(menu) {
    if (menu == '01') {
        if (document.getElementById('BuscaMaisImp').style.display == 'block') {
            document.getElementById('BuscaMaisImp').style.display = 'none';
            document.getElementById('imgSetaBuscaImp').src = seta_baixo.src;
            document.getElementById('imgSetaBuscaImp').alt = "Mais opções"
            //document.getElementById('ReferenciaIndaia').focus();            
        } else {
            document.getElementById('BuscaMaisImp').style.display = 'block';
            document.getElementById('imgSetaBuscaImp').src = seta_cima.src;
            document.getElementById('imgSetaBuscaImp').alt = "Ocultar Opções" 
            //document.getElementById('ReferenciaIndaia').focus();            
        }
    } else {
        if (document.getElementById('BuscaMaisExp').style.display == 'block') {
            document.getElementById('BuscaMaisExp').style.display = 'none';
            document.getElementById('imgSetaBuscaExp').src = seta_baixo.src;
            document.getElementById('imgSetaBuscaExp').alt = "Mais opções"
            //document.getElementById('ReferenciaIndaia').focus();
        } else {
            document.getElementById('BuscaMaisExp').style.display = 'block';
            document.getElementById('imgSetaBuscaExp').src = seta_cima.src;
            document.getElementById('imgSetaBuscaExp').alt = "Ocultar Opções"
            //document.getElementById('ReferenciaIndaia').focus();
        }
    }
}

function mostra(item, item2, item3, tipo, flag_lupa, qtde_menu, qtde_subm, menu_atual, nr_ordem, nr_ordem_max) {
    //alert(item.id);
	var x = screen.width;
	var w = 500;
  if (item.style.display == 'none') {
      if (menu_atual == 'root') {
          for (var i = 0; i <= qtde_menu; i++) {
              cd_menu = 'menu' + Right('00' + i, 2);
              cd_menu_img = 'menu' + Right('00' + i, 2) + 'img';
              cd_menu_pasta = 'pasta' + Right('00' + i, 2) + 'img';
              if (document.getElementById(cd_menu)) {
                  document.getElementById(cd_menu).style.display = 'none';
                  document.getElementById(cd_menu_img).src = menu_close.src;
                  document.getElementById(cd_menu_pasta).src = pasta_close.src;
              }
              for (var j = 0; j <= qtde_subm; j++) {
                  cd_menu_subm = 'menu' + Right('00' + i, 2) + Right('00' + j, 2);
                  cd_menu_subm_img = 'menu' + Right('00' + i, 2) + Right('00' + j, 2) + 'img';
                  cd_menu_subm_pasta = 'pasta' + Right('00' + i, 2) + Right('00' + j, 2) + 'img';                  
                  if (document.getElementById(cd_menu_subm)) {
                      document.getElementById(cd_menu_subm).style.display = 'none';
                      if (document.getElementById(cd_menu_subm).vOrdem != nr_ordem_max) {
                          document.getElementById(cd_menu_subm_img).src = menu_close.src;
                      } else {
                          document.getElementById(cd_menu_subm_img).src = menu_close_fim.src;
                      }
                      document.getElementById(cd_menu_subm_pasta).src = pasta_close.src;
                  }

              }
          }
      } else {
          for (var k = 0; k <= qtde_subm; k++) {
                  cd_menu_subm = 'menu' + Right('00' + menu_atual, 2) + Right('00' + k, 2);
                  cd_menu_subm_img = 'menu' + Right('00' + menu_atual, 2) + Right('00' + k, 2) + 'img';
                  cd_menu_subm_pasta = 'pasta' + Right('00' + menu_atual, 2) + Right('00' + k, 2) + 'img';
                  if (cd_menu_subm != 'menu0109' && cd_menu_subm != 'menu0212') {
                      if (document.getElementById(cd_menu_subm)) {
                          document.getElementById(cd_menu_subm).style.display = 'none';
                          if (document.getElementById(cd_menu_subm).vOrdem != nr_ordem_max) {
                              document.getElementById(cd_menu_subm_img).src = menu_close.src;
                          } else {
                              document.getElementById(cd_menu_subm_img).src = menu_close_fim.src;
                          }
                          document.getElementById(cd_menu_subm_pasta).src = pasta_close.src;
                      }
                  }

              }
      }
	item.style.display='block';    
	if(tipo==0){
	  if (flag_lupa == 1){
		item3.src=lupa.src;
	  }else{
		item3.src=pasta_open.src;
		if (item.id == 'menu02'){
			if (document.getElementById('menu0212').style.display == 'none'){
			mostra(document.getElementById('menu0212'),document.getElementById('menu0212img'),document.getElementById('pasta0212img'),0,1);
			}
		}
		if (item.id == 'menu01'){
			if (document.getElementById('menu0109').style.display == 'none'){
			mostra(document.getElementById('menu0109'),document.getElementById('menu0109img'),document.getElementById('pasta0109img'),0,1);
			}
		}
}
    if (nr_ordem == nr_ordem_max) {
        item2.src = menu_open_fim.src;
    } else {
        item2.src = menu_open.src;
    }
    }
	//if(tipo==1) item2.src=pasta_open.src;
	if(item==menu){
	dv_corpo.style.left = 250;
	
	if(document.getElementById('divResumo')){
	 var divResumo = document.getElementById('divResumo');
	 divResumo.style.left = 250;
	}
	
	item3.background = seta_virada.src;
	
		if(document.getElementById('divInfo')){		
			var x1 = ((x-250)-w)/2;
			var x2 = Math.round(x1);
			divInfo.style.left = (x2);
			divInfoCorpo.style.left = (x2);
			divInfoRodape.style.left = (x2);
			if (document.getElementById('divFrame')){
			var divFrame = document.getElementById('divFrame');
			divFrame.style.left = (x2);
			}
		}
	}
  }
  else {
	item.style.display='none';
	if(tipo==0){
	  if (flag_lupa == 1){
		item3.src=lupa.src;
	  }else{
		item3.src=pasta_close.src;
	  }

    if (nr_ordem == nr_ordem_max) {
	      item2.src = menu_close_fim.src;
	  } else {
	      item2.src = menu_close.src;
	  }
    }
	//if(tipo==1) item2.src=pasta_close.src;
	if(item==menu){
	dv_corpo.style.left = 10;
	if(document.getElementById('divResumo')){
	 var divResumo = document.getElementById('divResumo');
	 divResumo.style.left = 10;
	}
	item3.background = seta.src;
	
		if(document.getElementById('divInfo')){
			var x1 = ((x-10)-w)/2;
			var x2 = Math.round(x1);						   
			divInfo.style.left = (x2);
			divInfoCorpo.style.left = (x2);
			divInfoRodape.style.left = (x2);
			if (document.getElementById('divFrame')){
				var divFrame = document.getElementById('divFrame');
				divFrame.style.left = (x2);
			}
		}
	}
  }
}

function CheckBusca(choice,RadioGroup1) //FUNÇÃO QUE EXIBE A OPÇÃO DE BUSCA ESCOLHIDA
{ 
if (choice==1){
	//alert(choice)
	document.all.choice=1
	};
if (choice==2){
	//alert(choice)
	document.all.choice=2	
	};
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * This array is used to remember mark status of rows in browse mode
 */
var marked_row = new Array;
/**
 * Sets/unsets the pointer and marker in browse mode
 *
 * @param   object    the table row
 * @param   integer  the row number
 * @param   string    the action calling this script (over, out or click)
 * @param   string    the default background color
 * @param   string    the color to use for mouseover
 * @param   string    the color to use for marking a row
 *
 * @return  boolean  whether pointer is set or not
 */
function setPointer(theRow, theRowNum, theAction, theDefaultColor, thePointerColor, theMarkColor)
{
/*	
    var theCells = null;

    // 1. Pointer and mark feature are disabled or the browser can't get the
    //    row -> exits
    if ((thePointerColor == '' && theMarkColor == '')
        || typeof(theRow.style) == 'undefined') {
        return false;
    }

    // 1.1 Sets the mouse pointer to pointer on mouseover and back to normal otherwise.
    if (theAction == "over" || theAction == "click") {
        theRow.style.cursor='normal';
    } else {
        theRow.style.cursor='normal';
    }

    // 2. Gets the current row and exits if the browser can't get it
    if (typeof(document.getElementsByTagName) != 'undefined') {
        theCells = theRow.getElementsByTagName('td');
    }
    else if (typeof(theRow.cells) != 'undefined') {
        theCells = theRow.cells;
    }
    else {
        return false;
    }

    // 3. Gets the current color...
    var rowCellsCnt  = theCells.length;
    var domDetect    = null;
    var currentColor = null;
    var newColor     = null;
    // 3.1 ... with DOM compatible browsers except Opera that does not return
    //         valid values with "getAttribute"
    if (typeof(window.opera) == 'undefined'
        && typeof(theCells[0].getAttribute) != 'undefined') {
        currentColor = theCells[0].getAttribute('bgcolor');
        domDetect    = true;
    }
    // 3.2 ... with other browsers
    else {
        currentColor = theCells[0].style.backgroundColor;
        domDetect    = false;
    } // end 3

    // 3.3 ... Opera changes colors set via HTML to rgb(r,g,b) format so fix it
    if (currentColor.indexOf("rgb") >= 0)
    {
        var rgbStr = currentColor.slice(currentColor.indexOf('(') + 1,
                                     currentColor.indexOf(')'));
        var rgbValues = rgbStr.split(",");
        currentColor = "#";
        var hexChars = "0123456789ABCDEF";
        for (var i = 0; i < 3; i++)
        {
            var v = rgbValues[i].valueOf();
            currentColor += hexChars.charAt(v/16) + hexChars.charAt(v%16);
        }
    }
    

    // 4. Defines the new color
    // 4.1 Current color is the default one
    if (currentColor == ''
        || currentColor.toLowerCase() == theDefaultColor.toLowerCase()) {
        if (theAction == 'over' && thePointerColor != '') {
            newColor              = thePointerColor;
        }
        else if (theAction == 'click' && theMarkColor != '') {
            newColor              = theMarkColor;
            marked_row[theRowNum] = true;
            // Garvin: deactivated onclick marking of the checkbox because it's also executed
            // when an action (like edit/delete) on a single item is performed. Then the checkbox
            // would get deactived, even though we need it activated. Maybe there is a way
            // to detect if the row was clicked, and not an item therein...
            // document.getElementById('id_rows_to_delete' + theRowNum).checked = true;
        }
    }
    // 4.1.2 Current color is the pointer one
    else if (currentColor.toLowerCase() == thePointerColor.toLowerCase()
             && (typeof(marked_row[theRowNum]) == 'undefined' || !marked_row[theRowNum])) {
        if (theAction == 'out') {
            newColor              = theDefaultColor;
        }
        else if (theAction == 'click' && theMarkColor != '') {
            newColor              = theMarkColor;
            marked_row[theRowNum] = true;
            // document.getElementById('id_rows_to_delete' + theRowNum).checked = true;
        }
    }
    // 4.1.3 Current color is the marker one
    else if (currentColor.toLowerCase() == theMarkColor.toLowerCase()) {
        if (theAction == 'click') {
            newColor              = (thePointerColor != '')
                                  ? thePointerColor
                                  : theDefaultColor;
            marked_row[theRowNum] = (typeof(marked_row[theRowNum]) == 'undefined' || !marked_row[theRowNum])
                                  ? true
                                  : null;
            // document.getElementById('id_rows_to_delete' + theRowNum).checked = false;
        }
    } // end 4

    // 5. Sets the new color...
    if (newColor) {
        var c = null;
        // 5.1 ... with DOM compatible browsers except Opera
        if (domDetect) {
            for (c = 0; c < rowCellsCnt; c++) {
                theCells[c].setAttribute('bgcolor', newColor, 0);
            } // end for
        }
        // 5.2 ... with other browsers
        else {
            for (c = 0; c < rowCellsCnt; c++) {
                theCells[c].style.backgroundColor = newColor;
            }
        }
    } // end 5

    return true;
*/    
} // end of the 'setPointer()' function

preload();

//pesquisa por palavras na pagina vizualizada
var NS4 = (document.layers);
var IE4 = (document.all);
var win = this;
var n   = 0;

function findInPage(str) {
	var txt, i, found;
	
	if (str == "") return false;
	
	if (NS4) {
		if (!win.find(str))
			while(win.find(str, false, true)) n++;
		else
			n++;
		if (n == 0) alert(str + " não está nesta página.");
	}
	
	if (IE4) {
		txt = win.document.body.createTextRange();
		for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
			txt.moveStart("character", 1);
			txt.moveEnd("textedit");
		}
		if (found) {
			txt.moveStart("character", -1);
			txt.findText(str);
			txt.select();
			txt.scrollIntoView();
			n++;
		}
		else {
			if (n > 0) {
				n = 0;
				findInPage(str);
			}
			else
				alert(str + " não foi encontrado nesta página.");
		}
	}
	return false;
}

function ApenasNumero(vEdit, vCharEspecial) {
	var vValue = vEdit.value;
	var vNum = '0123456789'+vCharEspecial;
	var vNewValue = new String;
	//busca pela string os caracteres validos
	for (i=0;i<vValue.length;i++) {
		if (vNum.indexOf(vValue.charAt(i)) > -1) {
			vNewValue = vNewValue + vValue.charAt(i);
		}
	}
	vEdit.value = vNewValue;
}

function ValidaValor(vEdit) {
	var vValue = vEdit.value;
	vValue = vValue.replace(/\./g,'');
	vValue = vValue.replace(/\,/g,'.');
	if (isNaN(vValue)) {
		alert('Digite apenas números!');
		vEdit.select();
		vEdit.focus();
	}
}

function ConsultaOnLine(vTabela, vCampos, vTitulo, vReturn, vOrdem, vEdit) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 500;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	 
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('/popup/consulta.asp?vTabela='+vTabela+'&vCampos='+vCampos+'&vTitulo='+vTitulo+'&vReturn='+vReturn+'&vOrdem='+vOrdem+'&vEdit='+vEdit,"consulta",features);
}

function ConsultaOnLineSQL(vSQL, vTitulo, vReturn, vEdit, vEditAux) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 500;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	if (vSQL == 0) vSQL = "SELECT EE.CD_EMPRESA,EE.NR_CLIENTE, EE.NM_EMPRESA, EE.AP_EMPRESA, EE.END_EMPRESA, NR_CLIENTE FROM TEMPRESA_EST EE (NOLOCK), TEMPRESA_EST_GRUPO EG (NOLOCK), TEMPRESA_NAC EN (NOLOCK) WHERE ISNULL(EE.IN_IMPORTADOR,'0') = '1' AND ISNULL(EE.IN_EXPORTADOR,'0') = '0' AND EG.CD_EMPRESA = EE.CD_EMPRESA AND EG.CD_GRUPO = EN.CD_GRUPO AND EN.CD_EMPRESA = '"+vEditAux+"' ORDER BY EE.NM_EMPRESA";
	if (vSQL == 1) vSQL = "SELECT CD_ARMAZEM, NM_ARMAZEM FROM TARMAZEM (NOLOCK) WHERE ISNULL(IN_ESTOCAGEM,'0') = '1' ORDER BY NM_ARMAZEM";
	if (vSQL == 2) vSQL = "SELECT NR_CLIENTE,CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE ISNULL(IN_BANCO,'0') = '1' ORDER BY NM_EMPRESA";
	if (vSQL == 3) vSQL = "SELECT CD_EMPRESA,NR_CLIENTE, NM_EMPRESA, AP_EMPRESA, END_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE ISNULL(IN_AGENTE,'0') = '1' ORDER BY NM_EMPRESA";
	if (vSQL == 4) vSQL = "SELECT DISTINCT E.CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA, CGC_EMPRESA FROM TEMPRESA_NAC E (NOLOCK), TPERMISSAO_GRUPO P (NOLOCK) WHERE P.CD_GRUPO = E.CD_GRUPO AND P.CD_USUARIO = '"+vCodUser+"' AND E.IN_EXPORTADOR='1' ORDER BY E.NM_EMPRESA"
	if (vSQL == 5) vSQL = "SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.NM_LOCAL_EMB, A.NM_ARMAZEM, V.NR_MANIFESTO FROM TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) WHERE V.CD_UNID_NEG = '01' AND V.CD_PRODUTO = '02' AND V.CD_EMBARCACAO = '"+vEditAux+"' AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND V.CD_LOCAL = E.CD_LOCAL_EMB ORDER BY V.DT_ESPERADA DESC";
	if (vSQL == 6) vSQL = "SELECT DISTINCT EE.CD_EMPRESA,EE.NR_CLIENTE,EE.NM_EMPRESA, EE.AP_EMPRESA, EE.END_EMPRESA, EE.NR_CLIENTE FROM TEMPRESA_EST EE (NOLOCK), TEMPRESA_EST_GRUPO EG (NOLOCK), TEMPRESA_NAC EN (NOLOCK) WHERE ISNULL(EE.IN_IMPORTADOR,'0') = '1' AND ISNULL(EE.IN_EXPORTADOR,'0') = '0'  AND EG.CD_EMPRESA = EE.CD_EMPRESA  AND EG.CD_GRUPO = EN.CD_GRUPO  AND (((EN.CD_GRUPO) IN (SELECT P.CD_GRUPO FROM TPERMISSAO_GRUPO P (NOLOCK) WHERE P.CD_USUARIO = '1462')) OR  ((SELECT CD_CARGO FROM TUSUARIO U (NOLOCK) WHERE CD_USUARIO = '1462') NOT IN ('040', '055', '060'))) ORDER BY EE.NM_EMPRESA";
	if (vSQL == 7) vSQL = "SELECT DISTINCT T.CD_TERMO_PAGTO, T.NM_TERMO_PAGTO FROM TTERMO_PAGTO T (NOLOCK), TDE_PARA D (NOLOCK) WHERE D.CD_DDBROKER = T.CD_TERMO_PAGTO AND D.CD_TABELA = '22'";
	if (vSQL == 8) vSQL = "SELECT DISTINCT EE.CD_EMPRESA,EE.NR_CLIENTE, EE.NM_EMPRESA, EE.AP_EMPRESA, EE.END_EMPRESA FROM TEMPRESA_EST EE (NOLOCK), TEMPRESA_EST_GRUPO EG (NOLOCK), TEMPRESA_NAC EN (NOLOCK), TPERMISSAO_GRUPO P (NOLOCK) WHERE ISNULL(EE.IN_AGENTE,'0') = '1' AND EG.CD_EMPRESA = EE.CD_EMPRESA AND EG.CD_GRUPO = EN.CD_GRUPO AND EN.CD_GRUPO = P.CD_GRUPO AND P.CD_USUARIO = '"+vCodUser+"' ORDER BY EE.NM_EMPRESA";
	if (vSQL == 9) vSQL = "SELECT DISTINCT EE.NR_CLIENTE,EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA, EE.END_EMPRESA FROM TEMPRESA_EST EE (NOLOCK), TEMPRESA_EST_GRUPO EG (NOLOCK), TEMPRESA_NAC EN (NOLOCK), TPERMISSAO_GRUPO P (NOLOCK) WHERE ISNULL(EE.IN_AGENTE,'0') = '1' AND EG.CD_EMPRESA = EE.CD_EMPRESA AND EG.CD_GRUPO = EN.CD_GRUPO AND EN.CD_GRUPO = P.CD_GRUPO AND P.CD_USUARIO = '"+vCodUser+"' ORDER BY EE.NM_EMPRESA";
	if (vSQL == 10) vSQL = "SELECT * FROM TMERCADORIA_EXP WHERE CD_GRUPO='155'"
	if (vSQL == 11) vSQL = "SELECT * FROM  TEMPRESA_EST TE (NOLOCK) INNER JOIN TEMPRESA_EST_GRUPO TEG (NOLOCK)ON (TEG.CD_GRUPO='155') WHERE TE.CD_EMPRESA=TEG.CD_EMPRESA"
	if (vSQL == 12) vSQL = "SELECT * FROM TAREA"
	if (vSQL == 13) vSQL = "SELECT * FROM TPAIS_BROKER"
	if (vSQL == 14) vSQL = "SELECT * FROM TLOCAL_EMBARQUE"
	if (vSQL == 15) vSQL = "SELECT * FROM TEMBARCACAO"
	if (vSQL == 16) vSQL = "SELECT * FROM TTP_CNTR"	
	if (vSQL == 17) vSQL = "SELECT * FROM TMERCADORIA_EXP TME, TFAMILIA_PROD TFP WHERE TME.CD_FAMILIA_PROD=TFP.CD_FAMILIA_PROD"	




	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('/popup/consulta.asp?vSQL='+vSQL+'&vTitulo='+vTitulo+'&vReturn='+vReturn+'&vEdit='+vEdit,"consulta",features);
}

if (document.captureEvents && Event.KEYUP) document.captureEvents( Event.KEYUP );

function trataEvento(e) {
	if (!e) {
		if( window.event ) e = window.event; else return;
	}
	if (typeof(e.keyCode) == 'number') e = e.keyCode; //DOM
	else if (typeof(e.which) == 'number') e = e.which; //NS 4 compatible
	else if (typeof(e.charCode) == 'number') e = e.charCode; //also NS 6+, Mozilla 0.9+
	else return;
	return e;
}

function TravaKey(nEvent, nKey) {
	var whichCode = trataEvento(nEvent);
	if (whichCode == nKey) return false;
}

function MascaraValor(objValor, nSepMil, nSepDec, nPrec, nEvent){
	var len = len2 = 0;
	var aux = aux2 = '';
	var strCheck = '0123456789';
	var whichCode = trataEvento(nEvent);
	//caso o enter seja apertado
	if (whichCode == 13) return true;
	len = objValor.value.length;
	//se não for backspace ou delete
	if (whichCode != 8 || whichCode != 46) {
		key = String.fromCharCode(whichCode); // Valor para o código da Chave
		if (strCheck.indexOf(key) == -1) return false; // Chave inválida
		for(i = 0; i < len; i++)
			if ((objValor.value.charAt(i) != '0') && (objValor.value.charAt(i) != nSepDec)) break;
		for(; i < len; i++)
			if (strCheck.indexOf(objValor.value.charAt(i))!=-1) aux += objValor.value.charAt(i);
		aux += key;
		len = aux.length;
	}
	if (len == 0) objValor.value = '0,00';
	if (len == 1) objValor.value = '0'+ nSepDec + '0' + aux;
	if (len == 2) objValor.value = '0'+ nSepDec + aux;
	if (len > 2) {
		for (j = 0, i = len - (nPrec+1); i >= 0; i--) {
			if (j == 3) {
				aux2 += nSepMil;
				j = 0;
			}
			aux2 += aux.charAt(i);
			j++;
		}
		objValor.value = '';
		len2 = aux2.length;
		for (i = len2 - 1; i >= 0; i--)
			objValor.value += aux2.charAt(i);
		objValor.value += nSepDec + aux.substr((len - nPrec), len);
	} 
	return false;
}

function MascaraData(objValor, nSeparador, nEvent){
	var len = len2 = 0;
	var aux = aux2 = '';
	var strCheck = '0123456789';
	var whichCode = trataEvento(nEvent);
	if (whichCode == 13) return true;
	len = objValor.value.length;
	//se não for backspace ou delete
	if (whichCode != 8 || whichCode != 46) {
		key = String.fromCharCode(whichCode); // Valor para o código da Chave
		if (strCheck.indexOf(key) == -1) return false; // Chave inválida
		for(i = 0; i < len; i++)
			if (objValor.value.charAt(i) != nSeparador) break;
		aux = '';
		for(; i < len; i++)
			if (strCheck.indexOf(objValor.value.charAt(i))!=-1) aux += objValor.value.charAt(i);
		aux += key;
		len = aux.length;
	}
	if (len == 0) objValor.value = '';
	if (len > 0 && len <= 8) {
		aux2 = '';
		for (i = 0; i <= len; i++) {
			if (i == 2) aux2 += nSeparador;
			if (i == 4) aux2 += nSeparador;
			aux2 += aux.charAt(i);
		}
		objValor.value = aux2;
	}
	return false;
}

String.PAD_LEFT  = 0;
String.PAD_RIGHT = 1;
String.PAD_BOTH  = 2;

String.prototype.pad = function(size, pad, side) {
  var str = this, append = "", size = (size - str.length);
  var pad = ((pad != null) ? pad : " ");
  if ((typeof size != "number") || ((typeof pad != "string") || (pad == ""))) {
    throw new Error("Wrong parameters for String.pad() method.");
  }
  if (side == String.PAD_BOTH) {
    str = str.pad((Math.floor(size / 2) + str.length), pad, String.PAD_LEFT);
    return str.pad((Math.ceil(size / 2) + str.length), pad, String.PAD_RIGHT);
  }
  while ((size -= pad.length) > 0) {
    append += pad;
  }
  append += pad.substr(0, (size + pad.length));
  return ((side == String.PAD_LEFT) ? append.concat(str) : str.concat(append));
}

Number.prototype.format = function(d_len, d_pt, t_pt) {
  var d_len = d_len || 0;
  var d_pt = d_pt || ".";
  var t_pt = t_pt || ",";
  if ((typeof d_len != "number") || (typeof d_pt != "string") || (typeof t_pt != "string")) {
    throw new Error("wrong parameters for method 'String.pad()'.");
  }
  var integer = "", decimal = "";
  var n = new String(this).split(/\./), i_len = n[0].length, i = 0;
  if (d_len > 0) {
    n[1] = (typeof n[1] != "undefined") ? n[1].substr(0, d_len) : "";
    decimal = d_pt.concat(n[1].pad(d_len, "0", String.PAD_RIGHT));
  }
  while (i_len > 0) {
    if ((++i % 3 == 1) && (i_len != n[0].length)) {
      integer = t_pt.concat(integer);
    }
    integer = n[0].substr(--i_len, 1).concat(integer);
  }
  return (integer + decimal);
}


/**
* Formata o Campo de acordo com a mascara informada.
* Ex de uso: onkeyup="AplicaMascara('00:00:00', this);".
* @author Igor Escobar (blog@igorescobar.com)
* @param Mascara String que possui a mascara de formatação do campo.
* @param elemento Campo que será formatado de acordo com a mascara, voce pode informar o id direto ou o próprio elemento usando o this.
* @returns {void}
*/
function AplicaMascara(Mascara, elemento){
    
    // Seta o elemento
    var elemento = (elemento) ? elemento : document.getElementById(elemento); 
    if(!elemento) return false;
    
    // Método que busca um determinado caractere ou string dentro de uma Array
    function in_array( oque, onde ){
            for(var i = 0 ; i <onde.length; i++){
            if(oque == onde[i]){
                return true;
            }
        }
        return false;
    }
    // Informa o array com todos os caracteres que podem ser considerados caracteres de mascara
    var SpecialChars = [':', '-', '.', '(',')', '/', ',', '_'];
    var oValue = elemento.value;
    var novo_valor = "";
    for( i = 0 ; i <oValue.length; i++){
        //Recebe o caractere de mascara atual
        var nowMask = Mascara.charAt(i);
        //Recebe o caractere do campo atual
        var nowLetter = oValue.charAt(i);
        //Aplica a masca
        if(in_array(nowMask, SpecialChars) == true && nowLetter != nowMask){
            novo_valor +=  nowMask + '' + nowLetter;
        } else {
            novo_valor += nowLetter;
        }
        // Remove regras duplicadas
        var DuplicatedMasks = nowMask+''+nowMask;
        while (novo_valor.indexOf(DuplicatedMasks)>= 0) {
         novo_valor = novo_valor.replace(DuplicatedMasks, nowMask);
        }
    }
    // Retorna o valor do elemento com seu novo valor
    elemento.value = novo_valor;
    
} 

function numerico(e) {
if(window.event) {
// for IE, e.keyCode or window.event.keyCode can be used
key = e.keyCode;
}
else if(e.which) {
// netscape
key = e.which;
}
if (key!=8 || key < 48 || key > 57) return (((key > 47) && (key < 58)) || (key==8));
{
    return true;
  }
}

var iCount = 0;
var filtro_usado;
var contador_usado;

function selectOrdenacao(valor) {
    if (valor != 'X') {
        document.getElementById('img_ordenacao2').style.display = 'none';
        document.getElementById('img_ordenacao').style.display = 'block';
    } else {
        document.getElementById('img_ordenacao').style.display = 'none';
        document.getElementById('img_ordenacao2').style.display = 'block';
        document.getElementById('img_ordenacao2').style.visibility = 'hidden';
    }
}

function fnc_comboEdt(item, objeto) {
    if (eval("document.getElementById('contador_" + item + "')")) {
        if (objeto.value != 3 && objeto.value != 4) {
            eval("document.frmbusca.img_" + item + ".style.display='block'");
            eval("document.frmbusca.img_" + item + "2.style.display='none'");
        } else {
            eval("document.frmbusca.img_" + item + ".style.display='none'");
            eval("document.frmbusca.img_" + item + "2.style.display='block'");
        }
    }

    if (objeto.value == 2) {
        eval("document.frmbusca." + item + ".style.display='none'");
        eval("document.frmbusca.edt_" + item + ".style.display='block'");
        eval("document.frmbusca.edt_" + item + ".focus();");
        eval("escreveValor(\"" + item + "\", document.getElementById(\"combo_aux_" + item + "\"),2)");
    } else {
        if (eval("document.getElementById('controle_" + item + "').value") == "combo") {
            if ('<%= in_ultima_pesquisa%>' != '1') {
                eval("escreveValor(\"" + item + "\", document.getElementById(\"combo_aux_" + item + "\"),3)");
            }
        } else {
            if ('<%= in_ultima_pesquisa%>' != '1') {
                eval("escreveValor(\"" + item + "\", document.getElementById(\"combo_aux_" + item + "\"),1)");
            }
        }
        if (objeto.value == 5) {
            eval("document.frmbusca.edt_" + item + ".style.display='none'");
            eval("document.frmbusca." + item + ".style.display='block'");
            if (document.getElementById(item).length > 0) {
                var x = document.getElementById(item);
                if (x.options[0].value == 'X') {
                    x.remove(x.options[1].item);
                }
            }
        } else {
            eval("document.frmbusca.edt_" + item + ".style.display='none'");
            eval("document.frmbusca." + item + ".style.display='block'");
            if (document.getElementById(item).length > 0) {
                var x = document.getElementById(item);
                if (x.options[0].value != 'X') {
                    var Opt = document.createElement('option');
                    Opt.text = '<%= tx_lang_A00022(cd_lang)%>';
                    Opt.value = 'X';
                    x.add(Opt, 0);
                }
            }
        }
    }
}

function fnc_desabilitaCombo() {
    if (document.getElementById('ordenacao').value != 'X') {
        exibeInfo('ordenacao');
        escreveValor('ordenacao', document.getElementById('tipo_ordenacao'), 6);
        document.getElementById('img_ordenacao2').style.display = 'none';
        document.getElementById('img_ordenacao').style.display = 'block';
    } else {
        exibeInfo('ordenacao');
        escreveValor('ordenacao', document.getElementById('tipo_ordenacao'), 6);
        document.getElementById('img_ordenacao').style.display = 'none';
        document.getElementById('img_ordenacao2').style.display = 'block';
        document.getElementById('img_ordenacao2').style.visibility = 'hidden';
    }

    for (i = 0; i < document.frmbusca.filtro.length; i++) {
        if (document.frmbusca.filtro[i].checked) {
            eval("exibeInfo('" + document.frmbusca.filtro[i].value + "')");
            if (eval("document.getElementById('contador_" + document.frmbusca.filtro[i].value + "')")) {
                eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=false');
                eval("document.frmbusca.img_" + document.frmbusca.filtro[i].value + ".style.display='block';");
                eval("document.frmbusca.img_" + document.frmbusca.filtro[i].value + "2.style.display='none';");
                eval("document.all.camposTexto_" + document.frmbusca.filtro[i].value + ".style.display='block'");
                eval("document.all.Texto_" + document.frmbusca.filtro[i].value + ".style.display='block'");
                if ('<%= in_ultima_pesquisa%>' != '1') {
                    eval('document.frmbusca.contador_' + document.frmbusca.filtro[i].value + '.value = 0');
                    eval('document.frmbusca.contador_total_' + document.frmbusca.filtro[i].value + '.value = 0');
                } else {
                    eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=true');
                }

                if (eval("document.getElementById('controle_" + document.frmbusca.filtro[i].value + "').value") == "combo") {
                    if ('<%= in_ultima_pesquisa%>' != '1') {
                        eval("escreveValor(\"" + document.frmbusca.filtro[i].value + "\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),3)");
                    }
                } else {
                    if (eval("document.getElementById('combo_aux_" + document.frmbusca.filtro[i].value + "').value") == 2) {
                        if ('<%= in_ultima_pesquisa%>' != '1') {
                            eval("escreveValor(\"" + document.frmbusca.filtro[i].value + "\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),2)");
                        }
                    } else {
                        if ('<%= in_ultima_pesquisa%>' != '1') {
                            eval("escreveValor(\"" + document.frmbusca.filtro[i].value + "\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),1)");
                        }
                    }
                }
                fnc_comboEdt(document.frmbusca.filtro[i].value, eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value));
            }
        } else {
            eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=true');
        }
    }
}


function carregaPesquisa(cd_view, pagina) {
    document.location = pagina + '.asp?cd_menu=' + Right('00'+cd_view.substring(5, 7),2) + '&cd_subm=' + Right('00'+cd_view.substring(7, 9),2) + '&cd_view=' + cd_view + '&ultima_pesquisa=1';
}

function retiraCombo(filtro, linha, linha_ou, linha_tipo, tipo) {
    if (filtro != 'ordenacao') {
        if (eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4) {
            var combo_aux_valor = eval("document.getElementById('combo_aux_" + filtro + "').value;");
            var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
            var div = eval("document.getElementById('camposTexto_" + filtro + "');");
            var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
            var linha = document.getElementById(linha);
            var linha_ou = document.getElementById(linha_ou);

            if (contador != 0) {
                var removido = div.removeChild(linha);
                var removido_ou = div_ou.removeChild(linha_ou);

                iCount--;
                contador--;
                eval('document.frmbusca.contador_' + filtro + '.value =' + contador);
                if (eval('document.frmbusca.contador_' + filtro + '.value') == 0) {
                    eval('document.frmbusca.contador_total_' + filtro + '.value = 0');
                    eval("document.all.camposTexto_" + filtro + ".style.display='none'");
                    eval("document.all.Texto_" + filtro + ".style.display='none'");
                    if (combo_aux_valor != 2 && tipo == 1) {
                        eval("document.getElementById('" + filtro + "').focus();");
                        eval('document.frmbusca.' + filtro + '.focus();');
                        eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                    } else {
                        if (tipo == 1) {
                            eval("document.getElementById('edt_" + filtro + "').focus();");
                            eval('document.frmbusca.edt_' + filtro + '.focus();');
                            eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                        }
                    }
                } else {
                    if (combo_aux_valor != 2 && tipo == 1) {
                        eval("document.getElementById('" + filtro + "').focus();");
                        eval('document.frmbusca.' + filtro + '.focus();');
                        eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                    } else {
                        if (tipo == 1) {
                            eval("document.getElementById('edt_" + filtro + "').focus();");
                            eval('document.frmbusca.edt_' + filtro + '.focus();');
                            eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                        }
                    }
                }
            } else {
                alert('ERRO: Por favor, atualize a página');
            }
        }
    } else {
        var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
        var div = eval("document.getElementById('camposTexto_" + filtro + "');");
        var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
        var linha = document.getElementById(linha);
        var linha_ou = document.getElementById(linha_ou);
        var removido = div.removeChild(linha);
        var removido_ou = div_ou.removeChild(linha_ou);
        var div_tipo = eval("document.getElementById('divtipo_" + filtro + "');");
        var linha_tipo = document.getElementById(linha_tipo);
        var removido_tipo = div_tipo.removeChild(linha_tipo);
        iCount--;
        contador--;


        eval('document.frmbusca.contador_' + filtro + '.value =' + contador);

        if (eval('document.frmbusca.contador_' + filtro + '.value') == 0) {
            eval('document.frmbusca.contador_total_' + filtro + '.value = 0');
            eval("document.all.camposTexto_" + filtro + ".style.display='none'");
            eval("document.all.divtipo_" + filtro + ".style.display='none'");
            eval("document.all.Texto_" + filtro + ".style.display='none'");
            eval("document.getElementById('" + filtro + "').focus();");
            eval('document.frmbusca.' + filtro + '.focus();');
        } else {
            eval("document.getElementById('" + filtro + "').focus();");
            eval('document.frmbusca.' + filtro + '.focus();');
        }
    }
}

function criaCombo(tamanho, filtro, combo_aux) {
    if (filtro != 'ordenacao') {
        if (eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4) {
            eval('document.frmbusca.aux_combo_aux_' + filtro + '.value=' + combo_aux.value);
            eval('document.frmbusca.combo_aux_' + filtro + '.disabled=true');
            eval("document.all.camposTexto_" + filtro + ".style.display='block'");
            eval("document.all.Texto_" + filtro + ".style.display='block'");
            var div_filtro = eval("document.getElementById('camposTexto_" + filtro + "');");
            var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
            var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
            var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');
            var texto_aux = '';
            var texto_total = '';
            var total_combo = eval("document.frmbusca." + filtro + ".options.length");

            if ((combo_aux.value) != 2) {
                var linha_combo = "<div id='linha" + filtro + contador + "'><select class='select' name='" + filtro + "_" + contador + "'   style='width:" + (tamanho - 17) + "px;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",0,1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\"" + filtro + "\", document.getElementById(\"aux_combo_aux_" + filtro + "\"),3)'>";


                //alert(contador_total);
                //alert(linha_combo);

                if ((combo_aux.value) != 5) {
                    for (cont = 1; cont < total_combo; cont++) {
                        texto_aux = "<option value='" + eval("document.frmbusca." + filtro + ".options[" + cont + "].value") + "'>" + eval("document.frmbusca." + filtro + ".options[" + cont + "].text") + "</option>";
                        texto_total = texto_total + texto_aux;
                    } 
                } else {
                    for (cont = 0; cont < total_combo; cont++) {
                        texto_aux = "<option value='" + eval("document.frmbusca." + filtro + ".options[" + cont + "].value") + "'>" + eval("document.frmbusca." + filtro + ".options[" + cont + "].text") + "</option>";
                        texto_total = texto_total + texto_aux;
                    } 
                }


                var linha_imagem = "</select><a href='#' onClick='retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",0,1)'><img src='/imagens/30/btn_menos.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>";
                linha_combo = linha_combo + texto_total + linha_imagem;

                if ((combo_aux.value) != 5) {
                    var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";
                } else {
                    var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV004(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";
                }

                div_ou.innerHTML = div_ou.innerHTML + linha_ou;
                div_filtro.innerHTML = div_filtro.innerHTML + linha_combo;
                eval("document.getElementById('" + filtro + "_" + contador + "').focus();");
                eval('document.frmbusca.' + filtro + "_" + contador + '.focus();');

            } else {
                var linha_combo = "<div id='linha" + filtro + contador + "'><input class='editbox' type='text' name='edt_" + filtro + "_" + contador + "'   style='width:" + (tamanho - 17) + "px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",0,1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\"" + filtro + "\",document.getElementById(\"aux_combo_aux_" + filtro + "\"),2);'><a href='#' onClick='retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",1)'><img src='/imagens/30/btn_menos.gif' style='border:0;' alt='<%=tx_lang_TF018(cd_lang)%>' class='top' ></a></div>";
                var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";

                div_ou.innerHTML = div_ou.innerHTML + linha_ou;
                div_filtro.innerHTML = div_filtro.innerHTML + linha_combo;
                eval("document.getElementById('edt_" + filtro + "_" + contador + "').focus();");
                eval('document.frmbusca.edt_' + filtro + "_" + contador + '.focus();');
            }

            iCount++;
            contador++;
            contador_total++;
            eval('document.frmbusca.contador_' + filtro + '.value =' + contador);
            eval('document.frmbusca.contador_total_' + filtro + '.value =' + contador_total);
        }
    } else {
        if (document.getElementById('ordenacao').value != 'X') {
            eval("document.all.camposTexto_" + filtro + ".style.display='block'");
            eval("document.all.Texto_" + filtro + ".style.display='block'");
            eval("document.all.divtipo_" + filtro + ".style.display='block'");
            var div_filtro = eval("document.getElementById('camposTexto_" + filtro + "');");
            var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
            var div_tipo = eval("document.getElementById('divtipo_" + filtro + "');");
            var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
            var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');
            var texto_aux = '';
            var texto_total = '';
            var total_combo = eval("document.frmbusca." + filtro + ".options.length");

            var linha_combo = "<div id='linha" + filtro + contador + "'><select class='select' name='" + filtro + "_" + contador + "'   style='width:" + (tamanho - 17) + "px;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",\"linha_tipo" + filtro + contador + "\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\",this);return false;}' onBlur='escreveValor(\"" + filtro + "\",document.getElementById(\"tipo_" + filtro + "\"),6);'>";

            for (cont = 1; cont < total_combo; cont++) {
                texto_aux = "<option value='" + eval("document.frmbusca." + filtro + ".options[" + cont + "].value") + "'>" + eval("document.frmbusca." + filtro + ".options[" + cont + "].text") + "</option>";
                texto_total = texto_total + texto_aux;
            }

            var linha_imagem = "</select><a href='#' onClick='retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",\"linha_tipo" + filtro + contador + "\",1)'><img src='/imagens/30/btn_menos.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>";
            linha_combo = linha_combo + texto_total + linha_imagem;

            var linha_ou = "<div id='linha_ou" + filtro + contador + "'><nobr><%= tx_lang_004071(cd_lang)%></nobr><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";

            var linha_tipo = "<div id='linha_tipo" + filtro + contador + "'><select class='select' style='width:90px;' name='tipo_ordenacao_" + contador + "' id='tipo_ordenacao_" + contador + "' onBlur='escreveValor(\"" + filtro + "\",document.getElementById(\"tipo_" + filtro + "\"),6);'><option value='0'><%=tx_lang_004069(cd_lang)%></option><option value='1'><%=tx_lang_004070(cd_lang)%></option></select></div>";


            div_ou.innerHTML = div_ou.innerHTML + linha_ou;
            div_tipo.innerHTML = div_tipo.innerHTML + linha_tipo;
            div_filtro.innerHTML = div_filtro.innerHTML + linha_combo;

            iCount++;
            contador++;
            contador_total++;
            eval('document.frmbusca.contador_' + filtro + '.value =' + contador);
            eval('document.frmbusca.contador_total_' + filtro + '.value =' + contador_total);
        }
    }
}


function retiraEdit(filtro, linha, linha_ou, tipo, img) {
    if (eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4) {
        var combo_aux_valor = eval("document.getElementById('combo_aux_" + filtro + "').value;");
        var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
        var div = eval("document.getElementById('camposTexto_" + filtro + "');");
        var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
        var linha = document.getElementById(linha);
        var linha_ou = document.getElementById(linha_ou);
        var removido = div.removeChild(linha);
        var removido_ou = div_ou.removeChild(linha_ou);

        iCount--;
        contador--;

        eval('document.frmbusca.contador_' + filtro + '.value =' + contador);

        if (eval('document.frmbusca.contador_' + filtro + '.value') == 0) {
            eval('document.frmbusca.contador_total_' + filtro + '.value = 0');
            eval("document.all.camposTexto_" + filtro + ".style.display='none'");
            eval("document.all.Texto_" + filtro + ".style.display='none'");
            if (combo_aux_valor != 2 && tipo == 1) {
                eval("document.getElementById('" + filtro + "').focus();");
                eval('document.frmbusca.' + filtro + '.focus();');
                eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
            } else {
                if (tipo == 1) {
                    eval("document.getElementById('edt_" + filtro + "').focus();");
                    eval('document.frmbusca.edt_' + filtro + '.focus();');
                    eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                }
            }
        } else {
            if (combo_aux_valor != 2 && tipo == 1) {
                eval("document.getElementById('" + filtro + "').focus();");
                eval('document.frmbusca.' + filtro + '.focus();');
                eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
            } else {
                if (tipo == 1) {
                    eval("document.getElementById('edt_" + filtro + "').focus();");
                    eval('document.frmbusca.edt_' + filtro + '.focus();');
                    eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
                }
            }
        }
    }
}


function criaEdit(tamanho, filtro, combo_aux) {
    if (eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4) {
        eval('document.frmbusca.aux_combo_aux_' + filtro + '.value=' + combo_aux.value);
        eval('document.frmbusca.combo_aux_' + filtro + '.disabled=true');
        eval("document.all.camposTexto_" + filtro + ".style.display='block'");
        eval("document.all.Texto_" + filtro + ".style.display='block'");
        var div_filtro = eval("document.getElementById('camposTexto_" + filtro + "');");
        var div_ou = eval("document.getElementById('Texto_" + filtro + "');");
        var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
        var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');

        alert(contador);
        alert(contador_total);

        if ((combo_aux.value) != 2) {
            var linha_edit = "<div id='linha" + filtro + contador + "'><input class='editbox' type='text' name='" + filtro + "_" + contador + "'   style='width:" + (tamanho - 17) + "px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraEdit(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaEdit(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\"" + filtro + "\", document.getElementById(\"aux_combo_aux_" + filtro + "\"),1)'><a href='#' onClick='retiraEdit(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",1)'><img src='/imagens/30/btn_menos.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>";


            if ((combo_aux.value) != 5) {
                var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";
            } else {
                var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV004(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";
            }

            div_ou.innerHTML = div_ou.innerHTML + linha_ou;
            div_filtro.innerHTML = div_filtro.innerHTML + linha_edit;

            eval("document.getElementById('" + filtro + "_" + contador + "').focus();");
            //eval("document.frmbusca." + filtro + "_" + contador + ".focus();");
        } else {

            var linha_edit = "<div id='linha" + filtro + contador + "'><input class='editbox' type='text' name='edt_" + filtro + "_" + contador + "'   style='width:" + (tamanho - 17) + "px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\"" + filtro + "\",document.getElementById(\"aux_combo_aux_" + filtro + "\"),2)'><a href='#' onClick='retiraEdit(\"" + filtro + "\"" + ",\"linha" + filtro + contador + "\",\"linha_ou" + filtro + contador + "\",1)'><img src='/imagens/30/btn_menos.gif' style='border:0;' alt='<%=tx_lang_TF018(cd_lang)%>' class='top' ></a></div>";
            var linha_ou = "<div id='linha_ou" + filtro + contador + "'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>";

            div_ou.innerHTML = div_ou.innerHTML + linha_ou;
            div_filtro.innerHTML = div_filtro.innerHTML + linha_edit;
            eval("document.getElementById('edt_" + filtro + "_" + contador + "').focus();");
            //eval("document.frmbusca.edt_" + filtro + "_" + contador + ".focus();");
        }

        iCount++;
        contador++;
        contador_total++;

        alert(contador);
        alert(contador_total);
        
        eval('document.frmbusca.contador_' + filtro + '.value =' + contador);
        eval('document.frmbusca.contador_total_' + filtro + '.value =' + contador_total);

    }
}

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
    if (document.getElementById) {
        var div_info = document.getElementById(vDiv1);
        var div_info_corpo = document.getElementById(vDiv2);
        var div_info_rodape = document.getElementById(vDiv3);
        var div_frame = document.getElementById('divFrame');
        div_info.style.display = "none";
        div_info_corpo.style.display = "none";
        div_info_rodape.style.display = "none";
        div_frame.style.visibility = "hidden";
    }
}

function ExibeDetalhes(vDiv, vDiv2, vDiv3, tipo) {
    if (document.getElementById) {
        if (tipo == 2) {
            document.getElementById('submit_resumo').style.visibility = 'hidden';
        } else {
            document.getElementById('submit_resumo').style.visibility = 'visible';
        }
        //recupera os objetos do form que vamos trabalhar
        var x = screen.width;
        var y = screen.height;

        var w = 530;
        var z = 300;
        var div_info = document.getElementById(vDiv);
        var div_info_corpo = document.getElementById(vDiv2);
        var div_info_rodape = document.getElementById(vDiv3);
        var div_frame = document.getElementById('divFrame');


        var y1 = (y / 5);
        var y2 = Math.round(y1);
        var y3 = ((y - y2) - z) / 2;
        var y4 = Math.round(y3);

        var x1 = ((x - 250) - w) / 2;
        var x2 = Math.round(x1);
        //alert(div_info.style.width);
        //alert(x);//1280
        //alert(y);//1024
        div_frame.style.width = w;
        div_frame.style.height = z;
        div_frame.style.left = (x2);
        div_frame.style.top = ((y4) / 2) - 26;
        div_frame.style.visibility = "visible";
        div_frame.style.filter = "alpha(opacity=0)";


        div_info.style.width = w;
        div_info.style.height = 26;
        div_info.style.left = (x2);
        div_info.style.top = ((y4) / 2) - 26;
        div_info.style.display = "block";
        div_info.style.filter = "alpha(opacity=92)";

        div_info_corpo.style.width = w;
        div_info_corpo.style.height = z;
        div_info_corpo.style.left = (x2);
        div_info_corpo.style.top = ((y4) / 2) - 2;
        div_info_corpo.style.display = "block";
        div_info_corpo.style.filter = "alpha(opacity=91)";

        div_info_rodape.style.width = w;
        div_info_rodape.style.height = 26;
        div_info_rodape.style.left = (x2);
        div_info_rodape.style.top = ((y4) / 2) + 298;
        div_info_rodape.style.display = "block";
        div_info_rodape.style.filter = "alpha(opacity=92)";

    }
}

function escreveValor(filtro, combo_valor, tipo) {
    if (combo_valor.id != 'tipo_ordenacao') {
        var combo_valor = combo_valor.value;
        if (combo_valor == 1) {
            var texto = "<%=tx_lang_TF002(cd_lang) %> "
            var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
        } else {
            if (combo_valor == 2) {
                var texto = "<%=tx_lang_TF003(cd_lang) %> "
                var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
            } else {
                if (combo_valor == 3) {
                    var texto = "<%=tx_lang_TF005(cd_lang) %> "
                    var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
                } else {
                    if (combo_valor == 4) {
                        var texto = "<%=tx_lang_TF006(cd_lang) %> "
                        var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
                    } else {
                        if (combo_valor == 5) {
                            var texto = "<%=tx_lang_TF004(cd_lang) %> "
                            var texto2 = " <%=tx_lang_CV004(cd_lang)%> "
                        }
                    }
                }

            }
        }
    } else {
        if (combo_valor.value == 0) {
            var texto = "<%=tx_lang_004069(cd_lang) %>"
        } else {
            var texto = "<%=tx_lang_004070(cd_lang) %>"
        }
        var texto2 = " <%=tx_lang_004071(cd_lang)%> "
    }

    if (tipo == 1) {
        var valor_atual = "";
        var valor1 = eval("document.getElementById('" + filtro + "').value");

        if (valor1 == "") {
            valor1 = "(<%=tx_lang_TF009(cd_lang)%>)";
        }

        if (eval("document.getElementById('contador_total_" + filtro + "')")) {
            var total_filtro = eval("document.getElementById('contador_total_" + filtro + "').value");

            if (total_filtro >= 1) {
                for (i = 0; i <= (total_filtro - 1); i++) {
                    if (eval("document.getElementById('" + filtro + "_" + i + "')")) {
                        valor = eval("document.getElementById('" + filtro + "_" + i + "').value");

                        if (valor == "") {
                            valor = "(<%=tx_lang_TF009(cd_lang)%>)";
                        }

                        valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b>";
                    }
                }
            }
        }

        valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;
    } else {
        if (tipo == 2) {
            var valor_atual = "";
            var valor1 = eval("document.getElementById('edt_" + filtro + "').value");

            if (valor1 == "") {
                valor1 = "(<%=tx_lang_TF009(cd_lang)%>)";
            }
            if (eval("document.getElementById('contador_total_" + filtro + "')")) {
                var total_filtro = eval("document.getElementById('contador_total_" + filtro + "').value");
                if (total_filtro >= 1) {
                    for (i = 0; i <= (total_filtro - 1); i++) {
                        if (eval("document.getElementById('edt_" + filtro + "_" + i + "')")) {
                            valor = eval("document.getElementById('edt_" + filtro + "_" + i + "').value");

                            if (valor == "") {
                                valor = "(<%=tx_lang_TF009(cd_lang)%>)";
                            }
                            valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b>";
                        }
                    }
                }
            }
            valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;
        } else {
            if (tipo == 3) {
                var valor_atual = "";
                var valor1 = eval("document.getElementById('" + filtro + "').options[eval(document.getElementById('" + filtro + "').selectedIndex)].text");
                if (eval("document.getElementById('contador_total_" + filtro + "')")) {
                    var total_filtro = eval("document.getElementById('contador_total_" + filtro + "').value");

                    if (total_filtro >= 1) {
                        for (i = 0; i <= (total_filtro - 1); i++) {
                            if (eval("document.getElementById('" + filtro + "_" + i + "')")) {
                                if (combo_valor == 5 && eval("document.getElementById('" + filtro + "').value") != "") {
                                    valor = eval("document.getElementById('" + filtro + "').options[eval(document.getElementById('" + filtro + "_" + i + "').selectedIndex)].text");
                                } else {
                                    valor = eval("document.getElementById('" + filtro + "').options[eval(document.getElementById('" + filtro + "_" + i + "').selectedIndex)+1].text");
                                }
                                valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b>";
                            }
                        }
                    }
                }
                valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;
            } else {
                if (tipo == 4) {
                    var valor = eval("document.getElementById('" + filtro + "i').value");
                    var valor_dtf = eval("document.getElementById('" + filtro + "f').value");
                } else {
                    if (tipo == 5) {
                        var valor_dti = eval("document.getElementById('" + filtro + "i').value");
                        var valor = eval("document.getElementById('" + filtro + "f').value");
                    } else {
                        var valor_atual = "";
                        var valor_tipo = "";
                        var valor1 = eval("document.getElementById('" + filtro + "').options[eval(document.getElementById('" + filtro + "').selectedIndex)].text");
                        var valor_tipo1 = eval("document.getElementById('tipo_" + filtro + "').options[eval(document.getElementById('tipo_" + filtro + "').selectedIndex)].text");
                        if (eval("document.getElementById('contador_total_" + filtro + "')")) {
                            var total_filtro = eval("document.getElementById('contador_total_" + filtro + "').value");
                            if (total_filtro >= 1) {
                                for (i = 0; i <= (total_filtro - 1); i++) {
                                    if (eval("document.getElementById('" + filtro + "_" + i + "')")) {
                                        valor = eval("document.getElementById('" + filtro + "').options[eval(document.getElementById('" + filtro + "_" + i + "').selectedIndex)+1].text");
                                        valor_tipo = eval("document.getElementById('tipo_" + filtro + "').options[eval(document.getElementById('tipo_" + filtro + "_" + i + "').selectedIndex)].text");
                                        valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b> (" + valor_tipo + ") ";
                                    }
                                }
                            }
                        }
                        if (document.getElementById('ordenacao').value != 'X') {
                            valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b> (" + valor_tipo1 + ") " + valor_atual;
                        } else {
                            valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;
                        }
                    }
                }
            }
        }
    }
    exibeInfo(filtro);
    var div_info_valores = eval("document.getElementById('info_" + filtro + "');");
    var nome = (eval("document.getElementById('nome_" + filtro + "').value"));

    if (tipo == 6) {
        var linha_valor = "<div id='valor" + filtro + "' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- " + valor_atual + ";</div>";
    } else {
        var linha_valor = "<div id='valor" + filtro + "' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- " + nome + ": " + texto + valor_atual + ";</div>";
    }

    var linha_data1 = "<div id='valor" + filtro + "' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- " + nome + ": <b><span style='text-transform:uppercase;'>" + valor + "</span></b> a <b><span style='text-transform:uppercase;'>" + valor_dtf + "</span></b>;</div>";
    var linha_data2 = "<div id='valor" + filtro + "' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- " + nome + ": <b><span style='text-transform:uppercase;'>" + valor_dti + "</span></b> a <b><span style='text-transform:uppercase;'>" + valor + "</span></b>;</div>";
    div_info_valores.style.display = 'block';
    if (tipo == 5) {
        div_info_valores.innerHTML = linha_data2;
    } else {
        if (tipo == 4) {
            div_info_valores.innerHTML = linha_data1;
        } else {
            div_info_valores.innerHTML = linha_valor;
        }
    }
}

function ExibeDetalhesCR() {
    if (document.getElementById) {
        //recupera os objetos do form que vamos trabalhar
        var x = screen.width;
        var y = screen.height;
        var w = 350;
        var z = 130;

        var y1 = (y / 5);
        var y2 = Math.round(y1);
        var y3 = ((y - y2) - z) / 2;
        var y4 = Math.round(y3);

        var x1 = ((x - 250) - w) / 2;
        var x2 = Math.round(x1);

        document.getElementById('divFrameCR').style.top = ((y4) / 2) - 86;
        document.getElementById('divFrameCR').style.left = x2;
        document.getElementById('divFrameCR').style.filter = "alpha(opacity=0)";
        document.getElementById('divFrameCR').style.visibility = 'visible';

        document.getElementById('divInfoCR').style.top = ((y4) / 2) - 86;
        document.getElementById('divInfoCR').style.left = x2;
        document.getElementById('divInfoCR').style.filter = "alpha(opacity=95)";
        document.getElementById('divInfoCR').style.display = 'block';
    }
}

function FechaDetalhesCR() {
    document.getElementById('divInfoCR').style.display = 'none';
    document.getElementById('divFrameCR').style.visibility = 'hidden';
}

function CopiaRelatorio(objeto, relatorio) {
    var contato = objeto.value;
    if (document.getElementById) {
        var ajax = openAjax();
        ajax.open("GET", "/popup/copia_relatorios.asp?cd_view=" + relatorio + "&cd_usuario=" + contato + "&copia_relatorio=1", true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) { //agora exibe o que interessa
                if (ajax.status == 200) {
                    var vResult = ajax.responseText; //resultado da busca
                    vResult = vResult.replace(/<br>/g, '\n');
                    if (vResult.substring(0, 3) != 'XXX') {
                        if (confirm(vResult)) {
                            var ajax2 = openAjax();
                            ajax2.open("GET", "/popup/copia_relatorios.asp?cd_view=" + relatorio + "&cd_usuario=" + contato + "&copia_relatorio=2", true);
                            ajax2.send(null); // submete
                            window.location.reload()
                        }
                    } else {
                        vResult = vResult.replace(/XXX/g, '');
                        alert(vResult);
                    }
                }
            }
        }
        ajax.send(null); // submete
    }
}


function FechaEmail(vDiv1, vDiv2, vDiv3) {
    if (document.getElementById) {
        var div_info = document.getElementById(vDiv1);
        var div_info_corpo = document.getElementById(vDiv2);
        var div_info_rodape = document.getElementById(vDiv3);
        div_info.style.display = "none";
        div_info_corpo.style.display = "none";
        div_info_rodape.style.display = "none";
    }
}

function ExibeEmail(nr_processo) {
    features = "top=100,left=20,width=500,height=400,scrollbars=yes,menubar=no,status=no,resizable=no";
    window.open('/detalhe/enviar_resumo_email.asp?nr_processo='+ nr_processo,"enviar_resumo_email", features);
}

function EnviaDetalheEmail(nr_processo) {
    if (document.getElementById) {
        //recupera os objetos do form que vamos trabalhar
        var ajax = openAjax();
        //usado o GET para que se possa usar filtros querystring
        ajax.open("POST", "enviar_arquivos_email.asp?nr_processo=" + nr_processo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) { //agora exibe o que interessa
                if (ajax.status == 200) {
                    var vResult = ajax.responseText; //resultado da busca
                    vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                    vResult = unescape(vResult); //continua resolvendo problemas de acento
                    alert(vResult);
                } else {
                    //alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
                    alert('ERRO');
                }
            }
        }
        ajax.send(mountParameters(document.getElementById("frmEnviaDetalheEmail"))); // submete        
    }
}

function verificaEmail(objeto) {
    if (objeto.value != "") {
        document.getElementById('submit_resumo').disabled = false;
    } else {
        document.getElementById('submit_resumo').disabled = true;
    }
}

function mudaValor(objeto, arquivo) {
    if (objeto.checked) {
        objeto.value = arquivo;
    } else {
        objeto.value = "0";
    }
}
