<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Importação / Tracking
'Arquivo de Script e HTML: Filtros do Relatório
'
'Autor: Alexandre Gonçalves Neto
'Criado: 27/06/2005
'
'Manutenção: 25/07/2006
'---------------------------------------------------------------------------
%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim data_calendario
Dim in_vazio
Dim nm_campo
Dim sql_campos, sql_campos2
Dim linha_filtros, linha_cons, linha_combo, in_ultima_pesquisa
Dim linha_filtros_item, linha_cons_item, cont_linha_cons_item, linha_combo_item

exibe_resumo = Session("exibe_resumo")
in_ultima_pesquisa = Request("ultima_pesquisa")

in_show = True
cd_tela = "IMP001"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

in_view_filtro = 1

if Request("in_pesquisa") = 1 Then
%>
<script>
alert('Erro: Pesquisa em branco!');
</script>
<%
End If
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
'nome da tela
nm_tela = nm_menu &" &gt;&gt; "& nm_subm &" &gt;&gt; "& nm_view
'define se os filtros seram em 1 ou 2 colunas
If objrsv.RecordCount > 20 Then
	vl_colspan    = 6
	vl_width      = "100%"
	vl_width_form = 200
Else
	vl_colspan    = 3
	vl_width      = 500
	vl_width_form = 300
End If
%>	
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_filtrost.js"></script>
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
<script type="text/javascript" src="/includes/lightbox.js"></script>
<script>

//Não altere esses valores!
var iCount = 0;
var filtro_usado;
var contador_usado;

function selectOrdenacao (valor){
	if (valor != 'X'){
	document.getElementById('img_ordenacao2').style.display = 'none';
	document.getElementById('img_ordenacao').style.display = 'block';
	}else{
	document.getElementById('img_ordenacao').style.display = 'none';
	document.getElementById('img_ordenacao2').style.display = 'block';
	document.getElementById('img_ordenacao2').style.visibility = 'hidden';
	}
}

function fnc_comboEdt(item, objeto){
	if(eval("document.getElementById('contador_"+ item  +"')")){
		if(objeto.value != 3 && objeto.value != 4){
		eval("document.frmbusca.img_"+ item +".style.display='block'");
		eval("document.frmbusca.img_"+ item +"2.style.display='none'");
		}else{
		eval("document.frmbusca.img_"+ item +".style.display='none'");	
		eval("document.frmbusca.img_"+ item +"2.style.display='block'");
		}
	}
			
	if (objeto.value == 2){
		eval("document.frmbusca."+ item +".style.display='none'");
		eval("document.frmbusca.edt_"+ item +".style.display='block'");
		eval("document.frmbusca.edt_"+ item +".focus();");
		eval("escreveValor(\""+item+"\", document.getElementById(\"combo_aux_" +item+ "\"),2)");
	}else{
		if(eval("document.getElementById('controle_" + item + "').value") == "combo"){
			if ('<%= in_ultima_pesquisa%>' != '1'){
			eval("escreveValor(\""+item+"\", document.getElementById(\"combo_aux_" + item + "\"),3)");
			}
		}else{
			if ('<%= in_ultima_pesquisa%>' != '1'){
			eval("escreveValor(\""+item+"\", document.getElementById(\"combo_aux_" + item + "\"),1)");
			}
		}
		if (objeto.value == 5){
			eval("document.frmbusca.edt_"+ item +".style.display='none'");
			eval("document.frmbusca."+ item +".style.display='block'");	
			if (document.getElementById(item).length > 0 ){
				var x = document.getElementById(item);
				if (x.options[0].value == 'X'){
				x.remove(x.options[1].item);
				}
			}
		}else{
			eval("document.frmbusca.edt_"+ item +".style.display='none'");
			eval("document.frmbusca."+ item +".style.display='block'");	
			if (document.getElementById(item).length > 0){
				var x = document.getElementById(item);
				if (x.options[0].value != 'X'){
				var Opt = document.createElement('option');
				Opt.text ='<%= tx_lang_A00022(cd_lang)%>';
				Opt.value='X';
				x.add(Opt,0); 
				}
			}
		}
	}
}

function fnc_desabilitaCombo(){		
		if (document.getElementById('ordenacao').value != 'X'){
			exibeInfo('ordenacao');
			escreveValor('ordenacao',document.getElementById('tipo_ordenacao'),6);
			document.getElementById('img_ordenacao2').style.display = 'none';
			document.getElementById('img_ordenacao').style.display = 'block';
		}else{
			exibeInfo('ordenacao');
			escreveValor('ordenacao',document.getElementById('tipo_ordenacao'),6);
			document.getElementById('img_ordenacao').style.display = 'none';
			document.getElementById('img_ordenacao2').style.display = 'block';
			document.getElementById('img_ordenacao2').style.visibility = 'hidden';
		}
		
		for (i=0; i< document.frmbusca.filtro.length;i++){		
			if (document.frmbusca.filtro[i].checked){		
			eval("exibeInfo('"+document.frmbusca.filtro[i].value+"')");	
				if (eval("document.getElementById('contador_" + document.frmbusca.filtro[i].value + "')")){
							eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=false');
			    eval("document.frmbusca.img_" + document.frmbusca.filtro[i].value +  ".style.display='block';");
				eval("document.frmbusca.img_" + document.frmbusca.filtro[i].value +  "2.style.display='none';");
				eval("document.all.camposTexto_"+ document.frmbusca.filtro[i].value +".style.display='block'");
				eval("document.all.Texto_"+ document.frmbusca.filtro[i].value +".style.display='block'");
				if ('<%= in_ultima_pesquisa%>' != '1'){
				eval('document.frmbusca.contador_' + document.frmbusca.filtro[i].value + '.value = 0');
				eval('document.frmbusca.contador_total_' + document.frmbusca.filtro[i].value + '.value = 0');	
				}else{
				eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=true');
				}
										
				if(eval("document.getElementById('controle_" + document.frmbusca.filtro[i].value + "').value") == "combo"){
				if ('<%= in_ultima_pesquisa%>' != '1'){
				eval("escreveValor(\""+document.frmbusca.filtro[i].value+"\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),3)");
				}
				}else{
					if(eval("document.getElementById('combo_aux_" + document.frmbusca.filtro[i].value + "').value") == 2){
					if ('<%= in_ultima_pesquisa%>' != '1'){
					eval("escreveValor(\""+document.frmbusca.filtro[i].value+"\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),2)");
					}
					}else{
					if ('<%= in_ultima_pesquisa%>' != '1'){
					eval("escreveValor(\""+document.frmbusca.filtro[i].value+"\", document.getElementById(\"combo_aux_" + document.frmbusca.filtro[i].value + "\"),1)");
					}
					}
				}
				fnc_comboEdt(document.frmbusca.filtro[i].value, eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value));
				}
			}else{
				eval('document.frmbusca.combo_aux_' + document.frmbusca.filtro[i].value + '.disabled=true');
			}
		}	
}

function carregaPesquisa(cd_view){
	document.location='track_filtros.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_view='+ cd_view +'&ultima_pesquisa=1';
}

