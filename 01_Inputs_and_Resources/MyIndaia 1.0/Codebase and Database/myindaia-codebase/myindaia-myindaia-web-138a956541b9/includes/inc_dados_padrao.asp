<%
'------------------------------------------------------------------
'Sistema MyIndaia - Arquivo de Configuração de Relatórios
'Arquivo de Script e HTML: Functions para criação de filtros/campos
'
'Autor: Alexandre Gonçalves Neto
'Manutenção: 18/09/2008 - Flávio  Henrique
'------------------------------------------------------------------

':::::::::::::::::::: FILTROS ::::::::::::::::::::



':::::::::::::::::::: CAMPOS  ::::::::::::::::::::
'***** Campos de texto padrão
function fncExibeTextoPadrao(nExibir, nTexto)
	'OBJETIVO: exibe campos de texto no relatório
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nTexto  - texto a ser exibido
	if fnc_TestaVar(nTexto) then nTexto = Trim(nTexto) else nTexto = "&nbsp;"
	
	select case nExibir ' alteração em teste width='10%' - tornar cabeçalho fixo (21/07/2008)
		case 0
			vReturn = "<td width='10%'><nobr>"&nTexto&"</nobr></td>"
		case 1
			vReturn = "<td class='pgridsub' width='10%'>"&nTexto&"</td>"
		case 2
			vReturn = "<td bgcolor='"& bgcolor &"' style='vertical-align:top;' width='10%'>"&nTexto&"</td>"
	end select
	
	fncExibeTextoPadrao = vReturn
end function
'***** Campos de data padrão
function fncExibeDataPadrao(nExibir, nData)
	'OBJETIVO: exibe os campos de data
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nData   - texto a ser exibida
	dim numx 'guarda os valores de data realizada e diferença de dias para o Excel
	
	if IsDate(nData) then nData = fnc_Mascara(nData, 5) else nData = "&nbsp;"
	select case nExibir
		case 0
			vReturn = "<td><nobr>"&nData&"</nobr></td>"
		case 1
			vReturn = "<td class='pgridsub'><nobr>"&nData&"</nobr></td>"
		case 2
			numx = Null
			if not IsDate(nData) then nData = 0 else nData = fnc_ConvertToExcel(nData, 3, 0)
			if nData > 0 then numx = "x:num='"&nData&"'" Else nData = ""
			vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='color:"& color &";vertical-align:middle;' "&numx&">"&nData&"</td>"
	end select
	
	fncExibeDataPadrao = vReturn
end function

Function fnc_DiasUteisKPI2(dt_inicial, dt_final, in_util)
'OBJETIVO: esta função calcula a diferenca de dias entre datas, contando somente dias uteis ou não
'PARAMETROS: dt_ini  -> data inicial/prevista
'            dt_fim  -> data final/de realização
'            in_util -> conta dias uteis(1) ou dias corridos(0)
	'RETORNA: diferença de dias
	Dim objcnn2, objcmd2
	Set objcnn2 = Server.CreateObject("ADODB.Connection")
	Set objcmd2 = Server.CreateObject("ADODB.Command")
	objcnn2.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	objcmd2.ActiveConnection = objcnn2
	Dim nr_dia  'diferença de dias
	'verifica se foi passado valor para dias uteis
	If Not fnc_TestaVar(in_util) Then in_util = "0"
	'se as datas forem validas executa calculo
	

  If IsDate(dt_inicial) and IsDate(dt_final) Then
		With objcmd2
			.CommandTimeOut = 9999
			.CommandText    = "sp_calc_dias_uteis_kpi"
			.CommandType    = adCmdStoredProc
			.Parameters.Refresh
			.Parameters("@tp_dia") = in_util
			.Parameters("@dt_ini") = dt_inicial
			.Parameters("@dt_fim") = dt_final
			.Execute , , adExecuteNoRecords
			nr_dia = .Parameters("@nr_dia")
		End With
	Else
		nr_dia = Null
	End If
	

	'Response.write nr_dia & "<br>"
	'Response.end

	fnc_DiasUteisKPI2 = nr_dia
End Function

