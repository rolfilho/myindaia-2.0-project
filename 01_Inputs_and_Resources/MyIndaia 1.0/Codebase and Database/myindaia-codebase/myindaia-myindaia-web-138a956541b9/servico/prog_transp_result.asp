<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Prestadores de Serviços / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 01/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_cntr 'numero do container
Dim nr_nota 'numero da nota fiscal
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim hr_chegada_fabr, hr_entr_terminal, hr_pre_stacking, hr_saida_terminal, hr_solic_ret_vazio, hr_ret_vazio, cd_transp_usuario 

in_comodo = "1"
in_show  = False
cd_tela  = "IMP031"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
Session("flag_alteracao") = "0"
tx_path_excel = "/servico/prog_transp_excel"

If objrsx.State = adStateOpen Then objrsx.Close()
sql = "SELECT CD_TRANSP_ROD FROM TUSUARIO WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText						
cd_transp_usuario = Trim(objrsx.Fields.Item("CD_TRANSP_ROD").Value)

If Request.TotalBytes > 0 Then
	nr_processo = Request.Form("nr_processo") 
	nr_cntr     = Request.Form("nr_cntr")
	cd_transp_proc     = Request.Form("cd_transp_proc")
	
	'atualiza os valores de container
	If fnc_TestaVar(nr_processo) and fnc_TestaVar(nr_cntr) Then
		If Session("cd_cargo")="055" and cd_transp_usuario = cd_transp_proc Then
		
	
		Session("flag_alteracao") = "1"

		
		sql = "UPDATE BROKER.DBO.TPROCESSO_CNTR " &_
		" SET CNPJ_LOCAL_ENTREGA = "
		If fnc_TestaVar(Request.Form("cnpj_local_entrega")) Then sql = sql & "'" & Request.Form("cnpj_local_entrega") & "', " Else sql = sql & " NULL, "
		
		sql = sql & " NR_CTRC = "
		If fnc_testaVar(Request.Form("nr_ctrc")) Then sql = sql & "'" & Request.Form("nr_ctrc") & "', " Else sql = sql & " NULL, "
		
		sql = sql & " IN_ARMAZEM_FABRICA = "
		If fnc_testaVar(Request.Form("in_armazem_fabrica")) Then sql = sql & "'" & Request.Form("in_armazem_fabrica") & "', " Else sql = sql & " NULL, "
				
		sql = sql & " IN_REUTILIZA_EXP = "
		If fnc_testaVar(Request.Form("in_reutiliza_exp")) Then sql = sql & "'" & Request.Form("in_reutiliza_exp") & "', " Else sql = sql & " NULL, "
		
		sql = sql & " DT_PROGRAMACAO = " 
		If IsDate(Request.Form("dt_programacao")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_programacao") &"', 103), "  Else sql = sql &"NULL, "
		
		sql = sql & " DT_DEVOLUCAO_CNTR = " 
		If IsDate(Request.Form("dt_devolucao")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_devolucao") &"', 103), "  Else sql = sql &"NULL, "

        sql = sql & " DT_SAIDA_K10 = " 
		If IsDate(Request.Form("dt_saida_k10")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_saida_k10") &"', 103), "  Else sql = sql &"NULL, "
		
		sql = sql & " TX_LOCAL_DEVOLUCAO_CNTR = "
		If fnc_TestaVar(Request.Form("tx_local_dev_cntr")) and Trim(Request.Form("tx_local_dev_cntr")) <> "n/a" Then	sql = sql & "'" & Request.Form("tx_local_dev_cntr") & "', " Else sql = sql & " NULL, "
		
		sql = sql &" DT_SAIDA_ARM = "
		If IsDate(Request.Form("dt_saida_terminal")) Then 
			If Request.Form("dt_saida_terminal") = "" Then
			  hr_saida_terminal = "00:00:00" 
			Else
			  hr_saida_terminal = Request.Form("hr_saida_terminal") & ":00"
			End If		
		
			sql = sql &"'"& Request.Form("dt_saida_terminal") & " " & hr_saida_terminal & "', " 
		Else 
			sql = sql &"NULL, "
		End If
		
		sql = sql & " NM_MOTORISTA = "
		If fnc_TestaVar(Request.Form("nm_motorista")) Then sql = sql & "'" & Request.Form("nm_motorista") & "', " Else sql = sql & " NULL, "

        sql = sql & " NM_MOTORISTA_DESCIDA = "
		If fnc_TestaVar(Request.Form("nm_motorista_descida")) Then sql = sql & "'" & Request.Form("nm_motorista_descida") & "' " Else sql = sql & " NULL "

		
		sql = sql & " WHERE NR_PROCESSO = '" & nr_processo & "' AND NR_CNTR = '" & nr_cntr & "' "
		'Response.write sql
		'Response.end
		Else
		sql = "UPDATE BROKER.DBO.TPROCESSO_CNTR " &_
		" SET IN_REUTILIZA_EXP = "
		If fnc_testaVar(Request.Form("in_reutiliza_exp")) Then sql = sql & "'" & Request.Form("in_reutiliza_exp") & "', " Else sql = sql & " NULL, "
		
		sql = sql & " DT_DEVOLUCAO_CNTR = " 
		If IsDate(Request.Form("dt_devolucao")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_devolucao") &"', 103), "  Else sql = sql &"NULL, "
		
        sql = sql & " DT_SAIDA_K10 = " 
		If IsDate(Request.Form("dt_saida_k10")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_saida_k10") &"', 103), "  Else sql = sql &"NULL, "
		
		sql = sql & " DT_PROGRAMACAO = " 
		If IsDate(Request.Form("dt_programacao")) Then sql = sql &"CONVERT(DATETIME, '"& Request.Form("dt_programacao") &"', 103), "  Else sql = sql &"NULL, "
		
		sql = sql & " TX_LOCAL_DEVOLUCAO_CNTR = "
		If fnc_TestaVar(Request.Form("tx_local_dev_cntr")) and Trim(Request.Form("tx_local_dev_cntr")) <> "n/a" Then	sql = sql & "'" & Request.Form("tx_local_dev_cntr") & "', " Else sql = sql & " NULL, "
		
		sql = sql &" DT_SAIDA_ARM = "
		If IsDate(Request.Form("dt_saida_terminal")) Then 
			If Request.Form("dt_saida_terminal") = "" Then
			  hr_saida_terminal = "00:00:00" 
			Else
			  hr_saida_terminal = Request.Form("hr_saida_terminal") & ":00"
			End If		
		
			sql = sql &"'"& Request.Form("dt_saida_terminal") & " " & hr_saida_terminal & "', " 
		Else 
			sql = sql &"NULL, "
		End If
		
		sql = sql & " NM_MOTORISTA = "
		If fnc_TestaVar(Request.Form("nm_motorista")) Then sql = sql & "'" & Request.Form("nm_motorista") & "', " Else sql = sql & " NULL, "
		
        sql = sql & " NM_MOTORISTA_DESCIDA = "
		If fnc_TestaVar(Request.Form("nm_motorista_descida")) Then sql = sql & "'" & Request.Form("nm_motorista_descida") & "' " Else sql = sql & " NULL "

		sql = sql & " WHERE NR_PROCESSO = '" & nr_processo & "' AND NR_CNTR = '" & nr_cntr & "' "
		'Response.write sql
		'Response.end
		End If
		'Response.write sql
		'Response.end
		objcnn.Execute(sql)	
	End If
End If
Session("tp_exibir") = 2
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url
				
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css" media="print">
.TabelaPrincipal {overflow: visible;	}
table>tbody		 {overflow: visible; text-align: center;}
td				 {height: 14pt;} 
thead td		 {font-size: 11pt;	text-align: left;}
tfoot td	
{
	text-align: center;
	font-size: 9pt;
	border-bottom: solid 0px ;
}
thead			 {display: table-header-group;	}
tfoot			 {display: table-footer-group;	}
thead th, thead td	{position: static;
 } 

thead tr		 {position: static; } /*prevenir problemas se imprimir depois da table com scroll*/ 
table tfoot tr	 {position: static;}
</style>

<!--Estilo para exibir a página-->
<style type="text/css">
/*BODY
{ 
	background: #FFFFFF; 
	color: #378CEA; 
	font-family: Arial; 
	font-size: 9pt; 
	text-decoration: none
}*/
.TabelaPrincipal 
{
	overflow: auto;
	margin: auto;
	border-color:#FFFFFF
}
td {text-align:left;
	border:#FFFFFF;
}
th 
{
	vertical-align:baseline;
	background-color:#336699;
	border-style: solid;
	color:#FFFFFF;
	border-color: #FFFFFFF;
	border-width: 0px;
	white-space:nowrap;
	vertical-align:middle;
	padding:0px;
}
/*.true 
{
	color:#002034;
	background-color:#F4FFF4;
}
.false {
	color:#441000;
	background-color:#FFF4F4;
}
table {
	margin:0em;
	font-family: Arial; 
	font-size: 9pt;
}
.fn {
	text-align:left;
	color:#B00000;
	}
.ob {
	color:#AA6500;
}
.st {
	color:#0000DD;
}
.nm {
	color:#006000;
	}
.bl{
	color:#003444;
	background-color:#E5E5E5;
}
.un {
	color:#666666;
}
*/.tableBoxOuter {
	width:100%;
	height:100%; /*Determina o tamanho da planilha*/
}
</style>

<script language="javascript" type="text/javascript">
/* Flávio Henrique - Julho/2008 */
var finalizeMe = (function(){
	var global = this,base,safe = false,svType = (global.addEventListener && 2)||(global.attachEvent && 3)|| 0;
	function addFnc(next, f){function t(ev){if(next)next(ev);f(ev);};t.addItem = function(d){if(f != d.getFunc()){if(next){next.addItem(d);}else{next = d;}}return this;};t.remove = function(d){if(f == d){f = null;return next;}else if(next){next = next.remove(d);}return this;};t.getFunc = function(){return f;};t.finalize = function(){if(next)next = next.finalize();return (f = null);};return t;};
	function addFunction(f){if(base){base = base.addItem(addFnc(null, f));}else{base = addFnc(null, f);}};
	function ulQue(f){addFunction(f);if(!safe){switch(svType){case 2:global.addEventListener("unload", base, false);safe = true;break;case 3:global.attachEvent("onunload", base);safe = true;break;default:if(global.onunload != base){if(global.onunload)addFunction(global.onunload);global.onunload = base;}break;}}};
	ulQue.remove = function(f){if(base)base.remove(f);};
	function finalize(){if(base){base.finalize();switch(svType){case 3:global.detachEvent("onunload", base);break;case 2:global.removeEventListener("unload", base, false);break;default:global.onunload = null;break;}base = null;}safe = false;};
	ulQue(finalize);return ulQue;
})();


var InitializeMe = (function(){
	var global = this,base = null,safe = false;
	var listenerType = (global.addEventListener && 2)||(global.attachEvent && 3)|| 0;
	function getStackFunc(next, funcRef, arg1,arg2,arg3,arg4){function l(ev){funcRef((ev?ev:global.event), arg1,arg2,arg3,arg4);if(next)next = next(ev);return (funcRef = null);};l.addItem = function(d){if(next){next.addItem(d);}else{next = d;}};return l;};
	return (function(funcRef, arg1,arg2,arg3,arg4){if(base){base.addItem(getStackFunc(null, funcRef, arg1,arg2,arg3,arg4));}else{base = getStackFunc(null, funcRef, arg1,arg2,arg3,arg4);}if(!safe){switch(listenerType){case 2:global.addEventListener("load", base, false);safe = true;break;case 3:global.attachEvent("onload", base);safe = true;break;default:if(global.onload != base){if(global.onload){base.addItem(getStackFunc(null, global.onload));}global.onload = base;}break;}}});
})();
var queryStrings = (function(out){
    if(typeof location != 'undefined'){
        var temp = location.search||location.href||'';
        var nvp, ofSet;
        if((ofSet = temp.indexOf('?')) > -1){
            temp = temp.split("#")[0];
            temp = temp.substring((ofSet+1), temp.length);
            var workAr = temp.split('&');
            for(var c = workAr.length;c--;){
                nvp = workAr[c].split('=');
                if(nvp.length > 1){out[nvp[0]] = nvp[1];}
            }
        }
    }
    return out;
})({});

var TimedQue = (function(){
	var base, timer;
	var interval = 60;
	var newFncs = null;
	function addFnc(next, f){function t(){next = next&&next();if(f()){return t;}else{f = null;return next;}}t.addItem = function(d){if(next){next.addItem(d);}else{next = d;}return this;};t.finalize = function(){return ((next)&&(next = next.finalize())||(f = null));};return t;}
	function tmQue(fc){if(newFncs){newFncs = newFncs.addItem(addFnc(null, fc));}else{newFncs = addFnc(null, fc);}if(!timer){timer = setTimeout(tmQue.act, interval);}}
	tmQue.act = function(){var fn = newFncs, strt = new Date().getTime();if(fn){newFncs = null;if(base){base.addItem(fn);}else{base = fn;}}base = base&&base();if(base||newFncs){var t = interval - (new Date().getTime() - strt);timer = setTimeout(tmQue.act, ((t > 0)?t:1));}else{timer = null;}};
	tmQue.act.toString = function(){return 'TimedQue.act()';};
	tmQue.finalize = function(){timer = timer&&clearTimeout(timer);base = base&&base.finalize();newFncs = null;};
	return tmQue;
})();

var getElementWithId = (function(){if(document.getElementById){return (function(id){return document.getElementById(id);});}else if(document.all){return (function(id){return document.all[id];});}return (function(id){return null;});})();

function getSimpleExtPxIn(el){
	var temp, temp2, tick = 0, getBorders = retFalse, doCompStyle = retFalse,defaultView,objList = [];
	function retFalse(){return false;}
	retFalse.elTest = retFalse;
	retFalse.iY = retFalse.iX = retFalse.y = retFalse.x = retFalse.w = retFalse.h = retFalse.bb = retFalse.bt = retFalse.bl = retFalse.br = 0;
	function retThis(){return retThis;}
	function gCompStyleBorders(p, el){doCompStyle(p, defaultView.getComputedStyle(el, '' ));}
	function doComputedStyleFloat(p, cs){p.bt = (cs.getPropertyCSSValue('border-top-width').getFloatValue(5));p.bl = (cs.getPropertyCSSValue('border-left-width').getFloatValue(5));p.br = (cs.getPropertyCSSValue('border-right-width').getFloatValue(5));p.bb = (cs.getPropertyCSSValue('border-bottom-width').getFloatValue(5));}
	function doComputedStyleValue(p, cs){p.bt = Math.ceil(parseFloat(s.getPropertyValue('border-top-width')))|0;p.bl = Math.ceil(parseFloat(s.getPropertyValue('border-left-width')))|0;p.br = Math.ceil(parseFloat(s.getPropertyValue('border-right-width')))|0;p.bb = Math.ceil(parseFloat(s.getPropertyValue('border-bottom-width')))|0;}
	function gClientBorders(p, el){if(el.clientWidth||el.clientHeight){p.bb = (el.offsetHeight - (el.clientHeight + (p.bt = el.clientTop|0)))|0;p.br = (el.offsetWidth - (el.clientWidth + (p.bl = el.clientLeft|0)))|0;}}
	function getInterfaceObj(el){var lastTick = NaN;var offsetParent = getSimpleExtPxInFn(el.offsetParent)||retFalse;function p(doTick){if(doTick){tick = (1+tick)%0xEFFFFFFF;}if(tick != lastTick){lastTick = tick;offsetParent();getBorders(p, el);p.iY = (p.y = (offsetParent.iY + (el.offsetTop|0))) + p.bt;p.iX = (p.x = (offsetParent.iX + (el.offsetLeft|0))) + p.bl;p.w = el.offsetWidth|0;p.h = el.offsetHeight|0;}return p;}p.elTest = function(elmnt){return (elmnt == el);};p.iY = p.iX = p.w = p.h = p.y = p.x = p.bb = p.bt = p.bl = p.br = 0;return (objList[objList.length] = p);}
	function getSimpleExtPxInFn(el){if((!el)||(el == document)){return retFalse;}for(var c = objList.length;c--;){if(objList[c].elTest(el)){return objList[c];}}return getInterfaceObj(el);}
	function setSpecialObj(el){var lastTick = NaN;function p(doTick){if(doTick){tick = (1+tick)%0xEFFFFFFF;}return p;}p.elTest = function(elmnt){return (elmnt == el);};p.iY = p.iX = p.w = p.h = p.y = p.x = p.bb = p.bt = p.bl = p.br = 0;objList[objList.length] = p;}
	if((typeof el.offsetParent != 'undefined')&&(typeof el.offsetTop == 'number')&&(typeof el.offsetWidth == 'number')){if((typeof el.clientTop == 'number')&&(typeof el.clientWidth == 'number')){getBorders = gClientBorders;}else if((defaultView = document.defaultView)&&defaultView.getComputedStyle &&(temp = defaultView.getComputedStyle(el, '' ))&&(((temp.getPropertyCSSValue)&&(temp2 = temp.getPropertyCSSValue('border-top-width'))&&(temp2.getFloatValue)&&(doCompStyle = doComputedStyleFloat))||((temp.getPropertyValue)&&(doCompStyle = doComputedStyleValue)))){getBorders = gCompStyleBorders;temp2 = temp = null;}if(document.documentElement){setSpecialObj(document.documentElement);}if(document.body){setSpecialObj(document.body);}return (getSimpleExtPxIn = getSimpleExtPxInFn)(el);}else{retThis.elTest = retFalse;retThis.iY = retThis.iX = retThis.y = retThis.x = retThis.w = retThis.h = retThis.bb = retThis.bt = retThis.bl = retThis.br = NaN;return (getSimpleExtPxIn = retThis);}
}

function getNewFILCFncStac(fnc){function getNewFnc(f){var next = null;function t(a){next = next&&next(a);return (f(a))?t:next;}t.finalize = function(){next = next&&next.finalize();return (f = null);};t.addItem = function(d){if(f != d){if(next){next.addItem(d);}else{next = getNewFnc(d);}}return this;};return t;}var base = getNewFnc(fnc);fnc = function(a){base = base&&base(a);};fnc.addItem = function(d){if(base){base.addItem(d)}else{base = getNewFnc(d);}};fnc.finalize = function(){return (base = base&&base.finalize());};return fnc;}

function GlobalEventMonitor(eventName, functinRef){//alert("aqui")
	var finalize, global = this;
	var monitors = {};
	var onName = ['on',''];
	function mainMonitor(eventName, functinRef){
		var monitor = monitors[eventName];
		if(monitor){
			monitor(functinRef);
		}else{
			setEventMonitor(eventName, functinRef);
		}
	}
	function setListener(eventName, longName, fncStack){
		global.addEventListener(eventName, fncStack, false);
		return true;
	}
	function setListener_aE(eventName, longName, fncStack){
		global.attachEvent(longName, fncStack);
		return true;
	}
	function oldHandler(f){return (function(e){f(e);return true;});}
	function retFalse(){return false;}
	function setEventMonitor(eventName, functinRef){
		var fncStack, longName;
		onName[1] = eventName;
		longName = onName.join('');
		function main(funcRef){
			if(funcRef){
				fncStack.addItem(funcRef);
				globalCheck();
			}
		}
		function globalCheck(){
			if(global[longName] != fncStack){
				if(global[longName]){
					fncStack.addItem(oldHandler(global[longName]));
				}
				global[longName] = fncStack;
			}
		}
		fncStack = getNewFILCFncStac(functinRef);
		if(setListener(eventName, longName, fncStack)){
			globalCheck = retFalse;
		}else{
			globalCheck();
		}
		finalize.addItem(fncStack.finalize);
		monitors[eventName] = main;
		functinRef = null;
	}
	if(!global.addEventListener){
		if(global.attachEvent){
			setListener = setListener_aE;
		}else{
			setListener = retFalse;
		}
	}
	finalizeMe((finalize = getNewFILCFncStac(
		function(){
			finalize = monitors = null;
		})
	));
	(GlobalEventMonitor = mainMonitor)(eventName, functinRef);
	functinRef = null;
}

var tableScroll = (function(){//alert("aqui")
	var global = this, finalise, tableList = {};
	var notOnScroll = true, notAbort = true;
	var overrideStyles = {
		margin:[{keys:['margin','marginBottom','marginLeft','marginRight','marginTop'],value:'0px'}],
		padding:[{keys:['padding','paddingBottom','paddingLeft','paddingRight','paddingTop'],value:'0px'}],
		border:[
			{keys:['border','borderBottom','borderLeft','borderRight','borderTop'],value:'0px none #FFFFFF'},
			{keys:['borderWidth','borderLeftWidth','borderRightWidth','borderBottomWidth','borderTopWidth'],value:'0px'},
			{keys:['borderStyle','borderRightStyle','borderLeftStyle','borderBottomStyle','borderTopStyle'],value:'none'}
		],
		overflow:[{keys:['overflow'],value:'hidden'}],
		positionRel:[{keys:['position'],value:'relative'}],
		positionAbs:[{keys:['position'],value:'absolute'}],
		top:[{keys:['top'],value:'0px'}],
		left:[{keys:['left'],value:'0px'}],
		zIndex:[{keys:['zIndex'],value:2}]
	};
	function setStyleProps(styleObj){
		var data, dArray;
		for(var c = 1;c < arguments.length;c++){
			if((data = overrideStyles[arguments[c]])){
				for(var d = data.length;d--;){
					dArray = data[d].keys;
					for(var e = dArray.length;e--;){
						styleObj[dArray[e]] = data[d].value;
					}
				}
			}
		}
		return true;
	}
	function setClass(el,val){
		if(el.setAttribute){el.setAttribute('class',val);}
		return (el.className = val);
	}
	function retFalse(){return false;}
	function TableScroll(id){
		var midAbsDiv, parent, vHeaderAbsStyle, vHeaderRelStyle, hHeaderAbsStyle, hHeaderRelStyle;
		var midAbsDivStyle, midAbsinerDivStyle, inRelDivStyle, outRelDivDim;
		var lastScrollTop = NaN, lastScrollLeft = NaN, lastWidth = NaN, lastHeight = NaN, tableDim, table = getElementWithId(id);
		var midRelinerDivStyle, midRelinerDiv, testCellDim;
		function position(){//alert("aqui")
				var nh,nw,size,th,tw,cellWidth,celHeight,st = midAbsDiv.scrollTop, sl = midAbsDiv.scrollLeft, h = outRelDivDim(true).h, w = outRelDivDim.w;
				if((size = ((w != lastWidth)||(h != lastHeight)))||(st != lastScrollTop)||(sl != lastScrollLeft)){
					hHeaderRelStyle.left = (((cellWidth = (testCellDim().x - tableDim().iX)) + (lastScrollLeft = sl)) * -1)+'px';//position
					vHeaderRelStyle.top = (((celHeight = (testCellDim.y - tableDim.iY)) + (lastScrollTop = st)) * -1)+'px';
					if(size){
						vHeaderRelStyle.width = vHeaderAbsStyle.width = midAbsDivStyle.left = hHeaderAbsStyle.left = (cellWidth+'px');
						hHeaderRelStyle.height = hHeaderAbsStyle.height = midAbsDivStyle.top = vHeaderAbsStyle.top = (celHeight+'px');
						inRelDivStyle.left = (cellWidth * -1)+'px';
						inRelDivStyle.top = (celHeight * -1)+'px';
						midRelinerDivStyle.width = midAbsinerDivStyle.width = ((tw = tableDim.w) - cellWidth)+'px';
						midRelinerDivStyle.height = midAbsinerDivStyle.height = ((th = tableDim.h) - celHeight)+'px';
						midAbsDivStyle.height = vHeaderAbsStyle.height = (((nh = ((lastHeight = h) - celHeight)) > celHeight)?nh:celHeight)+'px';
						midAbsDivStyle.width = hHeaderAbsStyle.width = (((nw = ((lastWidth = w) - cellWidth)) > cellWidth)?nw:cellWidth)+'px';
						hHeaderRelStyle.width = inRelDivStyle.width = tw + 'px';
						vHeaderRelStyle.height = inRelDivStyle.height = th + 'px';
					}
				}
				return notOnScroll;
		}
		function onScroll(){
			notOnScroll = false;
			position();
		}
		function onSize(){
			position();
			return true;
		}
		finalise.addItem(function(){
			testCellDim = midRelinerDivStyle = midRelinerDiv = 
			midAbsinerDivStyle =  tableDim = vHeaderAbsStyle = vHeaderRelStyle = hHeaderAbsStyle = hHeaderRelStyle = inRelDivStyle = outRelDivDim = midAbsDiv = parent = table = null;
			})
		if(
			table&&
			(typeof table.scrollTop == 'number')&&
			(typeof table.offsetHeight == 'number')&&
			table.tagName&&
			table.appendChild&&
			table.cloneNode&&
			table.getAttribute&&
			table.getElementsByTagName&&
			(parent = table.parentNode)&&
			parent.insertBefore
			
		   ){//alert("aqui")
			InitializeMe(function(){
				var newTable, testCell;
				var vHeaderAbs, vHeaderRel, hHeaderAbs, hHeaderRel,outRelDiv, midAbsinerDiv, inRelDiv;
				if(
					(notAbort)&&
					(testCell = table.getElementsByTagName('td')[0])&&
					(newTable = table.cloneNode(true))&&
					(outRelDiv = document.createElement('DIV'))&&
					(setClass(outRelDiv, 'tableBoxOuter'))&&
					(midAbsDiv = document.createElement('DIV'))&&
					(midRelinerDiv = document.createElement('DIV'))&&
					(midAbsinerDiv = document.createElement('DIV'))&&
					(inRelDiv = document.createElement('DIV'))&&
					(vHeaderAbs = document.createElement('DIV'))&&
					(vHeaderRel = document.createElement('DIV'))&&
					(hHeaderAbs = document.createElement('DIV'))&&
					(hHeaderRel = document.createElement('DIV'))&&
					(setStyleProps(outRelDiv.style, 'positionRel', 'padding'))&&
					(midAbsDivStyle = midAbsDiv.style)&&
					(setStyleProps(midAbsDivStyle, 'positionAbs', 'padding', 'margin', 'border', 'zIndex'))&&
					(midRelinerDivStyle = midRelinerDiv.style)&&
					(setStyleProps(midRelinerDivStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left'))&&
					(midAbsinerDivStyle = midAbsinerDiv.style)&&
					(setStyleProps(midAbsinerDivStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left'))&&
					(inRelDivStyle = inRelDiv.style)&&
					(setStyleProps(inRelDivStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left'))&&
					(vHeaderAbsStyle = vHeaderAbs.style)&&
					(setStyleProps(vHeaderAbsStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left', 'zIndex'))&&
					(vHeaderRelStyle = vHeaderRel.style)&&
					(setStyleProps(vHeaderRelStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left'))&&
					(hHeaderAbsStyle = hHeaderAbs.style)&&
					(setStyleProps(hHeaderAbsStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left', 'zIndex'))&&
					(hHeaderRelStyle = hHeaderRel.style)&&
					(setStyleProps(hHeaderRelStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left'))&&
					(setStyleProps(table.style, 'margin'))&&
					(midAbsDiv.appendChild(midRelinerDiv))&&
					(midRelinerDiv.appendChild(midAbsinerDiv))&&
					(midAbsinerDiv.appendChild(inRelDiv))&&
					(outRelDiv.appendChild(midAbsDiv))&&
					(vHeaderAbs.appendChild(vHeaderRel))&&
					(hHeaderAbs.appendChild(hHeaderRel))&&
					(outRelDiv.appendChild(vHeaderAbs))&&
					(outRelDiv.appendChild(hHeaderAbs))&&
					(parent.insertBefore(outRelDiv, table))&&
					(!isNaN((outRelDivDim = getSimpleExtPxIn(outRelDiv)).w))&&
					(inRelDiv.appendChild(table))&&
					(!isNaN((testCellDim = getSimpleExtPxIn(testCell)).w))&&
					(!isNaN((tableDim = getSimpleExtPxIn(table)).w))&&
					(hHeaderRel.appendChild(newTable))&&
					(newTable = table.cloneNode(true))&&
					(vHeaderRel.appendChild(newTable))
				   ){
					midAbsDivStyle.overflow = 'scroll';
					if(midAbsDiv.addEventListener){
						midAbsDiv.addEventListener('scroll', onScroll, false);
					}else if(midAbsDiv.attachEvent){
						midAbsDiv.attachEvent('onscroll', onScroll);
					}else{
						midAbsDiv.onscroll = onScroll;
					}
					GlobalEventMonitor('resize', onSize);
					position();
					TimedQue(position);
				}else{
					notAbort = false;
				}
			});
		}else{
			notAbort = false;
		}
		return true;
	}
	function main(){
		var id;
		for(var c = 0;c < arguments.length;c++){
			id = arguments[c];
			if(notAbort&&!tableList[id]){
				tableList[id] = TableScroll(id);
			}
		}
	}
	if(
		(!global.queryStrings||!queryStrings['noTableScroll'])&&
		global.setTimeout&&
		global.document&&
		document.createElement
	){
		finalizeMe((finalise = getNewFILCFncStac(function(){
			finalise = tableList = null;
		})));
		return main;
	}else{
		return retFalse;
	}
})();

function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "kpi_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}



function fnc_ValidaHora(edit) {
  var valida = true;
  var hrs    = (edit.value.substring(0,2));
  var min    = (edit.value.substring(3,5));
  var pontos = (edit.value.substring(2,3));

  if (edit.value != '') {
  	if ((isNaN(parseInt(hrs))) || (isNaN(parseInt(min))) || (hrs < 00 ) || (hrs > 23) || ( min < 00) ||( min > 59) || (pontos != ':') || (edit.value.length < 5)){ 
		valida = false; 
	}
  }else{
    valida = true; 
  }

  if (valida == false) {
	  alert('Atenção: Hora inválida!');
	  edit.select();
	  edit.focus();
  } 
  return valida;
}

function preencheCampo(qtde, processo, campo, campo_alterado){
	if (event.keyCode != 37 && event.keyCode != 39) {
		var campo_final;
		for (var cont_qtde = 1; cont_qtde <= qtde;cont_qtde++) {
			campo_final = String(campo) + String(processo) + String(cont_qtde)
			if (campo_final != campo_alterado){
				document.getElementById(campo_final).value = document.getElementById(campo_alterado).value;
			}			
		}
	}	
}

function reutilizaExp(objeto, cont){
	if (document.getElementById(objeto).checked){
		document.getElementById('tx_local_dev_cntr'+cont).value = 'n/a';
		document.getElementById('tx_local_dev_cntr'+cont).disabled = true;
	}else{
		document.getElementById('tx_local_dev_cntr'+cont).disabled = false;		
		document.getElementById('tx_local_dev_cntr'+cont).value = '';
		//document.getElementById('tx_local_dev_cntr'+cont).onkeypress = '';
	}
}

function mascaraData(campoData){
              var data = campoData.value;
              if (data.length == 2){
                  data = data + '/';
                  campoData.value = data;
      			  return true;              
              }
              if (data.length == 5){
                  data = data + '/';
                  campoData.value = data;
                  return true;
              }
		 }

function mascaraHora(campoHora){
              var hora = campoHora.value;
              if (hora.length == 2){
                  hora = hora + ':';
                  campoHora.value = hora;
      			  return true;              
              }
         }
//-->
</script>
</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/30/seta.jpg';">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0"  class="table">
  <tr valign="top">
    <td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
<style type="text/css">
<!--
#apDiv1 {
	visibility: hidden;
}
-->
#apDiv3 {
	visibility: hidden;
}

#apDiv4 {
	visibility: hidden;
}



</style>
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="50" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid">
				<table width="2000px" border="0" cellspacing="1" cellpadding="0">
					<tr height="35" class="gridtit">
                        <td><nobr>&nbsp;Transportadora&nbsp;</nobr></td>
						<td><nobr>&nbsp;Doctos. disponibilizados para transportadora&nbsp;</nobr></td>
						<td><nobr>&nbsp;Doctos. retirados pela transportadora&nbsp;</nobr></td>
						<td><nobr>&nbsp;Data da programação&nbsp;</nobr></td>
						<td><nobr>&nbsp;Nr. Pedido&nbsp;</nobr></td>
						<td><nobr>&nbsp;Analista Cliente&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Mercadoria&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Nr. Ref. Indaiá&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Local de Retirada Container (Terminal)&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Saída do Terminal&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Local de entrega/CNPJ&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Nr. Contâiner</nobr>&nbsp;</td>
                        <td><nobr>&nbsp;Tipo do contâiner&nbsp;</nobr></td>
                        <td><nobr>&nbsp;CTRC</nobr>&nbsp;</td>
                        <td><nobr>&nbsp;Armazenagem no K10?&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Data de saída K10&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Reutilização na exportação?&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Transportadora (K10)&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Data de devolução container vazio&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Local de devolução do container vazio&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Frota/Motorista Subida&nbsp;</nobr></td>
                        <td><nobr>&nbsp;Frota/Motorista Descida&nbsp;</nobr></td>
                        <%If Session("cd_cargo")="055" Then%> 
						<td>&nbsp;&nbsp;OK&nbsp;&nbsp;</td>
                        <%End If%>
					</tr>
					<%
					
'verifica se existe container no processo
sql = "SELECT PR.CD_TRANSP_NAC, TR.NM_TRANSP_ROD AS NM_TRANSP,  R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
	  "	CONVERT(VARCHAR,F041.DT_REALIZACAO,103) AS EV041, CONVERT(VARCHAR,F669.DT_REALIZACAO,103) AS EV669, " &_
      " (SELECT REPLACE(REPLACE(MASTER.DBO.RowConcat(DISTINCT RTRIM(RC.CD_REFERENCIA)+'/'+RC.NR_ITEM_PO+'<br> ')+'#!','<br> #!',''),'#!','') FROM BROKER.DBO.TREF_CLIENTE RC (NOLOCK) WHERE RC.NR_PROCESSO = R.NR_PROCESSO AND RC.TP_REFERENCIA = '01') AS PEDIDO, " &_
	  " (SELECT COUNT(PC1.NR_CNTR) FROM TPROCESSO_CNTR PC1 WHERE PC1.NR_PROCESSO = R.NR_PROCESSO) AS QTDE_CNTR, " & _
      " CC.NM_CONTATO, (SELECT REPLACE(REPLACE(MASTER.DBO.RowConcat(DISTINCT RTRIM(M.AP_MERCADORIA)+'<br> ')+'#!','<br> #!',''),'#!','')  " &_
	  "                  FROM BROKER.DBO.TMERCADORIA M (NOLOCK) " &_
      "                  INNER JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.CD_MERCADORIA = M.CD_MERCADORIA) " &_
      "                  WHERE DM.NR_PROCESSO = R.NR_PROCESSO) AS MERCADORIA, " &_
      " SUBSTRING(PR.NR_PROCESSO,5,15) AS PROCESSO, PC.CD_LOCAL_RET_CNTR, PC.CNPJ_LOCAL_ENTREGA, PC.NR_CNTR, TC.NM_TP_CNTR, PC.NR_CTRC, PC.IN_ARMAZEM_FABRICA, " &_
      " CASE PC.IN_ARMAZEM_FABRICA WHEN '1' THEN 'Sim' ELSE 'Não' END IN_ARMAZEM_FABRICA_OBS, PC.IN_REUTILIZA_EXP, CASE PC.IN_REUTILIZA_EXP WHEN '1' THEN 'Sim' ELSE 'Não' END IN_REUTILIZA_EXP_OBS, CONVERT(VARCHAR, PC.DT_DEVOLUCAO_CNTR,103) AS DT_DEVOLUCAO, PC.TX_LOCAL_DEVOLUCAO_CNTR, " &_
"	  CONVERT(VARCHAR,PC.DT_SAIDA_ARM,103) AS DT_SAIDA_ARM, LEFT(CONVERT(VARCHAR,PC.DT_SAIDA_ARM,108),5) AS HR_SAIDA_ARM, NM_MOTORISTA, NM_MOTORISTA_DESCIDA, CONVERT(VARCHAR, PC.DT_PROGRAMACAO,103) AS DT_PROGRAMACAO, AZM.NM_ARMAZEM, CONVERT(VARCHAR, PC.DT_SAIDA_K10,103) AS DT_SAIDA_K10, TK10.NM_TRANSP_ROD AS NM_TRANSP_K10 " &_
			"FROM TREL_SERV_TRANSP R (NOLOCK) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
			"  INNER JOIN BROKER.DBO.TPROCESSO_CNTR PC   (NOLOCK) ON (PC.NR_PROCESSO = PR.NR_PROCESSO AND PC.NR_CNTR = R.NR_CNTR) "&_
            "  INNER JOIN BROKER.DBO.TTRANSP_ROD TR      (NOLOCK) ON (TR.CD_TRANSP_ROD = PR.CD_TRANSP_NAC) "&_
            "  LEFT JOIN BROKER.DBO.TTRANSP_ROD TK10     (NOLOCK) ON (TK10.CD_TRANSP_ROD = TR.CD_TRANSP_ARMAZEM_FABRICA) "&_
            "  INNER JOIN BROKER.DBO.TEMPRESA_NAC EN     (NOLOCK) ON (EN.CD_EMPRESA = R.CD_CLIENTE) "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F041       (NOLOCK) ON (F041.NR_PROCESSO = R.NR_PROCESSO AND F041.CD_EVENTO = '041') "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F669       (NOLOCK) ON (F669.NR_PROCESSO = R.NR_PROCESSO AND F669.CD_EVENTO = '669') "&_
            "  LEFT JOIN BROKER.DBO.TFOLLOWUP F276       (NOLOCK) ON (F276.NR_PROCESSO = R.NR_PROCESSO AND F276.CD_EVENTO = '276') "&_
			"  LEFT JOIN BROKER.DBO.TARMAZEM AZM         (NOLOCK) ON (AZM.CD_ARMAZEM = ISNULL(CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ATRACACAO)) "&_
            "  INNER JOIN BROKER.DBO.TCLIENTE_CONTATO CC (NOLOCK) ON (CC.CD_CONTATO = PR.CD_CONTATO AND CC.CD_PRODUTO = PR.CD_PRODUTO AND CC.CD_UNID_NEG = PR.CD_UNID_NEG AND CC.CD_CLIENTE = PR.CD_CLIENTE) "&_
            "  INNER JOIN BROKER.DBO.TTP_CNTR TC         (NOLOCK) ON (TC.TP_CNTR = PC.TP_CNTR) "&_
			"WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' AND R.NR_IDENT = "& nr_ident &" AND PR.TP_ESTUFAGEM IN ('0','1') "&_
			"ORDER BY R.NR_PROCESSO, R.NR_CNTR"
Session("sql_transp") = sql			
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'Response.write sql
'Response.end
'cd_transp_usuario = "0404"
if objrs.RecordCount > 0 then
	nr_processo_atual = ""
	cont_qtde = 1
	'Exibe os resultados do relatório e aplica a personalização
	Do While not objrs.Eof
		'dados do prcesso
		
		nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
		nr_cntr     = Trim(objrs.Fields.Item("NR_CNTR").Value)			
		'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= objrs.AbsolutePosition%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= objrs.AbsolutePosition%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= objrs.AbsolutePosition%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<form name="frmgrava" action="<%= url%>" method="post">
							<input type="hidden" name="nr_processo" value="<%= nr_processo%>">
							<input type="hidden" name="nr_cntr" value="<%= nr_cntr%>">
                            <input type="hidden" name="cd_transp_proc" value="<%= objrs.Fields.Item("CD_TRANSP_NAC").Value%>">
							<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_TRANSP").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("EV041").Value%>&nbsp;</nobr></td>
							<td><nobr>&nbsp;<%= objrs.Fields.Item("EV669").Value%>&nbsp;</nobr></td>
                            <%If Session("cd_cargo")="055" and cd_transp_usuario = objrs.Fields.Item("CD_TRANSP_NAC").Value Then%> 
                            	<td align="center"><input class="editbox" type="text" id="dt_programacao" name="dt_programacao" value="<%= fnc_Mascara(objrs.Fields.Item("DT_PROGRAMACAO").Value, 5)%>" style="width:70px;margin-left:30px;" maxlength="10" onBlur="fnc_ValidaData(this);" onkeypress="if (event.keyCode == 47){return false;}mascaraData(this);"></td>
                            <%Else%>
                            	<td align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_PROGRAMACAO").Value, 5)%></td>
                            <%End If%>                            
							<td><nobr><%= objrs.Fields.Item("PEDIDO").Value%>&nbsp;</nobr></td>
							<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_CONTATO").Value%>&nbsp;</nobr></td>
							<td><nobr><%= objrs.Fields.Item("MERCADORIA").Value%>&nbsp;</nobr></td>
							<td><nobr>&nbsp;<%= objrs.Fields.Item("PROCESSO").Value%>&nbsp;</nobr></td>
							<td><nobr>&nbsp;<%= objrs.Fields.Item("NM_ARMAZEM").Value%>&nbsp;</nobr></td>
                             <%If Session("cd_cargo")="055" and cd_transp_usuario = objrs.Fields.Item("CD_TRANSP_NAC").Value Then%> 
                            <td><nobr>Data: <input class="editbox" type="text" name="dt_saida_terminal" value="<%=objrs.Fields.Item("DT_SAIDA_ARM").Value%>" style="width: 70px;" maxlength="10" onBlur="fnc_ValidaData(this);" onkeypress="if (event.keyCode == 47){return false;}mascaraData(this);"><br>Hora: <input class="editbox" type="text" name="hr_saida_terminal" value="<%=objrs.Fields.Item("HR_SAIDA_ARM").Value%>" style="width: 70px;" maxlength="5" onBlur="fnc_ValidaHora(this);" onkeypress="mascaraHora(this);"></td>
							<td><nobr>&nbsp;<input class="editbox" type="text" name="cnpj_local_entrega" value="<%= objrs.Fields.Item("CNPJ_LOCAL_ENTREGA").Value%>" style="width: 170px;" maxlength="20">&nbsp;</nobr></td>  
                            <%Else%>
                            <td><nobr>Data: <%=objrs.Fields.Item("DT_SAIDA_ARM").Value%><br>Hora: <%=objrs.Fields.Item("HR_SAIDA_ARM").Value%></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("CNPJ_LOCAL_ENTREGA").Value%>&nbsp;</nobr></td>  
                            <%End If%>
                            <td><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item("NR_CNTR").Value,0)%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NM_TP_CNTR").Value%>&nbsp;</nobr></td>
                            <%If Session("cd_cargo")="055" and cd_transp_usuario = objrs.Fields.Item("CD_TRANSP_NAC").Value Then%> 
                            <td><nobr>&nbsp;<input class="editbox" type="text" name="nr_ctrc" value="<%= objrs.Fields.Item("NR_CTRC").Value%>" style="width: 110px;" maxlength="20">&nbsp;</nobr></td>                                                      
                            <td><nobr>&nbsp;<input type="checkbox" name="in_armazem_fabrica" id="in_armazem_fabrica" value="1"  style="margin-left:50px;cursor:pointer;" <%If objrs.Fields.Item("IN_ARMAZEM_FABRICA").Value = "1" Then%>checked<%End If%>>&nbsp;</nobr></td>

                            <%Else%>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NR_CTRC").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("IN_ARMAZEM_FABRICA_OBS").Value%>&nbsp;</nobr></td>                            
                            <%End If%>
                            <%If Session("cd_cargo")="055" Then%> 
                            <td align="center"><input class="editbox" type="text" id="dt_saida_k10" name="dt_saida_k10" value="<%= fnc_Mascara(objrs.Fields.Item("DT_SAIDA_K10").Value, 5)%>" style="width:70px;margin-left:30px;" maxlength="10" onBlur="fnc_ValidaData(this);" onkeypress="if (event.keyCode == 47){return false;}mascaraData(this);"></td>
                            <td align="center"><nobr>&nbsp;<input type="checkbox" name="in_reutiliza_exp" id="in_reutiliza_exp<%=cont_qtde%>" value="1" style="margin-left:70px;cursor:pointer;" <%If objrs.Fields.Item("IN_REUTILIZA_EXP").Value = "1" Then%>checked<%End If%> onclick="reutilizaExp(this.id,<%=cont_qtde%>);">&nbsp;</nobr></td>  
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NM_TRANSP_K10").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<input class="editbox" type="text" name="dt_devolucao" value="<%= objrs.Fields.Item("DT_DEVOLUCAO").Value%>" style="width:70px;margin-left:60px;" maxlength="10" onBlur="fnc_ValidaData(this);" onkeypress="if (event.keyCode == 47){return false;}mascaraData(this);">&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<input class="editbox" type="text" name="tx_local_dev_cntr" id="tx_local_dev_cntr<%=cont_qtde%>" <%If objrs.Fields.Item("IN_REUTILIZA_EXP").Value = "1" Then%>value="n/a" disabled="true"<%Else%>value="<%= objrs.Fields.Item("TX_LOCAL_DEVOLUCAO_CNTR").Value%>"<%End If%> style="width:170px;" maxlength="20">&nbsp;</nobr></td>    
                            <td><nobr>&nbsp;<input class="editbox" type="text" name="nm_motorista" value="<%= objrs.Fields.Item("NM_MOTORISTA").Value%>" style="width: 200px;" maxlength="200">&nbsp;</nobr></td>        
                            <td><nobr>&nbsp;<input class="editbox" type="text" name="nm_motorista_descida" value="<%= objrs.Fields.Item("NM_MOTORISTA_DESCIDA").Value%>" style="width: 200px;" maxlength="200">&nbsp;</nobr></td>          
                            <%Else%>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("DT_SAIDA_K10").Value%>&nbsp;</nobr></td>
                            <td align="center"><nobr>&nbsp;<%= objrs.Fields.Item("IN_REUTILIZA_EXP_OBS").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NM_TRANSP_K10").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("DT_DEVOLUCAO").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%If objrs.Fields.Item("IN_REUTILIZA_EXP").Value = "1" Then%>n/a<%Else%><%= objrs.Fields.Item("TX_LOCAL_DEVOLUCAO_CNTR").Value%><%End If%>&nbsp;</nobr></td>    
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NM_MOTORISTA").Value%>&nbsp;</nobr></td>
                            <td><nobr>&nbsp;<%= objrs.Fields.Item("NM_MOTORISTA_DESCIDA").Value%>&nbsp;</nobr></td>
                            <%End If%>       
                            <%If Session("cd_cargo")="055" Then%> 
							<td align="center">&nbsp;<input class="botao" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></td>
                            <%End If%>
						</form>
					</tr>
					<%
					cont_qtde = cont_qtde + 1
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
end if

if objrs.State = adStateOpen then objrs.Close

'verifica se existe container no processo
sql = "SELECT COUNT(*) FROM TREL_SERV_TRANSP (NOLOCK) "&_
			"WHERE CD_USUARIO = '"& Session("cd_usuario") &"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
					<tr class="gridtit" height="15">
						<td colspan="<%If Session("cd_cargo")="055" Then%> 23 <%Else%>22<%End If%>" align="left"><nobr><%= tx_lang_A00030(cd_lang) &" "& objrs.Fields.Item(0).Value &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
					</tr>
					<tr height="25">
						<td colspan="23" align="center"><%= "<i>"& tx_lang_A00002(cd_lang) &": "& tx_lang_A00026(cd_lang) &" DD/MM/AAAA.</i>"%></td>
					</tr>
				</table>
</div>
	  <!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
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
<script type="text/javascript">
if(typeof tableScroll == 'function')
{
	tableScroll('TabelaPrincipal');
}
</script> 
<!--#include virtual="/includes/inc_ends.asp"-->
