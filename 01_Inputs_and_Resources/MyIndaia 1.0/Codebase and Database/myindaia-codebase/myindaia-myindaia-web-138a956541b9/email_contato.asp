<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Site Institucional: Contato
'Arquivo de Script: Envio de e-mail de contato
'Modificado por Alexandre Gonçalves Neto em 03/02/2005
Dim nm_contato
Dim nm_razao
Dim endereco
Dim cidade
Dim cep
Dim estado
Dim ddd_01
Dim fone_01
Dim email
Dim unidade
Dim assunto
Dim texto
Dim email_dest


nm_contato = Request.Form("nm_contato")
nm_razao = Request.Form("nm_razao")
endereco = Request.Form("endereco")
cidade = Request.Form("cidade")
cep = Request.Form("cep")
estado = Request.Form("estado")
ddd_01 = Request.Form("ddd_01")
fone_01 = Request.Form("fone_01")
email = Request.Form("email")
unidade = Request.Form("unidade")
assunto = Request.Form("assunto")
texto = Request.Form("texto")


select case assunto
    case "a"
    assunto = "Serviços Operacionais"
    email_dest = "fabricio.paulella@myindaia.com.br"
    
    case "b"
    assunto = "Fretes Internacionais"
    email_dest = "freight@myindaia.com.br"
    
    case "c"
    assunto = "Projetos Logísticos"
    email_dest = "willy.maxwell@myindaia.com.br"
    
    case "d"
    assunto = "Assessoria e Consultoria"
    email_dest = "fabricio.paulella@myindaia.com.br"
    
    case "e"
    assunto = "My Indaiá"
    email_dest = "vitor.zanin@myindaia.com.br"
    
    case "f"
    assunto = "Ouvidoria"
    email_dest = "rh@myindaia.com.br"

    case else
    assunto = "Sem assunto"
    email_dest = "myindaia@myindaia.com.br"    
end select  


str =       " <table width=600 align=left border=0 cellpadding=0 cellspacing=0>"

str = str & "	<tr>"
str = str & "		<td colspan=2><font face=verdana size=2 color=335687><b>Caro usuário, uma mensagem vinda diretamente do site www.myindaiaweb.com.br acabou de chegar, segue abaixo as informações:</b><br><br></td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>Assunto:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& assunto & "</td>"
str = str & "	</tr>"	

str = str & "	<tr>"
str = str & "      <td width=90><font face=verdana size=2 color=335687><b>Nome:</b></td>"
str = str &	"	   <td width=510><font face=verdana size=2 color=335687>" & nm_contato & "</td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "      <td width=90><font face=verdana size=2 color=335687><b>Empresa:</b></td>"
str = str &	"	   <td width=510><font face=verdana size=2 color=335687>" & nm_razao & "</td>"
str = str & "	</tr>"
											

str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>Endereço:</b></td>"
str = str & "	    <td><font face=verdana size=2 color=335687>"& endereco & "</td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>Cidade:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& cidade & "</td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>CEP:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& cep & "</td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>Estado:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& estado & "</td>"
str = str & "	</tr>"
				
str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>Telefone:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& ddd_01 & " - " & fone_01 & "</td>"
str = str & "	</tr>"
										
str = str & "	<tr>"
str = str & "		<td><font face=verdana size=2 color=335687><b>E-mail:</b></td>"
str = str & "		<td><font face=verdana size=2 color=335687>"& email & "</td>"
str = str & "	</tr>"

str = str & "	<tr>"
str = str & "		<td valign=top><font face=verdana size=2 color=335687><b>Mensagem:"
str = str & "		<td><font face=verdana size=2 color=335687>"& texto & "</td>"
str = str & "	</tr>"						
str = str & "	</table>"

Set objEmail = CreateObject("CDO.Message")

objEmail.From 		= "ti@myindaia.com.br"
objEmail.To 		= email_dest
objEmail.CC 		= ""
objEmail.Subject 	= assunto
objEmail.MIMEFormatted = true
objEmail.HTMLBody  	= str
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "email-smtp.us-east-1.amazonaws.com"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "AKIAIX5BPVHLHQRKEUTA"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh"
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 90
objEmail.Configuration.Fields.Update
if SQLSERVER <> "ANTUERPIA" Then
  objEmail.Send
End If
set objEmail = nothing

Response.Redirect("agradecimento.asp")
%>