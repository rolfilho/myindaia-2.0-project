unit PGSM049;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_moeda = class(TDataModule)
    ds_moeda: TDataSource;
    qry_moeda_broker_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_taxa_cambio: TDataSource;
    qry_taxa_cambio_: TQuery;
    qry_moeda_scx_: TQuery;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_moeda_broker_NM_MOEDA: TStringField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_moeda_broker_IN_ATIVO: TStringField;
    qry_moeda_broker_CD_MOEDA_SCX: TStringField;
    qry_moeda_broker_LookAtivo: TStringField;
    qry_moeda_scx_CODIGO: TStringField;
    qry_moeda_scx_DESCRICAO: TStringField;
    qry_moeda_broker_LookScx: TStringField;
    qry_taxa_cambio_CD_MOEDA: TStringField;
    qry_taxa_cambio_DT_INICIO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_DT_TERMINO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_TX_CAMBIO: TFloatField;
    qry_taxa_cambio_LookMoeda: TStringField;
    qry_consist_alt_: TQuery;
    qry_consist_inc_: TQuery;
    qry_consist_alt_CD_MOEDA: TStringField;
    qry_consist_inc_CD_MOEDA: TStringField;
    qry_conv_cambio_: TQuery;
    qry_conv_cambio_Codigo: TStringField;
    qry_conv_cambio_Descricao: TStringField;
    qry_conv_cambio_Taxa_Conversao: TStringField;
    qry_conv_cambio_Vigencia_Inicio_Taxa: TStringField;
    qry_conv_cambio_Vigencia_Fim_Taxa: TStringField;
    qry_moeda_broker_NM_MOEDA_SING: TStringField;
    qry_moeda_broker_NM_MOEDA_PLURAL: TStringField;
    qry_moeda_broker_NM_CENTAVOS_SING: TStringField;
    qry_moeda_broker_NM_CENTAVOS_PLURAL: TStringField;
    qry_moeda_broker_AP_MOEDA_INGLES: TStringField;
    qry_moeda_broker_NM_MOEDA_SING_ING: TStringField;
    qry_moeda_broker_NM_MOEDA_PLURAL_ING: TStringField;
    qry_moeda_broker_NM_CENTAVOS_SING_ING: TStringField;
    qry_moeda_broker_NM_CENTAVOS_PLURAL_ING: TStringField;
    qry_moeda_broker_NM_MOEDA_SING_ESP: TStringField;
    qry_moeda_broker_NM_MOEDA_PLURAL_ESP: TStringField;
    qry_moeda_broker_NM_CENTAVOS_SING_ESP: TStringField;
    qry_moeda_broker_NM_CENTAVOS_PLURAL_ESP: TStringField;
    dsTaxaFrete: TDataSource;
    qryTaxaFrete: TQuery;
    qryTaxaFreteCD_MOEDA: TStringField;
    qryTaxaFreteDT_INICIO: TDateTimeField;
    qryTaxaFreteDT_FIM: TDateTimeField;
    qryTaxaFreteVL_TAXA: TFloatField;
    qryTaxaFreteVL_TAXA_UTIL: TFloatField;
    qryTaxaFreteVL_COMPRA: TFloatField;
    procedure qry_moeda_broker_AfterScroll(DataSet: TDataSet);
    procedure qry_taxa_cambio_AfterScroll(DataSet: TDataSet);
    procedure qryTaxaFreteAfterScroll(DataSet: TDataSet);
    procedure qryTaxaFreteDT_INICIOSetText(Sender: TField;
      const Text: String);

  private
    { Private declarations }
  public
    dt_inicio, dt_termino : TDate;
    cd_moeda : String;
    { Public declarations }
  end;

var
  datm_moeda: Tdatm_moeda;

implementation

{$R *.DFM}

procedure Tdatm_moeda.qry_moeda_broker_AfterScroll(DataSet: TDataSet);
begin
  with datm_moeda.qry_taxa_cambio_ do
  begin
    Close;
    ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
    Prepare;
    Open;
  end;
  with qryTaxaFrete do begin
    //DisableControls;
    Close;
    ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
    Prepare;
    Open;
    //EnableControls;
  end;

  if qry_moeda_broker_.State <> dsInactive then
  begin
     qry_conv_cambio_.Close;
     qry_conv_cambio_.ParamByName('CD_MOEDA').asString := qry_moeda_broker_CD_MOEDA.asString;
     qry_conv_cambio_.Open;
  end;
end;

procedure Tdatm_moeda.qry_taxa_cambio_AfterScroll(DataSet: TDataSet);
begin
  if Not (qry_taxa_cambio_.State in [dsInsert] ) then
  begin
    dt_inicio  := datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.AsDateTime;
    dt_termino := datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.AsDateTime;
    cd_moeda   := datm_moeda.qry_taxa_cambio_CD_MOEDA.AsString;
  end;
end;

procedure Tdatm_moeda.qryTaxaFreteAfterScroll(DataSet: TDataSet);
begin
  if Not (qry_taxa_cambio_.State in [dsInsert] ) then
  begin
    dt_inicio  := datm_moeda.qryTaxaFreteDT_INICIO.AsDateTime;
    dt_termino := datm_moeda.qryTaxaFreteDT_FIM.AsDateTime;
    cd_moeda   := datm_moeda.qryTaxaFreteCD_MOEDA.AsString;
  end;
end;

procedure Tdatm_moeda.qryTaxaFreteDT_INICIOSetText(Sender: TField;
  const Text: String);
begin
  try

    if Text = '  /  /    ' then
      Sender.Clear
    else
      Sender.AsDateTime := StrToDate(Text);
  except
    Application.MessageBox('Data Inválida!', 'Erro Preenchimento', MB_OK + MB_ICONERROR);
    Sender.Clear;
  end;
end;

end.
