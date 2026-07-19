<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'LINK PARA TESTE - Response.Redirect("../IMPORT/teste.asp?var1="&Request.QueryString("Condicao")&"")
'Manutenção: Flávio Henrique - 04/04/2008
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%'Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 9999

Dim sem_cobertura, nm_item_select, cd_item_select, in_rateia_pedido
Dim nr_invoice
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo,Data_Fatura,Data_Proforma
Dim vl_tot_nao_tributavel,vl_sub_tot_tributavel,vl_comissao,vl_tot_geral, dias_Corridos,Buscaprocesso, vl_recuperado
Dim vedtCodItem,vedtNmItem,vdata,vValor,id,vUrl,txCondicao,dtDocs,Condicao,check,varCheck,ValEmbalagem
Dim vl_item,vl_saldo,credito,debito,saldo,in_restitui,cont2,msg,msg1,EnviaEmbalagem,VEmbalagem,Flag
Dim MenorDataProforma, mensagem
Dim vl_acrescimo_mn_item, vl_frete_mn_item,vl_acrescimo_mn, vl_frete_mn, vl_seguro_mn, desc_seguro_mn, desc_frete_mn, vl_item_fixo, vl_item_total_fixo1, vl_item_total_fixo2, vl_item_total_fixo3, vl_item_total_fixo4,vl_mercadoria_total, cont_merc
Dim vl_item_total_fixo1_array
Dim total_item, in_rateio_grupo, verifica_rateio, vTxExcel_inst
 
'Monta o listBox - Definição do nome da planilha.
in_show = False
cd_tela = "DET010"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))

