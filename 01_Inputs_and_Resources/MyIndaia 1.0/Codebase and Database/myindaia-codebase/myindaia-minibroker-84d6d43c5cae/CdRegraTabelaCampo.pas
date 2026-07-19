unit CdRegraTabelaCampo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, Aurelius.Bind.Dataset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Aurelius.Engine.ObjectManager,
  Aurelius.Events.Manager, Aurelius.Global.Utils, Aurelius.Drivers.Interfaces,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, cxContainer, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  Aurelius.Bind.BaseDataset;

type
  TFormCdRegraTabelaCampo = class(TformMyCdMasterDetail)
    cxGridDBTableViewDetailCdRegraCampo: TcxGridDBColumn;
    cxGridDBTableViewDetailNmCampo: TcxGridDBColumn;
    cxGridDBTableViewDetailDsCampo: TcxGridDBColumn;
    cxGridDBTableViewDetailNmTabelaOrigem: TcxGridDBColumn;
    cxGridDBTableViewDetailNmCampoCdOrigem: TcxGridDBColumn;
    cxGridDBTableViewDetailNmCampoDsOrigem: TcxGridDBColumn;
    cxGridDBTableViewCdRegraTabela: TcxGridDBColumn;
    cxGridDBTableViewNmTabelaRegra: TcxGridDBColumn;
    cxGridDBTableViewDsTabelaRegra: TcxGridDBColumn;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    adsMainSelf: TAureliusEntityField;
    adsMainCdRegraTabela: TIntegerField;
    adsMainNmTabelaRegra: TStringField;
    adsMainDsTabelaRegra: TStringField;
    adsMainCampos: TDataSetField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailCdRegraCampo: TIntegerField;
    adsDetailNmCampo: TStringField;
    adsDetailDsCampo: TStringField;
    adsDetailNmTabelaOrigem: TStringField;
    adsDetailNmCampoCdOrigem: TStringField;
    adsDetailNmCampoDsOrigem: TStringField;
    adsDetailTabela: TAureliusEntityField;
    adsDetailTabelaCdRegraTabela: TIntegerField;
    adsDetailTabelaNmTabelaRegra: TStringField;
    adsDetailTabelaDsTabelaRegra: TStringField;
    adsDetailTabelaCampos: TDataSetField;
    adsDetailTxWhereExtra: TStringField;
    Label1: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label2: TLabel;
    cxGridDBTableViewDetailTxWhereExtra: TcxGridDBColumn;
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure cxDBTextEdit10KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure AfterDetailInsert; override;
  end;

var
  FormCdRegraTabelaCampo: TFormCdRegraTabelaCampo;

implementation

{$R *.dfm}

uses ConnectionModule, FrPesquisa, MyEntitiesBroker, Aurelius.Criteria.Linq;

procedure tFormCdRegraTabelaCampo.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure tFormCdRegraTabelaCampo.DoShow;
begin
  inherited;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TTregraObsAutoTabelas>);
  adsMain.Open;
end;

procedure TFormCdRegraTabelaCampo.adsDetailBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TFormCdRegraTabelaCampo.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TFormCdRegraTabelaCampo.adsMainBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TFormCdRegraTabelaCampo.adsMainBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure tFormCdRegraTabelaCampo.AfterDetailInsert;
begin
  inherited;
  adsDetailTabela.AsObject := adsMainSelf.AsObject;
end;


procedure TFormCdRegraTabelaCampo.cxDBTextEdit10KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key in [''''] then
    abort;

end;

end.
