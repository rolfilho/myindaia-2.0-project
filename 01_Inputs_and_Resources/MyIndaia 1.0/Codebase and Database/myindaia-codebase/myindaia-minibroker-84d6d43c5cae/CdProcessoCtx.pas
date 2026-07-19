unit CdProcessoCtx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyDgOk, Vcl.StdCtrls, Vcl.ExtCtrls,
  MyForm, MyFrameData, MyFramePeriodo, MyDialog, FmUnidadeNegocio, FmProduto,
  Vcl.Mask, Vcl.Buttons;

type
  TOpcoesProcessoCtx = record
    UnidadeNegocio: string;
    Produto: string;
    DataInicial: TDateTime;
    DataFinal: TDatetime;
    NrProcesso: string;
    MostraTodosProcesso: Boolean;
  end;

  TCampoVisivelCtx = (cvTodos, cvUnidNegocio, cvProduto, cvPeriodo, cvNumeroProcesso, cvTodosProcessos);

  TCamposVisiveisCtx = set of TCampoVisivelCtx;

  TformMyCdProcessoCtx = class(TformMyDgOk)
    Panel2: TPanel;
    pnlUnidadeNegocio: TPanel;
    FrameUnidadeNegocio: TFrameUnidadeNegocio;
    pnlProduto: TPanel;
    FrameProduto: TFrameProduto;
    pnlTodosProcesso: TPanel;
    cbxTodos: TCheckBox;
    pnlPeriodoProcesso: TPanel;
    pnlNumeroProcesso: TPanel;
    Label2: TLabel;
    edtNumeroProcesso: TMaskEdit;
    pnlPeriodo: TPanel;
    Label1: TLabel;
    FramePeriodo: TFramePeriodo;
    procedure btnOkClick(Sender: TObject);
    procedure edtNumeroProcessoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCamposVisiveis: TCamposVisiveisCtx;
    procedure SetCamposVisiveis(const Value: TCamposVisiveisCtx);
  protected
    procedure DoCreate; override;
    procedure DoActivate; override;
  public
    class function Execute(var Opcoes: TOpcoesProcessoCtx; CamposVisiveis: TCamposVisiveisCtx): Boolean;
    property CamposVisiveis: TCamposVisiveisCtx read FCamposVisiveis write SetCamposVisiveis;
  end;

var
  formMyCdProcessoCtx: TformMyCdProcessoCtx;

implementation

{$R *.dfm}

{ TformMyDgOk1 }

procedure TformMyCdProcessoCtx.btnOkClick(Sender: TObject);
begin
  if (FramePeriodo.AsDataFinal = 0) and string(edtNumeroProcesso.Text).Equals('  -      -  ') then
    Reject('Período ou Número do Processo é obrigatório');
  inherited;
end;

procedure TformMyCdProcessoCtx.DoActivate;
begin
  inherited;
  edtNumeroProcesso.SetFocus;
end;

procedure TformMyCdProcessoCtx.DoCreate;
begin
  inherited;
  FCamposVisiveis := [cvTodos];
  pnlPeriodo.BevelOuter := bvNone;
  pnlNumeroProcesso.BevelOuter := bvNone;
  pnlUnidadeNegocio.BevelOuter := bvNone;
  pnlProduto.BevelOuter := bvNone;
  pnlPeriodoProcesso.BevelOuter := bvNone;
  pnlTodosProcesso.BevelOuter := bvNone;
end;

procedure TformMyCdProcessoCtx.edtNumeroProcessoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    edtNumeroProcesso.Clear;
end;

class function TformMyCdProcessoCtx.Execute(var Opcoes: TOpcoesProcessoCtx; CamposVisiveis: TCamposVisiveisCtx): Boolean;
var
  form: TformMyCdProcessoCtx;
begin
  form := TformMyCdProcessoCtx.Create(nil);
  try
    form.CamposVisiveis := CamposVisiveis;
    if not Opcoes.UnidadeNegocio.IsEmpty then
      form.FrameUnidadeNegocio.edtCodigo.Text := Opcoes.UnidadeNegocio;
    if not Opcoes.Produto.IsEmpty then
      form.FrameProduto.edtCodigo.Text := Opcoes.Produto;
    if Opcoes.DataInicial > 0 then
      form.FramePeriodo.AsDataInicial := Opcoes.DataInicial;
    if Opcoes.DataFinal > 0 then
      form.FramePeriodo.AsDataFinal := Opcoes.DataFinal;
    if not Opcoes.NrProcesso.IsEmpty then
      form.edtNumeroProcesso.Text := Opcoes.NrProcesso;

    form.ShowModal;
    Result := form.ModalResult = mrOk;
    if Result then
    begin
      Opcoes.UnidadeNegocio := form.FrameUnidadeNegocio.edtCodigo.Text;
      Opcoes.Produto := form.FrameProduto.edtCodigo.Text;
      Opcoes.DataInicial := form.FramePeriodo.AsDataInicial;
      Opcoes.DataFinal := form.FramePeriodo.AsDataFinal;
      if string(form.edtNumeroProcesso.Text).Equals('  -      -  ') then
        Opcoes.NrProcesso := ''
      else
        Opcoes.NrProcesso := Opcoes.UnidadeNegocio+Opcoes.Produto+form.edtNumeroProcesso.Text;
      Opcoes.MostraTodosProcesso := form.cbxTodos.Checked;
    end;
  finally
    form.Free
  end;
end;

procedure TformMyCdProcessoCtx.SetCamposVisiveis(
  const Value: TCamposVisiveisCtx);
begin
  FCamposVisiveis := Value;
  if cvTodos in FCamposVisiveis then
    Exit;
  if not (cvUnidNegocio in FCamposVisiveis) then
  begin
    pnlUnidadeNegocio.Visible := False;
    Height := Height - pnlUnidadeNegocio.Height;
  end;
  if not (cvProduto in FCamposVisiveis) then
  begin
    pnlProduto.Visible := False;
    Height := Height - pnlProduto.Height;
  end;
  if not (cvPeriodo in FCamposVisiveis) and not (cvNumeroProcesso in FCamposVisiveis) then
  begin
    pnlPeriodoProcesso.Visible := False;
    Height := Height - pnlPeriodoProcesso.Height;
  end;
  if not (cvPeriodo in FCamposVisiveis) then
  begin
    pnlPeriodo.Visible := False;
    pnlNumeroProcesso.Left := pnlPeriodo.Width - pnlNumeroProcesso.Left;
  end;
  if not (cvNumeroProcesso in FCamposVisiveis) then
  begin
    pnlNumeroProcesso.Visible := False;
  end;
  if not (cvTodosProcessos in FCamposVisiveis) then
  begin
    pnlTodosProcesso.Visible := False;
    Height := Height - pnlTodosProcesso.Height;
  end;
end;

end.
