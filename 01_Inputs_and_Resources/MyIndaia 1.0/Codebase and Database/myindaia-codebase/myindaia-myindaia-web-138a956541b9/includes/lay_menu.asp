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
      if (nCodMenu ="01" and (objrsm("M02_CD_SUBM") = "10" or objrsm("M02_CD_SUBM") = "11")) or (nCodMenu ="08") Then
      vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO") 
      Else
      vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
      End If
    case "05" 'menu de qualidade
            If objrsm("M02_CD_SUBM") = "11" Then
              vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
            Else
        vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
            End If
    case "09" 'menu rap
      vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"_"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
    case else
      vReturn = "/"& objrsm("M01_AP_MENU") &"/"& objrsm("M02_AP_SUBM") &"/"& objrsd("M08_AP_DOCTO") &".asp?cd_menu="& objrsm("M01_CD_MENU") &"&cd_subm="& objrsm("M02_CD_SUBM") &"&cd_docto="& objrsd("M08_CD_DOCTO")
  end select
  fnc_MenuLink = vReturn
End Function

'Identificando o usuário, e grupo de empresas que ele têm acesso:
If objrsx.State = adStateOpen Then objrsx.Close
sql = " SELECT  TP.CD_USUARIO, TP.CD_GRUPO, TG.TP_PEDIDO_BUSCA AS PEDIDO_BUSCA, TG.TP_DESC_BUSCA AS DESC_BUSCA, TG.NM_GRUPO AS NOME_GRUPO, TG.CD_GRUPO AS GRUPO, TG.IN_EMAIL_CRIACAO AS IN_EMAIL_CRIACAO, TG.EMAIL_CRIACAO AS EMAIL_CRIACAO, TG.IN_EMAIL_AUTORIZACAO AS IN_EMAIL_AUTORIZACAO, TG.EMAIL_AUTORIZACAO AS EMAIL_AUTORIZACAO, TG.IN_EMAIL_PRE_AUTORIZACAO AS IN_EMAIL_PRE_AUTORIZACAO, TG.EMAIL_PRE_AUTORIZACAO AS EMAIL_PRE_AUTORIZACAO, TG.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, TG.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, TG.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, TG.IN_RAP_SEQUENCIAL AS IN_RAP_SEQUENCIAL, TG.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  TG.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, TG.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, TG.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, TG.IN_CONFERENCIA AS IN_CONFERENCIA, TG.IN_PENDENCIAS AS IN_PENDENCIAS, TG.IN_ENVIA_COMO_TI AS IN_ENVIA_COMO_TI, TG.TP_PEDIDO_BUSCA_IMP AS PEDIDO_BUSCA_IMP " &_
    " from       TPERMISSAO_GRUPO     TP " &_
    " INNER JOIN TGRUPO         TG (NOLOCK) ON(TP.CD_GRUPO=TG.CD_GRUPO) " &_
    " WHERE  TP.CD_USUARIO='"&session("cd_usuario") & "'"
  Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
  

If objrsx.eof or isnull(objrsx("GRUPO"))then
 session("NomeGrupo")="Indaiá (Usuário Interno)"
 session("GrupoUsuario")= Session("grupo_rap")
 session("GrupoUsuario2")= "0"
 session("TipoPedido")="01"
 session("TipoPedidoImp")="01"
 
 if Session("cd_usuario") = "2184" Then
   session("DescPedido")="Pedido SAP"
     session("DescPedidoImp")="Pedido SAP"
 Else
   session("DescPedido")="Pedido"
     session("DescPedidoImp")="Pedido"
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
 session("InEnviaComoTi")=""
else
 session("NomeGrupo")=objrsx("NOME_GRUPO")
 session("GrupoUsuario")=objrsx("GRUPO")
 session("GrupoUsuario2")= objrsx("GRUPO")
 session("GrupoUsuarioDefault") = objrsx("GRUPO")
 session("TipoPedido")=objrsx("PEDIDO_BUSCA")
 session("TipoPedidoImp")=objrsx("PEDIDO_BUSCA_IMP")
 session("DescPedido")="Sua referência"
 session("DescPedidoImp")="Sua referência"
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
 session("InPendencias")=objrsx("IN_PENDENCIAS")
 Session("InEnviaComoTi")=objrsx("IN_ENVIA_COMO_TI")
End if

