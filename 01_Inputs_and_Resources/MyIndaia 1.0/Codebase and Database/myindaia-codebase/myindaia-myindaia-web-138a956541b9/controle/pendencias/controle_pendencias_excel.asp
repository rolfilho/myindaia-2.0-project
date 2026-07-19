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
dim dt_inicial, dt_final


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
		nr_processo   = Trim(objrs.Fields.Item("NR_PROCESSO_DES").Value)
		'altera a cor da linha
		If bgcolor = "#E5F7ED" Then bgcolor = "#D4E6DC" Else bgcolor = "#E5F7ED"
		'verifica se o relatório vai ser quebrado por grupo, cliente, area ou modalidade
		If fnc_TestaVar( tp_quebra ) Then
			If cd_campo_quebra <> objrs.Fields.Item(tipo_quebra( tp_quebra )).Value Then
				'cabe&ccedil;alho da tabela, exibido toda vez que mudar a empresa cliente
				objtxt.WriteLine("<tr><td height='20' colspan='"& nr_cols &"' class='gridtop'>&nbsp;&nbsp;"& fnc_NomeCampoQuebra( tp_quebra, objrs.Fields.Item(tipo_quebra( tp_quebra )).Value ) &"</td></tr>")
			End If
			cd_campo_quebra = objrs.Fields.Item(tipo_quebra( tp_quebra )).Value
		End if
	
		vTxExcel = "  <tr height='15'>"

		'inicia uma nova linha de registro
		If objrsv.Eof Then objrsv.MoveFirst
		
		'exibe as informaçõe de acordo com a personalização
		Do While Not objrsv.Eof
			nm_campo_rel  = Trim(objrsv.Fields.Item("M10_AP_CAMPO").Value)
			'exibe os dados de acordo com a personalização do usuário
			Select Case objrsv.Fields.Item("M10_CD_DADO").Value
			Case "0018" 'nr. da referencia
				nr_referencia = Left(objrs.Fields.Item("REFERENCIA").Value, Len(objrs.Fields.Item("REFERENCIA").Value)-4) 	
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' style='vertical-align:top;'>"& nr_referencia &"</td>" 	
			Case  "KPIX"			
			dim data1, data2, dia, total_fds, total_str, sinal
			str = ""
			data_dif_inicial  = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, 1, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")-1)  
			data_dif_inicial  = Left(data_dif_inicial,len(data_dif_inicial))
			data_dif_final    = mid(objrsv.Fields.Item("M10_AP_CAMPO").Value, inStr(1,objrsv.Fields.Item("M10_AP_CAMPO").Value,"x")+1, LEN(objrsv.Fields.Item("M10_AP_CAMPO").Value))
			data_dif_final    = Left(data_dif_final,len(data_dif_final))
			
			If objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT RLZ_" & data_dif_inicial &  " AS DT_INICIAL, RLZ_"& data_dif_final &" AS DT_FINAL, DATEDIFF(DAY , RLZ_" & data_dif_inicial &  ", RLZ_"& data_dif_final &") AS DIFERENCA "&_
			"FROM TFLP_IMPORT "
			If tp_relat = 0 then
				sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
			Else
				sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
				" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
				" AND CD_EMPRESA = '" & cd_empresa & "'"&_
				" AND NR_PARCIAL = '" & nr_parcial & "'"		
			End If
			
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText			
			If Not fnc_TestaVar(objrsx.Fields.Item("DIFERENCA").Value) Then
				str = ""
			Else
			str = objrsx.Fields.Item("DIFERENCA").Value				
			If in_kpi_opcao = "1" Then
				data1 = objrsx.Fields.Item("DT_INICIAL").Value
				data2 = objrsx.Fields.Item("DT_FINAL").Value
				cont_str = 0
				total_fds = 0
				
				If str < 0 Then
					total_str = str * (-1)
					sinal = "-"
				Else
					sinal = ""
					total_str = str
				End If 
						
					Do While Not cont_str >=  total_str
						If objrsx.State = adStateOpen Then objrsx.Close
						sql = "SELECT DATEPART(WEEKDAY , '" & data1 & "') AS DIA"&_
						" FROM TFLP_IMPORT  "
						If tp_relat = 0 then
							sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
						Else
							sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
							" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
							" AND CD_EMPRESA = '" & cd_empresa & "'"&_
							" AND NR_PARCIAL = '" & nr_parcial & "'"		
						End If
						objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
						dia = objrsx.Fields.Item("DIA").Value
						
						If InStr("1;7", dia) > 0 Then
							total_fds = total_fds + 1
						End If	
						
						If str < 0 Then
							data1 = data1 - 1
						Else
							data1 = data1 + 1
						End If 
						cont_str = cont_str + 1
					Loop
				
				If objrsx.State = adStateOpen Then objrsx.Close
				sql = "SELECT " & str & " - ("& sinal & "(SELECT COUNT(*)  FROM TFERIADO WHERE DT_FERIADO BETWEEN RLZ_" & data_dif_inicial &  " AND RLZ_"& data_dif_final &")) - ("& sinal &"" &_
				total_fds & ") AS DIFERENCA_TOTAL FROM TFLP_IMPORT "
				
				If tp_relat = 0 then
					sql = sql & " WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
				Else
					sql = sql & " WHERE NR_REFERENCIA = '" & nr_referencia & "'"&_
					" AND NR_ITEM_CLIENTE = '" & nr_item_clnte & "'"&_
					" AND CD_EMPRESA = '" & cd_empresa & "'"&_
					" AND NR_PARCIAL = '" & nr_parcial & "'"		
				End If
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				If Not isNull(objrsx.Fields.Item("DIFERENCA_TOTAL").Value) Then
					str = objrsx.Fields.Item("DIFERENCA_TOTAL").Value 
				Else
					str = ""
				End If
			Else
				If isNull(str) Then
					str = ""						
				Else
					str = str 				
				End If
			End If 
			End If
			 vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' x:num='"& str &"' ></td>"
			 objrsx.Close()	
				Case "0373" 'Nr. do Processo Desembaraço
					nr_proc_des = Trim( objrs.Fields.Item(nm_campo_rel).Value )
					If fnc_TestaVar(nr_proc_des) Then
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& Mid( nr_proc_des, 5, 10 ) &"</td>"
					Else
						vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'></td>"
					End If
					
				Case "0485" ' Analista Cliente 23/05/2008
				 	If objrsx.state = adstateOpen then objrsx.close()
						If fnc_testaVar(nr_processo) Then
						SQL=" select tp.cd_contato,tct.nm_contato as CONTATO,tp.cd_cliente from tprocesso tp "&_
						" inner join tcliente_contato tct ON(tp.cd_contato=tct.cd_contato"&_
						" AND TP.CD_PRODUTO = TCT.CD_PRODUTO AND TP.CD_UNID_NEG = TCT.CD_UNID_NEG) "&_
						"where tct.cd_cliente=tp.cd_cliente AND nr_processo ='"&nr_processo&"'" 
						Else
						SQL="select u.nm_usuario as CONTATO from tprocesso p inner join tusuario u on (u.cd_usuario = p.cd_analista_cliente) where nr_referencia ='"& objrs.Fields.Item("NR_REFERENCIA").Value &"' and p.cd_cliente = '" & objrs.Fields.Item("CD_EMPRESA").Value & "'" 
						End If
						  Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
						  If objrsx.eof then
							 str="-"
						  else
							  str= objrsx.fields.item("CONTATO").value
						  End If
					vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>"& str &"</td>"
				Case "0718"
				Dim data_aux, font_color, texto_aux
				
				if not fnc_TestaVar(nr_processo) Then 
						nr_processo_pendencia = "X" 
						nr_referencia_pendencia = objrs.Fields.Item("NR_REFERENCIA").Value
						nr_item_cliente_pendencia = objrs.Fields.Item("NR_ITEM_CLIENTE").Value
						nr_parcial_pendencia = objrs.Fields.Item("NR_PARCIAL").Value
						cd_empresa_pendencia = objrs.Fields.Item("CD_EMPRESA").Value
					Else 
						nr_processo_pendencia = nr_processo
						nr_referencia_pendencia = "X" 
						nr_item_cliente_pendencia = "X"
						nr_parcial_pendencia = 0
						cd_empresa_pendencia = "X"
					End If
				
				
				If objrsx.state = adstateOpen then objrsx.close()
				sql = "SELECT P.*, CONVERT(VARCHAR, DT_TEXTO, 103) AS DT_TEXTO_DATA, CONVERT(VARCHAR, DT_TEXTO, 108) AS DT_TEXTO_HORA, U.NM_USUARIO AS NM_USUARIO "&_
				" FROM TPROCESSO_PENDENCIAS_LOG P "&_
				" INNER JOIN TUSUARIO U ON U.CD_USUARIO = P.CD_USUARIO"&_
				" WHERE P.CD_PENDENCIA =" & objrs.Fields.Item("CD_PENDENCIA").Value & " "&_
				" AND P.NR_PROCESSO = '" & nr_processo_pendencia & "' "&_
				" AND P.NR_REFERENCIA = '" & nr_referencia_pendencia & "' "&_				
				" AND P.NR_ITEM_CLIENTE = '" & nr_item_cliente_pendencia & "' "&_				
				" AND P.NR_PARCIAL = " & nr_parcial_pendencia & " "&_								
				" AND P.CD_EMPRESA = '" & cd_empresa_pendencia & "' "&_				
				" ORDER BY DT_TEXTO, CD_TEXTO "
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				
				str = ""
				if objrsx.RecordCount > 0 then
				data_aux = 	objrsx.Fields.Item("DT_TEXTO_DATA").Value
				str = "<font color='#FF0000'><b>(" & Trim(data_aux) & ")</b></font><br />"
				Do While Not objrsx.Eof
				str = str & "<br />"
					If data_aux <> objrsx.Fields.Item("DT_TEXTO_DATA").Value Then
						str = str & "<font color='#FF0000'><b>(" & Trim(objrsx.Fields.Item("DT_TEXTO_DATA").Value) & ")</b></font><br /><br />"
					End If
				  If objrsx.Fields.Item("TP_TEXTO").Value = "I" Then font_color = "#000000" else font_color = "#008080"
				str = str & "<font color='" &  font_color & "'><b>(" & objrsx.Fields.Item("DT_TEXTO_HORA").Value & ") " & Trim(objrsx.Fields.Item("NM_USUARIO").Value) & ":</b></font><br />"
				texto_aux = Replace(Trim(objrsx.Fields.Item("NM_TEXTO").Value),chr(13),"<br>")
				str = str & "<font color='" & font_color & "'>" & texto_aux & "</font><br>"
				data_aux = 	objrsx.Fields.Item("DT_TEXTO_DATA").Value
				objrsx.MoveNext
				if objrsx.Eof then exit do
				Loop					
				End If
				vTxExcel = vTxExcel&"    <td bgcolor='"& bgcolor &"' class='texto'>" & str & "</td>"
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
		sql = "UPDATE TRELATORIOS SET TX_ARQUIVO = '"&arquivo&"' "&_
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
			"  AND CD_USUARIO = '"& Session("cd_usuario")&"' AND NR_IDENT = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

if not fnc_TestaVar(objrs.Fields.Item(0).Value) then
	if objrs.State = adStateOpen then objrs.Close()
	With objcmd
		.CommandTimeOut = 9999
		.CommandText    = Session("sql_pendencias")
		.CommandType    = adCmdText
	End With
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& Session("sql_pendencias") &"<br>"
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	'retorna para o primeiro registro do resultado
	If objrs.RecordCount  > 0 Then objrs.MoveFirst
	'retorna para o primeiro registro da personalização
	If objrsv.RecordCount > 0 Then objrsv.MoveFirst
	'***************************************************************************************************
	'gera o nome do arquivo
	vTxArquivo = "ControlePendencias"&Session("cd_usuario")&"_"&fncDataHoraArquivo()&".xls"
	'****************************************************************************************************
	
	Call subGeraExcel(vTxCaminho, vTxArquivo)
else
	vTxArquivo = objrs.Fields.Item(0).Value
end if
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