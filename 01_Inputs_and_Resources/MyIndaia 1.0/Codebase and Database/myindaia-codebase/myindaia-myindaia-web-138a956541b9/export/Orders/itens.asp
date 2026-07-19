<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Sistema Orders Nestlé
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 25/07/2008
'---------------------------------------------------------------------------
%>
<%
Dim CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGHT,NR_NET_VOLUME,NR_GROSS_VOLUME
Dim rstTemp,rs,intpagina,intrec
'CD_MATERIAL= Request.form("CD_MATERIAL")
'DT_PRODUCTION= Request.form("DT_PRODUCTION")
'DT_RELEASE= Request.form("DT_RELEASE")
'NR_QTY_REAL= Request.form("NR_QTY_REAL")
'NR_QTY_PLANNED= Request.form("NR_QTY_PLANNED")
'NR_NET_WEIGTH= Request.form("NR_NET_WEIGTH")
'NR_GROSS_WEIGHT= Request.form("NR_GROSS_WEIGHT")
'NR_NET_VOLUME= Request.form("NR_NET_VOLUME")
'NR_GROSS_VOLUME= Request.form("NR_GROSS_VOLUME")

'--------------------------------------------------------------------------------------------------------------------------
'sql= "SELECT TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME "&_
'     " FROM tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER =3 order by CD_MATERIAL"
'     RS.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText


Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 999
%>

<html xmlns="http://www.w3.org/1999/xhtml">
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
	width:321px;
	height:26px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 593px;
	top: 300px;
}
-->
</style>
</head>
<body>
<% 
'Efetuando a conexão com a base de dados criada -----------------------
'Set Conn = Server.CreateObject("AdoDb.Connection") 
'Conn.provider="Microsoft.Jet.OLEDB.4.0" 
'Conn.connectionstring=Server.Mappath("/coluna_asp/db /clientes.mdb") 
'Conn.open 
'--------------------------------------------------------------------------

'criando o objeto Record Set -> neste caso é necessário declará-lo,
'pois vamos utilizar algumas funções deste objeto 
Set RS = Server.CreateObject("adodb.recordset")

RS.PageSize = 1 'quantidade de registros por página. 

'Vamos fazer a busca na tabela 
sql= "SELECT TX_PO_CUSTOMER,CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME "&_
     " FROM tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER =3 order by CD_MATERIAL"
     RS.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'Vamos agora verificar exceções do tipo “fim de arquivo” (EOF), se a página atual é menor 
'que zero, se é maior que o número total de páginas, etc.
IF RS.EOF then 
   Response.Write "nenhum registro encontrado"
   Response.End 'paramos o programa
ELSE
   'Definindo em qual pagina o visitante está
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
'Fim das verificações de exceções

'Usamos a propriedade AbsolutePage para dizer ao RS que página ele esta 
RS.AbsolutePage=intpagina

' Inicia (zera) o contador que vai controlar os registros mostrados
intrec=0

'Enquanto o contador for menor que a quantidade de registros mostrados ou
' não for o final do arquivo 
While intrec < RS.PageSize and not RS.EOF 
'------------------- AQUI VEM TUDO O QUE SEÁ PAGINADO -----------------------
%>
<table width="85%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF" class="editbox">
<tr>
  <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><table width="98%" border="0" cellspacing="1" cellpadding="2">
    <tr>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_novo.jpg" alt="-" width="16" height="16" /></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_salvar.gif" alt="-" width="16" height="16" /></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_cancelar.gif" alt="-" width="16" height="16" /></th>
      <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_excluir.gif" alt="-" width="16" height="16" /></th>
      <th bordercolor="#FFFFFF" bgcolor="#FFFFFF" scope="col"><div align="right"></div></th>
    </tr>
  </table></td>
</tr>
<tr>
  <td bordercolor="#FFFFFF" bgcolor="#336699"><span class="style1">Material Information</span></td>
