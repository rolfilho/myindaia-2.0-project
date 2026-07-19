unit MyCOM_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 05/07/2018 12:14:33 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Projetos\Delphi\ddbroker\mycomdll\MyCOM.tlb (1)
// LIBID: {64F6756E-9B25-4F43-9DFA-AFEBA8AAB250}
// LCID: 0
// Helpfile: 
// HelpString: MyCOM Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MyCOMMajorVersion = 1;
  MyCOMMinorVersion = 0;

  LIBID_MyCOM: TGUID = '{64F6756E-9B25-4F43-9DFA-AFEBA8AAB250}';

  IID_IIntegraPlan: TGUID = '{F572BDC1-050F-447E-BD8C-E52CE57DD3D0}';
  CLASS_IntegraPlan: TGUID = '{AC8890F7-F467-41EB-8827-ED2DBFF370CA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IIntegraPlan = interface;
  IIntegraPlanDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  IntegraPlan = IIntegraPlan;


// *********************************************************************//
// Interface: IIntegraPlan
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F572BDC1-050F-447E-BD8C-E52CE57DD3D0}
// *********************************************************************//
  IIntegraPlan = interface(IDispatch)
    ['{F572BDC1-050F-447E-BD8C-E52CE57DD3D0}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    function Get_Remessa(NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                         TxArquivo: OleVariant): Integer; safecall;
    function Get_PackingList(NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                             TxArquivo: OleVariant): Integer; safecall;
    function Get_RemessaTxt(NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                            TxArquivo: OleVariant): Integer; safecall;
    function Get_RemessaXls(NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                            TxArquivo: OleVariant): Integer; safecall;
    function Get_TranspXls(NrTransp: OleVariant; NmServer: OleVariant; TxArquivo: OleVariant): Integer; safecall;
    function Get_GeraID(ID: OleVariant; tipo: OleVariant): Integer; safecall;
    function Get_IntegraPlanilhaWhirlpool(NmServer: OleVariant; TxArquivo: OleVariant; 
                                          CdUsuario: OleVariant): OleVariant; safecall;
    function Get_IntegraPlanilhaSG(NmServer: OleVariant; TxArquivo: OleVariant; 
                                   CdUsuario: OleVariant): OleVariant; safecall;
    function Get_EnviaEmailAnexo(TxDe: OleVariant; TxPara: OleVariant; TxCopia: OleVariant; 
                                 TxAssunto: OleVariant; TxAnexo: OleVariant): OleVariant; safecall;
    function Get_IntegraPlanilhaFesto(NmServer: OleVariant; TxArquivo: OleVariant; 
                                      CdUsuario: OleVariant): OleVariant; safecall;
    property Remessa[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                     TxArquivo: OleVariant]: Integer read Get_Remessa;
    property PackingList[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                         TxArquivo: OleVariant]: Integer read Get_PackingList;
    property RemessaTxt[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                        TxArquivo: OleVariant]: Integer read Get_RemessaTxt;
    property RemessaXls[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                        TxArquivo: OleVariant]: Integer read Get_RemessaXls;
    property TranspXls[NrTransp: OleVariant; NmServer: OleVariant; TxArquivo: OleVariant]: Integer read Get_TranspXls;
    property GeraID[ID: OleVariant; tipo: OleVariant]: Integer read Get_GeraID;
    property IntegraPlanilhaWhirlpool[NmServer: OleVariant; TxArquivo: OleVariant; 
                                      CdUsuario: OleVariant]: OleVariant read Get_IntegraPlanilhaWhirlpool;
    property IntegraPlanilhaSG[NmServer: OleVariant; TxArquivo: OleVariant; CdUsuario: OleVariant]: OleVariant read Get_IntegraPlanilhaSG;
    property EnviaEmailAnexo[TxDe: OleVariant; TxPara: OleVariant; TxCopia: OleVariant; 
                             TxAssunto: OleVariant; TxAnexo: OleVariant]: OleVariant read Get_EnviaEmailAnexo;
    property IntegraPlanilhaFesto[NmServer: OleVariant; TxArquivo: OleVariant; CdUsuario: OleVariant]: OleVariant read Get_IntegraPlanilhaFesto;
  end;

// *********************************************************************//
// DispIntf:  IIntegraPlanDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F572BDC1-050F-447E-BD8C-E52CE57DD3D0}
// *********************************************************************//
  IIntegraPlanDisp = dispinterface
    ['{F572BDC1-050F-447E-BD8C-E52CE57DD3D0}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    property Remessa[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                     TxArquivo: OleVariant]: Integer readonly dispid 203;
    property PackingList[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                         TxArquivo: OleVariant]: Integer readonly dispid 204;
    property RemessaTxt[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                        TxArquivo: OleVariant]: Integer readonly dispid 205;
    property RemessaXls[NrRap: OleVariant; NrGrupo: OleVariant; NmServer: OleVariant; 
                        TxArquivo: OleVariant]: Integer readonly dispid 206;
    property TranspXls[NrTransp: OleVariant; NmServer: OleVariant; TxArquivo: OleVariant]: Integer readonly dispid 207;
    property GeraID[ID: OleVariant; tipo: OleVariant]: Integer readonly dispid 208;
    property IntegraPlanilhaWhirlpool[NmServer: OleVariant; TxArquivo: OleVariant; 
                                      CdUsuario: OleVariant]: OleVariant readonly dispid 209;
    property IntegraPlanilhaSG[NmServer: OleVariant; TxArquivo: OleVariant; CdUsuario: OleVariant]: OleVariant readonly dispid 210;
    property EnviaEmailAnexo[TxDe: OleVariant; TxPara: OleVariant; TxCopia: OleVariant; 
                             TxAssunto: OleVariant; TxAnexo: OleVariant]: OleVariant readonly dispid 211;
    property IntegraPlanilhaFesto[NmServer: OleVariant; TxArquivo: OleVariant; CdUsuario: OleVariant]: OleVariant readonly dispid 212;
  end;

// *********************************************************************//
// The Class CoIntegraPlan provides a Create and CreateRemote method to          
// create instances of the default interface IIntegraPlan exposed by              
// the CoClass IntegraPlan. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIntegraPlan = class
    class function Create: IIntegraPlan;
    class function CreateRemote(const MachineName: string): IIntegraPlan;
  end;

implementation

uses ComObj;

class function CoIntegraPlan.Create: IIntegraPlan;
begin
  Result := CreateComObject(CLASS_IntegraPlan) as IIntegraPlan;
end;

class function CoIntegraPlan.CreateRemote(const MachineName: string): IIntegraPlan;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IntegraPlan) as IIntegraPlan;
end;

end.