'***** Campos de data dos eventos do followup
function fncExibeDataEventoFup(nExibir, nInData, nDataPrev, nDataReal)
	'OBJETIVO: exibe os campos de data(eventos) com kpi no relatório
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nInData - verifica se o evento é aplicavel
	'        nDataPrev, nDataReal - data a ser exibida
	
	dim vNrKPI : vNrKPI = "-"
	dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	
	if not fnc_TestaVar(nInData) or (nInData = 0) then
		nDataPrev = "-" 'data prevista
		'Response.Redirect("../IMPORT/teste.asp?var1="&Session("cd_cargo")&"")
        If	Session("cd_cargo")<>088 then
		    nDataReal = "Não Aplicável" 'data realizada
	    Else
		    nDataReal = "Not applicable" 'data realizada
		End If
		color     = "#999999"   'cor da fonte
	else
		if IsDate(nDataPrev) then
			if IsDate(nDataReal) then
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, nDataReal, "0") 
			else
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, Date(), "0")
			end if
			'muda a cor do lead-time conforme o resultado
			color = "#000000"
		end if
	end if
	
	select case nExibir
		case 0
			vReturn = "<td><nobr><font color='"&color&"'>"&nDataReal&"&nbsp;</font></nobr></td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				vReturn = "<td><nobr>"&fnc_Mascara(nDataPrev, 5)&"&nbsp;</nobr></td>"&_
									"<td align='center'><nobr><font color='"&color&"'>"&vNrKPI&"</font></nobr></td>"&vReturn
			end if
		case 1
			vReturn = "<td class='pgridsub'><nobr><font color='"&color&"'>"&nDataReal&"&nbsp;</font></nobr></td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				vReturn = "<td class='pgridsub'><nobr>"&nDataPrev&"&nbsp;</nobr></td>"&_
									"<td class='pgridsub' align='center'><nobr><font color='"&color&"'>"&vNrKPI&"</font></nobr></td>"&vReturn
			end if
		case 2
			numx = Null
			numy = Null
			numz = Null
			if not IsDate(nDataReal) then nDataReal = 0 else nDataReal = fnc_ConvertToExcel(nDataReal, 3, 0)
			if nDataReal > 0 then numy = "x:num='"&nDataReal&"'" Else nDataReal = ""
			if not fnc_TestaVar(nInData) or (nInData = 0) then nDataReal = "n/a"
			vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='color:"& color &";vertical-align:middle;' "&numy&">"&nDataReal&"</td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				if not IsDate(nDataPrev) then nDataPrev = 0 else nDataPrev = fnc_ConvertToExcel(nDataPrev, 3, 0)
				if nDataPrev > 0 then numx = "x:num='"&nDataPrev&"'" else nDataPrev = ""
				if IsNumeric(vNrKPI) then numz = "x:num='"&vNrKPI&"'" else vNrKPI = "-"
				vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='vertical-align:middle;' "&numx&">"&nDataPrev&"</td>"&_
									"<td bgcolor='"&bgcolor&"' class='inteiro' style='color:"& color &";vertical-align:middle;' "&numz&">"&vNrKPI&"</td>"&vReturn
			end if
        case 3
			if not IsDate(nDataReal) then nDataReal = 0 else nDataReal = nDataReal
            if not nDataReal > 0 then nDataReal = ""
			if not fnc_TestaVar(nInData) or (nInData = 0) then nDataReal = "n/a"
			vReturn = "<td bgcolor='"&bgcolor&"' class='texto' style='color:"& color &";vertical-align:middle;'>"&nDataReal&"</td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				if not IsDate(nDataPrev) then nDataPrev = 0 else nDataPrev = nDataPrev
				if IsNumeric(vNrKPI) then numz = "x:num='"&vNrKPI&"'" else vNrKPI = "-"
				vReturn = "<td bgcolor='"&bgcolor&"' class='texto' style='vertical-align:middle;'>"&nDataPrev&"</td>"&_
									"<td bgcolor='"&bgcolor&"' class='inteiro' style='color:"& color &";vertical-align:middle;' "&numz&">"&vNrKPI&"</td>"&vReturn
			end if
	end select
	
	fncExibeDataEventoFup = vReturn
end function

function fncExibeDataEventoFupAlerta(nExibir, nInData, nDataPrev, nDataReal, nValidaData)
	'OBJETIVO: exibe os campos de data(eventos) com kpi no relatório
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nInData - verifica se o evento é aplicavel
	'        nDataPrev, nDataReal - data a ser exibida
	
	dim vNrKPI : vNrKPI = "-"
	dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	
	if not fnc_TestaVar(nInData) or (nInData = 0) then
		nDataPrev = "-" 'data prevista
		'Response.Redirect("../IMPORT/teste.asp?var1="&Session("cd_cargo")&"")
        If	Session("cd_cargo")<>088 then
		    nDataReal = "Não Aplicável" 'data realizada
	    Else
		    nDataReal = "Not applicable" 'data realizada
		End If
		color     = "#999999"   'cor da fonte
	else
		if IsDate(nDataPrev) then
			if IsDate(nDataReal) then
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, nDataReal, "0") 
			else
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, Date(), "0")
			end if
			'muda a cor do lead-time conforme o resultado
			color = "#000000"
		end if
	end if
	
	select case nExibir
		case 2
			numx = Null
			numy = Null
			numz = Null
			if not IsDate(nDataReal) then nDataReal = 0 else nDataReal = fnc_ConvertToExcel(nDataReal, 3, 0)
			if nDataReal > 0 then numy = "x:num='"&nDataReal&"'" Else nDataReal = ""
			if not fnc_TestaVar(nInData) or (nInData = 0) then nDataReal = "n/a"
            if nValidaData = 0 then 
			  vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='color:"& color &";vertical-align:middle;' "&numy&">"&nDataReal&"</td>"
            Else
              vReturn = "<td bgcolor='#ffcc99' class='data' style='color:"& color &";vertical-align:middle;' "&numy&">"&nDataReal&"</td>"
            End If
			'verifica se exibe a data prevista
			if in_dt_prev then
				if not IsDate(nDataPrev) then nDataPrev = 0 else nDataPrev = fnc_ConvertToExcel(nDataPrev, 3, 0)
				if nDataPrev > 0 then numx = "x:num='"&nDataPrev&"'" else nDataPrev = ""
				if IsNumeric(vNrKPI) then numz = "x:num='"&vNrKPI&"'" else vNrKPI = "-"
				vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='vertical-align:middle;' "&numx&">"&nDataPrev&"</td>"&_
									"<td bgcolor='"&bgcolor&"' class='inteiro' style='color:"& color &";vertical-align:middle;' "&numz&">"&vNrKPI&"</td>"&vReturn
			end if
         case 3
			if not IsDate(nDataReal) then nDataReal = 0 else nDataReal = nDataReal
            if not nDataReal > 0 then nDataReal = ""
			if not fnc_TestaVar(nInData) or (nInData = 0) then nDataReal = "n/a"
			vReturn = "<td bgcolor='"&bgcolor&"' class='texto' style='color:"& color &";vertical-align:middle;'>"&nDataReal&"</td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				if not IsDate(nDataPrev) then nDataPrev = 0 else nDataPrev = nDataPrev
				if IsNumeric(vNrKPI) then numz = "x:num='"&vNrKPI&"'" else vNrKPI = "-"
				vReturn = "<td bgcolor='"&bgcolor&"' class='texto' style='vertical-align:middle;'>"&nDataPrev&"</td>"&_
									"<td bgcolor='"&bgcolor&"' class='inteiro' style='color:"& color &";vertical-align:middle;' "&numz&">"&vNrKPI&"</td>"&vReturn
			end if
	end select
	
	fncExibeDataEventoFupAlerta = vReturn