Sub subGeraExcel(caminho, arquivo)
  Dim objfso
  Dim objtxt 
  Set objfso = CreateObject("Scripting.FileSystemObject")
  Set objtxt = objfso.CreateTextFile(caminho&arquivo,True,False)
  vTxExcel_inst = "<html xmlns:o=""urn:schemas-microsoft-com:office:office"""&_
	"xmlns:x=""urn:schemas-microsoft-com:office:excel"""&_
	"xmlns=""http://www.w3.org/TR/REC-html40"">"&_
	"<head>"&_
	"<meta http-equiv=Content-Type content=""text/html; charset=windows-1252"">"&_
	"<meta name=ProgId content=Excel.Sheet>"&_
	"<title></title>"&_
	"<!--[if !mso]>"&_
	"<style>"&_
	"x\:* {behavior:url(#default#VML);}"&_
	"</style>"&_
	"<![endif]-->"&_
	"<style>"&_
	"<!--"&_
	"body {"&_
	"	font-family: Verdana, Arial, Helvetica, sans-serif;"&_
	"	color: #000000;"&_
	"	background-color: #FFFFFF;"&_
	"	margin: 0px;"&_
	"	padding: 0px;"&_
	"}"&_
	"table {"&_
	"	mso-displayed-decimal-separator:""\,"";"&_
	"	mso-displayed-thousand-separator:""\."";"&_
	"}"&_
	"tr {"&_
	"}"&_
	"td {"&_
	"	mso-style-parent:basico;"&_
	"	font-size: 10px;"&_			
	"}"&_
	"br {"&_
	"	mso-data-placement:same-cell;"&_
	"}"&_
	".basico	{"&_
	"	text-align:general;"&_
	"	vertical-align:middle;"&_
	"	mso-generic-font-family:auto;"&_
	"	mso-font-charset:0;"&_
	"	mso-number-format:General;"&_
	"}"&_
	".basico2	{"&_
	"	text-align:right;"&_
	"	vertical-align:middle;"&_
	"	mso-generic-font-family:auto;"&_
	"	mso-font-charset:0;"&_
	"	mso-number-format:General;"&_
	"}"&_
	".titulo {"&_
	"	mso-style-parent:basico;"&_
	"	vertical-align:top;"&_
	"	font-size: 13px;"&_
	"	font-weight: bold;"&_
	"}"&_
	".gridtop {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-size: 10px;"&_
	"	background: #003366;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".gridtop2 {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-weight: bold;"&_	
	"	font-size: 12px;"&_
	"	background: #003366;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".detcampo {"&_
	"color: #FFFFFF;"&_
	"font-weight: bold;"&_
	"background: #003366;"&_
	"vertical-align: middle;"&_
	"}"&_
	".gridtit {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	background: #003366;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".graytit {"&_
	"	mso-style-parent:basico;"&_
	"	color: #000000;"&_
	"	background: #CCCCCC;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	vertical-align: middle;"&_	
	"}"&_
	".gridsub {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	background: #003366;"&_
	"}"&_
	".tb1 {"&_
	"	mso-style-parent:basico;"&_
	"  border-style: solid;"&_
	"  border-width: 0px 0px 1px 0px;"&_
	"  border-color: #000000;"&_
	"}"&_
	".tb2 {"&_
	"	mso-style-parent:basico;"&_
	"  border-style: dotted;"&_
	"  border-width: 0px 0px 1px 0px;"&_
	"  border-color: #333333;"&_
	"  padding: 2px;"&_
	"}"&_
	".data {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""Short Date"";"&_
	"}"&_
	".time {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""Short Time"";"&_
	"}"&_
	".inteiro {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0"";"&_
	"}"&_
	".decimal {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.0"";"&_
	"}"&_
	".decimal2 {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"}"&_
	".decimal4 {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.0000"";"&_
	"}"&_
	".moeda {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\0022R$ \0022\#\,\#\#0\.00_\)\;\[Red\]\\\(\0022R$ \0022\#\,\#\#0\.00\\\)"";"&_
	"}"&_
	".texto {"&_
	"	mso-style-parent:basico;"&_
	"	text-align:left;"&_
	"	vertical-align:top;"&_
	"	mso-ignore:padding;"&_
	"}"&_
	".total {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-weight: bold;"&_
	"	font-style: italic;"&_
	"	background: #FFCC99;"&_
	"}"&_
	".subtotal {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-weight: bold;"&_
	"	background: #FFCC99;"&_
	"}"&_
	".subproc {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-style: italic;"&_
	"}"&_
	"-->"&_
	"</style></head><body>"

    vTxExcel_inst = vTxExcel_inst & "<table border=1 cellpadding=0 cellspacing=0 bordercolor='#FFFFFF' style='padding: 0px 1px 0px 1px;'>"&_
                    "<tr class='gridtop2'>"&_
					"<td colspan='4' align='center' height='26'>" & UCase(Right(nr_processo,10)) & "</td>"&_
					"</tr>"
	
	cd_view = "0627-0301-02"
	
    sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"
				
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
	cont = 1
	Do While Not objrs.eof 
	If cont = 1 Then
	
	If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" & bgcolor & "'>"
    End If
    Select Case objrs.Fields.Item("M10_CD_DADO").Value
	Case  "0018"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT RTRIM(LTRIM(CD_REFERENCIA)) + '/' + RTRIM(LTRIM(NR_ITEM_PO)) AS REFERENCIA FROM TREF_CLIENTE WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	Do While Not objrsx.eof
	str = str & Trim(objrsx.Fields.Item("REFERENCIA").Value) & ";"
	objrsx.MoveNext
	If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
	Loop
	
    vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0007"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT RTRIM(LTRIM(NM_AREA)) AS AREA FROM TPROCESSO PR INNER JOIN TAREA AR ON(AR.CD_AREA = PR.CD_AREA) WHERE PR.NR_PROCESSO = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("AREA").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>" 
	 
	Case  "0284"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR,DT_REALIZACAO,103) AS REALIZACAO FROM TFOLLOWUP WHERE CD_EVENTO = '164' AND NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("REALIZACAO").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0118"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_NOTA AS NOTA FROM TPROCESSO_NF WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	Do While Not objrsx.eof
	str = str & trim(objrsx.Fields.Item("NOTA").Value) & ";"
	objrsx.MoveNext
	If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
	Loop
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0410"
	str = 0
	vl_frete_mn = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOTAL_FRETE_MNEG AS FRETE, VL_TOTAL_FRETE_MN AS FRETE_MN FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	desc_frete_mn = objrs.Fields.Item("M10_NM_DADO").Value
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("FRETE").Value
	vl_frete_mn = objrsx.Fields.Item("FRETE_MN").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0061"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT MB.NM_MOEDA AS MOEDA FROM TDECLARACAO_IMPORTACAO DI INNER JOIN TMOEDA_BROKER MB ON (MB.CD_MOEDA = DI.CD_MOEDA_FRETE) WHERE DI.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("MOEDA").Value
	End If
	
	 vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
									
	Case  "0296"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT TE.NM_EMPRESA AS EMPRESA FROM TPROCESSO PR INNER JOIN TEMPRESA_EST TE ON (TE.CD_EMPRESA = PR.CD_EXPORTADOR) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("EMPRESA").Value
	End If
	
	 vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0130"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_DCTO_INSTRUCAO AS FATURA FROM TDOCUMENTO_INSTRUCAO WHERE CD_TIPO_DCTO_INSTR = '01' AND NR_PROCESSO = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("FATURA").Value
	End If
	 
    vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & tx_lang_TDE083(cd_lang) & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	Case  "0664"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT RTRIM(LTRIM(GP.DIAS_CONDICAO_PAGTO)) + ' DIAS - ' + RTRIM(LTRIM(CASE ISNULL(GP.CONDICAO_PAGTO,'')  WHEN 'I' THEN 'INVOICE' WHEN 'C' THEN 'CONHECIMENTO EMBARQUE' WHEN 'E' THEN 'INVOICE ESPECIAL' WHEN 'R' THEN 'REGISTRO DA DI' WHEN 'P' THEN 'PROFORMA' WHEN 'A' THEN 'ANTECIPADO' END)) AS CONDICAO"&_
		" FROM TPROCESSO GP(NOLOCK)"&_
		" INNER JOIN TESTAGIO_PROCESSO EP ON (EP.NR_PROCESSO_ADM = GP.NR_PROCESSO)"&_
		" WHERE EP.NR_PROCESSO_DES = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
		str = objrsx.Fields.Item("CONDICAO").Value
	End If	
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0666"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT CASE ISNULL(CONDICAO_PAGTO,'') WHEN 'I' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) " &_
	" WHEN 'C' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(FI.RLZ_DT_EV551 AS DATETIME) AS VARCHAR) "&_
	" WHEN 'E' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) "&_
    " WHEN 'R' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(FI.RLZ_DT_EV021 AS DATETIME) AS VARCHAR) " &_ 
    " WHEN 'P' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) "&_
	" WHEN 'A' THEN 'ANTECIPADO' WHEN ''  THEN CASE SUBSTRING(EP.NR_REFERENCIA,1,4) "&_
	" WHEN '8000' THEN CAST(60 + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) ELSE NULL END END AS DT_VENCIMENTO"&_
	" FROM TPROCESSO GP(NOLOCK)"&_
	" INNER JOIN TESTAGIO_PROCESSO EP ON (EP.NR_PROCESSO_ADM = GP.NR_PROCESSO)"&_
	" INNER JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = EP.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = EP.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = EP.NR_PARCIAL AND POI.CD_EMPRESA = EP.CD_EMPRESA)"&_
	" INNER JOIN TFLP_IMPORT FI (NOLOCK) ON (FI.NR_REFERENCIA = EP.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = EP.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = EP.NR_PARCIAL AND FI.CD_EMPRESA = EP.CD_EMPRESA)"&_
	" WHERE EP.NR_PROCESSO_DES = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	

	If objrsx.RecordCount > 0 Then	
		str = objrsx.Fields.Item("DT_VENCIMENTO").Value
	End If	
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
									
	Case  "0014"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_CONHECIMENTO AS CONHECIMENTO FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("CONHECIMENTO").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0512"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR, DT_CONHECIMENTO, 103) AS DT_CONHECIMENTO FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	

	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("DT_CONHECIMENTO").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0044"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT TE.NM_EMBARCACAO AS NAVIO FROM TPROCESSO PR INNER JOIN TEMBARCACAO TE ON (TE.CD_EMBARCACAO = PR.CD_EMBARCACAO) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("NAVIO").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0555"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT PB.NM_PAIS AS PAIS FROM TDECLARACAO_IMPORTACAO DI INNER JOIN TPAIS_BROKER PB ON (PB.CD_PAIS = DI.CD_PAIS_ORIG_MERC) WHERE DI.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("PAIS").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"  
	 
	Case  "0012"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT LE.NM_LOCAL_EMB AS LOCAL_EMBARQUE FROM TPROCESSO PR INNER JOIN TLOCAL_EMBARQUE LE ON (LE.CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("LOCAL_EMBARQUE").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0283"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_DI AS DI FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = fnc_Mascara(Trim(objrsx.Fields.Item("DI").Value),1)
	End If
	 
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>" 
	 
	Case  "0306"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR,DT_REALIZACAO,103) AS REALIZACAO FROM TFOLLOWUP WHERE CD_EVENTO = '021' AND NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("REALIZACAO").Value
	End If
	 
    vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & tx_lang_TDE084(cd_lang) & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	Case  "0413"
	str = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOT_SEGURO_MNEG AS SEGURO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("SEGURO").Value
	End If
	 
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"  
	 
	Case  "0581"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT ISNULL(TX_MLE, 0) AS TAXA FROM TADICAO_DE_IMPORTACAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' "
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("TAXA").Value
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & tx_lang_TDE085(cd_lang) & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"
	
	
	Case  "0418"
	str = 0
	vl_seguro_mn = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOTAL_SEG_MN AS SEGURO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	desc_seguro_mn = objrs.Fields.Item("M10_NM_DADO").Value
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("SEGURO").Value
	vl_seguro_mn = str
	End If
	
	vTxExcel_inst = vTxExcel_inst & "<td class='detcampo'>" & objrs.Fields.Item("M10_NM_DADO").Value & "</td>"&_
									"<td style='vertical-align:middle;'>&nbsp;" & str & "&nbsp;</td>"  
	 
	End Select
	cont = cont + 1
	If cont = 3 Then				
	
    vTxExcel_inst = vTxExcel_inst & "</tr>"
	
	cont = 1
	End if
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
	
vTxExcel_inst = vTxExcel_inst & "</tr>"
    If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIA_PEDIDO AS RATEIA_PEDIDO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateia_pedido = objrs.Fields.Item("RATEIA_PEDIDO").Value
	Else
		in_rateia_pedido = "0"
	End if
	objrs.Close
	
	If in_rateia_pedido = "1" Then
				vTxExcel_inst = vTxExcel_inst &	"<tr class='gridtop2'><br>"&_
								"<td colspan='4' align='center' height='26'>" & UCase(tx_lang_TDE086(cd_lang)) & "</td>"&_
								"</tr>"

                	If objrs.state=adstateOpen then objrs.close()
					vl_mercadoria_total = 0
                    sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN) WHEN '11' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN - VL_TOTAL_SEG_MN) WHEN '01' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_SEG_MN) WHEN '00' THEN (VL_TOTAL_MLE_MN) END AS TOTAL FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
                    
					If objrs.RecordCount > 0 Then	
                    vl_mercadoria_total = objrs.Fields.Item("TOTAL").Value
                    End If
     				vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE087(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >"& FormatNumber(vl_mercadoria_total) & "</td>"&_
					"</tr>"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE088(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_frete_mn) & "</td>"&_
					"</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'>" & UCase(desc_seguro_mn) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_seguro_mn) & "</td>"&_
					"</tr>"
					
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_ACRESCIMO_ITEM_MN) AS ACRESCIMO FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vl_item_fixo = 0
					vl_acrescimo_mn = 0
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn = vl_item_fixo
					End if
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE089(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_item_fixo) & "</td>"&_
					"</tr>"
										
					vl_item_total_fixo1 = 0
					vl_item_total_fixo1 = vl_frete_mn + vl_seguro_mn + vl_item_fixo + vl_mercadoria_total
					
                    vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE090(cd_lang) & "</B></td>"&_
						"<td colspan='2' align='right' ><b>" & FormatNumber(vl_item_total_fixo1) & "</b></td>"&_
					"</tr>"
                    
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.State = adStateOpen Then objrsx.Close
					vl_item_fixo = 0
					sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC "&_
					" WHERE CD_ITEM ='" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "' AND NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
					End if
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>"& Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_item_fixo) & "</td>"&_
					"</tr>"
										
					vl_item_total_fixo2 = 0
					vl_item_total_fixo2 = vl_item_total_fixo1 + vl_item_fixo
					bgcolor = "#E5F7ED"
					
                    vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" & bgcolor & "'>"&_
						"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE091(cd_lang) & "</B></td>"&_
						"<td colspan='2' align='right'><b>" & FormatNumber(vl_item_total_fixo2) & "</b></td>"&_
					"</tr>"
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
							
					vl_item_total_fixo3 = 0				
					Do While Not objrs.Eof
						If objrsx.State = adStateOpen Then objrsx.Close
						vl_item_fixo = 0
						sql = "SELECT ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM FROM TFATURAMENTO_CC "&_
						" WHERE CD_ITEM ='" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "' AND NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount > 0 Then
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
						End if
	
						If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
						
						vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_
							"<td colspan='2' class='detcampo'>" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
							"<td align='right' colspan='2'>" & FormatNumber(vl_item_fixo) & "</td>"&_
						"</tr>"
						
						vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_fixo
						objrs.MoveNext
						If objrs.Eof Then Exit Do
					Loop
					vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_total_fixo2
					
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	
    		vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor &"'>"&_
			"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE092(cd_lang) & "</B></td>"&_
			"<td colspan='2' align='right'><B>" & FormatNumber(vl_item_total_fixo3) & "</B></td>"&_
			"</tr>"	
					
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT DISTINCT F.CD_ITEM AS CD_ITEM, F.DT_LANCAMENTO, ISNULL(F.VL_ITEM,0) AS VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	" AND NR_SOLIC_FAT IS NOT NULL "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','091','025','026','600','599','027','032','991','578','994') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	" AND CC.NR_SOLIC_FAT IS NOT NULL "&_
	"ORDER BY F.CD_ITEM ASC "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)
	vl_item_total_fixo4 = 0
	total_item = ""
