<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Analise de Custo Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 06/09/2005
'
'Manutenção: 18/09/2008 - Flávio Henrique
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s 'monta o select da query com os campos a serem exibidos
Dim sql_f 'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w 'monta o where da query
Dim sql_o 'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim col_0 'qtde de colunas com informações básicas
Dim col_1 'qtde de colunas com valores de despesas
Dim col_2 'qtde de colunas com valores da DI
Dim col_3 'qtde de colunas com valores totais
Dim vl_linha 'valor total da referencia/item no processo

in_comodo = "1"
in_show  = False
cd_tela  = "IMP016"
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
Session("sql_imp_custo") = Null
If Not fnc_TestaVar(Session("sql_imp_custo")) Then
	'seleciona a qtde de colunas por tipo de campo do relatório
	sql = "SELECT M12_TP_GRUPO, ISNULL( COUNT( M12_TP_GRUPO ), 0 ) AS QT_GRUPO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ), M12_CAMPO ( NOLOCK ) "&_
				"WHERE M14_CD_VIEW    = '"& cd_view &"' "&_
				"  AND M12_CD_CAMPO   = M14_CD_CAMPO "&_
				"  AND M12_TP_EXIBIR >= '"& Session("tp_exibir") &"' "&_
				"  AND M12_IN_ATIVO   = 1 "&_
				"GROUP BY M12_TP_GRUPO"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	

	'procura pela qtde de campos Dados Básicos
	If objrsx.Eof Then objrsx.MoveFirst
	Do While Not objrsx.Eof
		If objrsx.Fields.Item("M12_TP_GRUPO").Value = "0" Then
			If Not objrsx.Eof Then col_0 = objrsx.Fields.Item("QT_GRUPO").Value Else col_0 = 0
		End If
		'procura pela qtde de campos Valores das Despesas
		If objrsx.Fields.Item("M12_TP_GRUPO").Value = "1" Then
			If Not objrsx.Eof Then col_1 = objrsx.Fields.Item("QT_GRUPO").Value Else col_1 = 0
		End If
		'procura pela qtde de campos Valores da DI
		If objrsx.Fields.Item("M12_TP_GRUPO").Value = "2" Then
			If Not objrsx.Eof Then col_2 = objrsx.Fields.Item("QT_GRUPO").Value Else col_2 = 0
		End If
		'procura pela qtde de campos Valores Totais
		If objrsx.Fields.Item("M12_TP_GRUPO").Value = "3" Then
			If Not objrsx.Eof Then col_3 = objrsx.Fields.Item("QT_GRUPO").Value Else col_3 = 0
		End If
		'fecha o conjunto de resultados
		objrsx.MoveNext
	    If objrsx.Eof Then Exit Do 
	Loop	
	objrsx.Close
			
	'dados básicos do relatório
	Select Case tp_relat
	  Case "0"
    	sql_s = "SELECT DISTINCT "&_
					"  (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO AND TP_REFERENCIA = '01') AS NR_REFERENCIA, "&_
					"  (SELECT TOP 1 NR_ITEM_PO    FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = R.NR_PROCESSO AND TP_REFERENCIA = '01') AS NR_ITEM_CLIENTE, "
	          
	  Case "1"
	    sql_s = "SELECT DISTINCT "&_
					"  R.NR_REFERENCIA, R.NR_REFERENCIA_COMP, R.NR_ITEM_CLIENTE, "
					
	End Select				
    sql_s = sql_s & "  R.NR_PROCESSO,  R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, R.CD_INCOTERM, "
	'inicia a montagem dos campos que serão selecionados
	nr_data = 0 'numero de eventos selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &_
						" "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","21","31","41"'String - Lookup
					sql_s = sql_s &_
						" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
						"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
						"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
						" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "35" 'INNER JOIN
				  if tp_relat  = 1 Then
				  sql_s = sql_s &_
					     		"(SELECT TOP 1 F"& objrsv.Fields.Item("M10_CD_BROKER").Value & "."& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value & " F" & objrsv.Fields.Item("M10_CD_BROKER").Value & _ 
								"  WHERE F" & objrsv.Fields.Item("M10_CD_BROKER").Value & ".CD_ITEM ='"  & objrsv.Fields.Item("M10_CD_BROKER").Value & "' AND "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "		
					Else			
					 sql_s = sql_s &_
					     		"(SELECT TOP 1 SUM(F"& objrsv.Fields.Item("M10_CD_BROKER").Value & "."& objrsv.Fields.Item("M10_NM_DESCRICAO").Value & ") " &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value & " F" & objrsv.Fields.Item("M10_CD_BROKER").Value & _ 
								"  WHERE F" & objrsv.Fields.Item("M10_CD_BROKER").Value & ".CD_ITEM ='"  & objrsv.Fields.Item("M10_CD_BROKER").Value & "' AND F"& objrsv.Fields.Item("M10_CD_BROKER").Value &".NR_PROCESSO = R.NR_PROCESSO" &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "					
					 End If
			   Case "36" 'INNER JOIN
				  if tp_relat  = 1 Then
				  sql_s = sql_s &_
					    "(SELECT TOP 1 (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '001' AND CD_REFERENCIA = FC.CD_REFERENCIA) + "&_
                        " (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '029' AND CD_REFERENCIA = FC.CD_REFERENCIA) + "&_
                        " (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '421' AND CD_REFERENCIA = FC.CD_REFERENCIA) "&_
                        " FROM TFAT_CALCULO_RATEIO_DESP FC WHERE FC.CD_REFERENCIA = R.NR_REFERENCIA_COMP" &_
						") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "		
					Else			
					  sql_s = sql_s &_
					    "(SELECT TOP 1 (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '001' AND NR_PROCESSO = FC.NR_PROCESSO) + "&_
                        " (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '029' AND NR_PROCESSO = FC.NR_PROCESSO) + "&_
                        " (SELECT ISNULL(SUM(VL_ITEM_AREA),0) FROM TFAT_CALCULO_RATEIO_DESP (NOLOCK) WHERE CD_ITEM = '421' AND NR_PROCESSO = FC.NR_PROCESSO) "&_
                        " FROM TFAT_CALCULO_RATEIO_DESP FC WHERE FC.NR_PROCESSO = R.NR_PROCESSO" &_
						") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "					
					 End If 			
				Case "10"'Data
					If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
						'datas de follow-up de desembaraço
						nr_data = nr_data + 1
						sql_s = sql_s &_
										" FI.RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
										" FI.PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
										" FI.IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Else	
						'Outras datas vindas de outras tabelas
						sql_s = sql_s &_
										" "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End If
				Case "20","30"'Decimal, Moeda
					If objrsv.Fields.Item("M12_TP_GRUPO").Value = "2" or objrsv.Fields.Item("M10_CD_DADO").Value = "0181"Then
					   if tp_relat  = 1 Then
						 sql_s = sql_s &_
					     		"(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value & _ 
								"  WHERE NR_PROC_PO = R.NR_REFERENCIA AND NR_ITEM_PO = R.NR_ITEM_CLIENTE AND DM.NR_PARCIAL = R.NR_PARCIAL AND NR_PROCESSO = R.NR_PROCESSO AND CD_EMPRESA = R.CD_EMPRESA"&_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "		
						Else
						  sql_s = sql_s &_
					     		"(SELECT TOP 1 SUM("& objrsv.Fields.Item("M10_NM_DESCRICAO").Value & ") " &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value & _ 
								"  WHERE NR_PROCESSO = R.NR_PROCESSO"&_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "		
						End If				
					Else
					sql_s = sql_s &_
						" ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End If	
				Case "40"'Inteiro
					sql_s = sql_s &_
						" ISNULL( "& objrsv.Fields.Item("M12_NM_TB_ORIGEM").Value &"."& objrsv.Fields.Item("M10_AP_CAMPO").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else
			'o campo valor e comissão constam aqui, porém não entram no select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	
	'tabelas de busca -chave primária passou a ser "NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL"
	sql_f = "FROM TREL_IMP_CUSTO R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO           PR ( NOLOCK ) ON ( PR.NR_PROCESSO   = R.NR_PROCESSO ) "&_
					"  INNER JOIN TFLP_IMPORT1 FI ( NOLOCK ) ON ( FI.NR_REFERENCIA = R.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = R.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = R.NR_PARCIAL AND FI.NR_PROCESSO_DES = R.NR_PROCESSO AND FI.CD_EMPRESA = R.CD_EMPRESA)  "	&_								
					"  LEFT JOIN TDETALHE_MERCADORIA DM ( NOLOCK ) ON ( DM.NR_PROC_PO = R.NR_REFERENCIA AND DM.NR_ITEM_PO = R.NR_ITEM_CLIENTE AND DM.NR_PARCIAL = R.NR_PARCIAL AND DM.NR_PROCESSO = R.NR_PROCESSO AND DM.CD_EMPRESA = R.CD_EMPRESA) "&_
					"  LEFT JOIN TADICAO_DE_IMPORTACAO AI ( NOLOCK ) ON ( AI.NR_PROCESSO    = R.NR_PROCESSO AND AI.NR_ADICAO      = DM.NR_ADICAO) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO ='"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   = "& nr_ident &" "
    'response.Write(sql_s & sql_f & sql_w )					
		'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w &"")
					
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
	    sql_o = sql_o &" R.NR_PROCESSO ASC, R.NR_REFERENCIA ASC, R.NR_ITEM_CLIENTE ASC "
	End If
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w & sql_o
	Session("sql_imp_custo") = sql
    'Response.write sql
	'response.end
