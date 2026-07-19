unit uMyIndaiaNovo.due.ConsultaNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, System.StrUtils, System.SysUtils,
  uCEFChromium, uCEFWindowParent, uCEFInterfaces, uCEFApplication, uCEFTypes,
  uCEFConstants, Vcl.AppEvnts, Vcl.Menus, Vcl.Clipbrd, Registry,
  System.Generics.Collections, MyEntitiesBroker, XData.Client,
  FireDac.dapt,
  Aurelius.Sql.MSSQL,
  Aurelius.Engine.DatabaseManager,
  Aurelius.Engine.ObjectManager,
  Aurelius.Drivers.FireDac,
  Aurelius.Drivers.Interfaces, Data.DB, Aurelius.Bind.Dataset,
  Aurelius.Criteria.Linq,
  Utils, uMiniBrowser;


type

  TInfoMercadoria = Record
    CdDestaque: String;
    CdNCM: String;
  end;


  TConsultaNfe = Class
    Constructor Create;
    procedure Chromium_OnLoadEnd(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      httpStatusCode: Integer);
//    procedure Chromium_OnConsoleMessage(Sender: TObject;
//      const browser: ICefBrowser; const message, source: ustring; line: Integer;
//      out Result: Boolean);
    procedure Chromium_OnConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; level: TCefLogSeverity; const message, source: ustring; line: Integer; out Result: Boolean);

  private
    Processo: TTProcesso;
    ProcessoExpNfItemList: TList<TTprocessoExpNfItem>;
    ProcessoExpNfItem: TTprocessoExpNfItem;
    ProcessoExpNf: TTprocessoExpNf;
    FConsultaCancelada: Boolean;
    QtdeTotalItens: Integer;
    CountTableItems: Integer;
    InfoMercadoria: TInfoMercadoria;
    procedure GetInfNFe(browser: ICefBrowser);
    procedure GetInfNFeItens(browser: ICefBrowser);
    procedure GetInf(browser: ICefBrowser);
  public
    ChaveAcesso: String;
    NrProcesso: String;
    ServerName: String;
    Inclusao: Boolean;
  End;

var
  ConsultaNfe: TConsultaNfe;

implementation

uses
  System.UITypes, Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Aurelius.Criteria.Base;

{ TConsultaNfe }

procedure TConsultaNfe.Chromium_OnLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
var
  Script: String;
  i:Integer;
begin

  if ContainsText(MiniBrowserFrm.Chromium1.Browser.MainFrame.url, 'about:blank') then
  begin
    MiniBrowserFrm.Chromium1.Browser.MainFrame.LoadUrl('http://www.nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx?tipoConsulta=resumo&tipoConteudo=7PhJ+gAVw2g=');
  end
  else if ContainsText(browser.MainFrame.url,
                  'http://www.nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx?tipoConsulta=resumo&tipoConteudo=7PhJ+gAVw2g=') then
  begin
    sleep(5000);
    browser.MainFrame.ExecuteJavaScript('document.querySelector("#ctl00_ContentPlaceHolder1_txtChaveAcessoResumo").value ="'+ ChaveAcesso +'"; ', 'about:blank', 0);
  end
  else
  if ContainsText(browser.MainFrame.url,
                  'http://www.nfe.fazenda.gov.br/portal/consultaResumo.aspx?tipoConteudo=7PhJ+gAVw2g=') then
  begin
    browser.MainFrame.ExecuteJavaScript('var vCount = $("#Prod > fieldset > div")[0].childElementCount;' + //contagem dos itens
                                        'console.log("CountTableItems|" + vCount)', 'about:blank', 0);

  end;

end;

