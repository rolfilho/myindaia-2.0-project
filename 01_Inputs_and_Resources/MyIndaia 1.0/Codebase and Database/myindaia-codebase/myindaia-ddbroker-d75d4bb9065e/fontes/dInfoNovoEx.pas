unit dInfoNovoEx;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_info_novoex = class(TDataModule)
    qryREItensNovoEx: TQuery;
    dsREitensNovoEx: TDataSource;
    qryREItensNovoExNR_PROCESSO: TStringField;
    qryREItensNovoExNR_RE: TStringField;
    qryREItensNovoExNR_NCM: TStringField;
    qryREItensNovoExTX_MERCADORIA: TMemoField;
    qryREItensNovoExVL_COND_VENDA: TFloatField;
    qryREItensNovoExVL_LOCAL_EMB: TFloatField;
    qryREItensNovoExQT_UNID_COMERC: TFloatField;
    qryREItensNovoExTX_UNID_COMERC: TMemoField;
    qryREItensNovoExQT_UNID_ESTAT: TFloatField;
    qryREItensNovoExTX_UNID_ESTAT: TMemoField;
    qryREItensNovoExQT_PESO_LIQ: TFloatField;
    qryREItensNovoExTX_ENQUADRAMENTO: TMemoField;
    qryREItensNovoExIN_ITEM_CO: TBooleanField;
    updREItensNovoEx: TUpdateSQL;
    qryREItensNovoExNR_ITEM: TIntegerField;
    procedure qryREItensNovoExAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_info_novoex: Tdatm_info_novoex;

implementation

{$R *.dfm}


procedure Tdatm_info_novoex.qryREItensNovoExAfterPost(DataSet: TDataSet);
begin
  qryREItensNovoEx.ApplyUpdates;
end;

end.
