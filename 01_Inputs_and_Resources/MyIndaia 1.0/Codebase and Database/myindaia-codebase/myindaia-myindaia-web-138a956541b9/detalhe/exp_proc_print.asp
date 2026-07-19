<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Importação
'Arquivo de Script e HTML: Impressão da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 04/08/2005
'
'Manutenção: 04/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 360
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_cntr    'qtde de containers
Dim str_lcl     'qtde de pallets/carga solta
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados

in_show = False
cd_tela = "DET008"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "02"
'recupera os dados do processo
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_processo   = CStr(Request.QueryString("nr_processo"))
'seleciona os dados da view

url_detalhe = "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_view="&cd_view&"&nr_processo="&nr_processo&"&nr_referencia="&nr_referencia

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_proc") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 120
  .CommandText = Session("sql_exp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'inclui o numero do processo no nome da tela
nm_tela     = nm_tela &": "& Mid(nr_processo, 5, Len(nr_processo))
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.quebra {
	border: #336699 solid 1px;
}
</style>

<script language="javascript" type="text/javascript">
<!--
function exibeResumoPrint(div, vFeatures){	
	var divResumo = document.getElementById(div);
	divResumo.style.display = 'block';
	var ajax = openAjax();
	ajax.open("POST","exp_proc_resumo_print.asp?"+vFeatures, true); 
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
			divResumo.innerHTML = "<div style='position:absolute;top:40%;left:50%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
		}
		if(ajax.readyState == 4) { //agora exibe o que interessa
			if(ajax.status == 200) {
				var vResult = ajax.responseText; //resultado da busca
				vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
				vResult = unescape(vResult); //continua resolvendo problemas de acento
				divResumo.innerHTML = vResult;
			} else {
				//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
				divResumo.innerHTML = ajax.responseText;
			}
		}
	}
	ajax.send(null); // submete	
}
-->
</script>
</head>
<body style="overflow:auto;" onLoad="<%if Session("exibe_detalhe") = 0 Then%>document.getElementById('divCompletoPrint').style.display='block';<%Else%>exibeResumoPrint('divResumoPrint','<%= url_detalhe%>');<%End If%>">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<div id="divResumoPrint" style="display:none;"></div>
<div id="divCompletoPrint" style="display:none;">
<table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr>
		<td valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
				<%
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00050(cd_lang)%> - <a href="#historico" class="light"><%= tx_lang_A00055(cd_lang)%></a> - <a href="#observacao" class="light"><%= tx_lang_A00056(cd_lang)%></a></td>
				</tr>
				<%
			Case 1
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00051(cd_lang)%></td>
				</tr>
				<%
			Case 2
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00052(cd_lang)%></td>
				</tr>
				<%
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
		
	If cont = 1 Then
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
				<tr bgcolor="<%= bgcolor%>">
					<%
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003" 'nr do processo
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= UCase(Mid(nr_processo, 5, Len(nr_processo)))%>&nbsp;</td>
					<%
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= tipo_canal(x)%>&nbsp;</td>
					<%
		Case "0044" 'embarcação / vôo / caminhão
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str%>
						<%
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						Response.Write("<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>")
					End If
%>
					</td>
					<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
%>
					<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado)%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_VOO").Value%></td>
					<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
%>
					<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado)%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_CAMINHAO").Value%></td>
					<%
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str%></td>
					<%
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
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str_merc%></td>
					<%
			objrsx.Close
		Case "0097" 'numero da referencia cliente (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td style="padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" border="0">
							<%
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
						Response.Write("<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>")
						Response.Write("<td>"& str_refs(x) &"</td></tr>")
					End If
				Next
%>
						</table></td>
					<%
			End If
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= sim_nao(str)%>&nbsp;</td>
					<%
	 	Case "0123" 'RE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= fnc_Mascara(str, 1)%></td>
					<%
		Case "0159" 'DDE
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= fnc_Mascara(str, 3)%></td>
					<%
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
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str_cntr%>&nbsp;</td>
					<%
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
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str_lcl%>&nbsp;</td>
					<%
			objrsx.Close
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= str%>&nbsp;</td>
					<%
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</td>
					<%
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= x%>&nbsp;</td>
					<%
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= x%>&nbsp;</td>
					<%
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td>&nbsp;<%= z%>&nbsp;</td>
					<%
			End Select
	End Select
	If cont = 3 Then
		cont = 1
%>
				</tr>
				<%
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
objrs.Close
%>
				<tr height="0">
					<td width="15%"></td>
					<td width="35%"></td>
					<td width="15%"></td>
					<td width="35%"></td>
				</tr>
			</table></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr>
		<td width="50%" valign="top" style="border: solid 1px #336699;"><!-- **************************************************************** 

						           HISTORICO/FOLLOW-UP

***************************************************************** -->
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr class="gridtop" height="16">
					<td><a name="historico"></a>&nbsp;<%= tx_lang_A00053(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00033(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00034(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00035(cd_lang)%></td>
				</tr>
				<%
If objrs.State = adStateOpen Then objrs.Close
'Seleciona os dados do follow-up
sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM " &_
			"FROM TFOLLOWUP F ( NOLOCK ) " &_
			"  INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) " &_
			"WHERE F.NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND F.CD_EVENTO NOT IN ('022') " &_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			"ORDER BY F.NR_ORDEM"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

Do While Not objrs.Eof
  If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
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
%>
				<tr bgcolor="<%= bgcolor%>" height="13">
					<td><%= objrs.Fields.Item("CD_EVENTO").Value%> - <%= objrs.Fields.Item("NM_EVENTO").Value%></td>
					<td align="right"><%= fnc_Mascara( x, 5 )%>&nbsp;</td>
					<td align="center"><%= "<font color="& color &">"& z &"</font>"%></td>
					<td align="right"><%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</td>
				</tr>
				<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close
%>
			</table></td></tr><tr>
		<td width="50%" valign="top" style="border: solid 1px #336699;"><!-- **************************************************************** 

						           OBSERVACOES

***************************************************************** -->
			<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="2">
				<tr class="gridtop" height="16">
					<td colspan="2">&nbsp;<a name="observacao"></a><%= tx_lang_A00054(cd_lang)%></td>
				</tr>
				<%
If objrs.State = adStateOpen Then objrs.Close 
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS ( NOLOCK ) WHERE NR_PROCESSO = '"& nr_processo &"'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrs.RecordCount > 0 Then str_obs = objrs.Fields.Item("TX_OBSERVACAO").Value else str_obs = ""
If Not fnc_TestaVar(str_obs) Then str_obs = "" Else str_obs = Replace(Replace(str_obs, """", "'"), vbcrlf, "<br>")
%>
				<tr bgcolor="#EEEEEE">
					<td><%= str_obs%></td>
				</tr>
			</table></td>
	</tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
setTimeout("print();",2000);
window.focus();
-->
</script>