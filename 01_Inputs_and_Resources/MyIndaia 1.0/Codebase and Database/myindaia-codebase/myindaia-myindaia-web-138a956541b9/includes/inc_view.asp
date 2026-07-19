<%
Dim cd_evento, nm_evento_lim, dt_eventoi_lim, dt_eventof_lim 'código do evento limitador de registros
Dim nr_dias   'qtde de dias do evento limitador
Dim tp_limitador 
Dim ap_menu   'nome simplificado do menu
Dim ap_subm   'nome simplificado do sub-menu
Dim in_doctos 'exibe ou não link para documentos digitalizados
Dim tx_nao_exibe 'não selecionar os campos incluidos aqui
Dim cd_ordem  'nome dos campos de ordenação
Dim tp_ordem  'ordenação do campo(0-ascendente; 1-descendente)
dim vNmSProc
DIM tx_nao_exibe_03
dim in_kpi_opcao

'sae não tiver personalização seleciona a padrão do sistema
If Not fnc_TestaVar(cd_view) Then
  cd_view = Application("cd_sys_user") &"-"& cd_menu & cd_subm &"-01"
End If
'seleciona os dados da personalização
If objrsx.State = adStateOpen Then objrsx.Close
 
sql = "SELECT "&_
			"  M06_CD_VIEW, M06_NM_VIEW, M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL, M06_IN_PRINT, "&_
			"  M06_IN_DOCTOS, M06_TP_RELAT, M06_TP_QUEBRA, M06_TP_REF_CLI, M06_CD_CAMPO, M06_TP_ORDEM, M06_CD_EVENTO, M06_CD_EVENTO_2, M06_NR_DIAS, M06_NR_DIAS_2, M06_IN_KPI, M06_TP_LIMITADOR, M06_TP_LIMITADOR_AUX," &_
			"  M06_TP_LIMITADOR_2, M06_TP_LIMITADOR_AUX_2, RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, "&_
			"  M02_NM_SPROC, M06_CD_ARQUIVO, M06_CD_GRUPO, M06_CD_CLIENTE, M06_CD_MODAL, M06_CD_UNIDADE, M06_CD_AREA, M06_CD_CELULA, M06_CD_LOCAL_DESEMBARQUE, M06_CD_TRANSP, M06_CD_STATUS_CRODA, ISNULL(M06_EVENTOS_MARCADOS,'') AS M06_EVENTOS_MARCADOS, M06_CD_ARMADOR, M06_CD_IMPORTADOR "&_
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
vNmSProc = objrsx.Fields.Item("M02_NM_SPROC").Value
in_embarque = objrsx.Fields.Item("M06_IN_EMBARQUE").Value
in_doctos   = objrsx.Fields.Item("M06_IN_DOCTOS").Value
tp_relat    = objrsx.Fields.Item("M06_TP_RELAT").Value
tp_ref_cli  = objrsx.Fields.Item("M06_TP_REF_CLI").Value
cd_evento   = objrsx.Fields.Item("M06_CD_EVENTO").Value
cd_evento_2   = objrsx.Fields.Item("M06_CD_EVENTO_2").Value
nr_dias     = objrsx.Fields.Item("M06_NR_DIAS").Value
nr_dias_2     = objrsx.Fields.Item("M06_NR_DIAS_2").Value
in_dt_prev   = objrsx.Fields.Item("M06_IN_DT_PREV").Value
in_btn_excel2 = 1
in_btn_print2 = 1
tp_quebra    = objrsx.Fields.Item("M06_TP_QUEBRA").Value
cd_ordem     = objrsx.Fields.Item("M06_CD_CAMPO").Value
tp_ordem     = objrsx.Fields.Item("M06_TP_ORDEM").Value
in_kpi_opcao = objrsx.Fields.Item("M06_IN_KPI").Value
tp_limitador = objrsx.Fields.Item("M06_TP_LIMITADOR").Value
tp_limitador_aux = objrsx.Fields.Item("M06_TP_LIMITADOR_AUX").Value
tp_limitador_2 = objrsx.Fields.Item("M06_TP_LIMITADOR_2").Value
tp_limitador_aux_2 = objrsx.Fields.Item("M06_TP_LIMITADOR_AUX_2").Value
cd_arquivos = objrsx.Fields.Item("M06_CD_ARQUIVO").Value
cd_grupo_view = objrsx.Fields.Item("M06_CD_GRUPO").Value
cd_cliente_view = objrsx.Fields.Item("M06_CD_CLIENTE").Value
cd_modal_view = objrsx.Fields.Item("M06_CD_MODAL").Value
cd_unid_view = objrsx.Fields.Item("M06_CD_UNIDADE").Value
cd_area_view = objrsx.Fields.Item("M06_CD_AREA").Value
cd_celula_view = objrsx.Fields.Item("M06_CD_CELULA").Value
cd_local_des_view = objrsx.Fields.Item("M06_CD_LOCAL_DESEMBARQUE").Value
cd_transp_view = objrsx.Fields.Item("M06_CD_TRANSP").Value
cd_armador_view = objrsx.Fields.Item("M06_CD_ARMADOR").Value
cd_importador_view = objrsx.Fields.Item("M06_CD_IMPORTADOR").Value
cd_status_croda_view = objrsx.Fields.Item("M06_CD_STATUS_CRODA").Value
cd_ordenacao_view = objrsx.Fields.Item("M06_CD_CAMPO").Value
tp_ordenacao_view = objrsx.Fields.Item("M06_TP_ORDEM").Value
eventos_marcados = objrsx.Fields.Item("M06_EVENTOS_MARCADOS").Value

