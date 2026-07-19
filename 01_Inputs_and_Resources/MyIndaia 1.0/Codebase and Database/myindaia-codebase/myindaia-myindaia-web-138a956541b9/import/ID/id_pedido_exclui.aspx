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
    Try
        SqlAux = "UPDATE TPO_ITEM   " & _
        " SET IN_UTILIZADO_INSTR_DESEMB = 0, " & _
        " ID_CODIGO_INSTR_DESEMB = NULL "
        
        If Request.QueryString("nr_referencia") <> "X" Then
            SqlAux = SqlAux & " WHERE NR_PROCESSO = '" & Trim(Request.QueryString("nr_referencia")) & "'" & _
            " AND NR_ITEM_CLIENTE = '" & Trim(Request.QueryString("nr_item_cliente")) & "'" & _
            " AND NR_PARCIAL = " & Trim(Request.QueryString("nr_parcial")) & ""
        Else
            SqlAux = SqlAux & " WHERE LTRIM(RTRIM(NR_PROCESSO))+LTRIM(RTRIM(NR_ITEM_CLIENTE))+LTRIM(RTRIM(NR_PARCIAL)) IN " & _
            " (SELECT LTRIM(RTRIM(NR_REFERENCIA))+LTRIM(RTRIM(NR_ITEM_PO))+LTRIM(RTRIM(NR_PARCIAL)) " & _
            " FROM TINSTRUCAO_DESEMBARACO_PEDIDO WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "')"      
        End If
        
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CnnAux.Close()
        
        SqlAux = "DELETE FROM TINSTRUCAO_DESEMBARACO_PEDIDO " & _
        " WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"
        
        If Request.QueryString("nr_referencia") <> "X" Then
            SqlAux = SqlAux & " AND NR_REFERENCIA = '" & Trim(Request.QueryString("nr_referencia")) & "'" & _
            " AND NR_ITEM_PO = '" & Trim(Request.QueryString("nr_item_cliente")) & "'" & _
            " AND NR_PARCIAL = " & Trim(Request.QueryString("nr_parcial")) & ""
        End If
        
        CnnAux.Open()
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CmdAux.ExecuteNonQuery()

        Response.Write("")
        CmdAux.Dispose()
        CnnAux.Close()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
%>