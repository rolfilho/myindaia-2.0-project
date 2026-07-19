<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>


<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Sistema de busca - Importação
'Arquivo de Script e HTML: Resultado da Busca
'Autor Flávio Henrique
'Criado: 05/06/2008
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%'


Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 999

Session("sql_pagina") = Session("sql_pagina") &"<br>FILTROS: "& Request.QueryString &"<br>"

Dim objfso      'objeto para o sistema de arquivos
Dim sql_s       'monta o select da query com os campos a serem exibidos
Dim sql_f       'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w       'monta o where da query
Dim sql_a
Dim cd_unid_neg 'código da unidade de negociação 
Dim cd_produto  'código do produto
Dim cd_cliente  'código do cliente
Dim str_refs()  'armazena os valores das referencias
Dim str_merc    'mercadorias do processo
Dim str_li      'exibe imformações da li
Dim str_obs     'observação do followup
Dim ap_filtro   'nome do filtro selecionado para a consulta
Dim ap_filtros  'nome dos filtros utilizados
Dim tp_relat_rel'tipo do relatorio
Dim nr_di       'numero do registro da DI no SISCOMEX
Dim in_custo,NR_ITEM_PO, CheckReferencia,contador,NR_ITEM,CD_REFERENCIA

in_show = False
cd_tela = "DET003"
'cd_menu = CStr(Request.QueryString("cd_menu"))
'cd_subm = CStr(Request.QueryString("cd_subm"))
cd_view = CStr(Request.QueryString("cd_view"))

'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))
nr_referencia = CStr(Request.QueryString("cd_referencia"))
'nr_item_clnte = CStr(Request.QueryString("nr_item_clnte"))
nr_item_clnte = CStr(Request.QueryString("NR_ITEM_PO"))
tp_relat_rel  = Request.QueryString("tp_relat")
produto = Request.QueryString("produto")
If Not fnc_TestaVar(cd_menu) Then cd_menu = "03"
If produto = "01" then
If Not fnc_TestaVar(cd_subm) Then cd_subm = "01"
Else
If Not fnc_TestaVar(cd_subm) Then cd_subm = "02"
End If

in_custo = False
'seleciona os dados da view
in_view_campo = 1
%>
<!--#include virtual="/includes/inc_view.asp"-->
<!--#include virtual="/includes/inc_nm_tela.asp"-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->

<style type="text/css">
<!--
.style2 {font-size: x-small}
.style3 {font-size: 10px color: #000000}
.style4 {color: #FFFFFF}
.style5 {color: #FFFFFF; font-weight: bold; }

<!--
#apDiv1 {
	left: -320;
}
.style6 {color: #000066}
-->
</style>
</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/seta.jpg';">
<script language="javascript" src="/includes/script.js"></script>

<td height="<%=Application("vl_width_header")%>" colspan="2">

<!--#include virtual="/includes/lay_header.asp" -->
<td width="10" rowspan="2" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
      <!--#include virtual="/includes/lay_menu.asp" -->
<style type="text/css">
<!--
#apDiv1 {
	left: -320;
}

#apDiv3 {
	left: -320;}

#apDiv4 {
	left: -320;}
-->
</style>
      <!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
</td><br>
<div id="dv_corpo" class="divMainMidBusca">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#58849F" style="padding: 0px 1px 0px 1px;">
  <tr>
    <td colspan="7" valign="top"  width="100%" bgcolor="#FFFFFF"><div align="center" W>
      <h3>..::: Resultados da Busca :::..</h3>
    </div></td>
  </tr>
  <tr>
    <td colspan="7" valign="top" bgcolor="#FFFFFF" width="100%" ><div align="center">Encontramos o pedido solicitado nos processos abaixo.<br>
    Clique no Nr. do processo para ver os detalhes.</div></td>
    </tr>
  <tr>
    <td width="97" bgcolor="#336699"><div align="center" class="style4"><strong>Processo</strong></div></td>
    <%if produto = "01" then%> 
    <td width="110" bgcolor="#336699"><div align="center" class="style5">Pedidos/Itens</div></td>
    <td width="216" bgcolor="#336699"><div align="center" class="style5">Importador</div></td>
	<%else%>
    <td width="110" bgcolor="#336699"><div align="center" class="style5">Pedidos</div></td>
    <td width="216" bgcolor="#336699"><div align="center" class="style5">Exportador</div></td>
	<%end if%>     
    <td width="109" bgcolor="#336699"><div align="center" class="style5">Nome Reduzido</div></td>
    <td width="128" bgcolor="#336699"><div align="center" class="style5">CNPJ</div></td>
    <td width="258" bgcolor="#336699"><div align="center" class="style5">Mercadoria</div></td>
    <%if produto = "01" then%> 
    <td width="97" bgcolor="#336699"><div align="center" class="style5">Chegada</div></td>
    <%else%>
   <td width="97" bgcolor="#336699"><div align="center" class="style5">Abertura do Registro</div></td> 
    <%end if%>
  </tr></table>