function retiraCombo(filtro, linha, linha_ou, linha_tipo, tipo){
if (filtro != 'ordenacao'){
if(eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4){
   var combo_aux_valor = eval("document.getElementById('combo_aux_" + filtro +"').value;");
   var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
   var div = eval("document.getElementById('camposTexto_"+ filtro+"');");
   var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");
   var linha = document.getElementById(linha);
   var linha_ou = document.getElementById(linha_ou);
   
   if (contador != 0){
   var removido = div.removeChild(linha); 
   var removido_ou = div_ou.removeChild(linha_ou); 

	iCount--;   
	contador--;
	eval('document.frmbusca.contador_' + filtro + '.value =' + contador); 
	if (eval('document.frmbusca.contador_' + filtro + '.value') == 0){
		eval('document.frmbusca.contador_total_'+ filtro +'.value = 0');
		eval("document.all.camposTexto_"+ filtro +".style.display='none'");
		eval("document.all.Texto_"+ filtro +".style.display='none'");
		if (combo_aux_valor != 2 && tipo == 1){
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}else{
			if (tipo == 1){
			eval("document.getElementById('edt_" + filtro + "').focus();");
			eval('document.frmbusca.edt_' + filtro + '.focus();');
			eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
			}
		}
	}else{
	if (combo_aux_valor != 2 && tipo == 1){
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}else{
		if (tipo == 1){
		eval("document.getElementById('edt_" + filtro +  "').focus();");
		eval('document.frmbusca.edt_' + filtro +  '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}
		}
	}
	}else{
	alert('ERRO: Por favor, atualize a página');
	}
}
}else{
   	var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
   	var div = eval("document.getElementById('camposTexto_"+ filtro+"');");
   	var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");
   	var linha = document.getElementById(linha);
  	var linha_ou = document.getElementById(linha_ou);
  	var removido = div.removeChild(linha); 
  	var removido_ou = div_ou.removeChild(linha_ou); 
	var div_tipo = eval("document.getElementById('divtipo_"+ filtro+"');");
    var linha_tipo = document.getElementById(linha_tipo);
    var removido_tipo = div_tipo.removeChild(linha_tipo); 
	iCount--;   
	contador--;
	
	
	eval('document.frmbusca.contador_' + filtro + '.value =' + contador); 
	
	if (eval('document.frmbusca.contador_' + filtro + '.value') == 0){
		eval('document.frmbusca.contador_total_'+ filtro +'.value = 0');
		eval("document.all.camposTexto_"+ filtro +".style.display='none'");
		eval("document.all.divtipo_"+ filtro +".style.display='none'");
		eval("document.all.Texto_"+ filtro +".style.display='none'");
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
	}else{
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
	}
}
}

function criaCombo(tamanho, filtro, combo_aux){
if (filtro != 'ordenacao'){
if(eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4){
	eval('document.frmbusca.aux_combo_aux_' + filtro + '.value='+combo_aux.value);
	eval('document.frmbusca.combo_aux_' + filtro + '.disabled=true');
	eval("document.all.camposTexto_"+ filtro +".style.display='block'");
	eval("document.all.Texto_"+ filtro +".style.display='block'");
	var div_filtro = eval("document.getElementById('camposTexto_"+ filtro+"');"); 
	var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");  
	var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
	var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');
	var texto_aux='';
	var texto_total ='';
	var total_combo = eval("document.frmbusca."+filtro+".options.length");
	
	if ((combo_aux.value) != 2) {
		var linha_combo = "<div id='linha"+filtro+contador+"'><select class='select' name='"+filtro+"_"+contador+"'   style='width:"+(tamanho-17)+"px;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",0,1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\""+filtro+"\", document.getElementById(\"aux_combo_aux_" + filtro + "\"),3)'>";
		
		
		//alert(contador_total);
		//alert(linha_combo);
		
		if ((combo_aux.value) != 5){
		for (cont = 1; cont < total_combo;cont++){
		texto_aux = "<option value='"+ eval("document.frmbusca."+filtro+".options["+cont+"].value") +"'>"+ eval("document.frmbusca."+filtro+".options["+cont+"].text") +"</option>";
		texto_total = texto_total + texto_aux;
		}}else{
		for (cont = 0; cont < total_combo;cont++){
		texto_aux = "<option value='"+ eval("document.frmbusca."+filtro+".options["+cont+"].value") +"'>"+ eval("document.frmbusca."+filtro+".options["+cont+"].text") +"</option>";
		texto_total = texto_total + texto_aux;
		}}
		
		
		var linha_imagem = "</select><a href='#' onClick='retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",0,1)'><img src='/imagens/icones/16x16/btn_menos20.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>"; 
		linha_combo = linha_combo + texto_total + linha_imagem;
		
		if ((combo_aux.value) != 5){
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
		}else{
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV004(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
		}
		
		div_ou.innerHTML = div_ou.innerHTML+linha_ou;  
		div_filtro.innerHTML = div_filtro.innerHTML+linha_combo;  
		eval("document.getElementById('" + filtro +"_"+ contador + "').focus();");
		eval('document.frmbusca.' + filtro +"_"+ contador + '.focus();');
	
		}else{
		var linha_combo = "<div id='linha"+filtro+contador+"'><input class='editbox' type='text' name='edt_"+filtro+"_"+contador+"'   style='width:"+(tamanho-17)+"px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",0,1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\""+filtro+"\",document.getElementById(\"aux_combo_aux_" + filtro + "\"),2);'><a href='#' onClick='retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",1)'><img src='/imagens/icones/16x16/btn_menos20.gif' style='border:0;' alt='<%=tx_lang_TF018(cd_lang)%>' class='top' ></a></div>"; 	
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
		
		div_ou.innerHTML = div_ou.innerHTML+linha_ou;  
		div_filtro.innerHTML = div_filtro.innerHTML+linha_combo;  
		eval("document.getElementById('edt_" + filtro +"_"+ contador + "').focus();");
		eval('document.frmbusca.edt_' + filtro +"_"+ contador + '.focus();');		
		}
	
	iCount++;
	contador++;
	contador_total++;
	eval('document.frmbusca.contador_' + filtro + '.value =' + contador);  	 	
	eval('document.frmbusca.contador_total_' + filtro + '.value =' + contador_total);  
}
}else{
	if (document.getElementById('ordenacao').value != 'X'){
	eval("document.all.camposTexto_"+ filtro +".style.display='block'");
	eval("document.all.Texto_"+ filtro +".style.display='block'");
	eval("document.all.divtipo_"+ filtro +".style.display='block'");
	var div_filtro = eval("document.getElementById('camposTexto_"+ filtro+"');"); 
	var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");  
	var div_tipo = eval("document.getElementById('divtipo_"+ filtro+"');");  
	var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
	var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');
	var texto_aux='';
	var texto_total ='';
	var total_combo = eval("document.frmbusca."+filtro+".options.length");
	
	var linha_combo = "<div id='linha"+filtro+contador+"'><select class='select' name='"+filtro+"_"+contador+"'   style='width:"+(tamanho-17)+"px;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",\"linha_tipo"+filtro+contador+"\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\",this);return false;}' onBlur='escreveValor(\""+filtro+"\",document.getElementById(\"tipo_" + filtro + "\"),6);'>";
	
	for (cont = 1; cont < total_combo;cont++){
		texto_aux = "<option value='"+ eval("document.frmbusca."+filtro+".options["+cont+"].value") +"'>"+ eval("document.frmbusca."+filtro+".options["+cont+"].text") +"</option>";
		texto_total = texto_total + texto_aux;
	}
		
	var linha_imagem = "</select><a href='#' onClick='retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",\"linha_tipo"+filtro+contador+"\",1)'><img src='/imagens/icones/16x16/btn_menos20.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>"; 
	linha_combo = linha_combo + texto_total + linha_imagem;
	
	var linha_ou = "<div id='linha_ou"+filtro+contador+"'><nobr><%= tx_lang_004071(cd_lang)%></nobr><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
	
	var linha_tipo = "<div id='linha_tipo"+filtro+contador+"'><select class='select' style='width:90px;' name='tipo_ordenacao_"+contador+"' id='tipo_ordenacao_"+contador+"' onBlur='escreveValor(\""+filtro+"\",document.getElementById(\"tipo_" + filtro + "\"),6);'><option value='0'><%=tx_lang_004069(cd_lang)%></option><option value='1'><%=tx_lang_004070(cd_lang)%></option></select></div>"; 
	
	
	div_ou.innerHTML = div_ou.innerHTML+linha_ou;  
	div_tipo.innerHTML = div_tipo.innerHTML+linha_tipo;  
	div_filtro.innerHTML = div_filtro.innerHTML+linha_combo;  
		
	iCount++;
	contador++;
	contador_total++;
	eval('document.frmbusca.contador_' + filtro + '.value =' + contador);  	 	
	eval('document.frmbusca.contador_total_' + filtro + '.value =' + contador_total);  
	}
}
}


function retiraEdit(filtro, linha, linha_ou, tipo){ 
if(eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4){
   var combo_aux_valor = eval("document.getElementById('combo_aux_" + filtro +"').value;");
   var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
   var div = eval("document.getElementById('camposTexto_"+ filtro+"');");
   var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");
   var linha = document.getElementById(linha);
   var linha_ou = document.getElementById(linha_ou);
   var removido = div.removeChild(linha); 
   var removido_ou = div_ou.removeChild(linha_ou);  
	
	iCount--;   
	contador--;

	eval('document.frmbusca.contador_' + filtro + '.value =' + contador); 
				
	if (eval('document.frmbusca.contador_' + filtro + '.value') == 0){
		eval('document.frmbusca.contador_total_'+ filtro +'.value = 0');
		eval("document.all.camposTexto_"+ filtro +".style.display='none'");
		eval("document.all.Texto_"+ filtro +".style.display='none'");
		if (combo_aux_valor != 2 && tipo == 1){
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}else{
		if (tipo == 1){
		eval("document.getElementById('edt_" + filtro + "').focus();");
		eval('document.frmbusca.edt_' + filtro + '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}
		}
	}else{
	if (combo_aux_valor != 2 && tipo == 1){
		eval("document.getElementById('" + filtro + "').focus();");
		eval('document.frmbusca.' + filtro + '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}else{
		if (tipo == 1){
		eval("document.getElementById('edt_" + filtro +  "').focus();");
		eval('document.frmbusca.edt_' + filtro +  '.focus();');
		eval('document.frmbusca.combo_aux_' + filtro + '.disabled=false');
		}
		}
	}
}
}

function criaEdit(tamanho,filtro, combo_aux){
if(eval('document.frmbusca.combo_aux_' + filtro + '.value') != 3 && eval('document.frmbusca.combo_aux_' + filtro + '.value') != 4){
	eval('document.frmbusca.aux_combo_aux_' + filtro + '.value='+combo_aux.value);
	eval('document.frmbusca.combo_aux_' + filtro + '.disabled=true');
	eval("document.all.camposTexto_"+ filtro +".style.display='block'");
	eval("document.all.Texto_"+ filtro +".style.display='block'");
	var div_filtro = eval("document.getElementById('camposTexto_"+ filtro+"');");  
	var div_ou = eval("document.getElementById('Texto_"+ filtro+"');");  
	var contador = eval('document.frmbusca.contador_' + filtro + '.value ');
    var contador_total = eval('document.frmbusca.contador_total_' + filtro + '.value ');
	
	if ((combo_aux.value) != 2) {
	var linha_edit = "<div id='linha"+filtro+contador+"'><input class='editbox' type='text' name='"+filtro+"_"+contador+"'   style='width:"+(tamanho-17)+"px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraEdit(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaEdit(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\""+filtro+"\", document.getElementById(\"aux_combo_aux_" + filtro + "\"),1)'><a href='#' onClick='retiraEdit(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",1)'><img src='/imagens/icones/16x16/btn_menos20.gif' style='border:0;' class='top' alt='<%=tx_lang_TF018(cd_lang)%>'></a></div>"; 
	
	
	if ((combo_aux.value) != 5){
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
		}else{
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV004(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
	}
	
	div_ou.innerHTML = div_ou.innerHTML+linha_ou;  
	div_filtro.innerHTML = div_filtro.innerHTML+linha_edit;  
	
	eval("document.getElementById('" + filtro +"_"+ contador + "').focus();");
	eval('document.frmbusca.' + filtro +"_"+ contador + '.focus();');
	
	}else{
	
	var linha_edit = "<div id='linha"+filtro+contador+"'><input class='editbox' type='text' name='edt_"+filtro+"_"+contador+"'   style='width:"+(tamanho-17)+"px;text-transform: uppercase;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraCombo(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",1);return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo(\"" + tamanho + "\",\"" + filtro + "\", document.getElementById(\"combo_aux_" + filtro + "\"));return false;}' onBlur='escreveValor(\""+filtro+"\",document.getElementById(\"aux_combo_aux_" + filtro + "\"),2)'><a href='#' onClick='retiraEdit(\""+filtro+"\""+",\"linha"+filtro+contador+"\",\"linha_ou"+filtro+contador+"\",1)'><img src='/imagens/icones/16x16/btn_menos20.gif' style='border:0;' alt='<%=tx_lang_TF018(cd_lang)%>' class='top' ></a></div>"; 	
		var linha_ou = "<div id='linha_ou"+filtro+contador+"'><%= tx_lang_CV005(cd_lang)%><input class='editbox' type='text' style='width:10px;visibility:hidden'></div>"; 
	
	div_ou.innerHTML = div_ou.innerHTML+linha_ou;   
	div_filtro.innerHTML = div_filtro.innerHTML+linha_edit;  
	eval("document.getElementById('edt_" + filtro +"_"+ contador + "').focus();");
	eval('document.frmbusca.edt_' + filtro +"_"+ contador + '.focus();');	
	}
	
	iCount++;
	contador++;
	contador_total++;
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
		if (tipo == 2){
		document.getElementById('submit_resumo').style.visibility='hidden';
		}else{
		document.getElementById('submit_resumo').style.visibility='visible';
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
		
				
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		var x1 = ((x-250)-w)/2;
		var x2 = Math.round(x1);
		//alert(div_info.style.width);
		//alert(x);//1280
		//alert(y);//1024
		div_frame.style.width = w;
		div_frame.style.height = z;
		div_frame.style.left = (x2);
		div_frame.style.top = ((y4)/2)-26;
		div_frame.style.visibility = "visible";
		div_frame.style.filter= "alpha(opacity=0)";
		
		
		div_info.style.width = w;
		div_info.style.height = 26;
		div_info.style.left = (x2);
		div_info.style.top = ((y4)/2)-26;
		div_info.style.display = "block";
		div_info.style.filter= "alpha(opacity=92)";
		
		div_info_corpo.style.width = w;
		div_info_corpo.style.height = z;
		div_info_corpo.style.left = (x2);
		div_info_corpo.style.top = ((y4)/2)-2;
		div_info_corpo.style.display = "block";
		div_info_corpo.style.filter= "alpha(opacity=91)";
		
		div_info_rodape.style.width = w;
		div_info_rodape.style.height = 26;
		div_info_rodape.style.left = (x2);
		div_info_rodape.style.top = ((y4)/2)+298;
		div_info_rodape.style.display = "block";
		div_info_rodape.style.filter= "alpha(opacity=92)";
		
	}
}


function escreveValor(filtro, combo_valor, tipo){
	if (combo_valor.id != 'tipo_ordenacao'){
		var combo_valor = combo_valor.value;
		if(combo_valor == 1){
		var texto = "<%=tx_lang_TF002(cd_lang) %> "
		var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
		}else{
			if(combo_valor == 2){
			var texto = "<%=tx_lang_TF003(cd_lang) %> "
			var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
			}else{
				if(combo_valor == 3){
				var texto = "<%=tx_lang_TF005(cd_lang) %> "
				var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
				}else{
					if(combo_valor == 4){
					var texto = "<%=tx_lang_TF006(cd_lang) %> "
					var texto2 = " <%=tx_lang_CV005(cd_lang)%> "
					}else{
						if(combo_valor == 5){
						var texto = "<%=tx_lang_TF004(cd_lang) %> "
						var texto2 = " <%=tx_lang_CV004(cd_lang)%> "
						}
					}
				}	
					
			}
		}
	}else{
		if (combo_valor.value == 0){
			var texto = "<%=tx_lang_004069(cd_lang) %>"
		}else{
			var texto = "<%=tx_lang_004070(cd_lang) %>"
		}
		var texto2 = " <%=tx_lang_004071(cd_lang)%> "	
	}	

	if (tipo == 1){
	var valor_atual = "";
	var valor1 = eval("document.getElementById('"+ filtro+"').value");
	
	if (valor1 ==""){
	valor1 = "(<%=tx_lang_TF009(cd_lang)%>)";
	}
	
	if(eval("document.getElementById('contador_total_"+ filtro+"')")){ 
	var total_filtro = eval("document.getElementById('contador_total_"+ filtro+"').value");	
	
	if (total_filtro >= 1){ 					
		for(i=0; i <=(total_filtro-1);i++) {
		if(eval("document.getElementById('"+ filtro+"_"+ i +"')")){
		valor = eval("document.getElementById('"+ filtro+"_"+ i +"').value") ;
		
		if (valor ==""){
		valor = "(<%=tx_lang_TF009(cd_lang)%>)";
		}
		
		valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>"+ valor + "</span></b>";
		}
		}	
	}
	}
	
	valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;	
	}else{
		if (tipo == 2){
			var valor_atual = "";
			var valor1 = eval("document.getElementById('edt_"+ filtro+"').value");
			
			if (valor1 ==""){
			valor1 = "(<%=tx_lang_TF009(cd_lang)%>)";
			}
		    if(eval("document.getElementById('contador_total_"+ filtro+"')")){ 
			var total_filtro = eval("document.getElementById('contador_total_"+ filtro+"').value");	
			if (total_filtro >= 1){ 					
				for(i=0; i <=(total_filtro-1);i++) {
				if(eval("document.getElementById('edt_"+ filtro+"_"+ i +"')")){
				valor = eval("document.getElementById('edt_"+ filtro+"_"+ i +"').value") ;
				
				if (valor ==""){
				valor = "(<%=tx_lang_TF009(cd_lang)%>)";
				}
				valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b>";
				}	
				}
			}
			}
		valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;	
		}else{
			if (tipo == 3){
			var valor_atual = "";
			var valor1 = eval("document.getElementById('"+ filtro+"').options[eval(document.getElementById('"+ filtro+"').selectedIndex)].text");
			if(eval("document.getElementById('contador_total_"+ filtro+"')")){ 
			var total_filtro = eval("document.getElementById('contador_total_"+ filtro+"').value");	
			
			if (total_filtro >= 1){ 					
				for(i=0; i <=(total_filtro-1);i++) {
				if(eval("document.getElementById('"+ filtro+"_"+ i +"')")){
				if (combo_valor == 5 && eval("document.getElementById('"+ filtro+"').value") !=""){
				valor = eval("document.getElementById('"+ filtro+"').options[eval(document.getElementById('"+ filtro+"_"+ i +"').selectedIndex)].text");
	}else{
				valor = eval("document.getElementById('"+ filtro+"').options[eval(document.getElementById('"+ filtro+"_"+ i +"').selectedIndex)+1].text");
	}
				valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b>";
				}	
				}
			}
			}
			valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;	
			}else{
				if (tipo == 4){
				var valor = eval("document.getElementById('"+ filtro+"i').value");
				var valor_dtf = eval("document.getElementById('"+ filtro+"f').value");
				}else{
					if(tipo==5){
					var valor_dti = eval("document.getElementById('"+ filtro+"i').value");
					var valor = eval("document.getElementById('"+ filtro+"f').value");
					}else{
						var valor_atual = "";
						var valor_tipo = "";
						var valor1 = eval("document.getElementById('"+ filtro+"').options[eval(document.getElementById('"+ filtro+"').selectedIndex)].text");
						var valor_tipo1 = eval("document.getElementById('tipo_"+ filtro+"').options[eval(document.getElementById('tipo_"+ filtro+"').selectedIndex)].text");
						if(eval("document.getElementById('contador_total_"+ filtro+"')")){ 
							var total_filtro = eval("document.getElementById('contador_total_"+ filtro+"').value");	
							if (total_filtro >= 1){ 					
								for(i=0; i <=(total_filtro-1);i++) {
									if(eval("document.getElementById('"+ filtro+"_"+ i +"')")){
										valor = eval("document.getElementById('"+ filtro+"').options[eval(document.getElementById('"+ filtro+"_"+ i +"').selectedIndex)+1].text");
										valor_tipo = eval("document.getElementById('tipo_"+ filtro+"').options[eval(document.getElementById('tipo_"+ filtro+"_"+ i +"').selectedIndex)].text");
										valor_atual = valor_atual + texto2 + "<b><span style='text-transform:uppercase;'>" + valor + "</span></b> ("+ valor_tipo + ") ";
									}	
								}
							}
						}
						if(document.getElementById('ordenacao').value != 'X'){
						valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b> (" + valor_tipo1 + ") " + valor_atual;	
						}else{
						valor_atual = "<b><span style='text-transform:uppercase;'>" + valor1 + "</span></b>" + valor_atual;	
						}
					}
				}
			}
		}
	}	
	//exibeInfo(filtro);
	var div_info_valores = eval("document.getElementById('info_"+ filtro+"');");
	var nome = (eval("document.getElementById('nome_"+ filtro+"').value"));
	
	if (tipo == 6){
		var linha_valor = "<div id='valor"+filtro+"' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- "+ valor_atual + ";</div>"; 
	}else{
		var linha_valor = "<div id='valor"+filtro+"' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- "+ nome +": "+ texto + valor_atual + ";</div>"; 
	}
	
	var linha_data1 = "<div id='valor"+filtro+"' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- "+ nome +": <b><span style='text-transform:uppercase;'>" + valor + "</span></b> a <b><span style='text-transform:uppercase;'>" + valor_dtf + "</span></b>;</div>"; 
	var linha_data2 = "<div id='valor"+filtro+"' style='font:normal;'>&nbsp;&nbsp;&nbsp;&nbsp;- "+ nome +": <b><span style='text-transform:uppercase;'>" + valor_dti + "</span></b> a <b><span style='text-transform:uppercase;'>" + valor + "</span></b>;</div>"; 
	div_info_valores.style.display='block';
	if (tipo == 5){
	div_info_valores.innerHTML = linha_data2;
	}else{
		if (tipo == 4){
		div_info_valores.innerHTML = linha_data1;
		}else{
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

	var y1 = (y/5);
	var y2 = Math.round(y1);
	var y3 = ((y-y2)-z)/2;
	var y4 = Math.round(y3);
	
	var x1 = ((x-250)-w)/2;
	var x2 = Math.round(x1);
		
	document.getElementById('divFrameCR').style.top = ((y4)/2)-86;
	document.getElementById('divFrameCR').style.left = x2;
	document.getElementById('divFrameCR').style.filter = "alpha(opacity=0)";
	document.getElementById('divFrameCR').style.visibility = 'visible';	
		
	document.getElementById('divInfoCR').style.top = ((y4)/2)-86;
	document.getElementById('divInfoCR').style.left = x2;
	document.getElementById('divInfoCR').style.filter = "alpha(opacity=95)";
	document.getElementById('divInfoCR').style.display = 'block';	
	}
}

function FechaDetalhesCR(){
	document.getElementById('divInfoCR').style.display = 'none';
	document.getElementById('divFrameCR').style.visibility = 'hidden';	
}

function CopiaRelatorio(objeto, relatorio){
	var contato = objeto.value;
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/copia_relatorios.asp?cd_view="+relatorio+"&cd_usuario="+contato+"&copia_relatorio=1", true);
        ajax.onreadystatechange = function() {
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/<br>/g,'\n');
					if (vResult.substring(0,3) != 'XXX') {
					  if (confirm(vResult)){
					    var ajax2 = openAjax(); 
					    ajax2.open("GET","/popup/copia_relatorios.asp?cd_view="+relatorio+"&cd_usuario="+contato+"&copia_relatorio=2", true);
						ajax2.send(null); // submete
						window.location.reload()
					  }
					}else{
						vResult = vResult.replace(/XXX/g,'');
						alert(vResult);
					}
				}
			}
		} 
		ajax.send(null); // submete
	}
}

</script>
<style>
#divInfoCR {
	background-color:#b4c7db;
	width:350px;
	height:130px;
	position:absolute;
	border-width:1px;
	border-color:#336699;
	border-style:solid;
	display:none;
	z-index:3;
}
#divInfoCorpoCR{
	padding-left:10px
}

