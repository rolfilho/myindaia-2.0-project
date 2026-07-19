unit uIntegraNotaDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit;

type
  TfrmIntegraNotaDespesas = class(TForm)
    lbl_despesas: TLabel;
    lbl_multa_li: TLabel;
    Label9: TLabel;
    ceOutrasDespesas: TCurrencyEdit;
    ceMultaLI: TCurrencyEdit;
    ceICMSComplementar: TCurrencyEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ceMultaLIChange(Sender: TObject);
  private
    FPcIcms: Extended;
    function GetICMSComplementar: Extended;
    function GetMultaLI: Extended;
    function GetOutrasDespesas: Extended;
    procedure SetICMSComplementar(const Value: Extended);
    procedure SetMultaLI(const Value: Extended);
    procedure SetOutrasDespesas(const Value: Extended);
  public
    function Execute(APcIcms: Extended; var AOutrasDespesas, AMultaLI, AICMSComplementar: Extended): Boolean; overload;
    function Execute: Boolean; overload;
    property OutrasDespesas: Extended read GetOutrasDespesas write SetOutrasDespesas;
    property MultaLI: Extended read GetMultaLI write SetMultaLI;
    property ICMSComplementar: Extended read GetICMSComplementar write SetICMSComplementar;
  end;

  function GetOutrasDespesasNF(APcIcms: Extended; var AOutrasDespesas, AMultaLI, AICMSComplementar: Extended): Boolean;

var
  frmIntegraNotaDespesas: TfrmIntegraNotaDespesas;

implementation

{$R *.dfm}

function GetOutrasDespesasNF(APcIcms: Extended; var AOutrasDespesas, AMultaLI, AICMSComplementar: Extended): Boolean;
begin
  with TfrmIntegraNotaDespesas.Create(nil) do
    try
      Result := Execute(APcIcms, AOutrasDespesas, AMultaLI, AICMSComplementar);
    finally
      Free;
    end;
end;

{ TfrmIntegraNotaDespesas }

function TfrmIntegraNotaDespesas.Execute(APcIcms: Extended; var AOutrasDespesas, AMultaLI, AICMSComplementar: Extended): Boolean;
begin
  FPcIcms := APcIcms;
  ceOutrasDespesas.Value   := AOutrasDespesas;
  ceMultaLI.Value          := AMultaLI;
  ceICMSComplementar.Value := AICMSComplementar;
  Result := Execute;
  AOutrasDespesas   := ceOutrasDespesas.Value;
  AMultaLI          := ceMultaLI.Value;
  AICMSComplementar := ceICMSComplementar.Value;
end;

function TfrmIntegraNotaDespesas.Execute: Boolean;
begin
  Result := ShowModal = mrOk;
end;

function TfrmIntegraNotaDespesas.GetICMSComplementar: Extended;
begin
  Result := ceICMSComplementar.Value;
end;

function TfrmIntegraNotaDespesas.GetMultaLI: Extended;
begin
  Result := ceMultaLI.Value;
end;

function TfrmIntegraNotaDespesas.GetOutrasDespesas: Extended;
begin
  Result := ceOutrasDespesas.Value;
end;

procedure TfrmIntegraNotaDespesas.SetICMSComplementar(const Value: Extended);
begin
  ceICMSComplementar.Value := Value;
end;

procedure TfrmIntegraNotaDespesas.SetMultaLI(const Value: Extended);
begin
  ceMultaLI.Value := Value;
end;

procedure TfrmIntegraNotaDespesas.SetOutrasDespesas(const Value: Extended);
begin
  ceOutrasDespesas.Value := Value;
end;

procedure TfrmIntegraNotaDespesas.FormCreate(Sender: TObject);
begin
  ceOutrasDespesas.Value   := 0;
  ceMultaLI.Value          := 0;
  ceICMSComplementar.Value := 0;
end;

procedure TfrmIntegraNotaDespesas.ceMultaLIChange(Sender: TObject);
var
  D: Double;
begin
  if TryStrToFloat(Trim(ceMultaLI.Text), D) then
  begin
    D := ((D / (1 - (FPcIcms / 100))) * FPcIcms) / 100;
    ceICMSComplementar.Text := FormatFloat('0.00', D);
  end
  else
    ceICMSComplementar.Text := '';
end;

end.
