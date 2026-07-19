<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>
    
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim color As String
            Dim SqlAux As String
            color = "#FFFFFF"

            SqlAux = " SELECT A.NR_PROCESSO, A.CD_EMPRESA, A.NR_ITEM_CLIENTE, A.NR_PARCIAL, CONVERT(DECIMAL(28,5),A.QT_INICIAL) AS QT_INICIAL, A.CD_UNID_MEDIDA, " & _
            " A.NR_FATURA, B.NM_SIGLA, A.CD_MERCADORIA, C.AP_MERCADORIA " & _
            " FROM TPO_ITEM A (NOLOCK) " & _
            " LEFT JOIN TUNID_MEDIDA_BROKER B (NOLOCK) ON B.CD_UNID_MEDIDA = A.CD_UNID_MEDIDA " & _
            "   INNER JOIN TMERCADORIA C (NOLOCK) ON C.CD_MERCADORIA = A.CD_MERCADORIA " & _
            "   INNER JOIN TESTAGIO_PROCESSO D (NOLOCK) ON D.NR_REFERENCIA   = A.NR_PROCESSO " & _
            "                                 AND D.CD_EMPRESA      = A.CD_EMPRESA " & _
            "                                 AND D.NR_ITEM_CLIENTE = A.NR_ITEM_CLIENTE " & _
            "                                 AND D.NR_PARCIAL      = A.NR_PARCIAL " & _
            "   INNER JOIN TPROCESSO E (NOLOCK) ON E.NR_PROCESSO = D.NR_PROCESSO_ADM " & _
            "   INNER JOIN TEMPRESA_NAC F (NOLOCK) ON F.CD_EMPRESA = E.CD_CLIENTE " & _
            " WHERE A.NR_PROCESSO   = '" & Request.QueryString("pedido") & "'" & _
            "  AND A.CD_EMPRESA    = '" & Request.QueryString("cliente") & "'" & _
            "  AND IN_SUBSTITUIDO  = '0'" & _
            "  AND A.NR_PARCIAL   <> 0" & _
            "  AND ISNULL(A.IN_UTILIZADO_INSTR_DESEMB, '') <> '1'" & _
            "  AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, ''),5,2) IN ('DT', 'IE', '')))"
    
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            If Not RsAux.HasRows Then
                Response.Write("ERRO")
            Else
                %>
                <table style="text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:582px;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
                <%
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#FFFFFF"
                    Else
                        color = "#DEE6EF"
                    End If
                 %>  
                <tr bgcolor="<%=color%>" style="height:20px;text-align:center;">
                <td style="width:100px;"><%=RsAux("NR_ITEM_CLIENTE").ToString%></td>
                <td style="width:20px;text-align:right;"><%=RsAux("NR_PARCIAL").ToString%></td>
                <td style="width:170px;"><%=RsAux("QT_INICIAL").ToString%></td>
                <td style="width:30px;"><%=RsAux("NM_SIGLA").ToString%></td>
                <td style="width:250px;text-align:center;"><%=RsAux("AP_MERCADORIA").ToString%></td>
                <td style="width:16px;"><a onclick="incluirPedidoId('<%=Request.QueryString("pedido")%>','<%=Request.QueryString("cliente")%>','<%=RsAux("NR_ITEM_CLIENTE").ToString%>','<%=RsAux("NR_PARCIAL").ToString%>','<%=Request.QueryString("id_codigo")%>','<%=Request.QueryString("conhecimento")%>','<%=Request.QueryString("navio")%>')"><img id="imgPedido" src="../../imagens/icones/16x16/add.gif" alt="Adicionar Pedido/Item/Parcial" align="middle" style="cursor:pointer;" /></a></td>
                </tr>
            <%    
            Loop
            %>
            </table>
            <%
        End If
            RsAux.Close()
            CmdAux.Dispose()
        CnnAux.Close()
            %>  
   
