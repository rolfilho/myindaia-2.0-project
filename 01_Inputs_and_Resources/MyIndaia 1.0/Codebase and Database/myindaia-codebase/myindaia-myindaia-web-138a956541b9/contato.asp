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
Dim variavel_cod
in_show = True
cd_tela = "001"
if Session("cd_cargo")="088" or request("cd_idioma")="1" then
   nm_tela = "Choose the desired consultation >>"
else
   nm_tela = "Escolha a consulta desejada >>"
end if
tx_erro = Request.QueryString("tx_erro")
'err.Raise "232",script,"FALHA!!!"
%>
<html>
<head>
<!--#include file="includes/lay_title.asp"-->

<script>
function verificaOption(item){
	if (item.value == 'f'){
	document.getElementById('nm_contato').readOnly = false;
	document.getElementById('nm_razao').readOnly = false;
	document.getElementById('email').readOnly = false;
	}else{
	document.getElementById('nm_contato').value = '<%=Trim(Session("nm_usuario"))%>';
	document.getElementById('nm_razao').value = '<%=Trim(Session("NomeGrupo"))%>';
	document.getElementById('email').value = '<%=Trim(Session("nm_email"))%>';
	document.getElementById('nm_contato').readOnly = true;
	document.getElementById('nm_razao').readOnly = true;
	document.getElementById('email').readOnly = true;
	}
}
</script>



</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
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
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding-left:10px;">
                    <tr>
                     <td><font size="2"><b><br><%=tx_lang_E00005(cd_lang)%> </b></font><br /><img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="500" border="0"></td>
                  </tr>
					<tr height="350">
						<td>
<table width="200" border="0" cellpadding="0" cellspacing="0">
<form action="/email_contato.asp" method="post" name="formulario">
                                                    <tr>
													  <td><%=tx_lang_C001(cd_lang)%>:</td>
													  <td height="22" colspan="4" valign="top"><input name="nm_contato" type="text" maxlength="75" class="editbox" style="width:400px" value="<%=Trim(Session("nm_usuario"))%>" <%If Session("nm_usuario") <> "" Then Response.write ("readonly") End if%>></td>
													</tr>
													<tr>
													  <td><%=tx_lang_C002(cd_lang)%>:</td>
													  <td height="22" colspan="4" valign="top"><input name="nm_razao" type="text" maxlength="75" class="editbox" style="width:400px" value="<%= session("NomeGrupo")%>" <%If Session("NomeGrupo") <> "" Then Response.write ("readonly") End if%>></td>
													</tr>
													<tr>
													  <td><%=tx_lang_C003(cd_lang)%>:</td>
													  <td height="22" colspan="4" valign="top"><input name="endereco" type="text" maxlength="75" class="editbox" style="width:400px"></td>
													</tr>
													<tr>
													  <td><%=tx_lang_C004(cd_lang)%>:</td>
													  <td height="22" valign="top"><input name="cidade" type="text" maxlength="45" class="editbox" style="width:190px"></td>
													  <td>&nbsp;<%=tx_lang_C010(cd_lang)%>:&nbsp;</td>
													  <td colspan="2" valign="top"><input name="cep" type="text" maxlength="9" class="editbox" style="width:152px"></td>
													</tr>
													<tr>
													  <td><%=tx_lang_C005(cd_lang)%>:</td>
													  <td height="22" valign="top">
														<select name="estado" class="select">
															<option value="1" >&nbsp;</option>
															<option value="AC" >Acre</option>
															<option value="AL" >Alagoas</option>
															<option value="AM" >Amazonas</option>
															<option value="BA" >Bahia</option>
															<option value="DF" >Bras&iacute;lia</option>
															<option value="CE" >Ceara</option>
															<option value="ES" >Esp&iacute;rito Santo</option>
															<option value="GO" >Goi&aacute;s</option>
															<option value="MA" >Maranh&atilde;o</option>
															<option value="MG" >Minas Gerais</option>
															<option value="MT" >Mato Grosso</option>
															<option value="MS" >Mato Grosso do Sul</option>
															<option value="PB" >Para&iacute;ba</option>
															<option value="PA" >Par&aacute;</option>
															<option value="PE" >Pernambuco</option>
															<option value="PR" >Paran&aacute;</option>
															<option value="PI" >Piau&iacute;</option>
															<option value="RJ" >Rio de Janeiro</option>
															<option value="RN" >Rio Grande do Norte</option>
															<option value="RS" >Rio Grande do Sul</option>
															<option value="RO" >Rond&ocirc;nia</option>
															<option value="RR" >Roraima</option>
															<option value="SC" >Santa Catarina</option>
															<option value="SP" selected>S&atilde;o Paulo</option>
															<option value="SE" >Sergipe</option>
															<option value="TO" >Tocantins</option>
														</select>
													  </td>
													  <td>&nbsp;<%=tx_lang_C008(cd_lang)%>:&nbsp;</td>
													  <td colspan="2" valign="top"><input maxlength="2" name="ddd_01" class="editbox" style="width:30px">&nbsp;-&nbsp;<input maxlength="8" name="fone_01" class="editbox"style="width:112px"></td>
													</tr>
													<tr>
													  <td>E-mail:</td>
													  <td height="22" colspan="4" valign="top"><input name="email" type="text" maxlength="40" class="editbox" style="width:400px" value="<%=Trim(Session("nm_email"))%>" <%If Session("nm_email") <> "" Then Response.write ("readonly") End if%>></td>
													</tr>
													<tr>
													  <td><%=tx_lang_C006(cd_lang)%>:</td>
													  <td height="22" valign="top">
													  	<select name="unidade" class="select" style="width:150px">
															<option value="">&nbsp;</option>
														
															<option value="rj">Rio de Janeiro</option>
															<option value="sp">S&atilde;o Paulo</option>
															<option value="st" selected>Santos</option>
														</select>
													  </td>
													  <td><%=tx_lang_C009(cd_lang)%>:</td>
													  <td colspan="2" valign="top">
													  	<select name="assunto" class="select" style="width:150px" onChange="verificaOption(this);">
															<option value="2" >&nbsp;</option>
															<option value="a">Servi&ccedil;os Operacionais</option>
															<option value="b">Fretes Internacionais</option>
															<option value="c">Projetos Log&iacute;sticos</option>
															<option value="d">Assessoria e Consultoria</option>
															<option value="e" selected>My Indai&aacute;</option>
															<option value="f">Ouvidoria</option>
														</select>
													  </td>
													</tr>
													<tr>
													  <td><%=tx_lang_C007(cd_lang)%>:</td>
													  <td height="22" colspan="4" valign="top"><textarea name="texto" rows="8" class="textbox" style="width:400px" ></textarea></td>
													</tr>
                                                    <tr></tr>
                                                    <tr></tr>
                                                    <tr></tr>
                                                    <tr></tr>
                                                    
													<tr align="center">
													  <td colspan="5" align="center">
                                                      <img border=0 src="/imagens/30/enviar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:submit();" style="cursor:pointer;">
                                                      <img border=0 src="/imagens/30/voltar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:history.back();" style="cursor:pointer;"></td>
													</tr>
												  </form>
</table>
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
