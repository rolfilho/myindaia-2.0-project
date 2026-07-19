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
        SqlAux = " UPDATE TPROCESSO_DOCTOS " & _
        " SET IN_ATIVO = 0 " & _
        " WHERE NR_PROCESSO = '" & Request.QueryString("id_codigo") & "' AND NM_ARQUIVO ='" & Request.QueryString("arquivo") & "' "
        
        CnnAux = New SqlConnection(Cnn)
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