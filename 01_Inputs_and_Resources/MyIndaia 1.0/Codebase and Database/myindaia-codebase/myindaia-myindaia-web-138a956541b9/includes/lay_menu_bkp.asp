<%
'------------------------------------------------------------------
'Arquivo de Script e HTML: Menu Principal
'Modificado por Flávio Henrique em 01/07/2008
'
'------------------------------------------------------------------

Dim objrsm'objeto de armazenamento de resultados sql para a construção do menu
Dim objrsd'objeto de armazenamento de resultados sql para a construção do menu de documentos
Dim link  'string que cria o link para algumas páginas
Dim CheckMenuImp,menusexistentes,mensagem,tipo,check_imp, check_exp_imp, flag_lupa

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
		case "10"
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
		case else
			vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
	end select
	fnc_MenuLink = vReturn
End Function

'Identificando o usuário, e grupo de empresas que ele têm acesso:
If objrsx.State = adStateOpen Then objrsx.Close
sql = " SELECT  TP.CD_USUARIO, TP.CD_CLIENTE, TE.CD_EMPRESA , TE.CD_GRUPO, TG.TP_PEDIDO_BUSCA AS PEDIDO_BUSCA, TG.TP_DESC_BUSCA AS DESC_BUSCA, TG.NM_GRUPO AS NOME_GRUPO, TG.CD_GRUPO AS GRUPO, TG.IN_EMAIL_CRIACAO AS IN_EMAIL_CRIACAO, TG.EMAIL_CRIACAO AS EMAIL_CRIACAO, TG.IN_EMAIL_AUTORIZACAO AS IN_EMAIL_AUTORIZACAO, TG.EMAIL_AUTORIZACAO AS EMAIL_AUTORIZACAO, TG.IN_EMAIL_PRE_AUTORIZACAO AS IN_EMAIL_PRE_AUTORIZACAO, TG.EMAIL_PRE_AUTORIZACAO AS EMAIL_PRE_AUTORIZACAO, TG.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, TG.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, TG.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, TG.IN_RAP_SEQUENCIAL AS IN_RAP_SEQUENCIAL, TG.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  TG.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, TG.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, TG.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, TG.IN_CONFERENCIA AS IN_CONFERENCIA, TG.IN_PENDENCIAS AS IN_PENDENCIAS " &_
    " from       TPERMISSAO     TP " &_
    " INNER JOIN TEMPRESA_NAC   TE (NOLOCK) ON(TP.CD_CLIENTE = TE.CD_EMPRESA) " &_
    " INNER JOIN TGRUPO         TG (NOLOCK) ON(TE.CD_GRUPO=TG.CD_GRUPO) " &_
    " WHERE  TP.CD_USUARIO='"&session("cd_usuario") & "'"
	Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
	
If objrsx.eof or isnull(objrsx("GRUPO"))then
 session("NomeGrupo")="Indaiá (Usuário Interno)"
 session("GrupoUsuario")= Session("grupo_rap")
 session("GrupoUsuario2")= "0"
 session("TipoPedido")="01"
 
 if Session("cd_usuario") = "2184" Then
	 session("DescPedido")="Pedido SAP"
 Else
	 session("DescPedido")="Pedido"
 End If
 
 session("EmailCriacao")=""
 session("EmailCriacaoEmail")=""
 session("EmailAutorizacao")=""
 session("EmailAutorizacaoEmail")=""
 session("EmailPreAutorizacao")=""
 session("EmailPreAutorizacaoEmail")=""
 session("InFornecimento")=""
 session("InPackingList")=""
 session("InModoSimples")=""
 session("InRapSequencial")=""
 session("InEnviaArquivos")=""
 session("InMostraFaturados")=""
 session("InDivideEmbarcados")=""
 session("InMostraFollowup")=""
 session("InConferencia")=""
 session("InPendencias")=""