end function

function fncExibeDataEventoFupMarcador(nExibir, nInData, nDataPrev, nDataReal, nProcesso, nEvento)
	'OBJETIVO: exibe os campos de data(eventos) com kpi no relatório
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nInData - verifica se o evento é aplicavel
	'        nDataPrev, nDataReal - data a ser exibida
	
	dim vNrKPI : vNrKPI = "-"
	dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	
	if not fnc_TestaVar(nInData) or (nInData = 0) then
		nDataPrev = "-" 'data prevista
		'Response.Redirect("../IMPORT/teste.asp?var1="&Session("cd_cargo")&"")
        If	Session("cd_cargo")<>088 then
		    nDataReal = "Não Aplicável" 'data realizada
	    Else
		    nDataReal = "Not applicable" 'data realizada
		End If
		color     = "#999999"   'cor da fonte
	else
		if IsDate(nDataPrev) then
			if IsDate(nDataReal) then
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, nDataReal, "0") 
			else
				vNrKPI = fnc_DiasUteisKPI2(nDataPrev, Date(), "0")
			end if
			'muda a cor do lead-time conforme o resultado
			color = "#000000"
		end if
	end if
	
	select case nExibir
		case 0
            if fnc_TestaVar(nDataReal) Then
                vReturn = "<td><nobr><font color='"&color&"'>"&nDataReal&"&nbsp;</font></nobr></td>"
            Else
                if objrsx.State = adStateOpen then objrsx.Close()
	            sql = "SELECT COUNT(*) AS CONTADOR FROM TALERTA_MONITORAMENTO WHERE NR_PROCESSO = '" & nProcesso & "' AND CD_EVENTO = '" & nEvento & "' AND DT_ENVIO IS NULL"
	            objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

			    vReturn = "<td><nobr><font color='"&color&"'>"&nDataReal&"&nbsp;</font>&nbsp;&nbsp;<img alt='Monitorar Evento' src='/imagens/30/marcador"
                if objrsx("CONTADOR") = 0 Then
                    vReturn = vReturn & "_d"
                End If
                vReturn = vReturn & ".gif' border='0' name='marcadorEvento" & nEvento & "' onclick=""alteraMarcador(this,'" & nProcesso & "', '" & nEvento & "', '" & Session("cd_usuario")& "');"" style='cursor:pointer;'></nobr></td>"
            End If
			'verifica se exibe a data prevista
			if in_dt_prev then
                If InStr("620;621;314", nEvento) Then
                  vReturn = "<td><nobr>"&nDataPrev&"&nbsp;</nobr></td>"&_
									"<td align='center'><nobr><font color='"&color&"'>"&vNrKPI&"</font></nobr></td>"&vReturn                        
                Else
				  vReturn = "<td><nobr>"&fnc_Mascara(nDataPrev, 5)&"&nbsp;</nobr></td>"&_
									"<td align='center'><nobr><font color='"&color&"'>"&vNrKPI&"</font></nobr></td>"&vReturn        
                End if
			end if
		case 1
			vReturn = "<td class='pgridsub'><nobr><font color='"&color&"'>"&nDataReal&"&nbsp;</font></nobr></td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				vReturn = "<td class='pgridsub'><nobr>"&nDataPrev&"&nbsp;</nobr></td>"&_
									"<td class='pgridsub' align='center'><nobr><font color='"&color&"'>"&vNrKPI&"</font></nobr></td>"&vReturn
			end if
		case 2
			numx = Null
			numy = Null
			numz = Null
			if not IsDate(nDataReal) then nDataReal = 0 else nDataReal = fnc_ConvertToExcel(nDataReal, 3, 0)
			if nDataReal > 0 then numy = "x:num='"&nDataReal&"'" Else nDataReal = ""
			if not fnc_TestaVar(nInData) or (nInData = 0) then nDataReal = "n/a"
			vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='color:"& color &";vertical-align:middle;' "&numy&">"&nDataReal&"</td>"
			'verifica se exibe a data prevista
			if in_dt_prev then
				if not IsDate(nDataPrev) then nDataPrev = 0 else nDataPrev = fnc_ConvertToExcel(nDataPrev, 3, 0)
				if nDataPrev > 0 then numx = "x:num='"&nDataPrev&"'" else nDataPrev = ""
				if IsNumeric(vNrKPI) then numz = "x:num='"&vNrKPI&"'" else vNrKPI = "-"
				vReturn = "<td bgcolor='"&bgcolor&"' class='data' style='vertical-align:middle;' "&numx&">"&nDataPrev&"</td>"&_
									"<td bgcolor='"&bgcolor&"' class='inteiro' style='color:"& color &";vertical-align:middle;' "&numz&">"&vNrKPI&"</td>"&vReturn
			end if
	end select
	
	fncExibeDataEventoFupMarcador = vReturn
