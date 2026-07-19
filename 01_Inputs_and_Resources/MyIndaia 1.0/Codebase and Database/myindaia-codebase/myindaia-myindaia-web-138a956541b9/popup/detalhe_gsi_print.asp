<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - 
'Arquivo de Script e HTML: 
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/02/2006
'
'Manutenção:
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim cd_familia_prod 'código da família de produtos
Dim cd_pais_destino 'código do pais de destino
Dim cd_unid_neg 'unidade de negociação
Dim cd_produto  'código do produto
Dim cd_sequencia

cd_familia_prod = Request.QueryString("cd_familia_prod")
cd_pais_destino = Request.QueryString("cd_pais_destino")
cd_sequencia = Request.QueryString("nr_sequencial")
cd_unid_neg = Request.QueryString("cd_unid_neg")
cd_produto  = Request.QueryString("cd_produto")

nm_tela = "General Shipment Instruction"
'seleciona na base de dados para exibir o resultado
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT "&_
			"  ( "&_
			"    SELECT DESCRICAO "&_
			"    FROM TTP_DOCUMENTO ( NOLOCK ) "&_
			"    WHERE CODIGO = CD_DOCUMENTO "&_
			"      AND CD_UNID_NEG = "& fnc_QuotedSQL(cd_unid_neg) &_
			"      AND CD_PRODUTO  = "& fnc_QuotedSQL(cd_produto) &_
			"  ) AS NM_DOCUMENTO, "&_
			"  TP_LOCAL, TX_INSTRUCAO, DT_ALTERACAO "&_
			"FROM TFAMILIA_DOCS ( NOLOCK ) "&_
			"WHERE CD_FAMILIA_PROD = "& fnc_QuotedSQL(cd_familia_prod) &_
			"  AND NR_SEQUENCIAL   = " & cd_sequencia
'Response.Write(sql &"<br>")
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrsx.State = adStateOpen Then objrsx.Close
sql = "SELECT NR_DIA_PERFORMACE, CD_USUARIO, DT_ALTERACAO, CD_IMPORTADOR "&_
			"FROM TFAMILIA_PAIS ( NOLOCK ) "&_
			"WHERE CD_FAMILIA_PROD = "& fnc_QuotedSQL(cd_familia_prod) &_
			"  AND NR_SEQUENCIAL   = " & cd_sequencia
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.tb1 {
	border-style: solid;
  border-width: 0px 0px 1px 0px;
	border-color: #000000;
}

.tb2 {
	border-style: dotted;
	border-width: 0px 0px 1px 0px;
	border-color: #333333;
	padding: 2px;
}
</style>
</head>
<body style="overflow: scroll;">
<table width="100%" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td width="185" rowspan="4"><img src="/imagens/logo_indaia.gif" alt="Logo Indai&aacute; Log&iacute;stica" width="180" height="69"></td>
    <td colspan="4" height="20" class="titulo"><%= nm_tela%></td>
  </tr>
	<tr>
    <td colspan="4" align="center" height="15"><b>Performace <%= objrsx.Fields.Item("NR_DIA_PERFORMACE").Value &" "& tx_lang_POP032(cd_lang)%></b></td>
  </tr>
  <tr>
    <td width="110" align="right"><b><%= tx_lang_POP033(cd_lang)%>:</b></td>
    <td width="40%"><%= UCase(fnc_ConsultaLookup("TPAIS", "CODIGO", cd_pais_destino, "DESCRICAO"))%><br>(<%= UCase(fnc_ConsultaLookup("TEMPRESA_EST", "CD_EMPRESA", objrsx.Fields.Item("CD_IMPORTADOR").Value, "NM_EMPRESA"))%>)</td>
    <td width="110" align="right"><b><%= tx_lang_POP034(cd_lang)%>:</b></td>
    <td width="40%"><%= fnc_Mascara(objrsx.Fields.Item("DT_ALTERACAO").Value, 5)%></td>
  </tr>
  <tr>
		<td align="right"><b><%= tx_lang_POP035(cd_lang)%>:</b></td>
    <td><%= UCase(fnc_ConsultaLookup("TFAMILIA_PROD", "CD_FAMILIA_PROD", cd_familia_prod, "NM_FAMILIA_PROD"))%></td>
    <td align="right"><b><%= tx_lang_POP036(cd_lang)%>:</b></td>
    <td><%= UCase(fnc_ConsultaLookup("TUSUARIO", "CD_USUARIO", objrsx.Fields.Item("CD_USUARIO").Value, "NM_USUARIO"))%></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<%
objrsx.Close()

Do While Not objrs.Eof
%>
  <tr>
    <td height="18" align="center" class="tb2"><b><%= Trim( UCase(objrs.Fields.Item("NM_DOCUMENTO").Value) &" - "& tipo_local_doc(UCase(objrs.Fields.Item("TP_LOCAL").Value)))%></b><br>(Última alteração: <%= objrs.Fields.Item("DT_ALTERACAO").Value%>)</td>
  </tr>
  <tr>
    <td class="tb2"><%= Replace(objrs.Fields.Item("TX_INSTRUCAO").Value, vbcrlf, "<br>")%></td>
  </tr>
<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
  <tr>
    <td colspan="4" height="18">Powered by Indaiá Logística Internacional</td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->