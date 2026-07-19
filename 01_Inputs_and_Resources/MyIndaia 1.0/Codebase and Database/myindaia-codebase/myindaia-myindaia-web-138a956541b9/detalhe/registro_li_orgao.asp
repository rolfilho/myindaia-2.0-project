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
Dim nr_li_orgao
Dim vDiferencaDias

nr_processo   = Request.QueryString("nr_processo") 
nr_li_orgao   = Request.QueryString("nr_li")

sql = " SELECT (SELECT DESCRICAO FROM TORGAO_ANUENTES WHERE CODIGO = OA.CD_ORGAO_ANUENTE) AS NOME, " &_
         "         OA.DT_ENTR_PROCESSO, OA.DT_DEFERIMENTO, OA.DT_VENCTO "&_
         " FROM TPROCESSO_LI_ORGAO_ANUENTE OA (NOLOCK) "&_
         "WHERE OA.NR_PROCESSO = '"& nr_processo &"' "&_
         "  AND OA.NR_LI = '"& nr_li_orgao &"' " &_
				 " ORDER BY OA.DT_VENCTO DESC "
objrs.Open sql, objcnn, 3, 1
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr>  
		<td><table width="98%" border="0" cellpadding="0" cellspacing="1" align="center">
  <tr>
	  <td align="center" valign="bottom"><span style="font-weight:bold; color:#0000FF;">Orgãos Anuentes da LI nº: <%= fnc_mascara(nr_li_orgao, 1) %> </span> </td>
  </tr>
        <tr>
          <td><fieldset style=" height:150px; width:"100%"; padding: 0px;" >
            <div id="detalhe" class="geral">
              <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
                <col width="300">
                <col width="100">
                <col width="100">
                <col width="100">
                <tr height="18"  class="gridtop" style="text-align: center;background-color:<%=cabec_result%>;">
                  <td><%= tx_lang_POP082(cd_lang)%>&nbsp;</td>
                  <td><%= tx_lang_POP083(cd_lang)%>&nbsp;</td>
                  <td><%= tx_lang_POP050(cd_lang)%>&nbsp;</td>
                  <td><%= tx_lang_POP084(cd_lang)%>&nbsp;</td>
                  <td><%= tx_lang_POP051(cd_lang)%>&nbsp;</td>
                </tr>
                <%
If objrs.Eof Then
%>
                <%
Else
 Do While Not objrs.Eof
   If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE" End If 
   vDiferencaDias = 0 
   vDiferencaDias = fnc_DiasUteisKPI(objrs.Fields.Item("DT_ENTR_PROCESSO").Value, objrs.Fields.Item("DT_DEFERIMENTO").Value, 1)
%>
                <tr height = "15" bgcolor="<%= bgcolor%>" style="text-align: center">
                  <td><nobr><%= objrs("NOME")%>&nbsp;</nobr></td>
                  <td><nobr><%= fnc_mascara(objrs("DT_ENTR_PROCESSO"), 5)%>&nbsp;</nobr></td>
                  <td><nobr><%= fnc_mascara(objrs("DT_DEFERIMENTO"), 5)%>&nbsp;</nobr></td>
                  <td><nobr><%= vDiferencaDias %>&nbsp;</nobr></td>
                  <td><nobr><%= fnc_mascara(objrs("DT_VENCTO"), 5)%>&nbsp;</nobr></td>
                </tr>
                <%
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
End If
%>
              </table>
            </div>
            </fieldset></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->
