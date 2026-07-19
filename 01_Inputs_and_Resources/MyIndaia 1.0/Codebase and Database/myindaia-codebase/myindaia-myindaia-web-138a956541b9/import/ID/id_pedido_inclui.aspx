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
    Dim SqlAux, conhecimento, navio As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    Dim CmdAux As SqlCommand
    Try
        If Request.QueryString("item_cliente") <> "" Then            
            SqlAux = " INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO (ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO)" & _
            " SELECT '" & Request.QueryString("id_codigo") & "', '" & Request.QueryString("pedido") & "', '" & Request.QueryString("item_cliente") & "', " & Request.QueryString("parcial") & ", GETDATE() "
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
            
            If Trim(Request.QueryString("conhecimento")) = "" Then conhecimento = "NULL" Else conhecimento = "'" & Request.QueryString("conhecimento") & "'"
            If Trim(Request.QueryString("navio")) = "" Then navio = "NULL" Else navio = "'" & Request.QueryString("navio") & "'"
       
            SqlAux = " UPDATE TPO_ITEM   " & _
            " SET IN_UTILIZADO_INSTR_DESEMB = '1', " & _
            " ID_CODIGO_INSTR_DESEMB = '" & Request.QueryString("id_codigo") & "', " & _
            "  NR_CONHECIMENTO       = " & conhecimento & "," & _
            "  CD_EMBARCACAO         = " & navio & "" & _
            "   WHERE " & _
            "   NR_PROCESSO     = '" & Request.QueryString("pedido") & "' " & _
            "   AND NR_ITEM_CLIENTE = '" & Request.QueryString("item_cliente") & "'" & _
            "   AND NR_PARCIAL      = " & Request.QueryString("parcial") & " " & _
            "   AND CD_EMPRESA = '" & Request.QueryString("cliente") & "' "
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
        Else
            SqlAux = " DELETE FROM TINSTRUCAO_DESEMBARACO_PEDIDO WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "' AND NR_REFERENCIA = '" & Request.QueryString("pedido") & "'"
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
            
            SqlAux = " UPDATE I   " & _
           " SET I.IN_UTILIZADO_INSTR_DESEMB = '0', " & _
           " I.ID_CODIGO_INSTR_DESEMB = NULL " & _
           " FROM TPO_ITEM I (NOLOCK) " & _
            " INNER JOIN TESTAGIO_PROCESSO D (NOLOCK) ON D.NR_REFERENCIA   = I.NR_PROCESSO " & _
            "                                 AND D.CD_EMPRESA      = I.CD_EMPRESA " & _
            "                                 AND D.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE " & _
            "                                 AND D.NR_PARCIAL      = I.NR_PARCIAL" & _
            "   INNER JOIN TPROCESSO E (NOLOCK) ON E.NR_PROCESSO = D.NR_PROCESSO_ADM " & _
            "   INNER JOIN TEMPRESA_NAC F (NOLOCK) ON F.CD_EMPRESA = E.CD_CLIENTE " & _
            "   WHERE " & _
            "   I.NR_PROCESSO     = '" & Request.QueryString("pedido") & "' " & _
            " AND I.CD_EMPRESA = '" & Request.QueryString("cliente") & "' " & _
            " AND IN_SUBSTITUIDO  = '0'" & _
            " AND I.NR_PARCIAL   <> 0 " & _
            " AND I.ID_CODIGO_INSTR_DESEMB ='" & Request.QueryString("id_codigo") & "'" & _
            "  AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, ''),5,2) IN ('DT', 'IE', '')))"
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
            
            SqlAux = " INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO (ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO)" & _
            " SELECT '" & Request.QueryString("id_codigo") & "', I.NR_PROCESSO, I.NR_ITEM_CLIENTE, I.NR_PARCIAL, GETDATE() " & _
            " FROM TPO_ITEM I (NOLOCK) " & _
            " INNER JOIN TESTAGIO_PROCESSO D (NOLOCK) ON D.NR_REFERENCIA   = I.NR_PROCESSO " & _
            "                                 AND D.CD_EMPRESA      = I.CD_EMPRESA " & _
            "                                 AND D.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE " & _
            "                                 AND D.NR_PARCIAL      = I.NR_PARCIAL" & _
            "   INNER JOIN TPROCESSO E (NOLOCK) ON E.NR_PROCESSO = D.NR_PROCESSO_ADM " & _
            "   INNER JOIN TEMPRESA_NAC F (NOLOCK) ON F.CD_EMPRESA = E.CD_CLIENTE " & _
            " WHERE I.NR_PROCESSO = '" & Request.QueryString("pedido") & "'" & _
            " AND I.CD_EMPRESA = '" & Request.QueryString("cliente") & "'" & _
            " AND IN_SUBSTITUIDO  = '0'" & _
            "  AND I.NR_PARCIAL   <> 0 " & _
            "  AND ISNULL(I.IN_UTILIZADO_INSTR_DESEMB, '') <> '1'" & _
            "  AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, ''),5,2) IN ('DT', 'IE', '')))"
            
            'Response.Write(SqlAux)
            'Response.End()
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
            
            If Trim(Request.QueryString("conhecimento")) = "" Then conhecimento = "NULL" Else conhecimento = "'" & Request.QueryString("conhecimento") & "'"
            If Trim(Request.QueryString("navio")) = "" Then navio = "NULL" Else navio = "'" & Request.QueryString("navio") & "'"
            
            SqlAux = " UPDATE I   " & _
           " SET I.IN_UTILIZADO_INSTR_DESEMB = '1', " & _
           " I.ID_CODIGO_INSTR_DESEMB = '" & Request.QueryString("id_codigo") & "', " & _
           "  I.NR_CONHECIMENTO       = " & conhecimento & "," & _
           "  I.CD_EMBARCACAO         = " & navio & "" & _
           " FROM TPO_ITEM I (NOLOCK) " & _
            " INNER JOIN TESTAGIO_PROCESSO D (NOLOCK) ON D.NR_REFERENCIA   = I.NR_PROCESSO " & _
            "                                 AND D.CD_EMPRESA      = I.CD_EMPRESA " & _
            "                                 AND D.NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE " & _
            "                                 AND D.NR_PARCIAL      = I.NR_PARCIAL" & _
            "   INNER JOIN TPROCESSO E (NOLOCK) ON E.NR_PROCESSO = D.NR_PROCESSO_ADM " & _
            "   INNER JOIN TEMPRESA_NAC F (NOLOCK) ON F.CD_EMPRESA = E.CD_CLIENTE " & _
            "   WHERE " & _
            "   I.NR_PROCESSO     = '" & Request.QueryString("pedido") & "' " & _
            " AND I.CD_EMPRESA = '" & Request.QueryString("cliente") & "' " & _
            " AND IN_SUBSTITUIDO  = '0'" & _
            "  AND I.NR_PARCIAL   <> 0 " & _
            "  AND ISNULL(I.IN_UTILIZADO_INSTR_DESEMB, '') <> '1'" & _
            "  AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, ''),5,2) IN ('DT', 'IE', '')))"
            'CnnAux = New SqlConnection(Cnn)
            CnnAux.Open()
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
        End If
        'Response.Write(SqlAux)
        'Response.End()
        Response.Write("")
        CmdAux.Dispose()
        CnnAux.Close()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
%>