
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Importação / Tracking
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 28/06/2005
'
'Manutenção: 01/08/2006
'backup: track_result[cabecalho].asp
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<%
Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim objfso 'objeto para o sistema de arquivos
Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim pagina 'pagina inicial da ordenação
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim in_proc_adm 'verifica se existe o numero do processo de administração
Dim in_proc_des 'verifica se existe o numero do processo de desembaraço
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim txTitle     'guarda titulos de celulas
dim txLinkProcesso 'link para o detalhe de processo
dim Descontos,chk_frete,chk_seguro,check_Fob,tx_dolar,tx_mle ' variáveis para checagem de calculos FOB
dim Deadline
dim dt_inicial, dt_final
Dim dados_ordem, dados_ordem_total, cont_ordem_total, tx_dados_ordem, tipo_ordem_total
Dim data_dif_inicial, data_dif_final
Dim cd_produto_viagem, cd_unid_viagem, cd_viagem_viagem, cd_emb_viagem, dt_esperada_viagem, dt_entrada_viagem, dt_atual_viagem, cd_armazem_viagem

in_comodo = "1"
in_show  = False
cd_tela  = "IMP003"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
cd_produto = Request.QueryString("cd_produto")
nr_data  = Request.QueryString("nr_data")
tx_erro  = Request.QueryString("tx_erro")
ap_filtros = Replace(Request("filtro"),", ","','")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Session("tp_exibir") = 2
Session("tp_exibir2") = 2

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<%
Session("sql_viagem") = Null
If Not fnc_TestaVar(Session("sql_viagem")) Then
  'dados básicos do relatório
  
  sql_s = "SELECT DISTINCT V.CD_UNID_NEG AS CD_UNID_NEG, V.CD_PRODUTO AS CD_PRODUTO, V.CD_EMBARCACAO AS CD_EMBARCACAO, V.NR_VIAGEM AS CD_VIAGEM, "&_
	"V.CD_ARMAZEM_ATRACACAO, E.NM_EMBARCACAO AS NM_EMBARCACAO, V.CD_LOCAL, LE.NM_LOCAL_EMB AS LOCAL_EMB,  "
	
  sql_f =  "FROM BROKER.DBO.TVIAGEM V "&_
	"INNER JOIN TEMBARCACAO E ON (E.CD_EMBARCACAO = V.CD_EMBARCACAO) "&_
	"INNER JOIN TPROCESSO PR ON (PR.CD_EMBARCACAO = V.CD_EMBARCACAO AND PR.NR_VIAGEM = V.NR_VIAGEM AND "&_
	"(CASE PR.CD_UNID_NEG WHEN '07' THEN '01' ELSE PR.CD_UNID_NEG END) = V.CD_UNID_NEG AND PR.CD_PRODUTO = V.CD_PRODUTO) "&_
	"INNER JOIN TLOCAL_EMBARQUE LE ON (LE.CD_LOCAL_EMB = V.CD_LOCAL) "
	
   sql_w = " WHERE V.DT_ESPERADA BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103),103)-3 AND GETDATE()+11 "&_
	" AND V.CD_PRODUTO = '" & cd_produto & "'" 
		
   sql_o = "ORDER BY "
		
  sql_o = sql_o &" V.CD_LOCAL ASC, V.DT_ESPERADA "
  	'inicia a montagem dos campos que serão selecionados
				
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst

	Do While Not objrsv.Eof
		If objrsv.Fields.Item("M12_IN_MONTA_SQL").Value Then
			'Tabela Direto
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "0" Then
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0","5" 'String/Text
						sql_s = sql_s &" ISNULL("&objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value&",'') AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "1" 'Datetime
							sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS RLZ_"& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
					Case "2","3","4","6" 'Decimal/Moeda/Inteiro
						sql_s = sql_s &" ISNULL("& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &", 0) AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
				End Select
			End If
			'Lookup
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "1" Then
				sql_s = sql_s &_
								"(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &" (NOLOCK) "&_
								"  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'Array
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "2" Then
				sql_s = sql_s &" "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &" AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'INNER JOIN
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "3" Then
				sql_s = sql_s &_
								"(SELECT TOP 1 "& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								"  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
								"  WHERE "& objrsv.Fields.Item("M10_NM_CHAVE").Value &" = "& objrsv.Fields.Item("M12_NM_CH_ORIGEM").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
			'INNER JOIN SEM WHERE
			If objrsv.Fields.Item("M10_TP_CONSULTA") = "4" Then
			sql_s = sql_s &_
								"(SELECT TOP 1 UPPER("& objrsv.Fields.Item("M10_NM_DESCRICAO").Value &_
								")  FROM "& objrsv.Fields.Item("M10_NM_TABELA").Value &_
								") AS "& objrsv.Fields.Item("M10_AP_CAMPO").Value &", "
			End If
		End If
		objrsv.MoveNext
		If objrsv.Eof Then
			sql_s = Left( sql_s, Len(sql_s)-2 ) &" "
			Exit Do
		End If
	Loop
		'Response.Redirect("teste.asp?var1="&sql_s & sql_f & sql_w & sql_o&"")

	'finaliza a construção do select do relatório e salva na Session
	Session("sql_viagem") = sql_s & sql_f & sql_w & sql_o
