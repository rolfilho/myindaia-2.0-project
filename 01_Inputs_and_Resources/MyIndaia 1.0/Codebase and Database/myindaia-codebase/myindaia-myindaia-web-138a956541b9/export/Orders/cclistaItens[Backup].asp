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
.style9 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style20 {font-size: xx-small}
.style29 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF; }
.style30 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; color: #FFFFFF;}
.style31 {color: #FFFFFF}
.style32 {font-size: xx-small; color: #FFFFFF;}
-->
</style>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <th scope="col"><div align="left">Material Information</div></th>
  </tr>
</table>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#336699" style="padding: 2px 2px 0px 2px;">

	<tr height="18">
		<td width="86" class="style32"><div align="left">Code</div></td>
	    <td width="41" class="style32">Mercadoria</td>
      <td width="38" class="style32">Categoria</td>
	  <td width="98" class="style32">Production date</td>
	  <td width="82" class="style32">Release Date</td>
	  <td width="84" class="style32" >Qt.  Real</td>
	  <td width="108" class="style32">Qt.  Planned</td>
	  <td width="95" class="style32">Unit Net Weigth</td>
	  <td width="106" class="style32">Unit Net gross</td>
	  <td width="97" class="style32">Volume net</div></td>
	  <td width="113" class="style32">Volume gross</td>
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
		<td height="20" class="style20"><div align="left"><%=objrs.Fields.Item("CD_MATERIAL").Value%></div></td>
		<td class="style20 style20"><div align="left"></div></td>
		<td class="style20 style20"><div align="left"></div></td>
	  <td class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("DT_PRODUCTION").Value%></span></div></td>
	  <td align="left" class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("DT_RELEASE").Value%></span></div></td>
	  <td class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_QTY_REAL").Value%></span></div></td>
	  <td align="left" class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_QTY_PLANNED").Value%></span></div></td>
	  <td class="style20"> <div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_NET_WEIGTH").Value%></span></div>	    <span class="style20 style20 style20"><nobr></nobr></span></td>
	  <td class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_GROSS_WEIGTH").Value%></span></div></td>
	  <td class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_NET_VOLUME").Value%></span></div></td>
	  <td class="style20"><div align="left"><span class="style20 style20 style20"><%=objrs.Fields.Item("NR_GROSS_VOLUME").Value%></span></div></td>
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
