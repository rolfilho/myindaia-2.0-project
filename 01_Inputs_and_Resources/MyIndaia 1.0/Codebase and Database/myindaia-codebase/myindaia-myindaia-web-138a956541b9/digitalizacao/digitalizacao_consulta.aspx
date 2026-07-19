<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true" %> 
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<html xmlns="http://www.w3.org/1999/xhtml"><body>
    <table style="cursor:pointer;font-size:8pt;font-family:verdana;color:#000000;height:19px;BORDER-COLLAPSE:collapse;width: 100%;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;" bgcolor="#374BAE" cellspacing="0" cellpadding="4">
        <%  Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
            
            Dim codigo, nome, tabela, usuario, color, SqlW, SqlE, SqlExp, campo, cargo As String
            codigo = Request.QueryString("codigo")
            nome = Request.QueryString("nome")
            tabela = Request.QueryString("tabela")
            usuario = Request.QueryString("usuario")
            cargo = Request.QueryString("cd_cargo")
            color = "#f4d296"
            campo = Request.QueryString("campo")
            SqlE = ""
            SqlExp = ""
            If InStr("TAREA;TPAIS_BROKER;TLOCAL_EMBARQUE", tabela) Then
                SqlW = ""
            Else
                If InStr("TUSUARIO_CONTATO;TUSUARIO_INDAIA", tabela) Then
                    If tabela = "TUSUARIO_INDAIA" Then
                        SqlW = " WHERE CD_CARGO <> '040'"
                    Else
                        SqlW = " WHERE CD_CARGO = '040'"
                    End If
                    tabela = "TUSUARIO"
                    SqlW = SqlW & " AND IN_ATIVO = '1'"
                Else
                    If InStr("TSERVICO;TEMPRESA_EST_EXPORTADOR", tabela) Then
                        If tabela = "TSERVICO" Then
                            SqlW = " S WHERE S.CD_SERVICO IN ( " & _
                            "       SELECT C.CD_SERVICO FROM TCLIENTE_SERVICO C (NOLOCK) " & _
                            "        WHERE C.IN_ATIVO    = '1' " & _
                            "          AND C.CD_CLIENTE  = '" & Request("cd_cliente") & "' " & _
                            "          AND C.CD_UNID_NEG = '" & Request("cd_unid_neg") & "' " & _
                            "          AND C.CD_PRODUTO  = '06')" & _
                            "  AND S.IN_ATIVO    = '1' ORDER BY CODIGO "
                        Else
                            SqlE = " NR_CLIENTE AS CODIGO_EXP, "
                            SqlExp = " P.NM_PAIS AS NM_PAIS, END_EMPRESA, "
                            SqlE = SqlE & SqlExp
                            SqlW = " E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = '1' AND IN_ATIVO = '1'  ORDER BY CODIGO"
                            tabela = "TEMPRESA_EST"
                        End If
                    Else
                        If InStr("TMERCADORIA", tabela) Then
                            SqlW = " WHERE ( ( CD_IMPORTADOR = '" & Request("cd_importador") & "' AND '" & Request("cd_importador") & "' <> '' ) " & _
                            " OR ( CD_GRUPO = '" & Request("cd_grupo") & "' AND '" & Request("cd_grupo") & "' <> '' ) )  AND IN_ATIVO = '1' ORDER BY CODIGO"
                        Else
                            If InStr("TEMPRESA_NAC", tabela) Then
                                If InStr("040;055;088;", cargo) > 0 Then
                                    SqlE = " SUBSTRING(CGC_EMPRESA,1,2)+'.'+SUBSTRING(CGC_EMPRESA,3,3)+'.'+SUBSTRING(CGC_EMPRESA,6,3)+'/'+SUBSTRING(CGC_EMPRESA,9,4)+'-'+SUBSTRING(CGC_EMPRESA,13,2) AS CODIGO_EXP, "
                                    SqlW = " E (NOLOCK), TPERMISSAO P (NOLOCK) WHERE P.CD_CLIENTE = E.CD_EMPRESA AND P.CD_USUARIO = '" + usuario + "' AND E.IN_EXPORTADOR='1' AND E.IN_ATIVO = '1'   ORDER BY DESCRICAO"
                                Else
                                    SqlE = " SUBSTRING(CGC_EMPRESA,1,2)+'.'+SUBSTRING(CGC_EMPRESA,3,3)+'.'+SUBSTRING(CGC_EMPRESA,6,3)+'/'+SUBSTRING(CGC_EMPRESA,9,4)+'-'+SUBSTRING(CGC_EMPRESA,13,2) AS CODIGO_EXP, "
                                    SqlW = " WHERE IN_ATIVO = '1'  ORDER BY DESCRICAO"
                                End If
                            Else
                                If InStr("TEMPRESA_EST", tabela) Then
                                    SqlW = " ORDER BY CODIGO"
                                Else
                                    If InStr("TEMAIL_FAVORITOS", tabela) Then
                                        SqlW = " WHERE CD_USUARIO = '" & usuario & "' ORDER BY NM_EMAIL_FAVORITO"
                                    Else
                                        SqlW = " WHERE IN_ATIVO = '1'  ORDER BY CODIGO"
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
            
            Dim SqlAux As String
            If InStr("TEMAIL_FAVORITOS", tabela) Then
                SqlAux = "SELECT " & codigo & " AS CODIGO, " & SqlE & " LEFT(" & nome & ",45) AS DESCRICAO FROM " & tabela & SqlW & " "
            Else
                SqlAux = "SELECT " & codigo & " AS CODIGO, " & SqlE & " UPPER(" & nome & ") AS DESCRICAO FROM " & tabela & SqlW & " "
            End If
            
            'Response.Write(SqlAux)
            'Response.end
            
            
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader

            If Not RsAux.HasRows Then
                Response.Write("<tr bgcolor=" & color & " height='50px' style='font-family:Verdana;font-size:9pt;'><td><center>Não foram encontrados registros para esta pesquisa</center></td></tr>")
            Else
                Do While RsAux.Read()
                    If color = "#feedce" Then
                        color = "#f4d296"
                    Else
                        color = "#feedce"
                    End If
                    If InStr("TEMAIL_FAVORITOS", tabela) Then
                      %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=Trim(RsAux("CODIGO").ToString)%>','<%=tabela %>','<%=campo %>');"><td title="<%=Trim(RsAux("CODIGO").ToString)%>"><nobr><%=Trim(RsAux("DESCRICAO").ToString)%></nobr></td></tr>
                <%    
                    Else
                %>
                <tr bgcolor="<%=color%>" onclick="enviaValor('<%=Trim(RsAux("CODIGO").ToString)%>','<%=tabela %>','<%=campo %>');"><td><nobr><%=Trim(RsAux("CODIGO").ToString)%></nobr></td><td><nobr><%=Trim(RsAux("DESCRICAO").ToString)%></nobr></td><%If SqlE <> "" Then%><td><nobr><%=Trim(RsAux("CODIGO_EXP").ToString)%></nobr></td><%End If%><%If SqlExp <> "" Then%><td><nobr><%=Trim(RsAux("NM_PAIS").ToString)%></nobr></td><td><nobr><%=Trim(RsAux("END_EMPRESA").ToString)%></nobr></td><%End If%></tr>
                <%  
                End If
                Loop
            End If
            RsAux.Close()
            CmdAux.Dispose()
            CnnAux.Close()
            %>  
    </table>
</body>
</html>