else
 session("NomeGrupo")=objrsx("NOME_GRUPO")
 session("GrupoUsuario")=objrsx("GRUPO")
 session("GrupoUsuario2")= objrsx("GRUPO")
 session("TipoPedido")=objrsx("PEDIDO_BUSCA")
 session("DescPedido")=objrsx("DESC_BUSCA")
 session("EmailCriacao")=objrsx("IN_EMAIL_CRIACAO")
 session("EmailCriacaoEmail")=objrsx("EMAIL_CRIACAO")
 session("EmailAutorizacao")=objrsx("IN_EMAIL_AUTORIZACAO")
 session("EmailAutorizacaoEmail")=objrsx("EMAIL_AUTORIZACAO")
 session("EmailPreAutorizacao")=objrsx("IN_EMAIL_PRE_AUTORIZACAO")
 session("EmailPreAutorizacaoEmail")=objrsx("EMAIL_PRE_AUTORIZACAO")
 session("InFornecimento")=objrsx("IN_FORNECIMENTO")
 session("InPackingList")=objrsx("IN_PACKING_LIST")
 session("InModoSimples")=objrsx("IN_MODO_SIMPLES")
 session("InRapSequencial")=objrsx("IN_RAP_SEQUENCIAL")
 session("InEnviaArquivos")=objrsx("IN_ENVIA_ARQUIVOS")
 session("InMostraFaturados")=objrsx("IN_MOSTRA_FATURADOS")
 session("InDivideEmbarcados")=objrsx("IN_DIVIDE_EMBARCADOS")
 session("InMostraFollowup")=objrsx("IN_MOSTRA_FOLLOWUP")
 session("InConferencia")=objrsx("IN_CONFERENCIA")
 session("InPendencias")="1"
End if
Objrsx.Close

'seleciona todos os menus e submenus
If objrsm.State = adStateOpen Then objrsm.Close
If InStr("055;060;088;131", Session("cd_cargo")) > 0 Then
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
Else
sql = "SELECT "&_
			"  M01_CD_MENU, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, "&_
			"  M02_CD_SUBM, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
			"  (CASE M01_CD_MENU WHEN '12' THEN TOT.NR_MENU+1 ELSE TOT.NR_MENU END) AS NR_MENU, TOT.CD_MENU "&_
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
			" UNION"&_
			" SELECT M01_CD_MENU, M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, M02_CD_SUBM, M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
			" ISNULL(( SELECT COUNT(M09_CD_MENU) AS NR_MENU "&_
			" FROM M09_ACESSO ( NOLOCK ) "&_
			" WHERE M09_CD_MENU = '12' "&_
			" AND M09_CD_USUARIO = '" & Session("cd_usuario") & "' "&_
			" AND M09_IN_ACESSO = 1 "&_
			" GROUP BY M01_CD_MENU ),0)+1 AS NR_MENU, M01_CD_MENU"&_
			" FROM M01_MENU, M02_SUBM"&_
			" WHERE M01_CD_MENU = M02_CD_MENU"&_
			" AND M01_CD_MENU = '12'"&_
			" AND M02_CD_SUBM = '03'"&_
			"ORDER BY M01_NR_ORDEM, M02_NR_ORDEM"
End If				
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsm.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'CheckMenu=objrsm.Fields.Item("M01_CD_MENU").Value&objrsm.Fields.Item("M01_CD_MENU").Value

%>
<table height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
<tr>
	  <td valign="top"><span id="menu" style="display:'<% If Not in_show Then Response.Write("none")%>'">			
      <div id="divMenu" class="divMenuTop">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<%mensagem=request("msg")%>
			<%if request("msg")=1 then%>
            <script type="text/javascript">alert('Pedido não encontrado!');</script>
            <%end if%>
            <%if request("msg")=2 then%>
            <script type="text/javascript">alert('Processo não encontrado!');</script>
            <%end if%>
            <%if request("msg")=3 then%>
            <script type="text/javascript">alert('<%= RTrim(session("DescPedido"))%> não encontrado(a)!');</script>
            <%end if%>
            <tr>
              <td colspan="2">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="18" colspan="2"><u><b><%= tx_lang_E00001(cd_lang)%></b></u></td>
              <td width="2" rowspan="<%= (objrsm.RecordCount + 1)%>"><img src="/imagens/lay_all.gif" width="2" height="1" /></td>
            </tr>
            <%
Dim str_menu
Dim str_cont
str_menu = ""
Do While Not objrsm.Eof
flag_lupa = 0
	'EXIBE O MENU(s&oacute; ira exibir o pr&oacute;ximo menu quando todos os sub-menus do menu atual forem exibidos)
	If str_menu <> objrsm.Fields.Item("M01_CD_MENU").Value Then
	menusexistentes=menusexistentes&objrsm.Fields.Item("M01_CD_MENU").Value
