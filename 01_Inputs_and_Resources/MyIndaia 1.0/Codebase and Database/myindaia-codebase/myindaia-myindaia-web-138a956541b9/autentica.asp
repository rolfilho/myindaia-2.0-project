<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Página inicial após autenticação
'
'Modificado por Alexandre Gonçalves Neto em 17/06/2005
'
'---------------------------------------------------------------------------

'Response.write Request.ServerVariables("HTTP_REFERER")
'Response.end

Dim flag_autentica
flag_autentica = 1	
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "002"
nm_tela = tx_lang_002016(cd_lang) &" >>"
tx_erro = Request.QueryString("tx_erro")
alt_senha = Request.QueryString("alt_senha")
Session("login_valido") = false
%>
<html>
<head>
<!--#include file="includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--

    var url_autentica = String(window.location);

if (url_autentica.indexOf(':') < 5) {
    location.href = 'https://www.myindaiaweb.com.br/autentica.asp?tx_erro=';
}

if ('<%=tx_erro %>' != '') {
    alert('<%=tx_erro %>');
}

function fnc_expiraSenha(){
	document.frm_logon.ap_usuario.value='<%= Session("login")%>';
	document.frm_logon.cd_senha.value ='<%= Session("senha")%>';
	fnc_trocaSenha();
}

function fnc_trocalbl(id){
//document.getElementById(id).style.background = 'white';
document.getElementById('lblalterar').style.display = 'block';
document.getElementById('lblalterar2').style.display = 'none';
document.getElementById('lblalterar3').style.display = 'none';
}

function fnc_trocaSenha(){
if (document.getElementById('login').value == "" || document.getElementById('senha').value == ""){
	document.getElementById('lblalterar').style.display = 'none';
	document.getElementById('lblalterar2').style.display = 'none';
	document.getElementById('lblalterar3').style.display = 'block';
	if (document.getElementById('login').value == ""){
		document.getElementById('login').style.background = 'FFDDDD';
		document.getElementById('login').focus();
	}
	if (document.getElementById('senha').value == "") {
		document.getElementById('senha').style.background = 'FFDDDD';
		if (document.getElementById('login').value != ""){
			document.getElementById('senha').focus();
		}
	}
}else{
	document.getElementById('lblalterar').style.display = 'none';
	document.getElementById('lblalterar3').style.display = 'none';
	document.getElementById('lblalterar2').style.display = 'block';
	document.getElementById('lblnova').style.display = 'block';
	document.getElementById('nova').style.display = 'block';
	document.getElementById('lbl_senha_old').style.display = 'none';
	document.getElementById('cd_senha_old').style.display = 'none';
	document.getElementById('lblconfirma').style.display = 'block';
	document.getElementById('confirma').style.display = 'block';
	document.getElementById('entrar').style.display = 'none';
	document.getElementById('cancelar').style.display = 'none';
	document.getElementById('entrar3').style.display = 'block';
	document.getElementById('cancelar3').style.display = 'block';
	document.frm_logon.cd_senha_nova.focus();
	}	
}

function alteraBcOn(objeto) {
    var objeto = document.getElementById(objeto);
    objeto.style.backgroundColor = '#FFFDBF';
}

function alteraBcOff(objeto) {
    var objeto = document.getElementById(objeto);
    objeto.style.backgroundColor = '#FFFFFF';
}

