unit PGSM183;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_termo_pagto = class(TDataModule)
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_termo_pagto_: TQuery;
    ds_termo_pagto: TDataSource;
    qry_termo_pagto_CD_TERMO_PAGTO: TStringField;
    qry_termo_pagto_NM_TERMO_PAGTO: TStringField;
    qry_termo_pagto_CD_EXPORTADOR: TStringField;
    qry_termo_pagto_NR_PERIODICIDADE: TIntegerField;
    qry_termo_pagto_TP_INDICADOR: TStringField;
    qry_termo_pagto_NR_PARCELAS: TIntegerField;
    qry_termo_pagto_CD_MODALIDADE_TRANS: TStringField;
    qry_termo_pagto_CD_ENQUAD_OP: TStringField;
    qry_termo_pagto_TX_TERMO_PORT: TMemoField;
    qry_termo_pagto_TX_TERMO_INGLES: TMemoField;
    qry_termo_pagto_TX_TERMO_ESP: TMemoField;
    qry_termo_pagto_IN_ATIVO: TStringField;
    qry_termo_pagto_LookAtivo: TStringField;
    ds_emp_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    ds_modalidade_trans: TDataSource;
    qry_modalidade_trans_: TQuery;
    qry_modalidade_trans_CD_MODALIDADE_TRANS: TStringField;
    qry_modalidade_trans_NM_MODALIDADE_TRANS: TStringField;
    ds_enquad_op: TDataSource;
    qry_enquad_op_: TQuery;
    qry_enquad_op_CD_ENQUAD_OP: TStringField;
    qry_enquad_op_NM_ENQUAD_OP: TStringField;
    ds_tp_indicador_periodo: TDataSource;
    qry_tp_indicador_periodo_: TQuery;
    qry_tp_indicador_periodo_TP_INDICADOR: TStringField;
    qry_tp_indicador_periodo_NM_INDICADOR: TStringField;
    qry_termo_pagto_LookExportador: TStringField;
    qry_termo_pagto_LookIndicadorPeriodo: TStringField;
    qry_termo_pagto_LookModalidadeTrans: TStringField;
    qry_termo_pagto_LookEnquadOp: TStringField;
    qry_ult_termo_pagto_: TQuery;
    qry_ult_termo_pagto_ULTIMO: TStringField;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_termo_pagto: Tdatm_termo_pagto;

implementation

uses PGGP017;

{$R *.DFM}







end.
