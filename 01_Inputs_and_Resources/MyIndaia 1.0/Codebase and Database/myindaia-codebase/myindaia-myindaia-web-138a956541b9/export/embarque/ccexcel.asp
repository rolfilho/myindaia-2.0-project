<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim objIntegra 
dim vInTipo : vInTipo = Request.QueryString("vInTipo")
dim cont_arquivo_total, cont_arquivo
dim vIntegra : vIntegra = Request.QueryString("vInUpLoad")
dim vNrRap : vNrRap = Request.QueryString("vNrRap")
dim vArqOri : vArqOri = Request.QueryString("vArqOri")
dim vFile : vFile = Request.QueryString("File")
dim vNewArq : vNewArq = Request.QueryString("vNewArq")
dim vTitulo, vCaminho, vArquivo, vOk
		dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
		dim aListaRap
		dim vRapAux
		dim vEmail, vEmail2
		dim vInEmail, vInEmail2
		dim vInFornecimento
		dim vInPackList

select case vInTipo
case 1,3
	vNewArq  = Split(vNewArq,";",-1)
case 0,2
	vNewArq  = Split(vNewArq,"\",-1)
	vArqOri  = Split(vArqOri,"\",-1)
end select 	

function fncExibeForma(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case nTipo
		case 0 vReturn = " Gr&aacute;fica"
		case 1 vReturn = " A Remeter"
		case else vReturn = ""
	end select
	fncExibeForma = vReturn
end function

function fncSelecionaLogo(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case CInt(nTipo)
		case 0 vReturn = "logo_sg0.jpg"
		case 1 vReturn = "logo_sg1.jpg"
		case 2 vReturn = "logo_sg2.jpg"
		case 3 vReturn = "logo_sg3.jpg"
		case else vReturn = "logo_no.jpg"
	end select
	fncSelecionaLogo = vReturn
end function

sub subGravaCaminho(sInTipo)
	dim objFSO  : set objFSO  = Server.CreateObject("Scripting.FileSystemObject")
	dim objFile : set objFile = objFSO.GetFile(vCaminho&vNewArq(UBound(vNewArq)))
	'verifica se já existe arquivo no servidor, se encontrar apaga
	sql = "INSERT INTO TRAP_ARQUIVO (CD_RAP, CD_RAP_ANO, CD_GRUPO, IN_TIPO, CD_USER, DT_ENVIO, TX_ARQ_ORIG, TX_ARQ_SERV) "&_
				"VALUES ('"&Left(vNrRap,6)&"', '"&Right(vNrRap,2)&"', '" & Trim(Session("GrupoUsuario")) & "', '"&sInTipo&"', '"&Session("cd_usuario")&"', "&_
				"  CONVERT(datetime, '"&objFile.DateCreated&"', 103), '"&vArqOri(UBound(vArqOri))&"', '"&vNewArq(UBound(vNewArq))&"')"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
	
	set objFile = Nothing
	set objFSO  = Nothing
end sub
'exibição na tela
select case vInTipo
	case 0,3
		If Session("GrupoUsuario") = "028" Then
			vTitulo = "Fornecimento"
		Else
			vTitulo = "Processo"
		End if
		vArquivo = "fornec"
	case 1
		vTitulo = "Packing List"
		vArquivo = "packing"
	case 2
		vTitulo = "Remessa"
		vArquivo = "remessa"
	case else
		Response.Write("<script>"&_
		"	alert('ERRO\n\nTipo de integração não especificada!\nEntre em contato com o suporte.');"&_
		"	window.close();"&_
		"</script>")
		Response.End()
end select
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function ValidaForm(vForm) {
	var valida = true;
	if (vForm.File.value == '') {
		alert('Informe o arquivo para iniciar o envio ao servidor!');
		vForm.File.focus();
		valida = false;
	}
	return valida;
}

function abreIntegraPE(nr_rap) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 750;
	var vHeight = 550;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
  window.open('integra_PE.asp?nr_rap='+nr_rap,"win8",features); 
}

function retiraEdit(){ 	
   var filtro = 'File'; 
   var contador = eval('document.frmIntegra.contador' + filtro + '.value ');
   var div = eval("document.getElementById('camposTexto"+ filtro+"');");
   
   var linha = 'linhaFile'+contador;
   linha = document.getElementById(linha);
   var removido = div.removeChild(linha); 
	
   contador--;
   eval('document.frmIntegra.contador' + filtro + '.value =' + contador); 	
   if (eval('document.frmIntegra.contador' + filtro + '.value') == 1){
	eval("document.all.camposTexto"+ filtro +".style.display='none'");
	eval("document.getElementById('" + filtro + "1').focus();");
	eval('document.frmIntegra.' + filtro + '1.focus();');
   }else{
	eval("document.getElementById('" + filtro + "1').focus();");
	eval('document.frmIntegra.' + filtro + '1.focus();');
   }
}

function criaEdit(bg_btn){
	var filtro = 'File';
	var tamanho = 480;
	eval("document.all.camposTexto"+ filtro +".style.display='block'");
	var div_filtro = eval("document.getElementById('camposTexto"+ filtro+"');");  	
	var contador = eval('document.frmIntegra.contador' + filtro + '.value ');
	
	contador++;
	if (contador <= 8 ){
		var linha_edit = "<div id='linhaFile"+contador+"' style='height:19px'><input class='editbox' type='file' name='File"+contador+"' id='File"+contador+"' style='width:"+(tamanho-17)+"px;' onKeyPress='if(window.event.shiftKey && event.keyCode == 45){retiraEdit(\"linha"+filtro+contador+"\");return false;}if(window.event.shiftKey && event.keyCode == 43){criaEdit();return false;}'><a href='#' onClick='retiraEdit(\"linha"+filtro+contador+"\");'>&nbsp;<img src='/imagens/30/btn_menos"+bg_btn+".gif' style='border:0;' class='top'></a><input type='hidden' name='Arquivo"+contador+"' id='Arquivo"+contador+"' value='<%= vArquivo&"_"&vNrRap&"_"&Replace(CStr(Date),"/","")&"_"&Replace(CStr(Time),":","")%>"+contador+".xls'></div>";	
		div_filtro.innerHTML = div_filtro.innerHTML+linha_edit;  
		eval('document.frmIntegra.' + filtro +""+ contador + '.focus();');
		eval('document.frmIntegra.contador' + filtro + '.value =' + contador);  	 	
	}else{
		alert('ATENÇÃO: É possível fazer a integração de até no máximo 8 arquivos!')
	}
}
-->
</script>
<style type="text/css">
.divInteg {
	border: 1px solid #b4c7db;
	background: #f0f1f6;
	width: 100%;
	height: 100%;
	overflow: scroll;
}
</style>
</head>
<body onLoad="<%if Not InStr("0;2", vInTipo) > 0 Then%>document.frmIntegra.File1.focus();<%End If %>" style="overflow:visible;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div%>">
	<form name="frmIntegra" action="/arquivo/upsalvar.asp" method="post" enctype="multipart/form-data" onSubmit="return ValidaForm(this);">
		<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
		<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
		<input type="hidden" name="cd_docto" value="<%= cd_docto%>">
        <input type="hidden" name="vInTipo" value="<%= vInTipo %>">
		<input type="hidden" name="vQryStr" value="vNrRap=<%=vNrRap%>&vInTipo=<%=vInTipo%>">
		<input type="hidden" name="vScript" value="<%= Request.ServerVariables("SCRIPT_NAME")%>">
		<input type="hidden" name="vArquivo" value="<%= vArquivo&"_"&vNrRap&"_"&Replace(CStr(Date),"/","")&"_"&Replace(CStr(Time),":","")&".xls"%>">
		<% select case vInTipo
	     case 1,3 %>
		<input type="hidden" name="vExtensao" value="xls">
		<% case 0, 2 %>
		<input type="hidden" name="vExtensao" value="txt">
    <% end select %>
		<tr height="16" style="background-color:<%=topo_div%>;">
			<td><table width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr height="16">
						<td align="center">&nbsp;<b>Integrar <%= vTitulo%></b></td>						
					</tr>
				</table></td>
		</tr>
		<tr height="25">
		<% select case vInTipo
	     case 1,3 %>
			<td style="padding: 5px;">Selecione o arquivo Excel(xls) contendo os dados do <%= vTitulo %>	
             <br><b>(Primeiramente, crie todos os campos necessários e só depois selecione os arquivos)</b>
            	<input type="file" id="File1" name="File1" class="editbox" style="width:480px;height:19px;">&nbsp;<a href="#" onClick="criaEdit('<%=bg_btn %>');"><img id="imgFile" src='/imagens/30/btn_mais<%=bg_btn %>.gif' style='border:0;' class='top'></a><img align="left" id="imgFile2" src='/imagens/30/btn_mais_3.gif' style='border:0;visibility:hidden' class='top'><input type="text" style="display:none" value="1" name="contadorFile" id="contadorFile"><input type="hidden" name="Arquivo1" id="Arquivo1" value="<%= vArquivo&"_"&vNrRap&"_"&Replace(CStr(Date),"/","")&"_"&Replace(CStr(Time),":","")&"1.xls"%>"><div id="camposTextoFile" style="display:none;">
                </td>
    <% case 0, 2 %>
			<td style="padding: 5px;">Selecione o arquivo Texto(txt) contendo os dados do(a) <%= vTitulo %>
            <input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
    <% end select %>   
		</tr>
		<tr height="25">
			<td align="center" valign="bottom">&nbsp;
 			<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo" >
			
				<input type="button" name="btnCancelar" class="button" value="Cancelar" onClick="window.close();"></td>
		</tr>
		<tr height="100">
			<td style="padding: 2px;"><div id="divInteg" class="divInteg" style="overflow-x:hidden;scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;width:515px;background-color:<%=fundo_div%>;border-color:<%=topo_div%>;">
					<%
if vIntegra = 1 then 
	set objIntegra = Server.CreateObject("MyCOM.IntegraPlan")	
		vCaminho = Server.MapPath("/arquivo/upload/")
		if Right(vCaminho,1) <> "\" then vCaminho = vCaminho&"\"
	'Salva dados do Fornecimento(xls)/Packing List(xls) na tabela
		'call subGravaCaminho(vInTipo)
	'cria o objeto para integração da planilha
		if vInTipo = 0 then 'INTEGRAÇÃO DO FORNECIMENTO
			if Mid(vArqOri(UBound(vArqOri)), 13, 1) = "2" then
				if Mid(vArqOri(UBound(vArqOri)), 4, 8) = vNrRap then				
					select case objIntegra.Remessa(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))
						case 0 vOk = "alert('Fornecimentos(s) integrado(s) com sucesso!');window.opener.location.href='cadastro.asp?"&_
											 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"
							with objcmd
								.CommandTimeOut = 60
								.CommandText    = "sp_rap_verifica_reemissao"
								.CommandType    = adCmdStoredProc
								.Parameters.Refresh
								.Parameters("@nrRap") = vNrRap
								.Parameters("@nrGrupo") = Trim(Session("GrupoUsuario"))
								.Execute , , adExecuteNoRecords
							end with	
						
							If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
								sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
				 " ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','002', GETDATE(),'"&Session("cd_usuario")&"')	"
								objcnn.Execute(sql)	  
							End If		
						
						case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
						case 2 vOk = "alert('Não foi possível fechar o arquivo!');"
						case 3 vOk = "alert('Uma ou mais linhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
						case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais fornecimentos e realizar a intengração!');"
					end select
				else
					vOk = "alert('Arquivo não corresponde a RAP na qual ele está sendo integrado');"
				end if
			else
				vOk = "alert('O arquivo não corresponde ao MOMENT ID (1) no qual esta sendo integrado');"
			end if
		elseif vInTipo = 1 then 'INTEGRAÇÃO DO PACKING LIST
			cont_arquivo_total = Request.QueryString("vContador")		
			If 	cont_arquivo_total > 1 Then
				For cont_arquivo = 0 to cont_arquivo_total - 1
			'abre o documento excel 
					select case objIntegra.PackingList(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(cont_arquivo))
						case 0 vOk = "alert('Packing List integrado com sucesso!');window.opener.location.href='cadastro.asp?"&_
										 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"
										 
							If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
								sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
								" ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','003', GETDATE(),'"&Session("cd_usuario")&"')	"
								objcnn.Execute(sql)	  
							End If						 				 
						case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
						case 2 vOk = "alert('Não foi possível fechar o arquivo!')"
						case 3 vOk = "alert('Uma ou mais planilhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
						case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais volumes e realizar a intengração!')"
					end select
			
					with objcmd
						.CommandTimeOut = 60
						.CommandText = "sp_rap_verifica_pack"
						.CommandType = adCmdStoredProc
						.Parameters.Refresh
						.Parameters("@nrRap") = vNrRap
						.Parameters("@nrGrupo") = Trim(Session("GrupoUsuario"))
						.Execute , , adExecuteNoRecords
					end with
				Next	
			Else
				cont_arquivo = 0
				select case objIntegra.PackingList(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(cont_arquivo))
					case 0 vOk = "alert('Packing List integrado com sucesso!');window.opener.location.href='cadastro.asp?"&_
									 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"
									 
						If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
							sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
				 			" ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','003', GETDATE(),'"&Session("cd_usuario")&"')	"
							objcnn.Execute(sql)	  
						End If						 
									 
					case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
					case 2 vOk = "alert('Não foi possível fechar o arquivo!')"
					case 3 vOk = "alert('Uma ou mais planilhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
					case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais volumes e realizar a intengração!')"
				end select
		
				with objcmd
					.CommandTimeOut = 60
					.CommandText = "sp_rap_verifica_pack"
					.CommandType = adCmdStoredProc
					.Parameters.Refresh
					.Parameters("@nrRap") = vNrRap
					.Parameters("@nrGrupo") = Trim(Session("GrupoUsuario"))
					.Execute , , adExecuteNoRecords
				end with
			'Next	
			End If
		elseif vInTipo = 2 then
			if Mid(vArqOri(UBound(vArqOri)), 13, 1) = "1" then
				if Mid(vArqOri(UBound(vArqOri)), 4, 8) = vNrRap then	
					select case objIntegra.RemessaTxt(vNrRap,SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))	
						case 0 vOk = "alert('Pedido(s) integrado(s) com sucesso!');window.opener.location.href='cadastro.asp?"&_
											 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar'; abreIntegraPE("&vNrRap&");"		 
						case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
					end select
				else
					vOk = "alert('Arquivo não corresponde a RAP na qual ele está sendo integrado');"
				end if
			else
				vOk = "alert('O arquivo não corresponde ao MOMENT ID (1) no qual esta sendo integrado');"
			end if
		elseif vInTipo = 3 then
			cont_arquivo_total = Request.QueryString("vContador")		
			If 	cont_arquivo_total > 1 Then
				For cont_arquivo = 0 to cont_arquivo_total - 1
					select case objIntegra.RemessaXls(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(cont_arquivo))			
						case 0 vOk = "alert('Processos(s) integrado(s) com sucesso!');window.opener.location.href='cadastro.asp?"&_
												 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"		
						with objcmd
							.CommandTimeOut = 60
							.CommandText = "sp_rap_verifica_fornec"
							.CommandType = adCmdStoredProc
							.Parameters.Refresh
							.Parameters("@nrRap") = vNrRap
							.Parameters("@nrGrupo") = Trim(Session("GrupoUsuario"))
							.Execute , , adExecuteNoRecords
						end with								
				
						If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
							sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
							 " ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','002', GETDATE(),'"&Session("cd_usuario")&"')	"
							objcnn.Execute(sql)	  
						End If	
					 
						case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
						case 2 vOk = "alert('Não foi possível fechar o arquivo!');"
						case 3 vOk = "alert('Uma ou mais linhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
						case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais fornecimentos e realizar a intengração!');"
					end select
				Next	
			Else
				cont_arquivo = 0
				select case objIntegra.RemessaXls(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(cont_arquivo))			
					case 0 vOk = "alert('Processos(s) integrado(s) com sucesso!');window.opener.location.href='cadastro.asp?"&_
												 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"		
					with objcmd
						.CommandTimeOut = 60
						.CommandText = "sp_rap_verifica_fornec"
						.CommandType = adCmdStoredProc
						.Parameters.Refresh
						.Parameters("@nrRap") = vNrRap
						.Parameters("@nrGrupo") = Trim(Session("GrupoUsuario"))
						.Execute , , adExecuteNoRecords
					end with								
				
					If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
						sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
						 " ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','002', GETDATE(),'"&Session("cd_usuario")&"')	"
						objcnn.Execute(sql)	  
					End If	
				 
					case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
					case 2 vOk = "alert('Não foi possível fechar o arquivo!');"
					case 3 vOk = "alert('Uma ou mais linhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
					case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais fornecimentos e realizar a intengração!');"
				end select
			End If	
		end if
	set objIntegra = nothing
	'altera a flag de envio de erro por e-mail

	sql = "UPDATE TRAP SET IN_EMAIL_ERRO = 0"&_
			" WHERE CD_GRUPO = '" & session("GrupoUsuario") & "'"&_
	 		" AND CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
end if
%>
				</div></td>
		</tr>		
	</form>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
window.focus();
<%if fnc_TestaVar(vOk) then Response.Write(vOk)%>
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->