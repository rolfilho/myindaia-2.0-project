unit frAnvisaNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery, DB, KrCSV;

type
  TfrmAnvisaNestle = class(TForm)
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
  frmAnvisaNestle: TfrmAnvisaNestle;

implementation

uses
  uConsulta;

{$R *.dfm}

{ TfrmFaturadosNestle }

function TfrmAnvisaNestle.GetSQL: string;
begin
  Result := ' SELECT DISTINCT ' + #13#10 +
            '  (CASE ' + #13#10 +
            '            WHEN TP.cd_produto = ''01'' THEN ''IMPO'' ' + #13#10 +
            '            WHEN TP.cd_produto = ''02'' THEN ''EXPO'' ' + #13#10 +
            '            ELSE ''VERIFICAR'' ' + #13#10 +
            '        END) AS A, ' + #13#10 +
            '       EN.cgc_empresa AS B, ' + #13#10 +
            '       bc.taxID AS C, ' + #13#10 +
            '       bc.name AS D, ' + #13#10 +
//            '       CONVERT(VARCHAR(10),B.created, 103) AS E, ' + #13#10 +
//            '       CONVERT(VARCHAR(10),B.duedate, 103) AS F, ' + #13#10 +
            '       B.created AS E, ' + #13#10 +
            '       B.duedate AS F, ' + #13#10 +
            '       B.ID AS G, ' + #13#10 +
            '       B.ID AS H, ' + #13#10 +
            '			TP.NR_CONHECIMENTO AS I, ' + #13#10 +
            '			Cast(ISNULL(STUFF( ' + #13#10 +
            '								(SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' + #13#10 +
            '								FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' + #13#10 +
            '								WHERE R.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
            '								AND R.TP_REFERENCIA = (CASE ' + #13#10 +
            '															WHEN TP.CD_PRODUTO = ''01'' THEN ''01'' ' + #13#10 +
            '															WHEN TP.CD_PRODUTO=''02'' THEN ''08'' ' + #13#10 +
            '														END) ' + #13#10 +
            '								FOR XML PATH('''')), 1, 1, ''''), '''') AS Varchar(300)) AS J, ' + #13#10 +
            '			TP.NR_PROCESSO AS K, ' + #13#10 +
            '			icr.PRICE AS L, ' + #13#10 +
            '			''BRL'' AS M, ' + #13#10 +
            '			CASE ' + #13#10 +
            '				WHEN LTRIM(RTRIM(ISNULL(EN.COD_INTERNO, ''''))) <> '''' THEN EN.COD_INTERNO ' + #13#10 +
            '				ELSE ''VERIFICAR'' ' + #13#10 +
            '			END AS N, ' + #13#10 +
            '			''posfaturamento@myindaia.com.br'' AS O ' + #13#10 +
            'FROM ' + #13#10 +
            'MYINDAIAV2.DBO.BILLING           B ' + #13#10 +
            'INNER JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BCR   (NOLOCK)ON BCR.Billing_id    = B.ID ' + #13#10 +
            'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR    (NOLOCK) ON CR.ID        = BCR.cashRequests_id ' + #13#10 +
            'INNER JOIN myindaiav2.dbo.branch bc (NOLOCK) ON bc.id = cr.branch_id ' + #13#10 +
            'LEFT JOIN myindaiav2.dbo.CashRequested_ItemCashRequested cri (NOLOCK) ON cri.CashRequested_id = cr.id ' + #13#10 +
            'LEFT JOIN myindaiav2.dbo.ItemCashRequested icr (NOLOCK) ON icr.id = cri.items_id ' + #13#10 +
            'LEFT JOIN myindaiav2.dbo.customclearance CC (NOLOCK) ON CC.id = cr.customClearance_id ' + #13#10 +
            'LEFT JOIN broker.dbo.tprocesso TP (NOLOCK) ON TP.nr_processo = CC.customid ' + #13#10 +
            'LEFT JOIN broker.dbo.tempresa_nac EN (NOLOCK) ON EN.cd_empresa = TP.cd_cliente ' + #13#10 +
            'WHERE ' + #13#10 +
            '  TP.cd_grupo = ''155'' ' + #13#10 +
            'AND CAST(B.CREATED AS DATE) BETWEEN CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', FDataInicial)) + ' AS DATE) AND CAST(' + QuotedStr(FormatDateTime('yyyy-mm-dd', FDataFinal)) + ' AS DATE) ' + #13#10 +
            'AND icr.ITEM_ID = 207 ' + #13#10 +
            '		 ORDER BY E ';
end;

procedure TfrmAnvisaNestle.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnvisaNestle.BitBtn1Click(Sender: TObject);
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

procedure TfrmAnvisaNestle.Executa;
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Anvisa Nestlé';

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

    Form.FormatacaoEspecial.Add('E=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('F=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('G=');
    Form.FormatacaoEspecial.Add('H=');
    Form.FormatacaoEspecial.Add('L=,0.00');

    Form.qryMain.SQL.Text := GetSQL;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

end.
