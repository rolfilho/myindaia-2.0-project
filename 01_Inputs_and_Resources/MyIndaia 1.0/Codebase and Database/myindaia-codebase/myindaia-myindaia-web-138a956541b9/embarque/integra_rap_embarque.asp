<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Integração
'Arquivo de Script e HTML: Envio de Embarque
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vTpAcao, aCodRap, aCodEmbarque, vNrRap, vNrCDE
dim vCodImp, vCodPais, vCodColeta, vCodIncoterm, vCodTermoPgto, vCodExp, vCodLogo, vCodViaTransp

sub subInsereEmbarque(nRapIni, nRapFim)
	dim vData : vData = fnc_Mascara(Date, 5)&" "&fnc_Mascara(Time, 7)
	'define o numero do embarque
	sql = "SELECT RIGHT('0000' + CONVERT(VARCHAR, ISNULL(MAX(CD_EMBARQUE), 0) + 1), 4) AS EMBARQUE, " &_
				"       SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) AS ANO " &_
				"  FROM TRAP_EMBARQUE (TABLOCK HOLDLOCK) " &_
				" WHERE CD_EMBARQUE_ANO = SUBSTRING(CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR), 3, 2) "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	aCodEmbarque = objrs.Fields.Item("EMBARQUE").Value&objrs.Fields.Item("ANO").Value
	objrs.Close()
	'insere as rap no embarque
	sql = ""
	do
		aCodRap(nRapIni) = Trim(aCodRap(nRapIni))
		'insere a rap no embarque e atualiza o status da rap
		sql = "INSERT INTO TRAP_EMBARQUE(CD_EMBARQUE, CD_EMBARQUE_ANO, CD_RAP, CD_RAP_ANO, "&_
					"  CD_STATUS, CD_USUARIO_CRIADOR, DT_INSERCAO) "&_
					"VALUES ('"&Left(aCodEmbarque, 4)&"', '"&Right(aCodEmbarque, 2)&"', '"&Left(aCodRap(nRapIni), 6)&"', "&_
					"  '"&Right(aCodRap(nRapIni), 2)&"', '2', '"&Session("cd_usuario")&"', CONVERT(datetime, '"&vData&"', 103)) "&_
					"UPDATE TRAP SET "&_
					"  CD_STATUS = '2', CD_USUARIO_FIM = '"&Session("cd_usuario")&"', DT_FINALIZADO = CONVERT(datetime, '"&vData&"', 103) "&_
					"WHERE CD_RAP+CD_RAP_ANO = '"& aCodRap(nRapIni) &"' "& sql
		if Request.Form("vInConsolidado") = "1" then nRapIni = nRapIni + 1
	loop while nRapIni <= nRapFim
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
	
	'calcula o peso liquido dos itens
	with objcmd
		.CommandTimeOut = 60
		.CommandText    = "sp_rap_calc_peso_liq"
		.CommandType    = adCmdStoredProc
		.Parameters.Refresh
		.Parameters("@nrEmbarque") = aCodEmbarque
		.Execute , , adExecuteNoRecords
	end with
end sub

in_show  = False
cd_tela  = "EXP023"
cd_menu  = Request("cd_menu")
cd_subm  = Request("cd_subm")
cd_docto = Request("cd_docto")
tx_erro  = Request("tx_erro")
vTpAcao  = Request("vTpAcao")
'vInConsolidado = 
'verifica se o form foi enviado
if (Request.Form <> "") then
	'verifica se a ação é salvar
	if (vTpAcao = "salvar") and fnc_TestaVar(Request.Form("chkCodRapAno")) then
		'recupera as rap enviadas para embarque 
		aCodRap = Split(Request.Form("chkCodRapAno"), ",", -1)
		'verifica se o embarque vai ser consolidado
		if Request.Form("vInConsolidado") = "1" then
			call subInsereEmbarque(0, UBound(aCodRap))
			'renumera os itens dos fornecimentos para integração local
			sql = "SELECT COUNT(*), E.CD_RAP+E.CD_RAP_ANO "&_
						"FROM TRAP_EMBARQUE E (NOLOCK), TRAP_FORNECIMENTO F (NOLOCK) "&_
						"WHERE E.CD_EMBARQUE+E.CD_EMBARQUE_ANO = '"&aCodEmbarque&"' "&_
						"  AND E.CD_RAP+E.CD_RAP_ANO = F.CD_RAP+F.CD_RAP_ANO "&_
						"GROUP BY E.CD_RAP+E.CD_RAP_ANO "&_
						"ORDER BY COUNT(*) DESC"
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			if objrs.RecordCount > 1 then
				cont = objrs.Fields.Item(0).Value
				objrs.MoveNext
				
				do while not objrs.Eof
					sql = "UPDATE TRAP_FORNECIMENTO SET "&_
								"  CD_ITEM = RIGHT('000'+CAST((CD_ITEM + "&cont&") as varchar(3)), 3) "&_
								"WHERE CD_RAP+CD_RAP_ANO = '"&objrs.Fields.Item(1).Value&"'"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
					
					cont = cont + objrs.Fields.Item(0).Value
					objrs.MoveNext
					if objrs.Eof then exit do
				loop
			end if
			objrs.Close()
		else	
			for cont = 0 to UBound(aCodRap)
				call subInsereEmbarque(cont, -1)
			next
		end if
		
		if Err.Number <> 0 then
			tx_erro = "Foram encontrados erros durante a criação do embarque!\nNão foi possível criar o embarque.\n"& Err.Description
		else
			tx_erro = "Embarque criado com sucesso!\n"
			vTpAcao = "listar"
		end if
	end if
