<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%Server.ScriptTimeout = 300

'---------------------------------------------------------------------------------------------
'Manutenção: Flávio Henrique
'Duplicação: Checagem em 24/01/08
'---------------------------------------------------------------------------------------------
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
cd_view  = Request.QueryString("cd_view")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
dim vNrRap2
dim vedtCodRap2
dim ZeraNrInstr
dim checkSubmit
dim teste
Dim sql1
Dim sql2
Dim sql3
Dim sql4
Dim sql5
Dim sql6	
Dim sql7
Dim sql8
dim vedtCodRap : vedtCodRap = Trim(Request("vedtCodRap"))
dim vedtCodRapAno : vedtCodRapAno = Trim(Request("vedtCodRapAno"))
dim vTpAcao : vTpAcao = Trim(Request("vTpAcao"))
dim vTpExibe : vTpExibe = Trim(Request("vTpExibe"))
dim vNrRap : vNrRap = Trim(Request("vNrRap"))
dim vInTestarRap : vInTestarRap = true
dim vInEmissao : vInEmissao = true
dim vMostrarTxt, vMostrarRemessa, vMostrarXls, vVolume, vValida
dim vInRap, vInRapDocto, vInForn, vInPack, vTxValida, vTpStatus, vDtStatus, vHrStatus, vUsStatus, vInRemessa
'variáveis auxiliares no SQL e tela de inserção do RAP
dim vCodExportador, vCodLogomarca, vCodFabricante, vCodCliente, vCodPais, vCodCondPagto, vTpDrawback, vCodAgenteComissao
dim vCodIncoterm, vCodDepColeta, vCodLocalColeta, vCodTerminal, vCodViaTransp, vCodEmbarcador, vCodEmbarcacao, vCodLocalEmb
dim vCodLocalDesemb, vCodNotify, vCodConsignee, vCodBanco, vNrCDE, vNrFornec, vNrVoo, vNrAtoDrawback, vNrInspecao, vNrNotaCredito
dim vInFabrExpo, vInTriangulacao, vInPermisso, vInEmbalagem, vInConsulado, vInPalletExpurgo, vInExpurgo, vInInspecao
dim vInCartaCredito, vDtFaturamento, vDtEmbarque, vDtInspecao, vDtDeadLineDraft, vDtDeadLineCarga, vDtRecebido, vDtFechado
dim vDtPrevSaida, vTpNotify, vTpConsignee, vTxOrgao, vTxLocalInspecao, vTxMarcacao, vTxInstEmb, vVlComissao, vVlMLE
dim vVlSeguro, vVlAcrescimo, vVlDesconto, vCodFormaPagar, vCodMoedaMLE, vNrViagem, vInCadivi, vTxLocalExpurgo, vVlFreteInt
dim vVlPesoBruto, vVlPesoLiq, vVlCubagem, vTxEmbalagem, vInAmostra, vInAntecipado, vTxMotivoDesc, vVlQtdVolume

if not fnc_TestaVar(vTpAcao) then vTpAcao = "listar"
if not fnc_TestaVar(vTpExibe) then vTpExibe = 1
in_show = (vTpAcao = "listar")
'FLAVIO

function textVar(var1)
     Response.Redirect("teste.asp?var1="&var1&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
end function

function fncCriaNrRap()
	'if objrsx.State = adStateOpen then objrsx.Close
		'sql=  "SELECT (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), GETDATE(), '1','1', CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, '"&Session("cd_usuario")&"', "&_
		'			"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"

	'	sql = "SELECT RIGHT('000000' + CONVERT(VARCHAR, ISNULL(MAX(CD_RAP), 0)), 6) AS RAP, " &_
	'			"       SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) AS ANO " &_
	'			"  FROM TRAP (TABLOCK HOLDLOCK) " &_
	'			" WHERE CD_RAP_ANO = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) "

'	sql = "SELECT RIGHT('000000' + CONVERT(VARCHAR, ISNULL(MAX(CD_RAP), 0) + 1), 6) AS RAP, " &_
'				"       SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) AS ANO " &_
'				"  FROM TRAP (TABLOCK HOLDLOCK) " &_
'				" WHERE CD_RAP_ANO = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) "
' **** APAGAR A INSTRUÇÃO ABAIXO NA SEXTA 04/01/2008 E REMOVER O COMENTARIO DA INSTRUÇÃO ACIMA
'	sql = "SELECT RIGHT('000000' + CONVERT(VARCHAR, ISNULL(MAX(CD_RAP), 0) + 1), 6) AS RAP, " &_
'				"       '07' AS ANO " &_
'				"  FROM TRAP (TABLOCK HOLDLOCK) " &_
'				" WHERE CD_RAP_ANO = '07') "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
if objrsx.RecordCount > 0 then
	 vReturn = CStr(objrsx.Fields.Item("RAP").Value)&CStr(objrsx.Fields.Item("ANO").Value)
else
	 vReturn = null
end if
fncCriaNrRap = vReturn
end function

sub subVerificaAmostra(sNrRap, sInAmostra)
	'verifica se é amostra, e se for, valida a instrução sem integrar fornecimento e packing list
	if sInAmostra then
		str = "Instrução de Embarque criada com mercadorias para amostra, não é necessário informar os Fornecimentos."
		sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, IN_RAP_VALIDA_DOCTO = 1, IN_PEDIDO_VALIDA = 1, IN_FORN_VALIDA = 1, IN_PACK_VALIDA = 1, TX_VALIDACAO = '"&str&"' "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"&sNrRap&"' "
	else
		str = "Instrução de embarque pronta para receber os pedidos e/ou fornecimentos."
		sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, IN_RAP_VALIDA_DOCTO = 1, TX_VALIDACAO = '"&str&"', TX_VALIDACAO_PEDIDO = '"&str&"'  WHERE CD_RAP+CD_RAP_ANO = '"&sNrRap&"'"
	end if
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
end sub


function fncCriaOption(nDropDown)
	vReturn = ""
	select case nDropDown
		case "drawback"
			for cont = 0 to ubound(tipo_drawback)
				vReturn = vReturn &"<option value='"& cont &"'> "& tipo_drawback(cont) &"</option>"
			next
		case "logo_saint"
			for cont = 0 to ubound(logo_saint)
				vReturn = vReturn &"<option value='"& cont &"'>"& UCase(logo_saint(cont)) &"</option>"
			next
		case "pessoa_exp"
			for cont = 0 to ubound(tipo_pessoa)
				vReturn = vReturn &"<option value='"& cont &"'>"& tipo_pessoa(cont) &"</option>"
			next
		case else
			vReturn = "<option value=''>Nenhuma opção selecionada. Entre em contato com o suporte.</option>"
	end select
	fncCriaOption = vReturn
end function
'*******************************************************************************************************************************
'******************************Inicio  duplicar FLAVIO ****************************************
if request.form("checkSubmit") = "duplicar" then 'duplica a rap selecionada
			 vedtCodRap2       = Request.Form(Rtrim(lTrim(("edtCodRap2"))))
			 vedtCodRap2=lTrim(Replace(vedtCodRap2, ",", ""))
			 vedtCodRapAno    = Request.Form(Rtrim(lTrim(("edtCodRapAno"))))
			If vedtCodRap2=""  then
						'Response.Redirect("teste.asp?var1="&vedtCodRap2&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
					%><script>
								document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=duplicar&edtCodExportador=<%=vCodExportador%>';
					</script><% 
			else
					'vnrrap=mid("000000",1,6-len(vedtCodRap2))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
					'vNrRap=vedtCodRap2&vedtCodRapAno
					'Response.Redirect("teste.asp?var1="&vedtCodRap2&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
					'vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
					vedtCodRap2=mid("000000",1,6-len(vedtCodRap2))&vedtCodRap2
					vedtCodRapAno=mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
					'Response.Redirect("teste.asp?var1="&vedtCodRapAno&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
					'vedtCodRapAno= Request.Form("edtCodRapAno")
					sql= "SELECT CD_RAP FROM TRAP WHERE CD_RAP+CD_RAP_ANO ='"&vedtCodRap2&vedtCodRapAno&"'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					if objrs.eof  then
							vCodExportador   = Request.Form("edtCodExportador")
							vCodLogomarca    = Request.Form("cmbCodLogomarca")
							vCodFabricante   = Request.Form("edtCodFabricante")
							vCodCliente      = Request.Form("edtCodCliente")
							vCodPais         = Request.Form("edtCodPais")
							vCodCondPagto    = Request.Form("edtCodCondPagto")
							vCodAgenteComissao = Request.Form("edtCodAgenteComissao")
							vCodIncoterm     = Request.Form("cmbCodIncoterm")
							vCodDepColeta    = Request.Form("edtCodDepColeta")
							vCodTerminal     = Request.Form("edtCodTerminal")
							vCodViaTransp    = Request.Form("cmbCodViaTransp")
							vCodEmbarcador   = Request.Form("edtCodEmbarcador")
							vCodEmbarcacao   = Request.Form("edtCodEmbarcacao")
							vCodLocalEmb     = Request.Form("edtCodLocalEmb")
							vCodLocalDesemb  = Request.Form("edtCodLocalDesemb")
							vCodNotify       = Request.Form("edtCodNotify")
							vCodConsignee    = Request.Form("edtCodConsignee")
							vCodBanco        = Request.Form("edtCodBanco")
							vCodFormaPagar   = Request.Form("rdgCodFormaPagar")
							vCodMoedaMLE     = Request.Form("edtCodMoedaMLE")
							vNrFornec        = UCase(Request.Form("edtNrFornec"))
							'testavar(UCase(Request.Form("edtNrFornec")))
					'		vNrCDE           = UCase(Request.Form("edtNrCDE"))
							vNrViagem        = UCase(Request.Form("edtNrViagem"))
							vNrAtoDrawback   = UCase(Request.Form("edtNrAtoDrawback"))
							vNrInspecao      = UCase(Request.Form("edtNrInspecao"))
							vNrNotaCredito   = UCase(Request.Form("edtNrNotaCredito"))
							vInFabrExpo      = Request.Form("rdgInFabrExpo")
							vInTriangulacao  = Request.Form("rdgInTriangulacao")
							vInPermisso      = Request.Form("rdgInPermisso")
							vInEmbalagem     = Request.Form("rdgInEmbalagem")
							vInConsulado     = Request.Form("rdgInConsulado")
							vInPalletExpurgo = Request.Form("rdgInPalletExpurgo")
							vInExpurgo       = Request.Form("rdgInExpurgo")
							vInInspecao      = Request.Form("rdgInInspecao")
							vInCartaCredito  = Request.Form("rdgInCartaCredito")
							vInCadivi        = Request.Form("rdgInCadivi")
							vInAmostra       = Request.Form("rdgInAmostra")
							vInAntecipado    = Request.Form("rdgInAntecipado")
							vDtFaturamento   = Request.Form("edtDtFaturamento")
							vDtEmbarque      = Request.Form("edtDtEmbarque")
							vDtInspecao      = Request.Form("edtDtInspecao")
							vTpDrawback      = Request.Form("cmbTpDrawback")
							vTpNotify        = Request.Form("cmbTpNotify")
							vTpConsignee     = Request.Form("cmbTpConsignee")
							vTxOrgao         = UCase(Request.Form("edtTxOrgao"))
							vTxEmbalagem     = UCase(Request.Form("edtTxEmbalagem"))
							vTxMotivoDesc    = UCase(Request.Form("edtTxMotivoDesc"))
							vTxMarcacao      = UCase(Request.Form("txaTxMarcacao"))
							vTxInstEmb       = UCase(Request.Form("txaTxInstEmb"))
							vVlComissao      = Request.Form("edtVlComissao")
							vVlMLE           = Request.Form("edtVlMLE")
							vVlSeguro        = Request.Form("edtVlSeguro")
							vVlAcrescimo     = Request.Form("edtVlAcrescimo")
							vVlDesconto      = Request.Form("edtVlDesconto")
							vVlFreteInt      = Request.Form("edtVlFreteInt")
							vVlPesoBruto     = Request.Form("edtVlPesoBruto")
							vVlPesoLiq       = Request.Form("edtVlPesoLiq")
							vVlCubagem       = Request.Form("edtVlCubagem")
							vVlQtdVolume     = Request.Form("edtVlQtdVolume")
							'testa as variaveis
							'if Trim(vNrCDE) = "/" then vNrCDE = ""
							if Right(vNrFornec, 1) = ";" then vNrFornec = Left(vNrFornec, Len(vNrFornec)-1)
							if InStr(vNrViagem, "/") > 0 then vNrViagem = Trim(Replace(vNrViagem,"/",""))
							sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap2,0)&",6), "&fncValSQL(vedtCodRapAno,0)&", CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec,2)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&" )"
															vNrRap=vedtCodRap2&vedtCodRapAno
					'testavar(vedtCodRapAno)
										Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
										objcnn.Execute(sql)
										%><script>
												document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=listar&edtCodExportador=<%=vCodExportador%>';
											</script>
									<%else%>
													<script>//flavio
															alert('Nr. Instrução/CDE já cadastrada!');
															document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=listar&edtCodExportador=<%=vCodExportador%>';
													</script>
									<%end if

				Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=listar")
	end if%>

