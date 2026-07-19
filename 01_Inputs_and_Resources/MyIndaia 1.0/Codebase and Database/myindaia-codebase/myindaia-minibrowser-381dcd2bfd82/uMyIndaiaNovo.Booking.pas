unit uMyIndaiaNovo.Booking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, System.StrUtils, System.SysUtils,
  uCEFChromium, uCEFWindowParent, uCEFInterfaces, uCEFApplication, uCEFTypes,
  uCEFConstants, Vcl.AppEvnts, Vcl.Menus, Vcl.Clipbrd, Vcl.ExtCtrls, Registry,
  System.Generics.Collections, MyEntitiesBroker, XData.Client,
  FireDac.dapt,
  Aurelius.Sql.MSSQL,
  Aurelius.Engine.DatabaseManager,
  Aurelius.Engine.ObjectManager,
  Aurelius.Drivers.FireDac,
  Aurelius.Drivers.Interfaces, Data.DB, Aurelius.Bind.Dataset,
  Aurelius.Criteria.Linq,
  Utils, uMiniBrowser,
  ConnectionModule;

type

  TBooking = Class
    Constructor Create;
    procedure Chromium_OnLoadEnd(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      httpStatusCode: Integer);
    procedure Chromium_OnConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; level: TCefLogSeverity; const message, source: ustring; line: Integer; out Result: Boolean);
    procedure OnTimerBooking(Sender: TObject);

  private
    function GetScriptBooking: String;
    procedure SetRefCliente(value: String);
    procedure Processa;
  public
    NrProcesso: String;
    Timer: TTimer;
  End;

var
  Booking: TBooking;
  browserAux: ICefBrowser;

implementation

uses
  System.UITypes, Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Aurelius.Criteria.Base;

{ TBooking }

constructor TBooking.Create;
begin
  MiniBrowserFrm := TMiniBrowserFrm.Create(application);
  MiniBrowserFrm.Chromium1.OnLoadEnd := Chromium_OnLoadEnd;
  MiniBrowserFrm.Chromium1.OnConsoleMessage := Chromium_OnConsoleMessage;
  MiniBrowserFrm.TimerAuxiliar.OnTimer := OnTimerBooking;
end;

procedure TBooking.OnTimerBooking(Sender: TObject);
begin
  MiniBrowserFrm.Chromium1.Browser.MainFrame.ExecuteJavaScript('var vRefInttra = document.querySelector("body > app-root > div > div > div > app-booking-state-success >' +
                                                       'div.container.pl-0.pr-0.mt-3 > table > tbody > tr > td:nth-child(1) > a").innerText;'+
                                      'console.log("RefInttra|" + vRefInttra);'
  , 'about:blank', 0);
end;

procedure TBooking.Chromium_OnConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; level: TCefLogSeverity; const message,
  source: ustring; line: Integer; out Result: Boolean);
var
  Chave: string;
  Valor: string;
  RefInttra: string;
begin
  if AnsiContainsText(message, '|') then
  begin
    MiniBrowserFrm.TimerAuxiliar.Enabled := false;
    Chave := TokenN(message, 1);
    Valor := TokenN(message, 2);

    if Chave.Equals('RefInttra') and not Valor.IsEmpty then
    begin
      SetRefCliente(Valor);
    end;
  end;
end;

procedure TBooking.Chromium_OnLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  processa;
end;

procedure TBooking.Processa;
var
  Script: String;
