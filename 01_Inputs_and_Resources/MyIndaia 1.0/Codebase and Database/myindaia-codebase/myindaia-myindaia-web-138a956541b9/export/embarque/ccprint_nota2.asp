<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
cd_menu  = Request.QueryString("cd_menu")
cd_subm  = Request.QueryString("cd_subm")
cd_docto = Request.QueryString("cd_docto")
in_email = Request.QueryString("in_email")
cd_grupo = Request.QueryString("cd_grupo")
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<%If in_email <> "1" Then %>
<!--#include virtual="/includes/inc_execs.asp"-->
<%Else
  Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
  if objrsx.State = adStateOpen then objrsx.Close()
  sql = "SELECT MASTER.DBO.FN_DESCRIPROGRAFA('" & Request("cod1") & "') AS RAP"  
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText 

  Session("GrupoUsuario") = Right(objrsx.Fields.Item("RAP").Value, 3)
  vNrRap = Left(objrsx.Fields.Item("RAP").Value, 8)
  if objrsx.State = adStateOpen then objrsx.Close()
End If

dim vNrCde, vVolume, vTpStatus, vDtStatus, vHrStatus, vNmTransp, contador

if not fnc_TestaVar(vNrRap) then tx_erro = " - Código da Instrução não definido;\n"

function fncSelecionaLogo(nTipo)
	vReturn = "logo_sg2.jpg"
	fncSelecionaLogo = vReturn
end function

function fncExibeForma(nTipo)
	if not fnc_TestaVar(nTipo) then nTipo = -1
	select case nTipo
		case 0 vReturn = " Gr&aacute;fica"
		case 1 vReturn = " A Remeter"
		case else vReturn = ""
	end select
	fncExibeForma = vReturn
end function

sql = "SELECT CD_RAP, CD_RAP_ANO, CD_STATUS, CD_USUARIO_CANC, CD_USUARIO_FIM, CD_USUARIO_CRIADOR, DT_INSERCAO, DT_CANCELADO, DT_FINALIZADO,CD_CLIENTE,CD_EMBARCADOR,CD_DEP_COLETA,NM_DEP_COLETA_1,CD_FABRICANTE,CD_EXPORTADOR, NR_FORNECIMENTO, R.CD_VIA_TRANSPORTE, "&_

			"  ISNULL((SELECT RTRIM(NM_EMPRESA) FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = R.CD_CLIENTE), '') AS NM_CLIENTE, "&_
            "  ISNULL((SELECT RTRIM(NM_AGENTE) FROM TAGENTE (NOLOCK) WHERE CD_AGENTE = R.CD_EMBARCADOR), '') AS NM_EMBARCADOR, "&_
			"  ISNULL((SELECT RTRIM(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = R.CD_VIA_TRANSPORTE), '') AS NM_VIA_TRANSPORTE, "&_
			"  CD_INCOTERM, ISNULL(NR_FORNECIMENTO, '') AS NR_FORNECIMENTO, ISNULL(NR_CDE, '') AS NR_CDE, "&_
			"  ISNULL(REPLACE(NR_NOTAS_FISCAIS,';',', '), '') AS NR_NOTAS_FISCAIS, ISNULL(VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO, ISNULL(NR_BIG_BAGS, 0) AS NR_BIG_BAGS, ISNULL(NR_BIG_BAGS_PALLETS, 0) AS NR_BIG_BAGS_PALLETS, "&_
			"  ISNULL(VL_QTD_VOL, 0) AS VL_QTD_VOL, ISNULL(NR_CAIXAS, 0) AS NR_CAIXAS, ISNULL(NR_PALLETS, 0) AS NR_PALLETS, ISNULL(NR_JUMBOS, 0) AS NR_JUMBOS, ISNULL(NR_PACOTES, 0) AS NR_PACOTES, ISNULL(REPLACE(NR_EASY,';',', '),'') AS NR_EASY "&_
			"FROM TRAP R (NOLOCK) "&_
			"WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"&_
			" AND CD_GRUPO ='" & Session("GrupoUsuario") & "'"
objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

'**********************************************************************************************************
		if objrsx.State = adStateOpen then objrsx.Close()
		sql = "select NM_USUARIO from tusuario WHERE CD_USUARIO='"&objrs.Fields.Item("CD_USUARIO_CRIADOR").Value&"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'**********************************************************************************************************

