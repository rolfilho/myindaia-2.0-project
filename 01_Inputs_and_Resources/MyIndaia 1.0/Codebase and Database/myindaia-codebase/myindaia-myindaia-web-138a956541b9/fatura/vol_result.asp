<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Financeiro / Volumes
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Kleber Guedes
'Criado: 27/07/2007
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim objrsi 'objeto para selecionar os dados
Dim objfso 'objeto para o sistema de arquivos
Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim in_proc_adm 'verifica se existe o numero do processo de administração
Dim in_proc_des 'verifica se existe o numero do processo de desembaraço
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim txTitle     'guarda titulos de celulas
Dim txLinkProcesso 'link para o detalhe de processo
Dim tpProduto 'produto do processo
Dim cdProdutoQuebra 'váriavel que guarda produto atual
Set objrsi = Server.CreateObject("ADODB.RECORDSET")

in_comodo = "1"
in_show  = False
cd_tela  = "FAT018"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
'Session("sql_volumes") = Null
If Not fnc_TestaVar(Session("sql_volumes")) Then
  'dados básicos do relatório
	sql_s = "SELECT DISTINCT "&_
          "R.CD_PRODUTO, R.NR_PROCESSO, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "
	'tabelas da busca
  sql_f = "FROM TREL_VOLUMES R (NOLOCK) "&_
					"  LEFT JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
                    "  LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON (CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO) "&_
					"  LEFT JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PR.NR_PROCESSO) "&_
					"  LEFT JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO ='"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   = "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY R.CD_PRODUTO,"
	If fnc_TestaVar(tp_quebra) Then
		sql_o = sql_o &" R."& tipo_quebra( tp_quebra ) &" ASC,	"
	End If
	sql_o = sql_o &" R.NR_PROCESSO ASC"

	'inicia a montagem dos campos que serão selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			select case objrsv.Fields.Item("M10_CD_DADO").Value
				case "0126"'importador
					sql_s = sql_s &_
						"CASE PR.CD_PRODUTO "&_
						"  WHEN '01' THEN (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_IMPORTADOR) "&_
						"  WHEN '02' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = PR.CD_IMPORTADOR) "&_
						"END AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				case "0133"'exportador
					sql_s = sql_s &_
						"CASE PR.CD_PRODUTO "&_
						"  WHEN '01' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = PR.CD_EXPORTADOR) "&_
						"  WHEN '02' THEN (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_EXPORTADOR) "&_
						"END AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				case else 
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
						Case "00","02","50"'String - Tabela Direto, Array
							sql_s = sql_s &_
								" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case "01","21","31","41"'String - Lookup
							sql_s = sql_s &_
								" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
								"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case "10"'Data
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								 nr_data = nr_data + 1
								 sql_s = sql_s &_
												 " F"& nr_data &".IN_APLICAVEL AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												 " F"& nr_data &".DT_PREVISTA AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												 " F"& nr_data &".DT_REALIZACAO AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								 sql_f = sql_f &_
												 " LEFT JOIN TFOLLOWUP F"& nr_data &" ( NOLOCK ) ON ( F"& nr_data &".NR_PROCESSO = PR.NR_PROCESSO AND F"& nr_data &".CD_EVENTO = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"') "
							Else
								'Outras datas vindas de outras tabelas
								sql_s = sql_s &_
												" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
						Case "20","30"'Decimal, Moeda
							sql_s = sql_s &_
								" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case "40"'Inteiro
							sql_s = sql_s &_
								" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End Select
			end select	
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_volumes") = sql_s & sql_f & sql_w & sql_o
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_volumes") &"<br>"
With objcmd
  .CommandTimeOut = 300
  .CommandText    = Session("sql_volumes")
  .CommandType    = adCmdText
End With
'Response.Write(Session("sql_volumes"))
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("vTxBusca") <> "" Then
  str = Request("vTxBusca")
  'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
		pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
  objrs.AbsolutePage = CInt(pagina)
End If

url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url
tx_path_file  = "/fatura/vol_print"
tx_path_excel = "/fatura/vol_excel"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
'cria o objeto do sistema de arquivos
Set objfso = Server.CreateObject("Scripting.FileSystemObject")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "vol_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
}

