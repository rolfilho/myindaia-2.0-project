unit FrNumerariosNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery;

type
  TfrmNumerariosNestle = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    Label3: TLabel;
    cbxProduto: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetSQL: string;
    procedure Monta(const NomeArquivo: string; DataInicial,
      DataFinal: TDateTime; const Produto: string);
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalQuery);
  public
    { Public declarations }
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  frmNumerariosNestle: TfrmNumerariosNestle;

implementation

uses
  KrCSV;

{$R *.dfm}

{ TForm3 }

function TfrmNumerariosNestle.GetSQL: string;
begin
   sgrupo := '''155'',''C55''';

   result :=
          ' DECLARE @TEMP_NUMERARIOS TABLE (                                                                                                       '+ sLineBreak +
          '         NR_PROCESSO VARCHAR(18),                                                                                                       '+ sLineBreak +
          '         DESPESA VARCHAR(200),                                                                                                          '+ sLineBreak +
          '         VALOR_DESPESA NUMERIC(15,2),                                                                                                   '+ sLineBreak +
          '         FAVORECIDO VARCHAR(9),                                                                                                        '+ sLineBreak +
          '         USUARIO VARCHAR(100),                                                                                                          '+ sLineBreak +
          '         REFERP VARCHAR(20)                                                                                                             '+ sLineBreak +
          ' )                                                                                                                                      '+ sLineBreak +
          '  INSERT INTO @TEMP_NUMERARIOS                                                                                                          '+ sLineBreak +
          '  SELECT CC.CUSTOMID                                                     AS NR_PROCESSO,                                                '+ sLineBreak +
          '         I.NAME                                                          AS DESPESA,                                                    '+ sLineBreak +
          '         CI.PRICE                                                        AS VALOR_DESPESA,                                              '+ sLineBreak +
          '         ''100323675''                                                   AS FAVORECIDO,                                                 '+ sLineBreak +
          '         U.NAME                                                          AS USUARIO,                                                    '+ sLineBreak +
          '         CR.SENIORKEY +''S01''                                           AS REFERP                                                      '+ sLineBreak +
          '     FROM MYINDAIAV2.DBO.CASHREQUESTED                           CR     WITH(NOLOCK)                                                    '+ sLineBreak +
          '     INNER  JOIN MYINDAIAV2.DBO.AUTHUSER                         U      WITH(NOLOCK) ON U.ID                 = CR.USER_ID               '+ sLineBreak +
          '     INNER  JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                  CC     WITH(NOLOCK) ON CC.ID             	  = CR.CUSTOMCLEARANCE_ID    '+ sLineBreak +
          '     LEFT   JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED  ICR    WITH(NOLOCK) ON ICR.CASHREQUESTED_ID = CR.ID                    '+ sLineBreak +
          '     LEFT   JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED 			          CI     WITH(NOLOCK) ON CI.ID                = ICR.ITEMS_ID             '+ sLineBreak +
          '     LEFT   JOIN MYINDAIAV2.DBO.ITEM              			          I      WITH(NOLOCK) ON I.ID                 = CI.ITEM_ID               '+ sLineBreak +
          '  WHERE  CR.STATUS = ''OPEN''                                                                                                           '+ sLineBreak +
          '    AND (CR.CREATED >= :DATAINICIAL AND CR.CREATED < :DATAFINAL)                                                                        '+ sLineBreak +
          '                                                                                                                                        '+ sLineBreak +
          '                                                                                                                                        '+ sLineBreak +
          '  SELECT EN.NM_EMPRESA                                                   AS NM_EMPRESA,                                                 '+ sLineBreak +
          '         SUBSTRING(EN.CGC_EMPRESA, 1, 2) + ''.'' +                                                                                      '+ sLineBreak +
          '         SUBSTRING(EN.CGC_EMPRESA, 3, 3) + ''.'' +                                                                                      '+ sLineBreak +
          '         SUBSTRING(EN.CGC_EMPRESA, 6, 3) + ''/'' +                                                                                      '+ sLineBreak +
          '         SUBSTRING(EN.CGC_EMPRESA, 9, 4) + ''-'' +                                                                                      '+ sLineBreak +
          '         SUBSTRING(EN.CGC_EMPRESA, 13, 2)        					               AS CNPJ,                                                      '+ sLineBreak +
          '         CONVERT(VARCHAR(500),STUFF((SELECT DISTINCT '', '' +                                                                           '+ sLineBreak +
          ' 		                                    LTRIM(RTRIM(R.CD_REFERENCIA))                                                                  '+ sLineBreak +
          '                  FROM TREF_CLIENTE R WITH (NOLOCK)                                                                                     '+ sLineBreak +
          '                 WHERE R.NR_PROCESSO = TP.NR_PROCESSO                                                                                   '+ sLineBreak +
          '                   AND R.TP_REFERENCIA  = (CASE WHEN TP.CD_PRODUTO=''01'' THEN ''01'' ELSE ''08'' END)                                                                                        '+ sLineBreak +
          '         FOR XML PATH('''')), 1, 1, ''''))                                AS REFNESTLE,                                                 '+ sLineBreak +
          '         TP.NR_PROCESSO                                                   AS REFBROKER,                                                 '+ sLineBreak +
