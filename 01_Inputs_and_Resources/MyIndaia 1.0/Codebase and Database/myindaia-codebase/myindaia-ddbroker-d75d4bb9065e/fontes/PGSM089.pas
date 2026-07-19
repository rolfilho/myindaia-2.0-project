unit PGSM089;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_favor = class(TDataModule)
    ds_favor: TDataSource;
    tbl_yesno_: TTable;                                                        
    ds_yesno: TDataSource;
    qry_favor_: TQuery;
    qry_ult_favor_: TQuery;
    qry_ult_favor_ULTIMO: TStringField;
    qry_favor_CD_FAVORECIDO: TStringField;
    qry_favor_NM_FAVORECIDO: TStringField;
    qry_favor_AP_FAVORECIDO: TStringField;
    qry_favor_END_FAVORECIDO: TStringField;
    qry_favor_END_NUMERO: TStringField;
    qry_favor_END_CIDADE: TStringField;
    qry_favor_END_BAIRRO: TStringField;
    qry_favor_END_UF: TStringField;
    qry_favor_END_CEP: TStringField;
    qry_favor_NR_FONE: TStringField;
    qry_favor_NR_FAX: TStringField;
    qry_favor_NM_CONTATO: TStringField;
    qry_favor_TX_CARGO: TStringField;
    qry_favor_TX_DEPARTAMENTO: TStringField;
    qry_favor_CD_TIPO_PESSOA: TStringField;
    qry_favor_CGC_EMPRESA: TStringField;
    qry_favor_CPF_EMPRESA: TStringField;
    qry_favor_IE_EMPRESA: TStringField;
    qry_favor_DT_INCLUSAO: TDateTimeField;
    qry_favor_IN_CONTROLA_IR: TBooleanField;
    qry_favor_IN_ATIVO: TStringField;
    qry_favor_look_ativo: TStringField;
    qry_favor_look_controla_ir: TStringField;
    qry_cmd_: TQuery;
    qry_ct_contabilRM_: TQuery;
    qry_favor_CD_RECOL: TStringField;
    qry_cd_recol_ir_: TQuery;
    qry_favor_look_nm_natureza: TStringField;
    qry_tp_pessoa_: TQuery;
    qry_tp_pessoa_CD_TIPO_PESSOA: TStringField;
    qry_tp_pessoa_NM_TIPO_PESSOA: TStringField;
    qry_favor_NR_INSS: TStringField;
    qry_favor_look_tp_pessoa: TStringField;
    qry_favor_IN_TRANSP: TStringField;
    qry_favor_look_transp: TStringField;
    qry_favor_NR_BANCO: TStringField;
    qry_favor_NR_AGENCIA: TStringField;
    qry_favor_NR_CONTA: TStringField;
    qry_favor_NR_DAC: TStringField;
    qry_favor_END_COMPLEMENTO: TStringField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_favor_CD_BANCO: TStringField;
    qry_favor_LookBanco: TStringField;
    qry_favor_CD_ACESSO: TStringField;
    qry_favor_CD_AUX: TStringField;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_favor_LookCtcontabil: TStringField;
    qry_favor_LookAcesso: TStringField;
    qry_favor_LookAux: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_favor_LookCtContabilRM: TStringField;
    qry_favor_ALIQ_IRFF: TFloatField;
    qry_favor_ALIQ_INSS: TFloatField;
    qry_favor_ALIQ_PISCOFINS: TFloatField;
    qry_favor_contas: TQuery;
    dts_favor_contas: TDataSource;
    qry_favor_contasCD_FAVORECIDO: TStringField;
    qryFavorContasInc: TQuery;
    dtsFavorContasInc: TDataSource;
    qryFavorContasIncCD_FAVORECIDO: TStringField;
    qry_favor_contasLookupNM_Contabil: TStringField;
    qry_favor_NR_CONTA_CONTABIL: TStringField;
    qry_favor_TP_FAVORECIDO: TStringField;
    qry_favor_ALIQ_ISS: TFloatField;
    qry_favor_contasCODIGO: TAutoIncField;
    qry_favor_contasALIQ_IRFF: TFloatField;
    qry_favor_contasALIQ_INSS: TFloatField;
    qry_favor_contasALIQ_ISS: TFloatField;
    qry_favor_contasALIQ_PISCOFINS: TFloatField;
    qry_favor_contasCD_RATEIO: TStringField;
    qry_favor_CD_CT_CONTABIL: TStringField;
    qry_favor_contasCD_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qryFavorContasIncCD_CT_CONTABIL: TStringField;
    qry_favor_IM_EMPRESA: TStringField;
    qry_favor_CD_CT_CONTABIL_REDUZIDA_NOVO: TStringField;
    procedure qry_favor_AfterScroll(DataSet: TDataSet);
    procedure qry_favor_AfterPost(DataSet: TDataSet);
    procedure qry_favor_CD_CT_CONTABILChange(Sender: TField);
    procedure datm_favorCreate(Sender: TObject);
    procedure qry_favor_contasAfterInsert(DataSet: TDataSet);
    procedure qry_favor_contasBeforeInsert(DataSet: TDataSet);
    procedure qry_favor_contasAfterPost(DataSet: TDataSet);
    procedure qry_favor_contasAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_favor: Tdatm_favor;

implementation

{$R *.DFM}
uses PGGP001, PGGP017, GSMLIB, PGSM090;

procedure Tdatm_favor.datm_favorCreate(Sender: TObject);
begin
{  qry_param_.Close;   Rodrigo
  qry_param_.Prepare;
  qry_param_.Open;
{  if qry_param_CD_SISTEMA_CONTABIL.AsString = '0' then
    qry_favor_CD_CT_CONTABIL.EditMask := '' {RM}
{  else
    qry_favor_CD_CT_CONTABIL.EditMask := '999.99.99999;0;_'; {ContMaster/SI}
//  qry_param_.Close;
end;

procedure Tdatm_favor.qry_favor_AfterScroll(DataSet: TDataSet);
begin
  frm_Favor.dblkpcbox_controla_irExit(frm_Favor.dblkpcbox_controla_ir);
  frm_Favor.TipoPessoa;
end;

procedure Tdatm_favor.qry_favor_AfterPost(DataSet: TDataSet);
var Codigo : String;
begin
  Codigo := qry_favor_CD_FAVORECIDO.asString;
  qry_favor_.Close;
  qry_favor_.Open;
  qry_favor_.Locate('CD_FAVORECIDO',Codigo,[]);
end;

procedure Tdatm_favor.qry_favor_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_Favor.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then {ContMaster/SI}
  begin
    qry_favor_CD_ACESSO.AsString  := qry_favor_LookAcesso.AsString;
    qry_favor_CD_AUX.AsString     := qry_favor_LookAux.AsString;
  end;
end;

procedure Tdatm_favor.qry_favor_contasAfterInsert(DataSet: TDataSet);
begin
  qry_favor_contasCD_FAVORECIDO.AsString := qry_favor_CD_FAVORECIDO.AsString;  
end;

procedure Tdatm_favor.qry_favor_contasBeforeInsert(DataSet: TDataSet);
begin
  frm_Favor.Btn_Mi(False, True, True, false );
end;

procedure Tdatm_favor.qry_favor_contasAfterPost(DataSet: TDataSet);
begin
  frm_Favor.Btn_Mi(frm_Favor.st_incluir, False, False, frm_Favor.st_excluir );
end;

procedure Tdatm_favor.qry_favor_contasAfterEdit(DataSet: TDataSet);
begin
  frm_Favor.Btn_Mi( False, True, True, False );
end;

end.
