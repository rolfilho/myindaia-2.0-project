unit uGerarArquivosDraft;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,  Aurelius.Engine.ObjectManager, frmRelatorioDraft;

type
  TfrmGerarArquivosDraft = class(TformMyForm)
    Panel1: TPanel;
    rgPadraoInttra: TRadioButton;
    SaveDialog: TSaveDialog;
    pnlEmail: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mmCorpo: TMemo;
    edtAssunto: TEdit;
    edtCopia: TEdit;
    edtPara: TEdit;
    Panel2: TPanel;
    btnVisualizar: TBitBtn;
    btnEnviarEmail: TBitBtn;
    btnEnviarDigitalizacao: TBitBtn;
    chbCopiarUsuario: TCheckBox;
    pnlStyle2: TPanel;
    Button1: TButton;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnEnviarDigitalizacaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    nrProcesso : String;
    nrAmend : integer;
  function PastaTemp : String;
  procedure ValidarCampos;
  function FormatarBody(memo : tmemo) : string;
  function ConfiguraCopia : String;
  public
    { Public declarations }
   class function Execute(processo : string; amend : integer; tipo : integer): Boolean;

  end;
    const
      EMAIL = 1;
      TELA  = 0;
var
  frmGerarArquivosDraft: TfrmGerarArquivosDraft;

implementation

uses
  FrMain, ConnectionModule, uImpressaoDraftPadraoInttra, dmGerarArquivosDraft;

{$R *.dfm}

class function TfrmGerarArquivosDraft.Execute(processo : string; amend : integer; tipo : integer): Boolean;
var
  form: TfrmGerarArquivosDraft;
begin
  form := TfrmGerarArquivosDraft.Create(nil);
  try
    form.nrProcesso   := processo;
    form.nrAmend      := amend;
    form.edtPara.Text :=  FireDacMSSQL.sUsuarioEmail;
    if tipo = TELA then
    begin
      form.Height := 140;
      form.pnlEmail.Enabled := false;
      form.btnEnviarEmail.visible := false;
    end
    else
    begin //EMAIL
      form.Height := 350;
      form.pnlEmail.Enabled := true;
      form.btnEnviarEmail.visible := true;
    end;

    form.ShowModal;
  finally
    form.Free
  end;
end;

procedure TfrmGerarArquivosDraft.btnEnviarDigitalizacaoClick(Sender: TObject);
var NomeArquivo: string;
begin
  try
    btnEnviarEmail.Enabled         := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled          := false;

    if rgPadraoInttra.Checked then
    begin
      NomeArquivo := PastaTemp + 'draftBl' + '_' + nrProcesso + '_'+  inttostr(nrAmend) +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      tfrmImpressaoDraftPadraoInttra.execute(nrProcesso, nrAmend, NomeArquivo);
    end;
  finally
    btnEnviarEmail.Enabled         := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled          := true;
  end;
end;

procedure TfrmGerarArquivosDraft.btnEnviarEmailClick(Sender: TObject);
var NomeArquivo: string;
begin
  validarCampos;
  try
    btnEnviarEmail.Enabled         := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled          := false;

    if rgPadraoInttra.Checked then
    begin
      NomeArquivo := PastaTemp + 'draftBl' + '_' + nrProcesso + '_'+  inttostr(nrAmend) +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      tfrmImpressaoDraftPadraoInttra.execute(nrProcesso, nrAmend, NomeArquivo, edtPara.text, ConfiguraCopia, edtAssunto.text, FormatarBody(mmCorpo));
    end;
  finally
    btnEnviarEmail.Enabled         := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled          := true;
  end;
end;

function TfrmGerarArquivosDraft.FormatarBody(memo : tmemo) : string;
var Body : TStringList;
  i : integer;
begin
 Body := tStringList.create;
 Body.Add('<br><br>');

  for i := 0 to memo.lines.count-1 do
    Body.Add(memo.Lines[i] + '<br>');

  Body.Add('<br><br>');
  Body.Add('<br><br>');

  result := Body.Text;
end;

function TfrmGerarArquivosDraft.ConfiguraCopia : String;
begin
  if chbCopiarUsuario.Checked then
    result := edtCopia.text + ';' + FireDacMSSQL.sUsuarioEmail
  else
    result := edtCopia.text;
end;

procedure TfrmGerarArquivosDraft.btnVisualizarClick(Sender: TObject);
begin
  try
    btnEnviarEmail.Enabled         := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled          := false;

    if rgPadraoInttra.Checked then
    begin
      tfrmImpressaoDraftPadraoInttra.execute(nrProcesso, nrAmend);
    end;
  finally
    btnEnviarEmail.Enabled := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled := true;
  end;
end;

procedure TfrmGerarArquivosDraft.Button1Click(Sender: TObject);
begin
  inherited;

    formRelatorioDraft := TformRelatorioDraft.Create(nil);
    try
      formRelatorioDraft.processo := nrProcesso;
      formRelatorioDraft.RLReport1.PreviewModal;
    finally
      formRelatorioDraft.Free;
    end;

end;

function TfrmGerarArquivosDraft.PastaTemp : String;
var path : string;
begin
  path := ExtractFilePath(Application.ExeName)+'TEMP\';
  if not DirectoryExists(path) then
    ForceDirectories(path);
  result := path;
end;

procedure TfrmGerarArquivosDraft.ValidarCampos;
begin
  if trim(edtPara.text) = '' then
  begin
    Application.MessageBox(PWideChar('Informe o destinarário.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

end.
