<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%

Dim vCodMerc
Dim tipo_consulta_detalhe
Dim produto_detalhe

cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
vCodMerc = Request.QueryString("vCodMerc")
nr_processo = Request.QueryString("nr_processo")
nr_referencia = Request.QueryString("nr_referencia")
nr_item_clnte = Request.QueryString("nr_item_clnte")
cd_empresa = Request.QueryString("cd_empresa")
tipo_consulta_detalhe = Request.QueryString("tipo_consulta_detalhe")
produto_detalhe = Request.QueryString("produto")

if produto_detalhe = "01" Then
	if tipo_consulta_detalhe = 1 Then
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT REPLACE(CONVERT(VARCHAR(8000), DM.TX_DESC_DET_MERC), NCHAR(13) + NCHAR(10), '<BR>') AS DESCRICAO, LEFT(DM.CD_NCM_SH,8) AS NCM, NC.DESCRICAO AS NCM_DESCRICAO "&_ 
		"FROM TDETALHE_MERCADORIA DM(NOLOCK) "&_
		"LEFT JOIN TNCM NC ON (NC.CODIGO = LEFT(DM.CD_NCM_SH,8)) "&_
		"WHERE CD_MERCADORIA = '"&vCodMerc&"' AND NR_PROCESSO = '"& nr_processo &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	Else
		if tipo_consulta_detalhe = 2 Then
			if objrs.State = adStateOpen then objrs.Close()	
			sql = "  SELECT M.AP_MERCADORIA AS DESCRICAO, LEFT(I.CD_NCM_SH,8) AS NCM, NC.DESCRICAO AS NCM_DESCRICAO "&_
				  "  FROM TPO_ITEM I (NOLOCK)"&_
				  "  LEFT JOIN  TMERCADORIA M (NOLOCK) ON (I.CD_MERCADORIA = M.CD_MERCADORIA)"&_
				  "  LEFT JOIN  TNCM NC (NOLOCK) ON (NC.CODIGO = LEFT(I.CD_NCM_SH,8)) "&_
				  "  WHERE I.CD_MERCADORIA = '"&vCodMerc&"' "&_
				  "  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
				  "  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'" &_
				  "  AND I.CD_EMPRESA = '"& cd_empresa &"'" &_
				  "  AND I.NR_PARCIAL = 0"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		End If
	End If
End If		
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<table width="90%" heigth="90%" border="0" cellpadding="0" cellspacing="0" align="center">
     <tr><td align="left" valign="top">
     <br>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
				<tr align="center" >
					<td class="gridtit" width="30%"><nobr>&nbsp;<%=tx_lang_POP035(cd_lang)%>&nbsp;</nobr></td>
					<td align="left" bgcolor="#FFFFFF"><nobr>&nbsp;<%= vCodMerc%>&nbsp;</nobr></td>
				</tr>
	  </table>		
     </td></tr>
     <tr><td> </td></tr>
     <tr><td align="left" valign="top">
     <%if objrs.Fields.Item("DESCRICAO").Value <> "" Then %>
		<table width="100%"  height="5px" border="0" cellspacing="0" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
				<tr bgcolor="#FFFFFF">
					<td align="left"><table width="97%" align="center" height="95%"><tr><td valign="middle"><%= objrs.Fields.Item("DESCRICAO").Value%></td></tr></table></td>
				</tr>
	  </table>	
      <%End If%>
      <br>	
     </td></tr>      
     <tr><td align="left" valign="top">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
				<tr align="center">
					<td class="gridtit" width="30%"><nobr>&nbsp;NCM&nbsp;</nobr></td>
					<td align="left" bgcolor="#FFFFFF"><nobr>&nbsp;<%= objrs.Fields.Item("NCM").Value%>&nbsp;</nobr></td>
				</tr>
	  </table>		
     </td></tr>  
     <tr><td> </td></tr>
     <tr><td align="left" valign="top">
     <%if objrs.Fields.Item("NCM_DESCRICAO").Value <> "" Then %>
		<table width="100%"  height="5px" border="0" cellspacing="0" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
				<tr bgcolor="#FFFFFF">
					<td align="left" ><table width="97%" align="center" height="95%"><tr><td valign="middle"><%= objrs.Fields.Item("NCM_DESCRICAO").Value%></td></tr></table></td>
				</tr>
	  </table>	
      <%End if%>
      <br>	
     </td></tr>      
    </table>
</body>
</html>