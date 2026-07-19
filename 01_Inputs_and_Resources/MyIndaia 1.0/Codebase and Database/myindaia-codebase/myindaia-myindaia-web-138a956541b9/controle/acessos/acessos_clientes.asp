<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Entrada do Sistema
'Arquivo de Script e HTML: Página inicial após autenticação
'
'Autor: Alexandre Gonçalves Neto
'Criado: 17/06/2005
'
'Manutenção: 22/06/2006
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%

Dim cnstr, tempo_ocorrencia 'string de conexão
	Set cnnSuporte = Server.CreateObject("ADODB.Connection")
	Set cmdSuporte = Server.CreateObject("ADODB.Command")
	Set rsSuporte  = Server.CreateObject("ADODB.Recordset")
	cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=SUPORTE;"&_
					"User ID=SA;Password=123;"
	On error resume next
	cnnSuporte.Open cnstr
	cmdSuporte.ActiveConnection = cnnSuporte
	
	sql = "SELECT HR_TEMPO_PADRAO AS TEMPO FROM TUSUARIO_SUPORTE WHERE CD_USUARIO = '0013'"
	rsSuporte.Open sql, cnnSuporte, adOpenStatic, adlockReadOnly, adcmdtext
	tempo_ocorrencia = Trim(rsSuporte.Fields.Item("TEMPO").Value) 

	if rsSuporte.State  = adStateOpen then rsSuporte.Close
	if cmdSuporte.State  = adStateOpen then cmdSuporte.Close
	if cnnSuporte.State  = adStateOpen then cnnSuporte.Close
	set rsSuporte = nothing
	set cmdSuporte = nothing
	set cnnSuporte = nothing

Dim nm_email, nm_email_link, nm_usuario, det_imp, det_exp, cd_usuario 

in_comodo = "1"
in_show = false
cd_tela = "001"
nm_tela = tx_lang_002020(cd_lang)
tx_erro = Request.QueryString("tx_erro")
Request.QueryString("cd_usuario_rel")
'err.Raise "232",script,"FALHA!!!"
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
<script type="text/javascript" language="javascript">

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div_info = document.getElementById(vDiv1);
		var div_info_corpo = document.getElementById(vDiv2);
		var div_info_rodape = document.getElementById(vDiv3);
		var div_frame = document.getElementById('divFrame');
		div_info.style.display = "none";
		div_info_corpo.style.display = "none";
		div_info_rodape.style.display = "none";
		div_frame.style.visibility = "hidden";
	}	
}

function criaSolicitacao(motivo, grupo, nm_grupo){
	if (document.getElementById) {
		var ajax = openAjax();
		ajax.open("GET","/popup/cria_solicitacao.asp?nm_grupo_ocorrencia="+nm_grupo+"&cd_grupo_ocorrencia="+grupo+"&nm_motivo="+motivo, true);
		ajax.send(null); // submete
	}
	FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');
}

