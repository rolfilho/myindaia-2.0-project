<%
If cd_menu & cd_subm = "0601" Then vl_width = "70" Else vl_width = "95"
%>
<style type="text/css">
<!--
#apDiv555 {
	position: absolute;
	width:38px;
	height:0px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 22px;
	top: 116px;
}
#apDiv556 {
	position: absolute;
	width:70px;
	height:12px;
	background-color:#FFFFFF;
	layer-background-color:#FFFFFF;
	border:1px none #000000;
	z-index:1;
	left: 22px;
	top: 116px;
}
-->
</style>

			<table width="100%" border="0" cellspacing="1" cellpadding="2">        
              <%
If (cd_menu&cd_subm <> "0102") and (cd_menu&cd_subm <> "0801") and (cd_menu&cd_subm <> "0802") and (cd_menu&cd_subm <> "0803") and (cd_menu&cd_subm <> "0601") and (cd_menu&cd_subm <> "1302")  and (cd_menu&cd_subm <> "1202" and autoriza<>"1")Then
	y = ((pagina - 1) * nr_reg_pagina) + 1
	z = nr_reg_pagina * pagina
	If z > objrs.RecordCount Then z = objrs.RecordCount	
%>
        <tr>
            <td colspan="2" style="text-align:left;padding-left:5px;" class="cl_bold"><b><%=UCase(nm_view)%></b><br><img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="565" border="0"></td>
          <td colspan="2"><div align="right" style="margin-right:28px;margin-top:10px;;color:374BAE;">
            <%
	'verifica se &eacute; para exibir anterior
	If pagina > 1 Then
	
	if ap_subm = "pendencias" Then ap_subm = "controle_pendencias"
	if ap_subm = "viagem"     Then ap_subm = "cadastro_viagem"
%>
            <a href="<%= ap_subm%>_result.asp<%= url%>&p=1" target="_self"><img src="/imagens/30/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="16" height="16" border="0" align="absmiddle"></a> 
              <a href="<%= ap_subm%>_result.asp<%= url%>&p=<%= (pagina - 1)%>" target="_self"><img src="/imagens/30/pag_prior_off.gif" alt="<%= tx_lang_A00070(cd_Lang)%>" width="16" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/30/pag_first_no.gif' alt='"& tx_lang_A00069(cd_Lang) &"' width='16' height='16' align='absmiddle'> <img src='/imagens/30/pag_prior_no.gif' alt='"& tx_lang_A00070(cd_Lang) &"' width='16' height='16' align='absmiddle'>")
	End If
%>
            <select name="nr_pagina" class="select" onChange="MM_jumpMenu('self',this,0);">
              <%
	For x = 1 To objrs.PageCount
		If pagina = x Then selected = " selected" Else selected = ""
		Response.Write("<option value='"& x &"'"& selected &">"& x &"</option>")
	Next
%>
            </select>
            <%
	'verifica se &eacute; para exibir Pr&oacute;xima
	If pagina < objrs.PageCount Then
	
	if ap_subm = "pendencias" Then ap_subm = "controle_pendencias"
	if ap_subm = "viagem"     Then ap_subm = "cadastro_viagem"
	
%>			
            <a href="<%= Trim(ap_subm)%>_result.asp<%= url%>&p=<%= (pagina + 1)%>" target="_self"><img src="/imagens/30/pag_next_off.gif" alt="<%= tx_lang_A00071(cd_Lang)%>" width="16" height="16" border="0" align="absmiddle"></a> 
                        <a href="<%= Trim(ap_subm)%>_result.asp<%= url%>&p=<%= objrs.PageCount%>" target="_self"><img src="/imagens/30/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="16" height="16" border="0" align="absmiddle"></a>
            <%
	Else
	
	if ap_subm = "pendencias" Then ap_subm = "controle_pendencias"
	if ap_subm = "viagem"     Then ap_subm = "cadastro_viagem"
	
  	Response.Write("<img src='/imagens/30/pag_next_no.gif' alt='"& tx_lang_A00071(cd_Lang) &"' width='16' height='16' align='absmiddle'> <img src='/imagens/30/pag_last_no.gif' alt='"& tx_lang_A00072(cd_Lang) &"' width='16' height='16' align='absmiddle'>")
	End If
%><br /><b>&nbsp;&nbsp;<%= y&" a "&z&" registros / Total: "&objrs.RecordCount%></b>      
            <%	If sem_saldo <> 1 Then%>
          <!--  <div id="apDiv555" style="display:none;"><i><%If tp_relat <>0 then%><img src="../imagens/icones/16x16/Legenda_Parcial.gif" alt="Cor da linha que exibe o saldo das Parciais" width="42" height="8" /><%end if%></i></div>
          </div>-->
          <%End If%>
          </td>
        </tr>
				<%
Else%>
<tr>
            <td colspan="4" style="text-align:left;padding-left:5px;" class="cl_bold"><br /><b><%=UCase(nm_view)%></b><br><img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="565" border="0"></td>
</tr>
<%
End If
%>
      </table>
