var isDOM = (document.getElementById ? true : false);
var isIE4 = ((document.all && !isDOM) ? true : false);
var isNS4 = (document.layers ? true : false);
var isNS = navigator.appName == "Netscape";

function mudaTema(tema) {
    if (document.getElementById) {
        var ajax = openAjax();
        ajax.open("GET", "/popup/muda_tema.asp?tema=" + tema, true);
        ajax.send(null); // submete
    }
    document.location = document.location;
}

function fnc_ValidaData(edit) {
    var valida = true;

    if (edit.value != '') {
        if (getValidDate(edit.value) == undefined) {
            alert('Atenção: Data inválida!');
            valida = false;
            edit.select();
            edit.focus();
        }
    }
    return valida;
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

function alteraCampos(tipo, destino, menu, subm, tp_exibir, cd_view,array_campo, nr_max_campo, tipo_campo) {	
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

function alteraQtdCampos(tipo, destino, menu, subm, tp_exibir, cd_view,array_campo, nr_max_campo, tipo_campo) {	
	if (document.getElementById){
			if(tipo_campo == 1){
				alert("ATENÇÃO:\n\nOs campos específicos da exibição 'Por pedido' serão excluídos do seu relatório."); 
			}else{
				alert("ATENÇÃO:\n\nOs campos específicos da exibição 'Por embarque' serão excluídos do seu relatório.");
			}
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

function MudaGrupo(combo){
	var vStatus = combo.value;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_grupo_rap.asp?status="+vStatus, true);
		ajax.send(null); // submete
		ExecutaAcao(7,'listar');
	}
}

function EscolheModelo(rap_destino, acao, rap_modelo){
	var vResposta;
	if (acao == 'salvar'){
		if (confirm('Deseja realmente carregar o modelo?')){
			var vRap_destino = rap_destino;
			var vRap_modelo  = rap_modelo;
			if (document.getElementById) {
			var ajax = openAjax();
			ajax.open("GET","/popup/atz_rap_modelo.asp?rap_destino="+vRap_destino+"&rap_modelo="+vRap_modelo, true);
			ajax.send(null); // submete
			document.location='cadastro.asp?cd_menu=02&cd_subm=08&cd_docto=0208-D0001&vNrRap='+ vRap_destino +'&vTpAcao=salvar&vNrRapModelo='+rap_modelo+'';
			}	
		}
	}else{
		if (acao != 'listar'){
		alert('Primeiramente, salve o embarque em edição!');
		}
	}
}

function ExcluiModelo(rap, acao){
		if (confirm('Deseja realmente excluir o modelo?')){
			var vRap = rap;
			if (document.getElementById) {
			var ajax = openAjax();
			ajax.open("GET","/popup/exclui_rap_modelo.asp?rap="+vRap, true);
			ajax.send(null); // submete
			ExecutaAcao(7,'listar');
			}	
		}
}

function SalvaModelo(rap, acao, cliente) {
	if (acao == 'salvar' && cliente != ''){
		var vRap = rap;
		var vCliente = cliente;
		var vResposta;
		if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/cria_modelo_rap.asp?rap="+vRap+"&cliente="+vCliente, true);
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { 
				if(ajax.status == 200) {
					vResposta = ajax.responseText;
					if (vResposta == 'true'){
						alert('Modelo inserido com sucesso!');
					}else{
						alert('Modelo para este cliente já cadastrado!');
					}
				}
			}
		}
		ajax.send(null); // submete
		//document.forms[0].submit();
		document.location='cadastro.asp?cd_menu=02&cd_subm=08&cd_docto=0208-D0001&vNrRap='+ vRap + '&vTpAcao=salvar';
		}	
	}else{
		if (vCliente == '' ){
			alert('Cliente inválido!');
		}else{
			if (acao != 'listar'){
			alert('Primeiramente, salve o embarque em edição!');
			}
		}
	}
}

function EditaModelo(rap) {
	var vRap = rap;
	if (vRap != ''){
	document.location='cadastro.asp?cd_menu=02&cd_subm=08&cd_docto=cd_docto=0208-D0001&vNrRap='+vRap+'&vTpAcao=editar&vTpExibe=1&vInModelo=1';
	}
}

function FastLookup(vTabela, vCampos, vReturn, vCodigo, vEdit){
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
						
			if (vEdit == "edtRespostaRap" ){
			var vCod2 = document.getElementById(vReturn).value;
			if (vCod2 != '' || vCod2 != undefined) {
			vCod2 = vCod2.replace(" ","");
			if (vCod2.length > 0 && vCod2 != 0) {
				//validamos o código para que ele tenha o tamanho certo defindo na tabela
				for (i = vCod2.length; i < 6; i++)
					vCod2 = '0'+ String(vCod2);
					document.getElementById(vReturn).value = vCod2;
			}
			}
			vCod = vCod2 + vCod;
			vCodigo.Value = vCod;
			}
				//iniciamos a busca através do ajax
				var ajax = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax.open("GET","/popup/fast_lookup.asp?vTabela="+vTabela+"&vCampos="+vCampos+"&vReturn="+vReturn+"&vCodigo="+vCod,true); 
				ajax.onreadystatechange = function() {
					if (vEdit != "edtRespostaRap" ){
					if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
						vDesc.value = "processando...";
					}
					}
					if(ajax.readyState == 4) { //agora exibe o que interessa
							if(ajax.status == 200) {
							var vResult = ajax.responseText; //resultado da busca
							if (vResult == "aereo" || vResult == "outros"){
							if (vResult == "aereo"){
							document.getElementById('viaTransp').style.visibility = 'visible';
							}
							if (vResult == "outros"){
							document.getElementById('cmbinCourrier').checked = false;
							document.getElementById('viaTransp').style.visibility = 'hidden';
							}
							}
							else{
							if (vResult == "true" || vResult == "false"){
							if (vResult == "true"){
								vDesc.style.background = '';
								vDesc.value = "";
							}
							if (vResult == "false"){
								vDesc.style.background = 'red';
								vDesc.style.color = 'white';
								vDesc.value = "Rap já existe!";
							}
							}
							else{
							if (vResult.indexOf('erro')!=0) {
								vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
								vResult = unescape(vResult); //continua resolvendo problemas de acento
								if (Left(vResult,6) == "BROKER"){
									vCodigo.style.background = '#FFDDDD';
									vDesc.value = Right(vResult, vResult.length - 6);
								}else{
									vDesc.value = vResult;
								}
							} else {
								var vColor = vCodigo.style.background;
								vCodigo.style.background = '#FFDDDD';
								alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
								vCodigo.style.background = vColor;
								vCodigo.focus();
								vDesc.value = "";
							}
							}
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

var pasta_open = "";
var pasta_close = "";
var lupa = "";
var menu_open = "";
var menu_close = "";

function preload() {
    if (document.images) {
        pasta_open = new Image(18, 16);
        pasta_close = new Image(16, 16);
        lupa = new Image(16, 16);
        menu_open = new Image(9, 100);
        menu_open_fim = new Image(9, 100);
        menu_close = new Image(9, 100);
        menu_close_fim = new Image(9, 100);
        seta = new Image(7, 48)
        seta_virada = new Image(7, 48)
        pasta_open.src = "/imagens/30/folder_open.gif";
        pasta_close.src = "/imagens/30/folder_close.gif";
        lupa.src = "/imagens/30/button_view.gif";
        menu_open.src = "/imagens/30/minus_t.gif";
        menu_open_fim.src = "/imagens/30/minus_t_fim.gif";
        menu_close.src = "/imagens/30/plus_t.gif";
        menu_close_fim.src = "/imagens/30/plus_t_fim.gif";
        seta.src = "/imagens/30/seta.jpg";
        seta_virada.src = "/imagens/30/seta_virada.jpg";
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
        item.style.display = 'block';
        if (tipo == 0) {
            if (flag_lupa == 1) {
                item3.src = lupa.src;
            } else {
                item3.src = pasta_open.src;
                if (item.id == 'menu02') {
                    if (document.getElementById('menu0212').style.display == 'none') {
                        mostra(document.getElementById('menu0212'), document.getElementById('menu0212img'), document.getElementById('pasta0212img'), 0, 1);
                    }
                }
                if (item.id == 'menu01') {
                    if (document.getElementById('menu0109').style.display == 'none') {
                        mostra(document.getElementById('menu0109'), document.getElementById('menu0109img'), document.getElementById('pasta0109img'), 0, 1);
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
        if (item == menu) {
            dv_corpo.style.left = 250;

            if (document.getElementById('divResumo')) {
                var divResumo = document.getElementById('divResumo');
                divResumo.style.left = 250;
            }

            item3.background = seta_virada.src;

            if (document.getElementById('divInfo')) {
                var x1 = ((x - 250) - w) / 2;
                var x2 = Math.round(x1);
                divInfo.style.left = (x2);
                divInfoCorpo.style.left = (x2);
                divInfoRodape.style.left = (x2);
                if (document.getElementById('divFrame')) {
                    var divFrame = document.getElementById('divFrame');
                    divFrame.style.left = (x2);
                }
            }
        }
    }
    else {
        item.style.display = 'none';
        if (tipo == 0) {
            if (flag_lupa == 1) {
                item3.src = lupa.src;
            } else {
                item3.src = pasta_close.src;
            }

            if (nr_ordem == nr_ordem_max) {
                item2.src = menu_close_fim.src;
            } else {
                item2.src = menu_close.src;
            }
        }
        //if(tipo==1) item2.src=pasta_close.src;
        if (item == menu) {
            dv_corpo.style.left = 10;
            if (document.getElementById('divResumo')) {
                var divResumo = document.getElementById('divResumo');
                divResumo.style.left = 10;
            }
            item3.background = seta.src;

            if (document.getElementById('divInfo')) {
                var x1 = ((x - 10) - w) / 2;
                var x2 = Math.round(x1);
                divInfo.style.left = (x2);
                divInfoCorpo.style.left = (x2);
                divInfoRodape.style.left = (x2);
                if (document.getElementById('divFrame')) {
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
