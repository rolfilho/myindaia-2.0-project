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
'sql= "SELECT TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME "&_
'     " FROM tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER =3 order by CD_MATERIAL"
'     Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText


Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 999

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.edtDisabled {background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.style4 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10; }
-->
</style>
<head>
<style type="text/css">
<!--
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
	width:264px;
	height:26px;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 738px;
	top: 36px;
}
.style7 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}
.style8 {font-size: x-small}
.style9 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #FFFFFF;}
-->
</style>
</head>
<body>
<script language="javascript" src="/includes/script.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>

<span class="style8">
<% 
'Efetuando a conexão com a base de dados criada -----------------------
'Set Conn = Server.CreateObject("AdoDb.Connection") 
'Conn.provider="Microsoft.Jet.OLEDB.4.0" 
'Conn.connectionstring=Server.Mappath("/coluna_asp/db /clientes.mdb") 
'Conn.open 
'--------------------------------------------------------------------------

'criando o objeto Record Set -> neste caso é necessário declará-lo,
'pois vamos utilizar algumas funções deste objeto 

Dim NR_ITEM_PO,TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME
Dim rstTemp,rs,intpagina,intrec,pagina
Dim CD_CATEGORIA_TEXTIL

TX_PO_CUSTOMER= Replace(request.form("TX_PO_CUSTOMER"),"'","0")
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

RS.PageSize = 1 'quantidade de registros por página. 

	 
'::::::::::::::::::::::::::::: EXCLUIR :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  url="?TX_PO_CUSTOMER="&Request("TX_PO_CUSTOMER")&"&NR_ITEM_PO="&Request("NR_ITEM_PO")&"&pagina="&Request.form("pagina")&""
  
If  request("vTpacao")="Incluir" then
     'if NR_ITEM_PO="" OR CD_MATERIAL="" or DT_PRODUCTION="" or DT_RELEASE="" or NR_QTY_REAL="" or NR_QTY_PLANNED=""  or  NR_NET_WEIGTH="" or NR_GROSS_WEIGTH="" or NR_NET_VOLUME="" or NR_GROSS_VOLUME="" then%>
	    <script>
		//	alert("Preencha os campos em branco"); TX_PO_CUSTOMER=Replace(request("TX_PO_CUSTOMER"),"'","0")

			//history.back();
		</script>

	 <%'End if
	sql= "SELECT NR_ITEM_PO FROM tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER ='"&Replace(request.form("TX_PO_CUSTOMER"),"'","0")&"' and NR_ITEM_PO='"&request.form("NR_ITEM_PO")&"'"
		'Response.write(sql)
		 RS.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		 
		 If not rs.eof then %>
			<script>
				alert("Ítem já cadastrado");
				history.back();
			</script>
		<%end if
	
	 sql="INSERT INTO  TPEDIDO_VENDA_ITEM_NESTLE (NR_ITEM_PO,TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME)" &_
          " VALUES   ("&fncValSQL(NR_ITEM_PO,0)&","&fncValSQL(TX_PO_CUSTOMER,0)&","&fncValSQL(CD_MATERIAL,0)&","&fncValSQL(DT_PRODUCTION,1)&","&fncValSQL(DT_RELEASE,1)&","&fncValSQL(NR_QTY_REAL,3)&","&fncValSQL(NR_QTY_PLANNED,3)&","&fncValSQL(NR_NET_WEIGTH,3)&","&fncValSQL(NR_GROSS_WEIGTH,3)&","&fncValSQL(NR_NET_VOLUME,3)&","&fncValSQL(NR_GROSS_VOLUME,3)&")"
	'Response.Redirect("../../import/teste.asp?var1="&sql&"")
	objcnn.Execute(sql)
  %>
<script>
			//alert("Ítem Incluído!")
			 window.location.replace("AlteraItens.asp<%=url%>");
  </script>
<% 
 ' Response.Redirect("Listagem.asp")
end if
'------------------- TABELA PARA INSERÇÃO DOS DADOS -----------------------
%>
</span>
<form action="IncluiItens.asp" method="post" name="AlteraItem" id="AlteraItem">
<table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"  class="editbox">

<tr>
  <td bordercolor="#FFFFFF" bgcolor="#336699" class="style8"><span class="style9">Material Information</span></td>
</tr>
<tr>
  <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
    <tr>
      <th width="3%" bordercolor="#FFFFFF" class="style8" scope="col"><input type="image" name="btnSalvar" src="../../imagens/icones/16x16/btn_salvar.gif" alt="Salvar" width="16" height="16" border="0"  value="Submit();"/></th>
      <th width="3%" bordercolor="#FFFFFF" class="style8" scope="col"><a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=Request("TX_PO_CUSTOMER")%>"><img src="../../imagens/icones/16x16/btn_cancelar.gif" alt="Cancelar a edi&ccedil;&atilde;o e retornar para rela&ccedil;&atilde;o de &iacute;tens." width="16" height="16" border="0" /></a></th>
      <th width="3%" bordercolor="#FFFFFF" class="style8" scope="col"><a href="AlteraItens.asp?TX_PO_CUSTOMER=<%=Request("TX_PO_CUSTOMER")%>"></a></th>
      <th width="3%" bordercolor="#FFFFFF" class="style8" scope="col">&nbsp;</th>
      <th bordercolor="#FFFFFF" bgcolor="#FFFFFF" scope="col"><div align="right" class="style7">Inclus&atilde;o de &iacute;tem para pedido No.: <%=request("TX_PO_CUSTOMER")%>&nbsp;</div></th>
    </tr>
  </table></td>
