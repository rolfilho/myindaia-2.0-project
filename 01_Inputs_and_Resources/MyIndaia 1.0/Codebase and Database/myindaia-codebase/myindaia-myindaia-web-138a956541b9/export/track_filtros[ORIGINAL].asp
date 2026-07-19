<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação / Tracking
'Arquivo de Script e HTML: Filtros do Relatório
'
'Autor: Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 22/02/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
in_show = True
cd_tela = "EXP001"
nm_tela = Null
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")

in_view_filtro = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
'nome da tela
nm_tela = nm_menu &" &gt;&gt; "& nm_subm &" &gt;&gt; "& nm_view
'define se os filtros seram em 1 ou 2 colunas
If objrsv.RecordCount > 20 Then
	vl_colspan    = 6
	vl_width      = "100%"
	vl_width_form = 200
Else
	vl_colspan    = 3
	vl_width      = 500
	vl_width_form = 300
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_filtros.js"></script>
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainTop">
				<table width="<%= CStr(vl_width)%>" border="0" align="center" cellpadding="0" cellspacing="0">
					<form name="frmbusca" method="post" action="/export/track_busca.asp" onSubmit="return validSubmit()">
						<tr>
							<td height="50" colspan="<%= CStr(vl_colspan)%>" align="center"><font size="2"><b>..::: <%= tx_lang_A00020(cd_lang)%> :::..</b></font><br>
								<a href="/personaliza/cad_view.asp?in_acao=editar&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>"><%= tx_lang_A00005(cd_lang) &" "& tx_lang_A00021(cd_lang)%>.</a></td>
						</tr>
						<%
Do While Not objrsv.Eof
	If objrsv.RecordCount > 20 Then
		cont = objrsv.AbsolutePosition
		If (cont Mod 2) = 1 Then
%>
						<tr height="24">
							<%
		End If
	Else
		Response.Write("<tr height='24'>")
	End If
	checked = ""
	If objrsv.Fields.Item("M11_IN_CHECK").Value  Then checked = " checked"
	If objrsv.Fields.Item("M13_IN_PADRAO").Value Then checked = " checked"
		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
		Case "0001" 'Selects - Unidade
	%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><select class="select" style="width: <%= CStr(vl_width_form)%>px;" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);">
									<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
									<option value="01"<%If Session("cd_unid_neg") = "01" Then Response.Write(" selected")%>>Indaiá Logística
									Internacional Ltda.</option>
									<option value="02"<%If Session("cd_unid_neg") = "02" Then Response.Write(" selected")%>>Indaiá Rio
									Logística Ltda.</option>
									<%
			If Session("cd_cargo") = "001" Then
%>
									<option value="03"<%If Session("cd_unid_neg") = "03" Then Response.Write(" selected")%>>MyIndaiá (
									desenvolvimento )</option>
									<%
			End If
%>
								</select></td>
							<%
		Case "0005","0006","0007","0008","0594","0126" 'Selects - Grupo, Clientes, Área e Sub-área
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><select class="select" style="width: <%= CStr(vl_width_form)%>px;" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);">
									<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
									<%
			If InStr("040;055;060;045", Session("cd_cargo")) > 0 Then
				'selecionas apenas os dados que o usuário cliente tem permissão
				Select Case objrsv.Fields.Item("M10_CD_DADO").Value
