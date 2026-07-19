<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 

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
    <table style="cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:631px;text-align:left;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim ult_30, autorizados, minhas, usuario, color, cargo, id_codigo, resp, embarque As String
            Dim SqlAux As String
            
            ult_30 = Request.QueryString("ult_30")
            autorizados = Request.QueryString("autorizados")
            minhas = Request.QueryString("minhas")
            usuario = Request.QueryString("usuario")
            id_codigo = Request.QueryString("id_codigo")
            resp = Request.QueryString("resp")
            embarque = Request.QueryString("embarque")
            color = "#FFFFFF"

            SqlAux = "SELECT CD_CARGO FROM TUSUARIO WHERE CD_USUARIO = '" & usuario & "' "
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
            cargo = RsAux("CD_CARGO")
            RsAux.Close()
            CnnAux.Close()
            

            SqlAux = "SELECT ID.ID_CODIGO, CONVERT(VARCHAR,ID.DT_CRIACAO,103) AS DT_CRIACAO, U1.NM_USUARIO AS NM_USUARIO, CONVERT(VARCHAR,ID.DT_AUTORIZACAO,103) AS DT_AUTORIZACAO, U2.NM_USUARIO AS NM_USUARIO_AUTORIZACAO, EN.AP_EMPRESA, " & _
            " SUBSTRING(ID.NR_PROCESSO,5,15) AS NR_PROCESSO, ID.NR_PROCESSO AS NR_PROCESSO2, E.NM_EMBARCACAO, ID.NR_CONHECIMENTO, ID.ID_CLIENTE" & _
            " FROM TINSTRUCAO_DESEMBARACO ID (NOLOCK) LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = ID.CD_CLIENTE" & _
            "  LEFT JOIN TUSUARIO U1 (NOLOCK) ON U1.CD_USUARIO = ID.CD_USUARIO" & _
            "  LEFT JOIN TUSUARIO U2 (NOLOCK) ON U2.CD_USUARIO = ID.CD_USUARIO_AUTORIZACAO" & _
            "  LEFT JOIN TUSUARIO U3 (NOLOCK) ON U3.CD_USUARIO = ID.CD_RESPONSAVEL" & _
            "  LEFT JOIN TEMBARCACAO E (NOLOCK) ON E.CD_EMBARCACAO = ID.CD_EMBARCACAO" & _
            "  WHERE ID.CD_USUARIO IS NOT NULL"
            If ult_30 = "1" Then
                SqlAux = SqlAux & " AND DT_CRIACAO > GETDATE()-30"
            End If
            If autorizados = "1" Then
                SqlAux = SqlAux & " AND DT_AUTORIZACAO IS NOT NULL "
            Else
                SqlAux = SqlAux & " AND DT_AUTORIZACAO IS NULL "
            End If
            If minhas = "1" Then
                SqlAux = SqlAux & " AND ID.CD_USUARIO = '" & usuario & "'"
            End If
            If InStr("040;055;060;088;131", cargo) > 0 Then
                SqlAux = SqlAux & " AND ID.CD_CLIENTE IN (SELECT CD_EMPRESA " & _
                " FROM TEMPRESA_NAC E " & _
                " INNER JOIN TPERMISSAO_GRUPO G ON G.CD_GRUPO = E.CD_GRUPO AND G.IN_ATIVO = '1' " & _
                " WHERE E.IN_ATIVO = '1' " & _
                " AND G.CD_USUARIO = '" & usuario & "') "
            End If
            If Trim(id_codigo) <> "" Then
                SqlAux = SqlAux & " AND ID.ID_CODIGO LIKE '%" & id_codigo & "%'"
            End If
            If Trim(resp) <> "" Then
                SqlAux = SqlAux & " AND (U1.NM_USUARIO LIKE '%" & resp & "%' OR U2.NM_USUARIO LIKE '%" & resp & "%')"
            End If
            If Trim(embarque) <> "" Then
                SqlAux = SqlAux & " AND (ID.ID_CLIENTE LIKE '%" & embarque & "%' OR ID.NR_PROCESSO LIKE '%" & embarque & "%')"
            End If
            SqlAux = SqlAux & " ORDER BY CONVERT(DATETIME,ID.DT_CRIACAO,103) DESC, SUBSTRING(ID_CODIGO,3,8) DESC"
           
                        
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            Do While RsAux.Read()
                If color = "#DEE6EF" Then
                    color = "#FFFFFF"
                Else
                    color = "#DEE6EF"
                End If
            %>
                <tr bgcolor="<%=color%>" style="height:20px;text-align:left;">
                <td style="width:80px"><nobr><a class="nounderline" href="id_edita.aspx?acao=editar&id_codigo=<%=RsAux("ID_CODIGO").ToString %>"><%=RsAux("ID_CODIGO").ToString%></a></nobr></td>
                <td style="width:70px"><nobr><%=RsAux("DT_CRIACAO").ToString%></nobr></td>
                <td style="width:125px"><nobr><%=RsAux("DT_AUTORIZACAO").ToString%></nobr></td>
                <td style="width:230px"><%=RsAux("NM_USUARIO_AUTORIZACAO").ToString%></td>
                <td style="width:120px"><nobr><%=RsAux("AP_EMPRESA").ToString%></nobr></td>
                <td style="width:80px"><nobr><a class="nounderline" href="../../detalhe/imp_proc_result.asp?nr_processo=<%=RsAux("NR_PROCESSO2").ToString %>"><%=RsAux("NR_PROCESSO").ToString%></a></nobr></td>
                <td style="width:80px"><nobr><%= RsAux("ID_CLIENTE").ToString%></nobr></td>
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
