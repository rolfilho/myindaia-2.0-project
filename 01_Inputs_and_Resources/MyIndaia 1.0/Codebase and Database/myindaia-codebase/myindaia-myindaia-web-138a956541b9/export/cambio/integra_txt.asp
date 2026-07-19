<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 25/08/2008 [ Flávio ] 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%	

'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 1800

cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")

dim vTipo : vTipo = Request.QueryString("tipo")
dim vReemite : vReemite = Request.QueryString("reemite")
dim vDtIni : vDtIni = Request.QueryString("dtIni")
dim vDtFim : vDtFim = Request.QueryString("dtFim")
dim vTxCaminho 'caminho do arquivo
dim vTxArquivo 'nome do arquivo
dim vNrBanco,vNrContrato,vNR_FATURA_CDE
dim chkloop 'Variáveis de controle

sub subGeraTxt(caminho, arquivo)
  dim objfso 'objeto do sistema de arquivos 
  dim objtxt 'objeto para a criação de arquivos
  dim vTxt,vTxt_c 'texto com o registro a ser gravado, onde vTxt_c=Crédito
	dim sql_s, sql_f, sql_w, sql_u,sqlUpd
	dim vGrupoAux, vDtDocto
	dim vTpDocto, vCompCode, vPstKey1, vPstKey2, vAccount1, vAccount2, vTxHeader1, vTxHeader2, vTxHeader3
	'Response.Redirect("../../IMPORT/teste.asp?var1="&vTipo&"")

	sql_s = "SELECT "&_
					"  CC.NR_CONT_CAMB, CC.NR_BANCO, CC.CD_EXPORTADOR, CC.CD_CORRETORA, CC.NR_BANCO_CRED, CC.IN_CAMBIO_PRONTO, "&_
					"  CC.DT_FECHAMENTO, CC.DT_ADIANTAMENTO, CC.DT_VENC_DOCTO, CC.DT_VENC_LIQ, CC.TX_FATURAS, CC.VL_ACE, "&_ 
					"  CAST(CAST(CC.VL_NEGOC AS decimal(16, 2)) AS VARCHAR) AS VL_NEGOC, "&_
					"  CAST(CAST(CC.VL_TAXA_CAMBIAL AS decimal(16, 2)) AS VARCHAR) AS VL_TAXA_CAMBIAL, "&_
					"  CAST(CAST(CC.VL_TAXA_JUROS AS decimal(16, 2)) AS VARCHAR) AS VL_TAXA_JUROS, "&_
					"  CAST(CAST(CC.VL_COMISSAO_AG AS decimal(16, 2)) AS VARCHAR) AS VL_COMISSAO_AG, "&_
					"  CC.CD_USUARIO_CRIA, CC.DT_CRIA_CONT, CC.CD_STATUS_CONT, EN.CD_GRUPO, "&_
					"  ("&_
					"   SELECT LTRIM(RTRIM(CD_EXTERNO)) "&_
					"   FROM TDE_PARA (NOLOCK) "&_
					"   WHERE CD_UNID_NEG = '01' AND CD_PRODUTO = '02' "&_
					"     AND CD_TABELA = '21' AND CD_DDBROKER = CC.CD_MOEDA_NEGOC"&_
					"  ) AS MOEDA "
	sql_f = "FROM TCONT_CAMB CC (NOLOCK) "&_
					"  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON (EN.CD_EMPRESA = CC.CD_EXPORTADOR) "
	if objrs.State = adStateOpen then objrs.Close()
	select case vTipo
		' Fechamento deixa de existir a partir de hoje [ 25/08/2008 ]
		'case 1 ''Fechamento de cambio banco ACC DC
			'sql_w = "WHERE CC.DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
			'				"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '0' "
			'alias da tabela onde vão ser marcados os regitros emitidos
			'sql_u = "CC"
		case 1,2 'Vinculação de contrato ACC x ACE [ 25/08/2008 ]
			sql_s = sql_s &", PE.NR_FATURA_CDE, PE.DT_VINCULADO "
			sql_f = sql_f &"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PE (NOLOCK) ON (PE.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PE.NR_BANCO = CC.NR_BANCO) "
			sql_w = " WHERE PE.DT_VINCULADO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
							"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '0' "
			sql_u = "PE"
			'alias da tabela onde vão ser marcados os regitros emitidos
			'Response.Redirect("../../IMPORT/teste.asp?var1="&sql_s&sql_f&sql_w&"")

		case 3 'Provisão de juros ## Cast=Conversão entre tipos de campos ##
			sql_s = sql_s &", CAST(CAST(CC.VL_NEGOC * (CC.VL_TAXA_JUROS / 3600 * DATEDIFF(day, CC.DT_ADIANTAMENTO, CC.DT_VENC_LIQ)) AS decimal(16, 2)) AS VARCHAR) AS VL_NEGOC_JUROS "
			sql_w = "WHERE CC.DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
							"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '0' "
			'alias da tabela onde vão ser marcados os regitros emitidos
			sql_u = "CJ"
		case 4 'pagamento de cliente ACE
			sql_s = sql_s &",  PL.NR_NF, PL.NR_DOCTO_CONTABIL, PL.DT_LIQUIDADO, EE.NR_CLIENTE, "&_
							"  CAST(CAST(PL.VL_LIQUIDADO AS decimal(16, 2)) AS VARCHAR) AS VL_LIQUIDADO "
			sql_f = sql_f &"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PE (NOLOCK) ON (PE.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PE.NR_BANCO = CC.NR_BANCO) "&_
							"  INNER JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PE.NR_PROCESSO AND PL.NR_FATURA_CDE = PE.NR_FATURA_CDE) "&_
							"  INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = PE.NR_PROCESSO) "&_
							"  INNER JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = PR.CD_IMPORTADOR) "
			sql_w = "WHERE PL.DT_LIQUIDADO BETWEEN CONVERT(DATETIME, '"& vDtIni  &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
							"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '0' "
			'alias da tabela onde vão ser marcados os regitros emitidos
			sql_u = "PL"
		case 5 'Cambio Pronto
			sql_s = sql_s &",  PL.NR_NF, PL.NR_DOCTO_CONTABIL, PL.DT_LIQUIDADO, EE.NR_CLIENTE, "&_
							"  CAST(CAST(PL.VL_LIQUIDADO AS decimal(16, 2)) AS VARCHAR) AS VL_LIQUIDADO "
			sql_f = sql_f &"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PE (NOLOCK) ON (PE.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PE.NR_BANCO = CC.NR_BANCO) "&_
							"  INNER JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PE.NR_PROCESSO AND PL.NR_FATURA_CDE = PE.NR_FATURA_CDE) "&_
							"  INNER JOIN TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = PE.NR_PROCESSO) "&_
							"  INNER JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = PR.CD_IMPORTADOR) "
			sql_w = "WHERE CC.DT_FECHAMENTO BETWEEN CONVERT(DATETIME, '"& vDtIni &"', 103) AND CONVERT(DATETIME, '"& vDtFim &"', 103) "&_
							"  AND ISNULL(CC.IN_CAMBIO_PRONTO, '0') = '1' "
			'alias da tabela onde vão ser marcados os regitros emitidos
			sql_u = "CC"
	end select

	'verifica se é para reemitir a documentação
	if vReemite = "0" then sql_w = sql_w &" AND ISNULL(CC.IN_EMITIDO, '0') = '0' "
			
	'verifica se o usuario é cliente
	if InStr("040;055;060", Session("cd_cargo")) > 0 then
		sql_f = sql_f& " INNER JOIN TPERMISSAO PC (NOLOCK) ON (PC.CD_CLIENTE = CC.CD_EXPORTADOR AND PC.CD_USUARIO = '"& Session("cd_usuario") &"') "
	end if
	
	'monta update para marcar registros como emitidos
	sql_u = "UPDATE "& sql_u &" SET "&_
					"  IN_EMITIDO = '1', CD_USUARIO_EMISSOR = '"& Session("cd_usuario") &"', "&_
					"  DT_EMISSAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) "
					
	if vTipo = 3 then
	  sql_f = sql_f &"  INNER JOIN TCONT_CAMB_JUROS CJ (NOLOCK) ON (CJ.NR_CONT_CAMB = CC.NR_CONT_CAMB AND CJ.NR_BANCO = CC.NR_BANCO) "
	end if
	
	sql_u = sql_u & sql_f & sql_w
	
	'monta e executa a query que seleciona os registros do arquivo
	sql = sql_s & sql_f & sql_w &" ORDER BY EN.CD_GRUPO, CC.NR_CONT_CAMB, CC.NR_BANCO "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	if objrs.RecordCount < 1 then 