function abreDocs(nr_proc_des, nr_proc_adm, tp_relat) {
	features = "top=100,left=20,width=350,height=250,resizable=yes";
  window.open('/detalhe/scan_docs_processo.asp?nr_proc_des='+nr_proc_des+'&nr_proc_adm='+nr_proc_adm+'&tp_relat='+tp_relat,"docs_processo",features);
}

function abreParametrizacao(nr_processo, tp_relat) {
	features = "top=100,left=20,width=500,height=350,resizable=yes";
  window.open('/detalhe/imp_parametrizacao.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}

function abreStatus(nr_processo, nr_referencia, nr_item_clnte) {
	features = "top=100,left=20,width=750,height=550,resizable=yes";
  window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo+'&nr_referencia='+nr_referencia+'&nr_item_clnte='+nr_item_clnte,"status",features);
}
//-->
</script>
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
    <td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<%
dim vTxLinha(1), vInRowspan
vTxLinha(0) = ""
vTxLinha(1) = ""
vInRowspan = false
nr_cols = 0
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	select case objrsv.Fields.Item("M10_CD_DADO").Value
		case "0118"
			vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00095(cd_lang)&"</td><td>"&tx_lang_A00096(cd_lang)&"</td><td>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00033(cd_lang)&"</td><td>"&tx_lang_A00034(cd_lang)&"</td><td>"&tx_lang_A00035(cd_lang)&"</td>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else
            vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						nr_cols = nr_cols + 1
					end if
				case else
					vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'exibe a linha com os cabeçalhos
if Len(vTxLinha(0)) > 0 then
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=30 class='gridtit'>"&vTxLinha(0)&"</tr>")
end if
'exibe a linha com os sub-cabeçalhos
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub'>"&vTxLinha(1)&"</tr>")
end if

nrec = 0
cd_campo_quebra = ""
cdProdutoQuebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	tpProduto = Trim(objrs.Fields.Item("CD_PRODUTO").Value)
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	nr_referencia = ""
	nr_item_clnte = ""
	'link para o detalhe do processo
	Select Case tpProduto
	Case "01", "03"
  	txLinkProcesso ="/detalhe/imp_proc_result.asp?cd_menu_rel="&cd_menu&"&cd_subm_rel="&cd_subm&"&cd_view_rel="&cd_view&"&tp_relat="&tp_relat&_
  		"&filtro=nr_processo,nr_referencia,nr_item_cliente&nr_processo="&nr_processo&"&nr_referencia="&nr_referencia&"&nr_item_clnte="&nr_item_clnte
	Case "02","06","10"
  	txLinkProcesso ="/detalhe/exp_proc_result.asp?cd_menu_rel="&cd_menu&"&cd_subm_rel="&cd_subm&"&cd_view_rel="&cd_view&"&filtro=nr_processo&nr_processo="&nr_processo	
	End Select
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If cdProdutoQuebra <> tpProduto Then
%>
					<tr>
						<td height="20" colspan="<%= nr_cols%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= aTpProduto(CInt(tpProduto) - 1) %></td>
					</tr>
<%
		End If
		cdProdutoQuebra = tpProduto




	If fnc_TestaVar(tp_quebra) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If UCase(cd_campo_quebra) <> UCase(objrs.Fields.Item(tipo_quebra( tp_quebra )).Value) Then
%>
					<tr>
						<td height="20" colspan="<%= nr_cols%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
					</tr>
<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
	End If
%>
					<tr height="16" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
<%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização nos registros do relatório
	Do While Not objrsv.Eof
		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
				<td align="center"><nobr>&nbsp;<a href="<%= txLinkProcesso %>"><%= Mid(nr_processo, 5, 10)%></a>&nbsp;</nobr></td>
<%		
			Case "0018" 'Nr. do pedido
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
							"FROM TREF_CLIENTE ( NOLOCK ) "&_
							"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
							"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
							"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'agrupa todas as referencias na string para aparecerem como hint
				If objrsx.RecordCount > 0 Then
					str = " title=""referências"& vbcrlf
					nr_referencia = Trim(objrsx.Fields.Item(nm_campo_rel).Value)
					'agrupa todas as referencias na string para aparecerem como hint
					Do While Not objrsx.Eof
						str = str & Trim( objrsx.Fields.Item(nm_campo_rel).Value )
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str & vbcrlf
					Loop
					If objrsx.RecordCount > 1 Then str = str&"""" else str = ""
				Else
					str = ""
					nr_referencia = ""
				End If
%>
         <td align="left"<%= str%>><nobr>&nbsp;<a href="<%= txLinkProcesso %>"><%= nr_referencia%></a>&nbsp;</nobr></td>
<%
			Case "0066" 'tipo de frete
				Response.Write(fncExibeFrete(0, objrs.Fields.Item(nm_campo_rel).Value))
			case "0126","0133" 'importador/exportador
				Response.Write(fncImpExp(0, objrs.Fields.Item(nm_campo_rel).Value, Mid(nr_processo, 3, 2)))
			Case "0170" 'qtde e tipo de Container
				If objrsx.State = adStateOpen Then objrsx.Close()
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
							"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
							"  AND TP_CNTR <> '01' "&_
							"GROUP BY TP_CNTR"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				matriz = Split(nm_campo_rel, ";", -1)
				
				If objrsx.RecordCount > 0 Then
					str = ""
					Do While Not objrsx.Eof
						str = str &"<nobr>"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='1' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreContainer('"& nr_processo &"');"">"&_
								"<img src='/imagens/icones/16x16/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
<%
				objrsx.Close()
			Case "0350" 'Carga Solta / LCL
				sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
							"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
							"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
							"GROUP BY NM_ESPECIE"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				matriz = Split(nm_campo_rel, ";", -1)
				
				If objrsx.RecordCount > 0 Then
					str = ""
					Do While Not objrsx.Eof
						str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &"</nobr>"
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str = str &"<br>"
					Loop
					str = "<table width='100%' cellspacing='0' cellpadding='0' border='0'><tr><td>"& str &_
								"</td><td align='right'>&nbsp;<a href='#' onClick=""abreCargaSolta('"& nr_processo &"');"">"&_
								"<img src='/imagens/icones/16x16/pallet.gif' width=22 height=15 border=0 alt='"& tx_lang_A00043(cd_lang) &"' />"&_
								"</a>&nbsp;</td></tr></table>"
				Else
				  str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
				End If
%>
						<td><%= str%></td>
<%
				objrsx.Close()
      Case "0173" 'peso bruto
        Select Case tpProduto
				Case "01", "02"
					If objrsx.State = adStateOpen Then objrsx.Close()
					if tpProduto = "01" then
						sql = "SELECT ISNULL(PB_CARGA, 0) AS VALOR "&_
									" FROM TDECLARACAO_IMPORTACAO (NOLOCK) "&_
									" WHERE NR_PROCESSO = '"& nr_processo &"' "
					elseif tpProduto =  "02" then
						sql = "SELECT ISNULL(VL_PESO_BRUTO, 0) AS VALOR "&_
									" FROM TPROCESSO_EXP (NOLOCK) "&_
									" WHERE NR_PROCESSO = '"& nr_processo &"' "				
					End If 								
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If (objrsx.RecordCount > 0) then
					  if fnc_TestaVar(objrsx.Fields.Item("VALOR").Value) Then
  						str = Trim(objrsx.Fields.Item("VALOR").Value)
            Else
      				str = objrs.Fields.Item(nm_campo_rel).Value
    					if not fnc_TestaVar(str) then  str =  "&nbsp;"						
  					End If
					else
     				str = objrs.Fields.Item(nm_campo_rel).Value
   					if not fnc_TestaVar(str) then  str =  "&nbsp;"						
					End If	
				Case Else	
  				str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then  str =  "&nbsp;"				
				End Select	
				Response.Write(fncExibeNumeroPadrao(0, str, 3))
      Case "0561" 'cubagem
				if tpProduto =  "02" then				
  				If objrsx.State = adStateOpen Then objrsx.Close()

          sql = "SELECT ISNULL(VL_PESO_BRUTO, 0) AS VALOR "&_
					      " FROM TPROCESSO_EXP (NOLOCK) "&_
								" WHERE NR_PROCESSO = '"& nr_processo &"' "				

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					If (objrsx.RecordCount > 0) then 
					  if fnc_TestaVar(objrsx.Fields.Item("VALOR").Value) Then
  						str = Trim(objrsx.Fields.Item("VALOR").Value)
  					Else	
  						str = objrs.Fields.Item(nm_campo_rel).Value
  						if not fnc_TestaVar(str) then  str =  "&nbsp;"				
  					End If	
					else
						str = objrs.Fields.Item(nm_campo_rel).Value
						if not fnc_TestaVar(str) then  str =  "&nbsp;"							
					End If	
        else
  				str = objrs.Fields.Item(nm_campo_rel).Value
					if not fnc_TestaVar(str) then  str =  "&nbsp;"				
				End If 												
				Response.Write(fncExibeNumeroPadrao(0, str, 3))				
				
			Case "0555" 'país de origem caso não tenha na capa pega o primeiro item
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
									" WHERE CODIGO = (SELECT TOP 1 ISNULL(CD_PAIS_ORIG_MERC, '') "&_
									"                    FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) "&_
									"                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
						Else
							If objrsx.State = adStateOpen Then objrsx.Close()
							'seleciona o país de acordo com o primeiro item da DI
							sql = "SELECT DESCRICAO FROM TPAIS (NOLOCK) "&_
										" WHERE CODIGO = (SELECT TOP 1 (CASE ISNULL(CD_PAIS_ORIG_MERC, '') "&_
										"                                 WHEN '' THEN CD_PAIS_AQUIS_MERC "&_
										"                                 ELSE CD_PAIS_ORIG_MERC "&_
										"                               END) "&_ 
										"                    FROM TADICAO_DE_IMPORTACAO ( NOLOCK ) "&_
										"                   WHERE NR_PROCESSO   = '"& nr_processo &"') "
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
							If objrsx.RecordCount > 0 Then
								str = Trim(objrsx.Fields.Item("DESCRICAO").Value)
							Else
								str = "&nbsp;"
							End If
						End If	
						objrsx.Close()
					End If
				End If
%>
         <td><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
<%
			Case "0574" 'valor FOB
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT ISNULL(VL_TOT_MLE_MNEG, 0) AS TOTAL_FOB FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  if fnc_TestaVar(objrsx.Fields.Item("TOTAL_FOB").Value) then
						  str = Trim(objrsx.Fields.Item("TOTAL_FOB").Value)
						  End If
						End If
  					objrsx.Close()
					End If
				End If			
				Response.Write(fncExibeNumeroPadrao(0, str, 2))				  
			Case "0575" 'valor Frete
				str = objrs.Fields.Item(nm_campo_rel).Value
				if tpProduto = "01" then 
					if not fnc_TestaVar(str) then
            If objrsx.State = adStateOpen Then objrsx.Close()
						'seleciona o país de acordo com a capa da DI
						sql = "SELECT ISNULL(VL_TOTAL_FRETE_MNEG, 0) AS TOTAL_FRETE FROM TDECLARACAO_IMPORTACAO ( NOLOCK ) WHERE NR_PROCESSO   = '"& nr_processo &"') "
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						If objrsx.RecordCount > 0 Then
						  if fnc_TestaVar(objrsx.Fields.Item("TOTAL_FRETE").Value) then
						  str = Trim(objrsx.Fields.Item("TOTAL_FRETE").Value)
						  End If
						End If
  					objrsx.Close()
					End If
				End If			
				Response.Write(fncExibeNumeroPadrao(0, str, 2))				  
		
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
					Case "1" 'exibe os campos de datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
							Response.Write(fncExibeDataEventoFup(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						else
							Response.Write(fncExibeDataPadrao(0, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						end if	
					Case "2" 'exibe os campos com valor decimal
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 2))
					Case "3" 'exibe os campos com valor monetário
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 4))
					Case "4" 'exibe os campos com valor inteiro
						Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 0))
					Case "5" 'exibe os campos do tipo memo
						Response.Write(fncExibeMemoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
					</tr>
					<%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit">
						<td height="15" colspan="<%= nr_cols%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
					<%
If objrsi.State = adStateOpen Then objrsi.Close()
Set objrsi = Nothing

objrsv.Close
objrs.Close
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
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