<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'-----------------------------------------------------------------------------------------------------------------------------------
'Descrição: Filtros do Relatório
'Autor: Alexandre Gonçalves Neto - Data: 14/09/2007
'Manutenção(nome, data - alteração, versão):
'1. Alexandre, 14/09/2007 - reformulação da página, v2.0.0
'2.
'-----------------------------------------------------------------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vNmObj
dim vDtObj : vDtObj = ""

in_show = true
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_view = Request.QueryString("cd_view")
tx_erro = Request.QueryString("tx_erro")
in_view_filtro = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<%
'nome da tela
nm_tela = nm_menu &" &gt;&gt; "& nm_subm &" &gt;&gt; "
if (cd_menu = "01" or cd_menu = "02") and cd_subm = "03" then
	nm_tela = nm_tela & fnc_ConsultaLookup("M10_DADOS","M10_CD_BROKER",cd_evento,tx_lang_dado)
else
	nm_tela = nm_tela & nm_view
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="calendar.css" />
<script type="text/javascript" src="filtros.js"></script>
<script type="text/javascript" src="calendar.js"></script>
<script type="text/javascript" src="lang/calendar-br.js"></script>
<script type="text/javascript" src="calendar-setup.js"></script>
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
			<div id="divFiltros" class="divMainTop">
				<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
					<form name="frmFiltros" method="post" action="/<%= ap_menu%>/<%= ap_subm%>_busca.asp" onSubmit="return ValidaFiltros()">
						<input type="hidden" name="cd_view" value="<%= cd_view%>">
						<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
						<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
						<tr height="50">
							<td colspan="3" align="center"><font size="2"><b>..::: <%= tx_lang_A00020(cd_lang)%> :::..</b></font><br>
								<a href="/personaliza/cad_view.asp?in_acao=editar&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>"><%= tx_lang_A00005(cd_lang) &" "& tx_lang_A00021(cd_lang)%>.</a>
								<!--<a href="/personaliza/view.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_view=<%= cd_view%>&vTpAcao=editar"><%= tx_lang_A00005(cd_lang) &" "& tx_lang_A00021(cd_lang)%>.</a>--></td>
						</tr>
						<%
do while not objrsv.Eof
	checked = ""
	if objrsv.Fields.Item("M11_IN_CHECK").Value  then checked = " checked"
	if objrsv.Fields.Item("M13_IN_PADRAO").Value then checked = " checked"
	'configuração de checkbox
	disabled = ""
	if objrsv.Fields.Item("M10_CD_DADO").Value = "0078" then disabled = " disabled"
		
	vNmObj = objrsv.Fields.Item("M10_AP_FILTRO").Value
%>
						<tr height="24">
							<td align="right"><input type="checkbox" name="filtro" id="<%= vNmObj%>X" value="<%= vNmObj%>" desc="<%= objrsv.Fields.Item("M10_NM_DADO").Value%>" onClick="MarcaFiltro(this);"<%= checked & disabled%>></td>
							<td><label for="<%= vNmObj%>X" class="label"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></label></td>
							<td><nobr>
							<%
	select case objrsv.Fields.Item("M10_CD_DADO").Value
		case "0001" 'Selects - Unidade
%>
							<select class="select" style="width: 300px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<option value="01"<%if Session("cd_unid_neg") = "01" then Response.Write(" selected")%>>Indaiá Logística Internacional Ltda.</option>
								<option value="02"<%if Session("cd_unid_neg") = "02" then Response.Write(" selected")%>>Indaiá Rio Logística Ltda.</option>
								<%
			if Session("cd_cargo") = "001" then
%>
								<option value="03"<%if Session("cd_unid_neg") = "03" then Response.Write(" selected")%>>MyIndaiá (desenvolvimento)</option>
								<%
			end if
%>
							</select>
							<%
		case "0002" 'Produto
%>
              <select class="select" style="width: 300px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<%
			if cd_menu = "01" or cd_menu = "06" then
%>
								<option value="01"<%if Session("cd_produto") = "01" then Response.Write(" selected")%>>Importação</option>
								<%
			end if
			if cd_menu = "02" or cd_menu = "06" then
%>
								<option value="02"<%if Session("cd_produto") = "02" then Response.Write(" selected")%>>Exportação</option>
								<%
			end if
			if cd_menu = "01" then
%>
								<option value="06"<%if Session("cd_produto") = "06" then Response.Write(" selected")%>>Administração de Pedido</option>
								<%
			end if
%>
							</select>
              <%
		case "0005","0006","0007","0008" 'Selects - Grupo, Clientes, Área e Sub-área