</style>
</head>
<body onLoad="fnc_desabilitaCombo();" >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"  class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
<script>//alert("carregando menu...");</script>
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"  <%If Session("cd_usuario") = "2184" Then%>background="/imagens/fundo_05.jpg" <%End If%>><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop">
				<table width="<%= CStr(vl_width)%>" border="0" align="center" cellpadding="0" cellspacing="0" valign="top">
			  <form name="frmbusca" method="post" action="/import/track_busca.asp" onSubmit="return validSubmit()">
						<tr>
							<td height="50" <%If cd_lang = 0 Then%><%Else%><%End If%>colspan="<%= CStr(vl_colspan) + 2%>" align="left"><font size="2"><br><b><%= tx_lang_A00020(cd_lang)%></b></font><%If cd_lang = 0 or cd_lang = 2 Then%><% If Session("cd_cargo") <> "088" Then%><span style="margin-left:20px"><%Else%><span style="margin-left:150px"><%End If%><%Else%><span style="margin-left:100px"><%End If%><font color="#B4C7DB"><b><a href="/personaliza/cad_view.asp?in_acao=editar&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>"><font color="#B4C7DB"><%= tx_lang_004004(cd_lang)%></font></a> / <a href="#" onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo', 'divInfoRodape',2);"><font color="#B4C7DB"><%= tx_lang_TF001(cd_lang)%></font> </a>/ <a href="#" onClick="javascript:carregaPesquisa('<%=cd_view %>');"><font color="#B4C7DB"><%= tx_lang_TF043(cd_lang)%></font></a><% If Session("cd_cargo") <> "088" Then%> / <a href="#" onClick="javascript:ExibeDetalhesCR();"><font color="#B4C7DB"><%=tx_lang_TF044(cd_lang)%></font></a><%End If%></b></font></span><br>
  <img src="/imagens/barra_tracking.gif"  width="565" border="0"><br><br>                       
								</td>
						</tr>
                        <%
	  sql_campos = "SELECT " &_
				"  M10_CD_DADO, LTRIM(RTRIM("& tx_lang_dado &")) AS M10_NM_DADO, UPPER(LTRIM(RTRIM(M10_AP_CAMPO))) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO, M14_NR_ORDEM "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
				" UNION "&_
	            " SELECT 'KPIX', '(KPI) ' + (SELECT RTRIM("& tx_lang_dado &") AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4))" &_
				" + ' x ' + (SELECT RTRIM("& tx_lang_dado &") AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO,"&_
				" (SELECT RTRIM(M10_AP_CAMPO) AS "&_
				" M10_AP_CAMPO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
				" + 'x' + (SELECT RTRIM(M10_AP_CAMPO) AS M10_AP_CAMPO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS AP_CAMPO, '0', '5', NULL, "&_
				" NULL, NULL, NULL, NULL, NULL, "&_
				" NULL, NULL, '0',NULL, M14_NR_ORDEM"&_
				" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI'"&_
				" ORDER BY M14_NR_ORDEM"						
	
	objrsx.Open sql_campos, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						%>
                         <tr><td align="center" colspan="<%= CStr(vl_colspan) + 2%>"><iframe id="divFrame" src="" style="visibility: hidden; position: absolute; z-index: 2;"></iframe><div id="divInfo" class="divInfo" style="overflow:hidden;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
	<tr height="25">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="center" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<%= tx_lang_TF007(cd_lang)%> <b><%= nm_view%></b></td>
					<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');"><img src="/imagens/icones/16x16/btn_fechar20.gif" width="18" height="17" border="0" alt="<%=tx_lang_D00011(cd_lang)%>"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
    </table></div>
    <div id="divInfoCorpo" class="divInfo">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6" >
     <tr><td align="left" valign="top"><br>&nbsp;&nbsp;<b><%=tx_lang_TF010(cd_lang)%>:</b></td></tr>   
    <tr align="left">                    
     <%if tp_relat = "0" then%>
	 <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_004034(cd_lang)%>;</td>
     <%else%>
     <%if tp_relat = "1" then%>
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_004033(cd_lang)%>;</td><%else%>  
      <%if tp_relat = "2" then%>
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_004032(cd_lang)%> (<%=tx_lang_004033(cd_lang)%>&nbsp;<%=tx_lang_CV004(cd_lang)%>&nbsp;<%=tx_lang_004034(cd_lang)%>);</td>  
     <%end if%> 
     <%end if%>     
      <%end if%>  
      </tr>                      
  	<tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_TF011(cd_lang)%>:</b></td></tr>
    <tr align="left">
 <%if tp_limitador = "0" or not fnc_testaVar(nr_dias) Then%>
    <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF031(cd_lang)%>;</td>  
    <%end if
	if tp_limitador = "1" and fnc_testaVar(nr_dias) Then%>
    <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF026(cd_lang)%>: <%=cd_evento%> - <%=nm_evento_lim%> <br><center>(<%=tx_lang_TF029(cd_lang)%>);</center></td>
    <%end if
	if tp_limitador = "2"  and fnc_testaVar(nr_dias) Then
	if nr_dias = "0" then%>
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF026(cd_lang)%>: <%=cd_evento%> - <%=nm_evento_lim%> <br><center>(<%=tx_lang_TF028(cd_lang)%>&nbsp;<%=dt_eventoi_lim%>);</center></td><%else%>  
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF026(cd_lang)%>: <%=cd_evento%> - <%=nm_evento_lim%> <br><center>(<%=tx_lang_TF027(cd_lang)%>&nbsp;<%=dt_eventoi_lim%>&nbsp;<%=tx_lang_CV004(cd_lang)%>&nbsp;<%=dt_eventof_lim%>);</center></td>  
     <%end if 
	 end if
	 if tp_limitador = "3" and fnc_testaVar(nr_dias) Then
	 if nr_dias = "0" then%>
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF026(cd_lang)%>: <%=cd_evento%> - <%=nm_evento_lim%> <br><center>(<%=tx_lang_TF028(cd_lang)%>&nbsp;<%=dt_eventoi_lim%> e não realizado);</center></td><%else%>  
     <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF026(cd_lang)%>: <%=cd_evento%> - <%=nm_evento_lim%> <br><center><nobr>(<%=tx_lang_TF027(cd_lang)%>&nbsp;<%=dt_eventoi_lim%>&nbsp;<%=tx_lang_CV004(cd_lang)%>&nbsp;<%=dt_eventof_lim%> e não realizado);</nobr></center></td>  
     <%end if 
	 end if%>
     </tr>
    <tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_TF012(cd_lang)%>:</b></td></tr>
    <tr align="left">       
     <%if fnc_testavar(tp_quebra) then%>
	 <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=nm_tp_quebra(tp_quebra)%>;</td>
	 <%else%>
	 <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF030(cd_lang)%>;</td>
     <%end if%>
      </tr>       
	<tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_TF013(cd_lang)%>:</b></td></tr>
    <tr><td align="left" valign="top">
   <%While not objrsx.eof%>
	<nobr>&nbsp;&nbsp;&nbsp;&nbsp;- <%= objrsx("M10_NM_DADO")%>;&nbsp;</nobr><br>
	<%
	objrsx.MoveNext
	Wend
	objrsx.Close
	%>
    </td></tr>
    <tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_TF014(cd_lang)%>:</b></td></tr>
    <tr><td align="left" valign="top"><div id="divInfoFiltros" style="display:none"></div></td></tr>
    <tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_004068(cd_lang)%>:</b></td></tr>
    <tr><td align="left" valign="top"><div id="divInfoOrdenacao" style="display:none"></div></td></tr>
    <tr><td align="left" valign="top"><br><b>&nbsp;&nbsp;<%=tx_lang_TF015(cd_lang)%>:</b></td></tr>
    <tr><td align="left" valign="top">
    <% If in_dt_prev Then%>
    &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF033(cd_lang)%>;
    <% Else %>
    &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF032(cd_lang)%>;
    <% End If%>
    <br>
     <% If in_btn_excel2 Then%>
     &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF035(cd_lang)%>;
    <% Else %>
    &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF034(cd_lang)%>;
    <% End If%> 
    <br>
     <% If in_btn_print2 Then%>
      &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF037(cd_lang)%>;
    <% Else %>
     &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF036(cd_lang)%>;
    <% End If%>
    <br>
     <% If in_doctos Then%>
      &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF039(cd_lang)%>;
    <% Else %>
     &nbsp;&nbsp;&nbsp;&nbsp;- <%=tx_lang_TF038(cd_lang)%>;
    <% End If%>
    </td></tr>
    <tr><td><br></td></tr>
    </table></div>
    <div id="divInfoRodape" class="divInfo" style="overflow:hidden;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td align="left" valign="middle" width="80%">
    <input name="exibeResumo"  id="exibeResumo" type="checkbox" <%if exibe_resumo = 0 Then Response.write "checked"%> onClick="mudaStatusExibe(this);"> <b><%=tx_lang_TF040(cd_lang)%>.</b>
    </td>
    <td width="20%" align="center">
    <input name="submit_resumo" type="submit" class="button" value="<%=tx_lang_TF008(cd_lang)%>">
    </td>
    </tr>
