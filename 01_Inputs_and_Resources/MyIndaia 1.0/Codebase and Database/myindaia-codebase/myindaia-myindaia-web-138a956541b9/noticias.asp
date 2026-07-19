<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script>
var total_div = 11;

function exibeDiv(Div){
	var div = document.getElementById(Div);	
	if(div.style.display == 'none'){
	div.style.display = 'block';
	for (i = 1; i <= total_div;i++){
		if (Div != i){
		var div_retira = document.getElementById(i);
			div_retira.style.display = 'none';
		}
	}
	}else{
	div.style.display = 'none';
	}
}

</script>
<html>
<head>
<link href="includes/styles.css" rel="stylesheet" type="text/css" />
</head>
<body style="overflow:auto;">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
        <!--#include file="includes/lay_header2.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
            
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="350">
						<td align="center">
<table width="400" border="0" cellpadding="0" cellspacing="0">
					<tr>
					  <td valign="top"><img src="imagens/novidades.gif" width="135" height="400" align="top"></td>
                    	<td><br><br>
                        <p><b><nobr>Clique nas datas para exibir/ocultar as informações.</nobr></b></p>
                        <p><a href="#" onClick="exibeDiv('11');"><img width="130" height="39" src="/imagens/ajuda/02072010/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 02/07/2010"></a></p>
                         <p><b>Tracking: Cópia de configuração de relatório</b></p>
                         <div id="11" style="display:block;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Foram feitas algumas alterações no <b class="folder1">Tracking</b>. Agora o usuário tem a opção de <b><i>copiar</i></b> a configuração do relatório escolhido para outro <b><i>usuário</i></b>, basta clicar na opção indicada na imagem abaixo:</p>
						<p><img src="/imagens/ajuda/02072010/fig1.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Após clicar, uma tela como a ilustrada na figura abaixo irá aparecer. O usuário deverá escolher quem receberá a cópia de configuração do relatório.</p>
                        <p><img src="/imagens/ajuda/02072010/fig2.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Em alguns casos, o usuário escolhido não apresenta as mesmas <b><i>permissões</i></b> do criador do relatório. Com isso estas informações <b>(Ex: campos e filtros)</b>> não serão copiadas. A <b><i>mensagem</i></b> que será exibida caso isso ocorra pode ser visualizada na imagem a seguir:</p>
                        <p><img src="/imagens/ajuda/02072010/fig3.jpg" border="1"><br></p>
                        </div>
                        <p><a href="#" onClick="exibeDiv('10');"><img width="130" height="39" src="/imagens/ajuda/02022010/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 02/02/2010"></a></p>
                         <p><b>Tracking: Pesquisa</b></p>
                         <div id="10" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Foram feitas algumas alterações na tela de <b><i>pesquisa</i></b> do <b class="folder1">Tracking</b>. Além das mudanças <b><i>visuais</i></b>, o usuário também pode carregar a última consulta realizada pelo relatório escolhido, clicando na opção <b>Última pesquisa</b>, em destaque na imagem abaixo:</p>
						<p><img src="/imagens/ajuda/02022010/fig1.jpg" border="1"><br></p>
                         <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vale lembrar que as pesquisas dos relatórios começam a ser <b><i>armazenadas</i></b> a partir de agora. A imagem a seguir ilustra a <b><i>última consulta</i></b> deste relatório já carregada:</p>
                        <p><img src="/imagens/ajuda/02022010/fig2.jpg" border="1"><br></p>
                        </div>
                        <p><a href="#" onClick="exibeDiv('9');"><img width="130" height="39" src="/imagens/ajuda/16112009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 05/11/2009"></a></p>
                         <p><b>Arquivos digitalizados: Envio por e-mail</b></p>
                         <div id="9" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agora ao visualizar os <b><i>documentos digitalizados</i></b> de um determinado processo, o usuário poderá enviar por <b><i>e-mail</i></b> os arquivos desejados. A seleção dos arquivos está ilustrada na imagem a seguir:</p>
						<p><img src="/imagens/ajuda/16112009/fig1.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O segundo passo é clicar no botão <b>Enviar por e-mail</b>. Nesta tela o usuário preencherá os campos, como o e-mail do <b><i>destinatário</i></b>, o <b><i>assunto</i></b> e um texto de sua preferência para o <b><i>corpo da mensagem</i></b>. Para enviar o e-mail com os documentos escolhidos em anexo, basta clicar em <b>Enviar</b>.</p>
                        <p><img src="/imagens/ajuda/16112009/fig2.jpg" border="1"><br></p>
                        </div>
                        <p><a href="#" onClick="exibeDiv('8');"><img width="130" height="39" src="/imagens/ajuda/05112009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 05/11/2009"></a></p>
                         <p><b>Tracking: Personalização</b></p>
                         <div id="8" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Foram feitas algumas alterações na opção <i><b>Limitar Por</i></b> da personalização do <b class="folder1">Tracking</b>, como pode ser visto a seguir:</p>
						<p><img src="/imagens/ajuda/05112009/fig1.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agora, além de poder limitar a pesquisa pelos registros com o evento escolhido (Ex: <b>Mercadoria na Fábrica</b>) não realizado ou registros em que a data de realização deste evento se encontre nos últimos <b><i>XX</i></b> (Ex: <b>3</b>) dias, o usuário poderá combinar as duas opções, basta marcar ambas, a situação está ilustrada na figura abaixo: </p>
                        <p><img src="/imagens/ajuda/05112009/fig2.jpg" border="1"><br></p>
                        </div>
                         <p><a href="#" onClick="exibeDiv('7');"><img width="130" height="39" src="/imagens/ajuda/22102009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 23/10/2009"></a></p>
                         <p><b>Controle: Acessos x Clientes</b></p>
                         <div id="7" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A opção <b class="folder1">Controle</b> foi criada com o objeitvo de <b><i>usuários selecionados</i></b> terem a possibilidade de solicitar diretamente do site ao <b><i>HelpDesk</i></b> da empresa. O usuário com esse acesso visualizará a nova opção no menu situado no canto esquerdo da página:</p>
						<p><img src="/imagens/ajuda/22102009/fig1.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Após clicar em <b>Acessos x Clientes</b>, as telas exibidas nas próximas 2 imagens irão aparecer, onde todos os usuários e seus respectivos acessos dentro do sistema estão listados.</p>
                        <p><img src="/imagens/ajuda/22102009/fig2.jpg" border="1"><br></p>
                        <p><img src="/imagens/ajuda/22102009/fig3.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O controle funcionará da seguinte forma: por exemplo, se o usuário logado no sistema deseja <b><i>retirar</i></b> o acesso de uma área de um dos usuários listados basta clicar na <img src="/imagens/icones/16x16/btn_delete.gif" border="0" align="absmiddle"> ao lado da área. A seguir, basta o usuário clicar em <b>Confirmar Solicitação</b> na tela que irá surgir, como pode ser visto na figura abaixo:</p>
                        <p><img src="/imagens/ajuda/22102009/fig4.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lembrando que para solicitar a retirada do acesso de qualquer <b><i>menu</i></b>, o procedimento será o mesmo. O usuário logado também pode solicitar o <b><i>cadastro</i></b> de uma nova área ou um novo menu para qualquer usuário listado, clicando por exemplo, na opção <span style="color:#0000FF;">+ Solicitar nova área</span>. Na figura a seguir, é ilustrado o exemplo de solicitação de uma nova área para o usuário:</p>
                        <p><img src="/imagens/ajuda/22102009/fig5.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O prazo para <b><i>resolução</i></b> da solicitação é de 3 horas, tanto na solicitação de uma exclusão quanto para solicitação de um cadastro, após a confirmação do usuário solicitante</p>
                        </div>
                        <p><a href="#" onClick="exibeDiv('6');"><img width="130" height="39" src="/imagens/ajuda/14102009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 15/10/2009"></a></p>
                         <p><b>Tracking: Configuração de KPI</b></p>
                         <div id="6" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A personalização do <b class="folder1">Tracking</b> apresenta algumas mudanças. A partir de agora o usuário poderá adicionar ao seu relatório campos configurados que exibem o KPI das <b><i>datas selecionadas</i></b>. Para acessar a nova opção, basta clicar no botão <b>Editar KPIs</b>. A animação a seguir mostra o <b><i>procedimento</i></b> para a configuração de novos KPIs:</p>
						<p><object id="csSWF" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="400" height="302" codebase="http://active.macromedia.com/flash7/cabs/ swflash.cab#version=9,0,28,0">
                <param name="src" value="/imagens/ajuda/14102009/teste.swf"/>
                <param name="bgcolor" value="#ffffff"/>
                <param name="quality" value="best"/>
                <param name="allowScriptAccess" value="always"/>
                <param name="allowFullScreen" value="false"/>
                <param name="scale" value="noscale"/>
                <param name="flashVars" value="autostart=false"/>
                <embed name="csSWF" src="/imagens/ajuda/14102009/teste.swf" width="400" height="302" bgcolor="#ffffff" quality="best" allowScriptAccess="always" allowFullScreen="false" scale="noscale" flashVars="autostart=false" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></embed>
            </object><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nas <b>Opções (Lead-Time)</b>, o usuário determina se os dias contados serão <b><i>dias corridos</i></b> ou apenas <b><i>dias úteis</i></b>. Já nos <b>Eventos Disponíveis</b>, aparecerão todos os eventos selecionados em <b>Campos Selecionados</b> pelo usuário na personalização do relatório. Vale lembrar, que serão exibidos apenas os campos que já foram salvos pelo usuário, ou seja, antes de editar o KPI é necessário salvar as alterações do seu relatório no botão <b><i>Cadastrar</i></b>. Ao selecionar dois eventos <b><i>diferentes</i></b>, eles vão imediatamente para os <b>KPIs Selecionados</b>, lá o usuário poderá excluir qualquer KPI previamente configurado, clicando na <img src="/imagens/icones/16x16/btn_delete.gif" border="0" align="absmiddle">.</p>      
                        <p><img src="/imagens/ajuda/14102009/fig3.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Após configurar todos os KPIs desejados, basta ao usuário clicar no botão <b>Confirmar KPIs</b>, e os mesmos se tornam <b><i>campos selecionados</i></b>, como pode ser visto em destaque na imagem acima. Assim sendo, serão apresentados no resultado da busca e consequentemente no download em excel.Abaixo, o <b><i>resultado</i></b> da consulta:</p> 
                        <p><img src="/imagens/ajuda/14102009/fig4.jpg" border="1"><br></p>
                            </div>    
                        <p><a href="#" onClick="exibeDiv('5');"><img width="130" height="39" src="/imagens/ajuda/07082009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 07/08/2009"></a></p>
                         <p><b>Detalhes do Processo: Simples ou Detalhado</b></p>
                         <div id="5" style="display:none; width:500px"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Um novo recurso pode ser encontrado na tela de exibição dos <b><i>detalhes do processo</i></b>. No topo direito, ao lado do ícone de impressão, o usuário visualizará uma das imagens a seguir:</p>
						<p><img src="/imagens/icones/32x32/btn_lupa_mais20.gif" border="1">&nbsp;&nbsp;<img src="/imagens/icones/32x32/btn_lupa_menos20.gif" border="1"><br></p>      
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ao clicar na primeira imagem, a visualização dos detalhes do processo será <b><i>detalhada</i></b>, com todas as informações que eram exibidas normalmente. Clicando na segunda imagem, a exibição será <b><i>resumida</i></b>, focando informações indispensáveis para o acompanhamento do processo, como o <b><i>follow-up</i></b> e as <b><i>observações</i></b>. É importante ressaltar que ao escolher o <b><i>modo simples</i></b> (resumido), as informações (Ex: <b>Valores Totais</b>) que não aparecem na tela também podem ser <b><i>exibidas</i></b> ao usuário, basta clicar no botão <img src="/imagens/icones/16x16/btn_mais20.gif" width="15" height="13" align="absmiddle"> <b>Informações</b>. A última opção escolhida pelo usuário ficará definida como <b><i>padrão</i></b> para as próximas exibições.</p>
                            </div>   
                        <p><a href="#" onClick="exibeDiv('4');"><img width="130" height="39" src="/imagens/ajuda/03082009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 03/08/2009"></a></p>
                         <p><b>Tracking: Ordenação</b></p>
                         <div id="4" style="display:none;"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agora é possivel escolher a ordenação dos registros no relatório. Na tela de pesquisa do <b class="folder1">Tracking</b>, logo abaixo dos <b><i>filtros pré-selecionados</b></i>, o usuário encontrará a opção ilustrada na figura a seguir:</p>
						<p><img src="/imagens/ajuda/03082009/fig1.jpg" border="1"><br></p>      
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O <b><i>campo de escolha</b></i> em destaque na imagem acima, contém todos os campos <b><i>selecionados</b></i> para o relatório e que dão suporte à ordenação. Em todo o sistema, aproximadamente <b>85%</b> dos campos dão suporte à esta nova opção. Além de escolher o campo por qual deseja ordernar o relatório, o usuário ainda pode definir o tipo desta ordenação em <b><i>Crescente</b></i> ou <b><i>Decrescente</b></i>.</p>
                            <p><img src="/imagens/ajuda/03082009/fig2.jpg" border="1"><br></p>   
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vale lembrar que assim como os <b><i>filtros</b></i>, este sistema também possibilita a escolha de vários campos, e a ordenação do relatório <b><i>seguirá</b></i> a ordem de escolha dos campos.</p>    
                            </div> 
                         <p><a href="#" onClick="exibeDiv('3');"><img width="130" height="39" src="/imagens/ajuda/27052009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 21/07/2009"></a></p>
                         <p><b>Tracking: Pesquisa</b></p>
                         <div id="3" style="display:none"> 
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O sistema de <b>Pesquisa</b> no <b class="folder1">Tracking</b> apresenta algumas mudanças. As novas <b><i>opções</i></b> podem variar de filtro para filtro e estão indicadas na figura abaixo (Ex: <b>Qtde. Embarcada</b>):</p>
						<p><img src="/imagens/ajuda/27052009/fig1.jpg" border="1"><br></p>      
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Esta ferramenta está disponível para todos os filtros do site, exceto os de data (Ex: <b>Agente de Carga</b>).</p>
                            <p><img src="/imagens/ajuda/27052009/fig2.jpg" border="1"><br></p>
                            <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ao mudar a opção de <b><i>Igual a</i></b> para <b><i>Contém</i></b>, o filtro deixa de ser um <b><i>campo de escolha</i></b> e se torna de <b><i>digitação</i></b>, apontado na figura a seguir:</p>
                            <p><img src="/imagens/ajuda/27052009/fig3.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Outra mudança na pesquisa, é a possibilidade de preencher mais de um valor para o mesmo filtro. Grande parte dos filtros disponíveis no sistema, oferecem este recurso (Ex: <b>Qtde. Embarcada</b>). Para <b><i>criar</i></b> um novo campo de pesquisa, basta clicar no <img src="/imagens/icones/16x16/btn_mais20.gif" align="absmiddle"> ou então pressionar as teclas <b>(shift)</b> e <b>(+)</b>. Para <b><i>retirar</i></b>, basta clicar no <img src="/imagens/icones/16x16/btn_menos20.gif" align="absmiddle"> localizado ao lado direito do campo, ou posicionar o cursor no campo que deseja excluir e pressionar as teclas <b>(shift)</b> e <b>(-)</b>.</p>
                            <p><img src="/imagens/ajuda/27052009/fig4.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Veja abaixo um exemplo de pesquisa, após feita toda a configuração desejada:</p> 
                            <p><img src="/imagens/ajuda/27052009/fig5.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clicando no botão <b><i>Pesquisar</i></b>, é exibida uma tela contendo todas as informações da consulta do relatório escolhido (Ex: <b>TESTE</b>), como: <b><i>Tipo do relatório</i></b>, <b><i>Limitador</i></b>, <b><i>Agrupamento por</i></b>, <b><i>Ordenação</i></b>, <b><i>Campos selecionados</i></b>, <b><i>Filtros utilizados</i></b> e <b><i>Outras opções</i></b>. No item <b><i>Filtros utilizados</i></b>, todos os filtros escolhidos entre os selecionados pelo usuário na personalização aparecem, além das informações passadas à eles. Esta tela é ilustrada na figura a seguir:</p>
                            <p><img src="/imagens/ajuda/27052009/fig7.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A tela exibida na figura acima também pode ser vista a qualquer momento, basta o usuário clicar no botão <b><i>Ver resumo</i></b>. A única diferença é a ausência do botão <b><i>Confirmar busca</i></b>. A <b><i>exibição automática</i></b> desta tela pode ser controlada marcando ou desmarcando a opção <b><i>Desejo ver sempre o resumo da pesquisa</i></b>.</p> 
                            <p><b>Contato</b></p>
                            <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O <img src="/imagens/icones/16x16/mail_ouvi20.gif" align="absmiddle"> <b>Contato</b> do site foi totalmente alterado, agora o as informações como <i><b>Nome</i></b>, <i><b>Empresa</i></b> e <i><b>E-Mail</i></b> são preenchidas automaticamente. Vale lembrar, que se torna possível a alteração destes dados quando o assunto escolhido for <i><b>Ouvidoria</i></b>, para que haja a possibilidade de mensagens <i><b>anônimas</i></b>. Segue abaixo a ilustração mostrando a nova tela de contato:</p>
                            <p><img src="/imagens/ajuda/27052009/fig8.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Após o preenchimento dos campos, basta o usuário clicar no botão <i><b>Enviar Dados</i></b> para que o e-mail seja enviado. A escolha correta do <i><b>assunto</i></b> é  fundamental, já que esta informação determina o <i><b>destinatário</i></b> da mensagem.</p>       
                            </div> 
                        <p><a href="#" onClick="exibeDiv('2');"><img width="130" height="39" src="/imagens/ajuda/13042009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 13/04/2009"></a></p>
                         <p><b>Tracking: Personalização</b></p>
                        <div id="2" style="display:none;">
                       
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Foram feitas algumas alterações na personalização do <b class="folder1">Tracking</b>, entre elas, no <i><b>Limitar Por</i></b>. Agora, ele será exibido da seguinte forma: </p>
						<p><img width="593" height="48" src="/imagens/ajuda/13042009/fig2.jpg" border="1"><br></p>
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A partir do momento em que um evento (Ex: <b>Mercadoria na Fábrica</b>) é escolhido pelo usuário, são dadas <b>duas opções</b>, exatamente como é ilustrado na figura acima. </p>        
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A opção <b><i>Não Realizado</i></b> indica que a consulta apresentará registros que não possuem data de realização no evento escolhido no limitador. Essa <b><i>opção</i></b> vem substituir o antigo parâmetro <b>-1</b>. A <b><i>segunda opção</i></b>, permite trazer os registros em que a data de realização se encontre nos últimos <b><i>XX</i></b> (Ex: <b>3</b>) dias, digitados pelo usuário, no espaço apontando na ilustração a seguir:</p>
                            <p><img width="593" height="48" src="/imagens/ajuda/13042009/fig3.jpg" border="1"><br></p>
                            <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outra alteração na personalização do <b class="folder1">Tracking</b> pode ser vista na escolha dos <b><i>campos</i></b>. A partir de agora, o usuário poderá definir a ordem dos campos para geração do <b><i>relatório</i></b> como bem entender. A ordenação dos campos é feita por meio das <b><i>setas</i></b> indicadas na figura abaixo. </p>
                            <p><img width="608" height="178" src="/imagens/ajuda/13042009/fig5.jpg" border="1"><br></p> 
                            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Após selecionar um item entre os <b><i>campos selecionados</i></b>, o usuário poderá clicar na <b><i>seta para cima</i></b>, movendo o item selecionado uma posição acima, ou clicar na <b><i>seta para baixo</i></b>, para mover o item selecionado uma posição abaixo. O usuário poderá clicar o número de vezes necessárias para o item alcançar a posição desejada.</p> 
                         </div>
                         
                        <p><a href="#" onClick="exibeDiv('1');"><img width="130" height="39" src="/imagens/ajuda/02042009/data.gif" border="0" alt="clique aqui para exibir/ocultar as informações de 02/04/2009"></a></p>
                        <p><b>Busca Rápida (Importação/Exportação)</b></p>
                        <div id="1" style="display:none;">
                        
                        <p align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A <b class="folder_busca">Busca Rápida</b> é utilizada para ir diretamente aos detalhes de um processo sem a necessidade de criação de um <i><b>Tracking</b></i>. Após a realização do login no site encontre a opção <b class="folder_busca">Busca Rápida</b> no menu situado no canto esquerdo da página. </p>
							<p align="justify"><img width="235" height="136" src="/imagens/ajuda/02042009/fig1.jpg" border="1"><br>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clique no + localizado ao lado da <b class="folder_busca">Busca Rápida</b> para visualizar os seguinte campos, conforme abaixo: </p>
							<p align="justify"><img width="183" height="72" src="/imagens/ajuda/02042009/fig2.jpg" border="1"><br>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Digitando no campo que está escrito <i><b>Referência Indaiá</b></i> a busca será realizada pelo número do processo criado pela Indaiá. Já se a necessidade for a busca pelo pedido, a digitação deverá ocorrer no campo que está escrito <i><b>Referência Cliente</b></i>. Para acessar os detalhes do <i><b>processo/pedido</i></b> digitado basta clicar na <i><b>seta</b></i> localizada ao lado do campo correspondente, ou então pressionar a tecla <i><b>enter</b></i> logo após a digitação.</p>
							<p>
								<br>
								<b>Resultados da Busca</b></p>
							<p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Se a busca realizada não encontrar o <i><b>processo/pedido</i></b> digitado, um aviso será mostrado na tela. Já se o <i><b>processo/pedido</i></b> for encontrado,  aparecerá uma tela com todos os detalhes referentes ao <i><b>processo/pedido</i></b> pesquisado, conforme abaixo:</p>
							<p align="justify"><img width="526" height="290" src="/imagens/ajuda/02042009/fig6.jpg" border="1"><br>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quando a busca escolhida é a por <i><b>pedido</i></b> há a possibilidade da pesquisa retornar mais que um resultado, sendo assim, aparecerá uma tela listando todos os processos em que o <i><b>pedido</i></b> (Ex: <b>4502072634</b>) buscado for encontrado, como pode ser visto no exemplo a seguir:</p>
							<p align="justify"><img width="526" height="321" src="/imagens/ajuda/02042009/fig7.jpg" border="1"><br>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nesta tela irá aparecer algumas informações, como o <i><b>Processo (Referencia Indaiá), Pedido (Referência Cliente), Exportador (Nome do Cliente), Nome Reduzido, CNPJ, Mercadoria, e Abertura do Registro</i></b>. Clicando no processo, a tela com todos os seus respectivos detalhes irá aparecer, conforme foi visto anteriormente.</p>
                                </div>
                                <p>Qualquer dúvida, entre em contato com <a href="mailto:myindaia@myindaia.com.br"><strong><u>myindaia@myindaia.com.br</u></strong></a>.</p><br>							</td>
					</tr>
</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>