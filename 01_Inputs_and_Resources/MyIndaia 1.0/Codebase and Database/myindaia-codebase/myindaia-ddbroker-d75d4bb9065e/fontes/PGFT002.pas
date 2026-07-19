unit PGFT002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;


type
  Tdatm_fat_cc = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    ds_processo: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    tbl_yesno_: TTable;
    qry_fat_cc_: TQuery;
    ds_fat_cc: TDataSource;
    qry_fat_cc_NR_PROCESSO: TStringField;
    qry_fat_cc_NR_LANCAMENTO: TStringField;
    qry_fat_cc_CD_USUARIO: TStringField;
    qry_fat_cc_CD_FAVORECIDO: TStringField;
    qry_fat_cc_CD_BANCO: TStringField;
    qry_fat_cc_CD_ITEM: TStringField;
    qry_fat_cc_CD_DESPACHANTE: TStringField;
    qry_fat_cc_CD_TIPO_LANC: TStringField;
    qry_fat_cc_CD_ORIGEM_LANC: TStringField;
    qry_fat_cc_CD_STATUS_LANC: TStringField;
    qry_fat_cc_NR_CHEQUE: TStringField;
    qry_fat_cc_VL_ITEM: TFloatField;
    qry_fat_cc_VL_IR: TFloatField;
    qry_fat_cc_VL_ASSIST: TFloatField;
    qry_fat_cc_IN_FATURADO: TStringField;
    qry_fat_cc_look_nm_item: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_fat_cc_calc_vl_lancamento: TFloatField;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_tp_proced_: TQuery;
    qry_tp_proced_TP_PROCEDENCIA: TStringField;
    qry_tp_proced_NM_PROCEDENCIA: TStringField;
    qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField;
    qry_fat_cc_look_tp_procedencia: TStringField;
    qry_fat_cc_look_nm_favorecido: TStringField;
    qry_fat_cc_look_nm_banco: TStringField;
    qry_fat_cc_look_nm_despachante: TStringField;
    qry_fat_cc_CD_CANCELADOR: TStringField;
    qry_fat_cc_DT_CANCELAMENTO: TDateTimeField;
    qry_fat_cc_IN_CANCELADO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_fat_cc_look_controla_ir: TBooleanField;
    qry_fat_cc_CD_FORMA_PAGTO: TStringField;
    qry_fat_cc_NR_SOLIC_FAT: TStringField;
    qry_fat_cc_IN_RESTITUI: TStringField;
    ds_yesno: TDataSource;
    qry_fat_cc_DT_LANCAMENTO: TDateTimeField;
    qry_fat_cc_CD_UNID_NEG: TStringField;
    qry_fat_cc_CD_PRODUTO: TStringField;
    qry_fat_cc_IN_CONTABIL: TStringField;
    qry_tipo_item_: TQuery;
    qry_tipo_item_CD_TIPO_ITEM: TStringField;
    qry_tipo_item_NM_TIPO_ITEM: TStringField;
    qry_tipo_item_TP_NATUREZA: TStringField;
    qry_tipo_item_IN_FATURAR: TStringField;
    qry_tipo_item_IN_RESTITUI: TStringField;
    qry_fat_cc_look_cd_tp_item: TStringField;
    qry_fat_cc_calc_nm_item: TStringField;
    qry_fat_cc_look_cancelado: TStringField;
    qry_tipo_item_IN_FAT_CC: TStringField;
    qry_fat_cc_look_in_fat_cc: TStringField;
    qry_item_por_ton_: TQuery;
    qry_item_por_ton_CD_ITEM: TStringField;
    qry_fat_cc_CD_ITEM_NAO_FAT: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_rest_correta_: TQuery;
    qry_ts_fatura_: TQuery;
    qry_ts_fatura_NR_NOTA_FATURA: TStringField;
    ds_fs_fatura: TDataSource;
    qry_fat_cc_cliente_: TQuery;
    ds_fat_cc_cliente: TDataSource;
    qry_fat_cc_cliente_NR_PROCESSO: TStringField;
    qry_fat_cc_cliente_NR_LANCAMENTO: TStringField;
    qry_fat_cc_cliente_DT_LANCAMENTO: TDateTimeField;
    qry_fat_cc_cliente_NM_ITEM: TStringField;
    qry_fat_cc_cliente_VL_ITEM: TFloatField;
    qry_fat_cc_cliente_TX_YESNO: TStringField;
    qry_item_cpmf_: TQuery;
    qry_item_cpmf_ITEM_CPMF: TIntegerField;
    dts_DtConcil: TDataSource;
    qry_DtConcil: TQuery;
    procedure qry_fat_cc_CalcFields(DataSet: TDataSet);
    procedure qry_fat_cc_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_cc_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_cc_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_fat_cc: Tdatm_fat_cc;

implementation

{$R *.DFM}

uses PGFT001, PGGP001;

