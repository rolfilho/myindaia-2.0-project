<%
'------------------------------------------------------------------
'Sistema MyIndaia - Arquivo de Configuração de Sistema
'Arquivo de Script e HTML: Variáveis, objetos, procedures e funções
'
'Autor: Alexandre Gonçalves Neto
'Manutenção: Alexandre(26/02/2007)
'------------------------------------------------------------------

'Option Explicit
'On Error Resume Next

Dim time_in	'tempo inicial de medição do processamento da página 
Dim time_out'tempo final de medição do processamento da página 
time_in = Timer

'::::: HEADERS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Response.AddHeader "pragma","no-cache"
Response.CacheControl = "private"
Response.Expires = -1   'tempo em minutos para uma pagina expirar do cache
Response.Buffer  = True'True	'A página só é exibida caso o método flush seja chamado, ou script acabe

'::::: SESSIONS GLOBAIS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Session.LCID     = 1046	'Configuração regional BR
Session.Timeout  = 120		'Tempo (em minutos) para a sessão expirar
Session("sql_pagina") = ""

'::::: OBJETOS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Dim objcnn : Set objcnn = Nothing 'objeto de conexão com o SQL Server
Dim objcmd : Set objcmd = Nothing 'objeto para execução de comandos SQL (store procedures, etc)
Dim objrs  : Set objrs  = Nothing 'objeto de armazenamento de resultados de sql
Dim objrsx : Set objrsx = Nothing 'objeto de armazenamento auxiliar de resultados sql
Dim objrsv : Set objrsv = Nothing 'objeto de armazenamento de resultados sql para a personalização
Dim objrsf : Set objrsf = Nothing 'objeto de armazenamento de resultados sql para a personalização
Dim objrsy : Set objrsy = Nothing 'objeto de armazenamento de resultados sql para a personalização


'::::: CONSTANTES GLOBAIS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Const SQLSERVER   = "INDAIA10" '"INDAIA10"   'Servidor 0096-FLAVIOH
Const SQLDATABASE = "MYINDAIA"    'Base de dados
Const SQLUSERNAME = "MYINDAIAWEB" 'conta de usuário para conexão SQL Server
Const SQLPASSWORD = "myindaiaweb" 'senha de acesso do usário para conexão SQL Server
Const ERROEMAIL   = "ti@myindaia.com.br"'e-mail para envio de erros ocorridos no site
Const ERROASSUNTO = "Erro MyIndaiá Web"'assunto padrão dos erros no site
Const SUPORTEMAIL = "suporte@myindaia.com.br"
Const CODCLIENTE  = "040;055;060"

%>
<!--#include file="inc_adovbs.asp"-->
<!--#include file="inc_idioma.asp"-->
<%
'::::: VARIAVEIS GLOBAIS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'--Sistema
Dim strHOST_MAIL
Dim strPORT_MAIL
Dim strUSER_MAIL
Dim strPWD_MAIL 
Dim exibe_resumo
Dim in_valor
Dim combo_auxs, combo_aux 
Dim flag_dif
Dim tx_combo_auxs
Dim nr_rap, cd_volume, cont_vl, linha_vl 
Dim alt_senha   'verifica se necessita de alteração de senha
Dim produto 'importação/exportação
Dim script		'script visualizado no momento
Dim tx_erro		'descrição dos erros ocorridos no site
Dim tx_filtro	'fitro que irá aparecer no topo do relatório
Dim str				'variaveis string
Dim num				'variaveis de número
Dim url				'guarda valores para url de impressão/excel/email
Dim cont			'contador (usado em comandos for..next, do..while, etc)
Dim w, x, y, z'variaveis para cálculos matemáticos
Dim matriz		'guarda array construidos dinamicamente ou através do comando Split
Dim vTxHtml   'guarda o retorno de texto HTML para exibição de página
Dim vReturn   'guarda o retorno de funções
dim vInDebug : vInDebug = true 'ativa o debug nas paginas
'--Banco de dados
Dim sql				    'guarda as consultas a serem executadas
Dim stored		    'armazena o nome de stored procedures
Dim nrec			    'retorno de store procedures(return)
Dim tx_lang_menu  'nome do menu no idioma a ser selecionado
Dim tx_lang_subm  'nome do submenu no idioma a ser selecionado
Dim tx_lang_dado  'nome do dado(filtro/campo) no idioma a ser selecionado
Dim tx_lang_evento'nome do evento mostrado nos detalhes do processo
Dim tx_lang_item  'nome do item de faturamento mostrado nos detalhes de processo
Dim tx_lang_status'nome do status do processo 
'--MyIndaia
Dim in_show       'verifica se o menu deve ou não ser exibido
Dim cd_tela       'código da tela do script
Dim nm_tela       'nome da tela do script
Dim cd_menu       'código do menu da personalização
Dim nm_menu       'nome do menu da personalização
Dim cd_subm       'código do sub-menu da personalização
Dim nm_subm       'nome do sub-menu da personalização
Dim cd_docto      'código do documento do menu/submenu
Dim nm_docto      'nome do documento do menu/submenu
Dim cd_view       'código da view do usuário
Dim nm_view       'nome da personalização
Dim cd_user       'código do usário utilizador do sistema
Dim in_embarque	  'verifica se o relatório será exibido por embarque ou pedido-linha
Dim in_dt_prev	  'verifica se serão exibidas ou não as datas previstas
Dim tp_relat      'tipo de relatório(0-desembaraço; 1-pedido; 2-ambos)
Dim tp_quebra		  'forma como os dados são agrupados(grupo, cliente, via de transporte ou área)
Dim tp_ref_cli    'tipo de referencia do cliente pelo qual o relatório será organizado
Dim cd_menu_rel 	'código do menu utilizado no relatório
Dim cd_subm_rel 	'código do sub-menu utilizado no relatório
Dim cd_view_rel 	'personalização utilizada no relatório
Dim in_view_filtro'identificador que verifica se os filtros serão selecionados
Dim in_view_campo	'identificados que verifica se os campos serão selecionados
Dim cd_ident			'identificador do relatório - será desativado
Dim nr_ident			'identificador do relatório
Dim nr_result     'informa se a stored procedure teve ou não resultados
Dim dt_eventoi  	'data inicial dos processos a serem pesquisados
Dim dt_eventof  	'data final dos processos a serem pesquisados
Dim dt_ini        'data inicial
Dim dt_fim        'data final
Dim dt_hoje       'data do dia
Dim nm_campo_rel	'nome do campo que será exibido no relatório
Dim cd_campo_quebra'código do campo definido para ser a quebra do relatório
Dim nr_processo		'numero do processo indaia
Dim nr_referencia	'numero da referencia cliente
Dim cd_empresa
Dim nr_item_clnte	'numero do item da referencia cliente
Dim nr_parcial	    'numero da parcial de baixa do pedido
Dim in_btn_excel	'mostra ou não o botão de download excel
Dim in_btn_lupa	'mostra ou não o botão de download excel
Dim in_btn_excel2	'mostra ou não o botão de download excel
Dim in_btn_email	'mostra ou não o botão de enviar resultado pelo e-mail
Dim in_btn_print	'mostra ou não o botão de imprimir
Dim in_btn_print2	'mostra ou não o botão de imprimir
Dim tx_path_file	'local e nome do arquivo de impressão
Dim tx_path_excel	'local e nome do arquivo do arquivo que gera o download em excel
Dim tx_soma_custo 'código dos campos que vão ser somados no total do custo
Dim tx_pesquisa   'código dos dados que a pesquisa é direta, sem limitador
Dim tx_mercadoria 'texto de descrição das mercadorias
'--Diagramação html
Dim cd_lang       'código do idioma do site
Dim nr_reg_pagina	'número de registros por páginas
Dim cd_quebra_reg 'código do campo de quebra de página
Dim vl_width      'valor da largura da tabela
Dim vl_heigth     'valor da altura da tabela
Dim vl_width_form 'valor da largura dos campos do formulário
Dim vl_colspan		'valor da união de colunas
Dim vl_rowspan		'valor da união de linhas
Dim col           'numero da coluna
Dim row           'numero da linha
Dim nr_cols       'numero de colunas
Dim nr_rows       'numero de linhas
Dim nr_data       'qtde de colunas do tipo data exibidas no relatório
Dim nr_cols_data  'qtde de colunas do tipo data exibidas no relatório
Dim nr_cols_item  'qtde de colunas do tipo item faturamento exibidas no relatório
Dim color         'cor da fonte
Dim bgcolor       'cor de fundo de tabelas e células
Dim selected      'propriedade select de um combobox e listbox
Dim checked       'propriedade checked de radiobutton e checkbox
Dim disabled      'propriedade disable de objetos de forms
Dim tx_campo      'campo que a lista será ordenada
Dim tx_ordem      'ordem do campo (ASC-Ascendente; DESC-Descendente)
Dim nr_pagina     'numero da pagina a ser visualizada
Dim tx_link       'texto com o link principal da página sem váriaveis
Dim vTxExcel      'armazena a linha gerada antes de ser incluida no arquivo
'--Arrays de pequenas tabelas do broker antes copiadas pela replicação
Dim cond_venda_ent
Dim status_cntr
Dim status_followup
Dim status_bordero
Dim tipo_canal
Dim tipo_cntr
Dim tipo_frete
Dim tipo_pedido
Dim tipo_periodo
Dim tipo_quebra
Dim nm_tp_quebra
Dim tipo_referencia
Dim sim_nao
Dim tipo_local_doc
Dim tipo_lang
Dim meses
Dim semana
Dim tipo_exibir
Dim tipo_follow
Dim tipo_consulta
Dim tipo_dado
Dim tipo_drawback
Dim tipo_relatorio
Dim tipo_pessoa
Dim logo_saint
dim aFormaPagar
dim aTipoOrdem
dim aViaTransp
Dim aTpProduto
Dim in_comodo
Dim cd_tema, bg_color_tema, bg_fechar, bg_color_dicas, barra_tracking, bg_topo, cabec_result, fundo_result, linha_result, quebra_result
Dim bg_fundo_logo, color_top, color_bottom, color_texto, bg_detalhes, bg_detalhes_campo, bg_detalhes_borda, bg_btn
Dim rolagem_menu1, rolagem_menu2, rolagem_menu3, rolagem_menu4, rolagem_menu5, rolagem_menu6, rolagem_menu7
Dim lang_digitalizacao

