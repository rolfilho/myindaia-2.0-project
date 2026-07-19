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
Dim cd_usuario2, cd_cargo2
Dim cd_view2, cd_chave2, tp_exibir2, cd_menu2, cd_subm2
Dim str_filtros2, str_campos2, str_menu2, str_subm2, str_permissao2, str_campos_geral2, str_filtros_geral2
Dim cnnMy2, cmdMy2, rsMy2
vInDebug = false
'recupera as variaveis para montagem da consulta

cd_usuario2 = Request("cd_usuario")
cd_view2    = Request("cd_view")
copia_relatorio = Request("copia_relatorio")
cd_chave2   = "1"

Select Case copia_relatorio
  Case 1
    Dim cnstr 'string de conexão
	Set cnnMy2 = Server.CreateObject("ADODB.Connection")
	Set cmdMy2 = Server.CreateObject("ADODB.Command")
	Set rsMy2  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnMy2.Open cnstr
	
	if rsMy2.State = adStateOpen Then rsMy2.Close
	sql = "SELECT CD_CARGO FROM TUSUARIO WHERE CD_USUARIO = '" & cd_usuario2 & "'"
	rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
	cd_cargo2 = rsMy2.Fields.Item("CD_CARGO").Value
	
    if rsMy2.State = adStateOpen Then rsMy2.Close
	sql= "SELECT M10.M10_NM_DADO AS FILTRO "&_
		 " FROM M13_VIEW_FILTRO M13 (NOLOCK) "&_
		 " INNER JOIN M11_FILTRO M11 (NOLOCK) ON M11.M11_CD_FILTRO = M13.M13_CD_FILTRO "&_
		 " INNER JOIN M10_DADOS  M10 (NOLOCK) ON M10.M10_CD_DADO   = M11.M11_CD_DADO "&_
		 " WHERE M13.M13_CD_VIEW = '" & cd_view2 & "'"
	
	Select Case cd_cargo2
	  Case "001"
	    tp_exibir2 = 0
	  Case "040"
		tp_exibir2 = 2
	  Case "055","060" 
		tp_exibir2 = 3
      Case "088" 
		tp_exibir2 = 4
	  Case Else
		tp_exibir2 = 1
	End Select	
	
	sql = sql & " AND M11.M11_TP_EXIBIR < '" & tp_exibir2 & "'" 
	rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
	
	If rsMy2.RecordCount > 0 then
      str_filtros2 = ""
	  Do While Not rsMy2.Eof 
	    str_filtros2 = str_filtros2 & rsMy2.Fields.Item("FILTRO").Value & "<br>"    
	    rsMy2.MoveNext
		If rsMy2.Eof Then Exit Do
	  Loop
	End If   
	
	if rsMy2.State = adStateOpen Then rsMy2.Close
	sql= "SELECT M10.M10_NM_DADO AS CAMPO "&_
		 " FROM M14_VIEW_CAMPO M14 (NOLOCK) "&_
		 " INNER JOIN M12_CAMPO M12 (NOLOCK) ON M12.M12_CD_CAMPO = M14.M14_CD_CAMPO "&_
		 " INNER JOIN M10_DADOS M10 (NOLOCK) ON M10.M10_CD_DADO = M12.M12_CD_DADO "&_
		 " WHERE M14.M14_CD_VIEW = '" & cd_view2 & "'"
	
	Select Case cd_cargo2
	  Case "001"
	    tp_exibir2 = 0
	  Case "040"
		tp_exibir2 = 2
	  Case "055","060" 
		tp_exibir2 = 3
      Case "088" 
		tp_exibir2 = 4
	  Case Else
		tp_exibir2 = 1
	End Select	
	
	sql = sql & " AND M12.M12_TP_EXIBIR < '" & tp_exibir2 & "'" 
	rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
	
	If rsMy2.RecordCount > 0 then
      str_campos2 = ""
	  Do While Not rsMy2.Eof 
	    str_campos2 = str_campos2 & rsMy2.Fields.Item("CAMPO").Value & "<br>"    
	    rsMy2.MoveNext
		If rsMy2.Eof Then Exit Do
	  Loop
	End If  
	
	cd_menu2 = mid(cd_view2,6,2) 
	cd_subm2 = mid(cd_view2,8,2) 
	
	if rsMy2.State = adStateOpen Then rsMy2.Close
	sql= " SELECT M09_IN_ACESSO AS ACESSO"&_
         " FROM M09_ACESSO (NOLOCK) "&_
		 " WHERE M09_CD_MENU = '" & cd_menu2 & "'"&_
		 " AND M09_CD_SUBM = '" & cd_subm2 & "'"&_
		 " AND M09_CD_USUARIO = '" & cd_usuario2 & "'"
	rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
	
	If rsMy2.RecordCount > 0  Then
	  If rsMy2.Fields.Item("ACESSO").Value <> "1" Then
	    str_permissao2 = 1
	  Else
	    str_permissao2 = 0	
	  End If 
	Else
	   str_permissao2 = 1 
	End If
	
	If str_permissao2 = 1 Then
		if rsMy2.State = adStateOpen Then rsMy2.Close
		sql= " SELECT M01_NM_MENU AS NOME_M FROM M01_MENU WHERE M01_CD_MENU = '" & cd_menu2 & "'"
		rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
		
		str_menu2 = rsMy2.Fields.Item("NOME_M").Value
		
		if rsMy2.State = adStateOpen Then rsMy2.Close
		sql= " SELECT M02_NM_SUBM AS NOME_S FROM M02_SUBM WHERE M02_CD_SUBM = '" & cd_subm2 & "' AND M02_CD_MENU = '" & cd_menu2 & "'"
		rsMy2.Open sql, cnnMy2, adOpenStatic, adLockReadOnly, adCmdText
		
		str_subm2 = rsMy2.Fields.Item("NOME_S").Value
	
        Response.write("XXXNão foi possível copiar esta configuração de relatório!<br>O usuário escolhido não tem acesso ao menu " & Trim(str_menu2) & "\" & Trim(str_subm2) & "." )
	Else
		if (fnc_TestaVar(str_campos2) or fnc_TestaVar(str_filtros2)) then
		  If (fnc_TestaVar(str_filtros2)) then
		     str_filtros_geral2 = "<br>Filtros:<br>" & str_filtros2 
		  Else	 
		     str_filtros_geral2 = ""
		  End If
		  
		  If (fnc_TestaVar(str_campos2)) then
		     str_campos_geral2 = "<br>Campos:<br>" & str_campos2 
		  Else
		     str_campos_geral2 = ""	 
		  End If
		  
		  Response.write("O usuário escolhido não possui acesso aos dados a seguir:             <br>" & str_filtros_geral2 & str_campos_geral2 & "<br>Deseja copiar o relatório mesmo assim?")
		else
		  Response.write("Deseja realmente copiar este relatório?")
		End If  
    End If
  Case 2
    With objcmd
	  .CommandTimeOut = 9999
	  .CommandText    = "sp_view_duplica"
	  .CommandType    = adCmdStoredProc
	  .Parameters.Append = .CreateParameter("@cd_codigo" , adVarChar, adParamInput, 12, cd_view2)
	  .Parameters.Append = .CreateParameter("@cd_chave"  , adChar   , adParamInput, 1, cd_chave2)
	  .Parameters.Append = .CreateParameter("@cd_usuario", adChar   , adParamInput, 4 , cd_usuario2)
	  .Execute , , adExecuteNoRecords
    End With
End Select
%>