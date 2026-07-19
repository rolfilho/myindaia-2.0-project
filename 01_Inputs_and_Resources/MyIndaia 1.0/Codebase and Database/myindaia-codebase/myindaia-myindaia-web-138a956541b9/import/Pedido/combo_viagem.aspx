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
            
            Dim cd_unid_neg, navio, campo, color, codigo As String
            cd_unid_neg = Request.QueryString("cd_unid_neg")
            navio = Request.QueryString("navio")
            color = "#f0f1f6"
            campo = "frmEditaPedido_txtNrViagem"
            
            Dim SqlAux As String = " SELECT V.NR_VIAGEM, SUBSTRING(V.NR_VIAGEM,1,2)+'/'+ SUBSTRING(V.NR_VIAGEM,3,2) AS NR_VIAGEM2, CONVERT(VARCHAR,V.DT_ESPERADA,103) AS DT_ESPERADA, CONVERT(VARCHAR,V.DT_ENT,103) AS DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, V.NR_MANIFESTO " & _
            " FROM   TVIAGEM V ( NOLOCK ), TARMAZEM A ( NOLOCK ), TLOCAL_EMBARQUE E ( NOLOCK ) " & _
            " WHERE V.CD_UNID_NEG           = '" & cd_unid_neg & "' " & _
            "  AND V.CD_PRODUTO            = '01' " & _
            "  AND V.CD_EMBARCACAO         = '" & navio & "' " & _
            "  AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM " & _
            "  AND V.CD_LOCAL              = E.CODIGO "
            
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            Do While RsAux.Read()
                codigo = "NR_VIAGEM2"
                If color = "#DEE6EF" Then
                    color = "#f0f1f6"
                Else
                    color = "#DEE6EF"
                End If
                %>
                
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=RsAux(codigo).ToString%>','' ,'<%=campo %>');">
                <td><nobr><%=RsAux("NR_VIAGEM2").ToString%></nobr></td>
                <td title="Data Esperada"><nobr><%=RsAux("DT_ESPERADA").ToString%></nobr></td>
                <td title="Data Entrada"><nobr><%=Trim(RsAux("DT_ENT").ToString)%></nobr></td>
                <td><nobr><%=RsAux("DESCRICAO").ToString%></nobr></td>
                <td title="Armazém"><nobr><%=RsAux("NM_ARMAZEM").ToString%></nobr></td>
                <td title="Manifesto"><nobr><%=RsAux("NR_MANIFESTO").ToString%></nobr></td>
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
