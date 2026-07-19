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

sql = "SELECT NR_PROCESSO, NR_RE, NR_ANEXO_INI, NR_ANEXO_FIM, DT_REGISTRO " &_
			"FROM TPROCESSO_EXP_DDE_RE ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
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
		<td height="25" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
			<%= tx_lang_POP002(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 1px 1px 5px;">
				<tr height="18" class="ttbpopup">
					<td><%= tx_lang_POP052(cd_lang)%></td>
					<td><%= tx_lang_POP048(cd_lang)%></td>
					<td><%= tx_lang_POP053(cd_lang)%></td>
					<td><%= tx_lang_POP054(cd_lang)%></td>
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
					<td><%= objrs("DT_REGISTRO")%>&nbsp;</td>
					<td><%= objrs("NR_ANEXO_INI")%>&nbsp;</td>
					<td><%= objrs("NR_ANEXO_FIM")%>&nbsp;</td>
				</tr>
				<%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
End If
%>
			</table></td>
	</tr>
	<tr align="center">
		<td height="28"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#DBDADA" height="15"><p><b><a href="http://www.indaialogistica.com.br/" target="_blank">Indaiá Logística Internacional</a></b></p></td>
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
