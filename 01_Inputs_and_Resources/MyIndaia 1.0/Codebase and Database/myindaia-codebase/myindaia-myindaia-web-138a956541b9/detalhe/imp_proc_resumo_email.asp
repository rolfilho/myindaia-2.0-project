<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Importação
'Arquivo de Script e HTML: Impressão da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 02/08/2005
'
'Manutenção: 01/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 360
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_li      'exibe imformações da li
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim tp_relat_rel 'tipo do relatorio

in_show = False
cd_tela = "DET004"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "01"
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
cd_empresa   = CStr(Request.QueryString("cd_empresa"))
'seleciona os dados da view
in_view_campo = 1
flag_resumo = 1

%>
<%
vBody = "<body style='overflow:auto;' >"
vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0'>"
vBody = vBody & "<tr>"
vBody = vBody & "<td valign='top' style='border: solid 1px #336699;'><table width='100%' border='0' cellspacing='1' cellpadding='1'>"
				
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  cont = 1
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
				vBody = vBody &  "<tr class='gridtop'>"
				vBody = vBody & "<td colspan='4' class='quebra'>&nbsp;" & tx_lang_A00050(cd_lang) & "</td>"
				vBody = vBody & "</tr>"
			Case 1
				vBody = vBody & "<tr class='gridtop'>"
				vBody = vBody & "<td colspan='4' class='quebra'>&nbsp;" & tx_lang_A00051(cd_lang) & "</td>"
				vBody = vBody & "</tr>"
		End Select
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
				vBody = vBody & "<tr bgcolor=" & bgcolor & ">"
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & UCase(Mid(nr_processo, 5, Len(nr_processo))) & "&nbsp;</td>"
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & tipo_canal(x) & "&nbsp;</td>"
		Case "0044"
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" &  str
						
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						vBody = vBody &  "<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>"
					End If
					vBody = vBody & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
					vBody = vBody & "<td class='detcampo'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_VOO").Value & "</td>"
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
					vBody = vBody & "<td class='detcampo'>" & fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado) & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & objrs.Fields.Item("NR_CAMINHAO").Value & "</td>"					<%
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "</td>"
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
						"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
						"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
						"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT I.CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
							"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
							"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							"  AND I.CD_EMPRESA     = '"& cd_empresa &"' "&_
							"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
								"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				end if
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					str_merc = str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>" str_merc & "</td>"
			objrsx.Close
		Case "0097" 'numero da referencia cliente (TREF_CLIENTE)
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT CD_REFERENCIA AS NR_REFERENCIA, NR_ITEM_PO AS NR_ITEM_CLIENTE, TP_REFERENCIA "&_
						"FROM TREF_CLIENTE (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY TP_REFERENCIA, CD_REFERENCIA, NR_ITEM_PO"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.RecordCount > 0 Then
				ReDim str_refs(Ubound(tipo_referencia))
				Do While Not objrsx.Eof
					x = CInt(objrsx.Fields.Item("TP_REFERENCIA").Value) - 1
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0
					If str <> 0 Then str_refs(x) = str_refs(x) &"/"& str
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop
			End If
					vBody = vBody & "<td class='detcampo'>" & Right(objrsv.Fields.Item("M10_NM_DADO").Value, 11) & "</td>"
					vBody = vBody & "<td style='padding: 0px;'><table width='100%' cellpadding='0' cellspacing='0' border='0'>"
			if objrsx.RecordCount > 0 then
				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>"
						vBody = vBody & "<td>"& str_refs(x) &"</td></tr>"
					End If
				Next
			else
				vBody = vBody & "<tr><td width='60' valign='top'>&nbsp;Pedido</td>"
				vBody = vBody & "<td>"& nr_referencia&"/"&nr_item_clnte &"</td></tr>"
			end if										
						vBody = vBody & "</table></td>"
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & sim_nao(str) & "&nbsp;</td>"					
	 	Case "0225" 'Nr de LI
			if objrsx.State = adStateOpen then objrsx.Close()
			sql = "SELECT NR_LI, DT_DEFERIMENTO, DT_VENCTO "&_
						"FROM TPROCESSO_LI (NOLOCK) "&_
						"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
						"ORDER BY DT_VENCTO DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			str_li = ""
			If objrsx.RecordCount > 0 Then
				Do While Not objrsx.Eof
					str_li = str_li & fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1)
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str_li & "</td>"
         Case "0485"
            If objrsx.state = adstateOpen then objrsx.close()
			SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
			" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
			" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
			"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
			Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
			If objrsx.eof then
				str="-"
			else
				str= objrsx.fields.item("CONTATO").value
			End If
            vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
			vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & str & "</td>"
            objrsx.Close
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td bgcolor=" & bgcolor & ">&nbsp;" & fnc_Mascara(str, 1) & "</td>"
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & str & "&nbsp;</td>"
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & fnc_Mascara( x, 5 ) & "&nbsp;</td>"
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & x & "&nbsp;</td>"
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
					vBody = vBody & "<td class='detcampo'>" & objrsv.Fields.Item("M10_NM_DADO").Value & "</td>"
					vBody = vBody & "<td>&nbsp;" & z & "&nbsp;</td>"
			End Select
	End Select
	If cont = 3 Then
		cont = 1
				vBody = vBody & "</tr>"
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value

objrs.Close

		vBody = vBody & "</table></td>"
	    vBody = vBody & "</tr>"
        vBody = vBody & "</table>"