%>
							<select class="select" style="width: 300px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<%
			if InStr(CODCLIENTE, Session("cd_cargo")) > 0 then
				'selecionas apenas os dados que o usuário cliente tem permissão
				select case objrsv.Fields.Item("M10_CD_DADO").Value
					case "0005" 'SELECIONA O NOME DOS GRUPOS DE EMPRESAS DO CLIENTE
						sql = "SELECT DISTINCT G.CD_GRUPO, G.NM_GRUPO " &_
									"FROM TGRUPO G (NOLOCK) " &_
									"  INNER JOIN TEMPRESA_NAC E (NOLOCK) ON (G.CD_GRUPO = E.CD_GRUPO) " &_
									"  INNER JOIN TPERMISSAO   P (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMPRESA) " &_
									"WHERE P.CD_USUARIO = '"& Session("cd_usuario") &"' AND E.IN_ATIVO = 1 AND E.IN_CLIENTE = 1 "&_
									"ORDER BY G.NM_GRUPO"
					case "0006" 'SELECIONA O NOME DAS EMPRESAS CLIENTE
						sql = "SELECT DISTINCT E.CD_EMPRESA, E.NM_EMPRESA " &_
									"FROM TEMPRESA_NAC E (NOLOCK) " &_
									"  INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMPRESA) " &_
									"WHERE P.CD_USUARIO = '"& Session("cd_usuario") &"' AND E.IN_ATIVO = 1 AND E.IN_CLIENTE = 1 "&_
									"ORDER BY E.NM_EMPRESA"
					case "0007" 'SELECIONA TODAS AS AREAS
						sql = "SELECT A1.NM_GRUPO, A1.NM_GRUPO " &_
									"FROM TAREA A1 (NOLOCK) " &_
									"  INNER JOIN TPERMISSAO_AREA P (NOLOCK) ON (P.CD_AREA = A1.CD_AREA) " &_
									"WHERE P.CD_USUARIO = '"& Session("cd_usuario") &"' " &_
									"GROUP BY A1.NM_GRUPO"
					case "0008" 'SELECIONA TODAS AS SUB-AREAS
						sql = "SELECT A.CD_AREA, A.NM_AREA " &_
									"FROM TAREA A (NOLOCK) " &_
									"  INNER JOIN TPERMISSAO_AREA P (NOLOCK) ON (P.CD_AREA = A.CD_AREA) " &_
									"WHERE P.CD_USUARIO = '"& Session("cd_usuario") &"' " &_
									"ORDER BY A.NM_AREA"
				end Select
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				'Preenche o Select com os dados pesquisados na tabela
				if objrsx.RecordCount > 0 then
					do while not objrsx.Eof
	%>
									<option value="<%= objrsx.Fields.Item(0).Value%>"><%= Trim(objrsx.Fields.Item(1).Value)%></option>
									<%
						objrsx.MoveNext
						if objrsx.Eof then exit do
					loop
				else
					tx_erro = tx_erro&"\n - falha ao montar filtros;"
				end if
				objrsx.Close()
			else
				'seleciona todas as informações para os usuários funcionários
				select case objrsv.Fields.Item("M10_CD_DADO").Value
					case "0005" %><!--#include virtual="/selects/option_grupo_cliente.txt"--><%'Grupo Cliente
					case "0006" %><!--#include virtual="/selects/option_cliente.txt"--><%'Cliente
					case "0007" %><!--#include virtual="/selects/option_area.txt"--><%'Área
					case "0008" %><!--#include virtual="/selects/option_subarea.txt"--><%'Sub-área
				end select
			end if
%>
							</select>
							<%
		case "0009","0010","0011","0012","0013","0017","0044","0058","0062","0068","0069","0085","0088","0126","0132","0133","0136","0177","0182","0290","0296","0297","0576" 'Outros Selects
%>
							<select class="select" style="width: 300px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<%
			select case objrsv.Fields.Item("M10_CD_DADO").Value
				case "0009" %><!--#include virtual="/selects/option_via_transporte.txt"--><%'MODALIDADE / VIA DE TRANSPORTE
				case "0010","0011" %><!--#include virtual="/selects/option_paises.txt"--><%'PAIS DE ORIGEM / DESTINO
				case "0012","0013" %><!--#include virtual="/selects/option_local_embarque.txt"--><%'PORTO / AEROPORTO DE DESTINO / ORIGEM
				case "0017" %><!--#include virtual="/selects/option_canal.txt"--><%'CANAL
				case "0044" %><!--#include virtual="/selects/option_embarcacao.txt"--><%'NAVIO / EMBARCAÇÃO
				case "0058" %><!--#include virtual="/selects/option_transp_rod.txt"--><%'TRANSPORTADORA
				case "0062" %><!--#include virtual="/selects/option_fornec_imp.txt"--><%'FORNECEDOR
				case "0068" %><!--#include virtual="/selects/option_armazem_atracacao.txt"--><%'ARMAZEM DE ATRACACAO
				case "0069" %><!--#include virtual="/selects/option_armazem_descarga.txt"--><%'ARMAZEM DE DESCARGA
				case "0085" %><!--#include virtual="/selects/option_agente.txt"--><%'AGENTE DE CARGA
				case "0088" %><!--#include virtual="/selects/option_familia_prod_exp.txt"--><%'FAMILIA DE MERCADORIA
				case "0126" %><!--#include virtual="/selects/option_importador.txt"--><%'IMPORTADOR
				case "0132" %><!--#include virtual="/selects/option_armazem_estocagem.txt"--><%'ARMAZEM DE ESTOCAGEM
				case "0133" %><!--#include virtual="/selects/option_export_nac.txt"--><%'EXPORTADOR
				case "0136" %><!--#include virtual="/selects/option_incoterm.txt"--><%'INCOTERM
				case "0177" %><!--#include virtual="/selects/option_analista_indaia.txt"--><%'ANALISTA INDAIA
				case "0182" %><!--#include virtual="/selects/option_analista_cliente.txt"--><%'ANALISTA CLIENTE
				case "0290" %><!--#include virtual="/selects/option_urf.txt"--><%'URF DE DESPACHO
				case "0296" %><!--#include virtual="/selects/option_exportador.txt"--><%'EXPORTADOR
				case "0297" %><!--#include virtual="/selects/option_import_nac.txt"--><%'IMPORTADOR
				case "0576" %><!--#include virtual="/selects/option_representante.txt"--><%'REPRESENTANTE
			end select
