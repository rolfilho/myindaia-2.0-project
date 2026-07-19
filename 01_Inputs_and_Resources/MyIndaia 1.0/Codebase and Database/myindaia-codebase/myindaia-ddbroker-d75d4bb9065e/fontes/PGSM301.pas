unit PGSM301;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_trans_nota = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    ds_lista_: TDataSource;
    qry_lista_: TQuery;
    qry_lista_NR_PROCESSO: TStringField;
    qry_lista_NR_DECLARACAO_IMP: TStringField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_CD_PRODUTO: TStringField;
    qry_lista_NR_PROCESSO_AUX: TStringField;
    qry_lista_NR_DECLARACAO_IMP_Aux: TStringField;
    procedure qry_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_trans_nota: Tdatm_trans_nota;

implementation

{$R *.dfm}

procedure Tdatm_trans_nota.qry_lista_CalcFields(DataSet: TDataSet);
begin
  qry_lista_NR_PROCESSO_AUX.AsString :=
    Copy( qry_lista_NR_PROCESSO.AsString, 5, 14 );
  if qry_lista_NR_DECLARACAO_IMP.AsString <> '' then
     qry_lista_NR_DECLARACAO_IMP_Aux.AsString:=
         Copy( qry_lista_NR_DECLARACAO_IMP.AsString,  1, 2 ) + '/' +
         Copy( qry_lista_NR_DECLARACAO_IMP.AsString,  3, 7 ) + '-' +
         Copy( qry_lista_NR_DECLARACAO_IMP.AsString, 10, 1 );
end;

end.
