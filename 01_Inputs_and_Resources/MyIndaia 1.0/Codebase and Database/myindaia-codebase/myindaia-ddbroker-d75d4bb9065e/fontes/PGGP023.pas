unit PGGP023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_pe = class(TForm)
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
    procedure dbg_cadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    a_str_indices : Array[0..2] Of String[60];
    a_str_indices1 : Array[0..2] Of String[60];
  public
    { Public declarations }
    Nr_Processo : string[18];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
  end;

var
  frm_consulta_pe: Tfrm_consulta_pe;

implementation

uses PGGP024, GSMLIB, PGPE013;

{$R *.DFM}

procedure Tfrm_consulta_pe.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_consulta_pe, datm_consulta_pe );

  with datm_consulta_pe do
  begin
    qry_pe_.Close;
    qry_pe_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_pe_.Prepare;
    qry_pe_.Open;
  end;

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_consulta_pe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_pe do
  begin
    qry_pe_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_pe.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_consulta_pe.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_pe.qry_pe_NR_PROCESSO.AsString;
  NR_PROC_CONSULTA := NR_PROCESSO;
  Close;
end;

procedure Tfrm_consulta_pe.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_consulta_pe.qry_pe_.SQL[5] := 'P.NR_PROCESSO'
  else
     datm_consulta_pe.qry_pe_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];

  datm_consulta_pe.qry_pe_.Close;
  datm_consulta_pe.qry_pe_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
  datm_consulta_pe.qry_pe_.Prepare;
  datm_consulta_pe.qry_pe_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_consulta_pe.FormShow(Sender: TObject);
begin
  Nr_Processo := '';
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]  := 'NR_PROCESSO';
  a_str_indices[1]  := 'AP_EMPRESA, NR_PROCESSO';

  a_str_indices1[0] := 'NR_PROCESSO';
  a_str_indices1[1] := 'AP_EMPRESA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    ItemIndex := 0;
  end;

  with datm_consulta_pe do
  begin
    qry_pe_.Close;
    qry_pe_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_pe_.Prepare;
    qry_pe_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_consulta_pe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_pe.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then Exit;
  case cb_ordem.ItemIndex of
  0: if Not ( fLocaliza(datm_consulta_pe.qry_pe_,
              ( str_cd_unid + '01' + edt_chave.Text ),
              a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Processo não encontrado!', 2 );
     end;
  1: if Not ( fLocaliza(datm_consulta_pe.qry_pe_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!', 2 );
     end;
  2: if Not ( fLocaliza(datm_consulta_pe.qry_pe_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!' , 2 );
     end;
  end;
end;

procedure Tfrm_consulta_pe.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
