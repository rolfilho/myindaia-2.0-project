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
Dim nr_cntr

nr_referencia = Request.QueryString("nr_referencia")
nr_processo   = Request.QueryString("nr_processo")

nr_cntr = Request("nr_cntr")

sql = "SELECT C.NR_PROCESSO, P.NR_REFERENCIA, P.NR_VIAGEM, E.NM_EMBARCACAO, " &_
			"	  P.NR_CONHECIMENTO_MASTER AS MBL, P.NR_CONHECIMENTO AS HBL, " &_
			" ( SELECT DT_REALIZACAO " &_
			"	  FROM TFOLLOWUP F ( NOLOCK ) " &_
			"	  WHERE F.NR_PROCESSO = P.NR_PROCESSO " &_
			"	    AND F.CD_EVENTO   = ( SELECT CD_EV_ENT FROM TPARAMETROS ( NOLOCK ))) AS DT_ETA " &_
			"FROM TPROCESSO_CNTR C ( NOLOCK ) " &_
			"	 INNER JOIN TREF_CLIENTE  R ( NOLOCK ) ON ( R.NR_PROCESSO   = C.NR_PROCESSO ) " &_
			"	 INNER JOIN TPROCESSO     P ( NOLOCK ) ON ( P.NR_PROCESSO   = C.NR_PROCESSO ) " &_
			"	 INNER JOIN TEMBARCACAO   E ( NOLOCK ) ON ( E.CD_EMBARCACAO = P.CD_EMBARCACAO ) " &_
			"WHERE C.NR_CNTR       =    '"& nr_cntr &"' " &_
			"	 AND R.CD_REFERENCIA LIKE '"& nr_referencia &"%'"
'Response.Write(sql)
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="25" background="/imagens/30/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
			<%= tx_lang_POP004(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
  </tr>
  <%
If objrs.Eof Then
%>
  <tr>
    <td><%= tx_lang_A00081(cd_lang)%>.</td>
  </tr>
  <%
Else
%>
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="2">
      <tr>
        <td width="30%" class="detcampo"><%= tx_lang_POP012(cd_lang)%></td>
        <td width="70%" bgcolor="#DDDDDD"><%= objrs("NM_EMBARCACAO")%></td>
      </tr>
      <tr>
        <td class="detcampo"><%= tx_lang_POP013(cd_lang)%></td>
        <td bgcolor="#EEEEEE"><%= objrs("NR_VIAGEM")%></td>
      </tr>
      <tr>
        <td class="detcampo"><%= tx_lang_POP014(cd_lang)%></td>
        <td bgcolor="#DDDDDD"><%= objrs("DT_ETA")%></td>
      </tr>
      <tr>
        <td class="detcampo"><%= tx_lang_POP015(cd_lang)%></td>
        <td bgcolor="#EEEEEE"><%
  objrs.MoveFirst
  Do While Not objrs.Eof
	If Trim(objrs("MBL")) = "" or IsNull(objrs("MBL")) Then
%>
      Sem BL Master
        <%
	Else
%>
        <a href="#" onClick="window.opener.location.href='/detalhe_cntr.asp?nr_processo=<%= Trim(objrs("NR_PROCESSO"))%>&nr_cntr=<%= nr_cntr%>';window.close();"><%= objrs("MBL")%></a><br>
        <%
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
%>
        </td>
      </tr>
      <tr>
        <td class="detcampo"><%= tx_lang_POP016(cd_lang)%></td>
        <td bgcolor="#DDDDDD"><%
  objrs.MoveFirst
  Do While Not objrs.Eof
	If Trim(objrs("HBL")) = "" or IsNull(objrs("HBL")) Then
%>
      Sem BL House
        <%
	Else
%>
        <a href="#" onClick="window.opener.location.href='/detalhe/imp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>';window.close();"><%= objrs("HBL")%></a><br>
        <%
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
%>
        </td>
      </tr>
    </table></td>
  </tr>
  <%
End If
objrs.Close
%>
  <tr align="center">
    <td height="28"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
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