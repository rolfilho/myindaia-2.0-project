<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<html xmlns="http://www.w3.org/1999/xhtml"><body>
    <table style="cursor:pointer;font-size:8pt;font-family:verdana;color:#000000;height:19px;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim color, SqlAux, campo, tabela As String
            color = "#f0f1f6"
            campo = Request.QueryString("campo")
            tabela = Request.QueryString("tabela")
            SqlAux = ""
            If tabela = "ITEM_CLIENTE" Then
                SqlAux = "SELECT DISTINCT NR_ITEM_CLIENTE AS CODIGO, '' AS NR_FATURA " & _
                " FROM TPO_ITEM POI (NOLOCK) " & _
                " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
                " WHERE P.NR_PROCESSO = '" & Request.QueryString("nr_processo") & "'" & _
                " ORDER BY NR_ITEM_CLIENTE "
            Else
                SqlAux = "SELECT DISTINCT CASE NR_PARCIAL WHEN 0 THEN 'S' ELSE CONVERT(VARCHAR,NR_PARCIAL) END AS CODIGO, POI.NR_FATURA AS NR_FATURA, POI.NR_PARCIAL  " & _
                " FROM TPO_ITEM POI (NOLOCK) " & _
                " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
                " WHERE P.NR_PROCESSO = '" & Request.QueryString("nr_processo") & "'" & _
                " AND POI.NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "'" & _
                " ORDER BY POI.NR_PARCIAL"
            End If
       
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader

            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='50px' style='font-family:Verdana;font-size:9pt;'><td><center>Sem Registros</center></td></tr>")
            Else
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#f0f1f6"
                    Else
                        color = "#DEE6EF"
                    End If
                %>
                    <tr bgcolor="<%=color%>" onclick="enviaItemParcial('<%=Trim(RsAux("CODIGO").ToString)%>', '<%=Trim(RsAux("NR_FATURA").ToString)%>','<%=tabela %>','<%=campo %>');"><td><nobr><%=Trim(RsAux("CODIGO").ToString)%></nobr></td></tr>
                <%  
                Loop
            End If
            RsAux.Close()
            CnnAux.Close()
            %>  
    </table>
</body>
</html>

