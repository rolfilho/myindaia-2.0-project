<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Sistema Orders Nestlé
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 25/07/2008
'---------------------------------------------------------------------------

Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim  sql_o,customer,embarque,dt_loading
dim vnrorder,tx_order_number,nr_1st_week,nr_revised_week,tx_po_customer,totalregistros
'tp_busca = tipo de busca (buscar por Po, por Order ou First Week, Revised Week

If  request("vTpacao")="deletar" then%>
  <%sql="DELETE  tpedido_venda_nestle WHERE TX_PO_CUSTOMER ='"&request("vNrOrder")&"'"
  objcnn.Execute(sql)
  
  sql="DELETE  tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER ='"&request("vNrOrder")&"'"
  objcnn.Execute(sql)
 %><script>
			document.location='Listagem.asp?vTpacao=0';
  </script><% 
  Response.Redirect("Listagem.asp")
end if



'lista Orders´s para exibição
if objrs.State = adStateOpen then objrs.Close()
'SELECT ANTIGO
sql_s = "SELECT NR_1ST_WEEK,CD_CUSTOMER,NR_REVISED_WEEK,DT_LOADING,TX_PO_CUSTOMER,TX_ORDER_NUMBER,TX_INVOICE,CD_CUSTOMER,CD_PORT_OF_DESTINATION "
sql_f = "FROM TPEDIDO_VENDA_NESTLE TP (NOLOCK) "
'tp_filtro = 1=1st Week, 2=Revised Week, 3=Order
tp_filtro= request("tp_filtro")
Select Case tp_filtro
	Case "1"
		sql_w = "WHERE NR_1ST_WEEK= "&request("NR_1ST_WEEK")&" "
	Case "2"
		sql_w = "WHERE NR_REVISED_WEEK= "&request("NR_REVISED_WEEK")&" "
	Case "3"		
	    TX_PO_CUSTOMER=request("TX_PO_CUSTOMER")
		If TX_PO_CUSTOMER=""  then  
		%><script>
			document.location='Listagem.asp?mensagem=Digite um PO. Customer para pesquisa!';
		</script><% 
		end if
		sql_w = "WHERE TX_PO_CUSTOMER= '"&request("TX_PO_CUSTOMER")&"' "
	Case "4"
	    DT_LOADING=request("Revised")
		If DT_LOADING=""  then  
		%><script>
			document.location='Listagem.asp?mensagem=Selecione uma data para pesquisa!';
		</script><% 
		end if
		sql_w = "WHERE DT_LOADING= '"&request("Revised")&"' "
End Select
if request("order")="" then
      sql_o = "ORDER BY TX_PO_CUSTOMER"
else
   sql_o = "ORDER BY "&request("order")&""
End if	
'response.Write( sql_s & sql_f & sql_w & sql_o)
'verifica o cargo do usuario
'if InStr("040;055;060", Session("cd_cargo")) > 0 then
'	sql_f = sql_f&" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
'end if

sql = sql_s & sql_f & sql_w & sql_o
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
with objcmd
	.CommandTimeOut = 60
	.CommandText    = sql
	.CommandType    = adCmdText
