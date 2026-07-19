<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: PAgamento de Despesas x Numerário
'
'Autor Alexandre Gonçalves Neto
'Criado: 07/02/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim nr_solic_fat 'numero da solitacacao de fatura
Dim vl_item  'valor do item do faturamento
Dim vl_desp  'armazema o valor total de despesas pagas pela indaiá
Dim vl_num   'valor do numerario
Dim vl_saldo 'valor do sado de numerario - despesas
Dim in_restitui 'verifica se existe restituição de valor na fatura
Dim in_faturados'verifica se serão exibidos valores de processos faturados, não faturados ou ambos
Dim tx_busca 'armazena o valor para a busca de item restituido

nr_processo  = Request.QueryString("nr_processo")
nr_solic_fat = Request.QueryString("nr_solic_fat")
in_faturados = Request.QueryString("in_faturados")
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu"))
cd_subm_rel = CStr(Request.QueryString("cd_subm"))
cd_view_rel = CStr(Request.QueryString("cd_view"))

If Not fnc_TestaVar(nr_solic_fat) Then
	str = " IS NULL "
Else
	str = " = "& fnc_QuotedSQL(nr_solic_fat)
End If

vl_num  = 0
vl_item = 0
in_restitui = False
sql = "SELECT MAX(DT_LANCAMENTO) AS DT_LANCAMENTO, ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
			"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
			"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"  AND NR_SOLIC_FAT "& str &_
			"  AND IN_CANCELADO = 0 "&_
			"  AND CD_ORIGEM_LANC <> '5' "&_
			"  AND ( "& fnc_QuotedSQL(in_faturados) &" IN ( IN_FATURADO, 'X' ) ) "&_
			"  AND CD_ITEM = '991' "
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'seleciona os itens restituidos
If objrs.RecordCount > 0 Then
	If objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_RESTITUI "&_
				"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
				"  AND NR_SOLIC_FAT "& str &_
				"  AND IN_CANCELADO = 0 "&_
				"  AND CD_ORIGEM_LANC <> '5' "&_
				"  AND ( "& fnc_QuotedSQL(in_faturados) &" IN ( IN_FATURADO, 'X' ) ) "&_
				"  AND CD_ITEM IN ( '992', '993' ) "
	'Response.Write(sql &"<br>")
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	If objrsx.RecordCount > 0 Then in_restitui = True
	
	vl_item = objrs.Fields.Item("VL_ITEM").Value
	If in_restitui Then
		vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
	End If
	vl_num = vl_num + vl_item
	
	objrsx.Close()
End If
objrs.Close()

vl_desp     = 0
in_restitui = False
'seleciona os dados do faturamento
sql = "SELECT F.CD_ITEM, I."& tx_lang_item &" AS NM_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_ITEM, "&_
			"  ISNULL(SUM(F.VL_ASSIST), 0) AS VL_ASSIST, MAX(F.DT_LANCAMENTO) AS DT_LANCAMENTO "&_
			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
			"WHERE F.CD_ITEM = I.CD_ITEM "&_
			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"  AND F.NR_SOLIC_FAT "& str &_
			"  AND F.IN_CANCELADO = 0 "&_
			"  AND F.IN_RESTITUI  = 0 "&_
			"  AND ( "& fnc_QuotedSQL(in_faturados) &" IN ( F.IN_FATURADO, 'X' ) ) "&_
			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
			"  AND CD_ORIGEM_LANC <> '5' "&_
			"  AND F.CD_ITEM < 900 "&_
			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
			"GROUP BY F.NR_PROCESSO, F.NR_SOLIC_FAT, F.CD_ITEM, I."& tx_lang_item &" "&_
			"ORDER BY DT_LANCAMENTO ASC "
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'seleciona os itens restituidos
If objrsx.State = adStateOpen Then objrsx.Close
sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
			"WHERE F.CD_ITEM = I.CD_ITEM "&_
			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"  AND F.NR_SOLIC_FAT "& str &_
			"  AND F.IN_CANCELADO = 0 "&_
			"  AND F.IN_RESTITUI  = 1 "&_
			"  AND ( "& fnc_QuotedSQL(in_faturados) &" IN ( F.IN_FATURADO, 'X' ) ) "&_
			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
			"  AND CD_ORIGEM_LANC <> '5' "&_
			"  AND F.CD_ITEM < 900 "&_
			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
			"GROUP BY F.NR_PROCESSO, F.NR_SOLIC_FAT, F.CD_ITEM"
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If objrsx.RecordCount > 0 Then in_restitui = True
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.fatura {
	position:absolute;
	left:0px;
	top:41px;
	width:400px;
	height:181px;
	z-index:1;
	overflow:auto;
}

