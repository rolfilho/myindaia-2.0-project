<%
'------------------------------------------------------------------
'Arquivo de Script e HTML: Menu Principal
'Modificado por Alexandre Gonçalves Neto em 27/06/2005
'
'------------------------------------------------------------------
Dim objrsm'objeto de armazenamento de resultados sql para a construção do menu
Dim objrsd'objeto de armazenamento de resultados sql para a construção do menu de documentos
Dim link  'string que cria o link para algumas páginas

Set objrsm = Server.CreateObject("ADODB.Recordset")
Set objrsd = Server.CreateObject("ADODB.Recordset")

Function fnc_MenuLink(nCodMenu)
	'OBJETIVO: criar o link para os menus de documento
	select case nCodMenu
		case "01","02","03","06","08" 'menu personalização
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
		case "05" 'menu de qualidade
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
		case "09" 'menu rap
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"_"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
		case else
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
	end select
	fnc_MenuLink = vReturn
End Function

'seleciona todos os menus e submenus
sql = "SELECT "&_
			"  M01_CD_MENU, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, "&_
			"  M02_CD_SUBM, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
			"  TOT.NR_MENU, TOT.CD_MENU "&_
			"FROM M01_MENU ( NOLOCK ), M02_SUBM ( NOLOCK ), M09_ACESSO ( NOLOCK ), ( "&_
			"  SELECT COUNT(M01_CD_MENU) AS NR_MENU, M01_CD_MENU AS CD_MENU "&_
			"  FROM M01_MENU ( NOLOCK ), M02_SUBM ( NOLOCK ), M09_ACESSO ( NOLOCK ) "&_
			"  WHERE M01_CD_MENU    = M02_CD_MENU "&_
			"    AND M01_IN_ATIVO   = 1 "&_
			"    AND M02_IN_ATIVO   = 1 "&_
			"    AND M02_CD_MENU    = M09_CD_MENU "&_
			"    AND M02_CD_SUBM    = M09_CD_SUBM "&_
			"    AND M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"    AND M09_IN_ACESSO  = 1 "&_
			"  GROUP BY M01_CD_MENU "&_
			"  ) AS TOT "&_
			"WHERE M01_CD_MENU    = M02_CD_MENU "&_
			"  AND M01_CD_MENU    = TOT.CD_MENU "&_
			"  AND M01_IN_ATIVO   = 1 "&_
			"  AND M02_IN_ATIVO   = 1 "&_
			"  AND M02_CD_MENU    = M09_CD_MENU "&_
			"  AND M02_CD_SUBM    = M09_CD_SUBM "&_
			"  AND M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"  AND M09_IN_ACESSO  = 1 "&_
			"ORDER BY M01_NR_ORDEM, M02_NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsm.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>

<table height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FCFCFC">
	<tr>
		<td valign="top" style="border-style: solid; border-width: 1px 0px 1px 1px; border-color: #333333;"><span id="menu" style="display:'<% If Not in_show Then Response.Write("none")%>'">
			<div id="divMenu" class="divMenuTop">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="18" colspan="2"><u><b><%= tx_lang_E00001(cd_lang)%></b></u></td>
						<td width="2" rowspan="<%= (objrsm.RecordCount + 1)%>"><img src="/imagens/lay_all.gif" width="2" height="1"></td>
					</tr>
					<%
Dim str_menu
Dim str_cont
str_menu = ""
Do While Not objrsm.Eof
	'EXIBE O MENU(só ira exibir o próximo menu quando todos os sub-menus do menu atual forem exibidos)
	If str_menu <> objrsm.Fields.Item("M01_CD_MENU").Value Then
