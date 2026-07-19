<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá WEB - Exportação
'Arquivo de Script e HTML: Busda de dados do Relatório de GSI
'
'Autor: Alexandre Gonçalves Neto
'Criado: 31/01/2006
'
'Manutenção:
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 650

Session("sql_exp_gsi") = Null

Dim filtro		'filtro selecionado para a consulta
Dim filtros		'todos os filtros da consulta
Dim cd_unid_neg	'código da unidade de negócios
Dim cd_produto	'código do produto (importação, exportação, etc)
Dim cd_grupo	'código do grupo da empresa do cliente
Dim cd_cliente	'código do cliente
Dim cd_pais		'pais de destino da mercadoria
Dim cd_importador	'código da familia de produto
Dim cd_familia	'código da familia de produto

in_show = False
cd_tela = "EXP018"
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
cd_view = Request("cd_view")
tx_erro = Request("tx_erro")
filtros = Request.Form

cd_unid_neg = Trim(Request("cd_unid_neg"))
cd_produto  = "02"'Trim(Request("cd_produto"))
cd_grupo    = Trim(Request("cd_grupo"))
cd_cliente  = Trim(Request("cd_cliente"))
cd_pais     = Trim(Request("cd_pais_dest"))
cd_importador  = Trim(Request("cd_importador"))
cd_familia  = Trim(Request("cd_familia_prod"))

in_view_filtro = 1
%>
<!--#include virtual="/includes/inc_views.asp"-->
<%
'valores padrão
If Not fnc_TestaVar(cd_unid_neg)   Then cd_unid_neg   = "X"
If Not fnc_TestaVar(cd_produto)    Then cd_produto    = "X"
If Not fnc_TestaVar(cd_grupo)      Then cd_grupo      = "X"
If Not fnc_TestaVar(cd_cliente)    Then cd_cliente    = "X"
If Not fnc_TestaVar(cd_pais)       Then cd_pais       = "X"
If Not fnc_TestaVar(cd_importador) Then cd_importador = "X"
If Not fnc_TestaVar(cd_familia)    Then cd_familia    = "X"

'verifica a consistencia dos dados
If Not fnc_TestaVar(cd_unid_neg)   Then tx_erro = tx_erro &"\n1 - Unidade de Negociação inválida;"
If Not fnc_TestaVar(cd_produto)    Then tx_erro = tx_erro &"\n2 - Produto inválido;"
If Not fnc_TestaVar(cd_grupo)      Then tx_erro = tx_erro &"\n3 - Grupo de Cliente inválido;"
If Not fnc_TestaVar(cd_cliente)    Then tx_erro = tx_erro &"\n4 - Cliente inválido;"
If Not fnc_TestaVar(cd_pais)       Then tx_erro = tx_erro &"\n5 - País inválido;"
If Not fnc_TestaVar(cd_importador) Then tx_erro = tx_erro &"\n6 - Importador inválido;"
If Not fnc_TestaVar(cd_familia)    Then tx_erro = tx_erro &"\n7 - Família de Produto Inválida;"

'caso ocorra algum erro redireciona para tela de busca e informa erros
'If tx_erro <> "" Then
'  tx_erro = "ATENÇÃO:\n"& tx_erro
'  Response.Redirect("/export/gsi_filtros.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
'  Response.End()
'End If

Session("sql_pagina") = Session("sql_pagina") &"FILTROS: "& filtros &"<br><br>"
Session("sql_pagina") = Session("sql_pagina") &"Unidade: "& cd_unid_neg &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"Produto: "& cd_produto &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"Grupo:   "& cd_grupo &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"Cliente: "& cd_cliente &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"País:    "& cd_pais &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"Importador: "& cd_importador &"<br>"
Session("sql_pagina") = Session("sql_pagina") &"Família: "& cd_familia &"<br>"

'Response.write "cd_usuario" & Session("cd_usuario") & "<BR>"
'Response.write "cd_cargo" & Session("cd_cargo") & "<BR>"
'Response.write "cd_unid_neg" & cd_unid_neg & "<BR>"
'Response.write "cd_produto" & cd_produto & "<BR>"
'Response.write "cd_grupo" & cd_grupo & "<BR>"
'Response.write "cd_cliente" & cd_cliente & "<BR>"
'Response.write "cd_pais" & cd_pais & "<BR>"
'Response.write "cd_importador" & cd_importador & "<BR>"
'Response.write "cd_familia" & cd_familia & "<BR>"
'Response.end