begin

  if ContainsText(MiniBrowserFrm.Chromium1.Browser.MainFrame.url, 'about:blank') then
  begin
    MiniBrowserFrm.Chromium1.Browser.MainFrame.LoadUrl('https://login.inttra.com/');
  end
  else if ContainsText(MiniBrowserFrm.Chromium1.Browser.MainFrame.url, 'login.inttra.com') then
  begin
    sleep(5000);
    MiniBrowserFrm.Chromium1.Browser.MainFrame.ExecuteJavaScript('document.querySelector("#email").value = "'+ 'indaiadraft' +'"; ' +
                                        'document.querySelector("#email").dispatchEvent(new Event("input"));' +
                                        'document.querySelector("#password").value = "'+ 'indaiadraft' +'"; ' +
                                        'document.querySelector("#password").dispatchEvent(new Event("input"));' +
                                        'document.querySelector("body > app-root > div > div > div > div > app-login > div > div:nth-child(1) > form > button").click(); '
                                        , 'about:blank', 0);
  end
  else
  if ContainsText(MiniBrowserFrm.Chromium1.Browser.MainFrame.url, 'my.inttra.com/dashboard') then
  begin
    MiniBrowserFrm.Chromium1.Browser.MainFrame.LoadUrl('https://booking.inttra.com/create');
  end
  else
  if ContainsText(MiniBrowserFrm.Chromium1.Browser.MainFrame.url, 'booking.inttra.com/create') then
  begin
    Script := GetScriptBooking;
    MiniBrowserFrm.Chromium1.Browser.MainFrame.ExecuteJavaScript( Script, 'about:blank', 0);
    MiniBrowserFrm.TimerAuxiliar.Enabled := true;
  end;
end;

procedure TBooking.SetRefCliente(value: String);
var
  vProxNrSequencia: String;
begin
  try
    DataModuleDefault.queryAuxiliar.Close;
    DataModuleDefault.queryAuxiliar.Sql.Clear;
    DataModuleDefault.queryAuxiliar.Sql.Text :=
      'SELECT RIGHT(''00000'' + (CAST((MAX(CAST(NR_SEQUENCIA AS INTEGER)) + 1) AS VARCHAR(5)) ), 5) PROX_NR_SEQUENCIA FROM TREF_CLIENTE WHERE  NR_PROCESSO = :NR_PROCESSO';
    DataModuleDefault.queryAuxiliar.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    DataModuleDefault.queryAuxiliar.Open;
    vProxNrSequencia := DataModuleDefault.queryAuxiliar.FieldByName('PROX_NR_SEQUENCIA').AsString;

    DataModuleDefault.queryAuxiliar.Close;
    DataModuleDefault.queryAuxiliar.Sql.Clear;
    DataModuleDefault.queryAuxiliar.Sql.Text :=
      'INSERT INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, CD_AREA, CD_EMPRESA) ' +
      'VALUES(:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, GETDATE(), ''05'', :CD_AREA, :CD_EMPRESA)';
    DataModuleDefault.queryAuxiliar.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    DataModuleDefault.queryAuxiliar.ParamByName('NR_SEQUENCIA').AsString := vProxNrSequencia;
    DataModuleDefault.queryAuxiliar.ParamByName('CD_REFERENCIA').AsString := value;
    DataModuleDefault.queryAuxiliar.ParamByName('CD_REFERENCIA').AsString := value;
    DataModuleDefault.queryAuxiliar.ParamByName('CD_AREA').AsString := DataModuleDefault.queryProcessoCodigoArea.AsString;
    DataModuleDefault.queryAuxiliar.ExecSQL;

    MiniBrowserFrm.Chromium1.Browser.MainFrame.ExecuteJavaScript(
        'alert("Número do Booking gravado com sucesso nas Referências do Processo.");'
    , 'about:blank', 0);

  except
    MiniBrowserFrm.Chromium1.Browser.MainFrame.ExecuteJavaScript(
        'alert("Erro ao gravar o número do Booking nas Referências do Processo.");'
    , 'about:blank', 0);
  end;

end;

