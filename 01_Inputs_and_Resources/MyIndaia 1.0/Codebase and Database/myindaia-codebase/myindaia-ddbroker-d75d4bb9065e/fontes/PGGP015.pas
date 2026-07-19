unit PGGP015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, DBTables, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, PGGP001,
  ComCtrls, Mask;

type
    Tfrm_consulta_processo = class(TForm)
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
    procedure dbg_cadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveExit(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..7] Of String[22];
  public
    { Public declarations }
    Nr_Processo : string[18];
    Cons_OnLine : TStringField;
    str_cd_unid : string[2];
    str_cd_prod : string[2];
    str_cd_cliente : String[5];
  end;

var
  frm_consulta_processo: Tfrm_consulta_processo;

implementation

uses PGGP022, GSMLIB;

{$R *.DFM}

procedure Tfrm_consulta_processo.FormCreate(Sender: TObject);
begin
  str_cd_cliente       := '';

  Application.CreateForm( Tdatm_consulta_processo, datm_consulta_processo );

  pgctrl_processo.ActivePage := ts_lista;
end;

procedure Tfrm_consulta_processo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_consulta_processo do
  begin
    qry_processo_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_consulta_processo.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_consulta_processo.dbg_cadastroDblClick(Sender: TObject);
begin
  Nr_Processo := datm_consulta_processo.qry_processo_NR_PROCESSO.AsString;
  Close;
end;

procedure Tfrm_consulta_processo.cb_ordemClick(Sender: TObject);
begin
  with datm_consulta_processo do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    edt_chave.Text := '';

    qry_processo_.Close;
    qry_processo_.SQL[14] := a_str_indices[cb_ordem.ItemIndex];
    qry_processo_.ParamByName('CD_UNIDADE').AsString := str_cd_unid;
    qry_processo_.ParamByName('CD_PRODUTO').AsString := str_cd_prod;
    qry_processo_.ParamByName('CD_CLIENTE').AsString := str_cd_cliente;
    qry_processo_.Prepare;
    qry_processo_.Open;

    edt_chave.SetFocus;
    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_consulta_processo.FormShow(Sender: TObject);
begin
  Nr_Processo        := '';
  cb_ordem.ItemIndex := 0;

  a_str_indices[0]   := 'P.NR_PROCESSO';
  a_str_indices[1]   := 'NM_CLIENTE';
  a_str_indices[2]   := 'NM_SERVICO';
  a_str_indices[3]   := 'NR_DI';
  a_str_indices[4]   := 'NM_EMBARCACAO';
  a_str_indices[5]   := 'NR_CONHECIMENTO';
  a_str_indices[6]   := 'NR_CONHECIMENTO_MASTER';
  a_str_indices[7]   := 'NR_MANIFESTO';

  with datm_consulta_processo do
  begin
    qry_processo_.Close;
    qry_processo_.SQL[14] := a_str_indices[0];
    qry_processo_.ParamByName('CD_UNIDADE').AsString := str_cd_unid;
    qry_processo_.ParamByName('CD_PRODUTO').AsString := str_cd_prod;
    qry_processo_.ParamByName('CD_CLIENTE').AsString := str_cd_cliente;
    qry_processo_.Prepare;
    qry_processo_.Open;

    dbg_cadastro.SetFocus;
  end;
end;

procedure Tfrm_consulta_processo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;


procedure Tfrm_consulta_processo.dbg_cadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_consulta_processo.edt_chaveExit(Sender: TObject);
begin
  with datm_consulta_processo.qry_processo_ do
  begin
    if cb_ordem.ItemIndex = 0 then Locate('NR_PROCESSO',Uppercase( str_cd_unid + str_cd_prod + edt_chave.Text ), [loPartialKey] );
    if cb_ordem.ItemIndex = 1 then Locate('NM_CLIENTE',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 2 then Locate('NM_SERVICO',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 3 then Locate('NR_DI',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 4 then Locate('NM_EMBARCACAO',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 5 then Locate('NR_CONHECIMENTO',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 6 then Locate('NR_CONHECIMENTO_MASTER',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
    if cb_ordem.ItemIndex = 7 then Locate('NR_MANIFESTO',edt_chave.Text,[loPartialKey, loCaseInsensitive]);
  end;
end;

end.
