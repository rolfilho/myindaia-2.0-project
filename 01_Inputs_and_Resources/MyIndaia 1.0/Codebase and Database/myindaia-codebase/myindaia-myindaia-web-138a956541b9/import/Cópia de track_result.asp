
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
Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_proc_adm, dir_arquivos 'numero do processo de administração de pedido
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
Dim data_dif_inicial, data_dif_final, cd_aliq

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
'Session("sql_imp_track") = Null
If Not fnc_TestaVar(Session("sql_imp_track")) Then
  'dados básicos do relatório
	Select Case tp_relat
		Case 0 'desembaraço
			sql_s = "SELECT DISTINCT "&_
							"  (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO_DES AND TP_REFERENCIA = '01') AS NR_REFERENCIA, "&_
							"  (SELECT TOP 1 NR_ITEM_PO FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO_DES AND TP_REFERENCIA = '01') AS NR_ITEM_CLIENTE, "&_
							"  (SELECT TOP 1 NR_PROCESSO_ADM FROM TESTAGIO_PROCESSO (NOLOCK) WHERE NR_PROCESSO_DES = R.NR_PROCESSO_DES) AS NR_PROCESSO_ADM, "
		Case 1, 2 'adm , ambos
			sql_s = "SELECT DISTINCT "&_
							"  R.NR_REFERENCIA, R.NR_ITEM_CLIENTE, R.DT_ULT_ALTERACAO, R.NR_PROCESSO_ADM, POI.QT_INICIAL, R.NR_PARCIAL, "
			
			If  tp_relat=1 then  'ADM
  			  sql_w = " AND ( (POI.QT_INICIAL>0 AND POI.NR_PARCIAL = 0) OR (POI.NR_PARCIAL > 0 ) ) "	
			else  'AMBOS
			 ' sql_w = " AND ( (POI.QT_INICIAL>0 AND POI.NR_PARCIAL = 0) OR (POI.NR_PARCIAL > 0 ) ) "		
			sql_w = " AND ( (POI.QT_INICIAL>0 AND POI.NR_PARCIAL = 0) OR (POI.NR_PARCIAL > 0 ) or POI.NR_PARCIAL IS NULL) "						  
			end if 
	End Select
	sql_s = sql_s &"  R.NR_PROCESSO_DES, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, R.CD_EMPRESA, DI.CD_FORNECEDOR, PR.CD_IMPORTADOR, "
	
	If inStr("0611", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 then
		sql_s = sql_s &"  "& objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
	end if
	
	
	'tabelas da busca

  sql_f = " FROM TREL_IMP_TRACK R (NOLOCK) "&_
					"  LEFT JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO_DES) "&_
					"  LEFT JOIN TPROCESSO GP (NOLOCK) ON (GP.NR_PROCESSO = R.NR_PROCESSO_ADM) "&_
					"  LEFT JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = ISNULL(PR.CD_SERVICO, GP.CD_SERVICO)) "&_
					"  LEFT JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
					"  LEFT JOIN TPO PO (NOLOCK) ON (PO.NR_PROCESSO = R.NR_REFERENCIA) " 
					'"  LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = R.NR_PARCIAL) "&_
					'"  LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = R.NR_PARCIAL) "
					'" LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE) "&_
					'" LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.DT_ULT_ALTERACAO = R.DT_ULT_ALTERACAO) "	
					Select Case tp_relat
						Case 0  'desembaraço
								'Response.Redirect("teste.asp?var1="&tp_relat&"")
						     sql_f=sql_f & " LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_PROCESSO_DES = PR.NR_PROCESSO) "&_
							 			   " LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.CD_EMPRESA = R.CD_EMPRESA) "
			   
						Case 1, 2 'adm , ambos
						     sql_f= sql_f & " LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = R.NR_PARCIAL AND POI.CD_EMPRESA = R.CD_EMPRESA) "&_
								   " LEFT JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = R.NR_PARCIAL AND FI.CD_EMPRESA = R.CD_EMPRESA)"	
					End Select
					
	If inStr("0611", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 then
		dt_inicial = Request.Cookies("datas")("dt_inicial")
		dt_final = Request.Cookies("datas")("dt_final")
	 
		sql_f= sql_f & " INNER JOIN "& objrsv.Fields.Item("M10_NM_TABELA").Value &" "& objrsv.Fields.Item("M10_CD_ALIAS").Value &_
		               " ON " & objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = R.NR_PROCESSO_DES "&_
					   " AND "& objrsv.Fields.Item("M10_CD_ALIAS").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &" BETWEEN CONVERT(DATETIME, '" & dt_inicial & "', 103)"&_ 
                       " AND CONVERT(DATETIME, '" & dt_final & "', 103)"
	end if
'Response.Redirect("teste.asp?var1="&sql_s&sql_f&"")
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO ='"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   = "& nr_ident & sql_w&" "
	' ordenação dos registros  
	sql_o = "ORDER BY "
	
	
	If fnc_TestaVar(tp_quebra) Then
		If tp_quebra = 4 then
			sql_o = sql_o &" PR."& tipo_quebra( tp_quebra ) &" ASC, "
		Else
			If tp_quebra = 5 then 
				sql_o = sql_o &" DI."& tipo_quebra( tp_quebra ) &" ASC, "
			Else
				sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC, "
			End If	
		End if
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
	If tp_relat = 0 Then sql_o = sql_o &" R.NR_PROCESSO_DES ASC" 
	If tp_relat = 1 Then sql_o = sql_o &" R.NR_PROCESSO_ADM ASC, R.NR_PARCIAL, R.CD_EMPRESA" 
	If tp_relat = 2 Then sql_o = sql_o &" R.NR_REFERENCIA ASC, R.NR_ITEM_CLIENTE ASC, R.NR_PARCIAL, R.CD_EMPRESA "
	End If

	'inicia a montagem dos campos que serão selecionados
				
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst

	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			'Tabela Direto
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "0" Then
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0","5" 'String/Text
						sql_s = sql_s &" ISNULL("&objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value&",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "1" 'Datetime
						If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
			        	'Response.end
							'datas de follow-up de desembaraço
							sql_s = sql_s &_
											" FI.RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
											" FI.PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
											" FI.IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value  &", "
						Else
							'Outras datas vindas de outras tabelas
							sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						End If
					Case "2","3","4" 'Decimal/Moeda/Inteiro
						sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				End Select
			End If
			'Lookup
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "1" Then
				sql_s = sql_s &_
								"(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'Array
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "2" Then
				sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'INNER JOIN
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "3" Then
				sql_s = sql_s &_
								"(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
								"  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'INNER JOIN SEM WHERE
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "4" Then
			sql_s = sql_s &_
								"(SELECT TOP 1 UPPER("& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								")  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			
			If objrsv.Fields.Item("M10_CD_DADO").Value = "0716" Then
				sql_f = sql_f&" LEFT JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON (CH.CD_CLIENTE = R.CD_CLIENTE AND CH.CD_PRODUTO = PR.CD_PRODUTO AND CH.CD_UNID_NEG = PR.CD_UNID_NEG) "
			End If
		Else
			'Response.write objrsv.Fields.Item("M10_CD_DADO").Value
			'Response.end
			'outros campos que não podem ser montados dinamicamente
			select case objrsv.Fields.Item("M10_CD_DADO").Value
				case "0531"
					sql_s = sql_s&" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					sql_f = sql_f&" LEFT JOIN VW_ULTIMA_ETAPA EP (NOLOCK) ON (EP.NR_PROCESSO = PR.NR_PROCESSO) "&_
												" LEFT JOIN VW_ULTIMA_ETAPA_ITEM EI (NOLOCK) ON (EI.NR_PROCESSO = POI.NR_PROCESSO AND EI.NR_ITEM = POI.NR_ITEM) "							
			end select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
		'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

	'finaliza a construção do select do relatório e salva na Session
	Session("sql_imp_track") = sql_s & sql_f & sql_w & sql_o
	
	'response.Write(Session("sql_imp_track"))
	'response.end
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_track") &"<br>"
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_imp_track")
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
tx_path_file  = "/import/track_print"
tx_path_excel = "/import/track_excel"

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
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "track_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
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

function abreDocs(nr_proc_des, nr_proc_adm, tp_relat) {
	features = "top=100,left=20,width=450,height=350,resizable=no";
  window.open('/detalhe/scan_docs_processo.asp?nr_proc_des='+nr_proc_des+'&nr_proc_adm='+nr_proc_adm+'&tp_relat='+tp_relat,"docs_processo",features);
}

function abreParametrizacao(nr_processo, tp_relat) {
	features = "top=100,left=20,width=500,height=350,resizable=yes";
  window.open('/detalhe/imp_parametrizacao.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}

function abreStatus(nr_processo, nr_referencia, nr_item_clnte, cd_empresa) {
	features = "top=100,left=20,width=750,height=550,resizable=yes";
  window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo+'&nr_referencia='+nr_referencia+'&nr_item_clnte='+nr_item_clnte+'&cd_empresa='+cd_empresa,"status",features);
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

</head>

<body onLoad="document.getElementById('colunaseta').background='/imagens/seta.jpg';">
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
    <td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top" <%If Session("cd_usuario") = "2184" Then%>background="/imagens/fundo_05.jpg" <%End If%>><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
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
			vTxLinha(0) = vTxLinha(0) &"<th colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<th>"&tx_lang_A00095(cd_lang)&"</td><th>"&tx_lang_A00096(cd_lang)&"</td><th>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
				          'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_CD_BROKER").Value&"")
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<th colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						vTxLinha(1) = vTxLinha(1) &"<th>"&tx_lang_A00033(cd_lang)&"</th><th>"&tx_lang_A00034(cd_lang)&"</th><th>"&tx_lang_A00035(cd_lang)&"</th>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else	
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						nr_cols = nr_cols + 1
					end if
				case else
					If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
					Else
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
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
		vTxLinha(0) = "<td#ROW# width=160 class='gridtit'>Documentos Digitalizados</td>"&vTxLinha(0)
  		nr_cols = nr_cols + 1
	End If
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=30 class='gridtit'><thead>"&vTxLinha(0)&"</tr>")
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
	nr_proc_des = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
	nr_proc_adm = Trim(objrs.Fields.Item("NR_PROCESSO_ADM").Value)
	If fnc_TestaVar(nr_proc_des) Then nr_processo = nr_proc_des else nr_processo = nr_proc_adm
	nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
	nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
	cd_empresa    = Trim(objrs.Fields.Item("CD_EMPRESA").Value)

	if tp_relat<>0 then 
      nr_parcial    = Trim(objrs.Fields.Item("NR_PARCIAL").Value)
	end if
	'link para o detalhe do processo
	txLinkProcesso ="/detalhe/imp_proc_result.asp?cd_menu_rel="&cd_menu&"&cd_subm_rel="&cd_subm&"&cd_view_rel="&cd_view&"&tp_relat="&tp_relat&_
		"&filtro=nr_processo,nr_referencia,nr_item_cliente,nr_parcial,cd_empresa&nr_processo="&nr_processo&"&nr_referencia="&nr_referencia&"&nr_item_clnte="&nr_item_clnte&"&nr_parcial="&nr_parcial&"&cd_empresa="&cd_empresa
		
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	if tp_relat<>0 then 
       if objrs("nr_parcial")=0 then bgcolor ="#C7E7FE" end if 
	end if
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar(tp_quebra) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
%>
					<tr>
						<td height="20" colspan="<%= nr_cols%>" class="gridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
					<tr height="16" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If in_doctos Then
	   if objrsx.State = adStateOpen Then objrsx.Close
       sql = "SELECT CONVERT(DATETIME,DT_ABERTURA,103) AS DT_ABERTURA FROM TPROCESSO WHERE NR_PROCESSO = '" & nr_processo & "'" 
       Objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly
	   
	   dir_arquivos = "docs"	
	   If Objrsx.RecordCount > 0 Then
		   If Objrsx.Fields.Item("DT_ABERTURA").Value >= CDate("01/06/2009") Then
			 dir_arquivos = "docs_novo"
		   Else
		     dir_arquivos = "docs"	 
		   End If
		End If
	   if objrsx.State = adStateOpen Then objrsx.Close
	  'verifica se os documendo já foram enviados
		If fnc_TestaVar(nr_proc_adm) Then in_proc_adm = objFSO.FolderExists(Server.MapPath("/"&dir_arquivos&"/"& nr_proc_adm)) Else in_proc_adm = False 
		If fnc_TestaVar(nr_proc_des) Then in_proc_des = objFSO.FolderExists(Server.MapPath("/"&dir_arquivos&"/"& nr_proc_des)) Else in_proc_des = False
		If in_proc_adm or in_proc_des Then
			Response.Write("<td><nobr><a href='#' onClick=""abreDocs('"& nr_proc_des &"','"& nr_proc_adm &"','"& tp_relat &"');"">"& tx_lang_004031(cd_lang) &"</a></nobr></td>")
		Else
			Response.Write("<td><nobr>"& tx_lang_A00059(cd_lang) &"</nobr></td>")
		End If
	End If
	
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização nos registros do relatório
	Do While Not objrsv.Eof
		'Response.Redirect("../import/teste.asp?var1="&SQL&"")

		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0015" 'Tipo de contâiner
                If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT NR_CNTR AS NR_CNTR, TP_CNTR FROM tprocesso_cntr TPC "&_
							"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
							"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					
					'Response.write sql
					'Response.end
					str = ""
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim(objrsx.Fields.Item("NR_CNTR").Value) & " - " & tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
'					If objrsx.RecordCount > 0 Then
'		  				str = Trim(objrsx.Fields.Item("NR_CNTR").Value)
'					 Else
'					   str = "&nbsp;"
'					End If
					objrsx.Close()%>
					<td><nobr><%=str%>&nbsp;</nobr></td><%
			Case "0017" 'canal de liberacao
				Response.Write(fncExibeCanal(0, objrs.Fields.Item(nm_campo_rel).Value))
			Case "0018" 'Nr. do pedido
			If tp_relat = 0 then 	
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
					" FROM TREF_CLIENTE ( NOLOCK ) "&_
					" WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
					" AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
					" ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
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
				If Session("cd_cargo")="088" Then
%>	
						<td align="right"><nobr>&nbsp;<%= nr_referencia%><%'=objrs.Fields.Item("NR_PARCIAL").Value%>&nbsp;</nobr></td>
						<%
				Else
%>	
						<td align="right"><nobr><a href="<%=txLinkProcesso%>"><%= nr_referencia%></a><%'=objrs.Fields.Item("NR_PARCIAL").Value%>&nbsp;</nobr></td>
						<%
				End If
			Else			
				If Session("cd_cargo")="088" Then
%>	
						<td align="right"><nobr>&nbsp;<%= nr_referencia%><%'=objrs.Fields.Item("NR_PARCIAL").Value%>&nbsp;</nobr></td>
						<%
				Else
%>	
						<td align="right"><nobr>&nbsp;<a href="<%=txLinkProcesso%>"><%= nr_referencia%></a><%'=objrs.Fields.Item("NR_PARCIAL").Value%>&nbsp;</nobr></td>
						<%
				End If
			End If	
			Case "0019" 'Nr. do item do pedido
				If Session("cd_cargo")="088" Then
				%>
						<td align="right"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
						<%
				Else
%>
						<td align="right"><nobr>&nbsp;<a href="<%=txLinkProcesso%>"><%= nr_item_clnte%></a>&nbsp;</nobr></td>
						<%
				End If
			Case "0062" 'fornecedor da Di ou Exportador do Detalhe mercadoria
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) "&_
					      " WHERE CD_EMPRESA = (SELECT TOP 1 CD_EXPORTADOR "&_
 	 						  "                       FROM TDETALHE_MERCADORIA ( NOLOCK ) "&_
 							  "                      WHERE NR_PROCESSO   = '"& nr_processo &"') "
  				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
						str = Trim(objrsx.Fields.Item("NM_EMPRESA").Value)
				  Else
				  	str = "&nbsp;"
					End If
				End If
%>
         <td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>

<%			
'------------------------------------------0064 Total FOB 14/04/2008,17/04/08
			Case "0064","0628" ', - 0628 INCLUIDO EM 28/7/08
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					sql="select IN_EMBUT_FRT_ITENS,IN_EMBUT_SEG_ITENS,CONVERT(DECIMAL(16,6),isnull(tx_mle,tx_dolar)) as tx_mle,CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" %>
        			<td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%
					Else
						If objrsx("IN_EMBUT_FRT_ITENS").Value=true  then chk_frete="1" else chk_frete="0" end if
						If objrsx("IN_EMBUT_SEG_ITENS").value=true  then chk_seguro="1" else chk_seguro="0" end if
						check_Fob=chk_frete+chk_seguro
						tx_mle=FormatNumber(objrsx.Fields.Item("tx_mle").Value,6)
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						'tx_dolar=objrsx.Fields.Item("tx_dolar").Value
						'response.Redirect("teste.asp?var1="&objrsx.Fields.Item("tx_mle").Value&"")
						'--------------------- objrsx que traz os valores de frete e seguro
						If objrsx.state=adstateOpen then objrsx.close()
						sql="SELECT ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN)),0) AS VALOR_PURO, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0)))),0) AS VALOR_SEM_FRETE, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-VL_SEGURO_ITEM_MN)),0) AS VALOR_SEM_SEGURO, "&_
						" ISNULL(CONVERT(DECIMAL(16,2),SUM(VL_MLE_ITEM_MN-(VL_FRETE_ITEM_MN-ISNULL(FRETE_TNAC_ITEM_REAL,0))-VL_SEGURO_ITEM_MN)),0) AS VALOR_SEM_FRETE_SEGURO "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						If Session("ncm") <> "" Then
						sql = sql & " AND CD_NCM_SH = '" & Trim(objrs.Fields.Item("NR_NCM").Value) & "'"
						End If

						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						
						str = FormatNumber(0,2)		
						'response.Redirect("teste.asp?var1="&check_Fob&"")
						Select case check_Fob
							Case "00" 'Seguro e frete não estão embutidos 
								 str = FormatNumber(objrsx.Fields.Item("VALOR_PURO").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
							Case "01"  'Frete não embutido e seguro embutido
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_SEGURO").Value,2)
							Case "11"  'Seguro e frete embutidos
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_FRETE_SEGURO").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
							Case "10"  'Frete embutido e seguro não
								 str = FormatNumber(objrsx.Fields.Item("VALOR_SEM_FRETE").Value,2)
								 'response.Redirect("teste.asp?var1="&str&"")
						End Select
						'response.Redirect("teste.asp?var1="&tx_mle&"")
						If objrsv.Fields.Item("M10_CD_DADO").Value = "0064" then
							if tx_mle = 0 then str = 0 else str = str / tx_mle
						else
							str = str / tx_dolar
						end if
						str=FormatNumber(str,2)
%>
        				 <td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%			
						objrsx.Close()
					End If
					
			Case "0672" ', - 0628 INCLUIDO EM 28/7/08
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					str = FormatNumber(0,2)
					sql="select CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" %>
        			<td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%
					Else
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						
						If objrsx.state=adstateOpen then objrsx.close()
						sql="SELECT CONVERT(DECIMAL(16,2),SUM(VL_BASE_CALC_II)) AS VALOR_CIF "&_
						" FROM TDETALHE_MERCADORIA "&_
						" WHERE NR_PROCESSO = '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						If Not isNull(objrsx.Fields.Item("VALOR_CIF").Value) Then
							str = FormatNumber(objrsx.Fields.Item("VALOR_CIF").Value,2) / tx_dolar
							str = FormatNumber(str,2)
						End If
%>
        				 <td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%			
						objrsx.Close()
					End If            
            Case "0830" 
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					str = FormatNumber(0,2)
					sql="select CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" %>
        			<td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%
					Else
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						
						If objrsx.state=adstateOpen then objrsx.close()
						sql = "SELECT VL_TOTAL_SEG_MN AS SEGURO "&_
				            " FROM TDECLARACAO_IMPORTACAO DI  "&_
				            " WHERE NR_PROCESSO =  '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						If Not isNull(objrsx.Fields.Item("SEGURO").Value) Then
							str = FormatNumber(objrsx.Fields.Item("SEGURO").Value,2) / tx_dolar
							str = FormatNumber(str,2)
						End If
%>
        				 <td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%			
						objrsx.Close()
					End If	
            
            Case "0831" 
						'--------------------- objrsx para verificar valores embutidos e taxas
				If objrsx.state=adstateOpen then objrsx.close()
					str = FormatNumber(0,2)
					sql="select CONVERT(DECIMAL(16,6),tx_dolar) as tx_dolar from tdeclaracao_importacao where NR_PROCESSO= '"& nr_processo   &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
					If Objrsx.eof then
					str="-" %>
        			<td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%
					Else
						tx_dolar=FormatNumber(objrsx.Fields.Item("tx_dolar").Value,6)
						
						If objrsx.state=adstateOpen then objrsx.close()
						sql = "SELECT SUM(VL_FRETE_ITEM_MN) AS FRETE "&_
				            " FROM TDETALHE_MERCADORIA DM  "&_
				            " WHERE NR_PROCESSO =  '"& nr_processo   &"' "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
						If Not isNull(objrsx.Fields.Item("FRETE").Value) Then
							str = FormatNumber(objrsx.Fields.Item("FRETE").Value,2) / tx_dolar
							str = FormatNumber(str,2)
						End If
%>
        				 <td><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>
<%			
						objrsx.Close()
					End If        				
'------------------------------------------0067 Total FOB
			Case "0094","0096","0097","0098","0099","0100","0101","0374","0678"
				If objrsx.State = adStateOpen Then objrsx.Close()
				'sleeciona a referencia de acordo com o tipo
				sql = "SELECT DISTINCT CD_REFERENCIA "&_
							"FROM TREF_CLIENTE ( NOLOCK ) "&_
							"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
							"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
							"ORDER BY CD_REFERENCIA"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = "referência"& vbcrlf
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					'x = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
					'If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						x = x & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value) & ", "
						str = str & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & vbcrlf
					Loop
				End If
				
				If fnc_TestaVar(x) Then
%>
						<td align="left" title="<%= str%>"><nobr>&nbsp;<%= Left(x, Len(x) - 2)%>&nbsp;</nobr></td>
						<%
				Else
%>
						<td align="center"><nobr>&nbsp;&nbsp;</nobr></td>
						<%
				End If
				objrsx.Close()
			Case "0748"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(DM.CD_NCM_SH,'') AS CD_NCM_SH "&_
							"FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
							"WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
				str = str & objrsx.Fields.Item("CD_NCM_SH").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close		
			Case "0749"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(DM.TX_DESC_DET_MERC,'') AS NM_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
							"WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & objrsx.Fields.Item("NM_MERCADORIA").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close				
			Case "0750"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT M.NM_MOEDA AS MOEDA "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"INNER JOIN TMOEDA_BROKER M ON M.CD_MOEDA = DI.CD_MOEDA_SEGURO "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & objrsx.Fields.Item("MOEDA").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close	
			Case "0751"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT VL_TOT_SEGURO_MNEG AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
			Do While Not objrsx.Eof
				str = str & FormatNumber(objrsx.Fields.Item("SEGURO").Value,2)
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close
			Case "0752"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT VL_TOTAL_SEG_MN AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & FormatNumber(objrsx.Fields.Item("SEGURO").Value,2)
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close			
			Case "0753"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT PC_SEGURO_MLE AS SEGURO "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str &  objrsx.Fields.Item("SEGURO").Value & "%"
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close	
			Case "0754"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT PL_CARGA AS CARGA "&_
				"FROM TDECLARACAO_IMPORTACAO DI  "&_
				"WHERE NR_PROCESSO =  '"& nr_processo   &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str &  FormatNumber(objrsx.Fields.Item("CARGA").Value,3)
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close	
			Case "0755"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT A.NR_ADICAO, (CD_REGIME_TRIBUTAR + ' - ' + T.DESCRICAO) AS TEXTO"&_
                      " FROM TADICAO_DE_IMPORTACAO A "&_
                      " INNER JOIN BROKER.DBO.TREG_TRIBUTARIO T ON T.CODIGO = A.CD_REGIME_TRIBUTAR "&_
                      " WHERE A.NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & objrsx.Fields.Item("TEXTO").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close	
				Case "0799"
			str = ""
			If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT NR_ADICAO, NR_ATO_DRAWBACK AS TEXTO"&_
                      " FROM TADICAO_DE_IMPORTACAO "&_                      
                      " WHERE NR_PROCESSO = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & objrsx.Fields.Item("TEXTO").Value
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
				Loop
			End If
			%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close		
			Case "0084","0543" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT DISTINCT DM.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA, "&_
							"  ISNULL(DM.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
							"FROM TDETALHE_MERCADORIA DM (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "
				If tp_relat <> 0 then
					sql = sql &_
								"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
								"  AND DM.CD_EMPRESA  = '"& cd_empresa &"' "&_
								"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
				End If
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					If tp_relat <> 0 then
						objrsx.Close
						sql = "SELECT DISTINCT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA, "&_
									"  ISNULL(I.CD_NCM_SH, ISNULL(M.CD_NCM_SH, '')) AS CD_NCM_SH "&_
									"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
									"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
									"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
									"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
									"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If

					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT 'não cadastrado' AS CD_MERCADORIA, ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA, '' AS CD_NCM_SH "&_
									"FROM TPROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				txTitle = ""
				str     = ""
				If objrsx.RecordCount > 0 Then
					If objrsv.Fields.Item("M10_CD_DADO").Value = "0084" then
						'descrição que será exibida
						if Trim(objrsx.Fields.Item("AP_MERCADORIA").Value) <> "" Then 
						str = Left(Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value,"""","'")), 40)
							if Trim(objrsx.Fields.Item("CD_NCM_SH").Value) <> "" Then
								str = str & " NCM/SH: "&Trim(objrsx.Fields.Item("CD_NCM_SH").Value)
							End If			
						End If			
						If objrsx.RecordCount > 1 Then str = str &"..."
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							if Trim(objrsx.Fields.Item("AP_MERCADORIA").Value) <> "" Then 
								txTitle = txTitle & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
								if Trim(objrsx.Fields.Item("CD_NCM_SH").Value) <> "" Then
									txTitle = txTitle &	" NCM/SH: "&Trim(objrsx.Fields.Item("CD_NCM_SH").Value)
								End If	
							End If					
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else txTitle = txTitle &";"& vbcrlf
						Loop
					Else
						'código q será exibido
						str = Trim(objrsx.Fields.Item("CD_MERCADORIA").Value)
						If objrsx.RecordCount > 1 Then str = str &"..."
						'agrupa todos os códigos para serem exibidos no hint da celula
						Do While Not objrsx.Eof
							txTitle = txTitle & Trim(objrsx.Fields.Item("CD_MERCADORIA").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else txTitle = txTitle &";"& vbcrlf
						Loop
					End If
				Else
					txTitle = "Descrição não cadastrada."
				End If
%>
						<td align="left" title="<%= txTitle%>"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close
				'Flávio em 12/5/2008  ===================================================================
				Case "0686" 'Planejador
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT P.NM_PLANEJADOR AS PLANEJADOR "&_
					" FROM TDETALHE_MERCADORIA DM (NOLOCK)"&_
                    " LEFT  JOIN TMERCADORIA M (NOLOCK) ON (M.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
					" INNER JOIN TPLANEJADORES P (NOLOCK) ON (P.CD_PLANEJADOR = M.CD_PLANEJADOR) "&_
                    " WHERE DM.NR_PROCESSO = '"& nr_processo   &"' "
				'Response.Write(sql &"<br>")
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					If tp_relat <> 0 then
						objrsx.Close
						sql = "SELECT P.NM_PLANEJADOR AS PLANEJADOR "&_
							  " FROM TPO_ITEM I (NOLOCK)"&_
							  " LEFT JOIN TMERCADORIA M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
							  " INNER JOIN TPLANEJADORES P (NOLOCK) ON (P.CD_PLANEJADOR = M.CD_PLANEJADOR) "&_
							  " WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							  " AND I.CD_EMPRESA = '"& cd_empresa &"'"&_
							  " AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
						'Response.Write(sql &"<br>")
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("PLANEJADOR").Value)
				End If
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
				objrsx.Close
				'Flávio em 12/5/2008  ===================================================================	
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
			Case "0567" 
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT VL_MLE_ITEM "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.NR_PARCIAL  = '"& nr_parcial &"' "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
				If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_TOTAL "&_
								" FROM TPO_ITEM I (NOLOCK) "&_
								" WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					If objrsx.RecordCount < 1 Then
						str = FormatNumber(0,2)	
					Else
						if fnc_testaVar(objrsx.Fields.Item("VL_TOTAL").Value) Then
    						str = FormatNumber(objrsx.Fields.Item("VL_TOTAL").Value,2)
						Else
							str = FormatNumber(0,2)	
						End If	
					End If	
				Else
				str = FormatNumber(objrsx.Fields.Item("VL_MLE_ITEM").Value,2)	
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()%>
				<td><nobr><%=str%>&nbsp;</nobr></td>
                <%   
			Case "0723","0735"
			   If objrsv.Fields.Item("M10_CD_DADO").Value  = "0723" Then
			     cd_aliq = "0001"
			   Else
			     cd_aliq = "0002"
			   End If
				str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT PC_ALIQ_NORM_ADVAL, M.NR_ADICAO "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN TRIBUTO T (NOLOCK) ON (T.NR_PROCESSO = M.NR_PROCESSO AND T.NR_ADICAO = M.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = '" & cd_aliq & "' ) "&_
							" WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.CD_EMPRESA  = '"& cd_empresa &"' "&_
							"  AND M.NR_PARCIAL  = '"& nr_parcial &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  GROUP BY M.NR_ADICAO, PC_ALIQ_NORM_ADVAL"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 1 Then
				str=""
				Do While Not objrsx.eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item("PC_ALIQ_NORM_ADVAL").Value,2)				
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>"
				Loop
				Else
					str = FormatNumber(objrsx.Fields.Item("PC_ALIQ_NORM_ADVAL").Value,2)	
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()%>
				<td><nobr><%=str%>&nbsp;</nobr></td>
                <%  
			Case "0736","0737","0738"
			   Select Case objrsv.Fields.Item("M10_CD_DADO").Value
					Case "0736"
					   cd_aliq = "ALIQ_PIS"
					Case "0737"
					   cd_aliq = "ALIQ_COFINS"
					Case "0738"
					   cd_aliq = "PC_ICMS"
			   End Select  
			   str = 0
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "
					
					If tp_relat = 0 then
						sql = sql & " WHERE M.NR_PROCESSO = '" & nr_processo & "'"
					Else
						sql = sql & " WHERE M.NR_PROC_PO = '" & nr_referencia & "'"&_
									" AND M.NR_ITEM_PO  = '" & nr_item_clnte & "'"&_
									" AND M.CD_EMPRESA = '" & cd_empresa & "'"&_
									" AND M.NR_PARCIAL = '" & nr_parcial & "'"		
					End If
					sql = sql & "  GROUP BY M.NR_ADICAO, " & cd_aliq
				
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If objrsx.RecordCount > 1 Then
				str=""
				Do While Not objrsx.eof
					str = str & "Adição " & objrsx.Fields.Item("NR_ADICAO").Value & " - " & FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)				
				objrsx.MoveNext
				If objrsx.eof Then Exit Do Else str = str & "<br>"
				Loop
				Else	
					If objrsx.RecordCount > 0 Then
					str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					else
					If objrsx.State = adStateOpen Then objrsx.Close
				    	sql = "SELECT " & cd_aliq & ", M.NR_ADICAO "&_
							" FROM TDETALHE_MERCADORIA M (NOLOCK) "&_
							" INNER JOIN TADICAO_DE_IMPORTACAO A (NOLOCK) ON (A.NR_PROCESSO = M.NR_PROCESSO AND A.NR_ADICAO = M.NR_ADICAO) "&_
							" WHERE M.NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
							str = FormatNumber(objrsx.Fields.Item(cd_aliq).Value,2)	
					    Else
							str = " - "
						End If	
					End If
				End If
				'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
				objrsx.Close()%>
				<td><nobr><%=str%>&nbsp;</nobr></td>
                <%  
			Case "0103","0294","0553", "0470" 'sim/não
				Response.Write(fncExibeSimNao(0, objrs.Fields.Item(nm_campo_rel).Value))
				'Response.Redirect("teste.asp?var1="&objrs.Fields.Item(nm_campo_rel).Value&"")
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
			Case "0130" 'Nr. Fatura Comercial
				If objrsx.State = adStateOpen Then objrsx.Close()
				str = objrs.Fields.Item("NR_FATURA").Value
				if not fnc_TestaVar(str) then
					sql = "SELECT LTRIM(RTRIM(NR_DCTO_INSTRUCAO)) AS NR_FATURA "&_
								"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
								"  AND NR_DCTO_INSTRUCAO <> '' "&_
								"  AND CD_TIPO_DCTO_INSTR = '01' "&_ 
								"ORDER BY NR_DCTO_INSTRUCAO"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					str = ""
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof
							str = str & objrsx.Fields.Item("NR_FATURA").Value
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					End If
					objrsx.Close()
				end if
%>
						<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%				
			Case "0170" 'qtde e tipo de Container
				If objrsx.State = adStateOpen Then objrsx.Close
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
								"<img src='/imagens/icones/16x16/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
					str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
						<%
				objrsx.Close()
				
			Case "0663" 
				str = ""
				If objrsx.State = adStateOpen Then objrsx.Close
				If tp_relat = 0 then 
					sql = "SELECT NM_SIGLA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				Else
					sql = "SELECT NM_SIGLA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				End If	
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
				If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT NM_SIGLA "&_
								"FROM TPO_ITEM I (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
								"WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_EMPRESA      = '"& cd_empresa &"' "&_
								"  AND I.CD_UNID_MEDIDA  = U.CD_UNID_MEDIDA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					If objrsx.RecordCount < 1 Then
					str = "-"	
					Else
					str = objrsx.Fields.Item(nm_campo_rel).Value			
					End If	
				Else
				str = objrsx.Fields.Item(nm_campo_rel).Value	
				End If
				
				
%>
						<td align="right"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
			objrsx.Close()	
				
			Case "0225" 'Nr. de Li
			If objrsx.State = adStateOpen Then objrsx.Close
				'sleeciona a referencia de acordo com o tipo
				sql = "SELECT DISTINCT NR_LI, IN_SUBSTITUIDA, NR_SUBSTITUIDA FROM TPROCESSO_LI ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' ORDER BY NR_LI"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = Null
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					'If objrsx.RecordCount > 1 Then x = x &"<br>"
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						x = Trim(objrsx.Fields.Item("IN_SUBSTITUIDA").Value)
						If x = 0 Then
							str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1)
						Else
							str = str & fnc_Mascara(Trim(objrsx.Fields.Item("NR_LI").Value), 1) & " (substitutiva da " &  fnc_Mascara(Trim(objrsx.Fields.Item("NR_SUBSTITUIDA").Value), 1) & ")"
						End If		
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
				End If
				
				If fnc_TestaVar(x) Then
%>
						<td align="left"><nobr><%= str%>&nbsp;</nobr></td>
						<%
				Else
%>
						<td align="center"><nobr>&nbsp;&nbsp;</nobr></td>
						<%
				End If
				objrsx.Close()
			Case "0283","0480","0481" 'DI, DTA, DA
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = fnc_Mascara(Trim(str), 1) Else str = ""
				If objrsv.Fields.Item("M10_CD_DADO").Value = "0283" Then 
					str = "<a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat &"');"">"& str &"</a>"
				End If
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%
			Case "0289" 'tipo de pedido
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then
					x = CInt(str) - 1
%>
						<td align="center"><nobr><%= tipo_pedido(x)%></nobr></td>
						<%
				Else
%>
						<td align="center"><nobr><%= "n/a"%></nobr></td>
						<%
				End If
			Case  "KPIX"
			dim data1, data2, dia, total_fds, total_str, sinal
			str = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			"FROM TFLP_IMPORT "
			If tp_relat = 0 then
				sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
			Else
				sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
				" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
				" AND CD_EMPRESA = '" & cd_empresa & "'"&_
				" AND NR_PARCIAL = '" & nr_parcial & "'"		
			End If
			
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
			
			If objrsx.RecordCount >0 Then		
			If Not fnc_TestaVar(objrsx.Fields.Item("DIFERENCA").Value) Then
				str = ""
			Else
			str = objrsx.Fields.Item("DIFERENCA").Value				
			If in_kpi_opcao = "1" Then
				data1 = objrsx.Fields.Item("DT_INICIAL").Value
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
						" FROM TFLP_IMPORT  "
						If tp_relat = 0 then
							sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
						Else
							sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
							" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
							" AND CD_EMPRESA = '" & cd_empresa & "'"&_
							" AND NR_PARCIAL = '" & nr_parcial & "'"		
						End If
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						dia = objrsx.Fields.Item("DIA").Value
						
						If InStr("1;7", dia) > 0 Then
							total_fds = total_fds + 1
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
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_IMPORT "
				
				If tp_relat = 0 then
					sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
				Else
					sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
					" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
					" AND CD_EMPRESA = '" & cd_empresa & "'"&_
					" AND NR_PARCIAL = '" & nr_parcial & "'"		
				End If
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
			<td align="right">&nbsp;<%= str%>&nbsp;</td>	
				<%
				objrsx.Close()
			Case "0304","0545" 'qtde embarcada/unidade de medida
				Dim teste
				Response.Write(fncQtdeMercDIxPO(0, objrsv.Fields.Item("M10_CD_DADO").Value))
				'Response.Redirect("teste.asp?var1="&teste&"")			

			Case "0350" 'Carga Solta / LCL
				If objrsx.State = adStateOpen Then objrsx.Close
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
			Case "0372" 'Nr. do Processo Administração
				x = ""
				str = ""
				
				If tp_relat = 0 Then
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT ISNULL(NR_PROCESSO_ADM, '') AS NR_PROCESSO_ADM "&_
								"FROM TESTAGIO_PROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO_DES = '"& objrs.Fields.Item("NR_PROCESSO_DES").Value &"' "&_
								"ORDER BY NR_PROCESSO_ADM"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						x = Trim(objrsx.Fields.Item("NR_PROCESSO_ADM").Value) 
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim(objrsx.Fields.Item("NR_PROCESSO_ADM").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
						str = " title='"& str &"'"
					End If
					objrsx.Close
				Else
				  x = Trim( objrs.Fields.Item(nm_campo_rel).Value )
				End If
				
				If fnc_TestaVar(nr_proc_adm) Then
					If Session("cd_cargo")="088" Then
					%>
						<td align="center"<%= str%>><nobr>&nbsp;<%= Mid( x, 5, Len(x) )%>&nbsp;</nobr></td>
						<%				
					Else
%>
						<td align="center"<%= str%>><nobr>&nbsp;<a href="<%=txLinkProcesso%>"><%= Mid( x, 5, Len(x) )%></a>&nbsp;</nobr></td>
						<%
					End If
				Else
%>
						<td align="center"><nobr>&nbsp;&nbsp;</nobr></td>
						<%
				End If
			Case "0373" 'Nr. do Processo Desembaraço
				str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
				If fnc_TestaVar(str) Then
					If Session("cd_cargo")="088" Then
					%>
						<td align="center"><nobr>&nbsp;<%= Mid( str, 5, Len(str) )%>&nbsp;</nobr></td>
						<%
					Else
%>
			
						<td align="center"><nobr>&nbsp;<a href="<%=txLinkProcesso%>"><%= Mid( str, 5, Len(str) )%></a>&nbsp;</nobr></td>
						<%
					End If
				Else
%>
						<td align="center"><nobr>&nbsp;&nbsp;</nobr></td>
						<%
				End If		
			Case "0531" 'status do processo
				str = objrs.Fields.Item(nm_campo_rel).Value
				if fnc_TestaVar(str) then str = "<a href=""#"" onClick=""abreStatus('"& nr_processo &"','"& nr_referencia &"','"& nr_item_clnte &"','"&cd_empresa&"');"">"&Trim(str)&"</a>" else str = ""
%>
						<td><nobr><%= str%></nobr></td>
						<%
			Case "0544" 'Drawback
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_drawback(CInt(str)) Else str = "n/a"
%>
						<td align="center"><nobr><%= str%></nobr></td>
						<%
			Case "0545" 'qtde inicial/unidade de medida
				Response.Redirect("teste.asp?var1="&fncQtdeInicial(0)&"")			
				Response.Write(fncQtdeInicial(0))
				
			Case "0066" 'tipo de frete
									Response.Write(fncExibeFrete(0, objrs.Fields.Item(nm_campo_rel).Value))	
			Case "0549" 'Nr. de Nota Fiscal
				'sleeciona a referencia de acordo com o tipo
				if objrsx.State = adStateOpen then objrsx.Close()
				sql = "SELECT NR_NOTA FROM TPROCESSO_NF ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				x   = Null				
				str = Null
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					x = Trim(objrsx.Fields.Item("NR_NOTA").Value)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(objrsx.Fields.Item("NR_NOTA").Value)
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & vbcrlf
					Loop
				End If
				
				If fnc_TestaVar(x) Then
%>
						<td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
				Else
%>
						<td align="center"><nobr>&nbsp;&nbsp;</nobr></td>
						<%
				End If
			objrsx.Close()	
			Case "0550" 'data nota fiscal
			  str = objrs.Fields.Item(nm_campo_rel).Value
%>
       <td align="center"><nobr>&nbsp;<%= fnc_Mascara( str, 5 )%>&nbsp;</nobr></td>
<%					
			Case "0551" 'Quantidade de Adições
				If objrsx.State = adStateOpen Then objrsx.Close()
				'sleeciona a referencia de acordo com o tipo
				sql = "SELECT QT_ADICOES FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str = Null
				'passa quantidade
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("QT_ADICOES").Value)
				Else
				  str = "&nbsp;" 
				End If
				
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
				<%
      	objrsx.Close()	
	 	    Case "0118"
			  Response.Write(fncExibeTabelaNf(0, objrsv.Fields.Item("M10_CD_DADO").Value, 0))				
			Case "0552" 'Quantidade de Itens da DI
				If objrsx.State = adStateOpen Then objrsx.Close()
				'soma os itens das adições
				sql = "SELECT SUM(QT_ITENS_ADICAO) AS QT_ITENS FROM TADICAO_DE_IMPORTACAO (NOLOCK) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
							" GROUP BY NR_PROCESSO "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str = Null
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					str = Trim(objrsx.Fields.Item("QT_ITENS").Value)
				Else
				  str = "&nbsp;" 
				End If
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
				<%
      	objrsx.Close()
			Case "0555" 'país de origem caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT NM_PAIS FROM TPAIS_BROKER (NOLOCK) "&_
					      " WHERE CD_PAIS = (SELECT TOP 1 (CASE ISNULL(CD_PAIS_ORIG_MERC, '') "&_
                "                                 WHEN '' THEN CD_PAIS_AQUIS_MERC "&_
                "                                 ELSE CD_PAIS_ORIG_MERC "&_
                "                               END) "&_ 
 	 						  "                    FROM TADICAO_DE_IMPORTACAO ( NOLOCK ) "&_
 							  "                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
  				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
  					str = Trim(objrsx.Fields.Item("NM_PAIS").Value)
				  Else
	  			  str = "&nbsp;"
					End If
					objrsx.Close()
				End If
%>
         <td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%
			Case "0556" 'país de aquisição, caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
					      " WHERE CODIGO = (SELECT TOP 1 CD_PAIS_AQUISICAO "&_
 	 						  "                    FROM TDETALHE_MERCADORIA ( NOLOCK ) "&_
 							  "                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
  				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  			str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
				  Else
			  	  str = "&nbsp;"
					End If
					objrsx.Close()
				End If%>

					<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
					
			<%Case "0650" 'RETIFICAÇÕES
  				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
					  " FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
					  " WHERE TP.NR_PROCESSO= '"& nr_processo &"'"

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					'Response.write sql
					'Response.end
					
					str = ""
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str &Trim(objrsx.Fields.Item("NM_RETIFICACOES").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
'					If objrsx.RecordCount > 0 Then
'		  				str = Trim(objrsx.Fields.Item("NR_CNTR").Value)
'					 Else
'					   str = "&nbsp;"
'					End If
					objrsx.Close()%>

					<td><nobr><%=str%>&nbsp;</nobr></td>
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
              <%Case "0046" 'NR CONTAINER
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT NR_CNTR AS NR_CNTR, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
							"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
							"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					'agrupa todas as referencias na string para aparecerem como hint
					
					'Response.write sql
					'Response.end
					str = ""
					If objrsx.RecordCount > 0 Then
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str &"<br>"
						Loop
					End If
'					If objrsx.RecordCount > 0 Then
'		  				str = Trim(objrsx.Fields.Item("NR_CNTR").Value)
'					 Else
'					   str = "&nbsp;"
'					End If
					objrsx.Close()%>

					<td><nobr><%=str%>&nbsp;</nobr></td>
             <%Case "0821" 
             If objrsx.State = adStateOpen Then objrsx.Close()
				    str = ""
					sql = "SELECT CONVERT(VARCHAR,MAX(DT_DESOVA),103) AS data FROM tprocesso_cntr "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' " & _
                            " AND DT_DESOVA IS NOT NULL"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					if objrsx.RecordCount > 0 then
					  str = objrsx.Fields.Item("data").Value
					End If
					objrsx.Close()%>

					<td><nobr><%=str%>&nbsp;</nobr></td>    
             <%Case "0050" 'free time
  				If objrsx.State = adStateOpen Then objrsx.Close()
				    str = ""
					sql = "SELECT TOP 1 ISNULL(NR_FREE_TIME,'') AS NR_FREE_TIME FROM tprocesso_cntr "&_
							"WHERE NR_PROCESSO= '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					if objrsx.RecordCount > 0 then
					  str = objrsx.Fields.Item("NR_FREE_TIME").Value
					End If
					objrsx.Close()%>

					<td><nobr><%=str%>&nbsp;</nobr></td>        
                    
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
			<%Case "0075" 'ENTRADA DE CONTAINER NO ARMAZÉM
  				If objrsx.State = adStateOpen Then objrsx.Close()
					sql = " SELECT CONVERT(VARCHAR,LI.DT_DEFERIMENTO,103) AS DATA " &_
					  " FROM TPROCESSO_LI LI ( NOLOCK ) " &_
					  " INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = LI.NR_PROCESSO " &_
					  " WHERE LI.NR_PROCESSO = '"& nr_processo &"' "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If objrsx.RecordCount > 0 Then
		  				str = Trim(objrsx.Fields.Item("DATA").Value)
					Else
						str = "&nbsp;"
					End If
					objrsx.Close()%>

					<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>                    
			<%Case "0581" 'Taxa MLE da adição da DI
			  Response.Write(fncExibeTxMle(0))   
			  
			 Case "0611" 'Data da Invoice
			  If objrsx.state = adstateOpen then objrsx.close()	
				  sql="select DT_FATURA from tdocumento_instrucao where nr_processo ='"&nr_processo&"'"
				  
				  If Request.Cookies("datas")("flag") = "1" then
					  dt_inicial = Request.Cookies("datas")("dt_inicial")
					  dt_final = Request.Cookies("datas")("dt_final")  
				  
				  sql = sql & " AND DT_FATURA BETWEEN CONVERT(DATETIME, '" & dt_inicial & "', 103)"&_ 
                              " AND CONVERT(DATETIME, '" & dt_final & "', 103)"
				  End if
				  
				  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext	
								  
				  If objrsx.eof then
				  	 str="-"
				  else
				      str= objrsx.fields.item("DT_FATURA").value
				  End If
				  objrsx.Close()
				  %>		  
					<td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>		

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
                        
			<%Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_AP_CAMPO").Value&"")
						'Response.write objrs.Fields.Item(nm_campo_rel).value
						'Response.end
						Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
					Case "1" 'exibe os campos de datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
							Response.Write(fncExibeDataEventoFup(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						'Response.Redirect("teste.asp?var1="&objrs.Fields.Item("PVT_"& nm_campo_rel).Value&"")
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
if(typeof tableScroll == 'function')
{
	tableScroll('TabelaPrincipal');
}
</script> 

<!--#include virtual="/includes/inc_ends.asp"-->
