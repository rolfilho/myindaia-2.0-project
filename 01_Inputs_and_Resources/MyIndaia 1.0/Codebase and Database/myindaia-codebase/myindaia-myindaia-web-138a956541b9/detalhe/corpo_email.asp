<%
'------------------------------------------------------------------
'Sistema MyIndaia - Detalhes de Processo(Import/Export)
'Arquivo de Script e HTML: Opções extras para o e-mail.
'
'Criado: 05/10/2006
'Autor: Alexandre Gonçalves Neto
'Modificado: 
'------------------------------------------------------------------
'recupera os dados do processo
nr_processo = Request("nr_processo")
url = "?nr_processo="& nr_processo

If Mid(nr_processo, 3, 2) = "01" Then
		sql = "SELECT PR.DT_ABERTURA, PR.TX_MERCADORIA, PR.NR_CONHECIMENTO, PR.NR_VOO, PR.NR_CAMINHAO, SV.CD_VIA_TRANSPORTE, "&_
					"  UA.NM_USUARIO, UA.NM_EMAIL AS TX_EMAIL_ANALISTA, "&_
					"  F1.DT_PREVISTA AS DT_PREV_162, F1.DT_REALIZACAO AS DT_REAL_162, "&_
					"  F2.DT_PREVISTA AS DT_PREV_154, F2.DT_REALIZACAO AS DT_REAL_154, "&_
					"  F3.DT_PREVISTA AS DT_PREV_259, F3.DT_REALIZACAO AS DT_REAL_259, "&_
					"  (SELECT CD_UNID_NEG+' - '+AP_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = PR.CD_UNID_NEG) AS NM_UNID_NEG, "&_
					"  (SELECT NM_GRUPO FROM TGRUPO (NOLOCK) WHERE CD_GRUPO = EN.CD_GRUPO) AS NM_CLIENTE, "&_
					"  (SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = PR.CD_PAIS_ORIGEM) AS NM_PAIS_ORIGEM, "&_
					"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
					"  (SELECT NM_VIA_TRANSPORTE FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_MODALIDADE, "&_
					"  (SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CONTATO = PR.CD_CONTATO AND CD_UNID_NEG = PR.CD_UNID_NEG AND CD_PRODUTO = PR.CD_PRODUTO AND CD_CLIENTE = PR.CD_CLIENTE) AS NM_ANALISTA_CLIENTE "&_
					"FROM TPROCESSO PR (NOLOCK) "&_
					"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA  = PR.CD_CLIENTE) "&_
					"  INNER JOIN TSERVICO     SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
					"  LEFT  JOIN TUSUARIO     UA (NOLOCK) ON (UA.CD_USUARIO  = PR.CD_ANALISTA_COMISSARIA) "&_
					"  LEFT  JOIN TFOLLOWUP    F1 (NOLOCK) ON (F1.NR_PROCESSO = PR.NR_PROCESSO AND F1.CD_EVENTO = '162') "&_
					"  LEFT  JOIN TFOLLOWUP    F2 (NOLOCK) ON (F2.NR_PROCESSO = PR.NR_PROCESSO AND F2.CD_EVENTO = '154') "&_
					"  LEFT  JOIN TFOLLOWUP    F3 (NOLOCK) ON (F3.NR_PROCESSO = PR.NR_PROCESSO AND F3.CD_EVENTO = '259') "&_
					"WHERE PR.NR_PROCESSO = '"& nr_processo &"'"
End If

If Mid(nr_processo, 3, 2) = "02" Then
	sql = "SELECT PR.DT_ABERTURA, PR.TX_MERCADORIA, PR.NR_CONHECIMENTO, PR.NR_VOO, PR.NR_CAMINHAO, SV.CD_VIA_TRANSPORTE, "&_
				"  UA.NM_USUARIO, UA.NM_EMAIL AS TX_EMAIL_ANALISTA, F1.DT_REALIZACAO AS DT_REAL_132, F2.DT_REALIZACAO AS DT_REAL_165, "&_
				"  (SELECT CD_UNID_NEG+' - '+AP_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = PR.CD_UNID_NEG) AS NM_UNID_NEG, "&_
				"  (SELECT NM_GRUPO FROM TGRUPO (NOLOCK) WHERE CD_GRUPO = EN.CD_GRUPO) AS NM_CLIENTE, "&_
				"  (SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = PR.CD_PAIS_DESTINO) AS NM_PAIS_DESTINO, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_VIA_TRANSPORTE FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_MODALIDADE, "&_
				"  (SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CONTATO = PR.CD_CONTATO AND CD_UNID_NEG = PR.CD_UNID_NEG AND CD_PRODUTO = PR.CD_PRODUTO AND CD_CLIENTE = PR.CD_CLIENTE) AS NM_ANALISTA_CLIENTE "&_
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA  = PR.CD_CLIENTE) "&_
				"  INNER JOIN TSERVICO     SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
				"  LEFT  JOIN TUSUARIO     UA (NOLOCK) ON (UA.CD_USUARIO  = PR.CD_ANALISTA_COMISSARIA) "&_
				"  LEFT  JOIN TFOLLOWUP    F1 (NOLOCK) ON (F1.NR_PROCESSO = PR.NR_PROCESSO AND F1.CD_EVENTO = '132') "&_
				"  LEFT  JOIN TFOLLOWUP    F2 (NOLOCK) ON (F2.NR_PROCESSO = PR.NR_PROCESSO AND F2.CD_EVENTO = '165') "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"'"
End If
'Response.Write(sql)
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

tx_email_analista = objrs.Fields.Item("TX_EMAIL_ANALISTA").Value
'assunto da mensagem
tx_subject = "[MyIndaia WEB] - Processo "& Mid(nr_processo, 5, 13)
'corpo da mensagem
tx_body = ""

