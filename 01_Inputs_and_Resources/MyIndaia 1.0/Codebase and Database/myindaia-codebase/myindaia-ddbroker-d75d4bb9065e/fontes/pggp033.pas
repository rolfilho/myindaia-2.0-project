unit PGGP033;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_acordo_normas = class(TForm)
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
    CD_ACORDO : string[10];
    Nr_Norma : string[10];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
  end;

var
  frm_acordo_normas: Tfrm_acordo_normas;

implementation

uses GSMLIB, PGGP034;

{$R *.DFM}

procedure Tfrm_acordo_normas.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_acordo_normas, datm_acordo_normas );

  with datm_acordo_normas do
  begin
    qry_acordo_normas_.Close;
    qry_acordo_normas_.ParamByName('CD_ACORDO').AsString := CD_ACORDO;
    qry_acordo_normas_.Prepare;
    qry_acordo_normas_.Open;
  end;

  pgctrl_processo.ActivePage := ts_lista;

end;

procedure Tfrm_acordo_normas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_acordo_normas do
  begin
    qry_acordo_normas_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_acordo_normas.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_acordo_normas.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Norma := datm_acordo_normas.qry_acordo_normas_CD_NORMA.AsString;
  Close;
end;

procedure Tfrm_acordo_normas.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  if cb_ordem.ItemIndex = 0 then
     datm_acordo_normas.qry_acordo_normas_.SQL[5] := 'A.CD_NORMA'
  else
     datm_acordo_normas.qry_acordo_normas_.SQL[5] := 'N.NM_DESCRICAO';

  datm_acordo_normas.qry_acordo_normas_.Close;
  datm_acordo_normas.qry_acordo_normas_.ParamByName('CD_ACORDO').AsString := CD_ACORDO;
  datm_acordo_normas.qry_acordo_normas_.Prepare;
  datm_acordo_normas.qry_acordo_normas_.Open;

  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_acordo_normas.FormShow(Sender: TObject);
begin
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]  := 'CD_NORMA';
  a_str_indices[1]  := 'NM_DESCRICAO';

  a_str_indices1[0] := 'CD_NORMA';
  a_str_indices1[1] := 'NM_DESCRICAO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 0;
  end;

  with datm_acordo_normas do
  begin
    qry_acordo_normas_.Close;
    qry_acordo_normas_.ParamByName('CD_ACORDO').AsString := CD_ACORDO;
    qry_acordo_normas_.Prepare;
    qry_acordo_normas_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_acordo_normas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_acordo_normas.edt_chaveExit(Sender: TObject);
begin
  if edt_chave.Text = '' then Exit;
  case cb_ordem.ItemIndex of
  0: if Not ( fLocaliza(datm_acordo_normas.qry_acordo_normas_,
              ( str_cd_unid + '02' + edt_chave.Text ),
              a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Processo não encontrado!', 2 );
     end;
  1: if Not ( fLocaliza(datm_acordo_normas.qry_acordo_normas_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!', 2 );
     end;
  2: if Not ( fLocaliza(datm_acordo_normas.qry_acordo_normas_,
                       edt_chave.Text,
                       a_str_indices1[cb_ordem.ItemIndex] ) ) then
     begin
       BoxMensagem( 'Registro não encontrado!' , 2 );
     end;
  end;
end;

procedure Tfrm_acordo_normas.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

end.
