unit FrAnvisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uWebModulo, Grids, DBGrids, StdCtrls, DB,
  DBTables, PGGP017, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Registry, ShellApi;

type
   TState = (stBrowser, stInsert, stEdit);
   
   TFormAnvisa = class(TForm)
    PageControl: TPageControl;
    dsMain: TDataSource;
    qryMain: TQuery;
    qryMainCD_EMPRESA: TStringField;
    qryMainNM_EMPRESA: TStringField;
    qryMainCGC_EMPRESA: TStringField;
    qryMainID_REPRESENTANTE: TStringField;
    qryMainID_REPRESENTADA: TStringField;
    Panel3: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewCD_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewNM_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewCGC_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewID_REPRESENTANTE: TcxGridDBColumn;
    cxGridDBTableViewID_REPRESENTADA: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    btnCaixaPosta: TSpeedButton;
    updMain: TUpdateSQL;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCaixaPostaClick(Sender: TObject);
  private
    State: TState;
    procedure ReopenQueryMain;
    procedure InverteBotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnvisa: TFormAnvisa;

implementation

uses
  KrQuery, KrDialog, KrUtil, KrGlobal;

{$R *.dfm}

procedure TFormAnvisa.ReopenQueryMain;
begin
  qryMain.Close;
  qryMain.Open;
end;

procedure TFormAnvisa.btnSalvarClick(Sender: TObject);
begin
  qryMain.Post;
  qryMain.ApplyUpdates;
  InverteBotoes;
end;

procedure TFormAnvisa.InverteBotoes;
begin
  btnAlterar.Enabled := not btnAlterar.Enabled;
  btnSalvar.Enabled := not btnSalvar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure TFormAnvisa.btnAlterarClick(Sender: TObject);
begin
  if (qryMain.RecordCount > 0) then
  begin
    State := stEdit;
    qryMain.Edit;
    InverteBotoes;
    cxGrid.SetFocus;
    cxGridDBTableView.Controller.EditingController.ShowEdit(cxGridDBTableViewID_REPRESENTANTE);
  end;
end;

procedure TFormAnvisa.btnCancelarClick(Sender: TObject);
begin
  State := stBrowser;
  qryMain.Cancel;
  InverteBotoes;
end;

procedure TFormAnvisa.FormShow(Sender: TObject);
begin
  qryMain.Open;
end;

procedure TFormAnvisa.btnCaixaPostaClick(Sender: TObject);
var
  MyBrowserPath: string;
  MyBrowser: string;
  Url: string;
  IDRep: string;
begin
  MyBrowserPath := GetMyBrowserPath;
  MyBrowser := MyBrowserPath+'MyBrowser.exe';
  if not FileExists( MyBrowser) then
  begin
    Warning('MyBrowser não encontrado no caminho ' + MyBrowser +'.'+#13#10+
      'Para resolver este problema tente executar o MyBrowser uma vez como administrador.');
    Exit;
  end;
  IDRep := qryMainID_REPRESENTANTE.AsString;
  if IDRep = '' then
  begin
    Warning('Não é possível prosseguir, o ID do Representante em branco.');
    Exit;
  end;
  Url := 'http://www.anvisa.gov.br/Datavisa/CaixaPostal/CaixaPostal.asp?'+
    'SID=99999999&sistema=P&idRep='+  IDRep +
    '&identificado='+ Trim(qryMainCGC_EMPRESA.AsString);
  StartApp('Open', PChar(MyBrowser), PChar(Url), PChar(MyBrowserPath), SW_SHOW);
end;

end.
