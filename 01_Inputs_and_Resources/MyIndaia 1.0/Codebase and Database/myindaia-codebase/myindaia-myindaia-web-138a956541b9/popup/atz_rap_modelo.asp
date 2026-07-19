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
	Dim rap_modelo, rap_destino
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

	rap_modelo = Request("rap_modelo")
	rap_destino = Request("rap_destino")

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
		
		If Session("InModoSimples")<>"1" Then
				sql = "UPDATE TRAP SET "&_
							"  CD_LOGOMARCA      = ISNULL("&fncValSQL(vCodLogomarca, 0)&",CD_LOGOMARCA), "&_
							"  CD_FABRICANTE     = ISNULL("&fncValSQL(vCodFabricante, 0)&",CD_FABRICANTE), "&_
							"  CD_CLIENTE        = ISNULL("&fncValSQL(vCodCliente, 0)&",CD_CLIENTE), "&_
							"  CD_PAIS           = ISNULL("&fncValSQL(vCodPais, 0)&",CD_PAIS), "&_
							"  CD_TERMO_PAGTO    = ISNULL("&fncValSQL(vCodCondPagto, 0)&",CD_TERMO_PAGTO), "&_
							"  CD_AGENTE_COMISSAO = ISNULL("&fncValSQL(vCodAgenteComissao, 0)&",CD_AGENTE_COMISSAO), "&_
							"  CD_INCOTERM       = ISNULL("&fncValSQL(vCodIncoterm, 0)&",CD_INCOTERM), "&_
							"  CD_DEP_COLETA     = ISNULL("&fncValSQL(vCodDepColeta, 0)&",CD_DEP_COLETA), "&_
							"  CD_LOCAL_COLETA   = ISNULL("&fncValSQL(vCodLocalColeta, 0)&",CD_LOCAL_COLETA), "&_
							"  CD_TERMINAL       = ISNULL("&fncValSQL(vCodTerminal, 0)&",CD_TERMINAL), "&_
							"  CD_VIA_TRANSPORTE = ISNULL("&fncValSQL(vCodViaTransp, 0)&",CD_VIA_TRANSPORTE), "&_
							"  CD_EMBARCADOR     = ISNULL("&fncValSQL(vCodEmbarcador, 0)&",CD_EMBARCADOR), "&_
							"  CD_EMBARCACAO     = ISNULL("&fncValSQL(vCodEmbarcacao, 0)&",CD_EMBARCACAO), "&_
							"  CD_LOCAL_ORIGEM   = ISNULL("&fncValSQL(vCodLocalEmb, 0)&",CD_LOCAL_ORIGEM), "&_
							"  CD_LOCAL_DESTINO  = ISNULL("&fncValSQL(vCodLocalDesemb, 0)&",CD_LOCAL_DESTINO), "&_
							"  CD_NOTIFY         = ISNULL("&fncValSQL(vCodNotify, 0)&",CD_NOTIFY), "&_
							"  CD_CONSIGNATARIO  = ISNULL("&fncValSQL(vCodConsignee, 0)&",CD_CONSIGNATARIO), "&_
							"  CD_BANCO          = ISNULL("&fncValSQL(vCodBanco, 0)&",CD_BANCO), "&_
							"  CD_FORMA_PAGAR    = ISNULL(ISNULL("&fncValSQL(vCodFormaPagar, 0)&",CD_FORMA_PAGAR), 3), "&_
							"  CD_MOEDA_MLE      = ISNULL("&fncValSQL(vCodMoedaMLE, 0)&",CD_MOEDA_MLE), "&_
							"  NR_FORNECIMENTO   = ISNULL("&fncValSQL(vNrFornec, 0)&",NR_FORNECIMENTO), "&_
							"  NR_CDE            = ISNULL("&fncValSQL(vNrCDE, 0)&",NR_CDE), "&_
							"  NR_VOO            = ISNULL("&fncValSQL(vNrVoo, 0)&",NR_VOO), "&_
							"  NR_VIAGEM         = ISNULL("&fncValSQL(vNrViagem, 0)&",NR_VIAGEM), "&_
							"  NR_ATO_CONCESSORIO = ISNULL("&fncValSQL(vNrAtoDrawback, 0)&",NR_ATO_CONCESSORIO), "&_
							"  NR_INSPECAO       = ISNULL("&fncValSQL(vNrInspecao, 0)&",NR_INSPECAO), "&_
							"  NR_NOTA_CREDITO   = ISNULL("&fncValSQL(vNrNotaCredito, 0)&",NR_NOTA_CREDITO), "&_
							"  IN_COURRIER       = ISNULL("&vInCourrier&",IN_COURRIER), "&_
							"  IN_FABR_EXPO      = ISNULL("&vInFabrExpo&",IN_FABR_EXPO), "&_
							"  IN_TRIANGULACAO   = ISNULL("&vInTriangulacao&",IN_TRIANGULACAO), "&_
							"  IN_PERMISSO       = ISNULL("&vInPermisso&",IN_PERMISSO), "&_
							"  IN_DECL_EMBALAGEM = ISNULL("&vInEmbalagem&",IN_DECL_EMBALAGEM), "&_
							"  IN_CONSULADO      = ISNULL("&vInConsulado&",IN_CONSULADO), "&_
							"  IN_PALLET_EXPURGO = ISNULL("&vInPalletExpurgo&",IN_PALLET_EXPURGO), "&_
							"  IN_EXPURGO        = ISNULL("&vInExpurgo&",IN_EXPURGO), "&_
							"  IN_INSPECAO       = ISNULL("&vInInspecao&",IN_INSPECAO), "&_
							"  IN_CARTA_CREDITO  = ISNULL("&vInCartaCredito&",IN_CARTA_CREDITO), "&_
							"  IN_CADIVI         = ISNULL("&vInCadivi&",IN_CADIVI), "&_
							"  IN_AMOSTRA        = ISNULL("&vInAmostra&",IN_AMOSTRA), "&_
							"  IN_ANTECIPADO     = ISNULL("&vInAntecipado&",IN_ANTECIPADO), "&_
							"  IN_EMAIL_ERRO     = ISNULL(0,IN_EMAIL_ERRO), "&_
							"  TP_DRAWBACK       = ISNULL('"&vTpDrawback&"',TP_DRAWBACK), "&_
							"  TP_NOTIFY         = ISNULL('"&vTpNotify&"',TP_NOTIFY), "&_
							"  TP_CONSIGNEE      = ISNULL('"&vTpConsignee&"',TP_CONSIGNEE), "&_
							"  DT_FATURAMENTO    = ISNULL("&fncValSQL(vDtFaturamento, 1)&",DT_FATURAMENTO), "&_
							"  DT_EMBARQUE       = ISNULL("&fncValSQL(vDtEmbarque, 1)&",DT_EMBARQUE), "&_
							"  DT_INSPECAO       = ISNULL("&fncValSQL(vDtInspecao, 1)&",DT_INSPECAO), "&_
							"  DT_DDL_DRAFT      = ISNULL("&fncValSQL(vDtDeadLineDraft, 1)&",DT_DDL_DRAFT), "&_
							"  DT_DDL_CARGA      = ISNULL("&fncValSQL(vDtDeadLineCarga, 1)&",DT_DDL_CARGA), "&_
							"  DT_RECEBIDO       = ISNULL("&fncValSQL(vDtRecebido, 1)&",DT_RECEBIDO), "&_
							"  DT_FECHAMENTO     = ISNULL("&fncValSQL(vDtFechado, 1)&",DT_FECHAMENTO), "&_
							"  DT_PREV_SAIDA     = ISNULL("&fncValSQL(vDtPrevSaida, 1)&",DT_PREV_SAIDA), "&_
							"  TX_ORGAO          = ISNULL("&fncValSQL(vTxOrgao, 2)&",TX_ORGAO), "&_
							"  TX_LOCAL_INSPECAO = ISNULL("&fncValSQL(vTxLocalInspecao, 2)&",TX_LOCAL_INSPECAO), "&_
							"  TX_LOCAL_EXPURGO  = ISNULL("&fncValSQL(vTxLocalExpurgo, 2)&",TX_LOCAL_EXPURGO), "&_
							"  TX_EMBALAGEM      = ISNULL("&fncValSQL(vTxEmbalagem, 2)&",TX_EMBALAGEM), "&_
							"  TX_MARCACAO       = ISNULL("&fncValSQL(vTxMarcacao, 2)&",TX_MARCACAO), "&_
							"  TX_INST_EMB       = ISNULL("&fncValSQL(vTxInstEmb, 2)&",TX_INST_EMB), "&_
							"  TX_MOTIVO_DESC    = ISNULL("&fncValSQL(vTxMotivoDesc, 2)&",TX_MOTIVO_DESC), "&_
							"  VL_COMISSAO       = ISNULL("&fncValSQL(vVlComissao, 3)&",VL_COMISSAO), "&_
							"  VL_MLE            = ISNULL("&fncValSQL(vVlMLE, 3)&",VL_MLE), "&_
							"  VL_SEGURO         = ISNULL("&fncValSQL(vVlSeguro, 3)&",VL_SEGURO), "&_
							"  VL_ACRESCIMO      = ISNULL("&fncValSQL(vVlAcrescimo, 3)&",VL_ACRESCIMO), "&_
							"  VL_DESCONTO       = ISNULL("&fncValSQL(vVlDesconto, 3)&",VL_DESCONTO), "&_
							"  VL_FRETE_INT      = ISNULL("&fncValSQL(vVlFreteInt, 3)&",VL_FRETE_INT), "&_
							"  VL_PESO_BRUTO     = ISNULL("&fncValSQL(vVlPesoBruto, 3)&",VL_PESO_BRUTO), "&_
							"  VL_PESO_LIQ       = ISNULL("&fncValSQL(vVlPesoLiq, 3)&",VL_PESO_LIQ), "&_
							"  VL_CUBAGEM        = ISNULL("&fncValSQL(vVlCubagem, 3)&",VL_CUBAGEM), "&_
							"  VL_QTD_VOL        = ISNULL("&fncValSQL(vVlQtdVolume, 3)&",VL_QTD_VOL) "&_
							" WHERE CD_RAP+CD_RAP_ANO = '"&rap_destino&"'"&_
							" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
					Else
							sql = "UPDATE TRAP SET "&_
							"  CD_LOGOMARCA      = ISNULL("&fncValSQL(vCodLogomarca, 0)&",CD_LOGOMARCA), "&_
							"  CD_FABRICANTE     = ISNULL("&fncValSQL(vCodFabricante, 0)&",CD_FABRICANTE), "&_
							"  CD_CLIENTE        = ISNULL("&fncValSQL(vCodCliente, 0)&",CD_CLIENTE), "&_
							"  CD_PAIS           = ISNULL("&fncValSQL(vCodPais, 0)&",CD_PAIS), "&_
							"  CD_TERMO_PAGTO    = ISNULL("&fncValSQL(vCodCondPagto, 0)&",CD_TERMO_PAGTO), "&_
							"  CD_AGENTE_COMISSAO = ISNULL("&fncValSQL(vCodAgenteComissao, 0)&",CD_AGENTE_COMISSAO), "&_
							"  CD_INCOTERM       = ISNULL("&fncValSQL(vCodIncoterm, 0)&",CD_INCOTERM), "&_
							"  CD_DEP_COLETA     = ISNULL("&fncValSQL(vCodDepColeta, 0)&",CD_DEP_COLETA), "&_
							"  CD_LOCAL_COLETA   = ISNULL("&fncValSQL(vCodLocalColeta, 0)&",CD_LOCAL_COLETA), "&_
							"  CD_TERMINAL       = ISNULL("&fncValSQL(vCodTerminal, 0)&",CD_TERMINAL), "&_
							"  CD_VIA_TRANSPORTE = ISNULL("&fncValSQL(vCodViaTransp, 0)&",CD_VIA_TRANSPORTE), "&_
							"  CD_EMBARCADOR     = ISNULL("&fncValSQL(vCodEmbarcador, 0)&",CD_EMBARCADOR), "&_
							"  CD_EMBARCACAO     = ISNULL("&fncValSQL(vCodEmbarcacao, 0)&",CD_EMBARCACAO), "&_
							"  CD_LOCAL_ORIGEM   = ISNULL("&fncValSQL(vCodLocalEmb, 0)&",CD_LOCAL_ORIGEM), "&_
							"  CD_LOCAL_DESTINO  = ISNULL("&fncValSQL(vCodLocalDesemb, 0)&",CD_LOCAL_DESTINO), "&_
							"  CD_NOTIFY         = ISNULL("&fncValSQL(vCodNotify, 0)&",CD_NOTIFY), "&_
							"  CD_CONSIGNATARIO  = ISNULL("&fncValSQL(vCodConsignee, 0)&",CD_CONSIGNATARIO), "&_
							"  CD_BANCO          = ISNULL("&fncValSQL(vCodBanco, 0)&",CD_BANCO), "&_
							"  CD_FORMA_PAGAR    = ISNULL(ISNULL("&fncValSQL(vCodFormaPagar, 0)&",CD_FORMA_PAGAR), 3), "&_
							"  CD_MOEDA_MLE      = ISNULL("&fncValSQL(vCodMoedaMLE, 0)&",CD_MOEDA_MLE), "&_
							"  NR_FORNECIMENTO   = ISNULL("&fncValSQL(vNrFornec, 0)&",NR_FORNECIMENTO), "&_
							"  NR_CDE            = ISNULL("&fncValSQL(vNrCDE, 0)&",NR_CDE), "&_
							"  NR_VOO            = ISNULL("&fncValSQL(vNrVoo, 0)&",NR_VOO), "&_
							"  NR_VIAGEM         = ISNULL("&fncValSQL(vNrViagem, 0)&",NR_VIAGEM), "&_
							"  NR_ATO_CONCESSORIO = ISNULL("&fncValSQL(vNrAtoDrawback, 0)&",NR_ATO_CONCESSORIO), "&_
							"  NR_INSPECAO       = ISNULL("&fncValSQL(vNrInspecao, 0)&",NR_INSPECAO), "&_
							"  NR_NOTA_CREDITO   = ISNULL("&fncValSQL(vNrNotaCredito, 0)&",NR_NOTA_CREDITO), "&_
							"  IN_COURRIER       = ISNULL("&vInCourrier&",IN_COURRIER), "&_
							"  IN_INSPECAO       = ISNULL("&vInInspecao&",IN_INSPECAO), "&_
							"  IN_EMAIL_ERRO     = ISNULL(0,IN_EMAIL_ERRO), "&_
							"  TP_DRAWBACK       = ISNULL('"&vTpDrawback&"',TP_DRAWBACK), "&_
							"  TP_NOTIFY         = ISNULL('"&vTpNotify&"',TP_NOTIFY), "&_
							"  TP_CONSIGNEE      = ISNULL('"&vTpConsignee&"',TP_CONSIGNEE), "&_
							"  DT_FATURAMENTO    = ISNULL("&fncValSQL(vDtFaturamento, 1)&",DT_FATURAMENTO), "&_
							"  DT_EMBARQUE       = ISNULL("&fncValSQL(vDtEmbarque, 1)&",DT_EMBARQUE), "&_
							"  DT_INSPECAO       = ISNULL("&fncValSQL(vDtInspecao, 1)&",DT_INSPECAO), "&_
							"  DT_DDL_DRAFT      = ISNULL("&fncValSQL(vDtDeadLineDraft, 1)&",DT_DDL_DRAFT), "&_
							"  DT_DDL_CARGA      = ISNULL("&fncValSQL(vDtDeadLineCarga, 1)&",DT_DDL_CARGA), "&_
							"  DT_RECEBIDO       = ISNULL("&fncValSQL(vDtRecebido, 1)&",DT_RECEBIDO), "&_
							"  DT_FECHAMENTO     = ISNULL("&fncValSQL(vDtFechado, 1)&",DT_FECHAMENTO), "&_
							"  DT_PREV_SAIDA     = ISNULL("&fncValSQL(vDtPrevSaida, 1)&",DT_PREV_SAIDA), "&_
							"  TX_ORGAO          = ISNULL("&fncValSQL(vTxOrgao, 2)&",TX_ORGAO), "&_
							"  TX_LOCAL_INSPECAO = ISNULL("&fncValSQL(vTxLocalInspecao, 2)&",TX_LOCAL_INSPECAO), "&_
							"  TX_LOCAL_EXPURGO  = ISNULL("&fncValSQL(vTxLocalExpurgo, 2)&",TX_LOCAL_EXPURGO), "&_
							"  TX_EMBALAGEM      = ISNULL("&fncValSQL(vTxEmbalagem, 2)&",TX_EMBALAGEM), "&_
							"  TX_MARCACAO       = ISNULL("&fncValSQL(vTxMarcacao, 2)&",TX_MARCACAO), "&_
							"  TX_INST_EMB       = ISNULL("&fncValSQL(vTxInstEmb, 2)&",TX_INST_EMB), "&_
							"  TX_MOTIVO_DESC    = ISNULL("&fncValSQL(vTxMotivoDesc, 2)&",TX_MOTIVO_DESC), "&_
							"  VL_COMISSAO       = ISNULL("&fncValSQL(vVlComissao, 3)&",VL_COMISSAO), "&_
							"  VL_SEGURO         = ISNULL("&fncValSQL(vVlSeguro, 3)&",VL_SEGURO), "&_
							"  VL_ACRESCIMO      = ISNULL("&fncValSQL(vVlAcrescimo, 3)&",VL_ACRESCIMO), "&_
							"  VL_DESCONTO       = ISNULL("&fncValSQL(vVlDesconto, 3)&",VL_DESCONTO), "&_
							"  VL_FRETE_INT      = ISNULL("&fncValSQL(vVlFreteInt, 3)&",VL_FRETE_INT), "&_
							"  VL_PESO_BRUTO     = ISNULL("&fncValSQL(vVlPesoBruto, 3)&",VL_PESO_BRUTO), "&_
							"  VL_PESO_LIQ       = ISNULL("&fncValSQL(vVlPesoLiq, 3)&",VL_PESO_LIQ), "&_
							"  VL_CUBAGEM        = ISNULL("&fncValSQL(vVlCubagem, 3)&",VL_CUBAGEM), "&_
							"  VL_QTD_VOL        = ISNULL("&fncValSQL(vVlQtdVolume, 3)&",VL_QTD_VOL) "&_
							" WHERE CD_RAP+CD_RAP_ANO = '"&rap_destino&"'"&_
							" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
					End If		
							objcnn.Execute(sql)			
%>
<!--#include virtual="/includes/inc_ends.asp" -->