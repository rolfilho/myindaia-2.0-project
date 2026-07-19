<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Criado: Flávio Henrique - 19/08/2008
'Objetivo : criar planilhas individuais para cada fornecedor. Nestas planilhas deverão aparecer apenas
'os pedidos  do fornecedor em questão.
 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%'Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 700

'Variáveis
Dim nr_invoice
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo,Data_Fatura,Data_Proforma
Dim vl_tot_nao_tributavel,vl_sub_tot_tributavel,vl_comissao,vl_tot_geral, dias_Corridos,Buscaprocesso
Dim vedtCodItem,vedtNmItem,vdata,vValor,id,vUrl,txCondicao,dtDocs,Condicao,check,varCheck,ValEmbalagem
Dim vl_item,vl_saldo,credito,debito,saldo,in_restitui,cont2,msg,msg1,EnviaEmbalagem,VEmbalagem,Flag
Dim MenorDataProforma, mensagem

msg=""
Dim NR_CLIENTE,Total_item,chkporcent,vlItemPercent
Dim contador,BRL,TotalBRL,Porcentagem
nr_processo = CStr(Request.QueryString("nr_processo"))
'"SELECT QUE PAGA APENAS OS CODIGOS DE EXPORTADORES "&_
SQL="SELECT distinct TEE.NR_CLIENTE,TEE.NM_EMPRESA FROM TPROCESSO PR (NOLOCK) "&_
	"INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
	"INNER JOIN TEMPRESA_EST TEE (NOLOCK) ON (TEE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
	"WHERE PR.NR_PROCESSO = '"&nr_processo&"' order by TEE.NR_CLIENTE"
	objrsy.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
if not objrsy.eof then
		'if objrsy.RecordCount > 0 Then
			'nr_cliente=""
		'End if%>
<table width="100%" height="2%" border="0" cellpadding="0" cellspacing="0">
<tr height="25">
<td height="18" colspan="3" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x">
<!--Barra header ------------------------------------------------------------------------>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="776" class="titpopup">&nbsp;<%= "Planilhas geradas por fornecedor - Processo:"%> <%=CStr(Request.QueryString("nr_processo"))%></td>
            <td width="26"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
        </tr>
     </table> 
<!--Barra header ------------------------------------------------------------------------>
<%	   
		'******************************************************************************************** Flavio - 31/03/2008	
		        Buscaprocesso=CStr(Request.QueryString("nr_processo"))
				With objcmd
					.CommandTimeOut = 60
					.CommandText    = "sp_Importacao_Custeio"
					.CommandType    = adCmdStoredProc
					.Parameters.Append = .CreateParameter("@nr_processo"   , adChar   , adParamInput,   14, Buscaprocesso )
					.Parameters.Append = .CreateParameter("@vl_tot_nao_tributavel", adCurrency, adParamOutPut, 14)
					.Parameters.Append = .CreateParameter("@vl_sub_tot_tributavel", adCurrency, adParamOutPut, 14)
					.Parameters.Append = .CreateParameter("@vl_comissao", adCurrency, adParamOutPut, 14)
					.Parameters.Append = .CreateParameter("@vl_tot_geral", adCurrency, adParamOutPut, 14)
					.Execute , , adExecuteNoRecords
					vl_tot_nao_tributavel = .Parameters("@vl_tot_nao_tributavel")
					vl_sub_tot_tributavel = .Parameters("@vl_sub_tot_tributavel")
					vl_comissao = .Parameters("@vl_comissao")
					vl_tot_geral = .Parameters("@vl_tot_geral")
				End With
		'*******************************************************************************************************************		
contador=0
chkporcent=0
' INÍCIO DO LOOPING PARA NR DE CLIENTE
Do while not objrsy.eof
		nr_cliente=objrsy("nr_cliente")
		caminho = Server.MapPath("\excel\arquivo")
		arquivo = "\inst_custo_"&ltrim(rtrim(nr_cliente))&"_"&Session("cd_usuario")&"_"&_
		Year(Date) & Month(Date) & Day(Date) &"_"&_
		Hour(Time) & Minute(Time) & Second(Time) &".xls"
		%>
		<script>//alert(<%'=nr_cliente%>);</script>
		<%
		
		
		'aCondicao = Array("INVOICE - especial","Registro da DI","Conhecimento Embarque","INVOICE","PROFORMA",txCondicao)
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
					"&nr_item_clnte="&  Request.QueryString("nr_item_clnte") &_
					"&NrDias="&  Request.form("NrDias") &_ 
					"&txCondicao="&  Request.form("txCondicao") &_ 
					"&dtDocs="&  Request.form("dtDocs") &_  
					"&Condicao="&  Request.form("Condicao") &_  
					"&Check="& request("check") &_ 
					"&ValEmbalagem="& request.form("ValEmbalagem")
		%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
		<script language="javascript" src="/includes/script_calendario.js"></script>
		<script language="javascript" src="/includes/script_cal_conf.js"></script>