end function
'***** Campos de numero padrão
function fncExibeNumeroPadrao(nExibir, nNumero, nDecimal)
	'OBJETIVO: exibe os campos de numero
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nNumero - numero a ser exibido
	'        nDecimal - numero de casas decimais a serem exibidas
    if nNumero <> "" Then
	if IsNumeric(Replace(nNumero,",",".")) then nNumero = FormatNumber(nNumero, nDecimal) else nNumero = ""
    End if
    						
	select case nExibir
		case 0
			vReturn = "<td align='right'><nobr>"&nNumero&"&nbsp;</nobr></td>"
		case 1
			vReturn = "<td align='right' class='pgridsub'>"&nNumero&"&nbsp;</td>"
		case 2
			vReturn = "<td bgcolor='"& bgcolor &"' class='decimal2' x:num='"& fnc_ConvertToExcel(nNumero, 1, nDecimal) &"'></td>"
	end select
	
	fncExibeNumeroPadrao = vReturn
end function
'***** Campos memo padrão
function fncExibeMemoPadrao(nExibir, nMemo)
	'OBJETIVO: exibe campos de texto no relatório
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nTexto  - texto a ser exibido
	if fnc_TestaVar(nMemo) then nMemo = Trim(nMemo) else nMemo = "&nbsp;"
	
	select case nExibir
		case 0
			vReturn = "<td title='"&nMemo&"'><nobr>"&Left(nMemo, 40)&"</nobr></td>"
		case 1
			vReturn = "<td class='pgridsub'>"&Replace(nMemo, vbcrlf, "<br>")&"</td>"
		case 2
			vReturn = "<td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"&nMemo&"</td>"
	end select
	
	fncExibeMemoPadrao = vReturn
end function

'***** M10_CD_DADO = 0015
function fncExibeTipoContr(nExibir, nTipo)
	'OBJETIVO: definir o tipo do container cadastrado no processo
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nTipo   - tipo do container
	if not fnc_TestaVar(nTipo) then nTipo = "&nbsp;" else nTipo = tipo_cntr(CInt(nTipo)-1)
	
	select case nExibir
		case 0
			vReturn = "<td align='center'><nobr>"&nTipo&"</nobr></td>"
		case 1
			vReturn = "<td align='center' class='pgridsub'>"&nTipo&"</td>"
		case 2
			vReturn = "<td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"&nTipo&"</td>"
	end select

	fncExibeTipoContr = vReturn
end function

'***** M10_CD_DADO = 0017
Function fncExibeCanal(nExibir, nCanal)
	'OBJETIVO: Define o canal registrado para o processo
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nCanal  - tipo do canal
	If Not fnc_TestaVar(nCanal) Then nCanal = 4

	Select Case nExibir
		Case 0
			If Mid(nr_processo, 5, 2) = "01" Then
				vReturn = "<td align='center'><a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat &"');"">"&_
									"<img src='/imagens/30/tp_canal_"&Trim(nCanal)&".gif' width=17 height=16 border=0></a></td>"
			Else
				vReturn = "<td align='center'><img src='/imagens/30/tp_canal_"&Trim(nCanal)&".gif' width=17 height=16 border=0></td>"
			End If
		Case 1
			vReturn = "<td align='center' class='pgridsub'><img src='/imagens/30/tp_canal_"&Trim(nCanal)&".gif' width=17 height=16></td>"
		Case 2
			vReturn = "<td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"& tipo_canal(nCanal) &"</td>"
	End Select
	
	fncExibeCanal = vReturn
End Function

'***** M10_CD_DADO = 0066
function fncExibeFrete(nExibir, nFrete)
	'OBJETIVO: Exibe sim/não para para os campos booleanos
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nFrete  - collect/prepaid (0,1)
	If fnc_TestaVar(nFrete) Then nFrete = tipo_frete(CInt(nFrete)) Else nFrete = "n/d"
	
	select case nExibir
		case 0
			vReturn = "<td align='center'><nobr>"&nFrete&"</nobr></td>"
		case 1
			vReturn = "<td align='center' class='pgridsub'>"&nFrete&"</td>"
		case 2
			vReturn = "<td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"&nFrete&"</td>"
	end select
	
	fncExibeFrete = vReturn
end function

'***** M10_CD_DADO = 0103
function fncExibeSimNao(nExibir, nBool)
	'OBJETIVO: Exibe sim/não para para os campos booleanos
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nBool   - verdadeiro/false (1;0)
	if not fnc_TestaVar(nBool) then nBool = 0
	
	select case nExibir
		case 0
			vReturn = "<td align='center'><nobr>"&sim_nao(nBool)&"</nobr></td>"
		case 1
			vReturn = "<td align='center' class='pgridsub'>"&sim_nao(nBool)&"</td>"
		case 2
			vReturn = "<td align='center' bgcolor='"& bgcolor &"' style='vertical-align:middle;'>"&sim_nao(nBool)&"</td>"
	end select
	
	fncExibeSimNao = vReturn
end function

