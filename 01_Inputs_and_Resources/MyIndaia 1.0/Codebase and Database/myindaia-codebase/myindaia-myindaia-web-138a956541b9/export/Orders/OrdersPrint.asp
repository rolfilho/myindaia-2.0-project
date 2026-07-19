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


<%session.lcid = 1046
Dim TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE,TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER,DT_RQT_DELIVERY
Dim DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL,CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE
Dim CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION,TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE
Dim IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO
Dim CheckCustomer,TpExibir,CUSTOMER,Embarque,NM_VIA_TRANSPORTE,VIA_TRANSPORTE,PLANT,LPlace,PAIS,Equipment,Vessel,TX_INVOICE
Dim pagina 'pagina inicial da ordenação

ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
'verifica se a pagina é zero, se for seta para 1


'TpExibir= se for = 1 exibe o div com a mensagem

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

sql= "SELECT TX_PO_CUSTOMER,NR_1ST_WEEK,NR_REVISED_WEEK,TX_ORDER_NUMBER,DT_ORDER_ISSUE,TX_PROFORM_INVOICE,TX_DELIVERY_NUMBER, "&_
     " DT_RQT_DELIVERY,DT_DELIVERY_ISSUE,NR_VALORES,IN_ORDER_CONSOLIDATED,CD_MODAL,TX_INVOICE, "&_
     " CD_PRODUCTION_PLANT,CD_LOADING_PLACE,CD_CUSTOMER_PLANT,CD_CUSTOMER,CD_CONSIGNEE,CD_COUNTRY,TX_REGION,CD_PORT_OF_DESTINATION, "&_
	 " TX_MONTH_YEAR,DT_LOADING,CD_VESSEL,CD_EQUIP_TYPE,DT_ETD,DT_DEPARTURE_DATE,IN_LOADED,DT_DEADLINE,DT_ETA,TX_MEMO,NR_DEPARTURE_WEEK "&_
     " FROM TPEDIDO_VENDA_NESTLE WHERE TX_PO_CUSTOMER ='"&TX_PO_CUSTOMER&"'"
     objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	 
	'Busca Nome Customer
	if objrsx.State = adStateOpen then objrsx.Close
	sql = "SELECT * FROM  TEMPRESA_EST WHERE CD_EMPRESA='"&objrs.Fields.Item("CD_CUSTOMER").Value&"'"
	'Response.write(sql)
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	if objrsx.eof then
		Customer="Não Informado"
	else
		Customer=objrsx("NM_EMPRESA")
	end if	
	'Pesquisa nome do Local de embarque
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TLOCAL_EMBARQUE where CD_LOCAL_EMB='"&objrs.Fields.Item("CD_PORT_OF_DESTINATION").Value&"'"
	Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	if objrsx.eof then
		Embarque="Não Informado"
	else
		Embarque=objrsx("NM_LOCAL_EMB")
	end if	
	'Pesquisa Modal
	if objrsx.State = adStateOpen then objrsx.Close
    sql="select NM_VIA_TRANSPORTE from TVIA_TRANSPORTE where CD_VIA_TRANSPORTE='"&objrs.Fields.Item("CD_MODAL").value&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   VIA_TRANSPORTE="Não Informado"
	else 
	  VIA_TRANSPORTE=objrsx("NM_VIA_TRANSPORTE")
	End if
	'Pesquisa Production Plant
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TAREA where CD_AREA='"&objrs.Fields.Item("CD_PRODUCTION_PLANT").value&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   PLANT="Não Informado"
	else 
	  PLANT=objrsx("NM_AREA")
	End if
	'Loading Place
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TAREA where CD_AREA='"&objrs.Fields.Item("CD_LOADING_PLACE")&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   LPlace="Não Informado"
	else 
	  LPlace=objrsx("NM_AREA")
	End if
	
	'Seleciona País
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TPAIS_BROKER where CD_PAIS='"&objrs.Fields.Item("CD_COUNTRY")&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   PAIS="Não Informado"
	else 
	  PAIS=objrsx("NM_PAIS")
	End if

	'Seleciona Equipment type
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TTP_CNTR where TP_CNTR='"&objrs.Fields.Item("CD_EQUIP_TYPE")&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   Equipment="Não Informado"
	else 
	  Equipment=objrsx("NM_TP_CNTR")
	End if

	'Vessel / Carrier
	if objrsx.State = adStateOpen then objrsx.Close
	sql="SELECT * FROM TEMBARCACAO where CD_EMBARCACAO='"&objrs.Fields.Item("CD_VESSEL")&"'"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    If objrsx.eof then
	   Vessel="Não Informado"
	else 
	  Vessel=objrsx("NM_EMBARCACAO")
	End if
		


