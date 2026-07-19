program myParametrizacaoLIConsulta;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Principal in 'Principal.pas' {frmMyParametrizacaoLIConsulta},
  Funcoes in 'Funcoes.pas',
  uWebModulo in 'uWebModulo.pas' {frm_Web},
  Conexao in 'Conexao.pas' {dtmMyParametrizacaoLIConsulta: TDataModule},
  Componentes in 'Componentes.pas',
  SHDocVw in 'SHDocVw.pas',
  WBFuncs in 'WBFuncs.pas',
  uIntegraTerminal in 'uIntegraTerminal.pas' {frmIntegraTerminalWeb};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyParametrizacaoLIConsulta, frmMyParametrizacaoLIConsulta);
  Application.CreateForm(TdtmMyParametrizacaoLIConsulta, dtmMyParametrizacaoLIConsulta);
  Application.CreateForm(Tfrm_Web, frm_Web);
  Application.Run;
end.
