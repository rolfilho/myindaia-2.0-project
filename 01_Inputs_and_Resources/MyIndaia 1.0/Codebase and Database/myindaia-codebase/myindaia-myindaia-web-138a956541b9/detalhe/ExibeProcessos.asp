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
Server.ScriptTimeout = 9999

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
Dim unidade_neg

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
</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/30/seta.jpg';">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top">
<div id="dv_corpo"  class="divMainDet" style="display:block;">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
 <tr height="30">
  <td colspan="7">&nbsp;<font size="2"><b>Resultados da Busca</b></font><br /><img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="565" border="0"></td>
 </tr>
  <tr style="color:#FFFFFF;font-weight:bold;text-align:center;">
    <td width="50" class="gridtit" style="background-color:<%=cabec_result%>;">Processo</td>  
    <td width="100" class="gridtit" style="background-color:<%=cabec_result%>;">Unidade</td> 
    <td width="300" class="gridtit" style="background-color:<%=cabec_result%>;">Cliente</td> 
    <td width="120" class="gridtit" style="background-color:<%=cabec_result%>;">Abertura do Registro</td> 
  </tr>
<%nrec = 0
' Encontrar os processos que contêm o número de pedido solicitado
If objrsx.State = adStateOpen Then objrsx.Close 
	If produto = "01" Then
		sql = "	SELECT DISTINCT EP.NR_PROCESSO_DES AS NR_PROCESSO "&_
			"FROM TESTAGIO_PROCESSO EP (NOLOCK) "&_
			" INNER JOIN TPROCESSO PR ON (PR.NR_PROCESSO = EP.NR_PROCESSO_DES)"&_
			"WHERE EP.NR_PROCESSO_DES LIKE '%01"& request("NR_PROCESSO") &"%' "
			
		 If session("GrupoUsuario2") <> "0" then
			sql_a =	" AND PR.CD_GRUPO IN (SELECT DISTINCT P.CD_GRUPO "&_
                " FROM TPERMISSAO_GRUPO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
		
	  if objrs.State = adStateOpen then objrs.Close()
	  sql_aux = " SELECT COUNT(CD_CLIENTE) AS COUNT_EMPRESA"&_
                " FROM TPERMISSAO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	 objrs.Open sql_aux, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	  
	  If objrs.Fields.Item("COUNT_EMPRESA").Value > 0 Then
	  sql_a =	sql_a & " AND PR.CD_CLIENTE IN (SELECT DISTINCT P.CD_CLIENTE "&_
                " FROM TPERMISSAO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End If
	   
	  if objrs.State = adStateOpen then objrs.Close()
	  sql_aux = " SELECT COUNT(CD_AREA) AS COUNT_AREA"&_
                " FROM TPERMISSAO_AREA P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	 objrs.Open sql_aux, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	  
	  If objrs.Fields.Item("COUNT_AREA").Value > 0 Then
	  sql_a =	sql_a & " AND PR.CD_AREA IN (SELECT DISTINCT P.CD_AREA "&_
                " FROM TPERMISSAO_AREA P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End If		 
	   				
			sql_a =	sql_a & "	AND PR.NR_PROCESSO LIKE '%01"& request("REF_INDAIA") &"%' "
		  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
		 End If	
	Else
		sql = "SELECT DISTINCT RC.NR_PROCESSO AS NR_PROCESSO"&_
		" FROM TREF_CLIENTE RC "&_
		" INNER JOIN TPROCESSO PR ON (PR.NR_PROCESSO = RC.NR_PROCESSO)"&_
		" WHERE RC.NR_PROCESSO LIKE'%02"& request("NR_PROCESSO") &"%' "
		
		If session("GrupoUsuario2") <> "0" then
		  			sql_a =	" AND PR.CD_GRUPO IN (SELECT DISTINCT P.CD_GRUPO "&_
                " FROM TPERMISSAO_GRUPO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
		
	  if objrs.State = adStateOpen then objrs.Close()
	  sql_aux = " SELECT COUNT(CD_CLIENTE) AS COUNT_EMPRESA"&_
                " FROM TPERMISSAO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	  objrs.Open sql_aux, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	  
	  If objrs.Fields.Item("COUNT_EMPRESA").Value > 0 Then
	  sql_a =	sql_a & " AND PR.CD_CLIENTE IN (SELECT DISTINCT P.CD_CLIENTE "&_
                " FROM TPERMISSAO P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End If
	   
	  if objrs.State = adStateOpen then objrs.Close()
	  sql_aux = " SELECT COUNT(CD_AREA) AS COUNT_AREA"&_
                " FROM TPERMISSAO_AREA P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
	  objrs.Open sql_aux, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	  
	  If objrs.Fields.Item("COUNT_AREA").Value > 0 Then
	  sql_a =	sql_a & " AND PR.CD_AREA IN (SELECT DISTINCT P.CD_AREA "&_
                " FROM TPERMISSAO_AREA P "&_
                " WHERE CD_USUARIO = '" & Session("cd_usuario") & "')"
			  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
	   End If		 
	   				
			sql_a =	sql_a & "	AND PR.NR_PROCESSO LIKE '%01"& request("REF_INDAIA") &"%' "
		  'Response.Redirect("../import/teste.asp?var1="&sql_a&"")
		End If	
	End If	
	'If session("GrupoUsuario")<>0 then
	'	sql_a =	"AND PR.CD_GRUPO = '"&session("GrupoUsuario")&"'"
	'End if
	sql=sql & sql_a	
	'response.Write(session("GrupoUsuario"))
	'Response.Redirect("../import/teste.asp?var1="&sql&"")


