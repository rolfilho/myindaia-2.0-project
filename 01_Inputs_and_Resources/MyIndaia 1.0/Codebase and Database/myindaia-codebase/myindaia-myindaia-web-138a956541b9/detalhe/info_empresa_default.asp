<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" 

dim cnnBroker, cmdBroker, rsBroker
dim cnnBrokerAux, cmdBrokerAux, rsBrokerAux
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


%>
<%If Request.QueryString("detalhe") = "0" Then%>
<table width="700px" border="0" cellspacing="0" cellpadding="0">
<tr><td style="vertical-align:top;">
<table id="tabela_esquerda" width="365px" border="0" cellspacing="0" cellpadding="0" style="vertical-align:top;">
<tr style="vertical-align:top;">
<td colspan="3" class="cl_bold2" style="color:<%=color_texto%>;"><%=tx_lang_001037(cd_lang) %>:<br/><br/></td>
</tr>
<%
   Dim teus_exp, peso_exp, cntrs_exp
   Dim teus_imp, peso_imp, cntrs_imp
   'EXP
    sql = " SELECT SUM(QTD_CNTR) AS QTD_CNTR, SUM(VL_PESO) AS VL_PESO, SUM(QTD_TEUS) AS QTD_TEUS "&_
    " FROM (SELECT P.NR_PROCESSO, ISNULL(ROUND(SUM(CASE WHEN PEI.VL_PESO_LIQ_UNIT IS NOT NULL THEN PEI.VL_PESO_LIQ_UNIT * PEI.QT_MERCADORIA ELSE ISNULL(P.VL_PESO_LIQUIDO, 0) END), 2), 0) AS VL_PESO, "&_
    " ISNULL(PC.QTD_CNTR,0) AS QTD_CNTR, ISNULL(PC.QTD_TEUS,0)/2 AS QTD_TEUS FROM TPROCESSO P (NOLOCK) "&_
    " LEFT  JOIN TPROCESSO_EXP_ITEM   PEI (NOLOCK) ON PEI.NR_PROCESSO = P.NR_PROCESSO  "&_
    " left JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "&_
    " LEFT JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = '132' "&_
    " LEFT JOIN (SELECT PC.NR_PROCESSO, COUNT(DISTINCT NR_CNTR) AS QTD_CNTR, SUM(CONVERT(INT, TC.TP_PESO)) AS QTD_TEUS "&_
    "            FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) "&_
    "            INNER JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR "&_
    "            GROUP BY PC.NR_PROCESSO) PC ON PC.NR_PROCESSO = P.NR_PROCESSO "

    If Not Session("cargo_interno") = "1" Then
    sql = sql &"  INNER JOIN TPERMISSAO_GRUPO TP (NOLOCK) ON TP.CD_GRUPO = P.CD_GRUPO AND TP.IN_ATIVO = '1' "
    End If 
    sql = sql &"   WHERE MONTH(ISNULL(F.DT_REALIZACAO, 0)) = MONTH(GETDATE()) "&_
    "   AND YEAR(ISNULL(F.DT_REALIZACAO, 0))  = YEAR(GETDATE()) "&_
    "  AND P.CD_PRODUTO = '02'"

    If Not Session("cargo_interno") = "1" Then
    sql = sql & " AND TP.CD_USUARIO = '" & Session("cd_usuario") & "' "
    Else
    sql = sql & " AND P.CD_GRUPO = '" & Session("GrupoDetalhe") & "' "
    End If

    sql = sql & "  GROUP BY P.NR_PROCESSO, PC.QTD_CNTR, PC.QTD_TEUS) AS VW "



   call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
   rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
   If rsBroker("VL_PESO") > 0  Then peso_exp = FormatNumber(rsBroker("VL_PESO"), 2)   Else peso_exp = FormatNumber(0,2)  End If
   If rsBroker("QTD_CNTR") > 0 Then cntrs_exp = rsBroker("QTD_CNTR") Else cntrs_exp = 0 End If  
   If rsBroker("QTD_TEUS") > 0 Then teus_exp = rsBroker("QTD_TEUS")  Else teus_exp = 0  End If
   call subFechaBroker()

   'Response.write sql
   'response.end

   'IMP
   sql =  " SELECT SUM(QTD_CNTR) AS QTD_CNTR, SUM(VL_PESO) AS VL_PESO, SUM(VL_MERCADORIA) AS VL_MERCADORIA, SUM(QTD_TEUS) AS QTD_TEUS "&_
          " FROM (SELECT P.NR_PROCESSO, ISNULL(SUM(CASE WHEN DM.PL_MERCADORIA IS NOT NULL THEN DM.PL_MERCADORIA ELSE ISNULL(P.VL_PESO_LIQUIDO, 0) END), 0) AS VL_PESO, "&_
          " ISNULL(SUM(CASE WHEN (DM.QT_MERC_UN_COMERC) IS NOT NULL THEN DM.QT_MERC_UN_COMERC ELSE ISNULL(P.VL_MLE_MN, 0) END), 0) AS VL_MERCADORIA, "&_
          " ISNULL(PC.QTD_CNTR,0) AS QTD_CNTR, ISNULL(PC.QTD_TEUS,0)/2 AS QTD_TEUS FROM TPROCESSO P (NOLOCK) "&_
          " LEFT JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = P.NR_PROCESSO "&_
          " LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "&_ 
          " LEFT JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = '088' "&_
          " LEFT JOIN (SELECT PC.NR_PROCESSO, COUNT(DISTINCT NR_CNTR) AS QTD_CNTR, SUM(CONVERT(INT, TC.TP_PESO)) AS QTD_TEUS "&_
          "          FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) "&_
          "          INNER JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR "&_
          "          GROUP BY PC.NR_PROCESSO) PC ON PC.NR_PROCESSO = P.NR_PROCESSO "

          If Not Session("cargo_interno") = "1" Then
          sql = sql &"  INNER JOIN TPERMISSAO_GRUPO TP (NOLOCK) ON TP.CD_GRUPO = P.CD_GRUPO AND TP.IN_ATIVO = '1' "
          End If 
          sql = sql & "  WHERE MONTH(ISNULL(F.DT_REALIZACAO, 0)) = MONTH(GETDATE())"&_
          "  AND YEAR(ISNULL(F.DT_REALIZACAO, 0))  = YEAR(GETDATE()) "&_
          " AND P.CD_PRODUTO = '01' "

          If Not Session("cargo_interno") = "1" Then
            sql = sql & " AND TP.CD_USUARIO = '" & Session("cd_usuario") & "' "
          Else
            sql = sql & " AND P.CD_GRUPO = '" & Session("GrupoDetalhe") & "' "
          End If

          sql = sql & "  GROUP BY P.NR_PROCESSO, PC.QTD_CNTR, PC.QTD_TEUS) AS VW "


   call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
   rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
   If rsBroker("VL_PESO") > 0  Then peso_imp = FormatNumber(rsBroker("VL_PESO"), 2)   Else peso_imp = FormatNumber(0,2)  End If
   If rsBroker("QTD_CNTR") > 0 Then cntrs_imp = rsBroker("QTD_CNTR") Else cntrs_imp = 0 End If  
   If rsBroker("QTD_TEUS") > 0 Then teus_imp = rsBroker("QTD_TEUS")  Else teus_imp = 0  End If
   call subFechaBroker()

 %>
