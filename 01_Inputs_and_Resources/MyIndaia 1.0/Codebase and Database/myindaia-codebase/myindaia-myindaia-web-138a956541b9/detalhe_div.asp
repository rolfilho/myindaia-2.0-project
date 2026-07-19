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
Dim cnnMy, cmdMy, rsMy, rsMy2, rsMy3
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
	Set cnnMy = Server.CreateObject("ADODB.Connection")
	Set cmdMy = Server.CreateObject("ADODB.Command")
	Set rsMy  = Server.CreateObject("ADODB.Recordset")
	Set rsMy2 = Server.CreateObject("ADODB.Recordset")
	Set rsMy3 = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=MYINDAIAWEB;Password=myindaiaweb;"
	On error resume next
	cnnMy.Open cnstr
	'Response.Redirect("../IMPORT/teste.asp?var1="&usuario&"")

	'str = "autentica.asp?tx_erro="& Server.URLEncode(Replace(tx_erro,"'",""))
	'cnnBroker.Open "File Name="&Server.MapPath("/engine")&"\myindaiaweb.udl"
	cmdMy.ActiveConnection = cnnMy
	Select Case Request("mostra_pendencia")
	Case 1
		If rsMy.State = adStateOpen Then rsMy.Close() 
		If Session("supervisa_pendencias") = "1" Then
			sql = "SELECT DISTINCT ISNULL(P.DT_SOLICITACAO,P.DT_PRIMEIRA_SOLICITACAO) AS DT_ULTIMA, U.NM_USUARIO AS NM_USUARIO, P.NM_PENDENCIA AS NM_PENDENCIA, P.NR_PROCESSO AS NR_PROCESSO, CASE P.NR_PROCESSO WHEN 'X' THEN LTRIM(RTRIM(P.NR_REFERENCIA))+'/'+LTRIM(RTRIM(P.NR_ITEM_CLIENTE))+'/'+LTRIM(RTRIM(P.NR_PARCIAL)) ELSE SUBSTRING(P.NR_PROCESSO,5,15) END AS NR_PROCESSO_REDUZIDO, P.CD_PENDENCIA AS CD_PENDENCIA, PR.CD_PRODUTO,U2.NM_USUARIO AS NM_USUARIO2, DATEDIFF(MINUTE,  ISNULL(P.DT_SOLICITACAO,P.DT_PRIMEIRA_SOLICITACAO), ISNULL(DT_RESPOSTA_SOLICITA,GETDATE())) AS DIFERENCA, P.NR_REFERENCIA, P.NR_ITEM_CLIENTE, P.NR_PARCIAL, P.CD_EMPRESA  "&_
			 "FROM TPROCESSO_PENDENCIAS P (NOLOCK) "&_
			 " INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = P.CD_USUARIO_SOLICITANTE) "&_
			 " INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = P.NR_PROCESSO OR (PR.NR_REFERENCIA = P.NR_REFERENCIA AND PR.CD_CLIENTE = P.CD_EMPRESA))   "&_
			 " INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON C.CD_CONTATO = PR.CD_CONTATO "&_
			 " AND C.CD_CLIENTE = PR.CD_CLIENTE "&_
			 " AND C.CD_PRODUTO = PR.CD_PRODUTO "&_
			 " AND C.CD_UNID_NEG = PR.CD_UNID_NEG "&_
			 " INNER JOIN TUSUARIO U2 (NOLOCK) ON (U2.CD_USUARIO = C.CD_USUARIO)"&_
			" WHERE PR.CD_GRUPO = '" & Session("GrupoUsuario2") & "' "&_
			"  AND P.CD_STATUS = '2'"&_
			"  AND P.IN_ATIVO = '1' "
			rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText3
		Else
			sql = "SELECT DISTINCT ISNULL(P.DT_SOLICITACAO,P.DT_PRIMEIRA_SOLICITACAO) AS DT_ULTIMA, U.NM_USUARIO AS NM_USUARIO, P.NM_PENDENCIA AS NM_PENDENCIA, P.NR_PROCESSO AS NR_PROCESSO, CASE P.NR_PROCESSO WHEN 'X' THEN LTRIM(RTRIM(P.NR_REFERENCIA))+'/'+LTRIM(RTRIM(P.NR_ITEM_CLIENTE))+'/'+LTRIM(RTRIM(P.NR_PARCIAL)) ELSE SUBSTRING(P.NR_PROCESSO,5,15) END AS NR_PROCESSO_REDUZIDO, P.CD_PENDENCIA AS CD_PENDENCIA, DATEDIFF(MINUTE,  ISNULL(P.DT_SOLICITACAO,P.DT_PRIMEIRA_SOLICITACAO), ISNULL(DT_RESPOSTA_SOLICITA,GETDATE())) AS DIFERENCA, P.NR_REFERENCIA, P.NR_ITEM_CLIENTE, P.NR_PARCIAL, P.CD_EMPRESA,  "&_
            " (SELECT TOP 1 CD_PRODUTO FROM TPROCESSO WHERE (NR_PROCESSO = P.NR_PROCESSO OR (NR_REFERENCIA = P.NR_REFERENCIA AND CD_CLIENTE = P.CD_EMPRESA))) AS CD_PRODUTO   "&_
            " FROM TPROCESSO_PENDENCIAS P (NOLOCK) "&_
			" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL (NOLOCK) ON (PL.CD_PENDENCIA = P.CD_PENDENCIA AND PL.NR_PROCESSO = P.NR_PROCESSO)"&_
			" INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = P.CD_USUARIO_SOLICITANTE)"&_ 
			" WHERE PL.CD_USUARIO_PARA = '" & Session("cd_usuario") & "' "&_
			"  AND P.CD_STATUS = '2' "&_
			"  AND P.IN_ATIVO = '1' "&_
			" AND DT_TEXTO = (SELECT MAX(DT_TEXTO) FROM TPROCESSO_PENDENCIAS_LOG WHERE CD_PENDENCIA = P.CD_PENDENCIA AND NR_PROCESSO = P.NR_PROCESSO AND NR_REFERENCIA = P.NR_REFERENCIA AND NR_ITEM_CLIENTE = P.NR_ITEM_CLIENTE AND NR_PARCIAL = P.NR_PARCIAL AND CD_EMPRESA = P.CD_EMPRESA) "
			rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText3
		End If

		if rsMy.RecordCount > 0 Then
		%>
		<table width="795" border="0" cellspacing="2" cellpadding="0">
						<tr>
							<td valign="top" style="border: solid 1px #336699;">
		<table width="100%" border="0" cellspacing="1" cellpadding="0">
		<tr class="gridtop" height="16">
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP101(cd_lang)%></td>
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP102(cd_lang)%></td>
										<td style="text-align:center;">&nbsp;Ref. Indaiá</td>
                                        <td style="text-align:center;">&nbsp;Pedido</td>
										<td style="text-align:center;">&nbsp;<%=tx_lang_POP103(cd_lang)%></td>
                                        <%If Session("supervisa_pendencias") = "1" Then%>
                                        <td style="text-align:center;">&nbsp;Analista Cliente</td>
										<%End If%>
                                        <td style="text-align:center;">&nbsp;Solicitação Pendente</td>
                                        <td style="text-align:center;">&nbsp;</td>
		</tr>
		<%
		Do While Not rsMy.eof
		
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		if rsMy.Fields.Item("CD_PRODUTO").Value = "01" then
				txLinkProcesso ="/Detalhe/imp_proc_result.asp?RadioGroup1=&StatusMenu=1&cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1586-0101-02&"&_
		"tp_relat=2&filtro=nr_processo&nr_processo=" & rsMy.Fields.Item("NR_PROCESSO").Value 
		else
			If rsMy.Fields.Item("CD_PRODUTO").Value = "06" Then
				txLinkProcesso = "/Detalhe/imp_proc_result.asp?cd_menu_rel=01&cd_subm_rel=01&cd_view_rel=1801-0101-01&tp_relat=2"&tp_relat&"&filtro=nr_referencia,nr_item_cliente,nr_parcial,cd_empresa&nr_referencia="&rsMy.Fields.Item("NR_REFERENCIA").Value&"&nr_item_clnte="&rsMy.Fields.Item("NR_ITEM_CLIENTE").Value&"&nr_parcial="&rsMy.Fields.Item("NR_PARCIAL").Value&"&cd_empresa="&rsMy.Fields.Item("CD_EMPRESA").Value				
			else
				txLinkProcesso ="/Detalhe/exp_proc_result.asp?cd_menu_rel=02&cd_subm_rel=01&cd_view_rel=1630-0201-03&filtro=nr_processo&nr_processo=" & rsMy.Fields.Item("NR_PROCESSO").Value
			End If	
		end if 
		
		If rsMy3.State = adStateOpen Then rsMy3.Close()
		sql = "SELECT DISTINCT RC.CD_REFERENCIA "&_
					"FROM TREF_CLIENTE RC (NOLOCK) "&_
					"WHERE RC.NR_PROCESSO = '"& rsMy.Fields.Item("NR_PROCESSO").Value  &"' AND RC.TP_REFERENCIA = '01' "&_
					"ORDER BY RC.CD_REFERENCIA"
		rsMy3.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		'agrupa todas as referencias na string para aparecerem como hint
        nr_referencia = Null
		str = Null
		If rsMy3.RecordCount > 0 Then
			nr_referencia = Trim(rsMy3.Fields.Item("CD_REFERENCIA").Value)
			Do While Not rsMy3.Eof
				str = str & Trim(rsMy3.Fields.Item("CD_REFERENCIA").Value) & vbcrlf
				rsMy3.MoveNext
				If rsMy3.Eof Then Exit Do Else str = str
			Loop
		Else
			nr_referencia = Null
			str = Null
		End If
		%>
			<tr bgcolor="<%= bgcolor%>" height="18px">	
				<td width="50px" style="text-align:left;"><nobr>&nbsp;<%= Left(rsMy.Fields.Item("DT_ULTIMA").Value,Len(rsMy.Fields.Item("DT_ULTIMA").Value)-3)%>&nbsp;</nobr></td>
				<td width="<%If Session("supervisa_pendencias") = "1" Then%>100px<%Else%>130px<%End If%>" style="text-align:left;">&nbsp;<a href="#" onclick="ExibeHistorico_alert('<%= rsMy.Fields.Item("CD_PENDENCIA").Value%>','<%=rsMy.Fields.Item("NR_PROCESSO").Value%>','<%=rsMy.Fields.Item("NR_REFERENCIA").Value%>', '<%=rsMy.Fields.Item("NR_ITEM_CLIENTE").Value%>', '<%=rsMy.Fields.Item("NR_PARCIAL").Value%>', '<%=rsMy.Fields.Item("CD_EMPRESA").Value%>');"><%= rsMy.Fields.Item("NM_PENDENCIA").Value%></a></td>	
				<td width="<%If Session("supervisa_pendencias") = "1" Then%>50px<%Else%>50px<%End If%>" style="text-align:left;"><nobr>&nbsp;<a href="<%=txLinkProcesso%>" target="_blank"><%= Trim(rsMy.Fields.Item("NR_PROCESSO_REDUZIDO").Value)%></a>&nbsp;</nobr></td>
                <td width="<%If Session("supervisa_pendencias") = "1" Then%>50px<%Else%>50px<%End If%>" style="text-align:left;" title="<%=str%>">&nbsp<a href="<%=txLinkProcesso%>" target="_blank"><%= nr_referencia%></a>&nbsp;</td>
				<td width="<%If Session("supervisa_pendencias") = "1" Then%>90px<%Else%>110px<%End If%>" style="text-align:left;">&nbsp;<%= Left(rsMy.Fields.Item("NM_USUARIO").Value, InStr(InStr(rsMy.Fields.Item("NM_USUARIO").Value," ")+1, rsMy.Fields.Item("NM_USUARIO").Value, " "))%></td>
                <%If Session("supervisa_pendencias") = "1" Then%>
                <td width="90px" style="text-align:left;">&nbsp;<%= Left(rsMy.Fields.Item("NM_USUARIO2").Value, InStr(InStr(rsMy.Fields.Item("NM_USUARIO2").Value," ")+1, rsMy.Fields.Item("NM_USUARIO2").Value, " "))%></td>
                <%End If%>
                <td width="190px" style="text-align:left;">&nbsp;<%= TempoDecorridoExtenso(rsMy.Fields.Item("DIFERENCA").Value)%></td>
				<td width="<%If Session("supervisa_pendencias") = "1" Then%>40px<%Else%>60px<%End If%>" style="text-align:center;">&nbsp;<a href="#" onclick="ExibeRep_alert('<%= rsMy.Fields.Item("CD_PENDENCIA").Value%>','<%=rsMy.Fields.Item("NR_PROCESSO").Value%>', '<%=rsMy.Fields.Item("NR_REFERENCIA").Value%>', '<%=rsMy.Fields.Item("NR_ITEM_CLIENTE").Value%>', '<%=rsMy.Fields.Item("NR_PARCIAL").Value%>', '<%=rsMy.Fields.Item("CD_EMPRESA").Value%>');"><img src="/imagens/icones/16x16/user4.gif" border="0" style="cursor:pointer;" alt="<%=tx_lang_POP104(cd_lang)%>"></a></td>
			</tr>
		
		<%	
		rsMy.MoveNext
		if rsMy.Eof then exit do
		Loop	
		%>
        </table>
           </td>
           </tr>
           </table>      
				
		<%
		Else
			Response.write "ERRO"
		End If
	Case 0
		If rsMy.State = adStateOpen Then rsMy.Close()
		If Session("supervisa_pendencias") = "1" Then
		sql = "SELECT COUNT (P.CD_PENDENCIA) AS CONTADOR FROM TPROCESSO_PENDENCIAS P (NOLOCK) "&_
		   " INNER JOIN BROKER.DBO.TPROCESSO PR (NOLOCK) ON (PR.NR_PROCESSO = P.NR_PROCESSO OR (PR.NR_REFERENCIA = P.NR_REFERENCIA AND PR.CD_CLIENTE = P.CD_EMPRESA)) "&_
		   " WHERE P.CD_STATUS = '2'"&_
		   "  AND P.IN_ATIVO = '1' "&_
		   " AND PR.CD_GRUPO = '"& Session("GrupoUsuario2") & "'"
		Else
		sql = "SELECT COUNT (P.CD_PENDENCIA) AS CONTADOR FROM TPROCESSO_PENDENCIAS P "&_
		" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL (NOLOCK) ON (PL.CD_PENDENCIA = P.CD_PENDENCIA AND PL.NR_PROCESSO = P.NR_PROCESSO AND PL.NR_REFERENCIA = P.NR_REFERENCIA AND PL.NR_ITEM_CLIENTE = P.NR_ITEM_CLIENTE AND PL.NR_PARCIAL = P.NR_PARCIAL AND PL.CD_EMPRESA = P.CD_EMPRESA)"&_
		   " WHERE P.CD_STATUS = '2'"&_
		   "  AND P.IN_ATIVO = '1' "&_
		   " AND CD_USUARIO_PARA = '"& Session("cd_usuario") & "'"&_
		   "  AND DT_TEXTO = (SELECT MAX(DT_TEXTO) FROM TPROCESSO_PENDENCIAS_LOG WHERE CD_PENDENCIA = P.CD_PENDENCIA AND NR_PROCESSO = P.NR_PROCESSO AND NR_REFERENCIA = P.NR_REFERENCIA AND NR_ITEM_CLIENTE = P.NR_ITEM_CLIENTE AND NR_PARCIAL = P.NR_PARCIAL AND CD_EMPRESA = P.CD_EMPRESA)"
		End If   
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
	
			If rsMy("CONTADOR") > 0 Then
				Response.write tx_lang_POP105(cd_lang) & rsMy("CONTADOR") & tx_lang_POP106(cd_lang)
			Else
				Response.write "0"
			End If
	Case 2 
		Dim data_aux, font_color, texto_aux
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT P.*, CONVERT(VARCHAR, DT_TEXTO, 103) AS DT_TEXTO_DATA, CONVERT(VARCHAR, DT_TEXTO, 108) AS DT_TEXTO_HORA, U.NM_USUARIO AS NM_USUARIO "&_
        " FROM TPROCESSO_PENDENCIAS_LOG P (NOLOCK) "&_
        " INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = P.CD_USUARIO"&_
        " WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " " &_
		" AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" AND P.NR_REFERENCIA = '" & Trim(Request("nr_referencia")) & "' "&_
		" AND P.NR_ITEM_CLIENTE = '" & Trim(Request("nr_item_cliente")) & "' "&_
		" AND P.NR_PARCIAL = " & Trim(Request("nr_parcial")) & " "&_
		" AND P.CD_EMPRESA = '" & Trim(Request("cd_empresa")) & "' "&_
		" ORDER BY DT_TEXTO, CD_TEXTO "
		
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText

		data_aux = 	rsMy.Fields.Item("DT_TEXTO_DATA").Value%>
        <div id="divHistoricoTexto" >
		<font color="#FF0000"><b>(<%= Trim(data_aux)%>)</b></font><br />
		<%Do While Not rsMy.Eof%>	
			<br />
			<%If data_aux <> rsMy.Fields.Item("DT_TEXTO_DATA").Value Then%>
				<font color="#FF0000"><b>(<%= Trim(rsMy.Fields.Item("DT_TEXTO_DATA").Value)%>)</b></font><br /><br />
			<%End If%>
          <%If rsMy.Fields.Item("TP_TEXTO").Value = "I" Then font_color = "#000000" else font_color = "#008080"%>  
		<div style="padding-left:10px;padding-right:10px;"><font color="<%= font_color%>"><b>(<%= rsMy.Fields.Item("DT_TEXTO_HORA").Value%>) <%= Trim(rsMy.Fields.Item("NM_USUARIO").Value)%>:</b></font><br />
        <%texto_aux = Replace(Trim(rsMy.Fields.Item("NM_TEXTO").Value),chr(13),"<br>")%>
        
        <font color="<%= font_color%>"><%= texto_aux%></font></div>
        <%
		data_aux = 	rsMy.Fields.Item("DT_TEXTO_DATA").Value
		rsMy.MoveNext
		if rsMy.Eof then exit do
		Loop		
		%>
        <input type="text" readonly="readonly" id="auxHistoricoTexto" style="height:10px;width:1px;border-width:0px;" />
		</div>
        <script>
		document.getElementById('auxHistoricoTexto').focus();
		document.getElementById('nm_texto').focus();
		</script>
        <textarea name="nm_texto" style="width:680px;height:60px;overflow:auto;top:270px;position:absolute;" wrap="virtual" class="editbox"></textarea><input name="btn_enviar" type="button" class="button" value="Enviar" style="top:270px;right:10px;position:absolute;width:50px;height:60px;background-color:#b4c7db;" onclick="EnviaMensagem_alert(document.getElementById('nm_texto'),'<%= Trim(Request("cd_pendencia"))%>','<%= Trim(Request("nr_processo"))%>', '<%= Trim(Request("nr_referencia"))%>', '<%= Trim(Request("nr_item_cliente"))%>', '<%= Trim(Request("nr_parcial"))%>', '<%= Trim(Request("cd_empresa"))%>');"/>
        <div id="divHistoricoLegenda">
        <img src="/imagens/icones/16x16/leg_cliente.gif" width="12" height="12" border="0" style="cursor:pointer;" align="left">&nbsp;<%=tx_lang_POP107(cd_lang)%>&nbsp;&nbsp;<img src="/imagens/icones/16x16/leg_interno.gif" width="12" height="12" border="0" style="cursor:pointer;">&nbsp;<%=tx_lang_POP108(cd_lang)%>&nbsp;</div>
		<%
	Case 3
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT MAX(CD_TEXTO)+1 AS TEXTO, P.CD_USUARIO_SOLICITANTE AS USUARIO_SOLICITANTE, P.CD_STATUS AS CD_STATUS "&_
		" FROM TPROCESSO_PENDENCIAS P (NOLOCK) "&_
		" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL (NOLOCK) ON (PL.CD_PENDENCIA = P.CD_PENDENCIA)"&_
		" WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " " &_
		" AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" AND P.NR_REFERENCIA = '" & Trim(Request("nr_referencia")) & "' "&_
		" AND P.NR_ITEM_CLIENTE = '" & Trim(Request("nr_item_cliente")) & "' "&_
		" AND P.NR_PARCIAL = " & Trim(Request("nr_parcial")) & " "&_
		" AND P.CD_EMPRESA = '" & Trim(Request("cd_empresa")) & "' "&_
		" GROUP BY P.CD_USUARIO_SOLICITANTE, P.CD_STATUS"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
				
		if rsMy.Fields.Item("CD_STATUS").Value = "2" Then
			sql = "INSERT INTO TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA,NR_PROCESSO, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, CD_TEXTO,TP_TEXTO,NM_TEXTO,CD_USUARIO,CD_USUARIO_PARA,DT_TEXTO) "&_
			" VALUES ("& Trim(Request("cd_pendencia")) &",'" & Trim(Request("nr_processo")) & "','" & Trim(Request("nr_referencia")) & "', '" & Trim(Request("nr_item_cliente")) & "', " & Trim(Request("nr_parcial")) & ",  '" & Trim(Request("cd_empresa")) & "', " & rsMy.Fields.Item("TEXTO").Value & ", 'E', '" & Request("nm_texto") & "', '" & Session("cd_usuario") & "', '" & rsMy.Fields.Item("USUARIO_SOLICITANTE").Value & "', GETDATE()) "
			cnnMy.Execute(sql)
			
			sql = "UPDATE TPROCESSO_PENDENCIAS SET CD_STATUS = '3', "&_
			" DT_RESPOSTA_SOLICITA = GETDATE(), CD_USUARIO_RESPOSTA_SOLICITA = '" & Session("cd_usuario") & "'"&_
			" WHERE CD_PENDENCIA =" & Trim(Request("cd_pendencia")) &_
			" AND NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
			" AND NR_REFERENCIA = '" & Trim(Request("nr_referencia")) & "' "&_
			" AND NR_ITEM_CLIENTE = '" & Trim(Request("nr_item_cliente")) & "' "&_
			" AND NR_PARCIAL = " & Trim(Request("nr_parcial")) & " "&_
			" AND CD_EMPRESA = '" & Trim(Request("cd_empresa")) & "' "												
			cnnMy.Execute(sql)
		Else
			Response.write "ERRO"
		End If
	Case 4
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT CD_GRUPO, CD_UNID_NEG, CD_PRODUTO FROM TPROCESSO WHERE NR_PROCESSO = '" & Trim(Request("nr_processo")) & "'"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
		
		
		If rsMy2.State = adStateOpen Then rsMy2.Close()
		sql = "SELECT DISTINCT U.NM_USUARIO AS NOME, U.CD_USUARIO AS CODIGO "&_
			  " FROM TEMPRESA_NAC E (NOLOCK) "&_
			  " INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON (C.CD_CLIENTE = E.CD_EMPRESA) "&_
			  " INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = C.CD_USUARIO) "&_
			  "WHERE E.CD_GRUPO = '" & rsMy.Fields.Item("CD_GRUPO").Value & "' "&_
			  "  AND C.CD_PRODUTO = '" & rsMy.Fields.Item("CD_PRODUTO").Value & "' "&_
			  "  AND C.CD_UNID_NEG = '" & rsMy.Fields.Item("CD_UNID_NEG").Value & "' "&_
			  "  ORDER BY U.NM_USUARIO"
		rsMy2.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText	  
	%>
    <b><%= tx_lang_POP109(cd_lang)%>:</b>
