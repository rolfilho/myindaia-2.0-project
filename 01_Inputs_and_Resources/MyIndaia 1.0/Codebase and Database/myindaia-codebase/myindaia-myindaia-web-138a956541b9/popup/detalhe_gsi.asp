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

nm_tela = "General Shipment Instruction: Performace "
'verifica se foi recuperado corretamente o código
If fnc_TestaVar(cd_familia_prod) and fnc_TestaVar(cd_pais_destino) and fnc_TestaVar(cd_unid_neg) and fnc_TestaVar(cd_produto) Then
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
Else
  'exibe mensagem de erro
  tx_erro = "ERRO INTERNO:\n\n- "& tx_lang_A00081(cd_lang) &"!\n - "& tx_lang_A00004(cd_lang) &"(suporte@myindaia.com.br)."
  Call sub_MessageBox(tx_erro)
  str = "<p>"&_
				"Ocorrido em: "& FormatDateTime( Now(), 0 ) &"<br>"&_
				"Descrição  : Não foi possivel recuperar corretamento as variaveis de request<br>"&_
				"Fonte      : detalhe_gsi.asp?"& Request.QueryString &"<br>"&_
				"IP do erro : "& Server.HTMLEncode( Request.ServerVariables("REMOTE_ADDR") )     &"<br>"&_
				"Navegador  : "& Server.HTMLEncode( Request.ServerVariables("HTTP_USER_AGENT") ) &"<br>"&_
				"Página     : "& Server.HTMLEncode( Request.ServerVariables("SCRIPT_NAME") )     &"<br>"&_
				"</p>"
  Call fnc_EnviaMail(Session("nm_email"), ERROEMAIL, "", "", ERROASSUNTO, str, 1, True)
End if
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
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td colspan="4" height="25" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="titpopup">&nbsp;<%= nm_tela & objrsx.Fields.Item("NR_DIA_PERFORMACE").Value &" "& tx_lang_POP032(cd_lang)%></td>
          <td width="25"><a href="#" onClick="window.open('detalhe_gsi_print.asp?<%= Request.QueryString%>','impressao','top=40,left=40,width=700,height=500,scrollbars=yes,menubar=no');" class="botao"><img src="/imagens/icones/16x16/btn_print.gif" width="17" height="17" border="0" alt="<%= tx_lang_D00006(cd_lang)%>"></a></td>
          <td width="25"><a href="#" onClick="window.open('/excel/exp_gsi_detalhe.asp?<%= Request.QueryString%>','download','top=40,left=40,width=250,height=175,menubar=yes,toolbar=yes,resizable=yes');" class="botao"><img src="/imagens/icones/16x16/btn_excel.gif" width="16" height="16" border="0" alt="<%= tx_lang_D00002(cd_lang)%>"></a></td>
          <td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td width="10%" align="right" height="15" class="tb1"><b><%= tx_lang_POP033(cd_lang)%>:</b>&nbsp;</td>
    <td width="40%" class="tb1" colspan="3">&nbsp;<%= UCase(fnc_ConsultaLookup("TPAIS", "CODIGO", cd_pais_destino, "DESCRICAO"))%> (<%= UCase(fnc_ConsultaLookup("TEMPRESA_EST", "CD_EMPRESA", objrsx.Fields.Item("CD_IMPORTADOR").Value, "NM_EMPRESA"))%>) </td>
  </tr>
  <tr>
    <td align="right" height="15" class="tb1"><b><%= tx_lang_POP035(cd_lang)%>:</b>&nbsp;</td>
    <td class="tb1">&nbsp;<%= UCase(fnc_ConsultaLookup("TFAMILIA_PROD", "CD_FAMILIA_PROD", cd_familia_prod, "NM_FAMILIA_PROD"))%></td>
    <td align="right" class="tb1"><b><%= tx_lang_POP036(cd_lang)%>:</b>&nbsp;</td>
    <td class="tb1">&nbsp;<%= UCase(fnc_ConsultaLookup("TUSUARIO", "CD_USUARIO", objrsx.Fields.Item("CD_USUARIO").Value, "NM_USUARIO"))%></td>
  </tr>
	<tr>
    <td colspan="4"><div id="dv_corpo" style="position:absolute; left:0px; top:62px; width:100%; height:100%; z-index:1; overflow:auto;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <%
objrsx.Close()
Do While Not objrs.Eof
%>
          <tr>
            <td height="18" align="center" class="tb2" width="70%"><b><%= Trim(UCase(objrs.Fields.Item("NM_DOCUMENTO").Value) &" - "& tipo_local_doc(UCase(objrs.Fields.Item("TP_LOCAL").Value)))%></b><br><nobr><font color="#990000">(Última atualização: <%= objrs.Fields.Item("DT_ALTERACAO").Value%>)</font></nobr></td>
          </tr>
          <tr>
            <td class="tb2"><%= Replace(objrs.Fields.Item("TX_INSTRUCAO").Value, vbcrlf, "<br>")%></td>
          </tr>
          <%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
        </table>
      </div></td>
  </tr>
  <tr align="center">
    <td colspan="4" height="28"><input name="Input" type="button" class="button" onClick="window.close()" value="Fechar"></td>
  </tr>
  <tr align="center" bgcolor="#DBDADA">
    <td colspan="4" height="15"><p><b><a href="http://www.indaialogistica.com.br/" target="_blank">Indaiá Logística
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