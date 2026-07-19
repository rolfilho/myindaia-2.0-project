<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Funções do sistema
'Arquivo de Script e HTML: Localiza um registro no BD
'
'Autor Kleber Guedes
'Manutenção: Alexandre(26/02/2007)
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
Dim referencia_pendencia, alt_referencia_pendencia, contador_referencia_pendencia
Dim cnnMy, cmdMy, rsMy, rsMy2
'recupera as variaveis para montagem da consulta
vInDebug = false
function TempoDecorridoExtenso(minutos)
Dim int_dif_min, int_dif_hor, int_dif_dia, str_dif_tempo

  if minutos >= 1 then
    int_dif_min = minutos
  else
    int_dif_min = 1
  End If	
  int_dif_hor = 0
  int_dif_dia = 0
			
  if int_dif_min = 1440 then
     int_dif_dia = 1
     int_dif_min = 0
  else
    if int_dif_min > 1440 then
      int_dif_dia =  int_dif_min \ 1440
      int_dif_min =  int_dif_min mod 1440
      if int_dif_min = 60 then
         int_dif_hor = 1
         int_dif_min = 0
      else
        if int_dif_min > 60 then
           int_dif_hor = int_dif_min \ 60
           int_dif_min = int_dif_min mod 60
        end If
      end If
    else
      if int_dif_min = 60 then
         int_dif_hor = 1
         int_dif_min = 0
      else
        if int_dif_min > 60 then
           int_dif_hor = int_dif_min \ 60
           int_dif_min = int_dif_min mod 60
        end if
      end If
    end If
  end If
  str_dif_tempo = ""
  
  if int_dif_dia > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_dia) & " dia(s) "
  if int_dif_hor > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_hor) & " hora(s) "
  if int_dif_min > 0 then str_dif_tempo = str_dif_tempo & CStr(int_dif_min) & " minuto(s) "
  TempoDecorridoExtenso = str_dif_tempo
end function
'monta a instrução sql
	Dim cnstr 'string de conexão
	Dim min_rnd, max_rnd, num_rnd
	Set cnnMy = Server.CreateObject("ADODB.Connection")
	Set cmdMy = Server.CreateObject("ADODB.Command")
	Set rsMy  = Server.CreateObject("ADODB.Recordset")
	Set rsMy2 = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnMy.Open cnstr
	'Response.Redirect("../IMPORT/teste.asp?var1="&usuario&"")

	'str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	'cnnBroker.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	cmdMy.ActiveConnection = cnnMy
	
	If rsMy.State = adStateOpen Then rsMy.Close() 
		sql = " SELECT TX_TITULO_DICA, TX_TEXTO_DICA, NM_PATH_MANUAL, DENSE_RANK() OVER (ORDER BY CD_SISTEMAS_DICAS) AS ORDEM "&_
			  " FROM TSISTEMAS_DICAS (NOLOCK) "&_
              " WHERE CD_SISTEMAS = '16' "&_
              " ORDER BY ORDEM"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText3
		
	if rsMy.RecordCount > 0 Then
		Randomize
		min_rnd = 1
		max_rnd = rsMy.RecordCount
		'num_rnd = Int((max_rnd-min_rnd+1)*Rnd+min_rnd)
		
		num_rnd = Int(max_rnd * rnd + min_rnd)
		
		str = "ORDEM='"& num_rnd &"'"
		rsMy.find str, 0, adSearchForward
		
		If Not rsMy.Eof Then %>
		<font style='font-weight:bold;'><center><%= rsMy.Fields.Item("TX_TITULO_DICA").Value%></center></font>
        <br />
        &nbsp;<%= rsMy.Fields.Item("TX_TEXTO_DICA").Value%>
        	<%If fnc_TestaVar(rsMy.Fields.Item("NM_PATH_MANUAL").Value) Then%>
				<br /><br />
                Para saber mais, clique <a href="<%= rsMy.Fields.Item("NM_PATH_MANUAL").Value%>" style="cursor:pointer;color:#0066CC;" target="_blank"><b>aqui</b></a>.
			<%End If
		End If
	Else
		Response.write "ERRO"
	End If
		
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>