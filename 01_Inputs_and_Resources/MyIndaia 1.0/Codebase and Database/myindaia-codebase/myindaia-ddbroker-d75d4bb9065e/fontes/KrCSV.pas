unit KrCSV;

interface

uses
  Windows, DB, Classes, SysUtils;


const
  retCSV_OK = 0;
  retCSV_FaltaNomeArquivo = 1;
  retCSV_FataDataSet = 2;
  MessErroCSV: array[0..2]  of string = (
    'Arquivo gerado com sucesso.',
    'Falta nome do Arquivo.',
    'Falta DataSet.'
  );

type
  TCSV = Class(TObject)

  private
  public
    Cabecalho: TStrings;
    FormataString: Boolean;
    function EmptyFieldText(Field: TField): string;
    function EmptyFieldValue(Field: TField): string;
    function FieldValueNotNull(Field: TField): string;
    constructor Create;
    destructor Destroy; override;
    procedure AddLinha(s: string);
    function ConvertCSV(aTable: TDataSet; aNomeArq: string; MostraTituloColuna: Boolean = True; TratarCampoNulo: Boolean = True; Delimitador: string = ';'): Integer;
  end;

implementation
{
uses
  KrString;
}
{ TCSV }

function TCSV.EmptyFieldText(Field: TField): string;
begin
  case Field.DataType of
    ftString : Result := '""';
    ftInteger: Result := '0';
    ftFloat: Result := '0,00';
    else
      Result := '0';
  end;
end;

function TCSV.EmptyFieldValue(Field: TField): string;
begin
  case Field.DataType of
    ftString :
    begin
      if FormataString then
        Result := '"' + Field.Text + '"'
      else
        Result := Field.Text;
    end;
    ftInteger: Result := Field.Text;
    ftFloat: Result := FormatFloat(',0.00', StrToFloat(Field.Text));
  else
    Result := '"' + Field.Text + '"';
  end;
end;

function TCSV.FieldValueNotNull(Field: TField): string;
begin
  case Field.DataType of
    ftInteger: Result := FormatFloat(TFloatField(Field).DisplayFormat, Field.AsInteger);
    ftFloat: Result := FormatFloat(TFloatField(Field).DisplayFormat, Field.AsFloat);
    ftDate: Result := FormatDateTime(TDateField(Field).DisplayFormat, Field.AsFloat);
    ftTime: Result := FormatDateTime(TTimeField(Field).DisplayFormat, Field.AsFloat);
    ftDateTime: Result := FormatDateTime(TDateTimeField(Field).DisplayFormat, Field.AsFloat);
    ftString:
    begin
      if FormataString then
        Result := '"' + Field.AsString + '"'
      else
         Result := Field.AsString;
    end;
  else
    Result := Field.AsString;
  end;
end;

procedure CatStr(var s: string; const Separator, Substr: string);
begin
  if (s <> '') and (Substr <> '') then
    s := s + Separator;
  s := s + Substr;
end;


function TCSV.ConvertCSV(aTable: TDataSet; aNomeArq: string; MostraTituloColuna: Boolean = True; TratarCampoNulo: Boolean = True; Delimitador: string = ';'): Integer;
var
  Arq: TextFile;
  Colunas: string;
  Linha: string;
  I: Integer;
  Bookmark: TBookmarkStr;
begin
  if aNomeArq = '' then
  begin
    Result := retCSV_FaltaNomeArquivo;
    Exit;
  end;
  if aTable = nil then
  begin
    Result := retCSV_FataDataSet;
    Exit;
  end;
  AssignFile(Arq, aNomeArq);
  Rewrite(Arq);
  try
    for I := 0 to Cabecalho.Count -1 do
    begin
      WriteLn(Arq, Cabecalho.Strings[i]);
    end;
    if MostraTituloColuna then
    begin
      for I := 0 to aTable.FieldCount - 1 do
      begin
        if aTable.Fields.Fields[i].Visible then
          if FormataString then
            CatStr(Colunas, Delimitador, '"' + aTable.Fields.Fields[i].DisplayLabel + '"')
          else
            CatStr(Colunas, Delimitador, aTable.Fields.Fields[i].DisplayLabel );
      end;
      WriteLn(Arq, Colunas);
    end;
    //
    Bookmark := aTable.Bookmark;
    aTable.DisableControls;
    aTable.First;
    while not aTable.Eof do
    begin
      Linha := '';
      for I := 0 to aTable.FieldCount - 1 do
      begin
        // Se o campo for nulo e deve tratar Campos Nulos, verifica o Text e usa-o.
        // Caso o Text também for nulo, trata de acordo com o tipo de dado.
        if aTable.Fields.Fields[i].Visible then
        begin
          if aTable.Fields[i].IsNull and TratarCampoNulo then
          begin
            if (aTable.Fields[i].Text = '') then
              CatStr(Linha, Delimitador,EmptyFieldText(aTable.Fields[i]))
            else
              CatStr(Linha, Delimitador,EmptyFieldValue(aTable.Fields[i]))
          end
          else
            CatStr(Linha, Delimitador, FieldValueNotNull(aTable.Fields[i]));
        end;
      end;
      WriteLn(Arq, Linha);
      aTable.Next;
    end;
  finally
    CloseFile(Arq);
    aTable.Bookmark := Bookmark;
    aTable.EnableControls;
  end;
  Result := retCSV_OK;
end;

procedure TCSV.AddLinha(s: string);
begin
  Cabecalho.Add(s);
end;

constructor TCSV.Create;
begin
  Cabecalho := TStringList.Create;
  FormataString := True;
end;

destructor TCSV.Destroy;
begin
  Cabecalho.Free;
  inherited;
end;

end. 