%>
					<tr>
						<td><span class="folder2" id="link<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" onClick="mostra(menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>,menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,0)"> 
							<img src="/imagens/icones/16x16/minus_t.gif" width="15" height="17" id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1"><img src="/imagens/icones/16x16/folder_open.gif" width="16" height="13" id="pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1"> 
							<%= objrsm.Fields.Item("M01_NM_MENU").Value%></span> 
							<span id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" style="display:''">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="15" rowspan="<%= (objrsm.Fields.Item("NR_MENU") + 1)%>" background="/imagens/icones/16x16/pto_vert.gif">&nbsp;</td>
									<%
	End If
	str_cont = str_cont + 1
	
	'INICIO DE SUB-MENUS
	If str_menu = objrsm.Fields.Item("M01_CD_MENU").Value Then Response.Write("<tr>")

	'seleciona as personalizações
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT M06_CD_MENU, M06_CD_SUBM, M06_CD_VIEW, M06_NM_VIEW, M06_IN_PADRAO "&_
				"FROM M06_VIEW ( NOLOCK ) "&_
				"WHERE M06_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
				"  AND M06_CD_MENU    = '"& objrsm("M01_CD_MENU") &"'"&_
				"  AND M06_CD_SUBM    = '"& objrsm("M02_CD_SUBM") &"'"&_
				"  AND M06_IN_SYSTEM  = 0 "&_
				"ORDER BY M06_IN_PADRAO DESC"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'seleciona os documentos
	sql = "SELECT M08_CD_DOCTO, M08_NM_DOCTO, M08_AP_DOCTO "&_
				"FROM M08_DOCTOS ( NOLOCK ) "&_
				"WHERE M08_CD_MENU = '"& objrsm.Fields.Item("M01_CD_MENU").Value &"' "&_
				"  AND M08_CD_SUBM = '"& objrsm.Fields.Item("M02_CD_SUBM").Value &"' "&_
				"ORDER BY M08_NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsd.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
									<td><span class="folder2" id="link<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" onClick="mostra(menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>,menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,0)"> <img src="/imagens/icones/16x16/plus_t.gif" width="15" height="17" id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1"><img src="/imagens/icones/16x16/folder_<% If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") Then Response.Write("open") Else Response.Write("close")%>.gif" width="16" height="13" id="pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1"></span>
										<span class="folder1"><%= objrsm.Fields.Item("M02_NM_SUBM").Value%></span>
										<span id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" style="display:'<% If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") Then Response.Write("") Else Response.Write("none")%>'">
										<table width="100%"  border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="15" background="/imagens/icones/16x16/pto_vert.gif">&nbsp;</td>
												<td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
														<%
	'LINKS PARA PERSONALIZAÇÕES
	if objrsx.RecordCount > 0 then
		Do While Not objrsx.Eof
%>
														<tr>
															<td><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="17"></td>
															<td <% If Len(objrsx("M06_NM_VIEW")) > 25 Then Response.Write("title='"&objrsx("M06_NM_VIEW")&"'")%><% If objrsx("M06_IN_PADRAO") Then Response.Write(" style='font-weight: bold;'")%>><a href="/personaliza/cad_view.asp?in_acao=editar&cd_menu=<%= objrsx("M06_CD_MENU")%>&cd_subm=<%= objrsx("M06_CD_SUBM")%>&cd_view=<%= objrsx("M06_CD_VIEW")%>"><img src="/imagens/icones/16x16/button_edit.gif" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00002(cd_lang)%>." width="12" height="13" border="0"></a> <a href="/<%= Trim(objrsm("M01_AP_MENU"))%>/<%= Trim(objrsm("M02_AP_SUBM"))%>_filtros.asp?cd_menu=<%= objrsx.Fields.Item("M06_CD_MENU").Value%>&cd_subm=<%= objrsx.Fields.Item("M06_CD_SUBM").Value%>&cd_view=<%= objrsx.Fields.Item("M06_CD_VIEW").Value%>" target="_self"><%= Left(objrsx("M06_NM_VIEW"), 25)%>
																<% If Len(objrsx("M06_NM_VIEW")) > 25 Then Response.Write("...")%>
																</a></td>
														</tr>
														<%
			objrsx.MoveNext
			if objrsx.Eof then Exit Do
		Loop
	end if
	
	If objrsd.RecordCount > 0 Then
		Do While Not objrsd.Eof
			If objrsd.AbsolutePosition < objrsd.RecordCount Then