'***** M10_CD_DADO = 0118, 0123, 0131
function fncExibeTabelaExp(nExibir, nCodigo, tpProduto)
	'OBJETIVO: Exibe sim/não para para os campos booleanos
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nCodigo - verifica qual o campo que será exibido
	dim aCampos()
	
	if objrsx.State = adStateOpen then objrsx.Close()
	select case nCodigo
		case "0118" 'Nr. Nota Fiscal
			redim aCampos(4)
			aCampos(0) = ""
			aCampos(1) = ""
			aCampos(2) = ""
			aCampos(3) = ""
			
			sql = "SELECT NR_NF, DT_NOTA, ISNULL(VL_NOTA, ''), ISNULL(CHAVE_NOTA, '') "&_
						"FROM BROKER.DBO.TPROCESSO_EXP_NF ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY NR_NF"		
						
		case "0123" 'Nr. RE
			redim aCampos(0)
			aCampos(0) = ""			
			sql = "SELECT IN_DSE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO  = '" & nr_processo & "'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText			
			
			If objrsx.Fields.Item("IN_DSE") = "1" Then
				aCampos(0) = "<font color='#999999'>Não Aplicável</font>"
			End If

			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_RE "&_
							"FROM TPROCESSO_EXP_RE ( NOLOCK ) "&_
							"WHERE NR_PROCESSO = '"& nr_processo &"' AND ISNULL(NR_RE, '') <> ''  "&_
				" UNION " &_
							" SELECT LTRIM(RTRIM(NR_RE))+LTRIM(RTRIM(NR_ANEXO_FIM)) AS NR_RE " &_
				" FROM TPROCESSO_EXP_DDE_RE ( NOLOCK ) " &_
							"WHERE NR_PROCESSO = '"& nr_processo &"' AND ISNULL(NR_RE, '') <> ''  "&_
							"  AND LTRIM(RTRIM(NR_RE))+LTRIM(RTRIM(NR_ANEXO_FIM)) NOT IN (SELECT NR_RE" &_
				"                     FROM TPROCESSO_EXP_RE ( NOLOCK ) " &_
							"                    WHERE NR_PROCESSO = '"& nr_processo &"' AND ISNULL(NR_RE, '') <> '' ) " &_
							"ORDER BY NR_RE"		 
		case "0131" 'Nr. Doc. Instrução
			redim aCampos(0)
			aCampos(0) = ""
			sql = "SELECT NR_DCTO_INSTRUCAO "&_
						"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"  AND NR_DCTO_INSTRUCAO <> '' "&_
						"ORDER BY NR_DCTO_INSTRUCAO"
						
						
						
			
						
						
						
						
	end select
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
	'monta os resultados
	if objrsx.RecordCount > 0 then
		do while not objrsx.Eof
			select case nCodigo
				case "0118"
					aCampos(0) = aCampos(0) & objrsx.Fields.Item(0).Value 'nr. NF
					aCampos(1) = aCampos(1) & fnc_Mascara(objrsx.Fields.Item(1).Value, 5) 'dt. emissao NF
					aCampos(2) = aCampos(2) & FormatNumber(objrsx.Fields.Item(2).Value, 2) 'valor da NF
					aCampos(3) = aCampos(3) & objrsx.Fields.Item(3).Value 'nr. chave NF
					
				case "0123"
					aCampos(0) = aCampos(0) & fnc_mascara(objrsx.Fields.Item(0).Value, 2)
				case "0131"
					aCampos(0) = aCampos(0) & objrsx.Fields.Item(0).Value
			end select
			objrsx.MoveNext
			if objrsx.Eof then
				exit do
			else
				for x = 0 to UBound(aCampos)
					aCampos(x) = aCampos(x) &"<br>"
				next
			end if
		loop
	end if
	if objrsx.State = adStateOpen then objrsx.Close()
	'monta a exibição
	select case nExibir
		case 0
			select case nCodigo
				case "0118"
					vReturn = "<td><nobr>"&aCampos(0)&"</nobr></td>"&_
							  "<td><nobr>"&aCampos(1)&"</nobr></td>"&_
							  "<td align='right'><nobr>"&aCampos(2)&"</nobr></td>"&_
							  "<td><nobr>"&aCampos(3)&"</nobr></td>"
										
				case "0123"
					vReturn = "<td><nobr>"&aCampos(0)& tpProduto & "</nobr></td>"
				case "0131"
					vReturn = "<td><nobr>"&aCampos(0)&"</nobr></td>"
			end select
		case 1
			select case nCodigo
				case "0118"
					vReturn = "<td class='pgridsub'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"&_
										"<td class='pgridsub'><nobr>"&aCampos(1)&"&nbsp;</nobr></td>"&_
										"<td class='pgridsub' align='right'><nobr>&nbsp;"&aCampos(2)&"</nobr></td>"&_
										"<td class='pgridsub'><nobr>"&aCampos(3)&"&nbsp;</nobr></td>"
										
				case "0123"
					vReturn = "<td class='pgridsub'><nobr>"&aCampos(0)& tpProduto &"&nbsp;</nobr></td>"
				case "0131"
					vReturn = "<td class='pgridsub'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"
			end select
		case 2
			select case nCodigo
				case "0118"
					vReturn = "<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"&_
										"<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(1)&"&nbsp;</nobr></td>"&_
										"<td align='right' bgcolor='"& bgcolor &"'><nobr>&nbsp;"&aCampos(2)&"</nobr></td>"&_
										"<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(3)&"&nbsp;</nobr></td>"
										
				case "0123"
					vReturn = "<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(0)& tpProduto &"&nbsp;</nobr></td>"
				case"0131"
					vReturn = "<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"
			end select
	end select
	
	fncExibeTabelaExp = vReturn
end function