Objrsx.Close
    If Session("cargo_interno") = "0" Then
        sql = " SELECT COUNT(CD_MBF) AS CONTADOR FROM BROKER.DBO.TMBF_INFO WHERE CD_USUARIO = '" & Session("cd_usuario") & "' AND CD_PRODUTO = '01'"
        Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
        qtde_mbf_imp = Objrsx("CONTADOR")
        vl_mbf_imp = "0"
        sql_mbf_imp = ""
        if qtde_mbf_imp > 0 Then
          vl_mbf_imp = "1"
          sql_mbf_imp = "OR (M02.M02_CD_MENU = '01' AND M02.M02_CD_SUBM = '11')"
        End If
        Objrsx.Close

        sql = " SELECT COUNT(CD_MBF) AS CONTADOR FROM BROKER.DBO.TMBF_INFO WHERE CD_USUARIO = '" & Session("cd_usuario") & "' AND CD_PRODUTO = '02'"
        Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
        qtde_mbf_exp = Objrsx("CONTADOR")
        vl_mbf_exp = "0"
        sql_mbf_exp = ""
        if qtde_mbf_exp > 0 Then
          vl_mbf_exp = "1"
          sql_mbf_exp = "OR (M02.M02_CD_MENU = '02' AND M02.M02_CD_SUBM = '13')"
        End If
        Objrsx.Close
    Else
        vl_mbf_imp = "0"
        sql_mbf_imp = ""
        vl_mbf_exp = "0"
        sql_mbf_exp = ""
    End If

    sql = " SELECT MAX(M01_CD_MENU) AS QTDE_MENU FROM M01_MENU WHERE M01_IN_ATIVO = '1' "
    Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
    qtde_menu = Objrsx("QTDE_MENU")
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
      "  (CASE M01_CD_MENU WHEN '12' THEN TOT.NR_MENU WHEN '01' THEN TOT.NR_MENU+" & vl_mbf_imp & " WHEN '02' THEN TOT.NR_MENU+" & vl_mbf_exp & " ELSE TOT.NR_MENU END) AS NR_MENU, TOT.CD_MENU "&_
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
      " AND M02_CD_SUBM = '03'"
            If Session("cargo_interno") = "1" Then
            sql = sql & " UNION"&_
          " SELECT M01_CD_MENU, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, M02_CD_SUBM, RTRIM("& tx_lang_subm &") AS  M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
          " ISNULL(( SELECT COUNT(M02_CD_SUBM) AS NR_MENU "&_
          " FROM M02_SUBM ( NOLOCK ) "&_
          " WHERE M02_CD_MENU = '05' ),0) AS NR_MENU, M01_CD_MENU"&_
          " FROM M01_MENU, M02_SUBM"&_
          " WHERE M01_CD_MENU = M02_CD_MENU"&_
          " AND M01_CD_MENU = '05'"
            End If
            If Session("cargo_interno") = "0" Then
              If qtde_mbf_imp > 0 Then             
                sql = sql & " UNION"&_
                " SELECT M01_CD_MENU, M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, M02_CD_SUBM, M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
                " ISNULL(( SELECT COUNT(M09_CD_MENU) AS NR_MENU "&_
                " FROM M09_ACESSO M09 ( NOLOCK )"&_
                " INNER JOIN M02_SUBM M02 (NOLOCK) ON M02.M02_CD_SUBM = M09.M09_CD_SUBM"&_
                "       AND M02.M02_CD_MENU = M09.M09_CD_MENU"&_
                " WHERE M09_CD_MENU = '01' "&_
                "  AND M09_CD_USUARIO = '" & Session("cd_usuario") & "' "&_
                "  AND M02.M02_IN_ATIVO = '1'"&_
                "  AND M09_IN_ACESSO = 1 GROUP BY M01_CD_MENU ),0)+1 AS NR_MENU, M01_CD_MENU "&_
                " FROM M01_MENU, M02_SUBM "&_
                " WHERE M01_CD_MENU = M02_CD_MENU "&_
                "   AND M01_CD_MENU = '01' "&_
                "  AND M02_CD_SUBM = '11' "
              End If  
              
              If qtde_mbf_exp > 0 Then             
                sql = sql & " UNION"&_
                " SELECT M01_CD_MENU, M01_NM_MENU, M01_AP_MENU, M01_NR_ORDEM, M02_CD_SUBM, M02_NM_SUBM, M02_AP_SUBM, M02_NR_ORDEM, M02_IN_VIEW, "&_
                " ISNULL(( SELECT COUNT(M09_CD_MENU) AS NR_MENU "&_
                " FROM M09_ACESSO M09 ( NOLOCK )"&_
                " INNER JOIN M02_SUBM M02 (NOLOCK) ON M02.M02_CD_SUBM = M09.M09_CD_SUBM"&_
                "       AND M02.M02_CD_MENU = M09.M09_CD_MENU"&_
                " WHERE M09_CD_MENU = '02' "&_
                "  AND M09_CD_USUARIO = '" & Session("cd_usuario") & "' "&_
                "  AND M02.M02_IN_ATIVO = '1'"&_
                "  AND M09_IN_ACESSO = 1 GROUP BY M01_CD_MENU ),0)+1 AS NR_MENU, M01_CD_MENU "&_
                " FROM M01_MENU, M02_SUBM "&_
                " WHERE M01_CD_MENU = M02_CD_MENU "&_
                "   AND M01_CD_MENU = '02' "&_
                "  AND M02_CD_SUBM = '13' "
              End If 
            End If            
      sql = sql & "ORDER BY M01_NR_ORDEM, M02_NR_ORDEM"
End If        
'Response.write sql
'response.end
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsm.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'CheckMenu=objrsm.Fields.Item("M01_CD_MENU").Value&objrsm.Fields.Item("M01_CD_MENU").Value

%>
<table height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=bg_color_tema %>">
<tr>
    <td valign="top"><span id="menu" style="display:'<% If Not in_show Then Response.Write("none")%>'">     
      <div id="divMenu" class="divMenuTop" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" >
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
            <%if request("msg")=4 then%>
            <script type="text/javascript">alert('Não foi possível exibir, pois foi encontrado mais de 1 resultado.');</script>
            <%end if%>
            <tr>
              <td width="2" rowspan="<%= (objrsm.RecordCount + 1)%>"><img src="/imagens/lay_all.gif" width="2" height="1" /></td>
            </tr>
            <%
