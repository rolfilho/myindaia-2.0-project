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
    Dim vTpCalculo As String
    Dim vQtde, vPlItem, vVlUnit, vVlTotal, vQtDisp, vPesoDisp As Double
    Dim QtdeID, QtdeREF As Integer
    SqlAux = "SELECT COUNT(*) AS QTDE_REF FROM TESTAGIO_PROCESSO (NOLOCK) " & _
    " WHERE NR_REFERENCIA = '" & Request.QueryString("nr_processo") & "' " & _
    " AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' " & _
    " AND NR_PARCIAL ='" & Request.QueryString("nr_parcial") & "' " & _
    " AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "'" & _
    " AND NR_PROCESSO_DES IS NOT NULL "
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    QtdeREF = RsAux("QTDE_REF")
    
    If QtdeREF = 0 Then
        RsAux.Close()
        CnnAux.Close()
        SqlAux = "SELECT COUNT(*) AS QTDE_ID FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) WHERE NR_REFERENCIA = '" & Request.QueryString("nr_processo") & "' AND NR_ITEM_PO ='" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL ='" & Request.QueryString("nr_parcial") & "'"
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        QtdeID = RsAux("QTDE_ID")
    
        If QtdeID = 0 Then
            RsAux.Close()
            CnnAux.Close()
            vQtde = CDbl(Request.QueryString("qtde_baixada"))
            SqlAux = "SELECT ISNULL(QT_INICIAL,0) AS QT_INICIAL, ISNULL(PL_ITEM,0) AS PL_ITEM  FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL = '" & Request.QueryString("nr_parcial") & "' "
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            vPlItem = CDbl(RsAux("PL_ITEM"))
            vQtDisp = CDbl(RsAux("QT_INICIAL"))
            RsAux.Close()
            CnnAux.Close()
    
            SqlAux = "SELECT ISNULL(TP_CALCULO,'') AS TP_CALCULO, ISNULL(VL_UNITARIO,0) AS VL_UNITARIO FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL = 0"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            vTpCalculo = RsAux("TP_CALCULO")
            vVlUnit = RsAux("VL_UNITARIO")
            vPlItem = (vQtde * vPesoDisp) / vQtDisp
            RsAux.Close()
            CnnAux.Close()
        
            If vQtde * vVlUnit = 0 Then
                vVlTotal = (0)
            Else
                Select Case vTpCalculo
                    Case "1"
                        vVlTotal = (vQtde * vVlUnit)
                    Case "2"
                        vVlTotal = (vQtde * vVlUnit / 100)
                    Case "3"
                        vVlTotal = (vQtde * vVlUnit / 1000)
                    Case "4"
                        vVlTotal = (vPlItem * vVlUnit)
                    Case "5"
                        vVlTotal = (0)
                    Case Else
                        vVlTotal = (vQtde * vVlUnit)
                End Select
            End If
    
            Try
                SqlAux = " UPDATE TPO_ITEM" & _
                " SET QT_INICIAL = QT_INICIAL + " & vQtde & ", " & _
                " PL_ITEM = PL_ITEM + " & vPlItem & " , " & _
                " VL_TOTAL   = VL_TOTAL  + " & vVlTotal & " " & _
                " WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' " & _
                " AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "' AND " & _
                " NR_PARCIAL = 0 AND CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "'"
                'Response.Write(vVlTotal)
                'Response.End()
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                CmdAux.ExecuteNonQuery()
                CnnAux.Close()
        
                SqlAux = " DELETE FROM TPO_ITEM " & _
                " WHERE " & _
                "  NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' AND " & _
                "  NR_ITEM_CLIENTE     ='" & Request.QueryString("nr_item_cliente") & "'     AND " & _
                "  NR_PARCIAL  ='" & Request.QueryString("nr_parcial") & "'  AND " & _
                " CD_EMPRESA  ='" & Request.QueryString("cd_empresa") & "' "
               
                'Response.Write(SqlAux)
                'Response.End()
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                CmdAux.ExecuteNonQuery()
                Page.DataBind()
                Page.Dispose()
            Catch ex As Exception
                Response.Write("NAO1")
            End Try
        Else
            Response.Write("NAO2")
        End If
    Else
        Response.Write("NAO3")
    End If
    SqlAux = ""
    RsAux.Close()
    CmdAux.Dispose()
    CnnAux.Close()
%>