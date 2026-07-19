unit PGCH006;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_solic_ch = class(TDataModule)
    ds_solic_ch_itens: TDataSource;
    ds_solic_ch: TDataSource;
    ds_item: TDataSource;
    qry_item_: TQuery;
    ds_banco: TDataSource;
    ds_desp: TDataSource;
    ds_favorecido: TDataSource;
    tbl_status_solic_ch_: TTable;
    tbl_status_solic_ch_CODIGO: TStringField;
    tbl_status_solic_ch_DESCRICAO: TStringField;
    ds_status_solic_ch: TDataSource;
    ds_status_item_solic_ch: TDataSource;
    tbl_status_item_solic_ch_: TTable;
    ds_status_ch: TDataSource;
    tbl_status_ch_: TTable;
    tbl_status_ch_CODIGO: TStringField;
    tbl_status_ch_DESCRICAO: TStringField;
    sp_cancela_solic_ch: TStoredProc;
    StringField11: TStringField;
    StringField12: TStringField;
    sp_proc_item_solic_ch: TStoredProc;
    StringField13: TStringField;
    StringField14: TStringField;
    sp_cancela_item_solic_ch: TStoredProc;
    StringField15: TStringField;
    StringField16: TStringField;
    ds_solic_ch_usuario_: TDataSource;
    qry_solic_ch_usuario_: TQuery;
    qry_solic_ch_usuario_NR_SOLIC_CH: TStringField;
    qry_solic_ch_usuario_CD_FAVORECIDO: TStringField;
    qry_solic_ch_usuario_CD_BANCO: TStringField;
    qry_solic_ch_usuario_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_usuario_CD_STATUS_SOLIC_CH: TStringField;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    qry_solic_ch_usuario_LookFavorecido: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_solic_ch_usuario_LookBanco: TStringField;
    qry_solic_ch_usuario_LookStSolicCheque: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
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
    tbl_status_item_solic_ch_CODIGO: TStringField;
    tbl_status_item_solic_ch_DESCRICAO: TStringField;
    qry_ult_lanc_: TQuery;
    qry_ult_lanc_ULTIMO: TStringField;
    qry_ult_solic_ch_: TQuery;
    qry_ult_solic_ch_ULTIMO: TStringField;
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
    qry_solic_ch_usuario_DT_SOLIC_CH: TStringField;
    qry_solic_ch_usuario_CD_TIPO_LANC: TStringField;
    qry_solic_ch_itens_: TQuery;
    qry_solic_ch_itens_NR_LANCAMENTO: TStringField;
    qry_solic_ch_itens_NR_PROCESSO: TStringField;
    qry_solic_ch_itens_CD_ITEM: TStringField;
    qry_solic_ch_itens_VL_ITEM: TFloatField;
    qry_solic_ch_itens_DT_SOLIC_CH: TStringField;
    qry_solic_ch_itens_NR_SOLIC_CH: TStringField;
    qry_solic_ch_itens_CD_STATUS: TStringField;
    qry_solic_ch_itens_VL_ASSIST: TFloatField;
    qry_solic_ch_itens_CD_DESPACHANTE: TStringField;
    qry_solic_ch_itens_LookItem: TStringField;
    qry_solic_ch_itens_LookStSolicChItens: TStringField;
    qry_solic_ch_itens_LookDespachante: TStringField;
    qry_solic_ch_itens_CalcNrProcesso: TStringField;
    qry_solic_ch_itens_CD_CLIENTE: TStringField;
    qry_solic_ch_itens_LookCli: TStringField;
    qry_solic_ch_: TQuery;
    qry_solic_ch_DT_SOLIC_CH: TStringField;
    qry_solic_ch_NR_SOLIC_CH: TStringField;
    qry_solic_ch_HM_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_ch_CD_BANCO: TStringField;
    qry_solic_ch_CD_FAVORECIDO: TStringField;
    qry_solic_ch_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_NR_CHEQUE: TStringField;
    qry_solic_ch_LookStatusSolicCh: TStringField;
    qry_solic_ch_LookBanco: TStringField;
    qry_solic_ch_LookFavorecido: TStringField;
    qry_solic_ch_CD_USUARIO: TStringField;
    qry_solic_ch_CD_TIPO_LANC: TStringField;
    qry_solic_ch_CD_STATUS_CHEQUE: TStringField;
    qry_solic_ch_IN_EMITIR: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_solic_ch_itens_LookTpItem: TStringField;
    qry_solic_ch_LookControlaIR: TBooleanField;
    qry_solic_ch_itens_CD_FORNECEDOR: TStringField;
    qry_solic_ch_itens_LookFornecedor: TStringField;
    qry_solic_ch_itens_LookControlaIR: TBooleanField;
    qry_solic_ch_itens_Calc_VL_CH_ITEM: TFloatField;
    qry_item_IN_SOLIC_CHQ: TStringField;
    qry_solic_ch_itens_Look_IN_SOLIC_CHQ: TStringField;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    qry_solic_ch_itens_IN_RESTITUI: TStringField;
    qry_solic_ch_itens_VL_IR: TFloatField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    procedure qry_solic_ch_itens_CalcFields(DataSet: TDataSet);
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_solic_ch_itens_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_ch_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_solic_ch: Tdatm_solic_ch;

