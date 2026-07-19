(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGSM042.PAS - Data Module - Cadastro de Contas Bancárias - datm_banco
Manutenção:
DATA:
*************************************************************************************************)
unit PGSM042;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_banco = class(TDataModule)
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_ult_banco_: TQuery;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_banco_LookAtivo: TStringField;
    qry_ult_banco_ULTIMO: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_DAC_AGENCIA: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_banco_LookCtContabil: TStringField;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_banco_LookAcesso: TStringField;
    qry_banco_LookAux: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_banco_NR_CHEQUE: TStringField;
    qry_bco_: TQuery;
    qry_bco_CD_BCO: TStringField;
    qry_bco_NM_BCO: TStringField;
    qry_banco_LookNmBco: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_banco_LookCtContabilRM: TStringField;
    qry_banco_PATH_COB_AUT_TRANS: TStringField;
    qry_banco_PATH_COB_AUT_IMP: TStringField;
    qry_banco_TX_INSTRUCAO: TStringField;
    qry_banco_NR_REMESSA: TStringField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    qry_banco_NR_DOC: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_IN_SM: TStringField;
    qry_banco_IN_EXTRA_CAIXA: TStringField;
    qry_banco_IN_IMPOSTOS: TStringField;
    qry_banco_IN_BCO_FLUXO_OP: TStringField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_banco_CD_CC_REDUZIDA: TStringField;
    qry_banco_IN_INDAIA: TIntegerField;
    procedure qry_banco_CD_CT_CONTABILChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_banco: Tdatm_banco;

implementation

uses PGSM041;
{$R *.DFM}

procedure Tdatm_banco.qry_banco_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_banco.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then // ContMaster/SI
  begin
    qry_banco_CD_ACESSO.AsString := qry_banco_LookAcesso.AsString;
    qry_banco_CD_AUX.AsString    := qry_banco_LookAux.AsString;
  end;
end;



end.