<!--Estilos-->
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
			white-space:nowrap;
		}
		.azulClaro {
			background: #7799CC;
			color: #FFFFFF;
			text-align: center;
			height: 15px;
			border-width: 0px;	
			border-color: #336699;
			white-space:nowrap;
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
		.style11 {font-size: x-small}
</style>
<!--Functions-->
		<script language="JavaScript" type="text/JavaScript">
		<!--
		function MM_reloadPage(init) {  //reloads the window if Nav4 resized
		  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
			document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
		  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
		}
		
		MM_reloadPage(true);
		
		function Message(txt) {
		alert('o');
		return;
		}
		
		function fncValidaForm(form) {
			var b = true;
			//verifica dias e condição
			if (form.nrDias.options[form.nrDias.selectedIndex].value=='' || form.txCondicao.options[form.txCondicao.selectedIndex].value=='' || form.Valor.options[form.Valor.selectedIndex].value=='')  {
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
			
				if (form.Valor.options[form.Valor.selectedIndex].value=='') {
					alert('Valor!');
					form.Valor.focus();
				}
			return b;
			
			
		}
		
		function abreProvaReal(nr_processo,vl_tot_geral,EnviaEmbalagem) {
			features = "top=150,left=50,width=200,height=160,scrollbars=no,menubar=no,status=yes";
			window.open('/detalhe/prova_inst_despacho_custo.asp?EnviaEmbalagem='+EnviaEmbalagem+'&vl_tot_geral='+vl_tot_geral+'&nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>', 'win8',features);
		}
		
		function fncCondicaoChange(objSelect) {
			if(objSelect.options[objSelect.selectedIndex].value=='') {
				document.frmInstrucao.nrDias.value = '';
			} else {
				if(objSelect.options[objSelect.selectedIndex].value=='1') {
					document.frmInstrucao.nrDias.value = '60';
					document.frmInstrucao.dtDocs.focus();
				}
				//check='1';
				document.frmInstrucao.check.value='1';
				document.frmInstrucao.submit();
			}
		}
		
		//-->
		
		function abreFaturamento(nr_processo) {
			features = "top=100,left=20,width=500,height=350,scrollbars=no,menubar=no";
			window.open('/popup/detalhe_faturamento.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win6",features);
		}
		
		</script>
</head>
<body>
		<%
		%><br>
		<table width="66%" border="0" cellspacing="5" cellpadding="2">
              <tr>
                <th width="2%" scope="col">&nbsp;</th>
                <th width="4%" scope="col"><span class="style11"><a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"><img src="../imagens/icones/16x16/btn_excel.gif" width="16" height="16" border="0"></a></span></th>
                <th width="21%" scope="col"><div align="left"><span class="style11">Fornecedor:<a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"><%=nr_cliente%> </a></span></div></th>
                <th width="73%" scope="col"><div align="left"><a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"><%=objrsy("NM_EMPRESA")%></a></div></th>
          </tr>
            </table>
<span class="style11"></span>
        </td>
		  </tr>
<tr>
</tr>
			<tr>
			<td height="18">         
			  <%'if Request.Form = "" then
			sql = "SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
						"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
						"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
						"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
						"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
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
						"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA, "&_
						"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
						"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
						"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
						"             AND CD_ITEM = '008' "&_
						"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
						"			  AND CD_ORIGEM_LANC='5' "&_
						"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
						"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
						"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
						"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
						"             AND CD_ITEM = '008' "&_
						"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
						"			  AND CD_ORIGEM_LANC='5' "&_
   					    "             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA2 "&_
						"FROM TPROCESSO PR (NOLOCK) "&_
						"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
						"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
						"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
						"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
						"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
						"  INNER JOIN TSERVICO SV (NOLOCK) ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
						"WHERE PR.NR_PROCESSO = '"& nr_processo &"' and NR_CLIENTE='"& nr_cliente &"' "&_
						"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
				'Response.Write(sql)
			If objrs.State = adStateOpen then objrs.close()
			With objcmd
				.CommandTimeOut = 120
				.CommandText = sql
				.CommandType = adCmdText
			End With
			objrs.Open objcmd, , adOpenStatic, adLockReadOnly
			'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_MLE_ITEM").Value*vlTaxaMLE&"")
			
			If objrs.RecordCount > 0 Then
				'REFERENCIAS
				If objrsx.State = adStateOpen then objrsx.close()
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
				sql = "SELECT TOP 1 NR_DCTO_INSTRUCAO,DT_FATURA  FROM TDOCUMENTO_INSTRUCAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_TIPO_DCTO_INSTR = '01'"
				objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
				
				if objrsx.RecordCount > 0 Then
					nr_invoice = ""
					Data_Fatura=Trim(objrsx.Fields.Item("DT_FATURA").Value)
		
					Do while not objrsx.Eof
						nr_invoice = nr_invoice & Trim(objrsx.Fields.Item("NR_DCTO_INSTRUCAO").Value)
						objrsx.MoveNext
						if objrsx.Eof then Exit Do else nr_invoice = nr_invoice &"<br>"
					Loop
				End If
		
				objrsx.Close
				'NOTA FISCAL
				sql = "SELECT TOP 1 NR_NOTA, DT_NOTA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND IN_CANCELADO = '0'"
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
				
				If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then
							'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA2").Value, 2)
							vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+(objrs.Fields.Item("VL_SDA2").Value*0.2)+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))-objrs("VL_RECUPERADO")
				else
				'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)
				vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))-objrs("VL_RECUPERADO")
		
				end if
		
				'vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))-objrs("VL_RECUPERADO")
		
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
				vInIPIRec = "sim"
