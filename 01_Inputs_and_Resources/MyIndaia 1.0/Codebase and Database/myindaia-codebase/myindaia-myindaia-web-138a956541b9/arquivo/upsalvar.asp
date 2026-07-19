<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Arquivo de Script e HTML: Upload de arquivo
'Autor Alexandre Neto
'Criado 26/02/2007
'Manutenção: Alexandre(01/10/2007)
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<% Response.Charset="ISO-8859-1" %>
<%
'---------------------------------------------------------------------------
On Error Resume Next
%>
<!-- #include file="uploadex.asp" -->
<%
dim vQryStr, vScript, vArqOri, vNewArq, txtUrl, vInUpLoad, vExtensao, vInTipo, vFileTotal, contador_arquivo, vArquivoInfo
dim txtErro: txtErro = "\nEntre em contato com o suporte(suporte@myindaia.com.br)"
dim str_aux, str_aux2
vOk = 0

if Request.TotalBytes > 0 then
	'Lê o formulário
	upload_ReadRequest
	'recupera dados do form
	cd_menu = uRequest("cd_menu")
	cd_subm = uRequest("cd_subm")
	cd_docto = uRequest("cd_docto")
	cd_view = uRequest("cd_view")
	vQryStr = uRequest("vQryStr")
	vScript = uRequest("vScript")
	vNewArq = uRequest("vArquivo")
	vExtensao = uRequest("vExtensao")
	vInTipo = uRequest("vInTipo")
	
	'Obtém o nome do arquivo
	Select Case vInTipo
		Case 1,3
			vContador = uRequest("contadorFile")
			vFileTotal = ""
			For contador_arquivo = 1 to vContador
				vFileInfo = "File" & contador_arquivo
				vArquivoInfo = "Arquivo" & contador_arquivo
				vFile = UploadRequest.Item(vFileInfo).Item("FileName")
				
				
				vNewArq = uRequest(vArquivoInfo)

				If InStr(vFile, "\") > 0 Then
					str_aux = Split(vFile, "\")
					str_aux2 = str_aux(uBound(str_aux))
				Else
					str_aux2 = vFile
				End If 
				
				if Trim(vFile) <> "" then
					'Salva o arquivo
					if vNewArq = "" then 
						vNewArq  = str_aux2
						vDestino = "/arquivo/upload/" & uRequest("vNrRapGrupo") & "/"
					Else
						vDestino = "/arquivo/upload/"
					End If
				
					select case upload_SalvaArquivo(vFileInfo, Server.MapPath(vDestino), vNewArq, vExtensao)
						case 0
							txtErro = "Arquivo enviado com sucesso, clique em OK para continuar."
							vInUpLoad = 1
						case 1 txtErro = "Ocorreu um erro no envio."&txtErro
						case 2 txtErro = "A extensão do arquivo é inválida ou não permitida!"&txtErro
						case else txtErro = "Um erro desconhecido ocorreu!"&txtErro
					end select
				else
					txtErro = "Arquivo não encontrado + vFile!"&txtErro
				end if
				vFileTotal = vFileTotal & vNewArq & ";"	
				vArqTotal  = vArqTotal & vArqOri & ";"		
			Next	
			'cria a url de direcionamento
			'Response.write Trim(vFileTotal)
			txtUrl = vScript&"?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&cd_view="&cd_view&"&"&_
					 vQryStr&"&vFile="&Server.URLEncode(vFile)&"&vNewArq="&Server.URLEncode(vFileTotal)&"&vInUpLoad="&vInUpLoad&"&vContador="&vContador
			
		Case 0,2
			vArqOri = UploadRequest.Item("vArqOri").Item("FileName")
	
			If InStr(vArqOri, "\") > 0 Then
				str_aux = Split(vArqOri, "\")
				str_aux2 = str_aux(uBound(str_aux))
			Else
				str_aux2 = vArqOri
			End If 
	

			if Trim(vArqOri) <> "" then
				'Salva o arquivo
				if vNewArq = "" then 
					vNewArq  = str_aux2
					vDestino = "/arquivo/upload/" & uRequest("vNrRapGrupo") & "/"
				Else
					vDestino = "/arquivo/upload/"
				End If
			
				select case upload_SalvaArquivo("vArqOri", Server.MapPath(vDestino), vNewArq, vExtensao)
					case 0
						txtErro = "Arquivo enviado com sucesso, clique em OK para continuar."
						vInUpLoad = 1
					case 1 txtErro = "Ocorreu um erro no envio."&txtErro
					case 2 txtErro = "A extensão do arquivo é inválida ou não permitida!"&txtErro
					case else txtErro = "Um erro desconhecido ocorreu!"&txtErro
				end select
			else
				txtErro = "Arquivo não encontrado!"&txtErro
			end if
			'cria a url de direcionamento
			txtUrl = vScript&"?cd_menu="&cd_menu&"&cd_subm="&cd_subm&"&cd_docto="&cd_docto&"&cd_view="&cd_view&"&"&_
					 vQryStr&"&vArqOri="&Server.URLEncode(vArqOri)&"&vNewArq="&vNewArq&"&vInUpLoad="&vInUpLoad
        Case 4 
          Dim cnstr 'string de conexão
	      Set cnnMy = Server.CreateObject("ADODB.Connection")
	      Set cmdMy = Server.CreateObject("ADODB.Command")
	      Set rsMy  = Server.CreateObject("ADODB.Recordset")
          Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
          cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
					"Data Source=INDAIA10;Initial Catalog=MYINDAIA;"&_
					"User ID=MYINDAIAWEB;Password=myindaiaweb;"
	      On error resume next
	      cnnMy.Open cnstr
          cmdMy.ActiveConnection = cnnMy

          nr_processo = Trim(uRequest("vNrProcesso"))
          prefixo = "PEN"
          extensao = ScriptObject.GetExtensionName(UploadRequest.Item("arq_pendencia").Item("FileName"))

          If rsMy.State = adStateOpen Then rsMy.Close()
          sql = " SELECT TOP 1 LTRIM(RTRIM(NM_ARQUIVO)) AS NM_ARQUIVO "&_
          " FROM BROKER.DBO.TPROCESSO_DOCTOS (NOLOCK) "&_
          " WHERE NR_PROCESSO = '" & nr_processo & "'"&_
          " AND NM_ARQUIVO LIKE '" & prefixo & "'"&_
          " AND ISNUMERIC(SUBSTRING(NM_ARQUIVO, LEN('" & prefixo & "')+1, 2)) = 1"&_ 
          " ORDER BY DT_CRIACAO DESC"
          rsMy.Open sql, cnnMy, adOpenStatic, adLockReadOnly, adCmdText        

          NomeArquivo = ""
          If rsMy.RecordCount > 0 Then
            S = Mid(rsMy("NM_ARQUIVO"), Len(prefixo) + 1, 10)
            D = ""
            Do While (S <> "") And InStr("0;1;2;3;4;5;6;7;8;9", S(0))
              D = D + S(0)
              S = Right(S, Len(S) - 1)
              rsMy.MoveNext
              if rsMy.Eof then exit do
            Loop
            A = CInt(D)
          Else             
            A = 0 
          End If
          A = A + 1
          NomeArquivo = prefixo + Right("0" + CStr(A), 2)

          Do Until Not ScriptObject.FileExists(Server.MapPath("/docs_novo/" & nr_processo) & "\" & NomeArquivo & "." & extensao)
            A = A + 1
            NomeArquivo = prefixo + Right("0" + CStr(A), 2)
          Loop
          vDestino = "/docs_novo/" & Trim(uRequest("vNrProcesso")) & "/"                            
          NomeArquivo = UCase(NomeArquivo & "." & extensao)

          select case upload_SalvaArquivo("arq_pendencia", Server.MapPath(vDestino), NomeArquivo, extensao)
		    case 0
			  txtErro = "Arquivo enviado com sucesso, clique em OK para continuar."
		      sql = "INSERT INTO TPROCESSO_PENDENCIAS_LOG (CD_PENDENCIA, NR_PROCESSO, NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, CD_TEXTO,TP_TEXTO,NM_TEXTO,CD_USUARIO,CD_USUARIO_PARA, NM_ARQUIVO, DT_TEXTO) "&_
			  " VALUES ("& Trim(uRequest("cd_pendencia")) &",'" & nr_processo & "', '" & Trim(uRequest("nr_referencia")) & "', '" & Trim(uRequest("nr_item_cliente")) & "', " & Trim(uRequest("nr_parcial")) & ", '" & Trim(uRequest("cd_empresa")) & "',  " & Trim(uRequest("cd_texto")) & ", 'E', '(Arquivo " & NomeArquivo &" inserido por " & Trim(uRequest("nm_contato"))  &")', '" & Trim(uRequest("cd_contato")) & "', '" &  Trim(uRequest("cd_contato")) & "', '" & NomeArquivo & "', GETDATE()) "			   
               cnnMy.Execute(sql)

               sql = " INSERT BROKER.DBO.TPROCESSO_DOCTOS (NR_PROCESSO,CD_TIPO_DOCTO,NM_DESCRICAO,NM_ARQUIVO,CD_USUARIO_CRIACAO, ID_TABELA) " & _
               " VALUES ('" & nr_processo & "', '138', 'Ref. pendência " & Trim(uRequest("nm_pendencia")) & "', '" & NomeArquivo & "', '" & Session("cd_usuario") & "', 1652005462 )"            
               cnnMy.Execute(sql)
			case 1 txtErro = "Ocorreu um erro no envio."&txtErro
			case 2 txtErro = "A extensão do arquivo é inválida ou não permitida!"&txtErro
			case else txtErro = "Um erro desconhecido ocorreu!"&txtErro
		  end select
          txtUrl = uRequest("vScriptPend")
          Response.Cookies("pendencia")("codigo") = uRequest("cd_pendencia")
          Response.Cookies("pendencia")("processo") = nr_processo
          Response.Cookies("pendencia")("nome") = Trim(uRequest("nm_pendencia"))
	End Select		 
else
	txtErro = "Falha no envio, não foi possivel lêr o arquivo."&txtErro
	Response.Write("<script>alert('"&txtErro&"');window.close();</script>")
	Response.End()
end if
%>
<script language="javascript" type="text/javascript">
<!--
alert('<%=txtErro%>');
window.location.href = '<%=txtUrl%>';
-->
</script>
