<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
Dim produto_navio, navio_ultima, navio_proxima, count_proc, dt_proxima_emb, dt_ultima_emb
Dim txt_navio1, txt_navio2
produto_navio = Request.QueryString("produto")

dim cnnBroker, cmdBroker, rsBroker
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

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
end sub

if produto_navio = "01" Then
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT COUNT(DISTINCT P.NR_PROCESSO) AS QTD_PROCESSO, "&_
    "                 COUNT(DISTINCT P.CD_EMBARCACAO) AS QTD_EMBARCACAO, "&_
    "                 CONVERT(VARCHAR, MIN(V.DT_ESPERADA), 103) AS DT_PROXIMA, "&_
    "                 CASE (SELECT COUNT(DISTINCT V2.CD_EMBARCACAO) "&_
    "                       FROM TPROCESSO        P2 (NOLOCK) "&_
    "                          INNER JOIN TVIAGEM V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                   AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                   AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                   AND V2.NR_VIAGEM     = P2.NR_VIAGEM "

    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                         AND P2.CD_PRODUTO = '01' "&_
    "                         AND V2.DT_ESPERADA = MIN(V.DT_ESPERADA)) "&_
    "                     WHEN 0 THEN '" & tx_lang_001033(cd_lang) & "' "&_
    "                     WHEN 1 THEN (SELECT TOP 1 RTRIM(E2.NM_EMBARCACAO) "&_
    "                                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                 AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
      If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                    AND P2.CD_PRODUTO = '01' "&_
    "                                    AND V2.DT_ESPERADA = MIN(V.DT_ESPERADA)) "&_
    "                 ELSE '" & tx_lang_001034(cd_lang) & "' "&_
    "                 END AS NM_PROXIMA_EMBARCACAO, "&_
    "                 (SELECT CONVERT(VARCHAR, MAX(V2.DT_ENT), 103) "&_
    "                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                  AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
     If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                    AND P2.CD_PRODUTO = '01') AS DT_ULTIMA, "&_
    "                 CASE (SELECT COUNT(DISTINCT V2.CD_EMBARCACAO) "&_
    "                       FROM TPROCESSO        P2 (NOLOCK) "&_
    "                          INNER JOIN TVIAGEM V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                   AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                   AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                   AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                       WHERE P2.CD_GRUPO = '028' "&_
    "                         AND P2.CD_PRODUTO = '01' "&_
    "                         AND V2.DT_ENT = (SELECT MAX(V2.DT_ENT) "&_
    "                                          FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                             INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                          AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                          AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                          AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                             INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                            AND P2.CD_PRODUTO = '01')) "&_
    "                     WHEN 0 THEN '" & tx_lang_001033(cd_lang) & "' "&_
    "                     WHEN 1 THEN (SELECT TOP 1 RTRIM(E2.NM_EMBARCACAO) "&_
    "                                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                  AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                    AND P2.CD_PRODUTO = '01' "&_
    "                                    AND V2.DT_ENT = (SELECT MAX(V2.DT_ENT) "&_
    "                                                     FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                                        INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                                     AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                                     AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                                     AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                                        INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                                       AND P2.CD_PRODUTO = '01')) "&_
    "                 ELSE '" & tx_lang_001034(cd_lang) & "' "&_
    "                 END AS NM_ULTIMA_EMBARCACAO "&_
    "          FROM TPROCESSO        P (NOLOCK) "&_
    "             INNER JOIN TVIAGEM V (NOLOCK) ON V.CD_UNID_NEG   = '01' "&_
    "                                                     AND V.CD_PRODUTO    = P.CD_PRODUTO "&_
    "                                                     AND V.CD_EMBARCACAO = P.CD_EMBARCACAO "&_
    "                                                     AND V.NR_VIAGEM     = P.NR_VIAGEM "
     If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO "&_
        "                       WHERE G.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "            AND P.CD_PRODUTO = '01' "&_
    "            AND P.IN_CANCELADO = 0 "&_
    "            AND V.DT_ENT IS NULL"&_
    "            AND V.DT_ESPERADA > GETDATE() - 16"&_
    "            AND SUBSTRING(P.NR_PROCESSO, 5, 2) NOT IN ('TD') "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
    txt_navio1 = tx_lang_001031(cd_lang)
    txt_navio2 = tx_lang_001032(cd_lang)
