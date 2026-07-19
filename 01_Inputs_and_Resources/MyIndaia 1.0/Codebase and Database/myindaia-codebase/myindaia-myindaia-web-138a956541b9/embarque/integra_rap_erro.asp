<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Embarques / Integrações
'Arquivo de Script e HTML: visualização de erros da rap
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNrRap, vNrFornecs
dim vInRap, vInForn, vInPack, vInAmostra, vInAntecipado
dim vTxValida, vTxAjuda, vTxItens

sub subVerificaAmostra(sNrRap, sInAmostra)
	'verifica se é amostra, e se for, valida a instrução sem integrar fornecimento e packing list
	if sInAmostra then
		str = "Instrução de Embarque criada com mercadorias para amostra, não é necessário informar os Fornecimentos."
		sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, IN_FORN_VALIDA = 1, IN_PACK_VALIDA = 1, TX_VALIDACAO = '"&str&"' "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"&sNrRap&"' "
	else
		str = "Instrução de embarque pronta para receber os fornecimentos."
		sql = "UPDATE TRAP SET IN_RAP_VALIDA = 1, TX_VALIDACAO = '"&str&"' WHERE CD_RAP+CD_RAP_ANO = '"&sNrRap&"'"
	end if
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
end sub

sub subEmailErroRap(nNrRap)
	'OBJETIVO: cria um e-mail no caso de existirem erros de validação e a qtde de mercadorias(códigos)
	'          no packing list seja igual ou maior que o fornecimentos. O e-mail será enviado ao suporte
	' Comentado a pedido da ocorrencia: 05071/08
'	dim vTxAssunto, vTxMensagem, vTxSaudacao
'	if objrsx.State = adStateOpen then objrsx.Close
'	sql = "SELECT IN_EMAIL_ERRO, "&_
'				"  ( SELECT COUNT(DISTINCT CD_MERCADORIA) FROM TRAP_FORNECIMENTO (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = R.CD_RAP+R.CD_RAP_ANO ), "&_
'				"  ( SELECT COUNT(DISTINCT CD_MERCADORIA) FROM TRAP_PACK_LIST (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = R.CD_RAP+R.CD_RAP_ANO ) "&_
'				"FROM TRAP R (NOLOCK) "&_
'				"WHERE CD_RAP+CD_RAP_ANO = '"&nNrRap&"'"
'	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
'	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'	
'	if objrsx.RecordCount > 0 then
'		if not objrsx.Fields.Item(0).Value and (objrsx.Fields.Item(1).Value > 0) and (objrsx.Fields.Item(2).Value > 0) then
'			select case Hour(Now)
'				case 1,2,3,4,5,6,7,8,9,10,11
'					vTxSaudacao = tx_lang_A00060(cd_lang)
'				case 12,13,14,15,16,17
'					vTxSaudacao = tx_lang_A00061(cd_lang)
'				case Else
'					vTxSaudacao = tx_lang_A00062(cd_lang)
'			end select
'			vTxAssunto = "[MyIndaiá Web] Erro RAP "& Left(nNrRap, 6) &"/"& Right(nNrRap, 2)
'			vTxMensagem = "<html><head><style>"&_
'				"  body {font-family: Verdana, Arial, Helvetica;background-color: #DEDEDE;}"&_
'				"  p {font-size: 12px;}"&_
'				"  br {line-height: 5px;}"&_
'				"  fieldset {background-color:#EFEFEF;font-size: 12px;padding: 5px;border: 1px solid #999999;}"&_
'				"  table{background-color:#EFEFEF;font-size: 10px;}"&_
'				"  th {background: #DEDEDE;border: 1px solid;border-color: #EDEDED #BCBCBC #BCBCBC #EDEDED;color: #666666;padding: 1px 2px 1px 2px;}"&_
'				"  td {border: solid #BCBCBC;border-width: 0px 1px 1px 0px;color: #333333;padding: 0px 1px 0px 2px;}"&_
'				"</style></head><body>"&_
'				"<p>"&vTxSaudacao&",</p>"&_
'				"<p>Foram verificados os seguintes erros na instrução nr. <b>"& Left(nNrRap, 6) &"/"& Right(nNrRap, 2) &"</b></p>"&_
'				"<fieldset>"& vTxValida &"</fieldset><br><fieldset>"& vTxAjuda &"</fieldset><br><fieldset>"& vTxItens &"</fieldset>"&_
'				"<p>Att.,<br>MyIndaiá Report Errors</p></body></html>"
'			if fnc_EnviaMail(Session("nm_email"), SUPORTEMAIL, ERROEMAIL, Null, vTxAssunto, vTxMensagem, 1, True) then
'				'altera a flag de envio de erro por e-mail
'				sql = "UPDATE TRAP SET IN_EMAIL_ERRO = 1 WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
'				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
'				objcnn.Execute(sql)
'			else
'				tx_erro = "Ocorreu um problema no sistema e não foi possível notificar o suporte sobre erros na Instrução."
'			end if
'		end if
'	end if
'	objrsx.Close
end sub

