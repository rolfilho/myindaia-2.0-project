<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Autor: Alexandre Gonçalves Neto
'Criado: --/--/----
'
'Modificado:
'---------------------------------------------------------------------------
%>
<!--#include file="includes/inc_utils.asp"-->
<!--#include file="includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "XXX000"
nm_tela = ""
cd_menu = ""
cd_subm = ""
tx_erro = Request.QueryString("tx_erro")
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
					<tr>
						<td><p><b>1.09.09</b>(30/06/2006) - liberado </p>
							<p><b>1.09.08</b>(29/06/2006) - liberado </p>
							<p><b>1.09.07</b>(21/06/2006) - liberado<br>
								- Custeio Imp: melhorias na procedure, telas, impress&atilde;o e download de excel;<br>
						- Custeio Imp: alterar o nome do campo CIF+Despesas p/ VMLD (R$) e incluir o campo VMLD na Moeda;<br>
						- Custeio Imp: Incluir os campos de itens de despesa (039, 149 e 722);<br>
						- Custo Imp: Alterar a ordem padr&atilde;o dos campos de valores da DI.</p>
							<p><b>1.09.06</b>(12/06/2006) - liberado<br>
								- Geral: Melhoria no calculo de dias KPI;<br>
								- Alertas: Corre&ccedil;&atilde;o na procedure, estava enviado a data incorreta para o calculo de dias &uacute;teis;<br>
								- KPI Exp: inclus&atilde;o das medi&ccedil;&otilde;es: 003 vs 308 e 506 vs 369.</p>
							<p><b>1.09.05</b>(12/06/2006) - liberado<br>
							- Alertas Imp/Exp: melhorias na procedure, telas, impress&atilde;o e download de excel;<br>
							- Duplicidade nas referencias e processos. Solu&ccedil;&otilde;es: trigger que cria testagio_processo foi reformulada e criada uma procedure que verifica a duplicidade;<br>
							- Custo IMP: Inclus&atilde;o dos campos c&oacute;d. Mercadoria, Qtde Item/Unidade de medida, NCM/SH, Exportado e importador e o filtro por desembara&ccedil;o(088).</p>
							<p><b>1.09.04</b>(07/06/2006) - liberado<br>
							- Track Imp: Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o dos processos de gest&atilde;o de pedido, qdo o tipo de relat&oacute;rio for desembara&ccedil;o;<br>
							- Custo Imp: Corre&ccedil;&atilde;o na passagem de variaveis para tela de resultados, impress&atilde;o e excel;<br>
							- Track Imp: Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o e busca do evento Fechamento de Booking(357), era feita a pesquisa n&atilde;o n&atilde;o exibia dados;<br>
							- Quando h&aacute; apenas um filtro ao modific&aacute;-lo ele deve ser habilitado para ser pesquisado(solu&ccedil;&atilde;o &eacute; paliativa).</p>
							<p><b>1.09.03</b>(02/06/2006) - liberado<br>
							- KPI Imp/Exp: Melhorias nas procedures, filtros, busca e exibi&ccedil;&atilde;o do resultado. (Para evitar diverg&ecirc;ncia com o tracking);<br>
							- Track e KPI Imp/Exp: Cria&ccedil;&atilde;o de arquivo para controlar informa&ccedil;&otilde;es para exibir nome da tela e filtros;<br>
							- KPI Exp: Corre&ccedil;&atilde;o na data de Emiss&atilde;o de Remessa(n&atilde;o busca mais pela referencia, &eacute; pelo evento 369);<br>
							- Track Imp: Inclus&atilde;o dos eventos limitadores no followup de ADM+DESEMB quando ainda n&atilde;o existir o desembara&ccedil;o.</p>
							<p><b>							1.09.02</b>(31/05/2006) - liberado<br>
							- Track Imp: Inclus&atilde;o do agente de carga como filtro e resultado;<br>
							- Track Exp:  Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o e busca nos campos de referencia;<br>
							- Track Exp/Imp: Corre&ccedil;&atilde;o na contagem de datas que ser&atilde;o exibidas no relat&oacute;rio para montagem do html;<br>
							- Inclus&atilde;o do sub-menu de Qualidade, Coontrole de Doctos e Registros;<br>
							- Libera&ccedil;&atilde;o do menu de Estatisticas e sub-menu de totais gerais.</p>
							<p><b>1.09.01</b>(30/05/2006) - liberado<br>
							- Bordero - Verifica&ccedil;&atilde;o de mudan&ccedil;a de status dos documentos / migra&ccedil;&atilde;o de arquivos para diret&oacute;rio no servidor da web;<br>
							- Track Imp: Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o de datas e montagem da tabela de flp_import;<br>
							- Track Imp: Melhoria no retorno da descri&ccedil;&atilde;o da mercadoria;<br>
							- Track Imp/Exp: Melhoria na exibi&ccedil;&atilde;o do nome do relat&oacute;rio e filtros.</p>
							<p><b>1.09.00</b>(26/05/2006) - liberado<br>
								- Track Exp: Reestrutura&ccedil;&atilde;o da busca de informa&ccedil;&otilde;es e stored procedure;<br>
								- Track Imp: Atualiza&ccedil;&atilde;o dos filtros e campos para as novas tabelas de personaliza&ccedil;&atilde;o, reestrutura&ccedil;&atilde;o da busca de informa&ccedil;&otilde;es e stored procedure, agrupamento por embarque, visualiza&ccedil;&atilde;o do processo de desembara&ccedil;o e adm. de pedido simultaneamente, quebra por grupo e empresa do cliente, &aacute;rea ou modalidade, disponibiliza&ccedil;&atilde;o para impress&atilde;o;<br>
								- Excel track imp/exp: melhorias na constru&ccedil;&atilde;o do cabe&ccedil;alho; <br>
								- Track Imp: Inclus&atilde;o dos evento 156 e 158 como campo do relat&oacute;rio;<br>
								- Solic. Num: Inclus&atilde;o do evento 507;<br>
								- Relat&oacute;rios Geral: Ao passar com o ponteiro do mouse as linhas do relat&oacute;rio alteram a cor e quando clicadas s&atilde;o marcadas com uma outra cor;<br>
								- Filtros Geral: Melhorias na importa&ccedil;&atilde;o de dados da base para arquivos texto que montam os drop-down list dos selects inputs. </p>
							<p><b>1.08.05</b>(22/05/2006) - liberado<br>
								- Track Exp. Altera&ccedil;&atilde;o no campo nr. do courrier, pois &eacute; um tipo de referencia, pode ter mais de um por embarque;<br>
								- Qualidade: Inclus&atilde;o do menu Indicadores de Desempenho e altera&ccedil;&atilde;o do nome do menu de registro para Indicadores;<br>
								- Desenvolvimento de ferramenta para exporta&ccedil;&atilde;o de dados para txt para agilizar telas de filtros no MyIndaia Web </p>
							<p><b>1.08.04</b>(15/05/2006) - liberado<br>
								- Track Exp. Inclus&atilde;o dos seguintes eventos no limitar por: 139, 369, 489 e 491;<br>
								- Track Exp. Inclus&atilde;o do campo nr do courrier;<br>
								- Indendificada uma falha na replica&ccedil;&atilde;o para web, alguns processos estavam duplicados e n&atilde;o estava gravando corretamente na TDEM_FAT </p>
							<p><b>1.08.03</b>(11/05/2006) - liberado<br>
							 - Inclus&atilde;o de Campos no track exp e ordena&ccedil;&atilde;o de campos;<br>
							- Custo Imp: inclus&atilde;o do campo 103 - Collect Fee  e melhoria na procedure de busca de dados e replica&ccedil;&atilde;o das informa&ccedil;&otilde;es de rateio.</p>
							<p><b>1.08.02</b>(10/05/2006) - liberado<br>
							- Corre&ccedil;&atilde;o na pesquisa do tracking imp, evento ETD e inclus&atilde;o de limitador. </p>
							<p><b>1.08.01</b>(05/05/2006) - liberado<br>
								- Track Imp: Corre&ccedil;&atilde;o nos processos que n&atilde;o estavam sendo exibidos no relat&oacute;rio;<br>
								- Track Imp: Corre&ccedil;&atilde;o nos processos que estavam sendo exibidos em duplicidade;<br>
								- Custo Imp: Corre&ccedil;&atilde;o na verifica&ccedil;&atilde;o da data enviada pelo filtro, n&atilde;o filtrava pela data enviada; </p>
							<p><b>1.08.00</b>(04/05/2006) - liberado<br>
								- Libera&ccedil;&atilde;o do menu de demostrativo financeiro: Solicita&ccedil;&atilde;o de Numer&aacute;rio; </p>
							<p><b>1.07.03</b>(02/05/2006) - liberado<br>
							 - Tracking Exp: Inclus&atilde;o de novos campos de eventos e organiza&ccedil;&atilde;o dos campos(ordena&ccedil;&atilde;o);<br>
							 	- KPI Exp: Inclus&atilde;o de novos campos de datas e medi&ccedil;&otilde;es;<br>
							 	- KPI Exp: Corre&ccedil;&atilde;o de datas e medi&ccedil;&otilde;es;
