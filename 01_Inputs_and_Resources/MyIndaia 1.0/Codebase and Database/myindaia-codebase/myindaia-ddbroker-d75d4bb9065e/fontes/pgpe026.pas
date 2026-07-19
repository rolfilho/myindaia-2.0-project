unit PGPE026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_impressao = class(TDataModule)
    qry_cliente_: TQuery;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_impressao: Tdatm_pe_impressao;

implementation

{$R *.DFM}







end.
