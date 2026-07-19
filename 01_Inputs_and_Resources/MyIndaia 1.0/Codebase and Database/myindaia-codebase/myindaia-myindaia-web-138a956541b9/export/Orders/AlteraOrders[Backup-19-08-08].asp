<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>


<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Sistema Orders Nestlé
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 25/07/2008
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->


<%
if request("TX_PO_CUSTOMER")="" then
		    Response.Redirect("Listagem.asp?mensagem=Digite um número de Order!&TpExibir=1")
End if

Dim TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,dt_order_issue,TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY
Dim DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL,CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE
Dim CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION,TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,NR_DEPARTURE_WEEK
Dim IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO,TX_INVOICE
Dim CheckCustomer,TpExibir,NM_VIA_TRANSPORTE
Dim pagina,campo,vTpAcao 'pagina inicial da ordenação
Dim LOADING_PLACE,PRODUCTION_PLANT
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
'verifica se a pagina é zero, se for seta para 1
TX_PO_CUSTOMER= Request("TX_PO_CUSTOMER")
NR_1ST_WEEK= Request("NR_1ST_WEEK")
NR_REVISED_WEEK= Request("NR_REVISED_WEEK")
TX_ORDER_NUMBER= Request("TX_ORDER_NUMBER")
dt_order_issue= Request("dt_order_issue")
TX_PROFORM_INVOICE= Request("TX_PROFORM_INVOICE")
TX_INVOICE= Request("TX_INVOICE")
TX_DELIVERY_NUMBER= Request("TX_DELIVERY_NUMBER")
DT_RQT_DELIVERY= Request("DT_RQT_DELIVERY")
DT_DELIVERY_ISSUE= Request("DT_DELIVERY_ISSUE")
NR_VALORES= Request("NR_VALORES")
IN_ORDER_CONSOLIDATED= Request("IN_ORDER_CONSOLIDATED")
CD_MODAL= Request("CD_MODAL")
CD_PRODUCTION_PLANT= Request("CD_PRODUCTION_PLANT")
CD_LOADING_PLACE= Request("CD_LOADING_PLACE")
CD_CUSTOMER_PLANT= Request("CD_CUSTOMER_PLANT")
CD_CUSTOMER= Request("CD_CUSTOMER")
CD_CONSIGNEE= Request("CD_CONSIGNEE")
CD_COUNTRY= Request("CD_COUNTRY")
TX_REGION= Request("TX_REGION")
CD_PORT_OF_DESTINATION= Request("CD_PORT_OF_DESTINATION")
TX_MONTH_YEAR= Request("TX_MONTH_YEAR")
DT_LOADING= Request("DT_LOADING")
CD_VESSEL= Request("CD_VESSEL")
CD_EQUIP_TYPE= Request("CD_EQUIP_TYPE")
DT_ETD= Request("DT_ETD")
DT_DEPARTURE_DATE= Request("DT_DEPARTURE_DATE")
NR_DEPARTURE_WEEK= Request("NR_DEPARTURE_WEEK")
IN_LOADED= Request("IN_LOADED")
DT_DEADLINE= Request("DT_DEADLINE")
DT_ETA= Request("DT_ETA")
TX_MEMO= Request("TX_MEMO")


