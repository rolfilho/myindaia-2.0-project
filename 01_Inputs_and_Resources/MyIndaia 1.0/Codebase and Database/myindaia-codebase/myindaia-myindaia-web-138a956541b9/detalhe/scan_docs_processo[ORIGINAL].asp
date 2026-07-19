<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: Documentos scaneados do processo 
'
'Autor: Alexandre Gonçalves Neto
'Criado: 04/08/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim objfso      'objeto para o sistema de arquivos
Dim objfolder   'pasta onde estarão os arquivos
Dim tx_caminho  'caminho da pasta onde estão os arquivos
Dim tx_arquivo  'nome dos arquivos para download
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço

nr_proc_adm = Request.QueryString("nr_proc_adm")
nr_proc_des = Request.QueryString("nr_proc_des")
tp_relat    = Request.QueryString("tp_relat")

If tp_relat = 0 Then
	If fnc_TestaVar(nr_proc_des) Then nr_processo = nr_proc_des Else nr_processo = nr_proc_adm
Else
	If fnc_TestaVar(nr_proc_adm) Then nr_processo = nr_proc_adm Else nr_processo = nr_proc_des
End If
If Not fnc_TestaVar(nr_processo) Then nr_processo = CStr(Request("nr_processo"))

If (Session("cd_cargo") = "001" or Session("cd_cargo") = "060") and Mid(nr_processo, 3, 2) = "02" Then
  If fnc_TestaVar(Request.Form) Then
	  'altera o status do borderô e insere a data e hora atual como leitura
		sql = "UPDATE TPROC_BORDERO SET "&_
					"  TP_STATUS  = "& fnc_QuotedSQL(Request.Form("tp_status")) &", "&_
					"  DT_LEITURA = CONVERT( datetime, GETDATE(), 103 ) "&_
					"WHERE NR_PROCESSO = "& fnc_QuotedSQL(nr_processo)
		objcnn.Execute(sql)
	End If
End If

Set objfso = Server.CreateObject("Scripting.FileSystemObject")
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function fnc_Valida(form) {
  valida = true;
	
	if (form.tp_status.value == 'X') {
	  alert('Escolha uma das opções de status!');
		form.tp_status.focus();
	  valida = false;
	}
	
	return valida
}

function fncMudaStatus(selObj) {
	if (selObj.options[selObj.selectedIndex].value != 'X') {
		document.frm_bordero.enviar.disabled = false
	} else {
		document.frm_bordero.enviar.disabled = true
	}
}
-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<form name="frm_bordero" method="post" action="<%= script%>" onSubmit="return fnc_Valida(this);">
		<tr>
			<td height="25" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x" class="titpopup">
				<%= tx_lang_A00082(cd_lang) &" >> "& tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))%></td>
		</tr>
		<tr>
			<td><div id="dv_corpo" style="position:absolute; left:0px; top:25px; width:100%; height:100%; z-index:1; overflow:auto;">
					<table width="100%" border="1" cellpadding="0" cellspacing="0">
						<tr height="16" bgcolor="#CCCCCC" style="font-weight: bold; color:#666666;">
							<td><%= tx_lang_A00082(cd_lang)%></td>
							<td width="75"><%= tx_lang_A00083(cd_lang)%></td>
							<td width="75"><%= tx_lang_A00084(cd_lang)%></td>
						</tr>
						<%
If Mid(nr_processo, 3, 2) = "02" Then
	'recupera o nome dos arquivos e preenche a tabela
	tx_caminho = Server.MapPath("/docs/"& nr_processo)
	If objFSO.FolderExists(tx_caminho) Then
		Set objfolder = objFSO.GetFolder(tx_caminho)
		For Each tx_arquivo in objfolder.Files
%>
						<tr height="16">
							<td align="left" style="border-width: 1px 0px 0px 1px;">&nbsp;<a href="/docs/<%= nr_processo%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
		Next
	End If
Else
	'recupera o nome dos arquivos e preenche a tabela
	If tp_relat = "0" Then
		sql = "SELECT DISTINCT NR_PROCESSO_ADM "&_
					"FROM TESTAGIO_PROCESSO (NOLOCK) "&_
					"WHERE NR_PROCESSO_DES = '"& nr_proc_des &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		Do While Not objrs.Eof
			nr_proc_adm = objrs.Fields.Item("NR_PROCESSO_ADM").Value
			tx_caminho = Server.MapPath("/docs/"& nr_proc_adm)
			If objFSO.FolderExists(tx_caminho) Then
				Set objfolder = objFSO.GetFolder(tx_caminho)
				For Each tx_arquivo in objfolder.Files
%>
						<tr height="16">
							<td align="left" style="border-width: 1px 0px 0px 1px;">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
				Next
			End If
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
		
		tx_caminho = Server.MapPath("/docs/"& nr_proc_des)
		If objFSO.FolderExists(tx_caminho) Then
			Set objfolder = objFSO.GetFolder(tx_caminho)
			For Each tx_arquivo in objfolder.Files
%>
						<tr height="16">
							<td align="left" style="border-width: 1px 0px 0px 1px;">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
			Next
		End If
	End If
	'Administração e Ambos
	If tp_relat = "1" or tp_relat = "2" Then
		tx_caminho = Server.MapPath("/docs/"& nr_proc_adm)
		If objFSO.FolderExists(tx_caminho) Then
			Set objfolder = objFSO.GetFolder(tx_caminho)
			For Each tx_arquivo in objfolder.Files
%>
						<tr height="16">
							<td align="left" style="border-width: 1px 0px 0px 1px;">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
			Next
		End If
		
		sql = "SELECT DISTINCT NR_PROCESSO_DES "&_
					"FROM TESTAGIO_PROCESSO (NOLOCK) "&_
					"WHERE NR_PROCESSO_ADM = '"& nr_proc_adm &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		Do While Not objrs.Eof
			nr_proc_des = objrs.Fields.Item("NR_PROCESSO_DES").Value
			tx_caminho = Server.MapPath("/docs/"& nr_proc_des)
			If objFSO.FolderExists(tx_caminho) Then
				Set objfolder = objFSO.GetFolder(tx_caminho)
				For Each tx_arquivo in objfolder.Files
%>
						<tr height="16">
							<td align="left" style="border-width: 1px 0px 0px 1px;">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
				Next
			End If
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
	End If
End If
%>
					</table>
				</div></td>
		</tr>
		<tr align="center">
			<td height="28">
			<%
'Exibe conforme o cargo do usuário
If (Session("cd_cargo") = "001" or Session("cd_cargo") = "060") and Mid(nr_processo, 3, 2) = "02" Then
%>
				<select name="tp_status" id="status" class="select" style="width: 150px; font-size: 13px;" onChange="fncMudaStatus(this)">
					<option value="X" selected><%= tx_lang_A00085(cd_lang)%></option>
					<option value="1"><%= tx_lang_EXP004(cd_lang)%></option>
					<option value="2"><%= tx_lang_EXP005(cd_lang)%></option>
				</select>
				<input type="hidden" name="nr_processo" value="<%= nr_processo%>">
				<input type="submit" name="enviar" class="button" value=" Ok " disabled>
				<%
End If
%>
			<input type="button" name="fechar" class="button" value="<%= tx_lang_D00011(cd_lang)%>" onClick="window.close()"></td>
		</tr>
		<!--#include virtual="/includes/inc_popup_botton.asp"-->
	</form>
</table>
</body>
</html>
<%
Set objfolder = Nothing
Set objfso    = Nothing
%>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->