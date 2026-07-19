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

            SqlAux = " SELECT DISTINCT NM_ITEM, NR_FATURA, VL_ITEM, CD_DESPESA " & _
            " FROM TINSTRUCAO_DESEMBARACO_DESPESAS (NOLOCK) " & _
            " WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"
    
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
                <td style="width:80px;text-align:center;"><%= RsAux("NM_ITEM").ToString%></td>
                <td style="width:120px;text-align:center;"><%= RsAux("NR_FATURA").ToString%></td>
                <td style="width:120px;text-align:center;"><%= RsAux("VL_ITEM").ToString%></td>
                <td style="width:20px;text-align:center;"><img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirDespesaID('<%=RsAux("ID_CODIGO")%>','<%=RsAux("NM_ITEM")%>','<%=RsAux("CD_DESPESA")%>');" style="cursor:pointer;" alt="Excluir Despesa"/> </td>
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
   
