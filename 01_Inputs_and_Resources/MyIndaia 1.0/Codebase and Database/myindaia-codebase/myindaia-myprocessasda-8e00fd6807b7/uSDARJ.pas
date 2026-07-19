unit uSDARJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  System.Masks, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  Navigator.WebBrowser, Navigator.Utils, ShellAPI, MSHTML, SHDocVw, System.StrUtils, Vcl.ComCtrls;

  type TSDARJ = Class

  private
  Var
    wb: TNavigatorWebBrowser;
    web_boleto: TNavigatorWebBrowser;
    tmrSalvar: TTimer;
    tmrSelecionaArquivo: TTimer;
    tmrImprimir: TTimer;
    User, Password : String;
    ArquivoAtual : String;
  Const
    ENDERECO = 'http://sys.sindaerj.org.br/despachante/login.php';

  procedure onDocumentCompletedTransmiteSDA(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
  procedure TransmiteSDA;
  procedure ClicarEmTransferirArquivo(Arquivo, IndiceTabela : String);
  function BuscarValorPagina(browser :TNavigatorWebBrowser; stag, sDescricao, tipo : String; var indiceComponente : String) :string;

  procedure onDocumentCompleteConsultarGuias(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
  procedure ConsultarGuias;
  procedure NavegarParaImpressaoBoleto(var lista : TStringList);
  procedure PegarLinksImpressao(Descricao :String; IndiceTabela : String; var Lista : TStringList);

  procedure onDocumentCompletedImprimeBoleto(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
  procedure ImprimirBoleto;

  function BuscarNrProcessoBoleto : string;
  procedure tmrSalvarTimer(Sender: TObject);
  procedure tmrImprimirTimer(Sender: TObject);
  procedure tmrSelecionaArquivoTimer(Sender: TObject);
  procedure SelecionaArquivo(const arquivo : String);

  function GerarArquivosXML(CodDespachante, RegistroDespachante, RegistroDespachanteRJ, CPFDespachante : String) : String;
  procedure PreencheXml(vIETIPODOC,vIEDOC,vIENOME,vIEENDERECO,vIECIDADE,vIEBAIRRO,vIECEP,vIEESTADO,
  vGUIATIPO,vGUIAREGISTRO,vGUIADECLARACAO,vGUIACONHECIMENTO,vGUIAREFERENCIA,vGUIACHEGADA,vGUIAVEICULO,
  vGUIALINHA1,vGUIALINHA2,vGUIALINHA3,vGUIAVALOR,vGUIABANCO, vGUIAVENCIMENTO:String; var lstXML : TStringList );

  CONST
  ID_PROCESSO = 'Processo: ';

  public
  procedure Transmitir(Usuario, Senha , Arquivo: String );
  procedure Consultar(Usuario, Senha, Arquivo : String );
  procedure MontarArquivos;

  published
    constructor Create;
    Destructor  Destroy; override;
  End;

implementation

uses
  uProcessaSDA, Utils, Componentes, DmBroker;

constructor TSDARJ.Create;
begin
  wb := TNavigatorWebBrowser.Create;
  tmrSalvar := TTimer.Create(nil);
  tmrSalvar.Enabled := false;
  tmrSalvar.OnTimer := tmrSalvarTimer;
  tmrSelecionaArquivo := TTimer.Create(nil);
  tmrSelecionaArquivo.Enabled := false;
  tmrSelecionaArquivo.OnTimer := tmrSelecionaArquivoTimer;
  tmrImprimir := TTimer.Create(nil);
  tmrImprimir.Enabled := false;
  tmrImprimir.OnTimer := tmrImprimirTimer;
end;

destructor TSDARJ.Destroy;
begin
  FreeAndNil(wb);
  FreeAndNil(web_boleto);
  FreeAndNil(tmrSalvar);
  FreeAndNil(tmrSelecionaArquivo);
  FreeAndNil(tmrImprimir);
  inherited;
end;

procedure TSDARJ.Transmitir(Usuario, Senha , Arquivo: String );
begin
  User     := Usuario;
  Password := Senha;
  ArquivoAtual :=  Arquivo;
  wb.WebBrowser.OnDocumentComplete := onDocumentCompletedTransmiteSDA;
  wb.RedimencionarBrowser;
  wb.Navegate(ENDERECO);
end;

procedure TSDARJ.Consultar(Usuario, Senha , Arquivo: String );
begin
  User := Usuario;
  Password := Senha;
  ArquivoAtual :=  Arquivo;
  wb.WebBrowser.OnDocumentComplete := onDocumentCompleteConsultarGuias;
  wb.RedimencionarBrowser;
  wb.Navegate(ENDERECO);
end;

procedure TSDARJ.onDocumentCompletedTransmiteSDA(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  TransmiteSDA;
end;

procedure TSDARJ.TransmiteSDA;
var nm_arquivo, sTabela, URL, URL_Completo , IndiceTabela: string;
x :integer;
begin
  try
    URL          := lowercase(wb.GetPageName);
    URL_Completo := lowercase(wb.GetPageNameComplete);

    if URL = lowercase('login.php') then
    begin
      sleep(2000);
      wb.ExecuteScript('document.getElementsByName("usuario")[0].value = "'+User+'"');
      wb.ExecuteScript('document.getElementsByName("senha")[0].value   = "'+Password+'"');
      wb.ClicarBotaoPorTag('input', 'Entrar', 'valor');
    end
    else
    if URL = lowercase('menugrh.php') then
    begin
      sleep(2000);
      wb.Redirect('http://sys.sindaerj.org.br/despachante/integracao.php');
    end
    else
    if URL_Completo = lowercase('http://sys.sindaerj.org.br/despachante/integracao.php') then
    begin
      tmrSelecionaArquivo.Enabled := true;
      wb.ClicarBotaoPorTag('input', 'file', 'nome');

      nm_arquivo :='';
      x := 0;
      repeat
        nm_arquivo := wb.GetValueInDocument('myarquivo', 'document.getElementsByName("file")[0].value;');
        inc(x);
        sleep(1000)
      until (nm_arquivo <> '') or (x = 2);
      tmrSelecionaArquivo.Enabled := false;

      wb.ClicarBotaoPorTag('input', 'Validar', 'valor');
    end
    else
    if (URL_Completo = lowercase('http://sys.sindaerj.org.br/despachante/integracao.php?controle=.')) or
       (URL_Completo = lowercase('http://sys.sindaerj.org.br/despachante/integracao.php?controle=validar')) then
    begin
      sTabela :='';
      x := 0;
      repeat
        sTabela := BuscarValorPagina(wb, 'table','Pendente', 'innertext', IndiceTabela);
        inc(x);
        sleep(1000)
      until AnsiContainsText(sTabela, 'Pendente') or (x = 2);

      MoveFile(Pchar(frmProcessaSDA.PastaArquivosGerados + ArquivoAtual),
               PChar(frmProcessaSDA.PastaArquivosTransmitidos + ArquivoAtual));

      sleep(2000);

      ClicarEmTransferirArquivo(ArquivoAtual, IndiceTabela);
      log('Arquivo Transmitido ' + ArquivoAtual, frmProcessaSDA.logar);

      sleep(1000);
      wb.ClicarBotaoPorTag('a', 'Sair');
      wb.Finish;
    end;
  except on e:exception do
    log(e.Message, frmProcessaSDA.logar);
  end;
end;

procedure TSDARJ.onDocumentCompleteConsultarGuias(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  ConsultarGuias ;
end;

procedure TSDARJ.ConsultarGuias;
var URL, URL_Completo , IndiceTabela: string;
ListaLinks : TStringList;
begin
  try
    try
      URL          := wb.GetPageName;
      URL_Completo := wb.GetPageNameComplete;
      ListaLinks   := TStringList.Create();

      if URL = lowercase('login.php') then
      begin
        sleep(2000);
        wb.ExecuteScript('document.getElementsByName("usuario")[0].value = "'+User+'"');
        wb.ExecuteScript('document.getElementsByName("senha")[0].value   = "'+Password+'"');
        wb.ClicarBotaoPorTag('input', 'Entrar', 'valor');
      end
      else
      if URL = lowercase('menugrh.php') then
      begin
        sleep(1000);
        wb.Redirect('http://sys.sindaerj.org.br/despachante/consulta_guias.php');
      end
      else
      if URL = lowercase('consulta_guias.php') then
      begin
        sleep(2000);
        BuscarValorPagina(wb, 'table','Nº Guia', 'innertext',IndiceTabela);
        PegarLinksImpressao('Lançada ', IndiceTabela ,ListaLinks);
//        PegarLinksImpressao('Impressa ', IndiceTabela ,ListaLinks);

        NavegarParaImpressaoBoleto(ListaLinks);
        try
          If MoveFile(PChar(frmProcessaSDA.PastaArquivosTransmitidos + ArquivoAtual),
               PChar(frmProcessaSDA.PastaArquivosProcessados  + ArquivoAtual)) then
          else
            RaiseLastOSError;
        except  on E: Exception do
           log(Format('Erro copyFile %s',[E.Message]), frmProcessaSDA.logar);
        end;
        wb.ClicarBotaoPorTag('a', 'Sair');
        wb.Finish;
      end;
    except on e:exception do
      log(e.Message, frmProcessaSDA.logar);
    end;
  finally
    ListaLinks.Free;
  end;
end;

procedure TSDARJ.NavegarParaImpressaoBoleto(var lista : TStringList);
var i : integer;
begin
  for I := 0 to lista.Count -1 do
  begin
    sleep(2000);
    tmrImprimir.Enabled := false;
    tmrSalvar.Enabled   := false;
    web_boleto := TNavigatorWebBrowser.Create;
    web_boleto.RedimencionarBrowser;
    web_boleto.WebBrowser.OnDocumentComplete := onDocumentCompletedImprimeBoleto;
    web_boleto.Navegate(lista[i]);
  end;
end;

procedure TSDARJ.onDocumentCompletedImprimeBoleto(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
begin
  ImprimirBoleto;
end;

procedure TSDARJ.ImprimirBoleto;
var URL, URL_Completo : string;
statusPagina : integer;
vIn, vOut: OleVariant;
begin
  URL          := web_boleto.GetPageName;
  URL_Completo := web_boleto.GetPageNameComplete;

  sleep(2000);
  statusPagina := web_boleto.WebBrowser.ReadyState;

  if statusPagina in [4] then
  begin
    {imprimir}
    tmrImprimir.Enabled := true;
    tmrSalvar.Enabled   := true;
    //essa pagina é impressa automaticamente. não preciso executar a impressao então...
   // web_boleto.WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
   // web_boleto.WebBrowser.OnDocumentComplete := nil;
    {imprimir}
  end;
end;

function TSDARJ.BuscarNrProcessoBoleto : string;
var x : integer;   RegistroNrProcesso, indice, nr_processo : string;
begin
  x := 0;
  repeat
    RegistroNrProcesso := BuscarValorPagina(web_boleto, 'td',trim(ID_PROCESSO),'textContent', indice);
    inc(x);
    sleep(1000)
  until AnsiContainsText(Uppercase(trim(RegistroNrProcesso)), Uppercase(trim(ID_PROCESSO))) or (x = 2);

  nr_processo := Copy(RegistroNrProcesso, pos(Uppercase(ID_PROCESSO), Uppercase(RegistroNrProcesso)) + length(ID_PROCESSO),18);
  result := trim(AnsiReplaceStr(nr_processo, #$A, ''));
end;

procedure TSDARJ.PegarLinksImpressao(Descricao :String; IndiceTabela : String; var Lista : TStringList);
var
 qtLinks, qt_Linhas_tab, qtTabelas, qtlinhas_tab_interna, qtcelulas :string;
 I, x, j, s, y, n: Integer;
 mensagem :string;
 linkJaEstaNaLista : boolean;
begin
  qt_Linhas_tab := wb.GetValueInDocument('qt_Linhas_tab',
                                         'document.getElementsByTagName("table")['+IndiceTabela+']'+
                                         '.getElementsByTagName("tr").length;');
  if qt_Linhas_tab = '' then qt_Linhas_tab := '0';

  for I := 0 to strtoint(qt_Linhas_tab) -1 do
  begin
     qtTabelas := wb.GetValueInDocument('qtTabelas',
     'document.getElementsByTagName("table")['+IndiceTabela+']'+
             '.getElementsByTagName("tr")['+inttostr(i)+']'+
             '.getElementsByTagName("table").length;');
     if qtTabelas = '' then qtTabelas := '0';

     for y := 0 to strtoint(qtTabelas) -1 do
     begin
       qtlinhas_tab_interna := wb.GetValueInDocument('qtLinInter',
       'document.getElementsByTagName("table")['+IndiceTabela+']'+
               '.getElementsByTagName("tr")['+inttostr(i)+']'+
               '.getElementsByTagName("table")['+inttostr(y)+']'+
               '.getElementsByTagName("tr").length;');
       if qtlinhas_tab_interna = '' then qtlinhas_tab_interna := '0';

       for x := 0 to strtoint(qtlinhas_tab_interna) -1 do
       begin
         qtcelulas := wb.GetValueInDocument('qtcel',
         'document.getElementsByTagName("table")['+IndiceTabela+']'+
                '.getElementsByTagName("tr")['+inttostr(i)+']'+
                '.getElementsByTagName("table")['+inttostr(y)+']'+
                '.getElementsByTagName("tr")['+inttostr(x)+']'+
                '.getElementsByTagName("td").length;');
         if qtcelulas = '' then qtcelulas := '0';

         for n := 0 to strtoint(qtcelulas) -1 do
         begin
				    mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
              'document.getElementsByTagName("table")['+IndiceTabela+']'+
                      '.getElementsByTagName("tr")['+inttostr(i)+']'+
                      '.getElementsByTagName("table")['+inttostr(y)+']'+
                      '.getElementsByTagName("tr")['+inttostr(x)+']'+
                      '.getElementsByTagName("td")['+inttostr(n)+'].innerText;');

           //verifica se a linha é = Lançada
           if Uppercase(Trim(mensagem)) = Uppercase(Trim(Descricao)) then
           begin
             qtLinks := wb.GetValueInDocument('qtLinks',
             'document.getElementsByTagName("table")['+IndiceTabela+']'+
                     '.getElementsByTagName("tr")['+inttostr(i)+']'+
                     '.getElementsByTagName("table")['+inttostr(y)+']'+
                     '.getElementsByTagName("tr")['+inttostr(x)+']'+
                     '.getElementsByTagName("a").length;');

             if qtLinks = '' then  qtLinks := '0';

             for j := 0 to strtoint(qtLinks) -1 do
             begin
                mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
               'document.getElementsByTagName("table")['+IndiceTabela+']'+
                       '.getElementsByTagName("tr")['+inttostr(i)+']'+
                       '.getElementsByTagName("table")['+inttostr(y)+']'+
                       '.getElementsByTagName("tr")['+inttostr(x)+']'+
                       '.getElementsByTagName("a")['+inttostr(j)+'].href;');

               //verifica se é o botão de impressao
              // if AnsiContainsText(mensagem,  'boleto_visualiza') then
               if AnsiContainsText(mensagem,  'boleto_itau') then
               begin
                 linkJaEstaNaLista := false;
                 for s := 0 to Lista.Count-1 do
                 begin
                   if Lista[s] = mensagem then
                     linkJaEstaNaLista :=True;
                 end;
                 if not linkJaEstaNaLista then
                   Lista.Add(mensagem);

                 break;
               end;
             end;
           end;
         end;
       end;
     end;
  end;
end;

procedure TSDARJ.ClicarEmTransferirArquivo(Arquivo, IndiceTabela : String);
var
 qtLinks, qtNomes , qtLinhas :string;
 I, x, j: Integer;
 mensagem :string;
begin
  qtLinhas := wb.GetValueInDocument('qt_Linhas', 'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr").length;');

  if qtLinhas = '' then qtLinhas := '0';

  for I := 0 to strtoint(qtLinhas) -1 do
  begin
     qtNomes := wb.GetValueInDocument('qtNomes',
     'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("b").length;');

     if qtNomes = '' then qtNomes := '0';

     for x := 0 to strtoint(qtNomes) -1 do
     begin
       mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
      'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("b")['+inttostr(x)+'].innerText;');

       //verifica se está na linha do arquivo
       if AnsiContainsText(Uppercase(Trim(mensagem)), Uppercase(Trim(Arquivo))) then
       begin
         qtLinks := wb.GetValueInDocument('qtLinks',
         'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("a").length;');
         if qtLinks = '' then  qtLinks := '0';

         for j := 0 to strtoint(qtLinks) -1 do
         begin
            mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
           'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("a")['+inttostr(j)+'].href;');
           //verifica se é o botão de transferencia
           if AnsiContainsText(mensagem, 'Transferir' ) then
           begin
             wb.ExecuteScript(
             'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("a")['+inttostr(j)+'].click();');
             break;
           end;
         end;
       end;
     end;
  end;
end;

function TSDARJ.BuscarValorPagina(browser :TNavigatorWebBrowser; stag, sDescricao, tipo : String; var indiceComponente : String) :string;
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
begin
  QtCamposMensagem := browser.GetValueInDocument('tamanho'+sTag ,
                                                 'document.getElementsByTagName("'+sTag+'").length;');
  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      if tipo = 'innertext' then
      mensagem := browser.GetValueInDocument('mymsg'+inttostr(i),
                                             'document.getElementsByTagName("'+sTag+'")['+inttostr(i)+'].innerText;')
      else
      mensagem := browser.GetValueInDocument('mymsg'+inttostr(i),
                                             'document.getElementsByTagName("'+sTag+'")['+inttostr(i)+'].textContent;');

      if AnsiContainsText(UpperCase(mensagem), Uppercase(Trim(sDescricao))) then
      begin
        indiceComponente := inttostr(i);
        result := mensagem;
        break;
      end;
    end;
  end;
end;

procedure TSDARJ.tmrSalvarTimer(Sender: TObject);
var HSalvar: HWND;
    NomeArquivo :string;
begin
  tmrSalvar.Enabled := false;
  HSalvar := 0;
  HSalvar := FindWindow(nil, 'Salvar Como');

  if HSalvar <> 0 then
  begin
    try
      SetForegroundWindow(HSalvar);
      ListarComponentes(HSalvar);

      NomeArquivo := BuscarNrProcessoBoleto + '_' + FormatDateTime('ddmmyyyy', now) + '.pdf';

      sleep(1000);
      SendText(LocalizarComponente('EDIT', '').Hnd, frmProcessaSDA.PastaArquivosBaixados + NomeArquivo);
      sleep(1000);
      SendClick(LocalizarComponente('', 'Salvar').Hnd);
      sleep(3000);

      web_boleto.Finish;
    except on E:Exception do
    begin
      Log('Timer Salvar - ' + E.Message, frmProcessaSDA.Logar);
    end;
    end;
  end
  else
     tmrSalvar.Enabled := true;
end;

procedure TSDARJ.tmrImprimirTimer(Sender: TObject);
var
  HImprimir: HWND;
begin
  try
    try
      tmrImprimir.Enabled := false;
      HImprimir := FindWindow(nil, 'Imprimir');
      if HImprimir <> 0 then
      begin
        SetForegroundWindow(HImprimir);
        ListarComponentes(HImprimir);
        SendClick(LocalizarComponente('', 'Imprimir').Hnd);
        Sleep(1000);
      end;
    finally
      tmrImprimir.Enabled := true;
    end;
  except on E:Exception do
    Log('Timer Imprimir - ' + E.Message, frmProcessaSDA.Logar);
  end;
end;

procedure TSDARJ.tmrSelecionaArquivoTimer(Sender: TObject);
begin
  SelecionaArquivo(frmProcessaSDA.PastaArquivosGerados + ArquivoAtual);
end;

procedure TSDARJ.SelecionaArquivo(const arquivo : String);
var HSalvar: HWND;
begin
  HSalvar := 0;
  HSalvar := FindWindow(nil, 'Escolher arquivo a carregar');
  if HSalvar = 0 then
    HSalvar := FindWindow(nil, 'Abrir');

  if HSalvar <> 0 then
  begin
    SetForegroundWindow(HSalvar);
    ListarComponentes(HSalvar);

    sleep(1000);
    SendText(LocalizarComponente('Edit', '').Hnd, arquivo);
    SendText(LocalizarComponente('Edit', '').Hnd, arquivo);
    sleep(1000);
    SendClick(LocalizarComponente('', '&Abrir').Hnd);
    SendClick(LocalizarComponente('', '&Abrir').Hnd);
    sleep(1000);
  end
  else
    sleep(1000);
end;

function TSDARJ.GerarArquivosXML(CodDespachante, RegistroDespachante, RegistroDespachanteRJ, CPFDespachante : String) : String;
var
  strPath,strFile, PastaGravarArquivo:String;
  lstXML:TStringList;
  mProcessos: TFDMemTable;
begin

  result := '';
  mProcessos := TFDMemTable.Create(nil);
  dmdBroker.qryDadosSDA.Close;
  dmdBroker.qryDadosSDA.Sql.Text := dmdBroker.GetSqlDadosSDA('DESPACHANTE');
  dmdBroker.qryDadosSDA.ParamByName('CD_DESPACHANTE').AsString := CodDespachante;
  dmdBroker.qryDadosSDA.ParamByName('NR_PROCESSO').AsString    := '';
  dmdBroker.qryDadosSDA.ParamByName('CD_UNID_NEG').AsString    := dmdBroker.FILIAL_RIO;
  dmdBroker.qryDadosSDA.Prepare;
  dmdBroker.qryDadosSDA.Open;
  dmdBroker.qryDadosSDA.FetchAll;
  mProcessos.Data := dmdBroker.qryDadosSDA.Data;
  dmdBroker.qryDadosSDA.close;
  dmdBroker.qryDadosSDA.UnPrepare;

  if not mProcessos.IsEmpty then
  begin
    lstXML := TStringList.Create;
    lstXML.Clear;
    lstXML.Add('<?xml version="1.0" encoding="UTF-8" ?>');
    lstXML.Add('<GRH>');
    lstXML.Add('    <DESPACHANTE>');
    lstXML.Add('        <DESPACHANTECODIGO>' + RegistroDespachanteRJ+ '</DESPACHANTECODIGO>');
    lstXML.Add('        <DESPACHANTECPF>'    + CPFDespachante + '</DESPACHANTECPF>');
    lstXML.Add('    </DESPACHANTE>');
    lstXML.Add('    <GRHs>');
    try
      mProcessos.First;
      while not mProcessos.eof do
      begin
        log('Processo: ' + mProcessos.FieldByName('NR_PROCESSO').AsString, frmProcessaSDA.logar);

        PreencheXml(mProcessos.FieldByName('TIPO_PESSOA').AsString
                   ,mProcessos.FieldByName('CGC_EMPRESA').AsString
                   ,AnsiReplaceStr(mProcessos.FieldByName('NM_EMPRESA').AsString, '&', 'E')
                   ,mProcessos.FieldByName('END_EMPRESA').AsString
                   ,mProcessos.FieldByName('END_CIDADE').AsString
                   ,mProcessos.FieldByName('END_BAIRRO').AsString
                   ,mProcessos.FieldByName('END_CEP').AsString
                   ,mProcessos.FieldByName('END_UF').AsString
                   ,mProcessos.FieldByName('TIPO_GUIA').AsString
                   ,mProcessos.FieldByName('NR_PROCESSO').AsString
                   ,Copy(mProcessos.FieldByName('NR_PROCESSO').AsString, 5,18)
                   ,mProcessos.FieldByName('NR_CONHECIMENTO').AsString
                   ,mProcessos.FieldByName('REFERENCIA').AsString
                   ,mProcessos.FieldByName('DT_CHEGADA_CARGA').AsString
                   ,mProcessos.FieldByName('DS_VEICULO').AsString
                   ,''
                   ,''
                   ,''
                   ,mProcessos.FieldByName('VL_SDA').AsString
                   ,mProcessos.FieldByName('BANCO').AsString
                   ,mProcessos.FieldByName('VENCIMENTO_RJ').AsString
                   ,lstXML);
        mProcessos.Next;
      end;

      try
        dmdBroker.dbBroker.StartTransaction;
        mProcessos.First;
        while not mProcessos.eof do
        begin
          dmdBroker.AtualizaProcessoSDA(mProcessos.FieldByName('NR_PROCESSO').AsString);
          mProcessos.Next;
        end;
        dmdBroker.dbBroker.Commit;
      except on e : exception do
      begin
        dmdBroker.dbBroker.rollback;
        Log('Erro ao atualizar os processos', frmProcessaSDA.logar);
        abort;
      end;
      end;
    finally
      mProcessos.Close;
      FreeAndNil(mProcessos);
    end;

    lstXML.Add('    </GRHs>');
    lstXML.Add('</GRH>');

    PastaGravarArquivo := frmProcessaSDA.PastaArquivosGerados;

    //vou manter o codigo de santos, porque preciso de 4 caracteres em outras partes do sistema
    strFile:=dmdBroker.FILIAL_RIO +'_' + trim(RegistroDespachante)+'_'+FormatDateTime('YYYYMMDDHHNNSS',Now)+'.xml';
    strPath:=PastaGravarArquivo + strFile;

    lstXML.SaveToFile(strPath);

    result := strPath;
  end
  else
    log('Nenhum processo na fila. ', frmProcessaSDA.logar);
end;

procedure TSDARJ.PreencheXml(vIETIPODOC,vIEDOC,vIENOME,vIEENDERECO,vIECIDADE,vIEBAIRRO,vIECEP,vIEESTADO,
  vGUIATIPO,vGUIAREGISTRO,vGUIADECLARACAO,vGUIACONHECIMENTO,vGUIAREFERENCIA,vGUIACHEGADA,vGUIAVEICULO,
  vGUIALINHA1,vGUIALINHA2,vGUIALINHA3,vGUIAVALOR,vGUIABANCO, vGUIAVENCIMENTO:String; var lstXML : TStringList );
begin
    lstXML.Add('<GRHDETALHES>');
    lstXML.Add('    <IETIPODOC>'        + vIETIPODOC                       +'</IETIPODOC>');
    lstXML.Add('    <IEDOC>'            + vIEDOC                           +'</IEDOC>');
    lstXML.Add('    <IENOME>'           + copy(vIENOME,1,60)               +'</IENOME>');
    lstXML.Add('    <IEENDERECO>'       + copy(vIEENDERECO,1,60)           +'</IEENDERECO>');
    lstXML.Add('    <IECIDADE>'         + copy(vIECIDADE,1,30)             +'</IECIDADE>');
    lstXML.Add('    <IEBAIRRO>'         + copy(vIEBAIRRO,1,30)             +'</IEBAIRRO>');
    lstXML.Add('    <IECEP>'            + copy(vIECEP,1,8)                 +'</IECEP>');
    lstXML.Add('    <IEESTADO>'         + vIEESTADO                        +'</IEESTADO>');
    lstXML.Add('    <GUIATIPO>'         + vGUIATIPO                        +'</GUIATIPO>');
    lstXML.Add('    <GUIAVENCIMENTO>'   + copy(vGUIAVENCIMENTO,1,30)       +'</GUIAVENCIMENTO>');
    lstXML.Add('    <GUIADECLARACAO>'   + copy(vGUIADECLARACAO,1,30)       +'</GUIADECLARACAO>');
    lstXML.Add('    <GUIALINHA1>'+ ID_PROCESSO + copy(vGUIAREGISTRO,1,60)  +'</GUIALINHA1>');
    lstXML.Add('    <GUIALINHA2>'       + copy(vGUIAREFERENCIA,1,60)       +'</GUIALINHA2>');
    lstXML.Add('    <GUIALINHA3>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA3>');
    lstXML.Add('    <GUIALINHA4>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA4>');
    lstXML.Add('    <GUIALINHA5>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA5>');
    lstXML.Add('    <GUIALINHA6>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA6>');
    lstXML.Add('    <GUIALINHA7>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA7>');
    lstXML.Add('    <GUIALINHA8>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA8>');
    lstXML.Add('    <GUIALINHA9>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA9>');
    lstXML.Add('    <GUIALINHA10>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA10>');
    lstXML.Add('    <GUIALINHA11>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA11>');
    lstXML.Add('    <GUIALINHA12>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA12>');
    lstXML.Add('    <GUIALINHA13>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA13>');
    lstXML.Add('    <GUIALINHA14>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA14>');
    lstXML.Add('    <GUIALINHA15>'      + copy(vGUIALINHA3,1,60)           +'</GUIALINHA15>');
    lstXML.Add('    <GUIAVALOR>'        + ReplaceStr(vGUIAVALOR, ',', '.' )+'</GUIAVALOR>');
    lstXML.Add('    <GUIABANCO>'        + vGUIABANCO                       +'</GUIABANCO>');
    lstXML.Add('</GRHDETALHES>');
end;


procedure TSDARJ.MontarArquivos;
var mFila: TFDMemTable;
    ArquivoGerado : String;
begin
  mfila := TFDMemTable.Create(nil);
  dmdBroker.qryFilaDespachante.Close;
  dmdBroker.qryFilaDespachante.Prepare;
  dmdBroker.qryFilaDespachante.Open;
  dmdBroker.qryFilaDespachante.FetchAll;
  mFila.Data := dmdBroker.qryFilaDespachante.Data;
  dmdBroker.qryFilaDespachante.close;
  dmdBroker.qryFilaDespachante.UnPrepare;

  try
    mFila.First;
    while not mFila.eof do
    begin
      ArquivoGerado := GerarArquivosXML(mfila.FieldByName('CD_DESPACHANTE').AsString,
                         mfila.FieldByName('NR_REGISTRO').AsString,
                         mfila.FieldByName('NR_REGISTRO_RJ').AsString,
                         mfila.FieldByName('CPF_DESPACHANTE').AsString);
      if ArquivoGerado <> '' then
        log('Arquivo gerado: '+ArquivoGerado, frmProcessaSDA.logar);

      mFila.Next;
    end;
    if mFila.IsEmpty then
      log('Fila vazia.', frmProcessaSDA.logar);
  finally
    mFila.Close;
    FreeAndNil(mfila);
  end;
end;

end.
