<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
Response.Buffer = True 
Response.AddHeader "cache-control", "private" 
Response.AddHeader "pragma", "no-cache" 
Response.ExpiresAbsolute = #January 1, 1990 00:00:01# 
Response.Expires=0 
dim cnnBroker, cmdBroker, rsBroker
dim cnnMy, cmdMy, rsMy
sub subConectaBroker(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnBroker = Server.CreateObject("ADODB.Connection")
	set cmdBroker = Server.CreateObject("ADODB.Command")
	set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnBroker.Open cnstr
end sub

sub subConectaMy(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnMy = Server.CreateObject("ADODB.Connection")
	set cmdMy = Server.CreateObject("ADODB.Command")
	set rsMy  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
	cnnMy.Open cnstr
end sub

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing

end sub

sub subFechaMy()
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing

end sub
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Página inicial após autenticação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 17/06/2005
'
'Manutenção: 22/06/2006
'---------------------------------------------------------------------------
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->

<script language="javascript" type="text/javascript">
setTimeout("ExibeAviso();", 2000);

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

function ExibeNavioImp() {
    var vCorpo = document.getElementById('divNavioImp');
    var ajax = openAjax();
    ajax.open("GET", "/detalhe/navio_default.asp?produto=01", true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><center><img src='/imagens/30/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
            }
        }
    }
    ajax.send(null);
}

function ExibeNavioExp() {
    var vCorpo = document.getElementById('divNavioExp');    
    var ajax = openAjax();
    ajax.open("GET", "/detalhe/navio_default.asp?produto=02", true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><center><img src='/imagens/30/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
            }
        }
    }
    ajax.send(null);
}


//function ExibeInfoEmpresa(pagina) {
  //  var vCorpo = document.getElementById('divInfoEmp');
//    var ajax = openAjax();
    //ajax.open("GET", "/detalhe/info_empresa_default.asp?pagina=" + pagina + "&detalhe=0", true);
    //ajax.onreadystatechange = function () {
        //if (ajax.readyState == 1) {
            //vCorpo.innerHTML = "<br><br><br><center><img src='/imagens/30/<%=bg_loading %>.gif' align='absmiddle'></center>";
        //}
        //if (ajax.readyState == 4) {
            //if (ajax.status == 200) {
                //var vResult = ajax.responseText;
                //vResult = vResult.replace(/\+/g, " ");
                //vResult = unescape(vResult);
                //vCorpo.innerHTML = vResult;
                //var scripts = vCorpo.getElementsByTagName("script");
                //for (i = 0; i < scripts.length; i++) {
                    //s = scripts[i].innerHTML;
                    //eval(s);
                //}
            //}
        //}
    //}
    //ajax.send(null);
//}

function ExibeInfoEquipe() {
    var vCorpo = document.getElementById('divInfoEquipe');
    var ajax = openAjax();
    ajax.open('GET', '/detalhe/info_equipe_default.asp?usuario=<%=Session("cd_usuario") %>', true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><center><img src='/imagens/30/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
            }
        }
    }
    ajax.send(null);
}

function ExibeInfoUsuario() {
    var vCorpo = document.getElementById('divInfoUsuario');
    var ajax = openAjax();
    ajax.open('GET', '/detalhe/info_usuario_default.asp?usuario=<%=Session("cd_usuario") %>&cargo=<%=Session("cd_cargo") %>', true);
    ajax.onreadystatechange = function () {
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
            }
        }
    }
    ajax.send(null);
}


function ExibeInfoEmpresaDetalhe(pagina) {
    var vCorpo = document.getElementById('divInfoEmpDetalhe');
    var ajax = openAjax();
    ajax.open("GET", "/detalhe/info_empresa_default.asp?pagina=" + pagina + "&detalhe=1", true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><br><br><center><img src='/imagens/30/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
            }
        }
    }
    ajax.send(null);
}

function visualizaUsuarios(cd_usuario, total, contador) {
    var div = document.getElementById(cd_usuario);
    var img = document.getElementById("img" + cd_usuario);
    if (div.style.display == 'block') {
        div.style.display = 'none';
        if (total == contador) {
            img.src = "/imagens/30/plus_t_fim.gif";
        } else {
            img.src = "/imagens/30/plus_t.gif";
        }
    } else {
        div.style.display = 'block';
        if (total == contador) {
            img.src = "/imagens/30/minus_t_fim.gif";
        } else {
            img.src = "/imagens/30/minus_t.gif";
        }
    }
}

