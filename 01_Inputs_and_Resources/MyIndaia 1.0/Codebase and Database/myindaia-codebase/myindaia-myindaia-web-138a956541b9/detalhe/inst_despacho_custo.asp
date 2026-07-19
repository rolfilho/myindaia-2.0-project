<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
'---------------------------------------------------------------------------
'Sistema MyIndaiá - Detalhes do Processo - Inst. Despacho e Custo Final
'Arquivo de Script e HTML: Resultado da Busca
'
'Autor Alexandre Gonçalves Neto
'Criado: 12/09/2006
'LINK PARA TESTE - Response.Redirect("../IMPORT/teste.asp?var1="&Request.QueryString("Condicao")&"")
'Manutenção: Flávio Henrique - 04/04/2008
'---------------------------------------------------------------------------
%>
<!--#include virtual="/includes/inc_utils.asp"-->
<!--#include virtual="/includes/inc_execs.asp"-->

<%'Response.Flush 
'Tempo maior para o script concluir todos comandos devido grande quantidade de pesquisas sql
Server.ScriptTimeout = 9999

Dim sem_cobertura, nm_item_select, cd_item_select, in_rateia_pedido
Dim nr_invoice, vl_transp_nacional, vl_transp_internacional
Dim nr_nf, dt_nf
Dim vlNota, vlTotal, vlDesp, vlDif
Dim txObs, txNotaFiscal, vCodMercadoria, vNrItem, vTipoImport, vTxFabric, vInIPIRec, vTipoTransp
Dim vNrDias, vTxCondicao, vDtDocto, vDtVencto
Dim aCondicao
Dim caminho	'caminho do arquivo
Dim arquivo 'nome do arquivo
Dim vTitulo,Data_Fatura,Data_Proforma
Dim vl_tot_nao_tributavel,vl_sub_tot_tributavel,vl_comissao,vl_tot_geral, dias_Corridos,Buscaprocesso, vl_recuperado
Dim vedtCodItem,vedtNmItem,vdata,vValor,id,vUrl,txCondicao,dtDocs,Condicao,check,varCheck,ValEmbalagem
Dim vl_item,vl_saldo,credito,debito,saldo,in_restitui,cont2,msg,msg1,EnviaEmbalagem,VEmbalagem,Flag
Dim MenorDataProforma, mensagem
Dim vl_acrescimo_mn_item, vl_frete_mn_item,vl_acrescimo_mn, vl_frete_mn, vl_seguro_mn, desc_seguro_mn, desc_frete_mn, vl_item_fixo, vl_item_total_fixo1, vl_item_total_fixo2, vl_item_total_fixo3, vl_item_total_fixo4,vl_mercadoria_total, cont_merc, cont_pedido
Dim vl_item_total_fixo1_array
Dim total_item, in_rateio_grupo, verifica_rateio, cd_transp_planilha, cd_seg_planilha
Dim data_documento, data_item

msg=""

Function fnc_ValorSaldo(vl_item, vl_saldo)
'calcula o valor do saldo
  If Not ( objrsy("CD_TIPO_ITEM") = "B" or objrsy("CD_TIPO_ITEM") = "C" ) Then
    vl_saldo = vl_saldo + vl_item
  Else
    vl_saldo = vl_saldo
  End If
  'retorna o valor do saldo
  fnc_ValorSaldo = vl_saldo
End Function

txCondicao=Request("txCondicao")
If txCondicao<>"" then
select case txCondicao
		Case 0 ' Invoice Especial
			txCondicao="INVOICE - especial"
			vTxCondicao=0
		Case 1 'Registro da Di - dias corridos a partir da data da Di ***************** OK
		    txCondicao="Registro da DI"
			vTxCondicao=1
		Case 2 ' Conhecimento de embarque - dias corridos a partir da data do conhecimento  OK
		     txCondicao="Conhecimento Embarque"
			 vTxCondicao=2
		Case 3 'Invoice - dias corridos a partir da data da Invoice =(fnc_Mascara(Data_Fatura, 5))***************** OK
		     txCondicao="INVOICE"
			 vTxCondicao=3
		Case 4
		     txCondicao="PROFORMA"
			 vTxCondicao=4
		Case 5 
			 txCondicao=""
			 vTxCondicao=5
		Case 6

		     txCondicao=Request("Condicao")
			 If Request("txCondicao")="INVOICE - especial" then vTxCondicao=0
			 If Request("txCondicao")="Registro da DI" then vTxCondicao=1
			 If Request("txCondicao")="Conhecimento Embarque" then vTxCondicao=2
			 If Request("txCondicao")="INVOICE" then vTxCondicao=3
			 If Request("txCondicao")="PROFORMA" then vTxCondicao=4
			 If Request("txCondicao")="" then vTxCondicao=5

End select	
End if		 
'Monta o listBox - Definição do nome da planilha.
aCondicao = Array("INVOICE - especial","Registro da DI","Conhecimento Embarque","INVOICE","PROFORMA","",txCondicao)
caminho = Server.MapPath("\excel\arquivo")
arquivo = "\inst_custo_"& Session("cd_usuario") &"_"&_
					Year(Date) & Month(Date) & Day(Date) &"_"&_
					Hour(Time) & Minute(Time) & Second(Time) &".xls"
in_show = False
cd_tela = "DET010"
'dados do relatório para serem re-utilizados nos pop-ups
cd_menu_rel = CStr(Request.QueryString("cd_menu_rel"))
cd_subm_rel = CStr(Request.QueryString("cd_subm_rel"))
cd_view_rel = CStr(Request.QueryString("cd_view_rel"))
'recupera os dados do processo
nr_processo = CStr(Request.QueryString("nr_processo"))

data_documento = Right("00" & Day(Date), 2) & "/" & Right("00" & Month(Date), 2) & "/" & Year(Date)
data_item = data_documento
'--------------------------- INICIO EXCLUSÃO DE ITENS --------------------------------------------------------------
If request("flag")=1 then 
   'Response.Redirect("../IMPORT/teste.asp?var1="&nr_processo&"")

	sql="Delete from tfaturamento_cc where nr_processo='"& nr_processo &"' and CD_ITEM= '"& Request("CD_ITEM") &"' AND cd_origem_lanc=5 " 
	objcnn.Execute(sql)
End if

'--------------------------- FIM EXCLUSÃO DE ITENS --------------------------------------------------------------

url = "?cd_menu="&  CStr(Request.QueryString("cd_menu")) &_
			"&cd_subm="&  CStr(Request.QueryString("cd_subm")) &_
			"&cd_view="&  CStr(Request.QueryString("cd_view")) &_
			"&cd_menu_rel="&  CStr(Request.QueryString("cd_menu_rel")) &_
			"&cd_subm_rel="&  CStr(Request.QueryString("cd_subm_rel")) &_
			"&cd_view_rel="&  CStr(Request.QueryString("cd_view_rel")) &_
			"&nr_proc_adm="&  CStr(Request.QueryString("nr_proc_adm")) &_
			"&nr_proc_des="&  CStr(Request.QueryString("nr_proc_des")) &_
			"&nr_processo="&  CStr(Request.QueryString("nr_processo")) &_
			"&cd_unid_neg="&  Request.QueryString("cd_unid_neg") &_
			"&cd_produto="&  Request.QueryString("cd_produto") &_
			"&cd_cliente="&  Request.QueryString("cd_cliente") &_
			"&nr_referencia="&  Request.QueryString("nr_referencia") &_
			"&nr_item_clnte="&  Request.QueryString("nr_item_clnte") &_
			"&cd_empresa="&  Request.QueryString("cd_empresa") &_
			"&NrDias="&  Request.form("NrDias") &_ 
			"&txCondicao="&  Request.form("txCondicao") &_ 
			"&dtDocs="&  Request.form("dtDocs") &_  
			"&Condicao="&  Request.form("Condicao") &_  
			"&Check="& request("check") &_ 
			"&ValEmbalagem="& request.form("ValEmbalagem")
'****************************************** GRAVA NOVO ITEM ************************************************************
vedtCodItem=Request("edtCodItem")
If vedtCodItem <> "" or request.form("check")=1 Then
		vedtNmItem=Request("edtNmItem")
		check=0
		If vedtCodItem <> "" then 
			vdata=Request("data")
			If Request.form("data")=""  then
			    Response.Redirect("inst_despacho_custo.asp"&url&"&msg=Digite uma data para o ítem!")
			End If
			If Request.form("Valor")=""  then
			    Response.Redirect("inst_despacho_custo.asp"&url&"&msg=Digite um Valor para o ítem!")
			else
			    vValor=Ccur(Request("Valor"))
			end if
			SQL="SELECT MAX(CONVERT(INTEGER,NR_LANCAMENTO))+1 AS NR_LANCAMENTO FROM TFATURAMENTO_CC WHERE ISNUMERIC(NR_LANCAMENTO) = 1 and nr_processo= '"& nr_processo &"' " 
			If objrsx.State = adStateOpen Then objrsx.Close()
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			
			ID = objrsx("NR_LANCAMENTO")
						
			sql = "INSERT INTO TFATURAMENTO_CC (NR_LANCAMENTO,NR_PROCESSO,CD_ITEM, DT_LANCAMENTO ,VL_ITEM,cd_origem_lanc) " &_
			"VALUES ('"&ID&"','"& CStr(Request.QueryString("nr_processo")) &"', '"& vedtCodItem &"','"& vdata &"',"& Replace(vValor,",",".")&",5)"
			 objcnn.Execute(sql)
			 If Err.Number <> 0 Then
				tx_erro = "ATENÇÃO: Aconteceu um erro inesperado, ítem não incluído ."
			 End If
			If objrsx.State = adStateOpen Then objrsx.Close()  
		End if
		'Response.Redirect("../IMPORT/teste.asp?var1="&url&"")%>
		<%Response.Redirect("inst_despacho_custo.asp"&url)
End If
'***************************************** FIM GRAVA NOVO ITEM *************************************************************
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--#include virtual="/includes/lay_title.asp"-->
<script language="javascript" src="/includes/script_calendario.js"></script>
<script language="javascript" src="/includes/script_cal_conf.js"></script>
<style type="text/css">


.instrucao {
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
	overflow:auto;
}

.azulEscuro {
	background: #336699;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
	white-space:nowrap;
}
.azulClaro {
	background: #7799CC;
	color: #FFFFFF;
	text-align: center;
	height: 15px;
	border-width: 0px;	
	border-color: #336699;
	white-space:nowrap;
}

