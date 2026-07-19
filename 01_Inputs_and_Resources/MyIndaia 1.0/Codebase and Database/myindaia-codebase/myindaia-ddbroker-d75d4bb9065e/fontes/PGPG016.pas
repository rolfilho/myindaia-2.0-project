unit PGPG016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pesq_pagto = class(TDataModule)
    qry_pesq_: TQuery;
    ds_pesq: TDataSource;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    ds_produto: TDataSource;
    qry_favorecido_: TQuery;
    ds_favorecido: TDataSource;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_item_: TQuery;
    ds_item: TDataSource;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_status_solic_pagto_: TQuery;
    ds_status_solic_pagto: TDataSource;
    qry_status_solic_pagto_CODIGO: TStringField;
    qry_status_solic_pagto_DESCRICAO: TStringField;
    qry_tp_destino_: TQuery;
    ds_tp_destino: TDataSource;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;
    qry_usuario_: TQuery;
    ds_usuario: TDataSource;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_look_nm_unid_neg: TStringField;
    qry_usuario_habilitacao_look_nm_produto: TStringField;
    ds_usuario_habilitacao_: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_pesq_NR_PROCESSO: TStringField;
    qry_pesq_CD_ITEM: TStringField;
    qry_pesq_CD_USUARIO_SOLIC: TStringField;
    qry_pesq_NM_UNID_NEG: TStringField;
    qry_pesq_NM_PRODUTO: TStringField;
    qry_pesq_CD_FAVORECIDO: TStringField;
    qry_pesq_TP_DESTINO: TStringField;
    qry_pesq_CD_STATUS: TStringField;
    qry_pesq_VL_PAGTO: TFloatField;
    qry_pesq_NR_DOCTO: TStringField;
    qry_pesq_DT_PAGTO: TDateTimeField;
    qry_pesq_CalcNrProcesso: TStringField;
    qry_pesq_LookItem: TStringField;
    qry_pesq_LookUsuarioSolic: TStringField;
    qry_pesq_LookFavorecido: TStringField;
    qry_pesq_LookStatus: TStringField;
    qry_pesq_LookTpDestino: TStringField;
    qry_calculo_: TQuery;
    ds_calculo: TDataSource;
    qry_calculo_CD_CALCULO: TStringField;
    qry_calculo_NM_CALCULO: TStringField;
    qry_pesq_CD_CALCULO: TStringField;
    qry_pesq_LookCalculo: TStringField;
    qry_pesq_CD_UNID_NEG: TStringField;
    qry_pesq_CD_PRODUTO: TStringField;
    procedure qry_pesq_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_pagto: Tdatm_pesq_pagto;

implementation

{$R *.DFM}

procedure Tdatm_pesq_pagto.qry_pesq_CalcFields(DataSet: TDataSet);
begin
  qry_pesq_CalcNrProcesso.AsString := Copy( qry_pesq_NR_PROCESSO.AsString, 5, 14 );
end;


end.