function ExibeDetalhes(vDiv, vDiv2, vDiv3, tipo, valor, valor2, valor3) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var flag = '<%= in_show%>'
		var x = screen.width;
		var y = screen.height;	
		
		var w = 500;
		var z = 300;
		var div_info = document.getElementById(vDiv); 
		var div_info_corpo = document.getElementById(vDiv2); 
		var div_info_rodape = document.getElementById(vDiv3); 
		var div_frame = document.getElementById('divFrame');
		
				
		var y1 = (y/5);
		var y2 = Math.round(y1);
		var y3 = ((y-y2)-z)/2;
		var y4 = Math.round(y3);
		
		if (flag == "True"){
		var x1 = ((x-250)-w)/2;
		}else{
		var x1 = ((x-10)-w)/2;
		}
		var x2 = Math.round(x1);
		//alert(div_info.style.width);
		//alert(x);//1280
		//alert(y);//1024
		div_frame.style.width = w;
		div_frame.style.height = z;
		div_frame.style.left = (x2);
		div_frame.style.top = ((y4)/2)-26;
		div_frame.style.visibility = "visible";
		div_frame.style.filter= "alpha(opacity=0)";
		
		
		div_info.style.width = w;
		div_info.style.height = 26;
		div_info.style.left = (x2);
		div_info.style.top = ((y4)/2)-26;
		div_info.style.display = "block";
		div_info.style.filter= "alpha(opacity=92)";
		
		div_info_corpo.style.width = w;
		div_info_corpo.style.height = z;
		div_info_corpo.style.left = (x2);
		div_info_corpo.style.top = ((y4)/2)-2;
		div_info_corpo.style.display = "block";
		div_info_corpo.style.filter= "alpha(opacity=91)";
		
		div_info_rodape.style.width = w;
		div_info_rodape.style.height = 26;
		div_info_rodape.style.left = (x2);
		div_info_rodape.style.top = ((y4)/2)+298;
		div_info_rodape.style.display = "block";
		div_info_rodape.style.filter= "alpha(opacity=92)";
		
		if (tipo == 0){
			var texto = "Solicito cadastro de um novo usuário"
			document.getElementById('nm_motivo').value = texto;
		}else{
			if (tipo == 1){
			var texto = "Solicito exclusão do usuário"
			document.getElementById('nm_motivo').value = texto + " " + valor;
			}else{
				if (tipo == 2){
				var texto = "Solicito exclusão da área"
				var texto2 = " do usuário "
				document.getElementById('nm_motivo').value = texto + " " + valor2 + "" + texto2 + "" + valor + "";
				}else{
					if (tipo == 3){
					var texto = "Solicito cadastro da área <Digite a área aqui> para o usuário"
					document.getElementById('nm_motivo').value = texto + " " + valor + "";
					}else{
						if (tipo == 5){
						var texto = "Solicito cadastro do menu <Digite o nome do menu aqui> do tipo " + valor3 + " para o usuário"
						document.getElementById('nm_motivo').value = texto + " " + valor + "";
						}else{
							if (tipo == 4){
							var texto = "Solicito exclusão do menu"
							var texto2 = "do usuário "
							document.getElementById('nm_motivo').value = texto + " " + valor2 + " do tipo " + valor3 + " " + texto2 + "" + valor + "";
							}else{
								if (tipo == 'X'){
								document.getElementById('nm_motivo').value = '<Digite aqui sua solicitação>';
								}
							}
						}
					}
				}
			}
		}	
		
		document.getElementById('nmSolic').focus();
	}
}
</script>

