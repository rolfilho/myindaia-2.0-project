<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%Server.ScriptTimeout = 9999

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
Dim sql9
Dim rap_selec
dim vedtCodRap : vedtCodRap = Trim(Request("vedtCodRap"))
dim vedtCodRapAno : vedtCodRapAno = Trim(Request("vedtCodRapAno"))
dim vTpAcao : vTpAcao = Trim(Request("vTpAcao"))
dim vTpExibe : vTpExibe = Trim(Request("vTpExibe"))
dim vNrRap : vNrRap = Trim(Request("vNrRap"))
dim vInTestarRap : vInTestarRap = true
dim vInEmissao : vInEmissao = true
dim vMostrarTxt, vMostrarRemessa, vMostrarXls, vVolume, vValida
dim vInRap, vInRapDocto, vInForn, vInPack, vTxValida, vTpStatus, vDtStatus, vHrStatus, vUsStatus, vInRemessa, vTpStatus2
'variáveis auxiliares no SQL e tela de inserção do RAP
dim vCodExportador, vCodLogomarca, vCodFabricante, vCodCliente, vCodPais, vCodCondPagto, vTpDrawback, vCodAgenteComissao
dim vCodIncoterm, vCodDepColeta, vCodDepColeta1, vCodLocalColeta, vCodTerminal, vCodViaTransp, vCodEmbarcador, vCodEmbarcacao, vCodLocalEmb
dim vCodLocalDesemb, vCodNotify, vCodConsignee, vCodBanco, vNrCDE, vNrFornec, vNrVoo, vNrAtoDrawback, vNrInspecao, vNrNotaCredito
dim vNrNotasFiscais, vNrEasy, vNrCaixas, vNrPacotes, vNrJumbos, vNrPallets, vNrBigBags, vNrBigBagsPallets
dim vInFabrExpo, vInTriangulacao, vInPermisso, vInEmbalagem, vInConsulado, vInPalletExpurgo, vInExpurgo, vInInspecao, vInSemPackList
dim vInCartaCredito, vDtFaturamento, vDtEmbarque, vDtInspecao, vDtDeadLineDraft, vDtDeadLineCarga, vDtRecebido, vDtFechado
dim vDtPrevSaida, vTpNotify, vTpConsignee, vTxOrgao, vTxLocalInspecao, vTxMarcacao, vTxInstEmb, vVlComissao, vVlMLE
dim vVlSeguro, vVlAcrescimo, vVlDesconto, vCodFormaPagar, vCodMoedaMLE, vNrViagem, vInCadivi, vTxLocalExpurgo, vVlFreteInt
dim vVlPesoBruto, vVlPesoLiq, vVlCubagem, vTxEmbalagem, vInAmostra, vInAntecipado, vTxMotivoDesc, vVlQtdVolume,vInCourrier
dim checkrap,chkCodViaTransp
dim edtTxEmbalagem, vNrProcessoRap
Dim vCodExportador2, vCodFabricante2, vCodCliente2, vCodUsuario, vCodDepColeta2,vInFornecimento, vInPackList, vInModoSimples, vInModoSimplesCheck, vInModoSimplesFlag, vGrupo, vInRapSequencial, vNrRap_2		
if not fnc_TestaVar(vTpAcao) then vTpAcao = "listar"
if not fnc_TestaVar(vTpExibe) then vTpExibe = 1
in_show = 0
dim vEmail
dim vInEmail
dim rap_modelo_selec, in_dt_faturamento
dim vInRapAux, vInFornAux, vInPackAux, vInDtFaturamentoAux, vInSemPackListAux, contador_titulo
Dim vInEnviaArquivos, vInMostraFaturados, vInDivideEmbarcados, vInMostraFollowup, vInConferencia, vProcessoRap
'FLAVIO
vCodStatus = ""
	if objrsx.State = adStateOpen then objrsx.Close()						
	sql = "SELECT IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, DT_FATURAMENTO, CD_STATUS, IN_SEM_PACK_LIST "&_
		 " FROM TRAP R (NOLOCK) "&_
		 " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
		 " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then
  		vInRapAux           = objrsx.Fields.Item("IN_RAP_VALIDA").Value
		vInFornAux          = objrsx.Fields.Item("IN_FORN_VALIDA").Value
		vInPackAux          = objrsx.Fields.Item("IN_PACK_VALIDA").Value
		vInDtFaturamentoAux = objrsx.Fields.Item("DT_FATURAMENTO").Value
        vInSemPackListAux   = objrsx.Fields.Item("IN_SEM_PACK_LIST").Value
        vCodStatus          = objrsx.Fields.Item("CD_STATUS").Value
		
		If session("GrupoUsuario") = "241" Then
			Session("rap_valida"&vNrRap) = (vInRapAux and vInFornAux and vInPackAux and fnc_TestaVar(vInDtFaturamentoAux))
		Else
			Session("rap_valida"&vNrRap) = (vInRapAux and vInFornAux and (vInPackAux or vInSemPackListAux))
		End If
	Else
		Session("rap_valida"&vNrRap) = false
	End If			
				

'Response.write Session("rap_valida"&vNrRap) 
'Response.end

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

function fncSelecionaLogo(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	if session("GrupoUsuario") = "241" Then
		nTipo = "241"
	End If
	select case CInt(nTipo)
		case 0 vReturn = "logo_sg0.jpg"
		case 1 vReturn = "logo_sg1.jpg"
		case 2 vReturn = "logo_sg2.jpg"
		case 3 vReturn = "logo_sg3.jpg"
		case 241 vReturn = "logo_cebrace.jpg"
		case else vReturn = "logo_no.jpg"
	end select
	fncSelecionaLogo = vReturn
end function

function fncExibeForma(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case nTipo
		case 0 vReturn = " Gr&aacute;fica"
		case 1 vReturn = " A Remeter"
		case else vReturn = ""
	end select
	fncExibeForma = vReturn
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
					 sql = "SELECT CD_RAP FROM TRAP (NOLOCK) "&_
					 " WHERE CD_RAP+CD_RAP_ANO = '"&vedtCodRap2&vedtCodRapAno&"'"&_
					 " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
					
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
							vCodDepColeta1   = Request.Form("edtNmDepColeta1")
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
                            vNrNotasFiscais  = UCase(Request.Form("edtNrNotasFiscais"))
                            vNrEasy          = UCase(Request.Form("edtNrEasy"))
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
                            vInSemPackList   = Request.Form("rdgInSemPackList")
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
							vInCourrier      = Request.Form("cmbinCourrier")
                            	
                            vNrCaixas        = Request.Form("edtNrCaixas")
                            vNrPallets       = Request.Form("edtNrPallets")
                            vNrJumbos        = Request.Form("edtNrJumbos")
                            vNrPacotes       = Request.Form("edtNrPacotes")
                            vNrBigBags       = Request.Form("edtNrBigBags")
                            vNrBigBagsPallets = Request.Form("edtNrBigBagsPallets")

							if vInCourrier = "" then
							vInCourrier = 0
							end if

							'testa as variaveis
							'if Trim(vNrCDE) = "/" then vNrCDE = ""
							if Right(vNrFornec, 1) = ";" then 
							vNrFornec = Left(vNrFornec, Len(vNrFornec)-1) 
							end if 

                            if Right(vNrNotasFiscais, 1) = ";" then 
							vNrNotasFiscais = Left(vNrNotasFiscais, Len(vNrNotasFiscais)-1) 
							end if 

                            if Right(vNrEasy, 1) = ";" then 
							vNrEasy = Left(vNrEasy, Len(vNrEasy)-1) 
							end if 
							
							if InStr(vNrViagem, "/") > 0 then 
							vNrViagem = Trim(Replace(vNrViagem,"/","")) 
							end if
							'response.Redirect("teste.asp?var="&vIncourrier)
                            
							If Session("InModoSimples") <> "1" Then
							vInCadivi        = 0
							sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, IN_COURRIER, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST, IN_MODELO ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap2,0)&",6), "&fncValSQL(vedtCodRapAno,0)&",'" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&","&fncValSQL(vCodDepColeta1, 2)&" , "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec,2)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&vInCourrier&", "&fncValSQL(vVlQtdVolume, 3) & ", "& fncValSQL(vNrNotasFiscais,2) & ", "& fncValSQL(vNrEasy,2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3)& ", "& fncValSQL(vNrBigBags,3) & ", "& fncValSQL(vNrBigBagsPallets,3) &","& vInSemPackList
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
                            vInSemPackList   = 0
                            
													sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, IN_COURRIER, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST, IN_MODELO ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap2,0)&",6), "&fncValSQL(vedtCodRapAno,0)&", " & Trim(Session("GrupoUsuario")) & ", CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodDepColeta1, 2)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec,2)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&vInCourrier&", "&fncValSQL(vVlQtdVolume, 3) & ", "& fncValSQL(vNrNotasFiscais,2) & ", "& fncValSQL(vNrEasy,2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3)& ", "& fncValSQL(vNrBigBags,3) & ", "& fncValSQL(vNrBigBagsPallets,3) & ", " & vInSemPackList
													End If
								If Request("vInModelo") = 1  or Right(vNrRap,2) = "MD" Then
								sql =  sql &",'1')"
							Else
								sql =  sql &",'0')"
							End If					
                            
                            	
															vNrRap=vedtCodRap2&vedtCodRapAno
					'testavar(vedtCodRapAno)
					
										Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
										objcnn.Execute(sql)
										
										If (Session("InMostraFollowup") = "1" or vInMostraFollowup = "1") and  vedtCodRapAno <> "MD"  Then				
						sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
							  " (RIGHT('000000' + "&fncValSQL(vedtCodRap2,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2),'"&Session("GrupoUsuario")&"','001', GETDATE(),'"&Session("cd_usuario")&"')	"
						objcnn.Execute(sql)	  
						End If	
																			
										
			If Session("cargo_interno") = "1" Then							
				if objrsx.State = adStateOpen then objrsx.Close()						
				sql = " SELECT G.EMAIL_CRIACAO AS EMAIL, G.IN_EMAIL_CRIACAO AS IN_EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, "&_
				" G.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  G.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, G.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, G.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, G.IN_CONFERENCIA AS IN_CONFERENCIA "&_
				"FROM TEMPRESA_NAC E (NOLOCK)" &_
				" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
				" WHERE E.CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				if objrsx.RecordCount > 0 then
					 vInEmail = objrsx.Fields.Item("IN_EMAIL").Value
					 vEmail = objrsx.Fields.Item("EMAIL").Value
					 vInFornecimento = objrsx.Fields.Item("IN_FORNECIMENTO").Value
					 vInPackList = objrsx.Fields.Item("IN_PACKING_LIST").Value
					 vInEnviaArquivos    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value
					 vInMostraFaturados  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
					 vInDivideEmbarcados = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
					 vInMostraFollowup   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
					 vInConferencia      = objrsx.Fields.Item("IN_CONFERENCIA").Value
				else
					 vEmail = "myindaia@myindaia.com.br"
				end if					
			End If
	
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "select NM_USUARIO as usuario from tusuario WHERE CD_USUARIO='" & Session("cd_usuario")& "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
			if objrsx.RecordCount > 0 then
				 vCodUsuario = objrsx.Fields.Item("usuario").Value
			else
				 vCodUsuario = "&nbsp;"
			end if
	
			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodExportador2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodExportador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodFabricante) & "'"'fabricante
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodFabricante2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodFabricante = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodCliente) & "'"'cliente
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCliente2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodCliente = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_PAIS) AS PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = '" & Trim(vCodPais) & "'"'pais
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodPais = objrsx.Fields.Item("PAIS").Value
			else
				 vCodPais = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_TERMO_PAGTO) AS TERMO FROM TTERMO_PAGTO (NOLOCK) WHERE CD_TERMO_PAGTO = '" & Trim(vCodCondPagto) & "'"'termo_pagto
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCondPagto = objrsx.Fields.Item("TERMO").Value
			else
				 vCodCondPagto = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodAgenteComissao) & "'" 'agentecomissao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodAgenteComissao = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodAgenteComissao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_VIA_TRANSPORTE) AS TRANSP FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = '" & Trim(vCodViaTransp) & "'"'nmviatransporte
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodViaTransp = objrsx.Fields.Item("TRANSP").Value
			else
				 vCodViaTransp = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_AGENTE) AS AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE ='" & Trim(vCodEmbarcador) & "'"'embarcador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcador = objrsx.Fields.Item("AGENTE").Value
			else
				 vCodEmbarcador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMBARCACAO) AS EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = '" & Trim(vCodEmbarcacao) & "'"'nmembarcacao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcacao = objrsx.Fields.Item("EMBARCACAO").Value
			else
				 vCodEmbarcacao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalEmb) & "'"'localorigem
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalEmb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalEmb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalDesemb) & "'"'localdestino
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalDesemb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalDesemb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_MOEDA) AS MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = '" & Trim(vCodMoedaMLE) & "'"'moeda_mle
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodMoedaMLE = objrsx.Fields.Item("MOEDA").Value
			else
				 vCodMoedaMLE = "&nbsp;"
			end if		
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) as empresa FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & vCodDepColeta & "'"'coleta		
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodDepColeta2 = objrsx.Fields.Item("empresa").Value
			else
				 vCodDepColeta = "&nbsp;"
			end if		
			
			If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then	
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) WHERE CD_RAP = '" & Left(vNrRap,6) & "' AND CD_RAP_ANO = '" & Right(vNrRap,2) & "' AND CD_GRUPO ='" & Session("GrupoUsuario") & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
				if objrsx.RecordCount > 0 then
					 vProcessoRap = objrsx.Fields.Item("NR_FORNECIMENTO").Value
				else
					 vProcessoRap = "&nbsp;"
				end if		
			End If					

If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then										
corpo = "<style type='text/css'>"
corpo = corpo & "body {"
corpo = corpo &	"font-family: Verdana, Arial, Helvetica;"
corpo = corpo &	"color: #000000;"
corpo = corpo &	"background-color: #FFFFFF;"
corpo = corpo &	"margin: 0px;"
corpo = corpo &	"padding: 0px;"
corpo = corpo &	"font-size: 8px;"
corpo = corpo & "}"
corpo = corpo & "fieldset {"
corpo = corpo & "	border: #CCCCCC 1px solid;"
corpo = corpo & "	height: 100%;"
corpo = corpo & "	width: 99%;"
corpo = corpo & "	padding: 5px;"
corpo = corpo & "}"
corpo = corpo & "legend {"
corpo = corpo & "	font-weight:bold;"
corpo = corpo & "}"
corpo = corpo & ".c1 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 0px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".c2 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 1px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".titulo {"
corpo = corpo &	"font-size: 12px;"
corpo = corpo &	"font-weight: bold;"
corpo = corpo &	"text-align: center;"
corpo = corpo & "}"
corpo = corpo & ".pgridsub {"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & ".pgridtit {"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-weight: bold;"
corpo = corpo & "	text-align: center;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & "</style>"
corpo = corpo & "<table width='670' border='0' cellspacing='1' cellpadding='0' style='padding: 0px 1px 0px 1px;'>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='5'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td colspan = '4' style='font-size: 12px;'><b>O processo abaixo acaba de ser criado. Acesse o myIndaiáWeb para visualizá-lo.</b><br><br></td>"
corpo = corpo &	"		</tr>"
End If
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(vCodLogomarca) & "'></td>"
If Session("InRapSequencial")<>"1" Then
corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & Left(Trim(vnrrap),6) & "/" & Right(Trim(vnrrap),2) & "</b></td>"
	Else
corpo = corpo &	"			<td colspan='2' class='titulo'><b>" & vProcessoRap & "</b></td>"
	End If	
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td style='font-size: 10px;'>" & vCodExportador2 & "<b><br>"
corpo = corpo &	"			</b></td>"
corpo = corpo &	"			<td align='right' style='font-size: 10px;'>Abertura: " & Date() &"<br>"
corpo = corpo &	"			Analista: " & vCodUsuario & " &nbsp;<br>"
corpo = corpo &	"				<br>"
corpo = corpo &	"				 "&  vTpStatus&" "&vDtStatus&" "&Left(vHrStatus, 5)& "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"	</table></td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='1'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='220px'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='240px'>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Amostra?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAmostra) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Antecipado?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAntecipado) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1' colspan='2'><b>Sem Integração de Packing List?</b></td>"
corpo = corpo &	"			<td class='c2' colspan='2'>" & sim_nao(vInSemPackList) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
   End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cliente:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCliente & " - " & vCodCliente2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Fabricante:</b></td>"
		If sim_nao(vInFabrExpo)= "Sim" Then 
corpo = corpo &	"<td class='c2'>" & vCodExportador & " - " & vCodExportador2 & "&nbsp;</td>"
		Else
corpo = corpo & "<td class='c2'>" & vCodFabricante & " - " & vCodFabricante2 & "&nbsp;</td>"
		End if			
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Fabr. &eacute; o Exportador?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInFabrExpo)& "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Dt. Faturamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtFaturamento, 5) & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
	End If

    If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b><nobr>Notas Fiscais:</nobr></b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrNotasFiscais),";","; ") & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Easy:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrEasy),";","; ") & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
	End If

corpo = corpo &	"		<tr height="& vl_heigth & ">"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"			<td class='c1'><b>Processo:</b></td>"
Else
corpo = corpo &	"			<td class='c1'><b>Nr. Fornecimento:</b></td>"
End If
	
corpo = corpo &	"			<td colspan='3' class='c2'>" & Replace(Trim(vNrFornec),";","; ") & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td class='c1'><b>Pa&iacute;s de Destino:</b></td>"
corpo = corpo &	"		  <td class='c2'>" & vCodPais & "&nbsp;</td>"
corpo = corpo &	"		  <td class='c1'>&nbsp;</td>"
corpo = corpo &	"		  <td class='c2'>&nbsp;</td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Dt. Acordada de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtEmbarque, 5) & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Drawback:</b></td>"
								str = vTpDrawback
								if fnc_TestaVar(str) then str = tipo_drawback(str) else str = ""
corpo = corpo & 	"<td class='c2'>" &	str & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr Ato Concessório:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrAtoDrawback & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Permisso?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInPermisso) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Processo com triangulação?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInTriangulacao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Consulado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInConsulado) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInEmbalagem) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Pallet Expurgado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInPalletExpurgo) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Certificado de Expurgo?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInExpurgo) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Inspe&ccedil;&atilde;o?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInInspecao) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Inspeção:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrInspecao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Trim(vTxOrgao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Incoterm:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodIncoterm & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Condi&ccedil;&atilde;o de Pagamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCondPagto & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor FOB: </b></td>"
	If fnc_testaVar(vVlMLE) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlMLE, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodMoedaMLE & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
	If fnc_testaVar(vVlAcrescimo) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlAcrescimo, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Desconto:</b></td>"
	End If
	If fnc_TestaVar(vVlDesconto) Then 
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlDesconto, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If	
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Motivo Desconto:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vTxMotivoDesc & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth &">"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Frete:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Frete:</b></td>"	
	End If
	If fnc_TestaVar(vVlFreteInt) Then
corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlFreteInt, 2) & "&nbsp;</td>"
	Else
	corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then			
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
	If fnc_TestaVar(vVlPesoBruto) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoBruto, 4)& "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	If fnc_TestaVar(vVlSeguro) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlSeguro, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
	If fnc_TestaVar(vVlPesoLiq) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoLiq, 4) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
	If fnc_TestaVar(vVlCubagem) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlCubagem, 3) & " m³ </td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"		
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrCaixas & " Cx(s);" & vNrPallets & " Pallet(s);" & vNrPacotes & " Pct(s); " & vNrJumbos & " Jumbo(s) " & vNrBigBags & " Big Bag(s); " & vNrBigBagsPallets & " Big Bag(s) Pallet(s);&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vVlQtdVolume & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
	if fnc_TestaVar(vVlComissao) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlComissao, 2)&"%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodAgenteComissao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodDepColeta & " - " &  vCodDepColeta2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Dep. Coleta Transp.:</b></td>"
corpo = corpo &	"			<td class='c2'>" &  vCodDepColeta1 & "</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height="&  vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Via de Transporte:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodViaTransp & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Embarcador:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodEmbarcador & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Navio:</b></td>"
corpo = corpo &	"			<td class='c2'colspan = '3'>" &  vCodEmbarcacao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Local de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalEmb & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'><b>Local de Desembarque:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalDesemb & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Notify:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>"& vCodNotify & " - " & fncTipoPessoaExp(vCodNotify, vTpNotify) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Consignee:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodConsignee & " - " & fncTipoPessoaExp(vCodConsignee, vTpConsignee) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Carta de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInCartaCredito) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Nota de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vNrNotaCredito & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td colspan='8' class='c1'><fieldset><legend>Instru&ccedil;&atilde;o Geral:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxInstEmb), vbcrlf, "<br>") & "</fieldset> </td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr>		"
corpo = corpo &	"			<td colspan='8' class='c2'><fieldset><legend>Marca&ccedil;&atilde;o:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxMarcacao), vbcrlf, "<br>") & "</fieldset></td>"
corpo = corpo & "		</tr>"
	End If
corpo = corpo &	"	</table>"

		If (session("EmailCriacao")="1" or vInEmail="1") and vCodExportador <> "" Then
			Set objEmail = CreateObject("CDO.Message")
			objEmail.From 		= "ti@myindaia.com.br" 
			If session("EmailCriacaoEmail") <> "" Then
				objEmail.To 		= session("EmailCriacaoEmail")
			Else
				objEmail.To 		= vEmail
			End If
			objEmail.CC 		= ""
			
			If Session("GrupoUsuario")="241" Then
				objEmail.Subject = "[myIndaiáWeb] Novo Processo Criado - Processo: "& vProcessoRap
			Else
				objEmail.Subject = "[myIndaiáWeb] Novo Embarque Criado - RAP: "& Left(Trim(vnrrap),6) & "/" & Right(Trim(vnrrap),2)
			End If
	
			objEmail.MIMEFormatted = true
			objEmail.HTMLBody  	= corpo
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "email-smtp.us-east-1.amazonaws.com"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "AKIAIXMINU4FHLKYYA4Q"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
			objEmail.Configuration.Fields.Update
			if SQLSERVER <> "ANTUERPIA" Then
              objEmail.Send
            End If
			set objEmail = nothing
	    End If	
End If				'Response.Redirect("cadastro.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=listar")
			end if 
		end if
end if
'******************************fim  duplicar ****************************************
'*******************************************************************************************************************************
'Response.write Request("flag_autorizada")
'Response.end

if (vTpAcao = "salva_modelo")  Then
if (Request.Form <> "") then
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
			vCodDepColeta1   = Request.Form("edtNmDepColeta1")
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
            vNrNotasFiscais  = UCase(Request.Form("edtNrNotasFiscais"))
            vNrEasy          = UCase(Request.Form("vNrEasy"))
	'		vNrCDE           = UCase(Request.Form("edtNrCDE"))
			vNrViagem        = UCase(Request.Form("edtNrViagem"))
			vNrAtoDrawback   = UCase(Request.Form("edtNrAtoDrawback"))
			vNrInspecao      = UCase(Request.Form("edtNrInspecao"))
			vNrNotaCredito   = UCase(Request.Form("edtNrNotaCredito"))
			vInCourrier      = Request.Form("cmbinCourrier")
			vInFabrExpo      = Request.Form("rdgInFabrExpo")
			vInTriangulacao  = Request.Form("rdgInTriangulacao")
			vInPermisso      = Request.Form("rdgInPermisso")
			vInEmbalagem     = Request.Form("rdgInEmbalagem")
			vInConsulado     = Request.Form("rdgInConsulado")
			vInPalletExpurgo = Request.Form("rdgInPalletExpurgo")
			vInExpurgo       = Request.Form("rdgInExpurgo")
			vInInspecao      = Request.Form("rdgInInspecao")
            vInSemPackList   = Request.Form("rdgInSemPackList")
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
			vCodExportador   = Request.Form("edtCodExportador")
			vCodLogomarca    = Request.Form("cmbCodLogomarca")
			vCodFabricante   = Request.Form("edtCodFabricante")
			vCodCliente      = Request.Form("edtCodCliente")
			vCodPais         = Request.Form("edtCodPais")
			vCodCondPagto    = Request.Form("edtCodCondPagto")
			vCodAgenteComissao = Request.Form("edtCodAgenteComissao")
			vCodIncoterm     = Request.Form("cmbCodIncoterm")
			vCodDepColeta    = Request.Form("edtCodDepColeta")
			vCodDepColeta1   = Request.Form("edtNmDepColeta1")
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
			vInCourrier      = Request.Form("cmbinCourrier")
			vInFabrExpo      = Request.Form("rdgInFabrExpo")
			vInTriangulacao  = Request.Form("rdgInTriangulacao")
			vInPermisso      = Request.Form("rdgInPermisso")
			vInEmbalagem     = Request.Form("rdgInEmbalagem")
			vInConsulado     = Request.Form("rdgInConsulado")
			vInPalletExpurgo = Request.Form("rdgInPalletExpurgo")
			vInExpurgo       = Request.Form("rdgInExpurgo")
			vInInspecao      = Request.Form("rdgInInspecao")
            vInSemPackList   = Request.Form("rdgInSemPackList")
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

            vNrCaixas        = Request.Form("edtNrCaixas")
            vNrPallets       = Request.Form("edtNrPallets")
            vNrJumbos        = Request.Form("edtNrJumbos")
            vNrPacotes       = Request.Form("edtNrPacotes")
            vNrBigBags       = Request.Form("edtNrBigBags")
            vNrBigBagsPallets = Request.Form("edtNrBigBagsPallets")
Else

End If			

	
	If Session("InModoSimples") <> "1" Then		
										vInCadivi        = 0
										sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodDepColeta1, 2)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&", "&fncValSQL(vNrNotasFiscais, 2)&", "&fncValSQL(vNrEasy, 2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3) & ", "& fncValSQL(vNrBigBags,3)& ", "& fncValSQL(vNrBigBagsPallets,3) & ", " & vInSemPackList &" )"
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
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&","&fncValSQL(vCodDepColeta1, 2)&",  "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&", "&fncValSQL(vNrNotasFiscais, 2)&", "&fncValSQL(vNrEasy, 2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3) & ", "& fncValSQL(vNrBigBags,3)& ", "& fncValSQL(vNrBigBagsPallets,3) & ", " & vInSemPackList &" )"
							End If												
													Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
													objcnn.Execute(sql)
