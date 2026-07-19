<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação
'Arquivo de Script e HTML: Ajuda
'
'Autor Alexandre Gonçalves Neto
'Criado: 13/04/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "AJD002"
nm_tela = tx_lang_A00011(cd_lang) &" >> "& tx_lang_A00086(cd_lang)
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
					<td height="25" class="titulo"><p><%= tx_lang_A00086(cd_lang) &" "& tx_lang_A00011(cd_lang)%></p></td>
				</tr>
				<tr>
					<td height="50"><p align="center">
							<%
'seleciona os menus que o usuário tem permissão.
sql = "SELECT M09_CD_MENU, M09_CD_SUBM, "& tx_lang_subm &" AS M02_NM_SUBM, M02_AP_SUBM "&_
			"FROM M09_ACESSO ( NOLOCK ), M02_SUBM ( NOLOCK ) "&_
			"WHERE M09_CD_USUARIO = '"& Session("cd_usuario") &"' "&_
			"  AND M09_CD_MENU    = '02' "&_
			"  AND M09_IN_ACESSO  = 1 "&_
			"  AND M09_CD_MENU    = M02_CD_MENU "&_
			"  AND M09_CD_SUBM    = M02_CD_SUBM "&_
			"ORDER BY M09_CD_SUBM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
	str = ""
	If cd_subm = objrs.Fields.Item("M09_CD_SUBM").Value Then str = " style='font-weight: bold;'"
  Response.Write("<a href='/ajuda/export.asp?cd_menu="& objrs.Fields.Item("M09_CD_MENU").Value &"&cd_subm="& objrs.Fields.Item("M09_CD_SUBM").Value &"'"& str &">"& objrs.Fields.Item("M02_NM_SUBM").Value &"</a>")
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
	Case "01" 'tracking