</head>
<body onLoad="document.getElementById('colunaseta').background='/imagens/30/seta.jpg';">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="table">
	<tr valign="top">
		<td height="<%= Application("vl_width_header")%>" colspan="2"><!-- :::::::::: INICIO DO CABEÇALHO :::::::::: -->
			<!--#include virtual="/includes/lay_header.asp" -->
			<!-- :::::::::: FIM DO CABEÇALHO    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td width="250" valign="top" rowspan="2"><!-- :::::::::: INICIO DO MENU PRINCIPAL :::::::::: -->
			<!--#include virtual="/includes/lay_menu.asp" -->
			<!-- :::::::::: FIM DO MENU PRINCIPAL    :::::::::: -->
		</td>
		<td width="100%" valign="top"><!-- :::::::::: INICIO DO CORPO CENTRAL :::::::::: -->
			<div id="dv_corpo" class="divMainDet">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                	<tr><td align="center"><iframe id="divFrame" src="" style="visibility: hidden; position: absolute; z-index: 2;"></iframe><div id="divInfo" class="divInfo" style="overflow:hidden;"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
	<tr height="25">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25">
					<td width="96%" align="center" valign="middle"><input type="text" id="nmSolic" name="nmSolic" style="width:2px;height:2px;background-color:#b4c7db;border:0;" readonly="true">&nbsp;&nbsp;&nbsp;&nbsp;<b><%= tx_lang_TDE101(cd_lang)%></b></td>
					<td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfo','divInfoCorpo', 'divInfoRodape');"><img src="/imagens/30/btn_fechar.gif" width="18" height="17" border="0" alt="<%=tx_lang_D00011(cd_lang)%>"></a>&nbsp;</td>
				</tr>
			</table></td>
	</tr>
    </table></div>
    <div id="divInfoCorpo" class="divInfo">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f0f1f6" style="padding:10px 0px 0px 10px;">
    <tr align="left" valign="top"><td align="left" ><br><%= tx_lang_TDE102(cd_lang)%>:<br><input name="nm_usuario" id="nm_usuario" type="text" value="<%= Session("nm_usuario")%>" readonly="true" class="textbox" style="width:320px;height:20px;background-color:#F6F7FA;"></td><td align="left" ><br><%= tx_lang_TDE103(cd_lang)%>:<br><input name="dt_solic" id="dt_solic" type="text" value="<%= Date%>" readonly="true" class="textbox" style="width:118px;height:20px;background-color:#F6F7FA"></td></tr>
    <tr align="left" valign="top"><td colspan="2"><textarea name="nm_motivo" style="width:475px;height:190px;overflow:auto;" class="editbox"></textarea></td></tr>
    <tr align="center" valign="top" height="30"><td colspan="2" style="color:#CC0000;font-weight:bold;"><%= tx_lang_TDE104(cd_lang)%>&nbsp;<%= tempo_ocorrencia%>&nbsp;<%= tx_lang_TDE105(cd_lang)%></td></tr>
    </table></div>
    <div id="divInfoRodape" class="divInfo" style="overflow:hidden;">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#b4c7db" >
    <tr>
    <td align="center"><input name="submit_solic" type="submit" class="button" value="<%= tx_lang_TDE106(cd_lang)%>" style="width:150px;" onClick="criaSolicitacao(document.getElementById('nm_motivo').value, '<%= session("GrupoUsuario2")%>','<%= session("NomeGrupo")%>');"></td>
    </tr>
