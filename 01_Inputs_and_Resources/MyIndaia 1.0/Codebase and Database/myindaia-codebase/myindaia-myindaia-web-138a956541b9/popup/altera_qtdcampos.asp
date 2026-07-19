<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
dim tp_exibir
Dim tipo, tipo_campo, array_campo, nr_max_campo, array_campo_aux, total_campos
Dim sql_s, sql_f, sql_o


'recupera as variaveis para montagem da consulta
cd_menu = Request("cd_menu")
cd_subm = Request("cd_subm")
cd_view = Request("cd_view")
tp_exibir = Request("tp_exibir")
tipo = Request("tipo")
tipo_campo = Request("tipo_campo")
array_campo = Request("array_campo")
array_campo_aux = Replace(array_campo, ", ", "', '")
nr_max_campo = Request("nr_max_campo")


sql = "CREATE TABLE #TMP_VIEW ( CD_VIEW CHAR(12), CD_CAMPO CHAR(12), TIPO INT, NR_ORDEM INT )"
objcnn.Execute(sql)

'if tipo_campo = 2 then
	cont = 1
	num  = 0
	str  = array_campo
	matriz = Split(str, ",", -1)
	
	Do While cont <> 0 and num <= nr_max_campo
			cont = InStr(str,",")
			If cont <> 0 Then
			sql = "INSERT INTO #TMP_VIEW (CD_VIEW, CD_CAMPO, TIPO, NR_ORDEM)" &_
				"VALUES ( '"& Trim(cd_view) & "'" &_ 
				", '" &  Trim(Left(str, cont - 1)) & "'" &_
				", " &  tipo &_
				", " &  UBound(matriz) - num & " )"
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				objcnn.Execute(sql)
														
				num = num + 1
				str = Right(str, Len(str) - cont)					
			End If
	Loop
	
	'Response.Redirect("altera_campos.asp?tipo=" & tipo &"&cd_subm=" & cd_subm & "&cd_subm="&cd_subm&"&tp_exibir="&tp_exibir&"&cd_view="&cd_view&"&array_campo="&array_campo&"&tipo_campo=3")
	'Else
	
	If objrs.State = 1 Then objrs.Close
	sql = "SELECT RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA, CD_VIEW, CD_CAMPO, TIPO, NR_ORDEM, M10_CD_BROKER "&_
				"FROM #TMP_VIEW ( NOLOCK ), M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND CD_CAMPO   = M12_CD_CAMPO "&_
				"  AND CD_VIEW    = '" & cd_view & "'" &_
				"  AND M12_TP_EXIBIR >= '"& tp_exibir & "'"&_
				"  AND M12_IN_ATIVO   = 1 "&_
				"  AND M10_IN_ATIVO   = 1 "&_
				"  AND M12_TP_EXIBIR_EXPORT IN ('"&tipo&"','2') "&_
				" UNION "&_
				" SELECT ('(KPI) ' + (SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = SUBSTRING(CD_CAMPO,4,4))+ ' x ' "&_
				" +(SELECT RTRIM(M10_NM_DADO) AS M10_NM_DADO FROM M10_DADOS WHERE M10_CD_DADO = RIGHT(CD_CAMPO,4))) AS NM_CAMPO, "&_
				" '0', '5', NULL, CD_CAMPO AS CD_CAMPO, NULL, NR_ORDEM, NULL "&_
				" FROM #TMP_VIEW  "&_
				" WHERE CD_VIEW = '" & cd_view & "' AND LEFT(CD_CAMPO,3) = 'KPI'"&_
				" ORDER BY NR_ORDEM"	
					
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	total_campos = objrs.RecordCount

    'Response.write total_campos
    'Response.end	    
'sql = "DROP TABLE #TMP_VIEW"
'objcnn.Execute(sql)
	%>
    
<b><%= tx_lang_004061(cd_lang)%></b>&nbsp;<input name="qtd_campo" type="text" class="edtLabel" style="width:30px;text-align:center" readonly value="[<%= total_campos%>]">

