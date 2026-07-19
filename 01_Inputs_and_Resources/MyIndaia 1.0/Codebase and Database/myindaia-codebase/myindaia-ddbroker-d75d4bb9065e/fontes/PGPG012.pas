unit PGPG012;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_solic_adm = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_usuario: TDataSource;
    qry_usuario_: TQuery;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    qry_solic_adm_: TQuery;
    ds_solic_adm: TDataSource;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_status_solic_adm_: TQuery;
    qry_status_solic_adm_DESCRICAO: TStringField;
    ds_status_solic_adm: TDataSource;
    qry_status_solic_adm_CODIGO: TStringField;
    qry_solic_adm_CD_UNID_NEG: TStringField;
    qry_solic_adm_NR_REF: TStringField;
    qry_solic_adm_CD_FAVORECIDO: TStringField;
    qry_solic_adm_CD_BANCO: TStringField;
    qry_solic_adm_NR_DOCTO: TStringField;
    qry_solic_adm_VL_LANCTO: TFloatField;
    qry_solic_adm_TP_NATUREZA: TStringField;
    qry_solic_adm_CD_USUARIO_SOLIC: TStringField;
    qry_solic_adm_CD_USUARIO_MONTA: TStringField;
    qry_solic_adm_IN_SOLICITADO: TStringField;
    qry_solic_adm_LookUnidNeg: TStringField;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_solic_adm_LookFavorecido: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_solic_adm_LookBanco: TStringField;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_solic_adm_LookUsuarioMonta: TStringField;
    qry_solic_adm_LookUsuarioSolic: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_solic_adm_CD_ACESSO: TStringField;
    qry_solic_adm_CD_AUX: TStringField;
    qry_solic_adm_CD_CT_CONTABIL: TStringField;
    qry_solic_adm_LookAcesso: TStringField;
    qry_solic_adm_LookAux: TStringField;
    qry_solic_adm_DT_LANCTO: TDateTimeField;
    qry_solic_adm_DT_VENCTO: TDateTimeField;
    qry_solic_adm_DT_PAGTO: TDateTimeField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_solic_adm_LookSolicitado: TStringField;
    qry_solic_adm_CD_STATUS_ADM: TStringField;
    qry_solic_adm_LookStatus: TStringField;
    qry_solic_adm_LookCtContabil: TStringField;
    qry_solic_adm_CD_HISTORICO: TStringField;
    qry_historico_: TQuery;
    qry_historico_CD_HISTORICO: TStringField;
    qry_historico_NM_HISTORICO: TStringField;
    qry_solic_adm_LookHistorico: TStringField;
    qry_solic_adm_VL_DESCONTO: TFloatField;
    qry_solic_adm_VL_PERC_DESCONTO: TFloatField;
    qry_solic_adm_CalcVlTotal: TFloatField;
    qry_solic_adm_TX_HISTORICO: TMemoField;
    qry_historico_TX_HISTORICO: TMemoField;
    qry_cliente_: TQuery;
    qry_cliente_CD_CLIENTE: TStringField;
    qry_cliente_CD_GRUPO: TStringField;
    qry_solic_adm_NR_RELATORIO: TStringField;
    qry_solic_adm_NR_ANO: TStringField;
    qry_solic_adm_NR_LANCAMENTO: TStringField;
    qry_ult_lancto_: TQuery;
    qry_ult_lancto_NR_LANCAMENTO: TStringField;
    qry_solic_adm_TP_LANCAMENTO: TStringField;
    qry_rel_liq_: TQuery;
    qry_rel_liq_TOT_LIQ: TIntegerField;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_solic_adm_LookCtContabilRM: TStringField;
    qry_solic_adm_CD_CT_CUSTO: TStringField;
    ds_ct_custo: TDataSource;
    qry_ct_custo_: TQuery;
    qry_ct_custo_CD_CT_CUSTO: TStringField;
    qry_ct_custo_NM_CT_CUSTO: TStringField;
    qry_solic_adm_LookCusto: TStringField;
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_solic_adm_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_adm_AfterEdit(DataSet: TDataSet);
    procedure qry_solic_adm_AfterInsert(DataSet: TDataSet);
    procedure qry_solic_adm_AfterPost(DataSet: TDataSet);
    procedure qry_solic_adm_AfterCancel(DataSet: TDataSet);
    procedure qry_solic_adm_CD_CT_CONTABILChange(Sender: TField);
    procedure qry_solic_adm_CalcFields(DataSet: TDataSet);
    procedure qry_solic_adm_CD_FAVORECIDOChange(Sender: TField);
    procedure qry_solic_adm_TP_NATUREZAChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_solic_adm: Tdatm_solic_adm;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG011;

{$R *.DFM}

procedure Tdatm_solic_adm.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;

procedure Tdatm_solic_adm.qry_solic_adm_AfterScroll(DataSet: TDataSet);
begin
  with frm_solic_adm do
  begin
    if {( qry_solic_adm_.RecordCount > 0 ) and                      Incluindo }
       ( ( qry_solic_adm_CD_STATUS_ADM.AsString = ''  ) or
         ( qry_solic_adm_CD_STATUS_ADM.AsString = '0' ) ) or
       ( frm_solic_adm.incluindo ) then  { Em Processamento }
    begin
      pnl_solic_adm.Enabled      := st_modificar;
      btn_co_ct_contabil.Enabled := st_modificar;
      btn_co_favorecido.Enabled  := st_modificar;
    end
    else
    begin
      pnl_solic_adm.Enabled      := False;
      btn_co_ct_contabil.Enabled := False;
      btn_co_favorecido.Enabled  := False;
    end;
  end;