function fncExibeTabelaNf(nExibir, nCodigo, tpProduto)
	'OBJETIVO: Exibe sim/não para para os campos booleanos
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nCodigo - verifica qual o campo que será exibido
	dim aCampos()
	
	if objrsx.State = adStateOpen then objrsx.Close()
	select case nCodigo
		case "0118" 'Nr. Nota Fiscal
			redim aCampos(4)
			aCampos(0) = ""
			aCampos(1) = ""
			aCampos(2) = ""
			aCampos(3) = ""
			            sql = "SELECT NR_NOTA, DT_NOTA, ISNULL(VL_NOTA, ''), '' "&_
						"FROM TPROCESSO_NF ( NOLOCK ) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY NR_NOTA"
	end select
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'monta os resultados
	if objrsx.RecordCount > 0 then
		do while not objrsx.Eof
			select case nCodigo
				case "0118"
					aCampos(0) = aCampos(0) & objrsx.Fields.Item(0).Value 'nr. NF
					aCampos(1) = aCampos(1) & fnc_Mascara(objrsx.Fields.Item(1).Value, 5) 'dt. emissao NF
					aCampos(2) = aCampos(2) & FormatNumber(objrsx.Fields.Item(2).Value, 2) 'valor da NF
					aCampos(3) = aCampos(3) & objrsx.Fields.Item(3).Value 'nr. chave NF
					end select
			objrsx.MoveNext
			if objrsx.Eof then
				exit do
			else
				for x = 0 to UBound(aCampos)
					aCampos(x) = aCampos(x) &"<br>"
				next
			end if
		loop
	end if
	if objrsx.State = adStateOpen then objrsx.Close()
	'monta a exibição
	select case nExibir
		case 0
			select case nCodigo
				case "0118"
					vReturn = "<td><nobr>"&aCampos(0)&"</nobr></td>"&_
										"<td><nobr>"&aCampos(1)&"</nobr></td>"&_
										"<td align='right'><nobr>"&aCampos(2)&"</nobr></td>"&_
										"<td><nobr>"&aCampos(3)&"</nobr></td>"
										
										
			end select
		case 1
			select case nCodigo
				case "0118"
					vReturn = "<td class='pgridsub'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"&_
										"<td class='pgridsub'><nobr>"&aCampos(1)&"&nbsp;</nobr></td>"&_
										"<td class='pgridsub' align='right'><nobr>&nbsp;"&aCampos(2)&"</nobr></td>"&_
										"<td class='pgridsub'><nobr>"&aCampos(3)&"&nbsp;</nobr></td>"
										
			end select
		case 2
			select case nCodigo
				case "0118"
					vReturn = "<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(0)&"&nbsp;</nobr></td>"&_
										"<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(1)&"&nbsp;</nobr></td>"&_
										"<td align='right' bgcolor='"& bgcolor &"'><nobr>&nbsp;"&aCampos(2)&"</nobr></td>"&_
										"<td bgcolor='"& bgcolor &"'><nobr>"&aCampos(3)&"&nbsp;</nobr></td>"
										
			end select
	end select	
	fncExibeTabelaNf = vReturn
end function



'***** M10_CD_DADO = 0126, 0133
function fncImpExp(nExibir, nTexto, nProduto)
	'OBJETIVO: exibir o importador de acordo com o produto
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nTexto - texto que será exibido
	'        nProduto - dependendo do produto poderá ocorrer uma consulta na tabela
	if nProduto = "01" or nProduto = "03" then
		if not fnc_TestaVar(nTexto) then
			nTexto = ""
			if objrsx.State = adStateOpen then objrsx.Close
			sql = "SELECT E.NM_EMPRESA FROM TDETALHE_MERCADORIA DM (NOLOCK) "&_
						"  INNER JOIN TEMPRESA_EST E (NOLOCK) ON (E.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
						"WHERE DM.NR_PROCESSO = '"&nr_processo&"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			if objrsx.RecordCount > 0 then
				do while not objrsx.Eof
					nTexto = nTexto & objrsx.Fields.Item("NM_EMPRESA").Value
					if objrsx.Eof then exit do else nTexto = nTexto &";"
				loop
			end if
			objrsx.Close
		end if
	end if
	if nProduto = "02" or nProduto = "10" then
		if not fnc_TestaVar(nTexto) then
			nTexto = ""
			if objrsx.State = adStateOpen then objrsx.Close
			sql = "SELECT E.NM_EMPRESA FROM TPROCESSO_EXP P (NOLOCK) "&_
						"  INNER JOIN TEMPRESA_EST E (NOLOCK) ON (E.CD_EMPRESA = P.CD_IMPORTADOR) "&_
						"WHERE P.NR_PROCESSO = '"&nr_processo&"'"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			if objrsx.RecordCount > 0 then
				nTexto = "<nobr>"& objrsx.Fields.Item("NM_EMPRESA").Value &"</nobr>"
			end if
			objrsx.Close
		end if
	end if
	
	select case nExibir
		case 0
			if InStr(nTexto, ";") = 0 then nTexto = "<nobr>"& nTexto &"</nobr>"
			vReturn = "<td>"&Replace(nTexto, ";", "<br>")&"</td>"
		case 1
			vReturn = "<td class='pgridsub'>"&Replace(nTexto, ";", "<br>")&"</td>"
		case 2
			vReturn = "<td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"&Replace(nTexto, ";", vbcrlf)&"</td>"
	end select
	
	fncImpExp = vReturn
end function

'***** M10_CD_DADO = 0289
function fncTipoPedido(nExibir)
	'OBJETIVO: exibir o tipo de pedido de importação
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	
	fncTipoPedido = vReturn
end function

'***** M10_CD_DADO = 0499
function fncQtdeProdutosExp(nExibir)
	'OBJETIVO: exibir a qtde de produtos do processo de exportação
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	dim vText
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT ISNULL(QT_MERCADORIA, 0) AS QT_MERCADORIA, ISNULL(RTRIM(UM.NM_UNID_MEDIDA), '') AS NM_UNID_MEDIDA "&_
				"FROM TPROCESSO_EXP_ITEM PEI (NOLOCK) "&_
				"  LEFT JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = PEI.CD_UNID_MEDIDA) "&_
				"WHERE PEI.NR_PROCESSO = '"& Trim(objrs.Fields.Item("NR_PROCESSO").Value) &"' "
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText = "&nbsp;"
	if objrsx.RecordCount > 0 then
		do while not objrsx.Eof
			vText = vText&"<nobr>"&FormatNumber(objrsx.Fields.Item("QT_MERCADORIA").Value) &" "& objrsx.Fields.Item("NM_UNID_MEDIDA").Value&"<nobr>"
			objrsx.MoveNext
			if objrsx.Eof then exit do else vText = vText&"<br>&nbsp;"
		loop
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right'>&nbsp;"& vText &"</td>"
		case 1
			vReturn = "<td align='right' class='pgridsub'>"& vText &"</td>"
		case 2
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vText &"</td>"
	end select
	objrsx.Close()
	fncQtdeProdutosExp = vReturn
