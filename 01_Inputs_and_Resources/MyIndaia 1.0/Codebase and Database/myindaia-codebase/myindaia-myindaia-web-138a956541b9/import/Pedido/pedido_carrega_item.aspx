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
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim SqlAux, nr_processo, resposta, nr_item_cliente, tipo As String
    Dim maximo, contador, vErro As Integer
        
    nr_processo = Request.QueryString("nr_processo")
    nr_item_cliente = Request.QueryString("nr_item_cliente")
   
    tipo = Request.QueryString("tipo")
       
    SqlAux = " SELECT MAX(CONTADOR) AS MAXIMO FROM " & _
    " (SELECT DENSE_RANK() OVER (ORDER BY NR_ITEM_CLIENTE,NR_PARCIAL) AS CONTADOR, NR_ITEM_CLIENTE, NR_PARCIAL " & _
    " FROM TPO_ITEM POI (NOLOCK) " & _
    " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
    " WHERE P.NR_PROCESSO = '" & nr_processo & "') AS TABELA "
 
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    CnnAux.Open()
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    maximo = RsAux("MAXIMO")
    RsAux.Close()
    CnnAux.Close()
            
    SqlAux = " SELECT CONTADOR  FROM " & _
    " (SELECT DENSE_RANK() OVER (ORDER BY POI.NR_ITEM_CLIENTE, POI.NR_PARCIAL) AS CONTADOR, POI.NR_ITEM_CLIENTE, POI.NR_PARCIAL " & _
    " FROM TPO_ITEM POI (NOLOCK) " & _
    " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
    " WHERE P.NR_PROCESSO = '" & nr_processo & "' AND POI.NR_PARCIAL= 0 ) AS TABELA"
        
    If nr_item_cliente <> "" Then
        SqlAux = SqlAux & " WHERE NR_ITEM_CLIENTE = '" & nr_item_cliente & "' "
        SqlAux = SqlAux & " AND NR_PARCIAL = 0 "
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        contador = RsAux("CONTADOR")
        RsAux.Close()
        CnnAux.Close()
    Else
        contador = 0
    End If
        
    Select Case tipo
        Case "1"
            If contador <> 1 Then
                contador = 1
                vErro = 0
            Else
                vErro = 1
            End If
        Case "2"
            If contador <> 1 Then
                contador = contador - 1
                vErro = 0
            Else
                vErro = 1
            End If
        Case "3"
            If contador < maximo Then
                contador = contador + 1
                vErro = 0
            Else
                vErro = 2
            End If
        Case "4"
            If contador < maximo Then
                contador = maximo
                vErro = 0
            Else
                vErro = 2
            End If
    End Select
        
    If vErro = 0 Then
        SqlAux = " SELECT NR_ITEM_CLIENTE, QT_INICIAL, CASE NR_PARCIAL WHEN 0 THEN 'S' ELSE CONVERT(VARCHAR,NR_PARCIAL) END AS NR_PARCIAL, ISNULL(NR_FATURA,'') AS NR_FATURA  FROM " & _
        " (SELECT DENSE_RANK() OVER (ORDER BY POI.NR_ITEM_CLIENTE,POI.NR_PARCIAL) AS CONTADOR, POI.NR_ITEM_CLIENTE, POI.NR_PARCIAL, POI.NR_FATURA, POI.QT_INICIAL " & _
        " FROM TPO_ITEM POI (NOLOCK) " & _
        " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
        " WHERE P.NR_PROCESSO = '" & nr_processo & "' AND POI.NR_PARCIAL= 0) AS TABELA " & _
        " WHERE CONTADOR = " & contador
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        
        If RsAux.Read Then
            resposta = Trim(RsAux("NR_ITEM_CLIENTE")) & "|" & Trim(RsAux("QT_INICIAL"))
            Response.Write(resposta)
        Else
            Response.Write("NAO1")
        End If
        RsAux.Close()
        CnnAux.Close()
    Else
        If vErro = 1 Then Response.Write("NAO1") Else Response.Write("NAO2")
    End If
 %>