' Rotina Alterar
'Abre a tabela, verifica se o registro já existe e seta as variáveis .
'vTpacao="Alterar" = submit do formulário, faz update // 'vTpacao="Exibir" = entrada na página, apenas exibe as informações sem update
If  request("vTpacao")="Alterar" or request("vTpacao")="Exibir" or request("vTpacao")="Incluir" or  request("vTpacao")="Gravar" then
	sql= "SELECT TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,dt_order_issue,TX_PROFORM_INVOICE,TX_INVOICE,TX_DELIVERY_NUMBER, "&_
		 " DT_RQT_DELIVERY,DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL, "&_
		 " CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE,CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION, "&_
		 " TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,NR_DEPARTURE_WEEK,IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO "&_
		 " FROM TPEDIDO_VENDA_NESTLE WHERE TX_PO_CUSTOMER ='"&request("TX_PO_CUSTOMER")&"'"
		 objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		 'Response.Redirect("../../import/teste.asp?var1="&sql&"")

	If not objrs.eof then 'Registro encontrado
		'CheckCustomer=0 ' 
		If  request("vTpacao")="Incluir" then
		    Response.Redirect("Listagem.asp?mensagem=Order já cadastrada!&TpExibir=1")
		End if
		If  request("vTpacao")="Exibir" or request("vTpacao")="Alterar"   then 'Se o registro existir seta as variáveis com o conteúdo do banco de dados
			TX_PO_CUSTOMER= objrs("TX_PO_CUSTOMER")
			NR_1ST_WEEK= objrs("NR_1ST_WEEK")
			NR_REVISED_WEEK= objrs("NR_REVISED_WEEK")
			TX_ORDER_NUMBER= objrs("TX_ORDER_NUMBER")
			dt_order_issue= objrs("dt_order_issue")
			TX_PROFORM_INVOICE= objrs("TX_PROFORM_INVOICE")
			TX_INVOICE= objrs("TX_INVOICE")
			TX_DELIVERY_NUMBER= objrs("TX_DELIVERY_NUMBER")
			DT_RQT_DELIVERY= objrs("DT_RQT_DELIVERY")
			DT_DELIVERY_ISSUE= objrs("DT_DELIVERY_ISSUE")
			NR_VALORES= objrs("NR_VALORES")
			IN_ORDER_CONSOLIDATED= objrs("IN_ORDER_CONSOLIDATED")
			CD_MODAL= objrs("CD_MODAL")
			CD_PRODUCTION_PLANT= objrs("CD_PRODUCTION_PLANT")
			CD_LOADING_PLACE= objrs("CD_LOADING_PLACE")
			CD_CUSTOMER_PLANT= objrs("CD_CUSTOMER_PLANT")
			CD_CUSTOMER= objrs("CD_CUSTOMER")
			CD_CONSIGNEE= objrs("CD_CONSIGNEE")
			CD_COUNTRY= objrs("CD_COUNTRY")
			TX_REGION= objrs("TX_REGION")
			CD_PORT_OF_DESTINATION= objrs("CD_PORT_OF_DESTINATION")
			TX_MONTH_YEAR= objrs("TX_MONTH_YEAR")
			DT_LOADING= objrs("DT_LOADING")
			CD_VESSEL= objrs("CD_VESSEL")
			CD_EQUIP_TYPE= objrs("CD_EQUIP_TYPE")
			DT_ETD= objrs("DT_ETD")
			DT_DEPARTURE_DATE= objrs("DT_DEPARTURE_DATE")
			NR_DEPARTURE_WEEK= objrs("NR_DEPARTURE_WEEK")
			IN_LOADED= objrs("IN_LOADED")
			DT_DEADLINE= objrs("DT_DEADLINE")
			DT_ETA= objrs("DT_ETA")
			TX_MEMO= objrs("TX_MEMO")
		End if
	Else ' registro não existe, seta as variáveis para inclusão na tabela
		If  request("vTpacao")="Alterar" then ' Se for alteração e o registro não existe retorna a lista exibindo mensagem
		    Response.Redirect("Listagem.asp?mensagem=Order not found!&TpExibir=1")
		End if
		'Response.Redirect("../../import/teste.asp?var1="&request("vTpacao")&"")

		If  request("vTpacao")="Gravar" then
		sql = "INSERT INTO TPEDIDO_VENDA_NESTLE (TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE, "&_
			  " TX_PROFORM_INVOICE,TX_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY,DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL, "&_
			  " CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE,CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION, "&_
			  " TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO) "&_
			  " VALUES   ("&fncValSQL(TX_PO_CUSTOMER,0)&","&fncValSQL(NR_1ST_WEEK,3)&","&fncValSQL(NR_REVISED_WEEK,3)&","&fncValSQL(TX_ORDER_NUMBER,0)&","&fncValSQL(DT_ORDER_ISSUE,1)&", "&_
			  " "&fncValSQL(TX_PROFORM_INVOICE,0)&","&fncValSQL(TX_INVOICE,0)&","&fncValSQL(TX_DELIVERY_NUMBER,0)&","&fncValSQL(DT_RQT_DELIVERY,1)&","&fncValSQL(DT_DELIVERY_ISSUE,1)&","&fncValSQL(NR_VALORES,3)&", "&_
			  " "&fncValSQL(IN_ORDER_CONSOLIDATED,0)&","&fncValSQL(CD_MODAL,0)&","&fncValSQL(CD_PRODUCTION_PLANT,0)&","&fncValSQL(CD_LOADING_PLACE,0)&","&fncValSQL(CD_CUSTOMER_PLANT,0)&","&fncValSQL(CD_CUSTOMER,0)&", "&_
			  " "&fncValSQL(CD_CONSIGNEE,0)&","&fncValSQL(CD_COUNTRY,0)&","&fncValSQL(TX_REGION,0)&","&fncValSQL(CD_PORT_OF_DESTINATION,0)&","&fncValSQL(TX_MONTH_YEAR,0)&","&fncValSQL(DT_LOADING,1)&", "&_
			  " "&fncValSQL(CD_VESSEL,0)&","&fncValSQL(CD_EQUIP_TYPE,0)&","&fncValSQL(DT_ETD,1)&","&fncValSQL(DT_DEPARTURE_DATE,1)&","&fncValSQL(IN_LOADED,0)&","&fncValSQL(DT_DEADLINE,1)&","&fncValSQL(DT_ETA,1)&","&fncValSQL(TX_MEMO,0)&")"
			'Response.Redirect("../../import/teste.asp?var1="&sql&"")
			
'		sql = "INSERT INTO TPEDIDO_VENDA_NESTLE (TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE,TX_PROFORM_INVOICE, "&_
'		      "TX_DELIVERY_NUMBER,DT_RQT_DELIVERY,DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL) "&_
'			  " VALUES   ("&fncValSQL(TX_PO_CUSTOMER,0)&","&fncValSQL(NR_1ST_WEEK,3)&","&fncValSQL(NR_REVISED_WEEK,3)&","&fncValSQL(TX_ORDER_NUMBER,0)&","&fncValSQL(DT_ORDER_ISSUE,1)&","&fncValSQL(TX_PROFORM_INVOICE,0)&" , "&_
'			   ""&fncValSQL(TX_DELIVERY_NUMBER,0)&","&fncValSQL(DT_RQT_DELIVERY,1)&","&fncValSQL(DT_DELIVERY_ISSUE,1)&","&fncValSQL(NR_VALORES,3)&" ,"&fncValSQL(IN_ORDER_CONSOLIDATED,0)&","&fncValSQL(CD_MODAL,0)&" "&_
'			   " ,"&fncValSQL(CD_PRODUCTION_PLANT,0)&") "

			'Response.Redirect("../../import/teste.asp?var1="&sql&"")
			objcnn.Execute(sql)
			%><script>
				alert("Pedido Gravado!");
			</script><% 
			Response.Redirect("AlteraOrders.asp?vTpacao=Exibir&TX_PO_CUSTOMER="&Request("TX_PO_CUSTOMER")&" &mensagem=PO/Customer:"&Request("TX_PO_CUSTOMER")&" cadastrado com sucesso! Você já pode incluir ítens para este pedido!&TpExibir=1")
	   End if 

	
	end if
	'----------------------------------------------------------------------------------------------INCLUSÃO
