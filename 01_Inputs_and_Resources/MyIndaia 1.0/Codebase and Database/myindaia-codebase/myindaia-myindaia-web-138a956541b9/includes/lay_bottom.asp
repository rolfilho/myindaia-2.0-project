<script language="javascript" type="text/javascript">
setInterval("reloadPagina();",300000);
setTimeout("reloadPagina();ExibeDicas_alert();", 1000);

function reloadPagina() {
	if ('<%=Session("login_valido")%>'=='True' && '<%=Session("cd_cargo")%>'=='040' && '<%=Session("InPendencias")%>'=='1'){
		if (document.getElementById('divInfoCorpoAlert').style.display == 'block') {
			if (document.getElementById('divHistorico').style.display != 'block' && document.getElementById('divRep').style.display != 'block' ){
				ExibeDetalhes_alert();
				ExibePendencias_alert();
			}
		}else{
			ExibeDetalhes_alert();
		}
	}
}

function ExibeDetalhes_alert() {
	if (document.getElementById) {
		var vCorpo  = document.getElementById('divAlertCorpo');	
		var vAlert = document.getElementById('divAlert');
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=0", true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					if (vResult != '0'){
						vAlert.style.display = 'block';
						window.focus();
						vCorpo.innerHTML = vResult;
					}else{
						vAlert.style.display = 'none';
					}
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function FechaDetalhes_alert(){
	document.getElementById('divAlert').style.display='none'
}

function ExibePendencias_alert(){
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;
		var w = 800;
		var z = 300;
		var titulo = "<%=tx_lang_POP099(cd_lang)%>";
		
		var vCorpo = document.getElementById('divInfoCorpoAlert'); 
		var vInfo = document.getElementById('divInfoAlert'); 
		var vTitulo = document.getElementById('divTituloAlert'); 
		var vInfoRodape = document.getElementById('divInfoRodapeAlert');
		var div_frame = document.getElementById('divFrameAlert'); 
		//define a posição do div e exibe na tela
		
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		var x1 = ((x-0)-w)/2;
		var x2 = Math.round(x1);
		
		//div_frame.style.width = w;
		//div_frame.style.height = z;
		//div_frame.style.left = (x2);
		//div_frame.style.top = ((y4)/2)-26+50;
		//div_frame.style.visibility = "visible";
		//div_frame.style.filter= "alpha(opacity=0)";

		vInfo.style.width = w;
		vInfo.style.height = 26;
		vInfo.style.left = (x2);
		vInfo.style.top = ((y4)/2)-26+50;
		vInfo.style.display = "block";
		vInfo.style.filter = "alpha(opacity=95)";
		vTitulo.innerHTML = "<b>" + titulo + "</b>";
					
		vCorpo.style.width = w;
		vCorpo.style.height = z;
		vCorpo.style.left = (x2);
		vCorpo.style.top = ((y4)/2)-2+50;
		vCorpo.style.display = "block";
		vCorpo.style.filter = "alpha(opacity=95)";
		
		vInfoRodape.style.width = w;
		vInfoRodape.style.height = 26;
		vInfoRodape.style.left = (x2);
		vInfoRodape.style.top = ((y4)/2)+z-2+50;
		vInfoRodape.style.display = "block";
		vInfoRodape.style.filter = "alpha(opacity=95)";

		
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=1", true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					if (vResult == 'ERRO'){
						FechaPendencias('divInfoCorpoAlert','divInfoRodapeAlert','divInfoAlert');
					}else{	
						vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
						vResult = unescape(vResult); //continua resolvendo problemas de acento
						vCorpo.innerHTML = vResult;
					}
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function FechaPendencias(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div = document.getElementById(vDiv1);
		var div2 = document.getElementById(vDiv2);
		var div3 = document.getElementById(vDiv3);
		div.style.display = "none";
		div2.style.display = "none";
		div3.style.display = "none";
	}	
}

