<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Autor 
'Criado: 
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "AJUD003"
nm_tela = tx_lang_A00087(cd_lang) &" >> "& tx_lang_A00086(cd_lang)
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
tx_erro = Request.QueryString("tx_erro")
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" height="75" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" class="titulo"><p><%= tx_lang_A00086(cd_lang) &" "& tx_lang_A00087(cd_lang)%></p></td>
				</tr>
				<tr>
					<td height="50"><p align="center">
							<%
'seleciona os menus que o usuário tem permissão.
sql = "SELECT M09_CD_MENU, M09_CD_SUBM, "& tx_lang_subm &" AS M02_NM_SUBM, M02_AP_SUBM "&_
			"FROM M09_ACESSO ( NOLOCK ), M02_SUBM ( NOLOCK ) "&_
			"WHERE M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"  AND M09_CD_MENU    = '06' "&_
			"  AND M09_IN_ACESSO  = 1 "&_
			"  AND M09_CD_MENU    = M02_CD_MENU "&_
			"  AND M09_CD_SUBM    = M02_CD_SUBM "&_
			"ORDER BY M09_CD_SUBM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	str = ""
	If cd_subm = objrs.Fields.Item("M09_CD_SUBM").Value Then str = " style='font-weight: bold;'"
  Response.Write("<a href='/ajuda/fatura.asp?cd_menu="& objrs.Fields.Item("M09_CD_MENU").Value &"&cd_subm="& objrs.Fields.Item("M09_CD_SUBM").Value &"'"& str &">"& objrs.Fields.Item("M02_NM_SUBM").Value &"</a>")
  objrs.MoveNext
	If objrs.Eof Then Exit Do Else Response.Write(" | ")
Loop
objrs.Close
%>
						</p></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainQld">
				<table width="100%" border="1" cellspacing="0" cellpadding="5" align="center">
					<%
Select Case cd_subm
	Case "01" 'numerario x despesas pagas