If not objrs.eof then %>
<%    CheckCustomer=0 ' não exibe o restante do cadastro.
    '  Response.Redirect("Listagem.asp?mensagem=Customer já cadastrado!&TpExibir=1")

end if
'----------------------------------------------------------------------------------------------INCLUSÃO
If  request("vTpacao")="Alterar" then
	sql = "UPDATE  TPEDIDO_VENDA_NESTLE SET  "&_
	"NR_1ST_WEEK="&NR_1ST_WEEK&",NR_REVISED_WEEK="&NR_REVISED_WEEK&",TX_ORDER_NUMBER="&TX_ORDER_NUMBER&",DT_ORDER_ISSUE="&fncValSQL(DT_ORDER_ISSUE,1)&", "&_
	"TX_PROFORM_INVOICE="&TX_PROFORM_INVOICE&", "&_
	"TX_DELIVERY_NUMBER="&TX_DELIVERY_NUMBER&", "&_
	"DT_RQT_DELIVERY="&fncValSQL(DT_RQT_DELIVERY,1)&", "&_
	"DT_DELIVERY_ISSUE="&fncValSQL(DT_DELIVERY_ISSUE,1)&", "&_
	"NR_VALORES="&NR_VALORES&", "&_
	"IN_ORDER_CONSOLIDATED="&IN_ORDER_CONSOLIDATED&", "&_
	"CD_MODAL="&fncValSQL(CD_MODAL,0)&", "&_
	"CD_PRODUCTION_PLANT="&CD_PRODUCTION_PLANT&", "&_
	"CD_LOADING_PLACE="&CD_LOADING_PLACE&", "&_
	"CD_CUSTOMER_PLANT="&CD_CUSTOMER_PLANT&", "&_
	"CD_CUSTOMER="&CD_CUSTOMER&", "&_
	"CD_CONSIGNEE="&CD_CONSIGNEE&", "&_
	"CD_COUNTRY="&CD_COUNTRY&", "&_
	"TX_REGION="&TX_REGION&", "&_
	"CD_PORT_OF_DESTINATION="&CD_PORT_OF_DESTINATION&", "&_
	"TX_MONTH_YEAR="&TX_MONTH_YEAR&", "&_
	"DT_LOADING="&fncValSQL(DT_LOADING,1)&", "&_
	"CD_VESSEL="&CD_VESSEL&", "&_
	"CD_EQUIP_TYPE="&CD_EQUIP_TYPE&", "&_
	"DT_ETD="&fncValSQL(DT_ETD,1)&", "&_
	"DT_DEPARTURE_DATE="&fncValSQL(DT_DEPARTURE_DATE,1)&", "&_
	"IN_LOADED="&IN_LOADED&", "&_
	"DT_DEADLINE="&fncValSQL(DT_DEADLINE,1)&", "&_
	"DT_ETA="&fncValSQL(DT_ETA,1)&", "&_
	"TX_MEMO="&TX_MEMO&" WHERE TX_PO_CUSTOMER="&TX_PO_CUSTOMER&""
	
