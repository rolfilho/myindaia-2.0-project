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
Dim url_detalhe

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
cd_empresa = CStr(Request.QueryString("cd_empresa"))
tp_relat_rel  = Request.QueryString("tp_relat")
nr_parcial = CStr(Request.QueryString("nr_parcial"))
'seleciona os dados da view

'Response.write nr_referencia
'Response.end



url_detalhe = "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_view="&cd_view&"&nr_processo="&nr_processo&"&nr_referencia="&nr_referencia&"&cd_empresa="&cd_empresa&"&nr_item_clnte="&nr_item_clnte

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_imp_proc") &"<br>"

if objrs.State = adStateOpen then objrs.Close()
With objcmd
  .CommandTimeOut = 120
  .CommandText = Session("sql_imp_proc")
  .CommandType = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'inclui o numero do processo no nome da tela
nm_tela = nm_tela &": "& Mid(nr_processo, 5, Len(nr_processo))
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.quebra {
	border: #336699 solid 1px;
}
</style>

<script language="javascript" type="text/javascript">
<!--
function exibeResumoPrint(div, vFeatures){	
	var divResumo = document.getElementById(div);
	divResumo.style.display = 'block';
	var ajax = openAjax();
	ajax.open("POST","imp_proc_resumo_print.asp?"+vFeatures, true); 
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
}

function ExibeHistoricoDetalhe(pendencia, processo, referencia, item_cliente, parcial, empresa) {
    var img_mais = "";
    var img_menos = "";
    var img_atual = eval("document.getElementById('img_" + pendencia + "')");
    var div_atual = eval("document.getElementById('div_" + pendencia + "')");

    img_mais = new Image(13, 15);
    img_menos = new Image(13, 15);

    img_mais.src = "/imagens/icones/16x16/btn_mais20.gif";
    img_menos.src = "/imagens/icones/16x16/btn_menos20.gif";
    if (div_atual.style.display != 'block') {
        img_atual.src = img_menos.src;
        var x = screen.width;
        var y = screen.height;
        var w = 760;
        var z = 360;

        var y1 = (y / 5);
        var y2 = Math.round(y1);
        var y3 = ((y - y2) - z) / 2;
        var y4 = Math.round(y3);

        var x1 = ((x - 0) - w) / 2;
        var x2 = Math.round(x1);

        var ajax = openAjax();
        //usado o GET para que se possa usar filtros querystring
        ajax.open("POST", "/detalhe/historico_pendencia.asp?cd_pendencia=" + pendencia + "&nr_processo=" + processo + "&nr_referencia=" + referencia + "&nr_item_cliente=" + item_cliente + "&nr_parcial=" + parcial + "&cd_empresa=" + empresa, true);
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
                div_atual.innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
            }
            if (ajax.readyState == 4) { //agora exibe o que interessa
                if (ajax.status == 200) {
                    var vResult = ajax.responseText; //resultado da busca
                    vResult = vResult.replace(/\+/g, " "); //resolve problemas de acentos
                    vResult = unescape(vResult); //continua resolvendo problemas de acento
                    div_atual.innerHTML = "<br>" + vResult;
                    var scripts = div_atual.getElementsByTagName("script");
                    for (i = 0; i < scripts.length; i++) {
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
    } else {
        img_atual.src = img_mais.src;
        div_atual.innerHTML = "";
        div_atual.style.display = 'none';
    }
}

-->
</script>
</head>
<body style="overflow:auto;">
<!--#include virtual="/includes/inc_cabec_print.asp"-->
<div id="divResumoPrint" style="display:none;"></div>
<div id="divCompletoPrint" style="display:block;">
<table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr>
		<td valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
				<%
cd_campo_quebra = ""
If objrsv.RecordCount > 0 Then objrsv.MoveFirst
  
Do While Not objrsv.Eof
  If cd_campo_quebra <> Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value) Then
	  cont = 1
		Select Case Trim(objrsv.Fields.Item("M12_TP_GRUPO").Value)
			Case 0
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00050(cd_lang)%></td>
				</tr>
				<%
			Case 1
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00051(cd_lang)%></td>
				</tr>
				<%
			Case 2
%>
				<tr class="gridtop">
					<td colspan="4" class="quebra">&nbsp;<%= tx_lang_A00052(cd_lang)%></td>
				</tr>
				<%
		End Select
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
					<td>&nbsp;<%= tipo_canal(x)%>&nbsp;</td>
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
					str_refs(x) = str_refs(x) & Trim(objrsx.Fields.Item("NR_REFERENCIA").Value)
					'verifica se tem item essa referencia
					str = objrsx.Fields.Item("NR_ITEM_CLIENTE").Value
					If fnc_TestaVar(str) Then str = CInt(str) Else str = 0
					If str <> 0 Then str_refs(x) = str_refs(x) &"/"& str
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
					str_li = str_li & fnc_Mascara(objrsx.Fields.Item(nm_campo_rel), 1)
					objrsx.MoveNext 
					If objrsx.Eof Then Exit Do Else str_li = str_li &", "
				Loop
			End If
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= str_li%></td>
					<%
		Case "0283","0480","0481" 'DI, DTA, DA
			str = objrs.Fields.Item(nm_campo_rel).Value
			If fnc_TestaVar(str) Then str = Trim(str) Else str = ""
%>
					<td class="detcampo"><%= objrsv.Fields.Item("M10_NM_DADO").Value%></td>
					<td bgcolor="<%= bgcolor%>">&nbsp;<%= fnc_Mascara(str, 1)%></td>
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
cd_unid_neg = objrs.Fields.Item("CD_UNID_NEG").Value
cd_produto  = objrs.Fields.Item("CD_PRODUTO").Value

objrs.Close
%>
				<tr height="0">
					<td width="15%"></td>
					<td width="35%"></td>
					<td width="15%"></td>
					<td width="35%"></td>
				</tr>
			</table></td>
	</tr>
</table>
<!-- 
**************************************************************** 

						           HISTORICO/FOLLOW-UP

***************************************************************** 
-->
<table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr>
		<td valign="top" style="border: solid 1px #336699;">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr class="gridtop" height="16">
					<td>&nbsp;<%= tx_lang_A00053(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00033(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00034(cd_lang)%></td>
					<td>&nbsp;<%= tx_lang_A00035(cd_lang)%></td>
				</tr>
				<%
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
				
'Seleciona os dados do follow-up
If objrs.State = adStateOpen Then objrs.Close
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
%>
				<tr bgcolor="<%= bgcolor%>" height="13">
					<td><%= objrs.Fields.Item("CD_EVENTO").Value%> - <%= objrs.Fields.Item("NM_EVENTO").Value%></td>
					<td align="right"><%= fnc_Mascara( x, 5 )%>&nbsp;</td>
					<td align="center"><%= "<font color="& color &">"& z &"</font>"%></td>
					<td align="right"><%= "<font color="& color &">"& fnc_Mascara(y, 5) &"</font>"%>&nbsp;</td>
				</tr>
				<%
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
objrs.Close
%>
			</table></td>
	</tr>
<!--
**************************************************************** 

						           OBSERVACOES

*****************************************************************
-->
	<tr>
		<td valign="top" style="border: solid 1px #336699;">
			<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="2">
				<tr class="gridtop" height="16">
					<td colspan="2">&nbsp;<%= tx_lang_A00054(cd_lang)%></td>
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
%>
				<tr bgcolor="#EEEEEE">
					<td><%= str_obs%></td>
				</tr>
			</table></td>
	</tr>
    <%
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
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
print();
-->
</script>
