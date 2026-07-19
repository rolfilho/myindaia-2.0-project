unit uWalletCtx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TOpcoesCtx = record
    Nome: string;
    CNPJ_CPF: string;
  end;

  TCampoVisivelCtx = (cvTodos, cvNome, cvCPFCNPJ);

  TCamposVisiveisCtx = set of TCampoVisivelCtx;

type
  TfrmWalletCtx = class(TformMyDgOk)
    pnlNome: TPanel;
    lblNome: TLabeledEdit;
    pnlCliente: TPanel;
    lblcnpj: TLabeledEdit;
    procedure lblNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblcnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCamposVisiveis: TCamposVisiveisCtx;
    procedure SetCamposVisiveis(const Value: TCamposVisiveisCtx);
  protected
    procedure DoCreate; override;
    procedure DoActivate;override;
  public
    { Public declarations }
    class function Execute(var Opcoes : TOpcoesCtx; CamposVisiveis: TCamposVisiveisCtx): Boolean;
    property CamposVisiveis: TCamposVisiveisCtx read FCamposVisiveis write SetCamposVisiveis;
  end;

var
  frmWalletCtx: TfrmWalletCtx;

implementation

{$R *.dfm}

class function TfrmWalletCtx.Execute(var Opcoes : TOpcoesCtx; CamposVisiveis: TCamposVisiveisCtx): Boolean;
var
  form: tfrmWalletCtx;
begin
  form := tfrmWalletCtx.Create(nil);
  try
    form.CamposVisiveis := CamposVisiveis;
    form.ShowModal;

    Result := form.ModalResult = mrOk;
    if Result then
    begin
      Opcoes.Nome := form.lblNome.Text;
      Opcoes.CNPJ_CPF := form.lblcnpj.Text;
    end;
  finally
    form.Free
  end;
end;

procedure TfrmWalletCtx.lblcnpjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN  then
  begin
    btnOk.Click;
  end;
end;

procedure TfrmWalletCtx.lblNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN  then
  begin
    btnOk.Click;
  end;
end;

procedure TfrmWalletCtx.DoCreate;
begin
  inherited;
  FCamposVisiveis       := [cvTodos];
  pnlCliente.BevelOuter := bvNone;
  pnlNome.BevelOuter    := bvNone;
end;

procedure TfrmWalletCtx.SetCamposVisiveis(
  const Value: TCamposVisiveisCtx);
begin
  FCamposVisiveis := Value;
  if cvTodos in FCamposVisiveis then
    Exit;

  if not (cvNome in FCamposVisiveis) then
  begin
    pnlNome.Visible := False;
    Height := Height - pnlNome.Height;
  end;
  if not (cvCPFCNPJ in FCamposVisiveis) then
  begin
    pnlCliente.Visible := False;
    Height := Height - pnlCliente.Height;
  end;

end;

procedure TfrmWalletCtx.DoActivate;
begin
  inherited;
  lblNome.SetFocus;
end;


end.
