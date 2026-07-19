unit uWalletPreFaturamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, uWalletFrameBuscaProcesso,
   Aurelius.Engine.ObjectManager, Aurelius.Bind.BaseDataset, Vcl.ComCtrls,
  Data.DB, Aurelius.Bind.Dataset, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Generics.Collections, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmWalletPreFaturamento = class(TformMyForm)
    framePesquisaProc: TFrameWalletPesquisaProcesso;
    adsProcessoResumo: TAureliusDataset;
    dsProcessoResumo: TDataSource;
    adsProcessoResumoSelf: TAureliusEntityField;
    adsProcessoResumoDtAbertura: TDateTimeField;
    adsProcessoResumoDtDesembaraco: TDateTimeField;
    adsProcessoResumoDtSaida: TDateTimeField;
    adsProcessoResumoDtChegada: TDateTimeField;
    adsProcessoResumoQtLis: TIntegerField;
    adsProcessoResumoQtLisAnvisa: TIntegerField;
    adsProcessoResumoQtLisInmetro: TIntegerField;
    adsProcessoResumoQtLisMapa: TIntegerField;
    adsProcessoResumoQtContainers: TIntegerField;
    adsProcessoResumoGroupId: TAureliusEntityField;
    adsProcessoResumoGroupIdId: TLargeintField;
    adsProcessoResumoGroupIdName: TStringField;
    adsProcessoResumoCustomerId: TAureliusEntityField;
    adsProcessoResumoCustomerIdId: TLargeintField;
    adsProcessoResumoCustomerIdName: TStringField;
    adsProcessoResumoCustomerIdTaxid: TStringField;
    adsProcessoResumoProductId: TAureliusEntityField;
    adsProcessoResumoProductIdId: TLargeintField;
    adsProcessoResumoProductIdName: TStringField;
    adsProcessoResumoServiceId: TAureliusEntityField;
    adsProcessoResumoServiceIdId: TLargeintField;
    adsProcessoResumoServiceIdName: TStringField;
    adsProcessoResumoCdRepresentante: TAureliusEntityField;
    adsProcessoResumoCdRepresentanteId: TStringField;
    adsProcessoResumoCdRepresentanteName: TStringField;
    adsProcessoResumoCdViaTransporte: TAureliusEntityField;
    adsProcessoResumoCdViaTransporteId: TStringField;
    adsProcessoResumoCdViaTransporteName: TStringField;
    adsProcessoResumoTpEstufagem: TAureliusEntityField;
    adsProcessoResumoTpEstufagemId: TStringField;
    adsProcessoResumoTpEstufagemName: TStringField;
    adsProcessoResumoCdLocalEmbarque: TAureliusEntityField;
    adsProcessoResumoCdLocalEmbarqueId: TStringField;
    adsProcessoResumoCdLocalEmbarqueName: TStringField;
    adsProcessoResumoCdLocalDesembarque: TAureliusEntityField;
    adsProcessoResumoCdLocalDesembarqueId: TStringField;
    adsProcessoResumoCdLocalDesembarqueName: TStringField;
    dsItensAFaturar: TDataSource;
    adsProcessoResumoNrProcesso: TStringField;
    adsProcessoResumoCustomclearanceId: TLargeintField;
    pnlBotoes: TPanel;
    pgProcesso: TPageControl;
    tbsResumo: TTabSheet;
    pnlResumoProcesso: TPanel;
    lblProcesso: TLabel;
    lblCliente: TLabel;
    lblCNPJ: TLabel;
    lblRepresentante: TLabel;
    lblViaTransporte: TLabel;
    lblDataAbertura: TLabel;
    lblDesembaraco: TLabel;
    lblDataSaida: TLabel;
    lblDataChegada: TLabel;
    lblEstufagem: TLabel;
    lblLocalEmbarque: TLabel;
    lblLocalDesembarque: TLabel;
    lblQtLis: TLabel;
    lblQtLisAnvisa: TLabel;
    lblQtLisInmetro: TLabel;
    lblQtLisMapa: TLabel;
    lblQtContainers: TLabel;
    dbedtProcesso: TDBEdit;
    dbedtCdCliente: TDBEdit;
    dbedtCNPJ: TDBEdit;
    dbedtCdRepresentante: TDBEdit;
    dbedtViaTransporte: TDBEdit;
    dbedtDtAbertura: TDBEdit;
    dbedtDtDesembaraco: TDBEdit;
    dbeditDtSaida: TDBEdit;
    dbedtDtChegada: TDBEdit;
    dbedtCliente: TDBEdit;
    dbedtRepresentante: TDBEdit;
    dbedtTpEstufagem: TDBEdit;
    dbedtCdLocalEmbarque: TDBEdit;
    dbedtLocalEmbarque: TDBEdit;
    dbedtCdLocalDesembarque: TDBEdit;
    dbedtLocalDesembarque: TDBEdit;
    dbedtQtLis: TDBEdit;
    dbedtQtLisAnvisa: TDBEdit;
    dbedtQtLisInmetro: TDBEdit;
    dbedtQtLisMapa: TDBEdit;
    dbedtQtContainers: TDBEdit;
    tbsFaturamento: TTabSheet;
    pnlFaturamento: TPanel;
    Panel1: TPanel;
    lblItensAFaturar: TLabel;
    DBGrid1: TDBGrid;
    adsItensAFaturar: TAureliusDataset;
    adsItensAFaturarcodCP: TIntegerField;
    adsItensAFaturaritemName: TStringField;
    adsItensAFaturarvalue: TFloatField;
    procedure framePesquisaProcadsProcessoAfterClose(DataSet: TDataSet);
    procedure framePesquisaProcadsProcessoAfterOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure adsProcessoResumoAfterClose(DataSet: TDataSet);
    procedure framePesquisaProcbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  procedure DoCreate; override;
  procedure DoShow; override;
  procedure DoClose(var Action: TCloseAction); override;
  procedure CarregarDadosProcesso(nr_processo : string);
  procedure CarregarItensAFaturar(idProcesso, idGrupo : integer);
  public
    { Public declarations }
  end;

