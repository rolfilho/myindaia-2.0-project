<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Page Language="VB" Debug="true"%>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%      Response.CacheControl = "no-cache"%>
<%      Response.AddHeader("cache-control", "no-cache")%>

<script runat="server">   
    Dim SqlAux As String
    Dim Cnn As String = "Data Source=INDAIA10;Initial Catalog=BROKER;User ID=sa;Password=123"
    Dim vCdGrupo, vCdMBF As String
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        If Session("usuario") = "" Then
            Session("usuario") = Request("usuario")
        End If
        
        If Request("cd_mbf") <> "" Then          
            CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            RsAux = CmdAux.ExecuteReader
            SqlAux = " SELECT * FROM TMBF_INFO (NOLOCK) WHERE CD_MBF = " & Request("cd_mbf")
            CnnAux = New SqlConnection(Cnn)
            CmdAux = New SqlCommand(SqlAux, CnnAux)
            CnnAux.Open()
            If RsAux.HasRows Then
                RsAux.Read()
                vCdGrupo = RsAux("CD_GRUPO")                
                RsAux.Close()
            End If
            CmdAux.Dispose()
            CnnAux.Close()                      
        End If        
    End Sub
    
    Sub CriarMBF(ByVal sender As Object, ByVal e As System.EventArgs)   
        Dim MaxCdMBF As Integer
        Dim Cliente, Area, Atendente As String
        Dim CnnAux As SqlConnection
        Dim CmdAux As SqlCommand
        Dim RsAux As SqlDataReader
        SqlAux = "SELECT ISNULL(MAX(CD_MBF), 0) + 1 AS MAXIMO FROM TMBF_INFO (NOLOCK) WHERE CD_USUARIO = '" & Session("usuario") & "'"
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        RsAux = CmdAux.ExecuteReader
        If RsAux.HasRows Then
            RsAux.Read()
            MaxCdMBF = RsAux("MAXIMO")
        Else
            MaxCdMBF = 1
        End If
        RsAux.Close()
        CmdAux.Dispose()
        CnnAux.Close()
        
        If Trim(txtCdCliente.Text) <> "" Then
            Cliente = "'" & txtCdCliente.Text & "'"
        Else
            Cliente = "NULL"
        End If
        
        If Trim(txtCdArea.Text) <> "" Then
            Area = "'" & txtCdArea.Text & "'"
        Else
            Area = "NULL"
        End If
        
        If Trim(txtCdAtendente.Text) <> "" Then
            Atendente = "'" & txtCdAtendente.Text & "'"
        Else
            Atendente = "NULL"
        End If
        
        SqlAux = " INSERT INTO TMBF_INFO (CD_MBF, NM_MBF, CD_USUARIO, CD_GRUPO, CD_CLIENTE, CD_AREA, CD_ATENDENTE, CD_PRODUTO, CD_USUARIO_CRIADOR, CD_MBF_CRIADOR) " & _
        " VALUES (" & MaxCdMBF & ", UPPER('" & txtNmMBF.Text & "'), '" & Session("usuario") & "' ,'" & txtCdGrupo.Text & "'," & Cliente & ", " & Area & ", " & Atendente & ",'" & Request("cd_menu") & "', '" & Session("usuario") & "', " & MaxCdMBF & ") "
        'Response.Write(SqlAux)
        'Response.end
        CnnAux = New SqlConnection(Cnn)
        CmdAux = New SqlCommand(SqlAux, CnnAux)
        CnnAux.Open()
        CmdAux.ExecuteNonQuery()
        CmdAux.Dispose()
        CnnAux.Close()
        Page.DataBind()
        Response.Redirect("/mbf/mbf_personaliza.aspx?usuario=" & Session("usuario") & "&codigo=" & MaxCdMBF & "&cd_menu=" & Request("cd_menu"))
        'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "script", "location.href='id_edita.aspx?acao=editar&id_codigo=" & txtIDCodigo.Text & "';", True)
    End Sub
    
    Sub PersonalizarMBF(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/mbf/mbf_personaliza.aspx?usuario=" & Request("usuario") & "&codigo=" & Request("usuario") & "&cd_menu=" & Request("cd_menu"))
    End Sub
    
    Sub VoltarMenu(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("usuario") = ""
        Session("nm_usuario") = ""
        Response.Redirect("/default.asp")
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

    function enviaValor(valor, tabela) {        
        if (tabela == 'TGRUPO') {
            document.getElementById('txtCdGrupo').value = valor;
            document.getElementById('txtCdGrupo').focus();
            document.getElementById('txtCdGrupo').blur();
        }
        if (tabela == 'TEMPRESA_NAC') {
            document.getElementById('txtCdCliente').value = valor;
            document.getElementById('txtCdCliente').focus();
            document.getElementById('txtCdCliente').blur();
        }
        if (tabela == 'TAREA') {
            document.getElementById('txtCdArea').value = valor;
            document.getElementById('txtCdArea').focus();
            document.getElementById('txtCdArea').blur();
        }
        if (tabela == 'TUSUARIO') {
            document.getElementById('txtCdAtendente').value = valor;
            document.getElementById('txtCdAtendente').focus();
            document.getElementById('txtCdAtendente').blur();
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
            vInfo.style.top = ((y4) / 2) - 20 + 118 + posicao;
            vInfo.style.display = "block";
            vInfo.style.filter = "alpha(opacity=95)";
            vTitulo.style.width = w - 25;
            vTitulo.innerHTML = "&nbsp;" + titulo;

            vCorpo.style.width = w;
            vCorpo.style.height = z;
            vCorpo.style.left = (x2) + 54;
            vCorpo.style.top = ((y4) / 2) + 140 + posicao;
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


</script> 
</head>
<body class="body" style="text-align:center;background-color:#f0f1f6;margin:0px 0px 0px 0px;width:100%;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="66" background="/imagens/fundo_logo_site2.jpg"><img src="/imagens/logo_site2.jpg"  border="0"/></td><td style="text-align:right;" background="/imagens/fundo_logo_site2.jpg"><img src="../../imagens/cabec_logos_mbf2.gif"/>&nbsp;&nbsp;&nbsp;</td></tr>	
    <tr><td colspan="2" background="/imagens/fundo_logo_site8.jpg" height="6px"></td></tr>
  </table>
  <form id="frmCriaMBF" runat="server" style="background-color:#f0f1f6;text-align:left;width:100%;text-align:center;margin-left:-710px;">
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
    <div id="divCria" style="border-width:0px;position:absolute;top:100px;text-align:left;">
    <div id="divCriaMBFCabec" style="background-color:#cd1414;border-color:#cd1414;border-style:solid;border-width:1px;border-top-width:1px;border-bottom-width:0px;width:140px;height:18px;color:#FFFFFF;font-family:Verdana;font-size:9pt;"><center><a id="divCriaMBFLink" href="#" style="text-decoration:none;cursor:pointer;color:#FFFFFF;">Criação de MBF</a></center></div>    
    <div id="divCriaMBF" style="background-color:#FFFFFF;border-color:#cd1414;border-style:solid;border-width:1px;padding-left:15px;padding-top:15px;padding-bottom:15px;padding-right:15px;border-top-width:1px;width:710px;text-align:center;height:420px;overflow:auto;">
      <br />
      <asp:Label ID="lblNome" runat="server" Text="Nome" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
      <asp:TextBox runat="server" class="textbox" Width="445px" ID="txtNmMBF" style="text-transform:uppercase;"/><br />
      <asp:Label ID="lblGrupo" runat="server" Text="Grupo" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdGrupo" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TGRUPO', 'CD_GRUPO', 'NM_GRUPO', this, 'txtNmGrupo');" MaxLength="3"/>        
      <asp:TextBox ID="txtNmGrupo" runat="server" CssClass="textbox" Width="370px" ReadOnly="true" BackColor="#e6e9ec"/>
      <img id="imgGrupo" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Grupos de Empresas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_GRUPO&nome=NM_GRUPO&tabela=TGRUPO','mbf_consulta_online', 424, 240,0);"/>   
      <asp:Label ID="lblCliente" runat="server" Text="Cliente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdCliente" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TEMPRESA_NAC', 'CD_EMPRESA', 'NM_EMPRESA', this, 'txtNmCliente');" MaxLength="5"/>        
      <asp:TextBox ID="txtNmCliente" runat="server" CssClass="textbox" Width="370px" ReadOnly="true" BackColor="#e6e9ec"/>
      <img id="imgCliente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Empresas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_EMPRESA&nome=NM_EMPRESA&tabela=TEMPRESA_NAC&codigo_aux='+document.getElementById('txtCdGrupo').value,'mbf_consulta_online', 424, 240,19);"/>         
      <asp:Label ID="lblArea" runat="server" Text="Área" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdArea" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TAREA', 'CD_AREA', 'NM_AREA', this, 'txtNmArea');" MaxLength="2"/>        
      <asp:TextBox ID="txtNmArea" runat="server" CssClass="textbox" Width="370px" ReadOnly="true" BackColor="#e6e9ec"/>
      <img id="imgArea" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Áreas','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_AREA&nome=NM_AREA&tabela=TAREA','mbf_consulta_online', 424, 240,38);"/>          
      <asp:Label ID="lblAtendente" runat="server" Text="Atendente" Font-Names="Verdana" Font-Size="9pt" Font-Bold="false" Width="125px" CssClass="lbl"/>&nbsp;
      <asp:TextBox ID="txtCdAtendente" runat="server" CssClass="textbox" Width="50px" Text='' onBlur ="javascript:preencheNome('TUSUARIO', 'CD_USUARIO', 'NM_USUARIO', this, 'txtNmAtendente');" MaxLength="2"/>        
      <asp:TextBox ID="txtNmAtendente" runat="server" CssClass="textbox" Width="370px" ReadOnly="true" BackColor="#e6e9ec"/>
      <img id="imgAtendente" src="../../imagens/icones/16x16/btn_folder.gif" alt="Buscar" align="middle" style="cursor:pointer;" onclick="ExibeDetalhes('Atendentes','divInfoCorpo','divInfo','divInfoRodape','codigo=CD_USUARIO&nome=NM_USUARIO&tabela=TUSUARIO2','mbf_consulta_online', 424, 240,57);"/><br /><br />          
      <asp:Button runat="server" Text="Criar" OnClick="CriarMBF" class="btn" Width="100px" style="cursor:pointer;"/>
    </div>
  </div>
  <div style="bottom:0px;height:30px;position:absolute;left:5px;vertical-align:top;font-weight:bold;font-family:Agency FB;font-size:15pt;">
  <asp:LinkButton ID="lbVoltar" runat="server" OnClick="VoltarMenu"><img src="../../imagens/voltar1.gif" style="border:0px" alt=""/></asp:LinkButton></div><div style="bottom:2px;height:20px;position:absolute;right:5px"> <script type="text/javascript">                                                                                                                                                                                                                                                                                              TrustLogo("https://www.myindaiaweb.com.br/imagens/comodo/cot_padlock.gif", "SC4", "none");</script></div>  
  </form>
</body>
</html>
