unit PGSM154;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_arm_rec = class(TDataModule)
    qry_arm_rec_per_: TQuery;
    ds_arm_rec_per: TDataSource;
    qry_arm_rec_: TQuery;
    ds_arm_rec: TDataSource;
    qry_arm_rec_per_CD_RECINTO: TStringField;
    qry_arm_rec_CD_RECINTO: TStringField;
    qry_arm_rec_QT_DIAS: TStringField;
    qry_arm_rec_IN_FERIADO: TStringField;
    qry_arm_rec_IN_SABDOM: TStringField;
    qry_recinto_: TQuery;
    qry_recinto_DESCRICAO: TStringField;
    qry_recinto_CODIGO: TStringField;
    qry_arm_rec_CalcNmRecinto: TStringField;
    qry_arm_rec_per_NR_PERCENT: TFloatField;
    qry_arm_rec_per_NR_PERIODO: TIntegerField;
    qry_arm_rec_per_QT_DIAS: TIntegerField;
    procedure qry_arm_rec_BeforeEdit(DataSet: TDataSet);
    procedure qry_arm_rec_BeforeInsert(DataSet: TDataSet);
    procedure qry_arm_rec_per_BeforeEdit(DataSet: TDataSet);
    procedure qry_arm_rec_per_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_arm_rec: Tdatm_arm_rec;

implementation

uses PGSM153;

{$R *.DFM}


procedure Tdatm_arm_rec.qry_arm_rec_BeforeEdit(DataSet: TDataSet);
begin
  frm_arm_rec.btn_salvar.Enabled   := True;
  frm_arm_rec.btn_cancelar.Enabled := True;

  frm_arm_rec.btn_incluir.Enabled := False;
  frm_arm_rec.btn_excluir.Enabled := False;
end;

procedure Tdatm_arm_rec.qry_arm_rec_BeforeInsert(DataSet: TDataSet);
begin
  frm_arm_rec.btn_salvar.Enabled   := True;
  frm_arm_rec.btn_cancelar.Enabled := True;

  frm_arm_rec.btn_incluir.Enabled := False;
  frm_arm_rec.btn_excluir.Enabled := False;
end;

procedure Tdatm_arm_rec.qry_arm_rec_per_BeforeEdit(DataSet: TDataSet);
begin
  frm_arm_rec.btn_salvar.Enabled   := True;
  frm_arm_rec.btn_cancelar.Enabled := True;

  frm_arm_rec.btn_incluir.Enabled := False;
  frm_arm_rec.btn_excluir.Enabled := False;
end;

procedure Tdatm_arm_rec.qry_arm_rec_per_BeforeInsert(DataSet: TDataSet);
begin
  frm_arm_rec.btn_salvar.Enabled   := True;
  frm_arm_rec.btn_cancelar.Enabled := True;

  frm_arm_rec.btn_incluir.Enabled := False;
  frm_arm_rec.btn_excluir.Enabled := False;
end;

end.
