unit PGSM052;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_transp_rod = class(TDataModule)
    ds_transp_rod: TDataSource;
    qry_transp_rod_: TQuery;
    qry_ult_transp_rod_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_ult_taxa_: TQuery;
    ds_taxa: TDataSource;
    qry_taxa_: TQuery;
    qry_transp_rod_CD_TRANSP_ROD: TStringField;
    qry_transp_rod_NM_TRANSP_ROD: TStringField;
    qry_transp_rod_AP_TRANSP_ROD: TStringField;
    qry_transp_rod_IN_ATIVO: TStringField;
    qry_transp_rod_LookTranspAtivo: TStringField;
    qry_ult_transp_rod_ULTIMO: TStringField;
    qry_taxa_CD_TRANSP_ROD: TStringField;
    qry_taxa_CD_TAXA: TStringField;
    qry_taxa_VL_CNTR_20_MD: TFloatField;
    qry_taxa_VL_CNTR_20_ME: TFloatField;
    qry_taxa_VL_CNTR_20_MD_RORO: TFloatField;
    qry_taxa_VL_CNTR_20_ME_RORO: TFloatField;
    qry_taxa_VL_CNTR_40_MD: TFloatField;
    qry_taxa_VL_CNTR_40_ME: TFloatField;
    qry_taxa_VL_CNTR_40_MD_RORO: TFloatField;
    qry_taxa_VL_CNTR_40_ME_RORO: TFloatField;
    qry_taxa_VL_C_SOLTA_MD: TFloatField;
    qry_taxa_VL_C_SOLTA_ME: TFloatField;
    qry_taxa_VL_C_SOLTA_MD_RORO: TFloatField;
    qry_taxa_VL_C_SOLTA_ME_RORO: TFloatField;
    qry_taxa_IN_ATIVO: TStringField;
    qry_ult_taxa_ULTIMO: TStringField;
    qry_taxa_LookTaxaAtivo: TStringField;
    qry_taxa_NM_TAXA: TStringField;
    qry_taxa_LookTranspRod: TStringField;
    qry_transp_rod_CNPJ_TRANSP_ROD: TStringField;
    qry_transp_rod_END_TRANSP_ROD: TStringField;
    qry_transp_rod_END_CIDADE: TStringField;
    qry_transp_rod_END_UF: TStringField;
    qry_dner_: TQuery;
    ds_dner: TDataSource;
    qry_dner_CD_TRANSP_ROD: TStringField;
    qry_dner_CD_TRANSP_ROD_DNER: TStringField;
    qry_transp_rod_IE_TRANSP_ROD: TStringField;
    qry_transp_rod_CPF_TRANSP_ROD: TStringField;
    qry_transp_rod_CD_PAIS_TRANSP: TStringField;
    qry_pais_: TQuery;
    qry_pais_CD_PAIS: TStringField;
    qry_pais_NM_PAIS: TStringField;
    qry_transp_rod_LookPais: TStringField;
    qry_transp_rod_contato: TQuery;
    ds_transp_rod_contato: TDataSource;
    qry_transp_rod_contatoCD_TRANSP_ROD: TStringField;
    qry_transp_rod_contatoCD_GRUPO: TStringField;
    qry_transp_rod_contatoCD_EMPRESA: TStringField;
    qry_empresa: TQuery;
    qry_empresaCD_EMPRESA: TStringField;
    qry_empresaNM_EMPRESA: TStringField;
    qry_grupo: TQuery;
    qry_grupoCD_GRUPO: TStringField;
    qry_grupoNM_GRUPO: TStringField;
    qry_transp_rod_contatolookGrupo: TStringField;
    qry_transp_rod_contatolookEmpresa: TStringField;
    qry_transp_rod_contatoCD_VIA_TRANSP: TStringField;
    qry_via_transp: TQuery;
    qry_via_transpCD_VIA_TRANSPORTE: TStringField;
    qry_via_transpNM_VIA_TRANSPORTE: TStringField;
    qry_transp_rod_contatolookVIA_TRANSPORTE: TStringField;
    qry_transp_rod_contatoNM_EMAIL: TMemoField;
    upd_transp_rod_contato: TUpdateSQL;
    upd_transp_rod: TUpdateSQL;
    qry_transp_rod_NM_EMAIL: TMemoField;
    qry_transp_rod_CD_TRANSP_ARMAZEM_FABRICA: TStringField;
    procedure qry_transp_rod_AfterScroll(DataSet: TDataSet);
    procedure qry_transp_rod_contatoNewRecord(DataSet: TDataSet);
    procedure qry_transp_rod_contatoAfterPost(DataSet: TDataSet);
    procedure qry_transp_rod_contatoAfterDelete(DataSet: TDataSet);
    procedure qry_transp_rod_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_transp_rod: Tdatm_transp_rod;

implementation

{$R *.DFM}


procedure Tdatm_transp_rod.qry_transp_rod_AfterScroll(DataSet: TDataSet);
begin
  with datm_transp_rod.qry_taxa_ do
  begin
    Close;
    ParamByName('CD_TRANSP_ROD').AsString := qry_transp_rod_CD_TRANSP_ROD.AsString;
    Prepare;
    Open;
  end;
end;


procedure Tdatm_transp_rod.qry_transp_rod_contatoNewRecord(
  DataSet: TDataSet);
begin
  qry_transp_rod_contatoCD_TRANSP_ROD.AsString:=qry_transp_rod_CD_TRANSP_ROD.AsString;
  qry_transp_rod_contatoCD_EMPRESA.AsString:='';
end;

procedure Tdatm_transp_rod.qry_transp_rod_contatoAfterPost(
  DataSet: TDataSet);
begin
  qry_transp_rod_contato.ApplyUpdates;
end;

procedure Tdatm_transp_rod.qry_transp_rod_contatoAfterDelete(
  DataSet: TDataSet);
begin
  qry_transp_rod_contato.ApplyUpdates;
end;

procedure Tdatm_transp_rod.qry_transp_rod_AfterPost(DataSet: TDataSet);
begin
  qry_transp_rod_.ApplyUpdates;
end;

end.
