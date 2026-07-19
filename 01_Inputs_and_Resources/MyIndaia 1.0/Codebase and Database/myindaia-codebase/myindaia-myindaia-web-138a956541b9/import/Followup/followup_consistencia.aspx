<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux As String = ""
        Dim codigo, resposta As String
        Dim valido As Integer
        codigo = Request.QueryString("codigo")
        resposta = ""

        If codigo = "CLIENTE" Then
            SqlAux = "SELECT COUNT(*) AS VALIDO FROM TCLIENTE_HABILITACAO (NOLOCK) " & _
            "WHERE CD_CLIENTE  = '" & Request("cd_cliente") & "' " & _
            "  AND CD_UNID_NEG = '" & Request("cd_unid_neg") & "' " & _
            "  AND CD_PRODUTO  = '06' " & _
            "  AND IN_ATIVO    = '1' "
            resposta = "ATENÇÃO: Cliente sem habilitação para esta Unidade/Produto!"
        End If
        
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        valido = RsAux("VALIDO")
        
        If valido > 0 Then
            Response.Write(Session(""))
        Else
            Response.Write(resposta)
        End If
        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
</script>
