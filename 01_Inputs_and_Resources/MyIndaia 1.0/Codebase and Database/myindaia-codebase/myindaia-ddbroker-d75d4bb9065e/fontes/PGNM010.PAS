unit PGNM010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Db, DBTables, PGGP001;

type
  Tfrm_s_ref = class(TForm)
    btn_fechar: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edt_nr_referencia: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    dsq_s_referencia: TDataSource;
    qry_s_ref_: TQuery;
    qry_s_ref_CD_REFERENCIA: TStringField;
    qry_s_ref_NR_PROCESSO: TStringField;
    qry_s_ref_DT_ABERTURA: TDateTimeField;
    qry_s_ref_Look_nr_processo: TStringField;
    procedure qry_s_ref_CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_nr_referenciaChange(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_s_ref: Tfrm_s_ref;

implementation

uses PGNM005;

{$R *.DFM}

procedure Tfrm_s_ref.qry_s_ref_CalcFields(DataSet: TDataSet);
begin
  qry_s_ref_Look_nr_processo.AsString :=
  Copy( qry_s_ref_NR_PROCESSO.AsString, 5, 2 ) + '/' +
  Copy( qry_s_ref_NR_PROCESSO.AsString, 7, 4 ) + '-' +
  Copy( qry_s_ref_NR_PROCESSO.AsString,11, 1 );
end;

procedure Tfrm_s_ref.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_s_ref.edt_nr_referenciaChange(Sender: TObject);
begin
  with qry_s_ref_ do
  Locate('CD_REFERENCIA', edt_nr_referencia.Text, [loPartialKey])
end;

procedure Tfrm_s_ref.btn_fecharClick(Sender: TObject);
begin
  str_nr_processo := qry_s_ref_NR_PROCESSO.AsString;
  close;                          
end;

end.
