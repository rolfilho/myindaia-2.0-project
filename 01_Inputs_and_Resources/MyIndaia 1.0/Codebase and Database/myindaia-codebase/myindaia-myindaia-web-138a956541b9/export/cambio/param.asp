<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Prog: Controle de Contratos de Câmbio Exportação - Parâmetros
'Autor: Alexandre Neto
'Data: 09/10/2007
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"
cd_menu = Request.QueryString("cd_menu")
cd_subm = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
tx_erro = Request.QueryString("tx_erro")
nm_tela = "Exportação >> Contrato de Câmbio >> Parâmetros"

dim vGrupoRequest : vGrupoRequest = Request.QueryString("vCdGrupo")
dim vBcoRequest : vBcoRequest = Request.QueryString("vCdBco")
dim vCtaRequest : vCtaRequest = Request.QueryString("vCta")
dim vTpAcao : vTpAcao = Request.QueryString("vTpAcao")
in_show = true

dim vInserir, vGrupos
dim vCdGrupo, vNmGrupo, vTpDocto, vCdComp, vCdDeb, vCdCred, vCdDebCust, vCdCredCust, vCdACC, vCdACE, vCdACCDespJur, vCdACCProvJur, vHeader1, vHeader2, vHeader3
dim vTpDoctoR, vCdCompR, vCdDebR, vCdCredR, vCdDebCustR, vCdCredCustR, vCdACCR, vCdACER, vCdACCDespJurR, vCdACCProvJurR, vHeader1R, vHeader2R, vHeader3R
dim vNrBco,	vNrCta

if vTpAcao = "deletar" then
	sql = "DELETE FROM TCONT_CAMB_PARAM_BCO WHERE CD_GRUPO = '"& vGrupoRequest & "' AND NR_BCO = '"& vBcoRequest &"' "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute sql, num
  vTpAcao = "listar"
  if num > 0 then
%>
<script language="javascript">
	alert("Banco excluído com sucesso!");
</script>
<%		
	end if
end if

if vTpAcao = "alterar" then
	sql = "UPDATE TCONT_CAMB_PARAM_BCO SET NR_CTA = '"& vCtaRequest &"' WHERE CD_GRUPO = '"& vGrupoRequest & "' AND NR_BCO = '"& vBcoRequest &"' "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute sql, num
  vTpAcao = "listar"
  if num > 0 then
%>
<script language="javascript">
	alert("Conta Bancária alterada com sucesso!");
</script>
<%		
	end if
end if

if vTpAcao = "criar" then
  vInserir = true
	if Trim(vBcoRequest) = "" then 
%>
<script language="javascript">
   alert("O número do Novo Banco não pode ser vazio!");
</script>
<%			
	else
	  if objrsx.State = adStateOpen then objrsx.Close
    sql = "SELECT NR_BCO FROM TCONT_CAMB_PARAM_BCO (NOLOCK) WHERE CD_GRUPO = '"&vGrupoRequest&"'"
    Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
	  do while not objrsx.Eof 
		  if Trim(vBcoRequest) = objrsx.Fields.Item("NR_BCO").Value then
        vInserir = false
%>
<script language="javascript">
	alert("Novo Banco já existe para este grupo.");
</script>
<%
			end if
		  objrsx.MoveNext
		  if objrsx.Eof then exit do
	  loop

    if vInserir then
    	sql = "INSERT INTO TCONT_CAMB_PARAM_BCO(CD_GRUPO, NR_BCO, NR_CTA) VALUES('"& vGrupoRequest & "', '"& vBcoRequest &"', '"& vCtaRequest &"') "
    	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
    	objcnn.Execute sql, num
      vTpAcao = "listar"
      if num > 0 then
    %>
<script language="javascript">
   alert("Novo Banco criado com sucesso!");
</script>
<%		
    	end if
		end if	
  end if
end if


