unit MyFramePeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  MyDialog, MyUtil;

type
  TFramePeriodo = class(TFrame)
    medDataInicial: TMaskEdit;
    medDataFinal: TMaskEdit;
    Label1: TLabel;
    procedure medDataFinalExit(Sender: TObject);
    procedure medDataInicialExit(Sender: TObject);
  private
    function GetDataFinal: TDateTime;
    function GetDataInicial: TDateTime;
    procedure SetDataFinal(const Value: TDateTime);
    procedure SetDataInicial(const Value: TDateTime);
  public
    constructor Create(AOwner: TComponent); override;
    property AsDataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property AsDataFinal: TDateTime read GetDataFinal write SetDataFinal;
    function PeriodoValido: Boolean;
  end;

implementation

{$R *.dfm}
{ TFrame1 }

constructor TFramePeriodo.Create(AOwner: TComponent);
begin
  inherited;

end;

function TFramePeriodo.GetDataFinal: TDateTime;
begin
  Result := StrToDateDef(medDataFinal.Text, 0);
end;

function TFramePeriodo.GetDataInicial: TDateTime;
begin
  Result := StrToDateDef(medDataInicial.Text, 0);
end;

procedure TFramePeriodo.medDataFinalExit(Sender: TObject);
begin
  CompletaData(Sender);
  if (AsDataInicial > 0) then
  begin
    if AsDataFinal = 0 then
    begin
      medDataFinal.SetFocus;
      Reject('Data final em branco.');
    end;
    if not PeriodoValido then
    begin
      medDataFinal.SetFocus;
      Reject('Data final não pode ser menor que inicial.');
    end;
  end;
end;

procedure TFramePeriodo.medDataInicialExit(Sender: TObject);
begin
  CompletaData(Sender);
  if medDataFinal.Text = '' then
    medDataFinal.Text := medDataInicial.Text;
end;

function TFramePeriodo.PeriodoValido: Boolean;
begin
  Result := AsDataFinal >= AsDataInicial;
end;

procedure TFramePeriodo.SetDataFinal(const Value: TDateTime);
begin
  medDataFinal.Text := DateToStr(Value);
end;

procedure TFramePeriodo.SetDataInicial(const Value: TDateTime);
begin
  medDataInicial.Text := DateToStr(Value);
end;

end.
