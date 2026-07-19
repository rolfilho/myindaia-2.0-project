<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true"%>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%      Response.CacheControl = "no-cache"%>
<%      Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Dim SqlAux, in_pedido As String
    
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    
    Protected Sub chtGrafico_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        'chtGrafico.ChartAreas.Item(0).AxisX.MajorGrid.Enabled = False
        'chtGrafico.ChartAreas.Item(0).AxisX.MajorTickMark.Enabled = False
        'chtGrafico.ChartAreas.Item(0).AxisX.MinorGrid.Enabled = False
        'chtGrafico.ChartAreas.Item(0).AxisX.MinorTickMark.Enabled = False
        'chtGrafico.Titles.Item(0).Text = "Liberação do Processo x Saída do Navio"
    End Sub
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>MyIndaiá Web System - Version 2.01.00</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script> 
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%">
   <form id="frmGrafico" runat="server">      
   <asp:SqlDataSource ID="SqlGrafico" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT (LEFT(M.NM_MES,3) + '/' + RIGHT(YEAR(GETDATE()), 2)) AS NM_MES, CONVERT(DECIMAL(28,2),SUM(ISNULL(M16.M16_VL_TOTAL,0))/1000) TOTAL
FROM MYINDAIA.DBO.VW_MES M (NOLOCK) 
LEFT JOIN MYINDAIA.DBO.M16_ESTAT_USER M16 (NOLOCK) ON M16.M16_NR_MES = M.NR_MES AND M16.M16_NR_ANO = 2012
GROUP BY M.NR_MES, M.NM_MES
ORDER BY M.NR_MES" ProviderName="System.Data.SqlClient">
    </asp:SqlDataSource>     
     <asp:Chart ID="chtGrafico" runat="server" DataSourceID="SqlGrafico" 
       Height="300px" Width="400px" ondatabinding="chtGrafico_DataBinding">
         <Series>        
           <asp:Series Name="Series1" XValueMember="NM_MES" YValueMembers="TOTAL" IsValueShownAsLabel="true" LabelFormat="0.0" Font="Microsoft Sans Serif, 7pt" Palette="BrightPastel"/>
         </Series>
         <ChartAreas>
             <asp:ChartArea Name="ChartArea1"> 
                <AxisX Interval="1" Title="" IsLabelAutoFit="False">
                    <MajorGrid Enabled="False" />
                    <MinorGrid Enabled="True" Interval="100" />
                    <MajorTickMark Interval="10" />
                    <MinorTickMark Enabled="True" Interval="1" />
                    <LabelStyle Angle="-45" Font="Microsoft Sans Serif, 8pt, style=Bold" />
                 </AxisX>
                <AxisY Interval="2" Title="" Minimum="0" IsMarksNextToAxis="False" LineColor="Transparent" LineDashStyle="NotSet" LineWidth="0" IsLabelAutoFit="False" />
             </asp:ChartArea>
         </ChartAreas>
         <Titles>
             <asp:Title Name="Title1"></asp:Title>
         </Titles>
     </asp:Chart>     
    </form>
</body>
</html>
