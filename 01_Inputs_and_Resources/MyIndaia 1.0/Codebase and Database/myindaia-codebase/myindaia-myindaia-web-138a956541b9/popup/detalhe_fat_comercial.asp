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

sql = "SELECT D.NR_PROCESSO, D.NR_SEQUENCIA, D.NR_DCTO_INSTRUCAO, D.DT_FATURA, D.DT_VENCTO_FATURA, " &_
	  	"	 D.DT_VENCTO_EADI, D.DT_VENCTO_NAC, C.NM_COND_VENDA_ENT, D.NR_DIAS " &_
	  	"FROM TDOCUMENTO_INSTRUCAO D ( NOLOCK ) " &_
	  	"  LEFT JOIN TCOND_VENDA_ENT C ( NOLOCK ) ON D.CD_COND_VENDA_ENT = C.CD_COND_VENDA_ENT " &_
	  	"WHERE D.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
			"  AND CD_TIPO_DCTO_INSTR = '01'"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
	<tr  height="25" style="background-color:<%=topo_div%>;" align="center">
		<td><b><%= tx_lang_POP017(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td>
	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr height="18" class="gridtit" style="background-color:<%=cabec_result%>;">
					<td><%= tx_lang_POP018(cd_lang)%></td>
					<td><%= tx_lang_POP019(cd_lang)%></td>
					<td><%= tx_lang_POP020(cd_lang)%></td>
					<td><%= tx_lang_POP021(cd_lang)%></td>
				</tr>
				<%
If objrs.Eof Then
%>
				<%
Else
 Do While Not objrs.Eof
   If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
				<tr bgcolor="<%= bgcolor%>">
					<td><%= objrs("NR_SEQUENCIA")%>&nbsp;</td>
					<td><%= objrs("NR_DCTO_INSTRUCAO")%>&nbsp;</td>
					<td><%= objrs("DT_FATURA")%>&nbsp;</td>
					<td><%= objrs("DT_VENCTO_FATURA")%>&nbsp;</td>
				</tr>
				<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
  Loop
End If
%>
			</table></td>
	</tr>
	<tr align="center" style="background-color:<%=topo_div%>;">
		<td height="28"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td></td>
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