End If
Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_viagem") &"<br>"
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = Session("sql_viagem")
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly
'realiza busca de pedido, caso seja solicitado
'Response.Redirect("teste.asp?var1="&Session("sql_imp_track")&"")
'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
If objrsv.Eof Then objrsv.MoveFirst
'cria o objeto do sistema de arquivos
Set objfso = Server.CreateObject("Scripting.FileSystemObject")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->


<style type="text/css" media="print">
.TabelaPrincipal {overflow: visible;	}
table>tbody		 {overflow: visible; text-align: center;}
td				 {height: 14pt;} 
thead td		 {font-size: 11pt;	text-align: left;}
tfoot td	
{
	text-align: center;
	font-size: 9pt;
	border-bottom: solid 0px ;
}
thead			 {display: table-header-group;	}
tfoot			 {display: table-footer-group;	}
thead th, thead td	{position: static;
 } 

thead tr		 {position: static; } /*prevenir problemas se imprimir depois da table com scroll*/ 
table tfoot tr	 {position: static;}
</style>

<!--Estilo para exibir a página-->
<style type="text/css">
/*BODY
{ 
	background: #FFFFFF; 
	color: #378CEA; 
	font-family: Arial; 
	font-size: 9pt; 
	text-decoration: none
}*/
.TabelaPrincipal 
{
	overflow: auto;
	margin: auto;
	border-color:#FFFFFF
}
td {text-align:left;
	border:#FFFFFF;
}
th 
{
	vertical-align:baseline;
	background-color:#336699;
	border-style: solid;
	color:#FFFFFF;
	border-color: #FFFFFFF;
	border-width: 0px;
	white-space:nowrap;
	vertical-align:middle;
	padding:0px;
}
/*.true 
{
	color:#002034;
	background-color:#F4FFF4;
}
.false {
	color:#441000;
	background-color:#FFF4F4;
}
table {
	margin:0em;
	font-family: Arial; 
	font-size: 9pt;
}
.fn {
	text-align:left;
	color:#B00000;
	}
.ob {
	color:#AA6500;
}
.st {
	color:#0000DD;
}
.nm {
	color:#006000;
	}
.bl{
	color:#003444;
	background-color:#E5E5E5;
}
.un {
	color:#666666;
}
*/.tableBoxOuter {
	width:100%;
	height:100%; /*Determina o tamanho da planilha*/
}
</style>
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0"  class="table">
  <tr valign="top">
    <td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header2.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
<style type="text/css">
<!--
#apDiv1 {
	visibility: hidden;
}
-->
#apDiv3 {
	visibility: hidden;
}

#apDiv4 {
	visibility: hidden;
}



</style>

      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
	<tr>
    <td valign="top"><div id="dv_corpo" class="divMainMid" style="left:1px;top:116px">
<table id="TabelaPrincipal" width="100%"  border="0" cellspacing="0" cellpadding="0" style="padding: 0px 1px 0px 1px;">