function carregaInfoSistema() {
    var x = screen.width;
    if (x > 800 && '<%=Session("mostra_dashboard") %>' == '1') {
        document.getElementById('dv_corpo').style.visibility = 'visible';
        setTimeout("ExibeInfoUsuario();", 2000);
        setTimeout("ExibeNavioImp();", 2000);
        setTimeout("ExibeNavioExp();", 2000);
        //setTimeout("ExibeInfoEmpresa('0');", 2000);
        setInterval("ExibeInfoUsuario();", 60000);
        setInterval("ExibeNavioImp();", 300000);
        setInterval("ExibeNavioExp();", 300000)
        if ('<%=Session("InManagerSite")%>' == '1') {
            setTimeout("ExibeInfoEquipe();", 2000);
            setInterval("ExibeInfoEquipe();", 60000);
        }
        if (x > 1024) {
            document.getElementById('divInfoSistema').style.display = 'block';
            document.getElementById('dv_corpo').style.paddingLeft = "10px"
            if (x > 1280) {
                document.getElementById('divInfoSistema').style.right = '50px';
            } else {
                document.getElementById('divInfoSistema').style.right = '15px';
            }
        } else {
            document.getElementById('dv_corpo').style.paddingLeft = "0px";
            document.getElementById('dv_corpo').style.overflowX = "hidden";
        }
    } else {
        if (x > 800) {
            if ('<%=Session("cd_cargo") %>' == '055') {
                document.getElementById('dv_corpo').style.display = 'block';
                setTimeout("ExibeInfoUsuario();", 2000);
                setTimeout("ExibeInfoEquipe();", 2000);
                setInterval("ExibeInfoEquipe();", 60000);
                if (x > 1024) {
                    document.getElementById('divInfoSistema').style.display = 'block';
                    document.getElementById('dv_corpo').style.paddingLeft = "10px"
                    if (x > 1280) {
                        document.getElementById('divInfoSistema').style.right = '50px';
                    } else {
                        document.getElementById('divInfoSistema').style.right = '15px';
                    }
                } else {
                    document.getElementById('dv_corpo').style.paddingLeft = "0px";
                    document.getElementById('dv_corpo').style.overflowX = "hidden";
                }
            }
            //mostra(menu, menuimg, document.getElementById('colunaseta'));
        } else {
            document.getElementById('dv_corpo').style.visibility = 'hidden';
            document.getElementById('divInfoResolucao').style.display = 'block';
            mostra(menu, menuimg, document.getElementById('colunaseta'));
        }
    }
}


function ExibeAviso() {
    if ('<%=Session("login_valido")%>' == 'True' && '<%=Session("cd_cargo")%>' != '088') {
        if (document.getElementById) {
            var vAviso = document.getElementById('divAvisoCorpo');
            var vAvisoTitulo = document.getElementById('divAvisoTitulo');
            var vAvisoRodape = document.getElementById('divAvisoRodape');

            var x = screen.width;
            var y = screen.height;

            var w = 650;
            var z = 400;
            
	        var y1 = (y / 5);
            var y2 = Math.round(y1);
            var y3 = ((y - y2) - z) / 2;
            var y4 = Math.round(y3);
            var x1 = ((x) - w) / 2
            var x2 = Math.round(x1);            
            
            //iniciamos o ajax
            var ajax = openAjax();
            //usado o GET para que se possa usar filtros querystring
            ajax.open("POST", "/popup/carrega_aviso.asp?usuario=<%=Session("cd_usuario") %>", true);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) { //agora exibe o que interessa
                    if (ajax.status == 200) {
                        var vResult = ajax.responseText; //resultado da busca
                        vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                        vResult = unescape(vResult); //continua resolvendo problemas de acento
                        if (vResult != 'ERRO'){
                            vAvisoTitulo.style.width = w;
                            vAvisoTitulo.style.height = 26;
                            vAvisoTitulo.style.left = (x2);
                            vAvisoTitulo.style.top = ((y4) / 2) - 26+70;
                            vAvisoTitulo.style.display = "block";
                            vAvisoTitulo.style.filter = "alpha(opacity=91)";

                            vAviso.style.width = w;
                            vAviso.style.height = z;
                            vAviso.style.left = (x2);
                            vAviso.style.top = ((y4) / 2) - 2 +70;
                            vAviso.style.display = "block";
                            vAviso.style.filter = "alpha(opacity=91)";

                            vAvisoRodape.style.width = w;
                            vAvisoRodape.style.height = 20;
                            vAvisoRodape.style.left = (x2);
                            vAvisoRodape.style.top = ((y4) / 2) +70+400-2;
                            vAvisoRodape.style.display = "block";
                            vAvisoRodape.style.filter = "alpha(opacity=91)";
                            //window.focus();
                            vAviso.innerHTML = vResult;
                        }
                    } else {
                        //alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
                        vAviso.innerHTML = ajax.responseText;
                    }
                }
            }
            ajax.send(null); // submete
        }
    }
}


