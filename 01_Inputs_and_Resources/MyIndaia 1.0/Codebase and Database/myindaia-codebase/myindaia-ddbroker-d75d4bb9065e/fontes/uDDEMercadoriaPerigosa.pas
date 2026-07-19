unit uDDEMercadoriaPerigosa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBevel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Menus, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxLabel, cxDBEdit, StrUtils, DB;

type
  Tfrm_dde_mercadoria_perigosa = class(TForm)
    dxBevel1: TdxBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnAdicionar: TcxButton;
    btnCancelar: TcxButton;
    cxLabel1: TcxLabel;
    cxdbedt_re: TcxDBTextEdit;
    cxdblcp_classe: TcxDBLookupComboBox;
    cxdbcb_anexo: TcxDBComboBox;
    cxdblcp_indicador: TcxDBLookupComboBox;
    cxdblcp_tipo_carga: TcxDBLookupComboBox;
    Label5: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxdblcp_classePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dde_mercadoria_perigosa: Tfrm_dde_mercadoria_perigosa;

implementation

uses
  uDDENovo, dDDENovo;
{$R *.dfm}

procedure Tfrm_dde_mercadoria_perigosa.btnCancelarClick(Sender: TObject);
begin
  datm_dde_novo.qry_dde_merc_perigosa.Cancel;
  Close;
end;

procedure Tfrm_dde_mercadoria_perigosa.btnAdicionarClick(Sender: TObject);
var
  vMaxMercPerigosa: Integer;
begin
  vMaxMercPerigosa := datm_dde_novo.SequencialMercPerigosa;
  datm_dde_novo.qry_dde_merc_perigosaNR_SD.AsString := datm_dde_novo.qry_dde_reNR_SD.AsString;
  datm_dde_novo.qry_dde_merc_perigosaCD_MERC_PERIGOSA.AsInteger := vMaxMercPerigosa;
  datm_dde_novo.qry_dde_merc_perigosa.Post;
  Close;
end;

procedure Tfrm_dde_mercadoria_perigosa.FormShow(Sender: TObject);
var
  I : Integer;
begin
  datm_dde_novo.qry_combo_classe.Close;
  datm_dde_novo.qry_combo_classe.Prepare;
  datm_dde_novo.qry_combo_classe.Open;

  datm_dde_novo.qry_combo_carga.Close;
  datm_dde_novo.qry_combo_carga.Prepare;
  datm_dde_novo.qry_combo_carga.Open;

  datm_dde_novo.qry_combo_indicador.Close;

  datm_dde_novo.qry_dde_merc_perigosaNR_RE_SISCOMEX.AsString := LeftStr(datm_dde_novo.qry_dde_reNR_RE_SISCOMEX.AsString, 11) + datm_dde_novo.qry_dde_reNR_ANEXO_INICIAL.AsString;

  cxdbcb_anexo.Properties.Items.Clear;
  for I := StrToInt(datm_dde_novo.qry_dde_reNR_ANEXO_INICIAL.AsString) to StrToInt(datm_dde_novo.qry_dde_reNR_ANEXO_FINAL.AsString) do
    cxdbcb_anexo.Properties.Items.Add(RightStr('000' + IntToStr(I), 3));
end;

procedure Tfrm_dde_mercadoria_perigosa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if datm_dde_novo.ds_dde_merc_perigosa.State in [dsInsert, dsEdit]  then
    datm_dde_novo.qry_dde_merc_perigosa.Cancel;
end;

procedure Tfrm_dde_mercadoria_perigosa.cxdblcp_classePropertiesEditValueChanged(
  Sender: TObject);
begin
  if not VarIsNull(cxdblcp_classe.EditValue) then
  begin
    datm_dde_novo.qry_combo_indicador.Close;
    datm_dde_novo.qry_combo_indicador.ParamByName('CD_CLASSE').AsInteger := cxdblcp_classe.EditValue;
    datm_dde_novo.qry_combo_indicador.Prepare;
    datm_dde_novo.qry_combo_indicador.Open;
  end;
end;

end.