End if 

'Alteração
If  request("vTpacao")="GravaAlteracao" then ' Se for alteração recupera os dados do formulário
	'atualiza dados na tabela
	sql = "UPDATE  TPEDIDO_VENDA_NESTLE SET  "&_
	"NR_1ST_WEEK="&fncValSQL(NR_1ST_WEEK,3)&",NR_REVISED_WEEK="&fncValSQL(NR_REVISED_WEEK,3)&",TX_ORDER_NUMBER="&fncValSQL(TX_ORDER_NUMBER,0)&",dt_order_issue="&fncValSQL(dt_order_issue,1)&", "&_
	"TX_PROFORM_INVOICE="&fncValSQL(TX_PROFORM_INVOICE,0)&", "&_
	"TX_INVOICE="&fncValSQL(TX_INVOICE,0)&", "&_
	"TX_DELIVERY_NUMBER="&fncValSQL(TX_DELIVERY_NUMBER,0)&", "&_
	"DT_RQT_DELIVERY="&fncValSQL(DT_RQT_DELIVERY,1)&", "&_
	"DT_DELIVERY_ISSUE="&fncValSQL(DT_DELIVERY_ISSUE,1)&", "&_
	"NR_VALORES="&fncValSQL(NR_VALORES,3)&", "&_
	"IN_ORDER_CONSOLIDATED="&fncValSQL(IN_ORDER_CONSOLIDATED,0)&", "&_
	"CD_MODAL="&fncValSQL(CD_MODAL,0)&", "&_
	"CD_PRODUCTION_PLANT="&fncValSQL(CD_PRODUCTION_PLANT,0)&", "&_
	"CD_LOADING_PLACE="&fncValSQL(CD_LOADING_PLACE,0)&", "&_
	"CD_CUSTOMER_PLANT="&fncValSQL(CD_CUSTOMER_PLANT,0)&", "&_
	"CD_CUSTOMER="&fncValSQL(CD_CUSTOMER,0)&", "&_
	"CD_CONSIGNEE="&fncValSQL(CD_CONSIGNEE,0)&", "&_
	"CD_COUNTRY="&fncValSQL(CD_COUNTRY,0)&", "&_
	"TX_REGION="&fncValSQL(TX_REGION,0)&", "&_
	"CD_PORT_OF_DESTINATION="&fncValSQL(CD_PORT_OF_DESTINATION,0)&", "&_
	"TX_MONTH_YEAR="&fncValSQL(TX_MONTH_YEAR,0)&", "&_
	"DT_LOADING="&fncValSQL(DT_LOADING,1)&", "&_
	"CD_VESSEL="&fncValSQL(CD_VESSEL,0)&", "&_
	"CD_EQUIP_TYPE="&fncValSQL(CD_EQUIP_TYPE,0)&", "&_
	"DT_ETD="&fncValSQL(DT_ETD,1)&", "&_
	"DT_DEPARTURE_DATE="&fncValSQL(DT_DEPARTURE_DATE,1)&", "&_
	"NR_DEPARTURE_WEEK="&fncValSQL(NR_DEPARTURE_WEEK,0)&", "&_
	"IN_LOADED="&fncValSQL(IN_LOADED,0)&", "&_
	"DT_DEADLINE="&fncValSQL(DT_DEADLINE,1)&", "&_
	"DT_ETA="&fncValSQL(DT_ETA,1)&", "&_
	"TX_MEMO="&fncValSQL(TX_MEMO,0)&" WHERE TX_PO_CUSTOMER="&fncValSQL(TX_PO_CUSTOMER,0)&""
	'Response.Redirect("../../import/teste.asp?var1="&sql&"")
	objcnn.Execute(sql)
	%><script>
		alert("Pedido alterado!");
	</script><% 
	Response.Redirect("AlteraOrders.asp?vTpacao=Alterar&TX_PO_CUSTOMER="&TX_PO_CUSTOMER&"")
End if	

  %><script>
			//document.location='Listagem.asp';
  </script><% 
  'Response.Redirect("Listagem.asp")

Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 999

Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim objfso      'objeto para o sistema de arquivos
Dim sql_s       'monta o select da query com os campos a serem exibidos
Dim sql_f       'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w       'monta o where da query
Dim sql_a
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_cliente  'código do cliente
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_li      'exibe imformações da li
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim tp_relat_rel'tipo do relatorio
Dim nr_di       'numero do registro da DI no SISCOMEX
Dim in_custo,NR_ITEM_PO, CheckReferencia,contador,NR_ITEM,CD_REFERENCIA

