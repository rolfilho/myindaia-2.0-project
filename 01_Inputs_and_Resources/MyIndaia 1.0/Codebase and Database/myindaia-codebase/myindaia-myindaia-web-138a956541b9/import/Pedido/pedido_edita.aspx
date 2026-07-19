<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true"%>
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Dim SqlAux As String
    
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Trim(Request("usuario")) <> "" Then
            Session("usuario") = Request("usuario")
        End If
        Session("cd_unid_neg") = ""
        Session("cd_cargo") = ""
        SqlAux = " SELECT U.NM_USUARIO AS USUARIO, U.CD_CARGO " & _
        " FROM TUSUARIO U (NOLOCK)" & _
        " WHERE U.CD_USUARIO = '" & Session("usuario") & "' "
        
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If Not RsAux.HasRows Then
            RsAux.Close()
            CnnAux.Close()
            Session("cd_via_transp") = ""
            Session("status") = ""
            Response.Redirect("..\..\autentica.asp?tx_erro=")
        Else
            RsAux.Read()
            Session("nm_usuario") = RsAux("USUARIO")
            Session("cd_cargo") = RsAux("CD_CARGO")
            RsAux.Close()
            CnnAux.Close()
            If InStr("040;055;080", Session("cd_cargo")) > 0 Then
                SqlAux = "SELECT TOP 1 C.CD_UNID_NEG FROM TCLIENTE_HABILITACAO C (NOLOCK)" & _
                " INNER JOIN TPERMISSAO P (NOLOCK) ON P.CD_CLIENTE = C.CD_CLIENTE " & _
                " WHERE P.CD_USUARIO = '" & Session("usuario") & "'" & _
                " AND C.IN_ATIVO = '1' AND C.CD_PRODUTO = '06'"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                RsAux.Read()
                Session("cd_unid_neg") = RsAux("CD_UNID_NEG")
            Else
                SqlAux = "SELECT U.CD_UNID_NEG FROM TUSUARIO_HABILITACAO U (NOLOCK)" & _
               " WHERE U.CD_USUARIO = '" & Session("usuario") & "'" & _
               " AND U.IN_ATIVO = '1' AND U.IN_DEFAULT = '1'"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                RsAux.Read()
                Session("cd_unid_neg") = RsAux("CD_UNID_NEG")
            End If
        End If
        CnnAux.Close()
        RsAux.Close()

        If Request("acao") = "editar" Then
            Dim txtCdServico As TextBox = frmEditaPedido.FindControl("txtCdServico")
            SqlAux = "SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WHERE CD_SERVICO = '" & txtCdServico.Text & "'"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            Session("cd_via_transp") = RsAux("CD_VIA_TRANSPORTE")
            Session("status") = "edicao"
            RsAux.Close()
            CnnAux.Close()
        End If
    End Sub
    
    Sub CriarPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("status") = "novo"
        Session("cd_via_transp") = ""
        Response.Redirect("pedido_edita.aspx?acao=novo")
    End Sub
    
    Sub CriarPedidoItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim nr_processo As String
        Dim txtNrProcesso As TextBox = frmEditaPedido.FindControl("txtNrProcesso")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        Dim txtCdAreaItem As TextBox = frmEditaPedido.FindControl("txtCdArea")
        nr_processo = txtCdUnidade.Text & "06" & txtNrProcesso.Text
        Session("status") = "novo_item"
        Session("cd_area") = txtCdAreaItem.Text
        Response.Redirect("pedido_edita.aspx?acao=novo_item&nr_processo=" & nr_processo)
    End Sub
      
    Sub CancelarPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Session("status") = "novo"
        Session("cd_via_transp") = ""
        Response.Redirect("pedido_edita.aspx?")
    End Sub
    
    Sub CancelarPedidoItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim nr_processo As String
        Dim txtNrProcesso As TextBox = frmEditaPedido.FindControl("txtNrProcesso")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        nr_processo = txtCdUnidade.Text & "06" & txtNrProcesso.Text
        Response.Redirect("pedido_edita.aspx?acao=listar_item&nr_processo=" & nr_processo)
    End Sub
    
    Sub SalvarPedidoItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim frmEditaPedidoItem As FormView = frmEditaPedido.FindControl("frmEditaPedidoItem")
        Dim SqlItemPedido As SqlDataSource = frmEditaPedidoItem.FindControl("SqlItemPedido")
        Dim txtNrPedido As TextBox = frmEditaPedido.FindControl("txtNrPedido")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim txtNrItemCliente As TextBox = frmEditaPedidoItem.FindControl("txtNrItemCliente")
        Dim txtCdAreaItem As TextBox = frmEditaPedidoItem.FindControl("txtCdAreaItem")
        Dim txtCdMercadoria As TextBox = frmEditaPedidoItem.FindControl("txtCdMercadoria")
        Dim txtNCM As TextBox = frmEditaPedidoItem.FindControl("txtNCM")
        Dim cbLi As CheckBox = frmEditaPedidoItem.FindControl("cbLi")
        Dim cbDrawBack As CheckBox = frmEditaPedidoItem.FindControl("cbDrawBack")
        Dim txtQtde As TextBox = frmEditaPedidoItem.FindControl("txtQtde")
        Dim txtCdUnMedida As TextBox = frmEditaPedidoItem.FindControl("txtCdUnMedida")
        Dim txtCdMoeda As TextBox = frmEditaPedidoItem.FindControl("txtCdMoeda")
        Dim txtVlUnit As TextBox = frmEditaPedidoItem.FindControl("txtVlUnit")
        Dim txtVlItem As TextBox = frmEditaPedidoItem.FindControl("txtVlItem")
        Dim ddlTpCalculo As DropDownList = frmEditaPedidoItem.FindControl("ddlTpCalculo")
        Dim txtInvoice As TextBox = frmEditaPedidoItem.FindControl("txtInvoice")
        Dim rbTpDrawback As RadioButtonList = frmEditaPedidoItem.FindControl("rbTpDrawback")
        Dim txtCdMercFornec As TextBox = frmEditaPedidoItem.FindControl("txtCdMercFornec")
        Dim txtCdFabricante As TextBox = frmEditaPedidoItem.FindControl("txtCdFabricante")
        Dim txtCdPaisOrigem As TextBox = frmEditaPedidoItem.FindControl("txtCdPaisOrigem")
        Dim txtCdLocalDesembarque As TextBox = frmEditaPedidoItem.FindControl("txtCdLocalDesembarque")
        Dim txtCdNavio As TextBox = frmEditaPedidoItem.FindControl("txtCdNavio")
        Dim txtCdAgenteCarga As TextBox = frmEditaPedidoItem.FindControl("txtCdAgenteCarga")
        Dim txtNrViagem As TextBox = frmEditaPedidoItem.FindControl("txtNrViagem")
        Dim txtNrVoo As TextBox = frmEditaPedidoItem.FindControl("txtNrVoo")
        Dim txtNrCourrier As TextBox = frmEditaPedidoItem.FindControl("txtNrCourrier")
        Dim txtNrBl As TextBox = frmEditaPedidoItem.FindControl("txtNrBl")
        Dim cbUrgente As CheckBox = frmEditaPedidoItem.FindControl("cbUrgente")
        Dim cbConsolidado As CheckBox = frmEditaPedidoItem.FindControl("cbConsolidado")
        Dim cbSeguro As CheckBox = frmEditaPedidoItem.FindControl("cbSeguro")
        Dim txtPlItem As TextBox = frmEditaPedidoItem.FindControl("txtPlItem")
        Dim txtNrProcesso As TextBox = frmEditaPedidoItem.FindControl("txtNrProcesso")
        Dim txtCdNaladiSh As TextBox = frmEditaPedidoItem.FindControl("txtCdNaladiSh")
        Dim txtCdNaladiNcca As TextBox = frmEditaPedidoItem.FindControl("txtCdNaladiNcca")
        Dim txtTxMercadoria As TextBox = frmEditaPedidoItem.FindControl("txtTxMercadoria")
        Dim txtNrItem As TextBox = frmEditaPedidoItem.FindControl("txtNrItem")
        Dim txtNrOrdemItem As TextBox = frmEditaPedidoItem.FindControl("txtNrOrdemItem")
        Dim vTpDrawback, cd_area_item, cd_ncm, cd_mercadoria, cd_local_embarque, cd_navio, cd_agente, nr_viagem, nr_voo, nr_courrier, tx_tp_calculo As String
        Dim nr_bl, nr_ordem_item, cd_fabricante, cd_medida, cd_pais_origem, cd_invoice, cd_naladi_ncca, cd_naladi_sh, cd_cliente, cd_moeda As String
        Dim cd_merc_fornec As String
        Dim vPlItem As Double
        Dim tx_mercadoria As String
        
        If Trim(txtCdMercadoria.Text) <> "" Then cd_mercadoria = "'" & txtCdMercadoria.Text & "'" Else cd_mercadoria = "NULL"
        If Trim(txtNCM.Text) <> "" Then cd_ncm = "'" & txtNCM.Text & "'" Else cd_ncm = "NULL"
        If Trim(txtCdAreaItem.Text) <> "" Then cd_area_item = "'" & txtCdAreaItem.Text & "'" Else cd_area_item = "NULL"
        If Trim(txtCdLocalDesembarque.Text) <> "" Then cd_local_embarque = "'" & txtCdLocalDesembarque.Text & "'" Else cd_local_embarque = "NULL"
        If Trim(txtCdNavio.Text) <> "" Then cd_navio = "'" & txtCdNavio.Text & "'" Else cd_navio = "NULL"
        If Trim(txtCdAgenteCarga.Text) <> "" Then cd_agente = "'" & txtCdAgenteCarga.Text & "'" Else cd_agente = "NULL"
        If Trim(txtNrViagem.Text) <> "" Then nr_viagem = "'" & txtNrViagem.Text & "'" Else nr_viagem = "NULL"
        If Trim(txtNrVoo.Text) <> "" Then nr_voo = "'" & txtNrVoo.Text & "'" Else nr_voo = "NULL"
        If Trim(txtNrCourrier.Text) <> "" Then nr_courrier = "'" & txtNrCourrier.Text & "'" Else nr_courrier = "NULL"
        If Trim(txtNrBl.Text) <> "" Then nr_bl = "'" & txtNrBl.Text & "'" Else nr_bl = "NULL"
        If Trim(txtCdFabricante.Text) <> "" Then cd_fabricante = "'" & txtCdFabricante.Text & "'" Else cd_fabricante = "NULL"
        If Trim(txtCdUnMedida.Text) <> "" Then cd_medida = "'" & txtCdUnMedida.Text & "'" Else cd_medida = "NULL"
        If Trim(txtCdPaisOrigem.Text) <> "" Then cd_pais_origem = "'" & txtCdPaisOrigem.Text & "'" Else cd_pais_origem = "NULL"
        If Trim(txtInvoice.Text) <> "" Then cd_invoice = "'" & txtInvoice.Text & "'" Else cd_invoice = "NULL"
        If Trim(txtCdMercFornec.Text) <> "" Then cd_merc_fornec = "'" & txtCdMercFornec.Text & "'" Else cd_merc_fornec = "NULL"
        If Trim(txtCdMoeda.Text) <> "" Then cd_moeda = "'" & txtCdMoeda.Text & "'" Else cd_moeda = "NULL"
        If Trim(txtCdCliente.Text) <> "" Then cd_cliente = "'" & txtCdCliente.Text & "'" Else cd_cliente = "NULL"
        If Trim(txtCdNaladiSh.Text) <> "" Then cd_naladi_sh = "'" & txtCdNaladiSh.Text & "'" Else cd_naladi_sh = "NULL"
        If Trim(txtCdNaladiNcca.Text) <> "" Then cd_naladi_ncca = "'" & txtCdNaladiNcca.Text & "'" Else cd_naladi_ncca = "NULL"
        If Trim(txtTxMercadoria.Text) <> "" Then tx_mercadoria = "'" & Replace(txtTxMercadoria.Text, "'", """") & "'" Else tx_mercadoria = "NULL"
        If Trim(ddlTpCalculo.SelectedValue) <> "" Then tx_tp_calculo = "'" & ddlTpCalculo.SelectedValue & "'" Else tx_tp_calculo = "NULL"
        If Trim(txtCdMoeda.Text) <> "" Then cd_moeda = "'" & txtCdMoeda.Text & "'" Else cd_moeda = "NULL"
        If Trim(txtNrOrdemItem.Text) <> "" Then nr_ordem_item = "'" & txtNrOrdemItem.Text & "'" Else nr_ordem_item = "NULL"
        
        If txtPlItem.Text = "" Then
            vPlItem = 0
        Else
            vPlItem = CDbl(txtPlItem.Text)
        End If
        
        If rbTpDrawback.SelectedValue = "" Then
            vTpDrawback = "0"
        Else
            vTpDrawback = rbTpDrawback.SelectedValue
        End If
                
        SqlItemPedido.UpdateCommand = " UPDATE TPO_ITEM " & _
        " SET " & _
        "  CD_MERCADORIA = " & cd_mercadoria & ", " & _
        "  CD_NCM_SH = " & cd_ncm & ", " & _
        "  QT_INICIAL = " & txtQtde.Text & ", " & _
        "  QT_DISPONIVEL = " & txtQtde.Text & ", " & _
        "  IN_NECESSITA_LI = " & Math.Abs(CDbl(CInt(CBool(cbLi.Checked)))) & ", " & _
        "  IN_DRAWBACK = " & Math.Abs(CDbl(CInt(CBool(cbDrawBack.Checked)))) & ", " & _
        "  CD_AREA = " & cd_area_item & ", " & _
        "  CD_LOCAL_DESEMBARQUE = " & cd_local_embarque & ", " & _
        "  CD_EMBARCACAO = " & cd_navio & ", " & _
        "  CD_AGENTE = " & cd_agente & ", " & _
        "  NR_VIAGEM = " & nr_viagem & ", " & _
        "  NR_VOO = " & nr_voo & ", " & _
        "  NR_CONHECIMENTO = " & nr_bl & ", " & _
        "  NR_COURRIER = " & nr_courrier & ", " & _
        "  IN_CONSOLIDADO = " & Math.Abs(CDbl(CInt(CBool(cbConsolidado.Checked)))) & ", " & _
        "  IN_URGENTE = " & Math.Abs(CDbl(CInt(CBool(cbUrgente.Checked)))) & ", " & _
        "  IN_SEGURO = " & Math.Abs(CDbl(CInt(CBool(cbSeguro.Checked)))) & ", " & _
        "  VL_UNITARIO = " & txtVlUnit.Text & ", " & _
        "  TP_CALCULO = " & tx_tp_calculo & ", " & _
        "  PL_ITEM = " & txtPlItem.Text & ", " & _
        "  CD_UNID_MEDIDA = " & cd_medida & ", " & _
        "  CD_NALADI_SH = " & cd_naladi_sh & ", " & _
        "  CD_NALADI_NCCA = " & cd_naladi_ncca & ", " & _
        "  CD_FABRICANTE = " & cd_fabricante & ", " & _
        "  VL_TOTAL = " & txtVlItem.Text & ", " & _
        "  TX_MERCADORIA = " & tx_mercadoria & ", " & _
        "  TP_DRAWBACK = " & vTpDrawback & ", " & _
        "  CD_MOEDA_NEGOCIADA = " & cd_moeda & ", " & _
        "  NR_FATURA = " & cd_invoice & ", " & _
        "  CD_MERC_FORNEC = " & cd_merc_fornec & ", " & _
        "  NR_ORDEM = " & nr_ordem_item & ", " & _
        "  CD_EMPRESA = " & cd_cliente & " " & _
        " WHERE " & _
        "  NR_PROCESSO = '" & txtNrPedido.Text & "'  AND " & _
        "  NR_ITEM = '" & txtNrItem.Text & "' AND " & _
        "  NR_PARCIAL = 0 AND " & _
        "  CD_EMPRESA = " & cd_cliente & " "
        'Response.Write(SqlItemPedido.UpdateCommand)
        'Response.End()
        SqlItemPedido.Update()
        
        If txtCdCliente.Text = "00500" or txtCdCliente.Text = "03185" Then 
            SqlItemPedido.UpdateCommand = " UPDATE TPO_ITEM " & _
            " SET " & _
            "  IN_URGENTE = " & Math.Abs(CDbl(CInt(CBool(cbUrgente.Checked)))) & ", " & _
            "  CD_PAIS_ORIGEM = " & cd_pais_origem & ", " & _
            "  NR_ORDEM = " & nr_ordem_item & ", " & _
            "  CD_NCM_SH = " & cd_ncm & ", " & _
            "  QT_INICIAL = " & txtQtde.Text & ", " & _
            "  VL_UNITARIO = " & txtVlUnit.Text & ", " & _
            "  QT_DISPONIVEL = " & txtQtde.Text & ", " & _
            "  CD_MERCADORIA = " & cd_mercadoria & ", " & _
            "  TX_MERCADORIA = " & tx_mercadoria & ", " & _
            "  CD_MERC_FORNEC = " & cd_merc_fornec & " " & _
            " WHERE " & _
            "  NR_PROCESSO = '" & txtNrPedido.Text & "'  AND " & _
            "  NR_ITEM_CLIENTE = '" & txtNrItemCliente.Text & "' AND " & _
            "  CD_EMPRESA = " & cd_cliente & " "
					
        Else
            SqlItemPedido.UpdateCommand = " UPDATE TPO_ITEM " & _
            " SET " & _
            "  IN_URGENTE = " & Math.Abs(CDbl(CInt(CBool(cbUrgente.Checked)))) & ", " & _
            "  CD_PAIS_ORIGEM = " & cd_pais_origem & ", " & _
            "  NR_ORDEM = " & nr_ordem_item & ", " & _
            "  CD_MERC_FORNEC = " & cd_merc_fornec & " " & _
            " WHERE " & _
            "  NR_PROCESSO = '" & txtNrPedido.Text & "'  AND " & _
            "  NR_ITEM_CLIENTE = '" & txtNrItemCliente.Text & "' AND " & _
            "  CD_EMPRESA = " & cd_cliente & " "
        End If        
        'Response.Write(SqlItemPedido.UpdateCommand)
        'Response.End()
        SqlItemPedido.Update()
        
        Session("status") = "salvar_item"
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('Referência " & Trim(txtNrPedido.Text) & "/" & Trim(txtNrItemCliente.Text) & " salva com sucesso!');location.href = 'pedido_edita.aspx?acao=editar_item&nr_processo=" + Trim(txtNrProcesso.Text) + "&item_cliente=" + (txtNrItemCliente.Text) + "';", True)
    End Sub
 
    Sub InserirPedidoItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim frmEditaPedidoItem As FormView = frmEditaPedido.FindControl("frmEditaPedidoItem")
        Dim SqlItemPedido As SqlDataSource = frmEditaPedidoItem.FindControl("SqlItemPedido")
        Dim txtNrPedido As TextBox = frmEditaPedido.FindControl("txtNrPedido")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim txtNrItemCliente As TextBox = frmEditaPedidoItem.FindControl("txtNrItemCliente")
        Dim txtCdAreaItem As TextBox = frmEditaPedidoItem.FindControl("txtCdAreaItem")
        Dim txtCdMercadoria As TextBox = frmEditaPedidoItem.FindControl("txtCdMercadoria")
        Dim txtNCM As TextBox = frmEditaPedidoItem.FindControl("txtNCM")
        Dim cbLi As CheckBox = frmEditaPedidoItem.FindControl("cbLi")
        Dim cbDrawBack As CheckBox = frmEditaPedidoItem.FindControl("cbDrawBack")
        Dim txtQtde As TextBox = frmEditaPedidoItem.FindControl("txtQtde")
        Dim txtCdUnMedida As TextBox = frmEditaPedidoItem.FindControl("txtCdUnMedida")
        Dim txtCdMoeda As TextBox = frmEditaPedidoItem.FindControl("txtCdMoeda")
        Dim txtVlUnit As TextBox = frmEditaPedidoItem.FindControl("txtVlUnit")
        Dim txtVlItem As TextBox = frmEditaPedidoItem.FindControl("txtVlItem")
        Dim ddlTpCalculo As DropDownList = frmEditaPedidoItem.FindControl("ddlTpCalculo")
        Dim txtInvoice As TextBox = frmEditaPedidoItem.FindControl("txtInvoice")
        Dim rbTpDrawback As RadioButtonList = frmEditaPedidoItem.FindControl("rbTpDrawback")
        Dim txtCdMercFornec As TextBox = frmEditaPedidoItem.FindControl("txtCdMercFornec")
        Dim txtCdFabricante As TextBox = frmEditaPedidoItem.FindControl("txtCdFabricante")
        Dim txtCdPaisOrigem As TextBox = frmEditaPedidoItem.FindControl("txtCdPaisOrigem")
        Dim txtCdLocalDesembarque As TextBox = frmEditaPedidoItem.FindControl("txtCdLocalDesembarque")
        Dim txtCdNavio As TextBox = frmEditaPedidoItem.FindControl("txtCdNavio")
        Dim txtCdAgenteCarga As TextBox = frmEditaPedidoItem.FindControl("txtCdAgenteCarga")
        Dim txtNrViagem As TextBox = frmEditaPedidoItem.FindControl("txtNrViagem")
        Dim txtNrVoo As TextBox = frmEditaPedidoItem.FindControl("txtNrVoo")
        Dim txtNrCourrier As TextBox = frmEditaPedidoItem.FindControl("txtNrCourrier")
        Dim txtNrBl As TextBox = frmEditaPedidoItem.FindControl("txtNrBl")
        Dim cbUrgente As CheckBox = frmEditaPedidoItem.FindControl("cbUrgente")
        Dim cbConsolidado As CheckBox = frmEditaPedidoItem.FindControl("cbConsolidado")
        Dim cbSeguro As CheckBox = frmEditaPedidoItem.FindControl("cbSeguro")
        Dim txtPlItem As TextBox = frmEditaPedidoItem.FindControl("txtPlItem")
        Dim txtNrProcesso As TextBox = frmEditaPedidoItem.FindControl("txtNrProcesso")
        Dim txtCdNaladiSh As TextBox = frmEditaPedidoItem.FindControl("txtCdNaladiSh")
        Dim txtCdNaladiNcca As TextBox = frmEditaPedidoItem.FindControl("txtCdNaladiNcca")
        Dim txtTxMercadoria As TextBox = frmEditaPedidoItem.FindControl("txtTxMercadoria")
        Dim txtNrOrdemItem As TextBox = frmEditaPedidoItem.FindControl("txtNrOrdemItem")
        Dim vNrItem, vTpDrawback, cd_area_item, cd_ncm, cd_mercadoria, cd_local_embarque, cd_navio, cd_agente, nr_viagem, nr_voo, nr_courrier As String
        Dim nr_bl, nr_ordem_item, cd_fabricante, cd_medida, cd_pais_origem, cd_invoice, tx_mercadoria, cd_naladi_ncca, cd_naladi_sh, cd_cliente, cd_moeda, tx_tp_calculo As String
        Dim cd_merc_fornec As String
        Dim vPlItem As Double
        Dim vNrParcial As Integer
        
        If Trim(txtCdMercadoria.Text) <> "" Then cd_mercadoria = "'" & txtCdMercadoria.Text & "'" Else cd_mercadoria = "NULL"
        If Trim(txtNCM.Text) <> "" Then cd_ncm = "'" & txtNCM.Text & "'" Else cd_ncm = "NULL"
        If Trim(txtCdAreaItem.Text) <> "" Then cd_area_item = "'" & txtCdAreaItem.Text & "'" Else cd_area_item = "NULL"
        If Trim(txtCdLocalDesembarque.Text) <> "" Then cd_local_embarque = "'" & txtCdLocalDesembarque.Text & "'" Else cd_local_embarque = "NULL"
        If Trim(txtCdNavio.Text) <> "" Then cd_navio = "'" & txtCdNavio.Text & "'" Else cd_navio = "NULL"
        If Trim(txtCdAgenteCarga.Text) <> "" Then cd_agente = "'" & txtCdAgenteCarga.Text & "'" Else cd_agente = "NULL"
        If Trim(txtNrViagem.Text) <> "" Then nr_viagem = "'" & txtNrViagem.Text & "'" Else nr_viagem = "NULL"
        If Trim(txtNrVoo.Text) <> "" Then nr_voo = "'" & txtNrVoo.Text & "'" Else nr_voo = "NULL"
        If Trim(txtNrCourrier.Text) <> "" Then nr_courrier = "'" & txtNrCourrier.Text & "'" Else nr_courrier = "NULL"
        If Trim(txtNrBl.Text) <> "" Then nr_bl = "'" & txtNrBl.Text & "'" Else nr_bl = "NULL"
        If Trim(txtCdFabricante.Text) <> "" Then cd_fabricante = "'" & txtCdFabricante.Text & "'" Else cd_fabricante = "NULL"
        If Trim(txtCdUnMedida.Text) <> "" Then cd_medida = "'" & txtCdUnMedida.Text & "'" Else cd_medida = "NULL"
        If Trim(txtCdPaisOrigem.Text) <> "" Then cd_pais_origem = "'" & txtCdPaisOrigem.Text & "'" Else cd_pais_origem = "NULL"
        If Trim(txtInvoice.Text) <> "" Then cd_invoice = "'" & txtInvoice.Text & "'" Else cd_invoice = "NULL"
        If Trim(txtCdMercFornec.Text) <> "" Then cd_merc_fornec = "'" & txtCdMercFornec.Text & "'" Else cd_merc_fornec = "NULL"
        If Trim(txtCdMoeda.Text) <> "" Then cd_moeda = "'" & txtCdMoeda.Text & "'" Else cd_moeda = "NULL"
        If Trim(txtCdCliente.Text) <> "" Then cd_cliente = "'" & txtCdCliente.Text & "'" Else cd_cliente = "NULL"
        If Trim(txtCdNaladiSh.Text) <> "" Then cd_naladi_sh = "'" & txtCdNaladiSh.Text & "'" Else cd_naladi_sh = "NULL"
        If Trim(txtCdNaladiNcca.Text) <> "" Then cd_naladi_ncca = "'" & txtCdNaladiNcca.Text & "'" Else cd_naladi_ncca = "NULL"
        If Trim(txtTxMercadoria.Text) <> "" Then tx_mercadoria = "'" & Replace(txtTxMercadoria.Text, "'", """") & "'" Else tx_mercadoria = "NULL"
        If Trim(ddlTpCalculo.SelectedValue) <> "" Then tx_tp_calculo = "'" & ddlTpCalculo.SelectedValue & "'" Else tx_tp_calculo = "NULL"
        If Trim(txtNrOrdemItem.Text) <> "" Then nr_ordem_item = "'" & txtNrOrdemItem.Text & "'" Else nr_ordem_item = "NULL"
                
        If txtPlItem.Text = "" Then
            vPlItem = 0
        Else
            vPlItem = CDbl(txtPlItem.Text)
        End If
  
        If rbTpDrawback.SelectedValue = "" Then
            vTpDrawback = "0"
        Else
            vTpDrawback = rbTpDrawback.SelectedValue
        End If

        vNrParcial = 0
        
        SqlAux = "SELECT ISNULL(MAX(NR_ITEM),'0') AS MAXIMO FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND CD_EMPRESA ='" & txtCdCliente.Text & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If Not RsAux.HasRows Then
            vNrItem = "001"
        Else
            RsAux.Read()
            vNrItem = Right("000" + CStr(CInt(RsAux("MAXIMO")) + 1), 3)
        End If
        RsAux.Close()
        CnnAux.Close()
        'Replace(Replace(txtVlUnit.Text, ".", ""), ",", ".")

        SqlItemPedido.InsertCommand = " INSERT INTO TPO_ITEM " & _
        " (NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_MERCADORIA, CD_NCM_SH, QT_INICIAL, " & _
        " IN_NECESSITA_LI, IN_DRAWBACK, CD_AREA, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, " & _
        " CD_AGENTE, NR_VIAGEM, NR_VOO, NR_CONHECIMENTO, NR_COURRIER, IN_CONSOLIDADO, " & _
        " IN_URGENTE, IN_SEGURO, VL_UNITARIO, TP_CALCULO,  CD_UNID_MEDIDA, " & _
        " CD_FABRICANTE, CD_PAIS_ORIGEM, VL_TOTAL, " & _
        " TP_DRAWBACK, NR_FATURA, CD_MERC_FORNEC, NR_ORDEM, CD_MOEDA_NEGOCIADA, NR_PARCIAL, " & _
        " QT_DISPONIVEL, DT_ABERTURA_ITEM, CD_EMPRESA, PL_ITEM, CD_NALADI_SH, CD_NALADI_NCCA, TX_MERCADORIA, IN_WEB) " & _
        "    VALUES " & _
        " ('" & txtNrPedido.Text & "', '" & vNrItem & "', '" & txtNrItemCliente.Text & "', " & cd_mercadoria & ", " & cd_ncm & ", " & _
        " " & txtQtde.Text & ", " & Math.Abs(CDbl(CInt(CBool(cbLi.Checked)))) & ", " & Math.Abs(CDbl(CInt(CBool(cbDrawBack.Checked)))) & ", " & cd_area_item & ", " & cd_local_embarque & ", " & _
        " " & cd_navio & ", " & cd_agente & ", " & nr_viagem & ", " & nr_voo & ", " & nr_bl & ", " & nr_courrier & ", " & _
        " " & Math.Abs(CDbl(CInt(CBool(cbConsolidado.Checked)))) & ", " & Math.Abs(CDbl(CInt(CBool(cbUrgente.Checked)))) & ", " & Math.Abs(CDbl(CInt(CBool(cbSeguro.Checked)))) & ", " & txtVlUnit.Text & ", " & tx_tp_calculo & ", " & _
        " " & cd_medida & ", " & cd_fabricante & ", " & _
        " " & cd_pais_origem & ", " & txtVlItem.Text & ", '" & vTpDrawback & "', " & cd_invoice & ", " & _
        " " & cd_merc_fornec & ", " & nr_ordem_item & ", " & cd_moeda & ", 0, " & txtQtde.Text & ", GETDATE(), " & cd_cliente & "," & vPlItem & ", " & cd_naladi_sh & ", " & cd_naladi_ncca & ", " & tx_mercadoria & ",'1')"
        'Response.Write(SqlItemPedido.InsertCommand)
        'Response.End()
        
        SqlItemPedido.Insert()
        Session("status") = "salvar_item"
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('Referência " & Trim(txtNrPedido.Text) & "/" & Trim(txtNrItemCliente.Text) & " salva com sucesso!');location.href = 'pedido_edita.aspx?acao=listar_item&nr_processo=" + txtNrProcesso.Text + "';", True)
    End Sub
    
    Sub SalvarPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedido As SqlDataSource = frmEditaPedido.FindControl("sqlPedido")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim txtCdServico As TextBox = frmEditaPedido.FindControl("txtCdServico")
        Dim txtNrPedido As TextBox = frmEditaPedido.FindControl("txtNrPedido")
        Dim txtNrProcesso As TextBox = frmEditaPedido.FindControl("txtNrProcesso")
        Dim txtCdArea As TextBox = frmEditaPedido.FindControl("txtCdArea")
        Dim txtCdImportador As TextBox = frmEditaPedido.FindControl("txtCdImportador")
        Dim txtCdExportador As TextBox = frmEditaPedido.FindControl("txtCdExportador")
        Dim txtCdContato As TextBox = frmEditaPedido.FindControl("txtCdContato")
        Dim txtCdAnalista As TextBox = frmEditaPedido.FindControl("txtCdAnalista")
        Dim txtNrOrdem As TextBox = frmEditaPedido.FindControl("txtNrOrdem")
        Dim txtRefExportador As TextBox = frmEditaPedido.FindControl("txtRefExportador")
        Dim ddlInconterm As DropDownList = frmEditaPedido.FindControl("ddlInconterm")
        Dim ddlTpPedido As DropDownList = frmEditaPedido.FindControl("ddlTpPedido")
        Dim ddlCondDias As DropDownList = frmEditaPedido.FindControl("ddlCondDias")
        Dim ddlCondTp As DropDownList = frmEditaPedido.FindControl("ddlCondTp")
        Dim cbDadosIguais As CheckBox = frmEditaPedido.FindControl("cbDadosIguais")
        Dim cbUrgente As CheckBox = frmEditaPedido.FindControl("cbUrgente")
        Dim txtCdPaisOrigem As TextBox = frmEditaPedido.FindControl("txtCdPaisOrigem")
        Dim txtCdLocalDesembarque As TextBox = frmEditaPedido.FindControl("txtCdLocalDesembarque")
        Dim txtCdNavio As TextBox = frmEditaPedido.FindControl("txtCdNavio")
        Dim txtCdAgenteCarga As TextBox = frmEditaPedido.FindControl("txtCdAgenteCarga")
        Dim txtNrViagem As TextBox = frmEditaPedido.FindControl("txtNrViagem")
        Dim txtNrCourrier As TextBox = frmEditaPedido.FindControl("txtNrCourrier")
        Dim txtNrBl As TextBox = frmEditaPedido.FindControl("txtNrBl")
        Dim txtNrVoo As TextBox = frmEditaPedido.FindControl("txtNrVoo")
        Dim cd_via_transp, cd_incoterm, cd_pedido, cd_cond_dias, cd_cond_tp, cd_pais_origem, cd_analista, nr_ref_exportador As String
        Dim cd_agente, nr_ordem, nr_voo, nr_viagem, nr_courrier, cd_navio, nr_bl, cd_local_embarque, cd_contato As String
        
        SqlAux = "SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WHERE CD_SERVICO = '" & txtCdServico.Text & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        cd_via_transp = RsAux("CD_VIA_TRANSPORTE")
        Session("cd_via_transp") = cd_via_transp
        RsAux.Close()
        CnnAux.Close()
        If Trim(ddlTpPedido.SelectedItem.Value) <> "" Then cd_pedido = "'" & ddlTpPedido.SelectedItem.Value & "'" Else cd_pedido = "NULL"
        If Trim(ddlCondDias.SelectedItem.Value) <> "" Then cd_cond_dias = "'" & ddlCondDias.SelectedItem.Value & "'" Else cd_cond_dias = "NULL"
        If Trim(ddlCondTp.SelectedItem.Value) <> "" Then cd_cond_tp = "'" & ddlCondTp.SelectedItem.Value & "'" Else cd_cond_tp = "NULL"
        If Trim(txtCdAgenteCarga.Text) <> "" Then cd_agente = "'" & txtCdAgenteCarga.Text & "'" Else cd_agente = "NULL"
        If Trim(txtNrOrdem.Text) <> "" Then nr_ordem = "'" & txtNrOrdem.Text & "'" Else nr_ordem = "NULL"
        If Trim(txtNrVoo.Text) <> "" Then nr_voo = "'" & txtNrVoo.Text & "'" Else nr_voo = "NULL"
        If Trim(txtNrViagem.Text) <> "" Then nr_viagem = "'" & Replace(txtNrViagem.Text,"/","") & "'" Else nr_viagem = "NULL"
        If Trim(txtNrBl.Text) <> "" Then nr_bl = "'" & txtNrBl.Text & "'" Else nr_bl = "NULL"
        If Trim(txtCdPaisOrigem.Text) <> "" Then cd_pais_origem = "'" & txtCdPaisOrigem.Text & "'" Else cd_pais_origem = "NULL"
        If Trim(txtCdNavio.Text) <> "" Then cd_navio = "'" & txtCdNavio.Text & "'" Else cd_navio = "NULL"
        If Trim(txtCdLocalDesembarque.Text) <> "" Then cd_local_embarque = "'" & txtCdLocalDesembarque.Text & "'" Else cd_local_embarque = "NULL"
        If Trim(txtCdContato.Text) <> "" Then cd_contato = "'" & Right("0000" + txtCdContato.Text, 4) & "'" Else cd_contato = "NULL"
        If Trim(txtCdAnalista.Text) <> "" Then cd_analista = "'" & txtCdAnalista.Text & "'" Else cd_analista = "NULL"
        If Trim(txtRefExportador.Text) <> "" Then nr_ref_exportador = "'" & txtRefExportador.Text & "'" Else nr_ref_exportador = "NULL"
        If Trim(txtNrCourrier.Text) <> "" Then nr_courrier = "'" & txtNrCourrier.Text & "'" Else nr_courrier = "NULL"
        
        If Trim(ddlInconterm.SelectedItem.Value) <> "" Then
            cd_incoterm = "'" & ddlInconterm.SelectedItem.Value & "'"
        Else
            cd_incoterm = "CD_INCOTERM"
        End If
        
        If InStr("040;055;088", Session("cd_cargo")) > 0 Then
            cd_contato = Trim(Session("usuario"))
            'Else
            '    cd_analista = Session("usuario")
        End If
        
        'cd_contato = Right("0000" & Trim(cd_contato), 4)
        
        'Response.Write(cd_contato)
        'Response.end
        
        sqlPedido.UpdateCommand = " UPDATE TPO " & _
        " SET " & _
        " CD_IMPORTADOR = '" & txtCdImportador.Text & "', " & _
        " CD_EXPORTADOR = '" & txtCdExportador.Text & "', " & _
        " CD_VIA_TRANSP = '" & cd_via_transp & "', " & _
        " CD_INCOTERM = " & cd_incoterm & ", " & _
        " CD_AREA = '" & txtCdArea.Text & "', " & _
        " CD_LOCAL_DESEMBARQUE = " & cd_local_embarque & ", " & _
        " CD_PAIS_ORIGEM = " & cd_pais_origem & ", " & _
        " CD_SERVICO = '" & txtCdServico.Text & "' " & _
        " WHERE " & _
        " NR_PROCESSO = '" & txtNrPedido.Text & "' AND " & _
        " CD_EMPRESA = '" & txtCdCliente.Text & "' "
        'Response.Write(sqlPedido.UpdateCommand)
        'Response.End()
        sqlPedido.Update()

        If txtCdCliente.Text = "00500" or txtCdCliente.Text = "03185" Then    
            sqlPedido.UpdateCommand = " UPDATE TPO_ITEM " & _
            " SET " & _
            " CD_INCOTERM = " & cd_incoterm & " " & _
            " WHERE " & _
            " NR_PROCESSO = '" & txtNrPedido.Text & "' AND " & _
            " CD_EMPRESA = '" & txtCdCliente.Text & "' "
            'Response.Write(sqlPedido.UpdateCommand)
            'Response.End()
            sqlPedido.Update()
        End If
        
        
        If ddlInconterm.SelectedItem.Value <> "" Then cd_incoterm = "'" & ddlInconterm.SelectedItem.Value & "'" Else cd_incoterm = "NULL"
        
        sqlPedido.UpdateCommand = " UPDATE TPROCESSO " & _
        " SET " & _
        " CD_UNID_NEG = '" & txtCdUnidade.Text & "', " & _
        " CD_PRODUTO = '06', " & _
        " CD_CLIENTE = '" & txtCdCliente.Text & "', " & _
        " CD_SERVICO = '" & txtCdServico.Text & "', " & _
        " IN_CANCELADO = '0', " & _
        " CD_AGENTE = " & cd_agente & ", " & _
        " CD_EMBARCACAO = " & cd_navio & ", " & _
        " NR_VOO = " & nr_voo & ", " & _
        " NR_CONHECIMENTO = " & nr_bl & ", " & _
        " CD_PAIS_ORIGEM = " & cd_pais_origem & ", " & _
        " CD_LOCAL_DESEMBARQUE = " & cd_local_embarque & ", " & _
        " CD_ANALISTA_CLIENTE = " & cd_contato & ", " & _
        " CD_ANALISTA_COMISSARIA = " & cd_analista & ", " & _
        " NR_VIAGEM = " & nr_viagem & ", " & _
        " CD_AREA = '" & txtCdArea.Text & "', " & _
        " CD_INCOTERM = " & cd_incoterm & ", " & _
        " CD_IMPORTADOR = '" & txtCdImportador.Text & "', " & _
        " CD_EXPORTADOR = '" & txtCdExportador.Text & "', " & _
        " NR_REFERENCIA = '" & txtNrPedido.Text & "', " & _
        " CD_TP_PEDIDO = " & cd_pedido & ", " & _
        " NR_REF_EXPORTADOR = " & nr_ref_exportador & ", " & _
        " NR_ORDEM = " & nr_ordem & ", " & _
        " IN_CONSOLIDADO = '0', " & _
        " IN_SEGURO = '0', " & _
        " NR_COURRIER = " & nr_courrier & ", " & _
        " IN_DADOS_IGUAIS_ITENS = " & Math.Abs(CDbl(CInt(CBool(cbDadosIguais.Checked)))) & ", " & _
        " IN_URGENTE = " & Math.Abs(CDbl(CInt(CBool(cbUrgente.Checked)))) & ", " & _
        " DIAS_CONDICAO_PAGTO = " & cd_cond_dias & ", " & _
        " CONDICAO_PAGTO = " & cd_cond_tp & " " & _
        " WHERE NR_PROCESSO = '" & Trim(txtCdUnidade.Text) & "06" & Trim(txtNrProcesso.Text) & "'"
        'Response.Write(sqlPedido.UpdateCommand)
        'Response.End()
        
        sqlPedido.Update()
        Session("status") = "salvar"
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('Referência " & Trim(txtNrPedido.Text) & " salva com sucesso!');", True)
    End Sub
      
    Sub InserirPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedido As SqlDataSource = frmEditaPedido.FindControl("sqlPedido")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim txtCdServico As TextBox = frmEditaPedido.FindControl("txtCdServico")
        Dim txtNrPedido2 As TextBox = frmEditaPedido.FindControl("txtNrPedido2")
        Dim txtNrProcesso As TextBox = frmEditaPedido.FindControl("txtNrProcesso")
        Dim txtCdArea As TextBox = frmEditaPedido.FindControl("txtCdArea")
        Dim txtCdImportador As TextBox = frmEditaPedido.FindControl("txtCdImportador")
        Dim txtCdExportador As TextBox = frmEditaPedido.FindControl("txtCdExportador")
        Dim txtCdContato As TextBox = frmEditaPedido.FindControl("txtCdContato")
        Dim txtCdAnalista As TextBox = frmEditaPedido.FindControl("txtCdAnalista")
        Dim txtNrOrdem As TextBox = frmEditaPedido.FindControl("txtNrOrdem")
        Dim txtRefExportador As TextBox = frmEditaPedido.FindControl("txtRefExportador")
        Dim ddlInconterm As DropDownList = frmEditaPedido.FindControl("ddlInconterm")
        Dim ddlTpPedido As DropDownList = frmEditaPedido.FindControl("ddlTpPedido")
        Dim ddlCondDias As DropDownList = frmEditaPedido.FindControl("ddlCondDias")
        Dim ddlCondTp As DropDownList = frmEditaPedido.FindControl("ddlCondTp")
        Dim txtCdPaisOrigem As TextBox = frmEditaPedido.FindControl("txtCdPaisOrigem")
        Dim txtCdLocalDesembarque As TextBox = frmEditaPedido.FindControl("txtCdLocalDesembarque")
        Dim txtCdNavio As TextBox = frmEditaPedido.FindControl("txtCdNavio")
        Dim txtCdAgenteCarga As TextBox = frmEditaPedido.FindControl("txtCdAgenteCarga")
        Dim txtNrViagem As TextBox = frmEditaPedido.FindControl("txtNrViagem")
        Dim txtNrCourrier As TextBox = frmEditaPedido.FindControl("txtNrCourrier")
        Dim txtNrBl As TextBox = frmEditaPedido.FindControl("txtNrBl")
        Dim txtNrVoo As TextBox = frmEditaPedido.FindControl("txtNrVoo")
        Dim processo_prefixo, nr_processo, cd_grupo As String
        Dim cd_pais_origem, cd_incoterm, cd_local_desembarque, nr_ordem, nr_conhecimento, in_seguro As String
        
        SqlAux = " SELECT H.CD_CLIENTE, H.CD_UNID_NEG, H.CD_PRODUTO, H.IN_ATIVO, H.DT_VALID_CRED_RF," & _
        " E.IN_COMPRADOR, E.NM_EMPRESA, E.CD_GRUPO, E.IN_IMPORTADOR, E.IN_RESTRICAO" & _
        " FROM   TCLIENTE_HABILITACAO H (NOLOCK), TEMPRESA_NAC E (NOLOCK)" & _
        " WHERE H.CD_CLIENTE = E.CD_EMPRESA " & _
        " AND H.CD_CLIENTE  = '" & txtCdCliente.Text & "'" & _
        " AND H.CD_UNID_NEG = '" & txtCdUnidade.Text & "'" & _
        " AND H.CD_PRODUTO  = '06'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        cd_grupo = RsAux("CD_GRUPO")
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = "SELECT CD_VIA_TRANSPORTE FROM TSERVICO WHERE CD_SERVICO = '" & txtCdServico.Text & "'"
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        Session("cd_via_transp") = RsAux("CD_VIA_TRANSPORTE")
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = " SELECT C.CD_CLIENTE, C.CD_UNID_NEG, C.CD_PRODUTO, C.CD_SERVICO, " & _
        " C.CD_PREFIXO, C.IN_ATIVO, C.DT_CAPTACAO, C.PZ_PROPOSTA " & _
        " FROM   TCLIENTE_SERVICO C (NOLOCK) " & _
        " WHERE C.CD_CLIENTE  = '" & txtCdCliente.Text & "' " & _
        " AND C.CD_SERVICO  = '" & txtCdServico.Text & "' " & _
        " AND C.CD_UNID_NEG = '" & txtCdUnidade.Text & "' " & _
        " AND C.CD_PRODUTO  = '06' "
        
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        processo_prefixo = RsAux("CD_PREFIXO")
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = " SELECT NR_PROCESSO, CD_IMPORTADOR, CD_EXPORTADOR, CD_VIA_TRANSP, CD_PAIS_ORIGEM, " & _
        " CD_INCOTERM, CD_AREA, CD_LOCAL_DESEMBARQUE, NR_DOC_HOUSE, NR_ORDEM, ISNULL(IN_SEGURO,'0') AS IN_SEGURO, " & _
        " DT_ABERTURA, NR_VIAGEM, CD_SERVICO, CD_PAIS_AQUISICAO, CD_FABRICANTE, IN_FABR_EXPOR_IMP, CD_EMPRESA " & _
        "     FROM TPO (NOLOCK) " & _
        " WHERE NR_PROCESSO = '" & txtNrPedido2.Text & "' " & _
        "  AND CD_EMPRESA = '" & txtCdCliente.Text & "' "
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        
        If RsAux.HasRows() Then
            RsAux.Read()
            cd_pais_origem = "'" & RsAux("CD_PAIS_ORIGEM") & "'"
            cd_incoterm = "'" & RsAux("CD_INCOTERM") & "'"
            cd_local_desembarque = "'" & RsAux("CD_LOCAL_DESEMBARQUE") & "'"
            nr_ordem = "'" & RsAux("NR_ORDEM") & "'"
            nr_conhecimento = "'" & RsAux("NR_DOC_HOUSE") & "'"
            in_seguro = RsAux("IN_SEGURO")
        Else
            cd_pais_origem = "NULL"
            cd_incoterm = "NULL"
            cd_local_desembarque = "NULL"
            nr_ordem = "NULL"
            nr_conhecimento = "NULL"
            in_seguro = "0"
            
            sqlPedido.InsertCommand = " INSERT INTO TPO " & _
            " (NR_PROCESSO, CD_IMPORTADOR, CD_EXPORTADOR, " & _
            " DT_ABERTURA, CD_AREA, CD_EMPRESA, IN_WEB) " & _
            " VALUES " & _
            " ('" & UCase(txtNrPedido2.Text) & "', '" & txtCdImportador.Text & "', '" & txtCdExportador.Text & "', CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103), " & _
            " '" & txtCdArea.Text & "', '" & txtCdCliente.Text & "','1')"
            sqlPedido.Insert()
        End If
        RsAux.Close()
        CnnAux.Close()
        
        SqlAux = " SELECT ISNULL(MAX(NR_PROCESSO),'') AS NR_PROCESSO " & _
          " FROM TPROCESSO (NOLOCK) " & _
          " WHERE CD_UNID_NEG = '" & Trim(txtCdUnidade.Text) & "' " & _
          "  AND CD_PRODUTO  = '06' " & _
          "  AND DATEPART(yyyy,DT_ABERTURA) = DATEPART(yyyy,GETDATE()) " & _
          "  AND SUBSTRING(NR_PROCESSO,5,2) = '" & processo_prefixo & "' "
        'CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        nr_processo = ""
        If RsAux.HasRows Then
            RsAux.Read()
            If Year(Now) = 2014 Then
                If Mid(Trim(RsAux("NR_PROCESSO")), 8, 6) = "" Or Mid(Trim(RsAux("NR_PROCESSO")), 8, 6) = "999999" Then
                    nr_processo = "000001"
                Else
                    nr_processo = Right("000000" & CStr(CInt(Mid(RsAux("NR_PROCESSO"), 8, 6)) + 1), 6)
                End If
            Else
                If Mid(Trim(RsAux("NR_PROCESSO")), 8, 4) = "" Or Mid(Trim(RsAux("NR_PROCESSO")), 8, 4) = "9999" Then
                    nr_processo = "0001"
                Else
                    nr_processo = Right("0000" & CStr(CInt(Mid(RsAux("NR_PROCESSO"), 8, 4)) + 1), 4)
                End If
            End If
            nr_processo = Trim(txtCdUnidade.Text) & "06" & processo_prefixo & "-" & nr_processo & "-" & Right(Year(Date.Now), 2)
        End If
        RsAux.Close()
        CnnAux.Close()
       
        Try
            sqlPedido.InsertCommand = " INSERT INTO TPROCESSO " & _
              " (NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO, " & _
              " DT_ABERTURA, IN_CANCELADO, NR_CONHECIMENTO, " & _
              " CD_PAIS_ORIGEM, CD_LOCAL_DESEMBARQUE, CD_AREA, CD_INCOTERM, CD_IMPORTADOR, " & _
              " CD_EXPORTADOR, CD_GRUPO, NR_REFERENCIA, HR_ABERTURA, " & _
              " NR_ORDEM, IN_DADOS_IGUAIS_ITENS, IN_LIBERADO, IN_CONSOLIDADO, IN_URGENTE, IN_SEGURO, CD_ANALISTA_CRIADOR, IN_WEB) " & _
              "      VALUES " & _
              "('" & nr_processo & "', '" & txtCdUnidade.Text & "', '06', '" & txtCdCliente.Text & "', '" & txtCdServico.Text & "', CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103), " & _
              " '0', " & nr_conhecimento & ", " & cd_pais_origem & ", " & cd_local_desembarque & ", '" & txtCdArea.Text & "', " & cd_incoterm & ", " & _
              "'" & txtCdImportador.Text & "', '" & txtCdExportador.Text & "',  '" & cd_grupo & "', '" & UCase(txtNrPedido2.Text) & "', GETDATE(), " & _
              " " & nr_ordem & ", '1', '1','0','0','" & in_seguro & "','" & Session("usuario") & "','1') "
          
            sqlPedido.Insert()
            Session("status") = "salvar"
            Page.DataBind()
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & UCase(Trim(txtNrPedido2.Text)) & " salva com sucesso!');location.href = 'pedido_edita.aspx?acao=editar&nr_processo=" + nr_processo + "';", True)
        Catch ex As Exception
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Erro ao tentar salvar a referência " & UCase(Trim(txtNrPedido2.Text)) & "!');", True)
        End Try
    End Sub
  
    Sub ExcluirPedido(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim sqlPedido As SqlDataSource = frmEditaPedido.FindControl("sqlPedido")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        Dim txtNrPedido As TextBox = frmEditaPedido.FindControl("txtNrPedido")
        Dim txtNrProcesso As TextBox = frmEditaPedido.FindControl("txtNrProcesso")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim qtde_ref, qtde As Integer
        
        SqlAux = " SELECT COUNT(*) AS QTDE_REF FROM TREF_CLIENTE WHERE CD_REFERENCIA = '" & txtNrPedido.Text & "'  AND CD_EMPRESA = '" & txtCdCliente.Text & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        qtde_ref = RsAux("QTDE_REF")
        RsAux.Close()
        CnnAux.Close()

        If qtde_ref = 0 Then
            SqlAux = " SELECT COUNT(*) AS QTDE FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & txtNrPedido.Text & "'  AND CD_EMPRESA ='" & txtCdCliente.Text & "' AND NR_PARCIAL>0"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            qtde = RsAux("QTDE")
            RsAux.Close()
            CnnAux.Close()
            If qtde = 0 Then
                sqlPedido.DeleteCommand = "UPDATE TPROCESSO SET IN_CANCELADO = 1 WHERE NR_PROCESSO = '" & Request.QueryString("nr_processo")  & "'"
                sqlPedido.Delete()
                sqlPedido.DeleteCommand = "DELETE FROM TPO " & _
                " WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND CD_EMPRESA = '" & txtCdCliente.Text & "' "
                sqlPedido.Delete()
                sqlPedido.DeleteCommand = "DELETE FROM TPO_ITEM " & _
                " WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND CD_EMPRESA = '" & txtCdCliente.Text & "' "
                sqlPedido.Delete()
                Page.DataBind()
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & txtNrPedido.Text & " excluída com sucesso!');location.href='pedido_edita.aspx?acao=lista';", True)
            Else
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Primeiramente exclua as parciais deste item!');location.href='pedido_edita.aspx?acao=editar&nr_processo=" & Request.QueryString("nr_processo") & "';", True)
            End If
        Else
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & txtNrPedido.Text & " já está sendo utilizada por um processo!');location.href='pedido_edita.aspx?acao=editar&nr_processo=" & Request.QueryString("nr_processo") & "';", True)
        End If
    End Sub
    
    Sub ExcluirPedidoItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim frmEditaPedidoItem As FormView = frmEditaPedido.FindControl("frmEditaPedidoItem")
        Dim SqlItemPedido As SqlDataSource = frmEditaPedidoItem.FindControl("SqlItemPedido")
        Dim txtCdUnidade As TextBox = frmEditaPedido.FindControl("txtCdUnidade")
        Dim txtNrPedido As TextBox = frmEditaPedido.FindControl("txtNrPedido")
        Dim txtCdCliente As TextBox = frmEditaPedido.FindControl("txtCdCliente")
        Dim txtNrItem As TextBox = frmEditaPedidoItem.FindControl("txtNrItem")
        Dim txtNrItemCliente As TextBox = frmEditaPedidoItem.FindControl("txtNrItemCliente")
        Dim qtde, qtde_ref As Integer
        
        SqlAux = " SELECT COUNT(*) AS QTDE_REF FROM TREF_CLIENTE WHERE CD_REFERENCIA = '" & txtNrPedido.Text & "' AND NR_ITEM_PO = '" & txtNrItemCliente.Text & "' AND CD_EMPRESA = '" & txtCdCliente.Text & "'"
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        RsAux.Read()
        qtde_ref = RsAux("QTDE_REF")
        RsAux.Close()
        CnnAux.Close()
        
        If qtde_ref = 0 Then
            If txtCdCliente.Text = "00500" or txtCdCliente.Text = "03185" Then 
                SqlItemPedido.DeleteCommand = "DELETE FROM TPO_ITEM " & _
                     " WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND CD_EMPRESA = '" & txtCdCliente.Text & "' AND NR_ITEM_CLIENTE = '" & txtNrItemCliente.Text & "' "
                SqlItemPedido.Delete()
                Page.DataBind()
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & txtNrPedido.Text & "/" & txtNrItemCliente.Text & " excluída com sucesso!');location.href='pedido_edita.aspx?acao=listar_item&nr_processo=" & Request.QueryString("nr_processo") & "';", True)
            Else
                SqlAux = " SELECT COUNT(*) AS QTDE FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND NR_ITEM_CLIENTE = '" & txtNrItemCliente.Text & "' AND CD_EMPRESA ='" & txtCdCliente.Text & "' AND NR_PARCIAL>0"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                RsAux.Read()
                qtde = RsAux("QTDE")
                RsAux.Close()
                CnnAux.Close()
                If qtde = 0 Then
                    SqlItemPedido.DeleteCommand = "DELETE FROM TPO_ITEM " & _
                    " WHERE NR_PROCESSO = '" & txtNrPedido.Text & "' AND CD_EMPRESA = '" & txtCdCliente.Text & "' AND NR_ITEM = '" & txtNrItem.Text & "' "
                    SqlItemPedido.Delete()
                    Page.DataBind()
                    Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & txtNrPedido.Text & "/" & txtNrItemCliente.Text & " excluída com sucesso!');location.href='pedido_edita.aspx?acao=listar_item&nr_processo=" & Request.QueryString("nr_processo") & "';", True)
                Else
                    Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Primeiramente exclua as parciais deste item!');location.href='pedido_edita.aspx?acao=editar_item&nr_processo=" & Request.QueryString("nr_processo") & "&item_cliente=" & txtNrItemCliente.Text & "';", True)
                End If
            End If
        Else
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Referência " & txtNrPedido.Text & "/" & txtNrItemCliente.Text & " já está sendo utilizada por um processo!');location.href='pedido_edita.aspx?acao=editar_item&nr_processo=" & Request.QueryString("nr_processo") & "&item_cliente=" & txtNrItemCliente.Text & "';", True)
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

    function verificaQtde() {
        var qtde1 = parseFloat(document.getElementById('txtQtdeBaixar').value);
        var qtde2 = parseFloat(document.getElementById('txtQtdeInicial').value);
        document.getElementById('txtQtdeBaixar').value = qtde1;
        if (qtde1 > qtde2) {
            alert('ATENÇÃO: A quantidade baixada é maior que a quantidade disponível.')
            document.getElementById('txtQtdeBaixar').focus();
        }
        if (qtde1 < 0) {
            alert('ATENÇÃO: A quantidade baixada não pode ser menor que 0.')
            document.getElementById('txtQtdeBaixar').focus();    
        }
    }

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

    function numberFormat(value, dec, decsep, milsep) {
        dec = (typeof (dec) == 'undefined' ? 2 : dec);
        decsep = (typeof (decsep) == 'undefined' ? ',' : decsep);
        milsep = (typeof (milsep) == 'undefined' ? '.' : milsep);
        //
        value = value.toFixed(dec)
        //
        var localValue = value.toString();
        var arr = localValue.split('.');
        if (arr.length > 1)
            arr[1] = (decsep + arr[1]);
        var re = /(\d+)(\d{3})/;
        while (re.test(arr[0]))
            arr[0] = arr[0].replace(re, '$1' + milsep + '$2');
        return arr[0] + arr[1];
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

    function preencheItem(vCodigo) {
        var vCod = vCodigo.value;
        if (vCod.length > 0 && vCod != 0) {
            for (i = vCod.length; i < vCodigo.maxLength; i++)
                vCod = '0' + String(vCod);
            vCodigo.value = vCod;
        } 
    }
    function preencheNome(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                //vCod = vCod.replace(" ", "");
                if (vCod.length > 0) {
                    for (i = vCod.length; i < vCodigo.maxLength; i++)
                        vCod = '0' + String(vCod);
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
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
                                    if (vCodigo.style.backgroundColor != 'red') {
                                        vCodigo.style.backgroundColor = vCodigo.style.backgroundColor;
                                    } else {
                                        vCodigo.style.backgroundColor = 'white';
                                    }
                                    vDesc.value = vResult.toUpperCase();
                                } else {
                                    alert('ATENÇÃO: Código Inválido!\nUtilize a consulta para encontrar o código correto.');
                                    vCodigo.style.backgroundColor = 'red';
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

    function preencheMercadoria(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                //vCod = vCod.replace(" ", "");
                if (vCod.length > 0 && vCod != 0) {
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
                    ajax.open("GET", "/popup/fast_lookup2.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "";
                        }
                        if (ajax.readyState == 4) { //agora exibe o que interessa
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText; //resultado da busca
                                if (vResult.indexOf('erro') != 0) {
                                    if (vEdit == 'frmEditaPedido_frmEditaPedidoItem_txtVlUnit'){
                                        vDesc.value = parseFloat(vResult)
                                    }else{
                                        vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                                        vResult = unescape(vResult); //continua resolvendo problemas de acento
                                        vCodigo.style.background = 'white';
                                        vDesc.value = vResult.toUpperCase();    
                                    }
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

    function preencheCombo(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                //vCod = vCod.replace(" ", "");
                if (vCod.length > 0 && vCod != 0) {
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
                    ajax.open("GET", "/popup/fast_lookup2.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "";
                        }
                        if (ajax.readyState == 4) { //agora exibe o que interessa
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText; //resultado da busca
                                if (vResult.indexOf('erro') != 0) {
                                    //vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                                    //vResult = unescape(vResult); //continua resolvendo problemas de acento
                                    //vCodigo.style.background = 'white';
                                    vDesc.value = vResult;

                                } else {
                                    alert('Ocorreu um erro desconhecido, entre em contato com suporte@myindaia.com.br!');
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
        
    function preencheCheckbox(vTabela, vCampos, vReturn, vCodigo, vEdit) {
        if (document.getElementById) {
            var vDesc = document.getElementById(vEdit); //edit onde será colocada a descrição
            var vCod = vCodigo.value; //código que iremos pesquisar na tabela
            vDesc.value = "";
            //alert(Left(vCod, 1));
            if (Left(vCod, 1) != ' ' && vCod != '' && vCod != undefined) {
                //vCod = vCod.replace(" ", "");
                if (vCod.length > 0 && vCod != 0) {
                    vCodigo.value = vCod;
                    //iniciamos a busca através do ajax
                    var ajax = openAjax();
                    ajax.open("GET", "/popup/fast_lookup2.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "";
                        }
                        if (ajax.readyState == 4) { //agora exibe o que interessa
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText; //resultado da busca
                                if (vResult.indexOf('erro') != 0) {
                                    //vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                                    //vResult = unescape(vResult); //continua resolvendo problemas de acento
                                    //vCodigo.style.background = 'white';
                                    //alert(vResult);
                                    if (vResult == 0) {
                                        vDesc.checked = false;
                                    } else {
                                        vDesc.checked = true;
                                    }
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

    function preencheValoresMercadoria() {
        var mercadoria = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria').value;
        if (Trim(mercadoria) != '') {
            var ajax = openAjax();
            ajax.open("GET", "pedido_mercadoria.asp?mercadoria=" + escape(mercadoria), true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        //alert(vResult);
                        if (vResult != "NAO") {
                            var vResultArray = vResult.split('|')
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNCM').value = vResultArray[0];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlUnit').value = parseFloat(vResultArray[1]);
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtPlItem').value = parseFloat(vResultArray[2]);
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiSh').value = vResultArray[3];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiNcca').value = vResultArray[4];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtTxMercadoria').value = vResultArray[5];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante').value = vResultArray[6];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_ddlTpCalculo').value = vResultArray[7];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem').value = vResultArray[8];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida').value = vResultArray[9];
                            if (vResultArray[10] == '0') { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbLi').checked = false }
                            else { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbLi').checked = true }
                            if (vResultArray[11] == '0') { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbDrawback').checked = false }
                            else { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbDrawback').checked = true }
                            preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida'), 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');
                            preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');
                            preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');
                            preencheMercadoria('TMERCADORIA', 'CD_MERCADORIA', 'AP_MERCADORIA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_txtNmMercadoria');
                            //calculaValor();
                        } else {
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNCM').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlUnit').value = 0;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlItem').value = 0;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtPlItem').value = 0;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiSh').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiNcca').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtTxMercadoria').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_ddlTpCalculo').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida').value = "";
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbLi').checked = false;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbDrawback').checked = false;
                            preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida'), 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');
                            preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');
                            preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');
                            preencheMercadoria('TMERCADORIA', 'CD_MERCADORIA', 'AP_MERCADORIA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_txtNmMercadoria');
                            //calculaValor();
                        }
                    }
                }
            }
            ajax.send(null);
        } else {
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNCM').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlUnit').value = 0;
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlItem').value = 0;
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtPlItem').value = 0;
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiSh').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNaladiNcca').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtTxMercadoria').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_ddlTpCalculo').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida').value = "";
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbLi').checked = false;
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbDrawback').checked = false;
        preencheMercadoria('TMERCADORIA', 'CD_MERCADORIA', 'AP_MERCADORIA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_txtNmMercadoria');
        preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida'), 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');
        preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');
        preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');
        //calculaValor();
    }        
   }

    function calculaParcial(vFeatures) {
        var ajax = openAjax();
        ajax.open("POST", "calcula_parcial.aspx?" + vFeatures+'&usuario=<%=Session("usuario")%>', true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    if (vResult == "") {
                        alert('ATENÇÃO: Pedido/Item/Parcial criado com sucesso!');
                        FechaBaixaParcial();
                        ExibeParciais('Parciais', 'divInfoCorpo', 'divInfo', 'divInfoRodape', vFeatures, 'pedido_parcial', 700, 300, -100);
                    } else {
                        //alert(vResult)
                        alert('ATENÇÃO: Erro ao tentar criar Pedido/Item/Parcial!')
                    }
                }
            }
        }
        ajax.send(null);
    }

    function excluiParcial(vFeatures) {
        if (confirm('ATENÇÃO: Deseja realmente excluir este Pedido/Item/Parcial?')) {
            var ajax = openAjax();
            ajax.open("POST", "excluir_parcial.aspx?" + vFeatures, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        if (vResult == "") {
                            alert('ATENÇÃO: Pedido/Item/Parcial excluído com sucesso!');
                            FechaBaixaParcial();
                            ExibeParciais('Parciais', 'divInfoCorpo', 'divInfo', '', vFeatures, 'pedido_parcial', 700, 300, -100);
                        } else {
                            if (vResult == "NAO2") {
                                alert('ATENÇÃO: Este Pedido/Item/Parcial já está associado a uma ID!')
                            } else {
                                if (vResult == "NAO3") {
                                    alert('ATENÇÃO: Este Pedido/Item/Parcial já está sendo utilizado por um processo!')
                                } else {
                                    alert('ATENÇÃO: Erro ao tentar excluir Pedido/Item/Parcial!')
                                }
                            }
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function BaixaParcial(vFeatures) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '130';
            var z = '160';

            var vCorpo = document.getElementById('divParcial');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            //vCorpo.style.left = vCorpo.style.left;
            vCorpo.style.top = ((y4) / 2)-25;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", "pedido_baixar.aspx?" + vFeatures, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:55%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                }
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

    function FechaBaixaParcial() {
        var div = document.getElementById('divParcial');
        div.style.display = "none";
    }

    function ExibeParciais(titulo, vDiv, vDiv2, vDiv3, vFeatures, arquivo, width, height, posicao) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = width;
            var z = height-50;
                    
            var vCorpo = document.getElementById('divInfoCorpo2');
            var vInfo = document.getElementById('divInfo2');
            var vTitulo = document.getElementById('divTitulo2');
            var vInfoRodape = document.getElementById(vDiv3);

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - x/4) - w) / 2;
            var x2 = Math.round(x1);

            vInfo.style.width = w;
            vInfo.style.height = 50;
            vInfo.style.left = w/2 - 345;
            vInfo.style.top = z/2 + 38;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w/2 - 345;
            vCorpo.style.top = z/2 + 58;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", arquivo + ".aspx?" + vFeatures, true);
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
        document.getElementById('divItensPedido').disabled = true;
        var links = document.getElementsByTagName('a');
        for (var i = 0; i < links.length; i++) {
            links.item(i).href = "#";
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
            vInfo.style.left = w / 2 - 150;
            vInfo.style.top = z / 2+10;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w/2 - 150;
            vCorpo.style.top = (z / 2) + 50;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";
        
            var ajax = openAjax();
            ajax.open("GET",arquivo + ".aspx?" + vFeatures, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                }
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = unescape(vResult);
                        vResult = vResult.replace(/\+/g, " ");
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
    
    function FechaDetalhes(vDiv1, vDiv2) {
        n = 0;
        if (document.getElementById) {
            var div = document.getElementById(vDiv1);
            var div2 = document.getElementById(vDiv2);
            div.style.display = "none";
            div2.style.display = "none";
        }
        if (vDiv1 == 'divInfoCorpo2') {
            document.location = 'pedido_edita.aspx?acao=listar_item&nr_processo=<%=Request.querystring("nr_processo") %>'
        }
    }

    function carregaPedido() {
        if ('<%=Request("acao") %>' == 'novo') {
            document.getElementById('frmEditaPedido_txtCdArea').disabled = false;
            document.getElementById('frmEditaPedido_txtNmArea').disabled = false;
            document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#FFFFFF';
            document.getElementById('frmEditaPedido_txtCdImportador').disabled = false;
            document.getElementById('frmEditaPedido_txtNmImportador').disabled = false;
            document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#FFFFFF';
            document.getElementById('frmEditaPedido_txtCdExportador').disabled = false;
            document.getElementById('frmEditaPedido_txtNmExportador').disabled = false;
            document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#FFFFFF';
            preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', document.getElementById('frmEditaPedido_txtCdUnidade'), 'frmEditaPedido_txtNmUnidade');        
            preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdCliente'), 'frmEditaPedido_txtNmCliente');
            preencheNome('TSERVICO', 'CD_SERVICO', 'NM_SERVICO', document.getElementById('frmEditaPedido_txtCdServico'), 'frmEditaPedido_txtNmServico');
            preencheNome('TAREA', 'CD_AREA', 'NM_AREA', document.getElementById('frmEditaPedido_txtCdArea'), 'frmEditaPedido_txtNmArea');
            preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdImportador'), 'frmEditaPedido_txtNmImportador');
            preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdExportador'), 'frmEditaPedido_txtNmExportador');
        } else {
            preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', document.getElementById('frmEditaPedido_txtCdUnidade'), 'frmEditaPedido_txtNmUnidade');
            preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdCliente'), 'frmEditaPedido_txtNmCliente');
            preencheNome('TSERVICO', 'CD_SERVICO', 'NM_SERVICO', document.getElementById('frmEditaPedido_txtCdServico'), 'frmEditaPedido_txtNmServico');
            preencheNome('TAREA', 'CD_AREA', 'NM_AREA', document.getElementById('frmEditaPedido_txtCdArea'), 'frmEditaPedido_txtNmArea');
            preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdImportador'), 'frmEditaPedido_txtNmImportador');
            preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_txtCdExportador'), 'frmEditaPedido_txtNmExportador');
            if ('<%=Request("acao") %>' != '' && '<%=Request("acao") %>' != 'lista') {
                preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', document.getElementById('frmEditaPedido_txtCdContato'), 'frmEditaPedido_txtNmContato');
                if ('<%= Session("cd_cargo") %>' != '040' && '<%= Session("cd_cargo") %>' != '055' && '<%= Session("cd_cargo") %>' != '088') {
                    preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', document.getElementById('frmEditaPedido_txtCdAnalista'), 'frmEditaPedido_txtNmAnalista');
                }
                preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_txtCdPaisOrigem'), 'frmEditaPedido_txtNmPaisOrigem');
                preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', document.getElementById('frmEditaPedido_txtCdLocalDesembarque'), 'frmEditaPedido_txtNmLocalDesembarque');
                preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', document.getElementById('frmEditaPedido_txtCdAgenteCarga'), 'frmEditaPedido_txtNmAgenteCarga');
                preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', document.getElementById('frmEditaPedido_txtCdNavio'), 'frmEditaPedido_txtNmNavio');
                verificaConsistencia(document.getElementById('frmEditaPedido_txtCdCliente'), 'CLIENTE', document.getElementById('frmEditaPedido_txtCdCliente').value);
                verificaConsistencia(document.getElementById('frmEditaPedido_txtCdServico'), 'SERVICO', document.getElementById('frmEditaPedido_txtCdServico').value);
                if ('<%=Session("cd_via_transp")%>' == '01') {
                    document.getElementById('frmEditaPedido_txtNrVoo').value = '';
                    document.getElementById('frmEditaPedido_txtNrVoo').disabled = true;
                    document.getElementById('frmEditaPedido_txtNrVoo').style.backgroundColor = '#DEE6EF';
                } else {
                    document.getElementById('frmEditaPedido_txtNrVoo').value = '';
                    document.getElementById('frmEditaPedido_txtNrViagem').disabled = true;
                    document.getElementById('frmEditaPedido_txtNrViagem').style.backgroundColor = '#DEE6EF';
                    document.getElementById('imgViagem').disabled = true;
                    document.getElementById('frmEditaPedido_txtCdNavio').value = '';
                    document.getElementById('frmEditaPedido_txtNmNavio').value = '';
                    document.getElementById('frmEditaPedido_txtCdNavio').disabled = true;
                    document.getElementById('frmEditaPedido_txtNmNavio').disabled = true;
                    document.getElementById('frmEditaPedido_txtCdNavio').style.backgroundColor = '#DEE6EF';
                    document.getElementById('imgNavio').disabled = true;
                }
            } 
        }
    }

    function carregaTelas(div1, div2, div3) {
        if (document.getElementById(div1).style.display != 'block') {
            if ('<%=Request("acao") %>' == 'listar_item' && div1 == 'divItensPedido') {
                    document.getElementById('divPrincipalPedido').style.display = 'none';
                    document.getElementById('divPrincipalPedidoCabec').style.backgroundColor = '#FFFFFF';
                    document.getElementById('divPrincipalPedidoLink').style.color = '#374BAE';
                    document.getElementById('divPrincipalPedidoLink').style.cursor = "pointer";

                    document.getElementById('divDadosPedido').style.display = 'none';
                    document.getElementById('divDadosPedidoCabec').style.backgroundColor = '#FFFFFF';
                    document.getElementById('divDadosPedidoLink').style.color = '#374BAE';
                    document.getElementById('divDadosPedidoLink').style.cursor = "pointer";
                    
                    document.getElementById('divItensPedido').style.display = 'block';
                    document.getElementById('divItensPedidoCabec').style.backgroundColor = '#374BAE';
                    document.getElementById('divItensPedidoLink').style.color = '#FFFFFF';
                    document.getElementById('divItensPedidoLink').style.cursor = "default";

                    document.getElementById('divListaPedidoItem').style.display = 'block';
                    document.getElementById('divDadosPedidoItem').style.display = 'none';
                    document.getElementById('divListaPedidoItemCabec').style.backgroundColor = '#374BAE';
                    document.getElementById('divListaPedidoItemLink').style.color = '#FFFFFF';
                    document.getElementById('divListaPedidoItemLink').style.cursor = "default";
                    document.getElementById('divDadosPedidoItemCabec').style.backgroundColor = '#FFFFFF';
                    document.getElementById('divDadosPedidoItemLink').style.color = '#374BAE';
                    document.getElementById('divDadosPedidoItemLink').style.cursor = "pointer";
                } else {
                if (('<%=Request("acao") %>' == 'editar_item' || '<%=Request("acao") %>'== 'novo_item') && div1 == 'divItensPedido') {
                        document.getElementById('divPrincipalPedido').style.display = 'none';
                        document.getElementById('divPrincipalPedidoCabec').style.backgroundColor = '#FFFFFF';
                        document.getElementById('divPrincipalPedidoLink').style.color = '#374BAE';
                        document.getElementById('divPrincipalPedidoLink').style.cursor = "pointer";

                        document.getElementById('divDadosPedido').style.display = 'none';
                        document.getElementById('divDadosPedidoCabec').style.backgroundColor = '#FFFFFF';
                        document.getElementById('divDadosPedidoLink').style.color = '#374BAE';
                        document.getElementById('divDadosPedidoLink').style.cursor = "pointer";

                        document.getElementById('divItensPedido').style.display = 'block';
                        document.getElementById('divItensPedidoCabec').style.backgroundColor = '#374BAE';
                        document.getElementById('divItensPedidoLink').style.color = '#FFFFFF';
                        document.getElementById('divItensPedidoLink').style.cursor = "default";

                        document.getElementById('divListaPedidoItem').style.display = 'none';
                        document.getElementById('divDadosPedidoItem').style.display = 'block';
                        document.getElementById('divListaPedidoItemCabec').style.backgroundColor = '#FFFFFF';
                        document.getElementById('divListaPedidoItemLink').style.color = '#374BAE';
                        document.getElementById('divListaPedidoItemLink').style.cursor = "pointer";
                        document.getElementById('divDadosPedidoItemCabec').style.backgroundColor = '#374BAE';
                        document.getElementById('divDadosPedidoItemLink').style.color = '#FFFFFF';
                        document.getElementById('divDadosPedidoItemLink').style.cursor = "default";

                        if ('<%=Session("cd_via_transp")%>' == '01') {
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrVoo').value = '';
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrVoo').disabled = true;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrVoo').style.backgroundColor = '#DEE6EF';
                        } else {
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrVoo').value = '';
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrViagem').disabled = true;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrViagem').style.backgroundColor = '#DEE6EF';
                            document.getElementById('imgViagem').disabled = true;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value = '';
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNmNavio').value = '';
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').disabled = true;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNmNavio').disabled = true;
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').style.backgroundColor = '#DEE6EF';
                            document.getElementById('imgNavio').disabled = true;
                        }
    
                        preencheNome('TAREA', 'CD_AREA', 'NM_AREA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdAreaItem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmAreaItem');
                        preencheMercadoria('TMERCADORIA', 'CD_MERCADORIA', 'AP_MERCADORIA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_txtNmMercadoria');
                        preencheMercadoria('TMERCADORIA', 'CD_MERCADORIA', 'CD_NCM_SH', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_txtNCM');
                        //preencheCheckbox('TMERCADORIA', 'CD_MERCADORIA', 'IN_NECESSITA_LI', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_cbLi');
                        //preencheCheckbox('TMERCADORIA', 'CD_MERCADORIA', 'IN_DRAWBACK', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria'), 'frmEditaPedido_frmEditaPedidoItem_cbDrawBack');
                        preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida'), 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');
                        preencheNome('TMOEDA_BROKER', 'CD_MOEDA', 'NM_MOEDA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdMoeda'), 'frmEditaPedido_frmEditaPedidoItem_txtNmMoeda');
                        preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');
                        preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');
                        preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque'), 'frmEditaPedido_frmEditaPedidoItem_txtNmLocalDesembarque');
                        preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdAgenteCarga'), 'frmEditaPedido_frmEditaPedidoItem_txtNmAgenteCarga');
                        preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio'), 'frmEditaPedido_frmEditaPedidoItem_txtNmNavio');
                        //calculaValor();
                    } else {
                    if ('<%=Session("status")%>' != 'novo' && '<%=Request("acao")%>' != 'lista') {
                        document.getElementById('divInfoCorpo2').style.display = 'none';
                        document.getElementById('divInfo2').style.display = 'none';
                        document.getElementById('divItensPedido').disabled = false;
                        
                        document.getElementById(div2).style.display = 'none';
                        document.getElementById(div1 + 'Cabec').style.backgroundColor = '#374BAE';
                        document.getElementById(div1 + 'Link').style.color = '#FFFFFF';
                        document.getElementById(div1 + 'Link').style.cursor = "default";
                        document.getElementById(div1).style.display = 'block';
                        document.getElementById(div2 + 'Cabec').style.backgroundColor = '#FFFFFF';
                        document.getElementById(div2 + 'Link').style.color = '#374BAE';
                        document.getElementById(div2 + 'Link').style.cursor = "pointer";
                        document.getElementById(div2).style.display = 'none';
                        document.getElementById(div3 + 'Cabec').style.backgroundColor = '#FFFFFF';
                        document.getElementById(div3 + 'Link').style.color = '#374BAE';
                        document.getElementById(div3 + 'Link').style.cursor = "pointer";
                        document.getElementById(div3).style.display = 'none';
                        }else{
                        alert('ATENÇÃO: Primeiramente salve ou cancele a nova gestão de pedido!')
                    }
                }
            }
            carregaPedido();
        }
    }

    function verificaModalidade() {
        var ajax = openAjax();
        ajax.open("GET", "verifica_modalidade.aspx?cd_servico=" + document.getElementById('frmEditaPedido_txtCdServico').value, true);
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    if (vResult != "") {
                        document.getElementById('txtCdModalidade').value = vResult;
                    }
                }
            }
        }
        ajax.send(null);
    }

    function copiarPedido() {
        var nr_processo = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrProcesso').value;
        var ajax = openAjax();
        ajax.open("GET", "pedido_copiar.aspx?nr_processo=" + nr_processo, true);
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    if (vResult != "NAO") {
                        var vResultArray = vResult.split('|')
                        if (confirm('ATENÇÃO: Deseja realmente copiar as informações do pedido?')) {
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem').value = vResultArray[0];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque').value = vResultArray[1];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value = vResultArray[2];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdAgenteCarga').value = vResultArray[3];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrViagem').value = vResultArray[4];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrVoo').value = vResultArray[5];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrBl').value = vResultArray[6];
                            document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrCourrier').value = vResultArray[7];
                            preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem'), 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');
                            preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque'), 'frmEditaPedido_frmEditaPedidoItem_txtNmLocalDesembarque');
                            preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdAgenteCarga'), 'frmEditaPedido_frmEditaPedidoItem_txtNmAgenteCarga');
                            preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio'), 'frmEditaPedido_frmEditaPedidoItem_txtNmNavio');
                            if (vResultArray[8] = '0') { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbConsolidado').checked = false }
                            else { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbConsolidado').checked = true }
                            if (vResultArray[9] = '0') { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbUrgente').checked = false }
                            else { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbUrgente').checked = true }
                            if (vResultArray[10] = '0') { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbSeguro').checked = false }
                            else { document.getElementById('frmEditaPedido_frmEditaPedidoItem_cbSeguro').checked = true }
                        }
                    }
                }
            }
        }
        ajax.send(null);
    }

    function calculaValor() {
        var qtde = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtQtde').value;
        if (qtde == '') { qtde = 0}
        var vl_unit = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlUnit').value;
        if (vl_unit == '') { vl_unit = 0 }
        var pl_item = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtPlItem').value;        
        if (pl_item == '') { pl_item = 0 }
        var tp_calculo = document.getElementById('frmEditaPedido_frmEditaPedidoItem_ddlTpCalculo').value;
        if (tp_calculo == '') { tp_calculo = "1" };
 
        var ajax = openAjax();
        ajax.open("GET", "pedido_valor.aspx?qtde=" + qtde + "&vl_unit="+vl_unit+"&pl_item="+pl_item+"&tp_calculo="+tp_calculo, true);
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    if (vResult != "") {
                        //vResult = numberFormat(parseFloat(vResult), 5, ',', '.');
                        //vResult = vResult.replace('.', '');
                        //document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlItem').readOnly = false;
                        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlItem').value = vResult;
                        //document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlItem').readOnly = true;
                    }
                }
            }
        }

        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtQtde').value = qtde;
        document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtVlUnit').value = vl_unit;
        ajax.send(null);
    }
    
    function verificaViagem(viagem, unid_neg, navio, local) {
        if (Trim(viagem) != '' && Trim(unid_neg) != '' & Trim(navio) != '' & Trim(local) != '') {
            var ajax = openAjax();
            ajax.open("GET", "verifica_viagem.aspx?viagem=" + viagem + "&cd_unid_neg=" + unid_neg + "&local=" + local + "&navio=" + navio + "&campo=frmEditaPedido_txtNrViagem", true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult != "SIM") {
                            alert("Viagem Inválida!")
                            document.getElementById('frmEditaPedido_txtNrViagem').focus();
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function verificaConsistencia(campo, codigo, valor) {
        if (Trim(valor) != '') {
            var ajax = openAjax();
            ajax.open("GET", "pedido_consistencia.aspx?cd_unid_neg=" + document.getElementById('frmEditaPedido_txtCdUnidade').value + "&cd_cliente=" + document.getElementById('frmEditaPedido_txtCdCliente').value + "&cd_servico=" + document.getElementById('frmEditaPedido_txtCdServico').value + "&codigo=" + codigo, true);
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult != "") {
                            alert(vResult)
                            campo.focus();
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function verificaPedido(pedido, unid_neg, cliente, campo) {
        if ('<%=Request.QueryString("acao")%>' != 'novo') {
            if (campo == 'frmEditaPedido_txtNrPedido') {
                if (Trim(pedido) != '' && (Trim(document.getElementById('frmEditaPedido_txtNrProcesso').value) == '')) {
                    var ajax = openAjax();
                    ajax.open("GET", "verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&campo=" + campo, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                if (vResult == "2") {
                                    document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                                    document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                                    document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                                    alert("ATENÇÃO: Pedido Inválido!");
                                    document.getElementById(campo).focus();
                                } else {
                                    if (vResult == "1") {
                                        document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                                        alert("ATENÇÃO: Pedido em duplicidade.\nFavor preencher o campo 'Cliente'!");
                                        document.getElementById(campo).focus();
                                    } else {
                                        location.href = 'pedido_edita.aspx?acao=editar&nr_processo=' + vResult;
                                        document.getElementById('frmEditaPedido_txtCdArea').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmArea').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#FFFFFF';
                                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#FFFFFF';
                                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#FFFFFF';
                                    }
                                }
                            }
                        }
                    }
                    ajax.send(null);
                } else {
                    if (Trim(document.getElementById('frmEditaPedido_txtNrProcesso').value) == '') {
                        document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                    }
                }
            } else {
                if ((Trim(pedido) != '') && (Trim(document.getElementById('frmEditaPedido_txtNrPedido').value) == '')) {
                    var ajax = openAjax();
                    ajax.open("GET", "verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&campo=" + campo, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                if (vResult == "2") {
                                    document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                                    document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                                    document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                                    document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                                    alert("ATENÇÃO: Pedido Inválido!");
                                    document.getElementById(campo).focus();
                                } else {
                                    if (vResult == "1") {
                                        document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                                        alert("ATENÇÃO: Pedido em duplicidade.\nFavor preencher o campo 'Cliente'!");
                                        document.getElementById(campo).focus();
                                    } else {
                                        location.href = 'pedido_edita.aspx?acao=editar&nr_processo=' + vResult;
                                        document.getElementById('frmEditaPedido_txtCdArea').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmArea').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#FFFFFF';
                                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#FFFFFF';
                                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = false;
                                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#FFFFFF';
                                    }
                                }
                            }
                        }
                    }
                    ajax.send(null);
                } else {
                    if (Trim(document.getElementById('frmEditaPedido_txtNrPedido').value) == '') {
                        document.getElementById('frmEditaPedido_txtCdArea').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmArea').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdArea').style.backgroundColor = '#DEE6EF';
                        document.getElementById('frmEditaPedido_txtCdImportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmImportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdImportador').style.backgroundColor = '#DEE6EF';
                        document.getElementById('frmEditaPedido_txtCdExportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtNmExportador').disabled = true;
                        document.getElementById('frmEditaPedido_txtCdExportador').style.backgroundColor = '#DEE6EF';
                    }
                }
            }
        } else {
            if (Trim(pedido) != '') {
                if (Trim(cliente) != '') {
                    var ajax = openAjax();
                    ajax.open("GET", "verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&campo=" + campo, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                if (vResult != "1" && vResult != "2") {
                                    alert("ATENÇÃO: Este pedido já existe!");
                                    document.getElementById(campo).focus();
                                }                               
                            }
                        }
                    }
                    ajax.send(null);
                } else {
                    alert("ATENÇÃO: Favor preencher o campo 'Cliente'");
                    document.getElementById('frmEditaPedido_txtNmCliente').focus();
                }
            }
        }
    }  

    function ExcluirPedido() {
        return (confirm('ATENÇÃO: Deseja realmente excluir este Pedido?'));
    }

    function SalvarPedido() {
        verificaConsistencia(document.getElementById('frmEditaPedido_txtCdCliente'), 'CLIENTE', document.getElementById('frmEditaPedido_txtCdCliente').value); 
        verificaConsistencia(document.getElementById('frmEditaPedido_txtCdServico'), 'SERVICO', document.getElementById('frmEditaPedido_txtCdServico').value);
       
        if (document.getElementById('frmEditaPedido_txtNmUnidade').value == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Unidade'");
            return false;
        }
        if (document.getElementById('frmEditaPedido_txtNmCliente').value == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Cliente'");
            return false;
        }

        if ('<%=Request("acao") %>' == 'novo') {
            if (document.getElementById('frmEditaPedido_txtNrPedido2').value == '') {
                alert("ATENÇÃO: Favor preencher o campo 'Pedido'");
                return false;
            }
        } else {
            if (document.getElementById('frmEditaPedido_txtNrPedido').value == '') {
                alert("ATENÇÃO: Favor preencher o campo 'Pedido'");
                return false;
            }
            if (document.getElementById('frmEditaPedido_txtNrProcesso').value == '') {
                alert("ATENÇÃO: Favor preencher o campo 'Processo'");
                return false;
            }  
        }
        
        if (document.getElementById('frmEditaPedido_txtNmArea').value == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Área'");
            return false;
        }
        if (document.getElementById('frmEditaPedido_txtNmImportador').value == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Importador'");
            return false;
        }
        //if (document.getElementById('frmEditaPedido_txtNmExportador').value == '') {
        //    alert("ATENÇÃO: Favor preencher o campo 'Exportador'");
        //    return false;
        //}
    }

    function SalvarPedidoItem() {
        if (document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrItemCliente').value == '') {
            alert("ATENÇÃO: Favor preencher o campo 'Item (Cliente)'");
            return false;
        } 
    }
    
    function alteraCheck(objeto) {
        if (objeto.checked) {
            document.getElementById('frmEditaPedido_txtNmUsuario3').value = '<%=Session("nm_usuario") %>';
            document.getElementById('frmEditaPedido_txtDtAutorizacao').value = '<%= Right("00" & Date.Today.Day,2) & "/" & Right("00" & Date.Today.Month,2) & "/" & Date.Today.Year %>';
        } else {
            document.getElementById('frmEditaPedido_txtNmUsuario3').value = '';
            document.getElementById('frmEditaPedido_txtDtAutorizacao').value = '';
        }
    }

    function enviaValor(valor, tabela, campo) {        
        document.getElementById(campo).value = Trim(valor);
        document.getElementById(campo).focus();
        document.getElementById(campo).blur();
        FechaDetalhes('divInfoCorpo', 'divInfo');
    }

    function VisualizaFollowup(processo, item, parcial) {
        window.open('../Followup/followup_principal.aspx?nr_processo=' + processo + '&item_cliente=' + item + '&nr_parcial=1', '_blank');
    }
    
    function carregaPedidoItem(tipo) {
        var processo = document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrProcesso').value;
        var ajax = openAjax();
        ajax.open('GET', 'pedido_carrega_item.aspx?nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtNrItemCliente').value + '&tipo=' + tipo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    if (vResult != "NAO1" && vResult != "NAO2") {
                        var vResultArray = vResult.split('|');
                        location.href = 'pedido_edita.aspx?acao=editar_item&nr_processo=' + Trim(processo) + '&item_cliente=' + vResultArray[0];
                    } else {
                        if (vResult == "NAO1") {
                            alert('ATENÇÃO: Não existem itens anteriores à este.');
                        } else {
                            alert('ATENÇÃO: Não existem itens posteriores à este.');
                        }
                    }
                }
            }
        }
        ajax.send(null);
    }

    function carregaItemParcial(processo, item_cliente, empresa, qt_inicial, tipo) {
        var ajax = openAjax();
        ajax.open('GET', 'pedido_carrega_item.aspx?nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + item_cliente + '&tipo=' + tipo, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    if (vResult != "NAO1" && vResult != "NAO2") {
                        var vResultArray = vResult.split('|')
                        ExibeParciais('Parciais', 'divInfoCorpo', 'divInfo', 'divInfoRodape', 'cd_usuario<%=Session("usuario")%>&nr_processo=' + processo + '&nr_item_cliente=' + vResultArray[0] + '&cd_empresa=' + empresa + '&qtde=' + vResultArray[1], 'pedido_parcial', 700, 300, -100);
                    } else {
                        if (vResult == "NAO1") {
                            alert('ATENÇÃO: Não existem itens anteriores à este.');
                        } else {
                            alert('ATENÇÃO: Não existem itens posteriores à este.');
                        }
                    }
                }
            }
        }
        ajax.send(null);    
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
	margin: 0 auto;
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
<body  class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%" onload="<% If Session("status") <> "salvar" and (request("acao") = "editar_item" or request("acao") = "listar_item" or request("acao") = "novo_item") Then%>carregaTelas('divItensPedido','divDadosPedido','divPrincipalPedido');<%Else%><%If request("acao") = "lista" or request("acao") = "" or request("acao")="novo" Then%>document.getElementById('divPrincipalPedido').style.display='block';<%End If%>carregaPedido();<%End If %>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_id2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
	<tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
    </table><!--<div><img src="../../imagens/cabec_logos4.gif"/></div>-->  
    <form id="frmPedido" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:200px">
    <div id="divEdita" style="border-width:0px;top:100px;">
    <asp:FormView ID="frmEditaPedido" runat="server" DataKeyNames="NR_PROCESSO" DataSourceID="SqlEditPedido" BorderWidth="0px" DefaultMode="Edit">
   <EmptyDataTemplate>
    <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f0f1f6;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeydown="if(event.keyCode == 13){findInPage(txtPesquisa.value)};"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>
    <div id="divInfo2" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo2" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo2','divInfo2');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>    
    </div>
    <div id="divInfoCorpo" class="divDetalhes"></div>  
    <div id="divInfoCorpo2" class="divDetalhes"></div> 
    <div id="divParcial" class="divDetalhes2"></div>   
    <div id="divPrincipalPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalPedidoLink" href="#" style="text-decoration:none;cursor:default;color:#FFFFFF;" onclick="carregaTelas('divPrincipalPedido','divDadosPedido','divItensPedido');">Pedido</a></center></div>
    <div id="divDadosPedidoCabec" style="margin-left:3px;float:left;background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divDadosPedidoLink" href="#" style="text-decoration:none;cursor:pointer;color:#374BAE;" onclick="carregaTelas('divDadosPedido','divPrincipalPedido','divItensPedido');">Dados básicos</a></center></div>
    <div id="divItensPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divItensPedidoLink" href="#" style="text-decoration:none;cursor:pointer;color:#374BAE;" onclick="carregaTelas('divItensPedido','divDadosPedido','divPrincipalPedido');">Itens</a></center></div>
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
    <div id="divPrincipalPedido" style="display:none;">
    <div style="float:left;width:150px">&nbsp;</div>
    <div style="height:30px;width:475px;overflow:hidden;top:0px;text-align:right;">
    <%If Request("acao") = "novo" Then%>
    <asp:ImageButton ID="ibFollowupLista" runat="server" ImageUrl="../../imagens/followup2_16d.gif"  style="cursor:pointer;" ToolTip="Visualizar Follow-Up" Enabled="false"/>    
    <asp:ImageButton ID="ibNovaPedidoLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarPedido" style="cursor:pointer;" ToolTip="Criar Pedido" Enabled="false"/>    
    <asp:ImageButton ID="ibCancelarPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarPedido" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
    <asp:ImageButton ID="ibSalvarPedidoLista" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirPedido" style="cursor:pointer;" ToolTip="Salvar"   OnClientClick="return SalvarPedido();"/>    
    <%Else%>
    <asp:ImageButton ID="ibFollowupLista2" runat="server" ImageUrl="../../imagens/followup2_16d.gif" style="cursor:pointer;" ToolTip="Visualizar Follow-Up" Enabled="false"/>   
    <asp:ImageButton ID="ibNovaPedidoLista2" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarPedido" style="cursor:pointer;" ToolTip="Criar Pedido"/>    
    <asp:ImageButton ID="ibCancelarPedidoLista2" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarPedido" style="cursor:pointer;" Enabled ="false" ToolTip="Cancelar/Voltar"/>    
    <asp:ImageButton ID="ibSalvarPedidoLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirPedido" style="cursor:pointer;" Enabled ="false" ToolTip="Salvar" OnClientClick="return SalvarPedido();"/>    
    <%End If%>
    <asp:ImageButton ID="ibExcluirPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirPedido" OnClientClick="return ExcluirPedido();" style="cursor:pointer;" Enabled ="false" ToolTip="Excluir"/>
    </div>
    <br />
    <asp:Label ID="lblUnidade" runat="server" Text="Unidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdUnidade" runat="server" CssClass="textbox" Width="50px" Text='<%# Session("cd_unid_neg") %>' onBlur ="javascript:preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', this, 'frmEditaPedido_txtNmUnidade');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmUnidade" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgUnidade" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Unidades de Negócio','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_NEG&nome=NM_UNID_NEG&tabela=TUNID_NEG&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdUnidade&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br />
    <asp:Label ID="lblCliente" runat="server" Text="Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmCliente');verificaConsistencia(this,'CLIENTE',this.value);" MaxLength="5"/> 
    <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Clientes','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdCliente&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-7);"/><br /><br />
    <asp:Label ID="lblServico" runat="server" Text="Serviço" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <input id="txtCdModalidade" type="hidden" />
    <asp:TextBox ID="txtCdServico" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TSERVICO', 'CD_SERVICO', 'NM_SERVICO', this, 'frmEditaPedido_txtNmServico');verificaConsistencia(this,'SERVICO',this.value);" MaxLength="3"/> 
    <asp:TextBox ID="txtNmServico" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgServico" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Serviços','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_SERVICO&nome=NM_SERVICO&tabela=TSERVICO&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdServico&cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmEditaPedido_txtCdCliente').value+'&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-45);"/><br /><br />
    <%If Request("acao") = "novo" Then%>
    <asp:Label ID="lblPedido2" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl" />&nbsp;
    <asp:TextBox ID="txtNrPedido2" MaxLength="18"  runat="server" CssClass="textbox" Width="150px" Text='' onBlur="verificaPedido(this.value,document.getElementById('frmEditaPedido_txtCdUnidade').value,document.getElementById('frmEditaPedido_txtCdCliente').value, this.id);"/> 
    <img id="imgPedido2" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Pedidos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmEditaPedido_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_REFERENCIA&campo=frmEditaPedido_txtNrPedido2','combo_pedido', 500, 200,-83);"/>&nbsp;&nbsp;
     <asp:Label ID="lblProcesso2" runat="server" Text="Processo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl" style="visibility:hidden;"/>&nbsp;
    <asp:TextBox ID="txtNrProcesso2" MaxLength="12" runat="server" CssClass="textbox" Width="150px" style="visibility:hidden;" onBlur="verificaPedido(this.value,document.getElementById('frmEditaPedido_txtCdUnidade').value,document.getElementById('frmEditaPedido_txtCdCliente').value, this.id);"/> 
    <img id="imgProcesso2" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;visibility:hidden;" onclick="ExibeDetalhes('Processos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmEditaPedido_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_PROCESSO&campo=frmEditaPedido_txtNrProcesso','combo_pedido', 500, 200,-83);"/><br /><br />
    <%Else%>
    <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrPedido" MaxLength="18" runat="server" CssClass="textbox" Width="150px" Text='' onBlur="verificaPedido(this.value,document.getElementById('frmEditaPedido_txtCdUnidade').value,document.getElementById('frmEditaPedido_txtCdCliente').value, this.id);"/> 
    <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Pedidos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmEditaPedido_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_REFERENCIA&campo=frmEditaPedido_txtNrPedido','combo_pedido', 500, 200,-83);"/>&nbsp;&nbsp;
    <asp:Label ID="lblProcesso" runat="server" Text="Processo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrProcesso" MaxLength="12" runat="server" CssClass="textbox" Width="150px" onBlur="verificaPedido(this.value,document.getElementById('frmEditaPedido_txtCdUnidade').value,document.getElementById('frmEditaPedido_txtCdCliente').value, this.id);"/> 
    <img id="imgProcesso" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Processos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmEditaPedido_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_PROCESSO&campo=frmEditaPedido_txtNrProcesso','combo_pedido', 500, 200,-83);"/><br /><br />
    <%End If%>
    <asp:Label ID="lblArea" runat="server" Text="Área" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdArea" Enabled="false" runat="server" CssClass="textbox" Width="50px" Text='' BackColor="#DEE6EF" onBlur ="javascript:preencheNome('TAREA', 'CD_AREA', 'NM_AREA', this, 'frmEditaPedido_txtNmArea');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmArea" Enabled="false" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgArea" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Áreas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AREA&nome=NM_AREA&tabela=TAREA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdArea&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
    <asp:Label ID="lblImportador" runat="server" Text="Importador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdImportador" Enabled="false" runat="server" CssClass="textbox" Width="50px" BackColor="#DEE6EF" Text='' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmImportador');" MaxLength="5"/> 
    <asp:TextBox ID="txtNmImportador" Enabled="false" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgImportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Importadores','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdImportador&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-159);"/><br /><br />
    <asp:Label ID="lblExportador" runat="server" Text="Exportador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdExportador" Enabled="false" runat="server" CssClass="textbox" Width="50px" Text='' BackColor="#DEE6EF" onBlur ="javascript:preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmExportador');" MaxLength="5"/> 
    <asp:TextBox ID="txtNmExportador" Enabled="false" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgExportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Exportadores','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_EST_EXPORTADOR&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdExportador&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-197);"/><br /><br />    
    </div>
    <div id="divDadosPedido" style="display:none;">
    </div> 
    <div id="divItensPedido" style="display:none;">
    </div>     
    <asp:SqlDataSource ID="SqlPedido" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"/>           
    </EmptyDataTemplate>
    <EditItemTemplate>
   <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>    
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f0f1f6;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeydown="if(event.keyCode == 13){findInPage(txtPesquisa.value)};"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>
    <div id="divInfo2" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo2" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo2','divInfo2');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>    
    </div>
    <div id="divInfoCorpo" class="divDetalhes"></div>    
    <div id="divInfoCorpo2" class="divDetalhes"></div> 
    <div id="divParcial" class="divDetalhes2"></div>  
    <div id="divPrincipalPedidoCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalPedidoLink" href="#" style="text-decoration:none;cursor:default;color:#FFFFFF;" onclick="carregaTelas('divPrincipalPedido','divDadosPedido','divItensPedido');">Pedido</a></center></div>
    <div id="divDadosPedidoCabec" style="margin-left:3px;float:left;background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divDadosPedidoLink" href="#" style="text-decoration:none;cursor:pointer;color:#374BAE;" onclick="carregaTelas('divDadosPedido','divPrincipalPedido','divItensPedido');">Dados básicos</a></center></div>
    <div id="divItensPedidoCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divItensPedidoLink" href="#" style="text-decoration:none;cursor:pointer;color:#374BAE;" onclick="carregaTelas('divItensPedido','divDadosPedido','divPrincipalPedido');">Itens</a></center></div>
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
    <div id="divPrincipalPedido" style="display:block;overflow:hidden;">
    <div style="float:left;width:175px">&nbsp;</div>
    <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
    <img id="imgFollowupLista" src="../../imagens/followup2_16.gif" alt="Visualizar Follow-Up" style="vertical-align:top;cursor:pointer;border:0px" onclick="VisualizaFollowup('<%=Request.QueryString("nr_processo") %>');"/>
    <asp:ImageButton ID="ibNovaPedidoLista" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarPedido" style="cursor:pointer;" ToolTip="Criar Pedido" Enabled="false" />    
    <asp:ImageButton ID="ibCancelarPedidoLista" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarPedido" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
    <asp:ImageButton ID="ibSalvarPedidoLista" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="SalvarPedido" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarPedido();"/>    
    <asp:ImageButton ID="ibExcluirPedidoLista" runat="server" ImageUrl="../../imagens/excluir2_16.gif" OnClick="ExcluirPedido" OnClientClick="return ExcluirPedido();" style="cursor:pointer;" ToolTip="Excluir"/>
    </div>
    <br />
    <asp:Label ID="lblUnidade" runat="server" Text="Unidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdUnidade" runat="server" CssClass="textbox" Width="50px" style="background-color:#DEE6EF" onkeydown="return false" Text='<%# Trim(Container.DataItem("CD_UNID_NEG"))%>' onBlur ="javascript:preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', this, 'frmEditaPedido_txtNmUnidade');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmUnidade" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgUnidade" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle"/><br /><br />    
    <asp:Label ID="lblCliente" runat="server" Text="Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" style="background-color:#DEE6EF" onkeydown="return false" Text='<%# Trim(Container.DataItem("CD_CLIENTE")) %>' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmCliente');verificaConsistencia(this,'CLIENTE',this.value);" MaxLength="5"/> 
    <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle"/><br /><br />
    <asp:Label ID="lblServico" runat="server" Text="Serviço" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <input id="txtCdModalidade" type="hidden" />
    <asp:TextBox ID="txtCdServico" runat="server" CssClass="textbox" Width="50px" style="background-color:#DEE6EF" onkeydown="return false" Text='<%# Trim(Container.DataItem("CD_SERVICO")) %>' onBlur ="javascript:preencheNome('TSERVICO', 'CD_SERVICO', 'NM_SERVICO', this, 'frmEditaPedido_txtNmServico');verificaConsistencia(this,'SERVICO',this.value);" MaxLength="3"/> 
    <asp:TextBox ID="txtNmServico" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgServico" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle"/><br /><br />
    <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrPedido" MaxLength="18" runat="server" CssClass="textbox" Width="150px" Text='<%# Trim(Container.DataItem("NR_PEDIDO")) %>' BackColor="#DEE6EF" ReadOnly="true" /> 
    <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Label ID="lblProcesso" runat="server" Text="Processo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrProcesso" MaxLength="10" runat="server" CssClass="textbox" Width="150px" Text='<%# Trim(Container.DataItem("NR_PROCESSO2")) %>' BackColor="#DEE6EF" ReadOnly="true"/> 
    <img id="imgProcesso" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/><br /><br />
    <asp:Label ID="lblArea" runat="server" Text="Área" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdArea"  runat="server" CssClass="textbox" Width="50px" Text='<%# Trim(Container.DataItem("CD_AREA")) %>' onBlur ="javascript:preencheNome('TAREA', 'CD_AREA', 'NM_AREA', this, 'frmEditaPedido_txtNmArea');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmArea" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgArea" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Áreas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AREA&nome=NM_AREA&tabela=TAREA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdArea&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
    <asp:Label ID="lblImportador" runat="server" Text="Importador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdImportador" runat="server" CssClass="textbox" Width="50px" Text='<%# Trim(Container.DataItem("CD_IMPORTADOR")) %>' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmImportador');" MaxLength="5"/> 
    <asp:TextBox ID="txtNmImportador"  runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgImportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Importadores','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdImportador&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-159);"/><br /><br />
    <asp:Label ID="lblExportador" runat="server" Text="Exportador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdExportador" runat="server" CssClass="textbox" Width="50px" Text='<%# Trim(Container.DataItem("CD_EXPORTADOR")) %>' onBlur ="javascript:preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmEditaPedido_txtNmExportador');" MaxLength="5"/> 
    <asp:TextBox ID="txtNmExportador"  runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgExportador" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Exportadores','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_EST_EXPORTADOR&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdExportador&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-197);"/><br /><br />    
    </div>
    <div id="divDadosPedido" style="display:none;">
    <div style="float:left;width:166px">&nbsp;</div>
    <div style="height:30px;width:475px;overflow:hidden;top:0px;text-align:right;">
    <img id="imgFollowup" src="../../imagens/followup2_16.gif" alt="Visualizar Follow-Up" style="vertical-align:top;cursor:pointer;border:0px" onclick="VisualizaFollowup('<%=Request.QueryString("nr_processo") %>');"/>
    <asp:ImageButton ID="ibNovaPedido" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarPedido" style="cursor:pointer;" ToolTip="Criar Pedido" Enabled ="false"/>    
    <asp:ImageButton ID="ibCancelarPedido" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarPedido" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
    <asp:ImageButton ID="ibSalvarPedido" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="SalvarPedido" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarPedido();"/>    
    <asp:ImageButton ID="ibExcluirPedido" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirPedido" OnClientClick="return ExcluirPedido();" style="cursor:pointer;" Enabled ="false" ToolTip="Excluir"/>
    </div>
    <br />
    <asp:Label ID="lblContato" runat="server" Text="Contato" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdContato" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_ANALISTA_CLIENTE")%>' onBlur ="javascript:preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', this, 'frmEditaPedido_txtNmContato');" MaxLength="4"/>        
    <asp:TextBox ID="txtNmContato" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <% If InStr("040;060;080", Session("cd_cargo")) = 0 Then%>
    <img id="imgContato" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Contatos','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_USUARIO&nome=NM_USUARIO&tabela=TUSUARIO_CONTATO&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdContato&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br />
    <asp:Label ID="lblAnalista" runat="server" Text="Analista Indaiá" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdAnalista" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_ANALISTA_COMISSARIA")%>' onBlur ="javascript:preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', this, 'frmEditaPedido_txtNmAnalista');" MaxLength="4"/>        
    <asp:TextBox ID="txtNmAnalista" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgAnalista" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Usuários','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_USUARIO&nome=NM_USUARIO&tabela=TUSUARIO_INDAIA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdAnalista&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-7);"/><br /><br />
    <%Else%>
    <img id="imgContato2" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" /><br /><br />
    <%End If%>
    <asp:Label ID="lblNrOrdem"  runat="server" Text="Ordem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrOrdem" runat="server" CssClass="textbox" Width="161px" Text='<%# Container.DataItem("NR_ORDEM") %>' MaxLength="10"/>&nbsp;&nbsp;
    <asp:Label ID="lblRefExportador" runat="server" Text="Ref. Exportador" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtRefExportador" runat="server" CssClass="textbox" Width="158px" Text='<%# Container.DataItem("NR_REF_EXPORTADOR")%>' MaxLength="10"/> <br /><br />
    <asp:Label ID="lblInconterm" runat="server" Text="Inconterm" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlInconterm" runat="server" class="textbox" Width="88px"  style="text-transform:uppercase;" DataSouceID="SqlInconterm" DataTextField="CODIGO" DataValueField="CODIGO" DataSourceID="SqlInconterm"  SelectedValue='<%# Bind("CD_INCOTERM") %>'/>
    <asp:SqlDataSource ID="SqlInconterm" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" SelectCommand="SELECT NULL AS CODIGO, NULL AS DESCRICAO UNION SELECT CODIGO, DESCRICAO FROM TINCOTERMS_VENDA (NOLOCK)" />&nbsp;&nbsp;
    <asp:Label ID="lblTpPedido" runat="server" Text="Tipo de Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlTpPedido" runat="server" class="textbox" Width="230px"  style="text-transform:uppercase;" DataSouceID="SqlTpPedido" DataTextField="NM_PEDIDO" DataValueField="CD_PEDIDO" DataSourceID="SqlTpPedido" SelectedValue='<%# Bind("CD_TP_PEDIDO") %>'/>
    <asp:SqlDataSource ID="SqlTpPedido" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" SelectCommand="SELECT NULL AS CD_PEDIDO, NULL AS NM_PEDIDO UNION SELECT LEFT(CD_PEDIDO+'   ',3) AS CD_PEDIDO, NM_PEDIDO FROM TTP_PEDIDO (NOLOCK) ORDER BY CD_PEDIDO" /><br /><br /> 
    <asp:Label ID="lblCondDias" runat="server" Text="Condições" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlCondDias" runat="server" class="textbox" Width="60px"  style="text-transform:uppercase;" SelectedValue='<%# Bind("DIAS_CONDICAO_PAGTO") %>' AppendDataBoundItems="True">
    <asp:ListItem Value="" Text=""/>
    <asp:ListItem Value="10 ">10</asp:ListItem>
    <asp:ListItem Value="15 ">15</asp:ListItem>
    <asp:ListItem Value="30 ">30</asp:ListItem>
    <asp:ListItem Value="45 ">45</asp:ListItem>
    <asp:ListItem Value="60 ">60</asp:ListItem>
    <asp:ListItem Value="75 ">75</asp:ListItem>
    <asp:ListItem Value="90 ">90</asp:ListItem>
    <asp:ListItem Value="120">120</asp:ListItem>
    <asp:ListItem Value="150">150</asp:ListItem>
    <asp:ListItem Value="180">180</asp:ListItem>
    <asp:ListItem Value="240">240</asp:ListItem>
    </asp:DropDownList>&nbsp;
    <asp:Label ID="lblCondDiasTp" runat="server" Text="dias do(a)" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="80px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlCondTp" runat="server" class="textbox" Width="296px"  style="text-transform:uppercase;"  SelectedValue='<%# Bind("CONDICAO_PAGTO") %>' AppendDataBoundItems="True">
    <asp:ListItem Value="" Text=""></asp:ListItem>
    <asp:ListItem Value="E">INVOICE Especial</asp:ListItem>
    <asp:ListItem Value="R">Registro da DI</asp:ListItem>
    <asp:ListItem Value="C">Conhecimento Embarque</asp:ListItem>
    <asp:ListItem Value="I">INVOICE</asp:ListItem>
    <asp:ListItem Value="P">PROFORMA</asp:ListItem>
    <asp:ListItem Value="A">ANTECIPADO</asp:ListItem>
    <asp:ListItem Value="V">A Vista</asp:ListItem>
    <asp:ListItem Value="S">Sem Cobertura Cambial</asp:ListItem>
    </asp:DropDownList><br /><br />
    <asp:CheckBox ID="cbDadosIguais" runat="server" Text="Dados Iguais nos Itens do Pedido?" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="496px" CssClass="lbl" Checked='<%# Container.DataItem("IN_DADOS_IGUAIS_ITENS") %>' />
    <asp:CheckBox ID="cbUrgente" runat="server" Text="Urgente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="76px" CssClass="lbl" Checked='<%# Container.DataItem("IN_URGENTE") %>'/><br /><br />
    <asp:Label ID="lblPaisOrigem" runat="server" Text="Origem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdPaisOrigem" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_PAIS_ORIGEM") %>' onBlur ="javascript:preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', this, 'frmEditaPedido_txtNmPaisOrigem');" MaxLength="3" />        
    <asp:TextBox ID="txtNmPaisOrigem" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgPaisOrigem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Países','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_PAIS&nome=NM_PAIS&tabela=TPAIS_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdPaisOrigem&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-80);"/><br /><br />
    <asp:Label ID="lblLocalDesembarque" runat="server" Text="Desembarque" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdLocalDesembarque" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_LOCAL_DESEMBARQUE")%>' onBlur ="javascript:preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', this, 'frmEditaPedido_txtNmLocalDesembarque');" MaxLength="4"/> 
    <asp:TextBox ID="txtNmLocalDesembarque" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgLocalDesembarque" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Locais de Embarque','divInfoCorpo','divInfo','divInfoRodape','codigo=CODIGO&nome=DESCRICAO&tabela=TLOCAL_EMBARQUE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdLocalDesembarque&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-80);"/><br /><br />
    <asp:Label ID="lblNavio" runat="server" Text="Navio" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdNavio" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_EMBARCACAO") %>' onBlur ="javascript:preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', this, 'frmEditaPedido_txtNmNavio');" MaxLength="4"/> 
    <asp:TextBox ID="txtNmNavio" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgNavio" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Navios','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMBARCACAO&nome=NM_EMBARCACAO&tabela=TEMBARCACAO&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdNavio&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-80);"/><br /><br />
    <asp:Label ID="lblAgenteCarga" runat="server" Text="Agente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdAgenteCarga" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_AGENTE") %>' onBlur ="javascript:preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', this, 'frmEditaPedido_txtNmAgenteCarga');" MaxLength="4"/> 
    <asp:TextBox ID="txtNmAgenteCarga" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgAgenteCarga" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Agentes de Carga','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AGENTE&nome=NM_AGENTE&tabela=TAGENTE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_txtCdAgenteCarga&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-80);"/><br /><br />
    <asp:Label ID="lblViagem" runat="server" Text="Viagem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrViagem" runat="server" CssClass="textbox" Width="150px" Text='<%# Container.DataItem("NR_VIAGEM") %>' onBlur="verificaViagem(this.value,document.getElementById('frmEditaPedido_txtCdUnidade').value,document.getElementById('frmEditaPedido_txtCdNavio').value, document.getElementById('frmEditaPedido_txtCdLocalDesembarque').value);"/> 
    <img id="imgViagem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Controle de Viagens','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_txtCdUnidade').value+'&navio='+document.getElementById('frmEditaPedido_txtCdNavio').value+'&cd_cargo=<%=Session("cd_cargo")%>&usuario=<%=Session("usuario")%>','combo_viagem', 500, 200,-80);"/>&nbsp;&nbsp;
    <asp:Label ID="lblNrVoo" runat="server" Text="Vôo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrVoo" runat="server" CssClass="textbox" Width="198px" Text='<%# Container.DataItem("NR_VOO") %>' MaxLength="10" /><br /><br />
    <asp:Label ID="lblCourrier" runat="server" Text="Courrier" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrCourrier" runat="server" CssClass="textbox" Width="170px" Text='<%# Container.DataItem("NR_COURRIER") %>' MaxLength="10" />&nbsp;&nbsp;
    <asp:Label ID="lblNrBl" runat="server" Text="BL" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrBl" runat="server" CssClass="textbox" Width="199px" Text='<%# Container.DataItem("NR_CONHECIMENTO") %>' MaxLength="10"/>  
    </div> 
    <div id="divItensPedido" style="display:none;">
        <asp:FormView ID="frmEditaPedidoItem" runat="server" DataSourceID="SqlEditPedidoItem" BorderWidth="0px" DataKeyNames="NR_PROCESSO, NR_ITEM_CLIENTE" DefaultMode="Edit">
        <EmptyDataTemplate>
        <div id="divListaPedidoItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divListaPedidoItemLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Lista de itens</a></center></div>
        <div id="divDadosPedidoItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divDadosPedidoItemLink" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;">
        <div id="divListaPedidoItem" style="display:block;text-align:center;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibFollowupLista" runat="server" ImageUrl="../../imagens/followup2_16d.gif"  style="cursor:pointer;" ToolTip="Visualizar Follow-Up" Enabled="false"/>    
        <asp:ImageButton ID="ibNovaPedidoItemLista" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarPedidoItem" style="cursor:pointer;" ToolTip="Criar Item"/>    
        <asp:ImageButton ID="ibCancelarPedidoItemLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarPedidoItem" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_item" Then%>
        <asp:ImageButton ID="ibSalvarPedidoItemLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirPedidoItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarPedidoItemLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarPedidoItem" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirPedidoItemLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirPedidoItem" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:30px;">Item</td>
            <td style="width:125px">Part Number</td>
            <td style="width:165px">Mercadoria</td>
            <td style="width:120px">NCM/SH</td>
            <td style="width:120px">Qtde. Disponível</td>
            <td style="width:40px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divItemPedidoGrid" style="height:262px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdItemPedido" runat="server" DataSourceID="SqlItemPedido"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum Item foi encontrado para este pedido" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Item (Cliente) " SortExpression="NR_ITEM_CLIENTE" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnr_item_cliente" runat="server" EnableTheming="True" Text='<%# Bind("NR_ITEM_CLIENTE") %>' Font-Names="verdana" NavigateUrl='<%# "pedido_edita.aspx?acao=editar_item&nr_processo=" & Trim(Container.DataItem("NR_PROCESSO2"))& "&item_cliente=" & Trim(Container.DataItem("NR_ITEM_CLIENTE")) %>' class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CD_MERCADORIA" HeaderText=" Part Number " SortExpression="CD_MERCADORIA" ItemStyle-Width="125px"/>
                <asp:BoundField DataField="AP_MERCADORIA" HeaderText=" Mercadoria " SortExpression="AP_MERCADORIA" ItemStyle-Width="205px"/>
                <asp:BoundField DataField="CD_NCM_SH" HeaderText=" NCM/SH " SortExpression="CD_NCM_SH" ItemStyle-Width="80px"/>
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Disponível " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText="" SortExpression="NR_ITEM_CLIENTE" ItemStyle-Width="40px">
                <ItemTemplate><a id="hr_parcial" href="javascript:ExibeParciais('Parciais','divInfoCorpo','divInfo','divInfoRodape','cd_usuario<%=Session("usuario")%>&nr_processo=<%# Eval("NR_PROCESSO")%>&nr_item_cliente=<%# Eval("NR_ITEM_CLIENTE")%>&cd_empresa=<%# Eval("CD_EMPRESA")%>&qtde=<%# Eval("QT_INICIAL") %>','pedido_parcial', 700, 300,-100);" class="nounderline">Parciais</a>  
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlItemPedido" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT TPO.NR_PROCESSO, P.NR_PROCESSO AS NR_PROCESSO2, TPO.NR_ITEM_CLIENTE, TPO.CD_MERCADORIA, SUBSTRING(M.AP_MERCADORIA,0,30) AS AP_MERCADORIA, TPO.CD_NCM_SH, TPO.QT_INICIAL AS QT_INICIAL, TPO.CD_EMPRESA
            FROM TPO_ITEM TPO ( NOLOCK )
              INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = TPO.NR_PROCESSO AND P.CD_CLIENTE = TPO.CD_EMPRESA
              LEFT JOIN TMERCADORIA M (NOLOCK) ON M.CD_MERCADORIA = TPO.CD_MERCADORIA
            WHERE P.NR_PROCESSO = @NR_PROCESSO
              AND TPO.NR_PARCIAL = 0
            ORDER BY NR_ITEM_CLIENTE" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
            </SelectParameters>
        </asp:SqlDataSource>   
        </div>
        </div> 
        <div id="divDadosPedidoItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">&nbsp;
        <asp:Label ID="lblItemCliente" runat="server" Text="Item Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>&nbsp;
        <img src="\imagens\icones\16x16\first1.gif" width="16px" height="16px" alt="Primeiro Item" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('1');"/>
        <img src="\imagens\icones\16x16\prev1.gif" width="16px" height="16px"  alt="Item Anterior" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('2');"/> 
        <img src="\imagens\icones\16x16\next1.gif" width="16px" height="16px"  alt="Próximo Item"  style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('3');"/> 
        <img src="\imagens\icones\16x16\last1.gif" width="16px" height="16px"  alt="Primeiro Item" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('4');"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 
        <img id="imgFollowupPedido" src="../../imagens/followup2_16.gif" alt="Visualizar Follow-Up" style="vertical-align:top;cursor:pointer;border:0px" onclick="VisualizaFollowup('<%=Request.QueryString("nr_processo") %>','<%=Request.QueryString("item_cliente") %>','0');"/>
        <asp:ImageButton ID="ibNovaPedidoItem" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarPedidoItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled ="false"/>    
        <asp:ImageButton ID="ibCancelarPedidoItem" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarPedidoItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarPedidoItem" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="InserirPedidoItem" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarPedidoItem();"/>    
        <asp:ImageButton ID="ibExcluirPedidoItem" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirPedidoItem" OnClientClick="return ExcluirPedido();" style="cursor:pointer;" Enabled ="false" ToolTip="Excluir"/>
        </div>
        <br />
        <asp:Label ID="lblNrItemCliente" runat="server" Text="Item (Cliente)" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrItemCliente" runat="server" CssClass="textbox" Width="50px" MaxLength="4" onBlur="javascript:preencheItem(this);"/>&nbsp;        
        <asp:Label ID="lblAreaItem" runat="server" Text="Área" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="80px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdAreaItem" runat="server" CssClass="textbox" Width="50px" Text='<%# Session("cd_area") %>' onBlur ="javascript:preencheNome('TAREA', 'CD_AREA', 'NM_AREA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmAreaItem');" MaxLength="2"/>        
        <asp:TextBox ID="txtNmAreaItem" runat="server" CssClass="textbox" Width="230px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgAreaItem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Áreas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AREA&nome=NM_AREA&tabela=TAREA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdAreaItem&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br />
        <asp:Label ID="lblMercadoria" runat="server" Text="Mercadoria" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMercadoria" runat="server" CssClass="textbox" Width="100px"  onBlur ="javascript:preencheValoresMercadoria();" MaxLength="30"/>        
        <asp:TextBox ID="txtNmMercadoria" runat="server" CssClass="textbox" Width="327px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgMercadoria" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Mercadorias','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_MERCADORIA&nome=AP_MERCADORIA&tabela=TMERCADORIA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria&cd_cargo=<%=Session("cd_cargo")%>&cd_importador='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtImportador').value+'&cd_grupo='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtGrupo').value+'','pedido_consulta', 500, 200,31);"/><br /><br />
        <asp:Label ID="lblNCM" runat="server" Text="NCM/SH" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNCM" runat="server" CssClass="textbox" Width="100px" />&nbsp;&nbsp;
        <asp:Label ID="lblOrdem" runat="server" Text="Ordem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="65px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrOrdemItem" runat="server" CssClass="textbox" Width="100px" />&nbsp;&nbsp; 
        <asp:CheckBox ID="cbLi" runat="server" Text="LI" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="50px" CssClass="lbl" />
        <asp:CheckBox ID="cbDrawBack" runat="server" Text="Drawback" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="100px" CssClass="lbl" /><br /><br />
        <asp:Label ID="lblQtde" runat="server" Text="Quantidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtQtde" runat="server" CssClass="textbox" Width="100px" Text="0" onFocus="this.select();" onBlur="javascript:calculaValor();" onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/>        
        <asp:Label ID="lblUnMedida" runat="server" Text="Unidade de Medida" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdUnMedida" runat="server" CssClass="textbox" Width="50px" onBlur ="javascript:preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');" MaxLength="3"/>        
        <asp:TextBox ID="txtNmUnMedida" runat="server" CssClass="textbox" Width="140px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgUnMedida" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Unidades de Medida','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_MEDIDA&nome=NM_UNID_MEDIDA&tabela=TUNID_MEDIDA_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br />
        <asp:Label ID="lblMoeda" runat="server" Text="Moeda" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMoeda" runat="server" CssClass="textbox" Width="50px" onBlur ="javascript:preencheNome('TMOEDA_BROKER', 'CD_MOEDA', 'NM_MOEDA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmMoeda');" MaxLength="3"/>        
        <asp:TextBox ID="txtNmMoeda" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgMoeda" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Moedas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_MOEDA&nome=NM_MOEDA&tabela=TMOEDA_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdMoeda&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br />
        <asp:Label ID="lblVlUnit" runat="server" Text="Valor Unitário" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtVlUnit" runat="server" CssClass="textbox" Width="160px" Text="0" onFocus="this.select();"  onBlur="javascript:calculaValor();" onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/>&nbsp;&nbsp;        
        <asp:Label ID="lblVlItem" runat="server" Text="Valor Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtVlItem" runat="server" CssClass="textbox" Width="160px" Text="0" onkeypress="return false" onFocus="this.select();"/><br /><br />  
        <asp:Label ID="lblTpCalculo" runat="server" Text="Tipo Cálculo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlTpCalculo" runat="server" class="textbox" Width="158px"  style="text-transform:uppercase;" DataSouceID="SqlTpCalculo" DataTextField="DESCRICAO" DataValueField="CODIGO" DataSourceID="SqlTpCalculo" onChange="javascript:calculaValor();"/>
        <asp:SqlDataSource ID="SqlTpCalculo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" SelectCommand="SELECT NULL AS CODIGO, NULL AS DESCRICAO UNION SELECT CD_TIPO_CALCULO_ITEM AS CODIGO, DESCRICAO FROM TTP_CALCULO_ITEM (NOLOCK) ORDER BY DESCRICAO" />&nbsp;&nbsp;               
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtInvoice" runat="server" CssClass="textbox" Width="155px"  /><br /><br />       
        <asp:Label ID="lblTpDrawback" runat="server" Text="Drawback" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp; 
        <asp:RadioButtonList ID="rbTpDrawback" runat="server" AppendDataBoundItems="True" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="450px"  Font-Names="Verdana" Font-Size="9pt" Font-Bold="false">
        <asp:ListItem Value="0" style="width:150px" Selected>Nenhum</asp:ListItem>
        <asp:ListItem Value="1" style="width:150px">Isenção</asp:ListItem>
        <asp:ListItem Value="2" style="width:150px">Suspenção</asp:ListItem>
        </asp:RadioButtonList><br /><br />
        <asp:Label ID="lblCdMercFornec" runat="server" Text="Nome do cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="220px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMercFornec" runat="server" CssClass="textbox" Width="343px" /><br /><br />       
        <asp:Label ID="lblFabricante" runat="server" Text="Fabricante" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdFabricante" runat="server" CssClass="textbox" Width="50px"  onBlur ="javascript:preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');" MaxLength="5"/>        
        <asp:TextBox ID="txtNmFabricante" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgFabricante" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Fabricantes','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=AP_EMPRESA&tabela=TEMPRESA_EST&usuario=<%=Session("usuario")%>&campo=frmEditaPedidoItem_txtCdFabricante&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,31);"/><br /><br /> 
        <asp:Label ID="lblPaisOrigem" runat="server" Text="Origem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp; 
        <asp:TextBox ID="txtCdPaisOrigem" runat="server" CssClass="textbox" Width="50px"  onBlur ="javascript:preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');" MaxLength="3" />        
        <asp:TextBox ID="txtNmPaisOrigem" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgPaisOrigem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Países','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_PAIS&nome=NM_PAIS&tabela=TPAIS_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 300,7);"/><br /><br />
        <asp:Label ID="lblLocalDesembarque" runat="server" Text="Desembarque" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdLocalDesembarque" runat="server" CssClass="textbox" Width="50px" onBlur ="javascript:preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmLocalDesembarque');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmLocalDesembarque" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgLocalDesembarque" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Locais de Embarque','divInfoCorpo','divInfo','divInfoRodape','codigo=CODIGO&nome=DESCRICAO&tabela=TLOCAL_EMBARQUE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 300,-31);"/><br /><br />
        <asp:Label ID="lblNavio" runat="server" Text="Navio" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdNavio" runat="server" CssClass="textbox" Width="50px" onBlur ="javascript:preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmNavio');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmNavio" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgNavio" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Navios','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMBARCACAO&nome=NM_EMBARCACAO&tabela=TEMBARCACAO&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdNavio&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 300,-69);"/><br /><br />
        <asp:Label ID="lblAgenteCarga" runat="server" Text="Agente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdAgenteCarga" runat="server" CssClass="textbox" Width="50px" onBlur ="javascript:preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmAgenteCarga');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmAgenteCarga" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgAgenteCarga" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Agentes de Carga','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AGENTE&nome=NM_AGENTE&tabela=TAGENTE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdAgenteCarga&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 300,-69);"/><br /><br />
        <asp:Label ID="lblViagem" runat="server" Text="Viagem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrViagem" runat="server" CssClass="textbox" Width="150px" onBlur="verificaViagem(this.value,document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnidade').value,document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value, document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque').value);"/> 
        <img id="imgViagem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Controle de Viagens','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnidade').value+'&navio='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value+'&usuario=<%=Session("usuario")%>&cd_cargo=<%=Session("cd_cargo")%>','combo_viagem', 500, 200,-121);"/>&nbsp;&nbsp;
        <asp:Label ID="lblNrVoo" runat="server" Text="Vôo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrVoo" runat="server" CssClass="textbox" Width="198px" MaxLength="10" /><br /><br />
        <asp:Label ID="lblCourrier" runat="server" Text="Courrier" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrCourrier" runat="server" CssClass="textbox" Width="170px" MaxLength="10" />&nbsp;&nbsp;
        <asp:Label ID="lblNrBl" runat="server" Text="BL" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrBl" runat="server" CssClass="textbox" Width="199px" MaxLength="10"/><br /><br />  
        <asp:CheckBox ID="cbUrgente" runat="server" Text="Urgente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl"  />
        <asp:CheckBox ID="cbConsolidado" runat="server" Text="Consolidado" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl"/>
        <asp:CheckBox ID="cbSeguro" runat="server" Text="Seguro/Hermes" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl" />
        <img src="../../imagens/seta_id2.gif"/><asp:HyperLink ID="hlcopia_pedido" runat="server" EnableTheming="True" Text='Copiar do Pedido' Font-Size="9pt" Font-Names="verdana" NavigateUrl="javascript:copiarPedido();" class="nounderline"></asp:HyperLink>
        <asp:TextBox ID="txtPlItem" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  MaxLength="10"/>
        <asp:TextBox ID="txtNrItem" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  MaxLength="10"/>
        <asp:TextBox ID="txtNrProcesso" type="hidden" runat="server" Text='<%# Request("nr_processo") %>' CssClass="textbox" Width="0px" Height="0px"/>        
        <asp:TextBox ID="txtCdNaladiSh" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" />        
        <asp:TextBox ID="txtCdNaladiNcca" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" />        
        <asp:TextBox ID="txtTxMercadoria" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  />   
        <asp:TextBox ID="txtImportador" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  />      
        <asp:TextBox ID="txtGrupo" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  />           
        <br /><br />
        </div>       
        </div>
        </EmptyDataTemplate>
        <EditItemTemplate>
        <div id="divListaPedidoItemCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divListaPedidoItemLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" >Lista de itens</a></center></div>
        <div id="divDadosPedidoItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#374BAE;font-family:Verdana;font-size:9pt;"><center><a id="divDadosPedidoItemLink" href="#" style="text-decoration:none;cursor:default;color:#374BAE;" >Dados básicos</a></center></div>
        <div style="border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:650px;text-align:center;">
        <div id="divListaPedidoItem" style="display:block;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
        <asp:ImageButton ID="ibFollowupLista" runat="server" ImageUrl="../../imagens/followup2_16d.gif"  style="cursor:pointer;" ToolTip="Visualizar Follow-Up" Enabled="false"/>
        <asp:ImageButton ID="ibNovaPedidoItemLista" runat="server" ImageUrl="../../imagens/novo2_16.gif" OnClick="CriarPedidoItem" style="cursor:pointer;" ToolTip="Criar Item" />    
        <asp:ImageButton ID="ibCancelarPedidoItemLista" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarPedido" style="cursor:pointer;" Enabled="false" ToolTip="Cancelar/Voltar"/>    
        <%If Request("acao") = "criar_item" Then%>
        <asp:ImageButton ID="ibSalvarPedidoItemLista1" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="InserirPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%Else%>
        <asp:ImageButton ID="ibSalvarPedidoItemLista2" runat="server" ImageUrl="../../imagens/salvar2_16d.gif" OnClick="SalvarPedido" style="cursor:pointer;" Enabled="false" ToolTip="Salvar"/>    
        <%End If%>
        <asp:ImageButton ID="ibExcluirPedidoItemLista" runat="server" ImageUrl="../../imagens/excluir2_16d.gif" OnClick="ExcluirPedido" style="cursor:pointer;" Enabled="false" ToolTip="Excluir"/>
        </div><br />  
        <div style="height: 25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
            <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
            <td style="width:30px;">Item</td>
            <td style="width:125px">Part Number</td>
            <td style="width:205px">Mercadoria</td>
            <td style="width:120px">NCM/SH</td>
            <td style="width:120px">Qtde. Disponível</td>
            <td style="width:120px">&nbsp;</td>
            </tr></table>
        </div>
        <div id="divItemPedidoGrid" style="height:262px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdItemPedido" runat="server" DataSourceID="SqlItemPedido"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="20px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum item foi encontrado para este pedido" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="20px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText=" Item (Cliente) " SortExpression="NR_ITEM_CLIENTE" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnr_item_cliente" runat="server" EnableTheming="True" Text='<%# Bind("NR_ITEM_CLIENTE") %>' Font-Names="verdana" NavigateUrl='<%# "pedido_edita.aspx?acao=editar_item&nr_processo=" & Trim(Container.DataItem("NR_PROCESSO2"))& "&item_cliente=" & Trim(Container.DataItem("NR_ITEM_CLIENTE")) %>' class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CD_MERCADORIA" HeaderText=" Part Number " SortExpression="CD_MERCADORIA" ItemStyle-Width="125px"/>
                <asp:BoundField DataField="AP_MERCADORIA" HeaderText=" Mercadoria " SortExpression="AP_MERCADORIA" ItemStyle-Width="205px"/>
                <asp:BoundField DataField="CD_NCM_SH" HeaderText=" NCM/SH " SortExpression="CD_NCM_SH" ItemStyle-Width="120px"/>
                <asp:BoundField DataField="QT_INICIAL" HeaderText=" Qtde. Disponível " SortExpression="QT_INICIAL" ItemStyle-Width="120px"/>
                <asp:TemplateField HeaderText=" Item (Cliente) " SortExpression="NR_ITEM_CLIENTE" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_parcial" runat="server" EnableTheming="True" Text='Parciais' Font-Names="verdana" NavigateUrl="" class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlItemPedido" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT TPO.NR_PROCESSO, P.NR_PROCESSO AS NR_PROCESSO2, TPO.NR_ITEM_CLIENTE, TPO.CD_MERCADORIA, SUBSTRING(M.AP_MERCADORIA,0,30) AS AP_MERCADORIA, TPO.CD_NCM_SH, TPO.QT_INICIAL
            FROM TPO_ITEM TPO ( NOLOCK )
              INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = TPO.NR_PROCESSO AND P.CD_CLIENTE = TPO.CD_EMPRESA
              LEFT JOIN TMERCADORIA M (NOLOCK) ON M.CD_MERCADORIA = TPO.CD_MERCADORIA
            WHERE P.NR_PROCESSO = @NR_PROCESSO
              AND TPO.NR_PARCIAL = 0
            ORDER BY NR_ITEM_CLIENTE" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
            </SelectParameters>
        </asp:SqlDataSource>  
        </div>
        </div> 
        <div id="divDadosPedidoItem" style="display:none;">
        <div style="float:left;width:120px">&nbsp;</div>
        <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">&nbsp;
        <asp:Label ID="lblItemCliente" runat="server" Text="Item Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>
        <img src="\imagens\icones\16x16\first1.gif" width="16px" height="16px" alt="Primeiro Item" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('1');"/>
        <img src="\imagens\icones\16x16\prev1.gif" width="16px" height="16px"  alt="Item Anterior" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('2');"/> 
        <img src="\imagens\icones\16x16\next1.gif" width="16px" height="16px"  alt="Próximo Item"  style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('3');"/> 
        <img src="\imagens\icones\16x16\last1.gif" width="16px" height="16px"  alt="Primeiro Item" style="cursor:pointer;vertical-align:top;" onclick="carregaPedidoItem('4');"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  
        <img id="imgFollowupPedido" src="../../imagens/followup2_16.gif" alt="Visualizar Follow-Up" style="vertical-align:top;cursor:pointer;border:0px" onclick="VisualizaFollowup('<%=Request.QueryString("nr_processo") %>','<%=Request.QueryString("item_cliente") %>','0');"/>
        <asp:ImageButton ID="ibNovaPedidoItem" runat="server" ImageUrl="../../imagens/novo2_16d.gif" OnClick="CriarPedidoItem" style="cursor:pointer;" ToolTip="Criar Item" Enabled ="false"/>    
        <asp:ImageButton ID="ibCancelarPedidoItem" runat="server" ImageUrl="../../imagens/cancelar2_16.gif" OnClick="CancelarPedidoItem" style="cursor:pointer;" ToolTip="Cancelar/Voltar"/>    
        <asp:ImageButton ID="ibSalvarPedidoItem" runat="server" ImageUrl="../../imagens/salvar2_16.gif" OnClick="SalvarPedidoItem" style="cursor:pointer;" ToolTip="Salvar" OnClientClick="return SalvarPedidoItem();"/>    
        <asp:ImageButton ID="ibExcluirPedidoItem" runat="server" ImageUrl="../../imagens/excluir2_16.gif" OnClick="ExcluirPedidoItem" OnClientClick="return ExcluirPedido();" style="cursor:pointer;" ToolTip="Excluir"/>
        </div>
        <br />
        <asp:Label ID="lblNrItemCliente" runat="server" Text="Item (Cliente)" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrItemCliente" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("NR_ITEM_CLIENTE")%>' MaxLength="4"/>&nbsp;        
        <asp:Label ID="lblAreaItem" runat="server" Text="Área" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="80px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdAreaItem" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_AREA")%>' onBlur ="javascript:preencheNome('TAREA', 'CD_AREA', 'NM_AREA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmAreaItem');" MaxLength="2"/>        
        <asp:TextBox ID="txtNmAreaItem" runat="server" CssClass="textbox" Width="230px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgAreaItem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Áreas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AREA&nome=NM_AREA&tabela=TAREA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdAreaItem&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-7);"/><br /><br />
        <asp:Label ID="lblMercadoria" runat="server" Text="Mercadoria" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMercadoria" runat="server" CssClass="textbox" Width="100px" Text='<%# Container.DataItem("CD_MERCADORIA")%>' onBlur ="javascript:preencheValoresMercadoria();" MaxLength="30"/>        
        <asp:TextBox ID="txtNmMercadoria" runat="server" CssClass="textbox" Width="327px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgMercadoria" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Mercadorias','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_MERCADORIA&nome=AP_MERCADORIA&tabela=TMERCADORIA&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdMercadoria&cd_cargo=<%=Session("cd_cargo")%>&cd_importador='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtImportador').value+'&cd_grupo='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtGrupo').value+'','pedido_consulta', 500, 200,-45);"/><br /><br />
        <asp:Label ID="lblNCM" runat="server" Text="NCM/SH" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNCM" runat="server" CssClass="textbox" Width="100px" Text='<%# Container.DataItem("CD_NCM_SH")%>'/>&nbsp;&nbsp;  
        <asp:Label ID="lblOrdem" runat="server" Text="Ordem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="65px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrOrdemItem" runat="server" CssClass="textbox" Width="100px" Text='<%# Container.DataItem("NR_ORDEM")%>'/>&nbsp;&nbsp;         
        <asp:CheckBox ID="cbLi" runat="server" Text="LI" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="50px" CssClass="lbl" Checked='<%# Container.DataItem("IN_NECESSITA_LI") %>' />
        <asp:CheckBox ID="cbDrawBack" runat="server" Text="Drawback" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="100px" CssClass="lbl" Checked='<%# Container.DataItem("IN_DRAWBACK") %>'/><br /><br />
        <asp:Label ID="lblQtde" runat="server" Text="Quantidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtQtde" runat="server" CssClass="textbox" Width="100px" Text='<%# Container.DataItem("QT_INICIAL")%>' onFocus="this.select();" onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"  onBlur="javascript:calculaValor();"/>        
        <asp:Label ID="lblUnMedida" runat="server" Text="Unidade de Medida" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdUnMedida" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_UNID_MEDIDA")%>' onBlur ="javascript:preencheNome('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmUnMedida');" MaxLength="3"/>        
        <asp:TextBox ID="txtNmUnMedida" runat="server" CssClass="textbox" Width="140px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgUnMedida" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Unidades de Medida','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_MEDIDA&nome=NM_UNID_MEDIDA&tabela=TUNID_MEDIDA_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdUnMedida&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblMoeda" runat="server" Text="Moeda" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMoeda" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_MOEDA_NEGOCIADA")%>' onBlur ="javascript:preencheNome('TMOEDA_BROKER', 'CD_MOEDA', 'NM_MOEDA', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmMoeda');" MaxLength="3"/>        
        <asp:TextBox ID="txtNmMoeda" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgMoeda" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Moedas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_MOEDA&nome=NM_MOEDA&tabela=TMOEDA_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdMoeda&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblVlUnit" runat="server" Text="Valor Unitário" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtVlUnit" runat="server" CssClass="textbox" Width="160px" Text='<%# Container.DataItem("VL_UNITARIO")%>'  onFocus="this.select();" onBlur="javascript:calculaValor();"  onkeypress="if (event.keyCode == 44) {event.keyCode = 46;}"/>&nbsp;&nbsp;        
        <asp:Label ID="lblVlItem" runat="server" Text="Valor Item" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtVlItem" runat="server" CssClass="textbox" Width="160px" Text='<%# Container.DataItem("VL_TOTAL") %>' onFocus="this.select();" onkeypress="return false"/><br /><br />  
        <asp:Label ID="lblTpCalculo" runat="server" Text="Tipo Cálculo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:DropDownList ID="ddlTpCalculo" runat="server" class="textbox" Width="158px"  style="text-transform:uppercase;" DataSouceID="SqlTpCalculo" DataTextField="DESCRICAO" DataValueField="CODIGO" DataSourceID="SqlTpCalculo"  SelectedValue='<%# Bind("TP_CALCULO") %>' onChange="javascript:calculaValor();"/>
        <asp:SqlDataSource ID="SqlTpCalculo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" SelectCommand="SELECT NULL AS CODIGO, NULL AS DESCRICAO UNION SELECT CD_TIPO_CALCULO_ITEM AS CODIGO, DESCRICAO FROM TTP_CALCULO_ITEM (NOLOCK) ORDER BY DESCRICAO" />&nbsp;&nbsp;               
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtInvoice" runat="server" CssClass="textbox" Width="155px" Text='<%# Container.DataItem("NR_FATURA")%>' /><br /><br />       
        <asp:Label ID="lblTpDrawback" runat="server" Text="Drawback" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp; 
        <asp:RadioButtonList ID="rbTpDrawback" runat="server" SelectedValue='<%# Bind("TP_DRAWBACK") %>' AppendDataBoundItems="True" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="450px"  Font-Names="Verdana" Font-Size="9pt" Font-Bold="false">
        <asp:ListItem Value="0" style="width:150px">Nenhum</asp:ListItem>
        <asp:ListItem Value="1" style="width:150px">Isenção</asp:ListItem>
        <asp:ListItem Value="2" style="width:150px">Suspenção</asp:ListItem>
        </asp:RadioButtonList><br /><br />
        <asp:Label ID="lblCdMercFornec" runat="server" Text="Nome do cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="220px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdMercFornec" runat="server" CssClass="textbox" Width="343px" Text='<%# Container.DataItem("CD_MERC_FORNEC")%>' /><br /><br />       
        <asp:Label ID="lblFabricante" runat="server" Text="Fabricante" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdFabricante" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_FABRICANTE")%>' onBlur ="javascript:preencheNome('TEMPRESA_EST', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdFabricante'), 'frmEditaPedido_frmEditaPedidoItem_txtNmFabricante');" MaxLength="5"/>        
        <asp:TextBox ID="txtNmFabricante" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgFabricante" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Fabricantes','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=AP_EMPRESA&tabela=TEMPRESA_EST&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdFabricante&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br /> 
        <asp:Label ID="lblPaisOrigem" runat="server" Text="Origem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp; 
        <asp:TextBox ID="txtCdPaisOrigem" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_PAIS_ORIGEM") %>' onBlur ="javascript:preencheNome('TPAIS_BROKER', 'CD_PAIS', 'NM_PAIS', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmPaisOrigem');" MaxLength="3" />        
        <asp:TextBox ID="txtNmPaisOrigem" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgPaisOrigem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Países','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_PAIS&nome=NM_PAIS&tabela=TPAIS_BROKER&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdPaisOrigem&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblLocalDesembarque" runat="server" Text="Desembarque" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdLocalDesembarque" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_LOCAL_DESEMBARQUE")%>' onBlur ="javascript:preencheNome('TLOCAL_EMBARQUE', 'CD_LOCAL_EMB', 'NM_LOCAL_EMB', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmLocalDesembarque');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmLocalDesembarque" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgLocalDesembarque" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Locais de Embarque','divInfoCorpo','divInfo','divInfoRodape','codigo=CODIGO&nome=DESCRICAO&tabela=TLOCAL_EMBARQUE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblNavio" runat="server" Text="Navio" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdNavio" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_EMBARCACAO") %>' onBlur ="javascript:preencheNome('TEMBARCACAO', 'CD_EMBARCACAO', 'NM_EMBARCACAO', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmNavio');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmNavio" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgNavio" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Navios','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMBARCACAO&nome=NM_EMBARCACAO&tabela=TEMBARCACAO&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdNavio&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblAgenteCarga" runat="server" Text="Agente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtCdAgenteCarga" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_AGENTE") %>' onBlur ="javascript:preencheNome('TAGENTE', 'CD_AGENTE', 'NM_AGENTE', this, 'frmEditaPedido_frmEditaPedidoItem_txtNmAgenteCarga');" MaxLength="4"/> 
        <asp:TextBox ID="txtNmAgenteCarga" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
        <img id="imgAgenteCarga" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Agentes de Carga','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AGENTE&nome=NM_AGENTE&tabela=TAGENTE&usuario=<%=Session("usuario")%>&campo=frmEditaPedido_frmEditaPedidoItem_txtCdAgenteCarga&cd_cargo=<%=Session("cd_cargo")%>','pedido_consulta', 500, 200,-121);"/><br /><br />
        <asp:Label ID="lblViagem" runat="server" Text="Viagem" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrViagem" runat="server" CssClass="textbox" Width="150px" Text='<%# Container.DataItem("NR_VIAGEM") %>' onBlur="verificaViagem(this.value,document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnidade').value,document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value, document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdLocalDesembarque').value);"/> 
        <img id="imgViagem" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Controle de Viagens','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdUnidade').value+'&navio='+document.getElementById('frmEditaPedido_frmEditaPedidoItem_txtCdNavio').value+'&cd_cargo=<%=Session("cd_cargo")%>&usuario=<%=Session("usuario")%>','combo_viagem', 500, 200,-121);"/>&nbsp;&nbsp;
        <asp:Label ID="lblNrVoo" runat="server" Text="Vôo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrVoo" runat="server" CssClass="textbox" Width="198px" Text='<%# Container.DataItem("NR_VOO") %>' MaxLength="10" /><br /><br />
        <asp:Label ID="lblCourrier" runat="server" Text="Courrier" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrCourrier" runat="server" CssClass="textbox" Width="170px" Text='<%# Container.DataItem("NR_COURRIER") %>' MaxLength="10" />&nbsp;&nbsp;
        <asp:Label ID="lblNrBl" runat="server" Text="BL" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtNrBl" runat="server" CssClass="textbox" Width="199px" Text='<%# Container.DataItem("NR_CONHECIMENTO") %>' MaxLength="10"/><br /><br />  
        <asp:CheckBox ID="cbUrgente" runat="server" Text="Urgente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl" Checked='<%# Container.DataItem("IN_URGENTE") %>' />
        <asp:CheckBox ID="cbConsolidado" runat="server" Text="Consolidado" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl" Checked='<%# Container.DataItem("IN_CONSOLIDADO") %>'/>
        <asp:CheckBox ID="cbSeguro" runat="server" Text="Seguro/Hermes" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="150px" CssClass="lbl" Checked='<%# Container.DataItem("IN_SEGURO") %>'/>
        <img src="../../imagens/seta_id2.gif"/><asp:HyperLink ID="hlcopia_pedido" runat="server" EnableTheming="True" Text='Copiar do Pedido' Font-Size="9pt" Font-Names="verdana" NavigateUrl="javascript:copiarPedido();" class="nounderline"></asp:HyperLink>
        <asp:TextBox ID="txtPlItem" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("PL_ITEM") %>' MaxLength="10"/>
        <asp:TextBox ID="txtNrItem" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("NR_ITEM") %>' MaxLength="10"/>
        <asp:TextBox ID="txtNrProcesso" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("NR_PROCESSO2") %>'/>        
        <asp:TextBox ID="txtCdNaladiSh" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("CD_NALADI_SH") %>'/>        
        <asp:TextBox ID="txtCdNaladiNcca" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("CD_NALADI_NCCA") %>'/>        
        <asp:TextBox ID="txtTxMercadoria" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("TX_MERCADORIA") %>' />        
        <asp:TextBox ID="txtImportador" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px"  Text='<%# Container.DataItem("CD_IMPORTADOR") %>'/>      
        <asp:TextBox ID="txtGrupo" type="hidden" runat="server" CssClass="textbox" Width="0px" Height="0px" Text='<%# Container.DataItem("CD_GRUPO") %>' />      
        <br /><br />
        </div>       
        </div> 
        </div>
        </EditItemTemplate>
    </asp:FormView>
     </div>
    <asp:SqlDataSource ID="SqlPedido" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"/>
   </EditItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="SqlEditPedido" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO,5,15) AS NR_PROCESSO2, NR_REFERENCIA AS NR_PEDIDO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_SERVICO, CD_USUARIO,
  DT_ABERTURA, HR_ABERTURA, DT_PEDIDO, HR_PEDIDO, CD_IMPORTADOR, CD_EXPORTADOR, CD_AREA,
  CD_ANALISTA_COMISSARIA, RIGHT('0000'+LTRIM(RTRIM(CD_ANALISTA_CLIENTE)),4) CD_ANALISTA_CLIENTE, RTRIM(CD_INCOTERM) CD_INCOTERM, NR_ORDEM, NR_VOO, SUBSTRING(NR_VIAGEM,1,2) + '/' + SUBSTRING(NR_VIAGEM,3,4) NR_VIAGEM,
  CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR_CONHECIMENTO, CD_TP_PEDIDO, IN_CANCELADO,
  IN_LIBERADO, ISNULL(IN_CONSOLIDADO,'0') AS IN_CONSOLIDADO, ISNULL(IN_SEGURO,'0') AS IN_SEGURO, ISNULL(IN_URGENTE,'0') AS IN_URGENTE, ISNULL(IN_DADOS_IGUAIS_ITENS,'0') AS IN_DADOS_IGUAIS_ITENS, CD_GRUPO,
  CD_AGENTE, NR_COURRIER, NR_REF_EXPORTADOR, CD_PAIS_ORIGEM, CD_TERMO_PAGTO,
  DIAS_CONDICAO_PAGTO, CONDICAO_PAGTO FROM TPROCESSO ( NOLOCK) WHERE NR_PROCESSO = @NR_PROCESSO">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /></SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEditPedidoItem" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT TPO.NR_PROCESSO, P.NR_PROCESSO AS NR_PROCESSO2, TPO.NR_ITEM, TPO.NR_ITEM_CLIENTE, TPO.CD_MERCADORIA, TPO.CD_NCM_SH, TPO.QT_INICIAL, ISNULL(TPO.IN_NECESSITA_LI,'0') AS IN_NECESSITA_LI, ISNULL(TPO.IN_DRAWBACK,'0') AS IN_DRAWBACK,
  TPO.CD_AREA, TPO.CD_LOCAL_DESEMBARQUE, TPO.CD_EMBARCACAO, TPO.CD_AGENTE, TPO.NR_VIAGEM, TPO.NR_VOO, TPO.NR_CONHECIMENTO,
  TPO.NR_COURRIER, ISNULL(TPO.IN_CONSOLIDADO,'0') AS IN_CONSOLIDADO, ISNULL(TPO.IN_URGENTE,'0') AS IN_URGENTE, ISNULL(TPO.IN_SEGURO,'0') AS IN_SEGURO, TPO.VL_UNITARIO, TPO.TP_CALCULO, TPO.PL_ITEM, TPO.CD_UNID_MEDIDA,
  TPO.CD_NALADI_SH, TPO.CD_NALADI_NCCA, TPO.CD_FABRICANTE, TPO.CD_PAIS_ORIGEM, TPO.VL_TOTAL, TPO.PC_DESCONTO, TPO.VL_DESCONTO,
  TPO.IN_REEIMPORTACAO, TPO.QT_BAIXADA_DI, TPO.QT_BAIXADA_LI, TPO.IN_MONTADO, TPO.CD_EXPORTADOR, TPO.CD_PAIS_AQUISICAO,
  TPO.IN_FABR_EXP_PROD, TPO.TX_MERCADORIA, TPO.TP_DRAWBACK, TPO.NR_FATURA, TPO.CD_MERC_FORNEC, TPO.CD_MOEDA_NEGOCIADA,
  TPO.NR_PARCIAL, TPO.QT_DISPONIVEL, TPO.DT_ABERTURA_ITEM, TPO.DT_FATURA, TPO.CD_EMPRESA, TPO.NR_ORDEM, P.CD_UNID_NEG, P.CD_IMPORTADOR, P.CD_GRUPO
    FROM TPO_ITEM TPO ( NOLOCK )
     INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = TPO.NR_PROCESSO AND P.CD_CLIENTE = TPO.CD_EMPRESA
    WHERE P.NR_PROCESSO = @NR_PROCESSO
      AND TPO.NR_ITEM_CLIENTE = @NR_ITEM_CLIENTE
      AND NR_PARCIAL = 0
    ORDER BY NR_ITEM_CLIENTE">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo"/></SelectParameters>
    <SelectParameters><asp:QueryStringParameter Name="NR_ITEM_CLIENTE" QueryStringField="item_cliente"/></SelectParameters>
    </asp:SqlDataSource>
    </div> 
    <br />
    <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;">
    <asp:LinkButton ID="lbVoltar" runat="server" OnClick="VoltarMenu"><img src="../../imagens/voltar1.gif" style="border:0px" alt=""/></asp:LinkButton></div><div style="bottom:2px;height:20px;position:absolute;right:5px"> <a href="http://www.instantssl.com" id="comodoTL">SSL</a><script type="text/javascript">TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>
   </form> 
</body>
</html>
