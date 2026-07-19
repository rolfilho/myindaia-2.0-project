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
    Dim SqlAux As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim CnnAux As SqlConnection
    Dim CmdAux As SqlCommand
    Dim vDtRealizacao, vCdUsuario, nr_parcial As String
    
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
        If Request.QueryString("tp_atualiza") = "1" Then
            SqlAux = "UPDATE PO SET " & _
           " DT_REALIZACAO  = " & vDtRealizacao & ", " & _
           " CD_RESP_REALIZACAO  = " & vCdUsuario & " " & _
           " FROM TFLP_PO PO (NOLOCK) " & _
           " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " & _
           " WHERE P.NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' AND " & _
           " PO.CD_EVENTO = '" & Request.QueryString("cd_evento") & "' "
        Else
            SqlAux = "UPDATE POI SET " & _
          " DT_REALIZACAO  = " & vDtRealizacao & ", " & _
          " CD_RESP_REALIZACAO  = " & vCdUsuario & ", " & _
          " DT_REALIZACAO_EFETIVA = GETDATE() " & _
          " FROM TFLP_PO_ITEM POI (NOLOCK) " & _
          " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
          " WHERE P.NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' " & _
            " AND POI.CD_EVENTO = '" & Request.QueryString("cd_evento") & "' "
            If Request.QueryString("todos_itens") = 0 Then
                SqlAux = SqlAux & " AND POI.NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "' " & _
              " AND POI.NR_PARCIAL = " & nr_parcial & " "
            End If
        End If
        'Response.Write(SqlAux)
        'Response.End()
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        Page.DataBind()
        Page.Dispose()
        CmdAux.Dispose()
        CnnAux.Close()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
    SqlAux = ""
%>