%>
				</div>
				<%End If
'-------------Alterado em 24/04/2008 ------CALCULA O VALOR DO INSS --------------------------------------------------------------
'Renata insere valor SDA via web 
		   ' Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")

		If objrs.Fields.Item("VL_INSS").Value= 0 then 
			sql="select VL_ITEM from TFATURAMENTO_CC WHERE NR_PROCESSO ='"& nr_processo &"' and cd_item='008' and cd_origem_lanc='5'"
			Objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
			If objrsx.eof then
			   vlINSS = objrs.Fields.Item("VL_INSS").Value
			   'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")
			else
				vlINSS=Objrsx("VL_ITEM")*0.2
			    'Response.Redirect("../IMPORT/teste.asp?var1="&objrsx.Fields.Item("VL_ITEM").Value&"")
			end if
		else 
			vlINSS = objrs.Fields.Item("VL_INSS").Value
		end if	
		If Not fnc_TestaVar(vlINSS) Then vlINSS = 0
'------------------------------------------------------------------------------------------------------------------%>
			  </p>
			  </td>
		  </tr>
			<tr height="15" align="center">
		  </tr>
</table>
</body>
</html>
		<script language="javascript">
		<!--
		window.focus();
		-->
		</script>
		<%'if contador =0 then
        '****************************Total ítem **********************%><script>//alert('teste');</script><%
            if objrsv.State = adStateOpen then objrsv.Close
               sql = "SELECT SUM (VL_MLE_ITEM) AS TOTAL FROM TDETALHE_MERCADORIA where NR_PROCESSO='"& nr_processo &"'"
               objrsv.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText  
               Total_item=objrsv("TOTAL")
         '***********************************************************************************************************************
               vlItem = objrs.Fields.Item("VL_MLE_ITEM").Value
               vlItemPercent = objrs.Fields.Item("VL_MLE_ITEM").Value 'Usado para calcular o % individual.
               If Not fnc_TestaVar(vlItem) Then vlItem = 0
                  vlItem=vlItem-(vlItem*ValEmbalagem/objrsv.fields.item("TOTAL").value)
				  Total_item=Total_item+vlItem
         '***********************************************************************************************************************
               '-------------------------CALCULO DA PORCENTAGEM INDIVIDUAL N5
				    If objrsx.State = adStateOpen then objrsx.close()