Dim kpi_cabec
If in_kpi_opcao = "1" Then
    kpi_cabec = " (" & tx_lang_CV008(cd_lang) & ") "
Else
    kpi_cabec = " (" & tx_lang_CV014(cd_lang) & ") "
End If

If Not fnc_TestaVar(tx_nao_exibe) Then tx_nao_exibe = ""

If in_view_filtro = 1 Then

  ' ***** SELECIONA OS FILTROS DA PERSONALIZAÇÃO *****
  sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, LOWER(RTRIM(M10_AP_FILTRO)) AS M10_AP_FILTRO, "&_
				"  M10_TP_DADO, M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, "&_
				"  M11_IN_CHECK, M11_IN_OBRIGADO, M11_TP_FROM, M11_IN_CONTEM, M11_IN_MM, M11_IN_DIF,M11_IN_VAZIO,M11_IN_VARIOS,  M11_NR_ORDEM, M13_IN_PADRAO, M13_VL_PADRAO "&_
				"FROM M13_VIEW_FILTRO ( NOLOCK ) "&_
				"  INNER JOIN M11_FILTRO ( NOLOCK ) ON ( M11_CD_FILTRO = M13_CD_FILTRO ) "&_
				"  INNER JOIN M10_DADOS  ( NOLOCK ) ON ( M10_CD_DADO   = M11_CD_DADO   ) "&_
				"WHERE M13_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M11_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M11_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
				"ORDER BY M11_NR_ORDEM"

End If


If in_view_campo = 1 Then
in_btn_excel = 1
in_btn_print = 1
in_btn_lupa = 0
in_btn_email = objrsx.Fields.Item("M06_IN_EMAIL").Value


if cd_menu = "03" and flag_resumo = 1 Then
	if Session("cd_cargo") <> "131" Then
	tx_nao_exibe_03 = tx_nao_exibe & "','0276','0472','0085','0068','0009','0012','0014','0023','0049','0482','0225','0512','0133','0086','0069','0010','0013','0002','0058','0103','0471','0492','0493','0498','0491','0490"
	Else
	tx_nao_exibe_03 = tx_nao_exibe & "','0276','0472','0085','0068','0009','0012','0014','0023','0049','0482','0225','0512','0133','0086','0069','0010','0013','0002','0058','0492','0493','0498','0491','0490','0103','0136','0469','0471','0470','0480','0485','0133','0296','0017','0481','0283','0177','0471','0103','0044"
	End If

  sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir2")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M12_TP_GRUPO   <> 2 " &_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe_03 &" ') "&_
				"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"