Dim str_menu
Dim str_cont
Dim str_cont_menu_total
str_cont_menu_total = 0
str_menu = ""
in_menu_imp = "0"
in_menu_exp = "0"
qtde_menu_usuario = "0"
Do While Not objrsm.Eof
flag_lupa = 0
  'EXIBE O MENU(s&oacute; ira exibir o pr&oacute;ximo menu quando todos os sub-menus do menu atual forem exibidos)
  If str_menu <> objrsm.Fields.Item("M01_CD_MENU").Value Then
  menusexistentes=menusexistentes&objrsm.Fields.Item("M01_CD_MENU").Value

    if objrsm.Fields.Item("M01_CD_MENU").Value = "01" Then
        in_menu_imp = 1
    End If

    if objrsm.Fields.Item("M01_CD_MENU").Value = "02" Then
        in_menu_exp = 1
    End If

    if objrsx.State = adStateOpen then objrsx.Close()

    sql = " SELECT MAX(M02.M02_CD_SUBM) AS QTDE_SUBM, MAX(M02.M02_NR_ORDEM) AS MAX_ORDEM "&_
    " FROM M02_SUBM M02 (NOLOCK) "&_
    " LEFT JOIN M09_ACESSO M09 (NOLOCK) ON (M09.M09_CD_MENU = M02.M02_CD_MENU AND M09.M09_CD_SUBM = M02.M02_CD_SUBM AND M09.M09_CD_USUARIO = '" & Session("cd_usuario") & "') "&_
    " WHERE M02.M02_IN_ATIVO = '1' "&_
    " AND M02.M02_CD_MENU = '" & objrsm.Fields.Item("M01_CD_MENU").Value & "' "&_
    " AND ((M09.M09_IN_ACESSO = '1') OR (M02.M02_CD_MENU = '12' AND M02.M02_CD_SUBM = '03') OR M02.M02_CD_MENU = '05' " & sql_mbf_imp & " " & sql_mbf_exp & " )" 
    Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText

    qtde_subm = Objrsx("QTDE_SUBM")
    max_ordem = Objrsx("MAX_ORDEM")
    Objrsx.Close

%>
            <tr>
              <td><span class="folder2" id="link<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" onclick="mostra(menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>,menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img,0,<%= flag_lupa%>,<%= qtde_menu %>, <%= qtde_subm %>,'root', <%= objrsm("M02_NR_ORDEM")%>, <%= max_ordem %>)"> 
              <img src="/imagens/30/plus_t.gif" width="15" height="17" id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" /><img src="/imagens/30/folder_Close.gif" width="16" height="16" id="pasta<%= objrsm.Fields.Item("M01_CD_MENU").Value%>img" align="absmiddle" vspace="1" />  <%= objrsm.Fields.Item("M01_NM_MENU").Value%></span> 
                <!--Linha abaixo define o estado do menu('') - se todo aberto ou não (none)------------>
                <!--tp_exibir definido no logon: "0=Supervisor do Sistema,//"02='Cliente // 03=Transportadora / Seguradora -->
                <!--Administradores entram com todos os menus fechados, os demais entram apenas com menu de seus deptos abertos-->
                  <span id="menu<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" style="display:none;">
                <!------------------------------------------------------------------------------------->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="15" rowspan="<%= (objrsm.Fields.Item("NR_MENU") + 1)%>" background="/imagens/30/pto_vert.gif">&nbsp;</td>
                    <%
  End If
  str_cont = str_cont + 1
  
  'INICIO DE SUB-MENUS
  If str_menu = objrsm.Fields.Item("M01_CD_MENU").Value Then Response.Write("<tr>")

  'seleciona as personaliza&ccedil;&otilde;es
  if objrsx.State = adStateOpen then objrsx.Close()
    If (objrsm("M01_CD_MENU") = "01" and objrsm("M02_CD_SUBM") = "11") or  (objrsm("M01_CD_MENU") = "02" and objrsm("M02_CD_SUBM") = "13") Then
     sql = "SELECT CD_MBF AS M06_CD_VIEW, NM_MBF AS M06_NM_VIEW, '" & objrsm("M01_CD_MENU") & "' AS M06_CD_MENU, '" & objrsm("M02_CD_SUBM") & "' AS M06_CD_SUBM "&_
        " FROM BROKER.DBO.TMBF_INFO ( NOLOCK ) "&_
        " WHERE CD_USUARIO = '"& Session("cd_usuario") &"' "&_
        "  AND CD_PRODUTO    = '"& objrsm("M01_CD_MENU") &"'"&_     
        " ORDER BY NM_MBF"
                '"  AND M06_CD_VIEW NOT IN ('1801-1202-01','1801-1203-01','1801-0803-01','1801-0801-01','1801-0802-01') "&_
                '"  AND M06_CD_VIEW NOT IN ('1801-1202-01','1801-1203-01','1801-0803-01') "&_ 
    Else
     sql = "SELECT M06_CD_MENU, M06_CD_SUBM, M06_CD_VIEW, M06_NM_VIEW, M06_IN_PADRAO "&_
        "FROM M06_VIEW ( NOLOCK ) "&_
        "WHERE M06_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
        "  AND M06_CD_MENU    = '"& objrsm("M01_CD_MENU") &"'"&_
        "  AND M06_CD_SUBM    = '"& objrsm("M02_CD_SUBM") &"'"&_
        "  AND M06_IN_SYSTEM  = 0 "&_
                "  AND M06_CD_VIEW NOT IN ('1801-0110-01','1801-1303-01', '1801-1304-01', '1801-0113-01','1801-1202-01','1801-1203-01','1801-0803-01','1801-0801-01','1801-0802-01') "&_                  
        " ORDER BY M06_NM_VIEW, M06_IN_PADRAO DESC"
                '"  AND M06_CD_VIEW NOT IN ('1801-1202-01','1801-1203-01','1801-0803-01','1801-0801-01','1801-0802-01') "&_
                '"  AND M06_CD_VIEW NOT IN ('1801-1202-01','1801-1203-01','1801-0803-01') "&_ 
    End If
    'Response.write sql
    'Response.end

  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  'seleciona os documentos
    if objrsd.State = adStateOpen then objrsd.Close()     
    If Not Session("cargo_interno") = "1" Then  
      if objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "10" Then
          sql = "SELECT M08_CD_DOCTO, M08_NM_DOCTO, M08_AP_DOCTO"&_
          "  FROM M08_DOCTOS M08 ( NOLOCK )"&_
          "  INNER JOIN M18_DOCTOS_ADM_PEDIDOS M18 (NOLOCK) ON M18.M18_CD_DOCTO = M08.M08_CD_DOCTO AND M18_CD_USUARIO = '" & Session("cd_usuario")  & "'"&_
          "  WHERE M08_CD_MENU  = '" & objrsm.Fields.Item("M01_CD_MENU").Value & "'"&_
          "    AND M08_CD_SUBM  = '" & objrsm.Fields.Item("M02_CD_SUBM").Value & "'"&_
          "    AND M08_IN_ATIVO = 1 "&_   
          "  ORDER BY M08_NM_DOCTO, M08_NR_ORDEM "
      Else
        sql = "SELECT M08_CD_DOCTO, M08_NM_DOCTO, M08_AP_DOCTO "&_
        "FROM M08_DOCTOS ( NOLOCK ) "&_
        "WHERE M08_CD_MENU  = '"& objrsm.Fields.Item("M01_CD_MENU").Value &"' "&_
        "  AND M08_CD_SUBM  = '"& objrsm.Fields.Item("M02_CD_SUBM").Value &"' "&_
        "  AND M08_IN_ATIVO = 1 "&_  
        "ORDER BY M08_NM_DOCTO, M08_NR_ORDEM"
      End If
    Else
      sql = "SELECT M08_CD_DOCTO, M08_NM_DOCTO, M08_AP_DOCTO "&_
        "FROM M08_DOCTOS ( NOLOCK ) "&_
        "WHERE M08_CD_MENU  = '"& objrsm.Fields.Item("M01_CD_MENU").Value &"' "&_
        "  AND M08_CD_SUBM  = '"& objrsm.Fields.Item("M02_CD_SUBM").Value &"' "&_
        "  AND M08_IN_ATIVO = 1 "&_  
        "ORDER BY M08_NM_DOCTO, M08_NR_ORDEM"
    End If
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrsd.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "09") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "12") then 
  flag_lupa = 1
