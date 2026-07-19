unit dmCargillTrimestralOperacoes;

interface

uses
  SysUtils, Classes, DB, DBClient, DateUtils;

type
  TdmdCargillTrimestralOperacoes = class(TDataModule)
    cdsMain: TClientDataSet;
    cdsMainField01: TStringField;
    cdsMainField02: TStringField;
    cdsMainField03: TStringField;
    cdsMainField04: TStringField;
    cdsMainField05: TStringField;
    cdsMainField06: TStringField;
    cdsMainField07: TIntegerField;
    cdsMainField08: TIntegerField;
    cdsMainField09: TIntegerField;
    cdsMainField10: TStringField;
    cdsMainField11: TStringField;
    cdsMainField12: TStringField;
    cdsMainField13: TStringField;
    cdsMainField14: TStringField;
    cdsMainField15: TStringField;
    cdsMainField16: TStringField;
    cdsClone: TClientDataSet;
  private
    { Private declarations }
    function GetSQL: string;
    procedure Monta(DataInicial, DataFinal: TDateTime);
  public
    procedure Gerar(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
  end;

var
  dmdCargillTrimestralOperacoes: TdmdCargillTrimestralOperacoes;

implementation

uses KrCSV, KrQuery;

{$R *.dfm}

{ TdmdCargillTrimestralOperacoes }

procedure TdmdCargillTrimestralOperacoes.Monta(DataInicial, DataFinal: TDateTime);
var
  Query: TLocalQuery;
  F01: string;
  F02: string;
  F04: string;
  F05: string;
  F06: string;
  F11: string;
  F12: string;
  F13: string;
  F14: string;
  F15: string;
  function Campo13: string;
  var
    Aux: string;
  begin
    Result := '02';
    Aux := TrimRight(Query.FieldByName('CD_FUND_LEG_REGIME').AsString);
    if TrimRight(Query.FieldByName('CD_TIPO_MANIFESTO').AsString) ='3' then
      Result := '03'
    else if TrimRight(Query.FieldByName('CD_FUND_LEG_REGIME').AsString) ='16' then
      Result := '01'
    else if (Aux = '01') or (Aux = '05') or (Aux = '12') then
      Result := '02';
  end;
  function EndPeriod: string;
  begin
    Result := '';
    if not Query.FieldByName('EndPeriod').IsNull then
    begin
      Result := FormatDateTime('DDMMYY', EndOfTheMonth(Query.FieldByName('EndPeriod').AsDateTime));
    end;
  end;
begin
  Query := AutoQuery.Query(GetSQL);
  Query.ParamByName('DATAINICIAL').AsDateTime := DataInicial;
  Query.ParamByName('DATAFINAL').AsDateTime := DataFinal;
  Query.Open;
  cdsMain.Open;
  while not Query.Eof do
  begin
    cdsMain.Append;
    cdsMainField01.AsString := TrimRight(Query.FieldByName('RegistrationNumber').AsString);
    cdsMainField02.AsString := TrimRight(Query.FieldByName('FDCnumber').AsString);
    cdsMainField03.AsString := TrimRight(Query.FieldByName('BUName').AsString);
    cdsMainField04.AsString := TrimRight(Query.FieldByName('Country').AsString);
    cdsMainField05.AsString := TrimRight(Query.FieldByName('TypeOfTransaction').AsString);
    cdsMainField06.AsString := TrimRight(Query.FieldByName('HSCode').AsString);
    cdsMainField07.AsInteger := 0; //o numero de repetições para cada linha, comparando os itens: 1,2,4,5,6,11,12,13,14 e 15.
    cdsMainField08.AsInteger := Round(Query.FieldByName('Dutypaid').AsFloat);
    cdsMainField09.AsInteger := Round(Query.FieldByName('CustomsValue').AsFloat);
    cdsMainField10.AsString := TrimRight(Query.FieldByName('Currency').AsString);
    cdsMainField11.AsString := TrimRight(Query.FieldByName('CountryOfOrigin').AsString);
    cdsMainField12.AsString := TrimRight(Query.FieldByName('PreferenceProgramFlag').AsString);
    cdsMainField13.AsString := Campo13;
    cdsMainField14.AsString := EndPeriod;
    cdsMainField15.AsString := TrimRight(Query.FieldByName('RelatedParty').AsString);
    cdsMainField16.AsString := 'Leandro Xavier';
    cdsMain.Post;
    Query.Next;
  end;
  cdsClone.CloneCursor(cdsMain,True);
  cdsClone.IndexFieldNames := '01;02;04;05;06;11;12;13;14;15';
  cdsMain.IndexFieldNames := '01;02;04;05;06;11;12;13;14;15';
  cdsClone.First;
  cdsMain.First;
  while not cdsMain.Eof do
  begin
    F01 := cdsMainField01.AsString;
    F02 := cdsMainField02.AsString;
    F04 := cdsMainField04.AsString;
    F05 := cdsMainField05.AsString;
    F06 := cdsMainField06.AsString;
    F11 := cdsMainField11.AsString;
    F12 := cdsMainField12.AsString;
    F13 := cdsMainField13.AsString;
    F14 := cdsMainField14.AsString;
    F15 := cdsMainField15.AsString;
    cdsClone.SetRange([F01,F02,F04,F05,F06,F11,F12,F13,F14,F15], [F01,F02,F04,F05,F06,F11,F12,F13,F14,F15]);
    repeat
      cdsMain.Edit;
      cdsMainField07.AsInteger := cdsClone.RecordCount;
      cdsMain.Post;
      cdsMain.Next;
    until cdsMain.Eof or
      (F01 <> cdsMainField01.AsString) or
      (F02 <> cdsMainField02.AsString) or
      (F04 <> cdsMainField04.AsString) or
      (F05 <> cdsMainField05.AsString) or
      (F06 <> cdsMainField06.AsString) or
      (F11 <> cdsMainField11.AsString) or
      (F12 <> cdsMainField12.AsString) or
      (F13 <> cdsMainField13.AsString) or
      (F14 <> cdsMainField14.AsString) or
      (F15 <> cdsMainField15.AsString);
    cdsClone.CancelRange;
  end;
end;

procedure TdmdCargillTrimestralOperacoes.Gerar(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  CSV: TCSV;
begin
  Monta(DataInicial, DataFinal);
  CSV := TCSV.Create;
  try
    CSV.Cabecalho.Text :='"Importer / Exporter Registration Number";"FDC number";'+
                         '"BU Name";"Country where customs declaration is filed";'+
                         '"Type of transaction";"HS Code";"Number of transactions";'+
                         '"Duty paid";"Customs value";"Currency";"Country of Origin";'+
                         '"Preference Program Flag";"Customs Regime / Entry Type";'+
                         '"End Period";"Related Party";"Broker Name"';
    CSV.ConvertCSV(cdsMain, NomeArquivo, False);
  finally
    CSV.Free;
  end;
end;

function TdmdCargillTrimestralOperacoes.GetSQL: string;
begin
  Result := '  SELECT '+
            '        CLI.CGC_EMPRESA                             as RegistrationNumber,     '+
            '        AREA.FDC_NUMERO                             AS FDCnumber,              '+
            '        AREA.NM_AREA                                as BUName,                 '+
            '        ''BR''                                      AS Country,                '+
            '        ''Import''                                  AS TypeOfTransaction,      '+
            '        SUBSTRING(DM.CD_NCM_SH, 1, 6)               AS HSCode,                 '+
            '        0                                           AS NumberOfTransactions,   '+
            '        (DM.VL_II_ITEM  / DI.TX_DOLAR)              AS Dutypaid,               '+
            '        (DM.VL_BASE_CALC_II / DI.TX_DOLAR)          AS CustomsValue,           '+
            '        MOEDA.AP_MOEDA                              AS Currency,               '+
            '        PAIS.NM_SIGLA_2L                            AS CountryOfOrigin,        '+
            '        CASE WHEN RTRIM(AI.CD_ACORDO_ALADI) = ''''                             '+
            '             THEN ''N''                                                        '+
            '             ELSE ''Y''                                                        '+
            '        END                                         AS PreferenceProgramFlag,  '+
            '        DI.CD_TIPO_MANIFESTO,                                                  '+
            '        AI.CD_FUND_LEG_REGIME,                                                 '+
            '        DI.CD_TIPO_DECLARACAO,                                                 '+
            '        DT_REALIZACAO                               as EndPeriod,              '+ //--último dia do mês da data
            '        CASE WHEN AI.CD_VINC_IMPO_EXPO = 1                                     '+
            '             THEN ''Y''                                                        '+
            '             ELSE ''N''                                                        '+
            '        END                                         AS  RelatedParty           '+
            '  FROM TPROCESSO                     P     (NOLOCK) '+
            '  INNER JOIN TEMPRESA_NAC            CLI   (NOLOCK)ON CLI.CD_EMPRESA = P.CD_CLIENTE '+
            '  INNER JOIN TAREA                   AREA  (NOLOCK)ON AREA.CD_AREA = P.CD_AREA '+
            '  INNER JOIN TDETALHE_MERCADORIA     DM    (NOLOCK)ON DM.NR_PROCESSO = P.NR_PROCESSO '+
            '  INNER JOIN TDECLARACAO_IMPORTACAO  DI    (NOLOCK)ON DI.NR_PROCESSO = DM.NR_PROCESSO '+
            '  INNER JOIN TADICAO_DE_IMPORTACAO   AI    (NOLOCK)ON AI.NR_PROCESSO = DM.NR_PROCESSO AND AI.NR_ADICAO = Dm.NR_ADICAO '+
            '  INNER JOIN TPAIS_BROKER            PAIS  (NOLOCK)ON PAIS.CD_PAIS = AI.CD_PAIS_ORIG_MERC '+
            '  INNER JOIN TFOLLOWUP               F021  (NOLOCK)ON F021.NR_PROCESSO = P.NR_PROCESSO AND F021.CD_EVENTO = ''021'' '+
            '  INNER JOIN TMOEDA_BROKER           MOEDA (NOLOCK)ON MOEDA.CD_MOEDA = P.CD_MOEDA_MLE '+
            '  WHERE P.CD_PRODUTO = ''01''  '+
            '    AND CLI.CD_GRUPO = ''B58'' '+
            '    AND F021.DT_REALIZACAO >= :DATAINICIAL AND F021.DT_REALIZACAO < :DATAFINAL';
end;

end.
