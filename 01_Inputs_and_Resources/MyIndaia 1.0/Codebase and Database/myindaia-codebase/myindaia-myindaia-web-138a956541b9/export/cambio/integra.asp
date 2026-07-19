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
nm_tela = "Exportação >> Contrato de Câmbio >> Integrações"
in_show = true

dim vTpAcao : vTpAcao =  Request.QueryString("vTpAcao")
dim vAbreArquivo
dim sql_s, sql_f, sql_w
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

function ValidaForm(vForm, vTpAcao) {
	var b = true;
	var dt1 = eval('document.frmIntegra.edtPeriodoi.value');
	var dt2 = eval('document.frmIntegra.edtPeriodof.value');
	dt1 = getValidDate(dt1);
	dt2 = getValidDate(dt2);
	if (dt1==undefined) {
		eval('document.frmIntegra.edtPeriodoi.style.background=\'red\'');
		alert('Verifique campos data: data inválida!');
		eval('document.frmIntegra.edtPeriodoi.style.background="white"');
	b=false;
	}	
	if (dt2==undefined) {
		eval('document.frmIntegra.edtPeriodof.style.background=\'red\'');
		alert('Verifique campos data: data inválida!');
		eval('document.frmIntegra.edtPeriodof.style.background="white"');
		b=false;
	} 
	if (b && dt2<dt1) {
		alert('Verifique campos data: data final < data inicial!');
		eval('document.frmIntegra.edtPeriodof.select()');
		b=false;
	}
	return b
}
-->
</script>
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
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
          <td colspan="8" class="titulo">..::: Integração de Contratos de câmbio :::..</td>
        </tr>
        <tr height="25">
          <td colspan="11" style="border-top: 1px solid #CCCCCC; font-size:12px;">&nbsp;<b>Escolha o tipo de Integração e o Período...</b></td>
        </tr>
        <%
vl_heigth = 22
%>
      </table></td>
  </tr>
  <tr>
    <td><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
      <div id="divCorpo" class="formClass">
        <table width="500" border="0" cellspacing="0" cellpadding="2">
          <form name="frmIntegra" action="?cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>&cd_docto=<%= cd_docto%>" method="post" onSubmit="return ValidaForm(this);">
          <col width="130">
          <col width="400">
          <col width="220">
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="cmbTpInst">Tipo de Integração:</label></td>
            <td class="c2" ><select name="cmbTpInst" id="tipo" class="select" style="width:250px;" tabIndex="1">
                <option value="1"selected="selected">Fechamento Câmbio Banco ACC DC </option>
                <option value="2">Vinculação Contrato ACC x ACE</option>
                <option value="3">Provisão de Juros</option>
                <option value="4">Pagamento CLiente ACE</option>
                <option value="5">Câmbio Pronto</option>
              </select></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1"><label class="label" for="edtPeriodoIni">Per&iacute;odo:</label></td>
            <td class="c2"><nobr>
            	<input name="edtPeriodoi" type="text" class="editbox" id="edtPeriodoi" style="width: 80px;" tabindex="6" onKeyPress="return(MascaraData(this,'/',event));">
              <img id="btnPeriodoi" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle">
              <input name="edtPeriodof" type="text" class="editbox" id="edtPeriodof" style="width: 80px;" tabindex="6" onKeyPress="return(MascaraData(this,'/',event));">
              <img id="btnPeriodof" height=16 width=16 border=0 src="/imagens/icones/16x16/calenda.gif" align="absmiddle">
              </nobr></td>
          </tr>
          <tr height="<%= vl_heigth%>">
            <td class="c1">&nbsp;</td>
            <td class="c2" align="right"><nobr>
              <input name='btnInteg' type='submit' class='button' value='Gerar Integração' style='width:120px;height:20px;' >
              <input name="cancel" type="button" class="button" value=" <%= tx_lang_A00018(cd_lang)%> " onClick="javascript:document.location='/default.asp';">
              <nobr></td>
          </tr>
          </form>
        </table>
        <hr>
        <%
