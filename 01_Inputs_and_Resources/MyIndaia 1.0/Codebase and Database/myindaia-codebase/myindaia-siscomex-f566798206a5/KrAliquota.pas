unit KrAliquota;

interface

uses System.Classes, System.SysUtils, Data.DB, FireDAC.Stan.Param, KrQuery;

type
  TAliquota = class
  private
    FArquivo: TStrings;
    FNomeArquivo: string;
    QuerySelect: TLocalQuery;
    QueryInsert: TLocalQuery;
    QueryUpdate: TLocalQuery;
    QueryAux: TLocalQuery;
    function GetSQLSelect: string;
    function GetSQLInsert: string;
    function GetSQLUpdate: string;
    procedure Salvar(const CODNCM, DESCNCM, II, IPI, PIS, COFINS, CODUM: string);
    function FormataAliquota(const Value: string): string;
  public
    constructor Create(const NomeArquivo: string);
    destructor Destroy; override;
    procedure Processa;
  end;


implementation

uses KrConnection, KrUtil;

{ TTaxaCambio }

function TAliquota.FormataAliquota(const Value: string): string;
var
  Aux: Double;
begin
  if Value = 'NT' then
    Exit(Value);
  Aux := StrToFloat(Value);
  Result := FormatFloat(',000.00', Aux);
end;

constructor TAliquota.Create(const NomeArquivo: string);
begin
  FNomeArquivo := NomeArquivo;
  FArquivo := TStringList.Create;
  QuerySelect := TLocalQuery.Create(nil);
  QuerySelect.Connection := BrokerConnection;
  QuerySelect.SQL.Text :=  GetSQLSelect;
  QueryInsert := TLocalQuery.Create(nil);
  QueryInsert.Connection := BrokerConnection;
  QueryInsert.SQL.Text := GetSQLInsert;
  QueryUpdate := TLocalQuery.Create(nil);
  QueryUpdate.Connection := BrokerConnection;
  QueryUpdate.SQL.Text := GetSQLUpdate;
  QueryAux := TLocalQuery.Create(nil);
  QueryAux.Connection := BrokerConnection;
  QueryAux.SQL.Text := 'SELECT ALIQ_PIS, ALIQ_COFINS FROM TNCM_PIS_COFINS ';
end;

destructor TAliquota.Destroy;
begin
  QuerySelect.Free;
  QueryInsert.Free;
  QueryUpdate.Free;
  QueryAux.Free;
  inherited;
end;

function TAliquota.GetSQLInsert: string;
begin
  Result := 'INSERT INTO TNCM '+
    '(CODIGO,DESCRICAO,UNIDADE_MEDIDA,ALIQUOTA_II,DATA_INICIO_VIG_II, '+
    'DATA_FIM_VIG_II,ALIQUOTA_II_MERCOSUL,DATA_INICIO_VIG_II_MSUL, '+
    'DATA_FIM_VIG_II_MSUL,ALIQUOTA_IPI,DATA_INICIO_VIG_IPI,DATA_FIM_VIG_IPI, '+
    'ALIQUOTA_PIS_ADVAL,DATA_INI_VIG_PIS_ADVAL,DATA_FIM_VIG_PIS_ADVAL, '+
    'ALIQUOTA_COFINS_ADVAL,DATA_INI_VIG_COFINS_ADVAL,DATA_FIM_VIG_COFINS_ADVAL, '+
    'IN_NECESSITA_LI,ALIQUOTA_GATT,DATA_INICIO_VIG_GATT,DATA_FIM_VIG_GATT, '+
    'IN_ANUENCIA_EXERCITO) '+
    'VALUES '+
     '(:CODIGO,:DESCRICAO,:UNIDADE_MEDIDA,:ALIQUOTA_II,:DATA_INICIO_VIG_II, '+
    ':DATA_FIM_VIG_II,:ALIQUOTA_II_MERCOSUL,:DATA_INICIO_VIG_II_MSUL, '+
    ':DATA_FIM_VIG_II_MSUL,:ALIQUOTA_IPI,:DATA_INICIO_VIG_IPI,:DATA_FIM_VIG_IPI, '+
    ':ALIQUOTA_PIS_ADVAL,:DATA_INI_VIG_PIS_ADVAL,:DATA_FIM_VIG_PIS_ADVAL, '+
    ':ALIQUOTA_COFINS_ADVAL,:DATA_INI_VIG_COFINS_ADVAL,:DATA_FIM_VIG_COFINS_ADVAL, '+
    ':IN_NECESSITA_LI,:ALIQUOTA_GATT,:DATA_INICIO_VIG_GATT,:DATA_FIM_VIG_GATT, '+
    ':IN_ANUENCIA_EXERCITO) ';
end;

function TAliquota.GetSQLSelect: string;
begin
  Result := 'SELECT * FROM BROKER.DBO.TNCM '+
    'WHERE CODIGO = :CODIGO ';
end;

function TAliquota.GetSQLUpdate: string;
begin
  Result := 'UPDATE TNCM SET ALIQUOTA_II = :ALIQUOTA_II, ALIQUOTA_IPI = :ALIQUOTA_IPI, '+
    'ALIQUOTA_PIS_ADVAL = :ALIQUOTA_PIS_ADVAL, ALIQUOTA_COFINS_ADVAL = :ALIQUOTA_COFINS_ADVAL '+
    'WHERE CODIGO = :CODIGO ';
