<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->


<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.Form &"<br>"
cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")


dim vVolume, vTpStatus, vDtStatus, vHrStatus
Dim mail
Dim corpo, rap_assunto, vNrProcessoRapEmbarque
dim vTpAcao : vTpAcao = Request("vTpAcao")
dim aCodRap, aCodEmbarque, aCodRapReemissao, aCodRapInsercao, contador_item
dim vNrRap, vNrCDE, vCodImp, vCodPais, vCodColeta, vCodIncoterm, vCodTermoPgto, vCodExp, vCodLogo, vCodViaTransp, vNmColeta1
dim vMostraReemissao
dim qtde_total_item
dim valor_total_item
dim in_doctos_rap
aCodRapReemissao = Request("vRaps")


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



sub subVerifica(nRapIni, nRapFim)
	dim vRapAux : vRapAux = nRapIni
  'antes de inserir verifica se há emissões
  vMostraReemissao = false
	aCodRapReemissao = ""
	aCodRapInsercao  = ""	
	
	do
		aCodRap(vRapAux) = Trim(aCodRap(vRapAux))	
		sql = "SELECT ISNULL(IN_DOCTO_ESTORNO, 0) AS IN_DOCTO_ESTORNO "&_
					"FROM TRAP (NOLOCK) " &_
					"WHERE CD_RAP + CD_RAP_ANO = '"& aCodRap(vRapAux) &"' AND CD_GRUPO = '" & Trim(Session("GrupoUsuario")) & "'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		if objrs.Fields.Item("IN_DOCTO_ESTORNO").Value then
			vMostraReemissao = true
			aCodRapReemissao = aCodRapReemissao & aCodRap(vRapAux) & ", "
		else
		  acodRapInsercao = aCodRapInsercao & aCodRap(vRapAux) & ", "
		end if
		objrs.Close()	 
		  
		if Request.Form("vInConsolidado") = "1" then vRapAux = vRapAux + 1 
	loop while vRapAux <= nRapFim
	
	if vMostraReemissao then
%>
<script language="javascript">
	 abreReemissao("<%= aCodRapInsercao %>", "<%= aCodRapReemissao %>");
	 window.close();
</script>
<%    
	else
	  call subInsereEmbarque(aCodRapInsercao)
%>
<script language="javascript">
	alert("Instruções autorizadas para Embarque."); 
	window.close();
</script>
<%		
	end if
end sub



sub subInsereEmbarque(vListaRap)
	dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
    dim aListaRap
	dim vRapAux
	dim vEmail
	dim vInEmail
	dim vInFornecimento
	dim vInPackList

	'define o numero do embarque
	sql = "SELECT RIGHT('0000' + CONVERT(VARCHAR, ISNULL(MAX(CD_EMBARQUE), 0) + 1), 4) AS EMBARQUE, " &_
				"       SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) AS ANO " &_
				"  FROM TRAP_EMBARQUE (TABLOCK HOLDLOCK) " &_
				" WHERE CD_EMBARQUE_ANO = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	aCodEmbarque = objrs.Fields.Item("EMBARQUE").Value&objrs.Fields.Item("ANO").Value
	objrs.Close()
	
    aListaRap = Split(vListaRap, ",", - 1)

	corpo = ""	
	rap_assunto = ""
	for x = 0 to Ubound(aListaRap) - 1
		vRapAux = Trim(aListaRap(x))
		'insere a rap no embarque e atualiza o status da rap
		sql = "INSERT INTO TRAP_EMBARQUE(CD_EMBARQUE, CD_EMBARQUE_ANO, CD_RAP, CD_RAP_ANO, CD_GRUPO, "&_
					"  CD_STATUS, CD_USUARIO_CRIADOR, DT_INSERCAO) "&_
					"VALUES ('"&Left(aCodEmbarque, 4)&"', '"&Right(aCodEmbarque, 2)&"', '"&Left(vRapAux, 6)&"', "&_
					"  '"&Right(vRapAux, 2)&"','" & Trim(Session("GrupoUsuario")) & "', '2', '"&Session("cd_usuario")&"', CONVERT(datetime, '"&vData&"', 103)) "&_
					"UPDATE TRAP SET "&_
					"  CD_STATUS = '2', CD_USUARIO_FIM = '"&Session("cd_usuario")&"', DT_FINALIZADO = CONVERT(datetime, '"&vData&"', 103) "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"' AND CD_GRUPO = '" & session("GrupoUsuario") & "'"& sql
  	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
   	objcnn.Execute(sql)
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
			"  ISNULL(NR_NOTA_CREDITO, '&nbsp;') AS NR_NOTA_CREDITO, "&_
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
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL, G.IN_EMAIL_AUTORIZACAO AS IN_EMAIL, G.EMAIL_AUTORIZACAO AS EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES "&_
			"  FROM TRAP R (NOLOCK) "&_
			"  LEFT JOIN TGRUPO G (NOLOCK) ON (G.CD_GRUPO = R.CD_GRUPO) "&_
			"  WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"'"&_
			"  AND R.CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