'					sql="SELECT convert(decimal(16,14),(  DM.VL_MLE_ITEM / DI.VL_TOT_MLE_MNEG )) AS PERCENTUAL " &_
'						"FROM TDECLARACAO_IMPORTACAO DI , TDETALHE_MERCADORIA DM "&_
'						"WHERE DM.NR_PROCESSO = DI.NR_PROCESSO "&_
'						"AND DI.NR_PROCESSO ='"&nr_processo&"' "&_
'						"AND NR_PROC_PO = '"&objrs("NR_REFERENCIA")&"' "&_
'						"AND NR_ITEM_PO = '"&objrs("NR_ITEM")&"' "		
					sql="SELECT SUM(convert(decimal(16,14),(  DM.VL_MLE_ITEM / DI.VL_TOT_MLE_MNEG ))) AS PERCENTUAL  "&_
						" FROM TDECLARACAO_IMPORTACAO DI , TDETALHE_MERCADORIA DM, TEMPRESA_EST  EE (NOLOCK) "&_
						" WHERE DM.NR_PROCESSO = DI.NR_PROCESSO "&_
						" AND DI.NR_PROCESSO ='"& nr_processo &"' "&_
						" AND EE.CD_EMPRESA = DM.CD_EXPORTADOR "&_
						" AND EE.NR_CLIENTE = '"& nr_cliente &"'"
						objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText  
						'chkporcent=round(objrsx.Fields.Item("PERCENTUAL").Value,2)
					    'chkporcent=vlItemPercent/Total_item
         '***********************************************************************************************************************
        ' end if
		
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
					"td {padding:auto;}"&_
					"col{width:auto}"&_
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
					"  white-space:nowrap;"&_
					"  mso-number-format:General;}"&_
		
					".data {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:'Short Date';"&_
					"  font-weight:bold;"&_
					"  text-align:center;"&_
					"  vertical-align:bottom;"&_
					"  border:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  col{width:auto}"&_
					"  background:#D4E6DC;}"&_
					
					".numCinza {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.00"";"&_
					"  font-weight:bold;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:.5pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  color:#FFFFFF;"&_
					"  overflow:auto;"&_
					"  padding:auto;"&_
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
					"  white-space:nowrap;"&_
					"  padding:auto;"&_
					"  overflow:auto;"&_
					"  background:#003366;}"&_	
					
					".NovaLinha1 {"&_
					"  mso-style-parent:style0;"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  overflow:auto;"&_
					"  mso-height-source:auto;"&_
					"  mso-width-source:auto;"&_
					"  padding:auto;"&_
					"  background:#E5F7ED;}"&_
					
					".NovaLinha2 {"&_
					"  mso-style-parent:basico;"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  overflow:auto;"&_
					"  mso-height-source:auto;"&_
					"  mso-width-source:auto;"&_
					"  background:#D4E6DC;}"&_	
					
					".numLinha1 {"&_
					"  mso-style-parent:style0;"&_
					"  mso-number-format:""\#\,\#\#0\.00"";"&_
					"  text-align: right;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:auto;"&_
					"  background:#E5F7ED;}"&_
					
					".numLinha2 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.00"";"&_
					"  text-align: right;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:auto;"&_
					"  background:#D4E6DC;}"&_	
					
					".NOTAFISCAL {"&_
					"  mso-style-parent:basico;"&_
					"  	mso-number-format:""\#\\ ?\/?"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#FFFFFF;}"&_
					
					".CONTABIL1 {"&_
					"  mso-style-parent:basico;"&_
					"  	mso-number-format:""_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:auto;"&_
					"  background:#E5F7ED;}"&_	
					
					".CONTABIL2 {"&_
					"  mso-style-parent:basico;"&_
					"  	mso-number-format:""_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:auto;"&_
					"  background:#D4E6DC;}"&_	
					
					".PERSONALIZADO1 {"&_
					"  mso-style-parent:basico;"&_
					"  	mso-number-format:""_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:15px;"&_
					"  background:#E5F7ED;}"&_	
					
					".PERSONALIZADO2 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  padding:15px;"&_
					"  background:#D4E6DC;}"&_	
		
					".numLinha31 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.000"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#E5F7ED;}"&_
		
					".numLinha32 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.000"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#D4E6DC;}"&_	
		
					".numPerson1 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.000"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#E5F7ED;}"&_	
		
					".numPerson2 {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.000"";"&_
					"  text-align: center;"&_
					"  border:.5pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#D4E6DC;}"&_	
		
					".numCinco {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\,\#\#0\.00000"";"&_
					"  font-weight:bold;"&_
					"  border-top:none1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#D4E6DC;}"&_	
		
			  ".azulEscuro {"&_
					"  mso-style-parent:basico;"&_
					"  text-align:center;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  color:#FFFFFF;"&_
					"  background:#003366;}"&_	
						
			  ".BRANCO {"&_
					"  mso-style-parent:basico;"&_
					"  font-size:12.0pt;"&_
					"  font-weight:700;"&_
					"  color:#000000;"&_
					"  mso-generic-font-family:auto;"&_
					"  mso-font-charset:0;"&_
					"  text-align:center;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  color:#FFFFFF;"&_
					"  background:#FFFFFF;}"&_	
						
			  ".xl140 {"&_
					" mso-style-parent:style0;"&_	
					" font-size:12.0pt;"&_	
					" font-weight:700;"&_	
					" font-family:Britannic Bold;"&_	
					" mso-generic-font-family:auto;"&_	
					" mso-font-charset:0;"&_	
					" border-top:.5pt solid windowtext;"&_	
					" border-right:none;"&_	
					" border-bottom:none;"&_	
					" border-left:none;"&_	
					" background:silver;"&_	
					" white-space:nowrap;"&_
					" mso-pattern:auto none;}"&_	
					
			".xl143 {"&_
				"  mso-style-parent:style0;"&_
				"  font-size:12.0pt;"&_
				"  font-weight:700;"&_
				"  font-family:Arial, sans-serif;"&_
				"  white-space:nowrap;"&_
				"  mso-font-charset:0;}"&_
				
			  ".xl147 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" text-align:left;"&_
					" border-top:1.0pt solid windowtext;"&_
					" border-right:.5pt hairline windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					"  white-space:nowrap;"&_
					" border-left:1.0pt solid windowtext;}"&_
		
				".xl148 {"&_
					" mso-style-parent:style0;"&_	
					" font-size:12.0pt;"&_	
					" font-family:Arial, sans-serif;"&_	
					" mso-font-charset:0;"&_	
					" border-top:1.0pt solid windowtext;"&_	
					" border-right:.5pt hairline windowtext;"&_	
					" border-bottom:1.0pt solid windowtext;"&_	
					"  white-space:nowrap;"&_
					" border-left:.5pt hairline windowtext;}"&_	
		
				".xl149 {"&_
					" mso-style-parent:style21;"&_	
					" font-size:12.0pt;"&_	
					" font-weight:700;"&_	
					" font-family:Arial, sans-serif;"&_	
					" mso-font-charset:0;"&_	
					" mso-number-format:Short Date;"&_	
					" text-align:center;"&_	
					"  white-space:nowrap;"&_
					" border:1.0pt solid windowtext;}"&_	
		
				".xl153 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" text-align:left;"&_
					" border-top:1.0pt solid windowtext;"&_
					" border-right:.5pt dotted windowtext;"&_
					" border-bottom:.5pt dotted windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:1.0pt solid windowtext;}"&_
					
				".xl154 {"&_
					" mso-style-parent:basico;"&_
					" font-size:10.0pt;"&_
					" font-family:Arial, sans-serif;"&_
					" mso-font-charset:0;"&_
					" mso-number-format:""\#\\ ?\/?"";"&_
					" text-align:center;"&_
					" border-top:1.0pt solid windowtext;"&_
					" border-right:.5pt dotted windowtext;"&_
					" border-bottom:.5pt dotted windowtext;"&_
					" border-left:.5pt dotted windowtext;}"&_
					" white-space:nowrap;"&_
					" background:#E5F7ED;}"&_	
					
			  ".NF {"&_
					"  mso-style-parent:basico;"&_
					"  mso-number-format:""\#\\ ?\/?"";"&_
					"  text-align:center;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  background:#E5F7ED;}"&_		
						
				".xl155 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" font-family:Arial, sans-serif;"&_
					" mso-font-charset:0;"&_
					" border-top:1.0pt solid windowtext;"&_
					" border-right:none;"&_
					" border-bottom:none;"&_
					" white-space:nowrap;"&_
					" border-left:1.0pt solid windowtext;}"&_
		
				".xl156 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" text-align:center;"&_
					" vertical-align:middle;"&_
					" border-top:1.0pt solid windowtext;"&_
					" border-right:1.0pt solid windowtext;"&_
					" border-bottom:none;"&_
					" border-left:none;"&_
					" background:#FFFF99;"&_
					" white-space:nowrap;"&_
					" mso-pattern:auto none;}"&_
		
				".xl160 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" border-top:.5pt dotted windowtext;"&_
					" border-right:.5pt dotted windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:1.0pt solid windowtext;}"&_
		
				".xl161 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-family:Arial, sans-serif;"&_
					" mso-font-charset:0;"&_
					" text-align:center;"&_
					" border-top:.5pt dotted windowtext;"&_
					" border-right:.5pt dotted windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:.5pt dotted windowtext;}"&_
		
				".xl162 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" border-top:none;"&_
					" border-right:1.0pt solid windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:.5pt dotted windowtext;}"&_
		
				".xl163 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" text-align:left;"&_
					" border-top:none;"&_
					" border-right:none;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:1.0pt solid windowtext;}"&_
		
				".xl164 {"&_
					" mso-style-parent:style0;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" text-align:center;"&_
					" border-top:none;"&_
					" border-right:1.0pt solid windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:none;}"&_
		
				".xl195{"&_
					" mso-style-parent:style0;"&_
					" color:red;"&_
					" font-size:12.0pt;"&_
					" font-weight:700;"&_
					" font-family:Arial, sans-serif;"&_
					" mso-font-charset:0;"&_
					" border-top:none;"&_
					" border-right:.5pt solid windowtext;"&_
					" border-bottom:1.0pt solid windowtext;"&_
					" white-space:nowrap;"&_
					" border-left:.5pt solid windowtext;}"&_
		
			  ".linha1 {"&_
					"  mso-style-parent:basico;"&_
					"  text-align:center;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  overflow:auto;"&_
					"  mso-height-source:auto;"&_
					"  mso-width-source:auto;"&_
					"  mso-pattern:auto none;"&_
					"  background:#E5F7ED;}"&_		
		
			  ".linha2 {"&_
					"  mso-style-parent:basico;"&_
					"  text-align:center;"&_
					"  border-top:1.0pt solid black;"&_
					"  border-right:1.0pt solid black;"&_
					"  border-bottom:1.0pt solid black;"&_
					"  border-left:1.0pt solid black;"&_
					"  white-space:nowrap;"&_
					"  overflow:auto;"&_
					"  mso-height-source:auto;"&_
					"  mso-width-source:auto;"&_
					"  mso-pattern:auto none;"&_
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
				'Descrição das células:
				'L5= ZDFN-Frete Nacional Variável=
				'M5= ZDFI-Frete Intl.    Variável= 
				'N5= ZDDP-Despachante    Variável= vlDespacho (atual: CHECK)
				'O5= ZDAZ-Armazenagem    Variável=
				'P5= ZDDV-Desp. Diversas Variável= fnc_ConvertToExcel(vlINSS, 1, 16)
				'Q5= ZDSG-Seguro         Variável=  fnc_ConvertToExcel(vlSeguro, 1, 16)
				'R5= ZDSX-Taxa DI        Variável= 
				'J5= UNID.               Variável=txUnid
				'vlDespacho = objrs.Fields.Item("VL_DESPESA_INDAIA").Value - objrs.Fields.Item("VL_RECUPERADO").Value
				'Célula N5
				vlDespacho = vl_tot_geral - objrs.Fields.Item("VL_RECUPERADO").Value

				'CHECK=VALOR TOTAL DA SOMA DOS ITENS 
				Total_item=objrsv("TOTAL") '//SUM (VL_MLE_ITEM) AS TOTAL FROM TDETALHE_MERCADORIA 

