unit MainDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyMainEnterprise, MyMainBasic,
  Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Aurelius.Engine.DatabaseManager,
  Vcl.ExtCtrls, MvNotas, Vcl.AppEvnts;

type
  TformMainDemo = class(TformMyMainBasic)
    CriarBanco1: TMenuItem;
    DestruirBanco1: TMenuItem;
    Clientes1: TMenuItem;
    Auditoria1: TMenuItem;
    Produtos1: TMenuItem;
    NotasFiscais1: TMenuItem;
    procedure CriarBanco1Click(Sender: TObject);
    procedure DestruirBanco1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure NotasFiscais1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMainDemo: TformMainDemo;

implementation

{$R *.dfm}

uses ConnectionModule, CdClientes, MyAuditoria, MyAuditoriaConsulta, CdProduto;

procedure TformMainDemo.Auditoria1Click(Sender: TObject);
begin
  inherited;
  TformMyauditoriaConsulta.xShow(nil, FireDacMSSQL(daFiredac).ObjectManager);
end;

procedure TformMainDemo.Clientes1Click(Sender: TObject);
begin
  inherited;
  TformCdClientes.xShow;
end;

procedure TformMainDemo.CriarBanco1Click(Sender: TObject);
var
  DBManager: TDatabaseManager;
begin
  inherited;
  FireDacMSSQL.Configura('Antuerpia','Demo', 'sa', '123', 'MSSQL');
  DBManager := TDatabaseManager.Create(FireDacMSSQL(daFiredac).DBConnection);
  try
    DBManager.BuildDatabase;
    ShowMessage('Banco de dados construído.');
  finally
    DBManager.Free;
  end;
end;

procedure TformMainDemo.DestruirBanco1Click(Sender: TObject);
var
  DBManager: TDatabaseManager;
begin
  inherited;
  FireDacMSSQL.Configura('Antuerpia','Demo', 'sa', '123', 'MSSQL');
  DBManager := TDatabaseManager.Create(FireDacMSSQL(daFiredac).DBConnection);
  try
    DBManager.DestroyDatabase;
    ShowMessage('Banco de dados destruído.');
  finally
    DBManager.Free;
  end;
end;

procedure TformMainDemo.FormShow(Sender: TObject);
begin
  inherited;
  FireDacMSSQL.Configura('Antuerpia','Demo', 'sa', '123', 'MSSQL');
  FireDacMSSQL(daFiredac);
  Auditoria.Usuario := 'Márcio';
  Auditoria.Auditar := True;
end;

procedure TformMainDemo.NotasFiscais1Click(Sender: TObject);
begin
  inherited;
  {if not Assigned(formMyMvNotasFisais) then
  formMyMvNotasFisais := TformMyMvNotasFisais.xCreate as TformMyMvNotasFisais;//(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True) as TformMyMvNotasFisais;
  formMyMvNotasFisais.ClienteId := 0;
  formMyMvNotasFisais.xShow;}
  TformMyMvNotasFisais.xShow;
end;

procedure TformMainDemo.Produtos1Click(Sender: TObject);
begin
  inherited;
  TformMyCdProduto.xShow;
end;

end.
