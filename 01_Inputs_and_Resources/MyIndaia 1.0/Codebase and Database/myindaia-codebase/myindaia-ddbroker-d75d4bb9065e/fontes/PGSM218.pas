unit PGSM218;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, ExtCtrls, Buttons, Funcoes;

type
  Tfrm_sel_mercadoria = class(TForm)
    Panel1: TPanel;
    btn_imprimir: TButton;
    crp_Relacao: TCrpe;
    btn_sair: TButton;
    lbl_mercadoria: TLabel;
    btn_co_mercadoria: TSpeedButton;
    msk_cd_mercadoria: TMaskEdit;
    edt_nm_mercadoria: TEdit;
    chk_aberto: TCheckBox;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    Label2: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_mercadoriaExit(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    tp_rel : Byte;
    {1 - Relação de Saldo das Mercadoria PO}
    { Public declarations }
  end;

var
  frm_sel_mercadoria: Tfrm_sel_mercadoria;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGSM117, PGSM219, PGSM119, PGSM024;

procedure Tfrm_sel_mercadoria.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_mercadoria.btn_imprimirClick(Sender: TObject);
var nr_identificador: Integer;
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  nr_identificador := 0;
  if tp_rel = 1 then
  begin
    if Trim( msk_cd_mercadoria.Text ) = '' then
    begin
      BoxMensagem( 'Selecione uma mercadoria!', 2 );
      msk_cd_mercadoria.SetFocus;
      Exit;
    end;

    with crp_Relacao do
    begin
      with datm_sel_mercadoria do
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_rel_po_saldo_mercadoria );
          sp_rel_po_saldo_mercadoria.ParamByName('@cd_mercadoria').AsString := Trim( msk_cd_mercadoria.Text );
          if chk_aberto.Checked then sp_rel_po_saldo_mercadoria.ParamByName('@in_aberto').AsString := '1'
          else sp_rel_po_saldo_mercadoria.ParamByName('@in_aberto').AsString := '0';
          ExecStoredProc( sp_rel_po_saldo_mercadoria );
          nr_identificador := sp_rel_po_saldo_mercadoria.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_po_saldo_mercadoria );
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then
          begin
             datm_main.db_broker.Rollback;
             Exit;
          end;
        end;

        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportTitle := 'Saldo da mercadoria: ' + edt_nm_mercadoria.Text;
        ReportName  := cDir_Rpt + '\CRPO004.RPT';
        Formulas[0] := 'NrIdentificador = ' + InttoStr( nr_identificador );
        Execute;

        with datm_sel_mercadoria.qry_limpa_ do
        begin
          Close;
          ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          ExecSQL;
          Close;
        end;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_mercadoria.FormShow(Sender: TObject);
begin
  Caption := 'Relação de Saldos das Mercadorias';
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_sel_mercadoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_sel_mercadoria.qry_mercadoria_.Close;
  crp_Relacao.Free;
  Action := caFree;
end;

procedure Tfrm_sel_mercadoria.msk_cd_mercadoriaExit(Sender: TObject);
begin
  edt_nm_mercadoria.Clear;
  if msk_cd_mercadoria.Text = '' then
  begin
    edt_nm_mercadoria.Text := '';
    Exit;
  end;
  with datm_sel_mercadoria.qry_mercadoria_ do
  begin
    ParamByName('CD_MERCADORIA').AsString := msk_cd_mercadoria.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Mercadoria não encontrada!', 2 );
      msk_cd_mercadoria.Clear;
      edt_nm_mercadoria.Clear;
      msk_cd_mercadoria.SetFocus;
    end
    else edt_nm_mercadoria.Text := FieldByName('AP_MERCADORIA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_mercadoria.btn_co_mercadoriaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  Application.CreateForm(Tfrm_mercadoria, frm_mercadoria);
  with frm_mercadoria do
  begin
    cGrupo      := Trim( msk_cd_grupo.Text );
    cImportador := Trim( msk_cd_cliente.Text );
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_mercadoria.Text := frm_mercadoria.Cons_OnLine_Texto;
    msk_cd_mercadoriaExit(nil);
    if (frm_mercadoria.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_mercadoria.Text := frm_mercadoria.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_mercadoriaExit(nil);
end;

procedure Tfrm_sel_mercadoria.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Mercadorias}
  Application.CreateForm( Tdatm_sel_mercadoria, datm_sel_mercadoria );
end;


procedure Tfrm_sel_mercadoria.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_sel_mercadoria.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_mercadoria.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo não encontrado!',2);
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_mercadoria.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_mercadoria then btn_co_mercadoriaClick(nil);
  end;
end;

procedure Tfrm_sel_mercadoria.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

procedure Tfrm_sel_mercadoria.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then exit;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_mercadoria.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_mercadoria.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_grupo.Cons_OnLine_Texto := msk_cd_grupo.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
  msk_cd_grupo.SetFocus;
end;

procedure Tfrm_sel_mercadoria.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

end.
