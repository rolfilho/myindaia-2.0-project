unit PGSM193;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_local_emissao = class(TDataModule)
    ds_local_emis: TDataSource;
    qry_local_emis_: TQuery;
    qry_pais_: TQuery;
    qry_local_emis_CODIGO: TStringField;
    qry_local_emis_NOME: TStringField;
    qry_local_emis_ESTADO: TStringField;
    qry_local_emis_PAIS: TStringField;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_local_emis_LookPais: TStringField;
    procedure qry_local_emis_AfterPost(DataSet: TDataSet);
    procedure qry_local_emis_BeforeEdit(DataSet: TDataSet);
    procedure qry_local_emis_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    procedure VerificaEstado( Habilita : Boolean );
  public
    { Public declarations }
  end;

var
  datm_local_emissao: Tdatm_local_emissao;

implementation

uses pgsm192;

{$R *.DFM}


procedure Tdatm_local_emissao.qry_local_emis_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
   Codigo := qry_local_emis_CODIGO.AsString;
   qry_local_emis_.Close;
   qry_local_emis_.Open;
   qry_local_emis_.Locate('CODIGO',Codigo,[]);
end;


procedure Tdatm_local_emissao.qry_local_emis_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;

procedure Tdatm_local_emissao.qry_local_emis_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );

end;



procedure Tdatm_local_emissao.VerificaEstado( Habilita : Boolean );
begin
  frm_local_emissao.btn_salvar.Enabled   := Habilita;
  frm_local_emissao.btn_cancelar.Enabled := Habilita;
  frm_local_emissao.mi_salvar.Enabled    := Habilita;
  frm_local_emissao.mi_cancelar.Enabled  := Habilita;

  frm_local_emissao.btn_incluir.Enabled  := not (Habilita);
  frm_local_emissao.btn_excluir.Enabled  := not (Habilita);
  frm_local_emissao.mi_incluir.Enabled   := not (Habilita);
  frm_local_emissao.mi_excluir.Enabled   := not (Habilita);
end;



end.