end function

'***** M10_CD_DADO = 0304, 0545
function fncQtdeMercDIxPO(nExibir, nCodigo)
	'OBJETIVO: Calculo da Qtde Inicial de Pedido
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nCodigo - busca por por qtde da DI ou PO
	dim vText, vTitle
	
	if objrsx.State = adStateOpen then objrsx.Close()
	if nCodigo = "0304" then 'qtde de mercadoria embarcada - DI
		sql = "SELECT ISNULL(SUM(DM.QT_MERC_UN_COMERC), 0) AS QT_INICIAL, ISNULL(RTRIM(UM.NM_UNID_MEDIDA), '') AS NM_UNID_MEDIDA "&_
					"FROM TDETALHE_MERCADORIA DM (NOLOCK) "&_
					"  LEFT JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) "&_
					"  WHERE DM.NR_PROCESSO = '"& Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value) &"' "
					If tp_relat <> 0 Then 'desembaraço
					sql = sql &	"  AND DM.NR_PROC_PO = '"& Trim(objrs.Fields.Item("NR_REFERENCIA").Value) &"' "&_
						        "  AND DM.NR_ITEM_PO = '"& Trim(objrs.Fields.Item("NR_ITEM_CLIENTE").Value) &"' "&_
						        "  AND DM.NR_PARCIAL = '"& Trim(objrs.Fields.Item("NR_PARCIAL").Value) &"' "
					End If	
                     sql = sql & "  GROUP BY UM.NM_UNID_MEDIDA"
	end if
	
	if nCodigo = "0545" then 'qtde de mercadoria inicial - PO
		if tp_relat = 0 then 'desembaraço
			sql = "SELECT ISNULL(SUM(I.QT_INICIAL), 0) AS QT_INICIAL, ISNULL(RTRIM(UM.NM_UNID_MEDIDA), '') AS NM_UNID_MEDIDA "&_ 
						"FROM TREF_CLIENTE RC (NOLOCK) "&_
						"  INNER JOIN TPO_ITEM I (NOLOCK) ON (I.NR_PROCESSO = RC.CD_REFERENCIA AND I.NR_ITEM_CLIENTE = RC.NR_ITEM_PO AND I.NR_PARCIAL = RC.NR_PARCIAL AND I.CD_EMPRESA = RC.CD_EMPRESA) "&_
						"  LEFT JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA) "&_
						"WHERE RC.NR_PROCESSO = '"& Trim( objrs.Fields.Item("NR_PROCESSO_DES").Value ) &"' "&_
						"GROUP BY UM.NM_UNID_MEDIDA"
		else 'pedido e adm
			sql = " SELECT ISNULL(I.QT_INICIAL,0) AS QT_INICIAL, ISNULL(RTRIM(UM.NM_UNID_MEDIDA), '') AS NM_UNID_MEDIDA  "&_
				" FROM TPO_ITEM I (NOLOCK) "&_
				" LEFT JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA) "&_
				" WHERE I.NR_PROCESSO     = '"& Trim( objrs.Fields.Item("NR_REFERENCIA").Value   ) &"' "&_
				" AND I.NR_ITEM_CLIENTE = '"& Trim( objrs.Fields.Item("NR_ITEM_CLIENTE").Value ) &"' "&_
				" AND I.NR_PARCIAL = '"& Trim( objrs.Fields.Item("NR_PARCIAL").Value ) &"' "&_
                " AND I.CD_EMPRESA = '" & Trim( objrs.Fields.Item("CD_CLIENTE").Value ) &"' "
				'Response.Redirect("../IMPORT/teste.asp?var1="&sql&"")

						
'			sql = "SELECT ISNULL(SUM(I.QT_INICIAL), 0) AS QT_INICIAL, ISNULL(RTRIM(UM.NM_UNID_MEDIDA), '') AS NM_UNID_MEDIDA "&_
'						"FROM TPO_ITEM I (NOLOCK) "&_
'						"  LEFT JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = I.CD_UNID_MEDIDA) "&_
'						"WHERE I.NR_PROCESSO     = '"& Trim( objrs.Fields.Item("NR_REFERENCIA").Value   ) &"' "&_
'						"  AND I.NR_ITEM_CLIENTE = '"& Trim( objrs.Fields.Item("NR_ITEM_CLIENTE").Value ) &"' "&_
'						"GROUP BY UM.NM_UNID_MEDIDA"	
		end if
        'rESPONSE.Write sql
        'Response.end
	end if
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText  = ""
	vTitle = ""
	if objrsx.RecordCount > 0 then
		if (objrsx.RecordCount > 1) and (tp_relat = 0) then
			vText = FormatNumber(objrsx.Fields.Item("QT_INICIAL").Value) &"..."
			do while not objrsx.Eof
				vTitle = vTitle & FormatNumber(objrsx.Fields.Item("QT_INICIAL").Value,3)
				objrsx.MoveNext
				if objrsx.Eof then exit do else vTitle = vTitle & vbcrlf
			loop
		else
			vText = FormatNumber(objrsx.Fields.Item("QT_INICIAL").Value,3)
			vTitle = vText
		end if
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right' title='"& vTitle &"'><nobr>&nbsp;"& vText &"&nbsp;</nobr></td>"
		case 1
			if fnc_TestaVar(vTitle) then vTitle = Replace(vTitle, vbcrlf, "&nbsp;</nobr><br><nobr>")
			vReturn = "<td align='right' class='pgridsub'><nobr>"& vTitle &"&nbsp;</nobr></td>"
		case 2
			if fnc_TestaVar(vTitle) then vTitle = Replace(vTitle, vbcrlf, "&nbsp;</nobr><br><nobr>")
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vTitle &"</td>"
	end select
	objrsx.Close()
	
	fncQtdeMercDIxPO = vReturn