</table>
    </div> 
    </td></tr>
					<tr height="350" valign="top">
						<td align="left">
                        <span style="color:#0000FF;cursor:pointer;font-weight:bold;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape','X', '','','');">+ <%= tx_lang_TDE107(cd_lang)%></span>
                        <table width="100%" border="0" cellspacing="1" cellpadding="2"  bgcolor="#FFFFFF" style="padding: 0px 1px 0px 1px;">
                        <tr>
                        <td class="gridtit" rowspan="2">&nbsp;<%= tx_lang_002005(cd_lang)%>&nbsp;</td>
                        <td class="gridtit" rowspan="2">&nbsp;<%=tx_lang_TDE108(cd_lang)%>&nbsp;</td>
                        <td class="gridtit" colspan="3">&nbsp;Menus&nbsp;</td>
                        </tr>
                        <tr>
                        <td class="gridtit">&nbsp;<%= tx_lang_TDE109(cd_lang)%>&nbsp;</td>
                        <td class="gridtit">&nbsp;<%= tx_lang_TDE110(cd_lang)%>&nbsp;</td>
                        <td class="gridtit">&nbsp;<%= tx_lang_TDE111(cd_lang)%>&nbsp;</td>
                        </tr>
                        <%
						If objrs.state = adstateOpen then objrs.close()

                        If Trim(Request.QueryString("cd_usuario_rel")) <> "" Then
                            If InStr("040;055;060;045;088", Trim(Request.QueryString("cd_usuario_rel"))) = 0 Then 
                                sql = "SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO, U.NM_EMAIL "&_
						        " FROM TUSUARIO U (NOLOCK)"&_
                                " WHERE U.CD_USUARIO = '" & Trim(Request.QueryString("cd_usuario_rel")) & "'"			    
                                sql = sql & " ORDER BY U.NM_USUARIO"
                            Else
						        sql = "SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO, U.NM_EMAIL "&_
						        " FROM TUSUARIO U (NOLOCK)"&_
						        " INNER JOIN TPERMISSAO_GRUPO P ON (P.CD_USUARIO = U.CD_USUARIO) "&_
                                " INNER JOIN TGRUPO G ON (G.CD_GRUPO = P.CD_GRUPO) "&_
						        " WHERE U.CD_CARGO IN ('040')"&_
						        " AND G.CD_GRUPO <> ''"
						
						        If Session("GrupoUsuario2") <> "0" Then
							        sql = sql & " AND G.CD_GRUPO = '" & session("GrupoUsuario2") & "'"
						        End If

                                If Trim(Request.QueryString("cd_usuario_rel")) <> "" Then
                                  sql = sql & " AND U.CD_USUARIO = '" & Trim(Request.QueryString("cd_usuario_rel")) & "'"
                                End If					    
                                sql = sql & " ORDER BY U.NM_USUARIO"
                            End If
                        Else
                            sql = "SELECT DISTINCT U.CD_USUARIO AS CODIGO, U.NM_USUARIO, U.NM_EMAIL "&_
						    " FROM TUSUARIO U (NOLOCK)"&_
						    " INNER JOIN TPERMISSAO_GRUPO P ON (P.CD_USUARIO = U.CD_USUARIO) "&_
                            " INNER JOIN TGRUPO G ON (G.CD_GRUPO = P.CD_GRUPO) "&_
						    " WHERE U.CD_CARGO IN ('040')"&_
						    " AND G.CD_GRUPO <> ''"
						
						    If Session("GrupoUsuario2") <> "0" Then
							    sql = sql & " AND G.CD_GRUPO = '" & session("GrupoUsuario2") & "'"
						    End If			    
                            sql = sql & " ORDER BY U.NM_USUARIO"
                        End If




						Objrs.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
						'Response.write sql
                        'Response.end
						Dim cont_nome
						cont_nome = 1
						Do While Not objrs.Eof 
							If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
							nm_usuario = objrs.Fields.Item("NM_USUARIO").Value
							cd_usuario = objrs.Fields.Item("CODIGO").Value
							nm_email = objrs.Fields.Item("NM_EMAIL").Value
							If fnc_TestaVar(nm_email) Then
								nm_email_link = "<br>(<a href='mailto:" & objrs.Fields.Item("NM_EMAIL").Value & "'>" & objrs.Fields.Item("NM_EMAIL").Value & "</a>)"
							Else
								nm_email_link = ""
							End If
							%>
							<tr bgcolor="<%= bgcolor %>" valign="top">
							<td><nobr><%If cont_nome = 1 Then%><span style="color:#0000FF;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',0, '','','');">+ <%= tx_lang_TDE112(cd_lang)%></span><br><br><%End If%><input name="nm_usuario_solicitacao<%= cont_nome%>" id="nm_usuario_solicitacao<%= cont_nome%>" type="text" style="display:none;" value="<%= Trim(nm_usuario)%>"><img src="/imagens/30/lixeira16.gif" border="0" style="vertical-align:absmiddle;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',1, this.id, '','');" id="<%= Trim(nm_usuario)%>"><b><%= nm_usuario & "</b>" & nm_email_link%><nobr></td>
							<%
							Dim nm_area , total_area, cont_area
							If objrsx.state = adstateOpen then objrsx.close()
							total_area = 3
							cont_area = 0
							nm_area = ""
							sql = " SELECT CASE WHEN LEN(NM_AREA)>9 THEN LEFT(NM_AREA,10) + '...' ELSE NM_AREA END AS AREA, NM_AREA AS NOME_AREA"&_
							" FROM TAREA A "&_
							" INNER JOIN TPERMISSAO_AREA PA ON (PA.CD_AREA = A.CD_AREA) "&_
							" INNER JOIN TUSUARIO U ON(U.CD_USUARIO = PA.CD_USUARIO) "&_
							" WHERE U.CD_USUARIO = '" & cd_usuario & "'"&_
							" ORDER BY NM_AREA"
							Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
							
							Do While Not Objrsx.eof
							cont_area = cont_area + 1 
							str = "<span title='" & Trim(objrsx.Fields.Item("NOME_AREA").Value) & "'>" & Trim(objrsx.Fields.Item("AREA").Value) & "</span>"
							For I = 1 to 13 - Len(Trim(objrsx.Fields.Item("AREA").Value))
								str = str & "&nbsp;"
							Next
							nm_area = nm_area & "<img src='/imagens/30/lixeira16.gif' border='0' style='vertical-align:absmiddle;cursor:pointer;' onClick=""ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',2, document.getElementById('nm_usuario_solicitacao" & cont_nome & "').value,'" & Trim(objrsx.Fields.Item("NOME_AREA").Value) & "','');"">" & str
							Objrsx.MoveNext
							If objrsx.Eof Then Exit Do
							If cont_area = total_area Then
								nm_area = nm_area & "<br>"
								cont_area = 0
							End If
							Loop	
							%>
							<td><nobr><span id="<%= Trim(nm_usuario)%>" style="color:#0000FF;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',3, this.id,0,'');">+ <%= tx_lang_TDE113(cd_lang)%></span><br><br><span style="font-family:courier new;"><%= nm_area%></span></nobr></td>
							<%
							
							If objrsx.state = adstateOpen then objrsx.close()
							subm_nome = ""
							menu_nome = "Importação"
							sql = "SELECT RTRIM("& tx_lang_subm &") AS SUBM"&_
							" FROM M09_ACESSO M9 "&_
							" INNER JOIN M02_SUBM M2 ON (M2.M02_CD_SUBM = M9.M09_CD_SUBM AND M2.M02_CD_MENU = M9.M09_CD_MENU  AND M9.M09_CD_MENU='01')"&_
							" WHERE M9.M09_CD_USUARIO ='" & cd_usuario & "'"&_
							" AND M2.M02_IN_ATIVO = '1'"&_
							" AND M9.M09_IN_ACESSO = '1'"&_
							" ORDER BY M2.M02_NR_ORDEM"
							Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
							
							
							Do While Not Objrsx.eof
							str = "<span>" & Trim(objrsx.Fields.Item("SUBM").Value) & "</span>"
							subm_nome = subm_nome & "<img src='/imagens/30/lixeira16.gif' border='0' style='vertical-align:absmiddle;cursor:pointer;' onClick=""ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',4, document.getElementById('nm_usuario_solicitacao" & cont_nome & "').value,'" & Trim(objrsx.Fields.Item("SUBM").Value) & "','" & menu_nome & "');"">" & str & "&nbsp;<br>"
							Objrsx.MoveNext
							If objrsx.Eof Then Exit Do
							Loop	
							%>
							<td><nobr><span id="<%= Trim(nm_usuario)%>" style="color:#0000FF;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',5, this.id,0,'<%= menu_nome %>');">+ <%= tx_lang_TDE114(cd_lang)%></span><br><br><span style="font-family:courier new;"><%= subm_nome%></span></nobr></td>
							<%
							If objrsx.state = adstateOpen then objrsx.close()
							subm_nome = ""
							menu_nome = "Exportação"
							sql = "SELECT RTRIM("& tx_lang_subm &") AS SUBM"&_
							" FROM M09_ACESSO M9 "&_
							" INNER JOIN M02_SUBM M2 ON (M2.M02_CD_SUBM = M9.M09_CD_SUBM AND M2.M02_CD_MENU = M9.M09_CD_MENU  AND M9.M09_CD_MENU='02')"&_
							" WHERE M9.M09_CD_USUARIO ='" & cd_usuario & "'"&_
							" AND M2.M02_IN_ATIVO = '1'"&_
							" AND M9.M09_IN_ACESSO = '1'"&_
							" ORDER BY M2.M02_NR_ORDEM"
							Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
							
							Do While Not Objrsx.eof
							str = "<span>" & Trim(objrsx.Fields.Item("SUBM").Value) & "</span>"
							subm_nome = subm_nome & "<img src='/imagens/30/lixeira16.gif' border='0' style='vertical-align:absmiddle;cursor:pointer;' onClick=""ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',4,document.getElementById('nm_usuario_solicitacao" & cont_nome & "').value,'" & Trim(objrsx.Fields.Item("SUBM").Value) & "','" & menu_nome & "');"">" & str & "&nbsp;<br>"
							Objrsx.MoveNext
							If objrsx.Eof Then Exit Do
							Loop	
							%>
							<td><nobr><span id="<%= Trim(nm_usuario)%>" style="color:#0000FF;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',5, this.id,0,'<%= menu_nome %>');">+ <%= tx_lang_TDE114(cd_lang)%></span><br><br><span style="font-family:courier new;"><%= subm_nome%></span></nobr></td>
							<%
							If objrsx.state = adstateOpen then objrsx.close()
							subm_nome = ""
							menu_nome = "Financeiro"
							sql = "SELECT RTRIM("& tx_lang_subm &") AS SUBM"&_
							" FROM M09_ACESSO M9 "&_
							" INNER JOIN M02_SUBM M2 ON (M2.M02_CD_SUBM = M9.M09_CD_SUBM AND M2.M02_CD_MENU = M9.M09_CD_MENU  AND M9.M09_CD_MENU='06')"&_
							" WHERE M9.M09_CD_USUARIO ='" & cd_usuario & "'"&_
							" AND M2.M02_IN_ATIVO = '1'"&_
							" AND M9.M09_IN_ACESSO = '1'"&_
							" ORDER BY M2.M02_NR_ORDEM"
							Objrsx.Open sql, objcnn, adOpenStatic, adlockReadOnly, adcmdtext
							
							Do While Not Objrsx.eof
							str = "<span>" & Trim(objrsx.Fields.Item("SUBM").Value) & "</span>"
							subm_nome = subm_nome & "<img src='/imagens/30/lixeira16.gif' border='0' style='vertical-align:absmiddle;cursor:pointer;' onClick=""ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',4,document.getElementById('nm_usuario_solicitacao" & cont_nome & "').value,'" & Trim(objrsx.Fields.Item("SUBM").Value) & "','" & menu_nome & "');"">" & str & "&nbsp;<br>"
							Objrsx.MoveNext
							If objrsx.Eof Then Exit Do
							Loop	
							%>
							<td><nobr><span id="<%= Trim(nm_usuario)%>" style="color:#0000FF;cursor:pointer;" onClick="ExibeDetalhes('divInfo','divInfoCorpo','divInfoRodape',5, this.id,0,'<%= menu_nome%>');">+ <%= tx_lang_TDE114(cd_lang)%></span><br><br><span style="font-family:courier new;"><%= subm_nome%></span></nobr></td>
							<%
							cont_nome = cont_nome + 1
							Objrs.MoveNext
							%>
                       		</tr>
                        	<%
							If objrs.Eof Then Exit Do 
						Loop
						%>
                        </table>
						</td>
					</tr>
                    <tr>
    <td>&nbsp;
    </td>
    </tr>
				</table>
			</div>
			<!-- :::::::::: FIM DO CORPO CENTRAL    :::::::::: -->
		</td>
	</tr>
	<tr>
		<td colspan="2" height="16"><!-- :::::::::: INICIO DO RODAPÉ :::::::::: -->
			<!--#include virtual="/includes/lay_bottom.asp" -->
			<!-- :::::::::: FIM DO RODAPÉ    :::::::::: -->
		</td>
	</tr>
</table>
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp"-->