procedure TConsultaNfe.GetInfNFe(browser: ICefBrowser);
begin
  browser.MainFrame.ExecuteJavaScript('var vNrNf = $("#conteudoDinamico > div:nth-child(3) > div.GeralXslt > fieldset > table > tbody > tr > td.fixo-nro-serie > span")[0].innerText;'+ //NrNf
                                      'console.log("NrNf|" + vNrNf);'+
                                      'var vDataNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(4) > span")[0].innerText;'+ //DataNf
                                      'console.log("DataNf|" + vDataNf);'+
                                      'var vValorNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(6) > span")[0].innerText;'+ //ValorNf
                                      'console.log("ValorNf|" + vValorNf);'+
                                      'var vSerieNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(2) > span")[0].innerText;'+ //SerieNf
                                      'console.log("SerieNf|" + vSerieNf);'+
                                      'var vValorTotalProdutos = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(3) > td:nth-child(4) > span")[0].innerText;'+ //ValorTotalProdutos
                                      'console.log("ValorTotalProdutos|" + vValorTotalProdutos);'
//                                      'var vValorFrete = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(1) > span")[0].innerText;'+ //ValorFrete
//                                      'console.log("ValorFrete|" + vValorFrete);'+
//                                      'var vValorSeguro = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(2) > span")[0].innerText;'+ //ValorSeguro
//                                      'console.log("ValorSeguro|" + vValorSeguro);'+
//                                      'var vValorTotalDescontos = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(3) > span")[0].innerText;'+ //ValorTotalDescontos
//                                      'console.log("ValorTotalDescontos|" + vValorTotalDescontos);'+
//                                      'var vValorOutrasDespesas = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(6) > td:nth-child(1) > span")[0].innerText;'+ //ValorOutrasDespesas
//                                      'console.log("ValorOutrasDespesas|" + vValorOutrasDespesas);'
                                      ,'about:blank', 0);
end;

procedure TConsultaNfe.GetInfNFeItens(browser: ICefBrowser);
var
  i: Integer;
begin

//  browser.MainFrame.ExecuteJavaScript('var vNrNf = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr.col-4 > td:nth-child(2) > span")[0].innerText;'+ //NrNf
//                                      'console.log("NrNf|" + vNrNf);'+
//                                      'var vDataNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(4) > span")[0].innerText;'+ //DataNf
//                                      'console.log("DataNf|" + vDataNf);'+
//                                      'var vValorNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(6) > span")[0].innerText;'+ //ValorNf
//                                      'console.log("ValorNf|" + vValorNf);'+
//                                      'var vSerieNf = $("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(2) > span")[0].innerText;'+ //SerieNf
//                                      'console.log("SerieNf|" + vSerieNf);'+
//                                      'var vValorTotalProdutos = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(3) > td:nth-child(4) > span")[0].innerText;'+ //ValorTotalProdutos
//                                      'console.log("ValorTotalProdutos|" + vValorTotalProdutos);'
////                                      'var vValorFrete = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(1) > span")[0].innerText;'+ //ValorFrete
////                                      'console.log("ValorFrete|" + vValorFrete);'+
////                                      'var vValorSeguro = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(2) > span")[0].innerText;'+ //ValorSeguro
////                                      'console.log("ValorSeguro|" + vValorSeguro);'+
////                                      'var vValorTotalDescontos = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(4) > td:nth-child(3) > span")[0].innerText;'+ //ValorTotalDescontos
////                                      'console.log("ValorTotalDescontos|" + vValorTotalDescontos);'+
////                                      'var vValorOutrasDespesas = $("#Totais > fieldset > fieldset > table > tbody > tr:nth-child(6) > td:nth-child(1) > span")[0].innerText;'+ //ValorOutrasDespesas
////                                      'console.log("ValorOutrasDespesas|" + vValorOutrasDespesas);'
//                                      ,'about:blank', 0);

  QtdeTotalItens := 0;

  for I := 2 to CountTableItems do
  begin
    if (i mod 2) = 0 then
    begin
      QtdeTotalItens := QtdeTotalItens + 1;
      browser.MainFrame.ExecuteJavaScript('var vOrderItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td.fixo-prod-serv-numero > span")[0].innerText;'+ //número item nf
                                          'console.log("OrdemItem|" + vOrderItem);'+
                                          'var vDescricaoItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td.fixo-prod-serv-descricao > span")[0].innerText;'+ //DESCRIÇÃO
                                          'console.log("DescricaoItem|" + vDescricaoItem);'+
                                          'var vValorItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td.fixo-prod-serv-vb > span")[0].innerText;'+ //ValorItem
                                          'console.log("ValorItem|" + vValorItem);'
                                          ,'about:blank', 0);
    end
    else
    begin
      browser.MainFrame.ExecuteJavaScript('var vCodigoItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr.col-4 > td:nth-child(1) > span")[0].innerHTML;'+//CodigoMercadoria
                                          'console.log("CodigoItem|" + vCodigoItem);'+
                                          'var vUnidadeTributavelItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(3) > tbody > tr:nth-child(3) > td:nth-child(2) > span")[0].innerText;' + //Unidade tributável(un. estatística)
                                          'console.log("UnidadeTributavelItem|" + vUnidadeTributavelItem);'+
                                          'var vQuantidadeTributavelItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(3) > tbody > tr:nth-child(3) > td:nth-child(3) > span")[0].innerText;'+ //QuantidadeTributável
                                          'console.log("QuantidadeTributavelItem|" + vQuantidadeTributavelItem);'+
                                          'var vValorOutrasDespItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr:nth-child(3) > td:nth-child(3) > span")[0].innerText;'+ //ValorItem
                                          'console.log("ValorOutrasDespItem|" + vValorOutrasDespItem);'+
                                          'var vValorDescontoItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr:nth-child(4) > td:nth-child(1) > span")[0].innerText;'+ //ValorDescontoItem
                                          'console.log("ValorDescontoItem|" + vValorDescontoItem);'+
                                          'var vValorTotalFreteItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr:nth-child(4) > td:nth-child(2) > span")[0].innerText;'+ //ValorTotalFreteItem
                                          'console.log("ValorTotalFreteItem|" + vValorTotalFreteItem);'+
                                          'var vValorSeguroItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr:nth-child(4) > td:nth-child(3) > span")[0].innerText;'+ //ValorSeguroItem
                                          'console.log("ValorSeguroItem|" + vValorSeguroItem);'+
                                          'var vQuantidadeComercialItem = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(3) > tbody > tr.col-3 > td:nth-child(3) > span")[0].innerText;'+ //QuantidadeComercialItem
                                          'console.log("QuantidadeComercialItem|" + vQuantidadeComercialItem);'+
                                          'var vUnidadeComercialItem = $("#Prod > fieldset > div > table:nth-child(3) > tbody > tr > td > table:nth-child(3) > tbody > tr.col-3 > td:nth-child(2) > span")[0].innerText;'+ //UnidadeComercialItem
                                          'console.log("UnidadeComercialItem|" + vUnidadeComercialItem);'+
                                          'var vNCM = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr.col-4 > td:nth-child(2) > span")[0].innerText;'+ //NCM
                                          'console.log("NCM|" + vNCM);'
                                          , 'about:blank', 0);

    end;
  end;