<%end if
'******************************fim  duplicar ****************************************
'*******************************************************************************************************************************
if (vTpAcao = "editar") or (vTpAcao = "salvar") or (vTpAcao = "visualizar") or (vTpAcao = "duplicar") then%>
<%	'verifica se está incluindo ou alterando o rap
	if (Request.Form <> "") and (vTpAcao="salvar") or (vTpAcao="duplicar") then
	'		vNrRap           = Request.form("edtCodRap")&Request.form("edtCodRapAno")
			vedtCodRap       = Request.Form("edtCodRap")
			vedtCodRapAno    = Request.Form("edtCodRapAno")
			vCodExportador   = Request.Form("edtCodExportador")
			vCodLogomarca    = Request.Form("cmbCodLogomarca")
			vCodFabricante   = Request.Form("edtCodFabricante")
			vCodCliente      = Request.Form("edtCodCliente")
			vCodPais         = Request.Form("edtCodPais")
			vCodCondPagto    = Request.Form("edtCodCondPagto")
			vCodAgenteComissao = Request.Form("edtCodAgenteComissao")
			vCodIncoterm     = Request.Form("cmbCodIncoterm")
			vCodDepColeta    = Request.Form("edtCodDepColeta")
			vCodTerminal     = Request.Form("edtCodTerminal")
			vCodViaTransp    = Request.Form("cmbCodViaTransp")
			vCodEmbarcador   = Request.Form("edtCodEmbarcador")
			vCodEmbarcacao   = Request.Form("edtCodEmbarcacao")
			vCodLocalEmb     = Request.Form("edtCodLocalEmb")
			vCodLocalDesemb  = Request.Form("edtCodLocalDesemb")
			vCodNotify       = Request.Form("edtCodNotify")
			vCodConsignee    = Request.Form("edtCodConsignee")
			vCodBanco        = Request.Form("edtCodBanco")
			vCodFormaPagar   = Request.Form("rdgCodFormaPagar")
			vCodMoedaMLE     = Request.Form("edtCodMoedaMLE")
			vNrFornec        = UCase(Request.Form("edtNrFornec"))
	'		vNrCDE           = UCase(Request.Form("edtNrCDE"))
			vNrViagem        = UCase(Request.Form("edtNrViagem"))
			vNrAtoDrawback   = UCase(Request.Form("edtNrAtoDrawback"))
			vNrInspecao      = UCase(Request.Form("edtNrInspecao"))
			vNrNotaCredito   = UCase(Request.Form("edtNrNotaCredito"))
			vInFabrExpo      = Request.Form("rdgInFabrExpo")
			vInTriangulacao  = Request.Form("rdgInTriangulacao")
			vInPermisso      = Request.Form("rdgInPermisso")
			vInEmbalagem     = Request.Form("rdgInEmbalagem")
			vInConsulado     = Request.Form("rdgInConsulado")
			vInPalletExpurgo = Request.Form("rdgInPalletExpurgo")
			vInExpurgo       = Request.Form("rdgInExpurgo")
			vInInspecao      = Request.Form("rdgInInspecao")
			vInCartaCredito  = Request.Form("rdgInCartaCredito")
			vInCadivi        = Request.Form("rdgInCadivi")
			vInAmostra       = Request.Form("rdgInAmostra")
			vInAntecipado    = Request.Form("rdgInAntecipado")
			vDtFaturamento   = Request.Form("edtDtFaturamento")
			vDtEmbarque      = Request.Form("edtDtEmbarque")
			vDtInspecao      = Request.Form("edtDtInspecao")
			vTpDrawback      = Request.Form("cmbTpDrawback")
			vTpNotify        = Request.Form("cmbTpNotify")
			vTpConsignee     = Request.Form("cmbTpConsignee")
			vTxOrgao         = UCase(Request.Form("edtTxOrgao"))
			vTxEmbalagem     = UCase(Request.Form("edtTxEmbalagem"))
			vTxMotivoDesc    = UCase(Request.Form("edtTxMotivoDesc"))
			vTxMarcacao      = UCase(Request.Form("txaTxMarcacao"))
			vTxInstEmb       = UCase(Request.Form("txaTxInstEmb"))
			vVlComissao      = Request.Form("edtVlComissao")
			vVlMLE           = Request.Form("edtVlMLE")
			vVlSeguro        = Request.Form("edtVlSeguro")
			vVlAcrescimo     = Request.Form("edtVlAcrescimo")
			vVlDesconto      = Request.Form("edtVlDesconto")
			vVlFreteInt      = Request.Form("edtVlFreteInt")
			vVlPesoBruto     = Request.Form("edtVlPesoBruto")
			vVlPesoLiq       = Request.Form("edtVlPesoLiq")
			vVlCubagem       = Request.Form("edtVlCubagem")
			vVlQtdVolume     = Request.Form("edtVlQtdVolume")
			'testa as variaveis
			if Trim(vNrCDE) = "/" then vNrCDE = ""
			if Right(vNrFornec, 1) = ";" then vNrFornec = Left(vNrFornec, Len(vNrFornec)-1)
			if InStr(vNrViagem, "/") > 0 then vNrViagem = Trim(Replace(vNrViagem,"/",""))
			'verifica se já existe a RAP FLAVIO 
			if objrs.State = adStateOpen then objrs.Close()
			sql = "SELECT COUNT(*) FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

			if objrs.Fields.Item(0).Value > 0 then ' SE EXISTIR
					if objrsx.State = adStateOpen then objrsx.Close()
					sql = "SELECT IN_AMOSTRA, RTRIM(LTRIM(ISNULL(NR_FORNECIMENTO, ''))) AS NR_FORNECIMENTO, ISNULL(CD_INCOTERM, '') AS CD_INCOTERM, "&_
								"  ISNULL(CD_MOEDA_MLE, '') AS CD_MOEDA_MLE, ISNULL(CD_TERMO_PAGTO, '') AS CD_TERMO_PAGTO, "&_
								"  VL_MLE, VL_PESO_LIQ, VL_PESO_BRUTO, VL_CUBAGEM, VL_QTD_VOL, VL_DESCONTO, NR_NOTA_CREDITO, TX_MOTIVO_DESC "&_
								"FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					'verifica se ocorreu alteração nos valores de validação da rap
