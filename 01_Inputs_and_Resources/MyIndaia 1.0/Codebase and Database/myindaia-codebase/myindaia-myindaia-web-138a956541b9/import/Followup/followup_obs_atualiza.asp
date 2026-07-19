<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% Response.Charset="ISO-8859-1" %>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'monta a instrução sql					
			Dim cnstr, cnnBroker, cmdBroker
			Set cnnBroker = Server.CreateObject("ADODB.Connection")
			Set cmdBroker = Server.CreateObject("ADODB.Command")
			cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
							"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
							"User ID=sa;Password=123;"
			On error resume next
			cnnBroker.Open cnstr
			cmdBroker.ActiveConnection = cnnBroker
		
				sql = "UPDATE PO SET " &_
			   " TX_OBS  = '" & Replace(Request.QueryString("obs"), "'", """") & "' " &_
			   " FROM TFLP_PO PO (NOLOCK) " &_
			   " INNER JOIN TPROCESSO P (NOLOCK) ON (P.NR_REFERENCIA = PO.NR_PROCESSO AND P.CD_CLIENTE = PO.CD_EMPRESA) " &_
			   " WHERE P.NR_PROCESSO ='" & Request.QueryString("nr_processo") & "' AND " &_
			   " PO.CD_EVENTO = '022' "
			   cnnBroker.Execute(sql) 
			   
			  
        If Err.Number = 0 Then
           Response.Write("")
        Else
            Response.Write("NAO")
        End If
        
		set cmdBroker = nothing
		set cnnBroker = nothing
		Response.end
%>
<!--#include virtual="/includes/inc_ends.asp" -->