unit PGPG004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_monta_pagto = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
    sp_proc_itens_monta_pagto: TStoredProc;
    StringField13: TStringField;
    StringField14: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookProduto: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_LookServico: TStringField;
    qry_proc_co_: TQuery;
    qry_proc_co_NR_PROCESSO: TStringField;
    qry_proc_co_CD_UNID_NEG: TStringField;
    qry_proc_co_CD_PRODUTO: TStringField;
    qry_proc_co_CD_SERVICO: TStringField;
    qry_proc_co_CD_CLIENTE: TStringField;
    qry_proc_co_LookUnidade: TStringField;
    qry_proc_co_LookProduto: TStringField;
    qry_proc_co_LookCliente: TStringField;
    qry_proc_co_LookServico: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_IN_SOLIC_CHQ: TStringField;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    qry_solic_pagto_: TQuery;
    qry_solic_pagto_NR_PROCESSO: TStringField;
    qry_solic_pagto_CD_ITEM: TStringField;
    qry_solic_pagto_VL_PAGTO: TFloatField;
    qry_solic_pagto_DT_PAGTO: TDateTimeField;
    ds_solic_pagto: TDataSource;
    qry_solic_pagto_LookItem: TStringField;
    qry_solic_pagto_IN_SOLICITADO: TStringField;
    qry_solic_pagto_CalcNrProcesso: TStringField;
    qry_solic_pagto_LookSolicitado: TStringField;
    qry_solic_pagto_Look_IN_SOLIC_CHQ: TStringField;
    qry_solic_pagto_CD_CALCULO: TStringField;
    ds_calculo: TDataSource;
    qry_calculo_: TQuery;
    qry_calculo_CD_CALCULO: TStringField;
    qry_calculo_NM_CALCULO: TStringField;
    qry_calculo_NM_STORED_PROCEDURE: TStringField;
    qry_calculo_CD_TABELA: TStringField;
    qry_solic_pagto_LookCalculo: TStringField;
    qry_item_IN_ITEM_DI: TStringField;
    qry_solic_pagto_LookItemDI: TStringField;
    qry_status_solic_pagto_: TQuery;
    qry_status_solic_pagto_DESCRICAO: TStringField;
    ds_status_solic_pagto: TDataSource;
    qry_solic_pagto_DT_SOLIC_PAGTO: TDateTimeField;
    qry_solic_pagto_HM_SOLIC_PAGTO: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_DT_CALCULO: TDateTimeField;
    sp_di_calculo_: TStoredProc;
    StringField3: TStringField;
    StringField4: TStringField;
    qry_solic_pagto_IN_RESTITUI: TStringField;
    qry_solic_pagto_IN_CALCULADO: TStringField;
    qry_solic_pagto_CD_FAVORECIDO: TStringField;
    qry_solic_pagto_CD_BANCO: TStringField;
    qry_solic_pagto_NR_DOCTO: TStringField;
    qry_solic_pagto_NR_REF: TStringField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_solic_pagto_LookBanco: TStringField;
    qry_solic_pagto_LookFavorecido: TStringField;
    qry_solic_pagto_CD_USUARIO_SOLIC: TStringField;
    qry_solic_pagto_CD_USUARIO_MONTA: TStringField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    qry_solic_pagto_LookStatus: TStringField;
    qry_status_solic_pagto_CODIGO: TStringField;
    qry_solic_pagto_CD_STATUS: TStringField;
    qry_solic_fav_: TQuery;
    ds_solic_fav: TDataSource;
    qry_solic_fav_NR_PROCESSO: TStringField;
    qry_solic_fav_CD_ITEM: TStringField;
    qry_solic_fav_VL_PAGTO: TFloatField;
    qry_solic_fav_DT_PAGTO: TDateTimeField;
    qry_solic_fav_CD_STATUS: TStringField;
    qry_solic_fav_IN_SOLICITADO: TStringField;
    qry_solic_fav_IN_RESTITUI: TStringField;
    qry_solic_fav_DT_SOLIC_PAGTO: TDateTimeField;
    qry_solic_fav_HM_SOLIC_PAGTO: TStringField;
    qry_solic_fav_CD_CALCULO: TStringField;
    qry_solic_fav_IN_CALCULADO: TStringField;
    qry_solic_fav_CD_FAVORECIDO: TStringField;
    qry_solic_fav_CD_BANCO: TStringField;
    qry_solic_fav_NR_DOCTO: TStringField;
    qry_solic_fav_NR_REF: TStringField;
    qry_solic_fav_CD_USUARIO_SOLIC: TStringField;
    qry_solic_fav_CD_USUARIO_MONTA: TStringField;
    qry_solic_fav_LookItem: TStringField;
    qry_solic_fav_LookStatus: TStringField;
    qry_ref_: TQuery;
    ds_ref: TDataSource;
    qry_ref_NR_REF: TStringField;
    qry_ref_DT_PAGTO: TDateTimeField;
    qry_ref_CD_BANCO: TStringField;
    qry_ref_CD_FAVORECIDO: TStringField;
    qry_ref_LookBanco: TStringField;
    qry_ref_LookFavorecido: TStringField;
    qry_ref_itens_: TQuery;
    ds_ref_itens: TDataSource;
    qry_ref_itens_NR_REF: TStringField;
    qry_ref_itens_VL_PAGTO: TFloatField;
    qry_ref_itens_DT_PAGTO: TDateTimeField;
    qry_ref_itens_CD_STATUS: TStringField;
    qry_ref_itens_LookItem: TStringField;
    qry_ref_VL_PAGTO: TFloatField;
    qry_solic_pagto_TP_DESTINO: TStringField;
    ds_tp_destino: TDataSource;
    qry_tp_destino_: TQuery;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;
    qry_solic_fav_TP_DESTINO: TStringField;
    qry_solic_fav_LookTpDestino: TStringField;
    qry_solic_pagto_LookTpDestino: TStringField;
    qry_grd_pagto_: TQuery;
    qry_grd_pagto_NR_PROCESSO: TStringField;
    qry_grd_pagto_CD_ITEM: TStringField;
    qry_grd_pagto_VL_PAGTO: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField33: TStringField;
    ds_grd_pagto: TDataSource;
    qry_grd_fav_: TQuery;
    qry_grd_fav_CD_ITEM: TStringField;
    qry_grd_fav_VL_PAGTO: TFloatField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField52: TStringField;
    ds_grd_fav: TDataSource;
    qry_grd_pagto_VL_RECEBIDO: TFloatField;
    qry_grd_fav_DT_PAGTO: TDateTimeField;
    qry_grd_fav_VL_RECEBIDO: TFloatField;
    qry_solic_fav_CalcNrProcesso: TStringField;
    qry_grd_fav_CalcNrProcesso: TStringField;
    qry_grd_fav_NR_PROCESSO: TStringField;
    qry_solic_item_: TQuery;
    qry_solic_item_NR_PROCESSO: TStringField;
    qry_solic_item_CD_ITEM: TStringField;
    qry_solic_item_CD_STATUS: TStringField;
    qry_solic_item_VL_PAGTO: TFloatField;
    qry_ref_itens_NR_PROCESSO: TStringField;
    sp_atualiza_utilizado: TStoredProc;
    StringField8: TStringField;
    StringField11: TStringField;
    qry_ref_itens_CalcNrProcesso: TStringField;
    qry_ref_NR_DOCTO: TStringField;
    qry_ref_itens_TP_DESTINO: TStringField;
    qry_ref_itens_LookTpDestino: TStringField;
    sp_distribui_pagto: TStoredProc;
    StringField17: TStringField;
    StringField18: TStringField;
    qry_solic_pagto_VL_DESCONTO: TFloatField;
    qry_solic_pagto_VL_PERC_DESCONTO: TFloatField;
    qry_solic_pagto_CalcVlTotal: TFloatField;
    qry_solic_fav_VL_DESCONTO: TFloatField;
    qry_solic_fav_VL_PERC_DESCONTO: TFloatField;
    qry_solic_fav_CalcVlTotal: TFloatField;
    qry_solic_item_VL_DESCONTO: TFloatField;
    sp_cancela_item_solic_pagto: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_solic_item_DT_PAGTO: TDateTimeField;
    qry_solic_pagto_NR_LANCAMENTO: TStringField;
    qry_grd_pagto_NR_LANCAMENTO: TStringField;
    qry_grd_fav_NR_LANCAMENTO: TStringField;
    qry_solic_fav_NR_LANCAMENTO: TStringField;
    qry_ref_itens_NR_LANCAMENTO: TStringField;
    sp_cancela_solic_pagto: TStoredProc;
    StringField19: TStringField;
    StringField20: TStringField;
    qry_solic_item_NR_LANCAMENTO: TStringField;
    qry_ref_itens_CD_ITEM: TStringField;
    qry_ref_itens_LookStatus: TStringField;
    qry_solic_item_LookItem: TStringField;
    qry_solic_fav_LookBanco: TStringField;
    qry_favorecido_CD_BANCO: TStringField;
    qry_grd_pagto_CD_FAVORECIDO: TStringField;
    qry_grd_pagto_LookFavorecido: TStringField;
    qry_pagtoData_: TQuery;
    qry_pagtoData_NR_PROCESSO: TStringField;
    qry_pagtoData_NR_LANCAMENTO: TStringField;
    qry_pagtoData_CD_ITEM: TStringField;
    qry_pagtoData_CD_DESTINO: TStringField;
    qry_pagtoData_CD_FAVORECIDO: TStringField;
    qry_pagtoData_CD_BANCO: TStringField;
    qry_pagtoData_VL_PAGTO: TFloatField;
    qry_pagtoData_CD_STATUS: TStringField;
    qry_pagtoData_DT_PAGTO: TDateTimeField;
    qry_pagtoData_NR_DOCTO: TStringField;
    qry_pagtoData_TP_DESTINO: TStringField;
    qry_pagtoData_VL_RECEBIDO: TFloatField;
    dsgridPagtoData_: TDataSource;
    qry_pagtoData_calcNrProcesso: TStringField;
    qry_pagtoData_Look_Favorecido: TStringField;
    qry_pagtoData_Look_Item: TStringField;
    qry_pagtoData_Look_TpDestino: TStringField;
    qry_pagtoData_Look_Status: TStringField;
    qry_co_fav_: TQuery;
    StringField7: TStringField;
    StringField12: TStringField;
    qry_ref_CD_STATUS_CHEQUE: TStringField;
    qry_status_cheque_: TQuery;
    qry_ref_LookStatusCheque: TStringField;
    qry_status_cheque_CODIGO: TStringField;
    qry_status_cheque_DESCRICAO: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_soma_fav_: TQuery;
    qry_soma_fav_VL_TOTAL: TFloatField;
    ds_soma_fav: TDataSource;
    qry_param_IN_CANC_CH_OP: TStringField;
    qry_grd_pagto_TP_DESTINO: TStringField;
    qry_grd_fav_TP_DESTINO: TStringField;
    qry_soma_proc_: TQuery;
    FloatField2: TFloatField;
    ds_soma_proc: TDataSource;
    qry_solic_pagto_IN_TED: TStringField;
    qry_solic_fav_IN_TED: TStringField;
    qry_ref_CD_UNID_NEG: TStringField;
    qry_ref_itens_CD_UNID_NEG: TStringField;
    sp_cancela_item_solic_pagamento: TStoredProc;
    qry_banco_NR_DOC: TStringField;
    qry_grd_fav_IN_MONTAR: TStringField;
    qry_grd_pagto_IN_MONTAR: TStringField;
    qry_grd_fav_calcMontar: TStringField;
    qry_grd_pagto_calcMontar: TStringField;
    qry_solic_pagto_IN_MONTAR: TStringField;
    qry_ref_itens_IN_MONTAR: TStringField;
    qry_ref_itens_calcMONTAR: TStringField;
    qry_grd_pagto_CD_USUARIO_MONTA: TStringField;
    qry_grd_fav_CD_USUARIO_MONTA: TStringField;
    qry_ref_itens_CD_USUARIO_MONTA: TStringField;
    tblLote: TQuery;
    upd_solic_pagto: TUpdateSQL;
    Upd_solic_fav: TUpdateSQL;
    qry_solic_fav_CD_DESTINO: TStringField;
    qry_solic_fav_CD_STATUS_CHEQUE: TStringField;
    qry_solic_fav_IN_TRANSF_FIN: TStringField;
    qry_solic_fav_DT_CANCELAMENTO: TDateTimeField;
    qry_solic_fav_CD_CANCELADOR: TStringField;
    qry_solic_fav_CD_MOEDA: TStringField;
    qry_solic_fav_VL_COMPRA: TFloatField;
    qry_solic_fav_CD_MOEDA_VENDA: TStringField;
    qry_solic_fav_VL_VENDA: TFloatField;
    qry_solic_fav_DT_MONTAGEM: TDateTimeField;
    qry_solic_fav_TP_SOLICITACAO: TStringField;
    qry_solic_fav_IN_SELECIONADO: TStringField;
    qry_solic_fav_NR_RD: TStringField;
    qry_solic_fav_DT_IMPR_TXT: TDateTimeField;
    qry_solic_fav_DT_IMPR_RD: TDateTimeField;
    qry_solic_fav_DT_PARIDADE: TDateTimeField;
    qry_solic_fav_VL_PARIDADE: TFloatField;
    qry_solic_fav_IN_CONVERSAO: TStringField;
    qry_solic_fav_VL_COMPRA_EFETIVA: TFloatField;
    qry_solic_fav_IN_MONTAR: TStringField;
    qry_solic_fav_CD_MONTADOR: TStringField;
    qry_solic_pagto_CD_DESTINO: TStringField;
    qry_solic_pagto_CD_STATUS_CHEQUE: TStringField;
    qry_solic_pagto_IN_TRANSF_FIN: TStringField;
    qry_solic_pagto_DT_CANCELAMENTO: TDateTimeField;
    qry_solic_pagto_CD_CANCELADOR: TStringField;
    qry_solic_pagto_CD_MOEDA: TStringField;
    qry_solic_pagto_VL_COMPRA: TFloatField;
    qry_solic_pagto_CD_MOEDA_VENDA: TStringField;
    qry_solic_pagto_VL_VENDA: TFloatField;
    qry_solic_pagto_DT_MONTAGEM: TDateTimeField;
    qry_solic_pagto_TP_SOLICITACAO: TStringField;
    qry_solic_pagto_IN_SELECIONADO: TStringField;
    qry_solic_pagto_NR_RD: TStringField;
    qry_solic_pagto_DT_IMPR_TXT: TDateTimeField;
    qry_solic_pagto_DT_IMPR_RD: TDateTimeField;
    qry_solic_pagto_DT_PARIDADE: TDateTimeField;
    qry_solic_pagto_VL_PARIDADE: TFloatField;
    qry_solic_pagto_IN_CONVERSAO: TStringField;
    qry_solic_pagto_VL_COMPRA_EFETIVA: TFloatField;
    qry_solic_pagto_CD_MONTADOR: TStringField;
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_solic_pagto_CalcFields(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterEdit(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterInsert(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterPost(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterCancel(DataSet: TDataSet);
    procedure qry_solic_fav_CalcFields(DataSet: TDataSet);
    procedure qry_grd_fav_CalcFields(DataSet: TDataSet);
    procedure qry_ref_itens_CalcFields(DataSet: TDataSet);
    procedure qry_solic_fav_AfterCancel(DataSet: TDataSet);
    procedure qry_solic_fav_AfterEdit(DataSet: TDataSet);
    procedure qry_solic_fav_AfterInsert(DataSet: TDataSet);
    procedure qry_solic_fav_AfterPost(DataSet: TDataSet);
    procedure qry_solic_fav_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_pagto_CD_FAVORECIDOChange(Sender: TField);
    procedure qry_pagtoData_CalcFields(DataSet: TDataSet);
    procedure qry_grd_fav_AfterScroll(DataSet: TDataSet);
    procedure qry_grd_pagto_AfterScroll(DataSet: TDataSet);
    procedure qry_grd_pagto_CalcFields(DataSet: TDataSet);
    procedure qry_ref_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterDelete(DataSet: TDataSet);
    procedure qry_solic_fav_AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_monta_pagto: Tdatm_monta_pagto;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG001, PGPG003;

{$R *.DFM}

procedure Tdatm_monta_pagto.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_CalcFields(DataSet: TDataSet);
begin
  qry_solic_pagto_CalcVlTotal.AsFloat := qry_solic_pagto_VL_PAGTO.AsFloat - qry_solic_pagto_VL_DESCONTO.AsFloat;
  if Not qry_solic_pagto_NR_PROCESSO.IsNull then
  begin
    qry_solic_pagto_CalcNrProcesso.AsString := Copy( qry_solic_pagto_NR_PROCESSO.AsString, 5, 14 );
  end;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterScroll(DataSet: TDataSet);
begin
  with frm_monta_pagto do
  begin
    if ( ( not qry_solic_pagto_.EOF ) or
         ( qry_solic_pagto_.State in [dsinsert] ) ) and
       ( ( StrToInt( FNullToZero(qry_solic_pagto_CD_STATUS.AsString)) >= 1 ) and
         ( StrToInt( FNullToZero(qry_solic_pagto_CD_STATUS.AsString)) <= 6 ) ) then
    begin
      ds_solic_pagto.AutoEdit    := st_modificar;
      btn_co_item.Enabled        := st_modificar;
      btn_co_favorecido2.Enabled := st_modificar;
      btn_co_banco.Enabled       := st_modificar;
      pnl_por_processo.Enabled   := st_modificar;
    end
    else
    begin
      ds_solic_pagto.AutoEdit    := False;
      btn_co_item.Enabled        := False;
      btn_co_favorecido2.Enabled := False;
      btn_co_banco.Enabled       := False;
      pnl_por_processo.Enabled   := False;
    end;

    if pgctrl_monta_pagto.ActivePage = ts_processo then     // Processo
    begin
      msk_nr_doc_proc.Text := '';
      // Verifica o nr do DOC  - 04/10/2006
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        Sql.Clear;
        Sql.Add( ' SELECT NR_DOC FROM TBANCO (NOLOCK) ');
        Sql.Add( ' WHERE CD_BANCO = :CD_BANCO ');
        ParamByName('CD_BANCO').AsString := qry_solic_pagto_CD_BANCO.AsString;
        Open;
        if Not Eof then
        begin
          if Trim( Fields[0].AsString ) <> '' then
          begin
            msk_nr_doc_proc.Text := StrZero( ( StrToInt( Fields[0].AsString ) + 1 ), 6 );
          end
          else
          begin
            msk_nr_doc_proc.Text := '000001';
          end;
        end;
        Close;
        Free;
      end;
    end;

  end;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterEdit(DataSet: TDataSet);
begin
  frm_monta_pagto.dbgrdMontaPagto.Enabled := False;
  frm_monta_pagto.dbnvg.Enabled           := False;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterInsert(DataSet: TDataSet);
begin
  frm_monta_pagto.dbnvg.Enabled           := False;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterPost(DataSet: TDataSet);
begin
  qry_solic_pagto_.ApplyUpdates;
  frm_monta_pagto.dbgrdMontaPagto.Enabled := True;
  frm_monta_pagto.dbnvg.Enabled           := True;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterCancel(DataSet: TDataSet);
begin
  frm_monta_pagto.dbgrdMontaPagto.Enabled := True;
  frm_monta_pagto.dbnvg.Enabled           := True;
end;


procedure Tdatm_monta_pagto.qry_solic_fav_CalcFields(
  DataSet: TDataSet);
begin
  qry_solic_fav_CalcVlTotal.AsFloat     := qry_solic_fav_VL_PAGTO.AsFloat - qry_solic_fav_VL_DESCONTO.AsFloat;
  if Not qry_solic_fav_NR_PROCESSO.IsNull then
  begin
    qry_solic_fav_CalcNrProcesso.AsString := Copy( qry_solic_fav_NR_PROCESSO.AsString, 5, 14 );
  end;
end;

procedure Tdatm_monta_pagto.qry_grd_fav_CalcFields(DataSet: TDataSet);
begin
  qry_grd_fav_CalcNrProcesso.AsString := Copy( qry_grd_fav_NR_PROCESSO.AsString, 5, 14 );
  if qry_grd_fav_IN_MONTAR.AsString = '1' then
    qry_grd_fav_calcMONTAR.AsString := 'ü'
  else
    qry_grd_fav_calcMONTAR.AsString := '';
end;

procedure Tdatm_monta_pagto.qry_ref_itens_CalcFields(DataSet: TDataSet);
begin
  qry_ref_itens_CalcNrProcesso.AsString := Copy( qry_ref_itens_NR_PROCESSO.AsString, 5, 14 );
  if qry_ref_itens_IN_MONTAR.AsString = '1' then
    qry_ref_itens_calcMONTAR.AsString := 'ü'
  else
    qry_ref_itens_calcMONTAR.AsString := '';
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterCancel(DataSet: TDataSet);
begin
  frm_monta_pagto.dbgrdMontaFav.Enabled := True;
  frm_monta_pagto.dbnvg.Enabled         := True;
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterEdit(DataSet: TDataSet);
begin
  frm_monta_pagto.dbgrdMontaFav.Enabled := False;
  frm_monta_pagto.dbnvg.Enabled         := False;
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterInsert(DataSet: TDataSet);
begin
  frm_monta_pagto.dbnvg.Enabled        := False;
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterPost(DataSet: TDataSet);
begin
  qry_solic_fav_.ApplyUpdates;
  frm_monta_pagto.dbgrdMontaFav.Enabled := True;
  frm_monta_pagto.dbnvg.Enabled         := True;
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterScroll(DataSet: TDataSet);
begin
  with frm_monta_pagto do
  begin
    if ( ( not qry_solic_fav_.EOF ) or
         ( qry_solic_fav_.State in [dsinsert] ) ) and
       ( ( StrToInt( FNullToZero(qry_solic_fav_CD_STATUS.AsString)) >= 1 ) and
         ( StrToInt( FNullToZero(qry_solic_fav_CD_STATUS.AsString)) <= 6 ) ) then
    begin
      ds_solic_fav.AutoEdit      := st_modificar;
      btn_co_item2.Enabled       := st_modificar;
      btn_co_banco2.Enabled      := st_modificar;
      pnl_por_favorecido.Enabled := st_modificar;
    end
    else
    begin
      ds_solic_fav.AutoEdit      := False;
      btn_co_item2.Enabled       := False;
      btn_co_banco2.Enabled      := False;
      pnl_por_favorecido.Enabled := False;
    end;
  end;
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_CD_FAVORECIDOChange(
  Sender: TField);
begin
  if qry_solic_pagto_.State in [dsEdit, dsInsert] then
  begin
    if qry_solic_pagto_CD_FAVORECIDO.AsString = '' then
    begin
      qry_solic_pagto_CD_BANCO.AsString      := '';
    end
    else
    begin
      if ( qry_solic_pagto_CD_BANCO.AsString = '' ) and
         ( qry_favorecido_CD_BANCO.AsString <> '' ) then
      begin
        qry_solic_pagto_CD_BANCO.AsString := qry_favorecido_CD_BANCO.AsString;
      end;
    end;
  end;
end;

procedure Tdatm_monta_pagto.qry_pagtoData_CalcFields(DataSet: TDataSet);
begin
  qry_pagtoData_calcNrProcesso.AsString := Copy( qry_pagtoData_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_monta_pagto.qry_grd_fav_AfterScroll(DataSet: TDataSet);
begin
  with frm_monta_pagto do
  begin
    if qry_grd_fav_TP_DESTINO.AsString = '3' then
       dbedt_dt_pagto2.Color := clWindow
    else
       dbedt_dt_pagto2.Color := clMenu;
    dbedt_dt_pagto2.Enabled  := qry_grd_fav_TP_DESTINO.AsString = '3';
    dbedt_dt_pagto2.TabStop  := qry_grd_fav_TP_DESTINO.AsString = '3';
    dbedt_dt_pagto2.ReadOnly := Not ( qry_grd_fav_TP_DESTINO.AsString = '3' );
  end;
end;

procedure Tdatm_monta_pagto.qry_grd_pagto_AfterScroll(DataSet: TDataSet);
begin
  with frm_monta_pagto do
  begin
    if qry_grd_pagto_TP_DESTINO.AsString = '3' then
       dbedt_dt_pagto.Color := clWindow
    else
       dbedt_dt_pagto.Color := clMenu;
    dbedt_dt_pagto.Enabled  := qry_grd_pagto_TP_DESTINO.AsString = '3';
    dbedt_dt_pagto.TabStop  := qry_grd_pagto_TP_DESTINO.AsString = '3';
    dbedt_dt_pagto.ReadOnly := Not ( qry_grd_pagto_TP_DESTINO.AsString = '3' );
  end;
end;



procedure Tdatm_monta_pagto.qry_grd_pagto_CalcFields(DataSet: TDataSet);
begin
  if qry_grd_pagto_IN_MONTAR.AsString = '1' then
    qry_grd_pagto_calcMONTAR.AsString := 'ü'
  else
    qry_grd_pagto_calcMONTAR.AsString := '';

end;

procedure Tdatm_monta_pagto.qry_ref_AfterScroll(DataSet: TDataSet);
begin
  frm_monta_pagto.btn_desmarca_todasClick(nil);
end;

procedure Tdatm_monta_pagto.qry_solic_pagto_AfterDelete(DataSet: TDataSet);
begin
  qry_solic_pagto_.ApplyUpdates;
end;

procedure Tdatm_monta_pagto.qry_solic_fav_AfterDelete(DataSet: TDataSet);
begin
  qry_solic_fav_.ApplyUpdates; 
end;

end.