End if

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
			vCodDepColeta1   = Request.Form("edtNmDepColeta1")
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
			vInCourrier      = Request.Form("cmbinCourrier")
			vInFabrExpo      = Request.Form("rdgInFabrExpo")
			vInTriangulacao  = Request.Form("rdgInTriangulacao")
			vInPermisso      = Request.Form("rdgInPermisso")
			vInEmbalagem     = Request.Form("rdgInEmbalagem")
			vInConsulado     = Request.Form("rdgInConsulado")
			vInPalletExpurgo = Request.Form("rdgInPalletExpurgo")
			vInExpurgo       = Request.Form("rdgInExpurgo")
			vInInspecao      = Request.Form("rdgInInspecao")
            vInSemPackList   = Request.Form("rdgInSemPackList")
			vInCartaCredito  = Request.Form("rdgInCartaCredito")
			vInCadivi        = Request.Form("rdgInCadivi")
			vInAmostra       = Request.Form("rdgInAmostra")
			vInAntecipado    = Request.Form("rdgInAntecipado")
			vDtFaturamento   = Request.Form("edtDtFaturamento")			
			vDtInspecao      = Request.Form("edtDtInspecao")
			vTpDrawback      = Request.Form("cmbTpDrawback")
			vTpNotify        = Request.Form("cmbTpNotify")
			vTpConsignee     = Request.Form("cmbTpConsignee")
			vTxOrgao         = UCase(Request.Form("edtTxOrgao"))		
			vTxInstEmb       = UCase(Request.Form("txaTxInstEmb"))
			vVlComissao      = Request.Form("edtVlComissao")
			vVlMLE           = Request.Form("edtVlMLE")
			vVlSeguro        = Request.Form("edtVlSeguro")
			vVlAcrescimo     = Request.Form("edtVlAcrescimo")
			vVlDesconto      = Request.Form("edtVlDesconto")
			vVlFreteInt      = Request.Form("edtVlFreteInt")
			
            If Session("InModoSimples") <> "1" Then 				
				vTxMotivoDesc     = UCase(Request.Form("edtTxMotivoDesc"))
				vNrNotaCredito    = UCase(Request.Form("edtNrNotaCredito"))			
				vDtEmbarque       = Request.Form("edtDtEmbarque")
				vVlPesoBruto      = Request.Form("edtVlPesoBruto")
				vVlPesoLiq        = Request.Form("edtVlPesoLiq")
				vVlCubagem        = Request.Form("edtVlCubagem")	
				vVlQtdVolume      = Request.Form("edtVlQtdVolume")	
				vTxEmbalagem      = UCase(Request.Form("edtTxEmbalagem"))
				vTxMarcacao       = UCase(Request.Form("txaTxMarcacao"))		
				vNrNotasFiscais   = UCase(Request.Form("edtNrNotasFiscais"))
				vNrEasy           = UCase(Request.Form("edtNrEasy"))
				vNrCaixas         = Request.Form("edtNrCaixas")
				vNrPallets        = Request.Form("edtNrPallets")
				vNrJumbos         = Request.Form("edtNrJumbos")
				vNrPacotes        = Request.Form("edtNrPacotes")
				vNrBigBags        = Request.Form("edtNrBigBags")
				vNrBigBagsPallets = Request.Form("edtNrBigBagsPallets")					
            end if
			
			'testa as variaveis
			if Trim(vNrCDE) = "/" then vNrCDE = ""
			if Right(vNrFornec, 1) = ";" then vNrFornec = Left(vNrFornec, Len(vNrFornec)-1)

            if Right(vNrFornec, 1) = ";" then vNrFornec = Left(vNrFornec, Len(vNrFornec)-1)
            if Right(vNrNotasFiscais, 1) = ";" then vNrNotasFiscais = Left(vNrNotasFiscais, Len(vNrNotasFiscais)-1)
            if Right(vNrEasy, 1) = ";" then vNrEasy = Left(vNrEasy, Len(vNrEasy)-1)
			
            if InStr(vNrViagem, "/") > 0 then vNrViagem = Trim(Replace(vNrViagem,"/",""))
			'verifica se já existe a RAP FLAVIO 
			if objrs.State = adStateOpen then objrs.Close()
			sql = "SELECT COUNT(*) "&_
		          " FROM TRAP (NOLOCK)"&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

			if objrs.Fields.Item(0).Value > 0 then ' SE EXISTIR
					if objrsx.State = adStateOpen then objrsx.Close()
					sql = "SELECT IN_AMOSTRA, RTRIM(LTRIM(ISNULL(NR_FORNECIMENTO, ''))) AS NR_FORNECIMENTO, ISNULL(CD_INCOTERM, '') AS CD_INCOTERM, "&_
								"  ISNULL(CD_MOEDA_MLE, '') AS CD_MOEDA_MLE, ISNULL(CD_TERMO_PAGTO, '') AS CD_TERMO_PAGTO, "&_
								"  VL_MLE, VL_PESO_LIQ, VL_PESO_BRUTO, VL_CUBAGEM, VL_QTD_VOL, VL_DESCONTO, NR_NOTA_CREDITO, TX_MOTIVO_DESC "&_
								" FROM TRAP (NOLOCK)"&_
								" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
								" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText					
					'verifica se ocorreu alteração nos valores de validação da rap
'Response.Redirect("teste.asp?var1="&FormatNumber(isnull(vVlCubagem), 2)&"")

							'vCodEmbarcacao   = objrs.Fields.Item("CD_EMBARCACAO").Value
							'vNrNotaCredito   = Trim(objrs.Fields.Item("NR_NOTA_CREDITO").Value)
							'vDtFaturamento   = fnc_Mascara(objrs.Fields.Item("DT_FATURAMENTO").Value, 5)
							'vDtEmbarque      = fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)
							'vTxEmbalagem     = Trim(objrs.Fields.Item("TX_EMBALAGEM").Value)
							'vTxMotivoDesc    = Trim(objrs.Fields.Item("TX_MOTIVO_DESC").Value)
							'vVlMLE           = objrsx.Fields.Item("VL_MLE").Value
							'vVlPesoBruto     = objrsx.Fields.Item("VL_PESO_BRUTO").Value
							'vVlPesoLiq       = objrsx.Fields.Item("VL_PESO_LIQ").Value
							'vVlCubagem       = objrsx.Fields.Item("VL_CUBAGEM").Value
							'vVlQtdVolume     = objrsx.Fields.Item("VL_QTD_VOL").Value

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
						" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
						" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
						
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						 if (vTpAcao<>"duplicar") then 
								 objcnn.Execute(sql)
						 end if
						vInTestarRap = true
						'FLAVIO 
						'se os fornecimentos foram alterados, apaga os que não existirem
						if objrsx.Fields.Item("NR_FORNECIMENTO").Value <> vNrFornec and (vTpAcao<>"duplicar") then
							sql = "DELETE TRAP_FORNECIMENTO "&_
										"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
										"  AND CD_FORNECIMENTO NOT IN ('"&Replace(vNrFornec,";","','")&"')"
							Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
							objcnn.Execute(sql)
						end if
				end if
				
				if objrsx.State = adStateOpen then objrsx.Close()
				'atualiza a tabela de RAP com os dados editados na tela
				if (vTpAcao = "editar") or (vTpAcao = "salvar") or (vTpAcao = "visualizar") then
				if vInCourrier="" then vInCourrier=0 else vInCourrier=1
             	If  vCodViaTransp<>04 and vInCourrier=1 then%>
					<script>alert('A opção de Courrier somente poderá ser marcada quando Via de Transporte aérea.Por favor corrija e tente novamente. ');</script>
				<%else				'response.Redirect("teste.asp?var="&vCodViaTransp)

				'MUDANÇA - 22/12/2008 - NAO DEIXA INSERIR AS ALTERAÇÕES NA RAP QUE FOI DUPLICADA.
				sql= "SELECT CD_RAP "&_				
	              " FROM TRAP (NOLOCK)"&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vedtCodRap2&vedtCodRapAno&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
			    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				if objrsx.eof  then	
				'FIM DA MUDANÇA	
				
				'if vInCourrier ="" then
				'vInCourrier = 0
				'end if	
				If Session("InModoSimples")<>"1" Then
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
							"  NM_DEP_COLETA_1   = "&fncValSQL(vCodDepColeta1, 2)&", "&_
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
                            "  NR_NOTAS_FISCAIS  = "&fncValSQL(vNrNotasFiscais, 0)&", "&_
                            "  NR_EASY           = "&fncValSQL(vNrEasy, 0)&", "&_
							"  NR_CDE            = "&fncValSQL(vNrCDE, 0)&", "&_
							"  NR_VOO            = "&fncValSQL(vNrVoo, 0)&", "&_
							"  NR_VIAGEM         = "&fncValSQL(vNrViagem, 0)&", "&_
							"  NR_ATO_CONCESSORIO = "&fncValSQL(vNrAtoDrawback, 0)&", "&_
							"  NR_INSPECAO       = "&fncValSQL(vNrInspecao, 0)&", "&_
							"  NR_NOTA_CREDITO   = "&fncValSQL(vNrNotaCredito, 0)&", "&_
							"  IN_COURRIER       = "&vInCourrier&", "&_
							"  IN_FABR_EXPO      = "&vInFabrExpo&", "&_
							"  IN_TRIANGULACAO   = "&vInTriangulacao&", "&_
							"  IN_PERMISSO       = "&vInPermisso&", "&_
							"  IN_DECL_EMBALAGEM = "&vInEmbalagem&", "&_
							"  IN_CONSULADO      = "&vInConsulado&", "&_
							"  IN_PALLET_EXPURGO = "&vInPalletExpurgo&", "&_
							"  IN_EXPURGO        = "&vInExpurgo&", "&_
							"  IN_INSPECAO       = "&vInInspecao&", "&_
                            "  IN_SEM_PACK_LIST  = "&vInSemPackList&", "&_
							"  IN_CARTA_CREDITO  = "&vInCartaCredito&", "&_
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
							"  DT_PREV_SAIDA     = "&fncValSQL(vDtPrevSaida, 1)&", "&_
							"  TX_ORGAO          = "&fncValSQL(vTxOrgao, 2)&", "&_
							"  TX_LOCAL_INSPECAO = "&fncValSQL(vTxLocalInspecao, 2)&", "&_
							"  TX_LOCAL_EXPURGO  = "&fncValSQL(vTxLocalExpurgo, 2)&", "&_
							"  TX_EMBALAGEM      = "&fncValSQL(vTxEmbalagem, 2)&", "&_
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
                            "  NR_CAIXAS         = "&fncValSQL(vNrCaixas, 3)&", "&_
                            "  NR_PALLETS        = "&fncValSQL(vNrPallets, 3)&", "&_
                            "  NR_JUMBOS         = "&fncValSQL(vNrJumbos, 3)&", "&_
                            "  NR_PACOTES        = "&fncValSQL(vNrPacotes, 3)&", "&_
                            "  NR_BIG_BAGS       = "&fncValSQL(vNrBigBags, 3)&", "&_
                            "  NR_BIG_BAGS_PALLETS = "&fncValSQL(vNrBigBagsPallets, 3)&", "&_
							"  VL_QTD_VOL        = "&fncValSQL(vVlQtdVolume, 3)&" "&_
							" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
							" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
				Else
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
							"  NM_DEP_COLETA_1   = "&fncValSQL(vCodDepColeta1, 2)&", "&_
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
							"  IN_COURRIER       = "&vInCourrier&", "&_
							"  IN_INSPECAO       = "&vInInspecao&", "&_
							"  IN_EMAIL_ERRO     = 0, "&_
							"  TP_DRAWBACK       ='"&vTpDrawback&"', "&_
							"  TP_NOTIFY         ='"&vTpNotify&"', "&_
							"  TP_CONSIGNEE      ='"&vTpConsignee&"', "&_
							"  DT_FATURAMENTO    = "&fncValSQL(vDtFaturamento, 1)&", "&_
							"  DT_INSPECAO       = "&fncValSQL(vDtInspecao, 1)&", "&_
							"  DT_DDL_DRAFT      = "&fncValSQL(vDtDeadLineDraft, 1)&", "&_
							"  DT_DDL_CARGA      = "&fncValSQL(vDtDeadLineCarga, 1)&", "&_
							"  DT_RECEBIDO       = "&fncValSQL(vDtRecebido, 1)&", "&_						
							"  DT_PREV_SAIDA     = "&fncValSQL(vDtPrevSaida, 1)&", "&_
							"  TX_ORGAO          = "&fncValSQL(vTxOrgao, 2)&", "&_
							"  TX_LOCAL_INSPECAO = "&fncValSQL(vTxLocalInspecao, 2)&", "&_
							"  TX_LOCAL_EXPURGO  = "&fncValSQL(vTxLocalExpurgo, 2)&", "&_												
							"  TX_INST_EMB       = "&fncValSQL(vTxInstEmb, 2)&", "&_							
							"  VL_COMISSAO       = "&fncValSQL(vVlComissao, 3)&", "&_
							"  VL_MLE            = "&fncValSQL(vVlMLE, 3)&", "&_
							"  VL_SEGURO         = "&fncValSQL(vVlSeguro, 3)&", "&_
							"  VL_ACRESCIMO      = "&fncValSQL(vVlAcrescimo, 3)&", "&_
							"  VL_DESCONTO       = "&fncValSQL(vVlDesconto, 3)&", "&_
							"  VL_FRETE_INT      = "&fncValSQL(vVlFreteInt, 3)&" "&_							
							" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
							" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
					End If		
							'checkboxTeste
						'response.redirect("teste.asp?vnrrap="&sql)
                        'Response.write sql
                        'Response.end
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno

			If Session("cargo_interno") = "1" Then		
				if objrsx.State = adStateOpen then objrsx.Close()						
				sql = " SELECT G.EMAIL_CRIACAO AS EMAIL, G.IN_EMAIL_CRIACAO AS IN_EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, "&_
				" G.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  G.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, G.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, G.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, G.IN_CONFERENCIA AS IN_CONFERENCIA "&_
				" FROM TEMPRESA_NAC E (NOLOCK)" &_
				" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
				" WHERE E.CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				if objrsx.RecordCount > 0 then
					 vInEmail = objrsx.Fields.Item("IN_EMAIL").Value
					 vEmail = objrsx.Fields.Item("EMAIL").Value
					 vInFornecimento = objrsx.Fields.Item("IN_FORNECIMENTO").Value
					 vInPackList = objrsx.Fields.Item("IN_PACKING_LIST").Value
					 vInEnviaArquivos    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value
					 vInMostraFaturados  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
					 vInDivideEmbarcados = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
					 vInMostraFollowup   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
					 vInConferencia      = objrsx.Fields.Item("IN_CONFERENCIA").Value
				else
					 vEmail = "myindaia@myindaia.com.br"
				end if		
			End If			
	
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "select NM_USUARIO as usuario from tusuario WHERE CD_USUARIO='" & Session("cd_usuario")& "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
			if objrsx.RecordCount > 0 then
				 vCodUsuario = objrsx.Fields.Item("usuario").Value
			else
				 vCodUsuario = "&nbsp;"
			end if
	
			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodExportador2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodExportador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodFabricante) & "'"'fabricante
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodFabricante2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodFabricante = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodCliente) & "'"'cliente
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCliente2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodCliente = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_PAIS) AS PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = '" & Trim(vCodPais) & "'"'pais
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodPais = objrsx.Fields.Item("PAIS").Value
			else
				 vCodPais = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_TERMO_PAGTO) AS TERMO FROM TTERMO_PAGTO (NOLOCK) WHERE CD_TERMO_PAGTO = '" & Trim(vCodCondPagto) & "'"'termo_pagto
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCondPagto = objrsx.Fields.Item("TERMO").Value
			else
				 vCodCondPagto = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodAgenteComissao) & "'" 'agentecomissao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodAgenteComissao = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodAgenteComissao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_VIA_TRANSPORTE) AS TRANSP FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = '" & Trim(vCodViaTransp) & "'"'nmviatransporte
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodViaTransp = objrsx.Fields.Item("TRANSP").Value
			else
				 vCodViaTransp = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_AGENTE) AS AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE ='" & Trim(vCodEmbarcador) & "'"'embarcador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcador = objrsx.Fields.Item("AGENTE").Value
			else
				 vCodEmbarcador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMBARCACAO) AS EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = '" & Trim(vCodEmbarcacao) & "'"'nmembarcacao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcacao = objrsx.Fields.Item("EMBARCACAO").Value
			else
				 vCodEmbarcacao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalEmb) & "'"'localorigem
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalEmb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalEmb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalDesemb) & "'"'localdestino
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalDesemb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalDesemb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_MOEDA) AS MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = '" & Trim(vCodMoedaMLE) & "'"'moeda_mle
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodMoedaMLE = objrsx.Fields.Item("MOEDA").Value
			else
				 vCodMoedaMLE = "&nbsp;"
			end if		
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) as empresa FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & vCodDepColeta & "'"'coleta		
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodDepColeta2 = objrsx.Fields.Item("empresa").Value
			else
				 vCodDepColeta = "&nbsp;"
			end if
			
			
			If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then	
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) WHERE CD_RAP = '" & Left(vNrRap,6) & "' AND CD_RAP_ANO = '" & Right(vNrRap,2) & "' AND CD_GRUPO ='" & Session("GrupoUsuario") & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
				if objrsx.RecordCount > 0 then
					 vProcessoRap = objrsx.Fields.Item("NR_FORNECIMENTO").Value
				else
					 vProcessoRap = "&nbsp;"
				end if		
			End If	
							
If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then							
corpo = "<style type='text/css'>"
corpo = corpo & "body {"
corpo = corpo &	"font-family: Verdana, Arial, Helvetica;"
corpo = corpo &	"color: #000000;"
corpo = corpo &	"background-color: #FFFFFF;"
corpo = corpo &	"margin: 0px;"
corpo = corpo &	"padding: 0px;"
corpo = corpo &	"font-size: 8px;"
corpo = corpo & "}"
corpo = corpo & "fieldset {"
corpo = corpo & "	border: #CCCCCC 1px solid;"
corpo = corpo & "	height: 100%;"
corpo = corpo & "	width: 99%;"
corpo = corpo & "	padding: 5px;"
corpo = corpo & "}"
corpo = corpo & "legend {"
corpo = corpo & "	font-weight:bold;"
corpo = corpo & "}"
corpo = corpo & ".c1 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 0px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".c2 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 1px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".titulo {"
corpo = corpo &	"font-size: 12px;"
corpo = corpo &	"font-weight: bold;"
corpo = corpo &	"text-align: center;"
corpo = corpo & "}"
corpo = corpo & ".pgridsub {"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & ".pgridtit {"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-weight: bold;"
corpo = corpo & "	text-align: center;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & "</style>"
corpo = corpo & "<table width='670' border='0' cellspacing='1' cellpadding='0' style='padding: 0px 1px 0px 1px;'>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='5'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td colspan = '4' style='font-size: 12px;'><b>O processo abaixo acaba de ser alterado. Acesse o myIndaiáWeb para visualizá-lo.</b><br><br></td>"
corpo = corpo &	"		</tr>"
End If
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(vCodLogomarca) & "'></td>"
If Session("InRapSequencial") = "1" Then
	corpo = corpo &	"			<td colspan='2' class='titulo'><b>" & vProcessoRap & "</b></td>"
Else
	corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & Left(Trim(vnrrap),6) & "/" & Right(Trim(vnrrap),2) & "</b></td>"
End If 
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td style='font-size: 10px;'>" & vCodExportador2 & "<b><br>"
corpo = corpo &	"			</b></td>"
corpo = corpo &	"			<td align='right' style='font-size: 10px;'>Abertura: " & Date() &"<br>"
corpo = corpo &	"			Analista: " & vCodUsuario & " &nbsp;<br>"
corpo = corpo &	"				<br>"
corpo = corpo &	"				 "&  vTpStatus&" "&vDtStatus&" "&Left(vHrStatus, 5)& "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"	</table></td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='1'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='220px'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='240px'>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Amostra?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAmostra) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Antecipado?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAntecipado) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1' colspan='2'><b>Sem Integração de Packing List?</b></td>"
corpo = corpo &	"			<td class='c2' colspan='2'>" & sim_nao(vInSemPackList) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
   End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cliente:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCliente & " - " & vCodCliente2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Fabricante:</b></td>"
		If sim_nao(vInFabrExpo)= "Sim" Then 
corpo = corpo &	"<td class='c2'>" & vCodExportador & " - " & vCodExportador2 & "&nbsp;</td>"
		Else
corpo = corpo & "<td class='c2'>" & vCodFabricante & " - " & vCodFabricante2 & "&nbsp;</td>"
		End if			
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Fabr. &eacute; o Exportador?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInFabrExpo)& "&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Dt. Faturamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtFaturamento, 5) & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"


corpo = corpo &	"		<tr height="& vl_heigth & ">"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"			<td class='c1'><b>Processo:</b></td>"
Else
corpo = corpo &	"			<td class='c1'><b>Nr. Fornecimento:</b></td>"
End If
corpo = corpo &	"			<td colspan='3' class='c2'>" & Replace(Trim(vNrFornec),";","; ") & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b><nobr>Notas Fiscais:</nobr></b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrNotasFiscais),";","; ") & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Easy:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrEasy),";","; ") & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td class='c1'><b>Pa&iacute;s de Destino:</b></td>"
corpo = corpo &	"		  <td class='c2'>" & vCodPais & "&nbsp;</td>"
corpo = corpo &	"		  <td class='c1'>&nbsp;</td>"
corpo = corpo &	"		  <td class='c2'>&nbsp;</td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Dt. Acordada de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtEmbarque, 5) & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Drawback:</b></td>"
								str = vTpDrawback
								if fnc_TestaVar(str) then str = tipo_drawback(str) else str = ""
corpo = corpo & 	"<td class='c2'>" &	str & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr Ato Concessório:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrAtoDrawback & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Permisso?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInPermisso) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Processo com triangulação?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInTriangulacao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Consulado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInConsulado) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInEmbalagem) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Pallet Expurgado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInPalletExpurgo) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Certificado de Expurgo?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInExpurgo) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Inspe&ccedil;&atilde;o?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInInspecao) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Inspeção:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrInspecao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Trim(vTxOrgao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Incoterm:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodIncoterm & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Condi&ccedil;&atilde;o de Pagamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCondPagto & "&nbsp;</td>"
corpo = corpo &	"		</tr>"	
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor FOB: </b></td>"
	If fnc_testaVar(vVlMLE) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlMLE, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodMoedaMLE & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
	If fnc_testaVar(vVlAcrescimo) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlAcrescimo, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Desconto:</b></td>"
	End If
	If fnc_TestaVar(vVlDesconto) Then 
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlDesconto, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If	
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Motivo Desconto:</b></td>"

corpo = corpo &	"			<td class='c2'>" & vTxMotivoDesc & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth &">"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Frete:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Frete:</b></td>"	
	End If
	If fnc_TestaVar(vVlFreteInt) Then
corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlFreteInt, 2) & "&nbsp;</td>"
	Else
	corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then			
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
	If fnc_TestaVar(vVlPesoBruto) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoBruto, 4)& "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	If fnc_TestaVar(vVlSeguro) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlSeguro, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
	If fnc_TestaVar(vVlPesoLiq) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoLiq, 4) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
	If fnc_TestaVar(vVlCubagem) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlCubagem, 3) & " m³ </td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"		
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vTxEmbalagem & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vVlQtdVolume & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
	if fnc_TestaVar(vVlComissao) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlComissao, 2)&"%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodAgenteComissao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodDepColeta & " - " &  vCodDepColeta2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Dep. Coleta Transp.:</b></td>"
corpo = corpo &	"			<td class='c2'>" &  vCodDepColeta1 & "</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height="&  vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Via de Transporte:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodViaTransp & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Embarcador:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodEmbarcador & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Navio:</b></td>"
corpo = corpo &	"			<td class='c2'colspan = '3'>" &  vCodEmbarcacao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Local de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalEmb & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'><b>Local de Desembarque:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalDesemb & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Notify:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>"& vCodNotify & " - " & fncTipoPessoaExp(vCodNotify, vTpNotify) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Consignee:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodConsignee & " - " & fncTipoPessoaExp(vCodConsignee, vTpConsignee) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Carta de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInCartaCredito) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Nota de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vNrNotaCredito & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td colspan='8' class='c1'><fieldset><legend>Instru&ccedil;&atilde;o Geral:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxInstEmb), vbcrlf, "<br>") & "</fieldset> </td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr>		"
corpo = corpo &	"			<td colspan='8' class='c2'><fieldset><legend>Marca&ccedil;&atilde;o:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxMarcacao), vbcrlf, "<br>") & "</fieldset></td>"
corpo = corpo & "		</tr>"
	End If