if (Request.Form <> "") and (vTpAcao = "salvar") then
	vTpDoctoR      = Trim(Request.Form("edtTpDocto"&vGrupoRequest))
	vCdCompR       = Trim(Request.Form("edtCdComp"&vGrupoRequest))
	vCdDebR        = Trim(Request.Form("edtDeb"&vGrupoRequest))
	vCdCredR       = Trim(Request.Form("edtCred"&vGrupoRequest))
	vCdDebCustR    = Trim(Request.Form("edtDebCust"&vGrupoRequest))
	vCdCredCustR   = Trim(Request.Form("edtCredCust"&vGrupoRequest))
	vCdACCR        = Trim(Request.Form("edtACC"&vGrupoRequest))
	vCdACER        = Trim(Request.Form("edtACE"&vGrupoRequest))
	vCdACCDespJurR = Trim(Request.Form("edtACCDespJur"&vGrupoRequest))
	vCdACCProvJurR = Trim(Request.Form("edtACCProvJur"&vGrupoRequest))	
	vHeader1R      = Trim(Request.Form("edtHeader1"&vGrupoRequest))	
	vheader2R      = Trim(Request.Form("edtHeader2"&vGrupoRequest))	
	vHeader3R      = Trim(Request.Form("edtHeader3"&vGrupoRequest))	
	
	sql = "UPDATE TCONT_CAMB_PARAM SET  "&_
				"  TP_DOCTO = "&fncValSQL(vTpDoctoR, 0)&", "&_
				"  CD_COMP = "&fncValSQL(vCdCompR, 0)&", "&_
				"  CD_PSTK_DEB = "&fncValSQL(vCdDebR, 0)&", "&_
				"  CD_PSTK_CRED = "&fncValSQL(vCdCredR, 0)&", "&_
				"  CD_PSTK_DEB_CUST = "&fncValSQL(vCdDebCustR, 0)&", "&_
				"  CD_PSTK_CRED_CUST = "&fncValSQL(vCdCredCustR, 0)&", "&_
				"  CD_CTA_ACC = "&fncValSQL(vCdACCR, 0)&", "&_
				"  CD_CTA_ACE = "&fncValSQL(vCdACER, 0)&", "&_
				"  CD_CTA_ACC_DESP_JUR = "&fncValSQL(vCdACCDespJurR, 0)&", "&_
				"  CD_CTA_ACC_PROV_JUR = "&fncValSQL(vCdACCProvJurR, 0)&", "&_			
				"  TX_HEADER1 = "&fncValSQL(vHeader1R, 0)&", "&_
				"  TX_HEADER2 = "&fncValSQL(vHeader2R, 0)&", "&_
				"  TX_HEADER3 = "&fncValSQL(vHeader3R, 0)&" "&_			
				"WHERE CD_GRUPO = "&fncValSQL(vGrupoRequest, 0)
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute sql, num

  if num > 0 then
%>
<script language="javascript">
	alert("Alterações realizadas com sucesso!");
</script>
<%		
	end if
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="/engine/calendar.css" />
<script type="text/javascript" src="/engine/calendar.js"></script>
<script type="text/javascript" src="/engine/lang/calendar-br.js"></script>
<script type="text/javascript" src="/engine/calendar-setup.js"></script>
<script language="javascript" type="text/javascript">
<!--
var vCodUser = '<%= Session("cd_usuario")%>';
var vCodMenu = '<%= cd_menu%>';
var vCodSubm = '<%= cd_subm%>';
var vCodDocto = '<%= cd_docto%>';

function SalvaBanco(vGrupo, vBco) {
  var vCta;
  vCta = eval("frmParam"+vGrupo+".edtCta"+vGrupo+vBco).value;
	document.location='param.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vCdGrupo='+ vGrupo+'&vCdBco='+ vBco +'&vCta='+ vCta +'&vTpAcao=alterar'; 
}

function CriaBanco(vGrupo) {
  var vCta;
	var vBco;
  vCta = eval("frmParam"+vGrupo+".edtCta"+vGrupo).value;
  vBco = eval("frmParam"+vGrupo+".edtNewBco"+vGrupo).value;
	document.location='param.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vCdGrupo='+ vGrupo+'&vCdBco='+ vBco +'&vCta='+ vCta +'&vTpAcao=criar'; 
}

function ValidaForm(vForm, vTpAcao) {
	return true;
}
-->
</script>
<style type="text/css">
<!--
.edtDisabled {
	background-color:#DDDDDD;
	border: solid 1px #333333;
	color: #000000;
	font-size: 12px;
	height: 18px;
	padding: 2px;
	text-transform:uppercase;
	width:170px;
}
#divLiquidacao {
	position:absolute;
	width:393px;
	height:180px;
	z-index:2;
	visibility: hidden;
	overflow:auto;
	border:2px solid #666666;
}
#divJuros {
	position:absolute;
	width:200px;
	z-index:2;
	visibility: hidden;
	overflow:auto;
	border:2px solid #666666;
}
.c1 {
	border:dotted #DDDDDD;
	border-width: 0px 0px 1px 0px;
}
.c2 {
	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
}
-->
</style>
</head>
<body>
<div id="divLiquidacao"></div>
<div id="divJuros"></div>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
  <tr height="<%= Application("vl_width_header")%>" valign="top">
    <td colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr height="75">
    <td width="250" valign="top" rowspan="2"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td><div id="dv_corpo" class="divMainTop">
    <td width="100%" valign="top" bgcolor="#FCFCFC" style="border: 1px #CCCCCC solid;"><table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr height="30">
          <td colspan="8" class="titulo">..::: Parâmetros - Contrato de câmbio :::..</td>
        </tr>
        <tr height="25">
          <td colspan="11" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Cadastro dos parâmetros para integração dos contratos de câmbio</b></td>
        </tr>
        <%
