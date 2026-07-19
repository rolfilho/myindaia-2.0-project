// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://nsicloudqa.ecomex.com.br:7002/ecomexWS2/NsiInterfaceSOAPPort?WSDL
//  >Import : https://nsicloudqa.ecomex.com.br:7002/ecomexWS2/NsiInterfaceSOAPPort?WSDL>0
// Encoding : UTF-8
// Version  : 1.0
// (27/11/2020 20:25:03 - - $Rev: 86412 $)
// ************************************************************************ //

unit NsiInterfaceSOAPPort1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_NLBL = $0004;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://ecomexws/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : NsiInterfaceSOAP
  // service   : NsiInterfaceSOAPService
  // port      : NsiInterfaceSOAPPort
  // URL       : https://nsicloudqa.ecomex.com.br:7002/ecomexWS2/NsiInterfaceSOAPPort
  // ************************************************************************ //
  NsiInterfaceSOAP = interface(IInvokable)
  ['{13BF8DCA-5596-EA20-C48B-729F2C05C998}']
    function  loadXML(const pc_connection: string; const pc_interface: string; const pc_xml: string): string; stdcall;
  end;

function GetNsiInterfaceSOAP(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): NsiInterfaceSOAP;


implementation
  uses System.SysUtils;

function GetNsiInterfaceSOAP(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): NsiInterfaceSOAP;
const
//  defWSDL = 'https://nsicloudqa.ecomex.com.br:7002/ecomexWS2/NsiInterfaceSOAPPort?WSDL'; Ambiente qualidade (teste)
//  defURL  = 'https://nsicloudqa.ecomex.com.br:7002/ecomexWS2/NsiInterfaceSOAPPort';      Ambiente qualidade (teste)
  defWSDL = 'https://cloudue.ecomex.com.br:7008/ecomexWS/NsiInterfaceSOAPPort?WSDL';
  defURL  = 'https://cloudue.ecomex.com.br:7008/ecomexWS/NsiInterfaceSOAPPort';
  defSvc  = 'NsiInterfaceSOAPService';
  defPrt  = 'NsiInterfaceSOAPPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as NsiInterfaceSOAP);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { NsiInterfaceSOAP }
  InvRegistry.RegisterInterface(TypeInfo(NsiInterfaceSOAP), 'http://ecomexws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(NsiInterfaceSOAP), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(NsiInterfaceSOAP), ioDocument);
  { NsiInterfaceSOAP.loadXML }
  InvRegistry.RegisterMethodInfo(TypeInfo(NsiInterfaceSOAP), 'loadXML', '',
                                 '[ReturnName="return"]', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(NsiInterfaceSOAP), 'loadXML', 'pc_connection', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(NsiInterfaceSOAP), 'loadXML', 'pc_interface', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(NsiInterfaceSOAP), 'loadXML', 'pc_xml', '',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(NsiInterfaceSOAP), 'loadXML', 'return', '',
                                '', IS_NLBL);

end.