If Not objrs.Eof Then
	Do While Not objrs.Eof
		total_item = total_item & Trim(objrs.Fields.Item("CD_ITEM").Value) 
	  	vl_item_fixo = Trim(objrs.Fields.Item("VL_ITEM").Value)
	  	vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_fixo
		
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_		
		"<td colspan='2' class='detcampo'>" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
		"<td colspan='2' align='right'>" & FormatNumber(vl_item_fixo) &  "</td>"&_
		"</tr>"
		
		objrs.MoveNext
		If objrs.Eof Then Exit Do Else total_item = total_item & "','"
	Loop
	total_item = "'" & total_item & "'"
End If
objrs.Close
'objrsx.Close
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_total_fixo3 - vl_frete_mn - vl_acrescimo_mn

				vTxExcel_inst = vTxExcel_inst &	"<tr height='18' bgcolor='"&  bgcolor & "'>"&_
				"<td colspan='2' class='detcampo'><b>" & tx_lang_TDE093(cd_lang) & "</b></td>"&_
                "        <td colspan='2' align='right'><b>"  & FormatNumber(vl_item_total_fixo4) & "</b></td>"&_
				"	</tr>"&_
				"</table></td></tr>"&_
                "</table>"&_
"</td>"&_
"</tr>"

	If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIO AS RATEIO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateio_grupo = objrs.Fields.Item("RATEIO").Value
	Else
		in_rateio_grupo = "0"
	End if
	objrs.Close
	
	If in_rateio_grupo = "1" Then
