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
cd_subm = Request("subm")
cd_view = Request("cd_view")
tp_exibir = Request("tp_exibir")
tipo = Request("tipo")
tipo_campo = Request("tipo_campo")
array_campo = Request("array_campo")
array_campo_aux = Replace(array_campo, ", ", "', '")
nr_max_campo = Request("nr_max_campo")


sql = "CREATE TABLE #TMP_VIEW_2 ( CD_VIEW CHAR(12), CD_CAMPO CHAR(12), TIPO INT, NR_ORDEM INT )"
objcnn.Execute(sql)


If tipo_campo = 1 Then
%>
<select class="select" size=10 name="campo" onDblClick="combo_altera(document.frmview.campo,document.frmview.array_campo,false);" style="width: 250;">
                        <%

	If objrs.State = 1 Then objrs.Close
	sql_s = "SELECT M12_CD_CAMPO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, M10_TP_DADO, M10_TP_CONSULTA,M12_TP_EXIBIR_EXPORT, M10_CD_BROKER "&_
				"FROM M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
				"WHERE M12_CD_DADO    = M10_CD_DADO "&_
				"  AND M12_CD_MENU    = '02'"&_
				"  AND M12_CD_SUBM    = '" & cd_subm & "'"&_
			"  AND M12_CD_CAMPO NOT IN ('" & array_campo_aux & "') "&_
			"  AND M12_TP_EXIBIR >= '"& tp_exibir & "'"&_
			"  AND M12_IN_ATIVO   = 1 "&_
			"  AND M10_IN_ATIVO   = 1 "

	Select Case  tipo ' se for selecionado Embarque ou pedido acrescenta....
		 Case  "0" , "1" , "3"
			sql_f = sql_f & "  AND M12_TP_EXIBIR_EXPORT IN ('"&tipo&"','2') "
	End select
'Response.Redirect("../import/teste.asp?var1="&sql_F&"")

	sql_o = " ORDER BY "& tx_lang_dado 
	sql = sql_s&sql_f&sql_o	

'Response.Redirect("../import/teste.asp?var1="&tp_exibir_Export&"")
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	
	Do While Not objrs.Eof
		If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "vdata"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			color = "vtxt"
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
    <option value="<%= objrs.Fields.Item("M12_CD_CAMPO").Value%>" class="<%= color%>"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
%>
                      </select>
                      <br>
                      <span class="style2">*   duplo-clique para incluir o campo</span>
<%Else
'if tipo_campo = 2 then
	cont = 1
	num  = 0
	str  = array_campo
	matriz = Split(str, ",", -1)
	
	Do While cont <> 0 and num <= nr_max_campo
			cont = InStr(str,",")
			If cont <> 0 Then
			sql = "INSERT INTO #TMP_VIEW_2 (CD_VIEW, CD_CAMPO, TIPO, NR_ORDEM)" &_
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
				"FROM #TMP_VIEW_2 ( NOLOCK ), M12_CAMPO ( NOLOCK ), M10_DADOS ( NOLOCK ) "&_
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
				" 'X', '5', NULL, CD_CAMPO AS CD_CAMPO, NULL, NR_ORDEM, NULL "&_
				" FROM #TMP_VIEW_2  "&_
				 " WHERE CD_VIEW = '" & cd_view & "' AND LEFT(CD_CAMPO,3) = 'KPI'"&_
				 " ORDER BY NR_ORDEM DESC"						
                 'Response.write sql
                 'Response.end
	Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	%>

<select size=10 name="array_campo" onDblClick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);" class="select" style="width: 250;">
                        <!-- <select name="array_campo" size=10 class="select" style="width: 250;" ondblclick="combo_altera(document.frmview.array_campo,document.frmview.campo,false);"> -->
												<%
	Do While Not objrs.Eof
	  If (objrs.Fields.Item("M10_TP_DADO").Value = "1") and fnc_TestaVar(objrs.Fields.Item("M10_CD_BROKER").Value) Then
			color = "#0066cc;"
			If InStr("040;055;060", Session("cd_cargo")) > 0 Then
				nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
			Else
				nm_campo_rel = "("& Trim(objrs.Fields.Item("M10_CD_BROKER").Value) &") "& objrs.Fields.Item("M10_NM_DADO").Value
			End If
		Else
			If (objrs.Fields.Item("M10_TP_DADO").Value = "X") Then
			color = "#CAA637;"
			Else
			color = "#000000;"
			End If
			nm_campo_rel = objrs.Fields.Item("M10_NM_DADO").Value
		End If
%>
                        <option value="<%= objrs.Fields.Item("CD_CAMPO").Value%>" style="color:<%= color%>;"><%= nm_campo_rel%></option>
                        <%
		objrs.MoveNext
		If objrs.Eof Then Exit Do
	Loop
	objrs.Close
%>
                      </select>
                      <br>
                      <span class="style2">*   duplo-clique para retirar o campo</span>
	<% 
End If

sql = "DROP TABLE #TMP_VIEW_2"
objcnn.Execute(sql)
%>