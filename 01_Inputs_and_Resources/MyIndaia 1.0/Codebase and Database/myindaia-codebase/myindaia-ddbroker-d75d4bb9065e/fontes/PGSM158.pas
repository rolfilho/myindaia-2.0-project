unit PGSM158;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ncm = class(TDataModule)
    qry_ncm_: TQuery;
    qry_ncm_CODIGO: TStringField;
    qry_ncm_DESCRICAO: TStringField;
    qry_ncm_UNIDADE_MEDIDA: TStringField;
    qry_ncm_ALIQUOTA_II: TStringField;
    qry_ncm_DATA_INICIO_VIG_II: TStringField;
    qry_ncm_DATA_FIM_VIG_II: TStringField;
    qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    qry_ncm_ALIQUOTA_IPI: TStringField;
    qry_ncm_DATA_INICIO_VIG_IPI: TStringField;
    qry_ncm_DATA_FIM_VIG_IPI: TStringField;
    ds_ncm_: TDataSource;
    tbl_unid_med_: TTable;
    tbl_unid_med_CD_UNID_MEDIDA: TStringField;
    tbl_unid_med_NM_UNID_MEDIDA: TStringField;
    tbl_unid_med_IN_ATIVO: TStringField;
    tbl_unid_med_CD_GIPLITE: TStringField;
    qry_ncm_nm_unid_medida: TStringField;
    qry_ncm_ALIQUOTA_PIS_ADVAL: TStringField;
    qry_ncm_DATA_INI_VIG_PIS_ADVAL: TStringField;
    qry_ncm_DATA_FIM_VIG_PIS_ADVAL: TStringField;
    qry_ncm_ALIQUOTA_COFINS_ADVAL: TStringField;
    qry_ncm_DATA_INI_VIG_COFINS_ADVAL: TStringField;
    qry_ncm_DATA_FIM_VIG_COFINS_ADVAL: TStringField;
    qry_ncm_IN_NECESSITA_LI: TStringField;
    qry_ncm_ALIQUOTA_GATT: TStringField;
    qry_ncm_DATA_INICIO_VIG_GATT: TStringField;
    qry_ncm_DATA_FIM_VIG_GATT: TStringField;
    qry_ncm_IN_ANUENCIA_EXERCITO: TStringField;
    procedure qry_ncm_AfterPost(DataSet: TDataSet);
    procedure qry_ncm_NewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ncm: Tdatm_ncm;

implementation

{$R *.DFM}


procedure Tdatm_ncm.qry_ncm_AfterPost(DataSet: TDataSet);
  var
  codigo: String;
begin
  codigo := qry_ncm_.FieldByname('CODIGO').asString;
  qry_ncm_.Close;
  qry_ncm_.Open;
  qry_ncm_.Locate('CODIGO', codigo, []);
end;

procedure Tdatm_ncm.qry_ncm_NewRecord(DataSet: TDataSet);
begin
   { By Carlos - 25/03/2010 }
   qry_ncm_IN_ANUENCIA_EXERCITO.AsString:='0';
end;

end.