<%nrec = 0
' Encontrar os processos que contêm o número de pedido solicitado
If objrsx.State = adStateOpen Then objrsx.Close 
	If produto = "01" Then
		sql = "	SELECT DISTINCT ISNULL(EP.NR_PROCESSO_DES, EP.NR_PROCESSO_ADM) AS NR_PROCESSO "&_
			"FROM TESTAGIO_PROCESSO EP (NOLOCK), TPROCESSO PR (NOLOCK) "&_
			"WHERE EP.NR_REFERENCIA = '"& request("CD_REFERENCIA") &"' "&_
			"AND ( ( EP.NR_ITEM_CLIENTE = '"& request("NR_ITEM_PO") &"' ) OR ( '"& request("NR_ITEM_PO") &"' = '0000' ) ) "&_
			" AND PR.NR_PROCESSO = EP.NR_PROCESSO_DES "
			
		If session("GrupoUsuario2")<>"0" then
	  		sql =	sql & " AND PR.CD_GRUPO IN (SELECT DISTINCT E.CD_GRUPO "&_
                " FROM TPERMISSAO P "&_
                " INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End if 
	Else
		sql = "SELECT PR.NR_PROCESSO AS NR_PROCESSO"&_
		" FROM TPROCESSO PR"&_
		" INNER JOIN TREF_CLIENTE RC ON RC.NR_PROCESSO = PR.NR_PROCESSO"&_
		" WHERE RC.CD_REFERENCIA ='"& request("CD_REFERENCIA") &"' "
		If session("GrupoUsuario2")<>"0" then
	  		sql =	sql & " AND PR.CD_GRUPO IN (SELECT DISTINCT E.CD_GRUPO "&_
                " FROM TPERMISSAO P "&_
                " INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End if
		
	End If
	'If session("GrupoUsuario")<>0 then
	'	sql_a =	"AND PR.CD_GRUPO = '"&session("GrupoUsuario")&"'"
	'End if
	sql=sql & sql_a	
	'Response.write sql
	'Response.end
	'response.Write(session("GrupoUsuario"))
	'Response.Redirect("../import/teste.asp?var1="&sql&"")
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	if objrsx.eof then
		Response.Redirect("../default.asp?Msg=Pedido não encontrado!&cd_menu=01" &_
				"&cd_subm="& cd_subm &_
				"&cd_view="& cd_view )
	end if

