<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhe de Processo
'Arquivo de Script e HTML: Documentos scaneados do processo 
'
'Autor: Alexandre Gonçalves Neto
'Criado: 04/08/2006
'
'Manutenção: 18/03/2008 Flávio Henrique 
'Importador não exibe borderô nem contabilidade
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
Dim contador_for, contador_for2, contador_while
Dim flag_arq_expo,	flag_arq_impo_des,	flag_arq_impo_adm, flag_processo_novo, flag_campo_quebra, sql_088

nr_proc_adm = Request.QueryString("nr_proc_adm")
nr_proc_des = Request.QueryString("nr_proc_des")
tp_relat    = Request.QueryString("tp_relat")

If tp_relat = 0 Then
	If fnc_TestaVar(nr_proc_des) Then nr_processo = nr_proc_des Else nr_processo = nr_proc_adm
Else
	If fnc_TestaVar(nr_proc_adm) Then nr_processo = nr_proc_adm Else nr_processo = nr_proc_des
End If
If Not fnc_TestaVar(nr_processo) Then nr_processo = CStr(Request("nr_processo"))

if objrsx.State = adStateOpen Then objrsx.Close
sql = "SELECT CONVERT(DATETIME,DT_ABERTURA,103) AS DT_ABERTURA FROM TPROCESSO WHERE NR_PROCESSO = '" & nr_processo & "'" 
Objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly

If Objrsx.RecordCount > 0 Then
   If Objrsx.Fields.Item("DT_ABERTURA").Value >= CDate("01/06/2009") or Session("cd_cargo") = "088" Then
     flag_processo_novo = 1
	 If Session("cd_cargo") = "088" Then
		sql_088 = " AND TDD.CD_PRODUTO = '02' AND TDD.CD_TIPO_DOCTO <> '67' "
	 End If
   End If
End If

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

sql_pendencias = ""
If Request("pendencias") = "1" Then
    sql_pendencias = " AND LEFT(PD.NM_ARQUIVO, 3) = 'PEN'" 
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

function mudaValor(objeto, arquivo) {
	if(objeto.checked){
		objeto.value = arquivo;
	}else{
		objeto.value = "0";
	}
}

function verificaEmail(objeto){
	if (objeto.value != ""){
		document.getElementById('submit_resumo').disabled = false;
	}else{
		document.getElementById('submit_resumo').disabled = true;
	}
}

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div_info = document.getElementById(vDiv1);
		var div_info_corpo = document.getElementById(vDiv2);
		var div_info_rodape = document.getElementById(vDiv3);
		var div_frame = document.getElementById('divFrame');
		div_info.style.display = "none";
		div_info_corpo.style.display = "none";
		div_info_rodape.style.display = "none";
		div_frame.style.visibility = "hidden";
	}	
}

