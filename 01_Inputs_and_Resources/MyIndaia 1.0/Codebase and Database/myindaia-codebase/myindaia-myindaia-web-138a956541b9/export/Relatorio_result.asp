<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação / Tracking
'Arquivo de Script e HTML: Resultado da Busca Contrato de Câmbio
'
'Autor Flávio Henrique
'Criado: 28/06/2005
'
'Manutenção: 24/01/2008 - Analisado e comentado por FLAVIO Henrique

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
Dim nr_cont_camb 
Dim nr_banco
Dim dt_fechamento
Dim dt_venc_liq
Dim VL_NEGOC
Dim dt_venc_docto
Dim cd_exportador
Dim checar
Dim a,b,c,d,e,f,g,dt_fechamento_i,dt_fechamento_f,dt_venc_liq_i,dt_venc_liq_f,dt_venc_docto_i,dt_venc_docto_f
in_show  = False
cd_tela  = "EXP003"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))

nr_cont_camb = request("nr_cont_camb")
nr_banco= request("nr_banco")
dt_fechamento= request("dt_fechamento")
dt_venc_liq= request("dt_venc_liq")
vl_negoc= request("vl_negoc")
dt_venc_docto= request("dt_venc_docto")
cd_exportador= request("cd_exportador")


ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

'******************************************************
'Response.Redirect("../IMPORT/teste.asp?var1="&ap_filtros&"")

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
Session("sql_exp_track") = Null
If Not fnc_TestaVar(Session("sql_exp_track")) Then
  'dados básicos do relatório
	sql_s = "SELECT R.NR_BANCO, R.NR_CONT_CAMB, R.DT_FECHAMENTO, R.DT_VENC_LIQ, R.DT_VENC_DOCTO, R.VL_NEGOC,R.CD_EXPORTADOR, TE.NM_EMPRESA,TE.CD_EMPRESA "
	'tabelas da busca
  sql_f = "  FROM TCONT_CAMB R ( NOLOCK ) " &_
  "INNER JOIN TEMPRESA_NAC TE  (NOLOCK) ON (TE.CD_EMPRESA = R.CD_EXPORTADOR) "


'NR_CONT_CAMB - NR_BANCO - DT_FECHAMENTO - DT_VENC_LIQ - VL_NEGOC - DT_VENC_DOCTO - CD_EXPORTADOR

iF Request("NR_CONT_CAMB")<>"" then a="1" else a="0" end if
iF Request("NR_BANCO")<>"" then b="1" else b="0" end if
iF Request("DT_FECHAMENTO")<>"" then c="1"else c="0"  end if
iF Request("DT_VENC_LIQ")<>"" then d="1" else d="0" end if
iF Request("VL_NEGOC")<>"" then e="1" else e="0" end if
iF Request("DT_VENC_DOCTO")<>"" then f="1" else f="0" end if
iF Request("CD_EXPORTADOR")<>"" then g="1" else g="0" end if

dt_fechamento_i=Mid(dt_fechamento,1,10)
dt_fechamento_f=Mid(dt_fechamento,12,10)
dt_venc_liq_i=Mid(dt_venc_liq,1,10)
dt_venc_liq_f=Mid(dt_venc_liq,12,10)
dt_venc_docto_i=Mid(dt_venc_docto,1,10)
dt_venc_docto_f=Mid(dt_venc_docto,12,10)