vNrProcessoRapEmbarque = objrs.Fields.Item("NR_FORNECIMENTO").Value
vEmail = objrs.Fields.Item("EMAIL").Value
vInFornecimento = objrs.Fields.Item("IN_FORNECIMENTO").Value
vInPackList = objrs.Fields.Item("IN_PACKING_LIST").Value
vInEmail = objrs.Fields.Item("IN_EMAIL").Value

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
corpo = corpo &	"			<td colspan = '4' style='font-size: 12px;'><b>O processo abaixo foi autorizado e estaremos procedendo às fases de desembaraço e embarque. Acesse o myIndaiáWeb para o acompanhamento.</b><br><br><br></td>"
corpo = corpo &	"		</tr>"
End If
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(objrs.Fields.Item("CD_LOGOMARCA").Value) & "'></td>"
If Session("InRapSequencialCheck")<>"1" Then
corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & vNrCde & "</b></td>"
Else
corpo = corpo &	"			<td colspan='2' class='titulo'><b>" & objrs.Fields.Item("NR_FORNECIMENTO").Value & "</b></td>"	
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
corpo = corpo &	"			<td class='c1'>nbsp;</td>"
corpo = corpo &	"			<td class='c2'>nbsp;</td>"
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
	If fnc_TestaVar(objrs.Fields.Item("VL_MLE").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_MLE").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_MOEDA_MLE").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_ACRESCIMO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_ACRESCIMO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
	If fnc_testaVar(objrs.Fields.Item("VL_DESCONTO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_DESCONTO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
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
	If fnc_testaVar(objrs.Fields.Item("VL_FRETE_INT").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_FRETE_INT").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_PESO_BRUTO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO").Value, 4)& "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Seguro:</b></td>"	
	End If
	If fnc_TestaVar(objrs.Fields.Item("VL_SEGURO").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_SEGURO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
	If fnc_testaVar(objrs.Fields.Item("VL_PESO_LIQ").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_LIQ").Value, 4) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_CUBAGEM").Value) Then	
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_CUBAGEM").Value, 3) & " m³ </td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("TX_EMBALAGEM").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("VL_QTD_VOL").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_COMISSAO").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_COMISSAO").Value, 2)&"%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value) &"</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_AGENTE_COMISSAO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_DEP_COLETA").Value & " - " &  objrs.Fields.Item("NM_DEP_COLETA").Value &  "</td>"
corpo = corpo &	"			<td class='c1'><b>Dep. Coleta Transp.:</b></td>"
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
			" WHERE F.CD_RAP+F.CD_RAP_ANO = '"& vRapAux &"'"&_
			" AND F.CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
			" ORDER BY F.CD_MERCADORIA"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then 

corpo = corpo &	"				<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
corpo = corpo &	"					<tr height='35'>"
If Session("InModoSimplesCheck")<>"1" Then
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td colspan='9' style='font-size:12px'>Processos Integrados:</td>"
Else
corpo = corpo &	"						<td colspan='9' style='font-size:12px'>Fornecimentos Integrados:</td>"
End If
Else
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td colspan='8' style='font-size:12px'>Processos Integrados:</td>"
Else
corpo = corpo &	"						<td colspan='8' style='font-size:12px'>Fornecimentos Integrados:</td>"
End If
End If
corpo = corpo &	"					</tr>"
corpo = corpo &	"					<tr height='18'>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td class='pgridtit'>Processo</td>"
Else
corpo = corpo &	"						<td class='pgridtit'>Nr. Fornec.</td>"
End If
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
					" WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"' " &_
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

rap_assunto = rap_assunto & Left(vRapAux, Len(vRapAux)-2) &"/"& Right(vRapAux, 2) & ", "
next	
rap_assunto = Left(rap_assunto, Len(rap_assunto)-2)
		
		
		If (session("EmailAutorizacao")="1" or vInEmail="1") Then
			Set objEmail = CreateObject("CDO.Message")
			objEmail.From 		= "ti@myindaia.com.br" 
			If session("EmailAutorizacaoEmail") <> "" Then
				objEmail.To 		= session("EmailAutorizacaoEmail")
			Else
				objEmail.To 		= vEmail
			End If
			objEmail.CC 		= ""
			
			If Session("GrupoUsuario")="241" Then
				objEmail.Subject = "[myIndaiáWeb] Embarque Autorizado - Processo: "& vNrProcessoRapEmbarque 
			Else
				objEmail.Subject = "[myIndaiáWeb] Embarque Autorizado - RAP: "& rap_assunto 
			End If
	
			objEmail.MIMEFormatted = true
			objEmail.HTMLBody  	= corpo
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp-m.myindaia.com.br" 
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "ti@myindaia.com.br"
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "789852"
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
			objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
			objEmail.Configuration.Fields.Update
			objEmail.Send
			set objEmail = nothing
	    End If
				
	If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
				sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
				 " ('"&left(vRapAux,6)&"', '"&right(vRapAux,2)&"','"&Session("GrupoUsuario")&"','006', GETDATE(),'"&Session("cd_usuario")&"')	"
				objcnn.Execute(sql)	  
	End If	

	
	'calcula o peso liquido dos itens
	'with objcmd
		'.CommandTimeOut = 60
		'.CommandText    = "sp_rap_calc_peso_liq"
		'.CommandType    = adCmdStoredProc
		'.Parameters.Refresh
		'.Parameters("@nrEmbarque") = aCodEmbarque
		'.Execute , , adExecuteNoRecords
	'end with
  if Request.Form("vInConsolidado") = "1" then
		'renumera os itens dos fornecimentos para integração local
		
        '--------------------------GUILHERME 09/04/2012 - numeração dos itens por procedure
        'sql = "SELECT COUNT(*), E.CD_RAP+E.CD_RAP_ANO "&_
		'			"FROM TRAP_EMBARQUE E (NOLOCK), TRAP_FORNECIMENTO F (NOLOCK) "&_
		'			"WHERE E.CD_EMBARQUE+E.CD_EMBARQUE_ANO = '"&aCodEmbarque&"' "&_
		'			"  AND E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO = F.CD_RAP+F.CD_RAP_ANO+F.CD_GRUPO "&_
		'			"GROUP BY E.CD_RAP+E.CD_RAP_ANO "&_
		'			"ORDER BY COUNT(*) DESC"
		'Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		'objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		 
		'if objrs.RecordCount > 1 then
		'	cont = objrs.Fields.Item(0).Value
		'	objrs.MoveNext
		'	
		'	do while not objrs.Eof
		'		sql = "UPDATE TRAP_FORNECIMENTO SET "&_
		'					"  CD_ITEM = RIGHT('000'+CAST((CD_ITEM + "&cont&") as varchar(3)), 3) "&_
		'					"WHERE CD_RAP+CD_RAP_ANO = '"&objrs.Fields.Item(1).Value&"' AND CD_GRUPO ='" & Trim(Session("GrupoUsuario")) & "'"
		'					
		'		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		'		objcnn.Execute(sql)
		'		'Response.write sql
		'		
		'		cont = cont + 1
		'		objrs.MoveNext
		'		if objrs.Eof then exit do
		'	loop
		'	Response.end
		'end if
		'objrs.Close()
        '------------------------fim do comentario

        with objcmd
		.CommandTimeOut = 9999
		.CommandText    = "sp_rap_num_itens_cons"
		.CommandType    = adCmdStoredProc
		.Parameters.Refresh
		.Parameters("@embarque") = aCodEmbarque
        .Parameters("@grupo") = Session("GrupoUsuario")
		.Execute , , adExecuteNoRecords
	    end with

  end if