.branco {
	background: #FFFFFF;
	height: 15px;
	border-width: 0px;
	border-style: solid;
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
.style2 {height: 15px; border-width: 0px; border-style: solid; border-color: #000000; font-weight: bold; }
.style5 {color: #339966;	font-weight: bold;}
.style6 {color: #FF0000}
.style7 {font-size: 16px;	font-weight: bold;}
.style8 {
	font-size: small;
	font-weight: bold;
	color: #FFFFFF;
}
.style9 {color: #CCCCCC}
.style11 {font-size: x-small}
.style12 {color: #999999}
.style13 {color: #FFFFFF}
.style14 {
	font-size: x-small;
	color: #FFFFFF;
	font-weight: bold;
}
.style15 {
	color: #7799CC;
	font-weight: bold;
}
.style17 {color: #FF0000; font-weight: bold; }
.style18 {color: #7799CC}
.style21 {
	color: #FFFFFF;
	font-weight: bold;
}
.style22 {
	color: #FF0000;
	font-size: x-small;
	font-weight: bold;
}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

MM_reloadPage(true);

function Message(txt) {
alert('o');
return;
}

function fncValidaForm(form) {
	var b = true;
	//verifica dias e condição
	if (form.nrDias.options[form.nrDias.selectedIndex].value=='' || form.txCondicao.options[form.txCondicao.selectedIndex].value=='' || form.Valor.options[form.Valor.selectedIndex].value=='')  {
		if (form.nrDias.options[form.nrDias.selectedIndex].value=='') {
			alert('Selecione o nr. de dias!');
			form.dtDocs.focus();
		}
		if (form.txCondicao.options[form.txCondicao.selectedIndex].value=='') {
			alert('Selecione o tipo de documento!');
			form.dtDocs.focus();
		}
		b=false;
	}
	
	//validação de data
	dt1 = getValidDate(form.dtDocs.value);
	if (dt1==undefined) {
		form.dtDocs.style.background = 'red';
		alert('Verifique campos data: data inválida!');
		form.dtDocs.style.background = 'white';
		form.dtDocs.select();
		form.dtDocs.focus();
		b=false;
	}
	return b;
	
		if (form.Valor.options[form.Valor.selectedIndex].value=='') {
			alert('Valor!');
			form.Valor.focus();
		}
	return b;
	
	
}

function abreProvaReal(nr_processo,vl_tot_geral,EnviaEmbalagem) {
	features = "top=150,left=50,width=200,height=160,scrollbars=no,menubar=no,status=yes";
	window.open('/detalhe/prova_inst_despacho_custo.asp?EnviaEmbalagem='+EnviaEmbalagem+'&vl_tot_geral='+vl_tot_geral+'&nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>', 'win8',features);
}

function fncCondicaoChange(objSelect) {
	if(objSelect.options[objSelect.selectedIndex].value=='') {
		document.frmInstrucao.nrDias.value = '';
	} else {
		if(objSelect.options[objSelect.selectedIndex].value=='1') {
			document.frmInstrucao.nrDias.value = '60';
			document.frmInstrucao.dtDocs.focus();
		}
		//check='1';
		document.frmInstrucao.check.value='1';
		document.frmInstrucao.submit();
	}
}


/*
function fncMudaUnidChange(objSelect) {
	if(objCheck.checked && objSelect.options[objSelect.selectedIndex].value<>'') {
		for(i=0; i< document.frmInstrucao.txNovaUnid.length;i++)
			document.frmInstrucao.txNovaUnid[i].value = objSelect.options[objSelect.selectedIndex].value;
	}
}

function fncUnidIgualClick(objCheck) {
	if(objCheck.checked && document.frmInstrucao.txUnidade.options[document.frmInstrucao.txUnidade.selectedIndex].value<>'') {
		for(i=0; i< document.frmInstrucao.txNovaUnid.length;i++)
			document.frmInstrucao.txNovaUnid[i].value = document.frmInstrucao.txUnidade.options[document.frmInstrucao.txUnidade.selectedIndex].value;
	}
}
*/
//-->

function abreFaturamento(nr_processo) {
	features = "top=100,left=20,width=500,height=350,scrollbars=no,menubar=no";
	window.open('/popup/detalhe_faturamento.asp?nr_processo='+nr_processo+'&cd_menu=<%= cd_menu_rel%>&cd_subm=<%= cd_subm_rel%>&cd_view=<%= cd_view_rel%>',"win6",features);
}

function ExibeDetalhes(vDiv, vFeatures) {
	if (document.getElementById) {
		//recupera os objetos do form que vamos trabalhar
		var x = screen.width;
		var y = screen.height;
		var w = 500;
		var z = 150;
		
		var vCorpo = document.getElementById(vDiv); 
		var vInfo = document.getElementById('divInfo'); 
		var vInfoRodape = document.getElementById('divInfoRodape'); 
		//define a posição do div e exibe na tela
		
		
		vInfo.style.width = w;
		vInfo.style.height = 26;
		vInfo.style.left = 150;
		vInfo.style.top = 164;
		vInfo.style.display = "block";
		vInfo.style.filter = "alpha(opacity=95)";
			
		vCorpo.style.width = w;
		vCorpo.style.height = z;
		vCorpo.style.left = 150;
		vCorpo.style.top = 188;
		vCorpo.style.display = "block";
		vCorpo.style.filter = "alpha(opacity=95)";
		
		vInfoRodape.style.width = w;
		vInfoRodape.style.height = 26;
		vInfoRodape.style.left = 150;
		vInfoRodape.style.top = 338;
		vInfoRodape.style.display = "block";
		vInfoRodape.style.filter = "alpha(opacity=95)";


		//iniciamos o ajax
		var ajax = openAjax();
		//usado o GET para que se possa usar filtros querystring
		ajax.open("POST","recuperado_detalhe.asp?"+vFeatures, true); 
		ajax.onreadystatechange = function() {
			if(ajax.readyState == 1) { //enquanto estiver processando exibe mensagem para acalmar
				vCorpo.innerHTML = "<br>&nbsp;Por favor aguarde, carregando detalhes...";
			}
			if(ajax.readyState == 4) { //agora exibe o que interessa
				if(ajax.status == 200) {
					var vResult = ajax.responseText; //resultado da busca
					vResult = vResult.replace(/\+/g," "); //resolve problemas de acentos
					vResult = unescape(vResult); //continua resolvendo problemas de acento
					vCorpo.innerHTML = vResult;
				} else {
					//alert('Ocorreu um erro ao montar a lista, entre em contato com suporte@myindaia.com.br!');
					vCorpo.innerHTML = ajax.responseText;
				}
			}
		}
		ajax.send(null); // submete
	}
}

function FechaDetalhes(vDiv1, vDiv2, vDiv3) {
	if (document.getElementById) {
		var div = document.getElementById(vDiv1);
		var div2 = document.getElementById(vDiv2);
		var div3 = document.getElementById(vDiv3);
		div.style.display = "none";
		div2.style.display = "none";
		div3.style.display = "none";
	}	
}

function abreExcel(nr_processo) {
	features = "top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,status=yes,resizable=no";
	window.open('/detalhe/inst_despacho_custo_excel.asp<%=url%>',"win7",features); 
}


</script>
</head>
<body class="body" style="scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;">
<%
'Exibição de mensagens - 'Flávio 24/04/2008
Sub alerta(mensagem) 
	response.write "<script>" 
	response.write "alert('"&mensagem&"')" 
	response.write "</script>" 
End Sub 

'******************************************************************************************** Flavio - 31/03/2008	
        Buscaprocesso=CStr(Request.QueryString("nr_processo"))
		With objcmd
			.CommandTimeOut = 9999
			.CommandText    = "sp_Importacao_Custeio3"
			.CommandType    = adCmdStoredProc
			.Parameters.Append = .CreateParameter("@nr_processo"   , adChar   , adParamInput,   18, Buscaprocesso )
			.Parameters.Append = .CreateParameter("@vl_tot_nao_tributavel", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_sub_tot_tributavel", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_comissao", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_tot_geral", adCurrency, adParamOutPut, 14)
			.Parameters.Append = .CreateParameter("@vl_recuperado", adCurrency, adParamOutPut, 14)
			.Execute , , adExecuteNoRecords
			vl_tot_nao_tributavel = .Parameters("@vl_tot_nao_tributavel")
			vl_sub_tot_tributavel = .Parameters("@vl_sub_tot_tributavel")
			vl_comissao = .Parameters("@vl_comissao")
			vl_tot_geral = .Parameters("@vl_tot_geral")
			vl_recuperado = .Parameters("@vl_recuperado")
		End With
'*******************************************************************************************************************		
'response.write vl_comissao
'Response.end

if Request.Form = "" then
  vTitulo = tx_lang_A00094(cd_lang) &" ("& Mid(nr_processo, 5, Len(nr_processo)) & ")"
else
  vTitulo = tx_lang_A00079(cd_lang) &": "& Mid(nr_processo, 5, Len(nr_processo))
end if
%>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"  bgcolor="<%=fundo_div %>">
<tr height="25" align="center" bgcolor="<%=topo_div %>">
		<td colspan="3" valign="top">
        <div id="divInfo" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" height="26" bgcolor="<%=topo_div %>">
        <tr>
        <td width="96%" align="center" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<b><%=tx_lang_TDE001(cd_lang)%>: <%= UCase(Right(nr_processo,10)) %></b></td>
        <td width="4%" align="left" ><a href="#" onClick="FechaDetalhes('divInfoCorpo','divInfoRodape','divInfo');"><img src="/imagens/30/btn_fechar<%=fechar_div %>.gif" width="18" height="17" border="0" alt="<%=tx_lang_POP060(cd_lang)%>"></a>&nbsp;</td>
        </tr>
        </table>
         </div>
        <div id="divInfoCorpo" class="divDetalhes" style="background-color:<%=fundo_div%>;border-color:<%=topo_div%>;scrollbar-face-color: <%=rolagem_menu10%>;scrollbar-track-color: <%=rolagem_menu20%>;scrollbar-arrow-color: <%=rolagem_menu30%>;scrollbar-shadow-color: <%=rolagem_menu40%>;scrollbar-3dlight-color: <%=rolagem_menu50%>;scrollbar-highlight-color: <%=rolagem_menu60%>;scrollbar-darkshadow-color: <%=rolagem_menu70%>;" ></div>       
        <div id="divInfoRodape" class="divInfo" style="overflow:hidden;border-color:<%=topo_div%>;">
        <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=topo_div %>" >
            <tr>
            <td align="right" valign="middle"> <b>
            <img src="/imagens/30/leg_vermelho.gif" border="1" align="absmiddle"> <%=tx_lang_TDE002(cd_lang)%>&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/imagens/30/leg_amarelo.gif" border="1" align="absmiddle">  <%=tx_lang_TDE003(cd_lang)%>&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/imagens/30/leg_cinza.gif" border="1" align="absmiddle"> <%=tx_lang_TDE004(cd_lang)%>&nbsp;&nbsp;&nbsp;</b>
            </td>
            </tr>
        </table>
         </div> 
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr align="center">
					<td width="744" height="25">&nbsp;<font size="2"><b><%= vTitulo%></b></font></td>
					<%
if Request.Form <> "" then
		If objrsx.State = adStateOpen Then objrsx.Close
		sql="select TX_MLE from TDECLARACAO_IMPORTACAO where nr_processo= '"& nr_processo &"'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		vNrDias = Request.Form("nrDias")
		'vTxCondicao = Request.Form("txCondicao")
		vDtDocto = Request.Form("dtDocs")
		VEmbalagem=request.form("ValEmbalagem")
		If	VEmbalagem="" or VEmbalagem=" " then
		     VEmbalagem=0
		End if
		EnviaEmbalagem=formatnumber((VEmbalagem*objrsx("TX_MLE")),2)
		If objrsx.State = adStateOpen Then objrsx.Close
%>
          <td width="88"><a href="javascript:abreProvaReal('<%= nr_processo %>','<%= vl_tot_geral %>,'<%=EnviaEmbalagem%>');"></a></td>
					<td width="17">&nbsp;</td>
				  <td width="25" valign="top"><a href="javascript:abreFaturamento('<%= nr_processo%>');"><a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"></a></td>
					<td width="24"><a href="javascript:abreProvaReal('<%= nr_processo %>','<%= vl_tot_geral %>','<%=EnviaEmbalagem%>');"></a></td>
					<td width="44"><a href="/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"></a></td>
					<td width="23"><table width="66%" border="0" cellspacing="0" cellpadding="2">
                      <tr>
                        <th scope="col"><a href="http://www.myindaiaweb.com.br/excel/download.asp?arquivo=<%= Server.URLEncode(arquivo)%>"><img src="/imagens/30/btn_excel_inst.gif" alt="<%=tx_lang_TDE081(cd_lang)%>" width="16" height="16" border="0"></a></th>
                        <th scope="col"><a href="javascript:abreFaturamento('<%= nr_processo%>');"><img src="../imagens/30/fat_custo.gif" alt="<%=tx_lang_TDE082(cd_lang)%>" width="16" height="16" border="0"></th>
                        <th scope="col"><a href="#" onClick="javascript:window.open('GeraPlanilha.asp<%=url%>','Imprimir','top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=no');"><img src="../imagens/30/btn_excel_Fornec.gif" alt="<%=tx_lang_TDE079(cd_lang)%>" width="38" height="16" border="0"></a></th>
                        <th scope="col"><a href="javascript:abreProvaReal('<%= nr_processo %>','<%= vl_tot_geral %>','<%=EnviaEmbalagem%>');"><img src="/imagens/30/button_edit.gif" alt="<%=tx_lang_TDE078(cd_lang)%>" width="16" height="16" border="0"></a></th>
                        <th scope="col"><a href="#" onClick="javascript:window.open('print_inst_despacho_custo.asp<%=url%>','Imprimir','top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=no');"><img src="/imagens/30/imprimir16.gif" alt="<%=tx_lang_TDE080(cd_lang)%>" width="16" height="16" border="0"></a></th>
                      </tr>
                    </table></td>
					<td width="23"><a href="#" onClick="javascript:window.open('print_inst_despacho_custo.asp<%=url%>','Imprimir','top=100,left=20,width=750,height=550,scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=no');"></a></td>
			    <%
end if		
%>
				</tr>
		 </table>
    </td>
  </tr>	
	<tr>
	<td>
	<%
	sql = " SELECT G.CD_GRUPO, ISNULL(G.IN_PLANILHA_CUSTOS,'0') IN_PLANILHA_CUSTOS "&_
    " FROM TPROCESSO P "&_
    "  INNER JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO "&_
    " WHERE P.NR_PROCESSO ='" & nr_processo &"' "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	Session("cd_grupo_despacho") = objrs.Fields.Item("CD_GRUPO").Value
    Session("planilha_custo") = objrs.Fields.Item("IN_PLANILHA_CUSTOS").Value
	objrs.Close

If inStr("949;503", Session("cd_grupo_despacho")) <> 0 Then
	cd_view = "0627-0301-02"
	
	If objrs.State = adStateOpen Then objrs.Close
	If Session("cd_grupo_despacho") = "949" Then
		sql = "SELECT * FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "' and CD_ITEM = '027' AND IN_CANCELADO = 0"
	Else
		sql = "SELECT * FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "' and CD_ITEM = '027' AND IN_CANCELADO = 0 AND CD_ITEM_NAO_FAT IS NULL"
	End If
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If not objrs.RecordCount > 0 Then
		If objrs.State = adStateOpen Then objrs.Close
		sql = "SELECT ISNULL(VL_TOT_ICMS,0) AS VL_ICMS FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '"& nr_processo &"'"
		objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		If objrs.RecordCount > 0 Then
			If objrs.Fields.Item("VL_ICMS").Value > 0 Then
			SQL="SELECT MAX(CONVERT(INTEGER,NR_LANCAMENTO))+1 AS NR_LANCAMENTO FROM TFATURAMENTO_CC WHERE nr_processo= '"& nr_processo &"' " 
			If objrsx.State = adStateOpen Then objrsx.Close()
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			ID= objrsx("NR_LANCAMENTO")
			sql = "INSERT INTO TFATURAMENTO_CC (NR_LANCAMENTO,NR_PROCESSO,CD_ITEM, DT_LANCAMENTO ,VL_ITEM,cd_origem_lanc) " &_
			"VALUES ('"&ID&"','"& nr_processo &"', '027',GETDATE(),"& Replace(objrs.Fields.Item("VL_ICMS").Value,",",".")&",5)"
			 objcnn.Execute(sql)	
			End If
		End If 
	End If
	%>
     <div id="inicio_especial" class="instrucao" style="width:750px">
    <table width="100%" border="0" cellspacing="2" cellpadding="0">
					<tr>
					<td height="100%" valign="top" style="border: solid 1px <%=bg_detalhes_borda%>;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
                    <tr class="gridtop"  style="background-color:<%=cabec_result%>;">
					<td colspan="4" align="center" height="26"><table width="100%" cellpadding="0" cellspacing="0" border="0" class="table"><tr class="gridtop"  style="background-color:<%=cabec_result%>;"><td width="95%" align="center"><%=UCase(Right(nr_processo,10))%></td><td align="right">&nbsp;<a href="javascript:abreExcel('<%= nr_processo %>');"><img src="/imagens/30/btn_excel_inst.gif"  border="0" alt="<%= tx_lang_TDE100(cd_lang)%>" align="absmiddle"></a>&nbsp;</td></tr></table></td>
					</tr>
<%
If objrs.State = adStateOpen Then objrs.Close
sql = "SELECT " &_
				"  M10_CD_DADO, RTRIM("& tx_lang_dado &") AS M10_NM_DADO, UPPER(RTRIM(M10_AP_CAMPO)) AS M10_AP_CAMPO, M10_TP_DADO, "&_
				"  M10_TP_CONSULTA, M10_NM_TABELA, M10_NM_CHAVE, M10_NM_DESCRICAO, M10_CD_BROKER, " &_
				"  M12_TP_GRUPO, M12_NM_TB_ORIGEM, M12_NM_CH_ORIGEM, M12_NR_ORDEM, M12_IN_MONTA_SQL, M12_IN_OBRIGADO "&_
				"FROM M14_VIEW_CAMPO ( NOLOCK ) " &_
				"  INNER JOIN M12_CAMPO ( NOLOCK ) ON ( M12_CD_CAMPO = M14_CD_CAMPO ) " &_
				"  INNER JOIN M10_DADOS ( NOLOCK ) ON ( M10_CD_DADO  = M12_CD_DADO  ) " &_
				"WHERE M14_CD_VIEW    = "& fnc_QuotedSQL(cd_view) &_
				"  AND M12_TP_EXIBIR >= "& fnc_QuotedSQL(Session("tp_exibir")) &_
				"  AND M12_IN_ATIVO   = 1 " &_
				"  AND M10_IN_ATIVO   = 1 " &_
				"ORDER BY M12_TP_GRUPO, M14_NR_ORDEM"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
	cont = 1
	Do While Not objrs.eof 
	If cont = 1 Then
	If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
	%>	
	<tr bgcolor="<%= bgcolor%>">
    <% End If
    Select Case objrs.Fields.Item("M10_CD_DADO").Value
	Case  "0018"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT RTRIM(LTRIM(CD_REFERENCIA)) + '/' + RTRIM(LTRIM(NR_ITEM_PO)) AS REFERENCIA FROM TREF_CLIENTE WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	Do While Not objrsx.eof
	str = str & Trim(objrsx.Fields.Item("REFERENCIA").Value) & ";"
	objrsx.MoveNext
	If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
	Loop
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0007"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT RTRIM(LTRIM(NM_AREA)) AS AREA FROM TPROCESSO PR INNER JOIN TAREA AR ON(AR.CD_AREA = PR.CD_AREA) WHERE PR.NR_PROCESSO = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("AREA").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0284"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR,DT_REALIZACAO,103) AS REALIZACAO FROM TFOLLOWUP WHERE CD_EVENTO = '164' AND NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("REALIZACAO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0118"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_NOTA AS NOTA FROM TPROCESSO_NF WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	Do While Not objrsx.eof
	str = str & trim(objrsx.Fields.Item("NOTA").Value) & ";"
	objrsx.MoveNext
	If objrsx.eof Then Exit Do Else str = str & "<br>&nbsp;"
	Loop
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0410"
	str = 0
	vl_frete_mn = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOTAL_FRETE_MNEG AS FRETE, VL_TOTAL_FRETE_MN AS FRETE_MN FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	desc_frete_mn = objrs.Fields.Item("M10_NM_DADO").Value
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("FRETE").Value
	vl_frete_mn = objrsx.Fields.Item("FRETE_MN").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0061"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT MB.NM_MOEDA AS MOEDA FROM TDECLARACAO_IMPORTACAO DI INNER JOIN TMOEDA_BROKER MB ON (MB.CD_MOEDA = DI.CD_MOEDA_FRETE) WHERE DI.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("MOEDA").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0296"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT TE.NM_EMPRESA AS EMPRESA FROM TPROCESSO PR INNER JOIN TEMPRESA_EST TE ON (TE.CD_EMPRESA = PR.CD_EXPORTADOR) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("EMPRESA").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0130"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_DCTO_INSTRUCAO AS FATURA FROM TDOCUMENTO_INSTRUCAO WHERE CD_TIPO_DCTO_INSTR = '01' AND NR_PROCESSO = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("FATURA").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%=tx_lang_TDE083(cd_lang)%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0664"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT RTRIM(LTRIM(GP.DIAS_CONDICAO_PAGTO)) + ' DIAS - ' + RTRIM(LTRIM(CASE ISNULL(GP.CONDICAO_PAGTO,'')  WHEN 'I' THEN 'INVOICE' WHEN 'C' THEN 'CONHECIMENTO EMBARQUE' WHEN 'E' THEN 'INVOICE ESPECIAL' WHEN 'R' THEN 'REGISTRO DA DI' WHEN 'P' THEN 'PROFORMA' WHEN 'A' THEN 'ANTECIPADO' END)) AS CONDICAO"&_
		" FROM TPROCESSO GP(NOLOCK)"&_
		" INNER JOIN TESTAGIO_PROCESSO EP ON (EP.NR_PROCESSO_ADM = GP.NR_PROCESSO)"&_
		" WHERE EP.NR_PROCESSO_DES = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
		str = objrsx.Fields.Item("CONDICAO").Value
	End If	
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0666"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT CASE ISNULL(CONDICAO_PAGTO,'') WHEN 'I' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) " &_
	" WHEN 'C' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(FI.RLZ_DT_EV551 AS DATETIME) AS VARCHAR) "&_
	" WHEN 'E' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) "&_
    " WHEN 'R' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(FI.RLZ_DT_EV021 AS DATETIME) AS VARCHAR) " &_ 
    " WHEN 'P' THEN CAST(CAST(GP.DIAS_CONDICAO_PAGTO AS INTEGER) + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) "&_
	" WHEN 'A' THEN 'ANTECIPADO' WHEN ''  THEN CASE SUBSTRING(EP.NR_REFERENCIA,1,4) "&_
	" WHEN '8000' THEN CAST(60 + CAST(POI.DT_FATURA AS DATETIME) AS VARCHAR) ELSE NULL END END AS DT_VENCIMENTO"&_
	" FROM TPROCESSO GP(NOLOCK)"&_
	" INNER JOIN TESTAGIO_PROCESSO EP ON (EP.NR_PROCESSO_ADM = GP.NR_PROCESSO)"&_
	" INNER JOIN TPO_ITEM POI (NOLOCK) ON (POI.NR_PROCESSO = EP.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = EP.NR_ITEM_CLIENTE AND POI.NR_PARCIAL = EP.NR_PARCIAL AND POI.CD_EMPRESA = EP.CD_EMPRESA)"&_
	" INNER JOIN TFLP_IMPORT1 FI (NOLOCK) ON (FI.NR_REFERENCIA = EP.NR_REFERENCIA AND FI.NR_ITEM_CLIENTE = EP.NR_ITEM_CLIENTE AND FI.NR_PARCIAL = EP.NR_PARCIAL AND FI.CD_EMPRESA = EP.CD_EMPRESA)"&_
	" WHERE EP.NR_PROCESSO_DES = '"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
		str = objrsx.Fields.Item("DT_VENCIMENTO").Value
	End If	
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0014"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_CONHECIMENTO AS CONHECIMENTO FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("CONHECIMENTO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0512"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR, DT_CONHECIMENTO, 103) AS DT_CONHECIMENTO FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	

	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("DT_CONHECIMENTO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0044"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT TE.NM_EMBARCACAO AS NAVIO FROM TPROCESSO PR INNER JOIN TEMBARCACAO TE ON (TE.CD_EMBARCACAO = PR.CD_EMBARCACAO) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("NAVIO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0555"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT PB.NM_PAIS AS PAIS FROM TDECLARACAO_IMPORTACAO DI INNER JOIN TPAIS_BROKER PB ON (PB.CD_PAIS = DI.CD_PAIS_ORIG_MERC) WHERE DI.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("PAIS").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%Case  "0012"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT LE.NM_LOCAL_EMB AS LOCAL_EMBARQUE FROM TPROCESSO PR INNER JOIN TLOCAL_EMBARQUE LE ON (LE.CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) WHERE PR.NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("LOCAL_EMBARQUE").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0283"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT NR_DI AS DI FROM TPROCESSO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = fnc_Mascara(Trim(objrsx.Fields.Item("DI").Value),1)
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0306"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT CONVERT(VARCHAR,DT_REALIZACAO,103) AS REALIZACAO FROM TFOLLOWUP WHERE CD_EVENTO = '021' AND NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("REALIZACAO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%=tx_lang_TDE084(cd_lang)%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0413"
	str = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOT_SEGURO_MNEG AS SEGURO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("SEGURO").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0581"
	str = ""
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT DISTINCT ISNULL(TX_MLE, 0) AS TAXA FROM TADICAO_DE_IMPORTACAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' "
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("TAXA").Value
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%=tx_lang_TDE085(cd_lang)%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	Case  "0418"
	str = 0
	vl_seguro_mn = 0
	If objrsx.state=adstateOpen then objrsx.close()
	sql = "SELECT VL_TOTAL_SEG_MN AS SEGURO FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO ='"& nr_processo &"'"
	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
	
	desc_seguro_mn = objrs.Fields.Item("M10_NM_DADO").Value
	
	If objrsx.RecordCount > 0 Then	
	str = objrsx.Fields.Item("SEGURO").Value
	vl_seguro_mn = str
	End If
	 %> 
    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><%= objrs.Fields.Item("M10_NM_DADO").Value%></td>
	<td>&nbsp;<%= str%>&nbsp;</td>
	<%
	End Select
	cont = cont + 1
	If cont = 3 Then%>				
     </tr>             
	<%
	cont = 1
	End if
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
	%>                
</table>
</td>
</tr>
</table>

<%
If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIA_PEDIDO AS RATEIA_PEDIDO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateia_pedido = objrs.Fields.Item("RATEIA_PEDIDO").Value
	Else
		in_rateia_pedido = "0"
	End if
	objrs.Close
	
	If in_rateia_pedido = "1" Then
%>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
<tr>
<td height="100%" valign="top" style="border: solid 1px <%=bg_detalhes_borda%>;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr class="gridtop" style="background-color:<%=cabec_result%>;">
<td colspan="4" align="center" height="26"><%= UCase(tx_lang_TDE086(cd_lang))%></td>
</tr>
<tr><td>
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 0px 1px 1px;">
<col width="80%"><col width="20%">
				<%
                	If objrs.state=adstateOpen then objrs.close()
					vl_mercadoria_total = 0
                    sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN) WHEN '11' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN - VL_TOTAL_SEG_MN) WHEN '01' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_SEG_MN) WHEN '00' THEN (VL_TOTAL_MLE_MN) END AS TOTAL FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
                    
					If objrs.RecordCount > 0 Then	
                    vl_mercadoria_total = objrs.Fields.Item("TOTAL").Value
                    End If
'					Response.write vl_mercadoria_total
'					Response.end
                     %> 
     				<tr bgcolor="<%=linha_result %>">
						<td><%= tx_lang_TDE087(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_mercadoria_total)%></td>
					</tr>
                    <tr bgcolor="#FFFFFF">
						<td><%= tx_lang_TDE088(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_frete_mn)%></td>
					</tr>
                    <tr bgcolor="<%=linha_result %>">
						<td><%= UCase(desc_seguro_mn)%></td>
						<td align="right"><%= FormatNumber(vl_seguro_mn)%></td>
					</tr>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT ISNULL(SUM(VL_ACRESCIMO_ITEM_MN),0) AS ACRESCIMO FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vl_item_fixo = 0
					vl_acrescimo_mn = 0
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn = vl_item_fixo
					End if
					%>
					<tr bgcolor="#FFFFFF">
						<td><%= tx_lang_TDE089(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
					</tr>
					<%					
					vl_item_total_fixo1 = 0
					vl_item_total_fixo1 = vl_frete_mn + vl_seguro_mn + vl_item_fixo + vl_mercadoria_total
					%>
                    <tr bgcolor="<%=linha_result %>">
						<td><B><%= tx_lang_TDE090(cd_lang)%></B></td>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo1)%></b></td>
					</tr>
                    <%
					'Response.end
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.State = adStateOpen Then objrsx.Close
					vl_item_fixo = 0
					nm_item_select = "VL_II_ITEM"
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = " SELECT ISNULL(SUM(ISNULL("& nm_item_select &",0)),0) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "
					
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText					
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
					End if
					%>
					<tr bgcolor="#FFFFFF">
						<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
						<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
					</tr>
					<%					
					vl_item_total_fixo2 = 0
					vl_item_total_fixo2 = vl_item_total_fixo1 + vl_item_fixo
					bgcolor = linha_result
					%>
                    <tr bgcolor="<%= bgcolor%>">
						<td><B><%= tx_lang_TDE091(cd_lang)%></B></td>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo2)%></b></td>
					</tr>
					<%
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								
					Do While Not objrs.Eof
					If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
			        If Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" then
						sql = "SELECT ISNULL(SUM(ISNULL(VL_ITEM,0)),0) AS VL_ITEM FROM (SELECT CASE (SELECT ISNULL(IN_FUNDO_POBREZA,'0') FROM BROKER.DBO.TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO )"&_
						" WHEN '1' THEN SUM(ISNULL(VL_ICMS_ITEM,0))+(SELECT ROUND(SUM(ISNULL(VL_BASE_CALC_ICMS,0)) * ((SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS)/100),2) "&_
					    " FROM TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO) "&_
						" WHEN '0' THEN SUM(ISNULL(VL_ICMS_ITEM,0)) "&_
						" END AS VL_ITEM, D.NR_PROC_PO  "&_
					 " FROM TDETALHE_MERCADORIA D "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"	&_
					" GROUP BY NR_PROC_PO, D.NR_ADICAO ) VW_TEMP "
					Else
						sql = " SELECT ISNULL(SUM(ISNULL("& nm_item_select &",0)),0) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "
					End if			
		            


					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result %>
                    <tr bgcolor="<%= bgcolor%>">
                    <td><nobr>&nbsp;<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%>&nbsp;</nobr></td>
                    <%
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo2 = CDbl(vl_item_total_fixo2) + vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						</tr>
						<%
					objrs.MoveNext
					If objrs.Eof Then Exit Do
					Loop

					vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_total_fixo2
					
					If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
	%>
    	<tr bgcolor="<%= bgcolor%>">
		<td><B><%= tx_lang_TDE092(cd_lang)%></B></td>
		<td align="right"><B><%= FormatNumber(vl_item_total_fixo3)%></B></td>
		</tr>	
    <%          
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT DISTINCT F.CD_ITEM AS CD_ITEM, F.DT_LANCAMENTO, ISNULL(F.VL_ITEM,0) AS VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','091','025','026','600','599','027','032','991','578','994') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.CD_ITEM ASC "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)
	'Response.end
	vl_item_total_fixo4 = 0
	total_item = ""
If Not objrs.Eof Then
	Do While Not objrs.Eof
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
		total_item = total_item & Trim(objrs.Fields.Item("CD_ITEM").Value) 
	  	vl_item_fixo = Trim(objrs.Fields.Item("VL_ITEM").Value)
	  	vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_fixo
		%>
						
		<tr bgcolor="<%= bgcolor%>">
		<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
		<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
		</tr>
		<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do Else total_item = total_item & "','"
	Loop
	total_item = "'" & total_item & "'"
End If
objrs.Close
'objrsx.Close
If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_total_fixo3 - vl_frete_mn - vl_acrescimo_mn
%>
					<tr height="18" bgcolor="<%= bgcolor%>">
						<td><b><%= tx_lang_TDE093(cd_lang)%></b></td>
                        <td align="right"><b><%=FormatNumber(vl_item_total_fixo4)%></b></td>
					</tr>
				</table></td></tr>
                </table>
</td>
</tr>
</table>
<%
	If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIO AS RATEIO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateio_grupo = objrs.Fields.Item("RATEIO").Value
	Else
		in_rateio_grupo = "0"
	End if
	objrs.Close
	
	If in_rateio_grupo = "1" Then
%>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
<tr>
<td height="100%" valign="top" style="border: solid 1px <%=bg_detalhes_borda%>;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
<col width="10px"><col width="200px">
<tr class="gridtop" style="background-color:<%=cabec_result%>;">
<%
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT COUNT(DISTINCT NR_REFERENCIA) AS COUNT_PEDIDO FROM TESTAGIO_PROCESSO WHERE NR_PROCESSO_DES = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					cont_pedido = Trim(objrs.Fields.Item("COUNT_PEDIDO").Value)
					ReDim vl_item_total_fixo1_array(cont_pedido)
					ReDim vl_frete_mn_item(cont_pedido)
					ReDim vl_acrescimo_mn_item(cont_pedido)
					
					if cont_pedido = 0 Then 
						cont_pedido = 1
					End If
					%>
                <td colspan="<%= cont_pedido +1%>" align="center" height="26"><%= UCase(tx_lang_TDE099(cd_lang))%></td>
                </tr>
				<%	
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT DISTINCT NR_PROC_PO AS NR_REFERENCIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					If objrs.RecordCount > 0 Then 
						%>
						<tr class="gridtop" style="background-color:<%=cabec_result%>;">
						<td bgcolor="<%=linha_result %>"></td>
						<% Do While Not objrs.Eof %> 
						<td class="detcampo" align="center" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%= UCase(Trim(objrs.Fields.Item("NR_REFERENCIA").Value))%>&nbsp;</nobr></td>
						<%
						objrs.MoveNext
						If objrs.Eof Then Exit Do
						Loop 
						%>
						</tr> 
                   		 <tr bgcolor="#FFFFFF">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%=tx_lang_TDE087(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_FRETE_ITEM_MN)) WHEN '11' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_FRETE_ITEM_MN) - SUM(VL_SEGURO_ITEM_MN)) WHEN '01' THEN (SUM(VL_MLE_ITEM_MN) - SUM(VL_SEGURO_ITEM_MN)) WHEN '00' THEN (SUM(VL_MLE_ITEM_MN)) END AS VL_ITEM "&_
						  " FROM TDECLARACAO_IMPORTACAO DI "&_
						  " INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
"INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                          " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                          " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
						  " AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                          " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
						  " WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
						  " GROUP BY RC.CD_REFERENCIA, IN_EMBUT_FRT_ITENS, IN_EMBUT_SEG_ITENS "
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					cont_array = 0	
					If objrsx.RecordCount > 0 Then 	
						Do While Not objrsx.Eof	
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
							<%
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next	
					End If
					%>    
					</tr>
                    <tr bgcolor="<%=linha_result %>">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%=tx_lang_TDE088(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_FRETE_ITEM_MN) AS FRETE"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0			
					If objrsx.RecordCount > 0 Then 		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("FRETE").Value)
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next		
					End If
					%>    
					</tr>
                    <tr bgcolor="#FFFFFF">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%= UCase(desc_seguro_mn)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_SEGURO_ITEM_MN) AS SEGURO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0		
					If objrsx.RecordCount > 0 Then 	
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("SEGURO").Value)
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next	
					End If
					
					%>    
					</tr>	
                   <tr bgcolor="<%=linha_result %>">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%=tx_lang_TDE089(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT SUM(VL_ACRESCIMO_ITEM_MN) AS ACRESCIMO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"&_
					" GROUP BY RC.CD_REFERENCIA "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0		
					If objrsx.RecordCount > 0 Then 		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next		
					End If
					%>    
					</tr>
                    <tr bgcolor="#FFFFFF">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;">&nbsp;<B><%=tx_lang_TDE090(cd_lang)%></B>&nbsp;</td>
                        <%
						For i=0 to UBound(vl_item_total_fixo1_array)-1%>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i))%></b></td>
                        <%Next%>
					</tr>
                    <%
					'Response.end
					If objrs.State = adStateOpen Then objrs.Close
					verifica_rateio = 0
					sql = "SELECT NR_PROCESSO "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					" WHERE FC.NR_PROCESSO = '" & nr_processo & "'" 
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrs.RecordCount > 0 Then
						verifica_rateio = 1
					End If
					objrs.Close
					
					If verifica_rateio = 1 Then
					nm_item_select = "VL_II_ITEM"
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "&_
					    " GROUP BY D.NR_PROC_PO "
					
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					%>
						<tr bgcolor="<%=linha_result %>">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>IMP. DE IMPORTAÇÃO&nbsp;&nbsp;</nobr></td>
					<%
					cont_array = 0		
					If objrsx.RecordCount > 0 Then
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
							<%
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop		
					Else
						For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo

						
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next
					End if
					bgcolor = "#FFFFFF"
					%>
                    </tr>
                    <tr bgcolor="<%= bgcolor%>">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;">&nbsp;<%=tx_lang_TDE091(cd_lang)%>&nbsp;</td>
						 <%
						 For i=0 to UBound(vl_item_total_fixo1_array)-1
						 %>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i))%></b></td>
                        <%Next%>
					</tr>
					<%
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
								
					Do While Not objrs.Eof
					cont_array = 0	
					If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
			        If Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" then
						sql = "SELECT SUM(ISNULL(VL_ITEM,0)) AS VL_ITEM FROM (SELECT CASE (SELECT ISNULL(IN_FUNDO_POBREZA,'0') FROM BROKER.DBO.TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO )"&_
						" WHEN '1' THEN SUM(ISNULL(VL_ICMS_ITEM,0))+(SELECT ROUND(SUM(ISNULL(VL_BASE_CALC_ICMS,0)) * ((SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS)/100),2) "&_
					    " FROM TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO) "&_
						" WHEN '0' THEN SUM(ISNULL(VL_ICMS_ITEM,0)) "&_
						" END AS VL_ITEM, D.NR_PROC_PO  "&_
					 " FROM TDETALHE_MERCADORIA D "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"	&_
					" GROUP BY NR_PROC_PO, D.NR_ADICAO ) VW_TEMP "&_
					" GROUP BY NR_PROC_PO "
					Else
						sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "&_
					    " GROUP BY D.NR_PROC_PO "
					End if	
					
					'if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" then
					'response.write sql
					'response.end
					'end if
					
					
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result %>
                    <tr bgcolor="<%= bgcolor%>">
                    <td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%>&nbsp;</nobr></td>
					<% If objrsx.RecordCount > 0 Then 
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
							<%
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop
						%>
						</tr>
						<%
					Else
					For i=1 to cont_pedido
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next
					End If
					objrs.MoveNext
					If objrs.Eof Then Exit Do
					Loop
	
					If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
					%>
						<tr bgcolor="<%= bgcolor%>">
							<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<B><%=tx_lang_TDE092(cd_lang)%></B>&nbsp;</nobr></td>
							<%For i=0 to UBound(vl_item_total_fixo1_array)-1%>
                            <td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i))%></b></td>
                            <%Next%>
						</tr>	
					<%            

	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT CD_ITEM, NM_ITEM FROM TITEM WHERE CD_ITEM IN (" & total_item & ") ORDER BY CD_ITEM ASC"
	'Response.write sql
	'Response.end
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