'	Response.Redirect("../../import/teste.asp?var1="&sql&"")
	objcnn.Execute(sql)
	CheckCustomer=1 ' exibe o restante do cadastro.
  %><script>
			alert("Pedido alterado!");
  </script><% 
      Response.Redirect("AlteraOrders.asp?TX_PO_CUSTOMER="&Request("TX_PO_CUSTOMER")&"")

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
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>

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
}
.style7 {font-size: medium}
.style8 {color: #666666}
.style9 {color: #999999}
.style10 {color: #000000; }

-->
</style>
<script type="text/javascript">
function fncValidaForm(form) {
	var b = true;
	//verifica dias e condição
	if (form.nrDias.options[form.nrDias.selectedIndex].value=='' || form.txCondicao.options[form.txCondicao.selectedIndex].value=='' || form.Valor.options[form.Valor.selectedIndex].value=='')  {
		if (form.nrDias.options[form.nrDias.selectedIndex].value=='') {
			alert('Selecione o nr. de dias!');
			form.dtDocs.focus();
		}
		if (form.txCondicao.options[form.txCondicao.selectedIndex].value=='') {
			alert('Selecione o tipo de documento!');
			form.dtDocs.focus();
		}
		b=false;
	}
	
	//validação de data
	dt1 = getValidDate(form.dtDocs.value);
	if (dt1==undefined) {
		form.dtDocs.style.background = 'red';
		alert('Verifique campos data: data inválida!');
		form.dtDocs.style.background = 'white';
		form.dtDocs.select();
		form.dtDocs.focus();
		b=false;
	}
	return b;
	
		if (form.Valor.options[form.Valor.selectedIndex].value=='') {
			alert('Valor!');
			form.Valor.focus();
		}
	return b;
	
	
}
</script>
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body style="overflow:auto;" onload='printpr()'>
<p>&nbsp;</p>
<table width="85%" border="0" align="center" cellpadding="2" cellspacing="1">
  <tr>
    <td width="190" rowspan="5"><img src="/imagens/logo_indaia.gif" alt="Logo Indai&aacute; Log&iacute;stica" width="180" height="69"></td>
    <%
Select Case cd_menu&cd_subm
  Case "0103","0203"
%>
    <td height="20" class="titulo">..::: PO/Orders Control:::..</td>
    <%
	Case Else
%>
    <td colspan="2" height="20" class="titulo"></td>
    <%
End Select
%>
  </tr>
  <tr>
    <td><div align="right">Indai&aacute; Log&iacute;stica Internacional Ltda.</div></td>
  </tr>
  <tr>
    <td><div align="right">Rua XV de Novembro 170</div></td>
  </tr>
  <tr>
    <td><div align="right">CEP: 11010-150<br>
    CNPJ: 58.156.084/0001-37<br>
    Telefone: (013) 3211-4000 Fax: (013) 3211-4020</div></td>
  </tr>
  <tr>
    <td><div align="right"><%= tx_lang_A00012(cd_lang) &" "& FormatDateTime(Date(), vbLongDate) &" "& tx_lang_A00013(cd_lang) &" "& FormatDateTime(Time(), vbShortTime) &" "& tx_lang_A00014(cd_lang) &" "& Session("nm_usuario")%></div></td>
  </tr>
</table>
<script language="javascript" src="/includes/script.js"></script>

<td height="<%=Application("vl_width_header")%>" colspan="2">

<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
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
</td>
<form action="AlteraOrders.asp" name="OrderForm" method="post" onSubmit="return fncValidaForm(this);">
  <table width="85%" border="1" align="center" cellpadding="0" cellspacing="3" bordercolor="#CCCCCC">
    <tr>
      <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left"><span class="style6"><span class="style7">PO Customer: <br>
                  <span class="style8"><%=request("TX_PO_CUSTOMER")%></span></span></span></div></th>
    </tr>
  </table>
  <br>
  <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <th scope="col"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th width="38%" scope="col"><DIV align="left">1st Week</DIV></th>
          <th width="62%" scope="col"><DIV align="left">Revised Week</DIV></th>
        </tr>
        <tr>
          <td height="20"><span class="style9">
            <label><%=objrs.Fields.Item("NR_1ST_WEEK").Value%></label>
          </span></td>
          <td><span class="style9">
            <label><%=objrs.Fields.Item("NR_REVISED_WEEK").Value%>
              <input type="hidden" name="TX_PO_CUSTOMER" id="TX_PO_CUSTOMER" value="<%=objrs.Fields.Item("TX_PO_CUSTOMER")%>" >
              </label>
          </span></td>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="25%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Order Number</div></th>
          <th width="26%" bordercolor="#FFFFFF" scope="col"><div align="left">Order Issue Date</div></th>
          <th width="23%" bordercolor="#FFFFFF" scope="col"><div align="left">Proforma</div></th>
          <th width="26%" bordercolor="#FFFFFF" scope="col"><div align="left">Fatura Comercial</div></th>
        </tr>
        <tr>
          <th width="25%" height="24" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label><%=objrs.Fields.Item("TX_ORDER_NUMBER").Value%></label></th>
          <th width="26%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left" class="style9"><%=objrs.Fields.Item("dt_order_issue")%></div></th>
          <th width="23%" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left"><span class="style9"><%=objrs.Fields.Item("TX_PROFORM_INVOICE")%></span></div></th>
          <th width="26%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left" class="style9"><%=objrs.Fields.Item("TX_INVOICE")%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="37%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Number</div></th>
          <th width="40%" bordercolor="#FFFFFF" scope="col"><div align="left">Request Delivery Date</div></th>
          <th width="23%" bordercolor="#FFFFFF" scope="col"><div align="left">Delivery Issue Date</div></th>
        </tr>
        <tr>
          <th width="37%" height="30" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><div align="left"><%=objrs.Fields.Item("TX_DELIVERY_NUMBER")%><span class="style9"></span></div>            <span class="style9"><div align="left"></div>
            </label>
          </span></th>
          <th width="40%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left" class="style9">
            <div align="left"><%=objrs.Fields.Item("DT_RQT_DELIVERY")%></div>
          </div></th>
          <th width="23%" valign="top" bordercolor="#FFFFFF" scope="col"> <div align="left" class="style9">
            <div align="left"><%=objrs.Fields.Item("DT_DELIVERY_ISSUE")%></div>
          </div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" class="pgridsub" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Valores</div></th>
          <th width="18%" height="14" scope="col">&nbsp;</th>
          <th width="49%" scope="col"><div align="left"></div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=formatnumber(objrs.Fields.Item("NR_VALORES"),2)%></div></th>
          <th height="20" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th scope="col" width="49%"> <div align="left" class="style9"></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" class="pgridsub" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left" class="style10">Modal</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left"><span class="style9"><span class="style10"></span></span>Order Consolidated</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=VIA_TRANSPORTE%></div></th>
          <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left"><span class="style9"></span><span class="style9"><%=objrs.Fields.Item("IN_ORDER_CONSOLIDATED")%></span></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Production Plant</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Loading Place</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=PLANT%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=LPlace%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Plant Code (CU)</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Customer Descr                (importer / invoice  to)</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"> <%=objrs.Fields.Item("CD_CUSTOMER_PLANT")%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=CUSTOMER%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Final Customer                  (consignee / ship to)</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Country (ship to)</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=objrs.Fields.Item("CD_CONSIGNEE")%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=PAIS%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" class="pgridsub" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Region (invoice to)</div></th>
          <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Port of Destination</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=objrs.Fields.Item("TX_REGION")%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=Embarque%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" class="pgridsub" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Month/year</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Revised Loading Date</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=objrs.Fields.Item("TX_MONTH_YEAR")%></div></th>
          <th height="24" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#CCCCCC" scope="col" width="49%"> <div align="left" class="style9"><%=objrs.Fields.Item("DT_LOADING")%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="pgridsub">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Vessel  / Carrier</div></th>
          <th width="18%" height="12" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Equipment type</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=Vessel%></div></th>
          <th height="20" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=Equipment%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">ETD</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Departure Date</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=objrs.Fields.Item("dt_etd")%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9"><%=objrs.Fields.Item("dt_departure_date")%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Loaded</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Dead line</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"> <%=objrs.Fields.Item("IN_LOADED")%></div></th>
          <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"><div align="left" class="style9"><%=objrs.Fields.Item("DT_DEADLINE")%>&nbsp;</div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
        <tr>
          <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">ETA</div></th>
          <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
          <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Week Departure</div></th>
        </tr>
        <tr>
          <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left" class="style9"><%=objrs.Fields.Item("dt_eta")%></div></th>
          <th height="24" bordercolor="#FFFFFF" scope="col" width="18%"><span class="style9">
            <label></label>
          </span></th>
          <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left" class="style9">
            <label></label>
            <%=objrs.Fields.Item("NR_DEPARTURE_WEEK")%></div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><table width="99%" border="0" class="pgridsub" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
        <tr>
          <th height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Comments</div></th>
        </tr>
        <tr>
          <th height="26" valign="top" bordercolor="#FFFFFF" scope="col"><label></label>
                <div align="left"><%=objrs.Fields.Item("TX_MEMO")%><br>
              </div></th>
        </tr>
      </table></th>
    </tr>
    <tr>
      <th scope="col"><input name="vTpAcao" type="hidden" id="vTpAcao" value="Alterar"></th>
    </tr>
    <tr>
      <th scope="col">&nbsp;</th>
    </tr>
  </table>
  <p><!--#include file="cclistaItens.asp" -->
&nbsp;</p>
  <p>&nbsp;</p>
  <p align="center">
    <label></label>
    <!--Scrollable iframe script- By Dynamic Drive-->
    <!--For full source code and more DHTML scripts, visit http://www.dynamicdrive.com-->
    <!--This credit MUST stay intact for use-->
  </p>
</form>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<script> 
function printpr() 
{ 
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>'; 
document.body.insertAdjacentHTML('beforeEnd', WebBrowser); 
WebBrowser1.ExecWB(7, 1); 
} 
</script> 

