<%
If cd_menu & cd_subm = "0601" Then vl_width = "70" Else vl_width = "95"
%>
			<table width="98%" border="0" cellspacing="1" cellpadding="2">
        <%
If (cd_menu&cd_subm <> "0102") and (cd_menu&cd_subm <> "0801") Then
	y = ((pagina - 1) * nr_reg_pagina) + 1
	z = nr_reg_pagina * pagina
	If z > objrsx.RecordCount Then z = objrsx.RecordCount	
%>
        <tr>
          <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_novo.jpg" alt="-" width="16" height="16" /></th>
          <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_salvar.gif" alt="-" width="16" height="16" /></th>
          <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_cancelar.gif" alt="-" width="16" height="16" /></th>
          <th width="3%" bordercolor="#FFFFFF" scope="col"><img src="../../imagens/icones/16x16/btn_excluir.gif" alt="-" width="16" height="16" /></th>
          <th bordercolor="#FFFFFF" scope="col"><div align="right"><a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=TX_PO_CUSTOMER%>&p=1" target="_self"><img src="/imagens/icones/16x16/pag_first_off.gif" alt="<%= tx_lang_A00069(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
            <a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=TX_PO_CUSTOMER%>&p=<%= (pagina - 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_prior_off.gif" alt="<%= tx_lang_A00070(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_first_no.gif' alt='"& tx_lang_A00069(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_prior_no.gif' alt='"& tx_lang_A00070(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
<%
	'verifica se &eacute; para exibir Pr&oacute;xima
	If pagina < objrsx.PageCount Then
%>
                        <a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=TX_PO_CUSTOMER%>&p=<%= (pagina + 1)%>" target="_self"><img src="/imagens/icones/16x16/pag_next_off.gif" alt="<%= tx_lang_A00071(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a> 
            <a href="AlteraOrders.asp?TX_PO_CUSTOMER=<%=TX_PO_CUSTOMER%>&p=<%= objrsx.PageCount%>" target="_self"><img src="/imagens/icones/16x16/pag_last_off.gif" alt="<%= tx_lang_A00072(cd_Lang)%>" width="19" height="16" border="0" align="absmiddle"></a>
            <%
	Else
  	Response.Write("<img src='/imagens/icones/16x16/pag_next_no.gif' alt='"& tx_lang_A00071(cd_Lang) &"' width='19' height='16' align='absmiddle'> <img src='/imagens/icones/16x16/pag_last_no.gif' alt='"& tx_lang_A00072(cd_Lang) &"' width='19' height='16' align='absmiddle'>")
	End If
%>
            <%=""&z&" "&tx_lang_A00048(cd_lang)&" "&objrsx.RecordCount&" "&tx_lang_A00049(cd_lang)&"."%>
            <%
	'verifica se &eacute; para exibir anterior
	If pagina > 1 Then
%>
</div></th>
          </tr>
				<%
End If
%>
      </table>
