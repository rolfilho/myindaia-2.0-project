unit PGGP035;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_exp_bord = class(TForm)
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
    a_str_indices : Array[0..1] Of String[60];
    a_str_indices1 : Array[0..1] Of String[60];
  public
    { Public declarations }
    Nr_Processo : string[18];
    Nr_Protocolo : string[30];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
  end;

var
  frm_consulta_exp_bord: Tfrm_consulta_exp_bord;

implementation

uses GSMLIB, PGGP036, PGPE023;

{$R *.DFM}

procedure Tfrm_consulta_exp_bord.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_consulta_exp_bord, datm_consulta_exp_bord );

  with datm_consulta_exp_bord do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_exp_.Prepare;
    qry_exp_.Open;
  end;

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_consulta_exp_bord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_exp_bord do
  begin
    qry_exp_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_exp_bord.btn_fecharClick(Sender: TObject);
begin
  datm
  Close;
end;

procedure Tfrm_consulta_exp_bord.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_exp_bord.qry_exp_NR_PROCESSO.AsString;
  Nr_Protocolo:= datm_consulta_exp_saque.qry_exp_NR_PROTOCOLO.AsString;
  NR_PROC_CONSULTA := NR_PROCESSO;
  Close;
end;

procedure Tfrm_consulta_exp_bord.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_consulta_exp_bord.qry_exp_.SQL[3] := 'NR_PROCESSO'
  else
     datm_consulta_exp_bord.qry_exp_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];

  datm_consulta_exp_bord.qry_exp_.Close;
  datm_consulta_exp_bord.qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
  datm_consulta_exp_bord.qry_exp_.Prepare;
  datm_consulta_exp_bord.qry_exp_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_consulta_exp_bord.FormShow(Sender: TObject);
begin
  Nr_Processo := '';
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]  := 'NR_PROCESSO';
  a_str_indices[1]  := 'NR_PROTOCOLO';
  a_str_indices1[0] := 'NR_PROCESSO';
  a_str_indices1[1] := 'NR_PROTOCOLO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Protocolo');
    ItemIndex := 0;
  end;

  with datm_consulta_exp_bord do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_exp_.Prepare;
    qry_exp_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_consulta_exp_bord.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_exp_bord.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then Exit;
  case cb_ordem.ItemIndex of
  0: if Not ( fLocaliza(datm_consulta_exp_bord.qry_exp_,
              ( str_cd_unid + '02' + edt_chave.Text ),
              a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Processo não encontrado!', 2 );
     end;
  1: if Not ( fLocaliza(datm_consulta_exp_bord.qry_exp_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!', 2 );
     end;
  2: if Not ( fLocaliza(datm_consulta_exp_bord.qry_exp_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!' , 2 );
     end;
  end;
end;

procedure Tfrm_consulta_exp_bord.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
