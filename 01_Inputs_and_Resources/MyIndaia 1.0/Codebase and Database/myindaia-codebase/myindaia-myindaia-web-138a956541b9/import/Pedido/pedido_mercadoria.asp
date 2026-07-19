<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% Response.Charset="ISO-8859-1" %>
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
'monta a instrução sql

			Dim cnstr, cnnBroker, cmdBroker
			Set cnnBroker = Server.CreateObject("ADODB.Connection")
			Set cmdBroker = Server.CreateObject("ADODB.Command")
			cnstr = "Provider=SQLOLEDB;Persist Security Info=True;"&_
							"Data Source=INDAIA10;Initial Catalog=BROKER;"&_
							"User ID=sa;Password=123;"
			On error resume next
			cnnBroker.Open cnstr
			cmdBroker.ActiveConnection = cnnBroker
			
			mercadoria = Request.QueryString("mercadoria")
        
        	sql = "SELECT ISNULL(CD_NCM_SH,'') AS CD_NCM_SH, ISNULL(VL_UNITARIO,0) AS VL_UNITARIO, ISNULL(PL_MERCADORIA,0) AS PL_MERCADORIA, " &_
        " ISNULL(CD_UN_MED_COMERC,'') AS CD_UN_MED_COMERC, ISNULL(CD_TIPO_CALCULO,'') AS CD_TIPO_CALCULO, CONVERT(CHAR, ISNULL(IN_NECESSITA_LI,'0')) AS IN_NECESSITA_LI, " &_
        " ISNULL(IN_DRAWBACK,0) AS IN_DRAWBACK, ISNULL(AP_MERCADORIA, '') AS AP_MERCADORIA, " &_
        " ISNULL(CD_NALADI_SH,'') AS CD_NALADI_SH, ISNULL(CD_NALADI_NCCA,'') AS CD_NALADI_NCCA, ISNULL(CD_PAIS_AQUISICAO,'') AS CD_PAIS_AQUISICAO, " &_ 
        " ISNULL(NM_MERCADORIA,'') AS NM_MERCADORIA, ISNULL(CD_FABR_EXPO,'') AS CD_FABR_EXPO, ISNULL(CD_EXPORTADOR,'') AS CD_EXPORTADOR , ISNULL(CD_PAIS_ORIGEM, '') AS CD_PAIS_ORIGEM " &_
        " FROM TMERCADORIA (NOLOCK) WHERE CD_MERCADORIA  = '" & mercadoria & "' "
       objrs.Open sql, cnnBroker, adOpenStatic, adLockReadOnly, adCmdText
      
        vCdTpCalculo = ""
        vCdFabricante = ""
        vCdPaisOrigem = ""
        If objrs.recordCount > 0 Then
            If objrs("CD_TIPO_CALCULO") <> "" Then
                vCdTpCalculo = RsAux("CD_TIPO_CALCULO")
            Else
                vCdTpCalculo = "1"
            End If
        
            If objrs("CD_FABR_EXPO") = "1" Then
                If Trim(objrs("CD_EXPORTADOR")) <> "" Then
                    vCdFabricante = objrs("CD_EXPORTADOR")
                End If
                If Trim(objrs("CD_PAIS_AQUISICAO")) <> "" Then
                    vCdPaisOrigem = objrs("CD_PAIS_ORIGEM")
                End If
            End If
        
            If objrs("CD_FABR_EXPO") = "2" Then
                If Trim(RsAux("CD_EXPORTADOR")) <> "" Then
                    vCdFabricante = objrs("CD_FABRICANTE")
                    vCdPaisOrigem = objrs("CD_PAIS_ORIGEM")
                End If
            End If
        
            If objrs("CD_FABR_EXPO") = "3" Then
                vCdFabricante = ""
                If Trim(objrs("CD_PAIS_AQUISICAO")) <> "" Then
                    vCdPaisOrigem = objrs("CD_PAIS_ORIGEM")
                End If
            End If

            resposta = Trim(objrs("CD_NCM_SH")) & "|" & CStr(FormatNumber(Trim(objrs("VL_UNITARIO")), 5)) & "|" & CStr(FormatNumber(Trim(objrs("PL_MERCADORIA")), 5)) & "|" & _
            Trim(objrs("CD_NALADI_SH")) & "|" & Trim(objrs("CD_NALADI_NCCA")) & "|" & Trim(objrs("NM_MERCADORIA")) & "|" & _
            Trim(vCdFabricante) & "|" & Trim(vCdTpCalculo) & "|" & Trim(vCdPaisOrigem) & "|" & _
            Trim(objrs("CD_UN_MED_COMERC")) & "|" & Trim(objrs("IN_NECESSITA_LI")) & "|" & Trim(objrs("IN_DRAWBACK"))
            Response.Write(resposta)
        Else
            Response.Write("NAO")
        End If
        
		
		If objrs.State = adStateOpen Then objrs.Close
		set cmdBroker = nothing
		set cnnBroker = nothing
		Response.end
%>
<!--#include virtual="/includes/inc_ends.asp" -->