'Response.Redirect("teste.asp?var1="&FormatNumber(isnull(vVlCubagem), 2)&"")
					if (objrsx.Fields.Item("NR_FORNECIMENTO").Value  <> vNrFornec) or _
						 (objrsx.Fields.Item("CD_INCOTERM").Value      <> vCodIncoterm) or _
						 (objrsx.Fields.Item("CD_MOEDA_MLE").Value     <> vCodMoedaMLE) or _
						 (objrsx.Fields.Item("CD_TERMO_PAGTO").Value   <> vCodCondPagto) or _
						 (CInt(objrsx.Fields.Item("IN_AMOSTRA").Value) <> vInAmostra) or _
						 (FormatNumber(not isnull(objrsx.Fields.Item("VL_MLE").Value), 2)        <> FormatNumber(isnull(vVlMLE), 2)) or _
						 (FormatNumber(not isnull(objrsx.Fields.Item("VL_PESO_LIQ").Value), 4)   <> FormatNumber(isnull(vVlPesoLiq), 4)) or _
						 (FormatNumber(not isnull(objrsx.Fields.Item("VL_PESO_BRUTO").Value), 4) <> FormatNumber(isnull(vVlPesoBruto), 4)) or _
						 (FormatNumber(not isnull(objrsx.Fields.Item("VL_CUBAGEM").Value), 3)    <> FormatNumber(isnull(vVlCubagem), 3)) or _
						 (FormatNumber(not isnull(objrsx.Fields.Item("VL_QTD_VOL").Value), 0)    <> FormatNumber(isnull(vVlQtdVolume), 0)) or _
						 ((CDbl(not isnull(objrsx.Fields.Item("VL_DESCONTO").Value)) > 0) and not fnc_TestaVar(objrsx.Fields.Item("NR_NOTA_CREDITO").Value)) or _
						 ((CDbl(not isnull(objrsx.Fields.Item("VL_DESCONTO").Value)) > 0) and not fnc_TestaVar(objrsx.Fields.Item("TX_MOTIVO_DESC").Value)) then

						sql = "UPDATE TRAP SET IN_RAP_VALIDA = 0, IN_FORN_VALIDA = 0, IN_PACK_VALIDA = 0, TX_VALIDACAO = '' "&_
									"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						 if (vTpAcao<>"duplicar") then 
								 objcnn.Execute(sql)
						 end if
						vInTestarRap = true
						'FLAVIO 
						'se os fornecimentos foram alterados, apaga os que não existirem
						if objrsx.Fields.Item("NR_FORNECIMENTO").Value <> vNrFornec and (vTpAcao<>"duplicar") then
							sql = "DELETE TRAP_FORNECIMENTO "&_
										"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
										"  AND CD_FORNECIMENTO NOT IN ('"&Replace(vNrFornec,";","','")&"')"
							Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
							objcnn.Execute(sql)
						end if
				end if
				if objrsx.State = adStateOpen then objrsx.Close()
				'atualiza a tabela de RAP com os dados editados na tela
				if (vTpAcao = "editar") or (vTpAcao = "salvar") or (vTpAcao = "visualizar") then

				sql = "UPDATE TRAP SET "&_
							"  CD_EXPORTADOR     = "&fncValSQL(vCodExportador, 0)&", "&_
							"  CD_LOGOMARCA      = "&fncValSQL(vCodLogomarca, 0)&", "&_
							"  CD_FABRICANTE     = "&fncValSQL(vCodFabricante, 0)&", "&_
							"  CD_CLIENTE        = "&fncValSQL(vCodCliente, 0)&", "&_
							"  CD_PAIS           = "&fncValSQL(vCodPais, 0)&", "&_
							"  CD_TERMO_PAGTO    = "&fncValSQL(vCodCondPagto, 0)&", "&_
							"  CD_AGENTE_COMISSAO = "&fncValSQL(vCodAgenteComissao, 0)&", "&_
							"  CD_INCOTERM       = "&fncValSQL(vCodIncoterm, 0)&", "&_
							"  CD_DEP_COLETA     = "&fncValSQL(vCodDepColeta, 0)&", "&_
							"  CD_LOCAL_COLETA   = "&fncValSQL(vCodLocalColeta, 0)&", "&_
							"  CD_TERMINAL       = "&fncValSQL(vCodTerminal, 0)&", "&_
							"  CD_VIA_TRANSPORTE = "&fncValSQL(vCodViaTransp, 0)&", "&_
							"  CD_EMBARCADOR     = "&fncValSQL(vCodEmbarcador, 0)&", "&_
							"  CD_EMBARCACAO     = "&fncValSQL(vCodEmbarcacao, 0)&", "&_
							"  CD_LOCAL_ORIGEM   = "&fncValSQL(vCodLocalEmb, 0)&", "&_
							"  CD_LOCAL_DESTINO  = "&fncValSQL(vCodLocalDesemb, 0)&", "&_
							"  CD_NOTIFY         = "&fncValSQL(vCodNotify, 0)&", "&_
							"  CD_CONSIGNATARIO  = "&fncValSQL(vCodConsignee, 0)&", "&_
							"  CD_BANCO          = "&fncValSQL(vCodBanco, 0)&", "&_
							"  CD_FORMA_PAGAR    = ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&_
							"  CD_MOEDA_MLE      = "&fncValSQL(vCodMoedaMLE, 0)&", "&_
							"  NR_FORNECIMENTO   = "&fncValSQL(vNrFornec, 0)&", "&_
							"  NR_CDE            = "&fncValSQL(vNrCDE, 0)&", "&_
							"  NR_VOO            = "&fncValSQL(vNrVoo, 0)&", "&_
							"  NR_VIAGEM         = "&fncValSQL(vNrViagem, 0)&", "&_
							"  NR_ATO_CONCESSORIO = "&fncValSQL(vNrAtoDrawback, 0)&", "&_
							"  NR_INSPECAO       = "&fncValSQL(vNrInspecao, 0)&", "&_
							"  NR_NOTA_CREDITO   = "&fncValSQL(vNrNotaCredito, 0)&", "&_
							"  IN_FABR_EXPO      = "&vInFabrExpo&", "&_
							"  IN_TRIANGULACAO   = "&vInTriangulacao&", "&_
							"  IN_PERMISSO       = "&vInPermisso&", "&_
							"  IN_DECL_EMBALAGEM = "&vInEmbalagem&", "&_
							"  IN_CONSULADO      = "&vInConsulado&", "&_
							"  IN_PALLET_EXPURGO = "&vInPalletExpurgo&", "&_
							"  IN_EXPURGO        = "&vInExpurgo&", "&_
							"  IN_INSPECAO       = "&vInInspecao&", "&_
							"  IN_CARTA_CREDITO  = "&vInCartaCredito&", "&_
							"  IN_CADIVI         = "&vInCadivi&", "&_
							"  IN_AMOSTRA        = "&vInAmostra&", "&_
							"  IN_ANTECIPADO     = "&vInAntecipado&", "&_
							"  IN_EMAIL_ERRO     = 0, "&_
							"  TP_DRAWBACK       ='"&vTpDrawback&"', "&_
							"  TP_NOTIFY         ='"&vTpNotify&"', "&_
							"  TP_CONSIGNEE      ='"&vTpConsignee&"', "&_
							"  DT_FATURAMENTO    = "&fncValSQL(vDtFaturamento, 1)&", "&_
							"  DT_EMBARQUE       = "&fncValSQL(vDtEmbarque, 1)&", "&_
							"  DT_INSPECAO       = "&fncValSQL(vDtInspecao, 1)&", "&_
							"  DT_DDL_DRAFT      = "&fncValSQL(vDtDeadLineDraft, 1)&", "&_
							"  DT_DDL_CARGA      = "&fncValSQL(vDtDeadLineCarga, 1)&", "&_
							"  DT_RECEBIDO       = "&fncValSQL(vDtRecebido, 1)&", "&_
							"  DT_FECHAMENTO     = "&fncValSQL(vDtFechado, 1)&", "&_
							"  DT_PREV_SAIDA     = "&fncValSQL(vDtPrevSaida, 1)&", "&_
							"  TX_ORGAO          = "&fncValSQL(vTxOrgao, 2)&", "&_
							"  TX_LOCAL_INSPECAO = "&fncValSQL(vTxLocalInspecao, 2)&", "&_
							"  TX_LOCAL_EXPURGO  = "&fncValSQL(vTxLocalExpurgo, 2)&", "&_
							"  TX_EMBALAGEM      = "&fncValSQL(vTxEmbalagem, 2)&", "&_
							"  TX_MARCACAO       = "&fncValSQL(vTxMarcacao, 2)&", "&_
							"  TX_INST_EMB       = "&fncValSQL(vTxInstEmb, 2)&", "&_
							"  TX_MOTIVO_DESC    = "&fncValSQL(vTxMotivoDesc, 2)&", "&_
							"  VL_COMISSAO       = "&fncValSQL(vVlComissao, 3)&", "&_
							"  VL_MLE            = "&fncValSQL(vVlMLE, 3)&", "&_
							"  VL_SEGURO         = "&fncValSQL(vVlSeguro, 3)&", "&_
							"  VL_ACRESCIMO      = "&fncValSQL(vVlAcrescimo, 3)&", "&_
							"  VL_DESCONTO       = "&fncValSQL(vVlDesconto, 3)&", "&_
							"  VL_FRETE_INT      = "&fncValSQL(vVlFreteInt, 3)&", "&_
							"  VL_PESO_BRUTO     = "&fncValSQL(vVlPesoBruto, 3)&", "&_
							"  VL_PESO_LIQ       = "&fncValSQL(vVlPesoLiq, 3)&", "&_
							"  VL_CUBAGEM        = "&fncValSQL(vVlCubagem, 3)&", "&_
							"  VL_QTD_VOL        = "&fncValSQL(vVlQtdVolume, 3)&" "&_
							"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
				end if
	else
				if (vTpAcao = "salvar") or (vTpAcao = "duplicar") then
						'define Nr. do RAP	 'FLAVIO
						'*************************************  TRABALHANDO AQUI 09/01/2008*********************
						if objrs.State = adStateOpen then objrs.Close() ' SE FOR UM NOVO REGISTRO INSERIR DADOS
								vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
								'response.redirect("teste.asp?vnrrap="&vnrrap)
								sql= "SELECT CD_RAP FROM TRAP WHERE CD_RAP+CD_RAP_ANO ='"&vnrrap&"'"
								objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								if objrs.eof  then
										'insere na tabela de RAP os dados inseridos na tela FLAVIO
										sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&" )"
													vInTestarRap = true
													Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
													objcnn.Execute(sql)
													vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno%>
													<script>alert('Nr. Instrução/CDE cadastrada com sucesso!')</script>
									<%else%>
													<script>//flavio
													alert('Nr. Instrução/CDE já cadastrada!');
													document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=novo&edtCodExportador=<%=vCodExportador%>';
													</script>
									<%end if
						end if
				end if
				'Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				'objcnn.Execute(sql)
				'vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
	end if
	'verifica se é necessário realizar um diagnóstico da rap
	vInRap  = false
	vInRapDocto = false
	vInForn = false
	vInPack = false
	vInRemessa = false
	
	if Request("vInTestarRap") = 1 then vInTestarRap = true
	
	if vInTestarRap then
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT NR_FORNECIMENTO, NR_NOTA_CREDITO, CD_MOEDA_MLE, CD_INCOTERM, CD_TERMO_PAGTO, IN_AMOSTRA, IN_ANTECIPADO, "&_
					"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, "&_
					"  ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, TX_MOTIVO_DESC, CD_STATUS_DOCTO "&_
					"FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"&vnrRap&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		If  objrs.eof  then
				'Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=listar")
					%><script language="JavaScript"> 
					//alert('Digite o ano!');
					document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=novo&edtCodExportador=<%=vCodExportador%>';

					</script><% 
					'Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=Duplicar")

		End if

		vInAmostra    = objrs.Fields.Item("IN_AMOSTRA").Value
		vInAntecipado = objrs.Fields.Item("IN_ANTECIPADO").Value

		if not fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value) or not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value) or _
			 not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value) or _
			 (CDbl(objrs.Fields.Item("VL_MLE").Value)        = 0) or (CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value) = 0) or _
			 (CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0) or (CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)  = 0) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value)) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value)) then
			str = "Foram encontrados problemas no cadastro da Instrução."
			sql = "UPDATE TRAP SET IN_RAP_VALIDA_DOCTO = 0, IN_PEDIDO_VALIDA = 0, TX_VALIDACAO_PEDIDO = '"&str&"' "&_
						"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
		else
			if objrs.Fields.Item("CD_STATUS_DOCTO").Value = "1" then
				vInRapDocto = true
			else
				vInRapDocto = false
				vInRemessa = true
			end if
			call subVerificaAmostra(vNrRap, vInAmostra)
		end if			
		
		'verifica Pedido
		if vInRapDocto then
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT COUNT(*) FROM TPE_ITEM (NOLOCK) "&_
						"WHERE RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO)) = '"& vNrRap &"' "&_
						"  AND ISNULL(QT_BAIXADA, 0) > 0"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.Fields.Item(0).Value = 0 then
				call subVerificaAmostra(vNrRap, vInAmostra)
				if vInAmostra then vInRemessa = true
			else
				'se já estiverem integrados, executa procedure de verificação
				with objcmd
				  .CommandTimeOut = 180
					.CommandText = "sp_rap_verifica_pedido"
					.CommandType = adCmdStoredProc
					.Parameters.Refresh
					.Parameters("@nrRap") = vNrRap
					.Execute , , adExecuteNoRecords
					if .Parameters("@RETURN_VALUE") = 1 then vInRemessa = true
				end with
			end if
    end if

		'inicia a verificação da rap
		if (not fnc_TestaVar(objrs.Fields.Item("NR_FORNECIMENTO").Value) and not vInAmostra) or _
				not fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value) or not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value) or _
				not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value) or _
			 (CDbl(objrs.Fields.Item("VL_MLE").Value)        = 0) or (CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value) = 0) or _
			 (CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0) or (CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)  = 0) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value)) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value)) then
			str = "Foram encontrados problemas no cadastro da Instrução."
			sql = "UPDATE TRAP SET IN_RAP_VALIDA = 0, IN_FORN_VALIDA = 0, IN_PACK_VALIDA = 0, TX_VALIDACAO = '"&str&"' "&_
						"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
		else
			vInRap = true
			call subVerificaAmostra(vNrRap, vInAmostra)
		end if
		'verifica os fornecimentos caso a rap esteja ok
		if vInRap then
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.Fields.Item(0).Value = 0 then
				call subVerificaAmostra(vNrRap, vInAmostra)
				if vInAmostra then vInForn = true
			else
				'se já estiverem integrados, executa procedure de verificação
				with objcmd
					.CommandTimeOut = 180
					.CommandText = "sp_rap_verifica_fornec"
					.CommandType = adCmdStoredProc
					.Parameters.Refresh
					.Parameters("@nrRap") = vNrRap
					.Execute , , adExecuteNoRecords
					if .Parameters("@RETURN_VALUE") = 1 then vInForn = true
				end with
			end if
			if objrsx.State = adStateOpen then objrsx.Close()
		end if
		'verifica os packing-list caso os fornecimentos estejam ok
		if vInForn then
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT COUNT(*) FROM TRAP_PACK_LIST (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.Fields.Item(0).Value = 0 then
				'caso não existam packing list, apenas torna a rap apta a recebe-los
				str = "Instrução de embarque pronta para receber o Packing List."
				sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, TX_VALIDACAO = '"&str&"' WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
			else
				'se já estiverem integrados, executa procedure de verificação
				with objcmd
					.CommandTimeOut = 180 'ORIGINAL=100
					.CommandText    = "sp_rap_verifica_pack"
					.CommandType    = adCmdStoredProc
					.Parameters.Refresh
					.Parameters("@nrRap") = vNrRap
					.Execute , , adExecuteNoRecords
					if .Parameters("@RETURN_VALUE") = 1 then vInPack = true else vInPack = false
				end with
			end if
			if objrsx.State = adStateOpen then objrsx.Close()
		end if
	end if
	
	'verifica se o botão de emissão de doctos vai ser exibido
	if not(vTpAcao="listar") then
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
		vInEmissao = (objrs.Fields.Item(0).Value = 0)
	end if
	'verifica se as informações para integração do fornecimento e packing list estão preenchidas
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, TX_VALIDACAO, IN_AMOSTRA, IN_ANTECIPADO "&_
				"FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vInRap    = objrs.Fields.Item("IN_RAP_VALIDA").Value
	vInForn   = objrs.Fields.Item("IN_FORN_VALIDA").Value
	vInPack   = objrs.Fields.Item("IN_PACK_VALIDA").Value
	vTxValida = objrs.Fields.Item("TX_VALIDACAO").Value
	'exibe os botões de integração
  vMostrarRemessa = (vInRapDocto and not(vTpAcao="visualizar") and not vInAmostra)
	vMostrarTxt = (vInRap and not(vTpAcao="visualizar") and not vInAmostra)
	vMostrarXls = (vInForn and not(vTpAcao="visualizar"))
	vValida     = (vInRap and vInForn and vInPack)
	if objrs.State = adStateOpen then objrs.Close()
end if

if vTpAcao = "deletar" then
'Response.Redirect("teste.asp?var1="&vNrRap&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
	'sql = "UPDATE TRAP SET "&_
	'			"		CD_STATUS = '0', CD_USUARIO_CANC = '"& Session("cd_usuario") &"', DT_CANCELADO = GETDATE() " &_
	'			"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_STATUS = '1'" 
	sql = "DELETE FROM TRAP WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql2= "DELETE FROM TRAP_ARQUIVO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql3= "DELETE FROM TRAP_DOCUMENTACAO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql4= "DELETE FROM TRAP_EMBARQUE WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql5= "DELETE FROM TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql6= "DELETE FROM TRAP_PACK_LIST WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql7= "DELETE FROM TRAP_PACK_VOLUME WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	sql8= "DELETE FROM TRAP_REEMISSAO_DOCTO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"

	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute sql
	objcnn.Execute sql2
	objcnn.Execute sql3
	objcnn.Execute sql4
	objcnn.Execute sql5
	objcnn.Execute sql6
	objcnn.Execute sql7
	objcnn.Execute sql8

	objcnn.Execute sql, num
	'if num = 0 then
	'	tx_erro = "A instrução "&vNrRap&" não pode ser cancelada!\nApenas instruções com o status ""Em Aberto"" podem ser excluídas."
	'end if
	vTpAcao = "listar"       		 
	Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=listar&tx_erro="&Server.URLEncode(tx_erro))	
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" type="text/javascript">
<!--
var pesqNrRap, pesqNrCDE;
var vCodUser = '<%= Session("cd_usuario")%>';
var vCargo = '<%=Session("cd_cargo")%>';
var vCodMenu = '<%= cd_menu%>';
var vCodSubm = '<%= cd_subm%>';
var vCodDocto = '<%= cd_docto%>';
var vTpExibe = <%= vTpExibe%>;

function abreIntegra(vInTipo) {	
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 210;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=no";
	window.open('ccexcel.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vnrRap%>&vInTipo='+vInTipo,"integra",features);	

}

function abreEmbarque() {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 550;
	var vHeight = 400;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('ccembarque.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=listar&vRaps=""',"embarque",features);
}
function abreAutPed() {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 550;
	var vHeight = 400;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('ccautped.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=listar&vRaps=""',"autPed",features);
}

function abreImpressao() {
	window.open('ccprint.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>','imprimir','top=100,left=20,width=700,height=600,scrollbars=yes');
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vNrPagina='+selObj.options[selObj.selectedIndex].value
	ExibeListaPack('divPackList', target);
	if (restore) selObj.selectedIndex = 0;
}

function ExecutaAcao(nTipo, nAcao) {
	//executa as ações definidas nos botões
	if (nTipo==0) { //botão novo
		var vLink = 'cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=novo'
		if (nAcao=='novo' || nAcao=='editar') {
			if (confirm('Tem certeza que deseja criar uma nova instrução?\nOs dados editados na instrução serão perdidos!')) { document.location=vLink;			}
		} else { document.location=vLink; }
	}
	if (nTipo==2) { //botão cancelar
		if (nAcao=='novo' || nAcao=='editar') {
			PreencheForm();
			if (nAcao=='novo') document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=listar';
		} else {
			alert('Você não está no modo de edição para cancelar a Edição!');
		}
	}
	if (nTipo==3) { //botão excluir
		if (nAcao=='novo') {
			alert('Esta instrução ainda não foi criada, utilize o botão Cancelar!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar vizualizando a instrução ou utilizar o comando na coluna "Excluir"!')}
			else {
				if (confirm('Tem certeza em excluir a instrução?!')) {
					document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=deletar';
				}
			}
		}
	}
	if (nTipo==4) { //botão duplicar
		if (nAcao=='novo') {
			alert('Esta instrução deve ser salva antes de ser duplicada!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar vizualizando a instrução ou utilizar o comando na coluna "Duplicar"!')}
			else {document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=duplicar';}
		}
	}
	if (nTipo==5) { //botão imprimir
		if (nAcao=='novo') {
			alert('Esta instrução deve ser salva para ser impressa!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar vizualizando a instrução para pode imprimir!');}
			else {abreImpressao();}
		}
	}
	if (nTipo==6) { //botão autorizar embarque
		abreEmbarque();
	}
	if (nTipo==7) { //botão listar instruções
		document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=listar';
	}
	if (nTipo==8) { //botão autorizar para emissão de doctos
		abreAutPed();
	}	
	
		if (nTipo==9) { //botão duplicar flavio
			PreencheForm();
			if (nAcao=='duplicar') document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&vNrRap=<%= vNrRap%>&cd_docto=<%= cd_docto%>&vTpAcao=duplica';
	}


}