else
  flag_lupa = 0
end if

%>
<td><span class="folder2" id="link<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" onclick="mostra(menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>,menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img,0, <%= flag_lupa%>,<%= qtde_menu %>, <%= qtde_subm %>, <%= objrsm("M01_CD_MENU")%>, <%= objrsm("M02_NR_ORDEM")%>, <%= max_ordem %>);"><% if flag_lupa = 1 then %><img src="/imagens/30/minus_t.gif" width="15" height="17"id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1" /><%Else%><img src="/imagens/30/plus_t<%If objrsm.Fields.Item("M02_NR_ORDEM").Value = max_ordem Then%>_fim<%End If %>.gif" width="15" height="17" id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1" /><%End If%><img src="/imagens/30/
<% if flag_lupa = 1 then 
  Response.Write("button_view") 
Else 
  Response.Write("folder_") 
  If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") Then 
    Response.Write("open") 
  Else 
    Response.Write("close") 
  End if 
End if
%>
.gif" width="16" height="16" id="pasta<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>img" align="absmiddle" vspace="1"/></span>
 <% if objrsm.Fields.Item("M02_NM_SUBM").Value = "Busca Rápida" or objrsm.Fields.Item("M02_NM_SUBM").Value = "Search" then%>
    <span class="folder_busca"><%= objrsm.Fields.Item("M02_NM_SUBM").Value%></span>&nbsp;<span id="spanBusca" onclick="mostraBuscaMais('<%=objrsm("M01_CD_MENU") %>');" style="cursor:pointer"></span>
 <%else%>
    <span class="folder1"><%= objrsm.Fields.Item("M02_NM_SUBM").Value%></span>
 <%end if%>
     <span id="menu<%= objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM")%>" style="display:'<% If cd_menu&cd_subm = objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") or ((objrsm("M01_CD_MENU") = "01" and objrsm("M02_CD_SUBM") = "09") or (objrsm("M01_CD_MENU") = "02" and objrsm("M02_CD_SUBM") = "12")) Then Response.Write("") Else Response.Write("none") end if%>'" vOrdem="<%= objrsm("M02_NR_ORDEM") %>">
                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="15" background="<%If Not objrsm.Fields.Item("M02_NR_ORDEM").Value = max_ordem Then%>/imagens/30/pto_vert.gif<%End If %>">&nbsp;</td>
                          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <%
  'LINKS PARA PERSONALIZA&Ccedil;&Otilde;ES
  if objrsx.RecordCount > 0 then
    Do While Not objrsx.Eof   
        if objrsx("M06_CD_VIEW") = Request.QueryString("cd_view") Then 
        color_nm_view = "color:"& bg_color_tema_fonte & ";font-weight:bold; "
        Else
        color_nm_view = ""
        End If

        If (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "11") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "13") Then
        %>
        <tr>
        <td><nobr><img src="/imagens/30/pto_t.gif" width="15" height="17" align="middle" /></nobr></td>
        <td <% If Len(objrsx("M06_NM_VIEW")) > 18 Then Response.Write("title='"&objrsx("M06_NM_VIEW")&"'")%>>&nbsp;<a href="/MBF/redireciona_mbf.asp?in_interno=<%=Session("cargo_interno")%>&usuario=<%=Session("cd_usuario")%>&cd_mbf=<%=objrsx("M06_CD_VIEW")%>&cd_menu=<%= objrsm.Fields.Item("M01_CD_MENU").Value%>" target="_self" style="<%=color_nm_view%>"><%= Left(UCase(objrsx("M06_NM_VIEW")), 18)%>
                <% If Len(objrsx("M06_NM_VIEW")) > 18 Then Response.Write("...")%>
        </a></td>
        </tr>
        <%
        Else
