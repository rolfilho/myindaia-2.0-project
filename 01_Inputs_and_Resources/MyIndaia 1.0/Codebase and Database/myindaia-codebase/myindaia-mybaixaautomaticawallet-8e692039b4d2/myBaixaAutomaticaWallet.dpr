program myBaixaAutomaticaWallet;

uses
  Vcl.Forms,
  Settings in 'Settings.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  UMain in 'UMain.pas' {frmMain},
  Utils in 'Utils.pas',
  ConnectionModuleV2 in 'ConnectionModuleV2.pas' {FireDacMSSQLConnectionV2: TDataModule},
  uWalletWSDL_CadPedidos in 'uWalletWSDL_CadPedidos.pas',
  uWalletWSDL_Numerarios_CRE in 'uWalletWSDL_Numerarios_CRE.pas',
  uWalletWSDL_Numerarios_CRE_Senior in 'uWalletWSDL_Numerarios_CRE_Senior.pas',
  uWalletWSDL_Pagamentos_Producao in 'uWalletWSDL_Pagamentos_Producao.pas',
  uWalletWSDL_Pagamentos_Senior in 'uWalletWSDL_Pagamentos_Senior.pas',
  MyEntitiesBroker in '..\minibroker\mypatterns\MyEntitiesBroker.pas',
  MyEntitiesV2 in '..\minibroker\mypatterns\MyEntitiesV2.pas',
  MyUtil in '..\minibroker\mypatterns\MyUtil.pas',
  ConnectionModule in 'ConnectionModule.pas' {FireDacMSSQLConnection: TDataModule},
  uWalletWSDL_Pagamentos in 'uWalletWSDL_Pagamentos.pas';

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
