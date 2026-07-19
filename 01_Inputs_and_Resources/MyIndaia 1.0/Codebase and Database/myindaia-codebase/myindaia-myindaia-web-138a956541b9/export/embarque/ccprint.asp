<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim vNrRap : vNrRap = Trim(Request("vNrRap"))
dim vNrCde, vVolume, vTpStatus, vDtStatus, vHrStatus

if not fnc_TestaVar(vNrRap) then tx_erro = " - Código da Instrução não definido;\n"

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

sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO,CD_CLIENTE,CD_EMBARCADOR,CD_DEP_COLETA,NM_DEP_COLETA_1,CD_FABRICANTE,CD_EXPORTADOR, NR_FORNECIMENTO, "&_

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
			"  CAST(IN_EXPURGO as char(1)) AS IN_EXPURGO, CAST(IN_INSPECAO as char(1)) AS IN_INSPECAO, CAST(IN_SEM_PACK_LIST as char(1)) AS IN_SEM_PACK_LIST, "&_
			"  CAST(IN_CARTA_CREDITO as char(1)) AS IN_CARTA_CREDITO, CAST(IN_CADIVI as char(1)) AS IN_CADIVI, "&_
			"  CAST(IN_AMOSTRA as char(1)) AS IN_AMOSTRA, CAST(IN_ANTECIPADO as char(1)) AS IN_ANTECIPADO, "&_
			"  DT_FATURAMENTO, DT_EMBARQUE, ISNULL(TX_ORGAO,'&nbsp;') AS TX_ORGAO, ISNULL(TX_LOCAL_INSPECAO,'&nbsp;') AS TX_LOCAL_INSPECAO, "&_
			"  ISNULL(TX_LOCAL_EXPURGO,'&nbsp;') AS TX_LOCAL_EXPURGO, ISNULL(TX_EMBALAGEM,'&nbsp;') AS TX_EMBALAGEM, "&_
			"  ISNULL(TX_MARCACAO,'&nbsp;') AS TX_MARCACAO, ISNULL(TX_INST_EMB, '&nbsp;') AS TX_INST_EMB, ISNULL(TX_MOTIVO_DESC, '&nbsp;') AS TX_MOTIVO_DESC, "&_
			"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_FRETE_INT, 0) AS VL_FRETE_INT, ISNULL(VL_SEGURO, 0) AS VL_SEGURO, "&_
			"  ISNULL(VL_ACRESCIMO, 0) AS VL_ACRESCIMO, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(VL_COMISSAO, 0) AS VL_COMISSAO, "&_
			"  ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(NR_BIG_BAGS, 0) AS NR_BIG_BAGS, ISNULL(NR_BIG_BAGS_PALLETS, 0) AS NR_BIG_BAGS_PALLETS, "&_
            "  ISNULL(NR_CAIXAS,0) AS NR_CAIXAS, ISNULL(NR_PALLETS,0) AS NR_PALLETS, ISNULL(NR_JUMBOS,0) AS NR_JUMBOS, ISNULL(NR_PACOTES,0) AS NR_PACOTES,"&_
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL, ISNULL(NR_NOTAS_FISCAIS, '&nbsp;') AS NR_NOTAS_FISCAIS, ISNULL(NR_EASY, '&nbsp;') AS NR_EASY "&_
			"FROM TRAP R (NOLOCK) "&_
			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"&_
			" AND CD_GRUPO ='" & Session("GrupoUsuario") & "'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'**********************************************************************************************************
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "select NM_USUARIO from broker.dbo.tusuario WHERE CD_USUARIO='"&objrs.Fields.Item("CD_USUARIO_CRIADOR").Value&"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'**********************************************************************************************************

vl_heigth = 20
'vNrCde = objrs.Fields.Item("NR_CDE").Value
vNrCde=objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value 'FLAVIO 14/01/2008
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
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<%corpo = "<style type='text/css'>"
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
corpo = corpo & "<table width='670' border='0' cellspacing='1' cellpadding='0' style='padding: 0px 1px 0px 1px;'>"
corpo = corpo &	"<tr>"
corpo = corpo &	"	<td><table width='100%' border='0' cellspacing='0' cellpadding='5'>"
corpo = corpo &	"		<tr>"
corpo = corpo &	"			<td rowspan='2' width='160'><img src='http://www.myindaiaweb.com.br/imagens/" & fncSelecionaLogo(objrs.Fields.Item("CD_LOGOMARCA").Value) & "'></td>"
if Session("GrupoUsuario") = "241" Then
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
corpo = corpo &	"			<td class='c1' colspan='2'><b>Sem Fornecimento/Packing List? (Amostra)</b></td>"
corpo = corpo &	"			<td class='c2' colspan='2'>" & sim_nao(objrs.Fields.Item("IN_AMOSTRA").Value) & "</td>"
corpo = corpo &	"			<td class='c1' style='display:none;'><b>Antecipado?</b></td>"
corpo = corpo &	"			<td class='c2' style='display:none;'>" & sim_nao(objrs.Fields.Item("IN_ANTECIPADO").Value) & "</td>"
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
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(objrs.Fields.Item("DT_FATURAMENTO").Value, 5) & "&nbsp;</td>	"
corpo = corpo &	"		</tr>"



corpo = corpo &	"		<tr height="& vl_heigth & ">"
if Session("GrupoUsuario") = "241" Then
corpo = corpo &	"			<td class='c1'><b>Processo:</b></td>"
Else
corpo = corpo &	"			<td class='c1'><b>Nr. Fornecimento:</b></td>"
End If
corpo = corpo &	"			<td colspan='3' class='c2'>" & Replace(Trim(objrs.Fields.Item("NR_FORNECIMENTO").Value),";","; ") & "</td>"
corpo = corpo &	"		</tr>"
If Session("InModoSimplesCheck")<>"1" Then
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
corpo = corpo &	"			<td class='c2'>" & fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5) & "&nbsp;</td>	"
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
	If Session("InModoSimplesCheck")<>"1" Then
corpo = corpo &	"			<td class='c1'><b>Moeda FOB: </b></td>"
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NM_MOEDA_MLE").Value & "</td>"
	End If
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
corpo = corpo &	"			<td class='c2'>" & objrs.Fields.Item("NR_CAIXAS").Value & " Cx(s);" & objrs.Fields.Item("NR_PALLETS").Value  & " Pallet(s);" & objrs.Fields.Item("NR_PACOTES").Value  & " Pct(s); " & objrs.Fields.Item("NR_JUMBOS").Value  & " Jumbo(s);" & objrs.Fields.Item("NR_BIG_BAGS").Value  & " Big Bag(s);" & objrs.Fields.Item("NR_BIG_BAGS_PALLETS").Value  & " Big Bag(s) Pallet(s);&nbsp;</td>"
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
Response.write corpo
%>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->