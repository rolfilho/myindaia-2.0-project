unit PGSM150;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_disp_legal = class(TDataModule)
    qry_disp_legal_: TQuery;
    ds_disp_legal: TDataSource;
    qry_trat_tribut_: TQuery;
    qry_trat_tribut_CD_TRAT_TRIB_ICMS: TStringField;
    qry_trat_tribut_NM_TRAT_TRIB_ICMS: TStringField;
    qry_disp_legal_CD_EX: TStringField;
    qry_disp_legal_NM_EX: TStringField;
    qry_disp_legal_CD_TRIB: TStringField;
    ds_trat_tribut: TDataSource;
    qry_ult_disp_legal_: TQuery;
    qry_ult_disp_legal_ULTIMO: TStringField;
    qry_disp_legal_LookupTributo: TStringField;
    qry_disp_legal_NM_FUND_LEGAL: TStringField;
    procedure qry_disp_legal_BeforeEdit(DataSet: TDataSet);
    procedure qry_disp_legal_BeforeInsert(DataSet: TDataSet);
  private
    procedure Verifica_Estado( habilita : boolean );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_disp_legal: Tdatm_disp_legal;

implementation
  Uses pgsm149;

{$R *.DFM}

procedure Tdatm_disp_legal.qry_disp_legal_BeforeEdit(DataSet: TDataSet);
begin
  Verifica_Estado( True );
end;

procedure Tdatm_disp_legal.qry_disp_legal_BeforeInsert(DataSet: TDataSet);
begin
  Verifica_Estado( True );
end;

procedure Tdatm_disp_legal.Verifica_Estado( habilita : Boolean );
begin
  frm_disp_legal.btn_incluir.Enabled  := not habilita;
  frm_disp_legal.mi_incluir.Enabled   := not habilita;
  frm_disp_legal.btn_salvar.Enabled   := habilita;
  frm_disp_legal.mi_salvar.Enabled    := habilita;
  frm_disp_legal.btn_cancelar.Enabled := habilita;
  frm_disp_legal.mi_cancelar.Enabled  := habilita;
  frm_disp_legal.btn_excluir.Enabled  := not habilita;
  frm_disp_legal.mi_excluir.Enabled   := not habilita;
  frm_disp_legal.btn_sair.Enabled     := habilita;
end;



end.