</tr>
<tr>
          <td bordercolor="#FFFFFF"><table width="96%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              
              <tr>
                <th height="16" colspan="2" bordercolor="#FFFFFF" scope="col"><div align="left">
                  <label>
				     <%
					 TX_PO_CUSTOMER=Replace(request("TX_PO_CUSTOMER"),"'","0")
					 sql="select max(NR_ITEM_PO) as ultimo from tpedido_venda_item_nestle where TX_PO_CUSTOMER='"&TX_PO_CUSTOMER&"'"
                     Objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                     NR_ITEM_PO=Objrs("ultimo")+1
                    if isnull(NR_ITEM_PO) then
						NR_ITEM_PO=1
					end if
					%>

                     <input type="hidden" name="NR_ITEM_PO" id="NR_ITEM_PO" value="<%=NR_ITEM_PO%>">ítem Nr.:<%=NR_ITEM_PO%> </label>
                </div></th>
                <th bordercolor="#FFFFFF" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th width="24%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left"></div></th>
                <th width="30%" bordercolor="#FFFFFF" scope="col"> <div align="left"></div></th>
                <th width="46%" bordercolor="#FFFFFF" scope="col"><div align="left"></div></th>
              </tr>
              <tr>
                <th height="16" colspan="3" bordercolor="#FFFFFF" scope="col"><table width="66%" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr>
                    <th width="14%" scope="col"><div align="left">C&oacute;d. Material</div></th>
                    <th width="28%" scope="col"><div align="left">Produto</div></th>
                    <th width="58%" scope="col"><div align="left">Categoria</div></th>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <th height="22" colspan="3" align="left" bordercolor="#FFFFFF" scope="col"><label>    <%'     FastLookup(vTabela,           vCampos,        vReturn, vCodigo, vEdit)%>
                  <input name="cd_material" type="text" class="editbox" id="cd_material" tabindex="1" onBlur="BuscaCategoria('tmercadoria_exp','cd_mercadoria','NM_MERCADORIA',this,'nm_mercadoria','categoria');"  size="10" maxlength="3">
                    <input name='nm_mercadoria' type='text' class='edtDisabled' size="100"  readonly >
                    <input name='categoria' type='text' class='edtDisabled' id="categoria" size="70" readonly>
