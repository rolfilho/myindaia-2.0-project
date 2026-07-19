<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Demons. Fin. / Solicitação de Numerário
'Arquivo de Script e HTML: Exibição parcial dos resultados obtidos
'
'Autor: Alexandre Gonçalves Neto
'Criado: 03/05/2006
'
'Manutenção: 17/09/2008 - Flávio Henrique
'---------------------------------------------------------------------------


'  SELECT DISTINCT R.NR_PROCESSO, R.NR_REFERENCIA, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE,TNI.CD_ITEM,
'  TI.NM_ITEM, ( SELECT TOP 1 NM_EMPRESA FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = PR.CD_IMPORTADOR ) AS NM_IMPORTADOR,
'  F1.IN_APLICAVEL AS IN_DT_EV507, F1.DT_PREVISTA AS PVT_DT_EV507, F1.DT_REALIZACAO AS RLZ_DT_EV507,
'  ( SELECT TOP 1 MAX(VL_SOLICITADO) FROM TNUMERARIO ( NOLOCK ) WHERE NR_PROCESSO = NM.NR_PROCESSO ) AS VL_SOLICITADO 
'  FROM TREL_FAT_SOLIC_NUM R ( NOLOCK ) 
'  INNER JOIN TPROCESSO PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) 
'  INNER JOIN TNUMERARIO NM ( NOLOCK ) ON ( NM.NR_PROCESSO = R.NR_PROCESSO ) 
'  LEFT JOIN TFOLLOWUP F1 ( NOLOCK ) ON ( F1.NR_PROCESSO = PR.NR_PROCESSO AND F1.CD_EVENTO = '507') 
'  INNER JOIN TNUMERARIO_ITEM TNI ( NOLOCK ) ON ( TNI.NR_PROCESSO = R.NR_PROCESSO AND TNI.NR_SOLICITACAO = NM.NR_SOLICITACAO ) 
'  INNER JOIN TITEM TI ( NOLOCK ) ON ( TI.CD_ITEM = TNI.CD_ITEM ) WHERE R.CD_USUARIO = '1586' AND R.NR_IDENT = 6 
'  ORDER BY R.NR_PROCESSO ASC 
'
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300

Dim sql_s      'monta o select da query com os campos a serem exibidos
Dim sql_f      'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w      'monta o where da query
Dim sql_o      'monta a ordenação da query
Dim pagina     'pagina inicial da ordenação
Dim ap_filtro  'nome do filtro selecionado para a consulta
Dim ap_filtros 'nome dos filtros utilizados
Dim tx_path_det'caminho do arquivo de detalhe de processo

