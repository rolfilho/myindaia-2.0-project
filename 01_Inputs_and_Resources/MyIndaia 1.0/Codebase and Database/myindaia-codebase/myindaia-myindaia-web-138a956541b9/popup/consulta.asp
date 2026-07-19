<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Pop-up Auxiliar
'Arquivo de Script e HTML: Consulta OnLine
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vSQL
dim vTabela
dim vCampos
dim vTitulo
dim vOrdem
dim vEdit
in_show = False
cd_tela = "PUP004"
tx_erro = ""
'recupera as variaveis para montagem da consulta
vSQL    = Request("vSQL")
vTabela = Request("vTabela")
vCampos = Request("vCampos")
vTitulo = Request("vTitulo")
vReturn = Request("vReturn")
vOrdem  = Request("vOrdem")
vEdit   = Request("vEdit")
if not fnc_TestaVar(vSQL) then
	if not fnc_TestaVar(vTabela) then tx_erro = tx_erro&" - Nome da tabela não definido;\n"
	if not fnc_TestaVar(vCampos) then
		tx_erro = tx_erro&" - Campos para exibição não definidos;\n"
	else
		vCampos = Split(vCampos, ",", -1)
		if Ubound(vCampos) < 1 then tx_erro = tx_erro&" - Para montar a consulta são necessários 2 campos para exibição;\n"
	end if
end if
if not fnc_TestaVar(vReturn) then tx_erro = tx_erro&" - Campo de retorno não definido;\n"
if not fnc_TestaVar(vEdit)   then tx_erro = tx_erro&" - Não foi definido o formulário para retorno da informação;\n"

if not fnc_TestaVar(tx_erro) then
	if fnc_TestaVar(vSQL) then
		'recupera os campos da isntrução SQL
		vCampos = Mid(vSQL, 7, InStr(vSQL, "FROM")-8)
		vCampos = Split(vCampos, ",", -1)
		for cont = 0 to UBound(vCampos)
			vCampos(cont) = Trim(vCampos(cont))
		next
		sql = vSQL
	else
		'monta a instrução sql
		sql = ""
		if not fnc_TestaVar(vOrdem) then vOrdem = vCampos(1)
		for cont = 0 to UBound(vCampos)
			sql = sql&vCampos(cont)
			if cont < UBound(vCampos) then sql = sql&", "
		next
		sql = "SELECT "&sql&" FROM "&vTabela&" (NOLOCK) ORDER BY "& vOrdem
	end if
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'response.Write(vEdit)
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function RetornaValor(vCodigo) {
	//alert(<%'=vEdit%>)
	//alert(window.opener.document.forms[0].vEdit.value = vCodigo)
	eval('window.opener.document.forms[0].<%=vEdit%>.value = "'+vCodigo+'"');
	eval('window.opener.document.forms[0].<%=vEdit%>.focus()');
	eval('window.opener.document.forms[0].<%=vEdit%>.blur()');
	//alert('!');
	window.close();
}
/*
function Loading(nPos, nTotal) {
	var vPorcento = parseInt((nPos*100)/nTotal);
	textInLoad.innerHTML = '<p align="center"><b>CARREGANDO...</b><br>'+vPorcento+' %';
}*/
-->
</script>
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
<div id="textInLoad" style="position:absolute; top:45%; left:30%;">
<table width="170" height="70" border="1" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center"><span class="style1">CARREGANDO...</span><br>
			por favor aguarde.</td>
	</tr>
</table>
</div>			
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="<%=fundo_div %>">
  <form name="frmConsulta" onSubmit="return findInPage(this.edtPesquisa.value);">
    <input type="hidden" name="vSQL" value="<%=Request("vSQL")%>">
		<input type="hidden" name="vTabela" value="<%=Request("vTabela")%>">
    <input type="hidden" name="vCampos" value="<%=Request("vCampos")%>">
    <input type="hidden" name="vReturn" value="<%=Request("vReturn")%>">
    <input type="hidden" name="vEdit" value="<%=Request("vEdit")%>">
		<tr height="20" style="background-color:<%=topo_div%>;">
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td style="text-align:center;"><b>Consulta Online</b></td>           
          </tr>
        </table></td>
    </tr>
    <tr height="45">
      <td align="right"><input name="edtPesquisa" type="text" class="editbox" style="width:400px;border-color:<%=cabec_result%>;" onChange="n = 0;">
	  <input type="image" name="btnPesquisar" src="/imagens/icones/16x16/button_view20.gif" alt="Buscar" align="absmiddle">&nbsp;&nbsp;</nobr>
      </td>
    </tr>
    <tr>
      <td><div id="divConsulta" class="popupClass" style="width:500px;scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
          <table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
						<tr height="18">
						<%
if not fnc_TestaVar(vTitulo) then
	redim vTitulo(Ubound(vCampos))
	for cont = 0 to Ubound(vTitulo)
		vTitulo(cont) = "campo "& cont
	next
else
	vTitulo = Split(vTitulo, ",", -1)
end if

for cont = 0 to UBound(vTitulo)
%>
							<td class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;<%= vTitulo(cont)%>&nbsp;</td>
							<%
next
%>
						</tr>
						<%
if not fnc_TestaVar(tx_erro) then
	do while not objrs.Eof
		'alterna a cor das linhas
		if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
		   vTxHtml = "<tr height=15 bgcolor='"&bgcolor&"' onClick=""RetornaValor('"& objrs.Fields.Item(0).Value&"');"">"
		   for cont = 0 to UBound(vTitulo)
		   vTxHtml = vTxHtml&"<td><nobr>&nbsp;"&objrs.Fields.Item(cont).Value&"</nobr></td>"
		next
		Response.Write(vTxHtml&"</tr>")
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
end if
%>
          </table>
        </div></td>
    </tr>    
  </form>
</table>
</body>
</html>
<script language="javascript">
<!--
textInLoad.style.display="none";
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