<%					str = "ConsultaOnLineSQL(10,'C&oacute;digo,Descri&ccedil;&atilde;o,Mercadoria,Valor unitario,Grupo','CD_MERCADORIA','cd_material','');"
%>
                  <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></label>
				  <%str = "ConsultaOnLineSQL(17,'C&oacute;digo,Descri&ccedil;&atilde;o,mercadoria,Valor unitario, Grupo','CD_CATEGORIA_TEXTIL','cd_categoria','');"%>
                <div align="left"></div> <div align="left"></div></th>
              </tr>
      </table></td>
  </tr>
        <tr>
          <td height="37" bordercolor="#FFFFFF"><table width="66%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <th width="41%" scope="col"><div align="left"><span class="style3">Release Date</span></div></th>
              <th width="59%" scope="col"><div align="left"><span class="style3">Production date</span></div></th>
            </tr>
            <tr>
              <td><input name="dt_release" type="text" class="editbox" id="dt_release"  tabindex="2" onKeyUp="AplicaMascara('XX/XX/XXXX', this);" value="<%=request("dt_release")%>" size="10" maxlength="10" >
              <a href="javascript:showCal('CalendarioItem1')"><img id="dt_order_issue" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></td>
              <td><input name="dt_production" type="text" class="editbox" id="dt_production" tabindex="3" onKeyUp="AplicaMascara('XX/XX/XXXX', this);" value="<%=request("dt_production")%>" size="10" maxlength="10" >
              <a href="javascript:showCal('CalendarioItem2')"><img id="dt_order_issue2" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="49" bordercolor="#FFFFFF"><table width="66%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <th width="41%" scope="col"><div align="left"><span class="style3">PUM Quantity Real</span></div></th>
              <th width="59%" scope="col"><div align="left"><span class="style3">PUM Quantity Planned</span></div></th>
            </tr>
            <tr>
              <td><input name="nr_qty_real" type="text" class="editbox" id="nr_qty_real" tabindex="8" value="<%=FormatNumber(request("nr_qty_real"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
              <td><input name="nr_qty_planned" type="text" class="editbox" id="nr_qty_planned" tabindex="9" value="<%=FormatNumber(request("nr_qty_planned"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="37" bordercolor="#FFFFFF"><table width="66%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <th width="41%" scope="col"><div align="left"><span class="style4">PUM Unit Net Weigth</span></div></th>
              <th width="59%" scope="col"><div align="left"><span class="style4">PUM Unit Net Gross</span></div></th>
            </tr>
            <tr>
              <td><input name="nr_net_weigth" type="text" class="editbox" id="nr_net_weigth" tabindex="10" value="<%=FormatNumber(request("nr_net_weigth"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
              <td><input name="nr_gross_weigth" type="text" class="editbox" id="nr_gross_weigth" tabindex="11" value="<%=FormatNumber(request("nr_gross_weigth"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
            </tr>
          </table></td>
  </tr>
        <tr>
          <td height="42" bordercolor="#FFFFFF"><table width="66%" border="0" cellspacing="1" cellpadding="0">
            <tr>
              <th width="41%" scope="col"><div align="left">Volume (Net)</div></th>
              <th width="59%" scope="col"><div align="left">Volume (Gross)</div></th>
            </tr>
            <tr>
              <td><input name="nr_net_volume" type="text" class="editbox" id="nr_net_volume"  tabindex="12" value="<%=FormatNumber(request("nr_net_volume"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
              <td><input name="NR_GROSS_VOLUME" type="text" class="editbox" tabindex="13" id="NR_GROSS_VOLUME" value="<%=FormatNumber(request("NR_GROSS_VOLUME"),2)%>" maxlength="16" onBlur="ValidaValor(this);"></td>
            </tr>
          </table></td>
        </tr>
        
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><input name="vTpAcao" type="hidden" id="vTpAcao" value="Incluir">
          <input name="TX_PO_CUSTOMER" type="hidden" id="TX_PO_CUSTOMER" value="<%=request("TX_PO_CUSTOMER")%>">
          <input name="pagina" type="hidden" id="pagina" value="<%=request("pagina")+1%>"></td>
        </tr>
        <tr>
          <td bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</form>
</body>
<script language="javascript"  type="text/javascript">

function BuscaCategoria(vTabela, vCampos, vReturn, vCodigo, vEdit, vEdit2) {
	if (document.getElementById) {
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
					  vDesc2.value = "PROCESSANDO...";
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
/*				//iniciamos a busca através do ajax
				var ajax3 = openAjax();
				//usado o GET para que se possa usar filtros querystring
				ajax3.open("GET","/popup/fast_lookup.asp?vTabela=TFAMILIA_PROD&vCampos=CD_FAMILIA_PROD&vReturn=NM_FAMILIA_PROD&vCodigo="+vAux,true);
				ajax3.onreadystatechange = function() {
					
					if(ajax3.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
						vDesc3.value = "teste...";
					}
					if(ajax3.readyState == 4) { //agora exibe o que interessa
						if(ajax3.status == 200) {
							var vResult3 = ajax3.responseText; //resultado da busca
							if (vResult3.indexOf('erro')!=0) {
								vResult3 = vResult3.replace(/\+/g," "); //resolve problemas de acentos
								vResult3 = unescape(vResult3); //continua resolvendo problemas de acento
								vDesc3.value = vResult3;
							} 
						} 
					}
				}*/
				ajax.send(null); // submete
				ajax2.send(null); // submete
//				ajax3.send(null); // submete
			} 
			else if (vCod != '') {
				alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
				vDesc.value = ""
			}
		}
	}
}


<!--
//function BuscaCategoria(vTpAcao) {
  //var vTpAcao;
  //var cd_categoria;
//  FastLookup('TMERCADORIA_EXP','CD_MERCADORIA','NM_MERCADORIA',vTpAcao,'nm_mercadoria')
//  FastLookup('TMERCADORIA_EXP','CD_MERCADORIA','cd_familia_prod',vTpAcao,'cd_categoria')
//  pausecomp(2000) 
//  document.AlteraItem.cd_categoria.maxlenght=document.AlteraItem.cd_categoria.length;  
//  document.AlteraItem.cd_categoria.focus();
//  document.AlteraItem.dt_release.focus();

  //var vDesc = '00000003';
  //alert(vDesc);

///  FastLookup('tfamilia_prod','cd_familia_prod','NM_FAMILIA_PROD',vTpAcao,'categoria');
 /// return vTpAcao;
  
  //Funcionando-----------------------------------
  //alert(vTpAcao);
  //var vTpAcao;
  //FastLookup('TMERCADORIA_EXP','CD_MERCADORIA','cd_familia_prod',vTpAcao,'cd_categoria');
  //alert(vTpAcao);
  //return vTpAcao;
  //Funcionando-----------------------------------  

//}

function PreencheCategoria(vTpAcao) {
  var vTpAcao;
  
  //alert(vTpAcao);
  return vTpAcao;
}


-->
</script>
