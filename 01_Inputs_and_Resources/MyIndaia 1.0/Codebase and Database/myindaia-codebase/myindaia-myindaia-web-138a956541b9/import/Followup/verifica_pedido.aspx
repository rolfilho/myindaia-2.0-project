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

        If Request("campo") = "frmFollowupPrincipal_txtNrPedido" Then
            SqlAux = "SELECT NR_PROCESSO, IN_CANCELADO FROM TPROCESSO (NOLOCK)" & _
            " WHERE CD_UNID_NEG   = '" & Request("cd_unid_neg") & "'" & _
            " AND IN_CANCELADO = '0'" & _
            " AND CD_PRODUTO    = '06' " & _
            " AND NR_REFERENCIA = '" & Request("nr_referencia") & "'" '& _
            '" AND CD_CLIENTE = '" & Request("cd_cliente") & "'"
        Else
            processo = Request("cd_unid_neg") + "06" + Request("nr_referencia")
            SqlAux = "SELECT NR_PROCESSO, NR_REFERENCIA, CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = '" & processo & "'"
        End If
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If RsAux.HasRows Then
            If RsAux.RecordsAffected > 1 Then
                Response.Write(RsAux("1"))
            Else
                RsAux.Read()
                Response.Write(RsAux("NR_PROCESSO"))
            End If
        Else
            Response.Write("2")
        End If
        
        RsAux.Close()
        CnnAux.Close()
    End Sub
</script>