function ExibeDetalhes(vDiv, vDiv2, vDiv3, tipo) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var w = 420;
		var z = 172;
		var div_info = document.getElementById(vDiv); 
		var div_info_corpo = document.getElementById(vDiv2); 
		var div_info_rodape = document.getElementById(vDiv3); 
		var div_frame = document.getElementById('divFrame');
		
		div_frame.style.width = w;
		div_frame.style.height = z;
		div_frame.style.left = 14;
		div_frame.style.top = 10;
		div_frame.style.visibility = "visible";
		div_frame.style.filter= "alpha(opacity=0)";
		
		
		div_info.style.width = w;
		div_info.style.height = 26;
		div_info.style.left = 14;
		div_info.style.top = 40;
		div_info.style.display = "block";
		div_info.style.filter= "alpha(opacity=92)";
		
		div_info_corpo.style.width = w;
		div_info_corpo.style.height = z;
		div_info_corpo.style.left = 14;
		div_info_corpo.style.top = 66;
		div_info_corpo.style.display = "block";
		div_info_corpo.style.filter= "alpha(opacity=91)";
		
		div_info_rodape.style.width = w;
		div_info_rodape.style.height = 26;
		div_info_rodape.style.left = 14;
		div_info_rodape.style.top = 238;
		div_info_rodape.style.display = "block";
		div_info_rodape.style.filter= "alpha(opacity=92)";
		document.getElementById('nm_email').focus();
	}
}
-->
</script>
</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div%>">
	<form name="frm_bordero" method="post" action="envia_arquivos.asp?nr_processo=<%=nr_processo%>" onSubmit="return fnc_Valida(this);">
		<tr style="background-color:<%=topo_div%>;" align="center">
			<td height="25"> 
            <iframe id="divFrame" src="" style="visibility: hidden; position: absolute; z-index: 2;"></iframe>
            <div id="divInfo" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=topo_div %>" >
	<tr height="25">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="center" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<b><%=tx_lang_POP093(cd_lang)%></b></td>
					<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');"><img src="/imagens/icones/16x16/btn_fechar20<%=fechar_div %>.gif" width="18" height="17" border="0" alt="<%=tx_lang_D00011(cd_lang)%>"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
    </table></div>
    <div id="divInfoCorpo" class="divInfo" style="border-color:<%=topo_div%>;scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div%>">
    <tr>
    <td align="left" valign="middle" height="10px">&nbsp;
    
    </td>
    </tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="30%" valign="middle"><%=tx_lang_POP095(cd_lang)%>:&nbsp;</td><td align="left" ><input name="nm_email" id="nm_email" type="text" value="" class="textbox" style="width:250px;height:20px;" onBlur="verificaEmail(this);"></td>
     </tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="30%" valign="middle">CC:&nbsp;</td><td align="left" ><input name="nm_cc" id="nm_cc" type="text" value="" class="textbox" style="width:250px;height:20px;"></td></tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="30%" valign="middle"><%=tx_lang_POP096(cd_lang)%>:&nbsp;</td><td align="left" ><input name="nm_assunto" id="nm_assunto" type="text" value="" class="textbox" style="width:250px;height:20px;"></td></tr>
    <tr align="left" valign="top" height="55px">
    <td colspan="2"><center><textarea name="nm_msg" style="width:335px;height:55px;overflow:auto;" class="editbox"></textarea></center></td></tr>
    </table>
    </div>
    <div id="divInfoRodape" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=topo_div %>" >
    <tr>
    <td align="left" valign="middle" width="80%">&nbsp;
    
    </td>
    <td width="20%" align="center">
    <input name="submit_resumo" id="submit_resumo" type="submit" class="button" value="<%=tx_lang_POP094(cd_lang)%>" disabled="true">
    </td>
    </tr>
