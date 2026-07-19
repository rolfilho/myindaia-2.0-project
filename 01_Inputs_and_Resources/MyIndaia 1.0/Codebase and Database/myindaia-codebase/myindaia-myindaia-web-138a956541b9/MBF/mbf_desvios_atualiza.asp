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

            if Request.QueryString("in_selecionado") = "2" Then
              sql = "UPDATE TMBF_RESULTADO SET " &_
              " IN_SELECIONADO = IN_SELECIONADO, "&_
			  " TX_OBS_DESVIO  = '" & Replace(Request.QueryString("tx_desvio"), "'", """") & "' " &_
			  " WHERE NR_PROCESSO = '" & Request.QueryString("processo") & "' "&_
              "   AND MES_RESULTADO = " & Request.QueryString("mes") & " "&_
              "   AND ANO_RESULTADO = " & Request.QueryString("ano") & " "&_
              "   AND CD_KPI = '" & Request.QueryString("kpi") & "' " &_
              "   AND CD_TP_KPI = '" & Request.QueryString("cd_tp_kpi") & "' "&_
              "   AND ID_KPI = " & Request.QueryString("id_kpi")
            Else
			  sql = "UPDATE TMBF_RESULTADO SET " &_
              " IN_SELECIONADO = '" & Request.QueryString("in_selecionado") & "', "&_
			  " TX_OBS_DESVIO  = '" & Replace(Request.QueryString("tx_desvio"), "'", """") & "' " &_
			  " WHERE NR_PROCESSO = '" & Request.QueryString("processo") & "' "&_
              "   AND MES_RESULTADO = " & Request.QueryString("mes") & " "&_
              "   AND ANO_RESULTADO = " & Request.QueryString("ano") & " "&_
              "   AND CD_KPI = '" & Request.QueryString("kpi") & "' " &_
              "   AND CD_TP_KPI = '" & Request.QueryString("cd_tp_kpi") & "' "&_
              "   AND ID_KPI = " & Request.QueryString("id_kpi")
            End If
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