procedure Tdatm_fat_cc.qry_fat_cc_CalcFields(DataSet: TDataSet);
begin
  qry_fat_cc_calc_vl_lancamento.AsFloat := qry_fat_cc_VL_ITEM.AsFloat +
                                           qry_fat_cc_VL_ASSIST.AsFloat;

  if qry_fat_cc_IN_RESTITUI.AsString = '1' then
    qry_fat_cc_calc_nm_item.AsString := 'REST./' + qry_fat_cc_look_nm_item.AsString + ' ' +
                                        qry_fat_cc_NM_ITEM_COMPLEMENTO.AsString
  else
    qry_fat_cc_calc_nm_item.AsString := qry_fat_cc_look_nm_item.AsString + ' ' +
                                        qry_fat_cc_NM_ITEM_COMPLEMENTO.AsString;
end;

procedure Tdatm_fat_cc.qry_fat_cc_AfterScroll(DataSet: TDataSet);
begin
(*  qry_fat_cc_cliente_.Close;
  qry_fat_cc_cliente_.Prepare;
  qry_fat_cc_cliente_.Open;*)

  qry_ts_fatura_.Close;
  qry_ts_fatura_.Prepare;
  qry_ts_fatura_.Open;
   
  // Data de Conciliação - Rodrigo Capra  -  20/03/2008 -
  with qry_DtConcil do
  begin
    Close;
    ParamByName('NR_PROCESSO').AsString := qry_fat_cc_NR_PROCESSO.AsString;
    ParamByName('CD_ITEM').AsString := qry_fat_cc_CD_ITEM.AsString;
    ParamByName('VL_LANCAMENTO').AsFloat := qry_fat_cc_VL_ITEM.AsFloat;
    Prepare;
    Open;
    if ( DateToStr( Fields[0].AsDateTime ) <> '01/01/1900' ) and ( DateToStr( Fields[0].AsDateTime ) <> '30/12/1899' ) then
      frm_fat_cc.edt_dt_conc.Text := DateToStr( Fields[0].AsDateTime )
    else
      frm_fat_cc.edt_dt_conc.Text := '';
  end;