vl_heigth = 20
'vNrCde = objrs.Fields.Item("NR_CDE").Value
vNrCde=objrs.Fields.Item("CD_RAP").Value&objrs.Fields.Item("CD_RAP_ANO").Value 'FLAVIO 14/01/2008
if fnc_TestaVar(vNrCde) then
	vNrCde = Replace(Trim(vNrCde),"/","")
	vNrCde = Left(vNrCde, Len(vNrCde)-2) &"/"& Right(vNrCde, 2)
else
	vNrCde = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;"
end if

select case objrs.Fields.Item("CD_VIA_TRANSPORTE").Value
	case "04"
		vNmTransp = "Retira"
	case "07"
        vNmTransp = objrs.Fields.Item("NM_EMBARCADOR").Value
    case "01"
		If objrs.Fields.Item("CD_INCOTERM").Value = "EXW" Then
		  vNmTransp = "Retira"
	    Else
          if objrs.Fields.Item("CD_EXPORTADOR").Value = "01877" or objrs.Fields.Item("CD_INCOTERM").Value = "01878" Then
            vNmTransp = "Retira"
          Else
		    vNmTransp = "Sigma"
          End If
        End If
end select



%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<style type='text/css'>
body {
font-family: Verdana, Arial, Helvetica;
color: #000000;
background-color: #FFFFFF;
margin: 0px;
padding: 0px;
font-size: 8px;
overflow: auto;
}
fieldset {
	border: #CCCCCC 1px solid;
	height: 100%;
	width: 99%;
	padding: 5px;
}"
legend {"
	font-weight:bold;
}"
.c1 {"
	border:dotted #DDDDDD;
	border-width: 0px 0px 1px 0px;
font-size: 10px;
}
.c2 {
	border:dotted #DDDDDD;
	border-width: 0px 1px 1px 0px;
font-size: 10px;
}
.titulo {
font-size: 12px;
font-weight: bold;
text-align: center;
}
.pgridsub {
	color: #000000;
	font-size: 8px;
	border-style: dotted;
	border-color: #333333;
	border-width: 1px 0px 0px 0px;
}
.pgridtit {
	font-size: 8px;
	color: #000000;
	font-weight: bold;
	text-align: center;
	border-style: dotted;
	border-color: #333333;
	border-width: 1px 0px 0px 0px;
}

.div1
{
display:block;
width:600px;
padding-left:30px;
padding-right:30px;
white-space: normal; 
}