if objrsx.State = adStateOpen then objrsx.Close()
sql_s = "SELECT U.NM_USUARIO, CONVERT(VARCHAR, L.DT_INI, 103) AS DT_INI, CONVERT(VARCHAR, L.DT_FIM, 103) AS DT_FIM, "&_
				"  CONVERT(VARCHAR, L.DT_GERACAO, 103) AS DT_GERACAO, "&_
				"  CASE L.TP_INTEGRACAO "&_
				"    WHEN '1' THEN 'Fechamento de Câmbio ACC' "&_
				"    WHEN '2' THEN 'Vinculação Contrato ACC x ACE' "&_
				"    WHEN '3' THEN 'Provisão de Juros' "&_
				"    WHEN '4' THEN 'Pagamento Cliente ACE' "&_
				"    WHEN '5' THEN 'Câmbio Pronto' "&_
				"  END AS NM_TIPO "
sql_f = "FROM TCONT_CAMB_LOG L (NOLOCK) "&_
				"  INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = L.CD_USUARIO) "
				'"  INNER JOIN TEMPRESA_NAC E (NOLOCK) ON (E.CD_GRUPO = L.CD_GRUPO) "
sql_w = " WHERE DT_GERACAO >= GETDATE() - 10 "

if InStr("040;055;060", Session("cd_cargo")) > 0 then		
	sql_f = sql_f &" INNER JOIN TPERMISSAO P (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMPRESA AND P.CD_USUARIO = '"& Session("cd_usuario") &"') "				
end if

sql = sql_s & sql_f & sql_w&" ORDER BY L.TP_INTEGRACAO "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Response.Redirect("../../IMPORT/teste.asp?var1="&sql&"")
if objrsx.RecordCount > 0 then
%>
        <table width="600" border="0" cellspacing="1" cellpadding="0">
          <col width="130">
          <col width="70">
          <col width="70">
          <col width="130">
          <col width="100">
          <tr height="<%= vl_heigth%>">
            <td colspan="5"><span><b>&nbsp;Integrações feitas nos últimos 10 dias</b></span></td>
          </tr>
          <tr class="gridtit" height="<%= vl_heigth%>">
            <td align="left">&nbsp;Tipo</td>
            <td align="left">&nbsp;Data Inicial</td>
            <td align="left">&nbsp;Data Final</td>
            <td align="left">&nbsp;Usu&aacute;rio Gerador</td>
            <td align="left">&nbsp;Data Gera&ccedil;&atilde;o</td>
          </tr>
          <%
	do while not objrsx.Eof 
		if bgcolor = "#FEFEFE" then bgcolor = "#EDEDED" else bgcolor = "#FEFEFE"
%>
          <tr height="<%= vl_heigth%>" bgcolor="<%= bgcolor%>">
            <td align="left"><nobr>&nbsp;<%= objrsx.Fields.Item("NM_TIPO").Value %></nobr></td>
            <td align="left"><nobr>&nbsp;<%= objrsx.Fields.Item("DT_INI").Value %></nobr></td>
            <td align="left"><nobr>&nbsp;<%= objrsx.Fields.Item("DT_FIM").Value %></nobr></td>
            <td align="left"><nobr>&nbsp;<%= objrsx.Fields.Item("NM_USUARIO").Value %></nobr></td>
            <td align="left"><nobr>&nbsp;<%= objrsx.Fields.Item("DT_GERACAO").Value %></nobr></td>
          </tr>
          <%
		objrsx.MoveNext
		if objrsx.Eof then exit do
	loop
%>
        </table>
        <%
end if

if (Request.Form <> "") then
%>
<script language="javascript">
  window.focus();
  window.open('integra_busca.asp?cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&cd_docto=<%=cd_docto%>&dtIni=<%= Request.Form("edtPeriodoi") %>&dtFim=<%= Request.Form("edtPeriodof") %>&tipo=<%= Request.Form("cmbTpInst") %>','download','top=100,left=20,width=250,height=250,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');
</script>
        <%  
end if
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
</table>
<script language="javascript">
<!--
Calendar.setup({inputField:"edtPeriodoi",button:"btnPeriodoi"});
Calendar.setup({inputField:"edtPeriodof",button:"btnPeriodof"});
-->
</script>
<!--#include virtual="/includes/inc_ends.asp" -->