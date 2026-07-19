<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 24/01/2008 - Analisado e comentado por FLAVIO Henrique
'Filtro Célula em 16/01/2008, Filtro CódMercadoria em 24/01/2008
' 19/05/2008 Sistema Exportação
' LINK PAREA TESTES: Response.Redirect("../IMPORT/teste.asp?var1="&str&"")

'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999
Dim filtro,filtro1,TpEstufagem
Dim  'monta o select da query com os campos a serem exibidos
Dim sql_f 'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w 'monta o where da query
Dim sql_o 'monta a ordenação da query
Dim pagina'pagina inicial da ordenação
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados
Dim codigo
Dim ChkExibir,tpCourrier, tpProduto

in_comodo = "1"
in_show  = False
cd_tela  = "EXP003"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
ChkExibir=mid(Session("sql_pagina"),14,3)
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'Response.Redirect("../IMPORT/teste.asp?var1="&Request("cd_idioma")&"")

'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
'============================================================================================
'AÇÃO 1
'============================================================================================
'Response.Redirect("../IMPORT/teste.asp?var1="&Request.QueryString("cd_idioma")&"")

Session("sql_exp_track_itens") = Null
If Not fnc_TestaVar(Session("sql_exp_track_itens")) Then
  'dados básicos do relatório
    
  sql_s =  "SELECT DISTINCT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE,PR.CD_IMPORTADOR, "&_
           "                ISNULL(PR.IN_COURRIER,0) AS IN_COURRIER, ISNULL(PR.IN_PRODUTO_IMPORTADO,0) AS IN_PRODUTO_IMPORTADO, "'&_
'           "                M.AP_MERCADORIA, A.NR_RE, P.QT_MERCADORIA, P.CD_NCM, P.VL_MLE, P.VL_MCV, P.VL_TOT_PESO_LIQ, "&_
'           "                CONVERT(VARCHAR, C.DT_DATA, 103) AS DT_RE, D.NR_ATO_CONCESSORIO AS ATO,"
  
  If tp_relat=1 then '1=Pedido 0-embarque
    sql_s=sql_s & " PEI.NR_PROC_PE, PEI.NR_ITEM, "
  End If

  If tp_relat=3 then '1=Pedido 0-embarque
    sql_s=sql_s & " NR_PEDIDO AS NR_PEDIDO_EXP,  "
  end if
  
	
  'tabelas da busca
  sql_f = " FROM TREL_EXP_TRACK R (NOLOCK) "&_
					"  INNER JOIN TPROCESSO           PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TFLP_EXPORT1        FE (NOLOCK) ON (FE.NR_PROCESSO = R.NR_PROCESSO) "&_
                    "  LEFT  JOIN TFLP_EXPORT2        FE2 (NOLOCK) ON (FE2.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TPROCESSO_EXP       PE (NOLOCK) ON (PE.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TPROCESSO_EXP_SAQUE SQ (NOLOCK) ON (SQ.NR_PROCESSO = R.NR_PROCESSO) "
					
If tp_relat= 1 or tp_relat = 3  then ' 1=Pedido 0-embarque
    sql_f = sql_f & "  LEFT JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON (PEI.NR_PROCESSO = R.NR_PROCESSO) " 
End if 

'    sql_f = sql_f & "  LEFT JOIN BROKER.DBO.TRE_ANEXO_PURO P (NOLOCK) ON P.NR_PROCESSO = R.NR_PROCESSO "&_
'                    "  INNER JOIN BROKER.DBO.TRE_ANEXO A (NOLOCK) ON A.NR_PROCESSO = P.NR_PROCESSO "&_
'                    "                              AND A.CD_RE_ANEXO = P.CD_RE_ANEXO "&_
'                    "                              AND A.NR_PROCESSO_COMPLEMENTO = P.NR_PROCESSO_COMPLEMENTO "&_
'                    "  INNER JOIN BROKER.DBO.TRE_CAPA C (NOLOCK) ON C.NR_PROCESSO = A.NR_PROCESSO "&_
'                    "                                           AND C.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO "&_
'                    "  LEFT JOIN BROKER.DBO.TRE_ANEXO_DRAWBACK D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO "&_
'                    "                                                    AND D.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO "&_
'                    "                                                    AND D.CD_RE_ANEXO = A.CD_RE_ANEXO "&_
'                    "  INNER JOIN BROKER.DBO.TMERCADORIA_EXP M (NOLOCK) ON M.CD_MERCADORIA = P.CD_MERCADORIA " 

	
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario")&"' AND R.NR_IDENT = "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY "
	
	If fnc_TestaVar(tp_quebra) Then
		if tp_quebra = 4 Then
			sql_o = sql_o & " PR." & tipo_quebra( tp_quebra ) &" ASC, "
		Else
			sql_o = sql_o & " R." & tipo_quebra( tp_quebra ) &" ASC, "
		End If
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
	    sql_o = sql_o &" R.NR_PROCESSO ASC"
	End If
	Response.Redirect("../EXPORT/teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")


