<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %>
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%> 

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux, nr_processo, resposta As String

        nr_processo = Request.QueryString("nr_processo")
        
        SqlAux = "SELECT ISNULL(CD_PAIS_ORIGEM,'') AS  CD_PAIS_ORIGEM, ISNULL(CD_LOCAL_DESEMBARQUE,'') AS CD_LOCAL_DESEMBARQUE, ISNULL(CD_EMBARCACAO,'') AS CD_EMBARCACAO, " & _
        " ISNULL(CD_AGENTE,'') AS CD_AGENTE, ISNULL(NR_VIAGEM,'') AS NR_VIAGEM, ISNULL(NR_VOO,'') AS NR_VOO, ISNULL(NR_CONHECIMENTO,'') AS NR_CONHECIMENTO, " & _
        " ISNULL(NR_COURRIER,'') AS NR_COURRIER, ISNULL(IN_CONSOLIDADO,'0') AS IN_CONSOLIDADO, ISNULL(IN_URGENTE,'0') AS IN_URGENTE, ISNULL(IN_SEGURO,'0') AS IN_SEGURO " & _
        " FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO  = '" & nr_processo & "' "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If RsAux.Read Then
            resposta = Trim(RsAux("CD_PAIS_ORIGEM")) & "|" & Trim(RsAux("CD_LOCAL_DESEMBARQUE")) & "|" & Trim(RsAux("CD_EMBARCACAO")) & "|" & _
            Trim(RsAux("CD_AGENTE")) & "|" & Trim(RsAux("NR_VIAGEM")) & "|" & Trim(RsAux("NR_VOO")) & "|" & Trim(RsAux("NR_CONHECIMENTO")) & "|" & _
            Trim(RsAux("NR_COURRIER")) & "|" & Trim(RsAux("IN_CONSOLIDADO")) & "|" & Trim(RsAux("IN_URGENTE")) & "|" & Trim(RsAux("IN_SEGURO"))
            Response.Write(resposta)
        Else
            Response.Write("NAO")
        End If
        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
</script>