function ExibeHistorico_alert(pendencia,processo,referencia,item_cliente, parcial, empresa, nm_pendencia){
	var x = screen.width;
	var y = screen.height;
	var w = 760;
	var z = 360;
	
	var y1 = (y/5);
	var y2 = Math.round(y1);
	var y3 = ((y-y2)-z)/2;
	var y4 = Math.round(y3);
		
	var x1 = ((x-0)-w)/2;
	var x2 = Math.round(x1);

	document.getElementById('divInfoAlert').disabled = true;
	document.getElementById('divInfoCorpoAlert').disabled = true;
	document.getElementById('imgAlert').disabled = true;
	
	
	var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
	ajax.open("GET", "/detalhe_pendencia.asp?mostra_pendencia=2&cd_pendencia=" + pendencia + "&nr_processo=" + processo + "&nr_referencia=" + referencia + "&nr_item_cliente=" + item_cliente + "&nr_parcial=" + parcial + "&cd_empresa=" + empresa + "&nm_pendencia=" + nm_pendencia, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				document.getElementById('divHistoricoCorpo').innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					document.getElementById('divHistoricoCorpo').innerHTML = "<br>" + vResult;
					var scripts = document.getElementById('divHistoricoCorpo').getElementsByTagName("script");
					for(i = 0; i < scripts.length; i++){
						s = scripts[i].innerHTML;                        
						eval(s);                
					}
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					document.getElementById('divHistoricoCorpo').innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	//document.getElementById('divFrameHistorico').style.top = ((y4)/2)-26+104;
	//document.getElementById('divFrameHistorico').style.left = x2+45;
	//document.getElementById('divFrameHistorico').style.filter = "alpha(opacity=0)";
	//document.getElementById('divFrameHistorico').style.visibility = 'visible';	
		
	document.getElementById('divHistorico').style.top = ((y4)/2)-26+104;
	document.getElementById('divHistorico').style.left = x2+45;
	document.getElementById('divHistorico').style.filter = "alpha(opacity=95)";
	document.getElementById('divHistorico').style.display = 'block';
}

function ExibeRep_alert(pendencia,processo, referencia, item_cliente, parcial, empresa){
	var x = screen.width;
	var y = screen.height;
	var w = 350;
	var z = 90;
	
	var y1 = (y/5);
	var y2 = Math.round(y1);
	var y3 = ((y-y2)-z)/2;
	var y4 = Math.round(y3);
		
	var x1 = ((x-0)-w)/2;
	var x2 = Math.round(x1);

	document.getElementById('divInfoAlert').disabled = true;
	document.getElementById('divInfoCorpoAlert').disabled = true;
	document.getElementById('imgAlert').disabled = true;
	
	
	var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=4&cd_pendencia="+pendencia+"&nr_processo="+processo+"&nr_referencia="+referencia+"&nr_item_cliente="+item_cliente+"&nr_parcial="+parcial+"&cd_empresa="+empresa, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				document.getElementById('divRepCorpo').innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					document.getElementById('divRepCorpo').innerHTML = "<br>" + vResult;
					var scripts = document.getElementById('divRepCorpo').getElementsByTagName("script");
					for(i = 0; i < scripts.length; i++){
						s = scripts[i].innerHTML;                        
						eval(s);                
					}
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					document.getElementById('divRepCorpo').innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	//document.getElementById('divFrameRep').style.top = ((y4)/2)-26+60;
	//document.getElementById('divFrameRep').style.left = x2;
	//document.getElementById('divFrameRep').style.filter = "alpha(opacity=0)";
	//document.getElementById('divFrameRep').style.visibility = 'visible';	
		
	document.getElementById('divRep').style.top = ((y4)/2)-26+60;
	document.getElementById('divRep').style.left = x2;
	document.getElementById('divRep').style.filter = "alpha(opacity=95)";
	document.getElementById('divRep').style.display = 'block';
}

function FechaHistorico_alert(){
	document.getElementById('divInfoAlert').disabled = false;
	document.getElementById('divInfoCorpoAlert').disabled = false;
	document.getElementById('imgAlert').disabled = false;
	document.getElementById('divHistorico').style.display = 'none';
	//document.getElementById('divFrameHistorico').style.visibility = 'hidden';	
	ExibeDetalhes_alert();
	ExibePendencias_alert();
}

function FechaRep_alert(){
	document.getElementById('divInfoAlert').disabled = false;
	document.getElementById('divInfoCorpoAlert').disabled = false;
	document.getElementById('imgAlert').disabled = false;
	document.getElementById('divRep').style.display = 'none';
	//document.getElementById('divFrameRep').style.visibility = 'hidden';	
	ExibeDetalhes_alert();
	ExibePendencias_alert();
}

function EnviaMensagem_alert(objeto, pendencia, processo, referencia, item_cliente, parcial, empresa, nm_pendencia){
	var texto = objeto.value;
	//texto = texto.replace(/\n{1}/gi,"|");
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=3&nm_texto="+escape(texto)+"&cd_pendencia="+pendencia+"&nr_processo="+processo+"&nr_referencia="+referencia+"&nr_item_cliente="+item_cliente+"&nr_parcial="+parcial+"&cd_empresa="+empresa, true);
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					if (vResult == 'ERRO'){
						alert('<%= tx_lang_POP100(cd_lang)%>');
						FechaHistorico_alert();
					}	
				}
			}
		}
		ajax.send(null); // submete
	}
    ExibeHistorico_alert(pendencia, processo, referencia, item_cliente, parcial, empresa, nm_pendencia);
}

