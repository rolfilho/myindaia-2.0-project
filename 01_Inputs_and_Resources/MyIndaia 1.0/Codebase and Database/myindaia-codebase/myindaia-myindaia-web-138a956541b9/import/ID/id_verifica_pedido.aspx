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
    Dim RsAux As SqlDataReader
    SqlAux = " SELECT COUNT(NR_REFERENCIA) AS CONTADOR FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"        
    CnnAux = New SqlConnection(Cnn)
    CnnAux.Open()
    CmdAux = New SqlCommand(SqlAux, CnnAux)
    RsAux = CmdAux.ExecuteReader
    Dim contador As String
    RsAux.Read()
    contador = CStr(RsAux("CONTADOR"))        
    Response.Write(contador)
    CmdAux.Dispose()
    CnnAux.Close()

%>