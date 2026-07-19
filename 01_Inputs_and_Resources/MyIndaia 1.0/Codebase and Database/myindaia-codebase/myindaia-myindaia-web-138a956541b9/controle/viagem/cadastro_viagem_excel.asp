<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Dowload de Arquivos Excel
'Arquivo de Script e HTML: Gera arquivo excel Tracking Importação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 01/07/2005
'Manutenção: 07/02/2008 - Flávio 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout do script para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim vTxCaminho 'caminho do arquivo
Dim vTxArquivo 'nome do arquivo
Dim numx, numy, numz 'guarda os valores de data realizada e diferença de dias para o Excel
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo do desembaraco
Dim tx_proc_adm 'armazena todos os processos de adm. de pedido de um embarque
Dim tx_proc_des 'armazena todos os processos de de desembaraço de uma gestão de pedido
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
dim Descontos,chk_frete,chk_seguro,check_Fob,tx_dolar,tx_mle ' variáveis para checagem de calculos FOB
dim Deadline
dim dt_inicial, dt_final, flag_exibe_mais
Dim cd_produto_viagem, cd_unid_viagem, cd_viagem_viagem, cd_emb_viagem, dt_esperada_viagem, dt_entrada_viagem, dt_atual_viagem, cd_armazem_viagem



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

cd_tela = "EXC001"
cd_menu = CStr(Request.QueryString("cd_menu"))
cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))
nr_ident = Request.QueryString("nr_ident")
nr_data = Request.QueryString("nr_data")
nr_cols = Request.QueryString("nr_cols")
ap_filtros = Replace(Request("filtro"),", ","','")
flag_exibe_mais = CStr(Request.QueryString("exibe_mais"))

Sub subGeraExcel(caminho, arquivo)
  Dim objfso 'objeto do sistema de arquivos 
  Dim objtxt 'objeto para a criação de arquivos
  'cria o objeto q gerencia o sistema de arquivos
  Set objfso = CreateObject("Scripting.FileSystemObject")
  'cria o ojbeto responsável pela criação do arquivo
  Set objtxt = objfso.CreateTextFile(caminho&arquivo,True,False)
    'inicia a gravação do arquivo xls para download
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
				vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
				vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00095(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00096(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00097(cd_lang)&"</td>"
				vInRowspan = true
				nr_cols = nr_cols + 3
			case else
				select case objrsv.Fields.Item("M10_TP_DADO").Value
					case "1" 'datas
						if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) and in_dt_prev then
							vTxLinha(0) = vTxLinha(0) &"<td colspan='3' class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							vTxLinha(1) = vTxLinha(1) &"<td width=80 class='gridsub'>"&tx_lang_A00033(cd_lang)&"</td><td width=30 class='gridsub'>"&tx_lang_A00034(cd_lang)&"</td><td width=80 class='gridsub'>"&tx_lang_A00035(cd_lang)&"</td>"
							vInRowspan = true
							nr_cols = nr_cols + 3
						else
							vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=80 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
							nr_cols = nr_cols + 1
						end if
					case else
						If objrsv.Fields.Item("M10_CD_DADO").Value = "KPIX" Then
						vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=120 class='gridtit3'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						Else
							vTxLinha(0) = vTxLinha(0) &"<td#ROW# width=120 class='gridtit'>"&objrsv.Fields.Item("M10_NM_DADO").Value&"</td>"
						End If
						nr_cols = nr_cols + 1
				end select
		end select
		objrsv.MoveNext
		If objrsv.Eof Then Exit Do
	Loop
%>
<!--#include virtual="/includes/xls_header.asp" -->
<%
	'exibe titulo das colunas
	if Len(vTxLinha(0)) > 0 then
		If in_doctos Then
			vTxLinha(0) = "<td#ROW# width=120 class='gridtit'>Documentos Digitalizados</td>"&vTxLinha(0)
  			nr_cols = nr_cols + 1
		End If
		if vInRowspan then vTxLinha(0) = Replace(vTxLinha(0),"#ROW#"," rowspan='2'") else vTxLinha(0) = Replace(vTxLinha(0),"#ROW#","")
		objtxt.WriteLine("<tr height=30>"&vTxLinha(0)&"</tr>")
	end if
	'exibe a linha com os sub-titulos
	if Len(vTxLinha(1)) > 0 then
		objtxt.WriteLine("<tr height=15>"&vTxLinha(1)&"</tr>")
	end if
	
	nrec = 0
	cd_campo_quebra = ""
	'Exibe os resultados do relatório e aplica a personalização
	Do While Not objrs.Eof
		cd_produto_viagem = Trim(objrs.Fields.Item("CD_PRODUTO").Value)
	    cd_unid_viagem    = Trim(objrs.Fields.Item("CD_UNID_NEG").Value)
	    cd_viagem_viagem  = Trim(objrs.Fields.Item("CD_VIAGEM").Value)
     	cd_emb_viagem     = Trim(objrs.Fields.Item("CD_EMBARCACAO").Value)
		'altera a cor da linha
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
			If cd_campo_quebra <> objrs.Fields.Item("CD_LOCAL").Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& objrs.Fields.Item("LOCAL_EMB").Value &"</td></tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item("CD_LOCAL").Value
	
		vTxExcel = "  <tr height='15'>"

		'inicia uma nova linha de registro
		If objrsv.Eof Then objrsv.MoveFirst
		
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
				Case "0044"
					vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item("NM_EMBARCACAO").Value)
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
						If fnc_TestaVar(dt_esperada_viagem) and fnc_TestaVar(dt_entrada_viagem) and fnc_TestaVar(cd_armazem_viagem) Then str = "ATRACADO"
				End Select
				vTxExcel = vTxExcel&fncExibeTextoPadrao(2, str)
				Case Else
					Select Case objrsv.Fields.Item("M10_TP_DADO").Value
						Case "0" 'exibe os campos de texto simples
							vTxExcel = vTxExcel&fncExibeTextoPadrao(2, objrs.Fields.Item(nm_campo_rel).Value)
						Case "1" 'exibe os campos de datas
							if fnc_TestaVar(objrsv.Fields.Item("M10_CD_BROKER").Value) then 'verfica se é data de followup
								vTxExcel = vTxExcel&fncExibeDataEventoFup(2, objrs.Fields.Item("IN_"& nm_campo_rel).Value, objrs.Fields.Item("PVT_"& nm_campo_rel).Value, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
							else
								vTxExcel = vTxExcel&fncExibeDataPadrao(2, objrs.Fields.Item("RLZ_"&nm_campo_rel).Value)
							end if
						Case "2" 'exibe os campos com valor decimal
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 2)
						Case "3" 'exibe os campos com valor monetário
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 4)
						Case "4" 'exibe os campos com valor inteiro
							vTxExcel = vTxExcel&fncExibeNumeroPadrao(2, objrs.Fields.Item(nm_campo_rel).Value, 0)
						Case "5" 'exibe os campos do tipo memo
							vTxExcel = vTxExcel&fncExibeMemoPadrao(2, objrs.Fields.Item(nm_campo_rel).Value)
						Case "6"
						vTxExcel = vTxExcel& "<td bgcolor='"& bgcolor &"' style='vertical-align:top;'><nobr>" & TempoDecorridoExtenso(objrs.Fields.Item(nm_campo_rel).Value) & "</nobr></td>"
					End Select
			End Select
			objrsv.MoveNext
			If objrsv.Eof Then Exit Do
		Loop
		objtxt.WriteLine(vTxExcel&"  </tr>")
		
		If flag_exibe_mais = "1" Then