<select id="nm_contatos" name="nm_contatos" class="select" style="width:326px;border-style:0px;">
    <%
	Do While Not rsMy2.Eof
		%>
        <option value="<%= rsMy2.Fields.Item("CODIGO").Value%>"><%= rsMy2.Fields.Item("NOME").Value%></option>
		<%	
	rsMy2.MoveNext
	if rsMy2.Eof then exit do
	Loop	
	%>
    </select><br /><br /> 
    <center><input name="btn_enviar" type="button" class="button" value="OK" style="background-color:#f0f1f6;width:100px" onclick="RepassaPendencia_alert(document.getElementById('nm_contatos'),document.getElementById('nm_contatos').options[document.getElementById('nm_contatos').selectedIndex].text,'<%= Trim(Request("cd_pendencia"))%>','<%= Trim(Request("nr_processo"))%>','<%= Trim(Request("nr_referencia"))%>','<%= Trim(Request("nr_item_cliente"))%>','<%= Trim(Request("nr_parcial"))%>','<%= Trim(Request("cd_empresa"))%>');"/></center>
    <%	 
	Case 5
		If rsMy.State = adStateOpen Then rsMy.Close()
		sql = "SELECT MAX(CD_TEXTO)+1 AS TEXTO, P.CD_USUARIO_SOLICITANTE AS USUARIO_SOLICITANTE, P.CD_STATUS AS CD_STATUS "&_
		" FROM TPROCESSO_PENDENCIAS P (NOLOCK) "&_
		" INNER JOIN TPROCESSO_PENDENCIAS_LOG PL (NOLOCK) ON (PL.CD_PENDENCIA = P.CD_PENDENCIA)"&_
		" WHERE P.CD_PENDENCIA =" & Trim(Request("cd_pendencia")) &_
		" AND P.NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
		" AND P.NR_REFERENCIA = '" & Trim(Request("nr_referencia")) & "' "&_
		" AND P.NR_ITEM_CLIENTE = '" & Trim(Request("nr_item_cliente")) & "' "&_
		" AND P.NR_PARCIAL = " & Trim(Request("nr_parcial")) & " "&_
		" AND P.CD_EMPRESA = '" & Trim(Request("cd_empresa")) & "' "&_
		" GROUP BY P.CD_USUARIO_SOLICITANTE, P.CD_STATUS"
		rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText
				
		if rsMy.Fields.Item("CD_STATUS").Value = "2" Then
			sql = "INSERT INTO TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA,NR_PROCESSO, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, CD_TEXTO,TP_TEXTO,NM_TEXTO,CD_USUARIO,CD_USUARIO_PARA,DT_TEXTO) "&_
			" VALUES ("& Trim(Request("cd_pendencia")) &",'" & Trim(Request("nr_processo")) & "', '" & Trim(Request("nr_referencia")) & "', '" & Trim(Request("nr_item_cliente")) & "', " & Trim(Request("nr_parcial")) & ", '" & Trim(Request("cd_empresa")) & "',  " & rsMy.Fields.Item("TEXTO").Value & ", 'E', '(Pendência repassada para " & Trim(Request("nm_contato"))  &")', '" & Session("cd_usuario") & "', '" &  Trim(Request("cd_contato")) & "', GETDATE()) "
			cnnMy.Execute(sql)
			
			'If Session("supervisa_pendencias") = "1" Then
			'sql = "UPDATE TPROCESSO_PENDENCIAS_LOG SET CD_USUARIO_PARA = '" & Trim(Request("cd_contato")) & "' "&_
			'" WHERE CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "
			
			'Else
			'sql = "UPDATE TPROCESSO_PENDENCIAS_LOG SET CD_USUARIO_PARA = '" & Trim(Request("cd_contato")) & "' "&_
			'" WHERE CD_PENDENCIA =" & Trim(Request("cd_pendencia")) & " AND NR_PROCESSO = '" & Trim(Request("nr_processo")) & "' "&_
			'" AND CD_USUARIO_PARA = '" & Session("cd_usuario") &  "'"
			'End If
			'cnnMy.Execute(sql)
		Else
			Response.write "ERRO"
		End If	
	End Select
	
	if rsMy.State  = adStateOpen then rsMy.Close
	if cmdMy.State  = adStateOpen then cmdMy.Close
	if cnnMy.State  = adStateOpen then cnnMy.Close
	set rsMy = nothing
	set cmdMy = nothing
	set cnnMy = nothing
%>