in_show = False
cd_tela = "DET003"
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "01"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("cd_referencia"))
'nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
nr_item_clnte = CStr(Request.QueryString("NR_ITEM_PO"))
tp_relat_rel  = Request.QueryString("tp_relat")
in_custo = False
'seleciona os dados da view
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link href="/includes/styles.css" rel="stylesheet" type="text/css">


<style type="text/css">
<!--

<!--
#apDiv1 {
	left: -320;
}
.style6 {font-size: large}
.c2 {	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
}
#apDiv2 {
	position:absolute;
	width:845px;
	height:115px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 76px;
	top: 1096px;
}
.ListaItens {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
	left: 76px;
}
.style7 {font-size: medium}
.style8 {color: #666666}
.edtDisabled {background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:270px;
}
body {
}

-->
</style>
</head>
<body onLoad="PreencheForm('<%= vTpAcao%>');">
<script language="javascript" src="/includes/script.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>

<td height="<%=Application("vl_width_header")%>" colspan="2">

<!--#include virtual="/includes/lay_header.asp" -->
<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!---#include virtual="/includes/lay_menuRap.asp" -->
<style type="text/css">
<!--
#apDiv1 {
	left: -320;
}

#apDiv3 {
	left: -320;}

#apDiv4 {
	left: -320;}
-->
</style>
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
</td><br>
<div id="dv_corpo" class="divMainMidOrders">
  <tr>
    <td colspan="8" valign="top"  width="100%" bgcolor="#FFFFFF"><div align="center" W>
      <h3>..::: PO/Orders Control:::..</h3>
    </div></td>
  </tr>
  
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" >&nbsp;</td>
  </tr>
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" >&nbsp;</td>
  </tr>
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" >&nbsp;</td>
  </tr>
  </td>