'recupera o codigo da rap
vNrRap = Request.QueryString("vNrRap")
'variaves do sitema
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
cd_view  = Request.QueryString("cd_view")
tx_erro  = Request.QueryString("tx_erro")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

sql = "SELECT NR_FORNECIMENTO, NR_NOTA_CREDITO, CD_MOEDA_MLE, CD_INCOTERM, CD_TERMO_PAGTO, IN_AMOSTRA, IN_ANTECIPADO, "&_
			"  ISNULL(VL_MLE, 0) AS VL_MLE, ISNULL(VL_PESO_LIQ, 0) AS VL_PESO_LIQ, ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, "&_
			"  ISNULL(VL_CUBAGEM, 0) AS VL_CUBAGEM, ISNULL(VL_DESCONTO, 0) AS VL_DESCONTO, TX_MOTIVO_DESC "&_
			"FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 then
	vInAmostra    = objrs.Fields.Item("IN_AMOSTRA").Value
	vInAntecipado = objrs.Fields.Item("IN_ANTECIPADO").Value
	vInRap   = false
	vInForn  = false
	vInPack  = false
	vTxAjuda = ""
	vTxItens = ""
	'executa a consistencia da rap, se forem verificados erros exibe na tela
	if (not fnc_TestaVar(objrs.Fields.Item("NR_FORNECIMENTO").Value) and not vInAmostra) or _
			not fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value) or _
			not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value) or _
			not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value) or _
		 (CDbl(objrs.Fields.Item("VL_MLE").Value)        = 0) or (CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value) = 0) or _
		 (CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0) or (CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)  = 0) or _
		((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value)) or _
		((CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value)) then
		'verifica cda um dos itens e cada um que encontrar erro adiciona mensagem de erro
		if not fnc_TestaVar(objrs.Fields.Item("NR_FORNECIMENTO").Value) and not vInAmostra then vTxAjuda = vTxAjuda&" - Preencher os fornecimentos;<br>"
		if not fnc_TestaVar(objrs.Fields.Item("CD_MOEDA_MLE").Value)    then vTxAjuda = vTxAjuda&" - Informar a Moeda FOB;<br>"
		if not fnc_TestaVar(objrs.Fields.Item("CD_INCOTERM").Value)     then vTxAjuda = vTxAjuda&" - Selecionar um Incoterm;<br>"
		if not fnc_TestaVar(objrs.Fields.Item("CD_TERMO_PAGTO").Value)  then vTxAjuda = vTxAjuda&" - Informar a Condição de Pagamento;<br>"
		if CDbl(objrs.Fields.Item("VL_MLE").Value)        = 0 then vTxAjuda = vTxAjuda&" - O valor FOB não pode ser zero;<br>"
		if CDbl(objrs.Fields.Item("VL_PESO_LIQ").Value)   = 0 then vTxAjuda = vTxAjuda&" - O valor do Peso Liquido não pode ser zero;<br>"
		if CDbl(objrs.Fields.Item("VL_PESO_BRUTO").Value) = 0 then vTxAjuda = vTxAjuda&" - O valor do Peso Bruto não pode ser zero;<br>"
		if CDbl(objrs.Fields.Item("VL_CUBAGEM").Value)    = 0 then vTxAjuda = vTxAjuda&" - O valor da Cubagem não pode ser zero;<br>"
		if (CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("NR_NOTA_CREDITO").Value) then
			vTxAjuda = vTxAjuda&" - Quando existir valor de desconto, deve-se informar a Nota de Crédito;<br>"
		end if
		if (CDbl(objrs.Fields.Item("VL_DESCONTO").Value) > 0) and not fnc_TestaVar(objrs.Fields.Item("TX_MOTIVO_DESC").Value) then
			vTxAjuda = vTxAjuda&" - Quando existir valor de desconto, deve-se informar o Motivo do Desconto;<br>"
		end if
		'verifica se ocorreram erros
		if fnc_TestaVar(vTxAjuda) then
			vTxAjuda = "Foram verificados os seguintes problemas na Instrução:<br><br>"&vTxAjuda
		end if
		'grava informação na tabela
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
				.CommandText = "sp_rap_verifica_fornec"
				.CommandType = adCmdStoredProc
				.Parameters.Refresh
				.Parameters("@nrRap") = vNrRap
				.Execute , , adExecuteNoRecords
				if .Parameters("@RETURN_VALUE") = 1 then vInForn = true
			end with
		end if
		objrsx.Close()
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
				.CommandText = "sp_rap_verifica_pack"
				.CommandType = adCmdStoredProc
				.Parameters.Refresh
				.Parameters("@nrRap") = vNrRap
				.Execute , , adExecuteNoRecords
				if .Parameters("@RETURN_VALUE") = 1 then vInPack = true
			end with
		end if
		objrsx.Close()
	end if
	'verificaçã das mercadorias		
	if not vInRap then
		vTxItens = "Para iniciar o diagnóstico de mercadorias, a Rap deve ser válida."
	else
		'verifica a qtde de itens nas tabelas de fornecimentos e packing list
		if objrsv.State = adStateOpen then objrsv.Close()
		sql = "SELECT COUNT(*), '0' FROM TRAP_FORNECIMENTO (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
					"SELECT COUNT(*), '2' FROM TRAP_PACK_LIST (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
		objrsv.Open sql, objcnn', adOpenStatic, adLockReadOnly, adCmdText
		if not vInForn then
			do until objrsv is nothing
				select case objrsv.Fields.Item(1).Value
					case "0" 'verifica os fornecimentos
						if objrsv.Fields.Item(0).Value = 0 then
							vTxAjuda = "Para prosseguir com a instrução de embarque, deve-se fazer a integração dos fornecimentos "&_
								"informados na instrução. Ao acessar a instrução é exibido o botão "&_
								"<img src=""/imagens/icones/32x32/btn_excel_1.gif"" width=16 height=16 align=absmiddle>, "&_
								"clique nele e informe o arquivo excel com os fornecimentos."
							vTxItens = "Não existem fornecimentos integrados.<br>Não foi possível realizar o diagnóstico das mercadorias."
						else
							vTxAjuda = "<b>Diagnóstico</b>(realize as verificações abaixo).<ol>"&_
								"<li>todos fornecimentos estão integrados?</li>"&_
								"<li>a moeda FOB e condição de pagto. são iguais em todos fornecimentos?</li>"&_
								"<li>o valor total e unitário das mercadorias foram informados?</li></ol>"
							vTxItens = "verificar"
						end if
				end select
				'avança para o proximo recordset
				set objrsv = objrsv.NextRecordset
			loop
		elseif not vInPack then
			do until objrsv is nothing
				select case objrsv.Fields.Item(1).Value
					case "2" 'verifica os volumes do packing list
						if objrsv.Fields.Item(0).Value = 0 then
							vTxAjuda = "Para prosseguir com a instrução de embarque, deve-se fazer a integração de packink list. "&_
								"Ao acessar a instrução é exibido o botão "&_
								"<img src=""/imagens/icones/32x32/btn_excel_2.gif"" width=16 height=16 align=absmiddle>, "&_
								"clique nele e informe o arquivo excel contendo os volumes do packing list."
							vTxItens = "Não existem volumes integrados.<br>Não foi possível realizar o diagnóstico das mercadorias."
						else
							vTxAjuda = "<b>Diagnóstico</b>(realize as verificações abaixo).<ol>"&_
								"<li>todos packing list estão integrados?</li>"&_
								"<li>o peso líquido das mercadorias é o mesmo informado no total?</li>"&_
								"<li>o peso bruto de cada volume é maior que o seu peso líquido?</li>"&_
								"<li>a diferença da qtde de mercadorias pode ter uma das seguintes causas:</li>"&_
								"<ul type=disc><li>unidade de medida diferente da usada nos fornecimentos;</li>"&_
								"<li>volume informado incorretamente, precisa excluir do packing list;</li></ul></ol>"
							vTxItens = "verificar"
						end if
				end select
				'avança para o proximo recordset
				set objrsv = objrsv.NextRecordset
			loop
		else
			vTxAjuda = "Para criar um embarque utilize o botão "&_
				"<img src=""/imagens/icones/32x32/btn_autorizar.gif"" width=16 height=16 align=absmiddle>."
			vTxItens = "Mercadorias diagnosticados e prontas para embarque."
		end if
		'limpa o recordset que verifica os fornecimentos e packing list
		if not objrsv is nothing then
			if objrsv.State = adStateOpen then objrsv.Close
		end if
	end if
	'recupera o texto da validação
	if objrsx.State = adStateOpen then objrsx.Close
	sql = "SELECT TX_VALIDACAO FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'recupera o texto da validação
	if objrsx.RecordCount > 0 then vTxValida = objrsx.Fields.Item("TX_VALIDACAO").Value
	if fnc_TestaVar(vTxValida) then vTxValida = Replace(Replace(vTxValida,"@","&nbsp;"), vbcrlf, "<br>")
	objrsx.Close()
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<style>
<!--
fieldset {
	background-color:#EFEFEF;
	font-size: 11px;
	padding: 5px;
	text-align:left;
}
th {
	background: #DEDEDE;
	border: 1px solid;
	border-color: #EDEDED #BCBCBC #BCBCBC #EDEDED;
	color: #666666;
	padding: 1px 2px 1px 2px;
}
td .erro {
	border: solid #BCBCBC;
	border-width: 0px 1px 1px 0px;
	color: #333333;
	padding: 0px 1px 0px 2px;
}
-->
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<tr height="25">
		<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td class="titpopup">&nbsp;Diagnóstico da Instrução <%= Left(vNrRap, 6)&"/"&Right(vNrRap, 2)%></td>
					<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table></td>
	</tr>
	<%
