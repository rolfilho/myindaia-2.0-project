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
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('220') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2) "&_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"&_	
	" UNION ALL"&_
	" SELECT"&_
	" 'EUR'  as MOEDA,"&_
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('978') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2) "&_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'IENE' as MOEDA,"&_
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('470') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2) "&_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'GBP' as MOEDA,"&_
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('540') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2) "&_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'BRL' as MOEDA,"&_
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('790') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2) "&_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"&_
	" UNION ALL"&_
	" SELECT"&_
	" 'CHF' as MOEDA,"&_
	" REPLACE(TX_CAMBIO,'.',',') AS TAXA"&_
	" FROM broker.dbo.TTAXA_CAMBIO"&_
	" where CD_MOEDA in ('425') and DT_INICIO_VIGENCIA=case when datepart(weekday,getdate())=2 then  convert (date, GETDATE()-2)" &_
	" when month(getdate()) = 9 and day(getdate())=9 and datepart(weekday,getdate()) IN (4,5,6) then  convert (date, GETDATE())"&_
	" else convert (date, (select case when count(dt_feriado) > 0 then convert(date, GETDATE()-1) else convert(date, GETDATE()) end from broker.dbo.tferiado where convert(date,dt_feriado) = convert(date, GETDATE()-1))) end"
	rs.Open sql, cnn,1,1

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
