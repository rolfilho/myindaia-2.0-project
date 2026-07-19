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
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnMy.Open cnstr
	cmdMy.ActiveConnection = cnnMy
	
	If rsMy.State = adStateOpen Then rsMy.Close() 
		sql = " SELECT * FROM TAVISOS_WEB WHERE CD_USUARIO = '" & Request("usuario") & "' AND IN_VISUALIZADO = '0' AND CD_AVISO IS NOT NULL ORDER BY TX_ANEXO, CD_AVISO"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
	if rsMy.RecordCount > 0 Then   
        contador_div = 0 
		Do While Not rsMy.Eof %> 
             <div id="<%=Request("usuario") & rsMy.Fields.Item("CD_AVISO").Value%>" style="height:auto;width:auto;border-color:<%= topo_div%>;border-width:1px;border-style:solid;margin:10 10 10 10;"> 
            <%If fnc_TestaVar(rsMy.Fields.Item("TX_AVISO").Value) Then%>
				<div style="text-align:left;padding:10 10 10 10;height:auto;width:auto;"><%= rsMy.Fields.Item("TX_AVISO").Value%></div>
            <%
            Else
            %>
            <br>
            <%
            End If
        	If fnc_TestaVar(rsMy.Fields.Item("TX_ANEXO").Value) Then%>
				<img src="<%=rsMy.Fields.Item("TX_ANEXO").Value%>" border="0"/>
			<%End If%>
              <div style="text-align:right;height:auto;width:auto;padding:10 10 10 10;">
               <% If rsMy.Fields.Item("IN_BTN_FIXO").Value = "1" Then %>
                <input name="btn_0" type="button" class="button" value="Decidir depois" style="width:auto;" onClick="FechaAvisoDiv('<%=rsMy.Fields.Item("CD_AVISO").Value%>','<%=rsMy.Fields.Item("CD_USUARIO").Value%>');"/>
               <%End If %>   
              <% If fnc_TestaVar(rsMy.Fields.Item("TX_BTN_1").Value) Then 
                If InStr("OK;Sim", rsMy.Fields.Item("TX_BTN_1").Value) > 0 Then tamanho = "auto;" Else tamanho = "200px;"     
              %>
                <input name="btn_1" type="button" class="button" value="<%=rsMy.Fields.Item("TX_BTN_1").Value%>" style="width:<%=tamanho%>" onClick="FechaAvisoDiv('<%=rsMy.Fields.Item("CD_AVISO").Value%>','<%=rsMy.Fields.Item("CD_USUARIO").Value%>');executaAcao('<%=rsMy.Fields.Item("CD_AVISO").Value%>', '1');"/>
              <% End If %>
              <% If fnc_TestaVar(rsMy.Fields.Item("TX_BTN_2").Value) Then %>
                <input name="btn_2" type="button" class="button" value="<%=rsMy.Fields.Item("TX_BTN_2").Value%>" style="width:auto;" onClick="FechaAvisoDiv('<%=rsMy.Fields.Item("CD_AVISO").Value%>','<%=rsMy.Fields.Item("CD_USUARIO").Value%>');executaAcao('<%=rsMy.Fields.Item("CD_AVISO").Value%>', '2');"/>
              <% End If %>
              <% If fnc_TestaVar(rsMy.Fields.Item("TX_BTN_3").Value) Then %>
                <input name="btn_3" type="button" class="button" value="<%=rsMy.Fields.Item("TX_BTN_3").Value%>" style="width:auto;" onClick="FechaAvisoDiv('<%=rsMy.Fields.Item("CD_AVISO").Value%>','<%=rsMy.Fields.Item("CD_USUARIO").Value%>');executaAcao('<%=rsMy.Fields.Item("CD_AVISO").Value%>', '3');"/>
              <% End If %>
              </div>  
            </div>
            <%
            contador_div = contador_div + 1
            rsMy.MoveNext
            If rsMy.Eof Then Exit Do
		Loop    
        %>
        <input type="text" value="<%= contador_div%>" id="contador_div_<%=Request("usuario")%>" style="display:none;"/>
        <%
	Else
		Response.write "ERRO"
	End If
		
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>