corpo = corpo &	"	</table>"
		
		If (session("EmailCriacao")="1" or vInEmail="1") and vCodExportador <> "" Then
			Set objEmail = CreateObject("CDO.Message")
			objEmail.From 		= "ti@myindaia.com.br" 
			If session("EmailCriacaoEmail") <> "" Then
				objEmail.To 		= session("EmailCriacaoEmail")
			Else
				objEmail.To 		= vEmail
			End If
			objEmail.CC 		= ""
			
			If Session("GrupoUsuario")="241" Then
				objEmail.Subject = "[myIndaiáWeb] Embarque Alterado - Processo: "& vProcessoRap
			Else
				objEmail.Subject = "[myIndaiáWeb] Embarque Alterado - RAP: "& left(vNrRap,6) & "/" & right(vNrRap,2)
			End If
	
			objEmail.MIMEFormatted = true
			objEmail.HTMLBody  	= corpo
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "email-smtp.us-east-1.amazonaws.com"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "AKIAIXMINU4FHLKYYA4Q"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
			objEmail.Configuration.Fields.Update
            if SQLSERVER <> "ANTUERPIA" Then
			  objEmail.Send
            End If
			set objEmail = nothing
	    End If

		End If
 			end if
				end if
			end if
	else						
				if (vTpAcao = "salvar") or (vTpAcao = "duplicar") then
						'define Nr. do RAP	 'FLAVIO
						'*************************************  TRABALHANDO AQUI 09/01/2008*********************
						if objrs.State = adStateOpen then objrs.Close() ' SE FOR UM NOVO REGISTRO INSERIR DADOS
								vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
								'response.redirect("teste.asp?vnrrap="&vnrrap)
								sql= "SELECT CD_RAP "&_
								" FROM TRAP (NOLOCK)"&_
								" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
								" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
								objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								if objrs.eof  then
									vIncourrier=ltrim(rtrim(request("cmbinCourrier")))
									chkCodViaTransp=ltrim(rtrim(request("cmbCodViaTransp")))
									if chkCodViaTransp="" then chkCodViaTransp=0
									'response.Redirect("teste.asp?var="&chkCodViaTransp)
									if vInCourrier="" then 
									vInCourrier=0 
									else 
									vInCourrier=1
									end if 
									If  chkCodViaTransp<>04 and vInCourrier=1 then  %>
										<script>
										alert('A opção de Courrier somente poderá ser marcada quando Via de Transporte aérea.Por favor corrija e tente novamente.!');
										//document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=novo&edtCodExportador=<%=vCodExportador%>&edtTxEmbalagem=<%=request("edtTxEmbalagem")%>';
										submit();	
                                        </script>
									<%'response.Redirect("teste.asp?var="&Request.ServerVariables("SCRIPT_NAME")&Request.ServerVariables("QUERY_STRING") )
									end if	
							
							If Session("InModoSimples") <> "1" Then		
							vInCadivi        = 0
										sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST, IN_MODELO ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodDepColeta1, 2)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&", "&fncValSQL(vNrNotasFiscais, 2)&", "&fncValSQL(vNrEasy, 2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3)& ", "& fncValSQL(vNrBigBags,3)& ", "& fncValSQL(vNrBigBagsPallets,3) & ", " & vInSemPackList
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
                            vInInspecao      = 0
                            vInSemPackList   = 0
							vInAntecipado    = 0
							sql = "INSERT INTO TRAP ("&_
													"  CD_RAP, CD_RAP_ANO, CD_GRUPO, DT_INSERCAO, CD_STATUS, CD_STATUS_DOCTO, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_AUT_DOCTO, CD_USUARIO_CRIADOR, "&_
													"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
													"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
													"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
													"  NR_FORNECIMENTO, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
													"  IN_COURRIER,IN_FABR_EXPO, IN_TRIANGULACAO, IN_PERMISSO, IN_DECL_EMBALAGEM, IN_CONSULADO, IN_PALLET_EXPURGO, IN_EXPURGO, "&_
													"  IN_INSPECAO, IN_CARTA_CREDITO, IN_CADIVI, IN_AMOSTRA, IN_ANTECIPADO, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
													"  DT_FATURAMENTO, DT_EMBARQUE, DT_INSPECAO, DT_DDL_DRAFT, DT_DDL_CARGA, DT_RECEBIDO, DT_FECHAMENTO, DT_PREV_SAIDA, "&_
													"  TX_ORGAO, TX_LOCAL_INSPECAO, TX_MARCACAO, TX_INST_EMB, TX_LOCAL_EXPURGO, TX_EMBALAGEM, TX_MOTIVO_DESC, "&_
													"  VL_COMISSAO, VL_MLE, VL_SEGURO, VL_ACRESCIMO, VL_DESCONTO, VL_FRETE_INT, VL_PESO_BRUTO, VL_PESO_LIQ, "&_
													"  VL_CUBAGEM, VL_QTD_VOL, NR_NOTAS_FISCAIS, NR_EASY, NR_CAIXAS, NR_PALLETS, NR_JUMBOS, NR_PACOTES, NR_BIG_BAGS, NR_BIG_BAGS_PALLETS, IN_SEM_PACK_LIST, IN_MODELO ) "&_
													"VALUES (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2), '" & Trim(Session("GrupoUsuario")) & "', CONVERT(datetime, '"&Date()&"', 103), '1', '1', NULL, NULL, NULL, '"&Session("cd_usuario")&"', "&_
													"  "&fncValSQL(vCodExportador, 0)&", "&fncValSQL(vCodLogomarca, 0)&", "&fncValSQL(vCodFabricante, 0)&", "&fncValSQL(vCodCliente, 0)&", "&fncValSQL(vCodPais, 0)&", "&fncValSQL(vCodCondPagto, 0)&", "&fncValSQL(vCodAgenteComissao, 0)&", "&_
													"  "&fncValSQL(vCodIncoterm, 0)&", "&fncValSQL(vCodDepColeta, 0)&", "&fncValSQL(vCodDepColeta1, 2)&", "&fncValSQL(vCodLocalColeta, 0)&", "&fncValSQL(vCodTerminal, 0)&", "&fncValSQL(vCodViaTransp, 0)&", "&fncValSQL(vCodEmbarcador, 0)&", "&fncValSQL(vCodEmbarcacao, 0)&", "&_
													"  "&fncValSQL(vCodLocalEmb, 0)&", "&fncValSQL(vCodLocalDesemb, 0)&", "&fncValSQL(vCodNotify, 0)&", "&fncValSQL(vCodConsignee, 0)&", "&fncValSQL(vCodBanco, 0)&", ISNULL("&fncValSQL(vCodFormaPagar, 0)&", 3), "&fncValSQL(vCodMoedaMLE, 0)&", "&_
													"  "&fncValSQL(vNrFornec, 0)&", "&fncValSQL(vNrVoo, 0)&", "&fncValSQL(vNrViagem, 0)&", "&fncValSQL(vNrAtoDrawback, 0)&", "&fncValSQL(vNrInspecao, 0)&", "&fncValSQL(vNrNotaCredito, 0)&", "&_
													"  "&vInCourrier&","&vInFabrExpo&", "&vInTriangulacao&", "&vInPermisso&", "&vInEmbalagem&", "&vInConsulado&", "&vInPalletExpurgo&", "&vInExpurgo&", "&_
													"  "&vInInspecao&", "&vInCartaCredito&", "&vInCadivi&", "&vInAmostra&", "&vInAntecipado&",'"&vTpDrawback&"', '"&vTpNotify&"', '"&vTpConsignee&"', "&_
													"  "&fncValSQL(vDtFaturamento, 1)&", "&fncValSQL(vDtEmbarque, 1)&", "&fncValSQL(vDtInspecao, 1)&", "&fncValSQL(vDtDeadLineDraft, 1)&", "&fncValSQL(vDtDeadLineCarga, 1)&", "&fncValSQL(vDtRecebido, 1)&", "&fncValSQL(vDtFechado, 1)&", "&fncValSQL(vDtPrevSaida, 1)&", "&_
													"  "&fncValSQL(vTxOrgao, 2)&", "&fncValSQL(vTxLocalInspecao, 2)&", "&fncValSQL(vTxMarcacao, 2)&", "&fncValSQL(vTxInstEmb, 2)&", "&fncValSQL(vTxLocalExpurgo, 2)&", "&fncValSQL(vTxEmbalagem, 2)&", "&fncValSQL(vTxMotivoDesc, 2)&", "&_
													"  "&fncValSQL(vVlComissao, 3)&", "&fncValSQL(vVlMLE, 3)&", "&fncValSQL(vVlSeguro, 3)&", "&fncValSQL(vVlAcrescimo, 3)&", "&fncValSQL(vVlDesconto, 3)&", "&fncValSQL(vVlFreteInt, 3)&", "&fncValSQL(vVlPesoBruto, 3)&", "&fncValSQL(vVlPesoLiq, 3)&", "&_
													"  "&fncValSQL(vVlCubagem, 3)&", "&fncValSQL(vVlQtdVolume, 3)&", "&fncValSQL(vNrNotasFiscais, 2)&", "&fncValSQL(vNrEasy, 2) & ", "& fncValSQL(vNrCaixas,3) & ", "& fncValSQL(vNrPallets,3) & ", "& fncValSQL(vNrJumbos,3) & ", "& fncValSQL(vNrPacotes,3)& ", "& fncValSQL(vNrBigBags,3)& ", "& fncValSQL(vNrBigBagsPallets,3) & ", " & vInSemPackList
							End If
							
							If Request("vInModelo") = 1 or Right(vNrRap,2) = "MD" Then
								sql =  sql &",'1')"
							Else
								sql =  sql &",'0')"
							End If								
			
												'Response.write sql
												'response.end
													vInTestarRap = true
													Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
													objcnn.Execute(sql)
													vnrrap=mid("000000",1,6-len(vedtCodRap))&vedtCodRap&mid("00",1,2-len(vedtCodRapAno))&vedtCodRapAno
													
													
													If (Session("InMostraFollowup") = "1" or vInMostraFollowup = "1") and  vedtCodRapAno <> "MD" Then				
						sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
							  " (RIGHT('000000' + "&fncValSQL(vedtCodRap,0)&",6), RIGHT('00' + "&fncValSQL(vedtCodRapAno,0)&",2),'"&Session("GrupoUsuario")&"','001', GETDATE(),'"&Session("cd_usuario")&"')"
							    
						objcnn.Execute(sql)	  
						End If	
													
													%>
                                                    
                                                    
                                                    
													<script>//alert('Nr. Instrução/CDE cadastrada com sucesso!')</script>
									<%
			
									
			If Session("cargo_interno") = "1" Then
				if objrsx.State = adStateOpen then objrsx.Close()						
				sql = " SELECT G.EMAIL_CRIACAO AS EMAIL, G.IN_EMAIL_CRIACAO AS IN_EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, "&_
				" G.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  G.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, G.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, G.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, G.IN_CONFERENCIA AS IN_CONFERENCIA "&_
				" FROM TEMPRESA_NAC E (NOLOCK)" &_
				" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
				" WHERE E.CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				if objrsx.RecordCount > 0 then
					 vInEmail = objrsx.Fields.Item("IN_EMAIL").Value
					 vEmail = objrsx.Fields.Item("EMAIL").Value
					 vInFornecimento = objrsx.Fields.Item("IN_FORNECIMENTO").Value
					 vInPackList = objrsx.Fields.Item("IN_PACKING_LIST").Value
					 vInEnviaArquivos    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value
					 vInMostraFaturados  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
					 vInDivideEmbarcados = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
					 vInMostraFollowup   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
					 vInConferencia      = objrsx.Fields.Item("IN_CONFERENCIA").Value
				else
					 vEmail = "myindaia@myindaia.com.br"
				end if							
			End If
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "select NM_USUARIO as usuario from tusuario WHERE CD_USUARIO='" & Session("cd_usuario")& "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
			if objrsx.RecordCount > 0 then
				 vCodUsuario = objrsx.Fields.Item("usuario").Value
			else
				 vCodUsuario = "&nbsp;"
			end if
	
			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodExportador) & "'"'exportador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodExportador2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodExportador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) AS EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodFabricante) & "'"'fabricante
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodFabricante2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodFabricante = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodCliente) & "'"'cliente
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCliente2 = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodCliente = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_PAIS) AS PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = '" & Trim(vCodPais) & "'"'pais
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodPais = objrsx.Fields.Item("PAIS").Value
			else
				 vCodPais = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_TERMO_PAGTO) AS TERMO FROM TTERMO_PAGTO (NOLOCK) WHERE CD_TERMO_PAGTO = '" & Trim(vCodCondPagto) & "'"'termo_pagto
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodCondPagto = objrsx.Fields.Item("TERMO").Value
			else
				 vCodCondPagto = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMPRESA) AS EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = '" & Trim(vCodAgenteComissao) & "'" 'agentecomissao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodAgenteComissao = objrsx.Fields.Item("EMPRESA").Value
			else
				 vCodAgenteComissao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_VIA_TRANSPORTE) AS TRANSP FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = '" & Trim(vCodViaTransp) & "'"'nmviatransporte
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodViaTransp = objrsx.Fields.Item("TRANSP").Value
			else
				 vCodViaTransp = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_AGENTE) AS AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE ='" & Trim(vCodEmbarcador) & "'"'embarcador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcador = objrsx.Fields.Item("AGENTE").Value
			else
				 vCodEmbarcador = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_EMBARCACAO) AS EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = '" & Trim(vCodEmbarcacao) & "'"'nmembarcacao
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodEmbarcacao = objrsx.Fields.Item("EMBARCACAO").Value
			else
				 vCodEmbarcacao = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalEmb) & "'"'localorigem
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalEmb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalEmb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_LOCAL_EMB) AS LOCAL FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = '" & Trim(vCodLocalDesemb) & "'"'localdestino
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodLocalDesemb = objrsx.Fields.Item("LOCAL").Value
			else
				 vCodLocalDesemb = "&nbsp;"
			end if
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = " SELECT RTRIM(NM_MOEDA) AS MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = '" & Trim(vCodMoedaMLE) & "'"'moeda_mle
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodMoedaMLE = objrsx.Fields.Item("MOEDA").Value
			else
				 vCodMoedaMLE = "&nbsp;"
			end if		
			
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) as empresa FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '" & vCodDepColeta & "'"'coleta		
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.RecordCount > 0 then
				 vCodDepColeta2 = objrsx.Fields.Item("empresa").Value
			else
				 vCodDepColeta = "&nbsp;"
			end if
			
			If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then	
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) WHERE CD_RAP = '" & Left(vNrRap,6) & "' AND CD_RAP_ANO = '" & Right(vNrRap,2) & "' AND CD_GRUPO ='" & Session("GrupoUsuario") & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
				if objrsx.RecordCount > 0 then
					 vProcessoRap = objrsx.Fields.Item("NR_FORNECIMENTO").Value
				else
					 vProcessoRap = "&nbsp;"
				end if		
			End If			
					
If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then	
corpo = "<style type='text/css'>"
corpo = corpo & "body {"
corpo = corpo &	"font-family: Verdana, Arial, Helvetica;"
corpo = corpo &	"color: #000000;"
corpo = corpo &	"background-color: #FFFFFF;"
corpo = corpo &	"margin: 0px;"
corpo = corpo &	"padding: 0px;"
corpo = corpo &	"font-size: 8px;"
corpo = corpo & "}"
corpo = corpo & "fieldset {"
corpo = corpo & "	border: #CCCCCC 1px solid;"
corpo = corpo & "	height: 100%;"
corpo = corpo & "	width: 99%;"
corpo = corpo & "	padding: 5px;"
corpo = corpo & "}"
corpo = corpo & "legend {"
corpo = corpo & "	font-weight:bold;"
corpo = corpo & "}"
corpo = corpo & ".c1 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 0px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".c2 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 1px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".titulo {"
corpo = corpo &	"font-size: 12px;"
corpo = corpo &	"font-weight: bold;"
corpo = corpo &	"text-align: center;"
corpo = corpo & "}"
corpo = corpo & ".pgridsub {"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & ".pgridtit {"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-weight: bold;"
corpo = corpo & "	text-align: center;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & "</style>"
corpo = corpo & "<table width='670' border='0' cellspacing='1' cellpadding='0' style='padding: 0px 1px 0px 1px;'>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='5'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td colspan = '4' style='font-size: 12px;'><b>O processo abaixo acaba de ser criado. Acesse o myIndaiáWeb para visualizá-lo.</b><br><br></td>"
corpo = corpo &	"		</tr>"
End If
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(vCodLogomarca) & "'></td>"
	If Session("InRapSequencial")<>"1" Then
corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & Left(Trim(vnrrap),6) & "/" & Right(Trim(vnrrap),2) & "</b></td>"
	Else
corpo = corpo &	"			<td colspan='2' class='titulo'><b>" & vProcessoRap & "</b></td>"
	End If	
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td style='font-size: 10px;'>" & vCodExportador2 & "<b><br>"
corpo = corpo &	"			</b></td>"
corpo = corpo &	"			<td align='right' style='font-size: 10px;'>Abertura: " & Date() &"<br>"
corpo = corpo &	"			Analista: " & vCodUsuario & " &nbsp;<br>"
corpo = corpo &	"				<br>"
corpo = corpo &	"				 "&  vTpStatus&" "&vDtStatus&" "&Left(vHrStatus, 5)& "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"	</table></td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='1'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='220px'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='240px'>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Amostra?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAmostra) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Antecipado?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInAntecipado) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1' colspan='2'><b>Sem Integração de Packing List?</b></td>"
corpo = corpo &	"			<td class='c2' colspan='2'>" & sim_nao(vInSemPackList) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
   End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cliente:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCliente & " - " & vCodCliente2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Fabricante:</b></td>"
		If sim_nao(vInFabrExpo)= "Sim" Then 
corpo = corpo &	"<td class='c2'>" & vCodExportador & " - " & vCodExportador2 & "&nbsp;</td>"
		Else
corpo = corpo & "<td class='c2'>" & vCodFabricante & " - " & vCodFabricante2 & "&nbsp;</td>"
		End if			
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Fabr. &eacute; o Exportador?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInFabrExpo)& "&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Dt. Faturamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtFaturamento, 5) & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"			<td class='c1'><b>Processo:</b></td>"
Else
corpo = corpo &	"			<td class='c1'><b>Nr. Fornecimento:</b></td>"
End if
corpo = corpo &	"			<td colspan='3' class='c2'>" & Replace(Trim(vNrFornec),";","; ") & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b><nobr>Notas Fiscais:</nobr></b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrNotasFiscais),";","; ") & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Easy:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(vNrEasy),";","; ") & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td class='c1'><b>Pa&iacute;s de Destino:</b></td>"
corpo = corpo &	"		  <td class='c2'>" & vCodPais & "&nbsp;</td>"
corpo = corpo &	"		  <td class='c1'>&nbsp;</td>"
corpo = corpo &	"		  <td class='c2'>&nbsp;</td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Dt. Acordada de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(vDtEmbarque, 5) & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Drawback:</b></td>"
								str = vTpDrawback
								if fnc_TestaVar(str) then str = tipo_drawback(str) else str = ""
corpo = corpo & 	"<td class='c2'>" &	str & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr Ato Concessório:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrAtoDrawback & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Permisso?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInPermisso) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Processo com triangulação?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInTriangulacao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Consulado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInConsulado) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInEmbalagem) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Pallet Expurgado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInPalletExpurgo) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Certificado de Expurgo?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInExpurgo) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Inspe&ccedil;&atilde;o?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(vInInspecao) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Inspeção:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrInspecao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Trim(vTxOrgao) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Incoterm:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodIncoterm & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Condi&ccedil;&atilde;o de Pagamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodCondPagto & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor FOB: </b></td>"
	If fnc_testaVar(vVlMLE) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlMLE, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodMoedaMLE & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
	If fnc_testaVar(vVlAcrescimo) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlAcrescimo, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Desconto:</b></td>"
	End If
	If fnc_TestaVar(vVlDesconto) Then 
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlDesconto, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If	
	If Session("InModoSimples")<>"1" Then	
corpo = corpo &	"			<td class='c1'><b>Motivo Desconto:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vTxMotivoDesc & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth &">"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Frete:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Frete:</b></td>"	
	End If
	If fnc_TestaVar(vVlFreteInt) Then
corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlFreteInt, 2) & "&nbsp;</td>"
	Else
	corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then			
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
	If fnc_TestaVar(vVlPesoBruto) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoBruto, 4)& "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	If fnc_TestaVar(vVlSeguro) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlSeguro, 2) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
	If fnc_TestaVar(vVlPesoLiq) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlPesoLiq, 4) & "&nbsp;</td>"
	Else

		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
	If fnc_TestaVar(vVlCubagem) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(vVlCubagem, 3) & " m³ </td>"
	Else
		corpo = corpo &	"			<td class='c2'>&nbsp;</td>"		
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vNrCaixas & " Cx(s);" & vNrPallets & " Pallet(s);" & vNrPacotes & " Pct(s);" & vNrJumbos & " Jumbo(s);" & vNrBigBags & " Big Bag(s);" & vNrBigBagsPallets & " Big Bag(s) Pallet(s);&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vVlQtdVolume & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
	if fnc_TestaVar(vVlComissao) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(vVlComissao, 2)&"%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	Else
		corpo = corpo &	"			<td class='c2'>%"&fncExibeForma(vCodFormaPagar) & "&nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodAgenteComissao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodDepColeta & " - " &  vCodDepColeta2 & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Dep. Coleta Transp.:</b></td>"
corpo = corpo &	"			<td class='c2'>" &  vCodDepColeta1 & "</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height="&  vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Via de Transporte:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodViaTransp & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Embarcador:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodEmbarcador & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Navio:</b></td>"
corpo = corpo &	"			<td class='c2'colspan = '3'>" &  vCodEmbarcacao & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Local de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalEmb & "&nbsp;</td>	"
corpo = corpo &	"			<td class='c1'><b>Local de Desembarque:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodLocalDesemb & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Notify:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>"& vCodNotify & " - " & fncTipoPessoaExp(vCodNotify, vTpNotify) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Consignee:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vCodConsignee & " - " & fncTipoPessoaExp(vCodConsignee, vTpConsignee) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Carta de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(vInCartaCredito) & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Nota de Crédito:</b>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>" & vNrNotaCredito & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td colspan='8' class='c1'><fieldset><legend>Instru&ccedil;&atilde;o Geral:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxInstEmb), vbcrlf, "<br>") & "</fieldset> </td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr>		"
corpo = corpo &	"			<td colspan='8' class='c2'><fieldset><legend>Marca&ccedil;&atilde;o:</legend>"
corpo = corpo &	"				" & Replace(Trim(vTxMarcacao), vbcrlf, "<br>") & "</fieldset></td>"
corpo = corpo & "		</tr>"
	End If
