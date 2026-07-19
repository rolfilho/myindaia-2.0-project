unit PGGP031;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_exp_saque = class(TForm)
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
    Nr_Saque    : string[10];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
  end;

var
  frm_consulta_exp_saque: Tfrm_consulta_exp_saque;

implementation

uses GSMLIB, PGGP032, PGPE023;

{$R *.DFM}

procedure Tfrm_consulta_exp_saque.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_consulta_exp_saque, datm_consulta_exp_saque );

  with datm_consulta_exp_saque do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_exp_.Prepare;
    qry_exp_.Open;
  end;

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_consulta_exp_saque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_exp_saque do
  begin
    qry_exp_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_exp_saque.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_consulta_exp_saque.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_exp_saque.qry_exp_NR_PROCESSO.AsString;
  Nr_Saque    := datm_consulta_exp_saque.qry_exp_NR_SAQUE.AsString;
  NR_PROC_CONSULTA := NR_PROCESSO;
  Close;
end;

procedure Tfrm_consulta_exp_saque.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_consulta_exp_saque.qry_exp_.SQL[3] := 'NR_PROCESSO'
  else
     datm_consulta_exp_saque.qry_exp_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];

  datm_consulta_exp_saque.qry_exp_.Close;
  datm_consulta_exp_saque.qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
  datm_consulta_exp_saque.qry_exp_.Prepare;
  datm_consulta_exp_saque.qry_exp_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_consulta_exp_saque.FormShow(Sender: TObject);
begin
  Nr_Processo := '';
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]  := 'NR_PROCESSO';
  a_str_indices1[0] := 'NR_PROCESSO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;

  with datm_consulta_exp_saque do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid;
    qry_exp_.Prepare;
    qry_exp_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_consulta_exp_saque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_exp_saque.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then Exit;
  case cb_ordem.ItemIndex of
  0: if Not ( fLocaliza(datm_consulta_exp_saque.qry_exp_,
              ( str_cd_unid + '02' + edt_chave.Text ),
              a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Processo não encontrado!', 2 );
     end;
  1: if Not ( fLocaliza(datm_consulta_exp_saque.qry_exp_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!', 2 );
     end;
  2: if Not ( fLocaliza(datm_consulta_exp_saque.qry_exp_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!' , 2 );
     end;
  end;
end;

procedure Tfrm_consulta_exp_saque.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
