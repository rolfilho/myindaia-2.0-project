<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Import Namespace="System.Web.UI.Page" %>
<%@ Page Language="VB" Debug="true"%>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%      Response.CacheControl = "no-cache"%>
<%      Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">   
    Dim SqlAux As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim vNmTitulo As String
        Dim cbUteisCorridos As Boolean
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        Dim lblTitulo As Label = frmMBFPersonaliza.FindControl("lblTitulo")
        Dim lblTituloR As Label = frmMBFPersonaliza.FindControl("lblTituloR")
        If Session("usuario") = "" Or Session("codigo") = "" Or Session("cd_menu") = "" Then
            Session("usuario") = Request("usuario")
            Session("codigo") = Request("codigo")
            Session("cd_menu") = Request("cd_menu")
        End If
               
        SqlAux = " SELECT * FROM TMBF_INFO (NOLOCK) WHERE CD_MBF = " & Session("codigo") & " AND CD_USUARIO = '" & Session("usuario") & "' "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        If RsAux.HasRows Then
            RsAux.Read()
            vNmTitulo = RsAux("NM_MBF")
            cbUteisCorridos = RsAux("IN_UTEIS_CORRIDOS")
            
            If cbUteisCorridos Then
                lblUteis.Text = ""                
            End If
            
            If Not Page.IsPostBack Then
                rdAgrupar.SelectedValue = RsAux("TP_AGRUPAMENTO")
                AlteraAgrupamento(sender, e)
            End If
        Else
            vNmTitulo = ""
        End If
        lblTitulo.Text = vNmTitulo
        lblTituloR.Text = vNmTitulo
        
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()          
    End Sub
    
    Sub VoltarMenu(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("usuario") = ""
        Session("nm_usuario") = ""
        Session("cd_menu") = ""
        Response.Redirect("/default.asp")
    End Sub
    
    Sub AtualizaQuebra(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim CnnAux As SqlConnection
        'Dim CmdAux As SqlCommand
        SqlMBFPersonaliza.UpdateCommand = " UPDATE TMBF_INFO SET IN_MODAL = '" & CBool(cbModal.Checked) & "', " & _
                                          " IN_CNPJ = '" & CBool(cbCNPJ.Checked) & "', " & _
                                          " IN_AREA = '" & CBool(cbArea.Checked) & "',  " & _
                                          " IN_ESTUFAGEM = '" & CBool(cbEstufagem.Checked) & "', " & _
                                          " IN_LI = '" & CBool(cbLi.Checked) & "', " & _
                                          " IN_PAIS_ORIGEM = '" & CBool(cbPaisOrigem.Checked) & "', " & _
                                          " IN_PREFIXO = '" & CBool(cbPrefixo.Checked) & "', " & _
                                          " IN_TERMINAL = '" & CBool(cbTerminal.Checked) & "'," & _
                                          " IN_CANAL = '" & CBool(cbCanal.Checked) & "', " & _
                                          " IN_SERVICO = '" & CBool(cbServico.Checked) & "'," & _
                                          " IN_LOCAL_DES = '" & CBool(cbLocalDes.Checked) & "'" & _
                                          " WHERE CD_MBF = " & Session("codigo") & " " & _
                                          "   AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Update()
        
        'SqlAux = "EXEC sp_cria_mbf_simulacao " & Session("codigo") & ", '" & Session("usuario") & "'"
        'CnnAux = New SqlConnection(Cnn)
        'CmdAux = New SqlCommand(SqlAux, CnnAux)
        'CnnAux.Open()
        'CmdAux.ExecuteNonQuery()
        'CmdAux.Dispose()
        'CnnAux.Close()
        
        Page.DataBind()
        ExibeQuebra()
    End Sub
    
    Sub AtualizaFormato(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim CnnAux As SqlConnection
        'Dim CmdAux As SqlCommand
        SqlMBFPersonaliza.UpdateCommand = " UPDATE TMBF_INFO SET IN_DESVIOS = '" & CBool(cbDesvios.Checked) & "', " & _
                                          "                      IN_DECIMAL = '" & CBool(cbDecimal.Checked) & "', " & _
                                          "                      IN_LEGENDA_META = '" & CBool(cbLegMeta.Checked) & "', " & _
                                          "                      IN_META = '" & CBool(cbMeta.Checked) & "', " & _
                                          "                      QTDE_MESES_GRAFICO = " & txtQtdMesesGrafico.Text & "," & _
                                          "                      IN_GRAFICO_PROC_ABERTOS = '" & CBool(cbGraficoProcessosAbertos.Checked) & "', " & _
                                          "                      IN_UTEIS_CORRIDOS = '" & CBool(cbGraficoUteisCorridos.Checked) & "'," & _
                                          "                      IN_COM_SEM_DESVIOS = '" & CBool(cbGraficoDesvios.Checked) & "'" & _
                                          " WHERE CD_MBF = " & Session("codigo") & " " & _
                                          "   AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Update()
        
        'SqlAux = "EXEC sp_cria_mbf_simulacao " & Session("codigo") & ", '" & Session("usuario") & "'"
        'CnnAux = New SqlConnection(Cnn)
        'CmdAux = New SqlCommand(SqlAux, CnnAux)
        'CnnAux.Open()
        'CmdAux.ExecuteNonQuery()
        'CmdAux.Dispose()
        'CnnAux.Close()
        
        Page.DataBind()
        CarregaResultado(sender, e)
        ExibeFormato()
    End Sub
    
    Sub AtualizaFormatoSimulacao(ByVal sender As Object, ByVal e As System.EventArgs)
        If sender.id = "cbGraficoUteisCorridos" Then
            If cbGraficoUteisCorridos.Checked Then
                in_uteis_corridos_aux.Value = True
                in_uteis_corridos_2_aux.Value = True
                lblUteis.Text = ""
                cbGraficoDesvios.Checked = False
            Else
                in_uteis_corridos_aux.Value = False
                in_uteis_corridos_2_aux.Value = False
                lblUteis.Text = "Úteis"
                cbGraficoDesvios.Checked = True
            End If
        Else
            If cbGraficoDesvios.Checked Then
                in_uteis_corridos_aux.Value = False
                in_uteis_corridos_2_aux.Value = False
                lblUteis.Text = "Úteis"
                cbGraficoUteisCorridos.Checked = False
            Else
                in_uteis_corridos_aux.Value = True
                in_uteis_corridos_2_aux.Value = True
                lblUteis.Text = ""
                cbGraficoUteisCorridos.Checked = True
            End If
        End If
        
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        SqlMBFPersonaliza.UpdateCommand = " UPDATE TMBF_INFO SET IN_UTEIS_CORRIDOS = '" & CBool(cbGraficoUteisCorridos.Checked) & "'," & _
                                          "                      IN_COM_SEM_DESVIOS = '" & CBool(cbGraficoDesvios.Checked) & "'" & _
                                          " WHERE CD_MBF = " & Session("codigo") & " " & _
                                          "   AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Update()
        
        SqlAux = "EXEC sp_cria_mbf_simulacao " & Session("codigo") & ", '" & Session("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CmdAux.Dispose()
        CnnAux.Close()
        
        Page.DataBind()
        CarregaResultado(sender, e)
        ExibeFormato()
    End Sub
    
    Sub AtualizaKPIGerados(ByVal sender As Object, ByVal e As System.EventArgs)        
        SqlMBFPersonaliza.UpdateCommand = " UPDATE TMBF_INFO SET IN_ATIVO = '0' " & _
                                          " WHERE CD_MBF_CRIADOR = " & Request("codigo") & " " & _
                                          "   AND CD_USUARIO_CRIADOR = '" & Request("usuario") & "'"
        SqlMBFPersonaliza.Update()
        
        SqlMBFPersonaliza.InsertCommand = " INSERT INTO TMBF_SELECIONADO " & _
                                                " VALUES ( (SELECT ISNULL(MAX(CD_SELECIONADO), 0) + 1 FROM TMBF_SELECIONADO (NOLOCK)), " & _
                                                " " & Session("codigo") & ", " & _
                                                " '" & Session("usuario") & "', " & _
                                                " '" & ddlMes.SelectedValue & "', " & _
                                                " '" & ddlAno.SelectedValue & "', " & _
                                                " '0', " & _
                                                " NULL, " & _
                                                " GETDATE(), '" & CBool(cbUrgente.Checked) & "'," & _
                                                " '" & txtCdEvento.Text & "') "
        SqlMBFPersonaliza.Insert()
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "script", "alert('ATENÇÃO: As informações foram salvas com sucesso!');", True)
        Page.DataBind()
        ExibeGerados()
    End Sub
    
    Sub AtualizaKPI(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim ArrayKPI, ArrayKPINomes As Array
        Dim objeto As Object
        'Quebras
        Dim ArrayKPIModal, ArrayKPICNPJ, ArrayKPIArea, ArrayKPIEstufagem, ArrayKPILI, ArrayKPIPaisOrigem, ArrayKPIPrefixo, ArrayKPITerminal, ArrayKPICanal, ArrayKPIServico, ArrayKPILocalDes As Array
        Dim I As Integer
        
        ArrayKPI = Split(hfKPI.Value, ";")
        ArrayKPINomes = Split(hfKPINomes.Value, ";")
        ArrayKPIModal = Split(hfKPIInModal.Value, ";")
        ArrayKPICNPJ = Split(hfKPIInCNPJ.Value, ";")
        ArrayKPIArea = Split(hfKPIInArea.Value, ";")
        ArrayKPIEstufagem = Split(hfKPIInEstufagem.Value, ";")
        ArrayKPILI = Split(hfKPIInLI.Value, ";")
        ArrayKPIPaisOrigem = Split(hfKPIInPaisOrigem.Value, ";")
        ArrayKPIPrefixo = Split(hfKPIInPrefixo.Value, ";")
        ArrayKPITerminal = Split(hfKPIInTerminal.Value, ";")
        ArrayKPICanal = Split(hfKPIInCanal.Value, ";")
        ArrayKPIServico = Split(hfKPIInServico.Value, ";")
        ArrayKPILocalDes = Split(hfKPIInLocalDes.Value, ";")
        
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_KPI WHERE CD_MBF = " & Session("codigo") & " AND CD_USUARIO = '" & Session("usuario") & "' "
        SqlMBFPersonaliza.Delete()
        
        For I = 0 To UBound(ArrayKPI) - 1
            If Trim(ArrayKPI(I)) <> "" And Trim(ArrayKPINomes(I)) <> "" Then
                If ArrayKPIModal(I) = "true" Then ArrayKPIModal(I) = "1" Else ArrayKPIModal(I) = "0"
                If ArrayKPICNPJ(I) = "true" Then ArrayKPICNPJ(I) = "1" Else ArrayKPICNPJ(I) = "0"
                If ArrayKPIArea(I) = "true" Then ArrayKPIArea(I) = "1" Else ArrayKPIArea(I) = "0"
                If ArrayKPIEstufagem(I) = "true" Then ArrayKPIEstufagem(I) = "1" Else ArrayKPIEstufagem(I) = "0"
                If ArrayKPILI(I) = "true" Then ArrayKPILI(I) = "1" Else ArrayKPILI(I) = "0"
                If ArrayKPIPaisOrigem(I) = "true" Then ArrayKPIPaisOrigem(I) = "1" Else ArrayKPIPaisOrigem(I) = "0"
                If ArrayKPIPrefixo(I) = "true" Then ArrayKPIPrefixo(I) = "1" Else ArrayKPIPrefixo(I) = "0"
                If ArrayKPITerminal(I) = "true" Then ArrayKPITerminal(I) = "1" Else ArrayKPITerminal(I) = "0"
                If ArrayKPICanal(I) = "true" Then ArrayKPICanal(I) = "1" Else ArrayKPICanal(I) = "0"
                If ArrayKPIServico(I) = "true" Then ArrayKPIServico(I) = "1" Else ArrayKPIServico(I) = "0"
                If ArrayKPILocalDes(I) = "true" Then ArrayKPILocalDes(I) = "1" Else ArrayKPILocalDes(I) = "0"
                
                SqlMBFPersonaliza.InsertCommand = " INSERT INTO TMBF_KPI " & _
                                                    " VALUES (" & Request("codigo") & ", " & _
                                                    " '" & Request("usuario") & "', " & _
                                                    " '" & ArrayKPI(I) & "', " & _
                                                    " '" & ArrayKPINomes(I) & "', " & _
                                                    " '" & ArrayKPIModal(I) & "', " & _
                                                    " '" & ArrayKPICNPJ(I) & "', " & _
                                                    " '" & ArrayKPIArea(I) & "', " & _
                                                    " '" & ArrayKPIEstufagem(I) & "', " & _
                                                    " '" & ArrayKPILI(I) & "', " & _
                                                    " '" & ArrayKPIPaisOrigem(I) & "', " & _
                                                    " '" & ArrayKPIPrefixo(I) & "', " & _
                                                    " (SELECT ISNULL(MAX(ID_KPI), 0) + 1 FROM TMBF_KPI (NOLOCK) WHERE CD_MBF = " & Request("codigo") & " AND CD_USUARIO = '" & Request("usuario") & "'), " & _
                                                    " '" & ArrayKPITerminal(I) & "'," & _
                                                    " '" & ArrayKPICanal(I) & "'," & _
                                                    " '" & ArrayKPIServico(I) & "'," & _
                                                    " '" & ArrayKPILocalDes(I) & "'" & _
                                                    ") "
                SqlMBFPersonaliza.Insert()
                Page.DataBind()
                
            End If
        Next
        
        SqlAux = "EXEC sp_cria_mbf_simulacao " & Session("codigo") & ", '" & Session("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CmdAux.Dispose()
        CnnAux.Close()
        
        Page.DataBind()
        CarregaKPI(objeto, e)
        ExibeKPI()

    End Sub
    
    Sub AtualizaOutros(ByVal sender As Object, ByVal e As System.EventArgs)        
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim ArrayOutros, ArrayOutrosNomes As Array
        'Quebras
        Dim ArrayOutrosModal, ArrayOutrosCNPJ, ArrayOutrosArea, ArrayOutrosEstufagem, ArrayOutrosLI, ArrayOutrosPaisOrigem, ArrayOutrosPrefixo, ArrayOutrosTerminal, ArrayOutrosCanal, ArrayOutrosServico, ArrayOutrosLocalDes As Array
        Dim I As Integer
        
        ArrayOutros = Split(hfOutros.Value, ";")
        ArrayOutrosNomes = Split(hfOutrosNomes.Value, ";")
        ArrayOutrosModal = Split(hfOutrosInModal.Value, ";")
        ArrayOutrosCNPJ = Split(hfOutrosInCNPJ.Value, ";")
        ArrayOutrosArea = Split(hfOutrosInArea.Value, ";")
        ArrayOutrosEstufagem = Split(hfOutrosInEstufagem.Value, ";")
        ArrayOutrosLI = Split(hfOutrosInLI.Value, ";")
        ArrayOutrosPaisOrigem = Split(hfOutrosInPaisOrigem.Value, ";")
        ArrayOutrosPrefixo = Split(hfOutrosInPrefixo.Value, ";")
        ArrayOutrosTerminal = Split(hfOutrosInTerminal.Value, ";")
        ArrayOutrosCanal = Split(hfOutrosInCanal.Value, ";")
        ArrayOutrosServico = Split(hfOutrosInServico.Value, ";")
        ArrayOutrosLocalDes = Split(hfOutrosInLocalDes.Value, ";")
                
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_OUTROS WHERE CD_MBF = " & Session("codigo") & " AND CD_USUARIO = '" & Session("usuario") & "' "
        SqlMBFPersonaliza.Delete()
        
        For I = 0 To UBound(ArrayOutros) - 1
            If Trim(ArrayOutros(I)) <> "" And Trim(ArrayOutrosNomes(I)) <> "" Then
                If ArrayOutrosModal(I) = "true" Then ArrayOutrosModal(I) = "1" Else ArrayOutrosModal(I) = "0"
                If ArrayOutrosCNPJ(I) = "true" Then ArrayOutrosCNPJ(I) = "1" Else ArrayOutrosCNPJ(I) = "0"
                If ArrayOutrosArea(I) = "true" Then ArrayOutrosArea(I) = "1" Else ArrayOutrosArea(I) = "0"
                If ArrayOutrosEstufagem(I) = "true" Then ArrayOutrosEstufagem(I) = "1" Else ArrayOutrosEstufagem(I) = "0"
                If ArrayOutrosLI(I) = "true" Then ArrayOutrosLI(I) = "1" Else ArrayOutrosLI(I) = "0"
                If ArrayOutrosPaisOrigem(I) = "true" Then ArrayOutrosPaisOrigem(I) = "1" Else ArrayOutrosPaisOrigem(I) = "0"
                If ArrayOutrosPrefixo(I) = "true" Then ArrayOutrosPrefixo(I) = "1" Else ArrayOutrosPrefixo(I) = "0"
                If ArrayOutrosTerminal(I) = "true" Then ArrayOutrosTerminal(I) = "1" Else ArrayOutrosTerminal(I) = "0"
                If ArrayOutrosCanal(I) = "true" Then ArrayOutrosCanal(I) = "1" Else ArrayOutrosCanal(I) = "0"
                If ArrayOutrosServico(I) = "true" Then ArrayOutrosServico(I) = "1" Else ArrayOutrosServico(I) = "0"
                If ArrayOutrosLocalDes(I) = "true" Then ArrayOutrosLocalDes(I) = "1" Else ArrayOutrosLocalDes(I) = "0"
                
                SqlMBFPersonaliza.InsertCommand = " INSERT INTO TMBF_OUTROS " & _
                                                    " VALUES (" & Request("codigo") & ", " & _
                                                    " '" & Request("usuario") & "', " & _
                                                    " '" & ArrayOutros(I) & "', " & _
                                                    " '" & ArrayOutrosNomes(I) & "', " & _
                                                    " '" & ArrayOutrosModal(I) & "', " & _
                                                    " '" & ArrayOutrosCNPJ(I) & "', " & _
                                                    " '" & ArrayOutrosArea(I) & "', " & _
                                                    " '" & ArrayOutrosEstufagem(I) & "', " & _
                                                    " '" & ArrayOutrosLI(I) & "', " & _
                                                    " '" & ArrayOutrosPaisOrigem(I) & "', " & _
                                                    " '" & ArrayOutrosPrefixo(I) & "', " & _
                                                    " '" & ArrayOutrosTerminal(I) & "'," & _
                                                    " (SELECT ISNULL(MAX(ID_GRAFICO), 0) + 1 FROM TMBF_OUTROS (NOLOCK) WHERE CD_MBF = " & Request("codigo") & " AND CD_USUARIO = '" & Request("usuario") & "'), " & _
                                                    " '" & ArrayOutrosCanal(I) & "'," & _
                                                    " '" & ArrayOutrosServico(I) & "'," & _
                                                    " '" & ArrayOutrosLocalDes(I) & "'" & _
                                                    ") "
                'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('" & SqlMBFPersonaliza.InsertCommand & "')", True)
                SqlMBFPersonaliza.Insert()
                Page.DataBind()
                ExibeOutrosGraficos()
            End If
        Next
        
        SqlAux = "EXEC sp_cria_mbf_simulacao " & Session("codigo") & ", '" & Session("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CmdAux.Dispose()
        CnnAux.Close()
        
        Page.DataBind()
        ExibeOutrosGraficos()
    End Sub
    
    Sub AtualizaMeta(ByVal sender As Object, ByVal e As System.EventArgs)        
        Dim txtNrMeta As TextBox
        Dim ArrayResultado As Array
        Dim CdResultado, Linha As Integer
        Dim CdModal, CdEstufagem, CdLi, CdKPI, TpKPI, NmTpKPI, IdKPI As String
        
        ArrayResultado = Split(sender.CommandArgument.ToString(), ";")
        CdResultado = ArrayResultado(0)
        Linha = ArrayResultado(1)
        CdModal = ArrayResultado(2)
        CdEstufagem = ArrayResultado(3)
        CdKPI = ArrayResultado(4)
        TpKPI = ArrayResultado(5)
        NmTpKPI = ArrayResultado(6)
        IdKPI = ArrayResultado(7)
        CdLi = ArrayResultado(8)
        txtNrMeta = grdSimulacao.Rows(Linha - 1).Cells(2).FindControl("txtNrMeta")
        
        If txtNrMeta.Text = "" Then
            txtNrMeta.Text = "NULL"
        End If
        
        If Trim(CdModal) = "" Then
            CdModal = "IS NULL"
        Else
            CdModal = " = '" & CdModal & "'"
        End If
        
        If Trim(CdEstufagem) = "" Then
            CdEstufagem = " IS NULL"
        Else
            CdEstufagem = " = '" & CdEstufagem & "'"
        End If
        
        If Trim(CdLi) = "" Then
            CdLi = " IS NULL"
        Else
            CdLi = " = '" & CdLi & "'"
        End If
                
        SqlMBFPersonaliza.UpdateCommand = " UPDATE TMBF_RESULTADO SET NR_META = " & txtNrMeta.Text & " " & _
                                          " WHERE CD_MBF       = " & Request("codigo") & " " & _
                                          "   AND CD_USUARIO   = '" & Request("usuario") & "'" & _
                                          "   AND CD_MODAL     " & CdModal & " " & _
                                          "   AND CD_ESTUFAGEM " & CdEstufagem & " " & _
                                          "   AND CD_LI        " & CdLi & " " & _
                                          "   AND CD_KPI       = '" & CdKPI & "'" & _
                                          "   AND TP_KPI       = '" & TpKPI & "'" & _
                                          "   AND NM_TP_KPI    = '" & NmTpKPI & "'" & _
                                          "   AND ID_KPI       = " & IdKPI & ""
        'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('" & IdKPI & "')", True)
        'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('" & CdResultado.ToString & "');", True)
        SqlMBFPersonaliza.Update()
        Page.DataBind()
        CarregaResultado(sender, e)
    End Sub
    
    Sub DeletaSelecionado(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ArrayResultado As Array
        Dim CdMbf, CdUsuario, Mes, Ano, CdSelecionado As String
        
        ArrayResultado = Split(sender.CommandArgument.ToString(), ";")
        CdMbf = ArrayResultado(2)
        CdUsuario = ArrayResultado(3)
        Mes = ArrayResultado(0)
        Ano = ArrayResultado(1)
        CdSelecionado = ArrayResultado(4)
             
        SqlGeradosKPI.DeleteCommand = " DELETE FROM TMBF_RESULTADO WHERE CD_MBF = " & CdMbf & " " & _
                                      "   AND CD_USUARIO = '" & CdUsuario & "'" & _
                                      " AND MES_RESULTADO = " & Mes & " " & _
                                      " AND ANO_RESULTADO = " & Ano
        SqlGeradosKPI.Delete()
        
        SqlGeradosKPI.DeleteCommand = " DELETE FROM TMBF_SELECIONADO WHERE CD_MBF = " & CdMbf & " " & _
                                         " AND CD_USUARIO = '" & CdUsuario & "'" & _
                                         " AND MES_SELECIONADO = " & Mes & " " & _
                                         " AND ANO_SELECIONADO = " & Ano & " " & _
                                         " AND CD_SELECIONADO = " & CdSelecionado
        
        
        'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('" & Mes & "')", True)
        'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('" & CdResultado.ToString & "');", True)
        SqlGeradosKPI.Delete()
        Page.DataBind()
        ExibeGerados()
    End Sub
    
    Sub CarregaKPI(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim I As Integer
        Dim chk_uteis, chk_corridos, tp_kpi As String
        Dim inModal, inCNPJ, inArea, inEstufagem, inLI, inPaisOrigem, inPrefixo, inTerminal, inCanal, inServico, inLocalDes As String
        Dim chkModal, chkCNPJ, chkArea, chkEstufagem, chkLI, chkPaisOrigem, chkPrefixo, chkTerminal, chkCanal, chkServico, chkLocalDes As String
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        SqlAux = " SELECT * FROM TMBF_INFO (NOLOCK) WHERE CD_MBF = " & Request("codigo") & " AND CD_USUARIO = '" & Request("usuario") & "' "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        inModal = RsAux("IN_MODAL")
        inCNPJ = RsAux("IN_CNPJ")
        inArea = RsAux("IN_AREA")
        inEstufagem = RsAux("IN_ESTUFAGEM")
        inLI = RsAux("IN_LI")
        inPaisOrigem = RsAux("IN_PAIS_ORIGEM")
        inPrefixo = RsAux("IN_PREFIXO")
        inTerminal = RsAux("IN_TERMINAL")
        inCanal = RsAux("IN_CANAL")
        inServico = RsAux("IN_SERVICO")
        inLocalDes = RsAux("IN_LOCAL_DES")
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()        
        SqlAux = " SELECT * FROM TMBF_KPI (NOLOCK) WHERE CD_MBF = " & Session("codigo") & " AND CD_USUARIO = '" & Session("usuario") & "' ORDER BY ID_KPI "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        ltlKPISelecionado.Text = ""
        If RsAux.HasRows Then
            I = 0
            Do While RsAux.Read()
                I = I + 1
                chk_uteis = ""
                chk_corridos = ""
                tp_kpi = "0"
                Select Case Right(RsAux("CD_KPI"), 2)
                    Case "_0"
                        chk_uteis = "checked"
                        chk_corridos = ""
                        tp_kpi = "0"
                    Case "_1"
                        chk_uteis = ""
                        chk_corridos = "checked"
                        tp_kpi = "1"
                    Case "_2"
                        chk_uteis = "checked"
                        chk_corridos = "checked"
                        tp_kpi = "2"
                End Select
                
                If RsAux("IN_MODAL") = "1" Then chkModal = "checked" Else chkModal = ""
                If RsAux("IN_CNPJ") = "1" Then chkCNPJ = "checked" Else chkCNPJ = ""
                If RsAux("IN_AREA") = "1" Then chkArea = "checked" Else chkArea = ""
                If RsAux("IN_ESTUFAGEM") = "1" Then chkEstufagem = "checked" Else chkEstufagem = ""
                If RsAux("IN_LI") = "1" Then chkLI = "checked" Else chkLI = ""
                If RsAux("IN_PAIS_ORIGEM") = "1" Then chkPaisOrigem = "checked" Else chkPaisOrigem = ""
                If RsAux("IN_PREFIXO") = "1" Then chkPrefixo = "checked" Else chkPrefixo = ""
                If RsAux("IN_TERMINAL") = "1" Then chkTerminal = "checked" Else chkTerminal = ""
                If RsAux("IN_CANAL") = "1" Then chkCanal = "checked" Else chkCanal = ""
                If RsAux("IN_SERVICO") = "1" Then chkServico = "checked" Else chkServico = ""
                If RsAux("IN_LOCAL_DES") = "1" Then chkLocalDes = "checked" Else chkLocalDes = ""
                                
                ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<div id='" & Left(RsAux("CD_KPI"), 10) & RsAux("ID_KPI") & "'><input type='text' style='display:none' value='" & tp_kpi & "' id='tipo_kpi" & I & "'>&nbsp;&nbsp;"
                If cbGraficoUteisCorridos.Checked Then
                    ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='tipo_kpi" & I & "_tp1' onclick='alteraCheckKPI(this);' " & chk_uteis & " style='display:none;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi" & I & "_tp2' onclick='alteraCheckKPI(this);' " & chk_corridos & " style='display:none;'>"
                Else
                    ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='tipo_kpi" & I & "_tp1' onclick='alteraCheckKPI(this);' " & chk_uteis & ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi" & I & "_tp2' onclick='alteraCheckKPI(this);' " & chk_corridos & ">"
                End If
                ltlKPISelecionado.Text = ltlKPISelecionado.Text & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:retiraKpi(""" & Mid(RsAux("CD_KPI"), 4, 7) & RsAux("ID_KPI") & """);'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;<input type='text' style='display:none' name='codigo_kpi" & I & "' id='codigo_kpi" & I & "' value='" & Left(RsAux("CD_KPI"), 10) & "'><input type='text' style='display:none' name='flag_kpi" & Mid(RsAux("CD_KPI"), 4, 7) & RsAux("ID_KPI") & "' id='flag_kpi" & Mid(RsAux("CD_KPI"), 4, 7) & RsAux("ID_KPI") & "' value='" & Left(RsAux("CD_KPI"), 10) & "' ><input type='text' style='display:none' name='texto_kpi" & I & "' id='texto_kpi" & I & "' value='" & RsAux("NM_KPI") & "' >" & RsAux("NM_KPI") & "<br>"                
                ltlKPISelecionado.Text = ltlKPISelecionado.Text & "&nbsp;&nbsp;&nbsp;<b>Quebras:</b>&nbsp;"
                
                If inModal Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_modal_kpi" & I & "' onclick='' " & chkModal & " >Modal&nbsp;"
                If inCNPJ Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_cnpj_kpi" & I & "' onclick='' " & chkCNPJ & " >CNPJ&nbsp;"
                If inArea Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_area_kpi" & I & "' onclick='' " & chkArea & " >Área&nbsp;"
                If inEstufagem Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_estufagem_kpi" & I & "' onclick='' " & chkEstufagem & " >Estufagem&nbsp;"
                If inLI Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_li_kpi" & I & "' onclick='' " & chkLI & " >Com/Sem LI&nbsp;"
                If inPaisOrigem Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_pais_origem_kpi" & I & "' onclick='' " & chkPaisOrigem & " >Pais de origem&nbsp;"
                If inPrefixo Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_prefixo_kpi" & I & "' onclick='' " & chkPrefixo & " >Prefixo&nbsp;"
                If inTerminal Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_terminal_kpi" & I & "' onclick='' " & chkTerminal & " >Terminal&nbsp;"
                If inCanal Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_canal_kpi" & I & "' onclick='' " & chkCanal & " >Canal&nbsp;"
                If inServico Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_servico_kpi" & I & "' onclick='' " & chkServico & " >Serviço&nbsp;"
                If inLocalDes Then ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<input type='checkbox' id='in_local_des_kpi" & I & "' onclick='' " & chkLocalDes & " >Local de desembarque&nbsp;"
                ltlKPISelecionado.Text = ltlKPISelecionado.Text & "<br></div>"
            Loop
        End If
        contador_total_kpi.Value = I
        contador_total_kpi_aux.Value = I
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
        
    Sub CarregaOutros(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim I As Integer
        Dim inModal, inCNPJ, inArea, inEstufagem, inLI, inPaisOrigem, inPrefixo, inTerminal, inCanal, inServico, inLocalDes As String
        Dim chkModal, chkCNPJ, chkArea, chkEstufagem, chkLI, chkPaisOrigem, chkPrefixo, chkTerminal, chkCanal, chkServico, chkLocalDes As String
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        SqlAux = " SELECT * FROM TMBF_INFO (NOLOCK) WHERE CD_MBF = " & Request("codigo") & " AND CD_USUARIO = '" & Request("usuario") & "' "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        RsAux.Read()
        inModal = RsAux("IN_MODAL")
        inCNPJ = RsAux("IN_CNPJ")
        inArea = RsAux("IN_AREA")
        inEstufagem = RsAux("IN_ESTUFAGEM")
        inLI = RsAux("IN_LI")
        inPaisOrigem = RsAux("IN_PAIS_ORIGEM")
        inPrefixo = RsAux("IN_PREFIXO")
        inTerminal = RsAux("IN_TERMINAL")
        inCanal = RsAux("IN_CANAL")
        inServico = RsAux("IN_SERVICO")
        inLocalDes = RsAux("IN_LOCAL_DES")
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
        SqlAux = " SELECT * FROM TMBF_OUTROS (NOLOCK) WHERE CD_MBF = " & Session("codigo") & " AND CD_USUARIO = '" & Session("usuario") & "' "
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        ltlOutrosSelecionado.Text = ""
        If RsAux.HasRows Then
            I = 0
            Do While RsAux.Read()
                I = I + 1

                If RsAux("IN_MODAL") = "1" Then chkModal = "checked" Else chkModal = ""
                If RsAux("IN_CNPJ") = "1" Then chkCNPJ = "checked" Else chkCNPJ = ""
                If RsAux("IN_AREA") = "1" Then chkArea = "checked" Else chkArea = ""
                If RsAux("IN_ESTUFAGEM") = "1" Then chkEstufagem = "checked" Else chkEstufagem = ""
                If RsAux("IN_LI") = "1" Then chkLI = "checked" Else chkLI = ""
                If RsAux("IN_PAIS_ORIGEM") = "1" Then chkPaisOrigem = "checked" Else chkPaisOrigem = ""
                If RsAux("IN_PREFIXO") = "1" Then chkPrefixo = "checked" Else chkPrefixo = ""
                If RsAux("IN_TERMINAL") = "1" Then chkTerminal = "checked" Else chkTerminal = ""
                If RsAux("IN_CANAL") = "1" Then chkCanal = "checked" Else chkCanal = ""
                If RsAux("IN_SERVICO") = "1" Then chkServico = "checked" Else chkServico = ""
                If RsAux("IN_LOCAL_DES") = "1" Then chkLocalDes = "checked" Else chkLocalDes = ""
                
                ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<div id='outros" & Trim(RsAux("CD_GRAFICO")) & Trim(RsAux("ID_GRAFICO")) & "'>&nbsp;&nbsp;<a href='javascript:retiraOutros(""" & Trim(RsAux("CD_GRAFICO")) & Trim(RsAux("ID_GRAFICO")) & """);'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;<input type='text' style='display:none' name='codigo_outros" & I & "' id='codigo_outros" & I & "' value='" & RsAux("CD_GRAFICO") & "'><input type='text' style='display:none' name='flag_outros" & Trim(RsAux("CD_GRAFICO")) & Trim(RsAux("ID_GRAFICO")) & "' id='flag_outros" & Trim(RsAux("CD_GRAFICO")) & Trim(RsAux("ID_GRAFICO")) & "' value='" & RsAux("CD_GRAFICO") & "' ><input type='text' style='display:none' name='texto_outros" & I & "' id='texto_outros" & I & "' value='" & RsAux("NM_GRAFICO") & "' >" & RsAux("NM_GRAFICO") & "<br>"
                ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "&nbsp;&nbsp;&nbsp;<b>Quebras:</b>&nbsp;"
                
                If inModal Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_modal_outros" & I & "' onclick='' " & chkModal & " >Modal&nbsp;"
                If inCNPJ Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_cnpj_outros" & I & "' onclick='' " & chkCNPJ & " >CNPJ&nbsp;"
                If inArea Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_area_outros" & I & "' onclick='' " & chkArea & " >Área&nbsp;"
                If inEstufagem Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_estufagem_outros" & I & "' onclick='' " & chkEstufagem & " >Estufagem&nbsp;"
                If inLI Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_li_outros" & I & "' onclick='' " & chkLI & " >Com/Sem LI&nbsp;"
                If inPaisOrigem Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_pais_origem_outros" & I & "' onclick='' " & chkPaisOrigem & " >Pais de origem&nbsp;"
                If inPrefixo Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_prefixo_outros" & I & "' onclick='' " & chkPrefixo & " >Prefixo&nbsp;"
                If inTerminal Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_terminal_outros" & I & "' onclick='' " & chkTerminal & " >Terminal&nbsp;"
                If inCanal Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_canal_outros" & I & "' onclick='' " & chkCanal & " >Canal&nbsp;"
                If inServico Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_servico_outros" & I & "' onclick='' " & chkServico & " >Serviço&nbsp;"
                If inLocalDes Then ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<input type='checkbox' id='in_local_des_outros" & I & "' onclick='' " & chkLocalDes & " >Local de desembarque&nbsp;"
                ltlOutrosSelecionado.Text = ltlOutrosSelecionado.Text & "<br></div>"
            Loop
        End If
        contador_total_outros.Value = I
        contador_total_outros_aux.Value = I
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
    
    Function ExibeKPI() As Boolean        
        If cbGraficoUteisCorridos.Checked Then
            lblUteis.Visible = False
            lblCorridos.Visible = False
        Else
            lblUteis.Visible = True
            lblCorridos.Visible = True
        End If
        
        If upKPI.Visible = True Then
            upKPI.Visible = False
            ibKPI.ImageUrl = "~/imagens/seta_exibe_b2.gif"
        Else
            upQuebra.Visible = False
            upFormato.Visible = False
            upGerados.Visible = False
            upOutros.Visible = False
            upKPI.Visible = True
            ibFormato.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibGerados.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibOutros.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibKPI.ImageUrl = "~/imagens/seta_exibe_a2.gif"
            btnKPI.Focus()
        End If
        Return True
    End Function
    
    Function ExibeOutrosGraficos() As Boolean
        If upOutros.Visible = True Then
            upOutros.Visible = False
            ibOutros.ImageUrl = "~/imagens/seta_exibe_b2.gif"
        Else
            upQuebra.Visible = False
            upFormato.Visible = False
            upGerados.Visible = False
            upKPI.Visible = False
            upOutros.Visible = True
            ibFormato.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibGerados.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibKPI.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibOutros.ImageUrl = "~/imagens/seta_exibe_a2.gif"
            btnOutros.Focus()
        End If
        Return True
    End Function

    Function ExibeFormato() As Boolean        
        If upFormato.Visible = True Then
            upFormato.Visible = False
            ibFormato.ImageUrl = "~/imagens/seta_exibe_b2.gif"
        Else
            upKPI.Visible = False
            upQuebra.Visible = False
            upGerados.Visible = False
            upOutros.Visible = False
            upFormato.Visible = True
            ibKPI.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibGerados.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibOutros.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibFormato.ImageUrl = "~/imagens/seta_exibe_a2.gif"
        End If
        Return True
    End Function
    
    Function ExibeQuebra() As Boolean        
        If upQuebra.Visible = True Then
            upQuebra.Visible = False
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_b2.gif"
        Else
            upKPI.Visible = False
            upFormato.Visible = False
            upGerados.Visible = False
            upOutros.Visible = False
            upQuebra.Visible = True
            ibKPI.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibFormato.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibGerados.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibOutros.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_a2.gif"
        End If
        Return True
    End Function
    
    Function ExibeGerados() As Boolean        
        If upGerados.Visible = True Then
            upGerados.Visible = False
            ibGerados.ImageUrl = "~/imagens/seta_exibe_b2.gif"
        Else
            upGerados.Page.DataBind()
            upKPI.Visible = False
            upFormato.Visible = False
            upQuebra.Visible = False
            upOutros.Visible = False
            upGerados.Visible = True
            ibKPI.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibQuebra.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibFormato.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibOutros.ImageUrl = "~/imagens/seta_exibe_b2.gif"
            ibGerados.ImageUrl = "~/imagens/seta_exibe_a2.gif"
        End If
        Return True
    End Function

    Sub FechaProcessos(ByVal sender As Object, ByVal e As System.EventArgs)
        CarregaResultado(sender, e)
    End Sub
    
    Sub FechaCompartilhar(ByVal sender As Object, ByVal e As System.EventArgs)
        CarregaResultado(sender, e)
    End Sub
    
    Sub CarregaResultado(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim SqlMeses, SqlMeses_select, SqlMeses_from, in_decimal_aux, in_decimal_aux2, in_decimal_aux3 As String
        Dim I, valor As Integer
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader

        If cbDecimal.Checked Then
            in_decimal_aux = "CONVERT(DECIMAL(28,1), ROUND(CONVERT(DECIMAL(28,2),"
            in_decimal_aux2 = ", 1))"
            in_decimal_aux3 = ")"
        Else
            in_decimal_aux = "CONVERT(DECIMAL(28,0), ROUND(CONVERT(DECIMAL(28,0),"
            in_decimal_aux2 = ", 1))"
            in_decimal_aux3 = ")"
        End If
        
        Select Case rdAgrupar.SelectedValue
            Case "1" 'MES                
                SqlAux = " SELECT MES_SELECIONADO, ANO_SELECIONADO, CONTADOR " & _
                " FROM (SELECT MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO DESC, MES_SELECIONADO DESC) AS CONTADOR, DT_GERADO " & _
                " FROM TMBF_SELECIONADO (NOLOCK) " & _
                " WHERE CD_MBF = " & Session("codigo") & " " & _
                " AND CD_USUARIO = '" & Session("usuario") & "' " & _
                " AND IN_GERADO = 1) AS TABELA " & _
                " WHERE CONTADOR = " & vlContador.Value & " "
                CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader

                SqlMeses_select = ""
                SqlMeses_from = ""
                I = 0
                If RsAux.HasRows Then
                    pnlResultadoInfo.Attributes.Add("style", "float:left;")
                    SqlMeses = " SELECT M.NM_COMPLETO, "
                    I = I + 1
                    RsAux.Read()
                    If Not cbGraficoUteisCorridos.Checked Then
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                              "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                              " WHERE R.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                              "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                              "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                              "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                             " " & in_decimal_aux & "SUM(M" & I & "1.DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                             "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                             " WHERE R1.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                             "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                             "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                             "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                             "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                             " '" & RsAux("MES_SELECIONADO") & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                              " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                              " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                              " WHERE R2.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                                                                                              "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                              "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                              "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                              "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
               
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".NR_PROCESSO " & _
                                              " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                              " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                              "   AND M" & I & ".MES_RESULTADO = " & RsAux("MES_SELECIONADO") & "" & _
                                              "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                              "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                              "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & "1.NM_COMPLETO, M" & I & "1.DIAS_KPI, M" & I & "1.NR_PROCESSO " & _
                                              " FROM TMBF_RESULTADO M" & I & "1 (NOLOCK) " & _
                                              " WHERE M" & I & "1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                              "   AND M" & I & "1.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & "" & _
                                              "   AND M" & I & "1.CD_MBF = " & Session("codigo") & "" & _
                                              "   AND M" & I & "1.IN_SELECIONADO = '1'" & _
                                              "   AND M" & I & "1.CD_USUARIO = '" & Session("usuario") & "') M" & I & "1 ON  M" & I & "1.NM_COMPLETO = M.NM_COMPLETO " & _
                                              "                                  AND M" & I & "1.NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                              " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                              " AND M.TP_KPI <> '3' " & _
                                              " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                              " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    Else
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                              "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                              " WHERE R.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                              "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                              "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                              "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                             " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI_CORRIDOS) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                             "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                             " WHERE R1.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                             "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                             "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                             "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                             "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                             " '" & RsAux("MES_SELECIONADO") & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                              " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                              " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                              " WHERE R2.MES_RESULTADO = " & RsAux("MES_SELECIONADO") & " " & _
                                                                                                              "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                              "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                              "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                              "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
               
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".DIAS_KPI_CORRIDOS, M" & I & ".NR_PROCESSO " & _
                                              " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                              " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                              "   AND M" & I & ".MES_RESULTADO = " & RsAux("MES_SELECIONADO") & "" & _
                                              "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                              "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                              "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                              " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                              " AND M.TP_KPI <> '3' " & _
                                              " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                              " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    End If
                        
                    'Response.Write(SqlMeses)
                    'Response.End()
                    SqlResultadoKPI.SelectCommand = SqlMeses
                    grdResultado.DataBind()
                Else
                    If vlContador.Value > 1 Then
                        valor = vlContador.Value - 1
                        If cdAgrupamento.Value = 1 Then
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
                        End If
                        vlContador.Value = valor
                    Else
                        pnlResultado.Visible = False
                        pnlResultadoAntesAux.Visible = False
                        pnlResultadoTotalCabec.Visible = False
                        pnlResultadoTotal.Attributes.Add("style", "border-top-width:1px;")
                        pnlResultadoTotal.Height = 52
                        pnlResultadoInfo.Height = 50
                        grdResultadoInfo.Height = 50
                        grdResultadoInfo.Width = 628
                    End If
                End If
            Case "2" 'TRIMESTRE  
                    Dim meses_trimestre As String
                    Dim contador As Integer
                
                SqlAux = " SELECT COUNT(DISTINCT ANO_RESULTADO) AS CONTADOR FROM TMBF_RESULTADO (NOLOCK) " & _
                     " WHERE CD_MBF = " & Request("codigo") & " " & _
                     " AND CD_USUARIO = '" & Session("usuario") & "'"
                    CnnAux = New SqlConnection(Cnn)
                    CmdAux = New SqlCommand(SqlAux, CnnAux)
                    CnnAux.Open()
                    RsAux = CmdAux.ExecuteReader
        
                    contador = 1
                    If RsAux.HasRows Then
                        RsAux.Read()
                        contador = RsAux("CONTADOR")
                    End If
                    RsAux.Close()
                    CmdAux.Dispose()
                    CnnAux.Close()
                
                SqlAux = "SELECT MES_SELECIONADO, ANO_SELECIONADO, CONTADOR " & _
                 "FROM" & _
                " (SELECT DISTINCT T.MES_SELECIONADO AS MES_SELECIONADO, ANO_SELECIONADO, T.TRIMESTRE_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO, CODIGO) AS CONTADOR" & _
                " FROM TMBF_SELECIONADO (NOLOCK), (SELECT 1 CODIGO, '1,2,3' AS MES_SELECIONADO, 'Jan/Mar' AS TRIMESTRE_SELECIONADO UNION SELECT 2 CODIGO, '4,5,6' AS MES_SELECIONADO, 'Abr/Jun' AS TRIMESTRE_SELECIONADO UNION SELECT 3 CODIGO, '7,8,9' AS MES_SELECIONADO, 'Jul/Set' AS TRIMESTRE_SELECIONADO UNION SELECT 4 CODIGO, '10,11,12' AS MES_SELECIONADO, 'Out/Dez' AS TRIMESTRE_SELECIONADO) AS T" & _
                " WHERE CD_MBF = " & Request("codigo") & "" & _
                " AND CD_USUARIO = '" & Session("usuario") & "'" & _
                " AND IN_GERADO = 1) TABELA" & _
                " WHERE CONTADOR = " & vlContador.Value & ""
                
                    CnnAux = New SqlConnection(Cnn)
                    CmdAux = New SqlCommand(SqlAux, CnnAux)
                    CnnAux.Open()
                    RsAux = CmdAux.ExecuteReader
                    SqlMeses_select = ""
                    SqlMeses_from = ""
                    I = 0
                    If RsAux.HasRows Then
                        pnlResultadoInfo.Attributes.Add("style", "float:left;")
                        SqlMeses = " SELECT M.NM_COMPLETO, "
                        I = I + 1
                        RsAux.Read()
                    meses_trimestre = RsAux("MES_SELECIONADO")
                    If Not cbGraficoUteisCorridos.Checked Then
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & "1.DIAS_KPI)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & meses_trimestre & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                                                                                "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".NR_PROCESSO " & _
                                                    " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                    " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                    "   AND M" & I & ".MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                            "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                            "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                            "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & "1.NM_COMPLETO, M" & I & "1.DIAS_KPI, M" & I & "1.NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & "1 (NOLOCK) " & _
                                                " WHERE M" & I & "1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & "1.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                "   AND M" & I & "1.CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & "1.IN_SELECIONADO = '1'" & _
                                                "   AND M" & I & "1.CD_USUARIO = '" & Session("usuario") & "') M" & I & "1 ON  M" & I & "1.NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & "1.NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                          " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                          " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                          " AND M.TP_KPI <> '3' " & _
                                          " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                          " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    Else
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI_CORRIDOS)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & meses_trimestre & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                                                                                                "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".DIAS_KPI_CORRIDOS, M" & I & ".NR_PROCESSO " & _
                                                    " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                    " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                    "   AND M" & I & ".MES_RESULTADO IN (" & meses_trimestre & ") " & _
                                            "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                            "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                            "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                          " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                          " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                          " AND M.TP_KPI <> '3' " & _
                                          " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                          " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    End If
                    'Response.Write(SqlMeses)
                    'Response.End()
                    SqlResultadoKPI.SelectCommand = SqlMeses
                    grdResultado.DataBind()
                Else
                    If vlContador.Value > 1 Then
                        If cdAgrupamento.Value = 2 Then
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
                        End If
                        vlContador.Value = 4 + (4 * (contador - 1))
                    Else
                        pnlResultado.Visible = False
                        pnlResultadoAntesAux.Visible = False
                        pnlResultadoTotalCabec.Visible = False
                        pnlResultadoTotal.Height = 52
                        pnlResultadoInfo.Height = 50
                        grdResultadoInfo.Height = 50
                        grdResultadoInfo.Width = 628
                    End If
                End If
            Case "3" 'SEMESTRE
                    Dim meses_semestre As String
                    Dim contador As Integer
                SqlAux = " SELECT COUNT(DISTINCT ANO_RESULTADO) AS CONTADOR FROM TMBF_RESULTADO (NOLOCK)" & _
                     " WHERE CD_MBF = " & Request("codigo") & " " & _
                     " AND CD_USUARIO = '" & Session("usuario") & "'"
                    CnnAux = New SqlConnection(Cnn)
                    CmdAux = New SqlCommand(SqlAux, CnnAux)
                    CnnAux.Open()
                    RsAux = CmdAux.ExecuteReader
        
                    contador = 1
                    If RsAux.HasRows Then
                        RsAux.Read()
                        contador = RsAux("CONTADOR")
                    End If
                    RsAux.Close()
                    CmdAux.Dispose()
                    CnnAux.Close()
                
                SqlAux = "SELECT MES_SELECIONADO, ANO_SELECIONADO, CONTADOR" & _
                " FROM" & _
                " (SELECT DISTINCT T.MES_SELECIONADO AS MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO, T.MES_SELECIONADO) AS CONTADOR" & _
                " FROM TMBF_SELECIONADO (NOLOCK), (SELECT '1,2,3,4,5,6' AS MES_SELECIONADO UNION SELECT '7,8,9,10,11,12' AS MES_SELECIONADO) AS T" & _
                " WHERE CD_MBF = " & Session("codigo") & "" & _
                " AND CD_USUARIO = '" & Session("usuario") & "'" & _
                " AND IN_GERADO = 1) TABELA" & _
                " WHERE CONTADOR = " & vlContador.Value & " "

                    CnnAux = New SqlConnection(Cnn)
                    CmdAux = New SqlCommand(SqlAux, CnnAux)
                    CnnAux.Open()
                    RsAux = CmdAux.ExecuteReader
                    SqlMeses_select = ""
                    SqlMeses_from = ""
                    I = 0
                    If RsAux.HasRows Then
                        pnlResultadoInfo.Attributes.Add("style", "float:left;")
                        SqlMeses = " SELECT M.NM_COMPLETO, "
                        I = I + 1
                        RsAux.Read()
                    meses_semestre = RsAux("MES_SELECIONADO")
                    If Not cbGraficoUteisCorridos.Checked Then
                        SqlMeses_select = SqlMeses_select & "" & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & "1.DIAS_KPI)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & meses_semestre & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                                                                                "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
                        
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & ".MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & "1.NM_COMPLETO, M" & I & "1.DIAS_KPI, M" & I & "1.NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & "1 (NOLOCK) " & _
                                                " WHERE M" & I & "1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & "1.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND M" & I & "1.CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & "1.IN_SELECIONADO = '1'" & _
                                                "   AND M" & I & "1.CD_USUARIO = '" & Session("usuario") & "') M" & I & "1 ON  M" & I & "1.NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & "1.NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                                " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                                " AND M.TP_KPI <> '3' " & _
                                                " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                                " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    Else
                        SqlMeses_select = SqlMeses_select & "" & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI) " & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI_CORRIDOS)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & meses_semestre & "' AS MES_SELECIONADO_" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                                                                                "  AND R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
                        
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".DIAS_KPI_CORRIDOS, M" & I & ".NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & ".MES_RESULTADO IN (" & meses_semestre & ") " & _
                                                "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                                " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                                " AND M.TP_KPI <> '3' " & _
                                                " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                                " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    End If
                    'Response.Write(SqlMeses)
                    'Response.End()
                    SqlResultadoKPI.SelectCommand = SqlMeses
                    grdResultado.DataBind()
                Else
                    If vlContador.Value > 1 Then
                        If cdAgrupamento.Value = 3 Then
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
                        End If
                        vlContador.Value = 2 + (2 * (contador - 1))
                    Else
                        pnlResultado.Visible = False
                        pnlResultadoAntesAux.Visible = False
                        pnlResultadoTotalCabec.Visible = False
                        pnlResultadoTotal.Height = 52
                        pnlResultadoInfo.Height = 50
                        grdResultadoInfo.Height = 50
                        grdResultadoInfo.Width = 628
                    End If
                End If
            Case "0" 'ANO
                SqlAux = " SELECT '' AS MES_SELECIONADO, ANO_SELECIONADO, '' TRIMESTRE_SELECIONADO, '' SEMESTRE_SELECIONADO, CONTADOR " & _
                    " FROM (SELECT DISTINCT '' MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO DESC) AS CONTADOR, '' DT_GERADO " & _
                    " FROM TMBF_SELECIONADO (NOLOCK) " & _
                    " WHERE CD_MBF = " & Request("codigo") & " " & _
                    " AND CD_USUARIO = '" & Session("usuario") & "' " & _
                    " AND IN_GERADO = 1) AS TABELA " & _
                    " WHERE CONTADOR = " & vlContador.Value & " "
                    CnnAux = New SqlConnection(Cnn)
                    CmdAux = New SqlCommand(SqlAux, CnnAux)
                    CnnAux.Open()
                    RsAux = CmdAux.ExecuteReader
        
                    SqlMeses_select = ""
                    SqlMeses_from = ""
                    I = 0
                    If RsAux.HasRows Then
                        pnlResultadoInfo.Attributes.Add("style", "float:left;")
                        SqlMeses = " SELECT M.NM_COMPLETO, "
                        I = I + 1
                    RsAux.Read()
                    If Not cbGraficoUteisCorridos.Checked Then
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & "1.DIAS_KPI)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
               
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & "1.NM_COMPLETO, M" & I & "1.DIAS_KPI, M" & I & "1.NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & "1 (NOLOCK) " & _
                                                " WHERE M" & I & "1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & "1.CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & "1.IN_SELECIONADO = '1'" & _
                                                "   AND M" & I & "1.CD_USUARIO = '" & Session("usuario") & "') M" & I & "1 ON  M" & I & "1.NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & "1.NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                              " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                              " AND M.TP_KPI <> '3' " & _
                                              " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                              " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    Else
                        SqlMeses_select = SqlMeses_select & " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R (NOLOCK) " & _
                                                " WHERE R.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Sim' , " & _
                                                " " & in_decimal_aux & "SUM(M" & I & ".DIAS_KPI_CORRIDOS)" & in_decimal_aux3 & "/(SELECT COUNT(NR_PROCESSO) " & _
                                                "   FROM TMBF_RESULTADO R1 (NOLOCK) " & _
                                                " WHERE R1.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                "   AND R1.CD_MBF = " & Session("codigo") & " " & _
                                                "   AND R1.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                "   AND R1.NM_COMPLETO = M.NM_COMPLETO) " & in_decimal_aux2 & " 'Não' , " & _
                                                " '" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO" & I & ",'" & RsAux("ANO_SELECIONADO") & "' AS ANO_SELECIONADO_" & I & ", " & _
                                                                                                                " (SELECT TOP 1 R2.NR_PROCESSO " & _
                                                                                                                " FROM TMBF_RESULTADO R2 (NOLOCK) " & _
                                                                                                                " WHERE R2.ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & " " & _
                                                                                                                "  AND R2.CD_MBF = " & Session("codigo") & " " & _
                                                                                                                "  AND R2.CD_USUARIO = '" & Session("usuario") & "'" & _
                                                                                                                "  AND R2.NM_COMPLETO = M.NM_COMPLETO) AS NR_PROCESSO_SELECIONADO_" & I & " , "
               
                        SqlMeses_from = SqlMeses_from & " LEFT JOIN (SELECT M" & I & ".NM_COMPLETO, M" & I & ".DIAS_KPI, M" & I & ".DIAS_KPI_CORRIDOS, M" & I & ".NR_PROCESSO " & _
                                                " FROM TMBF_RESULTADO M" & I & " (NOLOCK) " & _
                                                " WHERE M" & I & ".ANO_RESULTADO = " & RsAux("ANO_SELECIONADO") & "" & _
                                                "   AND M" & I & ".CD_MBF = " & Session("codigo") & "" & _
                                                "   AND M" & I & ".CD_USUARIO = '" & Session("usuario") & "') M" & I & " ON  M" & I & ".NM_COMPLETO = M.NM_COMPLETO " & _
                                                "                                  AND M" & I & ".NR_PROCESSO = M.NR_PROCESSO "
                        SqlMeses_select = SqlMeses_select & " M.CD_KPI, M.CD_TP_KPI, M.ID_KPI "
                        SqlMeses = SqlMeses & SqlMeses_select & " FROM TMBF_RESULTADO M (NOLOCK) " & SqlMeses_from
                        SqlMeses = SqlMeses & " WHERE M.CD_MBF = " & Session("codigo") & "" & _
                                              " AND M.CD_USUARIO = '" & Session("usuario") & "'" & _
                                              " AND M.NR_PROCESSO <> '9999XX-9999-99'" & _
                                              " AND M.TP_KPI <> '3' " & _
                                              " GROUP BY M.NM_COMPLETO, M.NM_KPI, M.CD_KPI, M.CD_TP_KPI, M.ID_KPI, M.NM_QUEBRAS" & _
                                              " ORDER BY M.ID_KPI, M.NM_COMPLETO "
                    End If
                    'Response.Write(SqlMeses)
                    'Response.End()
                    SqlResultadoKPI.SelectCommand = SqlMeses
                    grdResultado.DataBind()
                Else
                    If vlContador.Value > 1 Then
                        valor = vlContador.Value - 1
                        If cdAgrupamento.Value = 0 Then
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
                        End If
                        vlContador.Value = valor
                    Else
                        pnlResultado.Visible = False
                        pnlResultadoAntesAux.Visible = False
                        pnlResultadoTotalCabec.Visible = False
                        pnlResultadoTotal.Height = 52
                        pnlResultadoInfo.Height = 50
                        grdResultadoInfo.Height = 50
                        grdResultadoInfo.Width = 628
                    End If
                End If
        End Select
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub
    
    Protected Sub AlteraResultado(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Dim txtNrMeta As Label
        Dim I As Integer
        Dim largura As Integer
        Dim mes_selecionado, cor1, cor2, dias_kpi As String
        
        I = 1
        largura = 0
        mes_selecionado = ""
             
        Do While I < e.Row.Cells.Count - 1
            If e.Row.RowType = DataControlRowType.DataRow Then
                If IsNumeric(e.Row.Cells(I).Text) Then
                    txtNrMeta = grdResultadoInfo.Rows(e.Row.RowIndex).Cells(0).FindControl("txtNrMeta")
                    dias_kpi = e.Row.Cells(I).Text
                    
                    If dias_kpi = "" Then
                        dias_kpi = "0"
                    End If
                    
                    If txtNrMeta.Text <> "" Then
                        If CInt(dias_kpi) > CInt(txtNrMeta.Text) Then
                            cor1 = "#FF0000"
                        Else
                            cor1 = "#0000FF"
                        End If
                    Else
                        cor1 = "#0000FF"
                    End If
                    
                    If txtNrMeta.Text <> "" Then
                        If CInt(dias_kpi) > CInt(txtNrMeta.Text) Then
                            cor2 = "#FF0000"
                        Else
                            cor2 = "#0000FF"
                        End If
                    Else
                        cor2 = "#0000FF"
                    End If
                    
                    If Not cbDesvios.Checked And Not cbGraficoUteisCorridos.Checked Then
                        largura = largura + 100
                        e.Row.Cells(I).Width = 100
                    Else
                        largura = largura + 50
                        e.Row.Cells(I).Width = 50
                    End If
                    
                    e.Row.Cells(I).HorizontalAlign = HorizontalAlign.Center
                    e.Row.Cells(I + 1).HorizontalAlign = HorizontalAlign.Center
                    If Not cbDesvios.Checked And Not cbGraficoUteisCorridos.Checked Then
                        e.Row.Cells(I).Text = "<a href=""javascript:ExibeProcessos('" & e.Row.Cells(I + 2).Text & "','" & Trim(e.Row.Cells(I + 3).Text) & "','" & Trim(e.Row.Cells(I + 4).Text) & "', '" & Trim(e.Row.Cells(I + 5).Text) & "' ,'" & rdAgrupar.SelectedValue & "', '" & Trim(e.Row.Cells(I + 6).Text) & "', '" & Trim(e.Row.Cells(I + 7).Text) & "','0');"" style=""text-decoration:none;color:" + cor1 + ";"">" + e.Row.Cells(I).Text + "</a>"
                    Else
                        If cbGraficoUteisCorridos.Checked Then
                            e.Row.Cells(I).Text = "<a href=""javascript:ExibeProcessos('" & e.Row.Cells(I + 2).Text & "','" & Trim(e.Row.Cells(I + 3).Text) & "','" & Trim(e.Row.Cells(I + 4).Text) & "', '" & Trim(e.Row.Cells(I + 5).Text) & "' ,'" & rdAgrupar.SelectedValue & "', '" & Trim(e.Row.Cells(I + 6).Text) & "', '" & Trim(e.Row.Cells(I + 7).Text) & "','0');"" style=""text-decoration:none;color:" + cor1 + ";"">" + e.Row.Cells(I).Text + "</a>"
                            e.Row.Cells(I + 1).Text = "<a href=""javascript:ExibeProcessos('" & e.Row.Cells(I + 2).Text & "','" & Trim(e.Row.Cells(I + 3).Text) & "','" & Trim(e.Row.Cells(I + 4).Text) & "', '" & Trim(e.Row.Cells(I + 5).Text) & "' ,'" & rdAgrupar.SelectedValue & "', '" & Trim(e.Row.Cells(I + 6).Text) & "', '" & Trim(e.Row.Cells(I + 7).Text) & "','2');"" style=""text-decoration:none;color:" + cor2 + ";"">" + e.Row.Cells(I + 1).Text + "</a>"
                        Else
                            e.Row.Cells(I).Text = "<a href=""javascript:ExibeProcessos('" & e.Row.Cells(I + 2).Text & "','" & Trim(e.Row.Cells(I + 3).Text) & "','" & Trim(e.Row.Cells(I + 4).Text) & "', '" & Trim(e.Row.Cells(I + 5).Text) & "' ,'" & rdAgrupar.SelectedValue & "', '" & Trim(e.Row.Cells(I + 6).Text) & "', '" & Trim(e.Row.Cells(I + 7).Text) & "','1');"" style=""text-decoration:none;color:" + cor1 + ";"">" + e.Row.Cells(I).Text + "</a>"
                            e.Row.Cells(I + 1).Text = "<a href=""javascript:ExibeProcessos('" & e.Row.Cells(I + 2).Text & "','" & Trim(e.Row.Cells(I + 3).Text) & "','" & Trim(e.Row.Cells(I + 4).Text) & "', '" & Trim(e.Row.Cells(I + 5).Text) & "' ,'" & rdAgrupar.SelectedValue & "', '" & Trim(e.Row.Cells(I + 6).Text) & "', '" & Trim(e.Row.Cells(I + 7).Text) & "','1');"" style=""text-decoration:none;color:" + cor2 + ";"">" + e.Row.Cells(I + 1).Text + "</a>"
                        End If
                    End If
                End If
                End If
                If Not cbDesvios.Checked And Not cbGraficoUteisCorridos.Checked Then
                    e.Row.Cells(I + 1).Visible = False
                End If
                e.Row.Cells(I + 2).Visible = False
                e.Row.Cells(I + 3).Visible = False
                e.Row.Cells(I + 4).Visible = False
                e.Row.Cells(I + 5).Visible = False
                e.Row.Cells(I + 6).Visible = False
                e.Row.Cells(I + 7).Visible = False
                I = I + 8
        Loop
        If largura > 130 Then
            grdResultado.Width = largura
        End If
        e.Row.Cells(0).Visible = False
        e.Row.Cells(e.Row.Cells.Count - 1).Visible = False
    End Sub

    Protected Sub grdResultado_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Dim J, I As Integer
        Dim meses_selecionados_array, anos_selecionados_array, semestres_selecionados_array, trimestres_selecionados_array As Array
        Dim meses_selecionados, anos_selecionados, semestres_selecionados, trimestres_selecionados, txt_cabec As String
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        
        Select rdAgrupar.SelectedValue
            Case "1" 'MES
                SqlAux = " SELECT MASTER.DBO.FN_MONTHNAME_2(MES_SELECIONADO) AS MES_SELECIONADO, ANO_SELECIONADO, '' TRIMESTRE_SELECIONADO, '' SEMESTRE_SELECIONADO, CONTADOR " & _
                " FROM (SELECT MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO DESC, MES_SELECIONADO DESC) AS CONTADOR, DT_GERADO " & _
                " FROM TMBF_SELECIONADO (NOLOCK) " & _
                " WHERE CD_MBF = " & Request("codigo") & " " & _
                " AND CD_USUARIO = '" & Request("usuario") & "' " & _
                " AND IN_GERADO = 1) AS TABELA " & _
                " WHERE CONTADOR = " & vlContador.Value & " "
            Case "2"
                SqlAux = "SELECT MES_SELECIONADO, ANO_SELECIONADO, TRIMESTRE_SELECIONADO, '' SEMESTRE_SELECIONADO, CONTADOR " & _
                 "FROM" & _
                " (SELECT DISTINCT T.MES_SELECIONADO AS MES_SELECIONADO, ANO_SELECIONADO, T.TRIMESTRE_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO, CODIGO) AS CONTADOR" & _
                " FROM TMBF_SELECIONADO (NOLOCK), (SELECT 1 CODIGO, '1,2,3' AS MES_SELECIONADO, 'Jan/Mar' AS TRIMESTRE_SELECIONADO UNION SELECT 2 CODIGO, '4,5,6' AS MES_SELECIONADO, 'Abr/Jun' AS TRIMESTRE_SELECIONADO UNION SELECT 3 CODIGO, '7,8,9' AS MES_SELECIONADO, 'Jul/Set' AS TRIMESTRE_SELECIONADO UNION SELECT 4 CODIGO, '10,11,12' AS MES_SELECIONADO, 'Out/Dez' AS TRIMESTRE_SELECIONADO) AS T" & _
                " WHERE CD_MBF = " & Request("codigo") & "" & _
                " AND CD_USUARIO = '" & Request("usuario") & "'" & _
                " AND IN_GERADO = 1) TABELA" & _
                " WHERE CONTADOR = " & vlContador.Value & ""
            Case "3"
                SqlAux = "SELECT MES_SELECIONADO, ANO_SELECIONADO, '' TRIMESTRE_SELECIONADO, SEMESTRE_SELECIONADO, CONTADOR " & _
                 "FROM" & _
                " (SELECT DISTINCT T.MES_SELECIONADO AS MES_SELECIONADO, ANO_SELECIONADO, T.SEMESTRE_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO, T.MES_SELECIONADO) AS CONTADOR" & _
                " FROM TMBF_SELECIONADO (NOLOCK), (SELECT '1,2,3,4,5,6' AS MES_SELECIONADO, 'Jan/Jun' AS SEMESTRE_SELECIONADO UNION SELECT '7,8,9,10,11,12' AS MES_SELECIONADO, 'Jul/Dez' AS SEMESTRE_SELECIONADO) AS T" & _
                " WHERE CD_MBF = " & Request("codigo") & "" & _
                " AND CD_USUARIO = '" & Request("usuario") & "'" & _
                " AND IN_GERADO = 1) TABELA" & _
                " WHERE CONTADOR = " & vlContador.Value & ""
            Case "0"
                SqlAux = " SELECT '' AS MES_SELECIONADO, ANO_SELECIONADO, '' TRIMESTRE_SELECIONADO, '' SEMESTRE_SELECIONADO, CONTADOR " & _
                " FROM (SELECT DISTINCT '' MES_SELECIONADO, ANO_SELECIONADO, DENSE_RANK() OVER (ORDER BY ANO_SELECIONADO DESC) AS CONTADOR, '' DT_GERADO " & _
                " FROM TMBF_SELECIONADO (NOLOCK) " & _
                " WHERE CD_MBF = " & Request("codigo") & " " & _
                " AND CD_USUARIO = '" & Request("usuario") & "' " & _
                " AND IN_GERADO = 1) AS TABELA " & _
                " WHERE CONTADOR = " & vlContador.Value & " "
        End Select
        
        'Response.Write(SqlAux)
        'Response.End()
        
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        I = 0
        
        If RsAux.HasRows Then
            meses_selecionados = ""
            anos_selecionados = ""
            semestres_selecionados = ""
            trimestres_selecionados = ""
        
            Do While RsAux.Read()
                meses_selecionados = meses_selecionados & RsAux("MES_SELECIONADO") & " (" & RsAux("ANO_SELECIONADO") & ")" & ";"
                anos_selecionados = anos_selecionados & RsAux("ANO_SELECIONADO") & ";"
                semestres_selecionados = semestres_selecionados & RsAux("SEMESTRE_SELECIONADO") & " (" & RsAux("ANO_SELECIONADO") & ")" & ";"
                trimestres_selecionados = trimestres_selecionados & RsAux("TRIMESTRE_SELECIONADO") & " (" & RsAux("ANO_SELECIONADO") & ")" & ";"
            Loop
      
            meses_selecionados_array = Split(Left(meses_selecionados, Len(meses_selecionados) - 1), ";")
            anos_selecionados_array = Split(Left(anos_selecionados, Len(anos_selecionados) - 1), ";")
            semestres_selecionados_array = Split(Left(semestres_selecionados, Len(semestres_selecionados) - 1), ";")
            trimestres_selecionados_array = Split(Left(trimestres_selecionados, Len(trimestres_selecionados) - 1), ";")
                  
            I = 0
            J = 1
            txt_cabec = ""
            If e.Row.RowType = DataControlRowType.Header Then
                Do While J < e.Row.Cells.Count - 1
                    If e.Row.RowType = DataControlRowType.Header Then
                        Select Case rdAgrupar.SelectedValue
                            Case "1"
                                txt_cabec = meses_selecionados_array(I)
                            Case "2"
                                txt_cabec = trimestres_selecionados_array(I)
                            Case "3"
                                txt_cabec = semestres_selecionados_array(I)
                            Case "0"
                                txt_cabec = anos_selecionados_array(I)
                        End Select
                        J = J + 8
                        I = I + 1
                    End If
                Loop
                If Not cbDesvios.Checked And Not cbGraficoUteisCorridos.Checked Then
                    ltlResultadoCabec.Text = txt_cabec + "<br><label style='width:50px;text-align:center;' >Tudo</label>"
                Else
                    If cbGraficoUteisCorridos.Checked Then
                        ltlResultadoCabec.Text = txt_cabec + "<br><label style='width:50px;text-align:center;' >Úteis</label><label style='width:50px;text-align:center;'>Corridos</label>"
                    Else
                        ltlResultadoCabec.Text = txt_cabec + "<br><label style='width:50px;text-align:center;' >Tudo</label><label style='width:50px;text-align:center;'>Filtrado</label>"
                    End If
                End If
            End If
        End If
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
    End Sub

    Protected Sub AlteraAgrupamento(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim contador As Integer
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        SqlAux = " SELECT COUNT(DISTINCT ANO_RESULTADO) AS CONTADOR FROM TMBF_RESULTADO (NOLOCK) " & _
                 " WHERE CD_MBF = " & Request("codigo") & " " & _
                 " AND CD_USUARIO = '" & Request("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        
        contador = 1
        If RsAux.HasRows Then
            RsAux.Read()
            contador = RsAux("CONTADOR")
        End If
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
        
        SqlAux = " UPDATE TMBF_INFO SET TP_AGRUPAMENTO = '" & rdAgrupar.SelectedValue & "'" & _
                 " WHERE CD_MBF = " & Request("codigo") & " " & _
                 " AND CD_USUARIO = '" & Session("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CmdAux.Dispose()
        CnnAux.Close()
                
        Select Case rdAgrupar.SelectedValue
            Case "1"
                vlContador.Value = 1
                cdAgrupamento.Value = 1                
                CarregaResultado(sender, e)                
            Case "2"
                Dim mes As Integer
                mes = Month(Now)
                cdAgrupamento.Value = 2
                If mes > 6 Then
                    If mes > 9 Then
                        vlContador.Value = 4 + (4 * (contador - 1))
                    Else
                        vlContador.Value = 3 + (4 * (contador - 1))
                    End If
                Else
                    If mes > 3 Then
                        vlContador.Value = 2 + (4 * (contador - 1))
                    Else
                        vlContador.Value = 1 + (4 * (contador - 1))
                    End If
                End If                
                CarregaResultado(sender, e)
            Case "3"
                Dim mes As Integer
                mes = Month(Now)
                cdAgrupamento.Value = 3
                If mes > 6 Then
                    vlContador.Value = 2 + (2 * (contador - 1))
                Else
                    vlContador.Value = 1 + (2 * (contador - 1))
                End If                
                CarregaResultado(sender, e)
            Case "0"
                vlContador.Value = 1
                cdAgrupamento.Value = 0                
                CarregaResultado(sender, e)
        End Select
    End Sub
    
    Protected Sub AlteraColunaMenos(ByVal sender As Object, ByVal e As System.EventArgs)
        Select Case rdAgrupar.SelectedValue
            Case "1"
                vlContador.Value = vlContador.Value + 1
            Case "2"
                vlContador.Value = vlContador.Value - 1
            Case "3"
                vlContador.Value = vlContador.Value - 1
            Case "0"
                vlContador.Value = vlContador.Value + 1
        End Select
        
        If vlContador.Value > 0 Then
            CarregaResultado(sender, e)
        Else
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
            vlContador.Value = 1
        End If
    End Sub
    
    Protected Sub AlteraColunaMais(ByVal sender As Object, ByVal e As System.EventArgs)
        Select Case rdAgrupar.SelectedValue
            Case "1"
                vlContador.Value = vlContador.Value - 1
            Case "2"
                vlContador.Value = vlContador.Value + 1
            Case "3"
                vlContador.Value = vlContador.Value + 1
            Case "0"
                vlContador.Value = vlContador.Value - 1
        End Select
                    
        If vlContador.Value > 0 Then
            CarregaResultado(sender, e)
        Else            
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "alert('ATENÇÃO: Sem resultados!')", True)
            vlContador.Value = 1
        End If
    End Sub
    
    Protected Sub ExcluiMBF(ByVal sender As Object, ByVal e As System.EventArgs)        
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_INFO WHERE CD_MBF = " & Request("codigo") & " " & _
                                          " AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Delete()
        
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_KPI WHERE CD_MBF = " & Request("codigo") & " " & _
                                          " AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Delete()
        
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_SELECIONADO WHERE CD_MBF = " & Request("codigo") & " " & _
                                          " AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Delete()
        
        SqlMBFPersonaliza.DeleteCommand = " DELETE FROM TMBF_RESULTADO WHERE CD_MBF = " & Request("codigo") & " " & _
                                          " AND CD_USUARIO = '" & Session("usuario") & "'"
        SqlMBFPersonaliza.Delete()
        
        Page.DataBind()
        Session("usuario") = ""
        Session("nm_usuario") = ""
        Session("cd_menu") = ""
        Response.Redirect("/default.asp")
    End Sub
    
    Protected Sub CarregaAgrupamento(ByVal sender As Object, ByVal e As System.EventArgs)
       
    End Sub
    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>MyIndaiá Web System - Version 3.00.00</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script>
<script language="javascript" src="/includes/script.js"></script>
<script language="JavaScript" type="text/javascript">
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

    function enviaValor(valor, tabela) {
        if (tabela == 'TEVENTO') {
            document.getElementById('frmMBFPersonaliza_txtCdEvento').value = valor;
            document.getElementById('frmMBFPersonaliza_txtCdEvento').focus();
            document.getElementById('frmMBFPersonaliza_txtCdEvento').blur();
        }
        FechaDetalhes('divInfoCorpo', 'divInfo');
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
                                    vCodigo.style.background = 'white';
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
            vInfo.style.left = (x2) + 54;
            vInfo.style.top = ((y4) / 2) - 20 + 118;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) + 54;
            vCorpo.style.top = ((y4) / 2) + 140;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";


            var ajax = openAjax();
            ajax.open('POST', arquivo + '.aspx?' + vFeatures + '&usuario=<%=Session("usuario") %>', true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/30/loading3.gif'></center></div>";
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

    function FechaDetalhes(vDiv1, vDiv2) {
        n = 0;
        if (document.getElementById) {
            var div = document.getElementById(vDiv1);
            var div2 = document.getElementById(vDiv2);
            div.style.display = "none";
            div2.style.display = "none";
        }
    }

    function FechaProcessos() {
        var divProcessosTitulo = document.getElementById("divProcessosTitulo")
        var divProcessos = document.getElementById("divProcessos")
        divProcessos.style.display = 'none';
        divProcessosTitulo.style.display = 'none';
        document.location = 'mbf_personaliza.aspx?usuario=<%=Session("usuario")%>&codigo=<%=Session("codigo")%>&cd_menu=<%=Session("cd_menu")%>';
    }

    function ExibeProcessos(mes, ano, nr_processo, cd_kpi, in_agrupar, cd_tp_kpi, id_kpi, in_desvios) {
        if (document.getElementById) {
            var usuario = '<%=Request.QueryString("usuario") %>'
            var cd_mbf = '<%=Request.QueryString("codigo") %>'
            var cd_produto = '<%=Request.QueryString("cd_menu") %>'

            var x = screen.width;
            var y = screen.height;
            var w = 550;
            var z = 270;

            var vCorpo = document.getElementById('divProcessos');
            var vTitulo = document.getElementById('divProcessosTitulo');
            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vTitulo.style.width = w;
            vTitulo.style.height = 16;
            vTitulo.style.left = (x2) - 320;
            vTitulo.style.top = ((y4) / 2) - 2 - 16 + 20;
            vTitulo.style.display = "block";
            vTitulo.style.filter = "alpha(opacity=95)";

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) - 320;
            vCorpo.style.top = ((y4) / 2) - 2 + 20;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open('POST', 'mbf_consulta.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario + '&mes=' + mes + '&ano=' + ano + '&nr_processo=' + nr_processo + '&cd_kpi=' + cd_kpi + '&in_agrupar=' + in_agrupar + '&produto=' + cd_produto + '&cd_tp_kpi=' + cd_tp_kpi + '&id_kpi=' + id_kpi + '&in_desvios=' + in_desvios, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
                }
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        if (vResult != 'ERRO') {
                            vCorpo.innerHTML = vResult;
                            var scripts = vCorpo.getElementsByTagName("script");
                            for (i = 0; i < scripts.length; i++) {
                                s = scripts[i].innerHTML;
                                eval(s);
                            }
                        } else {
                            FechaProcessos();
                        }
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function clickKPI(objeto) {
        var div_kpi = document.getElementById('divKpiSelecionado');
        var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
        var contador_kpi = document.getElementById('contador_kpi').value;
        var kpi_selecionado = document.getElementById('kpi_selecionado');
        var kpi_id_selecionado = document.getElementById('kpi_id_selecionado');
        var kpi_codigo_selecionado = document.getElementById('kpi_codigo_selecionado');
        var contador_total_kpi = document.getElementById('frmMBFPersonaliza_contador_total_kpi').value;
        var contador_total_kpi_aux = document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value;
        var codigo_kpi = eval("document.getElementById('kpi_codigo" + objeto.id + "').value");
        var inModal = document.getElementById('frmMBFPersonaliza_in_modal_aux').value;
        var inCNPJ = document.getElementById('frmMBFPersonaliza_in_cnpj_aux').value;
        var inArea = document.getElementById('frmMBFPersonaliza_in_area_aux').value;
        var inEstufagem = document.getElementById('frmMBFPersonaliza_in_estufagem_aux').value;
        var inLI = document.getElementById('frmMBFPersonaliza_in_li_aux').value;
        var inPaisOrigem = document.getElementById('frmMBFPersonaliza_in_pais_origem_aux').value;
        var inPrefixo = document.getElementById('frmMBFPersonaliza_in_prefixo_aux').value;
        var inTerminal = document.getElementById('frmMBFPersonaliza_in_terminal_aux').value;
        var inCanal = document.getElementById('frmMBFPersonaliza_in_canal_aux').value;
        var inServico = document.getElementById('frmMBFPersonaliza_in_servico_aux').value;
        var inLocalDes = document.getElementById('frmMBFPersonaliza_in_local_des_aux').value;
        var inUteisCorridos = document.getElementById('frmMBFPersonaliza_in_uteis_corridos_aux').value;

        if (objeto.checked) {
            contador_kpi++;
        } else {
            contador_kpi--;
            document.getElementById('kpi_selecionado').value = "";
            document.getElementById('kpi_id_selecionado').value = "";
            document.getElementById('kpi_codigo_selecionado').value = "";
        }

        document.getElementById('contador_kpi').value = contador_kpi;
        if (document.getElementById('contador_kpi').value < 2) {
            kpi_selecionado.value = objeto.value;
            kpi_id_selecionado.value = objeto.id;
            kpi_codigo_selecionado.value = codigo_kpi;
        }
        if (document.getElementById('contador_kpi').value == 2) {
            contador_total_kpi++;
            contador_total_kpi_aux++;
            document.getElementById('frmMBFPersonaliza_contador_total_kpi').value = contador_total_kpi;
            document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value = contador_total_kpi_aux;
            div_kpi_nao.style.display = 'none';
            div_kpi.style.display = 'block';

            //if (!eval("document.getElementById('flag_kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "')")) {                        
            var texto_kpi = "<div id='kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + contador_total_kpi + "'><input type='text' style='display:none' value='0' id='tipo_kpi" + contador_total_kpi + "'>&nbsp;&nbsp;";
            if (inUteisCorridos == "True") {
                texto_kpi = texto_kpi + "<input type='checkbox' id='tipo_kpi" + contador_total_kpi + "_tp1' onclick='alteraCheckKPI(this);' checked  style='display:none;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi" + contador_total_kpi + "_tp2' onclick='alteraCheckKPI(this);' style='display:none;'>";
                }else{
                  texto_kpi = texto_kpi + "<input type='checkbox' id='tipo_kpi" + contador_total_kpi + "_tp1' onclick='alteraCheckKPI(this);' checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi" + contador_total_kpi + "_tp2' onclick='alteraCheckKPI(this);'>";
              }

                texto_kpi = texto_kpi + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:retiraKpi(\"" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + contador_total_kpi + "\");'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;<input type='text' style='display:none' name='codigo_kpi" + contador_total_kpi + "' id='codigo_kpi" + contador_total_kpi + "' value='kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "'><input type='text' style='display:none' name='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + contador_total_kpi + "' id='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + contador_total_kpi +"' value='kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "' ><input type='text' style='display:none' name='texto_kpi" + contador_total_kpi + "' id='texto_kpi" + contador_total_kpi + "' value='" + Trim(document.getElementById('kpi_selecionado').value) + " x " + objeto.value + "' >" + document.getElementById('kpi_selecionado').value + " x " + Trim(objeto.value) + "<br><b>&nbsp;&nbsp;&nbsp;&nbsp;Quebras:</b>&nbsp;";
                if (inModal == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_modal_kpi" + contador_total_kpi + "' onclick=''>Modal&nbsp;" }
                if (inCNPJ == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_cnpj_kpi" + contador_total_kpi + "' onclick=''>CNPJ&nbsp;" }
                if (inArea == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_area_kpi" + contador_total_kpi + "' onclick=''>Área&nbsp;" }
                if (inEstufagem == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_estufagem_kpi" + contador_total_kpi + "' onclick=''>Estufagem&nbsp;" }
                if (inLI == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_li_kpi" + contador_total_kpi + "' onclick=''>Com/Sem LI&nbsp;" }
                if (inPaisOrigem == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_pais_origem_kpi" + contador_total_kpi + "' onclick=''>Pais de origem&nbsp;" }
                if (inPrefixo == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_prefixo_kpi" + contador_total_kpi + "' onclick=''>Prefixo&nbsp;" }
                if (inTerminal == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_terminal_kpi" + contador_total_kpi + "' onclick=''>Terminal&nbsp;" }
                if (inCanal == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_canal_kpi" + contador_total_kpi + "' onclick=''>Canal&nbsp;" }
                if (inServico == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_servico_kpi" + contador_total_kpi + "' onclick=''>Serviço&nbsp;" }
                if (inLocalDes == "True") { texto_kpi = texto_kpi + "<input type='checkbox' id='in_local_des_kpi" + contador_total_kpi + "' onclick=''>Local de desembarque&nbsp;" }
                texto_kpi = texto_kpi + "<br></div>";   
                div_kpi.innerHTML += texto_kpi;
            //} else {
            //    contador_total_kpi--;
            //    contador_total_kpi_aux--;
            //    document.getElementById('frmMBFPersonaliza_contador_total_kpi').value = contador_total_kpi;
            //    document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value = contador_total_kpi_aux;
            // }
            document.getElementById('kpi_selecionado').value = "";
            document.getElementById('kpi_id_selecionado').value = "";
            document.getElementById('kpi_codigo_selecionado').value = "";
            document.getElementById('contador_kpi').value = 0;
            var total_kpi = document.all.kpi.length;
            for (i = 0; i < total_kpi; i++) {
                if (document.all.kpi[i].checked) {
                    document.all.kpi[i].checked = false;
                }
            }
        }
    }

    function retiraKpi(kpi) {
        var texto = eval("document.all.flag_kpi" + kpi + ".value;");
        var div_kpi = document.getElementById('divKpiSelecionado');
        var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
        var linha_texto = eval("document.getElementById('kpi" + kpi + "');");

        var removido_texto = div_kpi.removeChild(linha_texto);
        var contador_total_kpi_aux = document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value;
        contador_total_kpi_aux--;
        document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value = contador_total_kpi_aux;

        if (document.getElementById('frmMBFPersonaliza_contador_total_kpi_aux').value == 0) {
            div_kpi.style.display = 'none';
            div_kpi_nao.style.display = 'block';
        }
    }

    function clickOutros(objeto) {
        var div_outros = document.getElementById('divOutrosSelecionado');
        var div_outros_nao = document.getElementById('divOutrosSelecionadoNao');
        var contador_outros = document.getElementById('contador_outros').value;
        var outros_selecionado = document.getElementById('outros_selecionado');
        var outros_id_selecionado = document.getElementById('outros_id_selecionado');
        var outros_codigo_selecionado = document.getElementById('outros_codigo_selecionado');
        var contador_total_outros = document.getElementById('frmMBFPersonaliza_contador_total_outros').value;
        var contador_total_outros_aux = document.getElementById('frmMBFPersonaliza_contador_total_outros_aux').value;
        var codigo_outros = eval("document.getElementById('outros_codigo" + objeto.id + "').value");
        
        var inModal = document.getElementById('frmMBFPersonaliza_in_modal_outros_aux').value;
        var inCNPJ = document.getElementById('frmMBFPersonaliza_in_cnpj_outros_aux').value;
        var inArea = document.getElementById('frmMBFPersonaliza_in_area_outros_aux').value;
        var inEstufagem = document.getElementById('frmMBFPersonaliza_in_estufagem_outros_aux').value;
        var inLI = document.getElementById('frmMBFPersonaliza_in_li_outros_aux').value;
        var inPaisOrigem = document.getElementById('frmMBFPersonaliza_in_pais_origem_outros_aux').value;
        var inPrefixo = document.getElementById('frmMBFPersonaliza_in_prefixo_outros_aux').value;
        var inTerminal = document.getElementById('frmMBFPersonaliza_in_terminal_outros_aux').value;
        var inCanal = document.getElementById('frmMBFPersonaliza_in_canal_outros_aux').value;
        var inServico = document.getElementById('frmMBFPersonaliza_in_servico_outros_aux').value;
        var inLocalDes = document.getElementById('frmMBFPersonaliza_in_local_des_outros_aux').value;

        if (objeto.checked) {
            contador_outros++;
        } else {
            contador_outros--;
            document.getElementById('outros_selecionado').value = "";
            document.getElementById('outros_id_selecionado').value = "";
            document.getElementById('outros_codigo_selecionado').value = "";
        }

        document.getElementById('contador_outros').value = contador_outros;
        contador_total_outros++;
        contador_total_outros_aux++;
        document.getElementById('frmMBFPersonaliza_contador_total_outros').value = contador_total_outros;
        document.getElementById('frmMBFPersonaliza_contador_total_outros_aux').value = contador_total_outros_aux;
        div_outros_nao.style.display = 'none';
        div_outros.style.display = 'block';

        //if (!eval("document.getElementById('flag_kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "')")) {
        var texto_outros = "<div id='outros" + codigo_outros + contador_total_outros + "'>&nbsp;&nbsp;<a href='javascript:retiraOutros(\"" + codigo_outros + contador_total_outros + "\");'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;<input type='text' style='display:none' name='codigo_outros" + contador_total_outros + "' id='codigo_outros" + contador_total_outros + "' value='" + codigo_outros + "'><input type='text' style='display:none' name='flag_outros" + codigo_outros + contador_total_outros + "' id='flag_outros" + codigo_outros + contador_total_outros + "' value='outros" + codigo_outros + "' ><input type='text' style='display:none' name='texto_outros" + contador_total_outros + "' id='texto_outros" + contador_total_outros + "' value='" + Trim(objeto.value) + "' >" + objeto.value + "<br><b>&nbsp;&nbsp;&nbsp;&nbsp;Quebras:</b>&nbsp;";
        if (inModal == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_modal_outros" + contador_total_outros + "' onclick=''>Modal&nbsp;" }
        if (inCNPJ == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_cnpj_outros" + contador_total_outros + "' onclick=''>CNPJ&nbsp;" }
        if (inArea == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_area_outros" + contador_total_outros + "' onclick=''>Área&nbsp;" }
        if (inEstufagem == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_estufagem_outros" + contador_total_outros + "' onclick=''>Estufagem&nbsp;" }
        if (inLI == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_li_outros" + contador_total_outros + "' onclick=''>Com/Sem LI&nbsp;" }
        if (inPaisOrigem == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_pais_origem_outros" + contador_total_outros + "' onclick=''>Pais de origem&nbsp;" }
        if (inPrefixo == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_prefixo_outros" + contador_total_outros + "' onclick=''>Prefixo&nbsp;" }
        if (inTerminal == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_terminal_outros" + contador_total_outros + "' onclick=''>Terminal&nbsp;" }
        if (inCanal == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_canal_outros" + contador_total_outros + "' onclick=''>Canal&nbsp;" }
        if (inServico == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_servico_outros" + contador_total_outros + "' onclick=''>Serviço&nbsp;" }
        if (inLocalDes == "True") { texto_outros = texto_outros + "<input type='checkbox' id='in_local_des_outros" + contador_total_outros + "' onclick=''>Local de desembarque&nbsp;" }
        texto_outros = texto_outros + "<br></div>";
        div_outros.innerHTML += texto_outros;

        document.getElementById('outros_selecionado').value = "";
        document.getElementById('outros_id_selecionado').value = "";
        document.getElementById('outros_codigo_selecionado').value = "";
        document.getElementById('contador_outros').value = 0;
        var total_outros = document.all.outros.length;
        for (i = 0; i < total_outros; i++) {
            if (document.all.outros[i].checked) {
                document.all.outros[i].checked = false;
            }
        }
    }

    function retiraOutros(outros) {
        var texto = eval("document.all.flag_outros" + outros + ".value;");
        var div_outros = document.getElementById('divOutrosSelecionado');
        var div_outros_nao = document.getElementById('divOutrosSelecionadoNao');
        var linha_texto = eval("document.getElementById('outros" + outros + "');");
        var removido_texto = div_outros.removeChild(linha_texto);
        var contador_total_outros_aux = document.getElementById('frmMBFPersonaliza_contador_total_outros_aux').value;        
        contador_total_outros_aux--;
        document.getElementById('frmMBFPersonaliza_contador_total_outros_aux').value = contador_total_outros_aux;

        if (document.getElementById('frmMBFPersonaliza_contador_total_outros_aux').value == 0) {
            div_outros.style.display = 'none';
            div_outros_nao.style.display = 'block';
        }
    }

    function alteraCheckKPI(objeto) {
        var id = objeto.id;
        var id_principal = objeto.id;
        var texto = objeto.id;
        var j;
        if (Right(objeto.id, 3) == 'tp1') {
            id = id.replace('tp1', 'tp2')
            id_principal = id_principal.replace('_tp1', '')
            texto = texto.replace('_tp1', '');
            if (objeto.checked) {
                if (document.getElementById(id).checked) {
                    document.getElementById(id_principal).value = 2;
                } else {
                    document.getElementById(id_principal).value = 0;
                }
            } else {
                document.getElementById(id).checked = true;
                alteraCheckKPI(document.getElementById(id));
            }
        } else {
            id = id.replace('tp2', 'tp1')
            id_principal = id_principal.replace('_tp2', '')
            texto = texto.replace('_tp2', '');
            if (objeto.checked) {
                if (document.getElementById(id).checked) {
                    document.getElementById(id_principal).value = 2;
                } else {
                    document.getElementById(id_principal).value = 1;
                }
            } else {
                document.getElementById(id).checked = true;
                alteraCheckKPI(document.getElementById(id));
            }
        }
    }

    function verificaKPI() {
        var valor, texto, tipo
        //Quebras
        var modal, cnpj, area, estufagem, in_li, pais_origem, prefixo, terminal, canal, servico, local_des
        var total = document.getElementById('frmMBFPersonaliza_contador_total_kpi').value;
        var inModal = document.getElementById('frmMBFPersonaliza_in_modal_aux').value;
        var inCNPJ = document.getElementById('frmMBFPersonaliza_in_cnpj_aux').value;
        var inArea = document.getElementById('frmMBFPersonaliza_in_area_aux').value;
        var inEstufagem = document.getElementById('frmMBFPersonaliza_in_estufagem_aux').value;
        var inLI = document.getElementById('frmMBFPersonaliza_in_li_aux').value;
        var inPaisOrigem = document.getElementById('frmMBFPersonaliza_in_pais_origem_aux').value;
        var inPrefixo = document.getElementById('frmMBFPersonaliza_in_prefixo_aux').value;
        var inTerminal = document.getElementById('frmMBFPersonaliza_in_terminal_aux').value;
        var inCanal = document.getElementById('frmMBFPersonaliza_in_canal_aux').value;
        var inServico = document.getElementById('frmMBFPersonaliza_in_servico_aux').value;
        var inLocalDes = document.getElementById('frmMBFPersonaliza_in_local_des_aux').value;

        document.getElementById('frmMBFPersonaliza_hfKPI').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPINomes').value = '';
        //Quebras
        document.getElementById('frmMBFPersonaliza_hfKPIInModal').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInCNPJ').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInArea').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInEstufagem').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInLI').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInPaisOrigem').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInPrefixo').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInTerminal').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInCanal').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInServico').value = '';
        document.getElementById('frmMBFPersonaliza_hfKPIInLocalDes').value = '';

        for (i = 1; i <= total; i++) {
            if (eval("document.getElementById('codigo_kpi" + i + "')")) {
                valor = Left(eval("document.all.codigo_kpi" + i + ".value;"), 10);
                texto = eval("document.all.texto_kpi" + i + ".value;");
                tipo = eval("document.all.tipo_kpi" + i + ".value;");
                valor = valor + "_" + tipo;
                //Quebras
                if (inModal == "True") { modal = eval("document.all.in_modal_kpi" + i + ".checked;") };
                if (inCNPJ == "True") { cnpj = eval("document.all.in_cnpj_kpi" + i + ".checked;") };
                if (inArea == "True") { area = eval("document.all.in_area_kpi" + i + ".checked;") };
                if (inEstufagem == "True") { estufagem = eval("document.all.in_estufagem_kpi" + i + ".checked;") };
                if (inLI == "True") { in_li = eval("document.all.in_li_kpi" + i + ".checked;") };
                if (inPaisOrigem == "True") { pais_origem = eval("document.all.in_pais_origem_kpi" + i + ".checked;") };
                if (inPrefixo == "True") { prefixo = eval("document.all.in_prefixo_kpi" + i + ".checked;") };
                if (inTerminal == "True") { terminal = eval("document.all.in_terminal_kpi" + i + ".checked;") };
                if (inCanal == "True") { canal = eval("document.all.in_canal_kpi" + i + ".checked;") };
                if (inServico == "True") { servico = eval("document.all.in_servico_kpi" + i + ".checked;") };
                if (inLocalDes == "True") { local_des = eval("document.all.in_local_des_kpi" + i + ".checked;") };

                document.getElementById('frmMBFPersonaliza_hfKPI').value = document.getElementById('frmMBFPersonaliza_hfKPI').value + valor + ';';
                document.getElementById('frmMBFPersonaliza_hfKPINomes').value = document.getElementById('frmMBFPersonaliza_hfKPINomes').value + Trim(texto) + ';';
                //Quebras
                document.getElementById('frmMBFPersonaliza_hfKPIInModal').value = document.getElementById('frmMBFPersonaliza_hfKPIInModal').value + modal + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInCNPJ').value = document.getElementById('frmMBFPersonaliza_hfKPIInCNPJ').value + cnpj + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInArea').value = document.getElementById('frmMBFPersonaliza_hfKPIInArea').value + area + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInEstufagem').value = document.getElementById('frmMBFPersonaliza_hfKPIInEstufagem').value + estufagem + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInLI').value = document.getElementById('frmMBFPersonaliza_hfKPIInLI').value + in_li + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInPaisOrigem').value = document.getElementById('frmMBFPersonaliza_hfKPIInPaisOrigem').value + pais_origem + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInPrefixo').value = document.getElementById('frmMBFPersonaliza_hfKPIInPrefixo').value + prefixo + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInTerminal').value = document.getElementById('frmMBFPersonaliza_hfKPIInTerminal').value + terminal + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInCanal').value = document.getElementById('frmMBFPersonaliza_hfKPIInCanal').value + canal + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInServico').value = document.getElementById('frmMBFPersonaliza_hfKPIInServico').value + servico + ';';
                document.getElementById('frmMBFPersonaliza_hfKPIInLocalDes').value = document.getElementById('frmMBFPersonaliza_hfKPIInLocalDes').value + local_des + ';';                
            }
        }
        return true;
    }

    function verificaOutros() {
        var valor, texto
        //Quebras
        var modal, cnpj, area, estufagem, in_li, pais_origem, prefixo, terminal, canal, servico, local_des
        var total = document.getElementById('frmMBFPersonaliza_contador_total_outros').value;
        var inModal = document.getElementById('frmMBFPersonaliza_in_modal_outros_aux').value;
        var inCNPJ = document.getElementById('frmMBFPersonaliza_in_cnpj_outros_aux').value;
        var inArea = document.getElementById('frmMBFPersonaliza_in_area_outros_aux').value;
        var inEstufagem = document.getElementById('frmMBFPersonaliza_in_estufagem_outros_aux').value;
        var inLI = document.getElementById('frmMBFPersonaliza_in_li_outros_aux').value;
        var inPaisOrigem = document.getElementById('frmMBFPersonaliza_in_pais_origem_outros_aux').value;
        var inPrefixo = document.getElementById('frmMBFPersonaliza_in_prefixo_outros_aux').value;
        var inTerminal = document.getElementById('frmMBFPersonaliza_in_terminal_outros_aux').value;
        var inCanal = document.getElementById('frmMBFPersonaliza_in_canal_outros_aux').value;
        var inServico = document.getElementById('frmMBFPersonaliza_in_servico_outros_aux').value;
        var inLocalDes = document.getElementById('frmMBFPersonaliza_in_local_des_outros_aux').value;

        document.getElementById('frmMBFPersonaliza_hfOutros').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosNomes').value = '';
        //Quebras
        document.getElementById('frmMBFPersonaliza_hfOutrosInModal').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInCNPJ').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInArea').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInEstufagem').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInLI').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInPaisOrigem').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInPrefixo').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInTerminal').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInCanal').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInServico').value = '';
        document.getElementById('frmMBFPersonaliza_hfOutrosInLocalDes').value = '';

        for (i = 1; i <= total; i++) {
            if (eval("document.getElementById('codigo_outros" + i + "')")) {
                valor = eval("document.all.codigo_outros" + i + ".value;")
                texto = eval("document.all.texto_outros" + i + ".value;");
                //Quebras
                if (inModal == "True") { modal = eval("document.all.in_modal_outros" + i + ".checked;") };
                if (inCNPJ == "True") { cnpj = eval("document.all.in_cnpj_outros" + i + ".checked;") };
                if (inArea == "True") { area = eval("document.all.in_area_outros" + i + ".checked;") };
                if (inEstufagem == "True") { estufagem = eval("document.all.in_estufagem_outros" + i + ".checked;") };
                if (inLI == "True") { in_li = eval("document.all.in_li_outros" + i + ".checked;") };
                if (inPaisOrigem == "True") { pais_origem = eval("document.all.in_pais_origem_outros" + i + ".checked;") };
                if (inPrefixo == "True") { prefixo = eval("document.all.in_prefixo_outros" + i + ".checked;") };
                if (inTerminal == "True") { terminal = eval("document.all.in_terminal_outros" + i + ".checked;") };
                if (inCanal == "True") { canal = eval("document.all.in_canal_outros" + i + ".checked;") };
                if (inServico == "True") { servico = eval("document.all.in_servico_outros" + i + ".checked;") };
                if (inLocalDes == "True") { local_des = eval("document.all.in_local_des_outros" + i + ".checked;") };
                document.getElementById('frmMBFPersonaliza_hfOutros').value = document.getElementById('frmMBFPersonaliza_hfOutros').value + valor + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosNomes').value = document.getElementById('frmMBFPersonaliza_hfOutrosNomes').value + Trim(texto) + ';';
                //Quebras
                document.getElementById('frmMBFPersonaliza_hfOutrosInModal').value = document.getElementById('frmMBFPersonaliza_hfOutrosInModal').value + modal + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInCNPJ').value = document.getElementById('frmMBFPersonaliza_hfOutrosInCNPJ').value + cnpj + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInArea').value = document.getElementById('frmMBFPersonaliza_hfOutrosInArea').value + area + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInEstufagem').value = document.getElementById('frmMBFPersonaliza_hfOutrosInEstufagem').value + estufagem + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInLI').value = document.getElementById('frmMBFPersonaliza_hfOutrosInLI').value + in_li + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInPaisOrigem').value = document.getElementById('frmMBFPersonaliza_hfOutrosInPaisOrigem').value + pais_origem + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInPrefixo').value = document.getElementById('frmMBFPersonaliza_hfOutrosInPrefixo').value + prefixo + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInTerminal').value = document.getElementById('frmMBFPersonaliza_hfOutrosInTerminal').value + terminal + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInCanal').value = document.getElementById('frmMBFPersonaliza_hfOutrosInCanal').value + canal + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInServico').value = document.getElementById('frmMBFPersonaliza_hfOutrosInServico').value + servico + ';';
                document.getElementById('frmMBFPersonaliza_hfOutrosInLocalDes').value = document.getElementById('frmMBFPersonaliza_hfOutrosInLocalDes').value + local_des + ';';
            }
        }        
        return true;
    }

    function carregaTelas(div_mostra, div_esconde) {      
            var cabec_mostra = div_mostra + 'Cabec';
            var cabec_esconde = div_esconde + 'Cabec';
            var link_mostra = div_mostra + 'Link';
            var link_esconde = div_esconde + 'Link';
            if (div_mostra == 'divMBFResultadoP') {
                document.location = 'mbf_personaliza.aspx?usuario=<%=Session("usuario")%>&codigo=<%=Session("codigo")%>&cd_menu=<%=Session("cd_menu")%>';
            }else{
                document.getElementById(div_mostra).style.display = 'block';
                document.getElementById(div_esconde).style.display = 'none';
                document.getElementById(cabec_mostra).style.backgroundColor = '#cd1414';
                document.getElementById(cabec_esconde).style.backgroundColor = '#FFFFFF';
                document.getElementById(link_mostra).style.color = '#FFFFFF';
                document.getElementById(link_esconde).style.color = '#cd1414';
           }
    }

    function SomenteNumero(e) {
        var tecla = (window.event) ? event.keyCode : e.which;
        if ((tecla > 47 && tecla < 58)) return true;
        else {
            if (tecla == 8 || tecla == 0 || tecla == 45) return true;
            else return false;
        }
    }

    function atualizaDesvios(processo, mes, ano, kpi, tx_desvio, imagem, cd_tp_kpi, id_kpi) {
        sim = new Image(16, 16)
        nao = new Image(16, 16)
        atualiza = new Image(16, 16)
        nao.src = "/imagens/icones/16x16/checks_mbf/0.gif";
        sim.src = "/imagens/icones/16x16/checks_mbf/1.gif";
        atualiza.src = "/imagens/30/refresh16.gif";

        if (imagem.src == atualiza.src) {
            atualizaDesviosAJAX(processo, mes, ano, kpi, tx_desvio.value, '2', cd_tp_kpi, id_kpi)
        }else{
            if (imagem.src == sim.src && Trim(tx_desvio.value) != '') {
                imagem.src = nao.src;
                atualizaDesviosAJAX(processo, mes, ano, kpi, tx_desvio.value, '0', cd_tp_kpi, id_kpi)
            } else {
                if (imagem.src == sim.src && Trim(tx_desvio.value) == '') {
                    alert('ATENÇÃO: Primeiramente, digite o motivo do desvio');
                    tx_desvio.style.backgroundColor = "#fcb1b1";
                    tx_desvio.focus();
                } else {
                    imagem.src = sim.src;
                    atualizaDesviosAJAX(processo, mes, ano, kpi, tx_desvio.value, '1', cd_tp_kpi, id_kpi)
                }
            }
        }
    }

    function atualizaDesviosAJAX(processo, mes, ano, kpi, tx_desvio, in_selecionado, cd_tp_kpi, id_kpi) {
        var ajax = openAjax();        
        ajax.open('GET', 'mbf_desvios_atualiza.asp?processo=' + processo + '&mes=' + mes + '&ano=' + ano + '&kpi=' + kpi + '&in_selecionado=' + in_selecionado + '&tx_desvio=' + escape(tx_desvio) + '&cd_tp_kpi=' + cd_tp_kpi + '&id_kpi=' + id_kpi, true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    //alert(vResult);
                    if (vResult != "") {
                        alert('ATENÇÃO: Erro ao atualizar desvio!');
                    }
                }
            }
        }
        ajax.send(null);
    }

    function deletarSelecionado(mes, ano, cd_mbf, usuario, cd_selecionado) {
        return (confirm('ATENÇÃO: Deseja realmente excluir este mês selecionado?'));      
    }

    function atualizaMeta(resultado, codigo, modal, estufagem, cd_kpi, tp_kpi, valor, mbf, usuario, nm_tp_kpi) {
        valor = valor.replace("btn", "txt");
        valor = document.getElementById(valor).value;
        var ajax = openAjax();
        //alert('aqui');
        ajax.open('GET', 'mbf_meta_atualiza.asp?resultado=' + resultado + '&codigo=' + codigo + '&modal=' + modal + '&estufagem=' + estufagem + '&cd_kpi=' + cd_kpi + '&tp_kpi=' + tp_kpi + '&valor=' + valor + '&mbf=' + mbf + '&usuario=' + usuario + '&nm_tp_kpi' + nm_tp_kpi, true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    alert(vResult);
                    if (vResult != "") {
                        alert('ATENÇÃO: Erro ao atualizar meta!');
                    }
                }
            }
        }
        ajax.send(null);
    }

    function excluirUsuario(cd_usuario, cd_mbf) {
        if (confirm('ATENÇÃO: Deseja realmente excluir este compartilhamento?')) {
            var ajax = openAjax();
            ajax.open('GET', 'excluir_mbf.asp?cd_usuario=' + cd_usuario + '&cd_mbf=' + cd_mbf, true);
            ajax.setRequestHeader("Cache-Control", "no-cache");
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        if (vResult != "") {
                            alert('ATENÇÃO: Erro ao excluir este compartilhamento!');
                        } else {
                            fechaUsuarios();
                            ExibeUsuarios();
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function excluiMBF() {
        return (confirm('ATENÇÃO: Deseja realmente excluir este MBF?'));
    }

    function ExibeCompartilhar() {
        if (document.getElementById) {
            var usuario = '<%=Request.QueryString("usuario") %>'
            var cd_mbf = '<%=Request.QueryString("codigo") %>'

            var x = screen.width;
            var y = screen.height;
            var w = 300;
            var z = 80;

            var vCorpo = document.getElementById('divCompartilhar');
            var vTitulo = document.getElementById('divCompartilharTitulo');
            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vTitulo.style.width = w;
            vTitulo.style.height = 16;
            vTitulo.style.left = (x2) - 320;
            vTitulo.style.top = ((y4) / 2) - 2 - 16 + 20;
            vTitulo.style.display = "block";
            vTitulo.style.filter = "alpha(opacity=95)";

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) - 320;
            vCorpo.style.top = ((y4) / 2) - 2 + 20;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open('POST', 'mbf_compartilhar.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading3.gif'></center></div>";
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

    function ExibeCompartilhar() {
        if (document.getElementById) {
            var usuario = '<%=Request.QueryString("usuario") %>'
            var cd_mbf = '<%=Request.QueryString("codigo") %>'

            var x = screen.width;
            var y = screen.height;
            var w = 300;
            var z = 80;

            var vCorpo = document.getElementById('divCompartilhar');
            var vTitulo = document.getElementById('divCompartilharTitulo');
            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vTitulo.style.width = w;
            vTitulo.style.height = 16;
            vTitulo.style.left = (x2) - 320;
            vTitulo.style.top = ((y4) / 2) - 2 - 16 + 20;
            vTitulo.style.display = "block";
            vTitulo.style.filter = "alpha(opacity=95)";

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) - 320;
            vCorpo.style.top = ((y4) / 2) - 2 + 20;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open('POST', 'mbf_compartilhar.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading3.gif'></center></div>";
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

    function ExibeUsuarios() {
        if (document.getElementById) {
            var usuario = '<%=Request.QueryString("usuario") %>'
            var cd_mbf = '<%=Request.QueryString("codigo") %>'

            var x = screen.width;
            var y = screen.height;
            var w = 300;
            var z = 200;

            var vCorpo = document.getElementById('divUsuarios');
            var vTitulo = document.getElementById('divUsuariosTitulo');
            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vTitulo.style.width = w;
            vTitulo.style.height = 16;
            vTitulo.style.left = (x2) - 320;
            vTitulo.style.top = ((y4) / 2) - 2 - 16 + 20;
            vTitulo.style.display = "block";
            vTitulo.style.filter = "alpha(opacity=95)";

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) - 320;
            vCorpo.style.top = ((y4) / 2) - 2 + 20;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open('POST', 'mbf_usuarios.aspx?cd_mbf=' + cd_mbf + '&usuario=' + usuario, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/icones/32x32/loading3.gif'></center></div>";
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

    function copiaMBF(nome, objeto, mbf, tipo, objeto2, objeto3) {
        var usuario = '<%=Request.QueryString("usuario") %>'
        var grupo = objeto.value;        
        var nm_mbf = nome.value;
        if (document.getElementById) {
            var ajax = openAjax();
            if (tipo == '0') {
                var cliente = objeto2.value;
                var area = objeto3.value;
                ajax.open("GET", "copia_mbf.asp?cd_mbf=" + mbf + "&cd_grupo=" + grupo + "&cd_cliente=" + cliente + "&cd_area=" + area + "&cd_usuario=" + usuario + "&nm_mbf=" + escape(nm_mbf) + '&tipo=0', true);
            } else {
                ajax.open("GET", "copia_mbf.asp?cd_mbf=" + mbf + "&cd_usuario_para=" + grupo + "&cd_usuario=" + usuario + '&tipo=1', true);
            }
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) { //agora exibe o que interessa
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        if (vResult != "") {
                            alert(vResult);
                        } else {
                            alert('ATENÇÃO: MBF compartilhado com sucesso!');
                            if (tipo == '0') {
                                fechaCompartilhar();
                            } else {
                                fechaUsuarios();
                                ExibeUsuarios();
                            }
                        }
                    }
                }
            }
            ajax.send(null); // submete
        }
    }

    function fechaCompartilhar() {
        document.getElementById("divCompartilharTitulo").style.display = 'none';
        document.getElementById("divCompartilhar").style.display = 'none';
    }

    function fechaUsuarios() {
        document.getElementById("divUsuariosTitulo").style.display = 'none';
        document.getElementById("divUsuarios").style.display = 'none';
    }

    function ExibeApresentacao() {
        var usuario = '<%=Request.QueryString("usuario") %>'
        var cd_mbf = '<%=Request.QueryString("codigo") %>'
        var cd_menu = '<%=Request.QueryString("cd_menu") %>'
        var features = ''
        window.open('mbf_apresentacao.aspx?codigo=' + cd_mbf + '&usuario=' + usuario + '&cd_menu=' + cd_menu + '&width=' + screen.width, 'Apresentação', features);
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
	border: solid 2px #808080;
	background-color: #FFFFFF;
	scrollbar-face-color: #FFFFFF;
	scrollbar-track-color: #e6e9ec;
	scrollbar-arrow-color: #808080;
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
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_mbf2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
    <tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
  </table>
  <form id="frmMBF" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:-710px;">
  <asp:ScriptManager ID="smMBF" runat="server"/>
    <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#808080;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/30/btn_fechar_cinza.gif" style="vertical-align:middle;" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#E6E9EC;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:300px;height:16px;" onchange="n=0;" onkeypress="if(event.keyCode == 13){findInPage(txtPesquisa.value);}"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>
    <div id="divInfoCorpo" class="divDetalhes"></div> 
    <div id="divEdita" style="border-width:0px;position:absolute;top:100px;">
      <asp:FormView ID="frmMBFPersonaliza" runat="server" DataKeyNames="CD_MBF, IN_MODAL" DataSourceID="SqlMBFPersonaliza" BorderWidth="0px" DefaultMode="Edit"  Font-Size="10pt">    
      <EmptyDataTemplate>
      </EmptyDataTemplate>
      <EditItemTemplate>        
        <div id="divCompartilharTitulo" style="background-color:#E6E9EC;color:#FFFFFF;position:absolute;display:none;padding-left:5px;font-family:Verdana;font-size:8pt;font-weight:bold;border-color:#808080;border-width:2px;border-style:solid;border-bottom-width:0px;">&nbsp;<div style="right:3px;position:absolute;"><img src="/imagens/30/btn_fechar_cinza_claro.gif" style="cursor:pointer;vertical-align:middle;" onclick="fechaCompartilhar();" alt="Fechar"/></div></div>
        <div id="divCompartilhar" class="divInfo" style="background-color:#E6E9EC;text-align:center;border-top-width:0px;vertical-align:top;"></div>               
        <div id="divUsuariosTitulo" style="background-color:#E6E9EC;color:#FFFFFF;position:absolute;display:none;padding-left:5px;font-family:Verdana;font-size:8pt;font-weight:bold;border-color:#808080;border-width:2px;border-style:solid;border-bottom-width:0px;">&nbsp;<div style="right:3px;position:absolute;"><img src="/imagens/30/btn_fechar_cinza_claro.gif" style="cursor:pointer;vertical-align:middle;" onclick="fechaUsuarios();" alt="Fechar"/></div></div>
        <div id="divUsuarios" class="divInfo" style="background-color:#E6E9EC;text-align:center;border-top-width:0px;vertical-align:top;"></div>                       
        <div id="divProcessosTitulo" style="background-color:#E6E9EC;color:#FFFFFF;position:absolute;display:none;padding-left:5px;font-family:Verdana;font-size:8pt;font-weight:bold;border-color:#808080;border-width:2px;border-style:solid;border-bottom-width:0px;">&nbsp;<div style="right:3px;position:absolute;"><asp:ImageButton runat="server" ImageUrl="~/imagens/30/btn_fechar_cinza_claro.gif" style="cursor:pointer;vertical-align:middle;" OnClick="FechaProcessos" ToolTip="Fechar" AutoPostBack="true"/></div></div>
        <div id="divProcessos" class="divInfo" style="background-color:#E6E9EC;text-align:center;border-top-width:0px;vertical-align:top;"></div>
        <div id="divMBFResultadoPCabec" style="float:left;background-color:#cd1414;border-color:#cd1414;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divMBFResultadoPLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;" onclick="carregaTelas('divMBFResultadoP', 'divMBFPersonalizaP');">MBF</a></center></div>    
        <div id="divMBFPersonalizaPCabec" style="background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#cd1414;font-family:Verdana;font-size:9pt;"><center><a id="divMBFPersonalizaPLink" href="#" style="text-decoration:none;cursor:pointer;color:#cd1414;" onclick="carregaTelas('divMBFPersonalizaP', 'divMBFResultadoP');">Configurações</a></center></div>    
        <div id="divMBFResultadoP" style="background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
          <div id="divMBFResultado" style="display:block;text-align:left;font-family:Verdana;">
            <asp:Label runat="server" Text="" ID="lblTituloR" ForeColor="#cd1414"/>
            <asp:Panel runat="server" style="right:30px;position:absolute;">            
            <asp:Image runat="server" ImageUrl="~/imagens/30/user16.gif"/>&nbsp;<a href="javascript:ExibeUsuarios();" style="text-decoration:none;color:#000000;">Usuários</a>&nbsp;
            <asp:Image runat="server" ImageUrl="~/imagens/30/lixeira16.gif"/>&nbsp;<asp:LinkButton runat="server" ID="lbExcluir" Text="Excluir" OnClientClick="return excluiMBF();" OnClick="ExcluiMBF" style="text-decoration:none;color:#000000;"></asp:LinkButton>&nbsp;
            <asp:Image runat="server" ImageUrl="~/imagens/30/compartilhar16.gif"/>&nbsp;<a href="javascript:ExibeCompartilhar();" style="text-decoration:none;color:#000000;">Duplicar</a>&nbsp;              
            <asp:Image runat="server" ImageUrl="~/imagens/30/grafico16.gif"/>&nbsp;<a href="javascript:ExibeApresentacao();" style="text-decoration:none;color:#000000;">Apresentação</a><br />                  
            </asp:Panel>
            <asp:UpdatePanel ID="upMBFResultado" runat="server">    
            <ContentTemplate>    
              <br />    
              <asp:HiddenField runat="server" ID="vlContador" Value="1"/>    
              <asp:HiddenField runat="server" ID="cdAgrupamento" Value="1"/>                
              <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;" Width="630px" >
              <asp:RadioButtonList runat="server" ID="rdAgrupar" RepeatDirection="Horizontal" OnSelectedIndexChanged="AlteraAgrupamento" style="font-family:Verdana;font-size:9pt;" AutoPostBack="true" >
              <asp:ListItem Value="1"  Selected="True">Mês</asp:ListItem>
              <asp:ListItem Value="2">Trimestre</asp:ListItem>
              <asp:ListItem Value="3">Semestre</asp:ListItem>
              <asp:ListItem Value="0">Ano</asp:ListItem>
              </asp:RadioButtonList>
              <asp:Panel ID="pnlResultadoTotalCabec" runat="server" BorderColor="#808080" BorderStyle="Solid" BorderWidth="1px" Width="630px" style="border-bottom-width:0;">                                  
              <asp:Panel ID="pnlResultadoInfoCabec" runat="server"  style="float:left;line-height:24px;text-align:right;padding-right:6px;" Width="495px" BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" Height="24px" Font-Names="Verdana" Font-Size="9px" Font-Bold="true">Meta</asp:Panel>
              <asp:Panel ID="pnlResultadoAntes" runat="server" Width="8px" style="float:left;">
                <asp:ImageButton ID="ibAntes" runat="server" ImageUrl="~/imagens/30/antes2.gif" style="vertical-align:top;" OnClick="AlteraColunaMenos"/> 
              </asp:Panel> 
              <asp:Panel ID="pnlResultadoCabec" runat="server"  style="float:left;" Width="102px" BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Center" Height="24px" Font-Names="Verdana" Font-Size="9px" Font-Bold="true">
                <asp:Literal runat="server" ID="ltlResultadoCabec"></asp:Literal>
              </asp:Panel>
              <asp:Panel ID="pnlResultadoDepois" runat="server" Width="8px" style="float:left;">
                <asp:ImageButton ID="ibDepois" runat="server" ImageUrl="~/imagens/30/depois2.gif" style="vertical-align:top;" OnClick="AlteraColunaMais"/> 
              </asp:Panel>
              <asp:Panel ID="pnlResultadoCabecAux" runat="server"  style="float:left;" Width="15px" BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" Height="24px" Font-Names="Verdana" Font-Size="9px">&nbsp;</asp:Panel>
              </asp:Panel>
              <asp:Panel ID="pnlResultadoTotal" runat="server" BorderColor="#808080" BorderStyle="Solid" BorderWidth="1px" Height="290px" ScrollBars="Auto" Width="630px" style="border-top-width:0;">                                  
              <asp:Panel ID="pnlResultadoInfo" runat="server" ScrollBars="None"  Width="495px" Height="200px">              
              <asp:GridView ID="grdResultadoInfo" runat="server" DataSourceID="SqlResultadoKPIInfo" Width="495px"
                AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="9px" ShowHeader = "false"
                AlternatingRowStyle-BackColor="#e6e9ec" 
                CellPadding="0" HorizontalAlign="Center" 
                RowStyle-HorizontalAlign="Center" style="border-right-width:0px;padding-left:5px;padding-right:5px;" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false">
              <AlternatingRowStyle BackColor="#FFFFFF" />
              <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" Height="24px"/>
              <RowStyle HorizontalAlign="Left" Height="28px" BackColor="#E6E9EC" />
              <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#e6e9ec" Height="50px"/>
              <EmptyDataTemplate>       
              <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="~/imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Não há resultados para este MBF" Font-Bold="true"/>
              </EmptyDataTemplate>                  
              <Columns>                      
                <asp:TemplateField HeaderText = "" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("NM_KPI") %>' ToolTip='<%# Eval("NM_COMPLETO") %>'/><br />
                    <i><b><asp:Label runat="server" Text='<%# Eval("NM_QUEBRAS") %>' ToolTip='<%# Eval("NM_COMPLETO") %>'/></i></b>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText = "Meta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                  <asp:Label runat="server" Width='25px' Text='<%# Eval("NR_META") %>' ID="txtNrMeta"/>
                </ItemTemplate>
                </asp:TemplateField>                
              </Columns>                       
              </asp:GridView>
              <asp:SqlDataSource ID="SqlResultadoKPIInfo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                SelectCommand="SELECT NM_COMPLETO, NM_KPI, NM_QUEBRAS, NR_META FROM TMBF_RESULTADO (NOLOCK) WHERE CD_MBF = @CD_MBF AND CD_USUARIO = @CD_USUARIO AND NR_PROCESSO <> '9999XX-9999-99' AND TP_KPI <> '3' GROUP BY NM_COMPLETO, ID_KPI, NM_KPI, NM_QUEBRAS, NR_META ORDER BY ID_KPI, NM_COMPLETO">
              <SelectParameters>
                <asp:QueryStringParameter Name="CD_MBF" QueryStringField="codigo" />
                <asp:QueryStringParameter Name="CD_USUARIO" QueryStringField="usuario" />
              </SelectParameters>        
              </asp:SqlDataSource>
              </asp:Panel>
              <asp:Panel ID="pnlResultadoAntesAux" runat="server" Width="5px" style="float:left;"></asp:Panel>            
              <asp:Panel ID="pnlResultado" runat="server" Width="102px">
              <asp:GridView ID="grdResultado" runat="server" DataSourceID="SqlResultadoKPI" Width="102px"
                AllowSorting="True" AutoGenerateColumns="True" BorderColor="#e6e9ec" BorderWidth="0px" 
                BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="9px" ShowHeader = "false"
                AlternatingRowStyle-BackColor="#e6e9ec" CellPadding="0" HorizontalAlign="Center"  RowStyle-HorizontalAlign="Center" 
                      style="border-right-width:0px;padding-left:5px;padding-right:5px;" 
                      HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false" 
                      OnRowDataBound="AlteraResultado" OnLoad="CarregaResultado" onrowcreated="grdResultado_RowCreated">
              <AlternatingRowStyle BackColor="#FFFFFF" />
              <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" Height="12px"/>
              <RowStyle HorizontalAlign="Left"  Height="28px" BackColor="#E6E9EC"/>
              <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#e6e9ec"/>
              <EmptyDataTemplate>       
              <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="~/imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="aNão há resultados para este MBF" Font-Bold="true"/>
              </EmptyDataTemplate>      
              </asp:GridView>
              <asp:SqlDataSource ID="SqlResultadoKPI" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                SelectCommand="SELECT DIAS_KPI AS ' ' FROM TMBF_RESULTADO (NOLOCK) WHERE CD_MBF = @CD_MBF AND CD_USUARIO = @CD_USUARIO AND NR_PROCESSO <> '9999XX-9999-99' GROUP BY NM_KPI, NR_META, CD_RESULTADO, ANO_RESULTADO, MES_RESULTADO, DIAS_KPI">
              <SelectParameters>
                <asp:QueryStringParameter Name="CD_MBF" QueryStringField="codigo" />
                <asp:QueryStringParameter Name="CD_USUARIO" QueryStringField="usuario" />
              </SelectParameters>        
              </asp:SqlDataSource>  
              </asp:Panel>
              </asp:Panel> 
              </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
          </div>
        </div>    
        <div id="divMBFPersonalizaP" style="display:none;background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
          <div id="divMBFPersonaliza" style="display:block;text-align:left;font-family:Verdana;">
            <asp:Label runat="server" Text="" ID="lblTitulo" ForeColor="#cd1414"/><br /><br />
            <asp:UpdatePanel ID="upMBF" runat="server">    
            <ContentTemplate>                                
              <asp:ImageButton ID="ibFormato" runat="server" ImageUrl="~/imagens/seta_exibe_b2.gif" OnClick="ExibeFormato" style="vertical-align:bottom;"/>                 
              <asp:LinkButton runat="server" ForeColor="#cd1414" Text="Opções" Font-Overline="false" ID="lbFormato" OnClick="ExibeFormato"/>
              <asp:ImageButton ID="ibQuebra" runat="server" ImageUrl="~/imagens/seta_exibe_b2.gif" OnClick="ExibeQuebra" style="vertical-align:bottom;"/> 
              <asp:LinkButton runat="server" ForeColor="#cd1414" Text="Quebras possíveis" Font-Overline="false" ID="lbQuebra" OnClick="ExibeQuebra"/>                
              <asp:ImageButton ID="ibKPI" runat="server" ImageUrl="~/imagens/seta_exibe_b2.gif" OnClick="ExibeKPI" style="vertical-align:bottom;" /> 
              <asp:LinkButton runat="server" ForeColor="#cd1414" Text="KPI"  Font-Overline="false" ID="lbKPI" OnClick="ExibeKPI"/>                
              <asp:ImageButton ID="ibOutros" runat="server" ImageUrl="~/imagens/seta_exibe_b2.gif" OnClick="ExibeOutrosGraficos" style="vertical-align:bottom;" /> 
              <asp:LinkButton runat="server" ForeColor="#cd1414" Text="Outros Gráficos"  Font-Overline="false" ID="lbOutros" OnClick="ExibeOutrosGraficos"/>                                            
              <asp:ImageButton ID="ibGerados" runat="server" ImageUrl="~/imagens/seta_exibe_b2.gif" OnClick="ExibeGerados" style="vertical-align:bottom;"/> 
              <asp:LinkButton runat="server" ForeColor="#cd1414" Text="Gerados" Font-Overline="false" ID="lbGerados" OnClick="ExibeGerados"/>                                      
              <div id="divKPI" style="display:block;text-align:left;">
                <asp:UpdatePanel ID="upKPI" runat="server" Visible="false">
                <ContentTemplate>               
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;">                    
                  <asp:Panel ID="pnlKPI" runat="server" ScrollBars="Vertical" Height="135px" Width="632px"  BorderColor="#808080" BorderWidth="1" BorderStyle="Solid">
                    <asp:GridView runat="server" DataSourceID="SqlEventosKPI" Width="632px"
                      AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                      BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                      HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="10px" 
                      AlternatingRowStyle-BackColor="#e6e9ec" 
                      CellPadding="0" HorizontalAlign="Left" 
                      RowStyle-HorizontalAlign="Left" style="border-right-width:0px" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false">
                    <AlternatingRowStyle BackColor="#E6E9EC" />
                    <Columns>
                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>                            
                          <input type="checkbox" id="<%# Eval("CD_EVENTO") %>" name="kpi" value="<%# Eval("NOME_EVENTO") %>" onclick="clickKPI(this);"/>
                          <input type="text" name="kpi_codigo<%# Eval("CD_EVENTO")%>" id="kpi_codigo<%# Eval("CD_EVENTO")%>" value="<%# Eval("CD_EVENTO")%>" style="display:none;">                                  
                        </ItemTemplate>                          
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:TemplateField>
                      <asp:BoundField DataField="EVENTO" HeaderText="Evento" SortExpression="NOME_EVENTO"/>                              
                    </Columns>
                        <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlEventosKPI" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                      SelectCommand="SELECT DISTINCT E.CD_EVENTO, '(' + E.CD_EVENTO + ')' + ' ' + E.NM_EVENTO AS EVENTO, 
                                    E.NM_EVENTO AS NOME_EVENTO 
                                     FROM TEVENTO E (NOLOCK) 
                                      WHERE E.IN_ATIVO = '1'   
                                        AND ((@cd_menu = '01' AND IN_MOSTRAR_WEB_IMP = '1') 
                                        OR  (@cd_menu = '02' AND IN_MOSTRAR_WEB_EXP = '1'))  
                                     ORDER BY NM_EVENTO">
                    <SelectParameters>
                      <asp:QueryStringParameter Name="cd_menu" QueryStringField="cd_menu"/>
                    </SelectParameters>        
                    </asp:SqlDataSource>
                  </asp:Panel>
                  <br />
                  <asp:Panel ID="pnlKPISelec" runat="server" ScrollBars="Vertical" Height="135px" Width="650px" style="background-color:#e6e9ec;" BorderColor="#808080" BorderWidth="1" BorderStyle="Solid" OnLoad="CarregaKPI">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
                      <tr valign="top" style="font-weight:bold;">
                        <td class="gridtit" width="5%"><nobr>&nbsp;<asp:Label runat="server" Text="Úteis" ID="lblUteis"></asp:Label>&nbsp;</nobr></td>
                        <td class="gridtit" width="5%"><nobr>&nbsp;<asp:Label runat="server" Text="Corridos" ID="lblCorridos"></asp:Label>&nbsp;</nobr></td>
                        <td class="gridtit" width="90%">KPI Selecionado(s)</td>
                      </tr>
                    </table>
                    <div id="divKpiSelecionado" style="display:block;font-size:10px;">
                    <asp:Literal runat="server" ID="ltlKPISelecionado"/></div>
                    <div id="divKpiSelecionadoNao" style="display:none;" align="center"></div>    
                    <input type="text" style="display:none" value="" name="kpi_selecionado" id="kpi_selecionado">
                    <input type="text" style="display:none" value="" name="kpi_id_selecionado" id="kpi_id_selecionado">
                    <input type="text" style="display:none" value="" name="kpi_codigo_selecionado" id="kpi_codigo_selecionado">
                    <input type="text" style="display:none" value="0" name="contador_kpi" id="contador_kpi">
                    <asp:HiddenField runat="server" Value="0" ID="contador_total_kpi"/>
                    <asp:HiddenField runat="server" Value="0" ID="contador_total_kpi_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_MODAL")%>' ID="in_modal_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_CNPJ")%>' ID="in_cnpj_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_AREA")%>' ID="in_area_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_ESTUFAGEM")%>' ID="in_estufagem_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_LI")%>' ID="in_li_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_PAIS_ORIGEM")%>' ID="in_pais_origem_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_PREFIXO")%>' ID="in_prefixo_aux"/>      
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_TERMINAL")%>' ID="in_terminal_aux"/>    
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_CANAL")%>' ID="in_canal_aux"/>     
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_SERVICO")%>' ID="in_servico_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_LOCAL_DES")%>' ID="in_local_des_aux"/>      
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_UTEIS_CORRIDOS")%>' ID="in_uteis_corridos_aux"/>                               
                  </asp:Panel>
                  <br />
                  <asp:HiddenField runat="server" ID="hfKPI"/>
                  <asp:HiddenField runat="server" ID="hfKPINomes"/>
                  <asp:HiddenField runat="server" ID="hfKPIInModal"/>
                  <asp:HiddenField runat="server" ID="hfKPIInCNPJ"/>
                  <asp:HiddenField runat="server" ID="hfKPIInArea"/>
                  <asp:HiddenField runat="server" ID="hfKPIInEstufagem"/>
                  <asp:HiddenField runat="server" ID="hfKPIInLI"/>
                  <asp:HiddenField runat="server" ID="hfKPIInPaisOrigem"/>
                  <asp:HiddenField runat="server" ID="hfKPIInPrefixo"/>
                  <asp:HiddenField runat="server" ID="hfKPIInTerminal"/>
                  <asp:HiddenField runat="server" ID="hfKPIInCanal"/>
                  <asp:HiddenField runat="server" ID="hfKPIInServico"/>
                  <asp:HiddenField runat="server" ID="hfKPIInLocalDes"/>
                  <center><asp:Button runat="server" ID="btnKPI" Text="OK" OnClick="AtualizaKPI" OnClientClick="javascript:return verificaKPI();" Width="25px" BackColor="#FFFFFF" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#000000" Font-Size="10px" style="cursor:pointer;"/></center>   
                  </asp:Panel> 
                </ContentTemplate>  
                </asp:UpdatePanel>    
              </div>
              <div id="divOutros" style="display:block;text-align:left;">
                <asp:UpdatePanel ID="upOutros" runat="server" Visible="false">
                <ContentTemplate>               
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;">                    
                  <asp:Panel ID="pnlOutros" runat="server" ScrollBars="Vertical" Height="135px" Width="632px"  BorderColor="#808080" BorderWidth="1" BorderStyle="Solid">
                    <asp:GridView runat="server" DataSourceID="SqlOutros" Width="632px"
                      AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                      BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                      HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="10px" 
                      AlternatingRowStyle-BackColor="#e6e9ec" 
                      CellPadding="0" HorizontalAlign="Left" 
                      RowStyle-HorizontalAlign="Left" style="border-right-width:0px" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false">
                    <AlternatingRowStyle BackColor="#E6E9EC" />
                    <Columns>
                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>                            
                          <input type="checkbox" id="<%# Eval("CD_GRAFICO") %>" name="outros" value="<%# Eval("NM_GRAFICO") %>" onclick="clickOutros(this);"/>
                          <input type="text" name="outros_codigo<%# Eval("CD_GRAFICO")%>" id="outros_codigo<%# Eval("CD_GRAFICO")%>" value="<%# Eval("CD_GRAFICO")%>" style="display:none;">                                  
                        </ItemTemplate>                          
                        <ItemStyle HorizontalAlign="Center" />
                      </asp:TemplateField>
                      <asp:BoundField DataField="NM_GRAFICO" HeaderText="Gráfico" SortExpression="NM_GRAFICO" ItemStyle-Width="600px"/>                              
                    </Columns>
                        <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlOutros" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                      SelectCommand="SELECT * FROM TOUTROS_GRAFICOS (NOLOCK) WHERE IN_ATIVO = '1'">
                    <SelectParameters>
                      <asp:QueryStringParameter Name="cd_menu" QueryStringField="cd_menu"/>
                    </SelectParameters>        
                    </asp:SqlDataSource>
                  </asp:Panel>
                  <br />
                  <asp:Panel ID="pnlOutrosSelec" runat="server" ScrollBars="Vertical" Height="135px" Width="650px" style="background-color:#e6e9ec;" BorderColor="#808080" BorderWidth="1" BorderStyle="Solid" OnLoad="CarregaOutros">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
                      <tr valign="top" style="font-weight:bold;">
                        <td class="gridtit" width="90%">Gráficos Selecionado(s)</td>
                      </tr>
                    </table>
                    <div id="divOutrosSelecionado" style="display:block;font-size:10px;">
                    <asp:Literal runat="server" ID="ltlOutrosSelecionado"/></div>
                    <div id="divOutrosSelecionadoNao" style="display:none;" align="center"></div>    
                    <input type="text" style="display:none" value="" name="outros_selecionado" id="outros_selecionado">
                    <input type="text" style="display:none" value="" name="outros_id_selecionado" id="outros_id_selecionado">
                    <input type="text" style="display:none" value="" name="outros_codigo_selecionado" id="outros_codigo_selecionado">
                    <input type="text" style="display:none" value="0" name="contador_outros" id="contador_outros">
                    <asp:HiddenField runat="server" Value="0" ID="contador_total_outros"/>
                    <asp:HiddenField runat="server" Value="0" ID="contador_total_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_MODAL")%>' ID="in_modal_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_CNPJ")%>' ID="in_cnpj_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_AREA")%>' ID="in_area_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_ESTUFAGEM")%>' ID="in_estufagem_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_LI")%>' ID="in_li_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_PAIS_ORIGEM")%>' ID="in_pais_origem_outros_aux"/>
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_PREFIXO")%>' ID="in_prefixo_outros_aux"/>      
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_TERMINAL")%>' ID="in_terminal_outros_aux"/>      
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_CANAL")%>' ID="in_canal_outros_aux"/>     
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_SERVICO")%>' ID="in_servico_outros_aux"/>     
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_LOCAL_DES")%>' ID="in_local_des_outros_aux"/>     
                    <asp:HiddenField runat="server" Value='<%# Eval("IN_UTEIS_CORRIDOS")%>' ID="in_uteis_corridos_2_aux"/>                                
                  </asp:Panel>
                  <br />
                  <asp:HiddenField runat="server" ID="hfOutros"/>
                  <asp:HiddenField runat="server" ID="hfOutrosNomes"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInModal"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInCNPJ"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInArea"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInEstufagem"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInLI"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInPaisOrigem"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInPrefixo"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInTerminal"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInCanal"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInServico"/>
                  <asp:HiddenField runat="server" ID="hfOutrosInLocalDes"/>
                  <center><asp:Button runat="server" ID="btnOutros" Text="OK" OnClick="AtualizaOutros" OnClientClick="javascript:return verificaOutros();" Width="25px" BackColor="#FFFFFF" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#000000" Font-Size="10px" style="cursor:pointer;"/></center>   
                  </asp:Panel> 
                  <br />                  
                </ContentTemplate>  
                </asp:UpdatePanel>    
              </div>        
              <div id="divFormato" style="display:block;text-align:left;font-family:Verdana;">
                <asp:UpdatePanel ID="upFormato" runat="server" Visible="false">
                <ContentTemplate>
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;">                
                  <asp:CheckBox runat="server" ID="cbGraficoDesvios" Text="Com desvios/Sem desvios" Checked='<%# Bind("IN_COM_SEM_DESVIOS")%>' OnCheckedChanged="AtualizaFormatoSimulacao" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbGraficoUteisCorridos" Text="Úteis/Corridos" Checked='<%# Bind("IN_UTEIS_CORRIDOS")%>' OnCheckedChanged="AtualizaFormatoSimulacao" AutoPostBack="true"/><br /> <br />
                  &nbsp;<asp:Label runat="server" Text="Quantidade (período/gráfico)"/>&nbsp;<asp:TextBox ID="txtQtdMesesGrafico" runat="server" CssClass="textbox" Width="30px" Text='<%# Bind("QTDE_MESES_GRAFICO")%>' OnTextChanged="AtualizaFormato"/>
                  <asp:Button runat="server" ID="btnQtdeMeses" Text="OK" OnClick="AtualizaFormato" Width="30px" Height="16px" BackColor="#d7d8d9" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#000000" Font-Size="10px" style="cursor:pointer;"/><br />                      
                  <asp:CheckBox runat="server" ID="cbGraficoProcessosAbertos" Text="Gráfico de processos abertos" Checked='<%# Bind("IN_GRAFICO_PROC_ABERTOS")%>' OnCheckedChanged="AtualizaFormato" AutoPostBack="true"/><br />                  
                  <asp:CheckBox runat="server" ID="cbDesvios" Text="Cliente aceita retirar desvios da medição" Checked='<%# Bind("IN_DESVIOS")%>' OnCheckedChanged="AtualizaFormato" AutoPostBack="true"/><br />                  
                  <asp:CheckBox runat="server" ID="cbDecimal" Text="Resultado com casas decimais" Checked='<%# Bind("IN_DECIMAL")%>' OnCheckedChanged="AtualizaFormato" AutoPostBack="true"/><br />                  
                  <asp:CheckBox runat="server" ID="cbMeta" Text="Mostrar linha da meta" Checked='<%# Bind("IN_META")%>' OnCheckedChanged="AtualizaFormato" AutoPostBack="true"/><br />                  
                  <asp:CheckBox runat="server" ID="cbLegMeta" Text="Mostrar legenda na linha da meta" Checked='<%# Bind("IN_LEGENDA_META")%>' OnCheckedChanged="AtualizaFormato" AutoPostBack="true"/><br />                                    
                  </asp:Panel> 
                </ContentTemplate>
                </asp:UpdatePanel>  
              </div>                  
              <div id="divQuebra" style="display:block;text-align:left;font-family:Verdana;">
                <asp:UpdatePanel ID="upQuebra" runat="server" Visible="false">
                <ContentTemplate>
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;">                    
                  <asp:CheckBox runat="server" ID="cbModal" Text="Modal" Checked='<%# Bind("IN_MODAL")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbCNPJ" Text="CNPJ" Checked='<%# Bind("IN_CNPJ")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbArea" Text="Área" Checked='<%# Bind("IN_AREA")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbEstufagem" Text="Estufagem" Checked='<%# Bind("IN_ESTUFAGEM")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbLi" Text="Com/Sem LI" Checked='<%# Bind("IN_LI")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbPaisOrigem" Text="País de origem" Checked='<%# Bind("IN_PAIS_ORIGEM")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbPrefixo" Text="Prefixo" Checked='<%# Bind("IN_PREFIXO")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbTerminal" Text="Terminal" Checked='<%# Bind("IN_TERMINAL")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbCanal" Text="Canal" Checked='<%# Bind("IN_CANAL")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbServico" Text="Serviço" Checked='<%# Bind("IN_SERVICO")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  <asp:CheckBox runat="server" ID="cbLocalDes" Text="Local de desembarque" Checked='<%# Bind("IN_LOCAL_DES")%>' OnCheckedChanged="AtualizaQuebra" AutoPostBack="true"/><br />
                  </asp:Panel>
                </ContentTemplate>
                </asp:UpdatePanel>
              </div>
              <div id="divGerados" style="display:block;text-align:left;font-family:Verdana;">
                <asp:UpdatePanel ID="upGerados" runat="server" Visible="false">
                <ContentTemplate>
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;">                    
                  <asp:Panel ID="pnlGeradosSolicitar" runat="server" HorizontalAlign="Left">
                       <asp:Label runat="server" Text="Mês" Width="50px"/>
                       <asp:DropDownList runat="server" ID="ddlMes" Width="180px" DataSourceID="SqlMes" DataTextField="NOME_MES" DataValueField="NR_MES" class="textbox" SelectedValue='<%# Month(Now)%>' />&nbsp;&nbsp;
                       <asp:SqlDataSource ID="SqlMes" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
                       SelectCommand="SELECT 1  NR_MES, 'JANEIRO'   NOME_MES UNION
                                     SELECT 2  NR_MES, 'FEVEREIRO' NOME_MES UNION
                                     SELECT 3  NR_MES, 'MARÇO'     NOME_MES UNION
                                     SELECT 4  NR_MES, 'ABRIL'     NOME_MES UNION
                                     SELECT 5  NR_MES, 'MAIO'      NOME_MES UNION
                                     SELECT 6  NR_MES, 'JUNHO'     NOME_MES UNION
                                     SELECT 7  NR_MES, 'JULHO'     NOME_MES UNION
                                     SELECT 8  NR_MES, 'AGOSTO'    NOME_MES UNION
                                     SELECT 9  NR_MES, 'SETEMBRO'  NOME_MES UNION
                                     SELECT 10 NR_MES, 'OUTUBRO'   NOME_MES UNION
                                     SELECT 11 NR_MES, 'NOVEMBRO'  NOME_MES UNION
                                     SELECT 12 NR_MES, 'DEZEMBRO'  NOME_MES"/>
                      <asp:Label runat="server" Text="Ano  " Width="50px"/><asp:DropDownList runat="server" ID="ddlAno" Width="90px" DataSourceID="SqlAno" DataTextField="NR_ANO" DataValueField="NR_ANO" class="textbox" SelectedValue='<%# Year(Now)%>'/>&nbsp;&nbsp;
                      <asp:CheckBox runat="server" ID="cbUrgente" Text="Urgente"/><br />  
                      <asp:SqlDataSource ID="SqlAno" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                      SelectCommand="SELECT 2010 NR_ANO UNION
                                    SELECT 2011 NR_ANO UNION
                                    SELECT 2012 NR_ANO UNION
                                    SELECT 2013 NR_ANO UNION
                                    SELECT 2014 NR_ANO UNION
                                    SELECT 2015 NR_ANO UNION
                                    SELECT 2016 NR_ANO UNION
                                    SELECT 2017 NR_ANO UNION
                                    SELECT 2018 NR_ANO UNION
                                    SELECT 2019 NR_ANO "/>                                    
                      <asp:Label ID="lblEvento" runat="server" Text="Evento" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" CssClass="lbl" Width="50px"/>
                      <asp:TextBox ID="txtCdEvento" runat="server" CssClass="textbox" Width="40px" Text='' onBlur ="javascript:preencheNome('TEVENTO', 'CD_EVENTO', 'NM_EVENTO', this, 'frmMBFPersonaliza_txtNmEvento');" MaxLength="3"/>        
                      <asp:TextBox ID="txtNmEvento" runat="server" CssClass="textbox" Width="310px" ReadOnly="true" BackColor="#e6e9ec"/>
                      <img id="imgEvento" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Eventos','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EVENTO&nome=NM_EVENTO&tabela=TEVENTO','mbf_consulta_online', 424, 240,7);"/>&nbsp;
                      <asp:Button runat="server" ID="btnGerados" Text="OK" OnClick="AtualizaKPIGerados" Width="35px" BackColor="#FFFFFF" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#000000" Font-Size="10px" style="cursor:pointer;"/><br /><br />                                            
                  </asp:Panel>
                  <asp:Panel ID="pnlGerados" runat="server" ScrollBars="Vertical" Height="90px" Width="630px"  BorderColor="#808080" BorderWidth="1" BorderStyle="Solid">
                    <asp:GridView runat="server" DataSourceID="SqlGeradosKPI" Width="630px"
                      AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                      BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                      HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="10px" RowStyle-Height="19px"
                      AlternatingRowStyle-BackColor="#e6e9ec" 
                      CellPadding="0" HorizontalAlign="Center" 
                      RowStyle-HorizontalAlign="Center" style="border-right-width:0px" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false">
                    <AlternatingRowStyle BackColor="#E6E9EC" />
                    <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle HorizontalAlign="Left" />
                    <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="88px" BackColor="#e6e9ec"/>
                    <EmptyDataTemplate>       
                    <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="~/imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum KPI solicitado" Font-Bold="true"/>
                     </EmptyDataTemplate>                  
                    <Columns>                      
                      <asp:BoundField DataField="MES_SELECIONADO" HeaderText="Mês" SortExpression="MES_SELECIONADO" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/> 
                      <asp:BoundField DataField="ANO_SELECIONADO" HeaderText="Ano" SortExpression="ANO_SELECIONADO" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/> 
                      <asp:TemplateField HeaderText = "Gerado?" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                      <ItemTemplate>
                         <img src='\imagens\icones\16x16\checks\<%# Eval("IN_GERADO")%>.gif' width="16px" height="16px"/>
                      </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="DT_SOLICITADO" HeaderText=" Solicitado em " SortExpression="DT_SOLICITADO" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/>  
                      <asp:BoundField DataField="DT_GERADO" HeaderText=" Gerado em " SortExpression="DT_GERADO" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"/>                           
                       <asp:TemplateField HeaderText = " Evento (código) " ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                      <ItemTemplate>
                          <label title="<%# Eval("NM_EVENTO") %>"><%# Eval("CD_EVENTO")%></label>
                      </ItemTemplate>
                      </asp:TemplateField>  
                      <asp:TemplateField HeaderText = " " ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                      <ItemTemplate>
                          <asp:ImageButton runat="server" ImageUrl="\imagens\30\btn_delete.gif" OnCommand="DeletaSelecionado"  CommandArgument='<%# CStr(Eval("MES")) + ";" + CStr(Eval("ANO_SELECIONADO")) + ";" + CStr(Eval("CD_MBF")) + ";" + CStr(Eval("CD_USUARIO")) + ";" + CStr(Eval("CD_SELECIONADO"))%>' style="cursor:pointer;" OnClientClick="return deletarSelecionado();" ToolTip="Excluir"/>                            
                      </ItemTemplate>
                      </asp:TemplateField>                         
                    </Columns>                       
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlGeradosKPI" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                      SelectCommand="SELECT MASTER.DBO.FN_MONTHNAME_2(S.MES_SELECIONADO) AS MES_SELECIONADO, S.MES_SELECIONADO AS MES, S.ANO_SELECIONADO, CASE S.IN_GERADO WHEN '1' THEN '0' ELSE '1' END IN_GERADO, 
                                    CONVERT(VARCHAR, S.DT_SOLICITADO, 103) AS DT_SOLICITADO, CONVERT(VARCHAR, S.DT_GERADO, 103) AS DT_GERADO, S.CD_EVENTO, RTRIM(LTRIM(ISNULL(E.NM_EVENTO , ''))) AS NM_EVENTO, S.CD_MBF, S.CD_USUARIO, S.CD_SELECIONADO 
                                    FROM TMBF_SELECIONADO S (NOLOCK) 
                                    LEFT JOIN TEVENTO E (NOLOCK) ON E.CD_EVENTO = S.CD_EVENTO
                                    WHERE S.CD_MBF = @CD_MBF AND S.CD_USUARIO = @CD_USUARIO
                                    ORDER BY ANO_SELECIONADO DESC, MES DESC">
                    <SelectParameters>
                      <asp:QueryStringParameter Name="CD_MBF" QueryStringField="codigo" />
                      <asp:QueryStringParameter Name="CD_USUARIO" QueryStringField="usuario" />
                    </SelectParameters>        
                    </asp:SqlDataSource>
                  </asp:Panel>
                  </asp:Panel> 
                </ContentTemplate>
                </asp:UpdatePanel> 
              </div> 
              <br />
              <div id="divSimulacao" style="display:block;text-align:left;font-family:Verdana;">
                <asp:ImageButton ID="ibSimulacao" runat="server" ImageUrl="~/imagens/seta_exibe_d2.gif" style="vertical-align:bottom;"/> 
                <asp:LinkButton runat="server" ForeColor="#cd1414" Text="Simulação" Font-Overline="false" ID="lbSimulacao"/>                
                <asp:UpdatePanel ID="upSimulacao" runat="server" Visible="true">
                <ContentTemplate>
                  <br />
                  <asp:Panel runat="server" BorderColor="#d7d8d9" BorderStyle="Solid" BorderWidth="1px" style="padding:5px 5px 5px 5px;" >                    
                  <asp:Panel ID="pnlSimulacao" runat="server" ScrollBars="None"  Width="640px"  BorderColor="#808080" BorderWidth="1" BorderStyle="Solid">
                    <asp:GridView ID="grdSimulacao" runat="server" DataSourceID="SqlSimulacaoKPI" Width="640px"
                      AllowSorting="True" AutoGenerateColumns="False" BorderColor="#e6e9ec" BorderWidth="0px" 
                      BorderStyle="Solid" HeaderStyle-BackColor="#cd1414" HeaderStyle-CssClass="nounderline"
                      HeaderStyle-ForeColor="#FFFFFF"  Font-Names="Verdana" Font-Size="10px"
                      AlternatingRowStyle-BackColor="#e6e9ec" 
                      CellPadding="0" HorizontalAlign="Center" 
                      RowStyle-HorizontalAlign="Center" style="border-right-width:0px;padding-left:5px;padding-right:5px;" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Overline="false" >
                    <AlternatingRowStyle BackColor="#E6E9EC" />
                    <HeaderStyle BackColor="#CD1414" CssClass="nounderline" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle HorizontalAlign="Left" />
                    <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#e6e9ec"/>
                    <EmptyDataTemplate>       
                    <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="~/imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Nenhum KPI solicitado" Font-Bold="true"/>
                    </EmptyDataTemplate>                  
                    <Columns>                      
                      <asp:TemplateField HeaderText = "" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
                      <ItemTemplate>
                          <asp:Label runat="server" Text='<%# Eval("NM_KPI") %>'/><br />
                          <i><b><asp:Label runat="server" Text='<%# Eval("NM_QUEBRAS") %>'/></i></b>
                      </ItemTemplate>
                      </asp:TemplateField>                      
                      <asp:TemplateField HeaderText = "Meta" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                      <ItemTemplate>
                        <asp:TextBox runat="server" CssClass="textbox" Width='25px' Text='<%# Eval("NR_META") %>' ID="txtNrMeta" onkeypress="return SomenteNumero(event);"/>
                      </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText = "" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="30px"> 
                      <ItemTemplate>
                        <asp:Button runat="server" Text="OK" OnCommand="AtualizaMeta"  CommandArgument='<%# CStr(Eval("CD_RESULTADO")) + ";" + CStr(Eval("CODIGO")) + ";" + CStr(Eval("CD_MODAL")) + ";" + CStr(Eval("CD_ESTUFAGEM")) + ";" + CStr(Eval("CD_KPI")) + ";" + CStr(Eval("TP_KPI")) + ";" + CStr(Eval("NM_TP_KPI")) + ";" + CStr(Eval("ID_KPI")) + ";" + CStr(Eval("CD_LI")) %>' Width="21px" Height="16px" BackColor="#FFFFFF" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#000000" Font-Size="10px" style="cursor:pointer;" ToolTip="Atualizar meta"/>       
                      </ItemTemplate>
                      </asp:TemplateField>
                    </Columns>                       
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlSimulacaoKPI" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
                      SelectCommand="SELECT NM_COMPLETO, NM_KPI, NM_QUEBRAS, NR_META, ISNULL(CD_MODAL,'') CD_MODAL, ISNULL(CD_ESTUFAGEM, '') CD_ESTUFAGEM,  ISNULL(CD_LI, '') CD_LI, 
                                    ISNULL(CD_KPI, '') CD_KPI, ISNULL(TP_KPI, '') TP_KPI, ISNULL(NM_TP_KPI,'') AS NM_TP_KPI, ISNULL(CD_RESULTADO, '') CD_RESULTADO, DENSE_RANK() OVER (ORDER BY CD_RESULTADO, NM_COMPLETO) AS CODIGO, ID_KPI 
                                    FROM TMBF_RESULTADO (NOLOCK) 
                                    WHERE CD_MBF = @CD_MBF
                                      AND CD_USUARIO = @CD_USUARIO
                                      AND NR_PROCESSO = '9999XX-9999-99'
                                    GROUP BY NM_COMPLETO, NM_KPI, NM_QUEBRAS, NR_META, CD_MODAL, CD_ESTUFAGEM, CD_LI, CD_KPI, TP_KPI, NM_TP_KPI, ID_KPI, CD_RESULTADO
                                    ORDER BY CD_RESULTADO, NM_KPI, NM_QUEBRAS">
                    <SelectParameters>
                      <asp:QueryStringParameter Name="CD_MBF" QueryStringField="codigo" />
                      <asp:QueryStringParameter Name="CD_USUARIO" QueryStringField="usuario" />
                    </SelectParameters>        
                    </asp:SqlDataSource>
                  </asp:Panel>
                  </asp:Panel> 
                </ContentTemplate>
                </asp:UpdatePanel>
              </div>
            </ContentTemplate>
            </asp:UpdatePanel>    
          </div>
        </div>        
      </EditItemTemplate>
      </asp:FormView>
      <asp:SqlDataSource ID="SqlMBFPersonaliza" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
        SelectCommand="SELECT CD_MBF, NM_MBF, CD_USUARIO, CD_GRUPO, CD_PRODUTO, 
                       IN_MODAL, IN_CNPJ, IN_AREA, IN_ESTUFAGEM, IN_DESVIOS, IN_DECIMAL,
                       IN_LI, IN_PAIS_ORIGEM, IN_PREFIXO, IN_TERMINAL, IN_CANAL, IN_SERVICO, IN_LOCAL_DES,
                       IN_META, IN_LEGENDA_META, QTDE_MESES_GRAFICO, IN_GRAFICO_PROC_ABERTOS, IN_UTEIS_CORRIDOS, IN_COM_SEM_DESVIOS 
                       FROM TMBF_INFO (NOLOCK) 
                       WHERE CD_MBF = @CD_MBF AND CD_USUARIO = @CD_USUARIO">   
      <SelectParameters>
        <asp:QueryStringParameter Name="CD_MBF" QueryStringField="codigo" />
        <asp:QueryStringParameter Name="CD_USUARIO" QueryStringField="usuario" />
      </SelectParameters>        
      </asp:SqlDataSource>
    </div>
    <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;">
      <asp:LinkButton ID="lbVoltar" runat="server" OnClick="VoltarMenu"><img src="../../imagens/voltar1.gif" style="border:0px" alt=""/></asp:LinkButton>
    </div>
    <div style="bottom:2px;height:20px;position:absolute;right:5px"> <script type="text/javascript"> TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>  
  </form>
</body>
</html>