<%
dim vTxLinha(1), vInRowspan
vTxLinha(0) = ""
vTxLinha(1) = ""
vInRowspan = false
nr_cols = 0
'move para o primeiro registro da personalização e exibo o cabeçalho personalizado
objrsv.MoveFirst
Do While Not objrsv.Eof
	select case objrsv.Fields.Item("M10_CD_DADO").Value
		case "0118"
			vTxLinha(0) = vTxLinha(0) &"<th colspan='3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
			vTxLinha(1) = vTxLinha(1) &"<th>"&tx_lang_A00095(cd_lang)&"</td><th>"&tx_lang_A00096(cd_lang)&"</td><th>"&tx_lang_A00097(cd_lang)&"</td>"
			vInRowspan = true
			nr_cols = nr_cols + 3
		case else
			select case objrsv.Fields.Item("M10_TP_DADO").Value
				case "1" 'datas
				          'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_CD_BROKER").Value&"")
					if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
						vTxLinha(0) = vTxLinha(0) &"<th colspan='3' style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						vTxLinha(1) = vTxLinha(1) &"<th style='background-color:" & cabec_result & ";'>"&tx_lang_A00033(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00034(cd_lang)&"</th><th style='background-color:" & cabec_result & ";'>"&tx_lang_A00035(cd_lang)&"</th>"
						vInRowspan = true
						nr_cols = nr_cols + 3
					else	
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
						nr_cols = nr_cols + 1
					end if
				case else
					If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<th #ROW# class='gridtit3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&kpi_cabec&"</th>"
					Else
            			vTxLinha(0) = vTxLinha(0) &"<th #ROW# style='background-color:" & cabec_result & ";'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</th>"
					End If
					nr_cols = nr_cols + 1
			end select
	end select
  objrsv.MoveNext
  If objrsv.Eof Then Exit Do
Loop
'exibe a linha com os cabeçalhos
if Len(vTxLinha(0)) > 0 then
	If in_doctos Then
		vTxLinha(0) = "<th#ROW# width=160 class='gridtit' style='background-color:" & cabec_result & ";'>Documentos Digitalizados</th>"&vTxLinha(0)
  		nr_cols = nr_cols + 1
	End If
	if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
	Response.Write("<tr height=20 class='gridtit' style='background-color:" & cabec_result & ";'>"&vTxLinha(0)&"</tr>")
end if
'exibe a linha com os sub-cabeçalhos
if Len(vTxLinha(1)) > 0 then
	Response.Write("<tr height=15 class='gridsub'>"&vTxLinha(1)&"</tr>")
end if

nrec = 0
cd_campo_quebra = ""
objrsv.MoveFirst
'Exibe os resultados do relatório e aplica a personalização
Do While Not objrs.Eof
	cd_produto_viagem = Trim(objrs.Fields.Item("CD_PRODUTO").Value)
	cd_unid_viagem    = Trim(objrs.Fields.Item("CD_UNID_NEG").Value)
	cd_viagem_viagem  = Trim(objrs.Fields.Item("CD_VIAGEM").Value)
	cd_emb_viagem     = Trim(objrs.Fields.Item("CD_EMBARCACAO").Value)
	'link para o detalhe do processo
	'alterna a cor das linhas
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		'quando muda campo definido no tipo de quebra, exibe o valor
		If cd_campo_quebra <> objrs.Fields.Item("CD_LOCAL").Value Then
%>
					<tr>
						<td height="20" colspan="<%= nr_cols%>" class="gridtop">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= objrs.Fields.Item("LOCAL_EMB").Value%></td>
					</tr>
					<%
		End If
		cd_campo_quebra = objrs.Fields.Item("CD_LOCAL").Value
