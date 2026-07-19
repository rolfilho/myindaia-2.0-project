unit PGNM002;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_numerario = class(TDataModule)
    dsq_item: TDataSource;
    ds_yesno: TDataSource;
    ds_itens_solinum: TDataSource;
    ds_solinum: TDataSource;
    ds_usuario: TDataSource;
    ds_banco: TDataSource;
    ds_processo: TDataSource;
    ds_tp_destino: TDataSource;
    ds_favorecido: TDataSource;


    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_IN_ATIVO: TStringField;

    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    LK_STATUS_ITEM: TStringField;
    qry_itens_solinum_LK_NM_ITEM: TStringField;
    qry_itens_solinum_CD_BANCO: TStringField;
    qry_itens_solinum_LK_ITEM_ATIVO: TStringField;
    qry_itens_solinum_TP_DESTINO: TStringField;
    qry_itens_solinum_LookBanco: TStringField;
    qry_itens_solinum_LookBancoFav: TStringField;
    qry_itens_solinum_LookTpDestino: TStringField;
    qry_itens_solinum_CD_FAVORECIDO: TStringField;
    qry_itens_solinum_LookFavorecido: TStringField;

    qry_solinum_: TQuery;
    qry_solinum_NR_PROCESSO: TStringField;
    qry_solinum_NR_SOLICITACAO: TStringField;
    qry_solinum_DT_SOLICITACAO: TDateTimeField;
    qry_solinum_CD_USUARIO: TStringField;
    qry_solinum_CD_STATUS: TStringField;
    qry_solinum_VL_SOLICITADO: TFloatField;
    qry_solinum_VL_RECEBIDO: TFloatField;
    qry_solinum_Look_ap_usuario2: TStringField;
    LK_STATUS_NUMER: TStringField;
    qry_solinum_DT_EMISSAO: TDateTimeField;
    qry_solinum_CD_BASE_CALCULO: TStringField;


{    StringField1: TStringField;
    StringField2: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;

    }

    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;

    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;

    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;

    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;

    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;

    qry_cliente_numerario_: TQuery;
    qry_cliente_numerario_CD_CLIENTE: TStringField;
    qry_cliente_numerario_CD_UNID_NEG: TStringField;
    qry_cliente_numerario_CD_PRODUTO: TStringField;
    qry_cliente_numerario_CD_SERVICO: TStringField;
    qry_cliente_numerario_NR_SOLICITACAO: TStringField;
    qry_cliente_numerario_CD_ITEM: TStringField;
    qry_cliente_numerario_NM_STORED_PROCEDURE: TStringField;

    qry_status_numer_: TQuery;
    qry_status_numer_CD_STATUS: TStringField;
    qry_status_numer_NM_STATUS: TStringField;

    qry_tp_destino_: TQuery;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;

    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_CD_BANCO: TStringField;

    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_servico_CD_BANCO_DEB_CC: TStringField;
    qry_cliente_servico_CD_BANCO_COM: TStringField;
    qry_cliente_servico_CD_BANCO_DEB_COM: TStringField;

    qry_log_erro_calculo_: TQuery;

    qry_tot_erro_: TQuery;

    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;

    qry_yesno_: TQuery;
    qry_yesno_CD_YESNO: TStringField;
    qry_yesno_TX_YESNO: TStringField;

    sp_atz_numerario: TStoredProc;
    sp_cancela_numerario: TStoredProc;
    sp_calculo: TStoredProc;
    sp_calc_padrao: TStoredProc;
    sp_duplica_numerario: TStoredProc;
    sp_atz_pagto: TStoredProc;
    sp_soma_solinum: TStoredProc;
    qry_itens_solinum_IN_CANCELADO: TStringField;
    sp_atz_num_cpmf: TStoredProc;
    qry_cliente_servico_IN_CPMF_NUM: TStringField;
    qry_item_lanc_: TQuery;

    procedure qry_solinum_AfterScroll(DataSet: TDataSet);
    procedure qry_itens_solinum_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_numerario: Tdatm_numerario;

implementation

uses PGNM001;
{$R *.DFM}

procedure Tdatm_numerario.qry_solinum_AfterScroll(DataSet: TDataSet);
begin
  with frm_numerario do
  begin
    if qry_solinum_.RecordCount > 0 then
    begin
      if ( Not qry_solinum_DT_EMISSAO.IsNull )  OR
         ( qry_solinum_CD_STATUS.AsString = 'C' ) then
      begin
        ds_solinum.AutoEdit       := False;
        ds_itens_solinum.AutoEdit := False;
        with frm_numerario do
        begin
          btn_mi (st_incluir, False, False, False);
          btn_co_favorecido.Enabled := False;
          btn_co_item.Enabled       := False;
          btn_co_banco.Enabled      := False;
        end;
      end
      else
      begin
        ds_solinum.AutoEdit       := st_modificar;
        ds_itens_solinum.AutoEdit := st_modificar;
        if qry_solinum_.RecordCount > 0 then
        begin
          btn_mi (st_incluir, False, False, st_excluir);
          btn_co_favorecido.Enabled := True;
          btn_co_item.Enabled       := True;
          btn_co_banco.Enabled      := True;
        end
        else
        begin
          btn_mi (st_incluir, False, False, False);
          btn_co_favorecido.Enabled := False;
          btn_co_item.Enabled       := False;
          btn_co_banco.Enabled      := False;
        end;
      end;
      if qry_solinum_VL_RECEBIDO.AsFloat <= 0 then
      begin
        btn_cancela_numerario.Enabled := True;
        mi_cancela_numerario.Enabled  := True;
      end
      else
      begin
        btn_cancela_numerario.Enabled := False;
        mi_cancela_numerario.Enabled  := False;
      end;
      mi_duplicar.Enabled := True;
      btn_duplica.Enabled := True;
    end
    else
    begin
      ds_solinum.AutoEdit       := False;
      ds_itens_solinum.AutoEdit := False;
      btn_mi (st_incluir, False, False, False);
      mi_duplicar.Enabled       := False;
      btn_duplica.Enabled       := False;
    end;
  end;
end;

procedure Tdatm_numerario.qry_itens_solinum_AfterScroll(DataSet: TDataSet);
begin
  with frm_numerario do
  begin
    if qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '0' then
    begin
      dbedt_cd_favorecido.Color    := clWindow;
      dbedt_cd_favorecido.ReadOnly := False;
      dbedt_cd_favorecido.TabStop  := True;
      btn_co_favorecido.Enabled    := True;
    end
    else
    begin
      if qry_itens_solinum_.State in [dsedit, dsInsert] then
      begin
        qry_itens_solinum_.FieldByName('CD_FAVORECIDO').AsString := '';

        if qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '1' then {Déb. Conta}
           qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
              qry_cliente_servico_.FieldByName('CD_BANCO_DEB_CC').AsString;

        if qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '2' then {Comissária}
           qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
              qry_cliente_servico_.FieldByName('CD_BANCO_COM').AsString;

        if qry_itens_solinum_.FieldByName('TP_DESTINO').AsString = '3' then {Déb Conta da Comissária}
           qry_itens_solinum_.FieldByName('CD_BANCO').AsString :=
              qry_cliente_servico_.FieldByName('CD_BANCO_DEB_COM').AsString;
      end;
      dbedt_cd_favorecido.Color    := clMenu;
      dbedt_cd_favorecido.ReadOnly := True;
      dbedt_cd_favorecido.TabStop  := False;
      btn_co_favorecido.Enabled    := False;
    end;
  end;
end;







end.
