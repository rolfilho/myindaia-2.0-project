<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%

Dim vl_recuperado, color_tabela
Dim vl_multa_icms, vl_multa_ipi, vl_multa_pis, vl_multa_cofins
Dim vl_icms, vl_ipi, vl_pis, vl_cofins 

cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
nr_processo = Request.QueryString("nr_processo")
vl_recuperado = Request.QueryString("vl_recuperado")

			if objrs.State = adStateOpen then objrs.Close()	
			sql = "SELECT DISTINCT DI.NR_PROCESSO, AI.NR_ADICAO AS ADICAO, AI.CD_COBERT_CAMBIAL AS CD_COBERTURA, ISNULL(AI.VL_ICMS_A_RECOLHER,0) AS VL_ICMS, "&_
				  " ISNULL(TR.VL_IMPOSTO_DEVIDO,0) AS VL_IPI, ISNULL(AI.VL_PIS,0) AS VL_PIS, ISNULL(AI.VL_COFINS,0) AS VL_COFINS, "&_
				  " (ISNULL(AI.VL_ICMS_A_RECOLHER,0) + ISNULL(TR.VL_IMPOSTO_DEVIDO,0) + ISNULL(VL_PIS,0) +ISNULL(VL_COFINS,0)) AS VL_TOTAL_ADICAO, SG.CD_TP_PEDIDO AS TP_PEDIDO"&_
                  " FROM TDECLARACAO_IMPORTACAO DI "&_
                  " LEFT JOIN TADICAO_DE_IMPORTACAO AI ON (AI.NR_PROCESSO = DI.NR_PROCESSO)"&_
                  " INNER JOIN TDETALHE_MERCADORIA DM ON(DM.NR_PROCESSO = AI.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO)"&_
				  " LEFT JOIN TRIBUTO TR ON (TR.NR_PROCESSO = AI.NR_PROCESSO AND TR.NR_ADICAO = AI.NR_ADICAO AND TR.CD_RECEITA_IMPOSTO = '0002')" &_
                  " INNER JOIN TESTAGIO_PROCESSO EP ON (EP.NR_PROCESSO_DES = DI.NR_PROCESSO AND EP.NR_REFERENCIA = DM.NR_PROC_PO AND EP.NR_ITEM_CLIENTE = DM.NR_ITEM_PO AND EP.NR_PARCIAL = DM.NR_PARCIAL AND ISNULL(EP.CD_EMPRESA,'') = ISNULL(DM.CD_EMPRESA,'')) "&_
                  " INNER JOIN TPROCESSO SG ON (SG.NR_PROCESSO = EP.NR_PROCESSO_ADM)"&_
                  " WHERE DI.NR_PROCESSO = '"& nr_processo & "'"&_
                  " ORDER BY AI.NR_ADICAO "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT (SELECT VL_TOT_ICMS "&_
              " FROM TDECLARACAO_IMPORTACAO "&_
			  " WHERE NR_PROCESSO = DI.NR_PROCESSO)  AS vl_total_sem_multa_icms, "&_
			  "(SELECT VL_TOTAL_IPI "&_
              " FROM TDECLARACAO_IMPORTACAO "&_
			  " WHERE NR_PROCESSO = DI.NR_PROCESSO)  AS vl_total_sem_multa_ipi, "&_
			  "(SELECT SUM(VL_PIS) "&_
              " FROM TADICAO_DE_IMPORTACAO "&_
			  " WHERE NR_PROCESSO = DI.NR_PROCESSO)  AS vl_total_sem_multa_pis, "&_
			  "(SELECT SUM(VL_COFINS) "&_
              " FROM TADICAO_DE_IMPORTACAO "&_
			  " WHERE NR_PROCESSO = DI.NR_PROCESSO)  AS vl_total_sem_multa_cofins, "&_
			  "(SELECT TOP 1 VL_ITEM "&_
  			  " FROM TFATURAMENTO_CC"&_
  			  " WHERE NR_PROCESSO = DI.NR_PROCESSO"&_
	          " AND CD_ITEM = '026') AS vl_total_ipi ,"&_
			  "(SELECT TOP 1 VL_ITEM "&_
  			  " FROM TFATURAMENTO_CC"&_
  			  " WHERE NR_PROCESSO = DI.NR_PROCESSO"&_
	          " AND CD_ITEM = '027') AS vl_total_icms ,"&_
			  "(SELECT TOP 1 VL_ITEM "&_
  			  " FROM TFATURAMENTO_CC"&_
  			  " WHERE NR_PROCESSO = DI.NR_PROCESSO"&_
	          " AND CD_ITEM = '600') AS vl_total_pis ,"&_
			  "(SELECT TOP 1 VL_ITEM "&_
  			  " FROM TFATURAMENTO_CC"&_
  			  " WHERE NR_PROCESSO = DI.NR_PROCESSO"&_
	          " AND CD_ITEM = '599') AS vl_total_cofins "&_
			  " FROM TDECLARACAO_IMPORTACAO DI"&_
			  " WHERE DI.NR_PROCESSO = '"& nr_processo & "'"
			  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
	       vl_multa_icms  = objrsx.Fields.Item("vl_total_icms").Value - objrsx.Fields.Item("vl_total_sem_multa_icms").Value
		   vl_multa_ipi  = objrsx.Fields.Item("vl_total_ipi").Value - objrsx.Fields.Item("vl_total_sem_multa_ipi").Value
		   vl_multa_pis  = objrsx.Fields.Item("vl_total_pis").Value - objrsx.Fields.Item("vl_total_sem_multa_pis").Value
		   vl_multa_cofins  = objrsx.Fields.Item("vl_total_cofins").Value - objrsx.Fields.Item("vl_total_sem_multa_cofins").Value	
		   
						
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<table width="90%" heigth="90%" border="0" cellpadding="0" cellspacing="0" align="center">
     <tr><td align="left" valign="top">
     <br>
    <table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="<%=cabec_result %>" style="padding: 0px 1px 0px 1px;">
    			<tr align="center">
					<td class="gridtit" style="background-color:<%=cabec_result %>;">&nbsp;<%=tx_lang_TDE007(cd_lang)%>&nbsp;</td>
					<td class="gridtit" style="background-color:<%=cabec_result %>;"><nobr>&nbsp;<%=tx_lang_TDE008(cd_lang)%>&nbsp;</nobr></td>
					<td class="gridtit" style="background-color:<%=cabec_result %>;">&nbsp;IPI&nbsp;</td>
					<td class="gridtit" style="background-color:<%=cabec_result %>;">&nbsp;ICMS&nbsp;</td>
					<td class="gridtit" style="background-color:<%=cabec_result %>;">&nbsp;PIS&nbsp;</td>
					<td class="gridtit" style="background-color:<%=cabec_result %>;">&nbsp;COFINS&nbsp;</td>
				</tr>
	<% Do While Not objrs.Eof
    				vl_icms =   objrs.Fields.Item("VL_ICMS").Value
                    vl_ipi =    objrs.Fields.Item("VL_IPI").Value
                    vl_pis =    objrs.Fields.Item("VL_PIS").Value
                    vl_cofins = objrs.Fields.Item("VL_COFINS").Value
                    
                    If objrsx.Fields.Item("vl_total_sem_multa_icms").Value <> 0 Then
    				  vl_icms = (vl_icms   * vl_multa_icms)/objrsx.Fields.Item("vl_total_sem_multa_icms").Value
                    Else
                      vl_icms = 0
                    End If					
                    
                    If objrsx.Fields.Item("vl_total_sem_multa_ipi").Value <> 0 Then
                      vl_ipi = (vl_ipi    * vl_multa_ipi)/objrsx.Fields.Item("vl_total_sem_multa_ipi").Value
					Else
                      vl_ipi = 0
                    End If
                    
                    If objrsx.Fields.Item("vl_total_sem_multa_pis").Value <> 0 Then
                      vl_pis = (vl_pis    * vl_multa_pis)/objrsx.Fields.Item("vl_total_sem_multa_pis").Value
					Else
                      vl_pis = 0
                    End If
                    
                    If objrsx.Fields.Item("vl_total_sem_multa_cofins").Value <> 0 Then
                      vl_cofins = (vl_cofins * vl_multa_cofins)/objrsx.Fields.Item("vl_total_sem_multa_cofins").Value
					Else
                      vl_cofins = 0
                    End If

					If Not fnc_TestaVar(objrs.Fields.Item("TP_PEDIDO").Value) Then
					  %>
                      <tr bgcolor="#FFFFFF" height="40">
                        <td align="center" colspan="6"><b>Um dos pedidos que fazem parte deste processo <br>não possue o tipo de pedido cadastrado no sistema local.</b></td>
                      </tr>  
                      <%
					  Exit Do	
					End If
				%>	
    			
				<tr bgcolor="#FFFFFF" height="40">
					<td align="center"><b><%= objrs.Fields.Item("ADICAO").Value%></b></td>
                    <%If objrs.Fields.Item("CD_COBERTURA").Value = 4 Then%>
					<td align="center"><b><%= tipo_pedido(2)%></b></td>
                    <%Else%>
					<td align="center"><b><%= tipo_pedido(objrs.Fields.Item("TP_PEDIDO").Value-1)%></b></td>
                    <%End if%>
                    <%
                    	If objrs.Fields.Item("TP_PEDIDO").Value = 3 or objrs.Fields.Item("TP_PEDIDO").Value = 10 or objrs.Fields.Item("TP_PEDIDO").Value = 11  or objrs.Fields.Item("CD_COBERTURA").Value = 4 or objrs.Fields.Item("TP_PEDIDO").Value = 10 Then
						color_tabela = "#E5E5E5"
						Else
						color_tabela = "#FAFDC4" 
						End If
					%>
					<td align="right"  width="100" bgcolor="<%= color_tabela%>"><%= FormatNumber(objrs.Fields.Item("VL_IPI").Value,2)%><%If vl_ipi <> 0 Then%><br><span style="color:#DF0000;font-size:8px">(<%= FormatNumber(vl_ipi,2)%>)</span><%End if%></td>
                     <%
                    	If objrs.Fields.Item("TP_PEDIDO").Value = 3 or objrs.Fields.Item("TP_PEDIDO").Value = 11  or objrs.Fields.Item("CD_COBERTURA").Value = 4 Then
						color_tabela = "#E5E5E5"
						'"#FAFDC4"
						else
						color_tabela = "#FAFDC4" 
						End If
					%>
					<td align="right" width="100" bgcolor="<%= color_tabela%>"><%= FormatNumber(objrs.Fields.Item("VL_ICMS").Value,2)%><%If vl_icms <> 0 Then%><br><span style="color:#DF0000;font-size:8px">(<%= FormatNumber(vl_icms,2)%>)</span><%End if%></td>
                    <%
                    	If objrs.Fields.Item("TP_PEDIDO").Value = 3 or objrs.Fields.Item("TP_PEDIDO").Value = 11  or objrs.Fields.Item("CD_COBERTURA").Value = 4 or objrs.Fields.Item("TP_PEDIDO").Value = 10 Then
						color_tabela = "#E5E5E5"
						'"#FAFDC4"
						else
						color_tabela = "#FAFDC4" 
						End If
					%>
					<td align="right" width="100" bgcolor="<%= color_tabela%>"><%= FormatNumber(objrs.Fields.Item("VL_PIS").Value,2)%><%If vl_pis <> 0 Then%><br><span style="color:#DF0000;font-size:8px">(<%= FormatNumber(vl_pis,2)%>)</span><%End if%></td>
                     <%
                    	If objrs.Fields.Item("TP_PEDIDO").Value = 3 or objrs.Fields.Item("TP_PEDIDO").Value = 11 or objrs.Fields.Item("CD_COBERTURA").Value = 4 or objrs.Fields.Item("TP_PEDIDO").Value = 10 Then
						color_tabela = "#E5E5E5"
						'"#FAFDC4"
						else
						color_tabela = "#FAFDC4" 
						End If
					%>
					<td align="right" width="100" bgcolor="<%= color_tabela%>"><%= FormatNumber(objrs.Fields.Item("VL_COFINS").Value,2)%><%If vl_cofins <> 0 Then%><br><span style="color:#DF0000;font-size:8px">(<%= FormatNumber(vl_cofins,2)%>)</span><%End if%></td>
				</tr>
				<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop		
%>
		<tr align="center">
					<td class="gridtit" colspan="2" align="right" style="background-color:<%=cabec_result %>;"><%=tx_lang_TDE006(cd_lang)%>:&nbsp;&nbsp;</td><td bgcolor="#FFFFFF" colspan="4" align="right"><b><%= FormatNumber(vl_recuperado,2)%></b></td>
				</tr>
	  </table>	
      <br>	
     </td></tr>      
    </table>
</body>
<%
		   objrs.Close()
		   objrsx.Close()
%>
</html>