</table>
    </div> 
<iframe id="divFrameCR" src="" style="visibility: hidden; position: absolute; z-index:0;"></iframe>
 <div id="divInfoCR"><div id="divBotaoCR"><img src="/imagens/icones/16x16/btn_fechar22.gif" width="18" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>" align="right" onClick="FechaDetalhesCR();" style="cursor:pointer;"></div><div id="divInfoCorpoCR" style="text-align:left;"><br><b><%= tx_lang_POP109(cd_lang)%>:</b>
<select class="select" style="width:326px;border-style:0px;"  name="cmb_usuario" id="cmb_usuario">
               <%
			     If objrsx.State = adStateOpen Then objrsx.Close()
				 If InStr("040;055;060;045;088", Session("cd_cargo")) > 0 Then
				   sql = " SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO AS DESCRICAO "&_
				         " FROM TUSUARIO U (NOLOCK) "&_
						 " INNER JOIN TPERMISSAO_GRUPO P (NOLOCK) ON P.CD_USUARIO = U.CD_USUARIO "&_
						 " AND U.CD_CARGO <> '131' "&_
                         " ORDER BY U.NM_USUARIO"
                  
				 Else
				   sql = "SELECT CD_USUARIO AS CODIGO, NM_USUARIO AS DESCRICAO FROM TUSUARIO (NOLOCK) WHERE CD_CARGO <> '131' ORDER BY NM_USUARIO"
				 End If	
				 objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				 
				 Do While Not objrsx.Eof
				   %>
                      <option value="<%= objrsx.Fields.Item("CODIGO").Value %>"><%= objrsx.Fields.Item("DESCRICAO")%></option> 
				   <%	
				   objrsx.MoveNext
				   If objrsx.Eof Then Exit Do
				 Loop
			   %>	
               </select>
               <br /><br><center><%=tx_lang_TF045(cd_lang)%></center><br />
    <center><input name="btn_enviar" type="button" class="button" value="OK" style="background-color:#f0f1f6;width:100px" onClick="CopiaRelatorio(document.getElementById('cmb_usuario'),'<%= Trim(cd_view)%>');"/></center>

