unit PGGP063;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask, Funcoes;

type
    Tfrm_pesq_lote = class(TForm)
    btn_fechar: TSpeedButton;
    dbnvg_pesq_lote: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    cb_ordem: TComboBox;
    pnl_cadastro: TPanel;
    pnl_cadastro2: TPanel;
    edt_chave: TEdit;
    pgctrl_pesq_lote: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbg_cadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    NrProcesso : String[18];
    CdMercadoria, NrRef : String[30];
    NrLote : String[12];
    PlMercadoria : Double;
    Cons_OnLine : TStringField;
  end;

var
  frm_pesq_lote: Tfrm_pesq_lote;

implementation

uses PGGP064, GSMLIB;

{$R *.DFM}

procedure Tfrm_pesq_lote.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pesq_lote, datm_pesq_lote );
end;

procedure Tfrm_pesq_lote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pesq_lote do
  begin
    qry_pesq_lote_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_pesq_lote.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesq_lote.dbg_cadastroDblClick(Sender: TObject);
begin
  with datm_pesq_lote do
  begin
    CdMercadoria := qry_pesq_lote_CD_MERCADORIA.AsString;
    NrRef        := qry_pesq_lote_NR_REF.AsString;
    NrLote       := qry_pesq_lote_NR_LOTE.AsString;
    PlMercadoria := qry_pesq_lote_PL_MERCADORIA.AsFloat;
    Close;
  end;
end;

procedure Tfrm_pesq_lote.cb_ordemClick(Sender: TObject);
begin
  with datm_pesq_lote do
  begin
    CdMercadoria := qry_pesq_lote_CD_MERCADORIA.AsString;
    NrRef        := qry_pesq_lote_NR_REF.AsString;
    NrLote       := qry_pesq_lote_NR_LOTE.AsString;

    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_pesq_lote_.Close;
    qry_pesq_lote_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];
    qry_pesq_lote_.Prepare;
    qry_pesq_lote_.Open;
    qry_pesq_lote_.Locate('CD_MERCADORIA;NR_REF;NR_LOTE', VarArrayOf( [CdMercadoria, NrRef, NrLote]), [loCaseInsensitive] );

    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_pesq_lote.FormShow(Sender: TObject);
begin
  a_str_indices[0] := 'NR_LOTE';
  a_str_indices[1] := 'NR_REF';
  a_str_indices[2] := 'D.CD_MERCADORIA';
  a_str_indices[3] := 'AP_MERCADORIA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nº Lote');
    Items.Add('Nº Referência');
    Items.Add('Cód. Mercadoria');
    Items.Add('Descrição');
    ItemIndex := 0;
  end;

  with datm_pesq_lote do
  begin
    qry_pesq_lote_.Close;
    qry_pesq_lote_.SQL[6] := a_str_indices[0];
    qry_pesq_lote_.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    qry_pesq_lote_.Prepare;
    qry_pesq_lote_.Open;

    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_pesq_lote.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_pesq_lote.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_pesq_lote.qry_pesq_lote_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pesq_lote.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_pesq_lote.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