</table>
    </div> 
				<b><%= tx_lang_A00082(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"%></b></td>
		</tr>
		<tr>
        <%If flag_processo_novo <> 1 Then%> 
			<td><div id="dv_corpo" style="position:absolute; left:0px; top:25px; width:100%; height:100%; z-index:1; overflow:auto;">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr height="16">
                        	<td>&nbsp;&nbsp;</td>
							<td><%= tx_lang_A00082(cd_lang)%></td>
							<td width="75"><%= tx_lang_A00083(cd_lang)%></td>
							<td width="75"><%= tx_lang_A00084(cd_lang)%></td>
						</tr>
                        
						<%
						contador_for = 0
						contador_for2 = 0
						contador_while = 0
						flag_arq_expo = 0
						flag_arq_impo_des = 0
						flag_arq_impo_adm = 0
						
If Mid(nr_processo, 3, 2) = "02" Then 'EXPO
	'recupera o nome dos arquivos e preenche a tabela
	tx_caminho = Server.MapPath("/docs/"& nr_processo)
	If objFSO.FolderExists(tx_caminho) Then
		flag_arq_expo = 1
		contador_for = 1
		Set objfolder = objFSO.GetFolder(tx_caminho)
		For Each tx_arquivo in objfolder.Files
		'Response.Redirect("../import/teste.asp?var1="&Session("cd_cargo")&"")
		If Session("cd_cargo")=088 then
		   If mid(tx_arquivo.Name,1,5)<>"borde" and  mid(tx_arquivo.Name,1,5)<> "conta" then
		'Response.Redirect("../import/teste.asp?var1="&mid(tx_arquivo.Name,1,5)&"")

%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center" ><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" >&nbsp;<a href="/docs/<%= nr_processo%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" >&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" >&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
             <%End if%>
<%else%>                        
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center" ><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" >&nbsp;<a href="/docs/<%= nr_processo%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" >&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
	<%  End if
		contador_for = contador_for + 1
		Next
	End If
Else 'IMPO
	'recupera o nome dos arquivos e preenche a tabela
	If tp_relat = "0" Then 'DESEMBARAÇO
	flag_arq_impo_des = 1
		sql = "SELECT DISTINCT NR_PROCESSO_ADM "&_
					"FROM TESTAGIO_PROCESSO (NOLOCK) "&_
					"WHERE NR_PROCESSO_DES = '"& nr_proc_des &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	If objrs.RecordCount > 0 then
		Do While Not objrs.Eof
			nr_proc_adm = objrs.Fields.Item("NR_PROCESSO_ADM").Value
			tx_caminho = Server.MapPath("/docs/"& nr_proc_adm)
			If objFSO.FolderExists(tx_caminho) Then
				contador_for = 1
				contador_while = 1
				Set objfolder = objFSO.GetFolder(tx_caminho)
				For Each tx_arquivo in objfolder.Files
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_imp_adm<%=contador_while%><%=contador_for%>" id="check_imp_adm<%=contador_while%><%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
				contador_for = contador_for + 1		
				Next
			End If
			contador_while = contador_while + 1
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
	End if	
		
		tx_caminho = Server.MapPath("/docs/"& nr_proc_des)
		If objFSO.FolderExists(tx_caminho) Then
			contador_for2 = 1
			Set objfolder = objFSO.GetFolder(tx_caminho)
			For Each tx_arquivo in objfolder.Files
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        	<td align="center"><input type="checkbox" name="check_imp_des<%=contador_for2%>" id="check_imp_des<%=contador_for2%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
			contador_for2 = contador_for2 + 1					
			Next
		End If
	End If
	'Administração e Ambos
	If tp_relat = "1" or tp_relat = "2" Then
		flag_arq_impo_adm = 1
		tx_caminho = Server.MapPath("/docs/"& nr_proc_adm)
		If objFSO.FolderExists(tx_caminho) Then
		contador_for = 1
			Set objfolder = objFSO.GetFolder(tx_caminho)
			For Each tx_arquivo in objfolder.Files
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_imp_adm<%=contador_for%>" id="check_imp_adm<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
			contador_for = contador_for + 1			
			Next
		End If
		
		sql = "SELECT DISTINCT NR_PROCESSO_DES "&_
					"FROM TESTAGIO_PROCESSO (NOLOCK) "&_
					"WHERE NR_PROCESSO_ADM = '"& nr_proc_adm &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		if objrs.RecordCount > 0 then
		Do While Not objrs.Eof
			nr_proc_des = objrs.Fields.Item("NR_PROCESSO_DES").Value
			tx_caminho = Server.MapPath("/docs/"& nr_proc_des)
			If objFSO.FolderExists(tx_caminho) Then
				contador_for2 = 1
				contador_while = 1
				Set objfolder = objFSO.GetFolder(tx_caminho)
				For Each tx_arquivo in objfolder.Files
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_imp_des<%=contador_while%><%=contador_for2%>" id="check_imp_des<%=contador_while%><%=contador_for2%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
						<%
				contador_for2 = contador_for2 + 1		
				Next
			End If
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
	end if	
	End If
End If
%>
					</table>
				</div></td>
                <%Else%>
                 			<td><div id="dv_corpo" style="position:absolute; left:0px; top:25px; width:100%; height:100%; z-index:1; overflow:auto;">
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<tr height="16"style="font-weight:bold;background-color:<%=cabec_result%>;" class="gridtit">
                        	<td>&nbsp;&nbsp;</td>
							<td><%= tx_lang_A00082(cd_lang)%></td>
							<td width="75"><%= tx_lang_A00084(cd_lang)%></td>
						</tr>
                        
						<%
						contador_for = 0
						contador_for2 = 0
						contador_while = 0
						flag_arq_expo = 0
						flag_arq_impo_des = 0
						flag_arq_impo_adm = 0
						
If Mid(nr_processo, 3, 2) = "02" Then 'EXPO
	flag_arq_expo = 1
	contador_for = 1
    if objrsx.State = adStateOpen Then objrsx.Close
            sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_processo & "',0) AS RESULTADO "
            objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
            diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

	'recupera o nome dos arquivos e preenche a tabela
	if objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
    " FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
    " INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
    "                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
    " WHERE PD.NR_PROCESSO   = '" & nr_processo & "'"&_
    " AND PD.IN_ATIVO      = '1'"&_
    " AND TDD.IN_ENVIA_WEB = '1'"&_
	sql_088 &_
    sql_pendencias &_
	" ORDER BY TDD.CD_TIPO_DOCTO  "
    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  

    flag_campo_quebra = ""
	If objrsx.RecordCount > 0 Then
	Do While Not objrsx.Eof
        If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
		If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
		  <tr height="16" style="font-weight: bold;background-color:<%=cabec_result%>"  class="gridtit">
			<td colspan="3"><%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
		  </tr>
		<%
		End If
		flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
	
		'Response.Redirect("../import/teste.asp?var1="&Session("cd_cargo")&"")
		If Session("cd_cargo")=088 then
		   If mid(objrsx.Fields.Item("ARQUIVO").Value,1,5)<>"borde" and  mid(objrsx.Fields.Item("ARQUIVO").Value,1,5)<> "conta" then
		'Response.Redirect("../import/teste.asp?var1="&mid(tx_arquivo.Name,1,5)&"")

%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_processo%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
             <%End if%>
<%else%>                        
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_processo%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
	<%  
		End if
		contador_for = contador_for + 1	
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
	  Loop	
	End If
Else 'IMPO
	'recupera o nome dos arquivos e preenche a tabela
	If tp_relat = "0" Then 'DESEMBARAÇO
	flag_arq_impo_des = 1
	contador_for = 1
	sql = "SELECT DISTINCT NR_PROCESSO_ADM "&_
	" FROM TESTAGIO_PROCESSO (NOLOCK) "&_
	" WHERE NR_PROCESSO_DES = '"& nr_proc_des &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	  If objrs.RecordCount > 0 then
	    Do While Not objrs.Eof
		  nr_proc_adm = objrs.Fields.Item("NR_PROCESSO_ADM").Value
		  
          if objrsx.State = adStateOpen Then objrsx.Close
            sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_proc_adm & "',0) AS RESULTADO "
            objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
            diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

          if objrsx.State = adStateOpen Then objrsx.Close
			sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
			" FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
			" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
			"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
			" WHERE PD.NR_PROCESSO   = '" & nr_proc_adm & "'"&_
			" AND PD.IN_ATIVO      = '1'"&_
			" AND TDD.IN_ENVIA_WEB = '1'"&_
			sql_088 &_
            sql_pendencias &_
	        " ORDER BY TDD.CD_TIPO_DOCTO  "
			objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
				
			If objrsx.RecordCount > 0 Then
			flag_campo_quebra = ""
			Do While Not objrsx.Eof
			If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
			If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
			  %>
			  <tr height="16" style="font-weight: bold;background-color:<%=cabec_result%>"  class="gridtit">
				<td colspan="3"><%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
				
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_imp_adm<%=contador_while%><%=contador_for%>" id="check_imp_adm<%=contador_while%><%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_adm%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
						<%
			  contador_for = contador_for + 1	
			  objrsx.MoveNext
			  If objrsx.Eof Then Exit Do
            Loop 
		End If
		contador_while = contador_while + 1
		objrs.MoveNext
		If objrs.Eof Then Exit Do
		Loop
	End if	
		
	contador_for2 = 1	

    if objrsx.State = adStateOpen Then objrsx.Close
    sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_proc_des & "',0) AS RESULTADO "
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
    diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

    if objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
	" FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
	" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
	"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
	" WHERE PD.NR_PROCESSO   = '" & nr_proc_des & "'"&_
	" AND PD.IN_ATIVO      = '1'"&_
	" AND TDD.IN_ENVIA_WEB = '1'"&_
	sql_088 &_
    sql_pendencias &_
	" ORDER BY TDD.CD_TIPO_DOCTO  "
	objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
	
			
	If objrsx.RecordCount > 0 Then
	flag_campo_quebra = ""	
	  Do While Not objrsx.Eof
	  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
	  If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
	  %>
          <tr height="16" style="font-weight: bold;background-color:<%=cabec_result%>"  class="gridtit"> 
            <td colspan="3"><%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
          </tr>
		<%
        End If
        flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
				
	  
	  
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        	<td align="center"><input type="checkbox" name="check_imp_des<%=contador_for2%>" id="check_imp_des<%=contador_for2%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_des%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
						<%
		contador_for2 = contador_for2 + 1	
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
	  Loop
    End If
	End If
	'Administração e Ambos
	If tp_relat = "1" or tp_relat = "2" Then
		flag_arq_impo_adm = 1
		contador_for = 1

        if objrsx.State = adStateOpen Then objrsx.Close
        sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_proc_adm & "',0) AS RESULTADO "
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
        diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

		if objrsx.State = adStateOpen Then objrsx.Close
	    sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
	    " FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
     	" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
    	"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
	    " WHERE PD.NR_PROCESSO   = '" & nr_proc_adm & "'"&_
     	" AND PD.IN_ATIVO      = '1'"&_
     	" AND TDD.IN_ENVIA_WEB = '1'"&_
		sql_088 &_
        sql_pendencias &_
    	" ORDER BY TDD.CD_TIPO_DOCTO  "
	    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
				
		If objrsx.RecordCount > 0 Then
		flag_campo_quebra = ""
		  Do While Not objrsx.Eof
		  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
		    If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
			  <tr height="16" style="font-weight: bold;background-color:<%=cabec_result%>"  class="gridtit" >
				<td colspan="3"><%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
			  
			
%>
						<tr height="16" bgcolor="<%= bgcolor%>">
                        <td align="center"><input type="checkbox" name="check_imp_adm<%=contador_for%>" id="check_imp_adm<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_adm%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
						<%
		
			contador_for = contador_for + 1	
		    objrsx.MoveNext 	
			If objrsx.Eof Then Exit Do
		  Loop	
	    End If	
	End If
	
	if objrs.State = adStateOpen Then objrs.Close	
	sql = "SELECT DISTINCT NR_PROCESSO_DES "&_
				"FROM TESTAGIO_PROCESSO (NOLOCK) "&_
				"WHERE NR_PROCESSO_ADM = '"& nr_proc_adm &"'"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
	if objrs.RecordCount > 0 then
	Do While Not objrs.Eof
		nr_proc_des = objrs.Fields.Item("NR_PROCESSO_DES").Value
		contador_for2 = 1
		contador_while = 1

        if objrsx.State = adStateOpen Then objrsx.Close
        sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_proc_des & "',0) AS RESULTADO "
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
        diretorio_docs = objrsx.Fields.Item("RESULTADO").Value
			
		if objrsx.State = adStateOpen Then objrsx.Close
	    sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
	    " FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
     	" INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
    	"                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
	    " WHERE PD.NR_PROCESSO   = '" & nr_proc_des & "'"&_
     	" AND PD.IN_ATIVO      = '1'"&_
     	" AND TDD.IN_ENVIA_WEB = '1'"&_
		sql_088 &_
        sql_pendencias &_
    	" ORDER BY TDD.CD_TIPO_DOCTO  "
	    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  

		If objrsx.RecordCount > 0 Then
		  flag_campo_quebra = ""	
		  Do While Not objrsx.Eof
		  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
		   If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
			  <tr height="16" style="font-weight: bold;background-color:<%=cabec_result%>"  class="gridtit">
				<td colspan="3"><%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
		  
		  
%>
					<tr height="16" bgcolor="<%= bgcolor%>">
					<td align="center"><input type="checkbox" name="check_imp_des<%=contador_while%><%=contador_for2%>" id="check_imp_des<%=contador_while%><%=contador_for2%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
						<td align="left">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_des%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
						<td align="center">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
					</tr>
					<%
			contador_for2 = contador_for2 + 1		
			objrsx.MoveNext
			If objrsx.Eof Then Exit Do
			Loop
		End If
		contador_while = contador_while +  1
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	End If
End If
%>
					</table>
				</div></td>
<%End If
%>
		</tr>
		<tr align="center">
			<td height="28" style="background-color:<%=topo_div %>;">
			<%
'Exibe conforme o cargo do usuário
%>
			<input name="flag_arq_expo" id="flag_arq_expo" type="hidden" class="textbox" value="<%=flag_arq_expo%>">
            <input name="flag_arq_impo_des" id="flag_arq_impo_des" type="hidden" class="textbox" value="<%=flag_arq_impo_des%>">
            <input name="flag_arq_impo_adm" id="flag_arq_impo_adm" type="hidden" class="textbox" value="<%=flag_arq_impo_adm%>">
            <input name="flag_processo_novo" id="flag_processo_novo" type="hidden" class="textbox" value="<%=flag_processo_novo%>">
            <input name="total_contador" id="total_contador" type="hidden" class="textbox" value="<%=contador_for%>">
            <input name="total_contador2" id="total_contador2" type="hidden" class="textbox" value="<%=contador_for2%>">
            <input name="total_contador_while" id="total_contador_while" type="hidden" class="textbox" value="<%=contador_while%>">
			<input type="button" name="enviar_arquivos" class="button" value="<%=tx_lang_POP097(cd_lang)%>" onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape' ,1);">
			<input type="button" name="fechar" class="button" value="<%= tx_lang_D00011(cd_lang)%>" onClick="window.close()"></td>
		</tr>		
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