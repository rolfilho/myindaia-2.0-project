unit frFaturadosNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery, DB, KrCSV;

type
  TfrmFaturadosNestle = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mskDataIni: TMaskEdit;
    mskDataFin: TMaskEdit;
    SaveDialog: TSaveDialog;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    function GetSQL: string;
    procedure Executa;
  public
    { Public declarations }
  end;

var
  frmFaturadosNestle: TfrmFaturadosNestle;

implementation

uses
  uConsulta;

{$R *.dfm}

{ TfrmFaturadosNestle }

function TfrmFaturadosNestle.GetSQL: string;
begin
  Result :=
    '        SELECT ( CASE  WHEN TP.cd_produto = ''01'' THEN ''IMPO''                                               '+
    '                       WHEN TP.cd_produto = ''02'' THEN ''EXPO''                                               '+
    '                       ELSE ''VERIFICAR''                                                                      '+
    '                 END )                                                        AS A,                            '+
    '               EN.cgc_empresa                                                 AS B,                            '+
    '               bc.taxID                                                       as C,                            '+
    '               bc.name                                                        AS D,                            '+
    '               B.created                                                      AS E,                            '+
    '               B.duedate                                                      AS F,                            '+
    '               CAST((CASE WHEN B.seniorkey IS NOT NULL THEN B.seniorkey                                        '+
    '                      ELSE B.id                                                                                '+
    '                 END) AS VARCHAR) +''-''+ RIGHT(CONVERT(VARCHAR(8), GETDATE(), 1),2)                           '+
    '                 + CASE WHEN (TOTAL <0) THEN ''C'' ELSE '''' END              AS G,                            '+
//    '               STUFF(TP.NR_PROCESSO,1,4,'''')                                 AS H,                            '+

    '               CAST((CASE WHEN B.seniorkey IS NOT NULL THEN B.seniorkey                                        '+
    '                      ELSE B.id                                                                                '+
    '                 END) AS VARCHAR) +''-''+ RIGHT(CONVERT(VARCHAR(8), GETDATE(), 1),2)                           '+
    '                 + CASE WHEN (TOTAL <0) THEN ''C'' ELSE '''' END              AS H,                            '+

    '               TP.NR_CONHECIMENTO                                             AS I,                            '+
    '               Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK)      '+
    '               WHERE R.NR_PROCESSO = TP.NR_PROCESSO AND R.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO = ''01'' THEN ''01''          '+
    '               WHEN TP.CD_PRODUTO=''02'' THEN ''08''  END) FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300))  AS J,      '+
    '               TP.NR_PROCESSO                                                 AS K,                            '+
//    '               SUM(II.PRICE)                                                  AS L,                            '+
    '               SUM(II.PRICE)                                                   AS L,                            '+
    '               ''BRL''                                                        AS M,                            '+
    '               CASE WHEN LTRIM(RTRIM(ISNULL(EN.COD_INTERNO, ''''))) <> ''''                                    '+
    '                    THEN EN.COD_INTERNO                                                                        '+
    '                    ELSE ''VERIFICAR''                                                                         '+
    '               END                                                          AS N,                              '+
    '               ''posfaturamento@myindaia.com.br''                           AS O                               '+
    ' FROM  myindaiav2.dbo.billing                        B   (NOLOCK)                                              '+
    '       INNER JOIN myindaiav2.dbo.branch              bc  (NOLOCK) on bc.id=b.branch_id                         '+
    '       LEFT JOIN myindaiav2.dbo.billing_iteminvoiced BII (NOLOCK) ON BII.billing_id   = B.id                   '+
    '       LEFT JOIN myindaiav2.dbo.iteminvoiced         II  (NOLOCK) ON II.id            = BII.itensinvoiced_id   '+
    '       LEFT JOIN myindaiav2.dbo.customclearance      CC  (NOLOCK) ON CC.id            = II.customclearance_id  '+
    '       LEFT JOIN broker.dbo.tprocesso                TP  (NOLOCK) ON TP.nr_processo   = CC.customid            '+
    '       LEFT JOIN broker.dbo.tempresa_nac             EN  (NOLOCK) ON EN.cd_empresa    = TP.cd_cliente          '+
//    '       LEFT JOIN broker.dbo.tref_cliente             RC  (NOLOCK) ON RC.nr_processo   = TP.nr_processo         '+
//    '  AND RC.tp_referencia = (CASE WHEN TP.CD_PRODUTO = ''01'' THEN ''01'' WHEN TP.CD_PRODUTO=''02'' THEN ''08''  END)'+
    ' WHERE B.status        = ''INVOICED''                                                                          '+
    '       AND TP.cd_grupo = ''155''                                                                               '+
    '       AND b.type      = ''TAX_RECEIPT''                                                                       '+
    '       AND B.CREATED >= '+ DateToSQL(FDataInicial)+
    '       AND B.CREATED <  '+ DateToSQL(FDataFinal+1)+

    ' GROUP BY TP.cd_produto,                                                                                       '+
    '          bc.taxID,                                                                                            '+
    '          EN.cgc_empresa,                                                                                      '+
    '          bc.name,                                                                                             '+
    '          B.created,                                                                                           '+
    '          B.duedate,                                                                                           '+
    '          B.seniorkey,                                                                                         '+
    '          B.id,                                                                                                '+
    '          TP.nr_conhecimento,                                                                                  '+
    '          B.total,                                                                                             '+
    '          TP.cd_cliente,                                                                                       '+
    '          TP.NR_PROCESSO,                                                                                      '+
    '          EN.COD_INTERNO--, II.PRICE                                                                             '+
    ' ORDER BY B.CREATED                                                                                            ';
end;

procedure TfrmFaturadosNestle.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFaturadosNestle.BitBtn1Click(Sender: TObject);
var
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
  
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  Executa;
end;

procedure TfrmFaturadosNestle.Executa;
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Faturados Nestlé (Diário)';

    Form.Titulocoluna.Add('A=Tipo Nota');
    Form.Titulocoluna.Add('B=Nestlé CNPJ');
    Form.Titulocoluna.Add('C=CNPJ');
    Form.Titulocoluna.Add('D=Razão Social');
    Form.Titulocoluna.Add('E=Data Emissão');
    Form.Titulocoluna.Add('F=Data Vencimento');
    Form.Titulocoluna.Add('G=Referencia');
    Form.Titulocoluna.Add('H=Numero Fatura/Conhecimento');
    Form.Titulocoluna.Add('I=Número BL/AWB ou CRT');
    Form.Titulocoluna.Add('J=Referencia Cliente');
    Form.Titulocoluna.Add('K=Processo');
    Form.Titulocoluna.Add('L=Valor Nota');
    Form.Titulocoluna.Add('M=Moeda');
    Form.Titulocoluna.Add('N=Company Code');
    Form.Titulocoluna.Add('O=Email');

    Form.FormatacaoEspecial.Add('E=yyyy-mm-dd');
    Form.FormatacaoEspecial.Add('F=yyyy-mm-dd');
    Form.FormatacaoEspecial.Add('G=');
    Form.FormatacaoEspecial.Add('L=,0.00');

    Form.qryMain.SQL.Text := GetSQL;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

end.