Function fnc_EditaBoby(tx_mensagem)
'OBJETIVO: adciona opções extras ao e-mail sobre o processo
	Dim tx_html
	Dim tp_transp
	Dim nm_transp
	Dim dt_prev
	Dim dt_real
	Dim tx_prev
	Dim tx_real
	Dim tp_pais
	Dim tx_pais
	
	If Mid(nr_processo, 3, 2) = "01" Then
		Select Case Trim(objrs.Fields.Item("CD_VIA_TRANSPORTE").Value)
			Case "01" 'Maritimo
				dt_prev = fnc_Mascara(Trim(objrs.Fields.Item("DT_PREV_162").Value), 5)
				dt_real = fnc_Mascara(Trim(objrs.Fields.Item("DT_REAL_162").Value), 5)
			Case "04" 'Aereo
				dt_prev = fnc_Mascara(Trim(objrs.Fields.Item("DT_PREV_154").Value), 5)
				dt_real = fnc_Mascara(Trim(objrs.Fields.Item("DT_REAL_154").Value), 5)
			Case "07" 'Rodoviaria
				dt_prev = fnc_Mascara(Trim(objrs.Fields.Item("DT_PREV_259").Value), 5)
				dt_real = fnc_Mascara(Trim(objrs.Fields.Item("DT_REAL_259").Value), 5)
		End Select
		tx_prev = "Previs&atilde;o de Chegada"
		tx_real = "Chegada"
		tp_pais = "Pa&iacute;s de Origem"
		tx_pais = Trim(objrs.Fields.Item("NM_PAIS_ORIGEM").Value)
	End If
	
	If Mid(nr_processo, 3, 2) = "02" Then
		dt_prev = fnc_Mascara(Trim(objrs.Fields.Item("DT_REAL_132").Value), 5)
		dt_real = fnc_Mascara(Trim(objrs.Fields.Item("DT_REAL_165").Value), 5)
		tx_prev = "Data de Saída(132)"
		tx_real = "Embarque Confirmado(165)"
		tp_pais = "Pa&iacute;s de Destino"
		tx_pais = Trim(objrs.Fields.Item("NM_PAIS_DESTINO").Value)
	End If
	
	Select Case Trim(objrs.Fields.Item("CD_VIA_TRANSPORTE").Value)
		Case "01" 'Maritimo
			tp_transp = "Navio"
			nm_transp = Trim(objrs.Fields.Item("NM_EMBARCACAO").Value)
		Case "04" 'Aereo
			tp_transp = "Nr. Vôo"
			nm_transp = Trim(objrs.Fields.Item("NR_VOO").Value)
		Case "07" 'Rodoviaria
			tp_transp = "Nr. Caminhão"
			nm_transp = Trim(objrs.Fields.Item("NR_CAMINHAO").Value)
	End Select
	
	tx_html = "<html><head><style>"&_
						"body {font-family:Verdana, Arial, Helvetica; color:#000000; background-color:#FFFFFF; margin:0px; padding:0px;}"&_
						"th {font-size:10px;}"&_
						"td {font-size:10px;}"&_
						"tr {font-size:10px;}"&_
						".titulo {font-style:italic; font-weight:bold; font-size:14px;}"&_
						".info {font-weight:bold;}"&_
						"</style></head><body><table border=""0"" cellspacing=""1"" cellpadding=""2"">"&_
						"<tr><td colspan=""2"">"& Replace(Replace(tx_mensagem, "'", "´"), vbcrlf, "<br>") &"</td></tr>"&_
						"<tr><td colspan=""2"">&nbsp;</td></tr>"&_
						"<tr><td colspan=""2"" class=""titulo"">Informa&ccedil;&otilde;es do Processo</td></tr>"&_
						"<tr><td width=""100"">Unidade</td><td class=""info"">"& Trim(objrs.Fields.Item("NM_UNID_NEG").Value) & "</td></tr>"&_
						"<tr><td>Processo</td><td class=""info"">"& Mid(nr_processo, 5, 13) & "</td></tr>"&_
						"<tr><td>Abertura</td><td class=""info"">"& fnc_Mascara(objrs.Fields.Item("DT_ABERTURA").Value, 5) &"</td></tr>"&_
						"<tr><td>Cliente</td><td class=""info"">"& Trim(objrs.Fields.Item("NM_CLIENTE").Value) &"</td></tr>"&_
						"<tr><td>Contato</td><td class=""info"">"& Trim(objrs.Fields.Item("NM_ANALISTA_CLIENTE").Value) &"</td></tr>"&_
						"<tr><td>Mercadoria</td><td class=""info"">"& Trim(objrs.Fields.Item("TX_MERCADORIA").Value) &"</td></tr>"&_
						"<tr><td>"& tp_pais &"</td><td class=""info"">"& tx_pais &"</td></tr>"&_
						"<tr><td>Modalidade</td><td class=""info"">"& Trim(objrs.Fields.Item("NM_MODALIDADE").Value) &"</td></tr>"&_
						"<tr><td>"& tp_transp &"</td><td class=""info"">"& nm_transp &"</td></tr>"&_
						"<tr><td>"& tx_prev &"</td><td class=""info"">"& dt_prev &"</td></tr>"&_
						"<tr><td>"& tx_real &"</td><td class=""info"">"& dt_real &"</td></tr>"&_
						"<tr><td>Nr. do House</td><td class=""info"">"& Trim(objrs.Fields.Item("NR_CONHECIMENTO").Value) &"</td></tr>"&_
						"</table></body></html>"
	
	fnc_EditaBoby = tx_html
End Function
%>