With objcmd
  .CommandTimeOut = 600
  .CommandText = "sp_rel_exp_gsi"
  .CommandType = adCmdStoredProc
  .Parameters.Append = .CreateParameter("@cd_usuario" , adChar, adParamInput,  4, Session("cd_usuario"))
  .Parameters.Append = .CreateParameter("@cd_cargo"   , adChar, adParamInput,  3, Session("cd_cargo"))
  .Parameters.Append = .CreateParameter("@cd_unid_neg", adChar, adParamInput,  2, cd_unid_neg)
  .Parameters.Append = .CreateParameter("@cd_produto" , adChar, adParamInput,  2, cd_produto)
  .Parameters.Append = .CreateParameter("@cd_grupo"   , adChar, adParamInput,  3, cd_grupo)
  .Parameters.Append = .CreateParameter("@cd_cliente" , adChar, adParamInput,  5, cd_cliente)
  .Parameters.Append = .CreateParameter("@cd_pais"    , adChar, adParamInput,  3, cd_pais)
  .Parameters.Append = .CreateParameter("@cd_importador"    , adChar, adParamInput,  5, cd_importador)
  .Parameters.Append = .CreateParameter("@cd_familia" , adChar, adParamInput,  8, cd_familia)
  .Parameters.Append = .CreateParameter("@nr_ident"   , adSmallInt, adParamOutPut)
  .Execute nrec, , adExecuteNoRecords
  nr_ident = .Parameters("@nr_ident")
End With

'seleciona os registros com o identificador criado
sql = "SELECT CD_USUARIO, NR_IDENT " &_
			"FROM TREL_EXP_GSI ( NOLOCK )" &_
			"WHERE CD_USUARIO = "& fnc_QuotedSQL(Session("cd_usuario")) &_
			"  AND NR_IDENT   = "& nr_ident
Session("sql_pagina") = Session("sql_pagina") & sql &"<br><br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If objrsx.RecordCount > 0 Then
  'grava na tabela de relatórios realizados
  sql = "INSERT INTO TRELATORIOS ( "&_
				"  CD_MENU, CD_SUBM, CD_USUARIO, CD_VIEW, NR_IDENT, DT_EMISSAO, HR_EMISSAO, IN_DADOS, IN_ATIVO, TX_FILTRO ) "&_
				"VALUES ( "&_
				"  '"& cd_menu &"', '"& cd_subm &"', '"& Session("cd_usuario") &"', '"& cd_view &"', ISNULL("& nr_ident &", 0), "&_
				"  CONVERT( datetime,'"& Date() &"',103 ), GETDATE(), 1, '1', '"& Request.QueryString &"' ) "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
  
  'caso existam valores com o identificador, envia para a página de relatório
  tx_erro = "" 'esvazia a variavel de erro
  
  'escreve a url para redirecionamento
  str = "/export/gsi_result.asp?nr_ident="& nr_ident &"&"& filtros
Else
  'grava na tabela de relatórios realizados
  sql = "INSERT INTO TRELATORIOS ( "&_
				"  CD_MENU, CD_SUBM, CD_USUARIO, CD_VIEW, NR_IDENT, DT_EMISSAO, HR_EMISSAO, IN_DADOS, IN_ATIVO, TX_FILTRO ) "&_
				"VALUES ( "&_
				"  '"& cd_menu &"', '"& cd_subm &"', '"& Session("cd_usuario") &"', '"& cd_view &"', ISNULL("& nr_ident &", 0), "&_
				"  CONVERT( datetime,'"& Date() &"',103 ), GETDATE(), 0, '1', '"& Request.QueryString &"' ) "
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objcnn.Execute(sql)
	
  tx_erro = "Não foram encontrados registros durante o período de "& dt_eventoi &" a "& dt_eventof &".\n" &_
						"Foram utilizados os seguintes filtros:\n"
  
  'escreve a url para redirecionamento
  str = "/export/gsi_filtros.asp?cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro)
End If
objrsx.Close()

Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include virtual="/includes/inc_ends.asp" -->