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

'exibição na tela
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
        <input type="hidden" name="vInTipo" value="<%= vInTipo %>">
		<input type="hidden" name="vQryStr" value="vNrRap=<%=vNrRap%>&vInTipo=<%=vInTipo%>">
		<input type="hidden" name="vScript" value="<%= Request.ServerVariables("SCRIPT_NAME")%>">
		<input type="hidden" name="vArquivo" value="">
		<input type="hidden" name="vExtensao" value="*">
        <input type="hidden" name="vNrRapGrupo" value="<%= vNrRap & Session("GrupoUsuario")%>">		
		<tr height="15">
			<td style="padding: 2px;">Selecione o arquivo: 
				<input type="file" name="vArqOri" class="editbox" style="width:100%;"></td>
		</tr>
		<tr height="15">
			<td align="center" valign="top">&nbsp;
 			<input type="submit" name="btnIntegrar" class="button" value="Enviar Arquivo" >&nbsp;
				<input type="button" name="btnCancelar" class="button" value="Cancelar" onClick="window.close();"><br></td>
		</tr>
	</form>
<%
if vIntegra = 1 then

If Session("InMostraFollowup") = "1" or Session("InMostraFollowupCheck") = "1" Then				
	sql = "INSERT INTO TRAP_FOLLOWUP (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_EVENTO, DT_REALIZACAO, CD_USUARIO_REALIZACAO) VALUES "&_
	 " ('"&left(vNrRap,6)&"', '"&right(vNrRap,2)&"','"&Session("GrupoUsuario")&"','004', GETDATE(),'"&Session("cd_usuario")&"')	"
	objcnn.Execute(sql)	  
End If	


%>
<script>
window.focus();
window.opener.location.href="cadastro.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&vNrRap=<%=vNrRap%>&vTpAcao=salvar";
 </script>
<%
End if											 
%>    
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