unit FrMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyMainEnterprise, Vcl.Menus,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls, FrBancoDeDados, CdProcesso,
  ConnectionModule, Vcl.AppEvnts, MvProcessoDue, FrSQLMonitor, MyAuditoria,
  CdEnquadramento, CdDescricaoMercadoriaDraft, MyUtil, Vcl.StdCtrls;

type
  TformMain = class(TformMyMainEnterprise)
    Configurao1: TMenuItem;
    BancodeDados1: TMenuItem;
    Processos1: TMenuItem;
    ProcessosDue1: TMenuItem;
    SQlMonitor1: TMenuItem;
    Enquadramento1: TMenuItem;
    CadastroRegrasObservacoesAutomaticas1: TMenuItem;
    CadastroTabelasCamposRegrasObservaesAutomticas1: TMenuItem;
    WalletMenu: TMenuItem;
    WalletCadastros1: TMenuItem;
    WalletCadBanco: TMenuItem;
    WalletCadUsuario: TMenuItem;
    WalletCadFilial: TMenuItem;
    WalletCadPais: TMenuItem;
    WalletCadItem: TMenuItem;
    WalletCadOrganizacao: TMenuItem;
    WalletCadServico: TMenuItem;
    WalletCadFavorecido: TMenuItem;
    WalletCadProduto: TMenuItem;
    WalletCadGrupo: TMenuItem;
    WalletCadCliente: TMenuItem;
    WalletSolicitarNumerario: TMenuItem;
    WalletCriarPagamentos: TMenuItem;
    WalletProcesso: TMenuItem;
    WalletSolicitarPagamento: TMenuItem;
    WalletTransferenciaPagamento: TMenuItem;
    lblUsuario: TLabel;
    Auditoria1: TMenuItem;
    WalletPreFaturamento: TMenuItem;
    DraftBL: TMenuItem;
    DescriodeMercadoriaDraft: TMenuItem;
    Configuraoes: TMenuItem;
    procedure BancodeDados1Click(Sender: TObject);
    procedure Processos1Click(Sender: TObject);
    procedure ProcessosDue1Click(Sender: TObject);
    procedure SQlMonitor1Click(Sender: TObject);
    procedure Enquadramento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastroRegrasObservacoesAutomaticas1Click(Sender: TObject);
    procedure CadastroTabelasCamposRegrasObservaesAutomticas1Click(
      Sender: TObject);
    procedure WalletCadBancoClick(Sender: TObject);
    procedure WalletCadUsuarioClick(Sender: TObject);
    procedure WalletCadFilialClick(Sender: TObject);
    procedure WalletCadPaisClick(Sender: TObject);
    procedure WalletCadItemClick(Sender: TObject);
    procedure WalletCadOrganizacaoClick(Sender: TObject);
    procedure WalletCadServicoClick(Sender: TObject);
    procedure WalletCadFavorecidoClick(Sender: TObject);
    procedure WalletCadProdutoClick(Sender: TObject);
    procedure WalletCadGrupoClick(Sender: TObject);
    procedure WalletCadClienteClick(Sender: TObject);
    procedure WalletSolicitarNumerarioClick(Sender: TObject);
    procedure WalletCriarPagamentosClick(Sender: TObject);
    procedure WalletSolicitarPagamentoClick(Sender: TObject);
    procedure WalletTransferenciaPagamentoClick(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure WalletPreFaturamentoClick(Sender: TObject);
    procedure DraftBLClick(Sender: TObject);
    procedure DescriodeMercadoriaDraftClick(Sender: TObject);
    procedure ConfiguraoesClick(Sender: TObject);
  private
    { Private declarations }
  procedure OcultarMenus;
  procedure HabilitaMenu(menu : string);
  procedure ConfiguraUsuario;
  public
    { Public declarations }
  end;

  function StartupSystem: Boolean; stdcall;
  function GetLoginName: PWideChar;    stdcall;
  function GetPassword: PWideChar;     stdcall;


var
  formMain: TformMain;

    sUsuario  : string;
    sSenha    : string;
    sMenu     : string;
    sProcesso : string;

implementation

uses Aurelius.Engine.ObjectManager, CdRegraObservacoesAuto,CdRegraTabelaCampo,
ConnectionModuleV2, uWalletAuthUser, uWalletBank, uWalletCountry, uWalletItem, uWalletBranch,
uWalletOrganization,uWalletService, uWalletProductService, uWalletBeneficiaryAccount,
uWalletCustomerGroup, uWalletCustomer, uWalletNumerarios, uWalletPagamentos, uWalletSolicitacaoPagamento,
uWalletPagamentosTransferir, MyAuditoriaConsulta, uWalletPreFaturamento, FrmDraftBL, CdConfiguracoes;

  function StartupSystem: Boolean; external 'C:\ddbroker\MyLoginInt.dll';
  function GetLoginName: PWideChar;    external 'C:\ddbroker\MyLoginInt.dll';
  function GetPassword: PWideChar;     external 'C:\ddbroker\MyLoginInt.dll';

{$R *.dfm}

procedure TformMain.Auditoria1Click(Sender: TObject);
begin
  inherited;
  TformMyauditoriaConsulta.xShow(nil,TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.BancodeDados1Click(Sender: TObject);
begin
  inherited;
  TformFrBancoDados.xShowModal;
end;

procedure TformMain.CadastroRegrasObservacoesAutomaticas1Click(Sender: TObject);
begin
  inherited;
   TformMyCdRegraObservacoesAuto.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.CadastroTabelasCamposRegrasObservaesAutomticas1Click(
  Sender: TObject);
begin
  inherited;
   tFormCdRegraTabelaCampo.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.Enquadramento1Click(Sender: TObject);
begin
  inherited;
  TformMyCdEnquadramento.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.FormActivate(Sender: TObject);
begin
  inherited;
  if DebugHook = 0 then
  begin
    if sMenu <> '' then
    begin
      OcultarMenus;
      if sMenu = 'ProcessosDue1' then
        ProcessosDue1.Click
      else
      if sMenu = 'DraftBL' then
        DraftBL.Click
      else
      if sMenu = 'DescriodeMercadoriaDraft' then
        DescriodeMercadoriaDraft.Click
      else
      if sMenu = 'CadastroRegrasObservacoesAutomaticas1' then
        CadastroRegrasObservacoesAutomaticas1.Click
      else
      if sMenu = 'CadastroTabelasCamposRegrasObservaesAutomticas1' then
        CadastroTabelasCamposRegrasObservaesAutomticas1.Click
      else
      if sMenu = 'WalletSolicitarNumerario' then
        WalletSolicitarNumerario.Click
      else
      if sMenu = 'WalletCriarPagamentos' then
        WalletCriarPagamentos.Click
      else
      if sMenu = 'WalletSolicitarPagamento' then
        WalletSolicitarPagamento.Click
      else
      if sMenu = 'WalletCadBanco' then
        WalletCadBanco.Click
      else
      if sMenu = 'WalletCadCliente' then
        WalletCadCliente.Click
      else
	    if sMenu = 'WalletCadFavorecido' then
        WalletCadFavorecido.Click
      else
      if sMenu = 'WalletCadFilial' then
        WalletCadFilial.Click
      else
	    if sMenu = 'WalletCadGrupo' then
        WalletCadGrupo.Click
      else
      if sMenu = 'WalletCadItem' then
        WalletCadItem.Click
      else
	    if sMenu = 'WalletCadOrganizacao' then
        WalletCadOrganizacao.Click
      else
      if sMenu = 'WalletCadPais' then
        WalletCadPais.Click
      else
	    if sMenu = 'WalletCadProduto' then
        WalletCadProduto.Click
      else
      if sMenu = 'WalletCadServico' then
        WalletCadServico.Click
      else
	    if sMenu = 'WalletCadUsuario' then
        WalletCadUsuario.Click
      else
      if sMenu = 'WalletTransferenciaPagamento' then
        WalletTransferenciaPagamento.Click
      else
      if sMenu = 'WalletPreFaturamento' then
        WalletPreFaturamento.Click
      else
      if sMenu = 'WalletMenu' then
        HabilitaMenu(sMenu);
    end;
  end;
end;

procedure TformMain.OcultarMenus;
var
  i: Integer;
begin
  for I := 0 to MainMenu.Items.Count - 1 do
  begin
    MainMenu.Items.Items[i].Visible := false;
  end;
end;

procedure TformMain.HabilitaMenu(menu : string);
var
  i: Integer;
begin
  for I := 0 to MainMenu.Items.Count - 1 do
  begin
    if MainMenu.Items.Items[i].Name = menu then
      MainMenu.Items.Items[i].Visible := true;
  end;
end;

procedure TformMain.FormShow(Sender: TObject);
begin
  inherited;
  Caption := 'MiniBroker - ' + ServerName;

  ConfiguraUsuario;

  Auditoria.Auditar := false;
  Auditoria.Usuario := sUsuario;
end;

procedure TformMain.ConfiguraoesClick(Sender: TObject);
begin
  inherited;
  TformConfiguracoes.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.ConfiguraUsuario;
begin

  if trim(sUsuario) = '' then
  begin
    if StartupSystem then
    begin
      sUsuario := GetLoginName;
      sSenha := GetPassword;
    end
    else
      Close;
  end;

  lblUsuario.caption := sUsuario;
end;

procedure TformMain.DescriodeMercadoriaDraftClick(Sender: TObject);
begin
  inherited;
  TformMyCdDescricaoMercadoriaDraft.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.DraftBLClick(Sender: TObject);
begin
  inherited;
  TfrmCdDraftBL.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.Processos1Click(Sender: TObject);
begin
  inherited;
  TformMyCdProcesso.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.ProcessosDue1Click(Sender: TObject);
begin
  inherited;
  TformMvProcessoDue.xShow(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True);
end;

procedure TformMain.SQlMonitor1Click(Sender: TObject);
begin
  inherited;
  TformSQLMonitor.xShow;
end;

procedure TformMain.WalletCadFilialClick(Sender: TObject);
begin
  inherited;
   TfrmWalletBranch.xShow(nil,TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadGrupoClick(Sender: TObject);
begin
  inherited;
   TfrmWalletCustomerGroup.xShow(nil,TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadFavorecidoClick(Sender: TObject);
begin
  inherited;
   TfrmWalletBeneficiaryAccount.xShow(nil,TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadItemClick(Sender: TObject);
begin
  inherited;
   TFrmWalletItem.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadOrganizacaoClick(Sender: TObject);
begin
  inherited;
   TfrmWalletOrganization.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadPaisClick(Sender: TObject);
begin
  inherited;
   TfrmWalletCountry.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadProdutoClick(Sender: TObject);
begin
  inherited;
   TfrmWalletProductService.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadServicoClick(Sender: TObject);
begin
  inherited;
   TfrmWalletService.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletSolicitarNumerarioClick(Sender: TObject);
begin
  inherited;
  TfrmWalletNumerarios.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
end;

procedure TformMain.WalletSolicitarPagamentoClick(Sender: TObject);
begin
  inherited;
  TfrmWalletSolicitacaoPagamento.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
end;

procedure TformMain.WalletTransferenciaPagamentoClick(Sender: TObject);
begin
  inherited;
  if FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc then
    TfrmWalletPagamentosTransferir.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
  else
    Application.MessageBox(PWideChar('Usuário não está habilitado a fazer transferência de pagamento.'), 'Atenção!', MB_OK);
end;

procedure TformMain.WalletCadBancoClick(Sender: TObject);
begin
  inherited;
  TfrmWalletBank.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

procedure TformMain.WalletCadClienteClick(Sender: TObject);
begin
  inherited;
  TfrmWalletCustomer.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
end;

procedure TformMain.WalletCriarPagamentosClick(Sender: TObject);
begin
  inherited;
  TfrmWalletPagamentos.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
end;

procedure TformMain.WalletPreFaturamentoClick(Sender: TObject);
begin
  inherited;
  TfrmWalletPreFaturamento.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True)
end;

procedure TformMain.WalletCadUsuarioClick(Sender: TObject);
begin
  inherited;
   TfrmWalletAuthUser.xShow(nil,TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
end;

end.