Else
	col_0 = Request.QueryString("col_0")
	col_1 = Request.QueryString("col_1")
	col_2 = Request.QueryString("col_2")
	col_3 = Request.QueryString("col_3")
	If Not fnc_TestaVar(col_0) Then col_0 = 0
	If Not fnc_TestaVar(col_1) Then col_1 = 0
	If Not fnc_TestaVar(col_2) Then col_2 = 0
	If Not fnc_TestaVar(col_3) Then col_3 = 0

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
'***********************Response.Redirect("teste.asp?var1="&sql_s&"")
'Response.Redirect("teste.asp?var1="&sql&"")
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_custo") &"<br>"
'response.Write(Session("sql_imp_custo"))
'Response.end
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_imp_custo")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'pagina-1 Request("referencia")= ""
'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("referencia") <> "" Then
	'busca o registro
  str = "NR_REFERENCIA = '"& Request("referencia") &"'"
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
	 pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
	 tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
'Response.Redirect("teste.asp?var1="&Request("referencia")&"")
  nr_referencia = ""
  objrs.AbsolutePage = CInt(pagina)
End If
col = (objrsv.RecordCount - nr_data) + (nr_data * 3)
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col &_
			"&col_0="& col_0 &_
			"&col_1="& col_1 &_
			"&col_2="& col_2 &_
			"&col_3="& col_3

