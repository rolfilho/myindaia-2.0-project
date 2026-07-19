<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
Response.Buffer = True
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Fatura: Numerario x Despesas Pagas
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 07/02/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim sql_s	   'monta o select da query com os campos a serem exibidos
Dim sql_f	   'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w	   'monta o where da query
Dim sql_o	   'monta a ordenação da query
Dim pagina   'pagina inicial da ordenação
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados
Dim objrsfat   'objejo para armazenar dados do faturamento
Dim in_num   'identificador que guardar se tem ou não numerario para o processo/fatura
Dim in_desp  'identificador que guardar se tem ou não despesas para o processo/fatura
Dim vl_item  'valor do item do faturamento
Dim vl_desp  'armazema o valor total de despesas pagas pela indaiá
Dim vl_num   'valor do numerario
Dim vl_saldo 'valor do sado de numerario - despesas
Dim vl_total_num   'valor total dos numerarios
Dim vl_total_desp  'valor total das despesas
Dim vl_total_saldo 'valor total do saldo
Dim in_restitui    'verifica se existe restituição de valor na fatura
Dim in_despesas    'verifica se será mostradas as despesas detalhadamente
Dim in_faturado   'verifica se serão exibidos valores de processos faturados, não faturados ou ambos
Dim nr_proc_quebra, nr_solic_fat_quebra 'verifica o numero do processo para exibir os valores de acordo com a fatura
Dim nr_solic_fat   'numero da solitacacao de fatura
Dim htm_num   'estrutura html para exibir o numerário
Dim htm_desp  'estrutura html para exibir as despesas
Dim htm_saldo 'estrutura html para exibir o saldo
Dim tx_path_det  'caminho do arquivo de detalhe de processo
Dim cont_despesas

Set objrsfat = Server.CreateObject("ADODB.RecordSet")

in_comodo = "1"
sem_saldo = 1
in_show  = False
cd_tela  = "FAT003"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