'********************************rotina para acumular a porcentagem que será utilizada no calculo da linha azul
				   chkporcent = ROUND(objrsx.Fields.Item("PERCENTUAL").Value,16)
'				If objrs.RecordCount = 1 Then
'				   CHECK=(vlDespacho)
'				Else
				   CHECK=(vlDespacho*ROUND(objrsx.Fields.Item("PERCENTUAL").Value,16))
				'End if
				objrs.MoveFirst
				
				
				

				If Not fnc_TestaVar(vlDespacho) Then vlDespacho = 0
				vlSeguro = objrs.Fields.Item("VL_TOTAL_SEG_MN").Value
				If Not fnc_TestaVar(vlSeguro) Then vlSeguro = 0
				
				txCorpoExcel = "<body>"&_
					"<div id='custo_import' align=center x:publishsource='Excel'>"&_
					"  <table x:str border=0 cellpadding=0 cellspacing=0 style='border-collapse:collapse;table-layout:fixed;'>"&_
					"    <col width=34>"&_
					"    <col width=116>"&_
					"    <col width=113>"&_
					"    <col width=149>"&_
					"    <col width=97>"&_
					"    <col width=118>"&_
					"    <col width=140>"&_
					"    <col width=99>"&_
					"    <col width=94>"&_
					"    <col width=62>"&_
					"    <col width=57>"&_
					"    <col width=93>"&_
					"    <col width=126>"&_
					"    <col width=97>"&_
					"    <col width=89>"&_
					"    <col width=93>"&_
					"    <col width=99>"&_
					"    <col width=88>"&_
					"    <col width=94>"&_
					"    <col width=80>"&_
					"    <col width=115>"&_
					"  <tr>"&_
					"    <td>&nbsp;</td>"&_
					"    <td class='azulEscuro'><nobr><b>Embarque:</b></nobr></td>"&_
					"    <td class='linha1'>"& fnc_Mascara(objrs.fields.item("NR_DI").value, 2) &"</td>"&_
					"    <td class='linha1'>&nbsp;</td>"&_
					"  </tr>"&_
					"  <tr>"&_
					"    <td>&nbsp;</td>"&_
					"    <td class=azulEscuro><nobr><b>Invoice e data:</b></nobr></td>"&_
					"    <td class=linha2 align=right style='border-right: none; border-bottom: 1.0pt solid black;'>"& nr_invoice &"</td>"&_
					"    <td class=data>"& fnc_Mascara(Data_Fatura, 5) &"</td>"&_
					"    <td></td><td></td><td></td><td></td><td></td><td colspan='2'></td>"&_
					"    <td class=data style='color:#FF0000;' x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"    <td class=data x:num='"& fnc_ConvertToExcel(fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5), 3, 0) &"'></td>"&_
					"    <td class=data style='color:#FF0000;' x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
					"  </tr>"&_
					"  <tr>"&_
					"    <td>&nbsp;</td>"&_
					"    <td class=azulEscuro><nobr><b>NF e data:</b></nobr></td>"&_
					"    <td class=NF style='border-top:none'><nobr>"& txNotaFiscal &"</nobr></td>"&_
					"    <td class=azulEscuro><nobr><b>C&oacute;d. Fornecedor:</nobr></b></td>"&_
					"    <td class=azulEscuro><nobr><b>Texto Geral:</b></nobr></td>"&_
					"    <td class=linha1 style='vertical-align:top;'><nobr>"& nr_referencia &" NF "& nr_nf &" "& objrs.Fields.Item("NM_AREA").Value &"</nobr></td>"&_
					"    <td></td><td></td><td></td><td></td><td></td>"&_
					"    <td class=linha1>1039324</td>"&_
					"    <td class=linha1>11366</td>"&_
					"    <td class=linha1>1040042</td>"&_
					"    <td class=linha1>1038750</td>"&_
					"    <td class=linha1>1041700</td>"&_
					"    <td class=linha1>1039089</td>"&_
					"    <td class=linha1>1851</td>"&_
					"  </tr>"&_
					"  <tr>"&_
					"    <td>&nbsp;</td>"&_
					"    <td class=azulEscuro><nobr><b>Conhec. Transporte:</b></nobr></td>"&_
					"    <td class=NovaLinha2 style='border-top:none'></td>"&_
					"    <td class=linha2 align=right style='border-bottom: 1.0pt solid black; border-top: none;'>"& objrs.Fields.Item("NR_CLIENTE").Value &"</td>"&_
					"    <td class=azulEscuro style='border-top: none; border-right: none;'><nobr><b>Taxa:</b></nobr></td>"&_
					"    <td class=linha2 x:num='"& fnc_ConvertToExcel(vlTaxaMLE, 1, 16) &"'></td>"&_
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
					"    <td class=azulEscuro style='text-align:center;overflow:auto;'><nobr><b>"& objrs.Fields.Item("SIGLA_MOEDA_MLE").Value &"</b></nobr></td>"&_
					"    <td class=azulEscuro style='text-align:center;'><nobr><b>Unit&aacute;rio</b></nobr></td>"&_
					"    <td class=azulEscuro style='text-align:center;'><nobr><b>Por</b></nobr></td>"&_
					"    <td class=azulEscuro style='text-align: center;'><nobr><b>BRL</b></nobr></td>"&_
					"    <td class=azulEscuro style='text-align: center;'><nobr><b>UNID.</b></nobr></td>"&_
					"    <td class=azulEscuro style='text-align: center;'><nobr><b>%</b></nobr></td>"&_
					"    <td class=numCinza x:num='0'></td>"&_
					"    <td class=numCinza x:num='0'></td>"&_
					"    <td class=numCinza x:num='"& fnc_ConvertToExcel(CHECK, 1, 16) &"'></td>"&_
					"    <td class=numCinza x:num='0'></td>"&_
					"    <td class=numCinza x:num='"& fnc_ConvertToExcel((vlINSS*chkporcent), 1, 16) &"'></td>"&_
					"    <td class=numCinza x:num='"& fnc_ConvertToExcel((vlSeguro*chkporcent), 1, 16) &"'></td>"&_
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
' INÍCIO DO LOOPING DA PLANILHA
				Do while not objrs.Eof
				
