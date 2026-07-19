unit uSDASantos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  System.Masks, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  Navigator.WebBrowser, Navigator.Utils, ShellAPI, MSHTML, SHDocVw, System.StrUtils, Vcl.ComCtrls;

  type TSDASantos = Class

  private
  Var
    wb: TNavigatorWebBrowser;
    wb_boleto: TNavigatorWebBrowser;
    tmrSalvar: TTimer;
    tmrSelecionaArquivo: TTimer;
    tmrImprimir: TTimer;
    User, Password : String;
    ArquivoAtual : String;
  Const
    ENDERECO = 'http://sindicato.sdas.org.br/despachante/index.php';

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

constructor TSDASantos.Create;
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

destructor TSDASantos.Destroy;
begin
  FreeAndNil(wb);
  FreeAndNil(wb_boleto);
  FreeAndNil(tmrSalvar);
  inherited;
end;

procedure TSDASantos.Transmitir(Usuario, Senha , Arquivo: String );
begin
  User     := Usuario;
  Password := Senha;
  ArquivoAtual :=  Arquivo;
  wb.WebBrowser.OnDocumentComplete := onDocumentCompletedTransmiteSDA;
  wb.RedimencionarBrowser;
  wb.Navegate(ENDERECO);
end;

procedure TSDASantos.Consultar(Usuario, Senha, Arquivo : String );
begin
  User := Usuario;
  Password := Senha;
  ArquivoAtual :=  Arquivo;
  wb.WebBrowser.OnDocumentComplete := onDocumentCompleteConsultarGuias;
  wb.RedimencionarBrowser;
  wb.Navegate(ENDERECO);
end;

