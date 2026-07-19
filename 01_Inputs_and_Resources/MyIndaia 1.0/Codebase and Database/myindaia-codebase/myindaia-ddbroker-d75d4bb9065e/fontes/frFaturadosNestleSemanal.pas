unit frFaturadosNestleSemanal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery, DB, KrCSV;

type
  TfrmFaturadosNestleSemanal = class(TForm)
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
  frmFaturadosNestleSemanal: TfrmFaturadosNestleSemanal;

implementation

uses
  uConsulta;

{$R *.dfm}

{ TfrmFaturadosNestleSemanal }

function TfrmFaturadosNestleSemanal.GetSQL: string;
begin
  Result :=
  ' SELECT	DISTINCT                                                                                           ' +
  '         (CASE WHEN B.SENIORKEY IS NOT NULL                                                                 ' +
  '             THEN B.SENIORKEY                                                                               ' +
  '             ELSE B.ID                                                                                      ' +
  '          END)                                                 AS A,                                        ' +
  ' 		    (CASE WHEN B.TYPE=''TAX_INVOICE'' THEN ''HONORÁRIOS''                                              ' +
  ' 		          WHEN B.TYPE=''TAX_RECEIPT'' THEN ''DESPESAS''                                                ' +
  ' 	       END)                                                 AS B,                                        ' +
  ' 		    CONVERT(VARCHAR(10),B.CREATED,21)                     AS C,		                                     ' +
  ' 		    CONVERT(VARCHAR(10),EV285.DT_REALIZACAO,21)           AS D,		                                     ' +
  ' 		    CASE WHEN B.TYPE = ''TAX_RECEIPT''                                                                 ' +
  '              THEN ''posfaturamento@myindaia.com.br''                                                       ' +
  '              ELSE ''andrea.regina@myindaia.com.br''  /*TAX_INVOICE*/                                       ' +
  '         END                                                   AS E						                             ' +
  ' FROM MYINDAIAV2.DBO.Billing                   B    (NOLOCK)                                                ' +
  ' LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced BII  (NOLOCK) ON BII.Billing_id    = B.id                    ' +
  ' LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced         II   (NOLOCK) ON II.id             = BII.itensInvoiced_id    ' +
  ' LEFT JOIN MYINDAIAV2.DBO.CustomClearance      CC   (NOLOCK) ON CC.ID             = II.customClearance_id   ' +
  ' LEFT JOIN BROKER.DBO.TPROCESSO                TP   (NOLOCK) ON TP.NR_PROCESSO    = CC.customID             ' +
  ' LEFT JOIN BROKER.DBO.TFOLLOWUP                EV285(NOLOCK) ON EV285.NR_PROCESSO = TP.NR_PROCESSO          ' +
  '                                                            AND EV285.CD_EVENTO   =''285''                  ' +
  '                                                                                                            ' +
  ' WHERE B.STATUS   =''INVOICED''                                                                             ' +
  '   AND TP.CD_GRUPO=''155''                                                                                  ' +
  '       AND B.CREATED >= '+ DateToSQL(FDataInicial)+
  '       AND B.CREATED <  '+ DateToSQL(FDataFinal+1)+
  ' ORDER BY CONVERT(VARCHAR(10), B.CREATED, 21) ';
end;

procedure TfrmFaturadosNestleSemanal.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFaturadosNestleSemanal.BitBtn1Click(Sender: TObject);
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

procedure TfrmFaturadosNestleSemanal.Executa;
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Faturados Nestlé (Semanal)';

    Form.Titulocoluna.Add('A=Número Nota');
    Form.Titulocoluna.Add('B=Tipo Nota');
    Form.Titulocoluna.Add('C=Data Emissão');
    Form.Titulocoluna.Add('D=Data Envio');
    Form.Titulocoluna.Add('E=Remetente');
    
    Form.qryMain.SQL.Text := GetSQL;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

end.
