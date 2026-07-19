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
 <%  
     Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
     Dim SqlAux As String
     Dim bgcolor, nr_processo, mes, ano, usuario, cd_mbf, cd_kpi, in_agrupar, txLinkProcesso, cd_produto, cd_tp_kpi, id_kpi, in_desvios As String
     Dim I As Integer
     in_desvios = Request.QueryString("in_desvios")
     nr_processo = Server.HtmlDecode(Request.QueryString("nr_processo"))
     mes = Request.QueryString("mes")
     ano = Request.QueryString("ano")
     usuario = Request.QueryString("usuario")
     cd_mbf = Request.QueryString("cd_mbf")
     cd_kpi = Request.QueryString("cd_kpi")
     cd_tp_kpi = Request.QueryString("cd_tp_kpi")
     id_kpi = Request.QueryString("id_kpi")
     in_agrupar = Request.QueryString("in_agrupar")
     cd_produto = Request.QueryString("produto")
     bgcolor = "#ffcccc"
     I = 0
     
     Select Case in_agrupar
         Case "0"
             SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, M.DIAS_KPI, M.DIAS_KPI_CORRIDOS, M.NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
             " FROM TMBF_RESULTADO M (NOLOCK) " & _
             " WHERE M.CD_MBF = " & cd_mbf & _
             "   AND M.CD_USUARIO = '" & usuario & "'" & _
             "   AND M.ANO_RESULTADO = " & ano & _
             "   AND M.DIAS_KPI >= M.NR_META " & _
             "   AND M.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
             "                         FROM TMBF_RESULTADO R (NOLOCK) " & _
             "                         WHERE R.CD_MBF = M.CD_MBF " & _
             "                           AND R.CD_USUARIO = M.CD_USUARIO " & _
             "                           AND R.ANO_RESULTADO = M.ANO_RESULTADO " & _
             "                           AND R.NR_PROCESSO = '" & nr_processo & "' " & _
             "                           AND R.CD_TP_KPI = '" & cd_tp_kpi & "' " & _
             "                           AND R.ID_KPI = " & id_kpi & "" & _
             "                           AND R.CD_KPI = '" & cd_kpi & "')" & _
             " ORDER BY M.DIAS_KPI DESC "
               
         Case "1"
             SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, M.DIAS_KPI, M.DIAS_KPI_CORRIDOS, M.NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
             " FROM TMBF_RESULTADO M (NOLOCK) " & _
             " WHERE M.CD_MBF = " & cd_mbf & _
             "   AND M.CD_USUARIO = '" & usuario & "'" & _
             "   AND M.MES_RESULTADO = " & mes & _
             "   AND M.ANO_RESULTADO = " & ano & _
             "   AND M.DIAS_KPI >= M.NR_META " & _
             "   AND M.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
             "                         FROM TMBF_RESULTADO R (NOLOCK) " & _
             "                         WHERE R.CD_MBF = M.CD_MBF " & _
             "                           AND R.CD_USUARIO = M.CD_USUARIO " & _
             "                           AND R.MES_RESULTADO = M.MES_RESULTADO " & _
             "                           AND R.ANO_RESULTADO = M.ANO_RESULTADO " & _
             "                           AND R.NR_PROCESSO = '" & nr_processo & "' " & _
             "                           AND R.CD_TP_KPI = '" & cd_tp_kpi & "' " & _
             "                           AND R.ID_KPI = " & id_kpi & "" & _
             "                           AND R.CD_KPI = '" & cd_kpi & "')" & _
             " ORDER BY M.DIAS_KPI DESC "
         Case "2"
             SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, M.DIAS_KPI, M.DIAS_KPI_CORRIDOS, M.NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
             " FROM TMBF_RESULTADO M (NOLOCK) " & _
             " WHERE M.CD_MBF = " & cd_mbf & _
             "   AND M.CD_USUARIO = '" & usuario & "'" & _
             "   AND M.MES_RESULTADO IN (" & mes & ")" & _
             "   AND M.ANO_RESULTADO = " & ano & _
             "   AND M.DIAS_KPI >= M.NR_META " & _
             "   AND M.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
             "                         FROM TMBF_RESULTADO R (NOLOCK) " & _
             "                         WHERE R.CD_MBF = M.CD_MBF " & _
             "                           AND R.CD_USUARIO = M.CD_USUARIO " & _
             "                           AND R.MES_RESULTADO = M.MES_RESULTADO " & _
             "                           AND R.ANO_RESULTADO = M.ANO_RESULTADO " & _
             "                           AND R.NR_PROCESSO = '" & nr_processo & "' " & _
             "                           AND R.CD_TP_KPI = '" & cd_tp_kpi & "' " & _
             "                           AND R.ID_KPI = " & id_kpi & "" & _
             "                           AND R.CD_KPI = '" & cd_kpi & "')" & _
             " ORDER BY M.DIAS_KPI DESC "
         Case "3"
             SqlAux = "SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO, 5, 15) NR_PROCESSO_REDUZIDO, TX_OBS_DESVIO, ISNULL(IN_SELECIONADO, 0) IN_SELECIONADO, M.ANO_RESULTADO, M.MES_RESULTADO, M.DIAS_KPI, M.DIAS_KPI_CORRIDOS, M.NR_META, M.NM_KPI, M.NM_QUEBRAS " & _
             " FROM TMBF_RESULTADO M (NOLOCK) " & _
             " WHERE M.CD_MBF = " & cd_mbf & _
             "   AND M.CD_USUARIO = '" & usuario & "'" & _
             "   AND M.MES_RESULTADO IN (" & mes & ")" & _
             "   AND M.ANO_RESULTADO = " & ano & _
             "   AND M.DIAS_KPI >= M.NR_META " & _
             "   AND M.NM_COMPLETO IN (SELECT NM_COMPLETO " & _
             "                         FROM TMBF_RESULTADO R (NOLOCK) " & _
             "                         WHERE R.CD_MBF = M.CD_MBF " & _
             "                           AND R.CD_USUARIO = M.CD_USUARIO " & _
             "                           AND R.MES_RESULTADO = M.MES_RESULTADO " & _
             "                           AND R.ANO_RESULTADO = M.ANO_RESULTADO " & _
             "                           AND R.NR_PROCESSO = '" & nr_processo & "' " & _
             "                           AND R.CD_TP_KPI = '" & cd_tp_kpi & "' " & _
             "                           AND R.ID_KPI = " & id_kpi & "" & _
             "                           AND R.CD_KPI = '" & cd_kpi & "')" & _
             " ORDER BY M.DIAS_KPI DESC "
     End Select
                         
     'Response.Write(SqlAux)
     'Response.end
     Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
     Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
     CnnAux.Open()
     Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
             
     If Not RsAux.HasRows Then
         Response.Write("ERRO")
         RsAux.Close()
         CnnAux.Close()
     Else
         RsAux.Read()
             %>
             
