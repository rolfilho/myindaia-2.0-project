<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
    Dim Dir As DirectoryInfo = New DirectoryInfo(Server.MapPath("\arquivo\upload\" & Request("usuario") & "_" & Request("cd_mbf") & "\"))
    Dim FileInfo As FileInfo = New FileInfo(Dir.FullName & Request("arquivo"))
    
    If FileInfo.Exists Then
        FileInfo.Delete()
    End If
    
    End Sub
    
    
</script>