</tr>
<tr>
          <td bordercolor="#FFFFFF"><table width="68%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <th width="27%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">C&oacute;d. Material</div></th>
                <th width="26%" bordercolor="#FFFFFF" scope="col"><div align="left">Categoria Produto</div></th>
                <th width="47%" bordercolor="#FFFFFF" scope="col"><div align="left">Data da Produ&ccedil;&atilde;o</div></th>
              </tr>
              <tr>
                <th width="27%" height="26" align="left" bordercolor="#FFFFFF" scope="col"><label>
                  <input name="CD_MATERIAL" type="text" class="editbox" id="CD_MATERIAL" tabindex="3" value="<%=RS.Fields.Item("CD_MATERIAL").Value%>" >
                </label></th>
                <th bordercolor="#FFFFFF" scope="col" width="26%"> <div align="left">
                    <input type="text" name="DT_ORDER_ISSUE" id="DT_ORDER_ISSUE" class="editbox" tabindex="4">
                </div></th>
                <th bordercolor="#FFFFFF" scope="col" width="47%"> <div align="left">
                    <input type="text" name="DT_PRODUCTION" id="DT_PRODUCTION" class="editbox" tabindex="4" value="<%=RS.Fields.Item("DT_PRODUCTION")%>">
                </div></th>
              </tr>
          </table></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF"><table width="65%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <th width="28%" height="16" bordercolor="#FFFFFF" scope="col"><div align="left">Data da libera&ccedil;&atilde;o</div></th>
                <th width="28%" bordercolor="#FFFFFF" scope="col"><div align="left">Quantidade Real</div></th>
                <th width="44%" bordercolor="#FFFFFF" scope="col"><div align="left">Quantidade Planejada</div></th>
              </tr>
              <tr>
                <th width="28%" height="26" align="left" bordercolor="#FFFFFF" scope="col"><label>
                  <input type="text" name="DT_RELEASE" id="DT_RELEASE" class="editbox"  tabindex="5" value="<%=RS.Fields.Item("DT_RELEASE")%>">
                </label></th>
                <th bordercolor="#FFFFFF" scope="col" width="28%"> <div align="left">
                    <input type="text" name="NR_QTY_REAL" id="NR_QTY_REAL" class="editbox" tabindex="6" value="<%=RS.Fields.Item("NR_QTY_REAL")%>">
                </div></th>
                <th bordercolor="#FFFFFF" scope="col" width="44%"> <div align="left">
                    <input type="text" name="NR_QTY_PLANNED" id="NR_QTY_PLANNED" class="editbox" tabindex="7" value="<%=RS.Fields.Item("NR_QTY_PLANNED")%>">
                </div></th>
              </tr>
          </table></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Peso L&iacute;quido</div></th>
                <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
                <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Peso Bruto</div></th>
              </tr>
              <tr>
                <th bordercolor="#FFFFFF" scope="col" width="33%"><div align="left">
                    <input type="text" name="NR_NET_WEIGTH" id="NR_NET_WEIGTH" class="editbox" tabindex="8" value="<%=RS.Fields.Item("NR_NET_WEIGTH")%>">
                </div></th>
                <th height="26" bordercolor="#FFFFFF" scope="col" width="18%"><label></label></th>
                <th bordercolor="#FFFFFF" scope="col" width="49%"> <div align="left">
                    <input type="text" name="NR_GROSS_WEIGTH" id="NR_GROSS_WEIGTH" tabindex="9" class="editbox" value="<%=RS.Fields.Item("NR_GROSS_WEIGTH")%>">
                </div></th>
              </tr>
          </table></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF"><table width="99%" border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <th width="33%" bordercolor="#FFFFFF" scope="col"><div align="left">Volume L&iacute;quido</div></th>
                <th width="18%" height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
                <th width="49%" bordercolor="#FFFFFF" scope="col"><div align="left">Volume Bruto</div></th>
              </tr>
              <tr>
                <th align="left" bordercolor="#FFFFFF" scope="col"><label>
                  <input name="NR_NET_VOLUME" type="text" id="NR_NET_VOLUME" class="editbox" value="<%=RS.Fields.Item("NR_NET_VOLUME")%>">
                </label></th>
                <th height="16" bordercolor="#FFFFFF" scope="col">&nbsp;</th>
                <th align="left" bordercolor="#FFFFFF" scope="col"><label>
                  <input name="NR_GROSS_VOLUME" type="text" id="NR_GROSS_VOLUME" class="editbox" value="<%=RS.Fields.Item("NR_GROSS_VOLUME")%>">
                </label></th>
              </tr>
              <tr> </tr>
          </table></td>
  </tr>
        <tr>
          <td valign="top" bordercolor="#FFFFFF"><input type="hidden" name="TX_PO_CUSTOMER" id="TX_PO_CUSTOMER" value="<%=RS.Fields.Item("TX_PO_CUSTOMER")%>" ></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF"><input name="vTpAcao" type="hidden" id="vTpAcao" value="Alterar"></td>
  </tr>
        <tr>
          <td bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="apDiv222">
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
IF intpagina > 1 then 
%>
  <a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=1"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a><a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=<%=intpagina-1%>"><img src="/imagens/icones/16x16/pag_prior_off.gif"  width="19" height="16" border="0" align="absmiddle"></a>
  <% 
END IF

'Se não estivermos no último registro contado, então é mostrado o link p/ a próxima página 
IF strcomp(intpagina,RS.PageCount) <> 0 then 
%>
  <a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=request("TX_PO_CUSTOMER")%>&pagina=<%=intpagina + 1%>"><img src="/imagens/icones/16x16/pag_next_off.gif"  width="19" height="16" border="0" align="absmiddle"></a> <img src="/imagens/icones/16x16/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle">
  <% 
END IF
%>
<%=request("pagina")%> of <%=(RS.PageCount)%></div>
</body>