if objrs.RecordCount > 0 then
%>
	<tr>
		<td><div id="divErro" class="popupClass">
		<%
	vTxHtml = "<table width=100% border=0 cellpadding=0 cellspacing=0 style=""padding: 4px 3px 0px 3px;"">"&_
		"<tr><td valign=top><fieldset>"& vTxValida &"</fieldset></td></tr>"&_
		"<tr><td valign=top><fieldset>"& vTxAjuda &"</fieldset></td></tr>"
	if not vInAmostra then
		vTxHtml = vTxHtml &"<tr><td valign=top><fieldset>"
		if vTxItens = "verificar" then
			vTxItens = "<table width=100% cellspacing=1 cellpadding=0 border=0 style=""padding: 0px 0px 0px 2px;"">"&_
				"<tr><th>Nr. Fornec.</th><th>Mercadoria</th><th>Volume</th><th>Erros</th></tr>"
			if not vInForn then
				'verificação dos fornecimentos
				if objrsx.State = adStateOpen then objrsx.Close()
				sql = "SELECT CD_FORNECIMENTO, CD_MERCADORIA, TP_ERRO_VALIDA "&_
							"FROM TRAP_FORNECIMENTO (NOLOCK) "&_
							"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
							"  AND TP_ERRO_VALIDA IS NOT NULL"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				do while not objrsx.Eof
					vTxItens = vTxItens &_
						"<tr><td class=erro>"& objrsx.Fields.Item(0).Value &"</td>"&_
						"<td class=erro>"& objrsx.Fields.Item(1).Value &"</td>"&_
						"<td class=erro>&nbsp;</td>"&_
						"<td class=erro>"& fncExibeTiposErro(objrsx.Fields.Item(2).Value, 0) &"</td></tr>"
					objrsx.MoveNext
					if objrsx.Eof then exit do
				loop
				objrsx.Close()
			elseif not vInPack then
				'verificação do packing list
				if objrsx.State = adStateOpen then objrsx.Close()
				sql = "SELECT CD_FORNECIMENTO, CD_MERCADORIA FROM TRAP_FORNECIMENTO F (NOLOCK) "&_
							"WHERE F.CD_RAP+F.CD_RAP_ANO = '"& vNrRap &"' "&_
							"  AND F.CD_MERCADORIA NOT IN (SELECT CD_MERCADORIA FROM TRAP_PACK_LIST (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"')"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				if objrsx.RecordCount > 0 then
					do while not objrsx.Eof
						vTxItens = vTxItens &_
							"<tr><td class=erro>"& objrsx.Fields.Item("CD_FORNECIMENTO").Value &"</td>"&_
							"<td class=erro>"& objrsx.Fields.Item("CD_MERCADORIA").Value &"</td>"&_
							"<td class=erro>&nbsp;</td>"&_
							"<td class=erro>Mercadoria não encontrada no(s) volume(s)</td></tr>"
						objrsx.MoveNext
						if objrsx.Eof then exit do
					loop
				else
					if objrsx.State = adStateOpen then objrsx.Close()
					sql = "SELECT CD_VOLUME, CD_MERCADORIA, TP_ERRO_VALIDA "&_
								"FROM TRAP_PACK_LIST (NOLOCK) "&_
								"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
								"  AND TP_ERRO_VALIDA IS NOT NULL "&_
								"ORDER BY CD_MERCADORIA"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					do while not objrsx.Eof
						'exibe os fornecimentos
						if objrs.State = adStateOpen then objrs.Close()
						sql = "SELECT CD_FORNECIMENTO FROM TRAP_FORNECIMENTO (NOLOCK) "&_
									"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' "&_
									"  AND CD_MERCADORIA = '"&objrsx.Fields.Item(1).Value&"' "&_
									"GROUP BY CD_FORNECIMENTO"
						Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
						objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						vNrFornecs = ""
						do while not objrs.Eof
							vNrFornecs = vNrFornecs & objrs.Fields.Item(0).Value
							objrs.MoveNext
							if objrs.Eof then exit do else vNrFornecs = vNrFornecs &", "
						loop
						objrs.Close()
						vTxItens = vTxItens &_
							"<tr><td class=erro>"& vNrFornecs &"&nbsp;</td>"&_
							"<td class=erro>"& objrsx.Fields.Item("CD_MERCADORIA").Value &"</td>"&_
							"<td class=erro>"& objrsx.Fields.Item("CD_VOLUME").Value &"</td>"&_
							"<td class=erro>"& fncExibeTiposErro(objrsx.Fields.Item("TP_ERRO_VALIDA").Value, 1) &"</td></tr>"
						objrsx.MoveNext
						if objrsx.Eof then exit do
					loop
				end if
			end if
			vTxItens = vTxItens &"</table>"
		end if
		vTxHtml = vTxHtml & vTxItens &"</fieldset></td></tr>"
	end if
	vTxHtml = vTxHtml &"</table>"
	Response.Write(vTxHtml)
%>
			</div></td>
	</tr>
	<%
	if not vInForn or not vInPack then call subEmailErroRap(vNrRap)
else
	tx_erro = "Não foi possível recuperar dados da Instrução de embarque!\nEntre em contato com o suporte(suporte@myindaia.com.br)."
	Response.Write("<tr><td>&nbsp;</td></tr>")
end if
%>
	<tr height="15" align="center">
		<td colspan="3" bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
	</tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
