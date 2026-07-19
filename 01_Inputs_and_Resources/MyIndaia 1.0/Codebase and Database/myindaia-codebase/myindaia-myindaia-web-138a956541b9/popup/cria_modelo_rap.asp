<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Funções do sistema
'Arquivo de Script e HTML: Localiza um registro no BD
'
'Autor Kleber Guedes
'Manutenção: Alexandre(26/02/2007)
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
vInDebug = false
	Dim rap_modelo, rap_maxima, cliente_modelo, flag_insere
	dim vCodExportador, vCodLogomarca, vCodFabricante, vCodCliente, vCodPais, vCodCondPagto, vTpDrawback, vCodAgenteComissao
dim vCodIncoterm, vCodDepColeta, vCodLocalColeta, vCodTerminal, vCodViaTransp, vCodEmbarcador, vCodEmbarcacao, vCodLocalEmb
dim vCodLocalDesemb, vCodNotify, vCodConsignee, vCodBanco, vNrCDE, vNrFornec, vNrVoo, vNrAtoDrawback, vNrInspecao, vNrNotaCredito
dim vInFabrExpo, vInTriangulacao, vInPermisso, vInEmbalagem, vInConsulado, vInPalletExpurgo, vInExpurgo, vInInspecao
dim vInCartaCredito, vDtFaturamento, vDtEmbarque, vDtInspecao, vDtDeadLineDraft, vDtDeadLineCarga, vDtRecebido, vDtFechado
dim vDtPrevSaida, vTpNotify, vTpConsignee, vTxOrgao, vTxLocalInspecao, vTxMarcacao, vTxInstEmb, vVlComissao, vVlMLE
dim vVlSeguro, vVlAcrescimo, vVlDesconto, vCodFormaPagar, vCodMoedaMLE, vNrViagem, vInCadivi, vTxLocalExpurgo, vVlFreteInt
dim vVlPesoBruto, vVlPesoLiq, vVlCubagem, vTxEmbalagem, vInAmostra, vInAntecipado, vTxMotivoDesc, vVlQtdVolume,vInCourrier
dim checkrap,chkCodViaTransp
dim edtTxEmbalagem

	rap_modelo = Request("rap")
	cliente_modelo = Request("cliente")
	flag_insere = 0
	
	If objrsx.State = adStateOpen then objrsx.Close()
	sql = " SELECT MAX(CD_RAP) AS RAP_MAXIMA FROM TRAP WHERE IN_MODELO = '1' "
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If fnc_TestaVar(objrsx.Fields.Item("RAP_MAXIMA").Value) Then
		rap_maxima = fnc_AddZeros(objrsx.Fields.Item("RAP_MAXIMA").Value + 1,6)
	Else	
		rap_maxima = "000001"
	End If
	
	If rap_maxima <> "000001" Then
		If objrsx.State = adStateOpen then objrsx.Close()
		sql = " SELECT CD_RAP FROM TRAP WHERE IN_MODELO = '1' AND CD_CLIENTE = '" & cliente_modelo & "' AND CD_GRUPO = '" & Session("GrupoUsuario") & "'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		If objrsx.RecordCount > 0 Then
			flag_insere = 1
			Response.write("false")
		Else
			flag_insere = 0
			Response.write("true")
		End If
	Else
		Response.write("true")	
	End If
	
	
	if 	flag_insere = 0 Then
	If objrsx.State = adStateOpen then objrsx.Close()	
	sql = "SELECT CD_RAP, CD_RAP_ANO,IN_COURRIER, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO, "&_
					"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
					"  CD_INCOTERM, CD_DEP_COLETA, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
					"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
					"  NR_FORNECIMENTO, NR_CDE, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
					"  CAST(IN_FABR_EXPO as int) AS IN_FABR_EXPO, CAST(IN_TRIANGULACAO as int) AS IN_TRIANGULACAO, "&_
					"  CAST(IN_PERMISSO as int) AS IN_PERMISSO, CAST(IN_DECL_EMBALAGEM as int) AS IN_DECL_EMBALAGEM, "&_
					"  CAST(IN_CONSULADO as int) AS IN_CONSULADO, CAST(IN_PALLET_EXPURGO as int) AS IN_PALLET_EXPURGO, "&_
					"  CAST(IN_EXPURGO as int) AS IN_EXPURGO, CAST(IN_INSPECAO as int) AS IN_INSPECAO, "&_
					"  CAST(IN_CARTA_CREDITO as int) AS IN_CARTA_CREDITO, CAST(IN_CADIVI as int) AS IN_CADIVI, "&_
					"  CAST(IN_AMOSTRA as int) AS IN_AMOSTRA, CAST(IN_ANTECIPADO as int) AS IN_ANTECIPADO, "&_
					"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
					"  TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
					"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
					"  ISNULL(VL_COMISSAO, 0) AS VL_COMISSAO, ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_SEGURO, 0) AS VL_SEGURO, "&_
					"  ISNULL(VL_ACRESCIMO, 0) AS VL_ACRESCIMO, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(VL_FRETE_INT, 0) AS VL_FRETE_INT, "&_
					"  ISNULL(VL_QTDE_PROD, 0) AS VL_QTDE_PROD, ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, "&_
					"  ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL "&_
					"  FROM TRAP (NOLOCK) "&_
                    "  WHERE CD_RAP+CD_RAP_ANO = '"& rap_modelo &"'"&_ 
		  			"  AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'define variaveis para exibição no form
		vCodExportador   = objrsx.Fields.Item("CD_EXPORTADOR").Value
		vCodLogomarca    = objrsx.Fields.Item("CD_LOGOMARCA").Value
		vCodFabricante   = objrsx.Fields.Item("CD_FABRICANTE").Value
		vCodCliente      = objrsx.Fields.Item("CD_CLIENTE").Value
		vCodPais         = objrsx.Fields.Item("CD_PAIS").Value
		vCodCondPagto    = objrsx.Fields.Item("CD_TERMO_PAGTO").Value
		vCodAgenteComissao = objrsx.Fields.Item("CD_AGENTE_COMISSAO").Value
		vCodIncoterm     = objrsx.Fields.Item("CD_INCOTERM").Value
		vCodDepColeta    = objrsx.Fields.Item("CD_DEP_COLETA").Value
		vCodLocalColeta  = objrsx.Fields.Item("CD_LOCAL_COLETA").Value
		vCodTerminal     = objrsx.Fields.Item("CD_TERMINAL").Value
		vCodViaTransp    = objrsx.Fields.Item("CD_VIA_TRANSPORTE").Value
		vCodEmbarcador   = objrsx.Fields.Item("CD_EMBARCADOR").Value
		vCodEmbarcacao   = objrsx.Fields.Item("CD_EMBARCACAO").Value
		vCodLocalEmb     = objrsx.Fields.Item("CD_LOCAL_ORIGEM").Value
		vCodLocalDesemb  = objrsx.Fields.Item("CD_LOCAL_DESTINO").Value
		vCodNotify       = Trim(objrsx.Fields.Item("CD_NOTIFY").Value)
		vCodConsignee    = Trim(objrsx.Fields.Item("CD_CONSIGNATARIO").Value)
		vCodBanco        = objrsx.Fields.Item("CD_BANCO").Value
		vCodFormaPagar   = objrsx.Fields.Item("CD_FORMA_PAGAR").Value
		vCodMoedaMLE     = objrsx.Fields.Item("CD_MOEDA_MLE").Value
		vNrFornec        = Trim(objrsx.Fields.Item("NR_FORNECIMENTO").Value)
		vNrCDE           = Trim(objrsx.Fields.Item("NR_CDE").Value)
		vNrVoo           = Trim(objrsx.Fields.Item("NR_VOO").Value)
		vNrViagem        = Trim(objrsx.Fields.Item("NR_VIAGEM").Value)
		vNrAtoDrawback   = Trim(objrsx.Fields.Item("NR_ATO_CONCESSORIO").Value)
		vNrInspecao      = Trim(objrsx.Fields.Item("NR_INSPECAO").Value)
		vNrNotaCredito   = Trim(objrsx.Fields.Item("NR_NOTA_CREDITO").Value)
		vInCourrier      = objrsx.Fields.Item("IN_COURRIER").Value 'IN_COURRIER [Incluído em 20/08/2008 Flávio]
		vInFabrExpo      = objrsx.Fields.Item("IN_FABR_EXPO").Value
		vInTriangulacao  = objrsx.Fields.Item("IN_TRIANGULACAO").Value
		vInPermisso      = objrsx.Fields.Item("IN_PERMISSO").Value
		vInEmbalagem     = objrsx.Fields.Item("IN_DECL_EMBALAGEM").Value
		vInConsulado     = objrsx.Fields.Item("IN_CONSULADO").Value
		vInPalletExpurgo = objrsx.Fields.Item("IN_PALLET_EXPURGO").Value
		vInExpurgo       = objrsx.Fields.Item("IN_EXPURGO").Value
		vInInspecao      = objrsx.Fields.Item("IN_INSPECAO").Value
		vInCartaCredito  = objrsx.Fields.Item("IN_CARTA_CREDITO").Value
		vInCadivi        = objrsx.Fields.Item("IN_CADIVI").Value
		vInAmostra       = objrsx.Fields.Item("IN_AMOSTRA").Value
		vInAntecipado    = objrsx.Fields.Item("IN_ANTECIPADO").Value
		vDtFaturamento   = fnc_Mascara(objrsx.Fields.Item("DT_FATURAMENTO").Value, 5)
		vDtEmbarque      = fnc_Mascara(objrsx.Fields.Item("DT_EMBARQUE").Value, 5)
		vDtInspecao      = fnc_Mascara(objrsx.Fields.Item("DT_INSPECAO").Value, 5)
		vDtDeadLineDraft = fnc_Mascara(objrsx.Fields.Item("DT_DDL_DRAFT").Value, 5)
		vDtDeadLineCarga = fnc_Mascara(objrsx.Fields.Item("DT_DDL_CARGA").Value, 5)
		vDtRecebido      = fnc_Mascara(objrsx.Fields.Item("DT_RECEBIDO").Value, 5)
		vDtFechado       = fnc_Mascara(objrsx.Fields.Item("DT_FECHAMENTO").Value, 5)
		vDtPrevSaida     = fnc_Mascara(objrsx.Fields.Item("DT_PREV_SAIDA").Value, 5)		
		vTpDrawback      = Trim(objrsx.Fields.Item("TP_DRAWBACK").Value)
		vTpNotify        = Trim(objrsx.Fields.Item("TP_NOTIFY").Value)
		vTpConsignee     = Trim(objrsx.Fields.Item("TP_CONSIGNEE").Value)
		vTxOrgao         = Trim(objrsx.Fields.Item("TX_ORGAO").Value)
		vTxLocalInspecao = Trim(objrsx.Fields.Item("TX_LOCAL_INSPECAO").Value)
		vTxLocalExpurgo  = Trim(objrsx.Fields.Item("TX_LOCAL_EXPURGO").Value)
		vTxEmbalagem     = Trim(objrsx.Fields.Item("TX_EMBALAGEM").Value)
		vTxMarcacao      = Trim(objrsx.Fields.Item("TX_MARCACAO").Value)
		vTxInstEmb       = Trim(objrsx.Fields.Item("TX_INST_EMB").Value)
		vTxMotivoDesc    = Trim(objrsx.Fields.Item("TX_MOTIVO_DESC").Value)
		vVlComissao      = objrsx.Fields.Item("VL_COMISSAO").Value
		vVlMLE           = objrsx.Fields.Item("VL_MLE").Value
		vVlSeguro        = objrsx.Fields.Item("VL_SEGURO").Value
		vVlAcrescimo     = objrsx.Fields.Item("VL_ACRESCIMO").Value
		vVlDesconto      = objrsx.Fields.Item("VL_DESCONTO").Value
		vVlFreteInt      = objrsx.Fields.Item("VL_FRETE_INT").Value
		vVlPesoBruto     = objrsx.Fields.Item("VL_PESO_BRUTO").Value
		vVlPesoLiq       = objrsx.Fields.Item("VL_PESO_LIQ").Value
		vVlCubagem       = objrsx.Fields.Item("VL_CUBAGEM").Value
		vVlQtdVolume     = objrsx.Fields.Item("VL_QTD_VOL").Value	
		
		If Session("InModoSimples") <> "1" Then		
										sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, IN_MODELO ) "&_
													"VALUES ('" & rap_maxima & "', 'MD', '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&",'1' )"
							Else
							vInFabrExpo      = 0
							vInTriangulacao  = 0
							vInPermisso      = 0
							vInEmbalagem     = 0
							vInConsulado     = 0
							vInPalletExpurgo = 0
							vInExpurgo       = 0
							vInCartaCredito  = 0
							vInCadivi        = 0
							vInAmostra       = 0
							vInAntecipado    = 0
							sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, IN_MODELO ) "&_
													"VALUES ('" & rap_maxima & "', 'MD', '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&", '1')"
							End If
							objcnn.Execute(sql)	
		End If					
%>
<!--#include virtual="/includes/inc_ends.asp" -->