corpo = corpo &	"	</table>"
		
		If (session("EmailCriacao")="1" or vInEmail="1") and vCodExportador <> "" Then
			Set objEmail = CreateObject("CDO.Message")
			objEmail.From 		= "ti@myindaia.com.br" 
			If session("EmailCriacaoEmail") <> "" Then
				objEmail.To 		= session("EmailCriacaoEmail")
			Else
				objEmail.To 		= vEmail
			End If
			objEmail.CC 		= ""
			
			If Session("GrupoUsuario")="241" Then
				objEmail.Subject = "[myIndaiáWeb] Novo Processo Criado - Processo: "& vProcessoRap
			Else
				objEmail.Subject = "[myIndaiáWeb] Novo Embarque Criado - RAP: "& Left(Trim(vnrrap),6) & "/" & Right(Trim(vnrrap),2)
			End If
	
			objEmail.MIMEFormatted = true
			objEmail.HTMLBody  	= corpo
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "email-smtp.us-east-1.amazonaws.com"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "AKIAIXMINU4FHLKYYA4Q"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
			objEmail.Configuration.Fields.Update
            if SQLSERVER <> "ANTUERPIA" Then
			  objEmail.Send
            End If
			set objEmail = nothing
	    End If	
		
		End If
							else%>
													<script>//flavio
													alert('Nr. Instrução/CDE já cadastrada!');
													document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=novo&edtCodExportador=<%=vCodExportador%>';
													</script>
									<%end if
						end if
				end if
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
		sql = "SELECT CD_EXPORTADOR, NR_FORNECIMENTO, NR_NOTA_CREDITO, CD_MOEDA_MLE, CD_INCOTERM, CD_TERMO_PAGTO, IN_AMOSTRA, IN_SEM_PACK_LIST, CD_STATUS, IN_ANTECIPADO, "&_
					"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, "&_
					"  ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, TX_MOTIVO_DESC, DT_FATURAMENTO, CD_STATUS_DOCTO "&_
					" FROM TRAP (NOLOCK) "&_
					" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
					" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
        vInSemPackList = objrs.Fields.Item("IN_SEM_PACK_LIST").Value
		vInAntecipado = objrs.Fields.Item("IN_ANTECIPADO").Value
		vCdStatus = objrs.Fields.Item("CD_STATUS").Value
		
		if not fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value) or not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value) or _
			 not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value) or _
			 (CDbl(objrs.Fields.Item("VL_MLE").Value)        = 0) or (CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value) = 0) or _
			 (CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0) or (CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)  = 0) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value)) or _
			((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value)) then
			str = "Foram encontrados problemas no cadastro da Instrução."
			sql = "UPDATE TRAP SET IN_RAP_VALIDA_DOCTO = 0, IN_PEDIDO_VALIDA = 0, TX_VALIDACAO_PEDIDO = '"&str&"' "&_
								" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
								" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
						"  AND ISNULL(QT_BAIXADA, 0) > 0"&_
						"  AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
					.Parameters("@nrGrupo") = session("GrupoUsuario")
					.Execute , , adExecuteNoRecords
					if .Parameters("@RETURN_VALUE") = 1 then vInRemessa = true
				end with
			end if
    end if
		
		
		If Session("cargo_interno") = "1" Then
			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT G.EMAIL_CRIACAO AS EMAIL, G.IN_EMAIL_CRIACAO AS IN_EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, G.CD_GRUPO AS GRUPO, "&_
			" G.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  G.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, G.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, G.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, G.IN_CONFERENCIA AS IN_CONFERENCIA "&_
			" FROM TEMPRESA_NAC E (NOLOCK)" &_
				" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
				" WHERE E.CD_EMPRESA = '" & objrs.Fields.Item("CD_EXPORTADOR").Value & "'"'exportador
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				if objrsx.RecordCount > 0 then
					 vInEmail = objrsx.Fields.Item("IN_EMAIL").Value
					 vEmail = objrsx.Fields.Item("EMAIL").Value
					 vInFornecimento = objrsx.Fields.Item("IN_FORNECIMENTO").Value
					 vInPackList = objrsx.Fields.Item("IN_PACKING_LIST").Value
					 vInEnviaArquivos    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value
					 vInMostraFaturados  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
					 vInDivideEmbarcados = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
					 vInMostraFollowup   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
					 vInConferencia      = objrsx.Fields.Item("IN_CONFERENCIA").Value
					 vInModoSimples = "0"
					 vInRapSequencial = "0"
					 vInModoSimplesCheck = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
					 vEmail = "myindaia@myindaia.com.br"
					 vGrupo = objrsx.Fields.Item("GRUPO").Value
				end if
		Else
			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, G.CD_GRUPO AS GRUPO, G.IN_RAP_SEQUENCIAL AS IN_RAP_SEQUENCIAL FROM TEMPRESA_NAC E (NOLOCK)" &_
				" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
				" WHERE E.CD_EMPRESA = '" & objrs.Fields.Item("CD_EXPORTADOR").Value & "'"'exportador
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				if objrsx.RecordCount > 0 then
					 vInModoSimples = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
					 vInModoSimplesCheck = vInModoSimples
					 vGrupo = objrsx.Fields.Item("GRUPO").Value
					 vInRapSequencial = objrsx.Fields.Item("IN_RAP_SEQUENCIAL").Value
				end if	
		End If		
		
		'inicia a verificação da rap
		
		if (not fnc_TestaVar(objrs.Fields.Item("NR_FORNECIMENTO").Value) and not vInAmostra) or	(not  fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value) and vInModoSimplesCheck <> "1") or (not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value)  and vInModoSimplesCheck <> "1") or (not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value)  and vInModoSimplesCheck <> "1") or (CDbl(objrs.Fields.Item("VL_MLE").Value)= 0 and vInModoSimplesCheck <> "1") or (CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value) = 0 and vInModoSimplesCheck <> "1") or (CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0 and vInModoSimplesCheck <> "1") or (CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)  = 0 and vInModoSimplesCheck <> "1") or ((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value)) or ((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and (not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value) and vInModoSimplesCheck <> "1")) then
			str = "Foram encontrados problemas no cadastro da Instrução."
			sql = "UPDATE TRAP SET IN_RAP_VALIDA = 0, IN_FORN_VALIDA = 0, IN_PACK_VALIDA = 0, TX_VALIDACAO = '"&str&"' "&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
		else
			vInRap = true
			call subVerificaAmostra(vNrRap, vInAmostra)
		end if
		'verifica os fornecimentos caso a rap esteja ok

		If  fnc_TestaVar(objrs.Fields.Item("DT_FATURAMENTO").Value) Then
			in_dt_faturamento = true
		Else
			in_dt_faturamento = false
		End if

        
		if vInRap and (Session("InFornecimento")="1" or vInFornecimento="1") then
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK) "&_
			" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
			" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
					.Parameters("@nrGrupo") = session("GrupoUsuario")
					.Execute , , adExecuteNoRecords
					'checkrap=.Parameters("@RETURN_VALUE")
	'Response.Redirect("../IMPORT/teste.asp?var1="&checkrap&"")
					if .Parameters("@RETURN_VALUE") = 1 then vInForn = true
				end with
			end if
			if objrsx.State = adStateOpen then objrsx.Close()
		Else
			If vInRap Then
			sql = "UPDATE TRAP SET IN_FORN_VALIDA = 1 "&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			vInForn = true
			End if	
		end if
		
        'verifica os packing-list caso os fornecimentos estejam ok
		if vInForn  and ((Session("InPackingList")="1" or vInPackList="1") and (not vInSemPackList)) then        
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT COUNT(*) FROM TRAP_PACK_LIST (NOLOCK) "&_
			" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
			" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrsx.Fields.Item(0).Value = 0 then
				'caso não existam packing list, apenas torna a rap apta a recebe-los
				str = "Instrução de embarque pronta para receber o Packing List."
				sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, IN_PACK_VALIDA = 0, TX_VALIDACAO = '"&str&"' "&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
					.Parameters("@nrGrupo") = session("GrupoUsuario")
					.Execute , , adExecuteNoRecords
					if .Parameters("@RETURN_VALUE") = 1 then vInPack = true else vInPack = false
				end with
			end if
			if objrsx.State = adStateOpen then objrsx.Close()
		else	
			If vInForn Then
				sql = "UPDATE TRAP SET IN_PACK_VALIDA = 1 "&_
					  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
					  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
				vInPack = true	
			End If
		end if
	end if
	
    
	'verifica se o botão de emissão de doctos vai ser exibido
	if not(vTpAcao="listar") then
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK) "&_
			" WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
			" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
		vInEmissao = (objrs.Fields.Item(0).Value = 0)
	end if
	'verifica se as informações para integração do fornecimento e packing list estão preenchidas
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT IN_RAP_VALIDA, IN_FORN_VALIDA, IN_PACK_VALIDA, TX_VALIDACAO, IN_AMOSTRA, IN_ANTECIPADO, IN_SEM_PACK_LIST "&_
				 " FROM TRAP R (NOLOCK) "&_
				  " WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"&_
				  " AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vInRap    = objrs.Fields.Item("IN_RAP_VALIDA").Value
	vInSemPackList = objrs.Fields.Item("IN_SEM_PACK_LIST").Value

	If Session("InFornecimento")="1" or vInFornecimento ="1" Then
		vInForn   = objrs.Fields.Item("IN_FORN_VALIDA").Value
	Else
		vInForn   = True
	End If
	
	If Session("InPackingList")="1" or vInPackList ="1" or vInSemPackList = "1" Then
		vInPack   = objrs.Fields.Item("IN_PACK_VALIDA").Value
    Else
		vInPack   = True	
	End If
	
	vTxValida = objrs.Fields.Item("TX_VALIDACAO").Value
	'exibe os botões de integração
    vMostrarRemessa = (vInRapDocto and not(vTpAcao="visualizar") and not vInAmostra)
	vMostrarTxt = (vInRap and not(vTpAcao="visualizar") and not vInAmostra)
	vMostrarXls = (vInForn and not(vTpAcao="visualizar"))
	

	If session("GrupoUsuario") <> "241" Then
		vValida     = (vInRap and vInForn and vInPack)
	Else
		vValida     = (vInRap and vInForn and in_dt_faturamento)
	End If
	
	If vValida Then
		If Session("rap_valida"&vNrRap) <> vValida Then
			If Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" Then	
			if objrs.State = adStateOpen then objrs.Close()
			sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO,CD_CLIENTE,CD_EMBARCADOR,CD_DEP_COLETA, NM_DEP_COLETA_1,CD_FABRICANTE,CD_EXPORTADOR, NR_FORNECIMENTO, "&_

			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_EXPORTADOR), '&nbsp;') AS NM_EXPORTADOR, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_FABRICANTE), '&nbsp;') AS NM_FABRICANTE, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '&nbsp;') AS NM_CLIENTE, "&_
			"  ISNULL((SELECT RTRIM(NM_PAIS) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS), '&nbsp;') AS NM_PAIS, "&_
			"  ISNULL((SELECT RTRIM(NM_TERMO_PAGTO) FROM TTERMO_PAGTO (NOLOCK) WHERE CD_TERMO_PAGTO = R.CD_TERMO_PAGTO), '&nbsp;') AS NM_TERMO_PAGTO, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_AGENTE_COMISSAO), '&nbsp;') AS NM_AGENTE_COMISSAO, "&_
			"  ISNULL((SELECT RTRIM(NM_EMPRESA)+' - '+RTRIM(AP_EMPRESA) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = R.CD_DEP_COLETA), '&nbsp;') AS NM_DEP_COLETA, "&_
			"  ISNULL((SELECT RTRIM(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = R.CD_VIA_TRANSPORTE), '&nbsp;') AS NM_VIA_TRANSPORTE, "&_
			"  ISNULL((SELECT RTRIM(NM_AGENTE) FROM TAGENTE (NOLOCK) WHERE CD_AGENTE = R.CD_EMBARCADOR), '&nbsp;') AS NM_EMBARCADOR, "&_
			"  ISNULL((SELECT RTRIM(NM_EMBARCACAO) FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = R.CD_EMBARCACAO), '&nbsp;') AS NM_EMBARCACAO, "&_
			"  ISNULL((SELECT RTRIM(NM_LOCAL_EMB) FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = R.CD_LOCAL_ORIGEM), '&nbsp;') AS NM_LOCAL_ORIGEM, "&_
			"  ISNULL((SELECT RTRIM(NM_LOCAL_EMB) FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = R.CD_LOCAL_DESTINO), '&nbsp;') AS NM_LOCAL_DESTINO, "&_
			"  ISNULL((SELECT RTRIM(NM_MOEDA) FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = R.CD_MOEDA_MLE), '&nbsp;') AS NM_MOEDA_MLE, "&_
			"  CD_LOGOMARCA, CD_INCOTERM, CD_NOTIFY, CD_CONSIGNATARIO, CD_FORMA_PAGAR, TP_DRAWBACK, TP_NOTIFY, TP_CONSIGNEE, "&_
			"  ISNULL(NR_FORNECIMENTO, '&nbsp;') AS NR_FORNECIMENTO, ISNULL(NR_CDE, '&nbsp;') AS NR_CDE, ISNULL(NR_VIAGEM, '&nbsp;') AS NR_VIAGEM, "&_
			"  ISNULL(NR_ATO_CONCESSORIO, '&nbsp;') AS NR_ATO_CONCESSORIO, ISNULL(NR_INSPECAO, '&nbsp;') AS NR_INSPECAO, "&_
			"  ISNULL(NR_NOTA_CREDITO, '&nbsp;') AS NR_NOTA_CREDITO, ISNULL(NR_NOTAS_FISCAIS, '&nbsp;') AS NR_NOTAS_FISCAIS, ISNULL(NR_EASY, '&nbsp;') AS NR_EASY,"&_
			"  CAST(IN_FABR_EXPO as char(1)) AS IN_FABR_EXPO, CAST(IN_TRIANGULACAO as char(1)) AS IN_TRIANGULACAO, "&_
			"  CAST(IN_PERMISSO as char(1)) AS IN_PERMISSO, CAST(IN_DECL_EMBALAGEM as char(1)) AS IN_DECL_EMBALAGEM, "&_
			"  CAST(IN_CONSULADO as char(1)) AS IN_CONSULADO, CAST(IN_PALLET_EXPURGO as char(1)) AS IN_PALLET_EXPURGO, "&_
			"  CAST(IN_EXPURGO as char(1)) AS IN_EXPURGO, CAST(IN_INSPECAO as char(1)) AS IN_INSPECAO, "&_
			"  CAST(IN_CARTA_CREDITO as char(1)) AS IN_CARTA_CREDITO, CAST(IN_CADIVI as char(1)) AS IN_CADIVI, "&_
			"  CAST(IN_AMOSTRA as char(1)) AS IN_AMOSTRA, CAST(IN_ANTECIPADO as char(1)) AS IN_ANTECIPADO, "&_
			"  DT_FATURAMENTO, DT_EMBARQUE, ISNULL(TX_ORGAO,'&nbsp;') AS TX_ORGAO, ISNULL(TX_LOCAL_INSPECAO,'&nbsp;') AS TX_LOCAL_INSPECAO, "&_
			"  ISNULL(TX_LOCAL_EXPURGO,'&nbsp;') AS TX_LOCAL_EXPURGO, ISNULL(TX_EMBALAGEM,'&nbsp;') AS TX_EMBALAGEM, "&_
			"  ISNULL(TX_MARCACAO,'&nbsp;') AS TX_MARCACAO, ISNULL(TX_INST_EMB, '&nbsp;') AS TX_INST_EMB, ISNULL(TX_MOTIVO_DESC, '&nbsp;') AS TX_MOTIVO_DESC, "&_
			"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_FRETE_INT, 0) AS VL_FRETE_INT, ISNULL(VL_SEGURO, 0) AS VL_SEGURO, "&_
			"  ISNULL(VL_ACRESCIMO, 0) AS VL_ACRESCIMO, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(VL_COMISSAO, 0) AS VL_COMISSAO, "&_
			"  ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, "&_
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL, G.IN_EMAIL_AUTORIZACAO AS IN_EMAIL, G.EMAIL_AUTORIZACAO AS EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, G.IN_EMAIL_PRE_AUTORIZACAO AS IN_EMAIL2, G.EMAIL_PRE_AUTORIZACAO AS EMAIL2, "&_
            "  ISNULL(NR_CAIXAS,0) AS NR_CAIXAS, ISNULL(NR_PALLETS,0) AS NR_PALLETS, ISNULL(NR_JUMBOS,0) AS NR_JUMBOS, ISNULL(NR_PACOTES,0) AS NR_PACOTES, CAST(IN_SEM_PACK_LIST as char(1)) AS IN_SEM_PACK_LIST, " &_ 
			" G.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  G.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, G.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, G.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, G.IN_CONFERENCIA AS IN_CONFERENCIA, G.IN_RAP_SEQUENCIAL AS IN_RAP_SEQUENCIAL "&_
			"  FROM TRAP R (NOLOCK) "&_
			"  LEFT JOIN TGRUPO G (NOLOCK) ON (G.CD_GRUPO = R.CD_GRUPO) "&_
			"  WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"&_
			" AND R.CD_GRUPO = '" & session("GrupoUsuario") & "'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'**********************************************************************************************************
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "select NM_USUARIO from tusuario WHERE CD_USUARIO='"&objrs.Fields.Item("CD_USUARIO_CRIADOR").Value&"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		
'**********************************************************************************************************

vl_heigth = 20
'vNrCde = objrs.Fields.Item("NR_CDE").Value
vNrCde=objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value 'FLAVIO 14/01/2008
vNrProcessoRap = objrs.Fields.Item("NR_FORNECIMENTO").Value
vEmail = objrs.Fields.Item("EMAIL").Value
vEmail2 = objrs.Fields.Item("EMAIL2").Value
vInFornecimento = objrs.Fields.Item("IN_FORNECIMENTO").Value
vInPackList = objrs.Fields.Item("IN_PACKING_LIST").Value
vInEmail = objrs.Fields.Item("IN_EMAIL").Value
vInEmail2 = objrs.Fields.Item("IN_EMAIL2").Value
vInEnviaArquivos    = objrs.Fields.Item("IN_ENVIA_ARQUIVOS").Value
vInMostraFaturados  = objrs.Fields.Item("IN_MOSTRA_FATURADOS").Value
vInDivideEmbarcados = objrs.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
vInMostraFollowup   = objrs.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
vInConferencia      = objrs.Fields.Item("IN_CONFERENCIA").Value
vInRapSequencial    = objrs.Fields.Item("IN_RAP_SEQUENCIAL").Value
Session("InModoSimplesCheck")      = objrs.Fields.Item("IN_MODO_SIMPLES").Value
Session("InMostraFaturadosCheck")  = objrs.Fields.Item("IN_MOSTRA_FATURADOS").Value
Session("InMostraFollowupCheck")   = objrs.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
Session("InConferenciaCheck")      = objrs.Fields.Item("IN_CONFERENCIA").Value
Session("InEnviaArquivosCheck")    = objrs.Fields.Item("IN_ENVIA_ARQUIVOS").Value
Session("InDivideEmbarcadosCheck") = objrs.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
Session("InRapSequencialCheck")    = objrs.Fields.Item("IN_RAP_SEQUENCIAL").Value

if fnc_TestaVar(vNrCde) then
	vNrCde = Replace(Trim(vNrCde),"/","")
	vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
else
	vNrCde = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;"
end if
'verifica o status e exibe a data do ultimo status
select case objrs.Fields.Item("CD_STATUS").Value
	case 0
		vTpStatus = "Cancelado: "
		vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)
		vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7)
	case 2, 3
		vTpStatus = "Autorizado: "
		vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)
		vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7)
	case else
		vTpStatus = ""
		vDtStatus = ""
		vHrStatus = ""
end select


corpo = "<style type='text/css'>"
corpo = corpo & "body {"
corpo = corpo &	"font-family: Verdana, Arial, Helvetica;"
corpo = corpo &	"color: #000000;"
corpo = corpo &	"background-color: #FFFFFF;"
corpo = corpo &	"margin: 0px;"
corpo = corpo &	"padding: 0px;"
corpo = corpo &	"font-size: 8px;"
corpo = corpo & "}"
corpo = corpo & "fieldset {"
corpo = corpo & "	border: #CCCCCC 1px solid;"
corpo = corpo & "	height: 100%;"
corpo = corpo & "	width: 99%;"
corpo = corpo & "	padding: 5px;"
corpo = corpo & "}"
corpo = corpo & "legend {"
corpo = corpo & "	font-weight:bold;"
corpo = corpo & "}"
corpo = corpo & ".c1 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 0px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".c2 {"
corpo = corpo & "	border:dotted #DDDDDD;"
corpo = corpo & "	border-width: 0px 1px 1px 0px;"
corpo = corpo &	"font-size: 10px;"
corpo = corpo & "}"
corpo = corpo & ".titulo {"
corpo = corpo &	"font-size: 12px;"
corpo = corpo &	"font-weight: bold;"
corpo = corpo &	"text-align: center;"
corpo = corpo & "}"
corpo = corpo & ".pgridsub {"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & ".pgridtit {"
corpo = corpo & "	font-size: 8px;"
corpo = corpo & "	color: #000000;"
corpo = corpo & "	font-weight: bold;"
corpo = corpo & "	text-align: center;"
corpo = corpo & "	border-style: dotted;"
corpo = corpo & "	border-color: #333333;"
corpo = corpo & "	border-width: 1px 0px 0px 0px;"
corpo = corpo & "}"
corpo = corpo & "</style>"
corpo = corpo & "<table width='670' border='0' cellspacing='1' cellpadding='0' style='padding: 0px 1px 0px 1px;'>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='5'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td colspan = '4' style='font-size: 12px;'><b>O processo abaixo encerrou seu carregamento. Acesse o myIndaiáWeb para conferir os dados e autorizar o embarque.</b><br><br></td>"
corpo = corpo &	"		</tr>"
End If
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(objrs.Fields.Item("CD_LOGOMARCA").Value) & "'></td>"
 If Session("InRapSequencialCheck") = "1" Then
corpo = corpo &	"			<td colspan='2' class='titulo'><b>" & objrs.Fields.Item("NR_FORNECIMENTO").Value & "</b></td>"
 Else
corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & vNrCde & "</b></td>"
 End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td style='font-size: 10px;'>" & objrs.Fields.Item("NM_EXPORTADOR").Value & "<b><br>"
corpo = corpo &	"			</b></td>"
corpo = corpo &	"			<td align='right' style='font-size: 10px;'>Abertura: " & fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)&" "&Left(fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7), 5) &"<br>"
corpo = corpo &	"			Analista: " & objrsx.Fields.Item("NM_USUARIO").Value & " <br>"
corpo = corpo &	"				<br>"
corpo = corpo &	"				 "&  vTpStatus&" "&vDtStatus&" "&Left(vHrStatus, 5)& "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"	</table></td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='1'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='220px'>"
corpo = corpo &	"		<col width='100px'>"
corpo = corpo &	"		<col width='240px'>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Amostra?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_AMOSTRA").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Antecipado?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_ANTECIPADO").Value) & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth &">"
corpo = corpo &	"			<td class='c1' colspan='2'><b>Sem Integração de Packing List?</b></td>"
corpo = corpo &	"			<td class='c2' colspan='2'>" & sim_nao(objrs.Fields.Item("IN_SEM_PACK_LIST").Value) & "&nbsp;</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cliente:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_CLIENTE").Value & " - " & objrs.Fields.Item("NM_CLIENTE").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Fabricante:</b></td>"
		If sim_nao(objrs.Fields.Item("IN_FABR_EXPO").Value)= "Sim" Then 
corpo = corpo &	"<td class='c2'>" & objrs.Fields.Item("CD_EXPORTADOR").Value & " - " & objrs.Fields.Item("NM_EXPORTADOR").Value & "</td>"
		Else
corpo = corpo & "<td class='c2'>" & objrs.Fields.Item("CD_FABRICANTE").Value & " - " & objrs.Fields.Item("NM_FABRICANTE").Value & "</td>"
		End if			
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Fabr. &eacute; o Exportador?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_FABR_EXPO").Value)& "</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Dt. Faturamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(objrs.Fields.Item("DT_FATURAMENTO").Value, 5) & "</td>	"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"			<td class='c1'><b>Processo:</b></td>"
Else
corpo = corpo &	"			<td class='c1'><b>Nr. Fornecimento:</b></td>"
End If
corpo = corpo &	"			<td colspan='3' class='c2'>" & Replace(Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value),";","; ") & "</td>"
corpo = corpo &	"		</tr>"

If Session("InModoSimples")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b><nobr>Notas Fiscais:</nobr></b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(objrs.Fields.Item("NR_NOTAS_FISCAIS").Value),";","; ") & "&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Easy:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Replace(Trim(objrs.Fields.Item("NR_EASY").Value),";","; ") & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"
	End If

corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td class='c1'><b>Pa&iacute;s de Destino:</b></td>"
corpo = corpo &	"		  <td class='c2'>" & objrs.Fields.Item("NM_PAIS").Value & "</td>"
corpo = corpo &	"		  <td class='c1'>&nbsp;</td>"
corpo = corpo &	"		  <td class='c2'>&nbsp;</td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Dt. Acordada de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5) & "</td>	"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Drawback:</b></td>"
								str = objrs.Fields.Item("TP_DRAWBACK").Value
								if fnc_TestaVar(str) then str = tipo_drawback(str) else str = ""
corpo = corpo & 	"<td class='c2'>" &	str & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr Ato Concessório:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NR_ATO_CONCESSORIO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Permisso?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_PERMISSO").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Processo com triangulação?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_TRIANGULACAO").Value) & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Consulado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(objrs.Fields.Item("IN_CONSULADO").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_DECL_EMBALAGEM").Value) & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Pallet Expurgado?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(objrs.Fields.Item("IN_PALLET_EXPURGO").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Certificado de Expurgo?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(objrs.Fields.Item("IN_EXPURGO").Value) & "</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Inspe&ccedil;&atilde;o?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  sim_nao(objrs.Fields.Item("IN_INSPECAO").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Inspeção:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NR_INSPECAO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & Trim(objrs.Fields.Item("TX_ORGAO").Value) & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Incoterm:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_INCOTERM").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Condi&ccedil;&atilde;o de Pagamento:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_TERMO_PAGTO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Valor FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_MLE").Value, 2) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_MOEDA_MLE").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_ACRESCIMO").Value, 2) & "</td>"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_DESCONTO").Value, 2) & "</td>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Motivo Desconto:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("TX_MOTIVO_DESC").Value & "</td>"
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth &">"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Frete:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Frete:</b></td>"	
	End If
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_FRETE_INT").Value, 2) & "</td>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO").Value, 4)& "</td>"
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Seguro:</b></td>"	
	End If
corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_SEGURO").Value, 2) & "</td>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_LIQ").Value, 4) & "</td>"
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_CUBAGEM").Value, 3) & " m³ </td>"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NR_CAIXAS").Value & " Cx(s);" & objrs.Fields.Item("NR_PALLETS").Value  & " Pallet(s);" & objrs.Fields.Item("NR_PACOTES").Value  & " Pct(s); " & objrs.Fields.Item("NR_JUMBOS").Value  & " Jumbo(s);&nbsp;</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("VL_QTD_VOL").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_COMISSAO").Value, 2)&"%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_AGENTE_COMISSAO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_DEP_COLETA").Value & " - " &  objrs.Fields.Item("NM_DEP_COLETA").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Dep. Coleta Transp.:</b</td>"
corpo = corpo &	"			<td class='c2'>" &  objrs.Fields.Item("NM_DEP_COLETA_1").Value &"</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height="&  vl_heigth &">"
corpo = corpo &	"			<td class='c1'><b>Via de Transporte:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_VIA_TRANSPORTE").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Embarcador:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_EMBARCADOR").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Navio:</b></td>"
corpo = corpo &	"			<td class='c2'colspan = '3'>" &  objrs.Fields.Item("NM_EMBARCACAO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Local de Embarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_LOCAL_ORIGEM").Value & "</td>	"
corpo = corpo &	"			<td class='c1'><b>Local de Desembarque:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_LOCAL_DESTINO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="& vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Notify:</b></td>"
corpo = corpo &	"			<td class='c2'>"& objrs.Fields.Item("CD_NOTIFY").Value & " - " & fncTipoPessoaExp(objrs.Fields.Item("CD_NOTIFY").Value, objrs.Fields.Item("TP_NOTIFY").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Consignee:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_CONSIGNATARIO").Value & " - " & fncTipoPessoaExp(objrs.Fields.Item("CD_CONSIGNATARIO").Value, objrs.Fields.Item("TP_CONSIGNEE").Value) & "</td>"
corpo = corpo &	"		</tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Carta de Crédito:</b></td>"
corpo = corpo &	"			<td class='c2'>" & sim_nao(objrs.Fields.Item("IN_CARTA_CREDITO").Value) & "</td>"
corpo = corpo &	"			<td class='c1'><b>Nr. Nota de Crédito:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NR_NOTA_CREDITO").Value & "</td>"
corpo = corpo &	"		</tr>"
	End If
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"		  <td colspan='8' class='c1'><fieldset><legend>Instru&ccedil;&atilde;o Geral:</legend>"
corpo = corpo &	"				" & Replace(Trim(objrs.Fields.Item("TX_INST_EMB").Value), vbcrlf, "<br>") & "</fieldset> </td>"
corpo = corpo &	"	  </tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr>		"
corpo = corpo &	"			<td colspan='8' class='c2'><fieldset><legend>Marca&ccedil;&atilde;o:</legend>"
corpo = corpo &	"				" & Replace(Trim(objrs.Fields.Item("TX_MARCACAO").Value), vbcrlf, "<br>") & "</fieldset></td>"
corpo = corpo & "		</tr>"
	End If
corpo = corpo &	"	</table>"

'exibe os fornecimentos desse rap
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT F.CD_FORNECIMENTO, F.CD_MERCADORIA, F.VL_QTDE, F.QT_CAIXAS, F.TX_UNID_MEDIDA, F.VL_PRECO_UNIT, " &_
			"  ISNULL(F.NR_PROFORMA, '&nbsp;') AS NR_PROFORMA, ISNULL(F.NR_ITEM_CLIENTE, '&nbsp;') AS NR_ITEM_CLIENTE, "&_
			"  ISNULL(AP_MERCADORIA, '&nbsp;') AS NM_MERCADORIA, ISNULL(CD_NCM_SH, '&nbsp;') AS CD_NCM_SH, "&_
			"  ISNULL(CD_NALADI_SH, '&nbsp;') AS CD_NALADI_SH " &_
			"FROM TRAP_FORNECIMENTO F (NOLOCK) " &_
			" LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = F.CD_MERCADORIA) "&_
			" WHERE F.CD_RAP+F.CD_RAP_ANO = '"& vNrRap &"'"&_
			" AND F.CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
			" ORDER BY F.CD_MERCADORIA"
			
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then 

