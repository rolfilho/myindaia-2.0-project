<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%

Dim sql_dados
cd_view  = Request.QueryString("cd_view")
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
nr_parcial = CStr(Request.QueryString("nr_parcial"))

	if objrsx.State = adStateOpen then objrsx.Close()
  	sql_dados = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M12_TP_GRUPO   = 1 " &_
				"  AND M10_CD_DADO IN ('0472','0085','0068','0009','0012','0014','0023','0049','0482','0225','0512','0133','0086','0069','0010','0013','0058','0492','0493','0498','0491','0490') "&_
				"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"
	objrsx.Open sql_dados, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	
sql_s = "SELECT PR.NR_PROCESSO, PR.CD_UNID_NEG, PR.CD_PRODUTO, PR.CD_EMBARCACAO, PR.NR_VIAGEM, PR.NR_VOO, PR.NR_CAMINHAO, "&_
					"  PR.CD_CLIENTE, SV.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados
	If objrsx.RecordCount > 0 Then objrsx.MoveFirst
	Do While Not objrsx.Eof
		If objrsx.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsx.Fields.Item("M10_TP_DADO").Value & objrsx.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &_
						" ISNULL("& objrsx.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsx.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "10" 'Datas direto de tabela
					sql_s = sql_s &_
						" "& objrsx.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsx.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","11","21","31","41"'String - Lookup
					sql_s = sql_s &_
						" ( SELECT TOP 1 "& objrsx.Fields.Item("M10_NM_DESCRICAO").Value &_
						"   FROM "& objrsx.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
						"   WHERE "& objrsx.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsx.Fields.Item("M12_NM_CH_ORIGEM").Value &_
						" ) AS "& objrsx.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "20","30","40"'Decimal, Moeda, Inteiro
					sql_s = sql_s &_
						" ISNULL("& objrsx.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "04"'String - Tipo de Consulta com INNER JOIN e sem WHERE
							sql_s = sql_s &_
								"(SELECT TOP 1 "& objrsx.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsx.Fields.Item("M10_NM_TABELA").Value &_
								") AS "& objrsx.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsx.MoveNext
		If objrsx.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
  sql_f = "FROM TPROCESSO PR (NOLOCK) "&_
					"  INNER JOIN TSERVICO      SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
					"  LEFT  JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PR.NR_PROCESSO) "
	'requisitos da pesquisa
	sql_w = "WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w
	Session("sql_dados_detalhe") = sql
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_dados_detalhe") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<table width="90%" heigth="90%" border="0" cellpadding="0" cellspacing="0" align="center">
     <tr><td align="left" valign="top">
     <br>
     <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#f0f1f6" style="padding: 0px 1px 0px 1px;">
     <%
	 If objrsx.RecordCount > 0 Then objrsx.MoveFirst 
	 Do While Not objrsx.Eof
		nm_campo_rel = Trim(objrsx.Fields.Item("M10_AP_CAMPO").Value)
				Select Case objrsx.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					
%>
									<td class="gridtit" width="30%"><nobr>&nbsp;<%=objrsx.Fields.Item("M10_NM_DADO").Value%>&nbsp;</nobr></td>
									<td align="left" bgcolor="#FFFFFF">&nbsp;<%= str%>&nbsp;</td>
									<%
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
%>
					<td class="gridtit" width="30%"><nobr>&nbsp;<%=objrsx.Fields.Item("M10_NM_DADO").Value%>&nbsp;</nobr></td>
									<td align="left" bgcolor="#FFFFFF">&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</td>
									<%
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
					<td class="gridtit" width="30%"><nobr>&nbsp;<%=objrsx.Fields.Item("M10_NM_DADO").Value%>&nbsp;</nobr></td>
									<td align="left" bgcolor="#FFFFFF">&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
					<td class="gridtit" width="30%"><nobr>&nbsp;<%=objrsx.Fields.Item("M10_NM_DADO").Value%>&nbsp;</nobr></td>
									<td align="left" bgcolor="#FFFFFF">&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
%>
									<%
			End Select	
				%>
				</tr>
              <%
			  objrsx.MoveNext
			  If objrsx.Eof Then Exit Do
			  Loop
			  objrs.Close
			  %>
	 </table>		
     <br>
     </td></tr>
</table>
</body>
</html>