%>
<script language="javascript">
	alert("Não foram encontrados registros para o tipo de documento selecionado no período de <%= vDtIni%> á <%= vDtFim%>");
	window.close();
</script>
<%    
		Response.End()
	else
		'cria o objeto q gerencia o sistema de arquivos
		set objfso = CreateObject("Scripting.FileSystemObject")
		'cria o ojbeto responsável pela criação do arquivo
		set objtxt = objfso.CreateTextFile(caminho&arquivo,True,False)

		vGrupoAux = ""
		chkloop=1
	  do while not objrs.Eof			
			if vGrupoAux <> objrs.Fields.Item("CD_GRUPO").Value then
				'seleciona os parametros do grupo
				if objrsx.State = adStateOpen then objrsx.Close()
				sql = "SELECT CD_GRUPO, TP_DOCTO, CD_COMP, CD_PSTK_DEB, CD_PSTK_CRED, "&_
							"  CD_PSTK_DEB_CUST, CD_PSTK_CRED_CUST, CD_CTA_ACC, CD_CTA_ACC_DESP_JUR, "&_
							"  CD_CTA_ACC_PROV_JUR, CD_CTA_ACE, TX_HEADER1, TX_HEADER2, TX_HEADER3 "&_
							"FROM TCONT_CAMB_PARAM (NOLOCK) "&_
							"WHERE CD_GRUPO = '"& objrs.Fields.Item("CD_GRUPO").Value &"' "
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Response.Redirect("../../IMPORT/teste.asp?var1="&sql&"") 
				vTpDocto = Trim(objrsx.Fields.Item("TP_DOCTO").Value)
				vCompCode = Trim(objrsx.Fields.Item("CD_COMP").Value)
				vPstKey1 = Trim(objrsx.Fields.Item("CD_PSTK_DEB").Value)
				vPstKey2 = Trim(objrsx.Fields.Item("CD_PSTK_CRED").Value)
				vAccount1 = Trim(objrsx.Fields.Item("CD_CTA_ACC").Value)
				vAccount2 = Trim(objrsx.Fields.Item("CD_CTA_ACE").Value)
				vTxHeader1 = Trim(objrsx.Fields.Item("TX_HEADER1").Value)
				vTxHeader2 = Trim(objrsx.Fields.Item("TX_HEADER2").Value)
				vTxHeader3 = Trim(objrsx.Fields.Item("TX_HEADER3").Value)
			end if 
			
			'Pegar Valor Vinculado 
			vNR_FATURA_CDE= Trim(objrs.Fields.Item("NR_FATURA_CDE").Value)
			vNrBanco= Trim(objrs.Fields.Item("NR_BANCO").Value)
			if objrsy.State = adStateOpen then objrsy.Close()
			   sql = "SELECT PC.NR_FATURA_CDE, ISNULL(PC.VL_VINCULADO, 0) AS VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, "&_
					"  ISNULL(SUM(PL.VL_LIQUIDADO), 0) AS VL_LIQUIDADO, ISNULL(EE.NM_EMPRESA, '') AS NM_IMPORTADOR "&_
					"FROM TCONT_CAMB CC (NOLOCK) "&_
					"  INNER JOIN TPROCESSO_EXP_CONT_CAMB PC (NOLOCK) ON (PC.NR_CONT_CAMB = CC.NR_CONT_CAMB AND PC.NR_BANCO = CC.NR_BANCO) "&_
					"  INNER JOIN ( "&_
					"    SELECT NR_PROCESSO, NR_FATURA_CDE, ISNULL(SUM(VL_VINCULADO), 0) AS VL_TOTAL_VINC "&_
					"    FROM TPROCESSO_EXP_CONT_CAMB (NOLOCK) "&_
					"    GROUP BY NR_PROCESSO, NR_FATURA_CDE "&_
					"  ) PT ON (PT.NR_PROCESSO = PC.NR_PROCESSO AND PT.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
					"  LEFT JOIN TPROCESSO_EXP_CONT_CAMB_LIQ PL (NOLOCK) ON (PL.NR_PROCESSO = PC.NR_PROCESSO AND PL.NR_FATURA_CDE = PC.NR_FATURA_CDE) "&_
					"  INNER JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = PC.NR_PROCESSO) "&_
					"  INNER JOIN TEMPRESA_EST EE (NOLOCK) ON (EE.CD_EMPRESA = PE.CD_IMPORTADOR)  "&_
					"WHERE PC.NR_FATURA_CDE = '"&vNR_FATURA_CDE&"' AND CC.NR_BANCO = '"&vNrBanco&"' "&_
					"GROUP BY PC.NR_FATURA_CDE, PC.VL_VINCULADO, PC.DT_VINCULADO, PT.VL_TOTAL_VINC, EE.NM_EMPRESA"
				   Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				   objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			   
			vGrupoAux = objrs.Fields.Item("CD_GRUPO").Value

			select case vTipo
				case 1 'FECHAMENTO DE ACC
				    if chkloop=1 then
						vAccount1 = objrsx.Fields.Item("CD_CTA_ACC_DESP_JUR").Value 
						vAccount2 = objrsx.Fields.Item("CD_CTA_ACC").Value
						if objrsv.State = adStateOpen then objrsv.Close()
						sql = "SELECT ISNULL(NR_CTA, '') AS NR_CTA FROM TCONT_CAMB_PARAM_BCO (NOLOCK) "&_
									"WHERE RTRIM(LTRIM(NR_BCO)) = '"& Trim(objrs.Fields.Item("NR_BANCO").Value) &"' "
						'Response.Redirect("../../IMPORT/teste.asp?var1="&sql&"") 
		'					sql = "SELECT ISNULL(NR_CTA, '') AS NR_CTA FROM TCONT_CAMB_PARAM_BCO (NOLOCK) "&_
		'								"WHERE RTRIM(LTRIM(NR_BCO)) = '"& Trim(objrs.Fields.Item("NR_BANCO_CRED").Value) &"' "
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						if objrsv.RecordCount > 0 then
							vAccount1 = Trim(objrsv.Fields.Item("NR_CTA").Value)
	
						end if
						
						vDtDocto = Year(objrs.Fields.Item("DT_FECHAMENTO").Value) &_
											 fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &_
											 fnc_AddZeros(Day(objrs.Fields.Item("DT_FECHAMENTO").Value), 2)
	
						vAccount1 = objrsv.Fields.Item("NR_CTA").Value 
						vAccount2 = objrsx.Fields.Item("CD_CTA_ACC").Value
						'TRAZER NR.CONTRATO,FECHAMENTO ACC, VALOR DO CONTRATO , LINHA1=CONTA DO BANCO ACC LINHA2=CONTA DO ACC
						vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
									 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
									 Trim(objrs.Fields.Item("NR_CONT_CAMB").Value) &"||"& vTxHeader1 &"||"& vPstKey1 &"|"& vAccount1 &"|||"&_
									 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"||||"& vTxHeader1 &"|||||"
						vTxt_c = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
									 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
									 Trim(objrs.Fields.Item("NR_CONT_CAMB").Value) &"||"& vTxHeader1 &"||"& vPstKey2 &"|"& vAccount2 &"|||"&_
									 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"||||"& vTxHeader1 &"|||||"
						vTxt=vTxt&vbcrlf&vTxt_c ' Imprime linha 1 e linha 2
						'codigo original
						'vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
						'			 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
						'			 Trim(objrs.Fields.Item("NR_CONT_CAMB").Value) &"||"& vTxHeader1 &"||"& vPstKey1 &"|"& vAccount1 &"|||"&_
						'			 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"||||"& vTxHeader1 &"|"& vPstKey2 &"|"& vAccount2 &"|||"&_
						'			 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"|||||"
						chkloop=chkloop+1
						objrsv.Close
				End If	
				case 2 ' VINCULAÇÃO DE FATURA
					if objrsv.State = adStateOpen then objrsv.Close()
					sql = "SELECT ISNULL(NR_CTA, '') AS NR_CTA FROM TCONT_CAMB_PARAM_BCO (NOLOCK) "&_
								"WHERE RTRIM(LTRIM(NR_BCO)) = '"& Trim(objrs.Fields.Item("NR_BANCO_CRED").Value) &"' "

					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					if objrsv.RecordCount > 0 then
						vAccount1 = Trim(objrsv.Fields.Item("NR_CTA").Value)

					end if
					objrsv.Close
					
					vDtDocto = Year(objrs.Fields.Item("DT_FECHAMENTO").Value) &_
										 fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &_
										 fnc_AddZeros(Day(objrs.Fields.Item("DT_FECHAMENTO").Value), 2)
					vAccount1 = objrsx.Fields.Item("CD_CTA_ACC").Value
					vAccount2 = objrsx.Fields.Item("CD_CTA_ACE").Value
					'TRAZER NR.FATURA,VEICULAÇÃO DE FATURA ACC, VALOR DA FATURA , LINHA1=CONTA DO ACC LINHA2=CONTA DO ACE
					vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
								 Trim(objrs.Fields.Item("NR_FATURA_CDE").Value) &"||"& vTxHeader2 &"||"& vPstKey1 &"|"& vAccount1 &"|||"&_
								 Trim(objrsy.Fields.Item("VL_VINCULADO").Value) &"||||"& vTxHeader2 &"|||||"
					vTxt_c = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
								 Trim(objrs.Fields.Item("NR_FATURA_CDE").Value) &"||"& vTxHeader2 &"||"& vPstKey2 &"|"& vAccount2 &"|||"&_
								 Trim(objrsy.Fields.Item("VL_VINCULADO").Value) &"||||"& vTxHeader2 &"|||||"
					vTxt=vTxt&vbcrlf&vTxt_c ' Imprime linha 1 e linha 2


