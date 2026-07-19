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
<%


Dim cnnMy, cmdMy, rsMy, dados_relatorio_monitoramento
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
    If Request("tipo") = "1" Then
        If InStr(Request("processo"), ";") > 0 Then            
            dados_relatorio_monitoramento = Split(Request("processo"),";")
            sql = "INSERT INTO TALERTA_MONITORAMENTO " &_
            " SELECT DISTINCT " & dados_relatorio_monitoramento(2) & ", '" & Request("evento") & "','" & Request("usuario") & "', NULL "&_
            " FROM " & dados_relatorio_monitoramento(1) & " R (NOLOCK) "&_
            " INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = R." & dados_relatorio_monitoramento(2) &_
            " WHERE R.NR_IDENT = " & dados_relatorio_monitoramento(0) &_
            "   AND R.CD_USUARIO = '" & Request("usuario") &  "'"&_
            "   AND F.CD_EVENTO = '" & Request("evento") & "'"&_
            "   AND F.IN_APLICAVEL = '1'"&_
            "   AND F.DT_REALIZACAO IS NULL"
            cnnMy.Execute(sql)
            
            If InStr(Request("eventos_marcados"), Request("evento")) = 0 Then
                sql = "UPDATE M06_VIEW SET M06_EVENTOS_MARCADOS = ISNULL(M06_EVENTOS_MARCADOS,'') + '" & Request("evento") & ";' WHERE M06_CD_VIEW = '" & dados_relatorio_monitoramento(3) & "'"             
                cnnMy.Execute(sql)
            End If
        Else
	        sql = "INSERT INTO TALERTA_MONITORAMENTO VALUES ('" & Request("processo") & "', '" & Request("evento") & "', '" & Request("usuario") & "', NULL)"
            cnnMy.Execute(sql)
        End If
    Else
        If InStr(Request("processo"), ";") > 0 Then   
            dados_relatorio_monitoramento = Split(Request("processo"),";")         
            sql = "DELETE A "&_  
            " FROM TALERTA_MONITORAMENTO A (NOLOCK) "&_
            " INNER JOIN " & dados_relatorio_monitoramento(1) & " R (NOLOCK) ON R." & dados_relatorio_monitoramento(2) & " = A.NR_PROCESSO "&_
            " WHERE R.NR_IDENT = " & dados_relatorio_monitoramento(0) &_
            "  AND R.CD_USUARIO = '" & Request("usuario") &  "'"&_
            "  AND A.CD_EVENTO = '" & Request("evento") & "'"
            cnnMy.Execute(sql)

            sql = "UPDATE M06_VIEW SET M06_EVENTOS_MARCADOS = REPLACE(M06_EVENTOS_MARCADOS, '" & Request("evento") & ";', '') WHERE M06_CD_VIEW = '" & dados_relatorio_monitoramento(3) & "'"             
            cnnMy.Execute(sql)    
        Else
            sql = "DELETE FROM TALERTA_MONITORAMENTO WHERE NR_PROCESSO = '" & Request("processo") & "' AND CD_EVENTO = '" & Request("evento")  & "' AND CD_USUARIO = '" & Request("usuario") & "'"
            cnnMy.Execute(sql)
        End If
    End If
	    
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>