<tr>
<td>&nbsp;</td><td class="cl_bold2" style="text-align:center;color:<%=color_texto%>;"><%=tx_lang_001035(cd_lang) %></td><td class="cl_bold2" style="text-align:center;color:<%=color_texto%>;"><%=tx_lang_001036(cd_lang) %></td>
</tr>
<tr>
<td>&nbsp;</td><td class="cl_bold2" style="text-align:center;color:<%=color_texto%>;">&nbsp;</td><td class="cl_bold2" style="text-align:center;color:<%=color_texto%>;">&nbsp;</td>
</tr>
<tr><td class="cl_bold2" style="text-align:left;color:<%=color_texto%>;">Teus:</td><td class="cl_bold" style="text-align:center;"><%=teus_imp%></td><td class="cl_bold" style="text-align:center;"><%=teus_exp%></td></tr>
<tr><td class="cl_bold2" style="text-align:left;color:<%=color_texto%>;">Containers:</td><td class="cl_bold" style="text-align:center;"><%=cntrs_imp%></td><td class="cl_bold" style="text-align:center;"><%=cntrs_exp%></td></tr>
<tr><td class="cl_bold2" style="text-align:left;color:<%=color_texto%>;"><%=tx_lang_001038(cd_lang) %></td><td class="cl_bold" style="text-align:center;"><%=peso_imp%></td><td class="cl_bold" style="text-align:center;"><%=peso_exp%></td></tr>
</table>
</td><td>
<table id="tabela_direita" width="350px" border="0" cellspacing="0" cellpadding="0" style="vertical-align:top;">
<tr><td style="background-image:url(\imagens\30\fundo_info_top_claro.jpg);height:6px;background-repeat:no-repeat;text-align:left;"></td></tr>	
<tr>
<td style="border:1px solid #dbe1f1;border-bottom-width:0px;border-top-width:0px;">
<div id="divInfoEmpDetalhe" style="height:130px">
<%End If%>
<table border="0" cellspacing="1" cellpadding="0" width="348px">
<%    
Dim pg_total_aux, pg_aux, nrec_aux, max_pg, min_pg 
pg_total_aux = 5

