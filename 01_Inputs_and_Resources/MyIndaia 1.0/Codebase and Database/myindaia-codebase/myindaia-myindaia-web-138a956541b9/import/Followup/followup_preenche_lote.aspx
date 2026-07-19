<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
    End Sub
    
    
</script>
<%
    Dim SqlAux, SqlAux2 As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim CnnAux As SqlConnection
    Dim CmdAux As SqlCommand
    Dim CnnAux2 As SqlConnection
    Dim CmdAux2 As SqlCommand
    Dim vDtRealizacao, vCdUsuario, nr_parcial, vPedidoItemAux As String
    Dim vPedidoItem, vPedido As Array
    Dim data_1, data_2 As Date
    Dim dias As Integer
    Dim I As Integer 
    
    vPedidoItemAux = Request.QueryString("nr_processos")
    vPedidoItem = Split(Request.QueryString("nr_processos"), ";")
    
    SqlAux = ""
    If Trim(Request.QueryString("dt_realizacao")) = "" Then
        vCdUsuario = "NULL"
        vDtRealizacao = "NULL"
    Else
        vDtRealizacao = "CONVERT(DATETIME,'" & Request.QueryString("dt_realizacao") & "',103)"
        vCdUsuario = "'" & Request.QueryString("cd_usuario") & "'"
    End If
    
    If Request.QueryString("nr_parcial") = "S" Then nr_parcial = "0" Else nr_parcial = Request.QueryString("nr_parcial")    
    Try
        I = 0        
        For I = 0 To UBound(vPedidoItem)
            If Trim(vPedidoItem(I)) <> "" Then
                vPedido = Split(vPedidoItem(I), "/")
                SqlAux = "UPDATE POI SET " & _
                " DT_REALIZACAO  = " & vDtRealizacao & ", " & _
                " CD_RESP_REALIZACAO  = " & vCdUsuario & ", " & _
                " DT_REALIZACAO_EFETIVA = GETDATE() " & _
                " FROM TFLP_PO_ITEM POI (NOLOCK) " & _
                " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
                " WHERE POI.NR_PROCESSO ='" & vPedido(0) & "' " & _
                " AND POI.CD_EVENTO = '" & Request.QueryString("cd_evento") & "' " & _
                " AND POI.NR_ITEM_CLIENTE = '" & vPedido(1) & "' " & _
                " AND POI.CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "' " & _
                " AND POI.NR_PARCIAL = " & nr_parcial & " "
                    
                CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                CmdAux.ExecuteNonQuery()
                
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
                " WHERE I.NR_PROCESSO = '" & vPedido(0) & "' " & _
                " AND I.NR_ITEM_CLIENTE = '" & vPedido(1) & "' " & _
                " AND I.NR_PARCIAL = '" & nr_parcial & "' " & _
                " AND I.CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "'" & _
                " AND P.IN_CANCELADO = '0'" & _
                " ORDER BY I.NR_ORDEM, I.NR_ITEM_CLIENTE, I.NR_PARCIAL "
                
                CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
                If RsAux.HasRows Then
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
                                    SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 1" & _
                                              " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                              "   AND NR_ITEM_CLIENTE = '" & vPedido(1) & "'" & _
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
                                        SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 2" & _
                                              " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                              "   AND NR_ITEM_CLIENTE = '" & vPedido(1) & "'" & _
                                              "   AND NR_PARCIAL = '" & nr_parcial & "'" & _
                                              "   AND CD_EMPRESA = '" & RsAux("CD_EMPRESA") & "'"
                                        CnnAux2 = New SqlConnection(Cnn)
                                        CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                                        CnnAux2.Open()
                                        CmdAux2.ExecuteNonQuery()
                                        CmdAux2.Dispose()
                                        CnnAux2.Close()
                                    End If
                                End If
                            Else                                
                                SqlAux2 = " UPDATE TPO_ITEM SET TP_STATUS_CRODA = 3" & _
                                      " WHERE NR_PROCESSO = '" & RsAux("NR_PROCESSO") & "'" & _
                                      "   AND NR_ITEM_CLIENTE = '" & vPedido(1) & "'" & _
                                      "   AND NR_PARCIAL = '" & nr_parcial & "'" & _
                                      "   AND CD_EMPRESA = '" & RsAux("CD_EMPRESA") & "'"
                                CnnAux2 = New SqlConnection(Cnn)
                                CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                                CnnAux2.Open()
                                CmdAux2.ExecuteNonQuery()
                                CmdAux2.Dispose()
                                CnnAux2.Close()
                            End If
                        End If
                    Loop
                End If
                
            End If
        Next
        Page.DataBind()
        Page.Dispose()
        CmdAux.Dispose()
        CnnAux.Close()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
    SqlAux = ""
%>  