%>
            <tr>
              <td><span class="folder2" id="link<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" onclick="mostra(menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>,menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,0,<%= flag_lupa%>,<%=objrsm.Fields.Item("M01_CD_MENU").Value%>,<%=Session("tp_exibir")%>,<%=menusexistentes%>)"> 
              <%If objrsm.Fields.Item("M01_CD_MENU").Value="01" or objrsm.Fields.Item("M01_CD_MENU").Value="02" then%><img src="/imagens/icones/16x16/minus_t.gif" width="15" height="17" id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" /><%else%><img src="/imagens/icones/16x16/plus_t.gif" width="15" height="17" id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" /><%end if%><%If objrsm.Fields.Item("M01_CD_MENU").Value="01" or objrsm.Fields.Item("M01_CD_MENU").Value="02" then%><img src="/imagens/icones/16x16/folder_Open20.gif" width="16" height="16" id="pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" /> <%else%><img src="/imagens/icones/16x16/folder_Close20.gif" width="16" height="16" id="pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" /> <%end if%> <%= objrsm.Fields.Item("M01_NM_MENU").Value%></span> 
                <!--Linha abaixo define o estado do menu('') - se todo aberto ou não (none)------------>
                <!--tp_exibir definido no logon: "0=Supervisor do Sistema,//"02='Cliente // 03=Transportadora / Seguradora -->
                <!--Administradores entram com todos os menus fechados, os demais entram apenas com menu de seus deptos abertos-->
                  <span id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" style="display:'<%If objrsm.Fields.Item("M01_CD_MENU").Value="01" or objrsm.Fields.Item("M01_CD_MENU").Value="02"  then response.Write("") else response.Write("none")%>'">
                <!------------------------------------------------------------------------------------->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="15" rowspan="<%= (objrsm.Fields.Item("NR_MENU") + 1)%>" background="/imagens/icones/16x16/pto_vert.gif">&nbsp;</td>
                    <%
	End If
	str_cont = str_cont + 1
	
	'INICIO DE SUB-MENUS

	
	If str_menu = objrsm.Fields.Item("M01_CD_MENU").Value Then Response.Write("<tr>")

	'seleciona as personaliza&ccedil;&otilde;es
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT M06_CD_MENU, M06_CD_SUBM, M06_CD_VIEW, M06_NM_VIEW, M06_IN_PADRAO "&_
				"FROM M06_VIEW ( NOLOCK ) "&_
				"WHERE M06_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
				"  AND M06_CD_MENU    = '"& objrsm("M01_CD_MENU") &"'"&_
				"  AND M06_CD_SUBM    = '"& objrsm("M02_CD_SUBM") &"'"&_
				"  AND M06_IN_SYSTEM  = 0 "&_
				"  AND M06_CD_VIEW NOT IN ('1801-1202-01','1801-1203-01') "&_
				" ORDER BY M06_IN_PADRAO DESC"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'seleciona os documentos
	if objrsd.State = adStateOpen then objrsd.Close()
	sql = "SELECT M08_CD_DOCTO, M08_NM_DOCTO, M08_AP_DOCTO "&_
				"FROM M08_DOCTOS ( NOLOCK ) "&_
				"WHERE M08_CD_MENU  = '"& objrsm.Fields.Item("M01_CD_MENU").Value &"' "&_
				"  AND M08_CD_SUBM  = '"& objrsm.Fields.Item("M02_CD_SUBM").Value &"' "&_
				"  AND M08_IN_ATIVO = 1 "&_  
				"ORDER BY M08_NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsd.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "09") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "12") then 
	flag_lupa = 1
else
	flag_lupa = 0
end if

	
%>
<td><span class="folder2" id="link<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" onclick="mostra(menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>,menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,0, <%= flag_lupa%> );"><% if flag_lupa = 1 then %><img src="/imagens/icones/16x16/minus_t.gif" width="15" height="17"id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1" /><%Else%><img src="/imagens/icones/16x16/plus_t.gif" width="15" height="17" id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1" /><%End If%><img src="/imagens/icones/16x16/
<% if flag_lupa = 1 then 
	Response.Write("button_view20") 
Else 
	Response.Write("folder_") 
	If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") Then 
		Response.Write("open20") 
	Else 
		Response.Write("close20") 
	End if 
End if
%>
.gif" width="16" height="16" id="pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1" /></span>
 <% if objrsm.Fields.Item("M02_NM_SUBM").Value = "Busca Rápida" or objrsm.Fields.Item("M02_NM_SUBM").Value = "Search" then%>
    <span class="folder_busca"><%= objrsm.Fields.Item("M02_NM_SUBM").Value%></span>
 <%else%>
    <span class="folder1"><%= objrsm.Fields.Item("M02_NM_SUBM").Value%></span>
 <%end if%>
     <span id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" style="display:'<% If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") or ((objrsm("M01_CD_MENU") = "01" and objrsm("M02_CD_SUBM") = "09") or (objrsm("M01_CD_MENU") = "02" and objrsm("M02_CD_SUBM") = "12")) Then Response.Write("") Else Response.Write("none") end if%>'">
                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="15" background="/imagens/icones/16x16/pto_vert.gif">&nbsp;</td>
                          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <%
	'LINKS PARA PERSONALIZA&Ccedil;&Otilde;ES
	if objrsx.RecordCount > 0 then
		Do While Not objrsx.Eof		