end;

procedure Tdatm_solic_adm.qry_solic_adm_AfterEdit(DataSet: TDataSet);
begin
  frm_solic_adm.dbgrdSolicAdm.Enabled   := False;
  frm_solic_adm.dbnvg.Enabled           := False;
  frm_solic_adm.msk_cd_unid_neg.Enabled := False;
  frm_solic_adm.btn_co_unid_neg.Enabled := False;
  frm_solic_adm.msk_dt_base.Enabled     := False;
end;

procedure Tdatm_solic_adm.qry_solic_adm_AfterInsert(DataSet: TDataSet);
begin
//  frm_solic_adm.dbgrdSolicAdm.Enabled   := False;
  frm_solic_adm.dbnvg.Enabled           := False;
  frm_solic_adm.msk_cd_unid_neg.Enabled := False;
  frm_solic_adm.btn_co_unid_neg.Enabled := False;
  frm_solic_adm.msk_dt_base.Enabled     := False;
end;

procedure Tdatm_solic_adm.qry_solic_adm_AfterPost(DataSet: TDataSet);
begin
  frm_solic_adm.dbgrdSolicAdm.Enabled   := True;
  frm_solic_adm.dbnvg.Enabled           := True;
  frm_solic_adm.msk_cd_unid_neg.Enabled := True;
  frm_solic_adm.btn_co_unid_neg.Enabled := True;
  frm_solic_adm.msk_dt_base.Enabled     := True;
end;

procedure Tdatm_solic_adm.qry_solic_adm_AfterCancel(DataSet: TDataSet);
begin
  frm_solic_adm.dbgrdSolicAdm.Enabled   := True;
  frm_solic_adm.dbnvg.Enabled           := True;
  frm_solic_adm.msk_cd_unid_neg.Enabled := True;
  frm_solic_adm.btn_co_unid_neg.Enabled := True;
  frm_solic_adm.msk_dt_base.Enabled     := True;
end;

procedure Tdatm_solic_adm.qry_solic_adm_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_solic_adm.dbedt_cd_ct_contabil.Visible ) then
  begin
    qry_solic_adm_CD_ACESSO.AsString := qry_solic_adm_LookAcesso.AsString;
    qry_solic_adm_CD_AUX.AsString    := qry_solic_adm_LookAux.AsString;
  end;
end;

procedure Tdatm_solic_adm.qry_solic_adm_CalcFields(DataSet: TDataSet);
begin
  qry_solic_adm_CalcVlTotal.AsFloat := qry_solic_adm_VL_LANCTO.AsFloat - qry_solic_adm_VL_DESCONTO.AsFloat; 
end;

procedure Tdatm_solic_adm.qry_solic_adm_CD_FAVORECIDOChange(Sender: TField);
var
  cd_grupo, cd_cliente : String;
begin
  if ( qry_solic_adm_DT_VENCTO.IsNull ) and ( qry_solic_adm_TP_NATUREZA.AsString = 'C' ) then
  begin
    qry_cliente_.Close;
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if qry_cliente_.EOF then
    begin
      qry_cliente_.Close;
      Exit;
    end
    else
    begin
      cd_grupo   := qry_cliente_.FieldByName('CD_GRUPO').AsString;
      cd_cliente := qry_cliente_.FieldByName('CD_CLIENTE').AsString;
      qry_cliente_.Close;
    end;
  end;

  (* // Inibido em 31/05/2006 - Carlos - Financeiro - informa que não é mais utilizado
     // Retirado objeto do Form
  if Not ( qry_solic_adm_.State in [dsEdit, dsInsert] ) then
  begin
    qry_solic_adm_.Edit;
    frm_solic_adm.dbedt_cd_ct_contabilChange(nil);
  end;
  CloseStoredProc( sp_rel_fin_controle_num );
  sp_rel_fin_controle_num.ParamByName('@cd_unid_neg').AsString := qry_solic_adm_CD_UNID_NEG.AsString;
  sp_rel_fin_controle_num.ParamByName('@cd_produto').AsString := qry_solic_adm_CD_UNID_NEG.AsString;
  sp_rel_fin_controle_num.ParamByName('@cd_grupo').AsString    := '';
  sp_rel_fin_controle_num.ParamByName('@cd_cliente').AsString  := cd_cliente;
  ExecStoredProc( sp_rel_fin_controle_num );
  if Not sp_rel_fin_controle_num.ParamByName('@dt_vencto').IsNull then
  begin
    qry_solic_adm_DT_VENCTO.AsDateTime  := sp_rel_fin_controle_num.ParamByName('@dt_vencto').AsDateTime;
    qry_solic_adm_NR_RELATORIO.AsString := sp_rel_fin_controle_num.ParamByName('@nr_relatorio').AsString;
    qry_solic_adm_NR_ANO.AsString       := sp_rel_fin_controle_num.ParamByName('@nr_ano').AsString;
  end;
  CloseStoredProc( sp_rel_fin_controle_num );
  *)
end;

procedure Tdatm_solic_adm.qry_solic_adm_TP_NATUREZAChange(Sender: TField);
begin
  qry_solic_adm_CD_FAVORECIDOChange(nil);
end;

end.