function AlternaImgHint(objImg, vValida) {
	if (vValida)
		objImg.alt='A instrução está pronta para criar um embarque.';
	else
		objImg.alt='Clique aqui para verificar os erros contidos na instrução.';
}

function HabFabric(nInFabExp) {
	//se o fabricante for o exportador, desativa o campos fabricante
	with (document.frmIntegraRap) {
		if (nInFabExp.value == '1') {
			edtCodFabricante.style.background = "#DDDDDD";
			edtCodFabricante.disabled = true;
		} else {
			edtCodFabricante.style.background = "#FFFFFF";
			edtCodFabricante.disabled = false;
			edtCodFabricante.focus();
		}
	}
}

function MudaDrawback(vCombo) {
	var vValue = vCombo.options[vCombo.selectedIndex].value;
	with (document.frmIntegraRap) {
		if (vValue!='0') {
			edtNrAtoDrawback.disabled = false;
			edtNrAtoDrawback.focus();
		} else {
			edtNrAtoDrawback.disabled = true;
		}
	}
}

function HabNotifyConsignee(objSelect, objText) {
	//habilita o codigo do notify
	//with (document.frmIntegraRap) {
		if (objSelect.options[objSelect.selectedIndex].value == '5') {
			objText.style.background = "#DDDDDD";
			objText.disabled = true;
		} else {
			objText.style.background = "#FFFFFF";
			objText.disabled = false;
			objText.focus();
		}
	//}
}

function ConsNotify(nCombo, vTipo, vEditCod, vEditNome) {
	with (document.frmIntegraRap) {
		if (nCombo=='N') var vCombo = cmbTpNotify.options[cmbTpNotify.selectedIndex].value;
		if (nCombo=='C') var vCombo = cmbTpConsignee.options[cmbTpConsignee.selectedIndex].value;
		//de acordo com o tipo de notify/consignee, altera as consultas
		if (vCombo == '0') { //importador
			if (vTipo == 1) {
				if (vCargo == '040' || vCargo == '055' || vCargo == '060') {
					ConsultaOnLineSQL(6,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,'');
				} else {
					ConsultaOnLineSQL(0,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,edtCodExportador.value);
				}
			} else {
				FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',vEditCod,vEditNome.name);
			}
		}
		if (vCombo == '1') { //agente
			if (vTipo == 1) {
				if (vCargo == '040' || vCargo == '055' || vCargo == '060') {
					ConsultaOnLineSQL(8,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,'');
				} else {
					ConsultaOnLineSQL(3,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,'');
				}
			} else {
				FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',vEditCod,vEditNome.name);
			}
		}
		if (vCombo == '2') { //banco
			if (vTipo == 1) {
				if (vCargo == '040' || vCargo == '055' || vCargo == '060') {
					ConsultaOnLineSQL(9,'Código,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,'');
				} else {
					ConsultaOnLineSQL(2,'Código,Descrição,Apelido,Endereço','CD_EMPRESA',vEditCod.name,'');
				}
			} else {
				FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',vEditCod,vEditNome.name);
			}
		}
		if (vCombo == '3') { //transportador
			if (vTipo == 1) {
				ConsultaOnLine('TTRANSP_ITL','CD_TRANSP_ITL,NM_TRANSP_ITL','Código,Descrição','CD_TRANSP_ITL','',vEditCod.name);
			} else {
				FastLookup('TTRANSP_ITL','CD_TRANSP_ITL','NM_TRANSP_ITL',vEditCod,vEditNome.name);
			}
		}
		if (vCombo == '4') { //despachante
			if (vTipo == 1) {
				ConsultaOnLine('TDESPACHANTE','CD_DESPACHANTE,NM_DESPACHANTE','Código,Descrição','CD_DESPACHANTE','',vEditCod.name);
			} else {
				FastLookup('TDESPACHANTE','CD_DESPACHANTE','NM_DESPACHANTE',vEditCod,vEditNome.name);
			}
		}
	}
}

function ExibeListaRap(vDiv, vTpExibe, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		document.getElementById('pNrRap').value = '';
		document.getElementById('pNrCDE').value = '';
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","cclista.asp?"+vFeatures+"&pNrRap="+pesqNrRap+"&pNrCDE="+pesqNrCDE+"&vTpExibe="+vTpExibe, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vCorpo.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
		pesqNrRap = '';
		pesqNrCDE = '';
	}
}

function ExibeListaPack(vDiv, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;
		var w = 600;
		var z = 400;
		var vCorpo = document.getElementById(vDiv); //div onde será colocada a descrição
		//define a posição do div e exibe na tela
		vCorpo.style.width = w;
		vCorpo.style.height = z;
		vCorpo.style.left = (x-w)/2;
		vCorpo.style.top = (y-z)/2;
		vCorpo.style.visibility = "visible";
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","ccpack.asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando lista...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vCorpo.innerHTML = vResult;
				} else {
					alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function FechaListaPack(vDiv1, vDiv2) {
	if (document.getElementById) {
		var vPallet = document.getElementById(vDiv1);
		var vVolume = document.getElementById(vDiv2);
		vVolume.style.visibility = "hidden";
		vPallet.style.visibility = "hidden";
		document.location = 'cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=editar&vInTestarRap=1';
	}	
}

function ExibeProblemasRap(vNrRap, vTipo) {
  /* tipo = 0 - Embarque
	   tipo = 1 - Pedido */
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 550;
	var vHeight = 400;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	 
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=yes,status=yes";
	window.open('ccerro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap='+vNrRap+'&vTipo='+vTipo,"diagnostico",features);
}

function ValidaForm(vForm, vTpAcao) {
  var valida = true;
	var txErro = new String;
	var vValue;
	if (vTpAcao=='novo' || vTpAcao=='editar' || vTpAcao=='salvar' || vTpAcao=='dulpicar') {

//flavio força digitar Nr Instrução		
		if (vForm.edtCodRap.value=='' || (vForm.edtCodRap.value!='' && vForm.edtCodRap.value=='')) {
			vForm.edtCodRap.focus();
			vForm.edtCodRap.background = "red";
			alert('Digite o Nr. Instrução!');
			vForm.edtCodRap.background = "white";
		 return false;
		}

//flavio força digitar ano		
		if (vForm.edtCodRapAno.value=='' || (vForm.edtCodRapAno.value!='' && vForm.edtCodRapAno.value=='')) {
			vForm.edtCodRapAno.focus();
			vForm.edtCodRapAno.background = "red";
			alert('Digite o ano!');
			vForm.edtCodRapAno.background = "white";
			return false;
		}

		if (vForm.edtCodExportador.value=='' || (vForm.edtCodExportador.value!='' && vForm.edtNmExportador.value=='')) {
			vForm.edtCodExportador.focus();
			vForm.edtCodExportador.background = "red";
			alert('Por favor informe um código de exportador válido!');
			vForm.edtCodExportador.background = "white";
			return false;
		}
		
		if (vForm.edtNrFornec.value!='') {
			var aFornec = [];
			vValue = vForm.edtNrFornec.value;
			startPos = 0;  endPos = vValue.indexOf(";",startPos); i=0;
			if (endPos == -1) endPos = vValue.length;
    	while (startPos < vValue.length) {
				aFornec[i++] = vValue.substring(startPos,endPos);
				startPos = endPos+1;  endPos = vValue.indexOf(";",startPos);
				if (endPos == -1) endPos = vValue.length;
			}
			for (i=0;i<aFornec.length;i++) {
				if(aFornec[i].length > 10) txErro += '\n'+aFornec[i]+': tamanho inválido, maior que 10 dígitos;';
				if(aFornec[i].length < 8) txErro += '\n'+aFornec[i]+': tamanho inválido, menor que 8 dígitos;';
			}
			if (txErro.length > 0) {
				vForm.edtNrFornec.focus();
				vForm.edtNrFornec.style.background = "red";
				alert('Verifique seus fornecimentos:'+txErro);
				vForm.edtNrFornec.style.background = "white";
				valida = false;
			}
		}/* else {
			vForm.edtNrFornec.style.background = "red";
			alert('O NR. DE FORNECIMENTO não pode ser vazio!');
			vForm.edtNrFornec.style.background = "white";
			valida = false;
		}
		vValue = vForm.edtVlAcrescimo.value;
		vValue = vValue.replace(/\./g,'');
		vValue = vValue.replace(/\,/g,'.');
		if (!isNaN(vValue)) {
			vValue = parseFloat(vValue);
			if (vValue > 0 && vForm.edtNrNotaCredito.value == '') {
				vForm.edtNrNotaCredito.focus();
				vForm.edtNrNotaCredito.style.background = "red";
				alert('Quando existe acréscimo é necessário informar o Nr. da nota de crédito!');
				vForm.edtNrNotaCredito.style.background = "white";
				valida = false;
			}
		}*/
	}// else {
		//alert('Para duplicar é necessário alterar o Nr. Instrução/CDE!');
	//	valida = true;
	//}
	//return valida
}

function abreIntegraPE(nr_rap) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 780;
	var vHeight = 550;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
  window.open('integra_PE.asp?nr_rap='+nr_rap,"win9",features);
}

function abreDesintegraPE(nr_rap) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 750;
	var vHeight = 550;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
  window.open('desintegra_PE.asp?nr_rap='+nr_rap,"win9",features);
}

-->
</script>
<style type="text/css">
<!--
.c1 {
	border:dotted #DDDDDD;
	border-width: 0px 0px 1px 0px;
}
.c2 {
	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
}
.edtDisabled {
	background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
.imgValida {
	border-width: 0px;
	height: 16px;
	width: 16px;
	cursor:hand;
}
#divPackList {
	position: absolute;
	top:0px;
	left:0px;
	width:0px;
	height:0px;
	visibility: hidden;
	z-index: 2;
	overflow: hidden;
	border: solid 2px #000000;
	background-color: #FFFFFF;
}
#divVolume {
	position:absolute;
	top:50px;
	left:0px;
	width:100%;
	height:100%;
	visibility: hidden;
	z-index: 3;
	overflow:auto;
	background-color: #FFFFFF;
}
-->
</style>
</head>

<body onLoad="PreencheForm('<%= vTpAcao%>');">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<form name="frmIntegraRap" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=salvar" method="post" onSubmit="return ValidaForm(this,'<%= vTpAcao%>');">
	<tr height="<%= Application("vl_width_header")%>" valign="top">
		<td colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->		</td>
	</tr>
	<tr height="100">
		<td width="250" valign="top" rowspan="2"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->		</td>
		<td width="100%" valign="top" bgcolor="#FCFCFC" style="border: 1px #CCCCCC solid;">
		<table width="100%" border="0" cellpadding="0" cellspacing="1">
			<tr height="30">
				<td colspan="15" class="titulo">..::: Instru&ccedil;&atilde;o de Embarque :::..</td>
			</tr>
			<tr height="40">
				<td width="45"><img name="btnNovaRap" src="/imagens/icones/32x32/btn_novo.jpg" class="btnImagem" alt="Nova Instrução" onClick="ExecutaAcao(0,'<%= vTpAcao%>');"></td>
<%If vTpAcao="duplicar" then%>
				<td width="45"><input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Salvar cópia desta instrução" value="Submit"></td>
				<input name="checkSubmit" type="hidden" id="checkSubmit" value="duplicar">
				<!--Zera a variável edtCodRap para gravação de instrução duplicada HOJE--> 
				<input name="edtCodRap" type="hidden" id="edtCodRap">
<%else%>
				<td width="45"><input type="image" name="btnSalvar" src="/imagens/icones/32x32/btn_salvar.gif" class="btnImagem" alt="Salvar Edição" value="Submit"></td>
