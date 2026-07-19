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
nr_referencia = Request.QueryString("nr_referencia")
nr_processo   = Request.QueryString("nr_processo")

sql = "SELECT NR_PROCESSO, NR_NF, DT_NOTA, ISNULL(VL_NOTA, '') AS VL_NOTA " &_
	  "FROM TPROCESSO_EXP_NF ( NOLOCK ) " &_
	  "WHERE NR_PROCESSO = '"& nr_processo &"'"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
	<tr>
		<td height="25" style="background-color:<%=topo_div%>;" style="text-align:center;"><b><%= tx_lang_POP006(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")" %></b></td>
	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 1px 1px 5px;">
				<tr height="18" class="gridtit" style="background-color:<%=cabec_result%>;">
					<td><%= tx_lang_POP006(cd_lang)%></td>
					<td><%= tx_lang_POP087(cd_lang)%></td>
					<td><%= tx_lang_POP088(cd_lang)%></td>
				</tr>
				<%
If objrs.Eof Then
%>
				<tr>
					<td colspan="3"><%= tx_lang_A00081(cd_lang)%></td>
				</tr>
				<%
Else	
 Do While Not objrs.Eof
   If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
				<tr bgcolor="<%= bgcolor%>">
					<td><%= objrs("NR_NF")%>&nbsp;</td>
					<td><%= objrs("DT_NOTA")%>&nbsp;</td>
					<td><%= FormatNumber(objrs("VL_NOTA"), 2)%>&nbsp;</td>
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
    <td align="center" bgcolor="<%=topo_div %>" height="25"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
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
