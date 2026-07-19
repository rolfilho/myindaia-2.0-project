<%
Dim ap_menu   'nome simplificado do menu
Dim ap_subm   'nome simplificado do sub-menu

If Not fnc_TestaVar(cd_view) Then
  cd_view = Application("cd_sys_user") &"-"& cd_menu & cd_subm &"-01"
End If

sql = "SELECT "&_
			"  M06_CD_VIEW, M06_NM_VIEW, M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL, M06_IN_PRINT, "&_
			"  M06_IN_DOCTOS, M06_TP_RELAT, M06_TP_QUEBRA, M06_TP_REF_CLI, M06_TX_ORDEM, M06_CD_EVENTO, M06_NR_DIAS, " &_
			"  RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM "&_
			"FROM M06_VIEW (NOLOCK) " &_
			"  INNER JOIN M01_MENU (NOLOCK) ON (M01_CD_MENU = M06_CD_MENU) "&_
			"  INNER JOIN M02_SUBM (NOLOCK) ON (M02_CD_MENU+M02_CD_SUBM = M06_CD_MENU+M06_CD_SUBM) "&_
			"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

nm_menu = objrsx.Fields.Item("M01_NM_MENU").Value
ap_menu = objrsx.Fields.Item("M01_AP_MENU").Value
nm_subm = objrsx.Fields.Item("M02_NM_SUBM").Value
ap_subm = objrsx.Fields.Item("M02_AP_SUBM").Value
nm_view = objrsx.Fields.Item("M06_NM_VIEW").Value

in_embarque = objrsx.Fields.Item("M06_IN_EMBARQUE").Value
tp_relat    = objrsx.Fields.Item("M06_TP_RELAT").Value
tp_ref_cli  = objrsx.Fields.Item("M06_TP_REF_CLI").Value

If in_view_filtro = 1 Then
  ' ***** SELECIONA OS FILTROS DA PERSONALIZAÇÃO *****
  sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, LOWER( M10_AP_FILTRO ) AS M10_AP_FILTRO, "&_
				"  M10_TP_DADO, M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, "&_
				"  M11_IN_CHECK, M11_IN_OBRIGADO, M11_TP_FROM, M11_NR_ORDEM, M13_IN_PADRAO, M13_VL_PADRAO "&_
				"FROM M13_VIEW_FILTRO ( NOLOCK ) "&_
				"  INNER JOIN M11_FILTRO ( NOLOCK ) ON ( M11_CD_FILTRO = M13_CD_FILTRO ) "&_
				"  INNER JOIN M10_DADOS  ( NOLOCK ) ON ( M10_CD_DADO   = M11_CD_DADO   ) "&_
				"WHERE M13_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M11_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M11_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"ORDER BY M11_NR_ORDEM"
End If

If in_view_campo = 1 Then
  in_dt_prev   = objrsx.Fields.Item("M06_IN_DT_PREV").Value
  in_btn_excel = objrsx.Fields.Item("M06_IN_DOWNLOAD").Value
  in_btn_email = objrsx.Fields.Item("M06_IN_EMAIL").Value
  in_btn_print = objrsx.Fields.Item("M06_IN_PRINT").Value
  tp_quebra    = objrsx.Fields.Item("M06_TP_QUEBRA").Value
  tx_ordem     = objrsx.Fields.Item("M06_TX_ORDEM").Value
  
  ' ***** SELECIONA OS CAMPOS DA PERSONALIZAÇÃO *****
  sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER( M10_AP_CAMPO ) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"ORDER BY M12_NR_ORDEM"
End If
objrsx.Close()

If in_view_filtro = 1 or in_view_campo = 1 Then
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End If 
%>