<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<link href="/includes/styles.css" rel="stylesheet" type="text/css">

<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Sistema Orders Nestlé
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 25/07/2008
'---------------------------------------------------------------------------
%>
<%
'--------------------------------------------------------------------------------------------------------------------------
Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 999

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
#apDiv2 {
	position:absolute;
	width:200px;
	height:115px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:2;
}
.style8 {
	font-size: xx-small
}
-->
</style>
<head>
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-weight: bold;
}
#apDiv1 {
	position:absolute;
	width:200px;
	height:115px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
}
#apDiv111 {
	left: -320;
    top:20;
}
#apDiv222 {
	left: -320;
	top:200;
	position:absolute;
	width:322px;
	height:26px;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 847px;
	top: 48px;
}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.style4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10; }
.style7 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #CCCCCC; }
.edtDisabled {	background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:450px;
}

.edtCatDisabled {	background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:250px;
}

-->
</style>
</head>
<body onLoad="PreencheFormItens();">
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<div align="center">
  <p>
    <script language="javascript" src="/includes/script.js"></script>
    <script type="text/javascript" src="/engine/calendar.js"></script>
    <script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
    <script type="text/javascript" src="/engine/calendar-setup.js"></script>
    <script language="javascript" src="/includes/script_calendario.js"></script>
    <script language="javascript" src="/includes/script_cal_conf.js"></script></p>
  <table width="95%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <th scope="col"><div align="left"><span class="style3">
        <% 
'Efetuando a conex&atilde;o com a base de dados criada -----------------------
'Set Conn = Server.CreateObject("AdoDb.Connection") 
'Conn.provider="Microsoft.Jet.OLEDB.4.0" 
'Conn.connectionstring=Server.Mappath("/coluna_asp/db /clientes.mdb") 
'Conn.open 
'--------------------------------------------------------------------------

'criando o objeto Record Set -> neste caso &eacute; necess&aacute;rio declar&aacute;-lo,
'pois vamos utilizar algumas fun&ccedil;&otilde;es deste objeto 

Dim NR_ITEM_PO,TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME
Dim rstTemp,rs,intpagina,intrec,pagina
Dim vTpAcao

TX_PO_CUSTOMER= Request.form("TX_PO_CUSTOMER")
NR_ITEM_PO= Request.form("NR_ITEM_PO")
CD_MATERIAL= Request.form("CD_MATERIAL")
DT_PRODUCTION= Request.form("DT_PRODUCTION")
DT_RELEASE= Request.form("DT_RELEASE")
NR_QTY_REAL= Request.form("NR_QTY_REAL")
NR_QTY_PLANNED= Request.form("NR_QTY_PLANNED")
NR_NET_WEIGTH= Request.form("NR_NET_WEIGTH")
NR_GROSS_WEIGTH= Request.form("NR_GROSS_WEIGTH")
NR_NET_VOLUME= Request.form("NR_NET_VOLUME")
NR_GROSS_VOLUME= Request.form("NR_GROSS_VOLUME")


Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 1 'quantidade de registros por p&aacute;gina. 

'Vamos fazer a busca na tabela 
sql= "SELECT NR_ITEM_PO,TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME "&_
     " FROM tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER ='"&Replace(request("TX_PO_CUSTOMER"),"'","0")&"' order by NR_ITEM_PO"
	  'response.Write(sql)

     RS.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'::::::::::::::::::::::::::::: EXCLUIR :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  url="?TX_PO_CUSTOMER="&Request("TX_PO_CUSTOMER")&"&NR_ITEM_PO="&Request("NR_ITEM_PO")&"&pagina="&Request.form("pagina")&""
  