function RepassaPendencia_alert(objeto, nome, pendencia, processo, referencia, item_cliente, parcial, empresa){
	var contato = objeto.value;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=5&cd_contato="+contato+"&nm_contato="+nome+"&cd_pendencia="+pendencia+"&nr_processo="+processo+"&nr_referencia="+referencia+"&nr_item_cliente="+item_cliente+"&nr_parcial="+parcial+"&cd_empresa="+empresa, true);
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					if (vResult == 'ERRO'){
						alert('<%= tx_lang_POP100(cd_lang)%>');
						FechaHistorico_alert();
					}	
				}
			}
		}
		ajax.send(null); // submete
	}
	FechaRep_alert();
}

function ExibeDetalhes_alert() {
	if (document.getElementById) {
		var vCorpo  = document.getElementById('divAlertCorpo');	
		var vAlert = document.getElementById('divAlert');
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST","/detalhe_pendencia.asp?mostra_pendencia=0", true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					if (vResult != '0'){
						vAlert.style.display = 'block';
						//window.focus();
						vCorpo.innerHTML = vResult;
					}else{
						vAlert.style.display = 'none';
					}
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function ExibeDicas_alert() {
	if ('<%=Session("mostra_dica")%>' == '1' && '<%=Session("login_valido")%>'=='True' && '<%=Session("cd_cargo")%>'!='088'){
		if (document.getElementById) {
			var vCorpo  = document.getElementById('divDicasCorpo');
			var vAlert = document.getElementById('divDicas');
			vAlert.style.filter = "alpha(opacity=70)";
			//iniciamos o ajax
			var ajax = openAjax();
			//usado o GET para que se possa usar filtros querystring
			ajax.open("POST","/popup/detalhe_dicas.asp", true); 
			ajax.onreadystatechange = function() {
				if(ajax.readyState == 4) { //agora exibe o que interessa
					if(ajax.status == 200) {
						var vResult = ajax.responseText; //resultado da busca
						vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
						vResult = unescape(vResult); //continua resolvendo problemas de acento
						vAlert.style.display = 'block';
						//window.focus();
						vCorpo.innerHTML = vResult;
					} else {
						//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
						vCorpo.innerHTML = ajax.responseText;
					}
				}
			}
			ajax.send(null); // submete
		}
	}
}


function FechaDetalhes_alert(){
	document.getElementById('divDicas').style.display='none'
	altera_Session('mostra_dica', '0');	
}

</script>
<style>
#divAlert {
	background-color:#f0f1f6;
	width:210px;
	height:30px;
	position:absolute;
	top:20px;
	right:240px;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:1;
}

