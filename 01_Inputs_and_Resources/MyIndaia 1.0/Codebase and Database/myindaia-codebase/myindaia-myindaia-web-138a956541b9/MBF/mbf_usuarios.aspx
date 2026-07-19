<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>
    <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
        Dim color, bgcolor As String
        Dim SqlAux As String
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        color = "#FFFFFF"
        %>       
        <table style="cursor:pointer;font-size:10px;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;width:90%;border-width:0px 0px 0px 0px;border-style:solid;border-bottom-color:#000000;" cellspacing="0" cellpadding="0">          
        <tr height="12px" style="text-align:left;background-color:#808080;color:#FFFFFF;font-weight:bold;vertical-align:top;">
            <td width="280px">&nbsp;Compartilhar apresentação com:&nbsp;</td> 
            <td width="20px">&nbsp;</td>                 
        </tr>
        <tr bgcolor="#FFFFFF" height="25px" style="text-align:left;"><td colspan="2">
        <select class="textbox" style="width:240px;border-style:0px;" id="ddlUsuario">        
        <%
            SqlAux = " SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO AS DESCRICAO" & _
            " FROM TUSUARIO U (NOLOCK) " & _
            " INNER JOIN TPERMISSAO_GRUPO P (NOLOCK) ON P.CD_USUARIO = U.CD_USUARIO" & _
            " INNER JOIN TMBF_INFO I (NOLOCK) ON I.CD_GRUPO = P.CD_GRUPO" & _
            " WHERE I.CD_MBF = " & Request("cd_mbf") & "" & _
            "   AND I.CD_USUARIO = '" & Request("usuario") & "'" & _
            "   AND U.IN_ATIVO = '1'" & _
            " UNION " & _
            " SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO AS DESCRICAO" & _
            " FROM TUSUARIO U (NOLOCK) " & _
            " INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO " & _
            " INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_USUARIO = U.CD_USUARIO    " & _
            " INNER JOIN TMBF_INFO I (NOLOCK) ON I.CD_PRODUTO = H.CD_PRODUTO              " & _
            " WHERE I.CD_MBF = " & Request("cd_mbf") & " " & _
            "   AND I.CD_USUARIO = '" & Request("usuario") & "'" & _
            "   AND U.IN_ATIVO = '1' " & _
            "   AND H.IN_ATIVO = '1'" & _
            "   AND (H.IN_DEFAULT = '1' OR C.CD_CARGO IN ('051', '103','114','115','124','136','140'))" & _
            "   AND C.IN_INTERNO = '1'" & _
            " ORDER BY U.NM_USUARIO "
            CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            Do While RsAux.Read()
       %>
       <option value="<%= RsAux("CODIGO") %>"><%= RsAux("DESCRICAO") %></option>
		<%	
		Loop
		%>
         </select><input name="btn_enviar" type="button" class="btn" value="OK" style="width:40px;vertical-align:top;" onclick="copiaMBF('', document.getElementById('ddlUsuario'),'<%= Request.QueryString("cd_mbf")%>', '1','');"/></center>
         </td></tr>
        <%    
            SqlAux = " SELECT I.CD_USUARIO, I.CD_MBF, U.NM_USUARIO " & _
                 " FROM TMBF_INFO I (NOLOCK) " & _
                 "  INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = I.CD_USUARIO " & _
                 " WHERE I.CD_USUARIO_CRIADOR = '" & Request("usuario") & "' " & _
                 " AND I.CD_MBF_CRIADOR = '" & Request("cd_mbf") & "' "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
            
            If RsAux.HasRows Then%>        
            <tr height="12px" style="text-align:left;background-color:#808080;color:#FFFFFF;font-weight:bold;">
            <td width="300px" colspan="2">&nbsp;Usuários que já tem:&nbsp;</td>           
            </tr>
            <%  Do While RsAux.Read()
                    If bgcolor = "#FFFFFF" Then bgcolor = "#E6E9EC" Else bgcolor = "#FFFFFF"
                    %>  
                <tr bgcolor="<%= bgcolor %>" height="12px" style="text-align:left;">
                <td width="300px"><nobr>&nbsp;<%= Trim(RsAux("NM_USUARIO"))%></nobr></td>
                <td width="20px"><nobr><img src='\imagens\30\lixeira16.gif' width="16px" height="16px" alt="Excluir" onclick="excluirUsuario('<%=RsAux("CD_USUARIO")%>','<%=RsAux("CD_MBF")%>');"/></nobr></td>            
                </tr>
        <% Loop%>
        </table>
        <% End If
        RsAux.Close()
        CmdAux.Dispose()
            CnnAux.Close()%>              