pg_aux = CInt(Request.QueryString("pagina"))
If pg_aux < 0 Then pg_aux = 0

'fabricas            
sql = " SELECT EN.CD_EMPRESA AS CD_EMPRESA, UPPER(EN.END_CIDADE) AS END_CIDADE "&_
"    FROM TPROCESSO                   P   (NOLOCK) "&_
"       LEFT  JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON PEI.NR_PROCESSO = P.NR_PROCESSO "&_
"       INNER JOIN TEMPRESA_NAC       EN  (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "&_
"       INNER JOIN TFOLLOWUP          F   (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO "&_
"                                                            AND F.CD_EVENTO IN ('132','088') "&_
"       LEFT  JOIN (SELECT PC.NR_PROCESSO, COUNT(*) AS QTD_CNTR, SUM(CONVERT(INT, TC.TP_PESO)) AS QTD_TEUS "&_
"            FROM TPROCESSO_CNTR PC (NOLOCK) "&_
"             INNER JOIN TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR "&_
"                   GROUP BY PC.NR_PROCESSO) PC ON PC.NR_PROCESSO = P.NR_PROCESSO "
If Not Session("cargo_interno") = "1" Then
          sql = sql &"  INNER JOIN TPERMISSAO_GRUPO TP (NOLOCK) ON TP.CD_GRUPO = P.CD_GRUPO AND TP.IN_ATIVO = '1' "
          End If 

sql = sql & "    WHERE MONTH(ISNULL(F.DT_REALIZACAO, 0)) = MONTH(GETDATE()) "&_
"      AND YEAR(ISNULL(F.DT_REALIZACAO, 0))  = YEAR(GETDATE())"
If Not Session("cargo_interno") = "1" Then
    sql = sql & " AND TP.CD_USUARIO = '" & Session("cd_usuario") & "' "
Else
    sql = sql & " AND P.CD_GRUPO = '" & Session("GrupoDetalhe") & "' "
End If                        
sql = sql &"    GROUP BY EN.CD_EMPRESA, EN.END_CIDADE "

