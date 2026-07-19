<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Popups de Detalhes de Processo
'Arquivo de Script e HTML: Impressão Detalhes do Contêiner
'
'Modificado por Alexandre Gonçalves Neto em 12/07/2005
'
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim nr_cntr 'numero do contêiner
Dim nr_dias_cobrar
Dim nr_dias_corridos

nr_referencia = Request.QueryString("nr_referencia")
nr_processo   = Request.QueryString("nr_processo")

cd_tela = "PUP001"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

' ***** SELECIONA OS CAMPOS DA PERSONALIZAÇÃO *****
sql = "SELECT M04_CD_CAMPO, M04_NM_CAMPO, M04_AP_CAMPO, M04_CD_EVENTO, M04_NR_ORDEM " &_
  	  "FROM M07_VIEW_CAMPO ( NOLOCK )" &_
  	  "  INNER JOIN M04_CAMPO ( NOLOCK ) ON ( M04_CD_CAMPO = M07_CD_CAMPO ) " &_
	  "  INNER JOIN M01_MENU  ( NOLOCK ) ON ( M01_CD_MENU  = M04_CD_MENU ) " &_
	  "  INNER JOIN M02_SUBM  ( NOLOCK ) ON ( M02_CD_MENU  = M04_CD_MENU AND M02_CD_SUBM = M04_CD_SUBM ) " &_
  	  "WHERE M07_CD_VIEW  = '"& cd_view &"' " &_
	  "  AND M04_CD_SUBM  = '"& cd_subm &"' "&_
	  "  AND M04_CD_MENU  = '"& cd_menu &"' " &_
	  "  AND M04_IN_ATIVO = 1 " &_
  	  "ORDER BY M04_NR_ORDEM"
'Response.Write(sql &"<br>")
objrsv.Open sql, objcnn, 3, 1

' ***** DETALHES DO CNTR/PROCESSO *****
With objcmd
  .CommandTimeOut = 60
  .CommandText    = Session("sql_cntr")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
  <tr>
  	<td height="17"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" height="69" rowspan="3"><img src="/imagens/logo_indaia.gif" width="180" height="69"></td>
        <td width="5" rowspan="3"><img src="/imagens/lay_all.gif" width="5" height="1"></td>
        <td><p class="titpopup">Detalhes Cont&ecirc;iner - Processo <%= Mid(nr_processo, 5, Len(nr_processo))%></p></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Unidade: <b><%= objrs("NM_UNID_NEG")%></b><br>
      		Produto: <b><%= objrs("NM_PRODUTO")%></b><br>
      		Emitido por: <b><%= Session("nm_usuario")%></b></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5"><img src="/imagens/lay_all.gif" width="1" height="5"></td>
  </tr>
  <tr>
	<td width="100%" valign="top">
	<!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
	<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
      <tr height="18" class="gridtit">
        <%
Do While Not objrsv.Eof
%>
        <td><nobr><%= objrsv("M04_NM_CAMPO")%></nobr></td>
        <%
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
%>
      </tr>
      <%
Do While Not objrs.Eof
  If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
%>
      <tr height="15" bgcolor="<%= bgcolor%>">
        <%
  If objrsv.Eof Then objrsv.MoveFirst
  
  'executa procedure para contar dias de demurrage
  With objcmd
	.CommandTimeOut = 60
	.CommandText    = "sp_calc_dias_cntr"
	.CommandType    = adCmdStoredProc
	.Parameters.Append = .CreateParameter("@nr_processo"     , adChar   , adParaminput , 18, nr_processo)
	.Parameters.Append = .CreateParameter("@nr_cntr"         , adChar   , adParaminput , 20, objrs("NR_CNTR"))
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
  
  Do While Not objrsv.Eof
    Select Case objrsv("M04_CD_CAMPO")
	  Case "001" 'Nr. Cont&ecirc;iner
%>
        <td align="center" width="150"><nobr><%= fnc_Mascara(objrs("NR_CNTR"), 0)%>&nbsp;<nobr></td>
        <%
	  Case "017" 'dias corridos
%>
        <td><nobr><%= nr_dias_corridos%>&nbsp;</nobr></td>
        <%
	  Case "018" 'dias a cobrar
%>
        <td><nobr><%= nr_dias_cobrar%>&nbsp;</nobr></td>
        <%
	  Case Else
%>
        <td align="right"><nobr><%= Trim(fnc_Mascara(objrs(UCase(objrsv("M04_AP_CAMPO"))), 5))%>&nbsp;</nobr></td>
        <%
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
        <td height="15" colspan="<%= objrsv.RecordCount%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
      </tr>
      <%
objrsv.Close
objrs.Close
%>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!-- :::::::::: FIM DO CORPO CENTRAL :::::::::: --></td>
  </tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->