end with
'objrs.PageSize = nr_reg_pagina
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'objrs.AbsolutePage = CInt(pagina)
%>
<style type="text/css">
<!--
.style5 {color: #FFFFFF; font-weight: bold; }
.style9 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style18 {font-size: x-small}
.style19 {color: #FFFFFF}
.style21 {color: #FFFFFF; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: xx-small; }
.style22 {font-size: xx-small}
-->
</style><%if objrs.RecordCount>0 then%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#336699" style="padding: 2px 2px 0px 2px;">
	<tr height="18">
	  <td width="38"  class="gridtit"  align="center"><span class="style21">PO Customer</span></td>
	  <td width="38"  class="gridtit" ><span class="style21">1st <br />Week</span></td>
	  <td width="53"  class="gridtit" ><span class="style21">Revised <br />Week</span></td>
	  <td width="183" class="gridtit" ><span class="style21">Revised<br /> loading date</span></td>
	  <td width="183" class="gridtit" ><span class="style21">Order <br />Number</span></td>
	  <td width="163" class="gridtit" ><span class="style21">Invoice<br /> Number</span></td>
	  <td width="232" class="gridtit" ><span class="style21">Customer</span></td>
	  <td width="100" class="gridtit" ><span class="style21">Destination</span></td>
	  <td width="50"  class="gridtit"  align="center"><span class="style21">Quantidade de &Iacute;tens</span></td>
	  <td width="50"  class="gridtit" ><span class="style21">Duplicar</span></td>
	  <td width="50"  class="gridtit"><span class="style21">Excluir</span>&nbsp;</td>
	</tr>
	<%end if
	
if objrs.eof then
'tp_filtro = 1=1st Week, 2=Revised Week, 3=Order
Select Case tp_filtro
	Case "1"
		mensagem = "Nenhum registro encontrado para 1st Week solicitada  "
		%><script>document.location='Listagem.asp?vTpacao=0&mensagem=<%=mensagem%>';</script><% 
	Case "2"
		mensagem = "Nenhum registro encontrado para Revised Week solicitada "%><script>document.location='Listagem.asp?vTpacao=0&mensagem=<%=mensagem%>';</script><% 
	Case "3"		
		mensagem = "Nenhum registro encontrado para Order solicitada  "%><script>document.location='Listagem.asp?vTpacao=0&mensagem=<%=mensagem%>';</script><% 
	Case "4"		
		mensagem = "Nenhum registro encontrado para a data solicitada  "%><script>document.location='Listagem.asp?vTpacao=0&mensagem=<%=mensagem%>';</script><% 
End Select
End if	
if objrs.RecordCount > 0 then
	nrec = 0
	do while not objrs.Eof
		if objrsv.State = adStateOpen then objrsv.Close
	    sql="select * from tpedido_venda_item_nestle where TX_PO_CUSTOMER='"&objrs.Fields.Item("TX_PO_CUSTOMER").Value&"'"
		objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
         TotalRegistros=objrsv.RecordCount 

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

		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
		vNrOrder = objrs.Fields.Item("CD_CUSTOMER").Value
        vNrOrder=objrs.Fields.Item("TX_PO_CUSTOMER").Value

%>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
	  <td align="left"><a href="alteraOrders.asp?TX_PO_CUSTOMER=<%=objrs.Fields.Item("TX_PO_CUSTOMER").Value%>&amp;vTpacao=Exibir"><strong><%=objrs.Fields.Item("TX_PO_CUSTOMER").Value%></strong></a></td>
		<td align="left"><%=objrs.Fields.Item("NR_1ST_WEEK").Value%></td>
		<td align="left"><%=objrs.Fields.Item("NR_REVISED_WEEK").Value%></td>
	    <td align="left"><%=objrs.Fields.Item("DT_LOADING").Value%></td>
      <td align="left"><%=objrs.Fields.Item("TX_ORDER_NUMBER").Value%></td>
		<td align="left"><%=objrs.Fields.Item("TX_INVOICE").Value%></td>
		<td align="left"><%=Customer%></td>
		<td align="left"> <%=Embarque%><nobr></nobr></td>
		<td align="left"><%=TotalRegistros%></td>
		<td align="left"><div align="center"><a href="AlteraOrders.asp?vTpacao=Duplicar&amp;TX_PO_CUSTOMER=<%=objrs.Fields.Item("TX_PO_CUSTOMER").Value%>"><img src="../../imagens/icones/16x16/btn_duplicar.gif" alt="Clique aqui para duplicar esta Order e seus &iacute;tens" width="16" height="16" border="0" /></a></div></td>
		<td align="left"><div align="center"><a href="listagem.asp?cd_menu=<%= cd_menu%>&amp;cd_subm=<%= cd_subm%>&amp;cd_docto=<%= cd_docto%>&amp;vNrOrder=<%= vNrOrder%>&amp;vTpAcao=deletar " onclick="return confirm('Você deseja realmente excluir este registro?')" ><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir" ></a></div></td>
	</tr>
	<%
		nrec = nrec + 1
		objrs.MoveNext
		if objrs.Eof then Exit Do
	loop
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='9' align='left'>&nbsp;Clique no Código da Order para edita-la</td>"&_
						"</tr>"
	'Response.Write(Server.URLEncode(vTxHTML))
else
	vTxHTML = "<tr height='16' class='gridtit'>"&_
						"<td colspan='9' align='left'>&nbsp;Não existem Orders para serem exibidas. Clique em Nova Order para incluir.&nbsp;</td>"&_
						"</tr>"
	'Response.Write(Server.URLEncode(vTxHTML))
	
end if
objrs.Close()
%>
</table>