end if
'exibe as rap que estão aguardando embarque
sql = "SELECT NR_CDE, CD_RAP, CD_RAP_ANO, CD_CLIENTE, CD_PAIS, CD_DEP_COLETA, CD_INCOTERM, CD_TERMO_PAGTO, CD_EXPORTADOR, "&_
			"  CD_LOGOMARCA, CD_VIA_TRANSPORTE, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_EMPRESA))) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE) AS NM_EMPRESA, "&_
			"  (SELECT LOWER(LTRIM(RTRIM(NM_PAIS))) FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = R.CD_PAIS) AS NM_PAIS "&_
			"FROM TRAP R (NOLOCK) "&_
			"WHERE CD_STATUS      = '1' "&_
			"  AND IN_RAP_VALIDA  = 1 "&_
			"  AND IN_FORN_VALIDA = 1 "&_
			"  AND IN_PACK_VALIDA = 1 "&_
			"ORDER BY CD_RAP_ANO DESC, CD_RAP DESC, DT_INSERCAO"
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" type="text/javascript">
<!--
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
			if (vForm.chkCodRapAno[i].vNrCDE == '') {
				alert('Para que o embarque seja criado é necessário a que a instrução tenha a CDE informada!');
				valida = false;
				break;
			}
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
					alert('Para o embarque ser consolidado todas as instruções devem ter a mesmo Exportador!');
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
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DEDEDE">
	<form name="frmEmbarque" action="" method="post" onSubmit="return ValidaForm(this);">
		<input type="hidden" name="cd_menu" value="<%= cd_menu%>">
		<input type="hidden" name="cd_subm" value="<%= cd_subm%>">
		<input type="hidden" name="cd_docto" value="<%= cd_docto%>">
		<input type="hidden" name="vTpAcao" value="salvar">
		<input type="hidden" name="vInConsolidado" value="0">
		<tr height="25">
			<td background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="titpopup">&nbsp;Montar Embarque</td>
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
							<td class="gridtit">&nbsp;Nr. CDE</td>
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
							<td><%= objrs.Fields.Item("NR_CDE").Value%>&nbsp;</td>
							<td><%= objrs.Fields.Item("NM_EMPRESA").Value%>&nbsp;</td>
							<td><%= objrs.Fields.Item("NM_PAIS").Value%>&nbsp;</td>
							<td><%= objrs.Fields.Item("CD_INCOTERM").Value%>&nbsp;</td>
							<td><% if fnc_TestaVar(vCodViaTransp) then Response.Write(aViaTransp(CInt(vCodViaTransp)-1))%>&nbsp;</td>
							<td><%= objrs.Fields.Item("CD_EXPORTADOR").Value%>&nbsp;</td>
							<td><% if fnc_TestaVar(vCodLogo) then Response.Write(logo_saint(vCodLogo))%>&nbsp;</td>
							<td><%= objrs.Fields.Item("CD_DEP_COLETA").Value%>&nbsp;</td>
							<td><%= objrs.Fields.Item("CD_TERMO_PAGTO").Value%>&nbsp;</td>
						</tr>
						<%
		objrs.MoveNext
		if objrs.Eof then exit do
	loop
	objrs.Close()
else
	Response.Write("<tr height='16' class='gridtit'><td colspan='10' align='left'>&nbsp;Não existem instruções válidas para se criar um embarque.&nbsp;</td></tr>")
end if
%>
					</table>
				</div></td>
		</tr>
		<tr height="35" align="center">
			<td><input type="submit" class="button" name="btnEnviar" value="Cria Embarque" />
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
<% if vTpAcao = "listar" then%>
window.opener.location.href='integra_rap.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&acao=listar';
<% end if %>
window.focus();
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->
