unit PGSM094;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_conta = class(TDataModule)
    ds_conta: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    qry_conta_: TQuery;
    qry_conta_CD_CONTA: TStringField;
    qry_conta_NM_CONTA: TStringField;
    qry_conta_TP_CONTA: TStringField;
    qry_conta_CD_BANCO: TStringField;
    qry_conta_IN_ATIVO: TStringField;
    qry_conta_look_ativo: TStringField;
    qry_tp_conta_: TQuery;
    qry_tp_conta_CD_TP_CONTA: TStringField;
    qry_tp_conta_NM_TP_CONTA: TStringField;
    qry_banco_: TQuery;
    ds_banco: TDataSource;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_conta_look_banco: TStringField;
    qry_conta_CD_COLIGADA: TStringField;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    ds_coligada: TDataSource;
    qry_conta_look_coligada: TStringField;
    qry_ct_contabilRM_: TQuery;
    ds_conta_contabil: TDataSource;
    ds_tp_conta: TDataSource;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_conta_IN_BAIXA_ACERTO: TStringField;
    qry_conta_look_baixa_acerto: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_conta_CD_ACESSO: TStringField;
    qry_conta_CD_AUX: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_conta_LookAcesso: TStringField;
    qry_conta_LookAux: TStringField;
    qry_conta_CD_CT_CONTABIL: TStringField;
    qry_conta_LookCtContabil: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_conta_IN_EXIBE: TStringField;
    qry_conta_LookExibe: TStringField;
    qry_conta_LookCtContabilRM: TStringField;
    qry_conta_CD_UNID_NEG: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_conta_LookUnidNeg: TStringField;
    procedure qry_conta_AfterScroll(DataSet: TDataSet);
    procedure qry_conta_CD_CT_CONTABILChange(Sender: TField);
    procedure datm_contaCreate(Sender: TObject);
    procedure qry_conta_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_conta: Tdatm_conta;

implementation

uses GSMLIB, PGSM093;

{$R *.DFM}

procedure Tdatm_conta.datm_contaCreate(Sender: TObject);
begin
  qry_param_.Close;
  qry_param_.Prepare;
  qry_param_.Open;
  if qry_param_CD_SISTEMA_CONTABIL.AsString = '0' then
  begin
    qry_conta_CD_CT_CONTABIL.EditMask := ''; {RM}
  end
  else
  begin
    qry_conta_CD_CT_CONTABIL.EditMask := '999.99.99999;0;_'; {ContMaster/SI}
  end;
  qry_param_.Close;
end;

procedure Tdatm_conta.qry_conta_AfterScroll(DataSet: TDataSet);
begin
  with frm_conta do
  begin
    if qry_conta_TP_CONTA.AsString = '3' then
    begin
      lbl_in_baixa_acerto.Visible       := True;
      dblkpcbox_in_baixa_acerto.Visible := True;
    end
    else
    begin
      lbl_in_baixa_acerto.Visible       := False;
      dblkpcbox_in_baixa_acerto.Visible := False;
    end;

    if qry_conta_TP_CONTA.AsString = '2' then
    begin
      dbedt_cd_banco.Enabled := True;
      dbedt_cd_banco.Color   := clWindow;
      dbedt_cd_banco.TabStop := True;
      btn_co_banco.Enabled   := True;
    end
    else
    begin
      dbedt_cd_banco.Enabled := False;
      dbedt_cd_banco.Color   := clMenu;
      dbedt_cd_banco.TabStop := False;
      btn_co_banco.Enabled   := False;
      dbedt_cd_banco.Text    := '';
      dbedt_nm_banco.Text    := '';
    end;

    if ( qry_conta_TP_CONTA.AsString = '2' ) or
       ( qry_conta_TP_CONTA.AsString = '1' ) then
    begin
      dbedt_cd_ct_contabil.Enabled := True;
      dbedt_cd_ct_contabil.Color   := clWindow;
      dbedt_cd_ct_contabil.TabStop := True;
      btn_co_ct_contabil.Enabled   := True;
    end
    else
    begin
      dbedt_cd_ct_contabil.Enabled := False;
      dbedt_cd_ct_contabil.Color   := clMenu;
      dbedt_cd_ct_contabil.TabStop := False;
      btn_co_ct_contabil.Enabled   := False;
      dbedt_cd_ct_contabil.Text    := '';
    end;
  end;
end;

procedure Tdatm_conta.qry_conta_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_conta.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then {ContMaster/SI}
  begin
    qry_conta_CD_ACESSO.AsString  := qry_conta_LookAcesso.AsString;
    qry_conta_CD_AUX.AsString     := qry_conta_LookAux.AsString;
  end;
end;

procedure Tdatm_conta.qry_conta_CalcFields(DataSet: TDataSet);
begin
  qry_conta_LookUnidNeg.AsString := Lookup( qry_unid_neg_, qry_conta_CD_UNID_NEG, 'CD_UNID_NEG', 'NM_UNID_NEG' );
end;

end.
