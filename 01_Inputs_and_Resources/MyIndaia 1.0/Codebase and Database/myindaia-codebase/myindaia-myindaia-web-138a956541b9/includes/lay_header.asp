<%
'------------------------------------------------------------------
'Sistema MyIndaia - Layout do Sistema
'Arquivo de Script e HTML: Menu Topo
'
'Criado: 27/06/2005
'Autor: Alexandre Gonçalves Neto
'Modificado: 05/10/2006
'------------------------------------------------------------------
Dim tx_url_lang 'texto contendo a url de mudança de idioma
Dim tx_url_qrys 'texto contendo as variaveis passadas na url
Dim h1, h2,h3,h4,m1,m2, caminho_imagem

if Session("login_valido") Then
   If objrsx.State = adStateOpen Then objrsx.Close
    sql = "UPDATE BROKER.DBO.TUSUARIO SET DT_ULTIMA_ACAO = GETDATE() WHERE CD_USUARIO = '" & Session("cd_usuario") & "'"
    objcnn.Execute(sql)
    If objrsx.State = adStateOpen Then objrsx.Close
End If

If Session("in_valida") and Session("confere_importador") <> 1 and Session("cd_cargo") = "088" Then
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	If objrsx.State = adStateOpen Then objrsx.Close
    sql = " SELECT TOP 1 CD_GRUPO AS GRUPO "&_
   	" FROM TPERMISSAO_EMPRESA_EST PE "&_
    " INNER JOIN TEMPRESA_EST_GRUPO EG ON EG.CD_EMPRESA = PE.CD_EMPRESA "&_
    " WHERE CD_USUARIO ='" & Session("cd_usuario") & "'"
    Objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly,adCmdText

    Session("grupo_imagem") = Objrsx.Fields.Item("GRUPO").Value
	caminho_imagem = Server.MapPath("/imagens/30/logos_importadores/")

	Set objfolder = objFSO.GetFolder(caminho_imagem)
	Session("importador_valido") = 0
	For Each tx_arquivo in objfolder.Files
		If tx_arquivo.Name = Session("grupo_imagem") & ".jpg" Then
			Session("importador_valido") = 1
		End If
	Next	
	
	Session("confere_importador") = 1
	Objrsx.Close
	Set objFSO = Nothing
End If

If Session("cd_cargo") = "088" and Session("importador_valido") = 1 Then
    m1 = "50%"
	m2 = "50%"
	h1 = "25%"
	h2 = "0%"
	h3 = "25%"
	h4 = "50%"
Else
    m1 = "40%"
	m2 = "60%"
    h4 = "0%"
	If in_btn_lupa Then
            h1 = "0%"
		    h2 = "60%"
		    h3 = "38%"
	Else
		h1 = "45%"
		h2 = "0%"
		h3 = "45%"
	End if
End If

tx_url_qrys = Trim(Request.QueryString)
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="<%= m1%>" height="66" background="/imagens/30/fundo_logo_site2.jpg"><a href="/default.asp" /><img src="/imagens/30/logo_site2.jpg"  border="0"  alt="<%= tx_lang_D00001(cd_lang)%>"/></a></td>
		<td width="<%= m2%>" background="/imagens/30/fundo_logo_site2.jpg" ><%
If Session("in_valida") Then
%>
	  <table height="100%" border="0" cellspacing="0" cellpadding="0" align="right">
				<tr>
					<td width="<%= h1 %>">					<%
	'exibe o icone para ferar o resultado em excel
	If in_btn_excel Then
	If cd_menu & cd_subm = "1203" Then%>
    <a href="#" onClick="javascript:window.open('<%= tx_path_excel%>.asp<%= url_mais%>','download','top=100,left=20,width=250,height=175,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');" class="botao"><img src="/imagens/30/btn_excel_mais.gif"border="0" alt="<%= tx_lang_D00002(cd_lang)%> (Exibindo os processos)"></a>
    <%Else%>
