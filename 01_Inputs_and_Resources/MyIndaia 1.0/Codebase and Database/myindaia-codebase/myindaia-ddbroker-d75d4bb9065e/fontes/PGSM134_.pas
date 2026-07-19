unit PGSM134;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls;

type
  Tfrm_canc_proc = class(TForm)
    pgctrl_canc_proc: TPageControl;
    ts_lista: TTabSheet;
    dbg_canc_proc: TDBGrid;
    pnl_btn_c: TPanel;
    btn_cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    menu_cadastro: TMainMenu;
    mi_cancelar: TMenuItem;
    Sair1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_canc_procKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Pesquisa : String;
    a_str_indices : Array[0..1] Of String[60];    
  public
    { Public declarations }
  end;

var
  frm_canc_proc: Tfrm_canc_proc;

implementation

uses PGSM135, GSMLIB, PGGP001;

{$R *.DFM}


procedure Tfrm_canc_proc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_canc_proc, datm_canc_proc );

  str_cd_modulo:='01';
  str_cd_rotina:='0104';

  with datm_canc_proc Do
  begin
    qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_rel_processo_.Open;
    qry_processo_.Open;
    qry_empresa_nac_.Open;
    qry_produto_.Open;
    qry_unid_neg_.Open;
    qry_usuario_.Open;
    qry_fat_cc_.Open;
    tbl_yesno_.Open;
  end;

  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'CD_CLIENTE';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Unid+Prod+Processo');
    Items.Add('Cód. Cliente');
    ItemIndex := 0;
  end;

end;

procedure Tfrm_canc_proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_canc_proc Do
  begin
    qry_rel_processo_.Close;
    qry_processo_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_usuario_.Close;
    qry_fat_cc_.Close;
    tbl_yesno_.Close;
  end;
//  datm_canc_proc.Destroy;
  datm_canc_proc.Free;
  Action := caFree;

end;

procedure Tfrm_canc_proc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_canc_proc.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_canc_proc.qry_rel_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_canc_proc.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  Pesquisa := datm_canc_proc.qry_rel_processo_NR_PROCESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_canc_proc.qry_rel_processo_.Close;
  datm_canc_proc.qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
  datm_canc_proc.qry_rel_processo_.SQL[12] := a_str_indices[cb_ordem.ItemIndex];
  datm_canc_proc.qry_rel_processo_.Open;
  Localiza(datm_canc_proc.qry_rel_processo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
  Screen.Cursor:=crDefault;
end;

procedure Tfrm_canc_proc.dbg_canc_procKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then btn_cancelarClick(Sender);
end;

procedure Tfrm_canc_proc.btn_cancelarClick(Sender: TObject);
begin
  with datm_canc_proc do
  begin
    try
      if qry_processo_IN_CANCELADO.AsString = '0' then
      begin
        if qry_fat_cc_QT_FAT_CC.AsFloat = 0 then
        begin
          if qry_fat_cc_QT_RECEB.AsInteger = 0 then
          begin
            if qry_fat_cc_QT_SOLIC_CH.AsInteger = 0 then
            begin
              qry_processo_.Edit;
              qry_processo_IN_CANCELADO.AsString:='1';
              qry_processo_CD_CANCELADOR.AsString:=str_cd_usuario;
              qry_processo_DT_CANCELAMENTO.AsDateTime:=now;
              qry_processo_.Post;
              qry_rel_processo_.Close;
              qry_rel_processo_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
              qry_rel_processo_.Open;
              ShowMessage('Processo foi cancelado com êxito!');
            end
            else
            ShowMessage('Impossível cancelar processo solicitação de cheque!');
          end
          else
          ShowMessage('Impossível cancelar processo recebimento de numerário!');
        end
        else
        ShowMessage('Impossível cancelar processo com movimento!');
      end
      else
      ShowMessage('Impossível cancelar processo cancelado!');
    except
      on E:Exception do
      begin
        qry_processo_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_canc_proc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

end.