Else  
  ' ***** SELECIONA OS CAMPOS DA PERSONALIZAÇÃO *****
  sql = "SELECT " &_
				"  M10_CD_DADO, LTRIM(RTRIM("& tx_lang_dado &")) AS M10_NM_DADO, UPPER(LTRIM(RTRIM(M10_AP_CAMPO))) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO, M14_NR_ORDEM, NULL AS M14_TP_KPI "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir2")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
				" UNION "&_
	            " SELECT 'KPIX', '(KPI) ' + (SELECT RTRIM("& tx_lang_dado &") AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4))" &_
				" + ' x ' + (SELECT RTRIM("& tx_lang_dado &") AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO,"&_
				" (SELECT RTRIM(M10_AP_CAMPO) AS "&_
				" M10_AP_CAMPO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
				" + 'x' + (SELECT RTRIM(M10_AP_CAMPO) AS M10_AP_CAMPO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS AP_CAMPO, '0', '5', NULL, "&_
				" NULL, NULL, NULL, NULL, NULL, "&_
				" NULL, NULL, '0',NULL, M14_NR_ORDEM, M14_TP_KPI AS M14_TP_KPI "&_
				" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI'"&_
                " UNION "&_
                " SELECT 'ARQ', '(FILE) ' + (SELECT NM_TIPO_DOCTO FROM BROKER.DBO.TTP_DOCTO_DIGITALIZADO WHERE ID_TABELA IN (1652005462) AND CD_TIPO_DOCTO = CONVERT(INT, RIGHT(LTRIM(RTRIM(M14_CD_CAMPO)), 4))) AS M10_NM_DADO,  "&_
                " M14_CD_CAMPO AS M10_AP_CAMPO, 'A', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0',NULL, M14_NR_ORDEM, NULL AS M14_TP_KPI "&_
                " FROM M14_VIEW_CAMPO  "&_
                " WHERE M14_CD_VIEW = '" & cd_view & "'  "&_
                " AND LEFT(M14_CD_CAMPO,3) = 'ARQ' "

				If cd_menu = "03" or (cd_menu & cd_subm = "0104") Then
				sql = sql & " ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"
				Else
				sql = sql & " ORDER BY M14_NR_ORDEM"
				End If
End If
End If
objrsx.Close()

'Response.Write(sql)
'Response.end
If in_view_filtro = 1 or in_view_campo = 1 Then
	If objrsv.State = adStateOpen Then objrsv.Close
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  'Response.write sql
  'Response.end
	objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End If 


if fnc_testavar(cd_evento) then

if tp_limitador = "2" or tp_limitador = "3" Then
    If Not fnc_TestaVar(nr_dias) Then nr_dias = 0
    dt_eventoi_lim = fnc_mascara(DateAdd("d", -nr_dias, Date), 5)
    dt_eventof_lim = fnc_mascara(date, 5)
End If

sql = "SELECT "&_
				"M.M06_CD_EVENTO, RTRIM(D."& tx_lang_dado &") AS M10_NM_DADO "&_
				"FROM M06_VIEW M INNER JOIN M10_DADOS D ON D.M10_CD_BROKER = M.M06_CD_EVENTO "&_
				"WHERE M.M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
                'Response.write sql
                'Response.end
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
if objrsx.RecordCount > 0 then
  nm_evento_lim = objrsx.Fields.Item("M10_NM_DADO").Value
End If
objrsx.Close()
end if          

if fnc_testavar(cd_evento_2) then

if tp_limitador_2 = "2" or tp_limitador_2 = "3" Then
    If Not fnc_TestaVar(nr_dias_2) Then nr_dias_2 = 0
    dt_eventoi_lim_2 = fnc_mascara(DateAdd("d", -nr_dias_2, Date), 5)
    dt_eventof_lim_2 = fnc_mascara(date, 5)
End If

sql = "SELECT "&_
				"M.M06_CD_EVENTO, RTRIM(D."& tx_lang_dado &") AS M10_NM_DADO "&_
				"FROM M06_VIEW M INNER JOIN M10_DADOS D ON D.M10_CD_BROKER = M.M06_CD_EVENTO_2 "&_
				"WHERE M.M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
if objrsx.RecordCount > 0 then
  nm_evento_lim_2 = objrsx.Fields.Item("M10_NM_DADO").Value
End If
objrsx.Close()

end if
if tx_erro <> "" Then %>
<script>
    alert('<%=tx_erro %>')
</script>
<%End If %>