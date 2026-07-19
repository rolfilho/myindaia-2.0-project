unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IntegracaoDue,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.DateUtils, masks, Vcl.Buttons,
  uIntegracaoDI, uRelatorioImpo, dxGDIPlusClasses, ParametrosDoSistema;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    btnExecutar: TButton;
    Button3: TButton;
    btnConsultarExpo: TBitBtn;
    btnFilaExpo: TBitBtn;
    btnIntegraDIs: TBitBtn;
    btnRelatorioImpo: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    btnDespachantes: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarExpoClick(Sender: TObject);
    procedure btnFilaExpoClick(Sender: TObject);
    procedure btnIntegraDIsClick(Sender: TObject);
    procedure btnRelatorioImpoClick(Sender: TObject);
    procedure btnDespachantesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private


  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses KrUtil, DmBroker,
  FireDAC.Comp.Client, uRelatorioExpo, uIntegracaoDue, uCadastroDespachantes;

var
  FTempoRestante: TLargeInteger;


procedure TFormMain.btnIntegraDIsClick(Sender: TObject);
var
  form: TfrmIntegracaoDI;
begin
  try
    Application.CreateForm(TfrmIntegracaoDI, form);
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TFormMain.btnRelatorioImpoClick(Sender: TObject);
var
  form: TfrmRelatorioImpo;
begin
  try
    Application.CreateForm(TfrmRelatorioImpo, form);
    form.ShowModal;

  finally
    form.Free;
  end;
end;

procedure TFormMain.btnConsultarExpoClick(Sender: TObject);
var
  form: TfrmRelatorioExpo;
begin
  try
    Application.CreateForm(TfrmRelatorioExpo, form);
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TFormMain.btnDespachantesClick(Sender: TObject);
var
  form: TfrmCadastroDespachante;
begin
  try
    Application.CreateForm(TfrmCadastroDespachante, form);
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TFormMain.btnFilaExpoClick(Sender: TObject);
var
  form: TfrmIntegracaoDue;
begin
  try
    Application.CreateForm(TfrmIntegracaoDue, form);
    form.ShowModal;
  finally
    form.Free;
  end;
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
//  if Parametros.ModoTeste then
//    btnRelatorioImpo.Click;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FileExistsForce(GetLocalPath + 'certificados\');
  FileExistsForce(GetLocalPath + 'Dis Importadas');

  if DebugHook > 0 then
    Parametros.ModoTeste := True
  else
    Parametros.ModoTeste := false;
end;


end.