procedure TSDASantos.onDocumentCompletedTransmiteSDA(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  TransmiteSDA;
end;

procedure TSDASantos.TransmiteSDA;
var nm_arquivo, sTabela, URL, URL_Completo , IndiceTabela: string;
x :integer;
begin
  try
    URL          := wb.GetPageName;
    URL_Completo := wb.GetPageNameComplete;

    if URL = 'index.php' then
    begin
      sleep(1000);
      wb.ExecuteScript('document.getElementById("usuario").value = "'+User+'"');
      wb.ExecuteScript('document.getElementById("senha").value   = "'+Password+'"');
      wb.ClicarBotaoPorTag('button', 'Entrar');
    end
    else
    if URL = 'consulta_guias.php' then
    begin
      sleep(1000);
      wb.ClicarBotaoPorTag('a', 'Integração');
    end
    else
    if URL_Completo = 'https://sindicato.sdas.org.br//despachante/integracao.php' then
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
    if (URL_Completo = 'https://sindicato.sdas.org.br//despachante/integracao.php?controle=.') or
       (URL_Completo = 'https://sindicato.sdas.org.br//despachante/integracao.php?controle=Validar') then
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

      sleep(1000);
      if sTabela <> '' then
        ClicarEmTransferirArquivo(ArquivoAtual, IndiceTabela);
      log('Arquivo Transmitido ' + ArquivoAtual, frmProcessaSDA.logar);
      sleep(1000);
//      wb.ClicarBotaoPorTag('button', 'Sair');
      wb.ClicarBotaoPorTag('a', 'Sair');
      wb.Finish;
    end;
  except on e:exception do
    log(e.Message, frmProcessaSDA.logar);
  end;
end;

procedure TSDASantos.onDocumentCompleteConsultarGuias(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  ConsultarGuias ;
end;

procedure TSDASantos.ConsultarGuias;
var  URL, URL_Completo , IndiceTabela: string;
ListaLinks : TStringList;
begin
  try
    try
      URL          := wb.GetPageName;
      URL_Completo := wb.GetPageNameComplete;
      ListaLinks   := TStringList.Create();

      if URL = 'index.php' then
      begin
        sleep(2000);
        wb.ExecuteScript('document.getElementById("usuario").value = "'+User+'"');
        wb.ExecuteScript('document.getElementById("senha").value   = "'+Password+'"');
        wb.ClicarBotaoPorTag('button', 'Entrar');
      end
      else
      if URL = 'consulta_guias.php' then
      begin
        sleep(2000);
        BuscarValorPagina(wb, 'table','Nº Guia', 'innertext',IndiceTabela);
        PegarLinksImpressao('Lançada ', IndiceTabela ,ListaLinks);

        NavegarParaImpressaoBoleto(ListaLinks);

        MoveFile(PChar(frmProcessaSDA.PastaArquivosTransmitidos + ArquivoAtual),
                 PChar(frmProcessaSDA.PastaArquivosProcessados  + ArquivoAtual));

        wb.ClicarBotaoPorTag('button', 'Sair');
        wb.Finish;
      end;
    except on e:exception do
      log(e.Message, frmProcessaSDA.logar);
    end;
  finally
    ListaLinks.Free;
  end;
end;

procedure TSDASantos.NavegarParaImpressaoBoleto(var lista : TStringList);
var i : integer;
begin
  for I := 0 to lista.Count -1 do
  begin
    sleep(2000);
    wb_boleto := TNavigatorWebBrowser.Create;
    wb_boleto.RedimencionarBrowser;
    wb_boleto.WebBrowser.OnDocumentComplete := onDocumentCompletedImprimeBoleto;
    wb_boleto.Navegate(lista[i]);
  end;
end;

procedure TSDASantos.onDocumentCompletedImprimeBoleto(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
begin
  ImprimirBoleto;
end;

procedure TSDASantos.ImprimirBoleto;
var URL, URL_Completo : string;
statusPagina : integer;
vIn, vOut: OleVariant;
begin
  URL          := wb_boleto.GetPageName;
  URL_Completo := wb_boleto.GetPageNameComplete;

  sleep(1000);
  statusPagina := wb_boleto.WebBrowser.ReadyState;

  if statusPagina in [3,4] then
  begin
    {imprimir}
    tmrImprimir.Enabled := true;
    tmrSalvar.Enabled   := true;
    wb_boleto.WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
    {imprimir}
  end;
end;

function TSDASantos.BuscarNrProcessoBoleto : string;
var x : integer;   RegistroNrProcesso, indice, nr_processo : string;
begin
  x := 0;
  repeat
    RegistroNrProcesso := BuscarValorPagina(wb_boleto, 'td','Registro:','textContent', indice);
    inc(x);
    sleep(1000)
  until AnsiContainsText(RegistroNrProcesso, 'Registro') or (x = 2);
  nr_processo := Copy(RegistroNrProcesso, pos('Registro:', RegistroNrProcesso) + length('Registro:'),18);
  result := trim(AnsiReplaceStr(nr_processo, #$A, ''));
end;

procedure TSDASantos.PegarLinksImpressao(Descricao :String; IndiceTabela : String; var Lista : TStringList);
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
     'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("td").length;');

     if qtNomes = '' then qtNomes := '0';

     for x := 0 to strtoint(qtNomes) -1 do
     begin
       mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
      'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("td")['+inttostr(x)+'].innerText;');

       //verifica se a linha é = Lançada
       if Uppercase(Trim(mensagem)) = Uppercase(Trim(Descricao)) then
       begin
         qtLinks := wb.GetValueInDocument('qtLinks',
         'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("a").length;');
         if qtLinks = '' then  qtLinks := '0';

         for j := 0 to strtoint(qtLinks) -1 do
         begin
            mensagem := wb.GetValueInDocument('mymsg'+inttostr(i),
           'document.getElementsByTagName("table")['+IndiceTabela+'].getElementsByTagName("tr")['+inttostr(i)+'].getElementsByTagName("a")['+inttostr(j)+'].href;');
           //verifica se é o botão de transferencia
           if AnsiContainsText(mensagem, 'boleto_bb' )then  // if AnsiContainsText(mensagem, 'boleto_visualiza') then
           begin
             Lista.Add(mensagem);
             break;
           end;
         end;
       end;
     end;
  end;
end;

procedure TSDASantos.ClicarEmTransferirArquivo(Arquivo, IndiceTabela : String);
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
       if Uppercase(Trim(mensagem)) = Uppercase(Trim(Arquivo)) then
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

function TSDASantos.BuscarValorPagina(browser :TNavigatorWebBrowser; stag, sDescricao, tipo : String; var indiceComponente : String) :string;
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

procedure TSDASantos.tmrSalvarTimer(Sender: TObject);
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

      wb_boleto.Finish;
      tmrImprimir.Enabled := false;
      tmrSalvar.Enabled   := false;
    except on E:Exception do
    begin
      Log('Timer Salvar - ' + E.Message, frmProcessaSDA.Logar);
    end;
    end;
  end
  else
     tmrSalvar.Enabled := true;
end;

procedure TSDASantos.tmrImprimirTimer(Sender: TObject);
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

procedure TSDASantos.tmrSelecionaArquivoTimer(Sender: TObject);
begin
  SelecionaArquivo(frmProcessaSDA.PastaArquivosGerados + ArquivoAtual);
end;

procedure TSDASantos.SelecionaArquivo(const arquivo : String);
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

function TSDASantos.GerarArquivosXML(CodDespachante, RegistroDespachante, RegistroDespachanteRJ, CPFDespachante : String) : String;
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
  dmdBroker.qryDadosSDA.ParamByName('CD_UNID_NEG').AsString    := dmdBroker.FILIAL_SANTOS;
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

    lstXML.Add('<?xml version="1.0" encoding="iso-8859-1" ?>');
    lstXML.Add('<GRH>');
    lstXML.Add('    <DESPACHANTE>');
    lstXML.Add('        <DESPACHANTECODIGO>' + RegistroDespachante+ '</DESPACHANTECODIGO>');
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
                   ,mProcessos.FieldByName('NR_DECLARACAO').AsString
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
      mProcessos.free;
      mProcessos := nil;
    end;

    lstXML.Add('    </GRHs>');
    lstXML.Add('</GRH>');

    PastaGravarArquivo := FrmProcessaSDA.PastaArquivosGerados;

    //vou manter o codigo de santos, porque preciso de 4 caracteres em outras partes do sistema
    strFile:=dmdBroker.FILIAL_SANTOS+'_' + trim(RegistroDespachante)+'_'+FormatDateTime('YYYYMMDDHHNNSS',Now)+'.xml';
    strPath:=PastaGravarArquivo + strFile;

    lstXML.SaveToFile(strPath);

    result := strPath;
  end
  else
    log('Nenhum processo na fila. ', frmProcessaSDA.logar);
end;

procedure TSDASantos.PreencheXml(vIETIPODOC,vIEDOC,vIENOME,vIEENDERECO,vIECIDADE,vIEBAIRRO,vIECEP,vIEESTADO,
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
  lstXML.Add('    <GUIAREGISTRO>'     + copy(vGUIAREGISTRO,1,30)         +'</GUIAREGISTRO>');
  lstXML.Add('    <GUIADECLARACAO>'   + copy(vGUIADECLARACAO,1,30)       +'</GUIADECLARACAO>');
  lstXML.Add('    <GUIACONHECIMENTO>' + copy(vGUIACONHECIMENTO,1,30)     +'</GUIACONHECIMENTO>');
  lstXML.Add('    <GUIAREFERENCIA>'   + copy(vGUIAREFERENCIA,1,30)       +'</GUIAREFERENCIA>');
  lstXML.Add('    <GUIACHEGADA>'      + copy(vGUIACHEGADA,1,30)          +'</GUIACHEGADA>');
  lstXML.Add('    <GUIAVEICULO>'      + copy(vGUIAVEICULO,1,30)          +'</GUIAVEICULO>');
  lstXML.Add('    <GUIALINHA1>'       + copy(vGUIALINHA1,1,60)           +'</GUIALINHA1>');
  lstXML.Add('    <GUIALINHA2>'       + copy(vGUIALINHA2,1,60)           +'</GUIALINHA2>');
  lstXML.Add('    <GUIALINHA3>'       + copy(vGUIALINHA3,1,60)           +'</GUIALINHA3>');
  lstXML.Add('    <GUIAVALOR>'        + ReplaceStr(vGUIAVALOR, ',', '.') +'</GUIAVALOR>');
  lstXML.Add('    <GUIABANCO>'        + vGUIABANCO                       +'</GUIABANCO>');
  lstXML.Add('</GRHDETALHES>');
end;

procedure TSDASantos.MontarArquivos;
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
    mfila.free;
    mfila := nil;
  end;
end;

end.
