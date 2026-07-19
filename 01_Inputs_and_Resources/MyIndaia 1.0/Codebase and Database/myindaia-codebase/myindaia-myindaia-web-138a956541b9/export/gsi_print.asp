<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação
'Arquivo de Script e HTML: Resultado do Relatório de Borderô
'
'Autor: Alexandre Gonçalves Neto
'Criado: 20/01/2006
'
'Manutenção:
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
cd_tela = "EXP020"
nm_tela = "GSI Exportação"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_views.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") & Session("sql_exp_gsi") &"<br><br>"
With objcmd
  .CommandTimeOut = 120
  .CommandText    = Session("sql_exp_gsi")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.gridfuptit {
  mso-style-parent: gridfuptit; 
  text-align: left;
}
</style>
</head>
<body style="overflow: scroll;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
 <%
cd_campo_quebra = ""
nrec = 0
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof
  'alterna a cor das linhas
  If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
  'quando mudar o país, exibe cabeçalho
  If cd_campo_quebra <> objrs.Fields.Item("CD_PAIS").Value Then
	
	If fnc_TestaVar(cd_campo_quebra) Then
%>
  <tr>
		<td colspan="2" height="3"></td>
	</tr>
	<%
End If
%>
	<tr height="20">
    <td colspan="3" class="gridfuptop" style="border: dotted #333333; border-width: 1px 0px 0px 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= objrs.Fields.Item("NM_PAIS").Value%></td>
  </tr>
  <tr height="16">
    <td width="40%" class="gridfuptit" align="left">&nbsp;Cliente</td>
    <td width="40%" class="gridfuptit" align="left">&nbsp;Importador</td>
    <td width="60%" class="gridfuptit" align="left">&nbsp;Mercadoria</td>
  </tr>
  <%
  End If
  cd_campo_quebra = objrs.Fields.Item("CD_PAIS").Value
	
	w = Trim( objrs.Fields.Item("CD_FAMILIA_PROD").Value )
	x = Trim( objrs.Fields.Item("CD_PAIS").Value )
	y = Trim( objrs.Fields.Item("CD_UNID_NEG").Value )
	z = Trim( objrs.Fields.Item("CD_PRODUTO").Value )
	z2 = Trim( objrs.Fields.Item("NR_SEQUENCIAL").Value )
	z3 = Trim( objrs.Fields.Item("CD_IMPORTADOR").Value )
%>
  <tr bgcolor="<%= bgcolor%>">
    <td><%= objrs.Fields.Item("NM_EXPORTADOR").Value%></td>
    <td><%= objrs.Fields.Item("NM_IMPORTADOR").Value%></td>
    <td><a href="#" onClick="window.open('/popup/detalhe_gsi.asp?cd_familia_prod=<%= w%>&cd_pais_destino=<%= x%>&cd_unid_neg=<%= y%>&cd_produto=<%= z%>&nr_sequencial=<%= z2%>&cd_importador=<%= z3%>','detalhe_gsi','top=20,left=20,width=800,height=600,resizable=yes');"><%= objrs.Fields.Item("NM_FAMILIA_PROD").Value%></a></td>
  </tr>
  <%
  nrec = nrec + 1
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
  <tr class="gridfuptit">
    <td height="15" colspan="3" align="left" style="border: dotted #333333; border-width: 1px 0px 0px 0px;"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
  </tr>
  <%
objrsv.Close
objrs.Close
%>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->
