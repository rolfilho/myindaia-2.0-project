<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--

var gTpAcao = '<%= vTpAcao%>';

function abreReemissao(RapsInsere, RapsReemite) {
	var x = screen.width;
	var y = screen.height;
	
	var vWidth  = 750;
	var vHeight = 550;
	var vLeft   = (x-vWidth)/2;
	var vTop    = (y-vHeight)/2;
	
	features = "top="+vTop+",left="+vLeft+",width="+vWidth+",height="+vHeight+",scrollbars=no,menubar=no,resizable=no,status=yes";
  window.open('ccreemissao.asp?rapsInsere='+RapsInsere+'&rapsReemite='+RapsReemite+'&origem=docto',"win10",features);
}

function ValidaForm(vForm) {
	var valida = true;
	var vChecks = 0; e = 0;
	var aImport = []; aPais = []; aColeta = []; aIncoterm = [];
	var aTermoPgto = []; aExport = []; aLogo = []; aViaTransp = [];
	//verifica se mais de uma rap foi selecionada
	for (i=0; i<vForm.chkCodRapAno.length;i++) {
		if (vForm.chkCodRapAno[i].checked==true) {
			aImport[e] = vForm.chkCodRapAno[i].vCodImp;
			aPais[e] = vForm.chkCodRapAno[i].vCodPais;
			aColeta[e] = vForm.chkCodRapAno[i].vCodColeta;
			aIncoterm[e] = vForm.chkCodRapAno[i].vCodIncoterm;
			aTermoPgto[e] = vForm.chkCodRapAno[i].vCodTermoPgto;
			aExport[e] = vForm.chkCodRapAno[i].vCodExp;
			aLogo[e] = vForm.chkCodRapAno[i].vCodLogo;
			aViaTransp[e] = vForm.chkCodRapAno[i].vCodViaTransp;
			//if (vForm.chkCodRapAno[i].vNrCDE == '') {
			//	alert('Para que o embarque seja criado é necessário a que a instrução tenha a CDE informada!');
			//	valida = false;
			//	break;
			//}
			if (vForm.chkCodRapAno[i].vCodImp == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Cliente preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodPais == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o País de Destino preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodColeta == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Dep. de Coleta preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodIncoterm == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Incoterm informado!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodTermoPgto == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha a Cond. de Pagto. preenchida!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodExp == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Exportador preenchido!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodLogo == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha o Logotipo informado!');
				valida = false;
				break;
			}
			if (vForm.chkCodRapAno[i].vCodViaTransp == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha a Via de Transporte informada!');
				valida = false;
				break;
			}
			vChecks++; e++;
		}
	}
	//se mais de uma rap estiver selecionada, pergunta se quer consolidar
	if (vChecks > 1) {
		if (confirm('Embarque Consolidado?')) {
			vForm.vInConsolidado.value = '1';
			//verifica se o Importador das rap são os mesmos
			var vImp = aImport[0];
			for (i=0;i<aImport.length;i++) {
				if(vImp != aImport[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Cliente!');
					valida = false;
					break;
				}
			}
			//verifica se o País das rap são os mesmos
			var vPais = aPais[0];
			for (i=0;i<aPais.length;i++) {
				if(vPais != aPais[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo País de Destino!');
					valida = false;
					break;
				}
			}
			//verifica se o Dep de Coleta das rap são os mesmos
			/*var vDep = aColeta[0];
			for (i=0;i<aColeta.length;i++) {
				if(vDep != aColeta[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Dep. de Coleta!');
					valida = false;
					break;
				}
			}*/
			//verifica se o Incoterm das rap são os mesmos
			var vInc = aIncoterm[0];
			for (i=0;i<aIncoterm.length;i++) {
				if(vInc != aIncoterm[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Incoterm!');
					valida = false;
					break;
				}
			}
			//verifica se a Cond. de Pagto das rap são as mesmas
			var vCpg = aTermoPgto[0];
			for (i=0;i<aTermoPgto.length;i++) {
				if(vCpg != aTermoPgto[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesma Condição de Pagto.!');
					valida = false;
					break;
				}
			}
			//verifica se o Exportador das rap são os mesmos
			var vExp = aExport[0];
			for (i=0;i<aExport.length;i++) {
				if(vExp != aExport[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Exportador!');
					valida = false;
					break;
				}
			}
			//verifica se o Logotipo das rap são os mesmos
			var vLogo = aLogo[0];
			for (i=0;i<aLogo.length;i++) {
				if(vLogo != aLogo[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter o mesmo Logotipo!');
					valida = false;
					break;
				}
			}
			//verifica se a Via de Transporte das rap são os mesmos
			var vVia = aViaTransp[0];
			for (i=0;i<aViaTransp.length;i++) {
				if(vVia != aViaTransp[i]) {
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesma Via de Transporte!');
					valida = false;
					break;
				}
			}
		}
	}
	return valida;
}
-->
</script>
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")

dim vTpAcao : vTpAcao  = Request("vTpAcao")
dim aCodRap, aCodEmbarque, aCodRapReemissao, aCodRapInsercao
dim vNrRap, vNrCDE, vCodImp, vCodPais, vCodColeta, vCodIncoterm, vCodTermoPgto, vCodExp, vCodLogo, vCodViaTransp
dim vMostraReemissao
aCodRapReemissao = Request("vRaps")

sub subVerifica(nRapIni, nRapFim)
	dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
  dim vRapAux
  'antes de inserir verifica se há emissões
  vMostraReemissao = false
	aCodRapReemissao = ""
	aCodRapInsercao  = ""	
	vRapAux = nRapIni
  sql = ""
	do
		aCodRap(vRapAux) = Trim(aCodRap(vRapAux))	
		sql = "SELECT ISNULL(IN_DOCTO_ESTORNO, '0') AS DOCTO_ESTORNO "&_
					"  FROM TRAP (NOLOCK) " &_
					" WHERE CD_RAP + CD_RAP_ANO = '"& aCodRap(vRapAux) &"' "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		if objrs.Fields.Item("DOCTO_ESTORNO").Value then
			vMostraReemissao = true
			aCodRapReemissao = aCodRapReemissao & aCodRap(vRapAux) & ", " 
		else
		  acodRapInsercao = aCodRapInsercao & aCodRap(vRapAux) & ", "
		end if
		objrs.Close()	   
		if Request.Form("vInConsolidado") = "1" then vRapAux = vRapAux + 1 

	loop while vRapAux <= nRapFim

'  if Len(aCodRapReemissao) > 0 then
'	  aCodRapReemissao = Mid(aCodRapReemissao, 1, Len(aCodRapReemissao) - 2)
'	end if
	
	if vMostraReemissao then
%>
<script language="javascript">
	 abreReemissao("<%= aCodRapInsercao %>", "<%= aCodRapReemissao %>");
	 window.close();
</script>
<%    
	else
	  call subInsere(aCodRapInsercao)
%>
<script language="javascript">
	alert("Instruções autorizadas para emissão de Documentos."); 
	window.close();
</script>
<%		
	end if
	
end sub

sub subInsere(vListaRap)
	dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
  dim aListaRap
	dim vRapAux
	dim i
	
	'define o numero do embarque
	sql = "SELECT RIGHT('0000' + CONVERT(VARCHAR, ISNULL(MAX(NR_AUT_DOCTO), 0) + 1), 4) AS NR_AUT_DOCTO, " &_
				"       SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) AS ANO " &_
				"  FROM TRAP_DOCUMENTACAO (TABLOCK HOLDLOCK) " &_
				" WHERE NR_AUT_DOCTO_ANO = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	aCodEmbarque = objrs.Fields.Item("NR_AUT_DOCTO").Value&objrs.Fields.Item("ANO").Value
	objrs.Close()
	'insere as rap no embarque

	sql = ""
  aListaRap = Split(vListaRap, ",", - 1)
	for i = 0 to Ubound(aListaRap) - 1
		vRapAux = Trim(aListaRap(i))
		'insere a rap no embarque e atualiza o status da rap
		sql = "INSERT INTO TRAP_DOCUMENTACAO(NR_AUT_DOCTO, NR_AUT_DOCTO_ANO, CD_RAP, CD_RAP_ANO, "&_
					"  CD_STATUS, CD_USUARIO_CRIADOR, DT_INSERCAO) "&_
					"VALUES ('"&Left(aCodEmbarque, 4)&"', '"&Right(aCodEmbarque, 2)&"', '"&Left(vRapAux, 6)&"', "&_
					"  '"&Right(vRapAux, 2)&"', '2', '"&Session("cd_usuario")&"', CONVERT(datetime, '"&vData&"', 103)) "&_
					"UPDATE TRAP SET "&_
					"  CD_STATUS_DOCTO = '2', CD_USUARIO_AUT_DOCTO = '"&Session("cd_usuario")&"', DT_FINALIZADO_PEDIDO = CONVERT(datetime, '"&vData&"', 103) "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"& vRapAux &"' "& sql
  	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
   	objcnn.Execute(sql)
  next
end sub

'verifica se o form foi enviado
if (Request.Form <> "") then
	'verifica se a ação é salvar
	if (vTpAcao = "listar") and fnc_TestaVar(Request.Form("chkCodRapAno")) then
		'recupera as rap enviadas para embarque 
		aCodRap = Split(Request.Form("chkCodRapAno"), ",", -1)
		'verifica se o embarque vai ser consolidado
		if Request.Form("vInConsolidado") = "1" then
			call subVerifica(0, UBound(aCodRap))
			'renumera os itens dos fornecimentos para integração local
		else	
			for cont = 0 to UBound(aCodRap)
				call subVerifica(cont, -1)
			next
		end if
		
		if Err.Number <> 0 then
			tx_erro = "Foram encontrados erros durante a Autorização para emissão de Doctos.!\nNão foi possível criar o embarque.\n"& Err.Description
'		else
'			tx_erro = "Instruções autorizadas com sucesso!\n"
'			vTpAcao = "listar"
		end if
	end if
end if

if vTpAcao = "reemissao" then
  call SubInsere(aCodRapReemissao)
%>
<script language="javascript">
    window.close();
	</script>
<%	
end if
'exibe as rap que estão aguardando autorização para emissão de doctos
sql = "SELECT NR_CDE, CD_RAP, CD_RAP_ANO, CD_CLIENTE, CD_PAIS, CD_DEP_COLETA, CD_INCOTERM, CD_TERMO_PAGTO, CD_EXPORTADOR, "&_
			"  CD_LOGOMARCA, CD_VIA_TRANSPORTE, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_EMPRESA))) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE) AS NM_EMPRESA, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_PAIS))) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS) AS NM_PAIS "&_
			"FROM TRAP R (NOLOCK) "&_
			"WHERE CD_STATUS_DOCTO = '1' "&_
			"  AND IN_RAP_VALIDA_DOCTO = 1 "&_
			"  AND IN_PEDIDO_VALIDA = 1 "&_
			"ORDER BY CD_RAP_ANO DESC, CD_RAP DESC, DT_INSERCAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
  <form name="frmAutPed" action="" method="post" onSubmit="return ValidaForm(this);">
    <input type="hidden" name="cd_menu" value="<%= cd_menu%>">
    <input type="hidden" name="cd_subm" value="<%= cd_subm%>">
    <input type="hidden" name="cd_docto" value="<%= cd_docto%>">
    <input type="hidden" name="vTpAcao" value="salvar">
    <input type="hidden" name="vInConsolidado" value="0">
    <tr height="25">
      <td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="titpopup">&nbsp;Autorizar para Emissão de Documentos</td>
            <td width="25"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><div id="embarque" class="popupClass" style="width:550px;">
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
            <tr height="18">
              <td class="gridtit">&nbsp;Enviar</td>
              <td class="gridtit">&nbsp;Nr. Instrução</td>
              <td class="gridtit">&nbsp;Cliente/Importador</td>
              <td class="gridtit">&nbsp;País de Destino</td>
              <td class="gridtit">&nbsp;Incoterm</td>
              <td class="gridtit">&nbsp;Transporte</td>
              <td class="gridtit">&nbsp;Exportador</td>
              <td class="gridtit">&nbsp;Logomarca</td>
              <td class="gridtit">&nbsp;Coleta</td>
              <td class="gridtit">&nbsp;Cond. Pagto.</td>
            </tr>
            <%
if objrs.RecordCount > 0 then
	'lista RAP´s para exibi-las em tela
	do while not objrs.Eof
		vNrRap = objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value
		vNrCDE = objrs.Fields.Item("NR_CDE").Value
		vCodImp = objrs.Fields.Item("CD_CLIENTE").Value
		vCodPais = objrs.Fields.Item("CD_PAIS").Value
		vCodColeta = objrs.Fields.Item("CD_DEP_COLETA").Value
		vCodIncoterm = objrs.Fields.Item("CD_INCOTERM").Value
		vCodTermoPgto = objrs.Fields.Item("CD_TERMO_PAGTO").Value
		vCodExp = objrs.Fields.Item("CD_EXPORTADOR").Value
		vCodLogo = objrs.Fields.Item("CD_LOGOMARCA").Value
		vCodViaTransp = objrs.Fields.Item("CD_VIA_TRANSPORTE").Value
%>
            <tr bgcolor="#FFFFFF">
              <td align="center"><input type="checkbox" name="chkCodRapAno" value="<%= vNrRap%>" vNrCDE="<%= vNrCDE%>" vCodImp="<%= vCodImp%>" vCodPais="<%= vCodPais%>" vCodColeta="<%= vCodColeta%>" vCodIncoterm="<%= vCodIncoterm%>" vCodTermoPgto="<%= vCodTermoPgto%>" vCodExp="<%= vCodExp%>" vCodLogo="<%= vCodLogo%>" vCodViaTransp="<%= vCodViaTransp%>"/></td>
              <td><%= Left(vNrRap, 6)&"/"&Right(vNrRap, 2)%>&nbsp;</td>
              <td><%= objrs.Fields.Item("NM_EMPRESA").Value%>&nbsp;</td>
              <td><%= objrs.Fields.Item("NM_PAIS").Value%>&nbsp;</td>
              <td><%= objrs.Fields.Item("CD_INCOTERM").Value%>&nbsp;</td>
              <td><% if fnc_TestaVar(vCodViaTransp) then Response.Write(aViaTransp(CInt(vCodViaTransp)-1))%>
                &nbsp;</td>
              <td><%= objrs.Fields.Item("CD_EXPORTADOR").Value%>&nbsp;</td>
              <td><% if fnc_TestaVar(vCodLogo) then Response.Write(logo_saint(vCodLogo))%>
                &nbsp;</td>
              <td><%= objrs.Fields.Item("CD_DEP_COLETA").Value%>&nbsp;</td>
              <td><%= objrs.Fields.Item("CD_TERMO_PAGTO").Value%>&nbsp;</td>
            </tr>
            <%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
	objrs.Close()
else
	Response.Write("<tr height='16' class='gridtit'><td colspan='10' align='left'>&nbsp;Não existem instruções válidas para se autorizar para emissão de documentação.&nbsp;</td></tr>")
end if
%>
          </table>
        </div></td>
    </tr>
    <tr height="35" align="center">
      <td><input type="submit" class="button" name="btnEnviar" value="Autoriza para emissão de Dcumentos" />
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
if (gTpAcao == "listar") window.opener.location.href='cadastro.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&acao=listar';
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