#divDicas {
	background-color:#f0f1f6;
	background-image:url(../imagens/30/fundo_dicas.gif);
	width:210px;
	height:200px;
	position:absolute;
	bottom:30px;
	right:15px;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:1;
}



#divComodo {
	background-image:url(../imagens/comodo/cot_padlock.gif);
	width:113px;
	height:59px;
	position:absolute;
	bottom:18px;
	right:14px;
	display:none;
	z-index:1;    
}

#divAlertCorpo {
	width:210px;
	position:absolute;
	text-align:center;
	padding-top:2px;
	color:#990000;
	font-weight:bold;
	cursor:pointer;
	padding-top:7px;
	z-index:2;
}

#divDicasCorpo {
	width:208px;
	height:172px;
	position:absolute;
	overflow:auto;
	text-align:center;
	color:#990000;
	font-weight:bold;
	z-index:2;
	padding:10px 4px 6px 6px;
	text-align:justify;
}

#divHistorico {
	background-color:#f0f1f6;
	width:760px;
	height:355px;
	position:absolute;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:3;
}
#divHistoricoCorpo{
	padding-left:10px
}

#divRep {
	background-color:#b4c7db;
	width:350px;
	height:90px;
	position:absolute;
	border-width:1px;
	border-color:#336699;
	border-style:solid;
	display:none;
	z-index:3;
}
#divRepCorpo{
	padding-left:10px
}

#divHistoricoLegenda{
	width:200px;
	height:16px;
	top:336px;
	position:absolute;
}
#divHistoricoTexto{
	overflow:auto;
	background-color:#FFFFFF;
	border-style:solid;
	border-color:#000000;
	border-width:1px;
	width:720px;
	height:230px;
	top:20px;
	position:absolute;
	padding-left:10px;
	padding-top:10px;
	padding-right:10px;
}

