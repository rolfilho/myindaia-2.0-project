unit uExpIntegraRAP_Normas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, DBTables;

type
  TfrmExpIntegraRAP_Normas = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    lbl_mercadoria: TLabel;
    Label2: TLabel;
    label12: TLabel;
    lProcessando: TLabel;
    dbg_geral: TDBGrid;
    qry_acordos_normas_geral: TQuery;
    ds_acordos_normas_geral: TDataSource;
    qry_acordos_normas_geralcd_acordo: TStringField;
    qry_acordos_normas_geralcd_norma: TStringField;
    qry_acordos_normas_geralNM_NORMA: TStringField;
    btn_outros: TSpeedButton;
    lbl_mercadoria_idioma: TLabel;
    edt_cd_mercadoria: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_outrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExpIntegraRAP_Normas: TfrmExpIntegraRAP_Normas;

implementation
uses uExpIntegraRAP;

{$R *.dfm}

procedure TfrmExpIntegraRAP_Normas.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmExpIntegraRAP_Normas.btn_outrosClick(Sender: TObject);
begin
  if copy(btn_outros.hint,1,3)='ver' then begin
     btn_outros.hint:='clique para Ocultar o grid abaixo';
     height:=480;
  end else begin
     btn_outros.hint:='ver outros acordos/normas'+#13+'  para esta mercadoria';
     height:=285;
  end;
end;

end.
