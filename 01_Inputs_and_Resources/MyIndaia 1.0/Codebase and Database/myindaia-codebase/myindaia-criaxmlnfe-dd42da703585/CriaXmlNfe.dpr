program CriaXmlNfe;

uses
  Vcl.Forms,
  uFrmNFe in 'uFrmNFe.pas' {frmNfe},
  uNFeService in 'uNFeService.pas',
  uDmNFe in 'uDmNFe.pas' {dmNFe: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNfe, frmNfe);
  Application.CreateForm(TdmNFe, dmNFe);
  Application.Run;
end.
