<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux, viagem, unid_neg, navio, local As String

        viagem = Left(Trim(Request("viagem")), 2) & Right(Trim(Request("viagem")), 2)
        unid_neg = Request("cd_unid_neg")
        navio = Request("navio")
        local = Request("local")
        
        SqlAux = "SELECT NR_VIAGEM " & _
        " FROM TVIAGEM (NOLOCK) " & _
        "  WHERE CD_UNID_NEG   = '" & unid_neg & "' " & _
        "  AND CD_PRODUTO    = '01' " & _
        "  AND CD_EMBARCACAO = '" & navio & "' " & _
        "  AND CD_LOCAL      = '" & local & "' " & _
        "  AND NR_VIAGEM     = '" & viagem & "' "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If RsAux.Read Then
            Response.Write("SIM")
        Else
            Response.Write("NAO")
        End If
        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
</script>
