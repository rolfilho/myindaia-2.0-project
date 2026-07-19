<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Import Namespace="GridViewHelper" %>
<%@ Import Namespace="GridViewHelper.GridViewHelper" %>
<%@ Import Namespace="GridViewHelper.GridViewGroup" %>
<%@ Import Namespace="GridViewHelper.GridViewGroupList" %>
<%@ Page Language="VB" Debug="true"%>
<%  Response.CacheControl = "no-cache"%>
<%  Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">
    Dim SqlAux As String
    
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim contador_permissao As Integer
        Dim txtProduto As HiddenField = frmDigitalizacaoPrincipal.FindControl("txtProduto")
        Dim Helper As vbHtmlGridHelper.GridViewHelper = New vbHtmlGridHelper.GridViewHelper(grdArquivos)
        
        If Trim(Request("usuario")) <> "" or Trim(Request("produto")) <> "" Then
            Session("usuario") = Request("usuario")
            Session("produto") = Request("produto")        
        End If
        
        If Trim(Request("usuario")) = "" or Trim(Request("produto")) = "" Then
            Response.Redirect("..\autentica.asp?tx_erro=")
        End If
        
        txtProduto.Value = Request("produto")
        Session("cd_unid_neg") = ""
        Session("cd_cargo") = ""
        SqlAux = " SELECT U.NM_USUARIO AS USUARIO, U.CD_CARGO, C.IN_INTERNO, U.NM_EMAIL, ISNULL(G.IN_ENVIA_COMO_TI,'0')  IN_ENVIA_COMO_TI" & _
        " FROM TUSUARIO U (NOLOCK)" & _
        "  INNER JOIN TCARGO C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO " & _
        "  LEFT JOIN TPERMISSAO_GRUPO PG (NOLOCK) ON PG.CD_USUARIO = U.CD_USUARIO" & _
        "  LEFT JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = PG.CD_GRUPO AND PG.IN_ATIVO = '1'" & _
        " WHERE U.CD_USUARIO = '" & Session("usuario") & "' "
        
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CnnAux.Open()
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
                
        If Not RsAux.HasRows Then
            RsAux.Close()
            CnnAux.Close()
            Session("status") = ""
            Response.Redirect("..\autentica.asp?tx_erro=")
        Else
            RsAux.Read()
            Session("nm_usuario") = RsAux("USUARIO")
            Session("cd_cargo") = RsAux("CD_CARGO")
            Session("in_interno") = RsAux("IN_INTERNO")
            Session("nm_email") = RsAux("NM_EMAIL")
            Session("in_envia_como_ti") = RsAux("IN_ENVIA_COMO_TI")
            RsAux.Close()
            CnnAux.Close()
            
            If Session("in_envia_como_ti") = "1" Then
                Session("nm_email") = "ti@myindaia.com.br"
            End If
            
            If InStr("040;055;080", Session("cd_cargo")) > 0 Then
                SqlAux = "SELECT TOP 1 C.CD_UNID_NEG FROM TCLIENTE_HABILITACAO C (NOLOCK)" & _
                " INNER JOIN TPERMISSAO P (NOLOCK) ON P.CD_CLIENTE = C.CD_CLIENTE " & _
                " WHERE P.CD_USUARIO = '" & Session("usuario") & "'" & _
                " AND C.IN_ATIVO = '1' AND C.CD_PRODUTO = '" & Session("produto") & "'"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                If Not RsAux.HasRows Then
                    Session("cd_unid_neg") = "01"
                Else
                    RsAux.Read()
                    Session("cd_unid_neg") = RsAux("CD_UNID_NEG")
                End If
            Else
                SqlAux = "SELECT U.CD_UNID_NEG FROM TUSUARIO_HABILITACAO U (NOLOCK)" & _
               " WHERE U.CD_USUARIO = '" & Session("usuario") & "'" & _
               " AND U.IN_ATIVO = '1' AND U.IN_DEFAULT = '1'"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                RsAux = CmdAux.ExecuteReader
                If Not RsAux.HasRows Then
                    Session("cd_unid_neg") = "01"
                Else
                    RsAux.Read()
                    Session("cd_unid_neg") = RsAux("CD_UNID_NEG")
                End If
            End If
        End If
        CnnAux.Close()
        RsAux.Close()
        
        If Trim(Request("retorno")) <> "" And Session("in_interno") = "0" Then
            If InStr(Request("retorno"), "ID0") > 0 Then
                SqlAux = "SELECT COUNT(*) AS CONTADOR" & _
                "FROM TINSTRUCAO_DESEMBARACO I" & _
                "INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = I.CD_CLIENTE" & _
                "INNER JOIN TPERMISSAO_GRUPO PG ON PG.CD_GRUPO = E.CD_GRUPO" & _
                "WHERE I.ID_CODIGO = '" & Request("retorno") & "'" & _
                " AND PG.CD_USUARIO = '" & Session("usuario") & "'" & _
                " AND PG.IN_ATIVO = '1'"
            Else
                If Session("cd_cargo") = "088" Then
                    SqlAux = "SELECT COUNT(*) AS CONTADOR" & _
                    " FROM TPROCESSO P" & _
                    " LEFT JOIN TPERMISSAO_EMPRESA_EST PG ON PG.CD_EMPRESA = P.CD_IMPORTADOR" & _
                    " WHERE P.NR_PROCESSO = '" & Request("retorno") & "'" & _
                    "   AND PG.CD_USUARIO = '" & Session("usuario") & "'" & _
                    "   AND PG.IN_ATIVO = '1'"
                Else
                    SqlAux = "SELECT COUNT(*) AS CONTADOR" & _
                    " FROM TPROCESSO P" & _
                    " LEFT JOIN TPERMISSAO_GRUPO PG ON PG.CD_GRUPO = P.CD_GRUPO" & _
                    " WHERE P.NR_PROCESSO = '" & Request("retorno") & "'" & _
                    "   AND PG.CD_USUARIO = '" & Session("usuario") & "'" & _
                    "   AND PG.IN_ATIVO = '1'"
                End If
            End If
            
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            contador_permissao = RsAux("CONTADOR")
            CnnAux.Close()
            RsAux.Close()
            
            If contador_permissao = 0 Then
                Response.Redirect("digitalizacao_principal_i.aspx?&produto=" & Session("produto") & "&usuario=" + Session("usuario") + "&pg=1")
            End If
        End If
        
        Helper.RegisterGroup("TIPO", True, True)
        AddHandler Helper.GroupHeader, AddressOf helper_GroupHeader
        Helper.ApplyGroupSort()
    End Sub
    
    Private Sub helper_GroupHeader(ByVal groupName As String, ByVal values() As Object, ByVal row As GridViewRow)
        row.BackColor = System.Drawing.ColorTranslator.FromHtml("#fab642")
        row.Cells(0).Text = row.Cells(0).Text
        row.Cells(0).Height = 22
        row.Cells(0).ForeColor = Drawing.Color.White
        row.Cells(0).Font.Size = 8
    End Sub
   
    Sub VoltarMenu(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("usuario") = ""
        Session("nm_usuario") = ""
        Session("cd_menu") = ""
        Response.Redirect("/default.asp")
    End Sub
    
    Function GetFileExt(ByVal sFileName As String) As String
        Dim P As Integer
        For P = Len(sFileName) To 1 Step -1
            If InStr(".", Mid(sFileName, P, 1)) Then Exit For
        Next
        GetFileExt = Right(sFileName, Len(sFileName) - P)
    End Function

    
    Function NomeArquivoPara(ByVal APrefixo As String, ByVal AExt As String, ByVal AProcesso As String, ByVal ADiretorio As String) As String
        Dim SqlAux As String
        Dim A As Integer
        Dim NomeArquivo, S, D As String
        
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
        Do Until Not File.Exists(ADiretorio + "\" + AProcesso + "\" + NomeArquivo + AExt)
            A = A + 1
            NomeArquivo = APrefixo + Right("0" + CStr(A), 2)
        Loop
        NomeArquivo = UCase(NomeArquivo + AExt)
        CnnAux.Close()
        CmdAux.Dispose()
        RsAux.Close()
        Return NomeArquivo
    End Function
    
    Sub EnviarArquivo(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim NrProcesso As String = Request.QueryString("retorno")
        Dim txtArquivo As TextBox = frmDigitalizacaoPrincipal.FindControl("txtArquivo")
        Dim ddlTpArquivo As DropDownList = frmDigitalizacaoPrincipal.FindControl("ddlTpArquivo")
        Dim fuArquivos As FileUpload = frmDigitalizacaoPrincipal.FindControl("fuArquivos")
        Dim NomeArquivo, PrefixoArquivo, diretorio_docs, diretorio, tabela As String
        diretorio_docs = ""
        SqlAux = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" + NrProcesso + "',0) AS RESULTADO "
        Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
        If RsAux.HasRows Then
            RsAux.Read()
            diretorio_docs = RsAux("RESULTADO").ToString
        End If
        RsAux.Close()
        CnnAux.Close()
        
        tabela = "1652005462"
        If Request("retorno") <> "" Then
            If InStr(Request("retorno"), "ID0") > 0 Then
                tabela = "1225680060"
            Else
                tabela = "1652005462"
            End If
        End If
        
        diretorio = Server.MapPath("\" + diretorio_docs)
        Dim Dir As DirectoryInfo = New DirectoryInfo(diretorio + "\" + NrProcesso + "\")
        SqlAux = " SELECT NM_PREFIXO_ARQ FROM TTP_DOCTO_DIGITALIZADO  (NOLOCK) " & _
        " WHERE ID_TABELA = " & tabela & " AND CD_PRODUTO IN ('" & Session("produto") & "', 'AM') " & _
        " AND CD_TIPO_DOCTO = '" & ddlTpArquivo.SelectedItem.Value & "' "
        'Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        
        PrefixoArquivo = ""
        If RsAux.HasRows Then
            RsAux.Read()
            PrefixoArquivo = RsAux("NM_PREFIXO_ARQ").ToString
        End If
        RsAux.Close()
        CnnAux.Close()
        
        NomeArquivo = NomeArquivoPara(PrefixoArquivo, "." + GetFileExt(fuArquivos.PostedFile.FileName), NrProcesso, diretorio)
        'Response.Write(Dir.ToString + NomeArquivo)
        'Response.end
        If PrefixoArquivo <> "" Then
            If Not Dir.Exists Then
                Dir.Create()
            End If
            fuArquivos.SaveAs(Dir.ToString + NomeArquivo)
            Dim Arq As FileInfo = New FileInfo(diretorio + "\" + NrProcesso + "\" + NomeArquivo)
            If Arq.Exists Then
                SqlAux = " INSERT TPROCESSO_DOCTOS (NR_PROCESSO,CD_TIPO_DOCTO,NM_DESCRICAO,NM_ARQUIVO,CD_USUARIO_CRIACAO,ID_TABELA) " & _
                    " VALUES ('" & NrProcesso & "', '" & ddlTpArquivo.SelectedItem.Value & "', '" & txtArquivo.Text & "', '" & NomeArquivo & "', '" & Session("usuario") & "', " & tabela & " )"
                'CnnAux = New SqlConnection(Cnn)
                CmdAux = New SqlCommand(SqlAux, CnnAux)
                CnnAux.Open()
                CmdAux.ExecuteNonQuery()
                CmdAux.Dispose()
                CnnAux.Close()
                Page.DataBind()
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='digitalizacao_principal_i.aspx?produto=" + Session("produto") + "&usuario=" + Session("usuario") + "&pg=3&retorno=" & NrProcesso & "';", True)
            Else
                Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATTENTION: Error when trying to send the file!');location.href='digitalizacao_principal_i.aspx?produto=" + Session("produto") + "&usuario=" + Session("usuario") + "&pg=3&retorno=" & NrProcesso & "';", True)
            End If
        Else
            Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATTENTION: Error when trying to send the file!');location.href='digitalizacao_principal_i.aspx?produto=" + Session("produto") + "&usuario=" + Session("usuario") + "&pg=3&retorno=" & NrProcesso & "';", True)
        End If
    End Sub
    
    Sub EnviarEmail(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtEmail As TextBox = frmDigitalizacaoPrincipal.FindControl("txtEmail")
        Dim txtAssunto As TextBox = frmDigitalizacaoPrincipal.FindControl("txtAssunto")
        Dim txtMensagem As TextBox = frmDigitalizacaoPrincipal.FindControl("txtMensagem")
        Dim txtAnexo As HiddenField = frmDigitalizacaoPrincipal.FindControl("txtAnexo")
        Dim contador_email, I As Integer
        Dim vAnexo, vEmail, strBody As String
        Dim vEmailArray As Array
        Dim NrProcesso As String = Request.QueryString("retorno")
        
        vEmail = txtEmail.Text
        If Right(Trim(vEmail), 1) <> ";" Then
            vEmail = vEmail + ";"
        End If
        
        vEmailArray = Split(vEmail, ";")
        vAnexo = Server.MapPath("\" + Replace(txtAnexo.Value, "/", "\"))
                
        For I = 0 To UBound(vEmailArray) - 1
            SqlAux = " SELECT COUNT(*) CONTADOR FROM TEMAIL_FAVORITOS WHERE CD_USUARIO = '" & Session("usuario") & "'" & _
                     " AND UPPER(RTRIM(LTRIM(NM_EMAIL_FAVORITO))) = UPPER('" & vEmailArray(I) & "')"
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
        
            contador_email = RsAux("CONTADOR")
            CnnAux.Close()
            CmdAux.Dispose()
            RsAux.Close()
        
            If contador_email = 0 Then
                SqlArquivos.InsertCommand = "INSERT INTO TEMAIL_FAVORITOS VALUES ('" & Session("usuario") & "', '" & vEmailArray(I) & "')"
                SqlArquivos.Insert()
            End If
        Next
        
        Dim objEmail As New System.Net.Mail.MailMessage()
        objEmail.From = New System.Net.Mail.MailAddress(Session("nm_email"))
        
        For I = 0 To UBound(vEmailArray) - 1
            objEmail.To.Add(vEmailArray(I))
        Next
            
        objEmail.Priority = System.Net.Mail.MailPriority.Normal
        objEmail.IsBodyHtml = True
        Dim vAnexoEmail = New System.Net.Mail.Attachment(vAnexo, System.Net.Mime.MediaTypeNames.Application.Octet)
        objEmail.Attachments.Add(vAnexoEmail)
        objEmail.Subject = "[myIndaiáWeb Mail] " + txtAssunto.Text
        
        strBody = "<html>"
        strBody = strBody + "<body style=''font-family:Calibri;''>"
        strBody = strBody + "<IMG SRC=https://www.myindaiaweb.com.br/imagens/logo2012_2.jpg><br>"
        strBody = strBody + "<IMG SRC=https://www.myindaiaweb.com.br/imagens/barra_tracking.gif><br><br>"
        strBody = strBody + txtMensagem.Text
        strBody = strBody + "<br></body></html>"
        
        objEmail.Body = strBody
        
        objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")
        objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")
        Dim objSmtp As New System.Net.Mail.SmtpClient
        'objSmtp.Host = "smtp.indaialogistica.com.br"
        'objSmtp.Host = "smtp-m.myindaia.com.br"
        'objSmtp.Port = 587
        'objSmtp.Credentials = New System.Net.NetworkCredential("ti@myindaia.com.br", "789852")
        'objSmtp.Send(objEmail)
        'objEmail.Dispose()
        objSmtp.Host = "email-smtp.us-east-1.amazonaws.com"
        objSmtp.Port = 587
        objSmtp.EnableSsl = True
        objSmtp.UseDefaultCredentials = False
        objSmtp.Credentials = New System.Net.NetworkCredential("AKIAIXMINU4FHLKYYA4Q", "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f")
        objSmtp.Send(objEmail)
        objEmail.Dispose()
        
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='digitalizacao_principal_i.aspx?produto=" + Session("produto") + "&usuario=" + Session("usuario") + "&pg=2&retorno=" & NrProcesso & "';", True)
    End Sub
    
    Sub EnviarEmailSelecionados(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtEmail As TextBox = frmDigitalizacaoPrincipal.FindControl("txtEmail")
        Dim txtAssunto As TextBox = frmDigitalizacaoPrincipal.FindControl("txtAssunto")
        Dim txtMensagem As TextBox = frmDigitalizacaoPrincipal.FindControl("txtMensagem")
        Dim txtAnexoSelecionado As HiddenField = frmDigitalizacaoPrincipal.FindControl("txtAnexoSelecionado")
        Dim contador_email, I As Integer
        Dim vAnexo, vEmail, strBody As String
        Dim vEmailArray, vAnexoArray As Array
        Dim NrProcesso As String = Request.QueryString("retorno")
        
        vEmail = txtEmail.Text
        If Right(Trim(vEmail), 1) <> ";" Then
            vEmail = vEmail + ";"
        End If
        
        vEmailArray = Split(vEmail, ";")
        vAnexoArray = Split(txtAnexoSelecionado.Value, ";")
        
        
        
        For I = 0 To UBound(vEmailArray) - 1
            SqlAux = " SELECT COUNT(*) CONTADOR FROM TEMAIL_FAVORITOS WHERE CD_USUARIO = '" & Session("usuario") & "'" & _
                     " AND UPPER(RTRIM(LTRIM(NM_EMAIL_FAVORITO))) = UPPER('" & vEmailArray(I) & "')"
            Dim CnnAux As SqlConnection = New SqlConnection(Cnn)
            Dim CmdAux As SqlCommand = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            Dim RsAux As SqlDataReader = CmdAux.ExecuteReader
            RsAux.Read()
        
            contador_email = RsAux("CONTADOR")
            CnnAux.Close()
            CmdAux.Dispose()
            RsAux.Close()
        
            If contador_email = 0 Then
                SqlArquivos.InsertCommand = "INSERT INTO TEMAIL_FAVORITOS VALUES ('" & Session("usuario") & "', '" & vEmailArray(I) & "')"
                SqlArquivos.Insert()
            End If
        Next
                
        Dim objEmail As New System.Net.Mail.MailMessage()
        objEmail.From = New System.Net.Mail.MailAddress(Session("nm_email"))
        
        For I = 0 To UBound(vEmailArray) - 1
            objEmail.To.Add(vEmailArray(I))
        Next
            
        objEmail.Priority = System.Net.Mail.MailPriority.Normal
        objEmail.IsBodyHtml = True
        
        For I = 0 To UBound(vAnexoArray) - 1
            vAnexo = Server.MapPath("\" + Replace(vAnexoArray(I), "/", "\"))
            objEmail.Attachments.Add(New System.Net.Mail.Attachment(vAnexo, System.Net.Mime.MediaTypeNames.Application.Octet))
        Next
        
        objEmail.Subject = "[myIndaiáWeb Mail] " + txtAssunto.Text
        
        strBody = "<html>"
        strBody = strBody + "<body style=''font-family:Calibri;''>"
        strBody = strBody + "<IMG SRC=https://www.myindaiaweb.com.br/imagens/logo2012_2.jpg><br>"
        strBody = strBody + "<IMG SRC=https://www.myindaiaweb.com.br/imagens/barra_tracking.gif><br><br>"
        strBody = strBody + txtMensagem.Text
        strBody = strBody + "<br></body></html>"
        
        objEmail.Body = strBody
        
        objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")
        objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")
        Dim objSmtp As New System.Net.Mail.SmtpClient
        'objSmtp.Host = "smtp.indaialogistica.com.br"
        'objSmtp.Host = "smtp-m.myindaia.com.br"
        'objSmtp.Port = 587
        'objSmtp.Credentials = New System.Net.NetworkCredential("ti@myindaia.com.br", "789852")
        'objSmtp.Send(objEmail)
        'objEmail.Dispose()
        objSmtp.Host = "email-smtp.us-east-1.amazonaws.com"
        objSmtp.Port = 587
        objSmtp.EnableSsl = True
        objSmtp.UseDefaultCredentials = False
        objSmtp.Credentials = New System.Net.NetworkCredential("AKIAIXMINU4FHLKYYA4Q", "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f")
        objSmtp.Send(objEmail)
        objEmail.Dispose()
        
        Page.DataBind()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='digitalizacao_principal_i.aspx?produto=" + Session("produto") + "&usuario=" + Session("usuario") + "&pg=2&retorno=" & NrProcesso & "';", True)
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
                alert("ATTENTION: Data inválida!");
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
            if (n == 0) alert(str + " is not on this page.");
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
                    alert(str + " is not on this page.");
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
                    ajax.open("GET", "/popup/fast_lookup.asp?vTabela=" + vTabela + "&vCampos=" + vCampos + "&vReturn=" + vReturn + "&vCodigo=" + vCod, true);
                    ajax.onreadystatechange = function () {
                        if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                            vDesc.value = "LOADING...";
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
                                    alert('ATTENTION: Invalid Code!!\nUse the query to find the correct code.');
                                    vCodigo.style.background = 'red';
                                    vDesc.value = "";
                                }
                            } else {
                                alert('An unknown error occurred, please contact ti@myindaia.com.br!');
                                vDesc.value = "";
                            }
                        }
                    }
                    ajax.send(null); // submete
                }
                else if (vCod != '') {
                    alert('An unknown error occurred, please contact ti@myindaia.com.br!');
                    vDesc.value = ""
                }
            }
        }
    }

    
    function ExibeDetalhes(titulo, vDiv, vDiv2, vDiv3, vFeatures, arquivo, width, height, posicao, posicao2) {
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
            vInfo.style.left = w / 2 - posicao;
            vInfo.style.top = z / 2 + 10 + posicao2;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - posicao;
            vCorpo.style.top = (z / 2) + 50 + posicao2;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("GET", arquivo + ".aspx?" + vFeatures, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 1) {
                    vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:45%;'><center><img src='/imagens/30/loading_laranja.gif'></center></div>";
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
    }



    function enviaValor(valor, tabela, campo) {
        var str = document.getElementById(campo).value;
        if (tabela == 'TEMAIL_FAVORITOS') {
            if (str != Trim(valor) && str.indexOf(valor) < 0) {
                document.getElementById(campo).value = document.getElementById(campo).value + Trim(valor) + ';';
            }
        }else{
            document.getElementById(campo).value = Trim(valor);
        }
        document.getElementById(campo).focus();
        document.getElementById(campo).blur();
        FechaDetalhes('divInfoCorpo', 'divInfo');
    }

    function carregaTelas(div1, div2, div3) {
        document.getElementById(div1 + 'Cabec').style.backgroundColor = '#f8a310';
        document.getElementById(div1 + 'Link').style.color = '#FFFFFF';
        document.getElementById(div1 + 'Link').style.cursor = "default";
        document.getElementById(div1 + 'Principal').style.display = 'block';

        document.getElementById(div2 + 'Cabec').style.backgroundColor = '#FFFFFF';
        document.getElementById(div2 + 'Link').style.color = '#f8a310';
        document.getElementById(div2 + 'Link').style.cursor = "pointer";
        document.getElementById(div2 + 'Principal').style.display = 'none';

        document.getElementById(div3 + 'Cabec').style.backgroundColor = '#FFFFFF';
        document.getElementById(div3 + 'Link').style.color = '#f8a310';
        document.getElementById(div3 + 'Link').style.cursor = "pointer";
        document.getElementById(div3 + 'Principal').style.display = 'none';

        if (div1 == 'divDigitalizacao') {
            document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').value = '<%=Session("cd_unid_neg") %>';
            document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').onblur();
            document.getElementById('frmDigitalizacaoPrincipal_txtNrProcesso').focus();
        }
    }

    function desabilitaCampo(id) {
        document.getElementById(id).value = '';        
        document.getElementById(id).disabled = true;
        document.getElementById(id).style.backgroundColor = "#f4d296";
        document.getElementById(id).readOnly = true;
    }

    function habilitaCampo(id) {
        document.getElementById(id).disabled = false;
        document.getElementById(id).style.backgroundColor = "#FFFFFF";
        document.getElementById(id).readOnly = false;
    }

    function selecionaOpcao(objeto) {       
        if (objeto.id == 'frmDigitalizacaoPrincipal_chkPedido') {
            document.getElementById('frmDigitalizacaoPrincipal_chkProcesso').checked = false;

            //campo unidade
            desabilitaCampo('frmDigitalizacaoPrincipal_txtCdUnidade');
            document.getElementById('frmDigitalizacaoPrincipal_txtNmUnidade').value = '';
            document.getElementById('imgUnidade').disabled = true;

            //campo processo
            desabilitaCampo('frmDigitalizacaoPrincipal_txtNrProcesso');
            document.getElementById('imgProcesso').disabled = true;

            //campo id
            desabilitaCampo('frmDigitalizacaoPrincipal_txtID');
            document.getElementById('imgID').disabled = true;

            //habilita campos do pedido
            habilitaCampo('frmDigitalizacaoPrincipal_txtCdCliente');
            document.getElementById('imgCliente').disabled = false;
            habilitaCampo('frmDigitalizacaoPrincipal_txtNrPedido');
            document.getElementById('imgPedido').disabled = false;
        } else {
            document.getElementById('frmDigitalizacaoPrincipal_chkPedido').checked = false;

            //campo cliente
            desabilitaCampo('frmDigitalizacaoPrincipal_txtCdCliente');
            document.getElementById('frmDigitalizacaoPrincipal_txtNmCliente').value = '';
            document.getElementById('imgCliente').disabled = true;

            //campo pedido
            desabilitaCampo('frmDigitalizacaoPrincipal_txtNrPedido');
            document.getElementById('imgPedido').disabled = true;

            //habilita campos do pedido
            habilitaCampo('frmDigitalizacaoPrincipal_txtCdUnidade');
            document.getElementById('imgUnidade').disabled = false;
            habilitaCampo('frmDigitalizacaoPrincipal_txtNrProcesso');
            document.getElementById('imgProcesso').disabled = false;
            habilitaCampo('frmDigitalizacaoPrincipal_txtID');
            document.getElementById('imgID').disabled = false;
        }
    }

    function retornaProcesso(pedido, cliente) {        
        var retorno, vResult;
        var objeto = document.getElementById('frmDigitalizacaoPrincipal_txtNrProcessoHidden');
        var ajax = openAjax();
        ajax.open("GET", "digitalizacao_retorna_pedido.aspx?pedido=" + pedido + "&cliente=" + cliente, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    document.location = 'digitalizacao_principal_i.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=2&retorno=' + vResult;
                }
            }
        }
        ajax.send(null);                  
    }

    function verificaPedido(pedido, unid_neg, cliente, produto, campo, tipo) {
        var retorno;
        if (document.getElementById(campo).value != '') {
            var ajax = openAjax();
            ajax.open("GET", "digitalizacao_verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&produto=" + produto + "&campo=" + campo, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vResult = vResult.replace(/\+/g, " ");
                        vResult = unescape(vResult);
                        //alert(vResult);
                        if (vResult == "2") {
                            alert("ATTENTION: Customer Order/Indaia #/ID invalid!");
                            document.getElementById(campo).focus();
                        } else {
                            if (vResult == "1") {
                                alert("ATTENTION: Customer Order duplicate.\nPlease fill the field 'Customer Order'!");
                                document.getElementById(campo).focus();
                            } else {
                                if (tipo == '1') {
                                    retorno = unid_neg + produto + pedido;
                                    document.location = 'digitalizacao_principal_i.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=2&retorno=' + retorno;
                                }
                                if (tipo == '2') {
                                    retorno = pedido;
                                    document.location = 'digitalizacao_principal_i.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=2&retorno=' + retorno;
                                }
                                if (tipo == '3') {
                                    retornaProcesso(pedido, cliente);                                    
                                }                                                                
                            }
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function mostraEmail(arquivo) {
        if (arquivo != '' && document.getElementById('frmDigitalizacaoPrincipal_txtAnexoSelecionado').value != "") {
            alert("ATENÇÃO: Use the option: 'Send file(s) selected by e-mail'!");
        } else {
            document.getElementById('divgrdArquivos').disabled = true;

            if (arquivo == '') {
                document.getElementById('frmDigitalizacaoPrincipal_btnArquivosEmail').style.display = 'none';
                document.getElementById('frmDigitalizacaoPrincipal_btnArquivosEmailSelecionados').style.display = 'block';
            } else {
                document.getElementById('frmDigitalizacaoPrincipal_btnArquivosEmailSelecionados').style.display = 'none';
                document.getElementById('frmDigitalizacaoPrincipal_btnArquivosEmail').style.display = 'block';
                document.getElementById('frmDigitalizacaoPrincipal_txtAnexo').value = arquivo;
            }
            vInfoEmail = document.getElementById('divInfoCorpoEmail');

            vInfoEmail.style.width = 400;
            vInfoEmail.style.height = 142;
            vInfoEmail.style.left = 150;
            vInfoEmail.style.top = 120;
            vInfoEmail.style.display = "block";
            vInfoEmail.style.filter = "alpha(opacity=95)";
        }
    }

    function fechaEmail() {
        vInfoEmail = document.getElementById('divInfoCorpoEmail');
        vInfoEmail.style.display = "none";
        document.getElementById('divgrdArquivos').disabled = false;
    }

    function preencheSelecionados(objeto, arquivo) {
        var str = document.getElementById('frmDigitalizacaoPrincipal_txtAnexoSelecionado').value;
        str = str.replace(arquivo+';','');
        if (objeto.checked) {
            document.getElementById('frmDigitalizacaoPrincipal_txtAnexoSelecionado').value = str + arquivo + ';';
        } else {
            document.getElementById('frmDigitalizacaoPrincipal_txtAnexoSelecionado').value = str;
        }
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
	border: solid 2px #f8a310;
	background-color: #f4d296;
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
	border-color:#f8a310;
	background-color: #f4d296;
	margin: 0 auto;
}

.divDetalhes3 {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	z-index: 2;
	overflow: auto;
	border-width:2px 2px 2px 2px;
	border-style:solid;
	border-color:#f8a310;
	background-color: #f4d296;
	margin: 0 auto;
}

.divDetalhes2 {
	background-color:#f4d296;
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
	scrollbar-track-color: #feedce;
	scrollbar-arrow-color: #f8a310;
	scrollbar-shadow-color: #f4d296;
	scrollbar-3dlight-color: #f4d296;
	scrollbar-highlight-color: #f4d296;
	scrollbar-darkshadow-color: #f4d296;
	overflow:hidden;
}

.textbox{ 
Font-size:10px; 
Font-family:Verdana; 
border-color:#f8a310;
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
color:#f8a310;
cursor:pointer;
}

.divDados{
width:600px;
height:14px;
font-size:11px;
font-weight:bold;
text-align:center;
color:#f4d296;
}

</style>
    <title>MyIndaiá Web System - Version 3.00.00</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script> 
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%" onload="if('<%= Request("pg")%>'==1){carregaTelas('divDigitalizacao','divArquivos','divUpload');}if('<%= Request("pg")%>'==2){carregaTelas('divArquivos','divDigitalizacao','divUpload');}if('<%= Request("pg")%>'==3){carregaTelas('divUpload','divArquivos','divDigitalizacao');}">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_digitalizacao2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
	<tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
    </table><!--<div><img src="../../imagens/cabec_logos3.gif"/></div>-->   
    <form ID="frmDigitalizacao" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:-710px">
    <asp:ScriptManager ID="smDigitalizacao" runat="server"/>
    <div id="divEdita" style="border-width:0px;position:absolute;top:100px;">
    <asp:FormView ID="frmDigitalizacaoPrincipal" runat="server" DataKeyNames="NR_PROCESSO" DataSourceID="SqlDigitalizacaoPrincipal" BorderWidth="0px" DefaultMode="Edit">
    <EmptyDataTemplate>
     <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#f8a310;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/30/btn_fechar24.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f4d296;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeydown="if(event.keyCode == 13){findInPage(txtPesquisa.value)};"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div>  
    <div id="divInfoCorpo" class="divDetalhes"></div>   
    <div id="divInfoCorpoEmail" class="divDetalhes3" style="padding-left:20px;"> 
      <div id="divTituloEmail" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;width:355px;"></div>       
      <div style="right:0;width:18px;"><a href="#" onclick="fechaEmail();"><img src="/imagens/30/btn_fechar25.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
      <asp:Label ID="lblEmail" runat="server" Text="To" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="68px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtEmail" Height="25px" TextMode="MultiLine" runat="server" CssClass="textbox" Width="270px" style="text-transform:none;"/> 
      <img id="imgEmail" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Favorites','divInfoCorpo','divInfo','divInfoRodape','codigo=NM_EMAIL_FAVORITO&nome=NM_EMAIL_FAVORITO&tabela=TEMAIL_FAVORITOS&usuario=<%=Session("usuario")%>&campo=frmDigitalizacaoPrincipal_txtEmail','digitalizacao_consulta', 270, 100, -113,105);"/><br />
      <asp:Label ID="lblAssunto" runat="server" Text="Subject" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="68px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtAssunto" runat="server" CssClass="textbox" Width="290px"/><br />
      <asp:Label ID="lblMensagem" runat="server" Text="Message" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="68px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtMensagem" runat="server" CssClass="textbox" Width="290px" MaxLength="1750"  TextMode="MultiLine" Height="50px" style="overflow:auto;"/><br />
      <div style="width:273px;bottom:0;float:left;">
      <span class="lbl" style="font-size:8pt;cursor:pointer;">Use ";" to separate e-mails</span>
      </div>
      <div style="width:50px;text-align:right;bottom:0;">
        <asp:Button ID="btnArquivosEmail" runat="server" Text="Send" CssClass="textbox" OnClick="EnviarEmail"  Width="90px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#f8a310;color:#FFFFFF;font-family:Verdana;cursor:pointer;"/>
        <asp:Button ID="btnArquivosEmailSelecionados" runat="server" Text="Send" CssClass="textbox" OnClick="EnviarEmailSelecionados"  Width="90px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#f8a310;color:#FFFFFF;font-family:Verdana;cursor:pointer;"/>
      </div>
    </div>  
    <div id="divDigitalizacaoCabec" style="float:left;background-color:#f8a310;border-color:#f8a310;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divDigitalizacaoLink" href="#" style="text-decoration:none;cursor:default;color:#FFFFFF;" onclick="document.location = 'digitalizacao_principal_i.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=1';">Documents Scan</a></center></div>    
    <div id="divArquivosCabec" style="margin-left:3px;float:left;background-color:#FFFFFF;border-color:#f8a310;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divArquivosLink" href="#" style="text-decoration:none;cursor:pointer;color:#f8a310;" onclick="if (Trim('<%= Request("retorno") %>') != ''){document.location = 'digitalizacao_principal.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=2&retorno=<%= Request("retorno") %>';}else{alert('ATTENTION: First, enter a Indaia #/ID/Customer Order!');};">Files</a></center></div> 
    <div id="divUploadCabec" style="background-color:#FFFFFF;border-color:#f8a310;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divUploadLink" href="#" style="text-decoration:none;cursor:pointer;color:#f8a310;" onclick="if (Trim('<%= Request("retorno") %>') != ''){document.location = 'digitalizacao_principal.aspx?produto=<%=Session("produto")%>&usuario=<%=Session("usuario")%>&pg=3&retorno=<%= Request("retorno") %>';}else{alert('ATTENTION: First, enter a Indaia #/ID/Customer Order!');};">Upload</a></center></div> 
    <div style="background-color:#FFFFFF;border-color:#f8a310;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">    
    <div id="divDigitalizacaoPrincipal" style="display:block;">
      <asp:HiddenField runat="server" Value="" ID="txtProduto"/>
      <div style="width:600px;text-align:left;"><br />
        <asp:RadioButton runat="server" Checked="true" onclick="selecionaOpcao(this);" ID="chkProcesso"/><asp:Label ID="lblProcessoCheck" runat="server" Text="Indaia #" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl" style="vertical-align:middle;"/>&nbsp;<br /><br />
      </div>
      <asp:Label ID="lblUnidade" runat="server" Text="BU" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdUnidade" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'AP_UNID_NEG', this, 'frmDigitalizacaoPrincipal_txtNmUnidade');" MaxLength="2"/> 
      <asp:TextBox ID="txtNmUnidade" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#f4d296"/>
      <img id="imgUnidade" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('BUs','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_NEG&nome=AP_UNID_NEG&tabela=TUNID_NEG&usuario=<%=Session("usuario")%>&campo=frmDigitalizacaoPrincipal_txtCdUnidade','digitalizacao_consulta', 431, 205, 31,0);"/><br /><br />
      <asp:Label ID="lblProcesso" runat="server" Text="Indaia #" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtNrProcesso" MaxLength="18" runat="server" CssClass="textbox" Width="160px" Text='' onBlur="verificaPedido(this.value,document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').value,document.getElementById('frmDigitalizacaoPrincipal_txtCdCliente').value, document.getElementById('frmDigitalizacaoPrincipal_txtProduto').value, this.id,'1');"/> 
      <img id="imgProcesso" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Processos','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').value+'&cd_produto=<%=Session("produto") %>&usuario=<%=Session("usuario")%>&cd_cargo=<%=Session("cd_cargo")%>&codigo=NR_PROCESSO&campo=frmDigitalizacaoPrincipal_txtNrProcesso','digitalizacao_pedido', 350, 200,-9,40);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="lblID" runat="server" Text="ID" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="55px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtID" MaxLength="13" runat="server" CssClass="textbox" Width="160px" onBlur="verificaPedido(this.value,document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').value,document.getElementById('frmDigitalizacaoPrincipal_txtCdCliente').value, document.getElementById('frmDigitalizacaoPrincipal_txtProduto').value, this.id,'2');"/> 
      <img id="imgID" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Instruções de desembaraço','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmDigitalizacaoPrincipal_txtCdUnidade').value+'&usuario=<%=Session("usuario")%>&cd_cargo=<%=Session("cd_cargo")%>&codigo=NR_PROCESSO&campo=frmDigitalizacaoPrincipal_txtID','digitalizacao_pedido', 250, 200,-330,40);"/><br /><br />
      <br />
      <div style="width:600px;text-align:left;">
        <asp:RadioButton runat="server" Checked="false" onclick="selecionaOpcao(this);" ID="chkPedido"/><asp:Label ID="lblPedidoCheck" runat="server" Text="Customer Order" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="200px" CssClass="lbl" style="vertical-align:middle;" />&nbsp;<br /><br />
      </div>
      <asp:Label ID="lblCliente" runat="server" Text="Customer" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmDigitalizacaoPrincipal_txtNmCliente');" MaxLength="5" BackColor="#f4d296" ReadOnly="true"/> 
      <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#f4d296"/>
      <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Customers','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&cd_cargo=<%=Session("cd_cargo")%>&campo=frmDigitalizacaoPrincipal_txtCdCliente','digitalizacao_consulta', 431, 205, 31,134);" disabled="true"/><br /><br />
      <asp:Label ID="lblPedido" runat="server" Text="Order #" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="100px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtNrPedido" MaxLength="18" runat="server" CssClass="textbox" Width="160px" Text='' onBlur="verificaPedido(this.value,'XX',document.getElementById('frmDigitalizacaoPrincipal_txtCdCliente').value, document.getElementById('frmDigitalizacaoPrincipal_txtProduto').value, this.id,'3');" BackColor="#f4d296" ReadOnly="true"/> 
      <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Pedidos','divInfoCorpo','divInfo','divInfoRodape','cd_cliente='+document.getElementById('frmDigitalizacaoPrincipal_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&cd_cargo=<%=Session("cd_cargo")%>&codigo=NR_REFERENCIA&campo=frmDigitalizacaoPrincipal_txtNrPedido','digitalizacao_pedido', 250, 130,-60,209);" disabled="true"/>&nbsp;&nbsp;
      <asp:Label ID="lblID2" runat="server" Text="ID" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl" style="visibility:hidden;"/>&nbsp;
      <asp:TextBox ID="txtID2" MaxLength="10" runat="server" CssClass="textbox" Width="160px" onBlur="" style="visibility:hidden;"/> 
      <img id="imgID2" src="../../imagens/icones/16x16/btn_folder.gif" alt="Search" align="middle" style="cursor:pointer;" onclick="" style="visibility:hidden;"/><br /><br />
      <asp:TextBox ID="txtNrProcessoHidden" runat="server" Width="0px" Height="0px" Visible="true" Text=''/>
    </div>
    <div id="divArquivosPrincipal" style="display:none;">
      <asp:UpdatePanel ID="upArquivosPrincipal" runat="server">    
        <ContentTemplate>  
        <br />                 
        <div style="height: 20px;width:660px;overflow:hidden;border-color:#f8a310;border-style:solid;border-width:1px;text-align:center;">
          <table style="font-size:9pt;font-family:verdana;color:#FFFFFF;height:20px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#f8a310" cellpadding="4"><tr>
          <td style="width:20px;"></td>
          <td style="width:40px;"></td>
          <td style="width:260px">Description</td>
          <td style="width:180px">Record Creator</td>
          <td style="width:170px">Date of Creation</td>
          </tr></table>
        </div>
        <div id="divgrdArquivos" style="height:300px;width:660px;overflow:auto;border-color:#f8a310;border-style:solid;border-width:1px;">
          <asp:GridView ID="grdArquivos" runat="server" DataSourceID="SqlArquivos"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#f8a310" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#feedce" RowStyle-Height="18px" 
                CellPadding="2" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="641px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="No Files" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="18px" BackColor="#f4d296"></RowStyle>
            <Columns>
            <asp:BoundField DataField="TIPO" HeaderText=" " SortExpression="TIPO" ItemStyle-Width="20px"/> 
                <asp:TemplateField HeaderText=" " ItemStyle-Width="10px">
                  <ItemTemplate>
                      <input type="checkbox" onclick="preencheSelecionados(this,'<%# Eval("RESULTADO") %>');"/>
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" " ItemStyle-Width="40px">
                  <ItemTemplate>
                     <asp:HyperLink ID="ibVisualizaArquivo" runat="server" style="cursor:pointer;" ToolTip="View" Target="_blank" NavigateUrl='<%# Eval("CODIGO", "..\..\redireciona_doc.asp?cod={0}")%>'><img id="imgVisualiza" src="../../imagens/30/view_doctos.gif" alt="View" align="absmiddle" style="cursor:pointer;border:0;" /></asp:HyperLink>&nbsp;
                     <img id="imgEmailDoctos" src="../../imagens/30/mail_doctos.gif" align="middle" onclick="mostraEmail('<%# Eval("RESULTADO") %>');" style="cursor:pointer;border:0;" alt="Send by e-mail"/>   
                  </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DESCRICAO" HeaderText=" " SortExpression="DESCRICAO" ItemStyle-Width="260px"/>                
                <asp:BoundField DataField="NM_USUARIO" HeaderText=" Data " SortExpression="NM_USUARIO" ItemStyle-Width="180px"/>
                <asp:BoundField DataField="CRIACAO" HeaderText=" " SortExpression="CRIACAO" ItemStyle-Width="150px"/>
            </Columns>
          </asp:GridView> 
          <asp:SqlDataSource ID="SqlArquivos" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT TDD.NM_TIPO_DOCTO AS TIPO, CASE LTRIM(RTRIM(ISNULL(PD.NM_DESCRICAO,''))) WHEN '' THEN '-' ELSE PD.NM_DESCRICAO END AS DESCRICAO, 
            CONVERT(VARCHAR,PD.DT_CRIACAO,103) + ' ' + CONVERT(VARCHAR,PD.DT_CRIACAO,108)  AS CRIACAO, DBO.FN_PATH_DIGITALIZACAO(@nr_processo,'0')+'/'+LTRIM(RTRIM(NR_PROCESSO))+'/'+LTRIM(RTRIM(PD.NM_ARQUIVO)) AS RESULTADO,
            U.NM_USUARIO, MASTER.DBO.FN_CRIPROGRAFA(DBO.FN_PATH_DIGITALIZACAO(@nr_processo,'0')+'/'+LTRIM(RTRIM(NR_PROCESSO))+'/'+LTRIM(RTRIM(PD.NM_ARQUIVO))) AS CODIGO
            FROM TPROCESSO_DOCTOS PD (NOLOCK) 
              INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA = PD.ID_TABELA AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO 
              INNER JOIN BROKER.DBO.TUSUARIO U ON U.CD_USUARIO = PD.CD_USUARIO_CRIACAO
            WHERE PD.NR_PROCESSO = @nr_processo
              AND PD.IN_ATIVO = '1' 
              AND TDD.IN_ENVIA_WEB = '1'
              ORDER BY TDD.CD_TIPO_DOCTO" ProviderName="System.Data.SqlClient">            
            <SelectParameters>                
              <asp:QueryStringParameter Name="nr_processo" QueryStringField="retorno"/>
            </SelectParameters>
          </asp:SqlDataSource>               
        </div>         
        <asp:HiddenField runat="server" Value="" ID="txtAnexo"/>
        <asp:HiddenField runat="server" Value="" ID="txtAnexoSelecionado"/>
        <div style="width:640px;text-align:right;">       
          <img id="imgEmailDoctos" src="../../imagens/30/mail_doctos.gif" align="middle"/>&nbsp;<span onclick="mostraEmail('');" class="lbl" style="font-size:9pt;cursor:pointer;">Send file(s) selected by e-mail</span>
        </div>
        </ContentTemplate>
      </asp:UpdatePanel>
    </div>
    <div id="divUploadPrincipal" style="display:none;"><br />
     <asp:FileUpload ID="fuArquivos" runat="server" CssClass="textbox" Width="533px" BackColor="#f4d296" Height="18px" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Button ID="btnArquivos" runat="server" Text="Send" CssClass="textbox" OnClick="EnviarArquivo"  Width="55px" Height="20px" style="text-transform:none;font-size:9pt;font-weight:normal;background-color:#f8a310;color:#FFFFFF;font-family:Verdana;cursor:pointer;"/><br /><br />
    <asp:Label ID="lblTpArquivo" runat="server" Text="Type" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:DropDownList ID="ddlTpArquivo" runat="server" class="textbox" Width="522px"  style="text-transform:uppercase;" DataSouceID="SqlTpArquivo" DataTextField="NM_TIPO_DOCTO" DataValueField="CD_TIPO_DOCTO" DataSourceID="SqlTpArquivo"/>
    <asp:SqlDataSource ID="SqlTpArquivo" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT CD_TIPO_DOCTO, NM_TIPO_DOCTO, ID_TABELA FROM TTP_DOCTO_DIGITALIZADO (NOLOCK)
     WHERE (@retorno LIKE '%ID0%' AND ID_TABELA = 1225680060 AND CD_PRODUTO IN ('01', 'AM'))
       OR (ID_TABELA = 1652005462 AND CD_PRODUTO IN (@produto, 'AM'))">
    <SelectParameters>
    <asp:QueryStringParameter Name="produto" QueryStringField="produto"/>
    <asp:QueryStringParameter Name="retorno" QueryStringField="retorno"/>
    </SelectParameters>
    </asp:SqlDataSource>    
    <br /><br />
    <asp:Label ID="lblArquivo" runat="server" Text="Description" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="70px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtArquivo" runat="server" class="textbox" Width="522px" MaxLength="1750"  TextMode="MultiLine" Height="100px" style="overflow:auto;"/><br /><br />    
   </div>
   </EmptyDataTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="SqlDigitalizacaoPrincipal" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /></SelectParameters>
    </asp:SqlDataSource>
    </div> 
    <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;">
      <asp:LinkButton ID="lbVoltar" runat="server" OnClick="VoltarMenu"><img src="../../imagens/voltar1.gif" style="border:0px" alt=""/></asp:LinkButton>
    </div>
    <div style="bottom:2px;height:20px;position:absolute;right:5px"> <script type="text/javascript">                                                                         TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>     
   </form>   
</body>
</html>
