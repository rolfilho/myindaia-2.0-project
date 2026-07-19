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

<%'


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
Dim CheckInclusao,tp_filtro

'tp_filtro = 1=1st Week, 2=Revised Week, 3=Order, 4=Revised Loading Date

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

<style type="text/css">
<!--
.style2 {font-size: x-small}
.style3 {font-size: 10px color: #000000}
.style5 {color: #FFFFFF; font-weight: bold; }

<!--
#apDiv1 {
	left: -320;
}
#apDiv5 {
	position:absolute;
	width:233px;
	height:66px;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:2;
	left: 273px;
	top: 69px;
}
#apDiv6 {
	position:absolute;
	width:367px;
	height:18px;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:2;
	left: 138px;
	top: 201px;
}
.style6 {color: #FF0000}
.style7 {font-size: 10px}
.style9 {font-size: 9px}
.style13 {font-size: small}
-->
</style>
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body>
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
      <!--#include virtual="/includes/lay_menu.asp" -->
<style type="text/css">
<!--
#apDiv1 {
	left: -320;
}

#apDiv3 {
	left: -320;}

#apDiv4 {
	left: -320;}
#apDiv7 {
visibility:hidden}
-->
</style>
<%if request("CheckInclusao")=1 then%>
<style type="text/css">
#apDiv7 {visibility:visible
}
</style>
<%End if
%> 
  <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: --></td><br>
