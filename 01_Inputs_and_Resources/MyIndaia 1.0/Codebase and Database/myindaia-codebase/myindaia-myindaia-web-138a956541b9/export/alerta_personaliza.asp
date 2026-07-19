<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Personalização do Site
'Arquivo de Script e HTML: Cadastro de Personalizações
'
'Modificado por Alexandre Gonçalves Neto em 18/01/2006
'
'---------------------------------------------------------------------------
if fnc_testaVar(Request.QueryString("tx_erro")) Then
%>
<script>
    alert('<%=Request.QueryString("tx_erro")%>');
</script>
<%
End If
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
Dim in_padrao   'identificador de visualização padrão(0-não; 1-sim)
Dim in_download 'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_email	  'identificador para disponibilizar o recebimento do relátorio no e-mail(0-não; 1-sim)
Dim in_print	  'identificador para disponibilizar o relatório para download(0-não; 1-sim)
Dim in_doctos   'identificador para disponibilizar a visualização de documentos scaneados(0-não; 1-sim)
Dim cd_evento	  'código do evento para alerta/exclusão
Dim nr_dias		  'número de dias para o relatório de exclusão
Dim cd_ordem    'nome dos campos de ordenação
Dim tp_ordem    'ordenação do campo(0-ascendente; 1-descendente)
Dim array_filtro'fitros da persanalização
Dim array_campo	'campos da persanalização
Dim script_filtro'nome do script do filtro
Dim script_campo 'nome do script do campo
Dim nm_page      'nome da pagina de filtros
Dim in_tipo      'tipo de ação que irá ocorrer na tabela(inclusão/edição/exclusão)
Dim in_acao      'ação que está ocorrendo no cadastro
Dim ex_embarque, ex_dt_prev, ex_download, ex_email, ex_print, ex_doctos
Dim ex_relat, ex_quebra, ex_evento, ex_dias, ex_ordem
Dim nr_max_filtro, nr_max_campo 'qtde máx. de filtros e campos por relatório.
Dim Permisso 'Permissão para definir o tipo de exibição
Dim tp_exibir_Export 'Permissão para exibir apenas os campos autorizados
Dim sql_s  'monta o select da query com os campos a serem exibidos
Dim sql_f  'monta o from da query com as tabelas extras para a pesquisa
Dim sql_w  'monta o where da query
Dim sql_o  'monta a ordenação da query
Dim msg ' mensagem para exportação - status exibir
Dim CheckMenu,checkPassagem
Dim cd_cargo1
Dim opcao_kpi
Dim tp_limitador, aux_quebra
quantidade_campos = 50
quantidade_file = 5
qt_freq_ocorre_de = 0

'tp_exibir_Export=0
in_show = True
cd_tela = "004"
nm_tela = tx_lang_004001(cd_lang) &" &gt;&gt; "
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
tx_erro = Request("tx_erro")
in_acao = Request("in_acao")


'Identificando o usuário, e grupo de empresas que ele têm acesso:

sql = " SELECT  TG.CD_GRUPO, TG.IN_EXIBE_PEDIDO_SITE AS PERMISSO" &_
    " from       TPERMISSAO_GRUPO     TP " &_
    " INNER JOIN TGRUPO         TG (NOLOCK) ON(TP.CD_GRUPO=TG.CD_GRUPO) " &_
    " WHERE  TP.CD_USUARIO='"&session("cd_usuario") & "'"
	Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText
If objrsx.eof or isnull(objrsx("PERMISSO"))then
   permisso=0
else
   permisso=objrsx("PERMISSO")
End if
Objrsx.Close
'recupera o nome do menu e sub-menu
sql = "SELECT RTRIM("& tx_lang_menu &") AS M01_NM_MENU, M01_AP_MENU, RTRIM("& tx_lang_subm &") AS M02_NM_SUBM, M02_AP_SUBM, "&_
			"  M02_EX_EMBARQUE, M02_EX_DT_PREV, M02_EX_DOWNLOAD, M02_EX_EMAIL, M02_EX_PRINT, M02_EX_DOCTOS, M02_EX_RELAT, M02_EX_QUEBRA, "&_
			"  M02_EX_EVENTO, M02_EX_DIAS, M02_EX_ORDEM, M02_NR_MAX_FILTRO, M02_NR_MAX_CAMPO, GETDATE() AS DATA_ATUAL "&_
			"FROM M02_SUBM ( NOLOCK ) " &_
			" INNER JOIN M01_MENU ( NOLOCK ) ON M01_CD_MENU = M02_CD_MENU " &_
			"WHERE M02_CD_MENU = '"& cd_menu &"' "&_
			"  AND M02_CD_SUBM = '"& cd_subm &"' "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'escreve o nome do menu e submenu para aparecer na tela
nm_tela = nm_tela & objrs.Fields.Item("M01_NM_MENU").Value &" &gt;&gt; "& objrs.Fields.Item("M02_NM_SUBM").Value
'monta o nome da pagina de filtro
nm_page = "/"& objrs.Fields.Item("M01_AP_MENU").Value &"/"& objrs.Fields.Item("M02_AP_SUBM").Value
'verifica quais opções serão exibidas no cadastro
ex_embarque = objrs.Fields.Item("M02_EX_EMBARQUE").Value
ex_dt_prev  = objrs.Fields.Item("M02_EX_DT_PREV").Value
ex_download = objrs.Fields.Item("M02_EX_DOWNLOAD").Value
ex_email    = objrs.Fields.Item("M02_EX_EMAIL").Value
ex_print    = objrs.Fields.Item("M02_EX_PRINT").Value
ex_doctos   = objrs.Fields.Item("M02_EX_DOCTOS").Value
ex_relat    = objrs.Fields.Item("M02_EX_RELAT").Value
ex_quebra   = objrs.Fields.Item("M02_EX_QUEBRA").Value
ex_evento   = objrs.Fields.Item("M02_EX_EVENTO").Value
ex_dias     = objrs.Fields.Item("M02_EX_DIAS").Value
ex_ordem    = objrs.Fields.Item("M02_EX_ORDEM").Value
nr_max_filtro = objrs.Fields.Item("M02_NR_MAX_FILTRO").Value
nr_max_campo  = objrs.Fields.Item("M02_NR_MAX_CAMPO").Value
data_hoje = objrs.Fields.Item("DATA_ATUAL").Value
objrs.Close

'--------------------------  :: NOVO EXPORTAÇÃO EM TESTE:: --------------------------------------------------
'If in_acao = "NovoExp" Then
'	cd_user      = Session("cd_usuario")
'	cd_view      = cd_user &"-"& cd_menu & cd_subm &"-"
'	nm_view      = ""
'	in_embarque  = 1
'	in_dt_prev   = 0
'	in_download  = 0
'	in_email     = 0
'	in_print     = 0
'	in_doctos    = 0
'	in_padrao    = 0
'	tp_relat     = 0
'	tp_quebra    = 2
'	tp_ref_cli   = ""
'	cd_evento    = ""
'	nr_dias      = Null
'	cd_ordem     = ""
'	tp_ordem     = 0
'	array_filtro = ""
'	array_campo  = ""
'	tp_relat=Request("tp_relat")
'	nm_tela = tx_lang_004002(cd_lang) &" "& nm_tela
'	'in_tipo = "NovoExp"
'	tp_exibir_Export=0
'End If
'------------------------------------------------------------------------------------
'prepara para uma nova inclusão, coloca os valores padrão nas variáveis
If in_acao = "novo" Then
	cd_user      = Session("cd_usuario")
	cd_view      = cd_user &"-"& cd_menu & cd_subm &"-"
	nm_view      = ""
    contador_arquivos = 0
	in_embarque  = 1
	in_dt_prev   = 0
	in_download  = 0
	in_email     = 0
	in_print     = 0
	in_doctos    = 0
	in_padrao    = 0
	tp_relat     = 0
	tp_quebra    = 2
	tp_ref_cli   = ""
	cd_evento    = ""
    cd_evento_2  = ""
	nr_dias      = Null
    nr_dias_2    = Null
	cd_ordem     = Null
	tp_ordem     = 0
	array_filtro = ""
	array_campo  = ""
	nm_tela = tx_lang_004002(cd_lang) &" "& nm_tela
	in_tipo = "incluir"
	'tp_exibir_Export=0