'					CÓDIGO ANTERIOR
'					vDtDocto = Year(objrs.Fields.Item("DT_VINCULADO").Value) &_
'										 fnc_AddZeros(Month(objrs.Fields.Item("DT_VINCULADO").Value), 2) &_
'										 fnc_AddZeros(Day(objrs.Fields.Item("DT_VINCULADO").Value), 2)
'					
'					vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_VINCULADO").Value), 2) &"|"&_
'								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
'								 Trim(objrs.Fields.Item("NR_FATURA_CDE").Value) &"||"& vTxHeader2 &"||"& vPstKey1 &"|"& vAccount1 &"|||"&_
'								 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"||||"& vTxHeader2 &"|"& vPstKey2 &"|"& vAccount2 &"|||"&_
'								 Trim(objrs.Fields.Item("VL_NEGOC").Value) &"|||||"
				case 3
					vAccount1 = objrsx.Fields.Item("CD_CTA_ACC_DESP_JUR").Value
					vAccount2 = objrsx.Fields.Item("CD_CTA_ACC_PROV_JUR").Value
					
					vDtDocto = Year(objrs.Fields.Item("DT_FECHAMENTO").Value) &_
										 fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &_
										 fnc_AddZeros(Day(objrs.Fields.Item("DT_FECHAMENTO").Value), 2)
					
					vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"& fnc_AddZeros(Month(objrs.Fields.Item("DT_FECHAMENTO").Value), 2) &"|"&_
								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("VL_TAXA_CAMBIAL").Value) &"|||"&_
								 Trim(objrs.Fields.Item("NR_CONT_CAMB").Value) &"||"& vTxHeader3 &"||"& vPstKey1 &"|"& vAccount1 &"|||"&_
								 Trim(objrs.Fields.Item("VL_NEGOC_JUROS").Value) &"||||"& vTxHeader3 &"|"& vPstKey2 &"|"& vAccount2 &"|||"&_
								 Trim(objrs.Fields.Item("VL_NEGOC_JUROS").Value) &"|||||"
				case 4
					vDtDocto = fnc_AddZeros(Day(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &_
										 fnc_AddZeros(Month(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &_
										 Year(objrs.Fields.Item("DT_LIQUIDADO").Value)
					
					vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"&_
								 fnc_AddZeros(Month(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &"|"&_
								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("NR_NF").Value) &"|"&_
								 Trim(objrs.Fields.Item("NR_DOCTO_CONTABIL").Value) &"|"& vAccount1 &"|"&_
								 Trim(objrs.Fields.Item("VL_LIQUIDADO").Value) &"|"& Trim(objrs.Fields.Item("NR_CLIENTE").Value) &"|"
				case 5
					if objrsv.State = adStateOpen then objrsv.Close()
					sql = "SELECT ISNULL(NR_CTA, '') AS NR_CTA FROM TCONT_CAMB_PARAM_BCO (NOLOCK) "&_
								"WHERE RTRIM(LTRIM(NR_BCO)) = '"& Trim(objrs.Fields.Item("NR_BANCO").Value) &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsv.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					if objrsv.RecordCount > 0 then
						vAccount1 = Trim(objrsv.Fields.Item("NR_CTA").Value)
					end if
					objrsv.Close
					
					vDtDocto = fnc_AddZeros(Day(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &_
										 fnc_AddZeros(Month(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &_
										 Year(objrs.Fields.Item("DT_LIQUIDADO").Value)
					
					vTxt = vDtDocto &"|"& vTpDocto &"|"& vCompCode &"|"& vDtDocto &"|"&_
								 fnc_AddZeros(Month(objrs.Fields.Item("DT_LIQUIDADO").Value), 2) &"|"&_
								 Trim(objrs.Fields.Item("MOEDA").Value) &"|"& Trim(objrs.Fields.Item("NR_NF").Value) &"|"&_
								 Trim(objrs.Fields.Item("NR_DOCTO_CONTABIL").Value) &"|"& vAccount1 &"|"&_
								 Trim(objrs.Fields.Item("VL_LIQUIDADO").Value) &"|"& Trim(objrs.Fields.Item("NR_CLIENTE").Value) &"|"
			end select

			objtxt.WriteLine(vTxt)
			objrs.MoveNext

			'Response.Redirect("../../IMPORT/teste.asp?var1="&objtxt.WriteLine(vTxt)&"")
%><script>//alert(<%'=objtxt.WriteLine(vTxt)%>);</script><%
			If objrs.Eof or chkloop>1 Then Exit Do

		Loop
		objtxt.Close()
		'executa update que grava os emitidos
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql_u &"<br>"
					'Response.Redirect("../../IMPORT/teste.asp?var1="&sql_u&"")
		objcnn.Execute(sql_u)
		
		'gerou arquivo, lança log
		sql = "INSERT INTO TCONT_CAMB_LOG (CD_GRUPO, TP_INTEGRACAO, DT_INI, DT_FIM, CD_USUARIO, DT_GERACAO) "&_
					"VALUES("& fncValSQL(vGrupoAux, 0) &", "& fncValSQL(vTipo, 0) &", "& fncValSQL(vDtIni, 1)& ", "&_
						fncValSQL(vDtFim, 1) &", "& fncValSQL(Session("cd_usuario"), 0) &", GETDATE() )"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)					
	end if
	
  set objtxt = Nothing
  set objfso = Nothing
End Sub
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Contrato de Câmbio - Download</title>
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
<div id="textInLoad" style="position:absolute; top:50; left:38;">
<table width="170" height="70" border="1" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center"><b style="font-size:16px;">CARREGANDO...</b><br>
			por favor aguarde, o relatório esta sendo criado.</td>
	</tr>
</table>
</div>
<%
'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"
'gera o nome do arquivo
vTxArquivo = "IntegContCamb"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".txt"
'chama procedure para gerar o arquivo
Call subGeraTxt(vTxCaminho, vTxArquivo)
%>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Arquivo Texto<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
				aqui</b></a>.</p></td>
	</tr>
	<tr>
		<td height="35" align="center"><input type="button" class="button" value="X Fechar" onClick="javascript:window.close();"></td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
textInLoad.style.display="none";
window.focus();
window.open('/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>','download');
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->