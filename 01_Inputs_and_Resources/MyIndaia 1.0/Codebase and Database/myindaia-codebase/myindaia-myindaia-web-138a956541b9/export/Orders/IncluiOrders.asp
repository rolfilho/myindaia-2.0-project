<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>


<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Sistema de busca - Importação
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 05/06/2008
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->


<%

Dim TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE,TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY
Dim DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL,CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE
Dim CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION,TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE
Dim IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO
dim CheckCustomer,TpExibir,vTpAcao,mensagem,chkBlank
'TpExibir= se for = 1 exibe o div com a mensagem
mensagem=request("mensagem")
if request("mensagem")<>"" then%>
<script>alert('<%=mensagem%>');</script>
<%End if

TX_PO_CUSTOMER= Request("TX_PO_CUSTOMER")
NR_1ST_WEEK= Request.form("NR_1ST_WEEK")
NR_REVISED_WEEK= Request.form("NR_REVISED_WEEK")
TX_ORDER_NUMBER= Request.form("TX_ORDER_NUMBER")
DT_ORDER_ISSUE= Request.form("DT_ORDER_ISSUE")
TX_PROFORM_INVOICE= Request.form("TX_PROFORM_INVOICE")
TX_DELIVERY_NUMBER= Request.form("TX_DELIVERY_NUMBER")
DT_RQT_DELIVERY= Request.form("DT_RQT_DELIVERY")
DT_DELIVERY_ISSUE= Request.form("DT_DELIVERY_ISSUE")
NR_VALORES= Request.form("NR_VALORES")
IN_ORDER_CONSOLIDATED= Request.form("IN_ORDER_CONSOLIDATED")
CD_MODAL= Request.form("CD_MODAL")
CD_PRODUCTION_PLANT= Request.form("CD_PRODUCTION_PLANT")
CD_LOADING_PLACE= Request.form("CD_LOADING_PLACE")
CD_CUSTOMER_PLANT= Request.form("CD_CUSTOMER_PLANT")
CD_CUSTOMER= Request.form("CD_CUSTOMER")
CD_CONSIGNEE= Request.form("CD_CONSIGNEE")
CD_COUNTRY= Request.form("CD_COUNTRY")
TX_REGION= Request.form("TX_REGION")
CD_PORT_OF_DESTINATION= Request.form("CD_PORT_OF_DESTINATION")
TX_MONTH_YEAR= Request.form("TX_MONTH_YEAR")
DT_LOADING= Request.form("DT_LOADING")
CD_VESSEL= Request.form("CD_VESSEL")
CD_EQUIP_TYPE= Request.form("CD_EQUIP_TYPE")
DT_ETD= Request.form("DT_ETD")
DT_DEPARTURE_DATE= Request.form("DT_DEPARTURE_DATE")
IN_LOADED= Request.form("IN_LOADED")
DT_DEADLINE= Request.form("DT_DEADLINE")
DT_ETA= Request.form("DT_ETA")
TX_MEMO= Request.form("TX_MEMO")

sql= "SELECT TX_PO_CUSTOMER FROM TPEDIDO_VENDA_NESTLE WHERE TX_PO_CUSTOMER ='"&TX_PO_CUSTOMER&"'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'url="TX_PO_CUSTOMER="&TX_PO_CUSTOMER&",NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE,TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY,
'DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL,CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,
'CD_CONSIGNEE,CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION,TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,
'IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO"
url="TX_PO_CUSTOMER="&TX_PO_CUSTOMER&"&CD_PRODUCTION_PLANT="&CD_PRODUCTION_PLANT&"&CD_LOADING_PLACE="&CD_LOADING_PLACE&"&CD_CUSTOMER="&CD_CUSTOMER&"&CD_COUNTRY="&CD_COUNTRY&"&CD_PORT_OF_DESTINATION="&CD_PORT_OF_DESTINATION&"&CD_EQUIP_TYPE="&CD_EQUIP_TYPE&"&CD_VESSEL="&CD_VESSEL&""

