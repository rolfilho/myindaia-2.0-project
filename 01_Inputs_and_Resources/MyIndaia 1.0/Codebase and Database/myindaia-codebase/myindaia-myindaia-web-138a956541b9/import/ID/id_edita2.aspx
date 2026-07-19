<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true"%>

<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Dim SqlAux, in_pedido As String
    
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim SqlAuxID, SqlAuxEditID, cargo As String
        Dim SqlID As SqlDataSource = frmEditaID.FindControl("SqlID")
        
        If Request("usuario") = "" and Session("usuario") = "" Then
            Response.Redirect("..\..\autentica.asp?tx_erro=")
        End If
          
        If Session("usuario") = "" Then
            Session("usuario") = Request("usuario")
        End If
                
        SqlAux = "SELECT CD_CARGO FROM TUSUARIO WHERE CD_USUARIO = '" & Session("usuario") & "' "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        cargo = RsAux("CD_CARGO")
        Session("cargo") = cargo
        RsAux.Close()
        CnnAux.Close()
                
        SqlAuxID = "SELECT ID.ID_CODIGO, CONVERT(VARCHAR,ID.DT_CRIACAO,103) AS DT_CRIACAO, U1.NM_USUARIO AS NM_USUARIO, CONVERT(VARCHAR,ID.DT_AUTORIZACAO,103) AS DT_AUTORIZACAO, U2.NM_USUARIO AS NM_USUARIO_AUTORIZACAO, EN.AP_EMPRESA, " & _
        "SUBSTRING(ID.NR_PROCESSO,5,15) AS NR_PROCESSO, ID.NR_PROCESSO AS NR_PROCESSO2, E.NM_EMBARCACAO, ID.NR_CONHECIMENTO, ID.ID_CLIENTE " & _
        "FROM TINSTRUCAO_DESEMBARACO ID  (NOLOCK) LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = ID.CD_CLIENTE " & _
        "  LEFT JOIN TUSUARIO U1 (NOLOCK) ON U1.CD_USUARIO = ID.CD_USUARIO " & _
        "  LEFT JOIN TUSUARIO U2 (NOLOCK) ON U2.CD_USUARIO = ID.CD_USUARIO_AUTORIZACAO " & _
        "  LEFT JOIN TUSUARIO U3 (NOLOCK) ON U3.CD_USUARIO = ID.CD_RESPONSAVEL " & _
        "  LEFT JOIN TEMBARCACAO E (NOLOCK) ON E.CD_EMBARCACAO = ID.CD_EMBARCACAO " & _
        "  WHERE DT_CRIACAO > GETDATE()-30 AND DT_AUTORIZACAO IS NULL "
        If InStr("040;055;060;088;131", cargo) > 0 Then
            SqlAuxID = SqlAuxID & " AND ID.CD_CLIENTE IN (SELECT CD_EMPRESA " & _
            " FROM TEMPRESA_NAC E " & _
            " INNER JOIN TPERMISSAO_GRUPO G ON G.CD_GRUPO = E.CD_GRUPO AND G.IN_ATIVO = '1' " & _
            " WHERE E.IN_ATIVO = '1' " & _
            " AND G.CD_USUARIO = '" & Session("usuario") & "') "
        End If
        SqlAuxID = SqlAuxID & " ORDER BY CONVERT(DATETIME,ID.DT_CRIACAO,103) DESC, SUBSTRING(ID_CODIGO,3,8) DESC "
        sqlID.SelectCommand = SqlAuxID

        If Request("acao") <> "lista" Then
            SqlAuxEditID = "SELECT ID_CODIGO, U2.CD_USUARIO AS CD_USUARIO_CRIACAO, U2.NM_USUARIO AS NM_USUARIO_CRIACAO, CONVERT(VARCHAR,DT_CRIACAO,103) AS DT_CRIACAO, ISNULL(IN_AUTORIZADO, 0) AS IN_AUTORIZADO, CD_CLIENTE, NR_PROCESSO, " & _
           " CONVERT(VARCHAR,DT_AUTORIZACAO,103) AS DT_AUTORIZACAO, CD_USUARIO_AUTORIZACAO, U.NM_USUARIO AS NM_USUARIO_AUTORIZACAO, CD_RESPONSAVEL, CD_EMBARCACAO, NR_CONHECIMENTO, ID.CD_EMPRESA, TX_OBSERVACOES, ISNULL(CD_MODAL,'') AS CD_MODAL " & _
           " FROM TINSTRUCAO_DESEMBARACO ID (NOLOCK) " & _
           " LEFT JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = ID.CD_USUARIO_AUTORIZACAO " & _
           " LEFT JOIN TUSUARIO U2 (NOLOCK) ON U2.CD_USUARIO = ID.CD_USUARIO " & _
           " WHERE ID_CODIGO = '" & Request("id_codigo") & "'"
        
            If InStr("040;055;060;088;131", cargo) > 0 Then
                SqlAuxEditID = SqlAuxEditID & " AND ID.CD_CLIENTE IN (SELECT CD_EMPRESA " & _
                " FROM TEMPRESA_NAC E " & _
                " INNER JOIN TPERMISSAO_GRUPO G ON G.CD_GRUPO = E.CD_GRUPO AND G.IN_ATIVO = '1' " & _
                " WHERE E.IN_ATIVO = '1' " & _
                " AND G.CD_USUARIO = '" & Session("usuario") & "') "
            End If
            SqlEditID.SelectCommand = SqlAuxEditID
            
            SqlAux = " SELECT COUNT(NR_REFERENCIA) AS CONTADOR FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            Dim cbAutorizado As CheckBox = frmEditaID.FindControl("cbAutorizado")
            Dim frmEditaPedidoID As FormView = frmEditaID.FindControl("frmEditaPedidoID")
            Dim frmEditaItemID As FormView = frmEditaID.FindControl("frmEditaItemID")
            'Dim ibNovaIDPedidoLista As ImageButton = frmEditaPedidoID.FindControl("ibNovaIDPedidoLista")
            'Dim ibNovaIDItemLista As ImageButton = frmEditaItemID.FindControl("ibNovaIDItemLista")
            Dim contador As Integer
            RsAux.Read()
            contador = RsAux("CONTADOR")
            
            If contador = 0 Then
                cbAutorizado.Enabled = False
            End If
            RsAux.Close()
            CnnAux.Close()
                        
            SqlAux = " SELECT ISNULL(IN_AUTORIZADO,'0') AS IN_AUTORIZADO FROM TINSTRUCAO_DESEMBARACO (NOLOCK) WHERE ID_CODIGO = '" & Request.QueryString("id_codigo") & "'"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            
            Session("in_autorizado") = "0"
            If RsAux.HasRows Then
                RsAux.Read()
                If RsAux("IN_AUTORIZADO") = "1" Then
                    Session("in_autorizado") = "1"
                End If
            End If
            
            RsAux.Close()
            CnnAux.Close()
               
            If Session("nm_usuario") = "" Then
                SqlAux = " SELECT NM_USUARIO AS USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '" & Session("usuario") & "'"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                
                If Not RsAux.HasRows Then
                    Response.Redirect("..\..\autentica.asp?tx_erro=")
                Else
                    RsAux.Read()
                    Session("nm_usuario") = RsAux("USUARIO")
                End If
                RsAux.Close()
                CmdAux.Dispose()
                CnnAux.Close()
            End If
        Else
            Session("nm_item") = ""
            Session("nr_fatura") = ""
            Session("vl_item") = ""
        End If
        
        If Request.QueryString("erro") = "1" Then
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar integrar a planilha!');location.href='id_edita.aspx?acao=lista';", True)
        End If
        If Request.QueryString("erro") = "0" Then
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: " & Request.QueryString("id_codigo") & " integrada com sucesso!');location.href='id_edita.aspx?acao=editar&id_codigo=" & Request.QueryString("id_codigo")&"';", True)
        End If
        If Request.QueryString("autorizada") = "1" Then
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: " & Request.QueryString("id_codigo") & " salva com sucesso!');", True)
        End If
        If Request.QueryString("autorizada") = "2" Then
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao gerar arquivo (" & Request.QueryString("id_codigo") & ")!');", True)
        End If
    End Sub
    
    Sub CriarID(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("id_edita.aspx?acao=editar")
    End Sub
    
    Sub CriarIDItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Session("nm_item") = ""
        Session("nr_fatura") = ""
        Session("vl_item") = ""
        Response.Redirect("id_edita.aspx?acao=criar_item&id_codigo=" & txtIDCodigo.Text)
    End Sub
    
    Sub CriarIDPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Session("nr_referencia") = ""
        Session("nr_item_po") = ""
        Session("nr_parcial") = ""
        Response.Redirect("id_edita.aspx?acao=criar_pedido&id_codigo=" & txtIDCodigo.Text)
    End Sub
           
    Sub CancelarID(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("id_edita.aspx?acao=lista")
    End Sub
    
    Sub CancelarIDItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Response.Redirect("id_edita.aspx?acao=lista_item&id_codigo=" & txtIDCodigo.Text)
    End Sub
    
    Sub CancelarIDPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Response.Redirect("id_edita.aspx?acao=lista_pedido&id_codigo=" & txtIDCodigo.Text)
    End Sub
    
    Sub EditarIDItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim ListaDespesa As Array = Split(e.CommandArgument.ToString, "#")
        
        Session("nm_item") = ListaDespesa(0).ToString
        Session("nr_fatura") = ListaDespesa(1).ToString
        Session("vl_item") = CDbl(ListaDespesa(2).ToString)
        
        'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('" & Session("nr_fatura") & " ');", True)
        
        Response.Redirect("id_edita.aspx?acao=editar_item&id_codigo=" & txtIDCodigo.Text)
    End Sub
    
    Sub SalvarID(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlID As SqlDataSource = frmEditaID.FindControl("sqlID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtCdImportador As TextBox = frmEditaID.FindControl("txtCdImportador")
        Dim txtCdUsuario As TextBox = frmEditaID.FindControl("txtCdUsuario")
        Dim txtDtCriacao As TextBox = frmEditaID.FindControl("txtDtCriacao")
        Dim txtCdUsuario2hidden As TextBox = frmEditaID.FindControl("txtCdUsuario2hidden")
        Dim cbAutorizado As CheckBox = frmEditaID.FindControl("cbAutorizado")
        Dim txtDtAutorizacao As TextBox = frmEditaID.FindControl("txtDtAutorizacao")
        Dim txtCdUsuario3hidden As TextBox = frmEditaID.FindControl("txtCdUsuario3hidden")
        Dim txtCdEmbarcacao As TextBox = frmEditaID.FindControl("txtCdEmbarcacao")
        Dim txtNrConhecimento As TextBox = frmEditaID.FindControl("txtNrConhecimento")
        Dim txtObservacoes As TextBox = frmEditaID.FindControl("txtObservacoes")
        Dim txtCdModal As TextBox = frmEditaID.FindControl("txtCdModal")
        Dim dt_autorizacao, cd_autorizacao, in_autorizacao, cd_importador, cd_embarcacao, cd_usuario, nr_processo_des, nr_conhecimento As String
        Dim qtde_ref As Integer
        Dim desautoriza_errado As String
        
        desautoriza_errado = "0"
        nr_processo_des = " NULL "
        If cbAutorizado.Checked Then
            dt_autorizacao = "CONVERT(DATETIME,'" & Right("00" & Date.Today.Day, 2) & "/" & Right("00" & Date.Today.Month, 2) & "/" & Date.Today.Year & "',103)"
            cd_autorizacao = "'" & Session("usuario") & "'"
            in_autorizacao = "1"
            Session("in_autorizado") = "1"
        Else
            SqlAux = " SELECT COUNT(*) AS QTDE " & _
            " FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) " & _
            " INNER JOIN TINSTRUCAO_DESEMBARACO ID (NOLOCK) ON ID.ID_CODIGO = IDP.ID_CODIGO " & _
            " INNER JOIN TREF_CLIENTE R (NOLOCK) ON R.CD_REFERENCIA = IDP.NR_REFERENCIA " & _
            "                                   AND R.NR_ITEM_PO = IDP.NR_ITEM_PO " & _
            "                                   AND R.NR_PARCIAL = IDP.NR_PARCIAL " & _
            "                                   AND R.CD_EMPRESA = ID.CD_CLIENTE " & _
            " WHERE IDP.ID_CODIGO = '" & txtIDCodigo.Text & "'" & _
            "  AND SUBSTRING(R.NR_PROCESSO, 5, 2) NOT IN ('LI') "

            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
            qtde_ref = RsAux("QTDE")
            CnnAux.Close()
            CmdAux.Dispose()
            RsAux.Close()
            
            If qtde_ref = 0 Then
                dt_autorizacao = "NULL"
                cd_autorizacao = "NULL"
                in_autorizacao = "0"
                Session("in_autorizado") = "0"
            Else
                desautoriza_errado = "1"
                dt_autorizacao = " DT_AUTORIZACAO "
                cd_autorizacao = " CD_USUARIO_AUTORIZACAO "
                nr_processo_des = " NR_PROCESSO "
                in_autorizacao = "1"
                Page.DataBind()
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Existem referências na " & txtIDCodigo.Text & " já utilizadas por um processo!');", True)
            End If
        End If
        
        If Trim(txtCdUsuario.Text) <> "" Then cd_usuario = "'" & Trim(txtCdUsuario.Text) & "'" Else cd_usuario = "NULL"
        If Trim(txtCdImportador.Text) <> "" Then cd_importador = "'" & Trim(txtCdImportador.Text) & "'" Else cd_importador = "NULL"
        If Trim(txtCdEmbarcacao.Text) <> "" Then cd_embarcacao = "'" & Trim(txtCdEmbarcacao.Text) & "'" Else cd_embarcacao = "NULL"
        If Trim(txtNrConhecimento.Text) <> "" Then nr_conhecimento = "'" & Trim(txtNrConhecimento.Text) & "'" Else nr_conhecimento = "NULL"
        
        sqlID.UpdateCommand = "UPDATE TINSTRUCAO_DESEMBARACO " & _
        " SET CD_CLIENTE = " & cd_importador & ", " & _
        " NR_PROCESSO = " & nr_processo_des & ", " & _
        " IN_AUTORIZADO = '" & in_autorizacao & "', " & _
        " DT_AUTORIZACAO = " & dt_autorizacao & ", " & _
        " CD_USUARIO_AUTORIZACAO = " & cd_autorizacao & ", " & _
        " CD_RESPONSAVEL = " & cd_usuario & ", " & _
        " CD_EMBARCACAO = " & cd_embarcacao & ", " & _
        " NR_CONHECIMENTO = " & nr_conhecimento & ", " & _
        " CD_EMPRESA = NULL, " & _
        " CD_MODAL = '" & txtCdModal.Text & "', " & _
        " TX_OBSERVACOES = '" & Replace(txtObservacoes.Text, "'", """") & "'" & _
        " WHERE ID_CODIGO = '" & txtIDCodigo.Text & "'"
        'Response.Write(sqlID.UpdateCommand.ToString)
        'Response.End()
        
        sqlID.Update()
        Page.DataBind()
        If Session("in_autorizado") = "1" And desautoriza_errado = "0" Then
            Response.Redirect("id_autoriza.asp?id=" + txtIDCodigo.Text + "&tipo=2")
        End If
        
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: " & txtIDCodigo.Text & " salva com sucesso!');", True)
    End Sub
            
    Sub SalvarIDPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedidoID As SqlDataSource = frmEditaID.FindControl("sqlPedidoID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim frmEditaPedidoID As FormView = frmEditaID.FindControl("frmEditaPedidoID")
        Dim txtPedido As TextBox = frmEditaPedidoID.FindControl("txtPedido")
        Dim txtItem As TextBox = frmEditaPedidoID.FindControl("txtItem")
        Dim txtParcial As TextBox = frmEditaPedidoID.FindControl("txtParcial")
        Dim txtPedidoHidden As TextBox = frmEditaPedidoID.FindControl("txtPedidoHidden")
        Dim txtItemHidden As TextBox = frmEditaPedidoID.FindControl("txtItemHidden")
        Dim txtParcialHidden As TextBox = frmEditaPedidoID.FindControl("txtParcialHidden")
        
        sqlPedidoID.UpdateCommand = "UPDATE TOP(1) TINSTRUCAO_DESEMBARACO_PEDIDO " & _
        " SET NR_REFERENCIA = '" & txtPedido.Text & "', " & _
        " NR_ITEM_PO = '" & txtItem.Text & "', " & _
        " NR_PARCIAL = '" & txtParcial.Text & "' " & _
        " WHERE ID_CODIGO = '" & txtIDCodigo.Text & "'" & _
        " AND ISNULL(NR_REFERENCIA,'') = '" & txtPedidoHidden.Text & "' " & _
        " AND ISNULL(NR_ITEM_PO,'') = '" & txtItemHidden.Text & "' " & _
        " AND ISNULL(NR_PARCIAL,'') = '" & txtParcialHidden.Text & "' "
        sqlPedidoID.Update()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
    End Sub
    
    Sub InserirID(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlID As SqlDataSource = frmEditaID.FindControl("sqlID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtCdImportador As TextBox = frmEditaID.FindControl("txtCdImportador")
        Dim txtCdUsuario As TextBox = frmEditaID.FindControl("txtCdUsuario")
        Dim txtDtCriacao As TextBox = frmEditaID.FindControl("txtDtCriacao")
        Dim txtCdUsuario2hidden As TextBox = frmEditaID.FindControl("txtCdUsuario2hidden")
        Dim txtDtAutorizacao As TextBox = frmEditaID.FindControl("txtDtAutorizacao")
        Dim txtCdUsuario3hidden As TextBox = frmEditaID.FindControl("txtCdUsuario3hidden")
        Dim txtCdEmbarcacao As TextBox = frmEditaID.FindControl("txtCdEmbarcacao")
        Dim txtNrConhecimento As TextBox = frmEditaID.FindControl("txtNrConhecimento")
        Dim txtObservacoes As TextBox = frmEditaID.FindControl("txtObservacoes")
        Dim txtCdModal As TextBox = frmEditaID.FindControl("txtCdModal")
        Dim dt_autorizacao, cd_usuario, cd_importador, cd_embarcacao, nr_conhecimento, cd_modal As String
        
        If txtDtAutorizacao.Text <> "" Then
            dt_autorizacao = "CONVERT(DATETIME,'" & txtDtAutorizacao.Text & "',103)"
        Else
            dt_autorizacao = "NULL"
        End If
                 
        If Trim(txtCdUsuario.Text) <> "" Then cd_usuario = "'" & Trim(txtCdUsuario.Text) & "'" Else cd_usuario = "NULL"
        If Trim(txtCdImportador.Text) <> "" Then cd_importador = "'" & Trim(txtCdImportador.Text) & "'" Else cd_importador = "NULL"
        If Trim(txtCdEmbarcacao.Text) <> "" Then cd_embarcacao = "'" & Trim(txtCdEmbarcacao.Text) & "'" Else cd_embarcacao = "NULL"
        If Trim(txtNrConhecimento.Text) <> "" Then nr_conhecimento = "'" & Trim(txtNrConhecimento.Text) & "'" Else nr_conhecimento = "NULL"
        If Trim(txtCdModal.Text) <> "" Then cd_modal = "'" & Trim(txtCdModal.Text) & "'" Else cd_modal = "NULL"
        
        SqlAux = " SELECT 'ID'+RIGHT('00000000'+CONVERT(VARCHAR,(MAX(SUBSTRING(ID_CODIGO,3,8))+1)),8)+'-'+CONVERT(VARCHAR,RIGHT(YEAR(GETDATE()),2)) AS CODIGO " & _
      " FROM TINSTRUCAO_DESEMBARACO (NOLOCK) WHERE YEAR(DT_CRIACAO) = YEAR(GETDATE())"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        Session("id_codigo") = RsAux("CODIGO")
        CnnAux.Close()
        CmdAux.Dispose()
        RsAux.Close()
        
        sqlID.InsertCommand = "INSERT INTO TINSTRUCAO_DESEMBARACO (ID_CODIGO, CD_USUARIO, DT_CRIACAO, IN_AUTORIZADO, CD_CLIENTE, NR_PROCESSO, DT_AUTORIZACAO, CD_USUARIO_AUTORIZACAO, CD_RESPONSAVEL, CD_EMBARCACAO, NR_CONHECIMENTO, CD_EMPRESA, CD_MODAL, TX_OBSERVACOES, IN_WEB)" & _
         " VALUES ('" & Session("id_codigo") & "', " & _
         "'" & txtCdUsuario2hidden.Text & "', " & _
         "CONVERT(DATETIME,'" & txtDtCriacao.Text & "',103), " & _
         " NULL, " & _
         "" & cd_importador & "," & _
         " NULL, " & _
         dt_autorizacao & "," & _
         "'" & txtCdUsuario3hidden.Text & "'," & _
         "" & cd_usuario & "," & _
         "" & cd_embarcacao & "," & _
         "" & nr_conhecimento & "," & _
         "NULL," & _
         "" & cd_modal & ", " & _
         "'" & Replace(txtObservacoes.Text, "'", """") & "', '1')"
        sqlID.Insert()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: " & Session("id_codigo") & " salva com sucesso!');location.href='id_edita.aspx?acao=editar&id_codigo=" & Session("id_codigo") & "';", True)
    End Sub
    
    Sub InserirIDItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlDespesasID As SqlDataSource = frmEditaID.FindControl("sqlDespesasID")
        Dim frmEditaItemID As FormView = frmEditaID.FindControl("frmEditaItemID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtNmItem As TextBox = frmEditaItemID.FindControl("txtNmItem")
        Dim ddlInvoice As DropDownList = frmEditaItemID.FindControl("ddlInvoice")
        Dim txtValor As TextBox = frmEditaItemID.FindControl("txtValor")
        Dim valor As String
        Dim cd_despesa As Integer
                
        If txtValor.Text <> "" Then
            valor = Replace(txtValor.Text, ",", ".")
        Else
            valor = "NULL"
        End If

        SqlAux = " SELECT COUNT(CD_DESPESA) AS COUNT_DESPESA, MAX(CD_DESPESA)+1 AS DESPESA FROM TINSTRUCAO_DESEMBARACO_DESPESAS WHERE ID_CODIGO = '" & txtIDCodigo.Text & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        If RsAux("COUNT_DESPESA") > 0 Then
            cd_despesa = RsAux("DESPESA")
        Else
            cd_despesa = 1
        End If
        RsAux.Close()
        CnnAux.Close()
        CmdAux.Dispose()
                
        sqlDespesasID.InsertCommand = "INSERT INTO TINSTRUCAO_DESEMBARACO_DESPESAS (ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM, CD_DESPESA)" & _
         " VALUES ('" & txtIDCodigo.Text & "', " & _
         " UPPER('" & txtNmItem.Text & "'), " & _
         "'" & ddlInvoice.SelectedItem.Value & "'," & _
         "" & valor & "," & _
         "" & cd_despesa & ")"
        sqlDespesasID.Insert()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Item salvo com sucesso!');location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
    End Sub
    
    Sub InserirIDPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedidoID As SqlDataSource = frmEditaID.FindControl("sqlPedidoID")
        Dim frmEditaPedidoID As FormView = frmEditaID.FindControl("frmEditaPedidoID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtPedido As TextBox = frmEditaPedidoID.FindControl("txtPedido")
        Dim txtItem As TextBox = frmEditaPedidoID.FindControl("txtItem")
        Dim txtParcial As TextBox = frmEditaPedidoID.FindControl("txtParcial")
        
        sqlPedidoID.InsertCommand = "INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO (ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL)" & _
         " VALUES ('" & txtIDCodigo.Text & "', " & _
         "'" & txtPedido.Text & "', " & _
         "'" & txtItem.Text & "'," & _
         "'" & txtParcial.Text & "')"
        sqlPedidoID.Insert()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Pedido salvo com sucesso!');location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
    End Sub
    
    Sub ExcluirID(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlID As SqlDataSource = frmEditaID.FindControl("sqlID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim id_codigo As String = txtIDCodigo.Text
        
        sqlID.UpdateCommand = " UPDATE POI " & _
        " SET POI.IN_UTILIZADO_INSTR_DESEMB = 0, " & _
        "        POI.ID_CODIGO_INSTR_DESEMB = NULL " & _
        " FROM TPO_ITEM POI " & _
        " INNER JOIN TINSTRUCAO_DESEMBARACO_PEDIDO IDP ON (IDP.NR_REFERENCIA = POI.NR_PROCESSO " & _
        "                                             AND IDP.NR_ITEM_PO = POI.NR_ITEM_CLIENTE " & _
        "                                             AND IDP.NR_PARCIAL = POI.NR_PARCIAL " & _
        "                                             AND IDP.ID_CODIGO = POI.ID_CODIGO_INSTR_DESEMB) " & _
        " WHERE IDP.ID_CODIGO = '" & id_codigo & "'"
        sqlID.Update()
                    
        sqlID.DeleteCommand = "DELETE FROM TINSTRUCAO_DESEMBARACO_PEDIDO WHERE ID_CODIGO = '" & id_codigo & "'"
        sqlID.Delete()
        sqlID.DeleteCommand = "DELETE FROM TINSTRUCAO_DESEMBARACO_DESPESAS WHERE ID_CODIGO = '" & id_codigo & "'"
        sqlID.Delete()
        sqlID.DeleteCommand = "DELETE FROM TINSTRUCAO_DESEMBARACO WHERE ID_CODIGO = '" & id_codigo & "'"
        sqlID.Delete()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: " & id_codigo & " excluída com sucesso!');location.href='id_edita.aspx?acao=lista';", True)
    End Sub
           
    Sub ExcluirIDPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedidoID As SqlDataSource = frmEditaID.FindControl("sqlPedidoID")
        Dim frmEditaPedidoID As FormView = frmEditaID.FindControl("frmEditaPedidoID")
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtPedidoHidden As TextBox = frmEditaPedidoID.FindControl("txtPedidoHidden")
        Dim txtItemHidden As TextBox = frmEditaPedidoID.FindControl("txtItemHidden")
        Dim txtParcialHidden As TextBox = frmEditaPedidoID.FindControl("txtParcialHidden")
        
        sqlPedidoID.DeleteCommand = "DELETE TOP(1) FROM TINSTRUCAO_DESEMBARACO_PEDIDO " & _
        " WHERE ID_CODIGO = '" & txtIDCodigo.Text & "'" & _
        " AND NR_REFERENCIA = '" & txtPedidoHidden.Text & "'" & _
        " AND NR_ITEM_PO = '" & txtItemHidden.Text & "'" & _
        " AND NR_PARCIAL = " & txtParcialHidden.Text & ""
        sqlPedidoID.Delete()
        
        sqlPedidoID.UpdateCommand = "UPDATE TPO_ITEM   " & _
        " SET IN_UTILIZADO_INSTR_DESEMB = 0, " & _
        " ID_CODIGO_INSTR_DESEMB = NULL " & _
        " WHERE NR_PROCESSO = '" & txtPedidoHidden.Text & "'" & _
        " AND NR_ITEM_CLIENTE = '" & txtItemHidden.Text & "'" & _
        " AND NR_PARCIAL = " & txtParcialHidden.Text & ""
        sqlPedidoID.Update()
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Pedido excluído com sucesso!');location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
    End Sub
    
    Function GetFileExt(ByVal sFileName As String) As String
        Dim P As Integer
        For P = Len(sFileName) To 1 Step -1
            If InStr(".", Mid(sFileName, P, 1)) Then Exit For
        Next
        GetFileExt = Right(sFileName, Len(sFileName) - P)
    End Function

    
    Function NomeArquivoPara(ByVal APrefixo As String, ByVal AExt As String, ByVal AProcesso As String) As String
        Dim SqlAux As String
        Dim A As Integer
        Dim NomeArquivo, S, D, DirArquivo As String
        DirArquivo = "\\indaiaweb\\sites\digitalizacao\" + AProcesso + "\"
        
        SqlAux = " SELECT TOP 1 LTRIM(RTRIM(NM_ARQUIVO)) AS NM_ARQUIVO " & _
       " FROM TPROCESSO_DOCTOS (NOLOCK) " & _
       " WHERE NR_PROCESSO = '" & AProcesso & "' " & _
       "  AND NM_ARQUIVO LIKE '" & APrefixo & "' + '%' " & _
       "  AND ISNUMERIC(SUBSTRING(NM_ARQUIVO, LEN('" & APrefixo & "')+1, 2)) = 1 " & _
       " ORDER BY DT_CRIACAO DESC "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
  
        NomeArquivo = ""
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        If Not RsAux.HasRows Then
            A = 0
        Else
            RsAux.Read()
            S = Mid(RsAux("NM_ARQUIVO").ToString, Len(APrefixo) + 1, 10)
            D = ""
            While (S <> "") And InStr("0;1;2;3;4;5;6;7;8;9", S(0))
                D = D + S(0)
                S = Right(S, Len(S) - 1)
            End While
            A = CInt(D)
        End If
        
        A = A + 1
        NomeArquivo = APrefixo + Right("0" + CStr(A), 2)
        Do Until Not File.Exists("\\indaiaweb\\sites\digitalizacao\" + AProcesso + "\" + NomeArquivo + AExt)
            A = A + 1
            NomeArquivo = APrefixo + Right("0" + CStr(A), 2)
        Loop
        NomeArquivo = UCase(NomeArquivo + AExt)
        CnnAux.Close()
        CmdAux.Dispose()
        RsAux.Close()
        Return NomeArquivo
    End Function
    
    Sub EnviarArquivoID(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtIDCodigo As TextBox = frmEditaID.FindControl("txtIDCodigo")
        Dim txtArquivo As TextBox = frmEditaID.FindControl("txtArquivo")
        Dim ddlTpArquivo As DropDownList = frmEditaID.FindControl("ddlTpArquivo")
        Dim fuArquivos As FileUpload = frmEditaID.FindControl("fuArquivos")
        Dim Dir As DirectoryInfo = New DirectoryInfo("\\indaiaweb\\sites\digitalizacao\TPROCESSO\" + txtIDCodigo.Text + "\")
        Dim NomeArquivo, PrefixoArquivo As String

        SqlAux = " SELECT NM_PREFIXO_ARQ FROM TTP_DOCTO_DIGITALIZADO  (NOLOCK) " & _
        " WHERE ID_TABELA = 1225680060 AND CD_PRODUTO IN ('01', 'AM') " & _
        " AND CD_TIPO_DOCTO = '" & ddlTpArquivo.SelectedItem.Value & "' "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        
        PrefixoArquivo = ""
        If RsAux.HasRows Then
            RsAux.Read()
            PrefixoArquivo = RsAux("NM_PREFIXO_ARQ").ToString
        End If
        RsAux.Close()
        CnnAux.Close()
        
        NomeArquivo = NomeArquivoPara(PrefixoArquivo, "." + GetFileExt(fuArquivos.PostedFile.FileName), txtIDCodigo.Text)
        'Response.Write(Dir.ToString + NomeArquivo)
        'Response.end
        If PrefixoArquivo <> "" Then
            Try
                If Not Dir.Exists Then
                    Dir.Create()
                End If
                fuArquivos.SaveAs(Dir.ToString + NomeArquivo)
                
                SqlAux = " INSERT TPROCESSO_DOCTOS (NR_PROCESSO,CD_TIPO_DOCTO,NM_DESCRICAO,NM_ARQUIVO,CD_USUARIO_CRIACAO,ID_TABELA) " & _
                 " VALUES ('" & txtIDCodigo.Text & "', '" & ddlTpArquivo.SelectedItem.Value & "', '" & txtArquivo.Text & "', '" & NomeArquivo & "', '" & Session("usuario") & "', 1225680060 )"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                CmdAux.ExecuteNonQuery()
                CmdAux.Dispose()
                CnnAux.Close()
                Page.DataBind()
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
            Catch ex As Exception
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
            End Try
        Else
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
        End If
    End Sub
           
    Sub EnviarArquivoIDExterna(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Dir As DirectoryInfo = New DirectoryInfo(Server.MapPath("\arquivo\upload\"))
        Dim NomeArquivo As String
        NomeArquivo = fuIDExterna.FileName
        If NomeArquivo <> "" Then
            Try
                If Not Dir.Exists Then
                    Dir.Create()
                End If
                fuIDExterna.SaveAs(Dir.ToString + Replace(NomeArquivo, " ", ""))
                Response.Redirect("id_externa.asp?arquivo=" + Replace(NomeArquivo, " ", "") + "&usuario=" + Session("usuario"))
            Catch ex As Exception
                'Response.Write("ERRO")
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=lista';", True)
            End Try
        Else
            'Response.Write("EM BRANCO")
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar enviar o arquivo!');location.href='id_edita.aspx?acao=lista';", True)
        End If
    End Sub
    
    Sub VoltarMenu(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("usuario") = ""
        Session("nm_usuario") = "" 
        Response.Redirect("/default.asp")
    End Sub
    
</script>

<script type="text/javascript">
    var NS4 = (document.layers);
    var IE4 = (document.all);
    var win = this;
    var n = 0;

    function Trim(str) { return str.replace(/^\s+|\s+$/g, ""); }

    function validarData(campo, valor) {
        var date = valor;
        if (Trim(date) != '') {
            var ardt = new Array;
            var ExpReg = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
            ardt = date.split("/");
            erro = false;
            if (date.search(ExpReg) == -1) {
                erro = true;
            }
            else if (((ardt[1] == 4) || (ardt[1] == 6) || (ardt[1] == 9) || (ardt[1] == 11)) && (ardt[0] > 30))
                erro = true;
            else if (ardt[1] == 2) {
                if ((ardt[0] > 28) && ((ardt[2] % 4) != 0))
                    erro = true;
                if ((ardt[0] > 29) && ((ardt[2] % 4) == 0))
                    erro = true;
            }
            if (erro) {
                alert("ATENÇÃO: Data inválida!");
                campo.focus();
                campo.value = "";
                return false;
            }
            return true;
        }
    }


    function findInPage(str) {
        var txt, i, found;

        if (str == "") return false;

        if (NS4) {
            if (!win.find(str))
                while (win.find(str, false, true)) n++;
            else
                n++;
            if (n == 0) alert(str + " não está nesta página.");
        }

        if (IE4) {
            txt = win.document.body.createTextRange();
            for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
                txt.moveStart("character", 1);
                txt.moveEnd("textedit");
            }
            if (found) {
                txt.moveStart("character", -1);
                txt.findText(str);
                txt.select();
                txt.scrollIntoView();
                n++;
            }
            else {
                if (n > 0) {
                    n = 0;
                    findInPage(str);
                }
                else
                    alert(str + " não foi encontrado nesta página.");
            }
        }
        return false;
    }

    function Left(str, n) {
        if (n <= 0)
            return "";
        else if (n > String(str).length)
            return str;
        else
            return String(str).substring(0, n);
    }

    function Right(str, n) {
        if (n <= 0)
            return "";
        else if (n > String(str).length)
            return str;
        else {
            var iLen = String(str).length;
            return String(str).substring(iLen, iLen - n);
        }
    }

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

    function preencheNome(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                vCod = vCod.replace(" ", "");
                if (vCod.length > 0 && vCod != 0) {
                    for (i = vCod.length; i < vCodigo.maxLength; i++)
                        vCod = '0' + String(vCod);
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
                    //alert("/popup/fast_lookup.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod);
                    ajax.open("GET", "/popup/fast_lookup.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "processando...";
                        }
                        if (ajax.readyState == 4) { //agora exibe o que interessa
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText; //resultado da busca
                                if (vResult.indexOf('erro') != 0) {
                                    vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                                    vResult = unescape(vResult); //continua resolvendo problemas de acento                                    
                                    if (vTabela = 'TEMPRESA_NAC') {
                                        verificaInPedido('<%= Request.QueryString("id_codigo") %>');
                                    } else {
                                        vCodigo.style.background = 'white';
                                    }
                                    vDesc.value = vResult.toUpperCase();
                                } else {
                                    alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
                                    vCodigo.style.background = 'red';
                                    vDesc.value = "";
                                }
                            } else {
                                alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
                                vDesc.value = "";
                            }
                        }
                    }
                    ajax.send(null); // submete
                }
                else if (vCod != '') {
                    alert('Ocorreu um erro de envio de dados, entre em contato com suporte@myindaia.com.br!');
                    vDesc.value = ""
                }
            }
        }
    }

    function ExibeDetalhes(titulo, vDiv, vDiv2, vDiv3, vFeatures, arquivo, width, height, posicao) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = width;
            var z = height;

            var vCorpo = document.getElementById(vDiv);
            var vInfo = document.getElementById(vDiv2);
            var vTitulo = document.getElementById('divTitulo');
            var vInfoRodape = document.getElementById(vDiv3);
            var vPesquisa = document.getElementById('divPesquisa');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vInfo.style.width = w;
            vInfo.style.height = 50;
            vInfo.style.left = (x2) - 200;
            vInfo.style.top = ((y4) / 2) - 20 - posicao;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) - 200;
            vCorpo.style.top = ((y4) / 2) - 2 + 25 - posicao;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";


            var ajax = openAjax();
            ajax.open('POST', arquivo + '.aspx?' + vFeatures + '&usuario=<%=Session("usuario") %>', true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                }
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
        document.getElementById('txtPesquisa').value = '';
        document.getElementById('txtPesquisa').focus();
    }


    function ExibeAtzFollowup(ID) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '500';
            var z = '350';

            var vCorpo = document.getElementById('divAtzFollowup');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - 130;
            vCorpo.style.top = z / 2 - 125;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", "id_followup.aspx?id=" + ID, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function FechaAtzFollowup() {
        var div = document.getElementById('divAtzFollowup');
        div.style.display = "none";
    }

    
    function FechaDetalhes(vDiv1, vDiv2) {
        n = 0;
        if (document.getElementById) {
            var div = document.getElementById(vDiv1);
            var div2 = document.getElementById(vDiv2);
            div.style.display = "none";
            div2.style.display = "none";
        }
    }

    function carregaLista() {
        document.getElementById('divListaIDCabec').style.backgroundColor = '#374BAE';
        document.getElementById('divListaID').style.display = 'block';
        document.getElementById('divDadosIDCabec').style.backgroundColor = '#FFFFFF';
        document.getElementById('divDadosID').style.display = 'none';
    }

    function carregaDados() {
        document.getElementById('divListaIDCabec').style.backgroundColor = '#FFFFFF';
        document.getElementById('aListaID').style.color = '#374BAE';
        document.getElementById('divListaIDCabec').style.borderBottomWidth = '0px';
        document.getElementById('divListaID').style.display = 'none';
        document.getElementById('divDadosIDCabec').style.backgroundColor = '#374BAE';
        document.getElementById('aDadosID').style.color = '#FFFFFF';
        document.getElementById('divDadosID').style.display = 'block';
        document.getElementById('aDadosID').style.cursor = "default";
        document.getElementById('aListaID').href = "id_edita.aspx?acao=lista";
        preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaID_txtCdImportador'), 'frmEditaID_txtNmImportador');
        preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', document.getElementById('frmEditaID_txtCdUsuario'), 'frmEditaID_txtNmUsuario');
        preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', document.getElementById('frmEditaID_txtCdEmbarcacao'), 'frmEditaID_txtNmEmbarcacao');
        preencheNome('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE', document.getElementById('frmEditaID_txtCdModal'), 'frmEditaID_txtNmModal');
        if ('<%= Request("acao") %>' == 'criar_item' || '<%= Request("acao") %>' == 'editar_item') {
            if ('<%= Request("acao") %>' == 'criar_item') {
                document.getElementById('frmEditaID_frmEditaItemID_txtNmItem').value = '';
                document.getElementById('frmEditaID_frmEditaItemID_ddlInvoice').value = '';
                document.getElementById('frmEditaID_frmEditaItemID_txtValor').value = '';
                document.getElementById("divEditaID").scrollTop = 350;
            }
            document.getElementById('divListaIDItemCabec').style.backgroundColor = '#FFFFFF';
            document.getElementById('aListaIDItem').style.color = '#374BAE';
            document.getElementById('divListaIDItemCabec').style.borderBottomWidth = '0px';
            document.getElementById('divListaIDItem').style.display = 'none';
            document.getElementById('divDadosIDItemCabec').style.backgroundColor = '#374BAE';
            document.getElementById('aDadosIDItem').style.color = '#FFFFFF';
            document.getElementById('divDadosIDItem').style.display = 'block';
            document.getElementById('aDadosIDItem').style.cursor = "default";
            document.getElementById('aListaIDItem').href = "id_edita.aspx?acao=lista_item&id_codigo=" + document.getElementById('frmEditaId_txtIDCodigo').value;
            document.getElementById("divEditaID").scrollTop = 350;
        }

        if ('<%= Request("acao") %>' == 'criar_pedido' || '<%= Request("acao") %>' == 'editar_pedido') {
            document.getElementById('divListaIDPedidoCabec').style.backgroundColor = '#FFFFFF';
            document.getElementById('aListaIDPedido').style.color = '#374BAE';
            document.getElementById('divListaIDPedidoCabec').style.borderBottomWidth = '0px';
            document.getElementById('divListaIDPedido').style.display = 'none';
            document.getElementById('divDadosIDPedidoCabec').style.backgroundColor = '#374BAE';
            document.getElementById('aDadosIDPedido').style.color = '#FFFFFF';
            document.getElementById('divDadosIDPedido').style.display = 'block';
            document.getElementById('aDadosIDPedido').style.cursor = "default";
            document.getElementById('aListaIDPedido').href = "id_edita.aspx?acao=lista_pedido&id_codigo=" + document.getElementById('frmEditaId_txtIDCodigo').value
            document.getElementById("divEditaID").scrollTop = 550;
        }

        if ('<%= Request("acao") %>' == 'lista_item') {
            document.getElementById('divListaIDItemCabec').style.backgroundColor = '#374BAE';
            document.getElementById('divListaIDItem').style.display = 'block';
            document.getElementById('divDadosIDItemCabec').style.backgroundColor = '#FFFFFF';
            document.getElementById('divDadosIDItem').style.display = 'none';
            document.getElementById("divEditaID").scrollTop = 350;
        }

        if ('<%= Request("acao") %>' == 'lista_pedido') {
            document.getElementById('divListaIDPedidoCabec').style.backgroundColor = '#374BAE';
            document.getElementById('divListaIDPedido').style.display = 'block';
            document.getElementById('divDadosIDPedidoCabec').style.backgroundColor = '#FFFFFF';
            document.getElementById('divDadosIDPedido').style.display = 'none';
            document.getElementById("divEditaID").scrollTop = 550;
        }        
    }

    function verificaInPedido(id_codigo) {
        var ajax = openAjax();
        ajax.open('POST', 'id_verifica_pedido.aspx?id_codigo=' + id_codigo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    if (vResult != '0') {
                        document.getElementById('frmEditaID_txtCdImportador').style.backgroundColor = '#DEE6EF';
                        document.getElementById('frmEditaID_txtCdImportador').readOnly = true;
                    } else {
                        document.getElementById('frmEditaID_txtCdImportador').style.backgroundColor = '#FFFFFF';
                        document.getElementById('frmEditaID_txtCdImportador').readOnly = false;
                    }
                } else {
                    vCorpo.innerHTML = ajax.responseText;
                }
            }
        }
        ajax.send(null);
    }

    function ExcluirID() {
        return (confirm('ATENÇÃO: Deseja realmente excluir esta ID?'));
    }

    function alteraCheck(objeto) {
        if (objeto.checked) {
            if (Trim(document.getElementById('frmEditaID_txtCdModal').value) != '') {
                document.getElementById('frmEditaID_txtNmUsuario3').value = '<%=Session("nm_usuario") %>';
                document.getElementById('frmEditaID_txtDtAutorizacao').value = '<%= Right("00" & Date.Today.Day,2) & "/" & Right("00" & Date.Today.Month,2) & "/" & Date.Today.Year %>';
            } else {
                alert('ATENÇÃO: Primeiramente, preencha o modal!')
                objeto.checked = false;  
            }
        } else {
            document.getElementById('frmEditaID_txtNmUsuario3').value = '';
            document.getElementById('frmEditaID_txtDtAutorizacao').value = '';
        }

    }

    function enviaValor(valor, tabela) {
        if (tabela == 'TUSUARIO') {
            if ('<%= Request.QueryString("acao") %>' != 'lista') {
                document.getElementById('frmEditaID_txtCdUsuario').value = valor;
                document.getElementById('frmEditaID_txtCdUsuario').focus();
                document.getElementById('frmEditaID_txtCdUsuario').blur();
            } else {
                document.getElementById('frmEditaID_txtCdResponsavel').value = valor;
                document.getElementById('frmEditaID_txtCdResponsavel').focus();
                document.getElementById('frmEditaID_txtCdResponsavel').blur();
            }
        }
        
        if (tabela == 'TEMPRESA_NAC') {
            document.getElementById('frmEditaID_txtCdImportador').value = valor;
            document.getElementById('frmEditaID_txtCdImportador').focus();
            document.getElementById('frmEditaID_txtCdImportador').blur();
        }

        if (tabela == 'TEMBARCACAO') {
            document.getElementById('frmEditaID_txtCdEmbarcacao').value = valor;
            document.getElementById('frmEditaID_txtCdEmbarcacao').focus();
            document.getElementById('frmEditaID_txtCdEmbarcacao').blur();
        }
        if (tabela == 'PEDIDO') {
            document.getElementById('frmEditaID_frmEditaPedidoID_txtPesqPedido').value = valor;
            document.getElementById('frmEditaID_frmEditaPedidoID_txtPesqPedido').focus();
            document.getElementById('frmEditaID_frmEditaPedidoID_txtPesqPedido').blur();
        }
        if (tabela == 'TVIA_TRANSPORTE') {
            document.getElementById('frmEditaID_txtCdModal').value = valor;
            document.getElementById('frmEditaID_txtCdModal').focus();
            document.getElementById('frmEditaID_txtCdModal').blur();
        }
        FechaDetalhes('divInfoCorpo', 'divInfo');
    }

    function alteraGrid(ult_30, autorizados, id_codigo, resp, embarque) {
        if (id_codigo == 'ID') { id_codigo = ''; }
        if (resp == 'Responsável (Desembaraço)') { resp = ''; }
        if (embarque == 'Embarque') { embarque = ''; }
        var vCorpo = document.getElementById('grdPrincipal');
        if (ult_30.checked || autorizados.checked) {
            if (ult_30.checked && autorizados.checked) {
                var ajax = openAjax();
                ajax.open('POST', 'id_principal.aspx?ult_30=1&autorizados=1&usuario=<%=Session("usuario")%>&id_codigo=' + id_codigo + '&resp=' + resp + '&embarque=' + embarque, true);
                ajax.onreadystatechange = function() {
                    if (ajax.readyState == 1) {
                        vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                    }
                    if (ajax.readyState == 4) {
                        if (ajax.status == 200) {
                            var vResult = ajax.responseText;
                            vResult = vResult.replace(/\+/g, " ");
                            vResult = unescape(vResult);
                            vCorpo.innerHTML = vResult;
                            var scripts = vCorpo.getElementsByTagName("script");
                            for (i = 0; i < scripts.length; i++) {
                                s = scripts[i].innerHTML;
                                eval(s);
                            }
                        } else {
                            vCorpo.innerHTML = ajax.responseText;
                        }
                    }
                }
                ajax.send(null);
            } else {
                if (ult_30.checked) {
                    var ajax = openAjax()
                    ajax.open('POST', 'id_principal.aspx?ult_30=1&autorizados=0&usuario=<%=Session("usuario")%>&id_codigo=' + id_codigo + '&resp=' + resp + '&embarque=' + embarque, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 1) {
                            vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                        }
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                vCorpo.innerHTML = vResult;
                                var scripts = vCorpo.getElementsByTagName("script");
                                for (i = 0; i < scripts.length; i++) {
                                    s = scripts[i].innerHTML;
                                    eval(s);
                                }
                            } else {
                                vCorpo.innerHTML = ajax.responseText;
                            }
                        }
                    }
                    ajax.send(null);
                }
                else {
                    var ajax = openAjax();
                    ajax.open('POST', 'id_principal.aspx?ult_30=0&autorizados=1&usuario=<%=Session("usuario")%>&id_codigo=' + id_codigo + '&resp=' + resp + '&embarque=' + embarque, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 1) {
                            vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                        }
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                vCorpo.innerHTML = vResult;
                                var scripts = vCorpo.getElementsByTagName("script");
                                for (i = 0; i < scripts.length; i++) {
                                    s = scripts[i].innerHTML;
                                    eval(s);
                                }
                            } else {
                                vCorpo.innerHTML = ajax.responseText;
                            }
                        }
                    }
                    ajax.send(null);
                }
            }
        } else {
        var ajax = openAjax();
        ajax.open('POST', 'id_principal.aspx?ult_30=0&autorizados=0&usuario=<%=Session("usuario")%>&id_codigo=' + id_codigo + '&resp=' + resp + '&embarque=' + embarque, true);
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 1) {
                vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
            }
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    vCorpo.innerHTML = vResult;
                    var scripts = vCorpo.getElementsByTagName("script");
                    for (i = 0; i < scripts.length; i++) {
                        s = scripts[i].innerHTML;
                        eval(s);
                    }
                } else {
                    vCorpo.innerHTML = ajax.responseText;
                }
            }
        }
        ajax.send(null);
        }
    }

    function carregaPedidoID(pedido, cliente, id_codigo, conhecimento, navio) {
        if (pedido != '') {
            vCorpo = document.getElementById('divgrdPedido');
            var ajax = openAjax();
            ajax.open('POST', 'id_pedido_carrega.aspx?pedido=' + pedido + '&cliente=' + cliente + '&id_codigo=' + id_codigo + '&conhecimento=' + conhecimento + '&navio=' + navio, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == 'ERRO') {
                            vCorpo.innerHTML = "<table style='text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:582px;' bgcolor='#374BAE' cellspacing='0' cellpadding='4'><tr bgcolor='#FFFFFF' height='25px' style='font-family:Verdana;font-size:9pt;'><td><center><img src='/imagens/alerta_32.gif' style='vertical-align:middle;'>Sem informações</center></td></tr></table>";
                            document.getElementById('linkTodosPedidoFalso').style.display = 'inline';
                            document.getElementById('linkTodosPedido').style.display = 'none';
                        } else {
                            vCorpo.innerHTML = vResult;
                            document.getElementById('linkTodosPedido').style.display = 'inline';
                            document.getElementById('linkTodosPedidoFalso').style.display = 'none';
                        }
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function carregaDespesaItemId(id_codigo) {
        vCorpo = document.getElementById('divGrdDespesaID');
        var ajax = openAjax();
        ajax.open('POST', 'id_despesa_item_carrega.aspx?id_codigo=' + id_codigo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    //alert(vResult);
                    if (vResult == 'ERRO') {
                        vCorpo.innerHTML = "<table style='text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:582px;' bgcolor='#374BAE' cellspacing='0' cellpadding='4'><tr bgcolor='#FFFFFF' height='25px' style='font-family:Verdana;font-size:9pt;'><td><center><img src='/imagens/alerta_32.gif' style='vertical-align:middle;'>Nenhum pedido foi encontrado para esta ID</center></td></tr></table>";
                        //document.getElementById('linkTodosPedidoFalso').style.display = 'inline';
                        //document.getElementById('linkTodosPedido').style.display = 'none';
                    } else {
                        vCorpo.innerHTML = vResult;
                        //document.getElementById('linkTodosPedido').style.display = 'inline';
                        //document.getElementById('linkTodosPedidoFalso').style.display = 'none';
                    }
                    var scripts = vCorpo.getElementsByTagName("script");
                    for (i = 0; i < scripts.length; i++) {
                        s = scripts[i].innerHTML;
                        eval(s);
                    }
                } else {
                    vCorpo.innerHTML = ajax.responseText;
                }
            }
        }
        ajax.send(null);
    }

    function incluirPedidoId(pedido, cliente, item_cliente, parcial, id_codigo, conhecimento, navio) {
        if (pedido != '') {
            var ajax = openAjax();
            ajax.open('POST', 'id_pedido_inclui.aspx?pedido=' + pedido + '&cliente=' + cliente + '&item_cliente=' + item_cliente + '&parcial=' + parcial + '&id_codigo=' + id_codigo + '&conhecimento=' + conhecimento + '&navio=' + navio, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == '') {
                            alert('ATENÇÃO: Pedido/Item/Parcial inserido na ' + id_codigo + ' com sucesso!');
                            carregaPedidoID(pedido, cliente, id_codigo, conhecimento, navio)
                        } else {
                            alert('ATENÇÃO: Erro ao inserir Pedido/Item/Parcial na ' + id_codigo + '!');
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        } else {
            alert('ATENÇÃO: Primeiramente, preencha o pedido!');
        }
        verificaInPedido(id_codigo);
    }

    function excluirIdArquivo(id_codigo, arquivo) {
        if (confirm('ATENÇÃO: Deseja realmente excluir o arquivo '+ arquivo +'?')) {
            var ajax = openAjax();
            ajax.open('POST', 'id_arquivo_exclui.aspx?id_codigo=' + id_codigo + '&arquivo=' + arquivo, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == '') {
                            //alert('ATENÇÃO: Arquivo excluído com sucesso!');
                            location.href = "id_edita.aspx?acao=editar&id_codigo=" + id_codigo;
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

    function replaceAll(str, de, para) {
        var pos = str.indexOf(de);
        while (pos > -1) {
            str = str.replace(de, para);
            pos = str.indexOf(de);
        }
        return (str);
    }

    
    function habilitaLinha(evento) {
        var sim = new Image(16, 16);
        var nao = new Image(16, 16);
        sim.src = "/imagens/icones/16x16/checks/0.gif";
        nao.src = "/imagens/icones/16x16/checks/1.gif";

        if (document.getElementById('chb_' + evento).checked) {
            document.getElementById('lbl_dt_' + evento).innerHTML = '-';
            document.getElementById('td_cd_' + evento).disabled  = false;
            document.getElementById('td_nm_' + evento).disabled  = false;
            document.getElementById('td_img_' + evento).disabled = false;
            document.getElementById('img_' + evento).disabled = false;
            document.getElementById('img_' + evento).src = sim.src;
            document.getElementById('td_dt_' + evento).disabled = false;
            document.getElementById('eventos').value = document.getElementById('eventos').value + evento + ';'
            document.getElementById('dt_' + evento).value = '';
        } else {
            document.getElementById('lbl_dt_' + evento).innerHTML = '-';
            document.getElementById('td_cd_' + evento).disabled  = true;
            document.getElementById('td_nm_' + evento).disabled  = true;
            document.getElementById('td_img_' + evento).disabled = true;
            document.getElementById('img_' + evento).disabled = true;
            document.getElementById('img_' + evento).src = nao.src;
            document.getElementById('td_dt_' + evento).disabled = true;
            document.getElementById('eventos').value = replaceAll(document.getElementById('eventos').value, evento + ';', '')
            document.getElementById('dt_' + evento).value = '';
        }
        //alert(document.getElementById('eventos').value);
    }

    function aplicaEvento(evento) {
        var sim = new Image(16, 16);
        var nao = new Image(16, 16);
        sim.src = "/imagens/icones/16x16/checks/0.gif";
        nao.src = "/imagens/icones/16x16/checks/1.gif";

        if (document.getElementById('img_' + evento).src == nao.src) {
            document.getElementById('td_cd_' + evento).disabled = false;
            document.getElementById('td_nm_' + evento).disabled = false;
            document.getElementById('td_img_' + evento).disabled = false;            
            document.getElementById('img_' + evento).src = sim.src;
            document.getElementById('td_dt_' + evento).disabled = false;
            document.getElementById('lbl_dt_' + evento).innerHTML = '-';
            document.getElementById('apl_' + evento).value = '1';
            document.getElementById('dt_' + evento).value = '';
        } else {
            document.getElementById('apl_' + evento).value = '0';
            document.getElementById('lbl_dt_' + evento).innerHTML = '-';
            document.getElementById('td_cd_' + evento).disabled = true;
            document.getElementById('td_nm_' + evento).disabled = true;
            document.getElementById('td_img_' + evento).disabled = true;            
            document.getElementById('img_' + evento).src = nao.src;
            document.getElementById('td_dt_' + evento).disabled = true;
            document.getElementById('dt_' + evento).value = '';
        }
    }

    function preencheEventoHoje(evento) {
        document.getElementById('lbl_dt_' + evento).innerHTML = '<%= Right("00"+Date.Now.Day.ToString,2).ToString  & "/" & Right("00"+Date.Now.Month.ToString,2).ToString  & "/" & Date.Now.Year.ToString%>';
        document.getElementById('dt_' + evento).value = '<%= Right("00"+Date.Now.Day.ToString,2).ToString  & "/" & Right("00"+Date.Now.Month.ToString,2).ToString  & "/" & Date.Now.Year.ToString%>';
    }

    function preencheEvento(evento, data) {
        var data = data.value;
        document.getElementById('lbl_dt_' + evento).innerHTML = data;
        document.getElementById('dt_' + evento).value = data;
        FechaData();
        
    }

    function AtzFollowup(eventos, datas, aplicar) {
        var ajax = openAjax();
        ajax.open('GET', 'id_followup_atz.aspx?usuario=<%=Session("usuario")%>&id_codigo=<%=Request.QueryString("id_codigo")%>&eventos=' + eventos + '&datas=' + datas + '&aplicar=' + aplicar, true);
            ajax.setRequestHeader("Cache-Control", "no-cache");
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {                    
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        //alert(vResult);
                        //vResult = vResult.replace(/\+/g," ");
                        //vResult = unescape(vResult);
                        if (vResult == "") {
                            alert('ATENÇÃO: Evento(s) atualizado(s) com sucesso!');
                        } else {
                            alert('ATENÇÃO: Erro ao atualizar o(s) evento(s)!');
                        }
                    }
                }
            }
            ajax.send(null);    
    }
    
    function SalvarAtzFollowup(eventos) {
        var eventos = eventos.value;
        var datas_eventos = '';
        var aplicar_eventos = '';
        eventos = Left(eventos, (eventos.length - 1))
        var eventosArray = eventos.split(';');
        for (i = 0; i <= (eventosArray.length - 1); i++){
            datas_eventos = datas_eventos + document.getElementById('dt_' + eventosArray[i]).value + ';'
            aplicar_eventos = aplicar_eventos + document.getElementById('apl_' + eventosArray[i]).value + ';'
        }
        datas_eventos = Left(datas_eventos, (datas_eventos.length - 1))
        aplicar_eventos = Left(aplicar_eventos, (aplicar_eventos.length - 1))
        AtzFollowup(eventos, datas_eventos, aplicar_eventos);
    }

    function ExibeData(evento) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '300';
            var z = '90';

            var vCorpo = document.getElementById('divData');
            var data = document.getElementById('dt_' + evento).value;
                
            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 + 75;
            vCorpo.style.top = z / 2 + 25;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", "id_followup_atz_data.aspx?evento=" + evento+ "&data=" + data, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function FechaData() {
        var div = document.getElementById('divData');
        div.style.display = "none";
    }

    function visualizaPlanilha() {
        var ajax = openAjax();
        ajax.open('POST', 'id_autoriza.asp?id=<%=Request.QueryString("id_codigo")%>&tipo=1', true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    if (vResult == "OK") {
                        window.open('http://www.myindaiateste.com.br/arquivo/upload/InstrucaoDesembaraco<%=Request.QueryString("id_codigo")%>.xls')
                    } else {
                        alert('ATENÇÃO: Erro ao gerar a planilha!');
                    }
                }
            }
        }
        ajax.send(null);
    }

    function carregaPedidoItemId(id_codigo) {
        vCorpo = document.getElementById('divGrdPedidoID');
        var ajax = openAjax();
        ajax.open('POST', 'id_pedido_item_carrega.aspx?id_codigo=' + id_codigo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    //alert(vResult);
                    if (vResult == 'ERRO') {
                        vCorpo.innerHTML = "<table style='text-align:left;cursor:pointer;font-size:7pt;font-family:verdana;color:#000000;BORDER-COLLAPSE:collapse;border-width:0px 0px 0px 0px;border-style:solid;border-color:#374BAE;width:582px;' bgcolor='#374BAE' cellspacing='0' cellpadding='4'><tr bgcolor='#FFFFFF' height='25px' style='font-family:Verdana;font-size:9pt;'><td><center><img src='/imagens/alerta_32.gif' style='vertical-align:middle;'>Nenhum pedido foi encontrado para esta ID</center></td></tr></table>";
                        //document.getElementById('linkTodosPedidoFalso').style.display = 'inline';
                        //document.getElementById('linkTodosPedido').style.display = 'none';
                    } else {
                        vCorpo.innerHTML = vResult;
                        //document.getElementById('linkTodosPedido').style.display = 'inline';
                        //document.getElementById('linkTodosPedidoFalso').style.display = 'none';
                    }
                    var scripts = vCorpo.getElementsByTagName("script");
                    for (i = 0; i < scripts.length; i++) {
                        s = scripts[i].innerHTML;
                        eval(s);
                    }
                } else {
                    vCorpo.innerHTML = ajax.responseText;
                }
            }
        }
        ajax.send(null);
    }

    function excluirPedidoID(id_codigo, pedido, item, parcial) {
        var msg;
        if (pedido != 'X') {
            msg = 'ATENÇÃO: Deseja realmente excluir ' + Trim(pedido) + '/' + Trim(item) + '/' + Trim(parcial) + '?';
        } else {
            msg = 'ATENÇÃO: Deseja realmente excluir todos os pedidos da '+ Trim(id_codigo) + '?';
        }
        if (confirm(msg)) {
            var vFeatures = '&nr_referencia=' + pedido + '&nr_item_cliente=' + item + '&nr_parcial=' + parcial;
            var ajax = openAjax();
            ajax.open('POST', 'id_pedido_exclui.aspx?id_codigo=' + id_codigo + vFeatures, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == '') {
                            carregaPedidoItemId(id_codigo);
                        } else {
                            alert('ATENÇÃO: Erro ao tentar excluir arquivo!');
                        }
                    }
                }
            }
            ajax.send(null);
        }
        verificaInPedido(id_codigo);
    }

    function excluirDespesaID(id_codigo, nome, cd_despesa) {
        var msg;
        if (nome != 'X#') {
            msg = 'ATENÇÃO: Deseja realmente excluir ' + Trim(nome) + '?';
        } else {
            msg = 'ATENÇÃO: Deseja realmente excluir todas as despesas da ' + Trim(id_codigo) + '?';
        }
        if (confirm(msg)) {
            var vFeatures = '&cd_despesa=' + cd_despesa + '&nome=' + nome;
            var ajax = openAjax();
            ajax.open('POST', 'id_despesa_exclui.aspx?id_codigo=' + id_codigo + vFeatures, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult == '') {
                            carregaDespesaItemId(id_codigo);
                        } else {
                            alert('ATENÇÃO: Erro ao tentar excluir arquivo!');
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function VisualizaPedido(processo, item) {
        if (item != '') {
            window.open('../Pedido/pedido_edita.aspx?acao=editar_item&nr_processo=' + processo + '&item_cliente=' + item, '_blank');
        } else {
            window.open('../Pedido/pedido_edita.aspx?acao=listar_item&nr_processo=' + processo, '_blank');
        }
    }

    function VerificaModal(objeto) {
        if (objeto.value == '01') {
            document.getElementById('frmEditaID_txtCdEmbarcacao').style.backgroundColor = '#FFFFFF';
            document.getElementById('frmEditaID_txtCdEmbarcacao').readOnly = false;
        } else {
            document.getElementById('frmEditaID_txtCdEmbarcacao').value = '';
            document.getElementById('frmEditaID_txtCdEmbarcacao').focus();
            document.getElementById('frmEditaID_txtCdEmbarcacao').blur();         
            document.getElementById('frmEditaID_txtCdEmbarcacao').style.backgroundColor = '#DEE6EF';
            document.getElementById('frmEditaID_txtCdEmbarcacao').readOnly = true;
        }
    }

    function SalvarID() {
        if (Trim(document.getElementById('frmEditaID_txtCdModal').value) == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Modal'");
            return false;
        }
    }

    function SalvarID() {
        if (Trim(document.getElementById('frmEditaID_txtCdModal').value) == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Modal'");
            return false;
        }
    }

    function ExibeIDExterna() {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '400';
            var z = '80';

            var vCorpo = document.getElementById('divIDExterna');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - 20;
            vCorpo.style.top = z / 2 + 75;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";
        }
    }

    function FechaIDExterna() {
        var vCorpo = document.getElementById('divIDExterna');
        vCorpo.style.display = "none";
    }

    function LimparTodos() {
        document.getElementById('frmEditaID_txtIDBusca').value = '';
        document.getElementById('frmEditaID_txtIDBusca').onblur();
        document.getElementById('frmEditaID_txtCdResponsavel').value = '';
        document.getElementById('frmEditaID_txtCdResponsavel').onblur();
        document.getElementById('frmEditaID_txtEmbarque').value = '';
        document.getElementById('frmEditaID_txtEmbarque').onblur();
        document.getElementById('frmEditaID_txtEmbarque').onkeyup();
    }

</script> 
      
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style type="text/css">
.divInfo {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	display: none;
	z-index: 3;
	overflow: auto;
	border: solid 2px #374BAE;
	background-color: #f0f1f6;
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
	border-color:#374BAE;
	background-color: #f0f1f6;
}


.body
{
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #DEE6EF;
	scrollbar-arrow-color: #374BAE;
	scrollbar-shadow-color: #f0f1f6;
	scrollbar-3dlight-color: #f0f1f6;
	scrollbar-highlight-color: #f0f1f6;
	scrollbar-darkshadow-color: #f0f1f6;
	overflow:hidden;
}

.textbox{ 
Font-size:10px; 
Font-family:Verdana; 
border-color:#374BAE;
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

.nounderline
{
text-decoration:none;
color:#374BAE;
}

.divDados{
width:600px;
height:14px;
font-size:11px;
font-weight:bold;
text-align:center;
color:#7089A2;
}

.divDetalhes2 {
	background-color:#f0f1f6;
	width:350px;
	height:50px;
	position:absolute;
	border-width:1px;
	border-color:#b4c7db;
	border-style:solid;
	display:none;
	z-index:3;
	margin: 0 auto;
}

</style>
    <title>MyIndaiá Web System - Version 2.01.00</title>
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script> 
</head>
<body  class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%;" onload="<% If Request("acao") = "lista" Then %>carregaLista();<%Else %>carregaDados();<%End If %>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td width="220" height="85" background="/imagens/lay_topo_bg.jpg"><img src="/imagens/lay_topo_logo.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/lay_topo_bg.jpg"><img src="../../imagens/cabec_logos_id2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
	<tr height="16" bgcolor="#58849F"><td width="100%" colspan="2" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#58849F', endColorStr='#f0f1f6', gradientType='0');">&nbsp;</td></tr>
    <tr height="14" bgcolor="#DBDADA"><td width="100%" colspan="2" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#f0f1f6', endColorStr='#f0f1f6', gradientType='0');" >&nbsp;</td></tr>
	</table><!--<div><img src="../../imagens/cabec_logos2.gif"/></div>-->   
    <form id="frmID" runat="server" style="background-color:#f0f1f6;height:100%;text-align:left;width:100%;text-align:center;margin-left:-710px">
    <div id="divEdita" style="height:100%;border-width:0px;position:absolute;top:128px;">
    <div id="divAtzFollowup" class="divDetalhes2"></div>
    <div id="divIDExterna" class="divDetalhes2">
    <div id="divTituloID" style="float:left;font-family:verdana;font-size:10pt;color:#7089A2;width:360px;">&nbsp;Selecione a planilha contendo os dados da ID:</div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaIDExterna();"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar"></a></div>    
    <br />
    <asp:FileUpload ID="fuIDExterna" runat="server" CssClass="textbox" Width="300px" BackColor="#DEE6EF" Height="18px" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Button ID="btnIDExterna" runat="server" Text="Enviar" CssClass="textbox" OnClick="EnviarArquivoIDExterna"  Width="55px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;"/><br /><br /> 
    </div>
    <div id="divData" class="divDetalhes2"></div> 
    <asp:FormView ID="frmEditaID" runat="server" DataKeyNames="ID_CODIGO" DataSourceID="SqlEditID" BorderWidth="0px" DefaultMode="Edit">
   <EmptyDataTemplate>
 <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f0f1f6;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeypress="if(event.keyCode == 13){findInPage(txtPesquisa.value);}"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>
    <div id="divInfoCorpo" class="divDetalhes"></div>    
    <div id="divListaIDCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaID" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Lista</a></center></div>
    <div id="divDadosIDCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosID" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;" id="divEditaID">
    <div id="divListaID" style="display:block;">
    <div style="float:left;width:175px">&nbsp;</div>
    <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">        
    <asp:ImageButton ID="ibNovaIDLista" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarID" style="cursor:pointer;" ToolTip="Criar ID"/>        
    <asp:ImageButton ID="ibCancelarIDLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarID" style="cursor:pointer;" Enabled ="false" ToolTip="Cancelar/Voltar"/>    
    <asp:ImageButton ID="ibSalvarIDLista" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirID" style="cursor:pointer;" Enabled ="false" ToolTip="Salvar"/>    
    <asp:ImageButton ID="ibExcluirIDLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirID" OnClientClick="return ExcluirID();" style="cursor:pointer;" Enabled ="false" ToolTip="Excluir"/>
    <%  If Not InStr("040;055;060;088;131", Session("cargo")) > 0 Then%>
    <img id="Img1" src="../../imagens/followup3_16d.gif" onclick="ExibeAtzFollowup('<%=Request.QueryString("id_codigo") %>');" style="cursor:pointer;" alt="Atualiza Follow-Up" disabled="true"/> 
    <%End If%>
    <img id="ibNovaIDExternaLista" src="../../imagens/novo3_16.gif" onclick="ExibeIDExterna();" style="cursor:pointer;" alt="Criar ID (Externa)"/> 
    </div>
    <div style="height:28px;width:650px;overflow:hidden;vertical-align:top;text-align:left;">
    <img id="imgBusca" src="../../imagens/icones/16x16/button_view20.gif" align="middle" /> 
    <asp:Label ID="lblBusca" runat="server" Text="Busca" Font-Names="Verdana" Font-Size="9pt" Font-Bold="False" Width="40px" CssClass="lbl" style="padding-top:2px;color:#374BAE;" />&nbsp;
    <asp:TextBox ID="txtIDBusca" runat="server" CssClass="textbox" Width="120px" Text="ID" BackColor="#FFFFFF"  onfocus="this.select();" style="color:#979090;" onKeyDown="this.style.color='#000000';" onKeyUp="alteraGrid(document.getElementById('frmEditaID_cbUltimos'),document.getElementById('frmEditaID_cbAutorizados'), this.value, document.getElementById('frmEditaID_txtCdResponsavel').value, document.getElementById('frmEditaID_txtEmbarque').value);" onBlur="if(this.value == ''){ this.style.color = '#979090';this.value = 'ID';}"/>&nbsp;
    <asp:TextBox ID="txtCdResponsavel" runat="server" CssClass="textbox" Width="290px" Text="Responsável (Desembaraço)" BackColor="#FFFFFF"  onfocus="this.select();" style="color:#979090;"  onKeyDown="this.style.color='#000000';" onKeyUp="alteraGrid(document.getElementById('frmEditaID_cbUltimos'),document.getElementById('frmEditaID_cbAutorizados'), document.getElementById('frmEditaID_txtIDBusca').value, document.getElementById('frmEditaID_txtCdResponsavel').value, document.getElementById('frmEditaID_txtEmbarque').value);" onBlur="if(this.value == ''){this.style.color = '#979090';this.value = 'Responsável (Desembaraço)';}"/>&nbsp;
    <asp:TextBox ID="txtEmbarque" runat="server" CssClass="textbox" Width="120px" Text="Embarque" BackColor="#FFFFFF"  onfocus="this.select();" style="color:#979090;" onKeyDown="this.style.color='#000000';" onKeyUp="alteraGrid(document.getElementById('frmEditaID_cbUltimos'),document.getElementById('frmEditaID_cbAutorizados'), document.getElementById('frmEditaID_txtIDBusca').value, document.getElementById('frmEditaID_txtCdResponsavel').value, this.value);" onBlur="if(this.value == ''){this.style.color = '#979090';this.value='Embarque';}"/>&nbsp;    
    <img id="imgLimpar" src="../../imagens/icones/16x16/chk_off.gif" alt="Limpar Todos" align="middle" style="cursor:pointer;" onclick="LimparTodos();" /> 
    </div>
    <div style="height:19px;width:650px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px">
    <table style="font-size:8pt;font-family:verdana;color:#FFFFFF;height:19px;BORDER-COLLAPSE:collapse;" bgcolor="#374BAE" cellpadding="4">
    <tr>
    <td style="width:110px;text-align:center;" >ID</td>
    <td style="width:80px;text-align:center;">Dt. Criação</td>
    <td style="width:100px;text-align:center;">Dt. Autorização</td>
    <td style="width:130px;text-align:center;">Autorizado por</td>
    <td style="width:90px;text-align:center;">Cliente</td>
    <td style="width:90px;text-align:center;">Ref. Indaiá</td>
    <td style="width:90px;text-align:center;">Embarque&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </table>
    </div>
    <div id="grdPrincipal" style="height:290px;width:650px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;text-align:left;">
        <asp:GridView ID="grdID" runat="server" DataSourceID="SqlID" 
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#DEE6EF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="Left"  RowStyle-HorizontalAlign="center"  DataKeyNames="ID_CODIGO" 
            Font-Size="7pt" Width="631px" ShowHeader="False">  
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#DEE6EF"/>
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhuma ID encontrada" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>          
<RowStyle HorizontalAlign="Center" Height="20px"></RowStyle>
            <Columns>
                 <asp:TemplateField HeaderText=" Instrução de Embarque " SortExpression="ID_CODIGO" ItemStyle-Width="88px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlid_codigo" runat="server" EnableTheming="True" 
                            Text='<%# Bind("ID_CODIGO") %>' Font-Names="verdana" 
                            NavigateUrl='<%# Eval("ID_CODIGO", "id_edita.aspx?acao=editar&id_codigo={0}") %>' class="nounderline" ItemStyle-Width="80px"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DT_CRIACAO" HeaderText=" Dt. Criação " SortExpression="DT_CRIACAO" ItemStyle-Width="70px"/>
                <asp:BoundField DataField="DT_AUTORIZACAO" HeaderText=" Dt. Autorização " SortExpression="DT_AUTORIZACAO" ItemStyle-Width="85px"/>
                <asp:BoundField DataField="NM_USUARIO_AUTORIZACAO" HeaderText=" Autorizado por " SortExpression="NM_USUARIO_AUTORIZACAO" ItemStyle-Width="105px"/>
                <asp:BoundField DataField="AP_EMPRESA" HeaderText=" Cliente " SortExpression="AP_EMPRESA" ItemStyle-Width="95px"/>
                <asp:TemplateField HeaderText=" Nr. Ref. Indaiá " SortExpression="NR_PROCESSO">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlProcesso" runat="server" EnableTheming="True" 
                            Text='<%# Bind("NR_PROCESSO") %>' Font-Names="verdana" 
                            NavigateUrl='<%# Eval("NR_PROCESSO2", "~/detalhe/imp_proc_result.asp?RadioGroup1=&StatusMenu=1&cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&tp_relat=2&filtro=nr_processo={0}") %>' class="nounderline" ItemStyle-Width="150px"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID_CLIENTE" HeaderText=" Cliente " SortExpression="ID_CLIENTE" ItemStyle-Width="50px"/>
            </Columns>
<AlternatingRowStyle BackColor="#DEE6EF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlID" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="" 
            ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
    </div>
    <div style="font-family:Verdana;font-size:10pt;height:20px;width:650px;text-align:right;vertical-align:bottom;">
    <asp:CheckBox ID="cbUltimos" runat="server" Text="Últimos 30 dias" onclick="alteraGrid(this,document.getElementById('frmEditaID_cbAutorizados'), document.getElementById('frmEditaID_txtIDBusca').value, document.getElementById('frmEditaID_txtCdResponsavel').value, document.getElementById('frmEditaID_txtEmbarque').value);" Checked="True"/>&nbsp;&nbsp;<asp:CheckBox ID="cbAutorizados" runat="server" Text="Exibir autorizados"  onclick="alteraGrid(document.getElementById('frmEditaID_cbUltimos'),this, document.getElementById('frmEditaID_txtIDBusca').value, document.getElementById('frmEditaID_txtCdResponsavel').value, document.getElementById('frmEditaID_txtEmbarque').value);"/>&nbsp;
    </div>
    </div>
    <div id="divDadosID" style="display:none;text-align:left;">
        <div style="float:left;width:400px">
        <asp:TextBox ID="txtIDCodigo" runat="server" CssClass="textbox" Width="120px" ReadOnly="true" Text='<%# Request("id_codigo") %>' BackColor="#DEE6EF" Height="20px" Font-Size="10pt" Visible="false"/>&nbsp;&nbsp;
        <a id="linkPlanilha" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;text-align:left;display:inline;" onclick="visualizaPlanilha();"><img id="imgPlanilha" src="../../imagens/icones/16x16/view1.gif" alt="Visualizar planilha" align="middle" style="cursor:pointer;border:0px;" /> Visualizar planilha</a>
        </div>
        <div style="height:30px;width:250px;overflow:hidden;top:0px;text-align:right;">        
        <asp:ImageButton ID="ibNovaID" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarID" style="cursor:pointer;" Enabled="false" ToolTip="Criar ID"/>                      
        <asp:ImageButton ID="ibCancelaID" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarID" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvaID" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirID" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarID();"/>    
        <asp:ImageButton ID="ibExcluiID" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirID" OnClientClick="return ExcluirID();" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        <%If Not InStr("040;055;060;088;131", Session("cargo")) > 0 Then%>
        <img id="ibAtzFollowupID" src="../../imagens/followup3_16d.gif" onclick="ExibeAtzFollowup('<%=Request.QueryString("id_codigo") %>');" style="cursor:pointer;" alt="Atualiza Follow-Up" disabled="true"/>         
        <%End If%>
        <img id="ibNovaIDExterna" src="../../imagens/novo3_16d.gif" onclick="ExibeIDExterna();" style="cursor:pointer;" alt="Criar ID (Externa)" disabled="true"/>    
        </div><br />   
        <asp:Label ID="lblImportador" runat="server" Text="Importador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdImportador" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_CLIENTE") %>' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaID_txtNmImportador');" MaxLength="5"/>        
        <asp:TextBox ID="txtNmImportador" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgImportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Empresas Nacionais','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC','id_consulta', 500, 300,7);"/><br /><br />
        <asp:Label ID="lblUsuario" runat="server" Text="Responsável (Desembaraço)" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdUsuario" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_RESPONSAVEL") %>' onBlur ="javascript:preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', this, 'frmEditaID_txtNmUsuario');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmUsuario" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgUsuario" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Usuários','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_USUARIO&nome=NM_USUARIO&tabela=TUSUARIO','id_consulta', 500, 300,-31);"/><br /><br />
        <asp:Label ID="lblEmbarcacao" runat="server" Text="Navio" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdEmbarcacao" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_EMBARCACAO") %>' onBlur ="javascript:preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', this, 'frmEditaID_txtNmEmbarcacao');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmEmbarcacao" runat="server" CssClass="textbox" Width="172px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgEmbarcacao" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Navios','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMBARCACAO&nome=NM_EMBARCACAO&tabela=TEMBARCACAO','id_consulta', 500, 300,-69);"/>&nbsp;&nbsp;
        <asp:Label ID="LlbModal" runat="server" Text="Modal" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="40px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdModal" runat="server" CssClass="textbox" Width="0px" Text='<%# Bind("CD_MODAL") %>' onBlur ="javascript:preencheNome('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE', this, 'frmEditaID_txtNmModal');VerificaModal(this);" MaxLength="2"/> 
        <asp:TextBox ID="txtNmModal" runat="server" CssClass="textbox" Width="121px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgModal" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Modal','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_VIA_TRANSPORTE&nome=NM_VIA_TRANSPORTE&tabela=TVIA_TRANSPORTE','id_consulta', 500, 213,-69);"/><br /><br />        
        <asp:Label ID="lblDtCriacao" runat="server" Text="Data Criação" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtDtCriacao" runat="server" CssClass="textbox" Width="85px" Text='<%# Right("00"+Date.Now.Day.ToString,2).ToString  & "/" & Right("00"+Date.Now.Month.ToString,2).ToString  & "/" & Date.Now.Year.ToString  %>' ReadOnly="true" BackColor="#DEE6EF"/>&nbsp;&nbsp;<asp:Label ID="lblResponsavel" runat="server" Text="Usuário" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="100px"/>&nbsp;        
        <asp:TextBox ID="txtNmUsuario2" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Session("nm_usuario") %>'/><asp:TextBox ID="txtCdUsuario2hidden" runat="server" CssClass="textbox" Width="0px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Session("usuario") %>'/><br /><br />
        <asp:Label ID="lblConhecimento" runat="server" Text="Nr. do BL" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrConhecimento" runat="server" CssClass="textbox" Width="302px" Text='<%# Bind("NR_CONHECIMENTO") %>'/>&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="cbAutorizado" runat="server" Font-Size="9pt" CssClass="lbl" onClick="alteraCheck(this);"/><asp:Label ID="lblAutorizado" runat="server" Text="Autorizado" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;<br /><br />
        <asp:Label ID="lblDtAutorizacao" runat="server" Text="Data Autorização" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtDtAutorizacao" runat="server" CssClass="textbox" Width="85px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("DT_AUTORIZACAO") %>'/>&nbsp;&nbsp;<asp:Label ID="lblAutorizacao" runat="server" Text="Autorizado por" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNmUsuario3" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("NM_USUARIO_AUTORIZACAO") %>'/><asp:TextBox ID="txtCdUsuario3hidden" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("CD_USUARIO_AUTORIZACAO") %>' Visible="false"/><br /><br />
        <asp:Label ID="lblObservacoes" runat="server" Text="Observações" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtObservacoes" runat="server" class="textbox" Width="447px" MaxLength="1750"  TextMode="MultiLine" Height="40px" style="overflow:auto;" Text='<%# Bind("TX_OBSERVACOES") %>'/><br /><br />
        <%  If Not InStr("040;055;060;088;131", Session("cargo")) > 0 Then%>
        <asp:FormView ID="frmEditaItemID" runat="server" DataSourceID="SqlEditItemID" BorderWidth="0px" DataKeyNames="ID_CODIGO,NM_ITEM, VL_ITEM" DefaultMode="Edit">
        <EmptyDataTemplate>        
        <div id="divListaIDItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDItem" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Itens de despesa</a></center></div>
        <div id="divDadosIDItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDItem" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDItem" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItemLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled="false" />    
        <asp:ImageButton ID="ibCancelarIDItemLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItemLista" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItemLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:200px;">Item</td>
            <td style="width:200px">Invoice</td>
            <td style="width:180px">Valor</td>
            <td style="width:20px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divGrdDespesaID" style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdItemID" runat="server" DataSourceID="SqlDespesasID"  DataKeyNames="ID_CODIGO, CD_DESPESA"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="NM_ITEM" HeaderText=" Item " SortExpression="NM_ITEM" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="NR_FATURA" HeaderText=" Invoice " SortExpression="NR_FATURA" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="VL_ITEM" HeaderText=" Valor " SortExpression="VL_ITEM" ItemStyle-Width="180px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif"  style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%Else %>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirDespesaID('<%# Eval("ID_CODIGO")%>','<%# Eval("NM_ITEM")%>','<%# Eval("CD_DESPESA")%>');" style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%End If%>                
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        <div style="text-align:right;width:580px;"><a id="aExcluirTodosDespesas" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;"  <% If Session("in_autorizado") = "1" Then%>disabled="true"<%Else%>onclick="javascript:excluirDespesaID('<%=Request.QueryString("ID_CODIGO")%>','X#','','');"<%End If%>><img src="../../imagens/icones/16x16/btn_deleteall1<% If Session("in_autorizado") = "1" Then%>2<%End If%>.gif" alt="Excluir todas as despesas" align="middle" style="cursor:pointer;" /> Excluir todas as despesas</a></div>
        </div> 
        <div id="divDadosIDItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItem" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar item" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDItem" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar" Enabled="false" />    
        <asp:ImageButton ID="ibSalvarIDItem" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;" ToolTip="Salvar" Enabled="false" />    
        <asp:ImageButton ID="ibExcluirIDItem" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" ToolTip="Excluir" Enabled="false" />
        </div><br /> 
        <asp:Label ID="lblNmItem" runat="server" Text="Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtNmItem" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NM_ITEM") %>'/><asp:TextBox ID="txtNmItemHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NM_ITEM") %>'/>&nbsp;&nbsp;
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlInvoice" runat="server" class="textbox" Width="125px"  style="text-transform:uppercase;vertical-align:top;" DataSouceID="SqlInvoice" DataTextField="NR_FATURA" DataValueField="NR_FATURA" DataSourceID="SqlInvoice" />
        <asp:SqlDataSource ID="SqlInvoice" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
        SelectCommand="SELECT '' AS NR_FATURA UNION SELECT DISTINCT POI.NR_FATURA AS NR_FATURA FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) INNER JOIN TPO_ITEM POI ON POI.NR_PROCESSO = IDP.NR_REFERENCIA WHERE ID_CODIGO = @ID_CODIGO AND POI.CD_EMPRESA = @CD_EMPRESA AND POI.NR_FATURA IS NOT NULL">
        <SelectParameters>
        <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
        <asp:ControlParameter Name="CD_EMPRESA" ControlID="txtCdImportador" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblValor" runat="server" Text="Valor" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtValor" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("VL_ITEM") %>' onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/><asp:TextBox ID="txtValorHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("VL_ITEM") %>'/>&nbsp;&nbsp;   
        </div>               
    </div>
    </EmptyDataTemplate>
    <EditItemTemplate>
        <div id="divListaIDItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDItem" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Itens de despesa</a></center></div>
        <div id="divDadosIDItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDItem" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDItem" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItemLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDItemLista" runat="server" ImageUrl="../../imagens/cancelar2d_16.gif" OnClick="CancelarIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItemLista" runat="server" ImageUrl="../../imagens/salvar2d_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItemLista" runat="server" ImageUrl="../../imagens/excluir2d_16.gif" style="cursor:pointer;" ToolTip="Excluir" Enabled="false" />
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:200px;">Item</td>
            <td style="width:200px">Invoice</td>
            <td style="width:180px">Valor</td>
            <td style="width:20px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divGrdDespesaID" style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdItemID" runat="server" DataSourceID="SqlDespesasID"  DataKeyNames="ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="NM_ITEM" HeaderText=" Valor " SortExpression="NM_ITEM" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="NR_FATURA" HeaderText=" Invoice " SortExpression="NR_FATURA" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="VL_ITEM" HeaderText=" Valor " SortExpression="VL_ITEM" ItemStyle-Width="180px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif"  style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%Else %>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirDespesaID('<%# Eval("ID_CODIGO")%>','<%# Eval("NM_ITEM")%>','<%# Eval("CD_DESPESA")%>');" style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%End If%>                
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        <div style="text-align:right;width:580px;"><a id="aExcluirTodosDespesas" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;"  <% If Session("in_autorizado") = "1" Then%>disabled="true"<%Else%>onclick="javascript:excluirDespesaID('<%=Request.QueryString("ID_CODIGO")%>','X#','','');"<%End If%>><img src="../../imagens/icones/16x16/btn_deleteall1<% If Session("in_autorizado") = "1" Then%>2<%End If%>.gif" alt="Excluir todas as despesas" align="middle" style="cursor:pointer;" /> Excluir todas as despesas</a></div>
        </div> 
        <div id="divDadosIDItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItem" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar item" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDItem" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar" Enabled="false" />    
        <asp:ImageButton ID="ibSalvarIDItem" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;"  ToolTip="Salvar" Enabled="false" />    
        <asp:ImageButton ID="ibExcluirIDItem" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" ToolTip="Excluir" Enabled="false" />
        </div><br /> 
        <asp:Label ID="lblNmItem" runat="server" Text="Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtNmItem" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NM_ITEM") %>'/><asp:TextBox ID="txtNmItemHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NM_ITEM") %>'/>&nbsp;&nbsp;
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlInvoice" runat="server" class="textbox" Width="125px"  style="text-transform:uppercase;" DataSouceID="SqlInvoice" DataTextField="NR_FATURA" DataValueField="NR_FATURA" DataSourceID="SqlInvoice" SelectedValue='<%# Session("NR_FATURA") %>'/>
        <asp:SqlDataSource ID="SqlInvoice" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
        SelectCommand="SELECT '' AS NR_FATURA UNION SELECT DISTINCT POI.NR_FATURA AS NR_FATURA FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) INNER JOIN TPO_ITEM POI ON POI.NR_PROCESSO = IDP.NR_REFERENCIA WHERE ID_CODIGO = @ID_CODIGO AND POI.CD_EMPRESA = @CD_EMPRESA AND POI.NR_FATURA IS NOT NULL">
        <SelectParameters>
        <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
        <asp:ControlParameter Name="CD_EMPRESA" ControlID="txtCdImportador" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblValor" runat="server" Text="Valor" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtValor" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("VL_ITEM") %>' onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/><asp:TextBox ID="txtValorHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("VL_ITEM") %>'/>&nbsp;&nbsp;   
        </div>       
    </div>
    </EditItemTemplate>
    </asp:FormView>
    <br />
    <%End If %>
    <asp:FormView ID="frmEditaPedidoID" runat="server" DataSourceID="SqlEditPedidoID" BorderWidth="0px" DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL" DefaultMode="Edit">
        <EmptyDataTemplate>
        <div id="divListaIDPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDPedido" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Pedidos</a></center></div>
        <div id="divDadosIDPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDPedido" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDPedido" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDPedidoLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false" />    
        <asp:ImageButton ID="ibCancelarIDPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:140px;">Pedido</td>
            <td style="width:80px">Item</td>
            <td style="width:80px">Parcial</td>
            <td style="width:120px">Qtde. Embarcada</td>
            <td style="width:120px">Total</td>
            <td style="width:40px">&nbsp;</td>
            </tr></table>
        </div>
        <div style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdPedidoID" runat="server" DataSourceID="SqlPedidoID"  DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum pedido foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Pedido " SortExpression="NM_ITEM" ItemStyle-Width="135px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','');" target="_blank"><%# Eval("NR_REFERENCIA")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Item " SortExpression="NR_ITEM" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','<%# Eval("NR_ITEM_PO")%>');" target="_blank"><%# Eval("NR_ITEM_PO")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NR_PARCIAL" HeaderText=" Parcial " SortExpression="NR_PARCIAL" ItemStyle-Width="80px"/>                
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Embarcada " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:BoundField DataField="VL_TOTAL" HeaderText=" Total " SortExpression="VL_TOTAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif"  style="cursor:pointer;" alt="Excluir Pedido"/> 
                <%Else %>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirPedidoID('<%# Eval("ID_CODIGO")%>','<%# Eval("NR_REFERENCIA")%>','<%# Eval("NR_ITEM_PO")%>','<%# Eval("NR_PARCIAL")%>');" style="cursor:pointer;" alt="Excluir Pedido"/> 
                <%End If%>                
                </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        </div> 
        <div id="divDadosIDPedido" style="display:none;">
        </div>       
    </div>
    </EmptyDataTemplate>
    <EditItemTemplate>
        <div id="divListaIDPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDPedido" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Pedidos</a></center></div>
        <div id="divDadosIDPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDPedido" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDPedido" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDPedidoLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" ToolTip="Excluir" Enabled="false" />
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:140px;">Pedido</td>
            <td style="width:80px">Item</td>
            <td style="width:80px">Parcial</td>
            <td style="width:120px">Qtde. Embarcada</td>
            <td style="width:120px">Total</td>
            <td style="width:40px">&nbsp;</td>
            </tr></table>
        </div>
        <div style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdPedidoID" runat="server" DataSourceID="SqlPedidoID"  DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Pedido " SortExpression="NM_ITEM" ItemStyle-Width="135px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','');" target="_blank"><%# Eval("NR_REFERENCIA")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Item " SortExpression="NR_ITEM" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','<%# Eval("NR_ITEM_PO")%>');" target="_blank"><%# Eval("NR_ITEM_PO")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NR_PARCIAL" HeaderText=" Parcial " SortExpression="NR_PARCIAL" ItemStyle-Width="80px"/>                
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Embarcada " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:BoundField DataField="VL_TOTAL" HeaderText=" Total " SortExpression="VL_TOTAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                <img src="../../imagens/icones/16x16/chk_off2.gif"style="cursor:pointer;" alt="Excluir Pedido"/> 
                <%Else%>
                <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirPedidoID('<%# Eval("ID_CODIGO")%>','<%# Eval("NR_REFERENCIA")%>','<%# Eval("NR_ITEM_PO")%>','<%# Eval("NR_PARCIAL")%>');" style="cursor:pointer;" alt="Excluir Pedido"/> 
                <%End If%>
                </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        </div> 
        <div id="divDadosIDPedido" style="display:none;">
        </div>       
    </div>
    </EditItemTemplate>
    </asp:FormView>
    <br />
    <div style="background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:180px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center>Upload de Arquivos</center></div>
    <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:left;">       
    <asp:FileUpload ID="fuArquivos" runat="server" CssClass="textbox" Width="533px" BackColor="#DEE6EF" Height="18px" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Button ID="btnArquivos" runat="server" Text="Enviar" CssClass="textbox" OnClick="EnviarArquivoID"  Width="55px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;" Enabled="false"/><br /><br />
    <asp:Label ID="lblTpArquivo" runat="server" Text="Tipo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlTpArquivo" runat="server" class="textbox" Width="522px"  style="text-transform:uppercase;" DataSouceID="SqlTpArquivo" DataTextField="NM_TIPO_DOCTO" DataValueField="CD_TIPO_DOCTO" DataSourceID="SqlTpArquivo"/>
    <asp:SqlDataSource ID="SqlTpArquivo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT CD_TIPO_DOCTO, NM_TIPO_DOCTO FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) WHERE ID_TABELA = 1225680060 AND CD_PRODUTO IN ('01', 'AM')"/><br /><br />
    <asp:Label ID="lblArquivo" runat="server" Text="Descrição" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtArquivo" runat="server" class="textbox" Width="522px" MaxLength="1750"  TextMode="MultiLine" Height="40px" style="overflow:auto;"/><br /><br />
    <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:180px;">Arquivo</td>
            <td style="width:180px">Tipo</td>
            <td style="width:180px">Data</td>
             <td style="width:40px"></td>
            </tr></table>
        </div>
        <div style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum arquivo foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
        </div>
    </div>      
            <asp:SqlDataSource ID="SqlPedidoID" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT DISTINCT P.NR_PROCESSO, IP.ID_CODIGO, IP.NR_REFERENCIA, IP.NR_ITEM_PO, IP.NR_PARCIAL, POI.QT_INICIAL, POI.VL_TOTAL 
            FROM TINSTRUCAO_DESEMBARACO_PEDIDO IP (NOLOCK) 
            INNER JOIN TINSTRUCAO_DESEMBARACO ID (NOLOCK) ON IP.ID_CODIGO = ID.ID_CODIGO
            INNER JOIN TPROCESSO P  (NOLOCK) ON P.NR_REFERENCIA = IP.NR_REFERENCIA AND P.CD_CLIENTE = ID.CD_CLIENTE
            INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = IP.NR_REFERENCIA 
                                            AND POI.NR_ITEM_CLIENTE = IP.NR_ITEM_PO
                                            AND POI.NR_PARCIAL = IP.NR_PARCIAL
            WHERE IP.ID_CODIGO = @ID_CODIGO 
              AND P.IN_CANCELADO = '0'" 
            ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
            </SelectParameters>
        </asp:SqlDataSource> 
        <asp:SqlDataSource ID="SqlDespesasID" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT ID_CODIGO, ISNULL(UPPER(NM_ITEM),'') AS NM_ITEM, ISNULL(NR_FATURA,'') AS NR_FATURA, ISNULL(VL_ITEM,'') AS VL_ITEM, CD_DESPESA FROM TINSTRUCAO_DESEMBARACO_DESPESAS (NOLOCK) WHERE ID_CODIGO = @ID_CODIGO" 
            ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
            </SelectParameters>
        </asp:SqlDataSource>                         
    </EmptyDataTemplate>
    <EditItemTemplate>
    <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f0f1f6;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeypress="if(event.keyCode == 13){findInPage(txtPesquisa.value);}"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>
    <div id="divInfoCorpo" class="divDetalhes"></div>    
    <div id="divListaIDCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaID" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Lista</a></center></div>
    <div id="divDadosIDCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosID" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;" id="divEditaID">
    <div id="divListaID" style="display:block;">   
    <asp:SqlDataSource ID="SqlID" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="" 
            ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource> 
    </div>
    <div id="divDadosID" style="display:none;text-align:left;">
        <div style="float:left;width:400px">
        <asp:TextBox ID="txtIDCodigo" runat="server" CssClass="textbox" Width="120px" ReadOnly="true" Text='<%# Bind("ID_CODIGO") %>' BackColor="#DEE6EF" Height="20px" Font-Size="10pt"/>&nbsp;&nbsp;
        <a id="linkPlanilha" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;text-align:left;display:inline;" onclick="visualizaPlanilha();"><img id="imgPlanilha" src="../../imagens/icones/16x16/view1.gif" alt="Visualizar planilha" align="middle" style="cursor:pointer;border:0px;" /> Visualizar planilha</a>
        </div>
        <div style="height:30px;width:250px;overflow:hidden;top:0px;text-align:right;">        
        <asp:ImageButton ID="ibNovaID" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarID" style="cursor:pointer;" Enabled="false" ToolTip="Criar ID"/>            
        <asp:ImageButton ID="ibCancelaID" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarID" style="cursor:pointer;"  ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvaID" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="SalvarID" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarID();"/>    
        <%If Session("in_autorizado") = "1" Then%>
        <asp:ImageButton ID="ibExcluiIDd" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirID" OnClientClick="return ExcluirID();" style="cursor:pointer;"  ToolTip="Excluir" Enabled="False"/>
        <%Else%>
        <asp:ImageButton ID="ibExcluiID" runat="server" ImageUrl="../../imagens/excluir2_16.gif" OnClick="ExcluirID" OnClientClick="return ExcluirID();" style="cursor:pointer;"  ToolTip="Excluir"/>
        <%End If%>
        <%If Not InStr("040;055;060;088;131", Session("cargo")) > 0 Then%>
        <img id="ibAtzFollowupID" src="../../imagens/followup3_16.gif" onclick="ExibeAtzFollowup('<%=Request.QueryString("id_codigo") %>');" style="cursor:pointer;" alt="Atualiza Follow-Up"/>        
        <%End If %>
        <img id="ibNovaIDExterna" src="../../imagens/novo3_16d.gif" onclick="ExibeIDExterna();" style="cursor:pointer;" alt="Criar ID (Externa)" disabled="true"/> 
        </div><br />   
        <asp:Label ID="lblImportador" runat="server" Text="Importador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdImportador" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_CLIENTE") %>' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaID_txtNmImportador');" MaxLength="5" onkeydown=""/>        
        <asp:TextBox ID="txtNmImportador" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgImportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Empresas Nacionais','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC','id_consulta', 500, 300,7);"/><br /><br />
        <asp:Label ID="lblUsuario" runat="server" Text="Responsável (Desembaraço)" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdUsuario" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_RESPONSAVEL") %>' onBlur ="javascript:preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', this, 'frmEditaID_txtNmUsuario');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmUsuario" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgUsuario" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Usuários','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_USUARIO&nome=NM_USUARIO&tabela=TUSUARIO','id_consulta', 500, 300,-31);"/><br /><br />
        <asp:Label ID="lblEmbarcacao" runat="server" Text="Navio" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdEmbarcacao" runat="server" CssClass="textbox" Width="50px" Text='<%# Bind("CD_EMBARCACAO") %>' onBlur ="javascript:preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', this, 'frmEditaID_txtNmEmbarcacao');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmEmbarcacao" runat="server" CssClass="textbox" Width="172px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgEmbarcacao" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Navios','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMBARCACAO&nome=NM_EMBARCACAO&tabela=TEMBARCACAO','id_consulta', 500, 300,-69);"/>&nbsp;&nbsp;
        <asp:Label ID="LlbModal" runat="server" Text="Modal" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="40px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdModal" runat="server" CssClass="textbox" Width="0px" Text='<%# Bind("CD_MODAL") %>' onBlur ="javascript:preencheNome('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE', this, 'frmEditaID_txtNmModal');VerificaModal(this);" MaxLength="2"/> 
        <asp:TextBox ID="txtNmModal" runat="server" CssClass="textbox" Width="121px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgModal" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Modal','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_VIA_TRANSPORTE&nome=NM_VIA_TRANSPORTE&tabela=TVIA_TRANSPORTE','id_consulta', 500, 213,-69);"/><br /><br />   
        <asp:Label ID="lblDtCriacao" runat="server" Text="Data Criação" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtDtCriacao" runat="server" CssClass="textbox" Width="85px" Text='<%# Bind("DT_CRIACAO")  %>' ReadOnly="true" BackColor="#DEE6EF"/>&nbsp;&nbsp;<asp:Label ID="lblResponsavel" runat="server" Text="Usuário" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="100px"/>&nbsp;        
        <asp:TextBox ID="txtNmUsuario2" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("NM_USUARIO_CRIACAO")  %>'/><asp:TextBox ID="txtCdUsuario2hidden" runat="server" CssClass="textbox" Width="0px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("CD_USUARIO_CRIACAO") %>'/><br /><br />
        <asp:Label ID="lblConhecimento" runat="server" Text="Nr. do BL" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrConhecimento" runat="server" CssClass="textbox" Width="302px" Text='<%# Bind("NR_CONHECIMENTO") %>'/>&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="cbAutorizado" runat="server" Font-Size="9pt" CssClass="lbl" onClick="alteraCheck(this);" Checked='<%# Container.DataItem("IN_AUTORIZADO") %>'/><asp:Label ID="lblAutorizado" runat="server" Text="Autorizado" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;<br /><br />
        <asp:Label ID="lblDtAutorizacao" runat="server" Text="Data Autorização" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtDtAutorizacao" runat="server" CssClass="textbox" Width="85px" Text='<%# Bind("DT_AUTORIZACAO")  %>' ReadOnly="true" BackColor="#DEE6EF"/>&nbsp;&nbsp;<asp:Label ID="lblAutorizacao" runat="server" Text="Autorizado por" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNmUsuario3" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("NM_USUARIO_AUTORIZACAO") %>'/><asp:TextBox ID="txtCdUsuario3hidden" runat="server" CssClass="textbox" Width="246px" ReadOnly="true" BackColor="#DEE6EF" Text='<%# Bind("CD_USUARIO_AUTORIZACAO") %>' Visible="false"/><br /><br />
        <asp:Label ID="lblObservacoes" runat="server" Text="Observações" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="195px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtObservacoes" runat="server" class="textbox" Width="447px" MaxLength="1750"  TextMode="MultiLine" Height="40px" style="overflow:auto;" Text='<%# Bind("TX_OBSERVACOES") %>'/><br /><br />
        <%  If Not InStr("040;055;060;088;131", Session("cargo")) > 0 Then%>
        <asp:FormView ID="frmEditaItemID" runat="server" DataSourceID="SqlEditItemID" BorderWidth="0px" DataKeyNames="ID_CODIGO,NM_ITEM, VL_ITEM" DefaultMode="Edit">
        <EmptyDataTemplate>
        <div id="divListaIDItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDItem" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Itens de despesa</a></center></div>
        <div id="divDadosIDItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDItem" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDItem" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <% If Session("in_autorizado") = "1" Then%>
        <asp:ImageButton ID="ibNovaIDItemLista1" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled="false"/>    
        <%Else%>
        <asp:ImageButton ID="ibNovaIDItemLista2" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item"/>    
        <%End If%>
        <asp:ImageButton ID="ibCancelarIDItemLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItemLista" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItemLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:200px;">Item</td>
            <td style="width:200px">Invoice</td>
            <td style="width:180px">Valor</td>
            <td style="width:20px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divGrdDespesaID" style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdItemID" runat="server" DataSourceID="SqlDespesasID" DataKeyNames="ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="NM_ITEM" HeaderText=" Valor " SortExpression="NM_ITEM" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="NR_FATURA" HeaderText=" Invoice " SortExpression="NR_FATURA" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="VL_ITEM" HeaderText=" Valor " SortExpression="VL_ITEM" ItemStyle-Width="180px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif"  style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%Else %>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirDespesaID('<%# Eval("ID_CODIGO")%>','<%# Eval("NM_ITEM")%>','<%# Eval("CD_DESPESA")%>');" style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%End If%>                
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        <div style="text-align:right;width:580px;"><a id="aExcluirTodosDespesas" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;"  <% If Session("in_autorizado") = "1" Then%>disabled="true"<%Else%>onclick="javascript:excluirDespesaID('<%=Request.QueryString("ID_CODIGO")%>','X#','','');"<%End If%>><img src="../../imagens/icones/16x16/btn_deleteall1<% If Session("in_autorizado") = "1" Then%>2<%End If%>.gif" alt="Excluir todas as despesas" align="middle" style="cursor:pointer;" /> Excluir todas as despesas</a></div>
        </div> 
        <div id="divDadosIDItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItem" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDItem" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarIDItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItem" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirIDItem" style="cursor:pointer;" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItem" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" ToolTip="Excluir"/>
        </div><br /> 
        <asp:Label ID="lblNmItem" runat="server" Text="Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtNmItem" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NM_ITEM") %>'/><asp:TextBox ID="txtNmItemHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NM_ITEM") %>'/>&nbsp;&nbsp;
       <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlInvoice" runat="server" class="textbox" Width="125px"  style="text-transform:uppercase;" DataSouceID="SqlInvoice" DataTextField="NR_FATURA" DataValueField="NR_FATURA" DataSourceID="SqlInvoice"/>
        <asp:SqlDataSource ID="SqlInvoice" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
        SelectCommand="SELECT '' AS NR_FATURA UNION SELECT DISTINCT POI.NR_FATURA AS NR_FATURA FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP  (NOLOCK) INNER JOIN TPO_ITEM POI ON POI.NR_PROCESSO = IDP.NR_REFERENCIA WHERE ID_CODIGO = @ID_CODIGO AND POI.CD_EMPRESA = @CD_EMPRESA AND POI.NR_FATURA IS NOT NULL">
        <SelectParameters>
        <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
        <asp:ControlParameter Name="CD_EMPRESA" ControlID="txtCdImportador" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txtInvoiceHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_FATURA") %>'/>&nbsp;&nbsp;      
        <asp:Label ID="lblValor" runat="server" Text="Valor" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtValor" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("VL_ITEM") %>' onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/><asp:TextBox ID="txtValorHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("VL_ITEM") %>'/>&nbsp;&nbsp;   
        </div>       
    </div>
    </EmptyDataTemplate>
    <EditItemTemplate>
        <div id="divListaIDItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDItem" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Itens de despesa</a></center></div>
        <div id="divDadosIDItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDItem" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDItem" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <% If Session("in_autorizado") = "1" Then%>
        <asp:ImageButton ID="ibNovaIDItemLista1" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDitem" style="cursor:pointer;" ToolTip="Criar item" Enabled="False"/>    
        <% Else%>
        <asp:ImageButton ID="ibNovaIDItemLista2" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDitem" style="cursor:pointer;" ToolTip="Criar item"/>    
        <%End If%>
        <asp:ImageButton ID="ibCancelarIDItemLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItemLista" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItemLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:200px;">Item</td>
            <td style="width:200px">Invoice</td>
            <td style="width:180px">Valor</td>
            <td style="width:20px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divGrdDespesaID" style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdItemID" runat="server" DataSourceID="SqlDespesasID" DataKeyNames="ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="25px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="NM_ITEM" HeaderText="Item " SortExpression="NM_ITEM" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="NR_FATURA" HeaderText="Invoice " SortExpression="NR_FATURA" ItemStyle-Width="200px"/>
                <asp:BoundField DataField="VL_ITEM" HeaderText="Valor " SortExpression="VL_ITEM" ItemStyle-Width="180px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif"  style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%Else %>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirDespesaID('<%# Eval("ID_CODIGO")%>','<%# Eval("NM_ITEM")%>','<%# Eval("CD_DESPESA")%>');" style="cursor:pointer;" alt="Excluir Despesa"/> 
                <%End If%>                
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        <div style="text-align:right;width:580px;"><a id="aExcluirTodosDespesas" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;"  <% If Session("in_autorizado") = "1" Then%>disabled="true"<%Else%>onclick="javascript:excluirDespesaID('<%=Request.QueryString("ID_CODIGO")%>','X#','','');"<%End If%>><img src="../../imagens/icones/16x16/btn_deleteall1<% If Session("in_autorizado") = "1" Then%>2<%End If%>.gif" alt="Excluir todas as despesas" align="middle" style="cursor:pointer;" /> Excluir todas as despesas</a></div>
        </div> 
        <div id="divDadosIDItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDItem" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDItem" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarIDItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarIDItem" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirIDItem" style="cursor:pointer;" ToolTip="Salvar"/>    
        <asp:ImageButton ID="ibExcluirIDItem" runat="server" ImageUrl="../../imagens/excluir2_16.gif" style="cursor:pointer;" ToolTip="Excluir" />
        </div><br /> 
        <asp:Label ID="lblNmItem" runat="server" Text="Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtNmItem" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NM_ITEM") %>'/><asp:TextBox ID="txtNmItemHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NM_ITEM") %>'/>&nbsp;&nbsp;
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlInvoice" runat="server" class="textbox" Width="125px"  style="text-transform:uppercase;" DataSouceID="SqlInvoice" DataTextField="NR_FATURA" DataValueField="NR_FATURA" DataSourceID="SqlInvoice" SelectedValue='<%# Session("NR_FATURA") %>'/>
        <asp:SqlDataSource ID="SqlInvoice" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
        SelectCommand="SELECT '' AS NR_FATURA UNION SELECT DISTINCT POI.NR_FATURA AS NR_FATURA FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) INNER JOIN TPO_ITEM POI ON POI.NR_PROCESSO = IDP.NR_REFERENCIA WHERE ID_CODIGO = @ID_CODIGO AND POI.CD_EMPRESA = @CD_EMPRESA AND POI.NR_FATURA IS NOT NULL">
        <SelectParameters>
        <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
        <asp:ControlParameter Name="CD_EMPRESA" ControlID="txtCdImportador" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txtInvoiceHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_FATURA") %>'/>&nbsp;&nbsp;      
        <asp:Label ID="lblValor" runat="server" Text="Valor" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtValor" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("VL_ITEM") %>' onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/><asp:TextBox ID="txtValorHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("VL_ITEM") %>'/>&nbsp;&nbsp;   
        </div>       
    </div>
    </EditItemTemplate>
    </asp:FormView>
    <br />
     <%End If %>
     <asp:FormView ID="frmEditaPedidoID" runat="server" DataSourceID="SqlEditPedidoID" BorderWidth="0px" DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL" DefaultMode="Edit">
        <EmptyDataTemplate>
        <div id="divListaIDPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDPedido" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Pedidos</a></center></div>
        <div id="divDadosIDPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDPedido" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDPedido" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <% If Session("in_autorizado") = "1" Then%>
        <asp:ImageButton ID="ibNovaIDPedidoLista1" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false"/>    
        <%Else%>
        <asp:ImageButton ID="ibNovaIDPedidoLista2" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido"/>    
        <%End If%>
        <asp:ImageButton ID="ibCancelarIDPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:140px;">Pedido</td>
            <td style="width:80px">Item</td>
            <td style="width:80px">Parcial</td>
            <td style="width:120px">Qtde. Embarcada</td>
            <td style="width:120px">Total</td>
            <td style="width:40px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divGrdPedidoID" style="height:120px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;text-align:left;">
        <asp:GridView ID="grdPedidoID" runat="server" DataSourceID="SqlPedidoID"  DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="Left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum pedido foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Pedido " SortExpression="NM_ITEM" ItemStyle-Width="135px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','');" target="_blank"><%# Eval("NR_REFERENCIA")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Item " SortExpression="NR_ITEM" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','<%# Eval("NR_ITEM_PO")%>');" target="_blank"><%# Eval("NR_ITEM_PO")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NR_PARCIAL" HeaderText=" Parcial " SortExpression="NR_PARCIAL" ItemStyle-Width="80px"/>                
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Embarcada " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:BoundField DataField="VL_TOTAL" HeaderText=" Total " SortExpression="VL_TOTAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <% If Session("in_autorizado") = "1" Then%>
                    <img src="../../imagens/icones/16x16/chk_off2.gif" style="cursor:pointer;" alt="Excluir Pedido"/>
                <%Else %>
                    <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirPedidoID('<%# Eval("ID_CODIGO")%>','<%# Eval("NR_REFERENCIA")%>','<%# Eval("NR_ITEM_PO")%>','<%# Eval("NR_PARCIAL")%>');" style="cursor:pointer;" alt="Excluir Pedido"/>                 
                <%End If %>
                </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        <div style="text-align:right;width:580px;"><a id="aExcluirTodos" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;"  <% If Session("in_autorizado") = "1" Then%>disabled="true"<%Else%>onclick="javascript:excluirPedidoID('<%=Request.QueryString("ID_CODIGO")%>','X','','');"<%End If%>><img src="../../imagens/icones/16x16/btn_deleteall1<% If Session("in_autorizado") = "1" Then%>2<%End If%>.gif" alt="Excluir todos os pedidos" align="middle" style="cursor:pointer;" /> Excluir todos os pedidos</a></div>
        </div> 
        <div id="divDadosIDPedido" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDPedido" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDPedido" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedido1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDPedido" style="cursor:pointer;" ToolTip="Salvar" Enabled="false"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedido2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" ToolTip="Salvar" Enabled="false"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedido" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" ToolTip="Excluir" Enabled="false"/>
        </div>
        <div style="width:600px;text-align:left;">
        <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtPesqPedido" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NR_REFERENCIA") %>' onblur="carregaPedidoID(this.value, document.getElementById('frmEditaID_txtCdImportador').value, document.getElementById('frmEditaID_txtIDCodigo').value, document.getElementById('frmEditaID_txtNrConhecimento').value, document.getElementById('frmEditaID_txtCdEmbarcacao').value)" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Pedidos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_cliente='+document.getElementById('frmEditaID_txtCdImportador').value+'&id_codigo='+document.getElementById('frmEditaID_txtIDCodigo').value+'&cd_usuario_criacao='+document.getElementById('frmEditaID_txtCdUsuario2hidden').value+'&codigo=NR_REFERENCIA','combo_pedido', 500, 200,5);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a id="linkTodosPedido" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;text-align:left;display:inline;" onclick="incluirPedidoId(document.getElementById('frmEditaID_frmEditaPedidoID_txtPesqPedido').value,document.getElementById('frmEditaID_txtCdImportador').value,'','',document.getElementById('frmEditaID_txtIDCodigo').value,document.getElementById('frmEditaID_txtNrConhecimento').value,document.getElementById('frmEditaID_txtCdEmbarcacao').value)"><img id="imgTodos" src="../../imagens/icones/16x16/add.gif" alt="Adicionar Pedido/Item/Parcial" align="middle" style="cursor:pointer;" /> Incluir todos os itens deste pedido</a><a id="linkTodosPedidoFalso" class="nounderline" style="font-family:verdana;font-size:9pt;cursor:pointer;text-align:left;display:none;" disabled="true"><img id="imgTodosFalso" src="../../imagens/icones/16x16/add2.gif" alt="Adicionar Pedido/Item/Parcial" align="middle" style="cursor:pointer;" /> Incluir todos os itens deste pedido</a>
        <asp:TextBox ID="txtPedidoHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_REFERENCIA") %>'/><br /><br />
        </div>
        <div style="height:20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px">
        <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4">
        <tr><td style="width:100px;text-align:center;">Item</td>
        <td style="width:20px;text-align:center;">Parcial</td>
        <td style="width:130px;text-align:center;">Qtde. Disponível</td>
        <td style="width:65px;text-align:center;">Un. Med.</td>
        <td style="width:280px;text-align:center;">Mercadoria</td>
        <td style="width:16px;text-align:center;">&nbsp;</td>
        </tr></table>
        </div>
        <div id="divgrdPedido" style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;text-align:left;">
        <asp:GridView ID="grdPedido" runat="server" DataSourceID="SqlID" 
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#DEE6EF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="Left"  DataKeyNames="ID_CODIGO" 
            Font-Size="7pt" Width="581px" ShowHeader="False">  
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item encontrado" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>          
<RowStyle HorizontalAlign="Center" Height="20px"></RowStyle>
            <Columns>
            <asp:BoundField DataField="NR_ITEM_CLIENTE" HeaderText=" Dt. Criação " SortExpression="NR_ITEM_CLIENTE" ItemStyle-Width="85px"/>
            <asp:BoundField DataField="NR_PARCIAL" HeaderText=" Dt. Criação " SortExpression="NR_PARCIAL" ItemStyle-Width="85px"/>
            <asp:BoundField DataField="NM_SIGLA" HeaderText=" Dt. Autorização " SortExpression="NM_SIGLA" ItemStyle-Width="95px"/>
            <asp:BoundField DataField="NM_USUARIO_AUTORIZACAO" HeaderText=" Autorizado por " SortExpression="NM_USUARIO_AUTORIZACAO" ItemStyle-Width="125px"/>
            <asp:BoundField DataField="AP_MERCADORIA" HeaderText=" Cliente " SortExpression="AP_MERCADORIA" ItemStyle-Width="95px"/>
            </Columns>
