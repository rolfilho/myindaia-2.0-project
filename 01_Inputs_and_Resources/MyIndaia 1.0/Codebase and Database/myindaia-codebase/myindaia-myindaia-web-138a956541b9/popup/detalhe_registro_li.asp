<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Modificado por Alexandre Gonçalves Neto em --/--/----
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim nr_li
Dim vDiferencaDias


nr_referencia = Request.QueryString("nr_referencia")
nr_processo   = Request.QueryString("nr_processo")
nr_li         = Request.QueryString("nr_li")

sql = "SELECT LI.NR_PROCESSO, SUBSTRING(LI.NR_PROCESSO, 5, 10) AS PROC, " &_
      " LI.NR_LI, LI.DT_REGISTRO, LI.DT_DEFERIMENTO, LI.DT_VENCTO, LI.NR_SUBSTITUIDA, P.TX_MERCADORIA, " &_
      " (SELECT TOP 1 R.CD_REFERENCIA + '/' + R.NR_ITEM_PO FROM TREF_CLIENTE R (NOLOCK) ON R.NR_PROCESSO = P.NR_PROCESSO AND " &_
	  "    TP_REFERENCIA = '01') AS PEDIDO " &_
      " FROM TPROCESSO_LI LI ( NOLOCK ) " &_
      " INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = LI.NR_PROCESSO " &_
      " WHERE P.NR_PROCESSO = '"& nr_processo &"'"
 
If nr_li <> "" Then			
  sql = sql & " AND LI.NR_LI = '"& nr_li &"'"
End If  

'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
<%    if nr_li = "" Then %>  	
		<td height="25" background="/imagens/30/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
			<%= tx_lang_POP001(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
<%    else %>
		<td height="25" background="/imagens/30/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
			<%= tx_lang_POP001(cd_lang) &" >> "& tx_lang_POP049(cd_lang) &": "& fnc_Mascara(nr_li, 1)%></td>
<&    end If %>
		<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/30/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 1px 1px 5px;">
				<tr height="18" class="ttbpopup">
					<td><%= tx_lang_POP049(cd_lang)%></td>
					<td><%= tx_lang_POP039(cd_lang)%></td>
					<td><%= tx_lang_POP081(cd_lang)%></td>
					<td><%= tx_lang_POP035(cd_lang)%></td>															
					<td><%= tx_lang_POP048(cd_lang)%></td>
					<td><%= tx_lang_POP050(cd_lang)%></td>
					<td><%= tx_lang_POP051(cd_lang)%></td>
					<td><%= tx_lang_POP079(cd_lang)%></td>
					<td><%= tx_lang_POP080(cd_lang)%></td>										
				</tr>
				<%
If objrs.Eof Then
%>
				<%
Else
 Do While Not objrs.Eof
   If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
   vDiferencaDias = 0 
   vDiferencaDias = fnc_DiasUteisKPI(objrs.Fields.Item("DT_REGISTRO").Value, objrs.Fields.Item("DT_DEFERIMENTO").Value, 1)
%>
				<tr bgcolor="<%= bgcolor%>">
					<td><%= fnc_mascara(objrs("NR_LI"), 1)%>&nbsp;</td>
					<td><%= objrs("PEDIDO")%>&nbsp;</td>
					<td><%= objrs("PROC")%>&nbsp;</td>
					<td><%= objrs("TX_MERCADORIA")%>&nbsp;</td>
					<td><%= objrs("DT_REGISTRO")%>&nbsp;</td>
					<td><%= objrs("DT_DEFERIMENTO")%>&nbsp;</td>
					<td><%= objrs("DT_VENCTO")%>&nbsp;</td>
					<td><%= vDiferencaDias %>&nbsp;</td>					
					<td><%= objrs("NR_SUBSTITUIDA")%>&nbsp;</td>
				</tr>
				<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
End If
%>
			</table></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#DBDADA" height="15"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indaiá Logística Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