in_faturado = Request.QueryString("in_faturado")
If Not fnc_TestaVar(in_faturado) Then in_faturado = "X"

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
Session("sql_fat_num_desp") = Null
If Not fnc_TestaVar(Session("sql_fat_num_desp")) Then
	'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, I.NM_ITEM, I.CD_ITEM, I.CD_TIPO_ITEM, T.TP_NATUREZA, CC.NR_LANCAMENTO, CONVERT(DATETIME,CC.DT_LANCAMENTO,103) AS DT_LANC, (SELECT ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) ELSE VL_ITEM END ), 0) AS VL_ITEM FROM TFATURAMENTO_CC WHERE NR_PROCESSO = R.NR_PROCESSO AND IN_CANCELADO = 0 AND CD_ITEM = CC.CD_ITEM AND DT_LANCAMENTO = CC.DT_LANCAMENTO AND NR_LANCAMENTO = CC.NR_LANCAMENTO) AS VAL_ITEM2, "
	'tabelas da busca
  sql_f = "FROM TREL_FAT_NUM_DESP R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) "&_
					"  LEFT JOIN TSERVICO  SV ( NOLOCK ) ON ( SV.CD_SERVICO  = PR.CD_SERVICO ) "&_
                    "  LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO) "&_
					"  INNER JOIN TFATURAMENTO_CC CC (NOLOCK) ON (CC.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = CC.CD_ITEM) "&_
					"  INNER JOIN TTIPO_ITEM T (NOLOCK) ON (T.CD_TIPO_ITEM = I.CD_TIPO_ITEM) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
					" AND R.NR_IDENT   =  "& nr_ident &" "&_
					" AND CC.IN_CANCELADO = 0 "&_
					" AND CC.CD_ITEM_NAO_FAT IS NULL "&_
					" AND (I.CD_ITEM NOT IN ('995','996')) "
					
					
					Select Case tp_relat
					Case "0"
						sql_w = sql_w + " AND I.CD_TIPO_ITEM IN ('R','D') "
					Case "1"
						sql_w = sql_w + " AND (I.CD_TIPO_ITEM = 'D' AND I.CD_ITEM NOT IN ('997','998'))" 
					Case "2"
						sql_w = sql_w + " AND (I.CD_TIPO_ITEM = 'R' AND I.CD_ITEM = ('008') ) "
					Case "3"
						sql_w = sql_w + " AND (I.CD_TIPO_ITEM = 'R' OR I.CD_ITEM = '008') "
					End Select
					
					
					'If tp_relat = "0" then						
					'	sql_w = sql_w + " AND I.CD_TIPO_ITEM <> 'N'  "
					'Else
					'	sql_w = sql_w + " AND I.CD_ITEM < 982  AND I.CD_ITEM <> 578"
					'End If
	
	If Session("flag_0747") = "1" Then
		sql_w = sql_w & " AND CC.DT_LANCAMENTO BETWEEN '" & Session("dt_ini_0747") & "' AND '" & Session("dt_fim_0747") & "' "
	End If				
					
	'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then  sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
	sql_o = sql_o &" R.NR_PROCESSO ASC, DT_LANC, CC.NR_LANCAMENTO "
	'inicia a montagem dos campos que serão selecionados
	nr_data = 0 'numero de eventos selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_CONSULTA")
				Case 0 'pega o valor direto da tabela indicada no "FROM"
					'verifica o tipo de dado
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case 0, 5 'campos de texto
							sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case 1 'campos de data
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								nr_data = nr_data + 1
								sql_s = sql_s &_
												" F"& nr_data &".IN_APLICAVEL AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_data &".DT_PREVISTA AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_data &".DT_REALIZACAO AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								sql_f = sql_f &_
												" LEFT JOIN TFOLLOWUP F"& nr_data &" ( NOLOCK ) ON ( F"& nr_data &".NR_PROCESSO = PR.NR_PROCESSO AND F"& nr_data &".CD_EVENTO = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"') "
							Else
								sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
						Case 2, 3, 4 'campos numericos
							sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End Select
				Case 1 'o valor vem atraves da consulta em outra tabela
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 2 'campos que retornam numeros para consulta em array
					sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 3 'campos que são calculados.
			End Select
		Else
			'campos que não podem ser montados a partir de um padrão
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_fat_num_desp") = sql_s & sql_f & sql_w & sql_o
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
'Response.Write(Session("sql_fat_num_desp"))
'Response.end
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_fat_num_desp") &"<br>"

With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_fat_num_desp")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly


If Not in_dt_prev Then nr_data = 0
col = (objrsv.RecordCount - nr_data) + (nr_data * 3)
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&tp_relat="& tp_relat &_
			"&nr_ident="& nr_ident & url &_
			"&vl_total_num="& Request.QueryString("vl_total_num") &_
			"&vl_total_des="& Request.QueryString("vl_total_des") &_
			"&vl_total_sld="& Request.QueryString("vl_total_sld") &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/fatura/num_desp_print"
tx_path_excel = "/excel/fat_num_desp"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.spc1 {
	border: #FFFFFF solid;
	border-width: 0px 0px 1px 0px;
}
.spc2 {
	border: #FFFFFF solid;
	border-width: 0px 1px 0px 0px;
}
</style>




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
</script>



<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "num_desp_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function abreFatura(nr_processo, nr_solic_fat) {
	features = "top=20,left=20,width=400,height=300,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_fatura.asp?nr_processo='+nr_processo+'&nr_solic_fat='+nr_solic_fat+'&in_faturados=<%= in_faturado%>&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"fatura",features);
}

