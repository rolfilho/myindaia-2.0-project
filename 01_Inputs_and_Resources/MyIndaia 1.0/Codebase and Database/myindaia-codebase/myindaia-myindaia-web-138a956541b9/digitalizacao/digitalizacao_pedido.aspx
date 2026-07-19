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

<script type="text/javascript" language="javascript">
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <table style="cursor:pointer;font-size:8pt;font-family:verdana;color:#000000;height:19px;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            
            Dim cd_unid_neg, cd_cliente, cd_produto, color, campo, codigo, SqlAux As String
            cd_unid_neg = Request.QueryString("cd_unid_neg")
            cd_cliente = Request.QueryString("cd_cliente")
            cd_produto = Request.QueryString("cd_produto")
            campo = Request.QueryString("campo")
            codigo = Request.QueryString("codigo")
            color = "#f4d296"
            
            If campo = "frmDigitalizacaoPrincipal_txtNrPedido" Then
                SqlAux = " SELECT NR_PROCESSO AS NR_REFERENCIA, CONVERT(VARCHAR,DT_ABERTURA,103) AS DT_ABERTURA " & _
               " FROM TPO (NOLOCK) " & _
               " WHERE NR_PROCESSO IN (SELECT NR_REFERENCIA FROM TPROCESSO (NOLOCK) WHERE NR_REFERENCIA IS NOT NULL AND CD_PRODUTO = '06')"
                If cd_cliente <> "" Then
                    SqlAux = SqlAux & " AND CD_EMPRESA = '" & cd_cliente & "'"
                End If
                SqlAux = SqlAux & " AND DT_ABERTURA > GETDATE() - 60 "
                SqlAux = SqlAux & " ORDER BY CONVERT(DATETIME,DT_ABERTURA,103) DESC "
            Else
                If campo = "frmDigitalizacaoPrincipal_txtNrProcesso" Then
                    SqlAux = "SELECT NR_REFERENCIA, SUBSTRING(NR_PROCESSO,5,15) AS NR_PROCESSO, " & _
                    "  (SELECT SUBSTRING(AP_EMPRESA,1,20) FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, CONVERT(VARCHAR,DT_ABERTURA,103) AS DT_ABERTURA " & _
                    " FROM TPROCESSO (NOLOCK) " & _
                    " WHERE CD_UNID_NEG = '" & cd_unid_neg & "' " & _
                    " AND DT_ABERTURA > GETDATE()-60 " & _
                    " AND CD_PRODUTO = '" & cd_produto &  "'"
                Else
                    SqlAux = "SELECT ID.ID_CODIGO AS NR_PROCESSO, CONVERT(VARCHAR,ID.DT_CRIACAO,103) AS DT_CRIACAO, U1.NM_USUARIO AS NM_USUARIO, CONVERT(VARCHAR,ID.DT_AUTORIZACAO,103) AS DT_AUTORIZACAO, U2.NM_USUARIO AS NM_USUARIO_AUTORIZACAO, EN.AP_EMPRESA, " & _
                   " SUBSTRING(ID.NR_PROCESSO,5,15) AS NR_PROCESSO2, ID.NR_PROCESSO AS NR_PROCESSO3, E.NM_EMBARCACAO, ID.NR_CONHECIMENTO, ID.ID_CLIENTE" & _
                   " FROM TINSTRUCAO_DESEMBARACO ID (NOLOCK) LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = ID.CD_CLIENTE" & _
                   "  LEFT JOIN TUSUARIO U1 (NOLOCK) ON U1.CD_USUARIO = ID.CD_USUARIO" & _
                   "  LEFT JOIN TUSUARIO U2 (NOLOCK) ON U2.CD_USUARIO = ID.CD_USUARIO_AUTORIZACAO" & _
                   "  LEFT JOIN TUSUARIO U3 (NOLOCK) ON U3.CD_USUARIO = ID.CD_RESPONSAVEL" & _
                   "  LEFT JOIN TEMBARCACAO E (NOLOCK) ON E.CD_EMBARCACAO = ID.CD_EMBARCACAO" & _
                   "  WHERE ID.CD_USUARIO IS NOT NULL" & _
                   "    AND ID.DT_CRIACAO > GETDATE() - 60" & _
                    " ORDER BY CONVERT(DATETIME,ID.DT_CRIACAO,103) DESC, SUBSTRING(ID_CODIGO,3,8) DESC"
                End If                
            End If            
            'Response.Write(SqlAux)
            'Response.end
            
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            Do While RsAux.Read()
                If color = "#feedce" Then
                    color = "#f4d296"
                Else
                    color = "#feedce"
                End If
                %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=RsAux(codigo).ToString%>','' ,'<%=campo %>');">
                <% If campo = "frmDigitalizacaoPrincipal_txtID" Then%>
                <td><nobr><%= RsAux("NR_PROCESSO").ToString%></nobr></td>
                <td><nobr><%= RsAux("AP_EMPRESA").ToString%></nobr></td>
                <%Else%>
                <td><nobr><%=RsAux("NR_REFERENCIA").ToString%></nobr></td>
                <%If campo <> "frmDigitalizacaoPrincipal_txtNrPedido" Then%>
                <td><nobr><%=RsAux("NR_PROCESSO").ToString%></nobr></td>
                <td><nobr><%=Trim(RsAux("NM_EMPRESA").ToString)%></nobr></td>
                <%End If%>
                <td><nobr><%=RsAux("DT_ABERTURA").ToString%></nobr></td>
                <%End If%>
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
