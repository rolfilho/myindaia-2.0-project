<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'
'Manutenção: 
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->
<%
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 300

Dim vlInss, vlDesp, vlDif

in_show = False
cd_tela = "DET011"

nr_processo = CStr(Request.QueryString("nr_processo"))
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
<style type="text/css">
td {
	font-size: 9px;
}
.azulEscuro {
	background: #336699;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}
.azulClaro {
	background: #7799CC;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
}

.cinza {
	background: #DDDDDD;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}
.cinzaClaro {
	background: #EEEEEE;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}

.branco {	background: #FFFFFF;
	height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: #336699;
}

</style>
</head>
<body>
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<%
		sql = "SELECT PR.NR_PROCESSO, PR.TP_FRETE, "&_
				"  DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.VL_TOTAL_II, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
        "  (SD.VL_PAGTO*0.2) AS VL_INSS, "&_
				"  (ISNULL((SELECT ISNULL(SUM(CASE CC.IN_RESTITUI "&_
				"                              WHEN '0' THEN CC.VL_ITEM "&_
				"                              ELSE CC.VL_ITEM *(-1) "&_
				"                             END), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC CC ( NOLOCK ) "&_
				" INNER JOIN BROKER.DBO.TS_FATURA TSF (NOLOCK) ON  TSF.CD_UNID_NEG = CC.CD_UNID_NEG "&_
        "  AND TSF.CD_PRODUTO = CC.CD_PRODUTO "&_
        "  AND TSF.NR_SOLICITACAO = CC.NR_SOLIC_FAT "&_
        "  AND TSF.TP_TIPO_FAT = 'F' "&_
				"           WHERE CC.NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND ISNULL(CC.IN_CANCELADO, 0) = 0 "&_
				"             AND CAST(CC.CD_ITEM AS INT) < 900), 0)) AS VL_DESPESA_INDAIA, "&_ 
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('001','029') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_FRETE_INDAIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM = '040' "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA "&_
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "
	'Response.Write(sql)
	With objcmd
		.CommandTimeOut = 120
		.CommandText = sql
		.CommandType = adCmdText
	End With
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	
	If objrs.RecordCount > 0 Then
		vlInss = objrs("VL_INSS")
		vlDesp = objrs("VL_DESPESA_INDAIA")-objrs("VL_RECUPERADO")-objrs("VL_TOTAL_II")-objrs("VL_FRETE_INDAIA")-objrs("VL_CAPATAZIA")
		if objrs("TP_FRETE") = "0" then
			vlDif = objrs("VL_FRETE_INDAIA")-objrs("VL_TOTAL_FRETE_MN")
		else
			vlDif = 0
		end if
%>
	<tr height="25">
		<td colspan="3" background="/imagens/bg_popup.gif" style="background-repeat: repeat-x"><table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="1018" class="titpopup">&nbsp;Prova Real </td>
					<td width="35"><a href="#" onClick="javascript:window.close();"><img src="/imagens/icones/16x16/btn_close.gif" width="17" height="17" border="0" alt="Fechar Janela"></a></td>
				</tr>
			</table>
<table border="0" cellpadding="1" cellspacing="1">
	<col width="100">
	<col width="100">
	<tr>
		<td colspan="2" class="azulEscuro"><div align="center" style="font-size: 12px"><b><% = Mid(nr_processo, 5, Len(nr_processo))%></b></div></td>
	</tr>
	<tr>
		<td width="88" class="azulClaro">DESP</td>
		<td width="128" class="cinza"><div align="right"><%= FormatNumber(vlDesp, 2)%>&nbsp;</div></td>
	</tr>
	<tr>
		<td class="azulClaro">INSS</td>
		<td class="cinzaClaro"><div align="right"><%= FormatNumber(vlInss, 2)%>&nbsp;</div></td>
	</tr>
	<tr>
		<td class="azulClaro">TRANSP</td>
		<td class="cinza"><div align="right">0,00&nbsp;</div></td>
	</tr>
	<tr>
		<td class="azulClaro">DIF</td>
		<td class="cinzaClaro"><div align="right"><%= FormatNumber(vlDif, 2)%>&nbsp;</div></td>
	</tr>
	<tr>
		<td class="branco">&nbsp;</td>
		<td class="branco">&nbsp;</td>
	</tr>
	<tr>
		<td class="azulClaro">TOTAL</td>
		<td class="cinza"><div align="right"><%= FormatNumber(vlDesp+vlInss+vlDif, 2)%>&nbsp;</div></td>
	</tr>
</table>
<%
	end if  
%>	
</body>
</html>
<!--#include virtual="/includes/inc_ends.asp" -->
