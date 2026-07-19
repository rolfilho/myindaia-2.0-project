<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndai· - Detalhe de Processo
'Arquivo de Script e HTML: Documentos scaneados do processo 
'
'Autor: Alexandre GonÁalves Neto
'Criado: 04/08/2006
'
'ManutenÁ„o: 18/03/2008 Fl·vio Henrique 
'Importador n„o exibe borderÙ nem contabilidade
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%

'Site Institucional: Contato
'Arquivo de Script: Envio de e-mail de contato
'Modificado por Alexandre GonÁalves Neto em 03/02/2005
Server.ScriptTimeout = 9999
Dim nm_email, nm_email_from
Dim nm_cc
Dim assunto
Dim msg
Dim flag_arq_expo
Dim flag_arq_impo_des
Dim flag_arq_impo_adm
Dim flag_processo_novo
Dim total_contador
Dim total_contador2
Dim total_contador_while
Dim contador_for, contador_while, contador_for2
Dim texto, texto2, tx_caminho

texto = ""
texto2 = ""

nm_email = Request.Form("nm_email")
nm_cc = Request.Form("nm_cc")
assunto = Request.Form("nm_assunto")
msg = Request.Form("nm_msg")
flag_arq_expo = Request.Form("flag_arq_expo")
flag_arq_impo_des = Request.Form("flag_arq_impo_des")
flag_arq_impo_adm = Request.Form("flag_arq_impo_adm")
flag_processo_novo = Request.Form("flag_processo_novo")
total_contador = Request.Form("total_contador")
total_contador2 = Request.Form("total_contador2")
total_contador_while = Request.Form("total_contador_while")


'Response.write nm_email & "<br>"
'Response.write nm_cc & "<br>"
'Response.write assunto & "<br>"
'Response.write msg & "<br>"
'Response.write flag_arq_expo & "<br>"
'Response.write flag_arq_impo_des & "<br>"
'Response.write flag_arq_impo_adm & "<br>"
'Response.write total_contador & "<br>"
'Response.write total_contador2 & "<br>"
'Response.write total_contador_while & "<br>"
'Response.end

'if flag_processo_novo = 1 Then
'	tx_caminho = Server.MapPath("/docs_novo/"& request.querystring("nr_processo"))
'Else
'	tx_caminho = Server.MapPath("/docs/"& request.querystring("nr_processo"))
'End If	

if objrsx.State = adStateOpen Then objrsx.Close
sql = " SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO('" & request.querystring("nr_processo") & "',0) AS RESULTADO "
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
diretorio_docs = objrsx.Fields.Item("RESULTADO").Value
tx_caminho = Server.MapPath("/" & diretorio_docs & "/"& request.querystring("nr_processo"))

If flag_arq_expo = 1 Then
	For contador_for = 1 to total_contador
		If fnc_TestaVar(Request.Form("check_exp" & contador_for)) and Request.Form("check_exp" & contador_for) <> "0" Then
			texto = texto & tx_caminho & "\" & Request.Form("check_exp" & contador_for) & ";"
		End If	
	Next
End If

If flag_arq_impo_des = 1 Then
	if total_contador_while > 0 Then
		For contador_while = 1 to total_contador_while
			For contador_for = 1 to total_contador
				If fnc_TestaVar(Request.Form("check_imp_adm" & contador_while & contador_for)) and Request.Form("check_imp_adm" & contador_while & contador_for) <> "0" Then
					texto = texto & tx_caminho & "\" & Request.Form("check_imp_adm" & contador_while & contador_for) & ";"				
				End If
			Next
		Next
	End If
	If total_contador2 > 0 Then
		For contador_for2 = 1 to total_contador2
			If fnc_TestaVar(Request.Form("check_imp_des" & contador_for2)) and Request.Form("check_imp_des" & contador_for2) <> "0" Then
				texto = texto & tx_caminho & "\" & Request.Form("check_imp_des" & contador_for2) & ";"
			End If	
		Next
	End If
End If

If flag_arq_impo_adm = 1 Then
	If total_contador_while > 0 then
		For contador_while = 1 to total_contador_while
			For contador_for2 = 1 to total_contador2
				If fnc_TestaVar(Request.Form("check_imp_des" & contador_while & contador_for2)) and Request.Form("check_imp_des" & contador_while & contador_for2) <> "0" Then
					texto = texto & tx_caminho & "\" & Request.Form("check_imp_des" & contador_while & contador_for2) & ";"				
				End If
			Next
		Next
	End If
	If total_contador > 0 then
		For contador_for = 1 to total_contador - 1
			If fnc_TestaVar(Request.Form("check_imp_adm" & contador_for)) and  Request.Form("check_imp_adm" & contador_for) <> "0" Then
				texto = texto & tx_caminho & "\" & Request.Form("check_imp_adm" & contador_for) & ";"
			End If	
		Next
	End If
End If

If Not fnc_testaVar(assunto) Then
	assunto = "<Sem assunto>"
End If


nm_email_from = Session("nm_email")

if Session("InEnviaComoTi") = "1" Then
if InStr(UCase(nm_email), UCase(Session("nm_email"))) or InStr(UCase(nm_cc), UCase(Session("nm_email"))) Then
	nm_email_from = "ti@myindaia.com.br"
End If
End If

Set objEmail = CreateObject("CDO.Message")

objEmail.From 		= nm_email_from
objEmail.To 		= nm_email
objEmail.CC 		= nm_cc
objEmail.Subject 	= "[myIndai·Web Mail] " & assunto
objEmail.MIMEFormatted = true
objEmail.HTMLBody  	= msg &  "<br><br><strong>" & tx_lang_POP112(cd_lang) & "</strong>"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp-m.myindaia.com.br" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "ti@myindaia.com.br"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "789852"
While Len(texto) > 0
					texto2 = mid(texto, 1, inStr(1,texto,";")-1) 
					texto = Right(texto, Len(texto)-len(texto2)-1)

					objEmail.AddAttachment texto2
Wend
'Response.write texto2
'Response.end
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
objEmail.Configuration.Fields.Update
objEmail.Send
set objEmail = nothing

%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="350">
						<td align="center">
											    <strong><%=tx_lang_POP111(cd_lang)%></strong><br>
											    <br>
												<a href="javascript:history.back();" target="_self" style="text-decoration:none;">voltar</a>
												<br>
												
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
<%
Set mail = nothing
%>