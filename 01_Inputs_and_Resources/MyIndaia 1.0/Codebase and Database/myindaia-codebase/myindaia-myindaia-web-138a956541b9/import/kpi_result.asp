<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação / Metrics por Embarque
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 05/01/2006
'
'Manutenção: 01/05/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s	'monta o select da query com os campos a serem exibidos
Dim sql_f	'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w	'monta o where da query
Dim sql_o	'monta a ordenação da query
Dim pagina'pagina inicial da ordenação
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados

in_comodo = "1"
in_show  = False
cd_tela  = "IMP022"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
'Session("sql_imp_kpi") = Null
If Not fnc_TestaVar(Session("sql_imp_kpi")) Then
	'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "&_
					"  PR.TP_FRETE, DI.TX_MLE, DI.TX_FRETE, DI.VL_TOTAL_FRETE_MNEG, "
  
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s&" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","11","21","31","41"'String - Lookup
					sql_s = sql_s&_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "10"'Data
					If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
						'datas de follow-up de desembaraço
						nr_data = nr_data + 1
						sql_s = sql_s&" R.DT_EV"& Trim(objrsv.Fields.Item("M10_CD_BROKER").Value) &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Else
						'Outras datas vindas de outras tabelas
						sql_s = sql_s&" "&objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End If
				Case "20","30","40","43"'Decimal, Moeda,Inteiro
					sql_s = sql_s&" "&objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
  Loop
	'tabelas da busca
	sql_f = "FROM TREL_IMP_KPI R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO   PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) "&_
					"  LEFT JOIN TSERVICO    SV ( NOLOCK ) ON ( SV.CD_SERVICO  = PR.CD_SERVICO ) "&_
                    "  LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO) "&_
					"  INNER JOIN TDECLARACAO_IMPORTACAO DI ( NOLOCK ) ON ( DI.NR_PROCESSO = R.NR_PROCESSO ) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' " &_
					"  AND R.NR_IDENT   =  "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then
		sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
	End If

    If fnc_TestaVar(cd_ordem) and InStr(cd_ordem, "X") = 0 Then
		cd_ordem  = Left(cd_ordem, Len(cd_ordem)-1)
		tp_ordem  = Left(tp_ordem, Len(tp_ordem)-1)
		dados_ordem_total = Split(cd_ordem, "*", -1)
		tipo_ordem_total  = Split(tp_ordem, "*", -1)

		For cont_ordem_total = 0 to UBound(dados_ordem_total)
			dados_ordem = Split(dados_ordem_total(cont_ordem_total), "%", -1)
			If tipo_ordem_total(cont_ordem_total) = 0 Then
				tipo_ordem_total(cont_ordem_total) = " ASC"
			Else
				tipo_ordem_total(cont_ordem_total) = " DESC"
			End if
			tx_dados_ordem = tx_dados_ordem & dados_ordem(1) & tipo_ordem_total(cont_ordem_total) & ", "
		Next
		tx_dados_ordem = Left(tx_dados_ordem, Len(tx_dados_ordem)-2) 
		sql_o = sql_o &	tx_dados_ordem
	Else
	    If in_embarque Then
		    sql_o = sql_o &" R.NR_PROCESSO ASC"
	    Else
		    sql_o = sql_o &" R.NR_REFERENCIA ASC"
	    End If
	End If

	'finaliza a construção do select do relatório e salva na Session
	Session("sql_imp_kpi") = sql_s & sql_f & sql_w & sql_o
Else
	If not fnc_TestaVar(nr_data) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
					"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
					"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
					"WHERE M14_CD_VIEW     = "& fnc_QuotedSQL(cd_view) &_
					"  AND M12_TP_EXIBIR  >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
					"  AND M12_IN_ATIVO    = 1 " &_
					"  AND M10_IN_ATIVO    = 1 " &_
					"  AND M10_TP_DADO     = '1' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_data = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_kpi") &"<br>"

With objcmd
	.CommandTimeOut = 9999
	.CommandText    = Session("sql_imp_kpi")
	.CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("referencia") <> "" Then
  'escolhe o tipo da referencia
