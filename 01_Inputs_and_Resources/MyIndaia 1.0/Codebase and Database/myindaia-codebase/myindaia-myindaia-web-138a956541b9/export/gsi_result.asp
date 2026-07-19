<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação
'Arquivo de Script e HTML: Resultado do Relatório de Borderô
'
'Autor: Alexandre Gonçalves Neto
'Criado: 20/01/2006
'
'Manutenção:
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim sql_s		'monta o select da query com os campos a serem exibidos
Dim sql_f		'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w		'monta o where da query
Dim sql_o		'monta a ordenação da query
Dim pagina 		'pagina inicial da ordenação
Dim sem_saldo, cd_quebra_gsi_aux, cd_quebra_gsi_aux2, cd_quebra_gsi_aux3

in_comodo = "1"
sem_saldo = 1
in_show  = False
cd_tela  = "EXP019"
nm_tela  = "Exportação >> GSI >> Resultado da Busca "
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_view  = Request.QueryString("cd_view")
nr_ident = Request.QueryString("nr_ident")
tx_erro  = Request.QueryString("tx_erro")
pagina   = CInt(Request("p"))
Session("sql_pagina") = Session("sql_pagina") &"FILTROS: "& Request.QueryString &"<br><br>"
'verifica se a pagina é zero, se for seta para 1
If pagina = 0 Then pagina = 1

nr_reg_pagina  = 30
objrs.PageSize = nr_reg_pagina

in_view_campo = 1
%>
<!--#include virtual="/includes/inc_views.asp"-->

<%
Session("sql_exp_gsi") = Null
If Not fnc_TestaVar(Session("sql_exp_gsi")) Then
  'campos que irão ser selecionados na exibição e montagem do relatório
  sql_s = "SELECT DISTINCT "&_
          "  R.CD_PAIS, R.CD_FAMILIA_PROD, R.CD_EXPORTADOR, R.NR_SEQUENCIAL, R.CD_IMPORTADOR, "&_
					"  F.NM_FAMILIA_PROD, F.CD_UNID_NEG, F.CD_PRODUTO, "&_
		  		"  ( SELECT DESCRICAO FROM TPAIS ( NOLOCK ) WHERE CODIGO = R.CD_PAIS ) AS NM_PAIS, "&_
				"  ( SELECT NM_EMPRESA FROM TEMPRESA_EST ( NOLOCK ) WHERE CD_EMPRESA = R.CD_IMPORTADOR ) AS NM_IMPORTADOR, "&_
		  		"  ( SELECT NM_EMPRESA FROM TEMPRESA_NAC ( NOLOCK ) WHERE CD_EMPRESA = R.CD_EXPORTADOR ) AS NM_EXPORTADOR "
  
  'tabelas do relatório
  sql_f = "FROM TREL_EXP_GSI R ( NOLOCK ), TFAMILIA_PROD F ( NOLOCK ) "
  
  'requisitos do relatório
  sql_w = "WHERE R.CD_FAMILIA_PROD = F.CD_FAMILIA_PROD "&_
					"  AND R.CD_USUARIO = "& fnc_QuotedSQL(Session("cd_usuario")) &_
	      	"  AND R.NR_IDENT   = "& nr_ident &" "
  
  'ordenação dos registros  
  If tp_relat = 0 Then
  	sql_o = "ORDER BY NM_PAIS ASC, NM_FAMILIA_PROD ASC"
	cd_quebra_gsi_aux3 = "Mercadoria"
  Else
  	sql_o = "ORDER BY NM_FAMILIA_PROD ASC, NM_PAIS ASC"
	cd_quebra_gsi_aux3 = "País"
  End If 

  'finaliza a construção do select do relatório e salva na Session
  sql = sql_s & sql_f & sql_w & sql_o
  Session("sql_exp_gsi") = sql
Else
  sql = Session("sql_exp_gsi")
End If

Session("sql_pagina") = Session("sql_pagina") & Session("sql_exp_gsi") &"<br><br>"
With objcmd
  .CommandTimeOut = 9999
  .CommandText    = sql
  .CommandType    = adCmdText
End With
objrs.Open objcmd, , adOpenStatic, adLockReadOnly


objrs.AbsolutePage = CInt(pagina)

col = objrsv.RecordCount + 1 'soma um por causa da coluna da situação/status do borderô
url = "?nr_ident="& nr_ident &_
	  	"&cd_menu="& cd_menu &_
	  	"&cd_subm="& cd_subm &_
	  	"&cd_view="& cd_view
'adiciona a url os campos pesquisados
For Each tx_filtro In Request.QueryString("filtro")
  If tx_filtro = "dt_evento" Then
    url = url &"&filtro="& tx_filtro &"&"& tx_filtro &"i="& Request.QueryString(tx_filtro&"i") &"&"& tx_filtro &"f="& Request.QueryString(tx_filtro&"f")
  Else
    url = url &"&filtro="& tx_filtro &"&"& tx_filtro &"="& Request.QueryString(tx_filtro)
  End If
Next

tx_path_file  = "/export/gsi_print"
tx_path_excel = "/excel/exp_gsi"

