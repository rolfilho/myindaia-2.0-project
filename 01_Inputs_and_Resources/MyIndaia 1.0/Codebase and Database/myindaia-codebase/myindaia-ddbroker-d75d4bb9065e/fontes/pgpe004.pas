unit PGPE004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe = class(TDataModule)
    ds_pe: TDataSource;
    qry_pe_: TQuery;
    qry_pe_NR_PROCESSO: TStringField;
    qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_exec_sp_: TQuery;
    qry_pe_CD_EXPORTADOR: TStringField;
    qry_pe_LookNmExportador: TStringField;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    procedure qry_pe_BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe: Tdatm_pe;

implementation

uses PGPE005;



{$R *.DFM}




procedure Tdatm_pe.qry_pe_BeforeEdit(DataSet: TDataSet);
begin
   datm_pe_capa.VerificaEstado(True);
end;





end.
