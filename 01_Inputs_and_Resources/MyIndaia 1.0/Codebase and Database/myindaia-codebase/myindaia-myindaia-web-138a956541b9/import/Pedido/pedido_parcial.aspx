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
<center>
<%
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim nr_processo, cd_empresa, nr_item_cliente, qtde, color, cd_usuario As String
    Dim SqlAux As String
    
    nr_processo = Request.QueryString("nr_processo")
    cd_empresa = Request.QueryString("cd_empresa")
    cd_usuario = Request.QueryString("cd_usuario")
    nr_item_cliente = Request.QueryString("nr_item_cliente")
    
    SqlAux = "SELECT ISNULL(QT_INICIAL,0) AS QT_INICIAL FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo") & "' AND CD_EMPRESA ='" & Request.QueryString("cd_empresa") & "' AND NR_ITEM_CLIENTE ='" & Request.QueryString("nr_item_cliente") & "' AND NR_PARCIAL = 0"
    Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
    CnnAux.Open()
    Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
    Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
    RsAux.Read()
    qtde = CDbl(RsAux("QT_INICIAL"))
    color = "#DEE6EF"
    RsAux.Close()
    CnnAux.Close()
    %>
    <br />
    <div style="float:left;width:680px;color:#000000;font-size:9pt;font-family:verdana;">
    Pedido/Item&nbsp;<input id="txtPedido" type="text" class="textbox" value='<%= Trim(nr_processo) & "/" & Trim(nr_item_cliente)%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:180px" />
    <img src="\imagens\icones\16x16\prev_parcial.gif" width="16px" height="16px"  alt="Item Anterior" style="cursor:pointer;vertical-align:absmiddle;" onclick="carregaItemParcial('<%=nr_processo %>','<%=nr_item_cliente %>','<%=cd_empresa %>','<%=qtde %>', 2);"/> 
    <img src="\imagens\icones\16x16\next_parcial.gif" width="16px" height="16px"  alt="Próximo Item"  style="cursor:pointer;vertical-align:absmiddle;" onclick="carregaItemParcial('<%=nr_processo %>','<%=nr_item_cliente %>','<%=cd_empresa %>','<%=qtde %>', 3);"/>
    &nbsp;&nbsp;
    Qtde. Disponível&nbsp;<input id="txtQtde" type="text" class="textbox" value='<%= qtde%>' style="background-color:#DEE6EF;font-size:10pt;height:20px;width:100px" />&nbsp;&nbsp;&nbsp;&nbsp;
    <%If qtde = 0 Then%>
    <input id="btnBaixaParcial" disabled="true" onclick="javascript:BaixaParcial('cd_usuario=<%=cd_usuario %>&nr_processo=<%=nr_processo %>&cd_empresa=<%=cd_empresa %>&nr_item_cliente=<%=nr_item_cliente %>&qtde=<%=qtde %>&tp_baixar=0');" class="textbox" type="button" value="Baixa Parcial" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;width:90px;height:20px"/>
    <%Else%>
    <input id="btnBaixaParcial" onclick="javascript:BaixaParcial('cd_usuario=<%=cd_usuario %>&nr_processo=<%=nr_processo %>&cd_empresa=<%=cd_empresa %>&nr_item_cliente=<%=nr_item_cliente %>&qtde=<%=qtde %>&tp_baixar=0');" class="textbox" type="button" value="Baixa Parcial" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;width:90px;height:20px"/>
    <%End If%>
    </div>
    <br /><br />
    <div style="height: 25px;width:680px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:16px;">&nbsp;</td>
            <td style="width:16px;">&nbsp;</td>
            <td style="width:16px;">&nbsp;</td>
            <td style="width:85px">Dt. Invoice</td>
            <td style="width:100px">ID</td>
            <td style="width:100px">Processo</td>
            <td style="width:80px">Invoice</td>
            <td style="width:120px">Qtde. Embarcada</td>
            <td style="width:100px">Total</td>
            </tr></table>
        </div>
        <div style="height:155px;width:680px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <table style="text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%                       
            SqlAux = "SELECT A.NR_PARCIAL, CONVERT(VARCHAR,A.DT_FATURA,103) AS DT_FATURA, A.ID_CODIGO_INSTR_DESEMB, UPPER(A.NR_FATURA) AS NR_FATURA, A.QT_INICIAL AS QT_INICIAL, A.VL_TOTAL AS VL_TOTAL, B.DT_ULT_ALTERACAO, SUBSTRING(B.NR_PROCESSO_DES,5,15) AS NR_PROCESSO_DES " & _
            " FROM TPO_ITEM A ( NOLOCK ) " & _
            " LEFT JOIN TESTAGIO_PROCESSO B( NOLOCK ) ON B.NR_REFERENCIA   = A.NR_PROCESSO AND " & _
            "							               B.NR_ITEM_CLIENTE = A.NR_ITEM_CLIENTE AND " & _
            "                                          B.CD_EMPRESA = A.CD_EMPRESA AND " & _
            "								           B.NR_PARCIAL      = A.NR_PARCIAL AND " & _
            "							               B.IN_SUBSTITUIDO = '0' " & _
            " WHERE " & _
            "  A.NR_PROCESSO = '" & nr_processo & "' " & _
            " AND A.CD_EMPRESA = '" & cd_empresa & "' " & _
            " AND A.NR_ITEM_CLIENTE = '" & nr_item_cliente & "' " & _
            " AND A.NR_PARCIAL <> 0"
           
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            If RsAux.HasRows Then
                Do While RsAux.Read()
                    If color = "#DEE6EF" Then
                        color = "#FFFFFF"
                    Else
                        color = "#DEE6EF"
                    End If
            %>
                <tr bgcolor="<%=color%>" style="height:25px;text-align:center;">
                <td style="width:16px"><img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluiParcial('nr_processo=<%=nr_processo %>&cd_empresa=<%=cd_empresa %>&nr_item_cliente=<%=nr_item_cliente %>&qtde_baixada=<%=RsAux("QT_INICIAL").ToString %>&nr_parcial=<%=RsAux("NR_PARCIAL").ToString %>');" alt="Excluir Parcial"/></td>
                <td style="width:16px"><img src="../../imagens/edit1.gif" onclick="javascript:BaixaParcial('nr_processo=<%=nr_processo %>&cd_empresa=<%=cd_empresa %>&nr_item_cliente=<%=nr_item_cliente %>&qtde=<%=qtde %>&nr_parcial=<%=RsAux("NR_PARCIAL").ToString %>&tp_baixar=1');" alt="Editar Parcial"/></td>
                <td style="width:16px"><%=RsAux("NR_PARCIAL").ToString%></td>
                <td style="width:85px"><%=RsAux("DT_FATURA").ToString%></td>
                <td style="width:90px"><%=RsAux("ID_CODIGO_INSTR_DESEMB").ToString%></td>
                <td style="width:100px"><%=RsAux("NR_PROCESSO_DES").ToString%></td>
                <td style="width:80px"><%=RsAux("NR_FATURA").ToString%></td>
                <td style="width:120px"><%=RsAux("QT_INICIAL").ToString%></td>
                <td style="width:100px"><%=RsAux("VL_TOTAL").ToString%></td>
                </tr>
            <%
            Loop
        Else
            %>
            <tr style="background-color:#FFFFFF;height:150px;text-align:center;font-size:9pt;font-family:verdana;"><td>Não foram encontrados parciais para este Pedido/Item</td></tr>
        <%
            End If
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
            %>  
    </table>
    </div>
    </center>
</body>
</html>