End If

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
			function MM_jumpMenu(targ,selObj,restore){ //v3.0
				var target = "track_result_itens.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
				eval(targ+".location='"+target+"'");
				if (restore) selObj.selectedIndex = 0;
			}
			function abreContainer(nr_processo) {
				features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
				window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
			}
			function abreCargaSolta(nr_processo) {
				features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
				window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
			}
			function abreDocs(nr_processo) {
			    window.open('/digitalizacao/digitalizacao_principal<%=lang_digitalizacao %>.aspx?produto=02&usuario=<%=Session("cd_usuario")%>&pg=2&retorno=' + nr_processo);
			}
			function abreStatus(nr_processo) {
				features = "top=100,left=20,width=750,height=550,resizable=yes";
				window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo,"status",features);
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

    function GlobalEventMonitor(eventName, functinRef) {
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

    var tableScroll = (function () {
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
            function position() {
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
		   ) {
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
	left: -320;
}
-->
</style>
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="44" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
	<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
<Table id="TabelaPrincipal" border="0" cellspacing="0" cellpadding="0" valign="middle" style="padding: 0px 1px 0px 1px;" bordercolor="#FFFFFF"  bgcolor="#336699">
<%
dim vTxLinha(1), vInRowspan
vTxLinha(0) = ""
vTxLinha(1) = ""
vInRowspan = false
nr_cols = 0
'**************************************************************************************************	
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado FLAVIO
'**************************************************************************************************	
objrsv.MoveFirst
Do While Not objrsv.Eof
        If objrsv.Fields.Item("M14_TP_KPI").Value = "0" Then
          kpi_cabec = " (" & tx_lang_CV008(cd_lang) & ") "
          classe_kpi = "gridtit3"
        Else
          kpi_cabec = " (" & tx_lang_CV014(cd_lang) & ") "
          classe_kpi = "gridtit3_1"
        End If
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
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then
                        If (in_dt_prev) Then 
						    vTxLinha(0) = vTxLinha(0) &"<th colspan='3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"&nbsp;&nbsp;<img alt='Monitorar Evento' src='/imagens/30/marcador_"
                            
                            If InStr(eventos_marcados, objrsv.Fields.Item("M10_CD_BROKER").Value) > 0 Then
                                vTxLinha(0) = vTxLinha(0) &"3"
                            Else
                                vTxLinha(0) = vTxLinha(0) &"d3"
                            End If

                            vTxLinha(0) = vTxLinha(0) &".gif' border='0' onclick=""alteraMarcador(this,'" & nr_ident & ";TREL_IMP_TRACK;NR_PROCESSO_DES;" & cd_view & "', '" & objrsv.Fields.Item("M10_CD_BROKER").Value & "', '" & Session("cd_usuario")& "', '1','" & eventos_marcados & "');"" style='cursor:pointer;' align='absmiddle'></th>"
						    vTxLinha(1) = vTxLinha(1) &"<th style='background-color:" & cabec_result & ";'>"&tx_lang_A00033(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00034(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00035(cd_lang)&"</th>"
						    vInRowspan = true
						    nr_cols = nr_cols + 3
                        Else
                            vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"&nbsp;&nbsp;<img alt='Monitorar Evento' src='/imagens/30/marcador_"
                            
                            If InStr(eventos_marcados, objrsv.Fields.Item("M10_CD_BROKER").Value) > 0 Then
                                vTxLinha(0) = vTxLinha(0) &"3"
                            Else
                                vTxLinha(0) = vTxLinha(0) &"d3"
                            End If

                            vTxLinha(0) = vTxLinha(0) &".gif' border='0' onclick=""alteraMarcador(this,'" & nr_ident & ";TREL_EXP_TRACK;NR_PROCESSO;" & cd_view & "', '" & objrsv.Fields.Item("M10_CD_BROKER").Value & "', '" & Session("cd_usuario")& "', '1','" & eventos_marcados & "');"" style='cursor:pointer;' align='absmiddle'></th>"
						    nr_cols = nr_cols + 1
                        End If
					else	
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						nr_cols = nr_cols + 1
					end if
				case else
					If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='" & classe_kpi & "'>"&objrsv.Fields.Item("M10_NM_DADO").Value&kpi_cabec&"</th>"
					Else
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
					End If
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'exibe a linha com os cabeçalhos
if Len(vTxLinha(0)) > 0 then
	If in_doctos Then
		vTxLinha(0) = "<th#ROW# width=160 class='gridtit' style='background-color:" & cabec_result & ";'>Documentos Digitalizados</th>"&vTxLinha(0)
  		nr_cols = nr_cols + 1
	End If
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=20 class='gridtit' style='background-color:" & cabec_result & ";'>"&vTxLinha(0)&"</tr>")
end if
'exibe a linha com os sub-cabeçalhos
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub'>"&vTxLinha(1)&"</tr>")
end if


cd_campo_quebra = ""
nrec = 0
objrsv.MoveFirst

'**************************************************************************************************	
'Exibe os resultados do relatório e aplica a personalização
'**************************************************************************************************	
Do While nrec < objrs.PageSize and Not objrs.Eof
				'pega informações do processo
				nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)

                If tp_relat = 3 Then
                nr_fatura_exp = objrs.Fields.Item("NR_PEDIDO_EXP").Value
                End If
				'alterna a cor das linhas
				If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
				'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
				If fnc_TestaVar( tp_quebra ) Then
					'quando muda campo definido no tipo de quebra, exibe o valor
					If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
			%>
								<tr>
									<td height="20" colspan="<%= nr_cols%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
								</tr>
								<%
					End If
					cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
				End If
			%>
								<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<%
				If in_doctos Then
					'verifica se os documendo já foram enviados
					dim objfso : Set objfso = Server.CreateObject("Scripting.FileSystemObject")
						'Response.Redirect("../IMPORT/teste.asp?var1="&Server.MapPath("/docs/"& nr_processo)&"")
					If objFSO.FolderExists(Server.MapPath("/docs/"& nr_processo)) or objFSO.FolderExists(Server.MapPath("/docs_novo/"& nr_processo)) Then
						Response.Write("<td><nobr><a href='#' onClick=""abreDocs('"& nr_processo &"');"">"& tx_lang_004031(cd_lang) &"</a></nobr></td>")
					Else
						Response.Write("<td><nobr>"& tx_lang_A00059(cd_lang) &"</nobr></td>")
					End If
					set objfso = nothing
				End If
				If objrsv.Eof Then objrsv.MoveFirst
			'**************************************************************************************************	
				'aplica a personalização - Inicio
			'**************************************************************************************************	
				Do While Not objrsv.Eof
					nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
					''Response.Redirect("../IMPORT/teste.asp?var1="&nm_campo_rel&"")

					'===================================================================
					'exibe os dados de acordo com a personalização do usuário 
					'===================================================================
					Select Case objrsv.Fields.Item("M10_CD_DADO").Value  'M10_CD_DADO=Código do campo a ser selecionado
						Case "0003" 'Nr. do Processo
			%>
									<td align="center"><nobr>&nbsp;<a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%= Mid(nr_processo, 5, 12)%></a>&nbsp;</nobr></td>
									<%	
						Case "0009"
							'Response.Redirect("../IMPORT/teste.asp?var1="&ltrim(rtrim(objrs.Fields.Item("in_courrier").Value))&"")
							If isnull(ltrim(rtrim(objrs.Fields.Item("in_courrier").Value))) then tpCourrier=""
							If ltrim(rtrim(objrs.Fields.Item("in_courrier").Value))="1" then tpCourrier="(Courrier)" else tpCourrier="" end if
								str=objrs.Fields.Item(nm_campo_rel).Value& tpCourrier%>
								<td><nobr><%=str%>&nbsp;</nobr></td>

						<%'===================================================================	
						Case "0548"
						If objrsx.State = adStateOpen Then objrsx.Close()
                        sql = "SELECT CD_RAP+'/'+CD_RAP_ANO AS NR_RAP FROM TRAP WHERE NR_PROCESSO='" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						nr_rap = ""
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											nr_rap = nr_rap & Trim(objrsx.Fields.Item("NR_RAP").Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else nr_rap = nr_rap & "<br>&nbsp;"
										Loop
									End If
						
						%>
							<td align="center"><nobr>&nbsp;<a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%= nr_rap%></a>&nbsp;</nobr></td>
                        
<%                      Case "0669"				
						If objrsx.State = adStateOpen Then objrsx.Close()
							sql = "SELECT DISTINCT PV.CD_VOLUME AS CD_VOLUME"&_ 
								  " FROM TRAP_PACK_VOLUME PV( NOLOCK )"&_
								  " INNER JOIN TRAP TR ON (TR.CD_RAP+TR.CD_RAP_ANO = PV.CD_RAP+PV.CD_RAP_ANO)"&_
								  " WHERE TR.NR_PROCESSO ='"& nr_processo & "'"
							
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						cd_volume = ""
						linha_vl = ""
													
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											If Len(cd_volume & Trim(objrsx.Fields.Item("CD_VOLUME").Value)) > 120 Then
											  linha_vl = linha_vl & cd_volume & "<br> "
											  cd_volume = Trim(objrsx.Fields.Item("CD_VOLUME").Value)
											Else
											  cd_volume = cd_volume & Trim(objrsx.Fields.Item("CD_VOLUME").Value) & ", "
											End If
											objrsx.MoveNext
										Loop
										linha_vl = linha_vl & Left(cd_volume, Len(cd_volume)-2)								
									End If
						
						%>
							<td align="center">&nbsp;<%= linha_vl%>&nbsp;</td>                               
						<%
						Case "0015" 'Tipo de contâiner
									Response.Write(fncExibeTipoContr(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================									
						Case "0017" 'canal de liberacao
									Response.Write(fncExibeCanal(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0486","0678","0780","0899","0920","1051","1066","1067","1087","2017","2018","2024","2027","2029","2142","2157","2158","2159","2261","2317" 'Nr.Referencia - Item
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
												"FROM TREF_CLIENTE ( NOLOCK ) "&_
												"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
												"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
												"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
									
                                    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'agrupa todas as referencias na string para aparecerem como hint
									nr_referencia = ""
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											nr_referencia = nr_referencia & Trim(objrsx.Fields.Item(nm_campo_rel).Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia &"<br>"
										Loop
									End If
					%>
											<td align="left"><a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><nobr><%= nr_referencia%>&nbsp;</nobr></a></td>
											<%
									If objrsx.State = adStateOpen Then objrsx.Close()
						Case "0700" 'Fatura Indaiá
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT F.NR_NOTA_FATURA AS FATURA, F.TP_TIPO_FAT AS TIPO, CONVERT(VARCHAR,F.DT_FATURA,103) AS DATA FROM TS_FATURA F "&_
					  " INNER JOIN TS_FATURA_PROCESSO FP ON (FP.CD_UNID_NEG = F.CD_UNID_NEG "&_
                      " AND FP.CD_PRODUTO = F.CD_PRODUTO "&_
                      " AND FP.NR_SOLICITACAO = F.NR_SOLICITACAO) "&_
                      " WHERE FP.NR_PROCESSO = '" & nr_processo & "'"&_
                      " AND F.IN_IMP_NF_SERV = '1'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str = ""
				If objrsx.RecordCount > 0 Then
					Do While Not objrsx.Eof
						str = str & Trim(objrsx.Fields.Item("FATURA").Value) & " - " & Trim(objrsx.Fields.Item("DATA").Value) 
						If Trim(objrsx.Fields.Item("TIPO").Value) = "F" Then
							str = str & " (Fatura Indaiá)"
						Else
							str = str & " (Nota de débito Indaiá)"
						End if
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & "<br>"
					Loop
				End If
				objrsx.Close()%>
				<td><nobr><%=str%>&nbsp;</nobr></td>
                <%			
						Case "0046" 'NR CONTAINER
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT NR_CNTR AS NR_CNTR, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
										" INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
										" WHERE TP.NR_PROCESSO= '"& nr_processo &"' "&_
										" ORDER BY TPC.NR_CNTR "										
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
									Do While Not objrsx.Eof
										str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str &"<br>"
									Loop
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
                                
						<%
						Case "0768" 'NR CONTAINER
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT TC.NM_CARRETA AS NM_CARRETA FROM tprocesso_cntr TPC (NOLOCK)"&_
										" INNER JOIN TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
										" INNER JOIN TTP_CARRETA TC (NOLOCK) ON TC.CD_CARRETA = TPC.CD_CARRETA "&_
										" WHERE TP.NR_PROCESSO= '"& nr_processo &"' "&_
										" ORDER BY TPC.NR_CNTR "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
									Do While Not objrsx.Eof
										str = str &Trim(objrsx.Fields.Item("NM_CARRETA").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str &"<br>"
									Loop
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
                                
						<%
                        Case "0905","0906","0907","0908","0909","0910","0911","0912","0914" 

							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT M.AP_MERCADORIA, A.NR_RE, P.QT_MERCADORIA, P.CD_NCM, P.VL_MLE, P.VL_MCV, P.VL_TOT_PESO_LIQ, CONVERT(VARCHAR, C.DT_DATA, 103) AS DT_RE, D.NR_ATO_CONCESSORIO AS ATO " &_
                                      " FROM BROKER.DBO.TRE_ANEXO_PURO P (NOLOCK) " &_
                                      "  INNER JOIN BROKER.DBO.TRE_ANEXO A (NOLOCK) ON A.NR_PROCESSO = P.NR_PROCESSO " &_
                                      "                                 AND A.CD_RE_ANEXO = P.CD_RE_ANEXO " &_
                                      "                                 AND A.NR_PROCESSO_COMPLEMENTO = P.NR_PROCESSO_COMPLEMENTO "&_
                                      "  INNER JOIN BROKER.DBO.TRE_CAPA C (NOLOCK) ON C.NR_PROCESSO = A.NR_PROCESSO " & _
                                      "                                AND C.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO "&_
                                      "  LEFT JOIN BROKER.DBO.TRE_ANEXO_DRAWBACK D (NOLOCK) ON D.NR_PROCESSO = A.NR_PROCESSO "&_
                                      "                                AND D.NR_PROCESSO_COMPLEMENTO = A.NR_PROCESSO_COMPLEMENTO " &_    
                                      "                                AND D.CD_RE_ANEXO = A.CD_RE_ANEXO " &_
                                      "  INNER JOIN BROKER.DBO.TMERCADORIA_EXP M (NOLOCK) ON M.CD_MERCADORIA = P.CD_MERCADORIA "&_
                                      " WHERE P.NR_PROCESSO = '" & nr_processo & "'"&_
                                      " ORDER BY NR_RE"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								                                
                                'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
                                    Select Case objrsv.Fields.Item("M10_CD_DADO").Value
                                        Case "0905"
                                            Do While Not objrsx.Eof
                                            str = str &Trim(objrsx.Fields.Item("AP_MERCADORIA").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0906"
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("NR_RE").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0907"
                                            Do While Not objrsx.Eof
                                            str = str &Trim(objrsx.Fields.Item("CD_NCM").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0908"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("QT_MERCADORIA").Value),4)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0909"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_MLE").Value),2)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0910"
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_MCV").Value),2)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0911" 
                                            Do While Not objrsx.Eof
                                            str = str & FormatNumber(Trim(objrsx.Fields.Item("VL_TOT_PESO_LIQ").Value),4)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0912" 
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("DT_RE").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                        Case "0914" 
                                            Do While Not objrsx.Eof
                                            str = str & Trim(objrsx.Fields.Item("ATO").Value)
                                            objrsx.MoveNext
										    If objrsx.Eof Then Exit Do Else str = str &"<br>"
									        Loop
                                    End Select
								End If
								objrsx.Close()%>
                                <td><nobr><%=str%></nobr></td>
						<%
                        '===================================================================	
						Case "0687" 'deposito de coleta
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT (SUBSTRING(TEN.CGC_EMPRESA,1,2)+'.'+SUBSTRING(TEN.CGC_EMPRESA,3,3)+'.'+SUBSTRING(TEN.CGC_EMPRESA,6,3)+'/'+SUBSTRING(TEN.CGC_EMPRESA,9,4)+'-'+SUBSTRING(TEN.CGC_EMPRESA,13,2)) AS CNPJ"&_
                                      " FROM  TEMPRESA_NAC TEN "&_
                                      " INNER JOIN TRAP TRP ON (TRP.CD_DEP_COLETA = TEN.CD_EMPRESA AND TRP.CD_RAP + TRP.CD_RAP_ANO ='"& nr_processo &"')"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
									Do While Not objrsx.Eof
										str = str &Trim(objrsx.Fields.Item("CNPJ").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str &"<br>"
									Loop
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%

						'===================================================================	
						Case "0861" 'deposito de coleta
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT (SUBSTRING(TEN.CGC_EMPRESA,1,2)+'.'+SUBSTRING(TEN.CGC_EMPRESA,3,3)+'.'+SUBSTRING(TEN.CGC_EMPRESA,6,3)+'/'+SUBSTRING(TEN.CGC_EMPRESA,9,4)+'-'+SUBSTRING(TEN.CGC_EMPRESA,13,2)) AS CNPJ"&_
                                      " FROM  TEMPRESA_NAC TEN "&_
                                      " INNER JOIN TRAP TRP ON (TRP.CD_DEP_COLETA = TEN.CD_EMPRESA)"&_
                                      " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& nr_fatura_exp & "'"&_
                                      "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = str &Trim(objrsx.Fields.Item("CNPJ").Value)
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0863" 'peso_liq_unit
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_PESO_LIQ_UNIT * QT_MERCADORIA) AS VL_PESO "&_
                                " FROM TPROCESSO_EXP_ITEM "&_ 
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "  AND NR_PEDIDO = '" & nr_fatura_exp & "' "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("VL_PESO").Value, 4)
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0864" 'peso_liq_unit
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_MLE) AS VL_MLE "&_
                                " FROM TPROCESSO_EXP_ITEM "&_ 
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "  AND NR_PEDIDO = '" & nr_fatura_exp & "' "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("VL_MLE").Value, 2)
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0865" 'SIGLA
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT DISTINCT U.NM_SIGLA AS SIGLA "&_
                                " FROM TPROCESSO_EXP_ITEM E (NOLOCK) "&_
                                "  INNER JOIN TUNID_MEDIDA_BROKER U (NOLOCK) ON U.CD_UNID_MEDIDA = E.CD_UNID_MEDIDA "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("SIGLA").Value
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0883" 'DESCONTO
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_DESCONTO) AS DESCONTO "&_
                                " FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("DESCONTO").Value, 2)
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0884" 'ACRESCIMO
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT SUM(VL_ACRESCIMO) AS ACRESCIMO "&_
                                " FROM TPROCESSO_EXP_ITEM (NOLOCK) "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                "   AND NR_PEDIDO = '" & nr_fatura_exp & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = FormatNumber(objrsx.Fields.Item("ACRESCIMO").Value, 2)
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0893" 'qtde. fornecimentos
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT COUNT(DISTINCT CD_FORNECIMENTO) AS TOTAL "&_
                                " FROM TRAP_FORNECIMENTO TRP "&_
                                " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& nr_fatura_exp & "'"&_
                                "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("TOTAL").Value
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0913" 'fornecimentos - RAP
                            str = ""
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT DISTINCT CD_FORNECIMENTO "&_
                                " FROM TRAP_FORNECIMENTO TRP "&_
                                " WHERE TRP.CD_RAP + '/' + TRP.CD_RAP_ANO ='"& nr_fatura_exp & "'"&_
                                "  AND TRP.CD_GRUPO = '" & objrs.Fields.Item("CD_GRUPO").Value & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  Do While Not objrsx.Eof
								    str = str &" "& Trim(objrsx.Fields.Item("CD_FORNECIMENTO").Value)
								    objrsx.MoveNext
								    If objrsx.Eof Then Exit Do Else str = str & "<br>"
							      Loop 
								End If
								objrsx.Close()%>
                                <td><nobr><%=str%>&nbsp;</nobr></td>
                                <%
                        Case "0895" 'qtde. fornecimentos
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT COUNT(DISTINCT F.CD_FORNECIMENTO) AS TOTAL "&_
                                " FROM TRAP R "&_
                                "   INNER JOIN TRAP_FORNECIMENTO F (NOLOCK) ON F.CD_RAP = R.CD_RAP "&_
                                "                                          AND F.CD_RAP_ANO = R.CD_RAP_ANO"&_
                                "                                          AND F.CD_GRUPO = R.CD_GRUPO"&_
                                " WHERE R.NR_PROCESSO = '" & nr_processo & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("TOTAL").Value
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0897" 'VOLUMES
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = " SELECT TX_MARCACAO AS DESCRICAO "&_
                                " FROM TPROCESSO_EXP_PEDIDO "&_
                                " WHERE NR_PROCESSO = '" & nr_processo & "'"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								str = ""
								If objrsx.RecordCount > 0 Then
                                  str = objrsx.Fields.Item("DESCRICAO").Value
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
                        Case "0471"
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT ISNULL(S.NM_SERVICO, SN.NM_SERVICO) AS NM_SERVICO "&_
						" FROM TPROCESSO  PR (NOLOCK) "&_
                        " LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = PR.CD_SERVICO " &_
                        " LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO)  " &_
						" WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
            Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
            str = objrsx.Fields.Item("NM_SERVICO").Value	
            %>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
				<%
                objrsx.Close()	
						Case "0579" 'Dt.Referencia
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA, DT_REFERENCIA "&_
												"FROM TREF_CLIENTE ( NOLOCK ) "&_
												"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
												"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
												"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'agrupa todas as referencias na string para aparecerem como hint
									nr_referencia = ""
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											nr_referencia = nr_referencia & Trim(objrsx.Fields.Item(nm_campo_rel).Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia &"<br>"
										Loop
									End If
					%>
											<td align="left"><%= nr_referencia%></td>
											<%
									If objrsx.State = adStateOpen Then objrsx.Close()
						'===================================================================	
						Case "0066" 'tipo de frete
									Response.Write(fncExibeFrete(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						Case "0084" 'Mercadoria
									'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT ISNULL( M.AP_MERCADORIA,'') AS TX_MERCADORIA ,M.CD_MERCADORIA "&_
												"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"WHERE NR_PROCESSO = '"& nr_processo &"'" &_
												" ORDER BY I.CD_MERCADORIA "
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'se não achar a mercadoria, procura na tprocesso
									If objrsx.RecordCount < 1 Then
										objrsx.Close
										sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
													"FROM TPROCESSO ( NOLOCK ) "&_
													"WHERE NR_PROCESSO = '"& nr_processo &"'"
										objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
										'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")

									End If
									
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										Do While Not objrsx.Eof
											str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value,"""","'"))
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop 
									Else
										str = "Descrição não Disponível."
									End If
					%>
											<td align="left"><nobr><%= str%>&nbsp;</nobr></td>
											<%
									objrsx.Close
					'Flávio em 8/5/2008  ===================================================================	
					 Case  "0766"
					 'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT CD_IMPORTACAO "&_
												" FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"  WHERE NR_PROCESSO = '"& nr_processo &"'"&_
												"  ORDER BY I.CD_MERCADORIA "
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'se não achar a mercadoria, procura na tprocesso
																	
									str = ""
									If objrsx.RecordCount > 0 Then
										Do While Not objrsx.Eof
											if fnc_TestaVar(Trim(objrsx.Fields.Item("CD_IMPORTACAO").Value)) Then
												str = str & Trim(objrsx.Fields.Item("CD_IMPORTACAO").Value) 
											else
												str = str & "-" 
											end if	
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str & "<br>"
										Loop 
									Else
										str = ""
									End If
					%>
											<td align="left"><nobr><%= str%>&nbsp;</nobr></td>
											<%
									objrsx.Close
					 Case "0085" 'Agente de carga
								If objrsx.state = adStateOpen then objrsx.Close()
								sql="select tp.NR_PROCESSO,tp.cd_agente,ta.nm_agente as agente from tprocesso tp, tagente ta where NR_PROCESSO= '"& nr_processo &"' and ta.cd_agente=tp.cd_agente"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								str=""
								If objrsx.eof  Then
									 str = "&nbsp;"
								Else
									str = Trim(objrsx.Fields.Item("agente").Value)
								End If
								'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()%>
								<td><nobr><%=str%>&nbsp;</nobr></td>
						<%
										
						Case "0662","0981","0982","0983" 
						dim tp_consignatario
								If objrsx.state = adStateOpen then objrsx.Close()
								sql = "SELECT TP_CONSIGNATARIO FROM TPROCESSO_EXP "&_
								      " WHERE NR_PROCESSO ='"& nr_processo & "'"  
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								tp_consignatario = ""
								If objrsx.eof  Then
									tp_consignatario = null
								Else
									tp_consignatario = objrsx.Fields.Item("TP_CONSIGNATARIO").Value
								End If
								
								str=""
								If tp_consignatario = 0 Then 'Importador
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE (NOLOCK) ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO "&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_IMPORTADOR = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText		
									
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 1 Then 'Agente
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_AGENTE = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                                    	
									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 3 Then 'Banco
									If objrsx.state = adStateOpen then objrsx.Close()
									sql = "SELECT TEE.nm_empresa AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_EMPRESA,''))) + ', ' + LTRIM(RTRIM(ISNULL(TEE.END_NUMERO,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN TEMPRESA_EST TEE ON TEE.CD_EMPRESA = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " AND TEE.IN_BANCO = 1"&_
										  " WHERE TPE.NR_PROCESSO = '"& nr_processo & "'" 
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If	
								End If
								
								If tp_consignatario = 2 Then 'Transportadora
									sql = "SELECT TEE.DESCRICAO AS NOME, LTRIM(RTRIM(ISNULL(TEE.END_CIA_TRANSP,''))) + ' - ' + LTRIM(RTRIM(ISNULL(TEE.END_COMPL_CIA_TRANSP,''))) AS EMPRESA_END, TEE.END_CIDADE, TPEE.NM_PAIS "&_
										  " FROM TPROCESSO_EXP TPE"&_
										  " INNER JOIN BROKER.DBO.TTRANSPORTADOR_ITL TEE ON TEE.CODIGO = TPE.CD_CONSIGNATARIO"&_
                                          " INNER JOIN TPAIS_BROKER TPEE (NOLOCK) ON TPEE.CD_PAIS = TEE.CD_PAIS "&_
										  " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
								
								If tp_consignatario = 4 Then 'Despachante
									sql = "SELECT TDE.NM_DESPACHANTE AS NOME, '' AS EMPRESA_END, '' END_CIDADE, '' NM_PAIS"&_
									      " FROM TPROCESSO_EXP TPE"&_
									      " INNER JOIN TDESPACHANTE TDE ON TDE.CD_DESPACHANTE = TPE.CD_CONSIGNATARIO"&_
									      " WHERE TPE.NR_PROCESSO ='"& nr_processo & "'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

									If 	objrsx.RecordCount > 0 Then						
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0662" Then str = Rtrim(objrsx.Fields.Item("NOME").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0981" Then str = Rtrim(objrsx.Fields.Item("EMPRESA_END").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0982" Then str = Rtrim(objrsx.Fields.Item("END_CIDADE").Value) End If
                                      If objrsv.Fields.Item("M10_CD_DADO").Value = "0983" Then str = Rtrim(objrsx.Fields.Item("NM_PAIS").Value) End If
									End If
								End If
                                'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()%>
								<td><nobr><%=str%>&nbsp;</nobr></td>
                                                
						<%Case "0598" 'Cód.Mercadoria
									'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT ISNULL( M.AP_MERCADORIA, '') AS TX_MERCADORIA ,M.CD_MERCADORIA "&_
												"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"WHERE NR_PROCESSO = '"& nr_processo &"'"&_
												" ORDER BY I.CD_MERCADORIA "
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										Do While Not objrsx.Eof
											str = str & Trim(Replace(objrsx.Fields.Item("CD_MERCADORIA").Value,"""","'"))
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop 
									Else
										str = "Código não Disponível."
									End If
					%>
											<td align="left"><nobr><%= str%>&nbsp;</nobr></td>
											<%
									objrsx.Close

						'===================================================================	
						Case "0103","0701","0470" 'sim/não campo in_urgente
									Response.Write(fncExibeSimNao(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						case "0118","0123","0131" 'Nr. Nota Fiscal / Nr. RE / Nr. Doc. Instrução
							If ltrim(rtrim(objrs.Fields.Item("IN_PRODUTO_IMPORTADO").Value))="1" Then 
								tpProduto=" (Produto Importado)" 
							Else 
								tpProduto="" 
							End if
							
									Response.Write(fncExibeTabelaExp(0, objrsv.Fields.Item("M10_CD_DADO").Value, tpProduto))
						'===================================================================	
						Case "0154" 'Indicados do saque Borderô
									str = objrs.Fields.Item(nm_campo_rel).Value
									If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)%>
											<td align="left"><nobr><%= str%></nobr></td>
                                            
                                            
                        <%Case "0559" 'ENTRADA DE CONTAINER NO ARMAZÉM
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DT_ENT_ARM AS DATA, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
							"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
							"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Trim(objrsx.Fields.Item("DATA").Value)
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()%>

					<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>                    
											<%Case "0964","0965","0966", "1042", "1043" 'ENTRADA DE CONTAINER NO ARMAZÉM
                Dim campo_cntr
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT NR_CNTR, CONVERT(VARCHAR, DT_SAIDA_FABR, 103) AS DT_SAIDA_FABR, CONVERT(VARCHAR, DT_ENTREGA_FABRICA, 103) AS DT_ENTREGA_FABRICA, "&_
                      " CONVERT(VARCHAR, DT_ENTRADA_PATIO_TRANSP, 103) AS DT_ENTRADA_PATIO_TRANSP, NR_LACRE, TARA_CNTR FROM TPROCESSO_CNTR "&_
					  " WHERE NR_PROCESSO= '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
                str=""
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0964" Then campo_cntr = "DT_ENTRADA_PATIO_TRANSP"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0965" Then campo_cntr = "DT_ENTREGA_FABRICA"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "0966" Then campo_cntr = "DT_SAIDA_FABR"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1042" Then campo_cntr = "NR_LACRE"
                If objrsv.Fields.Item("M10_CD_DADO").Value = "1043" Then campo_cntr = "TARA_CNTR"

				If objrsx.RecordCount > 0 Then
		  		Do While Not objrsx.Eof
						str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)& " - " &Trim(objrsx.Fields.Item(campo_cntr).Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()%>

					<td><nobr><%= str%></nobr></td>		   
                                            
                                            <%									

			Case "0758"
			If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Replace(Replace(objrsx.Fields.Item("TX_OBSERVACAO").Value, "'", "´"), vbcrlf, "<br>")
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()%>

					<td><nobr><%= str%>&nbsp;</nobr></td>                    
											<%	
                                              Case "0930"
			  If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_NOTES "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Replace(Replace(objrsx.Fields.Item("TX_OBSERVACAO").Value, "'", "´"), vbcrlf, "<br>")
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()%>

					<td><nobr><%= str%>&nbsp;</nobr></td>   
                    <%     
						'===================================================================	
						Case "0170" 'qtde e tipo de Container
                        If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
												"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
												"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
												"  AND TP_CNTR <> '01' "&_
												"GROUP BY TP_CNTR"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									matriz = Split(nm_campo_rel, ";", -1)
									'Response.Redirect("../IMPORT/teste.asp?var1="&nm_campo_rel&"")
									If objrsx.RecordCount > 0 Then
										str = ""
										Do While Not objrsx.Eof
											'Response.Redirect("../IMPORT/teste.asp?var1="&tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1)&"")
											str = str &"<nobr>"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop
										str = "<table width='100%' cellspacing='1' cellpadding='0' border='0'><tr><td>"& str &_
													"</td><td align='right'>&nbsp;<a href='#' onClick=""abreContainer('"& nr_processo &"');"">"&_
													"<img src='/imagens/icones/16x16/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
													"</a>&nbsp;</td></tr></table>"
									Else
										str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
									End If
					%>
											<td><%= str%></td>
											<%
									objrsx.Close()
						'===================================================================	
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
													"<img src='/imagens/icones/16x16/pallet.gif' width=22 height=15 border=0 alt='"& tx_lang_A00043(cd_lang) &"' />"&_
													"</a>&nbsp;</td></tr></table>"
									Else
										str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
									End If
					%>
											<td><%= str%></td>
											<%
									objrsx.Close()
			Case  "KPIX"
			dim data1, data1_aux, data2, dia, total_fds, total_str, sinal
			str = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If data_dif_inicial = "DT_EV003DE" Then
				data_dif_inicial = "DT_EV003"
			End If
			
			If data_dif_final = "DT_EV003DE" Then
				data_dif_final = "DT_EV003"
			End If
			
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			" FROM TFLP_EXPORT1 F1 (nolock) " &_
            "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
            " WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
			
			If objrsx.RecordCount >0 Then
			If Not fnc_TestaVar(objrsx.Fields.Item("DIFERENCA").Value) Then
				str = ""
			Else		
			str = objrsx.Fields.Item("DIFERENCA").Value			
			If objrsv.Fields.Item("M14_TP_KPI").Value = "0" Then					
				data1 = objrsx.Fields.Item("DT_INICIAL").Value
                data1_aux = objrsx.Fields.Item("DT_INICIAL").Value
				data2 = objrsx.Fields.Item("DT_FINAL").Value
				cont_str = 0
				total_fds = 0
				
				If str < 0 Then
					total_str = str * (-1)
					sinal = "-"
				Else
					sinal = ""
					total_str = str
				End If 
                	
				Do While Not cont_str >=  total_str
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT DATEPART(WEEKDAY , '" & data1 & "') AS DIA"&_
					" FROM TFLP_EXPORT1 F1 (nolock) "&_
                    "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
                    "WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						
                    dia = objrsx.Fields.Item("DIA").Value
						
					If InStr("1;7", dia) > 0 Then
                        If data1 <> data1_aux Then
						  total_fds = total_fds + 1
                        End If
					End If	
						
					If str < 0 Then
						data1 = data1 - 1
					Else
						data1 = data1 + 1
					End If 
					cont_str = cont_str + 1
				Loop

				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT " & str & " - ("& sinal & "(SELECT COUNT(*)  FROM TFERIADO WHERE DT_FERIADO BETWEEN RLZ_" & data_dif_inicial &  " AND RLZ_"& data_dif_final &" AND DT_FERIADO NOT IN (RLZ_" & data_dif_inicial &  ",RLZ_"& data_dif_final &") AND DATEPART(WEEKDAY,DT_FERIADO) NOT IN ('1','7'))) - ("& sinal &"" &_
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_EXPORT1 F1 (nolock) "&_
                "  LEFT JOIN TFLP_EXPORT2 F2 (NOLOCK) ON F2.NR_PROCESSO = F1.NR_PROCESSO "&_
                "WHERE F1.NR_PROCESSO = '" & nr_processo & "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				
				If Not isNull(objrsx.Fields.Item("DIFERENCA_TOTAL").Value) Then
					str = objrsx.Fields.Item("DIFERENCA_TOTAL").Value
				Else
					str = ""
				End If
			Else
				If isNull(str) Then
					str = ""						
				Else
					str = str
				End If
			End If 
			End If
			Else
			  str = ""
			End If
			 %> 
			<td align="center">&nbsp;<%= str%>&nbsp;</td>	
				<%
				objrsx.Close()			
						'===================================================================	
						case "0499" 'qtde de produtos
									Response.Write(fncQtdeProdutosExp(0))
						'===================================================================	
						Case "0531" 'status do processo
									str = objrs.Fields.Item(nm_campo_rel).Value
									If fnc_TestaVar(str) Then str = "<a href=""#"" onClick=""abreStatus('"& nr_processo &"');"">"&Trim(str)&"</a>" Else str = ""
					%>
											<td><nobr><%= str%></nobr></td>
											<%
                        Case "0860" 'status do processo (todos)
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT CONVERT(VARCHAR, F.DT_ALTERACAO, 103) AS DT_ETAPA, E.NM_ETAPA "&_
                                    " FROM TFOLLOWUP_ETAPA F (NOLOCK) "&_
                                    " INNER JOIN TETAPA E ON E.CD_ETAPA = F.CD_ETAPA "&_
                                    " WHERE NR_PROCESSO = '" & nr_processo & "' "&_
                                    " ORDER BY DT_ALTERACAO  "
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										Do While Not objrsx.Eof
											str = str & Trim(objrsx.Fields.Item("DT_ETAPA").Value) & " - " & Trim(objrsx.Fields.Item("NM_ETAPA").Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop 
									End If
					%>
											<td align="left"><nobr><%= str%>&nbsp;</nobr></td>
											<%
									objrsx.Close
						'===================================================================	
						Case "0548" 'código da rap
									Response.Write(fncExibeRap(0, nr_processo))
						'===================================================================	
						Case "0560" 'qtde de faturas por processo
									Response.Write(fncEmbalagemExp(0))
						'===================================================================	
						Case "0577" 'qtde de faturas por processo
									Response.Write(fncQtdeFaturasExp(0))
						'===================================================================	
'						Case "0618" ' Item - Unidade de medida
'							sql = " SELECT TEI.NR_PROCESSO , TEI.CD_UNID_MEDIDA, TMB.NM_UNID_MEDIDA AS MEDIDA"&_
'								  " FROM TPROCESSO_EXP_ITEM         TEI "&_
'								  " INNER JOIN TUNID_MEDIDA_BROKER  TMB ON (TEI.CD_UNID_MEDIDA=TMB.CD_UNID_MEDIDA) "&_
'								  " WHERE NR_PROCESSO= '"& nr_processo &"'"
'							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'							str=""
'							If objrsx.eof  Then
'								 str = "&nbsp;"
'							Else
'								str = Trim(objrsx.Fields.Item("MEDIDA").Value)
'							End If
'							'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
'							objrsx.Close()%>
<%			Case "0677" ' Analista Cliente 23/05/2008
			  str = ""
			  If objrsx.state = adstateOpen then objrsx.close()
						sql = "SELECT ISNULL(SUM(VL_NOTA),'0') AS SOMA_NOTA "&_
						"FROM TPROCESSO_EXP_NF ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext

					  str= objrsx.fields.item("SOMA_NOTA").value
						  
					  objrsx.Close()%>		  
						<td><nobr>&nbsp;<%=  FormatNumber(str, 2)%>&nbsp;</nobr></td>	
<%			Case "0800" ' Qtde Volumes
			  str = ""
			  If objrsx.state = adstateOpen then objrsx.close()
						sql = "SELECT COUNT(PV.CD_VOLUME) AS VOLUME"&_ 
								  " FROM TRAP_PACK_VOLUME PV( NOLOCK )"&_
								  " INNER JOIN TRAP TR ON (TR.CD_RAP+TR.CD_RAP_ANO = PV.CD_RAP+PV.CD_RAP_ANO)"&_
								  " WHERE TR.NR_PROCESSO ='"& nr_processo & "'"
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext

					  str= objrsx.fields.item("VOLUME").value
						  
					  objrsx.Close()%>		  
						<td><nobr>&nbsp;<%=  str%>&nbsp;</nobr></td>		
                        	

<%			Case "0182","0485" ' Analista Cliente 23/05/2008
			 If objrsv.Fields.Item("M10_CD_DADO").Value = "0182" Then 
			  If objrsx.state = adstateOpen then objrsx.close()
					SQL=" select u.nm_usuario as contato from tprocesso p inner join tusuario u on (u.cd_usuario = p.cd_analista_cliente) "&_
					"where p.nr_processo ='"&nr_processo&"'" 
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
					  If objrsx.eof then
						 str="-"
					  else
						  str= objrsx.fields.item("CONTATO").value
					  End If	
			Else
			  If objrsx.state = adstateOpen then objrsx.close()
					SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
					" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
					" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
					"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
					  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
					  If objrsx.eof then
						 str="-"
					  else
						  str= objrsx.fields.item("CONTATO").value
					  End If
			End If		  
					  objrsx.Close()%>		  
						<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>									
                        <%
              Case "1013"
                  If objrsx.state = adstateOpen then objrsx.close()	
                  sql = " SELECT E.NM_ETAPA "&_
                  "  FROM BROKER.DBO.TFOLLOWUP_ETAPA FE "&_
                  "    INNER JOIN BROKER.DBO.TETAPA E (NOLOCK) ON E.CD_ETAPA = FE.CD_ETAPA"&_
                  "  WHERE FE.NR_PROCESSO = '"& nr_processo &"'  "&_
                  "    AND E.IN_RETRABALHO = '1'"&_
                  "    AND E.IN_ATIVO = '1'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                    str=""
                    If objrsx.eof then
					  str="-"
				    else
                      Do While Not objrsx.Eof
						str = str &Trim(objrsx.Fields.Item("NM_ETAPA").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					  Loop					  
				    End If	
                    objrsx.Close()%>		  
						<td><nobr><%= str%></nobr></td> 
<%   					Case Else 'FLAVIO - MONTANDO O RELATÓRIO (TRAZENDO OS DADOS)
									Select Case objrsv.Fields.Item("M10_TP_DADO").Value
										Case "0" 'exibe os campos de texto simples
										'Response.write objrs.Fields.Item(nm_campo_rel).Value
										'Response.end
										'=========================  ESTUFAGEM : NOMEANDO OS CÓDIGOS ===================================	
										    If objrsv.Fields.Item("M10_CD_DADO").Value="0595" Then
												  Select case objrs.Fields.Item(nm_campo_rel).Value 'nm_campo_rel = TP_Estufagem
																	Case "0"
																			nm_campo_rel="LCL"
																		Case "1"
																			nm_campo_rel="FCL"
																		Case "2"
																		nm_campo_rel="Carga solta"
																		Case else
																		nm_campo_rel="Em branco"
													End select
													Response.Write(fncExibeTextoPadrao(0, nm_campo_rel)) '(0,x), 0 = onde será exibida a informação(0-result, 1-print, 2-excel)
												else
													'Response.Redirect("../IMPORT/teste.asp?var1="&objrsv.Fields.Item("M10_CD_DADO").Value&"")
													%><script>//alert("<%'=nm_campo_rel%>")</script>
													<%Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value)) '(0,x), 0 = onde será exibida a informação(0-result, 1-print, 2-excel)
												End If							
										Case "1" 'exibe os campos de datas
											if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
												Response.Write(fncExibeDataEventoFupMarcador(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value, nr_processo, objrsv.Fields.Item("M10_CD_BROKER").Value))
											else
												Response.Write(fncExibeDataPadrao(0, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
											end if	
										Case "2" 'exibe os campos com valor decimal
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 2))
										Case "3" 'exibe os campos com valor monetário
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 4))
										Case "4" 'exibe os campos com valor inteiro
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 0))
										Case "5" 'exibe os campos do tipo memo
											Response.Write(fncExibeMemoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
									End Select
					End Select
					objrsv.MoveNext
					If objrsv.Eof Then Exit Do
				Loop
			'**************************************************************************************************	
'**************************************************************************************************
	'Fim da montagem dos campos que serão selecionados
'**************************************************************************************************	
			'**************************************************************************************************	
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
    if (typeof tableScroll == 'function') {
       tableScroll('TabelaPrincipal');
    }
</script> 
<!--#include virtual="/includes/inc_ends.asp"-->