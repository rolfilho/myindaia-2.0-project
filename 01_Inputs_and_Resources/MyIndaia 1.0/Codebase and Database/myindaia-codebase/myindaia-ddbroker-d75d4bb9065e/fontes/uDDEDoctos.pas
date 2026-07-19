unit uDDEDoctos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBevel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Menus, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxLabel, cxDBEdit, StrUtils, DB,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  Tfrm_dde_doctos = class(TForm)
    dxBevel1: TdxBevel;
    btnAdicionar: TcxButton;
    btnCancelar: TcxButton;
    cxLabel1: TcxLabel;
    cxgDoctosDigitalizados: TcxGrid;
    cxtbDoctosDigitalizados: TcxGridDBTableView;
    cxlDoctosDigitalizados: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxlcp_tipo_docto: TcxLookupComboBox;
    cxtbDoctosDigitalizadosNM_DESCRICAO: TcxGridDBColumn;
    cxtbDoctosDigitalizadosDT_CRIACAO: TcxGridDBColumn;
    cxtbDoctosDigitalizadosNM_USUARIO: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dde_doctos: Tfrm_dde_doctos;

implementation

uses
  uDDENovo, dDDENovo;
{$R *.dfm}

procedure Tfrm_dde_doctos.btnCancelarClick(Sender: TObject);
begin
  datm_dde_novo.qry_doctos_digitalizados.Close;
  Close;
end;

procedure Tfrm_dde_doctos.btnAdicionarClick(Sender: TObject);
begin
  datm_dde_novo.qry_dde_doctosNM_CAMINHO.AsString := datm_dde_novo.qry_doctos_digitalizadosNM_CAMINHO.AsString;
  Close;
end;

procedure Tfrm_dde_doctos.FormShow(Sender: TObject);
var
  I, CdDocto : Integer;
begin
  CdDocto := datm_dde_novo.BuscaDocto;

  datm_dde_novo.qry_tipo_docto.Close;
  datm_dde_novo.qry_tipo_docto.Prepare;
  datm_dde_novo.qry_tipo_docto.Open;

  cxlcp_tipo_docto.EditValue := frm_dde_novo.cxdblcDoctoIdentificador.EditValue;

  datm_dde_novo.qry_doctos_digitalizados.Close;
  datm_dde_novo.qry_doctos_digitalizados.ParamByName('CD_TIPO_DOCTO').AsInteger := CdDocto;
  datm_dde_novo.qry_doctos_digitalizados.ParamByName('NR_SD').AsString := datm_dde_novo.qry_ddeNR_SD.AsString;
  datm_dde_novo.qry_doctos_digitalizados.Prepare;
  datm_dde_novo.qry_doctos_digitalizados.Open;
end;

procedure Tfrm_dde_doctos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_dde_novo.qry_tipo_docto.Close;

  if datm_dde_novo.qry_doctos_digitalizados.State in [dsInsert, dsEdit]  then
    datm_dde_novo.qry_doctos_digitalizados.Cancel;
end;

end.