tx_path_file  = "/import/custo_print"
tx_path_excel = "/excel/imp_custo"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "custo_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
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
<Table id="TabelaPrincipal" border="0" cellspacing="1" cellpadding="0" valign="middle" style="padding: 0px 1px 0px 1px;" width="100%">
					<tr>
						<%
If col_0 > 0 Then
%>
						<th height="20" colspan="<%= col_0%>" class="gridtop" style="background-color:<%=cabec_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dados Básicos</td>
						<%
End If

If col_1 > 0 Then
%>
						<th height="20" colspan="<%= col_1%>" class="gridtop" style="background-color:<%=cabec_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Despesas</td>
						<%
End If

If col_2 > 0 Then
%>
						<th height="20" colspan="<%= col_2%>" class="gridtop" style="background-color:<%=cabec_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valores da D.I.</td>
						<%
End If

If col_3 > 0 Then
%>
						<th height="20" colspan="<%= col_3%>" class="gridtop" style="background-color:<%=cabec_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Totais</td>
						<%
End If
%>
					</tr>
					<tr class="gridtit">
						<%
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
%>
						<th<% If in_dt_prev Then Response.Write(" colspan='3'")%> height="15" style="background-color:<%=cabec_result%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<%
	Else
%>
						<th<% If in_dt_prev Then Response.Write(" rowspan='2'")%> style="background-color:<%=cabec_result%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<%
	End If
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
					</tr>
					<%
If in_dt_prev Then
%>
					<tr height="15" class="gridsub" style="background-color:<%=cabec_result%>;">
						<%
	For x = 1 to nr_data
%>
						<th>Prevista</td>
						<th>Dias</td>
						<th>Realizada</td>
						<%
	Next
%>
					</tr>
					<%
End If

nrec = 0
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
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
	vl_linha = 0
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
						<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do processo
	nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	nr_referencia = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)
	nr_item_clnte = Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value)
	
	Do While Not objrsv.Eof
		nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)

		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="right"><nobr>&nbsp;<a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%= Mid(nr_processo, 5, Len(nr_processo))%></a>&nbsp;</nobr></td>
						<%
			Case "0010" 'país de Procedência caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if not fnc_TestaVar(str) then
  				If objrsx.State = adStateOpen Then objrsx.Close()
			    	'seleciona a referencia de acordo com o tipo
		  		sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
					      " WHERE CODIGO = (SELECT CD_PAIS_PROC_CARGA "&_
 	 						  "                    FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
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

			Case "0015" 'Tipo de contâiner
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = tipo_cntr(CInt(str)-1)
%>
						<td align="center"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
			Case "0017" 'canal de liberacao
				str = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(str) Then str = 4