%>
					<tr height="20" bgcolor="<%= bgcolor%>">
					<%
	If objrsv.Eof Then objrsv.MoveFirst
	'aplica a personalização nos registros do relatório
	Do While Not objrsv.Eof
		'Response.Redirect("../import/teste.asp?var1="&SQL&"")

		nm_campo_rel = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
		'exibe os dados de acordo com a personalização do usuário
		Select Case objrsv.Fields.Item("M10_CD_DADO").Value
		    Case "0044"
			%>
				<td align="right"><nobr>&nbsp;<%=objrs.Fields.Item("NM_EMBARCACAO").Value%></nobr></td>
                <%
			Case "0746"
				If objrsx.State = adStateOpen Then objrsx.Close		
				sql = " SELECT CONVERT(VARCHAR,DT_ESPERADA,103) AS DT_ESPERADA, CONVERT(VARCHAR,DT_ENT,103) AS DT_ENT, CONVERT(VARCHAR,GETDATE(),103) AS DT_ATUAL, CD_ARMAZEM_ATRACACAO "&_
				      " FROM BROKER.DBO.TVIAGEM "&_
					  " WHERE CD_UNID_NEG    = '" & cd_unid_viagem & "'"&_
					  "    AND CD_PRODUTO    = '" & cd_produto_viagem & "'"&_
					  "    AND NR_VIAGEM     = '" & cd_viagem_viagem & "'"&_
					  "    AND CD_EMBARCACAO = '" & cd_emb_viagem & "'"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				dt_esperada_viagem = objrsx.Fields.Item("DT_ESPERADA").Value 
			    dt_entrada_viagem  = objrsx.Fields.Item("DT_ENT").Value
				dt_atual_viagem    = objrsx.Fields.Item("DT_ATUAL").Value
				cd_armazem_viagem  = objrsx.Fields.Item("CD_ARMAZEM_ATRACACAO").Value
		  
				Select Case cd_produto_viagem 
					Case "01","03"
					    str = "" 
						If dt_esperada_viagem = dt_atual_viagem and Not fnc_TestaVar(dt_entrada_viagem) Then str = "PREVISTO"
						If fnc_TestaVar(dt_esperada_viagem) and fnc_TestaVar(dt_entrada_viagem) Then str = "ATRACADO"
					Case "02","10"
						str = "" 
						If fnc_TestaVar(dt_esperada_viagem) and fnc_TestaVar(dt_entrada_viagem) and fnc_TestaVar(cd_armazem_viagem) Then str = "SAIDO"
						If dt_esperada_viagem = dt_atual_viagem and Not fnc_TestaVar(dt_entrada_viagem) and Not fnc_TestaVar(cd_armazem_viagem) Then str = "PREVISTO"
						If fnc_TestaVar(dt_esperada_viagem) and Not fnc_TestaVar(dt_entrada_viagem) and fnc_TestaVar(cd_armazem_viagem) Then str = "ATRACADO"
				End Select
				Response.Write(fncExibeTextoPadrao(0, str))
            Case Else
				Select Case objrsv.Fields.Item("M10_TP_DADO").Value
					Case "0" 'exibe os campos de texto simples
						'Response.Redirect("teste.asp?var1="&objrsv.Fields.Item("M10_AP_CAMPO").Value&"")
						Response.Write(fncExibeTextoPadrao(0, objrs.Fields.Item(nm_campo_rel).Value))
					Case "1" 'exibe os campos de datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
							Response.Write(fncExibeDataEventoFup(0, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value))
						'Response.Redirect("teste.asp?var1="&objrs.Fields.Item("PVT_"& nm_campo_rel).Value&"")
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
					Case "6"
						Response.Write("<td><nobr>" & TempoDecorridoExtenso(objrs.Fields.Item(nm_campo_rel).Value) & "</nobr></td>")	
				End Select
		End Select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
					</tr>
                <%
	nrec = nrec + 1
	objrs.MoveNext
	If objrs.Eof Then Exit Do
Loop
%>
					<tr class="gridtit" style="background-color:<%=cabec_result%>;">
						<td height="15" colspan="<%= nr_cols%>" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
                        <input type="hidden" value="<%= nrec%>" id="registro_pagina">
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
<script type="text/javascript">
//if(typeof tableScroll == 'function')
//{
//	tableScroll('TabelaPrincipal');
//}
</script> 

<!--#include virtual="/includes/inc_ends.asp"-->