in_comodo = "1"
in_show  = False
cd_tela  = "FAT011"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request.QueryString("p"))
nr_data  = Request.QueryString("nr_data")
ap_filtros   = Replace(Request.QueryString("filtro"),", ","','")
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
'Session("sql_fat_solic_num") = Null
If Not fnc_TestaVar(Session("sql_fat_solic_num")) Then
  'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.NR_REFERENCIA, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, NM.DT_RECEBIMENTO AS DT_RECEBIMENTO,"
	'tabelas da busca
  sql_f = "FROM TREL_FAT_SOLIC_NUM R ( NOLOCK ) "&_
					"  INNER JOIN TPROCESSO  PR ( NOLOCK ) ON ( PR.NR_PROCESSO = R.NR_PROCESSO ) "&_
					"  INNER JOIN TNUMERARIO NM ( NOLOCK ) ON ( NM.NR_PROCESSO = R.NR_PROCESSO ) " &_
					"  INNER JOIN TNUMERARIO_ITEM TNI ( NOLOCK ) ON ( TNI.NR_PROCESSO = R.NR_PROCESSO AND TNI.NR_SOLICITACAO = NM.NR_SOLICITACAO AND TNI.VL_SOLICITADO<>0) "&_
					"  LEFT JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = R.NR_PROCESSO AND POI.NR_ITEM_CLIENTE = TNI.CD_ITEM) "&_
					"  INNER JOIN TITEM TI ( NOLOCK ) ON ( TI.CD_ITEM = TNI.CD_ITEM ) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
					"  AND R.NR_IDENT   =  "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then sql_o = sql_o &" R."& tipo_quebra(tp_quebra) &" ASC, "
	If in_embarque Then
		sql_o = sql_o & " R.NR_PROCESSO ASC "
	Else
		sql_o = sql_o & " R.NR_REFERENCIA ASC "
	End If
	'inicia a montagem dos campos que serão selecionados
	nr_data = 0 'qtde de eventos selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		'verifica se o campo é montado dinamicamente e de acordo com valores padrão
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_CONSULTA")
				Case 0 'pega o valor direto da tabela indicada no "FROM"
					'verifica o tipo de dado
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case 0, 5 'campos de texto
							sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
						Case 1 'campos de data
							If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
								nr_data = nr_data + 1
								sql_s = sql_s &_
												" F"& nr_data &".IN_APLICAVEL AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_data &".DT_PREVISTA AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
												" F"& nr_data &".DT_REALIZACAO AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								sql_f = sql_f &_
												" LEFT JOIN TFOLLOWUP F"& nr_data &" ( NOLOCK ) ON ( F"& nr_data &".NR_PROCESSO = PR.NR_PROCESSO AND F"& nr_data &".CD_EVENTO = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"') "
							Else
								sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
							End If
						Case 2, 3, 4 'campos numericos
							sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					End Select
				Case 1 'o valor vem atraves da consulta em outra tabela
					sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 2 'campos que retornam numeros para consulta em array
					sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case 3 'campos que são calculados.
			End Select
		Else
			'campos que não podem ser montados a partir de um padrão
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_fat_solic_num") = sql_s & sql_f & sql_w & sql_o
	'Response.write sql_s & sql_f & sql_w & sql_o
	'Response.end
	
		'response.Redirect("../import/teste.asp?var1="&Session("sql_fat_solic_num"))

Else
		'response.Redirect("../import/teste.asp?var1="&Session("sql_fat_solic_num"))
  If not fnc_TestaVar(nr_data) Then
		sql = "SELECT COUNT(*) AS VL_TOTAL "&_ 
					"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
					"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
					"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
					"WHERE M14_CD_VIEW     = '"& cd_view &"' "&_
					"  AND M12_TP_EXIBIR  >= '"& Session("tp_exibir") &"' "&_
					"  AND M12_IN_ATIVO    =  1  "&_
					"  AND M10_IN_ATIVO    =  1  "&_
					"  AND M10_TP_DADO     = '1' "&_
					"  AND M10_TP_CONSULTA = '0' "&_
					"  AND M10_CD_BROKER IS NOT NULL"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'qtde de datas no relatório
		nr_data = objrsx.Fields.Item("VL_TOTAL").Value
		'fecha a conexão
		objrsx.Close
	End If
End If
'Response.Write(Session("sql_fat_solic_num"))
	'response.Write(sql_s & sql_f & sql_w & sql_o)

Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_fat_solic_num") &"<br>"

With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_fat_solic_num")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("referencia") <> "" Then
  'escolhe o tipo da referencia
'  If Request("tipo_referencia") = "01" Then
  str = "NR_REFERENCIA = '"& Request("referencia") &"'"
  'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
		pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
  nr_referencia = ""
  objrs.AbsolutePage = CInt(pagina)
End If

col = (objrsv.RecordCount - nr_data) + (nr_data * 3)
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url &_
			"&nr_data="& nr_data &_
			"&nr_cols="& col

tx_path_file  = "/fatura/solic_num_print"
tx_path_excel = "/excel/fat_solic_num"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "solic_num_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}

function abreSolicNum(nr_processo) {
	features = "top=20,left=20,width=400,height=300,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_solic_num.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"solic_num",features);
}

