unit PGSM037;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_evento = class(TDataModule)
    ds_evento: TDataSource;
    tbl_yesno_: TTable;
    qry_etapa_: TQuery;
    qry_etapa_CD_ETAPA: TStringField;
    qry_etapa_NM_ETAPA: TStringField;
    tbl_responsavel_: TTable;
    ds_yesno: TDataSource;
    ds_responsavel: TDataSource;
    qry_ult_evento_: TQuery;
    qry_ult_evento_ULTIMO: TStringField;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_evento_IN_INSPECIONAVEL: TStringField;
    qry_evento_PRZ_INSPECAO: TSmallintField;
    qry_evento_CD_RESPONSAVEL: TStringField;
    qry_evento_CD_ETAPA: TStringField;
    qry_evento_IN_ATIVO: TStringField;
    qry_evento_Look_Inspecionavel: TStringField;
    qry_evento_LookAtivo: TStringField;
    qry_evento_AP_EVENTO: TStringField;
    qry_evento_AP_EVENTO_ESPANHOL: TStringField;
    qry_evento_AP_EVENTO_INGLES: TStringField;
    qry_ttp_prest_serv_: TQuery;
    qry_evento_CD_PREST_SERV: TStringField;
    qry_evento_LookPrestServ: TStringField;
    ds_ttp_prest_serv: TDataSource;
    qry_evento_NM_INGLES: TStringField;
    qry_evento_NM_ESPANHOL: TStringField;
    qry_evento_PRZ_INSPECAO2: TSmallintField;
    qry_evento_PRZ_INSPECAO3: TSmallintField;
    qry_evento_IN_INSPECIONAVEL_IMP: TStringField;
    qry_evento_PRZ_INSPECAO1_IMP: TSmallintField;
    qry_evento_PRZ_INSPECAO2_IMP: TSmallintField;
    qry_evento_PRZ_INSPECAO3_IMP: TSmallintField;
    qry_evento_look_inspecionavel_imp: TStringField;
    qry_evento_IN_INSPECIONAVEL_GP: TStringField;
    qry_evento_PRZ_INSPECAO1_GP: TSmallintField;
    qry_evento_PRZ_INSPECAO2_GP: TSmallintField;
    qry_evento_PRZ_INSPECAO3_GP: TSmallintField;
    qry_evento_IN_MOSTRAR_WEB_IMP: TStringField;
    qry_evento_IN_MOSTRAR_WEB_EXP: TStringField;
    qry_evento_IN_MOSTRAR_WEB_IMP_FILTRO: TStringField;
    qry_evento_IN_MOSTRAR_WEB_EXP_FILTRO: TStringField;
    qry_evento_IN_ACEITA_DESVIOS: TStringField;
    qry_evento_IN_INSPECIONAVEL_FI_IMP: TStringField;
    qry_evento_PRZ_INSPECAO1_FI_IMP: TSmallintField;
    qry_evento_PRZ_INSPECAO2_FI_IMP: TSmallintField;
    qry_evento_PRZ_INSPECAO3_FI_IMP: TSmallintField;
    qry_evento_IN_INSPECIONAVEL_FI_EXP: TStringField;
    qry_evento_PRZ_INSPECAO1_FI_EXP: TSmallintField;
    qry_evento_PRZ_INSPECAO2_FI_EXP: TSmallintField;
    qry_evento_PRZ_INSPECAO3_FI_EXP: TSmallintField;
    upd_evento: TUpdateSQL;
    qry_evento_NM_RESPONSAVEL: TStringField;
    qry_evento_IN_OBS_AUT: TStringField;
    qry_evento_NM_OBS_AUT: TStringField;
    procedure qry_evento_AfterScroll(DataSet: TDataSet);
    procedure qry_evento_AfterInsert(DataSet: TDataSet);
    procedure qry_evento_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_evento: Tdatm_evento;

implementation

uses PGSM036;

{$R *.DFM}

procedure Tdatm_evento.qry_evento_AfterScroll(DataSet: TDataSet);
begin
  if qry_evento_.State <> dsInsert then
  begin
    frm_evento.ChkTrackingImp.Enabled       := qry_evento_IN_MOSTRAR_WEB_IMP.AsString        <>  '1';
    frm_evento.ChkTrackingExp.Enabled       := qry_evento_IN_MOSTRAR_WEB_EXP.AsString        <>  '1';
    frm_evento.ChkTrackingImpFiltro.Enabled := qry_evento_IN_MOSTRAR_WEB_IMP_FILTRO.AsString <>  '1';
    frm_evento.ChkTrackingExpFiltro.Enabled := qry_evento_IN_MOSTRAR_WEB_EXP_FILTRO.AsString <>  '1';
  end;
end;

procedure Tdatm_evento.qry_evento_AfterInsert(DataSet: TDataSet);
begin
  frm_evento.ChkTrackingImp.Enabled                        := True;
  frm_evento.ChkTrackingExp.Enabled                        := True;
  frm_evento.ChkTrackingImpFiltro.Enabled                  := True;
  frm_evento.ChkTrackingExpFiltro.Enabled                  := True;
end;

procedure Tdatm_evento.qry_evento_AfterPost(DataSet: TDataSet);
begin
  qry_evento_.ApplyUpdates;
end;

end.