'					Case "0126"  ' 0126 = IMPORTADOR 
'					SQL = "SELECT TP.NM_EMPRESA AS DESCRICAO, TP.CD_EMPRESA AS CODIGO,TE.CD_USUARIO FROM TPERMISSAO TE "&_
'							"INNER JOIN TEMPRESA_EST TP ( NOLOCK ) ON TE.CD_USUARIO='"& Session("cd_usuario") &"' " &_
'							"WHERE  TP.CD_EMPRESA=TE.CD_CLIENTE"
'					'Response.Redirect("../IMPORT/teste.asp?var1="&Session("cd_usuario")&"")
				
					Case "0005" 'SELECIONA O NOME DOS GRUPOS DE EMPRESAS DO CLIENTE
						sql = "SELECT DISTINCT G.CD_GRUPO AS CODIGO, G.NM_GRUPO AS DESCRICAO " &_
									"FROM TGRUPO G ( NOLOCK ) " &_
									"  INNER JOIN TEMPRESA_NAC E ( NOLOCK ) ON ( G.CD_GRUPO   = E.CD_GRUPO ) " &_
									"  INNER JOIN TPERMISSAO   P ( NOLOCK ) ON ( P.CD_CLIENTE = E.CD_EMPRESA ) " &_
									"WHERE P.CD_USUARIO = '"& Session("cd_usuario") &"' " &_
									"  AND E.IN_ATIVO   = 1 "&_
									"  AND E.IN_CLIENTE = 1 "&_
									"ORDER BY G.NM_GRUPO"
					Case "0006" 'SELECIONA O NOME DAS EMPRESAS CLIENTE
						sql = "SELECT DISTINCT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS DESCRICAO " &_
									"FROM TEMPRESA_NAC E ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO P ( NOLOCK ) ON ( P.CD_CLIENTE = E.CD_EMPRESA ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"  AND E.IN_ATIVO   = 1 "&_
									"  AND E.IN_CLIENTE = 1 "&_
									"ORDER BY E.NM_EMPRESA"
					Case "0007" 'SELECIONA TODAS AS AREAS
						sql = "SELECT A1.NM_GRUPO AS CODIGO, A1.NM_GRUPO AS DESCRICAO " &_
									"FROM TAREA A1 ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_AREA P ( NOLOCK ) ON ( P.CD_AREA = A1.CD_AREA ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"GROUP BY A1.NM_GRUPO"
					Case "0008" 'SELECIONA TODAS AS SUB-AREAS
						sql = "SELECT A.CD_AREA AS CODIGO, A.NM_AREA AS DESCRICAO " &_
									"FROM TAREA A ( NOLOCK ) " &_
									"  INNER JOIN TPERMISSAO_AREA P ( NOLOCK ) ON ( P.CD_AREA = A.CD_AREA ) " &_
									"WHERE P.CD_USUARIO = '" & Session("cd_usuario") & "' " &_
									"ORDER BY A.NM_AREA"
		'****************************************** 19/12/2007 - INCLUSÃO DA OPÇÃO CELULAS (FLÁVIO) ****************************									
					Case "0594" 'SELECIONA TODAS AS CELULAS - TCELULA
						sql = "SELECT CD_CELULA AS CODIGO, NM_CELULA AS DESCRICAO FROM TCELULA WHERE CD_CELULA IN "&_
									"(SELECT DISTINCT CD_CELULA "&_
									"FROM TPROCESSO (NOLOCK) "&_
									"WHERE CD_GRUPO in (SELECT DISTINCT CD_GRUPO	FROM TPERMISSAO PE, TEMPRESA_NAC EN "&_
									"WHERE PE.CD_USUARIO = '"& Session("cd_usuario")&"' "&_
									"AND EN.CD_EMPRESA = PE.CD_CLIENTE) "&_
									"AND ISNULL(CD_CELULA,'') <> '' ) "
		 '******************************************	

				End Select
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Preenche o Select com os dados pesquisados na tabela
				Do While Not objrsx.Eof
%>
									<option value="<%= objrsx("CODIGO")%>"><%= Trim(objrsx("DESCRICAO"))%></option>
									<%
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do
				Loop
				objrsx.Close()
			Else
				'seleciona todas as informações para os usuários funcionários
				Select Case objrsv.Fields.Item("M10_CD_DADO").Value
					Case "0005" %><!--#include virtual="/selects/option_grupo_cliente.txt"--><%'Grupo Cliente
					Case "0006" %><!--#include virtual="/selects/option_cliente.txt"--><%'Cliente
					Case "0007" %><!--#include virtual="/selects/option_area.txt"--><%'Área
					Case "0008" %><!--#include virtual="/selects/option_subarea.txt"--><%'Sub-área
					Case "0594" %><!--#include virtual="/selects/option_celula.txt"--><%'Células
				    Case "0126" %><!--#include virtual="/selects/option_importador.txt"--><%'IMPORTADOR
				End Select
			End If