%>
														<tr>
															<td width="21"><nobr><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="17" align="middle"><img src="/imagens/icones/arrow_03.gif" width="6" height="6" align="middle"></nobr></td>
															<td>&nbsp;<a href="<%= fnc_MenuLink(objrsm.Fields.Item("M01_CD_MENU").Value)%>" target="_self"><%= objrsd.Fields.Item("M08_NM_DOCTO").Value%></a></td>
														</tr>
														<%
			End If
			objrsd.MoveNext
			If objrsd.Eof Then Exit Do
		Loop
		objrsd.MovePrevious
%>
														<tr>
															<td width="21"><nobr><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="middle"><img src="/imagens/icones/arrow_03.gif" width="6" height="6" align="middle"></nobr></td>
															<td>&nbsp;<a href="<%= fnc_MenuLink(objrsm.Fields.Item("M01_CD_MENU").Value)%>" target="_self"><%= objrsd.Fields.Item("M08_NM_DOCTO").Value%></a></td>
														</tr>
														<%
	End If
	'exibe apenas se for personalização
	If objrsm.Fields.Item("M02_IN_VIEW").Value Then
%>
														<tr>
															<td width="15"><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17"></td>
															<td><img src="/imagens/icones/arrow_03.gif" width="6" height="6"> <a href="/personaliza/cad_view.asp?in_acao=novo&cd_menu=<%= objrsm("M01_CD_MENU")%>&cd_subm=<%= objrsm("M02_CD_SUBM")%>" target="_self"> <%= tx_lang_E00003(cd_lang)%>...</a></td>
														</tr>
														<%
	End If
	objrsx.Close()
	objrsd.Close()
%>
													</table></td>
											</tr>
										</table>
										</span></td>
								</tr>
								<%
	'FIM DE SUB-MENUS
	If str_cont = objrsm("NR_MENU") Then
		str_cont = 0
%>
								<tr>
									<td><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="absmiddle"><a href="/ajuda/<%= objrsm.Fields.Item("M01_AP_MENU").Value%>.asp?cd_menu=<%= objrsm.Fields.Item("M01_CD_MENU").Value%>&cd_subm=" target="_self"><img src="/imagens/icones/16x16/help_close.gif" width="16" height="16" border="0" align="absmiddle"> <%= tx_lang_E00004(cd_lang)%></a></td>
								</tr>
							</table>
							</span></td>
					</tr>
					<%
	End If
	str_menu = objrsm("M01_CD_MENU")
	objrsm.MoveNext
Loop
'fecha as conexões
If objrsd.State = adStateOpen Then objrsm.Close
If objrsm.State = adStateOpen Then objrsm.Close
'desdroi os objetos
Set objrsd = Nothing
Set objrsm = Nothing
%>
					<tr>
						<td><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="absmiddle"><img src="/imagens/icones/16x16/mail.gif" width="16" height="16" border="0" align="absmiddle">
							<!--<a href="#" onClick="javascript:window.open('/detalhe/email_contato.asp?in_acao=novo','email_contato','top=20,left=20,width=450,height=450');">Contato</a>-->
							<%= tx_lang_E00005(cd_lang)%></td>
					</tr>
				</table>
				<!-- Top Anchor Scripts -->
			</div>
			<script language="javascript">
<!--
if (isNS4) {
	var divMenu = document["divMenu"];
	divMenu.top = top.pageYOffset + 600;
	divMenu.visibility = "visible";
	moveRightEdge();
} else if (isDOM) {
	var divMenu = getRef('divMenu');
	divMenu.style.top = (isNS ? window.pageYOffset : document.body.scrollTop) + 600;
	divMenu.style.visibility = "visible";
	moveRightEdge();
}
//-->
</script>
			<!-- End Top Anchor Scripts -->
			<img src="/imagens/lay_all.gif" width="240" height="1"> </span></td>
		<td valign="top" background="/imagens/bg_menu.jpg" style="background-repeat: repeat-y; background-position: center;"><span class="folder2" id="link" onClick="mostra(menu,menuimg,2)"><img name="menuimg" src="/imagens/lay_all.gif" width="9" height="100%" border="0" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00006(cd_lang)%>"></span></td>
	</tr>
</table>