%>
                              <tr>
                                <td><img src="/imagens/30/pto_t.gif" width="15" height="17" /></td>
                                <td <% If Len(objrsx("M06_NM_VIEW")) > 18 Then Response.Write("title='"&objrsx("M06_NM_VIEW")&"'")%>><a href="<% If objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0103" Then %>/import/alerta_personaliza.asp<%Else%><% If objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0203" Then %>/export/alerta_personaliza.asp<%Else%>/personaliza/cad_view.asp<%End If%><%End If%>?in_acao=editar&amp;cd_menu=<%= objrsx("M06_CD_MENU")%>&amp;cd_subm=<%= objrsx("M06_CD_SUBM")%>&amp;cd_view=<%= objrsx("M06_CD_VIEW")%>"><img src="/imagens/30/button_edit.gif" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00002(cd_lang)%>." width="14" height="14" border="0" /></a> <a href="/<%= Trim(objrsm("M01_AP_MENU"))%>/<%= Trim(objrsm("M02_AP_SUBM"))%><% If objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0103" or objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0203" Then %>_busca<%Else %>_filtros<%End If %>.asp?cd_menu=<%= objrsx.Fields.Item("M06_CD_MENU").Value%>&amp;cd_subm=<%= objrsx.Fields.Item("M06_CD_SUBM").Value%>&amp;cd_view=<%= objrsx.Fields.Item("M06_CD_VIEW").Value%>" target="_self" style="<%=color_nm_view%>"><%= Left(UCase(objrsx("M06_NM_VIEW")), 18)%>
                                      <% If Len(objrsx("M06_NM_VIEW")) > 18 Then Response.Write("...")%>
                                </a></td>
                              </tr>
                              <%
        End If
      objrsx.MoveNext
      if objrsx.Eof then Exit Do
    Loop
  end if
  
  If objrsd.RecordCount > 0 Then
    Do While Not objrsd.Eof
      If objrsd.AbsolutePosition < objrsd.RecordCount Then
%>
                              <tr>
                                <td width="21"><nobr><img src="/imagens/30/pto_t.gif" width="15" height="17" align="middle" /><img src="/imagens/30/arrow.gif" width="6" height="6" align="middle" /></nobr></td>
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
                                <td width="21"><nobr><img src="/imagens/30/pto_l.gif" width="15" height="17" align="middle" /><img src="/imagens/30/arrow.gif" width="6" height="6" align="middle" /></nobr></td>
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
    <td width="15"><img src="/imagens/30/pto_t.gif" width="15" height="25" /></td>
    <td height="18" valign="top"><input type="text" name="REF_INDAIA" value= "<%=tx_lang_E00007(cd_lang)%>" id="ReferenciaIndaia" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();"  onkeypress="if(event.keyCode == 13){linkProcurar(1);}"onclick="preencheCamposBusca('REF_INDAIA','01');" maxlength="12"/>
   <a href="javascript:linkProcurar(1);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca Processo"/></a>    </td>
    </tr>
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_l.gif" width="15" height="25" id="imgPedido"/></td>
    <td height="18" valign="top"><input type="text" name="CD_REFERENCIA" value ="<%= RTrim(session("DescPedidoImp"))%>" id="Pedido" class="editbox" style="width:95px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);}" onclick="preencheCamposBusca('CD_REFERENCIA','01');" maxlength="18"/> <input type="text" name="NR_ITEM_PO" value="<%=tx_lang_E00009(cd_lang)%>" id="NR_ITEM_PO" class="editbox" style="width:35px;border-color:#336699;" onkeypress="if(event.keyCode == 13){checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);}" onfocus="this.select();" onclick="preencheCamposBusca('CD_REFERENCIA');" maxlength="4"/>
        <a href="javascript:checaItem(document.getElementById('NR_ITEM_PO').value);linkProcurar(2);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedidoImp"))%>"/></a><br />
    </td>
    </tr>
    <%'Outros Campos %>
    <tr>
    <td width="15" valign="top"></td>
    <td valign="top"><img id="imgSetaBuscaImp" src="/imagens/30/seta_baixo3.gif" alt="Mais opções" style="cursor:pointer;" onclick="mostraBuscaMais('<%=objrsm("M01_CD_MENU") %>')"/></td>
    </tr>
    <tr><td colspan="2"><div id="BuscaMaisImp" style="display:none;">
    <table cellpadding="0" cellspacing="0">
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_l_2_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_CONTAINER_IMP" value ="<%=tx_lang_POP113(cd_lang)%>" id="NrContainerImp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(5);}" onclick="preencheCamposBusca('NR_CONTAINER_IMP','01');" maxlength="20"/> 
        <a href="javascript:linkProcurar(5);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca Container"/></a><br />
    </td>
    </tr>
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_t_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_DI_IMP" value ="<%=tx_lang_POP114(cd_lang)%>" id="NrDiImp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(6);}" onclick="preencheCamposBusca('NR_DI_IMP','01');" maxlength="10"/> 
        <a href="javascript:linkProcurar(6);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca DI"/></a><br />
    </td>
    </tr>
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_l_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_CONHECIMENTO_IMP" value ="<%=tx_lang_POP115(cd_lang)%>" id="NrConhecimento" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(7);}" onclick="preencheCamposBusca('NR_CONHECIMENTO_IMP','01');" maxlength="30"/> 
        <a href="javascript:linkProcurar(7);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca Conhecimento"/></a>
    </td>
    </tr>
    </table></div>
   </td></tr>
    <%'Fim Outros Campos %>
<%
  Else