If objrsx.State = adStateOpen Then objrsx.Close		
sql = " SELECT PR.NR_PROCESSO AS NR_PROCESSO, ISNULL((SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND TP_REFERENCIA = '01'),' - ') AS NR_REFERENCIA, " &_
    " ISNULL((SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND TP_REFERENCIA = '19'),' - ') AS NR_MAIN_LEG,   "&_  
    " CONVERT(VARCHAR,PR.DT_ABERTURA,103) AS DT_ABERTURA "&_
	" FROM BROKER.DBO.TVIAGEM V"&_
	" INNER JOIN TPROCESSO PR ON  (PR.CD_EMBARCACAO = V.CD_EMBARCACAO AND PR.NR_VIAGEM = V.NR_VIAGEM "&_
	"                          AND (CASE PR.CD_UNID_NEG WHEN '07' THEN '01' ELSE PR.CD_UNID_NEG END) = V.CD_UNID_NEG AND PR.CD_PRODUTO = V.CD_PRODUTO)"&_
	" WHERE V.CD_UNID_NEG =  '"& cd_unid_viagem &"'"&_
	"   AND V.CD_PRODUTO = '" & cd_produto_viagem &"'"&_
	"   AND V.NR_VIAGEM = '" & cd_viagem_viagem & "'"&_
	"   AND V.CD_EMBARCACAO = '" & cd_emb_viagem & "'"&_
	"   AND SUBSTRING(PR.NR_PROCESSO, 5, 2) NOT IN ('TD') "
	
	
	If Not Session("cargo_interno") = "1" Then sql = sql & " AND PR.CD_GRUPO = '" & session("GrupoUsuario2") & "'"
	If Session("grupo_utilizado") <> "X" Then sql = sql & " AND PR.CD_GRUPO = '" & session("grupo_utilizado") & "'"
	
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrsx.RecordCount > 0 Then
	vTxExcel= "<tr align='center' height='15'>"&_
				"<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;&nbsp;</nobr></td> "&_
				"<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;Nr. Processo&nbsp;</nobr></td> "&_
				"<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;Referência&nbsp;</nobr></td> "&_
                "<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;Main Leg&nbsp;</nobr></td> "&_
                "<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;Abertura&nbsp;</nobr></td> "&_
                "<td bgcolor='#99CCFF' style='vertical-align:top;font-weight:bold;'><nobr>&nbsp;Doctos.&nbsp;</nobr></td>"

