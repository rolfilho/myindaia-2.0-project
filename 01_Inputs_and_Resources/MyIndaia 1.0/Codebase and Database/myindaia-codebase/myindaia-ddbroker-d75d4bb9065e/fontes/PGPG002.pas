unit PGPG002;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_solic_pagto = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
    sp_proc_itens_solic_pagto: TStoredProc;
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
    qry_solic_pagto_DT_PAGTO: TDateTimeField;
    ds_solic_pagto: TDataSource;
    qry_solic_pagto_LookItem: TStringField;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_solic_pagto_LookStatus: TStringField;
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
    sp_atz_solic_pagto: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
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
    qry_solic_pagto_CD_FAVORECIDO: TStringField;
    qry_solic_pagto_IN_RESTITUI: TStringField;
    qry_solic_pagto_IN_CALCULADO: TStringField;
    qry_solic_pagto_NR_DOCTO: TStringField;
    qry_solic_pagto_NR_REF: TStringField;
    qry_solic_pagto_CD_USUARIO_SOLIC: TStringField;
    qry_solic_pagto_CD_USUARIO_MONTA: TStringField;
    qry_status_solic_pagto_CODIGO: TStringField;
    qry_solic_pagto_CD_STATUS: TStringField;
    ds_tp_destino: TDataSource;
    qry_tp_destino_: TQuery;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;
    qry_solic_pagto_TP_DESTINO: TStringField;
    qry_solic_pagto_LookTpDestino: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    sp_proc_pagto: TStoredProc;
    qry_solic_pagto_VL_DESCONTO: TFloatField;
    qry_solic_pagto_VL_PERC_DESCONTO: TFloatField;
    qry_solic_pagto_CalcVlTotal: TFloatField;
    sp_cancela_item_solic_pagto: TStoredProc;
    qry_solic_pagto_NR_LANCAMENTO: TStringField;
    qry_ult_lanc_: TQuery;
    qry_ult_lanc_NR_LANCAMENTO: TStringField;
    qry_solic_pagto_CD_BANCO: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_CD_BANCO: TStringField;
    qry_solic_pagto_LookFavorecido: TStringField;
    qry_solic_pagto_VL_PAGTO: TFloatField;
    qry_item_IN_SOLIC_PAGTO: TStringField;
    qry_solic_pagto_LookSolicPagto: TStringField;
    qry_tp_item_: TQuery;
    qry_tp_item_CD_TIPO_ITEM: TStringField;
    qry_solic_pagto_NR_RD: TStringField;
    qry_solic_pagto_DT_IMPR_TXT: TDateTimeField;
    qry_solic_pagto_DT_IMPR_RD: TDateTimeField;
    qry_tp_item_IN_ITEM_DI: TStringField;
    qry_solic_pagto_IN_SELECIONADO: TStringField;
    qry_solic_pagto_DT_PARIDADE: TDateTimeField;
    qry_solic_pagto_VL_PARIDADE: TFloatField;
    qry_solic_pagto_IN_CONVERSAO: TStringField;
    qry_solic_pagto_VL_COMPRA_EFETIVA: TFloatField;
    sp_solic_pagto_ag: TStoredProc;
    qry_solic_pagto_LookItemAG: TStringField;
    qry_solic_pagto_CD_MOEDA: TStringField;
    qry_solic_pagto_VL_COMPRA: TFloatField;
    qry_solic_pagto_CD_MOEDA_VENDA: TStringField;
    qry_solic_pagto_VL_VENDA: TFloatField;
    sp_proc_solic_pagto_ag: TStoredProc;
    sp_pagto_faturamento: TStoredProc;
    qry_solic_pagto_calcAPMoeda: TStringField;
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_solic_pagto_CalcFields(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterEdit(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterInsert(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterPost(DataSet: TDataSet);
    procedure qry_solic_pagto_AfterCancel(DataSet: TDataSet);
    procedure ds_solic_pagtoDataChange(Sender: TObject; Field: TField);
    procedure qry_solic_pagto_VL_PARIDADEChange(Sender: TField);
    procedure qry_solic_pagto_DT_PARIDADEChange(Sender: TField);
    procedure qry_solic_pagto_VL_COMPRA_EFETIVAChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_solic_pagto: Tdatm_solic_pagto;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPG001, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_solic_pagto.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_CalcFields(DataSet: TDataSet);
begin
  qry_solic_pagto_CalcVlTotal.AsFloat := ( qry_solic_pagto_VL_PAGTO.AsFloat - qry_solic_pagto_VL_DESCONTO.AsFloat );
  if Not qry_solic_pagto_NR_PROCESSO.IsNull then
  begin
    qry_solic_pagto_CalcNrProcesso.AsString := Copy( qry_solic_pagto_NR_PROCESSO.AsString, 5, 14 );
  end;
  qry_solic_pagto_LookItemAG.AsString := ConsultaLookUp('TITEM','CD_ITEM',qry_solic_pagto_CD_ITEM.AsString,'NM_ITEM');
  qry_solic_pagto_calcAPMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_solic_pagto_CD_MOEDA.AsString, 'AP_MOEDA');
  if (qry_solic_pagto_CD_MOEDA.AsString = '') or (qry_solic_pagto_CD_MOEDA.IsNull) then
    qry_solic_pagto_calcAPMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', '790', 'AP_MOEDA');

end;

procedure Tdatm_solic_pagto.qry_solic_pagto_AfterScroll(DataSet: TDataSet);
begin
  if frm_solic_pagto.nbClassificacao.ActivePage = 'desemb' then
  begin

    with frm_solic_pagto do
    begin
      if ( ( qry_solic_pagto_.RecordCount > 0 ) or
           ( qry_solic_pagto_.State in [dsinsert] ) ) and
         ( ( qry_solic_pagto_CD_STATUS.AsString = ''  ) or      //  Incluindo
           ( qry_solic_pagto_CD_STATUS.AsString = '0' ) ) then  // Em Processamento
      begin
        pnl_solic_pagto.Enabled := st_modificar;
        ds_solic_pagto.AutoEdit       := st_modificar;
        ds_item.AutoEdit              := st_modificar;
        btn_co_item.Enabled           := st_modificar;
        btn_co_favorecido.Enabled     := st_modificar;
        btn_co_calculo.Enabled        := st_modificar;
        dblckpbox_tp_destino.ReadOnly := False;
      end
      else
      begin
        pnl_solic_pagto.Enabled       := False;
        ds_solic_pagto.AutoEdit       := False;
        ds_item.AutoEdit              := False;
        btn_co_item.Enabled           := False;
        btn_co_favorecido.Enabled     := False;
        btn_co_calculo.Enabled        := False;
        dblckpbox_tp_destino.ReadOnly := True;
      end;

      (*--- bloqueia modificação caso já exista borderô (kleber - 01/03/2006) ------*)
      if (qry_solic_pagto_TP_DESTINO.AsString = '5') and
         ((not qry_solic_pagto_NR_RD.IsNull) or (qry_solic_pagto_NR_RD.AsString <> '' )) then
      begin
        pnl_solic_pagto.Enabled := False;
        lbl_rd.Visible := true;
      end
      else
        lbl_rd.Visible := false;
    end;

  end else begin

    ds_solic_pagto.AutoEdit       := frm_solic_pagto.st_modificar;
    ds_item.AutoEdit              := frm_solic_pagto.st_modificar;
    if qry_solic_pagto_CD_MOEDA.Asstring <> '790' then
    begin
      frm_solic_pagto.dbradgrop_tp_convert.Enabled:=true;
      frm_solic_pagto.lb_paridade.Enabled:=true;
      if qry_solic_pagto_IN_CONVERSAO.AsString = '0' then
      begin
        frm_solic_pagto.dbedt_dt_paridade.Visible:=false;
        frm_solic_pagto.dbedt_dt_paridade.Enabled:=false;
        frm_solic_pagto.dbedt_vl_paridade.Visible:=true;
        frm_solic_pagto.dbedt_vl_paridade.Enabled:=true;
        frm_solic_pagto.lb_paridade.Caption:='Valor Manual';
      end;
      if qry_solic_pagto_IN_CONVERSAO.AsString = '1' then
      begin
        frm_solic_pagto.dbedt_dt_paridade.Visible:=true;
        frm_solic_pagto.dbedt_dt_paridade.Enabled:=true;
        frm_solic_pagto.dbedt_vl_paridade.Visible:=false;
        frm_solic_pagto.dbedt_vl_paridade.Enabled:=false;
        frm_solic_pagto.lb_paridade.Caption:='Data do Tarifário';
      end;
    end
    else
    begin
      frm_solic_pagto.dbedt_dt_paridade.Enabled:=false;
      frm_solic_pagto.dbedt_vl_paridade.Enabled:=false;
      frm_solic_pagto.lb_paridade.Enabled:=false;
      frm_solic_pagto.dbradgrop_tp_convert.Enabled:=false;
    end;

  end;

end;

procedure Tdatm_solic_pagto.qry_solic_pagto_AfterEdit(DataSet: TDataSet);
begin
  frm_solic_pagto.dbgrdSolicPagto.Enabled := False;
  frm_solic_pagto.dbnvg.Enabled           := False;
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_AfterInsert(DataSet: TDataSet);
begin
  //frm_solic_pagto.dbgrdSolicPagto.Enabled := False;
  frm_solic_pagto.dbnvg.Enabled           := False;
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_AfterPost(DataSet: TDataSet);
begin
  frm_solic_pagto.dbgrdSolicPagto.Enabled := True;
  frm_solic_pagto.dbnvg.Enabled           := True;
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_AfterCancel(DataSet: TDataSet);
begin
  frm_solic_pagto.dbgrdSolicPagto.Enabled := True;
  frm_solic_pagto.dbnvg.Enabled           := True;
end;


procedure Tdatm_solic_pagto.ds_solic_pagtoDataChange(Sender: TObject;
  Field: TField);
begin
  with frm_solic_pagto do
  begin
    if (datm_solic_pagto.qry_solic_pagto_LookItemDI.AsString <> '1') or ((ProcDuPont) and (datm_solic_pagto.qry_solic_pagto_LookItemDI.AsString = '1')) then
    begin //no consiste é determinado a habilitação do valor quando tp_destino borderô
      dbedt_vl_pagto.Enabled    := True;
      dbedt_vl_pagto.Color      := clWindow;
      dbedt_vl_pagto.ReadOnly   := False;
      dbedt_vl_pagto.TabStop    := True;
    end
    else
    begin
      dbedt_vl_pagto.Enabled    := False;
      dbedt_vl_pagto.Color      := clMenu;
      dbedt_vl_pagto.ReadOnly   := True;
      dbedt_vl_pagto.TabStop    := False;
    end;
  end;
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_VL_PARIDADEChange(
  Sender: TField);
begin
  if qry_solic_pagto_IN_CONVERSAO.AsString = '0' then
    qry_solic_pagto_DT_PARIDADE.Clear;
  qry_solic_pagto_VL_PAGTO.AsFloat:= strtofloat(FORMATFLOAT('0.00',qry_solic_pagto_VL_COMPRA_EFETIVA.Asfloat * qry_solic_pagto_VL_PARIDADE.AsFloat));
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_DT_PARIDADEChange(
  Sender: TField);
begin
  if qry_solic_pagto_IN_CONVERSAO.AsString = '1' then
  begin
    With TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT VL_TAXA FROM TTAXA_FRETE WHERE CD_MOEDA = "'+qry_solic_pagto_CD_MOEDA.asString+'"');
      Sql.Add(' AND DT_INICIO = CONVERT(DATETIME, "'+qry_solic_pagto_DT_PARIDADE.AsString+'",103)');
      Open;
      qry_solic_pagto_VL_PARIDADE.Asfloat:= Fields[0].AsFloat;
      //qry_solic_pagto_VL_PAGTO.AsFloat:= qry_solic_pagto_VL_COMPRA_EFETIVA.Asfloat * Fields[0].AsFloat;
      Free;
    end;
    //qry_solic_pagto_VL_PARIDADE.Asfloat:=0;
  end;
end;

procedure Tdatm_solic_pagto.qry_solic_pagto_VL_COMPRA_EFETIVAChange(
  Sender: TField);
begin
  if qry_solic_pagto_CD_MOEDA.AsString = '790' then
    qry_solic_pagto_VL_PAGTO.AsFloat := qry_solic_pagto_VL_COMPRA_EFETIVA.AsFloat
  else
  begin
    qry_solic_pagto_DT_PARIDADEChange(nil);
    qry_solic_pagto_VL_PARIDADEChange(nil);
  end;
end;

end.
