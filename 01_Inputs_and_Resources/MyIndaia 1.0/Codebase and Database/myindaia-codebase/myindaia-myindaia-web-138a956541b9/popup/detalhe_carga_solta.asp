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

sql = "SELECT NR_PROCESSO, CAST(NR_SEQUENCIA AS INT) AS NR_SEQUENCIA, VL_QTDE, NM_ESPECIE " &_
			"FROM TPROCESSO_CARGA_SOLTA ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"ORDER BY NR_SEQUENCIA"
'Response.Write(sql)
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>

<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
  <tr height="22" style="background-color:<%=topo_div%>;">
    <td style="text-align:center;"><b><%= tx_lang_POP003(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td>
  </tr>
  <%
If objrs.Eof Then
%>
  <tr>
    <td><br /><%= tx_lang_A00081(cd_lang)%>.</td>
  </tr>
  <%
Else
%>
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0">
      <tr class="gridtit" style="background-color:<%=cabec_result%>;">
				<td width="5%" height="18">#</td>
				<td width="10%"><%= tx_lang_POP010(cd_lang)%>.</td>
				<td width="85%"><%= tx_lang_POP011(cd_lang)%></td>
      </tr>
      <%
  Do While Not objrs.Eof
	If (objrs.AbsolutePosition Mod 2) = 0 Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
      <tr bgcolor="<%= bgcolor%>">
				<td height="15"><%= fnc_AddZeros(Trim(objrs("NR_SEQUENCIA")), 3)%></td>
				<td align="right"><%= objrs("VL_QTDE")%></td>
				<td><%= objrs("NM_ESPECIE")%></td>
      </tr>
      <%
	objrs.MoveNext
  Loop
%>
    </table></td>
  </tr>
  <%
End If
objrs.Close
%>
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