vl_heigth = 22
%>
      </table></td>
  </tr>
  <tr>
    <td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
      <div id="divCorpo" class="formClass">
        <%
	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT E.CD_GRUPO FROM TPERMISSAO P (NOLOCK) "&_
				"INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENTE "&_
				"WHERE CD_USUARIO = '"&Session("cd_usuario")&"' "&_
				"GROUP BY E.CD_GRUPO "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	if objrs.RecordCount > 0 then
		vGrupos = "("
		do while not objrs.Eof 
			vGrupos = vGrupos & "'" & objrs.Fields.Item("CD_GRUPO").Value & "',"
			objrs.MoveNext
			if objrs.Eof then exit do
		loop
		vGrupos = Mid(vGrupos, 1, Len(vGrupos) - 1) & ")"
	else
		vGrupos = "(SELECT CD_GRUPO FROM TCONT_CAMB_PARAM)"
	end if

	if objrs.State = adStateOpen then objrs.Close()
	sql = "SELECT G.CD_GRUPO, G.NM_GRUPO, P.TP_DOCTO, P.CD_COMP, "&_
				"P.CD_PSTK_DEB, P.CD_PSTK_CRED, P.CD_PSTK_DEB_CUST,  "&_
				"P.CD_PSTK_CRED_CUST, P.CD_CTA_ACC, P.CD_CTA_ACC_DESP_JUR, "&_
				"P.CD_CTA_ACC_PROV_JUR, P.CD_CTA_ACE, TX_HEADER1, TX_HEADER2, TX_HEADER3 "&_
				"FROM TCONT_CAMB_PARAM P (NOLOCK) "&_
				"INNER JOIN TGRUPO G (NOLOCK) ON P.CD_GRUPO = G.CD_GRUPO "&_
				"WHERE P.CD_GRUPO IN "&vGrupos&_
				"ORDER BY G.NM_GRUPO "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
 
  cont = 1
  if objrs.RecordCount > 0 then
		do while not objrs.Eof 
			'faz tabela dos grupos
			vCdGrupo      = objrs.Fields.Item("CD_GRUPO").Value
			vNmGrupo      = objrs.Fields.Item("NM_GRUPO").Value
			vTpDocto      = objrs.Fields.Item("TP_DOCTO").Value
			vCdComp       = objrs.Fields.Item("CD_COMP").Value
			vCdDeb        = objrs.Fields.Item("CD_PSTK_DEB").Value
			vCdCred       = objrs.Fields.Item("CD_PSTK_CRED").Value
			vCdDebCust    = objrs.Fields.Item("CD_PSTK_DEB_CUST").Value
			vCdCredCust   = objrs.Fields.Item("CD_PSTK_CRED_CUST").Value
			vCdACC        = objrs.Fields.Item("CD_CTA_ACC").Value
			vCdACE        = objrs.Fields.Item("CD_CTA_ACE").Value
			vCdACCDespJur = objrs.Fields.Item("CD_CTA_ACC_DESP_JUR").Value
			vCdACCProvJur = objrs.Fields.Item("CD_CTA_ACC_PROV_JUR").Value
			vHeader1     = objrs.Fields.Item("TX_HEADER1").Value
			vHeader2     = objrs.Fields.Item("TX_HEADER2").Value
			vHeader3     = objrs.Fields.Item("TX_HEADER3").Value
