unit FrmIntegracaoPhilips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormIntegracaoPhilips = class(TForm)
    Panel3: TPanel;
    dsMain: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryMain: TQuery;
    qryMainID: TStringField;
    qryMainPROCESSO: TStringField;
    qryMainSTATUS: TStringField;
    GroupBox1: TGroupBox;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    Panel1: TPanel;
    BtnReenviar: TBitBtn;
    btnEnviar: TBitBtn;
    qryMainENVIAR: TDateTimeField;
    Label1: TLabel;
    qryMainTP_PROCESSO: TStringField;
    procedure BtnReenviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIntegracaoPhilips: TFormIntegracaoPhilips;

implementation

uses PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormIntegracaoPhilips.BtnReenviarClick(Sender: TObject);
var
  ID: String;
begin
  if qryMain.Eof then
    Exit;

  if qryMain.FieldByName('STATUS').AsString = '' then
  begin
    ShowMessage('Processo ainda está na fila para o envio do arquivo.');
    Exit;
  end;

  ID := qryMain.FieldByName('ID').AsString;
  qryMain.Close;
    QueryExec('UPDATE INTEGRACAO_PHILIPS SET IN_ENVIADO = 0 WHERE CD_INSTRUCAO_DESEMBARACO = ' + QuotedStr(ID));
  qryMain.Open;
  qryMain.Locate('ID', ID, [loCaseInsensitive, loPartialKey])
end;

procedure TFormIntegracaoPhilips.FormShow(Sender: TObject);
begin
  qryMain.Open;
end;

procedure TFormIntegracaoPhilips.msk_nr_processoChange(Sender: TObject);
begin
  qryMain.Locate('PROCESSO', msk_nr_processo.Text, [loCaseInsensitive, loPartialKey])
end;

procedure TFormIntegracaoPhilips.btnEnviarClick(Sender: TObject);
var
  ID: String;
begin
  if qryMain.Eof then
    Exit;
  if qryMain.FieldByName('ENVIAR').AsString <> '' then
  begin
    ShowMessage('Processo já entrou na fila de envio de arquivo para Philips');
    Exit;
  end;

  ID := qryMain.FieldByName('ID').AsString;
  qryMain.Close;
    QueryExec('UPDATE INTEGRACAO_PHILIPS SET DT_ENVIAR_ARQUIVO = GETDATE() WHERE CD_INSTRUCAO_DESEMBARACO = ' + QuotedStr(ID));
  qryMain.Open;
  qryMain.Locate('ID', ID, [loCaseInsensitive, loPartialKey])
end;

end.
