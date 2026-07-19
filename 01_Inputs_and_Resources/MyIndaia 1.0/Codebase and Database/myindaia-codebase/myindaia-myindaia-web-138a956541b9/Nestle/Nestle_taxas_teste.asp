<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Usado para alimentar planilha Nestle
'
'Autor: Leandro Felipe
'Criado: 24/04/2014
'
'Manutenção: 
'---------------------------------------------------------------------------
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>

</head>
<body>

<%
Dim cnstr, novoNome
	Set cnn = Server.CreateObject("ADODB.Connection")
	Set cmd = Server.CreateObject("ADODB.Command")
	Set rs  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnn.Open cnstr
	cmd.ActiveConnection = cnn
	

	sql = "SELECT"&_
	" 'USD'  as MOEDA,"&_
	" TX_CAMBIO AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('220') and DT_INICIO_VIGENCIA=convert (date, GETDATE())"&_	
	" UNION ALL"&_
	" SELECT"&_
	" 'EUR'  as MOEDA,"&_
	" TX_CAMBIO AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('978') and DT_INICIO_VIGENCIA=convert (date, GETDATE())"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'IENE' as MOEDA,"&_
	" TX_CAMBIO AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('470') and DT_INICIO_VIGENCIA=convert (date, GETDATE())"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'GBP' as MOEDA,"&_
	" TX_CAMBIO AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('540') and DT_INICIO_VIGENCIA=convert (date, GETDATE())"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'CHF' as MOEDA,"&_
	" TX_CAMBIO AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('425') and DT_INICIO_VIGENCIA=convert (date, GETDATE())"
	rs.Open sql, cnn,1,1
	
	rs.savetofile "D:\sites\myindaia\Nestle\txt.txt",0 

%>
<table border="1">
  <tr>
  <%for each x in rs.Fields
    response.write("<th>" & x.name & "</th>")
  next%>
  </tr>
  <%do until rs.EOF%>
    <tr>
    <%for each x in rs.Fields%>
      <td><%Response.Write(x.value)%></td>
    <%next
    rs.MoveNext%>
    </tr>
  <%loop
  rs.close
  conn.close%>
</table>

</body>
</html>
