unit Security;

interface

uses
  SysUtils, IdGlobal, IdHash, IdHashSHA, IdSSLOpenSSL, IdHashMessageDigest,
  System.Classes, Vcl.Forms;

type
  TCryptAction = (caCrypt, caDecrypt);

function Crypt(Action: TCryptAction; Src: String): String;
function MD5(const texto: string): string;

implementation

function Crypt(Action: TCryptAction; Src: string): string;
var
  KeyLen, KeyPos, OffSet, SrcPos, SrcAsc, TmpSrcAsc, Range: Integer;
  Dest, Key: string;
begin
  result := '';
  if Src <> '' then
  begin
    Key := 'MYINDAIA';
    Dest := '';
    KeyLen := Length(Key);
    KeyPos := 0;
    Range := 256;
    if (Action = caCrypt) then
    begin
      Randomize;
      OffSet := Random(Range);
      Dest := Format('%1.2x', [OffSet]);
      for SrcPos := 1 to Length(Src) do
      begin
        Application.ProcessMessages;
        SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
        if KeyPos < KeyLen then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        Dest := Dest + Format('%1.2x', [SrcAsc]);
        OffSet := SrcAsc;
      end;
    end
    else if (Action = caDecrypt) then
    begin
      OffSet := StrToInt('$' + copy(Src, 1, 2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
        if (KeyPos < KeyLen) then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= OffSet then
          TmpSrcAsc := 255 + (TmpSrcAsc - OffSet)
        else
          TmpSrcAsc := TmpSrcAsc - OffSet;
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
    result := Dest;
  end;
end;

function MD5(const texto: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := LowerCase(idmd5.HashStringAsHex(UTF8Encode(texto)));
  finally
    idmd5.Free;
  end;
end;

end.
unit Unit1;

interface

implementation

end.