%>
					<tr>
						<td><p><b><i>Consulta Tracking</i></b></p>
							<p> Fa&ccedil;a o login no site com a senha que lhe foi enviada, no seguinte local: </p>
							<p><img width="228" height="194" src="/imagens/ajuda/clip_image004.jpg"><br>
								<br>
								Ap&oacute;s colocar o login e senha aperte OK para que o sistema valide sua senha e v&aacute; para p&aacute;gina para a escolha do seu relat&oacute;rio, conforme Abaixo: </p>
							<p><img width="320" height="192" src="/imagens/ajuda/clip_image006.jpg"><br>
								<br>
								Clique no + Localizado do lado do Tracking para visualizar os relat&oacute;rios habilitados, neste caso escolheremos Programa&ccedil;&atilde;o de Coleta: </p>
							<p><img width="320" height="192" src="/imagens/ajuda/clip_image008.jpg"><br>
								<br>
								<br>
								<br>
								<b> Editando a consulta: </b></p>
							<p>Para editar uma consulta clique no &iacute;cone <img width="19" height="21" src="/imagens/ajuda/clip_image010.jpg"> do lado de cada relat&oacute;rio criado, nesse caso clicaremos no Padr&atilde;o por ser o &uacute;nico habilitado no momento. <br>
								A tela abaixo mostra o que est&aacute; habilitado para sair no relat&oacute;rio, como filtros, campos ETC: </p>
							<p><img width="589" height="429" src="/imagens/ajuda/clip_image012.jpg"><br>
								<br>
								<b>LEGENDA: </b></p>
							<p>1 &ndash; Nome do Relat&oacute;rio; </p>
							<p>2 &ndash; Limitar Por: Limita o Relat&oacute;rio pelo Evento selecionado por um Evento em Espec&iacute;fico, conforme a lista que aparecer&aacute; caso escolha essa op&ccedil;&atilde;o. Utilize <b> 0</b> para trazer todos os registros que est&atilde;o EM ABERTO e REALIZADOS NO DIA, e <b> &ndash;1</b> para trazer todos que est&atilde;o EM ABERTOS, ou seja n&atilde;o finalizados. </p>
							<p>3 &ndash; Quebra do relat&oacute;rio, na hora da exibi&ccedil;&atilde;o voc&ecirc; pode escolher que o mostre a quebra por Empresa, por Grupo de Empresas, por Modalidade e por &Aacute;rea. </p>
							<p>4 &ndash; Agrupar Embarque: Marque para agrupar por embarque ou Por Refer&ecirc;ncia ( Pedido, Ordem, Remessa, Outros, Booking, Seek, SAP USA, Easy ) </p>
							<p>5 &ndash; Datas Previstas: Visualizar as datas previstas de cada evento;<br>
								&sup1; &ndash; Padr&atilde;o ( Caso tenha v&aacute;rios relat&oacute;rios cadastrados um deles ser&aacute; o padr&atilde;o, para isso basta clicar no &ldquo;flag&rdquo; para definir).</p>
							<p> &sup2; e &sup3; &ndash; para todos os relat&oacute;rios criados esta op&ccedil;&atilde;o deve ser habilitada.<br>
								6 &ndash; Campo de Filtros Dispon&iacute;veis para a Base do relat&oacute;rio, ou seja o relat&oacute;rio ir&aacute; gerar a partir dos dados escolhidos nessa tela. Para escolher um campo basta clicar uma vez em cima do mesmo, para selecionar todos basta escolher o bot&atilde;o de <img width="36" height="29" src="/imagens/ajuda/clip_image014.jpg"> o mesmo procedimento se aplica caso queira retirar os campos <img width="36" height="29" src="/imagens/ajuda/clip_image016.jpg">. </p>
							<p>7 &ndash; Campos escolhidos para a Base do relat&oacute;rio.<br>
								8 &ndash; Campo de Filtro para exibi&ccedil;&atilde;o final do relat&oacute;rio, de acordo com os dados desse campo se escolhidos ir&aacute; ser mostrados em tela com seus respectivos dados. </p>
							<p>9 &ndash; Campos escolhidos para serem mostrados na exibi&ccedil;&atilde;o final do relat&oacute;rio.<br>
								Para cadastrar as altera&ccedil;&otilde;es basta clicar em <img width="85" height="22" src="/imagens/ajuda/clip_image018.jpg"> e para cancelar em <img width="81" height="22" src="/imagens/ajuda/clip_image020.jpg">.</p>
							<p><b><br>
								Fazendo a consulta: </b></p>
							<p> Depois que a base do relat&oacute;rio est&aacute; montada &eacute; a hora de fazermos a consulta. Para fazer a consulta basta clicar no relat&oacute;rio desejado na lista a esquerda, neste caso iremos escolher o <b>Padr&atilde;o</b> por n&atilde;o ter mais relat&oacute;rios cadastrados. Ao clicar no nome do relat&oacute;rio desejado ir&aacute; mostrar a tela abaixo: </p>
							<p><img width="499" height="257" src="/imagens/ajuda/clip_image022.jpg"><br>
								<br>
								Reparem que a tela que trouxe para gerarmos o relat&oacute;rio &eacute; a tela que escolhemos cada item na tela de (Editando a Consulta, n&uacute;meros 6 e 7. ). </p>
							<p><br>
								LEGENDA: </p>
							<p>1 &ndash; Grupo Cliente: Pode se nesse filtro escolher um grupo de clientes<br>
								2 - Cliente: Pode-se escolher um cliente em espec&iacute;fico<br>
								3 &ndash; Pa&iacute;s de Destino da Mercadoria; <br>
								4,5 e 6 &ndash; Datas para a Base do Relat&oacute;rio.<br>
							</p>
							<p><br>
								<b>Resultado da Pesquisa: </b></p>
							<p> Na tela abaixo o site mostra o que foi selecionado com os filtros usados na tela anterior. </p>
							<p><img width="589" height="317" src="/imagens/ajuda/clip_image024.jpg"><br>
								<br>
								Voc&ecirc; tamb&eacute;m pode clicar na coluna <img width="92" height="25" src="/imagens/ajuda/clip_image026.jpg"> para verificar os dados b&aacute;sicos do Processo que est&aacute; sendo verificado, conforme tela abaixo:</p>
							<img width="516" height="276" src="/imagens/ajuda/clip_image028.jpg"></td>
					</tr>
					<%
	Case "02" 'kpi
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "03" 'alerta
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "04" 'inventario
%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%
	Case "05" 'bordero