<form action="AlteraOrders.asp" method="get" name="OrderForm" id="OrderForm">
<table width="85%" border="1" align="center" cellpadding="0" cellspacing="3" bordercolor="#CCCCCC">
      <tr><!--Botao salvar para Inclusão e Alterar para edição-->
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp?CheckInclusao=1"><img src="../../imagens/icones/32x32/btn_novo.jpg" alt="Incluir Pedido" width="32" height="32" border="0"></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><%If request("vTpacao")="Incluir" then%>
          <input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Incluir" value="Submit();" tabindex="29"><input name="vTpacao" type="hidden" id="vTpacao" value="Gravar">
          <input name="TX_PO_CUSTOMER" type="hidden" id="TX_PO_CUSTOMER" value="<%=request("TX_PO_CUSTOMER")%>">
        <%else%>
        <input type="image" name="btnAlterar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Alterar" value="Submit();" tabindex="29"><input name="vTpacao" type="hidden" id="vTpacao" value="GravaAlteracao"><input name="TX_PO_CUSTOMER" type="hidden" id="TX_PO_CUSTOMER" value="<%=request("TX_PO_CUSTOMER")%>"><%End if%></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp"><img src="/imagens/icones/32x32/btn_cancelar.gif" alt="Cancelar Edi&ccedil;&atilde;o antes de salvar." name="btnCancelar" border="0" class="btnImagem"></a> </th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp?vTpAcao=deletar&vNrOrder=<%=request("TX_PO_CUSTOMER")%>"><img  src="/imagens/icones/32x32/btn_excluir.gif" alt="Excluir" border="0" class="btnImagem"></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="OrdersPrint.asp?TX_PO_CUSTOMER=<%=tx_po_customer%>" target="_blank"><img src="/imagens/icones/32x32/btn_print.gif" alt="Imprimir" name="btnPrintRap" border="0" class="btnImagem"></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp"><img src="../../imagens/icones/32x32/btn_listar.gif" alt="Atualizar lista de pedidos" width="32" height="32" border="0"></a></th>
        <th width="28%" bordercolor="#FFFFFF" scope="col"><%=request("mensagem")%>&nbsp;</th>
        <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="right"><span class="style6"><span class="style7"><%if vTpacao<>"Duplicar" then%>PO Customer<br> <span class="style8"><%=request("TX_PO_CUSTOMER")%><%end if%></span></span></span></div></th>
      </tr>
  </table>
    <br>
  <table width="85%" border="0" align="center" cellpadding="0" cellspacing="5" bordercolor="#CCCCCC" background="<%= fcn_TrocaFundo()%>" class="table">
  <td height="27"><table width="59%" border="0" cellpadding="0" cellspacing="0" bordercolor="0">
    <tr>
      <th height="18" scope="col"><div align="left">1ST_WEEK</div></th>
      <th scope="col"><div align="left">REVISED WEEK   </div></th>
    </tr>
    <tr>
      <th width="28%" height="22" align="left" valign="top" scope="col"><label>
        <select name="NR_1ST_WEEK" id="NR_1ST_WEEK" tabindex="1">
          <option value="<%=NR_1ST_WEEK%>"><%=NR_1ST_WEEK%></option>
          <option value="01">01</option>
          <option value="02">02</option>
          <option value="03">03</option>
          <option value="04">04</option>
          <option value="05">05</option>
          <option value="06">06</option>
          <option value="07">07</option>
          <option value="08">08</option>
          <option value="09">09</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
          <option value="32">32</option>
          <option value="33">33</option>
          <option value="34">34</option>
          <option value="35">35</option>
          <option value="36">36</option>
          <option value="37">37</option>
          <option value="38">38</option>
          <option value="39">39</option>
          <option value="40">40</option>
          <option value="41">41</option>
          <option value="42">42</option>
          <option value="43">43</option>
          <option value="44">44</option>
          <option value="45">45</option>
          <option value="46">46</option>
          <option value="47">47</option>
          <option value="48">48</option>
          <option value="49">49</option>
          <option value="50">50</option>
          <option value="51">51</option>
          <option value="52">52</option>
          <option value="53">53</option>
        </select>          </label>        </th>
      <th width="72%" align="left" valign="top" scope="col"><div align="left"><select name="NR_REVISED_WEEK" id="NR_REVISED_WEEK" tabindex="2">
                  <option value="<%=NR_REVISED_WEEK%>"><%=NR_REVISED_WEEK%></option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                  <option value="32">32</option>
                  <option value="33">33</option>
                  <option value="34">34</option>
                  <option value="35">35</option>
                  <option value="36">36</option>
                  <option value="37">37</option>
                  <option value="38">38</option>
                  <option value="39">39</option>
                  <option value="40">40</option>
                  <option value="41">41</option>
                  <option value="42">42</option>
                  <option value="43">43</option>
                  <option value="44">44</option>
                  <option value="45">45</option>
                  <option value="46">46</option>
                  <option value="47">47</option>
                  <option value="48">48</option>
                  <option value="49">49</option>
                  <option value="50">50</option>
                  <option value="51">51</option>
                  <option value="52">52</option>
                  <option value="53">53</option>
          </select>
          </div>
      </label></th>
    </tr>
  </table>
  
    <tr>
      <td bordercolor="#CCCCCC"><table width="84%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="20%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Order Number</div></th>
            <th width="19%" bordercolor="#FFFFFF" scope="col"><div align="left">Order Issue Date</div></th>
            <th width="21%" bordercolor="#FFFFFF" scope="col"><div align="left">Proforma</div></th>
            <th width="40%" bordercolor="#FFFFFF" scope="col"><div align="left">Fatura Comercial</div></th>
          </tr>
          <tr>
            <th width="20%" height="26" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label>
            <input name="TX_ORDER_NUMBER" type="text" class="editbox" id="TX_ORDER_NUMBER" tabindex="3" value="<%=TX_ORDER_NUMBER%>" maxlength="10" >
            </label></th>
            <th width="19%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
                <input name="dt_order_issue" type="text" class="editbox" id="dt_order_issue" tabindex="4"  value="<%=dt_order_issue%>" size="10" maxlength="10" onKeyPress="return(MascaraData(this,'/',event));">
                <a href="javascript:showCal('Calendario1')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th width="21%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
              <input name="TX_PROFORM_INVOICE" type="text" class="editbox" id="TX_PROFORM_INVOICE" tabindex="4" value="<%=TX_PROFORM_INVOICE%>" maxlength="20">
            </div></th>
            <th width="40%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
              <input name="TX_INVOICE" type="text" class="editbox" id="TX_INVOICE" tabindex="4" value="<%=TX_INVOICE%>" maxlength="20">
            </div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="59%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="29%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Number</div></th>
            <th width="27%" bordercolor="#FFFFFF" scope="col"><div align="left">Request Delivery Date</div></th>
            <th width="44%" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Issue Date</div></th>
          </tr>
          <tr>
            <th width="29%" height="26" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label>
            <input name="TX_DELIVERY_NUMBER" type="text" class="editbox" id="TX_DELIVERY_NUMBER"  tabindex="5" value="<%=TX_DELIVERY_NUMBER%>" maxlength="15">
            </label></th>
            <th width="27%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
                <input name="dt_rqt_delivery" type="text" class="editbox" id="dt_rqt_delivery" tabindex="6" value="<%=dt_rqt_delivery%>" size="10" maxlength="10" onKeyPress="return(MascaraData(this,'/',event));" >
                <a href="javascript:showCal('Calendario2')"><img id="dt_rqt_delivery" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th width="44%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
                <input name="dt_delivery_issue" type="text" class="editbox" id="dt_delivery_issue" tabindex="7" value="<%=DT_DELIVERY_ISSUE%>" size="10" maxlength="10" onKeyPress="return(MascaraData(this,'/',event));" >
                <a href="javascript:showCal('Calendario3')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Valores</div></th>
              <th width="18%" height="14" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left"></div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
              <input name="NR_VALORES" type="text" class="editbox" id="NR_VALORES" tabindex="8" onBlur="ValidaValor(this);" value="<%=FormatNumber(NR_VALORES,2)%>" size="15" maxlength="10">
            </div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th width="49%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
              <label></label>
            </div></th>
          </tr>
    </table></td></tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Modal</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Order Consolidated</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
                <span class="c2">
                <%
				If request("vTpacao")<>"Incluir" then
				   sql="select NM_VIA_TRANSPORTE from TVIA_TRANSPORTE where CD_VIA_TRANSPORTE='"&CD_MODAL&"'"
				   objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				   If objrsx.eof then
				      NM_VIA_TRANSPORTE=""
					else 
					  NM_VIA_TRANSPORTE=objrsx("NM_VIA_TRANSPORTE")
				    End if
                end if %>
                    <select name="CD_MODAL" class="select" id="CD_MODAL" style="width: 100px;" tabindex="9">
					<option value="<%=CD_MODAL%>"><%=NM_VIA_TRANSPORTE%></option>
                    <!--#include virtual="/selects/option_via_transporte.txt"-->
                    </select>
            </span></div></th>
            <th height="21" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <label>
              <input type="radio" name="IN_ORDER_CONSOLIDATED" value="S" tabindex="9" id="RadioGroup1_0"  <%if IN_ORDER_CONSOLIDATED="S" then response.Write("checked") end if%>>
