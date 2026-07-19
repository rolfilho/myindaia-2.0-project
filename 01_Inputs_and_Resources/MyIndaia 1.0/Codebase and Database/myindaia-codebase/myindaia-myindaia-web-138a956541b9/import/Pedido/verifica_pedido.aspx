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

        If Request("campo") = "frmEditaPedido_txtNrPedido" Or Request("campo") = "frmEditaPedido_txtNrPedido2" Then
            SqlAux = "SELECT DENSE_RANK() OVER(ORDER BY NR_PROCESSO) AS CODIGO, NR_PROCESSO FROM TPROCESSO (NOLOCK)" & _
            " WHERE CD_UNID_NEG   = '" & Request("cd_unid_neg") & "'" & _
            " AND CD_PRODUTO    = '06' " & _
            " AND NR_REFERENCIA = '" & Request("nr_referencia") & "'" & _
            " AND IN_CANCELADO = '0' "
            If Request("cd_cliente") <> "" Then
                SqlAux = SqlAux & " AND CD_CLIENTE = '" & Request("cd_cliente") & "'"
            End If
            SqlAux = SqlAux & " ORDER BY CODIGO DESC"
        Else
            processo = Request("cd_unid_neg") + "06" + Request("nr_referencia")
            SqlAux = "SELECT DENSE_RANK() OVER(ORDER BY NR_PROCESSO) AS CODIGO, NR_PROCESSO, NR_REFERENCIA, CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = '" & processo & "'  AND IN_CANCELADO = '0' "
        End If
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If RsAux.HasRows Then
            RsAux.Read()
            If CInt(RsAux("CODIGO")) > 1 Then
                Response.Write("1")
            Else
                Response.Write(RsAux("NR_PROCESSO"))
            End If
        Else
            Response.Write("2")
        End If
        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
</script>
