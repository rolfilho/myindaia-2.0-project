<table border="0" cellspacing="1" cellpadding="2">
	<tr>
		<td width="190" rowspan="5"><img src="/imagens/logo_indaia.gif" alt="Logo Indai&aacute; Log&iacute;stica" width="180" height="69"></td>
		<%
Select Case cd_menu&cd_subm
  Case "0103","0203"
%>
		<td colspan="2" height="20" class="titulo"><%= nm_tela &"<br>"& fnc_ConsultaLookup("M10_DADOS","M10_CD_BROKER",cd_evento,tx_lang_dado)%></td>
		<%
	Case Else
%>
		<td colspan="2" height="20" class="titulo"><%= nm_tela%></td>
		<%
End Select
%>
	</tr>
	<tr>
		<td width="60"><%= tx_lang_A00006(cd_lang)%>:</td>
		<td width="100%"><b>
			<%
'Cliente
If Request.QueryString("cd_grupo") = "X" or Not fnc_TestaVar(Request.QueryString("cd_grupo")) Then
  If Request.QueryString("cd_cliente") = "X" or Not fnc_TestaVar(Request.QueryString("cd_cliente")) Then
    If Not Session("cargo_interno") = "1" Then
			sql = "SELECT TOP 1 GC.NM_GRUPO "&_
						"FROM TPERMISSAO PC (NOLOCK), TEMPRESA_NAC EN (NOLOCK), TGRUPO GC (NOLOCK) "&_
						"WHERE PC.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
						"  AND PC.CD_CLIENTE = EN.CD_EMPRESA "&_
						"  AND EN.CD_GRUPO   = GC.CD_GRUPO "&_
						"GROUP BY GC.NM_GRUPO "&_
						"ORDER BY COUNT(*) DESC"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Response.Write(objrsx.Fields.Item("NM_GRUPO").Value)
			objrsx.Close()
		Else
			Response.Write(tx_lang_A00022(cd_lang))
		End If
  Else
    Response.Write(fnc_ConsultaLookup("TEMPRESA_NAC","CD_EMPRESA",Request.QueryString("cd_cliente"),"NM_EMPRESA"))
  End If
Else
  Response.Write(fnc_ConsultaLookup("TGRUPO","CD_GRUPO",Request.QueryString("cd_grupo"),"NM_GRUPO"))
End If
%>
			</b></td>
	</tr>
	<tr>
		<td><%= tx_lang_A00007(cd_lang)%>:</td>
		<td><b>
		<%
'Unidade
If Request.QueryString("cd_unid_neg") = "X" or Not fnc_TestaVar(Request.QueryString("cd_unid_neg")) Then
  Response.Write(tx_lang_A00090(cd_lang))
Else
  Response.Write(fnc_ConsultaLookup("TUNID_NEG","CD_UNID_NEG",Request.QueryString("cd_unid_neg"),"NM_UNID_NEG"))
End If
%>
			</b></td>
	</tr>
	<tr>
		<td><%= tx_lang_A00008(cd_lang)%>:</td>
		<td><b>
		<%
'Produto
If Request.QueryString("cd_produto") = "X" or Not fnc_TestaVar(Request.QueryString("cd_produto")) Then
	Select Case cd_menu
		Case "01" Response.Write(tx_lang_A00010(cd_lang))
		Case "02" Response.Write(tx_lang_A00011(cd_lang))
		Case Else Response.Write(tx_lang_A00022(cd_lang))
	End Select
Else
  Response.Write(fnc_ConsultaLookup("TPRODUTO","CD_PRODUTO",Request.QueryString("cd_produto"),"NM_PRODUTO"))
End If
%>
			</b></td>
	</tr>
	<tr>
		<td colspan="2"><%= tx_lang_A00012(cd_lang) &" "& FormatDateTime(Date(), vbLongDate) &" "& tx_lang_A00013(cd_lang) &" "& FormatDateTime(Time(), vbShortTime) &" "& tx_lang_A00014(cd_lang) &" "& Session("nm_usuario")%></td>
	</tr>
</table>