%>
					<tr>
						<td><p><i><b> Consulta Border&ocirc;<br>
								</b></i></p>
							<p> Fa&ccedil;a o login no site com a senha que lhe foi enviada, no seguinte local: </p>
							<p><img width="228" height="194" src="/imagens/ajuda/clip_image002_0000.jpg"><br>
								<br>
								Ap&oacute;s colocar o login e senha aperte OK para que o sistema valide sua senha e v&aacute; para p&aacute;gina para consutas de border&ocirc;s, conforme Abaixo: </p>
							<p><img width="420" height="295" src="/imagens/ajuda/clip_image004_0000.jpg"><br>
								<br>
								Clique no + Localizado do lado do Mapa de Border&ocirc; para visualizar a pesquisa b&aacute;sica de border&ocirc;, conforme abaixo: </p>
							<p><img width="414" height="263" src="/imagens/ajuda/clip_image006_0000.jpg"><br>
								<br>
								<br>
							</p>
							<p><b> Editando a consulta: </b></p>
							<p> Para editar uma consulta clique no &iacute;cone <img width="19" height="21" src="/imagens/ajuda/clip_image008_0000.jpg"> do lado de cada relat&oacute;rio criado, nesse caso clicaremos no Padr&atilde;o por ser o &uacute;nico habilitado no momento. <br>
								A tela abaixo mostra o que est&aacute; habilitado para sair no relat&oacute;rio, como filtros, campos ETC: </p>
							<p><img width="589" height="425" src="/imagens/ajuda/clip_image010_0000.jpg"><br>
								<br>
								<b>LEGENDA: </b></p>
							<p> 1 &ndash; Nome do Relat&oacute;rio; </p>
							<p> 2 &ndash; Quebra do relat&oacute;rio, na hora da exibi&ccedil;&atilde;o voc&ecirc; pode escolher que o mostre a quebra por Empresa, por Grupo de Empresas, por Modalidade e por &Aacute;rea. </p>
							<p> 3 &ndash; &sup1; &ndash; Padr&atilde;o ( Caso tenha v&aacute;rios relat&oacute;rios cadastrados um deles ser&aacute; o padr&atilde;o, para isso basta clicar no &ldquo;flag&rdquo; para definir). </p>
							<p> &sup2; e &sup3; &ndash; para todos os relat&oacute;rios criados esta op&ccedil;&atilde;o deve ser habilitada.<br>
								4 &ndash; Campo de Filtros Dispon&iacute;veis para a Base do relat&oacute;rio, ou seja o relat&oacute;rio ir&aacute; gerar a partir dos dados escolhidos nessa tela. Para escolher um campo basta clicar uma vez em cima do mesmo, para selecionar todos basta escolher o bot&atilde;o de <img width="36" height="29" src="/imagens/ajuda/clip_image012_0000.jpg"> o mesmo procedimento se aplica caso queira retirar os campos <img width="36" height="29" src="/imagens/ajuda/clip_image014_0000.jpg">. </p>
							<p> 5 &ndash; Campos escolhidos para a Base do relat&oacute;rio.<br>
								6 &ndash; Campo de Filtro para exibi&ccedil;&atilde;o final do relat&oacute;rio, de acordo com os dados desse campo se escolhidos ir&aacute; ser mostrados em tela com seus respectivos dados. </p>
							<p> 7 &ndash; Campos escolhidos para serem mostrados na exibi&ccedil;&atilde;o final do relat&oacute;rio.<br>
								Para cadastrar as altera&ccedil;&otilde;es basta clicar em <img width="85" height="22" src="/imagens/ajuda/clip_image016_0000.jpg"> e para cancelar em <img width="81" height="22" src="/imagens/ajuda/clip_image018_0000.jpg">.</p>
							<p><br>
							</p>
							<p><b>Fazendo a consulta: </b></p>
							<p> Depois que a base do relat&oacute;rio est&aacute; montada &eacute; a hora de fazermos a consulta. Para fazer a consulta basta clicar no relat&oacute;rio desejado na lista a esquerda, neste caso iremos escolher o <b>Padr&atilde;o</b> por n&atilde;o ter mais relat&oacute;rios cadastrados. Ao clicar no nome do relat&oacute;rio desejado ir&aacute; mostrar a tela abaixo: </p>
							<p><img width="569" height="375" src="/imagens/ajuda/clip_image020_0000.jpg"><br>
								<br>
								Reparem que a tela que trouxe para gerarmos o relat&oacute;rio &eacute; a tela que escolhemos cada item na tela de (Editando a Consulta, n&uacute;meros 4 e 5. ). </p>
							<p><br>
								LEGENDA: </p>
							<p> 1 &ndash; Unidade: Pode-se pesquisar por porder&ocirc;s de Santos ou de Rio de Janeiro, por padr&atilde;o deixe a op&ccedil;&atilde;o como Todas, conforme imagem acima. </p>
							<p> 2 e 3 &ndash; Grupo e/ou Cliente: Pode se nesse filtro escolher um grupo de clientes ou por um cliente em espec&iacute;fico, nesse caso marque a op&ccedil;&atilde;o 2 e escolha o Grupo do cliente relacionado a sua consulta. </p>
							<p> 4 &ndash; Per&iacute;odo: Data base para gerar o relat&oacute;rio, essa data &eacute; baseada na Data de Embarque de cada processo. </p>
							<p> 5 &ndash; Situa&ccedil;&atilde;o: &sup1; Processos &agrave; Enviar ( n&atilde;o existem doctos scaniados ),<br>
								&sup2; Processos Enviado ( existe doctos scaniados ). </p>
							<p> 6 &ndash; Status: Estado do documento, o mesmo pode estar ainda para impress&atilde;o/verifica&ccedil;&atilde;o, para Impresso e para documento ser revisado.<br>
								<br>
							</p>
							<p><b> Resultado da Pesquisa: </b></p>
							<p> Na tela abaixo o site mostra o que foi selecionado com os filtros usados na tela anterior. </p>
							<p><img width="589" height="283" src="/imagens/ajuda/clip_image022_0000.jpg"><br>
								<br>
								Nesse caso pedimos para pesquisar os Enviados, ou seja h&aacute; documentos scaniados para visualiza&ccedil;&atilde;o, para visualizar os doctos scaniados clique no link ENVIADO conforme tela acima. </p>
							<p> Nesse momento ir&aacute; aparecer uma tela separada com os documentos dispon&iacute;veis para visualiza&ccedil;&atilde;o conforme abaixo: </p>
							<p><img width="355" height="305" src="/imagens/ajuda/clip_image024_0000.jpg"><br>
								<br>
								Para visualizar os documentos basta clicar em cima de cada um que estar&aacute; mostrando conforme figura acima. <br>
								<br>
								Ap&oacute;s a visualiza&ccedil;&atilde;o do deve-se se escolher a op&ccedil;&atilde;o se o documento est&aacute; correto ( Impressos ) ou se existe alguma diverg&ecirc;ncia ( Revisados ), ao escolher a op&ccedil;&atilde;o basta clicar no bot&atilde;o <b>OK</b>. <br>
								<br>
								<b>OBS:</b> Esse procedimento aplica-se a todos os documentos visualizados e n&atilde;o por documento visualizado.<br>
							</p></td>
					</tr>
					<%
	Case "06" 'gsi
