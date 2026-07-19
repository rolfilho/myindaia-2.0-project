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
    Dim vDtRealizacao, vNmEvento, cd_evento, data As String
    Dim SqlAux As String
    
    cd_evento = Request.QueryString("evento")
    data = Request.QueryString("data")
    
    SqlAux = " SELECT E.NM_EVENTO " & _
    " FROM TEVENTO E (NOLOCK) " & _
    " WHERE E.CD_EVENTO = '" & cd_evento & "'"
    
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    vDtRealizacao = data
    vNmEvento = RsAux("NM_EVENTO")
    RsAux.Close()
    CmdAux.Dispose()
    CnnAux.Close()
    %>
<center>
<div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaData();" style="cursor:pointer;"></div>
<br />
<div style="float:left;width:300px;color:#000000;font-size:9pt;font-family:verdana;">
   <label style="width:300px;"><b><%=cd_evento%> - <%=vNmEvento%></b></label><br /><br />
   <input id="txtDtEvento" type="text" class="textbox" value='<%=vDtRealizacao%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" onblur="validarData(this,this.value);"/>&nbsp;&nbsp;
   <input id="btnOK" onclick="preencheEvento('<%=cd_evento%>',document.getElementById('txtDtEvento'));" class="textbox" type="button" value="OK" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;width:50px;height:20px"/>
   <input id="txtDtEventoInicial" type="hidden" value='<%=vDtRealizacao%>' />
</div>
</center>
</body>
</html>
