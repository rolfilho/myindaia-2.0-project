unit FrNumerariosNaoFaturados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, KrQuery, DBCtrls, DB, Mask, ConsOnLineEx,
  StrUtils;

type
  TfrmNumerariosNaoFaturados = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    SaveDialog: TSaveDialog;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_produto: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    QryGrupo: TLocalQuery;
    function GetSQL(const Grupo: string): string;
    procedure ExportaCSV(const NomeArquivo: string; Query: TLocalQuery);
    procedure Monta(const NomeArquivo, Grupo: string);
  public
    { Public declarations }
  end;

var
  frmNumerariosNaoFaturados: TfrmNumerariosNaoFaturados;

implementation

uses
  KrCSV;

{$R *.dfm}

{ TfrmNumerariosNaoFaturados }

function TfrmNumerariosNaoFaturados.GetSQL(const Grupo: string): string;
begin
  Result := '  SELECT CC.CUSTOMID                                 AS NUMERODOPROCESSO,                                            '+
            '         G.NM_GRUPO                                  AS GRUPO,                                                       '+
            '         CONVERT(VARCHAR(10), CR.CREATED, 103)       AS DATASOLICITACAO,                                             '+
            '         CONVERT(VARCHAR(10), CR.RECEIVEDDATE, 103)  AS DATARECEBIMENTO,                                             '+
            '         CR.SENIORKEY                                AS CODIGOSENIOR,                                                '+
            '         REPLACE(CR.CASHREQUESTTOTAL, ''.'', '','')  AS VALORTOTAL,                                                  '+
            '         ISNULL((SELECT CONVERT(VARCHAR(10), DT_REALIZACAO, 103)                                                     '+
            '                       /* + '' '' + CONVERT(VARCHAR(5), DT_REALIZACAO, 108) */                                       '+
            '           FROM BROKER.DBO.TFOLLOWUP F                                                                               '+
            '          WHERE F.NR_PROCESSO = PR.NR_PROCESSO                                                                       '+
            '            AND F.CD_EVENTO   = ''114''), '''')      AS ENVIADO_FATURAMENTO                                          '+
            '         ,A.NM_AREA                                  AS NM_AREA                                                      '+
            '  FROM   MYINDAIAV2.DBO.CASHREQUESTED                   CR  (NOLOCK)                                                 '+
            '         LEFT JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED BCR (NOLOCK)ON BCR.CASHREQUESTS_ID = CR.ID                   '+
            '         LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC  (NOLOCK)ON CC.ID               = CR.CUSTOMCLEARANCE_ID   '+
            '         LEFT JOIN BROKER.DBO.TPROCESSO                 PR  (NOLOCK)ON PR.NR_PROCESSO      = CC.CUSTOMID             '+
            '         LEFT JOIN BROKER.DBO.TGRUPO                    G   (NOLOCK)ON G.CD_GRUPO          = PR.CD_GRUPO             '+
            '         LEFT JOIN MYINDAIAV2.DBO.BILLING               B   (NOLOCK)ON B.ID                = BCR.BILLING_ID          '+
            '         LEFT JOIN BROKER.DBO.TAREA                     A   (NOLOCK)ON A.CD_AREA           = PR.CD_AREA              '+
            '  WHERE  CR.STATUS = ''APPROVED''                                                                                    '+
            '         AND B.CREATED IS NULL                                                                                       '+
            IfThen(Grupo <> '', ' AND G.CD_GRUPO = :CD_GRUPO ', '')+
            '  GROUP  BY CC.CUSTOMID,                                                                                             '+
            '            G.NM_GRUPO,                                                                                              '+
            '            CR.CREATED,                                                                                              '+
            '            CR.RECEIVEDDATE,                                                                                         '+
            '            CR.SENIORKEY,                                                                                            '+
            '            CR.CASHREQUESTTOTAL                                                                                      '+
            '           ,PR.NR_PROCESSO                                                                                           '+
            '           ,A.NM_AREA                                                                                                ';
end;

procedure TfrmNumerariosNaoFaturados.ExportaCSV(const NomeArquivo: string;
  Query: TLocalQuery);
var
  csv: TCSV;
begin
  csv := TCSV.Create;
  try
    csv.Cabecalho.Text := '"Número do Processo";'+
                          '"Grupo";'+
                          '"Data Solicitação";'+
                          '"Data Recebimento";'+
                          '"Código Senior";'+
                          '"Valor Total";'+
                          '"Enviado ao Faturamento";'+
                          '"Área"';
    csv.ConvertCSV(Query, NomeArquivo, False);
  finally
    csv.Free;
  end;
end;

procedure TfrmNumerariosNaoFaturados.Monta(const NomeArquivo: string; const Grupo: string);
var
  Query: TLocalQuery;
begin
  Query := AutoQuery.Query(GetSQL(Grupo));
  if Grupo <> '' then
    Query.ParamByName('CD_GRUPO').AsString := Grupo;
  Query.Open;
  ExportaCSV(NomeArquivo, Query);
end;

procedure TfrmNumerariosNaoFaturados.BitBtn1Click(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    Monta(SaveDialog.FileName, msk_cd_grupo.Text);
    Close;
    ShowMessage('Concluído.');
  end;
end;

procedure TfrmNumerariosNaoFaturados.FormCreate(Sender: TObject);
begin
  QryGrupo := TLocalQuery.Create(Self);
end;

procedure TfrmNumerariosNaoFaturados.msk_cd_grupoExit(Sender: TObject);
begin
  if Length(msk_cd_grupo.Text) = 3 then
  begin
    QryGrupo.SQL.Text := 'SELECT NM_GRUPO FROM TGRUPO (NOLOCK) WHERE CD_GRUPO = :CD_GRUPO';
    QryGrupo.ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    QryGrupo.Open;
    if QryGrupo.IsEmpty then
    begin
      ShowMessage('Grupo não encontrado');
      Exit;
    end;
    edt_nm_grupo.Text := QryGrupo.Fields[0].AsString;
  end;
end;

procedure TfrmNumerariosNaoFaturados.btn_co_produtoClick(Sender: TObject);
begin
  msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO');
  msk_cd_grupoExit(nil);
end;

procedure TfrmNumerariosNaoFaturados.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
