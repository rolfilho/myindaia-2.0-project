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
    Dim nr_processo, nr_item_cliente, nr_parcial, cd_usuario, cd_evento, vDtRealizacao, vNmEvento, tp_atualiza As String
    Dim SqlAux As String
    
    nr_processo = Request.QueryString("nr_processo")
    nr_item_cliente = Request.QueryString("nr_item_cliente")
    nr_parcial = Request.QueryString("nr_parcial")
    cd_usuario = Request.QueryString("cd_usuario")
    cd_evento = Request.QueryString("cd_evento")
    tp_atualiza = Request.QueryString("tp_atualiza")
    
    If nr_parcial = "S" then nr_parcial = "0"
    
    If tp_atualiza = 1 Then
        SqlAux = " SELECT E.NM_EVENTO, ISNULL(CONVERT(VARCHAR,DT_REALIZACAO,103),'') AS DT_REALIZACAO " & _
        " FROM TFLP_PO PO (NOLOCK) " & _
        " INNER JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = PO.CD_EVENTO) " & _
        " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " & _
        " WHERE P.NR_PROCESSO = '" & nr_processo & "' AND PO.CD_EVENTO = '" & cd_evento & "'"
    Else
        SqlAux = " SELECT E.NM_EVENTO, ISNULL(CONVERT(VARCHAR,DT_REALIZACAO,103),'') AS DT_REALIZACAO " & _
        " FROM TFLP_PO_ITEM POI (NOLOCK) " & _
        " INNER JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = POI.CD_EVENTO) " & _
        " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA) " & _
        " WHERE P.NR_PROCESSO = '" & nr_processo & "' AND POI.CD_EVENTO = '" & cd_evento & "' AND POI.NR_PARCIAL = '" & nr_parcial & "'"
    End If
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    vDtRealizacao = RsAux("DT_REALIZACAO")
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
   <input id="txtDtEvento" onkeypress="if(event.keyCode == 13){preencheData('cd_usuario=<%=Trim(cd_usuario)%>&tp_atualiza=<%=tp_atualiza%>&nr_processo=<%=Trim(nr_processo) %>&nr_item_cliente=<%=Trim(nr_item_cliente)%>&nr_parcial=<%=Trim(nr_parcial)%>&cd_evento=<%=cd_evento %>&dt_realizacao='+document.getElementById('txtDtEvento').value+'', <%=tp_atualiza%>);}"  type="text" class="textbox" value='<%=vDtRealizacao%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" onblur="validarData(this,this.value);"/>&nbsp;&nbsp;
   <input id="btnOK" onclick="preencheData('cd_usuario=<%=Trim(cd_usuario)%>&tp_atualiza=<%=tp_atualiza%>&nr_processo=<%=Trim(nr_processo) %>&nr_item_cliente=<%=Trim(nr_item_cliente)%>&nr_parcial=<%=Trim(nr_parcial)%>&cd_evento=<%=cd_evento %>&dt_realizacao='+document.getElementById('txtDtEvento').value+'', <%=tp_atualiza%>);" class="textbox" type="button" value="OK" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;width:50px;height:20px"/>
   <input id="txtDtEventoInicial" type="hidden" value='<%=vDtRealizacao%>' />
</div>
</center>
</body>
</html>
