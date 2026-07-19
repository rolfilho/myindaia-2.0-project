unit uMotivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmMyDigMotivo = class(TForm)
    Label3: TLabel;
    memMotivo: TMemo;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memMotivoChange(Sender: TObject);
  private
    function GetMotivo(var AMotivo: String): Boolean;
  public
    function GetMotivoAlteracao(var AMotivo: String): Boolean;
    function GetMotivoExclusao(var AMotivo: String): Boolean;
  end;

  function GetMotivoAlteracao(var AMotivo: String): Boolean;
  function GetMotivoExclusao(var AMotivo: String): Boolean;

var
  frmMyDigMotivo: TfrmMyDigMotivo;

implementation

{$R *.dfm}

function GetMotivoAlteracao(var AMotivo: String): Boolean;
begin
  if not Assigned(frmMyDigMotivo) then
    Application.CreateForm(TfrmMyDigMotivo, frmMyDigMotivo);
  try
    Result := frmMyDigMotivo.GetMotivoAlteracao(AMotivo);
  finally
    frmMyDigMotivo.Release;
    FreeAndNil(frmMyDigMotivo);
  end;
end;

function GetMotivoExclusao(var AMotivo: String): Boolean;
begin
  if not Assigned(frmMyDigMotivo) then
    Application.CreateForm(TfrmMyDigMotivo, frmMyDigMotivo);
  try
    Result := frmMyDigMotivo.GetMotivoExclusao(AMotivo);
  finally
    frmMyDigMotivo.Release;
    FreeAndNil(frmMyDigMotivo);
  end;
end;

{ TfrmMyDigMotivo }

function TfrmMyDigMotivo.GetMotivo(var AMotivo: String): Boolean;
begin
  Result := ShowModal = mrOk;
  if Result then
    AMotivo := memMotivo.Text;
end;

function TfrmMyDigMotivo.GetMotivoAlteracao(var AMotivo: String): Boolean;
begin
  Caption := 'Motivo da alteração';
  Result := GetMotivo(AMotivo);
end;

function TfrmMyDigMotivo.GetMotivoExclusao(var AMotivo: String): Boolean;
begin
  Caption := 'Motivo da exclusão';
  Result := GetMotivo(AMotivo);
end;

procedure TfrmMyDigMotivo.btnOkClick(Sender: TObject);
begin
  if Length(Trim(StringReplace(memMotivo.Text, #13#10, '', [rfReplaceAll]))) < 10 then
    MessageDlg('Descrição inválida.'#13'A descrição deve conter no mínimo 10 caracteres.', mtWarning, [mbOk], 0)
  else
    ModalResult := mrOk;
end;

procedure TfrmMyDigMotivo.FormShow(Sender: TObject);
begin
  btnOk.Enabled := False;
  memMotivo.Text := '';
  SelectFirst;
end;

procedure TfrmMyDigMotivo.memMotivoChange(Sender: TObject);
begin
  btnOk.Enabled := Trim(StringReplace(memMotivo.Text, #13#10, '', [rfReplaceAll])) <> ''
end;

end.
