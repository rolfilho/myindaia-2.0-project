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
dim Mercadoria,Categoria,cd_mercadoria,cd_familia_prod

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
sql_w = "WHERE TX_PO_CUSTOMER='"&request("TX_PO_CUSTOMER")&"'"
sql_o = "ORDER BY NR_ITEM_PO"

'verifica o cargo do usuario
'if InStr("040;055;060", Session("cd_cargo")) > 0 then
'	sql_f = sql_f&" INNER JOIN TPERMISSAO P ( NOLOCK ) ON (P.CD_CLIENTE = R.CD_EXPORTADOR AND P.CD_USUARIO = '"&Session("cd_usuario")&"') "
'end if

sql = sql_s & sql_f &sql_w& sql_o
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
<link href="/includes/styles.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.style20 {font-size: xx-small}
.style32 {font-size: xx-small; color: #FFFFFF;}
.style42 {color: #000000}
.style48 {font-size: xx-small; color: #000000; font-weight: bold; }
.style49 {color: #FFFFFF}
.style51 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style52 {font-size: xx-small; font-family: Verdana, Arial, Helvetica, sans-serif; }
-->
</style>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <th height="28" bgcolor="#0066CC" scope="col"><div align="left" class="style49">
      <table width="53%" border="0" cellspacing="2" cellpadding="2">
        <tr>
          <th scope="col"><div align="left" class="style49">Material Information</div></th>
        </tr>
      </table>
    </div></th>
  </tr>
</table>
	<br />
<div align="left">
	  <%
if objrs.RecordCount > 0 then
	nrec = 0
	'do while nrec < objrs.PageSize and not objrs.Eof
	do while not objrs.Eof

		'Achando a mercadoria
		if objrsx.State = adStateOpen then objrsx.Close
		sql = "SELECT * FROM TMERCADORIA_EXP WHERE CD_GRUPO='155' and cd_mercadoria='"&objrs.Fields.Item("CD_MATERIAL").Value&"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		if objrsx.eof then
			Mercadoria="Não Informado"
		else
			Mercadoria=objrsx("NM_MERCADORIA")
			CD_MERCADORIA=objrsx("CD_MERCADORIA")
			CD_FAMILIA_PROD=objrsx("CD_FAMILIA_PROD")
		end if	

		'Achando a categoria
		if objrsx.State = adStateOpen then objrsx.Close
		sql = "SELECT F.NM_FAMILIA_PROD FROM TFAMILIA_PROD F, TMERCADORIA_EXP M WHERE M.CD_MERCADORIA ='"&CD_MERCADORIA&"' AND F.CD_FAMILIA_PROD = '"&CD_FAMILIA_PROD&"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		if objrsx.eof then
			Categoria="Não Informado"
		else
			Categoria=objrsx("NM_FAMILIA_PROD")
		end if	

		'if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
		vNrOrder = objrs.Fields.Item("dt_release").Value
        vNrOrder=objrs.Fields.Item("dt_release").Value

%>
    </div>
	<table width="85%" border="0" align="center" class="gridsub" cellpadding="0" cellspacing="0" bgcolor="#336699" style="padding: 2px 2px 0px 2px;">
<tr height="18">
	<td width="110" bgcolor="#CCCCCC" class="style32"><div align="left" class="style48 style20 style51">
	    <div align="left">Code</div>
		</div></td>
	    <td width="84" bgcolor="#CCCCCC" class="style48"><div align="left" class="style52">Mercadoria</div></td>
      <td width="91" bgcolor="#CCCCCC" class="style48"><div align="left"><span class="style20"><span class="style20"><span class="style51"></span></span></span></div></td>
	  <td width="119" bgcolor="#CCCCCC" class="style48" ><div align="left"><span class="style20"><span class="style20"><span class="style51"></span></span></span></div></td>
	  <td width="104" bgcolor="#CCCCCC" class="style48"><div align="left" class="style52">Categoria</div></td>
	  <td width="120" bgcolor="#CCCCCC" class="style48"><div align="left"><span class="style20"><span class="style20"><span class="style51"></span></span></span></div></td>
	  <td width="111" bgcolor="#CCCCCC" class="style48"><div align="left"><span class="style20"><span class="style20"><span class="style51"></span></span></span></div></td>
	  <td width="116" bgcolor="#CCCCCC" class="style48"><div align="left"><span class="style20"><span class="style20"><span class="style51"></span></span></span></div></td>
  </tr>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
	  <td height="20" bgcolor="#FFFFFF" class="style20"><div align="left" class="style42 style20 style51"><%=objrs.Fields.Item("CD_MATERIAL").Value%></div></td>
	  <td colspan="3" bgcolor="#FFFFFF" class="style20 style20"><div align="left" class="style42 style20 style51"><%=Mercadoria%></div></td>
	  <td colspan="4" align="left" bgcolor="#FFFFFF" class="style42 style20 style51"><div align="left"><%=Categoria%></div>	    <span class="style20 style20"><nobr></nobr></span>	    </td>
  </tr>
	<tr height="15"  align="center" valign="top">
	  <td height="20" bgcolor="#CCCCCC"  class="style20" ><div align="left"><span class="tcppopup">Production date</span></div></td>
	  <td bgcolor="#CCCCCC"  class="style20"><div align="left" class="style52"><span class="tcppopup">Release Date</span></div></td>
	  <td bgcolor="#CCCCCC"  class="style20"><div align="left" class="style52"><span class="tcppopup">Qt.  Real</span></div></td>
	  <td bgcolor="#CCCCCC" class="style20"><div align="left" class="style52"><span class="tcppopup">Qt.  Planned</span></div></td>
	  <td align="left" bgcolor="#CCCCCC" class="style20"><div align="left" class="style52"><span class="tcppopup">Unit Net Weigth</span></div></td>
	  <td bgcolor="#CCCCCC" class="style20"><div align="left" class="style52"><span class="tcppopup">Unit Net gross</span></div></td>
	  <td bgcolor="#CCCCCC" class="style20"><div align="left" class="style52"><span class="tcppopup">Volume net</span></div></td>
	  <td bgcolor="#CCCCCC" class="style20"><div align="left" class="style52"><span class="tcppopup">Volume gross</span></div></td>
  </tr>
	<tr height="15" bgcolor="<%= bgcolor%>" align="center" valign="top">
	  <td height="20" bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("DT_PRODUCTION").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20 style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("DT_RELEASE").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20 style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_QTY_REAL").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_QTY_PLANNED").Value%></span></div></td>
	  <td align="left" bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_NET_WEIGTH").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_GROSS_WEIGTH").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_NET_VOLUME").Value%></span></div></td>
	  <td bgcolor="#FFFFFF" class="style20"><div align="left" class="style52"><span class="style42"><%=objrs.Fields.Item("NR_GROSS_VOLUME").Value%></span></div></td>
  </tr>
</table>

	<br />
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