</div></div>
    </td></tr>
						<%
Do While Not objrsv.Eof
	If objrsv.RecordCount > 20 Then
		cont = objrsv.AbsolutePosition
		If (cont Mod 2) = 1 Then
%>
						<tr height="24" valign="top" style="width:565px">
							<%
		End If
	Else
		Response.Write("<tr height='24' valign='top'>")
	End If
	checked = ""
	If objrsv.Fields.Item("M11_IN_CHECK").Value  Then checked = " checked"
	If objrsv.Fields.Item("M13_IN_PADRAO").Value Then checked = " checked"
		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
		Case "0001" 'Selects - Unidade
	%>
							<td align="right" ><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                          <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>',this);">
<option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="combo" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><select class="select" style="width: <%= CStr(vl_width_form)%>px;display:block" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),3)"> 
									<option value="X"><%= tx_lang_A00022(cd_lang)%></option>
									<option value="01"<%If Session("cd_unid_neg") = "01" Then Response.Write(" selected")%>>Indaiá Logística
									Internacional Ltda.</option>
									<option value="02"<%If Session("cd_unid_neg") = "02" Then Response.Write(" selected")%>>Indaiá Rio
									Logística Ltda.</option>
                                    <option value="07"<%If Session("cd_unid_neg") = "07" Then Response.Write(" selected")%>>Indaiá São Paulo
									Logística Ltda.</option>
									<%
			If Session("cd_cargo") = "001" Then
%>
									<option value="03"<%If Session("cd_unid_neg") = "03" Then Response.Write(" selected")%>>MyIndaiá (
									desenvolvimento )</option>
									<%
			End If
%>
								</select><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" type="text" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:none" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>') ,2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                                
                                <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
							<%
		Case "0005","0006","0007","0008","0594","0661","0126","0471" 'Selects - Grupo, Clientes, Área e Sub-área
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>',this);">
                            <option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then
								If Not (objrsv.Fields.Item("M10_CD_DADO").Value = "0005" and InStr("040;055;060;045", Session("cd_cargo")) > 0) Then
							%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
								End If
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td><nobr><input type="text" style="display:none" value="combo" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><select class="select" style="width: <%= CStr(vl_width_form)%>px;display:block" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);"<%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%> onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <% End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),3)">
									<option value="X" ><%= tx_lang_A00022(cd_lang)%></option>
                                    <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then%>
                                    <option value="">(<%=tx_lang_TF016(cd_lang)%>)</option>
                                    <%
                                    End if%>
									<%
			If Not Session("cargo_interno") = "1" Then
				'selecionas apenas os dados que o usuário cliente tem permissão
				Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				
					Case "0126","0297"  ' 0126 = IMPORTADOR 
						SQL = "SELECT TE.NM_EMPRESA AS DESCRICAO, TE.CD_EMPRESA AS CODIGO,TG.CD_USUARIO "&_
						    " FROM TPERMISSAO_GRUPO TG "&_
						    " INNER JOIN TEMPRESA_EST_GRUPO TEG ON TEG.CD_GRUPO = TG.CD_GRUPO " &_
							" INNER JOIN TEMPRESA_EST TE ( NOLOCK ) ON TE.CD_EMPRESA = TEG.CD_EMPRESA " &_
							" WHERE TG.CD_USUARIO = '" & Session("cd_usuario") & "'"			
					Case "0005" 'SELECIONA O NOME DOS GRUPOS DE EMPRESAS DO CLIENTE
						sql = "SELECT DISTINCT E.CD_GRUPO AS CODIGO, E.NM_GRUPO AS DESCRICAO " &_
									"FROM TGRUPO E ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_GRUPO P ( NOLOCK ) ON ( P.CD_GRUPO = E.CD_GRUPO ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"ORDER BY DESCRICAO"
					Case "0661" 'SELECIONA O NOME DAS EMPRESAS CLIENTE		
					  sql = "SELECT DISTINCT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA + ' - ' + E.AP_EMPRESA AS DESCRICAO " &_
									"FROM TEMPRESA_NAC E ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_GRUPO P ( NOLOCK ) ON ( P.CD_GRUPO = E.CD_GRUPO ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"  AND E.IN_ATIVO   = 1 "&_
									"  AND E.IN_CLIENTE = 1 "&_
									"ORDER BY DESCRICAO"
									
					Case "0006" 'SELECIONA O NOME DAS EMPRESAS CLIENTE	
					  If objrsx.State = adStateOpen Then objrsx.Close()	
					    sql = "SELECT DISTINCT E.CD_EMPRESA AS CODIGO,CASE WHEN LEN(E.NM_EMPRESA) > 22 THEN UPPER(LEFT(E.NM_EMPRESA,22))+'...' + ' ( CNPJ: ' + "&_
					   "SUBSTRING(E.CGC_EMPRESA,1,2)+'.'+SUBSTRING(E.CGC_EMPRESA,3,3)+'.'+SUBSTRING(E.CGC_EMPRESA,6,3)"&_
					   "+'/'+SUBSTRING(E.CGC_EMPRESA,9,4)+'-'+SUBSTRING(E.CGC_EMPRESA,13,2) + ' )' ELSE  UPPER(LEFT(E.NM_EMPRESA,22)) + ' ( CNPJ: ' + "&_
					   "SUBSTRING(E.CGC_EMPRESA,1,2)+'.'+SUBSTRING(E.CGC_EMPRESA,3,3)+'.'+SUBSTRING(E.CGC_EMPRESA,6,3)"&_
					   "+'/'+SUBSTRING(E.CGC_EMPRESA,9,4)+'-'+SUBSTRING(E.CGC_EMPRESA,13,2) + ' )' END AS DESCRICAO " &_
									"FROM TEMPRESA_NAC E ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO P ( NOLOCK ) ON ( P.CD_CLIENTE = E.CD_EMPRESA ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"  AND E.IN_ATIVO   = 1 "&_
									"  AND E.IN_CLIENTE = 1 "&_
									"ORDER BY DESCRICAO"
					  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText				
					  
					  If objrsx.RecordCount = 0 Then
					  sql = "SELECT DISTINCT E.CD_EMPRESA AS CODIGO,CASE WHEN LEN(E.NM_EMPRESA) > 22 THEN UPPER(LEFT(E.NM_EMPRESA,22))+'...' + ' ( CNPJ: ' + "&_
					   "SUBSTRING(E.CGC_EMPRESA,1,2)+'.'+SUBSTRING(E.CGC_EMPRESA,3,3)+'.'+SUBSTRING(E.CGC_EMPRESA,6,3)"&_
					   "+'/'+SUBSTRING(E.CGC_EMPRESA,9,4)+'-'+SUBSTRING(E.CGC_EMPRESA,13,2) + ' )' ELSE  UPPER(LEFT(E.NM_EMPRESA,22)) + ' ( CNPJ: ' + "&_
					   "SUBSTRING(E.CGC_EMPRESA,1,2)+'.'+SUBSTRING(E.CGC_EMPRESA,3,3)+'.'+SUBSTRING(E.CGC_EMPRESA,6,3)"&_
					   "+'/'+SUBSTRING(E.CGC_EMPRESA,9,4)+'-'+SUBSTRING(E.CGC_EMPRESA,13,2) + ' )' END AS DESCRICAO " &_
									"FROM TEMPRESA_NAC E ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_GRUPO P ( NOLOCK ) ON ( P.CD_GRUPO = E.CD_GRUPO ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"  AND E.IN_ATIVO   = 1 "&_
									"  AND E.IN_CLIENTE = 1 "&_
									" ORDER BY DESCRICAO"
					  End If				
									
					Case "0007" 'SELECIONA TODAS AS AREAS
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT A1.NM_GRUPO AS CODIGO, A1.NM_GRUPO AS DESCRICAO " &_
									"FROM TAREA A1 ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_AREA P ( NOLOCK ) ON ( P.CD_AREA = A1.CD_AREA ) " &_
									" WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									" GROUP BY A1.NM_GRUPO"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText			
						
						If objrsx.RecordCount = 0 Then
							sql = "SELECT DISTINCT A.NM_GRUPO AS CODIGO, A.NM_GRUPO AS DESCRICAO " &_
									"FROM TAREA A ( NOLOCK ) " &_
									"WHERE  ISNULL(A.NM_GRUPO,'') <> '' "&_
									" ORDER BY A.NM_GRUPO"
						End If													
					Case "0008" 'SELECIONA TODAS AS SUB-AREAS
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql = "SELECT A.CD_AREA AS CODIGO, A.NM_AREA AS DESCRICAO " &_
									"FROM TAREA A ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_AREA P ( NOLOCK ) ON ( P.CD_AREA = A.CD_AREA ) " &_
									" WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									" ORDER BY A.NM_AREA"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount = 0 Then
							sql = "SELECT A.CD_AREA AS CODIGO, A.NM_AREA AS DESCRICAO " &_
									"FROM TAREA A ( NOLOCK ) " &_
									" ORDER BY A.NM_AREA"
						End If							
		'****************************************** 19/12/2007 - INCLUSÃO DA OPÇÃO CELULAS (FLÁVIO) ****************************									
					Case "0594" 'SELECIONA TODAS AS CELULAS - TCELULA
						sql = "SELECT CD_CELULA AS CODIGO, NM_CELULA AS DESCRICAO FROM TCELULA WHERE CD_CELULA IN "&_
									" (SELECT DISTINCT CD_CELULA "&_
									" FROM TPROCESSO (NOLOCK) "&_
									" WHERE CD_GRUPO in (SELECT DISTINCT CD_GRUPO	FROM TPERMISSAO_GRUPO PE, TEMPRESA_NAC EN "&_
									" WHERE PE.CD_USUARIO = '"& Session("cd_usuario")&"' "&_
									" AND EN.CD_GRUPO = PE.CD_GRUPO) "&_
									" AND ISNULL(CD_CELULA,'') <> '' ) "
		 '******************************************	
				End Select
				If objrsx.State = adStateOpen Then objrsx.Close()
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Preenche o Select com os dados pesquisados na tabela
				Do While Not objrsx.Eof
