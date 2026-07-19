<%
vTxExcel = "<html xmlns:o=""urn:schemas-microsoft-com:office:office"""&_
	"xmlns:x=""urn:schemas-microsoft-com:office:excel"""&_
	"xmlns=""http://www.w3.org/TR/REC-html40"">"&_
	"<head>"&_
	"<meta http-equiv=Content-Type content=""text/html; charset=windows-1252"">"&_
	"<meta name=ProgId content=Excel.Sheet>"&_
	"<title>"& nm_menu &" - "& nm_subm &"</title>"&_
	"<!--[if !mso]>"&_
	"<style>"&_
	"x\:* {behavior:url(#default#VML);}"&_
	"</style>"&_
	"<![endif]-->"&_
	"<style>"&_
	"<!--"&_
	"body {"&_
	"	font-family: Verdana, Arial, Helvetica, sans-serif;"&_
	"	color: #000000;"&_
	"	background-color: #FFFFFF;"&_
	"	margin: 0px;"&_
	"	padding: 0px;"&_
	"}"&_
	"table {"&_
	"	mso-displayed-decimal-separator:""\,"";"&_
	"	mso-displayed-thousand-separator:""\."";"&_
	"}"&_
	"tr {"&_
	"}"&_
	"td {"&_
	"	font-size: 10px;"&_			
	"}"&_
	"br {"&_
	"	mso-data-placement:same-cell;"&_
	"}"&_
	".basico	{"&_
	"	vertical-align:middle;"&_
	"	white-space:nowrap;"&_
	"	mso-generic-font-family:auto;"&_
	"	mso-font-charset:0;"&_
	"	mso-number-format:General;"&_
	"	mso-background-source:auto;"&_
	"	mso-pattern:auto;"&_
	"}"&_
	".titulo {"&_
	"	mso-style-parent:basico;"&_
	"	vertical-align:top;"&_
	"	font-size: 13px;"&_
	"	font-weight: bold;"&_
	"}"&_
    ".center {"&_
	"	text-align:center;"&_
	"}"&_
	".gridtop {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-style: italic;"&_
	"	font-weight: bold;"&_
	"	font-size: 13px;"&_
	"	background: #374bae;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".gridtit {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	background: #374bae;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".gridtit3 {"&_
	"	mso-style-parent:basico;"&_
	"	color: #000000;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	background: #E7E101;"&_
	"	vertical-align: middle;"&_
	"}"&_
    ".gridtit3_1 {"&_
	"	mso-style-parent:basico;"&_
	"	color: #000000;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	background: #02cc32;"&_
	"	vertical-align: middle;"&_
	"}"&_
    ".gridtit4 {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	background: #FF0000;"&_
	"	vertical-align: middle;"&_
	"}"&_
	".graytit {"&_
	"	mso-style-parent:basico;"&_
	"	color: #000000;"&_
	"	background: #CCCCCC;"&_
	"	font-weight: bold;"&_
	"	text-align: center;"&_
	"	vertical-align: middle;"&_	
	"}"&_
	".gridsub {"&_
	"	mso-style-parent:basico;"&_
	"	color: #FFFFFF;"&_
	"	background: #374bae;"&_
	"}"&_
	".tb1 {"&_
	"	mso-style-parent:basico;"&_
	"  border-style: solid;"&_
	"  border-width: 0px 0px 1px 0px;"&_
	"  border-color: #000000;"&_
	"}"&_
	".tb2 {"&_
	"	mso-style-parent:basico;"&_
	"  border-style: dotted;"&_
	"  border-width: 0px 0px 1px 0px;"&_
	"  border-color: #333333;"&_
	"  padding: 2px;"&_
	"}"&_
	".data {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""Short Date"";"&_
	"}"&_
	".time {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""Short Time"";"&_
	"}"&_
	".inteiro {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0"";"&_
	"}"&_
	".decimal {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.0"";"&_
	"}"&_
	".decimal2 {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"}"&_
	".decimal4 {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\#\,\#\#0\.0000"";"&_
	"}"&_
	".moeda {"&_
	"	mso-style-parent:basico;"&_
	"	mso-number-format:""\0022R$ \0022\#\,\#\#0\.00_\)\;\[Red\]\\\(\0022R$ \0022\#\,\#\#0\.00\\\)"";"&_
	"}"&_
	".texto {"&_
	"	mso-style-parent:basico;"&_
	"	text-align:left;"&_
	"	vertical-align:top;"&_
	"	mso-ignore:padding;"&_
	"}"&_
	".total {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-weight: bold;"&_
	"	font-style: italic;"&_
	"	background: #FFCC99;"&_
	"}"&_
	".subtotal {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-weight: bold;"&_
	"	background: #FFCC99;"&_
	"}"&_
	".subproc {"&_
	"	mso-number-format:""\#\,\#\#0\.00"";"&_
	"	font-size: 11px;"&_
	"	font-style: italic;"&_
	"}"&_
	"-->"&_
	"</style></head><body>"&_
	"<table x:str border=1 cellpadding=0 cellspacing=0 bordercolor='#FFFFFF' style='padding: 0px 1px 0px 1px;' x:publishsource='Excel'>"
	'cabeçalho da planilha e logo da indaiá
	Select Case cd_menu&cd_subm
		Case "0103","0203"
			vTxExcel = vTxExcel&"  <tr height='20'>"&_
				"    <td width='150' valign='top'><img src='http://www.myindaiaweb.com.br/imagens/logo2012.jpg' width='250' height='85'></td>"&_
				"    <td width='150'>&nbsp;</td>"&_
				"    <td class='titulo' style='white-space:nowrap;'>"& nm_view &"</td>"&_
				"  </tr>"
		Case Else
			vTxExcel = vTxExcel&"  <tr height='40'>"&_
				"    <td width='150' valign='top'><img src='http://www.myindaiaweb.com.br/imagens/logo2012.jpg' width='250' height='85'></td>"&_
				"    <td width='150'>&nbsp;</td>"&_
				"	 <td class='titulo' style='white-space:nowrap;'>"& nm_tela &"</td>"&_
				"  </tr>"
	End Select
	'exibe cliente
	vTxExcel = vTxExcel&"  <tr height='16'>"&_
		"	   <td>&nbsp;</td>"&_
		"	   <td>&nbsp;</td>"&_
		"      <td style='white-space:nowrap;'>"& tx_lang_A00006(cd_lang) &": <b>"
		
	If Request.QueryString("cd_grupo") = "X" or Not fnc_TestaVar(Request.QueryString("cd_grupo")) Then
		If Request.QueryString("cd_cliente") = "X" or Not fnc_TestaVar(Request.QueryString("cd_cliente")) Then
			If Not Session("cargo_interno") = "1" and Session("cd_cargo") <> "088" Then
			sql = "SELECT TOP 1 GC.NM_GRUPO "&_
						"FROM TPERMISSAO_GRUPO PC (NOLOCK), TGRUPO GC (NOLOCK) "&_
						"WHERE PC.CD_USUARIO = '"& Session("cd_usuario") &"' "&_
						"  AND PC.CD_GRUPO   = GC.CD_GRUPO "&_
						"GROUP BY GC.NM_GRUPO "&_
						"ORDER BY COUNT(*) DESC"
				objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				vTxExcel = vTxExcel&objrsx.Fields.Item("NM_GRUPO").Value
				objrsx.Close()
			Else
				vTxExcel = vTxExcel&tx_lang_A00022(cd_lang)
			End If
		Else
			vTxExcel = vTxExcel&fnc_ConsultaLookup("TEMPRESA_NAC","CD_EMPRESA",Request.QueryString("cd_cliente"),"NM_EMPRESA")
		End If
	Else
		vTxExcel = vTxExcel&fnc_ConsultaLookup("TGRUPO","CD_GRUPO",Request.QueryString("cd_grupo"),"NM_GRUPO")
	End If
	vTxExcel = vTxExcel&"    </b></td></tr>"
	
	'exibe unidade
	vTxExcel = vTxExcel&"  <tr height='16'>"&_
		"	   <td>&nbsp;</td>"&_
		"	   <td>&nbsp;</td>"&_
		"      <td style='white-space:nowrap;'>"& tx_lang_A00007(cd_lang) &": <b>"
	
	If Request.QueryString("cd_unid_neg") = "X" or Not fnc_TestaVar(Request.QueryString("cd_unid_neg")) Then
		vTxExcel = vTxExcel&tx_lang_A00090(cd_lang)
	Else
		vTxExcel = vTxExcel&fnc_ConsultaLookup("TUNID_NEG","CD_UNID_NEG",Request.QueryString("cd_unid_neg"),"NM_UNID_NEG")
	End If
	vTxExcel = vTxExcel&"    </b></td></tr>"
	
	'exibe produto
	vTxExcel = vTxExcel&"  <tr height='16'>"&_
		"	   <td>&nbsp;</td>"&_
		"	   <td>&nbsp;</td>"&_
		"      <td style='white-space:nowrap;'>"& tx_lang_A00008(cd_lang) &": <b>"
	
	If Request.QueryString("cd_produto") = "X" or Not fnc_TestaVar(Request.QueryString("cd_produto")) Then
		Select Case cd_menu
			Case "01" vTxExcel = vTxExcel&tx_lang_A00010(cd_lang)
			Case "02" vTxExcel = vTxExcel&tx_lang_A00011(cd_lang)
			Case Else vTxExcel = vTxExcel&tx_lang_A00022(cd_lang)
		End Select
	Else
		vTxExcel = vTxExcel&fnc_ConsultaLookup("TPRODUTO","CD_PRODUTO",Request.QueryString("cd_produto"),"NM_PRODUTO")
	End If
	vTxExcel = vTxExcel&"    </b></td></tr>"
	
	'informações de emissão de relatório
	vTxExcel = vTxExcel&"  <tr height='16'>"&_
		"	   <td>&nbsp;</td>"&_
		"	   <td>&nbsp;</td>"&_
		"      <td style='white-space:nowrap;'>"& Cstr(Date()) &" - "& FormatDateTime(Time(), vbShortTime) &" "& tx_lang_A00014(cd_lang) &" "& Session("nm_usuario") &"</td>"&_
		"  </tr>"
	objtxt.WriteLine(vTxExcel)
%>