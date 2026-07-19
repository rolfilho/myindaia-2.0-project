<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Exportação/Integração
'Arquivo de Script e HTML: Integração de arquivo Excel
'
'Autor Kleber Guedes
'Manutenção: Alexandre(11/05/2007)
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'variaveis de controle do form
dim vTitulo, vInTipo, vIntegra, vCaminho, vArquivo, vOk
'variaveis para inclusão de dados
dim vNrRap, vNrIdent, vCodItem, vArqOri, vNewArq
dim vNrFornec, aNrFornec, vNaoFornec, vSimFornec
'variaveis da integração
dim vNrFornecXls, vCodMerc, vVlQtde, vTxUnMedida, vVlPrecoUnit, vTxMoeda, vItemCliente
dim vVlPrecoTotal, vTxProforma, vCodIncoterm, vCodModPagto, vNrReferencia, vDtPedido
dim vCodVolume, vTxEmbalagem, vVlPesoLiqTot, vVlPesoBrutoTot, vVlM3, vDtPack, vVlPesoLiq
dim vAltura, vLargura, vCompr

in_show  = false
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
cd_view  = Request.QueryString("cd_view")
tx_erro  = Request.QueryString("tx_erro")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

vInTipo  = Request.QueryString("vInTipo")
vIntegra = Request.QueryString("vInUpLoad")
vNrRap   = Request.QueryString("vNrRap")
vArqOri  = Request.QueryString("vArqOri")
vNewArq  = Request.QueryString("vNewArq")
vArqOri  = Split(vArqOri,"\",-1)
vNewArq  = Split(vNewArq,"\",-1)

sub subGravaCaminho(sInTipo)
	dim objFSO  : set objFSO  = Server.CreateObject("Scripting.FileSystemObject")
	dim objFile : set objFile = objFSO.GetFile(vCaminho&vNewArq(UBound(vNewArq)))
	'verifica se já existe arquivo no servidor, se encontrar apaga
	sql = "INSERT INTO TRAP_ARQUIVO (CD_RAP, CD_RAP_ANO, IN_TIPO, CD_USER, DT_ENVIO, TX_ARQ_ORIG, TX_ARQ_SERV) "&_
				"VALUES ('"&Left(vNrRap,6)&"', '"&Right(vNrRap,2)&"', '"&sInTipo&"', '"&Session("cd_usuario")&"', "&_
				"  CONVERT(datetime, '"&objFile.DateCreated&"', 103), '"&vArqOri(UBound(vArqOri))&"', '"&vNewArq(UBound(vNewArq))&"')"
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
	
	set objFile = Nothing
	set objFSO  = Nothing
end sub
'exibição na tela
select case vInTipo
	case 0
		vTitulo = "Fornecimento"
		vArquivo = "fornec"
	case 1
		vTitulo = "Packing List"
		vArquivo = "packing"
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
		<input type="hidden" name="vExtensao" value="xls">
		<tr height="25">
			<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="25">
						<td class="titpopup">&nbsp;Integrar <%= vTitulo%></td>
						<td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
					</tr>
				</table></td>
		</tr>
		<tr height="25">
			<td style="padding: 5px;">Selecione o arquivo Excel(xls) contendo os dados do <%= vTitulo %>
				<input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
		</tr>
		<tr height="25">
			<td align="center" valign="bottom">&nbsp;
				<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo">
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
	dim objIntegra : set objIntegra = Server.CreateObject("MyCOM.IntegraPlan")
	
	if vInTipo = 0 then 'INTEGRAÇÃO DO FORNECIMENTO
		'abre o documento excel
		select case objIntegra.Remessa(vNrRap,SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))
			case 0 vOk = "alert('Fornecimento(s) integrado(s) com sucesso!');window.opener.location.href='integra_rap.asp?"&_
									 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"
			case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
			case 2 vOk = "alert('Não foi possível fechar o arquivo!')"
			case 3 vOk = "alert('Uma ou mais planilhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
			case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais fornecimentos e realizar a intengração!')"
		end select
		
	elseif vInTipo = 1 then 'INTEGRAÇÃO DO PACKING LIST
		'abre o documento excel 
		select case objIntegra.PackingList(vNrRap,SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))
			case 0 vOk = "alert('Packing List integrado com sucesso!');window.opener.location.href='integra_rap.asp?"&_
									 "cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vNrRap="&vNrRap&"&vTpAcao=editar';"
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
			.Execute , , adExecuteNoRecords
		end with
	end if
	set objIntegra = nothing
	'altera a flag de envio de erro por e-mail
	sql = "UPDATE TRAP SET IN_EMAIL_ERRO = 0 WHERE CD_RAP+CD_RAP_ANO = '"&vNrRap&"'"
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
<%
'exibe infos da integração
if fnc_TestaVar(vOk) then Response.Write("<script>"&vOk&"</script>")
%>
<script language="javascript" type="text/javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