End function

'***** M10_CD_DADO = 548
function fncExibeRap(nExibir, nCodigo)
	'OBJETIVO: Calculo da Qtde Inicial de Pedido
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	'        nCodigo - busca por por qtde da DI ou PO
	dim vText, vTitle
	
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT CD_RAP+'/'+CD_RAP_ANO AS NR_RAP FROM TRAP (NOLOCK) WHERE NR_PROCESSO = '"&nCodigo&"'"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText  = ""
	vTitle = ""
	if objrsx.RecordCount > 0 then
		if objrsx.RecordCount > 1 then
			vText = objrsx.Fields.Item("NR_RAP").Value &"..."
			do while not objrsx.Eof
				vTitle = vTitle & objrsx.Fields.Item("NR_RAP").Value
				objrsx.MoveNext
				if objrsx.Eof then exit do else vTitle = vTitle & vbcrlf
			loop
		else
			vText = objrsx.Fields.Item("NR_RAP").Value
			vTitle = vText
		end if
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right' title='"& vTitle &"'><nobr>&nbsp;"& vText &"&nbsp;</nobr></td>"
		case 1
			if fnc_TestaVar(vTitle) then vTitle = Replace(vTitle, vbcrlf, "&nbsp;</nobr><br><nobr>")
			vReturn = "<td align='right' class='pgridsub'><nobr>"& vTitle &"&nbsp;</nobr></td>"
		case 2
			if fnc_TestaVar(vTitle) then vTitle = Replace(vTitle, vbcrlf, "&nbsp;</nobr><br><nobr>")
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vTitle &"</td>"
	end select
	objrsx.Close()
	fncExibeRap = vReturn
end function

'***** M10_CD_DADO = 0577
function fncQtdeFaturasExp(nExibir)
	'OBJETIVO: exibir a qtde de produtos do processo de exportação
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	dim vText
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT CASE COUNT(*) WHEN 0 THEN 1 ELSE COUNT(*) END AS QT_FATURA "&_
				"FROM TPROCESSO_EXP_PEDIDO PEP (NOLOCK) "&_
				"WHERE PEP.NR_PROCESSO = '"& Trim(objrs.Fields.Item("NR_PROCESSO").Value) &"' "
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText = "&nbsp;"
	if objrsx.RecordCount > 0 then
			vText = "<nobr>"& objrsx.Fields.Item("QT_FATURA").Value &" <nobr>"
'  else
'			vText = "<nobr> 1 <nobr>"	
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right'>&nbsp;"& vText &"</td>"
		case 1
			vReturn = "<td align='right' class='pgridsub'>"& vText &"</td>"
		case 2
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vText &"</td>"
	end select
	objrsx.Close()
	fncQtdeFaturasExp = vReturn
end function

'***** M10_CD_DADO = 0581
function fncExibeTxMle(nExibir)
	'OBJETIVO: exibir a qtde de produtos do processo de exportação
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	dim vText
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT DISTINCT ISNULL(TX_MLE, 0) as TX_MLE "&_
				"FROM TADICAO_DE_IMPORTACAO (NOLOCK) "&_
				"WHERE NR_PROCESSO = '"& nr_processo &"' "
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText = "&nbsp;"
  if objrsx.RecordCount = 1 then
	  vText = "<nobr>"& FormatNumber(objrsx.Fields.Item("TX_MLE").Value, 5)&"</nobr>"
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right'>&nbsp;"& vText &"</td>"
		case 1
			vReturn = "<td align='right' class='pgridsub'>"& vText &"</td>"
		case 2
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vText &"</td>"
	end select
	objrsx.Close()
	fncExibeTxMle = vReturn
end function

'***** M10_CD_DADO = 0499
function fncEmbalagemExp(nExibir)
	'OBJETIVO: exibir a qtde de produtos do processo de exportação
	'PARAMS: nExibir - onde será exibida a informação(0-result, 1-print, 2-excel)
	dim vText
	if objrsx.State = adStateOpen then objrsx.Close()
	sql = "SELECT ISNULL(TX_EMBALAGEM, '') AS EMBALAGEM "&_
				"FROM TPROCESSO_EXP_PEDIDO EP (NOLOCK) "&_
				"WHERE EP.NR_PROCESSO = '"& Trim(objrs.Fields.Item("NR_PROCESSO").Value) &"' "
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	vText = ""
	if objrsx.RecordCount > 0 then
		do while not objrsx.Eof
			vText = vText&objrsx.Fields.Item("EMBALAGEM").Value 
			objrsx.MoveNext
			if objrsx.Eof then exit do else vText = vText&"<br>"
		loop
	end if
	
	select case nExibir
		case 0
			vReturn = "<td align='right'>"& vText &"</td>"
		case 1
			vReturn = "<td align='right' class='pgridsub'>"& vText &"</td>"
		case 2
			vReturn = "<td align='right' bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& vText &"</td>"
	end select
	objrsx.Close()
	fncEmbalagemExp = vReturn
end function
%>