vTxExcel_inst = vTxExcel_inst &	"<tr>"&_
"<td height='100%' valign='top' style='border: solid 1px #336699;'><br><table width='100%' border=1 cellpadding=0 cellspacing=0 bordercolor='#FFFFFF' style='padding: 0px 1px 0px 1px;'>"&_
"<col width='10px'><col width='200px'>"&_
"<tr class='gridtop2'>"

                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT COUNT(DISTINCT NR_REFERENCIA) AS COUNT_PEDIDO FROM TESTAGIO_PROCESSO WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					cont_pedido = Trim(objrs.Fields.Item("COUNT_PEDIDO").Value)
					ReDim vl_item_total_fixo1_array(cont_pedido)
					ReDim vl_frete_mn_item(cont_pedido)
					ReDim vl_acrescimo_mn_item(cont_pedido)
					
					if cont_pedido = 0 Then 
						cont_pedido = 1
					End If
					
               vTxExcel_inst = vTxExcel_inst &	"<td colspan=" &  cont_pedido +1 & " align='center' height='26'>" & UCase(tx_lang_TDE099(cd_lang)) & "</td>"&_
                "</tr>"
				
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT DISTINCT NR_PROC_PO AS NR_REFERENCIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					If objrs.RecordCount > 0 Then 
						
						vTxExcel_inst = vTxExcel_inst & "<tr class='gridtop'>"&_
						"<td bgcolor='#FFFFFF'></td>"
						
						 Do While Not objrs.Eof  
						vTxExcel_inst = vTxExcel_inst & "<td class='detcampo' align='center'><nobr>&nbsp;" & UCase(Trim(objrs.Fields.Item("NR_REFERENCIA").Value)) & "&nbsp;</nobr></td>"
						
						objrs.MoveNext
						If objrs.Eof Then Exit Do
						Loop 
						
						vTxExcel_inst = vTxExcel_inst & "</tr><tr bgcolor='#E5F7ED'>" &_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE087(cd_lang) & "&nbsp;</nobr></td>"
                   
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_FRETE_ITEM_MN)) WHEN '11' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_FRETE_ITEM_MN) - SUM(VL_SEGURO_ITEM_MN)) WHEN '01' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_SEGURO_ITEM_MN)) WHEN '00' THEN (SUM(VL_MLE_ITEM_MN)) END AS VL_ITEM "&_
						  " FROM TDECLARACAO_IMPORTACAO DI "&_
						  " INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
"INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                          " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                          " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
						  " AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                          " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
						  " WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
						  " GROUP BY RC.CD_REFERENCIA, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS "
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
					If objrsx.RecordCount > 0 Then 
					cont_array = 0		
						Do While Not objrsx.Eof	
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next	
					End If
					  
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE088(cd_lang) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_FRETE_ITEM_MN) AS FRETE"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount > 0 Then 		
					cont_array = 0		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("FRETE").Value)
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))  + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) +vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next		
					End If
					    
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & UCase(desc_seguro_mn) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_SEGURO_ITEM_MN) AS SEGURO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then 	
					cont_array = 0			
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("SEGURO").Value)
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next	
					End If
					    
					vTxExcel_inst = vTxExcel_inst & "</tr>	"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE089(cd_lang) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_ACRESCIMO_ITEM_MN) AS ACRESCIMO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount > 0 Then 		
					cont_array = 0		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next		
					End If
					   
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td class='detcampo'><B>&nbsp;" & tx_lang_TDE090(cd_lang) & "&nbsp;</B></td>"
                        For i=0 to UBound(vl_item_total_fixo1_array)-1
						vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr>"
                    
					If objrs.State = adStateOpen Then objrs.Close
					verifica_rateio = 0
					sql = "SELECT NR_PROCESSO "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					" INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
					" AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_
                                                                      "WHERE NR_PROCESSO = '" & nr_processo & "'" 
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrs.RecordCount > 0 Then
						verifica_rateio = 1
					End If
					objrs.Close
					
					If verifica_rateio = 1 Then
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					cont_array = 0
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = " SELECT ISNULL(SUM(VL_ITEM_AREA),0) AS VL_ITEM "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					" INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
					" AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
					" WHERE FC.CD_ITEM = '" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "'"&_
					" AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
					" AND FC.NR_PROCESSO = '" & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "&nbsp;</nobr></td>"
					
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop		
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next
					End if
					bgcolor = "#E5F7ED"
					
                    vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='" & bgcolor & "'>"&_
						"<td class='detcampo'>&nbsp;" & tx_lang_TDE091(cd_lang) & "&nbsp;</td>"
						 For i=0 to UBound(vl_item_total_fixo1_array)-1
						vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr>"
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								
					Do While Not objrs.Eof
					cont_array = 0	
					If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
							
					 If Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" then
						sql = "SELECT SUM(VL_ITEM) AS VL_ITEM FROM (SELECT CASE (SELECT ISNULL(IN_FUNDO_POBREZA,'0') FROM BROKER.DBO.TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO )"&_
						" WHEN '1' THEN SUM(ISNULL(VL_ICMS_ITEM,0))+(SELECT ROUND(SUM(ISNULL(VL_BASE_CALC_ICMS,0)) * ((SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS)/100),2) "&_
					    " FROM TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO) "&_
						" WHEN '0' THEN SUM(ISNULL(VL_ICMS_ITEM,0)) "&_
						" END AS VL_ITEM, D.NR_PROC_PO  "&_
					 " FROM TDETALHE_MERCADORIA D "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"	&_
					" GROUP BY NR_PROC_PO, D.NR_ADICAO ) VW_TEMP "&_
					" GROUP BY NR_PROC_PO "
					Else
						sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
					    " WHERE NR_PROCESSO = '"& nr_processo &"'"&_
					    " GROUP BY NR_PROC_PO "
					End if				     

					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
                    
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_
                    "<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "&nbsp;</nobr></td>"
					
					If objrsx.RecordCount > 0 Then 
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop
						
						vTxExcel_inst = vTxExcel_inst & "</tr>"
						
					Else
					For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next
					End If
					objrs.MoveNext
					If objrs.Eof Then Exit Do
					Loop
	
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
					
						vTxExcel_inst = vTxExcel_inst &  "<tr bgcolor='" & bgcolor & "'>"&_
							"<td class='detcampo'><nobr>&nbsp;<B>" & tx_lang_TDE092(cd_lang) & "</B>&nbsp;</nobr></td>"
							For i=0 to UBound(vl_item_total_fixo1_array)-1
                            vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)) & "</b></td>"
                            Next
						vTxExcel_inst = vTxExcel_inst &  "</tr>	"
					
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT CD_ITEM, NM_ITEM FROM TITEM WHERE CD_ITEM IN (" & total_item & ") ORDER BY CD_ITEM ASC"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)

If Not objrs.Eof Then
  Do While Not objrs.Eof
  cont_array = 0	
  If objrsx.State = adStateOpen Then objrsx.Close
  
  if Trim(objrs.Fields.Item("CD_ITEM").Value) = "075" Then 
  	cd_item_select = "027"
  Else
    cd_item_select = Trim(objrs.Fields.Item("CD_ITEM").Value) 		
  End If
  
    sql = " SELECT ISNULL(SUM(VL_ITEM_AREA),0) AS VL_ITEM "&_
  " FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
  " INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
  " AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_
  " INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
  " WHERE FC.CD_ITEM = '" & cd_item_select & "'"&_
  " AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
  " AND FC.NR_PROCESSO = '" & nr_processo & "'"&_
  " GROUP BY RC.CD_REFERENCIA "
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
			
  If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" & bgcolor & "'>"&_
	"<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value)& "&nbsp;</nobr></td>"
	
	 If objrsx.RecordCount > 0 Then 
		Do While Not objrsx.Eof 
		vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
		vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
		
		vTxExcel_inst = vTxExcel_inst &  "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
        
		cont_array = cont_array + 1
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
		Loop
		vTxExcel_inst = vTxExcel_inst & "</tr>"
  Else
		For i=1 to cont_pedido
		vl_item_fixo = 0
		
		vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
	  	
		cont_array = cont_array + 1
	  	Next
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
Else
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"

