(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGGP060.PAS - Data Module - Vencimentos de Contas a Pagar

AUTOR: Bysoft

DATA: dd/mm/yyyy

Manutenção: Rafael Araujo

Data: 22/10/2001 - AMBR-0052/01 - Mais de um Vencimento

*************************************************************************************************)

unit dVenctoCtsPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ctaapagar_vencto = class(TDataModule)
    qry_ctaapagar_vencto_: TQuery;
    ds_ctaapagar_vencto: TDataSource;
    qry_ctaapagar_vencto_NR_IDENTIFICADOR: TIntegerField;
    qry_ctaapagar_vencto_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_vencto_DT_VENCTO: TDateTimeField;
    procedure qry_ctaapagar_vencto_BeforeScroll(DataSet: TDataSet);
    procedure qry_ctaapagar_vencto_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ctaapagar_vencto: Tdatm_ctaapagar_vencto;

implementation

uses PGGP059, uVenctoCtsPagar;

{$R *.DFM}

procedure Tdatm_ctaapagar_vencto.qry_ctaapagar_vencto_BeforeScroll(
  DataSet: TDataSet);
begin
  if qry_ctaapagar_vencto_.State = dsEdit then qry_ctaapagar_vencto_.Post;
end;

procedure Tdatm_ctaapagar_vencto.qry_ctaapagar_vencto_AfterScroll(
  DataSet: TDataSet);
begin
  If frm_ctaapagar_vencto.Active Then
    frm_ctaapagar_vencto.dbedt_dt_vencto.SetFocus;
end;

end.
