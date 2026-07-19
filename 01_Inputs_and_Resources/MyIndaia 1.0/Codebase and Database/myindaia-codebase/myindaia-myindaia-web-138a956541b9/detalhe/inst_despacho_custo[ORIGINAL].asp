<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300

Dim nr_invoice
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo

aCondicao = Array("INVOICE","INVOICE - especial","Registro da DI","Conhecimento Embarque")

caminho = Server.MapPath("\excel\arquivo")
arquivo = "\inst_custo_"& Session("cd_usuario") &"_"&_
					Year(Date) & Month(Date) & Day(Date) &"_"&_
					Hour(Time) & Minute(Time) & Second(Time) &".xls"
in_show = False
cd_tela = "DET010"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))

url = "?cd_menu="&  CStr(Request.QueryString("cd_menu")) &_
			"&cd_subm="&  CStr(Request.QueryString("cd_subm")) &_
			"&cd_view="&  CStr(Request.QueryString("cd_view")) &_
			"&cd_menu_rel="&  CStr(Request.QueryString("cd_menu_rel")) &_
			"&cd_subm_rel="&  CStr(Request.QueryString("cd_subm_rel")) &_
			"&cd_view_rel="&  CStr(Request.QueryString("cd_view_rel")) &_
			"&nr_proc_adm="&  CStr(Request.QueryString("nr_proc_adm")) &_
			"&nr_proc_des="&  CStr(Request.QueryString("nr_proc_des")) &_
			"&nr_processo="&  CStr(Request.QueryString("nr_processo")) &_
			"&cd_unid_neg="&  Request.QueryString("cd_unid_neg") &_
			"&cd_produto="&  Request.QueryString("cd_produto") &_
			"&cd_cliente="&  Request.QueryString("cd_cliente") &_
			"&nr_referencia="&  Request.QueryString("nr_referencia") &_
			"&nr_item_clnte="&  Request.QueryString("nr_item_clnte")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
<style type="text/css">
td {
	font-size: 9px;
}

.instrucao {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}

