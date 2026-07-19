unit PGPO009;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_po = class(TForm)
    btn_fechar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    cb_ordem: TComboBox;
    pnl_cadastro: TPanel;
    pnl_cadastro2: TPanel;
    edt_chave: TEdit;
    pgctrl_processo: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveExit(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveChange(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..2] Of String[60];
    a_str_indices1 : Array[0..2] Of String[60];
  public
    { Public declarations }
    Nr_Processo : String[18];
    Cons_OnLine : TStringField;
    str_cd_unid : String[2];
    tp_po : String[1]; { 0 - PO, 1 - Nacionalizações }
  end;

var
  frm_consulta_po: Tfrm_consulta_po;

implementation

uses PGPO010, GSMLIB, PGPO007;

{$R *.DFM}

procedure Tfrm_consulta_po.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_consulta_po, datm_consulta_po );

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_consulta_po.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_po do
  begin
    qry_po_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_po.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_consulta_po.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_po.qry_po_NR_PROCESSO.AsString;
  NR_PROC_CONSULTA := NR_PROCESSO;
  Close;
end;

procedure Tfrm_consulta_po.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_consulta_po.qry_po_.SQL[6] := 'P.NR_PROCESSO'
  else
     datm_consulta_po.qry_po_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];

  datm_consulta_po.qry_po_.Close;
  datm_consulta_po.qry_po_.Prepare;
  datm_consulta_po.qry_po_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_consulta_po.FormShow(Sender: TObject);
begin
  Nr_Processo := '';

  if tp_po = '0' then dbg_cadastro.Columns[4].Width := 0;

  a_str_indices[0]  := 'NR_PROCESSO';
  a_str_indices[1]  := 'AP_EMPRESA, NR_PROCESSO';
  if tp_po = '1' then a_str_indices[2] := 'NR_DA';

  a_str_indices1[0] := 'NR_PROCESSO';
  a_str_indices1[1] := 'AP_EMPRESA';
  if tp_po = '1' then a_str_indices1[2] := 'NR_DA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    if tp_po = '1' then Items.Add('Nº D.A.');
    ItemIndex := 0;
  end;

  with datm_consulta_po do
  begin
    qry_po_.Close;
    if tp_po = '1' then qry_po_.SQL[4] := 'ISNULL( NR_DA, "" ) <> ""'
    else qry_po_.SQL[4] := 'ISNULL( NR_DA, "" ) = ""';
    qry_po_.Prepare;
    qry_po_.Open;

    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_consulta_po.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_po.edt_chaveExit(Sender: TObject);
begin
{
  if edt_chave.Text = '' then Exit;
  if Not ( fLocaliza( datm_consulta_po.qry_po_,
                      edt_chave.Text,
                      a_str_indices1[cb_ordem.ItemIndex] ) ) then
  begin
    BoxMensagem( 'Registro não encontrado!', 2 );
  end;
}
end;

procedure Tfrm_consulta_po.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     dbg_cadastroDblClick(nil);
end;

procedure Tfrm_consulta_po.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_consulta_po.qry_po_, edt_chave.Text, a_str_indices1[cb_ordem.ItemIndex] );
end;

end.