<%end if%>				
				<td width="45"><img name="btnCancelar" src="/imagens/icones/32x32/btn_cancelar.gif" class="btnImagem" alt="Cancelar Edição" onClick="ExecutaAcao(2,'<%= vTpAcao%>');"></td>
				<td width="45"><img name="btnExcluir" src="/imagens/icones/32x32/btn_excluir.gif" class="btnImagem" alt="Excluir" onClick="ExecutaAcao(3,'<%= vTpAcao%>');"></td>
				<td width="45"><img name="btnDuplicar" src="/imagens/icones/32x32/btn_duplicar.gif" class="btnImagem" alt="Duplicar" onClick="ExecutaAcao(4,'<%= vTpAcao%>');"></td>
				<td width="45"><img name="btnPrintRap" src="/imagens/icones/32x32/btn_print.gif" class="btnImagem" alt="Imprimir" onClick="ExecutaAcao(5,'<%= vTpAcao%>');"></td>
				<% if vInEmissao and vInAntecipado then %>
        <td width="45"><img name="btnEmissao" src="/imagens/icones/32x32/btn_emissao.gif" class="btnImagem" alt="Autorizar Emissão de Doctos." onClick="ExecutaAcao(8,'<%= vTpAcao%>');"></td>
        <% end if %>
				<td width="45"><img name="btnAutorizar" src="/imagens/icones/32x32/btn_autorizar.gif" class="btnImagem" alt="Autorizar Embarque" onClick="ExecutaAcao(6,'<%= vTpAcao%>');"></td>
				<td width="45"><img name="btnListarRap" src="/imagens/icones/32x32/btn_listar.gif" class="btnImagem" alt="Listar Instruções" onClick="ExecutaAcao(7,'<%= vTpAcao%>');"></td>
				<% if (vTpAcao <> "listar") and vInAntecipado then %>
				<td width="45"><img name="btnListarPE" src="/imagens/icones/32x32/btn_listartxt.gif" class="btnImagem" alt="Listar Pedidos" onClick="abreIntegraPE('<%= vNrRap %>');"></td> 
				<% end if 
				if vMostrarRemessa and vInAntecipado then %>
  			<td width="45"><img name="btnIntegraRemessa" src="/imagens/icones/32x32/btn_txt_1.gif" class="btnImagem" alt="Integrar Pedido" onClick="abreIntegra(2);"></td> 
  	  	<% end if 
				if vMostrarTxt then %>
				<td width="45"><img name="btnIntegraForn" src="/imagens/icones/32x32/btn_txt_1.gif" class="btnImagem" alt="Integrar Fornecimento" onClick="abreIntegra(0);"></td>
				<% end if 
				 if vMostrarXls then %>
				<td width="45"><img name="btnIntegraPack" src="/imagens/icones/32x32/btn_excel_2.gif" class="btnImagem" alt="Integrar Packing List" onClick="abreIntegra(1);"></td>
				<% end if 
				'Cria novas colunas dependendo dos botões mostrados
				%>
				<td width="50%">&nbsp;</td>
			</tr>
			<%
if vTpAcao = "listar" then
%>
			<tr height="25">
				<td colspan="15" style="border-top: 1px solid #CCCCCC; padding: 5px 0px 0px 0px;">&nbsp;<b>Exibir instruções:</b>
				<select name="cmbExibeInst" id="exibe" class="select" style="width:100px;" onChange="ExibeListaRap('divCorpo',this.options[this.selectedIndex].value,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');vTpExibe=this.options[this.selectedIndex].value;">
					<option value="5"></option>
					<option value="0">Canceladas</option>
					<option value="1" selected="selected">Em Aberto</option>
					<option value="2">Autorizadas</option>
					<option value="3">Em Andamento</option>
					<option value="4">Faturados</option>
				</select>
				Pesquisar
				<label for="pNrRap" class="label">Rap:</label>
				<input name="pNrRap" type="text" id="pNrRap" maxlength="9" class="editbox" style="width:60px;" onBlur="pesqNrRap=this.value;"> ou
				<label for="pNrCDE" class="label">CDE:</label>
				<input name="pNrCDE" type="text" id="pNrCDE" maxlength="15" class="editbox" style="width:60px;" onBlur="pesqNrCDE=this.value;">
				<a href="#" onClick="ExibeListaRap('divCorpo',5,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='5';vTpExibe=5;"><img src="/imagens/icones/16x16/button_view.gif" alt="Pesquisar" width="14" height="13" border="0"></a></td>
			</tr>
			<%
else
%>
			<tr height="25">
				<td colspan="6" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Cadastro de Instru&ccedil;&atilde;o de Embarque</b></td>
				<td colspan="9" style='border-top: 1px solid #CCCCCC; font-size:12px;'>
				<%
	if vTpAcao <> "novo" then
		if vValida then
			Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/icones/16x16/btn_check.gif' class='imgValida'> Instrução de Embarque válida e pronta para embarque.</a>")
		else
  		if vInAntecipado then
				if vInRemessa then
					Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '1');""><img src='/imagens/icones/16x16/btn_checktxt.gif' class='imgValida'> Instrução de Embarque pronta para Autorização de Emissão de Doctos.</a><br>")
				else
					Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '1');""><img src='/imagens/icones/16x16/btn_canceltxt.gif' class='imgValida'> Verifique os erros da instrução clicando aqui. (Autorização de Doctos.)</a><br>")
				end if
			end if
			Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/icones/16x16/btn_cancel.gif' class='imgValida'> Verifique os erros da instrução clicando aqui. (Embarque)</a>")
		end if

	end if
%>
				<input type="hidden" name="vNrRap"></td>
			</tr>
			<%
end if
%>
		</table></td>
	</tr>
	<tr>
		<td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="divPackList" class="divPackList"></div>
			<div id="divCorpo" class="formClass">
				<%
if vTpAcao <> "listar"  and vTpAcao <> "listarPE" then
	if vTpAcao = "novo" then 
		vNrRap           = ""
		vCodExportador   = ""
		vCodLogomarca    = ""
		vCodFabricante   = ""
		vCodCliente      = ""
		vCodPais         = ""
		vCodCondPagto    = ""
		vCodAgenteComissao = ""
		vCodIncoterm     = ""
		vCodDepColeta    = ""
		vCodLocalColeta  = ""
		vCodTerminal     = ""
		vCodViaTransp    = ""
		vCodEmbarcador   = ""
		vCodEmbarcacao   = ""
		vCodLocalEmb     = ""
		vCodLocalDesemb  = ""
		vCodNotify       = ""
		vCodConsignee    = ""
		vCodBanco        = ""
		vCodFormaPagar   = "3"
		vCodMoedaMLE     = ""
		vNrFornec        = ""
		vNrCDE           = ""
		vNrVoo           = ""
		vNrViagem        = ""
		vNrAtoDrawback   = ""
		vNrInspecao      = ""
		vNrNotaCredito   = ""
		vInFabrExpo      = 0
		vInTriangulacao  = 0
		vInPermisso      = 0
		vInEmbalagem     = 0
		vInConsulado     = 0
		vInPalletExpurgo = 0
		vInExpurgo       = 0
		vInInspecao      = 0
		vInCartaCredito  = 0
		vInCadivi        = 0
		vInAmostra       = 0
		vInAntecipado    = 0
		vDtFaturamento   = ""
		vDtEmbarque      = ""
		vDtInspecao      = ""
		vDtDeadLineDraft = ""
		vDtDeadLineCarga = ""
		vDtRecebido      = ""
		vDtFechado       = ""
		vDtPrevSaida     = ""
		vTpDrawback      = "0"
		vTpNotify        = "5"
		vTpConsignee     = "5"
		vTxOrgao         = ""
		vTxLocalInspecao = ""
		vTxLocalExpurgo  = ""
		vTxEmbalagem     = ""
		vTxMarcacao      = ""
		vTxInstEmb       = ""
		vTxMotivoDesc    = ""
		vVlComissao      = 0.0
		vVlMLE           = 0.0
		vVlSeguro        = 0.0
		vVlAcrescimo     = 0.0
		vVlDesconto      = 0.0
		vVlFreteInt      = 0.0
		vVlPesoBruto     = 0.0
		vVlPesoLiq       = 0.0
		vVlCubagem       = 0.0
		vVlQtdVolume     = 0
	else
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO, "&_
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
					"FROM TRAP (NOLOCK) "&_
          "WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'" 'flavio
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'define variaveis para exibição no form
		vCodExportador   = objrs.Fields.Item("CD_EXPORTADOR").Value
		vCodLogomarca    = objrs.Fields.Item("CD_LOGOMARCA").Value
		vCodFabricante   = objrs.Fields.Item("CD_FABRICANTE").Value
		vCodCliente      = objrs.Fields.Item("CD_CLIENTE").Value
		vCodPais         = objrs.Fields.Item("CD_PAIS").Value
		vCodCondPagto    = objrs.Fields.Item("CD_TERMO_PAGTO").Value
		vCodAgenteComissao = objrs.Fields.Item("CD_AGENTE_COMISSAO").Value
		vCodIncoterm     = objrs.Fields.Item("CD_INCOTERM").Value
		vCodDepColeta    = objrs.Fields.Item("CD_DEP_COLETA").Value
		vCodLocalColeta  = objrs.Fields.Item("CD_LOCAL_COLETA").Value
		vCodTerminal     = objrs.Fields.Item("CD_TERMINAL").Value
		vCodViaTransp    = objrs.Fields.Item("CD_VIA_TRANSPORTE").Value
		vCodEmbarcador   = objrs.Fields.Item("CD_EMBARCADOR").Value
		vCodEmbarcacao   = objrs.Fields.Item("CD_EMBARCACAO").Value
		vCodLocalEmb     = objrs.Fields.Item("CD_LOCAL_ORIGEM").Value
		vCodLocalDesemb  = objrs.Fields.Item("CD_LOCAL_DESTINO").Value
		vCodNotify       = Trim(objrs.Fields.Item("CD_NOTIFY").Value)
		vCodConsignee    = Trim(objrs.Fields.Item("CD_CONSIGNATARIO").Value)
		vCodBanco        = objrs.Fields.Item("CD_BANCO").Value
		vCodFormaPagar   = objrs.Fields.Item("CD_FORMA_PAGAR").Value
		vCodMoedaMLE     = objrs.Fields.Item("CD_MOEDA_MLE").Value
		vNrFornec        = Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value)
		vNrCDE           = Trim(objrs.Fields.Item("NR_CDE").Value)
		vNrVoo           = Trim(objrs.Fields.Item("NR_VOO").Value)
		vNrViagem        = Trim(objrs.Fields.Item("NR_VIAGEM").Value)
		vNrAtoDrawback   = Trim(objrs.Fields.Item("NR_ATO_CONCESSORIO").Value)
		vNrInspecao      = Trim(objrs.Fields.Item("NR_INSPECAO").Value)
		vNrNotaCredito   = Trim(objrs.Fields.Item("NR_NOTA_CREDITO").Value)
		vInFabrExpo      = objrs.Fields.Item("IN_FABR_EXPO").Value
		vInTriangulacao  = objrs.Fields.Item("IN_TRIANGULACAO").Value
		vInPermisso      = objrs.Fields.Item("IN_PERMISSO").Value
		vInEmbalagem     = objrs.Fields.Item("IN_DECL_EMBALAGEM").Value
		vInConsulado     = objrs.Fields.Item("IN_CONSULADO").Value
		vInPalletExpurgo = objrs.Fields.Item("IN_PALLET_EXPURGO").Value
		vInExpurgo       = objrs.Fields.Item("IN_EXPURGO").Value
		vInInspecao      = objrs.Fields.Item("IN_INSPECAO").Value
		vInCartaCredito  = objrs.Fields.Item("IN_CARTA_CREDITO").Value
		vInCadivi        = objrs.Fields.Item("IN_CADIVI").Value
		vInAmostra       = objrs.Fields.Item("IN_AMOSTRA").Value
		vInAntecipado    = objrs.Fields.Item("IN_ANTECIPADO").Value
		vDtFaturamento   = fnc_Mascara(objrs.Fields.Item("DT_FATURAMENTO").Value, 5)
		vDtEmbarque      = fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)
		vDtInspecao      = fnc_Mascara(objrs.Fields.Item("DT_INSPECAO").Value, 5)
		vDtDeadLineDraft = fnc_Mascara(objrs.Fields.Item("DT_DDL_DRAFT").Value, 5)
		vDtDeadLineCarga = fnc_Mascara(objrs.Fields.Item("DT_DDL_CARGA").Value, 5)
		vDtRecebido      = fnc_Mascara(objrs.Fields.Item("DT_RECEBIDO").Value, 5)
		vDtFechado       = fnc_Mascara(objrs.Fields.Item("DT_FECHAMENTO").Value, 5)
		vDtPrevSaida     = fnc_Mascara(objrs.Fields.Item("DT_PREV_SAIDA").Value, 5)		
		vTpDrawback      = Trim(objrs.Fields.Item("TP_DRAWBACK").Value)
		vTpNotify        = Trim(objrs.Fields.Item("TP_NOTIFY").Value)
		vTpConsignee     = Trim(objrs.Fields.Item("TP_CONSIGNEE").Value)
		vTxOrgao         = Trim(objrs.Fields.Item("TX_ORGAO").Value)
		vTxLocalInspecao = Trim(objrs.Fields.Item("TX_LOCAL_INSPECAO").Value)
		vTxLocalExpurgo  = Trim(objrs.Fields.Item("TX_LOCAL_EXPURGO").Value)
		vTxEmbalagem     = Trim(objrs.Fields.Item("TX_EMBALAGEM").Value)
		vTxMarcacao      = Trim(objrs.Fields.Item("TX_MARCACAO").Value)
		vTxInstEmb       = Trim(objrs.Fields.Item("TX_INST_EMB").Value)
		vTxMotivoDesc    = Trim(objrs.Fields.Item("TX_MOTIVO_DESC").Value)
		vVlComissao      = objrs.Fields.Item("VL_COMISSAO").Value
		vVlMLE           = objrs.Fields.Item("VL_MLE").Value
		vVlSeguro        = objrs.Fields.Item("VL_SEGURO").Value
		vVlAcrescimo     = objrs.Fields.Item("VL_ACRESCIMO").Value
		vVlDesconto      = objrs.Fields.Item("VL_DESCONTO").Value
		vVlFreteInt      = objrs.Fields.Item("VL_FRETE_INT").Value
		vVlPesoBruto     = objrs.Fields.Item("VL_PESO_BRUTO").Value
		vVlPesoLiq       = objrs.Fields.Item("VL_PESO_LIQ").Value
		vVlCubagem       = objrs.Fields.Item("VL_CUBAGEM").Value
		vVlQtdVolume     = objrs.Fields.Item("VL_QTD_VOL").Value
		'coloca mascara no nr. da CDE
		if fnc_TestaVar(vNrCDE) then
			vNrCde = Replace(vNrCDE,"/","")
			vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
		else
			vNrCde = "      /  "
		end if
		'verifica o status e exibe a data do ultimo status
		select case objrs.Fields.Item("CD_STATUS").Value
			case 0 
				vTpStatus = "Cancelado: "
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_CANC").Value
			case 1
				vTpStatus = "Abertura: "
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_CRIADOR").Value
			case 2, 3
				vTpStatus = "Autorizado: "
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_FIM").Value
			case else
				vTpStatus = ""
				vDtStatus = ""
				vHrStatus = ""
				vUsStatus = Session("cd_usuario")
		end select
		objrs.Close()
	end if
	vl_heigth = 22
