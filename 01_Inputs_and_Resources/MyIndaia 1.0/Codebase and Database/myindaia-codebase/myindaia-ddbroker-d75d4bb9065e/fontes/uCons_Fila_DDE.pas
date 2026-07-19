{
Data        : Dez/2008
Programador : Carlos Alberto
Objetivo    : Exibir aos usuários o andamento dos registros de DDEs na fila do Robo
}
unit uCons_Fila_DDE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxCalendar,
  cxTextEdit, cxButtonEdit, cxLabel;

type
  Tfrm_cons_fila_dde = class(TForm)
    pnl_topo: TPanel;
    btn_fechar: TSpeedButton;
    btn_Recarrega: TSpeedButton;
    tempo_recarrega: TTimer;
    cbAuto: TCheckBox;
    cxGrid_Tabela: TcxGridDBTableView;
    cxGrid_Fila: TcxGrid;
    cxGrid_Fila_Nivel1: TcxGridLevel;
    cxGrid_TabelaNR_PROCESSO: TcxGridDBColumn;
    cxGrid_TabelaDATA_STATUS: TcxGridDBColumn;
    cxGrid_TabelaTX_STATUS: TcxGridDBColumn;
    cxGrid_TabelaNM_USUARIO: TcxGridDBColumn;
    cxGrid_TabelaDATA_FILA: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxTitulos: TcxStyle;
    cxSelection: TcxStyle;
    cxGrid_TabelaHORA_FILA: TcxGridDBColumn;
    cxGrid_TabelaHORA_STATUS: TcxGridDBColumn;
    cxDestaque: TcxStyle;
    cb_limite_filtro: TCheckBox;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_RecarregaClick(Sender: TObject);
    procedure tempo_recarregaTimer(Sender: TObject);
    procedure cbAutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid_TabelaTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure SalvaGrid(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxGrid_TabelaCustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cb_limite_filtroClick(Sender: TObject);
  private
    { Private declarations }
    GuardaStatusGrid:Boolean;
  public
    { Public declarations }
  end;

var
  frm_cons_fila_dde: Tfrm_cons_fila_dde;


implementation
Uses dDDE, GSMLIB, funcoes;

{$R *.dfm}

procedure Tfrm_cons_fila_dde.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cons_fila_dde.FormShow(Sender: TObject);
begin
  cb_limite_filtroClick(sender);

//  datm_dde.qry_fila_exp.Close;
//  datm_dde.qry_fila_exp.ParamByName('ver_tudo').AsString:='N';
//  datm_dde.qry_fila_exp.Open;  
end;

procedure Tfrm_cons_fila_dde.btn_RecarregaClick(Sender: TObject);
begin
  FormShow(sender);
end;

procedure Tfrm_cons_fila_dde.tempo_recarregaTimer(Sender: TObject);
begin
   btn_recarrega.Click;
end;

procedure Tfrm_cons_fila_dde.cbAutoClick(Sender: TObject);
begin
  if cbAuto.Checked then begin
    tempo_recarrega.Enabled:=true;
    btn_recarrega.Enabled  :=false;
  end else begin
    tempo_recarrega.Enabled:=false;
    btn_recarrega.Enabled  :=True;
  end;
end;

procedure Tfrm_cons_fila_dde.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  GuardaStatusGrid:=false;
  CarregaGridView(cxGrid_Tabela);
end;

procedure Tfrm_cons_fila_dde.cxGrid_TabelaTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
  Atext:='Qtd de Registros : '+VarToStr(AValue);
end;

procedure Tfrm_cons_fila_dde.SalvaGrid(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   { Houve Mudannças no Layout do Grid }
   GuardaStatusGrid:=true;
end;

procedure Tfrm_cons_fila_dde.cxGrid_TabelaCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   { Houve Mudannças no Layout do Grid }
   GuardaStatusGrid:=true;
end;

procedure Tfrm_cons_fila_dde.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  { Se houve Mudannças no Layout do Grid então Grava as Modificações }
//  if  GuardaStatusGrid then  desabilitado em 21/01/2009 - resolvi salvar sempre
     SalvaGridView(cxGrid_Tabela);
end;

procedure Tfrm_cons_fila_dde.cb_limite_filtroClick(Sender: TObject);
begin
  datm_dde.qry_fila_exp.Close;
  if cb_limite_filtro.Checked then
     datm_dde.qry_fila_exp.ParamByName('ver_tudo').AsString:='N'
  else
     datm_dde.qry_fila_exp.ParamByName('ver_tudo').AsString:='S';

  datm_dde.qry_fila_exp.Open;

end;

end.
