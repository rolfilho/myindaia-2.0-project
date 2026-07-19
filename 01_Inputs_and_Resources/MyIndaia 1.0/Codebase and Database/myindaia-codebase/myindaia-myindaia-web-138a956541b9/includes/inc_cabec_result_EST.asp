<%
If cd_menu & cd_subm = "0601" Then vl_width = "70" Else vl_width = "95"
%>
			<table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
          <td colspan="4" height="20" class="titulo">..::: <%= tx_lang_A00045(cd_lang)%> :::..</td>
        </tr>
        <tr>
          <td width="60"><%= tx_lang_A00006(cd_lang)%>:</td>
          <td width="<%= vl_width%>%">&nbsp;<b>
            <%
'Cliente
'If Request.QueryString("cd_grupo") = "X" or Not fnc_TestaVar(Request.QueryString("cd_grupo")) Then
' If Request.QueryString("cd_cliente") = "X" or Not fnc_TestaVar(Request.QueryString("cd_cliente")) Then
 '   If InStr("040;060", Session("cd_cargo")) > 0 Then
	
	SQL = "SELECT EN.NM_EMPRESA, PC.CD_EMPRESA  FROM  TEMPRESA_EST EN (NOLOCK) "&_
		  "INNER JOIN TUSUARIO PC ON PC.CD_USUARIO='"& Session("cd_usuario") &"' "&_
		  "WHERE  EN.CD_EMPRESA = PC.CD_EMPRESA "
           'Response.Redirect("../IMPORT/teste.asp?var1="& sql&"")
	
'			sql = "SELECT TOP 1 EN.NM_EMPRESA, GC.CD_GRUPO, GC.NM_GRUPO "&_
'						"FROM TPERMISSAO PC (NOLOCK), TEMPRESA_EST EN (NOLOCK), TGRUPO GC (NOLOCK) "&_
'						"WHERE PC.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
'						"  AND PC.CD_CLIENTE = EN.CD_EMPRESA "
'					'	"  AND EN.CD_GRUPO   = GC.CD_GRUPO "&_
'					'	"GROUP BY GC.NM_GRUPO "&_
'					'	"ORDER BY COUNT(*) DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Response.Write(objrsx.Fields.Item("NM_EMPRESA").Value)
			objrsx.Close()
'		Else 
'			Response.Write(tx_lang_A00022(cd_lang))
'		End If
'  Else
'  'Response.Redirect("../IMPORT/teste.asp?var1="& sql&"")
'
'    Response.Write(fnc_ConsultaLookup("TEMPRESA_EST","CD_EMPRESA",Request.QueryString("cd_cliente"),"NM_EMPRESA"))
'  End If
'Else
'  Response.Write(fnc_ConsultaLookup("TGRUPO","CD_GRUPO",Request.QueryString("cd_grupo"),"NM_GRUPO"))
'End If
		  %>
            </b></td>
						<%
If cd_menu & cd_subm = "0601" Then
%>
						<td width="125"><%= tx_lang_A00073(cd_lang)%>:</td>
        		<td width="125" style="font-weight: bold;"><%= FormatCurrency(Request.QueryString("vl_total_num"), 2)%></td>
						<%
End If
%>
        </tr>
        <tr>
          <td><%= tx_lang_A00007(cd_lang)%>:</td>
          <td>&nbsp;<b>
            <%
'Unidade
If Request.QueryString("cd_unid_neg") = "X" or Not fnc_TestaVar(Request.QueryString("cd_unid_neg")) Then
  Response.Write(tx_lang_A00090(cd_lang))
Else
  Response.Write(fnc_ConsultaLookup("TUNID_NEG","CD_UNID_NEG",Request.QueryString("cd_unid_neg"),"NM_UNID_NEG"))
End If
		  %>
            </b></td>
						<%
If cd_menu & cd_subm = "0601" Then
%>
						<td><%= tx_lang_A00074(cd_lang)%>:</td>
        		<td style="font-weight: bold;"><%= FormatCurrency(Request.QueryString("vl_total_des"), 2)%></td>
						<%
End If
%>
        </tr>
        <tr>
          <td><%= tx_lang_A00008(cd_lang)%>:</td>
          <td>&nbsp;<b>
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
						<%
If cd_menu & cd_subm = "0601" Then
%>
						<td><%= tx_lang_A00075(cd_lang)%>:</td>
        		<td style="font-weight: bold;"><%= FormatCurrency(Request.QueryString("vl_total_sld"), 2)%></td>
						<%
End If
%>
        </tr>
        <%
If (cd_menu&cd_subm <> "0102") and (cd_menu&cd_subm <> "0801") Then
	y = ((pagina - 1) * nr_reg_pagina) + 1
	z = nr_reg_pagina * pagina
	If z > objrs.RecordCount Then z = objrs.RecordCount	
%>
        <tr>
          <td colspan="4"><%= tx_lang_A00046(cd_lang)&" "&y&" "&tx_lang_A00047(cd_lang)&" "&z&" "&tx_lang_A00048(cd_lang)&" "&objrs.RecordCount&" "&tx_lang_A00049(cd_lang)&"."%>
            <%
	'verifica se &eacute; para exibir anterior
	If pagina > 1 Then
%>
            <a href="<%= ap_subm%>_result.asp<%= url%>&p=1" target="_self"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
						<a href="<%= ap_subm%>_result.asp<%= url%>&p=<%= (pagina - 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="<%= tx_lang_A00070(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='"& tx_lang_A00069(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='"& tx_lang_A00070(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
            <select name="nr_pagina" class="select" onChange="MM_jumpMenu('self',this,0);">
              <%
	For x = 1 To objrs.PageCount
		If pagina = x Then selected = " selected" Else selected = ""
		Response.Write("<option value='"& x &"'"& selected &">"& x &"</option>")
	Next
%>
            </select>
            <%
	'verifica se &eacute; para exibir Pr&oacute;xima
	If pagina < objrs.PageCount Then
%>
            <a href="<%= ap_subm%>_result.asp<%= url%>&p=<%= (pagina + 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="<%= tx_lang_A00071(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
						<a href="<%= ap_subm%>_result.asp<%= url%>&p=<%= objrs.PageCount%>" target="_self"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='"& tx_lang_A00071(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='"& tx_lang_A00072(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
          <i><%= tx_lang_A00032(cd_lang)%></i></td>
        </tr>
				<%
End If
%>
      </table>