Else
	if objrs.State = adStateOpen then objrs.Close()	
	sql = "SELECT COUNT(DISTINCT P.NR_PROCESSO) AS QTD_PROCESSO, "&_
    "                 COUNT(DISTINCT P.CD_EMBARCACAO) AS QTD_EMBARCACAO, "&_
    "                 CONVERT(VARCHAR, MIN(V.DT_ESPERADA), 103) AS DT_PROXIMA, "&_
    "                 CASE (SELECT COUNT(DISTINCT V2.CD_EMBARCACAO) "&_
    "                       FROM TPROCESSO        P2 (NOLOCK) "&_
    "                          INNER JOIN TVIAGEM V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                   AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                   AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                   AND V2.NR_VIAGEM     = P2.NR_VIAGEM "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql &"                         AND P2.CD_PRODUTO = '02' "&_
    "                         AND V2.DT_ESPERADA = MIN(V.DT_ESPERADA)) "&_
    "                     WHEN 0 THEN '" & tx_lang_001033(cd_lang) & "' "&_
    "                     WHEN 1 THEN (SELECT TOP 1 RTRIM(E2.NM_EMBARCACAO) "&_
    "                                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                 AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                    AND P2.CD_PRODUTO = '02' "&_
    "                                    AND V2.DT_ESPERADA = MIN(V.DT_ESPERADA)) "&_
    "                 ELSE '" & tx_lang_001034(cd_lang) & "' "&_
    "                 END AS NM_PROXIMA_EMBARCACAO, "&_
    "                 (SELECT CONVERT(VARCHAR, MAX(V2.DT_ENT), 103) "&_
    "                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                  AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                    AND P2.CD_PRODUTO = '02') AS DT_ULTIMA, "&_
    "                 CASE (SELECT COUNT(DISTINCT V2.CD_EMBARCACAO) "&_
    "                       FROM TPROCESSO        P2 (NOLOCK) "&_
    "                          INNER JOIN TVIAGEM V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                   AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                   AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                   AND V2.NR_VIAGEM     = P2.NR_VIAGEM "
     If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
     sql = sql & "                         AND P2.CD_PRODUTO = '02' "&_
    "                         AND V2.DT_ENT = (SELECT MAX(V2.DT_ENT) "&_
    "                                          FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                             INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                          AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                          AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                          AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                             INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                            AND P2.CD_PRODUTO = '02')) "&_
    "                     WHEN 0 THEN '" & tx_lang_001033(cd_lang) & "' "&_
    "                     WHEN 1 THEN (SELECT TOP 1 RTRIM(E2.NM_EMBARCACAO) "&_
    "                                  FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                     INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                  AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                  AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                  AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                     INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
         If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                    AND P2.CD_PRODUTO = '02' "&_
    "                                    AND V2.DT_ENT = (SELECT MAX(V2.DT_ENT) "&_
    "                                                     FROM TPROCESSO            P2 (NOLOCK) "&_
    "                                                        INNER JOIN TVIAGEM     V2 (NOLOCK) ON V2.CD_UNID_NEG   = '01' "&_
    "                                                                                                     AND V2.CD_PRODUTO    = P2.CD_PRODUTO "&_
    "                                                                                                     AND V2.CD_EMBARCACAO = P2.CD_EMBARCACAO "&_
    "                                                                                                     AND V2.NR_VIAGEM     = P2.NR_VIAGEM "&_
    "                                                        INNER JOIN TEMBARCACAO E2 (NOLOCK) ON E2.CD_EMBARCACAO = P2.CD_EMBARCACAO "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G2 (NOLOCK) ON G2.CD_GRUPO = P2.CD_GRUPO "&_
        "                       WHERE G2.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P2.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "                                                       AND P2.CD_PRODUTO = '02')) "&_
    "                 ELSE '" & tx_lang_001034(cd_lang) & "' "&_
    "                 END AS NM_ULTIMA_EMBARCACAO "&_
    "          FROM TPROCESSO        P (NOLOCK) "&_
    "             INNER JOIN TVIAGEM V (NOLOCK) ON V.CD_UNID_NEG   = '01' "&_
    "                                                     AND V.CD_PRODUTO    = P.CD_PRODUTO "&_
    "                                                     AND V.CD_EMBARCACAO = P.CD_EMBARCACAO "&_
    "                                                     AND V.NR_VIAGEM     = P.NR_VIAGEM "
    If Not Session("cargo_interno") = "1" Then
        sql = sql & "                          INNER JOIN TPERMISSAO_GRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO "&_
        "                       WHERE G.CD_USUARIO = '" & session("cd_usuario") & "' "
    Else
        sql = sql & " WHERE P.CD_GRUPO = '" & Session("GrupoDetalhe")& "'"
    End If
    sql = sql & "            AND P.CD_PRODUTO = '02' "&_
    "            AND P.IN_CANCELADO = 0 "&_
    "            AND V.DT_ENT IS NULL" &_
    "            AND V.DT_ESPERADA > GETDATE() - 16 "&_
    "            AND SUBSTRING(P.NR_PROCESSO, 5, 2) NOT IN ('TD') "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"	
    txt_navio1 = tx_lang_001029(cd_lang)
    txt_navio2 = tx_lang_001030(cd_lang)
    'Response.write sql
    'Response.end

End If		
call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
navio_ultima = rsBroker("NM_ULTIMA_EMBARCACAO")
navio_proxima = rsBroker("NM_PROXIMA_EMBARCACAO")
count_proc = rsBroker("QTD_PROCESSO")
if fnc_testaVar(rsBroker("DT_ULTIMA")) Then dt_ultima_emb = rsBroker("DT_ULTIMA") & " - " 
if fnc_testaVar(rsBroker("DT_PROXIMA")) Then dt_proxima_emb = rsBroker("DT_PROXIMA") & " - "
%>
    <%=tx_lang_001027(cd_lang) %><span class="cl_bold" <%If count_proc > 0 Then %> style="cursor:pointer;" onclick="javascript:window.open('/controle/viagem/cadastro_viagem_result.asp?cd_menu=12&cd_subm=03&cd_view=1801-1203-01&filtro=cd_produto&cd_produto=<%=produto_navio%>&filtro=cd_grupo&cd_grupo=<%=Session("GrupoUsuarioDefault")%>&filtro=pesquisa&pesquisa=&Autoriza=1&in_default=1','','top=30,left=30,width=750,height=550,resizable=no,status=yes');" <%End If %>><%= count_proc%></span><%=tx_lang_001028(cd_lang)%><br /><br />
    <%= txt_navio1 %><br /><span class="cl_bold"><%= dt_ultima_emb%><%= navio_ultima%></span><br />
    <%= txt_navio2 %><br /><span class="cl_bold"><%= dt_proxima_emb%><%= navio_proxima%></span>
<%
call subFechaBroker()
 %>