function FechaAviso(aviso) {
    document.getElementById('divAvisoCorpo').style.display = 'none';
    document.getElementById('divAvisoTitulo').style.display = 'none';
    document.getElementById('divAvisoRodape').style.display = 'none';
    //alteraAviso(aviso);	
}

function FechaAvisoDiv(aviso, usuario) {
    var id = usuario + aviso;
    var cont_div = 'contador_div_' + usuario;
    document.getElementById(id).style.display = 'none';
    document.getElementById(cont_div).value = parseInt(document.getElementById(cont_div).value) - 1;
    if (document.getElementById(cont_div).value == 0){
        FechaAviso();
    } 
}

function alteraAviso(aviso){
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/muda_visualizado.asp?usuario=<%=Session("cd_usuario") %>&aviso="+ aviso , true);
		ajax.send(null); // submete
	}
}

function executaAcao(aviso, btn){
    if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/executa_acao.asp?aviso="+ aviso + "&btn=" + btn + "&usuario=<%=Session("cd_usuario")%>", true);        
		ajax.send(null); // submete
	}
}
</script>
<%
in_show = True
cd_tela = "001"
nm_tela = tx_lang_002020(cd_lang)
tx_erro = Request.QueryString("tx_erro")
'err.Raise "232",script,"FALHA!!!"
'Response.write grupo_detalhe
'SQLs
'QTDE PESSOAS ONLINE DA MESMA EMPRESA


'ULTIMO ACESSO
Dim dt_ult_acesso, hr_ult_acesso
dt_ult_acesso = Session("dt_ult_acesso")
hr_ult_acesso = Session("hr_ult_acesso")

'ULTIMOS RELATORIOS
Dim cont_relatorio, texto_relatorio
sql = " SELECT COUNT(DISTINCT M17_CD_VIEW) AS CONTADOR FROM MYINDAIA.DBO.M17_VIEW_CONS (NOLOCK) " &_
      " WHERE SUBSTRING(M17_CD_VIEW, 1, 4) = '" & session("cd_usuario") & "' " &_
      " AND M17_DT_ULT_PESQUISA IS NOT NULL"
call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
cont_relatorio = rsBroker("CONTADOR")
call subFechaBroker()

