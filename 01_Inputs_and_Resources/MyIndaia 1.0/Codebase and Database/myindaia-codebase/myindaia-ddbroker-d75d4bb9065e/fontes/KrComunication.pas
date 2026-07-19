unit KrComunication;

interface

uses Windows;

type
  TWMCopyData = packed record
    Msg: Cardinal;
    From: HWND;//Handle da janela que passou o dados
    CopyDataStruct: PCopyDataStruct; //Dados Enviados
    Result: Longint;//Enviar um valor de volta
  end;

implementation

end.
 