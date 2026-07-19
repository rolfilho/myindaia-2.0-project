unit uConsultaNFsCargilCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DMLeiaute, DBCtrls, CheckLst;

type
  TPeriodo = class
    DataInicial: TdateTime;
    DataFinal: TdateTime;
  end;

  TOpcoesCtx = class
  public
    //Numero do processo, Numero da LI, Status, Data de registro da LI, data de deferimento
    UnidaDeNegocio: string;
    NrProcesso: string;

    Leiaute: string;
    constructor Create;
    destructor Destroy; override;
  end;

  TfmConsultaNFsCargilCtx = class(TForm)
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    chkProcessos: TCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Executa(Opcoes: TOpcoesCtx): Boolean;
  end;

implementation

uses PGGP001, ConsOnLineEx, GSMLIB, Funcoes, PGGP019, PGSM119;

{$R *.dfm}

{ TfmConsultaLiCtx }

class function TfmConsultaNFsCargilCtx.Executa(Opcoes: TOpcoesCtx): Boolean;
var
  Form: TfmConsultaNFsCargilCtx;
  I: Integer;
begin
  Form := TfmConsultaNFsCargilCtx.Create(nil);
  try
    Result := Form.ShowModal = mrOk;
    if Result then
    begin
      Opcoes.UnidaDeNegocio := Form.msk_cd_unid_neg.Text;
      Opcoes.NrProcesso := Form.msk_cd_unid_neg.Text + '02' + Form.msk_nr_processo.Text;
      Opcoes.Leiaute := '';
    end;
  finally
    Form.Free;
  end;
end;

procedure TfmConsultaNFsCargilCtx.BitBtn1Click(Sender: TObject);
begin
  if Length(msk_nr_processo.Text) <> 12 then
  begin
    MessageDlg('O número do processo deve conter 12 caracteres.', mtWarning, [mbOK], 0);
    Exit;
  end;
  Close;
  ModalResult := mrOk;
end;

procedure TfmConsultaNFsCargilCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfmConsultaNFsCargilCtx.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfmConsultaNFsCargilCtx.FormActivate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  btn_co_unid_negClick(Sender);
end;

procedure TfmConsultaNFsCargilCtx.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
end;

procedure TfmConsultaNFsCargilCtx.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  try
    vListAux.Text := 'SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA '+
      'FROM TPROCESSO PR ( NOLOCK ) '+
      '  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE AND EN.CD_GRUPO = ''B58'' '+
      'WHERE CD_PRODUTO  = ''02''' +
      '  AND CD_UNID_NEG = '+ QuotedStr(msk_cd_unid_neg.Text) +
      '  AND PR.IN_CANCELADO = ' + QuotedStr('0');
    if chkProcessos.Checked then
      vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
    msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  finally
    vListAux.Free;
  end;
end;

{ TOpcoesCtx }

constructor TOpcoesCtx.Create;
begin

end;

destructor TOpcoesCtx.Destroy;
begin

  inherited;
end;

end.