function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
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
<style type="text/css">
<!--
#apDiv1 {
	left: -320;
}

#apDiv555 {
	display:none;
}
-->
</style>
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="50" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
				<%
Dim tx_tit_cols
Dim tx_sub_cols

tx_tit_cols = ""
tx_sub_cols = ""
objrsv.MoveFirst
'se tiver data prevista define se colunas e linhas seram agrupadas
If in_dt_prev Then 
  vl_colspan  = " colspan='3'"
	vl_rowspan  = " rowspan='2'"
	For x = 1 to nr_data
		tx_sub_cols = tx_sub_cols &_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00033(cd_lang) &"</td>"&_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00034(cd_lang) &"</td>"&_
			"<td style='background-color:" & cabec_result & ";'>"& tx_lang_A00035(cd_lang) &"</td>"
	Next
	tx_sub_cols = "<tr height='15' class='gridsub'>"& tx_sub_cols &"</tr>"
Else
  vl_colspan  = ""
	vl_rowspan  = ""
End If
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") = "10" Then
		tx_tit_cols = tx_tit_cols &"<td"& vl_colspan &" style='background-color:" & cabec_result & ";'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>"
	Else
    tx_tit_cols = tx_tit_cols &"<td"& vl_rowspan &" style='background-color:" & cabec_result & ";'>"& objrsv.Fields.Item("M10_NM_DADO").Value &"</td>"
	End If
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
Response.Write("<tr class='gridtit' style='background-color:" & cabec_result & ";'>"& tx_tit_cols &"</tr>"& tx_sub_cols)

cd_campo_quebra = ""
nrec            = 0
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
	'alterna a cor das linhas
	If bgcolor = linha_result Then bgcolor = "#EDEDED" Else bgcolor = linha_result
       if fnc_TestaVar(objrs("DT_RECEBIMENTO")) then bgcolor ="#C7E7FE" end if 
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
	If fnc_TestaVar(tp_quebra) Then
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra(tp_quebra)).Value Then
%>
					<tr>
						<td height="20" colspan="<%= col%>" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra(tp_quebra, objrs.Fields.Item(tipo_quebra(tp_quebra)).Value)%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item(tipo_quebra(tp_quebra)).Value
	End If
%>
					<tr height="15" bgcolor="<%= bgcolor%>" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	'dados do prcesso
	nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
	'verifica qual o produto
	If Mid(nr_processo, 3, 2) = "01" Then tx_path_det = "/detalhe/imp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&nr_referencia="& nr_referencia &"&nr_item_clnte="& nr_item_clnte &"&filtro=nr_processo&nr_processo="& nr_processo
	If Mid(nr_processo, 3, 2) = "02" Then tx_path_det = "/detalhe/exp_proc_result.asp?cd_menu_rel="& cd_menu &"&cd_subm_rel="& cd_subm &"&cd_view_rel="& cd_view &"&filtro=nr_processo&nr_processo="& nr_processo
	
	Do While Not objrsv.Eof
		nm_campo_rel = objrsv.Fields.Item("M10_AP_CAMPO").Value
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0003" 'Nr. do Processo
%>
						<td align="center"><nobr>&nbsp;<a href="<%= tx_path_det%>"><%= Mid(nr_processo, 5, 13)%></a>&nbsp;</nobr></td>
						<%
			Case "0018","0094","0096","0097","0098","0099","0100","0101","374" 'Nr.Referencia - Item
				If objrsv.Fields.Item("M10_CD_BROKER").Value = tp_ref_cli Then
				  nr_referencia = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					str           = Null
				Else
					If objrsx.State = adStateOpen Then objrsx.Close()
					sql = "SELECT DISTINCT CD_REFERENCIA, NR_SEQUENCIA "&_
								"FROM TREF_CLIENTE ( NOLOCK ) "&_
								"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
								"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
								"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
								'response.Redirect("../import/teste.asp?var1="&SQL)

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'agrupa todas as referencias na string para aparecerem como hint
					If objrsx.RecordCount > 0 Then
						nr_referencia = Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
						str           = ""
						'agrupa todas as referencias na string para aparecerem como hint
						Do While Not objrsx.Eof
							str = str & Trim( objrsx.Fields.Item("CD_REFERENCIA").Value )
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do Else str = str & vbcrlf
						Loop
					Else
						nr_referencia = Null
						str           = Null
					End If
					objrsx.Close()
				End If