'				Porcentagem=brl/TotalBRL

					x = objrs.AbsolutePosition + 5
					z = (x mod 2) + 1
					vNrItem = objrs.fields.item("NR_ITEM").value
					If Not fnc_TestaVar(vNrItem) Then vNrItem = "0" 
					vCodMercadoria = objrs.fields.item("CD_MERCADORIA").value
					vlQtde = ""
					txUnid = ""
					vlItem = objrs.Fields.Item("VL_MLE_ITEM").Value
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
					'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")

						txUnid = objrs.fields.item("NM_UNID_MED").value
						else
				  txUnid = ""
						end If	
					end if
				
					
		'****************************  Valor que será utilizado para calcular o desconto da embalagem   **********************
					if objrsv.State = adStateOpen then objrsv.Close
					   sql = "SELECT SUM (VL_MLE_ITEM) AS TOTAL FROM TDETALHE_MERCADORIA where NR_PROCESSO='"& nr_processo &"'"
					objrsv.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText  
					Total_item=Total_item+objrsv("TOTAL")
		'***********************************************************************************************************************
					vlItem = objrs.Fields.Item("VL_MLE_ITEM").Value
					vlItemPercent = objrs.Fields.Item("VL_MLE_ITEM").Value 'Usado para calcular o % individual.



