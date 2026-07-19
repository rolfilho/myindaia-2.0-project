<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: Documentos scaneados do processo 
'
'Autor: Alexandre Gonçalves Neto
'Criado: 04/08/2006
'
'Manutenção: 18/03/2008 Flávio Henrique 
'Importador não exibe borderô nem contabilidade
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Site Institucional: Contato
'Arquivo de Script: Envio de e-mail de contato
'Modificado por Alexandre Gonçalves Neto em 03/02/2005
Server.ScriptTimeout = 9999
Dim nm_email, nm_email_from
Dim nm_cc
Dim assunto
Dim msg
Dim flag_arq_expo
Dim flag_arq_impo_des
Dim flag_arq_impo_adm
Dim flag_processo_novo
Dim total_contador
Dim total_contador2
Dim total_contador_while
Dim contador_for, contador_while, contador_for2
Dim texto, texto2, tx_caminho, vModoCompleto, produto_email

texto = ""
texto2 = ""

nm_email = Request.Form("nm_email")
nm_cc = Request.Form("nm_cc")
assunto = Request.Form("nm_assunto")
msg = Request.Form("nm_msg")
flag_arq_expo = Request.Form("flag_arq_expo")
flag_arq_impo_des = Request.Form("flag_arq_impo_des")
flag_arq_impo_adm = Request.Form("flag_arq_impo_adm")
flag_processo_novo = Request.Form("flag_processo_novo")
total_contador = Request.Form("total_contador")
total_contador2 = Request.Form("total_contador2")
total_contador_while = Request.Form("total_contador_while")
nr_processo = Request.QueryString("nr_processo")
produto_email = Request.QueryString("cd_produto")
vModoCompleto = Request.Form("chbCompleto")

cd_menu = "03"
If produto_email = "01" Then cd_view = "0627-0301-01" Else cd_view = "0627-0302-01" End If

in_view_campo = 1
if vModoCompleto = "" Then
    flag_resumo = 1
End if
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/lay_title.asp"-->
<%
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
    fundo_div = "#b4c7db"
    topo_div = "#f0f1f6"
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