If Not objrs.Eof Then
  Do While Not objrs.Eof
  cont_array = 0	
  If objrsx.State = adStateOpen Then objrsx.Close
  
  'if Trim(objrs.Fields.Item("CD_ITEM").Value) = "075" Then 
  '	cd_item_select = "027"
  'Else
   cd_item_select = Trim(objrs.Fields.Item("CD_ITEM").Value) 		
  'End If
  
  sql = " SELECT ISNULL(SUM(VL_ITEM_AREA),0) AS VL_ITEM "&_
  " FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
  " INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
  " WHERE (FC.CD_ITEM = '" & cd_item_select & "' OR FC.CD_ITEM = CONVERT(INT,'" & cd_item_select & "'))"&_
  " AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
  " AND FC.NR_PROCESSO = '" & nr_processo & "'"&_
  " GROUP BY RC.CD_REFERENCIA "
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
	'response.write objrsx.RecordCount 
	'response.end
			
  If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result %>
	<tr bgcolor="<%= bgcolor%>">
	<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%>&nbsp;</nobr></td>
	<% If objrsx.RecordCount > 0 Then 
		Do While Not objrsx.Eof 
		
		if cd_item_select = "029" Then
		'Response.write objrsx.Fields.Item("VL_ITEM").Value
		'Response.end
	End If
		
		vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
		vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
		%>
		<td align="right"><%=(vl_item_fixo)%></td>
        <%
		cont_array = cont_array + 1
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
		Loop%>
		</tr>
  <%Else
		For i=1 to cont_pedido
		vl_item_fixo = 0
		%>
			<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
	  <%
	  	cont_array = cont_array + 1
	  	Next
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
Else
If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
<tr height="50" bgcolor="<%= bgcolor%>"><td align="center" colspan="<%= cont_merc + 1%>"><%=tx_lang_TDE097(cd_lang)%></td></tr>
<%
End if
'objrsx.Close
If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
%>
					<tr bgcolor="<%= bgcolor%>">
						<td class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><nobr>&nbsp;<b><%=tx_lang_TDE094(cd_lang)%>&nbsp;<%If verifica_rateio = 1 Then %> <%=tx_lang_TDE095(cd_lang)%><% Else%><%= tx_lang_TDE096(cd_lang)%><% End If%></b>&nbsp;</nobr></td>
                        <%For i=0 to UBound(vl_item_total_fixo1_array)-1%>
                            <td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i))%></b></td>
                        <%Next%>
					</tr> 
<%Else%> 
	<tr bgcolor="#FFFFFF"><td><b><%=tx_lang_TDE098(cd_lang)%></b></td></tr>
<%End If %>                   				
</table>
</td>
</tr>
</table>
<% End If%>
</div>
<%
Else
%>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
<tr>
<td height="100%" valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr class="gridtop">
<td colspan="4" align="center" height="26"><%= UCase(tx_lang_TDE086(cd_lang))%></td>
</tr>
<tr><td>
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 0px 1px 1px;">
<col width="80%"><col width="20%">
				<%
                	If objrs.state=adstateOpen then objrs.close()
					vl_mercadoria_total = 0
                    sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN) WHEN '11' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_FRETE_MN - VL_TOTAL_SEG_MN) WHEN '01' THEN (VL_TOTAL_MLE_MN - VL_TOTAL_SEG_MN) WHEN '00' THEN (VL_TOTAL_MLE_MN) END AS TOTAL FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
                    
					If objrs.RecordCount > 0 Then	
                    vl_mercadoria_total = objrs.Fields.Item("TOTAL").Value
                    End If
'					Response.write vl_mercadoria_total
'					Response.end
                     %> 
     				<tr bgcolor="#FEFEFE">
						<td><%= tx_lang_TDE087(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_mercadoria_total)%></td>
					</tr>
                    <tr bgcolor="#EDEDED">
						<td><%= tx_lang_TDE088(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_frete_mn)%></td>
					</tr>
                    <tr bgcolor="#FEFEFE">
						<td><%= UCase(desc_seguro_mn)%></td>
						<td align="right"><%= FormatNumber(vl_seguro_mn)%></td>
					</tr>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT ISNULL(SUM(VL_ACRESCIMO_ITEM_MN),0) AS ACRESCIMO FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = '" & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					vl_item_fixo = 0
					vl_acrescimo_mn = 0
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn = vl_item_fixo
					End if
					%>
					<tr bgcolor="#EDEDED">
						<td><%= tx_lang_TDE089(cd_lang)%></td>
						<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
					</tr>
					<%					
					vl_item_total_fixo1 = 0
					vl_item_total_fixo1 = vl_frete_mn + vl_seguro_mn + vl_item_fixo + vl_mercadoria_total
					%>
                    <tr bgcolor="#FEFEFE">
						<td><B><%= tx_lang_TDE090(cd_lang)%></B></td>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo1)%></b></td>
					</tr>
                    <%
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM ='025'"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.State = adStateOpen Then objrsx.Close
					vl_item_fixo = 0
					nm_item_select = "VL_II_ITEM"
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrsx.RecordCount > 0 Then
						vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
					End if
					%>
					<tr bgcolor="#EDEDED">
						<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
						<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
					</tr>
					<%					
					vl_item_total_fixo2 = 0
					vl_item_total_fixo2 = vl_item_total_fixo1 + vl_item_fixo
					bgcolor = "#FEFEFE"
					%>
                    <tr bgcolor="<%= bgcolor%>">
						<td><B><%= tx_lang_TDE091(cd_lang)%></B></td>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo2)%></b></td>
					</tr>
					<%
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
							
					vl_item_total_fixo3 = 0				
					Do While Not objrs.Eof
						If objrsx.State = adStateOpen Then objrsx.Close
						vl_item_fixo = 0
						If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
			        If Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" then
						sql = "SELECT SUM(ISNULL(VL_ITEM,0)) AS VL_ITEM FROM (SELECT CASE (SELECT ISNULL(IN_FUNDO_POBREZA,'0') FROM BROKER.DBO.TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO )"&_
						" WHEN '1' THEN SUM(ISNULL(VL_ICMS_ITEM,0))+(SELECT ROUND(SUM(ISNULL(VL_BASE_CALC_ICMS,0)) * ((SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS)/100),2) "&_
					    " FROM TADICAO_DE_IMPORTACAO A WHERE NR_PROCESSO = '" & nr_processo & "' AND A.NR_ADICAO = D.NR_ADICAO) "&_
						" WHEN '0' THEN SUM(ISNULL(VL_ICMS_ITEM,0)) "&_
						" END AS VL_ITEM, D.NR_PROC_PO  "&_
					 " FROM TDETALHE_MERCADORIA D "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"	&_
					" GROUP BY NR_PROC_PO, D.NR_ADICAO ) VW_TEMP "
					Else
						sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM "&_
						" FROM TDETALHE_MERCADORIA D "&_
						" INNER JOIN TADICAO_DE_IMPORTACAO A ON D.NR_ADICAO = A.NR_ADICAO AND D.NR_PROCESSO = A.NR_PROCESSO" &_
					    " WHERE D.NR_PROCESSO = '"& nr_processo &"'"&_
						" AND A.CD_TIPO_BENEF_PIS_COFINS NOT IN ('2','4','5') "
					End if						
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
						
						If objrsx.RecordCount > 0 Then
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
						End if

						If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
						%>
						<tr bgcolor="<%= bgcolor%>">
							<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
							<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
						</tr>
						<%
						vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_fixo
						objrs.MoveNext
						If objrs.Eof Then Exit Do
					Loop
					vl_item_total_fixo3 = vl_item_total_fixo3 + vl_item_total_fixo2
					
					If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
	%>
    	<tr bgcolor="<%= bgcolor%>">
		<td><B><%= tx_lang_TDE092(cd_lang)%></B></td>
		<td align="right"><B><%= FormatNumber(vl_item_total_fixo3)%></B></td>
		</tr>	
    <%            
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT DISTINCT F.CD_ITEM AS CD_ITEM, F.DT_LANCAMENTO, ISNULL(F.VL_ITEM,0) AS VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','091','025','026','600','599','027','032','991','578','994') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.CD_ITEM ASC "
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)
	'response.end
	vl_item_total_fixo4 = 0
	total_item = ""
If Not objrs.Eof Then
	Do While Not objrs.Eof
		If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
		total_item = total_item & Trim(objrs.Fields.Item("CD_ITEM").Value) 
	  	vl_item_fixo = Trim(objrs.Fields.Item("VL_ITEM").Value)
	  	vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_fixo
		%>
						
		<tr bgcolor="<%= bgcolor%>">
		<td><%= Trim(objrs.Fields.Item("NM_ITEM").Value)%></td>
		<td align="right"><%= FormatNumber(vl_item_fixo)%></td>
		</tr>
		<%
		objrs.MoveNext
		If objrs.Eof Then Exit Do Else total_item = total_item & "','"
	Loop
	total_item = "'" & total_item & "'"
End If
objrs.Close
'objrsx.Close
If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
vl_item_total_fixo4 = vl_item_total_fixo4 + vl_item_total_fixo3 - vl_frete_mn - vl_acrescimo_mn
%>
					<tr height="18" bgcolor="<%= bgcolor%>">
						<td><b><%= tx_lang_TDE093(cd_lang)%></b></td>
                        <td align="right"><b><%=FormatNumber(vl_item_total_fixo4)%></b></td>
					</tr>
				</table></td></tr>
                </table>
</td>
</tr>
</table>
<%
	If objrs.state=adstateOpen then objrs.close()
	sql = "SELECT IN_RATEIO AS RATEIO FROM TGRUPO WHERE CD_GRUPO ='" & Session("cd_grupo_despacho") & "'" 

	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	If objrs.RecordCount > 0 Then
		in_rateio_grupo = objrs.Fields.Item("RATEIO").Value
	Else
		in_rateio_grupo = "0"
	End if
	objrs.Close
	
	If in_rateio_grupo = "1" Then