</style>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height="16" bgcolor="#a1c5ec">
	<td style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='<%=bg_topo%>', endColorStr='<%=bg_topo%>', gradientType='0');">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    <tr>
		  <td width="5">
		  <%If Session("login_valido") Then%>                    
          <div id="divInfoAlert" class="divInfo" style="overflow:hidden">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" height="26" bgcolor="#b4c7db" >
            <tr>
            <td width="98%" align="center" valign="middle"><center><div id="divTituloAlert"></div></center></td>
            <td width="2%" align="left" ><img id="imgAlert" src="/imagens/30/btn_fechar.gif" width="18" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>" onclick="FechaPendencias('divInfoCorpoAlert','divInfoRodapeAlert','divInfoAlert');" style="cursor:pointer;">&nbsp;</td>
            </tr>
            </table>
          </div>
          <div id="divInfoCorpoAlert" class="divDetalhes"></div>       
          <div id="divInfoRodapeAlert" class="divInfo" style="overflow:hidden">
          <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" ><tr><td></td></tr></table>
          </div>      
          <div id="divComodo" <%If Not in_comodo = "1" Then %>style="display:block;"<%End If %>>
          <!--script type="text/javascript">    TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script-->
          </div>       
          <div id="divDicas" style="border-color:<%=bg_color_barra%>">
          <div id="divDicasTitulo" style="width:100%">
          <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=bg_color_dicas%>" >
          <tr>
            <td width="98%" align="center" valign="middle">&nbsp;&nbsp;&nbsp;<font style="color:#0066CC;font-size:18px;font-weight:bold;">Você Sabia?</font><br /></td>
            <td width="2%" align="left" ><img id="imgDicas" src="/imagens/30/btn_fechar<%=bg_fechar %>.gif" width="18" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>" onclick="FechaDetalhes_alert();" style="cursor:pointer;">&nbsp;</td>
          </tr>
          </table> 
          </div>
          <div id="divDicasCorpo" style="color:#000000;font-weight:normal;background-color:<%=bg_color_dicas%>;"></div>
          </div>
          <div id="divAvisoTitulo" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=topo_div %>" >
	      <tr height="25">
		  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="left" valign="middle">&nbsp;&nbsp;<b><%=tx_lang_001060(cd_lang) %></b></td>
					<td width="4%" align="right" >&nbsp;</td>
				</tr>
		  </table></td>
	      </tr>
          </table></div>
          <div id="divAvisoCorpo" class="divInfo" style="border-color:<%=topo_div%>;scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;text-align:center;background-color:<%=fundo_div%>;">
          </div>
          <div id="divAvisoRodape" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;background-color:<%=topo_div%>;">&nbsp;</div>
          <div id="divAlert"><a href="#" onclick="ExibePendencias_alert();"><div id="divAlertCorpo"></div></a>
          </div>
          <div id="divRep"><div id="divRepBotao"><img src="/imagens/30/btn_fechar22.gif" width="18" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>" align="right" onclick="FechaRep_alert();" style="cursor:pointer;"></div><div id="divRepCorpo"></div></div>                
          <div id="divHistorico"><div id="divHistoricoBotao"><img src="/imagens/30/btn_fechar211.gif" width="36" height="17" border="0" alt="<%= tx_lang_POP098(cd_lang)%>" align="right" onclick="FechaHistorico_alert();" style="cursor:pointer;"></div><div id="divHistoricoCorpo"></div></div>
          <%End If%>
          </td>
          <td align="left" width="180"> Esquema de cores 
          <a href="<%= script & "?" & tx_url_qrys%>" onclick="mudaTema(2);"><img src="/imagens/30/tema2.gif" border="0" align="absmiddle" style="cursor:pointer;"/></a>
          <a href="<%= script & "?" & tx_url_qrys%>" onclick="mudaTema(1);"><img src="/imagens/30/tema1.gif" border="0" align="absmiddle" style="cursor:pointer;"/></a>          
          <a href="<%= script & "?" & tx_url_qrys%>" onclick="mudaTema(4);"><img src="/imagens/30/tema5.gif" border="0" align="absmiddle" style="cursor:pointer;"/></a>
          <a href="<%= script & "?" & tx_url_qrys%>" onclick="mudaTema(3);"><img src="/imagens/30/tema4.gif" border="0" align="absmiddle" style="cursor:pointer;"/></a>          
          </td>
          <td>
          <p align="center" style="color:<%=color_bottom%>;font-family:Verdana;">&nbsp;&nbsp;&copy;<%= Year(Date())%> MyIndai&aacute; - <b><a href="http://www.myindaia.com.br/" target="_blank" style="color:<%=color_bottom%>;font-family:Verdana;font-size:8pt;">Indai&aacute; Log&iacute;stica Internacional</a></b></p>
          </td>
          <td align="right" width="100">
          <% If flag_autentica <> 1 then%>
          <a href="<%= tx_url_lang &"0"%>" target="_self" onclick="mudaIdioma(0);"><img src="/imagens/30/flag_brazil.gif" alt="português-br" width="23" height="14" border="0" align="absmiddle"/></a> <a href="<%= tx_url_lang &"1"%>" target="_self" onclick="mudaIdioma(1);"><img src="/imagens/30/flag_uk.gif" alt="english" width="24" height="14" border="0" align="absmiddle"/></a> <a href="<%= tx_url_lang &"2"%>" target="_self" onclick="mudaIdioma(2);"><img src="/imagens/30/flag_spain.gif" alt="español" width="23" height="14" border="0" align="absmiddle"/></a>&nbsp;&nbsp;
          <%End if%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%If Request.Cookies("pendencia")("codigo") <> "" Then %>
<script>
    ExibePendencias_alert();
    ExibeHistorico_alert('<%= Request.Cookies("pendencia")("codigo")%>', '<%=Request.Cookies("pendencia")("processo")%>', 'X', 'X', 0, 'X', '<%= Request.Cookies("pendencia")("nome")%>');
</script>
<%End If %>


