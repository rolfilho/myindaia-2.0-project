unit FrmRlBASFPagmtoAFRMM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlBASFPagmtoAFRMM = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    chbBasfSa: TCheckBox;
    chbBasfPoliuretanos: TCheckBox;
    chbChemetall: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQLSelect: string;
  public
    { Public declarations }
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  FormRlBASFPagmtoAFRMM: TFormRlBASFPagmtoAFRMM;

implementation

uses
  KrDialog, uConsulta, KrQuery;

{$R *.dfm}

procedure TFormRlBASFPagmtoAFRMM.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormRlBASFPagmtoAFRMM.GetSQLSelect: string;
begin
   sgrupo := '';
   if chbBasfSa.checked then
    if sgrupo = '' then
      sgrupo := '''002'''
    else
      sgrupo := sgrupo + ', ' + '''002''';

   if chbBasfPoliuretanos.checked then
    if sgrupo = '' then
      sgrupo := '''013'''
    else
      sgrupo := sgrupo + ', ' + '''013''';

   if chbChemetall.checked then
    if sgrupo = '' then
      sgrupo := '''559'''
    else
      sgrupo := sgrupo + ', ' + '''559''';

  Result :=   ' SELECT   EN.NM_EMPRESA                                    AS [Cliente]                                                       ' + sLineBreak +
              ' 		,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,13,2)                      AS [CNPJ (Cliente)]                                                 ' + sLineBreak +
              ' 		,CC.NM_CONTATO                                       AS [Contato]                                                        ' + sLineBreak +
              ' 		,TP.NR_PROCESSO                                      AS [Nr. Ref. Indaiá]                                                ' + sLineBreak +
              ' 		,CONVERT( VARCHAR(MAX), (STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                            ' + sLineBreak +
              '                                       FROM TREF_CLIENTE R WITH (NOLOCK)                                                      ' + sLineBreak +
              '                                      WHERE R.NR_PROCESSO   = TP.NR_PROCESSO                                                  ' + sLineBreak +
              '                                        AND R.TP_REFERENCIA = ''01''                                                          ' + sLineBreak +
              '                                   FOR XML PATH('''')), 1, 2, '''')))  AS [Nr. Pedido]                                        ' + sLineBreak +
              ' 		,CONVERT(VARCHAR(10),EV533.DT_REALIZACAO,103)        AS [Pagamento AFRMM]                                                ' + sLineBreak +
              ' 		,REPLACE(CI.PRICE,''.'','','')                       AS [Valor AFRMM]                                                    ' + sLineBreak +
              ' 		,TP.NR_PEDIDO_PGMTO_AFRMM                            AS [Protocolo]                                                      ' + sLineBreak +
              ' 		FROM BROKER.DBO.TPROCESSO                               TP    (NOLOCK)                                                   ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TFOLLOWUP                           EV533 (NOLOCK) ON EV533.NR_PROCESSO     = TP.NR_PROCESSO         ' + sLineBreak +
              '                                                                           AND EV533.CD_EVENTO       = ''533''                ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TEMPRESA_NAC                        EN    (NOLOCK) ON EN.CD_EMPRESA         = TP.CD_CLIENTE          ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO                    CC    (NOLOCK) ON CC.CD_CONTATO         = TP.CD_CONTATO          ' + sLineBreak +
              '                                                                           AND CC.CD_CLIENTE         = TP.CD_CLIENTE          ' + sLineBreak +
              '                                                                           AND CC.CD_UNID_NEG        = TP.CD_UNID_NEG         ' + sLineBreak +
              '                                                                           AND CC.CD_PRODUTO         = TP.CD_PRODUTO          ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 C     (NOLOCK) ON C.CUSTOMID            = TP.NR_PROCESSO         ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR    (NOLOCK) ON CR.CUSTOMCLEARANCE_ID = C.ID                   ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR   (NOLOCK) ON CR.ID                 = ICR.CASHREQUESTED_ID   ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               CI    (NOLOCK) ON CI.ID                 = ICR.ITEMS_ID           ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.ITEM                            IC    (NOLOCK) ON IC.ID                 = CI.ITEM_ID             ' + sLineBreak +
              '                                                                                                                              ' + sLineBreak +
              ' WHERE TP.CD_GRUPO IN ('+sGrupo+')                                                                                            ' + sLineBreak +
              '   AND IC.ID IN (''1'',''2'')                                                                                                 ' + sLineBreak +
              '   AND EV533.DT_REALIZACAO >= @DATAINICIAL AND EV533.DT_REALIZACAO <= @DATAFINAL                                              ' + sLineBreak +
              ' ORDER BY TP.NR_PROCESSO                                                                                                      ' + sLineBreak ;
end;

procedure TFormRlBASFPagmtoAFRMM.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  SQL: string;
begin
  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;

  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := sEmpresa + ' Pagamento AFRMM';
    DataInicial          := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal            := StrToDateTimeDef(mskDataregistroFin.Text, 0);

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        Warning('Data inicial de Solicitação maior que a data final.');
        Exit;
      end;

      SQL := GetSQLSelect;
      SQL := StringReplace(SQL, '@DATAINICIAL',  DateToSQL(DataInicial), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, '@DATAFINAL',    DateToSQL(DataFinal + 1), [rfReplaceAll, rfIgnoreCase]);
    end;

    Form.qryMain.SQL.Text := SQL;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlBASFPagmtoAFRMM.FormShow(Sender: TObject);
begin
  Self.Caption := sEmpresa + ' Pagamento AFRMM';
end;

end.
