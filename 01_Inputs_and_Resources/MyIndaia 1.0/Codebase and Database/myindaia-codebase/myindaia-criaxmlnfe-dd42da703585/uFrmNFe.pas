unit uFrmNFe;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  uDmNFe,
  uNFeService;

type
  TfrmNFe = class(TForm)
    edtNrProcesso: TEdit;
    btnGerar: TButton;
    memoLog: TMemo;
    Label1: TLabel;
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Log(const S: string);
  public
  end;

var
  frmNFe: TfrmNFe;

implementation

{$R *.dfm}

procedure TfrmNFe.FormShow(Sender: TObject);
begin
//  edtNrProcesso.Text := '0101IM-015411-25';
end;

procedure TfrmNFe.Log(const S: string);
begin
  memoLog.Lines.Add(S);
end;

procedure TfrmNFe.btnGerarClick(Sender: TObject);
var
  Service: TNFeService;
  Lista: TStringList;
  i: Integer;
  NrProcesso: string;
begin
  NrProcesso := Trim(edtNrProcesso.Text);
  if NrProcesso = '' then
  begin
    ShowMessage('Informe o NR_PROCESSO.');
    Exit;
  end;

  memoLog.Clear;

  Service := TNFeService.Create(dmNFe);
  try
    Lista := Service.GerarNFe(NrProcesso);
    try
      Log('Arquivos gerados:');
      for i := 0 to Lista.Count - 1 do
        Log(' - ' + Lista[i]);
    finally
      Lista.Free;
    end;

    ShowMessage('NF-e(s) gerada(s) com sucesso.');
  except
    on E: Exception do
    begin
      Log('ERRO: ' + E.Message);
      ShowMessage(E.Message);
    end;
  end;

  Service.Free;
end;

end.