.azulEscuro {
	background: #336699;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}
.azulClaro {
	background: #7799CC;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}

.branco {
	background: #FFFFFF;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}

.cinza {
	background: #DDDDDD;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}
.cinzaClaro {
	background: #EEEEEE;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}
.style1 {background: #CCCCCC; height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style2 {height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style4 {font-size: 8px}
.style5 {color: #339966;	font-weight: bold;}
.style6 {color: #FF0000}
.style7 {font-size: 16px;	font-weight: bold;}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

MM_reloadPage(true);

function fncValidaForm(form) {
	var b = true;
	//verifica dias e condição
	if (form.nrDias.options[form.nrDias.selectedIndex].value=='' || form.txCondicao.options[form.txCondicao.selectedIndex].value=='') {
		if (form.nrDias.options[form.nrDias.selectedIndex].value=='') {
			alert('Selecione o nr. de dias!');
			form.dtDocs.focus();
		}
		if (form.txCondicao.options[form.txCondicao.selectedIndex].value=='') {
			alert('Selecione o tipo de documento!');
			form.dtDocs.focus();
		}
		b=false;
	}
	
	//validação de data
	dt1 = getValidDate(form.dtDocs.value);
	if (dt1==undefined) {
		form.dtDocs.style.background = 'red';
		alert('Verifique campos data: data inválida!');
		form.dtDocs.style.background = 'white';
		form.dtDocs.select();
		form.dtDocs.focus();
		b=false;
	}
	return b;
}

function abreProvaReal(nr_processo) {
	features = "top=150,left=50,width=200,height=147,scrollbars=no,menubar=no,status=yes";
	window.open('/detalhe/prova_inst_despacho_custo.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>', 'win8',features);
}

function fncCondicaoChange(objSelect) {
	if(objSelect.options[objSelect.selectedIndex].value=='') {
		document.frmInstrucao.nrDias.value = '';
	} else {
		if(objSelect.options[objSelect.selectedIndex].value=='1') {
			document.frmInstrucao.nrDias.value = '60';
			document.frmInstrucao.dtDocs.focus();
		}
	}
}
/*
function fncMudaUnidChange(objSelect) {
	if(objCheck.checked && objSelect.options[objSelect.selectedIndex].value<>'') {
		for(i=0; i< document.frmInstrucao.txNovaUnid.length;i++)
			document.frmInstrucao.txNovaUnid[i].value = objSelect.options[objSelect.selectedIndex].value;
	}
}

function fncUnidIgualClick(objCheck) {
	if(objCheck.checked && document.frmInstrucao.txUnidade.options[document.frmInstrucao.txUnidade.selectedIndex].value<>'') {
		for(i=0; i< document.frmInstrucao.txNovaUnid.length;i++)
			document.frmInstrucao.txNovaUnid[i].value = document.frmInstrucao.txUnidade.options[document.frmInstrucao.txUnidade.selectedIndex].value;
	}
}
*/
//-->
</script>
</head>
<body>
<%
if Request.Form = "" then
  vTitulo = tx_lang_A00094(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))
else
  vTitulo = tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))
end if
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr height="25">
		<td colspan="3" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="titpopup">&nbsp;<%= vTitulo%></td>
					<%
if Request.Form <> "" then

		vNrDias = Request.Form("nrDias")
		vTxCondicao = Request.Form("txCondicao")
		vDtDocto = Request.Form("dtDocs")
%>
          <td width="25"><a href="javascript:abreProvaReal('<%= nr_processo %>');"><img src="/imagens/icones/16x16/button_edit.gif" alt="Exibi&ccedil;&atilde;o da Prova Real" width="16" height="16" border="0"></a></td>
					<td width="25"><a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"><img src="/imagens/icones/16x16/btn_excel.gif" alt="Download da planilha para integra&ccedil;&atilde;o de custos da importa&ccedil;&atilde;o" width="16" height="16" border="0"></a></td>
					<td width="25"><a href="#" onClick="javascript:window.open('print_inst_despacho_custo.asp<%=url%>&nrDias=<% = vNrDias %>&txCondicao=<%= vTxCondicao %>&dtDocs=<%= vDtDocto %>','Imprimir','top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=no');"><img src="/imagens/icones/16x16/btn_print.gif" alt="Impress&atilde;o da tela abaixo" width="17" height="17" border="0"></a></td>
					<%
end if		
%>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
		 </table>
	  </td>
  </tr>
	
	<tr>
	<td>
	<%
if Request.Form = "" then
  sql = "SELECT DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, "&_
				"  DM.CD_MERCADORIA, ME.AP_MERCADORIA, DM.QT_MERC_UN_COMERC, UM.NM_SIGLA, DP.CD_EXTERNO "&_
	      "FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.NR_PROCESSO    = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA         ME (NOLOCK) ON (ME.CD_MERCADORIA  = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) "&_
        "   LEFT JOIN TDE_PARA            DP (NOLOCK) ON (DP.CD_TABELA = '20' AND DP.CD_DDBROKER = UM.NM_SIGLA) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	if objrs.RecordCount > 0 then
%>
      <div id="inicio" class="instrucao">
			<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="vertical-align:middle;">
				<form name="frmInstrucao" action="" method="post" onSubmit="return fncValidaForm(this);">
					<tr height="25">
						<td colspan="2" align="center"><span class="style7">Informa&ccedil;&otilde;es Complementares</span></td>
					</tr>
					<tr height="25">
						<td width="15%"><label for="condicao" class="label">Condições</label></td>
						<td width="85%"><select name="nrDias" id="dias" class="select" style="width:50px;">
								<option value="" selected>--</option>
								<option value="30">30</option>
								<option value="45">45</option>
								<option value="60">60</option>
								<option value="75">75</option>
								<option value="90">90</option>
								<option value="120">120</option>
							</select>
							dias do
							<select name="txCondicao" id="condicao" class="select" style="width: 155px;" onChange="fncCondicaoChange(this);">
								<option value="" selected>Selecione o documento</option>
								<%
	for x = 0 to UBound(aCondicao)
		Response.Write("<option value='"& x &"'>"& aCondicao(x) &"</option>")
	next
%>
							</select></td>
					</tr>			
					<tr height="25">
						<td><label for="Docs" class="label">Data Doc.</label></td>
						<td><input type="text" name="dtDocs" id="Docs" maxlength="10" class="editbox" style="width: 75px;">
							<a href="javascript:showCal('InstCusto')"><img height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle"></a>
							(formato: DD/MM/AAAA)</td>
					</tr>
					<!--
					<tr height="25">
						<td colspan="2"><label for="txUnid">Unidade de medida para as mercadorias do processo:</label>
							<select name="txUnid" id="txUnid" class="select" style="width:45px;" onChange="fncMudaUnidChange(this);">
								<option value="" selected>--</option>
								<option value="CX">CX</option>
								<option value="JG">JG</option>
								<option value="KG">KG</option>
								<option value="KIT">KIT</option>
								<option value="KT">KT</option>
								<option value="LB">LB</option>
								<option value="LT">LT</option>
								<option value="M">M</option>
								<option value="M2">M2</option>
								<option value="PÇ">PÇ</option>
							</select></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><input name="InUnidIgual" id="UnidIgual" type="checkbox" value="1" onClick="fncUnidIgualClick(this);">
							<label id="UnidIgual">Todas mercadorias tem a mesma unidade de medida?</label></td>
					</tr>
					-->
					<tr>
						<td colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr height="20">
									<td width="40%"><b>Mercadoria</b></td>
									<td width="20%"><div align="center"><b>Unidade Atual</b></div></td>
									<td width="20%"><div align="center"><b>Unidade Externa SGA (Excel)</b></div></td>
									<td width="20%"><div align="center"><b>Nova Unidade</b></div></td>
								</tr>
<%		do while not objrs.Eof %>
								<tr height="16">
									<td><%= objrs.Fields.Item("AP_MERCADORIA").Value%>&nbsp;
									<input name="cdMercadoria" type="hidden" id="cdMercadoria" value="<%= Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.Fields.Item("CD_MERCADORIA").Value)%>"></td>
									<td align="right"><%= FormatNumber(objrs.Fields.Item("QT_MERC_UN_COMERC").Value, 3) &" "& objrs.Fields.Item("NM_SIGLA").Value%>&nbsp;</td>
									<td align="right"><%= objrs.Fields.Item("CD_EXTERNO").Value%>&nbsp;</td>									
									<td align="right"><nobr>
										<input type="text" name="nrNovaQtde" class="editbox" style="width:60px;">
										<select name="txNovaUnid" id="txNovaUnid" class="select" style="width:45px;">
											<option value="" selected></option>
     									<!--#include virtual="/selects/option_unidmedsg.txt"-->
										</select>
									</nobr></td>
								</tr>
								<%
			objrs.MoveNext
			if objrs.eof then exit do
		loop
%>
							</table></td>
					</tr>
			
					<tr height="50">
						<td colspan="2" align="center"><input class="button" name="btnEnviar" type="submit" value="Exibir Instrução">
							<input class="button" name="btnLimpar" type="reset" value="Limpar">
							<input class="button" name="btnCancel" type="button" value="Cancelar" onClick="window.close();"></td>
					</tr>
				</form>
			</table>
			</div>
			<%
  else
	%>
		<p align="center">Não foram encontradas informações de custo suficientes para este processo.</p>	
<%
  end if				
else
	sql = "SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, CONVERT(INTEGER, DM.NR_ITEM_PO) AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA, SD.VL_PAGTO AS VL_SDA, (SD.VL_PAGTO*0.2) AS VL_INSS, "&_
				"  ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, DM.CD_UN_MED_COMERC AS UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
				"   CASE DI.CD_MOEDA_MLE WHEN '790' THEN 'BRL' WHEN '220' THEN 'USD' WHEN '978' THEN 'EURO	' "&_
        "     ELSE (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) END AS SIGLA_MOEDA_MLE, "&_
				"  (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO) AS NM_MOEDA_SEGURO,"&_
				"  (SELECT AP_TRANSP_ROD FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = PR.CD_TRANSP_NAC) AS NM_TRANSP_ROD, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMBARQUE, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMBARQUE, "&_
				"  (SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_CLIENTE) AS CD_GRUPO, "&_
				"  (SELECT DATEADD(day, -1, DT_REALIZACAO) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '001') AS DT_ENVIO_DOCS, "&_
				"  (SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '092') AS DT_FATURA, "&_
				"  (SELECT UPPER(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_TRANSP, "&_
				"  (SELECT NM_AREA FROM TAREA (NOLOCK) WHERE CD_AREA = PR.CD_AREA) AS NM_AREA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(CASE CC.IN_RESTITUI "&_
				"                              WHEN '0' THEN CC.VL_ITEM "&_
				"                              ELSE CC.VL_ITEM *(-1) "&_
				"                             END), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC CC ( NOLOCK ) "&_
				" INNER JOIN BROKER.DBO.TS_FATURA TSF (NOLOCK) ON  TSF.CD_UNID_NEG = CC.CD_UNID_NEG "&_
        "  AND TSF.CD_PRODUTO = CC.CD_PRODUTO "&_
        "  AND TSF.NR_SOLICITACAO = CC.NR_SOLIC_FAT "&_
        "  AND TSF.TP_TIPO_FAT = 'F' "&_
				"           WHERE CC.NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(CC.IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CC.CD_ITEM AS INT) < 900), 0)) AS VL_DESPESA_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_FRETE_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA "&_
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
		'Response.Write(sql)
	With objcmd
		.CommandTimeOut = 120
		.CommandText = sql
		.CommandType = adCmdText
	End With
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	
	If objrs.RecordCount > 0 Then
		'REFERENCIAS
		sql = "SELECT DISTINCT CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND TP_REFERENCIA = '01' ORDER BY CD_REFERENCIA"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_referencia = ""
			Do while not objrsx.Eof
				nr_referencia = nr_referencia & Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else nr_referencia = nr_referencia &"<br>"
			Loop
		End If
		objrsx.Close
		'INVOICE 
		sql = "SELECT NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUCAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_TIPO_DCTO_INSTR = '01'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_invoice = ""
			Do while not objrsx.Eof
				nr_invoice = nr_invoice & Trim(objrsx.Fields.Item("NR_DCTO_INSTRUCAO").Value)
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else nr_invoice = nr_invoice &"<br>"
			Loop
		End If
		objrsx.Close
		'NOTA FISCAL
		sql = "SELECT NR_NOTA, DT_NOTA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND IN_CANCELADO = '0'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_nf = ""
			dt_nf = ""
			txNotaFiscal = ""
			Do while not objrsx.Eof
				nr_nf = "&nbsp;"& Trim(objrsx.Fields.Item("NR_NOTA").Value) &"&nbsp;&nbsp;"
				dt_nf = fnc_Mascara(objrsx.Fields.Item("DT_NOTA").Value, 5)
				txNotaFiscal = txNotaFiscal & nr_nf & dt_nf
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else txNotaFiscal = txNotaFiscal &"<br>"
			Loop
		End If
		objrsx.Close
		
		'somente para saint goban
		if objrs.Fields.Item("CD_GRUPO") = "028" then
			txObs = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. <u>Retirar o B/L original com o Agente;</u><br>"&_
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <u>Para transporte favor procurar Sr. Rafael(Sigma) - Tel.(13)3203-1112.</u>"
		end if
		
		vlTotal = objrs("VL_TOTAL_MLE_MN")+objrs("VL_DESPESA_INDAIA")+objrs("VL_INSS")+objrs("VL_TOTAL_SEG_MN")-objrs("VL_RECUPERADO")
		vlNota = objrs("VL_CIF_MN")+objrs("VL_TOTAL_II")
		vlDesp = objrs("VL_DESPESA_INDAIA")-objrs("VL_RECUPERADO")-objrs("VL_TOTAL_II")-objrs("VL_FRETE_INDAIA")-objrs("VL_CAPATAZIA")
		if objrs("TP_FRETE") = "0" then
			vlDif = objrs("VL_FRETE_INDAIA")-objrs("VL_TOTAL_FRETE_MN")
		else
			vlDif = 0
		end if
		
		select case objrs.fields.item("CD_FABR_EXPO").value
			case 1 vTxFabric = objrs.Fields.Item("AP_EXPORTADOR").Value
			case 2 vTxFabric = objrs.Fields.Item("NM_FABRICANTE").Value
			case 3 vTxFabric = ""
		end select
		
		select case objrs.fields.item("IN_TIPO_M_E").value
			case "M" vTipoImport = "Matéria-Prima"
			case "E" vTipoImport = "Equipamentos"
			case "R" vTipoImport = "Revenda"
			case "C" vTipoImport = "Consumo"
			case "A" vTipoImport = "Ativo"
			case else vTipoImport = ""
		end select
		
		select case objrs.fields.item("IN_TIPO_M_E").value
			case "M","R" vInIPIRec = "sim"
			case else vInIPIRec = "não"
		end select
		
'		With objcmd
'			.CommandTimeOut = 60
'			.CommandText    = "sp_calc_dias_uteis"
'			.CommandType    = adCmdStoredProc
'			.Parameters.Append = .CreateParameter("@dt_ini", adDate, adParamInput, 10, vDtDocto)
'			.Parameters.Append = .CreateParameter("@nr_dia", adInteger, adParamInput, 4, vNrDias)
'			.Parameters.Append = .CreateParameter("@dt_fim", adDate, adParamOutPut)
'			.Execute , , adExecuteNoRecords
'			vDtVencto = .Parameters("@dt_fim")
'		End With
'   a pedido de Wagner Branco (25/09/2007) considerar dias corridos para o cálculo do vencimento		
		vDtVencto = DateAdd("d", vNrDias, vDtDocto)

		if vTxCondicao = 1 then
			if Day(vDtVencto) < 15 then
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
			elseif Day(vDtVencto) > 15 then	  
				vDtVencto = DateAdd("m", 1, vDtVencto)
				if Month(vDtVencto) = 1 then
				  vDtVencto = DateAdd("y", 1, vDtVencto)
				end if	
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
			end if
		end if

		if objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" then
			vTipoTransp = objrs.Fields.Item("NM_EMBARCACAO").Value
		else
			vTipoTransp = objrs.Fields.Item("NM_TRANSP").Value
		end if
%>
 <div id="instrucao" class="instrucao">
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

	<tr>
	  <td valign="top" style="border: solid 1px #336699;">
		  <table border="0" cellpadding="1" cellspacing="1">
				<col width="275">
				<col width="250">
				<col width="225">
				<col width="135">
				<col width="175">
				<tr height="45">
					<td colspan="5" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><%= tx_lang_A00094(cd_lang)%></b></div></td>
				</tr>
				<tr height="30">
					<td class="azulClaro"><b>REFER&Ecirc;NCIA</b></td>
					<td class="cinza"><div align="center"><%= nr_referencia%></div></td>
					<td class="azulClaro"><b>DATA</b></td>
					<td class="cinza"><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_ENVIO_DOCS").Value, 5)%></div></td>
					<td rowspan="2" class="azulClaro"><div align="center" style="font-size:12px;"><b><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></b></div></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;FORNECEDOR:</b></div></td>
					<td colspan="2" class="cinzaClaro"><%= objrs.Fields.Item("NM_FORNECEDOR").Value%></td>
					<td class="cinzaClaro"><%= objrs.Fields.Item("NR_CLIENTE").Value%></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;Documentos:</b></div></td>
					<td class="azulClaro"><b>Original</b></td>
					<td class="azulClaro"><b>C&oacute;pia</b></td>
					<td class="cinza"><%= fnc_Mascara(vDtDocto, 5)%></td>
					<td rowspan="3" class="azulEscuro"><div align="center"><b>INFO GERAL PARA DI</b></div></td>
				</tr>
				<tr height="135">
					<td class="cinzaClaro" valign="top"><div align="left">&nbsp;Invoice</div></td>
					<td rowspan="3" class="cinzaClaro" valign="top" style="border-style: none;"><div align="right"><%= nr_invoice%></div></td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
				</tr>
        <tr>
	        <td class="cinzaClaro">&nbsp;</td>
				</tr>
				<tr>
	        <td class="cinzaClaro">&nbsp;</td>
					<td class="azulClaro">TRANSPORTE</td>
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" ><div align="left"><b>&nbsp;NOTAS:</b></div></td>
					<td colspan="3" rowspan="2" class="cinza" style="font-size: 8px;"><%= txObs%></td>
          <td class="cinza"><div align="center"><%= vTipoTransp%></div></td>
				</tr>
				<tr>
					<td class="azulClaro">B/L ou AWB</td>					
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;C&Acirc;MBIO</b></div></td>
					<td class="azulClaro" style="border-style: none;">CONDI&Ccedil;&Otilde;ES</td>
					<td class="azulClaro" style="border-style: none;">VENCTO</td>
					<td class="azulClaro" style="border-style: none;">DIAS(corridos)</td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NR_CONHECIMENTO").Value%></div></td>					
				</tr>
				<tr>
					<td class="cinza">&nbsp;<%= vNrDias &" DIAS "& aCondicao(vTxCondicao)%></td>
					<td class="cinza"><div align="right"><%= fnc_Mascara(vDtVencto, 5)%>&nbsp;</div></td>
					<td class="cinza"><div align="right"><%= DateDiff("d", vDtDocto, vDtVencto)%>&nbsp;</div></td>
          <td class="azulClaro">PORTO DE SA&Iacute;DA </td>
				</tr>
				<tr>
					<td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;VALOR</b></div></td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></div></td>
					<td class="cinzaClaro"><div align="right"><span class="style5"><%= FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value, 2)%></span>&nbsp;</div></td>
					<td class="cinzaClaro">&nbsp;</td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_EMBARQUE").Value%></div></td>
				</tr>
				<tr>
					<td colspan="4" rowspan="2" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>C&Aacute;LCULO CUSTO</b></div></td>
					<td class="azulClaro">DATA SA&Iacute;DA </td>
				</tr>
				<tr>
          <td class="cinza"><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;<%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("TX_MLE").Value, 7)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">PORTO CHEGADA </td>
					</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2"><b>&nbsp;VALOR DA FATURA EM R$</b></td>
					<td><div align="right"><b><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_MLE_MN").Value, 2)%></b>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="cinza"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_DESEMBARQUE").Value%></div></td>
				</tr>
				<tr>
					<td colspan="4" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><b>&nbsp;CONTABILIZA&Ccedil;&Atilde;O</b></b></div></td>
					<td class="azulClaro">DATA CHEGADA </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="4" class="style2">&nbsp;DESPESAS:</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_CHEGADA_CARGA").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;<%= Trim(Mid(nr_processo, 5, 13))%></td>
					<td><i>&nbsp;INDAIA</i></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_DESPESA_INDAIA").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">FABRICANTE</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;INSS s/ S.D.A. n.&ordm; </td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)%>&nbsp;</div></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_INSS").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= vTxFabric%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td class="azulClaro">EXPORTADOR</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;IPI SOBRE IMPORTA&Ccedil;&Atilde;O </td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("AP_EXPORTADOR").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;I.C.M.S., COFINS E I.P.I.</td>
					<td>&nbsp;RECUPERADO</td>
					<td><div align="right" style="color: #FF0000;">(<%= FormatNumber(objrs.Fields.Item("VL_RECUPERADO").Value, 2)%>)&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">INCOTERM</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;SEGURO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style6"><%= LCase(objrs.Fields.Item("NM_MOEDA_SEGURO").Value)%></span></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOT_SEGURO_MNEG").Value, 2)%>&nbsp;</div></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_SEG_MN").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("CD_INCOTERM").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2" >&nbsp;</td>
					<td ><div align="right">0,00&nbsp;</div></td>
					<td >&nbsp;</td>
					<td class="azulClaro">TIPO IMPORTA&Ccedil;&Atilde;O </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;Transporte Nacional</td>
					<td>&nbsp;<span class="style6"><i><b><%= UCase(objrs.Fields.Item("NM_TRANSP_ROD").Value)%></b></i></span></td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= UCase(vTipoImport)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;Tranporte Internacional </td>
					<td>&nbsp;</td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">MATERIAL</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;Armazenagem</td>
					<td>&nbsp;</td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("NM_MERCADORIA").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td rowspan="3" class="azulEscuro"><div align="center"><b>INFO GERAL CUSTO</b></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2" class="style2"><div style="font-size: 12px;">&nbsp;CUSTO TOTAL DA IMPORTA&Ccedil;&Atilde;O</div></td>
					<td><div align="right"><b><%= FormatNumber(vlTotal, 2)%>&nbsp;</b></div></td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>					
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b>&nbsp;NOTA(S) FISCAL NR. </b></td>
					<td><b>&nbsp;VALOR DA N.FISCAL</b></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b>DATA CUSTO</b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td><%= txNotaFiscal%></td>
					<td><div align="right"><%= FormatNumber(vlNota, 2)%>&nbsp;</div></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;NF COMPLEMENTAR </td>
					<td><div align="right"><%= FormatNumber(vlTotal-vlNota, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b>Imposto Importa&ccedil;&atilde;o </b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_II").Value, 2)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b> &nbsp;TOTAL DA MERCADORIA:</b></td>
					<td>&nbsp;</td>
					<td><div align="right"><%= FormatNumber(vlTotal, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center">D.I.</div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2"><b>&nbsp;TOTAL DO IPI: </b></td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
				  <td class="azulClaro"><div align="center">TAXA US$</div></td>	
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;IPI RECUPER&Aacute;VEL? (S/N)</td>
					<td><div align="center"><b><%= vInIPIRec%></b></div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("TX_DOLAR").Value, 7)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center">PLANTA</div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;TOTAL DA NOTA FISCAL: </td>
					<td><div align="right"><%= FormatNumber(vlTotal, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td ><div align="center"><%= objrs.Fields.Item("NM_AREA").Value%></div></td>
				</tr>
			</table>
    </td>
	</tr>
</table>		
</div>
<%
	End If
End If
%>		</td>
	</tr>
	<tr height="15" align="center">
		<td colspan="3" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<%
if Request.Form <> "" then
  if objrs.RecordCount > 0 then
		Dim objfso 'objeto do sistema de arquivos 
		Dim objtxt 'objeto para a criação de arquivos
		Dim txCabecExcel, txCorpoExcel, txLinhaExcel
		Dim vlTaxaMLE, vlDespacho, vlINSS, vlSeguro, vlQtde, vlItem, txUnid
		Dim aCdMercadoria, aNrNovaQtde, aTxNovaUnid
		
		'cria o objeto q gerencia o sistema de arquivos
		Set objfso = CreateObject("Scripting.FileSystemObject")
		'cria o ojbeto responsável pela criação do arquivo
		Set objtxt = objfso.CreateTextFile(caminho&arquivo, True, False)
		'inicia a gravação do arquivo xls para download
		objtxt.WriteLine("<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>")
		txCabecExcel = "<head>"&_
			"<meta http-equiv=Content-Type content='text/html; charset=windows-1252'>"&_
			"<meta name=ProgId content=Excel.Sheet>"&_
			"<meta name=Generator content='Microsoft Excel 9'>"&_
			"<!--[if !mso]><style>o\:* {behavior:url(#default#VML);}x\:* {behavior:url(#default#VML);}</style><![endif]-->"&_
			"<style id='custo_import'><!--"&_
			"table {mso-displayed-decimal-separator:'\,'; mso-displayed-thousand-separator:'\.';}"&_
			"tr {height:20px;}"&_
			"td {padding:5px;}"&_
			"br {mso-data-placement:same-cell;}"&_
			".basico {"&_
			"  color:windowtext;"&_
			"  text-align:general;"&_
			"  text-decoration:none;"&_
			"  vertical-align:bottom;"&_
			"  font-size:12.0pt;"&_
			"  font-style:normal;"&_
			"  font-weight:normal;"&_
			"  font-family:'Arial';"&_
			"  mso-generic-font-family:auto;"&_
			"  mso-font-charset:0;"&_
			"  mso-number-format:General;}"&_
			".data {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:'Short Date';"&_
			"  font-weight:bold;"&_
			"  text-align:center;"&_
			"  vertical-align:bottom;"&_
			"  border:1.0pt solid black;"&_
			"  background:#D4E6DC;}"&_
			".numCinza {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  font-weight:bold;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:.5pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:.5pt solid black;"&_
      "  color:#FFFFFF;"&_
			"  background:#003366;}"&_
			".numCinza3 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  font-weight:bold;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:.5pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:.5pt solid black;"&_
      "  color:#FFFFFF;"&_
			"  background:#003366;}"&_			
			".numLinha1 {"&_
 			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  background:#E5F7ED;}"&_
			".numLinha2 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  background:#D4E6DC;}"&_	
			".numLinha31 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  background:#E5F7ED;}"&_
			".numLinha32 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  background:#D4E6DC;}"&_						
			".numPerson {"&_
			"  mso-style-parent:basico2;"&_
			"  mso-number-format: ""_(* #,##0_);_(* (#,##0);_(* ""-""??_);_(@_)"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  background:#D4E6DC;}"&_	
			".numCinco {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00000"";"&_
			"  font-weight:bold;"&_
			"  border-top:none1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  background:#D4E6DC;}"&_				
      ".azulEscuro {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
      "  color:#FFFFFF;"&_
			"  background:#003366;}"&_		
      ".linha1 {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  background:#E5F7ED;}"&_		
      ".linha2 {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  background:#D4E6DC;}"&_							
			"--></style>"&_
			"<!--[if gte mso 9]><xml>"&_
			"<x:ExcelWorkbook>"&_
			"  <x:ExcelWorksheets>"&_
			"    <x:ExcelWorksheet>"&_
			"      <x:Name>Custo Importa&ccedil;&atilde;o</x:Name>"&_
			"      <x:WorksheetOptions>"&_
			"        <x:Zoom>85</x:Zoom>"&_
			"        <x:Selected/>"&_
			"        <x:FreezePanes/>"&_
			"        <x:FrozenNoSplit/>"&_
			"        <x:SplitHorizontal>5</x:SplitHorizontal>"&_
			"        <x:TopRowBottomPane>5</x:TopRowBottomPane>"&_
			"        <x:SplitVertical>4</x:SplitVertical>"&_
			"        <x:LeftColumnRightPane>4</x:LeftColumnRightPane>"&_
			"        <x:ActivePane>0</x:ActivePane>"&_
			"          <x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>1</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>2</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>0</x:Number><x:ActiveRow>0</x:ActiveRow><x:ActiveCol>0</x:ActiveCol></x:Pane>"&_
			"        </x:Panes>"&_
			"        <x:ProtectContents>False</x:ProtectContents>"&_
			"        <x:ProtectObjects>False</x:ProtectObjects>"&_
			"        <x:ProtectScenarios>False</x:ProtectScenarios>"&_
			"      </x:WorksheetOptions>"&_
			"    </x:ExcelWorksheet>"&_
			"  </x:ExcelWorksheets>"&_
			"  <x:ProtectStructure>False</x:ProtectStructure>"&_
			"  <x:ProtectWindows>False</x:ProtectWindows>"&_
			"</x:ExcelWorkbook>"&_
			"</xml><![endif]-->"&_
			"</head>"
		objtxt.WriteLine(txCabecExcel)
		
		vlTaxaMLE = objrs.Fields.Item("TX_MLE").Value
		If Not fnc_TestaVar(vlTaxaMLE) Then vlTaxaMLE = 0
		
		vlDespacho = objrs.Fields.Item("VL_DESPESA_INDAIA").Value - objrs.Fields.Item("VL_RECUPERADO").Value
		If Not fnc_TestaVar(vlDespacho) Then vlDespacho = 0
		
		vlINSS = objrs.Fields.Item("VL_INSS").Value
		If Not fnc_TestaVar(vlINSS) Then vlINSS = 0
		
		vlSeguro = objrs.Fields.Item("VL_TOTAL_SEG_MN").Value
		If Not fnc_TestaVar(vlSeguro) Then vlSeguro = 0
		
		txCorpoExcel = "<body>"&_
			"<div id='custo_import' align=center x:publishsource='Excel'>"&_
			"  <table x:str border=0 cellpadding=0 cellspacing=0 style='border-collapse:collapse;table-layout:fixed;'>"&_
			"    <col width=35>"&_
			"    <col width=120>"&_
			"    <col width=135>"&_
			"    <col width=120>"&_
			"    <col width=120>"&_
			"    <col width=140>"&_
			"    <col width=100>"&_
			"    <col width=100>"&_
			"    <col width=100>"&_
			"    <col width=50>"&_
			"    <col width=50>"&_
			"    <col width=150>"&_
			"    <col width=145>"&_
			"    <col width=150>"&_
			"    <col width=150>"&_
			"    <col width=150>"&_
			"    <col width=145>"&_
			"    <col width=140>"&_
			"    <col width=115>"&_
			"    <col width=115>"&_
			"    <col width=115>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class='azulEscuro'><nobr><b>Embarque:</b></nobr></td>"&_
			"    <td class='linha1'>"& fnc_Mascara(objrs.fields.item("NR_DI").value, 2) &"</td>"&_
			"    <td class='linha1'>&nbsp;</td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro style='border-right: none;'><nobr><b>Invoice e data:</b></nobr></td>"&_
			"    <td class=linha2 align=right style='border-right: none; border-bottom: 1.0pt solid black;'>"& nr_invoice &"</td>"&_
			"    <td class=linha2 x:num>"& fnc_Mascara(vDtDocto, 5) &"</td>"&_
			"    <td></td><td></td><td></td><td></td><td></td><td colspan='2'></td>"&_
			"    <td class=data style='color:#FF0000;' x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5), 3, 0) &"'></td>"&_
			"    <td class=data color:#FF0000; x:num='"& fnc_ConvertToExcel(objrs.Fields.Item("DT_FATURA").Value, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro><nobr><b>NF e data:</b></nobr></td>"&_
			"    <td class=linha1><nobr>"& txNotaFiscal &"</nobr></td>"&_
			"    <td class=azulEscuro><nobr><b>C&oacute;d. Fornecedor:</nobr></b></td>"&_
			"    <td class=azulEscuro><nobr><b>Texto Geral:</b></nobr></td>"&_
			"    <td class=linha1 style='vertical-align:top;'><nobr>"& nr_referencia &" NF "& nr_nf &" "& objrs.Fields.Item("NM_AREA").Value &"</nobr></td>"&_
			"    <td></td><td></td><td></td><td></td><td></td>"&_
			"    <td class=linha1>7639</td>"&_
			"    <td class=linha1>11366</td>"&_
			"    <td class=linha1>9222</td>"&_
			"    <td class=linha1>11126</td>"&_
			"    <td class=linha1>1531</td>"&_
			"    <td class=linha1>1170</td>"&_
			"    <td class=linha1>1851</td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro style='border-top:none; border-right: none;'><nobr><b>Conhec. Transporte:</b></nobr></td>"&_
			"    <td class=linha2 style='text-align: center; border-bottom: 1.0pt solid black;'></td>"&_
			"    <td class=linha2 align=right style='border-bottom: 1.0pt solid black; border-top: none;'>"& objrs.Fields.Item("NR_CLIENTE").Value &"</td>"&_
			"    <td class=azulEscuro style='border-top: none; border-right: none;'><nobr><b>Taxa:</b></nobr></td>"&_
			"    <td class=numCinco x:num='"& fnc_ConvertToExcel(vlTaxaMLE, 1, 16) &"'></td>"&_
			"    <td></td><td></td><td></td><td></td><td></td>"&_
			"    <td class=linha2 style='border-top:none; border-left: 1.0pt solid black;'><nobr>ZDFN-Frete Nacional</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDFI-Frete Intl.</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDDP-Despachante</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDAZ-Armazenagem</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDDV-Desp. Diversas</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDSG-Seguro</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDSX-Taxa DI</nobr></td>"&_
			"    <td class=linha2 style='text-align:center;border-left:none;border-top:1.0pt solid black;'><nobr>TOTAL</nobr></td>"&_
			"    <td class=linha2 style='text-align:center;border-left:none;border-top:1.0pt solid black;border-right:1.0pt solid black;'><nobr>R$/UNID.</nobr></td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Item</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>PEDIDO</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>C&oacute;d. Material</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Quantidade</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>N. de Lote</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>"& objrs.Fields.Item("SIGLA_MOEDA_MLE").Value &"</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Unit&aacute;rio</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Por</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>BRL</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>UNID.</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>%</b></nobr></td>"&_
			"    <td class=numCinza x:num='0'></td>"&_
			"    <td class=numCinza x:num='0'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlDespacho, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='0'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlINSS, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlSeguro, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='0'></td>"&_
			"    <td class=numCinza style='text-align:center;'><nobr>CUSTO</nobr></td>"&_
			"    <td class=numCinza style='text-align:center;'><nobr>CUSTO</nobr></td>"&_
			"  </tr>"
		objtxt.WriteLine(txCorpoExcel)
		cont = objrs.RecordCount + 6
		'recupera as variaveis de qtde e unidade
		aCdMercadoria = Split(Request.Form("CdMercadoria"), ", ", -1)
		aNrNovaQtde   = Split(Request.Form("NrNovaQtde"), ", ", -1)
		aTxNovaUnid   = Split(Request.Form("TxNovaUnid"), ", ", -1)
		
		objrs.MoveFirst
		Do while not objrs.Eof
			x = objrs.AbsolutePosition + 5
			z = (x mod 2) + 1
			vNrItem = objrs.fields.item("NR_ITEM").value
			If Not fnc_TestaVar(vNrItem) Then vNrItem = "0" 
			
			vCodMercadoria = objrs.fields.item("CD_MERCADORIA").value
			'somente para saint goban
			if objrs.Fields.Item("CD_GRUPO") = "028" then
				vCodMercadoria = Mid(objrs.fields.item("CD_MERCADORIA").value, 4, 12)
			end if
			
			vlQtde = ""
			txUnid = ""
			'verifica se existem novos valores de qtde e unidade de medida
			if fnc_TestaVar(Request.Form("NrNovaQtde")) then
				for y = 0 to UBound(aCdMercadoria)
					if Trim(aCdMercadoria(y)) = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.fields.item("CD_MERCADORIA").value) then
						vlQtde = aNrNovaQtde(y)
					end if
				next
			end if	
			if fnc_TestaVar(Request.Form("TxNovaUnid")) then
				for y = 0 to UBound(aCdMercadoria)
					if Trim(aCdMercadoria(y)) = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.fields.item("CD_MERCADORIA").value) then
						txUnid = aTxNovaUnid(y)
					end if
				next
			end if	

			'se não forem encontradas, exibe valores da tabela
			if Not fnc_TestaVar(vlQtde) then 
				vlQtde = objrs.Fields.Item("QT_MERC_UN_COMERC").Value
				If Not fnc_TestaVar(vlQtde) Then vlQtde = 0
			end if					
			if Not fnc_TestaVar(txUnid) then	
				if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    		sql = "SELECT DISTINCT RTRIM(LTRIM(CD_EXTERNO)) AS NM_UNID_MED FROM TDE_PARA (NOLOCK) WHERE CD_TABELA = '20' AND CD_DDBROKER = '"& objrs.fields.item("UNID_MED").value &"' "
    		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
        if objrsx.RecordCount = 1 then
    			txUnid = objrsx.fields.item("NM_UNID_MED").value
				else
          txUnid = ""
				end If	
			end if
			
			vlItem = objrs.Fields.Item("VL_MLE_ITEM").Value
			If Not fnc_TestaVar(vlItem) Then vlItem = 0
			
			txLinhaExcel = "  <tr>"&_
				"    <td class=numlinha"& z &">"& vNrItem &"</td>"&_
				"    <td style='background: #003366;color: #FFFFFF; '>"& objrs.fields.item("NR_REFERENCIA").value &"</td>"&_
				"    <td style='background: #003366;color: #FFFFFF; '>"& vCodMercadoria &"</td>"&_
				"    <td class=numPerson style='text-align:right;' x:num='"& fnc_ConvertToExcel(vlQtde, 1, 16) &"'></td>"&_
				"    <td class=numlinha"& z &" style='text-align:right;' x:num></td>"&_
				"    <td class=numlinha"& z &" style='text-align:right;' x:num='"& fnc_ConvertToExcel(vlItem, 1, 16) &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=F"& x &"/D"& x &"*H"& x &"'></td>"&_
				"    <td class=numlinha"& z &" style='text-align:right;' x:num='10000'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=IF(F"& x &"=0,0,+F"& x &"*$F$4)'></td>"&_
				"    <td class=numlinha"& z &">"& txUnid &"</td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=IF(I"& x &"=0,0,I"& x &"/$I$"& cont &")'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$L$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$M$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$N$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$O$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$P$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$Q$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$R$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=SUM(I"& x &":R"& x &")-K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=S"& x &"/D"& x &"'></td>"&_
				"  </tr>"
			objtxt.WriteLine(txLinhaExcel)
			objrs.MoveNext
			if objrs.Eof then Exit Do
		Loop
		cont = objrs.RecordCount + 5
		
		txCorpoExcel = "<tr>"&_
			"    <td style='background:#003366; text-align:left; color:#FF0000;'><nobr><b>Totais:</b></nobr></td>"&_
			"    <td style='background:#003366;'></td>"&_
			"    <td class=azulEscuro>&nbsp;</td>"&_
			"    <td class=numCinza3 x:num x:fmla='=SUM(D6:D"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(E6:E"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(F6:F"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(G6:G"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(H6:H"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(I6:I"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(J6:J"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(K6:K"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(L6:L"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(M6:M"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(N6:N"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(O6:O"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(P6:P"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(Q6:Q"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(R6:R"& cont &")'></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(S6:S"& cont &")'></td>"&_
			"    <td class=azulEscuro>&nbsp;</td>"&_
			"  </tr>"&_
			"</table></div></body></html>"
		objtxt.WriteLine(txCorpoExcel)
		objtxt.Close()
		
		Set objtxt = Nothing
		Set objfso = Nothing
	end if
end if
%>
<!--#include virtual="/includes/inc_ends.asp" -->
