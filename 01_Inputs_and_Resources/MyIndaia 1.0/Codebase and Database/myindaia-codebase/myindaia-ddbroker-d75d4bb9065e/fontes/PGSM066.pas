unit PGSM066;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_contato = class(TDataModule)
    ds_cliente_contato: TDataSource;
    qry_cliente_contato_: TQuery;
    qry_cliente_contato_CD_CLIENTE: TStringField;
    qry_cliente_contato_CD_UNID_NEG: TStringField;
    qry_cliente_contato_CD_PRODUTO: TStringField;
    qry_cliente_contato_NM_CONTATO: TStringField;
    qry_cliente_contato_TX_CARGO: TStringField;
    qry_cliente_contato_TX_DEPARTAMENTO: TStringField;
    qry_cliente_contato_NR_FONE: TStringField;
    qry_cliente_contato_NR_FAX: TStringField;
    qry_cliente_contato_IN_CONTAS: TBooleanField;
    qry_cliente_contato_IN_FATURAMENTO: TBooleanField;
    qry_cliente_contato_IN_NUMERARIO: TBooleanField;
    qry_cliente_contato_IN_OPERACIONAL: TBooleanField;
    qry_cliente_contato_LookCliente: TStringField;
    qry_cliente_contato_LookUnidNeg: TStringField;
    qry_cliente_contato_LookProduto: TStringField;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_area: TDataSource;
    qry_area_: TQuery;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_cliente_contato_CD_CONTATO: TStringField;
    qry_cliente_contato_CD_AREA: TStringField;
    qry_cliente_contato_NM_EMAIL: TStringField;
    qry_cliente_contato_TP_FOLLOWUP: TStringField;
    qry_cliente_contato_IN_DOC: TBooleanField;
    qry_cliente_contato_IN_XLS: TBooleanField;
    qry_cliente_contato_IN_HTML: TBooleanField;
    qry_cliente_contato_IN_FAX: TBooleanField;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    ds_tp_follow_up: TDataSource;
    qry_tp_follow_up_: TQuery;
    qry_tp_follow_up_CD_TP_FOLLOW_UP: TStringField;
    qry_tp_follow_up_NM_TP_FOLLOW_UP: TStringField;
    qry_cliente_contato_LookArea: TStringField;
    qry_cliente_contato_LookTpFollowUp: TStringField;
    qry_ult_contato_: TQuery;
    qry_ult_contato_ULTIMO: TStringField;
    qry_cliente_contato_IN_COM_EXTERIOR: TBooleanField;
    qry_cliente_contato_IN_DRAWBACK: TBooleanField;
    qry_cliente_contato_IN_DEMURRAGE: TBooleanField;
    qry_cliente_contato_IN_EDI: TBooleanField;
    qry_cliente_contato_CD_USUARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_contato: Tdatm_cliente_contato;

implementation

{$R *.DFM}






end.
