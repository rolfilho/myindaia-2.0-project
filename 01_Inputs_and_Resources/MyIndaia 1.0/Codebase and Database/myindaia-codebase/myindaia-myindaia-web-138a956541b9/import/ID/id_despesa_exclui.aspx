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
        SqlAux = "DELETE FROM TINSTRUCAO_DESEMBARACO_DESPESAS " & _
        " WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"
        
        If Request.QueryString("nome") <> "X#" Then        
            SqlAux = SqlAux & " AND CD_DESPESA =  '" & Request.QueryString("cd_despesa") & "'"
        End If
        
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()

        Response.Write("")
        CmdAux.Dispose()
        CnnAux.Close()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
%>