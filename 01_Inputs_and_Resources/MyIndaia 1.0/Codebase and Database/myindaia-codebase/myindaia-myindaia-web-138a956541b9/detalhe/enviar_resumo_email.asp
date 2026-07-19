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
 Response.Charset="ISO-8859-1" %>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim objfso      'objeto para o sistema de arquivos
Dim objfolder   'pasta onde estarão os arquivos
Dim tx_caminho  'caminho da pasta onde estão os arquivos
Dim tx_arquivo  'nome dos arquivos para download
Dim nr_proc_adm 'numero do processo de administração de pedido
Dim nr_proc_des 'numero do processo de desembaraço
Dim contador_for, contador_for2, contador_while, nr_proc_reduzido
Dim flag_arq_expo,	flag_arq_impo_des,	flag_arq_impo_adm, flag_processo_novo, flag_campo_quebra, sql_088

nr_proc_adm = Request.QueryString("nr_processo")
nr_proc_des = Request.QueryString("nr_processo")
tp_relat    = "1"

If tp_relat = 0 Then
	If fnc_TestaVar(nr_proc_des) Then nr_processo = nr_proc_des Else nr_processo = nr_proc_adm
Else
	If fnc_TestaVar(nr_proc_adm) Then nr_processo = nr_proc_adm Else nr_processo = nr_proc_des
End If
If Not fnc_TestaVar(nr_processo) Then nr_processo = CStr(Request("nr_processo"))
nr_proc_reduzido = Mid(nr_processo, 5, 10)

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


Set objfso = Server.CreateObject("Scripting.FileSystemObject")
%>
    <html> 
    <head>
    <!--#include virtual="/includes/lay_title.asp"-->
    </head>   
    <body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
    <form name="frmEnviaDetalheEmail" method="post" action="enviar_arquivos_email.asp?nr_processo=<%=nr_processo %>&cd_produto=<%=Mid(nr_processo, 3, 2)%>" onSubmit="return fnc_Valida(this);">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>" >
    <tr>
    <td align="left" valign="middle" height="10px">&nbsp;</td>
    </tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="120px" valign="middle"><%=tx_lang_POP095(cd_lang)%>:&nbsp;</td><td align="left" ><input name="nm_email" id="nm_email" type="text" value="" class="textbox" style="width:340px;height:20px;" onBlur="verificaEmail(this);"></td>
     </tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="120px" valign="middle">CC:&nbsp;</td><td align="left" ><input name="nm_cc" id="nm_cc" type="text" value="" class="textbox" style="width:340px;height:20px;"></td></tr>
     <tr align="left" valign="top" height="20px">
     <td align="right" width="120px" valign="middle"><%=tx_lang_POP096(cd_lang)%>:&nbsp;</td><td align="left"><input name="nm_assunto" id="nm_assunto" type="text" value="[myIndaiáWeb Mail] Informações gerais do processo <%= nr_proc_reduzido%>" class="textbox" style="width:340px;height:20px;"></td></tr>
     <tr align="left" valign="top" height="55px">
    <td colspan="2"><center><textarea name="nm_msg" style="width:420px;height:55px;overflow:auto;" class="editbox"></textarea><br /></center><br /></td>
    </tr>      
    <tr>
    <td colspan="2">&nbsp;&nbsp;Selecione abaixo os arquivos que deseja anexar no email:</td>
    </tr>
    <tr>
    <td colspan="2">
    <div style="height:180px;overflow:auto;">
     <%If flag_processo_novo <> 1 Then%> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr height="16" color:#000000;">
                        	<td align="center"><br />Não existem documentos para este processo.</td>
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
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_processo%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
						</tr>
             <%End if%>
