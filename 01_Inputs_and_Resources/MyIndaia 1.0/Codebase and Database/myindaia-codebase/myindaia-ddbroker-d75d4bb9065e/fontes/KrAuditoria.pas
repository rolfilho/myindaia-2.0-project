unit KrAuditoria;

interface

uses Windows, Classes, Variants, SysUtils, StrUtils, KrQuery, DB, DBTables;

type
  TModulo = (moDeclaracaoOrigem);
  
var
  ModuloDesc: array[TModulo] of string = ('Declaração de Origem');

type
  TSetOfChar = set of char;
  TAuditoria = class
  private
    Query: TLocalSQLQuery;
    FModulo: TStrings;
    function GetSQLInsert: string;
    function GetUpdatedFields(AQuery: TDataSet; AList: TStrings; out Chave: string): Boolean;
    function AuditFormat(AValue: Variant; ADataType: TFieldType = ftString): string;
    function QuotedFieldValue(aValue: variant; aDataType: TFieldType; aProhibited: TSetOfChar=[]): string;
    procedure RegistraAuditoria(const AModulo, AModuloPai, AOperacao, AChave, ADados, AUsuario: string);
    function FieldValueToStr(aValue: variant; aDataType: TFieldType; Nullable: Boolean = False): string;
  published
    property Modulo: TStrings read FModulo write FModulo;
  public
    procedure Registra(Data: TDateTime; Maquina, Usuario, Entidade, EntidadePai, Opercao, Detalhes: string);
    procedure AuditIt(AQuery: TDataSet; AUpdateKind: TUpdateKind; const AModulo: string = ''; AModuloPai: string = '');
    constructor Create;
    destructor Destroy; override;
  end;

function Auditoria: TAuditoria;

implementation

var
  _Auditoria: TAuditoria;

function Auditoria: TAuditoria;
begin
  if not Assigned(_Auditoria) then
    _Auditoria := TAuditoria.Create;
  Result := _Auditoria;
end;

function GetMachineName:string;
var
  w: DWORD;
begin
  w:=256;
  SetLength(Result,w);
  GetComputerName(PChar(Result),w);
  SetLength(Result,StrLen(PChar(Result)));
end;


{ TAuditoria }

constructor TAuditoria.Create;
begin
  Query := TLocalSQLQuery.Create(nil);
end;

destructor TAuditoria.Destroy;
begin
  Query.Free;
  inherited;
end;

function TAuditoria.GetSQLInsert: string;
begin
  Result := 'INSERT INTO AUDITORIA '+
    '(DATA, MAQUINA, USUARIO, ENTIDADE, ENTIDADE_PAI, OPERCAO, DETALHES) '+
    'VALUES '+
    '(DATA, :MAQUINA, :USUARIO, :ENTIDADE, :ENTIDADE_PAI, :OPERCAO, :DETALHES)';
end;

procedure TAuditoria.Registra(Data: TDateTime; Maquina, Usuario, Entidade,
  EntidadePai, Opercao, Detalhes: string);
begin
  Query.SQL.Text := GetSQLInsert;
  Query.ParamByName('DATA').AsDateTime := Data;
  Query.ParamByName('MAQUINA').AsString := Maquina;
  Query.ParamByName('USUARIO').AsString := Usuario;
  Query.ParamByName('ENTIDADE').AsString := Entidade;
  Query.ParamByName('ENTIDADE_PAI').AsString := EntidadePai;
  Query.ParamByName('OPERCAO').AsString := Opercao;
  Query.ParamByName('DETALHES').AsString := Detalhes;
  Query.ExecSQL;
end;

function TAuditoria.FieldValueToStr(aValue:variant; aDataType:TFieldType; Nullable: Boolean):string;
var
  s:string;
begin
  if VarIsNull(aValue) then
  begin
    if Nullable then
      Result := 'NULL'
    else
      Result := '';
  end
  else
  begin
    case aDataType of
      ftString    ,
      ftFixedChar ,
      ftWideString: s := aValue;
      ftSmallint  ,
      ftInteger   ,
      ftWord      ,
      ftLargeint  : s := aValue;
      //ftBoolean   :
      ftFloat     ,
      ftCurrency  ,
      ftBCD       : s := StringReplace(FloatToStr(aValue), {FormatSettings.}DecimalSeparator,'.',[rfReplaceAll,rfIgnoreCase]);
      ftDate      : s := DateToStr(aValue);
      ftTime      : s := TimeToStr(aValue);
      ftDateTime  : s := DateTimeToStr(aValue);
      ftBlob      : s := aValue;
      ftMemo      : s := aValue;
      ftGraphic   : s := aValue;
    end;
    Result := s;
  end;
end;

