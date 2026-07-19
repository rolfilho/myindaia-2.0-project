unit CdRegraObservacoesAuto;

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
  FireDAC.Comp.Client,Aurelius.Criteria.Projections, Aurelius.Bind.BaseDataset;

type
  TformMyCdRegraObservacoesAuto = class(TformMyCdMasterDetail)
    Label1: TLabel;
    dbedtCdRegra: TDBEdit;
    Label2: TLabel;
    dbedtDescricao: TDBEdit;
    Label3: TLabel;
    dbcbCdRegraTabela: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    dbedtValorCampo: TDBEdit;
    btnPesquisaValorMaster: TSpeedButton;
    Label9: TLabel;
    dbedtCD_OBS: TDBEdit;
    btnSelecionarObs: TSpeedButton;
    dbcbCdRegraCampo: TDBLookupComboBox;
    adsRegraTabela: TAureliusDataset;
    dsRegraTabela: TDataSource;
    adsRegraCampo: TAureliusDataset;
    dsRegraCampo: TDataSource;
    cxGridDBTableViewCdRegra: TcxGridDBColumn;
    cxGridDBTableViewNmRegra: TcxGridDBColumn;
    cxGridDBTableViewCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewCdObservacao: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdRegraItem: TcxGridDBColumn;
    cxGridDBTableViewDetailListNmRegraItem: TcxGridDBColumn;
    cxGridDBTableViewDetailCdRegraItem: TcxGridDBColumn;
    cxGridDBTableViewDetailNmRegraItem: TcxGridDBColumn;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnPesquisaValorItem: TSpeedButton;
    dbedCdRegraItem: TDBEdit;
    dbedtDescricaoItem: TDBEdit;
    dbcbCdRegraTabelaItem: TDBLookupComboBox;
    dbedtNmValorCampo: TDBEdit;
    dbcbCdRegraCampoItem: TDBLookupComboBox;
    cxGridDBTableViewGrupoNmGrupo: TcxGridDBColumn;
    adsRegraCampoSelf: TAureliusEntityField;
    adsRegraCampoCdRegraCampo: TIntegerField;
    adsRegraCampoNmCampo: TStringField;
    adsRegraCampoDsCampo: TStringField;
    adsRegraCampoNmTabelaOrigem: TStringField;
    adsRegraCampoNmCampoCdOrigem: TStringField;
    adsRegraCampoNmCampoDsOrigem: TStringField;
    adsRegraCampoTabela: TAureliusEntityField;
    adsRegraCampoTabelaCdRegraTabela: TIntegerField;
    adsRegraCampoTabelaNmTabelaRegra: TStringField;
    adsRegraCampoTabelaDsTabelaRegra: TStringField;
    adsRegraTabelaSelf: TAureliusEntityField;
    adsRegraTabelaCdRegraTabela: TIntegerField;
    adsRegraTabelaNmTabelaRegra: TStringField;
    adsRegraTabelaDsTabelaRegra: TStringField;
    adsRegraTabelaItem: TAureliusDataset;
    dsRegraTabelaItem: TDataSource;
    dsRegraCampoItem: TDataSource;
    adsRegraCampoItem: TAureliusDataset;
    lblpesquisa: TLabel;
    lblpesquisaItem: TLabel;
    dbcbGrupo: TDBLookupComboBox;
    adsGrupo: TAureliusDataset;
    dsGrupo: TDataSource;
    adsGrupoSelf: TAureliusEntityField;
    adsGrupoCdGrupo: TStringField;
    adsGrupoNmGrupo: TStringField;
    adsGrupoDtInclusao: TDateTimeField;
    adsGrupoInAtivo: TStringField;
    adsGrupoCnpjGrupo: TStringField;
    dbcbNmGrupo: TDBLookupComboBox;
    adsGrupoDtNovoFollowupImp: TDateTimeField;
    adsGrupoDtNovoFollowupExp: TDateTimeField;
    dbedtServico: TDBEdit;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    adsRegraCampoItemSelf: TAureliusEntityField;
    adsRegraCampoItemCdRegraCampo: TIntegerField;
    adsRegraCampoItemNmCampo: TStringField;
    adsRegraCampoItemDsCampo: TStringField;
    adsRegraCampoItemNmTabelaOrigem: TStringField;
    adsRegraCampoItemNmCampoCdOrigem: TStringField;
    adsRegraCampoItemNmCampoDsOrigem: TStringField;
    adsRegraCampoItemTabela: TAureliusEntityField;
    adsRegraTabelaItemSelf: TAureliusEntityField;
    adsRegraTabelaItemCdRegraTabela: TIntegerField;
    adsRegraTabelaItemNmTabelaRegra: TStringField;
    adsRegraTabelaItemDsTabelaRegra: TStringField;
    adsRegraTabelaItemCampos: TDataSetField;
    adsMainSelf: TAureliusEntityField;
    adsMainCdRegra: TIntegerField;
    adsMainNmRegra: TStringField;
    adsMainNmValorCampo: TStringField;
    adsMainCdObservacao: TStringField;
    adsMainCdServico: TStringField;
    adsMainGrupo: TAureliusEntityField;
    adsMainGrupoCdGrupo: TStringField;
    adsMainGrupoNmGrupo: TStringField;
    adsMainGrupoDtInclusao: TDateTimeField;
    adsMainGrupoInAtivo: TStringField;
    adsMainGrupoCnpjGrupo: TStringField;
    adsMainGrupoDtNovoFollowupImp: TDateTimeField;
    adsMainGrupoDtNovoFollowupExp: TDateTimeField;
    adsMainTabela: TAureliusEntityField;
    adsMainTabelaCdRegraTabela: TIntegerField;
    adsMainTabelaNmTabelaRegra: TStringField;
    adsMainTabelaDsTabelaRegra: TStringField;
    adsMainTabelaCampos: TDataSetField;
    adsMainCampo: TAureliusEntityField;
    adsMainCampoCdRegraCampo: TIntegerField;
    adsMainCampoNmCampo: TStringField;
    adsMainCampoDsCampo: TStringField;
    adsMainCampoNmTabelaOrigem: TStringField;
    adsMainCampoNmCampoCdOrigem: TStringField;
    adsMainCampoNmCampoDsOrigem: TStringField;
    adsMainCampoTabela: TAureliusEntityField;
    adsMainCampoTabelaCdRegraTabela: TIntegerField;
    adsMainCampoTabelaNmTabelaRegra: TStringField;
    adsMainCampoTabelaDsTabelaRegra: TStringField;
    adsMainCampoTabelaCampos: TDataSetField;
    adsMainRegraItem: TDataSetField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailCdRegraItem: TIntegerField;
    adsDetailNmRegraItem: TStringField;
    adsDetailNmValorCampo: TStringField;
    adsDetailRegra: TAureliusEntityField;
    adsDetailRegraCdRegra: TIntegerField;
    adsDetailRegraNmRegra: TStringField;
    adsDetailRegraNmValorCampo: TStringField;
    adsDetailRegraCdObservacao: TStringField;
    adsDetailRegraCdServico: TStringField;
    adsDetailRegraGrupo: TAureliusEntityField;
    adsDetailRegraTabela: TAureliusEntityField;
    adsDetailRegraCampo: TAureliusEntityField;
    adsDetailRegraRegraItem: TDataSetField;
    adsDetailTabela: TAureliusEntityField;
    adsDetailTabelaCdRegraTabela: TIntegerField;
    adsDetailTabelaNmTabelaRegra: TStringField;
    adsDetailTabelaDsTabelaRegra: TStringField;
    adsDetailTabelaCampos: TDataSetField;
    adsDetailCampo: TAureliusEntityField;
    adsDetailCampoCdRegraCampo: TIntegerField;
    adsDetailCampoNmCampo: TStringField;
    adsDetailCampoDsCampo: TStringField;
    adsDetailCampoNmTabelaOrigem: TStringField;
    adsDetailCampoNmCampoCdOrigem: TStringField;
    adsDetailCampoNmCampoDsOrigem: TStringField;
    adsDetailCampoTabela: TAureliusEntityField;
    cxGridDBTableViewDetailNmValorCampo: TcxGridDBColumn;
    cxGridDBTableViewDetailTabelaDsTabelaRegra: TcxGridDBColumn;
    cxGridDBTableViewDetailCampoDsCampo: TcxGridDBColumn;
    procedure dbcbCdRegraTabelaClick(Sender: TObject);
    procedure btnSelecionarObsClick(Sender: TObject);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure dbcbCdRegraTabelaItemClick(Sender: TObject);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure btnPesquisaValorMasterClick(Sender: TObject);
    procedure btnPesquisaValorItemClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
   procedure AbreTabelaRegraTabela;
   procedure AbreTabelaRegraCampo;
   procedure AbreTabelaRegraCampoItem;
   procedure AbreTabelaRegraTabelaItem;
   function PesquisaValor(Tabela, Campo, Descricao : String; var Valor : String) : Boolean;
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure AfterDetailInsert; override;
  end;