%>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
<tr>
<td height="100%" valign="top" style="border: solid 1px #336699;"><table width="100%" border="0" cellspacing="1" cellpadding="1">
<col width="10px"><col width="200px">
<tr class="gridtop">
<%
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT COUNT(CD_MERCADORIA) AS COUNT_MERCADORIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					cont_merc = Trim(objrs.Fields.Item("COUNT_MERCADORIA").Value)
					ReDim vl_item_total_fixo1_array(cont_merc)
					ReDim vl_frete_mn_item(cont_merc)
					ReDim vl_acrescimo_mn_item(cont_merc)
					
					if cont_merc = 0 Then 
						cont_merc = 1
					End If
					%>
                <td colspan="<%= cont_merc +1%>" align="center" height="26"><%= UCase(tx_lang_TDE099(cd_lang))%></td>
                </tr>
				<%	
                	If objrs.state=adstateOpen then objrs.close()
                    sql = "SELECT CD_MERCADORIA AS CD_MERCADORIA FROM TDETALHE_MERCADORIA ( NOLOCK ) WHERE NR_PROCESSO = '" & nr_processo & "'"
                    objrs.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText	
					If objrs.RecordCount > 0 Then 
						%>
						<tr class="gridtop">
						<td bgcolor="#FFFFFF"></td>
						<% Do While Not objrs.Eof %> 
						<td class="detcampo" align="center"><nobr>&nbsp;<%= UCase(Trim(objrs.Fields.Item("CD_MERCADORIA").Value))%>&nbsp;</nobr></td>
						<%
						objrs.MoveNext
						If objrs.Eof Then Exit Do
						Loop 
						%>
						</tr> 
                   		 <tr>
						<td class="detcampo"><nobr>&nbsp;<%=tx_lang_TDE087(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT CASE CAST(IN_EMBUT_FRT_ITENS AS VARCHAR) + CAST(IN_EMBUT_SEG_ITENS AS VARCHAR) WHEN '10' THEN (VL_MLE_ITEM_MN - VL_FRETE_ITEM_MN) WHEN '11' THEN (VL_MLE_ITEM_MN - VL_FRETE_ITEM_MN - VL_SEGURO_ITEM_MN) WHEN '01' THEN (VL_MLE_ITEM_MN - VL_SEGURO_ITEM_MN) WHEN '00' THEN (VL_MLE_ITEM_MN) END AS VL_ITEM "&_
						  " FROM TDECLARACAO_IMPORTACAO DI "&_
						  " INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
"INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                          " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                          " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
						  " AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                          " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
						  " WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
							objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					cont_array = 0	
					If objrsx.RecordCount > 0 Then 	
						Do While Not objrsx.Eof	
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
							<%
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next	
					End If
					%>    
					</tr>
                    <tr bgcolor="#EDEDED">
						<td class="detcampo"><nobr>&nbsp;<%=tx_lang_TDE088(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_FRETE_ITEM_MN AS FRETE"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0			
					If objrsx.RecordCount > 0 Then 		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("FRETE").Value)
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_frete_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next		
					End If
					%>    
					</tr>
                    <tr bgcolor="#FEFEFE">
						<td class="detcampo"><nobr>&nbsp;<%= UCase(desc_seguro_mn)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_SEGURO_ITEM_MN AS SEGURO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0		
					If objrsx.RecordCount > 0 Then 	
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("SEGURO").Value)
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next	
					End If
					%>    
					</tr>	
                   <tr bgcolor="#EDEDED">
						<td class="detcampo"><nobr>&nbsp;<%=tx_lang_TDE089(cd_lang)%>&nbsp;</nobr></td>
                    <%
					If objrsx.State = adStateOpen Then objrsx.Close
					sql = "SELECT VL_ACRESCIMO_ITEM_MN AS ACRESCIMO"&_
					" FROM TDECLARACAO_IMPORTACAO DI "&_
					" INNER JOIN TDETALHE_MERCADORIA DM ON (DM.NR_PROCESSO = DI.NR_PROCESSO)"&_
					" INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = DM.NR_PROCESSO)"&_
                    " AND (RC.CD_REFERENCIA = DM.NR_PROC_PO)"&_
                    " AND (RC.NR_ITEM_PO = DM.NR_ITEM_PO)"&_
					" AND (RC.CD_EMPRESA = DM.CD_EMPRESA)"&_
                    " AND (ISNULL(RC.NR_PARCIAL, 0) = ISNULL(DM.NR_PARCIAL, 0))"&_
					" WHERE DI.NR_PROCESSO = '"  & nr_processo & "'"
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					cont_array = 0		
					If objrsx.RecordCount > 0 Then 		
						Do While Not objrsx.Eof	
						vl_item_fixo = Trim(objrsx.Fields.Item("ACRESCIMO").Value)
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						objrsx.MoveNext
						If objrsx.Eof Then Exit Do
						Loop 
					Else
						For i=1 to cont_merc
						vl_item_fixo = 0
						vl_acrescimo_mn_item(cont_array) = vl_item_fixo
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array))
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next		
					End If
					%>    
					</tr>
                    <tr bgcolor="#FEFEFE">
						<td class="detcampo">&nbsp;<B><%=tx_lang_TDE090(cd_lang)%></B>&nbsp;</td>
                        <%For i=0 to UBound(vl_item_total_fixo1_array)-1%>
						<td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i)+vl_frete_mn_item(i)+vl_acrescimo_mn_item(i))%></b></td>
                        <%Next%>
					</tr>
                    <%
					
					If objrs.State = adStateOpen Then objrs.Close
					verifica_rateio = 0
					sql = "SELECT NR_PROCESSO "&_
					" FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
					"WHERE NR_PROCESSO = '" & nr_processo & "'" 
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
					
					If objrs.RecordCount > 0 Then
						verifica_rateio = 1
					End If
					objrs.Close
					
					If verifica_rateio = 1 Then
				
					
					If objrs.State = adStateOpen Then objrs.Close
					sql = "SELECT I.NM_ITEM AS NM_ITEM, I.CD_ITEM AS CD_ITEM FROM TITEM I "&_
					" WHERE CD_ITEM IN ('026','600','599','027','032','025')"
					objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
										bgcolor = "#FEFEFE"			
					Do While Not objrs.Eof
					cont_array = 0	
					If objrsx.State = adStateOpen Then objrsx.Close
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "026" Then
						nm_item_select = "VL_IPI_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "600" Then
						nm_item_select = "VL_PIS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "599" Then
						nm_item_select = "VL_COFINS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "027" Then
						nm_item_select = "VL_ICMS_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "032" Then
						nm_item_select = "VL_TX_SCX_ITEM"
					End If
					
					if Trim(objrs.Fields.Item("CD_ITEM").Value) = "025" Then
						nm_item_select = "VL_II_ITEM"
					End If
					
					sql = " SELECT SUM(ISNULL("& nm_item_select &",0)) AS VL_ITEM"&_
					" FROM TDETALHE_MERCADORIA "&_
					" WHERE NR_PROCESSO = '"& nr_processo &"'"&_
					" GROUP BY NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL "
                    objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

					
					
					If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE" %>
                    <tr bgcolor="<%= bgcolor%>">
                    <td class="detcampo"><nobr>&nbsp;<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%>&nbsp;</nobr></td>
					<% If objrsx.RecordCount > 0 Then 
						Do While Not objrsx.Eof 
							vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
							vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
							%>
							<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
							<%
							cont_array = cont_array + 1
							objrsx.MoveNext
							If objrsx.Eof Then Exit Do
						Loop
						%>
						</tr>
						<%
					Else
					For i=1 to cont_merc
						vl_item_fixo = 0
						vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
						%>
						<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
						<%
						cont_array = cont_array + 1
						Next
					End If
					objrs.MoveNext
					If objrs.Eof Then Exit Do
					Loop
	
					If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
					%>
						<tr bgcolor="<%= bgcolor%>">
							<td class="detcampo"><nobr>&nbsp;<B><%=tx_lang_TDE092(cd_lang)%></B>&nbsp;</nobr></td>
							<%For i=0 to UBound(vl_item_total_fixo1_array)-1%>
                            <td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i))%></b></td>
                            <%Next%>
						</tr>	
					<%            
	If objrs.State = adStateOpen Then objrs.Close
	sql = "SELECT CD_ITEM, NM_ITEM FROM TITEM WHERE CD_ITEM IN (" & total_item & ") ORDER BY CD_ITEM ASC"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	'Response.Write(sql)

If Not objrs.Eof Then
  Do While Not objrs.Eof
  cont_array = 0	
  If objrsx.State = adStateOpen Then objrsx.Close
  
  'if Trim(objrs.Fields.Item("CD_ITEM").Value) = "075" Then 
  '	cd_item_select = "027"
  'Else
    cd_item_select = Trim(objrs.Fields.Item("CD_ITEM").Value) 		
  'End If
  
  sql = " SELECT ISNULL(VL_ITEM_AREA,0) AS VL_ITEM "&_
  " FROM TFAT_CALCULO_RATEIO_DESP FC (NOLOCK) "&_
  " INNER JOIN TREF_CLIENTE RC ON (RC.NR_PROCESSO = FC.NR_PROCESSO)"&_
  " WHERE (FC.CD_ITEM = '" & cd_item_select & "' OR FC.CD_ITEM = CONVERT(INT,'" & cd_item_select & "'))"&_
  " AND (RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.CD_EMPRESA)) +'/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) = FC.CD_REFERENCIA OR RTRIM(LTRIM(RC.CD_REFERENCIA)) + '/' + RTRIM(LTRIM(RC.NR_ITEM_PO)) + '/' + RTRIM(LTRIM(RC.NR_PARCIAL)) = FC.CD_REFERENCIA) "&_
  " AND FC.NR_PROCESSO = '" & nr_processo & "'"
  objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
  
			
  If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE" %>
	<tr bgcolor="<%= bgcolor%>">
	<td class="detcampo"><nobr>&nbsp;<%= Trim(objrs.Fields.Item("NM_ITEM").Value)%>&nbsp;</nobr></td>
	<% If objrsx.RecordCount > 0 Then 
		Do While Not objrsx.Eof 
		vl_item_fixo = Trim(objrsx.Fields.Item("VL_ITEM").Value)
		vl_item_total_fixo1_array(cont_array) = CDbl(vl_item_total_fixo1_array(cont_array)) + vl_item_fixo
		%>
		<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
        <%
		cont_array = cont_array + 1
		objrsx.MoveNext
		If objrsx.Eof Then Exit Do
		Loop%>
		</tr>
  <%Else
		For i=1 to cont_merc
		vl_item_fixo = 0
		%>
			<td align="right"><%=FormatNumber(vl_item_fixo)%></td>
	  <%
	  	cont_array = cont_array + 1
	  	Next
	End If
	objrs.MoveNext
	If objrs.Eof Then Exit Do
	Loop
End If
objrs.Close
Else
If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
<tr height="50" bgcolor="<%= bgcolor%>"><td align="center" colspan="<%= cont_merc + 1%>"><%=tx_lang_TDE097(cd_lang)%></td></tr>
<%
End if
'objrsx.Close
If bgcolor = "#FEFEFE" Then bgcolor = "#EDEDED" Else bgcolor = "#FEFEFE"
%>
					<tr bgcolor="<%= bgcolor%>">
						<td class="detcampo"><nobr>&nbsp;<b><%=tx_lang_TDE094(cd_lang)%> <%If verifica_rateio = 1 Then %> <%=tx_lang_TDE095(cd_lang)%><% Else%><%= tx_lang_TDE096(cd_lang)%><% End If%></b>&nbsp;</nobr></td>
                        <%For i=0 to UBound(vl_item_total_fixo1_array)-1%>
                            <td align="right"><b><%= FormatNumber(vl_item_total_fixo1_array(i))%></b></td>
                        <%Next%>
					</tr> 
<%Else%> 
	<tr bgcolor="#FEFEFE"><td><b><%=tx_lang_TDE098(cd_lang)%></b></td></tr>
<%End If %>                   				
</table>
</td>
</tr>
</table>
<% End If%>
</div>
<%
End If
Else	
if Request.Form = "" then
  sql = "SELECT DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, "&_
				"  DM.CD_MERCADORIA, ME.AP_MERCADORIA, DM.QT_MERC_UN_COMERC, UM.NM_SIGLA, DP.CD_EXTERNO "&_
	      "FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON (DM.NR_PROCESSO    = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA         ME (NOLOCK) ON (ME.CD_MERCADORIA  = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TUNID_MEDIDA_BROKER UM (NOLOCK) ON (UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) "&_
				"  LEFT JOIN TPO_ITEM TPO (NOLOCK) ON (TPO.NR_ITEM=DM.NR_ITEM_PO) "&_
                "   LEFT JOIN TDE_PARA DP (NOLOCK) ON (DP.CD_TABELA = '20' AND DP.CD_DDBROKER = UM.NM_SIGLA) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
	objrs.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	if objrs.RecordCount > 0 then
%>
      <div id="inicio" class="instrucao">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="vertical-align:middle;">
<form name="frmInstrucao" action="" method="post" onSubmit="return fncValidaForm(this);">				
					<tr height="25">
					  <td><br /><table width="98%" border="0" align="center" cellspacing="0">
                        <tr>
                          <td><b><%=tx_lang_TDE009(cd_lang)%></b></td>
                          <td><%=request("msg1")%></td>
                          <td><b><%=tx_lang_TDE011(cd_lang)%></b></td>
                        </tr>
                        <tr>
                          <td width="62"><select name="nrDias" id="dias" class="select" style="width:140px;">
                            <option value="<%=request("NrDias")%>" selected><%=request("NrDias")%></option>
                            <option value="15">15</option>
                            <option value="30">30</option>
                            <option value="45">45</option>
                            <option value="60">60</option>
                            <option value="75">75</option>
                            <option value="90">90</option>
                            <option value="120">120</option>
                            <option value="180">180</option>
                            <option value="Antecipado"><%=tx_lang_TDE025(cd_lang)%></option>
                            <option value="sem_cobertura"><%=tx_lang_TDE026(cd_lang)%></option>
                          </select></td>
                          <td width="211"><%=tx_lang_TDE010(cd_lang)%>
                          <select name="txCondicao" id="condicao" class="select" style="width: 155px;" onChange="fncCondicaoChange(this);">
                              <%
	for x = 0 to UBound(aCondicao)-1
	if aCondicao(UBound(aCondicao))=aCondicao(x) then 
		Response.Write("<option value='"& x &"' selected>"& aCondicao(x) &"</option>")
	    Condicao=aCondicao(x)
	else
		Response.Write("<option value='"& x &"' >"& aCondicao(x) &"</option>")
	End if
	next
%>		
                            </select>
                            <input type="hidden" name="check" id="check" value="0"></td>
                            <input type="hidden" name="Condicao" id="Condicao" value="<%=Condicao%>">
                            <td width="425"><input name="dtDocs" type="text" class="editbox" id="Docs" style="width: 75px;" value="<%=data_documento %>" maxlength="10">
                            <a href="javascript:showCal('InstCusto')"><img height=16 width=16 border=0 src="/imagens/30/calendar1.gif" align="absmiddle"></a> <%=tx_lang_TDE012(cd_lang)%></td>
                        </tr>                        
                        <tr>
                          <td height="26" colspan="3"><table width="100%" border="0" cellspacing="0">
                            <tr class="gridtit" style="background-color:<%=cabec_result%>;">
                              <td height="26"><%=tx_lang_TDE022(cd_lang)%></td>
                            </tr>                            
                            <tr bgcolor="<%=linha_result %>">
                              <td height="28"><b><%=tx_lang_TDE013(cd_lang)%>:</b>&nbsp;
                                <label>
                                <input type="text" name="ValEmbalagem" id="ValEmbalagem" size="10" maxlength="10" class="editbox" style="width: 180px;" onBlur="ValidaValor(this);">
                                </label></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table>
				      <br></td>
		    </tr>
					<!--
					<tr height="25">
						<td colspan="2"><label for="txUnid">Unidade de medida para as mercadorias do processo:</label>
							<select name="txUnid" id="txUnid" class="select" style="width:45px;" onChange="fncMudaUnidChange(this);">
								<option value="" selected>--</option>
								<option value="CX">CX</option>
								<option value="JG">JG</option>
								<option value="KG">KG</option>
								<option value="KIT">KIT</option>
								<option value="KT">KT</option>
								<option value="LB">LB</option>
								<option value="LT">LT</option>
								<option value="M">M</option>
								<option value="M2">M2</option>
								<option value="PÇ">PÇ</option>
							</select></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><input name="InUnidIgual" id="UnidIgual" type="checkbox" value="1" onClick="fncUnidIgualClick(this);">
							<label id="UnidIgual">Todas mercadorias tem a mesma unidade de medida?</label></td>
					</tr>
					-->
					<tr>
						<td align="center"><table width="98%" border="0" cellpadding="0" cellspacing="0">
<tr height="20" class="gridtit" style="background-color:<%=cabec_result%>;">
  <td height="26" colspan="4"><%=tx_lang_TDE014(cd_lang)%></td>
  </tr>
<tr height="20">
<td width="38%" height="20" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><b><%=tx_lang_TDE015(cd_lang)%></b></td>
<td width="23%" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><b><%=tx_lang_TDE016(cd_lang)%></b></td>
<td width="21%" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><b><%=tx_lang_TDE017(cd_lang)%></b></td>
<td width="18%" class="detcampo" style="background-color:<%=bg_detalhes_campo%>;"><b><%=tx_lang_TDE018(cd_lang)%></b></td>
</tr>
<%		do while not objrs.Eof 
        if bgcolor = linha_result then bgcolor = "#FFFFFF" else bgcolor = linha_result
%>
						<tr height="16" bgcolor="<%=bgcolor %>">
							<td height="28"><%= objrs.Fields.Item("AP_MERCADORIA").Value%>&nbsp;
							<input name="cdMercadoria" type="hidden" id="cdMercadoria" value="<%= Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.Fields.Item("CD_MERCADORIA").Value)%>"></td>
							<td align="right"><%= FormatNumber(objrs.Fields.Item("QT_MERC_UN_COMERC").Value, 3) &" "& objrs.Fields.Item("NM_SIGLA").Value%>&nbsp;</td>
							<td align="right"><%= objrs.Fields.Item("CD_EXTERNO").Value%>&nbsp;</td>									
					<td align="right"><nobr>
				<input type="text" name="nrNovaQtde" class="editbox" style="width:60px;">
										<select name="txNovaUnid" id="txNovaUnid" class="select" style="width:45px;">
											<option value="<%= objrs.Fields.Item("NM_SIGLA").Value%>" selected><%= objrs.Fields.Item("NM_SIGLA").Value%></option>
     									<!--#include virtual="/selects/option_unidmedsg.txt"-->
										</select>
								  </nobr></td>
						  </tr>
								<%
			objrs.MoveNext
			if objrs.eof then exit do
		loop