If  request("vTpacao")="deletar" then
NR_ITEM_PO=rs("NR_ITEM_PO")
 sql="DELETE  TPEDIDO_VENDA_ITEM_NESTLE WHERE TX_PO_CUSTOMER='"&request("TX_PO_CUSTOMER")&"' and NR_ITEM_PO='"&request("NR_ITEM_PO")&"'"
 'response.Write(sql)
  objcnn.Execute(sql)
  %>
        <script>
			//alert("&Iacute;tem exclu&iacute;do!")
			 window.location.replace("AlteraItens.asp<%=url%>");
        </script>
        <% 
end if
'::::::::::::::::::::::::::::: ALTERAR :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	 
If  request("vTpacao")="Alterar" then
	sql = "UPDATE  tpedido_venda_item_nestle SET  "&_
	"CD_MATERIAL="&fncValSQL(CD_MATERIAL,0)&",DT_PRODUCTION="&fncValSQL(DT_PRODUCTION,1)&",DT_RELEASE="&fncValSQL(DT_RELEASE,1)&",NR_QTY_REAL="&fncValSQL(NR_QTY_REAL,3)&", "&_
	"NR_QTY_PLANNED="&fncValSQL(NR_QTY_PLANNED,3)&", "&_
	"NR_NET_WEIGTH="&fncValSQL(NR_NET_WEIGTH,3)&", "&_
	"NR_GROSS_WEIGTH="&fncValSQL(NR_GROSS_WEIGTH,3)&", "&_
	"NR_NET_VOLUME="&fncValSQL(NR_NET_VOLUME,3)&", "&_
	"NR_GROSS_VOLUME="&fncValSQL(NR_GROSS_VOLUME,3)&" "&_
	"WHERE TX_PO_CUSTOMER='"&TX_PO_CUSTOMER&"' and NR_ITEM_PO='"&NR_ITEM_PO&"'"
'response.Write(sql)
'	Response.Redirect("../../import/teste.asp?var1="&sql&"")
	objcnn.Execute(sql)
  %>
        <script>
			//alert("ítem alterado!")
			 window.location.replace("AlteraItens.asp<%=url%>");

        </script>
        <% 
End if

'Vamos agora verificar exce&ccedil;&otilde;es do tipo &ldquo;fim de arquivo&rdquo; (EOF), se a p&aacute;gina atual &eacute; menor 
'que zero, se &eacute; maior que o n&uacute;mero total de p&aacute;ginas, etc.
IF RS.EOF then 
   Response.Write "N&atilde;o h&aacute; &iacute;tens para este Pedido!"%>
        <img src="file:///B|/ProjetosTI/myteste/imagens/SetaAnimada.gif" width="14" height="14">:: <a href="IncluiItens.asp?TX_PO_CUSTOMER=<%=Request("TX_PO_CUSTOMER")%>">Clique aqui para incluir novos &iacute;tens</a> ::
        <%Response.End 'paramos o programa
ELSE
   'Definindo em qual pagina o visitante est&aacute;
   IF Request.QueryString("pagina")="" then 
      intpagina=1 
   ELSE
      IF cint(Request.QueryString("pagina"))<1 then
         intpagina=1 
      ELSE
         IF cint(Request.QueryString("pagina"))> RS.PageCount then 
            intpagina=RS.PageCount 
         ELSE
            intpagina=Request.QueryString("pagina")
         END IF
      END IF
   END IF
END IF
'Fim das verifica&ccedil;&otilde;es de exce&ccedil;&otilde;es

'Usamos a propriedade AbsolutePage para dizer ao RS que p&aacute;gina ele esta 
RS.AbsolutePage=intpagina

' Inicia (zera) o contador que vai controlar os registros mostrados
intrec=0

'Enquanto o contador for menor que a quantidade de registros mostrados ou
' n&atilde;o for o final do arquivo 
While intrec < RS.PageSize and not RS.EOF 
'------------------- AQUI VEM TUDO O QUE SE&Aacute; PAGINADO -----------------------
%>
      </span></div></th>
    </tr>
  </table>
</div>
<form name="AlteraItem" method="post" action="AlteraItens.asp">
<table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" class="editbox">

