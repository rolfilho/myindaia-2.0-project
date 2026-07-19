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
<%
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim nr_processo, cd_empresa, nr_item_cliente, qtde, tp_baixar, nr_parcial, vInvoice, vDtInvoice, vQtde, cd_usuario As String
    
    nr_processo = Request.QueryString("nr_processo")
    cd_empresa = Request.QueryString("cd_empresa")
    qtde = Request.QueryString("qtde")
    nr_item_cliente = Request.QueryString("nr_item_cliente")
    tp_baixar = Request.QueryString("tp_baixar")
    nr_parcial = Request.QueryString("nr_parcial")
    cd_usuario = Request.QueryString("cd_usuario")
    
    If tp_baixar = "1" Then
        Dim SqlAux As String = "SELECT ISNULL(NR_FATURA,'') AS NR_FATURA, ISNULL(CONVERT(VARCHAR,DT_FATURA,103),'') AS DT_FATURA, ISNULL(QT_INICIAL,0) AS QT_INICIAL FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE = '" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL = '" & Request.QueryString("nr_parcial") & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        vInvoice = RsAux("NR_FATURA")
        vDtInvoice = RsAux("DT_FATURA")
        vQtde = CDbl(RsAux("QT_INICIAL"))
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()        
    Else
        vInvoice = ""
        vDtInvoice = ""
        vQtde = qtde
    End If
    
    %>
<center>
<div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaBaixaParcial();" style="cursor:pointer;"></div>
<br />
<div style="float:left;width:130px;color:#000000;font-size:9pt;font-family:verdana;">
   <label style="width:120px;">Invoice</label><input id="txtInvoice" type="text" class="textbox" value='<%=vInvoice%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" /><br />
   <label style="width:120px;">Data da Fatura</label><input id="txtDtFatura" type="text" class="textbox" value='<%=vDtInvoice%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" onblur="validarData(this,this.value);"/><br />
   <%If tp_baixar = "1" Then%>
   <label style="width:120px;">Qtde. Baixar</label><input id="txtQtdeBaixar" type="text" class="textbox" value='<%=vQtde %>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" readonly="true"/><br />
   <%Else%>
   <label style="width:120px;">Qtde. Baixar</label><input id="txtQtdeBaixar" type="text" class="textbox" value='<%=vQtde %>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px"  onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}" onblur="verificaQtde();"/><br />
   <%End If%>
    <input id="btnOK" onclick="calculaParcial('cd_usuario=<%=Trim(cd_usuario) %>&nr_processo=<%=Trim(nr_processo) %>&cd_empresa=<%=cd_empresa %>&nr_item_cliente=<%=nr_item_cliente %>&qtde=<%=qtde %>&tipo=<%=tp_baixar%>&nr_parcial=<%=nr_parcial%>&invoice='+document.getElementById('txtInvoice').value+'&qtde_baixada='+document.getElementById('txtQtdeBaixar').value+'&dt_invoice='+document.getElementById('txtDtFatura').value+'');" class="textbox" type="button" value="OK" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;width:50px;height:20px"/>
    <input id="txtQtdeInicial" type="hidden" value='<%= Request.QueryString("qtde")%>' />
    </div>
</center>
</body>
</html>
