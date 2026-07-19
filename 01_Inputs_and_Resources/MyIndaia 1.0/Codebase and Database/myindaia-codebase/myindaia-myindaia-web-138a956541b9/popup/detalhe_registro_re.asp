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

sql = "SELECT NR_PROCESSO, NR_RE, DT_RE, QT_PESO_LIQ, VL_FOB " &_
			"FROM TPROCESSO_EXP_RE ( NOLOCK ) " &_
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
	<tr height="22" style="background-color:<%=topo_div%>;">
		<td height="25" style="text-align:center;"><b><%= tx_lang_POP002(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")" %></b></td>
	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 1px 1px 5px;">
				<tr height="18" class="gridtit" style="background-color:<%=cabec_result%>;">
					<td><%= tx_lang_POP052(cd_lang)%></td>
					<td><%= tx_lang_POP048(cd_lang)%></td>
					<td><%= tx_lang_POP085(cd_lang)%></td>
					<td><%= tx_lang_POP086(cd_lang)%></td>
				</tr>
				<%
If objrs.Eof Then
%>
				<%
Else
 Do While Not objrs.Eof
 
   If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
%>
				<tr bgcolor="<%= bgcolor%>">
					<td><%= fnc_Mascara(objrs("NR_RE"), 2)%>&nbsp;</td>
					<%if fnc_TestaVar(objrs("DT_RE")) then %>
					<td><%= objrs("DT_RE")%>&nbsp;</td>
                    <%else%>
                    <td>-</td>
                    <%end if%>
                    <%if fnc_TestaVar(objrs("VL_FOB")) then %>
					<td><%= FormatNumber(objrs("VL_FOB"), 2) %>&nbsp;</td>
                    <%else%>
                    <td>-</td>
                    <%end if%>
                    <%if fnc_TestaVar(objrs("VL_FOB")) then %>
					<td><%= FormatNumber(objrs("QT_PESO_LIQ"), 3) %>&nbsp;</td>
                    <%else%>
                    <td>-</td>
                    <%end if%>                 
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
