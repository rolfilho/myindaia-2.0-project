<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB"%> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>
<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim SqlAux, mercadoria, resposta, vCdTpCalculo, vCdFabricante, vCdPaisOrigem As String

        mercadoria = Request.QueryString("mercadoria")
        
        SqlAux = "SELECT ISNULL(CD_NCM_SH,'') AS CD_NCM_SH, ISNULL(VL_UNITARIO,0) AS VL_UNITARIO, ISNULL(PL_MERCADORIA,0) AS PL_MERCADORIA, " & _
        " ISNULL(CD_UN_MED_COMERC,'') AS CD_UN_MED_COMERC, ISNULL(CD_TIPO_CALCULO,'') AS CD_TIPO_CALCULO, ISNULL(IN_NECESSITA_LI,0) AS IN_NECESSITA_LI, " & _
        " ISNULL(IN_DRAWBACK,0) AS IN_DRAWBACK, ISNULL(AP_MERCADORIA, '') AS AP_MERCADORIA, " & _
        " ISNULL(CD_NALADI_SH,'') AS CD_NALADI_SH, ISNULL(CD_NALADI_NCCA,'') AS CD_NALADI_NCCA, ISNULL(CD_PAIS_AQUISICAO,'') AS CD_PAIS_AQUISICAO, " & _
        " ISNULL(NM_MERCADORIA,'') AS NM_MERCADORIA, ISNULL(CD_FABR_EXPO,'') AS CD_FABR_EXPO, ISNULL(CD_EXPORTADOR,'') AS CD_EXPORTADOR , ISNULL(CD_PAIS_ORIGEM, '') AS CD_PAIS_ORIGEM " & _
        " FROM TMERCADORIA (NOLOCK) WHERE CD_MERCADORIA  = '" & mercadoria & "' "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
      
        vCdTpCalculo = ""
        vCdFabricante = ""
        vCdPaisOrigem = ""
        If RsAux.Read Then
            If RsAux("CD_TIPO_CALCULO") <> "" Then
                vCdTpCalculo = RsAux("CD_TIPO_CALCULO")
            Else
                vCdTpCalculo = "1"
            End If
        
            If RsAux("CD_FABR_EXPO") = "1" Then
                If Trim(RsAux("CD_EXPORTADOR")) <> "" Then
                    vCdFabricante = RsAux("CD_EXPORTADOR")
                End If
                If Trim(RsAux("CD_PAIS_AQUISICAO")) <> "" Then
                    vCdPaisOrigem = RsAux("CD_PAIS_ORIGEM")
                End If
            End If
        
            If RsAux("CD_FABR_EXPO") = "2" Then
                If Trim(RsAux("CD_EXPORTADOR")) <> "" Then
                    vCdFabricante = RsAux("CD_FABRICANTE")
                    vCdPaisOrigem = RsAux("CD_PAIS_ORIGEM")
                End If
            End If
        
            If RsAux("CD_FABR_EXPO") = "3" Then
                vCdFabricante = ""
                If Trim(RsAux("CD_PAIS_AQUISICAO")) <> "" Then
                    vCdPaisOrigem = RsAux("CD_PAIS_ORIGEM")
                End If
            End If

            resposta = Trim(RsAux("CD_NCM_SH")) & "|" & CStr(FormatNumber(Trim(RsAux("VL_UNITARIO")), 5)) & "|" & CStr(FormatNumber(Trim(RsAux("PL_MERCADORIA")), 5)) & "|" & _
            Trim(RsAux("CD_NALADI_SH")) & "|" & Trim(RsAux("CD_NALADI_NCCA")) & "|" & Trim(RsAux("NM_MERCADORIA")) & "|" & _
            Trim(vCdFabricante) & "|" & Trim(vCdTpCalculo) & "|" & Trim(vCdPaisOrigem) & "|" & _
            Trim(RsAux("CD_UN_MED_COMERC")) & "|" & Trim(RsAux("IN_NECESSITA_LI")) & "|" & Trim(RsAux("IN_DRAWBACK"))
            Response.Write(resposta)
        Else
            Response.Write("NAO")
        End If
        
        RsAux.Close()
        CnnAux.Close()
    End Sub
</script>
