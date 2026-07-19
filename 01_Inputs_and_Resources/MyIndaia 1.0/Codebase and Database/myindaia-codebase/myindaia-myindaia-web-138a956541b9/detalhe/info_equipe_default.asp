<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" 

dim cnnBroker, cmdBroker, rsBroker
dim cnnBrokerAux, cmdBrokerAux, rsBrokerAux
dim cnnMy, cmdMy, rsMy
dim sql2

sub subConectaBroker(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnBroker = Server.CreateObject("ADODB.Connection")
	set cmdBroker = Server.CreateObject("ADODB.Command")
	set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnBroker.Open cnstr
end sub

sub subConectaBrokerAux(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnBrokerAux = Server.CreateObject("ADODB.Connection")
	set cmdBrokerAux = Server.CreateObject("ADODB.Command")
	set rsBrokerAux  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnBrokerAux.Open cnstr
end sub

sub subConectaMy(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnMy = Server.CreateObject("ADODB.Connection")
	set cmdMy = Server.CreateObject("ADODB.Command")
	set rsMy  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnMy.Open cnstr
end sub

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
end sub

sub subFechaBrokerAux()
	if rsBrokerAux.State  = adStateOpen then rsBrokerAux.Close
	if cmdBrokerAux.State  = adStateOpen then cmdBrokerAux.Close
	if cnnBrokerAux.State  = adStateOpen then cnnBrokerAux.Close
	set rsBrokerAux = nothing
	set cmdBrokerAux = nothing
	set cnnBrokerAux = nothing
end sub

sub subFechaMy()
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
end sub
%>

                 <table width="690px" border="0" cellspacing="0" cellpadding="0" aling="center">
                        <tr height="16" align="center" class="gridtit" style="background-color:<%=cabec_result%>;">
                        <td width="17px">&nbsp;</td>
                        <td width="15px">&nbsp;</td>
                        <td width="200px"><%=tx_lang_002005(cd_lang) %></td>
                        <td width="230px"> &#43; <%=tx_lang_001040(cd_lang)%></td>
                        <td width="200px"><%=tx_lang_001041(cd_lang)%></td>
					    </tr>
                 </table>
<%
               If Session("cd_cargo") = "055" Then
                sql = " SELECT U.CD_USUARIO, U.CD_CHEFIA, U.IN_MANAGER, U.IN_MANAGER_SITE, U.CD_SUPERIOR_DIRETO, U.NM_USUARIO, U.CD_CARGO, U.IN_ONLINE, ISNULL(U.DT_ULTIMA_ACAO,0) AS DT_ACESSO, DATEADD(MINUTE, -15, GETDATE()) AS DATA_ATUAL, ISNULL(M16.M16_VL_TOTAL,0), "&_
                " (SELECT TOP 1 M17.M17_CD_VIEW FROM MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) WHERE LEFT(M17.M17_CD_VIEW, 4) = U.CD_USUARIO "&_
                " ORDER BY M17_CONTADOR DESC) MAIS_UTILIZADO, "&_
                " CASE U.CD_USUARIO WHEN '" & Session("cd_usuario") & "' THEN '1' ELSE '0' END AS IN_SUPERIOR, "&_
                " CASE WHEN U.CD_SUPERIOR_DIRETO = '" & Session("cd_usuario") & "' OR U.CD_USUARIO = '" & Session("cd_usuario") & "' THEN '1' ELSE '0' END AS IN_CHEFIADO, 1 QTD_CHEFIADO "&_
                " FROM TUSUARIO U (NOLOCK) "&_
                " LEFT JOIN MYINDAIA.DBO.M16_ESTAT_USER M16 (NOLOCK) ON M16.M16_CD_USUARIO = U.CD_USUARIO AND M16.M16_NR_ANO = YEAR(GETDATE()) AND M16.M16_NR_MES = MONTH(GETDATE()) "&_
                " INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO "&_
                " WHERE U.CD_TRANSP_ROD IN (SELECT T.CD_TRANSP_ROD (NOLOCK) FROM TUSUARIO T WHERE T.CD_USUARIO = '" & Session("cd_usuario") & "')"&_
                " AND U.IN_ATIVO = '1'"&_
                " ORDER BY IN_SUPERIOR DESC, IN_CHEFIADO DESC, M16.M16_VL_TOTAL DESC, U.IN_ONLINE DESC, U.NM_USUARIO "
                Else
                sql = " SELECT  U.CD_USUARIO, U.CD_CHEFIA, U.IN_MANAGER, U.IN_MANAGER_SITE, U.CD_SUPERIOR_DIRETO, U.NM_USUARIO, U.CD_CARGO, U.IN_ONLINE, ISNULL(U.DT_ULTIMA_ACAO,0) AS DT_ACESSO, DATEADD(MINUTE, -15, GETDATE()) AS DATA_ATUAL, ISNULL(M16.M16_VL_TOTAL,0), "&_
                    "  (SELECT TOP 1 M17.M17_CD_VIEW "&_
                    "  FROM MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) WHERE LEFT(M17.M17_CD_VIEW, 4) = U.CD_USUARIO "&_
                    "  ORDER BY M17_CONTADOR DESC) MAIS_UTILIZADO, "&_
                    "   CASE U.CD_USUARIO WHEN '" & Session("cd_usuario") & "' THEN '1' ELSE '0' END AS IN_SUPERIOR, "&_
                    "  CASE WHEN  U.CD_SUPERIOR_DIRETO = '" & Session("cd_usuario")& "' OR U.CD_USUARIO = '"&Session("cd_usuario")&"' THEN '1' ELSE '0' END AS IN_CHEFIADO, "&_
                    " (SELECT COUNT(U2.CD_USUARIO) FROM TUSUARIO U2 (NOLOCK) " &_
                    " INNER JOIN TCARGO C2 (NOLOCK) ON C2.CD_CARGO = U2.CD_CARGO" 
                    If Not Session("cargo_interno") = "1" Then
                    sql = sql & " INNER JOIN TPERMISSAO_GRUPO P2 (NOLOCK) ON P2.CD_USUARIO = U2.CD_USUARIO AND P2.CD_GRUPO ='" &  session("GrupoUsuario") & "'"
                    End If
                    sql = sql & " WHERE (ISNULL(U2.CD_SUPERIOR_DIRETO,'0732') = '" & Session("cd_usuario") & "' OR U2.CD_USUARIO = '" & Session("cd_usuario") & "')" 
                    if Session("cargo_interno") = "1" Then  
                       sql = sql &" AND C2.IN_INTERNO = '1' AND C2.CD_CARGO NOT IN ('108','130')"  
                    End If
                   sql = sql & " AND U2.IN_ATIVO = '1') QTD_CHEFIADO "&_                    
                    "  FROM TUSUARIO U (NOLOCK) "&_
                    "  LEFT JOIN MYINDAIA.DBO.M16_ESTAT_USER M16 (NOLOCK) ON M16.M16_CD_USUARIO = U.CD_USUARIO AND M16.M16_NR_ANO = YEAR(GETDATE()) AND M16.M16_NR_MES = MONTH(GETDATE()) "&_
                    "   INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO"
                    If Not Session("cargo_interno") = "1" Then
                    sql = sql & " INNER JOIN TPERMISSAO_GRUPO P (NOLOCK) ON P.CD_USUARIO = U.CD_USUARIO AND P.CD_GRUPO ='" &  session("GrupoUsuario") & "'"
                    End If
                    sql = sql & "  WHERE ((ISNULL(U.CD_SUPERIOR_DIRETO,'0732') = '" & Session("cd_usuario") & "' "&_
                    "  OR (U.CD_SUPERIOR_DIRETO = '"& Session("superior_direto") & "' "&_
                    "  AND U.CD_USUARIO <> '" & Session("superior_direto") & "'))) " &_                   
                    "  AND U.IN_ATIVO = '1'  "
                    if Session("cargo_interno") = "1" Then      
                     sql = sql & "   AND C.IN_INTERNO = '1' AND C.CD_CARGO NOT IN ('108','130')"
                   End If
                    sql = sql & "  ORDER BY IN_SUPERIOR DESC, IN_CHEFIADO DESC, M16.M16_VL_TOTAL DESC, U.IN_ONLINE DESC, U.NM_USUARIO "
               End If
               'Response.write sql
               'Response.end

                call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
                 rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText%>
                 <div style="width:690px;overflow-y:scroll;height:101px;scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
                 <table width="674px" border="0" cellspacing="0" cellpadding="0">
                 <% Dim img_online, alt_online, nome_rel_mais, cd_rel_mais, link_rel_mais, usuario_rel_mais
                 cont_usuario = 1
                 Do While Not rsBroker.Eof
                  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
                    cd_rel_mais =  rsBroker("MAIS_UTILIZADO")      
                    usuario_rel_mais = rsBroker("CD_USUARIO")       
                    cargo_rel_mais = rsBroker("CD_CARGO")    
                    nome_usuario_rel_mais = Trim(rsBroker("NM_USUARIO")) 

                    If (rsBroker("IN_ONLINE") = "1" and (rsBroker("DT_ACESSO") > rsBroker("DATA_ATUAL"))) or rsBroker("CD_USUARIO") = Session("cd_usuario") Then
                      img_online = "leg_verde2"
                      alt_online = "Online"
                    Else
                      img_online = "leg_vermelho2"
                      alt_online = "Offline"
                    End If

                    if Len(nome_usuario_rel_mais) > 30 Then
                        nome_usuario_rel_mais = Left(nome_usuario_rel_mais, 30) & "..."
                      End If
                                                   
                    sql2 = "SELECT M01.M01_AP_MENU AS AP_MENU, M02.M02_AP_SUBM AS AP_SUBM, M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_NM_VIEW, M06.M06_CD_USUARIO "&_
                    " FROM M06_VIEW M06 ( NOLOCK ) "&_ 
                    " INNER JOIN M01_MENU M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU "&_
                    " INNER JOIN M02_SUBM M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
                    " WHERE M06_CD_VIEW = '"& cd_rel_mais &"'"
                    call subConectaMy("INDAIA10","MYINDAIA", SQLUSERNAME, SQLPASSWORD)
                    rsMy.Open sql2, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
                    if rsMy.RecordCount > 0 Then    
                      nome_rel_mais = rsMy("M06_NM_VIEW")
                      alt_rel_mais = UCase(nome_rel_mais)
                      if Len(nome_rel_mais) > 25 Then
                        nome_rel_mais = Left(nome_rel_mais, 25) & "..."
                      End If
                      link_rel_mais = "/" & Trim(rsMy("AP_MENU")) & "/" & Trim(rsMy("AP_SUBM")) & "_filtros.asp?cd_menu=" & rsMy("CD_MENU") & "&cd_subm=" & rsMy("CD_SUBM") & "&cd_view=" & cd_rel_mais & "&ultima_pesquisa=1"
                    Else
                      nome_rel_mais = " - "
                      alt_rel_mais = ""
                      link_rel_mais = "#"
                    End If
                    call subFechaMy()%>
                   <tr bgcolor="<%=bgcolor%>" height="17">                   
                   <td width="15px"><%If rsBroker("IN_CHEFIADO") = "1" and rsBroker("IN_SUPERIOR") <> "1" Then%><img src="/imagens/30/pto_vert.gif" width="15" height="17" style="border:0;<%If rsBroker("QTD_CHEFIADO") = rsBroker.RecordCount Then %>visibility:hidden;<%End If%>" align="absmiddle"/><%Else%><img src="/imagens/30/<%If rsBroker.RecordCount <> cont_usuario and rsBroker.RecordCount > rsBroker("QTD_CHEFIADO") Then%>pto_t<%Else%>pto_l<%End If%>.gif" width="15" height="17" align="absmiddle" style="border:0;"/><%End If%></td>                   
                   <td width="232px"><%If rsBroker("IN_CHEFIADO") = "1" and rsBroker("IN_SUPERIOR") <> "1" Then
                   If rsBroker("IN_MANAGER_SITE") = "1" Then %><img id="img<%= rsBroker("CD_USUARIO")%>" src="/imagens/30/plus_t<%If rsBroker("QTD_CHEFIADO") = cont_usuario Then %>_fim<%End If %>.gif" style="cursor:pointer;border:0;" align="absmiddle" height="17" width="15" onclick="visualizaUsuarios('<%=rsBroker("CD_USUARIO")%>','<%=rsBroker("QTD_CHEFIADO") %>','<%=cont_usuario%>')"/><img src="/imagens/30/<%=img_online%>.gif" style="cursor:pointer;border:0;" align="absmiddle" height="14" width="14" alt="<%=alt_online%>"/>
                   <%Else%><img id="img<%= rsBroker("CD_USUARIO")%>" src="/imagens/30/<%If rsBroker("QTD_CHEFIADO") <> cont_usuario Then %>pto_t<%Else%>pto_l<%End If%>.gif" style="border:0;" align="absmiddle" height="17" width="15"/><img src="/imagens/30/<%=img_online%>.gif" style="cursor:pointer;border:0;" align="absmiddle" height="14" width="14" alt="<%=alt_online%>"/>
                   <%End If%><%Else%><img src="/imagens/30/<%=img_online%>.gif" style="cursor:pointer;border:0;" align="absmiddle" height="14" width="14" alt="<%=alt_online%>"/>&nbsp;<%End If%>&nbsp;<b><%=nome_usuario_rel_mais%></b></td>                   
                   <td width="230px" title="<%=alt_rel_mais %>"><b><img src="/imagens/30/rel162.gif" style="cursor:pointer;border:0;" align="absmiddle" />&nbsp;<a style='cursor:pointer;' href='<%=link_rel_mais %>' target='_self'><nobr><%=UCase(nome_rel_mais) %></nobr></a></b></td>
                   <td width="200px" style="text-align:center;">
                   <%If rsBroker("IN_CHEFIADO") <> "1" Then%>
                   <img src="/imagens/30/config162d.gif" style="border:0;" align="absmiddle" />&nbsp;<font size="2" style="color:#b0b0b0;"><b><%=tx_lang_001042(cd_lang) %></b></font>
                    <%Else %>                                      
                   <img src="/imagens/30/config162.gif" style="cursor:pointer;border:0;" align="absmiddle" />&nbsp;<a href="/controle/acessos/acessos_clientes.asp?cd_menu=12&cd_subm=01&cd_docto=1201-D0001&cd_usuario_rel=<%=usuario_rel_mais%>&cargo_usuario_rel=<%=cargo_rel_mais%>"><b><%=tx_lang_001042(cd_lang) %></b></a>
                   <%End If %>
                   </td>
                   </tr>
                   <%If rsBroker("IN_MANAGER_SITE") = "1" and rsBroker("CD_USUARIO") <> Session("cd_usuario") Then
                   sqlAux =  " SELECT  U.CD_USUARIO, U.IN_MANAGER, U.NM_USUARIO, U.CD_CARGO, U.IN_ONLINE, ISNULL(M16.M16_VL_TOTAL,0), ISNULL(U.DT_ULTIMA_ACAO,0) AS DT_ACESSO, DATEADD(MINUTE, -15, GETDATE()) AS DATA_ATUAL, "&_
                     " (SELECT TOP 1 M17.M17_CD_VIEW "&_
                     " FROM MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) WHERE LEFT(M17.M17_CD_VIEW, 4) = U.CD_USUARIO "&_
                     " ORDER BY M17_CONTADOR DESC) MAIS_UTILIZADO "&_
                     " FROM TUSUARIO U (NOLOCK) "&_
                     " LEFT JOIN MYINDAIA.DBO.M16_ESTAT_USER M16 (NOLOCK) ON M16.M16_CD_USUARIO = U.CD_USUARIO AND M16.M16_NR_ANO = YEAR(GETDATE()) AND M16.M16_NR_MES = MONTH(GETDATE()) "&_
                     " WHERE U.CD_SUPERIOR_DIRETO = '" & usuario_rel_mais & "' "&_
                     " AND U.IN_ATIVO = '1'  "&_
                     " ORDER BY M16.M16_VL_TOTAL DESC, U.IN_ONLINE DESC, U.NM_USUARIO"                          
                   call subConectaBrokerAux("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
                   rsBrokerAux.Open sqlAux, cnnBrokerAux, adOpenStatic, adLockReadOnly, adCmdText              
                  %>
                   <tr bgcolor="<%= bgcolor%>" align="center">
                   <td colspan="4">                
                   <div id="<%=rsBroker("CD_USUARIO")%>" style="display:none;">   
                   <table border="0" cellspacing="0" cellpadding="0" width="100%">
				   <%
                   cont_usuario_aux = 1
                   Do While Not rsBrokerAux.Eof
                   'If bgcolor2 = "#FFFFFF" Then bgcolor2 = linha_result Else bgcolor2 = "#FFFFFF"

                   cd_rel_mais =  rsBrokerAux("MAIS_UTILIZADO")      
                   usuario_rel_mais = rsBrokerAux("CD_USUARIO")       
                   cargo_rel_mais = rsBrokerAux("CD_CARGO")    
                   nome_usuario_rel_mais = Trim(rsBrokerAux("NM_USUARIO")) 
                   
                   if Len(nome_usuario_rel_mais) > 30 Then
                    nome_usuario_rel_mais = Left(nome_usuario_rel_mais, 30) & "..."
                   End If
                   
                    sql2 = "SELECT M01.M01_AP_MENU AS AP_MENU, M02.M02_AP_SUBM AS AP_SUBM, M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_NM_VIEW, M06.M06_CD_USUARIO "&_
                    " FROM M06_VIEW M06 ( NOLOCK ) "&_ 
                    " INNER JOIN M01_MENU M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU "&_
                    " INNER JOIN M02_SUBM M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
                    " WHERE M06_CD_VIEW = '"& cd_rel_mais &"'"
                    call subConectaMy("INDAIA10","MYINDAIA", SQLUSERNAME, SQLPASSWORD)
                    rsMy.Open sql2, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
                    if rsMy.RecordCount > 0 Then    
                      nome_rel_mais = rsMy("M06_NM_VIEW")
                      alt_rel_mais = UCase(nome_rel_mais)
                      if Len(nome_rel_mais) > 25 Then
                        nome_rel_mais = Left(nome_rel_mais, 25) & "..."
                      End If
                      link_rel_mais = "/" & Trim(rsMy("AP_MENU")) & "/" & Trim(rsMy("AP_SUBM")) & "_filtros.asp?cd_menu=" & rsMy("CD_MENU") & "&cd_subm=" & rsMy("CD_SUBM") & "&cd_view=" & cd_rel_mais & "&ultima_pesquisa=1"
                    Else
                      nome_rel_mais = " - "
                      alt_rel_mais = ""
                      link_rel_mais = "#"
                    End If
                    call subFechaMy()

                    If (rsBrokerAux("IN_ONLINE") = "1" and (rsBrokerAux("DT_ACESSO") > rsBrokerAux("DATA_ATUAL"))) or rsBrokerAux("CD_USUARIO") = Session("cd_usuario") Then
                      img_online = "leg_verde2"
                      alt_online = "Online"
                    Else
                      img_online = "leg_vermelho2"
                      alt_online = "Offline"
                    End If
                   %>
                   <tr bgcolor="<%=bgcolor2%>" height="17" >
                   <td width="15px"><img src="/imagens/30/pto_vert.gif" width="15" height="17" style="border:0;<%If rsBroker("QTD_CHEFIADO") = rsBroker.recordCount Then %>visibility:hidden;<%End If%>" align="absmiddle"/></td>
                   <td><img src="/imagens/30/pto_vert.gif" width="15" height="17" style="border:0;<%If rsBroker("QTD_CHEFIADO") = cont_usuario Then %>visibility:hidden;<%End If%>" align="absmiddle"/><img src="/imagens/30/<%If rsBrokerAux.RecordCount <> cont_usuario_aux Then%>pto_t<%Else%>pto_l<%End If%>.gif" width="15" height="17" style="border:0;" align="absmiddle"/><img src="/imagens/30/<%=img_online%>.gif" style="cursor:pointer;border:0;" align="absmiddle" height="14" width="14" alt="<%=alt_online%>"/>&nbsp;&nbsp;<b><%=nome_usuario_rel_mais%></b></td>
                   <td width="230px" title="<%=alt_rel_mais %>"><b><img src="/imagens/30/rel162.gif" style="cursor:pointer;border:0;" align="absmiddle" />&nbsp;<a style='cursor:pointer;' href='<%=link_rel_mais %>' target='_self'><nobr><%=UCase(nome_rel_mais) %></nobr></a></b></td>
                   <td width="200px" style="text-align:center;"><b><img src="/imagens/30/config162.gif" style="cursor:pointer;border:0;" align="absmiddle" />&nbsp;<a href="/controle/acessos/acessos_clientes.asp?cd_menu=12&cd_subm=01&cd_docto=1201-D0001&cd_usuario_rel=<%=usuario_rel_mais%>&cargo_usuario_rel=<%=cargo_rel_mais%>"><%=tx_lang_001042(cd_lang) %></a></b></td>
                   </tr>
                   <%
                   cont_usuario_aux = cont_usuario_aux + 1
                   rsBrokerAux.MoveNext
                   If rsBrokerAux.Eof Then Exit Do 
                   Loop %>
                   </table>  
                   </div>                 
                   </td>
                   </tr>                   
                   <%End If%> 
                   <%
                   cont_usuario = cont_usuario + 1
                   rsBroker.MoveNext
                 If rsBroker.Eof Then Exit Do                  
                 Loop
                 call subFechaBroker()
                 %>
                </table>
                </div>