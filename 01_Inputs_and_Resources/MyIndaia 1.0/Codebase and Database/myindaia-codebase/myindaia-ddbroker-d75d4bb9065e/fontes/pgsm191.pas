unit PGSM191;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cabecalho = class(TDataModule)
    ds_cabecalho: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_cabecalho_: TQuery;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_cabecalho_CODIGO: TStringField;
    qry_cabecalho_NOME: TStringField;
    qry_cabecalho_TEXTO: TMemoField;
    qry_ultimo_: TQuery;
    qry_ultimo_ULTIMO: TStringField;
    procedure qry_cabecalho_AfterPost(DataSet: TDataSet);
    procedure qry_cabecalho_BeforeEdit(DataSet: TDataSet);
    procedure qry_cabecalho_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    procedure VerificaEstado( Habilita : Boolean );
  public
    { Public declarations }
  end;

var
  datm_cabecalho: Tdatm_cabecalho;

implementation

uses PGSM190;

{$R *.DFM}


procedure Tdatm_cabecalho.qry_cabecalho_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
   Codigo := qry_cabecalho_CODIGO.AsString;
   qry_cabecalho_.Close;
   qry_cabecalho_.Open;
   qry_cabecalho_.Locate('CODIGO',Codigo,[]);
end;


procedure Tdatm_cabecalho.qry_cabecalho_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_cabecalho.qry_cabecalho_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;



procedure Tdatm_cabecalho.VerificaEstado( Habilita : Boolean );
begin
  frm_Cabecalho.btn_salvar.Enabled   := Habilita;
  frm_Cabecalho.btn_cancelar.Enabled := Habilita;
  frm_Cabecalho.mi_salvar.Enabled    := Habilita;
  frm_Cabecalho.mi_cancelar.Enabled  := Habilita;

  frm_Cabecalho.btn_incluir.Enabled  := not (Habilita);
  frm_Cabecalho.btn_excluir.Enabled  := not (Habilita);
  frm_Cabecalho.mi_incluir.Enabled   := not (Habilita);
  frm_Cabecalho.mi_excluir.Enabled   := not (Habilita);
end;



end.