<tr>
  <td bordercolor="#FFFFFF" bgcolor="#336699"><span class="style1">Material Information</span></td>
</tr>
<tr>
  <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
    <tr>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><a href="IncluiItens.asp?TX_PO_CUSTOMER=<%=RS.Fields.Item("TX_PO_CUSTOMER")%>&pagina=<%=(RS.PageCount)%>"><img src="../../imagens/icones/16x16/btn_novo.jpg" alt="Incluir novo &iacute;tem" width="16" height="16" border="0" /></a></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><input type="image" name="btnSalvar" src="../../imagens/icones/16x16/btn_salvar.gif" alt="Salvar altera&ccedil;&otilde;es neste &iacute;tem" width="16" height="16" border="0"  value="Submit();"/></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=1"><img src="../../imagens/icones/16x16/btn_cancelar.gif" alt="Cancela altera&ccedil;&otilde;es n&atilde;o salvas." width="16" height="16" border="0" /></a></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&NR_ITEM_PO=<%=RS.Fields.Item("NR_ITEM_PO")%>&pagina=<%=request("pagina")%>&vTpAcao=deletar "><img src="../../imagens/icones/16x16/btn_excluir.gif" alt="Excluir este &iacute;tem." width="16" height="16" border="0" /></a></th>
      <th bordercolor="#FFFFFF" bgcolor="#FFFFFF" scope="col">&nbsp;</th>
    </tr>
  </table></td>
</tr>
<tr>
          <td bordercolor="#FFFFFF"><table width="98%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <th width="52%" height="12" bordercolor="#FFFFFF" scope="col"><div align="left">&Iacute;tem Nr.: <%=RS.Fields.Item("NR_ITEM_PO")%></div></th>
                <th width="48%" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th height="12" colspan="2" bordercolor="#FFFFFF" scope="col"><div align="left" class="style3">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    
                    <tr>
                      <th width="100%" colspan="3" scope="col"><table width="95%" height="13" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                          <th width="9%" scope="col"><div align="left" class="style8">C&oacute;d. Material</div></th>
                          <th width="52%" scope="col"><div align="left" class="style8">Produto</div></th>
                          <th width="39%" scope="col"><div align="left" class="light">Categoria</div></th>
                        </tr>
                      </table></th>
                    </tr>
                  </table>
                </div>
                <div align="left"></div>                  <div align="left" class="style3"></div></th>
            </tr>
              <tr>
                <th height="20" colspan="2" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label>
                  <%'     FastLookup(vTabela,           vCampos,        vReturn, vCodigo, vEdit)%>
                  <input name="cd_material" type="text" class="editbox" id="cd_material" tabindex="3"  value="<%=RS.Fields.Item("cd_material")%>" onBlur="BuscaCategoria('tmercadoria_exp','cd_mercadoria','NM_MERCADORIA',this,'nm_mercadoria','categoria');"   size="11" maxlength="3">
                  <input name='nm_mercadoria' type='text' class='edtDisabled' size="100"  readonly >
                  <input name='categoria' id="categoria" type='text' class='edtCatDisabled' readonly>
    <%					str = "ConsultaOnLineSQL(10,'C&oacute;digo,Descri&ccedil;&atilde;o,ap_mercadoria,vl_unitario,cd_grupo','CD_MERCADORIA','cd_material','');"
