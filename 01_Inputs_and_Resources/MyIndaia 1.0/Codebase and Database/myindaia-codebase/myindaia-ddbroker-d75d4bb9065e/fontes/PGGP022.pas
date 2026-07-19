unit PGGP022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_processo = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    ds_Processo: TDataSource;
    qry_processo_CD_EMBARCACAO: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_processo_NR_DI: TStringField;
    qry_processo_NR_MANIFESTO: TStringField;
    qry_processo_NM_CLIENTE: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_NM_EMBARCACAO: TStringField;
    qry_processo_CalcProcesso: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_processo: Tdatm_consulta_processo;

implementation

{$R *.DFM}
uses PGGP015;



end.