function TAuditoria.QuotedFieldValue(aValue:variant; aDataType:TFieldType; aProhibited:TSetOfChar):string;
const
  PRINTABLECHARS=[#32..#126]-['''','$',','];
var
  s: string;
  i: integer;
begin
  if VarIsNull(aValue) then
    Result := 'NULL'
  else
  begin
    s := FieldValueToStr(aValue, aDataType);
    Result := '''';
    for i:=1 to length(s) do
      //if CharInSet(s[i], (PRINTABLECHARS-aProhibited)) then
      if (s[i] in (PRINTABLECHARS-aProhibited)) then
        Result := Result + s[i];
      {else
        result := result +'$'+ByteToHex(ord(s[i]));}
    Result := Result + '''';
  end;
end;

function TAuditoria.AuditFormat(AValue: Variant; ADataType: TFieldType): string;
begin
  Result := QuotedFieldValue(AValue, ADataType, ['|']);
end;

function TAuditoria.GetUpdatedFields(AQuery: TDataSet; AList: TStrings; out Chave: string): Boolean;
var
  KeyList: TList;
  I: Integer;
  Field: TField;
  Value: Variant;
  SemCampos: Boolean;
begin
  Result := False;
  KeyList := TList.Create;
  try
    //AQuery.GetFieldList(KeyList, AQuery.KeyFields);
    AList.Clear;
    AList.Add('[CHAVE]');
    Chave := '';
    for I := 0 to AQuery.Fields.Count - 1 do
    begin
      if AQuery.Fields[i].Tag = 1 then
      begin
        Field := AQuery.Fields[i];
        AList.Add(Field.DisplayLabel + '=' + Field.AsString);
        Chave := Chave + Field.AsString;
      end;
    end;
    {for I := 0 to AQuery.FieldCount -1 do
    begin
      if AQuery.FieldList[I].Tag = 0 then
        AList.Add(AQuery.FieldList[I].DisplayLabel + '=' + GetValueField(AQuery.FieldList[I],UpdateStatusToUpdateKind(AQuery.UpdateStatus) ,ftString));
    end;}
    AList.Add('');
    AList.Add('[CAMPOS]');
    SemCampos := True;
    for I := 0 to AQuery.FieldCount - 1 do
    begin
      Field := AQuery.Fields[I];
      if Field.FieldKind = fkData then
        case AQuery.UpdateStatus of
          usModified:
            if Field is TBlobField then
            begin
              if Field.Tag = 0 then
                AList.Add(Field.DisplayLabel + '=' + AuditFormat(Field.OldValue, Field.DataType) + '|' + AuditFormat(Field.NewValue, Field.DataType))
              else
                AList.Add(Field.DisplayLabel + '=' + QuotedStr('') + '|' + QuotedStr(''));
              SemCampos := False;
              Result := True;
            end
            else if (Field.Tag = 0) and (Field.OldValue <> Field.NewValue) then
            begin
              AList.Add(Field.DisplayLabel + '=' + AuditFormat(Field.OldValue, Field.DataType) + '|' + AuditFormat(Field.NewValue, Field.DataType));
              SemCampos := False;
              Result := True;
            end;
          usInserted:
          begin
            Result := True;
            if (KeyList.IndexOf(Field) = -1) and not VarIsNull(Field.NewValue) then
            begin
              AList.Add(Field.DisplayLabel + '=' + AuditFormat(Field.NewValue, Field.DataType));
              SemCampos := False;
            end;
          end;
          { Foi observado que na exclusão de um registro em um
            cadastro, o UpdateStatus da Query é usUnmodified,
            por isso está constante é utilizada. }
          usDeleted, usUnmodified:
          begin
            Result := True;
            if KeyList.IndexOf(Field) = -1 then
            begin
              if not VarIsNull(Field.OldValue) then
              begin
                try
                  AList.Add(Field.DisplayLabel + '=' + AuditFormat(Field.OldValue, Field.DataType));
                except
                  AList.Add(Field.DisplayLabel + '=' + AuditFormat(Field.Value, Field.DataType));
                end;
                SemCampos := False;
              end;
            end;
          end;
        end;
    end;
    if SemCampos then
    begin
      AList.Delete(AList.Count - 1);
      AList.Delete(AList.Count - 1);
    end;
  finally
    KeyList.Free;
  end;
end;

procedure TAuditoria.RegistraAuditoria(const AModulo, AModuloPai, AOperacao, AChave, ADados, AUsuario: string);
begin
  Query.SQL.Text :=
        'insert into AUDITORIA (DATA, MAQUINA, USUARIO, ENTIDADE, ENTIDADE_PAI, CHAVE, OPERACAO, DETALHES) '
        + '  VALUES (GETDATE(),:MAQUINA,:USUARIO,:ENTIDADE,:ENTIDADE_PAI,:CHAVE,:OPERACAO,:DETALHES)';
      // ParamByName('DataHora').AsDateTime := ServerTime;
  Query.ParamByName('MAQUINA').AsString := GetMachineName;
  Query.ParamByName('USUARIO').AsString := AUsuario;
  Query.ParamByName('ENTIDADE').AsString := AModulo;
  Query.ParamByName('ENTIDADE_PAI').AsString := AModuloPai;
  Query.ParamByName('OPERACAO').AsString := AOperacao;
  Query.ParamByName('CHAVE').AsString := AChave;
  Query.ParamByName('DETALHES').AsMemo := ADados;
  Query.ExecSQL;
end;

procedure TAuditoria.AuditIt(AQuery: TDataSet; AUpdateKind: TUpdateKind; const AModulo: string; AModuloPai: String);
const
  Operation: array[TUpdateKind] of Char = ('A', 'I', 'E');
var
  Changes: TStringList;
  Chave: string;
begin
  Changes := TStringList.Create;
  try
    if GetUpdatedFields(AQuery, Changes, Chave) then
      RegistraAuditoria(AModulo, AModuloPai, Operation[AUpdateKind], Chave, Changes.Text, '');
  finally
    //LastOperation := AUpdateKind;
    Changes.Free;
  end;
end;

initialization
//  Auditoria.Modulo.Add('DeclaracaoOrigem=Declaração Origem')

finalization
  if Assigned(_Auditoria) then
    _Auditoria.Free;

end.
