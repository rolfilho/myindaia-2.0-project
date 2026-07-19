<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Dir As DirectoryInfo = New DirectoryInfo(Server.MapPath("\arquivo\upload\" & Request("usuario") & "_" & Request("cd_mbf") & "\"))
        If Dir.Exists Then
            Dim FileInfo As FileInfo() = Dir.GetFiles("*.*")       
            grdArquivos.DataSource = FileInfo
            grdArquivos.DataBind()
        End If
    End Sub
    
    Sub EnviarArquivoMBF(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Dir As DirectoryInfo = New DirectoryInfo(Server.MapPath("\arquivo\upload\" & Request("usuario") & "_" & Request("cd_mbf") & "\"))
        Dim NomeArquivo As String
        NomeArquivo = fuArquivos.FileName
        If NomeArquivo <> "" Then          
            Try
                If Not Dir.Exists Then
                    Dir.Create()
                End If
                fuArquivos.SaveAs(Dir.ToString + Replace(NomeArquivo, " ", ""))
                Response.Redirect("mbf_arquivos.aspx?cd_mbf=" + Request("cd_mbf") + "&usuario=" + Request("usuario"))
            Catch ex As Exception
                'Response.Write("ERRO")
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=lista';", True)
            End Try
        Else
        'Response.Write("EM BRANCO")
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=lista';", True)
        End If
    End Sub
</script>

<script type="text/javascript" language="javascript">
    function openAjax() {
        var ajax;
        try {
            ajax = new XMLHttpRequest(); // XMLHttpRequest para browsers decentes, como: Firefox, Safari, dentre outros.
        }
        catch (ee) {
            try {
                ajax = new ActiveXObject("Msxml2.XMLHTTP"); // Para o IE da MS
            }
            catch (e) {
                try {
                    ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Para o IE da MS
                }
                catch (E) {
                    ajax = false;
                }
            }
        }
        return ajax;
    }


    function excluirArquivoMBF(arquivo) {
        if (confirm('ATENÇÃO: Deseja realmente excluir o arquivo ' + arquivo + '?')) {
            var cd_mbf = '<%=Request("cd_mbf") %>'
            var usuario = '<%=Request("usuario") %>'
            var ajax = openAjax();
            ajax.open('POST', 'mbf_arquivos_exclui.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario + '&arquivo=' + arquivo, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == '') {
                            //alert('ATENÇÃO: Arquivo excluído com sucesso!');
                            location.href = "mbf_arquivos.aspx?cd_mbf=" + cd_mbf + "&usuario=" + usuario;
                        } else {
                            alert('ATENÇÃO: Erro ao tentar excluir arquivo!');
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }
</script>
<style type="text/css">
.gridtit {
	color: #FFFFFF;
	text-align: center;
	background: #cd1414;
	border:0;
    Font-size:10px;
}

.divInfo {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	display: none;
	z-index: 3;
	overflow: auto;
	border: solid 2px #24acd8;
	background-color: #FFFFFF;
	scrollbar-face-color: #a5d4e3;
	scrollbar-track-color: #c9eaf4;
	scrollbar-arrow-color: #24acd8;
	scrollbar-shadow-color: #b8e0ed;
	scrollbar-3dlight-color: #b8e0ed;
	scrollbar-highlight-color: #b8e0ed;
	scrollbar-darkshadow-color: #b8e0ed;
}

.divInfo2 {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	display: none;
	z-index: 3;
	overflow: auto;
	border: solid 2px #000081;
	background-color: #FFFFFF;
	scrollbar-face-color: #d6d6fc;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #000081;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
}
.divDetalhes {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	z-index: 3;
	overflow: auto;
	border-width:0px 2px 2px 2px;
	border-style:solid;
	border-color:#808080;
	background-color: #e6e9ec;
	margin: 0 auto;
}

.divDetalhes3 {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	z-index: 3;
	overflow: auto;
	border-width:2px 2px 2px 2px;
	border-style:solid;
	border-color:#374BAE;
	background-color: #f0f1f6;
	margin: 0 auto;
}

.divDetalhes2 {
	background-color:#f0f1f6;
	width:350px;
	height:90px;
	position:absolute;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:3;
	margin: 0 auto;
}

.body
{
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #cd1414;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
	overflow:hidden;	
}

.textbox{ 
Font-size:10px; 
Font-family:Verdana; 
border-color:#808080;
border-style:solid;
border-width:1px;
overflow:hidden;
text-transform:uppercase;
}

.lbl
{
	text-align:left;
	vertical-align:top;
	font-family:Verdana;
}

.btn{
Font-size:10px; 
height:16px;
width:17px;
Font-family:verdana; 
background-color:#FFFFFF;
border-color:#000000;
border-style:solid;
border-width:1px;
}

.nounderline a:link
{
text-decoration:none;
}

.divDados{
width:600px;
height:14px;
font-size:11px;
font-weight:bold;
text-align:center;
color:#7089A2;
}

 .th  {
 position : relative;
}

</style> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<form id="frmArquivosMBF" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;">
  <asp:ScriptManager ID="smArquivosMBF" runat="server"/>
  <div id="divArquivos" style="border-width:0px;position:absolute;top:0px;text-align:left;left:0px;width:450px;height:332px;">
  <div id="divArquivosMBFCabec" style="background-color:#cd1414;border-color:#cd1414;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divCriaMBFLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;">Anexos MBF</a></center></div>    
  <div id="divArquivosMBF" style="background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;text-align:left;height:100%;width:100%;">    
    <asp:FileUpload ID="fuArquivos" runat="server" CssClass="textbox" Width="350px" BackColor="#e6e9ec" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Button ID="btnArquivos" runat="server" Text="Enviar" OnClick="EnviarArquivoMBF" CssClass="btn" Width="50px"/><br /><br />
    <table style="font-size:10px;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;width: 400px;border-width:0px 0px 0px 0px;border-style:solid;border-bottom-color:#000000;" cellspacing="0" cellpadding="0">
      <tr height="12px" style="text-align:center;background-color:#808080;color:#FFFFFF;font-weight:bold;">
        <td width="400px">&nbsp;Arquivo(s)&nbsp;</td>
        <td width="16px"></td>
      </tr>
      </table>
        <asp:GridView ID="grdArquivos" runat="server" Width="400px"
                      AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                      BorderStyle="Solid" 
                        Font-Names="Verdana" Font-Size="10px" RowStyle-Height="19px"
                      AlternatingRowStyle-BackColor="#e6e9ec" 
                      CellPadding="0" HorizontalAlign="Left" 
                      style="border-right-width:0px" ShowHeader="false">
      <Columns>
        <asp:TemplateField ItemStyle-Width="380px">
          <ItemTemplate>
              <asp:HyperLink NavigateUrl='<%# Eval("Name", "/arquivo/upload/"&Trim(Request("usuario"))&"_"&Trim(Request("cd_mbf")) & "/{0}") %>'  runat="server" style="cursor:pointer;text-decoration:none;color:#000000;" target="_blank"><%# Eval("Name")%></asp:HyperLink>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
          <ItemTemplate>
            <img src="\imagens\30/lixeira16.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Excluir Arquivo" onclick="javascript:excluirArquivoMBF('<%# Eval("Name")%>');"/>
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
      </asp:GridView>
  </div>
  </div>
</form>    
</body>
</html>
