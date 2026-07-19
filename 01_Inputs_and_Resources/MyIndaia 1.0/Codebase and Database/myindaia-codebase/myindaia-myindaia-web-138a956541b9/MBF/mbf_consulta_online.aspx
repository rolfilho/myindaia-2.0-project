<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Dim codigo, nome, tabela, usuario As String
        'codigo = Request.QueryString("codigo")
        'nome = Request.QueryString("nome")
        'tabela = Request.QueryString("tabela")
        'usuario = Request.QueryString("usuario")
        
        'SqlConsulta.SelectCommand = "SELECT " + codigo + " AS 'Código'," + nome + " AS 'Descrição' FROM " + tabela & _
        '" WHERE IN_ATIVO = 1"
    End Sub
    
    
</script>

<script type="text/javascript" language="javascript">
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <table style="cursor:pointer;font-size:8pt;font-family:verdana;color:#000000;height:19px;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            
            Dim codigo, nome, tabela, usuario, color, SqlW, SqlE, SqlAux, cargo, codigo_aux As String
            codigo = Request.QueryString("codigo")
            nome = Request.QueryString("nome")
            tabela = Request.QueryString("tabela")
            usuario = Request.QueryString("usuario")
            codigo_aux = Request.QueryString("codigo_aux")           
            
            color = "#f0f1f6"
            
            SqlE = ""
            SqlW = ""
            
            SqlAux = "SELECT CD_CARGO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '" & usuario & "' "
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
            cargo = RsAux("CD_CARGO")
            RsAux.Close()
            CnnAux.Close()
     
            If InStr("TEMPRESA_NAC", tabela) Then
                SqlE = " SUBSTRING(CGC_EMPRESA,1,2)+'.'+SUBSTRING(CGC_EMPRESA,3,3)+'.'+SUBSTRING(CGC_EMPRESA,6,3)+'/'+SUBSTRING(CGC_EMPRESA,9,4)+'-'+SUBSTRING(CGC_EMPRESA,13,2) AS CODIGO_EXP, "                              
                If InStr("040;055;060;088;131", cargo) > 0 Then
                    SqlW = " E (NOLOCK) INNER JOIN TPERMISSAO_GRUPO G (NOLOCK) ON (G.CD_GRUPO = E.CD_GRUPO AND G.IN_ATIVO = '1' AND G.CD_USUARIO = '" & usuario & "')  "
                    SqlW = SqlW & " WHERE E.IN_ATIVO = '1' AND E.CD_GRUPO = '" & codigo_aux & "' ORDER BY DESCRICAO"
                Else
                    SqlW = SqlW & " WHERE IN_ATIVO = '1' AND CD_GRUPO = '" & codigo_aux & "' ORDER BY DESCRICAO"
                End If                
            Else
                If InStr("TVIA_TRANSPORTE", tabela) Then
                    SqlW = " WHERE CD_VIA_TRANSPORTE IN ('01','04','06','07') ORDER BY CODIGO"
                Else
                    If InStr("TUSUARIO", tabela) Then
                        If InStr("040;055;060;088;131", cargo) > 0 Then
                            codigo = "U." & Trim(codigo)
                            SqlW = "  U (NOLOCK) INNER JOIN TPERMISSAO_GRUPO G (NOLOCK)  ON G.CD_USUARIO = U.CD_USUARIO AND G.IN_ATIVO = '1'" & _
                            " WHERE U.IN_ATIVO = '1' " & _
                            " AND G.CD_GRUPO IN (SELECT CD_GRUPO FROM TPERMISSAO_GRUPO (NOLOCK) WHERE CD_USUARIO = '" & usuario & "' AND IN_ATIVO = '1')" & _
                            " ORDER BY U.NM_USUARIO "
                        Else
                            SqlW = " WHERE IN_ATIVO = '1' ORDER BY CODIGO"
                        End If
                    Else
                        If InStr("TEVENTO", tabela) Then
                            SqlW = " WHERE IN_ATIVO = '1' ORDER BY DESCRICAO"
                        Else
                            If InStr("TAREA", tabela) Then
                                SqlW = ""
                            Else
                                If InStr("TUSUARIO2", tabela) Then
                                    SqlW = "  WHERE IN_ATIVO = '1' AND CD_CARGO NOT IN ('040','055','060','088','131') ORDER BY DESCRICAO"
                                    tabela = "TUSUARIO"
                                Else
                                    SqlW = " WHERE IN_ATIVO = '1' ORDER BY CODIGO"
                                End If
                            End If
                        End If
                    End If
                End If
            End If
            
            SqlAux = "SELECT " & codigo & " AS CODIGO, " & SqlE & " UPPER(LEFT(" & nome & ", 45)) AS DESCRICAO FROM " & tabela & SqlW & " "
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
               
            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='50px' style='font-family:Verdana;font-size:9pt;'><td><center>Não foram encontrados registros para esta pesquisa</center></td></tr>")
            Else
                Do While RsAux.Read()
                    If color = "#E6E9EC" Then
                        color = "#FFFFFF"
                    Else
                        color = "#E6E9EC"
                    End If
                %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=Trim(RsAux("CODIGO").ToString)%>','<%=tabela %>');"><td><nobr><%=Trim(RsAux("CODIGO").ToString)%></nobr></td><%If SqlE <> "" Then%><td><nobr><%=Trim(RsAux("CODIGO_EXP").ToString)%></nobr></td><%End If%><td><nobr><%=Trim(RsAux("DESCRICAO").ToString)%></nobr></td></tr>
                <%  
                Loop
            End If
            RsAux.Close()
            CmdAux.Dispose()
            CnnAux.Close()
            %>  
    </table>
</body>
</html>
