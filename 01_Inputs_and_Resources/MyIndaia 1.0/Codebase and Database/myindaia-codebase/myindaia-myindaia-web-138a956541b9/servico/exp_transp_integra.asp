<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_usuario = Request.QueryString("cd_usuario")

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
		Dim cd_transp_rod

vArqOri  = Split(vArqOri,"\",-1)
vNewArq  = Split(vNewArq,"\",-1)

If objrsx.State = adStateOpen Then objrsx.Close()
sql = "SELECT CD_TRANSP_ROD FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = '" & cd_usuario  & "'"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
If objrsx.RecordCount > 0 Then
	Session("cd_transp_rod") = objrsx.Fields.Item("CD_TRANSP_ROD").Value
End If
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

<body onLoad="document.frmIntegra.vArqOri.focus();">

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
	<form name="frmIntegra" action="/arquivo/upsalvar.asp" method="post" enctype="multipart/form-data" onSubmit="return ValidaForm(this);">
		<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
		<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
		<input type="hidden" name="cd_docto" value="<%= Session("cd_usuario")%>">
		<input type="hidden" name="vScript" value="<%= Request.ServerVariables("SCRIPT_NAME")%>">
        <input type="hidden" name="vInTipo" value="0">
		<input type="hidden" name="vArquivo" value="<%="Integra_"&Replace(CStr(Date),"/","")&"_"&Replace(CStr(Time),":","")&".xls"%>">
		<input type="hidden" name="vExtensao" value="xls">
		<tr height="25" bgcolor="#b4c7db" align="center">
			<td >&nbsp;<b>Integrar Arquivo</b></td>					
		</tr>
		<tr height="25">
			<td style="padding: 5px;">Selecione o arquivo Excel(xls):
				<input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
		</tr>
		<tr height="25">
			<td align="center" valign="bottom">&nbsp;
 			<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo" >
			
				<input type="button" name="btnCancelar" class="button" value="Cancelar" onClick="window.close();"></td>
		</tr>
		<tr height="100">
			<td style="padding: 2px;"><div id="divInteg" class="divInteg" style="overflow-x:hidden;width:495px;">
					<%
'verifica se é para realizar a integração


if vIntegra = 1 then
	vCaminho = Server.MapPath("/arquivo/upload/")


	if Right(vCaminho,1) <> "\" then vCaminho = vCaminho&"\"
	'Salva dados do Fornecimento(xls)/Packing List(xls) na tabela
	'cria o objeto para integração da planilha
	dim objIntegra 
	set objIntegra = Server.CreateObject("MyCOM.IntegraPlan")
    select case objIntegra.TranspXls(Session("cd_transp_rod"),SQLSERVER,vCaminho&vNewArq(UBound(vNewArq)))			
		case 0 vOk = "alert('Arquivo integrado com sucesso!');"								 
		case 1 vOk = "alert('Não foi possível abrir o arquivo!');"
		case 2 vOk = "alert('Não foi possível fechar o arquivo!');"
		case 3 vOk = "alert('Uma ou mais linhas do arquivo enviado não é um modelo válido, ou faltam informações de reconhecimento!');"
		case 4 vOk = "alert('O sistema não conseguiu apagar 1 ou mais fornecimentos e realizar a intengração!');"
	end select
	
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