end sub
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
var gTpAcao = '<%= vTpAcao%>';

function checkBotao(objeto){
var contador = 0;
	for (i=0; i< document.frmEmbarqueConferir.chkConferir.length;i++){		
		if (document.frmEmbarqueConferir.chkConferir[i].checked){	
		contador++;
		}
	}
	if (contador == document.frmEmbarqueConferir.chkConferir.length){
		document.frmEmbarqueConferir.btnEnviarConferir.disabled = false;
		document.frmEmbarqueConferir.vTpAcao.value = 'salvar';
	}else{
		document.frmEmbarqueConferir.btnEnviarConferir.disabled = true;
		document.frmEmbarqueConferir.vTpAcao.value = 'cancelar';
	}
}

function cancelaEmbarque(){
	document.frmEmbarqueConferir.vTpAcao.value = 'cancelar';
}

function abreReemissao(RapsInsere, RapsReemite) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 750;
	var vHeight = 550;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
  window.open('ccreemissao.asp?rapsInsere='+RapsInsere+'&rapsReemite='+RapsReemite+'&origem=embarque',"win10",features);
}

function ValidaForm(vForm) {
	var valida = true;
	var vChecks = 0; e = 0;
	var aImport = []; aPais = []; aColeta = []; aColeta1 = []; aIncoterm = []; aInDoctosRap = [];
	var aTermoPgto = []; aExport = []; aLogo = []; aViaTransp = []; aEmbarcador = [];
	//verifica se mais de uma rap foi selecionada
	for (i=0; i<vForm.chkCodRapAno.length;i++) {
		if (vForm.chkCodRapAno[i].checked==true) {
			aImport[e] = vForm.chkCodRapAno[i].vCodImp;
			aPais[e] = vForm.chkCodRapAno[i].vCodPais;
			aColeta[e] = vForm.chkCodRapAno[i].vCodColeta;
			aColeta1[e] = vForm.chkCodRapAno[i].vNmColeta1;
			aIncoterm[e] = vForm.chkCodRapAno[i].vCodIncoterm;
			aTermoPgto[e] = vForm.chkCodRapAno[i].vCodTermoPgto;
			aExport[e] = vForm.chkCodRapAno[i].vCodExp;
			aLogo[e] = vForm.chkCodRapAno[i].vCodLogo;
			aViaTransp[e] = vForm.chkCodRapAno[i].vCodViaTransp;
			aEmbarcador[e] = vForm.chkCodRapAno[i].vCodEmbarcador;
			//aInDoctosRap[e] = vForm.chkCodRapAno[i].vInDoctosRap;
			//if (vForm.chkCodRapAno[i].vNrCDE == '') {
			//	alert('Para que o embarque seja criado é necessário a que a instrução tenha a CDE informada!');
			//	valida = false;
			//	break;
			//	}
            //GUILHERME - 21/03/2012 - Não fazer mais a checagem de billing doc
			//if (vForm.chkCodRapAno[i].vInDoctosRap == '0') {
			//	alert('Para que o embarque seja criado é necessário que o Billing Doc tenha sido enviado!');
			//	valida = false;
			//	break;
            //}

            if (vForm.chkCodRapAno[i].vCodImp == '') {
                alert('Para que o embarque seja criado é necessário a que a instrução tenha o Cliente preenchido!');
                valida = false;
                break;
            }

			if (vForm.chkCodRapAno[i].vCodPais == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o País de Destino preenchido!');
				valida = false;
				break;
            }

			if (vForm.chkCodRapAno[i].vCodColeta == '' && vForm.chkCodRapAno[i].vModoSimples  !='1' && vForm.chkCodRapAno[i].vNmColeta1 == '')  {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Dep. de Coleta preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodIncoterm == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Incoterm informado!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodTermoPgto == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha a Cond. de Pagto. preenchida!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodExp == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Exportador preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodLogo == '' && vForm.chkCodRapAno[i].vModoSimples  !='1') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Logotipo informado!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodViaTransp == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha a Via de Transporte informada!');
				valida = false;
				break;
			}
			vChecks++; e++;
		}
	}
	//se mais de uma rap estiver selecionada, pergunta se quer consolidar
	if (vChecks > 1) {
		if (confirm('Embarque Consolidado?')) {
			vForm.vInConsolidado.value = '1';
			//verifica se o Importador das rap são os mesmos
			var vImp = aImport[0];
			for (i=0;i<aImport.length;i++) {
				if(vImp != aImport[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Cliente!');
					valida = false;
					break;
				}
			}
			//verifica se o País das rap são os mesmos
			var vPais = aPais[0];
			for (i=0;i<aPais.length;i++) {
				if(vPais != aPais[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo País de Destino!');
					valida = false;
					break;
				}
			}
			
			var vCodEmbarcador = aEmbarcador[0];
			for (i=0;i<aEmbarcador.length;i++) {
				if(vCodEmbarcador != aEmbarcador[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Embarcador!');
					valida = false;
					break;
				}
			}
			
			//verifica se o Dep de Coleta das rap são os mesmos
			/*var vDep = aColeta[0];
			for (i=0;i<aColeta.length;i++) {
				if(vDep != aColeta[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Dep. de Coleta!');
					valida = false;
					break;
				}
			}*/
			//verifica se o Incoterm das rap são os mesmos
			var vInc = aIncoterm[0];
			for (i=0;i<aIncoterm.length;i++) {
				if(vInc != aIncoterm[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Incoterm!');
					valida = false;
					break;
				}
			}
			//verifica se a Cond. de Pagto das rap são as mesmas
			var vCpg = aTermoPgto[0];
			for (i=0;i<aTermoPgto.length;i++) {
				if(vCpg != aTermoPgto[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesma Condição de Pagto.!');
					valida = false;
					break;
				}
			}
			//verifica se o Exportador das rap são os mesmos
			var vExp = aExport[0];
			for (i=0;i<aExport.length;i++) {
				if(vExp != aExport[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesmo Exportador!');
					valida = false;
					break;
				}
			}
			//verifica se o Logotipo das rap são os mesmos
			var vLogo = aLogo[0];
			for (i=0;i<aLogo.length;i++) {
				if(vLogo != aLogo[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Logotipo!');
					valida = false;
					break;
				}
			}
			//verifica se a Via de Transporte das rap são os mesmos
			var vVia = aViaTransp[0];
			for (i=0;i<aViaTransp.length;i++) {
				if(vVia != aViaTransp[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesma Via de Transporte!');
					valida = false;
					break;
				}
			}
		}
	}
	return valida;
}
-->
</script>
</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<%
'verifica se o form foi enviado
if (Request.Form <> "") then
If Request.form("conferir") = "1" Then
if Request.form("chkCodRapAno") <> "" Then
%>
<form name="frmEmbarqueConferir" action="ccembarque.asp" method="post" onSubmit="return ValidaForm(this);">
<%
if objrs.State = adStateOpen then objrs.Close()
vRapAux = Request.form("chkCodRapAno")
	sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO,CD_CLIENTE,CD_EMBARCADOR,CD_DEP_COLETA, NM_DEP_COLETA_1, CD_FABRICANTE,CD_EXPORTADOR, "&_

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
			"  ISNULL(NR_NOTA_CREDITO, '&nbsp;') AS NR_NOTA_CREDITO, "&_
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
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL, G.IN_EMAIL_AUTORIZACAO AS IN_EMAIL, G.EMAIL_AUTORIZACAO AS EMAIL, G.IN_INTEGRA_FORNECIMENTO AS IN_FORNECIMENTO, G.IN_INTEGRA_PACKING_LIST AS IN_PACKING_LIST, G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES "&_
			"  FROM TRAP R (NOLOCK) "&_
			"  LEFT JOIN TGRUPO G (NOLOCK) ON (G.CD_GRUPO = R.CD_GRUPO) "&_
			"  WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"'"&_
			"  AND R.CD_GRUPO = '" & session("GrupoUsuario") & "'"
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
vEmail = objrs.Fields.Item("EMAIL").Value
vInFornecimento = objrs.Fields.Item("IN_FORNECIMENTO").Value
vInPackList = objrs.Fields.Item("IN_PACKING_LIST").Value
vInEmail = objrs.Fields.Item("IN_EMAIL").Value

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
corpo = corpo &	"overflow: auto;"
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
corpo = corpo &	"<table bordercolor='#000000' style='border-style:solid;border-width:1px' width='670px'>"
corpo = corpo &	"<tr style='vertical-align:top;'>"
corpo = corpo &	" <td align='left' style='background-color:#E9E9E9;'>"
corpo = corpo &	" <b><input name='chkConferir' id='chkCapa' type='checkbox' onClick='checkBotao(this);'> Concordo com todos os itens da capa exibidos.</b>"
corpo = corpo &	" </td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr>"
corpo = corpo &	"<td>"
corpo = corpo &	"	<table width='100%' border='0' cellspacing='0' cellpadding='5'>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(objrs.Fields.Item("CD_LOGOMARCA").Value) & "'></td>"
corpo = corpo &	"			<td colspan='2' class='titulo'>Instrução de Embarque/Nr.CDE: <b>" & vNrCde & "</b></td>"
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
corpo = corpo &	"			<td class='c1'>nbsp;</td>"
corpo = corpo &	"			<td class='c2'>nbsp;</td>"
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
	If fnc_TestaVar(objrs.Fields.Item("VL_MLE").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_MLE").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_MOEDA_MLE").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Acr&eacute;scimo:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_ACRESCIMO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_ACRESCIMO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Desconto:</b></td>"
	If fnc_testaVar(objrs.Fields.Item("VL_DESCONTO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_DESCONTO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
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
	If fnc_testaVar(objrs.Fields.Item("VL_FRETE_INT").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_FRETE_INT").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Bruto:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_PESO_BRUTO").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO").Value, 4)& "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Valor Seguro:</b></td>"
	Else
corpo = corpo &	"			<td class='c1' colspan='3'><b>Valor Seguro:</b></td>"	
	End If
	If fnc_TestaVar(objrs.Fields.Item("VL_SEGURO").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_SEGURO").Value, 2) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Peso Líquido:</b></td>"
	If fnc_testaVar(objrs.Fields.Item("VL_PESO_LIQ").Value) Then
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_PESO_LIQ").Value, 4) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
	End If
corpo = corpo &	"		</tr>"
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<tr height=" &  vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Cubagem:</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_CUBAGEM").Value) Then	
		corpo = corpo &	"			<td class='c2'>" & FormatNumber(objrs.Fields.Item("VL_CUBAGEM").Value, 3) & " m³ </td>"
	Else
		corpo = corpo &	"			<td class='c2'>nbsp;</td>"
	End If
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Embalagem:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("TX_EMBALAGEM").Value & "</td>"
corpo = corpo &	"			<td class='c1'><b>Qtde Volumes:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("VL_QTD_VOL").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height=" & vl_heigth & ">"
corpo = corpo &	"			<td class='c1'><b>Comiss&atilde;o?</b></td>"
	If fnc_TestaVar(objrs.Fields.Item("VL_COMISSAO").Value) Then
		corpo = corpo &	"			<td class='c2'>" &  FormatNumber(objrs.Fields.Item("VL_COMISSAO").Value, 2)&"%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value) & "</td>"
	Else
		corpo = corpo &	"			<td class='c2'>%"&fncExibeForma(objrs.Fields.Item("CD_FORMA_PAGAR").Value) &"</td>"
	End If
corpo = corpo &	"			<td class='c1'><b>Agente Comiss&atilde;o:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_AGENTE_COMISSAO").Value & "</td>"
corpo = corpo &	"		</tr>"
corpo = corpo &	"		<tr height="&  vl_heigth & ">"
corpo = corpo & "			<td class='c1'><b>Dep. Coleta:</b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("CD_DEP_COLETA").Value & " - " &  objrs.Fields.Item("NM_DEP_COLETA").Value & "</td>"
corpo = corpo &	"			<td class='c1'>&nbsp;</td>"
corpo = corpo &	"			<td class='c2'>&nbsp;</td>"
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
corpo = corpo &	"	</td></tr>"
corpo = corpo &	"	</table><br>"


'exibe os fornecimentos desse rap
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT F.CD_FORNECIMENTO, F.CD_MERCADORIA, VL_QTDE, QT_CAIXAS, TX_UNID_MEDIDA, VL_PRECO_UNIT, " &_
				"  ISNULL(NR_PROFORMA, '') AS NR_PROFORMA, ISNULL(NR_ITEM_CLIENTE, '') AS NR_ITEM_CLIENTE, "&_
        "  ISNULL(AP_MERCADORIA, '') AS NM_MERCADORIA, ISNULL(CD_NCM_SH, '') AS CD_NCM_SH, "&_
				"  ISNULL(CD_NALADI_SH, '') AS CD_NALADI_SH " &_
        "FROM TRAP_FORNECIMENTO F (NOLOCK) " &_
				"  LEFT JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = F.CD_MERCADORIA) "&_
			" WHERE F.CD_RAP+F.CD_RAP_ANO = '"& vRapAux &"'"&_
			" AND F.CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
			" ORDER BY F.CD_MERCADORIA"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then 
corpo = corpo &	"<table bordercolor='#000000' style='border-style:solid;border-width:1px' width='670px'>"
corpo = corpo &	"<tr style='vertical-align:top;'>"
corpo = corpo &	" <td align='left'>"
corpo = corpo &	" </td>"
corpo = corpo &	"</tr>"
corpo = corpo &	"<tr><td>"
corpo = corpo &	"				<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
corpo = corpo &	"					<tr height='35'>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"						<td colspan='9' style='font-size:12px'>Processos Integrados:</td>"
Else
corpo = corpo &	"						<td colspan='8' style='font-size:12px'>Processos Integrados:</td>"
End If
corpo = corpo &	"					</tr>"
corpo = corpo &	"					<tr height='18'>"
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;width:30px;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>&nbsp;&nbsp;</td>"
If Session("GrupoUsuario") = "241" Then
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Processo</td>"
Else
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Nr. Fornec.</td>"
End If
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Item</td>"
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>C&oacute;d. Merc.</td>"
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>NCM</td>"
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>NALADI</td>"
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Descri&ccedil;&atilde;o</td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Unid.</td>"
End If
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Qtde.</td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Valor Un.</td>"
Else
corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Valor</td>"
End if
If vInPackList = "1" Then
	corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Proforma</td>"
	corpo = corpo &	"						<td class='gridtit' style='background-color:#FFFFFF;color:#000000;border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'>Volumes</td>"
End If
corpo = corpo &	"					</tr>"
contador_item = 0
qtde_total_item = 0
valor_total_item = 0
	Do While Not objrs.Eof
	qtde_total_item = qtde_total_item + objrs.Fields.Item("QT_CAIXAS")
	valor_total_item = CDbl(valor_total_item) + CDbl(objrs.Fields.Item("VL_PRECO_UNIT").Value)
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT DISTINCT CD_VOLUME FROM TRAP_PACK_LIST (NOLOCK) " &_
					" WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"' " &_
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
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;width:30px;'><nobr>&nbsp;&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" & objrs.Fields.Item("CD_FORNECIMENTO").Value & "</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;' align='right'><nobr>" & objrs.Fields.Item("NR_ITEM_CLIENTE").Value & "&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  objrs.Fields.Item("CD_MERCADORIA").Value & "&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" & objrs.Fields.Item("CD_NCM_SH").Value & "&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  objrs.Fields.Item("CD_NALADI_SH").Value & "&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;' align='left'><nobr>" &  objrs.Fields.Item("NM_MERCADORIA").Value & "&nbsp;</nobr></td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  objrs.Fields.Item("TX_UNID_MEDIDA").Value & "</nobr></td>"
End If
		If session("GrupoUsuario") <> "028" Then 
			corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  objrs.Fields.Item("QT_CAIXAS").Value & "&nbsp;</nobr></td>"
         Else 
            corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  objrs.Fields.Item("VL_QTDE").Value & "&nbsp;</nobr></td>"
         End If
corpo = corpo &	"		<td align='right' style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" & FormatNumber(objrs.Fields.Item("VL_PRECO_UNIT").Value, 2) & "&nbsp;</nobr></td>"
If vInPackList = "1" Then
	corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" & objrs.Fields.Item("NR_PROFORMA").Value & "&nbsp;</nobr></td>"
	corpo = corpo &	"		<td align='left' style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>" &  vVolume & "&nbsp;</nobr></td>"
End If
corpo = corpo &	"	</tr>"

		objrs.MoveNext
		If objrs.Eof Then Exit Do
	contador_item = contador_item + 1	
	Loop
corpo = corpo &	"	<tr height='16' style='text-align: center; vertical-align: top;background-color:#E9E9E9;'>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;width:30px;' colspan='5'><nobr><b><input name='chkConferir' id='chkItemtotal' type='checkbox' value='' onClick='checkBotao(this);'>&nbsp;Concordo com os totais.</b></nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>&nbsp;</nobr></td>"
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;' align='left'><nobr>&nbsp;</nobr></td>"
If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>&nbsp;</nobr></td>"
End If
		If session("GrupoUsuario") <> "028" Then 
			corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;color:#0000CC;'><nobr><b>" & qtde_total_item & "&nbsp;</nobr></b></td>"
         Else 
            corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>&nbsp;</nobr></td>"
         End If
corpo = corpo &	"		<td align='right' style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;color:#0000CC;'><b><nobr>" & FormatNumber(valor_total_item,2) & "&nbsp;</nobr></b></td>"
If vInPackList = "1" Then
	corpo = corpo &	"		<td style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>&nbsp;</nobr></td>"
	corpo = corpo &	"		<td align='left' style='border-style: dotted;border-color: #333333;border-width: 1px 0px 0px 0px;'><nobr>&nbsp;</nobr></td>"
End If
corpo = corpo &	"	</tr>"
corpo = corpo &	"		  </table>"
End If
objrs.Close()

corpo = corpo &	"					</td></tr>"
corpo = corpo &	"					</table>"
corpo = corpo &	"<br>"
Response.write corpo

If Session("InEnviaArquivos") = "1" or Session("InEnviaArquivosCheck") = "1" Then
%>
<table bordercolor="#000000" style="border-style:solid;border-width:1px" width="670px">
<tr style="vertical-align:top;">
 <td colspan="3" align="left" style="background-color:<%=fundo_div%>;">
 <b><input id="chkArquivos" type="checkbox" name='chkConferir' onClick="checkBotao(this);"> Concordo com todos os arquivos relacionados.</b>
 </td>
</tr>
<tr>
                    <td colspan="3" align="left">
                    <%Set objfso = Server.CreateObject("Scripting.FileSystemObject")
					tx_caminho = Server.MapPath("/arquivo/upload/" & Trim(vRapAux) & Trim(Session("GrupoUsuario")))
					If objFSO.FolderExists(tx_caminho) Then
					contador_titulo = 0
					Set objfolder = objFSO.GetFolder(tx_caminho)%>
					<table border="0" cellspacing="0" cellpadding="0" style="padding: 0px 0px 0px 0px;" width="100%">
					<%For Each tx_arquivo in objfolder.Files
					if contador_titulo = 0 Then%>
					<tr height="18">
						<td class="gridtit" style="background-color:#FFFFFF;color:#000000;"><nobr>Arquivo</nobr></td>
						<td class="gridtit" style="background-color:#FFFFFF;color:#000000;"><nobr>Tamanho</nobr></td>
						<td class="gridtit" style="background-color:#FFFFFF;color:#000000;"><nobr>Data</nobr></td>
					</tr> 
                    <%contador_titulo = 1
					End If%>
					<tr height="16" style="text-align: center; vertical-align:top;">
                      <td align="center"><a href="/arquivo/upload/<%=Trim(vRapAux) & Trim(Session("GrupoUsuario"))%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
					  <td align="center"><%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
					  <td align="center"><%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
                      </tr>
                    <%Next%>
					</table>
					<%End If%>
                    </td>
</tr>
</table> 
<%
End If
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT NR_CDE, CD_RAP, CD_RAP_ANO, CD_CLIENTE, CD_PAIS, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_INCOTERM, CD_TERMO_PAGTO, CD_EXPORTADOR, CD_EMBARCADOR,  "&_
			"  CD_LOGOMARCA, CD_VIA_TRANSPORTE, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_EMPRESA))) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE) AS NM_EMPRESA, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_PAIS))) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS) AS NM_PAIS "&_
			"  FROM TRAP R (NOLOCK) "&_
			"  WHERE CD_STATUS      = '1' "&_
			"  AND IN_RAP_VALIDA  = 1 "&_
			"  AND IN_FORN_VALIDA = 1 "&_
			"  AND IN_PACK_VALIDA = 1 "
	If Session("GrupoUsuario") = "241" Then
		sql = sql & " AND ISNULL(DT_FATURAMENTO,0) <> 0"
	End If	
		sql = sql &	"  AND CD_GRUPO = '" & Session("GrupoUsuario") & "' AND CD_RAP+CD_RAP_ANO = '"& vRapAux & "'"&_
            "  ORDER BY CD_RAP_ANO DESC, CD_RAP DESC, DT_INSERCAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

		vNrRap = objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value
		vNrCDE = objrs.Fields.Item("NR_CDE").Value
		vCodImp = objrs.Fields.Item("CD_CLIENTE").Value
		vCodPais = objrs.Fields.Item("CD_PAIS").Value
		vCodColeta = objrs.Fields.Item("CD_DEP_COLETA").Value
		vCodIncoterm = objrs.Fields.Item("CD_INCOTERM").Value
		vCodTermoPgto = objrs.Fields.Item("CD_TERMO_PAGTO").Value
		vCodExp = objrs.Fields.Item("CD_EXPORTADOR").Value
		vCodLogo = objrs.Fields.Item("CD_LOGOMARCA").Value
		vCodViaTransp = objrs.Fields.Item("CD_VIA_TRANSPORTE").Value
		vNmColeta1 = objrs.Fields.Item("NM_DEP_COLETA_1").Value
		vCodEmbarcador = objrs.Fields.Item("CD_EMBARCADOR").Value

%>                 
<div style="text-align:center;"><br><br>
<input type="hidden" name="vTpAcao" value="">
<input type="hidden" name="chkCodRapAno" value="<%= vNrRap%>" vNrCDE="<%= vNrCDE%>" vCodImp="<%= vCodImp%>" vCodPais="<%= vCodPais%>" vCodColeta="<%= vCodColeta%>" vNmColeta1 = "<%= vNmColeta1%>" vCodIncoterm="<%= vCodIncoterm%>" vCodTermoPgto="<%= vCodTermoPgto%>" vCodExp="<%= vCodExp%>" vCodLogo="<%= vCodLogo%>" vCodViaTransp="<%= vCodViaTransp%>" vModoSimples="<%= Session("InModoSimplesCheck")%>" vCodEmbarcador="<%= vCodEmbarcador%>"/>
<input type="submit" class="button" name="btnEnviarConferir" value="Cria Embarque" align="center" disabled/>&nbsp;<input type="submit" class="button" name="btnCancelar" value="Cancelar" onClick="cancelaEmbarque();"/></div><br>
</form>
<%
End If
Else
	'verifica se a ação é salvar
	if (vTpAcao = "salvar") and fnc_TestaVar(Request.Form("chkCodRapAno")) then
		'recupera as rap enviadas para embarque 
		aCodRap = Split(Request.Form("chkCodRapAno"), ",", -1)
		'verifica se o embarque vai ser consolidado
		if Request.Form("vInConsolidado") = "1" then
			call subVerifica(0, UBound(aCodRap))
		else	
			for cont = 0 to UBound(aCodRap)
				call subVerifica(cont, -1)
			next
		end if
		
		if Err.Number <> 0 then
			tx_erro = "Foram encontrados erros durante a criação do embarque!\nNão foi possível criar o embarque.\n"& Err.Description
		end if
	end if	
End If	
end if

if vTpAcao = "reemissao" then
  call subInsereEmbarque(aCodRapReemissao)
%>
<script language="javascript">
	window.close();
</script>
<%	
end if
If Request.form("chkCodRapAno") = "" or vTpAcao = "cancelar" Then			
'exibe as rap que estão aguardando embarque
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT NR_CDE, CD_RAP, CD_RAP_ANO, CD_CLIENTE, CD_PAIS, CD_DEP_COLETA, NM_DEP_COLETA_1, CD_INCOTERM, CD_TERMO_PAGTO, CD_EXPORTADOR, CD_EMBARCADOR, "&_
			"  CD_LOGOMARCA, NR_FORNECIMENTO, CD_VIA_TRANSPORTE, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_EMPRESA))) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE) AS NM_EMPRESA, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_PAIS))) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS) AS NM_PAIS "&_
			"  FROM TRAP R (NOLOCK) "&_
			"  WHERE CD_STATUS      = '1' "&_
			"  AND IN_RAP_VALIDA  = 1 "&_
			"  AND IN_FORN_VALIDA = 1 "&_
			"  AND IN_PACK_VALIDA = 1 "
	If Session("GrupoUsuario") = "241" Then
		sql = sql & " AND ISNULL(DT_FATURAMENTO,0) <> 0"
	End If	
		sql = sql &	"  AND CD_GRUPO = '" & Session("GrupoUsuario") & "'"&_
            "  ORDER BY CD_RAP_ANO DESC, CD_RAP DESC, DT_INSERCAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

			if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT IN_MODO_SIMPLES FROM TGRUPO WHERE CD_GRUPO ='" & Session("GrupoUsuario") & "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

				if objrsx.RecordCount > 0 then
					 Session("InModoSimplesCheck") = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
				end if

%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>">
  <form name="frmEmbarque" action="ccembarque.asp" method="post" onSubmit="return ValidaForm(this);">
    <input type="hidden" name="cd_menu" value="<%= cd_menu%>">
    <input type="hidden" name="cd_subm" value="<%= cd_subm%>">
    <input type="hidden" name="cd_docto" value="<%= cd_docto%>">
    <input type="hidden" name="vTpAcao" value="salvar">
    <input type="hidden" name="vInConsolidado" value="0">
    <tr height="25" style="background-color:<%=topo_div%>;">
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td style="text-align:center;"><b>&nbsp;Montar Embarque</b></td>
          </tr>
        </table></td>
    </tr>
    <tr>

      <td><div id="embarque" class="popupClass" style="width:700px;" style="background-color:<%=fundo_div %>;">
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr height="18">
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Enviar</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;"> Instrução/CDE </td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Cliente/Importador</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;"><nobr>&nbsp;País de Destino</nobr></td>
              <% If Session("InModoSimplesCheck") <>"1" Then%>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Fornecimentos</td>
              <%Else%>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Processo</td>              
              <%End If%>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Incoterm</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Transporte</td>
             	<% If Session("InModoSimplesCheck") <>"1" Then%>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Exportador</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Logomarca</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Coleta</td>
              <td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;Cond. Pagto.</td>
              <%End If%>
            </tr>
            <%
if objrs.RecordCount > 0 then
	'lista RAP´s para exibi-las em tela    
	do while not objrs.Eof
    if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result

        'If Len(Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value)) >= 54 Then
            str_fornecimentos = ""
            mtz_fornecimentos = Split(objrs.Fields.Item("NR_FORNECIMENTO").Value, ";")    
            j = 0
            For i = 0 to UBound(mtz_fornecimentos)        
                str_fornecimentos =  str_fornecimentos & mtz_fornecimentos(I) & " "
                j = j + 1
                If j = 7 Then
                    str_fornecimentos = str_fornecimentos & "<br>"
                    j = 0
                End If
            Next
        'Else
           str_fornecimentos = Replace(str_fornecimentos, ";", " ")
        'End If

		vNrRap = objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value
		vNrCDE = objrs.Fields.Item("NR_CDE").Value
		vCodImp = objrs.Fields.Item("CD_CLIENTE").Value
		vCodPais = objrs.Fields.Item("CD_PAIS").Value
		vCodColeta = objrs.Fields.Item("CD_DEP_COLETA").Value
		vCodIncoterm = objrs.Fields.Item("CD_INCOTERM").Value
		vCodTermoPgto = objrs.Fields.Item("CD_TERMO_PAGTO").Value
		vCodExp = objrs.Fields.Item("CD_EXPORTADOR").Value
		vCodLogo = objrs.Fields.Item("CD_LOGOMARCA").Value
		vCodViaTransp = objrs.Fields.Item("CD_VIA_TRANSPORTE").Value
		vNmColeta1 = objrs.Fields.Item("NM_DEP_COLETA_1").Value
		vCodEmbarcador = objrs.Fields.Item("CD_EMBARCADOR").Value
		
		if objrsx.State = adStateOpen then objrsx.Close()						
			sql = " SELECT G.IN_MODO_SIMPLES AS IN_MODO_SIMPLES FROM TEMPRESA_NAC E (NOLOCK)" &_
			" LEFT JOIN TGRUPO G ON (G.CD_GRUPO = E.CD_GRUPO)"&_
			" WHERE E.CD_EMPRESA = '" & vCodExp & "'"'exportador
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	        if objrsx.RecordCount > 0 then
		        Session("InModoSimplesCheck") = objrsx.Fields.Item("IN_MODO_SIMPLES").Value
		    end if
        
            'COMENTADO POR GUILHERME - 21/03/2012 - Não fazer mais a checagem de billing doc
            'if objrsx.State = adStateOpen then objrsx.Close() 
            'sql = " SELECT CD_REFERENCIA FROM TRAP_FORNECIMENTO " &_
            '" WHERE CD_RAP = '" & Left(vNrRap, 6) & "'" &_
            '"   AND CD_RAP_ANO = '" & Right(vNrRap, 2) & "'" &_
            '"   AND CD_GRUPO = '" & Session("GrupoUsuario") & "'" &_
            '"   AND LEFT(RTRIM(LTRIM(CD_REFERENCIA)),4) = '8000'"
			'objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
           
            'in_doctos_rap = 1
            'Set objFSO_RAP = Server.CreateObject("Scripting.FileSystemObject")
            'If objrsx.RecordCount > 0 then                  
            '    If Not objFSO_RAP.FileExists(Server.MapPath("/docs_rap/rap"& vNrRap & "_3.txt")) Then	
            '        in_doctos_rap = 0
            '    End If
            'End If
            'Set objFSO_RAP = Nothing
            %>
            <tr bgcolor="<%= bgcolor %>">
              <td align="center"><input type="checkbox" name="chkCodRapAno" value="<%= vNrRap%>" vNrCDE="<%= vNrCDE%>" vCodImp="<%= vCodImp%>" vCodPais="<%= vCodPais%>" vCodColeta="<%= vCodColeta%>" vNmColeta1="<%= vNmColeta1%>" vCodIncoterm="<%= vCodIncoterm%>" vCodTermoPgto="<%= vCodTermoPgto%>" vCodExp="<%= vCodExp%>" vCodLogo="<%= vCodLogo%>" vCodViaTransp="<%= vCodViaTransp%>" vModoSimples="<%= Session("InModoSimplesCheck")%>" vCodEmbarcador="<%= vCodEmbarcador%>"/></td>
              <td><%= Left(vNrRap, 6)&"/"&Right(vNrRap, 2)%>&nbsp;</td>
              <td><%= objrs.Fields.Item("NM_EMPRESA").Value%>&nbsp;</td>
              <td><%= objrs.Fields.Item("NM_PAIS").Value%>&nbsp;</td>
              <td><%= str_fornecimentos%>&nbsp;</td>
              <td><%= objrs.Fields.Item("CD_INCOTERM").Value%>&nbsp;</td>
              <td><% if fnc_TestaVar(vCodViaTransp) then Response.Write(aViaTransp(CInt(vCodViaTransp)-1))%>
                &nbsp;</td>
                 <%If Session("InModoSimplesCheck")<>"1" Then%>
              <td><%= objrs.Fields.Item("CD_EXPORTADOR").Value%>&nbsp;</td>
              <td><% if fnc_TestaVar(vCodLogo) then Response.Write(logo_saint(vCodLogo))%>
                &nbsp;</td>
              <td><%= objrs.Fields.Item("CD_DEP_COLETA").Value%>&nbsp;</td>
              <td><%= objrs.Fields.Item("CD_TERMO_PAGTO").Value%>&nbsp;</td>
              <%End If%>
            </tr>
            <%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop    
	objrs.Close()
else
      %>
  <tr height="15" bgcolor="<%= linha_result%>" align="center" valign="top">
  <td colspan="8">
  <img name="imgAlerta" src="/imagens/alerta_32.gif" style="border:0;" align="absmiddle">Não existem instruções válidas para se criar um embarque
  </td>
  </tr>
  <%
end if
%>
          </table>
        </div></td>
    </tr>
    <tr height="35" align="center" style="background-color:<%=topo_div%>">
      <td>
      <%If Session("InConferencia") = "1" or  Session("InConferenciaCheck") = "1" Then%>
      <input type="hidden" name="conferir" value="1">
      <input type="submit" class="button" name="btnEnviar" value="Conferir"/>
      <%Else%>
      <input type="submit" class="button" name="btnEnviar" value="Cria Embarque" />
      <%End If%>
        <input type="button" class="button" name="btnCancelar" value="Cancelar" onClick="window.close();" /></td>
    </tr>   
  </form>
</table>
<%End If%>
</body>
</html>
<script language="javascript">
<!--
if (gTpAcao == "salvar") window.opener.location.href='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&acao=listar';
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