strHOST_MAIL = "smtp-m.myindaia.com.br"
strPORT_MAIL = "587"
strUSER_MAIL = "ti@myindaia.com.br"
strPWD_MAIL =  "789852"

script = Request.ServerVariables("SCRIPT_NAME")
If fnc_TestaVar(Request.QueryString("cd_idioma")) Then
	cd_lang = Request.QueryString("cd_idioma")
	Session("cd_idioma") = cd_lang
Else
	cd_lang = Session("cd_idioma")
End if

If fnc_TestaVar(flag_autentica) and flag_autentica = 1 Then
	cd_lang = 1 
End if

Select Case cd_lang
  case 0
    lang_digitalizacao = ""
  case 1
    lang_digitalizacao = "_i"
  case 2
    lang_digitalizacao = "_e"
  case else
    lang_digitalizacao = ""
End Select

Response.Cookies("myindaia")("cd_idioma") = cd_lang
Response.Cookies("myindaia").Expires = DateAdd("d", 30, Date)
Response.Cookies("myindaia").Domain  = Request.ServerVariables("HTTP_HOST")
Response.Cookies("myindaia").Secure  = True

cd_tema = Session("cd_tema")

if Not fnc_testaVar(cd_tema) Then cd_tema = "1"

Select Case cd_tema
  Case "1"
    bg_color_tema = "#fff3cb"
    bg_color_tema_fonte = "#deb235"
    bg_color_barra = "#efe6ca"
    bg_color_dicas = "#e7d8a7"
    bg_fechar = "3"
    bg_loading = "loading2"
    barra_tracking = "3"
    bg_topo = "#b4c7db" 
    bg_fundo_logo = "4"
    color_bottom = "#336699"
    color_top = "#FFFFFF"
    color_texto = "#8fa3d5"
    bg_detalhes = "#DEE6EF"
    bg_detalhes_campo = "#a2bbd5"
    bg_detalhes_borda = "#a9c2dc"
    cabec_result = "#374bae"
    fundo_result = "#FFFFFF"
    linha_result = "#fff6d9"
    quebra_result = "#a2bbd5"
    fundo_div = "#f0f1f6"
    topo_div = "#b4c7db"
    bg_btn = ""
    rolagem_menu1 = "#f0e2b4;"
    rolagem_menu2 = "#f8ebbf;"
    rolagem_menu3 = "#dac377;"
    rolagem_menu4 = "#e7d8a7;"
    rolagem_menu5 = "#f5ebc8;"
    rolagem_menu6 = "#f5ebc8;"
    rolagem_menu7 = "#e7d8a7;"
    rolagem_menu10 = "#ccd9e7;"
    rolagem_menu20 = "#dae7f4;"
    rolagem_menu30 = "#bfcccf;"
    rolagem_menu40 = "#cad4d6;"
    rolagem_menu50 = "#dde9f6;"
    rolagem_menu60 = "#dde9f6;"
    rolagem_menu70 = "#cad4d6;"
  Case "2"
    bg_color_tema = "#f0f1f6"
    bg_color_tema_fonte = "#0066cc"
    bg_color_barra = "#cad4d6"
    bg_color_dicas = "#f0f1f6"
    bg_fechar = "21"
    bg_loading = "loading"
    barra_tracking = ""
    bg_topo = "#b4c7db" 
    bg_fundo_logo = "4"
    color_bottom = "#336699"
    color_top = "#FFFFFF"
    color_texto = "#8fa3d5"
    bg_detalhes = "#DEE6EF"
    bg_detalhes_campo = "#a2bbd5"
    bg_detalhes_borda = "#a9c2dc"
    cabec_result = "#374bae"
    fundo_result = "#FFFFFF"
    linha_result = "#DEE6EF"
    quebra_result = "#a2bbd5"
    fundo_div = "#f0f1f6"
    topo_div = "#b4c7db"
    bg_btn = ""
    rolagem_menu1 = "#ccd9e7;"
    rolagem_menu2 = "#dae7f4;"
    rolagem_menu3 = "#bfcccf;"
    rolagem_menu4 = "#cad4d6;"
    rolagem_menu5 = "#dde9f6;"
    rolagem_menu6 = "#dde9f6;"
    rolagem_menu7 = "#cad4d6;"
    rolagem_menu10 = "#ccd9e7;"
    rolagem_menu20 = "#dae7f4;"
    rolagem_menu30 = "#bfcccf;"
    rolagem_menu40 = "#cad4d6;"
    rolagem_menu50 = "#dde9f6;"
    rolagem_menu60 = "#dde9f6;"
    rolagem_menu70 = "#cad4d6;"
  Case "3"
    bg_color_tema = "#EDEDED"
    bg_color_tema_fonte = "#000000"
    bg_color_barra = "#96a1b3"
    bg_color_dicas = "#d8d5d5"
    bg_fechar = "4"
    bg_loading = "loading3"
    barra_tracking = "2"
    bg_topo = "#b0bbcd"
    bg_fundo_logo = "6"
    color_bottom = "#000000"
    color_top = "#FFFFFF"
    color_texto = "#96a1b3"
    bg_detalhes = "#EDEDED"
    bg_detalhes_campo = "#c1ccdd"
    bg_detalhes_borda = "#96a1b3"
    cabec_result = "#838890"
    fundo_result = "#FFFFFF"
    linha_result = "#EDEDED"
    fundo_div = "#EDEDED"
    topo_div = "#c1ccdd"
    fechar_div = "_3"
    bg_btn = "_3"
    quebra_result = "#c1ccdd"
    rolagem_menu1 = "#c1c9d5;"
    rolagem_menu2 = "#ced4de;"
    rolagem_menu3 = "#a9b4c5;"
    rolagem_menu4 = "#a9b4c5;"
    rolagem_menu5 = "#dbe0e9;"
    rolagem_menu6 = "#dbe0e9;"
    rolagem_menu7 = "#96a1b3;"
    rolagem_menu10 = "#c1c9d5;"
    rolagem_menu20 = "#ced4de;"
    rolagem_menu30 = "#a9b4c5;"
    rolagem_menu40 = "#a9b4c5;"
    rolagem_menu50 = "#dbe0e9;"
    rolagem_menu60 = "#dbe0e9;"
    rolagem_menu70 = "#96a1b3;"
  Case "4"
    bg_color_tema = "#fee6f9"
    bg_color_tema_fonte = "#f874e1"
    bg_color_barra = "#f0ceea"
    bg_color_dicas = "#ffd5f8"
    bg_fechar = "5"
    bg_loading = "loading4"
    barra_tracking = "4"
    bg_topo = "#a6739e"
    bg_fundo_logo = "7"
    color_bottom = "#FFFFFF"
    color_top = "#FFFFFF"
    color_texto = "#a6739e"
    bg_detalhes = "#fcdcf7"
    bg_detalhes_campo = "#ac81a5"
    bg_detalhes_borda = "#eca3e0"
    cabec_result = "#a6739e"
    fundo_result = "#FFFFFF"
    linha_result = "#fcdcf7"
    quebra_result = "#ac81a5"
    fundo_div = "#fee6f9"
    topo_div = "#f0ceea"
    fechar_div = "_4"
    bg_btn = "_4"
    rolagem_menu1 = "#fad5f4;"
    rolagem_menu2 = "#ffdffa;"
    rolagem_menu3 = "#fcbdf2;"
    rolagem_menu4 = "#fcbdf2;"
    rolagem_menu5 = "#fad5f4;"
    rolagem_menu6 = "#fad5f4;"
    rolagem_menu7 = "#fcbdf2;"
    rolagem_menu10 = "#fad5f4;"
    rolagem_menu20 = "#ffdffa;"
    rolagem_menu30 = "#fcbdf2;"
    rolagem_menu40 = "#fcbdf2;"
    rolagem_menu50 = "#fad5f4;"
    rolagem_menu60 = "#fad5f4;"
    rolagem_menu70 = "#fcbdf2;"
