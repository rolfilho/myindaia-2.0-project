unit uWalletGerarArquivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,  Aurelius.Engine.ObjectManager;

type
  TfrmWalletGerarArquivos = class(TformMyForm)
    Panel1: TPanel;
    rgPadraoImpo: TRadioButton;
    rgPadraoExpo: TRadioButton;
    rgArquivoTexto: TRadioButton;
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
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnEnviarDigitalizacaoClick(Sender: TObject);
  private
    { Private declarations }
    Id : string;
    Cliente : String;
    Processo : String;
  function PastaTemp : String;
  procedure ValidarCampos;
  procedure Enviar(arquivo : string);
  function FormatarBody(memo : tmemo) : string;
  function ConfiguraCopia : String;
  public
    { Public declarations }
    class function Execute(ids :string; nomecliente, nrprocesso : string; tipo : Integer): Boolean;

  end;
    const
      EMAIL = 1;
      TELA  = 0;
var
  frmWalletGerarArquivos: TfrmWalletGerarArquivos;

implementation

uses
  uWalletImpressaoNumerarioImpo, ConnectionModuleV2, FrMain, uWalletImpressaoNumerarioExpo, ConnectionModule;

{$R *.dfm}

class function TfrmWalletGerarArquivos.Execute(ids : string; nomecliente, nrprocesso : string; tipo: Integer): Boolean;
var
  form: TfrmWalletGerarArquivos;
begin
  form := TfrmWalletGerarArquivos.Create(nil);
  try
    form.id := ids;
    form.Cliente := nomecliente;
    form.Processo := nrprocesso;
    form.edtPara.Text :=  FireDacMSSQLV2(sUsuario).sUsuarioEmail;
    if tipo = 0 then
    begin
      form.Height := 140;
      form.pnlEmail.Enabled := false;
      form.btnEnviarEmail.visible := false;
    end
    else
    begin
      form.Height := 350;
      form.pnlEmail.Enabled := true;
      form.btnEnviarEmail.visible := true;
    end;
    form.ShowModal;
  finally
    form.Free
  end;
end;

procedure TfrmWalletGerarArquivos.btnEnviarDigitalizacaoClick(Sender: TObject);
var NomeArquivo: string;
begin
  try
    btnEnviarEmail.Enabled := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled := false;

    if rgPadraoImpo.Checked then
    begin
      NomeArquivo := PastaTemp + 'NUMERARIO1_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      TfrmWalletImpressaoNumerarioImpo.execute(id, NomeArquivo, Processo);
    end
    else
    if rgPadraoExpo.Checked then
    begin
      NomeArquivo := PastaTemp + 'NUMERARIO2_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      TfrmWalletImpressaoNumerarioExpo.execute(id, NomeArquivo, Processo);
    end;
  finally
    btnEnviarEmail.Enabled := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled := true;
  end;
end;

procedure TfrmWalletGerarArquivos.btnEnviarEmailClick(Sender: TObject);
var NomeArquivo: string;
begin
  validarCampos;
  try
    btnEnviarEmail.Enabled := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled := false;

    if rgPadraoImpo.Checked then
    begin
      NomeArquivo := PastaTemp + 'NUMERARIO1_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      TfrmWalletImpressaoNumerarioImpo.execute(id, NomeArquivo, edtPara.text, ConfiguraCopia, edtAssunto.text, FormatarBody(mmCorpo));
    end
    else
    if rgPadraoExpo.Checked then
    begin
      NomeArquivo := PastaTemp + 'NUMERARIO2_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmmss', now) + '.pdf';
      TfrmWalletImpressaoNumerarioExpo.execute(id, NomeArquivo, edtPara.text, ConfiguraCopia, edtAssunto.text, FormatarBody(mmCorpo));
    end
    else
    if rgArquivoTexto.Checked then
    begin
      NomeArquivo := PastaTemp + 'NUMERARIO_TXT_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmm', now) + '.txt';
      if FireDacMSSQLV2(sUsuario).GerarArquivoEdi(Id,NomeArquivo) then
      begin
        Enviar(NomeArquivo);
      end;
    end;
  finally
    btnEnviarEmail.Enabled := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled := true;
  end;
end;

procedure TfrmWalletGerarArquivos.Enviar(arquivo : string);
var copia : string;
 corpoEmail : string;
begin
  copia := ConfiguraCopia;
  corpoEmail := FormatarBody(mmCorpo);

  if FireDacMSSQL.EnviaEmail('ti@myindaia.com.br',
                          [edtPara.text] ,
                          [copia],
                          [],
                          edtAssunto.text,
                          corpoEmail,
                          [arquivo]) then
    Application.MessageBox(PWideChar('E-mail enviado.'), 'Atenção!', MB_OK)
  else
    Application.MessageBox(PWideChar('Erro enviando e-mail.'), 'Atenção!', MB_OK);
end;

function TfrmWalletGerarArquivos.FormatarBody(memo : tmemo) : string;
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

function TfrmWalletGerarArquivos.ConfiguraCopia : String;
begin
  if chbCopiarUsuario.Checked then
    result := edtCopia.text + ';' + FireDacMSSQLV2(sUsuario).sUsuarioEmail
  else
    result := edtCopia.text;
end;

procedure TfrmWalletGerarArquivos.btnVisualizarClick(Sender: TObject);
begin
  try
    btnEnviarEmail.Enabled := false;
    btnEnviarDigitalizacao.Enabled := false;
    btnVisualizar.Enabled := false;

    if rgPadraoImpo.Checked then
    begin
      TfrmWalletImpressaoNumerarioImpo.execute(id);
    end
    else
    if rgPadraoExpo.Checked then
    begin
      TfrmWalletImpressaoNumerarioExpo.execute(id);
    end
    else
    if rgArquivoTexto.Checked then
    begin
      SaveDialog.FileName := 'NUMERARIO_TXT_'+ Cliente +'_'+ formatDateTime('ddmmyyhhmm', now) + '.txt';
      if SaveDialog.Execute then
      begin
        if FireDacMSSQLV2(sUsuario).GerarArquivoEdi(Id,SaveDialog.FileName) then
          Application.MessageBox(PWideChar('Arquivo gerado com sucesso.'), 'Atenção!', MB_OK);
      end;
    end;
  finally
    btnEnviarEmail.Enabled := true;
    btnEnviarDigitalizacao.Enabled := true;
    btnVisualizar.Enabled := true;
  end;
end;

function TfrmWalletGerarArquivos.PastaTemp : String;
var path : string;
begin
  path := ExtractFilePath(Application.ExeName)+'TEMP\';
  if not DirectoryExists(path) then
    ForceDirectories(path);
  result := path;
end;

procedure TfrmWalletGerarArquivos.ValidarCampos;
begin
  if trim(edtPara.text) = '' then
  begin
    Application.MessageBox(PWideChar('Informe o destinarário.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

end.