corpo = corpo &	"				<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
corpo = corpo &	"					<tr height='35'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td colspan='9' style='font-size:12px'>Processos Integrados:</td>"
Else
corpo = corpo &	"						<td colspan='9' style='font-size:12px'>Fornecimentos Integrados:</td>"
End If
corpo = corpo &	"					</tr>"
corpo = corpo &	"					<tr height='18'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td class='pgridtit'>Processo</td>"
Else
corpo = corpo &	"						<td class='pgridtit'>Nr. Fornec.</td>"
End if
corpo = corpo &	"						<td class='pgridtit'>Item</td>"
corpo = corpo &	"						<td class='pgridtit'>C&oacute;d. Merc.</td>"
corpo = corpo &	"						<td class='pgridtit'>NCM</td>"
corpo = corpo &	"						<td class='pgridtit'>NALADI</td>"
corpo = corpo &	"						<td class='pgridtit'>Descri&ccedil;&atilde;o</td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"						<td class='pgridtit'>Unid.</td>"
End If
corpo = corpo &	"						<td class='pgridtit'>Qtde.</td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"						<td class='pgridtit'>Valor Un.</td>"
Else
corpo = corpo &	"						<td class='pgridtit'>Valor</td>"
End If
If vInPackList = "1" Then
	corpo = corpo &	"						<td class='pgridtit'>Proforma</td>"
	corpo = corpo &	"						<td class='pgridtit'>Volumes</td>"
End If
corpo = corpo &	"					</tr>"

	Do While Not objrs.Eof
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT DISTINCT CD_VOLUME FROM TRAP_PACK_LIST (NOLOCK) " &_
					" WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' " &_
					" AND CD_MERCADORIA = '"& objrs("CD_MERCADORIA") &"' "&_
					" AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

		vVolume = ""
		Do While Not objrsx.Eof
			vVolume = vVolume&Trim(objrsx.Fields.Item("CD_VOLUME").Value)
			objrsx.MoveNext 
			If objrsx.Eof Then Exit Do else vVolume = vVolume&", "
		Loop

corpo = corpo &	"	<tr height='16' style='text-align: center; vertical-align: top;'>"
corpo = corpo &	"		<td class='pgridsub'><nobr>" & objrs.Fields.Item("CD_FORNECIMENTO").Value & "</nobr></td>"
corpo = corpo &	"		<td class='pgridsub' align='right'><nobr>" & objrs.Fields.Item("NR_ITEM_CLIENTE").Value & "</nobr></td>"
corpo = corpo &	"		<td class='pgridsub'><nobr>" &  objrs.Fields.Item("CD_MERCADORIA").Value & "</td>"
corpo = corpo &	"		<td class='pgridsub'><nobr>" & objrs.Fields.Item("CD_NCM_SH").Value & "</nobr></td>"
corpo = corpo &	"		<td class='pgridsub'><nobr>" &  objrs.Fields.Item("CD_NALADI_SH").Value & "</nobr></td>"
corpo = corpo &	"		<td class='pgridsub' align='left'><nobr>" &  objrs.Fields.Item("NM_MERCADORIA").Value & "</nobr></td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<td class='pgridsub'><nobr>" &  objrs.Fields.Item("TX_UNID_MEDIDA").Value & "</nobr></td>"
End If
  		If session("GrupoUsuario") <> "028" Then 
			corpo = corpo &	"		<td class='pgridsub'><nobr>" &  objrs.Fields.Item("QT_CAIXAS").Value & "</nobr></td>"
         Else 
            corpo = corpo &	"		<td class='pgridsub'><nobr>" &  objrs.Fields.Item("VL_QTDE").Value & "</nobr></td>"
         End If
corpo = corpo &	"		<td class='pgridsub' align='right'><nobr>" & FormatNumber(objrs.Fields.Item("VL_PRECO_UNIT").Value, 2) & "</nobr></td>"
If vInPackList = "1" Then
	corpo = corpo &	"		<td class='pgridsub'><nobr>" & objrs.Fields.Item("NR_PROFORMA").Value & "</nobr></td>"
	corpo = corpo &	"		<td class='pgridsub' align='left'>" &  vVolume & "</td>"
End If
corpo = corpo &	"	</tr>"

		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop

corpo = corpo &	"		  </table>"

End If
objrs.Close()

corpo = corpo &	"		</td>"
corpo = corpo &	"	</tr>"
corpo = corpo &	"</table>"
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"	
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"
corpo = corpo &	"<br>"

			
			If (session("EmailPreAutorizacao")="1" or vInEmail2="1") Then
			Set objEmail = CreateObject("CDO.Message")
			objEmail.From 		= "ti@myindaia.com.br" 
			If session("EmailPreAutorizacaoEmail") <> "" Then
				objEmail.To 		= session("EmailPreAutorizacaoEmail")
			Else
				objEmail.To 		= vEmail
			End If
			objEmail.CC 		= ""
			
			If Session("GrupoUsuario")="241" Then
				objEmail.Subject = "[myIndaiáWeb] Solicitação de Autorização - Processo: "& vNrProcessoRap
			Else
				objEmail.Subject = "[myIndaiáWeb] Solicitação de Autorização - RAP: "& left(vNrRap,6) & "/" & right(vNrRap,2)
			End If
	
			objEmail.MIMEFormatted = true
			objEmail.HTMLBody  	= corpo
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "email-smtp.us-east-1.amazonaws.com"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "AKIAIXMINU4FHLKYYA4Q"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "An+pzxYILW18msI6F+xMvGPlf0oCmYP4hR7Hds3Y0p2f"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
			objEmail.Configuration.Fields.Update
            if SQLSERVER <> "ANTUERPIA" Then
			  objEmail.Send
            End If
			set objEmail = nothing
	    End If	
						
				If (Session("InMostraFollowup") = "1" or vInMostraFollowup = "1") and  right(vNrRap,2) <> "MD" Then				
						sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
							  " ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','005', GETDATE(),'"&Session("cd_usuario")&"')	"
						objcnn.Execute(sql)	  
				End If	
										 		
			End If	
		End If
	End If
	if objrs.State = adStateOpen then objrs.Close()
end if

if vTpAcao = "deletar" then
'Response.Redirect("teste.asp?var1="&vNrRap&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
	'sql = "UPDATE TRAP SET "&_
	'			"		CD_STATUS = '0', CD_USUARIO_CANC = '"& Session("cd_usuario") &"', DT_CANCELADO = GETDATE() " &_
	'			"WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_STATUS = '1'" 
	sql = "DELETE FROM TRAP WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	sql2= "DELETE FROM TRAP_ARQUIVO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	sql3= "DELETE FROM TRAP_DOCUMENTACAO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	sql4= "DELETE FROM TRAP_EMBARQUE WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	

		sql5= "DELETE FROM TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"

	

		sql6= "DELETE FROM TRAP_PACK_LIST WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
		sql7= "DELETE FROM TRAP_PACK_VOLUME WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"

	sql8= "DELETE FROM TRAP_REEMISSAO_DOCTO WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"
	sql9= "DELETE FROM TRAP_FOLLOWUP WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"' AND CD_GRUPO ='"& Trim(Session("GrupoUsuario")) & "'"

	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute sql
	objcnn.Execute sql2
	objcnn.Execute sql3
	objcnn.Execute sql4
	objcnn.Execute sql5
	objcnn.Execute sql6
	objcnn.Execute sql7
	objcnn.Execute sql8
	objcnn.Execute sql9
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
<!--#include virtual="/includes/lay_titleRap.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" type="text/javascript">
<!--
var pesqNrRap, pesqNrCDE, pesqNrFornec, pesqPais;
var vCodUser = '<%= Session("cd_usuario")%>';
var vCargo = '<%=Session("cd_cargo")%>';
var vCodMenu = '<%= cd_menu%>';
var vCodSubm = '<%= cd_subm%>';
var vCodDocto = '<%= cd_docto%>';
var vTpExibe = <%= vTpExibe%>;

function abreIntegra(vInTipo) {	
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 520;
	var vHeight = 300;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=yes,menubar=yes,resizable=no,status=yes";
	window.open('ccexcel.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vnrRap%>&vInTipo='+vInTipo,"integra",features);	

}

function excluiArquivos(arquivo, rap, nAcao) {
	if ( nAcao =='editar' || nAcao == 'novo'){
	alert('Primeiramente, salve a rap em edição!');
	}else{
	if (confirm("Deseja realmente excluir o arquivo "+arquivo+" ?")){
		if (document.getElementById) {
			var ajax = openAjax();
			ajax.open("GET","ccexclui_arquivo.asp?vNrRap="+ rap +"&arquivo="+arquivo, true); 
			ajax.send(null); 
			document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=salvar';
		}
	}
	}
}

function enviaArquivos(vInTipo, nAcao) {
	if (nAcao=='listar' || nAcao == 'editar' || nAcao == 'novo') {
	if ( nAcao =='editar' || nAcao == 'novo'){
	alert('Primeiramente, salve a rap em edição!');
	}else{
	alert('Você deve estar visualizando a instrução para pode enviar um arquivo!');
	}
	}else{	
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 500;
	var vHeight = 100;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=yes,status=no";
	window.open('ccenvia.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vnrRap%>&vInTipo='+vInTipo,"integra",features);	
	}
}

function abreEmbarque() {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 700;
	var vHeight = 500;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=yes,menubar=no,resizable=no,status=yes";
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

function abreImpressaoNota() {
	window.open('ccprint_nota.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>','imprimir','top=100,left=20,width=700,height=600,scrollbars=yes');
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
			if (nAcao=='listar') {alert('Você deve estar visualizando a instrução ou utilizar o comando na coluna "Excluir"!')}
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
			if (nAcao=='listar') {alert('Você deve estar visualizando a instrução ou utilizar o comando na coluna "Duplicar"!')}
			else {document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vNrRap=<%= vNrRap%>&vTpAcao=duplicar';}
		}
	}
	if (nTipo==5) { //botão imprimir
		if (nAcao=='novo') {
			alert('Esta instrução deve ser salva para ser impressa!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar visualizando a instrução para pode imprimir!');}
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
			if (nAcao=='duplicar') document.location='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&vNrRap=<%= vNrRap%>&cd_docto=<%= cd_docto%>&vTpAcao=duplicar';
	}
	
	if (nTipo==10) { //botão novo
		var vLink = 'cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vTpAcao=novo&vInModelo=1'
		if (nAcao=='novo' || nAcao=='editar') {
			if (confirm('Tem certeza que deseja criar um novo modelo?\nOs dados editados na instrução serão perdidos!')) { document.location=vLink;			}
		} else { document.location=vLink; }
	}

    if (nTipo==11) { //botão imprimir
		if (nAcao=='novo') {
			alert('Esta instrução deve ser salva para ser impressa!');
		} else {
			if (nAcao=='listar') {alert('Você deve estar visualizando a instrução para pode imprimir!');}
			else {abreImpressaoNota();}
		}
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
			edtCodFabricante.style.background = "#DEE6EF";
			edtCodFabricante.disabled = true;
		} else {
			edtCodFabricante.style.background = "#FFFFFF";
			edtCodFabricante.disabled = false;
			edtCodFabricante.focus();
		}
	}
}

