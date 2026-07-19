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
<%
dim vTabela
dim vCampos
dim vCodigo
dim vInstrucao
dim vDescricao: vDescricao = ""
'recupera as variaveis para montagem da consulta
vTabela = Request("vTabela")
vCampos = Request("vCampos")
vReturn = Request("vReturn")
vCodigo = Request("vCodigo")
vInstrucao = Request("vInstrucao")
vInDebug = false
'monta a instrução sql

if vTabela = "TRAP" and vCampos = "CD_RAP" then
vCampos = "CD_RAP+CD_RAP_ANO"
	if ( vInstrucao <> "" ) then
	  sql = vInstrucao%>
	<%else
		  sql = "SELECT * FROM "&vTabela&" (NOLOCK) "&_
		  " WHERE "&vCampos&" = '"&vCodigo&"' AND CD_GRUPO = '" & Session("GrupoUsuario") & "'"
	end if
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	if objrs.eof then
		Response.write ("true")
	else
		Response.Write("false")
	end if
	objrs.Close()
else
	if vTabela = "VERIFICATRANSP" then
		if ( vInstrucao <> "" ) then
		  sql = vInstrucao%>
		<%
		else
		    if VCodigo = "04" then
			Response.write ("aereo")
			else
			Response.write ("outros")
			end if 
		end if 
	else
		if ( vInstrucao <> "" ) then
		  sql = vInstrucao%>
		<%else
		  sql = "SELECT "&vReturn&" FROM "&vTabela&" (NOLOCK) WHERE "&vCampos&" = '"&vCodigo&"'"
		end if
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		if objrs.RecordCount > 0 then
			vDescricao = Server.URLEncode(Trim(objrs.Fields.Item(0).Value))
			Response.Write(vDescricao)
			'Response.Write("<input type='text' name='edtNmExportador' value='"&vDescricao&"' class='editbox' style='width:160px;background-color:#DDDDDD;' readonly>")
		else
			if objrs.State = adStateOpen then objrs.Close()
			Dim cnstr, cnnBroker, cmdBroker
			Set cnnBroker = Server.CreateObject("ADODB.Connection")
			Set cmdBroker = Server.CreateObject("ADODB.Command")
			cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
							"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
							"User ID=MYINDAIAWEB;Password=myindaiaweb;"
			On error resume next
			cnnBroker.Open cnstr
			cmdBroker.ActiveConnection = cnnBroker
			if vTabela = "TLOCAL_EMBARQUE" then 
			vTabela = "TLOCAL_EMBARQUE"
			vReturn = "DESCRICAO"
			vCampos = "CODIGO"
			sql = "SELECT "&vReturn&" FROM "&vTabela&" (NOLOCK) WHERE "&vCampos&" = '"&vCodigo&"'"
			Else
			sql = "SELECT "&vReturn&" FROM "&vTabela&" (NOLOCK) WHERE "&vCampos&" = '"&vCodigo&"' "
			if vTabela <> "TPAIS_BROKER" Then
			sql = sql & "AND IN_ATIVO = '0'"
			End If
			End If
			objrs.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
			if objrs.RecordCount > 0 then
				vDescricao = Server.URLEncode(Trim(objrs.Fields.Item(0).Value))
				Response.Write(vDescricao)
			else
				Response.Write("erro")
			End if
		end if
		objrs.Close()
	end if
end if
%>
<!--#include virtual="/includes/inc_ends.asp" -->