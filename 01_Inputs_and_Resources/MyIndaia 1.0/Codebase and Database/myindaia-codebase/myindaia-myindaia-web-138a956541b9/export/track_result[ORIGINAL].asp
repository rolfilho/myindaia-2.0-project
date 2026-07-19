<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 24/01/2008 - Analisado e comentado por FLAVIO Henrique
'Filtro Célula em 16/01/2008, Filtro CódMercadoria em 24/01/2008
' LINK PAREA TESTES: Response.Redirect("../IMPORT/teste.asp?var1="&str&"")

'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 300
Dim filtro,filtro1,TpEstufagem
Dim sql_s 'monta o select da query com os campos a serem exibidos
Dim sql_f 'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w 'monta o where da query
Dim sql_o 'monta a ordenação da query
Dim pagina'pagina inicial da ordenação
Dim ap_filtro 'nome do filtro selecionado para a consulta
Dim ap_filtros'nome dos filtros utilizados
Dim codigo
Dim ChkExibir

in_show  = False
cd_tela  = "EXP003"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
ap_filtros = Replace(Request("filtro"),", ","','")
ChkExibir=mid(Session("sql_pagina"),14,3)
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'Response.Redirect("../IMPORT/teste.asp?var1="&Request("cd_idioma")&"")

'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
'============================================================================================
'AÇÃO 1
'============================================================================================
'Response.Redirect("../IMPORT/teste.asp?var1="&Request.QueryString("cd_idioma")&"")

Session("sql_exp_track") = Null
If Not fnc_TestaVar(Session("sql_exp_track")) Then
  'dados básicos do relatório
	sql_s = "SELECT DISTINCT R.NR_PROCESSO, R.CD_ORDEM, R.CD_GRUPO, R.CD_CLIENTE, R.CD_AREA, R.CD_VIA_TRANSPORTE, "
	'tabelas da busca
  sql_f = " FROM TREL_EXP_TRACK R (NOLOCK) "&_
					"  INNER JOIN TPROCESSO     PR (NOLOCK) ON (PR.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TFLP_EXPORT   FE (NOLOCK) ON (FE.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = R.NR_PROCESSO) "&_
					"  LEFT  JOIN TPROCESSO_EXP_SAQUE SQ (NOLOCK) ON (SQ.NR_PROCESSO = R.NR_PROCESSO) "
	'requisitos da pesquisa
	sql_w = "WHERE R.CD_USUARIO = '"& Session("cd_usuario")&"' AND R.NR_IDENT = "& nr_ident &" "
	'ordenação dos registros  
	sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then sql_o = sql_o &" R."& tipo_quebra(tp_quebra) &" ASC, "
	If fnc_TestaVar(cd_ordem)  Then sql_o = sql_o &" R.CD_ORDEM "&aTipoOrdem(tp_ordem)&", "
	sql_o = sql_o &" R.NR_PROCESSO ASC"
'	Response.Redirect("../IMPORT/teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

	'**************************************************************************************************
	'inicia a montagem dos campos que serão selecionados
	'**************************************************************************************************	
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
		'*=======================================================================================================
		'- Início Verifica o tipo de consulta
		'*=======================================================================================================

			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA") 
							Case "00","02","50"'String - Tabela Direto, Array
								sql_s = sql_s &_
									" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
									'Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")

						  '============================================================================================
							Case "01","21","31","41"'String - Tipo de consulta = Lookup //CÉLULA//
								sql_s = sql_s &_
									" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
									"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" ( NOLOCK ) "&_
									"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
									" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
									'If objrsv.Fields.Item("M10_CD_DADO").Value="0049" then
									   'Response.Redirect("../IMPORT/teste.asp?var1="&objrsv.Fields.Item("M10_NM_DESCRICAO").Value&"")
									'end if
						  '============================================================================================
							Case "10"'Data
								If fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) Then
									'datas de follow-up de desembaraço
									sql_s = sql_s &_
													" FE.RLZ_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" FE.PVT_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &" AS PVT_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "&_
													" FE.IN_DT_EV"& objrsv.Fields.Item("M10_CD_BROKER").Value &"  AS IN_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								Else
									'Outras datas vindas de outras tabelas
									sql_s = sql_s &_
													" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								End If
						  '============================================================================================
							Case "20","30"'Decimal, Moeda
								Select Case objrsv.Fields.Item("M10_CD_DADO").Value
										Case "0063","0173" 'Peso liquido/bruto
												sql_s = sql_s &_
												" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
										Case Else
											sql_s = sql_s &_
												" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
								End Select
						  '============================================================================================
							Case "40"'Inteiro
								sql_s = sql_s &_
									" ISNULL( "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0 ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		'*=======================================================================================================
		'- Fim Verifica o tipo de consulta
		'*=======================================================================================================
		End If
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
	sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_exp_track") = sql_s & sql_f & sql_w & sql_o