If cont_relatorio > 0 Then 
    If cont_relatorio > 2 Then
        cont_relatorio = CStr(3)
        sql = " SELECT DISTINCT TOP 3 M06.M06_NM_VIEW AS NOME, M01.M01_AP_MENU AS AP_MENU, M02.M02_AP_SUBM AS AP_SUBM, " &_
              " M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_CD_VIEW AS CD_VIEW, MAX(M17.M17_DT_ULT_PESQUISA) "&_
              " FROM MYINDAIA.DBO.M06_VIEW M06 (NOLOCK) " &_
              " INNER JOIN MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) ON M17.M17_CD_VIEW = M06.M06_CD_VIEW " &_
              " INNER JOIN MYINDAIA.DBO.M01_MENU      M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU " &_
              " INNER JOIN MYINDAIA.DBO.M02_SUBM      M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
              " WHERE M06.M06_CD_USUARIO = '" & session("cd_usuario") & "'" &_
              " AND M17.M17_DT_ULT_PESQUISA IS NOT NULL "&_
              " GROUP BY M06.M06_NM_VIEW, M01.M01_AP_MENU, M02.M02_AP_SUBM, M06.M06_CD_MENU, M06.M06_CD_SUBM, M06.M06_CD_VIEW "&_
              " ORDER BY MAX(M17.M17_DT_ULT_PESQUISA) DESC "
    Else
        cont_relatorio = CStr(cont_relatorio)
        sql = " SELECT DISTINCT M06.M06_NM_VIEW AS NOME, M01.M01_AP_MENU AS AP_MENU, M02.M02_AP_SUBM AS AP_SUBM, " &_
              " M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_CD_VIEW AS CD_VIEW, MAX(M17.M17_DT_ULT_PESQUISA) "&_
              " FROM MYINDAIA.DBO.M06_VIEW M06 (NOLOCK) " &_
              " INNER JOIN MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) ON M17.M17_CD_VIEW = M06.M06_CD_VIEW " &_
              " INNER JOIN MYINDAIA.DBO.M01_MENU      M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU " &_
              " INNER JOIN MYINDAIA.DBO.M02_SUBM      M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
              " WHERE M06.M06_CD_USUARIO = '" & session("cd_usuario") & "'" &_
              " AND M17.M17_DT_ULT_PESQUISA IS NOT NULL"&_
              " GROUP BY M06.M06_NM_VIEW, M01.M01_AP_MENU, M02.M02_AP_SUBM, M06.M06_CD_MENU, M06.M06_CD_SUBM, M06.M06_CD_VIEW "&_
              " ORDER BY MAX(M17.M17_DT_ULT_PESQUISA) DESC "
    End If
    call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
    rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText

    If cont_relatorio > 1 Then
    texto_relatorio =  "<br>" & tx_lang_001024(cd_lang) & "<font style='color:#000000;font-size:10pt;font-weight:bold;'>" & cont_relatorio & "</font> " &_ 
                      tx_lang_001025(cd_lang) & "</font><br>" 
    Else
    texto_relatorio =  "<br>" & tx_lang_001026(cd_lang) & "</font><br>" 
    End If 
    Do While Not rsBroker.Eof
        texto_relatorio = texto_relatorio & "<a style='cursor:pointer;' href='/" & Trim(rsBroker("AP_MENU"))& "/" & Trim(rsBroker("AP_SUBM"))& "_filtros.asp?"&_
                                            "cd_menu=" & rsBroker("CD_MENU") & "&cd_subm=" & rsBroker("CD_SUBM") & "&cd_view=" & _
                                           "" & rsBroker("CD_VIEW") & "&ultima_pesquisa=1' target='_self'>"&_
                                            "<img src='/imagens/30/folder_close.gif' align='absmiddle' alt='" & UCase(rsBroker("NOME")) & "' style='border:0;'>" &_
                                            " <font style='color:#000000;font-size:10pt;font-weight:bold;font-style:italic;'>"
        If Len(rsBroker("NOME")) > 15 Then
            texto_relatorio = texto_relatorio & Left(UCase(rsBroker("NOME")), 15) & "..."
        Else
            texto_relatorio = texto_relatorio & UCase(rsBroker("NOME"))
        End If         
        texto_relatorio = texto_relatorio & "</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"

        rsBroker.MoveNext
        If rsBroker.Eof Then Exit Do
    Loop
    call subFechaBroker()
End if
%>
<html>
<head>
<meta name=”robots” content=”noindex”>
<!--#include file="includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" href="/includes/style_carousel2.css" />
<script language="javascript">    AC_FL_RunContent = 0;</script>
<script src="AC_RunActiveContent.js" language="javascript"></script>
<script language="javascript" src="/includes/jquery-1.4.2.min.js"></script>
<script language="javascript" src="/includes/jquery.jcarousel.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#mycarousel').jcarousel({
            start: 1, scroll: 1
        });
    });