<AlternatingRowStyle BackColor="#DEE6EF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlID" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT A.NR_PROCESSO, A.CD_EMPRESA, A.NR_ITEM_CLIENTE, A.NR_PARCIAL, A.QT_INICIAL,
            A.CD_UNID_MEDIDA, A.NR_FATURA, B.NM_SIGLA, A.CD_MERCADORIA, C.AP_MERCADORIA
            FROM TPO_ITEM A  (NOLOCK)
               LEFT JOIN TUNID_MEDIDA_BROKER B  (NOLOCK) ON B.CD_UNID_MEDIDA = A.CD_UNID_MEDIDA
               INNER JOIN TMERCADORIA C  (NOLOCK) ON C.CD_MERCADORIA = A.CD_MERCADORIA
               INNER JOIN TESTAGIO_PROCESSO D ON D.NR_REFERENCIA   = A.NR_PROCESSO
                                             AND D.CD_EMPRESA      = A.CD_EMPRESA
                                             AND D.NR_ITEM_CLIENTE = A.NR_ITEM_CLIENTE
                                             AND D.NR_PARCIAL      = A.NR_PARCIAL
               INNER JOIN TPROCESSO E  (NOLOCK) ON E.NR_PROCESSO = D.NR_PROCESSO_ADM
               INNER JOIN TEMPRESA_NAC F  (NOLOCK) ON F.CD_EMPRESA = E.CD_CLIENTE
               WHERE A.NR_PROCESSO   = @NR_PEDIDO
              AND A.CD_EMPRESA    = @CD_EMPRESA
              AND E.CD_GRUPO      = @CD_GRUPO
              AND IN_SUBSTITUIDO  = '0' 
              AND A.NR_PARCIAL   <> 0
              AND ISNULL(A.IN_UTILIZADO_INSTR_DESEMB, '') <> '1'
              AND ((SUBSTRING(ISNULL(D.NR_PROCESSO_DES, ''),5,2) IN ('DT', 'IE', '')))" ProviderName="System.Data.SqlClient">
              <SelectParameters>
        <asp:QueryStringParameter Name="NR_PEDIDO" QueryStringField="nr_pedido" />
        <asp:QueryStringParameter Name="CD_EMPRESA" QueryStringField="cd_empresa" />
        <asp:QueryStringParameter Name="CD_GRUPO" QueryStringField="cd_grupo" />
        </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </div>       
    </div>
    </EmptyDataTemplate>
    <EditItemTemplate>
        <div id="divListaIDPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="aListaIDPedido" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Pedidos</a></center></div>
        <div id="divDadosIDPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="aDadosIDPedido" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;" id="divEditaID">
        <div id="divListaIDPedido" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
         <% If Session("in_autorizado") = "1" Then%>
        <asp:ImageButton ID="ibNovaIDPedidoLista1" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false"/>    
        <%Else%>
        <asp:ImageButton ID="ibNovaIDPedidoLista2" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido"/>    
        <%End If%>
        <asp:ImageButton ID="ibCancelarIDPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedidoLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" ToolTip="Excluir" Enabled="false" />
        </div><br />  
        <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:140px;">Pedido</td>
            <td style="width:80px">Item</td>
            <td style="width:80px">Parcial</td>
            <td style="width:120px">Qtde. Embarcada</td>
            <td style="width:120px">Total</td>
            <td style="width:40px">&nbsp;</td>
            </tr></table>
        </div>
     <div style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdPedidoID" runat="server" DataSourceID="SqlPedidoID"  DataKeyNames="ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Pedido " SortExpression="NM_ITEM" ItemStyle-Width="135px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','');" target="_blank"><%# Eval("NR_REFERENCIA")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Item " SortExpression="NR_ITEM" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <a class="nounderline" style="cursor:pointer;" onclick="VisualizaPedido('<%# Eval("NR_PROCESSO")%>','<%# Eval("NR_ITEM_PO")%>');" target="_blank"><%# Eval("NR_ITEM_PO")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NR_PARCIAL" HeaderText=" Parcial " SortExpression="NR_PARCIAL" ItemStyle-Width="80px"/>                
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Embarcada " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:BoundField DataField="VL_TOTAL" HeaderText=" Total " SortExpression="VL_TOTAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-Width="20px">
                <ItemTemplate>
                <%If Session("in_autorizado") = "1" Then%>
                  <img src="../../imagens/icones/16x16/chk_off2.gif" style="cursor:pointer;" alt="Excluir Pedido"/>
                <%Else%>
                  <img src="../../imagens/icones/16x16/chk_off.gif" onclick="javascript:excluirPedidoID('<%# Eval("ID_CODIGO")%>','<%# Eval("NR_REFERENCIA")%>','<%# Eval("NR_ITEM_PO")%>','<%# Eval("NR_PARCIAL")%>');" style="cursor:pointer;" alt="Excluir Pedido"/> 
                <%End If%>
                </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
        </div> 
        <div id="divDadosIDPedido" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibNovaIDPedido" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarIDPedido" style="cursor:pointer;" ToolTip="Criar pedido" Enabled="false"/>    
        <asp:ImageButton ID="ibCancelarIDPedido" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarIDPedido" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_pedido" Then%>
        <asp:ImageButton ID="ibSalvarIDPedido1" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirIDPedido" style="cursor:pointer;"  ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarIDPedido2" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="SalvarIDPedido" style="cursor:pointer;" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirIDPedido" runat="server" ImageUrl="../../imagens/excluir2_16.gif" OnClick="ExcluirIDPedido" style="cursor:pointer;" ToolTip="Excluir"/>
        </div><br /> 
        <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtPedido" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NR_REFERENCIA") %>' ReadOnly="true" BackColor="#DEE6EF"/><asp:TextBox ID="txtPedidoHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_REFERENCIA") %>'/>&nbsp;&nbsp;
        <asp:Label ID="lblItem" runat="server" Text="Item" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtItem" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NR_ITEM_PO") %>' ReadOnly="true" BackColor="#DEE6EF"/><asp:TextBox ID="txtItemHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_ITEM_PO") %>'/>&nbsp;&nbsp;      
        <asp:Label ID="lblParcial" runat="server" Text="Parcial" Font-Names="verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;<asp:TextBox ID="txtParcial" runat="server" CssClass="textbox" Width="125px" Text='<%# Session("NR_PARCIAL") %>' ReadOnly="true" BackColor="#DEE6EF"/><asp:TextBox ID="txtParcialHidden" runat="server" CssClass="textbox" Width="125px" Visible="false" Text='<%# Session("NR_PARCIAL") %>'/>&nbsp;&nbsp;   
        </div>       
    </div>
    </EditItemTemplate>
    </asp:FormView>
    <br />
    <div style="background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;width:180px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center>Upload de Arquivos</center></div>
    <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:left;">       
    <asp:FileUpload ID="fuArquivos" runat="server" CssClass="textbox" Width="533px" BackColor="#DEE6EF" Height="18px" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Button ID="btnArquivos" runat="server" Text="Enviar" CssClass="textbox" OnClick="EnviarArquivoID"  Width="55px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#374BAE;color:#FFFFFF;font-family:Verdana;cursor:pointer;"/><br /><br />
    <asp:Label ID="lblTpArquivo" runat="server" Text="Tipo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlTpArquivo" runat="server" class="textbox" Width="522px"  style="text-transform:uppercase;" DataSouceID="SqlTpArquivo" DataTextField="NM_TIPO_DOCTO" DataValueField="CD_TIPO_DOCTO" DataSourceID="SqlTpArquivo"/>
    <asp:SqlDataSource ID="SqlTpArquivo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT CD_TIPO_DOCTO, NM_TIPO_DOCTO FROM TTP_DOCTO_DIGITALIZADO WHERE ID_TABELA = 1225680060 AND CD_PRODUTO IN ('01', 'AM')"/><br /><br />
    <asp:Label ID="lblArquivo" runat="server" Text="Descrição" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtArquivo" runat="server" class="textbox" Width="522px" MaxLength="1750"  TextMode="MultiLine" Height="40px" style="overflow:auto;"/><br /><br />
    <div style="height: 20px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:180px;">Arquivo</td>
            <td style="width:180px">Tipo</td>
            <td style="width:180px">Data</td>
             <td style="width:40px"></td>
            </tr></table>
        </div>
        <div style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;">
        <asp:GridView ID="grdArquivosID" runat="server" DataSourceID="SqlArquivosID" DataKeyNames="ARQUIVO, TIPO, CRIACAO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum arquivo foi encontrado para esta ID" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Arquivo " SortExpression="ARQUIVO" ItemStyle-Width="180px">
                <ItemTemplate>
                        <asp:HyperLink ID="lb_nm_arquivo" runat="server" EnableTheming="True" Target="_blank"
                            Text='<%# Bind("ARQUIVO") %>' Font-Names="verdana"
                            NavigateUrl='<%# Eval("PROCESSO", "/docs_novo2/{0}/"&Trim(Eval("ARQUIVO"))) %>' class="nounderline" ItemStyle-Width="130px"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TIPO" HeaderText=" Tipo " SortExpression="TIPO" ItemStyle-Width="180px"/>
                <asp:BoundField DataField="CRIACAO" HeaderText=" Data " SortExpression="CRIACAO" ItemStyle-Width="180px"/>
                <asp:TemplateField HeaderText="Arquivo " SortExpression="ARQUIVO" ItemStyle-Width="40px">
                  <ItemTemplate>
                  <%If Session("in_autorizado") = "1" Then%>
                    <img src="\imagens\icones\16x16\chk_off2.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Excluir Arquivo"/>
                  <%Else %>
                    <img src="\imagens\icones\16x16\chk_off.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Excluir Arquivo" onclick="excluirIdArquivo('<%# Eval("PROCESSO")%>','<%# Eval("ARQUIVO")%>')"/>
                  <%End If %>
                  </ItemTemplate>        
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView> 
        </div>
    </div>               
    <asp:SqlDataSource ID="SqlPedidoID" runat="server" 
    ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
    SelectCommand="SELECT DISTINCT P.NR_PROCESSO, IP.ID_CODIGO, IP.NR_REFERENCIA, IP.NR_ITEM_PO, IP.NR_PARCIAL, POI.QT_INICIAL, POI.VL_TOTAL 
    FROM TINSTRUCAO_DESEMBARACO_PEDIDO IP (NOLOCK) 
    INNER JOIN TINSTRUCAO_DESEMBARACO ID (NOLOCK) ON IP.ID_CODIGO = ID.ID_CODIGO
    INNER JOIN TPROCESSO P  (NOLOCK) ON P.NR_REFERENCIA = IP.NR_REFERENCIA AND P.CD_CLIENTE = ID.CD_CLIENTE
    INNER JOIN TPO_ITEM POI (NOLOCK) ON POI.NR_PROCESSO = IP.NR_REFERENCIA 
                                    AND POI.NR_ITEM_CLIENTE = IP.NR_ITEM_PO
                                    AND POI.NR_PARCIAL = IP.NR_PARCIAL
    WHERE IP.ID_CODIGO = @ID_CODIGO 
    AND P.IN_CANCELADO = '0'"
    ProviderName="System.Data.SqlClient">
    <SelectParameters><asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" /></SelectParameters>
    </asp:SqlDataSource> 
    <asp:SqlDataSource ID="SqlDespesasID" runat="server" 
    ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
    SelectCommand="SELECT ID_CODIGO, ISNULL(UPPER(NM_ITEM),'') AS NM_ITEM, ISNULL(NR_FATURA,'') AS NR_FATURA, ISNULL(VL_ITEM,'') AS VL_ITEM, CD_DESPESA FROM TINSTRUCAO_DESEMBARACO_DESPESAS (NOLOCK) WHERE ID_CODIGO = @ID_CODIGO" 
    ProviderName="System.Data.SqlClient">
    <SelectParameters><asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" /></SelectParameters>
    </asp:SqlDataSource> 
    <asp:SqlDataSource ID="SqlArquivosID" runat="server" 
    ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
    SelectCommand="SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, CONVERT(VARCHAR,PD.DT_CRIACAO,103) + ' ' + CONVERT(VARCHAR,PD.DT_CRIACAO,108)  AS CRIACAO, PD.NR_PROCESSO AS PROCESSO 
	FROM TPROCESSO_DOCTOS PD (NOLOCK) INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA = PD.ID_TABELA AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO 
	WHERE PD.NR_PROCESSO = @ID_CODIGO AND PD.IN_ATIVO = '1' ORDER BY TDD.CD_TIPO_DOCTO" ProviderName="System.Data.SqlClient">
    <SelectParameters><asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" /></SelectParameters>
    </asp:SqlDataSource> 
    </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlEditID" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEditItemID" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ID_CODIGO, NM_ITEM, NR_FATURA, VL_ITEM FROM TINSTRUCAO_DESEMBARACO_DESPESAS  (NOLOCK) WHERE ID_CODIGO = @ID_CODIGO AND ISNULL(NM_ITEM,'') = @NM_ITEM">
    <SelectParameters>
    <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
    <asp:SessionParameter Name="NM_ITEM" SessionField="nm_item" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEditPedidoID" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL FROM TINSTRUCAO_DESEMBARACO_PEDIDO (NOLOCK) WHERE ID_CODIGO = @ID_CODIGO  AND NR_REFERENCIA = @NR_REFERENCIA AND NR_ITEM_PO = @NR_ITEM_PO AND NR_PARCIAL= @NR_PARCIAL">
    <SelectParameters>
    <asp:QueryStringParameter Name="ID_CODIGO" QueryStringField="id_codigo" />
    <asp:SessionParameter Name="NR_REFERENCIA" SessionField="nr_referencia" />
    <asp:SessionParameter Name="NR_ITEM_PO" SessionField="nr_item_po" />
    <asp:SessionParameter Name="NR_PARCIAL" SessionField="nr_parcial" />
    </SelectParameters>
    </asp:SqlDataSource>
    </div> 
    <br />
    <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;">
       <asp:LinkButton ID="lbVoltar" runat="server" OnClick="VoltarMenu"><img src="../../imagens/voltar1.gif" style="border:0px" alt=""/></asp:LinkButton></div><div style="bottom:2px;height:20px;position:absolute;right:5px"> <a href="http://www.instantssl.com" id="comodoTL">SSL</a><script type="text/javascript">TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>
   </form>   
</body>
</html>