<script type="text/javascript" language="javascript">
    
</script>
<html>
<head>
<title>Untitled Document</title>
</head>
<body>
    <table style="cursor:pointer;font-size:10px;font-family:verdana;color:#000000;height:98%;BORDER-COLLAPSE:collapse;width: 98%;border-width:0px 0px 0px 0px;border-style:solid;border-bottom-color:#000000;" cellspacing="0" cellpadding="0">
        
        <tr style="vertical-align:top;" height="20px">
        <td colspan="5"><B><%=RsAux("NM_KPI") %></B><br /><%= RsAux("NM_QUEBRAS")%><br /><br /></td>
        </tr>
        <%  
            RsAux.Close()
            CnnAux.Close()
        %>
        <tr height="12px" style="text-align:center;background-color:#808080;color:#FFFFFF;font-weight:bold;">
        <td width="90px">&nbsp;Processo&nbsp;</td>
        <td width="30px">&nbsp;Meta&nbsp;</td>
        <td width="30px">&nbsp;KPI&nbsp;</td>
        <td width="330px">&nbsp;Desvio&nbsp;</td>
        <%If in_desvios = "1" Then%>
        <td width="40px">&nbsp;Utilizar?&nbsp;</td>
        <%End If%>
        </tr>
            <% 
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                Do While RsAux.Read()                    
                    If cd_produto = "01" Then
                        txLinkProcesso = "/Detalhe/imp_proc_result.asp?RadioGroup1=&StatusMenu=1&cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&" & _
                                         "tp_relat=2&filtro=nr_processo&nr_processo=" + RsAux("NR_PROCESSO")
                    Else
                        txLinkProcesso = "/Detalhe/exp_proc_result.asp?cd_menu_rel=02&cd_subm_rel=01&cd_view_rel=1630-0201-03&filtro=nr_processo&nr_processo=" + RsAux("NR_PROCESSO")
                    End If
                    
                    If bgcolor = "#FFFFFF" Then bgcolor = "#E6E9EC" Else bgcolor = "#FFFFFF"
               %>
                 <tr bgcolor="<%= bgcolor %>" height="25px" style="text-align:center;">
                 <td width="90px"><a href="<%=txLinkProcesso%>" title="Ver informações do processo" target="_blank" style="color:#000000;text-decoration:none;"><%= RsAux("NR_PROCESSO_REDUZIDO")%></a></td>
                 <td width="30px" style="font-weight:bold;"><%= RsAux("NR_META")%></td>
                 <%If in_desvios = "2" Then%>
                 <td width="30px" style="color:#FF0000;font-weight:bold;"><%= RsAux("DIAS_KPI_CORRIDOS")%></td>
                 <%Else%>
                 <td width="30px" style="color:#FF0000;font-weight:bold;"><%= RsAux("DIAS_KPI")%></td>
                 <%End If%>
                 <td width="330px"><textarea id="desvio_<%=I%>" class="textbox" style="width:310px;height:23px;overflow:auto;" onkeypress="this.style.backgroundColor='#FFFFFF';" rows="5"><%=RsAux("TX_OBS_DESVIO")%></textarea>&nbsp;<img src="/imagens/30/refresh16.gif" alt="Atualizar somente o desvio" style="cursor:pointer;vertical-align:absmiddle;" onclick="atualizaDesvios('<%=RsAux("NR_PROCESSO")%>','<%=RsAux("MES_RESULTADO")%>','<%=RsAux("ANO_RESULTADO")%>','<%= cd_kpi%>', document.getElementById('desvio_<%=I%>'), this, '<%= cd_tp_kpi%>', '<%= id_kpi%>');" /></td>
                 <%If in_desvios = "1" Then%>
                 <td width="40px">&nbsp;<img src="/imagens/icones/16x16/checks_mbf/<%=RsAux("IN_SELECIONADO")%>.gif" style="cursor:pointer;vertical-align:middle;" onclick="atualizaDesvios('<%=RsAux("NR_PROCESSO")%>','<%=RsAux("MES_RESULTADO")%>','<%=RsAux("ANO_RESULTADO")%>','<%= cd_kpi%>', document.getElementById('desvio_<%=I%>'), this, '<%= cd_tp_kpi%>', '<%= id_kpi%>');" /></td>
                 <%End If%>
                 </tr>
               <%
                   I = I + 1
            Loop
            RsAux.Close()
            CnnAux.Close()
          %>
           <tr style="vertical-align:top;">
        <td colspan="5">&nbsp;</td>
        </tr>
    </table>
</body>
</html>
<%End If%>