%>
					<tr>
						<td><p><b>GSI</b><br>
								<br>
								<br>
								Fa&ccedil;a o login no site com a senha que lhe foi enviada, no seguinte local: </p>
							<p><img width="228" height="194" src="/imagens/ajuda/clip_image002_0001.jpg"><br>
								<br>
								Ap&oacute;s colocar o login e senha aperte OK para que o sistema valide sua senha e v&aacute; para p&aacute;gina onde existir&aacute; os menus aos relat&oacute;rios que lhe est&atilde;o habilitados, um deles &eacute; o GSI, conforme abaixo: </p>
							<p><img width="247" height="130" src="/imagens/ajuda/clip_image004_0001.jpg"></p>
							<p> Clique no + Localizado do lado do GSI para visualizar a pesquisa b&aacute;sica do GSI, conforme abaixo: </p>
							<p><br>
								<img width="275" height="164" src="/imagens/ajuda/clip_image006_0001.jpg"><br>
								<br>
								<br>
								<br>
								<b>Editando a consulta: </b></p>
							<p> Para editar uma consulta clique no &iacute;cone <img width="19" height="21" src="/imagens/ajuda/clip_image008_0001.jpg"> do lado de cada relat&oacute;rio criado, nesse caso clicaremos no Padr&atilde;o por ser o &uacute;nico habilitado no momento. <br>
								A tela abaixo mostra o que est&aacute; habilitado para sair no relat&oacute;rio, como filtros, campos ETC:<br>
								<br>
								<img width="589" height="267" src="/imagens/ajuda/clip_image010_0001.jpg"></p>
							<p><b> LEGENDA: </b></p>
							<p> 1 &ndash; Nome do Relat&oacute;rio; </p>
							<p> 2 &ndash; &sup1; &ndash; Padr&atilde;o ( Caso tenha v&aacute;rios relat&oacute;rios cadastrados um deles ser&aacute; o padr&atilde;o, para isso basta clicar no &ldquo;flag&rdquo; para definir). </p>
							<p> &sup2; e &sup3; &ndash; para todos os relat&oacute;rios criados esta op&ccedil;&atilde;o deve ser habilitada.<br>
								3 &ndash; Campo de Filtros Dispon&iacute;veis para a Base do relat&oacute;rio, ou seja o relat&oacute;rio ir&aacute; gerar a partir dos dados escolhidos nessa tela. Para escolher um campo basta clicar uma vez em cima do mesmo, para selecionar todos basta escolher o bot&atilde;o de <img width="36" height="29" src="/imagens/ajuda/clip_image012_0001.jpg"> o mesmo procedimento se aplica caso queira retirar os campos <img width="36" height="29" src="/imagens/ajuda/clip_image014_0001.jpg">. </p>
							<p> 4 &ndash; Campo de Filtro para exibi&ccedil;&atilde;o final do relat&oacute;rio, de acordo com os dados desse campo se escolhidos ir&aacute; ser mostrados em tela com seus respectivos dados.<br>
								Para cadastrar as altera&ccedil;&otilde;es basta clicar em <img width="85" height="22" src="/imagens/ajuda/clip_image016_0001.jpg"> e para cancelar em <img width="81" height="22" src="/imagens/ajuda/clip_image018_0001.jpg">. </p>
							<p><b></b></p>
							<p><b> Fazendo a consulta: </b></p>
							<p> Depois que a base do relat&oacute;rio est&aacute; montada &eacute; a hora de fazermos a consulta. Para fazer a consulta basta clicar no relat&oacute;rio desejado na lista a esquerda, neste caso iremos escolher o <b>General Shipment Instruction</b>. Ao clicar no nome do relat&oacute;rio desejado ir&aacute; mostrar a tela abaixo:<br>
								<br>
								<img width="539" height="320" src="/imagens/ajuda/clip_image020_0001.jpg"></p>
							<p> Reparem que a tela que trouxe para gerarmos o relat&oacute;rio &eacute; a tela que escolhemos cada item na tela de (Editando a Consulta, n&uacute;meros 3 e 4. ). </p>
							<p><br>
								LEGENDA: </p>
							<p> 1 &ndash; Unidade: Pode-se pesquisar por GSI de Santos ou de Rio de Janeiro, por padr&atilde;o deixe a op&ccedil;&atilde;o como Todas, conforme imagem acima. </p>
							<p> 2 e 3 &ndash; Grupo e/ou Cliente: Pode se nesse filtro escolher um grupo de clientes ou por um cliente em espec&iacute;fico, nesse caso marque a op&ccedil;&atilde;o 2 e escolha o Grupo do cliente relacionado a sua consulta. </p>
							<p> 4 &ndash; Pa&iacute;s de Destino: Pa&iacute;s de Destino da Mercadoria.<br>
								5 &ndash; Fam&iacute;lia de Mercadoria: Pode-se pesquisar por uma mercadoria em espec&iacute;fica ou utilizar a op&ccedil;&atilde;o de Todos. </p>
							<p><b> Resultado da Pesquisa: </b></p>
							<p> Na tela abaixo o site mostra o que foi selecionado com os filtros usados na tela anterior. </p>
							<p><img width="512" height="169" src="/imagens/ajuda/clip_image022_0001.jpg"></p>
							<p> Nesse caso para verificar os dados de cada Mercadoria clique no link Abaixo da Mercadoria, conforme a figura temos NESCAF&Eacute; ou ACHOCOLATADO conforme tela acima. </p>
							<p> Nesse momento ir&aacute; aparecer a tela abaixo com os dados da Mercadoria<br>
								<br>
								<img width="589" height="511" src="/imagens/ajuda/clip_image024_0001.jpg"><br>
							</p>
							<p>Na tela acima h&aacute; no canto superior direito os bot&otilde;es <img width="74" height="22" src="/imagens/ajuda/clip_image026_0000.jpg">, onde:</p>
							<p><img width="18" height="18" src="/imagens/ajuda/clip_image028_0000.jpg" alt="*"> - Imprime em uma folha A4 com os dados da tela acima;</p>
							<p><img width="22" height="21" src="/imagens/ajuda/clip_image030.jpg" alt="*"> - Gera uma planilha em Excell com os dados da tela acima;</p>
							<p><img width="22" height="19" src="/imagens/ajuda/clip_image032.jpg" alt="*"> - Clique para fechar a tela.</p></td>
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