%>
    <tr>
    <td width="15"><img src="/imagens/30/pto_t.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="REF_INDAIA2" value= "<%=tx_lang_E00007(cd_lang)%>" id="ReferenciaIndaiaExp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(3);}" maxlength="12" onclick="preencheCamposBusca('REF_INDAIA2','02');"/>
    <a href="javascript:linkProcurar(3);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca Processo"/></a>    </td>
    </tr>
  <tr>
    <td width="15"><img src="/imagens/30/pto_l.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="CD_REFERENCIA2" value= "<%= RTrim(session("DescPedido"))%>" id="PedidoExp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(4);}" maxlength="18" onclick="preencheCamposBusca('CD_REFERENCIA2','02');">
    <a href="javascript:linkProcurar(4);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedido"))%>"/></a>    </td>
    </tr>
     <%'Outros Campos %>
    <tr>
    <td width="15" valign="top"></td>
    <td valign="top"><img id="imgSetaBuscaExp" src="/imagens/30/seta_baixo3.gif" alt="Mais opções" style="cursor:pointer;" onclick="mostraBuscaMais('<%=objrsm("M01_CD_MENU") %>')"/></td>
    </tr>
    <tr><td colspan="2"><div id="BuscaMaisExp" style="display:none;">
    <table cellpadding="0" cellspacing="0">
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_l_2_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_CONTAINER_EXP" value ="<%=tx_lang_POP113(cd_lang)%>" id="NrContainerExp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(8);}" onclick="preencheCamposBusca('NR_CONTAINER_EXP','02');" maxlength="18"/> 
        <a href="javascript:linkProcurar(8);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedidoImp"))%>"/></a><br />
    </td>
    </tr>
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_t_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_BOOKING_EXP" value ="<%=tx_lang_POP116(cd_lang)%>" id="NrBookingExp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(9);}" onclick="preencheCamposBusca('NR_BOOKING_EXP','02');" maxlength="18"/> 
        <a href="javascript:linkProcurar(9);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedidoImp"))%>"/></a><br />
    </td>
    </tr>
    <tr>
    <td width="15" valign="top"><img src="/imagens/30/pto_l_a.gif" width="15" height="25"/></td>
    <td height="18" valign="top"><input type="text" name="NR_CONHECIMENTO_EXP" value ="<%=tx_lang_POP115(cd_lang)%>" id="NrConhecimentoExp" class="editbox" style="width:134px;border-color:#336699;" onfocus="this.select();" onkeypress="if(event.keyCode == 13){linkProcurar(10);}" onclick="preencheCamposBusca('NR_CONHECIMENTO_EXP','02');" maxlength="18"/> 
        <a href="javascript:linkProcurar(10);" target="_self"><img src="/imagens/30/arrow_pesq.GIF" class="bottom" border="0px" alt="Busca <%= RTrim(session("DescPedidoImp"))%>"/></a>
    </td>
    </tr>
    </table></div>
   </td></tr>
<%  
  End if
  Else
    If (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "11") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "13") or (objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "12") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "14") Then
      If(objrsm.Fields.Item("M01_CD_MENU").Value = "01" and objrsm.Fields.Item("M02_CD_SUBM").Value = "12") or (objrsm.Fields.Item("M01_CD_MENU").Value = "02" and objrsm.Fields.Item("M02_CD_SUBM").Value = "14") Then
      %>
    <tr>
    <td width="15"><img src="/imagens/30/pto_l.gif" width="15" height="17" /></td>
    <td><img src="/imagens/30/arrow.gif" align="absmiddle"/> <a href="/digitalizacao/redireciona_digitalizacao.asp?idioma=<%=cd_lang%>&produto=<%=objrsm.Fields.Item("M01_CD_MENU").Value %>&usuario=<%=Session("cd_usuario")%>&cd_menu=<%=objrsm.Fields.Item("M01_CD_MENU").Value %>" target="_self"> <%= tx_lang_POP117(cd_lang)%></a></td>
    </tr>
    <%
      Else
      If Session("cargo_interno") = "1" Then
    %>
    <tr>
    <td width="15"><img src="/imagens/30/pto_l.gif" width="15" height="17" /></td>
    <td><img src="/imagens/30/arrow.gif" align="absmiddle"/> <a href="/MBF/redireciona_mbf.asp?in_interno=<%=Session("cargo_interno")%>&usuario=<%=Session("cd_usuario")%>&cd_menu=<%=objrsm.Fields.Item("M01_CD_MENU").Value %>" target="_self"> <%= tx_lang_E00003(cd_lang)%></a></td>
    </tr>
    <%Else%>
    <tr>
    <td width="15"><img src="/imagens/30/pto_l.gif" width="15" height="17" /></td>
    <td><img src="/imagens/30/arrow.gif" align="absmiddle"/> <a href="/contato.asp?mbf=1"> <%= tx_lang_001041(cd_lang)%></a></td>
    </tr>
    <%End If End If
    Else%>
    <tr>
    <td width="15"><img src="/imagens/30/pto_l.gif" width="15" height="17" /></td>
    <td><img src="/imagens/30/arrow.gif" align="absmiddle"/> <a href="<% If objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0103" Then %>/import/alerta_personaliza.asp<%Else%><% If objrsm("M01_CD_MENU")&objrsm("M02_CD_SUBM") = "0203" Then %>/export/alerta_personaliza.asp<%Else%>/personaliza/cad_view.asp<%End If %><%End If%>?in_acao=novo&amp;cd_menu=<%= objrsm("M01_CD_MENU")%>&amp;cd_subm=<%= objrsm("M02_CD_SUBM")%>" target="_self"> <%= tx_lang_E00003(cd_lang)%></a></td>
    </tr>
                              <%
   End If
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
    str_cont_menu_total = str_cont_menu_total + 1
  objrsm.MoveNext
    If objrsm.Eof Then Exit Do    
Loop