If not objrs.eof then %>
	<script>alert("Customer já cadastrado")</script>
<%    CheckCustomer=0 ' não exibe o restante do cadastro.
      Response.Redirect("Listagem.asp?mensagem=Customer já cadastrado!&TpExibir=1")

end if
sub  Submensagem(var)
	Response.Redirect("../../import/teste.asp?var1="&sql&"")
end sub
If request("ChkVar")=1 then
   CD_PRODUCTION_PLANT=request("CD_PRODUCTION_PLANT")
   CD_LOADING_PLACE=request("CD_LOADING_PLACE")
   CD_CUSTOMER=request("CD_CUSTOMER")
   CD_COUNTRY=request("CD_COUNTRY")
   CD_PORT_OF_DESTINATION=request("CD_PORT_OF_DESTINATION")
   CD_EQUIP_TYPE=request("CD_EQUIP_TYPE")
   CD_VESSEL=request("CD_VESSEL")
End If
'----------------------------------------------------------------------------------------------INCLUSÃO
If  request("vTpacao")="Incluir" then
	'Verifica campos obrigatórios
'			if CD_PRODUCTION_PLANT=""     then 	chkBlank=1	end if
'			if CD_LOADING_PLACE=""        then 	chkBlank=2	end if
'			if CD_CUSTOMER=""             then 	chkBlank=3	end if
'			if CD_COUNTRY=""              then 	chkBlank=4	end if
'			if CD_PORT_OF_DESTINATION=""  then 	chkBlank=5	end if
'			if CD_EQUIP_TYPE=""           then 	chkBlank=6	end if
'			if CD_VESSEL=""               then 	chkBlank=7	end if
'			Select Case  chkBlank
'			case "1"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Production Plant&ChkVar=1&"&url)
'			case "2"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Loading Place&ChkVar=1&"&url)
'			case "3"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Customer Descr (importer / invoice to)&ChkVar=1&"&url)
'			case "4"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Country (ship to)&ChkVar=1&"&url)
'			case "5"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Port of Destination&ChkVar=1&"&url)
'			case "6"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo Equipment type&ChkVar=1&"&url)
'			case "7"
'				Response.Redirect("incluiOrders.asp?mensagem=Preencha o campo VESSEL&ChkVar=1&"&url)
'			End select
	
	sql = "INSERT INTO TPEDIDO_VENDA_NESTLE (TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE, "&_
	      " TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY,DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL, "&_
          " CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE,CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION, "&_
		  " TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO) "&_
          " VALUES   ("&fncValSQL(TX_PO_CUSTOMER,0)&","&fncValSQL(NR_1ST_WEEK,3)&","&fncValSQL(NR_REVISED_WEEK,3)&","&fncValSQL(TX_ORDER_NUMBER,0)&","&fncValSQL(DT_ORDER_ISSUE,1)&", "&_
		  " "&fncValSQL(TX_PROFORM_INVOICE,0)&","&fncValSQL(TX_DELIVERY_NUMBER,0)&","&fncValSQL(DT_RQT_DELIVERY,1)&","&fncValSQL(DT_DELIVERY_ISSUE,1)&","&fncValSQL(NR_VALORES,3)&", "&_
		  " "&fncValSQL(IN_ORDER_CONSOLIDATED,0)&","&fncValSQL(CD_MODAL,0)&","&fncValSQL(CD_PRODUCTION_PLANT,0)&","&fncValSQL(CD_LOADING_PLACE,0)&","&fncValSQL(CD_CUSTOMER_PLANT,0)&","&fncValSQL(CD_CUSTOMER,0)&", "&_
		  " "&fncValSQL(CD_CONSIGNEE,0)&","&fncValSQL(CD_COUNTRY,0)&","&fncValSQL(TX_REGION,0)&","&fncValSQL(CD_PORT_OF_DESTINATION,0)&","&fncValSQL(TX_MONTH_YEAR,0)&","&fncValSQL(DT_LOADING,1)&", "&_
		  " "&fncValSQL(CD_VESSEL,0)&","&fncValSQL(CD_EQUIP_TYPE,0)&","&fncValSQL(DT_ETD,1)&","&fncValSQL(DT_DEPARTURE_DATE,1)&","&fncValSQL(IN_LOADED,0)&","&fncValSQL(DT_DEADLINE,1)&","&fncValSQL(DT_ETA,1)&","&fncValSQL(TX_MEMO,0)&")"
	'Response.Redirect("../../import/teste.asp?var1="&sql&"")
	objcnn.Execute(sql)
	CheckCustomer=1 ' exibe o restante do cadastro.
  %><script>
			alert("Pedido Gravado!");
  </script><% 
      Response.Redirect("Listagem.asp?mensagem=Pedido:"&Request("TX_PO_CUSTOMER")&" cadastrado com sucesso!&TpExibir=1")

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
<script language="javascript" src="/includes/script.js"></script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>

