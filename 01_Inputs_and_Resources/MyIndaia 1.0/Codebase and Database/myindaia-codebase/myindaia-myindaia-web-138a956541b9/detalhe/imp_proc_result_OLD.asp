<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Importação
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 01/08/2006
'
'Manutenção: 01/08/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim tipo_consulta_detalhe
Dim objfso      'objeto para o sistema de arquivos
Dim sql_s       'monta o select da query com os campos a serem exibidos
Dim sql_f       'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w       'monta o where da query
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_cliente  'código do cliente
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_li      'exibe imformações da li
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim tp_relat_rel'tipo do relatorio
Dim nr_di       'numero do registro da DI no SISCOMEX
Dim in_custo
Dim sql_parcial
Dim merc_fab, str2, x2, y2, z2, color2
Dim nr_processo_des_null

function TempoDecorridoExtenso(minutos)
Dim int_dif_min, int_dif_hor, int_dif_dia, str_dif_tempo

  if minutos >= 1 then
    int_dif_min = minutos
  else
    int_dif_min = 1
  End If	
  int_dif_hor = 0
  int_dif_dia = 0
			
  if int_dif_min = 1440 then
     int_dif_dia = 1
     int_dif_min = 0
  else
    if int_dif_min > 1440 then
      int_dif_dia =  int_dif_min \ 1440
      int_dif_min =  int_dif_min mod 1440
      if int_dif_min = 60 then
         int_dif_hor = 1
         int_dif_min = 0
      else
        if int_dif_min > 60 then
           int_dif_hor = int_dif_min \ 60
           int_dif_min = int_dif_min mod 60
        end If
      end If
    else
      if int_dif_min = 60 then
         int_dif_hor = 1
         int_dif_min = 0
      else
        if int_dif_min > 60 then
           int_dif_hor = int_dif_min \ 60
           int_dif_min = int_dif_min mod 60
        end if
      end If
    end If
  end If
  str_dif_tempo = ""
  
  if int_dif_dia > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_dia) & " dia(s) "
  if int_dif_hor > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_hor) & " hora(s) "
  if int_dif_min > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_min) & " minuto(s) "
  TempoDecorridoExtenso = str_dif_tempo
end function

in_comodo = "1"
in_show = False
cd_tela = "DET003"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If Not fnc_TestaVar(cd_subm) Then cd_subm = "01"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("nr_referencia"))
nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
nr_parcial = CStr(Request.QueryString("nr_parcial"))
cd_empresa = CStr(Request.QueryString("cd_empresa"))
tp_relat_rel  = Request.QueryString("tp_relat")
Session("tp_relat_rel") = tp_relat_rel
in_custo = False
'seleciona os dados da view

in_view_campo = 1

if Session("cd_cargo") = "131" Then
flag_resumo = 1
End If
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
in_btn_excel = 0
if Session("cd_cargo") <> "131" Then
	in_btn_lupa = 1
else
	in_btn_print = 0	
End If 
Session("sql_imp_proc") = Null
If Not fnc_TestaVar(Session("sql_imp_proc")) Then
  'dados básicos do relatório
	sql_s = "SELECT PR.NR_PROCESSO, PR.CD_UNID_NEG, PR.CD_PRODUTO, PR.CD_EMBARCACAO, PR.NR_VIAGEM, PR.NR_VOO, PR.NR_CAMINHAO, "&_
					"  PR.CD_CLIENTE, SV.CD_VIA_TRANSPORTE, "
	'inicia a montagem dos campos que serão selecionados
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value & objrsv.Fields.Item("M10_TP_CONSULTA")
				Case "00","02"'String - Tabela Direto, Array
					sql_s = sql_s &_
						" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", '' ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "10" 'Datas direto de tabela
					sql_s = sql_s &_
						" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "01","11","21","31","41"'String - Lookup
					sql_s = sql_s &_
						" ( SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
						"   FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
						"   WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
						" ) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				Case "20","30","40"'Decimal, Moeda, Inteiro
					sql_s = sql_s &_
						" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		Else
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0440","0441","0442","0479" 'pis/cofins/taxa siscomex/total tributos
					sql_s = sql_s &_
						"("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End Select
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
	'tabelas da busca
  sql_f = "FROM TPROCESSO PR (NOLOCK) "&_
					"  INNER JOIN TSERVICO      SV (NOLOCK) ON (SV.CD_SERVICO  = PR.CD_SERVICO) "&_
					"  LEFT  JOIN TPROCESSO_SDA PS (NOLOCK) ON (PS.NR_PROCESSO = PR.NR_PROCESSO) "&_
					"	 LEFT  JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "
	'requisitos da pesquisa
	If not fnc_TestaVar(nr_processo) Then
		sql_w = "WHERE PR.NR_REFERENCIA = '"& nr_referencia &"' "
	Else
		sql_w = "WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
	End If
	'finaliza a construção do select do relatório e salva na Session
	sql = sql_s & sql_f & sql_w
	Session("sql_imp_proc") = sql
	'Response.write sql
	'Response.end
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_proc") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 9999
  .CommandText = Session("sql_imp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'inclui o numero do processo no nome da tela
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value
cd_cliente  = objrs.Fields.Item("CD_CLIENTE").Value
'informações para as telas de impressão e download
url = "?cd_menu="& cd_menu &_
			"&cd_subm="& cd_subm &_
			"&cd_view="& cd_view &_
			"&cd_menu_rel="& cd_menu_rel &_
			"&cd_subm_rel="& cd_subm_rel &_
			"&cd_view_rel="& cd_view_rel &_
			"&nr_processo="& nr_processo &_
			"&cd_unid_neg="& cd_unid_neg &_
			"&cd_produto="& cd_produto &_
			"&cd_cliente="& cd_cliente &_
			"&nr_parcial="& nr_parcial &_
			"&cd_empresa="& cd_empresa &_
			"&nr_referencia="& nr_referencia &_
			"&nr_item_clnte="& nr_item_clnte

If Session("exibe_detalhe") = 1 Then
	tx_path_file  = "/detalhe/imp_proc_resumo_print"
Else
	tx_path_file  = "/detalhe/imp_proc_print"
End if 

tx_path_excel = "/excel/det_import"
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->

<style type="text/css">
<!--
-->
</style>

<script language="javascript" type="text/javascript">
<!--
function abreNavio(cd_embarcacao, nr_viagem) {
	features = "top=100,left=20,width=400,height=350,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_navio_imp.asp?cd_embarcacao='+cd_embarcacao+'&nr_viagem='+nr_viagem+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win0",features);
}

