<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    
    
</script>

<script type="text/javascript" language="javascript">
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <table style="cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;<%If Request.QueryString("tp_atualiza") = "1" Then %>width:598px;<%Else%>width:582px;<%End If%>" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim color As String
            Dim SqlAux, SqlAux2 As String
            Dim nr_parcial, aux, texto, cor, cor2 As String
            Dim data_1, data_2 As Date
            Dim dias As Integer
            Dim CnnAux2 As SqlConnection
            Dim CmdAux2 As SqlCommand
            color = "#FFFFFF"
            aux = 0
            
            
            If Request.QueryString("nr_parcial") = "S" Then nr_parcial = "0" Else nr_parcial = Request.QueryString("nr_parcial")
            
            If Request.QueryString("tp_atualiza") = "1" Then
                SqlAux = " SELECT P.NR_PROCESSO AS NR_PROCESSO2, F.NR_PROCESSO, F.CD_EVENTO, F.CD_RESP_REALIZACAO, ISNULL(CONVERT(VARCHAR,F.DT_REALIZACAO,103),'-') AS DT_REALIZACAO, " & _
                " F.DT_PREVISTA, F.DT_LIMITE, E.NM_EVENTO, U.AP_USUARIO, CONVERT(VARCHAR, GETDATE(), 103) AS DATA_HOJE, " & _
                " CASE F.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE F.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, F.CD_EMPRESA, '1' AS QT_DISP " & _
                " FROM TFLP_PO F (NOLOCK) " & _
                " INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = F.NR_PROCESSO AND P.CD_CLIENTE = F.CD_EMPRESA " & _
                " LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = F.CD_EVENTO) " & _
                " LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = F.CD_RESP_REALIZACAO) " & _
                " WHERE P.NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' " & _
                " AND P.IN_CANCELADO = '0'" & _
                " ORDER BY F.NR_ORDEM"
            Else
                SqlAux = " SELECT P.NR_PROCESSO AS NR_PROCESSO2, I.NR_PROCESSO, I.NR_ITEM, I.CD_EVENTO, I.CD_RESP_REALIZACAO, ISNULL(ID.CD_MODAL,'') AS CD_MODAL, ISNULL(CONVERT(VARCHAR,I.DT_REALIZACAO,103),'-') AS DT_REALIZACAO, " & _
                " I.DT_PREVISTA, I.DT_LIMITE, I.NR_ITEM_CLIENTE, E.NM_EVENTO, U.AP_USUARIO, CONVERT(VARCHAR, GETDATE(), 103) AS DATA_HOJE, " & _
                " ISNULL(RTRIM(LTRIM(POI.CD_PAIS_ORIGEM)),'-') CD_PAIS_ORIGEM, ISNULL(RTRIM(LTRIM(EE.NR_CLIENTE)),'-') NR_CLIENTE, " & _
                " CASE I.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE I.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, " & _
                " (select QT_INICIAL from TPO_ITEM (NOLOCK) " & _
                "   where(NR_PROCESSO = I.NR_PROCESSO) " & _
                " AND CD_EMPRESA = I.CD_EMPRESA " & _
                " AND NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE " & _
                " AND NR_PARCIAL = I.NR_PARCIAL) QT_DISP, I.CD_EMPRESA, " & _
                " (SELECT CONVERT(DATE,F0.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F0 WHERE CD_EVENTO = '486' AND F0.NR_PROCESSO = P.NR_REFERENCIA AND F0.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F0.NR_PARCIAL = I.NR_PARCIAL) DATA_0, " & _
                " (SELECT CONVERT(DATE,F1.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F1 WHERE CD_EVENTO = '316' AND F1.NR_PROCESSO = P.NR_REFERENCIA AND F1.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F1.NR_PARCIAL = I.NR_PARCIAL) DATA_1, " & _
                " (SELECT CONVERT(DATE,F2.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F2 WHERE CD_EVENTO = '878' AND F2.NR_PROCESSO = P.NR_REFERENCIA AND F2.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F2.NR_PARCIAL = I.NR_PARCIAL) DATA_2, " & _
                " (SELECT CONVERT(DATE,F3.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F3 WHERE CD_EVENTO = '881' AND F3.NR_PROCESSO = P.NR_REFERENCIA AND F3.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F3.NR_PARCIAL = I.NR_PARCIAL) DATA_3, " & _
                " (SELECT CONVERT(DATE,F4.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F4 WHERE CD_EVENTO = '880' AND F4.NR_PROCESSO = P.NR_REFERENCIA AND F4.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F4.NR_PARCIAL = I.NR_PARCIAL) DATA_4, " & _
                " (SELECT CONVERT(DATE,F5.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F5 WHERE CD_EVENTO = '879' AND F5.NR_PROCESSO = P.NR_REFERENCIA AND F5.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F5.NR_PARCIAL = I.NR_PARCIAL) DATA_5, " & _
                " (SELECT CONVERT(DATE,F6.DT_REALIZACAO,103) FROM TFLP_PO_ITEM F6 WHERE CD_EVENTO = '955' AND F6.NR_PROCESSO = P.NR_REFERENCIA AND F6.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND F6.NR_PARCIAL = I.NR_PARCIAL) DATA_6  " & _
                " FROM TFLP_PO_ITEM I (NOLOCK) " & _
                " INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = I.NR_PROCESSO AND POI.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = I.NR_PARCIAL AND POI.CD_EMPRESA = I.CD_EMPRESA " & _
                " LEFT JOIN TINSTRUCAO_DESEMBARACO ID (NOLOCK) ON ID.ID_CODIGO = POI.ID_CODIGO_INSTR_DESEMB " & _
                " INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = I.NR_PROCESSO AND P.CD_CLIENTE = I.CD_EMPRESA  " & _
                " LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = I.CD_EVENTO) " & _
                " LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = I.CD_RESP_REALIZACAO) " & _
                " LEFT JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = POI.CD_EXPORTADOR) " & _
                " WHERE P.NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' " & _
                " AND I.NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "' " & _
                " AND I.NR_PARCIAL = '" & nr_parcial & "' " & _
                " AND P.IN_CANCELADO = '0'" & _
                " ORDER BY I.NR_ORDEM, I.NR_ITEM_CLIENTE, I.NR_PARCIAL "
            End If
              
            'Response.Write(SqlAux)
            'Response.End()            
            
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='25px' style='font-family:Verdana;font-size:9pt;'><td><center><img src='\imagens\alerta_32.gif' style='vertical-align:middle;'>Sem informações</center></td></tr>")
            Else
                aux = 0
                Do While RsAux.Read()
                    If RsAux("CD_MODAL") = "04" Then
                        dias = 2
                    Else
                        dias = 8
                        If RsAux("CD_MODAL") = "01" Then
                        
                        
                            If RsAux("NR_CLIENTE") = "CROD5405" Then dias = 33
                            If RsAux("NR_CLIENTE") = "CROD0030" Then dias = 10
                            If RsAux("NR_CLIENTE") = "CROD5430" Then dias = 10
                            If RsAux("NR_CLIENTE") = "CROD5530" Then dias = 50
                            If RsAux("NR_CLIENTE") = "CROD5700" Then dias = 10
                            If RsAux("NR_CLIENTE") = "CROD5220" Then dias = 33
                            If RsAux("NR_CLIENTE") = "CROD5210" Then dias = 12
                            If RsAux("NR_CLIENTE") = "108503" Then dias = 10
                            If RsAux("NR_CLIENTE") = "105342" Then dias = 10
                            
                            
                            'If InStr("155704;162132;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "063" Then dias = 30
                            'If RsAux("NR_CLIENTE") = "CROD0030" And InStr("245;275;573;", RsAux("CD_PAIS_ORIGEM")) > 0 Then dias = 35
                            'If RsAux("NR_CLIENTE") = "CROD5220" And RsAux("CD_PAIS_ORIGEM") = "275" Then dias = 37
                            'If InStr("CROD5405;116848;163517;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "249" Then dias = 40
                            'If RsAux("NR_CLIENTE") = "160953" And RsAux("CD_PAIS_ORIGEM") = "767" Then dias = 45
                            'If InStr("CROD0030;160954;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "628" Then dias = 42
                            'If InStr("155704;108503;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "023" Then dias = 45
                            'If RsAux("NR_CLIENTE") = "CROD5700" And RsAux("CD_PAIS_ORIGEM") = "741" Then dias = 46
                            'If RsAux("NR_CLIENTE") = "161104" And RsAux("CD_PAIS_ORIGEM") = "249" Then dias = 50
                            'If RsAux("NR_CLIENTE") = "163220" And RsAux("CD_PAIS_ORIGEM") = "249" Then dias = 50
                            'If RsAux("NR_CLIENTE") = "165830" And RsAux("CD_PAIS_ORIGEM") = "249" Then dias = 50
                            'If RsAux("NR_CLIENTE") = "162399" And RsAux("CD_PAIS_ORIGEM") = "741" Then dias = 65
                            'If RsAux("NR_CLIENTE") = "CROD5530" And RsAux("CD_PAIS_ORIGEM") = "399" Then dias = 55
                            'If RsAux("NR_CLIENTE") = "CROD5240" And RsAux("CD_PAIS_ORIGEM") = "063" Then dias = 10
                            'If RsAux("NR_CLIENTE") = "157499" And RsAux("CD_PAIS_ORIGEM") = "239" Then dias = 55
                            'If RsAux("NR_CLIENTE") = "111615" And RsAux("CD_PAIS_ORIGEM") = "493" Then dias = 58
                            'If InStr("105493;105453;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "455" Then dias = 60
                            'If InStr("155704;105460;160195;105342;105635;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "455" Then dias = 60
                            'If InStr("121735;CROD5430;", RsAux("NR_CLIENTE")) > 0 And RsAux("CD_PAIS_ORIGEM") = "361" Then dias = 65
                            'If RsAux("NR_CLIENTE") = "155704" And RsAux("CD_PAIS_ORIGEM") = "160" Then dias = 65
                        Else
                            dias = 8
                        End If
                    End If

                    If (Not IsDBNull(RsAux("DATA_0")) And RsAux("CD_MODAL") <> "01") Or (Not IsDBNull(RsAux("DATA_1")) And RsAux("CD_MODAL") = "01") Then
                        If RsAux("CD_MODAL") = "01" Then
                            data_1 = RsAux("DATA_1")
                        Else
                            data_1 = RsAux("DATA_0")
                        End If
                        
                        If Not IsDBNull(RsAux("DATA_2")) Then data_2 = RsAux("DATA_2")                        
                        If Not IsDBNull(RsAux("DATA_6")) And IsDBNull(RsAux("DATA_2")) Then data_2 = RsAux("DATA_6")                        
                        If Not IsDBNull(RsAux("DATA_3")) And IsDBNull(RsAux("DATA_6")) And IsDBNull(RsAux("DATA_2")) Then data_2 = RsAux("DATA_3")                        
                        If Not IsDBNull(RsAux("DATA_4")) And IsDBNull(RsAux("DATA_3")) And IsDBNull(RsAux("DATA_6")) And IsDBNull(RsAux("DATA_2")) Then data_2 = RsAux("DATA_4")                        
                        If Not IsDBNull(RsAux("DATA_5")) And IsDBNull(RsAux("DATA_4")) And IsDBNull(RsAux("DATA_3")) And IsDBNull(RsAux("DATA_6")) And IsDBNull(RsAux("DATA_2")) Then data_2 = RsAux("DATA_5")
                                                 
                        If Not (data_2 = DateTime.MinValue) Then
                            If DateDiff(DateInterval.Day, data_2, data_1) >= dias Then
                                cor = "#008000"
                                cor2 = "#FFFFFF"
                                texto = "ON TIME"
                                SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 1" & _
                                          " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                          "   AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "'" & _
                                          "   AND NR_PARCIAL = '" & nr_parcial & "'" & _
                                          "   AND CD_EMPRESA = '" & RsAux("CD_EMPRESA") & "'"
                                CnnAux2 = New SqlConnection(Cnn)
                                CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                                CnnAux2.Open()
                                CmdAux2.ExecuteNonQuery()
                                CmdAux2.Dispose()
                                CnnAux2.Close()
                            Else
                                If data_2 > data_1 Or DateDiff(DateInterval.Day, data_2, data_1) < dias Then
                                    cor = "#FF0000"
                                    cor2 = "#FFFFFF"
                                    texto = "RISK"
                                    SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 2" & _
                                          " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                          "   AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "'" & _
                                          "   AND NR_PARCIAL = '" & nr_parcial & "'" & _
                                          "   AND CD_EMPRESA = '" & RsAux("CD_EMPRESA") & "'"
                                    CnnAux2 = New SqlConnection(Cnn)
                                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                                    CnnAux2.Open()
                                    CmdAux2.ExecuteNonQuery()
                                    CmdAux2.Dispose()
                                    CnnAux2.Close()
                                Else
                                    aux = 1
                                End If
                            End If
                        Else
                            cor = "#FFFF00"
                            cor2 = "#000000"
                            texto = "TO BE CONFIRMED"
                            SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 3" & _
                                  " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                  "   AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "'" & _
                                  "   AND NR_PARCIAL = '" & nr_parcial & "'" & _
                                  "   AND CD_EMPRESA = '" & RsAux("CD_EMPRESA") & "'"
                            CnnAux2 = New SqlConnection(Cnn)
                            CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                            CnnAux2.Open()
                            CmdAux2.ExecuteNonQuery()
                            CmdAux2.Dispose()
                            CnnAux2.Close()
                        End If
                    Else
                        aux = 1
                    End If
                    
                    If RsAux("QT_DISP") = 0 And Request.QueryString("tp_atualiza") <> "1" Then
                        If color = "#e7e6e6" Then
                            color = "#f4f4f4"
                        Else
                            color = "#e7e6e6"
                        End If
                    Else
                        If color = "#DEE6EF" Then
                            color = "#FFFFFF"
                        Else
                            color = "#DEE6EF"
                        End If
                    End If
                    
                    If RsAux("IN_APLICAVEL").ToString = "X" Then
                        If aux = 0 Then
                            aux = 1
                            
                            
                            
                            %>
                            <tr bgcolor="<%=cor%>" style="height:25px;text-align:center;" <%If RsAux("QT_DISP") = 0 Then%>disabled="true"<%End If %>>
                    <td colspan="5"><span style="color:<%= cor2%>;"><%=texto %></span></td>
                    </tr>
                            <%
                        End If
                        %>
                        
                        <tr bgcolor="<%=color%>" style="height:25px;text-align:center;" <%If RsAux("QT_DISP") = 0 Then%>disabled="true"<%End If %>>
                        <td style="width:20px"><%=RsAux("CD_EVENTO").ToString%></td>
                         <%If RsAux("CD_EVENTO").ToString = "022" Then%>
                         <%  If Request.QueryString("tp_atualiza") = "1" Then%>
                                <td style="width:200px;text-align:left;"><a class="nounderline" onclick="javascript:ExibeObs('nr_processo=<%=RsAux("NR_PROCESSO2")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"><%=RsAux("NM_EVENTO").ToString%></a></td>
                        <%   Else%>
                                <td style="width:200px;text-align:left;"><a class="nounderline" onclick="javascript:ExibeObsItem('nr_processo=<%=RsAux("NR_PROCESSO2")%>&item_cliente=<%=RsAux("NR_ITEM_CLIENTE")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"><%=RsAux("NM_EVENTO").ToString%></a></td>
                        <%   End If%>
                        <%Else%>
                        <td style="width:200px;text-align:left;"><%=RsAux("NM_EVENTO").ToString%></td>
                        <%End If%>
                        <td style="width:80px;"><%=RsAux("AP_USUARIO").ToString%></td>
                        <td><img src="\imagens\icones\16x16\checks\<%=RsAux("IN_APLICAR").ToString%><%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;" alt="Desaplicar" <%If Not RsAux("QT_DISP") = 0 Then%>onclick="aplicarEvento('aplica=<%=RsAux("IN_APLICAR").ToString%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO")%>&nr_processo=<%=RsAux("NR_PROCESSO2")%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>','desaplicar','<%=Request.QueryString("tp_atualiza")%>');"<%End If %>/></td>
                        <td style="width:160px;"><label style="width:100px;font-size:7pt;font-family:Verdana;text-align:center;"><%=RsAux("DT_REALIZACAO")%></label><a id="hl_data" <%If Not RsAux("QT_DISP") = 0 Then%>href="javascript:ExibeData('tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"<%End If %> class="nounderline"><img src="\imagens\edit1<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Editar"/></a><a id="hl_hoje" <%If Not RsAux("QT_DISP") = 0 Then%>onclick="preencheData('cd_usuario=<%=Session("usuario")%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&dt_realizacao=<%=RsAux("DATA_HOJE")%>','<%=Request.QueryString("tp_atualiza")%>');"<%End If %> class="nounderline"><img src="\imagens\calendar1<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Hoje"/></a><a id="hl_data" <%If Not RsAux("QT_DISP") = 0 Then%>href="javascript:ExibeDataLote('cd_empresa=<%=RsAux("CD_EMPRESA").ToString%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"<%End If %> class="nounderline"><img src="\imagens\edit1lote<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="21px" height="16px" style="cursor:pointer;border-width:0px;" alt="Alimentação em lote"/></a></td>
                        </tr>
                  <%  Else
                                    If aux = 0 Then
                                        aux = 1
                            %>
                            <tr bgcolor="<%=cor%>" style="height:25px;text-align:center;" <%If RsAux("QT_DISP") = 0 Then%>disabled="true"<%End If %>>
                    <td colspan="5"><span style="color:#FFFFFF;"><%=texto %></span></td>
                    </tr>
                            <%
                                    End If
                        %> 
                        <tr bgcolor="<%=color%>" style="height:25px;text-align:center;" disabled="true">
                        <td style="width:20px"><%=RsAux("CD_EVENTO").ToString%></td>
                        <% If RsAux("CD_EVENTO").ToString = "022" Then%>
                        <%  If Request.QueryString("tp_atualiza") = "1" Then%>
                        <td style="width:200px;text-align:left;"><a class="nounderline" onclick="javascript:ExibeObs('nr_processo=<%=RsAux("NR_PROCESSO2")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"><%=RsAux("NM_EVENTO").ToString%></a></td>
                        <%   Else%>
                        <td style="width:200px;text-align:left;"><a class="nounderline" onclick="javascript:ExibeObsItem('nr_processo=<%=RsAux("NR_PROCESSO2")%>&item_cliente=<%=RsAux("NR_ITEM_CLIENTE")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"><%=RsAux("NM_EVENTO").ToString%></a></td>
                        <%   End If%>
                        <%Else%>
                        <td style="width:200px;text-align:left;"><%=RsAux("NM_EVENTO").ToString%></td>
                        <%End If%>
                        <td style="width:80px;"><%=RsAux("AP_USUARIO").ToString%></td>
                        <td><img src="\imagens\icones\16x16\checks\<%=RsAux("IN_APLICAR").ToString%><%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;" alt="Aplicar" <%If Not RsAux("QT_DISP") = 0 Then%>onclick="aplicarEvento('aplica=<%=RsAux("IN_APLICAR").ToString%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO")%>&nr_processo=<%=RsAux("NR_PROCESSO2")%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>','aplicar','<%=Request.QueryString("tp_atualiza")%>');"<%End If %>/></td>
                        <td style="width:160px;"><label style="width:100px;font-size:7pt;font-family:Verdana;text-align:center;"><%=RsAux("DT_REALIZACAO")%></label><a id="hl_data" <%If Not RsAux("QT_DISP") = 0 Then%>href="javascript:ExibeData('tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"<%End If %> class="nounderline"><img src="\imagens\edit1<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Editar"/></a><a id="hl_hoje" <%If Not RsAux("QT_DISP") = 0 Then%>onclick="preencheData('cd_usuario=<%=Session("usuario")%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&dt_realizacao=<%=RsAux("DATA_HOJE")%>','<%=Request.QueryString("tp_atualiza")%>');"<%End If %> class="nounderline"><img src="\imagens\calendar1<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Hoje"/></a><a id="hl_data" <%If Not RsAux("QT_DISP") = 0 Then%>href="javascript:ExibeDataLote('cd_empresa=<%=RsAux("CD_EMPRESA").ToString%>&tp_atualiza=<%=Request.QueryString("tp_atualiza")%>&cd_evento=<%=RsAux("CD_EVENTO").ToString%>&nr_processo=<%=RsAux("NR_PROCESSO2").ToString%>&nr_item_cliente=<%=Request.QueryString("nr_item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Request.QueryString("cd_usuario")%>');"<%End If %> class="nounderline"><img src="\imagens\edit1lote<%If RsAux("QT_DISP") = 0 Then%>d<%End If%>.gif" width="21px" height="16px" style="cursor:pointer;border-width:0px;" alt="Alimentação em lote"/></a></td>
                        </tr>
                  <%  
                  End If
              Loop
          End If
          RsAux.Close()
          CmdAux.Dispose()
          CnnAux.Close()
            %>  
    </table>
</body>
</html>