<a href="#" onClick="javascript:window.open('<%= tx_path_excel%>.asp<%= url%>','download','top=100,left=20,width=250,height=175,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');" class="botao"><img src="/imagens/30/btn_excel.gif"border="0" alt="<%= tx_lang_D00002(cd_lang)%>"></a>
				  <%End If
	End If%></td>
    <td width="<%= h2 %>">					<%
	'exibe o icone para ferar o resultado em excel
	If in_btn_lupa and Session("cd_cargo") <> "088" Then%>
    <nobr><a href="#" onClick="javascript:ExibeEmail('<%=nr_processo %>');" class="botao"><img src="/imagens/30/btn_email.gif" border="0" alt="<%= tx_lang_004050(cd_lang)%>" id="imgEmail"></a>	
    <a href="#" onClick="exibeResumo('divResumo','<%= url%>');" class="botao"><img src="/imagens/30/btn_lupa_menos.gif" border="0" alt="<%= tx_lang_004072(cd_lang)%>" id="imgResumo"></a></nobr>
    <%End If%></td>
    <td width="<%= h3 %>">	<%
	If in_btn_print  Then
	If cd_menu & cd_subm = "1203" Then%>
	<a href="#" onClick="javascript:window.open('<%= tx_path_excel%>.asp<%= url_menos%>','download','top=100,left=20,width=250,height=175,scrollbars=no,menubar=yes,toolbar=yes,resizable=yes');" class="botao"><img src="/imagens/30/btn_excel_menos.gif"border="0" alt="<%= tx_lang_D00002(cd_lang)%>" ></a>
	<%Else%>
<a href="#" onClick="javascript:window.open('<%= tx_path_file%>.asp<%= url%>','imprimir','top=100,left=20,width=800,height=600,scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=no');" class="botao"><img src="/imagens/30/btn_print.gif" border="0" alt="<%= tx_lang_D00006(cd_lang)%>"></a>
				  <%End If
	End If%></td><td width="<%= h4 %>"><%
    If Session("cd_cargo") = "088" and Session("importador_valido") = 1 Then%>&nbsp;
  <img src="/imagens/30/logos_importadores/<%=Trim(Session("grupo_imagem"))%>.jpg" border="0">&nbsp;
    <%End If
   %>
 </td></tr>
	      </table>
			<%
End If
%>
		</td>
  </tr>	
  <tr >
  <td colspan="2" background="/imagens/30/fundo_logo_site<%=bg_fundo_logo %>.jpg" height="6px"></td>
  </tr>
<tr height="14" bgcolor="#DBDADA">
	<td width="84%" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='<%=bg_topo%>', endColorStr='<%=bg_topo%>', gradientType='0');" >&nbsp;<font color="<%=color_top%>" style="font-size:8pt;font-family:Verdana;"><%= fcn_Saudacao(Session("nm_usuario"))%>
    <%			
If Session("cd_cargo") = "002" Then
  Response.Write("<font color=""#336699"">Usuários Visitantes: "& Application("vl_visitas"))
  'Response.Write("Server: "& SQLSERVER &" - Database: "& SQLDATABASE &"</font>")
End If
%></font></td>
	<td width="16%" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr='<%=bg_topo%>', endColorStr='<%=bg_topo%>', gradientType='0');"><%If Session("login_valido") Then%>
	<table border="0" cellspacing="0" cellpadding="0" align="right"><tr><td>
	<nobr><a href="/logout.asp" target="_top" style="color:<%=color_bottom%>;font-weight:bold;font-size:8pt;font-family:Verdana;"><%=tx_lang_001002(cd_lang)%></a>&nbsp;&nbsp;</nobr></td></tr></table>
<%End If%>
</td>
</tr>
</table>
<%
If fnc_TestaVar(tx_url_qrys) Then
	'verifica se existe a variavel de idioma, se existir, remove da query pois pode ter um valor invalido
	If InStr(tx_url_qrys, "cd_idioma") > 1 Then tx_url_qrys = Left(tx_url_qrys, InStr(tx_url_qrys, "cd_idioma")-2)
	'verifica se o ultimo caracter é "&", se for remove ele
	If Right(tx_url_qrys, 1) = "&" Then tx_url_qrys = Left(tx_url_qrys, Len(tx_url_qrys)-1)
	'inclui a variavel de idioma sem valor definido
	tx_url_lang = script &"?"& tx_url_qrys &"&cd_idioma="
Else
	'se não tiver variaveis na url, inclui a de idioma
	tx_url_lang = script &"?cd_idioma="
End If
%>