var
  formMyCdRegraObservacoesAuto: TformMyCdRegraObservacoesAuto;

implementation

{$R *.dfm}

uses ConnectionModule, FrPesquisa, MyEntitiesBroker, Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

procedure TformMyCdRegraObservacoesAuto.btnSelecionarObsClick(Sender: TObject);
var
  Tabela, Campo, Descricao, Valor : String;
begin
  inherited;
  Tabela    := 'Tobservacoes';
  Campo     := 'CdObs';
  Descricao := 'TxDescricao';

  PesquisaValor(Tabela, Campo, Descricao, Valor);

  if Valor <> '' then
    adsMainCdObservacao.AsString := Valor;
end;

procedure TformMyCdRegraObservacoesAuto.dbcbCdRegraTabelaClick(Sender: TObject);
begin
  inherited;
  AbreTabelaRegraCampo;
end;

procedure TformMyCdRegraObservacoesAuto.dbcbCdRegraTabelaItemClick(
  Sender: TObject);
begin
  inherited;
  AbreTabelaRegraCampoItem;
end;

procedure TformMyCdRegraObservacoesAuto.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TformMyCdRegraObservacoesAuto.DoShow;
var
 Criteria: TCriteria;
begin
  inherited;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TTregraObsAuto>);
  adsMain.Open;

  Criteria := FObjectManager.find<TTGrupo>.add(Linq.Eq('InAtivo', 1)).OrderBy('NmGrupo');
  adsGrupo.close;
  //adsGrupo.SetSourceCriteria((FObjectManager.Find<TTGrupo>).OrderBy('NmGrupo'));
  adsGrupo.SetSourceCriteria(Criteria);
  adsGrupo.Open;