vBody = "<html xmlns='http://www.w3.org/1999/xhtml'>"
vBody = vBody & "<head>"
vBody = vBody & "<style>"&_
"body {"&_
"	font-family: Verdana, Arial, Helvetica;"&_
"	color: #000000;"&_
"	background-color: #FFFFFF;"&_
"	margin: 0px;"&_
"	padding: 0px;"&_
"	scrollbar-face-color: #b4c7db;"&_
"	scrollbar-track-color: #b9bfc4;"&_
"	scrollbar-arrow-color: #7089A2;"&_
"	scrollbar-shadow-color: #f0f1f6;"&_
"	scrollbar-3dlight-color: #f0f1f6;"&_
"	scrollbar-highlight-color: #f0f1f6;"&_
"	scrollbar-darkshadow-color: #f0f1f6;"&_
"	overflow:hidden;"&_
"}"&_
"#divInfoCR {"&_
"	background-color:#b4c7db;"&_
"	width:350px;"&_
"	height:130px;"&_
"	position:absolute;"&_
"	border-width:1px;"&_
"	border-color:#336699;"&_
"	border-style:solid;"&_
"	display:none;"&_
"	z-index:3;"&_
"}"&_
"#divInfoCorpoCR{"&_
"	padding-left:10px"&_
"}"&_
".divInfo {"&_
"	position: absolute;"&_
"	top:0px;"&_
"	left:0px;"&_
"	width:0px;"&_
"	height:0px;"&_
"	display: none;"&_
"	z-index: 3;"&_
"	overflow: auto;"&_
"	border: solid 2px #b4c7db;"&_
"	background-color: #f0f1f6;"&_
"}"&_
".divDetalhes {"&_
"	position: absolute;"&_
"	top:0px;"&_
"	left:0px;"&_
"	width:0px;"&_
"	height:0px;"&_
"	z-index: 3;"&_
"	overflow: auto;"&_
"	border: solid 2px #b4c7db;"&_
"	background-color: #f0f1f6;"&_
"}"&_
"a:link, a:visited {"&_
"	color: #000000;"&_
"	font-size: 10pt;"&_
"	text-decoration: none;"&_
"}"&_
"a:active, a:hover {"&_
"	color: #FF0000;"&_
"	font-size: 10pt;"&_
"	text-decoration: none;"&_
"}"&_
".table {"&_
"	background-repeat: no-repeat;"&_
"	background-position: center;"&_
"	border-collapse: separate;"&_
"}"&_
"th {"&_
"  font-size: 10px;"&_
"}"&_
"td {"&_
"	font-size: 10px;"&_
"}"&_
"tr {"&_
"	font-size: 10px;"&_
"}"&_
".light:link, .light:hover, .light:active, .light:visited {"&_
"	color: #FFFFFF;"&_
"}"&_
".botao:link, .botao:visited {"&_
"	color: #FFFFFF;"&_
"}"&_
".botao:active, .botao:hover {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"}"&_
".folder1"&_ 
"{"&_
"    font-size: 10pt;"&_
"	color: #333333;"&_	
"}"&_
".folder_busca"&_ 
"{"&_
"    font-size: 10pt;"&_
"	color: #0066cc;"&_	
"}"&_
".folder_busca:link, .folder1:visited {"&_
"	color: #0066cc;"&_
"	font-weight: bold;"&_
"}"&_
".bottom{"&_
"vertical-align:bottom;"&_
"}"&_
".top{"&_
"vertical-align:top;"&_
"}"&_
".folder1:link, .folder1:visited {"&_
"	color: #333333;"&_
"	font-weight: bold;"&_
"}"&_
".folder2"&_ 
"{"&_
"    font-size: 10pt;"&_
"	cursor: hand;"&_
"}"&_
".titulo {"&_
"	font-size: 14px;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"}"&_
".label {"&_
"	font-weight: bold;"&_
"	cursor: hand;"&_
"	padding: 6 0 0 0;"&_
"}"&_
".dados {"&_
"	padding: 2px;"&_
"}"&_
".editbox {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	height: 18px;"&_
"	border: solid 1px #336699;"&_
"}"&_
".textbox {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	border: solid 1px #336699;"&_
"}"&_
".button {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	font-weight: bold;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	border: solid 1px #333333;"&_
"	cursor: hand;"&_
"}"&_
".select {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	border: solid 1px #333333;"&_
"}"&_
".btnImagem {"&_
"	width: 32px;"&_
"	height: 32px;"&_
"	cursor: hand;"&_
"}"&_
".detcampo {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"	background: #7799CC;"&_
"}"&_
".gridleadtit {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"	background: #335588;"&_
"	border-style: solid;"&_
"	border-color: #335588;"&_
"	border-width: 0px;"&_
"}"&_
".gridleadsub {"&_
"	color: #000000;"&_
"	font-weight: bold;"&_
"	background-color: #D4E6DC;"&_
"}"&_
".titpopup {"&_
"	font-size: 13px;"&_
"	font-style: italic;"&_
"	font-weight: bold;"&_
"}"&_
".ttbpopup {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"	background: #7799CC;"&_
"	border: solid #FFFFFF 0px;"&_
"}"&_
".abadownpopup {"&_
"	color: #000000;"&_
"	text-align: center;"&_
"	font-weight: bold;"&_
"	background: #EEEEEE;"&_
"	border: solid 2px;"&_
"	border-color: #333333 #AAAAAA #AAAAAA #333333;"&_
"}"&_
".abauppopup {"&_
"	color: #000000;"&_
"	text-align: center;"&_
"	font-weight: bold;"&_
"	background: #EEEEEE;"&_
"	border: solid 2px;"&_
"	border-color: #AAAAAA #333333 #333333 #AAAAAA;"&_
"}"&_
".tcppopup {"&_
"	color: #000000;"&_
"	font-weight: bold;"&_
"}"&_
".cl_bold"&_ 
"{"&_
"    color:#000000;"&_
"    font-size:10pt;"&_
"    font-weight:bold;"&_
"    white-space:nowrap;"&_
"}"&_
".cl_bold2"&_ 
"{"&_
"    color:#8fa3d5;"&_
"    font-size:10pt;"&_
"    font-weight:bold;"&_
"    white-space:nowrap;"&_
"}"&_
".cl_bold3"&_ 
"{"&_
"    color:#deb235;"&_
"    font-size:10pt;"&_
"    font-weight:bold;"&_
"    white-space:nowrap;"&_
"}"&_
".divMenuTop {"&_
"	position:absolute;"&_
"	top:86px;"&_
"	left:5px;"&_
"	width:235px;"&_
"	height:100%;"&_
"	z-index:1;"&_
"	overflow:auto;"&_
"	visibility: visible;"&_
"	scrollbar-face-color: #f0e2b4;"&_
"	scrollbar-track-color: #f8ebbf;"&_
"	scrollbar-arrow-color: #dac377;"&_
"	scrollbar-shadow-color: #e7d8a7;"&_
"	scrollbar-3dlight-color: #f5ebc8;"&_
"	scrollbar-highlight-color: #f5ebc8;"&_
"	scrollbar-darkshadow-color: #e7d8a7;"&_
"}"&_
".divMainTop {"&_
"	position:absolute;"&_
"	top:86px;"&_
"	left:250px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainMid {"&_
"	position:absolute;"&_
"	top:133px;"&_
"	left:10px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainMidOrders {"&_
"	position:absolute;"&_
"	top:120px;"&_
"	left:11px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainMidBusca {"&_
"	position:absolute;"&_
"	top:121px;"&_
"	left:11px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainAdm {"&_
"	position:absolute;"&_
"	top:190px;"&_
"	left:10px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainDet {"&_
"	position:absolute;"&_
"	top:86px;"&_
"	left:10px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainQld {"&_
"	position:absolute;"&_
"	top:190px;"&_
"	left:250px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".divMainVie {"&_
"	position:absolute;"&_
"	top:165px;"&_
"	left:10px;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:0;"&_
"	overflow:auto;"&_
"}"&_
".formClass {"&_
"	position:relative;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:1;"&_
"	overflow:auto;"&_
"}"&_
".popupClass {"&_
"	position:relative;"&_
"	width:100%;"&_
"	height:100%;"&_
"	z-index:2;"&_
"	overflow:auto;"&_
"}"&_
".admtit {"&_
"	color: #FFFFFF;"&_
"	font-size: 10px;"&_
"	font-weight: bold;"&_
"	padding: 2px;"&_
"	background: #336699;"&_
"	border-style: solid;"&_
"	border-color: #6699CC #000066 #000066 #6699CC;"&_
"	border-width: 1px;"&_
"	cursor: hand;"&_
"}"&_
".admsub {"&_
"	color: #FFFFFF;"&_
"	font-size: 10px;"&_
"	font-style: italic;"&_
"	padding: 2px;"&_
"	background: #336699;"&_
"	border-style: solid;"&_
"	border-color: #6699CC #000066 #000066 #6699CC;"&_
"	border-width: 1px 1px 1px 1px;"&_
"}"&_
".admcel {"&_
"	font-size: 10px;"&_
"	padding: 2px;"&_
"	background: #FFFFFF;"&_
"	border-style: solid;"&_
"	border-color: #6699CC #000066 #000066 #6699CC;"&_
"	border-width: 0px 0px 0px 1px;"&_
"}"&_
".admcom {"&_
"	font-size: 10px;"&_
"	padding: 2px;"&_
"	border-style: solid;"&_
"	border-color: #6699CC #000066 #000066 #6699CC;"&_
"	border-width: 0px 1px 0px 1px;"&_
"}"&_
".admview {"&_
"	font-size: 10px;"&_
"	padding: 2px;"&_
"	border-style: solid;"&_
"	border-color: #CCCCCC;"&_
"	border-width: 0px 1px 1px 0px;"&_
"}"&_
".admexec {"&_
"   text-align: center;"&_
"	background: #EEEEEE;"&_
"	border-style: solid;"&_
"	border-color: #FFFFFF;"&_
"	border-width: 1px;"&_
"}"&_
".admlink{}"&_
"a.admlink:link, a.admlink:visited {"&_
"	color: #000000;"&_
"	font-size: 10px;"&_
"	text-decoration: none;"&_
"}"&_
"a.admlink:active, a.admlink:hover {"&_
"	color: #000000;"&_
"	font-size: 10px;"&_
"	text-decoration: underline;"&_
"}"&_
".admtitulo {"&_
"	color: #0099FF;"&_
"	font-size: 18px;"&_
"	font-style: italic;"&_
"	font-weight: bold;"&_
"}"&_
".admlabel {"&_
"	font-weight: bold;"&_
"	text-align: right;"&_
"	cursor: hand;"&_
"	padding: 5px;"&_
"	background-color: #EEEEEE;"&_
"}"&_
".admdados {"&_
"	padding: 5px;"&_
"	background-color: #EEEEEE;"&_
"}"&_
".admeditbox {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	height: 18px;"&_
"	border: solid 1px #333333;"&_
"}"&_
".admmemo {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	border: solid 1px #333333;"&_
"}"&_
".admbutton {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	font-weight: bold;"&_
"	background: #FEFEFE;"&_
"	padding: 2px;"&_
"	border: solid 1px #333333;"&_
"	cursor: hand;"&_
"}"&_
".admselect {"&_
"	color: #000000;"&_
"	font-size: 12px;"&_
"	background: #FEFEFE;"&_
"	border: solid 1px #333333;"&_
"}"&_
".gridtop {"&_
"	color: #FFFFFF;"&_
"	font-style: none;"&_
"	font-weight: bold;"&_
"	font-size: 12px;"&_
"	background: #336699;"&_
"	border-style: solid;"&_
"	border-color: #336699;"&_
"	border-width: 0px;"&_
"}"&_
".gridtit {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"	background: #374BAE;"&_
"	border-style: solid;"&_
"	border-color: #b9bfc4;"&_
"	border-width: 1px;"&_
"}"&_
".gridtit3 {"&_
"	color: #000000;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"	background: #E7E101;"&_
"	border-style: solid;"&_
"	border-color: #b9bfc4;"&_
"	border-width: 1px;"&_
"}"&_
".gridtit2 {"&_
"	color: #FFFFFF;"&_
"	font-weight: bold;"&_
"	background: #374BAE;"&_
"	border-style: solid;"&_
"	border-color: #b9bfc4;"&_
"	border-width: 1px;"&_
"}"&_
".gridsub {"&_
"	color: #FFFFFF;"&_
"	background: #374BAE;"&_
"}"&_
".gridtitclick {"&_
"	color: #FFFFFF;"&_
"	cursor: hand;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"	background: #374BAE;"&_
"	border-style: solid;"&_
"	border-color: #b9bfc4;"&_
"	border-width: 1px;"&_
"}"&_
".pgridtop {"&_
"	color: #000000;"&_
"	font-style: italic;"&_
"	font-weight: bold;"&_
"	font-size: 12px;"&_
"	border-style: dotted;"&_
"	border-color: #333333;"&_
"	border-width: 1px 0px 0px 0px;"&_
"}"&_
".pgridtit {"&_
"	color: #000000;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"	border-style: dotted;"&_
"	border-color: #333333;"&_
"	border-width: 1px 0px 0px 0px;"&_
"}"&_
".pgridsub {"&_
"	color: #000000;"&_
"	font-size: 8px;"&_
"	border-style: dotted;"&_
"	border-color: #333333;"&_
"	border-width: 1px 0px 0px 0px;"&_
"}"&_
".pgridtotal {"&_
"	text-align: right;"&_
"	color: #000000;"&_
"	font-size: 9px;"&_
"	border-style: dotted;"&_
"	border-color: #333333;"&_
"	border-width: 1px 0px 0px 0px;"&_
"}"&_
".pgridbottom {"&_
"	color: #000000;"&_
"	font-weight: bold;"&_
"	border-style: dotted;"&_
"	border-color: #333333;"&_
"	border-width: 1px 0px 0px 0px;"&_
"}"&_
".toprelat {"&_
"	color: #FFFFFF;"&_
"	background: #374BAE;"&_
"	border-style: solid;"&_
"	border-color: #374BAE;"&_
"	border-width: 0px;"&_
"	font-weight: bold;"&_
"	text-align: center;"&_
"</style>"
vBody = vBody & "</head>"

if produto_email = "01" Then
'imp
if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 9999
  .CommandText = Session("sql_imp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
If vModoCompleto = "" Then
vBody = vBody & "<body style='overflow:auto;' >"
vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0'>"
vBody = vBody &	"<tr> "
vBody = vBody &	"<td valign='top' height='100%'><table width='100%' border='0' cellspacing='1' cellpadding='1'>"
				
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  cont = 1
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0

								vBody = vBody &	"&nbsp;<font size='2'><b>" & Mid(Request.QueryString("nr_processo"),5,15) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
								vBody = vBody &	"<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 
			Case 1
								vBody = vBody &	"<tr height='0'>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"</tr></table><br />"
                                vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00051(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 								
			Case 2
								vBody = vBody & " <tr height='0'>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "</tr></table><br />"
                                vBody = vBody & " &nbsp;<font size='2'><b>" & tx_lang_A00052(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 
		End Select
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
				vBody = vBody & "<tr bgcolor=" & bgcolor & ">"
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & UCase(Mid(nr_processo, 5, Len(nr_processo))) & "&nbsp;</td>"
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & tipo_canal(x) & "&nbsp;</td>"
		Case "0044"
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" &  str
						
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						vBody = vBody &  "<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>"
					End If
					vBody = vBody & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_VOO").Value & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_CAMINHAO").Value & "</td>"					
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "</td>"
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
						"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
						"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
						"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
							"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
							"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							"  AND I.CD_EMPRESA     = '"& cd_empresa &"' "&_
							"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
								"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				end if
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>" & str_merc & "</td>"
			objrsx.Close
		Case "0097" 'numero da referencia cliente (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0
					If str <> 0 Then str_refs(x) = str_refs(x) &"/"& str
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop
			End If
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & Right(objrsv.Fields.Item("M10_NM_DADO").Value, 11) & "</td>"
					vBody = vBody & "<td style='padding: 0px;'><table width='100%' cellpadding='0' cellspacing='0' border='0'>"
			if objrsx.RecordCount > 0 then
				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						vBody = vBody & "<tr><td width='60' valign='top' style='background-color:" & bg_detalhes_campo & ";'>&nbsp;"& tipo_referencia(x) &"</td>"
						vBody = vBody & "<td>"& str_refs(x) &"</td></tr>"
					End If
				Next
			else
				vBody = vBody & "<tr><td width='60' valign='top' style='background-color:" & bg_detalhes_campo & ";'>&nbsp;Pedido</td>"
				vBody = vBody & "<td>"& nr_referencia&"/"&nr_item_clnte &"</td></tr>"
			end if										
						vBody = vBody & "</table></td>"
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & sim_nao(str) & "&nbsp;</td>"					
	 	Case "0225" 'Nr de LI
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_LI, DT_DEFERIMENTO, DT_VENCTO "&_
						"FROM TPROCESSO_LI (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY DT_VENCTO DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_li = ""
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str_li = str_li & fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1)
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str_li & "</td>"
         Case "0485"
            If objrsx.state = adstateOpen then objrsx.close()
			SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
			" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
			" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
			"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
			If objrsx.eof then
				str="-"
			else
				str= objrsx.fields.item("CONTATO").value
			End If
            vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
			vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str & "</td>"
            objrsx.Close
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & fnc_Mascara(str, 1) & "</td>"
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "&nbsp;</td>"
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & fnc_Mascara( x, 5 ) & "&nbsp;</td>"
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & z & "&nbsp;</td>"
			End Select
	End Select
	If cont = 3 Then
		cont = 1
				vBody = vBody & "</tr>"
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value

objrs.Close

		
								vBody = vBody & "<tr height='0'>"
								vBody = vBody & "<td width='15%'></td>"
								vBody = vBody & "<td width='35%'></td>"
								vBody = vBody & "<td width='15%'></td>"
								vBody = vBody & "<td width='35%'></td>"
								vBody = vBody & "</tr></table><br>"
                                vBody = vBody & "  <nobr>&nbsp;<font size='2'><b>" & tx_lang_A00053(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='260px' border='0' height='3px' align='middle'/></nobr></td>"

vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='0' style='border: solid 1px " & bg_detalhes_borda & ";'>"	

				
'Seleciona os dados do follow-up
If objrs.State = adStateOpen Then objrs.Close
If cd_produto <> "06" Then
	sql = " AND F.NR_PROCESSO_DES = '"& nr_processo &"' "
else
	sql = ""
end if
If Not nr_processo_des_null = 1 Then
If nr_parcial <> "" or  nr_processo_adm_null = 0 Then
    If nr_parcial = "" Then
        If objrs.State = adStateOpen Then objrs.Close
        sql2 = "SELECT NR_PARCIAL, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA "&_ 
	          " FROM TESTAGIO_PROCESSO"&_ 
              " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
              if nr_referencia <> "" Then
                  sql2 = sql2 & " AND NR_REFERENCIA = '" & nr_referencia & "'"&_
                  " AND NR_ITEM_CLIENTE ='" & fnc_AddZeros(nr_item_clnte, 4) & "'"&_
                  " AND CD_EMPRESA = '" & cd_empresa & "'" &_
                  " AND NR_PARCIAL > 0" 
              End If
	    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	    objrs.Open sql2, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        nr_parcial = objrs.Fields.Item("NR_PARCIAL").Value
        nr_referencia = objrs.Fields.Item("NR_REFERENCIA").Value
        nr_item_clnte = objrs.Fields.Item("NR_ITEM_CLIENTE").Value
        cd_empresa = objrs.Fields.Item("CD_EMPRESA").Value
        If objrs.State = adStateOpen Then objrs.Close
    End If   

	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
	
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.TP_FOLLOWUP, F.NR_ORDEM "&_
			"FROM TFLP_ESTAGIO F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
			"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
			"  AND F.CD_EVENTO NOT IN ('022') "&_
			"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
			" ORDER BY F.TP_FOLLOWUP, F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"

    'Response.write sql
    'Response.end

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Else
	sql_parcial = ""
	
	sql = "SELECT F.CD_EVENTO,E."& tx_lang_evento & " AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	      "FROM TFOLLOWUP F ( NOLOCK ) "&_
		  "INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
          "WHERE F.NR_PROCESSO = '"& nr_processo &"' "&_
		  " ORDER BY  F.NR_ORDEM"	
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End if
Else
If Not fnc_testaVar(nr_parcial) Then nr_parcial = "0"
	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
	sql = "SELECT DISTINCT "&_
	"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	"FROM TFLP_PO_ITEM F ( NOLOCK ) "&_
	"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
	"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_PROCESSO = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
	"  AND F.CD_EVENTO NOT IN ('022') "&_
	"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
	" ORDER BY F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End If 

Do While Not objrs.Eof
  If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
	
	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
				z = fnc_DiasUteisKPI(x, y, 0)
			Else
				z = fnc_DiasUteisKPI(x, Date(), 0)
			End If
			'muda a cor do lead-time conforme o resultado
			If z < 0 Then 
				color = "#0000FF" 'azul
			ElseIf z > 0 Then
				z = "+"& z
				color = "#FF0000" 'vermelho
			End If
		End If
	End If
			vBody = vBody & "<tr bgcolor=" & bgcolor & " height='13'>"
			vBody = vBody & "<td>" & objrs.Fields.Item("CD_EVENTO").Value &" - "& objrs.Fields.Item("NM_EVENTO").Value & "</td>"
			vBody = vBody & "<td align='right'><font color="& color &">"& fnc_Mascara(y, 5) &"</font>&nbsp;</td>"
			vBody = vBody & "</tr>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
objrs.Close

		
							vBody = vBody & "</table><br>"
							vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00054(cd_lang) & "</b></font><img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='380px' border='0' height='3px' align='middle'>"
							vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='2' style='border: solid 1px " & bg_detalhes_borda & ";'>"
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS (NOLOCK) WHERE NR_PROCESSO = "
If cd_produto = "06" Then
	sql = sql&"'"& nr_referencia &"'"
Else
    if nr_parcial <> "" then
        sql = sql&"'"& nr_processo &"' OR (NR_PROCESSO = '" & nr_referencia & "' AND CD_EMPRESA = '" & cd_empresa & "') "
    else
        sql = sql&"'"& nr_processo &"'"
    end if
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
str_obs = ""
If objrs.RecordCount > 0 Then 
  Do While Not objrs.Eof 
  str_obs = str_obs & objrs.Fields.Item("TX_OBSERVACAO").Value & "<br><br>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
  Loop
else 
  str_obs = ""
End If
If Not fnc_TestaVar(str_obs) Then str_obs = "" Else str_obs = Replace(Replace(str_obs, """", "'"), vbcrlf, "<br>")
				vBody = vBody & "<tr bgcolor='" & bg_detalhes & "' style='color:#546678;' valign='top'>"
				vBody = vBody & "<td>" & str_obs & "</td>"
				vBody = vBody & "</tr></table></td></tr>"                    
vBody = vBody & "</td>"
								vBody = vBody & "</tr></table>"
Else
vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0' >"
vBody = vBody & "<tr><td height='100%' valign='top'>"

cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  cont = 1
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0

								vBody = vBody &	"&nbsp;<font size='2'><b>" & Mid(Request.QueryString("nr_processo"),5,15) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
								vBody = vBody &	"<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 
			Case 1
								vBody = vBody &	"<tr height='0'>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"</tr></table><br />"
                                vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00051(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 								
			Case 2
								vBody = vBody & " <tr height='0'>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "</tr></table><br />"
                                vBody = vBody & " &nbsp;<font size='2'><b>" & tx_lang_A00052(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>"                                     						
		End Select
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
				vBody = vBody & "<tr bgcolor=" & bgcolor & ">"					
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & UCase(Mid(nr_processo, 5, Len(nr_processo))) & "&nbsp;</td>"

		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" &  tipo_canal(x) & "&nbsp;</td>"
		Case "0044"
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						vBody = vBody & "<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>"
					End If
					vBody = vBody & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
					vBody = vBody & "<td class='detcampo'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_VOO").Value & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
					vBody = vBody & "<td class='detcampo'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_CAMINHAO").Value & "</td>"
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "</td>"
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
						"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
						"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
						"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
							"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
							"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							"  AND I.CD_EMPRESA     = '"& cd_empresa &"' "&_
							"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
								"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				end if
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If

					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>" & str_merc & "</td>"
			objrsx.Close
		Case "0097" 'numero da referencia cliente (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0
					If str <> 0 Then str_refs(x) = str_refs(x) &"/"& str
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop
			End If
					vBody = vBody & "<td class='detcampo'>" & Right(objrsv.Fields.Item("M10_NM_DADO").Value, 11) & "</td>"
					vBody = vBody & "<td style='padding: 0px;'><table width='100%' cellpadding='0' cellspacing='0' border='0'>"
			if objrsx.RecordCount > 0 then
				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>"
						vBody = vBody & "<td>"& str_refs(x) &"</td></tr>"
					End If
				Next
			else
				vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;Pedido</td>"
				vBody = vBody & "<td>"& nr_referencia&"/"&nr_item_clnte &"</td></tr>"
			end if										
				vBody = vBody & "</table></td>"
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
                    vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & sim_nao(str) & "&nbsp;</td>"
	 	Case "0225" 'Nr de LI
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_LI, DT_DEFERIMENTO, DT_VENCTO "&_
						"FROM TPROCESSO_LI (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY DT_VENCTO DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_li = ""
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str_li = str_li & fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1)
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
			vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
			vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str_li & "</td>"
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & fnc_Mascara(str, 1) & "</td>"
        Case "0485"
            If objrsx.state = adstateOpen then objrsx.close()
			SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
			" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
			" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
			"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
			If objrsx.eof then
				str="-"
			else
				str= objrsx.fields.item("CONTATO").value
			End If
            vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
			vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str & "</td>"
            objrsx.Close
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "&nbsp;</td>"
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & fnc_Mascara( x, 5 ) & "&nbsp;</td>"
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo'>" &  objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & z & "&nbsp;</td>"
			End Select
	End Select
	If cont = 3 Then
		cont = 1
				vBody = vBody & "</tr>"
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value

objrs.Close

			vBody = vBody & 	"<tr height='0'>"
							vBody = vBody & 	"<td width='15%'></td>"
							vBody = vBody & 	"<td width='35%'></td>"
							vBody = vBody & 	"<td width='15%'></td>"
							vBody = vBody &     "<td width='35%'></td>"
							vBody = vBody & 	"</tr></table><br>"
                            vBody = vBody & "<table width='100%' border='0' cellpadding='0' cellspacing='0'>"
vBody = vBody & "<tr>"
vBody = vBody & "<td style='width:80%'><nobr>&nbsp;<font size='2'><b>" & tx_lang_A00053(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='260px' border='0' height='3px' align='middle'/></nobr></td>"
vBody = vBody & "<td style='text-align:center;width:8%;'>&nbsp;" & tx_lang_A00033(cd_lang) & "&nbsp;</td>"
vBody = vBody & "<td style='text-align:center;width:4%;'>&nbsp;" & tx_lang_A00034(cd_lang) & "&nbsp;</td>"
vBody = vBody & "<td style='text-align:center;width:8%;'>&nbsp;" & tx_lang_A00035(cd_lang) & "&nbsp;</td>"
vBody = vBody & "</tr></table>"
vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='0' style='border: solid 1px " & bg_detalhes_borda & ";' >"
        
If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT NR_PROCESSO_DES"&_ 
	      " FROM TESTAGIO_PROCESSO"&_ 
          " WHERE NR_PROCESSO_ADM = '" & nr_processo & "'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If Not objrs.eof then
	If Not fnc_testavar(objrs.Fields.Item("NR_PROCESSO_DES").Value) then
		nr_processo_des_null = 1
	End if
Else
	nr_processo_des_null = 0
End if								
				
'Seleciona os dados do follow-up
If objrs.State = adStateOpen Then objrs.Close
If cd_produto <> "06" Then
	sql = " AND F.NR_PROCESSO_DES = '"& nr_processo &"' "
else
	sql = ""
end if
If Not nr_processo_des_null = 1 Then
If nr_parcial <> "" or  nr_processo_adm_null = 0 Then
    If nr_parcial = "" Then
        If objrs.State = adStateOpen Then objrs.Close
        sql2 = "SELECT NR_PARCIAL, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA "&_ 
	          " FROM TESTAGIO_PROCESSO"&_ 
              " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
              if nr_referencia <> "" Then
                  sql2 = sql2 & " AND NR_REFERENCIA = '" & nr_referencia & "'"&_
                  " AND NR_ITEM_CLIENTE ='" & fnc_AddZeros(nr_item_clnte, 4) & "'"&_
                  " AND CD_EMPRESA = '" & cd_empresa & "'" &_
                  " AND NR_PARCIAL > 0" 
              End If
	    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	    objrs.Open sql2, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        nr_parcial = objrs.Fields.Item("NR_PARCIAL").Value
        nr_referencia = objrs.Fields.Item("NR_REFERENCIA").Value
        nr_item_clnte = objrs.Fields.Item("NR_ITEM_CLIENTE").Value
        cd_empresa = objrs.Fields.Item("CD_EMPRESA").Value
        If objrs.State = adStateOpen Then objrs.Close
    End If   

	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
	
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.TP_FOLLOWUP, F.NR_ORDEM "&_
			"FROM TFLP_ESTAGIO F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
			"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
			"  AND F.CD_EVENTO NOT IN ('022') "&_
			"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
			" ORDER BY F.TP_FOLLOWUP, F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"

    'Response.write sql
    'Response.end

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Else
	sql_parcial = ""
	
	sql = "SELECT F.CD_EVENTO,E."& tx_lang_evento & " AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	      "FROM TFOLLOWUP F ( NOLOCK ) "&_
		  "INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
          "WHERE F.NR_PROCESSO = '"& nr_processo &"' "&_
		  " ORDER BY  F.NR_ORDEM"	
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End if
Else
If Not fnc_testaVar(nr_parcial) Then nr_parcial = "0"
	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
	sql = "SELECT DISTINCT "&_
	"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	"FROM TFLP_PO_ITEM F ( NOLOCK ) "&_
	"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
	"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_PROCESSO = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
	"  AND F.CD_EVENTO NOT IN ('022') "&_
	"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
	" ORDER BY F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End If 

Do While Not objrs.Eof
  If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
	
	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
				z = fnc_DiasUteisKPI(x, y, 0)
			Else
				z = fnc_DiasUteisKPI(x, Date(), 0)
			End If
			'muda a cor do lead-time conforme o resultado
			If z < 0 Then 
				color = "#0000FF" 'azul
			ElseIf z > 0 Then
				z = "+"& z
				color = "#FF0000" 'vermelho
			End If
		End If
	End If

				vBody = vBody & "<tr bgcolor='" & bgcolor & "' height='13'>"
								vBody = vBody & "<td>" & objrs.Fields.Item("CD_EVENTO").Value &" - "& objrs.Fields.Item("NM_EVENTO").Value & "</td>"
                                vBody = vBody & "<td align='right' width='8%'>" & fnc_Mascara(x, 5) & "&nbsp;</td>"
									vBody = vBody & "<td align='center' width='4%'><font color="& color &">"& z &"</font></td>"
								vBody = vBody & "<td align='right' width='8%'><font color="& color &">"& fnc_Mascara(y, 5) &"</font>&nbsp;" & Hr_evento & "</td>"
								vBody = vBody & "</tr>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop

			vBody = vBody & "</table><br>"
	        vBody = vBody & "</tr>"
	 If Session("cd_cargo") <> "088" Then
							vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00054(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking  & ".gif'  width='380px' border='0' height='3px' align='middle'>"
							vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='2' style='border: solid 1px " & bg_detalhes_borda & ";' >"

				
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS (NOLOCK) WHERE NR_PROCESSO = "
If cd_produto = "06" Then
	sql = sql&"'"& nr_referencia &"'"
Else
    if nr_parcial <> "" then
        sql = sql&"'"& nr_processo &"' OR (NR_PROCESSO = '" & nr_referencia & "' AND CD_EMPRESA = '" & cd_empresa & "') "
    else
        sql = sql&"'"& nr_processo &"'"
    end if
End If
sql = sql & " ORDER BY TP_OBS"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
str_obs = ""
If objrs.RecordCount > 0 Then 
  Do While Not objrs.Eof 
  str_obs = str_obs & objrs.Fields.Item("TX_OBSERVACAO").Value & "<br><br>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
  Loop
else 
  str_obs = ""
End If
If Not fnc_TestaVar(str_obs) Then str_obs = "" Else str_obs = Replace(Replace(str_obs, """", "'"), vbcrlf, "<br>")
				vBody = vBody & "<tr bgcolor='" & bg_detalhes & "' style='color:#546678;' valign='top'>"
				vBody = vBody & "<td>" & str_obs & "</td>"
				vBody = vBody & "</tr></table></td></tr>"                    
vBody = vBody & "</td>"
								vBody = vBody & "</tr>"
							vBody = vBody & "</table>"
  End If                 
vBody = vBody & " </div> "
vBody = vBody & "</body>"


End If
Else
'EXP
if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 9999
  .CommandText = Session("sql_exp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

If vModoCompleto = ""  Then
vBody = vBody & "<body style='overflow:auto;' >"
vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0'>"
vBody = vBody &	"<tr> "
vBody = vBody &	"<td valign='top' height='100%'><table width='100%' border='0' cellspacing='1' cellpadding='1'>"

cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0

								vBody = vBody &	"&nbsp;<font size='2'><b>" & Mid(Request.QueryString("nr_processo"),5,15) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
								vBody = vBody &	"<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 
			Case 1
								vBody = vBody &	"<tr height='0'>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"</tr></table><br />"
                                vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00051(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 								
			Case 2
								vBody = vBody & " <tr height='0'>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "</tr></table><br />"
                                vBody = vBody & " &nbsp;<font size='2'><b>" & tx_lang_A00052(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>"     
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)

	If cont = 1 Then
		If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
								vBody = vBody & "<tr bgcolor='" & bgcolor & "'>"
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003" 'nr do processo
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & UCase(Mid(nr_processo, 5, Len(nr_processo))) & "&nbsp;</td>"
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & tipo_canal(x) & "&nbsp;</td>"
		Case "0044" 'embarcação / vôo / caminhão
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado) & "</td>"
									vBody = vBody & "<td bgcolor="&  bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_VOO").Value & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado) & "</td>"
									vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_CAMINHAO").Value & "</td>"
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "</td>"
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL( TX_MERCADORIA, '') AS AP_MERCADORIA "&_
						"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
							"FROM TPROCESSO ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
    								vBody = vBody & "<td>&nbsp;" & str_merc & "</td>"
			objrsx.Close
		Case "0097" 'numero das referencias (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
                                    vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td style='padding: 0px;'><table width='100%' cellpadding='0' cellspacing='0' border='0'>"
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					nr_item_clnte = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(nr_item_clnte) Then nr_item_clnte = CInt(nr_item_clnte) Else nr_item_clnte = 0
					If nr_item_clnte <> 0 Then str_refs(x) = str_refs(x) &"/"& nr_item_clnte
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop

				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>"
						vBody = vBody & "<td>"& str_refs(x) &"</td></tr>"
					End If
				Next
					vBody = vBody & "</table></td>"
			End If
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" &  objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & sim_nao(str) & "&nbsp;</td>"
	 	Case "0123" 'RE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & fnc_Mascara(str, 1) & "</td>"
		Case "0159" 'DDE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & fnc_Mascara(str, 3) & "</td>"
		Case "0170" 'qtde de containers
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT TP_CNTR, COUNT(*) AS VL_QTDE "&_
						"FROM TPROCESSO_CNTR (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"  AND TP_CNTR <> '01' "&_
						"GROUP BY TP_CNTR "&_
						"ORDER BY TP_CNTR"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_cntr = ""
			If objrsx.RecordCount > 0 then
				Do While Not objrsx.Eof
					str_cntr = str_cntr & objrsx.Fields.Item("VL_QTDE").Value &" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_cntr = str_cntr &"; "
				Loop
			Else
				str_cntr = tx_lang_A00041(cd_lang)
			End If
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str_cntr & "&nbsp;</td>"
		Case "0350" 'qtde de pallets
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT SUM(VL_QTDE) AS VL_QTDE FROM TPROCESSO_CARGA_SOLTA (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_lcl = ""
			If objrsx.Fields.Item("VL_QTDE").Value > 0 then
				Do While Not objrsx.Eof
					str_lcl = str_lcl & objrsx.Fields.Item("VL_QTDE").Value '&" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_lcl = str_lcl &"; "
				Loop
			Else
				str_lcl = tx_lang_A00044(cd_lang)
			End If
								vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
								vBody = vBody & "<td>&nbsp;" & str_lcl & "&nbsp;</td>"
			objrsx.Close
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
                                    vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "&nbsp;</td>"
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
                                    vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & fnc_Mascara( x, 5 ) & "&nbsp;</td>"
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
                                    vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & z & "&nbsp;</td>"
			End Select
	End Select
	If cont = 3 Then
		cont = 1
								vBody = vBody & "</tr>"
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
objrs.Close
								vBody = vBody & "<tr height='0'>"
								vBody = vBody & "<td width='15%'></td>"
								vBody = vBody & "<td width='35%'></td>"
								vBody = vBody & "<td width='15%'></td>"
								vBody = vBody & "<td width='35%'></td>"
								vBody = vBody & "</tr></table><br>"
                                vBody = vBody & "  <nobr>&nbsp;<font size='2'><b>" & tx_lang_A00053(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='260px' border='0' height='3px' align='middle'/></nobr></td>"

vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='0' style='border: solid 1px " & bg_detalhes_borda & ";'>"	

If objrs.State = adStateOpen Then objrs.Close
'Seleciona os dados do follow-up
sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM , TF.HR_CARGA AS HORA_CARGA ,  TF.HR_TEMP AS HORA_TEMP ,   TF.HR_IMO AS HORA_IMO ,  TF.HR_GATE AS HORA_GATE ,  TF.HR_DRAFT " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"  INNER JOIN TFLP_EXPORT TF ( NOLOCK ) ON ( TF.NR_PROCESSO = F.NR_PROCESSO ) "&_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO NOT IN ('022') " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			"ORDER BY F.NR_ORDEM"
'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")

objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Do While Not objrs.Eof
  If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	evento=objrs.Fields.Item("CD_EVENTO").Value
	Select case evento
		   Case "270" 'Draft
		        Hr_evento=objrs.Fields.Item("HR_DRAFT").Value
		   Case "130" 'IMO
		        Hr_evento=objrs.Fields.Item("HORA_IMO").Value
		   Case "562" 'CARTA DE TEMPERATURA
		        Hr_evento=objrs.Fields.Item("HORA_TEMP").Value
		   Case "271" 'CARGA
		        Hr_evento=objrs.Fields.Item("HORA_CARGA").Value
			'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("HR_GATE").Value&"")	
		   Case else
		        Hr_evento=""
		   'Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"")
	End Select
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
'	if evento=270 then  Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"") end if 

	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
				z = fnc_DiasUteisKPI(x, y, 0)
			Else
				z = fnc_DiasUteisKPI(x, Date(), 0)
			End If
			'muda a cor do lead-time conforme o resultado
			If z < 0 Then 
				color = "#0000FF" 'azul
			ElseIf z > 0 Then
				z = "+"& z
				color = "#FF0000" 'vermelho
			End If
		End If
	End If
	str = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value)

							vBody = vBody & "<tr bgcolor='" & bgcolor & "' height='13'>"
							vBody = vBody & "<td title='" & str & "'>" & Left(str, 50) 
                             if Len(str) > 50 then 
                                vBody = vBody & "..."
                             End If
                             vBody = vBody & "</td>"                   		
									vBody = vBody & "<td align='right'><font color="& color &">"& fnc_Mascara(y, 5) &"</font>&nbsp;" & Hr_evento & "</td>"
								vBody = vBody & "</tr>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close
							vBody = vBody & "</table><br>"
							vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00054(cd_lang) & "</b></font><img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='380px' border='0' height='3px' align='middle'>"
							vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='2' style='border: solid 1px " & bg_detalhes_borda & ";'>"
If objrs.State = adStateOpen Then objrs.Close 
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS ( NOLOCK )WHERE NR_PROCESSO = '"& nr_processo &"'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then str_obs = objrs.Fields.Item("TX_OBSERVACAO").Value else str_obs = ""
If Not fnc_TestaVar(str_obs) Then str_obs = "" 'Else str_obs = Replace(x, vbcrlf, "<br>")
							vBody = vBody &	"<tr bgcolor='" & bg_detalhes & "' style='color:#546678;' valign='top'>"
							vBody = vBody &	"<td height='" & x  & "'>"
                                    if Session("cd_cargo") <> "131" Then
                                    vBody = vBody & "<div style='overflow:auto;height:" & x &"' >" & Replace(Replace(str_obs, "'", "´"), vbcrlf, "<br>") & "</div>"                                   
									End If
                                    vBody = vBody & "</td>"
								vBody = vBody & "</tr></table>"

Else
  vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0' >"
  vBody = vBody & "<tr><td height='100%' valign='top'>"
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0

								vBody = vBody &	"&nbsp;<font size='2'><b>" & Mid(Request.QueryString("nr_processo"),5,15) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
								vBody = vBody &	"<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 
			Case 1
								vBody = vBody &	"<tr height='0'>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"<td width='15%'></td>"
								vBody = vBody &	"<td width='35%'></td>"
								vBody = vBody &	"</tr></table><br />"
                                vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00051(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>" 								
			Case 2
								vBody = vBody & " <tr height='0'>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "	<td width='15%'></td>"
								vBody = vBody & "	<td width='35%'></td>"
								vBody = vBody & "</tr></table><br />"
                                vBody = vBody & " &nbsp;<font size='2'><b>" & tx_lang_A00052(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='600' border='0' height='3px' align='middle'>"
                                vBody = vBody & "<table width='100%' border='0' cellspacing='1' cellpadding='1' style='border: solid 1px " & bg_detalhes_borda & ";'>"                                     						
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	

	If cont = 1 Then
		If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
						vBody = vBody & "<tr bgcolor='" & bgcolor & "'>"
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003" 'nr do processo
						vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
						vBody = vBody & "<td>&nbsp;" & UCase(Mid(nr_processo, 5, Len(nr_processo))) & "&nbsp;</td>"
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & tipo_canal(x) & "&nbsp;</td>"
		Case "0044" 'embarcação / vôo / caminhão
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado) & "</td>"
									vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & objrs.Fields.Item("NR_VOO").Value & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado) & "</td>"
									vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & objrs.Fields.Item("NR_CAMINHAO").Value & "</td>"
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "</td>"
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL( TX_MERCADORIA, '') AS AP_MERCADORIA "&_
						"FROM TPROCESSO_EXP_ITEM ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
							"FROM TPROCESSO ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str_merc & "</td>"
			objrsx.Close
		Case "0097" 'numero das referencias (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
						vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
						vBody = vBody & "<td style='padding: 0px;'><table width='100%' cellpadding='0' cellspacing='0' border='0'>"
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					nr_item_clnte = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(nr_item_clnte) Then nr_item_clnte = CInt(nr_item_clnte) Else nr_item_clnte = 0
					If nr_item_clnte <> 0 Then str_refs(x) = str_refs(x) &"/"& nr_item_clnte
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop

				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>"
						vBody = vBody & "<td>"& str_refs(x) &"</td></tr>"
					End If
				Next
					vBody = vBody & "</table></td>"
			End If
			objrsx.Close
		Case "0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & sim_nao(str) & "&nbsp;</td>"
	 	Case "0123" 'RE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & fnc_Mascara(str, 1) & "</td>"
		Case "0159" 'DDE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor='" & bgcolor & "'>&nbsp;" & fnc_Mascara(str, 3) & "</td>"
		Case "0170" 'qtde de containers
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT TP_CNTR, COUNT(*) AS VL_QTDE "&_
						"FROM TPROCESSO_CNTR (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"  AND TP_CNTR <> '01' "&_
						"GROUP BY TP_CNTR "&_
						"ORDER BY TP_CNTR"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_cntr = ""
			If objrsx.RecordCount > 0 then
				Do While Not objrsx.Eof
					str_cntr = str_cntr & objrsx.Fields.Item("VL_QTDE").Value &" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_cntr = str_cntr &"; "
				Loop
			Else
				str_cntr = tx_lang_A00041(cd_lang)
			End If
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str_cntr & "&nbsp;</td>"
		Case "0350" 'qtde de pallets
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT SUM(VL_QTDE) AS VL_QTDE FROM TPROCESSO_CARGA_SOLTA (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_lcl = ""
			If objrsx.Fields.Item("VL_QTDE").Value > 0 then
				Do While Not objrsx.Eof
					str_lcl = str_lcl & objrsx.Fields.Item("VL_QTDE").Value '&" "& tipo_cntr(CInt(objrsx.Fields.Item("TP_CNTR").Value)-1)
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_lcl = str_lcl &"; "
				Loop
			Else
				str_lcl = tx_lang_A00044(cd_lang)
			End If
					vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str_lcl & "&nbsp;</td>"
			objrsx.Close
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & str & "&nbsp;</td>"
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" &  objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & fnc_Mascara( x, 5 ) & "&nbsp;</td>"
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
									vBody = vBody & "<td class='detcampo' style='background-color:" & bg_detalhes_campo & ";'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
									vBody = vBody & "<td>&nbsp;" &  z & "&nbsp;</td>"									
			End Select
	End Select
	If cont = 3 Then
		cont = 1
								vBody = vBody & "</tr>"
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
objrs.Close
    						vBody = vBody & 	"<tr height='0'>"
							vBody = vBody & 	"<td width='15%'></td>"
							vBody = vBody & 	"<td width='35%'></td>"
							vBody = vBody & 	"<td width='15%'></td>"
							vBody = vBody &     "<td width='35%'></td>"
							vBody = vBody & 	"</tr></table><br>"
                            vBody = vBody & "<table width='100%' border='0' cellpadding='0' cellspacing='0'>"
vBody = vBody & "<tr>"
vBody = vBody & "<td style='width:80%'><nobr>&nbsp;<font size='2'><b>" & tx_lang_A00053(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking & ".gif'  width='260px' border='0' height='3px' align='middle'/></nobr></td>"
vBody = vBody & "<td style='text-align:center;width:8%;'>&nbsp;" & tx_lang_A00033(cd_lang) & "&nbsp;</td>"
vBody = vBody & "<td style='text-align:center;width:4%;'>&nbsp;" & tx_lang_A00034(cd_lang) & "&nbsp;</td>"
vBody = vBody & "<td style='text-align:center;width:8%;'>&nbsp;" & tx_lang_A00035(cd_lang) & "&nbsp;</td>"
vBody = vBody & "</tr></table>"
				vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='0' style='border: solid 1px " & bg_detalhes_borda & ";' >"

in_verifica_importador = 0								
If Session("cd_cargo") = "088" Then			
	If objrs.State = adStateOpen Then objrs.Close
	sql = " SELECT TOP 1 CD_GRUPO AS GRUPO "&_
   	" FROM TPERMISSAO_EMPRESA_EST PE "&_
    " INNER JOIN TEMPRESA_EST_GRUPO EG ON EG.CD_EMPRESA = PE.CD_EMPRESA "&_
    " WHERE CD_USUARIO ='" & Session("cd_usuario") & "'"
	Objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
	
	grupo_importador = Objrs.Fields.Item("GRUPO").Value
					 
	If objrs.State = adStateOpen Then objrs.Close
	sql = " SELECT CD_EVENTO FROM TGRUPO_IMPORTADOR_EVENTO WHERE CD_GRUPO = '" & grupo_importador &  "' AND CD_PRODUTO = '02'" 		
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText						
				
	If objrs.RecordCount > 0 Then
		in_verifica_importador = 1
	Else
		in_verifica_importador = 0
	End If	
End If
															
If objrs.State = adStateOpen Then objrs.Close
'Seleciona os dados do follow-up
If in_verifica_importador = 1 Then
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM , TF.HR_CARGA AS HORA_CARGA ,  TF.HR_TEMP AS HORA_TEMP ,   TF.HR_IMO AS HORA_IMO ,  TF.HR_GATE AS HORA_GATE ,  TF.HR_DRAFT " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"  INNER JOIN TFLP_EXPORT TF ( NOLOCK ) ON ( TF.NR_PROCESSO = F.NR_PROCESSO ) "&_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO IN (SELECT CD_EVENTO FROM TGRUPO_IMPORTADOR_EVENTO WHERE CD_GRUPO = '" &  grupo_importador &  "' AND CD_PRODUTO = '02' ) " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			" ORDER BY F.NR_ORDEM"
Else
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM , TF.HR_CARGA AS HORA_CARGA ,  TF.HR_TEMP AS HORA_TEMP ,   TF.HR_IMO AS HORA_IMO ,  TF.HR_GATE AS HORA_GATE ,  TF.HR_DRAFT " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"  INNER JOIN TFLP_EXPORT TF ( NOLOCK ) ON ( TF.NR_PROCESSO = F.NR_PROCESSO ) "&_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO NOT IN ('022') " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			" ORDER BY F.NR_ORDEM"
End If			
'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  If bgcolor = bg_detalhes Then bgcolor = "#FFFFFF" Else bgcolor = bg_detalhes
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	evento=objrs.Fields.Item("CD_EVENTO").Value
	Select case evento
		   Case "270" 'Draft
		        Hr_evento=objrs.Fields.Item("HR_DRAFT").Value
		   Case "130" 'IMO
		        Hr_evento=objrs.Fields.Item("HORA_IMO").Value
		   Case "562" 'CARTA DE TEMPERATURA
		        Hr_evento=objrs.Fields.Item("HORA_TEMP").Value
		   Case "271" 'CARGA
		        Hr_evento=objrs.Fields.Item("HORA_CARGA").Value
			'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("HR_GATE").Value&"")	
		   Case else
		        Hr_evento=""
		   'Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"")
	End Select
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
'	if evento=270 then  Response.Redirect("../IMPORT/teste.asp?var1="&Hr_evento&"") end if 

	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
				z = fnc_DiasUteisKPI(x, y, 0)
			Else
				z = fnc_DiasUteisKPI(x, Date(), 0)
			End If
			'muda a cor do lead-time conforme o resultado
			If z < 0 Then 
				color = "#0000FF" 'azul
			ElseIf z > 0 Then
				z = "+"& z
				color = "#FF0000" 'vermelho
			End If
		End If
	End If
	str = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value)

								vBody = vBody & "<tr bgcolor='" & bgcolor & "' height='13'>"
								vBody = vBody & "<td title='" & str & "' width='80%'>" & Left(str, 50) 
                                if Len(str) > 50 then 
                                    vBody = vBody & "..."
                                End If
                                vBody = vBody & "</td>"
                                vBody = vBody & "<td align='right' width='8%'>" & fnc_Mascara(x, 5) & "&nbsp;</td>"
									vBody = vBody & "<td align='center' width='4%'><font color="& color &">"& z &"</font></td>"
								vBody = vBody & "<td align='right' width='8%'><font color="& color &">"& fnc_Mascara(y, 5) &"</font>&nbsp;" & Hr_evento & "</td>"
								vBody = vBody & "</tr>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close

							vBody = vBody & "</table><br>"
                            If Session("cd_cargo") <> "088" Then
							vBody = vBody & "&nbsp;<font size='2'><b>" & tx_lang_A00054(cd_lang) & "</b></font> <img src='http://www.myindaiaweb.com.br/imagens/30/barra_tracking" & barra_tracking  & ".gif'  width='380px' border='0' height='3px' align='middle'>"
							vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='2' style='border: solid 1px " & bg_detalhes_borda & ";' >"
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS (NOLOCK) WHERE NR_PROCESSO = "
If cd_produto = "06" Then
	sql = sql&"'"& nr_referencia &"'"
Else
	sql = sql&"'"& nr_processo &"'"
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText


If objrs.RecordCount > 0 Then str_obs = objrs.Fields.Item("TX_OBSERVACAO").Value else str_obs = ""

If Not fnc_TestaVar(str_obs) Then str_obs = "" 'Else str_obs = Replace(x, vbcrlf, "<br>")
								vBody = vBody & "<tr bgcolor='" & bg_detalhes  & "' style='color:#546678;' valign='top'>"
								vBody = vBody & "<td height='" &  x+58 & "'>"
                                    if Session("cd_cargo") <> "131" Then
                                    vBody = vBody & "<div style='scrollbar-face-color:" & rolagem_menu10 & ";scrollbar-track-color:" & rolagem_menu20 & ";scrollbar-arrow-color:" & rolagem_menu30 & ">;scrollbar-shadow-color:" & rolagem_menu40 & ";scrollbar-3dlight-color: " & rolagem_menu50 & ";scrollbar-highlight-color:" & rolagem_menu60 & ";scrollbar-darkshadow-color: " & rolagem_menu70 & ";overflow:auto;height:" & x+54 & ";'>" &  Replace(Replace(str_obs, "'", "´"), vbcrlf, "<br>") & "</div>"                                   
									End If
                                    vBody = vBody & "</td>"
								vBody = vBody & "</tr>"
							vBody = vBody & "</table>"

End If
End If
End If
vBody = vBody & "</html>"

'Response.write nm_email & "<br>"
'Response.write nm_cc & "<br>"
'Response.write assunto & "<br>"
'Response.write msg & "<br>"
'Response.write flag_arq_expo & "<br>"
'Response.write flag_arq_impo_des & "<br>"
'Response.write flag_arq_impo_adm & "<br>"
'Response.write total_contador & "<br>"
'Response.write total_contador2 & "<br>"
'Response.write total_contador_while & "<br>"
'Response.write vBody
'Response.end

if objrsx.State = adStateOpen Then objrsx.Close
sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & request.querystring("nr_processo") & "',0) AS RESULTADO "
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

tx_caminho = Server.MapPath("/"&diretorio_docs&"/"& request.querystring("nr_processo"))
    
If flag_arq_expo = 1 Then
	For contador_for = 1 to total_contador
		If fnc_TestaVar(Request.Form("check_exp" & contador_for)) and Request.Form("check_exp" & contador_for) <> "0" Then
			texto = texto & tx_caminho & "\" & Request.Form("check_exp" & contador_for) & ";"
		End If	
	Next
End If

If flag_arq_impo_des = 1 Then
	if total_contador_while > 0 Then
		For contador_while = 1 to total_contador_while
			For contador_for = 1 to total_contador
				If fnc_TestaVar(Request.Form("check_imp_adm" & contador_while & contador_for)) and Request.Form("check_imp_adm" & contador_while & contador_for) <> "0" Then
					texto = texto & tx_caminho & "\" & Request.Form("check_imp_adm" & contador_while & contador_for) & ";"				
				End If
			Next
		Next
	End If
	If total_contador2 > 0 Then
		For contador_for2 = 1 to total_contador2
			If fnc_TestaVar(Request.Form("check_imp_des" & contador_for2)) and Request.Form("check_imp_des" & contador_for2) <> "0" Then
				texto = texto & tx_caminho & "\" & Request.Form("check_imp_des" & contador_for2) & ";"
			End If	
		Next
	End If
End If

If flag_arq_impo_adm = 1 Then
	If total_contador_while > 0 then
		For contador_while = 1 to total_contador_while
			For contador_for2 = 1 to total_contador2
				If fnc_TestaVar(Request.Form("check_imp_des" & contador_while & contador_for2)) and Request.Form("check_imp_des" & contador_while & contador_for2) <> "0" Then
					texto = texto & tx_caminho & "\" & Request.Form("check_imp_des" & contador_while & contador_for2) & ";"				
				End If
			Next
		Next
	End If
	If total_contador > 0 then
		For contador_for = 1 to total_contador - 1
			If fnc_TestaVar(Request.Form("check_imp_adm" & contador_for)) and  Request.Form("check_imp_adm" & contador_for) <> "0" Then
				texto = texto & tx_caminho & "\" & Request.Form("check_imp_adm" & contador_for) & ";"
			End If	
		Next
	End If
End If

If Not fnc_testaVar(assunto) Then
	assunto = "<Sem assunto>"
End If

'response.write texto
'Response.end

nm_email_from = Session("nm_email")

if Session("InEnviaComoTi") = "1" Then
if InStr(UCase(nm_email), UCase(Session("nm_email"))) or InStr(UCase(nm_cc), UCase(Session("nm_email"))) Then
	nm_email_from = "ti@myindaia.com.br"
End If
End If

Set objEmail = CreateObject("CDO.Message")

objEmail.From 		= nm_email_from
objEmail.To 		= nm_email
objEmail.CC 		= nm_cc
objEmail.Subject 	= assunto

'Response.write texto
'Response.end

While Len(texto) > 0
					texto2 = mid(texto, 1, inStr(1,texto,";")-1) 
					texto = Right(texto, Len(texto)-len(texto2)-1)
                    'Response.write texto2
					objEmail.AddAttachment texto2
				Wend
                'Response.end

objEmail.MIMEFormatted = true
objEmail.HTMLBody  	= msg & "<br><br>" & vBody
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp-m.myindaia.com.br" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "ti@myindaia.com.br"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "789852"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
objEmail.Configuration.Fields.Update
objEmail.Send
set objEmail = nothing

%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="350">
						<td align="center">
											    <strong><%=tx_lang_POP111(cd_lang)%></strong><br>
											    <br>
												<a href="javascript:history.back();" target="_self" style="text-decoration:none;">voltar</a>
												<br>
												
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
<%
Set mail = nothing
%>