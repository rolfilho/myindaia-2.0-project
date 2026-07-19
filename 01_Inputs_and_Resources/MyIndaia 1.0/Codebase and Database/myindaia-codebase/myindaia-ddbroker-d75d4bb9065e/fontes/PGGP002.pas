unit PGGP002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_li = class(TForm)
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
    str_cd_prod : string[2];
  end;

var
  frm_consulta_li: Tfrm_consulta_li;

implementation

uses PGGP006, GSMLIB;

{$R *.DFM}

procedure Tfrm_consulta_li.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_consulta_li, datm_consulta_li );

  with datm_consulta_li do
  begin
    qry_li_.Close;
    qry_li_.Prepare;
    qry_li_.Open;
  end;

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_consulta_li.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_li do
  begin
    qry_li_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_li.btn_fecharClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure Tfrm_consulta_li.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_li.qry_li_NR_PROCESSO.AsString;
  Close;
  ModalResult := mrOk;
end;

procedure Tfrm_consulta_li.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_consulta_li.qry_li_.SQL[5] := 'L.NR_PROCESSO'
  else
     datm_consulta_li.qry_li_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];

  datm_consulta_li.qry_li_.Close;
  datm_consulta_li.qry_li_.Prepare;
  datm_consulta_li.qry_li_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_consulta_li.FormShow(Sender: TObject);
begin
  Nr_Processo := '';
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]  := 'NR_PROCESSO';
  a_str_indices[1]  := 'AP_EMPRESA, NR_PROCESSO';
  a_str_indices[2]  := 'DT_REGISTRO_LI';

  a_str_indices1[0] := 'NR_PROCESSO';
  a_str_indices1[1] := 'AP_EMPRESA';
  a_str_indices1[2] := 'DT_REGISTRO_LI';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    Items.Add('Dt. Registro');
    ItemIndex := 0;
  end;

  with datm_consulta_li do
  begin
    qry_li_.Close;
    qry_li_.Prepare;
    qry_li_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_consulta_li.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_consulta_li.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then Exit;
  case cb_ordem.ItemIndex of
  0: if Not ( fLocaliza(datm_consulta_li.qry_li_,
              ( str_cd_unid + str_cd_prod + edt_chave.Text ),
              a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Processo não encontrado!', 2 );
     end;
  1: if Not ( fLocaliza(datm_consulta_li.qry_li_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!', 2 );
     end;
  2: if Not ( fLocaliza(datm_consulta_li.qry_li_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!' , 2 );
     end;
  end;
end;

procedure Tfrm_consulta_li.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