<style type="text/css">
<!--

<!--
#apDiv1 {
	left: -320;
}
.style6 {font-size: large}
.edtDisabled {background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
.c2 {	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
}
.style7 {
	color: #FF0000;
	font-size: 10px;
}
-->
</style>
</head>
<body>
<script language="javascript" src="/includes/script.js"></script>

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
  <form action="IncluiOrders.asp" method="post" name="OrderForm" onSubmit="ValidaForm()">
    <table width="85%" border="1" align="center" cellpadding="0" cellspacing="3" bordercolor="#CCCCCC">
      <tr>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp?CheckInclusao=1"><img src="../../imagens/icones/32x32/btn_novo.jpg" alt="Incluir Pedido" width="32" height="32" border="0"></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Salvar Edi&ccedil;&atilde;o" value="Submit();"></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><img name="btnCancelar" src="/imagens/icones/32x32/btn_cancelar.gif" class="btnImagem" alt="Cancelar Edi&ccedil;&atilde;o"> </th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><img name="btnExcluir" src="/imagens/icones/32x32/btn_excluir.gif" class="btnImagem" alt="Excluir"></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp"><img src="/imagens/icones/32x32/btn_print.gif" alt="Imprimir" name="btnPrintRap" border="0" class="btnImagem"></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp"><img src="../../imagens/icones/32x32/btn_listar.gif" alt="Atualizar lista de pedidos" width="32" height="32" border="0"></a></th>
        <th width="28%" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
        <th width="33%" bordercolor="#FFFFFF" scope="col"><span class="style6">Pedido No.: <%=request("TX_PO_CUSTOMER")%></span></th>
      </tr>
    </table>
    <div align="center"><span class="style7"><%=request("mensagem")%></span><br>
    </div>
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="editbox">
    <tr>
        <th height="33" bordercolor="#0000FF" scope="col"><table width="59%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="31%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">1st Week</div></th>
            <th width="69%" bordercolor="#FFFFFF" scope="col"><div align="left">Revised Week</div></th>
          </tr>
          <tr>
            <th width="31%" height="26" bordercolor="#FFFFFF" scope="col"><div align="left">
                <select name="NR_1ST_WEEK" id="NR_1ST_WEEK" >
                  <option value="01" class="editbox" selected>01</option>
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
            </div></th>
            <th bordercolor="#FFFFFF" scope="col" width="69%"> <div align="left">
                <select name="NR_REVISED_WEEK" id="NR_REVISED_WEEK" >
                  <option value="01" class="editbox" selected>01</option>
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
              <input type="hidden" name="TX_PO_CUSTOMER" id="TX_PO_CUSTOMER" value="<%=request("TX_PO_CUSTOMER")%>" >
              </div>
            </label></th>
            <th bordercolor="#FFFFFF" scope="col" width="31%">
          </div></th>
          </tr>
        </table></th>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="59%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="30%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Order Number</div></th>
            <th width="31%" bordercolor="#FFFFFF" scope="col"><div align="left">Order Issue Date</div></th>
            <th width="39%" bordercolor="#FFFFFF" scope="col"><div align="left">Invoice</div></th>
          </tr>
          <tr>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="30%"><label>
              <div align="left">
                <input name="TX_ORDER_NUMBER" type="text" class="editbox" id="TX_ORDER_NUMBER" size="10" maxlength="10" tabindex="1">
              </div>
            </label></th>
            <th bordercolor="#FFFFFF" scope="col" width="31%"> <div align="left">
                <input name="dt_order_issue" type="text" class="editbox" id="dt_order_issue" size="12" maxlength="12" tabindex="2" onKeyPress="return(MascaraData(this,'/',event));">
                <span class="c2"><a href="javascript:showCal('Calendario1')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></span></div></th>
            <th bordercolor="#FFFFFF" scope="col" width="39%"> <div align="left">
                <input name="TX_PROFORM_INVOICE" type="text" class="editbox" id="TX_PROFORM_INVOICE" size="10" maxlength="10" tabindex="3">
            </div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="59%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="30%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Number</div></th>
            <th width="31%" bordercolor="#FFFFFF" scope="col"><div align="left">Request Delivery Date</div></th>
            <th width="39%" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Issue Date</div></th>
          </tr>
          <tr>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="30%"><label>
              <div align="left">
                <input name="TX_DELIVERY_NUMBER" type="text" class="editbox" id="TX_DELIVERY_NUMBER" size="10" maxlength="10" tabindex="4">
              </div>
            </label></th>
            <th bordercolor="#FFFFFF" scope="col" width="31%"> <div align="left">
                <input name="dt_rqt_delivery" type="text" class="editbox" id="dt_rqt_delivery" size="12" maxlength="12" tabindex="5">
            <a href="javascript:showCal('Calendario2')"><img id="dt_rqt_delivery" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th bordercolor="#FFFFFF" scope="col" width="39%"> <div align="left">
                <input name="dt_delivery_issue" type="text" class="editbox" id="dt_delivery_issue" size="12" maxlength="12" tabindex="6">
            <a href="javascript:showCal('Calendario3')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Valores</div></th>
              <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Order Consolidated</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
              <input type="text" name="NR_VALORES" id="NR_VALORES" class="editbox" onBlur="ValidaValor(this);" tabindex="7">
            </div></th>
              <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input type="text" name="IN_ORDER_CONSOLIDATED" id="IN_ORDER_CONSOLIDATED" class="editbox" tabindex="8">
            </div></th>
          </tr>
        </table></td></tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Modal</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left"></div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left"><span class="c2">
                <select name="CD_MODAL" class="select" id="CD_MODAL" style="width: 100px;" tabindex="9">
                  <option value="">&nbsp;</option>
                  <!--#include virtual="/selects/option_via_transporte.txt"-->
                </select>
            </span></div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left"></div></th>
          </tr>
        </table></td>
      </tr>
      
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="43%" bordercolor="#FFFFFF" scope="col"><div align="left">Production Plant</div></th>
            <th width="8%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Loading Place</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="43%"><div align="left">
                <input name="CD_PRODUCTION_PLANT" type="text" class="editbox" id="CD_PRODUCTION_PLANT" style="width: 40px;" tabindex="10" onBlur="FastLookup('TAREA','CD_AREA','NM_AREA',this,'area');" value="<%=request("CD_PRODUCTION_PLANT")%>" maxlength="2">
                <input type='text' name='area' class='edtDisabled' readonly>
                <%
				str = "ConsultaOnLineSQL(12,'Codigo,Área','CD_AREA','CD_PRODUCTION_PLANT','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label>
            <%=request("CD_PRODUCTION_PLANT")%></div></th>
            <th height="22" bordercolor="#FFFFFF" scope="col" width="8%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input name="CD_LOADING_PLACE" type="text" class="editbox" id="CD_LOADING_PLACE" style="width: 40px;" tabindex="11" onBlur="FastLookup('TAREA','CD_AREA','NM_AREA',this,'NM_PLACE');" value="<%=request("CD_LOADING_PLACE")%>" maxlength="2">
                <input type='text' name='NM_PLACE' class='edtDisabled' readonly>
                <%
				str = "ConsultaOnLineSQL(12,'Codigo,Área','CD_AREA','CD_LOADING_PLACE','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label><%=request("CD_LOADING_PLACE")%></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Plant Code (CU)</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Descr                (importer / invoice  to)</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="CD_CUSTOMER_PLANT" id="CD_CUSTOMER_PLANT" class="editbox" tabindex="12">
 *           </div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <label>
              <input name="CD_CUSTOMER" type="text" class="editbox" id="CD_CUSTOMER" style="width: 40px;" tabindex="13" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'Nome');" value="<%=request("CD_CUSTOMER")%>" maxlength="5">
              <input type='text' name='Nome' class='edtDisabled' readonly>
              <%
		str = "ConsultaOnLineSQL(11,'Codigo,Customer Description','CD_EMPRESA','CD_CUSTOMER','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
              <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>">              </label>
            <%=request("CD_CUSTOMER")%></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Final Customer                  (consignee / ship to)</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Country (ship to)</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="CD_CONSIGNEE" id="CD_CONSIGNEE" class="editbox" tabindex="14">
            </div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
              <input name="CD_COUNTRY" type="text" class="editbox" id="CD_COUNTRY" style="width: 40px;" tabindex="15" onBlur="FastLookup('tpais_broker','CD_PAIS','NM_PAIS',this,'Pais');" value="<%=request("CD_COUNTRY")%>" maxlength="3">
              <input type='text' name='Pais' class='edtDisabled' readonly>