'  If Request("tipo_referencia") = "01" Then
  str = "NR_REFERENCIA = '"& Request("referencia") &"'"
  'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
	pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
	tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
  nr_referencia = ""
  objrs.AbsolutePage = CInt(pagina)
End If

col = objrsv.RecordCount
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/import/kpi_print"
tx_path_excel = "/excel/imp_kpi"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "kpi_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}
function abreParametrizacao(nr_processo, tp_relat) {
	features = "top=100,left=20,width=500,height=350,resizable=yes";
  window.open('/detalhe/imp_parametrizacao.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}
function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
}
function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

//-->
</script>
<style type="text/css" media="print">
.TabelaPrincipal {overflow: visible;	}
table>tbody		 {overflow: visible; text-align: center;}
td				 {height: 14pt;} 
thead td		 {font-size: 11pt;	text-align: left;}
tfoot td	
{
	text-align: center;
	font-size: 9pt;
	border-bottom: solid 1px slategray;
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
	margin: 0 auto;
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
	border-width: 1px;
	white-space:nowrap;
	vertical-align:middle;
	padding:5px;
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
	width:108em;
	height:100%; /*Determina o tamanho da planilha*/
}
</style>

<script type="text/javascript">
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

function GlobalEventMonitor(eventName, functinRef){
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

var tableScroll = (function(){
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
		function position(){
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
		   ){
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
</script>
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
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
		<td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
<Table id="TabelaPrincipal" border="0" cellspacing="0" cellpadding="0" valign="middle" style="padding: 0px 1px 0px 1px;" bordercolor="#FFFFFF"  bgcolor="#336699">
					<tr class="gridtit">
						<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
%>
						<th><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<%
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<%
cd_campo_quebra = ""
nrec = 0
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar( tp_quebra ) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
	If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
					<tr>
						<td height="20" colspan="<%= col%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do prcesso
	nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'aplica personalização
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="center"><a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= Mid( nr_processo, 5, Len(nr_processo) )%></nobr></a></td>
						<%
			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%
			Case "0017" 'canal de liberação
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
						<td align="center"><img src="/imagens/30/tp_canal_<%= Trim(x)%>.gif" width="17" height="16"></td>
						<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","0374" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = objrs.Fields.Item(nm_campo_rel).Value
					nr_item_clnte = ""
					str = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_ITEM_PO "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = "& fnc_QuotedSQL(objrs.Fields.Item("NR_PROCESSO").Value) &_
								"  AND TP_REFERENCIA = "& fnc_QuotedSQL(objrsv.Fields.Item("M10_CD_BROKER").Value) &_
								"ORDER BY CD_REFERENCIA, NR_ITEM_PO"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = "referências"& vbcrlf
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						nr_item_clnte = Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value ) &"/"& Trim( objrsx.Fields.Item("NR_ITEM_PO").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					Else
						nr_referencia = Null
						str = Null
					End If
				End If
				nr_processo = Trim( objrs.Fields.Item("NR_PROCESSO").Value )
%>
            <td align="left" title="<%= str%>"><a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= nr_referencia%></nobr></a></td>
            <%
				If objrsx.State = adStateOpen Then objrsx.Close()
			Case "0062" 'Fornecedor
				If objrsx.State = 1 Then objrsx.Close()
				'seleciona o fornecedor da referencia exibida. Tem de verificar se o fornecedor é o exportador.
				sql = "SELECT DISTINCT NR_PROC_PO, NR_ITEM_PO, CD_EXPORTADOR, "&_
							" ( SELECT NM_EMPRESA FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = DM.CD_EXPORTADOR ) AS NM_FORNECEDOR "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ) "&_
							"WHERE DM.NR_PROCESSO = '"& Trim( objrs.Fields.Item("NR_PROCESSO").Value ) &"' "&_
							"ORDER BY NR_PROC_PO, NR_ITEM_PO"
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				Do While Not objrsx.Eof
					str = str & Trim( objrsx.Fields.Item(nm_campo_rel).Value )
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str = str &"; "& vbcrlf
				Loop
				objrsx.MoveFirst
%>
						<td align="left" title="<%= str%>"><nobr><%= objrsx.Fields.Item(nm_campo_rel).Value%></nobr></a></td>
						<%
				objrsx.Close()
			Case "0064","0067" 'Valor FOB(Na Moeda/R$)
				'verifica se o frete é prepaid, se for subtrai o valor do frete do FOB
				If objrs.Fields.Item("TP_FRETE").Value = "1" Then
					'frete prepaid
					x = objrs.Fields.Item(nm_campo_rel).Value
					y = objrs.Fields.Item("VL_TOTAL_FRETE_MNEG").Value
					'converte para moeda nacional
					y = y * objrs.Fields.Item("TX_FRETE").Value
					'verifica qual campo será exibido e retorna o valor do frete
					If objrsv.Fields.Item("M10_CD_DADO").Value = "0067" Then
						'subtrai o frete e mantém o valor na moeda nacional
						z = (x - y)
					Else
						'converte para moeda nacional o mle
						x = x * objrs.Fields.Item("TX_MLE").Value
						'subtrai o frete e convete para a moeda negociada
						If objrs.Fields.Item("TX_MLE").Value > 0 Then
							z = (x - y) / objrs.Fields.Item("TX_MLE").Value
						Else
							z = y
						End If
					End If
				Else
					'frete collect
					z = objrs.Fields.Item(nm_campo_rel).Value
				End If
				
				If fnc_TestaVar(z) Then z = FormatNumber( z, 2 )
%>
						<td align="right"><nobr><%= z%></nobr></td>
						<%
			Case "0066" 'Tipo de Frete ( Collect/Prepaid )
				x = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(x) Then x = tipo_frete(x) Else x = "Não especificado"
%>
						<td align="center"><nobr><%= x%></nobr></td>
						<%
			Case "0283","0480","0481" 'DI, DTA, DA
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = fnc_Mascara(Trim(str), 1) Else str = ""
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0283" Then 
					str = "<a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat &"');"">"& str &"</a>"
				End If
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%	
			Case "0170" 'qtde e tipo de Container
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
							"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
							"  AND TP_CNTR <> '01' "&_
							"GROUP BY TP_CNTR"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				matriz = Split(nm_campo_rel, ";", -1)
				
				If objrsx.RecordCount > 0 Then
					str = ""
					Do While Not objrsx.Eof
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='0' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreContainer('"& nr_processo &"');"">"&_
								"<img src='/imagens/30/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
					str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
						<%
				objrsx.Close()
			Case "0350" 'Carga Solta / LCL
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
							"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
							"GROUP BY NM_ESPECIE"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				matriz = Split(nm_campo_rel, ";", -1)
				
				If objrsx.RecordCount > 0 Then
					str = ""
					Do While Not objrsx.Eof
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='0' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreCargaSolta('"& nr_processo &"');"">"&_
								"<img src='/imagens/30/pallet.gif' width=22 height=15 border=0 alt='"& tx_lang_A00043(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
						<%
				objrsx.Close()						
			Case "0555" 'país de origem caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
					      " WHERE CODIGO = (SELECT TOP 1 (CASE ISNULL(CD_PAIS_ORIG_MERC, '') "&_
                "                                 WHEN '' THEN CD_PAIS_AQUIS_MERC "&_
                "                                 ELSE CD_PAIS_ORIG_MERC "&_
                "                               END) "&_ 
 	 						  "                    FROM TADICAO_DE_IMPORTACAO ( NOLOCK ) "&_
 							  "                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
  				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
  					str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
				  Else
	  			  str = "&nbsp;"
					End If
					objrsx.Close()
				End If
%>
         <td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%						
															
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
						<td align="left"><nobr><%= str%></nobr></td>
						<%
					Case "1" 'exibe os campos de datas
%>
						<td align="center"><nobr><%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 5)%></nobr></td>
						<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr><%= x%></nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr><%= x%></nobr></td>
						<%
					Case "4" 'exibe os campos com valor inteiro
						z = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(z) Then z = "" 
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(z) < 10
							z = "#"& z
						Loop
						z = Replace(z, "#", "&nbsp;")
%>
						<td align="right"><nobr><%= z%>&nbsp;</nobr></td>
						<%
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
					</tr>
					<%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit">
						<td height="15" colspan="<%= nr_cols%>" align="left" style="background-color:<%=cabec_result%>;"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
					<%
objrsv.Close
objrs.Close
%>
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
