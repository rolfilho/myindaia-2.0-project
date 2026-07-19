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
    //location.href = 'https://www.myindaiaweb.com.br/autentica.asp?tx_erro=';
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
document.getElementById(id).style.background = 'white';
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
	document.getElementById('lblconfirma').style.display = 'block';
	document.getElementById('confirma').style.display = 'block';
	document.getElementById('entrar').style.display = 'none';
	document.getElementById('cancelar').style.display = 'none';
	document.getElementById('entrar3').style.display = 'block';
	document.getElementById('cancelar3').style.display = 'block';
	document.frm_logon.nova.focus();
	}	
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
<body onLoad="document.frm_logon.ap_usuario.focus();<%if alt_senha = 1 then%>fnc_expiraSenha();<% end if %>">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table" >
	<tr valign="top">
		<td height="87"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include file="includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="100%"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<form action="logon.asp" method="post" name="frm_logon" onSubmit="return fnc_ValidaLogin(this);">
					<tr>
						<td height="75" align="center"><h4><b><%= tx_lang_002001(cd_lang)%></b></h4></td>
					</tr>
					<tr>
						<td height="30" align="center"><%= tx_lang_002002(cd_lang) &" "& tx_lang_A00001(cd_lang)%>.<br>
							<%= tx_lang_002003(cd_lang)%>.</td>
					</tr>
					<tr>
						<td height="15" align="center">&nbsp;</td>
					</tr>
					<tr>
					  <td align="center"><table border="1" cellpadding="0" cellspacing="0" bordercolor="#b4c7db">
                        <tr>
                          <td align="center"><table border="0" cellspacing="0" cellpadding="3">
                            <tr align="center">
                              <td height="25" colspan="2" bgcolor="#b4c7db"><span class="style9"><%= tx_lang_002004(cd_lang)%></span></td>
                            </tr>
                            <tr>
                              <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="2"><span class="style10"></span></td>
                            </tr>
                            <tr>
                              <td align="right" width="240"><b>
                              <label for="login"><%= tx_lang_002005(cd_lang)%>:</label>
                              </b></td>
                              <td width="240"><input name="ap_usuario" id="login" type="text" class="editbox" size="15" onKeyPress="fnc_trocalbl('login');"></td>
                            </tr>
                            <tr>
                              <td align="right"width="240"><b>
                              <label for="senha"><%= tx_lang_002006(cd_lang)%>:</label>
                              </b></td>
                              <td width="240"><input name="cd_senha" id="senha" type="password" class="editbox" size="15" onKeyPress="fnc_trocalbl('senha');"></td>
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
                            <div id="lblnova" style="display:none;"><label for="nova"><%= tx_lang_002007(cd_lang)%>:</label></div></td>
                            <td width="240">
                            <div id="nova" style="display:none;"><input name="cd_senha_nova" id="nova" type="password" class="editbox" size="15"></div></td>
                            </tr>
                            <tr>
                           <td align="right" width="240">
                            <div id="lblconfirma" style="display:none;"><label for="confirma"><%= tx_lang_002008(cd_lang)%>:</label></div></td>
                            <td width="240">
                            <div id="confirma" style="display:none;"><input name="cd_senha_conf" id="confirma" type="password" class="editbox" size="15" onKeyPress="if(event.keyCode == 13){document.getElementById('enviar3').click();}"></div></td>
                            </tr>
                            <tr>
                              <td align="right" width="240"><div id="entrar" style="display:block;"><input name="enviar2" type="submit" class="button" id="enviar2" value="<%= tx_lang_002009(cd_lang)%>"></div></td>
                              <td width="240"><div id="cancelar" style="display:block;"><input name="cancelar2" type="button" class="button" id="cancelar2" value="<%= tx_lang_A00018(cd_lang)%>" onClick="javascript:window.top.close();"></div></td>
                            </tr>
                            <tr>
                              <td align="right" width="240"><div id="entrar3" style="display:none;"><input name="enviar3" type="submit" class="button" id="enviar3" value="<%=tx_lang_002018(cd_lang)%>/<%= tx_lang_002009(cd_lang)%>"></div></td>
                              <td width="240"><div id="cancelar3" style="display:none;"><input name="cancelar2" type="button" class="button" id="cancelar3" value="<%= tx_lang_A00018(cd_lang)%>" onClick="javascript:window.top.close();"></div></td>
                            </tr>
                            <tr>
                              <td colspan="2" align="center" width="240">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="2" align="center" bgcolor="#b4c7db" width="480"><span class="style10"><%=tx_lang_002019(cd_lang)%>.</span></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
					</tr>
					<!--
					<tr>
						<td height="15" align="center"><img src="imagens/pontilhado01.gif" width="519" height="9"></td>
					</tr>
					<tr>
						<td align="center">Para uma Busca Rápida de informações de Tracking de Pedido.<br>
							Informe o número de <a href="po_busca.asp">Purchasing Order</a> e Item(não é necessário).<br>
							<br>
							<b>
							<label for="referencia">N&uacute;mero da PO</label>
							/
							<label for="item">Item</label>
							:</b><br>
							<input name="nr_referencia" type="text" class="editbox" id="referencia" value="<%'= Request("nr_referencia")%>" size="20" maxlength="18">
							<b>/</b>
							<input name="nr_item" type="text" class="editbox" id="item" value="<%'= Request("nr_item")%>" size="3" maxlength="4">
							<br>
							<br>
							<input name="enviar" type="submit" class="button" id="enviar" value=" Buscar "></td>
					</tr>
					<tr>
						<td height="15" align="center">&nbsp;</td>
					</tr>
					<tr>
						<td height="25" align="center"><%= tx_lang_002010(cd_lang)%> <b>Net Track</b>: <a href="http://intra.indaialogistica.com.br" target="_blank"><%= tx_lang_A00005(cd_lang)%></a></td>
					</tr>
					-->
				</form>
			</table>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
	</tr>
	<tr>   
		<td height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include file="includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
<script language="JavaScript" type="text/javascript">  
    COT("https://www.myindaiaweb.com.br/imagens/comodo/cornertrust.gif", "SC2", "none");
</script>
</body>
</html>


