<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Relatórios
'Arquivo de Script e HTML: montagem do nome da tela e url com filtros
'
'Autor Alexandre Gonçalves Neto
'Criado: 02/06/2006
'
'Manutenção: 02/06/2006
'---------------------------------------------------------------------------

'seleciona a qtde de datas utilizadas como filtro
sql = "SELECT COUNT(*) AS VL_TOTAL "&_
			"FROM M10_DADOS ( NOLOCK ) "&_
			"WHERE M10_AP_FILTRO IN ('"& ap_filtros &"') "&_
			"  AND M10_TP_DADO = '1'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'seta a variavel com a qtde de filtros de data
cont = objrsx.Fields.Item("VL_TOTAL").Value
objrsx.Close
'verifica qual é o script (result, print ou excel)
If InStr(Request.ServerVariables("SCRIPT_NAME"), "result") > 0 Then
	nm_tela = nm_menu &" &gt;&gt; "& nm_subm &" &gt;&gt; "& nm_view
	If cont > 0 Then nm_tela = nm_tela &" &gt;&gt; Período de " 
Else
	nm_tela = nm_subm &" "& nm_menu
	If cont > 0 Then nm_tela = nm_tela &"<br>Período de "
End If

'seleciona os dados dos filtros utilizados
sql = "SELECT M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_AP_FILTRO, M10_TP_DADO "&_
			"FROM M11_FILTRO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
			"WHERE M11_CD_MENU = '"& cd_menu &"' "&_
			"  AND M11_CD_SUBM = '"& cd_subm &"' "&_
			"  AND M11_CD_DADO = M10_CD_DADO "&_
			"  AND M10_AP_FILTRO IN ('"& ap_filtros &"') "&_
			"ORDER BY M11_NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrsx.RecordCount > 0 Then
	Do While Not objrsx.Eof
		ap_filtro = objrsx.Fields.Item("M10_AP_FILTRO").Value
		If cont > 0 and objrsx.Fields.Item("M10_TP_DADO").Value = 1 Then
			dt_ini = Left(Request.QueryString(ap_filtro), 10)
			dt_fim = Right(Request.QueryString(ap_filtro), 10)
			If IsDate(dt_ini) and IsDate(dt_fim) Then
				nm_tela = nm_tela & dt_ini &" à "& dt_fim &" do(a) "& objrsx.Fields.Item("M10_NM_DADO").Value
			End If
		End If
		url = url &"&filtro="& ap_filtro &"&"& ap_filtro &"="& Request.QueryString(ap_filtro)
		
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
	Loop
End If
objrsx.Close
%>