Sim</label>
              <label>
              <input type="radio" name="IN_ORDER_CONSOLIDATED" value="N" tabindex="9" id="RadioGroup1_1" <%if IN_ORDER_CONSOLIDATED="N" then response.Write("checked") end if%>>
N&atilde;o</label>
            </div></th>
          </tr>
      </table></td>
    </tr>
      
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">Production Plant</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Loading Place</div></th>
          </tr>
          <tr>
            <th valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
              <%select case CD_PRODUCTION_PLANT
			  Case "0460"
			      PRODUCTION_PLANT="Aracatuba"
			  Case "1209"
			      PRODUCTION_PLANT="Araraquara"
			  Case "1210"
			      PRODUCTION_PLANT="Araras"
			  Case "1211"
			      PRODUCTION_PLANT="Caçapava"
			  Case "1215"
			      PRODUCTION_PLANT="Ibia"
			  Case "1217"
			      PRODUCTION_PLANT="Ituiutaba"
			  Case "1221"
			      PRODUCTION_PLANT="Marilia"
			  Case "1228"
			      PRODUCTION_PLANT="Rio Pardo"
			  Case "1238"
			      PRODUCTION_PLANT="Montes Claros"
			End Select
			%>
              <select name="CD_PRODUCTION_PLANT" id="CD_PRODUCTION_PLANT">
                <option value="<%=CD_PRODUCTION_PLANT%>"><%=PRODUCTION_PLANT%></option>
                <%if PRODUCTION_PLANT<>"Aracatuba" then%><option value="0460">Aracatuba </option><%end if%>
                <%if PRODUCTION_PLANT<>"Araraquara" then%><option value="1209">Araraquara </option><%end if%>
                <%if PRODUCTION_PLANT<>"Araras" then%><option value="1210">Araras </option><%end if%>
                <%if PRODUCTION_PLANT<>"Cacapava" then%><option value="1211">Cacapava </option><%end if%>
                <%if PRODUCTION_PLANT<>"Ibia" then%><option value="1215">Ibia </option><%end if%>
                <%if PRODUCTION_PLANT<>"Ituiutaba" then%><option value="1217">Ituiutaba </option><%end if%>
                <%if PRODUCTION_PLANT<>"Marilia" then%><option value="1221">Marilia </option><%end if%>
                <%if PRODUCTION_PLANT<>"Rio Pardo" then%><option value="1228">Rio Pardo </option><%end if%>
                <%if PRODUCTION_PLANT<>"Montes Claros" then%><option value="1238">Montes Claros </option><%end if%>
              </select>
            </div>
            </label></th>
            <th height="26" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th bordercolor="#FFFFFF" scope="col"><div align="left">
              <%select case CD_LOADING_PLACE
			  Case "1179"
			      LOADING_PLACE="Araraquara"
			  Case "1184"
			      LOADING_PLACE="Cordeiropolis"
			  Case "1202"
			      LOADING_PLACE="São Bernardo"
			  Case "1208"
			      LOADING_PLACE="Ibia"
			  Case "1246"
			      LOADING_PLACE="Ituiutaba"
			  Case "1284"
			      LOADING_PLACE="Aracatuba"
			  Case "1340"
			      LOADING_PLACE="Marilia"
			  Case "1598"
			      LOADING_PLACE="Cacapava"
			  Case "2949"
			      LOADING_PLACE="Montes Claros"
			  Case "2957"
			      LOADING_PLACE="Rio Pardo"
			  Case "2958"
			      LOADING_PLACE="Araras"
			  Case "3780"
			      LOADING_PLACE="Mestralog"
			End Select
			%>
              <select name="CD_LOADING_PLACE" id="CD_LOADING_PLACE">
                <option value="<%=CD_LOADING_PLACE%>"><%=LOADING_PLACE%></option>
                <%if LOADING_PLACE<>"Araraquara" then%>
                <option value="1179">Araraquara </option>
                <%end if%>
                <%if LOADING_PLACE<>"Cordeiropolis" then%>
                <option value="1184">Cordeiropolis </option>
                <%end if%>
                <%if LOADING_PLACE<>"São Bernardo" then%>
                <option value="1202">São Bernardo</option>
                <%end if%>
                <%if LOADING_PLACE<>"Ibia" then%>
                <option value="1208">Ibia </option>
                <%end if%>
                <%if LOADING_PLACE<>"Ituiutaba" then%>
                <option value="1246">Ituiutaba </option>
                <%end if%>
                <%if LOADING_PLACE<>"Aracatuba" then%>
                <option value="1284">Aracatuba </option>
                <%end if%>
                <%if LOADING_PLACE<>"Marilia" then%>
                <option value="1340">Marilia </option>
                <%end if%>
                <%if LOADING_PLACE<>"Cacapava" then%>
                <option value="1598">Cacapava</option>
                <%end if%>
                <%if LOADING_PLACE<>"Montes Claros" then%>
                <option value="2949">Montes Claros </option>
                <%end if%>
                <%if LOADING_PLACE<>"Rio Pardo" then%>
                <option value="2957">Rio Pardo</option>
                <%end if%>
                <%if LOADING_PLACE<>"Araras" then%>
                <option value="2958">Araras</option>
                <%end if%>
                <%if LOADING_PLACE<>"Mestralog" then%>
                <option value="3780">Mestralog</option>
                <%end if%>
              </select>
            </div></th>
          </tr>
          
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Plant Code (CU)</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Descr                (importer / invoice  to)</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
                <input name="CD_CUSTOMER_PLANT" type="text" class="editbox" id="CD_CUSTOMER_PLANT" tabindex="13" value="<%=CD_CUSTOMER_PLANT%>" size="10" maxlength="4" >
            </div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <label>
              <input name="CD_CUSTOMER" type="text" class="editbox" id="CD_CUSTOMER" style="width: 40px;" tabindex="14" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'nome');" value="<%=CD_CUSTOMER%>" maxlength="5">
              <input type='text' name='nome' class='edtDisabled' readonly>
              <%
		str = "ConsultaOnLineSQL(11,'Codigo,Customer Description','CD_EMPRESA','CD_CUSTOMER','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"> </label>