Do While Not objrsx.Eof 
		vTxExcel = vTxExcel & "<tr align='center' height='15'>"&_
					"<td bgcolor='#FFFFFF'><nobr>&nbsp;&nbsp;</nobr></td> "&_
					"<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;" & Mid(objrsx.Fields.Item("NR_PROCESSO").Value,5,15) & "&nbsp;</nobr></td>"&_
					"<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;" & objrsx.Fields.Item("NR_REFERENCIA").Value & "&nbsp;</nobr></td>"&_
                    "<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;" & objrsx.Fields.Item("NR_MAIN_LEG").Value & "&nbsp;</nobr></td>"&_
                    "<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;" & objrsx.Fields.Item("DT_ABERTURA").Value & "&nbsp;</nobr></td>"&_
                    "<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;"
                    If objFSO.FolderExists(Server.MapPath("/docs/"& objrsx.Fields.Item("NR_PROCESSO").Value)) or objFSO.FolderExists(Server.MapPath("/docs_novo/"& objrsx.Fields.Item("NR_PROCESSO").Value)) Then
                    vTxExcel = vTxExcel & "Sim"
                    Else
					vTxExcel = vTxExcel & "Não"
                    End If
                    vTxExcel = vTxExcel & "&nbsp;</nobr></td>"&_
					"<td bgcolor='#FFFFFF' style='vertical-align:top;'><nobr>&nbsp;&nbsp;</nobr></td> "&_
				"</tr>"
	objrsx.MoveNext
	If objrsx.Eof Then Exit Do
Loop
				objtxt.WriteLine(vTxExcel)
				End If
		End If		
		objrs.MoveNext
		If objrs.Eof Then Exit Do
 		'If nrec > 30 Then Response.Flush()
		nrec = nrec + 1
	Loop
	objtxt.WriteLine("  <tr height='15'>")
  objtxt.WriteLine("    <td class='gridsub' style='width:200px;'>"& objrs.RecordCount &" registros encontrados</td>")
  for i = 1 to nr_cols -1
    objtxt.WriteLine("    <td class='gridsub'>&nbsp;</td>")
  next
  objtxt.WriteLine("  </tr>")
  objtxt.WriteLine("</table></body></html>")
  objtxt.Close()
	
	if objrs.Eof then
		sql = "UPDATE TRELATORIOS SET TX_ARQUIVO = '"&arquivo&"', EXIBE_MAIS = '" & flag_exibe_mais & "' "&_
					"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
					"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
		objcnn.Execute(sql)
	end if
	
  Set objtxt = Nothing
  Set objfso = Nothing
End Sub

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%= nm_menu &" - "& nm_subm%></title>
<link href="/includes/styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div id="textInLoad" style="position:absolute; top:50; left:38;">
<table width="170" height="70" border="1" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center"><span class="style1">CARREGANDO...</span><br>
			por favor aguarde, o relatório esta sendo criado.</td>
	</tr>
</table>
</div>
<%

'caminho do arquivo
vTxCaminho = Request.ServerVariables("APPL_PHYSICAL_PATH")&"arquivo\download\"

'verifica se o arquivo já foi criado
if objrs.State = adStateOpen then objrs.Close()
sql = "SELECT TX_ARQUIVO FROM TRELATORIOS (NOLOCK) "&_
			"WHERE CD_MENU = '"&cd_menu&"' AND CD_SUBM = '"&cd_subm&"' "&_
			"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident & " AND EXIBE_MAIS = '" & flag_exibe_mais & "'"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if objrs.RecordCount > 0 Then
if not fnc_TestaVar(objrs.Fields.Item(0).Value) then
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_viagem")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_viagem") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = "CadastroViagem"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	'****************************************************************************************************
	Call subGeraExcel(vTxCaminho, vTxArquivo)
else
	vTxArquivo = objrs.Fields.Item(0).Value
end if
Else
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_viagem")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_viagem") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = "CadastroViagem"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	'****************************************************************************************************
	Call subGeraExcel(vTxCaminho, vTxArquivo)
End If
%>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25" align="center" class="titpopup">Redirecionando Download</td>
	</tr>
	<tr>
		<td><p align="center">Planilha Excel<br>
				<b><%= vTxArquivo%></b></p>
			<p align="center">Caso o download n&atilde;o inicie automaticamente, <a href="http://www.myindaiaweb.com.br/arquivo/download/<%= vTxArquivo%>" target="_blank"><b>clique
				aqui</b></a>.</p></td>
	</tr>
	<tr>
		<td height="35" align="center"><input type="button" class="button" value="X Fechar" onClick="javascript:window.close();"></td>
	</tr>
</table>
</body>
</html>

<script language="javascript">
<!--		 
textInLoad.style.display="none";
window.focus();
window.open('http://www.myindaiaweb.com.br/arquivo/download.asp?vTxCaminho=<%=Server.URLEncode(vTxCaminho)%>&vTxArquivo=<%=Server.URLEncode(vTxArquivo)%>', 'download')
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->