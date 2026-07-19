<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel dos resultados do KPI Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 16/01/2006
'Modificado: 16/01/2006
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
Dim numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim cd_quebra_gsi_aux, cd_quebra_gsi_aux2, cd_quebra_gsi_aux3

cd_tela  = "EXC013"
cd_ident = CInt(Request.QueryString("cd_ident"))
tx_erro  = CStr(Request.QueryString("tx_erro"))

cont    = CInt(Request.QueryString("cont"))
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\exp_gsi_"& Session("cd_usuario") &"_"&_
		  Year(Date) & Month(Date) & Day(Date) &"_"&_
		  Hour(Time) & Minute(Time) & Second(Time) &".xls"
			
tp_rel  = 13
nm_rel  = "GSI - Exportação"

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
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
	Do While nrec < objrs.PageSize and Not objrs.Eof

	  If tp_relat = 0 Then
		cd_quebra_gsi_aux = objrs.Fields.Item("NM_PAIS").Value 
		if InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLÉ - ") or InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLE - ") Then 
			cd_quebra_gsi_aux2 = Right(objrs.Fields.Item("NM_FAMILIA_PROD").Value, Len(objrs.Fields.Item("NM_FAMILIA_PROD").Value)-Len("NESTLE - ")) 
		Else
			cd_quebra_gsi_aux2 = objrs.Fields.Item("NM_FAMILIA_PROD").Value
		End If
		cd_quebra_gsi_aux3 = "Mercadoria"
	  Else
		if InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLÉ - ") or InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLE - ") Then 
		cd_quebra_gsi_aux = Right(objrs.Fields.Item("NM_FAMILIA_PROD").Value, Len(objrs.Fields.Item("NM_FAMILIA_PROD").Value)-Len("NESTLE - ")) 
		Else
		cd_quebra_gsi_aux = objrs.Fields.Item("NM_FAMILIA_PROD").Value
		End If
		cd_quebra_gsi_aux2 = objrs.Fields.Item("NM_PAIS").Value
		cd_quebra_gsi_aux3 = "País"
	  End If 
	
  	'alterna a cor das linhas
  	If bgcolor = "#dbe5f1" Then bgcolor = "#FFFFFF" Else bgcolor = "#dbe5f1"
  	'quando mudar o país, exibe cabeçalho
  	If cd_campo_quebra <> cd_quebra_gsi_aux  Then
			If fnc_TestaVar(cd_campo_quebra) Then
				objtxt.WriteLine("	<tr>")
				objtxt.WriteLine("		<td colspan='2' height='3'></td>")
				objtxt.WriteLine("	</tr>")
			End If
      objtxt.WriteLine("  <tr height='20'>")
      objtxt.WriteLine("    <td colspan='6' class='gridtop'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"& cd_quebra_gsi_aux &"</td>")
      objtxt.WriteLine("  </tr>")
      objtxt.WriteLine("  <tr height='16'>")
      objtxt.WriteLine("    <td colspan='2' class='gridtit2'>&nbsp;Cliente</td>")
      objtxt.WriteLine("    <td colspan='2' class='gridtit2'>&nbsp;Importador</td>")
      objtxt.WriteLine("    <td colspan='2' class='gridtit2'>&nbsp;"& cd_quebra_gsi_aux3 &"</td>")
      objtxt.WriteLine("  </tr>")
  	End If
  	cd_campo_quebra = cd_quebra_gsi_aux
		
    objtxt.WriteLine("  <tr height='16'>")
    objtxt.WriteLine("    <td colspan='2' valign='top' bgcolor='"& bgcolor &"'>"& objrs.Fields.Item("NM_EXPORTADOR").Value &"</td>")
	objtxt.WriteLine("    <td colspan='2' valign='top' bgcolor='"& bgcolor &"'>"& objrs.Fields.Item("NM_IMPORTADOR").Value &"</td>")
    objtxt.WriteLine("    <td colspan='2' valign='top' bgcolor='"& bgcolor &"'>"& cd_quebra_gsi_aux2 &"</td>")
    objtxt.WriteLine("  </tr>")
  	
		objrs.MoveNext
  	If objrs.Eof Then Exit Do
	Loop

	'escreve linha com a quantidade de registros
  objtxt.WriteLine("  <tr>")
 objtxt.WriteLine("    <td class='gridsub' style='width:200px;'>"& objrs.RecordCount &" registros encontrados</td>")
  for i = 1 to nr_cols -1
    objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
  next
  objtxt.WriteLine("  </tr>")
  
  objtxt.WriteLine("</table></body></html>")
  objtxt.Close()
  Set objtxt = Nothing
  Set objfso = Nothing
  'retorna o nome do arquivo para o download
  fnc_GeraExcel = arquivo
End Function

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_views.asp"-->
<%  
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_exp_gsi")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
'If objrsv.Eof Then objrsv.MoveFirst
'qtde de uni&atilde;o de coluns
col = 5 'valor padrão, pois não tem personalização de campos para esse relatório

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
    <p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/excel/arquivo<%= arquivo%>" target="_blank"><b>clique aqui</b></a>.</p></td>
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