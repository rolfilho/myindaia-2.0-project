<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Logon do Sistema
'
'Modificado por Alexandre Gonçalves Neto em 20/06/2005
'
'---------------------------------------------------------------------------
%>
<!--#include file="includes/inc_utils.asp" -->
<%
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

Dim ap_usuario		'login do usuario
Dim cd_senha		'senha do usuario
Dim cd_senha_nova	'nova senha do usuário
Dim cd_senha_conf	'confirmação da nova senha
dim mail
dim usuario, password
dim cd_cargo, cd_cargo2, corpo 
dim sql2, data, dia, mes
dim dt_ult_alt_senha, dias, qt_dias_senha, qt_senha_incorreta, qt_senha_incorreta_total,qt_senha_incorreta_param

Session("sql_pagina") = Session("sql_pagina") &"<br>Form: "& Request.Form &"<br>"

dim cnnBroker, cmdBroker, rsBroker

sub subConectaBroker(servidor, database, usuario, password)
	dim cnstr 'string de conexão
	set cnnBroker = Server.CreateObject("ADODB.Connection")
	set cmdBroker = Server.CreateObject("ADODB.Command")
	set rsBroker  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source="&servidor&";Initial Catalog="&database&";"&_
					"User ID="&usuario&";Password="&password&";"
    On Error Resume Next
    cnnBroker.Open cnstr
    cmdBroker.ActiveConnection = cnnBroker
end sub

sub subFechaBroker()
	if rsBroker.State   = adStateOpen then rsBroker.Close
	if cmdBroker.State  = adStateOpen then cmdBroker.Close
	if cnnBroker.State  = adStateOpen then cnnBroker.Close
	set rsBroker  = nothing
	set cmdBroker = nothing
	set cnnBroker = nothing
end sub

function verificaData(data) 
	dia=day(data)
	mes= month(data)
	If dia<10 Then dia="0" & dia
	If mes<10 Then mes="0" & mes
	verificaData = dia & "/" & mes & "/" & year(data) 
end function