function abreContainer(nr_processo) {
	features = "top=100,left=20,width=550,height=350,scrollbars=no,menubar=no,resizable=yes";
	window.open('/detalhe/cntr_processo.asp?nr_processo='+nr_processo+'&cd_menu_rel=<%= cd_menu%>&cd_subm_rel=<%= cd_subm%>&cd_view_rel=<%= cd_view%>',"win1",features);
}

function abreCargaSolta(nr_processo) {
	features = "top=100,left=20,width=350,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_carga_solta.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win2",features);
}

function abreLI(nr_processo, nrLi) {
	features = "top=20,left=20,width=750,height=550,scrollbars=yes,menubar=no";
	window.open('/detalhe/registro_li.asp?nr_processo='+nr_processo+'&nr_li='+nrLi+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win3",features);
}

function abreNotaFiscal(nr_processo) {
	features = "top=100,left=20,width=550,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_nota_fiscal_imp.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win4",features);
}
	
function abreFatComercial(nr_processo) {
	features = "top=100,left=20,width=550,height=270,scrollbars=yes,menubar=no";
	window.open('/popup/detalhe_fat_comercial.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win5",features);
}

function abreFaturamento(nr_processo) {
	features = "top=100,left=20,width=500,height=350,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_faturamento.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win6",features);
}

function abreInstDespachoCusto(nr_processo) {
	features = "top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,status=yes,resizable=no";
	window.open('/detalhe/inst_despacho_custo.asp<%=url%>',"win7",features); 
}

function abreDocs(nr_proc_des, nr_proc_adm, tp_relat) {
	features = "top=100,left=20,width=450,height=350,resizable=no";
  window.open('/detalhe/scan_docs_processo.asp?nr_proc_des='+nr_proc_des+'&nr_proc_adm='+nr_proc_adm+'&tp_relat='+tp_relat,"scan_docs_processo",features);
}

function abreParametrizacao(nr_processo, tp_relat) {
	features = "top=100,left=20,width=500,height=350,resizable=yes";
  window.open('/detalhe/imp_parametrizacao.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}

function abreStatus(nr_processo, tp_relat) {
	features = "top=100,left=20,width=750,height=550,resizable=yes";
  window.open('/detalhe/status_processo.asp?nr_processo='+nr_processo+'&tp_relat='+tp_relat,"param",features);
}

function ExibeDetalhes(titulo, vDiv, vDiv2, vDiv3, vFeatures, arquivo, width, height) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;
		var w = width;
		var z = height;
		
		var vCorpo = document.getElementById(vDiv); 
		var vInfo = document.getElementById(vDiv2); 
		var vTitulo = document.getElementById('divTitulo'); 
		var vInfoRodape = document.getElementById(vDiv3); 
		//define a posição do div e exibe na tela
		
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		var x1 = ((x-0)-w)/2;
		var x2 = Math.round(x1);
		
		
		vInfo.style.width = w;
		vInfo.style.height = 26;
		vInfo.style.left = (x2);
		vInfo.style.top = ((y4)/2)-26;
		vInfo.style.display = "block";
		vInfo.style.filter = "alpha(opacity=95)";
		vTitulo.innerHTML = "<b>" + titulo + "</b>";
					
		vCorpo.style.width = w;
		vCorpo.style.height = z;
		vCorpo.style.left = (x2);
		vCorpo.style.top = ((y4)/2)-2;
		vCorpo.style.display = "block";
		vCorpo.style.filter = "alpha(opacity=95)";
		
		vInfoRodape.style.width = w;
		vInfoRodape.style.height = 26;
		vInfoRodape.style.left = (x2);
		vInfoRodape.style.top = ((y4)/2)+z-2;
		vInfoRodape.style.display = "block";
		vInfoRodape.style.filter = "alpha(opacity=95)";

		
		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST",arquivo + ".asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vCorpo.innerHTML = vResult;
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div = document.getElementById(vDiv1);
		var div2 = document.getElementById(vDiv2);
		var div3 = document.getElementById(vDiv3);
		div.style.display = "none";
		div2.style.display = "none";
		div3.style.display = "none";
	}	
}

function mudaImagem(){
	var img_resumo = document.getElementById('imgResumo'); 
	var lupa_mais = "";
	var lupa_menos = "";
	
	lupa_mais  = new Image(60,52);
	lupa_menos = new Image(60,52);
	
	lupa_mais.src  = "/imagens/icones/32x32/btn_lupa_mais20.gif";
	lupa_menos.src = "/imagens/icones/32x32/btn_lupa_menos20.gif";
	
	if (img_resumo.src == lupa_mais.src){
		img_resumo.src = lupa_menos.src;
		img_resumo.alt = "<%= tx_lang_004072(cd_lang)%>";
		mudaExibeDetalhe('0');
	}else{
		img_resumo.src = lupa_mais.src;
		img_resumo.alt = "<%= tx_lang_004073(cd_lang)%>";
		mudaExibeDetalhe('1');
	}
}

