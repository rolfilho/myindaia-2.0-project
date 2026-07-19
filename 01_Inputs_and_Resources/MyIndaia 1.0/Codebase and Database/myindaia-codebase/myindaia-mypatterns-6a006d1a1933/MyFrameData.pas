unit MyFrameData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  MyUtil;

type
  TFrameData = class(TFrame)
    medData: TMaskEdit;
    procedure medDataExit(Sender: TObject);
  private
    function GetData: TDateTime;
    procedure SetData(const Value: TDateTime);
    { Private declarations }
  public
    property AsData: TDateTime read GetData write SetData;
  end;

implementation

{$R *.dfm}

{ TFrameData }

function TFrameData.GetData: TDateTime;
begin
  Result := StrToDateDef(medData.Text,0);
end;

procedure TFrameData.medDataExit(Sender: TObject);
begin
  CompletaData(Sender);
end;

procedure TFrameData.SetData(const Value: TDateTime);
begin
  medData.Text := DateToStr(Value);
end;

end.