<%
			 str = "ConsultaOnLineSQL(13,'Codigo,País','CD_PAIS','CD_COUNTRY','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label><%=request("CD_COUNTRY")%></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Region (invoice to)</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Port of Destination</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="TX_REGION" id="TX_REGION" class="editbox"  tabindex="16">
            </div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input name="CD_PORT_OF_DESTINATION" type="text" class="editbox" id="CD_PORT_OF_DESTINATION" style="width: 40px;" tabindex="17" onBlur="FastLookup('tlocal_embarque','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'DESTINATION');" value="<%=request("CD_PORT_OF_DESTINATION")%>" maxlength="3">
                <input type='text' name='DESTINATION' class='edtDisabled' readonly>
<%
			str = "ConsultaOnLineSQL(14,'Codigo,Port of Destination','CD_LOCAL_EMB','CD_PORT_OF_DESTINATION','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label><%=request("CD_PORT_OF_DESTINATION")%></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Month</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Revised Loading Date</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="TX_MONTH_YEAR" id="TX_MONTH_YEAR" class="editbox" tabindex="18">
            </div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#CCCCCC" scope="col" width="49%"> <div align="left">
                <input type="text" name="dt_loading" id="dt_loading" class="editbox" tabindex="19">
            <a href="javascript:showCal('Calendario4')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
          <tr>
            <th width="44%" bordercolor="#FFFFFF" scope="col"><div align="left">Vessel  / Carrier</div></th>
            <th width="7%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Equipment type</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="44%"><div align="left">
                <input name="CD_VESSEL" type="text" class="editbox" id="CD_VESSEL" style="width: 40px;" tabindex="20" onBlur="FastLookup('tembarcação','CD_EMBARCACAO','NM_EMBARCACAO',this,'embarcacao');" value="<%=request("CD_VESSEL")%>" maxlength="4">
                <input type='text' name='embarcacao' class='edtDisabled' readonly>
