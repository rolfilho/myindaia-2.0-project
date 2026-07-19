unit FrNumerariosYara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, KrQuery, ComObj, FMTBcd,
  DBXpress, DB, SqlExpr, Provider, DBClient, DBCtrls;

type
  TfrmNumerariosYara = class(TForm)
    Label1: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    procedure Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
    function GetSQL: string;
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalSQLQuery);
  end;

var
  frmNumerariosYara: TfrmNumerariosYara;

implementation

uses
  KrUtil, MaskUtils, KrCSV;


{$R *.dfm}


{ TfrmNumerariosYara }

function TfrmNumerariosYara.GetSQL: string;
var
  Sql : String;
begin
  Sql :=
 ' WITH CTE AS(                                                                                                ' + sLineBreak +
 ' SELECT                                                                                                      ' + sLineBreak +
 ' CR.CREATED ,                                                                                                ' + sLineBreak +
 ' CR.ID,                                                                                                      ' + sLineBreak +
 ' CR.USER_ID ,                                                                                                ' + sLineBreak +
 ' TP.CD_AREA,                                                                                                 ' + sLineBreak +
 ' TP.NR_PROCESSO                                                                                              ' + sLineBreak +
 ' FROM MYINDAIAV2.DBO.CASHREQUESTED                   CR  (NOLOCK)                                            ' + sLineBreak +
 ' JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 CC  (NOLOCK)ON CC.ID          = CR.CUSTOMCLEARANCE_ID   ' + sLineBreak +
 ' JOIN BROKER.DBO.TPROCESSO                           TP  (NOLOCK)ON TP.NR_PROCESSO = CC.CUSTOMID             ' + sLineBreak +
 ' WHERE                                                                                                       ' + sLineBreak +
 ' CR.STATUS=''OPEN''                                                                                          ' + sLineBreak +
 ' AND CR.CREATED >= ' + DateToSQL(DataInicial) + ' AND CR.CREATED < ' + DateToSQL(DataFinal + 1)                + sLineBreak +
 ' AND TP.CD_GRUPO=''C05''                                                                                     ' + sLineBreak +
 ' )                                                                                                           ' + sLineBreak +
 ' SELECT  CTE.CREATED                                           AS [DATA ENVIO],                              ' + sLineBreak +
 ' 		CAST(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))                                          ' + sLineBreak +
 '                   FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK)                                              ' + sLineBreak +
 '                   WHERE R.NR_PROCESSO   = CTE.NR_PROCESSO                                                   ' + sLineBreak +
 '                     AND R.TP_REFERENCIA = ''01''                                                            ' + sLineBreak +
 '           FOR XML PATH('''')), 1, 1, ''''), '''') AS VARCHAR(300)) AS [EMBARQUE],                           ' + sLineBreak +

 '    ''INDAIÁ''                                           AS [DESPACHANTE],                                   ' + sLineBreak +
 '		''2000225456''                                       AS [VENDOR],                                        ' + sLineBreak +
 '	  ''''                                                 AS [Numero despesa],                                ' + sLineBreak +
 ' 		I.NAME                                               AS [DESPESA],                                       ' + sLineBreak +
 ' 		CI.PRICE                                             AS [VALOR],                                         ' + sLineBreak +
 ' 		A.NM_AREA                                            AS [UNIDADE],                                       ' + sLineBreak +
 ' 		U.NAME                                               AS [RESPONSÁVEL],                                   ' + sLineBreak +
 ' 		CTE.NR_PROCESSO                                      AS [OBSERVAÇÕES]			                               ' + sLineBreak +
 ' FROM CTE                                                                                                    ' + sLineBreak +
 '      JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR (NOLOCK)ON ICR.CASHREQUESTED_ID = CTE.ID       ' + sLineBreak +
 ' LEFT JOIN BROKER.DBO.TAREA                               A   (NOLOCK)ON A.CD_AREA      = CTE.CD_AREA        ' + sLineBreak +
 '      JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               CI  (NOLOCK)ON CI.ID          = ICR.ITEMS_ID       ' + sLineBreak +
 '      JOIN MYINDAIAV2.DBO.ITEM                            I   (NOLOCK)ON I.ID           = CI.ITEM_ID         ' + sLineBreak +
 '      JOIN MYINDAIAV2.DBO.AUTHUSER                        U   (NOLOCK)ON U.ID           = CTE.USER_ID        ' + sLineBreak ;

  result := sql;
end;

procedure TfrmNumerariosYara.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime);
var
  Query: TLocalSQLQuery;

begin
  Query  := AutoQuery.DBXQuery(GetSQL);
  Query.Open;

  ExportaCSV(NomeArquivo, Query);
end;


procedure TfrmNumerariosYara.BitBtn1Click(Sender: TObject);
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

  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, DataInicial, DataFinal);
    Close;
    ShowMessage('Concluído.');
  end;
end;

procedure TfrmNumerariosYara.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNumerariosYara.ExportaCSV(const NomeArquivo: string;
  Query: TLocalSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"Data Envio";'+
                          '"Embarque";'+
                          '"Despachante";'+
                          '"Vendor";'+
                          '"Numero despesa";'+
                          '"Despesa";'+
                          '"Valor";'+
                          '"Unidade";'+
                          '"Responsável";'+
                          '"Observações"';   
    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

end.