'fecha as conex&otilde;es
If objrsd.State = adStateOpen Then objrsm.Close
If objrsm.State = adStateOpen Then objrsm.Close
'desdroi os objetos
Set objrsd = Nothing
Set objrsm = Nothing
%>
            <tr>
            <%if str_cont_menu_total = 1 Then%>
            <td></td>
            <%End If %>
            <td>
                  <img src="/imagens/30/pto_l.gif" width="15" height="17" align="absmiddle" /><img src="/imagens/30/mail_ouvi.gif" width="16" height="16" border="0" align="absmiddle" />
                  <a href="/contato.asp"><%=tx_lang_E00005(cd_lang)%></a>
             </td></tr>                  
          </table>
      </div>    
<script language="javascript" type="text/javascript">
function checaItem(valorItem){
  //alert(valorItem);
  if (valorItem == '<%=tx_lang_E00009(cd_lang)%>'){
  document.getElementById('NR_ITEM_PO').value = '';
  }
}

function solicitarMBF() {
    
}

function preencheCamposBusca(campo, menu) {
    if (menu == '01') {
        if (campo != 'REF_INDAIA' && document.getElementById('REF_INDAIA')) { document.getElementById('REF_INDAIA').value = '<%=tx_lang_E00007(cd_lang)%>' };
        if (campo != 'CD_REFERENCIA' && document.getElementById('CD_REFERENCIA')) { document.getElementById('CD_REFERENCIA').value = '<%= RTrim(session("DescPedidoImp"))%>' };
        if (campo != 'NR_CONTAINER_IMP' && document.getElementById('NR_CONTAINER_IMP')) { document.getElementById('NR_CONTAINER_IMP').value = '<%=tx_lang_POP113(cd_lang)%>' };
        if (campo != 'NR_DI_IMP' && document.getElementById('NR_DI_IMP')) { document.getElementById('NR_DI_IMP').value = '<%=tx_lang_POP114(cd_lang)%>' };
        //if (campo != 'NR_DI_IMP' && document.getElementById('NR_DI_IMP').value) { document.getElementById('NR_DI_IMP').value = '<%=tx_lang_POP114(cd_lang)%>' };
        if (campo != 'NR_CONHECIMENTO_IMP' && document.getElementById('NR_CONHECIMENTO_IMP')) { document.getElementById('NR_CONHECIMENTO_IMP').value = '<%=tx_lang_POP115(cd_lang)%>' };
    } else {
        if (campo != 'REF_INDAIA2' && document.getElementById('REF_INDAIA2')) { document.getElementById('REF_INDAIA2').value = '<%=tx_lang_E00007(cd_lang)%>' };
        if (campo != 'CD_REFERENCIA2' && document.getElementById('CD_REFERENCIA2')) { document.getElementById('CD_REFERENCIA2').value = '<%= RTrim(session("DescPedido"))%>' };
        if (campo != 'NR_CONTAINER_EXP' && document.getElementById('NR_CONTAINER_EXP')) { document.getElementById('NR_CONTAINER_EXP').value = '<%=tx_lang_POP113(cd_lang)%>' };
        if (campo != 'NR_BOOKING_EXP' && document.getElementById('NR_BOOKING_EXP')) { document.getElementById('NR_BOOKING_EXP').value = '<%=tx_lang_POP116(cd_lang)%>' };
        if (campo != 'NR_CONHECIMENTO_EXP' && document.getElementById('NR_CONHECIMENTO_EXP')) { document.getElementById('NR_CONHECIMENTO_EXP').value = '<%=tx_lang_POP115(cd_lang)%>' };
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
var url = '../../../Detalhe/BuscaPedido.asp?';
}else{
var url = '../Detalhe/BuscaPedido.asp?';
}

if (tipo==1){
    //alert(document.getElementById('ReferenciaIndaia').value);
url = url + 'tipo=1&ref_indaia=' + document.getElementById('ReferenciaIndaia').value;  //+ document.getElementById('ReferenciaIndaia').value;    
//url = url + 'tipo=1&amp;ref_indaia=' + document.getElementById('REF_INDAIA').value;    
}
if (tipo==2){
//url = url + 'tipo=2&amp;tipo_pedido=<%= RTrim(session("TipoPedidoImp")) %>&amp;cd_referencia=' + document.getElementById('CD_REFERENCIA').value;
url = url + 'tipo=2&tipo_pedido=<%= RTrim(session("TipoPedidoImp")) %>&cd_referencia=' + document.getElementById('Pedido').value;
url = url + '&nr_item_po=' + document.getElementById('NR_ITEM_PO').value;
}
if (tipo==3){
url = url + 'tipo=3&ref_indaia=' + document.getElementById('ReferenciaIndaiaExp').value;
}
if (tipo==4){
url = url + 'tipo=4&tipo_pedido=<%= RTrim(session("TipoPedido"))%>&cd_referencia=' + document.getElementById('PedidoExp').value;
}
//novos
//imp
if (tipo == 5) {//container
url = url + 'tipo=5&container=' + document.getElementById('NrContainerImp').value;
//url = url + 'tipo=5&amp;container=' + document.getElementById('NR_CONTAINER_IMP').value;
}
if (tipo == 6) {//DI
url = url + 'tipo=6&di=' + document.getElementById('NrDiImp').value;
//url = url + 'tipo=6&amp;di=' + document.getElementById('NR_DI_IMP').value;
}
if (tipo == 7) {//conhecimento
url = url + 'tipo=7&conhecimento=' + document.getElementById('NrConhecimento').value;
//url = url + 'tipo=7&amp;conhecimento=' + document.getElementById('NR_CONHECIMENTO_IMP').value;
}
//exp
if (tipo == 8) {//container
url = url + 'tipo=8&container=' + document.getElementById('NrContainerExp').value;
}
if (tipo == 9) {//booking
url = url + 'tipo=9&booking=' + document.getElementById('NrBookingExp').value;
}
if (tipo == 10) {//conhecimento
url = url + 'tipo=10&conhecimento=' + document.getElementById('NrConhecimentoExp').value;
}
window.open(url, '_self');
}