<%
		str = "ConsultaOnLineSQL(15,'Codigo,Vessel / Carrier','CD_EMBARCACAO','CD_VESSEL','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label>
            <%=request("CD_VESSEL")%></div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="7%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input name="CD_EQUIP_TYPE" type="text" class="editbox" id="CD_EQUIP_TYPE" style="width: 40px;" tabindex="21" onBlur="FastLookup('ttp_cntr','TP_CNTR','NM_TP_CNTR',this,'equipamento');" value="<%=request("CD_EQUIP_TYPE")%>" maxlength="2">
                <input type='text' name='equipamento' class='edtDisabled' readonly>
<%
		str = "ConsultaOnLineSQL(16,'Tipo,Equipment type','TP_CNTR','CD_EQUIP_TYPE','');" 'Joga o c&oacute;digo selecionado no campo c&oacute;digo que trar&aacute; automaticamente o nome da empresa.
%>
                <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label><%=request("CD_EQUIP_TYPE")%></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">ETD</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Departure Date</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="dt_etd" id="dt_etd" class="editbox" onKeyPress="return(MascaraData(this,'/',event));" tabindex="22">
                <a href="javascript:showCal('Calendario12')"><img id="dt_eta2" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input type="text" name="dt_departure_date" id="dt_departure_date" class="editbox" tabindex="23">
            <a href="javascript:showCal('Calendario9')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Loaded</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Dead line</div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
              <label>
                <input type="radio" name="IN_LOADED" id="IN_LOADED" value="1" tabindex="24">
                </label>
            Sim 
            <input type="radio" name="IN_LOADED" id="IN_LOADED" value="0" tabindex="25">
            N&atilde;o</div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                <input type="text" name="dt_deadline" id="dt_deadline" class="editbox" onKeyPress="return(MascaraData(this,'/',event));" tabindex="26">
                <a href="javascript:showCal('Calendario10')"><img id="dt_deadline" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"> </a>
            </div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bordercolor="#CCCCCC"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
          <tr>
            <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">ETA</div></th>
            <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
            <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left"></div></th>
          </tr>
          <tr>
            <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                <input type="text" name="dt_eta" id="dt_eta" class="editbox" onKeyPress="return(MascaraData(this,'/',event));" tabindex="27">
                <a href="javascript:showCal('Calendario11')"><img id="dt_eta" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></div></th>
            <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
            <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left"></div></th>
          </tr>
          <tr>
            <th height="26" colspan="3" bordercolor="#FFFFFF" scope="col"><div align="left">Comments</div></th>
          </tr>
          <tr>
            <th height="26" colspan="3" bordercolor="#FFFFFF" scope="col"><div align="left">
              <textarea name="TX_MEMO" cols="90" rows="10" class="editbox" id="TX_MEMO" tabindex="28"></textarea>
            </div></th>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><input name="vTpAcao" type="hidden" id="vTpAcao" value="Incluir"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <p>&nbsp;</p>