vTxExcel_inst = vTxExcel_inst &  "<tr height='50' bgcolor='" & bgcolor & "'><td align='center' colspan=" & cont_pedido + 1 & ">" & tx_lang_TDE097(cd_lang) & "</td></tr>"

End if



'objrsx.Close
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"

					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" &  bgcolor & "'>"&_
						"<td class='detcampo'><nobr>&nbsp;<b>" & tx_lang_TDE094(cd_lang) & " " 
						If verifica_rateio = 1 Then 
							vTxExcel_inst = vTxExcel_inst & tx_lang_TDE095(cd_lang) 
						Else 
							vTxExcel_inst = vTxExcel_inst & tx_lang_TDE096(cd_lang) 
						End If 
						vTxExcel_inst = vTxExcel_inst & "</b>&nbsp;</nobr></td>"
                        For i=0 to UBound(vl_item_total_fixo1_array)-1
                            vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)-vl_frete_mn_item(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr> "
Else
	vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'><td><b>" & tx_lang_TDE098(cd_lang) & "</b></td></tr>"
End If                   				
vTxExcel_inst = vTxExcel_inst & "</table>"&_
"</td>"&_
"</tr>"&_
"</table>"
End If
Else

							vTxExcel_inst = vTxExcel_inst &	"<tr class='gridtop2'><br>"&_
								"<td colspan='4' align='center' height='26'>" & UCase(tx_lang_TDE086(cd_lang)) & "</td>"&_
								"</tr>"

                	If objrs.state=adstateOpen then objrs.close()
					vl_mercadoria_total = 0
                    sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN) WHEN '11' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN - VL_TOTAL_SEG_MN) WHEN '01' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_SEG_MN) WHEN '00' THEN (VL_TOTAL_MLE_MN) END AS TOTAL FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
                    
					If objrs.RecordCount > 0 Then	
                    vl_mercadoria_total = objrs.Fields.Item("TOTAL").Value
                    End If
     				vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE087(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >"& FormatNumber(vl_mercadoria_total) & "</td>"&_
					"</tr>"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE088(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_frete_mn) & "</td>"&_
					"</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'>" & UCase(desc_seguro_mn) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_seguro_mn) & "</td>"&_
					"</tr>"
					
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_ACRESCIMO_ITEM_MN) AS ACRESCIMO FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vl_item_fixo = 0
					vl_acrescimo_mn = 0
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn = vl_item_fixo
					End if
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>" & tx_lang_TDE089(cd_lang) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_item_fixo) & "</td>"&_
					"</tr>"
										
					vl_item_total_fixo1 = 0
					vl_item_total_fixo1 = vl_frete_mn + vl_seguro_mn + vl_item_fixo + vl_mercadoria_total
					
                    vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'>"&_
						"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE090(cd_lang) & "</B></td>"&_
						"<td colspan='2' align='right' ><b>" & FormatNumber(vl_item_total_fixo1) & "</b></td>"&_
					"</tr>"
                    
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.State = adStateOpen Then objrsx.Close
					vl_item_fixo = 0
					sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC "&_
					" WHERE CD_ITEM ='" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "' AND NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
					End if
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td colspan='2' class='detcampo'>"& Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
						"<td colspan='2' align='right' >" & FormatNumber(vl_item_fixo) & "</td>"&_
					"</tr>"
										
					vl_item_total_fixo2 = 0
					vl_item_total_fixo2 = vl_item_total_fixo1 + vl_item_fixo
					bgcolor = "#E5F7ED"
					
                    vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" & bgcolor & "'>"&_
						"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE091(cd_lang) & "</B></td>"&_
						"<td colspan='2' align='right'><b>" & FormatNumber(vl_item_total_fixo2) & "</b></td>"&_
					"</tr>"
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
							
					vl_item_total_fixo3 = 0				
					Do While Not objrs.Eof
						If objrsx.State = adStateOpen Then objrsx.Close
						vl_item_fixo = 0
						sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC "&_
						" WHERE CD_ITEM ='" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "' AND NR_PROCESSO = '" & nr_processo & "'"
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount > 0 Then
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
						End if
	
						If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
						
						vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_
							"<td colspan='2' class='detcampo'>" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
							"<td align='right' colspan='2'>" & FormatNumber(vl_item_fixo) & "</td>"&_
						"</tr>"
						
						vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_fixo
						objrs.MoveNext
						If objrs.Eof Then Exit Do
					Loop
					vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_total_fixo2
					
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	
    		vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor &"'>"&_
			"<td colspan='2' class='detcampo'><B>" & tx_lang_TDE092(cd_lang) & "</B></td>"&_
			"<td colspan='2' align='right'><B>" & FormatNumber(vl_item_total_fixo3) & "</B></td>"&_
			"</tr>"	
					
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT DISTINCT F.CD_ITEM AS CD_ITEM, F.DT_LANCAMENTO, ISNULL(F.VL_ITEM,0) AS VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','091','025','026','600','599','027','032','991','578','994') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.CD_ITEM ASC "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)
	vl_item_total_fixo4 = 0
	total_item = ""
If Not objrs.Eof Then
	Do While Not objrs.Eof
		total_item = total_item & Trim(objrs.Fields.Item("CD_ITEM").Value) 
	  	vl_item_fixo = Trim(objrs.Fields.Item("VL_ITEM").Value)
	  	vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_fixo
		
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_		
		"<td colspan='2' class='detcampo'>" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "</td>"&_
		"<td colspan='2' align='right'>" & FormatNumber(vl_item_fixo) &  "</td>"&_
		"</tr>"
		
		objrs.MoveNext
		If objrs.Eof Then Exit Do Else total_item = total_item & "','"
	Loop
	total_item = "'" & total_item & "'"