%>
				<table width="750" border="0" cellspacing="0" cellpadding="2">
					<col width="130">
					<col width="250">
					<col width="130">
					<col width="240">
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="rap">Nr. Instrução/CDE </label></td>
						<%
						'Select case vTpacao
						'case vTpAcao = "novo" HOJE 11/01/2008
						if vTpAcao = "novo" or vTpAcao = "duplicar" then%>
								<td class="c2">
								<%If vTpAcao = "duplicar" then%> 
								<input name="edtCodRap2" type="text" class="editbox" id="rap" style="width: 100px;" tabindex="1"  size="6" maxlength="6">
								<%else%>
								<input name="edtCodRap" type="text" class="editbox" id="rap" style="width: 100px;" tabindex="1"  size="6" maxlength="6">
					    	<script>//alert('NOVO!')</script>
						<%end if%>
							/
								<input name="edtCodRapAno" type="text" class="editbox" id="edtCodRapAno" style="width: 25px;" tabindex="1" size="2" maxlength="2" value="08"></td>
								<td class="c1"><label class="label"></label></td>
								<td class="c2">&nbsp;</td>
								<%'Response.Redirect("teste.asp?var1="&vedtCodRap&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")%>

					    	<script>alert('Digite um novo Nr. de Instrução/CDE!')</script>
					<%else%>
								<td colspan="3" class="c2"><input name="edtCodRap" type="text" class="editbox" id="rap" style="width: 100px;" tabindex="1" size="6" maxlength="6" readonly >
								<input name="edtCodRapAno" type="text" class="editbox" id="edtCodRapAno" style="width: 25px;" tabindex="1" size="2" maxlength="2"  readonly></td>
					    	<script>//alert('EDITAR!')</script>
<%end if%>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="cde">Usuário:</label></td>
						<td class="c2"><input type="text" class="editbox" style="width: 214px;" value="<%= fnc_ConsultaLookup("TUSUARIO", "CD_USUARIO", vUsStatus, "NM_USUARIO")%>" readonly></td>
						<td class="c1"><label class="label">Dt. <%= vTpStatus%></label></td>
						<td class="c2"><input type="text" class="editbox" style="width: 65px;" value="<%= vDtStatus%>" readonly>
							<input type="text" class="editbox" style="width: 35px;" value="<%= Left(vHrStatus, 5)%>" readonly></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Amostra?</b></td>
						<td class="c2"><input name="rdgInAmostra" type="radio" id="nao10" tabindex="3" value="0">
								<label class="label" for="nao10">N&atilde;o</label>
								<input name="rdgInAmostra" type="radio" id="sim10" value="1">
								<label class="label" for="sim10">Sim</label></td>
						<td class="c1"><b>Antecipado?</b></td>
						<td class="c2"><input name="rdgInAntecipado" type="radio" id="nao11" tabindex="4" value="0">
								<label class="label" for="nao11">N&atilde;o</label>
								<input name="rdgInAntecipado" type="radio" id="sim11" value="1">
								<label class="label" for="sim11">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="exp">Exportador:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodExportador" type="text" class="editbox" id="exp" style="width: 40px;" tabindex="5" onBlur="FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmExportador');" maxlength="5">
							<input type='text' name='edtNmExportador' class='edtDisabled' readonly>
							<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(4,'Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','edtCodExportador','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','','edtCodExportador');"
	end if
%>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></nobr></td>
						<td class="c1"><label class="label" for="logo">Logomarca:</label></td>
						<td class="c2"><select name="cmbCodLogomarca" class="select" id="logo" style="width:100px;" tabindex="6">
								<option value=""></option>
								<%= fncCriaOption("logo_saint")%>
						</select></td>
					</tr>
					
					<tr height="<%= vl_heigth%>">
						<td rowspan="3" class="c1"><label class="label" for="fornec">Nr. Fornecimento:</label></td>
						<td rowspan="3" valign="baseline" class="c2"><p>
						<br>
						    <textarea name="edtNrFornec" wrap="virtual" class="editbox" id="fornec" cols="30" rows="5" style="width:250px;height:70px;text-transform:uppercase;" tabindex="9" onChange="ApenasNumero(this,';');"></textarea>
						<br>

						</td>
                        
					  <td class="c1" height="<%= vl_heigth%>"><label class="label" for="dtfat"><b>Fabr. &eacute; o Exportador?</b></label></td>
						<td class="c2"><input name="rdgInFabrExpo" type="radio" id="nao0" tabindex="7" onClick="document.frmIntegraRap.edtCodFabricante.focus();" value="0">
                          <label class="label" for="nao0">N&atilde;o</label>
                          <input name="rdgInFabrExpo" type="radio" id="sim0" onClick="document.frmIntegraRap.edtCodFabricante.focus();" value="1">
                          <label class="label" for="sim0">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
					  <td class="c1"><span class="label">Fabricante:</span></td>
				      <td class="c2"><input name="edtCodFabricante" type="text" class="editbox" id="fab" style="width: 40px;" tabindex="8" onBlur="FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmFabricante');" maxlength="5">
                        <input type="text" name="edtNmFabricante" readonly class='edtDisabled'>
                        <%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(4,'C&oacute;digo,Descri&ccedil;&atilde;o,Apelido,Endere&ccedil;o,CNPJ','CD_EMPRESA','edtCodFabricante','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','C&oacute;digo,Descri&ccedil;&atilde;o,Apelido,Endere&ccedil;o,CNPJ','CD_EMPRESA','','edtCodFabricante');"
	end if
