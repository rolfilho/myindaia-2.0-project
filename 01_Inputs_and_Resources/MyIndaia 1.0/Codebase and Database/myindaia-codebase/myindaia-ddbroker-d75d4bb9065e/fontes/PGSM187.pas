unit PGSM187;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_acordo = class(TDataModule)
    ds_acordo: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_acordo_: TQuery;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_acordo_CODIGO: TStringField;
    qry_acordo_NOME: TStringField;
    qry_acordo_IN_ATIVO: TStringField;
    qry_acordo_LookAtivo: TStringField;
    ds_normas: TDataSource;
    qry_normas_: TQuery;
    qry_normas_CODIGO: TStringField;
    qry_normas_NOME: TStringField;
    qry_acordo_norma_: TQuery;
    ds_acordo_norma: TDataSource;
    qry_normas_NM_DESCRICAO: TStringField;
    qry_pais_: TQuery;
    ds_pais: TDataSource;
    qry_acordo_pais_: TQuery;
    ds_acordo_pais: TDataSource;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_acordo_pais_CD_ACORDO: TStringField;
    qry_acordo_pais_CD_PAIS: TStringField;
    qry_acordo_pais_LookNmPais: TStringField;
    qry_acordo_norma_CD_ACORDO: TStringField;
    qry_acordo_norma_CD_NORMA: TStringField;
    qry_acordo_norma_LookNmDescricao: TStringField;
    qry_apaga_pais_: TQuery;
    qry_apaga_norma_: TQuery;
    qry_acordo_norma_LookPais: TStringField;
    qry_normas_CD_PAIS: TStringField;
    qry_acordo_FIESP_ID: TIntegerField;
    qryClassificacao: TQuery;
    dsClassificacao: TDataSource;
    qry_acordo_pais_SIGLA: TStringField;
    procedure qry_acordo_AfterPost(DataSet: TDataSet);
    procedure qry_acordo_BeforeEdit(DataSet: TDataSet);
    procedure qry_acordo_BeforeInsert(DataSet: TDataSet);
    procedure qry_acordo_norma_BeforeEdit(DataSet: TDataSet);
    procedure qry_acordo_norma_BeforeInsert(DataSet: TDataSet);
    procedure qry_acordo_pais_BeforeEdit(DataSet: TDataSet);
    procedure qry_acordo_pais_BeforeInsert(DataSet: TDataSet);
    procedure qry_acordo_norma_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure VerificaEstado( Habilita : Boolean );
  public
    { Public declarations }
  end;

var
  datm_acordo: Tdatm_acordo;

implementation

uses pgsm186;

{$R *.DFM}


procedure Tdatm_acordo.qry_acordo_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
   Codigo := qry_acordo_CODIGO.asString;
   qry_acordo_.Close;
   qry_acordo_.Open;
   qry_acordo_.Locate('CODIGO',Codigo,[]);
end;


procedure Tdatm_acordo.qry_acordo_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;

procedure Tdatm_acordo.qry_acordo_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;



procedure Tdatm_acordo.VerificaEstado( Habilita : Boolean );
begin
  frm_Acordo.btn_salvar.Enabled   := Habilita;
  frm_Acordo.btn_cancelar.Enabled := Habilita;
  frm_Acordo.mi_salvar.Enabled    := Habilita;
  frm_Acordo.mi_cancelar.Enabled  := Habilita;

  //frm_Acordo.btn_incluir.Enabled  := not (Habilita);
  //frm_Acordo.btn_excluir.Enabled  := not (Habilita);
  //frm_Acordo.mi_incluir.Enabled   := not (Habilita);
  //frm_Acordo.mi_excluir.Enabled   := not (Habilita);
end;






procedure Tdatm_acordo.qry_acordo_norma_BeforeEdit(DataSet: TDataSet);
begin
  frm_acordo.btn_incluir.Enabled  := False;
  frm_acordo.btn_salvar.Enabled   := True;
  frm_acordo.btn_cancelar.Enabled := True;
  frm_acordo.btn_excluir.Enabled  := False;

  frm_acordo.mi_incluir.Enabled   := False;
  frm_acordo.mi_salvar.Enabled    := True;
  frm_acordo.mi_cancelar.Enabled  := True;
  frm_acordo.mi_excluir.Enabled   := False;

end;

procedure Tdatm_acordo.qry_acordo_norma_BeforeInsert(DataSet: TDataSet);
begin
  frm_acordo.btn_incluir.Enabled  := False;
  frm_acordo.btn_salvar.Enabled   := True;
  frm_acordo.btn_cancelar.Enabled := True;
  frm_acordo.btn_excluir.Enabled  := False;

  frm_acordo.mi_incluir.Enabled   := False;
  frm_acordo.mi_salvar.Enabled    := True;
  frm_acordo.mi_cancelar.Enabled  := True;
  frm_acordo.mi_excluir.Enabled   := False;
end;

procedure Tdatm_acordo.qry_acordo_pais_BeforeEdit(DataSet: TDataSet);
begin
  frm_acordo.btn_incluir.Enabled  := False;
  frm_acordo.btn_salvar.Enabled   := True;
  frm_acordo.btn_cancelar.Enabled := True;
  frm_acordo.btn_excluir.Enabled  := False;

  frm_acordo.mi_incluir.Enabled   := False;
  frm_acordo.mi_salvar.Enabled    := True;
  frm_acordo.mi_cancelar.Enabled  := True;
  frm_acordo.mi_excluir.Enabled   := False;
end;

procedure Tdatm_acordo.qry_acordo_pais_BeforeInsert(DataSet: TDataSet);
begin
  frm_acordo.btn_incluir.Enabled  := False;
  frm_acordo.btn_salvar.Enabled   := True;
  frm_acordo.btn_cancelar.Enabled := True;
  frm_acordo.btn_excluir.Enabled  := False;

  frm_acordo.mi_incluir.Enabled   := False;
  frm_acordo.mi_salvar.Enabled    := True;
  frm_acordo.mi_cancelar.Enabled  := True;
  frm_acordo.mi_excluir.Enabled   := False;

end;


procedure Tdatm_acordo.qry_acordo_norma_CalcFields(DataSet: TDataSet);
var cd_pais : String;
begin
  qry_normas_.Locate( 'CODIGO', qry_acordo_norma_CD_NORMA.AsString, [] );
  cd_pais := qry_normas_CD_PAIS.AsString;

  qry_pais_.Locate( 'CODIGO', cd_pais, [] );
  qry_acordo_norma_LookPais.AsString := qry_pais_.FieldByName('DESCRICAO').AsString;
end;

end.
