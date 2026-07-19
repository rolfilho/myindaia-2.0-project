<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
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
<%
in_show = True
cd_tela = "001"
nm_tela = tx_lang_002020(cd_lang)
tx_erro = Request.QueryString("tx_erro")


'err.Raise "232",script,"FALHA!!!"
%>
<html>
<head>
<!--#include file="includes/lay_title.asp"-->


</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
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
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="350">
						<td align="center">
											    <strong>E-mail Enviado com Sucesso!</strong><br>
											    <br>
												Agradecemos o envio de sua mensagem, em breve entraremos em contato!<br>
												<br>
												<a href="/default.asp"><strong>Clique aqui</strong></a> para voltar para a página inicial.
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include file="includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include file="includes/inc_ends.asp"-->