%>
							</select>
							<%
		case "0031","0089","0103","0294","0553" 'lead-time, faturados, urgente, seguro, di retificada
%>
              <select class="select" style="width: 75px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00023(cd_lang)%></option>
								<option value="1"><%= tx_lang_A00024(cd_lang)%></option>
								<option value="0"><%= tx_lang_A00025(cd_lang)%></option>
							</select>
              <%
		case "0032","0077","0090" 'dias úteis, situação, desepesas
%>
              <select class="select" style="width: 75px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="0"><%= tx_lang_A00025(cd_lang)%></option>
								<option value="1" selected><%= tx_lang_A00024(cd_lang)%></option>
							</select>
              <%
		case "0078" 'status
%>
							<select class="select" style="width: 75px;" name="<%= objrsv("M10_AP_FILTRO")%>" onFocus="EntraDados(this);" disabled>
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<option value="0"><%= tx_lang_EXP003(cd_lang)%></option>
								<option value="1"><%= tx_lang_EXP004(cd_lang)%></option>
								<option value="2"><%= tx_lang_EXP005(cd_lang)%></option>
							</select>
              <%
		case "0289" 'tipo de pedido
%>
							<select class="select" style="width: 75px;" name="<%= vNmObj%>" onFocus="EntraDados(this);">
								<option value="X" selected><%= tx_lang_A00022(cd_lang)%></option>
								<%
			for cont = 0 to UBound(tipo_pedido)
%>
								<option value="<%= cont + 1%>"><%= tipo_pedido(cont)%></option>
								<%
			next
%>
							</select>
							<%
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "0" 'exibe os filtros de texto simples
%>
							<input class="editbox" type="text" name="<%= vNmObj%>" style="width: 300px; text-transform: uppercase;" onFocus="EntraDados(this);">
							<%
				case "1" 'exibe os filtros de datas
					dt_eventoi = "" 
					dt_eventof = ""
					if fnc_TestaVar(checked) then
						'a data inicial será de 30 dias atrás.
						dt_eventoi = Dateadd("d", -30, Date)
						dt_eventof = Date
					end If
					vDtObj = vDtObj&"'"&vNmObj&"',"
%>
						
							<input name="<%= vNmObj%>i" type="text" class="editbox" id="<%= vNmObj%>i" style="width: 70px;" onFocus="EntraDados(this);" onBlur="ValidaData(this.value, this);" onChange="EntraDados(this);" onKeyPress="return(MascaraData(this,'/',event));" value="<%= fnc_Mascara(dt_eventoi, 5)%>" />
							<img id="btn<%= vNmObj%>i" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle">
							<input name="<%= vNmObj%>f" type="text" class="editbox" id="<%= vNmObj%>f" style="width: 70px;" onFocus="EntraDados(this);" onBlur="ValidaData(this.value, this);" onChange="EntraDados(this);" onKeyPress="return(MascaraData(this,'/',event));" value="<%= fnc_Mascara(dt_eventof, 5)%>" />
							<img id="btn<%= vNmObj%>f" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="middle">
							<%
			end select
	end select
%>
						</nobr></td></tr>
						<%
	objrsv.MoveNext
	if objrsv.Eof then exit do
loop
objrsv.Close
if Len(vDtObj) > 0 then vDtObj = Left(vDtObj, Len(vDtObj)-1)
%>
						<tr height="20">
							<td colspan="3" align="center"><%= tx_lang_A00002(cd_lang) &": "& tx_lang_A00026(cd_lang) &" DD/MM/AAAA."%></td>
						</tr>
						<tr height="35">
							<td colspan="3" align="center" valign="bottom">
								<input type="hidden" name="filtro" value="pesquisa"><input type="hidden" name="pesquisa" value="X"><%'isto aqui é gambiarra%>
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
<script type="text/javascript">
var vDtObj = new Array(<%= vDtObj%>);

if (vDtObj.length > 0) {
	for(i = 0; i < vDtObj.length; i++) {
		Calendar.setup({inputField:vDtObj[i]+"i",button:"btn"+vDtObj[i]+"i"});
		Calendar.setup({inputField:vDtObj[i]+"f",button:"btn"+vDtObj[i]+"f"});
	}
}
</script>
<!--#include virtual="/includes/inc_ends.asp"-->