%>
					  </table>
					  <br></td>
					</tr>
					<tr height="45">
					  <td align="center"><table width="98%" border="0" cellspacing="0">
                        <tr>
                        <td width="678" bgcolor="<%=cabec_result %>"><table width="698" border="0">
                          <tr>
                            <td width="60" height="21" class="gridtit" style="background-color:<%=cabec_result%>;">&nbsp;<%=tx_lang_TDE019(cd_lang)%></td>
                            <td width="467"><%=request("Msg")%></td>
                            <td width="154"><table width="140" height="17" border="0" align="right" cellspacing="0">
                                <tr>
                                  <td width="107" height="14" align="right" class="gridtit" style="background-color:<%=cabec_result%>;"><nobr><%=tx_lang_TDE021(cd_lang)%></nobr></td>
                                  <td width="14" bgcolor="#FFCC99">&nbsp;</td>
                                </tr>
                            </table></td>
                          </tr>
                        </table></td>
                        </tr>
                        <tr bgcolor="<%=linha_result %>">
                          <td ><table width="687" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><b><%=tx_lang_TDE020(cd_lang)%></b></td>
                              <td><b><%=tx_lang_TDE019(cd_lang)%></b></td>
                              <td><b><%=tx_lang_TDE013(cd_lang)%></b></td>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td width="203" height="24" valign="top"><label>
                                <input name="data" type="text" class="editbox" id="data" style="width: 75px;" value="<%=data_item%>" maxlength="10">
                                </label>
                                  <a href="javascript:showCal('InstCusto2')"><img src="/imagens/30/calendar1.gif" alt="Clique para selecionar uma data" width=16 height=16 border=0 align="absmiddle"></a> (<%=Right(tx_lang_TDE012(cd_lang),11)%></td>
                        <td width="315" valign="top"><label>
                                <input name="edtCodItem" type="text" class="editbox" id="exp" style="width: 40px;"  onBlur="FastLookup('TITEM','CD_ITEM','NM_ITEM',this,'edtNmItem');" maxlength="3">
                                </label>
                                  <input type="text" name="edtNmItem" id="edtNmItem" class="editbox" style="width: 220px;">
                                  <%
	if Not Session("cargo_interno") = "1" then
		str = "ConsultaOnLineSQL(10,'CD_ITEM,NM_ITEM');"
	else
		str = "ConsultaOnLine('TITEM','CD_ITEM,NM_ITEM','&Iacute;tem ,Descri&ccedil;&atilde;o','CD_ITEM','','edtCodItem');"
	end if
%>
                                  <img src="/imagens/30/btn_folder.gif" width="16" height="16" border="0" alt="Consulta &iacute;tens dispon&iacute;veis" style="cursor: hand;" align="absmiddle" onClick="<%= str%>"></td>
                              <td width="130" valign="top"><input type="text" name="Valor" id="Valor" class='editbox' style="width: 120px;" onBlur="ValidaValor(this);"></td>
                              <td width="20"><a href="javascript:document.frmInstrucao.submit()"><img src="../imagens/30/add.gif" alt="Inserir item" border="0" onClick="fncValidaForm()"></a> </td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><br /><div align="right">
                          
<!--********************************************** INÍCIO DO GRID ********************************************************************* -->                          
<table width="100%" border="0" cellspacing="1" cellpadding="0" style="padding: 1px 0px 1px 1px;">
<%
	If objrsy.State = adStateOpen Then objrsy.Close
	sql = "SELECT * FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "' and CD_ITEM = '991' AND IN_CANCELADO = 0"
	objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	If not objrsy.RecordCount > 0 Then
		If objrsy.State = adStateOpen Then objrsy.Close
		sql = "SELECT ISNULL(VL_NUMERARIO,0) AS VL_NUMERARIO FROM MYMONEY.DBO.VW_DOCUMENTO_NUMERARIO_TOTAL WHERE NR_PROCESSO = '"& nr_processo &"'"
		objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
		
		If objrsy.RecordCount > 0 Then
			If objrsy.Fields.Item("VL_NUMERARIO").Value > 0 Then
			SQL = "SELECT MAX(CONVERT(INTEGER,NR_LANCAMENTO))+1 AS NR_LANCAMENTO FROM TFATURAMENTO_CC WHERE nr_processo= '"& nr_processo &"' " 
			If objrsx.State = adStateOpen Then objrsx.Close()
			objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
			ID = objrsx("NR_LANCAMENTO") 
			sql = "INSERT INTO TFATURAMENTO_CC (NR_LANCAMENTO,NR_PROCESSO,CD_ITEM, DT_LANCAMENTO ,VL_ITEM,cd_origem_lanc) " &_
			"VALUES ('"&ID&"','"& nr_processo &"', '991',GETDATE(),"& Replace(objrsy.Fields.Item("VL_NUMERARIO").Value,",",".")&",5)"
			 objcnn.Execute(sql)	
			End If
		End If 
	End If

	If objrsy.State = adStateOpen Then objrsy.Close
	sql = "SELECT DISTINCT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','027','026','600','599','032','025','002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC "
	objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
	
	
	
	vl_item  = 0
	vl_saldo = 0
	credito  = "0,00"
	debito   = "0,00"
	saldo    = "0,00"

in_restitui = False
'seleciona os itens restituidos
'If objrsx.State = adStateOpen Then objrsx.Close
'sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
'			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
'			"WHERE F.CD_ITEM = I.CD_ITEM "&_
'			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
'			"  AND F.IN_CANCELADO = 0 "&_
'			"  AND F.IN_RESTITUI  = 1 "&_
'			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
'			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
'			"GROUP BY F.NR_PROCESSO, F.CD_ITEM"
'objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'If objrsx.RecordCount > 0 Then in_restitui = True

If objrsy.Eof Then
%>
					<tr>
					  <td>&nbsp;</td>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
Else
  If objrsy.RecordCount < 15 Then col = 86 Else col = 70
  %>
  <tr >
					<td colspan="6" class="gridtit" style="background-color:<%=cabec_result%>;"><div align="center" style="font-size: 12px"><b>Despesas</b></div></td>
				</tr>
  <%
  Do While Not objrsy.Eof
	If objrsf.State = adStateOpen Then objrsf.Close
	sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ITEM = '"&objrsy.Fields.Item("CD_ITEM").Value&"' "  &_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM NOT IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
    'alterna a cor das linhas
		If bgcolor = linha_result Then bgcolor = "#FFFFFF" Else bgcolor = linha_result
		'calculo do valor do item
		vl_item = objrsy.Fields.Item("VL_ITEM").Value
		'verifica se ocorreu restituicao
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			str = "CD_ITEM = "& fnc_QuotedSQL(objrsy.Fields.Item("CD_ITEM").Value)
			objrsx.Find str, 0, adSearchForward
			'verifica se o registro foi encontrado
'			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 2) > 0 Then
			'verifica se &eacute; d&eacute;bito ou cr&eacute;dito
			credito = ""
			debito  = ""
			If objrsy.Fields.Item("TP_NATUREZA").Value = "C" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
				vl_saldo = fnc_ValorSaldo(vl_item, vl_saldo)
				'verifica se o saldo &eacute; positivo ou negativo
				If Round(vl_saldo, 2) >= 0 Then
					saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
				Else
					saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
				End If
			If varCheck=1 then bgcolor="#FFCC99"
			
%>
					
					<tr bgcolor="<%= bgcolor%>">
					  <td width="24"><a href="inst_despacho_custo.asp<%=url%>&flag=1&CD_ITEM=<%=objrsy.Fields.Item("CD_ITEM").Value%>"><%If varCheck=1 THEN %><img src="../imagens/30/lixeira16.gif" alt="Ecluir" width="16" height="16" border="0"><%END IF%></a></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td width="342"><%= Trim(objrsy.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrsy.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="62" align="right"><%= saldo%></td>
					</tr>
					<%
			objrsy.MoveNext
		Else
			objrsy.MoveNext
		End If
		
		If objrsy.Eof Then Exit Do
	Loop
End If
%>
<tr height="18">
						<td colspan="3"><i><%= tx_lang_POP030(cd_lang)%></i></td>
						<td colspan="2" align="right"><b><%= tx_lang_POP024(cd_lang)%>:</b></td>
						<td align="right"><b><%= saldo%></b></td>
					</tr>
<%
objrsy.Close
If objrsy.State = adStateOpen Then objrsy.Close

If Not InStr("028;949;503", Session("cd_grupo_despacho")) <> 0 Then
    sql = "SELECT DISTINCT NR_PROCESSO_COMPLETO AS NR_PROCESSO, CONVERT(VARCHAR, DT_CALCULO, 103) AS DATA, VL_TOT_ICMS AS VL_ICMS, "&_
    "    VL_TOTAL_IPI AS VL_IPI, ISNULL(VL_PIS,0) AS VL_PIS, ISNULL(VL_COFINS,0) AS VL_COFINS, VL_TRIBUTO_PAGO AS VL_SISCOMEX, VL_TOTAL_II AS VL_II  "&_   
    "    FROM BROKER.DBO.VW_RESUMO_DI "&_
    "    WHERE NR_PROCESSO_COMPLETO = '" & nr_processo & "' "
Else
    sql = "SELECT DISTINCT DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4) AS DATA, SUM(ISNULL(AI.VL_ICMS_A_RECOLHER,0)) AS VL_ICMS, "&_
	" SUM(ISNULL(TR.VL_IPT_A_RECOLHER,0)) AS VL_IPI, SUM(ISNULL(AI.VL_PIS,0)) AS VL_PIS, SUM(ISNULL(AI.VL_COFINS,0)) AS VL_COFINS, SUM(ISNULL(AI.VL_TX_SCX_AD,0)) AS VL_SISCOMEX, SUM(ISNULL(TR2.VL_IPT_A_RECOLHER,0)) AS VL_II "&_
    " FROM TDECLARACAO_IMPORTACAO DI "&_
    " LEFT JOIN TADICAO_DE_IMPORTACAO AI ON (AI.NR_PROCESSO = DI.NR_PROCESSO)"&_
	" LEFT JOIN TRIBUTO TR ON (TR.NR_PROCESSO = AI.NR_PROCESSO AND TR.NR_ADICAO = AI.NR_ADICAO AND TR.CD_RECEITA_IMPOSTO = '0002')" &_
	" LEFT JOIN TRIBUTO TR2 ON (TR2.NR_PROCESSO = AI.NR_PROCESSO AND TR2.NR_ADICAO = AI.NR_ADICAO AND TR2.CD_RECEITA_IMPOSTO = '0001')" &_
    " WHERE DI.NR_PROCESSO = '"& nr_processo & "'"&_
	" GROUP BY DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4)"&_
    " ORDER BY DI.NR_PROCESSO "
End If
objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'objrsx.Close

'Response.write sql
'Response.end
            %>
                
				<tr>
					<td colspan="6" class="gridtit" style="background-color:<%=cabec_result%>;"><div align="center" style="font-size: 12px"><b>Impostos/Despesas (Cliente)</b></div></td>
				</tr>
                <tr bgcolor="#FFFFFF">
					  <td width="24">&nbsp;</td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">027-ICMS</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_ICMS").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="<%=linha_result %>">
					  <td width="24"></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">026-IPI</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_IPI").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="#FFFFFF">
					  <td width="24"></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">600-PIS/PASEP IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_PIS").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>
                <tr bgcolor="<%=linha_result %>">
					  <td width="24"></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">599-COFINS - IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_COFINS").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>  
                    <tr bgcolor="#FFFFFF">
					  <td width="24"></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">032-TAXA SISCOMEX</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_SISCOMEX").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>
                     <tr bgcolor="<%=linha_result %>">
					  <td width="24"></td>
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">025-IMP. DE IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_II").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>   
                    <%
                   If objrsf.State = adStateOpen Then objrsf.Close
	        sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
			
			Do While Not objrsf.Eof
			%>
        		<tr bgcolor="#FFCC99">
					<td width="24"><a href="inst_despacho_custo.asp<%=url%>&flag=1&CD_ITEM=<%=objrsf.Fields.Item("CD_ITEM").Value%>"><%If varCheck=1 THEN %><img src="../imagens/30/btn_delete.gif" alt="Excluir" width="16" height="16" border="0"><%END IF%></a></td>
					<td width="143" height="20"><%= fnc_Mascara(objrsf.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
					<td width="342"><%= Trim(objrsf.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrsf.Fields.Item("NM_ITEM").Value)%></td>
					<td width="60" align="right">&nbsp;</td>
					<td width="60" align="right"><%= FormatNumber(Trim(objrsf.Fields.Item("VL_ITEM").Value))%></td>
					<td width="62" align="right">&nbsp;</td>
     			</tr>    
            <%
			  objrsf.MoveNext
			Loop
%> 
                    
                    
                       
				</table>


<!--********************************************** FIM DO GRID ********************************************************************* -->                          
                          </div></td>
                        </tr>
                        
                      </table>
                      <div align="left"><nobr><input type="checkbox" name="AgrupaItens" id="AgrupaItens" checked><b>Agrupar pedido/item igual</b>&nbsp;&nbsp;</nobr></div>
                      </td>
		    </tr>
            <tr height="30" bgcolor="<%=topo_div %>">
				<td align="center"><div align="right">
				<input class="button" name="btnEnviar" type="submit" value="<%=tx_lang_TDE024(cd_lang)%>">
				<input class="button" name="btnLimpar" type="reset" value="<%=tx_lang_TDE023(cd_lang)%>">
				<input class="button" name="btnCancel" type="button" value="<%=tx_lang_POP076(cd_lang)%>" onClick="window.close();">
				&nbsp;&nbsp;</div></td>
		    </tr>								
				</form>                
		</table>
	  </div>

			<%
  else
	%>
		    <p align="center">Não foram encontradas informações de custo suficientes para este processo.</p>	
<%
  end if				
else
	If Request.form("AgrupaItens") = "on" Then
	sql = "select NR_PROCESSO, NR_DI, NR_CONHECIMENTO, TP_FRETE, CD_VIA_TRANSPORTE, "&_
	" DT_EMBARQUE, DT_REGISTRO_DI, DT_CHEGADA_CARGA, CD_INCOTERM, VL_TOTAL_FRETE_MN, "&_
	" TX_DOLAR, TX_MLE, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, "&_
	" VL_TOTAL_II, VL_TOTAL_IPI, VL_RECUPERADO, NR_REFERENCIA, NR_ITEM, SUM(QT_MERC_UN_COMERC)AS QT_MERC_UN_COMERC, SUM(VL_MLE_ITEM) AS VL_MLE_ITEM, CD_FABR_EXPO,  "&_
	" CD_MERCADORIA, VL_SDA, VL_INSS, NM_MERCADORIA, IN_TIPO_M_E, NR_CLIENTE, AP_EXPORTADOR, NM_FORNECEDOR, NM_FABRICANTE, "&_
	" VL_CIF_MN, NM_UNID_MED, UNID_MED, NM_MOEDA_MLE, SIGLA_MOEDA_MLE, NM_MOEDA_SEGURO, NM_TRANSP_ROD, NM_EMBARCACAO, "&_
	" NM_LOCAL_EMBARQUE, NM_LOCAL_DESEMBARQUE, CD_GRUPO, DT_ENVIO_DOCS, DT_FATURA, NM_TRANSP, NM_AREA, VL_DESPESA_INDAIA, "&_
	" VL_FRETE_INDAIA, VL_CAPATAZIA, VL_SDA2 "&_
	" from (SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA, ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, DM.CD_UN_MED_COMERC AS UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
				"   CASE DI.CD_MOEDA_MLE WHEN '790' THEN 'BRL' WHEN '220' THEN 'USD' WHEN '978' THEN 'EURO	' "&_
        "     ELSE (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) END AS SIGLA_MOEDA_MLE, "&_
				"  (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO) AS NM_MOEDA_SEGURO,"&_
				"  (SELECT AP_TRANSP_ROD FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = PR.CD_TRANSP_NAC) AS NM_TRANSP_ROD, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMBARQUE, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMBARQUE, "&_
				"  (SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_CLIENTE) AS CD_GRUPO, "&_
				"  (SELECT DATEADD(day, -1, DT_REALIZACAO) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '001') AS DT_ENVIO_DOCS, "&_
				"  (SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '092') AS DT_FATURA, "&_
				"  (SELECT UPPER(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_TRANSP, "&_
				"  (SELECT NM_AREA FROM TAREA (NOLOCK) WHERE CD_AREA = PR.CD_AREA) AS NM_AREA, "&_
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
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA2, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_INSS "&_	
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN VW_SERVICO_GERAL SV ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' ) as tabela"&_
				" GROUP BY NR_PROCESSO, NR_DI, NR_CONHECIMENTO, TP_FRETE, CD_VIA_TRANSPORTE, "&_
				" DT_EMBARQUE, DT_REGISTRO_DI, DT_CHEGADA_CARGA, CD_INCOTERM, VL_TOTAL_FRETE_MN, "&_
				" TX_DOLAR, TX_MLE, VL_TOT_MLE_MNEG, VL_TOT_SEGURO_MNEG, VL_TOTAL_MLE_MN, VL_TOTAL_SEG_MN, "&_
				" VL_TOTAL_II, VL_TOTAL_IPI, VL_RECUPERADO, NR_REFERENCIA, NR_ITEM, CD_FABR_EXPO,  "&_
				" CD_MERCADORIA, VL_SDA, VL_INSS, NM_MERCADORIA, IN_TIPO_M_E, NR_CLIENTE, AP_EXPORTADOR, NM_FORNECEDOR, NM_FABRICANTE, "&_
				" VL_CIF_MN, NM_UNID_MED, UNID_MED, NM_MOEDA_MLE, SIGLA_MOEDA_MLE, NM_MOEDA_SEGURO, NM_TRANSP_ROD, NM_EMBARCACAO, "&_
				" NM_LOCAL_EMBARQUE, NM_LOCAL_DESEMBARQUE, CD_GRUPO, DT_ENVIO_DOCS, DT_FATURA, NM_TRANSP, NM_AREA, VL_DESPESA_INDAIA, "&_
				" VL_FRETE_INDAIA, VL_CAPATAZIA, VL_SDA2"&_
				" ORDER BY NR_REFERENCIA, NR_ITEM"
		else
		sql = "SELECT PR.NR_PROCESSO, PR.NR_DI, PR.NR_CONHECIMENTO, PR.TP_FRETE, SV.CD_VIA_TRANSPORTE, "&_
				"  DI.DT_EMBARQUE, DI.DT_REGISTRO_DI, DI.DT_CHEGADA_CARGA, DI.CD_INCOTERM, DI.VL_TOTAL_FRETE_MN, "&_
				"  DI.TX_DOLAR, DI.TX_MLE, DI.VL_TOT_MLE_MNEG, DI.VL_TOT_SEGURO_MNEG, DI.VL_TOTAL_MLE_MN, DI.VL_TOTAL_SEG_MN, "&_
				"  DI.VL_TOTAL_II, DI.VL_TOTAL_IPI, (DI.VL_TOTAL_IPI+DI.VL_TOT_ICMS+DI.VL_TOT_PIS_COFINS) AS VL_RECUPERADO, "&_
				"  DM.NR_PROC_PO AS NR_REFERENCIA, DM.NR_ITEM_PO AS NR_ITEM, DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, DM.CD_FABR_EXPO, "&_
				"  DM.CD_MERCADORIA,  ME.AP_MERCADORIA AS NM_MERCADORIA, ME.IN_TIPO_M_E, "&_
				"  EE.NR_CLIENTE, EE.AP_EMPRESA AS AP_EXPORTADOR, EE.NM_EMPRESA AS NM_FORNECEDOR, "&_
				"  (SELECT AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = DM.CD_FABRICANTE) AS NM_FABRICANTE, "&_
				"  (SELECT SUM(ISNULL(VL_BASE_CALC_ADVAL, 0)) FROM TRIBUTO (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_RECEITA_IMPOSTO = '0001' ) AS VL_CIF_MN, "&_
				"  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS NM_UNID_MED, DM.CD_UN_MED_COMERC AS UNID_MED, "&_
				"  (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) AS NM_MOEDA_MLE,"&_
				"   CASE DI.CD_MOEDA_MLE WHEN '790' THEN 'BRL' WHEN '220' THEN 'USD' WHEN '978' THEN 'EURO	' "&_
        "     ELSE (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_MLE) END AS SIGLA_MOEDA_MLE, "&_
				"  (SELECT AP_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = DI.CD_MOEDA_SEGURO) AS NM_MOEDA_SEGURO,"&_
				"  (SELECT AP_TRANSP_ROD FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = PR.CD_TRANSP_NAC) AS NM_TRANSP_ROD, "&_
				"  (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_EMBARQUE) AS NM_LOCAL_EMBARQUE, "&_
				"  (SELECT NM_LOCAL_EMB FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CD_LOCAL_EMB = PR.CD_LOCAL_DESEMBARQUE) AS NM_LOCAL_DESEMBARQUE, "&_
				"  (SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = PR.CD_CLIENTE) AS CD_GRUPO, "&_
				"  (SELECT DATEADD(day, -1, DT_REALIZACAO) FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '001') AS DT_ENVIO_DOCS, "&_
				"  (SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND CD_EVENTO = '092') AS DT_FATURA, "&_
				"  (SELECT UPPER(NM_VIA_TRANSPORTE) FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE) AS NM_TRANSP, "&_
				"  (SELECT NM_AREA FROM TAREA (NOLOCK) WHERE CD_AREA = PR.CD_AREA) AS NM_AREA, "&_
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
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_CAPATAZIA, "&_
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"			  AND CD_ORIGEM_LANC='5' "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_SDA2, "&_	
				"  (ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 0 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0) - "&_
				"   ISNULL((SELECT ISNULL(SUM(VL_ITEM*0.2), 0) AS VL_ITEM "&_
				"           FROM TFATURAMENTO_CC ( NOLOCK ) "&_
				"           WHERE NR_PROCESSO = PR.NR_PROCESSO "&_
				"             AND CD_ITEM IN ('008','505') "&_
				"             AND ISNULL(IN_RESTITUI, 0) = 1 "&_
				"             AND ISNULL(IN_CANCELADO, 0) = 0), 0)) AS VL_INSS "&_	
				"FROM TPROCESSO PR (NOLOCK) "&_
				"  INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON (DI.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TDETALHE_MERCADORIA    DM (NOLOCK) ON (DM.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  INNER JOIN TMERCADORIA   ME (NOLOCK) ON (ME.CD_MERCADORIA = DM.CD_MERCADORIA) "&_
				"  INNER JOIN TPROCESSO_SDA SD (NOLOCK) ON (SD.NR_PROCESSO = PR.NR_PROCESSO) "&_
				"  LEFT  JOIN TEMPRESA_EST  EE (NOLOCK) ON (EE.CD_EMPRESA = DM.CD_EXPORTADOR) "&_
				"  INNER JOIN VW_SERVICO_GERAL SV ON (SV.CD_SERVICO = PR.CD_SERVICO) "&_
				"WHERE PR.NR_PROCESSO = '"& nr_processo &"' "&_
				"ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO"
		end if		
		'Response.Write(sql)
		'Response.end
	With objcmd
		.CommandTimeOut = 9999
		.CommandText = sql
		.CommandType = adCmdText
	End With
	objrs.Open objcmd, , adOpenStatic, adLockReadOnly
	If objrs.RecordCount > 0 Then
		'REFERENCIAS
		sql = "SELECT DISTINCT CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND TP_REFERENCIA = '01' ORDER BY CD_REFERENCIA"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		'Agora pega só uma referencia - 27/02/2009 - Guilherme
		if objrsx.RecordCount > 0 Then
			nr_referencia = Trim(objrsx.Fields.Item("CD_REFERENCIA").Value)
		End If
		
		objrsx.Close
		'INVOICE 
		sql = "SELECT TOP 1 NR_DCTO_INSTRUCAO,DT_FATURA  FROM TDOCUMENTO_INSTRUCAO (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND CD_TIPO_DCTO_INSTR = '01'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_invoice = ""
		    Data_Fatura=Trim(objrsx.Fields.Item("DT_FATURA").Value)

			Do while not objrsx.Eof
				nr_invoice = nr_invoice & Trim(objrsx.Fields.Item("NR_DCTO_INSTRUCAO").Value)
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else nr_invoice = nr_invoice &"<br>"
			Loop
		End If

		objrsx.Close
		'NOTA FISCAL
		sql = "SELECT TOP 1 NR_NOTA, DT_NOTA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = '"& nr_processo &"' AND IN_CANCELADO = '0'"
		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		
		if objrsx.RecordCount > 0 Then
			nr_nf = ""
			dt_nf = ""
			txNotaFiscal = ""
			Do while not objrsx.Eof
				nr_nf = " "& Trim(objrsx.Fields.Item("NR_NOTA").Value) &"  "
				dt_nf = fnc_Mascara(objrsx.Fields.Item("DT_NOTA").Value, 9)
				txNotaFiscal = txNotaFiscal & nr_nf & dt_nf
				objrsx.MoveNext
				if objrsx.Eof then Exit Do else txNotaFiscal = txNotaFiscal &"<br>"
			Loop
		End If
		objrsx.Close
		
		'somente para saint goban
        
		if inStr("028", objrs.Fields.Item("CD_GRUPO")) then
			txObs = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. <u>Retirar o B/L original com o Agente;</u><br>"&_
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. <u>Para transporte favor procurar Sr. Rafael(Sigma) - Tel.(13)3203-1112.</u>"
		end if
        
		If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then
					'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA2").Value, 2)
					vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+(objrs.Fields.Item("VL_SDA2").Value*0.2)+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))'Alteração(-vl_recuperado)
		else
		'vlTotal= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)
		'if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    	'sql = " SELECT COUNT(CD_ITEM) as contador FROM TFATURAMENTO_CC"&_
		'	" WHERE NR_PROCESSO = '" & nr_processo & "'"&_
		'" AND CD_ITEM IN ('025','032','027','600','599')"
    	'objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		'if objrsx("contador") <> "0" Then
			vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))
		'Else
		'	vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))
		'End If

		end if

		'vlTotal = objrs("VL_TOTAL_MLE_MN")+vl_tot_geral+objrs("VL_INSS")+Ccur(objrs("VL_TOTAL_SEG_MN"))-objrs("VL_RECUPERADO")

		vlNota = objrs("VL_CIF_MN")+objrs("VL_TOTAL_II")
		vlDesp = objrs("VL_DESPESA_INDAIA")-vl_recuperado-objrs("VL_TOTAL_II")-objrs("VL_FRETE_INDAIA")-objrs("VL_CAPATAZIA")
		if objrs("TP_FRETE") = "0" then
			vlDif = objrs("VL_FRETE_INDAIA")-objrs("VL_TOTAL_FRETE_MN")
		else
			vlDif = 0
		end if
		
		select case objrs.fields.item("CD_FABR_EXPO").value
			case 1 vTxFabric = objrs.Fields.Item("AP_EXPORTADOR").Value
			case 2 vTxFabric = objrs.Fields.Item("NM_FABRICANTE").Value
			case 3 vTxFabric = ""
		end select
		
		select case objrs.fields.item("IN_TIPO_M_E").value
			case "M" vTipoImport = "Matéria-Prima"
			case "E" vTipoImport = "Equipamentos"
			case "R" vTipoImport = "Revenda"
			case "C" vTipoImport = "Consumo"
			case "A" vTipoImport = "Ativo"
			case else vTipoImport = ""
		end select
        vInIPIRec = "sim"
		
		if vNrDias = "sem_cobertura" then
			sem_cobertura = 1
		else
			sem_cobertura = 0
		End If
		

