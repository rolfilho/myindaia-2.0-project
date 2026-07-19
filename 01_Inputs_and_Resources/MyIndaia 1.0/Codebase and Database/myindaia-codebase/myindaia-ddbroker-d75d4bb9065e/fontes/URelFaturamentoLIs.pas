unit URelFaturamentoLIs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery, FMTBcd, DBXpress,
  DB, SqlExpr;

type
  TfrmRelFaturamentoLIs = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    qryDados: TSQLQuery;
    SQLConnection: TSQLConnection;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    function GetSQL: string;
    procedure Monta(const NomeArquivo: string; DataInicial,
      DataFinal: TDateTime; const Produto: string);
    procedure ExportaCSV(const NomeArquivo: string; Query: TSQLQuery);
  public
    { Public declarations }
    DataInicial_Filtro , DataFinal_Filtro :String;
  end;

var
  frmRelFaturamentoLIs: TfrmRelFaturamentoLIs;

implementation

uses
  KrCSV;

{$R *.dfm}

{ TForm3 }

function TfrmRelFaturamentoLIs.GetSQL: string;
begin
   result :=
   ' SELECT CONVERT(VARCHAR(1000),                                                                                                          ' + sLineBreak +
   '        CASE                                                                                                                            ' + sLineBreak +
   '    		WHEN IIVV.ID=''212'' THEN                                                                                                       ' + sLineBreak +
   '            STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(A.NR_LI))                                                                        ' + sLineBreak +
   '                     FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK)                                                         ' + sLineBreak +
   '                    WHERE A.NR_PROCESSO      = TP.NR_PROCESSO                                                                           ' + sLineBreak +
   '                      AND A.CD_ORGAO_ANUENTE = ''INMETRO''                                                                              ' + sLineBreak +
   '                    FOR XML PATH('''') ), 1, 1, '''')                                                                                   ' + sLineBreak +
   '                    	                                                                                                                  ' + sLineBreak +
   '    		WHEN IIVV.ID=''230'' THEN                                                                                                       ' + sLineBreak +
   '            STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(A.NR_LI))                                                                        ' + sLineBreak +
   '                     FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK)                                                         ' + sLineBreak + 
   '                    WHERE A.NR_PROCESSO       = TP.NR_PROCESSO                                                                          ' + sLineBreak +
   '                      AND A.CD_ORGAO_ANUENTE  = ''DECEX''                                                                               ' + sLineBreak +
   '                     FOR XML PATH('''') ), 1, 1, '''')                                                                                  ' + sLineBreak +
   '                                                                                                                                        ' + sLineBreak +
   '    		WHEN IIVV.ID=''207'' THEN                                                                                                       ' + sLineBreak +
   '            STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(A.NR_LI))                                                                        ' + sLineBreak + 
   '                     FROM BROKER.DBO.TPROCESSO_LI_ORGAO_ANUENTE A WITH (NOLOCK)                                                         ' + sLineBreak +
   '                    WHERE A.NR_PROCESSO       = TP.NR_PROCESSO                                                                          ' + sLineBreak +
   '                      AND A.CD_ORGAO_ANUENTE  = ''ANVISA''                                                                              ' + sLineBreak +
   '                    FOR XML PATH('''') ), 1, 1, '''') 	                                                                                ' + sLineBreak +
   '                                                                                                                                        ' + sLineBreak +
   '    		END )                                                             AS LI,	                                                      ' + sLineBreak +
   '    	                                                                                                                                  ' + sLineBreak +
   '    		CASE                                                                                                                            ' + sLineBreak +
   '    		WHEN IIVV.ID=''212'' THEN ''ANUENCIA INMETRO''                                                                                  ' + sLineBreak +
   '    		WHEN IIVV.ID=''230'' THEN ''ANUENCIA DECEX''                                                                                    ' + sLineBreak +
   '    		WHEN IIVV.ID=''207'' THEN ''ANUENCIA ANVISA''                                                                                   ' + sLineBreak +
   '    		END		                                                            AS DESPESA,                                                   ' + sLineBreak +
   '                                                                                                                                        ' + sLineBreak +
   '    		REPLACE(IIV.PRICE,''.'','','')                                    AS VALOR,                                                     ' + sLineBreak +
   '    		B.SENIORKEY                                                       AS NR_FATURA,                                                 ' + sLineBreak +
   '    		TP.NR_PROCESSO                                                    AS OBSERVACAO,                                                ' + sLineBreak +
   '    		                                                                                                                                ' + sLineBreak +
   '        CONVERT(VARCHAR(1000),                                                                                                          ' + sLineBreak +
   '               STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(RC.CD_REFERENCIA))                                                            ' + sLineBreak +
   '                 FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK)                                                                          ' + sLineBreak +
   '                WHERE RC.NR_PROCESSO   = TP.NR_PROCESSO                                                                                 ' + sLineBreak +
   '                  AND RC.TP_REFERENCIA = ''04''                                                                                         ' + sLineBreak +
   '                FOR XML PATH('''') ), 1, 1, ''''))                         AS REF	                                                      ' + sLineBreak +
   '    		                                                                                                                                ' + sLineBreak +
   '     FROM MYINDAIAV2.DBO.BILLING                               B       (NOLOCK)                                                         ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED                  BII     (NOLOCK)  ON BII.BILLING_ID           = B.ID                     ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.ITEMINVOICED                          II      (NOLOCK)  ON II.ID                    = BII.ITENSINVOICED_ID     ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED              BPR     (NOLOCK)  ON BPR.BILLING_ID           = B.ID                     ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR      (NOLOCK)  ON PR.ID                    = BPR.PAYMENTS_ID          ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PIPR    (NOLOCK)  ON PIPR.PAYMENTREQUESTED_ID = PR.ID                    ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IR      (NOLOCK)  ON IR.ID                    = PIPR.ITEMS_ID            ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.ITEM                                  I       (NOLOCK)  ON I.ID                     = IR.ITEM_ID               ' + sLineBreak +
   '                                                                                                                                        ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED                  IV      (NOLOCK)  ON IV.BILLING_ID            = B.ID                     ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.ITEMINVOICED                          IIV     (NOLOCK)  ON IIV.ID                   = IV.ITENSINVOICED_ID      ' + sLineBreak +
   '     JOIN MYINDAIAV2.DBO.ITEM                                  IIVV    (NOLOCK)  ON IIVV.ID                  = IIV.ITEM_ID              ' + sLineBreak + 
   '                                                                                                                                        ' + sLineBreak + 
   '     JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                       CC      (NOLOCK)  ON CC.ID                    = IIV.CUSTOMCLEARANCE_ID   ' + sLineBreak + 
   '     JOIN BROKER.DBO.TPROCESSO                                 TP      (NOLOCK)  ON TP.NR_PROCESSO           = CC.CUSTOMID              ' + sLineBreak + 
   '                                                                                                                                        ' + sLineBreak + 
   '    WHERE B.STATUS      = ''INVOICED''                                                                                                  ' + sLineBreak + 
   '      AND TP.CD_GRUPO   = ''B94''                                                                                                       ' + sLineBreak + 
   '      AND TP.CD_PRODUTO = ''01''                                                                                                        ' + sLineBreak + 
   '      AND B.TYPE        = ''TAX_RECEIPT''                                                                                               ' + sLineBreak +
   '      AND IIVV.ID IN (''212'',''230'',''207'')                                                                                          ' + sLineBreak +
   '                                                                                                                                        ' + sLineBreak +
   '     AND B.CREATED >= '+ QuotedStr(DataInicial_Filtro)                                                                                    + sLineBreak +
   '     AND B.CREATED <  '+ QuotedStr(DataFinal_Filtro)                                                                                      + sLineBreak +
   '    GROUP BY	IIVV.ID,                                                                                                                  ' + sLineBreak +
   '    			    IIV.PRICE,                                                                                                                ' + sLineBreak +
   '    			    B.SENIORKEY,                                                                                                              ' + sLineBreak +
   '    			    TP.NR_PROCESSO	                                                                                                          ' + sLineBreak +
   '    			                                                                                                                              ' + sLineBreak +
   '    ORDER BY TP.NR_PROCESSO,DESPESA                                                                                                     ' + sLineBreak ;

end;

procedure TfrmRelFaturamentoLIs.ExportaCSV(const NomeArquivo: string;
  Query: TSQLQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"LI";'+                          
                          '"Despesa";'+
                          '"Valor (R$)";'+
                          '"Número Fatura";'+
                          '"Observação";'+
                          '"Ref. Cliente (IMPEX)"';
    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmRelFaturamentoLIs.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime; const Produto: string);
begin
  qryDados.close;
  qryDados.sql.text := GetSQL;
  qryDados.Open;
  ExportaCSV(NomeArquivo, qryDados);
end;

procedure TfrmRelFaturamentoLIs.BitBtn1Click(Sender: TObject);
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

  DataInicial_Filtro := FormatDateTime('yyyy/mm/dd', StrtoDate(mskDataIni.text))+ ' 00:00';
  DataFinal_Filtro   := FormatDateTime('yyyy/mm/dd', StrtoDate(mskDataFin.text))+ ' 23:59';

  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, DataInicial, DataFinal, Produto);
    Close;
    ShowMessage('Concluído.');
  end;   
end;

procedure TfrmRelFaturamentoLIs.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