function fnc_ValidaLogin(form) {
	var tx_erro = '<%= tx_lang_A00002(cd_lang)%>:\n\n';
	var valida  = true;
	
	if (form.ap_usuario.value == "") {
		form.ap_usuario.focus();
		form.ap_usuario.select();
		alert(tx_erro+'<%= tx_lang_002011(cd_lang)%>.');
		valida = false;
	}
	
	if (form.cd_senha.value.length>=15) {
		form.cd_senha.focus();
		form.cd_senha.select();
		alert('Máximo de 15 caracteres');
		valida = false;
	}
	
	if (form.cd_senha_nova.value.length>=15) {
		form.cd_senha_nova.focus();
		form.cd_senha_nova.select();
		alert('Máximo de 15 caracteres');
		valida = false;
	}
	
	if (form.cd_senha_conf.value.length>=15) {
		form.cd_senha_conf.focus();
		form.cd_senha_conf.select();
		alert('Máximo de 15 caracteres');
		valida = false;
	}
	
	if (form.cd_senha.value == "") {
		form.cd_senha.focus();
		form.cd_senha.select();
		alert(tx_erro+'<%= tx_lang_002012(cd_lang)%>.');
		valida = false;
	}
	
	if (form.cd_senha_nova.value != "" || form.cd_senha_conf.value != "") {
		if (form.cd_senha_nova.value == "") {
			form.cd_senha_nova.focus();
			form.cd_senha_nova.select();
			alert(tx_erro+'<%= tx_lang_002013(cd_lang)%>.');
			valida = false;
		} 
	
		if (form.cd_senha_conf.value == "") {
			form.cd_senha_conf.focus();
			form.cd_senha_conf.select();
			alert(tx_erro+'<%= tx_lang_002014(cd_lang)%>.');
			valida = false;
		}
	
		if (form.cd_senha_nova.value != form.cd_senha_conf.value) {
			form.cd_senha_nova.focus();
			form.cd_senha_nova.select();
			alert(tx_erro+'<%= tx_lang_002015(cd_lang)%>.');
			valida = false;
		} 
		if (form.cd_senha_nova.value != "") {
			if (form.cd_senha_nova.value == form.cd_senha.value) {
			form.cd_senha_nova.focus();
			form.cd_senha_nova.select();
			alert(tx_erro+'<%= tx_lang_002017(cd_lang)%>.');
			valida = false;
		  }
		}
	}
	return valida;
}
//-->
</script>
<style type="text/css">
<!--
.style9 {
	font-size: 12px;
	font-weight: bold;
}
.style10 {font-size: 12px}

.body_autentica{
font-family:verdana;
font-size:10px;
margin:0px 0px 0px 0px;
background-color:#b4c7db;
}

#divLogin{
height:150px;
position:absolute;
width:670px;
left:50%;
top:50%;
margin:-75px 0px 0px -335px;
background-image:url(imagens/30/login.jpg);background-position:center;background-repeat:no-repeat;
}

#divCampos{
position:absolute;
margin:17px 0px 0px -240px;
text-align:right;
}

#rdp{
background-color:#DEE6EF;
height:65px;
bottom:0;
left:0;
position:absolute;
width:100%;
}

#rdp2{
height:6px;
bottom:59px;
position:absolute;
width:100%;
}

#cbc{
background-color:#DEE6EF;
height:65px;
text-align:right;
}

#cbc2{
top:61px;
height:6px;
}

#cbc3{
 top:70px;
 width:100%;
 right:10px;
 position:absolute;
 text-align:right;
}

-->
</style>
<script language="javascript" type="text/javascript">
//<![CDATA[
    var cot_loc0 = (window.location.protocol == "https:") ? "https://secure.comodo.net/trustlogo/javascript/cot.js" :
"http://www.trustlogo.com/trustlogo/javascript/cot.js";
    document.writeln('<scr' + 'ipt language="JavaScript" src="' + cot_loc0 + '" type="text\/javascript">' + '<\/scr' + 'ipt>');
