<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Modificado por Alexandre Gonçalves Neto em --/--/----
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim credito
Dim debito
Dim vl_item
Dim vl_saldo
Dim saldo
Dim in_restitui
Dim tipo

nr_referencia = Request.QueryString("nr_referencia")
nr_processo   = Request.QueryString("nr_processo")

Function fnc_ValorSaldo(vl_item, vl_saldo)
'calcula o valor do saldo
  If Not ( objrs("CD_TIPO_ITEM") = "B" or objrs("CD_TIPO_ITEM") = "C" ) Then
    vl_saldo = vl_saldo + vl_item
  Else
    vl_saldo = vl_saldo
  End If
  'retorna o valor do saldo
  fnc_ValorSaldo = vl_saldo
End Function
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.fatura {
	position:absolute;
	left:0px;
	top:122px;
	width:498px;
	height:228px;
	z-index:1;
	overflow:auto;
}
.fatura2 {
	position:absolute;
	left:0px;
	top:40px;
	width:500px;
	height:40px;
	z-index:1;
	overflow:auto;
}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function fnc_MostraDespesa() {
  if (isNS4) {
		var div_fat = document["fat_despesa"];
		var div_pag = document["fat_cliente"];
		var btn_fat = document["btn_desp"];
		var btn_pag = document["btn_pago"];
		div_fat.visibility = "visible";
		div_pag.visibility = "hidden";
	} else if (isDOM) {
		var div_fat = getRef('fat_despesa');
		var div_pag = getRef('fat_cliente');
		var btn_fat = getRef('btn_desp');
		var btn_pag = getRef('btn_pago');
		div_fat.style.visibility = "visible";
		div_pag.style.visibility = "hidden";
	}
}

