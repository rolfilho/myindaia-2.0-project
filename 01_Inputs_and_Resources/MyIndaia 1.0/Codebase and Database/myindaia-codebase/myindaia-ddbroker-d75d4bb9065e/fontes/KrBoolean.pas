unit KrBoolean;

interface

uses DB;

function IntToBool(aValue: Integer): Boolean;
function BoolToInt(aValue: Boolean): Integer;
function BoolSimNao(aValor: Boolean): string;
function IntSimNao(aValor: Integer): string;
function IntFldSimNao(aIntFld: TField): string;
function BoolSN(aValor: Boolean): string;

implementation

function IntToBool(aValue: Integer): Boolean;
begin
  Result := aValue <> 0;
end;

function BoolToInt(aValue: Boolean): Integer;
begin
  if aValue then
    Result := 1
  else
    Result := 0;
end;

function BoolSimNao(aValor: Boolean): string;
begin
  if aValor then
    Result := 'Sim'
  else
    Result := 'Não';
end;

function IntSimNao(aValor: Integer): string;
begin
  Result := BoolSimNao(IntToBool(aValor));
end;

function IntFldSimNao(aIntFld: TField): string;
begin
  if aIntFld.IsNull then
    Result := ''
  else
    Result := IntSimNao(aIntFld.AsInteger);
end;

function BoolSN(aValor: Boolean): string;
begin
  if aValor then
    Result := 'S'
  else
    Result := 'N';
end;

end.
