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
Dim cd_unid_neg_viagem, cd_produto_viagem, cd_viagem_viagem, cd_emb_viagem


'dados do relatório para serem re-utilizados nos pop-ups
cd_unid_neg_viagem = CStr(Request.QueryString("cd_unid_neg"))
cd_produto_viagem  = CStr(Request.QueryString("cd_produto"))
cd_viagem_viagem   = CStr(Request.QueryString("cd_viagem"))
cd_emb_viagem      = CStr(Request.QueryString("cd_embarcacao"))

If objrsx.State = adStateOpen Then objrsx.Close		
sql = " SELECT PR.NR_PROCESSO AS NR_PROCESSO "&_
	" FROM TVIAGEM V"&_
	" INNER JOIN TPROCESSO PR ON  (PR.CD_EMBARCACAO = V.CD_EMBARCACAO AND PR.NR_VIAGEM = V.NR_VIAGEM "&_
	"                          AND PR.CD_UNID_NEG = V.CD_UNID_NEG AND PR.CD_PRODUTO = V.CD_PRODUTO)"&_
	" WHERE V.CD_UNID_NEG =  '"& cd_unid_neg_viagem &"'"&_
	"   AND V.CD_PRODUTO = '" & cd_produto_viagem &"'"&_
	"   AND V.NR_VIAGEM = '" & cd_viagem_viagem & "'"&_
	"   AND V.CD_EMBARCACAO = '" & cd_emb_viagem & "'"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrsx.Eof 
	Response.write objrsx.Fields.Item("NR_PROCESSO").Value & "<br>"
	objrsx.MoveNext
	If objrsx.Eof Then Exit Do
Loop
Response.end
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td height="25" background="/imagens/30/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
			<%= tx_lang_POP005(cd_lang)%></td>
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
		<td height="50" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td colspan="2" class="ttbpopup"><%= tx_lang_POP012(cd_lang)%></td>
					<td colspan="2" bgcolor="#EEEEEE"><%= objrs("NM_EMBARCACAO")%></td>
				</tr>
				<tr>
					<td colspan="2" class="ttbpopup"><%= tx_lang_POP013(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= Left(Trim(objrs("NR_VIAGEM")),2) &"/"& Right(Trim(objrs("NR_VIAGEM")),2)%></td>
				</tr>
				<tr>
					<td colspan="2" class="ttbpopup"><%= tx_lang_POP041(cd_lang)%></td>
					<td colspan="2" bgcolor="#EEEEEE"><%= fnc_Mascara(objrs("DT_ETACC"), 5)%></td>
				</tr>
				<tr>
					<td colspan="2" class="ttbpopup"><%= tx_lang_POP014(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= fnc_Mascara(objrs("DT_ETA"), 5)%></td>
				</tr>
				<tr>
					<td colspan="4" height="3"></td>
				</tr>
				<tr class="ttbpopup">
					<td width="100"><%= tx_lang_POP039(cd_lang)%></td>
					<td width="40"><%= tx_lang_POP027(cd_lang)%></td>
					<td width="120"><%= tx_lang_POP015(cd_lang)%></td>
					<td width="140"><%= tx_lang_POP016(cd_lang)%></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><div id="navio" style="position:absolute; left:0px; top:114px; width:400px; height:187px; z-index:1; overflow:auto;">
				<table width="100%" border="0" cellspacing="1" cellpadding="2">
					<%
	objrs.Close
	sql = "SELECT DISTINCT "&_
				"  RC.CD_REFERENCIA AS NR_REFERENCIA, "&_
				"  ISNULL( RC.NR_ITEM_PO, 0 ) AS NR_ITEM_CLIENTE, " &_
				"  PR.NR_CONHECIMENTO AS NR_HBL,  "&_
				"  PR.NR_CONHECIMENTO_MASTER AS NR_MBL " &_
				"FROM TPROCESSO PR ( NOLOCK ) " &_
				"  INNER JOIN TREF_CLIENTE RC ( NOLOCK ) ON ( RC.NR_PROCESSO = PR.NR_PROCESSO ) "&_
				"  "& str &_
				"WHERE PR.CD_EMBARCACAO = '"& Request("cd_embarcacao") &"' " &_
				"  AND PR.NR_VIAGEM     = '"& Request("nr_viagem") &"' " &_
				"  AND US.CD_USUARIO    = '"& Session("cd_usuario")&"' " &_
				"ORDER BY NR_REFERENCIA, NR_ITEM_CLIENTE"
	'Response.Write(sql &"<br>")
	objrs.Open sql, objcnn, 3, 1
	
	If objrs.RecordCount < 11 Then col = 140 Else col = 120
	Do While Not objrs.Eof
		If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="100" class="data"><a href="javascript: window.opener.location.href='/import/track_busca.asp?nr_referencia=<%= Trim(objrs("NR_REFERENCIA"))%>&filtro=nr_referencia&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= Trim(objrs("NR_REFERENCIA"))%></a></td>
						<td width="40"><a href="javascript: window.opener.location.href='/import/track_busca.asp?nr_referencia=<%= Trim(objrs("NR_REFERENCIA"))%>&filtro=nr_referencia&nr_item_clnte=<%= objrs("NR_ITEM_CLIENTE")%>&filtro=nr_item_clnte&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= fnc_AddZeros(objrs("NR_ITEM_CLIENTE"), 4)%></a></td>
						<td width="120" class="data"><%
		If Not fnc_TestaVar(objrs("NR_MBL")) Then
			Response.Write(tx_lang_POP040(cd_lang)&" "&tx_lang_POP015(cd_lang))
		Else
%>
							<a href="javascript: window.opener.location.href='/import/track_busca.asp?nr_master=<%= Trim(objrs("NR_MBL"))%>&filtro=nr_master&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= Trim(objrs("NR_MBL"))%></a>
							<%
		End If
%>
						</td>
						<td width="<%= col%>" class="data"><%
		If Not fnc_TestaVar(objrs("NR_HBL")) Then
			Response.Write(tx_lang_POP040(cd_lang)&" "&tx_lang_POP016(cd_lang))
		Else
%>
							<a href="javascript: window.opener.location.href='/import/track_busca.asp?nr_master=<%= Trim(objrs("NR_HBL"))%>&filtro=nr_master&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= Trim(objrs("NR_HBL"))%></a>
							<%
		End If
%>
						</td>
					</tr>
					<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
%>
				</table>
			</div></td>
	</tr>
	<%
End If
objrs.Close
%>
	<tr align="center">
		<td height="30"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
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