implementation

uses GSMLIB, PGGP001, PGGP017, PGCH001;

{$R *.DFM}

procedure Tdatm_solic_ch.qry_solic_ch_itens_CalcFields(DataSet: TDataSet);
begin
  if Not qry_solic_ch_itens_NR_PROCESSO.IsNull then
  begin
    qry_solic_ch_itens_CalcNrProcesso.AsString := Copy( qry_solic_ch_itens_NR_PROCESSO.AsString, 5, 14 );
  end;
  qry_solic_ch_itens_Calc_VL_CH_ITEM.AsFloat := qry_solic_ch_itens_VL_ITEM.AsFloat +
                                                qry_solic_ch_itens_VL_ASSIST.AsFloat -
                                                qry_solic_ch_itens_VL_IR.AsFloat;
end;

procedure Tdatm_solic_ch.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;

procedure Tdatm_solic_ch.qry_solic_ch_itens_AfterScroll(DataSet: TDataSet);
begin
  with frm_solic_ch do
  begin
    if qry_solic_ch_itens_CD_ITEM.AsString = str_cd_sda then
    begin
      dbedt_cd_despachante.Color    := clWindow;
      dbedt_cd_despachante.ReadOnly := False;
      dbedt_cd_despachante.TabStop  := True;
      btn_co_despachante.Enabled    := True;
      dbedt_vl_assist.Color         := clWindow;
      dbedt_vl_assist.ReadOnly      := False;
      dbedt_vl_assist.TabStop       := True;
    end
    else
    begin
      dbedt_cd_despachante.Color    := clMenu;
      dbedt_cd_despachante.ReadOnly := True;
      dbedt_cd_despachante.TabStop  := False;
      btn_co_despachante.Enabled    := False;
      dbedt_vl_assist.Color         := clMenu;
      dbedt_vl_assist.ReadOnly      := True;
      dbedt_vl_assist.TabStop       := False;
    end;

    if ( (qry_solic_ch_itens_.RecordCount > 0) or
         (qry_solic_ch_itens_.State in [dsinsert]) ) and
       ( (qry_solic_ch_itens_CD_STATUS.AsString = '')  or  //  -Incluindo
         (qry_solic_ch_itens_CD_STATUS.AsString = '1') or  // 1-Saldo Insuficiente
         (qry_solic_ch_itens_CD_STATUS.AsString = '2') or  // 2-Não Solicitado
         (qry_solic_ch_itens_CD_STATUS.AsString = '3') ) then  // 3-Não Recebido
    begin
      ds_solic_ch_itens.AutoEdit := st_modificar;
      msk_cd_unid_neg.ReadOnly   := not st_modificar;
      msk_cd_produto.ReadOnly    := not st_modificar;
      msk_nr_processo.ReadOnly   := not st_modificar;
      btn_co_unid_neg.Enabled    := st_modificar;
      btn_co_produto.Enabled     := st_modificar;
      btn_co_processo.Enabled    := st_modificar;
      btn_co_item.Enabled        := st_modificar;
      btn_co_despachante.Enabled := st_modificar;
      btn_co_fornecedor.Enabled  := st_modificar;
    end
    else
    begin
      ds_solic_ch_itens.AutoEdit := False;
      msk_cd_unid_neg.ReadOnly   := True;
      msk_cd_produto.ReadOnly    := True;
      msk_nr_processo.ReadOnly   := True;
      btn_co_unid_neg.Enabled    := False;
      btn_co_produto.Enabled     := False;
      btn_co_processo.Enabled    := False;
      btn_co_item.Enabled        := False;
      btn_co_despachante.Enabled := False;
      btn_co_fornecedor.Enabled  := False;
    end;

    if (pgctrl_solic_ch.ActivePage = ts_solic_ch) then
      if ( (qry_solic_ch_itens_.RecordCount > 0) or
           (qry_solic_ch_itens_.State in [dsinsert]) ) and
         ( (datm_solic_ch.qry_solic_ch_itens_CD_STATUS.AsString <> 'C') and
           (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') ) then
      begin
        btn_canc_solic_ch.Enabled := True;
        mi_can_solic_ch.Enabled   := True;
      end
      else
      begin
        btn_canc_solic_ch.Enabled := False;
        mi_can_solic_ch.Enabled   := False;
      end;
    qry_processo_.Close;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := qry_solic_ch_itens_NR_PROCESSO.AsString;
    qry_processo_.Prepare;
    qry_processo_.Open;

    if not (qry_solic_ch_itens_.State in [dsinsert]) then
    begin
      msk_cd_unid_neg.Text := qry_processo_CD_UNID_NEG.AsString;
      edt_nm_unid_neg.Text := qry_processo_LookUnidNeg.AsString;
      msk_cd_produto.Text  := qry_processo_CD_PRODUTO.AsString;
      edt_nm_produto.Text  := qry_processo_LookProduto.AsString;
      msk_nr_processo.Text := Copy(qry_processo_NR_PROCESSO.AsString, 5, 14 );
      edt_cd_cliente.Text  := qry_processo_CD_CLIENTE.AsString;
      edt_nm_cliente.Text  := qry_processo_LookCliente.AsString;
      edt_cd_servico.Text  := qry_processo_CD_SERVICO.AsString;
      edt_nm_servico.Text  := qry_processo_LookServico.AsString;
    end;

    if qry_solic_ch_itens_LookControlaIR.AsBoolean then   
    begin
      dbedt_vl_ir.Color    := clWindow;
      dbedt_vl_ir.ReadOnly := False;
      dbedt_vl_ir.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir.Color    := clMenu;
      dbedt_vl_ir.ReadOnly := True;
      dbedt_vl_ir.TabStop  := False;
    end;

  end;
end;

procedure Tdatm_solic_ch.qry_solic_ch_AfterScroll(DataSet: TDataSet);
begin
  with frm_solic_ch do
  begin
    if ((qry_solic_ch_CD_STATUS_SOLIC_CH.AsString = '0') or   // 0-Em Processamento
        (qry_solic_ch_CD_STATUS_SOLIC_CH.AsString = '2')) and  // 2-Aguardando Disposição
       (qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') then  // 0-Solicitando
    begin
      ds_solic_ch.AutoEdit := st_modificar;
      btn_co_banco.Enabled := st_modificar;
      btn_co_favorecido.Enabled := st_modificar;
    end
    else
    begin
      ds_solic_ch.AutoEdit := False;
      btn_co_banco.Enabled := False;
      btn_co_favorecido.Enabled := False;
    end;

    if (pgctrl_solic_ch.ActivePage = ts_lista) then
      if (datm_solic_ch.qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '6') and
         (datm_solic_ch.qry_solic_ch_CD_STATUS_SOLIC_CH.AsString <> '7') then
      begin
        btn_canc_solic_ch.Enabled := True;
        mi_can_solic_ch.Enabled := True;
      end
      else
      begin
        btn_canc_solic_ch.Enabled := False;
        mi_can_solic_ch.Enabled := False;
      end;
  end;
end;




end.
