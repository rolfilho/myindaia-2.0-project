<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
Response.Buffer = True 
Response.AddHeader "cache-control", "private" 
Response.AddHeader "pragma", "no-cache" 
Response.ExpiresAbsolute = #January 1, 1990 00:00:01# 
Response.Expires=0 
dim cnnBroker, cmdBroker, rsBroker
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

sub subFechaBroker()
	if rsBroker.State  = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing

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
setTimeout("ExibeNavioImp();", 2000);
setTimeout("ExibeNavioExp();", 2000);
setTimeout("ExibeInfoEmpresa('0');", 2000);

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
            vCorpo.innerHTML = "<br><br><center><img src='/imagens/icones/32x32/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
            vCorpo.innerHTML = "<br><br><center><img src='/imagens/icones/32x32/<%=bg_loading %>.gif' align='absmiddle'></center>";
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

function ExibeInfoEmpresa(pagina) {
    var vCorpo = document.getElementById('divInfoEmp');
    var ajax = openAjax();
    ajax.open("GET", "/detalhe/info_empresa_default.asp?pagina=" + pagina + "&detalhe=0", true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><br><center><img src='/imagens/icones/32x32/<%=bg_loading %>.gif' align='absmiddle'></center>";
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

function ExibeInfoEmpresaDetalhe(pagina) {
    var vCorpo = document.getElementById('divInfoEmpDetalhe');
    var ajax = openAjax();
    ajax.open("GET", "/detalhe/info_empresa_default.asp?pagina=" + pagina + "&detalhe=1", true);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 1) {
            vCorpo.innerHTML = "<br><br><br><br><center><img src='/imagens/icones/32x32/<%=bg_loading %>.gif' align='absmiddle'></center>";
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
</script>
<%
in_show = True
cd_tela = "001"
nm_tela = tx_lang_002020(cd_lang)
tx_erro = Request.QueryString("tx_erro")
'err.Raise "232",script,"FALHA!!!"


'SQLs
'QTDE PESSOAS ONLINE DA MESMA EMPRESA
Dim cont_usuario_online
cont_usuario_online = 0
if InStr("040;055;088;131;", cd_cargo) > 0 then
    sql = " SELECT COUNT(U.CD_USUARIO) - 1 AS CONTADOR " &_
    " FROM TUSUARIO U (NOLOCK)" & _ 
    " WHERE U.IN_ONLINE = '1' " & _
    " AND U.CD_CARGO NOT IN ('040','055','088','131') "
Else
    sql = " SELECT COUNT(U.CD_USUARIO) - 1 AS CONTADOR " &_
    " FROM TPERMISSAO_GRUPO TP (NOLOCK) " &_
    " INNER JOIN TGRUPO   TG (NOLOCK) ON TP.CD_GRUPO = TG.CD_GRUPO " &_
    " INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = TP.CD_USUARIO " &_
    " WHERE TP.CD_USUARIO = '"&session("cd_usuario") & "'" &_
    "   AND U.IN_ONLINE = '1'"
End If 
call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
if rsBroker("CONTADOR") > 0 Then cont_usuario_online = rsBroker("CONTADOR")
call subFechaBroker()

'ULTIMO ACESSO
Dim dt_ult_acesso, hr_ult_acesso
sql = " SELECT CONVERT(VARCHAR, DT_ULT_ACESSO, 103) AS DT_ULT_ACESSO, LEFT(CONVERT(VARCHAR, DT_ULT_ACESSO, 108), 5) AS HR_ULT_ACESSO " &_
      " FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '" & session("cd_usuario") & "'"
call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
dt_ult_acesso = rsBroker("DT_ULT_ACESSO")
hr_ult_acesso = rsBroker("HR_ULT_ACESSO")
call subFechaBroker()

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
              " M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_CD_VIEW AS CD_VIEW"&_
              " FROM MYINDAIA.DBO.M06_VIEW M06 (NOLOCK) " &_
              " INNER JOIN MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) ON M17.M17_CD_VIEW = M06.M06_CD_VIEW " &_
              " INNER JOIN MYINDAIA.DBO.M01_MENU      M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU " &_
              " INNER JOIN MYINDAIA.DBO.M02_SUBM      M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
              " WHERE M06.M06_CD_USUARIO = '" & session("cd_usuario") & "'" &_
              " AND M17.M17_DT_ULT_PESQUISA IS NOT NULL"
    Else
        cont_relatorio = CStr(cont_relatorio)
        sql = " SELECT DISTINCT M06.M06_NM_VIEW AS NOME, M01.M01_AP_MENU AS AP_MENU, M02.M02_AP_SUBM AS AP_SUBM, " &_
              " M06.M06_CD_MENU AS CD_MENU, M06.M06_CD_SUBM AS CD_SUBM, M06.M06_CD_VIEW AS CD_VIEW"&_
              " FROM MYINDAIA.DBO.M06_VIEW M06 (NOLOCK) " &_
              " INNER JOIN MYINDAIA.DBO.M17_VIEW_CONS M17 (NOLOCK) ON M17.M17_CD_VIEW = M06.M06_CD_VIEW " &_
              " INNER JOIN MYINDAIA.DBO.M01_MENU      M01 (NOLOCK) ON M01.M01_CD_MENU = M06.M06_CD_MENU " &_
              " INNER JOIN MYINDAIA.DBO.M02_SUBM      M02 (NOLOCK) ON M02.M02_CD_MENU = M06.M06_CD_MENU AND M02.M02_CD_SUBM = M06.M06_CD_SUBM "&_
              " WHERE M06.M06_CD_USUARIO = '" & session("cd_usuario") & "'" &_
              " AND M17.M17_DT_ULT_PESQUISA IS NOT NULL"
    End If
    call subConectaBroker("INDAIA10","BROKER",SQLUSERNAME,SQLPASSWORD)
    rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText

    If cont_relatorio > 1 Then
    texto_relatorio =  "<br>Seus <font style='color:#000000;font-size:10pt;font-weight:bold;'>" & cont_relatorio & "</font> " &_ 
                       "últimos relatórios gerados foram os sequintes:</font><br>" 
    Else
    texto_relatorio =  "<br>Seu último relatório gerado foi o sequinte:</font><br>" 
    End If 
    Do While Not rsBroker.Eof
        texto_relatorio = texto_relatorio & "<a style='cursor:pointer;' href='/" & Trim(rsBroker("AP_MENU"))& "/" & Trim(rsBroker("AP_SUBM"))& "_filtros.asp?"&_
                                            "cd_menu=" & rsBroker("CD_MENU") & "&cd_subm=" & rsBroker("CD_SUBM") & "&cd_view=" & _
                                           "" & rsBroker("CD_VIEW") & "&ultima_pesquisa=1' target='_self'>"&_
                                            "<img src='/imagens/icones/16x16/folder_close20.gif' align='absmiddle' alt='" & UCase(rsBroker("NOME")) & "' style='border:0;'>" &_
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
<body>
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
		<td width="100%" valign="top" <%If Session("cd_usuario") = "2184" Then%>background="/imagens/fundo_06.jpg" <%End If%>><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop" style="height:100%;padding-left:20px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr style="height:50px;"><td>
                        <font style="color:#5985a8;font-size:12pt;font-weight:bold;"><%= Session("nm_usuario")%>, bem vindo(a) ao MyIndaiáWeb.</font><br />
                        <font style="color:<%=bg_color_tema_fonte%>;font-size:10pt;font-weight:bold;">Você e mais <%=cont_usuario_online%> pessoa(s) da sua empresa estão utilizando o sistema nesse momento.</font><br />
                        </td></tr></table></td>
					</tr>					
				</table>
                <table width="759px" border="0" cellpadding="0" cellspacing="2"><tr><td style="width:248px;vertical-align:top;" rowspan="2">
                <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_top.jpg);height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;&nbsp;Meus Favoritos</td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;border-bottom-width:0px; text-align:left;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    Acesse seus relatórios mais utilizados<br />
                    com um único clique, diretamente daqui<br />
                    da página principal do nosso sistema.<br />
                    <br />        
                    <div>        
	                <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="225px" height="141px" id="carousel_oficial" align="middle">
	                <param name="allowScriptAccess" value="sameDomain" />
	                <param name="allowFullScreen" value="false" />
	                <param name="movie" value="carousel_oficial.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />	<embed src="carousel_oficial.swf" quality="high" bgcolor="#ffffff" width="225px" height="135px" name="carousel2" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
	                </object>
                    </div>
                    </td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_bottom.jpg);height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				 </table></td><td style="width:501px;vertical-align:top;" colspan="2">
                 <table width="501px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_top_grande.jpg);height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;&nbsp;Meu Último Acesso</td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;height:70px;border-bottom-width:0px;text-align:left;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    Seu último acesso foi feito no dia <span class="cl_bold"><%= dt_ult_acesso%></span> as <span class="cl_bold"><%=hr_ult_acesso %></span> horas.<br />
                    <%=texto_relatorio %></td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_bottom_grande.jpg);height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                </tr>
                <tr>
                <td style="width:248px;vertical-align:top;">
                 <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_top.jpg);height:23px;background-repeat:no-repeat;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;&nbsp;Minhas Previsões de Embarque</td>
					</tr>	
                    <tr>
                    <td style="border:1px solid #b5c2e2;height:50px;border-bottom-width:0px;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                    <div id="divNavioImp" style="height:90px"></div>
                    </td>	
                    </tr>
                    <tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_bottom.jpg);height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                 <td style="width:248px;vertical-align:top;">
                 <table width="248px" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_top.jpg);height:23px;text-align:left;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;&nbsp;Minhas Previsões de Chegada</td>
					</tr>	
                    <tr>
                        <td style="border:1px solid #b5c2e2;height:50px;border-bottom-width:0px;vertical-align:top;padding:10 10 0 10;color:<%=color_texto%>;" class="cl_bold2">
                        <div id="divNavioExp" style="height:90px"></div>
                        </td>
                    </tr>	
                    <tr>
						<td align="center" style="background-image:url(\imagens\fundo_info_bottom.jpg);height:9px;background-repeat:no-repeat;">&nbsp;</td>
					</tr>		
				</table>
                </td>
                </tr>
                <tr>
                <td style="width:752px;vertical-align:top;" colspan="3">
                 <table width="752px" border="0" cellspacing="0" cellpadding="0">
					<tr><td align="left" style="background-image:url(\imagens\fundo_info_top_grande2.jpg);height:23px;color:<%=bg_color_tema_fonte%>;" class="cl_bold3">&nbsp;&nbsp;Minha Empresa em <%= meses(Month(Date)-1) %></td></tr>	
                    <tr><td style="border:1px solid #b5c2e2;border-bottom-width:0px;padding:10 10 0 10;">
                    <div id="divInfoEmp" style="height:149px">
                    </div>
                    </td></tr>	
                    <tr><td align="center" style="background-image:url(\imagens\fundo_info_bottom_grande2.jpg);height:8px;background-repeat:no-repeat;">&nbsp;</td></tr>		
				</table></td></tr></table>
			</div>
            <div id="divInfoSistema" style="width:235px;height:360px;right:50px;position:absolute;top:135px;text-align:justify;color:<%=color_texto%>;background-image:url(\imagens\exclamacao.jpg);background-repeat:no-repeat;">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;Mostre para todos na sua empresa os benefícios de se utilizar o myIndaiáWeb.<br />
            &nbsp;&nbsp;&nbsp;&nbsp;Faça dele sua página inicial e nos traga sugestões de novas ferramentas e melhorias para o sistema.<br />
            &nbsp;&nbsp;&nbsp;&nbsp;Com o myIndaiáWeb você tem todas as informações disponibilizadas em tempo real, trazendo segurança, transparência e comodidade na hora de gerar os dados que você mais precisa, no formato que você deseja, com apenas alguns cliques.<br />
            &nbsp;&nbsp;&nbsp;&nbsp;Você já tem um relatório que poderia ser muito útil para todos da sua equipe? Copie para eles e seja o responsável por melhorar o processo e o rendimento de todos.</span>
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
</html>