function exibeResumo(div, vFeatures){	
	var divCorpo = document.getElementById('dv_corpo');
	var divControle = document.getElementById('divControle');
	var divResumo = document.getElementById(div);
	mudaImagem();	
	
	if (divCorpo.style.display == 'block'){	
		divCorpo.style.display = 'none';
		divResumo.style.display = 'block';
		var ajax = openAjax();
		ajax.open("POST","imp_proc_resumo.asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				divResumo.innerHTML = "<div style='position:absolute;top:40%;left:50%;'><center><img src='/imagens/icones/32x32/loading.gif'></center></div>";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					divResumo.innerHTML = vResult;
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					divResumo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete	
	}else{
		divResumo.style.display = 'none';
		divCorpo.style.display = 'block';
		window.location.reload()
	}
}


function ExibeHistoricoDetalhe(pendencia, processo, referencia, item_cliente, parcial, empresa){
	var img_mais = "";
	var img_menos = "";
	var img_atual = eval("document.getElementById('img_"+pendencia+"')");
	var div_atual = eval("document.getElementById('div_"+pendencia+"')");
	
	img_mais  = new Image(13,15);
	img_menos = new Image(13,15);
	
	img_mais.src  = "/imagens/icones/16x16/btn_mais20.gif";
	img_menos.src = "/imagens/icones/16x16/btn_menos20.gif";
	if (div_atual.style.display != 'block'){
		img_atual.src = img_menos.src;
		var x = screen.width;
		var y = screen.height;
		var w = 760;
		var z = 360;
		
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
			
		var x1 = ((x-0)-w)/2;
		var x2 = Math.round(x1);
		
		var ajax = openAjax();
			//usado o GET para que se possa usar filtros querystring
			ajax.open("POST","/detalhe/historico_pendencia.asp?cd_pendencia="+pendencia+"&nr_processo="+processo+"&nr_referencia="+referencia+"&nr_item_cliente="+item_cliente+"&nr_parcial="+parcial+"&cd_empresa="+empresa, true); 
			ajax.onreadystatechange = function() {
				if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
					div_atual.innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
				}
				if(ajax.readyState == 4) { //agora exibe o que interessa
					if(ajax.status == 200) {
						var vResult = ajax.responseText; //resultado da busca
						vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
						vResult = unescape(vResult); //continua resolvendo problemas de acento
						div_atual.innerHTML = "<br>" + vResult;
							var scripts = div_atual.getElementsByTagName("script");
							for(i = 0; i < scripts.length; i++){
								s = scripts[i].innerHTML;                        
								eval(s);                
							}
					} else {
						//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
						div_atual.innerHTML = ajax.responseText;
					}
				}
			}
			ajax.send(null); // submete
		div_atual.style.display = 'block';
	}else{
		img_atual.src = img_mais.src;
		div_atual.innerHTML = "";
		div_atual.style.display = 'none';
	}
}

-->
</script>
</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/seta.jpg';<%if Session("exibe_detalhe") = 0 Then%> <%Else%>exibeResumo('divResumo','<%= url%>');<%End If%>">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
<style type="text/css">
<!--
#apDiv1 {
	left: -320;
}
-->
</style>
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
            <div id="divResumo" class="divMainDet" style="display:none;"></div>
            <div id="dv_corpo" class="divMainDet" style="display:block;">
            <div id="divInfo" class="divInfo" style="overflow:hidden">
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="26" bgcolor="#b4c7db" >
<tr>
<td width="96%" align="center" valign="middle"><center><div id="divTitulo"></div></center></td>
<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfoCorpo','divInfoRodape','divInfo');"><img src="/imagens/icones/16x16/btn_fechar20.gif" width="18" height="17" border="0" alt="Fechar"></a>&nbsp;</td>
</tr>
</table>
 </div>
<div id="divInfoCorpo" class="divDetalhes"></div>       
<div id="divInfoRodape" class="divInfo" style="overflow:hidden">
<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td>
    </td>
    </tr>
</table>
 </div> 
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td height="100%" valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
								<%
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00050(cd_lang)%><%if Session("cd_cargo") <> "131" Then%> - <a href="#historico" class="light"><%= tx_lang_A00055(cd_lang)%></a> -
										<a href="#observacao" class="light"><%= tx_lang_A00056(cd_lang)%></a> -
										<a href="#" onClick="abreStatus('<%= nr_processo%>','<%= tp_relat%>');" class="light"><%= tx_lang_A00091(cd_lang)%></a><%End If%></td>
								</tr>
								<%
			Case 1
%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00051(cd_lang)%></td>
								</tr>
								<%
			Case 2

%>
								<tr class="gridtop">
									<td colspan="4">&nbsp;<%= tx_lang_A00052(cd_lang)%></td>
								</tr>
								<%
		End Select
		cont = 1
	End If
	cd_campo_quebra = Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
	
	If cont = 1 Then
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
								<tr bgcolor="<%= bgcolor%>">
									<%
	End If
	cont = cont + 1
	nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
	'Response.Write(nm_campo_rel)		
	Select Case objrsv.Fields.Item("M10_CD_DADO").Value
	 	Case "0003"
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= UCase(Mid(nr_processo, 5, Len(nr_processo)))%>&nbsp;</td>
									<%
		Case "0017" 'canal de liberacao
				x = objrs.Fields.Item(nm_campo_rel).Value
				If Not fnc_TestaVar(x) Then x = 4
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= "<a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat_rel &"');"">"& tipo_canal(x) &"</a>"%>&nbsp;</td>
									<%
		Case "0044"
			If objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" Then
				str = objrs.Fields.Item(nm_campo_rel).Value
				If fnc_TestaVar(str) Then str = Trim(objrs.Fields.Item(nm_campo_rel).Value)
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%>
										<%
					If fnc_TestaVar(objrs.Fields.Item("CD_EMBARCACAO").Value) and fnc_TestaVar(objrs.Fields.Item("NR_VIAGEM").Value) Then
						Response.Write("<a href=""javascript:abreNavio('"& Trim(objrs.Fields.Item("CD_EMBARCACAO").Value) &"', '"& Trim(objrs.Fields.Item("NR_VIAGEM").Value) &"');""><i>("& tx_lang_A00057(cd_lang) &")</i></a>")
					End If