</script>
    <img src="/imagens/lay_all.gif" width="240" height="1"> </span></td>
    <td id="colunaseta" valign="top" bgcolor='<%= bg_color_barra %>' background="/imagens/30/seta<%If in_show = 1 Then%>_virada<%End If %>.jpg" style="background-repeat:no-repeat; background-position:center;"><span class="folder2" id="link" onClick="mostra(menu,menuimg,document.getElementById('colunaseta'));"><img src="/imagens/lay_all.gif" alt="<%= tx_lang_A00005(cd_lang) &" "& tx_lang_E00006(cd_lang)%>" name="menuimg" width="7" height="100%" border="0" ></span></td>
  </tr>
</table>
<%  
    nm_menu_permissao = ""
    nm_subm_permissao = ""
    if fnc_TestaVar(Request.QueryString("cd_menu")) Then 
        if objrsx.State = adStateOpen then objrsx.Close()
        sql = "SELECT M01.M01_NM_MENU AS M01_NM_MENU, M02.M02_NM_SUBM AS M02_NM_SUBM "&_
            " FROM M01_MENU M01 (NOLOCK) "&_
            " INNER JOIN M02_SUBM M02 (NOLOCK) ON M02.M02_CD_MENU = M01.M01_CD_MENU "&_
            " WHERE M01.M01_CD_MENU = '" & Request.QueryString("cd_menu") & "' AND M02.M02_CD_SUBM = '" & Request.QueryString("cd_subm") & "'"
        Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
        If Objrsx.RecordCount > 0 Then
            nm_menu_permissao = Trim(Objrsx("M01_NM_MENU"))
            nm_subm_permissao = Trim(Objrsx("M02_NM_SUBM"))
        End If
    End If

    if objrsx.State = adStateOpen then objrsx.Close()
    sql = " SELECT MAX(M02.M02_CD_SUBM) AS QTDE_SUBM, MAX(M02.M02_NR_ORDEM) AS MAX_ORDEM "&_
    " FROM M02_SUBM M02 (NOLOCK) "&_
    " LEFT JOIN M09_ACESSO M09 (NOLOCK) ON (M09.M09_CD_MENU = M02.M02_CD_MENU AND M09.M09_CD_SUBM = M02.M02_CD_SUBM AND M09.M09_CD_USUARIO = '" & Session("cd_usuario") & "') "&_
    " WHERE M02.M02_IN_ATIVO = '1' "&_
    " AND M02.M02_CD_MENU = '" & Request.QueryString("cd_menu") & "' "&_
    " AND ((M09.M09_IN_ACESSO = '1') OR (M02.M02_CD_MENU = '12' AND M02.M02_CD_SUBM = '03'))"
    Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
    qtde_subm = Objrsx("QTDE_SUBM")
    max_ordem = Objrsx("MAX_ORDEM")
    Objrsx.Close
    
    If fnc_TestaVar(Request.QueryString("cd_subm")) Then
        sql = " SELECT M02_NR_ORDEM AS NR_ORDEM FROM M02_SUBM WHERE M02_IN_ATIVO = '1' AND M02_CD_MENU = '" & Request.QueryString("cd_menu")  & "' AND M02_CD_SUBM = '" & Request.QueryString("cd_subm")  & "'"        
        Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
        nr_ordem = Objrsx("NR_ORDEM")
        Objrsx.Close
    End If

 %>
<script type="text/javascript" language="javascript">    
    var menu_inicial = '<%= Request.QueryString("cd_menu")%>';
    var subm_inicial = '<%= Request.QueryString("cd_subm")%>';
    if (menu_inicial != '' && menu_inicial != '03') {
        if (eval(document.getElementById('menu' + menu_inicial)) && eval(document.getElementById('menu' + menu_inicial + subm_inicial))) {
            mostra(eval(document.getElementById('menu' + menu_inicial)), eval(document.getElementById('menu' + menu_inicial + 'img')), eval(document.getElementById('pasta' + menu_inicial + 'img')), 0, 0, '<%= qtde_menu %>', '<%= qtde_subm %>', 'root', '<%= nr_ordem %>', '<%= max_ordem %>')
            mostra(eval(document.getElementById('menu' + menu_inicial + subm_inicial)), eval(document.getElementById('menu' + menu_inicial + subm_inicial + 'img')), eval(document.getElementById('pasta' + menu_inicial + subm_inicial + 'img')), 0, 0, '<%= qtde_menu %>', '<%= qtde_subm %>', menu_inicial, '<%= nr_ordem %>', '<%= max_ordem %>')
        } else {
            alert('ATENÇÃO: Você não possui acesso à <%= nm_menu_permissao%>/<%=nm_subm_permissao %>!\nPara visualizar este relatório, primeiro solicite no Controle de Acesso.');
            history.back();
        }
    } else {
        if ('<%=in_menu_imp %>' == '1') {
            menu_inicial = "01"
            mostra(eval(document.getElementById('menu' + menu_inicial)), eval(document.getElementById('menu' + menu_inicial + 'img')), eval(document.getElementById('pasta' + menu_inicial + 'img')), 0, 0, '<%= qtde_menu %>', '<%= qtde_subm %>', 'root', '<%= nr_ordem %>', '<%= max_ordem %>')
        } else {
            if ('<%=in_menu_exp %>' == '1') {
                menu_inicial = "02"
                mostra(eval(document.getElementById('menu' + menu_inicial)), eval(document.getElementById('menu' + menu_inicial + 'img')), eval(document.getElementById('pasta' + menu_inicial + 'img')), 0, 0, '<%= qtde_menu %>', '<%= qtde_subm %>', 'root', '<%= nr_ordem %>', '<%= max_ordem %>')
            }
        }
    }
</script>
