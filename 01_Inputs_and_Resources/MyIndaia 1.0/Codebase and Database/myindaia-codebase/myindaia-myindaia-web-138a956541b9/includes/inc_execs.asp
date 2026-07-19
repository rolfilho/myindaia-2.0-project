<%
If Session("in_valida") Then
  Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
  
  If Err.Number <> 0 Then
    tx_erro = Server.URLEncode("Falha na conexão com o servidor de dados.")
		str = "document.location = '/manutencao.asp?tx_erro="&tx_erro&"';"
  End If
Else
	
	'sessões do usuário no sistema
	Session("cd_usuario") = "0627"
	Session("cd_cargo")   = "040"
	Session("nm_email")   = ""
	Session("nm_usuario") = tx_lang_C00009(cd_lang)
	Session("ap_usuario") = "guest"
	Session("in_admin")   = False
	Session("in_valida")  = False
	
	if InStr(script, "autentica") = 0 then
		tx_link = "/autentica.asp?tx_erro="
		if (InStr(script, "popup") > 0 ) or InStr(script, "detalhe") > 0 or InStr(script, "print") > 0 then
			tx_link = "window.opener.location.href='"&tx_link&"';window.close();"
		else
			tx_link = "document.location='"&tx_link&"';"
		end if
		Response.Write("<script language='javascript' type='text/javascript'>"&tx_link&"</script>")
		Response.End()
	end if
End If
%>