%>
									</td>
									<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "04" Then
%>
									<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0141",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_VOO").Value%></td>
									<%
			ElseIf objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "07" Then
%>
									<td class="detcampo"><%= fnc_ConsultaLookup("M10_DADOS","M10_CD_DADO","0117",tx_lang_dado)%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= objrs.Fields.Item("NR_CAMINHAO").Value%></td>
									<%
			Else
				cont = cont - 1
			End If
		Case "0066" 'Tipo de Frete ( Collect/Prepaid )
			x = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(x) Then str = tipo_frete(x) Else str = tx_lang_A00068(cd_lang)
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%></td>
									<%
		Case "0084" 'Mercadoria
			'verifica se já existe as mercadorias cadastradas no processo de exportação
			If objrsx.State = adStateOpen Then objrsx.Close()
			sql = "SELECT M.CD_MERCADORIA AS CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(DM.TX_DESC_DET_MERC, ''))) AS AP_MERCADORIA "&_
						"FROM TDETALHE_MERCADORIA DM ( NOLOCK ), TMERCADORIA M ( NOLOCK ) "&_
						"WHERE DM.CD_MERCADORIA *= M.CD_MERCADORIA "&_
						"  AND DM.NR_PROCESSO = '"& nr_processo &"' "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			tipo_consulta_detalhe = 1
			
			
			If objrsx.RecordCount < 1 Then
				objrsx.Close
				sql = "SELECT I.CD_MERCADORIA AS CD_MERCADORIA, ISNULL(M.AP_MERCADORIA, ISNULL(M.NM_MERCADORIA, ISNULL(I.TX_MERCADORIA, ''))) AS AP_MERCADORIA "&_
							"FROM TPO_ITEM I (NOLOCK), TMERCADORIA M (NOLOCK) "&_
							"WHERE I.CD_MERCADORIA  *= M.CD_MERCADORIA "&_
							"  AND I.NR_PROCESSO     = '"& nr_referencia &"' "&_
							"  AND I.NR_ITEM_CLIENTE = '"& nr_item_clnte &"'"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				tipo_consulta_detalhe = 2 
				
				If objrsx.RecordCount < 1 Then
					objrsx.Close
					sql = "SELECT ISNULL( TX_MERCADORIA, '' ) AS TX_MERCADORIA, "&_
								"  ISNULL(TX_MERCADORIA, '') AS AP_MERCADORIA "&_
								"FROM TPROCESSO ( NOLOCK ) "&_
								"WHERE NR_PROCESSO = '"& nr_processo &"' "
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					tipo_consulta_detalhe = 3			
				end if
			End If
			
			str_merc = ""
			If objrsx.RecordCount > 0 Then
				'agrupa todas as referencias na string para aparecerem como hint
				Do While Not objrsx.Eof
					If tipo_consulta_detalhe <> 3 and cd_produto <> "06" Then
					str_merc = "&nbsp;"& str_merc & "<a href='#' onClick=""ExibeDetalhes('" & tx_lang_POP089(cd_lang) & "','divInfoCorpo','divInfo','divInfoRodape','cd_menu=" & cd_menu & "&cd_subm=" & cd_subm & "&cd_docto=" &  cd_docto & "&cd_empresa="& cd_empresa &"&nr_processo=" &  nr_processo & "&nr_referencia=" &  nr_referencia & "&nr_item_clnte=" &  nr_item_clnte & "&produto=01&tipo_consulta_detalhe=" &  tipo_consulta_detalhe &"&vCodMerc=" & objrsx.Fields.Item("CD_MERCADORIA").Value & "','merc_detalhe', 300, 248);"">" & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'")) & "</a>"
					Else
					str_merc = "&nbsp;"& str_merc & Trim(Replace(objrsx.Fields.Item("AP_MERCADORIA").Value, """", "'"))
					End If
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_merc = str_merc &"; "
				Loop
			Else
				str_merc = "Descrição não Disponível."
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td><%= str_merc%></td>
									<%
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
					'Response.Redirect("../import/teste.asp?var1="&x&"")
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If NOT fnc_TestaVar(str) Then str = ""
'					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0 [OCORRENCIA NO.: 0399/08]
					If str <> "" Then str_refs(x) = str_refs(x) &"/"& str
					objrsx.MoveNext
					If objrsx.Eof Then Exit Do Else str_refs(x) = str_refs(x) &"; "
				Loop
			End If
			%>
									<td class="detcampo"><%= Right(objrsv.Fields.Item("M10_NM_DADO").Value, 11)%></td>
									<td style="padding: 0px;"><table width="100%" cellpadding="0" cellspacing="0" border="0">
											<%
			if objrsx.RecordCount > 0 then
				For x = 0 To UBound(tipo_referencia)
					If Len(str_refs(x)) > 0 Then
						Response.Write("<tr><td width='60' valign='top'>&nbsp;"& tipo_referencia(x) &"</td>")
						Response.Write("<td>"& str_refs(x) &"</td></tr>")
					End If
				Next
			else
				Response.Write("<tr><td width='60' valign='top'>&nbsp;Pedido</td>")
				Response.Write("<td>"& nr_referencia&"/"&nr_item_clnte &"</td></tr>")
			end if										
%>
									</table></td>
<%
			objrsx.Close
		Case "0103","0294","0469","0470" 'sim/não campo in_urgente, in_seguro, in_entreposto e in_merc_perigosa
			str = objrs.Fields.Item(nm_campo_rel).Value
			If Not fnc_TestaVar(str) Then str = 0
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= sim_nao(str)%>&nbsp;</td>
									<%
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
					str_li = str_li &" <a href=""javascript:abreLI('"& Trim(objrs.Fields.Item("NR_PROCESSO").Value)& "','" & Trim(objrsx.Fields.Item(nm_campo_rel).Value) & "');""> "& fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1) &" </a>"
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= str_li%></td>
									<%
			objrsx.Close
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = fnc_Mascara(Trim(str), 1) Else str = ""
			If objrsv.Fields.Item("M10_CD_DADO").Value = "0283" Then 
				str = str &" <a href=""javascript:abreParametrizacao('"& nr_processo &"','"& tp_relat_rel &"');""> <i>("& tx_lang_POP056(cd_lang) &")</i></a>"
			End If
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td bgcolor="<%= bgcolor%>">&nbsp;<%= str%></td>
									<%
		Case Else 'Outros campos
			Select Case objrsv.Fields.Item("M10_TP_DADO").Value
				Case "0" 'exibe os campos de texto simples
					str = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= str%>&nbsp;</td>
									<%
				Case "1" 'exibe os campos de datas
					x = objrs.Fields.Item(nm_campo_rel).Value 
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= fnc_Mascara( x, 5 )%>&nbsp;</td>
									<%
				Case "2" 'exibe os campos com valor decimal
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "3" 'exibe os campos com valor monetário
					x = objrs.Fields.Item(nm_campo_rel).Value
					If fnc_TestaVar(x) Then x = FormatNumber( x, 2 )
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= x%>&nbsp;</td>
									<%
				Case "4" 'exibe os campos com valor inteiro
					x = objrs.Fields.Item(nm_campo_rel).Value
					'coloca espaços a frente do valor para deixar a coluna espaçada.
					Do While Len(x) < 10
						x = "#"& x
					Loop
					x = Replace(x, "#", "&nbsp;")
%>
									<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
									<td>&nbsp;<%= z%>&nbsp;</td>
									<%
			End Select
	End Select
	If cont = 3 Then
		cont = 1
%>
								</tr>
								<%
  End If
	objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
objrs.Close
%>
								<tr height="0">
									<td width="15%"></td>
									<td width="35%"></td>
									<td width="15%"></td>
									<td width="35%"></td>
								</tr>
						</table></td>
						<td valign="top" width="150"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								<%
'cria o objeto do sistema de arquivos
If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT COUNT(*) AS CONTADOR "&_
	" FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
	" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
	"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
	" WHERE PD.NR_PROCESSO   = '" & nr_processo & "'"&_
	" AND PD.IN_ATIVO      = '1' "&_
	" AND TDD.IN_ENVIA_WEB = '1' "
    objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'cria o objeto do sistema de arquivos
If	objrs.Fields.Item("CONTADOR").Value > 0 Then%>
								<tr height="100">
									<td align="center">&nbsp;<a href='#' onClick="abreDocs('<%= nr_processo %>','<%= nr_processo %>','<%= tp_relat_rel%>');"><img src="/imagens/digitalizado.gif" width="60" height="65" border="0" alt="Clique para visualizar os documentos digitalizados."><br>
										<%= tx_lang_A00058(cd_lang)%></a></td>
								</tr>
								<%
End If

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
	sql = "SELECT NR_PROCESSO_ADM"&_ 
	      " FROM TESTAGIO_PROCESSO"&_ 
          " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If Not objrs.eof then
	If Not fnc_testavar(objrs.Fields.Item("NR_PROCESSO_ADM").Value) then
		nr_processo_adm_null = 1
	End if
Else
	nr_processo_adm_null = 0
End if

If objrs.State = adStateOpen Then objrs.Close


If Session("cd_cargo") <> "131" Then

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe no processo conteiner
sql = "SELECT DISTINCT R.CD_REFERENCIA, C.NR_PROCESSO " &_
			"FROM TPROCESSO_CNTR C ( NOLOCK ) " &_
			"  INNER JOIN TREF_CLIENTE R ( NOLOCK ) ON R.NR_PROCESSO = C.NR_PROCESSO " &_
			"WHERE C.NR_PROCESSO =  '"& nr_processo &"' " &_
			"  AND C.TP_CNTR     <> '01'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe conteiner do processo/referencia
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreContainer('<%= nr_processo%>');"><img src="/imagens/container_on.gif" width="75" height="53" border="0" alt="Clique para visualizar os Cont&ecirc;iners."><br>
										<%= tx_lang_A00040(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe no processo carga solta
sql = "SELECT DISTINCT NR_PROCESSO "&_
			"FROM TPROCESSO_CARGA_SOLTA ( NOLOCK ) "&_
			"WHERE NR_PROCESSO = '"& nr_processo &"' "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Carga Solta
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreCargaSolta('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/pallet_on.gif" width="97" height="66" border="0" alt="Clique para visualizar os dados de Carga Solta."><br>
										<%= tx_lang_A00043(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe li no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_LI ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreLI('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>','');"><img src="/imagens/libera_imp_on.gif" width="32" height="32" border="0" alt="Clique para visualizar os dados da LI."><br>
										<%= tx_lang_A00063(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se existe fatura comercial no processo
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TDOCUMENTO_INSTRUCAO ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			"  AND CD_TIPO_DCTO_INSTR = '01'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFatComercial('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/nota_fiscal_on.gif" width="58" height="62" border="0" alt="Clique para visualizar os dados da Fatura Comercial."><br>
										<%= tx_lang_A00064(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se foi emitida a nota fiscal
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TPROCESSO_NF ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND IN_CANCELADO = 0"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreNotaFiscal('<%= Trim(objrs.Fields.Item("NR_PROCESSO").Value)%>');"><img src="/imagens/fatura_com_on.gif" width="62" height="65" border="0" alt="Clique para visualizar os dados da Nota Fiscal."><br>
										<%= tx_lang_A00065(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

If objrs.State = adStateOpen Then objrs.Close
'verifica se o processo ja foi faturado
sql = "SELECT DISTINCT NR_PROCESSO " &_
			"FROM TFATURAMENTO_CC ( NOLOCK ) " &_
			"WHERE NR_PROCESSO = '"& nr_processo &"' " &_
			"  AND IN_CANCELADO = 0"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'exibe Nota Fiscal, colocar NOT
If Not objrs.Eof Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreFaturamento('<%= nr_processo%>');"><img src="/imagens/fatura_on.gif" width="74" height="66" border="0" alt="Clique para visualizar os dados do Faturamento."><br>
										<%= tx_lang_A00066(cd_lang)%></a></td>
								</tr>
								<%
End If
objrs.Close

'instrução para Despacho
if objrsx.State = adStateOpen then objrsx.Close()
sql = "SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '"& cd_cliente &"'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If InStr("040;055;060", Session("cd_cargo")) > 0 Then
	If (Session("cd_cargo") = "040") and inStr("028;949;503;895", objrsx.Fields.Item("CD_GRUPO").Value) > 0 and nr_processo_des_null = 0 Then in_custo = True
Else
	If inStr("028;949;503;895", objrsx.Fields.Item("CD_GRUPO").Value) > 0 and nr_processo_des_null = 0 Then in_custo = True
End If
objrsx.Close

				If in_custo then
					'verifica se o processo ja foi faturado'
'					sql = "SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_EVENTO = '289'"
'					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
''					'exibe Nota Fiscal, colocar NOT
'					If IsDate(objrsx.Fields.Item("DT_REALIZACAO").Value) Then
%>
								<tr height="100">
									<td align="center">&nbsp;<a href="javascript:abreInstDespachoCusto('<%= nr_processo %>');"><img src="/imagens/despacho_custo.gif" alt="<%= tx_lang_A00094(cd_lang)%>" width="59" height="66" border="0"><br>
									<%= tx_lang_A00094(cd_lang)%></a></td>
								</tr>

<%
'					End If
'					objrsx.Close 
				End If

End If
%>

							</table></td>
					</tr>
				</table>
                <%if Session("cd_cargo") <> "131" Then%>
				<table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td width="50%" valign="top" style="border: solid 1px #336699;">
<!-- **************************************************************** 

						           HISTORICO/FOLLOW-UP

***************************************************************** -->
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr class="gridtop" height="16">
									<td><a name="historico"></a>&nbsp;<%= tx_lang_A00053(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00033(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00034(cd_lang)%></td>
									<td>&nbsp;<%= tx_lang_A00035(cd_lang)%></td>
								</tr>
								<%
'Seleciona os dados do follow-up

If cd_produto <> "06" Then
	sql = " AND F.NR_PROCESSO_DES = '"& nr_processo &"' "
else
	sql = ""
end if

If Not nr_processo_des_null = 1 Then
If nr_parcial <> "" or  nr_processo_adm_null = 0 Then
    If nr_parcial = "" Then
        If objrs.State = adStateOpen Then objrs.Close
        sql2 = "SELECT NR_PARCIAL, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA "&_ 
	          " FROM TESTAGIO_PROCESSO"&_ 
              " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
              if nr_referencia <> "" Then
                  sql2 = sql2 & " AND NR_REFERENCIA = '" & nr_referencia & "'"&_
                  " AND NR_ITEM_CLIENTE ='" & fnc_AddZeros(nr_item_clnte, 4) & "'"&_
                  " AND CD_EMPRESA = '" & cd_empresa & "'" &_
                  " AND NR_PARCIAL > 0" 
              End If
	    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	    objrs.Open sql2, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        nr_parcial = objrs.Fields.Item("NR_PARCIAL").Value
        nr_referencia = objrs.Fields.Item("NR_REFERENCIA").Value
        nr_item_clnte = objrs.Fields.Item("NR_ITEM_CLIENTE").Value
        cd_empresa = objrs.Fields.Item("CD_EMPRESA").Value
        If objrs.State = adStateOpen Then objrs.Close
    End If   

	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
	
	sql = "SELECT DISTINCT "&_
			"  E."& tx_lang_evento &" AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.TP_FOLLOWUP, F.NR_ORDEM "&_
			"FROM TFLP_ESTAGIO F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
			"WHERE F.CD_EMPRESA ='"&cd_empresa&"' AND F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' "& sql &_
			"  AND F.CD_EVENTO NOT IN ('022') "&_
			"  AND F.NR_ORDEM IS NOT NULL "& sql_parcial &_
			" ORDER BY F.TP_FOLLOWUP, F.NR_ORDEM"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"

    'Response.write sql
    'Response.end

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
Else
	sql_parcial = ""
	
	sql = "SELECT F.CD_EVENTO,E."& tx_lang_evento & " AS NM_EVENTO, F.CD_EVENTO, F.DT_REALIZACAO, F.DT_PREVISTA, F.IN_APLICAVEL, F.NR_ORDEM "&_
	      "FROM TFOLLOWUP F ( NOLOCK ) "&_
		  "INNER JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = F.CD_EVENTO ) "&_
          "WHERE F.NR_PROCESSO = '"& nr_processo &"' "&_
		  " ORDER BY  F.NR_ORDEM"	
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
End if
Else
If Not fnc_testaVar(nr_parcial) Then nr_parcial = "0"
	sql_parcial = " AND NR_PARCIAL = '"& nr_parcial &"' "
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


'Response.write sql
'Response.end

Do While Not objrs.Eof
    If objrs.Fields.Item("CD_EVENTO").Value = "164" and nr_processo_des_null = 0 Then
	  merc_fab = 1 
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
	  str2 = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value)			  
	  x2 = x
	  y2 = y
	  z2 = z
	  color2 = color
	  objrs.MoveNext 
	  If objrs.Eof Then Exit Do
    End if
		
    str = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value) 
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
    If objrs.Fields.Item("CD_EVENTO").Value = "289" and nr_processo_des_null = 0 Then	
	 If merc_fab = 1 then
%>        
		<tr bgcolor="#33CCFF" height="18" border=1>
		<td title="<%= str2%>"><b> <%= Left(str2, 45)%><% if Len(str2) > 45 then Response.Write("...")%></b></td>
		<td align="right"><b> <%= fnc_Mascara( x2, 5 )%>&nbsp;</b></td>
		<td align="center"><b> <%= "<font color="& color2 &">"& z2 &"</font>"%></b></td>
		<td align="right"><b> <%= "<font color="& color2 &">"& fnc_Mascara(y2, 5) &"</font>"%>&nbsp;</b></td>
		</tr>
        
<%
     merc_fab = 0
     End if
%>

		<tr bgcolor="<%= bgcolor%>" height="13">
		<td title="<%= str%>"><%= Left(str, 45)%><% if Len(str) > 45 then Response.Write("...")%></td>
		<td align="right"><%= fnc_Mascara( x, 5 )%>&nbsp;</td>
		<td align="center"><%= "<font color="& color &">"& z &"</font>"%></td>
		<td align="right"><%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</td>
		</tr>
<%
   Else
       if objrs.Fields.Item("CD_EVENTO").Value = "164" and nr_processo_des_null = 0 Then	
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "SELECT "&_
			"  F.RLZ_DT_EV164 AS DT_REALIZACAO, F.PVT_DT_EV164 AS DT_PREVISTA, F.IN_DT_EV164 AS IN_APLICAVEL "&_
			"  FROM TFLP_IMPORT F ( NOLOCK ) "&_
			"  LEFT JOIN TEVENTO E ( NOLOCK ) ON ( E.CD_EVENTO = '164' ) "
			if nr_parcial = "" Then
			sql = sql &  "  WHERE F.NR_PROCESSO_DES = '"& nr_processo&"'"
			Else
			sql = sql & "  WHERE F.NR_REFERENCIA = '"&nr_referencia&"' AND F.NR_ITEM_CLIENTE = '"&fnc_AddZeros(nr_item_clnte, 4)&"' AND F.NR_PARCIAL = '"& nr_parcial &"' AND F.CD_EMPRESA = '"& cd_empresa &"'"
			End IF
	
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		
		
		x = objrsx.Fields.Item("DT_PREVISTA").Value
		y = objrsx.Fields.Item("DT_REALIZACAO").Value
		w = objrsx.Fields.Item("IN_APLICAVEL").Value
		
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
	  str = objrs.Fields.Item("CD_EVENTO").Value&" - "&Trim(objrs.Fields.Item("NM_EVENTO").Value)			  
	  x = x
	  y = y
	  z = z
	  color = color
	  objrsx.Close()
%>     
		<tr bgcolor="#33CCFF" height="18" border=1>
		<td title="<%= str%>"><b> <%= Left(str, 45)%><% if Len(str) > 45 then Response.Write("...")%></b></td>
		<td align="right"><b> <%= fnc_Mascara( x, 5 )%>&nbsp;</b></td>
		<td align="center"><b> <%= "<font color="& color &">"& z &"</font>"%></b></td>
		<td align="right"><b> <%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</b></td>
		</tr>
    
	   <%
       else
       %>
		<tr bgcolor="<%= bgcolor%>" height="13">
		<td title="<%= str%>"><%= Left(str, 45)%><% if Len(str) > 45 then Response.Write("...")%></td>
		<td align="right"><%= fnc_Mascara( x, 5 )%>&nbsp;</td>
		<td align="center"><%= "<font color="& color &">"& z &"</font>"%></td>
		<td align="right"><%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</td>
		</tr>
<% 
end if 
  End if	
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
x = (objrs.RecordCount * 14) - 3
objrs.Close
%>
							</table></td>
						<td width="50%" valign="top" style="border: solid 1px #336699;">
<!-- **************************************************************** 

						           OBSERVACOES

***************************************************************** -->
							<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="2">
								<tr class="gridtop" height="16">
									<td colspan="2">&nbsp;<a name="observacao"></a><%= tx_lang_A00054(cd_lang)%></td>
								</tr>
								<%
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
sql = sql & " ORDER BY TP_OBS"
'Response.write sql
'Response.end
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
If Not fnc_TestaVar(str_obs) Then str_obs = "" 'Else str_obs = Replace(x, vbcrlf, "<br>")
'Response.write str_obs
'response.end
%>
								<tr bgcolor="#EEEEEE">
									<td height="<%= x%>">
                                    <%if Session("cd_cargo") <> "131" Then%>
                                    <div style="overflow:auto;height:<%= x%>" ><%= Replace(Replace(str_obs, "'", "´"), vbcrlf, "<br>")%></div>                                   
									<%End If%>
                                    </td>
								</tr>
							</table></td>
					</tr>
                    </table>
                    <% 
					End If
	
					if not fnc_TestaVar(nr_processo) Then 
						nr_processo_pendencia = "X" 
						nr_referencia_pendencia = nr_referencia
						nr_item_cliente_pendencia = nr_item_clnte
						nr_parcial_pendencia = nr_parcial
						cd_empresa_pendencia = cd_empresa
					Else 
						nr_processo_pendencia = nr_processo
						nr_referencia_pendencia = "X" 
						nr_item_cliente_pendencia = "X"
						nr_parcial_pendencia = 0
						cd_empresa_pendencia = "X"
					End If			
					
			If objrs.State = adStateOpen Then objrs.Close					
			sql = "SELECT DISTINCT CONVERT(VARCHAR,MAX(PL.DT_TEXTO),103)+ ' ' + CONVERT(VARCHAR,MAX(PL.DT_TEXTO),108) AS DT_ULTIMA, U.NM_USUARIO AS NM_USUARIO, P.NM_PENDENCIA AS NM_PENDENCIA, P.NR_PROCESSO AS NR_PROCESSO, PL.CD_PENDENCIA AS CD_PENDENCIA, DATEDIFF(MINUTE,  ISNULL(P.DT_SOLICITACAO,P.DT_PRIMEIRA_SOLICITACAO), ISNULL(DT_RESPOSTA_SOLICITA,GETDATE())) AS DIFERENCA, DATEDIFF(MINUTE,  P.DT_PRIMEIRA_SOLICITACAO, ISNULL(P.DT_FINALIZACAO, GETDATE())) AS DIFERENCA2, SP.NM_STATUS, P.CD_STATUS "&_
			" FROM TPROCESSO_PENDENCIAS P "&_
			" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL ON (P.CD_PENDENCIA = PL.CD_PENDENCIA AND P.NR_PROCESSO = PL.NR_PROCESSO AND P.NR_REFERENCIA = PL.NR_REFERENCIA AND P.NR_ITEM_CLIENTE = PL.NR_ITEM_CLIENTE AND P.NR_PARCIAL = PL.NR_PARCIAL AND P.CD_EMPRESA = PL.CD_EMPRESA) "&_
			" INNER JOIN TTP_STATUS_PENDENCIAS SP ON (SP.CD_STATUS = P.CD_STATUS) "&_
			" LEFT JOIN TUSUARIO U ON (U.CD_USUARIO = P.CD_USUARIO_SOLICITANTE) "&_
			" WHERE P.NR_PROCESSO = '" & nr_processo_pendencia & "' "&_
			" AND P.NR_REFERENCIA = '" & nr_referencia_pendencia & "'" &_
			" AND P.NR_ITEM_CLIENTE = '" & nr_item_cliente_pendencia & "'" &_
			" AND P.NR_PARCIAL = " & nr_parcial_pendencia & " " &_
			" AND P.CD_EMPRESA = '" & cd_empresa_pendencia & "'" &_
			"  AND P.IN_ATIVO = '1' "&_
			"GROUP BY P.CD_PENDENCIA, U.NM_USUARIO, P.NM_PENDENCIA, P.NR_PROCESSO, PL.CD_PENDENCIA, P.DT_PRIMEIRA_SOLICITACAO, P.DT_FINALIZACAO, DT_SOLICITACAO, DT_RESPOSTA_SOLICITA, SP.NM_STATUS, P.CD_STATUS "
			
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

			If objrs.RecordCount > 0 Then
			
			%>
			<div id='divControle'>
          <table width="100%" border="0" cellspacing="2" cellpadding="0">
						<tr>
							<td valign="top">
                          <br>
                    <b> Controle de Pendências </b>
                    <br>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #336699;">
		<tr class="gridtop" height="16">
        								<td style="text-align:center;">&nbsp;</td>
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP101(cd_lang)%></td>
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP102(cd_lang)%></td>
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP103(cd_lang)%></td>
                                        <td style="text-align:center;">&nbsp;Solicitação Pendente</td>
                                        <td style="text-align:center;">&nbsp;Tempo Total</td>
                                        <td style="text-align:center;">&nbsp;Status</td>
		</tr>
			
			<%
			Do While Not objrs.Eof	
			If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"	
					%>
          <tr bgcolor="<%= bgcolor%>" height="18px">	
          		<td width="30px " style="text-align:left;">&nbsp;<img src="/imagens/icones/16x16/btn_mais20.gif"  border="0" alt="Ver histórico" align="absmiddle" height="13" width="15" style="cursor:pointer" onClick="ExibeHistoricoDetalhe('<%= objrs.Fields.Item("CD_PENDENCIA").Value%>','<%= nr_processo_pendencia%>','<%= nr_referencia_pendencia%>','<%= nr_item_cliente_pendencia%>', '<%= nr_parcial_pendencia %>', '<%= cd_empresa_pendencia%>');" id="img_<%= objrs.Fields.Item("CD_PENDENCIA").Value%>"></td>
				<td width="130px " style="text-align:left;">&nbsp;<%= objrs.Fields.Item("DT_ULTIMA").Value%></td>
				<td width="140px" style="text-align:left;">&nbsp;<%= objrs.Fields.Item("NM_PENDENCIA").Value%></td>	
				<td width="140px" style="text-align:left;">&nbsp;<%= objrs.Fields.Item("NM_USUARIO").Value%></td>
                <% If objrs.Fields.Item("CD_STATUS") = "5" Then%>
                <td width="200px" style="text-align:left;">&nbsp;-</td>
                <td width="200px" style="text-align:left;">&nbsp;-</td>
                <%Else if objrs.Fields.Item("CD_STATUS") = "4" Then%>
                <td width="200px" style="text-align:left;">&nbsp;-</td>
                <%Else%>
                <td width="200px" style="text-align:left;">&nbsp;<%= TempoDecorridoExtenso(objrs.Fields.Item("DIFERENCA").Value)%></td>
                <%End If%>
                <td width="200px" style="text-align:left;">&nbsp;<%= TempoDecorridoExtenso(objrs.Fields.Item("DIFERENCA2").Value)%></td>
                <%End If%>
                <td width="130px " style="text-align:left;">&nbsp;<%= objrs.Fields.Item("NM_STATUS").Value%></td>
			</tr>
            <tr bgcolor="<%= bgcolor%>">
            <td colspan="7">
            <div id="div_<%= objrs.Fields.Item("CD_PENDENCIA").Value%>" style="display:none;">
            </div>
            </td>
            </tr>
           <%
		   objrs.MoveNext
		   if objrs.Eof then exit do
		   Loop
		   %>   
           </table> 
                      </td>
           </tr>
           </table>
           </div>
           <%End If%>
           </div>     
		<br>
        <br>		
			<!-- :::::::::: FIM DO CORPO CENTRAL     :::::::::: -->
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
<%if Session("cd_cargo") <> "131" Then%>

<%End If%>
<script language="javascript" type="text/javascript">
<!--

-->
</script>
<!--#include virtual="/includes/inc_ends.asp"-->