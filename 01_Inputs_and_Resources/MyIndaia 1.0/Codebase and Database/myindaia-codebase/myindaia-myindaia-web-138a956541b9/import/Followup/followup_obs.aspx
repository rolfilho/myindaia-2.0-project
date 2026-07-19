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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<%
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim nr_processo, cd_usuario, vObs, vPedido As String
    Dim SqlAux As String
    
    nr_processo = Request.QueryString("nr_processo")
    cd_usuario = Request.QueryString("cd_usuario")

    SqlAux = " SELECT ISNULL(PO.TX_OBS,'') AS TX_OBS, PO.NR_PROCESSO " & _
    " FROM TFLP_PO PO (NOLOCK) " & _
    " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " & _
    " WHERE P.NR_PROCESSO = '" & Trim(nr_processo) & "' AND PO.CD_EVENTO = '022'"
   
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    vObs = RsAux("TX_OBS")
    vPedido = RsAux("NR_PROCESSO")
    %>
<center>
<div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaObs();" style="cursor:pointer;"></div>
<br />
<div style="float:left;width:400px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;">
<div style="float:left;width:175px"><input id="txtPedidoObs" type="text" class="textbox" value='<%=vPedido%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px;"/></div>
<div style="height:30px;width:200px;overflow:hidden;top:0px;text-align:right;">
<img src="\imagens\salvar3_16.gif" style="cursor:pointer;" alt="Salvar Observações" onclick="javascript:SalvarObs('<%=Request.QueryString("nr_processo")%>',document.getElementById('txtObs'));"/>
</div>
<textarea id="txtObs" type="text" class="textbox" style="background-color:#DEE6EF;font-size:10pt;height:215px;width:380px;overflow:auto;"><%=Replace(vObs, """", "'")%></textarea><br />
</div>
</center>
</body>
</html>
