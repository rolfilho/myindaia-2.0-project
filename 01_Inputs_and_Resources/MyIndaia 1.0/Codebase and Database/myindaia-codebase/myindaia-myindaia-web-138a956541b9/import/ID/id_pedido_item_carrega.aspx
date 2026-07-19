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

            SqlAux = " SELECT DISTINCT P.NR_PROCESSO, IP.ID_CODIGO, IP.NR_REFERENCIA, IP.NR_ITEM_PO, IP.NR_PARCIAL, POI.QT_INICIAL, POI.VL_TOTAL " & _
            " FROM TINSTRUCAO_DESEMBARACO_PEDIDO IP (NOLOCK) " & _
            " INNER JOIN TINSTRUCAO_DESEMBARACO ID (NOLOCK) ON IP.ID_CODIGO = ID.ID_CODIGO " & _
            " INNER JOIN TPROCESSO P  (NOLOCK) ON P.NR_REFERENCIA = IP.NR_REFERENCIA AND P.CD_CLIENTE = ID.CD_CLIENTE " & _
            " INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = IP.NR_REFERENCIA " & _
            "                                 AND POI.NR_ITEM_CLIENTE = IP.NR_ITEM_PO " & _
            "                                 AND POI.NR_PARCIAL = IP.NR_PARCIAL " & _
            " WHERE IP.ID_CODIGO = '" & Request.QueryString("id_codigo") & "'" & _
            " AND P.IN_CANCELADO = '0'"
    
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            If Not RsAux.HasRows Then
                Response.Write("ERRO")
            Else
                %>
                <table style="text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:581px;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
                <%
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#FFFFFF"
                    Else
                        color = "#DEE6EF"
                    End If
                 %>  
                <tr bgcolor="<%=color%>" style="height:20px;">
                <td style="width:135px;text-align:center;"><a class="nounderline" onclick="VisualizaPedido('<%=RsAux("NR_PROCESSO")%>','');" target="_blank" style="cursor:pointer;"><%= RsAux("NR_REFERENCIA")%></a></td>
                <td style="width:80px;text-align:center;"><a class="nounderline" onclick="VisualizaPedido('<%=RsAux("NR_PROCESSO")%>','<%=RsAux("NR_ITEM_PO")%>');" target="_blank" style="cursor:pointer;"><%= RsAux("NR_ITEM_PO")%></a></td>
                <td style="width:80px;text-align:center;"><%= RsAux("NR_PARCIAL").ToString%></td>
                <td style="width:120px;text-align:center;"><%= RsAux("QT_INICIAL").ToString%></td>
                <td style="width:120px;text-align:center;"><%= RsAux("VL_TOTAL").ToString%></td>
                <td style="width:20px;text-align:center;"><img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirPedidoID('<%=RsAux("ID_CODIGO")%>','<%=RsAux("NR_REFERENCIA")%>','<%=RsAux("NR_ITEM_PO")%>','<%=RsAux("NR_PARCIAL")%>');" style="cursor:pointer;" alt="Excluir Pedido"/> </td>
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
   
