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
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=MYINDAIAWEB;Password=myindaiaweb;"
	On error resume next
	cnnMy.Open cnstr
	'Response.Redirect("../IMPORT/teste.asp?var1="&usuario&"")

	'str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	'cnnBroker.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	cmdMy.ActiveConnection = cnnMy

		Dim data_aux, font_color, texto_aux
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT P.*, CONVERT(VARCHAR, DT_TEXTO, 103) AS DT_TEXTO_DATA, CONVERT(VARCHAR, DT_TEXTO, 108) AS DT_TEXTO_HORA, U.NM_USUARIO AS NM_USUARIO "&_
        " FROM TPROCESSO_PENDENCIAS_LOG P "&_
        " INNER JOIN TUSUARIO U ON U.CD_USUARIO = P.CD_USUARIO"&_
        " WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " " & _
		" AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" AND P.NR_REFERENCIA = '" & Trim(Request("nr_referencia")) & "' "&_
		" AND P.NR_ITEM_CLIENTE = '" & Trim(Request("nr_item_cliente")) & "' "&_
		" AND P.NR_PARCIAL = '" & Trim(Request("nr_parcial")) & "' "&_
		" AND P.CD_EMPRESA = '" & Trim(Request("cd_empresa")) & "' "&_								
        " ORDER BY DT_TEXTO, CD_TEXTO "

		
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		data_aux = 	rsMy.Fields.Item("DT_TEXTO_DATA").Value%>
		<font color="#FF0000"><b>&nbsp;(<%= Trim(data_aux)%>)</b></font><br />
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
        <script>
		document.getElementById('auxHistoricoTexto').focus();
		</script>
		<%
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>