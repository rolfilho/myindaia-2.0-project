<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Dim codigo, nome, tabela, usuario As String
        'codigo = Request.QueryString("codigo")
        'nome = Request.QueryString("nome")
        'tabela = Request.QueryString("tabela")
        'usuario = Request.QueryString("usuario")
        
        'SqlConsulta.SelectCommand = "SELECT " + codigo + " AS 'Código'," + nome + " AS 'Descrição' FROM " + tabela & _
        '" WHERE IN_ATIVO = 1"
    End Sub
    
    
</script>

<script type="text/javascript" language="javascript">
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <table style="cursor:pointer;font-size:8pt;font-family:verdana;color:#000000;height:19px;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim cd_cliente, id_codigo, cd_usuario_criacao, color, SqlAux As String
            Dim qtde As Integer
            cd_cliente = Request.QueryString("cd_cliente")
            id_codigo = Request.QueryString("id_codigo")
            cd_usuario_criacao = Request.QueryString("cd_usuario_criacao")
            color = "#f0f1f6"
            
            SqlAux = " SELECT COUNT(*) AS QTD FROM TINSTRUCAO_DESEMBARACO_PEDIDO WHERE ID_CODIGO = '" & id_codigo & "' " 
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
            qtde = RsAux("QTD")
            RsAux.Close()
            CnnAux.Close()
            
            
            SqlAux = "SELECT P.NR_REFERENCIA, SUBSTRING(P.NR_PROCESSO,5,15) AS NR_PROCESSO, " & _
            "  (SELECT SUBSTRING(AP_EMPRESA,1,20) FROM TEMPRESA_NAC WHERE CD_EMPRESA = P.CD_CLIENTE) NM_EMPRESA, CONVERT(VARCHAR,P.DT_ABERTURA,103) AS DT_ABERTURA " & _
            " FROM TPROCESSO P (NOLOCK) " & _
            " INNER JOIN TPO PO (NOLOCK) ON PO.NR_PROCESSO = P.NR_REFERENCIA AND PO.CD_EMPRESA = P.CD_CLIENTE " & _
            " WHERE P.CD_PRODUTO  = '06' " & _
            " AND ISNULL(P.NR_REFERENCIA, '') <> '' " & _
            " AND YEAR(P.DT_ABERTURA) > YEAR(GETDATE())-4 " & _
            " AND ISNULL(PO.CD_EXPORTADOR,'') <> '' " & _
            " AND P.CD_ANALISTA_COMISSARIA = '" & cd_usuario_criacao & " ' "
                        
            If qtde > 0 Then
                SqlAux = SqlAux & " AND ISNULL(PO.CD_AREA,'') IN (SELECT PO.CD_AREA FROM TINSTRUCAO_DESEMBARACO_PEDIDO ID (NOLOCK) " & _
                " INNER JOIN TPO PO (NOLOCK) ON PO.NR_PROCESSO = ID.NR_REFERENCIA " & _
                " WHERE ID_CODIGO = '" & id_codigo & "') "
            End If
            
            If cd_cliente <> "" Then
                SqlAux = SqlAux & " AND P.CD_CLIENTE = '" & cd_cliente & "'"
            End If
                            
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            
            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='50px' style='font-family:Verdana;font-size:9pt;'><td><center>Não foram encontrados registros para esta pesquisa</center></td></tr>")
            Else
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#f0f1f6"
                    Else
                        color = "#DEE6EF"
                    End If
                %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=Trim(RsAux("NR_REFERENCIA").ToString)%>','PEDIDO');">
                <td><nobr><%=RsAux("NR_REFERENCIA").ToString%></nobr></td>
                <td><nobr><%=RsAux("NR_PROCESSO").ToString%></nobr></td>
                <td><nobr><%=Trim(RsAux("NM_EMPRESA").ToString)%></nobr></td>
                <td><nobr><%=RsAux("DT_ABERTURA").ToString%></nobr></td>
                </tr>
                <%  
                Loop
            End If
            RsAux.Close()
            CmdAux.Dispose()
            CnnAux.Close()
            %>  
    </table>
</body>
</html>
