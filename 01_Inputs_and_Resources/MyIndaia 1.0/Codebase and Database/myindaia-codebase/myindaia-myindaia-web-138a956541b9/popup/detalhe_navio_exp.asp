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

sql = "SELECT DISTINCT " &_
			"  PR.NR_VIAGEM, PR.CD_EMBARCACAO, " &_
			"  EM.NM_EMBARCACAO, " &_
			"  F1.DT_REALIZACAO AS DT_ETDCC, " &_
			"  F2.DT_REALIZACAO AS DT_ETD " &_
			"FROM TPROCESSO PR ( NOLOCK ) " &_
			"  INNER JOIN TEMBARCACAO EM ( NOLOCK ) ON ( EM.CD_EMBARCACAO = PR.CD_EMBARCACAO ) " &_
			"  LEFT  JOIN TFOLLOWUP   F1 ( NOLOCK ) ON ( F1.NR_PROCESSO   = PR.NR_PROCESSO AND F1.CD_EVENTO = '131' ) " &_
			"  LEFT  JOIN TFOLLOWUP   F2 ( NOLOCK ) ON ( F2.NR_PROCESSO   = PR.NR_PROCESSO AND F2.CD_EVENTO = '132' ) " &_
			"  "& str &_
			"WHERE PR.CD_PRODUTO   IN ( '02','10' ) "&_
			"  AND PR.CD_EMBARCACAO = '"& Request("cd_embarcacao") &"' "&_
			"  AND PR.NR_VIAGEM     = '"& Request("nr_viagem")     &"' "&_
			"  AND US.CD_USUARIO    = '"& Session("cd_usuario")    &"' "
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
					<td class="ttbpopup"><%= tx_lang_POP012(cd_lang)%></td>
					<td colspan="2" bgcolor="#EEEEEE"><%= objrs("NM_EMBARCACAO")%></td>
				</tr>
				<tr>
					<td class="ttbpopup"><%= tx_lang_POP013(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= fnc_Mascara(Trim(objrs("NR_VIAGEM")), 4)%></td>
				</tr>
				<tr>
					<td class="ttbpopup"><%= tx_lang_POP037(cd_lang)%>.</td>
					<td colspan="2" bgcolor="#EEEEEE"><%= fnc_Mascara(objrs("DT_ETDCC"), 5)%></td>
				</tr>
				<tr>
					<td class="ttbpopup"><%= tx_lang_POP038(cd_lang)%></td>
					<td colspan="2" bgcolor="#DDDDDD"><%= fnc_Mascara(objrs("DT_ETD"), 5)%></td>
				</tr>
				<tr>
					<td colspan="3" height="3"></td>
				</tr>
				<tr class="ttbpopup">
					<td width="110"><%= tx_lang_POP039(cd_lang)%></td>
					<td width="140"><%= tx_lang_POP015(cd_lang)%></td>
					<td width="150"><%= tx_lang_POP016(cd_lang)%></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>
	<tr>
		<td valign="top"><div id="navio" style="position:absolute; left:0px; top:114px; width:400px; height:187px; z-index:1; overflow:auto;">
				<table width="100%" border="0" cellspacing="1" cellpadding="2">
					<%
  objrs.Close
  sql = "SELECT DISTINCT "&_
				"  PR.NR_CONHECIMENTO AS NR_HBL, "&_
				"  PR.NR_CONHECIMENTO_MASTER AS NR_MBL, "&_
				"  ( SELECT MAX( CD_REFERENCIA ) FROM TREF_CLIENTE RC ( NOLOCK ) WHERE RC.NR_PROCESSO = PR.NR_PROCESSO AND RC.TP_REFERENCIA = '01' AND RC.NR_SEQUENCIA IN ( SELECT MIN( NR_SEQUENCIA ) FROM TREF_CLIENTE R2 ( NOLOCK ) WHERE R2.NR_PROCESSO = RC.NR_PROCESSO AND R2.TP_REFERENCIA = '01' ) ) AS NR_REF_PEDIDO, "&_
				"  ( SELECT MAX( CD_REFERENCIA ) FROM TREF_CLIENTE RC ( NOLOCK ) WHERE RC.NR_PROCESSO = PR.NR_PROCESSO AND RC.TP_REFERENCIA = '02' AND RC.NR_SEQUENCIA IN ( SELECT MIN( NR_SEQUENCIA ) FROM TREF_CLIENTE R2 ( NOLOCK ) WHERE R2.NR_PROCESSO = RC.NR_PROCESSO AND R2.TP_REFERENCIA = '02' ) ) AS NR_REF_ORDEM "&_
				"FROM TPROCESSO PR ( NOLOCK ) "&_
				"  "& str &_
				"WHERE PR.CD_PRODUTO   IN ( '02','10' ) "&_
				"  AND PR.CD_EMBARCACAO = '"& Request("cd_embarcacao") &"' "&_
				"  AND PR.NR_VIAGEM     = '"& Request("nr_viagem")     &"' "&_
				"  AND US.CD_USUARIO    = '"& Session("cd_usuario")    &"' "
  'Response.Write(sql &"<br>")
  objrs.Open sql, objcnn, 3, 1
	
	If objrs.RecordCount < 11 Then col = 145 Else col = 128
	Do While Not objrs.Eof
		If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
		If fnc_TestaVar(objrs("NR_REF_ORDEM")) Then
			str = "nr_ref_ordem="& Trim(objrs("NR_REF_ORDEM")) &"&filtro=nr_ref_ordem"
			nr_referencia = objrs("NR_REF_ORDEM")
		Else
			str = "nr_ref_pedido="& Trim(objrs("NR_REF_PEDIDO")) &"&filtro=nr_ref_pedido"
			nr_referencia = objrs("NR_REF_PEDIDO")
		End If
%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="110" class="data"><a href="javascript: window.opener.location.href='/export/track_busca.asp?<%= str%>&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= nr_referencia%></a></td>
						<td width="140" class="data"><%
		If Trim(objrs("NR_MBL")) = "" or IsNull(objrs("NR_MBL")) Then
			Response.Write(tx_lang_POP040(cd_lang)&" "&tx_lang_POP015(cd_lang))
		Else
%>
							<a href="javascript: window.opener.location.href='/export/track_busca.asp?nr_master=<%= Trim(objrs("NR_MBL"))%>&filtro=nr_master&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= objrs("NR_MBL")%></a>
							<%
		End If
%>
						</td>
						<td width="<%= col%>" class="data"><%
		If Trim(objrs("NR_HBL")) = "" or IsNull(objrs("NR_HBL")) Then
			Response.Write(tx_lang_POP040(cd_lang)&" "&tx_lang_POP016(cd_lang))
		Else
%>
							<a href="javascript: window.opener.location.href='/export/track_busca.asp?nr_house=<%= Trim(objrs("NR_HBL"))%>&filtro=nr_house&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= objrs("NR_HBL")%></a>
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
