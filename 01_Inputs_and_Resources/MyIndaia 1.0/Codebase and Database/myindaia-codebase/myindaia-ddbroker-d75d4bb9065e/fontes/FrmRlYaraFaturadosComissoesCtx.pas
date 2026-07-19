unit FrmRlYaraFaturadosComissoesCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlYaraFaturadosComissoesCtx = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
  public
    { Public declarations }
  end;

var
  FormRlYaraFaturadosComissoesCtx: TFormRlYaraFaturadosComissoesCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlYaraFaturadosComissoesCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlYaraFaturadosComissoesCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    
    Form.TituloRelatorio := 'Faturados Yara (Comissões) - Importação';

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    Form.qryMain.SQL.Text := GetSelect;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormRlYaraFaturadosComissoesCtx.GetSelect: string;
begin
  Result :=
  '  SELECT DISTINCT                                                                                        ' + sLineBreak +
  '  CONVERT(VARCHAR(10),B.CREATED,103) AS [Data Envio]                                                     ' + sLineBreak +
  '	,Cast(ISNULL(                                                                                           ' + sLineBreak +
  '	      STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))                                               ' + sLineBreak +
  '                  FROM TREF_CLIENTE R WITH (NOLOCK)                                                      ' + sLineBreak +
  '                 WHERE R.NR_PROCESSO   = TP.NR_PROCESSO                                                   ' + sLineBreak +
  '                   AND R.TP_REFERENCIA = ''01''                                                          ' + sLineBreak +
  '         FOR XML PATH('''')), 1, 1, ''''), '''')                                                         ' + sLineBreak +
  '     as Varchar(300))  AS [Embarque]                                                                     ' + sLineBreak +
  '  ,TP.NR_DI    AS [DI]                                                                                   ' + sLineBreak +
  '  ,(SELECT  TOP 1                                                                                        ' + sLineBreak +
  '   CONVERT(VARCHAR(30),B1.NR_NOTA,103)                                                                   ' + sLineBreak +
  '   FROM MYINDAIAV2.DBO.BILLING                  B1	  (NOLOCK)                                            ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII1 (NOLOCK)ON BII1.BILLING_ID  = B1.ID                 ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.ITEMINVOICED             II1  (NOLOCK)ON II1.ID           = BII1.ITENSINVOICED_ID ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC1  (NOLOCK)ON CC1.ID           = II1.CUSTOMCLEARANCE_ID ' + sLineBreak +
  '   JOIN BROKER.DBO.TPROCESSO                    TP1  (NOLOCK)ON TP1.NR_PROCESSO  = CC1.CUSTOMID          ' + sLineBreak +
  '   WHERE B1.TYPE = ''TAX_INVOICE'' AND B1.STATUS = ''INVOICED'' AND TP1.NR_PROCESSO=TP.NR_PROCESSO    )  ' + sLineBreak +
  '                                  AS [NF Serviço]                                                        ' + sLineBreak +
  '  ,ISNULL(B.seniorKey,B.ID)		   AS [Prestação]                                                         ' + sLineBreak +
  '  ,A.NM_AREA                      AS [Unidade]                                                           ' + sLineBreak +
  '  ,LE.DESCRICAO                   AS [Porto]                                                             ' + sLineBreak +
  '	,''''                            AS [Responsável]                                                       ' + sLineBreak +
  '  ,TP.NR_PROCESSO                 AS [Ref. Indaiá]                                                       ' + sLineBreak +
  '   FROM MYINDAIAV2.DBO.BILLING               B	   (NOLOCK)                                               ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BII  (NOLOCK)ON BII.BILLING_ID  = B.ID                      ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.ITEMINVOICED          II   (NOLOCK)ON II.ID           = BII.ITENSINVOICED_ID      ' + sLineBreak +
  '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC   (NOLOCK)ON CC.ID           = II.CUSTOMCLEARANCE_ID     ' + sLineBreak +
  '   JOIN BROKER.DBO.TPROCESSO                 TP   (NOLOCK)ON TP.NR_PROCESSO  = CC.CUSTOMID               ' + sLineBreak +
  '   JOIN BROKER.DBO.TAREA                     A    (NOLOCK) ON TP.CD_AREA     = A.CD_AREA                 ' + sLineBreak +
  '   JOIN BROKER.DBO.TLOCAL_EMBARQUE           LE   (NOLOCK) ON LE.CODIGO      = TP.CD_LOCAL_DESEMBARQUE	  ' + sLineBreak +
  '  WHERE TP.CD_GRUPO = ''C05''                                                                            ' + sLineBreak +
  '    AND B.TYPE      = ''TAX_RECEIPT''                                                                    ' + sLineBreak +
  '    AND B.STATUS    = ''INVOICED''                                                                       ' + sLineBreak +
  '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)          + sLineBreak +

  //'  GROUP BY NR_PROCESSO, DT_EMISSAO, NR_DI,NM_AREA ,LOCAL_DESEMBARQUE, PRESTACAO                          ' + sLineBreak +
  '  ORDER BY NR_PROCESSO                                                                                   ' + sLineBreak ;
end;



end.