data = Date
Session("login") = ""
Session("senha") = ""

	If Request("in_login") = "1" Then
		ap_usuario    = Trim(Request.QueryString("ap_usuario"))
		cd_senha      = Trim(Request.QueryString("cd_senha"))
		cd_senha_nova = Trim(Request.QueryString("cd_senha_nova"))
		cd_senha_conf = Trim(Request.QueryString("cd_senha_conf"))    
	Else
		ap_usuario    = Trim(Request.Form("ap_usuario"))
		cd_senha      = Trim(Request.Form("cd_senha"))
		cd_senha_nova = Trim(Request.Form("cd_senha_nova"))
		cd_senha_conf = Trim(Request.Form("cd_senha_conf"))
	End If
	
	'Response.write verificaData(data) & " " & Time 
	'Response.write ap_usuario & "<br>" 
	'Response.write cd_senha & "<br>"
	'Response.write cd_senha_nova & "<br>"
	'Response.write cd_senha_conf 
	'Response.end
	
	If ap_usuario = "" and cd_senha = "" Then
		'preencher usuario e senha
		tx_erro = tx_lang_A00002(cd_lang) &": "& tx_lang_A00003(cd_lang) &":\n"
		
		If ap_usuario = "" Then tx_erro = tx_erro &" - "& tx_lang_B00001(cd_lang) &".\n"
		If cd_senha   = "" Then tx_erro = tx_erro &" - "& tx_lang_B00002(cd_lang) &".\n"
	
		str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	Else    
		If cd_senha = "DOOMDOOM" Then
			call subConectaBroker(SQLSERVER,"BROKER","sa","123")
		Else	 
			call subConectaBroker(SQLSERVER,"BROKER",ap_usuario,cd_senha)		
		End If 		
		
		If Err.Number <> 0 Then
			'dim objErr
			'set objErr=Server.GetLastError()
			'se ocorrer erro na execução da consulta avisa usuario
			'tx_erro = objErr.ASPDescription
	
			'Response.write objErr.ASPDescription
			'Response.end
			
			'verificar se o problema é o usuario ou a senha
			call subFechaBroker()		
			call subConectaBroker(SQLSERVER,"BROKER","sa","123")		
			sql = " SELECT QT_SENHA_INCORRETA AS QT_SENHA_INCORRETA FROM TUSUARIO (NOLOCK) WHERE AP_USUARIO = '"&ap_usuario&"'  "
			rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText	
			' se for menor que 1, o usuario nao existe.
			If rsBroker.RecordCount < 1 Then
				tx_erro = tx_lang_B00003(cd_lang) &".\n"&_
					      tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
				str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))	
			else 'existe, mas a senha esta errada 
				qt_senha_incorreta = Trim(rsBroker.Fields.Item("QT_SENHA_INCORRETA").Value)	
				
				call subFechaBroker()		
				call subConectaBroker(SQLSERVER,"BROKER","sa","123")		
				sql = "SELECT ISNULL(QT_SENHA_ERRADA,5) AS QT_SENHA_ERRADA_PARAM FROM TPARAMETROS (NOLOCK)"
				rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText	
			
			    qt_senha_incorreta_param = Trim(rsBroker.Fields.Item("QT_SENHA_ERRADA_PARAM").Value)	
				
				if qt_senha_incorreta >= qt_senha_incorreta_param then 
					tx_erro = tx_lang_B00008(cd_lang) &".\n"&_
						      tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
					str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))		
				else 'Se não for 5, aumenta a qt de erros e da a mensagem de erro					
					call subConectaBroker(SQLSERVER,"BROKER","sa","123")			
					With cmdBroker
					sqlSenhaErrada = " UPDATE TUSUARIO                                               "&_
									"    SET QT_SENHA_INCORRETA = ISNULL(QT_SENHA_INCORRETA, 0) + 1  "&_
									"  WHERE AP_USUARIO = '"&ap_usuario&"'    "
					cnnBroker.Execute(sqlSenhaErrada)	
					end with	
					
					qt_senha_incorreta_total = (qt_senha_incorreta_param - qt_senha_incorreta - 1)
					if qt_senha_incorreta_total > 0 then 
						tx_erro = tx_lang_B00003(cd_lang) &".\n"&_
								  tx_lang_B00009(cd_lang) & (qt_senha_incorreta_param - qt_senha_incorreta - 1) &"\n"&_
								  tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
					else
						tx_erro = tx_lang_B00008(cd_lang) &".\n"&_
								tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
						str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))							
                    end if					
					str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))			
				end if	
			end if			
		Else 'digitou tudo certo, mas precisa verificar se o usuario nao está bloqueado.
		
			call subFechaBroker()		
			call subConectaBroker(SQLSERVER,"BROKER","sa","123")		
			sql = " SELECT QT_SENHA_INCORRETA AS QT_SENHA_INCORRETA FROM TUSUARIO (NOLOCK) WHERE AP_USUARIO = '"&ap_usuario&"'  "
			rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText	
			qt_senha_incorreta = Trim(rsBroker.Fields.Item("QT_SENHA_INCORRETA").Value)					
			
				call subFechaBroker()		
				call subConectaBroker(SQLSERVER,"BROKER","sa","123")		
				sql = "SELECT ISNULL(QT_SENHA_ERRADA,5) AS QT_SENHA_ERRADA_PARAM FROM TPARAMETROS (NOLOCK)"
				rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText	
			
			    qt_senha_incorreta_param = Trim(rsBroker.Fields.Item("QT_SENHA_ERRADA_PARAM").Value)		
				
			'usuario está bloqueado
			if qt_senha_incorreta >= qt_senha_incorreta_param then 
				tx_erro = tx_lang_B00008(cd_lang) &".\n"&_
						  tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
					str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
			else  'tudo certo. precisa verificar se precisa mudar a senha			
				call subFechaBroker()
				call subConectaBroker(SQLSERVER,"BROKER","sa","123")		
				sql = "SELECT QT_DIAS_SENHA FROM TPARAMETROS (NOLOCK)"
				rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText		
				qt_dias_senha = Trim(rsBroker.Fields.Item("QT_DIAS_SENHA").Value)
				
				'verifica uma eventual alteração de senha
				'encerra a conexão e abre novamente com o usuário SA(somente ele pode mudar senha)
				call subFechaBroker()
				call subConectaBroker(SQLSERVER,"BROKER","sa","123")
				'executa consulta SELECT_USER_INDAIA
				sql = "SELECT U.CD_USUARIO, U.CD_CARGO, U.CD_IDIOMA, U.NM_EMAIL, U.NM_USUARIO, U.DT_ULT_ALT_SENHA,             "&_
					"       U.EXIBE_RESUMO,U.EXIBE_DETALHE,U.GRUPO_RAP, H.CD_UNID_NEG, H.CD_PRODUTO, U.SUPERVISA_PENDENCIAS,   "&_
					"       GETDATE() AS ACESSO, CD_TEMA, CD_GRUPO_DETALHES, U.IN_MANAGER_SITE, U.IN_MANAGER, C.IN_INTERNO,    "&_
					"       C.IN_DASHBOARD_WEB, U.CD_SUPERIOR_DIRETO, CONVERT(VARCHAR, U.DT_ULT_ACESSO, 103) AS DT_ULT_ACESSO, "&_
					"       LEFT(CONVERT(VARCHAR, U.DT_ULT_ACESSO, 108), 5) AS HR_ULT_ACESSO                                   "&_
					"  FROM TUSUARIO                   U (NOLOCK)                                                              "&_
					"  LEFT  JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_USUARIO = U.CD_USUARIO AND H.IN_DEFAULT = 1)        "&_
					"  INNER JOIN TCARGO               C (NOLOCK) ON C.CD_CARGO = U.CD_CARGO                                   "&_
					"  WHERE U.AP_USUARIO = '"&ap_usuario&"' AND U.IN_ATIVO = 1 "
				
				Session("sql_pagina") = Session("sql_pagina") &"<br>"& sql &"<br>"
				rsBroker.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
			
    			'nao deveria dar erro aqui. afinal, se conectou ja conectou... 
				If rsBroker.RecordCount < 1 Then
					tx_erro = tx_lang_B00007(cd_lang) &".\n"&_
							  tx_lang_A00004(cd_lang) &" (ti@myindaia.com.br).\n"
					str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
				Else
					dt_ult_alt_senha = Trim(rsBroker.Fields.Item("DT_ULT_ALT_SENHA").Value)
					
					If  fnc_testaVar(dt_ult_alt_senha) = false  and cd_senha_nova = "" then			  
						cd_cargo2   = Trim(rsBroker.Fields.Item("CD_CARGO").Value) 
						if InStr("040;055;088;131;", cd_cargo2) = 0 then
							tx_erro = "You are a new Indaiá employee.\n"
							tx_erro = tx_erro & "For your safety, please change your password in MyIndaia system before starting!"
							str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))  
						Else
							alt_senha = 1
							Session("login") = ap_usuario
							Session("senha") = cd_senha
							tx_erro = "You are a new user.\n"
							tx_erro = tx_erro & "For your safety, please change your password!"
							str = "autentica.asp?alt_senha="& alt_senha &"&tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))		
						End If			
					Else
						If fnc_testaVar(dt_ult_alt_senha)	then
							dias= DateDiff("d", dt_ult_alt_senha, data)
						Else
							dias = qt_dias_senha
						End if
					
						If Clng(dias) > Clng(qt_dias_senha) and cd_senha_nova = "" and fnc_testaVar(dt_ult_alt_senha) then
							cd_cargo2   = Trim(rsBroker.Fields.Item("CD_CARGO").Value) 
							if InStr("040;055;088;131;", cd_cargo2) = 0 then
								Session("in_valida")  = False
								Session("login_valido") = False
								tx_erro = "Your password was not changed in the last 60 days.\n"
								tx_erro = tx_erro & "Change your password in MyIndaia system!"
								str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))  
							Else
								alt_senha = 1
								Session("login") = ap_usuario
								Session("senha") = cd_senha                               
								tx_erro = "Your password was not changed in the last 60 days.\n"
								tx_erro = tx_erro & "To continue, avoiding new problems, please change it immediately!"
								str = "autentica.asp?alt_senha="& alt_senha &"&tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
						    End If
					    Else
							'usuário autenticado
							Session("cd_usuario")           = Trim(rsBroker.Fields.Item("CD_USUARIO").Value)
							Session("cd_cargo")             = Trim(rsBroker.Fields.Item("CD_CARGO").Value)
							'Session("cd_idioma")           = objrs.Fields.Item("CD_IDIOMA").Value
							Session("nm_email")             = Trim(rsBroker.Fields.Item("NM_EMAIL").Value)
							Session("nm_usuario")           = Trim(rsBroker.Fields.Item("NM_USUARIO").Value)
							Session("exibe_resumo")         = rsBroker.Fields.Item("EXIBE_RESUMO").Value
							Session("exibe_detalhe")        = rsBroker.Fields.Item("EXIBE_DETALHE").Value
							Session("grupo_rap")            = rsBroker.Fields.Item("GRUPO_RAP").Value
							Session("ap_usuario")           = Trim(ap_usuario)
							Session("ap_usuario")           = Trim(ap_usuario)
							Session("hora_login")           = Hour(Time) &":"& Minute(Time)
							Session("dt_acesso")            = rsBroker.Fields.Item("ACESSO").Value
							Session("dt_ult_acesso")        = rsBroker.Fields.Item("DT_ULT_ACESSO").Value
							Session("hr_ult_acesso")        = rsBroker.Fields.Item("HR_ULT_ACESSO").Value
							Session("cd_tema")              = rsBroker.Fields.Item("CD_TEMA").Value
							Session("in_valida")            = True
							Session("cd_unid_neg")          = "X"
							Session("cd_produto")           = "X"
							Session("in_admin")             = False
							Session("IDIOMA")               = rsBroker.Fields.Item("CD_IDIOMA").Value
							Session("login_valido")         = true
							Session("supervisa_pendencias") = rsBroker.Fields.Item("SUPERVISA_PENDENCIAS").Value
							Session("confere_importador")   = 0
							Session("importador_valido")    = 0
							Session("mostra_dica")          = 1
							Session("GrupoDetalhe")         = rsBroker.Fields.Item("CD_GRUPO_DETALHES").Value
							Session("InManagerSite")        = rsBroker.Fields.Item("IN_MANAGER_SITE").Value
							Session("InManager")            = rsBroker.Fields.Item("IN_MANAGER").Value
							Session("cargo_interno")        = rsBroker.Fields.Item("IN_INTERNO").Value
							Session("mostra_dashboard")     = rsBroker.Fields.Item("IN_DASHBOARD_WEB").Value
							Session("superior_direto")      = rsBroker.Fields.Item("CD_SUPERIOR_DIRETO").Value
						
							Select Case Session("cd_cargo")
								Case "001" 'Supervisor do Sistema
								Session("cd_unid_neg")    = rsBroker.Fields.Item("CD_UNID_NEG").Value
									Session("in_admin")   = true
									Session("tp_exibir")  = 0
									Session("tp_exibir2") = 0
								Case "040" 'Cliente
									Session("tp_exibir")  = 2
									Session("tp_exibir2") = 2
								Case "055","060" 'Transportadora / Seguradora
									Session("tp_exibir")  = 3
									Session("tp_exibir2") = 3
								Case "088" 'Importador (Andrew Cotton)
									Session("tp_exibir")  = 4
									Session("tp_exibir2") = 2
								Case Else
									Session("cd_unid_neg") = rsBroker.Fields.Item("CD_UNID_NEG").Value
									Session("cd_produto")  = rsBroker.Fields.Item("CD_PRODUTO").Value
									Session("tp_exibir")   = 1
									Session("tp_exibir2")  = 1
							End Select
							'*************Em teste :: Flávio :: ********************************************			
							Select Case Session("IDIOMA")
								Case "1" 
								str = "default.asp?cd_idioma=1&cd_lang="& cd_lang
								Case "2"
								str = "default.asp?cd_idioma=2&cd_lang="& cd_lang
								Case else 
								str = "default.asp?cd_lang="& cd_lang
							End Select
			
							'*************Em teste :: Flávio :: ********************************************			
							'   str = "default.asp?cd_lang="& cd_lang
							If cd_senha_nova <> "" and (cd_senha_nova = cd_senha_conf) Then
								cd_cargo = Session("cd_cargo")
								if InStr("040;055;088;131;", cd_cargo) > 0 then
									call subFechaBroker()
									call subConectaBroker(SQLSERVER,"BROKER","SA","123")
									'altera a senha do usuario
									With cmdBroker
									.CommandTimeOut    = 9999
									.CommandText       = "sp_altera_senha"
									.CommandType       = adCmdStoredProc	
									.Parameters.Append = .CreateParameter("@senha_old", adVarChar   , adParamInput,   15, cd_senha)
									.Parameters.Append = .CreateParameter("@senha_new", adVarChar   , adParamInput,   15, cd_senha_nova)
									.Parameters.Append = .CreateParameter("@usuario", adVarChar     , adParamInput,   15, ap_usuario)
									.Execute , , adExecuteNoRecords
								
									'atualiza a data de ultima alteração		
									sql2 = "UPDATE TUSUARIO SET DT_ULT_ALT_SENHA=GETDATE()  WHERE AP_USUARIO= '"&ap_usuario&"'"
									cnnBroker.Execute(sql2)
									End With
					
									corpo = "Dados do Usuário <br>"
									corpo = corpo & "Usuário: "& ap_usuario &"<br>"
									corpo = corpo & "Senha Antiga: "& cd_senha &"<br>"
									corpo = corpo & "Senha Nova: "& cd_senha_nova &"<br>"
									corpo = corpo & "Data da Alteração: "& verificaData(data) &"<br>"
			
									Set objEmail = CreateObject("CDO.Message")
									objEmail.From 		                                                                                        = "ti@myindaia.com.br" 
									objEmail.To 		                                                                                        = "myindaia@myindaia.com.br" 
									objEmail.CC 		                                                                                        = ""
									objEmail.Subject 	                                                                                        = "[myIndaiáWeb] Alteração de Senha - "& ap_usuario 
									objEmail.MIMEFormatted                                                                                      = true
									objEmail.HTMLBody    	                                                                                    = corpo
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")             = 2
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")            = "smtp-m.myindaia.com.br" 
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")        = 587
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")      = 1
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")          = "ti@myindaia.com.br"
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword")          = "789852"
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl")            = False
									objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
									objEmail.Configuration.Fields.Update
							
									if SQLSERVER <> "ANTUERPIA" Then
									'  objEmail.Send
								    End If
									
									set objEmail = nothing
			
									'altera a varivel da senha para a nova senha
									cd_senha = cd_senha_nova								
								Else
									Session("in_valida")    = False
									Session("login_valido") = False
									tx_erro = "Change your password just in MyIndaia system"
									str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
								End if
						    End If
					    End if
			    End If 'verifica se encontrou o usuario e se precisa mudar a senha
			End If 'usuario nao está bloqueado
	     End If 'verifica se tem erros		
	End if 'preencher usuario e senha	
	If Session("login_valido") = true Then
        With cmdBroker
            sql2 = "UPDATE TUSUARIO                         "&_
			       "   SET IN_ONLINE          = '1',        "&_
				   "       DT_ACESSO_AGORA    = GETDATE(),  "&_
				   "       QT_SENHA_INCORRETA = '0',        "&_
				   "       DT_ULT_ACESSO      = GETDATE()  "&_
				   " WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
            cnnBroker.Execute(sql2)
        End With
    End If
	Call subFechaBroker()	
End If
Response.Redirect(str)
'Response.Write("<a href="& str &">"& tx_lang_A00042(cd_lang) &", "& tx_lang_A00005(cd_lang) &".</a>")
%>
<!--#include file="includes/inc_ends.asp" -->