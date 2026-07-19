unit Utils;

interface

uses SysUtils, DateUtils;

function GetPath: string;
function ValidDate(ADate: TDateTime): Boolean;
function DaysInPeriod(Date1, Date2: TDateTime): Longint;
function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,  MSecs: Integer): TDateTime;

implementation

uses
  Forms;

function GetPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
end;

function ValidDate(ADate: TDateTime): Boolean;
var
  Year, Month, Day: Word;
begin
  try
    DecodeDate(ADate, Year, Month, Day);
    Result := IsValidDate(Year, Month, Day);
  except
    Result := False;
  end;
end;

function DaysInPeriod(Date1, Date2: TDateTime): Longint;
begin
  if ValidDate(Date1) and ValidDate(Date2) then
    Result := Abs(Trunc(Date2) - Trunc(Date1)) + 1
  else
    Result := 0;
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
  MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then
    Result := Result + 1;
end;

end.
