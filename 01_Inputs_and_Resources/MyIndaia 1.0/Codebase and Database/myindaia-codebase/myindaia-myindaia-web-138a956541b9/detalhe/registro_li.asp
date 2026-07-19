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
nr_processo = Request.QueryString("nr_processo")
Dim nr_li : nr_li = Request.QueryString("nr_li")
Dim vDiferencaDias

sql = "SELECT LI.NR_PROCESSO, SUBSTRING(LI.NR_PROCESSO, 5, 10) NR_PROC, " &_
      " LI.NR_LI, LI.DT_REGISTRO, LI.DT_DEFERIMENTO, LI.DT_VENCTO, LI.NR_SUBSTITUIDA, P.TX_MERCADORIA, " &_
      " (SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) + '/' + R.NR_ITEM_PO FROM TREF_CLIENTE R (NOLOCK) WHERE R.NR_PROCESSO = P.NR_PROCESSO AND " &_
	    "    TP_REFERENCIA = '01') AS PEDIDO " &_
      " FROM TPROCESSO_LI LI ( NOLOCK ) " &_
      " INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = LI.NR_PROCESSO " &_
      " WHERE LI.NR_PROCESSO = '"& nr_processo &"' "
If nr_li <> "" Then sql = sql & " AND LI.NR_LI = '"& nr_li &"'" 
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.geral {
	position:absolute;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}
</style>
</head>
<body class="body">
<%
If objrs.Eof Then
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DDDDDD">
	<tr>
		<td align="center"> Não existem dados desta L.I. ou a mesma está Cancelada! <a href="#" onClick="javascript:window.close();">Clique aqui para Sair!</a> </td>
	</tr>
</table>
<%
Else
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
	<tr height="25" align="center" bgcolor="#b4c7db">
	<td><font size="2"><%= tx_lang_POP001(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></font></td>			
	</tr>
	<tr height="340">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td>					
						<div id="geral" class="geral" style="height:320px;top:30px;">
							<table width="800" border="0" cellpadding="0" cellspacing="1" align="center">
								<col width="90">
								<col width="280">
								<col width="80">
								<col width="80">
								<col width="80">
								<col width="80">
								<col width="90">
								<tr height="18" class="gridtop" style="text-align: center;background-color:<%=cabec_result%>;">
									<td><%= tx_lang_POP049(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP035(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP048(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP050(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP051(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP079(cd_lang)%>&nbsp;</td>
									<td><%= tx_lang_POP080(cd_lang)%>&nbsp;</td>
								</tr>
								<%
 nrec = 0
 Do While Not objrs.Eof
   If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result End If
   vDiferencaDias = 0 
   vDiferencaDias = fnc_DiasUteisKPI(objrs.Fields.Item("DT_REGISTRO").Value, objrs.Fields.Item("DT_DEFERIMENTO").Value, 1)

	If objrsx.State = adStateOpen Then objrsx.Close()
	sql = "SELECT LII.NR_ITEM, ISNULL( LII.TX_DESC_DET_MERC, '' ) AS MERC_LI "&_
				"FROM TLICENCA_ITENS LII( NOLOCK ), TLICENCA_IMPORTACAO LI (NOLOCK) "&_
				"WHERE SUBSTRING( LII.NR_PROCESSO, 1, 14 ) = '"& nr_processo &"' "&_
        "  AND LI.NR_REGISTRO_LI = '"& objrs.Fields.Item("NR_LI").Value &"' " &_ 
        "  AND LI.NR_PROCESSO = LII.NR_PROCESSO " &_       
				"ORDER BY NR_ITEM"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'		Response.Write(sql & "<br>")
	str = ""
	If objrsx.RecordCount > 0 Then
		'descrição que será exibida
		x = Trim(Replace(objrsx.Fields.Item("MERC_LI").Value, """", "'"))
		If Len(x) > 40 Then x = Left(x, 40)
		x = x &"..."
		'agrupa todas as referencias na string para aparecerem como hint
		Do While Not objrsx.Eof
			str = str & Trim(objrsx.Fields.Item("NR_ITEM").Value) &" - "
			str = str & Trim(Replace(objrsx.Fields.Item("MERC_LI").Value, """", "'"))
			objrsx.MoveNext
			If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
		Loop
	Else
    
		If fnc_TestaVar(objrs.Fields.Item("TX_MERCADORIA").Value) Then
			str = str & Trim( objrs.Fields.Item("TX_MERCADORIA").Value )
		Else
			str = "Descrição não Disponível."
		End If
		If Len(str) > 40 Then x = Left(str, 40) &"..." Else x = str
	End If
%>
								<tr height = "15" bgcolor="<%= bgcolor%>" style="text-align: center">
									<td><nobr><a href="registro_li_orgao.asp?nr_processo=<%= nr_processo%>&nr_li=<%= objrs("NR_LI")%>" target="orgao"><%= fnc_mascara(objrs("NR_LI"), 1)%></a>&nbsp;</nobr></td>
									<td align="left" title ="<%= str %>"><nobr>&nbsp;<%= x %>&nbsp;</nobr></td>
									<td><nobr><%= fnc_mascara(objrs("DT_REGISTRO"), 5)%>&nbsp;</nobr></td>
									<td><nobr><%= fnc_mascara(objrs("DT_DEFERIMENTO"), 5)%>&nbsp;</nobr></td>
									<td><nobr><%= fnc_mascara(objrs("DT_VENCTO"), 5)%>&nbsp;</nobr></td>
									<td><nobr><%= vDiferencaDias %>&nbsp;</nobr></td>
									<td><nobr><a href="registro_li_orgao.asp?nr_processo=<%= nr_processo%>&nr_li=<%= objrs("NR_SUBSTITUIDA")%>" target="orgao">
										<% =fnc_mascara(objrs("NR_SUBSTITUIDA"), 1)%>
										</a>&nbsp;</nobr></td>
								</tr>
								<%
   nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
  Loop
  objrs.MoveFirst
%>
							</table>
						</div></td>
				</tr>
			</table></td>
	</tr>
	<tr height="170">
		<td><iframe name="orgao" frameborder="0" width="100%" height="100%" src="registro_li_orgao.asp?nr_processo=<%= nr_processo%>&nr_li=<%= objrs("NR_LI")%>"></iframe></td>
	</tr>
</table>
<%
End If
%>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