var
  frmWalletPreFaturamento: TfrmWalletPreFaturamento;

implementation

uses
  MyEntitiesV2, ConnectionModuleV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyUtil ;

{$R *.dfm}

procedure TfrmWalletPreFaturamento.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;

  framePesquisaProc.IniciarFrame(FObjectManager);
  pgProcesso.ActivePageIndex := 0;
end;

procedure TfrmWalletPreFaturamento.DoShow;
begin
  RegisterChild;
  inherited;
end;

procedure TfrmWalletPreFaturamento.FormDestroy(Sender: TObject);
begin
  adsItensAFaturar.Close;
  adsProcessoResumo.Close;
  inherited;
end;

procedure TfrmWalletPreFaturamento.adsProcessoResumoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  adsItensAFaturar.close;
end;

procedure TfrmWalletPreFaturamento.CarregarDadosProcesso(nr_processo : string);
begin
  try
    adsProcessoResumo.DisableControls;
    adsProcessoResumo.close;
    adsProcessoResumo.SetSourceCriteria(FObjectManager.Find<TVwProcessoResumo>
                                                      .Add(Linq.Eq('FNrProcesso',nr_processo))
                                                      .Refreshing);
    adsProcessoResumo.Open;
  finally
    adsProcessoResumo.EnableControls;
  end;
end;

procedure TfrmWalletPreFaturamento.CarregarItensAFaturar(idProcesso, idGrupo : integer);
begin
  try
    adsItensAFaturar.DisableControls;
    adsItensAFaturar.close;
    adsItensAFaturar.SetSourceCriteria(FireDacMSSQLV2(sUsuario).criteriaItensFaturar(idProcesso,idGrupo));
    adsItensAFaturar.Open;
  finally
    adsItensAFaturar.EnableControls;
  end;
end;

procedure TfrmWalletPreFaturamento.framePesquisaProcadsProcessoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  adsProcessoResumo.close;
end;

procedure TfrmWalletPreFaturamento.framePesquisaProcadsProcessoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not framePesquisaProc.adsProcesso.isempty then
  begin
    CarregarDadosProcesso(framePesquisaProc.adsProcessoCustomid.asstring);
    CarregarItensAFaturar(adsProcessoResumoCustomclearanceId.asinteger, adsProcessoResumoGroupIdId.asinteger);
  end;
end;

procedure TfrmWalletPreFaturamento.framePesquisaProcbtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  framePesquisaProc.btnPesquisarClick(Sender);
end;

procedure TfrmWalletPreFaturamento.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

end.
