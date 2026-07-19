<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>
    
        <input id="txtNmMbf" type="text" class="textbox" style="width:270px"/><br />
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            Dim color, cargo_interno, cd_grupo As String
            Dim SqlAux As String
            color = "#FFFFFF"
                    
            SqlAux = " SELECT CD_GRUPO AS CODIGO, NM_GRUPO AS DESCRICAO FROM TGRUPO (NOLOCK) WHERE IN_ATIVO = '1' ORDER BY NM_GRUPO"
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            
            If Not RsAux.HasRows Then
                Response.Write("ERRO")
            Else %>
                <select id="ddlGrupo" name="ddlGrupo" class="textbox" style="width:270px;border-style:0px;" >
                <% Do While RsAux.Read() %>  
                <option value="<%= RsAux("CODIGO") %>"><%= RsAux("DESCRICAO") %></option>
            <% Loop%>
            </select>
            <% End If
            RsAux.Close()
            CmdAux.Dispose()
                CnnAux.Close()
                SqlAux = "SELECT '' AS CODIGO, '' AS DESCRICAO UNION SELECT CD_EMPRESA AS CODIGO, NM_EMPRESA AS DESCRICAO FROM TEMPRESA_NAC (NOLOCK) WHERE IN_ATIVO = '1' ORDER BY DESCRICAO"
                CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
            
                If Not RsAux.HasRows Then
                    Response.Write("ERRO")
            Else %>
                <select id="ddlCliente" name="ddlCliente" class="textbox" style="width:270px;border-style:0px;" >
                <% Do While RsAux.Read() %>  
                <option value="<%= RsAux("CODIGO") %>"><%= RsAux("DESCRICAO") %></option>
            <% Loop%>
            </select>
            <% End If
                    RsAux.Close()
                    CmdAux.Dispose()
                CnnAux.Close()
                SqlAux = " SELECT '' AS CODIGO, '' AS DESCRICAO UNION SELECT CD_AREA AS CODIGO, NM_AREA AS DESCRICAO FROM TAREA (NOLOCK) ORDER BY DESCRICAO"
                CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
            
                If Not RsAux.HasRows Then
                    Response.Write("ERRO")
            Else %>
                <select id="ddlArea" name="ddlArea" class="textbox" style="width:170px;border-style:0px;" >
                <% Do While RsAux.Read() %>  
                <option value="<%= RsAux("CODIGO") %>"><%= RsAux("DESCRICAO") %></option>
            <% Loop%>
            </select>
            <% End If
                    RsAux.Close()
                    CmdAux.Dispose()
                    CnnAux.Close()
             %>            
            <input id="btnOK" type="button" value="OK" style="width:96px;cursor:pointer;" class="btn" onclick="copiaMBF(document.getElementById('txtNmMbf'), document.getElementById('ddlGrupo'),'<%= Request.QueryString("cd_mbf")%>','0', document.getElementById('ddlCliente'), document.getElementById('ddlArea'));"/>