%>
            <td align="left" title="<%= str%>"></nobr>&nbsp;<a href="<%= tx_path_det%>"><%= nr_referencia%></a>&nbsp;</nobr></td>
            <%Case "0019"
            nr_item_clnte=Trim(objrs.Fields.Item("CD_ITEM").Value)%>
			<td align="right"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
            <%Case "0640"
            nr_item_clnte=Trim(objrs.Fields.Item("NM_ITEM").Value)
           %>

			<td align="left"><nobr>&nbsp;<%= nr_item_clnte%>&nbsp;</nobr></td>
            <%Case "0641"
            nr_item_clnte=Trim(objrs.Fields.Item("VAL_ITEM").Value)
           %>

			<td align="left"><nobr>&nbsp;<%= FormatCurrency(nr_item_clnte,2)%>&nbsp;</nobr></td>
<%
			Case "0170" 'qtde e tipo de Container
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
			Case "0354" 'Valor total da solicitação do numerário
				x = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr>&nbsp;<a href="#" onClick="abreSolicNum('<%= nr_processo%>');"><%= FormatCurrency(x, 2)%></a>&nbsp;</nobr></td>
						<%
			Case Else
					'response.Redirect("../import/teste.asp?var1="&nm_campo_rel)

				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
						<%
					Case "1" 'exibe os campos de datas
						color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
						w = objrs.Fields.Item("IN_"& nm_campo_rel).Value
						x = objrs.Fields.Item("PVT_"& nm_campo_rel).Value
						y = objrs.Fields.Item("RLZ_"& nm_campo_rel).Value
						z = Null
						
						If (Not fnc_TestaVar(w)) or (w = 0) Then
							color = "#999999" 'cor da fonte
							x = "-" 'data prevista
							y = "Não Aplicável" 'data realizada
							z = "-" 'diferença de dias
						Else
							'se a data prevista existir
							If IsDate(x) Then
								'se a data realizada existir
								If IsDate(y) Then
									z = fnc_DiasUteisKPI(x, y, 0)
								Else
									z = fnc_DiasUteisKPI(x, Date(), 0)
								End If
								'muda a cor do lead-time conforme o resultado
								If z < 0 Then 
									color = "#0000FF" 'azul
								ElseIf z > 0 Then
									z     = "+"& z
									color = "#FF0000" 'vermelho
								End If
							End If
						End If
						'verifica se exibe a data prevista
						If in_dt_prev Then
%>
            <td align="center"><nobr>&nbsp;<%= fnc_Mascara(x, 5)%>&nbsp;</nobr></td>
						<td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= z %></font>&nbsp;</nobr></td>
						<%
						End If
%>
            <td align="center"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara(y, 5)%></font>&nbsp;</nobr></td>
						<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
						<%
					Case "4" 'exibe os campos com valor inteiro
						z = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(z) Then z = "" 
						'coloca espaços a frente do valor para deixar a coluna espaçada.
						Do While Len(z) < 10
							z = "#"& z
						Loop
						z = Replace(z, "#", "&nbsp;")
%>
						<td align="right"><nobr>&nbsp;<%= z%>&nbsp;</nobr></td>
						<%
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
					<tr class="gridtit" style="background-color:<%=cabec_result%>">
						<td height="15" colspan="<%= col%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
					</tr>
					<%
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