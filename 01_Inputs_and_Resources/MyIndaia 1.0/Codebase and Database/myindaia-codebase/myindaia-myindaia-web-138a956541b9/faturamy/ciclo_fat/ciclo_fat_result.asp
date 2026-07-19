
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 01/08/2006
'backup: track_result[cabecalho].asp
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim objfso 'objeto para o sistema de arquivos
Dim sql_s, sql_s_a  'monta o select da query com os campos a serem exibidos
Dim sql_f, sql_f_a  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w, sql_w_a  'monta o where da query
Dim sql_o, sql_u  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim in_proc_adm 'verifica se existe o numero do processo de administração
Dim in_proc_des 'verifica se existe o numero do processo de desembaraço
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim txTitle     'guarda titulos de celulas
dim txLinkProcesso 'link para o detalhe de processo
dim Descontos,chk_frete,chk_seguro,check_Fob,tx_dolar,tx_mle ' variáveis para checagem de calculos FOB
dim Deadline
dim dt_inicial, dt_final
Dim dados_ordem, dados_ordem_total, cont_ordem_total, tx_dados_ordem, tipo_ordem_total
Dim data_dif_inicial, data_dif_final, nr_processo_pendencia

in_comodo = "1"
in_show  = False
cd_tela  = "IMP003"
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
Session("sql_fat_ciclo_my") = Null
If Not fnc_TestaVar(Session("sql_fat_ciclo_my")) Then

sql_s = " SELECT R.* " 
sql_f = sql_f & " FROM TREL_FAT_CICLO R " 
					
'Response.Redirect("teste.asp?var1="&sql_s&sql_f&"")
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO ='"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   = "& nr_ident & sql_w&" "
	' ordenação dos registros  
	sql_o = "ORDER BY "

	

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
	sql_o = sql_o &" NOTA ASC" 
	End If

	'inicia a montagem dos campos que serão selecionados
				
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst

	
		'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

	'finaliza a construção do select do relatório e salva na Session
	Session("sql_fat_ciclo_my") = sql_s & sql_f & sql_w & sql_o
	'response.Write(Session("sql_fat_ciclo_my"))
	'response.end
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_pendencias") &"<br>"
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_fat_ciclo_my")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("vTxBusca") <> "" Then
  str = Request("vTxBusca")
  'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
		pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
	'Response.Redirect("teste.asp?var1="&Session("sql_imp_track")&"")
  objrs.AbsolutePage = CInt(pagina)
End If
'Response.Redirect("teste.asp?var1="&Session("sql_imp_track")&"")

