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
	" SUBSTRING(CODIGO,1,4)+'.'+SUBSTRING(CODIGO,5,2)+'.'+SUBSTRING(CODIGO,7,2) AS NCM,"&_
	" REPLACE(DESCRICAO,';',',') AS [Descrição],"&_
	" ALIQUOTA_II +'%' AS II,"&_
	" CASE"&_
	" WHEN ALIQUOTA_IPI ='NT' THEN '0%'"&_
	" ELSE ALIQUOTA_IPI +'%' END AS IPI,"&_
	" CASE"&_
	" WHEN ALIQUOTA_PIS_ADVAL IS NULL THEN '0%'"&_
	" ELSE ALIQUOTA_PIS_ADVAL +'%' END AS PIS,"&_
	" CASE"&_
	" WHEN ALIQUOTA_COFINS_ADVAL IS NULL THEN '0%'"&_
	" ELSE ALIQUOTA_COFINS_ADVAL +'%' END AS COFINS"&_
	" FROM BROKER.dbo.TNCM "

	rs.Open sql, cnn,1,1

%>
<table border="1" width="100%">
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
