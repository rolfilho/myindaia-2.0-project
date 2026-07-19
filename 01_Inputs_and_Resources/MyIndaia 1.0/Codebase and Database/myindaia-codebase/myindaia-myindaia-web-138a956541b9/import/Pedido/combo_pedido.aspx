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
            
            Dim cd_unid_neg, cd_cliente, color, campo, codigo, SqlAux As String
            cd_unid_neg = Request.QueryString("cd_unid_neg")
            cd_cliente = Request.QueryString("cd_cliente")
            campo = Request.QueryString("campo")
            codigo = Request.QueryString("codigo")
            color = "#f0f1f6"
            
            If campo = "frmEditaPedido_txtNrPedido2" Or campo = "frmEditaPedido_txtNrPedido" Then
                SqlAux = " SELECT NR_PROCESSO AS NR_REFERENCIA, CONVERT(VARCHAR,DT_ABERTURA,103) AS DT_ABERTURA " & _
               " FROM TPO (NOLOCK) " & _
               " WHERE NR_PROCESSO NOT IN (SELECT NR_REFERENCIA FROM TPROCESSO (NOLOCK) WHERE NR_REFERENCIA IS NOT NULL)"
                If cd_cliente <> "" Then
                    SqlAux = SqlAux & " AND CD_EMPRESA = '" & cd_cliente & "'"
                End If
                SqlAux = SqlAux & " ORDER BY CONVERT(DATETIME,DT_ABERTURA,103) DESC "
            Else
                SqlAux = "SELECT NR_REFERENCIA, SUBSTRING(NR_PROCESSO,5,15) AS NR_PROCESSO, " & _
                "  (SELECT SUBSTRING(AP_EMPRESA,1,20) FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, CONVERT(VARCHAR,DT_ABERTURA,103) AS DT_ABERTURA " & _
                " FROM TPROCESSO (NOLOCK) " & _
                " WHERE CD_UNID_NEG = '" & cd_unid_neg & "' " & _
                " AND CD_PRODUTO  = '06' " & _
                " AND ISNULL(NR_REFERENCIA, '''') <> '''' " & _
                " AND YEAR(DT_ABERTURA) > YEAR(GETDATE())-4 "
                If cd_cliente <> "" Then
                    SqlAux = SqlAux & " AND CD_CLIENTE = '" & cd_cliente & "'"
                End If
            End If
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            Do While RsAux.Read()
                If color = "#DEE6EF" Then
                    color = "#f0f1f6"
                Else
                    color = "#DEE6EF"
                End If
                %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=RsAux(codigo).ToString%>','' ,'<%=campo %>');">
                <td><nobr><%=RsAux("NR_REFERENCIA").ToString%></nobr></td>
                <%If campo <> "frmEditaPedido_txtNrPedido2" And campo <> "frmEditaPedido_txtNrPedido" Then%>
                <td><nobr><%=RsAux("NR_PROCESSO").ToString%></nobr></td>
                <td><nobr><%=Trim(RsAux("NM_EMPRESA").ToString)%></nobr></td>
                <%End If%>
                <td><nobr><%=RsAux("DT_ABERTURA").ToString%></nobr></td>
                </tr>
                <%  
                Loop
                
                RsAux.Close()
                CmdAux.Dispose()
            CnnAux.Close()
            %>  
    </table>
</body>
</html>
