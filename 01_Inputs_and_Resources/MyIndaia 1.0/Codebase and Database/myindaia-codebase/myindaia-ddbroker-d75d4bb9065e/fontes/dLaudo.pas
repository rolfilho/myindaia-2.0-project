unit dLaudo;

interface

uses
  SysUtils, Classes, DB, DBTables, Variants, uLaudo;

type
  Tdatm_Laudo = class(TDataModule)
    ds_laudo_mat_pri: TDataSource;
    ds_lista_mat_pri: TDataSource;
    qry_lista_mat_pri_: TQuery;
    qry_lista_mat_pri_CD_MERCADORIA: TStringField;
    qry_lista_mat_pri_AP_MERCADORIA: TStringField;
    qry_lista_mat_pri_NR_LAUDO: TStringField;
    qry_lista_mat_pri_CD_MAT_PRI: TStringField;
    qry_ult_laudo_: TQuery;
    qry_laudo_mat_pri_: TQuery;
    qry_laudo_mat_pri_CD_MERCADORIA: TStringField;
    qry_laudo_mat_pri_NR_LAUDO: TStringField;
    qry_laudo_mat_pri_CD_MAT_PRI: TStringField;
    qry_laudo_mat_pri_CD_UN_MED_COMERC: TStringField;
    qry_lista_mat_pri_CD_UN_MED_COMERC: TStringField;
    qry_laudo_mat_pri_VL_INDICE: TFloatField;
    qry_laudo_mat_pri_VL_CALCULADO: TFloatField;
    qry_lista_mat_pri_VL_INDICE: TFloatField;
    qry_laudo_mat_pri_PERC_PERDA: TFloatField;
    upd_lista_mat_pri: TUpdateSQL;
    fltfld_lista_mat_pri_PERC_PERDA: TFloatField;
    fltfld_lista_mat_pri_VL_CALCULADO: TFloatField;
    strngfld_lista_mat_pri_NR_PALAVRAS_CHAVE: TStringField;
    upd_laudo: TUpdateSQL;
    qry_Laudo_: TQuery;
    qry_Laudo_CD_MERCADORIA: TStringField;
    qry_Laudo_NR_LAUDO: TStringField;
    qry_Laudo_NR_DESCR_MERC: TStringField;
    ds_Laudo: TDataSource;
    procedure qry_laudo_mat_pri_AfterInsert(DataSet: TDataSet);
    procedure qry_lista_mat_pri_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_mat_pri_AfterPost(DataSet: TDataSet);
    procedure qry_laudo_AfterScroll(DataSet: TDataSet);
    procedure qry_Laudo_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_Laudo: Tdatm_Laudo;

implementation

{$R *.dfm}

procedure Tdatm_Laudo.qry_laudo_mat_pri_AfterInsert(DataSet: TDataSet);
begin
  Qry_laudo_mat_pri_NR_LAUDO.AsString      := Qry_laudo_NR_LAUDO.AsString;
  Qry_laudo_mat_pri_CD_MERCADORIA.AsString := Qry_laudo_CD_MERCADORIA.AsString;
  qry_laudo_mat_pri_PERC_PERDA.AsFloat     := 0;
end;

procedure Tdatm_Laudo.qry_lista_mat_pri_AfterScroll(DataSet: TDataSet);
begin
  If qry_laudo_mat_pri_.Active Then
    If (qry_laudo_mat_pri_.State <> dsInsert) and (qry_laudo_mat_pri_.State <> dsEdit) Then
      qry_laudo_mat_pri_.Locate( 'CD_MAT_PRI', qry_lista_mat_pri_CD_MAT_PRI.AsString,[] );
end;

procedure Tdatm_Laudo.qry_lista_mat_pri_AfterPost(DataSet: TDataSet);
begin
     qry_lista_mat_pri_.ApplyUpdates;
end;

procedure Tdatm_Laudo.qry_laudo_AfterScroll(DataSet: TDataSet);
begin
     qry_lista_mat_pri_.Close;
     qry_lista_mat_pri_.ParamByName('CD_MERCADORIA').AsString := qry_laudo_CD_MERCADORIA.AsString;
     qry_lista_mat_pri_.ParamByName('NR_LAUDO').AsString      := qry_laudo_NR_LAUDO.AsString;
     qry_lista_mat_pri_.Prepare;
     qry_lista_mat_pri_.Open;
end;

procedure Tdatm_Laudo.qry_Laudo_AfterPost(DataSet: TDataSet);
begin
    qry_Laudo_.ApplyUpdates;
end;

end.
