unit PGNM017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_numerario = class(TDataModule)
    ds_tp_solic_inform: TDataSource;
    tbl_tp_solic_inform_: TTable;
    dsq_item_cd: TDataSource;
    qry_item_cd: TQuery;
    qry_item_cdCD_ITEM: TStringField;
    qry_item_cdNM_ITEM: TStringField;
    qry_item_cdCD_TIPO_ITEM: TStringField;
    qry_item_cdCD_TIPO_LANC_FAT: TStringField;
    dsq_item_nm: TDataSource;
    qry_item_nm: TQuery;
    qry_item_nmCD_ITEM: TStringField;
    qry_item_nmNM_ITEM: TStringField;
    qry_item_nmCD_TIPO_ITEM: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    dsq_itens_solinum: TDataSource;
    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_NR_PRIORIDADE: TIntegerField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    qry_itens_solinum_status: TStringField;
    qry_itens_solinum_Look_nm_item: TStringField;
    dsq_solinum: TDataSource;
    qry_solinum_: TQuery;
    qry_solinum_NR_PROCESSO: TStringField;
    qry_solinum_NR_SOLICITACAO: TStringField;
    qry_solinum_DT_SOLICITACAO: TDateTimeField;
    qry_solinum_CD_USUARIO: TStringField;
    qry_solinum_CD_STATUS: TStringField;
    qry_solinum_VL_SOLICITADO: TFloatField;
    qry_solinum_VL_RECEBIDO: TFloatField;
    qry_solinum_QT_ITENS_SOLIC: TIntegerField;
    qry_solinum_Look_ap_usuario2: TStringField;
    qry_solinum_Status: TStringField;
    ds_usuario: TDataSource;
    tbl_usuario_: TTable;
    tbl_usuario_CD_USUARIO: TStringField;
    tbl_usuario_AP_USUARIO: TStringField;
    tbl_usuario_NM_USUARIO: TStringField;
    tbl_usuario_CD_SENHA: TStringField;
    tbl_usuario_CD_CARGO: TStringField;
    tbl_usuario_IN_ATIVO: TStringField;
    sp_soma_solinum_: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    sp_cancela_solicitacao_: TStoredProc;
    StringField7: TStringField;
    StringField8: TStringField;
    qry_itens_solinum_CD_BANCO: TStringField;
    qry_item_cdCOLUMN4: TIntegerField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    ds_banco: TDataSource;
    qry_itens_solinum_look_banco: TStringField;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_processo: TQuery;
    ds_usuario_habilitacao: TDataSource;
    procedure qry_itens_solinum_CalcFields(DataSet: TDataSet);
    procedure qry_solinum_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_numerario: Tdatm_numerario;

implementation

{$R *.DFM}










procedure Tdatm_numerario.qry_itens_solinum_CalcFields(DataSet: TDataSet);
begin
  //*If qry_itens_solinum_TP_SOLIC_INFORM.AsString = '2' Then
  //*  qry_itens_solinum_status.AsString := 'Informado'
  //*else
    If qry_itens_solinum_CD_STATUS.AsString = 'B' Then
      begin
        qry_itens_solinum_status.AsString := 'Baixado';
      end
    else
      If qry_itens_solinum_CD_STATUS.AsString = 'C' Then
        begin
          qry_itens_solinum_status.AsString := 'Cancelado';
        end
      else
        If qry_itens_solinum_VL_RECEBIDO.AsFloat = 0 Then
          begin
            qry_itens_solinum_status.AsString := 'Em Aberto';
          end
        else
          If qry_itens_solinum_VL_SOLICITADO.AsFloat > qry_itens_solinum_VL_RECEBIDO.AsFloat Then
          begin
            qry_itens_solinum_status.AsString := 'Receb.Parcial';
          end;
end;


procedure Tdatm_numerario.qry_solinum_CalcFields(DataSet: TDataSet);
begin
  If qry_solinum_CD_STATUS.AsString = 'A' then
     qry_solinum_Status.AsString := 'Em Aberto';
  If qry_solinum_CD_STATUS.AsString  = 'B' then
     qry_solinum_Status.AsString := 'Baixada';
  If qry_solinum_CD_STATUS.AsString  = 'C' then
     qry_solinum_Status.AsString := 'Cancelada';
end;





end.