</script>
</head>
<body onload="javascript:carregaInfoSistema();">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include file="includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include file="includes/lay_menu.asp" -->
            
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
        
		<td width="100%" valign="top" background="<%= fcn_TrocaFundo()%>"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop" style="visibility:hidden;height:100%;padding-left:0px;scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr style="height:50px;"><td>
                        <font style="color:#5985a8;font-size:12pt;font-weight:bold;"><%= Session("nm_usuario")%>, <%=tx_lang_001003(cd_lang)%></font><br />
                        <font style="color:<%=bg_color_tema_fonte%>;font-size:10pt;font-weight:bold;"><div id="divInfoUsuario" style="height:16px;width:462px;display:inline;"></div></font>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <%If Session("cargo_interno") = "1" Then 
                        %>
                        <select id="selectGrupo"  class="select" style="width:275px;border-style:0px;" onChange="MudaGrupoDetalhe(this);">
                        <%
                        sql = "SELECT CD_GRUPO, UPPER(NM_GRUPO) AS NM_GRUPO FROM TGRUPO WHERE IN_ATIVO = '1' ORDER BY NM_GRUPO"
                        call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
                        rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText                        
                        grupo_detalhe = Session("GrupoDetalhe")
                        Session("GrupoUsuarioDefault") = grupo_detalhe
                        Do While Not rsBroker.Eof

                        If rsBroker("CD_GRUPO") = grupo_detalhe Then
					        grupo_selec = "selected"
				        Else
					        grupo_selec = ""
				        End If

                        %>
                        <option value="<%=rsBroker("CD_GRUPO")%>" <%=grupo_selec %>><%=rsBroker("NM_GRUPO")%></option>
                        <%
                        rsBroker.MoveNext
                        If rsBroker.Eof Then Exit Do
                        Loop
                        call subFechaBroker()                        
                         %>
                        </select>
                        <%End If %>
                        <br />
                        </td></tr></table></td>
					</tr>					
				</table>               
                <table width="759px" border="0" cellpadding="0" cellspacing="2">
                 <%If Session("cd_cargo") <> "055" Then %>
                <tr><td style="width:248px;vertical-align:top;" rowspan="2">
                <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_top.jpg');height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/favorite16.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001006(cd_lang) %></td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;border-bottom-width:0px; text-align:left;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    <%=tx_lang_001007(cd_lang)%><br />
                    <%=tx_lang_001008(cd_lang)%><br />
                    <%=tx_lang_001009(cd_lang)%><br />
                    <br />        
                    <%
                    Dim cont_img, nome_relatorio
                    sql = "SELECT DISTINCT M06.M06_NM_VIEW AS NOME, M06.M06_CD_MENU AS CD_MENU,  M01.M01_NM_MENU AS NM_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_CD_VIEW AS CD_VIEW "&_
                    " FROM MYINDAIA.DBO.M06_VIEW M06 (NOLOCK) "&_
                    " INNER JOIN MYINDAIA.DBO.M01_MENU M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU" &_
                    " WHERE M06.M06_CD_USUARIO = '" & Session("cd_usuario") & "' "&_
                    "   AND M06.M06_IN_PADRAO = '1'"&_
                    " ORDER BY M06.M06_CD_MENU, M06.M06_NM_VIEW"
                    call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
                    rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText

                    If rsBroker.RecordCount > 0 Then               
                    cont_img = 1
                    %>                    
                    <div id="wrap" style="text-align:center;">
                       <ul id="mycarousel" class="jcarousel-skin-tango">   
                       <% Do While Not rsBroker.Eof %>                
                         <li id="li<%= cont_img%>"><a href="/import/track_filtros.asp?cd_menu=<%= rsBroker("CD_MENU")%>&cd_subm=<%= rsBroker("CD_SUBM")%>&cd_view=<%= rsBroker("CD_VIEW")%>"><img src="/imagens/30/relatorio_selecionado2.gif" alt="<%=Trim(rsBroker("NOME")) & " (" & Trim(rsBroker("NM_MENU")) & ")"%>" style="cursor:pointer;border:0;" id="<%= cont_img%>"/></a></li>                    
                       <%                       
                       cont_img = cont_img + 1
                       rsBroker.MoveNext
                       If rsBroker.Eof then Exit Do
                       Loop %> 
                       </ul> 
                       <div id="nomeRelatorio" style="text-align:center;text-transform:uppercase;vertical-align:top;height:46px;margin-top:-35px;color:#000000;"></div>
                    </div>                    
                    <%Else %>
                    <br />
                    <div style="float:left;width:33px;">
                    <img src="/imagens/30/atencao20.gif" alt="" />
                    </div>
                    <div style="height:126px;width:175px;">
                    <span class="cl_bold"><center><%=tx_lang_001010(cd_lang) %></center></span>
                    </div>
                    <%End If %>
                    </td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_bottom.jpg');height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				 </table></td><td style="width:501px;vertical-align:top;" colspan="2">
                 <table width="501px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_top_grande.jpg');height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/acesso16.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001011(cd_lang)%></td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;height:70px;border-bottom-width:0px;text-align:left;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    <%=tx_lang_001012(cd_lang) %><span class="cl_bold"><%= dt_ult_acesso%></span><%=tx_lang_001013(cd_lang)%><span class="cl_bold"><%=hr_ult_acesso %></span><%=tx_lang_001014(cd_lang)%><br />
                    <%=texto_relatorio %></td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_bottom_grande.jpg');height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                </tr>
                <tr>
                <td style="width:248px;vertical-align:top;">
                 <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_top.jpg');height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/ship162.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001015(cd_lang)%></td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;height:50px;border-bottom-width:0px;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    <div id="divNavioImp" style="height:90px;"></div>
                    </td>	
                    </tr>
                    <tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_bottom.jpg');height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                 <td style="width:248px;vertical-align:top;">
                 <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_top.jpg');height:23px;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/ship162.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001016(cd_lang)%></td>
					</tr>	
                    <tr>
                        <td style="border:1px solid #b5c2e2;height:50px;border-bottom-width:0px;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                        <div id="divNavioExp" style="height:90px;"></div>
                        </td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_bottom.jpg');height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                </tr>
              
                <!--
                <tr>
                <td style="width:752px;vertical-align:top;" colspan="3">
                 <table width="752px" border="0" cellspacing="0" cellpadding="0">
					<tr><td align="left" style="background-image:url(\imagens\30\fundo_info_top_grande2.jpg);height:23px;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/empresa16.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001017(cd_lang)%><%= meses(Month(Date)-1) %></td></tr>	
                    <tr><td style="border:1px solid #b5c2e2;border-bottom-width:0px;padding:10 10 0 10;">
                    <div id="divInfoEmp" style="height:149px">
                    </div>
                    </td></tr>	
                    <tr><td align="center" style="background-image:url(\imagens\30\fundo_info_bottom_grande2.jpg);height:8px;background-repeat:no-repeat;">&nbsp;</td></tr>		
				</table></td></tr>
				-->
				
                <%End If %>
                 <%If Session("InManagerSite") = "1" or Session("cd_cargo") = "055" Then %>
                <tr>
                <td style="width:752px;vertical-align:top;" colspan="3">
                  <table width="752px" border="0" cellspacing="0" cellpadding="0">
					<tr><td align="left" style="background-image:url('http://myindaiaweb.com.br:80/imagens/fundo_info_top_grande2.jpg');height:23px;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;<img src="/imagens/30/group16.gif" style="cursor:pointer;border:0;" align="absmiddle" height="13"/>&nbsp;<%=tx_lang_001018(cd_lang)%><%= meses(Month(Date)-1) %></td></tr>	
                    <tr align="center"><td style="border:1px solid #b5c2e2;border-bottom-width:0px;padding:10 10 0 10;">
                    <div id="divInfoEquipe" style="height:130px">
                    </div>
                    </td></tr>	
                    <tr><td align="center" style="background-image:url('http://myindaiaweb.com.br:80/imagens/Fundo_info_bottom_grande2.jpg');height:8px;background-repeat:no-repeat;">&nbsp;</td></tr>		
				</table></td></tr>  
                <%End If %>                   
                </table>
			</div>
            <div id="divInfoSistema" style="width:230px;height:360px;right:15px;position:absolute;top:135px;text-align:justify;color:<%=color_texto%>;background-image:url("\imagens\exclamacao.jpg");background-repeat:no-repeat;display:none;">
            <span>&nbsp;&nbsp;&nbsp;<%=tx_lang_001020(cd_lang) %><br />
            &nbsp;&nbsp;&nbsp;<%=tx_lang_001021(cd_lang) %><br />
            &nbsp;&nbsp;&nbsp;<%=tx_lang_001022(cd_lang) %><br />
            &nbsp;&nbsp;&nbsp;<%=tx_lang_001023(cd_lang) %></span>
            </div>
            <div id="divInfoResolucao" style="width:290px;height:360px;position:absolute;top:135px;text-align:center;display:none;left:260px;"><span><img src="/imagens/30/atencao20.gif" style="cursor:pointer;border:0;margin-left:-20px" align="absmiddle" width="32px" height="32px"/> <b><font size="3"><%=tx_lang_A00002(cd_lang) %></font></b><br /> 
            <%=tx_lang_001019(cd_lang)%><br />
            </span>
            </div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr height="16">
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include file="includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
<script type="text/javascript" language="javascript">
    function MudaGrupoDetalhe(combo) {
        var vStatus = combo.value;
        if (document.getElementById) {
            var ajax = openAjax();
            ajax.open("GET", "/popup/muda_grupo_detalhe.asp?status=" + vStatus, true);
            ajax.send(null); // submete        
        }
        sleep(1000);
        location.href = '<%=script %>'
    }
</script>
</html>

