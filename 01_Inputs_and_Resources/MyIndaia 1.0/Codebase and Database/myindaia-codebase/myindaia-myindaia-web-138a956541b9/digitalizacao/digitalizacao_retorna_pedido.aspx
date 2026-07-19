<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux, processo As String

        SqlAux = "SELECT NR_PROCESSO FROM TPROCESSO (NOLOCK)" & _
        " WHERE CD_PRODUTO    = '06' " & _
        " AND NR_REFERENCIA = '" & Request("pedido") & "'" & _
        " AND IN_CANCELADO = '0' " & _
        " AND CD_CLIENTE = '" & Request("cliente") & "'"

        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()        
        processo = RsAux("NR_PROCESSO")        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
        
        Response.Write(processo)
        Response.End()
        
    End Sub
</script>