%>
									<option value="<%= objrsx("CODIGO")%>"><%= Trim(objrsx("DESCRICAO"))%></option>
									<%
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do
				Loop
				objrsx.Close()
			Else
				'seleciona todas as informações para os usuários funcionários
				Select Case objrsv.Fields.Item("M10_CD_DADO").Value
					Case "0005" %><!--#include virtual="/selects/option_grupo_cliente.txt"--><%'Grupo Cliente
					Case "0471" %><!--#include virtual="/selects/option_servico.txt"--><%' Serviço
					Case "0006" %><!--#include virtual="/selects/option_cliente.txt"--><%'Cliente
					Case "0661" %><!--#include virtual="/selects/option_cliente.txt"--><%'Cliente
					Case "0007" %><!--#include virtual="/selects/option_area.txt"--><%'Área
					Case "0008" %><!--#include virtual="/selects/option_subarea.txt"--><%'Sub-área
					Case "0594" %><!--#include virtual="/selects/option_celula.txt"--><%'Células
				End Select
			End If
%>
								</select><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" type="text" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:none" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End if%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                                
                                <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
							<%
		Case "0009","0010","0011","0012","0013","0017","0044","0058","0062","0068","0069","0085","0136","0177","0182","0290","0296","0297","0576","0126","0612","0653","0655","0679","0686","0702","0709","0716","0049"'Outros Selects
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>',this);">
<option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td><nobr><input type="text" style="display:none" value="combo" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><select class="select" style="width: <%= CStr(vl_width_form)%>px;display:block" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),3)">
									<option value="X" ><%= tx_lang_A00022(cd_lang)%></option>
                                    <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then%>
                                    <option value="">(<%=tx_lang_TF016(cd_lang)%>)</option>
                                    <%
                                    End if%>
									<%
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				case "0009" %><!--#include virtual="/selects/option_via_transporte.txt"--><%'MODALIDADE / VIA DE TRANSPORTE
				case "0010","0011" %><!--#include virtual="/selects/option_paises.txt"--><%'PAIS DE ORIGEM / DESTINO
				case "0653","0655" %><!--#include virtual="/selects/option_continentes.txt"--><%'CONTINENTE
				case "0012","0013" %><!--#include virtual="/selects/option_local_embarque.txt"--><%'PORTO / AEROPORTO DE DESTINO / ORIGEM
				case "0017" %><!--#include virtual="/selects/option_canal.txt"--><%'CANAL
				case "0044" %><!--#include virtual="/selects/option_embarcacao.txt"--><%'NAVIO / EMBARCAÇÃO
				case "0058" %><!--#include virtual="/selects/option_transp_rod.txt"--><%'TRANSPORTADORA
				case "0062"
				If Session("cargo_interno") = "1" Then
					   Server.Execute("/selects/option_imp_fornecedor.txt")
					else		
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql="SELECT  DISTINCT TP.CD_GRUPO AS GRUPO, (SELECT COUNT(CD_EMPRESA) " &_
						" FROM TEMPRESA_EST_GRUPO WHERE CD_GRUPO = TP.CD_GRUPO) AS CONT_GRUPO "&_
							"from       TPERMISSAO_GRUPO     TP "&_
							"WHERE  TP.CD_USUARIO='"& Session("cd_usuario") &"' "
							Objrsx.Open sql, objcnn,adOpenStatic,adLockReadOnly,adCmdText
							
							If objrsx.Fields.Item("CONT_GRUPO").Value > 0 Then
								Do While Not objrsx.Eof
								str = Trim(objrsx.Fields.Item("grupo").Value)
								If objrsx.Eof Then Exit Do Else Server.Execute("/selects/option_imp_fornecedor"&str&".txt") 'IMPORTADOR - ALTERAÇÃO GREGORY	
								objrsx.MoveNext
								Loop
							End If 
					end if
				case "0686"
				If Session("cargo_interno") = "1" Then
					   Server.Execute("/selects/option_planejadores.txt")
					else		
						If objrsx.State = adStateOpen Then objrsx.Close()
						sql="SELECT  DISTINCT TP.CD_GRUPO AS GRUPO, (SELECT COUNT(CD_PLANEJADOR) FROM TPLANEJADORES WHERE CD_GRUPO = TG.CD_GRUPO) AS CONT_GRUPO "&_
							"from       TPERMISSAO_GRUPO     TP "&_
							"WHERE  TP.CD_USUARIO='"& Session("cd_usuario") &"' "
							Objrsx.Open sql, objcnn,adOpenStatic,adLockReadOnly,adCmdText
							
							Do While Not objrsx.Eof
								str = Trim(objrsx.Fields.Item("grupo").Value)
								If objrsx.Fields.Item("CONT_GRUPO").Value > 0 Then
								If objrsx.Eof Then Exit Do Else Server.Execute("/selects/option_planejadores"&str&".txt") 'IMPORTADOR - ALTERAÇÃO GREGORY	
								End If 
								objrsx.MoveNext
							Loop
				end if	
				case "0068" %><!--#include virtual="/selects/option_armazem_atracacao.txt"--><%'ARMAZEM DE ATRACACAO
				case "0069" %><!--#include virtual="/selects/option_armazem_descarga.txt"--><%'ARMAZEM DE DESCARGA
				case "0085" %><!--#include virtual="/selects/option_agente.txt"--><%'AGENTE DE CARGA
				case "0126","0297" 'IMPORTADOR
  			        If Session("cargo_interno") = "1" Then
					   Server.Execute("/selects/option_imp_importador.txt")
					else			
					If objrsx.State = adStateOpen Then objrsx.Close()
						sql="SELECT  DISTINCT TP.CD_GRUPO AS GRUPO "&_
							"from       TPERMISSAO_GRUPO     TP "&_
							"WHERE  TP.CD_USUARIO='"& Session("cd_usuario") &"' "
						Objrsx.Open sql, objcnn,adOpenStatic,adLockReadOnly,adCmdText
							Do While Not objrsx.Eof
							str = Trim(objrsx.Fields.Item("grupo").Value)							
							If objrsx.Eof Then Exit Do Else Server.Execute("/selects/option_imp_importador"&str&".txt") 'IMPORTADOR - ALTERAÇÃO GREGORY	
							objrsx.MoveNext
							Loop
					end if
				case "0136" %><!--#include virtual="/selects/option_incoterm.txt"--><%'INCOTERM
				case "0177","0612","0679","0702","0716" %><!--#include virtual="/selects/option_analista_indaia.txt"--><%'ANALISTA INDAIA
				case "0182","0709" %><!--#include virtual="/selects/option_analista_cliente.txt"--><%'ANALISTA CLIENTE
				case "0290" %><!--#include virtual="/selects/option_urf.txt"--><%'URF DE DESPACHO
				case "0296" 'EXPORTADOR
					If Session("cargo_interno") = "1" Then
					   Server.Execute("/selects/option_imp_fornecedor.txt")
					else	
					If objrsx.State = adStateOpen Then objrsx.Close()		
						sql="SELECT  DISTINCT TP.CD_GRUPO AS GRUPO "&_
							"from       TPERMISSAO_GRUPO     TP "&_
							"WHERE  TP.CD_USUARIO='"& Session("cd_usuario") &"' "
						Objrsx.Open sql, objcnn,adOpenStatic,adLockReadOnly,adCmdText
							Do While Not objrsx.Eof
							str = Trim(objrsx.Fields.Item("grupo").Value)
							
							If objrsx.Eof Then Exit Do Else Server.Execute("/selects/option_imp_fornecedor"&str&".txt") 'IMPORTADOR - ALTERAÇÃO GREGORY	
							objrsx.MoveNext
							Loop

					end if
				case "0049" %><!--#include virtual="/selects/option_transportador.txt"--><%'TRANSPORTADOR
				case "0297" %><!--#include virtual="/selects/option_import_nac.txt"--><%'IMPORTADOR
				case "0576" %><!--#include virtual="/selects/option_representante.txt"--><%'REPRESENTANTE
				case "0594" %><!--#include virtual="/selects/option_celula.txt"--><%'CELULAS
			End Select