If objrsx.RecordCount > 0 Then
Do While nrec < objrs.PageSize and Not objrsx.Eof
	If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	str=""
	NR_PROCESSO=objrsx("NR_PROCESSO")
	
	If objrs.State = adStateOpen Then objrs.Close 
	   If produto = "01" Then
		   sql = "SELECT CD_REFERENCIA, NR_ITEM_PO FROM TREF_CLIENTE "&_
				 "WHERE NR_PROCESSO = '"& NR_PROCESSO &"'  AND TP_REFERENCIA = '01' ORDER BY CD_REFERENCIA DESC"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Do While not objrs.eof 
				'Acumula os ítens deste processo
				NR_ITEM=objrs.Fields.Item("NR_ITEM_PO").Value
				CD_REFERENCIA=ltrim(rtrim(objrs("CD_REFERENCIA")))
				'NR_ITEM = "&nbsp;"& NR_ITEM & Trim(Replace(objrs.Fields.Item("NR_ITEM_PO").Value, """", "'"))
				str = ltrim(rtrim(objrs("CD_REFERENCIA")))&"/"&objrs.Fields.Item("NR_ITEM_PO").Value&"<br>"&str			
				objrs.MoveNext
				If objrs.eof then Exit Do  
			Loop
		Else
			sql = "SELECT CD_REFERENCIA FROM TREF_CLIENTE "&_
			   	  "WHERE NR_PROCESSO = '"& NR_PROCESSO &"' AND TP_REFERENCIA = '" & Rtrim(Session("TipoPedido")) & "' ORDER BY CD_REFERENCIA DESC"

				  
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Do While not objrs.eof 
				'Acumula os ítens deste processo
				CD_REFERENCIA=ltrim(rtrim(objrs("CD_REFERENCIA")))
				'NR_ITEM = "&nbsp;"& NR_ITEM & Trim(Replace(objrs.Fields.Item("NR_ITEM_PO").Value, """", "'"))
				str = ltrim(rtrim(objrs("CD_REFERENCIA"))) &"<br>"&str			
				objrs.MoveNext
				If objrs.eof then Exit Do  
			Loop
		End If
		
	If objrsf.State = adStateOpen Then objrsf.Close 
		sql = "SELECT SUBSTRING(PR.NR_PROCESSO,5,12) NR_PROCESSO, EN.NM_EMPRESA AS IMPORTADOR, EN.AP_EMPRESA AS NREDUZIDO, EN.CGC_EMPRESA AS CNPJ, PR.TX_MERCADORIA AS MERCADORIA, FUP.DT_REALIZACAO AS CHEGADA " &_
			  "FROM TPROCESSO PR (NOLOCK), TEMPRESA_NAC EN (NOLOCK), TFOLLOWUP FUP (NOLOCK) " &_
			  "WHERE PR.NR_PROCESSO = '"& NR_PROCESSO &"' "&_
			  "AND EN.CD_EMPRESA = PR.CD_CLIENTE "
				if produto = "01" then
				sql = sql &	"AND FUP.NR_PROCESSO =* PR.NR_PROCESSO AND FUP.CD_EVENTO = '162'"
				else
				sql = sql &	"AND FUP.NR_PROCESSO =* PR.NR_PROCESSO AND FUP.CD_EVENTO = '003'"
				end if
			  objrsf.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			  'Response.Redirect("../import/teste.asp?var1="&sql&"")%>
			<table  width="100%"   border="0" cellpadding="0" cellspacing="5">   
			  <tr bgcolor="<%=bgcolor%>" >                             
              <%Do While Not objrsf.Eof
              If produto = "01" Then%>
				<td width="81" class="style3"><div align="center" class="style6"><a href="imp_proc_result.asp?cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&tp_relat=2&filtro=nr_processo,nr_referencia,nr_item_cliente&nr_processo=<%=ltrim(rtrim(NR_PROCESSO))%>&nr_referencia=<%=ltrim(rtrim(CD_REFERENCIA))%>&nr_item_clnte=<%=NR_ITEM%>" ><%=objrsf("NR_PROCESSO")%></a></div></td>
               <%else%>
                <td width="81" class="style3"><div align="center" class="style6"><a href="exp_proc_result.asp?cd_menu_rel=02&cd_subm_rel=01&cd_view_rel=1630-0201-03&filtro=nr_processo,nr_referencia&nr_processo=<%=ltrim(rtrim(NR_PROCESSO))%>&nr_referencia=<%=ltrim(rtrim(CD_REFERENCIA))%>" ><%=objrsf("NR_PROCESSO")%></a></div></td>
               <%end if%>
				<td width="116" nowrap class="style3"><table  width="100%" border="0">
                  <tr>
                    <td width="114" nowrap class="style6"><%=str%> </td>
                  </tr>
                </table></td>
				<td width="206"><div align="center" class="style6"><%=objrsf("IMPORTADOR")%></div></td>
				<td width="111"><div align="center" class="style6"><%=objrsf("NREDUZIDO")%></div></td>
				<td width="113"><div align="center" class="style6"><%=objrsf("CNPJ")%></div></td>
				<td width="258"><div align="center" class="style6">
				  <div align="left"><%=objrsf("MERCADORIA")%></div>
				</div></td>
				<td width="81"><div align="center" class="style6"><%=objrsf("CHEGADA")%></div></td>
			  </tr>
			</table>
<span class="style2"><span class="style2"><span class="style3"><span class="style3">
			<% 
				 objrsf.MoveNext
				 If objrsf.Eof Then Exit Do
			   Loop
			   'str = objrsf.Fields.Item("NR_ITEM_PO").Value
				contador=contador+1%>
			</span></span></span></span>
<td colspan="2" class="style3 style3" ><table width="100%" cellpadding="0" cellspacing="0" border="0">
				  
		<%objrsx.MoveNext
		'If objrsx.Eof Then Exit Do 'Else str = str &";<br><br> "%>
<%Loop
End If%>
			 </table></td>
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bordercolor="#58849F" style="border: solid 1px #336699;">
  <tr>
    <td bgcolor="#336699"><span class="style5">Total de Processos encontrados: <%=contador%>&nbsp;</span></td>
  </tr>
</table>
<p class="style3 style3">&nbsp;</p>
  <p>
    <%objrsx.Close%>
  </p>
</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
