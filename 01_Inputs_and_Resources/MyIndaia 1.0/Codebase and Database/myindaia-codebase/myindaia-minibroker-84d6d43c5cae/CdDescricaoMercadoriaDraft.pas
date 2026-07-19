unit CdDescricaoMercadoriaDraft;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  Aurelius.Engine.ObjectManager,
  MyEntitiesBroker, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Aurelius.Bind.BaseDataset,
  cxContainer, cxMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, FrPesquisa,
  Vcl.Buttons, FrMercadoriasCadDescMercadoria;

type
  TformMyCdDescricaoMercadoriaDraft = class(TformMyCdBasic)
    adsMainCodigo: TIntegerField;
    adsMainTxDescricaoIngles: TMemoField;
    adsMainTxDescricaoEspanhol: TMemoField;
    cxGridDBTableViewCodigo: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    adsMainSelf: TAureliusEntityField;
    adsMainCdGrupo: TStringField;
    adsMainTxDescricaoPortugues: TMemoField;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    adsGrupos: TAureliusDataset;
    dtsGrupos: TDataSource;
    adsGruposSelf: TAureliusEntityField;
    adsGruposCdGrupo: TStringField;
    adsGruposNmGrupo: TStringField;
    adsGruposDtInclusao: TDateTimeField;
    adsGruposInAtivo: TStringField;
    adsGruposCnpjGrupo: TStringField;
    adsGruposDtNovoFollowupImp: TDateTimeField;
    adsGruposDtNovoFollowupExp: TDateTimeField;
    adsGruposNmEmailDraftBl: TStringField;
    adsMainNmDescricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    cxGridDBTableViewNmDescricao: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
  private
    procedure LoockupsGrupos;
  protected
    procedure DoShow; override;
    procedure DoCreate; override;
    procedure BeforeEdit; override;
    procedure BeforeInsert; override;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  formMyCdDescricaoMercadoriaDraft: TformMyCdDescricaoMercadoriaDraft;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

{$R *.dfm}

{ TformMyCdEnquadramento }

procedure TformMyCdDescricaoMercadoriaDraft.BeforeEdit;
begin
  inherited;
  LoockupsGrupos;
end;

procedure TformMyCdDescricaoMercadoriaDraft.BeforeInsert;
begin
  inherited;
  LoockupsGrupos;
end;

procedure TformMyCdDescricaoMercadoriaDraft.Button1Click(Sender: TObject);
var
  vDescricaoMercadoriaDraft: TTDescricaoMercadoriaDraft;
begin
  inherited;
  vDescricaoMercadoriaDraft := TTDescricaoMercadoriaDraft(adsMainSelf.AsObject);
  TformMercadoriasCadDescMercadoria.Execute(adsMainCdGrupo.AsString, vDescricaoMercadoriaDraft);
end;

procedure TformMyCdDescricaoMercadoriaDraft.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);// FireDacMSSQL.ObjectManager;
    FOwnsManager := True;
  end;
end;

procedure TformMyCdDescricaoMercadoriaDraft.LoockupsGrupos;
begin
  adsGrupos.Close;
  adsGrupos.SetSourceCriteria(FObjectManager.Find<TTGrupo>.Add(linq.Eq('InAtivo', '1'))
                                                          .OrderBy('NmGrupo'));

  adsGrupos.Open;
end;

procedure TformMyCdDescricaoMercadoriaDraft.DoShow;
begin
  inherited;
  adsMain.SetSourceCriteria(FObjectManager.Find<TTDescricaoMercadoriaDraft>);
  adsMain.Open;
end;

end.