End If
objrs.Close
'objrsx.Close
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_total_fixo3 - vl_frete_mn - vl_acrescimo_mn

				vTxExcel_inst = vTxExcel_inst &	"<tr height='18' bgcolor='"&  bgcolor & "'>"&_
				"<td colspan='2' class='detcampo'><b>" & tx_lang_TDE093(cd_lang) & "</b></td>"&_
                "        <td colspan='2' align='right'><b>"  & FormatNumber(vl_item_total_fixo4) & "</b></td>"&_
				"	</tr>"&_
				"</table></td></tr>"&_
                "</table>"&_
"</td>"&_
"</tr>"

	If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIO AS RATEIO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateio_grupo = objrs.Fields.Item("RATEIO").Value
	Else
		in_rateio_grupo = "0"
	End if
	objrs.Close
	
	If in_rateio_grupo = "1" Then

vTxExcel_inst = vTxExcel_inst &	"<tr>"&_
"<td height='100%' valign='top' style='border: solid 1px #336699;'><br><table width='100%' border=1 cellpadding=0 cellspacing=0 bordercolor='#FFFFFF' style='padding: 0px 1px 0px 1px;'>"&_
"<col width='10px'><col width='200px'>"&_
"<tr class='gridtop2'>"

                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT COUNT(CD_MERCADORIA) AS COUNT_MERCADORIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					cont_merc = Trim(objrs.Fields.Item("COUNT_MERCADORIA").Value)
					ReDim vl_item_total_fixo1_array(cont_merc)
					ReDim vl_frete_mn_item(cont_merc)
					ReDim vl_acrescimo_mn_item(cont_merc)
					
					if cont_merc = 0 Then 
						cont_merc = 1
					End If
					
               vTxExcel_inst = vTxExcel_inst &	"<td colspan=" &  cont_merc +1 & " align='center' height='26'>" & UCase(tx_lang_TDE099(cd_lang)) & "</td>"&_
                "</tr>"
				
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT CD_MERCADORIA AS CD_MERCADORIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					If objrs.RecordCount > 0 Then 
						
						vTxExcel_inst = vTxExcel_inst & "<tr class='gridtop'>"&_
						"<td bgcolor='#FFFFFF'></td>"
						
						 Do While Not objrs.Eof  
						vTxExcel_inst = vTxExcel_inst & "<td class='detcampo' align='center'><nobr>&nbsp;" & UCase(Trim(objrs.Fields.Item("CD_MERCADORIA").Value)) & "&nbsp;</nobr></td>"
						
						objrs.MoveNext
						If objrs.Eof Then Exit Do
						Loop 
						
						vTxExcel_inst = vTxExcel_inst & "</tr><tr bgcolor='#E5F7ED'>" &_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE087(cd_lang) & "&nbsp;</nobr></td>"
                   
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_MLE_ITEM_MN - VL_FRETE_ITEM_MN) WHEN '11' THEN (VL_MLE_ITEM_MN - VL_FRETE_ITEM_MN - VL_SEGURO_ITEM_MN) WHEN '01' THEN (VL_MLE_ITEM_MN - VL_SEGURO_ITEM_MN) WHEN '00' THEN (VL_MLE_ITEM_MN) END AS VL_ITEM "&_
						  " FROM TDECLARACAO_IMPORTACAO DI "&_
						  " INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
"INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                          " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                          " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
						  " AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                          " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
						  " WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
					If objrsx.RecordCount > 0 Then 
					cont_array = 0		
						Do While Not objrsx.Eof	
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next	
					End If
					  
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE088(cd_lang) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_FRETE_ITEM_MN AS FRETE"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount > 0 Then 		
					cont_array = 0		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("FRETE").Value)
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) 
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) 
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next		
					End If
					    
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & UCase(desc_seguro_mn) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_SEGURO_ITEM_MN AS SEGURO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then 	
					cont_array = 0			
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("SEGURO").Value)
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next	
					End If
					    
					vTxExcel_inst = vTxExcel_inst & "</tr>	"&_
                    "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & tx_lang_TDE089(cd_lang) & "&nbsp;</nobr></td>"
                    
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_ACRESCIMO_ITEM_MN AS ACRESCIMO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					If objrsx.RecordCount > 0 Then 		
					cont_array = 0		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next		
					End If
					   
					vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='#E5F7ED'>"&_
						"<td class='detcampo'><B>&nbsp;" & tx_lang_TDE090(cd_lang) & "&nbsp;</B></td>"
                        For i=0 to UBound(vl_item_total_fixo1_array)-1
						vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr>"
                    
					If objrs.State = adStateOpen Then objrs.Close

					verifica_rateio = 0
					sql = "SELECT NR_PROCESSO "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					" INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
					" AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_
                                                                      " WHERE NR_PROCESSO = '" & nr_processo & "'" 
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrs.RecordCount > 0 Then
						verifica_rateio = 1
					End If
					objrs.Close
					
					If verifica_rateio = 1 Then
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					cont_array = 0
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = " SELECT ISNULL(VL_ITEM_AREA,0) AS VL_ITEM "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					" INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
					" AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
					" WHERE FC.CD_ITEM = '" & Trim(objrs.Fields.Item("CD_ITEM").Value) & "'"&_
					" AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
					" AND FC.NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#D4E6DC'>"&_
						"<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "&nbsp;</nobr></td>"
					
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop		
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next
					End if
					bgcolor = "#E5F7ED"
					
                    vTxExcel_inst = vTxExcel_inst & "</tr>"&_
                    "<tr bgcolor='" & bgcolor & "'>"&_
						"<td class='detcampo'>&nbsp;" & tx_lang_TDE091(cd_lang) & "&nbsp;</td>"
						 For i=0 to UBound(vl_item_total_fixo1_array)-1
						vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr>"
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								
					Do While Not objrs.Eof
					cont_array = 0	
					If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
					sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM"&_
					" FROM TDETALHE_MERCADORIA "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"&_
					" GROUP BY NR_PROC_PO "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
                    
					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='"&  bgcolor & "'>"&_
                    "<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value) & "&nbsp;</nobr></td>"
					
					If objrsx.RecordCount > 0 Then 
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							
							vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
							
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop
						
						vTxExcel_inst = vTxExcel_inst & "</tr>"
						
					Else
					For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						
						vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
						
						cont_array = cont_array + 1
						Next
					End If
					objrs.MoveNext
					If objrs.Eof Then Exit Do
					Loop
	
					If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
					
						vTxExcel_inst = vTxExcel_inst &  "<tr bgcolor='" & bgcolor & "'>"&_
							"<td class='detcampo'><nobr>&nbsp;<B>" & tx_lang_TDE092(cd_lang) & "</B>&nbsp;</nobr></td>"
							For i=0 to UBound(vl_item_total_fixo1_array)-1
                            vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)) & "</b></td>"
                            Next
						vTxExcel_inst = vTxExcel_inst &  "</tr>	"
					
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT CD_ITEM, NM_ITEM FROM TITEM WHERE CD_ITEM IN (" & total_item & ") ORDER BY CD_ITEM ASC"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)

