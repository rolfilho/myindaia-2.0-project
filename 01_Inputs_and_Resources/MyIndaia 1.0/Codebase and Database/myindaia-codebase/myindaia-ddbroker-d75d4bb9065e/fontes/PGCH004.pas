unit PGCH004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_liberacao = class(TDataModule)
    qry_itens_solic_: TQuery;
    qry_itens_solic_DT_SOLIC_CH: TStringField;
    qry_itens_solic_NR_SOLIC_CH: TStringField;
    qry_itens_solic_NR_LANCAMENTO: TStringField;
    qry_itens_solic_NR_PROCESSO: TStringField;
    qry_itens_solic_CD_CLIENTE: TStringField;
    qry_itens_solic_CD_ITEM: TStringField;
    qry_itens_solic_VL_ITEM: TFloatField;
    qry_itens_solic_VL_IR: TFloatField;
    qry_itens_solic_VL_ASSIST: TFloatField;
    qry_itens_solic_CD_STATUS: TStringField;
    qry_itens_solic_CD_DESPACHANTE: TStringField;
    qry_itens_solic_LookStatusItemSolicCheque: TStringField;
    qry_itens_solic_LookItem: TStringField;
    qry_itens_solic_CalcProcesso: TStringField;
    ds_itens_solic: TDataSource;
    ds_solicitado: TDataSource;
    qry_solicitado_: TQuery;
    qry_solicitado_DT_SOLICITACAO: TDateTimeField;
    qry_solicitado_VL_SOLICITADO: TFloatField;
    ds_recebimento: TDataSource;
    qry_recebimento_: TQuery;
    qry_recebimento_DT_RECEBIMENTO: TDateTimeField;
    qry_recebimento_VL_RECEBIDO: TFloatField;
    ds_utilizado: TDataSource;
    qry_utilizado_: TQuery;
    ds_totaliza: TDataSource;
    qry_totaliza_: TQuery;
    qry_totaliza_VL_SOLICITADO: TFloatField;
    qry_totaliza_VL_RECEBIDO: TFloatField;
    qry_totaliza_VL_UTILIZADO: TFloatField;
    qry_totaliza_VL_SALDO_ITEM: TFloatField;
    qry_totaliza_VL_SALDO_PROCESSO: TFloatField;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_itens_solic_LookCliente: TStringField;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_status_item_solic_ch: TDataSource;
    tbl_status_item_solic_ch_: TTable;
    tbl_status_item_solic_ch_CODIGO: TStringField;
    tbl_status_item_solic_ch_DESCRICAO: TStringField;
    ds_banco: TDataSource;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    tbl_status_solic_ch_: TTable;
    tbl_status_solic_ch_CODIGO: TStringField;
    tbl_status_solic_ch_DESCRICAO: TStringField;
    ds_status_solic_ch: TDataSource;
    ds_solic: TDataSource;
    qry_solic_: TQuery;
    qry_solic_NR_SOLIC_CH: TStringField;
    qry_solic_CD_FAVORECIDO: TStringField;
    qry_solic_CD_BANCO: TStringField;
    qry_solic_VL_SOLIC_CH: TFloatField;
    qry_solic_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_LookFavorecido: TStringField;
    qry_solic_LookBanco: TStringField;
    qry_solic_LookStSolicCheque: TStringField;
    qry_solic_HM_SOLIC_CH: TStringField;
    qry_utilizado_DT_SOLIC_CH: TStringField;
    qry_solic_ch_: TQuery;
    qry_solic_DT_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_utilizado_VALOR: TFloatField;
    sp_proc_item_solic_ch: TStoredProc;
    StringField13: TStringField;
    StringField14: TStringField;
    sp_liberar_solic_ch: TStoredProc;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_solic_CD_USUARIO: TStringField;
    qry_solic_Look_Solicitante: TStringField;
    qry_itens_solic_VL_DESPESA: TFloatField;
    qry_totaliza_VL_DIFERENCA: TFloatField;
    qry_itens_solic_IN_RESTITUI: TStringField;
    procedure qry_itens_solic_CalcFields(DataSet: TDataSet);
    procedure qry_solic_AfterScroll(DataSet: TDataSet);
    procedure qry_itens_solic_AfterScroll(DataSet: TDataSet);
    procedure qry_totaliza_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_liberacao: Tdatm_liberacao;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, PGCH005;


procedure Tdatm_liberacao.qry_itens_solic_CalcFields(
  DataSet: TDataSet);
begin
  qry_itens_solic_CalcProcesso.AsString := Copy(qry_itens_solic_NR_PROCESSO.AsString, 5, 14);
  qry_itens_solic_VL_DESPESA.AsFloat    := qry_itens_solic_VL_ITEM.AsFloat + qry_itens_solic_VL_ASSIST.AsFloat;
  if qry_itens_solic_IN_RESTITUI.AsString = '1' then
     qry_itens_solic_VL_DESPESA.AsFloat := ( ( qry_itens_solic_VL_DESPESA.AsFloat ) * (-1) );
end;

procedure Tdatm_liberacao.qry_solic_AfterScroll(DataSet: TDataSet);
begin
  if frm_liberacao.lPesquisa then
  begin
    qry_itens_solic_.Close;
    qry_itens_solic_.SQL[9] := '( ( CD_STATUS = "4" ) OR ( CD_STATUS = "5" ) OR ' +
       '( CD_STATUS = "6" ) OR ( CD_STATUS = "7" ) OR ( CD_STATUS = "8" )OR ' +
       '( CD_STATUS = "9" ))';
    qry_itens_solic_.ParamByName('dt_solic_ch').AsString :=
       FormatDateTime('dd/mm/yyyy', dt_server );
    qry_itens_solic_.ParamByName('nr_solic_ch').AsString := qry_solic_NR_SOLIC_CH.AsString;
    qry_itens_solic_.Prepare;
    qry_itens_solic_.Open;
    frm_liberacao.AtualizaGeral;
  end;
end;

procedure Tdatm_liberacao.qry_itens_solic_AfterScroll(DataSet: TDataSet);
begin
  if qry_itens_solic_.RecordCount > 0 then
  begin
    if qry_itens_solic_CD_STATUS.AsString <> '' then
    begin
      case qry_itens_solic_CD_STATUS.AsInteger of
        1, 2, 3: begin
                    frm_liberacao.btn_liberar.Enabled     := True;
                    frm_liberacao.btn_nao_liberar.Enabled := True;
                 end
      else
        begin
          frm_liberacao.btn_liberar.Enabled     := False;
          frm_liberacao.btn_nao_liberar.Enabled := False;
        end
      end;
    end;
  end;
end;

procedure Tdatm_liberacao.qry_totaliza_CalcFields(DataSet: TDataSet);
begin
  qry_totaliza_VL_DIFERENCA.AsCurrency := qry_itens_solic_VL_DESPESA.AsCurrency - qry_totaliza_VL_SALDO_ITEM.AsCurrency;
end;

end.