<%else%>                        
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_processo%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
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
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_adm<%=contador_while%><%=contador_for%>" id="check_imp_adm<%=contador_while%><%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
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
						<tr height="16">
                        	<td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_des<%=contador_for2%>" id="check_imp_des<%=contador_for2%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
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
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_adm<%=contador_for%>" id="check_imp_adm<%=contador_for%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_proc_adm%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
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
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_des<%=contador_while%><%=contador_for2%>" id="check_imp_des<%=contador_while%><%=contador_for2%>" value="<%= tx_arquivo.Name%>" onClick="mudaValor(this, '<%= tx_arquivo.Name%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/docs/<%= nr_proc_des%>/<%= tx_arquivo.Name%>" target="_blank"><%= tx_arquivo.Name%></a></td>
							<td align="right" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= Round( tx_arquivo.Size / 1024, 1 )%> KB</td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= fnc_Mascara(tx_arquivo.DateCreated, 5)%></td>
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
                <%Else%>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">					                        
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
	'recupera o nome dos arquivos e preenche a tabela

    if objrsx.State = adStateOpen Then objrsx.Close
    sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & nr_processo & "',0) AS RESULTADO "
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
    diretorio_docs = objrsx.Fields.Item("RESULTADO").Value

	if objrsx.State = adStateOpen Then objrsx.Close
	sql = "SELECT PD.NM_ARQUIVO AS ARQUIVO, PD.NM_DESCRICAO AS DESCRICAO, TDD.NM_TIPO_DOCTO AS TIPO, PD.DT_CRIACAO AS CRIACAO "&_
    " FROM BROKER.DBO.TPROCESSO_DOCTOS PD "&_
    " INNER JOIN BROKER.DBO.TTP_DOCTO_DIGITALIZADO TDD ON TDD.ID_TABELA     = PD.ID_TABELA "&_
    "                                 AND TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO "&_
    " WHERE PD.NR_PROCESSO   = '" & nr_processo & "'"&_
    " AND PD.IN_ATIVO      = '1'"&_
    " AND TDD.IN_ENVIA_WEB = '1'"&_
	sql_088 &_
	" ORDER BY TDD.CD_TIPO_DOCTO  "
    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  

    flag_campo_quebra = ""
	If objrsx.RecordCount > 0 Then
	Do While Not objrsx.Eof
		If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
		  <tr height="16" bgcolor="<%=topo_div %>" style="font-weight: bold; color:#000000;">
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
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_processo%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
						</tr>
             <%End if%>
<%else%>                        
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_exp<%=contador_for%>" id="check_exp<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_processo%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
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
	        " ORDER BY TDD.CD_TIPO_DOCTO  "
			objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
				
			If objrsx.RecordCount > 0 Then
			flag_campo_quebra = ""
			Do While Not objrsx.Eof
			
			If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
			  %>
			  <tr height="16" bgcolor="<%=topo_div%>" style="font-weight: bold; color:#000000;">
				<td colspan="3">&nbsp;<%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
				
%>
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_adm<%=contador_while%><%=contador_for%>" id="check_imp_adm<%=contador_while%><%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_adm%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
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
	" ORDER BY TDD.CD_TIPO_DOCTO  "
	objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
	
			
	If objrsx.RecordCount > 0 Then
	flag_campo_quebra = ""	
	  Do While Not objrsx.Eof
	  
	  If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
	  %>
          <tr height="16" bgcolor="<%=topo_div %>" style="font-weight: bold; color:#000000;">
            <td colspan="3">&nbsp;<%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
          </tr>
		<%
        End If
        flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
%>
						<tr height="16">
                        	<td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_des<%=contador_for2%>" id="check_imp_des<%=contador_for2%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%=diretorio_docs %>/<%= nr_proc_des%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
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
    	" ORDER BY TDD.CD_TIPO_DOCTO  "
	    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  
				
		If objrsx.RecordCount > 0 Then
		flag_campo_quebra = ""
		  Do While Not objrsx.Eof
		  
		    If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
			  <tr height="16" bgcolor="<%=topo_div %>" style="font-weight: bold; color:#000000;">
				<td colspan="3">&nbsp;<%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
			  
			
%>
						<tr height="16">
                        <td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_adm<%=contador_for%>" id="check_imp_adm<%=contador_for%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
							<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%= diretorio_docs%>/<%= nr_proc_adm%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
							<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
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
    	" ORDER BY TDD.CD_TIPO_DOCTO  "
	    objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly  

		If objrsx.RecordCount > 0 Then
		  flag_campo_quebra = ""	
		  Do While Not objrsx.Eof
		  
		   If flag_campo_quebra <> Trim(objrsx.Fields.Item("TIPO").Value) Then
		  %>
			  <tr height="16" bgcolor="<%=topo_div %>" style="font-weight: bold; color:#000000;">
				<td colspan="3">&nbsp;<%=Trim(objrsx.Fields.Item("TIPO").Value)%></td>
			  </tr>
			<%
			End If
			flag_campo_quebra = Trim(objrsx.Fields.Item("TIPO").Value)
		  
		  
%>
					<tr height="16">
					<td align="center" style="border-width: 1px 0px 0px 1px;"><input type="checkbox" name="check_imp_des<%=contador_while%><%=contador_for2%>" id="check_imp_des<%=contador_while%><%=contador_for2%>" value="<%= objrsx.Fields.Item("ARQUIVO").Value%>" onClick="mudaValor(this, '<%= objrsx.Fields.Item("ARQUIVO").Value%>');"></td>
						<td align="left" style="border-width: 1px 0px 0px 0px;">&nbsp;<a href="/<%=diretorio_docs%>/<%= nr_proc_des%>/<%= objrsx.Fields.Item("ARQUIVO").Value%>" target="_blank"><%= objrsx.Fields.Item("DESCRICAO").Value%></a></td>
						<td align="center" style="border-width: 1px 0px 0px 0px;">&nbsp;<%= objrsx.Fields.Item("CRIACAO").Value%></td>
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
<%End If%>
</div>
</td>   
    <input name="flag_arq_expo" id="flag_arq_expo" type="hidden" class="textbox" value="<%=flag_arq_expo%>">
    <input name="flag_arq_impo_des" id="flag_arq_impo_des" type="hidden" class="textbox" value="<%=flag_arq_impo_des%>">
    <input name="flag_arq_impo_adm" id="flag_arq_impo_adm" type="hidden" class="textbox" value="<%=flag_arq_impo_adm%>">
    <input name="flag_processo_novo" id="flag_processo_novo" type="hidden" class="textbox" value="<%=flag_processo_novo%>">
    <input name="total_contador" id="total_contador" type="hidden" class="textbox" value="<%=contador_for%>">
    <input name="total_contador2" id="total_contador2" type="hidden" class="textbox" value="<%=contador_for2%>">
    <input name="total_contador_while" id="total_contador_while" type="hidden" class="textbox" value="<%=contador_while%>">
    </tr>
    <tr>
    <td colspan="2" style="text-align:right;"><input id="chbCompleto" type="checkbox" checked name="chbCompleto"/>Modo Completo&nbsp;&nbsp;</td>
    </tr> 
     <tr height="26" style="background-color:<%=topo_div%>;">
    <td colspan="2" align="center"> <input name="submit_resumo" id="submit_resumo" type="submit" class="button" value="<%=tx_lang_POP094(cd_lang)%>" disabled="true"></td>
    </tr>
    </table>
    </form>
    </body>
    </html>
<%
Set objfolder = Nothing
Set objfso    = Nothing
%>