'				    If objrsx.State = adStateOpen then objrsx.close()
'					sql="SELECT convert(decimal(16,16),(  DM.VL_MLE_ITEM / DI.VL_TOT_MLE_MNEG )) AS PERCENTUAL " &_
'						"FROM TDECLARACAO_IMPORTACAO DI , TDETALHE_MERCADORIA DM "&_
'						"WHERE DM.NR_PROCESSO = DI.NR_PROCESSO "&_
'						"AND DI.NR_PROCESSO ='"&nr_processo&"' "&_
'						"AND NR_PROC_PO = '"&objrs("NR_REFERENCIA")&"' "&_
'						"AND NR_ITEM_PO = '"&objrs("NR_ITEM")&"' "		
'						objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText  
'						chkporcent = round(objrsx.Fields.Item("PERCENTUAL").Value,10)
						
						'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")
						%><script>//alert(<%'=chkporcent%>);</script><%
					
					If Not fnc_TestaVar(vlItem) Then vlItem = 0
					   vlItem=vlItem-(vlItem*ValEmbalagem/objrsv.fields.item("TOTAL").value)
					   '-------------------------CALCULO DA PORCENTAGEM INDIVIDUAL N5
					   'chkporcent=chkporcent+round(chkporcent+(vlItemPercent/Total_item),16)%><script>//alert(<%'=chkporcent%>);</script><%
					  'cont2 = objrs.RecordCount + 5
					  txLinhaExcel = "  <tr>"&_
						"    <td class=Novalinha"& z &">"& vNrItem &"</td>"&_
						"    <td style='background: #003366;color: #FFFFFF; white-space:nowrap; overflow:auto;'>"& objrs.fields.item("NR_REFERENCIA").value &"</td>"&_
						"    <td style='background: #003366;color: #FFFFFF; white-space:nowrap;overflow:auto; '>"& vCodMercadoria &"</td>"&_
						"    <td class=numPerson"& z &" style='text-align:right; overflow:auto;padding:auto;' x:num='"& fnc_ConvertToExcel(vlQtde, 1, 16) &"'></td>"&_
						"    <td class=Novalinha"& z &"></td>"&_
						"    <td class=CONTABIL"& z &" x:num='"& fnc_ConvertToExcel(vlItem, 1, 16) &"'></td>"&_
						"    <td class=CONTABIL"& z &" x:num x:fmla='=F"& x &"/D"& x &"*H"& x &"'></td>"&_
						"    <td class=PERSONALIZADO"& z &" style='text-align:right;' x:num='10000'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=IF(F"& x &"=0,0,+F"& x &"*$F$4)'></td>"&_
						"    <td class=Novalinha"& z &">"& txUnid &"</td>"&_
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
					'Response.Redirect("../IMPORT/teste.asp?var1="&porcent&"")
					objtxt.WriteLine(txLinhaExcel)
					objrs.MoveNext
					if objrs.Eof then Exit Do
				Loop
				cont = objrs.RecordCount + 5
				'Response.Redirect("../IMPORT/teste.asp?var1="&ValEmbalagem&"")
		
				txCorpoExcel = "<tr>"&_
					"    <td style='background:#003366; text-align:left; color:#FF0000; white-space:nowrap;'><nobr><b>Totais:</b></nobr></td>"&_
					"    <td style='background:#003366; text-align:left; color:#FF0000;white-space:nowrap;'></td>"&_
					"    <td style='background:#003366; text-align:left; color:#FF0000;white-space:nowrap;'>&nbsp;</td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(D6:D"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(E6:E"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(F6:F"& cont &")' col width=250></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(G6:G"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(H6:H"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(I6:I"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(J6:J"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(K6:K"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(L6:L"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(M6:M"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(N6:N"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(O6:O"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(P6:P"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(Q6:Q"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(R6:R"& cont &")' col width=150></td>"&_
					"    <td class=numCinza x:num x:fmla='=SUM(S6:S"& cont &")' col width=150></td>"&_
					"    <td class=azulEscuro col width=150>&nbsp;</td>"&_
					"  </tr>"&_
					"</table></div></body></html>"
				objtxt.WriteLine(txCorpoExcel)
				objtxt.Close()
				
				Set objtxt = Nothing
				Set objfso = Nothing
			end if
		'end if
	if objrsy.eof then exit Do 
	objrsy.MoveNext
	contador=contador+1
	loop    
	end if

%>

<!--#include virtual="/includes/inc_ends.asp" -->