%>
                  <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label>
                  <%str = "ConsultaOnLineSQL(17,'C&oacute;digo,Descri&ccedil;&atilde;o,ap_mercadoria,vl_unitario,cd_grupo','CD_CATEGORIA_TEXTIL','cd_categoria','');"%></th>
              </tr>
              
              <tr>
                <th height="35" colspan="2" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><table width="67%" border="0" cellspacing="1" cellpadding="0">
                  <tr>
                    <th width="38%" scope="col"><div align="left"><span class="style3">Release Date</span></div></th>
                    <th width="62%" scope="col"><div align="left"><span class="style3">Production date</span></div></th>
                  </tr>
                  <tr>
                    <td height="20" valign="top"><input name="dt_release" type="text" class="editbox" id="dt_release"  tabindex="5" onKeyUp="AplicaMascara('XX/XX/XXXX', this);" value="<%=RS.Fields.Item("dt_release")%>" size="10" maxlength="10" >
                    <a href="javascript:showCal('CalendarioItem1')"><img src="/imagens/icones/16x16/calenda.gif" alt="Calend&aacute;rio" name="dt_order_issue" width=16 height=16 border=0 align="absmiddle" id="dt_order_issue"></a></td>
                    <td valign="top"><input name="dt_production" type="text" class="editbox" id="dt_production" tabindex="4" onKeyUp="AplicaMascara('XX/XX/XXXX', this);" value="<%=RS.Fields.Item("dt_production")%>" size="10" maxlength="10" >
                    <a href="javascript:showCal('CalendarioItem2')"><img src="/imagens/icones/16x16/calenda.gif" alt="Calend&aacute;rio" name="dt_order_issue2" width=16 height=16 border=0 align="absmiddle" id="dt_order_issue2"></a></td>
                  </tr>
                </table></th>
              </tr>
      </table></td>
  </tr>
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
          <tr>
                <th width="38%" height="12" bordercolor="#FFFFFF" scope="col"><div align="left" class="style3">PUM Quantity Real</div></th>
            <th width="62%" bordercolor="#FFFFFF" scope="col"><div align="left" class="style3">PUM Quantity Planned</div></th>
            </tr>
              <tr>
                <th width="38%" height="20" bordercolor="#FFFFFF" scope="col"> <div align="left">
                  <input name="NR_QTY_REAL" type="text" class="editbox" id="NR_QTY_REAL" tabindex="6" onBlur="ValidaValor(this);" value="<%=Formatnumber(RS.Fields.Item("NR_QTY_REAL"),2)%>" maxlength="16" >
                </div></th>
<th bordercolor="#FFFFFF" scope="col" width="62%"> <div align="left">
                    <input name="NR_QTY_PLANNED" type="text" class="editbox" id="NR_QTY_PLANNED" tabindex="7" onBlur="ValidaValor(this);" value="<%=FormatNumber(RS.Fields.Item("NR_QTY_PLANNED"),2)%>" maxlength="16" >
                </div></th>
            </tr>
          </table></td>
  </tr>
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
  <tr>
                <th width="38%" height="12" bordercolor="#FFFFFF" class="style3" scope="col"><div align="left" class="style4">PUM Unit Net Weigth</div></th>
            <th width="62%" bordercolor="#FFFFFF" class="style3" scope="col"><div align="left" class="style4">PUM Unit Net Gross</div></th>
            </tr>
              <tr>
                <th width="38%" height="20" bordercolor="#FFFFFF" scope="col"><div align="left">
                    <input name="NR_NET_WEIGTH" type="text" class="editbox" id="NR_NET_WEIGTH" tabindex="8" onBlur="ValidaValor(this);" value="<%=FormatNumber(RS.Fields.Item("NR_NET_WEIGTH"),2)%>" maxlength="16" >
                </div></th>