end;

procedure TAliquota.Processa;
var
  I: Integer;
  Qtd: Integer;
  Linha: string;
  CODNCM: string;
  DESCNCM: string;
  II: string;
  IPI: string;
  PIS: string;
  COFINS: string;
  CODUM: string;
  ALIQ_PIS: Double;
  ALIQ_COFINS: Double;
  Aux: string;
begin
//  Log('Iniciado Aliquota');
  QueryAux.Open;
  if QueryAux.RecordCount > 1 then
  begin
//    Log('ERRO: Encontrado mais de um regsitro na tabela TNCM_PIS_COFINS.');
    Exit;
  end;
  ALIQ_PIS := QueryAux.FieldByName('ALIQ_PIS').AsFloat;
  ALIQ_COFINS := QueryAux.FieldByName('ALIQ_COFINS').AsFloat;
  QueryAux.Close;
  FArquivo.Clear;
  try
    FArquivo.LoadFromFile(FNomeArquivo);
    for I := 1 to FArquivo.Count - 1 do
    begin
      Linha := TrataLinha(FArquivo.Strings[I]);
      CODNCM := TokenN(Linha, 1);
      if CODNCM.Length=8 then
      begin
        Aux := TokenN(Linha, 2);
        Aux := TrimLeft(StringReplace(Aux, '--', '', [rfReplaceAll]));
        Aux := TrimLeft(StringReplace(Aux, '- -', '', [rfReplaceAll]));
        DESCNCM := Copy(Aux, 1, 120);
        II := FormataAliquota(TokenN(Linha, 3));
        Aux := TokenN(Linha, 4);
        if Aux.Contains('Conv.') then
          IPI := FormatFloat(',000.00', 0.00)
        else
          IPI := FormataAliquota(TokenN(Linha, 4));
        Aux := TokenN(Linha, 5);
        if Aux.Contains('Reduz') or Aux.Contains('Eleva') then
          PIS := FormatFloat(',000.00', ALIQ_PIS)
        else
          PIS := FormataAliquota(Aux);
        Aux := TokenN(Linha, 6);
        if Aux.Contains('Reduz') or Aux.Contains('Eleva') then
          COFINS := FormatFloat(',000.00', ALIQ_COFINS)
        else
          COFINS := FormataAliquota(Aux);
        CODUM := TokenN(Linha, 7);
        Salvar(CODNCM, DESCNCM, II, IPI, PIS, COFINS, CODUM);
        Inc(Qtd);
      end;
    end;
//    Log('Importado ' + Qtd.ToString + ' de ' + FArquivo.Count.ToString);
//    Log('Finalizado Aliquota');
  finally
    FArquivo.Clear;
  end;
end;

procedure TAliquota.Salvar(const CODNCM, DESCNCM, II, IPI, PIS, COFINS, CODUM: string);
begin
  QuerySelect.Close;
  QuerySelect.ParamByName('CODIGO').AsString := CODNCM;
  QuerySelect.Open;
  if QuerySelect.IsEmpty then
  begin
    QueryInsert.ParamByName('CODIGO').AsString := CODNCM;
    QueryInsert.ParamByName('DESCRICAO').AsString := DESCNCM;
    QueryInsert.ParamByName('UNIDADE_MEDIDA').AsString := CODUM;
    QueryInsert.ParamByName('ALIQUOTA_II').AsString := II;
    QueryInsert.ParamByName('DATA_INICIO_VIG_II').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_II').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('ALIQUOTA_II_MERCOSUL').AsString := '000,00';
    QueryInsert.ParamByName('DATA_INICIO_VIG_II_MSUL').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_II_MSUL').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('ALIQUOTA_IPI').AsString := IPI;
    QueryInsert.ParamByName('DATA_INICIO_VIG_IPI').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_IPI').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('ALIQUOTA_PIS_ADVAL').AsString := PIS;
    QueryInsert.ParamByName('DATA_INI_VIG_PIS_ADVAL').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_PIS_ADVAL').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('ALIQUOTA_COFINS_ADVAL').AsString := COFINS;
    QueryInsert.ParamByName('DATA_INI_VIG_COFINS_ADVAL').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_COFINS_ADVAL').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('IN_NECESSITA_LI').AsString := '';
    QueryInsert.ParamByName('ALIQUOTA_GATT').AsString := '000.00';
    QueryInsert.ParamByName('DATA_INICIO_VIG_GATT').AsDateTime := EncodeDate(2002, 01, 01);
    QueryInsert.ParamByName('DATA_FIM_VIG_GATT').AsDateTime := EncodeDate(9999, 12, 31);
    QueryInsert.ParamByName('IN_ANUENCIA_EXERCITO').AsString := '0';
    QueryInsert.ExecSQL;
  end
  else
  begin
    QueryUpdate.ParamByName('CODIGO').AsString := CODNCM;
    QueryUpdate.ParamByName('ALIQUOTA_II').AsString := II;
    QueryUpdate.ParamByName('ALIQUOTA_IPI').AsString := IPI;
    QueryUpdate.ParamByName('ALIQUOTA_PIS_ADVAL').AsString := PIS;
    QueryUpdate.ParamByName('ALIQUOTA_COFINS_ADVAL').AsString := COFINS;
    QueryUpdate.ExecSQL;
  end;  
  QuerySelect.Close;
end;

end.