%>
						<td align="center"><img src="/imagens/30/tp_canal_<%= Trim(str)%>.gif" width="17" height="16"></td>
						<%
			Case "0018" 'nr. da referencia
%>
						<td align="right"><nobr>&nbsp;<a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%= nr_referencia%></a>&nbsp;</nobr></td>
						<%
			Case "0019" 'nr. item da referencia
%>
						<td align="right"><nobr>&nbsp;<a href="/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&nr_referencia=<%= nr_referencia%>&nr_item_clnte=<%= nr_item_clnte%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%= nr_item_clnte%></a>&nbsp;</nobr></td>
						<%
			Case "0045" 'Exibe o nr. da viagem com mascara
%>
						<td align="right"><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 4)%>&nbsp;</nobr></td>
						<%
			Case "0084" 'Mercadoria
				'verifica se já existe as mercadorias cadastradas no processo de exportação
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT ISNULL(M.NM_MERCADORIA, DM.TX_DESC_DET_MERC) AS TX_MERCADORIA, "&_
							"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
							"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
							"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
							"  AND DM.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND DM.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND DM.NR_ITEM_PO  = '"& nr_item_clnte &"' "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL(M.NM_MERCADORIA, I.TX_MERCADORIA) AS TX_MERCADORIA, "&_
								"  ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
								"FROM TPO_ITEM I ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
								"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
								"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")

					If objrsx.RecordCount < 1 Then
						objrsx.Close
						sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
									"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
									"FROM TPROCESSO ( NOLOCK ) "&_
									"WHERE NR_PROCESSO = '"& nr_processo &"' "
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
				
				str = ""
				If objrsx.RecordCount > 0 Then
					'descrição que será exibida
					x = Left(Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value,"""","'")), 40)
					If objrsx.RecordCount > 1 Then x = x &"..."
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value, """", "'"))
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
					Loop
				Else
					str = "Descrição não Disponível."
				End If
%>
						<td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
				objrsx.Close
			Case "0283" 'Exibe o nr. da DI com mascara
%>
						<td align="right"><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 1)%>&nbsp;</nobr></td>
						<%
			Case "0408" 'valor total da linha
%>
						<td align="right"><nobr><%= FormatNumber(vl_linha, 2)%>&nbsp;</nobr></td>
						<%			
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

			Case "0458" 'quantidade do pedido/unidade de medida
				sql = "SELECT NM_UNID_MEDIDA "&_
							"FROM TDETALHE_MERCADORIA M (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
							"WHERE M.NR_PROCESSO = '"& nr_processo   &"' "&_
							"  AND M.NR_PROC_PO  = '"& nr_referencia &"' "&_
							"  AND M.NR_ITEM_PO  = '"& nr_item_clnte &"' "&_
							"  AND M.CD_UN_MED_COMERC = U.CD_UNID_MEDIDA "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close()
					sql = "SELECT NM_UNID_MEDIDA "&_
								"FROM TPO_ITEM I (NOLOCK), TUNID_MEDIDA_BROKER U (NOLOCK) "&_
								"WHERE I.NR_PROCESSO     = '"& nr_referencia &"' "&_
								"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"' "&_
								"  AND I.CD_UNID_MEDIDA  = U.CD_UNID_MEDIDA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount < 1 Then
						objrsx.Close()
						sql = "SELECT '0' AS QT_INICIAL, '' AS NM_UNID_MEDIDA"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					End If
				End If
%>
						<td align="right"><nobr>&nbsp;<%= objrsx.Fields.Item(nm_campo_rel).Value%>&nbsp;</nobr></td>
						<%
			objrsx.Close()
			Case "0610" ' Ordem ( Manutenção do processo ) 14/04/2008
				  sql="SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE WHERE TP_REFERENCIA = '02' AND NR_PROCESSO = '"& nr_processo &"'"
				  objrsx.Open sql, objcnn, adOpenStatic, adLockReadonly, adCmdText
				 'response.Redirect("teste.asp?var1="&SQL&"")
				   If objrsx.eof then
					  str="-"
					Else
					  str=objrsx.fields.item(nm_campo_rel).value					
					End If
				  'response.Redirect("teste.asp?var1="&objrsx.fields.item("CD_REFERENCIA").value&"")%>
				  <td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "0608" ' Condição de pagamento 14/04/2008
			sql="select CD_MODALIDADE_PAGTO,TP.DESCRICAO AS DESCRICAO from tdeclaracao_importacao TI INNER JOIN TMODALID_PAGAMENTO TP (NOLOCK) ON  TI.CD_MODALIDADE_PAGTO = TP.CODIGO"
			objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DESCRICAO").value					
			End If
			'response.Redirect("teste.asp?var1="&nm_campo_rel&"")%>
			<td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "0611"
			     sql="select DT_FATURA from  tdocumento_instrucao where CD_TIPO_DCTO_INSTR = '01' and NR_PROCESSO =  '"& nr_processo &"'"
			 	 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			If objrsx.eof then
				str="-"
			Else
				str=objrsx.fields.item("DT_FATURA").value					
			End If%>
			<td align="right"><nobr>&nbsp;<%=str%>&nbsp;</nobr></td>				
