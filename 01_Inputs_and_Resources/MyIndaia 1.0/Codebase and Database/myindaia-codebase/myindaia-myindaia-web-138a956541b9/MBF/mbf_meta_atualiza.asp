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
		
				sql =  "UPDATE TMBF_RESULTADO SET NR_META = ISNULL(" & Request.QueryString("valor") & ", 0) " & _
                                         " WHERE CD_MBF       = " & Request.QueryString("mbf") & " " & _
                                         "   AND CD_USUARIO   = '" & Request.QueryString("usuario") & "'" & _
                                         "   AND CD_MODAL     = '" & Request.QueryString("modal") & "' " & _
                                         "   AND CD_ESTUFAGEM = '" & Request.QueryString("estufagem") & "' " & _
                                         "   AND CD_KPI       = '" & Request.QueryString("cd_kpi") & "'" & _
                                         "   AND TP_KPI       = '" & Request.QueryString("tp_kpi") & "'" &_
                                         "   AND NM_TP_KPI    = '" & Request.QueryString("nm_tp_kpi") & "'" 
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