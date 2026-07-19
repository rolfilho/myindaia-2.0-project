<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Container Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300

Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim str_refs()  'armazena os valores das referencias
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_ev_fup
Dim tx_folder
Dim nr_dias_cobrar
Dim nr_dias_corridos
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "POP001"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "03"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel   = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel   = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel   = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
cd_unid_neg = Mid(nr_processo, 1, 2)
cd_produto  = Mid(nr_processo, 3, 2)
'configurações de acordo com o grupo
If cd_produto = "01" or cd_produto = "03" Then
	cd_ev_fup = "162"
	tx_folder = "import"
End If
If cd_produto = "02" or cd_produto = "10" Then
	cd_ev_fup = "132"
	tx_folder = "export"
	tx_nao_exibe = "0050','0051','0052','0483','0510','0513','0514','0515','0521','0523','0524','0525"
End If
'seleciona os dados da view
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.cntr {
	position:relative;
	width:550px;
	height:100%;
	z-index:1;
	overflow:auto;
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

MM_reloadPage(true);
//-->
</script>
</head>

<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
	<tr height="25" style="background-color:<%=topo_div%>;">
		<td colspan="3">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="text-align:center;">&nbsp;<b><%= tx_lang_POP055(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td>					
				</tr>
			</table></td>
	</tr>
	<tr height="100">
		<td><table width="100%" border="0" cellspacing="1" cellpadding="1">
		<%
'dados básicos do relatório
sql_s = "SELECT DISTINCT PR.NR_PROCESSO, "
'tabelas básicas utilizadas
sql_f = "FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TFOLLOWUP FU (NOLOCK) ON (FU.NR_PROCESSO = PR.NR_PROCESSO AND FU.CD_EVENTO = '"& cd_ev_fup &"') "
'opções de pesquisa básica
sql_w = "WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
'move para o primeiro registro
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
'monta o select de acordo com os campos selecionados
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M12_TP_GRUPO").Value = 0 Then
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			'Tabela Direto/Array 'Lookup
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "0" Then
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0","5" 'String/Text
						sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "1" 'Datetime
						'Outras datas vindas de outras tabelas
						sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "2","3","4" 'Decimal/Moeda/Inteiro
						sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				End Select
			End If
			'Lookup
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "1" Then
				sql_s = sql_s &_
								"( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'Array
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "2" Then
				sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
		Else
			'campos que não podem ser montados a partir de regras padrões.	
		End If
	End If
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
'monta sql e executa
sql = Left(sql_s, Len(sql_s)-2) &" "& sql_f & sql_w
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'move para o primeiro registro
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
'exibe somente os campos do cabeçalho
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M12_TP_GRUPO").Value = 0 Then
		'alterna a cor de fundo da linha
		If bgcolor = linha_result Then bgcolor = "#FEFEFE" Else bgcolor = linha_result
		'seleciona o nome do campo que será personalizado.
		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'aplica a personalização
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0045" 'viagem
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo"  style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="left"><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item(nm_campo_rel).Value, 4)%>&nbsp;</nobr></td>
					</tr>
					<%
			Case "0097" 'numero das referencias (TREF_CLIENTE)
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
							"FROM TREF_CLIENTE (NOLOCK) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
							"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount > 0 Then
					ReDim str_refs(Ubound(tipo_referencia))
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" width="125" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td style="padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" border="0">
						<%
					Do While Not objrsx.Eof
						x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
						str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
						'verifica se tem item essa referencia
						nr_item_clnte = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
						If fnc_TestaVar(nr_item_clnte) Then nr_item_clnte = nr_item_clnte Else nr_item_clnte = 0
						If nr_item_clnte <> "" Then str_refs(x) = str_refs(x) &"/"& nr_item_clnte
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
					Loop
					
					For x = 0 To UBound(tipo_referencia)
						If Len(str_refs(x)) > 0 Then
							Response.Write("<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>")
							Response.Write("<td>"& str_refs(x) &"</td></tr>")
						End If
					Next
%>
					</table></td></tr>
					<%
				End If
				objrsx.Close
			Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						str = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
					</tr>
					<%
					Case "1" 'exibe os campos de datas
						y = objrs.Fields.Item(nm_campo_rel).Value
%>
          <tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="left"><nobr>&nbsp;<font color="<%= color%>"><%= fnc_Mascara(y, 5)%></font>&nbsp;</nobr></td>
					</tr>
					<%
					Case "2" 'exibe os campos com valor decimal
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="left"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
					</tr>
					<%
					Case "3" 'exibe os campos com valor monetário
						x = objrs.Fields.Item(nm_campo_rel).Value
						If fnc_TestaVar(x) Then x = FormatNumber(x, 2)
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="right"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
					</tr>
					<%
					Case "4"
						z = objrs.Fields.Item(nm_campo_rel).Value
%>
					<tr bgcolor="<%= bgcolor%>" height="14">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
						<td align="left"><nobr>&nbsp;<%= z%>&nbsp;<nobr></td>
					</tr>
					<%
				End Select
			End Select
	End If
  objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
objrs.Close
%>
		</table></td>
	</tr>
	<!--  INFORMAÇÕES DE CONTAINERS  -->
	<tr>
		<td colspan="3"><div id="cntr" class="cntr" >
			<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
				<tr height="25" class="gridtit" style="background-color:<%=cabec_result%>;">
				<%
'dados básicos do relatório
sql_s = "SELECT PC.NR_PROCESSO, PC.NR_CNTR, "
'tabelas básicas utilizadas
sql_f = "FROM TPROCESSO_CNTR PC (NOLOCK) "
'opções de pesquisa básica
sql_w = "WHERE PC.NR_PROCESSO = '"& nr_processo &"' AND PC.TP_CNTR <> '01' "
'opções de ordenação básica
sql_o = "ORDER BY PC.NR_CNTR"
'inicia a montagem dos campos que serão selecionados
If objrsv.RecordCount > 0 Then
	objrsv.MoveFirst 
Else 
	tx_erro = tx_erro &"\n"& tx_lang_A00089(cd_lang) &"."
End If
'aplica personalização
Do While Not objrsv.Eof
	If objrsv.Fields.Item("M12_TP_GRUPO").Value = 1 Then
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			'Tabela Direto/Array 'Lookup
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "0" or objrsv.Fields.Item("M10_TP_CONSULTA") = "1" Then
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0","5" 'String/Text
						sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "1" 'Datetime
						'Outras datas vindas de outras tabelas
						sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "2","3","4" 'Decimal/Moeda/Inteiro
						sql_s = sql_s &" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				End Select
			End If
			'Array
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "2" Then
				sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
		Else
			'campos que não podem ser montados a partir de regras padrões.	
		End If
	End If
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
sql_s = Left(sql_s, Len(sql_s)-2) &" "
'monta sql e executa
sql = sql_s & sql_f & sql_w & sql_o
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

objrsv.MoveFirst
If objrs.RecordCount > 0 Then
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_TP_GRUPO").Value = 1 Then
%>
					<td><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<%
  	End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
				</tr>
				<%
	Do While Not objrs.Eof
		'alterna a cor de fundo da linha
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
				<tr height="14" bgcolor="<%= bgcolor%>">
				<%
		'calculo de cias corridos e dias cobrados.
		With objcmd
			.CommandTimeOut = 60
			.CommandText    = "sp_calc_dias_cntr"
			.CommandType    = adCmdStoredProc
			.Parameters.Append = .CreateParameter("@nr_processo"     , adChar   , adParaminput , 18, objrs.Fields.Item("NR_PROCESSO").Value)
			.Parameters.Append = .CreateParameter("@nr_cntr"         , adChar   , adParaminput , 20, objrs.Fields.Item("NR_CNTR").Value)
			.Parameters.Append = .CreateParameter("@nr_dias_corridos", adInteger, adParamOutPut,   , 0)
			.Parameters.Append = .CreateParameter("@nr_dias_cobrar"  , adInteger, adParamOutPut,   , 0)
			.Execute nrec, , adExecuteNoRecords
			nr_dias_cobrar   = .Parameters("@nr_dias_cobrar")
			nr_dias_corridos = .Parameters("@nr_dias_corridos")
			.Parameters.Delete("@nr_processo")
			.Parameters.Delete("@nr_cntr")
			.Parameters.Delete("@nr_dias_corridos")
			.Parameters.Delete("@nr_dias_cobrar")
		End With
		objrsv.MoveFirst
		'aplica a personalização
		Do While Not objrsv.Eof
			If objrsv.Fields.Item("M12_TP_GRUPO").Value = 1 Then
				'seleciona o nome do campo que será personalizado.
				nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
				Select Case objrsv.Fields.Item("M10_CD_DADO").Value
					Case "0015" 'tipo de container
%>
					<td><nobr>&nbsp;<%= tipo_cntr(CInt(objrs.Fields.Item(nm_campo_rel).Value)-1)%>&nbsp;</nobr></td>
					<%
					Case "0046" 'nr container
%>
					<td><nobr>&nbsp;<a href="#" onClick="window.opener.location.href='/<%= tx_folder%>/track_busca.asp?filtro=nr_cntr&nr_cntr=<%= Trim(objrs("NR_CNTR"))%>&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>';window.close();"><%= fnc_Mascara(objrs.Fields.Item("NR_CNTR").Value, 0)%></a>&nbsp;<nobr></td>
					<%
					Case "0051" 'dias corridos
%>
					<td align="right"><nobr>&nbsp;<%= nr_dias_corridos%>&nbsp;<nobr></td>
					<%
					Case "0052" 'dias cobrar
%>
					<td align="right"><nobr>&nbsp;<%= nr_dias_cobrar%>&nbsp;<nobr></td>
					<%
					Case "0513","0514","0524","0525","0529" 'sim/não campo in_urgente e in_seguro
						str = objrs.Fields.Item(nm_campo_rel).Value
						If Not fnc_TestaVar(str) Then str = 0
%>
					<td align="center"><nobr>&nbsp;<%= sim_nao(str)%>&nbsp;</nobr></td>
					<%
					Case Else
						Select Case objrsv.Fields.Item("M10_TP_DADO").Value
							Case "0" 'exibe os campos de texto simples
								str = objrs.Fields.Item(nm_campo_rel).Value
								If fnc_TestaVar(str) Then str = Trim( objrs.Fields.Item(nm_campo_rel).Value )
%>
					<td align="left"><nobr>&nbsp;<%= str%>&nbsp;</nobr></td>
					<%
							Case "1" 'exibe os campos de datas
								y = objrs.Fields.Item(nm_campo_rel).Value
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
							Case "4"
								z = objrs.Fields.Item(nm_campo_rel).Value
%>
					<td align="right"><nobr>&nbsp;<%= z%>&nbsp;<nobr></td>
					<%
						End Select
				End Select
			End If
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
%>
				</tr>
				<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
Else
	Response.Write("<tr><td>"& tx_lang_A00081(cd_lang) &".</td></tr>")
End If
objrs.Close
%>
			</table>
		</div></td>
	</tr>	
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->