call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
If rsBroker.RecordCount > 0 Then
%>
<tr><td class="cl_bold2" style="vertical-align:top;color:<%=color_texto%>;">&nbsp;<%=tx_lang_001039(cd_lang) %></td><td class="cl_bold2" style="vertical-align:top;text-align:center;color:<%=color_texto%>;" colspan="3"><br /><%=tx_lang_001035(cd_lang) %></td><td class="cl_bold2" style="vertical-align:top;text-align:center;color:<%=color_texto%>;" colspan="3"><br /><%=tx_lang_001036(cd_lang) %></td></tr>
<tr><td class="cl_bold2" style="vertical-align:top;color:<%=color_texto%>;">&nbsp;</td><td class="cl_bold2" style="vertical-align:top;text-align:center;color:<%=color_texto%>;">Teus</td><td class="cl_bold2" style="vertical-align:top;width:150px;text-align:center;color:<%=color_texto%>;">Cntrs</td><td class="cl_bold2" style="vertical-align:top;width:150px;text-align:center;color:<%=color_texto%>;">Ton</td><td class="cl_bold2" style="vertical-align:top;width:150px;text-align:center;color:<%=color_texto%>;">Teus</td><td class="cl_bold2" style="vertical-align:top;width:150px;text-align:center;color:<%=color_texto%>;">Cntrs</td><td class="cl_bold2" style="vertical-align:top;width:150px;text-align:center;color:<%=color_texto%>;">Ton</td></tr>
<%
    rsBroker.PageSize = pg_total_aux
    rsBroker.AbsolutePosition = (pg_total_aux * pg_aux) + 1
    If pg_aux = rsBroker.PageCount - 1 Then max_pg = 1 Else max_pg = 0 End If
    If rsBroker.AbsolutePosition = 1 Then min_pg = 1 Else min_pg = 0 End If
    Do While nrec_aux < rsBroker.PageSize and Not rsBroker.Eof
        cd_empresa = rsBroker("CD_EMPRESA")
        'imp

            sql2 = " SELECT CD_EMPRESA, SUM(QTD_CNTR) QTD_CNTR, SUM(VL_PESO) VL_PESO, SUM(VL_MERCADORIA) VL_MERCADORIA, SUM(QTD_TEUS) QTD_TEUS "&_
               " FROM (SELECT P.NR_PROCESSO, EN.CD_EMPRESA, ISNULL(SUM(CASE WHEN DM.PL_MERCADORIA IS NOT NULL THEN DM.PL_MERCADORIA ELSE ISNULL(P.VL_PESO_LIQUIDO, 0) END), 0) AS VL_PESO, "&_
               " ISNULL(SUM(CASE WHEN (DM.QT_MERC_UN_COMERC) IS NOT NULL THEN DM.QT_MERC_UN_COMERC ELSE ISNULL(P.VL_MLE_MN, 0) END), 0) AS VL_MERCADORIA, "&_
               " ISNULL(PC.QTD_CNTR,0) AS QTD_CNTR, ISNULL(PC.QTD_TEUS,0)/2 AS QTD_TEUS FROM TPROCESSO P (NOLOCK) "&_
               " LEFT JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = P.NR_PROCESSO "&_
               " left JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "&_
               " LEFT JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = '088' "&_
               " LEFT JOIN (SELECT PC.NR_PROCESSO, COUNT(DISTINCT NR_CNTR) AS QTD_CNTR, SUM(CONVERT(INT, TC.TP_PESO)) AS QTD_TEUS "&_
               "             FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) "&_
               "             INNER JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR "&_
               "             GROUP BY PC.NR_PROCESSO) PC ON PC.NR_PROCESSO = P.NR_PROCESSO "

              If Not Session("cargo_interno") = "1" Then
              sql2 = sql2 & "  INNER JOIN TPERMISSAO_GRUPO TP ON TP.CD_GRUPO = P.CD_GRUPO AND TP.IN_ATIVO = '1' "
              End If 

              sql2 = sql2 & "  WHERE MONTH(ISNULL(F.DT_REALIZACAO, 0)) = MONTH(GETDATE()) "&_
              "  AND YEAR(ISNULL(F.DT_REALIZACAO, 0))  = YEAR(GETDATE()) "&_
              " AND P.CD_PRODUTO = '01' "
              If Not Session("cargo_interno") = "1" Then
                  sql2 = sql2 & " AND TP.CD_USUARIO = '" & Session("cd_usuario") & "' "
              Else
                  sql2 = sql2 & " AND P.CD_GRUPO = '" & Session("GrupoDetalhe") & "' "
              End If        
              sql2 = sql2 & " AND EN.CD_EMPRESA = '" & cd_empresa & "'  "
              sql2 = sql2 & " GROUP BY P.NR_PROCESSO, EN.CD_EMPRESA, PC.QTD_CNTR, PC.QTD_TEUS) AS VW "
              sql2 = sql2 & " GROUP BY CD_EMPRESA "


        call subConectaBrokerAux("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
        rsBrokerAux.Open sql2, cnnBrokerAux, adOpenStatic, adLockReadOnly, adCmdText
    
        If rsBrokerAux.RecordCount > 0 Then
        %>
        <tr>
            <td class="cl_bold" style="width:10px;text-align:center;" title="<%=rsBroker("END_CIDADE")%>"><nobr>&nbsp;<% if Len(rsBroker("END_CIDADE")) > 10 Then Response.write(Left(rsBroker("END_CIDADE"), 10) &"...") Else Response.write(rsBroker("END_CIDADE")) End If%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=rsBrokerAux("QTD_TEUS")%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=rsBrokerAux("QTD_CNTR")%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=FormatNumber(rsBrokerAux("VL_PESO"),2)%>&nbsp;</nobr></td>
        <%
        Else
        %>
         <tr>
            <td class="cl_bold" style="width:10px;text-align:center;" title="<%=rsBroker("END_CIDADE")%>"><nobr>&nbsp;<% if Len(rsBroker("END_CIDADE")) > 12 Then Response.write(Left(rsBroker("END_CIDADE"), 12) &"...") Else Response.write(rsBroker("END_CIDADE")) End If%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr>0&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr>0&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=FormatNumber(0,2)%>&nbsp;</nobr></td>
        <%
        End If
        'exp
         call subFechaBrokerAux()
         sql2 = " SELECT CD_EMPRESA, SUM(QTD_CNTR) AS QTD_CNTR, SUM(VL_PESO) AS VL_PESO, SUM(QTD_TEUS) AS QTD_TEUS "&_
        " FROM "&_
        " (SELECT P.NR_PROCESSO, EN.CD_EMPRESA, ISNULL(ROUND(SUM(CASE WHEN PEI.VL_PESO_LIQ_UNIT IS NOT NULL "&_
        " THEN PEI.VL_PESO_LIQ_UNIT * PEI.QT_MERCADORIA ELSE ISNULL(P.VL_PESO_LIQUIDO, 0) END), 2), 0) AS VL_PESO, "&_
        " ISNULL(PC.QTD_CNTR,0) AS QTD_CNTR, ISNULL(PC.QTD_TEUS,0)/2 AS QTD_TEUS "&_
        " FROM TPROCESSO P (NOLOCK) "&_
        " LEFT JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON PEI.NR_PROCESSO = P.NR_PROCESSO "&_
        " LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIENTE "&_
        " LEFT JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO AND F.CD_EVENTO = '132' "&_
        " LEFT JOIN (SELECT PC.NR_PROCESSO, COUNT(DISTINCT NR_CNTR) AS QTD_CNTR, SUM(CONVERT(INT, TC.TP_PESO)) AS QTD_TEUS "&_
        " FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) INNER JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR "&_
        " GROUP BY PC.NR_PROCESSO) PC ON PC.NR_PROCESSO = P.NR_PROCESSO "

        If Not Session("cargo_interno") = "1" Then
        sql2 = sql2 & "  INNER JOIN TPERMISSAO_GRUPO TP ON TP.CD_GRUPO = P.CD_GRUPO AND TP.IN_ATIVO = '1' "
        End If 
        sql2 = sql2 & "  WHERE MONTH(ISNULL(F.DT_REALIZACAO, 0)) = MONTH(GETDATE())"&_
        "  AND YEAR(ISNULL(F.DT_REALIZACAO, 0))  = YEAR(GETDATE()) "&_
        " AND P.CD_PRODUTO = '02' "

        If Not Session("cargo_interno") = "1" Then
            sql2 = sql2 & " AND TP.CD_USUARIO = '" & Session("cd_usuario") & "' "
        Else
            sql2 = sql2 & " AND P.CD_GRUPO = '" & Session("GrupoDetalhe") & "' "
        End If        
        sql2 = sql2 & " AND EN.CD_EMPRESA = '" & cd_empresa & "'  "
              sql2 = sql2 & " GROUP BY P.NR_PROCESSO, EN.CD_EMPRESA, PC.QTD_CNTR, PC.QTD_TEUS) AS VW "
              sql2 = sql2 & " GROUP BY CD_EMPRESA "

     call subConectaBrokerAux("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
        rsBrokerAux.Open sql2, cnnBrokerAux, adOpenStatic, adLockReadOnly, adCmdText

        If rsBrokerAux.RecordCount > 0 Then
        %>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=rsBrokerAux("QTD_TEUS")%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=rsBrokerAux("QTD_CNTR")%>&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=FormatNumber(rsBrokerAux("VL_PESO"),2)%>&nbsp;</nobr></td>
        </tr>
        <%
        Else
        %>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr>0&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr>0&nbsp;</nobr></td>
            <td class="cl_bold" style="width:180px;text-align:center;"><nobr><%=FormatNumber(0,2)%>&nbsp;</nobr></td>
        </tr>
        <%
        End If
        nrec_aux = nrec_aux + 1
        if rsBroker.Eof Then Exit Do
        rsBroker.MoveNext
    Loop 
    call subFechaBrokerAux()
    %>
    <div style='width:100%;text-align:right;position:absolute;'>    
    <img src="/imagens/30/pag_prior_off<%If min_pg = 1 Then %>_d<%End If %>.gif" border="0" align="top" style="cursor:pointer" onclick="<%If min_pg <> 1 Then %>ExibeInfoEmpresaDetalhe('<%= CInt(pg_aux) - 1 %>');<%End If %>"/><img src="/imagens/30/pag_next_off<%If max_pg = 1 Then %>_d<%End If %>.gif" border="0" align="top" style="cursor:pointer" onclick="<%If max_pg <> 1 Then %>ExibeInfoEmpresaDetalhe('<%= CInt(pg_aux) + 1 %>');<%End If%>"/>
    </div>
    <%
 Else
 %> 
 <tr height="100px;"><td style="text-align:center;"><img name="imgAlerta" src="/imagens/30/alerta_32.gif" style="border:0;" align="absmiddle"><b><%=tx_lang_001059(cd_lang)%></b></td></tr>
 <%
 End If
%>
</table>
<%If Request.QueryString("detalhe") = "0" Then%>
</div>
</td>
</tr>	
<tr>
<td align="center" style="background-image:url(\imagens\30\fundo_info_bottom_claro.jpg);background-repeat:no-repeat;">&nbsp;</td>
</tr>
</table> 
</td></tr>      
</table>    
<%End If
call subFechaBroker()
%>    