function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
}
//-->
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
    <td width="100%" height="50" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
  <tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
        <table id="TabelaPrincipal" width="100%" border="0" cellspacing="0" cellpadding="0">
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
						vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
					Else
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
					End If
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
If tp_relat = "0" Then
vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>Saldo</th>"	
End If	
if Len(vTxLinha(0)) > 0 then
	If in_doctos Then
		vTxLinha(0) = "<th#ROW# width=160 class='gridtit' style='background-color:" & cabec_result & ";'>Documentos Digitalizados</th>"&vTxLinha(0)
  		nr_cols = nr_cols + 1
	End If
		
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=30 class='gridtit' style='background-color:" & cabec_result & ";'><thead>"&vTxLinha(0)&"</tr>")
end if

if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub' style='background-color:" & cabec_result & ";'>"&vTxLinha(1)&"</tr>")
end if

cd_campo_quebra = ""
nr_proc_quebra  = ""
nrec = 0
objrsv.MoveFirst
'zera as variaveis que conteram os totais
vl_total_num   = 0
vl_total_desp  = 0
vl_total_saldo = 0
nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
bgcolor = "#FEFEFE"
'Exibe os resultados do relatório e aplica a personalização
Do While  Not objrs.Eof
  'alterna a cor das linhas
  
  If nr_proc_quebra <> objrs.Fields.Item("NR_PROCESSO").Value Then
  	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result  		
	vl_saldo = 0
  End If
  'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
  If fnc_TestaVar( tp_quebra ) Then
    'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
          <tr>
            <td height="20" colspan="<%= col + 3%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
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
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'verifica qual o produto
	If Mid(nr_processo, 3, 2) = "01" Then tx_path_det = "/detalhe/imp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&nr_referencia="& nr_referencia &"&nr_item_clnte="& nr_item_clnte &"&filtro=nr_processo&nr_processo="& nr_processo
	If Mid(nr_processo, 3, 2) = "02" Then tx_path_det = "/detalhe/exp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&filtro=nr_processo&nr_processo="& nr_processo
	
  Do While Not objrsv.Eof
  		response.flush
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
            <td align="center"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= Mid( nr_processo, 5, Len(nr_processo) )%></a>&nbsp;</nobr></td>
            <%
	  	Case "0018","0094","0096","0097","0098","0099","0100","0101","374" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					str           = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						str           = ""
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					Else
						nr_referencia = Null
						str           = Null
					End If
					objrsx.Close()
				End If
%>
            <td align="left" title="<%= str%>" style="font-style:"></nobr>&nbsp;<a href="<%= tx_path_det%>"><%= nr_referencia%></a>&nbsp;</nobr></td>
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
						str = str &"<nobr>"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='1' cellpadding='0' border='0'><tr><td>"& str &_
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
			Case "0730" 'qtde e tipo de Container
				sql = "SELECT CC.CD_ITEM, I.NM_ITEM, CC.VL_ITEM FROM TFATURAMENTO_CC CC (NOLOCK) "&_
				" INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = CC.CD_ITEM) "&_
				" WHERE CC.NR_PROCESSO = '" & nr_processo & "'"&_
				" AND CC.IN_CANCELADO = 0 "&_
             	" AND CC.IN_RESTITUI = 0 "&_
				" AND CC.CD_ITEM_NAO_FAT IS NULL "&_
				"AND I.CD_TIPO_ITEM <> 'N'  "&_
				" AND I.CD_ITEM < 900 "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount >0 Then
				str =""
				Do while Not objrsx.Eof
                  str = str & objrsx.Fields.Item("CD_ITEM").Value & " - " & objrsx.Fields.Item("NM_ITEM").Value & " R$ " & FormatNumber(objrsx.Fields.Item("VL_ITEM").Value,2)
                  objrsx.MoveNext
				  If objrsx.Eof Then Exit Do Else str = str &"<br>"
				Loop
				Else
				  str = ""
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
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
						
					if InStr("997;998", objrs.Fields.Item("CD_ITEM").Value) > 0 and nm_campo_rel = "NM_ITEM" Then str = "<b>" & str & "</b>"
					if objrs.Fields.Item("VAL_ITEM2").Value < 0 and nm_campo_rel = "NM_ITEM" Then str = str & " (Restituição)"			