%>
								</select><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" type="text" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:none" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}"<%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                                <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
								<%
		Case "0103","0294","0553" 'Select - processo urgente, seguro/hermes
%>
							<td height="22" align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>', this);" >
<option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td><nobr><input type="text" style="display:none" value="combo" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><select class="select" style="width: 75px;display:block" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);"<%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%> onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}"<%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),3)">
                            <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then%>
                                    <option value="">(<%=tx_lang_TF016(cd_lang)%>)</option>
                                    <%
                                    End if%>
									<option value="X" selected><%= tx_lang_A00023(cd_lang)%></option>
									<option value="1"><%= tx_lang_A00024(cd_lang)%></option>
									<option value="0"><%= tx_lang_A00025(cd_lang)%></option>
								</select><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" type="text" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:none" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End if%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                                <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>' ></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
							<%			
		Case "0289" 'Select - tipo de pedido follow-up
%>
<td height="22" align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>', this);" >
<option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td><nobr><input type="text" style="display:none" value="combo" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><select class="select" style="width: <%= CStr(vl_width_form)%>px;display:block" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);"<%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%> onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}"<%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),3)">
                            
									<option value="X" ><%= tx_lang_A00022(cd_lang)%></option>
                                    <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then%>
                                    <option value="">(<%=tx_lang_TF016(cd_lang)%>)</option>
                                    <%
                                    End if%>
									<%
			For cont = 0 to UBound(tipo_pedido)
%>
									<option value="<%= cont + 1%>"><%= tipo_pedido(cont)%></option>
									<%
			Next
