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
        
        If Request.QueryString("item_cliente") <> "" Then
            SqlAux = 
            " SELECT FM.NM_FINALIDADE_MERC" & _
            " FROM TPROCESSO                P    (NOLOCK) " & _
            "   INNER JOIN TPO_ITEM         POI  (NOLOCK) ON POI.NR_PROCESSO = P.NR_REFERENCIA" & _
            "   INNER JOIN TMERCADORIA      M    (NOLOCK) ON M.CD_MERCADORIA = POI.CD_MERCADORIA" & _
            "   INNER JOIN TFINALIDADE_MERC FM   (NOLOCK) ON FM.CD_FINALIDADE_MERC = M.CD_FINALIDADE_MERC" & _
            " WHERE P.NR_PROCESSO = '" & Request.QueryString("nr_processo") & "'" & _
            "   AND POI.NR_ITEM_CLIENTE = '" & Request.QueryString("item_cliente") & "'" & _
            "   AND POI.NR_PARCIAL = '0'"
            'CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            RsAux.Read()
            Dim lblFinalidade As Label = frmFollowupPrincipal.FindControl("lblFinalidade")
            lblFinalidade.Text = "Finalidade: " + RsAux("NM_FINALIDADE_MERC")
            CnnAux.Close()
            RsAux.Close()
        End If
        
    End Sub
    
    Sub CancelarFollowup(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("followup_principal.aspx?acao=lista&usuario=" & Session("usuario"))
    End Sub
        
    Sub SalvarObs(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim frmFollowupObs As FormView = frmFollowupPrincipal.FindControl("frmFollowupObs")
        Dim sqlFollowupObs As SqlDataSource = frmFollowupPrincipal.FindControl("sqlFollowupObs")
        Dim txtObs As TextBox = frmFollowupObs.FindControl("txtObs")
        Dim nr_processo As String = Request.QueryString("nr_processo")
        sqlFollowupObs.UpdateCommand = "UPDATE PO SET " & _
        " TX_OBS  = '" & Replace(txtObs.Text, "'", """") & "' " & _
        " FROM TFLP_PO PO (NOLOCK) " & _
        " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " & _
        " WHERE P.NR_PROCESSO ='" & nr_processo & "' AND " & _
        " PO.CD_EVENTO = '022' "
        'Response.Write(nr_processo)
        'Response.End()
        sqlFollowupObs.Update()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Observações atualizadas com sucesso!');", True)
        Page.DataBind()        
    End Sub
    
    Sub SalvarObsItem(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim frmFollowupObsItem As FormView = frmFollowupPrincipal.FindControl("frmFollowupObsItem")
        Dim SqlFollowupObsItem As SqlDataSource = frmFollowupPrincipal.FindControl("SqlFollowupObsItem")
        Dim txtObs As TextBox = frmFollowupObsItem.FindControl("txtObs")
        Dim nr_processo As String = Request.QueryString("nr_processo")
        Dim nr_item_cliente As String = Request.QueryString("item_cliente")
        Dim nr_parcial As String = Request.QueryString("nr_parcial")
        
        SqlFollowupObsItem.UpdateCommand =
        "UPDATE PO SET " & _
        " TX_OBS  = '" & Replace(txtObs.Text, "'", """") & "' " & _
        " FROM TFLP_PO_ITEM    PO (NOLOCK) " & _
        " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " & _
        " WHERE P.NR_PROCESSO ='" & nr_processo & "' AND " & _
        " PO.CD_EVENTO = '022' AND " & _
        " PO.NR_ITEM_CLIENTE = '" & nr_item_cliente & "' AND " & _
        " PO.NR_PARCIAL = " & nr_parcial & ""
        'Response.Write(nr_processo)
        'Response.End()
        SqlFollowupObsItem.Update()
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "alert('ATENÇÃO: Observações atualizadas com sucesso!');", True)
        Page.DataBind()        
    End Sub
    
    Protected Sub pintaLinha(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Select Case e.Row.RowType
            Case DataControlRowType.DataRow
                If e.Row.DataItem("IN_APLICAR").ToString = "1" Then
                    e.Row.Enabled = False
                End If
                If e.Row.DataItem("CD_EVENTO").ToString = "022" Then
                    e.Row.Cells.Item(1).Attributes.Add("onclick", "ExibeObs();")
                    e.Row.Cells.Item(1).Attributes.Add("class", "nounderline")
                End If
        End Select
    End Sub
    
    Protected Sub pintaLinhaItem(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Select Case e.Row.RowType
            Case DataControlRowType.DataRow
                If e.Row.DataItem("IN_APLICAR").ToString = "1" Then
                    e.Row.Enabled = False
                End If
                If e.Row.DataItem("CD_EVENTO").ToString = "022" Then
                    e.Row.Enabled = False
                    'e.Row.Cells.Item(1).Attributes.Add("onclick", "ExibeObsItem();")
                    'e.Row.Cells.Item(1).Attributes.Add("class", "nounderline")
                End If
        End Select
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
                    ajax.onreadystatechange = function() {
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

    function ExibeData(vFeatures) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '300';
            var z = '90';

            var vCorpo = document.getElementById('divData');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w/2+75;
            vCorpo.style.top = z/2+25;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", "followup_atualiza.aspx?" + vFeatures, true);
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
                        //document.getElementById('txtDtEvento').focus();
                        document.getElementById('txtDtEvento').select();
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function ExibeDataLote(vFeatures) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '300';
            var z = '230';

            var vCorpo = document.getElementById('divDataLote');

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
            ajax.open("POST", "followup_atualiza_lote.aspx?" + vFeatures, true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        vCorpo.innerHTML = vResult;
                        var scripts = vCorpo.getElementsByTagName("script");
                        for (i = 0; i < scripts.length; i++) {
                            s = scripts[i].innerHTML;
                            eval(s);
                        }
                        //document.getElementById('txtDtEvento').focus();
                        //document.getElementById('txtDtEvento').select();
                    } else {
                        vCorpo.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null);
        }
    }

    function ExibeObs_BKP(vFeatures) {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '400';
            var z = '280';

            var vCorpo = document.getElementById('divObs');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2-20;
            vCorpo.style.top = z / 2-75;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";

            var ajax = openAjax();
            ajax.open("POST", "followup_obs.aspx?" + vFeatures, true);
            ajax.setRequestHeader("Cache-Control", "no-cache");
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

    function SalvarObs_BKP(processo, texto) {
        var ajax = openAjax();
        var texto = texto.value;
        ajax.open('GET', 'followup_obs_atualiza.asp?nr_processo=' + processo + '&obs=' + escape(texto), true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    //vResult = vResult.replace(/\+/g," ");
                    //vResult = unescape(vResult);
                    if (vResult == "") {
                        alert('ATENÇÃO: Observações atualizadas com sucesso!');
                        ExibeObs('nr_processo=' + processo + '&cd_usuario=<%=Session("usuario")%>');
                        //FechaObs();
                    } else {
                        alert('ATENÇÃO: Erro ao atualizar o evento!');
                    }
                }
            }
        }
        ajax.send(null);
    }

    function ExibeObs() {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '400';
            var z = '280';

            var vCorpo = document.getElementById('divObs');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - 20;
            vCorpo.style.top = z / 2 - 75;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";            
        }
    }

    function ExibeObsItem() {
        if (document.getElementById) {
            var x = screen.width;
            var y = screen.height;
            var w = '400';
            var z = '280';

            var vCorpo = document.getElementById('divObsItem');

            var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);

            var x1 = ((x - 0) - w) / 2;
            var x2 = Math.round(x1);

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - 20;
            vCorpo.style.top = z / 2 - 75;
            vCorpo.style.display = "block";
            vCorpo.style.filter = "alpha(opacity=95)";
        }
    }

    function FechaData() {
        var div = document.getElementById('divData');
        div.style.display = "none";
    }

    function FechaDataLote() {
        var div = document.getElementById('divDataLote');
        div.style.display = "none";
    }

    function FechaObs() {
        var div = document.getElementById('divObs');
        div.style.display = "none";
    }

    function FechaObsItem() {
        var div = document.getElementById('divObsItem');
        div.style.display = "none";
    }

    function preencheData(vFeatures, tipo) {
        var sim;
        var todositens = 0;
        var ajax = openAjax();
        if (document.getElementById('frmFollowupPrincipal_cbTodosItens').checked) todositens = 1;
        ajax.open("POST", "followup_preenche.aspx?" + vFeatures + "&todos_itens=" + todositens, true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function() {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    if (vResult == "") {
                        alert('ATENÇÃO: Evento atualizado com sucesso!');
                        CarregaData(vFeatures, tipo);
                    } else {
                        alert('ATENÇÃO: Erro ao atualizar o evento!');
                    }
                }
            }
        }
        ajax.send(null);
        FechaData();
    }

    function preencheDataLote(vFeatures, tipo) {
        //alert(vFeatures);
        var ajax = openAjax();        
        ajax.open("post", "followup_preenche_lote.aspx?" + vFeatures, true);
        ajax.setRequestHeader("Cache-Control", "no-cache");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    //alert(vResult);
                    if (vResult == "") {
                      alert('ATENÇÃO: Pedidos atualizados com sucesso!');
                      CarregaData(vFeatures, tipo);
                    } else {
                      alert('ATENÇÃO: Erro ao atualizar os pedidos!');
                    }
                }
            }
        }
        ajax.send(null);
        FechaDataLote();
    }

    //function preencheDataLote(vFeatures, tipo) {
    //    document.location = "followup_preenche_lote.aspx?" + vFeatures                
    //}
    
    function aplicarEvento(vFeatures, texto, tipo) {
        if (confirm('ATENÇÃO: Deseja realmente '+texto+' este evento?')) {
            var sim;
            var todositens = 0;
            var ajax = openAjax();
            if (document.getElementById('frmFollowupPrincipal_cbTodosItens').checked) todositens = 1;
            ajax.open("POST", "followup_aplicar.aspx?" + vFeatures + "&todos_itens=" + todositens, true);
            ajax.setRequestHeader("Cache-Control", "no-cache");
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4) {
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText;
                        if (vResult != "") {
                            alert('ATENÇÃO: Erro ao ' + texto + ' o evento!');
                        } else {
                        CarregaData(vFeatures, tipo);
                        }
                    }
                }
            }
            ajax.send(null);
        }
    }

    function CarregaData(vFeatures, tipo) {
        var vCorpo
        if (tipo == "1") {
            vCorpo = document.getElementById('divgrdFollowupPO');
        } else {
            vCorpo = document.getElementById('divgrdFollowupPOItem');
        }
        var ajax = openAjax();
        ajax.open('POST', 'followup_carrega.aspx?'+vFeatures, true);
        ajax.onreadystatechange = function() {
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
            vInfo.style.top = z / 2 + 10;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = w / 2 - 150;
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

    function ExibeItemParcial(vFeatures, top, left, width, tipo) {
        if ((document.getElementById('frmFollowupPrincipal_txtItemCliente').value == '') && (tipo == '2')) {
            alert("ATENÇÃO: Primeiramente, preencha o campo 'Item Cliente'.");
            document.getElementById('frmFollowupPrincipal_txtItemCliente').focus();
        }else{
            if (document.getElementById) {
                var x = screen.width;
                var y = screen.height;
                var w = width;
                var z = 65;

                var vCorpo = document.getElementById('divItemParcial');
                var vCabec = document.getElementById('divItemParcialCabec');

                var y1 = (y / 5);
                var y2 = Math.round(y1);
                var y3 = ((y - y2) - z) / 2;
                var y4 = Math.round(y3);

                var x1 = ((x - 0) - w) / 2;
                var x2 = Math.round(x1);

                vCorpo.style.width = w;
                vCorpo.style.height = z;
                vCorpo.style.left = w / 2 + 260 + left;
                vCorpo.style.top = z/2+88;
                vCorpo.style.display = "block";
                vCorpo.style.filter = "alpha(opacity=95)";

                vCabec.style.width = w;
                vCabec.style.height = 20;
                vCabec.style.left = w / 2 + 260+left;
                vCabec.style.top = z / 2 + 71;
                vCabec.style.display = "block";
                vCabec.style.filter = "alpha(opacity=95)";

                var ajax = openAjax();
                ajax.open("GET", "item_parcial_consulta.aspx?" + vFeatures, true);
                ajax.onreadystatechange = function() {
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
        } 
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

    function FechaItemParcial() {
        document.getElementById('divItemParcialCabec').style.display = "none";
        document.getElementById('divItemParcial').style.display = "none";
    }

    function carregaInfo() {
        preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', document.getElementById('frmFollowupPrincipal_txtCdUnidade'), 'frmFollowupPrincipal_txtNmUnidade');
        preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', document.getElementById('frmFollowupPrincipal_txtCdCliente'), 'frmFollowupPrincipal_txtNmCliente');        
    }

    function verificaConsistencia(campo, codigo, valor) {
        if (Trim(valor) != '') {
            var ajax = openAjax();
            ajax.open("GET", "followup_consistencia.aspx?cd_unid_neg=" + document.getElementById('frmFollowupPrincipal_txtCdUnidade').value + "&cd_cliente=" + document.getElementById('frmFollowupPrincipal_txtCdCliente').value + "&codigo=" + codigo, true);
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
        if (campo == 'frmFollowupPrincipal_txtNrPedido') {
                if (Trim(pedido) != '' && (Trim(document.getElementById('frmFollowupPrincipal_txtNrProcesso').value) == '')) {
                    var ajax = openAjax();
                    ajax.open("GET", "verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&campo=" + campo, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                if (vResult == "1") {
                                    alert("ATENÇÃO: Pedido em duplicidade.\nFavor preencher o campo 'Cliente'!")
                                    document.getElementById(campo).focus();
                                } else {
                                    if (vResult == "2") {
                                        alert("ATENÇÃO: Pedido Inválido!")
                                        document.getElementById(campo).focus();
                                    } else {
                                        location.href = 'followup_principal.aspx?nr_processo=' + vResult;
                                    }
                                }
                            }
                        }
                    }
                    ajax.send(null);
                }
        }else{
                if ((Trim(pedido) != '') && (Trim(document.getElementById('frmFollowupPrincipal_txtNrPedido').value) == '')) {
                    var ajax = openAjax();
                    ajax.open("GET", "verifica_pedido.aspx?nr_referencia=" + pedido + "&cd_unid_neg=" + unid_neg + "&cd_cliente=" + cliente + "&campo=" + campo, true);
                    ajax.onreadystatechange = function() {
                        if (ajax.readyState == 4) {
                            if (ajax.status == 200) {
                                var vResult = ajax.responseText;
                                vResult = vResult.replace(/\+/g, " ");
                                vResult = unescape(vResult);
                                if (vResult == "2") {
                                    alert("ATENÇÃO: Pedido Inválido!")
                                    document.getElementById(campo).focus();
                                } else {
                                location.href = 'followup_principal.aspx?nr_processo=' + vResult;
                                }
                            }
                        }
                    }
                    ajax.send(null);
                }
        }
    }
    
    function enviaValor(valor, tabela, campo) {
        document.getElementById(campo).value = Trim(valor);
        document.getElementById(campo).focus();
        document.getElementById(campo).blur();
        FechaDetalhes('divInfoCorpo', 'divInfo');
        FechaItemParcial();
    }

    function enviaItemParcial(valor, fatura, tabela, campo) {
        document.getElementById(campo).value = Trim(valor);
        document.getElementById(campo).focus();
        document.getElementById(campo).blur();
        if (tabela == 'ITEM_CLIENTE') {
            location.href = 'followup_principal.aspx?nr_processo=<%=Request.QueryString("nr_processo")%>&item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&invoice=' + document.getElementById('frmFollowupPrincipal_txtInvoice').value;
            //CarregaData('tp_atualiza=2&nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value +'&cd_usuario=<%=Session("usuario")%>', '2')
        }else{
            document.getElementById('frmFollowupPrincipal_txtInvoice').value = Trim(fatura);
            location.href = 'followup_principal.aspx?nr_processo=<%=Request.QueryString("nr_processo")%>&item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&invoice=' + document.getElementById('frmFollowupPrincipal_txtInvoice').value;
            //CarregaData('tp_atualiza=2&nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&cd_usuario=<%=Session("usuario")%>', '2')
        }
        FechaItemParcial();
    }

    function carregaTelas(div1, div2) {
        document.getElementById(div1 + 'Cabec').style.backgroundColor = '#374BAE';
        document.getElementById(div1 + 'Link').style.color = '#FFFFFF';
        document.getElementById(div1 + 'Link').style.cursor = "default";
        document.getElementById(div1).style.display = 'block';
        document.getElementById(div2 + 'Cabec').style.backgroundColor = '#FFFFFF';
        document.getElementById(div2 + 'Link').style.color = '#374BAE';
        document.getElementById(div2 + 'Link').style.cursor = "pointer";
        document.getElementById(div2).style.display = 'none';
    }

    function carregaFollowup(tipo) {
        var vFeatures = 'nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&tipo=' + tipo;
        if (tipo == 0) { vFeatures = 'nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=<%=Request.QueryString("item_cliente")%>&nr_parcial=0&tipo=' + tipo } 
        var ajax = openAjax();
        ajax.open('GET', 'followup_carrega_item_parcial.aspx?'+vFeatures, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var vResult = ajax.responseText;
                    vResult = vResult.replace(/\+/g, " ");
                    vResult = unescape(vResult);
                    if (vResult != "NAO1" && vResult != "NAO2") {
                        var vResultArray = vResult.split('|')
                        document.getElementById('frmFollowupPrincipal_txtItemCliente').value = vResultArray[0];
                        document.getElementById('frmFollowupPrincipal_txtParcial').value = vResultArray[1];
                        document.getElementById('frmFollowupPrincipal_txtInvoice').value = vResultArray[2];
                        location.href = 'followup_principal.aspx?nr_processo=<%=Request.QueryString("nr_processo")%>&item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&invoice=' + document.getElementById('frmFollowupPrincipal_txtInvoice').value;
                        //CarregaData('tp_atualiza=2&nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=' + document.getElementById('frmFollowupPrincipal_txtItemCliente').value + '&nr_parcial=' + document.getElementById('frmFollowupPrincipal_txtParcial').value + '&cd_usuario=<%=Session("usuario")%>', '2')
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

    function carregaFollowupItem() {
        document.getElementById('frmFollowupPrincipal_txtItemCliente').value = '<%=Request.QueryString("item_cliente")%>';
        document.getElementById('frmFollowupPrincipal_txtParcial').value = '<%=Request.QueryString("nr_parcial")%>';
        document.getElementById('frmFollowupPrincipal_txtInvoice').value = '<%=Request.QueryString("invoice")%>';
        CarregaData('tp_atualiza=2&nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente=<%=Request.QueryString("item_cliente")%>&nr_parcial=<%=Request.QueryString("nr_parcial")%>&cd_usuario=<%=Session("usuario")%>', '2')
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
cursor:pointer;
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script language="JavaScript" type="text/javascript">
//<![CDATA[
        var tl_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/trustlogo.js" :
"http://www.trustlogo.com/trustlogo/javascript/trustlogo.js";
        document.writeln('<scr' + 'ipt language="JavaScript" src="' + tl_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script> 
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%" onload="<%If Request.QueryString("item_cliente") <> "" %>carregaTelas('divPrincipalFollowupPOItem', 'divPrincipalFollowupPO');carregaFollowupItem();<%End If%>carregaInfo();">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_id2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
	<tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
    </table><!--<div><img src="../../imagens/cabec_logos3.gif"/></div>-->   
    <form ID="frmFollowup" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:200px">
    <div id="divEdita" style="border-width:0px;top:100px;">
    <asp:FormView ID="frmFollowupPrincipal" runat="server" DataKeyNames="NR_PROCESSO" DataSourceID="SqlFollowupPrincipal" BorderWidth="0px" DefaultMode="Edit">
    <EmptyDataTemplate>
    <div id="divInfo" class="divInfo" style="overflow:hidden;background-color:#374BAE;height:10px;">
    <div id="divTitulo" style="float:left;font-family:verdana;font-size:10pt;color:#FFFFFF;"></div>
    <div style="right:0;width:18px;"><a href="#" onclick="FechaDetalhes('divInfoCorpo','divInfo');"><img src="/imagens/icones/16x16/btn_fechar23.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divPesquisa" style="text-align:right;height:25px;background-color:#f0f1f6;">
    <input id="txtPesquisa" type="text" class="textbox" style="width:400px;height:16px;" onchange="n=0;" onkeydown="if(event.keyCode == 13){findInPage(txtPesquisa.value)};"/>&nbsp;
    <img name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" style="height:16px;width:16px;cursor:pointer;" alt="Pesquisar" align="absmiddle" onclick="findInPage(txtPesquisa.value)"/>&nbsp;&nbsp;
    </div>
    </div> 
    <div id="divInfoCorpo" class="divDetalhes"></div>   
    <div id="divData" class="divDetalhes2"></div>   
    <div id="divObs" class="divDetalhes2">
    <asp:FormView ID="frmFollowupObs" runat="server" DataKeyNames="NR_PROCESSO" DataSourceID="SqlFollowupObs" BorderWidth="0px" DefaultMode="Edit">
    <EditItemTemplate>
    <div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaObs();" style="cursor:pointer;"></div>
    <div style="float:left;width:400px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;">
    <br />
    <div style="float:left;width:175px">
    <asp:TextBox ID="txtPedidoObs" runat="server" CssClass="textbox" Width="100px" ReadOnly="true" BackColor="#DEE6EF" Height="20px" Font-Size="10pt" Text='<%# Container.DataItem("NR_PROCESSO") %>'/></div>
    <div style="height:30px;width:200px;overflow:hidden;top:0px;text-align:right;">
    <asp:ImageButton ID="imgSalvarObs" runat="server" ImageUrl="\imagens\salvar3_16.gif" style="cursor:pointer;border:0;" ToolTip="Salvar Observações" align="right" OnClick="SalvarObs"/>    
    </div>
    <asp:TextBox ID="txtObs" runat="server" CssClass="textbox" Width="380px" BackColor="#DEE6EF" Height="215px" Font-Size="10pt" TextMode="MultiLine" Text='<%# Replace(Eval("TX_OBS"),Chr(34),Chr(39)) %>' style="overflow:auto;"/><br />
    </div>
    <br />
    </EditItemTemplate>
    </asp:FormView>
     <asp:SqlDataSource ID="SqlFollowupObs" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ISNULL(PO.TX_OBS,'') AS TX_OBS, PO.NR_PROCESSO 
     FROM TFLP_PO PO (NOLOCK) 
     INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) 
     WHERE P.NR_PROCESSO = @NR_PROCESSO  AND PO.CD_EVENTO = '022'">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /></SelectParameters>
    </asp:SqlDataSource>
    </div> 
    <div id="divObsItem" class="divDetalhes2">
    <asp:FormView ID="frmFollowupObsItem" runat="server" DataKeyNames="NR_PROCESSO, NR_ITEM_CLIENTE" DataSourceID="SqlFollowupObsItem" BorderWidth="0px" DefaultMode="Edit">
    <EditItemTemplate>
    <div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaObsItem();" style="cursor:pointer;"></div>
    <div style="float:left;width:400px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;">
    <br />
    <div style="float:left;width:175px">
    <asp:TextBox ID="txtPedidoObsItem" runat="server" CssClass="textbox" Width="100px" ReadOnly="true" BackColor="#DEE6EF" Height="20px" Font-Size="10pt" Text='<%# Container.DataItem("NR_PROCESSO") %>'/></div>
    <div style="height:30px;width:200px;overflow:hidden;top:0px;text-align:right;">
    <asp:ImageButton ID="imgSalvarObsItem" runat="server" ImageUrl="\imagens\salvar3_16.gif" style="cursor:pointer;border:0;" ToolTip="Salvar Observações" align="right" OnClick="SalvarObsItem"/>    
    </div>
    <asp:TextBox ID="txtObs" runat="server" CssClass="textbox" Width="380px" BackColor="#DEE6EF" Height="215px" Font-Size="10pt" TextMode="MultiLine" Text='<%# Replace(Eval("TX_OBS"),Chr(34),Chr(39)) %>' style="overflow:auto;"/><br />
    </div>
    <br />
    </EditItemTemplate>
    </asp:FormView>
     <asp:SqlDataSource ID="SqlFollowupObsItem" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ISNULL(TX_OBS,'') AS TX_OBS, PO.NR_PROCESSO, PO.NR_ITEM_CLIENTE  
     FROM TFLP_PO_ITEM PO (NOLOCK) 
     INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) 
     WHERE P.NR_PROCESSO = @NR_PROCESSO  AND PO.CD_EVENTO = '022' AND PO.NR_ITEM_CLIENTE  = @NR_ITEM_CLIENTE AND PO.NR_PARCIAL = @NR_PARCIAL">
    <SelectParameters>
    <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
    <asp:QueryStringParameter Name="NR_ITEM_CLIENTE" QueryStringField="item_cliente" />
    <asp:QueryStringParameter Name="NR_PARCIAL" QueryStringField="nr_parcial" /> 
    </SelectParameters>    
    </asp:SqlDataSource>
    </div> 
    <div id="divItemParcialCabec" class="divDetalhes3" style="background-color:#B4C7DB;border-bottom-width:0px;text-align:right;"><a href="#" onclick="FechaItemParcial();"><img src="/imagens/icones/16x16/btn_fechar22.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divItemParcial" class="divDetalhes" style="background-color:#B4C7DB;"></div>    
    <div id="divPrincipalPOCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalPOLink" href="#" style="text-decoration:none;cursor:default;color:#FFFFFF;">PO</a></center></div>    
    <div id="divPrincipalPOItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalPOItemLink" href="#" style="text-decoration:none;cursor:default;color:#374BAE;">Item/Parcial</a></center></div>    
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
    <div id="divPrincipalFollowupPO" style="display:block;">
    <div style="float:left;width:175px">&nbsp;</div>
    <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
    <asp:ImageButton ID="ibCancelaFollowup" runat="server" ImageUrl="../../imagens/cancelar2_16d.gif" OnClick="CancelarFollowup" style="cursor:pointer;" ToolTip="Cancelar/Voltar" Enabled="false"/>
    </div><br />
    <asp:Label ID="lblUnidade" runat="server" Text="Unidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdUnidade" runat="server" CssClass="textbox" Width="50px" Text='<%# Session("cd_unid_neg") %>' onBlur ="javascript:preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', this, 'frmFollowupPrincipal_txtNmUnidade');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmUnidade" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgUnidade" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Unidades de Negócio','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_NEG&nome=NM_UNID_NEG&tabela=TUNID_NEG&usuario=<%=Session("usuario")%>&campo=frmFollowupPrincipal_txtCdUnidade','followup_consulta', 500, 200,31);"/><br /><br />
    <asp:Label ID="lblCliente" runat="server" Text="Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmFollowupPrincipal_txtNmCliente');verificaConsistencia(this,'CLIENTE',this.value);" MaxLength="5"/> 
    <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Empresas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&campo=frmFollowupPrincipal_txtCdCliente&cd_cargo=<%=Session("cd_cargo")%>','followup_consulta', 500, 200,-7);"/><br /><br />
    <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrPedido" MaxLength="18" runat="server" CssClass="textbox" Width="150px" Text='' onBlur="verificaPedido(this.value,document.getElementById('frmFollowupPrincipal_txtCdUnidade').value,document.getElementById('frmFollowupPrincipal_txtCdCliente').value, this.id);"/> 
    <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Pedidos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmFollowupPrincipal_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmFollowupPrincipal_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_REFERENCIA&campo=frmFollowupPrincipal_txtNrPedido','combo_pedido', 500, 200,-83);"/>&nbsp;&nbsp;
    <asp:Label ID="lblProcesso" runat="server" Text="Processo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrProcesso" MaxLength="12" runat="server" CssClass="textbox" Width="150px" onBlur="verificaPedido(this.value,document.getElementById('frmFollowupPrincipal_txtCdUnidade').value,document.getElementById('frmFollowupPrincipal_txtCdCliente').value, this.id);"/> 
    <img id="imgProcesso" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Processos - Administração de Pedido','divInfoCorpo','divInfo','divInfoRodape','cd_unid_neg='+document.getElementById('frmFollowupPrincipal_txtCdUnidade').value+'&cd_cliente='+document.getElementById('frmFollowupPrincipal_txtCdCliente').value+'&usuario=<%=Session("usuario")%>&codigo=NR_PROCESSO&campo=frmFollowupPrincipal_txtNrProcesso','combo_pedido', 500, 200,-83);"/><br /><br />
    <div style="height: 25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
        <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
        <td style="width:230px;">Evento</td>
        <td style="width:125px">Usuário</td>
        <td style="width:25px">Aplicar</td>
        <td style="width:180px">Realização</td>        
        </tr></table>
    </div>
    <div id="divgrdFollowupPO" style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdFollowupPO" runat="server" DataSourceID="SqlFollowupPO"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="25px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Sem informações" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="25px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="CD_EVENTO" HeaderText="" SortExpression="CD_EVENTO" ItemStyle-Width="25px"/>
                <asp:BoundField DataField="NM_EVENTO" HeaderText="" SortExpression="NM_EVENTO" ItemStyle-Width="205px" ItemStyle-HorizontalAlign = "Left"/>
                <asp:BoundField DataField="AP_USUARIO" HeaderText="" SortExpression="AP_USUARIO" ItemStyle-Width="95px"/>
                <asp:TemplateField>
                <ItemTemplate><img src="\imagens\icones\16x16\chk_on.gif" width="16px" height="16px"/></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="180px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_data" runat="server" EnableTheming="True" Text='<%# Container.DataItem("DT_REALIZACAO")%>' Font-Names="verdana" class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlFollowupPO" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT F.NR_PROCESSO, F.CD_EVENTO, F.CD_RESP_REALIZACAO, CONVERT(VARCHAR,F.DT_REALIZACAO,103) AS DT_REALIZACAO,
                  F.DT_PREVISTA, F.DT_LIMITE, E.NM_EVENTO, U.AP_USUARIO,
                  CASE F.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE F.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, CASE F.IN_APLICAVEL WHEN '1' THEN 'Desaplicar' ELSE 'Aplicar' END AS INFO_APLICAR, F.CD_EMPRESA
                FROM TFLP_PO F (NOLOCK)
                  INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = f.NR_PROCESSO AND P.CD_CLIENTE = f.CD_EMPRESA
                  LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = F.CD_EVENTO)
                  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = F.CD_RESP_REALIZACAO)
                WHERE F.NR_PROCESSO = @NR_PROCESSO
                ORDER BY F.NR_ORDEM" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
            </SelectParameters>
        </asp:SqlDataSource>   
        </div></div><br />
        <div id="divPrincipalFollowupPOItem" style="display:none;">
        
        <asp:Label ID="lblItemCliente" runat="server" Text="Item Cliente/Parcial" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="140px" CssClass="lbl"/>&nbsp;
        <img src="\imagens\icones\16x16\first1.gif" width="16px" height="16px"/>
        <img src="\imagens\icones\16x16\prev1.gif" width="16px" height="16px"/> 
        <img src="\imagens\icones\16x16\next1.gif" width="16px" height="16px"/> 
        <img src="\imagens\icones\16x16\last1.gif" width="16px" height="16px"/>&nbsp;        
        <asp:TextBox ID="txtItemCliente" MaxLength="4" runat="server" CssClass="textbox" Width="60px" BackColor="#DEE6EF" ReadOnly="true"/>
        <img id="imgItemCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/>
        <asp:Label ID="lblBarra" runat="server" Text="/" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="5px" CssClass="lbl"/>
        <asp:TextBox ID="txtParcial" MaxLength="4" runat="server" CssClass="textbox" Width="40px" BackColor="#DEE6EF" ReadOnly="true"/>
        <img id="imgParcial" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtInvoice" runat="server" CssClass="textbox" Width="120px" BackColor="#DEE6EF" ReadOnly="true"/><br /><br /> 
        <div style="height: 25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
        <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
        <td style="width:230px;">Evento</td>
        <td style="width:125px">Usuário</td>
        <td style="width:25px">Aplicar</td>
        <td style="width:180px">Realização</td>      
        </tr></table>
        </div>
        <div id="divgrdFollowupPOItem" style="height:70px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdFollowupPOItem" runat="server" DataSourceID="SqlFollowupPOItem"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="25px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="581px" ShowHeader="False">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Sem informações" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="25px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="CD_EVENTO" HeaderText="" SortExpression="CD_EVENTO" ItemStyle-Width="25px"/>
                <asp:BoundField DataField="NM_EVENTO" HeaderText="" SortExpression="NM_EVENTO" ItemStyle-Width="205px" ItemStyle-HorizontalAlign = "Left"/>
                <asp:BoundField DataField="AP_USUARIO" HeaderText="" SortExpression="AP_USUARIO" ItemStyle-Width="95px"/>
                <asp:TemplateField>
                <ItemTemplate><img src="\imagens\icones\16x16\chk_on.gif" width="16px" height="16px"/></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="180px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_data" runat="server" EnableTheming="True" Text='<%# Container.DataItem("DT_REALIZACAO")%>' Font-Names="verdana" class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlFollowupPOItem" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand=" SELECT I.NR_PROCESSO, NR_ITEM, I.CD_EVENTO, I.CD_RESP_REALIZACAO, CONVERT(VARCHAR,I.DT_REALIZACAO,103) AS DT_REALIZACAO,
          I.DT_PREVISTA, I.DT_LIMITE, I.NR_ITEM_CLIENTE, E.NM_EVENTO, U.AP_USUARIO,
          CASE I.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE I.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, CASE I.IN_APLICAVEL WHEN '1' THEN 'Desaplicar' ELSE 'Aplicar' END AS INFO_APLICAR,
          (select QT_INICIAL from TPO_ITEM (NOLOCK) 
           where NR_PROCESSO = I.NR_PROCESSO
             AND CD_EMPRESA = I.CD_EMPRESA
             AND NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE
             AND NR_PARCIAL = I.NR_PARCIAL) QT_DISP, I.CD_EMPRESA
        FROM TFLP_PO_ITEM I (NOLOCK)
          INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = I.NR_PROCESSO AND P.CD_CLIENTE = I.CD_EMPRESA  
          LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = I.CD_EVENTO)
          LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = I.CD_RESP_REALIZACAO)
        WHERE P.NR_PROCESSO = @NR_PROCESSO
          AND I.NR_ITEM_CLIENTE = @NR_ITEM_CLIENTE
          AND I.NR_PARCIAL = @NR_PARCIAL
        ORDER BY I.NR_ORDEM, I.NR_ITEM_CLIENTE, I.NR_PARCIAL" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
                <asp:QueryStringParameter Name="NR_ITEM_CLIENTE" QueryStringField="nr_item_cliente" />
                <asp:QueryStringParameter Name="NR_PARCIAL" QueryStringField="nr_parcial" />
            </SelectParameters>
        </asp:SqlDataSource>   
        </div>   
        </div>     
    <asp:SqlDataSource ID="SqlFollowup" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"/>           
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
    <div id="divInfoCorpo" class="divDetalhes"></div>   
    <div id="divData" class="divDetalhes2"></div>  
    <div id="divDataLote" class="divDetalhes2"></div>  
    <div id="divObs" class="divDetalhes2">
    <asp:FormView ID="frmFollowupObs" runat="server" DataKeyNames="NR_PROCESSO" DataSourceID="SqlFollowupObs" BorderWidth="0px" DefaultMode="Edit">
    <EditItemTemplate>
    <div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaObs();" style="cursor:pointer;"></div>
    <div style="float:left;width:400px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;">
    <br />
    <div style="float:left;width:175px">
    <asp:TextBox ID="txtPedidoObs" runat="server" CssClass="textbox" Width="100px" ReadOnly="true" BackColor="#DEE6EF" Height="20px" Font-Size="10pt" Text='<%# Container.DataItem("NR_PROCESSO") %>'/></div>
    <div style="height:30px;width:200px;overflow:hidden;top:0px;text-align:right;">
    <asp:ImageButton ID="imgSalvarObs" runat="server" ImageUrl="\imagens\salvar3_16.gif" style="cursor:pointer;border:0;" ToolTip="Salvar Observações" align="right" OnClick="SalvarObs"/>    
    </div>
    <asp:TextBox ID="txtObs" runat="server" CssClass="textbox" Width="380px" BackColor="#DEE6EF" Height="215px" Font-Size="10pt" TextMode="MultiLine" Text='<%# Replace(Eval("TX_OBS"),Chr(34),Chr(39)) %>' style="overflow:auto;"/><br />
    </div>
    <br />
    </EditItemTemplate>
    </asp:FormView>
     <asp:SqlDataSource ID="SqlFollowupObs" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ISNULL(PO.TX_OBS,'') AS TX_OBS, PO.NR_PROCESSO 
     FROM TFLP_PO PO (NOLOCK) 
     INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) 
     WHERE P.NR_PROCESSO = @NR_PROCESSO  AND PO.CD_EVENTO = '022'">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /></SelectParameters>
    </asp:SqlDataSource>
    </div>     
    <div id="divObsItem" class="divDetalhes2">        
    <asp:FormView ID="frmFollowupObsItem" runat="server" DataKeyNames="NR_PROCESSO, NR_ITEM_CLIENTE" DataSourceID="SqlFollowupObsItem" BorderWidth="0px" DefaultMode="Edit">
    <EditItemTemplate>
    <div id="divFechar"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar" align="right" onclick="FechaObsItem();" style="cursor:pointer;"></div>
    <div style="float:left;width:400px;color:#000000;font-size:9pt;font-family:verdana;text-align:left;padding-left:10px;">
    <br />
    <div style="float:left;width:175px">
    <asp:TextBox ID="txtPedidoObsItem" runat="server" CssClass="textbox" Width="100px" ReadOnly="true" BackColor="#DEE6EF" Height="20px" Font-Size="10pt" Text='<%# Container.DataItem("NR_PROCESSO") %>'/></div>
    <div style="height:30px;width:200px;overflow:hidden;top:0px;text-align:right;">
    <asp:ImageButton ID="imgSalvarObsItem" runat="server" ImageUrl="\imagens\salvar3_16.gif" style="cursor:pointer;border:0;" ToolTip="Salvar Observações" align="right" OnClick="SalvarObsItem"/>    
    </div>
    <asp:TextBox ID="txtObs" runat="server" CssClass="textbox" Width="380px" BackColor="#DEE6EF" Height="215px" Font-Size="10pt" TextMode="MultiLine" Text='<%# Replace(Eval("TX_OBS"),Chr(34),Chr(39)) %>' style="overflow:auto;"/><br />
    </div>
    <br />
    </EditItemTemplate>
    </asp:FormView>
     <asp:SqlDataSource ID="SqlFollowupObsItem" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT ISNULL(PO.TX_OBS,'') AS TX_OBS, PO.NR_PROCESSO, PO.NR_ITEM_CLIENTE  
     FROM TFLP_PO_ITEM PO (NOLOCK) 
     INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) 
     WHERE P.NR_PROCESSO = @NR_PROCESSO  AND PO.CD_EVENTO = '022' AND PO.NR_ITEM_CLIENTE = @NR_ITEM_CLIENTE AND CONVERT(VARCHAR, PO.NR_PARCIAL) = @NR_PARCIAL">
    <SelectParameters>
    <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /> 
    <asp:QueryStringParameter Name="NR_ITEM_CLIENTE" QueryStringField="item_cliente" /> 
    <asp:QueryStringParameter Name="NR_PARCIAL" QueryStringField="nr_parcial" /> 
    </SelectParameters>    
    </asp:SqlDataSource>
    </div> 
    <div id="divItemParcialCabec" class="divDetalhes3" style="background-color:#f0f1f6;border-bottom-width:0px;text-align:right;"><a href="#" onclick="FechaItemParcial();"><img src="/imagens/icones/16x16/btn_fechar21.gif" width="18" height="17" border="0" alt="Fechar"></a></div>
    <div id="divItemParcial" class="divDetalhes" style="background-color:#f0f1f6;"></div>    
    <div id="divPrincipalFollowupPOCabec" style="float:left;background-color:#374BAE;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalFollowupPOLink" href="#" style="text-decoration:none;cursor:default;color:#FFFFFF;" onclick="carregaTelas('divPrincipalFollowupPO','divPrincipalFollowupPOItem');">PO</a></center></div>    
    <div id="divPrincipalFollowupPOItemCabec" style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divPrincipalFollowupPOItemLink" href="#" style="text-decoration:none;cursor:pointer;color:#374BAE;" onclick="carregaTelas('divPrincipalFollowupPOItem', 'divPrincipalFollowupPO');">Item/Parcial</a></center></div> 
    <div style="background-color:#FFFFFF;border-color:#374BAE;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
    <div id="divPrincipalFollowupPO" style="display:block;">
    <div style="float:left;width:175px">&nbsp;</div>
    <div style="height:30px;width:450px;overflow:hidden;top:0px;text-align:right;">
    <img src="\imagens\cancelar2_16.gif" style="cursor:pointer;" alt="Cancelar/Voltar" onclick="javascript:document.location = 'followup_principal.aspx?acao=lista&usuario=<%=Session("usuario")%>';"/>
    </div><br />
    <asp:Label ID="lblUnidade" runat="server" Text="Unidade" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdUnidade" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_UNID_NEG") %>' onBlur ="javascript:preencheNome('TUNID_NEG', 'CD_UNID_NEG', 'NM_UNID_NEG', this, 'frmFollowupPrincipal_txtNmUnidade');" MaxLength="2"/>        
    <asp:TextBox ID="txtNmUnidade" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgUnidade" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Unidades de Negócio','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_UNID_NEG&nome=NM_UNID_NEG&tabela=TUNID_NEG&usuario=<%=Session("usuario")%>&campo=frmFollowupPrincipal_txtCdUnidade','followup_consulta', 500, 200,31);"/><br /><br />
    <asp:Label ID="lblCliente" runat="server" Text="Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" Text='<%# Container.DataItem("CD_CLIENTE") %>' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'frmFollowupPrincipal_txtNmCliente');verificaConsistencia(this,'CLIENTE',this.value);" MaxLength="5"/> 
    <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="377px" ReadOnly="true" BackColor="#DEE6EF"/>
    <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Lista de Empresas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&usuario=<%=Session("usuario")%>&campo=frmFollowupPrincipal_txtCdCliente&cd_cargo=<%=Session("cd_cargo")%>','followup_consulta', 500, 200,-7);"/><br /><br />
    <asp:Label ID="lblPedido" runat="server" Text="Pedido" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="110px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrPedido" MaxLength="18" runat="server" CssClass="textbox" Width="150px" Text='<%# Container.DataItem("NR_PEDIDO") %>' BackColor="#DEE6EF"/> 
    <img id="imgPedido" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/>&nbsp;&nbsp;
    <asp:Label ID="lblProcesso" runat="server" Text="Processo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="90px" CssClass="lbl"/>&nbsp;
    <asp:TextBox ID="txtNrProcesso" MaxLength="10" runat="server" CssClass="textbox" Width="150px" Text='<%# Container.DataItem("NR_PROCESSO2") %>' BackColor="#DEE6EF"/> 
    <img id="imgProcesso" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;"/><br /><br />
    <div style="height: 25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
        <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
        <td style="width:230px;">Evento</td>
        <td style="width:125px">Usuário</td>
        <td style="width:25px">Aplicar</td>
        <td style="width:180px">Realização</td>      
        </tr></table>
    </div>
    <div id="divgrdFollowupPO" style="height:80px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdFollowupPO" runat="server" DataSourceID="SqlFollowupPO"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="25px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="598px" ShowHeader="False" OnRowDataBound="pintaLinha">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Sem informações" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="25px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="CD_EVENTO" HeaderText="" SortExpression="CD_EVENTO" ItemStyle-Width="25px"/>
                <asp:BoundField DataField="NM_EVENTO" HeaderText="" SortExpression="NM_EVENTO" ItemStyle-Width="205px" ItemStyle-HorizontalAlign = "Left"/>
                <asp:BoundField DataField="AP_USUARIO" HeaderText="" SortExpression="AP_USUARIO" ItemStyle-Width="85px"/>
                <asp:TemplateField>
                <ItemTemplate><img src="\imagens\icones\16x16\checks\<%# Eval("IN_APLICAR")%>.gif" width="16px" height="16px" style="cursor:pointer;" alt="<%# Eval("INFO_APLICAR")%>" onclick="aplicarEvento('aplica=<%# Eval("IN_APLICAR")%>&tp_atualiza=1&cd_evento=<%# Eval("CD_EVENTO")%>&nr_processo=<%# Eval("NR_PROCESSO2")%>&cd_usuario=<%=Session("usuario")%>','<%# LCase(Eval("INFO_APLICAR"))%>','1');"/></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="140px">
                    <ItemTemplate><label style="width:100px;font-size:7pt;font-family:Verdana;text-align:center;"><%#Container.DataItem("DT_REALIZACAO")%></label><a id="hl_data" onclick="javascript:ExibeData('tp_atualiza=1&cd_evento=<%# Eval("CD_EVENTO")%>&nr_processo=<%# Eval("NR_PROCESSO2")%>&cd_usuario=<%=Session("usuario")%>');" class="nounderline"><img src="\imagens\edit1.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Editar"/></a> <a id="hl_hoje" onclick="preencheData('cd_usuario=<%=Session("usuario")%>&tp_atualiza=1&nr_processo=<%# Eval("NR_PROCESSO2")%>&cd_evento=<%# Eval("CD_EVENTO")%>&dt_realizacao=<%# Eval("DATA_HOJE") %>','1');" class="nounderline"><img src="\imagens\calendar1.gif" width="16px" height="16px" style="cursor:pointer;border-width:0px;" alt="Hoje"/></a>  
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlFollowupPO" runat="server"
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand="SELECT P.NR_PROCESSO AS NR_PROCESSO2, F.NR_PROCESSO, F.CD_EVENTO, F.CD_RESP_REALIZACAO, ISNULL(CONVERT(VARCHAR,F.DT_REALIZACAO,103),'-') AS DT_REALIZACAO, CONVERT(VARCHAR, GETDATE(), 103) AS DATA_HOJE,
                  F.DT_PREVISTA, F.DT_LIMITE, E.NM_EVENTO, U.AP_USUARIO,
                  CASE F.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE F.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, F.CD_EMPRESA, CASE F.IN_APLICAVEL WHEN '1' THEN 'Desaplicar' ELSE 'Aplicar' END AS INFO_APLICAR
                FROM TFLP_PO F (NOLOCK)
                  INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = F.NR_PROCESSO AND P.CD_CLIENTE = F.CD_EMPRESA
                  LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = F.CD_EVENTO)
                  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = F.CD_RESP_REALIZACAO)
                WHERE P.NR_PROCESSO = @NR_PROCESSO
                ORDER BY F.NR_ORDEM" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
            </SelectParameters>
        </asp:SqlDataSource>   
        </div></div>
        <div id="divPrincipalFollowupPOItem" style="display:none;">
        <div style="float:left;width:600px;">
        <asp:TextBox ID="txtPedido" runat="server" CssClass="textbox" Width="120px" ReadOnly="true" Text='<%# Container.DataItem("NR_PEDIDO") %>' BackColor="#DEE6EF" Height="20px" Font-Size="10pt"/>&nbsp;&nbsp;
        <asp:label ID="txtNomeCliente" style="vertical-align:bottom;cursor:default;" Font-Names="Verdana" Font-Bold="False" runat="server"  Width="469px" ReadOnly="true" Text='<%# left(UCase(Eval("NM_EMPRESA")),40) & " (" & Eval("CGC_EMPRESA") & ")" %>'  Height="20px" Font-Size="10pt" CssClass="lbl" ToolTip='<%#UCase(Eval("NM_EMPRESA"))%>'/>
        </div>
        <div style="height:30px;width:25px;overflow:hidden;top:0px;text-align:right;">
        <img src="\imagens\cancelar2_16.gif" style="cursor:pointer;" alt="Cancelar/Voltar" onclick="javascript:document.location = 'followup_principal.aspx?acao=lista&usuario=<%=Session("usuario")%>';"/>
        </div><br />   
        <asp:Label ID="lblItemCliente" runat="server" Text="Item Cliente/Parcial" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="140px" CssClass="lbl"/>&nbsp;       
        <img src="\imagens\icones\16x16\first1.gif" width="16px" height="16px" alt="Primeiro Item" style="cursor:pointer;" onclick="carregaFollowup('1');"/>
        <img src="\imagens\icones\16x16\prev1.gif" width="16px" height="16px"  alt="Item Anterior" style="cursor:pointer;" onclick="carregaFollowup('2');"/> 
        <img src="\imagens\icones\16x16\next1.gif" width="16px" height="16px"  alt="Próximo Item"  style="cursor:pointer;" onclick="carregaFollowup('3');"/> 
        <img src="\imagens\icones\16x16\last1.gif" width="16px" height="16px"  alt="Primeiro Item" style="cursor:pointer;" onclick="carregaFollowup('4');"/>&nbsp;        
        <asp:TextBox ID="txtItemCliente" MaxLength="4" runat="server" CssClass="textbox" Width="60px" BackColor="#DEE6EF" ReadOnly="true"/>
        <img id="imgItemCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeItemParcial('tabela=ITEM_CLIENTE&campo=frmFollowupPrincipal_txtItemCliente&nr_processo=<%=Request.QueryString("nr_processo")%>','-45',0,'80','1');"/>
        <asp:Label ID="lblBarra" runat="server" Text="/" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="5px" CssClass="lbl"/>
        <asp:TextBox ID="txtParcial" MaxLength="4" runat="server" CssClass="textbox" Width="20px" BackColor="#DEE6EF" ReadOnly="true"/>
        <img id="imgParcial" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeItemParcial('tabela=PARCIAL&campo=frmFollowupPrincipal_txtParcial&nr_processo=<%=Request.QueryString("nr_processo")%>&nr_item_cliente='+document.getElementById('frmFollowupPrincipal_txtItemCliente').value+'','-45',116,'40','2');"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblInvoice" runat="server" Text="Invoice" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="60px" CssClass="lbl"/>&nbsp;
        <asp:TextBox ID="txtInvoice" runat="server" CssClass="textbox" Width="120px" BackColor="#DEE6EF" ReadOnly="true"/><br />
        <asp:Label ID="lblFinalidade" runat="server" Text="" Font-Names="Verdana" Font-Size="9pt" Font-Bold="true" Width="575px" CssClass="lbl"/>
        <br /><br /> 
        <div style="height:25px;width:600px;overflow:hidden;border-color:#374BAE;border-style:solid;border-width:1px;text-align:center;">
        <table style="font-size:9pt;font-family:verdana;font-weight:bold;color:#FFFFFF;height:25px;BORDER-COLLAPSE:collapse;text-align:center;" bgcolor="#374BAE" cellpadding="4"><tr>
        <td style="width:210px;">Evento</td>
        <td style="width:120px">Usuário</td>
        <td style="width:20px">Aplicar</td>
        <td style="width:210px">Realização</td>      
        </tr></table>
        </div>
        <div id="divgrdFollowupPOItem" style="height:236px;width:600px;overflow:auto;border-color:#374BAE;border-style:solid;border-width:1px;overflow:auto;">
        <asp:GridView ID="grdFollowupPOItem" runat="server" DataSourceID="SqlFollowupPOItem"  DataKeyNames="NR_PROCESSO"
            AllowSorting="True" AutoGenerateColumns="False" BorderColor="#374BAE" BorderWidth="0px" 
                BorderStyle="Solid"   Font-Names="verdana" 
                AlternatingRowStyle-BackColor="#FFFFFF" RowStyle-Height="25px" 
                CellPadding="4" HorizontalAlign="left"  RowStyle-HorizontalAlign="center" 
            Font-Size="7pt" Width="598px" ShowHeader="False"  OnRowDataBound="pintaLinhaItem">   
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#FFFFFF"/>   
            <EmptyDataTemplate>       
            <asp:Image ID="imgLogoEmpty" runat="server" ImageUrl="../../imagens/alerta_32.gif" style="vertical-align:middle;" ImageAlign="AbsMiddle"/><asp:Label ID="lblEmptyLista" runat="server" Text="Sem informações" style="font-family:Verdana;font-size:9pt"/>
             </EmptyDataTemplate>     
            <RowStyle HorizontalAlign="Center" Height="25px" BackColor="#DEE6EF"></RowStyle>
            <Columns>
                <asp:BoundField DataField="CD_EVENTO" HeaderText="" SortExpression="CD_EVENTO" ItemStyle-Width="20px"/>
                <asp:BoundField DataField="NM_EVENTO" HeaderText="" SortExpression="NM_EVENTO" ItemStyle-Width="200px" ItemStyle-HorizontalAlign = "Left"/>
                <asp:BoundField DataField="AP_USUARIO" HeaderText="" SortExpression="AP_USUARIO" ItemStyle-Width="90px"/>
                <asp:TemplateField>
                   <ItemTemplate><img src="\imagens\icones\16x16\checks\<%# Eval("IN_APLICAR")%>.gif" width="16px" height="16px" style="cursor:pointer;" alt="<%# Eval("INFO_APLICAR")%>" onclick="aplicarEvento('aplica=<%# Eval("IN_APLICAR")%>&tp_atualiza=1&cd_evento=<%# Eval("CD_EVENTO")%>&nr_processo=<%# Eval("NR_PROCESSO2")%>&cd_usuario=<%=Session("usuario")%>','<%# LCase(Eval("INFO_APLICAR"))%>','2');"/></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="180px">
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_data" runat="server" EnableTheming="True" Text='<%# Container.DataItem("DT_REALIZACAO")%>' Font-Names="verdana" class="nounderline"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="#FFFFFF"></AlternatingRowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlFollowupPOItem" runat="server" 
            ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123" 
            SelectCommand=" SELECT I.NR_PROCESSO, NR_ITEM, I.CD_EVENTO, I.CD_RESP_REALIZACAO, CONVERT(VARCHAR,I.DT_REALIZACAO,103) AS DT_REALIZACAO, CONVERT(VARCHAR, GETDATE(), 103) AS DATA_HOJE,
          I.DT_PREVISTA, I.DT_LIMITE, I.NR_ITEM_CLIENTE, E.NM_EVENTO, U.AP_USUARIO,
          CASE I.IN_APLICAVEL WHEN '1' THEN 'X' ELSE '' END IN_APLICAVEL, CASE I.IN_APLICAVEL WHEN '1' THEN '0' ELSE '1' END AS IN_APLICAR, CASE I.IN_APLICAVEL WHEN '1' THEN 'Desaplicar' ELSE 'Aplicar' END AS INFO_APLICAR,
          (select QT_INICIAL from TPO_ITEM (NOLOCK) 
           where NR_PROCESSO = I.NR_PROCESSO
             AND CD_EMPRESA = I.CD_EMPRESA
             AND NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE
             AND NR_PARCIAL = I.NR_PARCIAL) QT_DISP, I.CD_EMPRESA
        FROM TFLP_PO_ITEM I (NOLOCK)
          INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = I.NR_PROCESSO AND P.CD_CLIENTE = I.CD_EMPRESA  
          LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = I.CD_EVENTO)
          LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = I.CD_RESP_REALIZACAO)
        WHERE P.NR_PROCESSO = @NR_PROCESSO
          AND I.NR_ITEM_CLIENTE = @NR_ITEM_CLIENTE
          AND I.NR_PARCIAL = @NR_PARCIAL
        ORDER BY I.NR_ORDEM, I.NR_ITEM_CLIENTE, I.NR_PARCIAL" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" />
                <asp:QueryStringParameter Name="NR_ITEM_CLIENTE" QueryStringField="nr_item_cliente" />
                <asp:QueryStringParameter Name="NR_PARCIAL" QueryStringField="nr_parcial" />
            </SelectParameters>
        </asp:SqlDataSource>  
        </div>    
         <div style="height:20px;width:581px;overflow:hidden;text-align:right;vertical-align:text-bottom;"><asp:CheckBox ID="cbTodosItens" runat="server" Text="Efetuar as alterações em todos os itens" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false"  CssClass="lbl"/></div>       
        </div>    
    <asp:SqlDataSource ID="SqlFollowup" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"/>           
   </EditItemTemplate>
   </asp:FormView>
   <asp:SqlDataSource ID="SqlFollowupPrincipal" runat="server" ConnectionString="Data Source=INDAIA10;Initial Catalog=BROKER;Persist Security Info=True;User ID=sa;Password=123"
    SelectCommand="SELECT NR_PROCESSO, SUBSTRING(NR_PROCESSO,5,15) AS NR_PROCESSO2, NR_REFERENCIA AS NR_PEDIDO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) AS NM_EMPRESA, (SELECT SUBSTRING(CGC_EMPRESA,1,2)+'.'+SUBSTRING(CGC_EMPRESA,3,3)+'.'+SUBSTRING(CGC_EMPRESA,6,3)+'/'+SUBSTRING(CGC_EMPRESA,9,4)+'-'+SUBSTRING(CGC_EMPRESA,13,2) FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) AS CGC_EMPRESA, CD_SERVICO, CD_USUARIO,
  DT_ABERTURA, HR_ABERTURA, DT_PEDIDO, HR_PEDIDO, CD_IMPORTADOR, CD_EXPORTADOR, CD_AREA,
  CD_ANALISTA_COMISSARIA, CD_ANALISTA_CLIENTE, CD_INCOTERM, NR_ORDEM, NR_VOO, NR_VIAGEM,
  CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR_CONHECIMENTO, CD_TP_PEDIDO, IN_CANCELADO,
  IN_LIBERADO, IN_CONSOLIDADO, IN_SEGURO, IN_URGENTE, IN_DADOS_IGUAIS_ITENS, CD_GRUPO,
  CD_AGENTE, NR_COURRIER, NR_REF_EXPORTADOR, CD_PAIS_ORIGEM, CD_TERMO_PAGTO,
  DIAS_CONDICAO_PAGTO, CONDICAO_PAGTO FROM TPROCESSO (NOLOCK) 
  WHERE NR_PROCESSO = @NR_PROCESSO">
    <SelectParameters><asp:QueryStringParameter Name="NR_PROCESSO" QueryStringField="nr_processo" /></SelectParameters>
    </asp:SqlDataSource>
    </div> 
    <br />
   </form>
   <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;"><a href="../../default.asp" style="text-decoration:none;color:#4058CC;"><img src="../../imagens/voltar1.gif" style="border:0px"/></a></div><div style="bottom:2px;height:20px;position:absolute;right:5px"> <a href="http://www.instantssl.com" id="comodoTL">SSL</a><script type="text/javascript">  TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>
</body>
</html>
