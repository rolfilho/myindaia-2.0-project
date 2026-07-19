<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")

dim vCodRapInsere: vCodRapInsere = Request("rapsInsere")
dim vOrigem : vOrigem = Request("origem")
dim vCodRap : vCodRap  = Request("rapsReemite")
dim aCodRap : aCodRap  = Split(vCodRap, ",", -1)
dim vNewCodRap
dim vNrRap, vTxMotivo
dim check
dim vMotivo
dim i, vVlLinha

'verifica se o form foi enviado
if (Request.Form <> "") then
  vNewCodRap = ""
  i = 0
	for i = 0 to Request.Form("total")
	  check = Request.Form("chkCodRap"&i) 
		vNrRap = Request.Form("nr_rap"&i)
		vMotivo = Request.Form("txMotivo"&i)
		
		if check <> "" then
			sql = "UPDATE TRAP SET IN_DOCTO_ESTORNO = '0', IN_AUT_REEMISSAO = '1', TX_MOT_REEMISSAO = '"& vMotivo &"' "&_
			 			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"' AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
  	  objcnn.Execute(sql)
			vNewCodRap = vNewCodRap & vNrRap & ", "
		end if
	next
	
	if Len(vCodRapInsere) > 0 then 
  	vCodRapInsere = vCodRapInsere & ", " & vNewCodRap
  else
    vCodRapInsere = vNewCodRap	
	end if 	
		
  'verifica pra onde deve voltar
  if vOrigem = "embarque" then
	  url = "ccembarque.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=reemissao&vRaps="&vCodRapInsere
	elseif  vOrigem = "docto" then
	  url = "ccautped.asp?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&vTpAcao=reemissao&vRaps="&vCodRapInsere
	end if	
%>
<script language="javascript">
	alert('Reemissões autorizadas com sucesso.');
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 550;
	var vHeight = 400;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
	window.open('<%= url%>',"embarque",features);
	window.close();
</script>
<%	
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
function ValidaForm(vForm) {
	var valida = true;
  var valor;
	//verifica se mais de uma rap foi selecionada
	valor = document.GravaReemissao.total.value;
	for (i=0; i<valor;i++) {
		if (eval('document.GravaReemissao.chkCodRap'+i).checked==true) {  
			if (eval('document.GravaReemissao.txMotivo'+i).value == '') {
			  alert('Para autorizar uma reemissão é preciso informar o seu motivo.');
				valida = false;
				break;
			}	
		}
	}
	return valida;
}
-->
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
  <tr height="25">
    <td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="titpopup">&nbsp;Autorizar Reemissão de Documentos</td>
          <td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><div id="reemissao" class="popupClass" style="width:750px;">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
          <tr height="18">
            <td width="20"  class="gridtit">&nbsp;</td>
            <td width="80"  class="gridtit">&nbsp;Nr. Rap</td>
            <td width="650" class="gridtit">&nbsp;Motivo da Reemissão</td>
          </tr>
          <form name="GravaReemissao" action="" method="post" onSubmit="return ValidaForm(this);"/>
          <%
if Len(vCodRap) > 0 then
	'lista RAP´s para exibi-las em tela
	i = 0
	for i= 0 to UBound(aCodRap) - 1
		sql = "SELECT RTRIM(LTRIM(CD_RAP)) + '/' + RTRIM(LTRIM(CD_RAP_ANO)) AS RAP, NR_REEMISSAO, "&_
		      "  TX_MOTIVO, CONVERT(VARCHAR, DT_AUTORIZACAO, 103) AS DT_AUT,  "&_
					"  (SELECT NM_USUARIO FROM TUSUARIO U (NOLOCK) WHERE U.CD_USUARIO = R.CD_USUARIO) AS USUARIO "&_
					"FROM TRAP_REEMISSAO_DOCTO R (NOLOCK) "&_
					"WHERE RTRIM(LTRIM(CD_RAP)) + RTRIM(LTRIM(CD_RAP_ANO)) = '"& aCodRap(i) &"' AND CD_GRUPO = '" & session("GrupoUsuario") & "'"
   	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
  	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    vNrRap = Trim(aCodRap(i))
%>
          <tr bgcolor="#FFFFFF" height="20">
            <input type="hidden" name="nr_rap<%= i %>" value="<%= vNrRap%>"/>
            <td width="20" align="center"><input type="checkbox" name="chkCodRap<%= i %>" /></td>
            <td width="80">&nbsp;<%= Left(vNrRap, 6)&"/"&Right(vNrRap, 2)%>&nbsp;</td>
            <td width="650" align="center"><input class="editbox" type="text" style="width:635px;" name="txMotivo<%= i %>" value=""/>
              &nbsp;</td>
          </tr>
          <%
    vTxMotivo = ""	
		if objrs.RecordCount > 0 then 
    vVlLinha = (objrs.RecordCount)*18 + 62
%>
          <tr height="<%= vVLLinha %>" bgcolor="#DEDEDE">
            <td colspan="3"><table width="80%"  style="vertical-align:middle;" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#336699">
                <tr height="18" bgcolor="#F0F0F0">
                  <td colspan="3"  align="left"><b>&nbsp;Histórico de Reemissões</b></td>
                </tr>
                <tr height="18" bgcolor="#F0F0F0">
                  <td width="80"  align="left"><b>&nbsp;Data</b></td>
                  <td width="120" align="left"><b>&nbsp;Usuário</b></td>
                  <td width="380" align="left"><b>&nbsp;Motivo de Reemissões</b></td>
                </tr>
                <%      			
     	do while not objrs.Eof 
			  vTxMotivo = "Data: "& objrs.Fields.Item("DT_AUT").Value & " - " & 	objrs.Fields.Item("TX_MOTIVO").Value & ".<br>"
%>
                <tr height="18" bgcolor="#E0E0E0">
                  <td><nobr>&nbsp;<%= objrs.Fields.Item("DT_AUT").Value %></nobr></td>
                  <td><nobr>&nbsp;<%= objrs.Fields.Item("USUARIO").Value %></nobr></td>
                  <td>&nbsp;<%= objrs.Fields.Item("TX_MOTIVO").Value %>&nbsp;</td>
                </tr>
                <%
    		objrs.MoveNext
  	  	if objrs.Eof then exit do
    	loop
    
%>
              </table>
              <br></td>
          </tr>
          <%		
		end if	
  	objrs.Close()

    i = i + 1
 	next
else
	Response.Write("<tr height='16' class='gridtit'><td colspan='10' align='left'>&nbsp;Não existem Reemissões para serem validadas.&nbsp;</td></tr>")
end if
%>
        </table>
      </div></td>
  </tr>
  <tr height="35" align="center">
    <td><input type="hidden" name="total" value="<%= i - 1 %>" />
      <input type="submit" class="button" name="btnEnviar" value="Autorizar Reemissões Selecionadas" />
      <input type="button" class="button" name="btnCancelar" value="Cancelar" onClick="window.close();" /></td>
  </tr>
  <tr height="15" align="center">
    <td bgcolor="#DBDADA"><p><b><a href="http://www.myindaia.com.br/" target="_blank">Indai&aacute; Log&iacute;stica
        Internacional</a></b></p></td>
  </tr>
  </form>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