%>
        <table width="750" border="0" cellspacing="0" cellpadding="2">
          <form name="frmParam<%= vCdGrupo%>" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vCdGrupo=<%= vCdGrupo %>&vTpAcao=salvar" method="post" onSubmit="return ValidaForm(this);">
          <col width="130">
          <col width="120">
          <col width="130">
          <col width="120">
          <col width="250">
          <tr class="gridtit" height="25"	>
            <td colspan="4" align="left"><nobr>&nbsp;<%= vNmGrupo %></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtTpDocto<%= vCdGrupo%>">Tipo de Documento:</label></td>
            <td class="c2" ><input name="edtTpDocto<%= vCdGrupo%>" type="text" class="editbox" id="edtTpDocto<%= vCdGrupo%>" maxlength="2" style="width: 40px;" tabindex="<%= cont %>" value="<%= vTpDocto%>"></td>
            <td class="c1"><label class="label" for="edtCdComp<%= vCdGrupo%>">C&oacute;digo da Companhia:</label></td>
            <td class="c2"><input name="edtCdComp<%= vCdGrupo%>" type="text" class="editbox" id="edtCdComp<%= vCdGrupo%>" style="width: 80px;" tabindex="<%= cont  + 1%>"  maxlength="4" value="<%= vCdComp %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtDeb<%= vCdGrupo%>">Posting Key D&eacute;bito:</label></td>
            <td class="c2"><input name="edtDeb<%= vCdGrupo%>" type="text" class="editbox" id="edtDeb<%= vCdGrupo%>" style="width: 40px;" tabindex="<%= cont + 2%>" maxlength="2"  value="<%= vCdDeb %>"></td>
            <td class="c1"><label class="label" for="edtCred<%= vCdGrupo%>">Posting Key Cr&eacute;dito:</label></td>
            <td class="c2"><nobr>
              <input name="edtCred<%= vCdGrupo%>" type="text" class="editbox" id="edtCred<%= vCdGrupo%>" style="width:40px;" tabindex="<%= cont + 3 %>" maxlength="2"  value="<%= vCdCred %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtDebCust<%= vCdGrupo%>">Posting Key D&eacute;bito Customer:</label></td>
            <td class="c2"><input name="edtDebCust<%= vCdGrupo%>" type="text" class="editbox" id="edtDebCust<%= vCdGrupo%>" style="width: 40px;" tabindex="<%= cont  + 4 %>" maxlength="2"  value="<%= vCdDebCust %>"></td>
            <td class="c1"><label class="label" for="edtCredCust<%= vCdGrupo%>">Posting Key Cr&eacute;dito Customer:</label></td>
            <td class="c2"><nobr>
              <input name="edtCredCust<%= vCdGrupo%>" type="text" class="editbox" id="edtCredCust<%= vCdGrupo%>" style="width:40px;"  tabindex="<%= cont + 5 %>" maxlength="2"value="<%= vCdCredCust %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtACC<%= vCdGrupo%>">Conta ACC:</label></td>
            <td class="c2"><input name="edtACC<%= vCdGrupo%>" type="text" class="editbox" id="edtACC<%= vCdGrupo%>" style="width: 100px;" tabindex="<%= cont + 6 %>" maxlength="10"  value="<%= vCdACC %>"></td>
            <td class="c1"><label class="label" for="edtACE<%= vCdGrupo%>">Conta ACE:</label></td>
            <td class="c2"><nobr>
              <input name="edtACE<%= vCdGrupo%>" type="text" class="editbox" id="edtACE<%= vCdGrupo%>" style="width:100px;" tabindex="<%= cont + 7 %>" maxlength="10"  value="<%= vCdACE %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtACCDespJur<%= vCdGrupo%>">Conta ACC Despesa Juros:</label></td>
            <td class="c2"><input name="edtACCDespJur<%= vCdGrupo%>" type="text" class="editbox" id="edtACCDespJur<%= vCdGrupo%>" style="width: 100px;" tabindex="<%= cont + 8 %>" maxlength="10"  value="<%= vCdACCDespJur %>"></td>
            <td class="c1"><label class="label" for="edtACCProvJur<%= vCdGrupo%>">Conta ACC Provis&atilde;o Juros:</label></td>
            <td class="c2"><nobr>
              <input name="edtACCProvJur<%= vCdGrupo%>" type="text" class="editbox" id="edtACCProvJur<%= vCdGrupo%>" style="width:100px;"  tabindex="<%= cont + 9 %>" maxlength="10"value="<%= vCdACCProvJur %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtHeader1<%= vCdGrupo%>">Doc Header Tipo 1:</label></td>
            <td class="c2"><input name="edtHeader1<%= vCdGrupo%>" type="text" class="editbox" id="edtHeader1<%= vCdGrupo%>" style="width: 150px;" tabindex="<%= cont + 10 %>" maxlength="25"  value="<%= vHeader1 %>"></td>
            <td class="c1"><label class="label" for="edtHeader2<%= vCdGrupo%>">Doc Header Tipo 2:</label></td>
            <td class="c2"><nobr>
              <input name="edtHeader2<%= vCdGrupo%>" type="text" class="editbox" id="edtHeader2<%= vCdGrupo%>" style="width:150px;"  tabindex="<%= cont + 11 %>" maxlength="25"value="<%= vHeader2 %>"></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtHeader3<%= vCdGrupo%>">Doc Header Tipo 3:</label></td>
            <td class="c2"><input name="edtHeader3<%= vCdGrupo%>" type="text" class="editbox" id="edtHeader3<%= vCdGrupo%>" style="width: 150px;" tabindex="<%= cont + 12 %>" maxlength="25"  value="<%= vHeader3 %>"></td>
            <td class="c1">&nbsp;</td>
            <td class="c2">&nbsp;</td>
          </tr>
          <tr height="<%= vl_heigth%>" class="gridtit" height="25">
          
          <td colspan="4" align="right"><input name='btnParam<%= vCdGrupo%>' type='submit' class='button' value='Salvar Parâmetros' style='width:120px;height:20px;' ></td>
          </tr>
          <%      
    		if objrsx.State = adStateOpen then objrsx.Close
    		sql = "SELECT NR_BCO, NR_CTA FROM TCONT_CAMB_PARAM_BCO (NOLOCK)"&_
    					"WHERE CD_GRUPO = '"&vCdGrupo&"'"
    		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
    		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
          <tr height="<%= vl_heigth%>">
            <td colspan="6" align="left"><b> Contas Bancárias do Grupo: <%= vNmGrupo %></b></td>
          </tr>
          <%
      cont = cont + 13
      if objrsx.RecordCount	> 0 then
				  do while not objrsx.Eof
          vNrBco = Trim(objrsx.Fields.Item("NR_BCO").Value)
					vNrCta = Trim(objrsx.Fields.Item("NR_CTA").Value)
