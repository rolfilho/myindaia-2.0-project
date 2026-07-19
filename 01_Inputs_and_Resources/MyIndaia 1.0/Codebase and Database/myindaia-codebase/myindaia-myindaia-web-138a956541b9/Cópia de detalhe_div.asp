<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Funções do sistema
'Arquivo de Script e HTML: Localiza um registro no BD
'
'Autor Kleber Guedes
'Manutenção: Alexandre(26/02/2007)
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
Dim referencia_pendencia, alt_referencia_pendencia, contador_referencia_pendencia
Dim cnnMy, cmdMy, rsMy, rsMy2
'recupera as variaveis para montagem da consulta
vInDebug = false
'monta a instrução sql
	Dim cnstr 'string de conexão
	Set cnnMy = Server.CreateObject("ADODB.Connection")
	Set cmdMy = Server.CreateObject("ADODB.Command")
	Set rsMy  = Server.CreateObject("ADODB.Recordset")
	Set rsMy2 = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA07;Initial Catalog=MYINDAIA;"&_
					"User ID=MYINDAIAWEB;Password=myindaiaweb;"
	On error resume next
	cnnMy.Open cnstr
	'Response.Redirect("../IMPORT/teste.asp?var1="&usuario&"")

	'str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	'cnnBroker.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	cmdMy.ActiveConnection = cnnMy
	
	Select Case Request("mostra_pendencia")
	Case 1 
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT DISTINCT CONVERT(VARCHAR,MAX(PL.DT_TEXTO),103)+ ' ' + CONVERT(VARCHAR,MAX(PL.DT_TEXTO),108) AS DT_ULTIMA, U.NM_USUARIO AS NM_USUARIO, P.NM_PENDENCIA AS NM_PENDENCIA, P.NR_PROCESSO AS NR_PROCESSO, PL.CD_PENDENCIA AS CD_PENDENCIA "&_
		"FROM TPROCESSO_PENDENCIAS_LOG PL "&_
		"INNER JOIN TPROCESSO_PENDENCIAS P ON (PL.CD_PENDENCIA = P.CD_PENDENCIA AND PL.NR_PROCESSO = P.NR_PROCESSO) "&_
		"INNER JOIN TUSUARIO U ON (U.CD_USUARIO = P.CD_USUARIO_SOLICITANTE) "&_
		"WHERE PL.CD_USUARIO_PARA = '" & Session("cd_usuario") & "' "&_
		"  AND P.CD_STATUS = '2' "&_
		"  AND P.IN_ATIVO = '1' "&_
		"GROUP BY P.CD_PENDENCIA, U.NM_USUARIO, P.NM_PENDENCIA, P.NR_PROCESSO, PL.CD_PENDENCIA "
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText3
		
		if rsMy.RecordCount > 0 Then
		%>
		<table width="746" border="0" cellspacing="2" cellpadding="0">
						<tr>
							<td valign="top" style="border: solid 1px #336699;">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
		<tr class="gridtop" height="16">
										<td style="text-align:center;">&nbsp;Última alteração</td>
										<td style="text-align:center;">&nbsp;Pendência</td>
										<td style="text-align:center;">&nbsp;Pedido</td>
										<td style="text-align:center;">&nbsp;Solicitante</td>
										<td style="text-align:center;">&nbsp;</td>
		</tr>
		<%
		Do While Not rsMy.eof
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
				If rsMy2.State = adStateOpen Then rsMy2.Close()
				sql = "SELECT DISTINCT LTRIM(RTRIM(CD_REFERENCIA)) + '/' + RTRIM(LTRIM(NR_ITEM_PO)) AS REFERENCIA " &_
				" FROM TREF_CLIENTE "&_
				" WHERE NR_PROCESSO = '" & rsMy.Fields.Item("NR_PROCESSO").Value &  "'"&_ 
				" AND TP_REFERENCIA = '01'"
				rsMy2.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
				referencia_pendencia = ""
				contador_referencia_pendencia = 1
				alt_referencia_pendencia = ""
				Do While Not rsMy2.eof
					if contador_referencia_pendencia > 3 then
						referencia_pendencia = referencia_pendencia & "..."
						alt_referencia_pendencia = alt_referencia_pendencia & rsMy2.Fields.Item("REFERENCIA").Value
						contador_referencia_pendencia = contador_referencia_pendencia + 1
					else
						referencia_pendencia = referencia_pendencia & rsMy2.Fields.Item("REFERENCIA").Value 
						alt_referencia_pendencia = alt_referencia_pendencia & rsMy2.Fields.Item("REFERENCIA").Value
						contador_referencia_pendencia = contador_referencia_pendencia + 1
					End If	
				rsMy2.MoveNext
				if rsMy2.Eof then 
				exit do 
				else 
				referencia_pendencia = referencia_pendencia & "<br>"
				alt_referencia_pendencia = alt_referencia_pendencia & vbcrlf
				end if
				Loop
				rsMy2.Close
		%>
			<tr bgcolor="<%= bgcolor%>" height="18px">	
				<td width="130px " style="text-align:left;">&nbsp;<%= rsMy.Fields.Item("DT_ULTIMA").Value%></td>
				<td width="210px" style="text-align:left;">&nbsp;<a href="#" onclick="ExibeHistorico_alert('<%= rsMy.Fields.Item("CD_PENDENCIA").Value%>','<%=rsMy.Fields.Item("NR_PROCESSO").Value%>');"><%= rsMy.Fields.Item("NM_PENDENCIA").Value%></a></td>	
				<td width="130px" style="text-align:left;" title="<%= alt_referencia_pendencia%>"><%= referencia_pendencia%></td>
				<td width="200px" style="text-align:left;">&nbsp;<%= rsMy.Fields.Item("NM_USUARIO").Value%></td>
				<td width="60px" style="text-align:center;">&nbsp;<a href="#" onclick="ExibeRep_alert('<%= rsMy.Fields.Item("CD_PENDENCIA").Value%>','<%=rsMy.Fields.Item("NR_PROCESSO").Value%>');"><img src="/imagens/icones/16x16/user4.gif" border="0" style="cursor:pointer;" alt="Repassar Pendência"></a></td>
			</tr>
		
		<%	
		rsMy.MoveNext
		if rsMy.Eof then exit do
		Loop	
		Else
			Response.write "ERRO"
		End If
	Case 0
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT COUNT (DISTINCT P.CD_PENDENCIA) AS CONTADOR FROM TPROCESSO_PENDENCIAS_LOG PL"&_
		   " INNER JOIN TPROCESSO_PENDENCIAS P ON P.CD_PENDENCIA = PL.CD_PENDENCIA"&_
		   " WHERE P.CD_STATUS = '2'"&_
		   "  AND P.IN_ATIVO = '1' "&_
		   " AND CD_USUARIO_PARA = '"& Session("cd_usuario") & "'"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
	
			If rsMy("CONTADOR") > 0 Then
				Response.write "Há " & rsMy("CONTADOR") & " pendência(s) para responder"
			Else
				Response.write "0"
			End If
	Case 2 
		Dim data_aux, font_color, texto_aux
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT P.*, CONVERT(VARCHAR, DT_TEXTO, 103) AS DT_TEXTO_DATA, CONVERT(VARCHAR, DT_TEXTO, 108) AS DT_TEXTO_HORA, U.NM_USUARIO AS NM_USUARIO "&_
        " FROM TPROCESSO_PENDENCIAS_LOG P "&_
        " INNER JOIN TUSUARIO U ON U.CD_USUARIO = P.CD_USUARIO"&_
        " WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
        " ORDER BY DT_TEXTO, CD_TEXTO "
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		data_aux = 	rsMy.Fields.Item("DT_TEXTO_DATA").Value%>
        <div id="divHistoricoTexto" >
		<font color="#FF0000"><b>(<%= Trim(data_aux)%>)</b></font><br />
		<%Do While Not rsMy.Eof%>	
			<br />
			<%If data_aux <> rsMy.Fields.Item("DT_TEXTO_DATA").Value Then%>
				<font color="#FF0000"><b>(<%= Trim(rsMy.Fields.Item("DT_TEXTO_DATA").Value)%>)</b></font><br /><br />
			<%End If%>
          <%If rsMy.Fields.Item("TP_TEXTO").Value = "I" Then font_color = "#000000" else font_color = "#008080"%>  
		<div style="padding-left:10px;padding-right:10px;"><font color="<%= font_color%>"><b>(<%= rsMy.Fields.Item("DT_TEXTO_HORA").Value%>) <%= Trim(rsMy.Fields.Item("NM_USUARIO").Value)%>:</b></font><br />
        <%texto_aux = Replace(Trim(rsMy.Fields.Item("NM_TEXTO").Value),chr(13),"<br>")%>
        
        <font color="<%= font_color%>"><%= texto_aux%></font></div>
        <%
		data_aux = 	rsMy.Fields.Item("DT_TEXTO_DATA").Value
		rsMy.MoveNext
		if rsMy.Eof then exit do
		Loop		
		%>
        <input type="text" readonly="readonly" id="auxHistoricoTexto" style="height:10px;width:1px;border-width:0px;" />
		</div>
        <script>
		document.getElementById('auxHistoricoTexto').focus();
		document.getElementById('nm_texto').focus();
		</script>
        <textarea name="nm_texto" style="width:680px;height:60px;overflow:auto;top:270px;position:absolute;" wrap="virtual" class="editbox"></textarea><input name="btn_enviar" type="button" class="button" value="OK" style="top:270px;right:10px;position:absolute;width:50px;height:60px;background-color:#b4c7db;" onclick="EnviaMensagem_alert(document.getElementById('nm_texto'),'<%= Trim(Request("cd_pendencia"))%>','<%= Trim(Request("nr_processo"))%>');"/>
        <div id="divHistoricoLegenda">
        <img src="/imagens/icones/16x16/leg_cliente.gif" width="12" height="12" border="0" style="cursor:pointer;" align="left">&nbsp;Analista Cliente&nbsp;&nbsp;<img src="/imagens/icones/16x16/leg_interno.gif" width="12" height="12" border="0" style="cursor:pointer;">&nbsp;Analista Indaiá&nbsp;</div>
		<%
	Case 3
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT MAX(CD_TEXTO)+1 AS TEXTO, P.CD_USUARIO_SOLICITANTE AS USUARIO_SOLICITANTE, P.CD_STATUS AS CD_STATUS "&_
		" FROM TPROCESSO_PENDENCIAS P"&_
		" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL ON (PL.CD_PENDENCIA = P.CD_PENDENCIA)"&_
		" WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" GROUP BY P.CD_USUARIO_SOLICITANTE, P.CD_STATUS"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		
		if rsMy.Fields.Item("CD_STATUS").Value = "2" Then
			sql = "INSERT INTO TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA,NR_PROCESSO,CD_TEXTO,TP_TEXTO,NM_TEXTO,CD_USUARIO,CD_USUARIO_PARA,DT_TEXTO) "&_
			" VALUES ("& Trim(Request("cd_pendencia")) &",'" & Trim(Request("nr_processo")) & "', " & rsMy.Fields.Item("TEXTO").Value & ", 'E', '" & Request("nm_texto") & "', '" & Session("cd_usuario") & "', '" & rsMy.Fields.Item("USUARIO_SOLICITANTE").Value & "', GETDATE()) "
			cnnMy.Execute(sql)
			
			sql = "UPDATE TPROCESSO_PENDENCIAS SET CD_STATUS = '3' WHERE CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "
			cnnMy.Execute(sql)
		Else
			Response.write "ERRO"
		End If
	Case 4
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT CD_GRUPO, CD_UNID_NEG, CD_PRODUTO FROM TPROCESSO WHERE NR_PROCESSO = '" & Trim(Request("nr_processo")) & "'"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		
		If rsMy2.State = adStateOpen Then rsMy2.Close()
		sql = "SELECT DISTINCT U.NM_USUARIO AS NOME, U.CD_USUARIO AS CODIGO "&_
			  " FROM TEMPRESA_NAC E "&_
			  " INNER JOIN TCLIENTE_CONTATO C ON (C.CD_CLIENTE = E.CD_EMPRESA) "&_
			  " INNER JOIN TUSUARIO U ON (U.CD_USUARIO = C.CD_USUARIO) "&_
			  "WHERE E.CD_GRUPO = '" & rsMy.Fields.Item("CD_GRUPO").Value & "' "&_
			  "  AND C.CD_PRODUTO = '" & rsMy.Fields.Item("CD_PRODUTO").Value & "' "&_
			  "  AND C.CD_UNID_NEG = '" & rsMy.Fields.Item("CD_UNID_NEG").Value & "' "&_
			  "  ORDER BY U.NM_USUARIO"
		rsMy2.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText	  
	%>
    <b>Escolha o usuário:</b>
    <select id="nm_contatos" name="nm_contatos" class="select" style="width:326px;border-style:0px;">
    <%
	Do While Not rsMy2.Eof
		%>
        <option value="<%= rsMy2.Fields.Item("CODIGO").Value%>"><%= rsMy2.Fields.Item("NOME").Value%></option>
		<%	
	rsMy2.MoveNext
	if rsMy2.Eof then exit do
	Loop	
	%>
    </select><br /><br /> 
    <center><input name="btn_enviar" type="button" class="button" value="OK" style="background-color:#f0f1f6;width:100px" onclick="RepassaPendencia_alert(document.getElementById('nm_contatos'),document.getElementById('nm_contatos').options[document.getElementById('nm_contatos').selectedIndex].text,'<%= Trim(Request("cd_pendencia"))%>','<%= Trim(Request("nr_processo"))%>');"/></center>
    <%	 
	Case 5
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT MAX(CD_TEXTO)+1 AS TEXTO, P.CD_USUARIO_SOLICITANTE AS USUARIO_SOLICITANTE, P.CD_STATUS AS CD_STATUS "&_
		" FROM TPROCESSO_PENDENCIAS P"&_
		" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL ON (PL.CD_PENDENCIA = P.CD_PENDENCIA)"&_
		" WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" GROUP BY P.CD_USUARIO_SOLICITANTE, P.CD_STATUS"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		if rsMy.Fields.Item("CD_STATUS").Value = "2" Then
			sql = "INSERT INTO TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA,NR_PROCESSO,CD_TEXTO,TP_TEXTO,NM_TEXTO,CD_USUARIO,CD_USUARIO_PARA,DT_TEXTO) "&_
			" VALUES ("& Trim(Request("cd_pendencia")) &",'" & Trim(Request("nr_processo")) & "', " & rsMy.Fields.Item("TEXTO").Value & ", 'E', '(Pendência repassada para " & Trim(Request("nm_contato"))  &")', '" & Session("cd_usuario") & "', '" & rsMy.Fields.Item("USUARIO_SOLICITANTE").Value & "', GETDATE()) "
			cnnMy.Execute(sql)
			
			sql = "UPDATE TPROCESSO_PENDENCIAS_LOG SET CD_USUARIO_PARA = '" & Trim(Request("cd_contato")) & "' "&_
			" WHERE CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
			" AND CD_USUARIO_PARA = '" & Session("cd_usuario") &  "'"
			cnnMy.Execute(sql)
		Else
			Response.write "ERRO"
		End If	
	End Select
	
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>