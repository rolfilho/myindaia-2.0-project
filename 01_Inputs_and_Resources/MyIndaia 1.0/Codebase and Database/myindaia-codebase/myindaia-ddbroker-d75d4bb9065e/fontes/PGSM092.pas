unit PGSM092;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_embal = class(TDataModule)
    ds_embal: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_embal_: TQuery;
    qry_ult_embal_: TQuery;
    qry_ult_embal_ULTIMO: TStringField;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_embal_CD_EMBALAGEM: TStringField;
    qry_embal_CD_TIPO: TStringField;
    qry_embal_IN_ATIVO: TStringField;
    qry_embal_look_ativo: TStringField;
    qry_tp_embal_: TQuery;
    qry_tp_embal_CD_TIPO: TStringField;
    qry_tp_embal_NM_TIPO: TStringField;
    ds_tp_embal: TDataSource;
    qry_embal_LookTipoEmbal: TStringField;
    qry_embal_NR_COMPRIMENTO: TFloatField;
    qry_embal_NR_ALTURA: TFloatField;
    qry_embal_NR_PESO: TFloatField;
    qry_embal_NR_LARGURA: TFloatField;
    qry_embal_CD_CLASSIF: TFloatField;
    qry_embal_CD_EMBALAGEM_SUP: TStringField;
    qry_embal_QT_EMBALAGEM_SUP: TFloatField;
    qry_embal_2_: TQuery;
    qry_embal_2_CD_EMBALAGEM: TStringField;
    qry_embal_NmEmbalagem: TStringField;
    qry_embal_CD_EMBALAGEM_CLIENTE: TStringField;
    qry_embal_NM_DESCR_DETALHADA: TStringField;
    qry_embal_NM_DESCR_DETALHADA_INGLES: TStringField;
    qry_embal_NM_DESCR_DETALHADA_ESPANHOL: TStringField;
    qry_embal_NM_EMBALAGEM_P: TStringField;
    qry_embal_NM_EMBALAGEM_S: TStringField;
    qry_embal_2_NM_EMBALAGEM_S: TStringField;
    qry_embal_CD_UNID_MED_EMB: TStringField;
    qry_embal_QT_MERC_EMB: TFloatField;
    qry_embal_LookUnidMedEmb: TStringField;
    qry_embal_FIESP_Id: TIntegerField;
    procedure qry_embal_AfterPost(DataSet: TDataSet);
    procedure qry_embal_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_embal: Tdatm_embal;

implementation

{$R *.DFM}

uses GSMLIB;

procedure Tdatm_embal.qry_embal_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
   Codigo := qry_embal_CD_EMBALAGEM.asString;
   qry_embal_.Close;
   qry_embal_.Open;
   qry_embal_.Locate('CD_EMBALAGEM',Codigo,[]);
end;

procedure Tdatm_embal.qry_embal_CalcFields(DataSet: TDataSet);
begin
  qry_embal_LookUnidMedEmb.AsString := FastLookup( 'TUNID_MEDIDA_BROKER', qry_embal_CD_UNID_MED_EMB, 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', '' );
end;

end.
