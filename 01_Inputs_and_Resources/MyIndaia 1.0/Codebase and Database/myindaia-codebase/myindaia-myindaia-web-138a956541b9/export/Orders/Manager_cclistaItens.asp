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

dim  sql_o
dim vNrOrder

If  request("vTpacao")="deletar" then%>
  <%sql="DELETE  tpedido_venda_item_nestle WHERE TX_PO_CUSTOMER ="&request("TX_PO_CUSTOMER")&""
  objcnn.Execute(sql)
    vTpacao=" "
  %><script>
			document.location='Listagem.asp';
  </script><% 
  Response.Redirect("Listagem.asp")
end if



'lista Orders´s para exibição
if objrs.State = adStateOpen then objrs.Close()
'SELECT 
sql_s = "SELECT CD_MATERIAL,DT_PRODUCTION,DT_RELEASE,NR_QTY_REAL,NR_QTY_PLANNED,NR_NET_WEIGTH,NR_GROSS_WEIGTH,NR_NET_VOLUME,NR_GROSS_VOLUME "

sql_f = "FROM tpedido_venda_item_nestle TP (NOLOCK) "
'sql_w = "WHERE"
sql_o = "ORDER BY NR_ITEM_PO"

'verifica o cargo do usuario
'if InStr("040;055;060", Session("cd_cargo")) > 0 then
'	sql_f = sql_f&" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
'end if

sql = sql_s & sql_f & sql_o
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
.style17 {color: #FFFFFF; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; }
.style18 {font-size: x-small}
.style19 {color: #FFFFFF}
-->
</style>
<table width="148%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#336699" style="padding: 2px 2px 0px 2px;">
	<tr height="18">
		<td width="146" class="gridtit"><span class="style17 style9 style18 style18">C&oacute;d.Material</span></td>
	  <td width="197" class="gridtit"><span class="style17 style9 style18 style18">Categoria do Produto</span></td>
	  <td width="192" class="gridtit"> <span class="style17 style9 style18 style18">Data da produ&ccedil;&atilde;o</span></td>
	  <td width="204" class="gridtit"> <span class="style17 style9 style18 style18">Data da Libera&ccedil;&atilde;o</span></td>
	  <td width="143" class="gridtit" ><span class="style17 style9 style18 style18">Quantidade Real</span></td>
	  <td width="149" class="gridtit style9 style18"><span class="style5 style9 style18 style18">Qtdade Planejada</span></td>
	  <td width="261" class="gridtit style9 style18"><span class="style5 style9 style18 style18">Peso L&iacute;quido</span></td>
	  <td width="46" class="gridtit style9 style18"><span class="style5 style9 style18 style18">Peso Bruto</span></td>
	  <td width="23" class="gridtit style9 style18"><span class="style5 style9 style18 style18">Vol.L&iacute;quido</span></td>
	  <td width="93" class="gridtit style9 style18"><span class="style5 style9 style18 style18">Volume Bruto</span></td>
	  <td width="93" class="gridtit style9 style18"><div align="center" class="style9 style18 style18"><span class="style19">Excluir</span>&nbsp;</div></td>
	</tr>
	<%
if objrs.RecordCount > 0 then
	nrec = 0
	'do while nrec < objrs.PageSize and not objrs.Eof
	do while not objrs.Eof

		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
		vNrOrder = objrs.Fields.Item("dt_release").Value
        vNrOrder=objrs.Fields.Item("dt_release").Value

%>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
		<td><a href="alteraOrders.asp?TX_PO_CUSTOMER=<%=objrs.Fields.Item("dt_release").Value%>" class="style9 style18 style18"><%=objrs.Fields.Item("dt_release").Value%></a></td>
		<td><span class="style18"></span></td>
		<td><span class="style9 style18 style18"><%=objrs.Fields.Item("DT_PRODUCTION").Value%></span></td>
		<td align="left"><span class="style9 style18 style18"><%=objrs.Fields.Item("DT_RELEASE").Value%></span></td>
		<td><span class="style9 style18 style18"><%=objrs.Fields.Item("NR_QTY_REAL").Value%></span></td>
		<td align="left"><span class="style9 style18 style18"><%=objrs.Fields.Item("NR_QTY_PLANNED").Value%></span></td>
		<td> <span class="style9 style18 style18"><%=objrs.Fields.Item("NR_NET_WEIGTH").Value%><nobr></nobr></span></td>
		<td><span class="style9 style18 style18"><%=objrs.Fields.Item("NR_GROSS_WEIGTH").Value%></span></td>
		<td><span class="style9 style18 style18"><%=objrs.Fields.Item("NR_NET_VOLUME").Value%></span></td>
		<td><span class="style9 style18 style18"><%=objrs.Fields.Item("NR_GROSS_VOLUME").Value%></span></td>
		<td><a href="listagem.asp?cd_menu=<%= cd_menu%>&amp;cd_subm=<%= cd_subm%>&amp;cd_docto=<%= cd_docto%>&amp;vNrOrder=<%= vNrOrder%>&amp;vTpAcao=deletar " class="style9 style18 style18" onclick="return confirm('Você deseja realmente excluir este registro?')" ><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir" ></a></td>
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
