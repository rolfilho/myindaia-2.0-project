<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Controle de Contratos de Câmbio Exportação
'Arquivo de Script e HTML: Liquidação de faturas
'
'Autor Alexandre Neto
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
dim vTpValida : vTpValida = Request.QueryString("vTpValida")
Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

select case vTpValida 
	case "0" 'validação de numero de contrato
		dim vNrContrato : vNrContrato = Request.QueryString("vNrContrato")
		dim vNrBanco : vNrBanco = Request.QueryString("vNrBanco")
		'busca na base o mesmo numero de contrato para o banco
		sql = "SELECT COUNT(*) FROM TCONT_CAMB (TABLOCK HOLDLOCK) "&_
					"WHERE NR_CONT_CAMB = '"&vNrContrato&"' AND NR_BANCO = '"&vNrBanco&"'"
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		if objrs.Fields.Item(0).Value > 0 then
			Response.Write("<b style='color:#FF0000;'>N&ordm;. de contrato j&aacute; existe para esse banco.</b>"&_
				"<input type='hidden' name='vNrContrato' value='"&vNrContrato&"'>"&_
				"<input type='hidden' name='vNrBanco' value='"&vNrBanco&"'>")
		else
			Response.Write("<input type='hidden' name='vNrContrato' value=''><input type='hidden' name='vNrBanco' value=''>")
		end if
end select

vInDebug = false
%>
<!--#include virtual="/includes/inc_ends.asp" -->