</p>
							<p><b>1.07.02</b>(27/04/2006) - liberdo<br>
								- Personaliza&ccedil;&atilde;o: Melhoria no componente para selecionar dias &uacute;teis no KPI. </p>
							<p><b>1.07.01</b>(24/04/2006) - liberado<br>
								- Controle de LI - N&atilde;o deve aparecer a LI que foi substitu&iacute;da no relat&oacute;rio junto com a LI que foi substitutiva;<br>
								- KPI Export - incluir novas datas e medi&ccedil;&otilde;es no relat&oacute;rio;<br>
						- Custeio Imp - Verificar processo I0-1269-06, estava sendo exibido valor no Item e estava restituido;<br>
						- Personaliza&ccedil;&atilde;o: Migra&ccedil;&atilde;o de personaliza&ccedil;&atilde;o de menus antigos(Imp: Track, Custo e Lead, Alertas Imp e Exp).</p>
							<p><b>1.07.00</b>(19/04/2006) - liberado<br>
								- KPI por Servi&ccedil;o Import. - busca e resultados n&atilde;o estavam sendo realizados/visualizados;<br>
								- Mudan&ccedil;a do layout do site, logo e imagens do topo.</p>
							<p><b>1.06.10</b>(19/04/2006) - liberado<br>
								- KPI Export - estavam sendo preenchidas as datas em eventos que n&atilde;o s&atilde;o aplicaveis ao processo;<br>
								- Possibilitar consulta de eventos realizados al&eacute;m da data atual.</p>
							<p><b>1.06.09</b>(13/04/2006) - liberado<br>
								- Geral: coloca&ccedil;&atilde;o dos novos tipos de containers no array de consulta de cont&acirc;iner;<br>
								- Geral coloca&ccedil;&atilde;o da ajuda de Tracking, Bordero e GSI (exporta&ccedil;&atilde;o) e Num x Despesas (Demonstrativo Financeiro);<br>
								- Controle de LI: Excel n&atilde;o era gerado se n&atilde;o era escolhido um tipo de quebra de registros. </p>
							<p><b>1.06.08</b>(10/04/2006) - liberado<br>
								- Custo Imp.: Inclus&atilde;o do rateio da Solvay Quimica e atualizado o rateio da basf(ano de 2005);<br>
								- KPI Exp: Corre&ccedil;&atilde;o na procedure que gera o relat&oacute;rio, inclus&atilde;o das datas e calculos de KPI na tabela que guartda o relat&oacute;rio de KPI.</p>
							<p><b>1.06.07</b>(06/04/2006) - liberado<br>
								- KPI Exp.: Manuten&ccedil;&atilde;o no script gerador de arquivo Excel. </p>
							<p><b>1.06.06</b>(04/04/2006) -  liberado <br>
								- KPI Exp.: Melhorias no SQL e no calculo de KPI, que &eacute; realizado apenas com datas validas a partir de agora; <br>
								- Tracking Imp: corre&ccedil;&atilde;o na procedure de tracking, muita lentid&atilde;o, foi adicionada estatistics nas tabelas;<br>
								- KPI Imp: Desenvolvimento da tela de impress&atilde;o dos resultados;<br>
								- Detalhe de CNTR: o valor de dias a cobrar estava saindo igual ao de dias corridos. O correto &eacute; dias corridos - free time;<br>
								- Custo Imp: Inclus&atilde;o dos ites 032(Exame Laboratorial), 447(Delivery Fee) e 538(Rotulagem de Container). </p>
							<p><b>1.06.05</b>(28/03/2006) - liberado<br>
								- Num x Desp. O total s&oacute; estava sendo exibido na primeira p&aacute;gina de resultados;<br>
								- Melhorias e corre&ccedil;&otilde;es nos m&oacute;dulos de Exporta&ccedil;&atilde;o(exceto alerta) e melhoria no sistema de alerta de erros na exporta&ccedil;&atilde;o;<br>
								- Melhorias nos arquivos na cria&ccedil;&atilde;o dos arquivos Excel.</p>
							<p><b>1.06.04</b>(23/03/2006) - liberado<br>
								- Demurrage: corre&ccedil;&atilde;o na busca, estavam sendo passados mais parametros do que existem na procedure.<br>
								- Controle de LI: Corre&ccedil;&atilde;o na busca, quando n&atilde;o selecionada uma empresa, o cliente acessava a todas e n&atilde;o somente as permitidas a ele. </p>
							<p><b>1.06.03</b>(22/03/2006) - liberado<br>
								- Melhorias e corre&ccedil;&otilde;es no modulo de Demurrage.(Filtros, Busca, Resultados em tela, excel e impress&atilde;o);<br>
								- Melhorias e corre&ccedil;&otilde;es no modulo de Controle de LI.(Filtros, Busca, Resultados em tela, excel e impress&atilde;o);<br>
								- Tracking Exp: Corre&ccedil;&atilde;o no campo data do saque e download excel.</p>
							<p><b>1.06.02</b>(21/03/2006) - liberado<br>
								- Corre&ccedil;&atilde;o no filtro Pa&iacute;s de Destino no tracking de exporta&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o nos diret&oacute;rios dos procedimentos da ISO, n&atilde;o estavam apontados para o caminho certo;<br>
								- Alterar os relat&oacute;rios da Nestl&eacute;, retirar Incoterm, Exportador e Pedido e Inserir Cliente e Nr. Ref. Cliente;<br>
								- Corre&ccedil;&atilde;o no nome das p&aacute;ginas dos manuais de qualidade.</p>
							<p><b>1.06.01</b>(14/03/2006) - liberado<br>
								- KPI Exporta&ccedil;&atilde;o: Modificar o relat&oacute;rio para
								ser exibido por quebra de Area, Cliente, Modalidade, agrupar por
								processos, e outras melhorias;<br>
								- Tracking Exp: Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o do per&iacute;do da pesquisa e inclus&atilde;o da nome do evento no per&iacute;odo; <br>
								- Personaliza&ccedil;&atilde;o: Altera&ccedil;&atilde;o do Campo/Filtro Nr. Remessa para Nr. Remessa/Delivery e Nr. Easy para Nr. Ref. Cliente;<br>
								- Tracking Exp: Corre&ccedil;&atilde;o no download do excel, estava saindo errado os Nr. de Referencias;<br>
								- Despesas x Numer&aacute;rio: Alterar o o campo Remessa para Adiantamento;<br>
								- Despesas x Numer&aacute;rio: Exibir o total geral no resultado.</p>
							<p><b>1.06.00</b>(13/03/2006) - liberado<br>
								- Disponibilizar os documentos da ISO na intranet, cria&ccedil;&atilde;o de menu e sub-menus com links para os documentos.</p>
							<p><b>1.05.03</b>(08/03/2006) - liberado<br>
								- Tracking Exp: Inclus&atilde;o do filtro Transportadora;<br>
								- Tracking Exp: Mudan&ccedil;a na pesquisa e resultados dos campos Importador
								e Pa&iacute;s de Destino da TPROCESSO_EXP para a TPROCESSO; <br>
								- Mapa Border&ocirc;: Mudan&ccedil;a do campo Nr. ref. Pedido para Nr. ref EASY;<br>
								- Tracking Exp: Melhorias e corre&ccedil;&otilde;es na exibi&ccedil;&atilde;o do resultado e busca
								dos registros. </p>
							<p><b>1.05.02</b>(03/03/2006) - liberado<br>
								- Corre&ccedil;&atilde;o na cor no campo qtde de cont&acirc;iner(estava
								assumindo as cores do KPI de datas); <br>
								- Corre&ccedil;&atilde;o na sele&ccedil;&atilde;o dos campos da personaliza&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do limitador de campos e filtros utilizav&eacute;is em um relat&oacute;rio. </p>
							<p><b>1.05.01</b>(03/03/2006) - liberado<br>
								- Inclus&atilde;o das novos calend&aacute;rios no script de configura&ccedil;&atilde;o dos calend&aacute;rios
								dos eventos; <br>
								- Desenvolvimento da permiss&atilde;o de exibir campos e filtros de acordo com
								o cargo do usu&aacute;rio. </p>
							<p><b>1.05.00</b>(03/03/2006) - liberado<br>
								- Tracking Exporta&ccedil;&atilde;o: Adicionar novos campos para cria&ccedil;&atilde;o
								do relat&oacute;rio de coleta;<br>
								- Tracking Exporta&ccedil;&atilde;o: Modificar o relat&oacute;rio para
								ser exibido por quebra de Area, Cliente, Modalidade, agrupar por
								processos, e outras melhorias;<br>
								- Trocar o nome Faturamento Indai&aacute; para Faturamento
								do Servi&ccedil;o Indai&aacute;;<br>
								- Desenvolvimento do Detalhe de despesas x numerario;<br>
								- Desenvolvimento do Relat&oacute;rio de Despesas x Numer&aacute;rio(Menu,
								Busca, resultado, Planilha Excel, Impress&atilde;o).</p>
							<p><b>1.04.04</b>(02/03/2006) - liberado<br>
								- O detalhe do processo no Tracking n&atilde;o est&aacute; aparecendo em
								informa&ccedil;&atilde;o;<br>
								- Acertar a ordem das referencias no Tracking Exporta&ccedil;&atilde;o;<br>
								- Tracking Exporta&ccedil;&atilde;o : Erro ao filtrar processos com o evento
								confirma&ccedil;&atilde;o de embarque. Est&atilde;o aparecendo processos
								com de data confirma&ccedil;&atilde;o em branco;<br>
								-  Quando qualquer relat&oacute;rio do Myindai&aacute; conter uma &uacute;nica
								data de filtro ( Periodo ), informar ao inves de per&iacute;odo o nome
								do evento;<br>
								- MyIndai&aacute; Web: Download Excell Controle de LI n&atilde;o est&aacute; funcionando;<br>
								- Retirar do Tracking de Importa&ccedil;&atilde;o os campos Nr. da Remessa,
								Nr. Booking e Nr. Fatura Seek;<br>
								- Tracking de Importa&ccedil;&atilde;o : Incluir o Nr, EASY ao lado do
								campo Pedido;<br>
								- Tracking de Importa&ccedil;&atilde;o : Passar o nr. da referencia SAP
								USA para o lado da referencia EASY;<br>
								- Copiar as personaliza&ccedil;&otilde;es de GSI e Border&ocirc; para clientes
								Nestl&eacute; e colaboradores da Indai&aacute;. Manuten&ccedil;&atilde;o
								na Procedure.</p>
							<p><b>1.04.03</b>(15/02/2006) - liberado<br>
								- Tracking Exp: Corre&ccedil;&atilde;o no evento Deadline de carga(estava sendo usado
								o evento errado no servi&ccedil;o);<br>
								- Tracking Imp: Processos n&atilde;o estavam aparecendo devido a falta de
								informa&ccedil;&atilde;o na &aacute;rea(n&atilde;o tava com o grupo cadastrado); <br>
								- Detalhe Imp/Exp: melhoria na exibi&ccedil;&atilde;o do follow-up;<br>
								- Manuten&ccedil;&atilde;o na procedure que monta a tabela de Follow-up de Exporta&ccedil;&atilde;o(TFLP_EXPORT). </p>
							<p><b>1.04.02</b>(14/02/2006) - liberado<br>
								- Detalhe Faturamento: Corre&ccedil;&atilde;o na estrutura SQL e Melhorias na tela(agora
								&eacute; exibido em tela menor, podendo alterar entre despesas e pagamentos);<br>
								- Tracking Imp: Corre&ccedil;&atilde;o no resultado(exibi&ccedil;&atilde;o
								de referencias) e na planilha excel. </p>
							<p><b>1.04.01</b>(13/02/2006) - liberado<br>
								- Tracking Imp: Inclus&atilde;o do campo Embalagem(quantidade e tipo de cont&acirc;iner/quantidade
								e esp&eacute;cie de carga solta);<br>
								- Tracking Imp: Inclus&atilde;o dos campos Ordem, Remessa, Fatura Seek,
								SAP UP, EASY e outras referencias;<br>
								- Tracking Imp: Inclus&atilde;o do campo Recebe Docs./OD(Evento 437);<br>
								- Tracking Exp: Inclus&atilde;o dos campos SAP USA e EASY;<br>
								- Tracking Exp: Inclus&atilde;o do campo Solicita&ccedil;&atilde;o e Recebimento de Numer&aacute;rio
								de Despesas(Evento 018 e 076). </p>
							<p><b>1.04.00</b>(10/02/2006) - liberado<br>
								- Novo Menu: Relat&oacute;rio de Border&ocirc;(Exporta&ccedil;&atilde;o);<br>
								- Novo Menu: Relat&oacute;rio GSI(Exporta&ccedil;&atilde;o);<br>
								- Corre&ccedil;&atilde;o no detalhe de faturamento;<br>
								- Corre&ccedil;&atilde;o no gerenciamento de permiss&otilde;es de acesso
								de menu;<br>
								- Melhorias no cadastro de personaliza&ccedil;&otilde;es;<br>
								- Melhorias no sistema gerenciador de erros ocorridos;<br>
								- Corre&ccedil;&atilde;o no Detalhe da Fatura Comercial;<br>
								- Desenvolvimento do pop-up de detalhe de documentos de exporta&ccedil;&atilde;o. </p>
							<p><b>1.03.02</b>(03/02/2006) - liberado <br>
								- Tracking Imp: inclus&atilde;o de novos campos do follow-up(438, 439,
								440, 441, 468, 469, 470, 471, 472);<br>
								- Custo Imp: inclus&atilde;o de novos itens do faturamento(239, 487,
								500, 510) ;<br>
								- KPI Exp: Inclus&atilde;o de novos campos do follow-up(474);<br>
								- Tracking Imp: inclus&atilde;o de novos tipos de pedido
								da gest&atilde;o(Intercompany e Outros Fornecedores);<br>
								- Tracking Imp: inclus&atilde;o do filtro Exportador.</p>
							<p><b>1.03.01</b>(20/01/2006) - liberado<br>
								- Tracking Imp: inclus&atilde;o de novos campos do follow-up(218, 362, 448, 450,
								451, 453, 455, 456, 457, 458, 460).</p>
							<p><b>1.03.00</b>(19/01/2006) - liberado<br>
								- Novo menu: Relat&oacute;rio de KPI Importa&ccedil;&atilde;o(Metrics
								por Embarque);<br>
								- Novo menu: Relat&oacute;rio de Pagamento de Demurrage;<br>
								- Traking Imp: Corre&ccedil;&atilde;o no campo mercadoria, trocar &quot;(aspas
								dupla) por '(aspa simples); <br>
								- Corre&ccedil;&otilde;es na admin. do site na inclus&atilde;o de novos
								campos, filtros e personaliza&ccedil;&otilde;es;<br>
								- Sistema de alerta por e-mail de erros ocorridos no site.</p>
							<p><b>1.02.15</b>(05/01/2006) - liberado <br>
								- Tracking Imp: Inclus&atilde;o da Unidade de Neg&oacute;cio como filtro;<br>
								- Exporta&ccedil;&atilde;o: Corre&ccedil;&atilde;o no modulo de exporta&ccedil;&atilde;o,
								dados inconsistentes, falha nas procedures de migra&ccedil;&atilde;o
								de dados</p>
							<p><b>1.02.14</b>(03/01/2006) - liberado <br>
								- KPI Exp: Inclus&atilde;o dos campos 003(Abertura de Registro), 122(Libera&ccedil;&atilde;o
								do RE), 289(Envio ao Faturamento) e a mudan&ccedil;a de Nome do evento
								113 de Libera&ccedil;&atilde;o
								de Processo para E-mail de Libera&ccedil;&atilde;o.</p>
							<p><b>1.02.13</b>(28/12/2005) - liberado<br>
								- Custo Imp: Inclus&atilde;o dos campos no Custeio Imp. 682, 056, 594,
								077, 106.</p>
							<p><b>1.02.12</b>(19/12/2005) -  liberado <br>
								- Detalhe Imp: Corre&ccedil;&atilde;o na observa&ccedil;&atilde;o do detalhe do processo, n&atilde;o
								estava sendo exibida; <br>
								- Tracking Imp: Corre&ccedil;&atilde;o na consulta, n&atilde;o estava
								sendo exibidos os processos de adm. de pedido da Valspar(produto
								06);<br>
								- Menu do sistema: Menu ser&aacute; exibido de acordo com as permiss&otilde;es
								do usu&aacute;rio;<br>
								- KPI Exp: Inclus&atilde;o do campo de evento 034 no resultado do relat&oacute;rio. </p>
							<p><b>1.02.11</b>(15/12/2005) - liberado<br>
								- Detalhe Imp.: Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o do hist&oacute;rico para ADM e corre&ccedil;&atilde;o
								na exibi&ccedil;&atilde;o das Observa&ccedil;&otilde;es, o valor
								nulo gerava erro;<br>
								- Inclus&atilde;o dos eventos no tracking imp, eventos especificos
								de item do pedido(363,364,365);<br>
								- Tracking Imp/Exp: Corre&ccedil;&atilde;o na busca, n&atilde;o s&atilde;o mais retornados
								eventos que sejam filtro e n&atilde;o sejam aplicaveis;<br>
								- Fun&ccedil;&otilde;es de Sistema: Corre&ccedil;&atilde;o na fun&ccedil;&atilde;o que calcula dias uteis,
								estava retornando a data do dia corrente na data de realiza&ccedil;&atilde;o
								nula. </p>
							<p><b>1.02.10</b>(14/12/2005) - liberado<br>
								- Tracking Imp: Inclus&atilde;o de novos eventos limitadores(001, 082,
								353); <br>
								- Tracking Imp: Quando gerado relat&oacute;rio na WEB o evento &quot;ETD&quot; aparece
								como n&atilde;o aplic&aacute;vel mesmo tendo sido alimentado;<br>
								- Tracking Imp: Cria&ccedil;&atilde;o do campo e filtro &quot;Seguro/Hermes&quot;;<br>
								- Tracking Exp: Cria&ccedil;&atilde;o de filtro Enquadramento da Opera&ccedil;&atilde;o;<br>
								- Incluir no tracking exporta&ccedil;&atilde;o o campo Peso L&iacute;quido
								e Peso bruto;<br>
								- Melhorias nos relat&oacute;rios de tracking import. e export.</p>
							<p><b>1.02.09</b>(13/12/2005) - liberado<br>
								- Tracking imp: corre&ccedil;&atilde;o na quantidade de mercadoria e
								no cabe&ccedil;alho
								que n&atilde;o estava exibindo o nome das colunas de data prevista,
								realizada e dif. de dias;<br>
								- Custo Imp: corre&ccedil;&atilde;o na busca, quando o filtro tinha outro campo junto
								com algum de data, n&atilde;o era realizada a consulta atrav&eacute;s da
								data; </p>
							<p><b> 1.02.08</b>(12/12/2005) - liberado<br>
								- verificar o porque n&atilde;o est&aacute; saindo a quantidade do produto
								desembara&ccedil;ado;<br>
								- enviar o nr. da placa do caminh&atilde;o quando processos rodoviario,
								a coluna est&aacute; com nome de &quot;nr. do caminh&atilde;o&quot; alterar
								para placa do veiculo;<br>
								- quando aereo o evento ETA &eacute; o nr. 154 e quando rodoviario o evento &eacute; o
								nr. 259.</p>
							<p><b>1.02.07</b>(07/12/2005) - liberado<br>
								- Incluir no KPI Web colunas : data de confirma&ccedil;&atilde;o de
								embarque (135 );<br>
								- KPI - No campo exportador esta aparecendo importador, o correto &eacute; exibir
								o exprotador;<br>
								- Tracking Imp: N&atilde;o est&atilde;o aparecendo os registros das Saint
								Gobain - Problema com o grupo das &aacute;reas.;<br>
								- Custo Imp: Incluir no rateio de custos da Saint Gobain.</p>
							<p><b>1.02.06</b>(05/12/2005) -  liberado<br>
								- Geral: Inclus&atilde;o da consulta on-line de data nos novos campo; <br>
								- Tracking Exp: Inclus&atilde;o do campo Enquadramento da Opera&ccedil;&atilde;o;</p>
							<p><b>1.02.05</b>(30/11/2005) - liberado<br>
								- Tracking Imp: Inclus&atilde;o do evento 289 e 357 como campo e filtro do relat&oacute;rio;<br>
								- 
								Tracking Imp: Inclus&atilde;o do evento 443,444,445 e 446 como campo  do relat&oacute;rio;<br>
								- Custo Imp: O calculo do total de pedido item deve ser de acordo com o Incoterm;<br>
								- Excel Custo Imp: Exibir no relat&oacute;rio os filtros utilizados
								na busca;<br>
								- Excel Custo Imp: Calcular o total dos valores por embarque(processo);<br>
								- Excel Tracking/Custo Imp: A mercadoria deve ser exibida atrav&eacute;s
								da seguinte sequencia: verificar se tem na D.I, depois ver a PO e depois
								no Processo;<br>
								- Detalhe de Processo: Quando o canal for nulo deve retornar o c&oacute;digo 4, que &eacute; sem
								canal;<br>
								- Alerta: corre&ccedil;&atilde;o na stored procedure que faz a sele&ccedil;&atilde;o
								dos processos; <br>
								- Stored procedure para verifica&ccedil;&atilde;o dos processos no MyIndaia Web em rela&ccedil;&atilde;o
								ao local. </p>
							<p><b>1.02.04</b>(22/11/2005) - liberado<br>
								- Custo Importa&ccedil;&atilde;o: Corre&ccedil;&atilde;o na sele&ccedil;&atilde;o dos dados, estavam sendo exibidos dados de todos embarques da referencia; <br>
								- Detalhes de processo: Melhorias no processamento de informa&ccedil;&otilde;es da p&aacute;gima, tormando a consulta mais veloz. </p>
							<p><b>1.02.03</b>(18/11/2005) - liberado<br>
								- Tracking Exp: Incluir os campos solicitados pela Soraia. Nr. DDE, qtde e tipo de cont&ecirc;iner, nome do navio, situa&ccedil;&atilde;o do RE, observa&ccedil;oes;<br>
								- Tracking Imp: Incluir os campos solicitados para o relat&oacute;rio mensal da Shell. Recebimento da Fatura Proforma, Emiss&atilde;o da LI, Solicita&ccedil;&atilde;o de NF, Recibimento de NF;<br>
								- Tracking/Custo Imp: A mercadoria deve ser exibida atrav&eacute;s da seguinte sequencia: verificar se tem na D.I, depois ver a PO e depois no Processo; <br>
								- Tracking Imp: Exibir o pa&iacute;s de Origem/Proced&ecirc;ncia - pa&iacute;s onde &eacute; embarcada a mercadoria(tem q arrumar o cadastro no myindaia local);<br>
								- Tracking Imp: Exibir a transportadora de Mercadoria, n&atilde;o o de CNTR vazio; <br>
								- Controle de LI: Na coluna de mercadoria, exibir todas as mercadorias da LI, informando o item e o c&oacute;digo da mercadoria;<br>
								- Controle de LI: Os pedidos e embarque devem ser exibidos apenas uma vez, e n&atilde;o uma vez para cada n&uacute;mero de LI. </p>
							<p><b>1.02.02</b>(04/11/2005) - liberado<br>
								- Corre&ccedil;&atilde;o no relat&oacute;rio de excel(tracking importa&ccedil;&atilde;o), tinha um campo incorreto; <br>
								- Corre&ccedil;&atilde;o no detalhe de tracking importa&ccedil;&atilde;o, quando n&atilde;o tinha refer&ecirc;ncia n&atilde;o era exibido o follow-up;<br>
								- Corre&ccedil;&atilde;o na tabela de follow-up de desembara&ccedil;o+adm. de pedido. </p>
							<p><b>1.02.01</b>(03/11/2005) - liberado<br>
								-	Inclus&atilde;o	da URF de despacho como filtro(ainda inativo) e campo no relat&oacute;rio de tracking importa&ccedil;&atilde;o; <br>
								- Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o dos resultados do tracking importa&ccedil;&atilde;o, mudan&ccedil;a para a nova tabela de follow-up; <br>
								- Desenvolvimento do relat&oacute;rio de controle de L.I.</p>
							<p><b>1.02.00</b>(21/10/2005) - liberado <br>
								- Corre&ccedil;&atilde;o na ordena&ccedil;&atilde;o do hist&oacute;rico no detalhe de processo(importa&ccedil;&atilde;o); <br>
								- Campos s&atilde;o ordenados de acordo com a vontade do usu&aacute;rio; <br>
								- Corre&ccedil;&atilde;o na personaliza&ccedil;&atilde;o, n&atilde;o &eacute; mais possivel desmacar a personaliza&ccedil;&atilde;o padr&atilde;o, e n&atilde;o d&aacute; mais para ficar sem nenhuma personaliza&ccedil;&atilde;o como padr&atilde;o; <br>
								- Corre&ccedil;&atilde;o na stored procedure de Alerta, verifica se o evento &eacute; aplicavel ou n&atilde;o;<br>
								- Desenvolvimento do relat&oacute;rio de custo(importa&ccedil;&atilde;o); <br>
								- Melhoria no menu, mudan&ccedil;a na ordena&ccedil;&atilde;o dos itens e agora &eacute; criado totalmente dinamicamente.</p>
							<p><b>1.01.14</b>(04/10/2005) - liberado<br>
								- Corre&ccedil;&atilde;o no link do tracking que leva a tela de detalhe de processo, o n&uacute;mero da ref&ecirc;rencia n&atilde;o estava sendo informado;<br>
								- Corre&ccedil;&atilde;o no detalhe de cont&ecirc;iner exporta&ccedil;&atilde;o, n&atilde;o retornava para a busca corretamente; <br>
								- Corre&ccedil;&atilde;o no detalhe de navio importa&ccedil;&atilde;o/exporta&ccedil;&atilde;o, faz a busca correta atrav&eacute;s do n&uacute;mero de pedido;<br>
								- Melhorias no resultado do tracking de exporta&ccedil;&atilde;o;<br>
								- Melhorias na migra&ccedil;&atilde;o das tabelas de processo, n&atilde;o duplicando processo e com velodidade maior; <br>
								- Desenvolvimento do follow-up de exporta&ccedil;&atilde;o em linha, criada a tflp_export;<br>
								- Corre&ccedil;&atilde;o na busca do tracking de exporta&ccedil;&atilde;o, faz busca por qualquer tipo de referencia; <br>
								- Corre&ccedil;&atilde;o e melhorias na stored procedure que faz a busca do tracking de exporta&ccedil;&atilde;o; <br>
								- Corre&ccedil;&atilde;o na atualiza&ccedil;&atilde;o da testagio_processo, trigger tinha problemas. </p>
							<p><b>1.01.13</b>(23/09/2005) - liberado<br>
								- Corre&ccedil;&atilde;o na busca de tracking(import/export), estava mandando dados invalidos para a tela de resultado e a personaliza&ccedil;&atilde;o estava sendo selecionada incorretamente; <br>
								- Melhoria na busca do KPI de importa&ccedil;&atilde;o, v&aacute;riaveis estavam recebendo o tratamento adequado para serem repassadas para a stored procedure; <br>
								- Corre&ccedil;&atilde;o na busca de exporta&ccedil;&atilde;o por n&uacute;mero de pedido, n&atilde;o achava o registro caso fosse uma referencia que n&atilde;o fosse do tipo 2(Nr. de Ordem); <br>
								- 
								Corre&ccedil;&atilde;o no detalhe de importa&ccedil;&atilde;o, n&atilde;o eram exibidos registros caso o item da referencia fosse nulo;<br>
								- 
								Corre&ccedil;&atilde;o no cadastro de personaliza&ccedil;&atilde;o de tracking, a vari&aacute;vel de evento limitador n&atilde;o era setada para nulo quando cadastrada em branco/vazio;<br>
								- Corre&ccedil;&atilde;o no detalhe de conteiner de exporta&ccedil;&atilde;o(registros n&atilde;o estavam sendo exibidos corretamente);<br>
								- Corre&ccedil;&atilde;o no detalhe navio exporta&ccedil;&atilde;o, n&atilde;o estava sendo exibida a refer&ecirc;ncia de alguns clientes; <br>
								- Evento limitador de importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o(tracking) mudado para o Emiss&atilde;o de Fatura(092) 30 dias. </p>
							<p><b> 1.01.12</b>(20/09/2005) - liberado<br>
								- N&atilde;o estavam sendo exibidos os processos de alguns clientes(BSH e Oxiteno) no tracking de importa&ccedil;&atilde;o;<br>
								- Pop-up de conteiner quando aberto por exporta&ccedil;&atilde;o e clicado o nr. do conteiner realiza pesquisa no tracking exporta&ccedil;&atilde;o(estava fazendo pesquisa no tracking importa&ccedil;&atilde;o);<br>
								- Corrigido erro no alerta de importa&ccedil;&atilde;o(stored procedure n&atilde;o estava gravando item do cliente);<br>
								- Corrigido erro no alerta de exporta&ccedil;&atilde;o(n&atilde;o estava selecionando o n&uacute;mero de refer&ecirc;ncia de clientes - BSH e Oxiteno);<br>
								- Bot&atilde;o de sair n&atilde;o &eacute; mais exibido quando o usu&aacute;rio esta desconectado;<br>
								- Consulta on-line de datas nos filtros corrigido.</p>
							<p><b>1.01.11</b>(16/09/2005) - liberado<br>
								- Corre&ccedil;&atilde;o no detalhe de importa&ccedil;&atilde;o: n&atilde;o estava mostrando refer&ecirc;ncia com item nulo;<br>
								- Corre&ccedil;&atilde;o no follow-up de importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o: n&atilde;o estavam sendo exibidos os registros corretamente pois existia um join mau feito;<br>
								- Corre&ccedil;&atilde;o na busca do follow-up de exporta&ccedil;&atilde;o, s&oacute; selecionava processos da basf, pois era exigida a referencia(outros clientes n&atilde;o tem);<br>
								- Alguns processos n&atilde;o foram exportados corretamente para o banco de dados do site, agora os processos est&atilde;o ok. </p>
							<p><b>1.01.10</b>(01/09/2005) -   liberado <br>
								- Corre&ccedil;&atilde;o no KPI de exporta&ccedil;&atilde;o, ap&oacute;s emitir relat&oacute;rio ao emitir o pr&oacute;ximo retornava o mesmo resultado;<br>
								- Inclus&atilde;o do campo Periocidade do Saque no resultade de KPI e Tracking de Exporta&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o na personaliza&ccedil;&atilde;o do Detalhe de Processo(importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o), view estava sendo selecionada incorretamente. </p>
							<p><b>1.01.09</b>(31/08/2005) - liberado<br>
								- Corre&ccedil;&atilde;o nas refer&ecirc;ncias do detalhe de exporta&ccedil;&atilde;o;<br>
								- Nos eventos n&atilde;o aplic&aacute;veis est&aacute; escrito &quot;n&atilde;o aplic&aacute;vel&quot; com a fonte cinza claro(todo site);<br>
								- Melhoria na exibi&ccedil;&atilde;o do follow-up no detalhe de importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o; <br>
								- Corre&ccedil;&atilde;o no link do pop-up que exibe a rela&ccedil;&atilde;o de cont&ecirc;iner/processo;<br>
								- Alterado para a observa&ccedil;&atilde;o do campo 022(Observa&ccedil;&otilde;es) a observa&ccedil;&atilde;o do detalhe do processo; <br>
								- Corrigido o link do bot&atilde;o de cancelar nas pesquisas. </p>
							<p><b>1.01.08</b>(30/08/2005) - liberado<br>
								- Inclus&atilde;o dos campos de Evento(168, 257, 297, 342, 416-423) no resultados do tracking de importa&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do campo Nome do Navio no tracking importa&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do campo Dt. de Vencimento do Saque no tracking e kpi de exporta&ccedil;&atilde;o;<br>
								- Inclus&atilde;o dos campos Nr. Pedido, Nr. Remessa, Nr. Booking e Nr. Fatura Seek no tracking de exporta&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do campo Confirma&ccedil;&atilde;o de Entrega no Terminal Portu&aacute;rio no KPI de exporta&ccedil;&atilde;o;<br>
								- Melhorias no select que exibe o resultado da busca de tracking de exporta&ccedil;&atilde;o.</p>
							<p><b>1.01.07</b>(22/08/2005) - liberado<br>
								- Corre&ccedil;&atilde;o na gera&ccedil;&atilde;o de arquivo excel do tracking importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o na busca de tracking importa&ccedil;&atilde;o e exporta&ccedil;&atilde;o;<br>
								- Cria&ccedil;&atilde;o de array para tabela com poucos registros(tcond_venda_ent, tstatus_cntr, tstatus_flp, ttp_canal, ttp_cntr, ttp_frete, ttp_referencia);</p>
							<p><b>1.01.06</b>(18/08/2005) - liberado<br>
								-
								Melhorias	nas triggers que atualizam a base de dados do myindai&aacute; no INDAIA10 e replicados;<br>
								- Melhoria na busca de tracking de importa&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o no detalhe de cont&ecirc;iner, n&atilde;o estava selecionando a persoanaliza&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do campo N&uacute;mero e Data da Fatura
								no	KPI	de Exporta&ccedil;&atilde;o;<br>
								- Inclus&atilde;o dos campos e filtros Unidade, Porto/Aeroporto (embarque/desembarque) e Armaz&eacute;m  no tracking import. e export.;<br>
								- Inclus&atilde;o dos campos Importador, Exportador, Incoterm e Modalidade no tracking exporta&ccedil;&atilde;o; <br>
								- Inclus&atilde;o do campo e filtro Armaz&eacute;m de Atraca&ccedil;&atilde;o nos tracking de Importa&ccedil;&atilde;o e Exporta&ccedil;&atilde;o; </p>
							<p><b>1.01.05</b>(15/08/2005) - liberado<br>
								- Inclus&atilde;o dos campos Nr. de Ordem, Modalidade(Via de Transporte) e Quantidade no resultado do Tracking Importa&ccedil;&atilde;o;<br>
								- Inclus&atilde;o do filtro Analista Cliente na pesquisa do tracking importa&ccedil;&atilde;o;<br>
								- Inclus&atilde;o dos filtros e campos Importador, Tipo de Pedido, Porto/Aeroporto e Incoterm na pesquisa e resultado do tracking importa&ccedil;&atilde;o.</p>
							<p><b>1.01.04</b>(10/08/2005) - liberado <br>
								- Organiza&ccedil;&atilde;o dos campos e filtros da personaliza&ccedil;&atilde;o no banco de dados; <br>
								- Na pesquisa de tracking exporta&ccedil;&atilde;o foi incluida a &aacute;rea na tabela auxiliar para facilitar a ordena&ccedil;&atilde;o dos dados;<br>
								- Cria&ccedil;&atilde;o de um script gen&eacute;rico para sele&ccedil;&atilde;o de pesonaliza&ccedil;&atilde;o(filtros e campos, mas ainda existem p&aacute;ginas se a altera&ccedil;&atilde;o); <br>
								- Inclus&atilde;o do urgente nos filtros e resultado do relat&oacute;rio de tracking de importa&ccedil;&atilde;o; <br>
								- Corre&ccedil;&atilde;o da personaliza&ccedil;&atilde;o dos detalhes de Importa&ccedil;&atilde;o e Exporta&ccedil;&atilde;o(cria&ccedil;&atilde;o de novo menu e sub-menus);<br>
								- Melhorias na performace e estrutura das stored procedure de alerta, kpi espora&ccedil;&atilde;o e lead time;<br>
								- Melhoria nos relat&oacute;rios em Excel, datas e numeros n&atilde;o saem mais como string, agora s&atilde;o formatados como data e n&uacute;mero; <br>
								- Inclus&atilde;o do nr. fatura, nr. da fatura comercial e urgente no filtro e resultado do relat&oacute;rio de tracking exporta&ccedil;&atilde;o; <br>
								- Inclus&atilde;o do agente de carga, nr. da nota fiscal, nr. re no resultado do relat&oacute;rio de tracking exporta&ccedil;&atilde;o.</p>
							<p><b>1.01.03</b>(09/08/2005) - liberado <b><br>
								</b>- No caso do banco de dados estar fora do ar, redireciona-se para uma p&aacute;gina de manuten&ccedil;&atilde;o.</p>
							<p><b> 1.01.02</b>(02/08/2005) - liberado<br>
								- Inclus&atilde;o do nr. do caminh&atilde;o no resultado da busca de tracking exporta&ccedil;&atilde;o; <br>
								- Inclus&atilde;o do pa&iacute;s de destino, importador e nr. do caminh&atilde;o nos filtros da busca de tracking  exporta&ccedil;&atilde;o ;<br>
								- Melhorias na stored procedure de busca de tracking importa&ccedil;&atilde;o/exporta&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o na exibi&ccedil;&atilde;o da mercadoria no tracking importa&ccedil;&atilde;o, agora s&atilde;o exibidas por referencia/item, n&atilde;o mais pelo nr. processo;<br>
								- 
								Corre&ccedil;&atilde;o na referencia e itens da po no tracking de importa&ccedil;&atilde;o, exibindo corretamente as datas de follow-up po e desembara&ccedil;o;<br>
								- Inclus&atilde;o da Sub-&Aacute;rea no filtro de pesquisa tracking importa&ccedil;&atilde;o.</p>
							<p><b>1.01.01</b>(20/07/2005) - liberado <br>
								- Corre&ccedil;&atilde;o no relat&oacute;rio de KPI Importa&ccedil;&atilde;o, n&atilde;o permitindo processos com a diferen&ccedil;a de dias negativo;<br>
								- Corre&ccedil;&atilde;o no logon do sistema(retornar para tela de autentica&ccedil;&atilde;o no caso de errar usu&aacute;rio e/ou senha); <br>
								- Inclu&iacute;do na tela de alerta(imp/exp) o nome do evento; <br>
								- Corre&ccedil;&atilde;o na pesquisa de alerta(imp/exp) quando usu&aacute;rio cliente, seleciona apenas as empresas e &aacute;reas que tem permiss&atilde;o; <br>
								- Corre&ccedil;&atilde;o dos totais de KPI Importa&ccedil;&atilde;o;<br>
								- Elimina&ccedil;&atilde;o da palavra &quot;Web&quot; do rodap&eacute; e autentica&ccedil;&atilde;o;<br>
								- Corre&ccedil;&atilde;o das informa&ccedil;&otilde;es do detalhe de cont&ecirc;iner.</p>
							<p><b>1.01.00</b>(13/07/2005) - liberado<br>
								- Cria&ccedil;&atilde;o do M&oacute;dulo de KPI Exporta&ccedil;&atilde;o. </p>
							<p><b>1.00.00</b>(23/06/2005) - liberado<br>
								- Cria&ccedil;&atilde;o do M&oacute;dulo de Tracking Importa&ccedil;&atilde;o e Exporta&ccedil;&atilde;o;<br>
								- Cria&ccedil;&atilde;o do Modulo de KPI Importa&ccedil;&atilde;o; <br>
								- Cria&ccedil;&atilde;o do M&oacute;dulo de Alerta Importa&ccedil;&atilde;o e Exporta&ccedil;&atilde;o;.</p></td>
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
