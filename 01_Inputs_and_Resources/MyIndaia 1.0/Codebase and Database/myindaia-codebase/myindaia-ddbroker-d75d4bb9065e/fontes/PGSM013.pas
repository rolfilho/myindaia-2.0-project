unit PGSM013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_via_transp = class(TDataModule)
    ds_via_transp: TDataSource;
    qry_via_transp_: TQuery;
    qry_ult_via_transp_: TQuery;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_IN_ATIVO: TStringField;
    qry_via_scx_: TQuery;
    qry_ult_via_transp_ULTIMO: TStringField;
    qry_via_scx_CD_VIA_TRANSPORTE: TStringField;
    qry_via_scx_NM_VIA_TRANSPORTE: TStringField;
    qry_via_transp_NM_VIA_TRANSP_INGLES: TStringField;
    qry_via_transp_NM_VIA_TRANSP_ESP: TStringField;
    qry_via_transp_CONSTANTE_CUBAGEM: TFloatField;
    qry_via_transp_IN_FCL: TStringField;
    qry_via_transp_IN_LCL: TStringField;
    qry_via_transp_IN_CS: TStringField;
    qry_via_transp_calcAtivo: TStringField;
    qry_via_transp_LookScx: TStringField;
    qry_via_transp_FIESP_Id: TIntegerField;
    procedure qry_via_transp_CD_VIA_TRANSP_SISCOMEXSetText(Sender: TField;
      const Text: String);
    procedure qry_via_transp_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_via_transp: Tdatm_via_transp;

implementation

uses GSMLIB;

{$R *.DFM}

procedure Tdatm_via_transp.qry_via_transp_CD_VIA_TRANSP_SISCOMEXSetText(
  Sender: TField; const Text: String);
begin
  Sender.Value := FStrZero( Text, 2 );
end;

procedure Tdatm_via_transp.qry_via_transp_CalcFields(DataSet: TDataSet);
begin
  //ativo
  if DataSet.FieldByName('IN_ATIVO').AsString = '1' then
    DataSet.FieldByName('calcAtivo').AsString := 'ü'
  else
    DataSet.FieldByName('calcAtivo').AsString := '';
end;
                                  
end.