vBody = vBody & "<table width='100%' border='0' cellspacing='2' cellpadding='0'>"
	vBody = vBody & "<tr>"
		vBody = vBody & "<td valign='top' style='border: solid 1px #336699;'>"
			vBody = vBody & "<table width="100%" border="0" cellspacing="1" cellpadding="0">
			vBody = vBody & "<tr class='gridtop' height='16'>"
			vBody = vBody & "<td>&nbsp;" & tx_lang_A00053(cd_lang) & "</td>"
			vBody = vBody & "<td>&nbsp;" & tx_lang_A00035(cd_lang) & "</td>"
			vBody = vBody & "</tr>"
				
'Seleciona os dados do follow-up
If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT NR_PROCESSO_DES"&_ 
	      " FROM TESTAGIO_PROCESSO"&_ 
          " WHERE NR_PROCESSO_ADM = '" & nr_processo & "'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If Not objrs.eof then
	If Not fnc_testavar(objrs.Fields.Item("NR_PROCESSO_DES").Value) then
		nr_processo_des_null = 1
	End if
Else
	nr_processo_des_null = 0
End if


If objrs.State = adStateOpen Then objrs.Close
If cd_produto <> "06" Then
	sql = " AND F.NR_PROCESSO_DES = '"& nr_processo &"' "
else
	sql = ""
end if
If Not nr_processo_des_null = 1 then
sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.TP_FOLLOWUP, F.NR_ORDEM "&_
			"FROM TFLP_ESTAGIO F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
			"WHERE F.CD_EMPRESA = '" & cd_empresa & "' AND F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
			"  AND F.CD_EVENTO NOT IN ('022') "&_
			"  AND F.NR_ORDEM IS NOT NULL "&_
			"ORDER BY F.TP_FOLLOWUP, F.NR_ORDEM"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Else
	sql = "SELECT DISTINCT "&_
	"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	"FROM TFLP_PO_ITEM F ( NOLOCK ) "&_
	"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
	"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_PROCESSO = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
	"  AND F.CD_EVENTO NOT IN ('022') "&_
	"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
	" ORDER BY F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End If

Do While Not objrs.Eof
  If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	color = "#OOOOOO" 'cor da data e dias de atraso/antecedencia
	x = objrs.Fields.Item("DT_PREVISTA").Value
	y = objrs.Fields.Item("DT_REALIZACAO").Value
	w = objrs.Fields.Item("IN_APLICAVEL").Value
	
	If (Not fnc_TestaVar(w)) or (w = 0) Then
		x = "-" 'data prevista
		y = "Não Aplicável" 'data realizada
		z = "-" 'diferença de dias
		color = "#999999"   'cor da fonte
	Else
		z = "-"
		If IsDate(x) Then
			'se a data prevista existir
			If IsDate(y) Then
				'se a data realizada existir
				z = fnc_DiasUteisKPI(x, y, 0)
			Else
				z = fnc_DiasUteisKPI(x, Date(), 0)
			End If
			'muda a cor do lead-time conforme o resultado
			If z < 0 Then 
				color = "#0000FF" 'azul
			ElseIf z > 0 Then
				z = "+"& z
				color = "#FF0000" 'vermelho
			End If
		End If
	End If
			vBody = vBody & "<tr bgcolor=" & bgcolor & " height='13'>"
			vBody = vBody & "<td>" & objrs.Fields.Item("CD_EVENTO").Value &" - "& objrs.Fields.Item("NM_EVENTO").Value & "</td>"
			vBody = vBody & "<td align='right'><font color="& color &">"& fnc_Mascara(y, 5) &"</font>&nbsp;</td>"
			vBody = vBody & "</tr>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
objrs.Close

		vBody = vBody & "</table></td></tr>"
	    vBody = vBody & "<tr>"
		vBody = vBody & "<td valign='top' style='border: solid 1px #336699;'>"
		vBody = vBody & "<table width='100%' height='100%' border='0' cellspacing='1' cellpadding='2'>"
		vBody = vBody & "<tr class='gridtop' height='16'>"
		vBody = vBody & "<td colspan='2'>&nbsp;" & tx_lang_A00054(cd_lang) & "</td>"
		vBody = vBody & "</tr>"
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT TX_OBSERVACAO FROM TFOLLOWUP_OBS (NOLOCK) WHERE NR_PROCESSO = "
If cd_produto = "06" Then
	sql = sql&"'"& nr_referencia &"'"
Else
    if nr_parcial <> "" then
        sql = sql&"'"& nr_processo &"' OR (NR_PROCESSO = '" & nr_referencia & "' AND CD_EMPRESA = '" & cd_empresa & "') "
    else
        sql = sql&"'"& nr_processo &"'"
    end if
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
str_obs = ""
If objrs.RecordCount > 0 Then 
  Do While Not objrs.Eof 
  str_obs = str_obs & objrs.Fields.Item("TX_OBSERVACAO").Value & "<br><br>"
  objrs.MoveNext
  If objrs.Eof Then Exit Do
  Loop
else 
  str_obs = ""
End If
If Not fnc_TestaVar(str_obs) Then str_obs = "" Else str_obs = Replace(Replace(str_obs, """", "'"), vbcrlf, "<br>")
				vBody = vBody & "<tr bgcolor='#EEEEEE'>"
				vBody = vBody & "<td>" & str_obs & "</td>"
				vBody = vBody & "</tr></table></td></tr>"                    
vBody = vBody & "</table>"
vBody = vBody & "</body>"
vBody = vBody & "</html>"
