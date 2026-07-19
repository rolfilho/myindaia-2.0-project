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
    SqlAux = "SELECT ISNULL(MAX(NR_ITEM),'0') AS MAXIMO FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "'"
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    Dim vNrItem, vNrParcial, vDtInvoice, vInvoice, vTpCalculo, dt_realizacao, cd_usuario_resp As String
    Dim vQtde, vPlItem, vVlUnit, vVlTotal, vQtDisp, vPesoDisp As Double
    vInvoice = ""
    vDtInvoice = ""
    vNrItem = ""
    vNrParcial = ""
    dt_realizacao = ""
    If Request.QueryString("tipo") <> "1" Then
        If Not RsAux.Read() Then
            vNrItem = "001"
        Else
            vNrItem = Right("000" + CStr(CInt(RsAux("MAXIMO")) + 1), 3)
        End If
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = "SELECT MAX(NR_PARCIAL) AS MAXIMO FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "'"
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        vNrParcial = CStr(CInt(RsAux("MAXIMO")) + 1)
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = "SELECT ISNULL(TP_CALCULO,'') AS TP_CALCULO, ISNULL(VL_UNITARIO,0) AS VL_UNITARIO, ISNULL(QT_INICIAL,0) AS QT_INICIAL, ISNULL(PL_ITEM,0) AS PL_ITEM  FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL = 0"
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        
        vQtDisp = CDbl(RsAux("QT_INICIAL"))
        vPesoDisp = CDbl(RsAux("PL_ITEM"))               
        vQtde = CDbl(Request.QueryString("qtde_baixada"))
        vVlUnit = CDbl(RsAux("VL_UNITARIO"))
        vTpCalculo = RsAux("TP_CALCULO")
        RsAux.Close()
        CnnAux.Close()
                
        vPlItem = (vQtde * vPesoDisp) / vQtDisp
        
        If vQtde * vVlUnit = 0 Then
            vVlTotal = 0
        Else
            Select Case vTpCalculo
                Case "1"
                    vVlTotal = vQtde * vVlUnit
                Case "2"
                    vVlTotal = vQtde * vVlUnit / 100
                Case "3"
                    vVlTotal = vQtde * vVlUnit / 1000
                Case "4"
                    vVlTotal = vPlItem * vVlUnit
                Case "5"
                    vVlTotal = 0
                Case Else
                    vVlTotal = vQtde * vVlUnit
            End Select
        End If
    Else
        RsAux.Close()
        CnnAux.Close()
    End If

    If Request.QueryString("dt_invoice") = "" Then vDtInvoice = "NULL" Else vDtInvoice = "CONVERT(DATETIME,'" & Request.QueryString("dt_invoice") & "',103)"
    If Request.QueryString("invoice") = "" Then vInvoice = "NULL" Else vInvoice = "'" & Request.QueryString("invoice") & "'"
 
    Try
        If Request.QueryString("tipo") <> "1" Then
            SqlAux = " INSERT INTO TPO_ITEM " & _
            " (NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_MERCADORIA, CD_NCM_SH, QT_INICIAL, " & _
            " IN_NECESSITA_LI, IN_DRAWBACK, CD_AREA, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, " & _
            " CD_AGENTE, NR_VIAGEM, NR_VOO, NR_CONHECIMENTO, NR_COURRIER, IN_CONSOLIDADO, " & _
            " IN_URGENTE, IN_SEGURO, VL_UNITARIO, TP_CALCULO,  CD_UNID_MEDIDA, " & _
            " CD_FABRICANTE, CD_PAIS_ORIGEM, VL_TOTAL, " & _
            " TP_DRAWBACK, NR_FATURA, DT_FATURA, CD_MERC_FORNEC, CD_MOEDA_NEGOCIADA, " & _
            " QT_DISPONIVEL, DT_ABERTURA_ITEM, CD_EMPRESA, PL_ITEM, CD_NALADI_SH, CD_NALADI_NCCA, TX_MERCADORIA, CD_EXPORTADOR, IN_WEB, NR_PARCIAL) " & _
            " SELECT NR_PROCESSO, '" & vNrItem & "', NR_ITEM_CLIENTE, CD_MERCADORIA, CD_NCM_SH, " & Request.QueryString("qtde_baixada") & ", " & _
            " IN_NECESSITA_LI, IN_DRAWBACK, CD_AREA, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, " & _
            " CD_AGENTE, NR_VIAGEM, NR_VOO, NR_CONHECIMENTO, NR_COURRIER, IN_CONSOLIDADO, " & _
            " IN_URGENTE, IN_SEGURO, VL_UNITARIO, TP_CALCULO,  CD_UNID_MEDIDA, " & _
            " CD_FABRICANTE, CD_PAIS_ORIGEM, " & vVlTotal & ", " & _
            " TP_DRAWBACK, " & vInvoice & ", " & vDtInvoice & ", CD_MERC_FORNEC, CD_MOEDA_NEGOCIADA, " & _
            " QT_DISPONIVEL, DT_ABERTURA_ITEM, CD_EMPRESA, PL_ITEM, CD_NALADI_SH, CD_NALADI_NCCA, TX_MERCADORIA, CD_EXPORTADOR, '1' , '" & vNrParcial & "' " & _
            " FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "'" & _
            " AND CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "' " & _
            " AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "'" & _
            " AND NR_PARCIAL = 0"
            'Response.Write(SqlAux)
            'Response.End()
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
                        
            SqlAux = " UPDATE TPO_ITEM" & _
            " SET QT_INICIAL = QT_INICIAL - " & Request.QueryString("qtde_baixada") & ", " & _
            " PL_ITEM = PL_ITEM - " & vPlItem & " , " & _
            " VL_TOTAL   = VL_TOTAL  - " & vVlTotal & " " & _
            " WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' " & _
            " AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "' AND " & _
            " NR_PARCIAL = 0 AND CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "'"
            'Response.Write(SqlAux)
            'Response.End()
            CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
        Else
            SqlAux = "UPDATE TPO_ITEM SET " & _
            " NR_FATURA  = " & vInvoice & ", " & _
            " DT_FATURA  = " & vDtInvoice & " " & _
            " WHERE NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' AND " & _
            " NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' AND " & _
            " NR_PARCIAL ='" & Request.QueryString("nr_parcial") & "' AND " & _
            " CD_EMPRESA = '" & Request.QueryString("cd_empresa") & "' "
            
            'Response.Write(SqlAux)
            'Response.End()
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            CmdAux.ExecuteNonQuery()
            CnnAux.Close()
        End If
        
        If Request.QueryString("tipo") <> "1" Then
            SqlAux = "SELECT CD_EVENTO, IN_APLICAVEL, CONVERT(VARCHAR, DT_REALIZACAO,103) AS DT_REALIZACAO FROM TFLP_PO_ITEM (NOLOCK)" & _
              " WHERE NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' " & _
              "   AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "'" & _
              "   AND NR_PARCIAL ='0' " & _
              "   AND CD_EMPRESA  ='" & Request.QueryString("cd_empresa") & "'"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
  
            If RsAux.HasRows Then
                Do While RsAux.Read()
                    If Trim(RsAux("DT_REALIZACAO").ToString) <> "" Then
                        dt_realizacao = "CONVERT(DATETIME,'" & RsAux("DT_REALIZACAO") & "',103)"
                        cd_usuario_resp = "'" & Request.QueryString("usuario") & "'"
                    Else
                        dt_realizacao = "NULL"
                        cd_usuario_resp = "NULL"
                    End If
                    
                    SqlAux = " UPDATE TFLP_PO_ITEM" & _
                  " SET DT_REALIZACAO = " & dt_realizacao & " ,    " & _
                  "   CD_RESP_REALIZACAO = " & cd_usuario_resp & ",  " & _
                  "   IN_APLICAVEL = '" & RsAux("IN_APLICAVEL") & "'" & _
                  " WHERE NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' " & _
                  " AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "'" & _
                  " AND NR_PARCIAL  ='" & vNrParcial & "' " & _
                  " AND CD_EVENTO ='" & RsAux("CD_EVENTO") & "' " & _
                  " AND CD_EMPRESA  ='" & Request.QueryString("cd_empresa") & "' "

                    Dim CnnAux2 As SqlConnection = New SqlConnection(Cnn)
                    Dim CmdAux2 As SqlCommand = New SqlCommand(SqlAux, CnnAux2)
                    CnnAux2.Open()
                    CmdAux2.ExecuteNonQuery()
                    CnnAux2.Close()
                Loop
            End If
            RsAux.Close()
            CnnAux.Close()
        End If
     
        Page.DataBind()
        Page.Dispose()
    Catch ex As Exception
        Response.Write("NAO INSERIU")
    End Try
    SqlAux = ""
    RsAux.Close()
    CmdAux.Dispose()
    CnnAux.Close()
%>