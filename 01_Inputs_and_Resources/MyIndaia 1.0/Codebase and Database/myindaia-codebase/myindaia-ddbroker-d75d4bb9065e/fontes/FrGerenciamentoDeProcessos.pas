unit FrGerenciamentoDeProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DmGerenciamentoDeProcessos,
  DB;

type
  TFormGerenciamentoDeProcessos = class(TForm)
    Panel1: TPanel;
    edConsulta: TEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    cbxNumeroProcesso: TCheckBox;
    Button1: TButton;
    Label1: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    cbxReferenciaCliente: TCheckBox;
    cbxNFSe: TCheckBox;
    cbxNotaSenior: TCheckBox;
    cbxNotaWallet: TCheckBox;
    cbxNumeroConhecimento: TCheckBox;
    DataSource1: TDataSource;
    Button3: TButton;
    Button4: TButton;
    cbxPagamentos: TCheckBox;
    cbxNumerarios: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    DM: TdmdGerenciamentoProcessos;
    function GetSQLNumerarios: string;
    function GetSQLFaturamento: string;
  public
    { Public declarations }
  end;

var
  FormGerenciamentoDeProcessos: TFormGerenciamentoDeProcessos;

implementation

uses
  uConsulta;

{$R *.dfm}

procedure TFormGerenciamentoDeProcessos.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormGerenciamentoDeProcessos.Button1Click(Sender: TObject);
begin
  DM.Filtros := [];
  if cbxNumeroProcesso.Checked then
    DM.Filtros := DM.Filtros + [fpNumeroProcesso];
  if cbxReferenciaCliente.Checked then
    DM.Filtros := DM.Filtros + [fpReferenciaCliente];
  if cbxNFSe.Checked then
    DM.Filtros := DM.Filtros + [fpNFSe];
  if cbxNotaSenior.Checked then
    DM.Filtros := DM.Filtros + [fpNotaSenior];
  if cbxNotaWallet.Checked then
    DM.Filtros := DM.Filtros + [fpNotaWallet];
  if cbxNumeroConhecimento.Checked then
    DM.Filtros := DM.Filtros + [fpNumeroConhecimento];

  if cbxPagamentos.Checked then
    DM.Filtros := DM.Filtros + [fpPagamentos];
  if cbxNumerarios.Checked then
    DM.Filtros := DM.Filtros + [fpNumerarios];

  if DM.Filtros = [] then
    MessageDlg('Nenhum filtro selecionando.', mtWarning, [mbOK], 0)
  else
    DM.Executa(edConsulta.Text);
end;

procedure TFormGerenciamentoDeProcessos.FormCreate(Sender: TObject);
begin
  DM := TdmdGerenciamentoProcessos.Create(Self);
end;

procedure TFormGerenciamentoDeProcessos.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

function TFormGerenciamentoDeProcessos.GetSQLNumerarios: string;
begin
  Result :=
    'SELECT '+
    '  CR.SENIORKEY AS [Nr. PSR], '+
    '  CR.CASHREQUESTTOTAL [Valor Total], '+
    '  CR.CREATED AS [Data Emissão], '+
    '  CASE '+
    '        WHEN CR.STATUS=''APPROVED''  THEN ''Recebido pelo Financeiro'' '+
    '        WHEN CR.STATUS=''WAIT''      THEN ''Aguardando envio para o Financeiro'' '+
    '        WHEN CR.STATUS=''OPEN''      THEN ''Em Aberto'' '+
    '        WHEN CR.STATUS=''CANCELED''  THEN ''Cancelado'' '+
    '  ELSE CR.STATUS '+
    '  END AS [Status] '+
    'FROM MYINDAIAV2.DBO.CASHREQUESTED        CR (NOLOCK)'+
    'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID=CR.CUSTOMCLEARANCE_ID '+
    'WHERE CC.CUSTOMID = '+ QuotedStr(DM.qryListaProcessosNR_PROCESSO.AsString);
end;

procedure TFormGerenciamentoDeProcessos.Button3Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Numerários';
    Form.qryMain.SQL.Text := GetSQLNumerarios;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormGerenciamentoDeProcessos.GetSQLFaturamento: string;
begin
  Result :=
    '   SELECT '+
    '      CC.CUSTOMID AS [Nr. Processo], '+
    '      B.SENIORKEY AS [Nota Senior], '+
    '      CASE '+
    '      WHEN B.TYPE=''TAX_RECEIPT'' THEN ''Nota de Despesa'' '+
    '      WHEN B.TYPE=''TAX_INVOICE'' THEN ''Nota de Serviço'' '+
    '      END AS [Tipo de Fatura], '+
    '      B.TOTAL AS [Total] '+
    '     FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) '+
    'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK)ON II.ID=BII.ITENSINVOICED_ID '+
    'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID=II.CUSTOMCLEARANCE_ID '+
    'LEFT JOIN MYINDAIAV2.DBO.BILLING              B   (NOLOCK)ON B.ID=BII.BILLING_ID '+
    'WHERE CC.CUSTOMID = ' + QuotedStr(DM.qryListaProcessosNR_PROCESSO.AsString);
end;

procedure TFormGerenciamentoDeProcessos.Button4Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Faturamento';
    Form.qryMain.SQL.Text := GetSQLFaturamento;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

end.