.div2
{
display:block;
width:80px;
float:left;
height:350px;
}
</style>
</head>
<body>
<table width="650px" style="border:2px solid #000000;vertical-align:top;">
<tr>
  <td>
    <div style="display:block;width:600px;">
      <img src="\imagens\logo_sg2.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label style="font-size:15pt">Controle de Despachos</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">CDE NR.:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= vNrCde%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label style="font-size:10pt;font-weight:bold;">MODAL:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%=UCase(objrs.Fields.Item("NM_VIA_TRANSPORTE").Value)%></label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">CLIENTE:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= UCase(objrs.Fields.Item("NM_CLIENTE").Value)%></label>
    </div> 
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">NOTA(S) FISCAL(IS) NR(S):&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= UCase(objrs.Fields.Item("NR_NOTAS_FISCAIS").Value)%></label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">DOCTO. FATURAMENTO (EASY):&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= UCase(objrs.Fields.Item("NR_EASY").Value)%></label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">TRANSPORTADORA:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= UCase(vNmTransp)%></label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">PESO BRUTO:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%=FormatNumber(objrs.Fields.Item("VL_PESO_BRUTO").Value, 3) %></label>&nbsp;<label style="font-size:10pt;font-weight:bold;color:#000000;">KG</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">TOTAL DE VOLUME(S):&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;"><%= objrs.Fields.Item("VL_QTD_VOL").Value%></label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;"><label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_PALLETS").Value%></label><label style="width:120px">PALLET(S)</label> 
      <label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_CAIXAS").Value%></label><label style="width:120px">CX(S)</label>
      <label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_JUMBOS").Value%></label><label style="width:200px">JUMBO(S)</label><br />
      <label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_PACOTES").Value%></label><label style="width:120px">PCT(S)</label>
      <label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_BIG_BAGS").Value%></label><label style="width:120px">BIG BAG(S)</label>
      <label style="font-size:10pt;color:#0000FF;font-weight:normal;width:25px;"><%= objrs.Fields.Item("NR_BIG_BAGS_PALLETS").Value%></label><label style="width:200px">BIG BAG(S) PALLET(S)</label>
      </label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">VOLUME(S) NR(S):&nbsp;</label>
    </div>  
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;color:#0000FF;">
<%
  if objrsx.State = adStateOpen then objrsx.Close()
  sql = "SELECT COUNT(CD_VOLUME) CONTADOR "&_
  " FROM TRAP_PACK_VOLUME (NOLOCK) "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"'"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  contador = objrsx.Fields.Item("CONTADOR").Value

  '1
  if objrsx.State = adStateOpen then objrsx.Close()
   sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 1 AND 20"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <% Do While Not objrsx.eof %>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <%
  objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop%>
  </div>
  <%'2
  If contador > 20 Then
   if objrsx.State = adStateOpen then objrsx.Close()
   sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 21 AND 40"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <%Do While Not objrsx.eof%>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <%objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop
  End If%>
  </div>
  <%'3
  If contador > 40 Then
  If objrsx.State = adStateOpen then objrsx.Close()
  sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 41 AND 60"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <%Do While Not objrsx.eof%>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <%objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop
  End If%>
  </div>
  <%'4
  If contador > 60 Then
  If objrsx.State = adStateOpen then objrsx.Close()
  sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 61 AND 80"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <%Do While Not objrsx.eof%>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <% objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop
  End If%>
  </div>
  <%'5
  If contador > 80 Then
  If objrsx.State = adStateOpen then objrsx.Close()
  sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 81 AND 100"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <%Do While Not objrsx.eof%>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <%objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop
  End If%>
  </div>
  <%'6
  If contador > 100 Then
  If objrsx.State = adStateOpen then objrsx.Close()
  sql = " SELECT CD_VOLUME, CONTADOR "&_
  " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
  " FROM TRAP_PACK_VOLUME "&_
  " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
  " WHERE CONTADOR BETWEEN 101 AND 120"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
  <div class="div2" >
  <% Do While Not objrsx.eof%>
  <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
  <%objrsx.MoveNext
  If objrsx.eof Then Exit Do
  Loop
  End If    
   %>
   </div>
   <%'7
   If contador > 120 Then
   If objrsx.State = adStateOpen then objrsx.Close()
   sql = " SELECT CD_VOLUME, CONTADOR "&_
   " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
   " FROM TRAP_PACK_VOLUME "&_
   " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
   " WHERE CONTADOR BETWEEN 121 AND 140"
   objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
   <div class="div2" >
   <% Do While Not objrsx.eof%>
   <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
   <%objrsx.MoveNext
   If objrsx.eof Then Exit Do
   Loop
   End If    
   %>
   </div>
   <%'8
   If contador > 140 Then
   If objrsx.State = adStateOpen then objrsx.Close()
   sql = " SELECT CD_VOLUME, CONTADOR "&_
   " FROM (SELECT CD_VOLUME, DENSE_RANK() OVER (ORDER BY CD_VOLUME) AS CONTADOR"&_
   " FROM TRAP_PACK_VOLUME "&_
   " WHERE CD_RAP+CD_RAP_ANO = '"& vNrRap &"') W"&_
   " WHERE CONTADOR BETWEEN 141 AND 160"
   objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText%>
   <div class="div2" >
   <% Do While Not objrsx.eof%>
   <%= objrsx.Fields.Item("CD_VOLUME").Value%><br />
   <%objrsx.MoveNext
   If objrsx.eof Then Exit Do
   Loop
   End If    
   %>
   </div>
      </label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">OBS:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;">&nbsp;</label>
      <br /><br />
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="div1">
      <br />
      <label style="font-size:10pt;font-weight:bold;">DATA:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <label style="font-size:10pt;font-weight:bold;">VISTO:&nbsp;</label>
      <label style="font-size:10pt;color:#0000FF;">&nbsp;</label>
      <br /><br /><br />
    </div>
  </td>
</tr>
</table> 
</body>
</html>
<script language="javascript" type="text/javascript">
<!--
    window.focus();
    print();
-->
</script>