%>
								</select></td>
							<%
		Case "0009","0011","0012","0013","0017","0044","0058","0068","0085","0126","0132","0133","0136","0576","0126" 'Outros Selects
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><select class="select" style="width: <%= CStr(vl_width_form)%>px;" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);">
									<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
									<%
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				case "0009" %><!--#include virtual="/selects/option_via_transporte.txt"--><%'MODALIDADE / VIA DE TRANSPORTE
				case "0010","0011" %><!--#include virtual="/selects/option_paises.txt"--><%'PAIS DE ORIGEM / PAIS DE DESTINO
				case "0012","0013" %><!--#include virtual="/selects/option_local_embarque.txt"--><%'PORTO / AEROPORTO DE DESTINO / ORIGEM
				case "0017" %><!--#include virtual="/selects/option_canal.txt"--><%'CANAL
				case "0044" %><!--#include virtual="/selects/option_embarcacao.txt"--><%'NAVIO / EMBARCAÇÃO
				case "0058" %><!--#include virtual="/selects/option_transp_rod.txt"--><%'TRANSPORTADORA
				case "0068" %><!--#include virtual="/selects/option_armazem_atracacao.txt"--><%'ARMAZEM DE ATRACACAO
				case "0085" %><!--#include virtual="/selects/option_agente.txt"--><%'AGENTE DE CARGA
				case "0126" %><!--#include virtual="/selects/option_importador.txt"--><%'IMPORTADOR
				case "0132" %><!--#include virtual="/selects/option_armazem_estocagem.txt"--><%'ARMAZEM DE ESTOCAGEM
				case "0136" %><!--#include virtual="/selects/option_incoterm.txt"--><%'INCOTERM
				case "0576" %><!--#include virtual="/selects/option_representante.txt"--><%'REPRESENTANTE
				case "0594" %><!--#include virtual="/selects/option_celula.txt"--><%'CELULAS			
			End Select
%>
								</select></td>
								<%
		Case "0103" 'Select - processo urgente
%>
							<td height="22" align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><select class="select" style="width: 75px;" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="enterInput(this);">
									<option value="X" selected><%= tx_lang_A00023(cd_lang)%></option>
									<option value="1"><%= tx_lang_A00024(cd_lang)%></option>
									<option value="0"><%= tx_lang_A00025(cd_lang)%></option>
								</select></td>
							<%
		Case Else
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os filtros de texto simples
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>" style="width: <%= CStr(vl_width_form)%>px; text-transform: uppercase;" onFocus="enterInput(this);"></td>
							<%
				Case "1" 'exibe os filtros de datas
					dt_eventoi = "" 
					dt_eventof = ""
					If fnc_TestaVar(checked) Then
						'a data inicial será de 30 dias atrás.
						dt_eventoi = Dateadd("d", -30, Date)
						dt_eventof = Date
					End If
%>
							<td align="right"><input type="checkbox" name="filtro" id="<%= objrsv("M10_AP_FILTRO")%>X" value="<%= objrsv("M10_AP_FILTRO")%>" onClick="clickCheck(this)"<%= checked%>></td>
							<td><label for="<%= objrsv("M10_AP_FILTRO")%>X" class="label"><%= objrsv("M10_NM_DADO")%></label></td>
							<td><nobr>
								<input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>i" style="width: 70px;" maxlength="10" value="<%= fnc_Mascara(dt_eventoi, 5)%>" onFocus="enterInput(this);">
								<a href="javascript:showCal('Track<%= objrsv("M10_CD_BROKER")%>i')"><img height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle"></a>
								<input class="editbox" type="text" name="<%= objrsv("M10_AP_FILTRO")%>f" style="width: 70px;" maxlength="10" value="<%= fnc_Mascara(dt_eventof, 5)%>" onFocus="enterInput(this);">
								<a href="javascript:showCal('Track<%= objrsv("M10_CD_BROKER")%>f')"><img height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle"></a><nobr></td>
							<%
			End Select
	End Select
			
	If objrsv.RecordCount > 20 Then
		If (cont Mod 2) = 0 and cont > 1 Then
%>
						</tr>
						<%
		End If
	Else
		Response.Write("</tr>")
	End If
	
	objrsv.MoveNext
	If objrsv.Eof Then Exit Do
Loop
objrsv.Close
%>
						<tr align="center">
							<td height="20" colspan="<%= CStr(vl_colspan)%>"><%= tx_lang_A00002(cd_lang) &": "& tx_lang_A00026(cd_lang) &" DD/MM/AAAA."%></td>
						</tr>
						<tr align="center">
							<td height="35" colspan="<%= CStr(vl_colspan)%>" valign="bottom">
								<input type="hidden" name="cd_view" value="<%= cd_view%>">
								<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
								<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
								<input type="hidden" name="filtro" value="pesquisa">
								<input type="hidden" name="pesquisa" value="X">
								<input name="submit" type="submit" class="button" value=" <%= tx_lang_A00027(cd_lang)%> ">
								<input name="cancel" type="button" class="button" value=" <%= tx_lang_A00018(cd_lang)%> " onClick="javascript:document.location='/default.asp';">
							</td>
						</tr>
					</form>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
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
