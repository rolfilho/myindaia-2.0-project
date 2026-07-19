unit PGSM253;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_at_basf = class(TDataModule)
    ds_at_basf: TDataSource;
    qry_at_basf_: TQuery;
    us_at_basf: TUpdateSQL;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_at_basf_NR_PEDIDO: TStringField;
    qry_at_basf_CD_AREA: TStringField;
    qry_at_basf_TP_AT_BASF: TStringField;
    qry_at_basf_CD_VIA_TRANSP: TStringField;
    qry_at_basf_DT_PEDIDO: TDateTimeField;
    qry_at_basf_IN_TRANSMISSAO: TStringField;
    qry_at_basf_IN_FOLLOWUP: TStringField;
    qry_at_basf_VL_TRANSMISSAO: TFloatField;
    qry_at_basf_VL_FOLLOWUP: TFloatField;
    qry_via_transp_broker_: TQuery;
    ds_via_transp: TDataSource;
    qry_tp_at_basf_: TQuery;
    ds_tp_at_basf: TDataSource;
    qry_at_basf_LookArea: TStringField;
    qry_at_basf_CalcVlTransmissao: TFloatField;
    qry_at_basf_CalcVlFollowup: TFloatField;
    qry_at_basf_IN_REVISAO_FAT: TStringField;
    qry_at_basf_IN_DEMURRAGE: TStringField;
    qry_at_basf_IN_ENT_BASF: TStringField;
    qry_at_basf_IN_ENT_BSG: TStringField;
    qry_at_basf_IN_CHEC_DOC: TStringField;
    qry_at_basf_VL_REVISAO_FAT: TFloatField;
    qry_at_basf_VL_DEMURRAGE: TFloatField;
    qry_at_basf_VL_ENT_BASF: TFloatField;
    qry_at_basf_VL_ENT_BSG: TFloatField;
    qry_at_basf_VL_CHEC_DOC: TFloatField;
    qry_at_basf_CalcVlRevisaoFat: TFloatField;
    qry_at_basf_CalcVlDemurrage: TFloatField;
    qry_at_basf_CalcVlEntBASF: TFloatField;
    qry_at_basf_CalcVlEntBSG: TFloatField;
    qry_at_basf_CalcVlChecDoc: TFloatField;
    qry_lista_NR_PEDIDO: TStringField;
    qry_lista_NM_AREA: TStringField;
    qry_lista_NM_TP_AT_BASF: TStringField;
    qry_lista_NM_VIA_TRANSP: TStringField;
    qry_lista_DATA_TRANSMISSAO: TDateTimeField;
    qry_lista_DATA_FOLLOWUP: TDateTimeField;
    qry_lista_DATA_REVISAO_FAT: TDateTimeField;
    qry_lista_DATA_DEMURRAGE: TDateTimeField;
    qry_lista_DATA_CHEC_DOC: TDateTimeField;
    procedure qry_at_basf_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_AfterOpen(DataSet: TDataSet);
    procedure qry_at_basf_CalcFields(DataSet: TDataSet);
    procedure qry_lista_CalcFields(DataSet: TDataSet);
    procedure qry_at_basf_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_at_basf: Tdatm_at_basf;

implementation

uses GSMLIB, PGSM252;

{$R *.DFM}

procedure Tdatm_at_basf.qry_at_basf_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(E);
end;

procedure Tdatm_at_basf.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_at_basf_.Close;
  qry_at_basf_.ParamByName('NR_PEDIDO').AsString := qry_lista_NR_PEDIDO.AsString;
  qry_at_basf_.Prepare;
  qry_at_basf_.Open;

  frm_at_basf.VerAtBasf;
end;

procedure Tdatm_at_basf.qry_lista_AfterOpen(DataSet: TDataSet);
begin
  if qry_lista_.RecordCount = 0 then
    qry_lista_AfterScroll(nil);
end;