<th bordercolor="#FFFFFF" scope="col" width="62%"> <div align="left">
                    <input name="NR_GROSS_WEIGTH" type="text" class="editbox" id="NR_GROSS_WEIGTH" tabindex="9" onBlur="ValidaValor(this);" value="<%=FormatNumber(RS.Fields.Item("NR_GROSS_WEIGTH"),2)%>" maxlength="16">
                </div></th>
            </tr>
          </table></td>
  </tr>
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
      <tr>
                <th width="38%" height="12" valign="top" bordercolor="#FFFFFF" class="style3" scope="col"><div align="left">Volume (Net)</div></th>
            <th width="62%" valign="top" bordercolor="#FFFFFF" class="style3" scope="col"><div align="left">Volume (Gross)</div></th>
            </tr>
              <tr>
                <th height="20" align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label>
                  <input name="NR_NET_VOLUME" type="text" class="editbox" id="NR_NET_VOLUME" tabindex="10" onBlur="ValidaValor(this);" value="<%=FormatNumber(RS.Fields.Item("NR_NET_VOLUME"),2)%>" maxlength="16" >
                </label></th>
              <th align="left" valign="top" bordercolor="#FFFFFF" scope="col"><label>
                  <input name="NR_GROSS_VOLUME" type="text" class="editbox" id="NR_GROSS_VOLUME" tabindex="11" onBlur="ValidaValor(this);" value="<%=FormatNumber(RS.Fields.Item("NR_GROSS_VOLUME"),2)%>" maxlength="16">
                </label></th>
              </tr>
              
          </table></td>
  </tr>
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><input name="vTpAcao" type="hidden" id="vTpAcao" value="Alterar">
          <input name="TX_PO_CUSTOMER" type="hidden" id="TX_PO_CUSTOMER" value="<%=RS.Fields.Item("TX_PO_CUSTOMER")%>">
          <input type="hidden" name="NR_ITEM_PO" id="NR_ITEM_PO" value="<%=RS.Fields.Item("NR_ITEM_PO")%>" >
          <input name="pagina" type="hidden" id="pagina" value="<%=request("pagina")%>"></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF"><div align="right" class="style7">
            <div align="left">PO Customer: <%=request("TX_PO_CUSTOMER")%></div>
          </div></td>
  </tr>
</table>
</form>

<div class="style3" id="apDiv222">
  <%'---------------------------------------------------------------------------------------------
   RS.MoveNext

   ' Acrescenta +1 ao contador
   intrec=intrec+1 
   'Se for EOF (fim de arquivo), imprimir branco na tela
   IF RS.EOF then 
      response.write " " 
   END IF
Wend 'fim do loop

'Vamos verificar se não é a página 1, para podermos colocar o link “anterior”. 
IF intpagina > 1 then%>
  <a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=1"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a><a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=<%=intpagina-1%>"><img src="/imagens/icones/16x16/pag_prior_off.gif"  width="19" height="16" border="0" align="absmiddle"></a><%=intpagina%>
<%Else%>
  <img src="/imagens/icones/16x16/pag_first_no.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"><img src="/imagens/icones/16x16/pag_prior_no.gif"  width="19" height="16" border="0" align="absmiddle"><%=intpagina%>
<%END IF

'Se não estivermos no último registro contado, então é mostrado o link p/ a próxima página 
IF strcomp(intpagina,RS.PageCount) <> 0 then%> 

  <a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&NR_ITEM_PO=<%=request("NR_ITEM_PO")%>&pagina=<%=intpagina + 1%>"><span class="style3"></span> <%if request("pagina")<>"" then%>
 <%'if intpagina=1 then%><%'=intpagina%><%'end if%> of  <%=(RS.PageCount)%>
  <%end if%><img src="/imagens/icones/16x16/pag_next_off.gif"  width="19" height="16" border="0" align="absmiddle"></a> <a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&NR_ITEM_PO=<%=request("NR_ITEM_PO")%>&pagina=<%=(RS.PageCount)%>"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
<%Else%> of <%=intpagina%><img src="/imagens/icones/16x16/pag_next_no.gif"  width="19" height="16" border="0" align="absmiddle"> <img src="/imagens/icones/16x16/pag_last_no.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle">  
<%END IF%>

  </div>
</body>
<!--*****************************************************************************************-->
<!--DO NOT REMOVE BELOW SCRIPT. IT SHOULD ALWAYS APPEAR AT THE VERY END OF YOUR CONTENT-->

<script language="JavaScript1.2">

//Scrollable content III- By http://www.dynamicdrive.com

var speed, currentpos=curpos1=0,alt=1,curpos2=-1