%>
                        <img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descri&ccedil;&atilde;o" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></td>
				  </tr>
					<tr height="<%= vl_heigth%>">
					  <td class="c1" ><strong>Dt. Faturamento:</strong></td>
				      <td class="c2"><input name="edtDtFaturamento" type="text" class="editbox" id="edtDtFaturamento" style="width: 80px;" tabindex="8" onKeyPress="return(MascaraData(this,'/',event));">
                        <img src="/imagens/icones/16x16/calenda.gif" alt="" width=16 height=16 border=0 align="absmiddle" id="btnDtFaturamento"></td>
				  </tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="cliente">Cliente:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodCliente" type="text" class="editbox" id="cliente" style="width: 40px;" tabindex="11" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmCliente');" maxlength="5">
							<input type="text" name="edtNmCliente" readonly class='edtDisabled'>
							<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(6,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodCliente','');"
	else
		str = "ConsultaOnLineSQL(0,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodCliente',edtCodExportador.value);"
	end if
%>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></nobr></td>
						<td class="c1"><label class="label" for="pais">Pa&iacute;s de Destino:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodPais" type="text" class="editbox" id="pais" style="width: 40px;" tabindex="12" onBlur="FastLookup('TPAIS','CODIGO','DESCRICAO',this,'edtNmPais');" maxlength="3">
							<input type="text" name="edtNmPais" readonly class='edtDisabled'>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TPAIS','CODIGO,DESCRICAO','Código,Descrição','CODIGO','','edtCodPais');"></nobr></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="dtemb">Dt. Acordada de Embarque:</label></td>
						<td class="c2"><input name="edtDtEmbarque" type="text" class="editbox" id="edtDtEmbarque" style="width: 80px;" tabindex="11" onKeyPress="return(MascaraData(this,'/',event));">
								<img id="btnDtEmbarque" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle"></td>
						<td class="c1"><b>CADIVI?</b></td>
						<td class="c2"><input name="rdgInCadivi" type="radio" id="nao9" tabindex="14" value="0">
								<label class="label" for="nao9">N&atilde;o</label>
								<input name="rdgInCadivi" type="radio" id="sim9" value="1">
								<label class="label" for="sim9">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="drawback">Drawback</label></td>
						<td class="c2"><select name="cmbTpDrawback" class="select" id="drawback" style="width:100px;" tabindex="15" onChange="MudaDrawback(this);">
								<%= fncCriaOption("drawback")%>
						</select></td>
						<td class="c1"><label class="label" for="edtNrAtoDrawback">Nr. Ato Consessório</label></td>
						<td class="c2"><input name="edtNrAtoDrawback" type="text" class="editbox" id="edtNrAtoDrawback" style="width:214px;text-transform:uppercase;" tabindex="16" maxlength="13"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Permisso?</b></td>
						<td class="c2"><input name="rdgInPermisso" type="radio" id="nao2" tabindex="17" value="0">
								<label class="label" for="nao2">N&atilde;o</label>
								<input name="rdgInPermisso" type="radio" id="sim2" value="1">
								<label class="label" for="sim2">Sim</label></td>
						<td class="c1"><b>Processo com triangulação?</b></td>
						<td class="c2"><input name="rdgInTriangulacao" type="radio" id="nao1" tabindex="18" value="0">
								<label class="label" for="nao1">Não</label>
								<input name="rdgInTriangulacao" type="radio" id="sim1" value="1">
								<label class="label" for="sim1">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Consulado?</b></td>
						<td class="c2"><input name="rdgInConsulado" type="radio" id="nao4" tabindex="19" value="0">
								<label class="label" for="nao4">N&atilde;o</label>
								<input name="rdgInConsulado" type="radio" id="sim4" value="1">
								<label class="label" for="sim4">Sim</label></td>
						<td class="c1"><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>
						<td class="c2"><input name="rdgInEmbalagem" type="radio" id="nao3" tabindex="20" value="0">
								<label class="label" for="nao3">N&atilde;o</label>
								<input name="rdgInEmbalagem" type="radio" id="sim3" value="1">
								<label class="label" for="sim3">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Pallet Expurgado?</b></td>
						<td class="c2"><input name="rdgInPalletExpurgo" type="radio" id="nao5" tabindex="21" value="0">
								<label class="label" for="nao5">N&atilde;o</label>
								<input name="rdgInPalletExpurgo" type="radio" id="sim5" value="1">
								<label class="label" for="sim5">Sim</label></td>
						<td class="c1"><label class="label" for="nrinspecao"><b>Certificado de Expurgo?</b></label></td>
						<td class="c2"><input name="rdgInExpurgo" type="radio" id="nao6" tabindex="22" value="0">
								<label class="label" for="nao6">N&atilde;o</label>
								<input name="rdgInExpurgo" type="radio" id="sim6" value="1">
								<label class="label" for="sim6">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Inspe&ccedil;&atilde;o?</b></td>
						<td class="c2"><input name="rdgInInspecao" type="radio" id="nao7" tabindex="23" value="0">
								<label class="label" for="nao7">N&atilde;o</label>
								<input name="rdgInInspecao" type="radio" id="sim7" value="1">
								<label class="label" for="sim7">Sim</label></td>
						<td class="c1"><label class="label" for="edtNrInspecao">Nr. de Inspe&ccedil;&atilde;o:</label></td>
						<td class="c2"><input name="edtNrInspecao" type="text" class="editbox" id="edtNrInspecao" style="width:214px;text-transform:uppercase;" tabindex="24" maxlength="10"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
						<td class="c1"><label class="label" for="orgao">&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</label></td>
						<td class="c2"><input name="edtTxOrgao" type="text" class="editbox" id="orgao" style="width:214px;text-transform:uppercase;" tabindex="25" maxlength="100"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="incoterm">Incoterm:</label></td>
						<td class="c2"><select name="cmbCodIncoterm" class="select" id="incoterm" style="width: 100px;" tabindex="26">
								<option value="">&nbsp;</option>
								<!--#include virtual="/selects/option_incoterm.txt"-->
						</select></td>
						<td class="c1"><label class="label" for="label">Condi&ccedil;&atilde;o de Pagamento:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodCondPagto" type="text" class="editbox" id="condpag" style="width: 40px;" tabindex="27" onBlur="FastLookup('TTERMO_PAGTO','CD_TERMO_PAGTO','NM_TERMO_PAGTO',this,'edtNmCondPagto');" maxlength="6">
							<input type="text" name="edtNmCondPagto" readonly class='edtDisabled'>
							<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(7,'Código,Descrição','CD_TERMO_PAGTO','edtCodCondPagto','');"
	else
		str = "ConsultaOnLine('TTERMO_PAGTO','CD_TERMO_PAGTO,NM_TERMO_PAGTO','Código,Descrição','CD_TERMO_PAGTO','','edtCodCondPagto');"
	end if
%>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></nobr></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlmle">Valor FOB:</label></td>
						<td class="c2"><input name="edtVlMLE" type="text" class="editbox" id="vlmle" style="width: 100px;" tabindex="28" onBlur="ValidaValor(this);"></td>
						<td class="c1"><label class="label" for="moeda">Moeda FOB:</label></td>
						<td class="c2"><input name="edtCodMoedaMLE" type="text" class="editbox" id="moeda" style="width: 40px;" tabindex="29" onBlur="FastLookup('TMOEDA_BROKER','CD_MOEDA','NM_MOEDA',this,'edtNmMoedaMLE');" maxlength="3">
								<input type="text" name="edtNmMoedaMLE" readonly class='edtDisabled'>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TMOEDA_BROKER','CD_MOEDA,NM_MOEDA','Código,Descrição','CD_MOEDA','','edtCodMoedaMLE');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlacres">Acréscimo:</label></td>
						<td class="c2"><input name="edtVlAcrescimo" type="text" class="editbox" id="vlacres" style="width: 100px;" tabindex="30" onBlur="ValidaValor(this);"></td>
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vldesc">Desconto:</label></td>
						<td class="c2"><input name="edtVlDesconto" type="text" class="editbox" id="vldesc" style="width: 100px;" tabindex="31" onBlur="ValidaValor(this);"></td>
						<td class="c1"><label class="label" for="edtTxMotivoDesc">Motivo Desconto:</label></td>
						<td class="c2"><input name="edtTxMotivoDesc" type="text" class="editbox" id="edtTxMotivoDesc" style="width:214px;text-transform:uppercase;" tabindex="32" maxlength="255"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlfrete">Valor Frete:</label></td>
						<td class="c2"><input name="edtVlFreteInt" type="text" class="editbox" id="vlfrete" style="width: 100px;" tabindex="33" onBlur="ValidaValor(this);"></td>
						<td class="c1"><label class="label" for="vlpb">Peso Bruto:</label></td>
						<td class="c2"><input name="edtVlPesoBruto" type="text" class="editbox" id="vlpb" style="width: 100px;" tabindex="34" onBlur="ValidaValor(this);"></td>						
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="seguro">Valor Seguro:</label></td>
						<td class="c2"><input name="edtVlSeguro" type="text" class="editbox" id="seguro" style="width: 100px;" tabindex="35" onBlur="ValidaValor(this);"></td>
						<td class="c1"><label class="label" for="vlpl">Peso L&iacute;quido:</label></td>
						<td class="c2"><input name="edtVlPesoLiq" type="text" class="editbox" id="vlpl" style="width: 100px;" tabindex="36" onBlur="ValidaValor(this);"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="cubagem">Cubagem:</label></td>
						<td class="c2"><input name="edtVlCubagem" type="text" class="editbox" id="cubagem" style="width: 100px;" tabindex="37" onBlur="ValidaValor(this);"></td>
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="edtTxEmbalagem">Embalagens:</label></td>
						<td class="c2"><input name="edtTxEmbalagem" type="text" class="editbox" id="edtTxEmbalagem" style="width:214px;text-transform:uppercase;" tabindex="38" maxlength="255"></td>
						<td class="c1"><label class="label" for="edtVlQtdVolume">Qtde. Volumes:</label></td>
						<td class="c2"><input name="edtVlQtdVolume" type="text" class="editbox" id="edtVlQtdVolume" style="width:100px;" tabindex="39" onBlur="ValidaValor(this);"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="comissao">Comiss&atilde;o:</label></td>
						<td class="c2"><input name="edtVlComissao" type="text" class="editbox" id="comissao" style="width: 40px;" tabindex="40" onBlur="ValidaValor(this);">
							&nbsp;%
							<input name="rdgCodFormaPagar" type="radio" id="grafica" tabindex="41" value="0">
							<label for="grafica">Gráfica</label>
							/
							<input name="rdgCodFormaPagar" type="radio" id="remeter" value="1">
							<label for="remeter">A Remeter</label></td>
						<td class="c1"><label class="label" for="agentec">Agente Comiss&atilde;o:</label></td>
						<td class="c2"><input name="edtCodAgenteComissao" type="text" class="editbox" id="agentec" style="width: 40px;" tabindex="42" onBlur="FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmAgenteComissao');" maxlength="5">
								<input type="text" name="edtNmAgenteComissao" readonly class='edtDisabled'>
								<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(8,'Código,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodAgenteComissao','');"
	else
		str = "ConsultaOnLineSQL(3,'Código,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodAgenteComissao','');"
	end if
%>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="coleta">Dep. Coleta:</label></td>
						<td class="c2"><input name="edtCodDepColeta" type="text" class="editbox" id="coleta" style="width: 40px;" tabindex="43" onBlur="FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmDepColeta');" maxlength="5">
								<input type="text" name="edtNmDepColeta" readonly class='edtDisabled'>
								<%
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		str = "ConsultaOnLineSQL(4,'Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','edtCodDepColeta','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','','edtCodDepColeta');"
	end if
%>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></td>
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="modal">Via de Transporte:</label></td>
						<td class="c2"><select name="cmbCodViaTransp" class="select" id="modal" style="width: 100px;" tabindex="44">
								<option value="">&nbsp;</option>
								<!--#include virtual="/selects/option_via_transporte.txt"-->
						</select></td>
						<td class="c1"><label class="label" for="embac">Embarcador:</label></td>
						<td class="c2"><input name="edtCodEmbarcador" type="text" class="editbox" id="embac" style="width: 40px;" tabindex="45" onBlur="FastLookup('TAGENTE','CD_AGENTE','NM_AGENTE',this,'edtNmEmbarcador');" maxlength="4">
								<input type="text" name="edtNmEmbarcador" readonly class='edtDisabled'>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TAGENTE','CD_AGENTE,NM_AGENTE','Código,Descrição','CD_AGENTE','','edtCodEmbarcador');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="navio">Navio:</label></td>
						<td class="c2"><input name="edtCodEmbarcacao" type="text" class="editbox" id="navio" style="width: 40px;" tabindex="46" onBlur="FastLookup('TEMBARCACAO','CD_EMBARCACAO','NM_EMBARCACAO',this,'edtNmEmbarcacao');" maxlength="4">
								<input type="text" name="edtNmEmbarcacao" readonly class='edtDisabled'>
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TEMBARCACAO','CD_EMBARCACAO,NM_EMBARCACAO','Código,Descrição','CD_EMBARCACAO','','edtCodEmbarcacao');"></td>
						<td class="c1"><label class="label" for="viagem">Nr. Viagem:</label></td>
						<td class="c2"><input name="edtNrViagem" type="text" class="editbox" id="viagem" style="width:80px;" tabindex="47" onKeyUp="ApenasNumero(this,'/');" maxlength="5">
								<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLineSQL(5,'Viagem,Dt. Esperada,Dt. Entrada,Local Embarque,Arm. Atracação,Nº Manifesto','NR_VIAGEM','edtNrViagem',edtCodEmbarcacao.value);"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="localemb">Local de Embarque:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodLocalEmb" type="text" class="editbox" id="localemb" style="width: 40px;" tabindex="48" onBlur="FastLookup('TLOCAL_EMBARQUE','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'edtNmLocalEmb');" maxlength="4">
							<input type="text" name="edtNmLocalEmb" readonly class='edtDisabled'>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TLOCAL_EMBARQUE','CD_LOCAL_EMB,NM_LOCAL_EMB','Código,Descrição','CD_LOCAL_EMB','','edtCodLocalEmb');"></nobr></td>
						<td class="c1"><label class="label" for="localdesemb">Local de Desembarque:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodLocalDesemb" type="text" class="editbox" id="localdesemb" style="width: 40px;" tabindex="49" onBlur="FastLookup('TLOCAL_EMBARQUE','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'edtNmLocalDesemb');" maxlength="4">
							<input type="text" name="edtNmLocalDesemb" readonly class='edtDisabled'>
							<img src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsultaOnLine('TLOCAL_EMBARQUE','CD_LOCAL_EMB,NM_LOCAL_EMB','Código,Descrição','CD_LOCAL_EMB','','edtCodLocalDesemb');"></nobr></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="notify">Notify:</label></td>
						<td class="c2"><select name="cmbTpNotify" class="select" id="notify" style="width:100px;" tabindex="50" onChange="HabNotifyConsignee(this,document.forms[0].edtCodNotify);">
								<%= fncCriaOption("pessoa_exp")%>
						</select></td>
						<td class="c1"><label class="label" for="consignee">Consignee:</label></td>
						<td class="c2"><select name="cmbTpConsignee" class="select" id="consignee" style="width:100px;" tabindex="51" onChange="HabNotifyConsignee(this,document.forms[0].edtCodConsignee);">
								<%= fncCriaOption("pessoa_exp")%>
						</select></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1">&nbsp;</td>
						<td class="c2"><nobr>
							<input name="edtCodNotify" type="text" class="editbox" style="width: 40px;" tabindex="52" onBlur="ConsNotify('N',0,this,document.forms[0].edtNmNotify);" maxlength="5">
							<input type="text" name="edtNmNotify" readonly class='edtDisabled'>
							<img id="btnNotify" src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsNotify('N',1,document.forms[0].edtCodNotify,'');"></nobr></td>
						<td class="c1">&nbsp;</td>
						<td class="c2"><nobr>
							<input name="edtCodConsignee" type="text" class="editbox" style="width: 40px;" tabindex="53" onBlur="ConsNotify('C',0,this,document.forms[0].edtNmConsignee);" maxlength="5">
							<input type="text" name="edtNmConsignee" readonly class='edtDisabled'>
							<img id="btnConsignee" src="/imagens/icones/16x16/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;" align="absmiddle" onClick="ConsNotify('C',1,document.forms[0].edtCodConsignee,'');"></nobr></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Carta de Crédito:</b></td>
						<td class="c2"><input name="rdgInCartaCredito" type="radio" id="nao8" tabindex="54" value="0">
								<label class="label" for="nao8">N&atilde;o</label>
								<input name="rdgInCartaCredito" type="radio" id="sim8" value="1">
								<label class="label" for="sim8">Sim</label></td>
						<td class="c1"><label class="label" for="notacred">Nr. Nota de Crédito:</label></td>
						<td class="c2"><input name="edtNrNotaCredito" type="text" class="editbox" id="notacred" style="width: 214px;text-transform:uppercase;" tabindex="55" onKeyUp="ApenasNumero(this,';');" maxlength="255"></td>
					</tr>
					<tr>
						<td colspan="2" class="c2"><label class="label" for="mark">Marca&ccedil;&atilde;o:</label>
								<br>
								<textarea name="txaTxMarcacao" cols="80" rows="5"  wrap="virtual" class="editbox" id="mark" style="width:365px;height:90px;text-transform:uppercase;" tabindex="56"><%= vTxMarcacao%></textarea></td>
						<td colspan="2" class="c2"><label class="label" for="instemb">Instru&ccedil;&atilde;o Geral:</label>
								<br>
								<textarea name="txaTxInstEmb" cols="80" rows="5"  wrap="virtual" class="editbox" id="instemb" style="width:365px;height:90px;text-transform:uppercase;" tabindex="57"><%= vTxInstEmb%></textarea></td>
					</tr>
				</table>
      <%
  'exibe os pedidos integrados
	if vInAntecipado then
		'lista RAP´s para exibi-las em tela
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT CD_PRODUTO, TX_DESC, "&_
					"  RTRIM(LTRIM(CD_RAP)) + '/' + RTRIM(LTRIM(CD_RAP_ANO)) AS RAP, RTRIM(LTRIM(CD_RAP)) + RTRIM(LTRIM(CD_RAP_ANO)) AS VRAP, "&_
					"  RTRIM(LTRIM(NR_PEDIDO)) AS NR_PEDIDO, RTRIM(LTRIM(NR_ITEM)) AS NR_ITEM, ISNULL(QT_FORN_PEDIDO, 0) AS QT_TOTAL, "&_
					"  ISNULL(QT_FORN_PEDIDO, 0) - ISNULL(QT_BAIXADA, 0) AS QT_RESTANTE, ISNULL(QT_BAIXADA, 0) AS QT_BAIXADA "&_
					"FROM TPE_ITEM (NOLOCK) " &_
					"WHERE ISNULL(QT_BAIXADA, 0) > 0 "&_
					"  AND ((RTRIM(LTRIM(CD_RAP)) = '"& Mid(vNrRap, 1, 6) &"' AND CD_RAP_ANO = '"& Mid(vNrRap, 7, 2) &"') OR (ISNULL(CD_RAP, '') = '')) " &_
					"ORDER BY CD_RAP_ANO DESC , CD_RAP DESC "
		'verifica o cargo do usuario
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
		'exibe os packing list dessa rap
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT COUNT(*) FROM TRAP_DOCUMENTACAO (NOLOCK) " &_
					"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' AND CD_STATUS IN ('2', '3') "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="6"><hr></td>
					</tr>
					<tr height="25">
						<td colspan="2" style="font-size:12px">Pedidos Integrados.</td>         
						<%
		if objrsx.Fields.Item(0).Value = 0 and not(vTpAcao="visualizar") then
%> 				    
						<td colspan="4" align="right">Para alterar a quantidade dos pedidos integrados, <a href="#" onClick="abreDesintegraPE('<%= vNrRap %>');">clique aqui</a>.</td>
						<% 
		else
%>
            <td colspan="4" >&nbsp;</td>
						<%
		end if
%>
					</tr>
				</table>
				<%	
		if objrs.RecordCount > 0 then
%>
				<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
					<tr height="18">
						<td class="gridtit"><nobr>Nr. Pedido</nobr></td>
						<td class="gridtit"><nobr>Item</nobr></td>
						<td class="gridtit"><nobr>Qtde. Baixada</nobr></td>
						<td class="gridtit"><nobr>Qtde. Total</nobr></td>
						<td class="gridtit"><nobr>C&oacute;d. Mercadoria</nobr></td>
						<td class="gridtit"><nobr>Descri&ccedil;&atilde;o</nobr></td>
					</tr>
					<%
			Do While Not objrs.Eof
				if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
%>
					<tr height="16" bgcolor="<%= bgcolor%>" style="text-align: center; vertical-align:top;">
						<td><nobr><%= objrs.Fields.Item("NR_PEDIDO").Value%></nobr></td>
						<td align="right"><nobr><%= objrs.Fields.Item("NR_ITEM").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("QT_BAIXADA").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("QT_TOTAL").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("CD_PRODUTO").Value%></nobr></td>
						<td align="left"><%= objrs.Fields.Item("TX_DESC").Value%></td>
					</tr>
					<%
				objrs.MoveNext
				if objrs.Eof then exit do
			loop
    
%>
				</table>
				<%
		else
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>Não existem Pedidos integrados ou os mesmos não tiveram suas quantidades definidas.</td>
					</tr>
				</table>
				<%
		end if
	end if
	
	'exibe os fornecimentos desse rap FLAVIO
	if objrs.State = adStateOpen then objrs.Close()
  sql = "SELECT F.CD_FORNECIMENTO, F.CD_MERCADORIA, VL_QTDE, TX_UNID_MEDIDA, VL_PRECO_UNIT, " &_
				"  ISNULL(NR_PROFORMA, '') AS NR_PROFORMA, ISNULL(NR_ITEM_CLIENTE, '') AS NR_ITEM_CLIENTE, "&_
        "  ISNULL(AP_MERCADORIA, '') AS NM_MERCADORIA, ISNULL(CD_NCM_SH, '') AS CD_NCM_SH, "&_
				"  ISNULL(CD_NALADI_SH, '') AS CD_NALADI_SH " &_
        "FROM TRAP_FORNECIMENTO F (NOLOCK) " &_
				"  LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = F.CD_MERCADORIA) "&_
        "WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' ORDER BY F.CD_MERCADORIA"
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	'exibe os packing list dessa rap
	if objrsx.State = adStateOpen then objrsx.Close()
  sql = "SELECT COUNT(*) FROM TRAP_PACK_VOLUME (NOLOCK) " &_
        "WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<tr height="25">
						<td style="font-size:12px">Fornecimentos Integrados.</td>
						<%
	if objrsx.Fields.Item(0).Value > 0 and not(vTpAcao="visualizar") then
%>
						<td align="right">Para visualizar os volumes integrados no packing list, <a href="#" onClick="ExibeListaPack('divPackList', 'cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>');">clique aqui</a>.</td>
						<%
	end if
%>
					</tr>
				</table>
				<%
	if objrs.RecordCount > 0 then 
%>
				<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
					<tr height="18">
						<td class="gridtit">Nr. Fornec.</td>
						<td class="gridtit">Item</td>
						<td class="gridtit">C&oacute;d. Merc.</td>
						<td class="gridtit">NCM</td>
						<td class="gridtit">NALADI</td>
						<td class="gridtit">Descri&ccedil;&atilde;o</td>
						<td class="gridtit">Unid.</td>
						<td class="gridtit">Qtde.</td>
						<td class="gridtit">Valor Un.</td>
						<td class="gridtit">Proforma</td>
						<td class="gridtit">Volumes</td>
					</tr>
					<%
		Do While Not objrs.Eof
			if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT DISTINCT CD_VOLUME FROM TRAP_PACK_LIST (NOLOCK) " &_
						"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' " &_
						"  AND CD_MERCADORIA     = '"& objrs("CD_MERCADORIA") &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			vVolume = ""
			'Response.Redirect("teste.asp?var1="&vNrRap&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")

			Do While Not objrsx.Eof
				vVolume = vVolume & Trim(objrsx.Fields.Item("CD_VOLUME").Value)
				objrsx.MoveNext 
				If objrsx.Eof Then Exit Do else vVolume = vVolume &", "
			Loop
%>
					<tr height="16" bgcolor="<%= bgcolor%>" style="text-align: center; vertical-align:top;">
						<td><nobr><%= objrs.Fields.Item("CD_FORNECIMENTO").Value%></nobr></td>
						<td align="right"><nobr><%= objrs.Fields.Item("NR_ITEM_CLIENTE").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("CD_MERCADORIA").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("CD_NCM_SH").Value%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("CD_NALADI_SH").Value%></nobr></td>
						<td align="left"><%= objrs.Fields.Item("NM_MERCADORIA").Value%></td>
						<td><nobr><%= objrs.Fields.Item("TX_UNID_MEDIDA").Value%></nobr></td>
						<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("VL_QTDE").Value, 2)%></nobr></td>
						<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("VL_PRECO_UNIT").Value, 2)%></nobr></td>
						<td><nobr><%= objrs.Fields.Item("NR_PROFORMA").Value%></nobr></td>
						<td align="left"><%= vVolume%></td>
					</tr>
					<%
			objrs.MoveNext
			if objrs.Eof then exit do
		loop
