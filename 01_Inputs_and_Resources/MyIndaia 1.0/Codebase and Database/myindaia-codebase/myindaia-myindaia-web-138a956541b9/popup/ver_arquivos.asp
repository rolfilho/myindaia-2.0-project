
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
in_alerta = Request.QueryString("in_alerta")


in_alerta = "1"
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<%If in_alerta <> "1" or Request.QueryString("in_nota") = "1" Then%>
<!--#include virtual="/includes/inc_execs.asp"-->
<%Else
  Session("tp_exibir2") = 0
  Session("cd_usuario") = Left(Request.QueryString("cd_view"), 4)
  Call sub_AbreConexao(SQLSERVER, SQLDATABASE, SQLUSERNAME, SQLPASSWORD)
End If
'configura o timeout para uma duração maior, pois existem muitas consultas sql
Server.ScriptTimeout = 9999

cod_criptografado = Request.QueryString("cod")
If objrsx.state=adstateOpen then objrsx.close()
sql = "SELECT MASTER.DBO.FN_DESCRIPROGRAFA('" & cod_criptografado & "') AS RESULTADO"
objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly	
resultado =  objrsx.Fields.Item("RESULTADO").Value
If objrsx.state=adstateOpen then objrsx.close()
resultado_array = Split(resultado, ";")
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include virtual="/includes/lay_title.asp"-->
</head>
<body style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=fundo_div %>" style="vertical-align:top;">
	<tr height="25" style="background-color:<%=topo_div%>;">
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr align="center"><td><b>&nbsp;<%= " Arquivos ("& Mid(resultado_array(0), 5, Len(resultado_array(0))) & ")"%></b></td></tr>
			</table></td>
	</tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr height="18" class="gridtit" style="background-color:<%=cabec_result%>;">
					<td style="width:20px;"></td>
					<td>Nome</td>	
                    <td>Descrição</td>				
				</tr>       
<%
If Request("in_nota") = "1" Then
sql = " SELECT PD.NM_DESCRICAO AS DESCRICAO, "&_
    " 'http://www.myindaiaweb.com.br/redireciona_doc.asp?cod='+MASTER.DBO.FN_CRIPROGRAFA(BROKER.DBO.FN_PATH_DIGITALIZACAO('" & resultado_array(0) & "','0') "&_
    " + '/'+ PD.NR_PROCESSO + '/'+ PD.NM_ARQUIVO) AS LINK, PD.NM_ARQUIVO, PD.NM_DESCRICAO, "&_
    " PD.NR_PROCESSO AS PROCESSO "&_
	"     FROM BROKER.DBO.TPROCESSO_DOCTOS PD (NOLOCK) "&_	
	"    WHERE PD.NR_PROCESSO = '" & resultado_array(0) & "'"&_ 
	"    AND PD.IN_ATIVO = '1'"&_
	"    AND PD.NM_ARQUIVO = '" & resultado_array(1) & "'"
Else
sql = " SELECT PD.NM_DESCRICAO AS DESCRICAO, "&_
    " 'http://www.myindaiaweb.com.br/redireciona_doc.asp?cod='+MASTER.DBO.FN_CRIPROGRAFA(BROKER.DBO.FN_PATH_DIGITALIZACAO('" & resultado_array(0) & "','0') "&_
    " + '/'+ PD.NR_PROCESSO + '/'+ PD.NM_ARQUIVO) AS LINK, PD.NM_ARQUIVO, PD.NM_DESCRICAO, "&_
    " PD.NR_PROCESSO AS PROCESSO "&_
	"     FROM BROKER.DBO.TPROCESSO_DOCTOS PD (NOLOCK) "&_	
	"    WHERE PD.NR_PROCESSO = '" & resultado_array(0) & "'"&_ 
	"    AND PD.IN_ATIVO = '1'"&_
	"    AND PD.CD_TIPO_DOCTO = " & resultado_array(1)
End If
'Response.write sql
'Response.end

    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

    If objrsx.recordCount > 1 Then

        Do While Not objrsx.Eof
        %>
        <tr bgcolor="<%= bgcolor%>">
         <td style="text-align:center;">&nbsp;<img src='/imagens/30/open.gif' border='0'/></td>
         <td>&nbsp;<a href="<%=objrsx.Fields.Item("LINK").Value %>"  target='_blank'><%=objrsx("NM_ARQUIVO")%></a></td>   
         <td>&nbsp;<%=objrsx("NM_DESCRICAO")%></td>                    
        </tr>
        <%  
            objrsx.MoveNext
            If objrsx.Eof Then Exit Do 
        Loop
    Else
        Response.Redirect(objrsx.Fields.Item("LINK").Value)
    End If
%>
</table>
</body>
</html>