function initialize(){
if (window.parent.scrollspeed!=0){
speed=window.parent.scrollspeed
scrollwindow()
}
}

function scrollwindow(){
temp=(document.all)? document.body.scrollTop : window.pageYOffset
alt=(alt==0)? 1 : 0
if (alt==0)
curpos1=temp
else
curpos2=temp

window.scrollBy(0,speed)
}

setInterval("initialize()",10)

</script>


<script language="javascript"  type="text/javascript">

function BuscaCategoria(vTabela, vCampos, vReturn, vCodigo, vEdit, vEdit2) {
	if (document.getElementById) {
	//alert("teste");
		//recupera os objetos do form que vamos trabalhar
		var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
		var vDesc2 = document.getElementById(vEdit2); //edit onde será colocada a descrição
		var vCod = vCodigo.value; //código que iremos pesquisar na tabela
		if (vCod != '' || vCod != undefined) {
			vCod = vCod.replace(" ","");
			if (vCod.length > 0 && vCod != 0) {
				//validamos o código para que ele tenha o tamanho certo defindo na tabela
				for (i = vCod.length; i < vCodigo.maxLength; i++)
					vCod = '0'+ String(vCod);
				vCodigo.value = vCod;
				//iniciamos a busca através do ajax
				var ajax = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax.open("GET","/popup/fast_lookup.asp?vTabela="+vTabela+"&vCampos="+vCampos+"&vReturn="+vReturn+"&vCodigo="+vCod, true); 
				ajax.onreadystatechange = function() {
					if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
						vDesc.value = "processando...";
					}
					if(ajax.readyState == 4) { //agora exibe o que interessa
						if(ajax.status == 200) {
							var vResult = ajax.responseText; //resultado da busca
							if (vResult.indexOf('erro')!=0) {
								vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
								vResult = unescape(vResult); //continua resolvendo problemas de acento
								vDesc.value = vResult;
							} else {
								var vColor = vCodigo.style.background;
								vCodigo.style.background = '#FFDDDD';
								alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
								vCodigo.style.background = vColor;
								vCodigo.focus();
								vDesc.value = "";
							}
						} else {
							alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
							vDesc.value = "";
							vCodigo.focus();
						}
					}
				}
				vAux = "SELECT F.NM_FAMILIA_PROD FROM TFAMILIA_PROD F, TMERCADORIA_EXP M WHERE M.CD_MERCADORIA ="+vCod+" AND F.CD_FAMILIA_PROD = M.CD_FAMILIA_PROD";
				//iniciamos a busca através do ajax
				var ajax2 = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax2.open("GET","/popup/fast_lookup.asp?vTabela=&vCampos=&vReturn=&vCodigo=&vInstrucao="+vAux, true); 
				ajax2.onreadystatechange = function() {
					
				  if(ajax2.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
					  vDesc2.value = "Processando...";
				  }
					if(ajax2.readyState == 4) { //agora exibe o que interessa
						if(ajax2.status == 200) {
							var vResult2 = ajax2.responseText; //resultado da busca
							if (vResult2.indexOf('erro')!=0) {
								vResult2 = vResult2.replace(/\+/g," "); //resolve problemas de acentos
								vResult2 = unescape(vResult2); //continua resolvendo problemas de acento
								vDesc2.value = vResult2;
							} 
						} 
					} 
				}
				ajax.send(null); // submete
				ajax2.send(null); // submete
			} 
			else if (vCod != '') {
				alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
				vDesc.value = ""
			}
		}
	}
}

</script>

<script language="javascript"  type="text/javascript">
function PreencheFormItens(vTpAcao) {
	//if ( '<%'= objrs.Fields.Item("cd_material")%>'  != '')     document.AlteraItem.categoria.focus();

	document.AlteraItem.cd_material.focus();
	document.AlteraItem.dt_release.focus();
	
}
</script>

<!--#include virtual="/includes/inc_ends.asp" -->