<div id="dv_corpo" class="divMainMidOrders">
<table width="95%"  align="center" border="0" cellpadding="0" cellspacing="0"  bordercolor="#58849F" style="padding: 0px 1px 0px 1px;">
  <tr>
    <td colspan="8" valign="top"  width="100%" bgcolor="#FFFFFF"><div align="center" W>
      <h3>..::: Orders Control:::..</h3>
    </div></td>
  </tr>
  
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" >&nbsp;</td>
  </tr>
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" ><table width="100%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
      <tr>
        <th width="4%" height="50" bordercolor="#FFFFFF" scope="col"><a href="Listagem.asp?CheckInclusao=1"><img src="../../imagens/icones/32x32/btn_novo.jpg" alt="Incluir Pedido" width="32" height="32" border="0" onClick=""></a></th>
        <th width="4%" bordercolor="#FFFFFF" scope="col"><div align="left"><a href="Listagem.asp"><img src="../../imagens/icones/32x32/btn_listar.gif" alt="Atualizar lista de pedidos" width="32" height="32" border="0"></a></div></th>
        <th width="9%" bordercolor="#FFFFFF" scope="col"></th>
        <th width="40%" bordercolor="#FFFFFF" scope="col"><div id="apDiv7">
          <form name="form2" method="post" action="AlteraOrders.asp?vTpacao=Incluir">
            <table width="78%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <th scope="col"><div align="center">Digite o PO Customer a ser cadastrado</div></th>
              </tr>
              <tr>
                <td><div align="center">
                  <input name="TX_PO_CUSTOMER" type="text" class="editbox" id="TX_PO_CUSTOMER" value="<%=request("TX_PO_CUSTOMER")%>" size="15" maxlength="15" >
                  <input type="image" src="../../imagens/icones/16x16/Up.gif" alt="Incluir" width="17" height="17" value="Submit();"></div></td>
              </tr>
            </table>
            </form>
        </div></th>
        <th width="43%" bordercolor="#FFFFFF" scope="col"><table width="93%" border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <th width="26%" scope="col"><DIV align="left">Revised </DIV></th>
              <th width="24%" scope="col"><div align="left" class="style9">1st Week</div></th>
              <th width="24%" scope="col"><div align="left" class="style9">Revised Week</div></th>
              <th width="26%" scope="col"> <div align="left" class="style9">PO. Customer</div></th>
            </tr>
            <tr>
              <td valign="top"><form name="Revised" method="post" action="listagem.asp?tp_filtro=4">
                <label>
                <input name="Revised" class="editBox" type="text" id="Revised" size="10" maxlength="10"    onBlur="submit()">
                </label>
                <a href="javascript:showCal('Calendario13')"><img src="/imagens/icones/16x16/calenda.gif" alt="Filtrar por Revised Loading Date" width=16 height=16 border=0 align="absmiddle" id="dt_order_issue"></a>
                <div align="left"><a href="javascript:showCal('Calendario3')"></a>                                </div>
              </form>                <a href="javascript:showCal('Calendario3')"></a></td>
              <td height="26" valign="top"><select name="jumpMenu" id="jumpMenu" class="editBox" onChange="MM_jumpMenu('parent',this,0)">
                <option value="listagem.asp">Selecione</option>
                <option value="listagem.asp">Todas</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=01">01</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=02">02</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=03">03</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=04">04</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=05">05</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=06">06</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=07">07</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=08">08</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=09">09</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=10">10</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=11">11</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=12">12</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=13">13</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=14">14</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=15">15</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=16">16</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=17">17</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=18">18</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=19">19</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=20">20</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=21">21</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=22">22</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=23">23</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=24">24</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=25">25</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=26">26</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=27">27</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=28">28</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=29">29</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=30">30</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=31">31</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=32">32</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=33">33</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=34">34</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=35">35</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=36">36</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=37">37</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=38">38</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=39">39</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=40">40</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=41">41</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=42">42</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=43">43</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=44">44</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=45">45</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=46">46</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=47">47</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=48">48</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=49">49</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=50">50</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=51">51</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=52">52</option>
                <option value="listagem.asp?tp_filtro=1&NR_1ST_WEEK=53">53</option>






              </select></td>
              <td valign="top"><select name="jumpMenu2" id="jumpMenu2" class="editBox" onChange="MM_jumpMenu('parent',this,0)">
                <option value="listagem.asp">Selecione</option>
                <option value="listagem.asp">Todas</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=01">01</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=02">02</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=03">03</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=04">04</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=05">05</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=06">06</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=07">07</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=08">08</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=09">09</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=10">10</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=11">11</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=12">12</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=13">13</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=14">14</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=15">15</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=16">16</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=17">17</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=18">18</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=19">19</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=20">20</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=21">21</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=22">22</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=23">23</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=24">24</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=25">25</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=26">26</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=27">27</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=28">28</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=29">29</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=30">30</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=31">31</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=32">32</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=33">33</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=34">34</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=35">35</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=36">36</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=37">37</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=38">38</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=39">39</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=40">40</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=41">41</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=42">42</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=43">43</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=44">44</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=45">45</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=46">46</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=47">47</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=48">48</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=49">49</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=50">50</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=51">51</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=52">52</option>
                <option value="listagem.asp?tp_filtro=2&NR_REVISED_WEEK=53">53</option>
              </select></td>
              <td valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <th width="94%" height="24" valign="top" scope="col"><form name="form3" method="post" action="listagem.asp?tp_filtro=3">
                    <div align="left">
                      <input name="TX_PO_CUSTOMER" type="text" id="TX_PO_CUSTOMER" size="10" class="editBox" maxlength="15">
                      <input type="image" value="Submit();" src="../../imagens/icones/button_view.gif" alt="buscar" width="14" height="13" >
                      </div>
                  </form> </th>
                  <th width="6%" valign="top" scope="col">&nbsp;</th>
                </tr>
              </table></td>
            </tr>
        </table></th>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td colspan="8" valign="top" bgcolor="#FFFFFF" ><table width="100%" border="0" cellspacing="5">
      <tr>
        <th valign="top" scope="col"><div align="left"> Registros existentes para filtros selecionados.<br>
          Clique na ordem desejada para visualizar/Alterar as informa&ccedil;&otilde;es. </div></th>
      </tr>
    </table></td>
  </tr>
<!--#include file="cclistaOrders.asp" -->
<br>
</td><%if nrec>0 then%>
<table width="95%" border="0" align="CENTER" cellpadding="0" cellspacing="1" bordercolor="#58849F" style="border: solid 1px #336699;">
  <tr>
    <td bgcolor="#336699"><span class="style5">Total de Orders encontrados: <%=nrec%>&nbsp;</span></td>
  </tr>
</table>
<div align="center">
  <%else%>
  <table width="66%" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <th scope="col"><div align="left"><span class="style13">Clique no botão incluir para inciar a utilização do sistema</span></div></th>
    </tr>
  </table>
  <%end if%>
</div>
<p class="style3 style3">&nbsp;</p>
  <p>  </p>
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
<div class="style6 style7" id="apDiv6"><%=request("mensagem")%></div>