%>
            <td align="left"><nobr>&nbsp;<%= str%></nobr></td>
            <%
		  		Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						x = Null
						y = Null
						z = Null
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						
						If (Not fnc_TestaVar(w)) or (w = 0) Then
							x = "-" 'data prevista
							y = "Não Aplicável" 'data realizada
							z = "-" 'diferença de dias
							color = "#999999"   'cor da fonte
						Else
							x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
							y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
							'se a data prevista existir
							If IsDate(x) Then
								'se a data realizada existir
								If IsDate(y) Then
									z = fnc_DiasUteisKPI(x, y, 1)
								Else
									z = fnc_DiasUteisKPI(x, Date(), 1)
								End If
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									z = "+"& z
									color = "#FF0000" 'vermelho
								End If
							End If
						End If
						
						If in_dt_prev Then
%>
            <td align="center"><nobr><%= fnc_Mascara( x, 5 )%></nobr></td>
						<td align="center"><nobr><font color="<%= color%>"><%= z %></font></nobr></td>
						<%
						End If
%>
            <td align="center"><nobr><font color="<%= color%>"><%= fnc_Mascara( y, 5 )%></font></nobr></td>
						<%
		  		Case "2" 'exibe os campos com valor decimal
		    		x = objrs.Fields.Item(nm_campo_rel).Value
     				If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
            <td align="right" <%If InStr("997;998", objrs.Fields.Item("CD_ITEM").Value) > 0 then%>style="font-weight:bold;"<%End If%>><nobr><%= x%></nobr></td>
            <%
		  		Case "3" 'exibe os campos com valor monetário
		    		x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 4 )
%>
            <td align="right"><nobr><%= x%></nobr></td>
            <%
		  		Case "4" 'exibe os campos com valor inteiro
		    		If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
						  matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
		  			  w = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
				      y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
						  x = fnc_DiasUteisKPI(objrs.Fields.Item(w).Value, objrs.Fields.Item(y).Value, Request.QueryString("in_dias_util"))
						Else
						  x = objrs.Fields.Item(nm_campo_rel).Value
						End If
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(x) < 20
		  			  x = "#"& x
				  	Loop
					  	x = Replace(x, "#", "&nbsp;")
%>
            <td align="right"><nobr><%= x%>&nbsp;</nobr></td>
            <%
				End Select
    End Select
		
		objrsv.MoveNext
    If objrsv.Eof Then Exit Do
  Loop
  If Session("flag_0747") <> "1" Then
  				If Not (InStr("995;996",objrs.Fields.Item("CD_ITEM").Value) > 0) Then
  				If objrs.Fields.Item("TP_NATUREZA").Value = "C" or (InStr("578;994;998",objrs.Fields.Item("CD_ITEM").Value) >0)  Then
					vl_item = objrs.Fields.Item("VAL_ITEM2").Value
				Else
					vl_item = objrs.Fields.Item("VAL_ITEM2").Value * (-1)
				End If
				
  				vl_saldo = Round(vl_saldo + vl_item, 2)
				End If
				
				If vl_saldo >= 0 Then
					saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
				Else
					saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
				End If
  Else
  	saldo = "<font color='#999999'>Não Disponível</font>" 				
  End If			

If tp_relat = "0" Then
%>
				<td align="right">&nbsp;<%=saldo%>&nbsp;</td>
                <%End If%>
				</tr>
          <%
	nrec = nrec + 1
	nr_proc_quebra = objrs.Fields.Item("NR_PROCESSO").Value
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
					<tr height="15" class="gridtit" style="background-color:<%=cabec_result%>;">
						<td colspan="<%= col+1%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
          <%
objrsv.Close
objrs.Close

Set objrsfat = Nothing
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
