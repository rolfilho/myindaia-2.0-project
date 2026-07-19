<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")

dim vInTipo : vInTipo = Request.QueryString("vInTipo")
dim vIntegra : vIntegra = Request.QueryString("vInUpLoad")
dim vNrRap : vNrRap = Request.QueryString("vNrRap")
dim vArqOri : vArqOri = Request.QueryString("vArqOri")
dim vNewArq : vNewArq = Request.QueryString("vNewArq")
dim vTitulo, vCaminho, vArquivo, vOk
		dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
		dim aListaRap
		dim vRapAux
		dim vEmail, vEmail2
		dim vInEmail, vInEmail2
		dim vInFornecimento
		dim vInPackList

vArqOri  = Split(vArqOri,"\",-1)
vNewArq  = Split(vNewArq,"\",-1)

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
	if (vForm.vArqOri.value == '') {
		alert('Informe o arquivo para iniciar o envio ao servidor!');
		vForm.vArqOri.focus();
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

-->
</script>
<style type="text/css">
.divInteg {
	border: 1px solid #999999;
	background: #DCDCDC;
	width: 100%;
	height: 100%;
	overflow: scroll;
}
</style>
</head>

<body onLoad="document.frmIntegra.vArqOri.focus();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<form name="frmIntegra" action="/arquivo/upsalvar.asp" method="post" enctype="multipart/form-data" onSubmit="return ValidaForm(this);">
		<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
		<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
		<input type="hidden" name="cd_docto" value="<%= cd_docto%>">
		<input type="hidden" name="vQryStr" value="vNrRap=<%=vNrRap%>&vInTipo=<%=vInTipo%>">
		<input type="hidden" name="vScript" value="<%= Request.ServerVariables("SCRIPT_NAME")%>">
		<input type="hidden" name="vArquivo" value="<%= vArquivo&"_"&vNrRap&"_"&Replace(CStr(Date),"/","")&"_"&Replace(CStr(Time),":","")&".xls"%>">
		<% select case vInTipo
	     case 1,3 %>
		<input type="hidden" name="vExtensao" value="xls">
		<% case 0, 2 %>
		<input type="hidden" name="vExtensao" value="txt">
    <% end select %>

		<tr height="25">
			<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td class="titpopup">&nbsp;Integrar <%= vTitulo%></td>
						<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
					</tr>
				</table></td>
		</tr>
		<tr height="25">
		<% select case vInTipo
	     case 1,3 %>
			<td style="padding: 5px;">Selecione o arquivo Excel(xls) contendo os dados do <%= vTitulo %>
    <% case 0, 2 %>
			<td style="padding: 5px;">Selecione o arquivo Texto(txt) contendo os dados do(a) <%= vTitulo %>
    <% end select %>
				<input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
		</tr>
		<tr height="25">
			<td align="center" valign="bottom">&nbsp;
 			<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo" >
			
				<input type="button" name="btnCancelar" class="button" value="Cancelar" onClick="window.close();"></td>
		</tr>
		<tr height="100">
			<td style="padding: 5px;"><div id="divInteg" class="divInteg">
					<%
'verifica se é para realizar a integração
if vIntegra = 1 then
	vCaminho = Server.MapPath("/arquivo/upload/")
	if Right(vCaminho,1) <> "\" then vCaminho = vCaminho&"\"
	'Salva dados do Fornecimento(xls)/Packing List(xls) na tabela
	call subGravaCaminho(vInTipo)
	'cria o objeto para integração da planilha
	dim objIntegra 
	set objIntegra = Server.CreateObject("MyCOM.IntegraPlan")
	if vInTipo = 0 then 'INTEGRAÇÃO DO FORNECIMENTO
		if Mid(vArqOri(UBound(vArqOri)), 13, 1) = "2" then
			if Mid(vArqOri(UBound(vArqOri)), 4, 8) = vNrRap then	
				If Session("cd_usuario") = "1801" Then
					Response.write vCaminho&vNewArq(UBound(vNewArq))
					Response.end
				End If
				
				select case objIntegra.Remessa(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))
				
					case 0 vOk = "alert('Fornecimento(s) integrado(s) com sucesso!');window.opener.location.href='cadastro.asp?"&_
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
		'abre o documento excel 
		select case objIntegra.PackingList(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))
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
		select case objIntegra.RemessaXls(vNrRap,Session("GrupoUsuario"),SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))			
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
		<tr height="15" align="center" bgcolor="#DBDADA">
			<td colspan="3"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica Internacional</a></b></p></td>
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