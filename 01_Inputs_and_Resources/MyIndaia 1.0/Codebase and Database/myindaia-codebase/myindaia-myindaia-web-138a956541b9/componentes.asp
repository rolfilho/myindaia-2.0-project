<% @ Language="VBScript" %>
<% Option Explicit %>
<%
Dim theComponent(18)
Dim theComponentName(18)

' componentes
theComponent(0) = "ADODB.Connection"
theComponent(1) = "SoftArtisans.FileUp"
theComponent(2) = "AspHTTP.Conn"
theComponent(3) = "AspImage.Image"
theComponent(4) = "LastMod.FileObj"
theComponent(5) = "Scripting.FileSystemObject"
theComponent(6) = "SMTPsvg.Mailer"
theComponent(7) = "CDONTS.NewMail"
theComponent(8) = "Jmail.smtpmail"
theComponent(9) = "SmtpMail.SmtpMail.1"
theComponent(10) = "Persits.Upload.1"
theComponent(11) = "UnitedBinary.AutoImageSize"
theComponent(12) = "ASPMAIL.ASPMailCtrl.1"
theComponent(13) = "Excel.Application"
theComponent(14) = "ADODB.Stream"
theComponent(15) = "SQLDMO.SQLServer"
theComponent(16) = "SQLDMO.Login"
theComponent(17) = "Persits.MailSender"
theComponent(18) = "MyCOM.IntegraPlan"

' apelido do componente!
theComponentName(0) = "ADODB"
theComponentName(1) = "SA-FileUp"
theComponentName(2) = "AspHTTP"
theComponentName(3) = "AspImage"
theComponentName(4) = "LastMod"
theComponentName(5) = "FileSystemObject"
theComponentName(6) = "Mailer"
theComponentName(7) = "CDONTS"
theComponentName(8) = "JMail"
theComponentName(9) = "SMTP"
theComponentName(10) = "Persits Upload"
theComponentName(11) = "AutoImageSize"
theComponentName(12) = "ASPMail"
theComponentName(13) = "Excel"
theComponentName(14) = "Stream"
theComponentName(15) = "SQL"
theComponentName(16) = "SQL Login"
theComponentName(17) = "MailSender"
theComponentName(18) = "Integração"

Function IsObjInstalled(strClassString)
  On Error Resume Next
  IsObjInstalled = False
  Dim xTestObj
  Set xTestObj = Server.CreateObject(strClassString)
  If Err.Number = 0 Then IsObjInstalled = True
  Set xTestObj = Nothing
  on error goto 0
End Function
%>
<html>
<head>
<title>Componentes encontrados - www.asparena.eti.br</title>
</head>
<body>
<table>
  <tr>
    <td align="center"><b>Componentes instalados:</b></td>
  </tr>
  <tr>
    <td>
      <table border="1" bordercolordark="#CCCCCC" bordercolorlight="#666666">
        <% 
Dim i
For i=0 to UBound(theComponent)
  If Not IsObjInstalled(theComponent(i)) Then

  Else
		Response.Write "<tr>" & vbCrLf
		Response.Write "<td width=""100%"" bgcolor=""#999999"" style=""padding: 0px 4px 0px 4px;"">" & vbCrLf
		Response.Write "<b>" & theComponentName(i) & "</b>" & vbCrLf
		Response.Write "</td>" & vbCrLf
		Response.Write "</tr>" & vbCrLf
  End If
Next 
%>
      </table>
    </td>
  </tr>
</table>
</body>
</html>