'			Response.Write sql
'			Response.end

	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	if objrsx.eof then
		Response.Redirect("../default.asp?Msg=Pedido não encontrado!&cd_menu=01" &_
				"&cd_subm="& cd_subm &_
				"&cd_view="& cd_view )
	end if

If objrsx.RecordCount > 0 Then
Do While nrec < objrs.PageSize and Not objrsx.Eof
	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
	str=""
	NR_PROCESSO=objrsx("NR_PROCESSO")
	If objrs.State = adStateOpen Then objrs.Close 
	   If produto = "01" Then
		   sql = "SELECT CD_REFERENCIA, NR_ITEM_PO, CD_EMPRESA FROM TREF_CLIENTE "&_
				 "WHERE NR_PROCESSO = '"& NR_PROCESSO &"'  AND TP_REFERENCIA = '01' ORDER BY CD_REFERENCIA DESC"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Do While not objrs.eof 
				'Acumula os ítens deste processo
				NR_ITEM=objrs.Fields.Item("NR_ITEM_PO").Value
				CD_REFERENCIA=ltrim(rtrim(objrs("CD_REFERENCIA")))
                CD_EMPRESA = objrs.Fields.Item("CD_EMPRESA").Value
				'NR_ITEM = "&nbsp;"& NR_ITEM & Trim(Replace(objrs.Fields.Item("NR_ITEM_PO").Value, """", "'"))
				str = ltrim(rtrim(objrs("CD_REFERENCIA")))&"/"&objrs.Fields.Item("NR_ITEM_PO").Value&"<br>"&str			
				objrs.MoveNext
				If objrs.eof then Exit Do  
			Loop
		Else
			sql = "SELECT CD_REFERENCIA, CD_EMPRESA FROM TREF_CLIENTE "&_
			   	  "WHERE NR_PROCESSO = '"& NR_PROCESSO &"' AND TP_REFERENCIA = '" & Rtrim(Session("TipoPedido")) & "' ORDER BY CD_REFERENCIA DESC"
			objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			Do While not objrs.eof 
				'Acumula os ítens deste processo
				CD_REFERENCIA=ltrim(rtrim(objrs("CD_REFERENCIA")))
                CD_EMPRESA = objrs.Fields.Item("CD_EMPRESA").Value
				'NR_ITEM = "&nbsp;"& NR_ITEM & Trim(Replace(objrs.Fields.Item("NR_ITEM_PO").Value, """", "'"))
				str = ltrim(rtrim(objrs("CD_REFERENCIA"))) &"<br>"&str			
				objrs.MoveNext
				If objrs.eof then Exit Do  
			Loop
		End If
		
	If objrsf.State = adStateOpen Then objrsf.Close 
		sql = "SELECT SUBSTRING(PR.NR_PROCESSO,5,12) NR_PROCESSO, PR.CD_UNID_NEG AS UNIDADE, EN.NM_EMPRESA AS IMPORTADOR, EN.AP_EMPRESA AS NREDUZIDO, EN.CGC_EMPRESA AS CNPJ, PR.TX_MERCADORIA AS MERCADORIA, FUP.DT_REALIZACAO AS CHEGADA " &_
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
              <%Do While Not objrsf.Eof%>
              <tr bgcolor="<%=bgcolor%>"> 
              <%If produto = "01" Then%>
				<td width="80" style="text-align:center"><a href="imp_proc_result.asp?cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&tp_relat=2&filtro=nr_processo,nr_referencia,nr_item_cliente&nr_processo=<%=ltrim(rtrim(NR_PROCESSO))%>&cd_empresa=<%=cd_empresa%>&nr_referencia=<%=ltrim(rtrim(CD_REFERENCIA))%>&nr_item_clnte=<%=NR_ITEM%>" ><%=objrsf("NR_PROCESSO")%></a></td>
               <%else%>
                <td width="80" style="text-align:center"><a href="exp_proc_result.asp?cd_menu_rel=02&cd_subm_rel=01&cd_view_rel=1630-0201-03&filtro=nr_processo,nr_referencia&nr_processo=<%=ltrim(rtrim(NR_PROCESSO))%>&cd_empresa=<%=cd_empresa%>&nr_referencia=<%=ltrim(rtrim(CD_REFERENCIA))%>" ><%=objrsf("NR_PROCESSO")%></a></td>
               <%end if
			   If objrsf("UNIDADE") = "01" Then
			   		unidade_neg = "Indaiá Santos"
			   Else
			     If objrsf("UNIDADE") = "02" Then
					unidade_neg = "Indaiá Rio"	
				 Else
				 	unidade_neg = "Indaiá São Paulo"			
				 End If
			   End If
			   %>
                <td width="100" style="text-align:center"><%=unidade_neg%></td>
                <td width="300"><%=Trim(objrsf("IMPORTADOR"))%></td>
			    <td width="120" style="text-align:center"><%=objrsf("CHEGADA")%></td>
			  </tr>
			<% 
		    objrsf.MoveNext
		    If objrsf.Eof Then Exit Do
			Loop
			'str = objrsf.Fields.Item("NR_ITEM_PO").Value
			contador=contador+1
         objrsx.MoveNext
		'If objrsx.Eof Then Exit Do 'Else str = str &";<br><br> "
        Loop
        End If
        objrsx.Close
        %>
    <tr height="15">
    <td class="gridtit" colspan="7" style="text-align:left;background-color:<%=cabec_result%>;">&nbsp;Total de Processos encontrados: <%=contador%>&nbsp;</td>
    </tr>    
   <tr>
    <td colspan="7" valign="top" style="text-align:right"><b>(Clique no processo para ver os detalhes)</b>&nbsp;&nbsp;</td>
    </tr>
</table>
</div>
</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
		</td>
	</tr>
</table>
</body>
</html>