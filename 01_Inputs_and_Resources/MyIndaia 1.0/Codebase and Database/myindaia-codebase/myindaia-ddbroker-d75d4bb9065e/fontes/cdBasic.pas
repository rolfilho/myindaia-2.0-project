unit cdBasic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, cxGraphics, cxControls, DB, DBClient,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPSCore, dxPScxCommon, PGGP017, FMTBcd, SqlExpr,
  Provider;

type
  T_frmCdBasic = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pcMain: TPageControl;
    tsView: TTabSheet;
    tsEdit: TTabSheet;
    dsMain: TDataSource;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SaveDialog: TSaveDialog;
    btn_Alterar: TSpeedButton;
    sqlMain: TSQLDataSet;
    dspMain: TDataSetProvider;
    cdsMain: TClientDataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dsMainStateChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAutoOpen: Boolean;
    procedure HabilitaBotoes;
  public
    property AutoOpen: Boolean read FAutoOpen write FAutoOpen;
    procedure Incluir; virtual;
    procedure Alterar; virtual;
    procedure Salvar; virtual;
    procedure Cancelar; virtual;
    procedure Excluir; virtual;
    procedure Open; Virtual;
  end;

var
  _frmCdBasic: T_frmCdBasic;

implementation

uses cxGridExportLink, KrDialog;

{$R *.dfm}

procedure T_frmCdBasic.Alterar;
begin
  if (dsMain.State = dsBrowse) then
  begin
    cdsMain.Edit;
    pcMain.ActivePage := tsEdit;
  end;
end;

procedure T_frmCdBasic.Excluir;
begin
  if (dsMain.State = dsBrowse) then
  begin
    if Confirm('Confirma exclusão?') then
    begin
      cdsMain.Delete;
      cdsMain.ApplyUpdates(-1);
    end;
  end;
end;

procedure T_frmCdBasic.Incluir;
begin
  if (cdsMain.State = dsBrowse) then
  begin
    cdsMain.Append;
    pcMain.ActivePage := tsEdit;
  end;
end;

procedure T_frmCdBasic.Salvar;
begin
  if (cdsMain.State in [dsEdit, dsInsert]) then
  begin
    cdsMain.Post;
    cdsMain.ApplyUpdates(-1);
    pcMain.ActivePage := tsView;
  end;
end;

procedure T_frmCdBasic.Cancelar;
begin
  if (cdsMain.State in [dsEdit, dsInsert]) then
  begin
    dsMain.DataSet.Cancel;
    pcMain.ActivePage := tsView;
  end;
end;

procedure T_frmCdBasic.HabilitaBotoes;
begin
  btn_incluir.Enabled := cdsMain.State = dsBrowse;
  btn_alterar.Enabled := cdsMain.State = dsBrowse;
  btn_salvar.Enabled := cdsMain.State in [dsEdit, dsInsert];
  btn_cancelar.Enabled := cdsMain.State in [dsEdit, dsInsert];
  btn_excluir.Enabled := cdsMain.State = dsBrowse;
end;

procedure T_frmCdBasic.SpeedButton1Click(Sender: TObject);
begin
  //dxComponentPrinterLink1.PrinterPage.PageHeader.CenterTitle.Text := TituloRelatorio;
  dxComponentPrinter.Preview();
end;

procedure T_frmCdBasic.SpeedButton2Click(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, cxGrid, False);
    //ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure T_frmCdBasic.dsMainStateChange(Sender: TObject);
begin
  HabilitaBotoes;
end;

procedure T_frmCdBasic.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure T_frmCdBasic.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to pcMain.PageCount - 1 do
    pcMain.Pages[I].TabVisible := False;
  pcMain.ActivePage := tsView;
end;

procedure T_frmCdBasic.btn_incluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure T_frmCdBasic.btn_AlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure T_frmCdBasic.btn_salvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure T_frmCdBasic.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure T_frmCdBasic.btn_excluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure T_frmCdBasic.Open;
begin
  datm_main.SQLConnection.Open;
  cdsMain.Active := True;
end;

procedure T_frmCdBasic.FormShow(Sender: TObject);
begin
  Open;
end;

end.