'retorna para o primeiro registro do resultado
If objrs.Eof  Then objrs.MoveFirst
'retorna para o primeiro registro da personalização
'If objrsv.Eof Then objrsv.MoveFirst
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.gridfuptit {
  mso-style-parent: gridfuptit; 
  text-align: left;
}
</style>
<script language="javascript" type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	var target = "gsi_result.asp<%= url%>&p="+selObj.options[selObj.selectedIndex].value;
	eval(targ+".location='"+target+"'");
	if (restore) selObj.selectedIndex = 0;
}
//-->
</script>
</head>
<body>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" background="<%= fcn_TrocaFundo()%>" class="table">
  <tr valign="top">
    <td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
      <!--#include virtual="/includes/lay_header.asp" -->
      <!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
    </td>
  </tr>
  <tr>
    <td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
    </td>
    <td width="100%" height="44" valign="top"><!--#include virtual="/includes/inc_cabec_result.asp"--></td>
  </tr>
  <tr>
    <td valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
      <div id="dv_corpo" class="divMainMid" style="scrollbar-face-color: <%=rolagem_menu1%>;scrollbar-track-color: <%=rolagem_menu2%>;scrollbar-arrow-color: <%=rolagem_menu3%>;scrollbar-shadow-color: <%=rolagem_menu4%>;scrollbar-3dlight-color: <%=rolagem_menu5%>;scrollbar-highlight-color: <%=rolagem_menu6%>;scrollbar-darkshadow-color: <%=rolagem_menu7%>;">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 0px 1px 0px 1px;">
          <%
cd_campo_quebra = ""
nrec = 0
'Exibe os resultados do relatório e aplica a personalização
Do While nrec < objrs.PageSize and Not objrs.Eof

  If tp_relat = 0 Then
	cd_quebra_gsi_aux = objrs.Fields.Item("NM_PAIS").Value 
	if InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLÉ - ") or InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLE - ") Then 
		cd_quebra_gsi_aux2 = Right(objrs.Fields.Item("NM_FAMILIA_PROD").Value, Len(objrs.Fields.Item("NM_FAMILIA_PROD").Value)-Len("NESTLE - ")) 
	Else
		cd_quebra_gsi_aux2 = objrs.Fields.Item("NM_FAMILIA_PROD").Value
	End If
  Else
  	if InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLÉ - ") or InStr(objrs.Fields.Item("NM_FAMILIA_PROD").Value,"NESTLE - ") Then 
	cd_quebra_gsi_aux = Right(objrs.Fields.Item("NM_FAMILIA_PROD").Value, Len(objrs.Fields.Item("NM_FAMILIA_PROD").Value)-Len("NESTLE - ")) 
	Else
	cd_quebra_gsi_aux = objrs.Fields.Item("NM_FAMILIA_PROD").Value
	End If
	cd_quebra_gsi_aux2 = objrs.Fields.Item("NM_PAIS").Value
  End If 
	
  'alterna a cor das linhas
  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
  'quando mudar o país, exibe cabeçalho
  If cd_campo_quebra <> cd_quebra_gsi_aux Then
	
	If fnc_TestaVar(cd_campo_quebra) Then
%>
					<tr>
						<td colspan="2" height="3"></td>
					</tr>
					<%
End If
%>
          <tr height="20">
            <td colspan="3" class="gridtop" style="background-color:<%=quebra_result%>;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cd_quebra_gsi_aux%></td>
          </tr>
          <tr height="16">
            <td width="40%" class="gridtit" align="left" style="background-color:<%=cabec_result%>;">&nbsp;Cliente</td>
            <td width="40%" class="gridtit" align="left" style="background-color:<%=cabec_result%>;">&nbsp;Importador</td>
            <td width="60%" class="gridtit" align="left" style="background-color:<%=cabec_result%>;">&nbsp;<%= cd_quebra_gsi_aux3%></td>
          </tr>
          <%
  End If
  cd_campo_quebra = cd_quebra_gsi_aux
	
	w = Trim( objrs.Fields.Item("CD_FAMILIA_PROD").Value )
	x = Trim( objrs.Fields.Item("CD_PAIS").Value )
	y = Trim( objrs.Fields.Item("CD_UNID_NEG").Value )
	z = Trim( objrs.Fields.Item("CD_PRODUTO").Value )
	z2 = Trim( objrs.Fields.Item("NR_SEQUENCIAL").Value )
	z3 = Trim( objrs.Fields.Item("CD_IMPORTADOR").Value )
%>
          <tr bgcolor="<%= bgcolor%>">
            <td><%= objrs.Fields.Item("NM_EXPORTADOR").Value%></td>
            <td><%= objrs.Fields.Item("NM_IMPORTADOR").Value%></td>
            <td><a href="#" onClick="window.open('/popup/detalhe_gsi.asp?cd_familia_prod=<%= w%>&cd_pais_destino=<%= x%>&cd_unid_neg=<%= y%>&cd_produto=<%= z%>&nr_sequencial=<%= z2%>&cd_importador=<%= z3%>','detalhe_gsi','top=100,left=20,width=600,height=500,resizable=yes');"><%= cd_quebra_gsi_aux2%></a></td>
          </tr>
          <%
  nrec = nrec + 1
  objrs.MoveNext
  If objrs.Eof Then Exit Do
Loop
%>
          <tr class="gridtit" style="background-color:<%=cabec_result%>;">
            <td height="15" colspan="3" align="left"><nobr>Foram encontrados <%= objrs.RecordCount%> registros.</nobr></td>
          </tr>
          <%
objrsv.Close
objrs.Close
%>
        </table>
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
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
