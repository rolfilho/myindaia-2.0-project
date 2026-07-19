<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Contratos de Câmbio Exportação
'Arquivo de Script e HTML: Listagem de Contratos
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrContrato : vNrContrato = Request.QueryString("vNrContrato")
dim vNrBanco : vNrBanco = Request.QueryString("vNrBanco")
dim vNrDias : vNrDias = Request.QueryString("vNrDias")
dim ContaMes, diferenca,v2,v1,Valor1, teste,projecaoValor,ValorJuros,Somajuros
'seleciona a tabela de juros desse contrato
'*************************************************************************************************
'sql = "SELECT NR_ANO, (NR_MES - 1) AS NR_MES, VL_JUROS "&_
'			"FROM TCONT_CAMB_JUROS (NOLOCK) "&_
'			"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"' "&_
'			"ORDER BY NR_ANO, NR_MES"
'*************************************************************************************************
sql ="SELECT TCJ.NR_ANO, (NR_MES - 1) AS NR_MES, VL_JUROS, TC.VL_TAXA_JUROS, TC.NR_CONT_CAMB, TC.NR_BANCO, TCJ.NR_CONT_CAMB, TCJ.NR_BANCO,TC.VL_NEGOC "&_
	"FROM TCONT_CAMB_JUROS TCJ (NOLOCK) "&_
	"INNER JOIN TCONT_CAMB TC (NOLOCK) on (TC.NR_CONT_CAMB = TCJ.NR_CONT_CAMB AND TC.NR_BANCO = TCJ.NR_BANCO) "&_
	"WHERE TCJ.NR_CONT_CAMB = '"&vNrContrato&"' AND TCJ.NR_BANCO = '"&vNrBanco&"' "&_
	"ORDER BY NR_ANO, NR_MES"
	
			'Response.Redirect("teste.asp?var1="&vNrDias&"")
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;Tabela de Juros </td>
					<td width="25"><a href="#" onClick="ExibeJuros('','',false);"><img src="/imagens/icones/16x16/btn_close.gif" alt="Fechar" width="17" height="17" border="0"></a></td>
				</tr>
			</table>			

	</tr>
	<tr>
		<td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
				<col width="100">
				<col width="70">
				<tr height="18">
				
<%sql = "SELECT NR_ANO, (NR_MES - 1) AS NR_MES, VL_JUROS "&_
			"FROM TCONT_CAMB_JUROS (NOLOCK) "&_
			"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"' "&_
			"ORDER BY NR_ANO, NR_MES"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
ContaMes = 0 
do while not objrsx.eof 
ContaMes = ContaMes + 1 
objrsx.movenext() 
loop %>
                
				  <td colspan="2" class="gridtit"><%=ContaMes%> <%If ContaMes>1 then%> Meses <%else%> Mes <%End If%>&nbsp;</td>
		  </tr>
				<tr height="18">
					<td class="gridtit">M&ecirc;s/Ano</td>
					<td class="gridtit">Valor</td>
				</tr>
				<%

if objrs.RecordCount > 0 then
	'lista a liquidação
v1=0
Somajuros=0


do while not objrs.Eof
v1=v1+1
'Acumula os juros
Somajuros=Somajuros+FormatNumber(objrs.Fields.Item("VL_NEGOC").Value*vNrDias*FormatNumber(objrs.Fields.Item("VL_TAXA_JUROS").Value)/36000/ContaMes, 2)

ValorJuros=FormatNumber(objrs.Fields.Item("VL_NEGOC").Value+Somajuros,2)

projecaoValor =	(FormatNumber(objrs.Fields.Item("VL_NEGOC").Value+(FormatNumber(objrs.Fields.Item("VL_NEGOC").Value*vNrDias*FormatNumber(objrs.Fields.Item("VL_TAXA_JUROS").Value)/36000, 2))))
If ContaMes=v1 then
	diferenca=FormatNumber(projecaoValor-ValorJuros,2)
	'Response.Redirect("../../IMPORT/teste.asp?var1="&diferenca&"")
End if%>

<tr height="16" bgcolor="#FFFFFF">
<td align="center"><%= meses(objrs.Fields.Item("NR_MES").Value) &"/"& objrs.Fields.Item("NR_ANO").Value%></td>

<!--V1 conta numero de meses, no segundo mes soma a diferença de centavos -->                    
<td align="right">   <%=FormatNumber(objrs.Fields.Item("VL_NEGOC").Value*vNrDias*FormatNumber(objrs.Fields.Item("VL_TAXA_JUROS").Value)/36000/ContaMes+diferenca, 2)%></td>

<%'= FormatNumber(objrs.Fields.Item("VL_NEGOC").Value*vNrDias*FormatNumber(objrs.Fields.Item("VL_TAXA_JUROS").Value)/36000, 2)%>
<%'= FormatNumber(objrs.Fields.Item("VL_JUROS").Value, 2) FORMULA ORIGINAL DA PÁGINA %>
</tr>
<!--Valor total dos juros é igual ao valor do contrato  + o total de juros acumulado -->
<%
		objrs.MoveNext
		if objrs.Eof then exit do
		    'Calcula o valor da projeção para calcular a diferença de centavos
	'diferenca=FormatNumber(projecaoValor-ValorJuros,2)
	loop
else
	Response.Write("<tr class='gridtit'><td colspan='2' align='left'>&nbsp;N&atilde;o foi encontrada a tabela de juros.</td></tr>")

end if
			'diferenca=FormatNumber(projecaoValor-ValorJuros,2)
				'Response.Redirect("../../IMPORT/teste.asp?var1="&diferenca&"")

objrs.Close()

vInDebug = false
%>
	  </table></td>
	</tr>
</table>
<!--#include virtual="/includes/inc_ends.asp" -->