If vNrDias = "Antecipado" or vNrDias = "sem_cobertura"  then
	vNrDias=0
	If vTxCondicao = 5 then
		If sem_cobertura = 1 Then
			aCondicao(vTxCondicao)=UCase(tx_lang_TDE026(cd_lang))
		Else
			aCondicao(vTxCondicao)=UCase(tx_lang_TDE027(cd_lang))
		End If
	End if
End if

If vNrDias="" or  Data_Fatura="" then
	Response.Redirect("inst_despacho_custo.asp"&url&"&msg=Preencha os campos abaixo para inserir ítem!")
else
	vDtVencto = DateAdd("d", vNrDias, Data_Fatura)
end if

'Flavio - 31/03/2008
'--------------------------------------------------------------------------------------------------- FÓRMULAS
'FÓRMULAS PARA DEFINIR A DATA VENCTO DOS ÍTENS SELECIONADOS 
select case vTxCondicao
		Case 0 ' Invoice Especial (Se a dia de vecto <15 o vencimento fica dia 15 do mês)
			if Day(vDtVencto) < 15 then 'Data_Fatura
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
				dias_Corridos= DateDiff("d", fnc_Mascara(Data_Fatura,5), vDtVencto)
			elseif Day(vDtVencto) > 15 then	   '(Se a dia de vecto >15 o vencimento fica dia 15 do mês seguinte)
				vDtVencto = DateAdd("m", 1, vDtVencto)
				vDtVencto = DateSerial(Year(vDtVencto), Month(vDtVencto), 15)
				dias_Corridos= DateDiff("d", Data_Fatura, vDtVencto)
				if Month(vDtVencto) = 1 then
				  vDtVencto = DateAdd("y", 1, vDtVencto)
				end if	
			end if
		Case 1 'Registro da Di - dias corridos a partir da data da Di ***************** OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5), vDtVencto)
				
		Case 2 ' Conhecimento de embarque - dias corridos a partir da data do conhecimento  OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5), vDtVencto)
				
		Case 3 'Invoice - dias corridos a partir da data da Invoice =(fnc_Mascara(Data_Fatura, 5))***************** OK
				vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(Data_Fatura, 5))
				dias_Corridos= DateDiff("d", fnc_Mascara(Data_Fatura, 5), vDtVencto)
				
		Case 4 'PROFORMA - dias corridos a partir da data da Proforma evento 566 da tfollowup - OK
				'Pegar a data mais antiga dentro de todos os itens e pedidos deste processo.(Instruções Vitor)
				'Obs: um processo pode ter mais de um pedido e vice-versa
				If objrsx.State = adStateOpen then objrsx.close()
				sql="select top 1 DT_REALIZACAO from tflp_po_item WHERE NR_PROCESSO  = '"& nr_referencia &"' and dt_realizacao is not null and cd_evento=566"
 				objrsx.Open sql, objcnn, adOpenstatic, adLockReadonly
				'Select Original para data da proforma --------------------------------------------------------------
		'				sql="select DT_REALIZACAO from tfollowup  WHERE NR_PROCESSO = '"& nr_processo &"' and cd_evento='566'"
		'				objrsx.Open sql, objcnn, adOpenstatic, adLockReadonly
				'Select Original para data da proforma --------------------------------------------------------------				
				If objrsx.eof THEN 
					vDtVencto="Sem registros"	
					Response.Redirect("inst_despacho_custo.asp"&url&"&msg1=Não há data de PROFORMA!")
				Else
					MenorDataProforma=objrsx("DT_REALIZACAO")
					vDtVencto = DateAdd("d", vNrDias, fnc_Mascara(MenorDataProforma, 5))
				    dias_Corridos= DateDiff("d", fnc_Mascara(MenorDataProforma, 5), vDtVencto)
				End If
				If objrsx.state = adstateOpen then objrsx.close()
		Case 5 'Antecipado e Sem cobertura cambial
				vDtVencto = "-"
				dias_Corridos= "0"		
end select
'----------------------------------------------------------------------------------------------------------------------- FÓRMULAS
if objrs.Fields.Item("CD_VIA_TRANSPORTE").Value = "01" then
	vTipoTransp = objrs.Fields.Item("NM_EMBARCACAO").Value
else
	vTipoTransp = objrs.Fields.Item("NM_TRANSP").Value
end if

'-------------Alterado em 24/04/2008 ------CALCULA O VALOR DO INSS --------------------------------------------------------------
'Renata insere valor SDA via web 
		   ' Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")
		
		If objrs.Fields.Item("VL_INSS").Value= 0 then 
			sql="select VL_ITEM from TFATURAMENTO_CC WHERE NR_PROCESSO ='"& nr_processo &"' and cd_item in ('008','505') and cd_origem_lanc='5'"
			Objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
			If objrsx.eof then
			   vlINSS = objrs.Fields.Item("VL_INSS").Value
			   'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")
			else
				vlINSS=Objrsx("VL_ITEM")*0.2
			    'Response.Redirect("../IMPORT/teste.asp?var1="&objrsx.Fields.Item("VL_ITEM").Value&"")
			end if
		else 
			vlINSS = objrs.Fields.Item("VL_INSS").Value
		end if	
		If Not fnc_TestaVar(vlINSS) Then vlINSS = 0
'------------------------------------------------------------------------------------------------------------------
	'Response.Redirect("../IMPORT/teste.asp?var1="&vlINSS&"")
%>
 <div id="instrucao" class="instrucao">
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

	<tr>
	  <td valign="top" style="border: solid 1px #336699;">
		  <table border="0" cellpadding="1" cellspacing="1">
				<col width="275">
				<col width="250">
				<col width="225">
				<col width="135">
				<col width="175">
				<tr height="45">
					<td colspan="5" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><%= tx_lang_A00094(cd_lang)%></b></div></td>
				</tr>
				<tr height="30">
					<td class="azulClaro"><b><%=tx_lang_TDE028(cd_lang)%></b></td>
					<td class="cinza"><div align="center"><%= nr_referencia%></div></td>
					<td class="azulClaro"><b><%=tx_lang_TDE029(cd_lang)%></b></td>
					<td class="cinza"><div align="center"><%= fnc_Mascara(vDtDocto, 5)%></div></td>
					<td rowspan="2" class="azulClaro"><div align="center" style="font-size:12px;"><b><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></b></div></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;<%=tx_lang_TDE030(cd_lang)%>:</b></div></td>
					<td colspan="2" class="cinzaClaro"><%= objrs.Fields.Item("NM_FORNECEDOR").Value%></td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NR_CLIENTE").Value%></div></td>
				</tr>
				<tr>
					<td class="azulClaro"><div align="left"><b>&nbsp;<%=tx_lang_TDE031(cd_lang)%>:</b></div></td>
					<td class="azulClaro"><b><%=tx_lang_TDE032(cd_lang)%></b></td>
					<td class="azulClaro"><b><%=tx_lang_TDE033(cd_lang)%></b></td>
					<td class="cinza"><div align="center"><%= fnc_Mascara(Data_Fatura, 5)%></div></td>
					<td rowspan="3" class="azulEscuro"><div align="center"><b><%=tx_lang_TDE034(cd_lang)%></b></div></td>
				</tr>
				<tr height="135">
					<td class="cinzaClaro" valign="top"><div align="left">&nbsp;<%=tx_lang_TDE035(cd_lang)%></div></td>
					<td rowspan="3" class="cinzaClaro" valign="top" style="border-style: none;"><div align="right"><%= nr_invoice%></div></td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
					<td rowspan="3" class="cinzaClaro" style="border-style: none;">&nbsp;</td>
				</tr>
        <tr>
	        <td class="cinzaClaro">&nbsp;</td>
				</tr>
				<tr>
	        <td class="cinzaClaro">&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE036(cd_lang)%></td>
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" ><div align="left"><b>&nbsp;NOTAS:</b></div></td>
					<td colspan="3" rowspan="2" class="cinza" style="font-size: 8px;"><%= txObs%></td>
          <td class="cinza"><div align="center"><%= vTipoTransp%></div></td>
				</tr>
				<tr>
					<td class="azulClaro"><%=tx_lang_TDE037(cd_lang)%></td>					
				</tr>
				<tr>
					<td rowspan="2" class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;<%=tx_lang_TDE038(cd_lang)%></b></div></td>
					<td class="azulClaro" style="border-style: none;"><%=tx_lang_TDE039(cd_lang)%></td>
					<td class="azulClaro" style="border-style: none;"><%=tx_lang_TDE040(cd_lang)%></td>
					<td class="azulClaro" style="border-style: none;"><%=tx_lang_TDE041(cd_lang)%></td>
					<td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NR_CONHECIMENTO").Value%></div></td>					
				</tr>
				<tr>
					<%if aCondicao(vTxCondicao)=UCase(tx_lang_TDE027(cd_lang)) or aCondicao(vTxCondicao)=UCase(tx_lang_TDE026(cd_lang))then%>
                    <td class="cinza">&nbsp;<%= aCondicao(vTxCondicao)%></td>
                     <%else%>
					<td class="cinza">&nbsp;<%= vNrDias &" DIAS "& aCondicao(vTxCondicao)%></td>
                   <%end if%>
					<td class="cinza"><div align="right"><%iF fnc_Mascara(Data_Fatura, 5)<>"" THEN%><%= fnc_Mascara(vDtVencto, 5)%><%END IF%>&nbsp;</div></td>
					<td class="cinza"><div align="right"><%=dias_Corridos%><% 'DateDiff("d", vDtDocto, vDtVencto)%>&nbsp;</div></td>
          <td class="azulClaro"><%=tx_lang_TDE042(cd_lang)%> </td>
				</tr>
				<tr>
				  <td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><strong> <span class="style18">.</span><%=tx_lang_TDE043(cd_lang)%></strong></div></td>
				  <td class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_MOEDA_MLE").Value%></div></td><%if request.form("ValEmbalagem")=" "  or request.form("ValEmbalagem")="" then ValEmbalagem=0 else ValEmbalagem=request.form("ValEmbalagem") end if%>
				  <td class="cinzaClaro"><div align="right"><span class="style5">
				    <%=FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value,2)%>
				    <%'= FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value, 2)%>
				  </span></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
				  <td rowspan="3" class="cinzaClaro"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_EMBARQUE").Value%></div>				    <div align="center"></div></td>
			    </tr>
				<tr>
					<td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"><b>&nbsp;</b><b><%=UCase(tx_lang_TDE022(cd_lang))%></b></div></td>
					<td bgcolor="#DDDDDD" class="cinza"><div align="center"></div></td>
					<td bgcolor="#DDDDDD" class="cinza"><div align="right"><span class="style17">(<%=FormatNumber(ValEmbalagem,2)%>)</span>&nbsp;</div></td>
					<td bgcolor="#DDDDDD" class="cinza">&nbsp;</td>
				</tr>
				<tr>
				  <td class="azulClaro" style="border-width: 0px 0px 0px 2px;"><div align="left"> <span class="style15">.<span class="style13"><%=UCase(tx_lang_TDE013(cd_lang))%> </span></span><strong><%=tx_lang_TDE075(cd_lang)%></strong></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
				  <td class="cinzaClaro"><div align="right"><strong><%=FormatNumber(objrs.Fields.Item("VL_TOT_MLE_MNEG").Value-ValEmbalagem,2)%></strong></div></td>
				  <td class="cinzaClaro">&nbsp;</td>
			    </tr>
				<tr>
					<td colspan="4" rowspan="2" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><%=tx_lang_TDE045(cd_lang)%></b></div></td>
					<td class="azulClaro"><%=tx_lang_TDE046(cd_lang)%> </td>
				</tr>
				<tr>
          <td class="cinza"><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;<%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("TX_MLE").Value, 7)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE047(cd_lang)%> </td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2"><b>&nbsp;<%=tx_lang_TDE048(cd_lang)%></b></td>
					<td><div align="right"><b><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_MLE_MN").Value-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value),2)%><%'= FormatNumber(objrs.Fields.Item("VL_TOTAL_MLE_MN").Value, 2)%></b>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="cinza"><div align="center"><%= objrs.Fields.Item("NM_LOCAL_DESEMBARQUE").Value%></div></td>
				</tr>
				<tr>
					<td colspan="4" class="azulEscuro" ><div align="center" style="font-size: 12px"><b><b>&nbsp;<%=tx_lang_TDE049(cd_lang)%></b></b></div></td>
					<td class="azulClaro"><%=tx_lang_TDE076(cd_lang)%> </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="4" class="style2">&nbsp;<%=tx_lang_TDE050(cd_lang)%>:</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_CHEGADA_CARGA").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;<%= Trim(Mid(nr_processo, 5, 13))%></td>
					<td><i>&nbsp;INDAIA</i></td>
					<td><div align="right"><%=formatnumber(vl_tot_geral,2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE051(cd_lang)%></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;INSS s/ S.D.A. n.&ordm; </td>
                    <%'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_SDA2").Value&"")%>

					

					<td><div align="right"><%If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then%><%= FormatNumber(objrs.Fields.Item("VL_SDA2").Value, 2)%><%else%><%= FormatNumber(objrs.Fields.Item("VL_SDA").Value, 2)%><%end if%>&nbsp;</div></td>
					<td><div align="right"><%If objrs.Fields.Item("VL_SDA").Value=0 or isnull(objrs.Fields.Item("VL_SDA")) then%><%= FormatNumber(objrs.Fields.Item("VL_SDA2").Value*0.2, 2)%><%else%><%=vlINSS%><%end if%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= vTxFabric%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE052(cd_lang)%></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2">&nbsp;<%=tx_lang_TDE053(cd_lang)%> </td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("AP_EXPORTADOR").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;<%=tx_lang_TDE054(cd_lang)%></td>
					<td>&nbsp;<%=tx_lang_TDE055(cd_lang)%></td>
					<td><div align="right"><a href='#' onClick="ExibeDetalhes('divInfoCorpo','cd_menu=<%=cd_menu%>&cd_subm=<%=cd_subm%>&vl_recuperado=<%= vl_recuperado %>&nr_processo=<%= nr_processo %>');"><span style="color: #FF0000;">(<%= FormatNumber(vl_recuperado, 2)%>)</span></a>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro">INCOTERM</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;<%=tx_lang_TDE056(cd_lang)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style6"><%= LCase(objrs.Fields.Item("NM_MOEDA_SEGURO").Value)%></span></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOT_SEGURO_MNEG").Value, 2)%>&nbsp;</div></td>
					<td><div align="right"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_SEG_MN").Value, 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("CD_INCOTERM").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2" >&nbsp;</td>
					<td ><div align="right">0,00&nbsp;</div></td>
					<td >&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE057(cd_lang)%> </td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;<%=tx_lang_TDE058(cd_lang)%></td>
					<td>&nbsp;<span class="style6"><i><b><%= UCase(objrs.Fields.Item("NM_TRANSP_ROD").Value)%></b></i></span></td>
                    <%If objrsx.state = adstateOpen then objrsx.close()
                    If Session("cd_grupo_despacho") = "028" Then                    
					sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "'"&_
					      " AND CD_ORIGEM_LANC = '5'" &_
					      " AND CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "
                    Else
                    sql = "SELECT ISNULL(SUM(VL_ITEM),0) AS VL_ITEM FROM TFATURAMENTO_CC WHERE NR_PROCESSO = '" & nr_processo & "'"&_
					      " AND CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "
                    End If
					objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
					
					If objrsx.RecordCount > 0 Then
                      vl_transp_nacional = objrsx.Fields.Item("VL_ITEM").Value
					End If  
					%>
					<td><div align="right"><%= FormatNumber((objrsx.Fields.Item("VL_ITEM").Value),2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= UCase(vTipoImport)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;<%=tx_lang_TDE059(cd_lang)%> </td>
					<td>&nbsp;</td>
					<td><div align="right"><%= FormatNumber(0,2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><%=tx_lang_TDE060(cd_lang)%></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;<%=tx_lang_TDE077(cd_lang)%></td>
					<td>&nbsp;</td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= objrs.Fields.Item("NM_MERCADORIA").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td rowspan="3" class="azulEscuro"><div align="center"><b><%=tx_lang_TDE062(cd_lang)%></b></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2" class="style2"><div style="font-size: 12px;">&nbsp;<%=tx_lang_TDE061(cd_lang)%></div></td>
					<td><div align="right"><b><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</b></div></td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>					
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b>&nbsp;<%=tx_lang_TDE063(cd_lang)%> </b></td>
					<td><b>&nbsp;<%=tx_lang_TDE064(cd_lang)%></b></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b><%=tx_lang_TDE065(cd_lang)%></b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td><%= txNotaFiscal%></td>
					<td><div align="right"><%= FormatNumber(vlNota, 2)%>&nbsp;</div></td>
					<td >&nbsp;</td>
					<td >&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("DT_REGISTRO_DI").Value, 5)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;<%=tx_lang_TDE066(cd_lang)%> </td>
					<td><div align="right"><%= FormatNumber((vlTotal-vlNota-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><b><%=tx_lang_TDE067(cd_lang)%> </b></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="4">&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("VL_TOTAL_II").Value, 2)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td><b> &nbsp;<%=tx_lang_TDE068(cd_lang)%>:</b></td>
					<td>&nbsp;</td>
					<td><div align="right"><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><%=tx_lang_TDE069(cd_lang)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><div align="center"><%= fnc_Mascara(objrs.Fields.Item("NR_DI").Value, 1)%></div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td colspan="2"><b>&nbsp;<%=tx_lang_TDE070(cd_lang)%>: </b></td>
					<td><div align="right">0,00&nbsp;</div></td>
					<td>&nbsp;</td>
				  <td class="azulClaro"><div align="center"><%=tx_lang_TDE071(cd_lang)%></div></td>	
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;<%=tx_lang_TDE072(cd_lang)%></td>
					<td><div align="center"><b><%= vInIPIRec%></b></div></td>
					<td>&nbsp;</td>
					<td><div align="center"><%= FormatNumber(objrs.Fields.Item("TX_DOLAR").Value, 7)%>&nbsp;</div></td>
				</tr>
				<tr bgcolor="EEEEEE">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td class="azulClaro"><div align="center"><%=tx_lang_TDE073(cd_lang)%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
					<td colspan="2">&nbsp;<%=tx_lang_TDE074(cd_lang)%>: </td>
					<td><div align="right"><%= FormatNumber((vlTotal-(ValEmbalagem*objrs.Fields.Item("TX_MLE").Value)), 2)%>&nbsp;</div></td>
					<td>&nbsp;</td>
					<td ><div align="center"><%= objrs.Fields.Item("NM_AREA").Value%></div></td>
				</tr>
				<tr bgcolor="DDDDDD">
				  <td colspan="5">&nbsp;</td>
			    </tr>
			</table>    
            <table width="100%" border="0" cellspacing="1" cellpadding="1">
<tr height="45">
					<td colspan="5" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>Despesas</b></div></td>
			  </tr>
<%If objrsy.State = adStateOpen Then objrsy.Close
	sql = "SELECT DISTINCT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM, I.NR_ORDEM_FAT, T.TP_NATUREZA "&_
	"FROM TFATURAMENTO_CC CC ( NOLOCK ), "&_
	"( SELECT NR_PROCESSO, CD_ITEM, ISNULL(SUM( CASE IN_RESTITUI WHEN '1' THEN VL_ITEM * (-1) "&_
	"ELSE VL_ITEM END ), 0) AS VL_ITEM, "&_
	"ISNULL(SUM(VL_ASSIST), 0) AS VL_ASSIST, MAX(DT_LANCAMENTO) AS DT_LANCAMENTO "&_
	"FROM TFATURAMENTO_CC ( NOLOCK ) "&_
	"WHERE IN_CANCELADO = 0 "&_
	"AND VL_ITEM > 0 "&_
	"GROUP BY NR_PROCESSO, CD_ITEM) F, "&_
	"TITEM I ( NOLOCK ), TTIPO_ITEM T ( NOLOCK ) "&_
	"WHERE CC.NR_PROCESSO = F.NR_PROCESSO "&_
	"AND CC.CD_ITEM = F.CD_ITEM "&_
	"AND CC.CD_ITEM = I.CD_ITEM "&_
	"AND I.CD_TIPO_ITEM = T.CD_TIPO_ITEM "&_
	"AND CC.NR_PROCESSO = "& fnc_QuotedSQL(nr_processo) &_
	"AND CC.IN_CANCELADO = 0 "&_
	"AND CC.IN_RESTITUI = 0 "&_
	"AND CC.CD_ITEM_NAO_FAT IS NULL "&_
	"AND CC.CD_ITEM NOT IN ('990','995','996','997','998','027','026','600','599','032','025','002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811') "&_
	"AND I.CD_TIPO_ITEM <> 'N'  "&_
	"ORDER BY F.DT_LANCAMENTO ASC, I.NR_ORDEM_FAT ASC, F.CD_ITEM ASC "
	objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText

	vl_item  = 0
	vl_saldo = 0
	credito  = "0,00"
	debito   = "0,00"
	saldo    = "0,00"

in_restitui = False
'seleciona os itens restituidos
'If objrsx.State = adStateOpen Then objrsx.Close
'sql = "SELECT F.CD_ITEM, ISNULL(SUM(F.VL_ITEM), 0) AS VL_RESTITUI "&_
'			"FROM TFATURAMENTO_CC F ( NOLOCK ), TITEM I ( NOLOCK ) "&_
'			"WHERE F.CD_ITEM = I.CD_ITEM "&_
'			"  AND F.NR_PROCESSO  = "& fnc_QuotedSQL(nr_processo) &_
'			"  AND F.IN_CANCELADO = 0 "&_
'			"  AND F.IN_RESTITUI  = 1 "&_
'			"  AND F.CD_ITEM_NAO_FAT IS NULL "&_
'			"	 AND I.CD_TIPO_ITEM <> 'N' "&_
'			"GROUP BY F.NR_PROCESSO, F.CD_ITEM"
'objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'If objrsx.RecordCount > 0 Then in_restitui = True

If objrsy.Eof Then
%>
					<tr>
					  <td>&nbsp;</td>
						<td><%= tx_lang_A00081(cd_lang)%>.</td>
					</tr>
					<%
Else
  If objrsy.RecordCount < 15 Then col = 86 Else col = 70
  Do While Not objrsy.Eof
	If objrsf.State = adStateOpen Then objrsf.Close
		sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ITEM = '"&objrsy.Fields.Item("CD_ITEM").Value&"' "  &_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM NOT IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
    'alterna a cor das linhas
		If bgcolor = "#EEEEEE" Then bgcolor = "#DDDDDD" Else bgcolor = "#EEEEEE"
		'calculo do valor do item
		vl_item = objrsy.Fields.Item("VL_ITEM").Value
		'verifica se ocorreu restituicao
		If in_restitui Then
			'se teve restituição procura pelo item e subtrai o valor
			objrsx.MoveFirst
			str = "CD_ITEM = "& fnc_QuotedSQL(objrsy.Fields.Item("CD_ITEM").Value)
			objrsx.Find str, 0, adSearchForward
			'verifica se o registro foi encontrado
'			If Not objrsx.Eof Then vl_item = vl_item - objrsx.Fields.Item("VL_RESTITUI").Value
		End If
		'se o valor do item for maior que zero ele é exibido, se não é porque foi restituido
		If Round(vl_item, 2) > 0 Then
			'verifica se &eacute; d&eacute;bito ou cr&eacute;dito
			credito = ""
			debito  = ""
			If objrsy.Fields.Item("TP_NATUREZA").Value = "C" Then
				vl_item = vl_item
				credito = FormatNumber(vl_item)
			Else
				vl_item = vl_item * -1
				debito  = FormatNumber(Abs(vl_item))
			End If
			
				vl_saldo = fnc_ValorSaldo(vl_item, vl_saldo)
				'verifica se o saldo &eacute; positivo ou negativo
				If Round(vl_saldo, 2) >= 0 Then
					saldo = "<font color='#0000FF'>"& FormatNumber(vl_saldo) &"</font>"
				Else
					saldo = "<font color='#FF0000'>("& FormatNumber(Abs(vl_saldo)) &")</font>"
				End If	
			If varCheck=1 then bgcolor="#FFCC99"

				%>
                

					
					<tr bgcolor="<%= bgcolor%>">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
						<td width="342"><%= Trim(objrsy.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrsy.Fields.Item("NM_ITEM").Value)%></td>
						<td width="60" align="right"><%= credito%></td>
						<td width="60" align="right"><%= debito%></td>
						<td width="62" align="right"><%= saldo%></td>
					</tr>
					<%
			objrsy.MoveNext
		Else
			objrsy.MoveNext
		End If
		
		If objrsy.Eof Then Exit Do
	Loop
End If
%>

<tr height="18">
						<td colspan="3"><i><%= tx_lang_POP030(cd_lang)%></i></td>
						<td colspan="1" align="right"><b><%= tx_lang_POP024(cd_lang)%>:</b></td>
						<td align="right"><b><%= saldo%></b></td>
			  </tr>
<%
objrsy.Close
If objrsy.State = adStateOpen Then objrsy.Close
If Not InStr("028;949;503", Session("cd_grupo_despacho")) <> 0 Then
    sql = "SELECT DISTINCT NR_PROCESSO_COMPLETO AS NR_PROCESSO, CONVERT(VARCHAR, DT_CALCULO, 103) AS DATA, VL_TOT_ICMS AS VL_ICMS, "&_
    "    VL_TOTAL_IPI AS VL_IPI, ISNULL(VL_PIS,0) AS VL_PIS, ISNULL(VL_COFINS,0) AS VL_COFINS, VL_TRIBUTO_PAGO AS VL_SISCOMEX, VL_TOTAL_II AS VL_II  "&_   
    "    FROM BROKER.DBO.VW_RESUMO_DI "&_
    "    WHERE NR_PROCESSO_COMPLETO = '" & nr_processo & "' "
Else
    sql = "SELECT DISTINCT DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4) AS DATA, SUM(ISNULL(AI.VL_ICMS_A_RECOLHER,0)) AS VL_ICMS, "&_
	" SUM(ISNULL(TR.VL_IPT_A_RECOLHER,0)) AS VL_IPI, SUM(ISNULL(AI.VL_PIS,0)) AS VL_PIS, SUM(ISNULL(AI.VL_COFINS,0)) AS VL_COFINS, SUM(ISNULL(AI.VL_TX_SCX_AD,0)) AS VL_SISCOMEX, SUM(ISNULL(TR2.VL_IPT_A_RECOLHER,0)) AS VL_II "&_
    " FROM TDECLARACAO_IMPORTACAO DI "&_
    " LEFT JOIN TADICAO_DE_IMPORTACAO AI ON (AI.NR_PROCESSO = DI.NR_PROCESSO)"&_
	" LEFT JOIN TRIBUTO TR ON (TR.NR_PROCESSO = AI.NR_PROCESSO AND TR.NR_ADICAO = AI.NR_ADICAO AND TR.CD_RECEITA_IMPOSTO = '0002')" &_
	" LEFT JOIN TRIBUTO TR2 ON (TR2.NR_PROCESSO = AI.NR_PROCESSO AND TR2.NR_ADICAO = AI.NR_ADICAO AND TR2.CD_RECEITA_IMPOSTO = '0001')" &_
    " WHERE DI.NR_PROCESSO = '"& nr_processo & "'"&_
	" GROUP BY DI.NR_PROCESSO, LEFT(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),2)+'/'+SUBSTRING(RTRIM(LTRIM(DI.DT_REGISTRO_DI)),3,2)+'/'+RIGHT(DI.DT_REGISTRO_DI,4)"&_
    " ORDER BY DI.NR_PROCESSO "
End If
objrsy.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText
'objrsx.Close
%>
                
				<tr height="45">
					<td colspan="6" class="azulEscuro" ><div align="center" style="font-size: 12px"><b>Impostos/Despesas (Cliente)</b></div></td>
				</tr>
                <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">027-ICMS</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_ICMS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
			  </tr>
                <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">026-IPI</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_IPI").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
			  </tr>
                <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">600-PIS/PASEP IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_PIS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
			  </tr>
                <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">599-COFINS - IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_COFINS").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
			  </tr>  
                    <tr bgcolor="#EEEEEE">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">032-TAXA SISCOMEX</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_SISCOMEX").Value))%></td>
                        <td width="62" align="right">&nbsp;</td>
					</tr>
                     <tr bgcolor="#DDDDDD">
						<td width="143" height="20"><%= fnc_Mascara(objrsy.Fields.Item("DATA").Value, 5)%></td>
						<td width="342">025-IMP. DE IMPORTAÇÃO</td>
						<td width="60" align="right">&nbsp;</td>
						<td width="60" align="right"><%= FormatNumber(Trim(objrsy.Fields.Item("VL_II").Value))%></td>
						<td width="62" align="right">&nbsp;</td>
					</tr>    
                     <%
                   If objrsf.State = adStateOpen Then objrsf.Close
	        sql= " SELECT F.CD_ITEM, F.DT_LANCAMENTO, F.VL_ITEM, F.VL_ASSIST, I.NM_ITEM AS NM_ITEM, "&_
	"I.CD_TIPO_ITEM FROM TFATURAMENTO_CC F (NOLOCK) " &_
	        " INNER JOIN TITEM I (NOLOCK) ON (I.CD_ITEM = F.CD_ITEM) "&_
			" WHERE NR_PROCESSO = '"& nr_processo &"' "&_
			" AND F.CD_ORIGEM_LANC = '5' "&_
			" AND F.CD_ITEM IN ('002','022','043','094','120','312','411','414','418','425','436','473','539','571','662','811')" 
			Objrsf.Open sql,objcnn,adOpenStatic,adLockReadOnly
			If Objrsf.eof then
			   varCheck=0
			   Else
			   varCheck=1
			End if
			
			Do While Not objrsf.Eof
			%>
        		<tr bgcolor="#FFCC99">
					<td width="143" height="20"><%= fnc_Mascara(objrsf.Fields.Item("DT_LANCAMENTO").Value, 5)%></td>
					<td width="342"><%= Trim(objrsf.Fields.Item("CD_ITEM").Value)%>-<%= Trim(objrsf.Fields.Item("NM_ITEM").Value)%></td>
					<td width="60" align="right">&nbsp;</td>
					<td width="60" align="right"><%= FormatNumber(Trim(objrsf.Fields.Item("VL_ITEM").Value))%></td>
					<td width="62" align="right">&nbsp;</td>
     			</tr>    
            <%
			  objrsf.MoveNext
			Loop
