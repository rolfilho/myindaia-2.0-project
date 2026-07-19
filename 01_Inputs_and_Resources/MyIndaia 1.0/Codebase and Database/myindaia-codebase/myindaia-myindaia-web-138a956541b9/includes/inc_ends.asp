<%
'------------------------------------------------------------------
'Sistema MyIndaia - Encerramento de página
'Arquivo de Script e HTML: encerra execuções, variaveis e objetos
'
'Autor: Alexandre Gonçalves Neto
'Criado: 28/01/2005
'
'Manutenção: 22/06/2006
'------------------------------------------------------------------
time_out = Timer
If (time_out - time_in) > 10 Then
	sql = "INSERT INTO TPROCESSAMENTO ( "&_
				"  NM_PAGINA, CD_USUARIO, DT_OCORRENCIA, NR_SEGUNDOS, NR_IP, TX_NAVEGADOR ) "&_
				"VALUES ( "&_
				"  '"& Request.ServerVariables("SCRIPT_NAME") &"', "&_
				"  '"& Session("cd_usuario") &"', GETDATE(), "&_
				"   "& Replace(CStr(time_out-time_in), ",", ".") &", "&_
				"  '"& Request.ServerVariables("REMOTE_ADDR") &"', "&_
				"  '"& Request.ServerVariables("HTTP_USER_AGENT") &"')"
	'Response.write sql
	'Response.end
	objcnn.Execute(sql)
End If

If Request.ServerVariables("SERVER_NAME") = "localhost" and vInDebug Then
	Response.Write("<table width=""100%"" border=0 cellspacing=0 cellpadding=0>"&_
		"<tr><td><p style='font-family:'Courier New', Courier; font-size: 8px;'>"&_
		Session("sql_pagina") &"</p></td></tr></table>")
End If

'envia uma mensagem para o usuario, caso tenha alguma informação
If fnc_TestaVar(tx_erro) Then Call sub_MessageBox(tx_erro)
'verifica se aconteceram erros em tempo de execução.
If Err.Number <> 0 Then Call sub_ErroEnviaMail()
On Error Goto 0
'encerra conexões
Call sub_FechaConexao()
Session("sql_pagina") = Null
Response.End()
%>