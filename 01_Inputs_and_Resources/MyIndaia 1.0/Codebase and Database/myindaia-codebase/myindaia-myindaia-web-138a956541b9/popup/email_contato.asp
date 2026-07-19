<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'------------------------------------------------------------------
'Sistema MyIndaia - Detalhes de Processo
'Arquivo de Script e HTML: Enviar e-mail com informações do processo
'
'Criado: 05/10/2006
'Autor: Alexandre Gonçalves Neto
'Modificado: 
'------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim tx_email_analista 'guarda o email do analista de processo da indaia
Dim in_tipo 'tipo de acao que deverá ocorrer quandoa pagina for enviada
Dim in_acao 'acao que deve ocorrer quando a pagina é carregada
Dim tx_acao 'textoqua irá aparecer no botão de submit
Dim tx_para, tx_copia, tx_nome, tx_from, tx_subject, tx_body, tx_anexo, in_oculta, tx_oculta 'campos do form de e-mail
Dim tx_arquivos 'anexos do e-mail
Dim tx_html 'monta os comando html em tempo de execução

in_show = False
cd_tela = "PUP001"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
tx_erro = CStr(Request("tx_erro"))
in_acao = CStr(Request("in_acao"))
%>
<!--#include virtual="/detalhe/corpo_email.asp"-->
<%
Sub sub_MontaAnexos()
	If fnc_TestaVar(tx_anexo) Then
		If InStr(tx_anexo, ",") > 0 Then
			tx_arquivos = Split(tx_anexo, ",")
			For x = 0 to UBound(tx_arquivos)
				If fnc_TestaVar(tx_arquivos(x)) Then
					tx_arquivos(x) = Trim(tx_arquivos(x))
					str = tx_arquivos(x) &"<input type='hidden' name='tx_anexo' value='"& tx_arquivos(x) &"'> "&_
								"<a href=""javascript:fnc_Excluir('"& Replace(tx_arquivos(x),"\","\\") &"','"& in_acao &"');"">[Apagar]</a><br>"
					Response.Write(str)
				End If
			Next
		Else
			str = "<br>"& tx_anexo &"<input type='hidden' name='tx_anexo' value='"& tx_anexo &"'> "&_
						"<a href=""javascript:fnc_Excluir('"& Replace(tx_anexo,"\","\\") &"','"& in_acao &"');"">[Apagar]</a>"
			Response.Write(str)
		End If
	End If
End Sub

Sub fnc_ExcluirAnexo()
	If fnc_TestaVar(Request("tx_excluir")) Then
		tx_arquivos = Split(tx_anexo, ",")
		tx_anexo = ""
		For x = 0 To Ubound(tx_arquivos)
			tx_arquivos(x) = Trim(tx_arquivos(x))
			If tx_arquivos(x) <> Trim(Request("tx_excluir")) Then tx_anexo = tx_anexo &","& tx_arquivos(x)
		Next
	End If
End Sub

'inicia um novo e-mail
If in_acao = "novo" Then
  tx_para    = tx_email_analista
	tx_copia   = ""
  tx_nome    = Trim(Session("nm_usuario"))
  tx_from    = Trim(Session("nm_email"))
	in_oculta  = 1
  tx_subject = tx_subject
  tx_body    = tx_body
  tx_anexo   = ""
  in_tipo    = "ver"
	tx_acao    = tx_lang_POP058(cd_lang)
End If
'anexa um arquivo ou retorno para edição
If in_acao = "voltar" or in_acao = "anexar" Then
  tx_para    = Request("tx_para")
	tx_copia   = Request("tx_copia")
  tx_nome    = Request("tx_nome")
  tx_from    = Request("tx_from")
	in_oculta  = Request("in_oculta")
  tx_subject = Request("tx_subject")
  tx_body    = Request("tx_body")
  tx_anexo   = Request("tx_anexo")
  in_tipo    = "ver"
	tx_acao    = tx_lang_POP058(cd_lang)
	Call fnc_ExcluirAnexo()
End If
'visualiza antes do envio
If in_acao = "ver" Then
  tx_para    = Replace(Request("tx_para"), ";", "; ")
	tx_copia   = Replace(Request("tx_copia"), ";", "; ")
  tx_nome    = Request("tx_nome")
  tx_from    = Request("tx_from")
	in_oculta  = Request("in_oculta")
  tx_subject = Request("tx_subject")
  tx_body    = Request("tx_body")
  tx_anexo   = Request("tx_anexo")
  in_tipo    = "enviar"
	tx_acao    = tx_lang_POP059(cd_lang)
	Call fnc_ExcluirAnexo()
End If
'envia o e-mail
If in_acao = "enviar" Then
  tx_para    = Replace(Request("tx_para"), "; ", ";")
	tx_copia   = Replace(Request("tx_copia"), "; ", ";")
  tx_nome    = Request("tx_nome")
  tx_from    = Request("tx_from")
	in_oculta  = Request("in_oculta")
  tx_subject = Request("tx_subject")
  tx_body    = Request("tx_body")
  tx_anexo   = Request("tx_anexo")
  in_tipo    = "ok"
	tx_acao    = tx_lang_POP060(cd_lang)
	'verifica se será enviada cópia oculta
	If in_oculta = 1 Then tx_oculta = tx_from Else tx_oculta = Null
	'envia o e-mail
	If fnc_EnviaMail(tx_from, tx_para, tx_copia, tx_oculta, tx_subject, fnc_EditaBoby(tx_body), 1, True) Then
		tx_html = "<tr height=265><td class='envio' style='color:#0000FF'>"&tx_lang_POP061(cd_lang)&".<br><br>"&tx_lang_POP062(cd_lang)&".</td></tr>"
	Else
		tx_html = "<tr height=265><td class='envio' style='color:#FF0000'>"&tx_lang_POP063(cd_lang)&".<br><br>"&tx_lang_POP064(cd_lang)&".<br><br>"&tx_lang_POP061(cd_lang)&".</td></tr>"
	End If
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.divEmail {
	position:absolute;
	left:0px;
	top:25px;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}
.campos {
	padding: 3px;
	font-weight: bold;
	text-align: right;
}
.detalhes {
	padding: 2px;
	background: #CCCCCC;
	width: 99%;
	height: 100%;
}
.envio {
	text-align: center;
	vertical-align: middle;
	font-size: 16px;
	font-weight: bold;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function fnc_ValidaFrom(edit) {
  var vFrom = edit.value;
	
	if(vFrom!="") {
		if(fnc_ValidaEmail(vFrom)) {
			return true
		}
		edit.select();
		edit.focus();
		return false
	}
}
//diego@xyz.com.br; diogo@xyz.com.br; sandra@br; 
function fnc_ValidaPara(edit) {
	var vPara = edit.value;
	var vErro = 0;
	
	if(vPara!="") {
		if(vPara.indexOf(";") > 0) {
			vMails = vPara.split(";");
			for(x=0;x<vMails.length;x++) {
				//remove espaços
				var vLimpa = "";
				for(i=0;i<vMails[x].length;i++)
					if(vMails[x].substr(i,1)!=" ") vLimpa = vLimpa+vMails[x].substr(i,1);
				if(vLimpa!="") if(!fnc_ValidaEmail(vLimpa)) vErro++;
				vMails[x] = vLimpa;
			}
			var vPara = "";
			if(vErro==0) {
				for(x=0;x<vMails[x].length;x++) vPara = vPara+vMails[x]+';';
				edit.value = vPara;
				return true
			}
			//edit.select();
			edit.focus();
			return false
		} else {
			if(fnc_ValidaEmail(vPara)) {
				return true
			}
			edit.select();
			edit.focus();
			return false
		}
	}
}

function fnc_Anexar() {
	document.frmSendMail.in_acao.value = "anexar";
	document.frmSendMail.submit();
}

function fnc_Excluir(tx_arquivo, in_acao) {
	document.frmSendMail.in_acao.value    = in_acao;
	document.frmSendMail.tx_excluir.value = tx_arquivo;
	document.frmSendMail.submit();
}

function fnc_ValidaForm(form) {
	if(form.in_acao.value=="ok") {
		window.close();
		return false;
	}
	//Valida o campo SEU NOME
	if(form.tx_nome.value=="") {
		alert("Por favor, informe o seu NOME!");
		form.tx_nome.select();
		form.tx_nome.focus();
		return false;
	}
	//Valida o campo SEU EMAIL
	if(form.tx_from.value=="") {
		alert("Por favor, informe o seu E-MAIL!");
		form.tx_from.select();
		form.tx_from.focus();
		return false;
	} else if(!fnc_ValidaEmail(form.tx_from.value)) {
		alert("O E-MAIL informado não é um endereço válido.!");
		form.tx_from.select();
		form.tx_from.focus();
		return false;
	}
	//Valida o campo PARA
	if(form.tx_para.value!="") {
		if(!fnc_ValidaPara(form.tx_para)) return false;
	}
	//VAlida o campo COPIA
	if(form.tx_copia.value!="") {
		if(!fnc_ValidaPara(form.tx_copia)) return false;
	}
	//Valida o campo ASSUNTO
	if(form.tx_subject.value=="") {
		alert("Por favor, informe um ASSUNTO para o e-mail!");
		form.tx_subject.select();
		form.tx_subject.focus();
		return false;
	}
	//valida o campo mensagem
	if(form.tx_body.value=="") {
		alert("Por favor, escreva um TEXTO para o e-mail!");
		form.tx_body.select();
		form.tx_body.focus();
		return false;
	}
	return true;
}

function fnc_ListaEmail(params) {
	var url = "/popup/email_lista.asp?"+params;
	var w = 600;
	var h = 400;
	var l = ( (window.screen.width  - w) / 2 );
	var t = ( (window.screen.height - h) / 2 );
	
	url += "&tx_para=" + escape(document.frmSendMail.tx_para.value);
	url += "&tx_copia=" + escape(document.frmSendMail.tx_copia.value);
	url += "&tx_oculta=" + escape(document.frmSendMail.tx_oculta.value);
	
	var hWnd = window.open(url,"email_lista","top="+t+",left="+l+",width="+w+",height="+h+",resizable=no,status=yes");
	if ((document.window != null) && (!hWnd.opener))
	hWnd.opener = document.window;
}
-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF">
	<form name="frmSendMail" action="<%= url &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>" method="post" onSubmit="return fnc_ValidaForm(this);">
		<tr>
			<td height="25" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= tx_lang_POP057(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
					<td width="25"><a href="#" onClick="window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>"></a></td>
				</tr>
			</table></td>
		</tr>
		<tr>
			<td><div id="email" class="divEmail">
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
					<%
If in_acao = "novo" or in_acao = "anexar" or in_acao="voltar" Then
%>
						<tr>
							<td class="label" width="10%" align="right" valign="top"><label for="nome"><%= tx_lang_POP065(cd_lang)%>:</label></td>
							<td class="dados" width="90%"><input name="tx_nome" id="nome" type="text" class="editbox" style="width:100%;" value="<%= tx_nome%>"></td>
						</tr>
						<tr>
							<td class="label" align="right" valign="top"><label for="email"><%= tx_lang_POP066(cd_lang)%>:</label></td>
							<td class="dados"><input name="tx_from" id="email" type="text" class="editbox" style="width:100%;" value="<%= tx_from%>" onBlur="fnc_ValidaFrom(this);"></td>
						</tr>
						<tr>
							<td class="label" align="right" valign="top"><label for="para"><%= tx_lang_POP068(cd_lang)%>:</label></td>
							<td class="dados"><input name="tx_para" id="para" type="text" class="editbox" style="width:97%;" value="<%= tx_para%>" onBlur="fnc_ValidaPara(this);">
								<img src="/imagens/icones/16x16/btn_addrbook.gif" width="16" height="16" border="0" alt="Clique para visualizar a lista de e-mails da Indai&aacute;" align="absmiddle" style="cursor:hand;" onClick="fnc_ListaEmail('nr_processo=<%= nr_processo%>');"></td>
						</tr>
						<tr>
							<td class="label" align="right" valign="top"><label for="copia"><%= tx_lang_POP069(cd_lang)%>:</label></td>
							<td class="dados"><input name="tx_copia" id="copia" type="text" class="editbox" style="width:97%;" value="<%= tx_copia%>" onBlur="fnc_ValidaPara(this);"><br>
								<i>ATENÇÃO: separe com ponto e vírgula(;) para enviar a mais de um e-mail.</i></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input name="in_oculta" id="oculta" type="checkbox" value="<%= in_oculta%>"><label for="oculta"><%= tx_lang_POP070(cd_lang)%>.</label>
								<input type="hidden" name="tx_oculta" value="<%= tx_oculta%>"></td>
						</tr>
						<tr>
							<td class="label" align="right" valign="top"><label for="assunto"><%= tx_lang_POP071(cd_lang)%>:</label></td>
							<td class="dados"><input name="tx_subject" id="assunto" type="text" class="editbox" style="width:100%;" value="<%= tx_subject%>"></td>
						</tr>
						<tr>
							<td align="right" valign="top" class="label"><label for="mensagem"><%= tx_lang_POP072(cd_lang)%>:</label></td>
							<td class="dados"><textarea name="tx_body" id="mensagem" rows="24" class="textbox" style="width:100%;"><%= tx_body%></textarea></td>
						</tr>
						<!--
						<tr>
							<td class="label" align="right" valign="top"><label for="anexo"><%= tx_lang_POP073(cd_lang)%>:</label></td>
							<td class="dados"><input name="tx_anexo" id="anexo" type="file" class="editbox" style="width: 300px;">
								<input name="btnAnexar" type="button" value="Anexar" onClick="fnc_Anexar();" style="border: solid 1px #000000; font-size:10px;">
								<%Call sub_MontaAnexos()%>
							</td>
						</tr>-->
						<%
	Response.Write("<script>document.frmSendMail.tx_body.focus();</script>")
End If
'visualiza o e-mail antes de enviar 
If in_acao = "ver" Then
%>
						<tr height="5">
							<td colspan="2"></td>
						</tr>
						<tr>
							<td width="10%" valign="top" class="campos"><%= tx_lang_POP067(cd_lang)%>:
								<input type="hidden" name="tx_nome" value="<%= tx_nome%>">
								<input type="hidden" name="tx_from" value="<%= tx_from%>"></td>
							<td width="90%"><fieldset class="detalhes"><%= tx_nome &"&lt;"& tx_from &"&gt;"%></fieldset></td>
						</tr>
						<tr>
							<td valign="top" class="campos"><%= tx_lang_POP068(cd_lang)%>:
								<input type="hidden" name="tx_para" value="<%= tx_para%>"></td>
							<td><fieldset class="detalhes"><%= tx_para%></fieldset></td>
						</tr>
						<tr>
							<td valign="top" class="campos"><%= tx_lang_POP069(cd_lang)%>:
								<input type="hidden" name="tx_copia" value="<%= tx_copia%>"></td>
							<td><fieldset class="detalhes"><%= tx_copia%></fieldset></td>
						</tr>
						<tr>
							<td valign="top" class="campos"><%= tx_lang_POP071(cd_lang)%>:
								<input type="hidden" name="tx_subject" value="<%= tx_subject%>"></td>
							<td><fieldset class="detalhes"><%= tx_subject%></fieldset></td>
						</tr>
						<tr height="100%">
							<td valign="top" class="campos"><%= tx_lang_POP072(cd_lang)%>:
								<input type="hidden" name="tx_body" value="<%= tx_body%>"></td>
							<td><fieldset class="detalhes"><iframe name="winBody" frameborder="0" width="100%" height="100%"></iframe></fieldset></td>
						</tr>
<script language="javascript" type="text/javascript">
<!--
	var bodyWin = null;
	var hasBody = false;
  var txtBody = '<%= fnc_EditaBoby(tx_body)%>';
	
	if (bodyWin != null && !bodyWin.closed) hasBody=true;
  if (!hasBody) bodyWin=window.open("","winBody");
		
  bodyWin.document.open();
  bodyWin.document.write(txtBody);
  bodyWin.document.close();
-->
</script>
						<!--
						<tr>
							<td valign="top" class="campos"><%= tx_lang_POP073(cd_lang)%>:</td>
							<td><fieldset class="detalhes"><%Call sub_MontaAnexos()%></fieldset></td>
						</tr>-->
						<%
	If in_oculta = 1 Then
%>
						<tr>
							<td>&nbsp;</td>
							<td><%= tx_lang_POP074(cd_lang)&" "&tx_from&" "&tx_lang_POP075(cd_lang)%>.</td>
						</tr>
						<%
	End If
End If

If in_acao = "enviar" Then
	Response.Write(tx_html)
End If
%>
					</table>
				</div></td>
		</tr>
		<tr height="35">
			<td align="center">
				<input type="button" name="btnCancelar" value="<%= tx_lang_POP076(cd_lang)%>" class="button" onClick="window.close();">
				<%
If in_acao = "ver" Then
%>
				<input type="submit" name="btnVoltar" value="<%= tx_lang_POP077(cd_lang)%>" class="button" onClick="document.frmSendMail.in_acao.value='voltar';">
				<%
End If		
%>
				<input type="submit" name="btnEnviar" value="<%= tx_acao%>" class="button">
				<input type="hidden" name="in_acao" value="<%= in_tipo%>">
				<!--<input name="tx_excluir" type="hidden" value="">-->
			</td>
		</tr>
	</form>
	<tr>
		<td colspan="2" align="center" bgcolor="#DBDADA" height="15"><p><b><a href="http://www.indaialogistica.com.br/" target="_blank">Indaiá Logística Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