%>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtBco<%= vCdGrupo&vNrBco%>">C&oacute;digo do Banco:</label></td>
            <td class="c2"><input name="edtBco<%= vCdGrupo&vNrBco %>" type="text" class="editbox" id="edtBco<%= vCdGrupo&vNrBco %>" style="width: 100px;" value="<%= vNrBco %>" readonly></td>
            <td class="c1"><label class="label" for="edtCta<%= vCdGrupo&vNrBco%>">N&uacute;mero da Conta:</label></td>
            <td class="c2"><nobr>
              <input name="edtCta<%= vCdGrupo&vNrBco%>" type="text" class="editbox" id="edtCta<%= vCdGrupo&vNrBco%>" style="width:100px;"  tabindex="<%= cont %>" maxlength="10" value="<%= vNrCta %>">
              <img src="/imagens/icones/16x16/btn_check.gif" width="16" height="16" border="0" alt="Salvar Alterações" style="cursor: hand;" align="absmiddle" onClick="SalvaBanco('<%= vCdGrupo%>', '<%= vNrBco%>');"> <a href="param.asp?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>&vCdGrupo=<%= vCdGrupo%>&vCdBco=<%= vNrBco%>&vTpAcao=deletar"><img src="/imagens/icones/16x16/btn_delete.gif" height="16" width="16" border="0" alt="Excluir"></a></nobr> </td>
          </tr>
          <%
			    objrsx.MoveNext
			    if objrsx.Eof then exit do
	      	loop 
					cont = cont + 1 
				end if			
%>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtNewBco<%= vCdGrupo%>">Novo Banco:</label></td>
            <td class="c2"><input name="edtNewBco<%= vCdGrupo%>" type="text" class="editbox" id="edtNewBco<%= vCdGrupo%>" style="width: 100px;" tabindex="<%= cont %>" ></td>
            <td class="c1"><label class="label" for="edtCredCust<%= vCdGrupo%>">N&uacute;mero da Conta:</label></td>
            <td class="c2"><nobr>
              <input name="edtCta<%= vCdGrupo%>" type="text" class="editbox" id="edtCta<%= vCdGrupo%>" style="width:100px;"  maxlength="10" value="" tabindex="<%= cont  + 1 %>">
              <img src="/imagens/icones/16x16/btn_check.gif" width="16" height="16" border="0" alt="Criar este banco" style="cursor: hand;" align="absmiddle" onClick="CriaBanco('<%= vCdGrupo%>')"></nobr> 
          </tr>
          </form>
          
        </table>
        <hr>
        <%
      cont = cont + 1
			objrs.MoveNext
			if objrs.Eof then exit do
		loop
	end if
		'lista faturas vinculadas aos contratos
%>
      </div>
      </div>
      <!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: --></td>
  </tr>
  <tr>
    <td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
      <!--#include virtual="/includes/lay_bottom.asp" -->
      <!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
    </td>
  </tr>
  </form>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->
