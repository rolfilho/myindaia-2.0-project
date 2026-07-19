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
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<%
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim id_codigo, color As String
    Dim SqlAux As String
    
    color = "#FFFFFF"
    id_codigo = Request.QueryString("id")

    SqlAux = " SELECT E.CD_EVENTO,  E.NM_EVENTO " & _
    " FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) " & _
    " WHERE " & _
    " SE.CD_SERVICO IN (" & _
    " SELECT CD_SERVICO " & _
    " FROM TPROCESSO(NOLOCK) " & _
    " WHERE " & _
    " NR_REFERENCIA IN ( SELECT DISTINCT NR_REFERENCIA " & _
    "		          FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) " & _
    "		            WHERE ID_CODIGO ='" & Trim(id_codigo) & "')) AND " & _
    " E.CD_EVENTO = SE.CD_EVENTO " & _
    " ORDER BY NR_ORDEM "

    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    CnnAux.Open()
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    %>
<center>
<div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaAtzFollowup();" style="cursor:pointer;"></div><br />
<div style="float:left;width:480px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;text-align:right;height:230px;">
<div style="height:30px;width:400px;overflow:hidden;top:0px;text-align:right;"><img src="\imagens\salvar3_16.gif" style="cursor:pointer;" alt="Salvar Alterações" onclick="SalvarAtzFollowup(document.getElementById('eventos'));"/></div>
<div style="height: 20px;width:480px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
<table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
<td style="width:280px;">Evento</td>
<td style="width:80px;text-align:left;">Aplicar</td>
<td style="width:140px;text-align:left;">Realização</td>      
</tr></table>
</div>
<div id="divgrdFollowupID" style="height:268px;width:480px;overflow:auto;border-color:#b4c7db;border-style:solid;border-width:1px;overflow:auto;">
<table style="cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:462px;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
<%

            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='25px' style='font-family:Verdana;font-size:9pt;'><td><center><img src='\imagens\alerta_32.gif' style='vertical-align:middle;'>Sem informações</center></td></tr>")
            Else
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#FFFFFF"
                    Else
                        color = "#DEE6EF"
                    End If
            %>
                <tr bgcolor="<%=color%>" style="height:20px;text-align:center;">
                <td style="width:20px"><input type="checkbox" id="chb_<%=RsAux("CD_EVENTO").ToString%>" onclick="habilitaLinha('<%=RsAux("CD_EVENTO").ToString%>')" /></td>
                <td id="td_cd_<%=RsAux("CD_EVENTO").ToString%>" style="width:25px" disabled="true"><%=RsAux("CD_EVENTO").ToString%></td>
                <td id="td_nm_<%=RsAux("CD_EVENTO").ToString%>" style="width:185px;text-align:left;" disabled="true"><%=RsAux("NM_EVENTO").ToString%></td>  
                <td id="td_img_<%=RsAux("CD_EVENTO").ToString%>" style="width:25px" disabled="true"><img id='img_<%=RsAux("CD_EVENTO").ToString%>' src="\imagens\icones\16x16\checks\1.gif" width="16px" height="16px" style="cursor:pointer;" alt="Aplicar" onclick="aplicaEvento('<%=RsAux("CD_EVENTO").ToString%>');" disabled="true"/><input type="hidden" name="apl_<%=RsAux("CD_EVENTO").ToString%>" value="1"/></td>          
                <td id="td_dt_<%=RsAux("CD_EVENTO").ToString%>" style="width:140px;" disabled="true"><span style="width:100px;font-size:7pt;font-family:Verdana;text-align:center;vertical-align:middle;" id="lbl_dt_<%=RsAux("CD_EVENTO").ToString%>">-</span><a id="hl_data" class="nounderline" onclick="javascript:ExibeData('<%=RsAux("CD_EVENTO").ToString%>');"><img src="\imagens\edit1.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Editar"/></a> <a id="hl_hoje" class="nounderline"><img src="\imagens\calendar1.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Hoje" onclick="javascript:preencheEventoHoje('<%=RsAux("CD_EVENTO").ToString%>');"/></a><input type="hidden" name="dt_<%=RsAux("CD_EVENTO").ToString%>" value=""/></td>                
                </tr>
            <%
            Loop
    End If
        RsAux.Close()
        CmdAux.Dispose()
    CnnAux.Close()
            %>             
</table>
<input type="hidden" name="eventos" value=""/>
</div>
<div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#7089A2;height:20px;">&nbsp;Selecione os eventos que deseja atualizar o Follow-Up</div>
</div>
</center>
</body>
</html>