End Select 

If Not fnc_TestaVar(cd_lang) Then cd_lang = 0 Else cd_lang = CInt(Right(cd_lang,1))
'seleciona o nome do menu e submenu de acordo com o idioma
Select Case cd_lang
	Case 1
		tx_lang_menu   = "M01_NM_ENG"
		tx_lang_subm   = "M02_NM_ENG"
		tx_lang_dado   = "M10_NM_ENG"
		tx_lang_evento = "NM_INGLES"
		tx_lang_item   = "NM_ITEM_INGLES"
		tx_lang_status = "NM_INGLES"
		
		cond_venda_ent  = Array("Not control","180 days","90 days","60 days","until")
		status_cntr     = Array("Entered","Disposed","Demurrage","Waiting Invoice","Invoiced","Partial Invoiced","Pay","Partial Pay","Waiting Receipt","Finished")
		status_followup = Array("Attention","Been slow","Carried through","Not carried through","Not applicable","In the stated period")
		status_bordero  = Array("To Print","Printed","Revised")
		tipo_canal      = Array("Red","Yellow","Green","Gray","Waiting","Blocked Green","All","Orange")
		tipo_pedido     = Array("Indent","NB","Sample","Intercompany","Other Suppliers","Labels","Resale","Jundiaí","Raw Material","Ativo Fixo","Consumo","","","","Industrialização/Comercializ.","","","","Manutenção Máquinas e Equip.")
		tipo_periodo    = Array("Days","Months")
		nm_tp_quebra    = Array("Group of Companies","Companies","Modality","Area","Foreign Company", "Exporter/Supplier")
		tipo_referencia = Array("PEDIDO","ORDEM","REMESSA","OUTROS","BOOKING","SEEK","SAP USA","EMBARQUE","COURRIER","ATO CONCESSÓRIO","SAP TM","Cotação","Número do Lote","BOOKING CO-LOADER","MAPA","PROTOCOLO BB","RECOPI","PROTOCOLO FORM A","MAIN LEG.","CORREIOS","FATURA","Carta de Crédito","Pedido de Embarque","SAT","OIC","CONJUGADO","CERTIFICADO CONFORMI","CORREIOS","CORREIOS FRONTEIRA","GSDB FABRICANTE","COURIER HEALTH","NCM","PROTOCOLO","EXPORTADOR","QUALITY CERTIFICATE","EMBARCAR QTDE","EMBARCAR SALDO","DEPOT","COURRIER BANCO","COURRIER VITÓRIA","PARCEIROS","CERTIFICADO OIC"," "," "," ","CATEGORIA","REGIAO","DELIVERY","Chave LPCO","SIMI")
		sim_nao         = Array("No","Yes")
		tipo_local_doc  = Array("Indaia","Customer","Others")
		tipo_drawback   = Array("No","Exemption","Suspension","Intermediary")
		tipo_relatorio  = Array("desemb.","pedido","ambos")
		tipo_pessoa     = Array("Importer","Agent","Transporter","Bank","Dispatcher","")
		aFormaPagar     = Array("Graphical","To Send","Invoice","")
		meses  = Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
		semana = Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
       
	Case 2
		tx_lang_menu   = "M01_NM_ESP"
		tx_lang_subm   = "M02_NM_ESP"
		tx_lang_dado   = "M10_NM_ESP"
		tx_lang_evento = "NM_ESPANHOL"
		tx_lang_item   = "NM_ITEM_ESPANHOL"
		tx_lang_status = "NM_ESPANHOL"
		
		cond_venda_ent  = Array("Não controla","180 dias","90 dias","60 dias","Até")
		status_cntr     = Array("Entrado","Desovado","Demurrage","Aguardando Fatura","Faturado","Faturado Parcial","Pago","Pago Parcial","Aguardando Recibo","Finalizado")
		status_followup = Array("Atenção","Atrasado","Realizado","Não Realizado","Não Aplicável","No Prazo")
		status_bordero  = Array("À Imprimir","Impresso","Revisado")
		tipo_canal      = Array("Vermelho","Amarelo","Verde","Cinza","Aguardando","Verde Bloqueado","Todos","Laranja")
		tipo_pedido     = Array("Indent","NB","Amostra","Intercompany","Outros Fornecedores","Rótulos","Revenda","Jundiaí","Matéria-Prima","Ativo Fixo","Consumo","","","","Industrialização/Comercializ.","","","","Manutenção Máquinas e Equip.")
		tipo_periodo    = Array("Dias","Meses")
		nm_tp_quebra    = Array("Grupo de Empresas","Empresa","Modalidade","Área","Empresa Estrangeira","Exportador/Fornecedor")
		tipo_referencia = Array("PEDIDO","ORDEM","REMESSA","OUTROS","BOOKING","SEEK","SAP USA","EMBARQUE","COURRIER","ATO CONCESSÓRIO","SAP TM","Cotação","Número do Lote","BOOKING CO-LOADER","MAPA","PROTOCOLO BB","RECOPI","PROTOCOLO FORM A","MAIN LEG.","CORREIOS","FATURA","Carta de Crédito","Pedido de Embarque","SAT","OIC","CONJUGADO","CERTIFICADO CONFORMI","CORREIOS","CORREIOS FRONTEIRA","GSDB FABRICANTE","COURIER HEALTH","NCM","PROTOCOLO","EXPORTADOR","QUALITY CERTIFICATE","EMBARCAR QTDE","EMBARCAR SALDO","DEPOT","COURRIER BANCO","COURRIER VITÓRIA","PARCEIROS","CERTIFICADO OIC"," "," "," ","CATEGORIA","REGIAO","DELIVERY","Chave LPCO","SIMI")
		sim_nao         = Array("Não","Sim")
		tipo_local_doc  = Array("Indaiá","Cliente","Outros")
		tipo_drawback   = Array("No","Exención","Suspensión","Intermediario")
		tipo_relatorio  = Array("desemb.","pedido","ambos")
		tipo_pessoa     = Array("Importador","Agente","Transportador","Banco","Despachador","")
		aFormaPagar     = Array("Gráfico","Enviar","Factura","")
		meses  = Array("Enero", "Febrero", "Marcha", "Abril", "Pueden", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
		semana = Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado") 
	Case Else
		tx_lang_menu   = "M01_NM_MENU"
		tx_lang_subm   = "M02_NM_SUBM"
		tx_lang_dado   = "M10_NM_DADO"
		tx_lang_evento = "NM_EVENTO"
		tx_lang_item   = "NM_ITEM"
		tx_lang_status = "NM_ETAPA"
		
		cond_venda_ent  = Array("Não controla","180 dias","90 dias","60 dias","Até")
		status_cntr     = Array("Entrado","Desovado","Demurrage","Aguardando Fatura","Faturado","Faturado Parcial","Pago","Pago Parcial","Aguardando Recibo","Finalizado")
		status_followup = Array("Atenção","Atrasado","Realizado","Não Realizado","Não Aplicável","No Prazo")
		status_bordero  = Array("À Imprimir","Impresso","Revisado")
		tipo_canal      = Array("Vermelho","Amarelo","Verde","Cinza","Aguardando","Verde Bloqueado","Todos","Laranja")
		tipo_pedido     = Array("Indent","NB","Amostra","Intercompany","Outros Fornecedores","Rótulos","Revenda","Jundiaí","Matéria-Prima", "Ativo Fixo","Consumo","","","","Industrialização/Comercializ.","","","","Manutenção Máquinas e Equip.")
		tipo_periodo    = Array("Dias","Meses")
		nm_tp_quebra    = Array("Grupo de Empresas","Empresa","Modalidade","Área","Empresa Estrangeira","Exportador/Fornecedor")
		tipo_referencia = Array("PEDIDO","ORDEM","REMESSA","OUTROS","BOOKING","SEEK","SAP USA","EMBARQUE","COURRIER","ATO CONCESSÓRIO","SAP TM","Cotação","Número do Lote","BOOKING CO-LOADER","MAPA","PROTOCOLO BB","RECOPI","PROTOCOLO FORM A","MAIN LEG.","CORREIOS","FATURA","Carta de Crédito","Pedido de Embarque","SAT","OIC","CONJUGADO","CERTIFICADO CONFORMI","CORREIOS","CORREIOS FRONTEIRA","GSDB FABRICANTE","COURIER HEALTH","NCM","PROTOCOLO","EXPORTADOR","QUALITY CERTIFICATE","EMBARCAR QTDE","EMBARCAR SALDO","DEPOT","COURRIER BANCO","COURRIER VITÓRIA","PARCEIROS","CERTIFICADO OIC"," "," "," ","CATEGORIA","REGIAO","DELIVERY","Chave LPCO","SIMI")
		sim_nao         = Array("Não","Sim")
		tipo_local_doc  = Array("Indaiá","Cliente","Outros")
		tipo_drawback   = Array("Não","Isenção","Suspensão","Intermediário")
		tipo_relatorio  = Array("desemb.","pedido","ambos")
		tipo_pessoa     = Array("Importador","Agente","Transportadora","Banco","Despachante","")
		aFormaPagar     = Array("Gráfica","A Remeter","Fatura","")
		meses  = Array("Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro")
		semana = Array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")        
End Select

tipo_quebra   = Array("CD_GRUPO","CD_CLIENTE","CD_VIA_TRANSPORTE","CD_AREA","CD_IMPORTADOR","CD_FORNECEDOR")
tipo_frete    = Array("Collect","Prepaid")
tipo_cntr     = Array("PIER","CNTR 20'DRY","CNTR 40'DRY","TANK 20'","TANK 40'","REFFER","20'REEFER","40'REEFER","20'OPEN TOP","40'OPEN TOP","40'HC","40'HC REEFER","FR 40","FR 20","40'OH","20´OTC","20'OTS","FT20'","FT40'","MF 40","CAMINHÃO SECO","CAMINHÃO CLIMATIZADO","CAMINHÃO REFRIGERADO","CAMINHÃO SIDER")
tipo_lang     = Array("Português","English","Español")
tipo_exibir   = Array("Admins","Interno","Cliente","Outros")
tipo_follow   = Array("Desembaraço","PO","Item PO")
tipo_consulta = Array("tabela","lookup","array","calculo")
tipo_dado     = Array("string","data","decimal","moeda","inteiro","text")
logo_saint    = Array("Carborundum","Norton","SG Abrasives","Winter")
aTipoOrdem    = Array("ASC","DESC")
aViaTransp    = Array("Marítima","Fluvial","Lacustre","Aérea","Postal","Ferroviária","Rodoviária","Tubo-Conduto","Meios Próprios","","","By Sea")
aTpProduto    = Array("Importação", "Exportação", "Importação - Logistica Internacional","","","Administração de Pedido de Importação","Ajuste Sistema Entreposto","", "","Exportação - Logistica Internacional", "", "", "Nacionalização de Entreposto","", "Draw-Back")                               

nr_reg_pagina = 30 'numero de linhas padrão no resultado do relatório
tx_soma_custo = "0377;0378;0379;0380;0381;0382;0383;0384;0385;0386;0387;0388;0389;0390;0391;0392;0393;0394;0395;0396;0397;0398;0399;0400;0401;0402;0403;0404;0405;0406;0407;0416;0433;0437;0438;0439;0440;0441;0442;0443;0444;0445;0446;0447;0448;0449;0450;0451;0452;0453;0454;0455;0464;0465;0466;0534;0535;0536;0537;"
tx_pesquisa = "0003;0014;0018;0019;0045;0046;0086;0100;0101;0117;0123;0130;0131;0141;0159;0225;0283;0303;0374;0548;"

Session("sql_pagina") = Session("sql_pagina") &"cd_cargo   = "& Session("cd_cargo") &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"cd_usuario = "& Session("cd_usuario") &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"ap_usuario = "& Session("ap_usuario") &"<br>"

'::::: PROCEDURES :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Sub sub_AbreConexao(servidor, database, usuario, password)
	'rotina para conexão com banco de dados SQL Server
	Dim cnstr 'string de conexão
	
	Set objcnn = Server.CreateObject("ADODB.Connection")
	Set objcmd = Server.CreateObject("ADODB.Command")
	Set objrs  = Server.CreateObject("ADODB.Recordset")
	Set objrsx = Server.CreateObject("ADODB.Recordset")
	Set objrsv = Server.CreateObject("ADODB.Recordset")
	Set objrsf = Server.CreateObject("ADODB.Recordset")
	Set objrsy = Server.CreateObject("ADODB.Recordset")

	
'	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
'					"Data Source="&servidor&";Initial Catalog="&database&";"&_
'					"User ID="&usuario&";Password="&password&";"
'	objcnn.Open cnstr
	objcnn.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	objcmd.ActiveConnection = objcnn
End Sub

Sub sub_FechaConexao()
  'rotina para fechamento do banco de dados
  if not objrs is nothing then
		if objrs.State  = adStateOpen then objrs.Close
		set objrs = nothing
	end if
	if not objrsx is nothing then
  	if objrsx.State = adStateOpen then objrsx.Close
		set objrsx = nothing
	end if
	if not objrsv is nothing then
  	if objrsv.State = adStateOpen then objrsv.Close
		set objrsv = nothing
	end if
	if not objrsf is nothing then
  	if objrsf.State = adStateOpen then objrsf.Close
		set objrsf = nothing
	end if
	if not objrsy is nothing then
  	if objrsy.State = adStateOpen then objrsy.Close
		set objrsy = nothing
	end if
	if not objcnn is nothing then
  	if objcnn.State = adStateOpen then objcnn.Close
		set objcnn = nothing
	end if
End Sub

Sub sub_MessageBox(texto)
'OBJETIVO: 
'PARAMETROS:
  Response.Write("<script language='Javascript' type='text/javascript'>")
  Response.Write("  alert('"& texto &"');")
  Response.Write("</script>")
End Sub

Sub sub_InsereValorNull(cd_menu, cd_subm, cd_campo, tb_campo, nm_campo)
'OBJETIVO: seta para null o campo evento
'PARAMETROS: cd_menu  -> código do menu
'            cd_subm  -> código do sub-menu
'            cd_campo -> código do campo
'            tb_campo -> tabela do campo
'            nm_campo -> nome do campo que receberá o valor nulo

	If fnc_TestaVar(tb_campo) or fnc_TestaVar(nm_campo) Then
		'atualiza tabelas com chave primaria cd_menu
		If fnc_TestaVar(cd_menu) Then
			sql = "UPDATE "& tb_campo &" " &_
						"SET "& nm_campo &" = NULL " &_
						"WHERE "& Left(tb_campo, 3) &"_CD_MENU  = '"& cd_menu  &"' "
		End If
		'atualiza tabelas com chave primaria cd_menu, cd_subm
		If fnc_TestaVar(cd_menu) and fnc_TestaVar(cd_subm) Then
			sql = "UPDATE "& tb_campo &" " &_
						"SET "& nm_campo &" = NULL " &_
						"WHERE "& Left(tb_campo, 3) &"_CD_MENU  = '"& cd_menu  &"' " &_
						"  AND "& Left(tb_campo, 3) &"_CD_SUBM  = '"& cd_subm  &"' "
		End If
		'atualiza tabelas com chave primaria cd_menu, cd_subm e cd(tabela)
		If fnc_TestaVar(cd_menu) and fnc_TestaVar(cd_subm) and fnc_TestaVar(cd_campo) Then
			sql = "UPDATE "& tb_campo &" " &_
						"SET "& nm_campo &" = NULL " &_
						"WHERE "& Left(tb_campo, 3) &"_CD_MENU  = '"& cd_menu  &"' " &_
						"  AND "& Left(tb_campo, 3) &"_CD_SUBM  = '"& cd_subm  &"' " &_
						"  AND "& Left(tb_campo, 3) &"_CD_"& Right(tb_campo, Len(tb_campo)-4) &" = '"& cd_campo &"' "
		End If
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		
		If Err.Number <> 0 Then tx_erro = "Não foi possivel atualizar o campo com um valor Null.\n"& Err.Description
	Else
		tx_erro = "Para atualizar um campo com valor nulo é necessário que informe o nome da tabela e o campo que será nulo."
	End If	
End Sub

Sub sub_AtivaRegistro(cd_codigo, tb_campo, in_ativo)
'OBJETIVO: ativa/desativa a exibição do campo na personalização
'PARAMETROS: cd_menu  -> código do menu
'            cd_subm  -> código do sub-menu
'            cd_dado  -> código do campo
'            tb_campo -> tabela do campo
'            in_ativo -> estado atual do registro(0:Inativo; 1:Ativo)
  If in_ativo Then x = 0 Else x = 1
  
  If fnc_TestaVar(cd_codigo) and fnc_TestaVar(tb_campo) Then
    Select Case Left(tb_campo, 3)
			Case "M01" 'ativa registros com chave primaria cd_menu
				sql = "UPDATE "& tb_campo &" SET "& Left(tb_campo, 3) &"_IN_ATIVO = "& x &" " &_
							" WHERE "& Left(tb_campo, 3) &"_CD_MENU  = '"& cd_codigo &"'"
			Case "M02" 'ativa registros com chave primaria cd_menu, cd_subm
				sql = "UPDATE "& tb_campo &" SET "& Left(tb_campo, 3) &"_IN_ATIVO = "& x &" " &_
							" WHERE "& Left(tb_campo, 3) &"_CD_MENU"& Left(tb_campo, 3) &"_CD_SUBM  = '"& cd_codigo &"'"
			Case "M10" 'ativa registros com chave primaria cd_dado
				sql = "UPDATE "& tb_campo &" SET "& Left(tb_campo, 3) &"_IN_ATIVO = "& x &" " &_
							" WHERE "& Left(tb_campo, 3) &"_CD_DADO = '"& cd_codigo &"'"
			Case Else 'ativa registros com chave primaria cd_menu, cd_subm e cd(tabela)
				sql = "UPDATE "& tb_campo &" SET "& Left(tb_campo, 3) &"_IN_ATIVO = "& x &" " &_
							" WHERE "& Left(tb_campo, 3) &"_CD_"& Right(tb_campo, Len(tb_campo)-4) &" = '"& cd_codigo &"'"
		End Select
		'Response.Write(sql &"<br>")
		objcnn.Execute(sql)
		
		If Err.Number <> 0 Then
			tx_erro = "Não foi possivel ativar/desativar o registro.\n"& Err.Description
		Else
			tx_erro = "Para ativar/desativar um registro é necessário informar o nome da tabela"
		End If
  End If	
End Sub

Sub sub_ErroEnviaMail()
'OBJETIVO: procedimento que envia um e-mail ao administrador caso ocorram erros no site
'PARAMETROS: -
  Dim tx_remete, tx_recebe, tx_assunto, tx_mensagem
  
  tx_remete  = Session("nm_email")
  tx_recebe  = ERROEMAIL
  tx_assunto = ERROASSUNTO &"["& nm_subm &" "& nm_menu &"]"
  'cria a mensagem com a descrição do erro ocorrido
  tx_mensagem = "<p>"&_
    "Ocorrido em: "& FormatDateTime( Now(), 0 )           &"<br>"&_
		"Número     : "& Server.HTMLEncode( err.Number )      &"<br>"&_
		"Descrição  : "& Server.HTMLEncode( err.Description ) &"<br>"&_
		"Fonte      : "& Server.HTMLEncode( err.Source )      &"<br>"&_
		"IP do erro : "& Server.HTMLEncode( Request.ServerVariables("REMOTE_ADDR") )     &"<br>"&_
 		"Navegador  : "& Server.HTMLEncode( Request.ServerVariables("HTTP_USER_AGENT") ) &"<br>"&_
		"Página     : "& Server.HTMLEncode( Request.ServerVariables("SCRIPT_NAME") )     &"<br>"&_
		"</p><p>Instruções SQL:<br>"& Session("sql_pagina") &"</p>"
	
	tx_erro = tx_lang_A00002(cd_lang) &":\n "& tx_lang_C00001(cd_lang) &"\n "
	If fnc_EnviaMail(tx_remete, tx_recebe, Null, Null, tx_assunto, tx_mensagem, 1, True) Then
		tx_erro = tx_erro & tx_lang_C00002(cd_lang) &"."
	Else
		tx_erro = tx_erro & tx_lang_C00002(cd_lang) &"."
	End If
End Sub

Sub sub_EventoLimitador(cd_evento, nr_dias)
'OBJETIVO: Define os eventos limitadores através dos filtros ou personalização
'PARAMETROS: cd_evento -> código do evento padrão, caso não seja definido na personalização
'            nr_dias   -> numero de dias, caso não seja definido na personalização
End Sub

'::::: FUNCTIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Function fcn_Saudacao(tx_nome)
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
	Select Case Hour(Now)
		Case 1,2,3,4,5,6,7,8,9,10,11
			vReturn = tx_lang_A00060(cd_lang)
		Case 12,13,14,15,16,17
			vReturn = tx_lang_A00061(cd_lang)
		Case Else
			vReturn = tx_lang_A00062(cd_lang)
	End Select
	
	vReturn = vReturn &", <b>"& tx_nome &"</b> - "
	
	Select Case cd_lang
		Case 1
			vReturn = vReturn &	semana(WeekDay(Date)-1) &", "& meses(Month(Date)-1) &" "& Day(Date) &", "& Year(Date)
		Case Else
			vReturn = vReturn & semana(WeekDay(Date)-1) &", "& Day(Date) &" de "& meses(Month(Date)-1) &" de "& Year(Date)
	End Select
	fcn_Saudacao = vReturn
End Function

Function fcn_TrocaFundo()
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
  Dim fundo(4), f
  
  fundo(1) = "/imagens/fundo_04.jpg"
  fundo(2) = "/imagens/fundo_04.jpg"
  fundo(3) = "/imagens/fundo_04.jpg"
  fundo(4) = "/imagens/fundo_04.jpg"
  
  Randomize
  f = Int(4 * rnd + 1)
  
  'Response.write Session("importador_valido")
  'Response.end
  If Session("importador_valido") <> 1 Then
  	fcn_TrocaFundo = fundo(f) 
  Else
 	 fcn_TrocaFundo = "/imagens/fundo_" & Session("grupo_imagem") & ".jpg"
  End If	
End Function

Function fcn_TrocaFundo2()
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
  Dim fundo(4), f
  
  fundo(1) = "/imagens/fundo_04.jpg"
  fundo(2) = "/imagens/fundo_04.jpg"
  fundo(3) = "/imagens/fundo_04.jpg"
  fundo(4) = "/imagens/fundo_04.jpg"
  
  Randomize
  f = Int(4 * rnd + 1)
  
  'Response.write Session("importador_valido")
  'Response.end
  If Session("importador_valido") <> 1 Then
  	fcn_TrocaFundo2 = fundo(f) 
  Else
 	 fcn_TrocaFundo2 = "/imagens/fundo_" & Session("grupo_imagem") & "_2.jpg"
  End If	
End Function

Function fcn_PropArquivo(script_name, tp_propiedade)
'OBJETIVO: pega informações do arquivo depentendo da proriedade requisitada
'PARAMETROS: script_name(string)  -> nome do arquivo
'            propriedade(integer) -> tipo da proriedade do arquivo 
'RETORNA: o valor da propriedade requisitada
  Dim objfs, objfile, return

  'cria o objeto do sistema de arquivos e faz ligação com o arquivo
  Set objfs = CreateObject("Scripting.FileSystemObject")
  Set objfile = objfs.GetFile(Server.MapPath(script_name))
  
  Select Case tp_propiedade
  	Case 0
	  	'pega a data de criação do arquivo
	  	return = CStr(FormatDateTime(objfile.DateCreated, 2))
		Case 1
	  	'pega a data da ultima modificação do arquivo
	  	return = CStr(FormatDateTime(objfile.DateLastModified, 2))
		Case 2
	  	'pega a data do ultimo acesso ao arquivo
	  	return = CStr(FormatDateTime(objfile.DateLastAccessed, 2))
		Case 3
	  	'retorna o tamanho do arquivo
	  	return = objfile.Size
		Case 4
	  	'retorna a descrição do tipo de arquivo
	  	return = objfile.Type
  End Select

  Set objfile = Nothing
  Set objfs   = Nothing

  fcn_PropArquivo = return
End Function

Function fnc_AddZeros(codigo, tamanho)
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
  If fnc_TestaVar(codigo) Then codigo = Trim(codigo)
  codigo = String(tamanho - Len(codigo), "0") & codigo
  fnc_AddZeros = codigo
End Function

Function fnc_CheckImg(in_check)
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
  Dim imagem
  If in_check Then imagem = "check" Else imagem = "uncheck"
  fnc_CheckImg = imagem
End Function

Function fnc_TestaVar(variavel)
'OBJETIVO: testa se a variavel é nula, vazia ou não foi iniciada
'PARAMETROS: variavel -> qualquer dado, Variant
'RETORNA: true se a variavel existir, false para erro
  Dim return
  
  If IsNull(variavel) Then
  	return = False
  ElseIf IsEmpty(variavel) Then
  	return = False
  ElseIf Trim(variavel) = "" Then
  	return = False
  Else
    return = True
  End If
  
  fnc_TestaVar = return
End Function

Function fnc_DiasUteisKPI(dt_inicial, dt_final, in_util)
'OBJETIVO: esta função calcula a diferenca de dias entre datas, contando somente dias uteis ou não
'PARAMETROS: dt_ini  -> data inicial/prevista
'            dt_fim  -> data final/de realização
'            in_util -> conta dias uteis(1) ou dias corridos(0)
'RETORNA: diferença de dias
	'verifica se foi passado valor para dias uteis
	If Not fnc_TestaVar(in_util) Then in_util = "0"
	'se as datas forem validas executa calculo

	Dim objcnn2, objcmd2
	Set objcnn2 = Server.CreateObject("ADODB.Connection")
	Set objcmd2 = Server.CreateObject("ADODB.Command")
	objcnn2.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	objcmd2.ActiveConnection = objcnn2
	Dim nr_dia  'diferença de dias
	'verifica se foi passado valor para dias uteis
	If Not fnc_TestaVar(in_util) Then in_util = "0"
	'se as datas forem validas executa calculo

  If IsDate(dt_inicial) and IsDate(dt_final) Then
		With objcmd2
			.CommandTimeOut = 9999
			.CommandText    = "sp_calc_dias_uteis_kpi"
			.CommandType    = adCmdStoredProc
			.Parameters.Refresh
			.Parameters("@tp_dia") = in_util
			.Parameters("@dt_ini") = dt_inicial
			.Parameters("@dt_fim") = dt_final
			.Execute , , adExecuteNoRecords
			nr_dia = .Parameters("@nr_dia")
		End With
	Else
		nr_dia = Null
	End If
	

	'Response.write nr_dia & "<br>"
	'Response.end
	fnc_DiasUteisKPI = nr_dia
End Function

Function fnc_Mascara(dado, tipo)
'OBJETIVO: formatar um dado para ser exibito na tela
'PARAMETROS: dado -> uma string, data, numero ou objeto
'			 tipo -> tipo do dado enviado
'RETORNA: o dado com a máscara correspondente ao tipo
	Dim return
	Dim fdia, fmes, fano
	Dim fhor, fmin, fsec
	
	If fnc_TestaVar(dado) Then
		dado = Trim(dado)
		Select Case tipo
			Case 0 'Contêiner
				return = Left(dado, 4) &"-"& Mid(dado, 5, 3) &"-"& Mid(dado, 8, 3) &"-"& Right(dado, 1)
			Case 1 'LI/DI/DA/DTA
				return = Left(dado, 2) &"/"& Mid(dado, 3, 7) &"-"& Right(dado, 1)
			Case 2 'RE
        return = Left(dado, 2) &"/"& Mid(dado, 3, 7) &"-"& Mid(dado, 10, 3)
			Case 3 'DDE
				return = Left(dado, 10) &"-"& Mid(dado, 11, Len(dado))
			Case 4 'Viagem
				return = Left(dado, 2) &"/"& Mid(dado, 3, Len(dado))
			Case 5 'Data
				If IsDate(dado) Then
					fdia = fnc_AddZeros(Day(dado), 2)
					fmes = fnc_AddZeros(Month(dado), 2)
					fano = fnc_AddZeros(Year(dado), 4)
					'formata data para exibição na tela
					return = fdia &"/"& fmes &"/"& fano
				Else
					If Len(dado) = 8 then
						fdia = Left(dado, 2)
						fmes = Mid(dado, 3, 2)
						fano = Right(dado, 4)
						'formata data para exibição na tela
						return = fdia &"/"& fmes &"/"& fano
					End If
					If Len(dado) = 10 then
						fdia = Left(dado, 2)
						fmes = Mid(dado, 4, 2)
						fano = Right(dado, 4)
						'formata data para exibição na tela
						return = fdia &"/"& fmes &"/"& fano
					End If
					if not IsDate(return) then return = dado
				End If
			Case 6 'CNPJ
				If Len(dado) < 14 Then dado = fnc_AddZeros(dado, 14)
				return = Mid(dado, 1, 2) &"."& Mid(dado, 3, 3) &"."& Mid(dado, 6, 3) &"/"& Mid(dado, 9, 4) &"-"& Mid(dado, 13, 2)
			Case 7 'hora
				if IsDate(dado) then
					fhor = fnc_AddZeros(Hour(dado), 2)
					fmin = fnc_AddZeros(Minute(dado), 2)
					fsec = fnc_AddZeros(Second(dado), 2)
					'formata hora para exibição na tela
					return = fhor &":"& fmin &":"& fsec
				else
					return = dado
				end if
			Case 8
				If Len(dado) = 7 then
					'fdia = Left(dado, 2)
					fmes = Mid(dado, 1, 2)
					fano = Right(dado, 4)
					'formata data para exibição na tela
					return = fmes &"/"& fano
				End If
		    Case 9 'Data NOTA FISCAL
				If IsDate(dado) Then
					fdia = fnc_AddZeros(Day(dado), 2)
					fmes = fnc_AddZeros(Month(dado), 2)
					fano = Right(fnc_AddZeros(Year(dado), 4),2)
					'formata data para exibição na tela
					return = fdia &"/"& fmes &"/"& fano
				Else
					If Len(dado) = 8 then
						fdia = Left(dado, 2)
						fmes = Mid(dado, 3, 2)
						fano = Right(Right(dado, 4),2)
						'formata data para exibição na tela
						return = fdia &"/"& fmes &"/"& fano
					End If
					If Len(dado) = 10 then
						fdia = Left(dado, 2)
						fmes = Mid(dado, 4, 2)
						fano = Right(Right(dado, 4),2)
						'formata data para exibição na tela
						return = fdia &"/"& fmes &"/"& fano
					End If
					if not IsDate(return) then return = dado
				End If
			Case Else
				return = dado
		End Select
	End If
	
	fnc_Mascara = return
End Function

Function fnc_MascaraASP(tx_dado, tx_mask, tx_blank, in_right)
'OBJETIVO: Colocar formatação de mascara em campos como CEP, CNPJ, CPF, etc
'PARAMETROS: tx_dado  -> dado a ser formatado com a mascara
'            tx_mask  -> mascara a ser implementada no dado
'            tx_blank -> caracter a ser colocado para preencher espaços a esquerda/direita
'            in_right -> se true, adiciona espaços a direita, false, adiciona a esquerda
'RETORNA: o dado formatado com a mascara
	Dim mascara 'auxiliar para guardar a string da mascara
	Dim qtdetxt 'qtde de caracteres do dado sem a mascara
	Dim txtmask()
	Dim posmask()
	Dim dadmask()
	
	'verifica se as variveis passadas a função são validas
	If fnc_TestaVar(tx_dado) and fnc_TestaVar(tx_mask) and Len(tx_blank) = 1 Then
		mascara = tx_mask
		'qtde de caracteres do dado sem a mascara
		qtdetxt = 0
		For x = 1 To Len(tx_mask) Step 1
			If Mid(mascara, x, 1) = "0" Then qtdetxt = qtdetxt + 1
		Next
		'se a qtde de caracters for maior que o tamanho de tx_dado, adciona o caracter blank no inicio
		If qtdetxt > Len(tx_dado) Then
			If in_rigth Then
				tx_dado = tx_dado & String(qtdetxt - Len(tx_dado), tx_blank)
			Else
				tx_dado = String(qtdetxt - Len(tx_dado), tx_blank) & tx_dado
			End If
		End If
		
		w = -1 'tamanho inicial dos arrays que gurdam posição e texto da mascara
		y = 0 '
		Do While Len(mascara) > 0
			'Response.Write("mascara = "& mascara &"<br>")
			If InStr(mascara, "0") > 1 Then
				w = w + 1 'incrementa 1 ao tamanho dos arrays
				'redimensiona o tamanho dos arrays
				Redim Preserve txtmask(w)
				Redim Preserve posmask(w)
				Redim Preserve dadmask(w)
				
				txtmask(w) = Left(mascara, 1)
				posmask(w) = InStr(tx_mask, txtmask(w))				
				dadmask(w) = y
				y = 0
			Else
				y = y + 1
				'Response.Write("y = "& y &"<br>")
			End If
			mascara = Right(mascara, Len(mascara)-1)
		Loop
		
		vReturn = ""
		For x = 0 To w Step 1
			If posmask(x) = 1 Then
				vReturn = txtmask(x)
			Else
				vReturn = vReturn & Left(tx_dado, dadmask(x)) & txtmask(x)
			End If
			tx_dado = Right(tx_dado, Len(tx_dado)-dadmask(x))
		Next
		vReturn = vReturn & tx_dado
	Else
		vReturn = Null
	End If
	
	fnc_MascaraASP = vReturn
End Function

Function fnc_ConvertToExcel(var, tipo, decimal)
'OBJETIVO: recebe uma variavel e o seu tipo e retorna ela no formato para leitura no Excel
'PARAMETROS: var     -> variavel do tipo variante com o dado a ser transformado
'			 tipo    -> tipo em que a variavel irá ser transformada
'			 dicimal -> se for dado numerico a quantidade de casas decimais
'RETORNA: true se a variavel existir, false para erro
	Dim return
	
	If fnc_TestaVar(var) Then
		Select Case tipo
			Case 0 'Inteiro
				If IsNumeric(var) Then
					return = CLng(var)
				Else
					return = var
				End If
			Case 1 'Decimal
				If IsNumeric(var) Then
					return = FormatNumber(CDbl(var), decimal)
					return = Replace(return, ".", "")
					return = Replace(return, ",", ".")
				Else
					return = var
				End If
			Case 2 'Moeda
				If IsNumeric(var) Then
					return = FormatNumber(CCur(var), decimal)
					return = Replace(return, ".", "")
					return = Replace(return, ",", ".")
				Else
					return = var
				End If
			Case 3 'Data
				If IsDate(var) Then
					'a data no excel é contada a partir de 01/01/1900
					var = CDate(var) 'converte para data
					If Year(var) = 1900 and (Month(var) = 1 or Month(var) = 2) Then
						return = DateDiff("d", "01/01/1900", var) + 1
					Else
						return = DateDiff("d", "01/01/1900", var) + 2
					End If
			
					If return < 1 Then return = 1
				Else
					return = var
				End If
			Case 4 'Hora
				If IsDate(var) Then
					return = var
				Else
					return = var
				End If
			Case Else 'não definido ou texto
				return = var
		End Select
	Else
		return = var
	End If
	
	fnc_ConvertToExcel = return
End Function

Function fnc_ConsultaLookup(tabela, codigo, valor, retorno)
'OBJETIVO: 
'PARAMETROS:
'RETORNA:
  Dim objrslook 'objeto de armazenamento de resultados de sql 
  Dim descricao 'campo que armazena o valor de retorno
  
  'trata erros
  If Not fnc_TestaVar(tabela) Then
    'sub_MessageBox("Não foi informado o NOME DA TABELA para realizar a consulta.")
		Exit Function
  End If
  If Not fnc_TestaVar(codigo) Then
    'sub_MessageBox("Não foi informado o NOME DO CÓDIGO para realizar a consulta.")
		Exit Function
  End If
  If Not fnc_TestaVar(valor) Then
    'sub_MessageBox("Não foi informado o VALOR DO CÓDIGO para realizar a consulta.")
		Exit Function
  End If
  If Not fnc_TestaVar(retorno) Then
    'sub_MessageBox("Não foi informado o CAMPO DE RETORNO para realizar a consulta.")
		Exit Function
  End If
  
  Set objrslook = Server.CreateObject("ADODB.Recordset")
  
  If objrslook.State = adStateOpen Then objrslook.Close
  
  sql = "SELECT "& retorno &" "&_
				"FROM "& tabela &" ( NOLOCK ) "&_
				"WHERE "& codigo &" = '"& valor &"'"
  'Response.Write(sql &"<br>")
  objrslook.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

  If objrslook.RecordCount > 0 Then
    descricao = Trim(objrslook.Fields.Item(retorno).Value)
  Else
    descricao = "N/A"
  End If
  
  objrslook.Close()
  Set objrslook = Nothing
  
  fnc_ConsultaLookup = descricao
End Function

Function fnc_ValidaEmail(tx_email)
'OBJETIVO: função para ferificar se o endereço de e-mail é valido
'PARAMETROS: str_email(string) -> recebe o endereço de e-mail
'RETORNA: Boolean (e-mail verdaderiro ou falso)
  Dim return

  return = True		

  If (Len(tx_email) < 5) or (Not fnc_TestaVar(tx_email)) Then
    return = False
  Else
		If Instr(1, tx_email, " ") <> 0 Then
      return = False
    Else
      If InStr(1, tx_email, "@", 1) < 2 Then    
	    	return = False
	  	Else
        If InStrRev(tx_email, ".") < InStr(1, tx_email, "@", 1) + 2 Then return = False
	  	End If
    End If
  End If
   
  fnc_ValidaEmail = return
End Function

Function fnc_verificaMask(tx_filtros_aux)
dim var_aux

	while len(tx_filtros_aux) > 0
 		if InStr(1,"abcdefghijlmnopqrstuvxzwykçABCDEFGHIJLMNOPQRSTUVXZWYKÇ0123456789",Left(tx_filtros_aux,1)) then
		var_aux = var_aux & Left(tx_filtros_aux,1)
		end if
		tx_filtros_aux = Right(tx_filtros_aux, len(tx_filtros_aux) - 1)	
	wend

fnc_verificaMask = var_aux 
'response.write tx_filtros_aux
'response.end
End function

Function fnc_mascaraValor(tx_filtros_aux)
dim var_aux
dim v_final
v_final = 0

	while len(tx_filtros_aux) > 0
 		if InStr(1,"0123456789,.",Right(tx_filtros_aux,1)) then
			If InStr(1,",.",Right(tx_filtros_aux,1)) Then
				If InStr(1,",.",Right(tx_filtros_aux,1)) and v_final <> 1 Then
					var_aux = Replace(Right(tx_filtros_aux,1),",",".") & var_aux 
					v_final = 1
				Else
					If InStr(1,",",Right(tx_filtros_aux,1)) Then
					var_aux = Replace(Right(tx_filtros_aux,1),",","") & var_aux 
					Else
					var_aux = Replace(Right(tx_filtros_aux,1),".","") & var_aux 
					End iF
				End if
			Else
				var_aux = Right(tx_filtros_aux,1)& var_aux 	
			End If
		end if
		tx_filtros_aux = Left(tx_filtros_aux, len(tx_filtros_aux) - 1)	
	wend

fnc_mascaraValor = var_aux 
'response.write tx_filtros_aux
'response.end
End function

Function fnc_EnviaMail(tx_remete, tx_recebe, tx_copia, tx_oculta, tx_assunto, tx_mensagem, tp_prior, tp_body)
'OBJETIVO: função para enviar e-mail utilizando ASPMAIL
'PARAMETROS:
'RETORNA:
  Dim new_mail 'objeto para criação e envio de email.
  Dim return   'retorno da função
  Dim str_erro 'erros encontrados na função
	Dim array_para
	Dim array_copia
	Dim array_oculta
  Set new_mail = Server.CreateObject("Persits.MailSender")
	
  str_erro = ""
  return   = False
  'servidor de e-mail smtp/host
  new_mail.Host = "mail.indaialogistica.com.br"
  'remetente/e-mail de resposta
  If fnc_ValidaEmail(tx_remete) Then
		new_mail.From = tx_remete
		new_mail.AddReplyTo(tx_remete)
  Else
    str_erro = "\n"& tx_lang_C00004(cd_lang) &"."
  End If
  'destinatário
  If fnc_ValidaEmail(tx_recebe) Then
    array_para   = Split(tx_recebe,";")
		For x = 0 to Ubound(array_para)
			If fnc_ValidaEmail(array_para(x)) Then new_mail.AddAddress(array_para(x))
		Next
  Else
    str_erro = "\n"& tx_lang_C00005(cd_lang) &"."
  End If
  'cópia
	If fnc_TestaVar(tx_copia) Then
		array_copia  = Split(tx_copia,";")
		For x = 0 to Ubound(array_copia)
			If fnc_ValidaEmail(array_copia(x)) Then new_mail.AddCc(array_copia(x))
		Next
	End If
	'cópia oculta
	If fnc_TestaVar(tx_oculta) Then
		array_oculta = Split(tx_oculta,";")
		For x = 0 to Ubound(array_oculta)
			If fnc_ValidaEmail(array_oculta(x)) Then new_mail.AddBcc(array_oculta(x))
		Next
	End If
  'assunto do e-mail
  If fnc_TestaVar(tx_assunto) Then
    new_mail.Subject = tx_assunto
  Else
    str_erro = "\n"& tx_lang_C00006(cd_lang) &"."
  End If
  'corpo do e-mail
  If fnc_TestaVar(tx_mensagem) Then
    new_mail.Body = tx_mensagem
  Else
    str_erro = "\n"& tx_lang_C00007(cd_lang) &"."
  End If
  If fnc_TestaVar(tp_prior) Then new_mail.Priority = tp_prior Else new_mail.Priority = 3    'importancia do e-mail (5=baixa, 3=normal, 1=alta)
  If fnc_TestaVar(tp_body)  Then new_mail.IsHTML   = tp_body  Else new_mail.IsHTML   = False 'formato do corpo (True=HTML, False=Texto)
	
  If Len(str_erro) = 0 then
    new_mail.Send
    If Err.Number = 0 Then
	  	return = True
		Else
		Response.Write(Err.Number)
	  	str_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_C00008(cd_lang) &".\n"& tx_lang_A00004(cd_lang) &"(suporte@myindaia.com.br)."
		End If
  End If 

  fnc_EnviaMail = return
  
  Set new_mail = Nothing
End Function

Function fnc_NomeCampoQuebra( agrupar, codigo )
'OBJETIVO: função para enviar e-mail utilizando ASPMAIL
'PARAMETROS: agrupar -> tipo do agrupamento dos dados
'            codigo  -> código do campo que esta agrupando
'RETORNA: nome do campo que esta agrupando
  Dim nm_campo 'nome do campo de retorno
  
  Select Case agrupar
    Case 0
	  nm_campo = fnc_ConsultaLookup("TGRUPO", "CD_GRUPO", codigo, "NM_GRUPO")
	Case 1
	  nm_campo = fnc_ConsultaLookup("TEMPRESA_NAC", "CD_EMPRESA", codigo, "NM_EMPRESA")
	Case 2
	  nm_campo = fnc_ConsultaLookup("TVIA_TRANSPORTE", "CD_VIA_TRANSPORTE", codigo, "NM_VIA_TRANSPORTE")
	Case 3
	  nm_campo = fnc_ConsultaLookup("TAREA", "CD_AREA", codigo, "NM_AREA")
	Case 4  
	  nm_campo = fnc_ConsultaLookup("TEMPRESA_EST", "CD_EMPRESA", codigo, "NM_EMPRESA")	
    Case 5  
	  nm_campo = fnc_ConsultaLookup("TEMPRESA_EST", "CD_EMPRESA", codigo, "NM_EMPRESA") 
  End Select
  
  fnc_NomeCampoQuebra = nm_campo
End Function

Function fnc_QuotedSQL(vl_campo)
'OBJETIVO: inserir aspas em um campo para ser inserido numa tabela
'PARAMETROS: vl_campo -> valor de um campo que necessita de aspas
'RETORNA: o valor com aspas(se não for nulo)
  Dim retorno
  
  If fnc_TestaVar(vl_campo) Then
    retorno = "'"& Trim( vl_campo ) &"'"
  Else
    retorno = "NULL"
  End If
  fnc_QuotedSQL = retorno
End Function

Function fncValSQL(vData, vTipo)
'OBJETIVO: validar a informação 
'PARAMETROS: vData -> 
'            vTipo -> 
'RETORNA: texto com formação para inserir no cmd sql
  vReturn = "NULL"
	if fnc_TestaVar(vData) then
		select case vTipo
			case 0 'char, varchar
				if fnc_TestaVar(vData) then vReturn = "'"& Trim(vData) &"'"
			case 1 'datetime
				if IsDate(vData)       then vReturn = "CONVERT(datetime, '"& Trim(fnc_Mascara(vData, 5)) &"', 103)"
			case 2 'text
				if fnc_TestaVar(vData) then vReturn = "'"& Trim(Replace(vData,"'","´")) &"'"
			case 3 'numero
				if IsNumeric(vData)    then vReturn = Replace(Replace(vData,".",""), ",", ".")
			case else
				if fnc_TestaVar(vData) then vReturn = vData
		end select
	end if
  fncValSQL = vReturn
End Function

Function fnc_CalcNumerario(nr_processo)
'OBJETIVO: recuperar o valor do numerario pago à Indaiá
'PARAMETROS: nr_processo -> processo onde será calculado o numerário
'RETORNA: o valor do numerario recebido
	Dim objrsn
	Dim vl_recebido
	Dim vl_restituido
	Dim vl_numerario

  Set objrsn = Server.CreateObject("ADODB.Recordset")
  
  If objrsn.State = adStateOpen Then objrsn.Close
	sql = "SELECT ISNULL( SUM( F.VL_ITEM ), 0 ) AS VL_ITEM "&_
				"FROM TFATURAMENTO_CC F ( NOLOCK ) "&_
				"WHERE F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
				"  AND F.IN_CANCELADO = 0 "&_
				"  AND F.IN_RESTITUI  = 0 "&_
				"  AND F.IN_FATURADO  = 1 "&_
				"  AND F.CD_ITEM = '991'"
	objrsn.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	vl_recebido = objrsn.Fields.Item("VL_ITEM").Value
	
	If objrsn.State = adStateOpen Then objrsn.Close
	sql = "SELECT ISNULL( SUM( F.VL_ITEM ), 0 ) AS VL_ITEM "&_
				"FROM TFATURAMENTO_CC F ( NOLOCK ) "&_
				"WHERE F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
				"  AND F.IN_CANCELADO = 0 "&_
				"  AND F.IN_RESTITUI  = 1 "&_
				"  AND F.CD_ITEM = '991'"
	objrsn.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	vl_restituido = objrsn.Fields.Item("VL_ITEM").Value
	
	objrsn.Close()
	Set objrsn = Nothing
	'calcula o valor do numerario
	vl_numerario = vl_recebido - vl_restituido
		
	fnc_CalcNumerario = vl_numerario
End Function

Function fnc_NomeTela(cd_menu, cd_subm, cd_docto, cd_view)
'OBJETIVO: Devolve o caminho da tela que o usuário esta
	Dim return
	'nome do menu
	If fnc_TestaVar(cd_menu) Then
		sql = "SELECT M01_NM_MENU FROM M01_MENU (NOLOCK) WHERE M01_CD_MENU = '"& cd_menu &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		return = objrs.Fields.Item("M01_NM_MENU").Value
		objrs.Close
	End If
	'nome do sub-menu
	If fnc_TestaVar(cd_menu) Then
		sql = "SELECT M02_NM_SUBM FROM M02_SUBM (NOLOCK) WHERE M02_CD_MENU+M02_CD_SUBM = '"& cd_menu&cd_subm &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		return = return &" >> "& objrs.Fields.Item("M02_NM_SUBM").Value
		objrs.Close
	End If
	'nome do documento
	If fnc_TestaVar(cd_docto) Then
		sql = "SELECT M08_NM_DOCTO FROM M08_DOCTOS (NOLOCK) WHERE M08_CD_DOCTO = '"& cd_docto &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		return = return &" >> "& objrs.Fields.Item("M08_NM_DOCTO").Value
		objrs.Close
	End If
	'nome da view
	If fnc_TestaVar(cd_view) Then
		sql = "SELECT M06_NM_VIEW FROM M06_VIEW (NOLOCK) WHERE M06_CD_VIEW = '"& cd_view &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		return = return &" >> "& objrs.Fields.Item("M06_NM_VIEW").Value
		objrs.Close
	End If
	
	fnc_NomeTela = return
End Function

function fncTipoPessoaExp(nCodigo, nTipo)
  'OBJETIVO: buscar a descrição do tipo de pessoa exportação(consignee, notify, documentos)
	dim return
	if fnc_TestaVar(nCodigo) and fnc_TestaVar(nTipo) then
		select case nTipo
			case "0","1","2" sql = "SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '"&nCodigo&"'"
			case "3" sql = "SELECT NM_TRANSP_ITL FROM TTRANSP_ITL (NOLOCK) WHERE CD_TRANSP_ITL = '"&nCodigo&"'"
			case "4" sql = "SELECT NM_DESPACHANTE FROM TDESPACHANTE (NOLOCK) WHERE CD_DESPACHANTE = '"&nCodigo&"'"
			case "5" sql = ""
		end select
		'verifica se é possivel realizar a consulta
		if fnc_TestaVar(sql) then
			if objrsx.State = adStateOpen then objrsx.Close()
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			if objrsx.RecordCount > 0 then
				return = objrsx.Fields.Item(0).Value
			else
				return = ""
			end if
			objrsx.Close()
		else
			return = ""
		end if
	else
		return = ""
	end if
	fncTipoPessoaExp = return
end function

function fncDataHoraArquivo()
	'OBJETIVO: retorna a data e hora para montar um nome de arquivo
	vReturn = fnc_AddZeros(Year(Date),4) & fnc_AddZeros(Month(Date),2) & fnc_AddZeros(Day(Date),2) &_
						fnc_AddZeros(Hour(Time),2) & fnc_AddZeros(Minute(Time),2) & fnc_AddZeros(Second(Time),2)
	fncDataHoraArquivo = vReturn
end function

function fncExibeTiposErro(nErros, nTipo)
  'exibir os erros dos fornecimentos
	dim aErros
	dim aTexto
	select case nTipo
		case 0
			aTexto = Array("Moeda FOB","Incoterm","Condição de Pagto.","Não existe nos volumes")
		case 1
			aTexto = Array("Não existe nos fornecimentos","Qtde. menor que o fornecimento","Qtde. maior que o fornecimento")
		case 2
			aTexto = Array("Moeda FOB","Incoterm","Condição de Pagto.","Qtde. Baixada igual a Zero")
	end select
	vReturn = ""
	
	if Right(nErros, 1) = "," then nErros = Left(nErros, Len(nErros)-1)
	if fnc_TestaVar(nErros) then
		aErros = Split(nErros, ",", -1)
		
		for x = 0 to UBound(aErros)
			vReturn = vReturn & aTexto(aErros(x))
			if x <> UBound(aErros) then vReturn = vReturn &", "
		next
	end if
	
	fncExibeTiposErro = vReturn
end function
%>
<!--#include file="inc_dados_padrao.asp"-->