end;

//procedure TConsultaNfe.Chromium_OnConsoleMessage(Sender: TObject;
//  const browser: ICefBrowser; const message, source: ustring; line: Integer;
//  out Result: Boolean);
procedure TConsultaNfe.Chromium_OnConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: TCefLogSeverity; const message, source: ustring; line: Integer; out Result: Boolean);
var
  Chave: string;
  Valor: string;
  TextConsole: String;
  CodProduto: String;
  Criteria: TCriteria<TTprocessoExpNf>;
  Ncm: TTNcm;
  DestaqueNCM: TTncmExpDestaque;
  TMercadoriaExp: TTmercadoriaExp;
  CriteriaMercExp: TCriteria<TTmercadoriaExp>;
  Statement: IDBStatement;
  ResultSet: IDBResultSet;
  vSelectProcExpItem: string;
  Params: TObjectList<TDBParam>;
  vNmMercadoria: WideString;
  vEnquadramento: string;
  NcmAtributo: TObjectList<TTncmExpAtributo>;
  NfItemNcmAtributo: TTprocessoExpNfItemNcmAtributo;
  p: integer;
begin
  //Inteceptar as mensagens de log no console

  if FConsultaCancelada then
    Exit;

  if AnsiContainsText(message, '|') then
  begin
    Chave := TokenN(message, 1);
    Valor := TokenN(message, 2);


    if Chave.Equals('NrNf') then
    begin

      Criteria := Manager.Find<TTprocessoExpNf>.add(Linq.Eq('NrProcesso', NrProcesso))
                                               .add(Linq.Eq('ChaveNota', ChaveAcesso));
      ProcessoExpNf := Criteria.UniqueResult;

      Inclusao := not Assigned(ProcessoExpNf);
      if Inclusao then
      begin
        ProcessoExpNf := TTprocessoExpNf.Create;
        ProcessoExpNf.NrProcesso := NrProcesso;
        ProcessoExpNf.ChaveNota := ChaveAcesso;
        ProcessoExpNf.NrNf := Valor;
      end;
      if StrToIntDef(ProcessoExpNf.NrNf, 0) <> StrToIntDef(Valor, 0) then
        if MessageDlg('NÚMERO DA NOTA FISCAL CADASTRADA NO SISTEMA DIFERENTE DA NOTA FISCAL NO SEFAZ: ' + #13#10 +
                      'Número NF no sistema: ' + ProcessoExpNf.NrNf  + #13#10 +
                      'Número NF no Sefaz: ' + Valor  + #13#10 +
                      'Deseja continuar, mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          FConsultaCancelada := true;
          MiniBrowserFrm.Close;
        end;

      if ProcessoExpNf.ProcessoExpNfItem.Count > 0 then
      begin
        ShowMessage('Já existe itens para a NF ' + ProcessoExpNf.NrNf);
        FConsultaCancelada := true;
        MiniBrowserFrm.Close;
      end;
    end
    else if Chave.Equals('DataNf') then
      ProcessoExpNf.DtNota := StrToDateTime(Valor)
    else if Chave.Equals('ValorNf') then
      ProcessoExpNf.VlNota := RetDouble(Valor)
    else if Chave.Equals('SerieNf') then
      ProcessoExpNf.NfSerie := Valor
    else if Chave.Equals('ValorTotalProdutos') then
    begin
      ProcessoExpNf.VlTotalProdutos := RetDouble(Valor);
////    else if Chave.Equals('ValorFrete') then
////      ProcessoExpNf.VlFrete := RetDouble(Valor)
////    else if Chave.Equals('ValorSeguro') then
////      ProcessoExpNf.VlSeguro := RetDouble(Valor)
////    else if Chave.Equals('ValorTotalDescontos') then
////      ProcessoExpNf.VlTotalDescontos := RetDouble(Valor)
////    else if Chave.Equals('ValorOutrasDespesas') then
//    begin
//      ProcessoExpNf.VlOutrasDespesas := RetDouble(Valor);
      if Inclusao then
        Manager.Save(ProcessoExpNf)
      else
        Manager.Flush(ProcessoExpNf);
    end;

    if Chave.Equals('OrdemItem') then
    begin
      ProcessoExpNfItem := TTprocessoExpNfItem.Create;
      ProcessoExpNfItem.ProcessoExpNf := ProcessoExpNf;
      ProcessoExpNfItem.NrItem := CompletaComZero(3 - Length(Valor)) + Valor;
      ProcessoExpNfItem.NrItemNf := StrToInt(Valor);

      if not Assigned(Processo)  then
        Processo := Manager.Find<TTProcesso>(NrProcesso);
    end
    else if Chave.Equals('DescricaoItem') then
      ProcessoExpNfItem.ApMercadoria := Copy(Valor, 0, 199)
    else if Chave.Equals('CodigoItem') then
    begin
      vSelectProcExpItem := 'SELECT CD_MERCADORIA, NM_MERCADORIA, RTRIM(LTRIM(CD_NCM_SH)) AS CD_NCM_SH, ISNULL(CD_SULF_NCM, 0) AS CD_DESTAQUE,' +
                            'REPLACE(LTRIM(REPLACE(ISNULL(CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') AS CD_MERCADORIA_SEM_ZEROS '+
                            'FROM TMERCADORIA_EXP '+
                            'WHERE '+
                            'REPLACE(LTRIM(REPLACE(ISNULL(CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') = '+
                            'REPLACE(LTRIM(REPLACE(ISNULL(:CdMercadoria, ''''),''0'','' '')),'' '',''0'') AND '+
                            'CD_GRUPO = :CdGrupo ';

      Params := TObjectList<TDBParam>.Create;
      try
        Statement := Manager.Connection.CreateStatement;
        Params.Add(TDBParam.Create('CdMercadoria', ftString, Valor));
        Params.Add(TDBParam.Create('CdGrupo', ftString, Processo.CdGrupo));
        Statement.SetSQLCommand(vSelectProcExpItem);
        Statement.SetParams(Params);
        ResultSet := Statement.ExecuteQuery;
      finally
        Params.Free;
      end;

      if ResultSet.GetFieldValue('CD_MERCADORIA') <> Null then
      begin
        if (Processo.CdGrupo = '155') or
           (Processo.CdGrupo = '028') or
           (Processo.CdGrupo = '986') then
        begin
          if ResultSet.GetFieldValue('NM_MERCADORIA') <> Null then
            vNmMercadoria := ResultSet.GetFieldValue('NM_MERCADORIA')
        end
        else
          vNmMercadoria := '';

        ProcessoExpNfItem.CdMercadoria := ResultSet.GetFieldValue('CD_MERCADORIA');
        ProcessoExpNfItem.NmMercadoria := ProcessoExpNfItem.CdMercadoria + ' | ' + vNmMercadoria;
        InfoMercadoria.CdNCM := ResultSet.GetFieldValue('CD_NCM_SH');
        if (StrToInt(ResultSet.GetFieldValue('CD_DESTAQUE')) <> 0) then
          InfoMercadoria.CdDestaque := ResultSet.GetFieldValue('CD_DESTAQUE');
      end
      else
      begin
        ProcessoExpNfItem.CdMercadoria := Valor;
        ProcessoExpNfItem.NmMercadoria := Valor + ' | ';
        InfoMercadoria.CdNCM := '';
        InfoMercadoria.CdDestaque := '';
      end;
    end
    else if Chave.Equals('UnidadeTributavelItem') then
      ProcessoExpNfItem.UnTributavel := Valor
    else if Chave.Equals('QuantidadeTributavelItem') then
    begin
      ProcessoExpNfItem.QtTributavel := RetDouble(Valor);
    end
    else if Chave.Equals('ValorItem') then
      ProcessoExpNfItem.VlItem := RetDouble(Valor)
    else if Chave.Equals('ValorOutrasDespItem') then
      ProcessoExpNfItem.VlOutrasDesp := RetDouble(Valor)
    else if Chave.Equals('ValorDescontoItem') then
      ProcessoExpNfItem.VlDesconto := RetDouble(Valor)
    else if Chave.Equals('ValorTotalFreteItem') then
      ProcessoExpNfItem.VlTotalFrete := RetDouble(Valor)
    else if Chave.Equals('ValorSeguroItem') then
      ProcessoExpNfItem.VlSeguro := RetDouble(Valor)
    else if Chave.Equals('QuantidadeComercialItem') then
      ProcessoExpNfItem.QtComercial := RetDouble(Valor)
    else if Chave.Equals('UnidadeComercialItem') then
      ProcessoExpNfItem.UnComercial := Valor
    else if Chave.Equals('NCM') then
    begin
      Ncm := Manager.Find<TTNcm>(Valor);
      if Assigned(Ncm) then
        ProcessoExpNfItem.Ncm := Ncm;

      {Verifica se existe Atributo obrigatório para o NCM}
      NcmAtributo := Manager.Find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', Ncm.Codigo))
                                                          .add(Linq.Eq('InObrigatorio', true))
                                                          .OrderBy('cdAtributo')
                                                          .List;
      if NcmAtributo.Count > 0 then
      begin
        for p := 0 to NcmAtributo.Count - 1 do
        begin
          NfItemNcmAtributo := TTprocessoExpNfItemNcmAtributo.Create;
          NfItemNcmAtributo.NrProcesso := ProcessoExpNf.NrProcesso;
          NfItemNcmAtributo.NrNf := ProcessoExpNf.NrNf;
          NfItemNcmAtributo.NrItem := ProcessoExpNfItem.NrItem;
          NfItemNcmAtributo.CdNcm := Ncm.Codigo;
          NfItemNcmAtributo.CdAtributo := NcmAtributo.Items[p].CdAtributo;
          Manager.Save(NfItemNcmAtributo);
          ProcessoExpNfItem.NmSituacaoNcmAtributo := 'Preenchimento obrigatório';
        end;
      end
      else
        ProcessoExpNfItem.NmSituacaoNcmAtributo := 'Não obrigatório';

//      if ((InfoMercadoria.CdDestaque <> '') and (InfoMercadoria.CdNCM = Ncm.Codigo)) then
//      begin
//        DestaqueNCM := Manager.Find<TTncmExpDestaque>.add(Linq.eq('CdDominio',  InfoMercadoria.CdDestaque))
//                                                     .add(Linq.eq('CdAtributo',  ncm.CdAtributo))
//                                                     .UniqueResult;
//
//        if Assigned(DestaqueNCM) then
//            ProcessoExpNfItem.CdNcmDestaqueDominio := DestaqueNCM.CdDominio;
//      end;

      Manager.Save(ProcessoExpNfItem);
      Initialize(InfoMercadoria);

      if ProcessoExpNfItem.NrItem.ToInteger = QtdeTotalItens then
        MiniBrowserFrm.Close;
    end;

    if Chave.Equals('CountTableItems') then
    begin
      Screen.Cursor := crHourglass;
      CountTableItems := Valor.ToInteger;
      GetInf(browser);
    end;

  end;
end;

procedure TConsultaNfe.GetInf(browser: ICefBrowser);
begin
    GetInfNFe(browser);
    GetInfNFeItens(browser);
end;


constructor TConsultaNfe.Create;
begin
  MiniBrowserFrm := TMiniBrowserFrm.Create(application);
  MiniBrowserFrm.Chromium1.OnLoadEnd := Chromium_OnLoadEnd;
  MiniBrowserFrm.Chromium1.OnConsoleMessage := Chromium_OnConsoleMessage;
end;

end.