'Response.write(Session("sql_exp_track"))
'FLAVIO: AQUI ESTÁ A MONTAGEM DO RELATÓRIO -TODO O SELECT MONTADO

End If

'============================================================================================
'AÇÃO 2
'============================================================================================
'executa a query (Stored Procedure)
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_exp_track") &"<br>"
With objcmd
  .CommandTimeOut = 300
  .CommandText    = Session("sql_exp_track")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'**************************************************************************************************	

'============================================================================================
'AÇÃO 3
'============================================================================================
'realiza busca de pedido, caso seja solicitado
If objrs.RecordCount > 0 and Request("vTxBusca") <> "" Then
  str = Request("vTxBusca")
	'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
	'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
		pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
  objrs.AbsolutePage = CInt(pagina)
End If

'============================================================================================
'AÇÃO 4
'============================================================================================

url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&nr_ident="& nr_ident & url
tx_path_file  = "/export/track_print"
tx_path_excel = "/export/track_excel"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst

'============================================================================================
'AÇÃO 5
'============================================================================================
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
			<!--
			function MM_jumpMenu(targ,selObj,restore){ //v3.0
				var target = "track_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
				eval(targ+".location='"+target+"'");
				if (restore) selObj.selectedIndex = 0;
			}
			function abreContainer(nr_processo) {
				features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
				window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
			}
			function abreCargaSolta(nr_processo) {
				features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
				window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>',"win2",features);
			}
			function abreDocs(nr_processo) {
				features = "top=100,left=20,width=350,height=250,resizable=yes";
				window.open('/detalhe/scan_docs_processo.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"scan_docs_processo",features);
			}
			function abreStatus(nr_processo) {
				features = "top=100,left=20,width=750,height=550,resizable=yes";
				window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo,"status",features);
			}
			//-->
</script>
</head>

<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
  <tr valign="top">
    <td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="100" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
	<tr>
<%
'============================================================================================
':::::::::: INICIO DO CORPO CENTRAL ::::::::::
'============================================================================================
%>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainMid">
				<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
					<%
dim vTxLinha(1), vInRowspan
vTxLinha(0) = ""
vTxLinha(1) = ""
vInRowspan = false
nr_cols = 0
'**************************************************************************************************	
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado FLAVIO
'**************************************************************************************************	
objrsv.MoveFirst
Do While Not objrsv.Eof
	select case objrsv.Fields.Item("M10_CD_DADO").Value
		case "0118"
			vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00095(cd_lang)&"</td><td>"&tx_lang_A00096(cd_lang)&"</td><td>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<td colspan='3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						vTxLinha(1) = vTxLinha(1) &"<td>"&tx_lang_A00033(cd_lang)&"</td><td>"&tx_lang_A00034(cd_lang)&"</td><td>"&tx_lang_A00035(cd_lang)&"</td>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else
            vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>" ' Título da coluna do relatório com o nome do campo selecionado.(datas)
						nr_cols = nr_cols + 1
					end if
				case else
					vTxLinha(0) = vTxLinha(0) &"<td#ROW#>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"' Título da coluna do relatório com o nome do campo selecionado.
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'**************************************************************************************************	
'exibe a linha com os cabeçalhos
'**************************************************************************************************	
if Len(vTxLinha(0)) > 0 then
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	if in_doctos then
		if in_dt_prev then vl_rowspan = " rowspan=2" else vl_rowspan = ""
		If Session("cd_cargo")="088" then
			vTxLinha(0) = "<td"&vl_rowspan&">Scanned Documents</td>"&vTxLinha(0)
		else
			vTxLinha(0) = "<td"&vl_rowspan&">Documentos Digitalizados</td>"&vTxLinha(0)
		end if
  	nr_cols = nr_cols + 1
	end if
	Response.Write("<tr height=30 class='gridtit'>"&vTxLinha(0)&"</tr>")