If Not objrs.Eof Then
  Do While Not objrs.Eof
  cont_array = 0	
  If objrsx.State = adStateOpen Then objrsx.Close
 
   if Trim(objrs.Fields.Item("CD_ITEM").Value) = "075" Then 
  	cd_item_select = "027"
  Else
    cd_item_select = Trim(objrs.Fields.Item("CD_ITEM").Value) 		
  End If
  
  sql = " SELECT ISNULL(VL_ITEM_AREA,0) AS VL_ITEM "&_
  " FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
  " INNER JOIN TS_FATURA FA (NOLOCK) ON FA.NR_SOLICITACAO = FC.NR_SOLICITACAO "&_
  " AND FA.CD_UNID_NEG = FC.CD_UNID_NEG AND FA.CD_PRODUTO = FC.CD_PRODUTO AND ISNULL(FA.IN_CANCELADO,0) = 0"&_	
  " INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
  " WHERE FC.CD_ITEM = '" & cd_item_select & "'"&_
  " AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
  " AND FC.NR_PROCESSO = '" & nr_processo & "'"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
  If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
	vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" & bgcolor & "'>"&_
	"<td class='detcampo'><nobr>&nbsp;" & Trim(objrs.Fields.Item("NM_ITEM").Value)& "&nbsp;</nobr></td>"
	
	 If objrsx.RecordCount > 0 Then 
		Do While Not objrsx.Eof 
		vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
		vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
		
		vTxExcel_inst = vTxExcel_inst &  "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
        
		cont_array = cont_array + 1
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
		Loop
		vTxExcel_inst = vTxExcel_inst & "</tr>"
  Else
		For i=1 to cont_merc
		vl_item_fixo = 0
		
		vTxExcel_inst = vTxExcel_inst & "<td align='right'>" & FormatNumber(vl_item_fixo) & "</td>"
	  	
		cont_array = cont_array + 1
	  	Next
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
Else
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"

vTxExcel_inst = vTxExcel_inst &  "<tr height='50' bgcolor='" & bgcolor & "'><td align='center' colspan=" & cont_merc + 1 & ">" & tx_lang_TDE097(cd_lang) & "</td></tr>"

End if



'objrsx.Close
If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"

					vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='" &  bgcolor & "'>"&_
						"<td class='detcampo'><nobr>&nbsp;<b>" & tx_lang_TDE094(cd_lang) & " " 
						If verifica_rateio = 1 Then 
							vTxExcel_inst = vTxExcel_inst & tx_lang_TDE095(cd_lang) 
						Else 
							vTxExcel_inst = vTxExcel_inst & tx_lang_TDE096(cd_lang) 
						End If 
						vTxExcel_inst = vTxExcel_inst & "</b>&nbsp;</nobr></td>"
                        For i=0 to UBound(vl_item_total_fixo1_array)-1
                            vTxExcel_inst = vTxExcel_inst & "<td align='right'><b>" & FormatNumber(vl_item_total_fixo1_array(i)) & "</b></td>"
                        Next
					vTxExcel_inst = vTxExcel_inst & "</tr> "
Else
	vTxExcel_inst = vTxExcel_inst & "<tr bgcolor='#E5F7ED'><td><b>" & tx_lang_TDE098(cd_lang) & "</b></td></tr>"
End If                   				
vTxExcel_inst = vTxExcel_inst & "</table>"&_
"</td>"&_
"</tr>"&_
"</table>"
Else
vTxExcel_inst = vTxExcel_inst & "<tr><td colspan='4'>&nbsp;&nbsp;</td></tr></table>"
End If
End if
vTxExcel_inst = vTxExcel_inst & "</body></html>"
'Response.write vTxExcel_inst
'Response.end
objtxt.WriteLine(vTxExcel_inst)
objtxt.Close()
  Set objtxt = Nothing
  Set objfso = Nothing
End Sub

vTxArquivo = "instrucao"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"

Call subGeraExcel(vTxCaminho, vTxArquivo)
Response.redirect("/arquivo/download.asp?vTxCaminho=" & vTxCaminho & "&vTxArquivo=" & vTxArquivo)
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%= nm_menu &" - "& nm_subm%></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->
