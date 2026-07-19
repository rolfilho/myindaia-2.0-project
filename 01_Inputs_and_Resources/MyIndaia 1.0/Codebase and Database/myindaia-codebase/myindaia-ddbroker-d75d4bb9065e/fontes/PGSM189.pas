unit PGSM189;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_normas = class(TDataModule)
    ds_normas: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_normas_: TQuery;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_normas_CODIGO: TStringField;
    qry_normas_NOME: TStringField;
    qry_normas_IN_ATIVO: TStringField;
    qry_normas_LookAtivo: TStringField;
    qry_normas_NM_DESCRICAO: TStringField;
    qry_normas_CD_PAIS: TStringField;
    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_normas_LookPais: TStringField;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_CODIGO: TStringField;
    qry_lista_NOME: TStringField;
    qry_lista_IN_ATIVO: TStringField;
    qry_lista_CD_PAIS: TStringField;
    qry_lista_LookAtivo: TStringField;
    qry_lista_LookPais: TStringField;
    procedure qry_normas_AfterPost(DataSet: TDataSet);
    procedure qry_normas_BeforeEdit(DataSet: TDataSet);
    procedure qry_normas_BeforeInsert(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure VerificaEstado( Habilita : Boolean );
  public
    { Public declarations }
  end;

var
  datm_normas: Tdatm_normas;

implementation

uses pgsm188;

{$R *.DFM}


procedure Tdatm_normas.qry_normas_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
   Codigo := qry_normas_CODIGO.AsString;
   qry_normas_.Close;
   qry_normas_.Open;
   qry_normas_.Locate('CODIGO',Codigo,[]);
end;

procedure Tdatm_normas.qry_normas_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;

procedure Tdatm_normas.qry_normas_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;

procedure Tdatm_normas.VerificaEstado( Habilita : Boolean );
begin
  frm_Normas.btn_salvar.Enabled   := Habilita;
  frm_Normas.btn_cancelar.Enabled := Habilita;
  frm_Normas.mi_salvar.Enabled    := Habilita;
  frm_Normas.mi_cancelar.Enabled  := Habilita;

  frm_Normas.btn_incluir.Enabled  := not (Habilita);
  frm_Normas.btn_excluir.Enabled  := not (Habilita);
  frm_Normas.mi_incluir.Enabled   := not (Habilita);
  frm_Normas.mi_excluir.Enabled   := not (Habilita);
end;

procedure Tdatm_normas.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_normas_.Close;
  qry_normas_.ParamByName('CD_NORMA').AsString := qry_lista_CODIGO.AsString;
  qry_normas_.Prepare;
  qry_normas_.Open;
end;

end.