.saldo {
	color: #000000;
	font-weight: bold;
	background: #EEEEEE;
	border: solid 1px;
	border-color: #AAAAAA #333333 #333333 #AAAAAA;
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
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DDDDDD">
	<tr height="25">
		<td colspan="3" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= tx_lang_POP008(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<tr height="16">
		<td width="75" class="ttbpopup">&nbsp;<%= tx_lang_A00077(cd_lang)%></td>
		<td width="230" class="ttbpopup">&nbsp;<%= tx_lang_A00074(cd_lang)%></td>
		<td width="105" class="ttbpopup">&nbsp;<%= tx_lang_A00078(cd_lang)%></td>
	</tr>
	<tr>
		<td colspan="3"><div id="fatura" class="fatura">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<%
If objrs.RecordCount > 0 Then
	If objrs.RecordCount < 15 Then col = 83 Else col = 67
	Do While Not objrs.Eof
		'alterna a cor das linhas
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'calculo do valor do item
		vl_item = objrs.Fields.Item("VL_ITEM").Value
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			tx_busca = "CD_ITEM = "& fnc_QuotedSQL(objrs.Fields.Item("CD_ITEM").Value)
			objrsx.Find tx_busca, 0, adSearchForward
			'verifica se o registro foi encontrado
			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 2) > 0 Then
			vl_desp = vl_desp + vl_item
%>
					<tr>
						<td align="left" width="75" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 1px;"><nobr>&nbsp;<%= fnc_Mascara(objrs.Fields.Item("DT_LANCAMENTO").Value, 5)%></nobr></td>
						<td align="left" width="" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 0px;"><nobr>&nbsp;<%= objrs.Fields.Item("NM_ITEM").Value%></nobr></td>
						<td align="left" width="20" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr>R$&nbsp;</nobr></td>
						<td align="right" width="<%= col%>" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr><%= FormatNumber(vl_item, 2)%>&nbsp;</nobr></td>
					</tr>
					<%
			objrs.MoveNext
		Else
			objrs.MoveNext
		End If
		
		If objrs.Eof Then Exit Do
	Loop
	objrsx.Close()
	'calcula o valor do saldo
	vl_saldo = vl_num - vl_desp
	
	If Not fnc_TestaVar(vl_saldo) Then
		vl_saldo = 0
	Else
		vl_saldo = Round(vl_saldo, 2)
		If vl_saldo > 0 Then
			sql = "SELECT CD_ITEM, VL_ITEM, DT_LANCAMENTO "&_
						"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
						"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
						"  AND IN_CANCELADO = 0 "&_
						"  AND CD_ORIGEM_LANC <> '5' "&_
						"  AND CD_ITEM = '997' "&_
						"  AND VL_ITEM = "& Replace(Abs(vl_saldo), ",", ".")
		End If
		If vl_saldo < 0 Then
			sql = "SELECT CD_ITEM, VL_ITEM, DT_LANCAMENTO "&_
						"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
						"WHERE NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
						"  AND IN_CANCELADO = 0 "&_
						"  AND CD_ORIGEM_LANC <> '5' "&_
						"  AND CD_ITEM = '998' "&_
						"  AND VL_ITEM = "& Replace(Abs(vl_saldo), ",", ".")
		End If
		'Response.Write(sql &"<br>")
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
		If objrsx.RecordCount > 0 Then
			vl_item = objrsx.Fields.Item("VL_ITEM").Value
			'verifica se o tipo de saldo é devedor ou credor e faz a liquidação
			If objrsx.Fields.Item("CD_ITEM").Value = "997" Then
				vl_saldo = vl_saldo - vl_item
			End If
			If objrsx.Fields.Item("CD_ITEM").Value = "998" Then
				vl_saldo = vl_saldo + vl_item
			End If
			'alterna a cor das linhas
			If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
%>
					<tr>
						<td align="left" width="75" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 1px;"><nobr>&nbsp;<%= fnc_Mascara(objrsx.Fields.Item("DT_LANCAMENTO").Value, 5)%></nobr></td>
						<td align="left" width="" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 1px 1px 0px;"><nobr>&nbsp;<%= fnc_ConsultaLookup("TITEM", "CD_ITEM", objrsx.Fields.Item("CD_ITEM").Value, "NM_ITEM")%></nobr></td>
						<td align="left" width="20" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr>R$&nbsp;</nobr></td>
						<td align="right" width="<%= col%>" bgcolor="<%= bgcolor%>" style="border: solid #FFFFFF; border-width: 0px 0px 1px 0px;"><nobr><%= FormatNumber(vl_item, 2)%>&nbsp;</nobr></td>
					</tr>
					<%
		End If
		objrsx.Close
	End If
	
	If vl_saldo < 0 Then
		str = " color:#FF0000;"
		vl_saldo = Abs(vl_saldo)
	Else
		str = " color:#0000FF;"
	End If
Else
%>
					<tr>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
End If
%>
				</table>
			</div></td>
	</tr>
	<tr height="62">
		<td colspan="3"><table width="325" height="100%" border="0" align="right" cellpadding="0" cellspacing="1">
				<tr>
					<td class="saldo">&nbsp;<%= tx_lang_POP022(cd_lang)%><br>
						&nbsp;R$ <%= FormatNumber(vl_num, 2)%></td>
					<td rowspan="2" width="95" class="saldo" align="center" style="font-size:12px;"><%= tx_lang_POP024(cd_lang)%><br>
						R$ <span style="<%= str%>"><%= FormatNumber(vl_saldo, 2)%></span></td>
				</tr>
				<tr>
					<td class="saldo">&nbsp;<%= tx_lang_POP023(cd_lang)%><br>
						&nbsp;R$ <%= FormatNumber(vl_desp, 2)%></td>
				</tr>
			</table></td>
	</tr>
	<tr height="15" align="center">
		<td colspan="3" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
						Internacional</a></b></p></td>
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