end;

procedure TformMyCdRegraObservacoesAuto.btnPesquisaValorItemClick(
  Sender: TObject);
var
  Tabela, Campo, Descricao, Valor : String;
begin
  inherited;
  Tabela    := StringReplace(adsRegraCampoItemNmTabelaOrigem.AsString, '_', '', [rfReplaceAll]);
  Campo     := StringReplace(adsRegraCampoItemNmCampoCdOrigem.AsString, '_', '', [rfReplaceAll]);
  Descricao := StringReplace(adsRegraCampoItemNmCampoDsOrigem.AsString, '_', '', [rfReplaceAll]);

  lblpesquisaItem.visible := not PesquisaValor(Tabela, Campo, Descricao, Valor);

  if Valor <> '' then
    adsDetailNmValorCampo.AsString := Valor;
end;

procedure TformMyCdRegraObservacoesAuto.btnPesquisaValorMasterClick(Sender: TObject);
var
  Tabela, Campo, Descricao, Valor : String;
begin
  inherited;
  Tabela    := StringReplace(adsRegraCampoNmTabelaOrigem.AsString, '_', '', [rfReplaceAll]);
  Campo     := StringReplace(adsRegraCampoNmCampoCdOrigem.AsString, '_', '', [rfReplaceAll]);
  Descricao := StringReplace(adsRegraCampoNmCampoDsOrigem.AsString, '_', '', [rfReplaceAll]);

  lblpesquisa.visible := not PesquisaValor(Tabela, Campo, Descricao, Valor);

  if Valor <> '' then
    adsMainNmValorCampo.AsString := Valor;
end;