%>
					<tr>
						<td><p><b> Consulta Numer&aacute;rios Recebidos X Despesas Pagas</b><br>
								<br>
								<br>
								Fa&ccedil;a o login no site com a senha que lhe foi enviada, no seguinte local: </p>
							<p><img width="228" height="194" src="/imagens/ajuda/clip_image002_0002.jpg"><br>
								<br>
								Ap&oacute;s colocar o login e senha aperte OK para que o sistema valide sua senha e v&aacute; para p&aacute;gina onde existir&aacute; os menus aos relat&oacute;rios que lhe est&atilde;o habilitados, um deles &eacute; o Numer&aacute;rio Recebidos X Despesas Pagas, conforme abaixo: </p>
							<p><img width="274" height="70" src="/imagens/ajuda/clip_image004_0002.jpg"></p>
							<p> Clique no + Localizado do lado do Numer&aacute;rios Recebidos X Despesas Pagas para visualizar a pesquisa b&aacute;sica do Relat&oacute;rio, conforme abaixo: </p>
							<p><br>
								<img width="264" height="99" src="/imagens/ajuda/clip_image006_0002.jpg"><br>
								<br>
								<br>
								<b> Editando a consulta: </b></p>
							<p> Para editar uma consulta clique no &iacute;cone <img width="19" height="21" src="/imagens/ajuda/clip_image008_0002.jpg"> do lado de cada relat&oacute;rio criado, nesse caso clicaremos no Rel. de Num X Despesas por ser o &uacute;nico habilitado no momento. <br>
								A tela abaixo mostra o que est&aacute; habilitado para sair no relat&oacute;rio, como filtros, campos ETC:<br>
								<br>
								<img width="589" height="485" src="/imagens/ajuda/clip_image010_0002.jpg"></p>
							<p><b> LEGENDA: </b></p>
							<p> 1 &ndash; Nome do Relat&oacute;rio; </p>
							<p> 2 &ndash; Quebra do relat&oacute;rio, na hora da exibi&ccedil;&atilde;o voc&ecirc; pode escolher que o mostre a quebra por Empresa, por Grupo de Empresas, por Modalidade e por &Aacute;rea. </p>
							<p> 3 &ndash; &sup1; &ndash; Padr&atilde;o ( Caso tenha v&aacute;rios relat&oacute;rios cadastrados um deles ser&aacute; o padr&atilde;o, para isso basta clicar no &ldquo;flag&rdquo; para definir). </p>
							<p> &sup2; e &sup3; &ndash; para todos os relat&oacute;rios criados esta op&ccedil;&atilde;o deve ser habilitada.<br>
								4 &ndash; Campo de Filtros Dispon&iacute;veis para a Base do relat&oacute;rio, ou seja o relat&oacute;rio ir&aacute; gerar a partir dos dados escolhidos nessa tela. Para escolher um campo basta clicar uma vez em cima do mesmo, para selecionar todos basta escolher o bot&atilde;o de <img width="36" height="29" src="/imagens/ajuda/clip_image012_0002.jpg"> o mesmo procedimento se aplica caso queira retirar os campos <img width="36" height="29" src="/imagens/ajuda/clip_image014_0002.jpg">. </p>
							<p> 5 &ndash; Campos escolhidos para a Base do relat&oacute;rio.<br>
								6 &ndash; Campo de Filtro para exibi&ccedil;&atilde;o final do relat&oacute;rio, de acordo com os dados desse campo se escolhidos ir&aacute; ser mostrados em tela com seus respectivos dados. </p>
							<p> 7 &ndash; Campos escolhidos para serem mostrados na exibi&ccedil;&atilde;o final do relat&oacute;rio.<br>
								Para cadastrar as altera&ccedil;&otilde;es basta clicar em <img width="85" height="22" src="/imagens/ajuda/clip_image016_0002.jpg"> e para cancelar em <img width="81" height="22" src="/imagens/ajuda/clip_image018_0002.jpg">. </p>
							<p><b> Fazendo a consulta: </b></p>
							<p> Depois que a base do relat&oacute;rio est&aacute; montada &eacute; a hora de fazermos a consulta. Para fazer a consulta basta clicar no relat&oacute;rio desejado na lista a esquerda, neste caso iremos escolher o <b>Rel. de Num. de Despesas X Proc. Pagos</b>. Ao clicar no nome do relat&oacute;rio desejado ir&aacute; mostrar a tela abaixo:<br>
								<br>
								<img width="533" height="270" src="/imagens/ajuda/clip_image020_0002.jpg"></p>
							<p> Reparem que a tela que trouxe para gerarmos o relat&oacute;rio &eacute; a tela que escolhemos cada item na tela de (Editando a Consulta, n&uacute;meros 5 e 6 ). </p>
							<p><br>
								LEGENDA: </p>
							<p> 1 e 2 &ndash; Grupo e/ou Cliente: Pode se nesse filtro escolher um grupo de clientes ou por um cliente em espec&iacute;fico, nesse caso marque a op&ccedil;&atilde;o 2 e escolha o Grupo do cliente relacionado a sua consulta. </p>
							<p> 3, 4 e 5 Pode-se pesquisar utilizando um desses filtros: Data de Abertura do Registro, Data de Embarque do Navio ou Faturamento: Data de Faturamento dos Processos, ou os 3 campos simultaneamente. </p>
							<p><b><br>
								Resultado da Pesquisa: </b></p>
							<p> Na tela abaixo o site mostra o que foi selecionado com os filtros usados na tela anterior. </p>
							<p><img width="589" height="84" src="/imagens/ajuda/clip_image022_0002.jpg"></p>
							<p> Nesse caso para verificar os dados de despesa v&aacute; at&eacute; a coluna <img width="85" height="25" src="/imagens/ajuda/clip_image024_0002.jpg"> e clique em cima do valor correspondente ao processo a ser verificado, o resultado &eacute; a tela abaixo: <br>
								<br>
								<img width="410" height="329" src="/imagens/ajuda/clip_image026_0001.jpg"><br>
								<br>
								Voc&ecirc; tamb&eacute;m pode clicar na coluna <img width="92" height="25" src="/imagens/ajuda/clip_image028_0001.jpg"> e/ou <img width="92" height="25" src="/imagens/ajuda/clip_image030_0000.jpg"> para verificar os dados b&aacute;sicos do Processo que est&aacute; sendo verificado, conforme tela abaixo:</p>
							<p><img width="516" height="276" src="/imagens/ajuda/clip_image032_0000.jpg"><br>
								<br>
							</p></td>
					</tr>
					<%
End Select
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