checar=a&b&c&d&e&f&g
'Response.Redirect("../IMPORT/teste.asp?var1="&checar&"")
   Select Case checar
	  Case "1000000" 
		  sql_w = " WHERE R.NR_CONT_CAMB = '"& Request("nr_cont_camb")&"'" 'AND R.NR_BANCO = '"& Request("nr_banco")&"'"
      Case "1100000"
		  sql_w = " WHERE R.NR_CONT_CAMB = '"& Request("nr_cont_camb")&"' AND R.NR_BANCO = '"& Request("nr_banco")&"'"
        Case "0100000"
		  sql_w = " WHERE  R.NR_BANCO = '"& Request("nr_banco")&"'"
		Case "0010000"
		    sql_w = " WHERE (R.DT_FECHAMENTO BETWEEN CONVERT(datetime, '"& dt_fechamento_i &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fechamento_f &" 23:59:59.999', 103)) order by DT_FECHAMENTO"
		Case "0001000"
		    sql_w = " WHERE R.dt_venc_liq BETWEEN CONVERT(datetime, '"& dt_venc_liq_i &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_venc_liq_f &" 23:59:59.999', 103) order by DT_FECHAMENTO"

		Case "0000010"
		   sql_w = " WHERE R.dt_venc_docto BETWEEN CONVERT(datetime, '"& dt_venc_docto_i &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_venc_docto_f &" 23:59:59.999', 103) order by DT_FECHAMENTO"

		Case "0011000" 'fechamento e liquidação
		    sql_w = " WHERE (R.DT_FECHAMENTO BETWEEN CONVERT(datetime, '"& dt_fechamento_i &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_fechamento_f &" 23:59:59.999', 103))  AND  (R.dt_venc_liq BETWEEN CONVERT(datetime, '"& dt_venc_liq_i &" 00:00:00.000', 103) AND CONVERT(datetime, '"& dt_venc_liq_f &" 23:59:59.999', 103)) order by NR_CONT_CAMB"
			
		
      Case Else
		  sql_w = " WHERE R.NR_CONT_CAMB = '"& Request("nr_cont_camb")&"'" 'AND R.NR_BANCO = '"& Request("nr_banco")&"'"
   End select
   
	'ordenação dos registros  
	'sql_o = "ORDER BY "
	If fnc_TestaVar(tp_quebra) Then sql_o = sql_o &" R."& tipo_quebra(tp_quebra) &" ASC, "
	If fnc_TestaVar(cd_ordem)  Then sql_o = sql_o &" R.CD_ORDEM "&aTipoOrdem(tp_ordem)&", "
	'sql_o = sql_o &" R.NR_PROCESSO ASC"
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
									'				Response.Redirect("../IMPORT/teste.asp?var1="&objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value&"")
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
								'	Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")
													
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
	'sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
	'finaliza a construção do select do relatório e salva na Session
	Session("sql_exp_track") = sql_s & sql_f & sql_w & sql_o
'Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")
'MENSAGEM FLAVIO: AQUI ESTÁ A MONTAGEM DO RELATÓRIO -TODO O SELECT MONTADO

End If

'============================================================================================
'AÇÃO 2
'============================================================================================
'executa a query 
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
  If objrs.Eof Then
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End if
If objrs.RecordCount > 0 and Request("vTxBusca") <> "" Then
  str = Request("vTxBusca")
	'busca o registro
  objrs.Find str, 0, adSearchForward
  'verifica se foi encontrado
  If Not objrs.Eof Then
		pagina = Int(objrs.AbsolutePosition / nr_reg_pagina) + 1
  Else
		tx_erro = "ATENÇÃO:\n\n - Busca terminada e nenhum registro encontrado."
  End If
Else
	'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.RecordCount&"")

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
		vTxLinha(0) = "<td"&vl_rowspan&">Documentos Digitalizados</td>"&vTxLinha(0)
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
				nr_processo = Trim(objrs.Fields.Item("NR_CONT_CAMB").Value)
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
					'Response.Redirect("../IMPORT/teste.asp?var1="&nm_campo_rel&"")

					'===================================================================
					'exibe os dados de acordo com a personalização do usuário 
					'===================================================================
					Select Case objrsv.Fields.Item("M10_CD_DADO").Value  'M10_CD_DADO=Código do campo a ser selecionado
						Case "0000"
								sql_w = " "
						
						Case Else 'FLAVIO - MONTANDO O RELATÓRIO (TRAZENDO OS DADOS)

									Select Case objrsv.Fields.Item("M10_TP_DADO").Value
										Case "0" 'exibe os campos de texto simples
												'Response.Redirect("../IMPORT/teste.asp?var1="&sql_s&"")
													Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value)) 
										Case "1" 'exibe os campos de datas
												Response.Write(fncExibeDataPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
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
	'Fim da montagem dos campos que serão selecionados
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
					<%
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