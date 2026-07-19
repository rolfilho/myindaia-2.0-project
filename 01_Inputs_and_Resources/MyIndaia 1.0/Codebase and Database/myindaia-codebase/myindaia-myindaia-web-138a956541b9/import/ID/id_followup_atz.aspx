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
    Dim SqlAux, SqlAux2, eventos, datas, aplicar, id_codigo, usuario, dt_realizacao, usuario_realizacao As String
    Dim eventosArray, datasArray, aplicarArray As Array
    Dim I As Integer    
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123;Pooling=False"
    Dim CnnAux, CnnAux2 As SqlConnection
    Dim CmdAux, CmdAux2 As SqlCommand
    Dim RsAux As SqlDataReader
    
    eventos = ""
    datas = ""
    aplicar = ""    
    SqlAux = ""
    
    
    Try
        eventos = Request.QueryString("eventos")
        datas = Request.QueryString("datas")
        aplicar = Request.QueryString("aplicar")
        id_codigo = Request.QueryString("id_codigo")
        usuario = Request.QueryString("usuario")
        
        eventosArray = eventos.Split(";")
        datasArray = datas.Split(";")
        aplicarArray = aplicar.Split(";")
        
        SqlAux = " SELECT NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL " & _
        " FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) " & _
        " WHERE ID_CODIGO ='" & id_codigo & "'  "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader       
        If RsAux.HasRows Then
            Do While RsAux.Read()
                I = 0
                Do While I <= eventosArray.Length - 1
                    If datasArray(I) <> "" Then
                        dt_realizacao = " CONVERT(DATETIME,'" & datasArray(I) & "',103) "
                        usuario_realizacao = " '" & usuario & "'"
                    Else
                        dt_realizacao = " NULL "
                        usuario_realizacao = " NULL "
                    End If
                    
                    SqlAux2 = " UPDATE TFLP_PO_ITEM " & _
                    " SET CD_RESP_REALIZACAO = " & usuario_realizacao & ", " & _
                    " IN_APLICAVEL = '" & aplicarArray(I) & "', " & _
                    " DT_REALIZACAO = " & dt_realizacao & " " & _
                    " WHERE NR_PROCESSO = '" & Trim(RsAux("NR_REFERENCIA")) & "' " & _
                    " AND NR_ITEM_CLIENTE ='" & RsAux("NR_ITEM_PO") & "' " & _
                    " AND  NR_PARCIAL = '" & RsAux("NR_PARCIAL") & "' " & _
                    " AND CD_EVENTO = '" & eventosArray(I) & "' "
                    
                    CnnAux2 = New SqlConnection(Cnn)
                    CmdAux2 = New SqlCommand(SqlAux2, CnnAux2)
                    CnnAux2.Open()
                    CmdAux2.ExecuteNonQuery()
                    CmdAux2.Dispose()
                    CnnAux2.Close()
                    I = I + 1
                Loop
            Loop
        End If
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()        
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
    SqlAux = ""
%>