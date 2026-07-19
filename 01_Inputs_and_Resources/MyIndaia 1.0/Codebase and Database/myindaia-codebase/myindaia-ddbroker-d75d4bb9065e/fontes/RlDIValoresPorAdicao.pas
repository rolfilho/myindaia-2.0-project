unit RlDIValoresPorAdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RlBasicCab, RLReport, dxGDIPlusClasses, KrQuery, DB;

type
  TfrmRlDIValoresPorAdicao = class(TfrmRLBasicCab)
    dsMain: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    rllbAdicao: TRLLabel;
    RLDBText1: TRLDBText;
    rllbFrete: TRLLabel;
    RLDBText2: TRLDBText;
    rllbSeguro: TRLLabel;
    RLDBText3: TRLDBText;
    rllbTUS: TRLLabel;
    RLDBText4: TRLDBText;
    rllbAcrescimos: TRLLabel;
    RLDBText5: TRLDBText;
    rllbII: TRLLabel;
    RLDBText6: TRLDBText;
    rllbIPI: TRLLabel;
    RLDBText7: TRLDBText;
    rllbPIS: TRLLabel;
    RLDBText8: TRLDBText;
    rllbCofins: TRLLabel;
    RLDBText9: TRLDBText;
    rllbICMS: TRLLabel;
    RLDBText10: TRLDBText;
    rllbAFRMM: TRLLabel;
    RLDBText11: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    procedure FormCreate(Sender: TObject);
  private
    Query: TLocalQuery;
  public
    procedure PreparaDataSet(const NR_Processo: string);
    procedure GerarCSV(const NomeArquivo: string);
  end;

var
  frmRlDIValoresPorAdicao: TfrmRlDIValoresPorAdicao;

implementation

uses MaskUtils, KrCSV;

{$R *.dfm}

procedure TfrmRlDIValoresPorAdicao.FormCreate(Sender: TObject);
begin
  inherited;
  Query := TLocalQuery.Create(Self);
  dsMain.DataSet := Query;
end;

function GetSQL: string;
begin
  Result := 'SELECT	 A.NR_PROCESSO, '+
    'A.NR_ADICAO'+
		',A.VL_FRETE_MERC_MN'+
		',A.VL_SEG_MERC_MN'+
		',A.VL_TX_SCX_AD'+
		',A.VL_ACRESCIMOS_MN'+
		',T1.VL_IPT_A_RECOLHER as II'+
		',T2.VL_IPT_A_RECOLHER as IPI'+
		',A.VL_PIS '+
		',A.VL_COFINS '+
		',A.VL_ICMS_A_RECOLHER_AFRMM '+
		',A.VL_AFRMM '+
	  ',EE.NM_EMPRESA '+
   'FROM TADICAO_DE_IMPORTACAO A '+
   'INNER JOIN TRIBUTO T1 ON T1.NR_PROCESSO=A.NR_PROCESSO AND T1.NR_ADICAO=A.NR_ADICAO AND T1.CD_RECEITA_IMPOSTO = ' + QuotedStr('0001')+
   'INNER JOIN TRIBUTO T2 ON T2.NR_PROCESSO=A.NR_PROCESSO AND T2.NR_ADICAO=A.NR_ADICAO AND T2.CD_RECEITA_IMPOSTO = ' + QuotedStr('0002')+
   'INNER JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = A.CD_FORNECEDOR '+
   'WHERE A.NR_PROCESSO = :NR_PROCESSO '+
   'ORDER BY A.NR_ADICAO '; 
end;

procedure TfrmRlDIValoresPorAdicao.GerarCSV(const NomeArquivo: string);
var
  CSV: TCSV;
begin
  CSV := TCSV.Create;
  try
    CSV.Cabecalho.Text := 'Ref_Indaia;Adição;Frete;Seguro;TUS;Acrescimos;II;IPI;PIS;COFINS;ICMS;AFRMM;EXPORTADOR';
    CSV.ConvertCSV(Query, NomeArquivo, False);
  finally
    CSV.Free;
  end;
end;

procedure TfrmRlDIValoresPorAdicao.PreparaDataSet(const NR_Processo: string);
begin
  Query.SQL.Text := GetSQL;
  Query.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  Query.Open;
  Query.FetchAll;
  Filtros.Add('Exportador: ' + Query.FieldByName('NM_EMPRESA').AsString);
end;

end.
