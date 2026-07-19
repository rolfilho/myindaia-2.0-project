unit FrNumerariosBASF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, KrQuery;

type
  TfrmNumerariosBASF = class(TForm)
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
    chbBasfSa: TCheckBox;
    chbBasfPoliuretanos: TCheckBox;
    chbChemetall: TCheckBox;
    chbCatalisadores: TCheckBox;
    chbTodos: TCheckBox;
    chbSuvinil: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
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
  frmNumerariosBASF: TfrmNumerariosBASF;

implementation

uses
  KrCSV;

{$R *.dfm}

{ TForm3 }

function TfrmNumerariosBASF.GetSQL: string;
var ssql : string;
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

   if chbSuvinil.checked then
    if sgrupo = '' then
      sgrupo := '''D28'''
    else
      sgrupo := sgrupo + ', ' + '''D28''';
                     
   if chbCatalisadores.checked then
    if sgrupo = '' then
      sgrupo := '''C74'''
    else
      sgrupo := sgrupo + ', ' + '''C74''';

   ssql :=
    ' SELECT A.NM_AREA                               						           AS AREA,                                                    ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA, 1, 2) + ''.'' +                                                                                 ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA, 3, 3) + ''.'' +                                                                                 ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA, 6, 3) + ''/'' +                                                                                 ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA, 9, 4) + ''-'' +                                                                                 ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA, 13, 2)        						           AS CNPJ,                                                    ' + sLineBreak +
    '        TP.NR_PROCESSO                          						           AS REFBROKER,                                               ' + sLineBreak +
    '        Convert(Varchar(500),STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                        ' + sLineBreak +
    '                 FROM TREF_CLIENTE R WITH (NOLOCK)                                                                                ' + sLineBreak +
    '                WHERE R.NR_PROCESSO 		 = TP.NR_PROCESSO                                                                          ' + sLineBreak +
    '                  AND (R.TP_REFERENCIA  = ''01''                                                                                  ' + sLineBreak +
    '                   OR  R.TP_REFERENCIA  = ''19'')                                                                                 ' + sLineBreak +
    '        FOR XML PATH('''')), 1, 1, ''''))                             AS REFBASF,                                                 ' + sLineBreak +
    '        CONVERT(VARCHAR(10),EV161.DT_REALIZACAO,103)                  AS [ETA],                                                   ' + sLineBreak +
    '        CONVERT(VARCHAR(10),EV416.DT_REALIZACAO,103)                  AS [ANALISE DOCUMENTAL],                                    ' + sLineBreak +
    '        CONVERT(VARCHAR(10),EV018.DT_REALIZACAO,103)                  AS [SOLICITACAO_NUM],                                       ' + sLineBreak +
    '        CONVERT(VARCHAR(10),EV178.DT_REALIZACAO,103)                  AS [ENVIO_SOLICITACAO_NUM],                                 ' + sLineBreak +
    '        ISNULL(DBO.FN_KPI_CORRIDOS(EV161.DT_REALIZACAO,GETDATE()),'''') AS [KPI_ETA_HOJE],                                        ' + sLineBreak +
    '        P.NM_PRODUTO     												                     AS SERVICO,                                                 ' + sLineBreak +
    '        VT.NM_VIA_TRANSP 											 	                     AS MODAL,                                                   ' + sLineBreak +
    '        TP.CD_INCOTERM   												                     AS INCOTERM,                                                ' + sLineBreak +
    '        I.NAME                                                        AS DESPESA,                                                 ' + sLineBreak +
    '        CI.PRICE                                                      AS VALOR_DESPESA,                                           ' + sLineBreak +
    '        U.NAME                                                        AS USUARIO,                                                 ' + sLineBreak +
    '        CR.SENIORKEY +''S01''                                         AS REFERP                                                   ' + sLineBreak +
    '    FROM MYINDAIAV2.DBO.CASHREQUESTED                           CR     WITH(NOLOCK)                                               ' + sLineBreak +
    '    LEFT   JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED  ICR    WITH(NOLOCK) ON CR.ID          	  =  ICR.CASHREQUESTED_ID  ' + sLineBreak +
    '    LEFT   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                  CC     WITH(NOLOCK) ON CC.ID          	  =  CR.CUSTOMCLEARANCE_ID ' + sLineBreak +
    '    INNER  JOIN BROKER.DBO.TPROCESSO                            TP     WITH(NOLOCK) ON TP.NR_PROCESSO 	  =  CC.CUSTOMID           ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TAREA                                A      WITH(NOLOCK) ON A.CD_AREA      	  =  TP.CD_AREA            ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TEMPRESA_NAC                         EN     WITH(NOLOCK) ON EN.CD_EMPRESA  	  =  TP.CD_CLIENTE         ' + sLineBreak +
    '    INNER  JOIN BROKER.DBO.TPRODUTO           					         P      WITH(NOLOCK) ON P.CD_PRODUTO      =  TP.CD_PRODUTO         ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TSERVICO_NOVO      					         SN     WITH(NOLOCK) ON SN.CD_SERVICO     =  TP.CD_SERVICO         ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TVIA_TRANSP_BROKER 					         VT     WITH(NOLOCK) ON VT.CD_VIA_TRANSP  =  SN.CD_VIA_TRANSPORTE  ' + sLineBreak +
    '    LEFT   JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED 			         CI     WITH(NOLOCK) ON CI.ID             =  ICR.ITEMS_ID          ' + sLineBreak +
    '    LEFT   JOIN MYINDAIAV2.DBO.ITEM              			         I      WITH(NOLOCK) ON I.ID              =  CI.ITEM_ID            ' + sLineBreak +
    '    LEFT   JOIN MYINDAIAV2.DBO.AUTHUSER                         U      WITH(NOLOCK) ON U.ID              =  CR.USER_ID            ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TFOLLOWUP                            EV018  WITH(NOLOCK) ON EV018.NR_PROCESSO =  TP.NR_PROCESSO        ' + sLineBreak +
    '                                                                                   AND EV018.CD_EVENTO    =  ''018''              ' + sLineBreak +
    '                                                                                   AND EV018.CD_SERVICO   =  TP.CD_SERVICO        ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TFOLLOWUP                            EV161  WITH(NOLOCK) ON EV161.NR_PROCESSO =  TP.NR_PROCESSO        ' + sLineBreak +
    '                                                                                   AND EV161.CD_EVENTO    =  ''161''              ' + sLineBreak +
    '                                                                                   AND EV161.CD_SERVICO   =  TP.CD_SERVICO        ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TFOLLOWUP                            EV178  WITH(NOLOCK) ON EV178.NR_PROCESSO =  TP.NR_PROCESSO        ' + sLineBreak +
    '                                                                                   AND EV178.CD_EVENTO    =  ''178''              ' + sLineBreak +
    '                                                                                   AND EV178.CD_SERVICO   =  TP.CD_SERVICO        ' + sLineBreak +
    '    LEFT   JOIN BROKER.DBO.TFOLLOWUP                            EV416  WITH(NOLOCK) ON EV416.NR_PROCESSO =  TP.NR_PROCESSO        ' + sLineBreak +
    '                                                                                   AND EV416.CD_EVENTO   =  ''416''               ' + sLineBreak +
    '                                                                                   AND EV416.CD_SERVICO  =  TP.CD_SERVICO         ' + sLineBreak +
    ' WHERE  CR.STATUS = ''OPEN''                                                                                                      ' + sLineBreak +
    '   AND (CR.CREATED >= :DATAINICIAL AND CR.CREATED < :DATAFINAL)                                                                   ' + sLineBreak +
    '   AND (TP.CD_GRUPO in ('+sGrupo+'))                                                                                              ' + sLineBreak ;

    if not chbTodos.checked then
    ssql := ssql +
    '     AND P.CD_PRODUTO = :CD_PRODUTO                                                                                               ' + sLineBreak ;

    Result := ssql;
end;

procedure TfrmNumerariosBASF.ExportaCSV(const NomeArquivo: string;
  Query: TLocalQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"Área";'+
                          '"CNPJ '+sEmpresa+'";'+
                          '"Ref. Broker";'+
                          '"Ref. '+sEmpresa+'";'+
                          '"ETA";'+
                          '"Analise Documental";'+
                          '"Solicitação de Numerário";'+
                          '"Envio da Solicitação de Numerário";'+
                          '"KPI(ETA-HOJE)";'+
                          '"Serviço";'+
                          '"Modal";'+
                          '"INCOTERM";'+
                          '"Despesa";'+
                          '"Valor Despesas";'+
                          '"Usuário";'+
                          '"Ref. ERP"';

    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmNumerariosBASF.Monta(const NomeArquivo: string; DataInicial, DataFinal: TDateTime; const Produto: string);
var
  Query: TLocalQuery;
begin
  Query := AutoQuery.Query(GetSQL);
  Query.ParamByName('DATAINICIAL').AsDateTime := DataInicial;
  Query.ParamByName('DATAFINAL').AsDateTime   := DataFinal + 1;
  if not chbTodos.checked then
    Query.ParamByName('CD_PRODUTO').AsString    := Produto;
  Query.Open;
  ExportaCSV(NomeArquivo, Query);
end;

procedure TfrmNumerariosBASF.BitBtn1Click(Sender: TObject);
var
  Produto: string;
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin
  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) and (not chbCatalisadores.checked) and (not chbSuvinil.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;

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

  if not chbTodos.checked then
    Produto := Copy(cbxProduto.Items.Strings[cbxProduto.ItemIndex], 1, 2);

  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, DataInicial, DataFinal, Produto);
    Close;
    ShowMessage('Concluído.');
  end;   
end;

procedure TfrmNumerariosBASF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNumerariosBASF.FormShow(Sender: TObject);
begin
  Self.Caption := 'Numerários ' + sEmpresa;
end;

procedure TfrmNumerariosBASF.chbTodosClick(Sender: TObject);
begin
  cbxProduto.enabled := not chbTodos.checked;
end;

end.