%>
								</select><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" type="text" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:none" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}" <%End if%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>',document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                                <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>' ></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
							<%
		Case Else
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os filtros de texto simples
%>
							<td align="right">
                            <input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><select class="select" style="width:90px;" name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" onChange="fnc_comboEdt('<%= objrsv("M10_AP_FILTRO")%>', this);">
							<% If objrsv.Fields.Item("M10_CD_DADO").Value <> "0485" Then%>  
                            <option value="1"><%=tx_lang_TF002(cd_lang)%></option>
                            <%End If%>
                            <%If objrsv.Fields.Item("M11_IN_CONTEM").Value Then%>
                            <option value="2"><%=tx_lang_TF003(cd_lang)%></option>
                            <% 
							End if
							If objrsv.Fields.Item("M11_IN_MM").Value Then%>
                            <option value="3"><%=tx_lang_TF005(cd_lang)%></option>
                            <option value="4"><%=tx_lang_TF006(cd_lang)%></option>
                            <%
							End if
							If objrsv.Fields.Item("M11_IN_DIF").Value Then%>
                            <option value="5"><%=tx_lang_TF004(cd_lang)%></option>
                            <%
							End if%>
                            </select><input type="text" style="display:none" value="0" name="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="aux_combo_aux_<%= objrsv("M10_AP_FILTRO")%>"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;" align="right"></div><%End If%></td>
							<td><nobr><input type="text" style="display:none" value="text" name="controle_<%= objrsv("M10_AP_FILTRO")%>" id="controle_<%= objrsv("M10_AP_FILTRO")%>"><input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:<% If objrsv.Fields.Item("M10_CD_DADO").Value <> "0485" Then%>block<%Else%>none<%End If%>" onFocus="enterInput(this);"  <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaEdit('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}"<%End If%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),1)"><input name="edt_<%= objrsv("M10_AP_FILTRO")%>" class="editbox" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;display:<% If objrsv.Fields.Item("M10_CD_DADO").Value <> "0485" Then%>none<%Else%>block<%End If%>;" onFocus="enterInput(this);" <%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaEdit('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));return false;}"<%End if%> onBlur="escreveValor('<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'),2)"><input class="editbox" type="hidden" name="vazio_<%= objrsv("M10_AP_FILTRO")%>" <%If objrsv.Fields.Item("M11_IN_VAZIO").Value Then Response.write "value='V'" else Response.write "value='NV'" end if%> style="display:none"></nobr><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="camposTexto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
                            
                            <td align="left" width="17"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><a href="#" onClick="criaEdit('<%= CStr(vl_width_form)%>','<%= objrsv("M10_AP_FILTRO")%>', document.getElementById('combo_aux_<%= objrsv("M10_AP_FILTRO")%>'));"><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><img align="left" id="img_<%= objrsv("M10_AP_FILTRO")%>2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_<%= objrsv("M10_AP_FILTRO")%>" id="contador_<%= objrsv("M10_AP_FILTRO")%>"><input type="text" style="display:none" value="0" name="contador_total_<%= objrsv("M10_AP_FILTRO")%>" id="contador_total_<%= objrsv("M10_AP_FILTRO")%>"><%End If%></td>
							<%
				Case "1" 'exibe os filtros de datas
					dt_eventoi = "" 
					dt_eventof = ""
					If fnc_TestaVar(checked) Then
						'a data inicial será de 30 dias atrás.
						dt_eventoi = Dateadd("d", -30, Date)
						dt_eventof = Date
					End If
					'Response.write objrsv("M10_CD_BROKER")
					'Response.end
					if fnc_TestaVar(objrsv("M10_CD_BROKER")) then ' se a data não for evento
						data_calendario = objrsv("M10_CD_BROKER")
					else
						data_calendario = "_" & objrsv("M10_AP_FILTRO") & "_"
					end if
					'Response.write data_calendario
					'Response.end
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td width="320px"><nobr><input type="text" style="display:none" value="<%= objrsv("M10_NM_DADO")%>" name="nome_<%= objrsv("M10_AP_FILTRO")%>" id="nome_<%= objrsv("M10_AP_FILTRO")%>"><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%>&nbsp;</label></nobr></td>
                            <td><input name="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" id="combo_aux_<%= objrsv("M10_AP_FILTRO")%>" type="hidden" value="1"><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%><div id="Texto_<%= objrsv("M10_AP_FILTRO")%>" style="display:none;"></div><%End If%></td>
							<td><nobr>
								<input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>i" id="<%= objrsv("M10_AP_FILTRO")%>i" style="width: 70px;" maxlength="10" value="<%= fnc_Mascara(dt_eventoi, 5)%>" onFocus="enterInput(this);" onBlur="fnc_ValidaData(this);escreveValor('<%= objrsv("M10_AP_FILTRO")%>',1,4)">
								<a href="javascript:showCal('Track<%= data_calendario%>i')"><img height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle"></a>
								<input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>f" id="<%= objrsv("M10_AP_FILTRO")%>f" style="width: 70px;" maxlength="10" value="<%= fnc_Mascara(dt_eventof, 5)%>" onFocus="enterInput(this);" onBlur="fnc_ValidaData(this);escreveValor('<%= objrsv("M10_AP_FILTRO")%>',1,5)">
								<a href="javascript:showCal('Track<%= data_calendario%>f')"><img height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle"></a>
								<nobr></td><td><%If objrsv.Fields.Item("M11_IN_VARIOS").Value Then%>
                                <a href="#" onClick="criaEdit();"><img src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><%End If%></td>
							<%
			End Select
	End Select
			
	If objrsv.RecordCount > 20 Then
		If (cont Mod 2) = 0 and cont > 1 Then
%>
						</tr>
						<%
		End If
	Else
		Response.Write("</tr>")
	End If
	
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
objrsv.Close
Response.Flush()

%>
                        
                        <tr align="center">
							<td height="20" colspan="<%= CStr(vl_colspan) + 2%>"><%= tx_lang_A00002(cd_lang) &": "& tx_lang_A00026(cd_lang) &" DD/MM/AAAA."%></td>
						</tr>
                        <tr align="left">
                        <td colspan="<%= CStr(vl_colspan) + 4%>"><br><font size="2"><b><%=tx_lang_004068(cd_lang) %></b></font><br><img src="/imagens/barra_tracking.gif"  width="565" border="0"><br><br>
                        </td>
                        </tr>
                        <tr valign="top" height='24'>
                        <td></td>
                        <td align="right" valign="top"><nobr><input class="editbox" type="text" name="ordenacao_hidden" style="width: 3px;visibility:hidden;"><input type="text" style="display:none" value="" name="nome_ordenacao" id="nome_ordenacao"><label for="ordenacaoX" class="label"><%= tx_lang_004035(cd_lang)%>&nbsp;&nbsp;&nbsp;</label></nobr><div id="Texto_ordenacao" style="display:none;" align="right"></div></td>
                        <td><select class="select" style="width:90px;" name="tipo_ordenacao" id="tipo_ordenacao" onFocus="exibeInfo('ordenacao');" onBlur="escreveValor('ordenacao',document.getElementById('tipo_ordenacao'),6)">
							<option value="0"><%=tx_lang_004069(cd_lang)%></option>
                            <option value="1"><%=tx_lang_004070(cd_lang)%></option>
                            </select><div id="divtipo_ordenacao" style="display:none;"></div></td>
                        <td>
						<select class="select" style="width: <%= CStr(vl_width_form)%>px;display:block" name="ordenacao" onChange="selectOrdenacao(this.value);" id="ordenacao" onBlur="escreveValor('ordenacao',document.getElementById('tipo_ordenacao'),6)" onFocus="exibeInfo('ordenacao');" onKeyPress="if(window.event.shiftKey && event.keyCode == 45){return false;}if(window.event.shiftKey && event.keyCode == 43){criaCombo('<%= CStr(vl_width_form)%>','ordenacao', this);return false;}">
						<option value="X" >(Sem Ordenação)</option>
                        <%
						If objrsx.State = adStateOpen Then objrsx.Close()
						
						sql_campos2 = "SELECT " &_
						"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, CASE WHEN M10_TP_DADO  = '1' AND M10_CD_BROKER IS NOT NULL THEN 'RLZ_' + RTRIM(M10_AP_CAMPO) ELSE CASE WHEN M10_CD_DADO IN ('0373','0018') THEN 'R.' + UPPER(RTRIM(M10_AP_CAMPO)) ELSE UPPER(RTRIM(M10_AP_CAMPO)) END END AS M10_AP_CAMPO, M10_TP_DADO, "&_
						"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
						"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
						"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
						"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
						"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
						"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
						"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
						"  AND M12_IN_ATIVO     = 1 " &_
						"  AND M10_IN_ATIVO     = 1 " &_
						"  AND (M12_IN_MONTA_SQL = 1 OR M10_CD_DADO IN ('0373','0018'))" &_
						"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
						"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"				
				
						objrsx.Open sql_campos2, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						While not objrsx.eof%>
                        <option value="<%= objrsx("M10_CD_DADO")%>%<%= objrsx("M10_AP_CAMPO")%>" ><%= objrsx("M10_NM_DADO")%></option> 
                        <%
                        objrsx.MoveNext
                        Wend
                        objrsx.Close
                        %>
                        </select><div id="camposTexto_ordenacao" style="display:none;"></div>
                        </td>
                        <td align="left" width="17"><a href="#" onClick="criaCombo('<%= CStr(vl_width_form)%>','ordenacao', this);"><img align="left" id="img_ordenacao" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;display:none' class='top' alt='<%=tx_lang_TF017(cd_lang)%>'></a><img align="left" id="img_ordenacao2" src='/imagens/icones/16x16/btn_mais20.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="0" name="contador_ordencao" id="contador_ordenacao"><input type="text" style="display:none" value="0" name="contador_total_ordenacao" id="contador_total_ordenacao"></td>
						</tr> 
                        <tr align="center" colspan="<%= CStr(vl_colspan) + 4%>">  
							<td height="35" colspan="<%= CStr(vl_colspan) + 2%>" valign="bottom">
					<input type="hidden" name="cd_view" value="<%= cd_view%>">
					<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
					<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
					<input type="hidden" name="filtro" value="pesquisa">
					<input name="combo_aux" id="combo_aux_pesquisa" type="hidden" value="0">
                    <input type="hidden" name="pesquisa" value="X">
					<%If exibe_resumo = 1 Then%>
                    <img border=0 src="/imagens/pesquisar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:submit();" style="cursor:pointer;">
                    <!--<img border=0 src="/imagens/pesquisar2.gif" align="middle">
                    <input name="submit" type="submit" class="button" value=" <%= tx_lang_A00027(cd_lang)%> ">-->
                    <%Else%>
                    <img border=0 src="/imagens/pesquisar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape' ,1);" style="cursor:pointer;"> 
                    <!--<img border=0 src="/imagens/pesquisar2.gif" align="middle">
                    <input name="submit2" type="button" class="button" value=" <%= tx_lang_A00027(cd_lang)%> " onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape' ,1);">-->
                    <%End If%>      
                    <img border=0 src="/imagens/cancelar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:document.location='/default.asp';" style="cursor:pointer;"> 
					<!--<input name="cancel" type="button" class="button" value=" <%= tx_lang_A00018(cd_lang)%> " onClick="javascript:document.location='/default.asp';">-->
							</td>
						</tr>
                        <%
if Request("ultima_pesquisa") = 1 Then
	Set cnnMy = Server.CreateObject("ADODB.Connection")
	Set cmdMy = Server.CreateObject("ADODB.Command")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA07;Initial Catalog=MYINDAIA;"&_
					"User ID=sa;Password=123;"
	On error resume next
	cnnMy.Open cnstr
	cmdMy.ActiveConnection = cnnMy

	If objrsx.State = adStateOpen Then objrsx.Close()
	sql = "SELECT MASTER.DBO.ROWCONCAT(M17_CD_FILTRO_DADO+';') AS FILTRO, MASTER.DBO.ROWCONCAT(M17_CD_FILTRO_CONS + ';') AS CONS, MASTER.DBO.ROWCONCAT(M17_CD_FILTRO_COMBO + ';') AS COMBO "&_
	" FROM INDAIA10.MYINDAIA.DBO.M17_VIEW_CONS"&_
	" WHERE M17_CD_VIEW = '" & cd_view & "'"
	objrsx.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
	
	If Not fnc_testaVar(objrsx("FILTRO")) Then 
		%>
		<script>
		alert('Não existe histórico para este relatório!');
		</script>
		<%
	Else
		linha_filtros = objrsx("FILTRO")
		linha_cons    = objrsx("CONS")
		linha_combo   = objrsx("COMBO")
	
		linha_filtros       = Left(linha_filtros, Len(linha_filtros)-1)
		linha_cons          = Left(linha_cons, Len(linha_cons)-1)
		linha_combo         = Left(linha_combo, Len(linha_combo)-1)	
		linha_filtros_item  = Split(linha_filtros, ";", -1)
		linha_cons_item     = Split(linha_cons, ";", -1)
		linha_combo_item    = Split(linha_combo, ";", -1)
		
		For cont_linha_cons_item = 0 to UBound(linha_cons_item)
			If cont_linha_cons_item = 0 Then
			If InStr(linha_cons_item(cont_linha_cons_item), "@") > 0 Then
			datas_item = Split(linha_cons_item(cont_linha_cons_item), "@", -1) 
			%>
				<script>
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>i').focus();
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>i').value = '<%= datas_item(0)%>';
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>f').value = '<%= datas_item(1)%>';
				</script>
				<%
			Else 
				%>
				<script>
				if (document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>')){
				if ('<%= linha_combo_item(cont_linha_cons_item)%>' == '2'){				
					document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').style.display = 'none';
					document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').style.display = 'block';
					document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').focus();
					document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_cons_item(cont_linha_cons_item)%>';
					document.getElementById('combo_aux_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_combo_item(cont_linha_cons_item)%>';
				}else{
					document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').focus();
					document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_cons_item(cont_linha_cons_item)%>';
					if (document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').value == '' && '<%= linha_cons_item(cont_linha_cons_item)%>' != ''){
						alert('O item utilizado na pesquisa não existe mais!');
					}
					document.getElementById('combo_aux_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_combo_item(cont_linha_cons_item)%>';
				}
				}else{
				if ('<%=linha_cons_item(cont_linha_cons_item)%>' != 'X'){
					alert('Alguns filtros da última pesquisa não pertencem mais ao relatório!');
				}
				}
				</script>
				<%
			End If	
			Else
				If linha_filtros_item(cont_linha_cons_item) = linha_filtros_item(cont_linha_cons_item - 1) Then
					%>
					<script>	
					if (document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').type == 'text'){
					criaEdit('<%= CStr(vl_width_form)%>','<%= linha_filtros_item(cont_linha_cons_item)%>', document.getElementById('combo_aux_<%= linha_filtros_item(cont_linha_cons_item)%>'));
					}else{
					criaCombo('<%= CStr(vl_width_form)%>','<%= linha_filtros_item(cont_linha_cons_item)%>', document.getElementById('combo_aux_<%= linha_filtros_item(cont_linha_cons_item)%>'));
					filtro_usado = '<%=linha_filtros_item(cont_linha_cons_item)%>';
					contador_usado = document.getElementById('contador_<%=linha_filtros_item(cont_linha_cons_item)%>').value-1;
					eval("document.getElementById('"+ filtro_usado +"_"+ contador_usado +"').focus();");
					eval("document.getElementById('"+ filtro_usado +"_"+ contador_usado +"').value = '<%= linha_cons_item(cont_linha_cons_item)%>'");
					if (eval("document.getElementById('"+ filtro_usado +"_"+ contador_usado +"').value") == '' && '<%= linha_cons_item(cont_linha_cons_item)%>' != ''){
						alert('O item utilizado na pesquisa não existe mais!');
					}
					}
					</script>
					<%
				Else
				If InStr(linha_cons_item(cont_linha_cons_item), "@") > 0 Then
				datas_item = Split(linha_cons_item(cont_linha_cons_item), "@", -1)
				%>
				<script>
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>i').focus();
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>i').value = '<%= datas_item(0)%>';
				document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>f').value = '<%= datas_item(1)%>';
				</script>
				<%
				Else 
					%>
					<script>
					if (document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>')){
					if ('<%= linha_combo_item(cont_linha_cons_item)%>' == '2'){				
						document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').style.display = 'none';
						document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').style.display = 'block';
						document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').focus();
						document.getElementById('edt_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_cons_item(cont_linha_cons_item)%>';
						document.getElementById('combo_aux_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_combo_item(cont_linha_cons_item)%>';
					}else{
						document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').focus();
						document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_cons_item(cont_linha_cons_item)%>';
						if ( document.getElementById('<%=linha_filtros_item(cont_linha_cons_item)%>').value == '' && '<%= linha_cons_item(cont_linha_cons_item)%>' != ''){
							alert('O item utilizado na pesquisa não existe mais!');
						}
						document.getElementById('combo_aux_<%=linha_filtros_item(cont_linha_cons_item)%>').value = '<%= linha_combo_item(cont_linha_cons_item)%>';
					}
					}else{
					if ('<%=linha_cons_item(cont_linha_cons_item)%>' != 'X'){
						alert('Alguns filtros da última pesquisa não pertencem mais ao relatório!');
					}
					}
					</script>
					<%	
				End If	
				End If			
			End If
		Next
	End If
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set cmdMy = nothing
	set cnnMy = nothing
End If
%>                     
					</form>
				</table>
		  </div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
<%' O filtro pesquisa é uma solução paliativa para ocorrer o check quando tiver apenas 1 filtro %>