%> 
                    
                      
			</table>
<%
objrsy.Close
'objrsx.Close
%>
		  </table></td>
	</tr>
</table>	
<!--********************************************** INÍCIO DO GRID ********************************************************************* -->                          	
</div>
<%
	End If
End If
End If
%>		</td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
<!--
window.focus();
-->
</script>
<%
'Response.end
if Request.Form <> "" then
  if objrs.RecordCount > 0 then
		Dim objfso 'objeto do sistema de arquivos 
		Dim objtxt 'objeto para a criação de arquivos
		Dim txCabecExcel, txCorpoExcel, txLinhaExcel
		Dim vlTaxaMLE, vlDespacho, vlINSS, vlSeguro, vlQtde, vlItem, txUnid
		Dim aCdMercadoria, aNrNovaQtde, aTxNovaUnid
		
		Set objfso = CreateObject("Scripting.FileSystemObject")
		'cria o ojbeto responsável pela criação do arquivo
		Set objtxt = objfso.CreateTextFile(caminho&arquivo, True, False)
		'inicia a gravação do arquivo xls para download
		objtxt.WriteLine("<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>")
		txCabecExcel = "<head>"&_
			"<meta http-equiv=Content-Type content='text/html; charset=windows-1252'>"&_
			"<meta name=ProgId content=Excel.Sheet>"&_
			"<meta name=Generator content='Microsoft Excel 9'>"&_
			"<!--[if !mso]><style>o\:* {behavior:url(#default#VML);}x\:* {behavior:url(#default#VML);}</style><![endif]-->"&_
			"<style id='custo_import'><!--"&_
			"table {mso-displayed-decimal-separator:'\,'; mso-displayed-thousand-separator:'\.';}"&_
			"tr {height:20px;}"&_
			"td {padding:auto;}"&_
			"col{width:auto}"&_
			"br {mso-data-placement:same-cell;}"&_
			".basico {"&_
			"  color:windowtext;"&_
			"  text-align:general;"&_
			"  text-decoration:none;"&_
			"  vertical-align:bottom;"&_
			"  font-size:12.0pt;"&_
			"  font-style:normal;"&_
			"  font-weight:normal;"&_
			"  font-family:'Arial';"&_
			"  mso-generic-font-family:auto;"&_
			"  mso-font-charset:0;"&_
			"  white-space:nowrap;"&_
			"  mso-number-format:General;}"&_

			".data {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:'Short Date';"&_
			"  font-weight:bold;"&_
			"  text-align:center;"&_
			"  vertical-align:bottom;"&_
			"  border:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
			"  col{width:auto}"&_
			"  background:#D4E6DC;}"&_
			
			".numCinza {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  font-weight:bold;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:.5pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  color:#FFFFFF;"&_
			"  overflow:auto;"&_
			"  padding:auto;"&_
			"  background:#003366;}"&_
			
			".numCinza3 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  font-weight:bold;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:.5pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:.5pt solid black;"&_
            "  color:#FFFFFF;"&_
			"  white-space:nowrap;"&_
			"  padding:auto;"&_
			"  overflow:auto;"&_
			"  background:#003366;}"&_	
			
			".NovaLinha1 {"&_
 			"  mso-style-parent:style0;"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  overflow:auto;"&_
			"  mso-height-source:auto;"&_
			"  mso-width-source:auto;"&_
			"  padding:auto;"&_
			"  background:#E5F7ED;}"&_
			
			".NovaLinha2 {"&_
			"  mso-style-parent:basico;"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  overflow:auto;"&_
			"  mso-height-source:auto;"&_
			"  mso-width-source:auto;"&_
			"  background:#D4E6DC;}"&_	
			
			".numLinha1 {"&_
 			"  mso-style-parent:style0;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  text-align: right;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:auto;"&_
			"  background:#E5F7ED;}"&_
			
			".numLinha2 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00"";"&_
			"  text-align: right;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:auto;"&_
			"  background:#D4E6DC;}"&_	
			
			".NOTAFISCAL {"&_
			"  mso-style-parent:basico;"&_
			"  	mso-number-format:""\#\\ ?\/?"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#FFFFFF;}"&_
			
			".CONTABIL1 {"&_
			"  mso-style-parent:basico;"&_
			"  	mso-number-format:""_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:auto;"&_
			"  background:#E5F7ED;}"&_	
			
			".CONTABIL2 {"&_
			"  mso-style-parent:basico;"&_
			"  	mso-number-format:""_\(* \#\,\#\#0\.00_\)\;_\(* \\\(\#\,\#\#0\.00\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:auto;"&_
			"  background:#D4E6DC;}"&_	
			
			".PERSONALIZADO1 {"&_
			"  mso-style-parent:basico;"&_
			"  	mso-number-format:""_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:15px;"&_
			"  background:#E5F7ED;}"&_	
			
			".PERSONALIZADO2 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022??_\)\;_\(\@_\)"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  padding:15px;"&_
			"  background:#D4E6DC;}"&_	

			".numLinha31 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#E5F7ED;}"&_

			".numLinha32 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#D4E6DC;}"&_	

			".numPerson1 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#E5F7ED;}"&_	

			".numPerson2 {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.000"";"&_
			"  text-align: center;"&_
			"  border:.5pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#D4E6DC;}"&_	

			".numCinco {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\,\#\#0\.00000"";"&_
			"  font-weight:bold;"&_
			"  border-top:none1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#D4E6DC;}"&_	

      ".azulEscuro {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
            "  color:#FFFFFF;"&_
			"  background:#003366;}"&_	
				
      ".BRANCO {"&_
			"  mso-style-parent:basico;"&_
			"  font-size:12.0pt;"&_
	        "  font-weight:700;"&_
	        "  color:#000000;"&_
	        "  mso-generic-font-family:auto;"&_
			"  mso-font-charset:0;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
            "  color:#FFFFFF;"&_
			"  background:#FFFFFF;}"&_	
				
	  ".xl140 {"&_
			" mso-style-parent:style0;"&_	
			" font-size:12.0pt;"&_	
			" font-weight:700;"&_	
			" font-family:Britannic Bold;"&_	
			" mso-generic-font-family:auto;"&_	
			" mso-font-charset:0;"&_	
			" border-top:.5pt solid windowtext;"&_	
			" border-right:none;"&_	
			" border-bottom:none;"&_	
			" border-left:none;"&_	
			" background:silver;"&_	
			" white-space:nowrap;"&_
			" mso-pattern:auto none;}"&_	
			
	".xl143 {"&_
		"  mso-style-parent:style0;"&_
		"  font-size:12.0pt;"&_
		"  font-weight:700;"&_
		"  font-family:Arial, sans-serif;"&_
		"  white-space:nowrap;"&_
		"  mso-font-charset:0;}"&_
		
	  ".xl147 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" text-align:left;"&_
			" border-top:1.0pt solid windowtext;"&_
			" border-right:.5pt hairline windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			"  white-space:nowrap;"&_
			" border-left:1.0pt solid windowtext;}"&_

		".xl148 {"&_
			" mso-style-parent:style0;"&_	
			" font-size:12.0pt;"&_	
			" font-family:Arial, sans-serif;"&_	
			" mso-font-charset:0;"&_	
			" border-top:1.0pt solid windowtext;"&_	
			" border-right:.5pt hairline windowtext;"&_	
			" border-bottom:1.0pt solid windowtext;"&_	
			"  white-space:nowrap;"&_
			" border-left:.5pt hairline windowtext;}"&_	

		".xl149 {"&_
			" mso-style-parent:style21;"&_	
			" font-size:12.0pt;"&_	
			" font-weight:700;"&_	
			" font-family:Arial, sans-serif;"&_	
			" mso-font-charset:0;"&_	
			" mso-number-format:Short Date;"&_	
			" text-align:center;"&_	
			"  white-space:nowrap;"&_
			" border:1.0pt solid windowtext;}"&_	

		".xl153 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" text-align:left;"&_
			" border-top:1.0pt solid windowtext;"&_
			" border-right:.5pt dotted windowtext;"&_
			" border-bottom:.5pt dotted windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:1.0pt solid windowtext;}"&_
			
		".xl154 {"&_
			" mso-style-parent:basico;"&_
			" font-size:10.0pt;"&_
			" font-family:Arial, sans-serif;"&_
			" mso-font-charset:0;"&_
			" mso-number-format:""\#\\ ?\/?"";"&_
			" text-align:center;"&_
			" border-top:1.0pt solid windowtext;"&_
			" border-right:.5pt dotted windowtext;"&_
			" border-bottom:.5pt dotted windowtext;"&_
			" border-left:.5pt dotted windowtext;}"&_
			" white-space:nowrap;"&_
			" background:#E5F7ED;}"&_	
			
      ".NF {"&_
			"  mso-style-parent:basico;"&_
			"  mso-number-format:""\#\\ ?\/?"";"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
			"  background:#E5F7ED;}"&_		
				
		".xl155 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" font-family:Arial, sans-serif;"&_
			" mso-font-charset:0;"&_
			" border-top:1.0pt solid windowtext;"&_
			" border-right:none;"&_
			" border-bottom:none;"&_
			" white-space:nowrap;"&_
			" border-left:1.0pt solid windowtext;}"&_

		".xl156 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" text-align:center;"&_
			" vertical-align:middle;"&_
			" border-top:1.0pt solid windowtext;"&_
			" border-right:1.0pt solid windowtext;"&_
			" border-bottom:none;"&_
			" border-left:none;"&_
			" background:#FFFF99;"&_
			" white-space:nowrap;"&_
			" mso-pattern:auto none;}"&_

		".xl160 {"&_
		    " mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" border-top:.5pt dotted windowtext;"&_
			" border-right:.5pt dotted windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:1.0pt solid windowtext;}"&_

		".xl161 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-family:Arial, sans-serif;"&_
			" mso-font-charset:0;"&_
			" text-align:center;"&_
			" border-top:.5pt dotted windowtext;"&_
			" border-right:.5pt dotted windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:.5pt dotted windowtext;}"&_

		".xl162 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" border-top:none;"&_
			" border-right:1.0pt solid windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:.5pt dotted windowtext;}"&_

		".xl163 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" text-align:left;"&_
			" border-top:none;"&_
			" border-right:none;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:1.0pt solid windowtext;}"&_

		".xl164 {"&_
			" mso-style-parent:style0;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" text-align:center;"&_
			" border-top:none;"&_
			" border-right:1.0pt solid windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:none;}"&_

		".xl195{"&_
			" mso-style-parent:style0;"&_
			" color:red;"&_
			" font-size:12.0pt;"&_
			" font-weight:700;"&_
			" font-family:Arial, sans-serif;"&_
			" mso-font-charset:0;"&_
			" border-top:none;"&_
			" border-right:.5pt solid windowtext;"&_
			" border-bottom:1.0pt solid windowtext;"&_
			" white-space:nowrap;"&_
			" border-left:.5pt solid windowtext;}"&_

      ".linha1 {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
			"  overflow:auto;"&_
			"  mso-height-source:auto;"&_
			"  mso-width-source:auto;"&_
			"  mso-pattern:auto none;"&_
			"  background:#E5F7ED;}"&_		

      ".linha2 {"&_
			"  mso-style-parent:basico;"&_
			"  text-align:center;"&_
			"  border-top:1.0pt solid black;"&_
			"  border-right:1.0pt solid black;"&_
			"  border-bottom:1.0pt solid black;"&_
			"  border-left:1.0pt solid black;"&_
			"  white-space:nowrap;"&_
			"  overflow:auto;"&_
			"  mso-height-source:auto;"&_
			"  mso-width-source:auto;"&_
			"  mso-pattern:auto none;"&_
			"  background:#D4E6DC;}"&_							
			"--></style>"&_
			"<!--[if gte mso 9]><xml>"&_
			"<x:ExcelWorkbook>"&_
			"  <x:ExcelWorksheets>"&_
			"    <x:ExcelWorksheet>"&_
			"      <x:Name>Custo Importa&ccedil;&atilde;o</x:Name>"&_
			"      <x:WorksheetOptions>"&_
			"        <x:Zoom>85</x:Zoom>"&_
			"        <x:Selected/>"&_
			"        <x:FreezePanes/>"&_
			"        <x:FrozenNoSplit/>"&_
			"        <x:SplitHorizontal>5</x:SplitHorizontal>"&_
			"        <x:TopRowBottomPane>5</x:TopRowBottomPane>"&_
			"        <x:SplitVertical>4</x:SplitVertical>"&_
			"        <x:LeftColumnRightPane>4</x:LeftColumnRightPane>"&_
			"        <x:ActivePane>0</x:ActivePane>"&_
			"          <x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>1</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>2</x:Number></x:Pane>"&_
			"          <x:Pane><x:Number>0</x:Number><x:ActiveRow>0</x:ActiveRow><x:ActiveCol>0</x:ActiveCol></x:Pane>"&_
			"        </x:Panes>"&_
			"        <x:ProtectContents>False</x:ProtectContents>"&_
			"        <x:ProtectObjects>False</x:ProtectObjects>"&_
			"        <x:ProtectScenarios>False</x:ProtectScenarios>"&_
			"      </x:WorksheetOptions>"&_
			"    </x:ExcelWorksheet>"&_
			"  </x:ExcelWorksheets>"&_
			"  <x:ProtectStructure>False</x:ProtectStructure>"&_
			"  <x:ProtectWindows>False</x:ProtectWindows>"&_
			"</x:ExcelWorkbook>"&_
			"</xml><![endif]-->"&_
			"</head>"
		objtxt.WriteLine(txCabecExcel)
		
		vlTaxaMLE = objrs.Fields.Item("TX_MLE").Value
		If Not fnc_TestaVar(vlTaxaMLE) Then vlTaxaMLE = 0
		
		'vlDespacho = objrs.Fields.Item("VL_DESPESA_INDAIA").Value - objrs.Fields.Item("VL_RECUPERADO").Value
		
		if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    	sql = " SELECT COUNT(CD_ITEM) as contador FROM TFATURAMENTO_CC"&_
			" WHERE NR_PROCESSO = '" & nr_processo & "'"&_
			" AND CD_ITEM IN ('025','032','027','600','599')"
    	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		if objrsx("contador") <> "0" Then
			vlDespacho = vl_tot_geral
		Else
			vlDespacho = vl_tot_geral
		End If

     	If Not fnc_TestaVar(vlDespacho) Then vlDespacho = 0				
		
		if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    	sql = " SELECT (VL_TOTAL_II + VL_TOTAL_TX_SCX) AS SOMA FROM TDECLARACAO_IMPORTACAO"&_
			" WHERE NR_PROCESSO = '" & nr_processo & "'"
    	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		vlTotalIISCX = objrsx.Fields.Item("SOMA").Value

        vlTotalFrete = 0
        if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    	sql = " SELECT VL_TOTAL_FRETE_MN AS FRETE FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = '" & nr_processo & "'"
    	objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
		If Not InStr("028;949;503", Session("cd_grupo_despacho")) <> 0 Then    
            vlTotalFrete = objrsx.Fields.Item("FRETE").Value
        End If

		if objrsx.State = adStateOpen Then objrsx.Close
		sql = "SELECT CONVERT(DATETIME,DT_REALIZACAO,103) AS DT_DI FROM TFOLLOWUP WHERE NR_PROCESSO = '" & nr_processo & "' AND CD_EVENTO = '021'" 
		Objrsx.Open sql,objcnn,adOpenStatic,adLockReadOnly
		
		If Objrsx.RecordCount > 0 Then
		   If Objrsx.Fields.Item("DT_DI").Value >= CDate("21/01/2011") Then
				cd_seg_planilha = "1061089"
		   Else
				cd_seg_planilha = "1039089"
		   End If
		Else
		   cd_seg_planilha = "1039089"
		End If
		
		If objrsx.state = adstateOpen then objrsx.close()
		cd_transp_planilha = ""
		  sql = "SELECT DP.CD_EXTERNO AS CD_EXTERNO"&_
				" FROM BROKER.DBO.TDE_PARA DP "&_
				" INNER JOIN TPROCESSO P ON (P.CD_TRANSP_NAC = DP.CD_DDBROKER AND DP.CD_TABELA='41' AND DP.CD_GRUPO='" & Session("cd_grupo_despacho") & "') "&_
				" WHERE P.NR_PROCESSO = '" & nr_processo & "'"
		objrsx.Open sql, objcnn, adOpenStatic, adLockReadOnly, adCmdText	
				
		If objrsx.RecordCount > 0 Then
		  cd_transp_planilha = objrsx.Fields.Item("CD_EXTERNO").Value
		End If  
		
		
		

		