url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url
tx_path_file  = "/faturamy/ciclo_fat/ciclo_fat_excel"
tx_path_excel = "/faturamy/ciclo_fat/ciclo_fat_excel"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then 
'Response.write sql_s & sql_f & sql_w & sql_o
'Response.end 
objrsv.MoveFirst
End if
'cria o objeto do sistema de arquivos
Set objfso = Server.CreateObject("Scripting.FileSystemObject")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
    function MM_jumpMenu(targ, selObj, restore) { //v3.0
        var target = "track_result.asp<%= url%>&p=" + selObj.options[selObj.selectedIndex].value;
        eval(targ + ".location='" + target + "'");
        if (restore) selObj.selectedIndex = 0;
    }

    function abreContainer(nr_processo) {
        features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
        window.open('/detalhe/cntr_processo.asp?nr_processo=' + nr_processo + '&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>', "win1", features);
    }

    function abreCargaSolta(nr_processo) {
        features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
        window.open('/popup/detalhe_carga_solta.asp?nr_processo=' + nr_processo + '&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>', "win2", features);
    }

    function abreDocs(nr_proc_des, nr_proc_adm, tp_relat) {
        features = "top=100,left=20,width=450,height=350,resizable=no";
        window.open('/detalhe/scan_docs_processo.asp?nr_proc_des=' + nr_proc_des + '&nr_proc_adm=' + nr_proc_adm + '&tp_relat=0&pendencias=1', "docs_processo", features);
    }

    function abreParametrizacao(nr_processo, tp_relat) {
        features = "top=100,left=20,width=500,height=350,resizable=yes";
        window.open('/detalhe/imp_parametrizacao.asp?nr_processo=' + nr_processo + '&tp_relat=' + tp_relat, "param", features);
    }

    function abreStatus(nr_processo, nr_referencia, nr_item_clnte, cd_empresa) {
        features = "top=100,left=20,width=750,height=550,resizable=yes";
        window.open('/detalhe/status_processo.asp?nr_processo=' + nr_processo + '&nr_referencia=' + nr_referencia + '&nr_item_clnte=' + nr_item_clnte + '&cd_empresa=' + cd_empresa, "status", features);
    }

    function abreHistorico(nr_processo, cd_pendencia, referencia, item_cliente, parcial, empresa) {
        features = "top=100,left=20,width=500,height=300,resizable=no,scrollbars=yes";
        window.open('/detalhe/historico_pendencia_track.asp?nr_processo=' + nr_processo + '&cd_pendencia=' + cd_pendencia + '&nr_referencia=' + referencia + '&nr_item_cliente=' + item_cliente + '&nr_parcial=' + parcial + '&cd_empresa=' + empresa, "status", features);
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

<script type="text/javascript">
    /* Flávio Henrique - Julho/2008 */
    var finalizeMe = (function () {
        var global = this, base, safe = false, svType = (global.addEventListener && 2) || (global.attachEvent && 3) || 0;
        function addFnc(next, f) { function t(ev) { if (next) next(ev); f(ev); }; t.addItem = function (d) { if (f != d.getFunc()) { if (next) { next.addItem(d); } else { next = d; } } return this; }; t.remove = function (d) { if (f == d) { f = null; return next; } else if (next) { next = next.remove(d); } return this; }; t.getFunc = function () { return f; }; t.finalize = function () { if (next) next = next.finalize(); return (f = null); }; return t; };
        function addFunction(f) { if (base) { base = base.addItem(addFnc(null, f)); } else { base = addFnc(null, f); } };
        function ulQue(f) { addFunction(f); if (!safe) { switch (svType) { case 2: global.addEventListener("unload", base, false); safe = true; break; case 3: global.attachEvent("onunload", base); safe = true; break; default: if (global.onunload != base) { if (global.onunload) addFunction(global.onunload); global.onunload = base; } break; } } };
        ulQue.remove = function (f) { if (base) base.remove(f); };
        function finalize() { if (base) { base.finalize(); switch (svType) { case 3: global.detachEvent("onunload", base); break; case 2: global.removeEventListener("unload", base, false); break; default: global.onunload = null; break; } base = null; } safe = false; };
        ulQue(finalize); return ulQue;
    })();


    var InitializeMe = (function () {
        var global = this, base = null, safe = false;
        var listenerType = (global.addEventListener && 2) || (global.attachEvent && 3) || 0;
        function getStackFunc(next, funcRef, arg1, arg2, arg3, arg4) { function l(ev) { funcRef((ev ? ev : global.event), arg1, arg2, arg3, arg4); if (next) next = next(ev); return (funcRef = null); }; l.addItem = function (d) { if (next) { next.addItem(d); } else { next = d; } }; return l; };
        return (function (funcRef, arg1, arg2, arg3, arg4) { if (base) { base.addItem(getStackFunc(null, funcRef, arg1, arg2, arg3, arg4)); } else { base = getStackFunc(null, funcRef, arg1, arg2, arg3, arg4); } if (!safe) { switch (listenerType) { case 2: global.addEventListener("load", base, false); safe = true; break; case 3: global.attachEvent("onload", base); safe = true; break; default: if (global.onload != base) { if (global.onload) { base.addItem(getStackFunc(null, global.onload)); } global.onload = base; } break; } } });
    })();
    var queryStrings = (function (out) {
        if (typeof location != 'undefined') {
            var temp = location.search || location.href || '';
            var nvp, ofSet;
            if ((ofSet = temp.indexOf('?')) > -1) {
                temp = temp.split("#")[0];
                temp = temp.substring((ofSet + 1), temp.length);
                var workAr = temp.split('&');
                for (var c = workAr.length; c--; ) {
                    nvp = workAr[c].split('=');
                    if (nvp.length > 1) { out[nvp[0]] = nvp[1]; }
                }
            }
        }
        return out;
    })({});

    var TimedQue = (function () {
        var base, timer;
        var interval = 60;
        var newFncs = null;
        function addFnc(next, f) { function t() { next = next && next(); if (f()) { return t; } else { f = null; return next; } } t.addItem = function (d) { if (next) { next.addItem(d); } else { next = d; } return this; }; t.finalize = function () { return ((next) && (next = next.finalize()) || (f = null)); }; return t; }
        function tmQue(fc) { if (newFncs) { newFncs = newFncs.addItem(addFnc(null, fc)); } else { newFncs = addFnc(null, fc); } if (!timer) { timer = setTimeout(tmQue.act, interval); } }
        tmQue.act = function () { var fn = newFncs, strt = new Date().getTime(); if (fn) { newFncs = null; if (base) { base.addItem(fn); } else { base = fn; } } base = base && base(); if (base || newFncs) { var t = interval - (new Date().getTime() - strt); timer = setTimeout(tmQue.act, ((t > 0) ? t : 1)); } else { timer = null; } };
        tmQue.act.toString = function () { return 'TimedQue.act()'; };
        tmQue.finalize = function () { timer = timer && clearTimeout(timer); base = base && base.finalize(); newFncs = null; };
        return tmQue;
    })();

    var getElementWithId = (function () { if (document.getElementById) { return (function (id) { return document.getElementById(id); }); } else if (document.all) { return (function (id) { return document.all[id]; }); } return (function (id) { return null; }); })();

    function getSimpleExtPxIn(el) {
        var temp, temp2, tick = 0, getBorders = retFalse, doCompStyle = retFalse, defaultView, objList = [];
        function retFalse() { return false; }
        retFalse.elTest = retFalse;
        retFalse.iY = retFalse.iX = retFalse.y = retFalse.x = retFalse.w = retFalse.h = retFalse.bb = retFalse.bt = retFalse.bl = retFalse.br = 0;
        function retThis() { return retThis; }
        function gCompStyleBorders(p, el) { doCompStyle(p, defaultView.getComputedStyle(el, '')); }
        function doComputedStyleFloat(p, cs) { p.bt = (cs.getPropertyCSSValue('border-top-width').getFloatValue(5)); p.bl = (cs.getPropertyCSSValue('border-left-width').getFloatValue(5)); p.br = (cs.getPropertyCSSValue('border-right-width').getFloatValue(5)); p.bb = (cs.getPropertyCSSValue('border-bottom-width').getFloatValue(5)); }
        function doComputedStyleValue(p, cs) { p.bt = Math.ceil(parseFloat(s.getPropertyValue('border-top-width'))) | 0; p.bl = Math.ceil(parseFloat(s.getPropertyValue('border-left-width'))) | 0; p.br = Math.ceil(parseFloat(s.getPropertyValue('border-right-width'))) | 0; p.bb = Math.ceil(parseFloat(s.getPropertyValue('border-bottom-width'))) | 0; }
        function gClientBorders(p, el) { if (el.clientWidth || el.clientHeight) { p.bb = (el.offsetHeight - (el.clientHeight + (p.bt = el.clientTop | 0))) | 0; p.br = (el.offsetWidth - (el.clientWidth + (p.bl = el.clientLeft | 0))) | 0; } }
        function getInterfaceObj(el) { var lastTick = NaN; var offsetParent = getSimpleExtPxInFn(el.offsetParent) || retFalse; function p(doTick) { if (doTick) { tick = (1 + tick) % 0xEFFFFFFF; } if (tick != lastTick) { lastTick = tick; offsetParent(); getBorders(p, el); p.iY = (p.y = (offsetParent.iY + (el.offsetTop | 0))) + p.bt; p.iX = (p.x = (offsetParent.iX + (el.offsetLeft | 0))) + p.bl; p.w = el.offsetWidth | 0; p.h = el.offsetHeight | 0; } return p; } p.elTest = function (elmnt) { return (elmnt == el); }; p.iY = p.iX = p.w = p.h = p.y = p.x = p.bb = p.bt = p.bl = p.br = 0; return (objList[objList.length] = p); }
        function getSimpleExtPxInFn(el) { if ((!el) || (el == document)) { return retFalse; } for (var c = objList.length; c--; ) { if (objList[c].elTest(el)) { return objList[c]; } } return getInterfaceObj(el); }
        function setSpecialObj(el) { var lastTick = NaN; function p(doTick) { if (doTick) { tick = (1 + tick) % 0xEFFFFFFF; } return p; } p.elTest = function (elmnt) { return (elmnt == el); }; p.iY = p.iX = p.w = p.h = p.y = p.x = p.bb = p.bt = p.bl = p.br = 0; objList[objList.length] = p; }
        if ((typeof el.offsetParent != 'undefined') && (typeof el.offsetTop == 'number') && (typeof el.offsetWidth == 'number')) { if ((typeof el.clientTop == 'number') && (typeof el.clientWidth == 'number')) { getBorders = gClientBorders; } else if ((defaultView = document.defaultView) && defaultView.getComputedStyle && (temp = defaultView.getComputedStyle(el, '')) && (((temp.getPropertyCSSValue) && (temp2 = temp.getPropertyCSSValue('border-top-width')) && (temp2.getFloatValue) && (doCompStyle = doComputedStyleFloat)) || ((temp.getPropertyValue) && (doCompStyle = doComputedStyleValue)))) { getBorders = gCompStyleBorders; temp2 = temp = null; } if (document.documentElement) { setSpecialObj(document.documentElement); } if (document.body) { setSpecialObj(document.body); } return (getSimpleExtPxIn = getSimpleExtPxInFn)(el); } else { retThis.elTest = retFalse; retThis.iY = retThis.iX = retThis.y = retThis.x = retThis.w = retThis.h = retThis.bb = retThis.bt = retThis.bl = retThis.br = NaN; return (getSimpleExtPxIn = retThis); }
    }

    function getNewFILCFncStac(fnc) { function getNewFnc(f) { var next = null; function t(a) { next = next && next(a); return (f(a)) ? t : next; } t.finalize = function () { next = next && next.finalize(); return (f = null); }; t.addItem = function (d) { if (f != d) { if (next) { next.addItem(d); } else { next = getNewFnc(d); } } return this; }; return t; } var base = getNewFnc(fnc); fnc = function (a) { base = base && base(a); }; fnc.addItem = function (d) { if (base) { base.addItem(d) } else { base = getNewFnc(d); } }; fnc.finalize = function () { return (base = base && base.finalize()); }; return fnc; }

    function GlobalEventMonitor(eventName, functinRef) {//alert("aqui")
        var finalize, global = this;
        var monitors = {};
        var onName = ['on', ''];
        function mainMonitor(eventName, functinRef) {
            var monitor = monitors[eventName];
            if (monitor) {
                monitor(functinRef);
            } else {
                setEventMonitor(eventName, functinRef);
            }
        }
        function setListener(eventName, longName, fncStack) {
            global.addEventListener(eventName, fncStack, false);
            return true;
        }
        function setListener_aE(eventName, longName, fncStack) {
            global.attachEvent(longName, fncStack);
            return true;
        }
        function oldHandler(f) { return (function (e) { f(e); return true; }); }
        function retFalse() { return false; }
        function setEventMonitor(eventName, functinRef) {
            var fncStack, longName;
            onName[1] = eventName;
            longName = onName.join('');
            function main(funcRef) {
                if (funcRef) {
                    fncStack.addItem(funcRef);
                    globalCheck();
                }
            }
            function globalCheck() {
                if (global[longName] != fncStack) {
                    if (global[longName]) {
                        fncStack.addItem(oldHandler(global[longName]));
                    }
                    global[longName] = fncStack;
                }
            }
            fncStack = getNewFILCFncStac(functinRef);
            if (setListener(eventName, longName, fncStack)) {
                globalCheck = retFalse;
            } else {
                globalCheck();
            }
            finalize.addItem(fncStack.finalize);
            monitors[eventName] = main;
            functinRef = null;
        }
        if (!global.addEventListener) {
            if (global.attachEvent) {
                setListener = setListener_aE;
            } else {
                setListener = retFalse;
            }
        }
        finalizeMe((finalize = getNewFILCFncStac(
		function () {
		    finalize = monitors = null;
		})
	));
        (GlobalEventMonitor = mainMonitor)(eventName, functinRef);
        functinRef = null;
    }

    var tableScroll = (function () {//alert("aqui")
        var global = this, finalise, tableList = {};
        var notOnScroll = true, notAbort = true;
        var overrideStyles = {
            margin: [{ keys: ['margin', 'marginBottom', 'marginLeft', 'marginRight', 'marginTop'], value: '0px'}],
            padding: [{ keys: ['padding', 'paddingBottom', 'paddingLeft', 'paddingRight', 'paddingTop'], value: '0px'}],
            border: [
			{ keys: ['border', 'borderBottom', 'borderLeft', 'borderRight', 'borderTop'], value: '0px none #FFFFFF' },
			{ keys: ['borderWidth', 'borderLeftWidth', 'borderRightWidth', 'borderBottomWidth', 'borderTopWidth'], value: '0px' },
			{ keys: ['borderStyle', 'borderRightStyle', 'borderLeftStyle', 'borderBottomStyle', 'borderTopStyle'], value: 'none' }
		],
            overflow: [{ keys: ['overflow'], value: 'hidden'}],
            positionRel: [{ keys: ['position'], value: 'relative'}],
            positionAbs: [{ keys: ['position'], value: 'absolute'}],
            top: [{ keys: ['top'], value: '0px'}],
            left: [{ keys: ['left'], value: '0px'}],
            zIndex: [{ keys: ['zIndex'], value: 2}]
        };
        function setStyleProps(styleObj) {
            var data, dArray;
            for (var c = 1; c < arguments.length; c++) {
                if ((data = overrideStyles[arguments[c]])) {
                    for (var d = data.length; d--; ) {
                        dArray = data[d].keys;
                        for (var e = dArray.length; e--; ) {
                            styleObj[dArray[e]] = data[d].value;
                        }
                    }
                }
            }
            return true;
        }
        function setClass(el, val) {
            if (el.setAttribute) { el.setAttribute('class', val); }
            return (el.className = val);
        }
        function retFalse() { return false; }
        function TableScroll(id) {
            var midAbsDiv, parent, vHeaderAbsStyle, vHeaderRelStyle, hHeaderAbsStyle, hHeaderRelStyle;
            var midAbsDivStyle, midAbsinerDivStyle, inRelDivStyle, outRelDivDim;
            var lastScrollTop = NaN, lastScrollLeft = NaN, lastWidth = NaN, lastHeight = NaN, tableDim, table = getElementWithId(id);
            var midRelinerDivStyle, midRelinerDiv, testCellDim;
            function position() {//alert("aqui")
                var nh, nw, size, th, tw, cellWidth, celHeight, st = midAbsDiv.scrollTop, sl = midAbsDiv.scrollLeft, h = outRelDivDim(true).h, w = outRelDivDim.w;
                if ((size = ((w != lastWidth) || (h != lastHeight))) || (st != lastScrollTop) || (sl != lastScrollLeft)) {
                    hHeaderRelStyle.left = (((cellWidth = (testCellDim().x - tableDim().iX)) + (lastScrollLeft = sl)) * -1) + 'px'; //position
                    vHeaderRelStyle.top = (((celHeight = (testCellDim.y - tableDim.iY)) + (lastScrollTop = st)) * -1) + 'px';
                    if (size) {
                        vHeaderRelStyle.width = vHeaderAbsStyle.width = midAbsDivStyle.left = hHeaderAbsStyle.left = (cellWidth + 'px');
                        hHeaderRelStyle.height = hHeaderAbsStyle.height = midAbsDivStyle.top = vHeaderAbsStyle.top = (celHeight + 'px');
                        inRelDivStyle.left = (cellWidth * -1) + 'px';
                        inRelDivStyle.top = (celHeight * -1) + 'px';
                        midRelinerDivStyle.width = midAbsinerDivStyle.width = ((tw = tableDim.w) - cellWidth) + 'px';
                        midRelinerDivStyle.height = midAbsinerDivStyle.height = ((th = tableDim.h) - celHeight) + 'px';
                        midAbsDivStyle.height = vHeaderAbsStyle.height = (((nh = ((lastHeight = h) - celHeight)) > celHeight) ? nh : celHeight) + 'px';
                        midAbsDivStyle.width = hHeaderAbsStyle.width = (((nw = ((lastWidth = w) - cellWidth)) > cellWidth) ? nw : cellWidth) + 'px';
                        hHeaderRelStyle.width = inRelDivStyle.width = tw + 'px';
                        vHeaderRelStyle.height = inRelDivStyle.height = th + 'px';
                    }
                }
                return notOnScroll;
            }
            function onScroll() {
                notOnScroll = false;
                position();
            }
            function onSize() {
                position();
                return true;
            }
            finalise.addItem(function () {
                testCellDim = midRelinerDivStyle = midRelinerDiv =
			midAbsinerDivStyle = tableDim = vHeaderAbsStyle = vHeaderRelStyle = hHeaderAbsStyle = hHeaderRelStyle = inRelDivStyle = outRelDivDim = midAbsDiv = parent = table = null;
            })
            if (
			table &&
			(typeof table.scrollTop == 'number') &&
			(typeof table.offsetHeight == 'number') &&
			table.tagName &&
			table.appendChild &&
			table.cloneNode &&
			table.getAttribute &&
			table.getElementsByTagName &&
			(parent = table.parentNode) &&
			parent.insertBefore

		   ) {//alert("aqui")
                InitializeMe(function () {
                    var newTable, testCell;
                    var vHeaderAbs, vHeaderRel, hHeaderAbs, hHeaderRel, outRelDiv, midAbsinerDiv, inRelDiv;
                    if (
					(notAbort) &&
					(testCell = table.getElementsByTagName('td')[0]) &&
					(newTable = table.cloneNode(true)) &&
					(outRelDiv = document.createElement('DIV')) &&
					(setClass(outRelDiv, 'tableBoxOuter')) &&
					(midAbsDiv = document.createElement('DIV')) &&
					(midRelinerDiv = document.createElement('DIV')) &&
					(midAbsinerDiv = document.createElement('DIV')) &&
					(inRelDiv = document.createElement('DIV')) &&
					(vHeaderAbs = document.createElement('DIV')) &&
					(vHeaderRel = document.createElement('DIV')) &&
					(hHeaderAbs = document.createElement('DIV')) &&
					(hHeaderRel = document.createElement('DIV')) &&
					(setStyleProps(outRelDiv.style, 'positionRel', 'padding')) &&
					(midAbsDivStyle = midAbsDiv.style) &&
					(setStyleProps(midAbsDivStyle, 'positionAbs', 'padding', 'margin', 'border', 'zIndex')) &&
					(midRelinerDivStyle = midRelinerDiv.style) &&
					(setStyleProps(midRelinerDivStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left')) &&
					(midAbsinerDivStyle = midAbsinerDiv.style) &&
					(setStyleProps(midAbsinerDivStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left')) &&
					(inRelDivStyle = inRelDiv.style) &&
					(setStyleProps(inRelDivStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left')) &&
					(vHeaderAbsStyle = vHeaderAbs.style) &&
					(setStyleProps(vHeaderAbsStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left', 'zIndex')) &&
					(vHeaderRelStyle = vHeaderRel.style) &&
					(setStyleProps(vHeaderRelStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left')) &&
					(hHeaderAbsStyle = hHeaderAbs.style) &&
					(setStyleProps(hHeaderAbsStyle, 'positionAbs', 'overflow', 'padding', 'margin', 'border', 'top', 'left', 'zIndex')) &&
					(hHeaderRelStyle = hHeaderRel.style) &&
					(setStyleProps(hHeaderRelStyle, 'positionRel', 'padding', 'margin', 'border', 'top', 'left')) &&
					(setStyleProps(table.style, 'margin')) &&
					(midAbsDiv.appendChild(midRelinerDiv)) &&
					(midRelinerDiv.appendChild(midAbsinerDiv)) &&
					(midAbsinerDiv.appendChild(inRelDiv)) &&
					(outRelDiv.appendChild(midAbsDiv)) &&
					(vHeaderAbs.appendChild(vHeaderRel)) &&
					(hHeaderAbs.appendChild(hHeaderRel)) &&
					(outRelDiv.appendChild(vHeaderAbs)) &&
					(outRelDiv.appendChild(hHeaderAbs)) &&
					(parent.insertBefore(outRelDiv, table)) &&
					(!isNaN((outRelDivDim = getSimpleExtPxIn(outRelDiv)).w)) &&
					(inRelDiv.appendChild(table)) &&
					(!isNaN((testCellDim = getSimpleExtPxIn(testCell)).w)) &&
					(!isNaN((tableDim = getSimpleExtPxIn(table)).w)) &&
					(hHeaderRel.appendChild(newTable)) &&
					(newTable = table.cloneNode(true)) &&
					(vHeaderRel.appendChild(newTable))
				   ) {
                        midAbsDivStyle.overflow = 'scroll';
                        if (midAbsDiv.addEventListener) {
                            midAbsDiv.addEventListener('scroll', onScroll, false);
                        } else if (midAbsDiv.attachEvent) {
                            midAbsDiv.attachEvent('onscroll', onScroll);
                        } else {
                            midAbsDiv.onscroll = onScroll;
                        }
                        GlobalEventMonitor('resize', onSize);
                        position();
                        TimedQue(position);
                    } else {
                        notAbort = false;
                    }
                });
            } else {
                notAbort = false;
            }
            return true;
        }
        function main() {
            var id;
            for (var c = 0; c < arguments.length; c++) {
                id = arguments[c];
                if (notAbort && !tableList[id]) {
                    tableList[id] = TableScroll(id);
                }
            }
        }
        if (
		(!global.queryStrings || !queryStrings['noTableScroll']) &&
		global.setTimeout &&
		global.document &&
		document.createElement
	) {
            finalizeMe((finalise = getNewFILCFncStac(function () {
                finalise = tableList = null;
            })));
            return main;
        } else {
            return retFalse;
        }
    })();
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

      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="49" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
<div id="dv_corpo" class="divMainMid">
<table id="TabelaPrincipal" width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
<%
dim vTxLinha(1), vInRowspan
vTxLinha(0) = ""
vTxLinha(1) = ""
vInRowspan = false
nr_cols = 0
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	select case objrsv.Fields.Item("M10_CD_DADO").Value
		case "0118"
			vTxLinha(0) = vTxLinha(0) &"<th colspan='3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<th>"&tx_lang_A00095(cd_lang)&"</td><th>"&tx_lang_A00096(cd_lang)&"</td><th>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
				          'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_CD_BROKER").Value&"")
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<th colspan='3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						vTxLinha(1) = vTxLinha(1) &"<th style='background-color:" & cabec_result & ";'>"&tx_lang_A00033(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00034(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00035(cd_lang)&"</th>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else	
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						nr_cols = nr_cols + 1
					end if
				case else
					If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&kpi_cabec&"</th>"
					Else
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>&nbsp;"&objrsv.Fields.Item("M10_NM_DADO").Value&"&nbsp;</th>"
					End If
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'exibe a linha com os cabeçalhos
if Len(vTxLinha(0)) > 0 then
  	nr_cols = nr_cols + 1
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=20 class='gridtit' style='background-color:" & cabec_result & ";'>"&vTxLinha(0)&"</tr>")
end if
'exibe a linha com os sub-cabeçalhos
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub'>"&vTxLinha(1)&"</tr>")
end if

nrec = 0
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	nr_processo = ""'Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
	'nr_proc_adm = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
	'link para o detalhe do processo
		
	'alterna a cor das linhas
	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
    
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade	
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
                    <%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização nos registros do relatório
	Do While Not objrsv.Eof
		'Response.Redirect("../import/teste.asp?var1="&SQL&"")

		nm_campo_rel = Trim(objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
                        
						'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_AP_CAMPO").Value&"")
						Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
					Case "1" 'exibe os campos de datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
							Response.Write(fncExibeDataEventoFup(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						'Response.Redirect("teste.asp?var1="&objrs.Fields.Item("PVT_"& nm_campo_rel).Value&"")
						else
							Response.Write(fncExibeDataPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
						end if	
					Case "2" 'exibe os campos com valor decimal
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 2))
					Case "3" 'exibe os campos com valor monetário
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 4))
					Case "4" 'exibe os campos com valor inteiro
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 0))
					Case "5" 'exibe os campos do tipo memo
						Response.Write(fncExibeMemoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
					Case "6"
						Response.Write("<td><nobr>" & TempoDecorridoExtenso(objrs.Fields.Item(nm_campo_rel).Value) & "</nobr></td>")	
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
						<td height="15" colspan="<%= nr_cols%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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
    if (typeof tableScroll == 'function') {
        tableScroll('TabelaPrincipal');
    }
</script> 

<!--#include virtual="/includes/inc_ends.asp"-->