%>
                              <tr>
                                <td><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="17" /></td>
                                <td <% If Len(objrsx("M06_NM_VIEW")) > 25 Then Response.Write("title='"&objrsx("M06_NM_VIEW")&"'")%><% If objrsx("M06_IN_PADRAO") Then Response.Write(" style='font-weight: bold;'")%>><a href="/personaliza/cad_view.asp?in_acao=editar&amp;cd_menu=<%= objrsx("M06_CD_MENU")%>&amp;cd_subm=<%= objrsx("M06_CD_SUBM")%>&amp;cd_view=<%= objrsx("M06_CD_VIEW")%>"><img src="/imagens/icones/16x16/button_edit20.gif" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00002(cd_lang)%>." width="14" height="14" border="0" /></a> <a href="/<%= Trim(objrsm("M01_AP_MENU"))%>/<%= Trim(objrsm("M02_AP_SUBM"))%>_filtros.asp?cd_menu=<%= objrsx.Fields.Item("M06_CD_MENU").Value%>&amp;cd_subm=<%= objrsx.Fields.Item("M06_CD_SUBM").Value%>&amp;cd_view=<%= objrsx.Fields.Item("M06_CD_VIEW").Value%>" target="_self"><%= Left(objrsx("M06_NM_VIEW"), 25)%>
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
                                <td width="21"><nobr><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="17" align="middle" /><img src="/imagens/icones/arrow_03.gif" width="6" height="6" align="middle" /></nobr></td>
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
                                <td width="21"><nobr><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="middle" /><img src="/imagens/icones/arrow_03.gif" width="6" height="6" align="middle" /></nobr></td>
                                <td>&nbsp;<a href="<%= fnc_MenuLink(objrsm.Fields.Item("M01_CD_MENU").Value)%>" target="_self"><%= objrsd.Fields.Item("M08_NM_DOCTO").Value%></a></td>
                              </tr>
                              <%
	End If
	'exibe apenas se for personaliza&ccedil;&atilde;o
	
	If objrsm.Fields.Item("M02_IN_VIEW").Value Then
		If (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "09") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "12") then
		If (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "09") Then
	%>
    <tr>
    <td width="15"><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="25" /></td>
    <td height="18" valign="top"><input type="text" name="REF_INDAIA" value= "<%=tx_lang_E00007(cd_lang)%>" id="ReferenciaIndaia" class="editbox" style="width:134px;" onfocus="this.select();"  onkeypress="if(event.keyCode == 13){linkProcurar(1);}"onclick="document.getElementById('CD_REFERENCIA').value='<%=tx_lang_E00008(cd_lang)%>';document.getElementById('NR_ITEM_PO').value='<%=tx_lang_E00009(cd_lang)%>';" maxlength="10"/>
	 <a href="javascript:linkProcurar(1);" target="_self"><img src="/imagens/icones/16x16/arrow_01.GIF" class="bottom" border="0px" alt="Busca Processo"/></a>    </td>
    </tr>
    <tr>
    <td width="15"><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="CD_REFERENCIA" value ="<%=tx_lang_E00008(cd_lang)%>" id="Pedido" class="editbox" style="width:95px;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);}" onclick="document.getElementById('REF_INDAIA').value='<%=tx_lang_E00007(cd_lang)%>';" maxlength="18"/> <input type="text" name="NR_ITEM_PO" value="<%=tx_lang_E00009(cd_lang)%>" id="NR_ITEM_PO" class="editbox" style="width:35px;" onkeypress="if(event.keyCode == 13){checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);}" onfocus="this.select();" onclick="document.getElementById('REF_INDAIA').value='<%=tx_lang_E00007(cd_lang)%>';" maxlength="4"/>
        <a href="javascript:checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);" target="_self"><img src="/imagens/icones/16x16/arrow_01.GIF" class="bottom" border="0px" alt="Busca Pedido"/></a>    </td>
    </tr>
<%
	Else