end if

'**************************************************************************************************	
'exibe a linha com os sub-cabeçalhos
'**************************************************************************************************	
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub'>"&vTxLinha(1)&"</tr>")
end if

cd_campo_quebra = ""
nrec = 0
objrsv.MoveFirst

'**************************************************************************************************	
'Exibe os resultados do relatório e aplica a personalização
'**************************************************************************************************	
Do While nrec < objrs.PageSize and Not objrs.Eof
				'pega informações do processo
				nr_processo = Trim(objrs.Fields.Item("NR_PROCESSO").Value)
				'alterna a cor das linhas
				If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
				'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
				If fnc_TestaVar( tp_quebra ) Then
					'quando muda campo definido no tipo de quebra, exibe o valor
					If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
			%>
								<tr>
									<td height="20" colspan="<%= nr_cols%>" class="gridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value )%></td>
								</tr>
								<%
					End If
					cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
				End If
			%>
								<tr height="15" bgcolor="<%= bgcolor%>" valign="top" onMouseDown="setPointer(this, <%= nrec%>, 'click', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOver="setPointer(this, <%= nrec%>, 'over', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');" onMouseOut="setPointer(this, <%= nrec%>, 'out', '<%= bgcolor%>', '#CCFFCC', '#FFCC99');">
								<%
				If in_doctos Then
					'verifica se os documendo já foram enviados
					dim objfso : Set objfso = Server.CreateObject("Scripting.FileSystemObject")
						'Response.Redirect("../IMPORT/teste.asp?var1="&Server.MapPath("/docs/"& nr_processo)&"")
					If objFSO.FolderExists(Server.MapPath("/docs/"& nr_processo)) Then
						Response.Write("<td><nobr><a href='#' onClick=""abreDocs('"& nr_processo &"');"">"& tx_lang_004031(cd_lang) &"</a></nobr></td>")
					Else
						Response.Write("<td><nobr>"& tx_lang_A00059(cd_lang) &"</nobr></td>")
					End If
					set objfso = nothing
				End If
				If objrsv.Eof Then objrsv.MoveFirst
			'**************************************************************************************************	
				'aplica a personalização - Inicio
			'**************************************************************************************************	
				Do While Not objrsv.Eof
					nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
					''Response.Redirect("../IMPORT/teste.asp?var1="&nm_campo_rel&"")

					'===================================================================
					'exibe os dados de acordo com a personalização do usuário 
					'===================================================================
					Select Case objrsv.Fields.Item("M10_CD_DADO").Value  'M10_CD_DADO=Código do campo a ser selecionado
						Case "0003" 'Nr. do Processo
			%>
									<td align="center"><nobr>&nbsp;<%If ChkExibir<>"088" then%><a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%End if%><%= Mid(nr_processo, 5, 10)%></a>&nbsp;</nobr></td>
									<%	
						'===================================================================	
						Case "0015" 'Tipo de contâiner
									Response.Write(fncExibeTipoContr(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================									
						Case "0017" 'canal de liberacao
									Response.Write(fncExibeCanal(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						Case "0018","0094","0096","0097","0098","0099","0100","0101","0374","0486" 'Nr.Referencia - Item
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA "&_
												"FROM TREF_CLIENTE ( NOLOCK ) "&_
												"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
												"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
												"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'agrupa todas as referencias na string para aparecerem como hint
									nr_referencia = ""
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											nr_referencia = nr_referencia & Trim(objrsx.Fields.Item(nm_campo_rel).Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia &"<br>"
										Loop
									End If
					%>
											<td align="left"><%If ChkExibir<>"088" then%><a href="/detalhe/exp_proc_result.asp?cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>&filtro=nr_processo&nr_processo=<%= nr_processo%>"><%End if%><%= nr_referencia%></a></td>
											<%
									If objrsx.State = adStateOpen Then objrsx.Close()
									
						Case "0046" 'NR CONTAINER
							If objrsx.State = adStateOpen Then objrsx.Close()
								sql = "SELECT NR_CNTR AS NR_CNTR, TP.NR_PROCESSO FROM tprocesso_cntr TPC "&_
										"INNER JOIN TPROCESSO TP ON TP.NR_PROCESSO = TPC.NR_PROCESSO "&_
										"WHERE TP.NR_PROCESSO= '"& nr_processo &"' "
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
								'agrupa todas as referencias na string para aparecerem como hint
								str = ""
								If objrsx.RecordCount > 0 Then
									'agrupa todas as referencias na string para aparecerem como hint
									Do While Not objrsx.Eof
										str = str &Trim(objrsx.Fields.Item("NR_CNTR").Value)
										objrsx.MoveNext
										If objrsx.Eof Then Exit Do Else str = str &"<br>"
									Loop
								End If
								objrsx.Close()%>
			
								<td><nobr><%=str%>&nbsp;</nobr></td>
                                
						<%'===================================================================	
						
						Case "0579" 'Dt.Referencia
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT DISTINCT CD_REFERENCIA AS NR_REFERENCIA, NR_SEQUENCIA, DT_REFERENCIA "&_
												"FROM TREF_CLIENTE ( NOLOCK ) "&_
												"WHERE NR_PROCESSO   = '"& nr_processo &"' "&_
												"  AND TP_REFERENCIA = '"& objrsv.Fields.Item("M10_CD_BROKER").Value &"' "&_
												"ORDER BY CD_REFERENCIA, NR_SEQUENCIA"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'agrupa todas as referencias na string para aparecerem como hint
									nr_referencia = ""
									If objrsx.RecordCount > 0 Then
										'agrupa todas as referencias na string para aparecerem como hint
										Do While Not objrsx.Eof
											nr_referencia = nr_referencia & Trim(objrsx.Fields.Item(nm_campo_rel).Value)
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else nr_referencia = nr_referencia &"<br>"
										Loop
									End If
					%>
											<td align="left"><%= nr_referencia%></td>
											<%
									If objrsx.State = adStateOpen Then objrsx.Close()
						'===================================================================	
						Case "0066" 'tipo de frete
									Response.Write(fncExibeFrete(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						Case "0084" 'Mercadoria
									'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT ISNULL( M.AP_MERCADORIA, '') AS TX_MERCADORIA ,M.CD_MERCADORIA "&_
												"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"WHERE NR_PROCESSO = '"& nr_processo &"'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'se não achar a mercadoria, procura na tprocesso
									If objrsx.RecordCount < 1 Then
										objrsx.Close
										sql = "SELECT ISNULL( TX_MERCADORIA, '') AS TX_MERCADORIA "&_
													"FROM TPROCESSO ( NOLOCK ) "&_
													"WHERE NR_PROCESSO = '"& nr_processo &"'"
										objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
										'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")

									End If
									
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										x = Left(Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value,"""","'")), 40)
										If objrsx.RecordCount > 1 Then x = x &"..."
										'agrupa todas as mercadorias na string para aparecerem como hint
										Do While Not objrsx.Eof
											str = str & Trim(Replace(objrsx.Fields.Item("TX_MERCADORIA").Value,"""","'"))
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
										Loop 
									Else
										str = "Descrição não Disponível."
									End If
					%>
											<td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
											<%
									objrsx.Close
					'Flávio em 8/5/2008  ===================================================================	
						Case "0085" 'Agente de carga
								If objrsx.state = adStateOpen then objrsx.Close()
								sql="select tp.NR_PROCESSO,tp.cd_agente,ta.nm_agente as agente from tprocesso tp, tagente ta where NR_PROCESSO= '"& nr_processo &"' and ta.cd_agente=tp.cd_agente"
								objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								str=""
								If objrsx.eof  Then
									 str = "&nbsp;"
								Else
									str = Trim(objrsx.Fields.Item("agente").Value)
								End If
								'Response.Redirect("../IMPORT/teste.asp?var1="&str&"")
								objrsx.Close()%>
								<td><nobr><%=str%>&nbsp;</nobr></td>
						
						<%Case "0598" 'Cód.Mercadoria
									'verifica se já existe as mercadorias cadastradas no processo de exportação
									If objrsx.State = adStateOpen Then objrsx.Close()
									sql = "SELECT ISNULL( M.AP_MERCADORIA, '') AS TX_MERCADORIA ,M.CD_MERCADORIA "&_
												"FROM TPROCESSO_EXP_ITEM I (NOLOCK) "&_
												"  INNER JOIN TMERCADORIA_EXP M (NOLOCK) ON (M.CD_MERCADORIA = I.CD_MERCADORIA) "&_
												"WHERE NR_PROCESSO = '"& nr_processo &"'"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									'Response.Redirect("../IMPORT/teste.asp?var1="&SQL&"")
									str = ""
									If objrsx.RecordCount > 0 Then
										'descrição que será exibida
										x = Left(Trim(Replace(objrsx.Fields.Item("CD_MERCADORIA").Value,"""","'")), 40)
										If objrsx.RecordCount > 1 Then x = x &"..."
										'agrupa todas as mercadorias na string para aparecerem como hint
										Do While Not objrsx.Eof
											str = str & Trim(Replace(objrsx.Fields.Item("CD_MERCADORIA").Value,"""","'"))
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &";"& vbcrlf
										Loop 
									Else
										str = "Código não Disponível."
									End If
					%>
											<td align="left" title="<%= str%>"><nobr>&nbsp;<%= x%>&nbsp;</nobr></td>
											<%
									objrsx.Close

						'===================================================================	
						Case "0103" 'sim/não campo in_urgente
									Response.Write(fncExibeSimNao(0, objrs.Fields.Item(nm_campo_rel).Value))
						'===================================================================	
						case "0118","0123","0131" 'Nr. Nota Fiscal / Nr. RE / Nr. Doc. Instrução
									Response.Write(fncExibeTabelaExp(0, objrsv.Fields.Item("M10_CD_DADO").Value))
						'===================================================================	
						Case "0154" 'Indicados do saque Borderô
									str = objrs.Fields.Item(nm_campo_rel).Value
									If Not fnc_TestaVar(str) Then str = "" Else str = tipo_periodo(str)%>
											<td align="left"><nobr><%= str%></nobr></td>
											<%
						'===================================================================	
						Case "0170" 'qtde e tipo de Container
									sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
												"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
												"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
												"  AND TP_CNTR <> '01' "&_
												"GROUP BY TP_CNTR"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									matriz = Split(nm_campo_rel, ";", -1)
									
									If objrsx.RecordCount > 0 Then
										str = ""
										Do While Not objrsx.Eof
											str = str &"<nobr>"& objrsx.Fields.Item(matriz(0)).Value &" "& tipo_cntr(CInt(objrsx.Fields.Item(matriz(1)).Value)-1) &"</nobr>"
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop
										str = "<table width='100%' cellspacing='1' cellpadding='0' border='0'><tr><td>"& str &_
													"</td><td align='right'>&nbsp;<a href='#' onClick=""abreContainer('"& nr_processo &"');"">"&_
													"<img src='/imagens/icones/16x16/container.gif' width=21 height=15 border=0 alt='"& tx_lang_A00040(cd_lang) &"' />"&_
													"</a>&nbsp;</td></tr></table>"
									Else
										str = "<nobr>&nbsp;"& tx_lang_A00041(cd_lang) &"</nobr>"
									End If
					%>
											<td><%= str%></td>
											<%
									objrsx.Close()
						'===================================================================	
						Case "0350" 'Carga Solta / LCL
									sql = "SELECT "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &" "&_
												"FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
												"WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = '"& nr_processo &"' "&_
												"GROUP BY NM_ESPECIE"
									objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
									matriz = Split(nm_campo_rel, ";", -1)
									
									If objrsx.RecordCount > 0 Then
										str = ""
										Do While Not objrsx.Eof
											str = str &"<nobr>&nbsp;"& objrsx.Fields.Item(matriz(0)).Value &" "& objrsx.Fields.Item(matriz(1)).Value &"</nobr>"
											objrsx.MoveNext
											If objrsx.Eof Then Exit Do Else str = str &"<br>"
										Loop
										str = "<table width='100%' cellspacing='0' cellpadding='0' border='0'><tr><td>"& str &_
													"</td><td align='right'>&nbsp;<a href='#' onClick=""abreCargaSolta('"& nr_processo &"');"">"&_
													"<img src='/imagens/icones/16x16/pallet.gif' width=22 height=15 border=0 alt='"& tx_lang_A00043(cd_lang) &"' />"&_
													"</a>&nbsp;</td></tr></table>"
									Else
										str = "<nobr>&nbsp;"& tx_lang_A00044(cd_lang) &"</nobr>"
									End If
					%>
											<td><%= str%></td>
											<%
									objrsx.Close()
								
						'===================================================================	
						case "0499" 'qtde de produtos
									Response.Write(fncQtdeProdutosExp(0))
						'===================================================================	
						Case "0531" 'status do processo
									str = objrs.Fields.Item(nm_campo_rel).Value
									If fnc_TestaVar(str) Then str = "<a href=""#"" onClick=""abreStatus('"& nr_processo &"');"">"&Trim(str)&"</a>" Else str = ""
					%>
											<td><nobr><%= str%></nobr></td>
											<%
						'===================================================================	
						Case "0548" 'código da rap
									Response.Write(fncExibeRap(0, nr_processo))
						'===================================================================	
						Case "0560" 'qtde de faturas por processo
									Response.Write(fncEmbalagemExp(0))
						'===================================================================	
						Case "0577" 'qtde de faturas por processo
									Response.Write(fncQtdeFaturasExp(0))
						
						Case Else 'FLAVIO - MONTANDO O RELATÓRIO (TRAZENDO OS DADOS)
									Select Case objrsv.Fields.Item("M10_TP_DADO").Value
										Case "0" 'exibe os campos de texto simples
										'=========================  ESTUFAGEM : NOMEANDO OS CÓDIGOS ===================================	
										    If objrsv.Fields.Item("M10_CD_DADO").Value="0595" Then
												  Select case objrs.Fields.Item(nm_campo_rel).Value 'nm_campo_rel = TP_Estufagem
																	Case "0"
																			nm_campo_rel="LCL"
																		Case "1"
																			nm_campo_rel="FCL"
																		Case "2"
																		nm_campo_rel="Carga solta"
																		Case else
																		nm_campo_rel="Em branco"
													End select
													Response.Write(fncExibeTextoPadrao(0, nm_campo_rel)) '(0,x), 0 = onde será exibida a informação(0-result, 1-print, 2-excel)
												else	
													'Response.Redirect("../IMPORT/teste.asp?var1="&Session("sql_exp_track")&"")
													Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value)) '(0,x), 0 = onde será exibida a informação(0-result, 1-print, 2-excel)
												End If							
										Case "1" 'exibe os campos de datas
											if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
												Response.Write(fncExibeDataEventoFup(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
											else
												Response.Write(fncExibeDataPadrao(0, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
											end if	
										Case "2" 'exibe os campos com valor decimal
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 2))
										Case "3" 'exibe os campos com valor monetário
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 4))
										Case "4" 'exibe os campos com valor inteiro
											Response.Write(fncExibeNumeroPadrao(0, objrs.Fields.Item(nm_campo_rel).Value, 0))
										Case "5" 'exibe os campos do tipo memo
											Response.Write(fncExibeMemoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
									End Select
					End Select
					objrsv.MoveNext
					If objrsv.Eof Then Exit Do
				Loop
			'**************************************************************************************************	
'**************************************************************************************************
	'Fim da montagem dos campos que serão selecionados
'**************************************************************************************************	
			'**************************************************************************************************	
			%>
								</tr>
								<%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit">
						<td height="15" colspan="<%= nr_cols%>" align="left"><nobr><%= tx_lang_A00030(cd_lang) &" "& objrs.RecordCount &" "& tx_lang_A00031(cd_lang) &"."%></nobr></td>
					</tr>
					<%'Response.Redirect("../IMPORT/teste.asp?var1="&tx_lang_A00040(cd_lang)&"")

objrsv.Close
objrs.Close
%>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
  </tr>
  <tr>
    <td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
      <!--#include virtual="/includes/lay_bottom.asp" -->
      <!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
    </td>
  </tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->