</div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">Final Customer                  (consignee / ship to)</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Country (ship to)</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
                <input name="CD_CONSIGNEE" type="text" class="editbox" id="CD_CONSIGNEE" tabindex="15" value="<%=CD_CONSIGNEE%>" size="10" maxlength="5">
            </div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <input name="CD_COUNTRY" type="text" class="editbox" id="CD_COUNTRY" style="width: 40px;" tabindex="16" onBlur="FastLookup('tpais_broker','CD_PAIS','NM_PAIS',this,'Pais');" value="<%=CD_COUNTRY%>" maxlength="3">
              <input type='text' name='Pais' class='edtDisabled' readonly>
              <%
			 str = "ConsultaOnLineSQL(13,'Codigo,Pa&iacute;s','CD_PAIS','CD_COUNTRY','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>">
              </label>
            </div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Region (invoice to)</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Port of Destination</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input name="TX_REGION" type="text" class="editbox" id="TX_REGION" tabindex="17" value="<%=TX_REGION%>" size="3" maxlength="3">
            </div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <input name="CD_PORT_OF_DESTINATION" type="text" class="editbox" id="CD_PORT_OF_DESTINATION" style="width: 40px;" tabindex="17" onBlur="FastLookup('tlocal_embarque','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'DESTINATION');" value="<%=CD_PORT_OF_DESTINATION%>" maxlength="3">
              <input type='text' name='DESTINATION' class='edtDisabled' readonly>
              <%
			str = "ConsultaOnLineSQL(14,'Codigo,Port of Destination','CD_LOCAL_EMB','CD_PORT_OF_DESTINATION','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>">
              </label>
            </div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">Month/year</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Revised Loading Date</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
                <input name="TX_MONTH_YEAR" type="text" class="editbox" id="TX_MONTH_YEAR" onKeyUp="AplicaMascara('XX/XXXX', this);"  tabindex="19" value="<%=fnc_Mascara(TX_MONTH_YEAR,8)%>" size="7" maxlength="7">
            mm/yyyy</div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#CCCCCC" scope="col" width="49%"> <div align="left">
                <input name="dt_loading" type="text" class="editbox" id="dt_loading" tabindex="20" onKeyPress="return(MascaraData(this,'/',event));" value="<%=DT_LOADING%>" size="10" maxlength="10" >
                <a href="javascript:showCal('Calendario4')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Vessel  / Carrier</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Equipment type</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
              <input name="CD_VESSEL" type="text" class="editbox" id="CD_VESSEL" style="width: 40px;" tabindex="20" onBlur="FastLookup('tembarcacao','CD_EMBARCACAO','NM_EMBARCACAO',this,'embarcacao');" value="<%=CD_VESSEL%>" maxlength="4">
              <input type='text' name='embarcacao' class='edtDisabled' readonly>
              <%
		str = "ConsultaOnLineSQL(15,'Codigo,Vessel / Carrier','CD_EMBARCACAO','CD_VESSEL','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>">
              </label>
</div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <input name="CD_EQUIP_TYPE" value="<%=CD_EQUIP_TYPE%>" type="text" class="editbox" id="CD_EQUIP_TYPE" style="width: 40px;" tabindex="21" onBlur="FastLookup('ttp_cntr','TP_CNTR','NM_TP_CNTR',this,'equipamento');" maxlength="2">
              <input type='text' name='equipamento' class='edtDisabled' readonly>
              <%
		str = "ConsultaOnLineSQL(16,'Tipo,Equipment type','TP_CNTR','CD_EQUIP_TYPE','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>">
              </label>
            </div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">ETD</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Departure Date</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
              <input name="dt_etd" type="text" class="editbox" id="dt_etd" tabindex="23" onKeyPress="return(MascaraData(this,'/',event));" value="<%=DT_ETD%>" size="10" maxlength="10">
              <a href="javascript:showCal('Calendario12')"><img id="dt_eta2" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input name="dt_departure_date" type="text" class="editbox" id="dt_departure_date" tabindex="24" onKeyPress="return(MascaraData(this,'/',event));" value="<%=dt_departure_date%>" size="10" maxlength="10" >
                <a href="javascript:showCal('Calendario9')"><img id="dt_order_issue4" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Loaded</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Dead line</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
              <label>
              <input type="radio" name="IN_LOADED" value="S" tabindex="24"  id="RadioGroup1_2" <%if IN_LOADED="S" then response.Write("checked") end if%>>