%>
    <tr>
    <td width="15"><img src="/imagens/icones/16x16/pto_t.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="REF_INDAIA2" value= "<%=tx_lang_E00007(cd_lang)%>" id="ReferenciaIndaia" class="editbox" style="width:134px;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(3);}" maxlength="10" onclick="document.getElementById('CD_REFERENCIA2').value='<%= RTrim(session("DescPedido"))%>';"/>
    <a href="javascript:linkProcurar(3);" target="_self"><img src="/imagens/icones/16x16/arrow_01.GIF" class="bottom" border="0px" alt="Busca Processo"/></a>    </td>
    </tr>
	<tr>
    <td width="15"><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="CD_REFERENCIA2" value= "<%= RTrim(session("DescPedido"))%>" id="Pedido" class="editbox" style="width:134px;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(4);}" maxlength="18" onclick="document.getElementById('REF_INDAIA2').value='<%=tx_lang_E00007(cd_lang)%>';">
    <a href="javascript:linkProcurar(4);" target="_self"><img src="/imagens/icones/16x16/arrow_01.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedido"))%>"/></a>    </td>
    </tr>
<%	
	End if
	Else
%>
                              <tr>
                                <td width="15"><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" /></td>
                                <td><img src="/imagens/icones/arrow_03.gif" width="6" height="6" /> <a href="/personaliza/cad_view.asp?in_acao=novo&amp;cd_menu=<%= objrsm("M01_CD_MENU")%>&amp;cd_subm=<%= objrsm("M02_CD_SUBM")%>" target="_self"> <%= tx_lang_E00003(cd_lang)%>...</a></td>
                              </tr>
                              <%
		End If
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
                    <td><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="absmiddle" /><a href="/ajuda/<%= objrsm.Fields.Item("M01_AP_MENU").Value%>.asp?cd_menu=<%= objrsm.Fields.Item("M01_CD_MENU").Value%>&amp;cd_subm=" target="_self"><img src="/imagens/icones/16x16/help_close20.gif" width="16" height="16" border="0" align="absmiddle" /> <%= tx_lang_E00004(cd_lang)%></a></td>
                  </tr>
                </table>
              </span></td>
            </tr>
            <%
	End If
	'Verifica se é usuário da importação para exibir o sistema de busca
		CheckMenuImp=True
		tipo=1
		check_imp = 1
		
	str_menu = objrsm("M01_CD_MENU")
	objrsm.MoveNext
Loop
'fecha as conex&otilde;es
If objrsd.State = adStateOpen Then objrsm.Close
If objrsm.State = adStateOpen Then objrsm.Close
'desdroi os objetos
Set objrsd = Nothing
Set objrsm = Nothing
%>
            <tr>
              <td><img src="/imagens/icones/16x16/pto_l.gif" width="15" height="17" align="absmiddle" /><img src="/imagens/icones/16x16/mail_ouvi20.gif" width="16" height="16" border="0" align="absmiddle" />
                  <a href="/contato.asp"><%=tx_lang_E00005(cd_lang)%></a></td></tr>
          </table>
      </div>
<script language="javascript" type="text/javascript">

function checaItem(valorItem){
	//alert(valorItem);
	if (valorItem == '<%=tx_lang_E00009(cd_lang)%>'){
	document.getElementById('NR_ITEM_PO').value = '';
	}
}

function linkProcurar(tipo){
var site = document.URL;
var contador=0;
for (i=1; i <= site.length ; i++) { 
	if (site.charAt(i) == "/"){
	contador++;
	}
}
if (contador > 4){
var url = '../../../Detalhe/BuscaPedido.asp?cd_menu=03&amp;cd_subm=01';
}else{
var url = '../Detalhe/BuscaPedido.asp?cd_menu=03&amp;cd_subm=01';
}

if (tipo==1){
url = url + '&tipo=1&amp;ref_indaia=' + document.getElementById('REF_INDAIA').value;
}
if (tipo==2){
url = url + '&tipo=2&amp;cd_referencia=' + document.getElementById('CD_REFERENCIA').value;
url = url + '&nr_item_po=' + document.getElementById('NR_ITEM_PO').value;
}
if (tipo==3){
url = url + '&tipo=3&amp;ref_indaia=' + document.getElementById('REF_INDAIA2').value;
}
if (tipo==4){
url = url + '&tipo=4&amp;tipo_pedido=<%= RTrim(session("TipoPedido"))%>&amp;cd_referencia=' + document.getElementById('CD_REFERENCIA2').value;
}
window.open(url, '_self');
}

</script>
		<img src="/imagens/lay_all.gif" width="240" height="1"> </span></td>
		<td id="colunaseta" valign="top" bgcolor='#cad4d6'  background="/imagens/seta_virada.jpg" style="background-repeat:no-repeat; background-position:center;"><span class="folder2" id="link" onClick="mostra(menu,menuimg,document.getElementById('colunaseta'));"><img src="/imagens/lay_all.gif" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00006(cd_lang)%>" name="menuimg" width="7" height="100%" border="0" ></span></td>
  </tr>
</table>