function TformMyCdRegraObservacoesAuto.PesquisaValor(Tabela, Campo, Descricao : String; var Valor : String) : Boolean;
var
  Pesquisa: TObject;
  WhereDefaut: TWhereDefaut;
begin
  Valor   := '';
  Result  := false;

  if UpperCase(Tabela) = UpperCase('Tlocalembarque') then
  begin
    Pesquisa := TformMyPesquisa.Execute(TTlocalEmbarque,[Campo+'=Código', Descricao+'=Descrição'],
                                                        [Campo+'=Código', Descricao+'=Descrição'],
                                        WhereDefaut);
    try
    if TTlocalembarque(Pesquisa).Codigo <> Campo+'=Código' then
      Valor := TTlocalembarque(Pesquisa).Codigo;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('tpais') then
  begin
    Pesquisa := TformMyPesquisa.Execute(ttpais,[Campo+'=Código', Descricao+'=Descrição'],
                                               [Campo+'=Código', Descricao+'=Descrição'],
                                        WhereDefaut);
    try
    if ttpais(Pesquisa).Codigo <> Campo+'=Código' then
      Valor := ttpais(Pesquisa).Codigo;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('tregtributario') then
  begin
    Pesquisa := TformMyPesquisa.Execute(ttregtributario,[Campo+'=Código', Descricao+'=Descrição'],
                                                        [Campo+'=Código', Descricao+'=Descrição'],
                                        WhereDefaut);
    try
    if ttregtributario(Pesquisa).Codigo <> Campo+'=Código' then
      Valor := ttregtributario(Pesquisa).Codigo;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('tfundlegregtribut') then
  begin
    Pesquisa := TformMyPesquisa.Execute(ttfundlegregtribut,[Campo+'=Código', Descricao+'=Descrição'],
                                                           [Campo+'=Código', Descricao+'=Descrição'],
                                        WhereDefaut);
    try
    if ttfundlegregtribut(Pesquisa).Codigo <> Campo+'=Código' then
      Valor := ttfundlegregtribut(Pesquisa).Codigo;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('ttpacordotarif') then
  begin
    Pesquisa := TformMyPesquisa.Execute(tttpacordotarif,[Campo+'=Código', Descricao+'=Descrição'],
                                                        [Campo+'=Código', Descricao+'=Descrição'],
                                        WhereDefaut);
    try
    if tttpacordotarif(Pesquisa).CdTipoAcordoTar <> Campo+'=Código' then
      Valor := tttpacordotarif(Pesquisa).CdTipoAcordoTar;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('ttpexoneracao') then
  begin
    Pesquisa := TformMyPesquisa.Execute(tttpexoneracao,[Campo+'=Código', Descricao+'=Descrição'],
                                                       [Campo+'=Código', Descricao+'=Descrição'],
                                   WhereDefaut);
    try
    if tttpexoneracao(Pesquisa).CdEx <> Campo+'=Código' then
      Valor := tttpexoneracao(Pesquisa).CdEx;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('tobservacoes') then
  begin
    Pesquisa := TformMyPesquisa.Execute(ttobservacoes,[Campo+'=Código', Descricao+'=Descrição'],
                                                      [Campo+'=Código', Descricao+'=Descrição'],
                                   WhereDefaut);
    try
    if ttobservacoes(Pesquisa).CdObs <> Campo+'=Código' then
      Valor := ttobservacoes(Pesquisa).CdObs;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('Tservico') then
  begin
    Pesquisa := TformMyPesquisa.Execute(TTservico,[Campo+'=Código', Descricao+'=Descrição'],
                                                  [Campo+'=Código', Descricao+'=Descrição'],
                                   WhereDefaut);
    try
    if TTservico(Pesquisa).CdServico <> Campo+'=Código' then
      Valor := TTservico(Pesquisa).CdServico;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;


  if UpperCase(Tabela) = UpperCase('TservicoNovo') then
  begin
    Pesquisa := TformMyPesquisa.Execute(TTservicoNovo,[Campo+'=Código', Descricao+'=Descrição'],
                                                      [Campo+'=Código', Descricao+'=Descrição'],
                                   WhereDefaut);
    try
      if  inttostr(TTservicoNovo(Pesquisa).CdServico) <> Campo+'=Código' then
        Valor := inttostr(TTservicoNovo(Pesquisa).CdServico);
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;

  if UpperCase(Tabela) = UpperCase('tarmazem') then
  begin
    Pesquisa := TformMyPesquisa.Execute(TTarmazem,[Campo+'=Código', Descricao+'=Descrição'],
                                                  [Campo+'=Código', Descricao+'=Descrição'],
                                   WhereDefaut);
    try
      if  TTarmazem(Pesquisa).CdArmazem <> Campo+'=Código' then
        Valor := TTarmazem(Pesquisa).CdArmazem;
    except on e:exception do
     Valor := '';
    end;

    Result := true;
    exit;
  end;