''-------------Alterado em 24/04/2008 --------------------------------------------------------------------------
''Renata insere valor SDA via web 
'		   ' Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")
'
'		If objrs.Fields.Item("VL_INSS").Value= 0 then 
'			sql="select VL_ITEM from TFATURAMENTO_CC WHERE NR_PROCESSO ='"& nr_processo &"' and cd_item='008' and cd_origem_lanc='5'"
'			Objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
'			If objrsx.eof then
'			   vlINSS = objrs.Fields.Item("VL_INSS").Value
'			   'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("VL_INSS").Value&"")
'			else
'				vlINSS=Objrsx("VL_ITEM")*0.2
'			    'Response.Redirect("../IMPORT/teste.asp?var1="&objrsx.Fields.Item("VL_ITEM").Value&"")
'			end if
'		else 
'			vlINSS = objrs.Fields.Item("VL_INSS").Value
'		end if	
'		If Not fnc_TestaVar(vlINSS) Then vlINSS = 0
''------------------------------------------------------------------------------------------------------------------
		
		vlSeguro = objrs.Fields.Item("VL_TOTAL_SEG_MN").Value
		If Not fnc_TestaVar(vlSeguro) Then vlSeguro = 0
		
		txCorpoExcel = "<body>"&_
			"<div id='custo_import' align=center x:publishsource='Excel'>"&_
			"  <table x:str border=0 cellpadding=0 cellspacing=0 style='border-collapse:collapse;table-layout:fixed;'>"&_
			"    <col width=34>"&_
			"    <col width=116>"&_
			"    <col width=113>"&_
			"    <col width=149>"&_
			"    <col width=97>"&_
			"    <col width=118>"&_
			"    <col width=140>"&_
			"    <col width=99>"&_
			"    <col width=94>"&_
			"    <col width=62>"&_
			"    <col width=57>"&_
			"    <col width=93>"&_
			"    <col width=126>"&_
			"    <col width=97>"&_
			"    <col width=89>"&_
			"    <col width=93>"&_
			"    <col width=99>"&_
			"    <col width=88>"&_
			"    <col width=94>"&_
			"    <col width=80>"&_
			"    <col width=115>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class='azulEscuro'><nobr><b>Embarque:</b></nobr></td>"&_
			"    <td class='linha1'>"& fnc_Mascara(objrs.fields.item("NR_DI").value, 2) &"</td>"&_
			"    <td class='linha1'>&nbsp;</td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro><nobr><b>Invoice e data:</b></nobr></td>"&_
			"    <td class=linha2 align=right style='border-right: none; border-bottom: 1.0pt solid black;'>"& nr_invoice &"</td>"&_
			"    <td class=data>"& fnc_Mascara(Data_Fatura, 5) &"</td>"&_
			"    <td></td><td></td><td></td><td></td><td></td><td colspan='2'></td>"&_
			"    <td class=data style='color:#FF0000;' x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(fnc_Mascara(objrs.Fields.Item("DT_EMBARQUE").Value, 5), 3, 0) &"'></td>"&_
			"    <td class=data style='color:#FF0000;' x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"    <td class=data x:num='"& fnc_ConvertToExcel(Date, 3, 0) &"'></td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro><nobr><b>NF e data:</b></nobr></td>"&_
			"    <td class=NF style='border-top:none'><nobr>"& RTrim(LTrim(txNotaFiscal)) &"</nobr></td>"&_
			"    <td class=azulEscuro><nobr><b>C&oacute;d. Fornecedor:</nobr></b></td>"&_
			"    <td class=azulEscuro><nobr><b>Texto Geral:</b></nobr></td>"&_
			"    <td class=linha1 style='vertical-align:top;'><nobr>"& nr_referencia &" "& objrs.Fields.Item("NM_AREA").Value &"</nobr></td>"&_
			"    <td></td><td></td><td></td><td></td><td></td>"&_
			"    <td class=linha1>"& cd_transp_planilha&"</td>"
			
            If Session("cd_grupo_despacho") = "028" Then    
                    txCorpoExcel = txCorpoExcel & "    <td class=linha1>11366</td>"&_
			        "    <td class=linha1>1040042</td>"&_
			        "    <td class=linha1>1038750</td>"&_
			        "    <td class=linha1>1041700</td>"&_
                    "    <td class=linha1>" & cd_seg_planilha & "</td>"&_
                    "    <td class=linha1>1057890</td>"
            Else
                txCorpoExcel = txCorpoExcel & "    <td class=linha1></td>"&_
			    "    <td class=linha1></td>"&_
			    "    <td class=linha1></td>"&_
			    "    <td class=linha1></td>"&_
                "    <td class=linha1></td>"&_
                "    <td class=linha1></td>"
            End If	
            					
			 txCorpoExcel = txCorpoExcel & "  </tr>"&_
			"  <tr>"&_
			"    <td>&nbsp;</td>"&_
			"    <td class=azulEscuro><nobr><b>Conhec. Transporte:</b></nobr></td>"&_
			"    <td class=NovaLinha2 style='border-top:none'></td>"&_
			"    <td class=linha2 align=right style='border-bottom: 1.0pt solid black; border-top: none;'>"& objrs.Fields.Item("NR_CLIENTE").Value &"</td>"&_
			"    <td class=azulEscuro style='border-top: none; border-right: none;'><nobr><b>Taxa:</b></nobr></td>"&_
			"    <td class=linha2 x:num='"& fnc_ConvertToExcel(vlTaxaMLE, 1, 16) &"'></td>"&_
			"    <td></td><td></td><td></td><td></td><td></td>"&_
			"    <td class=linha2 style='border-top:none; border-left: 1.0pt solid black;'><nobr>ZDFN-Frete Nacional</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDFI-Frete Intl.</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDDP-Despachante</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDAZ-Armazenagem</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDDV-Desp. Diversas</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDSG-Seguro</nobr></td>"&_
			"    <td class=linha2 style='border-top:none;border-left:none;'><nobr>ZDSX-Taxa DI</nobr></td>"&_
			"    <td class=linha2 style='text-align:center;border-left:none;border-top:1.0pt solid black;'><nobr>TOTAL</nobr></td>"&_
			"    <td class=linha2 style='text-align:center;border-left:none;border-top:1.0pt solid black;border-right:1.0pt solid black;'><nobr>R$/UNID.</nobr></td>"&_
			"  </tr>"&_
			"  <tr>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Item</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>PEDIDO</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>C&oacute;d. Material</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Quantidade</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>N. de Lote</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;overflow:auto;'><nobr><b>"& objrs.Fields.Item("SIGLA_MOEDA_MLE").Value &"</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Unit&aacute;rio</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align:center;'><nobr><b>Por</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>BRL</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>UNID.</b></nobr></td>"&_
			"    <td class=azulEscuro style='text-align: center;'><nobr><b>%</b></nobr></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vl_transp_nacional, 1, 16) & "'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlTotalFrete, 1, 16) & "'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlDespacho, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='0'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlINSS, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlSeguro, 1, 16) &"'></td>"&_
			"    <td class=numCinza x:num='"& fnc_ConvertToExcel(vlTotalIISCX, 1, 16) & "'></td>"&_
			"    <td class=numCinza style='text-align:center;'><nobr>CUSTO</nobr></td>"&_
			"    <td class=numCinza style='text-align:center;'><nobr>CUSTO</nobr></td>"&_
			"  </tr>"
		objtxt.WriteLine(txCorpoExcel)
		cont = objrs.RecordCount + 6
		'recupera as variaveis de qtde e unidade
		aCdMercadoria = Split(Request.Form("CdMercadoria"), ", ", -1)
		aNrNovaQtde   = Split(Request.Form("NrNovaQtde"), ", ", -1)
		aTxNovaUnid   = Split(Request.Form("TxNovaUnid"), ", ", -1)
		
		objrs.MoveFirst
		Do while not objrs.Eof
			x = objrs.AbsolutePosition + 5
			z = (x mod 2) + 1
			vNrItem = objrs.fields.item("NR_ITEM").value
			If Not fnc_TestaVar(vNrItem) Then vNrItem = "0" 
			
			vCodMercadoria = objrs.fields.item("CD_MERCADORIA").value
			'somente para saint goban
'			if objrs.Fields.Item("CD_GRUPO") = "028" then
'				vCodMercadoria = Mid(objrs.fields.item("CD_MERCADORIA").value, 4, 12)
'			end if
			
			vlQtde = ""
			txUnid = ""
			'verifica se existem novos valores de qtde e unidade de medida
			if fnc_TestaVar(Request.Form("NrNovaQtde")) then
				for y = 0 to UBound(aCdMercadoria)
					if Trim(aCdMercadoria(y)) = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.fields.item("CD_MERCADORIA").value) then
						vlQtde = aNrNovaQtde(y)
					end if
				next
			end if	
			if fnc_TestaVar(Request.Form("TxNovaUnid")) then
				for y = 0 to UBound(aCdMercadoria)
					if Trim(aCdMercadoria(y)) = Trim(objrs.Fields.Item("NR_REFERENCIA").Value)&"#"&Trim(objrs.fields.item("CD_MERCADORIA").value) then
						txUnid = aTxNovaUnid(y)

						'Response.Redirect("../IMPORT/teste.asp?var1="&txUnid&"")
					end if
				next
			end if	



			'se não forem encontradas, exibe valores da tabela
			if Not fnc_TestaVar(vlQtde) then 
				vlQtde = objrs.Fields.Item("QT_MERC_UN_COMERC").Value
				If Not fnc_TestaVar(vlQtde) Then vlQtde = 0
			end if					
			if Not fnc_TestaVar(txUnid) then	
				if objrsx.State = adStateOpen then objrsx.Close
    		'seleciona sigla do De-Para da Saint Gobain, se existir mais de um deixa vazio 
    		sql = "SELECT DISTINCT RTRIM(LTRIM(CD_EXTERNO)) AS NM_UNID_MED FROM TDE_PARA (NOLOCK) WHERE CD_TABELA = '20' AND CD_DDBROKER = '"& objrs.fields.item("UNID_MED").value &"' "
    		objrsx.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
        if objrsx.RecordCount = 1 then
    			txUnid = objrsx.fields.item("NM_UNID_MED").value
				else
          txUnid = ""
				end If	
			end if
'****************************  Valor que será utilizado para calcular o desconto da embalagem   **********************
			if objrsv.State = adStateOpen then objrsv.Close
			   sql = "SELECT SUM (VL_MLE_ITEM) AS TOTAL FROM TDETALHE_MERCADORIA where NR_PROCESSO='"& nr_processo &"'"
    		objrsv.Open sql, objcnn, adOpenstatic, adLockReadOnly, adCmdText
'***********************************************************************************************************************
			vlItem = objrs.Fields.Item("VL_MLE_ITEM").Value
			If Not fnc_TestaVar(vlItem) Then vlItem = 0
			   vlItem=vlItem-(vlItem*ValEmbalagem/objrsv.fields.item("TOTAL").value)
		    'Response.Redirect("../IMPORT/teste.asp?var1="&vlItem&"")
			'cont2 = objrs.RecordCount + 5
			txLinhaExcel = "  <tr>"&_
				"    <td class=Novalinha"& z &">"& vNrItem &"</td>"&_
				"    <td style='background: #003366;color: #FFFFFF; white-space:nowrap; overflow:auto;'>"& objrs.fields.item("NR_REFERENCIA").value &"</td>"&_
				"    <td style='background: #003366;color: #FFFFFF; white-space:nowrap;overflow:auto; '>"& vCodMercadoria &"</td>"&_
				"    <td class=numPerson"& z &" style='text-align:right; overflow:auto;padding:auto;' x:num='"& fnc_ConvertToExcel(vlQtde, 1, 16) &"'></td>"&_
				"    <td class=Novalinha"& z &"></td>"&_
				"    <td class=CONTABIL"& z &" x:num='"& fnc_ConvertToExcel(vlItem, 1, 16) &"'></td>"&_
				"    <td class=CONTABIL"& z &" x:num x:fmla='=F"& x &"/D"& x &"*H"& x &"'></td>"&_
				"    <td class=PERSONALIZADO"& z &" style='text-align:right;' x:num='10000'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=IF(F"& x &"=0,0,+F"& x &"*$F$4)'></td>"&_
				"    <td class=Novalinha"& z &">"& txUnid &"</td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=IF(I"& x &"=0,0,I"& x &"/$I$"& cont &")'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$L$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$M$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$N$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$O$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$P$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$Q$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=+$R$5*K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=SUM(I"& x &":R"& x &")-K"& x &"'></td>"&_
				"    <td class=numlinha"& z &" x:num x:fmla='=S"& x &"/D"& x &"'></td>"&_
				"  </tr>"
			objtxt.WriteLine(txLinhaExcel)
			objrs.MoveNext
			if objrs.Eof then Exit Do
		Loop
		cont = objrs.RecordCount + 5
		'Response.Redirect("../IMPORT/teste.asp?var1="&ValEmbalagem&"")

		txCorpoExcel = "<tr>"&_
			"    <td style='background:#003366; text-align:left; color:#FF0000; white-space:nowrap;'><nobr><b>Totais:</b></nobr></td>"&_
			"    <td style='background:#003366; text-align:left; color:#FF0000;white-space:nowrap;'></td>"&_
			"    <td style='background:#003366; text-align:left; color:#FF0000;white-space:nowrap;'>&nbsp;</td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(D6:D"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(E6:E"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(F6:F"& cont &")' col width=250></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(G6:G"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(H6:H"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(I6:I"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(J6:J"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(K6:K"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(L6:L"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(M6:M"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(N6:N"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(O6:O"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(P6:P"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(Q6:Q"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(R6:R"& cont &")' col width=150></td>"&_
			"    <td class=numCinza x:num x:fmla='=SUM(S6:S"& cont &")' col width=150></td>"&_
			"    <td class=azulEscuro col width=150>&nbsp;</td>"&_
			"  </tr>"&_
			"</table></div></body></html>"
		objtxt.WriteLine(txCorpoExcel)
		objtxt.Close()
		
		Set objtxt = Nothing
		Set objfso = Nothing

		'cria o objeto q gerencia o sistema de arquivos
	end if
end if
				'Response.Redirect("../IMPORT/teste.asp?var1="&objrs.Fields.Item("DT_FATURA").Value&"")

%>
<!--#include virtual="/includes/inc_ends.asp" -->