<%			objrsx.Close()

			Case "4442" 'taxa SISCOMEX
			     sql="select VL_TX_SCX_ITEM, VL_TAXA_SISCOMEX from TFATURAMENTO_RATEIO where NR_PROCESSO =  '"& nr_processo &"' and NR_REFERENCIA=  '"& nr_referencia &"' and NR_ITEM_CLIENTE=  '"& nr_item_clnte&"'"
			 	 objrsx.open sql,objcnn,adOpenStatic,adLockReadonly,adCmdText
			'response.Redirect("teste.asp?var1="&objrsx.fields.item("VL_TAXA_SISCOMEX").value&"")
			If objrsx.eof then
				str="-"
			Else
			    If objrsx.fields.item("VL_TAXA_SISCOMEX").value=0 or isnull(objrsx.fields.item("VL_TAXA_SISCOMEX").value) then
					str=objrsx.fields.item("VL_TX_SCX_ITEM").value		
			    Else
					str=objrsx.fields.item("VL_TAXA_SISCOMEX").value		
			    End If
			End If%>
			<td align="right"><nobr>&nbsp;<%=FormatNumber(str,2)%>&nbsp;</nobr></td>				
<%			objrsx.Close()
			'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						x = Null
						y = Null
						z = Null
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
						y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
						
						If in_dt_prev Then
							If (Not fnc_TestaVar(w)) or (w = 0) Then
								x = "-" 'data prevista
								y = "Não Aplicável" 'data realizada
								z = "-" 'diferença de dias
								color = "#999999"   'cor da fonte
							Else
								'se a data prevista existir
								If IsDate(x) Then
									'se a data realizada existir
									If IsDate(y) Then
										z = fnc_DiasUteisKPI(x, y, 0)
									Else
										z = fnc_DiasUteisKPI(x, Date(), 0)
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
%>
						<td align="center"><nobr>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</nobr></td>
						<td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
						<%
						End If
%>
						<td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara( y, 5 )%></font>&nbsp;</nobr></td>
						<%
					Case "2" 'exibe os campos com valor decimal
					     'x=0
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						'soma do processo varia de acordo com o Incoterm
						'Response.Redirect("teste.asp?var1="&sql&"")					
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then
							x = FormatNumber( x, 2 )
							Select Case objrs.Fields.Item("CD_INCOTERM").Value
								Case "CIF"
									If InStr(tx_soma_custo, objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
										vl_linha = vl_linha + x
									End If
								Case "CFR"
									If InStr(tx_soma_custo &"0418;", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
										vl_linha = vl_linha + x
									End If
								Case Else
									If InStr(tx_soma_custo &"0370;0418;", objrsv.Fields.Item("M10_CD_DADO").Value) > 0 Then
										vl_linha = vl_linha + x
									End If
							End Select
						Else
						    x = FormatNumber( 0, 2 )	
						End If
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "4" 'exibe os campos com valor inteiro
						If objrsv.Fields.Item("M10_TP_CONSULTA").Value = "3" Then
							matriz = Split(objrsv.Fields.Item("M10_AP_CAMPO").Value, ";")
							x = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(0), "M10_AP_CAMPO" )
							y = fnc_ConsultaLookup("M10_DADOS", "M10_CD_DADO", matriz(1), "M10_AP_CAMPO" )
							z = fnc_DiasUteisKPI(objrs.Fields.Item("PVT_"& x).Value, objrs.Fields.Item("RLZ_"& y).Value, 0)
						Else
							z = objrs.Fields.Item(nm_campo_rel).Value
						End If
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(z) < 10
							z = "#"& z
						Loop
						z = Replace(z, "#", "&nbsp;")
%>
						<td align="right"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
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
					<tr class="gridtit" style="background-color:<%=cabec_result%>;">
						<td height="15" colspan="<%= col%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
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