</form>
<p>
    <label></label>
  </p>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<script language="javascript"  type="text/javascript">
function PreencheForm(vTpAcao) {
	//alert(<%'=objrs.Fields.Item("CD_PRODUCTION_PLANT")%>)
	//simula a entrada no campo de código para executar a busca
//	CD_PRODUCTION_PLANT  = '<%= objrs.Fields.Item("CD_PRODUCTION_PLANT")%>';
	if ( '<%= objrs.Fields.Item("CD_PRODUCTION_PLANT")%>'  != '')     document.OrderForm.CD_PRODUCTION_PLANT.focus();
	if ( '<%= objrs.Fields.Item("CD_LOADING_PLACE")%>'  != '') 	      document.OrderForm.CD_LOADING_PLACE.focus();
	if ( '<%= objrs.Fields.Item("CD_COUNTRY")%>'  != '') 	      document.OrderForm.CD_COUNTRY.focus();
	if ( '<%= objrs.Fields.Item("CD_PORT_OF_DESTINATION")%>'  != '') 	      document.OrderForm.CD_PORT_OF_DESTINATION.focus();
	if ( '<%= objrs.Fields.Item("CD_EQUIP_TYPE")%>'  != '') 	      document.OrderForm.CD_EQUIP_TYPE.focus();
	if ( '<%= objrs.Fields.Item("CD_VESSEL")%>'  != '') 	      document.OrderForm.CD_VESSEL.focus();

	document.OrderForm.NR_1ST_WEEK.focus();
}

function ValidaForm(form) {
	if(OrderForm.tx_po_customer.value =="") { 
	alert("Preencha o campo TX_PO_CUSTOMER") 
	return false; 
	OrderForm.tx_po_customer.focus; 
	} 
	else return true 
	}


</script>