function TBooking.GetScriptBooking: String;
var
  i:Integer;
  iContainer: Integer;
  scriptBooking, scriptContainer: String;

  function getCarrier(pCarrier: String): String;
  begin
    if (pCarrier = '0021') or (pCarrier = '0959') or (pCarrier = '0624') then
      result := '1: Object' {ALIANÇA}
    else if (pCarrier = '0204') then
      result := '2: Object' {CMA CGM}
    else if (pCarrier = '0003') then
      result := '4: Object' {HAMBURG SUD}
    else if (pCarrier = '0338') then
      result := '5: Object' {HAPAG-LLOYD}
    else if (pCarrier = '0023') then
      result := '6: Object' {Maersk}
    else if (pCarrier = '0031') then
      result := '7: Object' {MSC}
    else if (pCarrier = '1168') then
      result := '9: Object' {Sealand Amercias}
    else if (pCarrier = '0020') then
      result := '11: Object'; {ZIM}
  end;

  function getTipoContainer(pTipoContainer: String): String;
  begin
    if (pTipoContainer = '02') then
      result := '19' {	CNTR 20'DRY}
    else if (pTipoContainer = '03') then
      result := '48' {	CNTR 40'DRY}
    else if (pTipoContainer = '04') then
      result := '20' {	TANK 20"}
    else if (pTipoContainer = '05') then
      result := '49' {	TANK 40"}
    else if (pTipoContainer = '07') then
      result := '16' {	20'REEFER}
    else if (pTipoContainer = '08') then
      result := '45' {	40'REEFER}
    else if (pTipoContainer = '09') then
      result := '12' {	20'OPEN TOP}
    else if (pTipoContainer = '10') then
      result := '41' {	40'OPEN TOP}
    else if (pTipoContainer = '11') then
      result := '34' {	40'HC}
    else if (pTipoContainer = '12') then
      result := '47' {	40'HC REEFER}
    else if (pTipoContainer = '13') then
      result := '30' {	FR 40}
    else if (pTipoContainer = '14') then
      result := '3' {	FR 20}
    else if (pTipoContainer = '15') then
      result := '37' {	40'OH}
    else if (pTipoContainer = '16') then
      result := '12' {	20´OTC}
    else if (pTipoContainer = '17') then
      result := '12' {	20´OTS}
    else if (pTipoContainer = '18') then
      result := '3' {	FT20'}
    else if (pTipoContainer = '19') then
      result := '30'; {	FT40'}
  end;

  function getPaymentChargeType(value: String): String;
  begin
    if (value = 'EXW') or (value = 'FCA') or (value = 'FOB') then
      result := '4' {Destination Port Charges}
    else if (value = 'CFR') or  (value = 'CPT') or  (value = 'DAT') or  (value = 'DAP') or (value = 'DDP') then
      result := '6'; {Origin Port Charges}
  end;

  function getPaymentTerm(value: String): String;
  begin
    if (value = 'EXW') or (value = 'FCA') or (value = 'FOB') then
      result := '1' {Collect}
    else if (value = 'CFR') or  (value = 'CPT') or  (value = 'DAT') or  (value = 'DAP') or (value = 'DDP') then
      result := '2'; {Pre-paid}
  end;

  function getPaymentPayer(value: String): String;
  begin
    if (value = 'EXW') or (value = 'FCA') or (value = 'FOB') then
      result := '5'{Consignee}
    else if (value = 'CFR') or  (value = 'CPT') or  (value = 'DAT') or  (value = 'DAP') or (value = 'DDP') then
      result := '3'; {Shipper}
  end;

  function getPaymentLocation(value: String): String;
  begin
    if (value = 'EXW') or (value = 'FCA') or (value = 'FOB') then
      result := DataModuleDefault.queryProcessoPlaceofCarrierDelivery.AsString
    else if (value = 'CFR') or  (value = 'CPT') or  (value = 'DAT') or  (value = 'DAP') or (value = 'DDP') then
      result := DataModuleDefault.queryProcessoPlaceofCarrierReceipt.AsString;
  end;

begin

  if not DataModuleDefault.queryContainers.Active then
  begin
    DataModuleDefault.queryProcesso.Close;
    DataModuleDefault.queryProcesso.ParamByName('NrProcesso').AsString := NrProcesso;
    DataModuleDefault.queryProcesso.Open;

    DataModuleDefault.queryContainers.Close;
    DataModuleDefault.queryContainers.ParamByName('NrProcesso').AsString := NrProcesso;
    DataModuleDefault.queryContainers.Open;
  end;

  scriptContainer := '';
  iContainer := 0;
  DataModuleDefault.queryContainers.first;
  While not DataModuleDefault.queryContainers.eof do
  begin
    inc(iContainer);
    if iContainer > 1 then
      scriptContainer := scriptContainer + 'document.querySelector("#addCharge'+ IntToStr(iContainer-1) +'").click(); ';

    scriptContainer := scriptContainer +
      'setTimeout(function(){ ' +
          'document.querySelector("#quantity'+ IntToStr(iContainer) +'").value = " ' + DataModuleDefault.queryContainersQTDE_TP_CNTR.AsString + ' "; ' +
          'document.querySelector("#quantity'+ IntToStr(iContainer) +'").dispatchEvent(new Event("input"));' +
          {27}

          'document.querySelector("#create-booking-container > div > app-containers > form >' +
          'div > div > div > div > div.col-md-5 > div:nth-child('+ IntToStr(iContainer) +') >' +
          'div.col-10.col-md-9.col-lg-10.pl-0 > div > app-typeahead-and-list >' +
          'div > div > ul > li:nth-child(' + GetTipoContainer(DataModuleDefault.queryContainersTP_CNTR.AsString) + ')").click();'+
      '},1000); ' ;

    DataModuleDefault.queryContainers.Next;
  end;

  scriptBooking :=
      {1}
      'document.querySelector("#inputCarrier").value = "'+ getCarrier(DataModuleDefault.queryProcessoCarrier.AsString) +'"; ' +
      'document.querySelector("#inputCarrier").dispatchEvent(new Event("change"));' +
      {2}
      'document.querySelector("#contractNumber").value = "'+ DataModuleDefault.queryProcessoContractNumber.AsString +'"; ' +
      'document.querySelector("#contractNumber").dispatchEvent(new Event("input"));' +
      {4}
      'document.querySelector("#shipperPartyBox").value = "'+ StringReplace(WrapText(DataModuleDefault.queryProcessoShipper.AsString, 35), #$D#$A, '\n', [rfReplaceAll]) +'"; ' +
      'document.querySelector("#shipperPartyBox").dispatchEvent(new Event("input"));' +
      {6}
      'document.querySelector("#consigneePartyBox").value = "'+ DataModuleDefault.queryProcessoConsignee.AsString +'"; ' +
      'document.querySelector("#consigneePartyBox").dispatchEvent(new Event("input"));' +
      {7}
      'document.querySelector("#contractPartyPartyBox").value = "'+ StringReplace(WrapText(DataModuleDefault.queryProcessoContractParty.AsString, 35), #$D#$A, '\n', [rfReplaceAll]) +'"; ' +
      'document.querySelector("#contractPartyPartyBox").dispatchEvent(new Event("input"));' +
      {8}
      'document.querySelector("#notifyPartyPartyBox").value = "'+ DataModuleDefault.queryProcessoNotifyParty.AsString +'"; ' +
      'document.querySelector("#notifyPartyPartyBox").dispatchEvent(new Event("input"));' +
      {11}
      'document.querySelector("#shippersRef").value = "'+ DataModuleDefault.queryProcessoShipperReferenceNumber.AsString +'"; ' +
      'document.querySelector("#shippersRef").dispatchEvent(new Event("input"));' +
      {12}
      'document.querySelector("#forwarderReferenceNumbers").value = "'+ copy(DataModuleDefault.queryProcessoNrProcesso.AsString, 5, 16) +'"; ' +
      'document.querySelector("#forwarderReferenceNumbers").dispatchEvent(new Event("input"));' +

      'document.querySelector("#moveType").selectedIndex = "' + DataModuleDefault.queryProcessoMoveType.AsString + '"; ' +
      'document.querySelector("#moveType").dispatchEvent(new Event("change"));' +
        {index 0 = Port, Ramp, or CY to Port, Ramp, or CY
         index 1 = Door to Port, Ramp, or CY
         index 2 = Door to Door
         index 3 = Port, Ramp, or CY to Door}
      {15}
      'document.querySelector("#placeOfCarrierReceipt").value = "'+ DataModuleDefault.queryProcessoPlaceofCarrierReceipt.AsString +'"; ' +
      'document.querySelector("#placeOfCarrierReceipt").dispatchEvent(new Event("input"));' +
      'setTimeout(function(){ ' +
      ' document.querySelector("#ngb-typeahead-1-0").click(); ' +
      '},3000); '+
      {16}
      'document.querySelector("#earliestDepartureDate").value = "'+ DataModuleDefault.queryProcessoEarliestDeparture.AsString +'"; ' +
      'document.querySelector("#earliestDepartureDate").dispatchEvent(new Event("input"));' +
      {17}
      'document.querySelector("#placeOfCarrierDelivery").value = "'+ DataModuleDefault.queryProcessoPlaceofCarrierDelivery.AsString +'"; ' +
      'document.querySelector("#placeOfCarrierDelivery").dispatchEvent(new Event("input"));' +
      'setTimeout(function(){ ' +
      ' document.querySelector("#ngb-typeahead-2-0").click(); ' +
      '},4000); ' +
      {24}
      'document.querySelector("#hsCode0").value = "'+ DataModuleDefault.queryProcessoHSCode.AsString +'"; ' +
      'document.querySelector("#hsCode0").dispatchEvent(new Event("input"));' +
      'setTimeout(function(){ ' +
      ' document.querySelector("#ngb-typeahead-5-0").click(); ' +
      '},3000); ' +
      {25}
      'document.querySelector("#cargoWeight0").value = "'+ StringReplace(DataModuleDefault.queryProcessoCargoWeight.AsString, ',', '.', [rfReplaceAll]) +'"; ' +
      'document.querySelector("#cargoWeight0").dispatchEvent(new Event("input"));';
      {27}
  scriptBooking := scriptBooking + scriptContainer;
  scriptBooking := scriptBooking +
      {29}
      'document.querySelector("#selectChargeType0").value = "'+ getPaymentChargeType(DataModuleDefault.queryProcessoPaymentDetails.AsString) +'"; ' +
      'document.querySelector("#selectChargeType0").dispatchEvent(new Event("change"));' +
      {29}
      'document.querySelector("#selectFreightTerm0").value = "'+ getPaymentTerm(DataModuleDefault.queryProcessoPaymentDetails.AsString) +'"; ' +
      'document.querySelector("#selectFreightTerm0").dispatchEvent(new Event("change"));' +
      {29}
      'document.querySelector("#selectPayer0").value = "'+ getPaymentPayer(DataModuleDefault.queryProcessoPaymentDetails.AsString) +'"; ' +
      'document.querySelector("#selectPayer0").dispatchEvent(new Event("change"));' +
      {29}
      'document.querySelector("#paymentLocation0").value = "'+ getPaymentLocation(DataModuleDefault.queryProcessoPaymentDetails.AsString) +'"; ' +
      'document.querySelector("#paymentLocation0").dispatchEvent(new Event("input"));' +
      'setTimeout(function(){ ' +
      ' document.querySelector("#ngb-typeahead-6-0").click(); ' +
      '},4000); '+
      {30}
      'document.querySelector("#create-booking-container > div > app-comments-and-notification > ' +
                                   ' form > div > div > div > div.col-md-5.col-5-gutter > div > ' +
                                   ' app-pop-up-text-editor > textarea").value = "'+
                                   StringReplace(DataModuleDefault.queryProcessoCustomerComments.AsString, #$D#$A, ' ', [rfReplaceAll]) +'"; ' +
      'document.querySelector("#create-booking-container > div > app-comments-and-notification > ' +
                               ' form > div > div > div > div.col-md-5.col-5-gutter > div > ' +
                               ' app-pop-up-text-editor > textarea").dispatchEvent(new Event("input"));' +
      {31}
      'document.querySelector("#partnerEmails").value = "'+ DataModuleDefault.queryProcessoPartneremailNotifications.AsString +'"; ' +
      'document.querySelector("#partnerEmails").dispatchEvent(new Event("input"));' +

      'document.querySelector("#templateName").value = "' + copy(DataModuleDefault.queryProcessoNrProcesso.AsString, 5, 16) + '"; ' +
      'document.querySelector("#templateName").dispatchEvent(new Event("input"));' +

      'if (document.querySelector("body > div > button:nth-child(4)") !== null) {' +
        'document.querySelector("body > div > button:nth-child(4)").click()};';

  result := scriptBooking;

end;

end.
