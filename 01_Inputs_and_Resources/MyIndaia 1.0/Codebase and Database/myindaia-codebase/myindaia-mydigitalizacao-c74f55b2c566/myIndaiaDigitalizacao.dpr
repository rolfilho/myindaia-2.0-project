program myIndaiaDigitalizacao;

uses
  Forms,
  Windows,
  SysUtils,
  dConsultaOnline in 'dConsultaOnline.pas' {dtmMyDigConsultaOnline: TDataModule},
  dDigitalizacao in 'dDigitalizacao.pas' {dtmMyIndaiaDigitalizacao: TDataModule},
  dPreparaArquivos in 'dPreparaArquivos.pas' {dtmMyDigPreparaArquivos: TDataModule},
  uConsultaOnline in 'uConsultaOnline.pas' {frmMyDigConsultaOnline},
  uDigitalizacao in 'uDigitalizacao.pas' {frmMyIndaiaDigitalizacao},
  uPreparaArquivos in 'uPreparaArquivos.pas' {frmMyDigPreparaArquivos},
  uAnexaOutlook in 'uAnexaOutlook.pas' {frmAnexaOutlook},
  Funcoes in 'Funcoes.pas',
  uCatalogoEnderecos in 'uCatalogoEnderecos.pas' {frmCatalogoEnderecos},
  uEnviaEmail in 'uEnviaEmail.pas' {frmEnviaEmail},
  uListaArquivos in 'uListaArquivos.pas',
  uVisualizaArquivos in 'uVisualizaArquivos.pas' {frmMyDigVisualizaArquivos},
  uMotivo in 'uMotivo.pas' {frmMyDigMotivo},
  uReplicarArquivo in 'uReplicarArquivo.pas' {frmMyDigReplicarArquivo},
  uLog in 'uLog.pas' {frmMyDigLog},
  uLogin in 'uLogin.pas' {frmDigitalizacaoLogin},
  DDENFSEIntf in 'DDENFSEIntf.pas',
  SendMailIntf in 'SendMailIntf.pas',
  KrQuery in 'KrQuery.pas',
  KrUtil in 'KrUtil.pas',
  KrGlobal in 'KrGlobal.pas',
  UEmailCliente in 'UEmailCliente.pas' {frmEmailCliente},
  DelRun in '..\myreiniciarobos\DelRun.pas',
  KrFatura in 'KrFatura.pas';

{$R *.res}

var
  Handle: HWND;
  S: String;
  I: Integer;

begin
  Application.Initialize;

  Handle := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  //Handle := 0; // Comentar o debaixo durante os testes para poder executar com o Form principal aberto
{  if Handle > 0 then
  begin
    ShowWindow(Handle, SW_SHOW);
    SetActiveWindow(Handle);
    SetForegroundWindow(Handle);
    Halt;
  end;
}
  Application.Title := 'myIndaiá Digitalização';
  Application.CreateForm(TfrmMyIndaiaDigitalizacao, frmMyIndaiaDigitalizacao);
  Application.CreateForm(TfrmMyDigConsultaOnline, frmMyDigConsultaOnline);
  Application.CreateForm(TfrmDigitalizacaoLogin, frmDigitalizacaoLogin);
  Application.CreateForm(TdtmMyDigConsultaOnline, dtmMyDigConsultaOnline);
  Application.CreateForm(TdtmMyIndaiaDigitalizacao, dtmMyIndaiaDigitalizacao);
  Application.CreateForm(TfrmMyDigLog, frmMyDigLog);
  frmMyIndaiaDigitalizacao.Show;

  if ParamCount > 0 then
  begin
    S := '';
    for I := 1 to ParamCount do
      S := S + ' ' + ParamStr(I);
    Delete(S, 1, 1);
    frmMyIndaiaDigitalizacao.AbreMensagem(S);
  end;

  // Exemplos
  //frmMyIndaiaDigitalizacao.AbreMensagem('NR_PROCESSO=0101IM-0564-10;');
  //frmMyIndaiaDigitalizacao.AbreMensagem('ID_CODIGO=ID00000093-11;');
  //frmMyIndaiaDigitalizacao.AbreMensagem('ID_TABELA=1639429360;NM_CHAVE=01662;');
  //frmMyIndaiaDigitalizacao.AbreMensagem('ID_TABELA=1639429360;NM_CHAVE=01662;NM_ARQUIVO=C:\carousel\carousel.fla;TP_ARQUIVO=X;');

  Application.Run;
end.
