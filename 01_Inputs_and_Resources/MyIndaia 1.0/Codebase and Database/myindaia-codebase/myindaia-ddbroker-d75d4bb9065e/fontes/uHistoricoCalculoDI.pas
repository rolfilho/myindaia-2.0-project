unit uHistoricoCalculoDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TfrmHistoricoClalculoDI = class(TForm)
    Label26: TLabel;
    Label27: TLabel;
    Panel1: TPanel;
    Shape2: TShape;
    Shape5: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    dbedt_ii: TDBEdit;
    dbedt_ipi: TDBEdit;
    dbedt_ad: TDBEdit;
    dbedt_sda: TDBEdit;
    dbedt_icms: TDBEdit;
    dbedt_seguro_mn: TDBEdit;
    dbedt_vmle_mn: TDBEdit;
    dbedt_frete_mn: TDBEdit;
    dbedt_desp_mn: TDBEdit;
    dbedt_acresc_mn: TDBEdit;
    dbedt_deducao_mn: TDBEdit;
    dbedt_seguro_mneg: TDBEdit;
    dbedt_desp_mneg: TDBEdit;
    dbedt_vmle_mneg: TDBEdit;
    dbedt_moeda_frete: TDBEdit;
    dbedt_moeda_vmle: TDBEdit;
    dbedt_moeda_seguro: TDBEdit;
    dbedt_taxa_vmle: TDBEdit;
    dbedt_taxa_frete: TDBEdit;
    dbedt_taxa_seguro: TDBEdit;
    dbedt_taxa_usd: TDBEdit;
    dbedt_frete_mneg: TDBEdit;
    dbedt_cif: TDBEdit;
    dbedt_dt_calculo: TDBEdit;
    dbedt_nr_processo: TDBEdit;
    dbedt_siscomex: TDBEdit;
    dbedt_vl_pis: TDBEdit;
    dbedt_vl_cofins: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    DBEdit6: TDBEdit;
    dbedt_Fundo_Pobreza: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label31: TLabel;
    DBEdit7: TDBEdit;
    Label33: TLabel;
    DBEdit8: TDBEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoClalculoDI: TfrmHistoricoClalculoDI;

implementation

uses PGDI017, PGGP017;

{$R *.dfm}

procedure TfrmHistoricoClalculoDI.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmHistoricoClalculoDI.FormCreate(Sender: TObject);
begin
  Shape1.Brush.Color := clPnlClaroBroker;
  Shape2.Brush.Color := clPnlClaroBroker;
  Shape4.Brush.Color := clMenuBroker;
  Shape3.Brush.Color := clMenuBroker;
  Shape5.Brush.Color := clMenuBroker;
end;

end.