%>
				</table>
				<%
	else
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>Não existem fornecimentos integrados.</td>
					</tr>
				</table>
				<%
	end if
end if


%>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->		</td>
	</tr>
	</form>
</table>
</body>
</html>
<script language="javascript"  type="text/javascript">
<!--
function PreencheForm(vTpAcao) {
	if (vTpAcao == 'listar') {
		ExibeListaRap('divCorpo',vTpExibe,'cd_menu='+vCodMenu+'&cd_subm='+vCodSubm+'&cd_docto='+vCodDocto);
	}
	else { //preenche os campos FLAVIO
		document.frmIntegraRap.onReset;
		with (document.frmIntegraRap) {
			//campos chave	
//		if (checkSubmit == 'duplicar') {
//			edtCodRap.value    = '';
//			edtCodRapAno.value    = '';
//}
//	  else{
			vNrRap.value       = '<%= vNrRap%>'
			edtCodRap.value    = '<%= Left(vNrRap, 6)%>';
			edtCodRapAno.value    = '<%=Right(vNrRap, 2)%>';
			//outros campos
			edtCodExportador.value   = '<%= vCodExportador%>';
			edtCodFabricante.value   = '<%= vCodFabricante%>';
			edtCodCliente.value      = '<%= vCodCliente%>';
			edtCodPais.value         = '<%= vCodPais%>';
			edtCodCondPagto.value    = '<%= vCodCondPagto%>';
			edtCodAgenteComissao.value = '<%= vCodAgenteComissao%>';
			edtCodDepColeta.value    = '<%= vCodDepColeta%>';
			edtCodEmbarcador.value   = '<%= vCodEmbarcador%>';
			edtCodEmbarcacao.value   = '<%= vCodEmbarcacao%>';
			edtCodLocalEmb.value     = '<%= vCodLocalEmb%>';
			edtCodLocalDesemb.value  = '<%= vCodLocalDesemb%>';
			edtCodMoedaMLE.value     = '<%= vCodMoedaMLE%>';
			if (vTpAcao == 'duplicar') {
				edtNrFornec.value        = '<%=""%>';
				}else{
								edtNrFornec.value        = '<%= vNrFornec%>';
			}
			//edtNrCDE.value           = '<%'= vNrCDE%>';
			edtNrViagem.value        = '<%= vNrViagem%>';
			edtNrAtoDrawback.value   = '<%= vNrAtoDrawback%>';
			edtNrInspecao.value      = '<%= vNrInspecao%>';
			edtNrNotaCredito.value   = '<%= vNrNotaCredito%>';
			edtDtFaturamento.value   = '<%= vDtFaturamento%>';
			edtDtEmbarque.value      = '<%= vDtEmbarque%>';
			edtTxOrgao.value         = '<%= vTxOrgao%>';
			edtTxEmbalagem.value     = '<%= vTxEmbalagem%>';
			edtTxMotivoDesc.value    = '<%= vTxMotivoDesc%>';
			edtVlComissao.value      = '<%= FormatNumber(vVlComissao, 2)%>';
			edtVlMLE.value           = '<%= FormatNumber(vVlMLE, 2)%>';
			edtVlSeguro.value        = '<%= FormatNumber(vVlSeguro, 2)%>';
			edtVlAcrescimo.value     = '<%= FormatNumber(vVlAcrescimo, 2)%>';
			edtVlDesconto.value      = '<%= FormatNumber(vVlDesconto, 2)%>';
			edtVlFreteInt.value      = '<%= FormatNumber(vVlFreteInt, 2)%>';
			edtVlPesoBruto.value     = '<%= FormatNumber(vVlPesoBruto, 4)%>';
			edtVlPesoLiq.value       = '<%= FormatNumber(vVlPesoLiq, 4)%>';
			edtVlCubagem.value       = '<%= FormatNumber(vVlCubagem, 3)%>';
			edtVlQtdVolume.value     = '<%= FormatNumber(vVlQtdVolume, 0)%>';
			cmbCodLogomarca.value    = '<%= vCodLogomarca%>';
			cmbCodIncoterm.value     = '<%= vCodIncoterm%>';
			cmbCodViaTransp.value    = '<%= vCodViaTransp%>';
			cmbTpDrawback.value      = '<%= vTpDrawback%>';
			//radio groups
			rdgInFabrExpo[<%=FormatNumber(vInFabrExpo, 0)%>].checked = true; HabFabric(rdgInFabrExpo[<%=FormatNumber(vInFabrExpo, 0)%>]);
			rdgInTriangulacao[<%=FormatNumber(vInTriangulacao, 0)%>].checked = true;
			rdgInPermisso[<%=FormatNumber(vInPermisso, 0)%>].checked = true;
			rdgInEmbalagem[<%=FormatNumber(vInEmbalagem, 0)%>].checked = true;
			rdgInConsulado[<%=FormatNumber(vInConsulado, 0)%>].checked = true;
			rdgInPalletExpurgo[<%=FormatNumber(vInPalletExpurgo, 0)%>].checked = true;
			rdgInExpurgo[<%=FormatNumber(vInExpurgo, 0)%>].checked = true;
			rdgInInspecao[<%=FormatNumber(vInInspecao, 0)%>].checked = true;
			rdgInCartaCredito[<%=FormatNumber(vInCartaCredito, 0)%>].checked = true;
			rdgInCadivi[<%=FormatNumber(vInCadivi, 0)%>].checked = true;
			rdgInAmostra[<%=FormatNumber(vInAmostra, 0)%>].checked = true;
			rdgInAntecipado[<%=FormatNumber(vInAntecipado, 0)%>].checked = true;
			//forma de pagto comissão
			var vCodFormaPagar = '<%= vCodFormaPagar%>';
			if (vCodFormaPagar != '3') rdgCodFormaPagar[vCodFormaPagar].checked = true;
			//simula a entrada no campo de código para executar a busca
		  if (edtCodRap.value    != '') edtCodRap.focus();
			if (edtCodExportador.value  != '') edtCodExportador.focus();
			if (edtCodCliente.value     != '') edtCodCliente.focus();
			if (edtCodFabricante.value  != '' && rdgInFabrExpo == '0') edtCodFabricante.focus();
			if (edtCodPais.value        != '') edtCodPais.focus();
			if (edtCodCondPagto.value   != '') edtCodCondPagto.focus();
			if (edtCodAgenteComissao.value != '') edtCodAgenteComissao.focus();
			if (edtCodDepColeta.value   != '') edtCodDepColeta.focus();
			if (edtCodEmbarcador.value  != '') edtCodEmbarcador.focus();
			if (edtCodEmbarcacao.value  != '') edtCodEmbarcacao.focus();
			if (edtCodLocalEmb.value    != '') edtCodLocalEmb.focus();
			if (edtCodLocalDesemb.value != '') edtCodLocalDesemb.focus();
			if (edtCodMoedaMLE.value    != '') edtCodMoedaMLE.focus();
			cmbTpNotify.value     = '<%= vTpNotify%>';
			cmbTpConsignee.value  = '<%= vTpConsignee%>';
			edtCodNotify.value    = '<%= vCodNotify%>';
			edtCodConsignee.value = '<%= vCodConsignee%>';
			MudaDrawback(cmbTpDrawback);
			HabNotifyConsignee(cmbTpNotify,edtCodNotify);
			HabNotifyConsignee(cmbTpConsignee,edtCodConsignee);
			//if (edtCodNotify.value != '') edtCodNotify.focus();
			//if (edtCodConsignee.value != '') edtCodConsignee.focus();
			//alert('Function preenche campos')

			//edtCodRap.focus();

		}
		Calendar.setup({inputField:"edtDtFaturamento",button:"btnDtFaturamento"});
		Calendar.setup({inputField:"edtDtEmbarque",button:"btnDtEmbarque"});
	}
}
//}
//function ZeraNrInstr(checkSubmit) {
//if (checkSubmit=='duplicar') {
	////	vedtCodRap.value    = '';
		//vedtCodRapAno.value    = '';
//}
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->