{ Esta rotina abaixo foi substituída pela de cima no intuito de melhorar a performance - Rodrigo Capra
  with TQuery.Create( Application ) do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX( DT_CONCILIACAO ) AS DT_CONCILIACAO FROM TCAIXA (NOLOCK) ');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND ');
    SQL.Add(' CD_ITEM = :CD_ITEM AND VL_LANCAMENTO = :VL_LANCAMENTO ');
    ParamByName('NR_PROCESSO').AsString := qry_fat_cc_NR_PROCESSO.AsString;
    ParamByName('CD_ITEM').AsString := qry_fat_cc_CD_ITEM.AsString;
    ParamByName('VL_LANCAMENTO').AsFloat := qry_fat_cc_VL_ITEM.AsFloat;
    Open;
    if ( DateToStr( Fields[0].AsDateTime ) <> '01/01/1900' ) and ( DateToStr( Fields[0].AsDateTime ) <> '30/12/1899' ) then
      frm_fat_cc.edt_dt_conc.Text := DateToStr( Fields[0].AsDateTime )
    else
      frm_fat_cc.edt_dt_conc.Text := '';
    Close;
    Free;
  end; }

  // Valor IR
  if qry_fat_cc_look_controla_ir.AsBoolean then
  begin
    frm_fat_cc.dbedt_vl_ir.Color    := clWindow;
    frm_fat_cc.dbedt_vl_ir.ReadOnly := False;
    frm_fat_cc.dbedt_vl_ir.TabStop  := True;
  end
  else
  begin
    frm_fat_cc.dbedt_vl_ir.Color    := clMenu;
    frm_fat_cc.dbedt_vl_ir.ReadOnly := True;
    frm_fat_cc.dbedt_vl_ir.TabStop  := False;
  end;

  if str_cd_sda = qry_fat_cc_CD_ITEM.AsString then
  begin
    frm_fat_cc.dbedt_cd_despachante.Color    := clWindow;
    frm_fat_cc.dbedt_cd_despachante.ReadOnly := False;
    frm_fat_cc.dbedt_cd_despachante.TabStop  := True;
    frm_fat_cc.btn_co_despachante.Enabled    := True;
    frm_fat_cc.dbedt_vl_assist.Color         := clWindow;
    frm_fat_cc.dbedt_vl_assist.ReadOnly      := False;
    frm_fat_cc.dbedt_vl_assist.TabStop       := True;
  end
  else
  begin
    frm_fat_cc.dbedt_cd_despachante.Color    := clMenu;
    frm_fat_cc.dbedt_cd_despachante.ReadOnly := True;
    frm_fat_cc.dbedt_cd_despachante.TabStop  := False;
    frm_fat_cc.btn_co_despachante.Enabled    := False;
    frm_fat_cc.dbedt_vl_assist.Color         := clMenu;
    frm_fat_cc.dbedt_vl_assist.ReadOnly      := True;
    frm_fat_cc.dbedt_vl_assist.TabStop       := False;
  end;

  if ( qry_tipo_item_.Locate('CD_TIPO_ITEM', qry_fat_cc_look_cd_tp_item.AsString ,[loCaseInsensitive]) ) then
  begin
    if ( qry_tipo_item_IN_RESTITUI.AsString = '1' ) then
    begin
      frm_fat_cc.dblkpcbox_restitui.Enabled  := True;
      frm_fat_cc.dblkpcbox_restitui.Color    := clWindow;
      frm_fat_cc.dblkpcbox_restitui.ReadOnly := False;
    end
    else
    begin
      frm_fat_cc.dblkpcbox_restitui.Enabled  := False;
      frm_fat_cc.dblkpcbox_restitui.Color    := clMenu;
      frm_fat_cc.dblkpcbox_restitui.ReadOnly := True;
      if qry_fat_cc_IN_RESTITUI.AsString <> '0' then
      begin
        if (qry_fat_cc_.RecordCount > 0) and
           (Not ( qry_fat_cc_.State in [dsEdit, dsInsert] ) ) then
        begin
          qry_fat_cc_.Edit;
          qry_fat_cc_IN_RESTITUI.AsString    := '0';
          frm_fat_cc.dbedt_cd_favorecidoChange(nil);
        end;
      end;
    end;
  end;

  if ( qry_fat_cc_IN_CANCELADO.AsString = '1' ) or
     ( qry_fat_cc_IN_FATURADO.AsString = '1' ) or
     ( qry_tipo_item_IN_FAT_CC.AsString <> '1' ) or
     ( qry_fat_cc_CD_ORIGEM_LANC.AsString = '1' ) then
  begin
    datm_fat_cc.ds_fat_cc.AutoEdit      := False;
    frm_fat_cc.btn_cancelamento.Enabled := False;
    frm_fat_cc.mi_cancelamento.Enabled  := False;
  end
  else
  begin
    datm_fat_cc.ds_fat_cc.AutoEdit      := frm_fat_cc.st_modificar;
    frm_fat_cc.btn_cancelamento.Enabled := frm_fat_cc.st_excluir;
    frm_fat_cc.mi_cancelamento.Enabled  := frm_fat_cc.st_excluir;
  end;

  if ( qry_fat_cc_IN_CANCELADO.AsString = '1' ) then
    frm_fat_cc.lbl_cancelado.Visible    := True
  else
    frm_fat_cc.lbl_cancelado.Visible    := False;

  frm_fat_cc.lbl_faturado.Visible         := qry_fat_cc_IN_FATURADO.AsString = '1';
  frm_fat_cc.dbedt_nr_solic_fat.Visible   := qry_fat_cc_IN_FATURADO.AsString = '1';
  frm_fat_cc.dbedt_nr_nota_fatura.Visible := qry_fat_cc_IN_FATURADO.AsString = '1';

  with frm_fat_cc do
  begin
    dbedt_cd_item.Enabled               := False;
    dbedt_nm_complemento.Enabled        := False;
    dbedt_vl_lanc.Enabled               := False;
    dbedt_vl_ir.Enabled                 := False;
    dbedt_vl_assist.Enabled             := False;
    dbedt_cd_banco.Enabled              := False;
    dbedt_nr_cheque.Enabled             := False;
    dbrdgrp_forma_pagto.Enabled         := False;
    btn_co_item.Enabled                 := False;
    btn_co_banco.Enabled                := False;
    dblkpcbox_restitui.Enabled          := False;

    if qry_fat_cc_CD_ITEM.AsString = str_cd_item_sda then
    begin
      datm_fat_cc.ds_fat_cc.AutoEdit      := frm_fat_cc.st_modificar;
      dbedt_cd_favorecido.Enabled         := True;
      dbedt_cd_despachante.Enabled        := True;
      btn_co_favorecido.Enabled           := True;
      btn_co_despachante.Enabled          := True;
    end
    else
    begin
      dbedt_cd_favorecido.Enabled         := False;
      dbedt_cd_despachante.Enabled        := False;
      btn_co_favorecido.Enabled           := False;
      btn_co_despachante.Enabled          := False;
    end;
  end;

end;

procedure Tdatm_fat_cc.qry_fat_cc_AfterOpen(DataSet: TDataSet);
begin
  frm_fat_cc.pnl_dados_basicos.Enabled := qry_fat_cc_.RecordCount > 0;
  frm_fat_cc.cb_ordem.Enabled          := qry_fat_cc_.RecordCount > 0;
  frm_fat_cc.edt_chave.Enabled         := qry_fat_cc_.RecordCount > 0;

  qry_fat_cc_cliente_.Close;
  qry_fat_cc_cliente_.Prepare;
  qry_fat_cc_cliente_.Open;
end;

procedure Tdatm_fat_cc.qry_fat_cc_BeforePost(DataSet: TDataSet);
begin
  qry_item_por_ton_.Close;
  qry_item_por_ton_.ParamByName('CD_ITEM').AsString := qry_fat_cc_CD_ITEM.AsString;
  qry_item_por_ton_.Open;
  if qry_item_por_ton_.RecordCount > 0 then
  begin
    qry_fat_cc_CD_ITEM_NAO_FAT.AsString := qry_fat_cc_CD_ITEM.AsString;
    qry_fat_cc_NM_ITEM_COMPLEMENTO.AsString := qry_fat_cc_look_nm_item.AsString;
    qry_fat_cc_CD_ITEM.AsString := str_cd_item_nao_fat;
  end;
end;

end.