function MudaDrawback(vCombo) {
	var vValue = vCombo.value;
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
		//document.getElementById('pNrRap').value = 'RAP';
        //document.getElementById('pNrRap').style.color = '#979090';
		document.getElementById('pNrCDE').value = '';
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("GET","cclista.asp?"+vFeatures+"&pNrRap="+pesqNrRap+"&pNrCDE="+pesqNrCDE+"&pNrFornec="+pesqNrFornec+"&pPais="+pesqPais+"&vTpExibe="+vTpExibe, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<div style='position:absolute;top:40%;left:50%;'><center><img src='/imagens/30/<%=bg_loading %>.gif'></center></div>";
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
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
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
	if (vTpAcao=='novo' || vTpAcao=='editar' || vTpAcao=='salvar' || vTpAcao=='duplicar') {
	    
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
				return false;
			}
            
		}
		
		if (vForm.edtCodExportador.value=='' || (vForm.edtCodExportador.value!='' && vForm.edtNmExportador.value=='')) {
			vForm.edtCodExportador.focus();
			vForm.edtCodExportador.background = "red";
			alert('Por favor informe um código de exportador válido!');
			vForm.edtCodExportador.background = "white";
			return false;
		}
		
        
		if ('<%= session("InRapSequencial")%>' == '1' || '<%= Right(vNrRap,2)%>' != 'MD' ){
		if (vForm.edtNrFornec.value=='' || (vForm.edtCodExportador.value!='' && vForm.edtNrFornec.value=='')) {
			vForm.edtNrFornec.focus();
			vForm.edtNrFornec.background = "red";
			alert('Por favor informe um processo!');
			vForm.edtNrFornec.background = "white";
			return false;
		}
		}
		
		
		if ('<%= Request("vInModelo")%>' == '1' || '<%= Right(vNrRap,2)%>' == 'MD'){
		if (vForm.edtCodCliente.value=='' || (vForm.edtCodCliente.value!='' && vForm.edtNmCliente.value=='')) {
			vForm.edtCodCliente.focus();
			vForm.edtCodCliente.background = "red";
			alert('Por favor informe um código de cliente válido!');
			vForm.edtCodCliente.background = "white";
			return false;
		}
		}
		
		if (vForm.vCodViaTransp.value!=4 && (vForm.vIncourrier.value!=1)) {
			alert('A opção de Courrier somente poderá ser marcada quando Via de Transporte aérea.Por favor corrija e tente novamente.!');
		}
        
		/* else {
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
	}
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


function selecionaAmostra(objeto){
	if (objeto.value == '1'){
		document.getElementById('condpag').value = '000013';
		FastLookup('TTERMO_PAGTO','CD_TERMO_PAGTO','NM_TERMO_PAGTO',document.getElementById('condpag'),'edtNmCondPagto');
		document.getElementById('img_edtNmCondPagto').style.visibility = 'hidden';
	}else{
		document.getElementById('condpag').value = '';
		FastLookup('TTERMO_PAGTO','CD_TERMO_PAGTO','NM_TERMO_PAGTO',document.getElementById('condpag'),'edtNmCondPagto');
		document.getElementById('edtNmCondPagto').value = '';
		document.getElementById('img_edtNmCondPagto').style.visibility = 'visible';
	}
}

function campoVazio(objeto, nome, campo){
    objeto.style.color = '#979090';
    objeto.value=nome;
    campo='';
    ExibeListaRap('DivCorpo', 1,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='1';vTpExibe=1;
}

function preenchePesquisa(objeto, tipo){
    if (tipo == '1'){
        pesqNrRap = objeto.value;
        pesqNrCDE = '';
        pesqNrFornec = '';
        pesqPais = '';
    }

    if (tipo == '2'){
        pesqNrRap = '';
        pesqNrCDE = '';
        pesqNrFornec = objeto.value;
        pesqPais = '';
    }

    if (tipo == '3'){
        pesqNrRap = '';
        pesqNrCDE = '';
        pesqNrFornec = '';
        pesqPais = objeto.value;     
    }
}

function limpaCampos(tipo){
    if (tipo == '1'){
        document.getElementById('pNrFornec').value = 'FORNECIMENTO'
        document.getElementById('pNrFornec').style.color = '#979090';        
        document.getElementById('pPais').value = 'PAÍS (RECEBEDOR)';
        document.getElementById('pPais').style.color = '#979090';  
    }

    if (tipo == '2'){
        document.getElementById('pNrRap').value = 'RAP'
        document.getElementById('pNrRap').style.color = '#979090';        
        document.getElementById('pPais').value = 'PAÍS (RECEBEDOR)';
        document.getElementById('pPais').style.color = '#979090';  
    }

    if (tipo == '3'){
        document.getElementById('pNrRap').value = 'RAP'
        document.getElementById('pNrRap').style.color = '#979090';        
        document.getElementById('pNrFornec').value = 'FORNECIMENTO';
        document.getElementById('pNrFornec').style.color = '#979090';      
    }

    if (tipo == '4'){
        document.getElementById('pNrRap').value = 'RAP'
        document.getElementById('pNrRap').style.color = '#979090';        
        document.getElementById('pNrFornec').value = 'FORNECIMENTO';
        document.getElementById('pNrFornec').style.color = '#979090';   
        document.getElementById('pPais').value = 'PAÍS (RECEBEDOR)';
        document.getElementById('pPais').style.color = '#979090';     
        ExibeListaRap('DivCorpo', 1,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='1';vTpExibe=1;
    }

}
-->
</script>
<style type="text/css">
<!--
.c1 {}
.c2 {}
.edtDisabled {
	background-color:#DEE6EF;
	border: solid 1px #336699;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
.edtLabel {
    background-color:transparent;
	border: 0;
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
	border: solid 1px #b4c7db;
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
<body onLoad="PreencheForm('<%= vTpAcao%>', '<%= vTpExibe%>');" style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
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
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: --></td>   
            <div id="dv_corpo" class="divMainTop">                   
		<td width="100%" valign="top" bgcolor="#FFFFFF" style="border:0;padding-left:10px;">             
        <%
				If objrsx.State = adStateOpen then objrsx.Close()	
				sql = "SELECT IN_MODO_SIMPLES, IN_DIVIDE_EMBARCADOS, IN_MOSTRA_FATURADOS, IN_ENVIA_ARQUIVOS, IN_CONFERENCIA, IN_MOSTRA_FOLLOWUP FROM TGRUPO WHERE CD_GRUPO = '" & Session("GrupoUsuario") &  "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				Session("InModoSimplesCheck")      = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
				Session("InDivideEmbarcadosCheck") = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
				Session("InMostraFaturadosCheck")  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
				Session("InEnviaArquivosCheck")    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value	
				Session("InConferenciaCheck")      = objrsx.Fields.Item("IN_CONFERENCIA").Value	
				Session("InMostraFollowupCheck")   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value	
				objrsx.Close	
			%>
		<table width="100%" border="0" cellpadding="0" cellspacing="1">
			<tr height="30">
				<td colspan="15">&nbsp;<font size="2"><b>Instrução de Embarque</b></font><br /><img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="565" border="0"></td>
			</tr>
			<tr height="40">
    <%If Request("vInModelo") = 1 or Right(vNrRap,2) = "MD" Then%>
    <td width="80"><img name="btnListarRap" src="/imagens/30/rap/lista.gif" class="btnImagem" alt="Listar Instruções" onClick="ExecutaAcao(7,'<%= vTpAcao%>');"></td>
    <td width="80"><img name="btnPrintRap" src="/imagens/30/rap/imprimir.gif" class="btnImagem" alt="Imprimir" onClick="ExecutaAcao(5,'<%= vTpAcao%>');"></td>
    <%Else%>        
				<td width="38"><nobr><img name="btnNovaRap" src="/imagens/30/rap/novo.gif" class="btnImagem" alt="Nova Instrução" onClick="ExecutaAcao(0,'<%= vTpAcao%>');"></nobr></td>
<%If vTpAcao="duplicar" then%>
				<td width="38"><input type="image" name="btnSalvar" src="/imagens/30/rap/salvar.gif" class="btnImagem" alt="Salvar cópia desta instrução" onClick = "return verificaSalvar();"></td>
				<input name="checkSubmit" type="hidden" id="checkSubmit" value="duplicar">
				<!--Zera a variável edtCodRap para gravação de instrução duplicada HOJE--> 
				<input name="edtCodRap" type="hidden" id="edtCodRap">
<%else If vTpAcao="listar" or vTpExibe <> 1 then
If vTpExibe <> 1 Then
  'Alterado - 22/12/2008 antigo value=submit'%>
  <td width="38"><input type="image" name="btnSalvar" src="/imagens/30/rap/salvar.gif" class="btnImagem" alt="Esta instrução não pode ser alterada" disabled="true"></td>
  <%else%>
				<td width="38"><input type="image" name="btnSalvar" src="/imagens/30/rap/salvar.gif" class="btnImagem" alt="Você deve estar visualizando a instrução para poder salvá-la" disabled="true"></td>
  <%End If%>              
 <%else%>
 <td width="38"><input type="image" name="btnSalvar" src="/imagens/30/rap/salvar.gif" class="btnImagem" alt="Salvar Edição" onClick = "return verificaSalvar();"></td>
<%end if end if%>				
				<td width="38"><img name="btnCancelar" src="/imagens/30/rap/cancelar.gif" class="btnImagem" alt="Cancelar Edição" onClick="ExecutaAcao(2,'<%= vTpAcao%>');"></td>
				<td width="38"><img name="btnExcluir" src="/imagens/30/rap/lixeira.gif" class="btnImagem" alt="Excluir" onClick="ExecutaAcao(3,'<%= vTpAcao%>');"></td>
				<td width="38"><img name="btnDuplicar" src="/imagens/30/btn_duplicar.gif" class="btnImagem" alt="Duplicar" onClick="ExecutaAcao(4,'<%= vTpAcao%>');"></td>
				<td width="38"><img name="btnPrintRap" src="/imagens/30/rap/imprimir.gif" class="btnImagem" alt="Imprimir" onClick="ExecutaAcao(5,'<%= vTpAcao%>');"></td>                
                <%If Session("InEnviaArquivosCheck") = "1" Then%>
                <% if (not vCdStatus = "2" and not vCdStatus = "3") Then%>
                <td width="38"><img name="btnEnviaArquivos" src="/imagens/30/btn_enviaarquivo.gif" class="btnImagem" alt="Envia Arquivos" onClick="enviaArquivos(0, '<%= vTpAcao%>');"></td>
                <%Else%>
                <td width="38"><img name="btnEnviaArquivos" src="/imagens/30/btn_enviaarquivo.gif" class="btnImagem" alt="Envia Arquivos" onClick="javascript:alert('Este embarque já está autorizado/em andamento!');"></td>
                <%End if%>
                <%End If%>
				<% if vInEmissao and vInAntecipado then %>
        <td width="45"><img name="btnEmissao" src="/imagens/30/btn_emissao.gif" class="btnImagem" alt="Autorizar Emissão de Doctos." onClick="ExecutaAcao(8,'<%= vTpAcao%>');"></td>
        <% end if %>
				<td width="38"><img name="btnAutorizar" src="/imagens/30/btn_autorizar.gif" class="btnImagem" alt="Autorizar Embarque" onClick="ExecutaAcao(6,'<%= vTpAcao%>');"></td>
				<td width="38"><img name="btnListarRap" src="/imagens/30/rap/lista.gif" class="btnImagem" alt="Listar Instruções" onClick="ExecutaAcao(7,'<%= vTpAcao%>');"></td>
				<% if (vTpAcao <> "listar") and vInAntecipado then %>
				<td width="38"><img name="btnListarPE" src="/imagens/30/btn_listartxt.gif" class="btnImagem" alt="Listar Pedidos" onClick="abreIntegraPE('<%= vNrRap %>');"></td> 
				<% end if 
				if vMostrarRemessa and vInAntecipado then %>
  			<td width="38"><img name="btnIntegraRemessa" src="/imagens/30/btn_txt_1.gif" class="btnImagem" alt="Integrar Pedido" onClick="abreIntegra(2);"></td> 
  	  	<% end if 
				if vMostrarTxt and (Session("InFornecimento")="1" or vInFornecimento="1") then %>
                <%If vGrupo = "028" Then%>                
				<td width="38"><img name="btnIntegraForn" src="/imagens/30/btn_txt_1.gif" class="btnImagem" <%If vCodStatus = "1" or vCodStatus = "" Then %>alt="Integrar Fornecimento" onClick="abreIntegra(0);"<%Else%>alt="Este embarque já está autorizado/em andamento!"<%End If%>></td>
                <%Else%>
                <td width="38"><img name="btnIntegraForn" src="/imagens/30/btn_txt_1.gif" class="btnImagem" <%If vCodStatus = "1" or vCodStatus = "" Then %>alt="Integrar Processo" onClick="abreIntegra(3);"<%Else%>alt="Este embarque já está autorizado/em andamento!"<%End If%> ></td>
                <%End If%>
				<% end if 
				 if vMostrarXls and (Session("InPackingList")="1" or vInPackList="1") then %>
				<td width="38"><img name="btnIntegraPack" src="/imagens/30/btn_excel_2.gif" class="btnImagem" <%If vCodStatus = "1" or vCodStatus = "" Then %>alt="Integrar Packing List" onClick="abreIntegra(1);"<%Else %>alt="Este embarque já está autorizado/em andamento!"<%End If %>></td>
                <td width="38"><img name="btnPrintNotaRap" src="/imagens/30/rap/caminhao.gif" class="btnImagem" alt="Controle de Despachos" onClick="ExecutaAcao(11,'<%= vTpAcao%>');" style="width:35px;"></td>
				<% end if 
				'Cria novas colunas dependendo dos botões mostrados
				'If vTpAcao<>"listar" Then
				%>
                <%End If%>
                <td width="70" valign="middle" style="border:0;text-align:center;"><nobr>&nbsp;<b>MODELO:</b>&nbsp;<select name="cmbModeloRap" id="cmbModeloRap" class="select" style="width:230px;" <%If Request("vInModelo") = 1 or Right(vNrRap,2) = "MD" Then%><%Else%>onChange="EscolheModelo('<%= vNrRap%>','<%= vTpAcao%>',this.value);"<%End If%>>
                <option value=""></option>
                 <%
				If objrsx.State = adStateOpen then objrsx.Close()	
				sql = "SELECT CD_RAP+CD_RAP_ANO AS RAP, (SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE) as CLIENTE FROM TRAP R WHERE IN_MODELO = '1' AND R.CD_GRUPO = '" & Session("GrupoUsuario") &  "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				Do While Not objrsx.Eof
				If objrsx.Fields.Item("RAP").Value = vNrRap or objrsx.Fields.Item("RAP").Value = Request("vNrRapModelo") Then
					rap_modelo_selec = "selected"
				Else
					rap_modelo_selec = ""
				End If
				%>
				<option value="<%= objrsx.Fields.Item("RAP").Value%>" <%= rap_modelo_selec%>><%= objrsx.Fields.Item("CLIENTE").Value%></option>
				<%
				objrsx.MoveNext
				if objrsx.Eof then exit do
				Loop 
				%>
				</select>&nbsp;
                <img name="btnEditarModelo" src="/imagens/30/rap/edit16.gif" alt="Editar Modelo" onClick="EditaModelo(document.all.cmbModeloRap.value);" style="cursor:pointer;">&nbsp;
                <img name="btnExcluiModelo" src="/imagens/30/rap/lixeira16.gif" alt="Excluir Modelo" onClick="ExcluiModelo(document.all.cmbModeloRap.value,'<%= vTpAcao%>');" width="16" height="16" style="cursor:pointer;">&nbsp;
                <%If Request("vInModelo") = 1 or Right(vNrRap,2) = "MD" Then%>
                <input type="image" name="btnSalvar" src="/imagens/30/rap/salvar16.gif"  alt="Salvar Modelo" onClick = "return verificaSalvar();" width="16" height="16">
                <%else%>
                <img name="btnSalvaModelo" src="/imagens/30/rap/salvar16.gif" alt="Salvar Modelo" onClick="SalvaModelo('<%= vNrRap%>','<%= vTpAcao%>','<%= vCodCliente%>');" width="16" height="16" style="cursor:pointer;">
                <%End If%>
                &nbsp;<img name="btnNovoModeloRap" src="/imagens/30/add.gif" alt="Novo Modelo" onClick="ExecutaAcao(10,'<%= vTpAcao%>');" style="cursor:pointer;">&nbsp;<nobr></td>
                <%'End If%>
				<td width="33%">&nbsp;</td>
			</tr>
			<%
if vTpAcao = "listar" then
%>
			<tr height="25">
			  <td colspan="15">&nbsp;<img src="/imagens/30/button_view.gif" border="0" align="absmiddle"><font size="2" color="#374BAE">&nbsp;Busca</font>
			   <input name="pNrRap" type="text" id="pNrRap" value="RAP" maxlength="9" class="editbox" style="width:80px;"  onfocus="this.select();" style="color:#979090;"  onKeyDown="limpaCampos('1');this.style.color='#000000';" onchange="if(this.value != ''){preenchePesquisa(this, '1');ExibeListaRap('DivCorpo',5,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='5';vTpExibe=5;}else{campoVazio(this, 'RAP', pesqNrRap);}">&nbsp;&nbsp;               
               <input name="pNrFornec" type="text" id="pNrFornec" value="FORNECIMENTO" maxlength="10" class="editbox" style="width:120px;" onfocus="this.select();" style="color:#979090;"  onKeyDown="limpaCampos('2');this.style.color='#000000';" onchange="if(this.value != ''){preenchePesquisa(this, '2');ExibeListaRap('DivCorpo',5,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='5';vTpExibe=5;}else{campoVazio(this, 'FORNECIMENTO', pesqNrFornec);}">&nbsp;&nbsp;                  
               <input name="pPais" type="text" id="pPais" value="PAÍS (RECEBEDOR)" maxlength="25" class="editbox" style="width:150px;" onfocus="this.select();" style="color:#979090;"  onKeyDown="limpaCampos('3');this.style.color='#000000';" onchange="if(this.value != ''){preenchePesquisa(this, '3');ExibeListaRap('DivCorpo',5,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='5';vTpExibe=5;}else{campoVazio(this, 'PAÍS (RECEBEDOR)', pesqPais);}">&nbsp;
               <img src="/imagens/30/chk_off.gif" border="0" align="absmiddle" alt="Limpar Todos" onclick="limpaCampos('4');" style="cursor:pointer;">&nbsp;
               <b>Status:</b>
			   <select name="cmbExibeInst" id="exibe" class="select" style="width:105px;" onChange="ExibeListaRap('DivCorpo',this.options[this.selectedIndex].value,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');vTpExibe=this.options[this.selectedIndex].value;">
					<option value="0">Canceladas</option>
					<option value="1" selected="selected">Em Aberto</option>
					<option value="2">Autorizadas</option>
					<option value="3">Em Andamento</option>
                    <%If Session("InDivideEmbarcadosCheck") = "1" Then%>
                    <option value="6">Embarcados</option>
                    <%End If%>
                    <%If Session("inMostraFaturadosCheck") = "1" Then%>
					<option value="4">Faturados</option>
                    <%End If%>
				</select>
				<input name="pNrCDE" type="text" id="pNrCDE" maxlength="15" class="editbox" style="width:0px;" onBlur="pesqNrCDE=this.value;" onKeyPress="if(event.keyCode == 13){pesqNrCDE=this.value;ExibeListaRap('DivCorpo',5,'cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>');document.getElementById('cmbExibeInst').value='5';vTpExibe=5;}">				
                <%If Session("cargo_interno") = "1" Then	%>
                &nbsp;<select name="cmbGrupoRap" id="cmbGrupoRap" class="select" style="width:178px;" onChange="MudaGrupo(this);">
                <%
				If objrsx.State = adStateOpen then objrsx.Close()	
				sql = "SELECT CD_GRUPO AS CODIGO, NM_GRUPO AS NOME FROM TGRUPO WHERE CD_GRUPO IN ('028','241','155')"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				Do While Not objrsx.Eof
				If objrsx.Fields.Item("CODIGO").Value = Session("GrupoUsuario") Then
					rap_selec = "selected"
				Else
					rap_selec = ""
				End If
				
				%>
                <option value="<%= objrsx.Fields.Item("CODIGO").Value%>" <%= rap_selec%>><%= objrsx.Fields.Item("NOME").Value%></option>
				<%
				objrsx.MoveNext
				if objrsx.Eof then exit do
				Loop 
				%>
				</select>
                <%End If %></td>
			</tr>
            
<%else%>
			<tr height="25">
				<td colspan="15" style='border:0; font-size:12px;'>
				<%
	if vTpAcao <> "novo" and vTpAcao <> "duplicar" and  Request("vInModelo") <> 1 and Right(vNrRap,2) <> "MD" then
		if vValida then
			If vCdStatus = "2" or vCdStatus = "3" Then
				If vCdStatus = "2" Then
					Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/30/leg_verde2.gif' class='imgValida'> Instrução de Embarque válida e pronta para embarque.</a>")
				Else
					Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/30/leg_azul2.gif' class='imgValida'> Instrução de Embarque válida e pronta para embarque.</a>")
				End If
			Else
				Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/30/leg_amarelo2.gif' class='imgValida'> Instrução de Embarque válida e pronta para embarque.</a>")
			End If
		else
  		if vInAntecipado then
				if vInRemessa then
					If vCdStatus = "2" Then
						Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '1');""><img src='/imagens/30/leg_verde2.gif' class='imgValida'> Instrução de Embarque pronta para Autorização de Emissão de Doctos.</a><br>")
					Else
						Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '1');""><img src='/imagens/30/leg_amarelo2.gif' class='imgValida'> Instrução de Embarque pronta para Autorização de Emissão de Doctos.</a><br>")
					End If
				else
					Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '1');""><img src='/imagens/30/leg_vermelho2.gif' class='imgValida'> Verifique os erros da instrução clicando aqui. (Autorização de Doctos.)</a><br>")
				end if
			end if
			Response.Write("<a href='#' onClick=""ExibeProblemasRap('"&vNrRap&"', '0');""><img src='/imagens/30/leg_vermelho2.gif' class='imgValida'> Verifique os erros da instrução clicando aqui. (Embarque)</a>")
		end if

	end if
%>
				<input type="hidden" name="vNrRap"></td>
			</tr>
			<%
end if
%>
		</table></td>
        </div>
	</tr>
	<tr>
	  <td style="padding-left:10px;"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="divPackList" class="divPackList" style="border-color:<%=topo_div%>;"></div>
			<div id="DivCorpo" class="formClass">
				<%
if vTpAcao <> "listar"  and vTpAcao <> "listarPE" then
	if objrsx.State = adStateOpen then objrsx.Close()	
		sql = " SELECT  TG.IN_MODO_SIMPLES AS IN_MODO_SIMPLES, TG.IN_RAP_SEQUENCIAL AS IN_RAP_SEQUENCIAL, " &_
		" TG.IN_ENVIA_ARQUIVOS AS IN_ENVIA_ARQUIVOS,  TG.IN_MOSTRA_FATURADOS AS IN_MOSTRA_FATURADOS, TG.IN_DIVIDE_EMBARCADOS AS IN_DIVIDE_EMBARCADOS, TG.IN_MOSTRA_FOLLOWUP AS IN_MOSTRA_FOLLOWUP, TG.IN_CONFERENCIA AS IN_CONFERENCIA "&_
		" FROM TGRUPO       TG " &_
		" WHERE  TG.CD_GRUPO='"&session("GrupoUsuario") & "'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

		if objrsx.RecordCount > 0 then
			 vInModoSimples      = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
			 vInRapSequencial    = objrsx.Fields.Item("IN_RAP_SEQUENCIAL").Value
			 vInEnviaArquivos    = objrsx.Fields.Item("IN_ENVIA_ARQUIVOS").Value
			 vInMostraFaturados  = objrsx.Fields.Item("IN_MOSTRA_FATURADOS").Value
			 vInDivideEmbarcados = objrsx.Fields.Item("IN_DIVIDE_EMBARCADOS").Value
			 vInMostraFollowup   = objrsx.Fields.Item("IN_MOSTRA_FOLLOWUP").Value
			 vInConferencia      = objrsx.Fields.Item("IN_CONFERENCIA").Value
			 
			 session("InModoSimples")     = vInModoSimples
			 session("InRapSequencial")   = vInRapSequencial
			 session("InEnviaArquivos")   = vInEnviaArquivos
			 session("InMostraFaturados") = vInMostraFaturados
			 session("InDivideEmbarcados")= vInDivideEmbarcados
			 session("InMostraFollowup")  = vInMostraFollowup
			 session("InConferencia")     = vInConferencia
		End If	 
	if vTpAcao = "novo" then 
		if session("InRapSequencial") = "1"  or Request("vInModelo") = 1 Then
			If objrsx.State = adStateOpen then objrsx.Close()	
			sql = " select MAX (RTRIM(LTRIM(CD_RAP)) + RTRIM(LTRIM(CD_RAP_ANO))) AS ULTIMA_RAP"&_
			" FROM TRAP "&_
			" WHERE CD_GRUPO = '" & session("GrupoUsuario") & "'"
			
			If Request("vInModelo") = 1 Then
				sql = sql & " AND IN_MODELO='1'"
			else
				sql = sql & " AND ISNULL(IN_MODELO,'0') <> '1'"&_
				" AND RTRIM(LTRIM(CD_RAP_ANO)) = '" & Right(Year(Date),2) & "'"
			End If
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If fnc_TestaVar(objrsx.Fields.Item("ULTIMA_RAP").Value) Then
				vNrRap = Left(objrsx.Fields.Item("ULTIMA_RAP").Value, 6) + 1 
				vNrRap = vNrRap & Right(Trim(objrsx.Fields.Item("ULTIMA_RAP").Value), 2)
				vNrRap = fnc_AddZeros(vNrRap,8)
			Else
				If Request("vInModelo") = 1 Then
				vNrRap           = "000001MD"
				Else
				vNrRap           = "000001" & Right(Year(Date),2)
				vNrRap = fnc_AddZeros(vNrRap,8)
				End If
			End If
		Else
			vNrRap           = ""
		End If
		vCodExportador   = ""
		vCodLogomarca    = ""
		vCodFabricante   = ""
		vCodCliente      = ""
		vCodPais         = ""
		vCodCondPagto    = ""
		vCodAgenteComissao = ""
		vCodIncoterm     = ""
		vCodDepColeta    = ""
		vCodDepColeta1   = ""
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
        vNrNotasFiscais  = ""
        vNrEasy          = ""
		vNrCDE           = ""
		vNrVoo           = ""
		vNrViagem        = ""
		vNrAtoDrawback   = ""
		vNrInspecao      = ""
		vNrNotaCredito   = ""
		vInCourrier      = 0
		vInFabrExpo      = 0
		vInTriangulacao  = 0
		vInPermisso      = 0
		vInEmbalagem     = 0
		vInConsulado     = 0
		vInPalletExpurgo = 0
		vInExpurgo       = 0
		vInInspecao      = 0
        vInSemPackList   = 0
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
		Session("status_rap") = "criacao"
		
	else
		if vTpAcao = "duplicar" then 
			if session("InRapSequencial") = "1" Then
				If objrsx.State = adStateOpen then objrsx.Close()	
				sql = " select MAX (RTRIM(LTRIM(CD_RAP)) + RTRIM(LTRIM(CD_RAP_ANO))) AS ULTIMA_RAP"&_
				" FROM TRAP "&_
				" WHERE CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
				" AND ISNULL(IN_MODELO,'0') <> '1'"&_
				" AND RTRIM(LTRIM(CD_RAP_ANO)) = '" & Right(Year(Date),2) & "'"
				
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				If fnc_TestaVar(objrsx.Fields.Item("ULTIMA_RAP").Value) Then
					vNrRap_2 = Left(objrsx.Fields.Item("ULTIMA_RAP").Value, 6) + 1 
					vNrRap_2 = vNrRap_2 & Right(Trim(objrsx.Fields.Item("ULTIMA_RAP").Value), 2)
					vNrRap_2 = fnc_AddZeros(vNrRap_2,8)
				Else
					vNrRap_2           = "000001" & Right(Year(Date),2)
					vNrRap_2 = fnc_AddZeros(vNrRap_2,8)
				End If
			Else
				vNrRap_2           = ""
			End If
		
		
		End If
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT CD_RAP, CD_RAP_ANO,IN_COURRIER, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO, "&_
					"  CD_EXPORTADOR, CD_LOGOMARCA, CD_FABRICANTE, CD_CLIENTE, CD_PAIS, CD_TERMO_PAGTO, CD_AGENTE_COMISSAO, "&_
					"  CD_INCOTERM, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_LOCAL_COLETA, CD_TERMINAL, CD_VIA_TRANSPORTE, CD_EMBARCADOR, CD_EMBARCACAO, "&_
					"  CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_NOTIFY, CD_CONSIGNATARIO, CD_BANCO, CD_FORMA_PAGAR, CD_MOEDA_MLE, "&_
					"  NR_FORNECIMENTO, NR_NOTAS_FISCAIS, NR_EASY, NR_CDE, NR_VOO, NR_VIAGEM, NR_ATO_CONCESSORIO, NR_INSPECAO, NR_NOTA_CREDITO, "&_
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
					"  ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL,  CAST(IN_SEM_PACK_LIST as int) AS IN_SEM_PACK_LIST, "&_
                    "  ISNULL(NR_CAIXAS, 0) AS NR_CAIXAS, ISNULL(NR_PALLETS, 0) AS NR_PALLETS, ISNULL(NR_JUMBOS, 0) AS NR_JUMBOS, ISNULL(NR_PACOTES, 0) AS NR_PACOTES, ISNULL(NR_BIG_BAGS, 0) AS NR_BIG_BAGS, ISNULL(NR_BIG_BAGS_PALLETS, 0) AS NR_BIG_BAGS_PALLETS "&_
					"  FROM TRAP (NOLOCK) "&_
                    "  WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"&_ 
		  			"  AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
		vCodDepColeta1   = objrs.Fields.Item("NM_DEP_COLETA_1").Value
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
        vNrNotasFiscais  = Trim(objrs.Fields.Item("NR_NOTAS_FISCAIS").Value)
        vNrEasy          = Trim(objrs.Fields.Item("NR_EASY").Value)
		vNrCDE           = Trim(objrs.Fields.Item("NR_CDE").Value)
		vNrVoo           = Trim(objrs.Fields.Item("NR_VOO").Value)
		vNrViagem        = Trim(objrs.Fields.Item("NR_VIAGEM").Value)
		vNrAtoDrawback   = Trim(objrs.Fields.Item("NR_ATO_CONCESSORIO").Value)
		vNrInspecao      = Trim(objrs.Fields.Item("NR_INSPECAO").Value)
		vNrNotaCredito   = Trim(objrs.Fields.Item("NR_NOTA_CREDITO").Value)
		vInCourrier      = objrs.Fields.Item("IN_COURRIER").Value 'IN_COURRIER [Incluído em 20/08/2008 Flávio]
		vInFabrExpo      = objrs.Fields.Item("IN_FABR_EXPO").Value
		vInTriangulacao  = objrs.Fields.Item("IN_TRIANGULACAO").Value
		vInPermisso      = objrs.Fields.Item("IN_PERMISSO").Value
		vInEmbalagem     = objrs.Fields.Item("IN_DECL_EMBALAGEM").Value
		vInConsulado     = objrs.Fields.Item("IN_CONSULADO").Value
		vInPalletExpurgo = objrs.Fields.Item("IN_PALLET_EXPURGO").Value
		vInExpurgo       = objrs.Fields.Item("IN_EXPURGO").Value
		vInInspecao      = objrs.Fields.Item("IN_INSPECAO").Value
        vInSemPackList   = objrs.Fields.Item("IN_SEM_PACK_LIST").Value
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

        vNrCaixas     = objrs.Fields.Item("NR_CAIXAS").Value		
        vNrPallets     = objrs.Fields.Item("NR_PALLETS").Value		
        vNrJumbos     = objrs.Fields.Item("NR_JUMBOS").Value		
        vNrPacotes     = objrs.Fields.Item("NR_PACOTES").Value		
        vNrBigBags     = objrs.Fields.Item("NR_BIG_BAGS").Value		
        vNrBigBagsPallets     = objrs.Fields.Item("NR_BIG_BAGS_PALLETS").Value		

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
				vTpStatus2 = "Cancelada " 
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_CANCELADO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_CANC").Value
			case 1
				vTpStatus = "Abertura: "
				vTpStatus2 = "Criada " 
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_INSERCAO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_CRIADOR").Value
			case 2, 3
				vTpStatus = "Autorizado: "
				vTpStatus2 = "Autorizada "
				vDtStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 5)
				vHrStatus = fnc_Mascara(objrs.Fields.Item("DT_FINALIZADO").Value, 7)
				vUsStatus = objrs.Fields.Item("CD_USUARIO_FIM").Value
			case else
				vTpStatus = ""
				vTpStatus2 = ""
				vDtStatus = ""
				vHrStatus = ""
				vUsStatus = Session("cd_usuario")
		end select
		'objrs.Close()
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
								<input name="edtCodRap2" type="text" class="editbox" id="rap" style="width: 100px;" tabindex="1"  size="6" maxlength="6" onKeyPress="if (event.keyCode==47){event.keyCode = '';document.getElementById('edtCodRapAno').focus();}" onBlur="verificaRap_Ano(edtCodRapAno)" onFocus="this.select();" <% If session("InRapSequencial") = "1"  Then%> readonly <%End If%>>
								<%else%>
								<input name="edtCodRap" type="text" class="editbox" id="rap" style="width: 100px;" tabindex="1"  size="6" maxlength="6" onKeyPress="if (event.keyCode==47){event.keyCode = '';document.getElementById('edtCodRapAno').focus();}" onBlur="verificaRap_Ano(edtCodRapAno)" onFocus="this.select();" <% If session("InRapSequencial") = "1" or Request("vInModelo") = 1 Then%> readonly <%End If%>>
					    	<script>//alert('NOVO!')</script>
					        	<%end if%>
							/
								<input name="edtCodRapAno" type="text" class="editbox" id="edtCodRapAno" style="width: 25px;" tabindex="1" size="2" maxlength="2" onFocus="this.select();" onBlur="FastLookup('TRAP','CD_RAP','rap',this,'edtRespostaRap');">&nbsp;&nbsp;<input type="text" class="edtlabel" style="width: 87px;" name='edtRespostaRap' readonly></td>
								<td class="c1"><label class="label"></label></td>
								<td class="c2">&nbsp;</td>
								<%'Response.Redirect("teste.asp?var1="&vedtCodRap&"&var2="&vedtCodRapAno&"&var3="&vnrrap&"")
								if session("InRapSequencial") <> "1" and  Request("vInModelo") <> 1 Then
								%>

					    	<script>alert('Digite um novo Nr. de Instrução/CDE!');</script>
					<%
					end if
					else%>
								<td colspan="3" class="c2"><input name="edtCodRap" type="text" class="editbox" id="rap" style="width: 150px;" tabindex="1" size="6" maxlength="6" readonly >
								<input name="edtCodRapAno" type="text" class="editbox" id="edtCodRapAno" style="width: 25px;" tabindex="1" size="2" maxlength="2"  readonly> &nbsp;&nbsp;<%= vTpStatus2%> por <%= fnc_ConsultaLookup("TUSUARIO", "CD_USUARIO", vUsStatus, "NM_USUARIO")%> em <%= vDtStatus%>&nbsp;<%= Left(vHrStatus, 5)%></td>
					    	<script>//alert('EDITAR!')</script>
<%end if%>
					</tr>
                    <% If Session("InModoSimples")<>"1" Then%>
					<tr height="<%= vl_heigth%>">
						<td class="c1" colspan="2"><b><nobr>Sem Fornecimento/Packing List? (Amostra)</nobr></b></td>
                 		<td class="c2" colspan="2"><input name="rdgInAmostra" type="radio" id="nao10" tabindex="3" value="0" onBlur="RapAcao('<%= vTpAcao%>');" onClick="selecionaAmostra(this);">
								<label class="label" for="nao10">N&atilde;o</label>
								<input name="rdgInAmostra" type="radio" id="sim10" value="1" onBlur="RapAcao('<%= vTpAcao%>');" onClick="selecionaAmostra(this);">
								<label class="label" for="sim10">Sim</label></td>
                                
                                <td class="c1" style="display:none;" ><b>Antecipado?</b></td>
						<td class="c2" style="display:none;;" ><input name="rdgInAntecipado" type="radio" id="nao11" tabindex="4" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao11">N&atilde;o</label>
								<input name="rdgInAntecipado" type="radio" id="sim11" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim11">Sim</label></td>

                                
					</tr>
                    <tr height="<%= vl_heigth%>">
                        <td class="c1" colspan="2"><b><nobr>Sem Integração de Packing List?</nobr></b></td>
                 		<td class="c2" colspan="2"><input name="rdgInSemPackList" type="radio" id="nao100" tabindex="3" value="0" onBlur="RapAcao('<%= vTpAcao%>');" >
								<label class="label" for="nao100">N&atilde;o</label>
								<input name="rdgInSemPackList" type="radio" id="sim100" value="1" onBlur="RapAcao('<%= vTpAcao%>');" >
								<label class="label" for="sim100">Sim</label></td>
                    </tr>
                    <%End If%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="exp">Exportador:</label></td>
						<td class="c2" <% If Session("InModoSimples")="1" Then%> colspan="3" <%End If%>><nobr>
							<input name="edtCodExportador" type="text" class="editbox" id="exp" style="width: 40px;" tabindex="5" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmExportador');" maxlength="5">
							<input type='text' name='edtNmExportador' class='edtDisabled' readonly>
							<%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(4,'Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','edtCodExportador','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','','edtCodExportador');"
	end if
%>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmExportador" width="16" height="16" border="0" align="absmiddle" id="img_edtNmExportador" style="cursor: hand;" onClick="<%= str%>"></nobr></td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="c1"><label class="label" for="logo">Logomarca:</label></td>
						<td class="c2"><select name="cmbCodLogomarca" class="select" id="logo" style="width:220px;" tabindex="6" onBlur="RapAcao('<%= vTpAcao%>');">
								<option value=""></option>
								<%= fncCriaOption("logo_saint")%>
						</select></td>
                        <%End If%>
					</tr>
					
					<tr height="<%= vl_heigth%>">
						<td <% If Session("InModoSimples")="1" Then%>rowspan="2"<%Else%>rowspan="3"<%End If%> class="c1"><label class="label" for="fornec">
						<%If Session("GrupoUsuario")="241" Then%>
							<%If Not Session("cargo_interno") = "1" Then%>
                            Processo:
                            <%Else%>
                            Nr. Fornecimento/<br>Processo
                            <%End If%>
						<%Else%>
							<%If Not Session("cargo_interno") = "1" Then%>
                            Nr. Fornecimento:
                            <%Else%>
                            Nr. Fornecimento/<br>Processo:
                            <%End If%>
						<%End If%></label></td>
						<td <% If Session("InModoSimples")="1" Then%>rowspan="2"<%Else%>rowspan="3"<%End If%> valign="baseline" class="c2"><p>
						<% If Session("InModoSimples")<>"1" Then%><br><%End If%>
						    <textarea name="edtNrFornec" wrap="virtual" class="editbox" id="fornec" cols="30" rows="5" style="width:232px;height:<% If Session("InModoSimples")<>"1" Then%>70px<%Else%>35px<%End If%>;text-transform:uppercase;" tabindex="9" onChange="ApenasNumero(this,';');" onBlur="RapAcao('<%= vTpAcao%>');"></textarea>
						<% If Session("InModoSimples")<>"1" Then%><br><%End If%>
                        </td>
                        <% If Session("InModoSimples")<>"1" Then%>
					  <td class="c1" height="<%= vl_heigth%>"><label class="label" for="dtfat"><b>Fabr. &eacute; o Exportador?</b></label></td>
						<td class="c2"><input name="rdgInFabrExpo" type="radio" id="nao0" tabindex="7" onClick="document.frmIntegraRap.edtCodFabricante.focus();" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
                          <label class="label" for="nao0">N&atilde;o</label>
                          <input name="rdgInFabrExpo" type="radio" id="sim0" onClick="document.frmIntegraRap.edtCodFabricante.focus();" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
                          <label class="label" for="sim0">Sim</label></td>
                          <%End If%>
					</tr>
                     
					<tr height="<%= vl_heigth%>">
					  <td class="c1"><span class="label">Fabricante:</span></td>
				      <td class="c2"><input name="edtCodFabricante" type="text" class="editbox" id="fab" style="width: 40px;" tabindex="8" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmFabricante');" maxlength="5">
                        <input type="text" name="edtNmFabricante" readonly class='edtDisabled'>
                        <%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(4,'C&oacute;digo,Descri&ccedil;&atilde;o,Apelido,Endere&ccedil;o,CNPJ','CD_EMPRESA','edtCodFabricante','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','C&oacute;digo,Descri&ccedil;&atilde;o,Apelido,Endere&ccedil;o,CNPJ','CD_EMPRESA','','edtCodFabricante');"
	end if
%>
                        <img src="/imagens/30/btn_folder.gif" alt="Consulta por descri&ccedil;&atilde;o" name="img_edtNmFabricante" width="16" height="16" border="0" align="absmiddle" id="img_edtNmFabricante" style="cursor: hand;" onClick="<%= str%>"></td>
				  </tr>
					<tr height="<%= vl_heigth%>">
					  <td class="c1" ><strong>Dt. Faturamento:</strong></td>
				      <td class="c2"><input name="edtDtFaturamento" type="text" class="editbox" id="edtDtFaturamento" style="width: 214px;" tabindex="8" onKeyPress="return(MascaraData(this,'/',event));" onBlur="RapAcao('<%= vTpAcao%>');">
                        <img src="/imagens/30/calenda.gif" alt="" width=16 height=16 border=0 align="absmiddle" id="btnDtFaturamento"></td>
				  </tr>
                  <% If Session("InModoSimples")<>"1" Then%>

					<tr height="<%= vl_heigth%>">
						<td class="c1" ><b><nobr>Notas Fiscais</nobr></b></td>
                 		<td class="c2" >
                        <textarea name="edtNrNotasFiscais" wrap="virtual" class="editbox" id="fiscal" cols="30" rows="5" style="width:232px;height:70px;text-transform:uppercase;" tabindex="9" onChange="ApenasNumero(this,';');" onBlur="RapAcao('<%= vTpAcao%>');"></textarea>
                        </td>
                        <td class="c1" ><b><nobr>Easy</nobr></b></td>
                 		<td class="c2" >
                        <textarea name="edtNrEasy" wrap="virtual" class="editbox" id="easy" cols="30" rows="5" style="width:232px;height:70px;text-transform:uppercase;" tabindex="9" onChange="ApenasNumero(this,';');" onBlur="RapAcao('<%= vTpAcao%>');"></textarea>
                        </td>                                
					</tr>
                    <%End If%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="cliente">Cliente:</label></td>
						<td class="c2"><nobr>
                        <% If Request("vInModelo") = 1 and  vTpAcao <> "novo" Then %>
							<input name="edtCodCliente" type="text" class="editbox" id="cliente" style="width: 40px;" tabindex="11" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmCliente');" maxlength="5" readonly>
                        <%Else%>
                        <input name="edtCodCliente" type="text" class="editbox" id="cliente" style="width: 40px;" tabindex="11" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmCliente');" maxlength="5" >
                        <%End If%>    
							<input type="text" name="edtNmCliente" readonly class='edtDisabled'>
							<%
	If Request("vInModelo") = 1 and  vTpAcao <> "novo" Then 
		str=""						
		Else
		if Not Session("cargo_interno") = "1" then
			str = "ConsultaOnLineSQL(6,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodCliente','');"
		else
			str = "ConsultaOnLineSQL(0,'MyIndaiá,SAP,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodCliente',edtCodExportador.value);"
		end if
	End If
%>	
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmCliente" width="16" height="16" border="0" align="absmiddle" id="img_edtNmCliente" style="cursor: hand;" onClick="<%= str%>"></nobr></td>
						<td class="c1"><label class="label" for="pais">Pa&iacute;s de Destino:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodPais" type="text" class="editbox" id="pais" style="width: 40px;" tabindex="12" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TPAIS','CODIGO','DESCRICAO',this,'edtNmPais');" maxlength="3">
							<input type="text" name="edtNmPais" readonly class='edtDisabled'>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmPais" width="16" height="16" border="0" align="absmiddle" id="img_edtNmPais" style="cursor: hand;" onClick="ConsultaOnLine('TPAIS','CODIGO,DESCRICAO','Código,Descrição','CODIGO','','edtCodPais');"></nobr></td>
					</tr>
                    <% If Session("InModoSimples")<>"1" Then%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="dtemb">Dt. Acordada de Embarque:</label></td>
						<td class="c2"><input name="edtDtEmbarque" type="text" class="editbox" id="edtDtEmbarque" style="width: 214px;" tabindex="11" onKeyPress="return(MascaraData(this,'/',event));" onBlur="RapAcao('<%= vTpAcao%>');">
								<img id="btnDtEmbarque" height=16 width=16 border=0 src="/imagens/30/calenda.gif" align="absmiddle"></td>
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="drawback">Drawback</label></td>
						<td class="c2"><select name="cmbTpDrawback" class="select" id="drawback" style="width:214px;" tabindex="15" onChange="MudaDrawback(this);" onBlur="RapAcao('<%= vTpAcao%>');">
								<%= fncCriaOption("drawback")%>
						</select></td>
						<td class="c1"><label class="label" for="edtNrAtoDrawback">Nr. Ato Consessório</label></td>
						<td class="c2"><input name="edtNrAtoDrawback" type="text" class="editbox" sid="edtNrAtoDrawback" style="width:214px;text-transform:uppercase;" tabindex="16" maxlength="13" onBlur="RapAcao('<%= vTpAcao%>');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Permisso?</b></td>
						<td class="c2"><input name="rdgInPermisso" type="radio" id="nao2" tabindex="17" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao2">N&atilde;o</label>
								<input name="rdgInPermisso" type="radio" id="sim2" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim2">Sim</label></td>
						<td class="c1"><b>Processo com triangulação?</b></td>
						<td class="c2"><input name="rdgInTriangulacao" type="radio" id="nao1" tabindex="18" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao1">Não</label>
								<input name="rdgInTriangulacao" type="radio" id="sim1" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim1">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Consulado?</b></td>
						<td class="c2"><input name="rdgInConsulado" type="radio" id="nao4" tabindex="19" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao4">N&atilde;o</label>
								<input name="rdgInConsulado" type="radio" id="sim4" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim4">Sim</label></td>
						<td class="c1"><b>Declara&ccedil;&atilde;o de Embalagem?</b></td>
						<td class="c2"><input name="rdgInEmbalagem" type="radio" id="nao3" tabindex="20" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao3">N&atilde;o</label>
								<input name="rdgInEmbalagem" type="radio" id="sim3" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim3">Sim</label></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Pallet Expurgado?</b></td>
						<td class="c2"><input name="rdgInPalletExpurgo" type="radio" id="nao5" tabindex="21" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao5">N&atilde;o</label>
								<input name="rdgInPalletExpurgo" type="radio" id="sim5" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim5">Sim</label></td>
						<td class="c1"><label class="label" for="nrinspecao"><b>Certificado de Expurgo?</b></label></td>
						<td class="c2"><input name="rdgInExpurgo" type="radio" id="nao6" tabindex="22" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao6">N&atilde;o</label>
								<input name="rdgInExpurgo" type="radio" id="sim6" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim6">Sim</label></td>
					</tr>
                   <%End if%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Inspe&ccedil;&atilde;o?</b></td>
						<td class="c2"><input name="rdgInInspecao" type="radio" id="nao7" tabindex="23" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao7">N&atilde;o</label>
								<input name="rdgInInspecao" type="radio" id="sim7" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim7">Sim</label></td>
						<td class="c1"><label class="label" for="edtNrInspecao">Nr. de Inspe&ccedil;&atilde;o:</label></td>
						<td class="c2"><input name="edtNrInspecao" type="text" class="editbox" id="edtNrInspecao" style="width:214px;text-transform:uppercase;" tabindex="24" maxlength="10" onBlur="RapAcao('<%= vTpAcao%>');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
						<td class="c1"><label class="label" for="orgao">&Oacute;rg&atilde;o de Inspe&ccedil;&atilde;o:</label></td>
						<td class="c2"><input name="edtTxOrgao" type="text" class="editbox" id="orgao" style="width:214px;text-transform:uppercase;" tabindex="25" maxlength="100" onBlur="RapAcao('<%= vTpAcao%>');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="incoterm">Incoterm:</label></td>
						<td class="c2"><select name="cmbCodIncoterm" class="select" id="incoterm" style="width: 214px;" tabindex="26" onBlur="RapAcao('<%= vTpAcao%>');" onChange="verificaFrete(this.value,1);">
								<option value="">&nbsp;</option>
								<!--#include virtual="/selects/option_incoterm.txt"-->
						</select></td>
						<td class="c1"><label class="label" for="label">Condi&ccedil;&atilde;o de Pagamento:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodCondPagto" type="text" class="editbox" id="condpag" style="width: 40px;" tabindex="27" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TTERMO_PAGTO','CD_TERMO_PAGTO','NM_TERMO_PAGTO',this,'edtNmCondPagto');" maxlength="6">
							<input type="text" name="edtNmCondPagto" readonly class='edtDisabled' id="edtNmCondPagto">
							<%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(7,'Código,Descrição','CD_TERMO_PAGTO','edtCodCondPagto','');"
	else
		str = "ConsultaOnLine('TTERMO_PAGTO','CD_TERMO_PAGTO,NM_TERMO_PAGTO','Código,Descrição','CD_TERMO_PAGTO','','edtCodCondPagto');"
	end if
%>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmCondPagto" width="16" height="16" border="0" align="absmiddle" id="img_edtNmCondPagto" style="cursor: hand;" onClick="<%= str%>"></nobr></td>
					</tr>
                    
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlmle">Valor FOB:</label></td>
						<td class="c2"><input name="edtVlMLE" type="text" class="editbox" id="vlmle" style="width: 214px;" tabindex="28" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
						<td class="c1"><label class="label" for="moeda">Moeda FOB:</label></td>
						<td class="c2"><input name="edtCodMoedaMLE" type="text" class="editbox" id="moeda" style="width: 40px;" tabindex="29" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TMOEDA_BROKER','CD_MOEDA','NM_MOEDA',this,'edtNmMoedaMLE');" maxlength="3">
								<input type="text" name="edtNmMoedaMLE" readonly class='edtDisabled'>
								<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmMoedaMLE" width="16" height="16" border="0" align="absmiddle" id="img_edtNmMoedaMLE" style="cursor: hand;" onClick="ConsultaOnLine('TMOEDA_BROKER','CD_MOEDA,NM_MOEDA','Código,Descrição','CD_MOEDA','','edtCodMoedaMLE');"></td>
     				</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlacres">Acréscimo:</label></td>
						<td class="c2"><input name="edtVlAcrescimo" type="text" class="editbox" id="vlacres" style="width: 214px;" tabindex="30" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
                   <% If Session("InModoSimples")<>"1" Then%>     
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
                    <% End If%>
						<td class="c1"><label class="label" for="vldesc">Desconto:</label></td>
						<td class="c2" <% If Session("InModoSimples")="1" Then%>colspan="3"<%End if%>><input name="edtVlDesconto" type="text" class="editbox" id="vldesc" style="width: 214px;" tabindex="31" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="c1"><label class="label" for="edtTxMotivoDesc">Motivo Desconto:</label></td>
						<td class="c2"><input name="edtTxMotivoDesc" type="text" class="editbox" id="edtTxMotivoDesc" style="width:214px;text-transform:uppercase;" tabindex="32" maxlength="255" onBlur="RapAcao('<%= vTpAcao%>');"></td>
                        <%End If%>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="vlfrete">Valor Frete:</label></td>
						<td class="c2"><input name="edtVlFreteInt" type="text" class="editbox" id="vlfrete" style="width: 214px;" tabindex="33" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);" onFocus="verificaFrete(document.getElementById('cmbCodIncoterm').value,2);"></td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="c1"><label class="label" for="vlpb">Peso Bruto:</label></td>
						<td class="c2"><input name="edtVlPesoBruto" type="text" class="editbox" id="vlpb" style="width: 214px;" tabindex="34" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>	
                        <%End if%>	
                     <% If Session("InModoSimples")<>"1" Then%>   				
					</tr>
					<tr height="<%= vl_heigth%>">
                    <%End If%>
						<td class="c1"><label class="label" for="seguro">Valor Seguro:</label></td>
						<td class="c2"><input name="edtVlSeguro" type="text" class="editbox" id="seguro" style="width: 214px;" tabindex="35" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);" onFocus="verificaFrete(document.getElementById('cmbCodIncoterm').value,2);"></td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="c1"><label class="label" for="vlpl">Peso L&iacute;quido:</label></td>
						<td class="c2"><input name="edtVlPesoLiq" type="text" class="editbox" id="vlpl" style="width: 214px;" tabindex="36" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
                        <% End If %>
					</tr>
                    <% If Session("InModoSimples")<>"1" Then%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="cubagem">Cubagem:</label></td>
						<td class="c2"><input name="edtVlCubagem" type="text" class="editbox" id="cubagem" style="width: 214px;" tabindex="37" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
						<td class="c1">&nbsp;</td>
						<td class="c2">&nbsp;</td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="edtTxEmbalagem">Embalagens:</label></td>
						<td class="c2"><input name="edtNrCaixas" type="text" class="editbox" id="edtNrCaixas" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:60px">&nbsp;Cx(s)</label>
                        <input name="edtNrPallets" type="text" class="editbox" id="edtNrPallets" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:60px">&nbsp;Pallet(s)</label><br />
                        <input name="edtNrPacotes" type="text" class="editbox" id="edtNrPacotes" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:60px">&nbsp;Pct(s)</label>
                        <input name="edtNrJumbos" type="text" class="editbox" id="edtNrJumbos" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:60px">&nbsp;Jumbo(s)</label><br />
                        <input name="edtNrBigBags" type="text" class="editbox" id="edtNrBigBags" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:60px">&nbsp;Big Bag(s)</label>                        
                        <input name="edtNrBigBagsPallets" type="text" class="editbox" id="edtNrBigBagsPallets" style="width:25px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');"><label style="width:110px">&nbsp;Big Bag(s) Pallet(s)</label>                                                
                        <input name="edtTxEmbalagem" type="text" class="editbox" id="edtTxEmbalagem"  value="<%=vTxEmbalagem%>" style="width:0px;text-transform:uppercase;visibility:hidden;" tabindex="38" maxlength="255" onBlur="RapAcao('<%= vTpAcao%>');">
                        </td>
						<td class="c1"><label class="label" for="edtVlQtdVolume">Qtde. Volumes:</label></td>
						<td class="c2"><input name="edtVlQtdVolume" type="text" class="editbox" id="edtVlQtdVolume" style="width:214px;" tabindex="39" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="comissao">Comiss&atilde;o:</label></td>
						<td class="c2"><input name="edtVlComissao" type="text" class="editbox" id="comissao" style="width: 40px;" tabindex="40" onBlur="RapAcao('<%= vTpAcao%>');ValidaValor(this);">
							&nbsp;%
							<input name="rdgCodFormaPagar" type="radio" id="grafica" tabindex="41" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
							<label for="grafica">Gráfica</label>
							/
							<input name="rdgCodFormaPagar" type="radio" id="remeter" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
							<label for="remeter">A Remeter</label></td>
						<td class="c1"><label class="label" for="agentec">Agente Comiss&atilde;o:</label></td>
						<td class="c2"><input name="edtCodAgenteComissao" type="text" class="editbox" id="agentec" style="width: 40px;" tabindex="42" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_EST','CD_EMPRESA','NM_EMPRESA',this,'edtNmAgenteComissao');" maxlength="5">
								<input type="text" name="edtNmAgenteComissao" readonly class='edtDisabled'>
								<%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(8,'Código,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodAgenteComissao','');"
	else
		str = "ConsultaOnLineSQL(3,'Código,Descrição,Apelido,Endereço','CD_EMPRESA','edtCodAgenteComissao','');"
	end if
%>
								<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmAgenteComissao" width="16" height="16" border="0" align="absmiddle" id="img_edtNmAgenteComissao" style="cursor: hand;" onClick="<%= str%>"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="coleta">Dep. Coleta:</label></td>
						<td class="c2"><input name="edtCodDepColeta" type="text" class="editbox" id="coleta" style="width: 40px;" tabindex="43" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMPRESA_NAC','CD_EMPRESA','NM_EMPRESA',this,'edtNmDepColeta');" maxlength="5">
								<input type="text" name="edtNmDepColeta" readonly class='edtDisabled'>
								<%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(4,'Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','edtCodDepColeta','');"
	else
		str = "ConsultaOnLine('TEMPRESA_NAC','CD_EMPRESA,NM_EMPRESA,AP_EMPRESA,END_EMPRESA,CGC_EMPRESA','Código,Descrição,Apelido,Endereço,CNPJ','CD_EMPRESA','','edtCodDepColeta');"
	end if
%>
								<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmDepColeta" width="16" height="16" border="0" align="absmiddle" id="img_edtNmDepColeta" style="cursor: hand;" onClick="<%= str%>"></td>
						<td class="c1"><label class="label" for="coleta">Dep. Coleta Transp.:</label></td>
						<td class="c2"><input type="text" name="edtNmDepColeta1" class="editbox" style="width:214px;text-transform:uppercase;"></td>
					</tr>
                    <%End if%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="modal">Via de Transporte:</label></td>
						<td class="c2"><select name="cmbCodViaTransp" class="select" id="modal" style="width: 140px;" tabindex="44"  onChange="verificaTransporte(this.value);" onBlur="RapAcao('<%= vTpAcao%>');">
								<option value="0">&nbsp;</option>
								<!--#include virtual="/selects/option_via_transporte.txt"-->
						</select> 
						<label id='viaTransp'>
						<input name="cmbinCourrier" type="checkbox" id="cmbinCourrier" <%if vInCourrier=1 then response.Write("checked") end if%> onBlur="RapAcao('<%= vTpAcao%>');">
                       Courrier <img src="../../imagens/30/icon_mini_faq.gif" alt="O checkbox Courrier somente poder&aacute; ser marcado para a op&ccedil;&atilde;o Via de Transporte a&eacute;rea!" width="15" height="13"></label></td>
						<td class="c1"><label class="label" for="embac">Embarcador:</label></td>
						<td class="c2"><input name="edtCodEmbarcador" type="text" class="editbox" id="embac" style="width: 40px;" tabindex="45" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TAGENTE','CD_AGENTE','NM_AGENTE',this,'edtNmEmbarcador');" maxlength="4">
								<input type="text" name="edtNmEmbarcador" readonly class='edtDisabled'>
								<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmEmbarcador" width="16" height="16" border="0" align="absmiddle" id="img_edtNmEmbarcador" style="cursor: hand;" onClick="ConsultaOnLine('TAGENTE','CD_AGENTE,NM_AGENTE','Código,Descrição','CD_AGENTE','','edtCodEmbarcador');"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="navio">Navio:</label></td>
						<td class="c2"><input name="edtCodEmbarcacao" type="text" class="editbox" id="navio" style="width: 40px;" tabindex="46" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TEMBARCACAO','CD_EMBARCACAO','NM_EMBARCACAO',this,'edtNmEmbarcacao');" maxlength="4">
								<input type="text" name="edtNmEmbarcacao" readonly class='edtDisabled'>
								<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmEmbarcacao" width="16" height="16" border="0" align="absmiddle" id="img_edtNmEmbarcacao" style="cursor: hand;" onClick="ConsultaOnLine('TEMBARCACAO','CD_EMBARCACAO,NM_EMBARCACAO','Código,Descrição','CD_EMBARCACAO','','edtCodEmbarcacao');"></td>
						<td class="c1"><label class="label" for="viagem" style="visibility:hidden">Nr. Viagem:</label></td>
						<td class="c2"><input name="edtNrViagem" type="hidden" class="editbox" id="viagem" style="width:80px;" tabindex="47" onKeyUp="ApenasNumero(this,'/');" maxlength="5" onBlur="RapAcao('<%= vTpAcao%>');">
								<img src="/imagens/30/btn_folder.gif" width="16" height="16" border="0" alt="Consulta por descrição" style="cursor: hand;visibility:hidden" align="absmiddle" onClick="ConsultaOnLineSQL(5,'Viagem,Dt. Esperada,Dt. Entrada,Local Embarque,Arm. Atracação,Nº Manifesto','NR_VIAGEM','edtNrViagem',edtCodEmbarcacao.value);"></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="localemb">Local de Embarque:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodLocalEmb" type="text" class="editbox" id="localemb" style="width: 40px;" tabindex="48" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TLOCAL_EMBARQUE','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'edtNmLocalEmb');" maxlength="4">
							<input type="text" name="edtNmLocalEmb" readonly class='edtDisabled'>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmLocalEmb" width="16" height="16" border="0" align="absmiddle" id="img_edtNmLocalEmb" style="cursor: hand;" onClick="ConsultaOnLine('TLOCAL_EMBARQUE','CD_LOCAL_EMB,NM_LOCAL_EMB','Código,Descrição','CD_LOCAL_EMB','','edtCodLocalEmb');"></nobr></td>
						<td class="c1"><label class="label" for="localdesemb">Local de Desembarque:</label></td>
						<td class="c2"><nobr>
							<input name="edtCodLocalDesemb" type="text" class="editbox" id="localdesemb" style="width: 40px;" tabindex="49" onBlur="RapAcao('<%= vTpAcao%>');FastLookup('TLOCAL_EMBARQUE','CD_LOCAL_EMB','NM_LOCAL_EMB',this,'edtNmLocalDesemb');" maxlength="4">
							<input type="text" name="edtNmLocalDesemb" readonly class='edtDisabled'>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="img_edtNmLocalDesemb" width="16" height="16" border="0" align="absmiddle" id="img_edtNmLocalDesemb" style="cursor: hand;" onClick="ConsultaOnLine('TLOCAL_EMBARQUE','CD_LOCAL_EMB,NM_LOCAL_EMB','Código,Descrição','CD_LOCAL_EMB','','edtCodLocalDesemb');"></nobr></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><label class="label" for="notify">Notify:</label></td>
						<td class="c2"><select name="cmbTpNotify" class="select" id="notify" style="width:214px;" tabindex="50" onChange="HabNotifyConsignee(this,document.forms[0].edtCodNotify);" onBlur="RapAcao('<%= vTpAcao%>');">
								<%= fncCriaOption("pessoa_exp")%>
						</select></td>
						<td class="c1"><label class="label" for="consignee">Consignee:</label></td>
						<td class="c2"><select name="cmbTpConsignee" class="select" id="consignee" style="width:214px;" tabindex="51" onChange="HabNotifyConsignee(this,document.forms[0].edtCodConsignee);" onBlur="RapAcao('<%= vTpAcao%>');">
								<%= fncCriaOption("pessoa_exp")%>
						</select></td>
					</tr>
					<tr height="<%= vl_heigth%>">
						<td class="c1">&nbsp;</td>
						<td class="c2"><nobr>
							<input name="edtCodNotify" type="text" class="editbox" style="width: 40px;" tabindex="52" onBlur="RapAcao('<%= vTpAcao%>');ConsNotify('N',0,this,document.forms[0].edtNmNotify);" maxlength="5">
							<input type="text" name="edtNmNotify" readonly class='edtDisabled'>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="btnNotify" width="16" height="16" border="0" align="absmiddle" id="btnNotify" style="cursor: hand;" onClick="ConsNotify('N',1,document.forms[0].edtCodNotify,'');"></nobr></td>
						<td class="c1">&nbsp;</td>
						<td class="c2"><nobr>
							<input name="edtCodConsignee" type="text" class="editbox" style="width: 40px;" tabindex="53" onBlur="RapAcao('<%= vTpAcao%>');ConsNotify('C',0,this,document.forms[0].edtNmConsignee);" maxlength="5">
							<input type="text" name="edtNmConsignee" readonly class='edtDisabled'>
							<img src="/imagens/30/btn_folder.gif" alt="Consulta por descrição" name="btnConsignee" width="16" height="16" border="0" align="absmiddle" id="btnConsignee" style="cursor: hand;" onClick="ConsNotify('C',1,document.forms[0].edtCodConsignee,'');"></nobr></td>
					</tr>
                    <% If Session("InModoSimples")<>"1" Then%>
					<tr height="<%= vl_heigth%>">
						<td class="c1"><b>Carta de Crédito:</b></td>
						<td class="c2"><input name="rdgInCartaCredito" type="radio" id="nao8" tabindex="54" value="0" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="nao8">N&atilde;o</label>
								<input name="rdgInCartaCredito" type="radio" id="sim8" value="1" onBlur="RapAcao('<%= vTpAcao%>');">
								<label class="label" for="sim8">Sim</label></td>
						<td class="c1"><label class="label" for="notacred">Nr. Nota de Crédito:</label></td>
						<td class="c2"><input name="edtNrNotaCredito" type="text" class="editbox" id="notacred" style="width: 214px;text-transform:uppercase;" tabindex="55" onKeyUp="ApenasNumero(this,';');" maxlength="255" onBlur="RapAcao('<%= vTpAcao%>');"></td>
					</tr>
                    <%End if%>
					<tr>
                    <% If Session("InModoSimples")<>"1" Then%>
						<td colspan="2" class="c2"><label class="label" for="mark">Marca&ccedil;&atilde;o:</label>
								<br>
								<textarea name="txaTxMarcacao" cols="80" rows="5"  wrap="virtual" class="editbox" id="mark" style="width:365px;height:90px;text-transform:uppercase;" tabindex="56" onBlur="RapAcao('<%= vTpAcao%>');"><%= vTxMarcacao%></textarea></td>
                                <%End If%>
						<td <%If Session("InModoSimples")<>"1" Then%> colspan="2"<%Else%>colspan="4"<%End If%> class="c2"><label class="label" for="instemb">Instru&ccedil;&atilde;o Geral:</label>
								<br>
								<textarea name="txaTxInstEmb" <%If Session("InModoSimples")<>"1" Then%>cols="80"<%Else%>cols="160"<%End If%>rows="5"  wrap="virtual" class="editbox" id="instemb" style=" <%If Session("InModoSimples")<>"1" Then%>width:365px;<%Else%>width:720px;<%End If%>height:<% If Session("InModoSimples")<>"1" Then%>90px<%Else%>45px<%End If%>;text-transform:uppercase;" tabindex="57" onBlur="RapAcao('<%= vTpAcao%>');"><%= vTxInstEmb%></textarea></td>
					</tr>
                    <tr>
                    <td colspan="4" class="c2" align="right"><img src="/imagens/30/leg_vermelho.gif" border="1" align="absmiddle"> Cadastros Inativos&nbsp;&nbsp;</td>
                    </tr>
                    <% If Session("InEnviaArquivos") = "1" or vInEnviaArquivos = "1" Then%>
                    <%Set objfso = Server.CreateObject("Scripting.FileSystemObject")
					tx_caminho = Server.MapPath("/arquivo/upload/" & Trim(vNrRap) & Trim(Session("GrupoUsuario")))
					If objFSO.FolderExists(tx_caminho) Then
					contador_titulo = 0
					Set objfolder = objFSO.GetFolder(tx_caminho)%>
                    <tr height="18">
						<td colspan="4" class="c2" style="font-size:12px"><nobr><label id="docDig" style="width:100px"></label>&nbsp;</nobr></td>
					</tr> 
                    <tr>
                    <td colspan="4" class="c2" align="left">
					<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#336699" style="padding: 0px 1px 0px 1px;">
					<%For Each tx_arquivo in objfolder.Files
					if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
					if contador_titulo = 0 Then%>
                    <script>
					document.getElementById('docDig').innerHTML="Documentos Digitalizados"
					</script>
					<tr height="18">
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Arquivo</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Tamanho</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Data</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>&nbsp;</nobr></td>
					</tr> 
                    <%contador_titulo = 1
					End If%>
					<tr height="16" bgcolor="<%= bgcolor%>" style="text-align: center; vertical-align:top;">
                      <td align="center"><a href="/arquivo/upload/<%=Trim(vNrRap) & Trim(Session("GrupoUsuario"))%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
					  <td align="center"><%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
					  <td align="center"><%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
                      <td align="center">
                      <% if (not vCdStatus = "2" and not vCdStatus = "3") Then%>
                      <a href="#" onClick="javascript:excluiArquivos('<%= tx_arquivo.Name%>', '<%= vNrRap%>', '<%= vTpAcao%>');"><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a></td>
                      <%Else%>
                      <img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></td>
                      <%End if%>
                      </tr>
                    <%Next%>
					</table>
                    </td>
                    </tr>
					<%End If%>
                    <%End If%>
				</table>
      <%
  'exibe os pedidos integrados
	if vInAntecipado then
		'lista RAP´s para exibi-las em tela
		if objrs.State = adStateOpen then objrs.Close()
		sql = "SELECT CD_PRODUTO, TX_DESC, "&_
			  "  RTRIM(LTRIM(CD_RAP)) + '/' + RTRIM(LTRIM(CD_RAP_ANO)) AS RAP, RTRIM(LTRIM(CD_RAP)) + RTRIM(LTRIM(CD_RAP_ANO)) AS VRAP, "&_
			  "  RTRIM(LTRIM(NR_PEDIDO)) AS NR_PEDIDO, RTRIM(LTRIM(NR_ITEM)) AS NR_ITEM, ISNULL(QT_FORN_PEDIDO, 0) AS QT_TOTAL, "&_
			  " ISNULL(QT_FORN_PEDIDO, 0) - ISNULL(QT_BAIXADA, 0) AS QT_RESTANTE, ISNULL(QT_BAIXADA, 0) AS QT_BAIXADA "&_
			  " FROM TPE_ITEM (NOLOCK) " &_
			  " WHERE ISNULL(QT_BAIXADA, 0) > 0 "&_
			  " AND ((RTRIM(LTRIM(CD_RAP)) = '"& Mid(vNrRap, 1, 6) &"' AND CD_RAP_ANO = '"& Mid(vNrRap, 7, 2) &"') OR (ISNULL(CD_RAP, '') = '')) AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "'" &_
					"ORDER BY CD_RAP_ANO DESC , CD_RAP DESC "
		'verifica o cargo do usuario
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
		'exibe os packing list dessa rap
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT COUNT(*) FROM TRAP_DOCUMENTACAO (NOLOCK) " &_
					"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' AND CD_STATUS IN ('2', '3') AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
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
				<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
					<tr height="18">
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Nr. Pedido</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Item</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Qtde. Baixada</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Qtde. Total</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>C&oacute;d. Mercadoria</nobr></td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>Descri&ccedil;&atilde;o</nobr></td>
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
				<%else%>
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
  sql = "SELECT F.CD_FORNECIMENTO, F.CD_MERCADORIA, VL_QTDE, QT_CAIXAS, TX_UNID_MEDIDA, VL_PRECO_UNIT, " &_
				"  ISNULL(NR_PROFORMA, '') AS NR_PROFORMA, ISNULL(NR_ITEM_CLIENTE, '') AS NR_ITEM_CLIENTE, "&_
        "  ISNULL(AP_MERCADORIA, '') AS NM_MERCADORIA, ISNULL(CD_NCM_SH, '') AS CD_NCM_SH, "&_
				"  ISNULL(CD_NALADI_SH, '') AS CD_NALADI_SH " &_
        "FROM TRAP_FORNECIMENTO F (NOLOCK) " &_
				"  LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = F.CD_MERCADORIA) "&_
        "WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' AND F.CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "' ORDER BY F.CD_MERCADORIA"
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	'exibe os packing list dessa rap
	if objrsx.State = adStateOpen then objrsx.Close()
  sql = "SELECT COUNT(*) FROM TRAP_PACK_VOLUME (NOLOCK) " &_
        "WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "'"
  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr height="25">
                    	<%If Session("GrupoUsuario") = "241" Then%>
						<td style="font-size:12px">Processos Integrados.</td>
                        <%Else%>
                        <td style="font-size:12px">Fornecimentos Integrados.</td>
                        <%End If%>
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
				<table width="750" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
					<tr height="18">
                    	<%If Session("GrupoUsuario") = "241" Then%>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Processo</td>
                        <%Else%>
                        <td class="gridtit" style="background-color:<%=cabec_result%>;">Nr. Fornec.</td>
                        <%End If%>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Item</td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">C&oacute;d. Merc.</td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">NCM</td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">NALADI</td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Descri&ccedil;&atilde;o</td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Unid.</td>
                        <%End If%>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Qtde.</td>
                        <% If Session("InModoSimples")<>"1" Then%>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Valor Un.</td>
                        <%Else%>
                        <td class="gridtit" style="background-color:<%=cabec_result%>;">Valor</td>
                        <%End If%>
                        <% If (Session("InPackingList")="1" or vInPackList="1") Then %>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Proforma</td>
						<td class="gridtit" style="background-color:<%=cabec_result%>;">Volumes</td>
                        <%End If%>
					</tr>
					<%
		Do While Not objrs.Eof
			if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT DISTINCT CD_VOLUME FROM TRAP_PACK_LIST (NOLOCK) " &_
						"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'  AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "'" &_
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
                        <% If Session("InModoSimples")<>"1" Then%>
						<td><nobr><%= objrs.Fields.Item("TX_UNID_MEDIDA").Value%></nobr></td>
                        <%End If%>
                        <% If vGrupo <> "028" Then %>
						<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("QT_CAIXAS").Value,2)%></nobr></td>
                        <% Else %>
                        <td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("VL_QTDE").Value,2)%></nobr></td>
                        <% End If%>
						<td align="right"><nobr><%= FormatNumber(objrs.Fields.Item("VL_PRECO_UNIT").Value,4)%></nobr></td>
                        <% If (Session("InPackingList")="1" or vInPackList="1") Then %>
						<td><nobr><%= objrs.Fields.Item("NR_PROFORMA").Value%></nobr></td>
						<td align="left"><%= vVolume%></td>
                        <%End If%>
					</tr>
					<%
			objrs.MoveNext
			if objrs.Eof then exit do
		loop
%>
				</table>
				<%else%>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>	
                    	<%If Session("GrupoUsuario") <> "241" Then%>
						<td>Não existem fornecimentos integrados.</td>
                        <%Else%>
                        <td>Não existem processos integrados.</td>
                        <%End If%>
					</tr>
				</table>
				<%
	end if
	%>
    <%If (Session("InMostraFollowup") = "1" or vInMostraFollowup = "1") Then
	if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT RE.NM_EVENTO AS NM_EVENTO, U.NM_USUARIO AS NM_USUARIO, RF.DT_REALIZACAO AS DT_REALIZACAO FROM TRAP_FOLLOWUP RF (NOLOCK) " &_
			      " INNER JOIN TRAP_EVENTO RE ON RE.CD_EVENTO = RF.CD_EVENTO "&_
				  " INNER JOIN TUSUARIO U ON U.CD_USUARIO = RF.CD_USUARIO_REALIZACAO "&_
						"WHERE RF.CD_RAP+RF.CD_RAP_ANO = '"& vNrRap &"'  AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "' ORDER BY RF.CD_EVENTO"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then
	%>
    <br>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td style="font-size:12px">Acompanhamento</td>
    </tr>
    </table>
    <table width="752" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td valign="top">
	<table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr class="gridtop" height="16">
									<td style="text-align:center;background-color:<%=cabec_result%>;">&nbsp;Histórico</td>
									<td style="text-align:center;background-color:<%=cabec_result%>;" colspan="2">&nbsp;Realização</td>
	</tr>
    <%Do While Not objrsx.Eof 
	if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
    %> 
		<tr bgcolor="<%= bgcolor%>">	
			<td width="300px">&nbsp<%= objrsx.Fields.Item("NM_EVENTO").Value%></td>
            <td width="200px" style="text-align:center;">&nbsp<%= objrsx.Fields.Item("DT_REALIZACAO").Value%></td>
            <td width="250px" style="text-align:center;">&nbsp<%= objrsx.Fields.Item("NM_USUARIO").Value%></td>
		</tr>
    <%
	objrsx.MoveNext
			if objrsx.Eof then exit do
	Loop
	objrsx.Close
	%>    
	</table>
    </td>
    </tr>
    </table>
    <br>
   <%
   End If
   End If%>
<%end if
%>

			</div>
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
//mudança - 22/12/2008 - Verificação de RAP já existente
function verificaRap_Ano(campo){
 if (document.getElementById('edtCodRapAno').value != ""){
 FastLookup('TRAP','CD_RAP','rap',document.getElementById('edtCodRapAno'),'edtRespostaRap');
 } 
}

function RapAcao(vTpAcao){
  if (vTpAcao != 'editar' && vTpAcao != 'salvar') {
  FastLookup('TRAP','CD_RAP','rap',document.getElementById('edtCodRapAno'),'edtRespostaRap');
  if(document.getElementById('edtRespostaRap').value != ""){
  document.getElementById('rap').focus();
  return false;
  }
  }else{
  return true;
  }
}

function verificaFrete(inc, tipo){
   if (inc == 'FCA' || inc == 'EXW' || inc == 'FOB' || inc == 'FAS'){
   	if (tipo == 1){
   		document.getElementById('edtVlFreteInt').value = '0,00';
   		document.getElementById('edtVlFreteInt').readOnly = true;
   		document.getElementById('edtVlFreteInt').className = 'edtDisabled';
		document.getElementById('edtVlSeguro').value = '0,00';
   		document.getElementById('edtVlSeguro').readOnly = true;
   		document.getElementById('edtVlSeguro').className = 'edtDisabled';
	}else{
		alert('ATENÇÃO: o Incoterm escolhido não possue frete!');
	}	
   }else{
	//document.getElementById('edtVlFreteInt').value = '0,00';
   	document.getElementById('edtVlFreteInt').readOnly = false;
   	document.getElementById('edtVlFreteInt').className = 'editbox';
	//document.getElementById('edtVlSeguro').value = '0,00';
   	document.getElementById('edtVlSeguro').readOnly = false;
   	document.getElementById('edtVlSeguro').className = 'editbox';
   }
}


function verificaSalvar(){
  FastLookup('TRAP','CD_RAP','rap',document.getElementById('edtCodRapAno'),'edtRespostaRap');
  if(document.getElementById('edtRespostaRap').value != ""){
  document.getElementById('rap').focus();
  return false;
  }
}
//fim da mudança

//mudança - 29/12/2008 - Verifica tipo de Transporte (somente se for Aérea, tem opção de Courrier)
function verificaTransporte(vCodViaTransp){
  FastLookup('VERIFICATRANSP','VERIFICATRANSP','VERIFICATRANSP',document.getElementById('cmbCodViaTransp'),'cmbinCourrier');
  if (document.getElementById('cmbCodViaTransp').value == 4){
  return false;
  }else{
  return true;
  }
}
//fim da mudança

function desabilitaCampos() {
  var totalCampos = document.frmIntegraRap.elements.length;
  for (i = 0; i < totalCampos; i++) {
    document.frmIntegraRap.elements[i].readOnly = true;
  } 
    document.getElementById('img_edtNmExportador').disabled=true;
    document.getElementById('img_edtNmExportador').disabled=true;
	document.getElementById('img_edtNmCliente').disabled=true;
	if ('<%= vInModoSimples%>' != '1'){
		document.getElementById('img_edtNmDepColeta').disabled=true;
		document.getElementById('sim0').disabled=true;
		document.getElementById('nao0').disabled=true;
		document.getElementById('sim1').disabled=true;
		document.getElementById('nao1').disabled=true;
		document.getElementById('sim2').disabled=true;
		document.getElementById('nao2').disabled=true;
		document.getElementById('sim3').disabled=true;
		document.getElementById('nao3').disabled=true;
		document.getElementById('sim4').disabled=true;
		document.getElementById('nao4').disabled=true;
		document.getElementById('sim5').disabled=true;
		document.getElementById('nao5').disabled=true;
		document.getElementById('sim6').disabled=true;
		document.getElementById('nao6').disabled=true;
		document.getElementById('sim7').disabled=true;
		document.getElementById('nao7').disabled=true;
		document.getElementById('sim8').disabled=true;
		document.getElementById('nao8').disabled=true;
		//document.getElementById('sim9').disabled=true;
		//document.getElementById('nao9').disabled=true;
		document.getElementById('sim10').disabled=true;
		document.getElementById('nao10').disabled=true;
        document.getElementById('sim100').disabled=true;
		document.getElementById('nao100').disabled=true;
		document.getElementById('sim11').disabled=true;
		document.getElementById('nao11').disabled=true;
		document.getElementById('grafica').disabled=true;
		document.getElementById('remeter').disabled=true;
		document.getElementById('rdgInExpurgo').disabled=true;
		document.getElementById('rdgInEmbalagem').disabled=true;
		document.getElementById('rdgInTriangulacao').disabled=true;
		document.getElementById('cmbCodLogomarca').disabled=true;
		document.getElementById('rdgInAntecipado').disabled=true;
		document.getElementById('rdgInFabrExpo').disabled=true;
		//document.getElementById('rdgInCadivi').disabled=true;
		document.getElementById('rdgInPermisso').disabled=true;
		document.getElementById('rdgInConsulado').disabled=true;
		document.getElementById('rdgInPalletExpurgo').disabled=true;
        document.getElementById('rdgInSemPackList').disabled=true;
		document.getElementById('img_edtNmAgenteComissao').disabled=true;
		document.getElementById('cmbTpDrawback').disabled=true;
	}
	document.getElementById('img_edtNmMoedaMLE').disabled=true;
	document.getElementById('img_edtNmEmbarcacao').disabled=true;
	document.getElementById('img_edtNmLocalEmb').disabled=true;
	document.getElementById('btnNotify').disabled=true;
	document.getElementById('btnConsignee').disabled=true;
	document.getElementById('img_edtNmLocalDesemb').disabled=true;
	document.getElementById('img_edtNmEmbarcador').disabled=true;
	document.getElementById('img_edtNmCondPagto').disabled=true;
	document.getElementById('img_edtNmPais').disabled=true;
	document.getElementById('img_edtNmFabricante').disabled=true;
	document.getElementById('cmbCodViaTransp').disabled=true;
	document.getElementById('cmbCodIncoterm').disabled=true;
	document.getElementById('cmbTpNotify').disabled=true;
	document.getElementById('cmbTpConsignee').disabled=true;
	document.getElementById('rdgInInspecao').disabled=true;
    document.getElementById('edtNrCaixas').disabled=true;
    document.getElementById('edtNrPallets').disabled=true;
    document.getElementById('edtNrJumbos').disabled=true;
    document.getElementById('edtNrPacotes').disabled=true;
    document.getElementById('edtNrBigBags').disabled=true;
    document.getElementById('edtNrBigBagsPallets').disabled=true;
    document.getElementById('edtNrNotasFiscais').disabled=true;
    document.getElementById('edtNrEasy').disabled=true;
}

function PreencheForm(vTpAcao, vTpExibe) {
	if (vTpAcao == 'listar') {
		ExibeListaRap('DivCorpo',vTpExibe,'cd_menu='+vCodMenu+'&cd_subm='+vCodSubm+'&cd_docto='+vCodDocto);
	}
	else { //preenche os campos FLAVIO
		document.getElementById('colunaseta').background='/imagens/30/seta.jpg';
		document.frmIntegraRap.onReset;
		with (document.frmIntegraRap) {
          if (vTpExibe != 1){
			desabilitaCampos();
		  }
		  vNrRap.value       = '<%= vNrRap%>'
		  edtCodRap.value    = '<%= Left(vNrRap, 6)%>';
		  edtCodRapAno.value    = '<%=Right(vNrRap, 2)%>';
		  //outros campos
		  edtCodExportador.value   = '<%= vCodExportador%>';
		  edtCodFabricante.value   = '<%= vCodFabricante%>';
		  edtCodCliente.value      = '<%= vCodCliente%>';
		  edtCodPais.value         = '<%= vCodPais%>';
		  edtCodCondPagto.value    = '<%= vCodCondPagto%>';
		  if ('<%= vInModoSimples%>' != '1'){
		    edtCodAgenteComissao.value = '<%= vCodAgenteComissao%>';
			edtCodDepColeta.value    = '<%= vCodDepColeta%>';
			edtNmDepColeta1.value    = '<%= vCodDepColeta1%>';
		  }
		  edtCodMoedaMLE.value     = '<%= vCodMoedaMLE%>';
		  edtCodEmbarcador.value   = '<%= vCodEmbarcador%>';
		  edtCodEmbarcacao.value   = '<%= vCodEmbarcacao%>';
		  edtCodLocalEmb.value     = '<%= vCodLocalEmb%>';
		  edtCodLocalDesemb.value  = '<%= vCodLocalDesemb%>';
			
		  //mudança - 22/12/2008 - O que nao deve/não deve aparecer quando a RAP é duplicada
		  if (vTpAcao == 'duplicar') {
		    if (edtCodRap2.value    != '') edtCodRap2.focus();
			if ('<%= vInRapSequencial%>' == '1'){
			  edtCodRap2.value    = '<%= Left(vNrRap_2, 6)%>';
			  edtCodRapAno.value    = '<%=Right(vNrRap_2, 2)%>';
			}
			edtNrFornec.value        = '<%=""%>';
            edtNrNotasFiscais.value = '<%=""%>';
            edtNrEasy.value         = '<%=""%>';
			if ('<%= vInModoSimples%>' != '1'){
			  edtDtEmbarque.value      = '<%= ""%>';
			  edtVlCubagem.value       = '<%= FormatNumber(0000, 3)%>';
			  edtVlQtdVolume.value     = '<%= FormatNumber(0, 0)%>';
			  edtNrNotaCredito.value   = '<%= ""%>';
			  edtTxMotivoDesc.value    = '<%= ""%>';
			  edtTxEmbalagem.value     = '<%= ""%>';

              edtNrCaixas.value     = '<%= FormatNumber(0, 0)%>';
              edtNrPallets.value    = '<%= FormatNumber(0, 0)%>';
              edtNrJumbos.value     = '<%= FormatNumber(0, 0)%>';
              edtNrPacotes.value    = '<%= FormatNumber(0, 0)%>';
              edtNrBigBags.value     = '<%= FormatNumber(0, 0)%>';
              edtNrBigBagsPallets.value    = '<%= FormatNumber(0, 0)%>';
					
              edtVlPesoBruto.value     = '<%= FormatNumber(00000, 4)%>';
			  edtVlPesoLiq.value       = '<%= FormatNumber(00000, 4)%>';
			}
			
			edtVlMLE.value           = '<%=FormatNumber(000, 2)%>';
			edtDtFaturamento.value   = '<%= ""%>';
			edtCodEmbarcacao.value   = '<%= ""%>';
			cmbTpNotify.value     = '<%= vTpNotify%>';
			cmbTpConsignee.value  = '<%= vTpConsignee%>';
			edtCodNotify.value    = '<%= vCodNotify%>';
			edtCodConsignee.value = '<%= vCodConsignee%>';
		  }else{
		    if (edtCodRap.value    != '') edtCodRap.focus();
			edtNrFornec.value        = '<%= vNrFornec%>';
			
			if ('<%= vInModoSimples%>' != '1'){
			  edtDtEmbarque.value      = '<%= vDtEmbarque%>';
			  edtVlCubagem.value       = '<%= FormatNumber(vVlCubagem, 3)%>';
			  edtVlQtdVolume.value     = '<%= FormatNumber(vVlQtdVolume, 0)%>';
              edtNrNotasFiscais.value  = '<%= vNrNotasFiscais%>';
              edtNrEasy.value          = '<%= vNrEasy%>';
              edtNrCaixas.value     = '<%= FormatNumber(vNrCaixas, 0)%>';
              edtNrPallets.value    = '<%= FormatNumber(vNrPallets, 0)%>';
              edtNrJumbos.value     = '<%= FormatNumber(vNrJumbos, 0)%>';
              edtNrPacotes.value    = '<%= FormatNumber(vNrPacotes, 0)%>';
              edtNrBigBags.value    = '<%= FormatNumber(vNrBigBags, 0)%>';
              edtNrBigBagsPallets.value = '<%= FormatNumber(vNrBigBagsPallets, 0)%>';

			  edtNrNotaCredito.value   = '<%= vNrNotaCredito%>';
			  edtTxMotivoDesc.value    = '<%= vTxMotivoDesc%>';
			  edtTxEmbalagem.value     = '<%= vTxEmbalagem%>';
			  edtVlPesoBruto.value     = '<%= FormatNumber(vVlPesoBruto, 4)%>';
			  edtVlPesoLiq.value       = '<%= FormatNumber(vVlPesoLiq, 4)%>';
			}
			
			edtVlMLE.value           = '<%= FormatNumber(vVlMLE, 2)%>';
			edtDtFaturamento.value   = '<%= vDtFaturamento%>';
			edtCodEmbarcacao.value   = '<%= vCodEmbarcacao%>';
			cmbTpNotify.value     = '<%= vTpNotify%>';
			cmbTpConsignee.value  = '<%= vTpConsignee%>';	
			edtCodNotify.value    = '<%= vCodNotify%>';
			edtCodConsignee.value = '<%= vCodConsignee%>';	
		  }
		  //edtNrCDE.value           = '<%'= vNrCDE%>';
		  edtNrViagem.value        = '<%= vNrViagem%>';
		  if ('<%= vInModoSimples%>' != '1'){
		    edtNrAtoDrawback.value   = '<%= vNrAtoDrawback%>';
			edtVlComissao.value      = '<%= FormatNumber(vVlComissao, 2)%>';
			cmbCodLogomarca.value    = '<%= vCodLogomarca%>';
			cmbTpDrawback.value      = '<%= vTpDrawback%>';
			//radio groups
			rdgInFabrExpo[<%=FormatNumber(vInFabrExpo, 0)%>].checked = true; HabFabric(rdgInFabrExpo[<%=FormatNumber(vInFabrExpo, 0)%>]);
			rdgInTriangulacao[<%=FormatNumber(vInTriangulacao, 0)%>].checked = true;
			rdgInPermisso[<%=FormatNumber(vInPermisso, 0)%>].checked = true;
			rdgInEmbalagem[<%=FormatNumber(vInEmbalagem, 0)%>].checked = true;
			rdgInConsulado[<%=FormatNumber(vInConsulado, 0)%>].checked = true;
			rdgInPalletExpurgo[<%=FormatNumber(vInPalletExpurgo, 0)%>].checked = true;
                
			rdgInExpurgo[<%=FormatNumber(vInExpurgo, 0)%>].checked = true;
			rdgInCartaCredito[<%=FormatNumber(vInCartaCredito, 0)%>].checked = true;
			//rdgInCadivi[<%'=FormatNumber(vInCadivi, 0)%>].checked = true;
			rdgInAmostra[<%=FormatNumber(vInAmostra, 0)%>].checked = true;
			rdgInAntecipado[<%=FormatNumber(vInAntecipado, 0)%>].checked = true;
            rdgInSemPackList[<%=FormatNumber(vInSemPackList, 0)%>].checked = true;
			//Btn's de Calendário
			Calendar.setup({inputField:"edtDtFaturamento",button:"btnDtFaturamento"});
			Calendar.setup({inputField:"edtDtEmbarque",button:"btnDtEmbarque"});
			if (edtCodAgenteComissao.value != '') edtCodAgenteComissao.focus();
			if (edtCodDepColeta.value   != '') edtCodDepColeta.focus();
			if (edtNmDepColeta1.value   != '') edtNmDepColeta1.focus();
			if (edtCodFabricante.value  != '' && rdgInFabrExpo == '0') edtCodFabricante.focus();
			MudaDrawback(cmbTpDrawback);
		  }
		  edtNrInspecao.value      = '<%= vNrInspecao%>';	
		  edtTxOrgao.value         = '<%= vTxOrgao%>';
		  edtVlSeguro.value        = '<%= FormatNumber(vVlSeguro, 2)%>';
		  edtVlAcrescimo.value     = '<%= FormatNumber(vVlAcrescimo, 2)%>';
		  edtVlDesconto.value      = '<%= FormatNumber(vVlDesconto, 2)%>';
		  edtVlFreteInt.value      = '<%= FormatNumber(vVlFreteInt, 2)%>';	
		  cmbCodIncoterm.value     = '<%= vCodIncoterm%>';
		  verificaFrete(cmbCodIncoterm.value,1);
		  cmbCodViaTransp.value    = '<%= vCodViaTransp%>';
		  verificaTransporte(cmbCodViaTransp); /* verifica o tipo, para mostrar checkbox*/
		  cmbinCourrier.value    = 1; /*in_courrier incluido em 20/08/2008*/
		  if (edtCodMoedaMLE.value    != '') edtCodMoedaMLE.focus();
		  rdgInInspecao[<%=FormatNumber(vInInspecao, 0)%>].checked = true;
			//forma de pagto comissão
		  var vCodFormaPagar = '<%= vCodFormaPagar%>';
		  if (vCodFormaPagar != '3') rdgCodFormaPagar[vCodFormaPagar].checked = true;
			//simula a entrada no campo de código para executar a busca
		  //if (edtCodRap.value    != '') edtCodRap.focus();
		  if (edtCodExportador.value  != '') edtCodExportador.focus();
		  if (edtCodCliente.value     != '') edtCodCliente.focus();
		  
		  if (edtCodPais.value        != '') edtCodPais.focus();
		  if (edtCodCondPagto.value   != '') edtCodCondPagto.focus();
		  if (edtCodEmbarcador.value  != '') edtCodEmbarcador.focus();
		  if (edtCodEmbarcacao.value  != '') edtCodEmbarcacao.focus();
		  if (edtCodLocalEmb.value    != '') edtCodLocalEmb.focus();
		  if (edtCodLocalDesemb.value != '') edtCodLocalDesemb.focus();
			HabNotifyConsignee(cmbTpNotify,edtCodNotify);
			HabNotifyConsignee(cmbTpConsignee,edtCodConsignee);
		}
        document.getElementById('rap').focus();
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