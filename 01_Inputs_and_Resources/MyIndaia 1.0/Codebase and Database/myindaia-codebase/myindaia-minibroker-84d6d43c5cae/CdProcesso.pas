unit CdProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Aurelius.Bind.Dataset, Aurelius.Drivers.Interfaces, Aurelius.Engine.ObjectManager,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, CdProcessoCtx, MyEntitiesBroker,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Aurelius.Bind.BaseDataset;

type
  TformMyCdProcesso = class(TformMyCdBasic)
    Bevel1: TBevel;
    btnNotasFiscais: TButton;
    lblNrProcesso: TLabel;
    DBEdit2: TDBEdit;
    lblExportador: TLabel;
    DBEdit8: TDBEdit;
    btnConsultaProcesso: TBitBtn;
    DBEdit1: TDBEdit;
    Button1: TButton;
    adsMainSelf: TAureliusEntityField;
    adsMainNrProcesso: TStringField;
    adsMainCdCliente: TStringField;
    adsMainCdServico: TStringField;
    adsMainCdUsuario: TStringField;
    adsMainDtAbertura: TDateTimeField;
    adsMainInCancelado: TStringField;
    adsMainCdMoedaMle: TStringField;
    adsMainCdPaisDestino: TStringField;
    adsMainCdLocalDesembarque: TStringField;
    adsMainCdDespachanteSda: TStringField;
    adsMainNrProcessoExpTemp: TStringField;
    adsMainVlPesoLiquido: TFloatField;
    adsMainVlPesoBruto: TFloatField;
    adsMainCdIncoterm: TStringField;
    adsMainTpProcesso: TStringField;
    adsMainCdDespachante: TStringField;
    adsMainNrFatura: TStringField;
    adsMainCdImportador: TStringField;
    adsMainCdExportador: TStringField;
    adsMainCdRuc: TStringField;
    adsMainCdDue: TStringField;
    adsMainCdUnidNeg: TStringField;
    adsMainCdProduto: TStringField;
    adsMainProcessoExp: TAureliusEntityField;
    adsMainUnidNeg: TAureliusEntityField;
    adsMainProduto: TAureliusEntityField;
    cxGridDBTableViewNrProcesso: TcxGridDBColumn;
    procedure btnNotasFiscaisClick(Sender: TObject);
  private
    Opcoes: TOpcoesProcessoCtx;
    procedure LoadData(NrProcesso: string = '');
  protected
    procedure QueryContexto;
    procedure DoActivate; override;
    procedure DoCreate; override;
    { Private declarations }
  public

  end;

var
  formMyCdProcesso: TformMyCdProcesso;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

{ TformMyCdProcesso }

procedure TformMyCdProcesso.DoCreate;
begin
  inherited;

end;

procedure TformMyCdProcesso.LoadData(NrProcesso: string);
var
  Criteria: TCriteria;
  Term: string;
begin
  if (NrProcesso.IsEmpty) and (adsMain.Current<TTprocesso> <> nil) then
    NrProcesso := adsMain.Current<TTprocesso>.NrProcesso;
  adsMain.Close;
  //FObjectManager.Clear;

  Criteria := FObjectManager.Find<TTprocesso>.OrderBy('NrProcesso');
  if not Opcoes.UnidadeNegocio.IsEmpty then
    Criteria.Add(Linq.Eq('FUnidNeg', Opcoes.UnidadeNegocio));

 // if not Opcoes.Produto.IsEmpty then
 //   Criteria.Add(Linq.Eq('FProduto', Opcoes.Produto));

  Criteria.CreateAlias('Produto', 'prd').Add(Linq.Eq('prd.CdProduto', '02'));

  if (Opcoes.DataInicial > 0) and (Opcoes.DataFinal > 0) then
  begin
    Criteria.Add(Linq.GreaterOrEqual('DtAbertura', Opcoes.DataInicial));
    Criteria.Add(Linq.LessThan('DtAbertura', Opcoes.DataFinal + 1));
  end;

  if not Opcoes.NrProcesso.IsEmpty then
    Criteria.Add(Linq.Eq('NrProcesso', Opcoes.NrProcesso));

  adsMain.SetSourceCriteria(Criteria);

  adsMain.Open;
end;


procedure TformMyCdProcesso.QueryContexto;
begin
   Opcoes.Produto := '02';
  if TformMyCdProcessoCtx.Execute(Opcoes, [cvPeriodo, cvNumeroProcesso]) then
  begin
    LoadData;
  end;
end;

procedure TformMyCdProcesso.btnNotasFiscaisClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TformMyCdProcesso.DoActivate;
begin
  inherited;
  QueryContexto;
end;


end.