procedure Tdatm_at_basf.qry_at_basf_CalcFields(DataSet: TDataSet);
begin
  qry_at_basf_LookArea.AsString         := FastLookup( 'TAREA', qry_at_basf_CD_AREA, 'CD_AREA', 'NM_AREA', '' );
  qry_at_basf_CalcVlTransmissao.AsFloat := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_TRANSMISSAO', '' ) );
  qry_at_basf_CalcVlFollowup.AsFloat    := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_FOLLOWUP', '' ) );
  qry_at_basf_CalcVlRevisaoFat.AsFloat  := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_REVISAO_FAT', '' ) );
  qry_at_basf_CalcVlDemurrage.AsFloat   := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_DEMURRAGE', '' ) );
  qry_at_basf_CalcVlEntBASF.AsFloat     := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_ENT_BASF', '' ) );
  qry_at_basf_CalcVlEntBSG.AsFloat      := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_ENT_BSG', '' ) );
  qry_at_basf_CalcVlChecDoc.AsFloat     := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_CHEC_DOC', '' ) );
end;

procedure Tdatm_at_basf.qry_lista_CalcFields(DataSet: TDataSet);
begin
(*  if qry_lista_IN_TRANSMISSAO.AsString = '0' then
    qry_lista_CalcTrans.AsString := ''
  else
    qry_lista_CalcTrans.AsString := 'ü';
  if qry_lista_IN_FOLLOWUP.AsString = '0' then
    qry_lista_CalcFollowup.AsString := ''
  else
    qry_lista_CalcFollowup.AsString := 'ü';
  if qry_lista_IN_REVISAO_FAT.AsString = '0' then
    qry_lista_CalcRevisaoFat.AsString := ''
  else
    qry_lista_CalcRevisaoFat.AsString := 'ü';
  if qry_lista_IN_DEMURRAGE.AsString = '0' then
    qry_lista_CalcDemurrage.AsString := ''
  else
    qry_lista_CalcDemurrage.AsString := 'ü';
  if qry_lista_IN_CHEC_DOC.AsString = '0' then
    qry_lista_CalcChecDoc.AsString := ''
  else
    qry_lista_CalcChecDoc.AsString := 'ü';*)
end;

procedure Tdatm_at_basf.qry_at_basf_BeforePost(DataSet: TDataSet);
begin
(*  frm_at_basf.ActiveControl := nil;
  if frm_at_basf.dbchkbox_transmissao.Checked then
    qry_at_basf_VL_TRANSMISSAO.AsFloat := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_TRANSMISSAO', '' ) );
  else
    qry_at_basf_VL_TRANSMISSAO.AsFloat := 0;
  if frm_at_basf.dbchkbox_followup.Checked then
    qry_at_basf_VL_FOLLOWUP.AsFloat    := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_FOLLOWUP', '' ) );
  else
    qry_at_basf_VL_FOLLOWUP.AsFloat    := 0;
  if frm_at_basf.dbchkbox_revisao_fat.Checked then
    qry_at_basf_VL_REVISAO_FAT.AsFloat := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_REVISAO_FAT', '' ) );
  else
    qry_at_basf_VL_REVISAO_FAT.AsFloat := 0;
  if frm_at_basf.dbchkbox_demurrage.Checked then
    qry_at_basf_VL_DEMURRAGE.AsFloat   := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_DEMURRAGE', '' ) );
  else
    qry_at_basf_VL_DEMURRAGE.AsFloat   := 0;
//  if frm_at_basf.dbchkbox_ent_basf.Checked then
//    qry_at_basf_VL_ENT_BASF.AsFloat    := qry_at_basf_CalcVlEntBASF.AsFloat
//  else
//    qry_at_basf_VL_ENT_BASF.AsFloat    := 0;
//  if frm_at_basf.dbchkbox_ent_bsg.Checked then
//    qry_at_basf_VL_ENT_BSG.AsFloat     := qry_at_basf_CalcVlEntBSG.AsFloat
//  else
//    qry_at_basf_VL_ENT_BSG.AsFloat     := 0;
  if frm_at_basf.dbchkbox_chec_doc.Checked then
    qry_at_basf_VL_CHEC_DOC.AsFloat    := StrToFloat( FastLookup( 'TTP_AT_BASF', qry_at_basf_TP_AT_BASF, 'TP_AT_BASF', 'VL_CHEC_DOC', '' ) );
  else
    qry_at_basf_VL_CHEC_DOC.AsFloat    := 0;*)
end;

end.