function fnc_MostraCliente() {
  if (isNS4) {
		var div_fat = document["fat_despesa"];
		var div_pag = document["fat_cliente"];
		var btn_fat = document["btn_desp"];
		var btn_pag = document["btn_pago"];
		div_fat.visibility = "hidden";
		div_pag.visibility = "visible";
	} else if (isDOM) {
		var div_fat = getRef('fat_despesa');
		var div_pag = getRef('fat_cliente');
		var btn_fat = getRef('btn_desp');
		var btn_pag = getRef('btn_pago');
		div_fat.style.visibility = "hidden";
		div_pag.style.visibility = "visible";
	}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
<body style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
	<tr height="25" style="background-color:<%=topo_div%>;">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr align="center"><td><b>&nbsp;<%= tx_lang_POP009(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td></tr>
			</table></td>
	</tr>
    <tr height="16">
		<td>
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
    	<tr class="gridtit" style="background-color:<%=cabec_result%>;">
			<td width="166px">Número</td>
            <td width="166px">Tipo</td>
			<td width="166px"><nobr>Data de Emissão</nobr></td>
		</tr>
        </table></td>
		</tr>
        <tr height="40px">
		<td><div id="fat_nota" class="fatura2">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
        <%
    If objrsx.State = adStateOpen Then objrsx.Close()
				sql = " SELECT F.NR_NOTA_FATURA AS FATURA, F.TP_TIPO_FAT AS TIPO, CONVERT(VARCHAR,F.DT_FATURA,103) AS DATA, F.VL_FATURA AS VALOR FROM TS_FATURA F "&_
					  " INNER JOIN TS_FATURA_PROCESSO FP ON (FP.CD_UNID_NEG = F.CD_UNID_NEG "&_
                      " AND FP.CD_PRODUTO = F.CD_PRODUTO "&_
                      " AND FP.NR_SOLICITACAO = F.NR_SOLICITACAO) "&_
                      " WHERE FP.NR_PROCESSO = '" & nr_processo & "'"&_
                      " AND F.IN_CANCELADO = '0'"&_
					  " AND ISNULL(F.NR_NOTA_FATURA,'') <> ''"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				str = ""
				If objrsx.RecordCount > 0 Then
					Do While Not objrsx.Eof
						str = str & Trim(objrsx.Fields.Item("FATURA").Value) & " - " & Trim(objrsx.Fields.Item("DATA").Value) 
						If Trim(objrsx.Fields.Item("TIPO").Value) = "F" Then
							tipo = "Fatura Indaiá"
						Else
							If Trim(objrsx.Fields.Item("VALOR").Value) = 0 Then
								tipo = "Nota demonstrativa"
							End If
							If Trim(objrsx.Fields.Item("VALOR").Value) > 0 Then
								tipo = "Nota de crédito Indaiá"
							End If
							If Trim(objrsx.Fields.Item("VALOR").Value) < 0 Then
								tipo = "Nota de débito Indaiá"
							End If
						End if
						
						If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
						%>
						<tr bgcolor="<%= bgcolor%>">
                            <td width="166px"><%= Trim(objrsx.Fields.Item("FATURA").Value)%></td>
                            <td width="166px"><nobr><%= tipo%></nobr></td>
                            <td width="166px"><%= Trim(objrsx.Fields.Item("DATA").Value)%></td>
						</tr>
						<%
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
					Loop
				End If
				objrsx.Close()%>
                </table></div></td></tr>
	<tr height="25">
		<td><table height="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
                    <td>
					<a id="btn_desp" onClick="javascript: fnc_MostraDespesa();" style="cursor:pointer;">&nbsp;<input type="image" src="/imagens/30/button_view.gif" alt="<%= tx_lang_POP025(cd_lang)%>" align="absmiddle">&nbsp;<b><%= tx_lang_POP025(cd_lang)%> (Despesas Pagas)</b></a>&nbsp;&nbsp;
					<a id="btn_pago" onClick="javascript: fnc_MostraCliente();" style="cursor:pointer;">&nbsp;<input type="image" src="/imagens/30/button_view.gif" alt="<%= tx_lang_POP026(cd_lang)%>" align="absmiddle">&nbsp;<b><%= tx_lang_POP026(cd_lang)%></b></a>
				    </td>
                </tr>
			</table></td>
	</tr>
	<tr height="16">
		<td><table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
				<tr class="gridtit" style="background-color:<%=cabec_result%>;">
					<td width="75"><%= tx_lang_A00077(cd_lang)%></td>
					<td><%= tx_lang_POP027(cd_lang)%></td>
					<td width="60"><%= tx_lang_POP028(cd_lang)%></td>
					<td width="60"><%= tx_lang_POP029(cd_lang)%></td>
					<td width="86"><%= tx_lang_A00078(cd_lang)%></td>
				</tr>
			</table></td>
	</tr>
	<tr>
		<td><div id="fat_despesa" class="fatura" style="visibility:visible";>
				<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
					<%
sql = "SELECT DISTINCT "&_
			"  F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, "&_
			"  I."& tx_lang_item &" AS NM_ITEM, I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
			"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
			"  ( "&_
			"    SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM, "&_
			"      ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
			"    FROM TFATURAMENTO_CC ( NOLOCK ) "&_
			"    WHERE IN_RESTITUI  = 0 "&_
			"	     AND IN_CANCELADO = 0 "&_
			"    GROUP BY NR_PROCESSO, CD_ITEM "&_
			"  ) F, TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
			"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
			"  AND CC.CD_ITEM     = F.CD_ITEM "&_
			"  AND CC.CD_ITEM     = I.CD_ITEM "&_
			"  AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
			"  AND CC.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"	 AND CC.IN_CANCELADO = 0 "&_
			"  AND CC.IN_RESTITUI  = 0 "&_
			"  AND CC.CD_ITEM_NAO_FAT IS NULL "&_
			"  AND CC.CD_ITEM NOT IN ('990','995','996','997','998')"&_
			"  AND I.CD_TIPO_ITEM <> 'N' "&_ 
			"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_item  = 0
vl_saldo = 0
credito  = "0,00"
debito   = "0,00"
saldo    = "0,00"

in_restitui = False
'seleciona os itens restituidos
If objrsx.State = adStateOpen Then objrsx.Close
sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
			"WHERE F.CD_ITEM = I.CD_ITEM "&_
			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"  AND F.IN_CANCELADO = 0 "&_
			"  AND F.IN_RESTITUI  = 1 "&_
			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
			"GROUP BY F.NR_PROCESSO, F.CD_ITEM"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If objrsx.RecordCount > 0 Then in_restitui = True

If objrs.Eof Then
%>
					<tr>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
Else
  If objrs.RecordCount < 15 Then col = 86 Else col = 70
  Do While Not objrs.Eof
    'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#ffffff" Else bgcolor = linha_result
		'calculo do valor do item
		vl_item = objrs.Fields.Item("VL_ITEM").Value
		'verifica se ocorreu restituicao
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			str = "CD_ITEM = "& fnc_QuotedSQL(objrs.Fields.Item("CD_ITEM").Value)
			objrsx.Find str, 0, adSearchForward
			'verifica se o registro foi encontrado
			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 0) > 0 Then
			'verifica se &eacute; d&eacute;bito ou cr&eacute;dito
			credito = ""
			debito  = ""
			If objrs.Fields.Item("TP_NATUREZA").Value = "C" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
			
			vl_saldo = fnc_ValorSaldo(vl_item, vl_saldo)
			'verifica se o saldo &eacute; positivo ou negativo
			If Round(vl_saldo, 0) >= 0 Then
				saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
			Else
				saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
			End If
%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="75" height="16"><%= fnc_Mascara(objrs.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="<%= col%>" align="right"><%= saldo%></td>
					</tr>
					<%
			objrs.MoveNext
		Else
			objrs.MoveNext
		End If
		
		If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
objrsx.Close
%>
					<tr height="18">
						<td colspan="2"><i><%= tx_lang_POP030(cd_lang)%></i></td>
						<td colspan="2" align="right"><b><%= tx_lang_POP024(cd_lang)%>:</b></td>
						<td align="right"><b><%= saldo%></b></td>
					</tr>
				</table>
			</div>
			<div id="fat_cliente" class="fatura" style="visibility:hidden;">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
					<%
sql = "SELECT DISTINCT "&_
			"  F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, "&_
			"  I."& tx_lang_item &" AS NM_ITEM, I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
			"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
			"  ( "&_
			"    SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM, "&_
			"      ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
			"    FROM TFATURAMENTO_CC ( NOLOCK ) "&_
			"    WHERE IN_RESTITUI  = 0 "&_
			"	     AND IN_CANCELADO = 0 "&_
			"    GROUP BY NR_PROCESSO, CD_ITEM "&_
			"  ) F, TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
			"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
			"  AND CC.CD_ITEM     = F.CD_ITEM "&_
			"  AND CC.CD_ITEM     = I.CD_ITEM "&_
			"  AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
			"  AND CC.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"	 AND CC.IN_CANCELADO = 0 "&_
			"  AND CC.IN_RESTITUI  = 0 "&_
			"  AND CC.CD_ITEM_NAO_FAT IS NOT NULL "&_
			"  AND F.CD_ITEM      <= 900 "&_
			"  AND I.CD_TIPO_ITEM <> 'N' "&_ 
			"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC"
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

vl_item  = 0
vl_saldo = 0
credito  = "0,00"
debito   = "0,00"
saldo    = "0,00"

in_restitui = False
'seleciona os itens restituidos
If objrsx.State = adStateOpen Then objrsx.Close
sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
			"WHERE F.CD_ITEM = I.CD_ITEM "&_
			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
			"  AND F.IN_CANCELADO = 0 "&_
			"  AND F.IN_RESTITUI  = 1 "&_
			"  AND F.IN_FATURADO  = 1 "&_
			"  AND F.CD_ITEM_NAO_FAT IS NOT NULL "&_
			"  AND F.CD_ITEM < 900 "&_
			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
			"GROUP BY F.NR_PROCESSO, F.CD_ITEM"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If objrsx.RecordCount > 0 Then in_restitui = True

If objrs.Eof Then
	sql = "SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, I."& tx_lang_item &" AS NM_ITEM, I.NR_ORDEM_FAT "&_
				"FROM TFATURAMENTO_CC_CLIENTE CC (NOLOCK), "&_
				"  ( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
				"    FROM TFATURAMENTO_CC_CLIENTE (NOLOCK) "&_
				"    WHERE IN_CANCELADO = 0 "&_
				"    GROUP BY NR_PROCESSO, CD_ITEM "&_
				"  ) F, TITEM I (NOLOCK) "&_
				"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
				"  AND CC.CD_ITEM     = F.CD_ITEM "&_
				"  AND CC.CD_ITEM     = I.CD_ITEM "&_
				"  AND CC.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
				"	 AND CC.IN_CANCELADO = 0 "&_
				"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC"
	'Response.Write(sql)
	objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrsv.Eof Then
%>
					<tr>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
	Else
		If objrsv.RecordCount < 15 Then col = 86 Else col = 70
		Do While Not objrsv.Eof
			'alterna a cor das linhas
			If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
			'calculo do valor do item
			vl_item = objrsv.Fields.Item("VL_ITEM").Value
			'verifica se e debito ou credito
			credito = ""
			debito  = ""
			If objrsv.Fields.Item("CD_ITEM").Value = "990" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
			
			vl_saldo = vl_saldo + vl_item
			'verifica se o saldo &eacute; positivo ou negativo
			If Round(vl_saldo, 0) >= 0 Then
				saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
			Else
				saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
			End If
%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="65" height="16"><%= fnc_Mascara(objrsv.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td><%= Trim(objrsv.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="<%= col%>" align="right"><%= saldo%></td>
					</tr>
					<%
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
	End If
	objrsv.Close
Else
  If objrs.RecordCount < 15 Then col = 86 Else col = 70
  Do While Not objrs.Eof
    'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#ffffff" Else bgcolor = linha_result
		'calculo do valor do item
		vl_item = objrs.Fields.Item("VL_ITEM").Value
		'verifica se ocorreu restituicao
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			str = "CD_ITEM = "& fnc_QuotedSQL(objrs.Fields.Item("CD_ITEM").Value)
			objrsx.Find str, 0, adSearchForward
			'verifica se o registro foi encontrado
			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 0) > 0 Then
			'verifica se e debito ou credito
			credito = ""
			debito  = ""
			If objrs.Fields.Item("TP_NATUREZA").Value = "C" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
			'calcula o saldo
			vl_saldo = fnc_ValorSaldo(vl_item, vl_saldo)
			'verifica se o saldo &eacute; positivo ou negativo
			If Round(vl_saldo, 0) >= 0 Then
				saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
			Else
				saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
			End If
%>
					<tr bgcolor="<%= bgcolor%>">
						<td width="65" height="16"><%= fnc_Mascara(objrs.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="<%= col%>" align="right"><%= saldo%></td>
					</tr>
					<%
			objrs.MoveNext
		Else
			objrs.MoveNext
		End If
		
		If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
objrsx.Close
%>
					<tr height="18">
						<td colspan="2"><i><%= tx_lang_POP031(cd_lang)%></i></td>
						<td colspan="2" align="right"><b><%= tx_lang_POP024(cd_lang)%>:</b></td>
						<td align="right"><b><%= saldo%></b></td>
					</tr>
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
