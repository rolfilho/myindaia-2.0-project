<%
'------------------------------------------------------------------
'Sistema MyIndaia - Layout do Sistema
'Arquivo de Script e HTML: Menu Topo
'
'Criado: 27/06/2005
'Autor: Alexandre Gonçalves Neto
'Modificado: 05/10/2006
'------------------------------------------------------------------
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="84%" height="66" background="/imagens/30/fundo_logo_site2.jpg"><img src="/imagens/30/logo_site2.jpg"  border="0"  alt="<%= tx_lang_D00001(cd_lang)%>" usemap="#DefaultLogo" /></td>
		<td width="16%" background="/imagens/30/fundo_logo_site2.jpg" ></td>
  </tr>
	<tr >
  <td colspan="2" background="/imagens/30/fundo_logo_site<%=bg_fundo_logo %>.jpg" height="6px"></td>
  </tr>
<tr height="14" bgcolor="#DBDADA">
	<td width="84%" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='<%=bg_topo%>', endColorStr='<%=bg_topo%>', gradientType='0');" ></td>
	<td width="16%" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='<%=bg_topo%>', endColorStr='<%=bg_topo%>', gradientType='0');"></td>
</tr>
</table>

<map name="DefaultLogo" id="DefaultLogo">
	<area shape="poly" coords="15,14,234,14,234,54,99,54,78,80,57,80,75,53,15,53" href="/default.asp" />
</map>