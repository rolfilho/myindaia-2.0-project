<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            
        Dim vQtde, vPlItem, vVlUnit As Double
        Dim vTpCalculo As String
        vQtde = CDbl(Request.QueryString("qtde"))
        vVlUnit = CDbl(Request.QueryString("vl_unit"))
        vPlItem = CDbl(Request.QueryString("pl_item"))
        vTpCalculo = CDbl(Request.QueryString("tp_calculo"))
        
        If vQtde * vVlUnit = 0 Then
            Response.Write(0)
        Else
            Select Case vTpCalculo
                Case "1"
                    Response.Write(vQtde * vVlUnit)
                Case "2"
                    Response.Write(vQtde * vVlUnit / 100)
                Case "3"
                    Response.Write(vQtde * vVlUnit / 1000)
                Case "4"
                    Response.Write(vPlItem * vVlUnit)
                Case "5"
                    Response.Write(0)
                Case Else
                    Response.Write(vQtde * vVlUnit)
            End Select
        End If
    End Sub    
</script>

