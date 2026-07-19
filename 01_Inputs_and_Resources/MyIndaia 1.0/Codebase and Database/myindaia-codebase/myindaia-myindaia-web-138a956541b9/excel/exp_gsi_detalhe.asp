<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel do detalhe de GSI
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/02/2006
'Modificado: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 600

Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim tp_rel  'código dipo de relatório
Dim nm_rel  'nome do relatório

Dim cd_familia_prod 'código da família de produtos
Dim cd_pais_destino 'código do pais de destino
Dim cd_unid_neg 'unidade de negociação
Dim cd_produto  'código do produto
Dim cd_sequencia

cd_tela = "EXC014"
tp_rel  = 14
nm_rel  = "General Shipment Instruction"
tx_erro = CStr(Request.QueryString("tx_erro"))

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\exp_gsi_detalhe_"& Session("cd_usuario") &"_"&_
		  Year(Date) & Month(Date) & Day(Date) &"_"&_
		  Hour(Time) & Minute(Time) & Second(Time) &".xls"

cd_familia_prod = Request.QueryString("cd_familia_prod")
cd_pais_destino = Request.QueryString("cd_pais_destino")
cd_sequencia = Request.QueryString("nr_sequencial")
cd_unid_neg = Request.QueryString("cd_unid_neg")
cd_produto  = Request.QueryString("cd_produto")

Function fnc_GeraExcel(caminho, arquivo)
  Dim objfso	'objeto do sistema de arquivos 
  Dim objtxt	'objeto para a criação de arquivos
	
	'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
  Set objtxt = objfso.CreateTextFile(caminho & arquivo, True, False)
  'inicia a gravação do arquivo xls para download
%>
<!--#include virtual="/includes/xls_header_old.asp" -->
<%
	Do While Not objrs.Eof
    objtxt.WriteLine("  <tr>")
    objtxt.WriteLine("    <td colspan='6' height='18' align='center' class='tb2'><b>"& Trim( UCase(objrs.Fields.Item("NM_DOCUMENTO").Value) &" - "& tipo_local_doc(UCase(objrs.Fields.Item("TP_LOCAL").Value))) &"</b><br><nobr><font color='#990000'>(Última atualização: " & objrs.Fields.Item("DT_ALTERACAO").Value & ")</font></nobr></td>")
    objtxt.WriteLine("  </tr>")
    objtxt.WriteLine("  <tr>")
    objtxt.WriteLine("    <td colspan='6' class='tb2'>"& Replace(objrs.Fields.Item("TX_INSTRUCAO").Value, vbcrlf, "<br>") &"</td>")
    objtxt.WriteLine("  </tr>")
    objrs.MoveNext
    If objrs.Eof Then Exit Do
  Loop

  objtxt.WriteLine("  <tr height='20'>")
	objtxt.WriteLine("    <td colspan='6' valign='bottom' style='font-size: 10px; text-align:right; border: dotted #999999; border-width: 1px 0px 0px 0px;'><i>Emitido em "& fnc_Mascara(Date, 5) &" às "& Time &" por "& Session("nm_usuario") &"</i></td>")
	objtxt.WriteLine("  </tr>")
	
	objtxt.WriteLine("</table></body></html>")
  objtxt.Close()
  Set objtxt = Nothing
  Set objfso = Nothing
  'retorna o nome do arquivo para o download
  fnc_GeraExcel = arquivo
End Function

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
sql = "SELECT NR_DIA_PERFORMACE, CD_USUARIO, DT_ALTERACAO "&_
			"FROM TFAMILIA_PAIS ( NOLOCK ) "&_
			"WHERE CD_FAMILIA_PROD = "& fnc_QuotedSQL(cd_familia_prod) &_
			"  AND NR_SEQUENCIAL   = " & cd_sequencia
'Response.Write(sql &"<br>")
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst

Call fnc_GeraExcel(caminho, arquivo)
%>
<html>
<head>
<title><%= nm_rel%></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" align="center" class="titpopup">Redirecionando Download</td>
  </tr>
  <tr>
    <td><p align="center">Planilha Excel<br>
        <b><%= Right(arquivo, Len(arquivo) - 1)%></b></p>
      <p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/excel/arquivo<%= arquivo%>" target="_blank"><b>clique
            aqui</b></a>.</p></td>
  </tr>
  <tr>
    <td height="35" align="center"><input type="button" class="button" value="X Fechar" onClick="javascript:window.close();"></td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
window.open('http://www.myindaiaweb.com.br/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->