//]]>
</script>               
</head>
<body onload="document.frm_logon.ap_usuario.focus();<%if alt_senha = 1 then%>fnc_expiraSenha();<% end if %>" class="body_autentica">			
<div id="cbc"><img src="imagens/30/sgs.jpg" alt="SGS"/>&nbsp;&nbsp;<img src="imagens/30/iata2.jpg" alt="International Air Transport Association"/>&nbsp;&nbsp;<img src="imagens/30/fiata2.jpg" alt="International Federation of Freight Forwarders Associations"/>&nbsp;&nbsp;<img src="imagens/30/otm.jpg" alt="Operador de Transporte Multimodal"/>&nbsp;&nbsp;</div>
<div id="cbc2" style="background-image:url(imagens/30/fundo_logo_site4.jpg);background-repeat:repeat-x;"></div>
<div id="cbc3"><img src="imagens/30/logo_site3.jpg" alt="Indaiá Logística Internacional"/></div>
<form action="logon.asp" method="post" name="frm_logon" onsubmit="return fnc_ValidaLogin(this);">
<div id="divLogin"><div id="divCampos">
<table width="100%" border="0" cellpadding="0" cellspacing="0">				
	<tr>
		<td align="center"><table border="0" cellpadding="0" cellspacing="0" >
        <tr>
            <td align="center"><table border="0" cellspacing="0" cellpadding="3">                           
            <tr>
                <td align="right" width="240"><b>
                <label for="login"><%= tx_lang_002005(cd_lang)%>:</label>
                </b></td>
                <td width="240"><input name="ap_usuario" id="login" type="text" class="editbox" style="width:130px" onKeyPress="fnc_trocalbl('login');" onfocus="alteraBcOn(this.id);" onblur ="alteraBcOff(this.id);"></td>
            </tr>
            <tr>
                <td align="right"width="240">
                <div id="lbl_senha_old" style="display:block;"><b><label for="senha"><%= tx_lang_002006(cd_lang)%>:</label></b></div>
                </td>
                <td width="240">
                <div id="cd_senha_old" style="display:block;"><input name="cd_senha" id="senha" type="password" class="editbox" style="width:130px" onKeyPress="fnc_trocalbl('senha');" onfocus="alteraBcOn(this.id);" onblur ="alteraBcOff(this.id);"></div></td>
            </tr>
            <tr>
                <td  colspan="2"  align="center"><div id="lblalterar" style="display:block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=tx_lang_002024(cd_lang)%> <a href="#" onClick="javascript:fnc_trocaSenha();" ><strong><u><%= tx_lang_002021(cd_lang)%></u></strong></a>.</div></td></tr>
                <tr>
                <td  colspan="2"  align="center"><div id="lblalterar2" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=tx_lang_002022(cd_lang)%>:</div></td>
            </tr>
            <tr>
                <td  colspan="2"  align="center"><div id="lblalterar3" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=tx_lang_002023(cd_lang)%>.</div></td>
            </tr>
            <tr>
            <td align="right" width="240">
            <div id="lblnova" style="display:none;"><b><label for="cd_senha_nova"><%= tx_lang_002007(cd_lang)%>:</label></b></div></td>
            <td width="240">
            <div id="nova" style="display:none;"><input name="cd_senha_nova" id="cd_senha_nova" type="password" class="editbox" style="width:130px" onfocus="alteraBcOn(this.id);" onblur ="alteraBcOff(this.id);"></div></td>
            </tr>
            <tr>
            <td align="right" width="240">
            <div id="lblconfirma" style="display:none;"><b><label for="cd_senha_conf"><%= tx_lang_002008(cd_lang)%>:</label></b></div></td>
            <td width="240">
            <div id="confirma" style="display:none;"><input name="cd_senha_conf" id="cd_senha_conf" type="password" class="editbox" style="width:130px" onKeyPress="if(event.keyCode == 13){document.getElementById('enviar3').click();}" onfocus="alteraBcOn(this.id);" onblur ="alteraBcOff(this.id);"></div></td>
            </tr>
            <tr>
                <td align="right" width="240"><div id="entrar" style="display:block;"><input name="enviar2" type="submit" class="button" id="enviar2" value="<%= tx_lang_002009(cd_lang)%>" style="width:100px;"></div></td>
                <td width="240"><div id="cancelar" style="display:block;"><input name="cancelar2" type="button" class="button" id="cancelar2" value="<%= tx_lang_A00018(cd_lang)%>" onClick="javascript:window.top.close();" style="width:100px;"></div></td>
            </tr>
            <tr>
                <td align="right" width="240"><div id="entrar3" style="display:none;"><input name="enviar3" type="submit" class="button" id="enviar3" value="<%=tx_lang_002018(cd_lang)%>/<%= tx_lang_002009(cd_lang)%>" style="width:100px;"></div></td>
                <td width="240"><div id="cancelar3" style="display:none;"><input name="cancelar2" type="button" class="button" id="cancelar3" value="<%= tx_lang_A00018(cd_lang)%>" onClick="javascript:window.top.close();" style="width:100px;"></div></td>
            </tr>                          
            </table></td>
        </tr>
        </table>
        </td>
	</tr>
    </table></div>
    </div>					
</form>
<div id="rdp2" style="background-image:url(imagens/30/fundo_logo_site41.jpg);background-repeat:repeat-x;"></div>
<div id="rdp"></div>
<script language="JavaScript" type="text/javascript">
    COT("https://www.myindaiaweb.com.br/imagens/comodo/cornertrust.gif", "SC2", "none");
</script>                    
</body>
</html>