Sim </label>
              <label>
              <input type="radio" name="IN_LOADED" value="N" id="RadioGroup1_3" <%if IN_LOADED="N" then response.Write("checked") end if%>>
N&atilde;o </label>
</div></th>
            <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th width="49%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left">
              <input name="dt_deadline" type="text" class="editbox" id="dt_deadline" tabindex="26" onKeyPress="return(MascaraData(this,'/',event));"  value="<%=dt_deadline%>" size="10" maxlength="10" >
            <a href="javascript:showCal('Calendario10')"><img id="dt_deadline2" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td valign="top" bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">ETA</div></th>
            <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Week Departure</div></th>
          </tr>
          <tr>
            <th width="33%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left">
                <input name="dt_eta" type="text" class="editbox" id="dt_eta"   tabindex="27" onKeyPress="return(MascaraData(this,'/',event));" value="<%=dt_eta%>" size="10" maxlength="10" >
                <a href="javascript:showCal('Calendario11')"><img id="dt_eta" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th height="22" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <label>
              <select name="NR_DEPARTURE_WEEK" id="NR_DEPARTURE_WEEK" tabindex="27">
                  <option value="<%=NR_DEPARTURE_WEEK%>" selected><%=NR_DEPARTURE_WEEK%></option>
                  <option value="01">01</option>
                  <option value="02">02</option>
                  <option value="03">03</option>
                  <option value="04">04</option>
                  <option value="05">05</option>
                  <option value="06">06</option>
                  <option value="07">07</option>
                  <option value="08">08</option>
                  <option value="09">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                  <option value="32">32</option>
                  <option value="33">33</option>
                  <option value="34">34</option>
                  <option value="35">35</option>
                  <option value="36">36</option>
                  <option value="37">37</option>
                  <option value="38">38</option>
                  <option value="39">39</option>
                  <option value="40">40</option>
                  <option value="41">41</option>
                  <option value="42">42</option>
                  <option value="43">43</option>
                  <option value="44">44</option>
                  <option value="45">45</option>
                  <option value="46">46</option>
                  <option value="47">47</option>
                  <option value="48">48</option>
                  <option value="49">49</option>
                  <option value="50">50</option>
                  <option value="51">51</option>
                  <option value="52">52</option>
                  <option value="53">53</option>
              </select>
              </label>
            </div></th>
          </tr>
      </table></td>
    </tr>
    <tr>
        <td height="162" valign="top" bordercolor="#FFFFFF"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
          <tr>
            <th height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Comments</div></th>
          </tr>
          <tr>
            <th height="146" valign="top" bordercolor="#FFFFFF" scope="col"><label></label> <div align="left">
                <p>
                  <textarea name="TX_MEMO" wrap="virtual" class="editbox" id="TX_MEMO" style="width:550px;height:70px;text-transform:uppercase;" tabindex="28" cols="90" rows="10"><%=TX_MEMO%></textarea>
                  <label></label>
                </p>
                </div></th>
          </tr>
      </table></td>
    </tr>
  </table>
  <div id="ListaItens">
</div>
  <p>&nbsp;</p>
</form>

<script language="javascript"  type="text/javascript">
<!--
function PreencheForm(vTpAcao) {
	if ( '<%= objrs.Fields.Item("CD_PRODUCTION_PLANT")%>'  != '')     document.OrderForm.CD_PRODUCTION_PLANT.focus();
	if ( '<%= objrs.Fields.Item("CD_LOADING_PLACE")%>'  != '') 	      document.OrderForm.CD_LOADING_PLACE.focus();
	if ( '<%= objrs.Fields.Item("CD_COUNTRY")%>'  != '') 	          document.OrderForm.CD_COUNTRY.focus();
	if ( '<%= objrs.Fields.Item("CD_PORT_OF_DESTINATION")%>'  != '')  document.OrderForm.CD_PORT_OF_DESTINATION.focus();
	if ( '<%= objrs.Fields.Item("CD_EQUIP_TYPE")%>'  != '') 	      document.OrderForm.CD_EQUIP_TYPE.focus();
	if ( '<%= objrs.Fields.Item("CD_VESSEL")%>'  != '') 	          document.OrderForm.CD_VESSEL.focus();
	if ( '<%= objrs.Fields.Item("CD_CUSTOMER")%>'  != '') 	          document.OrderForm.CD_CUSTOMER.focus();
    if ( '<%=request("vTpacao")%>' =='Exibir')     	                  document.OrderForm.TX_ORDER_NUMBER.focus(); 
    if ( '<%=request("vTpacao")%>' =='Incluir')                  	  document.OrderForm.NR_1ST_WEEK.focus();
}
-->
</script>

</body>
<p>
<p>
    <label></label>
<!--Scrollable iframe script- By Dynamic Drive-->
<!--For full source code and more DHTML scripts, visit http://www.dynamicdrive.com-->
<!--This credit MUST stay intact for use-->

<iframe id="datamain" src="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>" width=100% height=400  marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=no ></iframe>

</layer>
</di  ></p>
  </p>
  <p>&nbsp;</p>
</div>