End If
'recebe os valores do formulário, verifica se estão corretos e inclui na tabela
If in_acao = "incluir" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	'*************** flavio
	If nm_view="" then 
	tx_erro="O campo DESCRIÇÃO da Personalização é obrigatório!"
			Response.Redirect("?in_acao=novo&checkPassagem=nm_view&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
		Response.End()
	End If
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
    cd_evento_2  = Request.Form("cd_evento_2")
	nr_dias      = Request.Form("nr_dias")
    nr_dias_2    = Request.Form("nr_dias_2")
	opcao_kpi    = Request.Form("opcao_kpi")
	tp_limitador = Request.Form("tp_limitador")
    tp_limitador_2 = Request.Form("tp_limitador_2")
    tp_limitador_aux = Request.Form("tp_limitador_aux")
    tp_limitador_aux_2 = Request.Form("tp_limitador_aux_2")
    freq_ocorre_todos  = Request.Form("freq_ocorre_todos")
    freq_ocorre_seg  = Request.Form("freq_ocorre_seg")
    freq_ocorre_ter  = Request.Form("freq_ocorre_ter")
    freq_ocorre_qua  = Request.Form("freq_ocorre_qua")
    freq_ocorre_qui  = Request.Form("freq_ocorre_qui")
    freq_ocorre_sex  = Request.Form("freq_ocorre_sex")
    freq_ocorre_sab  = Request.Form("freq_ocorre_sab")
    freq_ocorre_dom  = Request.Form("freq_ocorre_dom")
    tp_freq_ocorre = Request.Form("tp_freq_ocorre")
    hr_freq_ocorre = Request.Form("hr_freq_ocorre")
    dias_freq_ocorre = Request.Form("dias_freq_ocorre")
    cd_grupo_view   = Request.Form("cd_grupo_view")
    cd_cliente_view = Request.Form("cd_cliente_view")
    cd_modal_view   = Request.Form("cd_modal_view")
    cd_unid_view    = Request.Form("cd_unid_view")
    cd_area_view    = Request.Form("cd_area_view")
    cd_celula_view  = Request.Form("cd_celula_view")
    cd_transp_view  = Request.Form("cd_transp_view")
    cd_grupo_view_aux = Request.Form("cd_grupo_view_aux")
    cd_cliente_view_aux = Request.Form("cd_cliente_view_aux")
    cd_modal_view_aux = Request.Form("cd_modal_view_aux")
    cd_unid_view_aux = Request.Form("cd_unid_view_aux")
    cd_area_view_aux = Request.Form("cd_area_view_aux")
    cd_celula_view_aux = Request.Form("cd_celula_view_aux")
    cd_transp_view_aux = Request.Form("cd_transp_view_aux")
    cd_armador_view_aux = Request.Form("cd_armador_view_aux")
    cd_importador_view_aux = Request.Form("cd_importador_view_aux")
    cd_ordenacao_view = Request.Form("cd_ordenacao_view")
    tp_ordenacao_view = Request.Form("tp_ordenacao_view")
	cd_ordem     = Null
	tp_ordem     = 0

    If fnc_TestaVar(cd_grupo_view)   Then 
      in_cd_grupo_view   = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_grupo_view = 0 
    End If

    If fnc_TestaVar(cd_cliente_view) Then 
      in_cd_cliente_view = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_cliente_view = 0
    End If

    If fnc_TestaVar(cd_modal_view)   Then 
      in_cd_modal_view   = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_modal_view = 0
    End If

    If fnc_TestaVar(cd_unid_view)    Then 
      in_cd_unid_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_unid_view = 0
    End If

    If fnc_TestaVar(cd_area_view)    Then 
      in_cd_area_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_area_view = 0
    End If

    If fnc_TestaVar(cd_celula_view)    Then 
      in_cd_celula_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_celula_view = 0
    End If

    If fnc_TestaVar(cd_transp_view)    Then 
      in_cd_transp_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_transp_view = 0
    End If

    If fnc_TestaVar(cd_armador_view)    Then 
      in_cd_armador_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_armador_view = 0
    End If

    If fnc_TestaVar(cd_importador_view)    Then 
      in_cd_importador_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_importador_view = 0
    End If

'	If Not fnc_TestaVar(array_filtro) Then tx_erro = tx_erro &"\n- "& tx_lang_004011(cd_lang) &";"
'	If Request("cd_filtro")="" then 'flavio
'	tx_erro="Não foi selecionado nenhum FILTRO" ' flavio
'			Response.Redirect("?in_acao=novo&checkPassagem=filtro&nm_view="&Request.Form("nm_view")&"&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
'				'nm_view=Request.Form("nm_view")
'
'		Response.End()
'	End If
	array_filtro = Request("cd_filtro")
	array_campo  = Request("cd_campo")
	nm_tela = tx_lang_004003(cd_lang) &" "& nm_tela
	in_tipo = "incluir"
	'verifica se ocorreram erros de preenchimento
	tx_erro = ""
	If Not fnc_TestaVar(cd_menu) Then tx_erro = tx_erro &"\n- "& tx_lang_004006(cd_lang) &";"
	If Not fnc_TestaVar(cd_subm) Then tx_erro = tx_erro &"\n- "& tx_lang_004007(cd_lang) &";"
	If Not fnc_TestaVar(cd_user) Then tx_erro = tx_erro &"\n- "& tx_lang_004008(cd_lang) &";"
	If Not fnc_TestaVar(cd_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004009(cd_lang) &";"
	If Not fnc_TestaVar(nm_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004010(cd_lang) &";"

	'se acontecerem erros informa o usuário
	If Len(tx_erro) > 0 Then
		tx_erro = tx_lang_A00002(cd_lang) &":"& tx_lang_A00003 &"\n"& tx_erro &"\n"&_
							tx_lang_004013(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
	Else
		'seleciona o último código de filtro e número de ordem
		sql = "SELECT SUBSTRING(MAX(M06_CD_VIEW), 11, 2) AS ULTIMO " &_
					"FROM M06_VIEW ( NOLOCK ) " &_
					"WHERE M06_CD_MENU    = '"& cd_menu &"' "&_
					"  AND M06_CD_SUBM    = '"& cd_subm &"' "&_
					"  AND M06_CD_USUARIO = '"& cd_user &"' "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'cria o código para o registro
		If Not fnc_TestaVar(objrs.Fields.Item("ULTIMO").Value) Then
			cd_view   = cd_view &"01"
		Else
			'seleciona o total de personalizações do ususario deste menu/submenu e que não seja de sistema
			sql = "SELECT COUNT(*) AS VIEWS "&_
						"FROM M06_VIEW ( NOLOCK ) "&_
						"WHERE M06_CD_MENU    = '"& cd_menu &"' "&_
						"  AND M06_CD_SUBM    = '"& cd_subm &"' "&_
						"  AND M06_CD_USUARIO = '"& cd_user &"' "&_
						"  AND M06_IN_SYSTEM  = 0 "
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			If objrsx.Fields.Item("VIEWS").Value = 99 Then
				tx_erro = tx_lang_A00002(cd_lang) &":\n\n - "& tx_lang_004016(cd_lang) &"."
				Response.Redirect("cad_lista.asp?tx_erro="& Server.URLEncode(tx_erro))
				Response.End()
			Else
				If CInt(objrs.Fields.Item("ULTIMO").Value) <> objrsx.Fields.Item("VIEWS").Value Then
					'busca pelo código vago
					With objcmd
						.CommandTimeOut = 60
						.CommandText    = "sp_view_codigo_vago"
						.CommandType    = adCmdStoredProc
						.Parameters.Append = .CreateParameter("@cd_usuario", adChar   , adParamInput, 4, cd_user)
						.Parameters.Append = .CreateParameter("@cd_menu"   , adChar   , adParamInput, 2, cd_menu)
						.Parameters.Append = .CreateParameter("@cd_subm"   , adChar   , adParamInput, 2, cd_subm)
						.Parameters.Append = .CreateParameter("@cd_view_nr", adInteger, adParamOutPut)
						.Execute nrec, , adExecuteNoRecords
						cd_view = cd_view & fnc_AddZeros(CStr(.Parameters("@cd_view_nr")), 2)
					End With
				Else
					cd_view = cd_view & fnc_AddZeros(CInt(objrs.Fields.Item("ULTIMO").Value) + 1, 2)
				End If
			End If
			If objrsx.Fields.Item("VIEWS").Value = 0 and objrsx.RecordCount > 0 Then in_padrao = 1
			objrsx.Close
		End If
		objrs.Close
		'coloca o valor padrão nas variaveis numéricas
		If Not fnc_TestaVar(in_embarque) Then in_embarque  = 1
		If Not fnc_TestaVar(in_dt_prev)  Then in_dt_prev   = 0
		If Not fnc_TestaVar(in_download) Then in_download  = 0
		If Not fnc_TestaVar(in_email)    Then in_email     = 0
		If Not fnc_TestaVar(in_print)    Then in_print     = 0
		If Not fnc_TestaVar(in_doctos)   Then in_doctos    = 0
		If Not fnc_TestaVar(in_padrao)   Then in_padrao    = 0
		If Not fnc_TestaVar(tp_relat)    Then tp_relat     = 0
		'If Not fnc_TestaVar(tp_quebra)   Then tp_quebra    = "2"
		'If Not fnc_TestaVar(tp_ref_cli)  Then tp_ref_cli   = "01"
		if not fnc_TestaVar(cd_evento)   then cd_evento      = null
        if not fnc_TestaVar(cd_evento_2) then cd_evento_2      = null
		If Not fnc_TestaVar(nr_dias)     Then nr_dias      = Null
        If Not fnc_TestaVar(nr_dias_2)     Then nr_dias_2      = Null
        If Not fnc_TestaVar(cd_grupo_view) Then cd_grupo_view = Null
        If Not fnc_TestaVar(cd_cliente_view) Then cd_cliente_view = Null
        If Not fnc_TestaVar(cd_modal_view) Then cd_modal_view = Null
        If Not fnc_TestaVar(cd_unid_view) Then cd_unid_view = Null
        If Not fnc_TestaVar(cd_area_view) Then cd_area_view = Null
        If Not fnc_TestaVar(cd_celula_view) Then cd_celula_view = Null
        If Not fnc_TestaVar(cd_transp_view) Then cd_transp_view = Null
        If Not fnc_TestaVar(cd_armador_view) Then cd_armador_view = Null
        If Not fnc_TestaVar(cd_importador_view) Then cd_importador_view = Null
        If Not fnc_TestaVar(cd_ordenacao_view) Then cd_ordenacao_view = Null
        If Not fnc_TestaVar(tp_ordenacao_view) Then tp_ordenacao_view = Null
		
		in_print = 1
		in_download = 1

		If objrsx.State = adStateOpen Then objrsx.Close	
        sql = "SELECT COUNT(M06.M06_CD_VIEW) AS CONTADOR_OUTROS "&_
        " FROM M06_VIEW M06"&_
        " INNER JOIN M19_VIEW_HORARIO M19 ON M19.M19_CD_VIEW = M06.M06_CD_VIEW "&_
        " WHERE M06.M06_CD_USUARIO = '" & Session("cd_usuario") & "'"&_ 
        "  AND M06.M06_CD_SUBM = '03'"&_
        "  AND M06.M06_CD_MENU IN('01', '02') "&_
        "  AND M06.M06_CD_VIEW <> '" & cd_view & "'"&_
        "  AND (M06.M06_FREQ_OCORRE_TODOS = 1 "
        
        If freq_ocorre_seg <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SEG = 1 "
        If freq_ocorre_ter <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_TER = 1 "
        If freq_ocorre_qua <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_QUA = 1 "
        If freq_ocorre_qui <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_QUI = 1 "
        If freq_ocorre_sex <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SEX = 1 "
        If freq_ocorre_sab <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SAB = 1 "
        If freq_ocorre_dom <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_DOM = 1 "

        if fnc_TestaVar(dias_freq_ocorre) Then
            dias_freq_ocorre_array = Split(dias_freq_ocorre, ";")
            For I = 0 To UBound(dias_freq_ocorre_array)
                if fnc_TestaVar(dias_freq_ocorre_array(I)) Then
                    sql = sql & " OR (CHARINDEX(RIGHT('00' + '" & dias_freq_ocorre_array(I) & "', 2), M06.M06_DIAS_FREQ_OCORRE) > 0 " &_
                    "  OR CHARINDEX(';' + '" & dias_freq_ocorre_array(I) & "' + ';', ';' + M06.M06_DIAS_FREQ_OCORRE + ';') > 0) " 
                End If        
            Next
        End If

        sql = sql & " )"
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        contador_outros = objrsx("CONTADOR_OUTROS")

        If objrsx.State = adStateOpen Then objrsx.Close	
        sql = "SELECT COUNT(CD_VIEW) AS CONTADOR_RELATORIO "&_ 
        " FROM FN_TMP_ALERTAS_WEB('" & cd_view & "', '" & cd_menu & "', '03', '" & Session("cd_usuario")& "', "&_
        " " & fnc_QuotedSQL(hr_freq_ocorre) & ", " & fnc_QuotedSQL(freq_ocorre_todos) & ", " & fnc_QuotedSQL(freq_ocorre_seg)  & "," & fnc_QuotedSQL(freq_ocorre_ter)  & ", "&_
        " " & fnc_QuotedSQL(freq_ocorre_qua)  & ", " & fnc_QuotedSQL(freq_ocorre_qui)  & " , " & fnc_QuotedSQL(freq_ocorre_sex)  & " , " & fnc_QuotedSQL(freq_ocorre_sab)  & ", "&_
        " " & fnc_QuotedSQL(freq_ocorre_dom)  & ", " & fnc_QuotedSQL(dias_freq_ocorre) & ")"&_
        " WHERE CD_VIEW = '" & cd_view & "'"                              
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        contador_relatorio = objrsx("CONTADOR_RELATORIO")

        If CInt(contador_outros) + CInt(contador_relatorio) > 15 Then
            tx_erro = "ATENÇÃO: Máximo de 15 relatórios para o mesmo dia!"
            Response.Redirect("?in_acao=novo&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
		    Response.End()
        End If
  		
  		'monta o select para inclusão da personalização
		sql = "INSERT INTO M06_VIEW ( " &_
					"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW,   "&_
					"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT,  "&_
					"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
                    "  M06_CD_EVENTO_2, M06_TP_LIMITADOR_2, M06_TP_LIMITADOR_AUX_2, "&_
					"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS, M06_IN_KPI, M06_TP_LIMITADOR, M06_TP_LIMITADOR_AUX, " &_
                    "  M06_FREQ_OCORRE_TODOS, M06_FREQ_OCORRE_SEG, M06_FREQ_OCORRE_TER, M06_FREQ_OCORRE_QUA, M06_FREQ_OCORRE_QUI, " &_
                    "  M06_FREQ_OCORRE_SEX, M06_FREQ_OCORRE_SAB, M06_FREQ_OCORRE_DOM, M06_HR_FREQ_DIARIA, M06_DIAS_FREQ_OCORRE, "&_
                    "  M06_CD_GRUPO, M06_CD_CLIENTE, M06_CD_MODAL, M06_CD_UNIDADE, M06_CD_AREA, M06_CD_CELULA, M06_CD_TRANSP, M06_CD_ARMADOR, M06_CD_IMPORTADOR "&_	                     
					") " &_
					"VALUES ("&_
						fnc_QuotedSQL(cd_view) &", "& fnc_QuotedSQL(cd_menu) &", "& fnc_QuotedSQL(cd_subm) &", "&_
						fnc_QuotedSQL(cd_user) &", "& fnc_QuotedSQL(nm_view) &", "&_
						in_embarque &", "& in_dt_prev &", "& in_download &", "& in_email &", "& in_print &", "&_ 
						in_padrao &", "& fnc_QuotedSQL(tp_relat) &", "& fnc_QuotedSQL(tp_quebra) &", "&_
						fnc_QuotedSQL(tp_ref_cli) &", "& fnc_QuotedSQL(cd_evento) &", "&_
                        fnc_QuotedSQL(cd_evento_2) & ", " & fnc_QuotedSQL(tp_limitador_2) & ", " & fnc_QuotedSQL(tp_limitador_aux_2) & ", " & fnc_QuotedSQL(nr_dias) &", "&_
						fnc_QuotedSQL(cd_ordenacao_view) &", "& fnc_QuotedSQL(tp_ordenacao_view) &", "& in_doctos &", "& fnc_QuotedSQL(opcao_kpi) &", "& fnc_QuotedSQL(tp_limitador) &", " & fnc_QuotedSQL(tp_limitador_aux) &", " &_                       
                        fnc_QuotedSQL(freq_ocorre_todos)&", "& fnc_QuotedSQL(freq_ocorre_seg)&", "&fnc_QuotedSQL(freq_ocorre_ter)&", "&fnc_QuotedSQL(freq_ocorre_qua)&", "&_
                        fnc_QuotedSQL(freq_ocorre_qui)&", "&fnc_QuotedSQL(freq_ocorre_sex)&", "&fnc_QuotedSQL(freq_ocorre_sab)&", "&fnc_QuotedSQL(freq_ocorre_dom)&", " & fnc_QuotedSQL(hr_freq_ocorre) & ", " & fnc_QuotedSQL(dias_freq_ocorre) & ", "&_
                        fnc_QuotedSQL(cd_grupo_view) &", "& fnc_QuotedSQL(cd_cliente_view) &", "& fnc_QuotedSQL(cd_modal_view) &","& fnc_QuotedSQL(cd_unid_view) &","& fnc_QuotedSQL(cd_area_view) &", "& fnc_QuotedSQL(cd_celula_view) &", "& fnc_QuotedSQL(cd_transp_view) &", "& fnc_QuotedSQL(cd_armador_view) &", "& fnc_QuotedSQL(cd_importador_view) &") "
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
        objcnn.Execute(sql)
                
        hr_freq_ocorre_array =  Split(hr_freq_ocorre, ";")
        hora_hoje = Hour(data_hoje) & ":" & Minute(data_hoje)

        'DELETA HORARIOS
        sql = "DELETE FROM M19_VIEW_HORARIO WHERE M19_CD_VIEW = "& fnc_QuotedSQL(cd_view)
        objcnn.Execute(sql)
        
        'INSERE HORARIOS  
        For I = 0 To UBound(hr_freq_ocorre_array)
          data_ult_exec = ""
        
          If fnc_TestaVar(hr_freq_ocorre_array(I)) Then  
              If CDate(hora_hoje) > CDate(hr_freq_ocorre_array(I)) Then
                data_ult_exec = "GETDATE()"
              Else
                data_ult_exec = "GETDATE()-1"
              End If

              sql = "INSERT INTO M19_VIEW_HORARIO (M19_CD_VIEW, M19_NR_ALERTA, M19_HR_ALERTA, M19_DT_ULTIMA_EXEC) "&_
                " VALUES (" & fnc_QuotedSQL(cd_view) & ", " & I + 1 & ", " &  fnc_QuotedSQL(hr_freq_ocorre_array(I)) & ", " & data_ult_exec & " ) "
              objcnn.Execute(sql)
          End If
        Next
		
		'verifica se ocorreram erros, se sim, informa usuário
		If Err.Number = 0 Then
			nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
			in_tipo = "alterar"
			tx_erro = tx_lang_004014(cd_lang) &"!"
			
			'verifica se a nova view é padrão
			If in_padrao Then
				sql = "UPDATE M06_VIEW SET " &_
							"  M06_IN_PADRAO = 0 " &_
							"WHERE M06_CD_VIEW   <> "& fnc_QuotedSQL(cd_view) &_
							"  AND M06_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
							"  AND M06_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
							"  AND M06_CD_USUARIO = "& fnc_QuotedSQL(cd_user)
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
			End If
			
			'inclui os filtros da personalização
			cont = 1
			num  = 0
			str  = array_filtro
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_filtro
				cont = InStr(str,",")
				
				If cont <> 0 Then
				sql = "INSERT INTO M13_VIEW_FILTRO ( "&_
							"  M13_CD_VIEW, M13_CD_FILTRO, M13_NR_ORDEM "&_
							" ) " &_
							"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
							" )"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
				
				num = num + 1
				str = Right(str, Len(str) - cont)
				End If
			Loop
			
			'inclui os campos da personalização
			cont = 1
			num  = 0
			str  = array_campo
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= quantidade_campos
				cont = InStr(str,",")
				
				If cont <> 0 Then
					If Left(Left(str, cont - 1), 3) = "kpi" Then
                      tp_kpi = Right(Left(str, cont - 1), 1)
                    Else
                      tp_kpi = "0"
                    End If

					sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
								"  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI "&_
								") " &_
								"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
								UBound(matriz) - num &_
								", " & fnc_QuotedSQL(tp_kpi) &  " )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)

                     if Left(Left(str, cont - 1), 3) = "arq" Then
					    sql = "UPDATE M06_VIEW SET M06_CD_ARQUIVO = ISNULL(M06_CD_ARQUIVO, '') + '" & CInt(Right(Trim(Left(str, cont - 1)),4)) & ";' WHERE M06_CD_VIEW = '" & cd_view & "'"
                        'Response.write sql
                        'Response.end
					    objcnn.Execute(sql)
                    End If

					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
								tx_lang_004015(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		End If
	End If
End If
'prepara a personalização para ser alterada
If in_acao = "editar" Then
	cd_view = CStr(Request("cd_view"))
	nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
	in_tipo = "alterar"
	
	'seleciona a personalização
	sql = "SELECT "&_
				"  M06_CD_VIEW    , M06_CD_MENU   , M06_CD_SUBM    , M06_CD_USUARIO, M06_NM_VIEW  , "&_
				"  M06_IN_EMBARQUE, M06_IN_DT_PREV, M06_IN_DOWNLOAD, M06_IN_EMAIL  , M06_IN_PRINT , "&_
				"  M06_IN_PADRAO  , M06_TP_RELAT  , M06_TP_QUEBRA  , M06_TP_REF_CLI, M06_CD_EVENTO, "&_
                "  M06_CD_EVENTO_2, M06_TP_LIMITADOR_2, M06_TP_LIMITADOR_AUX_2, M06_NR_DIAS_2, "&_
				"  M06_NR_DIAS    , M06_CD_CAMPO  , M06_TP_ORDEM   , M06_IN_DOCTOS, M06_IN_KPI, M06_TP_LIMITADOR, M06_TP_LIMITADOR_AUX, " &_
                "  M06_FREQ_OCORRE_TODOS, M06_FREQ_OCORRE_SEG, M06_FREQ_OCORRE_TER, M06_FREQ_OCORRE_QUA, M06_FREQ_OCORRE_QUI, "&_
                "  M06_FREQ_OCORRE_SEX, M06_FREQ_OCORRE_SAB, M06_FREQ_OCORRE_DOM, M06_HR_FREQ_DIARIA, M06_DIAS_FREQ_OCORRE, M06_CD_ARQUIVO, "&_
                "  M06_CD_GRUPO, M06_CD_CLIENTE, M06_CD_MODAL, M06_CD_UNIDADE, M06_CD_AREA, M06_CD_CELULA, M06_CD_TRANSP, M06_CD_ARMADOR, M06_CD_IMPORTADOR "&_	                
				"FROM M06_VIEW ( NOLOCK ) " &_
				"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		cd_menu      = objrs.Fields.Item("M06_CD_MENU").Value
		cd_subm      = objrs.Fields.Item("M06_CD_SUBM").Value
		cd_user      = objrs.Fields.Item("M06_CD_USUARIO").Value
		cd_view      = objrs.Fields.Item("M06_CD_VIEW").Value
		nm_view      = objrs.Fields.Item("M06_NM_VIEW").Value
		in_embarque  = objrs.Fields.Item("M06_IN_EMBARQUE").Value
		in_dt_prev   = objrs.Fields.Item("M06_IN_DT_PREV").Value
		in_download  = objrs.Fields.Item("M06_IN_DOWNLOAD").Value
		in_email     = objrs.Fields.Item("M06_IN_EMAIL").Value
		in_print     = objrs.Fields.Item("M06_IN_PRINT").Value
		in_doctos    = objrs.Fields.Item("M06_IN_DOCTOS").Value
		in_padrao    = objrs.Fields.Item("M06_IN_PADRAO").Value
		tp_relat     = objrs.Fields.Item("M06_TP_RELAT").Value
		tp_quebra    = objrs.Fields.Item("M06_TP_QUEBRA").Value
		tp_ref_cli   = objrs.Fields.Item("M06_TP_REF_CLI").Value
		cd_evento    = objrs.Fields.Item("M06_CD_EVENTO").Value
        cd_evento_2  = objrs.Fields.Item("M06_CD_EVENTO_2").Value
		nr_dias      = objrs.Fields.Item("M06_NR_DIAS").Value
        nr_dias_2    = objrs.Fields.Item("M06_NR_DIAS_2").Value
		opcao_kpi    = objrs.Fields.Item("M06_IN_KPI").Value
		tp_limitador = objrs.Fields.Item("M06_TP_LIMITADOR").Value
        tp_limitador_2 = objrs.Fields.Item("M06_TP_LIMITADOR_2").Value
        tp_limitador_aux = objrs.Fields.Item("M06_TP_LIMITADOR_AUX").Value
        tp_limitador_aux_2 = objrs.Fields.Item("M06_TP_LIMITADOR_AUX_2").Value
        hr_freq_ocorre  = objrs.Fields.Item("M06_HR_FREQ_DIARIA").Value
        freq_ocorre_todos  = objrs.Fields.Item("M06_FREQ_OCORRE_TODOS").Value
        freq_ocorre_seg  = objrs.Fields.Item("M06_FREQ_OCORRE_SEG").Value
        freq_ocorre_ter  = objrs.Fields.Item("M06_FREQ_OCORRE_TER").Value
        freq_ocorre_qua  = objrs.Fields.Item("M06_FREQ_OCORRE_QUA").Value
        freq_ocorre_qui  = objrs.Fields.Item("M06_FREQ_OCORRE_QUI").Value
        freq_ocorre_sex  = objrs.Fields.Item("M06_FREQ_OCORRE_SEX").Value
        freq_ocorre_sab  = objrs.Fields.Item("M06_FREQ_OCORRE_SAB").Value
        freq_ocorre_dom  = objrs.Fields.Item("M06_FREQ_OCORRE_DOM").Value
        dias_freq_ocorre  = objrs.Fields.Item("M06_DIAS_FREQ_OCORRE").Value
        cd_grupo_view   = objrs.Fields.Item("M06_CD_GRUPO").Value
        cd_cliente_view = objrs.Fields.Item("M06_CD_CLIENTE").Value
        cd_modal_view   = objrs.Fields.Item("M06_CD_MODAL").Value
        cd_unid_view    = objrs.Fields.Item("M06_CD_UNIDADE").Value
        cd_area_view    = objrs.Fields.Item("M06_CD_AREA").Value
        cd_celula_view    = objrs.Fields.Item("M06_CD_CELULA").Value
        cd_transp_view    = objrs.Fields.Item("M06_CD_TRANSP").Value
        cd_armador_view   = objrs.Fields.Item("M06_CD_ARMADOR").Value
        cd_importador_view   = objrs.Fields.Item("M06_CD_IMPORTADOR").Value
        cd_ordenacao_view = objrs.Fields.Item("M06_CD_CAMPO").Value
        tp_ordenacao_view = objrs.Fields.Item("M06_TP_ORDEM").Value
        cd_grupo_view_aux = cd_grupo_view
        cd_cliente_view_aux = cd_cliente_view
        cd_modal_view_aux = cd_modal_view
        cd_unid_view_aux = cd_unid_view
        cd_area_view_aux = cd_area_view
        cd_celula_view_aux = cd_celula_view
        cd_transp_view_aux = cd_transp_view
        cd_armador_view_aux = cd_armador_view
        cd_importador_view_aux = cd_importador_view

        If fnc_TestaVar(cd_grupo_view)   Then 
          in_cd_grupo_view   = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_grupo_view = 0 
        End If

        If fnc_TestaVar(cd_cliente_view) Then 
          in_cd_cliente_view = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_cliente_view = 0
        End If

        If fnc_TestaVar(cd_modal_view)   Then 
          in_cd_modal_view   = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_modal_view = 0
        End If

        If fnc_TestaVar(cd_unid_view)    Then 
          in_cd_unid_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_unid_view = 0
        End If

        If fnc_TestaVar(cd_area_view)    Then 
          in_cd_area_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_area_view = 0
        End If

        If fnc_TestaVar(cd_celula_view)    Then 
          in_cd_celula_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_celula_view = 0
        End If

        If fnc_TestaVar(cd_transp_view)    Then 
          in_cd_transp_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_transp_view = 0
        End If

        If fnc_TestaVar(cd_armador_view)    Then 
          in_cd_armador_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_armador_view = 0
        End If

        If fnc_TestaVar(cd_importador_view)    Then 
          in_cd_importador_view    = 1 
          quantidade_campos = quantidade_campos + 2
          quantidade_file   = quantidade_file + 1
        Else 
          in_cd_importador_view = 0
        End If

        If fnc_TestaVar(objrs.Fields.Item("M06_CD_ARQUIVO").Value) Then
            contador_arquivos = UBound(Split(objrs.Fields.Item("M06_CD_ARQUIVO").Value, ";"))
        Else
            contador_arquivos = 0
        End If
		cd_ordem     = Null
		tp_ordem     = 0
	Else
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n - "& tx_lang_004016(cd_lang) &"."

		Response.Redirect("?in_acao=novo&tx_erro="& Server.URLEncode(tx_erro))
		Response.End()
	End If
	objrs.Close
End If
'alterar dados da personalização
If in_acao = "alterar" Then
	cd_user      = Request.Form("cd_user")
	cd_view      = Request.Form("cd_view")
	nm_view      = Request.Form("nm_view")
	in_embarque  = Request.Form("in_embarque")
	in_dt_prev   = Request.Form("in_dt_prev")
	in_download  = Request.Form("in_download")
	in_email     = Request.Form("in_email")
	in_print     = Request.Form("in_print")
	in_doctos    = Request.Form("in_doctos")
	in_padrao    = Request.Form("in_padrao")
	tp_relat     = Request.Form("tp_relat")
	tp_quebra    = Request.Form("tp_quebra")
	tp_ref_cli   = Request.Form("tp_ref_cli")
	cd_evento    = Request.Form("cd_evento")
    cd_evento_2  = Request.Form("cd_evento_2")
	nr_dias      = Request.Form("nr_dias")
    nr_dias_2    = Request.Form("nr_dias_2")
	opcao_kpi    = Request.Form("opcao_kpi")
	tp_limitador = Request.Form("tp_limitador")
    tp_limitador_2 = Request.Form("tp_limitador_2")
    tp_limitador_aux = Request.Form("tp_limitador_aux")
    tp_limitador_aux_2 = Request.Form("tp_limitador_aux_2")
    freq_ocorre_todos = Request.Form("freq_ocorre_todos")
    freq_ocorre_seg  = Request.Form("freq_ocorre_seg")
    freq_ocorre_ter  = Request.Form("freq_ocorre_ter")
    freq_ocorre_qua  = Request.Form("freq_ocorre_qua")
    freq_ocorre_qui  = Request.Form("freq_ocorre_qui")
    freq_ocorre_sex  = Request.Form("freq_ocorre_sex")
    freq_ocorre_sab  = Request.Form("freq_ocorre_sab")
    freq_ocorre_dom  = Request.Form("freq_ocorre_dom")
    hr_freq_ocorre = Request.Form("hr_freq_ocorre")
    dias_freq_ocorre = Request.Form("dias_freq_ocorre")
    cd_grupo_view   = Request.Form("cd_grupo_view")
    cd_cliente_view = Request.Form("cd_cliente_view")
    cd_modal_view   = Request.Form("cd_modal_view")
    cd_unid_view    = Request.Form("cd_unid_view")
    cd_area_view    = Request.Form("cd_area_view")
    cd_celula_view    = Request.Form("cd_celula_view")
    cd_transp_view    = Request.Form("cd_transp_view")
    cd_armador_view   = Request.Form("cd_armador_view")
    cd_importador_view  = Request.Form("cd_importador_view")
    cd_ordenacao_view = Request.Form("cd_ordenacao_view")
    tp_ordenacao_view = Request.Form("tp_ordenacao_view")
    cd_grupo_view_aux = cd_grupo_view
    cd_cliente_view_aux = cd_cliente_view
    cd_modal_view_aux = cd_modal_view
    cd_unid_view_aux = cd_unid_view
    cd_area_view_aux = cd_area_view
    cd_celula_view_aux = cd_celula_view
    cd_transp_view_aux = cd_transp_view
    cd_armador_view_aux = cd_armador_view
    cd_importador_view_aux = cd_importador_view

    If fnc_TestaVar(cd_grupo_view)   Then 
      in_cd_grupo_view   = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_grupo_view = 0 
    End If

    If fnc_TestaVar(cd_cliente_view) Then 
      in_cd_cliente_view = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_cliente_view = 0
    End If

    If fnc_TestaVar(cd_modal_view)   Then 
      in_cd_modal_view   = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_modal_view = 0
    End If

    If fnc_TestaVar(cd_unid_view)    Then 
      in_cd_unid_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_unid_view = 0
    End If

    If fnc_TestaVar(cd_area_view)    Then 
      in_cd_area_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_area_view = 0
    End If

    If fnc_TestaVar(cd_celula_view)    Then 
      in_cd_celula_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_celula_view = 0
    End If
    
    If fnc_TestaVar(cd_transp_view)    Then 
      in_cd_transp_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_transp_view = 0
    End If

    If fnc_TestaVar(cd_armador_view)    Then 
      in_cd_armador_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_armador_view = 0
    End If

    If fnc_TestaVar(cd_importador_view)    Then 
      in_cd_importador_view    = 1 
      quantidade_campos = quantidade_campos + 2
      quantidade_file   = quantidade_file + 1
    Else 
      in_cd_importador_view = 0
    End If

	cd_ordem     = Null
	tp_ordem     = 0
	array_filtro = Request("cd_filtro")
	array_campo  = Request("cd_campo")
	nm_tela = tx_lang_004004(cd_lang) &" "& nm_tela
	in_tipo = "alterar"
	
	'verifica se ocorreram erros de preenchimento
	tx_erro = ""
	If Not fnc_TestaVar(cd_menu) Then tx_erro = tx_erro &"\n- "& tx_lang_004006(cd_lang) &";"
	If Not fnc_TestaVar(cd_subm) Then tx_erro = tx_erro &"\n- "& tx_lang_004007(cd_lang) &";"
	If Not fnc_TestaVar(cd_user) Then tx_erro = tx_erro &"\n- "& tx_lang_004008(cd_lang) &";"
	If Not fnc_TestaVar(cd_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004009(cd_lang) &";"
	If Not fnc_TestaVar(nm_view) Then tx_erro = tx_erro &"\n- "& tx_lang_004010(cd_lang) &";"	
	'se acontecerem erros informa o usuário
	If Len(tx_erro) > 0 Then
		tx_erro = tx_lang_A00002(cd_lang) &":"& tx_lang_A00003 &"\n"& tx_erro &"\n"&_
							tx_lang_004013(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
	Else
		'coloca o valor padrão nas variaveis numéricas
		If Not fnc_TestaVar(in_embarque) Then in_embarque  = 1
		If Not fnc_TestaVar(in_dt_prev)  Then in_dt_prev   = 0
		If Not fnc_TestaVar(in_download) Then in_download  = 0
		If Not fnc_TestaVar(in_email)    Then in_email     = 0
		If Not fnc_TestaVar(in_print)    Then in_print     = 0
		If Not fnc_TestaVar(in_doctos)   Then in_doctos    = 0
		If Not fnc_TestaVar(in_padrao)   Then in_padrao    = 0
		If Not fnc_TestaVar(tp_relat)    Then tp_relat     = 2
		'If Not fnc_TestaVar(tp_quebra)   Then tp_quebra    = "2"
		'If Not fnc_TestaVar(tp_ref_cli)  Then tp_ref_cli   = "01"
		if not fnc_TestaVar(cd_evento)   then cd_evento    = null
        if not fnc_TestaVar(cd_evento_2) then cd_evento_2  = null
		If Not fnc_TestaVar(nr_dias)     Then nr_dias      = Null
        If Not fnc_TestaVar(nr_dias_2)   Then nr_dias_2    = Null
        If Not fnc_TestaVar(cd_grupo_view)   Then cd_grupo_view = Null
        If Not fnc_TestaVar(cd_cliente_view) Then cd_cliente_view = Null
        If Not fnc_TestaVar(cd_modal_view)   Then cd_modal_view = Null
        If Not fnc_TestaVar(cd_unid_view)    Then cd_unid_view = Null
        If Not fnc_TestaVar(cd_area_view)    Then cd_area_view = Null
        If Not fnc_TestaVar(cd_celula_view)    Then cd_celula_view = Null
        If Not fnc_TestaVar(cd_transp_view)    Then cd_transp_view = Null
        If Not fnc_TestaVar(cd_armador_view)   Then cd_armador_view = Null
        If Not fnc_TestaVar(cd_importador_view)  Then cd_importador_view = Null
        If Not fnc_TestaVar(cd_ordenacao_view) Then cd_ordenacao_view = Null
        If Not fnc_TestaVar(tp_ordenacao_view) Then tp_ordenacao_view = Null
        If Not fnc_TestaVar(hr_freq_ocorre)    Then hr_freq_ocorre    = NULL
        If Not fnc_TestaVar(dias_freq_ocorre)  Then dias_freq_ocorre  = NULL
        If Not fnc_TestaVar(freq_ocorre_todos) Then freq_ocorre_todos = 0
        If Not fnc_TestaVar(freq_ocorre_seg)   Then freq_ocorre_seg   = 0
        If Not fnc_TestaVar(freq_ocorre_ter)   Then freq_ocorre_ter   = 0
        If Not fnc_TestaVar(freq_ocorre_qua)   Then freq_ocorre_qua   = 0
        If Not fnc_TestaVar(freq_ocorre_qui)   Then freq_ocorre_qui   = 0
		If Not fnc_TestaVar(freq_ocorre_sex)   Then freq_ocorre_sex   = 0
        If Not fnc_TestaVar(freq_ocorre_sab)   Then freq_ocorre_sab   = 0
        If Not fnc_TestaVar(freq_ocorre_dom)   Then freq_ocorre_dom   = 0
        
		in_print = 1
		in_download = 1

        If objrsx.State = adStateOpen Then objrsx.Close	
        sql = "SELECT COUNT(M06.M06_CD_VIEW) AS CONTADOR_OUTROS "&_
        " FROM M06_VIEW M06"&_
        " INNER JOIN M19_VIEW_HORARIO M19 ON M19.M19_CD_VIEW = M06.M06_CD_VIEW "&_
        " WHERE M06.M06_CD_USUARIO = '" & Session("cd_usuario") & "'"&_ 
        "  AND M06.M06_CD_SUBM = '03'"&_
        "  AND M06.M06_CD_MENU IN('01', '02') "&_
        "  AND M06.M06_CD_VIEW <> '" & cd_view & "'"&_
        "  AND (M06.M06_FREQ_OCORRE_TODOS = 1 "
        
        If freq_ocorre_seg <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SEG = 1 "
        If freq_ocorre_ter <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_TER = 1 "
        If freq_ocorre_qua <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_QUA = 1 "
        If freq_ocorre_qui <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_QUI = 1 "
        If freq_ocorre_sex <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SEX = 1 "
        If freq_ocorre_sab <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_SAB = 1 "
        If freq_ocorre_dom <> 0 Then sql = sql & "     OR M06.M06_FREQ_OCORRE_DOM = 1 "

        if fnc_TestaVar(dias_freq_ocorre) Then
            dias_freq_ocorre_array = Split(dias_freq_ocorre, ";")
            For I = 0 To UBound(dias_freq_ocorre_array)
                if fnc_TestaVar(dias_freq_ocorre_array(I)) Then
                    sql = sql & " OR (CHARINDEX(RIGHT('00' + '" & dias_freq_ocorre_array(I) & "', 2), M06.M06_DIAS_FREQ_OCORRE) > 0 " &_
                    "  OR CHARINDEX(';' + '" & dias_freq_ocorre_array(I) & "' + ';', ';' + M06.M06_DIAS_FREQ_OCORRE + ';') > 0) " 
                End If        
            Next
        End If
        sql = sql & " )"
        
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        contador_outros = objrsx("CONTADOR_OUTROS")

        If objrsx.State = adStateOpen Then objrsx.Close	
        sql = "SELECT COUNT(CD_VIEW) AS CONTADOR_RELATORIO "&_ 
        " FROM FN_TMP_ALERTAS_WEB('" & cd_view & "', '" & cd_menu & "', '03', '" & Session("cd_usuario")& "', "&_
        " " & fnc_QuotedSQL(hr_freq_ocorre) & ", " & fnc_QuotedSQL(freq_ocorre_todos) & ", " & fnc_QuotedSQL(freq_ocorre_seg)  & "," & fnc_QuotedSQL(freq_ocorre_ter)  & ", "&_
        " " & fnc_QuotedSQL(freq_ocorre_qua)  & ", " & fnc_QuotedSQL(freq_ocorre_qui)  & " , " & fnc_QuotedSQL(freq_ocorre_sex)  & " , " & fnc_QuotedSQL(freq_ocorre_sab)  & ", "&_
        " " & fnc_QuotedSQL(freq_ocorre_dom)  & ", " & fnc_QuotedSQL(dias_freq_ocorre) & ")"&_
        " WHERE CD_VIEW = '" & cd_view & "'"                              
        objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
        contador_relatorio = objrsx("CONTADOR_RELATORIO")
         
        If CInt(contador_outros) + CInt(contador_relatorio) > 15 Then
            tx_erro = "ATENÇÃO: Máximo de 15 relatórios para o mesmo dia!"
            Response.Redirect("?in_acao=editar&cd_view=" & cd_view & "&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
		    Response.End()
        End If
		
        'monta o select para inclusão da personalização
		sql = "UPDATE M06_VIEW SET " &_
					"  M06_NM_VIEW      = "& fnc_QuotedSQL(nm_view) &", "&_
					"  M06_IN_EMBARQUE  = "& in_embarque &", "&_
					"  M06_IN_DT_PREV   = "& in_dt_prev  &", "&_
					"  M06_IN_DOWNLOAD  = "& in_download &", "&_
					"  M06_IN_EMAIL     = "& in_email    &", "&_
					"  M06_IN_PRINT     = "& in_print    &", "&_
					"  M06_IN_DOCTOS    = "& in_doctos   &", "&_
					"  M06_IN_PADRAO    = "& in_padrao   &", "&_
					"  M06_TP_RELAT     = "& fnc_QuotedSQL(tp_relat)   &", "&_
					"  M06_TP_QUEBRA    = "& fnc_QuotedSQL(tp_quebra)  &", "&_
					"  M06_TP_REF_CLI   = "& fnc_QuotedSQL(tp_ref_cli) &", "&_
					"  M06_CD_EVENTO    = "& fnc_QuotedSQL(cd_evento)  &", "&_
                    "  M06_CD_EVENTO_2  = "& fnc_QuotedSQL(cd_evento_2) &", "&_
					"  M06_NR_DIAS      = "& fnc_QuotedSQL(nr_dias)    &", "&_
                    "  M06_NR_DIAS_2    = "& fnc_QuotedSQL(nr_dias_2)  &", "&_
					"  M06_CD_CAMPO     = "& fnc_QuotedSQL(cd_ordenacao_view)   &", "&_
					"  M06_TP_ORDEM     = "& fnc_QuotedSQL(tp_ordenacao_view)   &", "&_
					"  M06_IN_KPI       = "& fnc_QuotedSQL(opcao_kpi)   &",  "&_
					"  M06_TP_LIMITADOR = "& fnc_QuotedSQL(tp_limitador)   &",  "&_
                    "  M06_TP_LIMITADOR_2 = "& fnc_QuotedSQL(tp_limitador_2) &", "&_
                    "  M06_TP_LIMITADOR_AUX = "& fnc_QuotedSQL(tp_limitador_aux)   &",  "&_
                    "  M06_TP_LIMITADOR_AUX_2 = "& fnc_QuotedSQL(tp_limitador_aux_2) &", "&_
                    "  M06_FREQ_OCORRE_TODOS = "& fnc_QuotedSQL(freq_ocorre_todos)   &",  "&_
                    "  M06_FREQ_OCORRE_SEG = "& fnc_QuotedSQL(freq_ocorre_seg)   &",  "&_
                    "  M06_FREQ_OCORRE_TER = "& fnc_QuotedSQL(freq_ocorre_ter)   &",  "&_
                    "  M06_FREQ_OCORRE_QUA = "& fnc_QuotedSQL(freq_ocorre_qua)   &",  "&_
                    "  M06_FREQ_OCORRE_QUI = "& fnc_QuotedSQL(freq_ocorre_qui)   &",  "&_
                    "  M06_FREQ_OCORRE_SEX = "& fnc_QuotedSQL(freq_ocorre_sex)   &",  "&_
                    "  M06_FREQ_OCORRE_SAB = "& fnc_QuotedSQL(freq_ocorre_sab)   &",  "&_
                    "  M06_FREQ_OCORRE_DOM = "& fnc_QuotedSQL(freq_ocorre_dom)   &",  "&_
                    "  M06_HR_FREQ_DIARIA  = "& fnc_QuotedSQL(hr_freq_ocorre)    &",  "&_
                    "  M06_DIAS_FREQ_OCORRE  = "& fnc_QuotedSQL(dias_freq_ocorre)  &",  "&_
                    "  M06_CD_GRUPO  = "& fnc_QuotedSQL(cd_grupo_view)    &",  "&_
                    "  M06_CD_CLIENTE  = "& fnc_QuotedSQL(cd_cliente_view)    &",  "&_
                    "  M06_CD_MODAL  = "& fnc_QuotedSQL(cd_modal_view)    &",  "&_
                    "  M06_CD_UNIDADE  = "& fnc_QuotedSQL(cd_unid_view)    &",  "&_
                    "  M06_CD_AREA  = "& fnc_QuotedSQL(cd_area_view)    &",  "&_
                    "  M06_CD_CELULA  = "& fnc_QuotedSQL(cd_celula_view)    &",  "&_
                    "  M06_CD_TRANSP  = "& fnc_QuotedSQL(cd_transp_view)    &",  "&_
                    "  M06_CD_ARMADOR  = "& fnc_QuotedSQL(cd_armador_view)    &",  "&_
                    "  M06_CD_IMPORTADOR  = "& fnc_QuotedSQL(cd_importador_view)    &"  "&_
					" WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view) 
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
        objcnn.Execute(sql)

        hr_freq_ocorre_array =  Split(hr_freq_ocorre, ";")
        hora_hoje = Hour(data_hoje) & ":" & Minute(data_hoje)

        'DELETA HORARIOS
        sql = "DELETE FROM M19_VIEW_HORARIO WHERE M19_CD_VIEW = "& fnc_QuotedSQL(cd_view)
        objcnn.Execute(sql)
        
        'INSERE HORARIOS  
        For I = 0 To UBound(hr_freq_ocorre_array)
          data_ult_exec = ""
        
          If CDate(hora_hoje) > CDate(hr_freq_ocorre_array(I)) Then
            data_ult_exec = "GETDATE()"
          Else
            data_ult_exec = "GETDATE()-1"
          End If

          sql = "INSERT INTO M19_VIEW_HORARIO (M19_CD_VIEW, M19_NR_ALERTA, M19_HR_ALERTA, M19_DT_ULTIMA_EXEC) "&_
            " VALUES (" & fnc_QuotedSQL(cd_view) & ", " & I + 1 & ", " & fnc_QuotedSQL(hr_freq_ocorre_array(I)) & ", " & data_ult_exec & " ) "
             objcnn.Execute(sql)
        Next

		'verifica se ocorreram erros, se sim, informa usuário

		If Err.Number = 0  Then  '--------------------------------------------------------------MENSAGEM DE ERRO
			if isnull(tp_exibir_Export) then 
			tx_erro = tx_lang_004017(cd_lang) &"!"
			end if
			'Response.Redirect("../IMPORT/teste.asp?var1="&tp_exibir_Export&"")
			'verifica se a nova view é padrão
			'If in_padrao Then
		    '		sql = "UPDATE M06_VIEW SET " &_
			'				"  M06_IN_PADRAO = 0 " &_
			'				"WHERE M06_CD_VIEW   <> "& fnc_QuotedSQL(cd_view) &_
			'				"  AND M06_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
			'				"  AND M06_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
			'				"  AND M06_CD_USUARIO = "& fnc_QuotedSQL(cd_user)
			'	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			'	objcnn.Execute(sql)
			'End If
			
			'Exclui os campos e filtros
			sql = "DELETE FROM M13_VIEW_FILTRO " &_
						"WHERE M13_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			sql = "DELETE FROM M14_VIEW_CAMPO " &_
						"WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)

            sql = "UPDATE M06_VIEW SET M06_CD_ARQUIVO = NULL  WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
			Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
			objcnn.Execute(sql)
			
			'inclui os filtros da personalização
			cont = 1
			num  = 0
			str  = array_filtro
			matriz = Split(str, ",", -1)
			
			Do While cont <> 0 and num <= nr_max_filtro
				cont = InStr(str,",")
			
				If cont <> 0 Then
					sql = "INSERT INTO M13_VIEW_FILTRO ( "&_
								"  M13_CD_VIEW, M13_CD_FILTRO, M13_NR_ORDEM "&_
								" ) " &_
								"VALUES ( "&_
								fnc_QuotedSQL(cd_view) &", "&_
								fnc_QuotedSQL(Left(str, cont - 1)) &", "&_
								UBound(matriz) - num &_
								" )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
			
					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
			
			'inclui os campos da personalização
			cont = 1
			num  = 0
			str  = array_campo
			matriz = Split(str, ",", -1)			
			Do While cont <> 0 and num <= quantidade_campos
				cont = InStr(str,",")
				
				If cont <> 0 Then
                    tp_kpi = "0"
					If Left(Left(str, cont - 1), 3) = "kpi" Then
                      tp_kpi = Right(Left(str, cont - 1), 1)
                    Else
                      tp_kpi = "0"
                    End If

					If tp_kpi = "2" Then
                      sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					    "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					    ") " &_
					    "VALUES ( "&_
				        fnc_QuotedSQL(cd_view) &", "&_
					    fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					    UBound(matriz) - num  &_
					    ", " & fnc_QuotedSQL("0") &  ", " & fnc_QuotedSQL("2") &  " )"
					  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					  objcnn.Execute(sql)
                      
                      sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					    "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					    ") " &_
					    "VALUES ( "&_
				        fnc_QuotedSQL(cd_view) &", "&_
					    fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					    UBound(matriz) - num  &_
					    ", " & fnc_QuotedSQL("1") &  ", " & fnc_QuotedSQL("2") &  " )"
					  Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					  objcnn.Execute(sql)
                    Else
					if Left(Left(str, cont - 1), 12) <> "" Then
					sql = "INSERT INTO M14_VIEW_CAMPO ( "&_
					  "  M14_CD_VIEW, M14_CD_CAMPO, M14_NR_ORDEM, M14_TP_KPI, M14_TP_KPI_AUX "&_
					  ") " &_
					  "VALUES ( "&_
				      fnc_QuotedSQL(cd_view) &", "&_
					  fnc_QuotedSQL(Left(Left(str, cont - 1), 12)) &", "&_
					  UBound(matriz) - num  &_
					 ", " & fnc_QuotedSQL(tp_kpi) &  ", " & fnc_QuotedSQL(tp_kpi) &  " )"
					Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
					objcnn.Execute(sql)
                    End If
					End If
					
                    if Left(Left(str, cont - 1), 3) = "arq" Then
					    sql = "UPDATE M06_VIEW SET M06_CD_ARQUIVO = ISNULL(M06_CD_ARQUIVO, '') + '" & CInt(Right(Trim(Left(str, cont - 1)),4)) & ";' WHERE M06_CD_VIEW = '" & cd_view & "'"
                        'Response.write sql
                        'Response.end
					    objcnn.Execute(sql)
                    End If

					num = num + 1
					str = Right(str, Len(str) - cont)
				End If
			Loop
		Else
			tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
								tx_lang_004018(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		End If
	End If
End If
'exclui uma personalização
If in_acao = "excluir" Then
	cd_view = CStr(Request("cd_view"))
	
	If Trim(cd_view) = "" Then
		tx_erro = tx_lang_A00002(cd_lang) &":\n\n"&_
							tx_lang_004019(cd_lang) &".\n"& tx_lang_A00004 &"( suporte@myindaia.com.br )."
		Response.Redirect("?in_acao=editar&cd_view="& cd_view &"&tx_erro="& Server.URLEncode(tx_erro))
	Else		
		'apaga os registros da tabela view_filtro
		sql = "DELETE FROM M13_VIEW_FILTRO " &_
					"WHERE M13_CD_VIEW = "& fnc_QuotedSQL(cd_view)
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		'apaga os registros da tabela view_campo
		sql = "DELETE FROM M14_VIEW_CAMPO " &_
					"WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view)
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		'apaga a view selecionanda 
		sql = "DELETE FROM M06_VIEW " &_
					"WHERE M06_CD_VIEW = "& fnc_QuotedSQL(cd_view)
		Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
		objcnn.Execute(sql)
		tx_erro = tx_lang_004020(cd_lang) &"."
		Response.Redirect("?in_acao=novo&cd_menu="& cd_menu &"&cd_subm="& cd_subm &"&tx_erro="& Server.URLEncode(tx_erro))
	End If
End If
'vdata = color: #0000FF
%>
<html>
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type="text/css">
.vtxt {
	color: #000000;
}
.vdata {
	color: #0066cc;
}

.kpi {
	color: #CAA637;
}

.style2 {color: #0066cc}

.edtLabel {
    background-color:transparent;
	border: 0;
	color: #0066cc
}
</style>
<script language="javascript" type="text/javascript">
<!--
function ExcluiRelatorio(){
  if (confirm('Deseja realmente excluir o relatório selecionado?')){
    document.location='?in_acao=excluir&cd_view=<%= cd_view%>&cd_menu=<%= cd_menu%>&cd_subm=<%= cd_subm%>';
  }
}

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div_info = document.getElementById(vDiv1);
		var div_info_corpo = document.getElementById(vDiv2);
		var div_info_rodape = document.getElementById(vDiv3);
		var div_frame = document.getElementById('divFrame');
		div_info.style.display = "none";
		div_info_corpo.style.display = "none";
		div_info_rodape.style.display = "none";
		div_frame.style.visibility = "hidden";
	}	
}

function ExibeDetalhes(vDiv, vDiv2, vDiv3, tipo) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;	
		
		var w = 500;
		var z = 300;
		var div_info = document.getElementById(vDiv); 
		var div_info_corpo = document.getElementById(vDiv2); 
		var div_info_rodape = document.getElementById(vDiv3); 
		var div_frame = document.getElementById('divFrame');
		
				
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		var x1 = ((x-250)-w)/2;
		var x2 = Math.round(x1);
		//alert(div_info.style.width);
		//alert(x);//1280
		//alert(y);//1024
		div_frame.style.width = w;
		div_frame.style.height = z;
		div_frame.style.left = (x2);
		div_frame.style.top = ((y4)/2)-26;
		div_frame.style.visibility = "visible";
		div_frame.style.filter= "alpha(opacity=0)";
		
		
		div_info.style.width = w;
		div_info.style.height = 26;
		div_info.style.left = (x2);
		div_info.style.top = ((y4)/2)-26;
		div_info.style.display = "block";
		div_info.style.filter= "alpha(opacity=92)";
		
		div_info_corpo.style.width = w;
		div_info_corpo.style.height = z;
		div_info_corpo.style.left = (x2);
		div_info_corpo.style.top = ((y4)/2)-2;
		div_info_corpo.style.display = "block";
		div_info_corpo.style.filter= "alpha(opacity=91)";
		
		div_info_rodape.style.width = w;
		div_info_rodape.style.height = 26;
		div_info_rodape.style.left = (x2);
		div_info_rodape.style.top = ((y4)/2)+298;
		div_info_rodape.style.display = "block";
		div_info_rodape.style.filter= "alpha(opacity=92)";
	}
}

function clickKpi(objeto){
	var div_kpi = document.getElementById('divKpiSelecionado');
	var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
	var contador_kpi = document.getElementById('contador_kpi').value;
	var kpi_selecionado = document.getElementById('kpi_selecionado');
	var kpi_id_selecionado = document.getElementById('kpi_id_selecionado');
	var kpi_codigo_selecionado = document.getElementById('kpi_codigo_selecionado');
	var contador_total_kpi = document.getElementById('contador_total_kpi').value;
	var contador_total_kpi_aux = document.getElementById('contador_total_kpi_aux').value;
	var codigo_kpi = eval("document.getElementById('kpi_codigo"+ objeto.id +"').value");
	
	
	if (objeto.checked){
		contador_kpi++;
	}else{
		contador_kpi--;
		document.getElementById('kpi_selecionado').value = "";
		document.getElementById('kpi_id_selecionado').value = "";
		document.getElementById('kpi_codigo_selecionado').value = "";
	}

	document.getElementById('contador_kpi').value = contador_kpi;
	if (document.getElementById('contador_kpi').value < 2){
		kpi_selecionado.value = objeto.value;
		kpi_id_selecionado.value = objeto.id;
		kpi_codigo_selecionado.value = codigo_kpi;
	}	
	if (document.getElementById('contador_kpi').value == 2){
		contador_total_kpi++;
		contador_total_kpi_aux++;
		document.getElementById('contador_total_kpi').value = contador_total_kpi;
		document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
		div_kpi_nao.style.display = 'none';
		div_kpi.style.display = 'block';
		
		if (!eval("document.getElementById('flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi +"')")){
		var texto_kpi = "<div id='kpi"+ document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi +"'><input type='text' style='display:none' value='0' id='tipo_kpi"+ contador_total_kpi +"'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi"+ contador_total_kpi +"_tp1' onclick='alteraCheckKPI(this);' checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='tipo_kpi"+ contador_total_kpi +"_tp2' onclick='alteraCheckKPI(this);'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:retiraKpi(\"" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "\");'><img src='/imagens/30/btn_delete.gif' border='0' style='vertical-align:absmiddle;'></a>&nbsp;&nbsp;<input type='text' style='display:none' name='codigo_kpi"+ contador_total_kpi +"' id='codigo_kpi"+ contador_total_kpi +"' value='kpi" + document.getElementById('kpi_codigo_selecionado').value + "_" + codigo_kpi + "'><input type='text' style='display:none' name='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' id='flag_kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' value='kpi" + document.getElementById('kpi_codigo_selecionado').value +"_"+ codigo_kpi + "' ><input type='text' style='display:none' name='texto_kpi" + contador_total_kpi + "' id='texto_kpi" + contador_total_kpi + "' value='(KPI) " + document.getElementById('kpi_selecionado').value + " x " + objeto.value + "' >" + document.getElementById('kpi_selecionado').value + " x " + objeto.value + "<br></div>";
		div_kpi.innerHTML += texto_kpi;
		}else{
		contador_total_kpi--;
		contador_total_kpi_aux--;
		document.getElementById('contador_total_kpi').value = contador_total_kpi;
		document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
		}
		document.getElementById('kpi_selecionado').value = "";
		document.getElementById('kpi_id_selecionado').value = "";
		document.getElementById('kpi_codigo_selecionado').value = "";
		document.getElementById('contador_kpi').value = 0;
		var total_kpi = document.all.kpi.length;
		for (i=0; i< total_kpi;i++){	
			if (document.all.kpi[i].checked){
				document.all.kpi[i].checked = false;
			}
		}	
	}
}

function retiraKpi(kpi){
	var texto = eval("document.all.flag_kpi" + kpi + ".value;");
	for (j = 0; j <= document.frmview.array_campo.length-1; j++){
		if (texto == document.frmview.array_campo.options[j].value){
		document.frmview.array_campo.remove(j);
		break;
		}
	}
	
	var div_kpi = document.getElementById('divKpiSelecionado');
	var div_kpi_nao = document.getElementById('divKpiSelecionadoNao');
   	var linha_texto = eval("document.getElementById('kpi"+ kpi+"');");
   	var removido_texto = div_kpi.removeChild(linha_texto);  
	var contador_total_kpi_aux = document.getElementById('contador_total_kpi_aux').value;
	contador_total_kpi_aux--;
	document.getElementById('contador_total_kpi_aux').value = contador_total_kpi_aux;
	
	if (document.getElementById('contador_total_kpi_aux').value == 0){
		div_kpi.style.display = 'none';
		div_kpi_nao.style.display = 'block';
	}		
}

function confirmaKpi(){
	FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');
	var total = document.getElementById('contador_total_kpi').value;
	
	for (i = 1; i <= total; i++) {
		if (eval("document.getElementById('codigo_kpi" + i +"')")){
			var valor  = eval("document.all.codigo_kpi" + i + ".value;");
			var texto  = eval("document.all.texto_kpi" + i + ".value;");
            var tipo  = eval("document.all.tipo_kpi" + i + ".value;");
            valor = valor + "_" + tipo;
			var confere = 0;
			for (j = 0; j <= document.frmview.array_campo.length-1; j++){
				if (texto == document.frmview.array_campo.options[j].text){
				confere = 1;
				break;
				}
			}
			if (confere == 0){
				document.frmview.array_campo.options[document.frmview.array_campo.length] = new Option(texto, valor);
				document.frmview.array_campo.options[document.frmview.array_campo.length-1].style.color = "#CAA637";
			}
		}
	}
}

function mudaOpcaoKpi(objeto){
	if (objeto.checked){
		document.getElementById('opcao_kpi2').value = "1";
		document.frmview.opcao_kpi.value = "1";
	}else{
		document.getElementById('opcao_kpi2').value = "0";
		document.frmview.opcao_kpi.value = "0";
	}
}

function getValidDate(Q) { var d, m, D, U // y!=0
	if ((D = /^(3[0-1]|[0-2]\d)\/(0\d|1[0-2])\/(\d{4})$/.exec(Q)) != null) {
		with (D = new Date(D[3], m=(D[2]-1), d=D[1]))
		if (getMonth()==m && getDate()==d) return D
		return U 
	}
}


function VerifyFormView(form) {
	var valida = true;
	//Titulo do Modelo
	if (form.nm_view.value == '') {
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004022(cd_lang) &".');")%>
		document.frmview.nm_view.focus();
		valida = false;      
	}
	//Evento de alerta
	if ((form.cd_menu.value=='01' || form.cd_menu.value=='02') && form.cd_subm.value=='03') {
		if (form.cd_evento.options[form.cd_evento.selectedIndex].value=='') {
			<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004023(cd_lang) &".');")%>
			//document.frmview.filtro.focus();
			valida = false;
		}
	}

	//Campos
	if (form.array_campo.length == 0){
		<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n"& tx_lang_004012(cd_lang) &".');")%>
		document.frmview.campo.focus();
		valida = false;
	} else {
		if (form.array_campo.length > document.getElementById('quantidade_campos').value) {
			<%= Response.Write("alert('"& tx_lang_A00002(cd_lang) &":\n\n "& tx_lang_004024(cd_lang) &" "& nr_max_campo &" "& tx_lang_A00016(cd_lang) &".\n"& tx_lang_004026(cd_lang) &".');")%>
			document.frmview.array_campo.focus();
			valida = false;
		}
	}

	return valida;
}


function combo_altera(origem, destino, todos) {   
    var ordenacao = document.getElementById('cd_ordenacao_view'); 
    if (destino.length >= parseInt(document.getElementById('quantidade_campos').value) && destino.name == 'array_campo'){
        var erro = '<%=tx_lang_TF046(cd_lang)%>' + document.getElementById('quantidade_campos').value + ' <%=tx_lang_A00016(cd_lang)%>';  
        alert(erro);
        return false;
    }

	if (todos == true) {
		//se for todos os registros
		for (var c = 0; c <= origem.length -1; c++) {
			var valor = origem.options[c].value;
			var item  = origem.options[c].text;
			var cor   = origem.options[c].style.color;
			destino.options[destino.length] = new Option(item, valor);
			destino.options[destino.length-1].style.color = cor;
		}
		origem.length = 0;
	} else {
		//se for um registro só
		var sel = origem.selectedIndex;
		if (sel >= 0) { 
			//pega os dados do registro selecionado na orgiem
			var valor = origem.options[origem.selectedIndex].value;
			var item  = origem.options[origem.selectedIndex].text;
			var cor   = origem.options[origem.selectedIndex].style.color;

            if (Left(valor, 3) == "arq"){
                if (destino.name == 'array_campo'){                 
                    if (parseInt(document.getElementById("contador_file").value) == parseInt(document.getElementById("quantidade_file").value)){
                        var erro = '<%=tx_lang_004084(cd_lang)%>' + document.getElementById("quantidade_file").value + ' <%=tx_lang_A00082(cd_lang)%>!';
                        alert(erro);                      
                        return false;
                    }
                    if (parseInt(document.getElementById("contador_file").value) < parseInt(document.getElementById("quantidade_file").value)){ 
                        document.getElementById("contador_file").value = parseInt(document.getElementById("contador_file").value) + 1;
                    }
                }else{
                    document.getElementById("contador_file").value = parseInt(document.getElementById("contador_file").value) - 1;
                }
            }

			//inclui o registro no destino
			destino.options[destino.length] = new Option(item, valor);
			destino.options[destino.length-1].style.color = cor;

            if (destino.name == 'array_campo'){
              var ajax = openAjax();
		      //usado o GET para que se possa usar filtros querystring
		      ajax.open("POST","/popup/verifica_campos.asp?campo=" + valor + "&menu=<%=cd_menu%>", true); 
		      ajax.onreadystatechange = function() {
			      if(ajax.readyState == 4) { //agora exibe o que interessa
			        if(ajax.status == 200) {
		  		      var vResult = ajax.responseText; //resultado da busca
				      vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
				      vResult = unescape(vResult); //continua resolvendo problemas de acento
				      if (vResult != '0'){ordenacao.options[ordenacao.options.length] = new Option (item, vResult);}
			        }
			      }
		      }
		      ajax.send(null); // submete
            }else{
                for (var i = 0; i <= ordenacao.length - 1; i++){
                  if (ordenacao.options[i].value == valor){ordenacao.remove(i);}
                }
            } 
                       
			//tira o registro da origem
			for (var c = 0; c <= origem.length - 2; c++) {
				if (c >= sel) {
					origem.options[c].value = origem.options[c + 1].value;
					origem.options[c].text  = origem.options[c + 1].text;
					origem.options[c].style.color  = origem.options[c + 1].style.color;  
				}
			}
			origem.length = origem.length - 1;
		}
	}
	//altera a qtde de filtros/campos utilizados
	//document.frmview.qtd_filtro.value = '[' + document.frmview.array_filtro.length + ']';
	document.frmview.qtd_campo.value  = '[' + document.frmview.array_campo.length  + ']';
}

function combo_valor(campo, valor) {
  valor.value = "";
  for (var c = 0; c < campo.length; c++) {
    valor.value = campo.options[c].value + "," + valor.value; 
  }
}

function rElemento(objeto){
    return document.getElementById(objeto);
}

function movimenta(tipo,combo) {    
    var elemento = rElemento(combo);
    var item_list = elemento.selectedIndex;
    
    if (item_list == -1){
        alert("Primeiramente, selecione um campo.");
    }else {
        var item_old_val = elemento[item_list].value;
        var item_old_txt = elemento[item_list].text;
        var item_old_cor = elemento[item_list].style.color;
		
        var novo_item_list = item_list + (tipo? -1 : 1);
    
        if (novo_item_list >= 0 && novo_item_list <= elemento.length-1){
            elemento.selectedIndex = 0
            elemento[item_list].value = elemento[novo_item_list].value
            elemento[item_list].text = elemento[novo_item_list].text
			elemento[item_list].style.color = elemento[novo_item_list].style.color
            elemento[novo_item_list].value = item_old_val
			elemento[novo_item_list].text = item_old_txt
			elemento[novo_item_list].style.color = item_old_cor
			elemento.selectedIndex = novo_item_list
        }else{
			elemento.selectedIndex = item_list
		}        
    }
}

function fnc_Processo(campo) {
	if(campo.checked) {
		document.frmview.tp_ref_cli.value = "";
		document.frmview.tp_ref_cli.style.background = "#CCCCCC";
		document.frmview.tp_ref_cli.disabled = true;
	}
	else {
		document.frmview.tp_ref_cli.value = "01";
		document.frmview.tp_ref_cli.style.background = "#FFFFFF";
		document.frmview.tp_ref_cli.disabled = false;
	}
}

function fnc_Referencia(campo) {
	if(campo.value != "") {
		document.frmview.in_embarque.checked = false;
	}
	else {
		document.frmview.in_embarque.checked = true;
	}
}

function fnc_EventoLimitadorChange(objSelect) {
<%
If ex_dias Then
%>
	if(objSelect.options[objSelect.selectedIndex].value=='') {
		fnc_desabilita();	
	}
	else {        
        document.frmview.cd_evento_2.value = '';
        document.frmview.cd_evento_2.disabled = false;
        fnc_EventoLimitadorChange_2(document.getElementById('cd_evento_2'));
        document.frmview.rd_1.disabled = false;
		document.frmview.rd_2.disabled = false;
        if (!document.frmview.rd_2.checked){
          document.frmview.rd_aux1.disabled = true;
		  document.frmview.rd_aux2.disabled = true;
          document.frmview.rd_aux3.disabled = true;
        }
	}
<%
End If
%>
}

function fnc_EventoLimitadorChange_2(objSelect) {
<%
If ex_dias Then
%>
	if(objSelect.options[objSelect.selectedIndex].value=='') {
		fnc_desabilita_2();	
	}
	else {        
        document.frmview.rd_1_2.disabled = false;
		document.frmview.rd_2_2.disabled = false;
        if (!document.frmview.rd_2_2.checked){
          document.frmview.rd_aux1_2.disabled = true;
		  document.frmview.rd_aux2_2.disabled = true;
          document.frmview.rd_aux3_2.disabled = true;
          document.frmview.rd_aux4_2.disabled = true;
        }
	}
<%
End If
%>
}

function fnc_desabilita_novo(acao){
	if (acao == "novo"){
			document.frmview.rd_1.checked = false;
			document.frmview.rd_2.checked = false;
            document.frmview.rd_1.disabled = true;
			document.frmview.rd_2.disabled = true;
            document.frmview.rd_aux1.disabled = true;
			document.frmview.rd_aux2.disabled = true;
            document.frmview.rd_aux3.disabled = true;
			document.frmview.nr_dias.value = '';
			document.frmview.nr_dias.readOnly=true;			
	}
	if (acao == "alterar" || acao == "editar" || acao == "incluir"){
		if (document.frmview.cd_evento.value == ''){
            document.frmview.rd_1.checked = false;
			document.frmview.rd_2.checked = false;
            document.frmview.rd_1.disabled = true;
			document.frmview.rd_2.disabled = true;
            document.frmview.rd_aux1.disabled = true;
			document.frmview.rd_aux2.disabled = true;
            document.frmview.rd_aux3.disabled = true;
			document.frmview.nr_dias.value = '';
			document.frmview.nr_dias.readOnly=true;			
		}else{            
            if('<%=tp_limitador %>' == '1'){
               document.frmview.rd_aux1.checked = true;
               document.frmview.rd_aux1.disabled = true;
               document.frmview.rd_aux2.disabled = true;
               document.frmview.rd_aux3.disabled = true;
               document.frmview.rd_1.disabled = false;
			   document.frmview.rd_2.disabled = false;
            }else{
               document.frmview.rd_1.disabled = false;
			   document.frmview.rd_2.disabled = false;
               document.frmview.rd_aux1.disabled = false;
               document.frmview.rd_aux2.disabled = false;
               document.frmview.rd_aux3.disabled = false;
               if('<%=tp_limitador_aux %>' != '3'){
                   document.frmview.nr_dias.value = '';
			       document.frmview.nr_dias.readOnly=true;	
               }
            }            
		}
    }
}


function fnc_desabilita_novo_2(acao){
	if (acao == "novo"){
            document.frmview.cd_evento_2.disabled = true;
			document.frmview.rd_1_2.checked = false;
			document.frmview.rd_2_2.checked = false;
            document.frmview.rd_1_2.disabled = true;
			document.frmview.rd_2_2.disabled = true;
            document.frmview.rd_aux1_2.disabled = true;
			document.frmview.rd_aux2_2.disabled = true;
            document.frmview.rd_aux3_2.disabled = true;
            document.frmview.rd_aux4_2.disabled = true;
			document.frmview.nr_dias_2.value = '';
			document.frmview.nr_dias_2.readOnly=true;			
	}
	if (acao == "alterar" || acao == "editar" || acao == "incluir"){
      if (!document.frmview.cd_evento.value == ''){
		if (document.frmview.cd_evento_2.value == ''){
            document.frmview.rd_1_2.checked = false;
			document.frmview.rd_2_2.checked = false;
            document.frmview.rd_1_2.disabled = true;
			document.frmview.rd_2_2.disabled = true;
            document.frmview.rd_aux1_2.disabled = true;
			document.frmview.rd_aux2_2.disabled = true;
            document.frmview.rd_aux3_2.disabled = true;
            document.frmview.rd_aux4_2.disabled = true;
			document.frmview.nr_dias_2.value = '';
			document.frmview.nr_dias_2.readOnly=true;			
		}else{            
            if('<%=tp_limitador_2 %>' == '1'){
               document.frmview.rd_aux1_2.checked = true;
               document.frmview.rd_aux1_2.disabled = true;
               document.frmview.rd_aux2_2.disabled = true;
               document.frmview.rd_aux3_2.disabled = true;
               document.frmview.rd_aux4_2.disabled = true;
               document.frmview.rd_1_2.disabled = false;
			   document.frmview.rd_2_2.disabled = false;
            }else{
               document.frmview.rd_1_2.disabled = false;
			   document.frmview.rd_2_2.disabled = false;
               document.frmview.rd_aux1_2.disabled = false;
               document.frmview.rd_aux2_2.disabled = false;
               document.frmview.rd_aux3_2.disabled = false;
               document.frmview.rd_aux4_2.disabled = false;
               if('<%=tp_limitador_aux_2 %>' != '3'){
                   document.frmview.nr_dias_2.value = '';
			       document.frmview.nr_dias_2.readOnly=true;	
               }
            }            
		}
      }else{
        document.frmview.cd_evento_2.disabled = true;
      }
    }
}

function fnc_desabilita(){
        document.frmview.cd_evento_2.value = '';
        document.frmview.cd_evento_2.disabled = true;
        fnc_EventoLimitadorChange_2(document.getElementById('cd_evento_2'));
		document.frmview.rd_1.checked = false;
		document.frmview.rd_2.checked = false;
        document.frmview.rd_1.disabled = true;
		document.frmview.rd_2.disabled = true;
        document.frmview.rd_aux1.disabled = true;
        document.frmview.rd_aux2.disabled = true;
        document.frmview.rd_aux3.disabled = true;
		document.frmview.nr_dias.value = '';
		document.frmview.nr_dias.readOnly=true;
		document.frmview.tp_limitador.value = '';
        document.frmview.tp_limitador_aux.value = '';
}

function fnc_desabilita_2(){
		document.frmview.rd_1_2.checked = false;
		document.frmview.rd_2_2.checked = false;
        document.frmview.rd_1_2.disabled = true;
		document.frmview.rd_2_2.disabled = true;
        document.frmview.rd_aux1_2.disabled = true;
        document.frmview.rd_aux2_2.disabled = true;
        document.frmview.rd_aux3_2.disabled = true;
		document.frmview.nr_dias_2.value = '';
		document.frmview.nr_dias_2.readOnly=true;
		document.frmview.tp_limitador_2.value = '';
        document.frmview.tp_limitador_aux_2.value = '';
}

function fnc_rd_altera(id){
	if (document.getElementById(id).checked){
		//Não realizado
        if (id == 'rd_1'){   
            if (!document.getElementById('rd_2').checked){
                document.getElementById('rd_aux1').disabled = true; 
                document.getElementById('rd_aux2').disabled = true; 
                document.getElementById('rd_aux3').disabled = true; 
                document.getElementById('tp_limitador').value = '1';         
            }else{
                document.getElementById('tp_limitador').value = '3';     
            }    
        }

        //Realizado
        if (id == 'rd_2'){
            document.getElementById('nr_dias').value = '';
		    document.getElementById('nr_dias').readOnly=true;
            
            document.getElementById('rd_aux1').checked = true;
            document.getElementById('rd_aux1').disabled = false; 
            document.getElementById('tp_limitador_aux').value = '1';

            document.getElementById('rd_aux2').checked = false;
            document.getElementById('rd_aux2').disabled = false; 

            document.getElementById('rd_aux3').checked = false;
            document.getElementById('rd_aux3').disabled = false; 

            if (!document.getElementById('rd_1').checked){
                document.getElementById('tp_limitador').value = '2';   
            }else{
                document.getElementById('tp_limitador').value = '3';
                document.getElementById('tp_limitador_aux').value = '1';
            }   
        }
        
        if (id == 'rd_aux1'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = true;document.getElementById('tp_limitador_aux').value = '1';}
        if (id == 'rd_aux2'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = true;document.getElementById('tp_limitador_aux').value = '2';}
        if (id == 'rd_aux3'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = false;document.getElementById('tp_limitador_aux').value = '3';}        
	}else{
        if (id == 'rd_1'){
            if (document.getElementById('rd_2').checked){
               document.getElementById('tp_limitador').value = '2';   
            }else{
               document.getElementById('tp_limitador').value = '';   
            }
        }

        if (id == 'rd_2'){
            document.getElementById('nr_dias').value = '';
            document.getElementById('nr_dias').readOnly = true;
            document.getElementById('rd_aux1').disabled = true; 
            document.getElementById('rd_aux2').disabled = true; 
            document.getElementById('rd_aux3').disabled = true;  
            document.getElementById('tp_limitador_aux').value = '';  
            if (document.getElementById('rd_1').checked){
               document.getElementById('tp_limitador').value = '1';   
            }else{
               document.getElementById('tp_limitador').value = '';   
            }
        }     
        
        if (id == 'rd_aux1'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = true;document.getElementById('tp_limitador_aux').value = '';}
        if (id == 'rd_aux2'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = true;document.getElementById('tp_limitador_aux').value = '';}
        if (id == 'rd_aux3'){document.getElementById('nr_dias').value = '';document.getElementById('nr_dias').readOnly = true;document.getElementById('tp_limitador_aux').value = '';}    
    }
}

function fnc_rd_altera_2(id){
	if (document.getElementById(id).checked){
		//Não realizado
        if (id == 'rd_1_2'){  
            if (!document.getElementById('rd_2_2').checked){
                document.getElementById('rd_aux1_2').disabled = true; 
                document.getElementById('rd_aux2_2').disabled = true; 
                document.getElementById('rd_aux3_2').disabled = true; 
                document.getElementById('rd_aux4_2').disabled = true; 
                document.getElementById('tp_limitador_2').value = '1';         
            }else{
                document.getElementById('tp_limitador_2').value = '3';     
            }    
        }

        //Realizado
        if (id == 'rd_2_2'){
            document.getElementById('nr_dias_2').value = '';
		    document.getElementById('nr_dias_2').readOnly=true;
            
            document.getElementById('rd_aux1_2').checked = true;
            document.getElementById('rd_aux1_2').disabled = false; 
            document.getElementById('tp_limitador_aux_2').value = '1';

            document.getElementById('rd_aux2_2').checked = false;
            document.getElementById('rd_aux2_2').disabled = false; 

            document.getElementById('rd_aux3_2').checked = false;
            document.getElementById('rd_aux3_2').disabled = false;
            
            document.getElementById('rd_aux4_2').checked = false;
            document.getElementById('rd_aux4_2').disabled = false;  

            if (!document.getElementById('rd_1_2').checked){
                document.getElementById('tp_limitador_2').value = '2';   
            }else{
                document.getElementById('tp_limitador_2').value = '3';
                document.getElementById('tp_limitador_aux_2').value = '1';
            }   
        }
        
        if (id == 'rd_aux1_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '1';}
        if (id == 'rd_aux2_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '2';}
        if (id == 'rd_aux3_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = false;document.getElementById('tp_limitador_aux_2').value = '3';}
        if (id == 'rd_aux4_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '4';}        
	}else{
        if (id == 'rd_1_2'){
            if (document.getElementById('rd_2_2').checked){
               document.getElementById('tp_limitador_2').value = '2';   
            }else{
               document.getElementById('tp_limitador_2').value = '';   
            }
        }

        if (id == 'rd_2_2'){
            document.getElementById('nr_dias_2').value = '';
            document.getElementById('nr_dias_2').readOnly = true;
            document.getElementById('rd_aux1_2').disabled = true; 
            document.getElementById('rd_aux2_2').disabled = true; 
            document.getElementById('rd_aux3_2').disabled = true;  
            document.getElementById('rd_aux4_2').disabled = true; 
            document.getElementById('tp_limitador_aux_2').value = '';  
            if (document.getElementById('rd_1_2').checked){
               document.getElementById('tp_limitador_2').value = '1';   
            }else{
               document.getElementById('tp_limitador_2').value = '';   
            }
        }     
        
        if (id == 'rd_aux1_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '';}
        if (id == 'rd_aux2_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '';}
        if (id == 'rd_aux3_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '';}    
        if (id == 'rd_aux4_2'){document.getElementById('nr_dias_2').value = '';document.getElementById('nr_dias_2').readOnly = true;document.getElementById('tp_limitador_aux_2').value = '';}
    }
}

function fnc_iniciaQtd(){  
//document.frmview.qtd_filtro.value = '[' + document.frmview.array_filtro.length + ']';
document.frmview.qtd_campo.value  = '[' + document.frmview.array_campo.length  + ']';

	var total = document.getElementById('campo').options.length;
	if(total > parseInt(document.getElementById('quantidade_campos').value)){
	document.getElementById('divAddTodos').style.display = 'none';
	document.getElementById('divAddTodosDes').style.display = 'block';
	}else{
	document.getElementById('divAddTodos').style.display = 'block';
	document.getElementById('divAddTodosDes').style.display = 'none';
	}
}

function fnc_ValidaHora(edit) {
  var valida = true;
  var hrs    = (edit.value.substring(0,2));
  var min    = (edit.value.substring(3,5));
  var pontos = (edit.value.substring(2,3));

  if (edit.value != '') {
  	if ((isNaN(parseInt(hrs))) || (isNaN(parseInt(min))) || (hrs < 00 ) || (hrs > 23) || ( min < 00) ||( min > 59) || (pontos != ':') || (edit.value.length < 5)){ 
		valida = false; 
	}
  }else{
    valida = true; 
  }

  if (valida == false) {
	  alert('Atenção: Hora inválida!');
	  edit.select();
	  edit.focus();
  } 
  return valida;
}

function mascaraHora(campoHora){
              var hora = campoHora.value;
              if (hora.length == 2){
                  hora = hora + ':';
                  campoHora.value = hora;
      			  return true;              
              }
         }

function alteraOcorre(campo){
    if (campo.id != 'dias_freq_ocorre'){
        if (campo.id == 'freq_ocorre_todos'){
            if (campo.checked) {
                document.getElementById('freq_ocorre_todos').disabled = false;
                document.getElementById('freq_ocorre_seg').checked = false;
                document.getElementById('freq_ocorre_seg').disabled = true;
                document.getElementById('freq_ocorre_ter').checked = false;
                document.getElementById('freq_ocorre_ter').disabled = true;
                document.getElementById('freq_ocorre_qua').checked = false;
                document.getElementById('freq_ocorre_qua').disabled = true;
                document.getElementById('freq_ocorre_qui').checked = false;
                document.getElementById('freq_ocorre_qui').disabled = true;
                document.getElementById('freq_ocorre_sex').checked = false;
                document.getElementById('freq_ocorre_sex').disabled = true;
                document.getElementById('freq_ocorre_sab').checked = false;
                document.getElementById('freq_ocorre_sab').disabled = true;
                document.getElementById('freq_ocorre_dom').checked = false;
                document.getElementById('freq_ocorre_dom').disabled = true;
                mudaEdit('dias_freq_ocorre', '1');
            }else{
                document.getElementById('freq_ocorre_todos').disabled = false;
                document.getElementById('freq_ocorre_todos').checked = false;
                document.getElementById('freq_ocorre_seg').disabled = false;
                document.getElementById('freq_ocorre_ter').disabled = false;
                document.getElementById('freq_ocorre_qua').disabled = false;
                document.getElementById('freq_ocorre_qui').disabled = false;
                document.getElementById('freq_ocorre_sex').disabled = false;
                document.getElementById('freq_ocorre_sab').disabled = false;
                document.getElementById('freq_ocorre_dom').disabled = false;
                mudaEdit('dias_freq_ocorre', '0');
            }
        }else{
            if (campo.checked) {
                document.getElementById('freq_ocorre_todos').disabled = true; 
                document.getElementById('freq_ocorre_seg').disabled = false;
                document.getElementById('freq_ocorre_ter').disabled = false;
                document.getElementById('freq_ocorre_qua').disabled = false;
                document.getElementById('freq_ocorre_qui').disabled = false;
                document.getElementById('freq_ocorre_sex').disabled = false;
                document.getElementById('freq_ocorre_sab').disabled = false;
                document.getElementById('freq_ocorre_dom').disabled = false;
                mudaEdit('dias_freq_ocorre', '1');
            }else{
                if (document.getElementById('freq_ocorre_seg').checked ||
            document.getElementById('freq_ocorre_ter').checked ||
            document.getElementById('freq_ocorre_qua').checked ||
            document.getElementById('freq_ocorre_qui').checked ||
            document.getElementById('freq_ocorre_sex').checked ||
            document.getElementById('freq_ocorre_sab').checked ||
            document.getElementById('freq_ocorre_dom').checked){
            }else{          
                document.getElementById('freq_ocorre_todos').disabled = false;
                document.getElementById('freq_ocorre_seg').disabled = false;
                document.getElementById('freq_ocorre_ter').disabled = false;
                document.getElementById('freq_ocorre_qua').disabled = false;
                document.getElementById('freq_ocorre_qui').disabled = false;
                document.getElementById('freq_ocorre_sex').disabled = false;
                document.getElementById('freq_ocorre_sab').disabled = false;
                document.getElementById('freq_ocorre_dom').disabled = false;
                mudaEdit('dias_freq_ocorre', '0');
            }
            }
        }
    }else{
        if (Trim(campo.value) != ''){
            document.getElementById('freq_ocorre_todos').checked = false;
            document.getElementById('freq_ocorre_todos').disabled = true;
            document.getElementById('freq_ocorre_seg').checked = false;
            document.getElementById('freq_ocorre_seg').disabled = true;
            document.getElementById('freq_ocorre_ter').checked = false;
            document.getElementById('freq_ocorre_ter').disabled = true;
            document.getElementById('freq_ocorre_qua').checked = false;
            document.getElementById('freq_ocorre_qua').disabled = true;
            document.getElementById('freq_ocorre_qui').checked = false;
            document.getElementById('freq_ocorre_qui').disabled = true;
            document.getElementById('freq_ocorre_sex').checked = false;
            document.getElementById('freq_ocorre_sex').disabled = true;
            document.getElementById('freq_ocorre_sab').checked = false;
            document.getElementById('freq_ocorre_sab').disabled = true;
            document.getElementById('freq_ocorre_dom').checked = false;
            document.getElementById('freq_ocorre_dom').disabled = true;    
        }else{
            document.getElementById('freq_ocorre_todos').disabled = false;
            document.getElementById('freq_ocorre_seg').disabled = false;
            document.getElementById('freq_ocorre_ter').disabled = false;
            document.getElementById('freq_ocorre_qua').disabled = false;
            document.getElementById('freq_ocorre_qui').disabled = false;
            document.getElementById('freq_ocorre_sex').disabled = false;
            document.getElementById('freq_ocorre_sab').disabled = false;
            document.getElementById('freq_ocorre_dom').disabled = false;    
        }
    }
}

function fnc_iniciaOcorre(){
    if ('<%=in_acao%>' != 'novo'){
        if ('<%=freq_ocorre_todos%>' == '1'){
            alteraOcorre(document.getElementById('freq_ocorre_todos'));
            mudaEdit('dias_freq_ocorre', '1');
        }else{       
            if (Trim('<%=dias_freq_ocorre%>') == ''){
                document.getElementById('freq_ocorre_todos').disabled = true; 
                mudaEdit('dias_freq_ocorre', '1');                           
            }else{
                document.getElementById('freq_ocorre_todos').checked = false;
                document.getElementById('freq_ocorre_todos').disabled = true;
                document.getElementById('freq_ocorre_seg').checked = false;
                document.getElementById('freq_ocorre_seg').disabled = true;
                document.getElementById('freq_ocorre_ter').checked = false;
                document.getElementById('freq_ocorre_ter').disabled = true;
                document.getElementById('freq_ocorre_qua').checked = false;
                document.getElementById('freq_ocorre_qua').disabled = true;
                document.getElementById('freq_ocorre_qui').checked = false;
                document.getElementById('freq_ocorre_qui').disabled = true;
                document.getElementById('freq_ocorre_sex').checked = false;
                document.getElementById('freq_ocorre_sex').disabled = true;
                document.getElementById('freq_ocorre_sab').checked = false;
                document.getElementById('freq_ocorre_sab').disabled = true;
                document.getElementById('freq_ocorre_dom').checked = false;
                document.getElementById('freq_ocorre_dom').disabled = true;
            }      
        }
    }
}

function mudaEdit(campo , desabilita){
    if (desabilita == '1'){
        document.getElementById(campo).value = '';
        document.getElementById(campo).disabled = true; 
        document.getElementById(campo).readOnly = true;
        document.getElementById(campo).style.backgroundColor = '#DEE6EF'; 
    }else{
        document.getElementById(campo).disabled = false; 
        document.getElementById(campo).readOnly = false;
        document.getElementById(campo).style.backgroundColor = '#FFFFFF'; 
    }
}

function alteraQuantCampos(objeto){
  var dif_file = '';
  var confere_campo = 'in_' + objeto.id;
  var campo_aux = objeto.id + '_aux';
  if (!objeto.selectedIndex == 0){
    if (document.getElementById(confere_campo).value == 0){        
      document.getElementById('quantidade_campos').value = parseInt(document.getElementById('quantidade_campos').value) + 2;
      document.getElementById('quantidade_file').value = parseInt(document.getElementById('quantidade_file').value) + 1;
      document.getElementById(confere_campo).value = 1;     
      document.getElementById(campo_aux).value = objeto.options[objeto.selectedIndex].value;
    }else{
      document.getElementById(campo_aux).value = objeto.options[objeto.selectedIndex].value;
    }  
  }else{   
    if (parseInt(document.getElementById('quantidade_campos').value) > 30){    
      document.getElementById('quantidade_campos').value = parseInt(document.getElementById('quantidade_campos').value) - 2;
      document.getElementById('quantidade_file').value = parseInt(document.getElementById('quantidade_file').value) - 1;        
      if (document.frmview.array_campo.length > parseInt(document.getElementById('quantidade_campos').value))
      {
        var dif = document.frmview.array_campo.length - parseInt(document.getElementById('quantidade_campos').value);        
        if (parseInt(document.getElementById("contador_file").value) > parseInt(document.getElementById('quantidade_file').value)){
          dif_file = parseInt(document.getElementById("contador_file").value) - parseInt(document.getElementById('quantidade_file').value)
          dif_file = ' (' + dif_file + ' arquivo(s))';
        }        
        alert('ATENÇÃO: Primeiramente, você deve excluir ' + dif + ' campo(s)' + dif_file + '!');
        document.getElementById('quantidade_campos').value = parseInt(document.getElementById('quantidade_campos').value) + 2;
        document.getElementById('quantidade_file').value = parseInt(document.getElementById('quantidade_file').value) + 1;       
        objeto.value = document.getElementById(campo_aux).value;      
      }else{        
        if (parseInt(document.getElementById("contador_file").value) > parseInt(document.getElementById('quantidade_file').value)){
          dif_file = parseInt(document.getElementById("contador_file").value) - parseInt(document.getElementById('quantidade_file').value);
          alert('ATENÇÃO: Primeiramente, você deve excluir ' + dif_file + ' arquivo(s)!');
          document.getElementById('quantidade_campos').value = parseInt(document.getElementById('quantidade_campos').value) + 2;
          document.getElementById('quantidade_file').value = parseInt(document.getElementById('quantidade_file').value) + 1;       
          objeto.value = document.getElementById(campo_aux).value;
        }else{
          document.getElementById(confere_campo).value = 0; 
        }               
      }
    }
  } 
}

function alteraCheckKPI(objeto){
  var id = objeto.id; 
  var id_principal = objeto.id; 
  var texto = objeto.id;
  var j;
  if (Right(objeto.id, 3) == 'tp1'){
    id = id.replace('tp1', 'tp2')
    id_principal = id_principal.replace('_tp1','')
    texto = texto.replace('_tp1','');
    if (objeto.checked){
      if (document.getElementById(id).checked){
        document.getElementById(id_principal).value = 2;
      }else{
        document.getElementById(id_principal).value = 0;
      }
    }else{
      document.getElementById(id).checked = true;
      alteraCheckKPI(document.getElementById(id));
    }  
  }else{
    id = id.replace('tp2', 'tp1')
    id_principal = id_principal.replace('_tp2','')
    texto = texto.replace('_tp2','');
    if (objeto.checked){
      if (document.getElementById(id).checked){
        document.getElementById(id_principal).value = 2;
      }else{
        document.getElementById(id_principal).value = 1;
      }
    }else{
      document.getElementById(id).checked = true;
      alteraCheckKPI(document.getElementById(id));
    }  
  }  
  for (j = 0; j <= document.frmview.array_campo.length-1; j++){
    var texto = texto.replace('tipo_kpi', 'texto_kpi');
    if (document.getElementById(texto).value == document.frmview.array_campo.options[j].text){
      //alert(document.frmview.array_campo.options[j].value);
      document.frmview.array_campo.options[j].value = Left(document.frmview.array_campo.options[j].value, 12) + '_' + document.getElementById(id_principal).value;
      //alert(document.frmview.array_campo.options[j].value);
    }
  }  
}

-->
</script>
</head>
<body onLoad="fnc_iniciaQtd();document.frmview.nm_view.focus();fnc_desabilita_novo('<%=in_acao%>');fnc_desabilita_novo_2('<%=in_acao%>');fnc_iniciaOcorre();">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="table">
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
    <td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: --> 
      <div id="dv_corpo" class="divMainTop">
      <%
	  If objrsx.State = adStateOpen Then objrsx.Close()
	  sql_campos = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
				"  AND LEFT(LTRIM(RTRIM(M10_AP_CAMPO)),5) = 'DT_EV' "&_
				" UNION ALL "&_
                " SELECT M10_CD_DADO, RTRIM(M10_NM_DADO) AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, "&_ 
                " M10_NM_DESCRICAO, M10_CD_BROKER, M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
                " FROM M12_CAMPO ( NOLOCK ) "&_
                " INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO = M12_CD_DADO ) "&_
                " WHERE M12_TP_EXIBIR >= '0' "&_
                " AND M12_IN_ATIVO = 1 "&_
                " AND M10_IN_ATIVO = 1 "&_
                " AND M12_CD_MENU = '" & cd_menu &"' "&_
                " AND M12_CD_SUBM = '" & cd_subm & "' "&_
                " AND M10_AP_CAMPO = 'DT_HOJE'"&_
				"ORDER BY M12_TP_GRUPO"	
				
	objrsx.Open sql_campos, objcnn, adOpenStatic, adLockReadOnly, adCmdText
%>
          <iframe id="divFrame" src="" style="visibility: hidden; position: absolute; z-index: 2;"></iframe><div id="divInfo" class="divInfo" style="overflow:hidden;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
	<tr height="25">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="center" valign="middle">&nbsp;&nbsp;<b><%= tx_lang_CV006(cd_lang)%></b>&nbsp;&nbsp;</td>
					<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');"><img src="/imagens/30/btn_fechar.gif" width="18" height="17" border="0" alt="<%=tx_lang_D00011(cd_lang)%>"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
    </table></div>
    <div id="divInfoCorpo" class="divInfo">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6">
    <tr valign="top" height="20"><td><br>
    </td></tr>
    <tr valign="top" height="20"><td><br>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center"><tr><td align="left" valign="top">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
    <tr valign="top">
    <td class="gridtit" width="5px"></td><td class="gridtit" ><%=tx_lang_CV009(cd_lang)%></td>
    </tr>
    <%
	If objrsx.RecordCount > 0 Then
		While not objrsx.eof%>
		<tr height="20"><td align="center" width="5px"><input type="checkbox" name="kpi" id="<%= objrsx("M10_AP_CAMPO")%>" value="<%= objrsx("M10_NM_DADO")%>" onClick="clickKpi(this);"><input type="text" name="kpi_codigo<%= objrsx("M10_AP_CAMPO")%>" id="kpi_codigo<%= objrsx("M10_AP_CAMPO")%>" value="<%= objrsx("M10_CD_DADO")%>" style="display:none;"></td><td><nobr><%= objrsx("M10_NM_DADO")%>&nbsp;</nobr></td></tr>
		<%
		objrsx.MoveNext
		Wend
		objrsx.Close
	Else
		%>
		<tr height="20px"><td colspan="2" align="center"><%=tx_lang_CV010(cd_lang)%></td></tr>
		<%
	End If
	%>
    </table>
    </td></tr></table>
    </td></tr>
    <tr valign="top"><td><br><br>
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr valign="top"><td align="left" valign="top">
    <table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
    <tr valign="top">
    <td class="gridtit" width="10%"><nobr>&nbsp;<%=tx_lang_CV017(cd_lang) %>&nbsp;</nobr></td><td class="gridtit" width="10%"><nobr>&nbsp;<%=tx_lang_CV018(cd_lang) %>&nbsp;</nobr></td><td class="gridtit" width="80%"><%=tx_lang_CV011(cd_lang)%></td>
    </tr>
    <tr height="20">
    <%
	If objrsx.State = adStateOpen Then objrsx.Close()
	sql= " SELECT DISTINCT M14_CD_CAMPO AS CD_CAMPO, (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
	" + ' x ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO, 'X', NULL, NULL, M14_NR_ORDEM, M14_TP_KPI_AUX AS TP_KPI "&_
	" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI'"&_
	" ORDER BY M14_NR_ORDEM"
	objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
	If objrsx.RecordCount > 0 Then
	%>
    <td colspan="3"><div id="divKpiSelecionado" style="display:block;">
    <%
	total_contador_kpi = 0
	While Not objrsx.eof
	total_contador_kpi = total_contador_kpi + 1
	%>
	<div id='<%= objrsx.Fields.Item("CD_CAMPO").value%>' style="height:18px;"><input type="text" style="display:none" <%If objrsx.Fields.Item("TP_KPI").value = 0 Then %>value="0"<%Else%>value="1"<%End If %> name="tipo_kpi<%= total_contador_kpi%>" id="tipo_kpi<%= total_contador_kpi%>">  
    &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="tipo_kpi<%= total_contador_kpi%>_tp1" onclick="alteraCheckKPI(this);"  <%If objrsx.Fields.Item("TP_KPI").value = 0 or objrsx.Fields.Item("TP_KPI").value = 2 Then %>checked<%End If%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="tipo_kpi<%= total_contador_kpi%>_tp2" onclick="alteraCheckKPI(this);" <%If objrsx.Fields.Item("TP_KPI").value = 1 or objrsx.Fields.Item("TP_KPI").value = 2 Then %>checked<%End If%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:retiraKpi('<%= Right(objrsx.Fields.Item("CD_CAMPO").value,9)%>');"><img src="/imagens/30/btn_delete.gif" border="0" style="vertical-align:absmiddle;"></a>&nbsp;&nbsp;<input type="text" style="display:none" value="<%= objrsx.Fields.Item("CD_CAMPO").value%>_<%= objrsx.Fields.Item("TP_KPI").value%>" name="codigo_kpi<%= total_contador_kpi%>" id="codigo_kpi<%= total_contador_kpi%>"><input type="text" style="display:none" value="<%= objrsx.Fields.Item("CD_CAMPO").value%>" name="flag_<%= objrsx.Fields.Item("CD_CAMPO").value%>" id="flag_<%= objrsx.Fields.Item("CD_CAMPO").value%>"><input type="text" style="display:none" value="(KPI) <%= Trim(objrsx.Fields.Item("NM_CAMPO").value)%>" name="texto_kpi<%= total_contador_kpi%>" id="texto_kpi<%= total_contador_kpi%>"><%= objrsx.Fields.Item("NM_CAMPO").value%><br></div>
	<%
	objrsx.MoveNext
	Wend
	objrsx.Close
	%>
    </div>
    <div id="divKpiSelecionadoNao" style="display:none;" align="center"><%=tx_lang_CV012(cd_lang)%></div>
    </td>
    <%Else%>
    <td colspan="3"><div id="divKpiSelecionado" style="display:none;"></div>
    <div id="divKpiSelecionadoNao" style="display:block;" align="center"><%=tx_lang_CV012(cd_lang)%></div>
    </td>
    <%End If%>
    </tr>
    </table>
    </td></tr>
    </table>
    </td></tr>
    </table>
    </div>
    <div id="divInfoRodape" class="divInfo" style="overflow:hidden;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td align="center">
    <input type="text" style="display:none" value="" name="kpi_selecionado" id="kpi_selecionado">
    <input type="text" style="display:none" value="" name="kpi_id_selecionado" id="kpi_id_selecionado">
    <input type="text" style="display:none" value="" name="kpi_codigo_selecionado" id="kpi_codigo_selecionado">
    <input type="text" style="display:none" value="0" name="contador_kpi" id="contador_kpi">
    <input type="text" style="display:none" value="<%= total_contador_kpi%>" name="contador_total_kpi" id="contador_total_kpi">
    <input type="text" style="display:none" value="<%= total_contador_kpi%>" name="contador_total_kpi_aux" id="contador_total_kpi_aux">
    <input name="submit_kpi" type="submit" class="button" value="<%=tx_lang_CV013(cd_lang)%>" onClick="confirmaKpi();">
    </td>
    </tr>
</table>
    </div>
    <iframe id="divFrameCR" src="" style="visibility: hidden; position: absolute; z-index:0;"></iframe>
    <div id="divInfoCR" style="border-color:<%=bg_color_barra%>;background-color:<%=bg_color_dicas%>;"><div id="divBotaoCR"><img src="/imagens/30/btn_fechar<%=bg_fechar %>.gif" width="18" height="17" border="0" alt="<%= tx_lang_POP060(cd_lang)%>" align="right" onClick="FechaDetalhesCR();" style="cursor:pointer;"></div><div id="divInfoCorpoCR" style="text-align:left;"><br><b><%= tx_lang_POP109(cd_lang)%>:</b>
<select class="select" style="width:326px;border-style:0px;"  name="cmb_usuario" id="cmb_usuario">
               <%
			     If objrsx.State = adStateOpen Then objrsx.Close()
				 If Not Session("cargo_interno") = "1" Then
				   sql = " SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO AS DESCRICAO "&_
				         " FROM TUSUARIO U (NOLOCK) "&_
						 " INNER JOIN TPERMISSAO_GRUPO P (NOLOCK) ON P.CD_USUARIO = U.CD_USUARIO "&_
						 " AND U.CD_CARGO <> '131' "&_
                         " AND P.CD_GRUPO ='" &  session("GrupoUsuario") & "'"&_
                         " ORDER BY U.NM_USUARIO"                  
				 Else
				   sql = "SELECT CD_USUARIO AS CODIGO, NM_USUARIO AS DESCRICAO FROM TUSUARIO (NOLOCK) WHERE CD_CARGO <> '131' ORDER BY NM_USUARIO"
				 End If	
				 objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
				 
				 Do While Not objrsx.Eof
				   %>
                      <option value="<%= objrsx.Fields.Item("CODIGO").Value %>"><%= objrsx.Fields.Item("DESCRICAO")%></option> 
				   <%	
				   objrsx.MoveNext
				   If objrsx.Eof Then Exit Do
				 Loop
			   %>	
               </select>
               <br /><br><center><%=tx_lang_TF045(cd_lang)%></center><br />
    <center><input name="btn_enviar" type="button" class="button" value="OK" style="background-color:#f0f1f6;width:100px" onClick="CopiaRelatorio(document.getElementById('cmb_usuario'),'<%= Trim(cd_view)%>');"/></center>

</div></div>
        <table width="650" border="0" cellspacing="0" cellpadding="2" align="center">
        <br>
          <form name="frmview" action="<%= script &"?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>" method="post" onSubmit="return VerifyFormView(this);">
          <input type="text" style="display:none" value="<%= opcao_kpi%>" name="opcao_kpi" id="opcao_kpi">
          <input type="text" style="display:none" value="<%= tp_limitador%>" name="tp_limitador" id="tp_limitador">
          <input type="text" style="display:none" value="<%= tp_limitador_aux%>" name="tp_limitador_aux" id="tp_limitador_aux">
          <input type="text" style="display:none" value="<%= tp_limitador_2%>" name="tp_limitador_2" id="tp_limitador_2">
          <input type="text" style="display:none" value="<%= tp_limitador_aux_2%>" name="tp_limitador_aux_2" id="tp_limitador_aux_2">
            <tr>
              <td width="20%" align="right" class="label"><label for="nome" style="color:<%=color_texto%>;"><%= tx_lang_004027(cd_lang)%></label></td>
              <td>&nbsp;&nbsp;
              <input name="nm_view" type="text" class="editbox" id="nome" style="width:250px;" value="<%If checkPassagem=nm_view then%><%=request("nm_view")%><%else%><%= nm_view%><%end if%>" maxlength="50">&nbsp;&nbsp;<a href="#" onClick="javascript:ExibeDetalhesCR();" style="color:<%=color_texto %>;"><%=tx_lang_TF044(cd_lang)%></a></td>
            </tr>
            <%
If ex_evento Then
	'seleciona todos os eventos referentes a sub-&aacute;rea
	sql = " SELECT RTRIM(ISNULL(M10_CD_BROKER, 'XXX')) AS CD_EVENTO, RTRIM(M10_NM_DADO) AS NM_EVENTO "&_
        " FROM M11_FILTRO  M11 (NOLOCK) "&_
        " INNER JOIN M10_DADOS M10 (NOLOCK) ON M10.M10_CD_DADO = M11.M11_CD_DADO "&_
        " WHERE M11_CD_MENU = '" & cd_menu & "' "&_
        " AND M11_CD_SUBM = '" & cd_subm & "' "&_
        " AND M11_IN_ATIVO = 1 "&_
        " AND M11_TP_EXIBIR >= '0' "&_
        " AND M10_IN_ATIVO = 1 "&_
        " AND M10_TP_DADO = '1' "&_
        " AND (M10.M10_CD_BROKER IS NOT NULL OR M10.M10_CD_DADO = '0611')"&_
        " ORDER BY NM_EVENTO "

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    'Response.Redirect("../IMPORT/teste.asp?var1="&tx_erro&"")

	'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
	'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
	If Not objrs.Eof then
%>
            <tr valign="top">
              <td align="right" class="label" style="color:<%=color_texto%>;" width="20%"><label for="evento"><%=tx_lang_004028(cd_lang)%></label></td>
                <td colspan="2">&nbsp;&nbsp;
                <select name="cd_evento" class="select" style="width:250px;" onChange="fnc_EventoLimitadorChange(this);">
                  <option value="" selected><%= tx_lang_004029(cd_lang)%></option>
                  <%
		Do While Not objrs.Eof
			selected = ""
			If cd_evento = Trim(objrs.Fields.Item("CD_EVENTO").Value) Then selected = " selected"

			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = Trim(objrs.Fields.Item("NM_EVENTO").Value)
			Else
				nm_campo_rel = Trim(objrs.Fields.Item("CD_EVENTO").Value) &" - "& Trim(objrs.Fields.Item("NM_EVENTO").Value)
			End If
%>
                  <option value="<%= objrs.Fields.Item("CD_EVENTO").Value%>"<%= selected%>><%= nm_campo_rel%></option>
                  <%
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
%>
                </select></td>
                </tr>
              <tr>
              <td>&nbsp;</td>
              <td colspan="2" align="left" style="padding-left:8;">
              <div>              
<%
		If ex_dias Then
%>
  <input name="rd_dias" id="rd_1" type="checkbox" <%if (tp_limitador = "1" or tp_limitador = "3") then response.Write("checked") end if%> onClick="fnc_rd_altera(this.id);" <%if not fnc_TestaVar(nr_dias) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV001(cd_lang)%><br />
  <input name="rd_dias" id="rd_2" <%if (tp_limitador = "2" or tp_limitador = "3") then response.Write("checked") end if%> type="checkbox" onClick="fnc_rd_altera(this.id);">Realizado<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/imagens/30/pto_l.gif" border="0" height="17" width="15">
  <input name="rd_aux" id="rd_aux1" type="radio" <%if (tp_limitador_aux = "1" and (tp_limitador = "2" or tp_limitador = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera(this.id);"><%=tx_lang_CV016(cd_lang)%>&nbsp;&nbsp;
  <input name="rd_aux" id="rd_aux2" type="radio" <%if (tp_limitador_aux = "2" and (tp_limitador = "2" or tp_limitador = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera(this.id);"><%=tx_lang_CV015(cd_lang)%>&nbsp;&nbsp;
  <input name="rd_aux" id="rd_aux3" type="radio" <%if (tp_limitador_aux = "3" and (tp_limitador = "2" or tp_limitador = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera(this.id);" <%if not fnc_TestaVar(nr_dias) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV002(cd_lang)%> <input class="editbox" type="text" name="nr_dias" size="2" maxlength="3" value="<%if nr_dias = "-1" then response.Write("") else response.Write(nr_dias) end if%>" onblur="if (this.value > 60) {alert('<%=tx_lang_004083(cd_lang) %>');this.focus();this.select();}"> <%=tx_lang_CV003(cd_lang)%> 
<%
		End If
%></div></td>
            </tr>
            <%
	End If
	objrs.Close
End If


If ex_evento Then
	'seleciona todos os eventos referentes a sub-&aacute;rea
	sql = " SELECT RTRIM(ISNULL(M10_CD_BROKER, 'XXX')) AS CD_EVENTO, RTRIM(M10_NM_DADO) AS NM_EVENTO "&_
        " FROM M11_FILTRO  M11 (NOLOCK) "&_
        " INNER JOIN M10_DADOS M10 (NOLOCK) ON M10.M10_CD_DADO = M11.M11_CD_DADO "&_
        " WHERE M11_CD_MENU = '" & cd_menu & "' "&_
        " AND M11_CD_SUBM = '" & cd_subm & "' "&_
        " AND M11_IN_ATIVO = 1 "&_
        " AND M11_TP_EXIBIR >= '0' "&_
        " AND M10_IN_ATIVO = 1 "&_
        " AND M10_TP_DADO = '1' "&_
        " AND (M10.M10_CD_BROKER IS NOT NULL OR M10.M10_CD_DADO = '0611')"&_
        " ORDER BY NM_EVENTO "

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
    'Response.Redirect("../IMPORT/teste.asp?var1="&tx_erro&"")

	'Se n&atilde;o existirem eventos para essa sub-area, n&atilde;o
	'ser&aacute; exibido o select com o evento pra exclus&atilde;o                        
	If Not objrs.Eof then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;" width="20%"><label for="evento">e</label></td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_evento_2" class="select" style="width:250px;" onChange="fnc_EventoLimitadorChange_2(this);">
                  <option value="" selected><%= tx_lang_004029(cd_lang)%></option>
                  <%
		Do While Not objrs.Eof
			selected = ""
			If cd_evento_2 = Trim(objrs.Fields.Item("CD_EVENTO").Value) Then selected = " selected"

			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = Trim(objrs.Fields.Item("NM_EVENTO").Value)
			Else
				nm_campo_rel = Trim(objrs.Fields.Item("CD_EVENTO").Value) &" - "& Trim(objrs.Fields.Item("NM_EVENTO").Value)
			End If
%>
                  <option value="<%= objrs.Fields.Item("CD_EVENTO").Value%>"<%= selected%>><%= nm_campo_rel%></option>
                  <%
			objrs.MoveNext
			If objrs.Eof Then Exit Do
		Loop
%>
                </select> </td>
                </tr>
              <tr>
              <td>&nbsp;</td>
              <td colspan="2" align="left" style="padding-left:8;">
              <div>              
<%
		If ex_dias Then
%>
  <input name="rd_dias_2" id="rd_1_2" type="checkbox" <%if (tp_limitador_2 = "1" or tp_limitador_2 = "3") then response.Write("checked") end if%> onClick="fnc_rd_altera_2(this.id);" <%if not fnc_TestaVar(nr_dias_2) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV001(cd_lang)%><br />
  <input name="rd_dias_2" id="rd_2_2" <%if (tp_limitador_2 = "2" or tp_limitador_2 = "3") then response.Write("checked") end if%> type="checkbox" onClick="fnc_rd_altera_2(this.id);">Realizado<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/imagens/30/pto_l.gif" border="0" height="17" width="15">
  <input name="rd_aux_2" id="rd_aux4_2" type="radio" <%if (tp_limitador_aux_2 = "4" and (tp_limitador_2 = "2" or tp_limitador_2 = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera_2(this.id);"><%=tx_lang_CV019(cd_lang)%>&nbsp;&nbsp;
  <input name="rd_aux_2" id="rd_aux1_2" type="radio" <%if (tp_limitador_aux_2 = "1" and (tp_limitador_2 = "2" or tp_limitador_2 = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera_2(this.id);"><%=tx_lang_CV016(cd_lang)%>&nbsp;&nbsp;
  <input name="rd_aux_2" id="rd_aux2_2" type="radio" <%if (tp_limitador_aux_2 = "2" and (tp_limitador_2 = "2" or tp_limitador_2 = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera_2(this.id);"><%=tx_lang_CV015(cd_lang)%>&nbsp;&nbsp;
  <input name="rd_aux_2" id="rd_aux3_2" type="radio" <%if (tp_limitador_aux_2 = "3" and (tp_limitador_2 = "2" or tp_limitador_2 = "3")) then response.Write("checked") end if%> onClick="fnc_rd_altera_2(this.id);" <%if not fnc_TestaVar(nr_dias_2) Then%> disabled="true" <%Else%>  <%End if%>><%=tx_lang_CV002(cd_lang)%> <input class="editbox" type="text" name="nr_dias_2" size="2" maxlength="3" value="<%if nr_dias_2 = "-1" then response.Write("") else response.Write(nr_dias_2) end if%>" onblur="if (this.value > 60) {alert('<%=tx_lang_004083(cd_lang) %>');this.focus();this.select();}"> <%=tx_lang_CV003(cd_lang)%> 
<%
		End If
%></div></td>
            </tr>
            <%
	End If
	objrs.Close
End If
'response.Redirect("../import/teste.asp?var='"&ex_relat&"'")
If Session("cargo_interno") = "1" Then
%>
        <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="evento"><%=tx_lang_001043(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_grupo_view" class="select" id="cd_grupo_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004085(cd_lang)%></option>

                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_GRUPO AS CODIGO, UPPER(NM_GRUPO) AS DESCRICAO FROM TGRUPO ORDER BY NM_GRUPO" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_grupo_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">&nbsp;</td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_cliente_view" class="select" id="cd_cliente_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004086(cd_lang)%></option>

                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_EMPRESA AS CODIGO, UPPER(NM_EMPRESA) AS DESCRICAO FROM TEMPRESA_NAC WHERE NM_EMPRESA IS NOT NULL ORDER BY NM_EMPRESA" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_cliente_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_celula_view" class="select" id="cd_celula_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004091(cd_lang)%></option>

                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_CELULA AS CODIGO, UPPER(NM_CELULA) AS DESCRICAO FROM TCELULA WHERE IN_ATIVO = '1' ORDER BY NM_CELULA" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_celula_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_area_view" class="select" id="cd_area_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004090(cd_lang)%></option>

                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_AREA AS CODIGO, UPPER(NM_AREA) AS DESCRICAO FROM TAREA ORDER BY NM_AREA " 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_area_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
<%End If %>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%If Not Session("cargo_interno") = "1" Then %><label for="evento"><%=tx_lang_001043(cd_lang)%></label><%End If%></td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_modal_view" class="select" id="cd_modal_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004087(cd_lang)%></option>

                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_VIA_TRANSPORTE AS CODIGO, UPPER(NM_VIA_TRANSPORTE) AS DESCRICAO FROM TVIA_TRANSPORTE ORDER BY NM_VIA_TRANSPORTE" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_modal_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>                        
<%If Session("cargo_interno") = "1" Then %>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">&nbsp;</td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_unid_view" class="select" id="cd_unid_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004088(cd_lang)%></option>                  
                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_UNID_NEG AS CODIGO, UPPER(AP_UNID_NEG) AS DESCRICAO FROM TUNID_NEG ORDER BY AP_UNID_NEG" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_unid_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">&nbsp;</td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_importador_view" class="select" id="cd_importador_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004096(cd_lang)%></option>                  
                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_EMPRESA AS CODIGO, UPPER(NM_EMPRESA) AS DESCRICAO FROM TEMPRESA_EST WHERE IN_IMPORTADOR = '1' AND IN_ATIVO = '1' ORDER BY NM_EMPRESA" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_importador_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <%
End If%>
<tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">&nbsp;</td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_transp_view" class="select" id="cd_transp_view" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004093(cd_lang)%></option>                  
                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_TRANSP_ROD AS CODIGO, UPPER(NM_TRANSP_ROD) AS DESCRICAO FROM TTRANSP_ROD ORDER BY NM_TRANSP_ROD" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_transp_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;">&nbsp;</td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="cd_armador_view" class="select" id="Select1" style="width:250px;" onchange="alteraQuantCampos(this);">
                  <option value="" selected><%= tx_lang_004095(cd_lang)%></option>                  
                  <%
                  'seleciona todos os eventos referentes a sub-&aacute;rea
	            sql = "SELECT CD_AGENTE AS CODIGO, UPPER(NM_AGENTE) AS DESCRICAO FROM TAGENTE ORDER BY NM_AGENTE" 
	            objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
                Do While Not objrs.Eof
                if cd_armador_view = objrs("CODIGO") Then selected = "selected" Else selected = ""
%>
									<option value="<%= objrs("CODIGO")%>" <%=selected %>><%= Trim(objrs("DESCRICAO"))%></option>
								<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
				Loop
				objrs.Close()     
                %>          
                </select></td>
            </tr>            
            <%
If ex_relat Then
tp_exibir_Export=tp_relat
%>
<tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><%= tx_lang_004031(cd_lang)%></td>
              <td colspan="2">&nbsp;&nbsp; <% 'tp_exibir_Export=tp_relat
								'Usuário  tem opção de exibição - mostra apenas os campos configurados na tabela
								'Se tp_exibir_Export=1 -> Por Pedido ou   tp_exibir_Export= 0 -> Por embarque%>
								<input name="tp_relat" type="radio"  onClick="alteraCampos('0', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>',1);alteraCampos('0', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 1);" value="0" id="embarque"<%If tp_relat = "0" or tp_relat = "2" Then Response.Write(" checked")%>>
                <label for="embarque"><%= tx_lang_004066(cd_lang)%> <%'=tx_lang_004066(cd_lang)%></label>
								<input name="tp_relat" type="radio" onClick="alteraCampos('3', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 1);alteraCampos('3', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 3);" value="3" id="fatura"<%If tp_relat = "3" Then Response.Write(" checked")%>>
                <label for="fatura"><%= tx_lang_004082(cd_lang)%></label>
                                <input name="tp_relat" type="radio" onClick="alteraCampos('1', 'divCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 1);alteraCampos('1', 'divCamposSelecionados', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 2);alteraQtdCampos('1', 'divQtdCampos', '<%= cd_menu%>', '<%= cd_subm%>', '<%= Session("tp_exibir")%>', '<%= cd_view%>','array_campo','<%= quantidade_campos%>', 2);" value="1" id="pedido"<%If tp_relat = "1" Then Response.Write(" checked")%>>
                <label for="pedido"><%= tx_lang_004067(cd_lang)%></label></td>
            </tr>
         <%
End If              				
If ex_quebra Then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="quebra"><%= tx_lang_004038(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
                <select name="tp_quebra" class="select" id="quebra" style="width:250px;">
                  <option value="" selected><%= tx_lang_004039(cd_lang)%></option>
                  <%
				  If cd_menu <> "01" then
				  	aux_quebra = 1
				  else
				  	aux_quebra = 0	
				   End If	
	For cont = 0 to UBound(tipo_quebra) - aux_quebra
		selected = ""
		If cont = 0 and InStr("040;055;060", Session("cd_cargo")) > 0 Then cont = 1
		If tp_quebra = CStr(cont) Then selected = " selected"
%>
                  <option value="<%= cont%>"<%= selected%>><%= nm_tp_quebra(cont)%></option>
                  <%
	Next
%>
                </select></td>
            </tr>
            <%
End If%>
<tr>
              <td align="right" class="label" style="color:<%=color_texto%>;" width="20%"><label for="evento"><%=tx_lang_004089(cd_lang)%></label></td>
              <td colspan="2">&nbsp;&nbsp;
              <select class="select" style="width:85px;" name="tp_ordenacao_view" id="tp_ordenacao_view">
				<option value="0" <%If tp_ordenacao_view = 0 Then Response.write "selected" %>><%=tx_lang_004069(cd_lang)%></option>
                <option value="1" <%If tp_ordenacao_view = 1 Then Response.write "selected" %>><%=tx_lang_004070(cd_lang)%></option>
              </select>
                <select name="cd_ordenacao_view" id="cd_ordenacao_view" class="select" style="width:162px;">
                  <option value="X" >(Sem Ordenação)</option>
                        <%
						If objrs.State = adStateOpen Then objrs.Close()						
						sql = "SELECT " &_
						"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, CASE WHEN M10_TP_DADO  = '1' AND M10_CD_BROKER IS NOT NULL THEN 'RLZ_' + RTRIM(M10_AP_CAMPO) ELSE CASE WHEN M10_CD_DADO IN ('0373','0018') THEN 'R.' + UPPER(RTRIM(M10_AP_CAMPO)) ELSE UPPER(RTRIM(M10_AP_CAMPO)) END END AS M10_AP_CAMPO, M10_TP_DADO, "&_
						"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
						"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
						"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
						"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
						"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
						"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
						"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
						"  AND M12_IN_ATIVO     = 1 " &_
						"  AND M10_IN_ATIVO     = 1 " &_
						"  AND (M12_IN_MONTA_SQL = 1 OR M10_CD_DADO IN ('0373'))" &_
						"  AND M10_CD_DADO NOT IN ('"& tx_nao_exibe &"') "&_
						"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"				
				        objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						While not objrs.eof
                        if Left(cd_ordenacao_view, 4) = objrs("M10_CD_DADO") Then selected = "selected" Else selected = ""                        
                        %>
                        <option value="<%= objrs("M10_CD_DADO")%>%<%= objrs("M10_AP_CAMPO")%>" <%=selected %> ><%= objrs("M10_NM_DADO")%></option> 
                        <%
                        objrs.MoveNext
                        Wend
                        objrs.Close
                        %>
                </select> </td>
           </tr>
           <%
If ex_dt_prev Then
%>
            <tr>
              <td align="right" class="label" style="color:<%=color_texto%>;"><label for="prev"><%= tx_lang_004044(cd_lang)%></label></td>
              <td colspan="2">&nbsp;
                <input type="checkbox" name="in_dt_prev" id="prev" value="1"<%If in_dt_prev Then Response.Write(" checked")%>>
                <%= tx_lang_004045(cd_lang)%>.</td>
            </tr>
            <%
End If
%>
           
<%
'verifica se existem campos para esse menu e sub-menu
If objrsx.State = 1 Then objrsx.Close
sql = "SELECT COUNT(*) AS CAMPOS "&_
			"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
			"WHERE M12_CD_DADO    = M10_CD_DADO "&_
			"  AND M12_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
			"  AND M12_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
			"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "
Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'Se o result do campo estiver no fim da tabela, isto &eacute;,
'n&atilde;o existem campos para esse sub-menu, ent&atilde;o n&atilde;o exibe os selects de campo
If objrsx.Fields.Item("CAMPOS").Value > 0 then
	script_campo = "combo_valor(this.form.array_campo,this.form.cd_campo);"
%>
            <tr>
              <td colspan="3"><table width="100%"  border="0" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="center"><b><%= tx_lang_004060(cd_lang)%></b></td>
                    <td align="center"></td>
                    <td align="center"><div id="divQtdCampos"><b><%= tx_lang_004061(cd_lang)%></b>&nbsp;<input name="qtd_campo" type="text" class="edtLabel" style="width:30px;text-align:center" readonly>
                    </div></td>
                    <td align="center">&nbsp;</td>
                  </tr>
                  <tr align="center">
                    <td width="44%">
                    <div id="divCampos">
                      <select class="select" size=10 name="campo" onDblClick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" style="width: 250;">
                      
                        <!-- <select name="campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" onkeypress="if(event.keyCode == 13) combo_altera(document.frmview.campo,document.frmview.array_campo,false);"> -->
                        <%
'seleciona os campos disponíveis para adcionar na personalização do relatório
' Se tp_exibir_Export=1 Exibe apenas os campos da M12_CAMPO  com tp_exibir_Export=1 e 2
' Se tp_exibir_Export=2 Exibe Todos os campos da M12_CAMPO 
' Se tp_exibir_Export=0 Exibe apenas os campos da M12_CAMPO  com tp_exibir_Export=0 e 2
'Response.Redirect("../import/teste.asp?var1="&tp_exibir_Export&"")
	If objrs.State = 1 Then objrs.Close
	sql_s = "SELECT 0 AS TP_CAMPO, M12_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA,M12_TP_EXIBIR_EXPORT, M10_CD_BROKER "&_
				"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND M12_CD_MENU    = "& fnc_QuotedSQL(cd_menu) &_
				"  AND M12_CD_SUBM    = "& fnc_QuotedSQL(cd_subm) &_
				"  AND M12_CD_CAMPO NOT IN ( "&_
				"    SELECT M14_CD_CAMPO "
				
	sql_f = "    FROM M14_VIEW_CAMPO ( NOLOCK ) "&_
			"    WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view) &" ) "&_
			"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "&_
            "  AND M10_AP_CAMPO <> 'DT_HOJE' "

    Select Case  tp_exibir_Export ' se for selecionado Embarque ou pedido acrescenta....
		 Case  "0" , "1"
			sql_f = sql_f & "  AND M12_TP_EXIBIR_EXPORT IN ('"&tp_exibir_Export&"','2') "
    End select

    sql_arq =  " UNION "&_
               " SELECT 1 AS TP_CAMPO, 'arq_' + RIGHT('0000' + CONVERT(VARCHAR, CD_TIPO_DOCTO), 4) AS M12_CD_CAMPO, UPPER(NM_TIPO_DOCTO) AS M10_NM_DADO, 'A' AS M10_TP_DADO, "&_
               " '0' AS M10_TP_CONSULTA, NULL AS M12_TP_EXIBIR_EXPORT, NULL AS M10_CD_BROKER "&_
               " FROM BROKER.DBO.TTP_DOCTO_DIGITALIZADO "&_
               " WHERE IN_ENVIA_WEB = 1 "&_
               "   AND CD_PRODUTO IN ('" & cd_menu & "', 'AM')" &_
               "   AND 'arq_' + RIGHT('0000' + CONVERT(VARCHAR, CD_TIPO_DOCTO), 4) NOT IN "&_ 
               " (SELECT M14_CD_CAMPO FROM M14_VIEW_CAMPO ( NOLOCK ) WHERE M14_CD_VIEW = '" & cd_view &  "')"	
	
'Response.Redirect("../import/teste.asp?var1="&sql_F&"")

	sql_o = "ORDER BY TP_CAMPO, M10_NM_DADO"
	sql = sql_s&sql_f&sql_arq&sql_o				
'Response.Redirect("../import/teste.asp?var1="&tp_exibir_Export&"")

	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
            If objrs.Fields.Item("M10_TP_DADO").Value = "A" Then
			    color = "#FF0000;"
			    nm_campo_rel = "(FILE) " & objrs.Fields.Item("M10_NM_DADO").Value
            Else
                color = "#000000;"
			    nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
            End If
		End If
%>
                        <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close

%>
                      
                      </select>
                       <br>
                      <span class="style2"><%=tx_lang_001044(cd_lang) %></span></td>
                      </div>
                      <%	
	'seleciona os campos utilizados na personalização
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT M12_CD_CAMPO, RTRIM(M10_NM_DADO) AS M10_NM_DADO, M14_NR_ORDEM, M10_TP_DADO, M10_CD_BROKER, M12_TP_EXIBIR_EXPORT "&_
		" FROM M14_VIEW_CAMPO (NOLOCK) "&_
		" INNER JOIN M12_CAMPO (NOLOCK) ON (M14_CD_CAMPO = M12_CD_CAMPO)"&_
		" INNER JOIN M10_DADOS (NOLOCK) ON (M12_CD_DADO = M10_CD_DADO)"&_
		" WHERE M14_CD_VIEW = "& fnc_QuotedSQL(cd_view) &_
		" AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
		" AND M12_IN_ATIVO = 1 "&_
		" AND M10_IN_ATIVO = 1 "&_
		" UNION "&_
		" SELECT DISTINCT M14_CD_CAMPO + '_' + M14_TP_KPI_AUX AS CD_CAMPO, '(KPI) ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(M14_CD_CAMPO,4,4)) "&_
		" + ' x ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(M14_CD_CAMPO,4)) AS NM_CAMPO, M14_NR_ORDEM, 'X', NULL, NULL"&_
		" FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view & "' AND LEFT(M14_CD_CAMPO,3) = 'KPI' "&_
        " UNION "&_
        " SELECT M14_CD_CAMPO, '(FILE) ' + (SELECT UPPER(NM_TIPO_DOCTO) FROM BROKER.DBO.TTP_DOCTO_DIGITALIZADO WHERE ID_TABELA IN (1652005462) AND CD_TIPO_DOCTO = CONVERT(INT, RIGHT(LTRIM(RTRIM(M14_CD_CAMPO)), 4))) AS M10_NM_DADO, "&_
        " M14_NR_ORDEM, 'A', NULL, NULL "&_
        " FROM M14_VIEW_CAMPO WHERE M14_CD_VIEW = '" & cd_view &  "' "&_
        " AND LEFT(M14_CD_CAMPO,3) = 'ARQ' "&_
		" ORDER BY M14_NR_ORDEM"

        'Response.write sql
        'Response.end
							
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	%>
	
                     
                    <td width="4%"><div id="divAddTodos"><br>
                      <a href="#" onClick="combo_altera(document.frmview.campo,document.frmview.array_campo,true);"><img id src="/imagens/30/arrow_dir.gif" border="0px" alt="<%= tx_lang_TF021(cd_lang)%>"></a><br></div>
                      <div id="divAddTodosDes" style="display:none">
                      <br>
                      <img id src="/imagens/30/arrow_dir_des.gif" border="0px" alt="<%= tx_lang_TF046(cd_lang)%>"></a><br></div>                     
                      <img src="/imagens/lay_all.gif" border="0px" height="5"><br>
                      <a href="#" onClick="combo_altera(document.frmview.array_campo,document.frmview.campo,true);"><img src="/imagens/30/arrow_esq.gif" border="0px" alt="<%= tx_lang_TF023(cd_lang)%>"></a>
					  <br>
                                            <br>
					</td>
                    <td width="44%">
                    <div id="divCamposSelecionados">
                    <select size=10 name="array_campo" onDblClick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);" class="select" style="width: 250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
												<%
	Do While Not objrs.Eof
	  If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If Not Session("cargo_interno") = "1" Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			If (objrs.Fields.Item("M10_TP_DADO").Value = "X") Then
			color = "#CAA637;"
            nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
                If objrs.Fields.Item("M10_TP_DADO").Value = "A" Then
			      color = "#FF0000;"
                Else
			      color = "#000000;"                  
                End If
                nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			End If		
		End If
%>
                     <%If objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value=tp_exibir_Export or objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value=2 or isnull(objrs.Fields.Item("M12_TP_EXIBIR_EXPORT").Value)  then %>   <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option><%End If%>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
%>
                      </select>
                      <input type="hidden" name="contador_file" value="<%= contador_arquivos%>">
                      <br>
                      <span class="style2"><%=tx_lang_001045(cd_lang)%></span>
                      </div>
                      </td>
                    <td width="8%" align="left"><a href="#" onClick="movimenta(true,'array_campo');"><img src="/imagens/30/arrow_cima.gif" border="0px" alt="<%= tx_lang_TF024(cd_lang)%>"></a><br>
                    <img src="/imagens/lay_all.gif" border="0px" height="3"><br>
                    <a href="#" onClick="movimenta(false,'array_campo');"><img src="/imagens/30/arrow_baixo.gif" border="0px" alt="<%= tx_lang_TF025(cd_lang)%>"></a></td>
                  </tr>
              </table>
              </td>
            </tr>
            <tr>
							<td height="30"colspan="3" align="left">
                            <font size="2"><br><b><%=tx_lang_001046(cd_lang) %></b></font><br>
  <img src="/imagens/30/barra_tracking<%=barra_tracking %>.gif"  width="565" border="0"><br>                       
								</td>
						</tr>
<tr>
              <td class="label" colspan="3" >
              <table border="0" >
              <tr>
              <td>
              <label for="ocorre" style="font-weight:bold;"><%=tx_lang_001056(cd_lang) %></label>&nbsp;
                <input type="checkbox" name="freq_ocorre_todos" id="freq_ocorre_todos" value="1" <%If freq_ocorre_todos = "1" Then %>checked <%End If%>onclick="alteraOcorre(this);"><%=tx_lang_001047(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_seg" id="freq_ocorre_seg" value="1" <%If freq_ocorre_seg = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001048(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_ter" id="freq_ocorre_ter" value="1" <%If freq_ocorre_ter = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001049(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_qua" id="freq_ocorre_qua" value="1" <%If freq_ocorre_qua = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001050(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_qui" id="freq_ocorre_qui" value="1" <%If freq_ocorre_qui = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001051(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_sex" id="freq_ocorre_sex" value="1" <%If freq_ocorre_sex = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001052(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_sab" id="freq_ocorre_sab" value="1" <%If freq_ocorre_sab = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001053(cd_lang)%>&nbsp;&nbsp;
                <input type="checkbox" name="freq_ocorre_dom" id="freq_ocorre_dom" value="1" <%If freq_ocorre_dom = "1" Then %>checked <%End If%> onclick="alteraOcorre(this);"><%=tx_lang_001054(cd_lang)%>
               </td>
            </tr>            
            <tr align="center">
              <td>
              <br />
              <label for="DiasFreqDiaria" style="font-weight:bold;"><%=tx_lang_001057(cd_lang)%></label>&nbsp;
              <input class="editbox" type="text" name="dias_freq_ocorre" id="dias_freq_ocorre" onkeyup="alteraOcorre(this);" style="width: 150px;" maxlength="20" <%If fnc_TestaVar(dias_freq_ocorre) Then %>value="<%=dias_freq_ocorre%>"<%Else%>value=""<%End If %>>&nbsp;&nbsp;(separar os dias por <strong>";"</strong>)
                </td>
              </tr>   
              <tr align="center">
              <td>
              <label for="freqDiaria" style="font-weight:bold;"><%=tx_lang_001055(cd_lang)%></label>&nbsp;
              <input class="editbox" type="text" name="hr_freq_ocorre" id="hr_freq_ocorre" style="width: 150px;" maxlength="20" <%If fnc_TestaVar(hr_freq_ocorre) Then %>value="<%=hr_freq_ocorre%>"<%Else%>value="00:01"<%End If %>>&nbsp;&nbsp;(separar os horários por <strong>";"</strong>) <br /><span style="margin-left:-40px;">(formato: <strong>HH:MM</strong>)</span>
                </td>
              </tr>
              </table>
              </td>
            </tr>  
            <%
End If
objrsx.Close
%>
            <tr align="center">
				<%'Response.write array_campo
                'Response.end%>
              <td colspan="3" height="30" valign="bottom"><input type="hidden" name="in_acao" value="<%= in_tipo%>">
          <input type="hidden" name="quantidade_campos" id="quantidade_campos" value="<%=quantidade_campos %>"> 
          <input type="hidden" name="quantidade_file" id="quantidade_file" value="<%=quantidade_file %>"> 
          <input type="hidden" name="in_cd_grupo_view" id="in_cd_grupo_view" value="<%= in_cd_grupo_view%>"> 
          <input type="hidden" name="in_cd_cliente_view" id="in_cd_cliente_view" value="<%=in_cd_cliente_view %>"> 
          <input type="hidden" name="in_cd_modal_view" id="in_cd_modal_view" value="<%=in_cd_modal_view %>">           
          <input type="hidden" name="in_cd_unid_view" id="in_cd_unid_view" value="<%=in_cd_unid_view %>">
          <input type="hidden" name="in_cd_area_view" id="in_cd_area_view" value="<%=in_cd_area_view %>"> 
          <input type="hidden" name="in_cd_celula_view" id="in_cd_celula_view" value="<%=in_cd_celula_view %>"> 
          <input type="hidden" name="in_cd_transp_view" id="in_cd_transp_view" value="<%=in_cd_transp_view %>"> 
          <input type="hidden" name="in_cd_armador_view" id="in_cd_armador_view" value="<%=in_cd_armador_view %>"> 
          <input type="hidden" name="in_cd_importador_view" id="in_cd_importador_view" value="<%=in_cd_importador_view %>"> 
          <input type="hidden" name="cd_grupo_view_aux" id="cd_grupo_view_aux" value="<%= cd_grupo_view_aux%>"> 
          <input type="hidden" name="cd_cliente_view_aux" id="cd_cliente_view_aux" value="<%=cd_cliente_view_aux %>"> 
          <input type="hidden" name="cd_modal_view_aux" id="cd_modal_view_aux" value="<%=cd_modal_view_aux %>"> 
          <input type="hidden" name="cd_unid_view_aux" id="cd_unid_view_aux" value="<%=cd_unid_view_aux %>">  
          <input type="hidden" name="cd_area_view_aux" id="cd_area_view_aux" value="<%=cd_area_view_aux %>"> 
          <input type="hidden" name="cd_celula_view_aux" id="cd_celula_view_aux" value="<%=cd_celula_view_aux %>"> 
          <input type="hidden" name="cd_transp_view_aux" id="cd_transp_view_aux" value="<%=cd_transp_view_aux %>"> 
          <input type="hidden" name="cd_armador_view_aux" id="cd_armador_view_aux" value="<%=cd_armador_view_aux %>"> 
          <input type="hidden" name="cd_importador_view_aux" id="cd_importador_view_aux" value="<%=cd_importador_view_aux %>"> 
          <input type="hidden" name="cd_view" value="<%= cd_view%>">
          <input type="hidden" name="cd_menu" value="<%= cd_menu%>">
          <input type="hidden" name="cd_subm" value="<%= cd_subm%>">
          <input type="hidden" name="cd_user" value="<%= cd_user%>">
          <input type="hidden" name="cd_campo" value="<%= array_campo%>">
          <input type="hidden" name="cd_filtro" value="<%= array_filtro%>">
          <input type="submit" id="btn_cadastrar" name="btn_cadastrar" class="button" value="" onMouseOver="<%= script_campo & script_filtro%>" style="background-image:url('/imagens/cadastrar2<%If cd_lang=1 Then%>e<%End If%>.gif');background-repeat:no-repeat;border:0px;width:95px;height:28px;background-position:center;vertical-align:bottom;">
          <%If in_tipo <> "incluir" and Len(nm_page) > 0 Then
          link_enviar_email = nm_page&"_busca.asp?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm & "&enviar_agora=1"
%>
        <a href="<%= nm_page&"_busca.asp?cd_view="& cd_view &"&cd_menu="& cd_menu &"&cd_subm="& cd_subm%>"><img border=0 src="/imagens/30/relatorio2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:history.back();" style="cursor:pointer;"></a>
        <img border=0 src="/imagens/30/enviar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" style="cursor:pointer;" onClick="javascript:window.open('<%=link_enviar_email%>','download','top=100,left=20,width=200,height=100,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');"> 
        <%End If %>      
<img border=0 src="/imagens/30/kpi2.gif" align="middle"  onClick="javascript:ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape' ,1);" style="cursor:pointer;">
 <img border=0 src="/imagens/30/cancelar2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:document.location='/default.asp';" style="cursor:pointer;">
                <%
If in_tipo = "alterar"  Then
%>
         <img border=0 src="/imagens/30/excluir2<%If cd_lang=1 Then%>e<%End If%>.gif" align="middle" onClick="javascript:ExcluiRelatorio();" style="cursor:pointer;">
               <%
End If%>
        </td>
            </tr>
          </form>
        </table>
      </div>
      <!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
    </td>
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