end;

procedure TformMyCdRegraObservacoesAuto.SpeedButton1Click(Sender: TObject);
var
  Tabela, Campo, Descricao, Valor : String;
begin
  inherited;
  if adsGrupoDtNovoFollowupImp.AsString = '' then
  begin
    Tabela    := 'Tservico';
    Campo     := 'CdServico';
    Descricao := 'NmServico';

    PesquisaValor(Tabela, Campo, Descricao, Valor);

    if Valor <> '' then
      adsMainCdServico.AsString := Valor;
  end
  else
  begin
    Tabela    := 'TservicoNovo';
    Campo     := 'CdServico';
    Descricao := 'NmServico';

    PesquisaValor(Tabela, Campo, Descricao, Valor);

    if Valor <> '' then
      adsMainCdServico.AsString := Valor;
  end;
end;

procedure TformMyCdRegraObservacoesAuto.AbreTabelaRegraTabela;
begin
  adsRegraTabela.close;
  adsRegraTabela.SetSourceCriteria(FObjectManager.Find<TTregraObsAutoTabelas>);
  adsRegraTabela.Open;

  AbreTabelaRegraCampo;
end;

procedure TformMyCdRegraObservacoesAuto.AbreTabelaRegraTabelaItem;
begin
  adsRegraTabelaItem.close;
  adsRegraTabelaItem.SetSourceCriteria(FObjectManager.Find<TTregraObsAutoTabelas>);
  adsRegraTabelaItem.Open;

  AbreTabelaRegraCampoItem;
end;

procedure TformMyCdRegraObservacoesAuto.AbreTabelaRegraCampoItem;
begin
  adsRegraCampoItem.close;
  if not( (dbcbCdRegraTabelaItem.KeyValue = null) or (dbcbCdRegraTabelaItem.KeyValue = 0) ) then
  begin
    adsRegraCampoItem.SetSourceCriteria(FObjectManager.Find<TTregraObsAutoTabelasCampos>
     .CreateAlias('Tabela', 't')
     .Add(Linq.Eq('t.CdRegraTabela', adsRegraTabelaItemCdRegraTabela.AsString)));
     adsRegraCampoItem.Open;
  end;
end;

procedure TformMyCdRegraObservacoesAuto.AbreTabelaRegraCampo;
begin
  adsRegraCampo.close;
  if not( (dbcbCdRegraTabela.KeyValue = null) or (dbcbCdRegraTabela.KeyValue = 0) ) then
  begin
    adsRegraCampo.SetSourceCriteria(FObjectManager.Find<TTregraObsAutoTabelasCampos>
     .CreateAlias('Tabela', 't')
     .Add(Linq.Eq('t.CdRegraTabela', adsRegraTabelaCdRegraTabela.AsString)));
     adsRegraCampo.Open;
  end;
end;

procedure TformMyCdRegraObservacoesAuto.adsDetailBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  AbreTabelaRegraTabelaItem;
end;

procedure TformMyCdRegraObservacoesAuto.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  AbreTabelaRegraTabelaItem;
end;

procedure TformMyCdRegraObservacoesAuto.adsMainBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  AbreTabelaRegraTabela;
end;

procedure TformMyCdRegraObservacoesAuto.adsMainBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  AbreTabelaRegraTabela;
end;

procedure TformMyCdRegraObservacoesAuto.AfterDetailInsert;
begin
  inherited;
  adsDetailRegra.AsObject := adsMainSelf.AsObject;
end;

end.