//          '         X.DESPESA                                                        AS DESPESA,                                                   '+ sLineBreak +
          '         X.VALOR_DESPESA                                                  AS VALOR_DESPESA,                                             '+ sLineBreak +
          '         REP.NM_EMPRESA                                                   AS INDAIA,                                                    '+ sLineBreak +
          '         X.FAVORECIDO                                                     AS FAVORECIDO,                                                '+ sLineBreak +
          '         X.USUARIO                                                        AS USUARIO,                                                   '+ sLineBreak +
          '         X.REFERP                                                         AS REFERP,                                                    '+ sLineBreak +
          '         ''SANTOS''                                                       AS INDAIAFIXO                                                '+ sLineBreak +
          '  FROM @TEMP_NUMERARIOS X                                                                                                               '+ sLineBreak +
          '     INNER  JOIN BROKER.DBO.TPROCESSO                            TP     WITH(NOLOCK) ON TP.NR_PROCESSO    = X.NR_PROCESSO               '+ sLineBreak +
          '     INNER  JOIN BROKER.DBO.TPRODUTO                             P      WITH(NOLOCK) ON P.CD_PRODUTO      = TP.CD_PRODUTO               '+ sLineBreak +
          '     LEFT   JOIN BROKER.DBO.TEMPRESA_NAC                         EN     WITH(NOLOCK) ON EN.CD_EMPRESA     = TP.CD_CLIENTE               '+ sLineBreak +
          '     LEFT   JOIN BROKER.DBO.TEMPRESA_NAC                         REP    WITH(NOLOCK) ON REP.CD_EMPRESA    = TP.CD_REPRESENTANTE         '+ sLineBreak +
          '   WHERE P.CD_PRODUTO = :CD_PRODUTO                                                                                                     '+ sLineBreak +
          '     AND (TP.CD_GRUPO in ('+sGrupo+'))                                                                                                  '+ sLineBreak ;
end;

procedure TfrmNumerariosNestle.ExportaCSV(const NomeArquivo: string;
  Query: TLocalQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"Nome Cliente ";'+
                          '"CNPJ '+sEmpresa+'";'+
                          '"Ref. '+sEmpresa+'";'+
                          '"Ref. Indaiá";'+
                         // '"Despesa";'+
                          '"Valor Despesas";'+
                          '"Favorecido";'+
                          '"SAP";'+
                          '"Usuário";'+
                          '"Ref. ERP";'+
                          '"INDAIA"';

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmNumerariosNestle.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime; const Produto: string);
var
  Query: TLocalQuery;
begin
  Query := AutoQuery.Query(GetSQL);
  Query.ParamByName('DATAINICIAL').AsDateTime := DataInicial;
  Query.ParamByName('DATAFINAL').AsDateTime   := DataFinal + 1;
  Query.ParamByName('CD_PRODUTO').AsString    := Produto;
  Query.Open;
  ExportaCSV(NomeArquivo, Query);
end;

procedure TfrmNumerariosNestle.BitBtn1Click(Sender: TObject);
var
  Produto: string;
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin
  DataInicial := StrToDateTimeDef(mskDataIni.Text,0);
  DataFinal   := StrToDateTimeDef(mskDataFin.Text,0);

  if DataInicial = 0 then
  begin
    ShowMessage('Data inicial não informada.');
    Exit;
  end;
  if DataFinal = 0 then
  begin
    ShowMessage('Data final não informada.');
    Exit;
  end;
  if DataInicial > DataInicial then
  begin
    ShowMessage('Data inicial maior que data final.');
    Exit;
  end;

  Produto := Copy(cbxProduto.Items.Strings[cbxProduto.ItemIndex], 1, 2);
  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, DataInicial, DataFinal, Produto);
    Close;
    ShowMessage('Concluído.');
  end;   
end;

procedure TfrmNumerariosNestle.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNumerariosNestle.FormShow(Sender: TObject);
begin
  Self.Caption := 'Numerários ' + sEmpresa;
end;

end.
