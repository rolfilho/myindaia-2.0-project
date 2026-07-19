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
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

'verifica qual tipo de usuário esta acessando o site
If Session("cd_cargo") = "040" Then
  'se for cliente
  str = "INNER JOIN TPERMISSAO_GRUPO  US ( NOLOCK ) ON ( US.CD_GRUPO = PR.CD_GRUPO ) "
Else
  'caso seja funcionário
  str = "INNER JOIN TUSUARIO_HABILITACAO US ( NOLOCK ) ON ( US.CD_UNID_NEG = PR.CD_UNID_NEG AND US.CD_PRODUTO = PR.CD_PRODUTO ) "
End If

sql = "SELECT TOP 1 "&_
			"  PR.NR_VIAGEM, PR.CD_EMBARCACAO, " &_
			"  EM.NM_EMBARCACAO, " &_
			"  F1.DT_REALIZACAO AS DT_ETACC, " &_
			"  F2.DT_REALIZACAO AS DT_ETA " &_
			"FROM TPROCESSO PR ( NOLOCK ) " &_
			"  INNER JOIN TEMBARCACAO EM ( NOLOCK ) ON ( EM.CD_EMBARCACAO = PR.CD_EMBARCACAO ) " &_
			"  LEFT  JOIN TFOLLOWUP   F1 ( NOLOCK ) ON ( F1.NR_PROCESSO   = PR.NR_PROCESSO AND F1.CD_EVENTO = '161' ) " &_
			"  LEFT  JOIN TFOLLOWUP   F2 ( NOLOCK ) ON ( F2.NR_PROCESSO   = PR.NR_PROCESSO AND F2.CD_EVENTO = '162' ) " &_
			"  "& str &_
			"WHERE PR.CD_EMBARCACAO = '"& Request("cd_embarcacao") &"' " &_
			"  AND PR.NR_VIAGEM     = '"& Request("nr_viagem") &"' " &_
			"  AND US.CD_USUARIO    = '"& Session("cd_usuario")&"' " &_
			"ORDER BY DT_ETACC DESC"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, 3, 1
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
	<tr height="25" bgcolor="#b4c7db" align="center">
		<td><b><%= tx_lang_POP005(cd_lang)%></b></td>
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
		<td height="50" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td colspan="2" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= tx_lang_POP012(cd_lang)%></td>
					<td colspan="2" bgcolor="#EEEEEE"><%= objrs("NM_EMBARCACAO")%></td>
				</tr>
				<tr>
					<td colspan="2" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= tx_lang_POP013(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= Left(Trim(objrs("NR_VIAGEM")),2) &"/"& Right(Trim(objrs("NR_VIAGEM")),2)%></td>
				</tr>
				<tr>
					<td colspan="2" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= tx_lang_POP041(cd_lang)%></td>
					<td colspan="2" bgcolor="#EEEEEE"><%= fnc_Mascara(objrs("DT_ETACC"), 5)%></td>
				</tr>
				<tr>
					<td colspan="2" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= tx_lang_POP014(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= fnc_Mascara(objrs("DT_ETA"), 5)%></td>
				</tr>
				<tr class="gridtit" style="background-color:<%=cabec_result%>;">
					<td width="100"><%= tx_lang_POP039(cd_lang)%></td>
					<td width="40"><%= tx_lang_POP027(cd_lang)%></td>
					<td width="120"><%= tx_lang_POP015(cd_lang)%></td>
					<td width="140"><%= tx_lang_POP016(cd_lang)%></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><div id="navio" style="position:absolute; left:0px; top:102px; width:400px; height:100%; z-index:1; overflow:auto;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
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
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
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
	<tr align="center" bgcolor="#b4c7db">
		<td height="30"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
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
