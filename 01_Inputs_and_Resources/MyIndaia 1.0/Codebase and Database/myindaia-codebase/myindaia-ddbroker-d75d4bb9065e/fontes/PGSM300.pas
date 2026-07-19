unit PGSM300;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, Mask, StdCtrls, ExtCtrls, Grids, DBGrids,
  Db, ComCtrls, ShellApi, DBCtrls, DBTables, RXLookup, RxDBComb;

type strParametro = string[255];

type
  Tfrm_trans_nota = class(TForm)
    mi_menu: TMainMenu;
    mn_transmite: TMenuItem;
    mn_sair: TMenuItem;
    pnl_cadastro: TPanel;
    lbl_cd_cliente: TLabel;
    mskedt_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Label2: TLabel;
    btn_sair: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure mskedt_cd_clienteExit(Sender: TObject);
    procedure mskedt_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chave1Change(Sender: TObject);
    procedure cb_ordem1Click(Sender: TObject);
    procedure mn_sairClick(Sender: TObject);
    procedure ValCodEdt( Edit_Codigo : TMaskEdit );
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function EnviarDadosParaNota(nr_processo : string) : string;
    procedure mn_transmiteClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_trans_nota: Tfrm_trans_nota;
  CancelaOperacao: Boolean;
  Cancelado: Boolean;
  a_str_indices: array [0..1] of String;
  a_str_indices1: array [0..1] of String;

implementation
Uses GSMLIB, PGSM301, PGSM104;
{$R *.dfm}

procedure Tfrm_trans_nota.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_trans_nota, datm_trans_nota );

  cb_ordem.ItemIndex := 0;
  a_str_indices[0]   := 'CD_UNID_NEG, CD_PRODUTO, P.NR_PROCESSO DESC';
  a_str_indices[1]   := 'NR_DECLARACAO_IMP';
  a_str_indices1[0]  := 'NR_PROCESSO';
  a_str_indices1[1]  := 'NR_DECLARACAO_IMP';
end;

procedure Tfrm_trans_nota.mskedt_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  DBGrid1.Enabled   := False;
  edt_chave.Enabled := True;
  cb_ordem.Enabled  := False;
  if datm_trans_nota.qry_lista_.Active then datm_trans_nota.qry_lista_.Close;

  if mskedt_cd_cliente.text = '' then Exit;
  ValCodEdt(mskedt_cd_cliente);
  With datm_trans_nota.qry_cliente_ Do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := mskedt_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      ShowMessage('Cliente não encontrado!');
      mskedt_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      Exit;
    end
    else edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    Close;
  end;

  edt_chave.Enabled := True;
  cb_ordem.Enabled  := True;
  DBGrid1.Enabled   := True;

  datm_trans_nota.qry_lista_.ParamByName('CD_CLIENTE').AsString:= mskedt_cd_cliente.text;
  datm_trans_nota.qry_lista_.Prepare;
  datm_trans_nota.qry_lista_.Open;
end;

procedure Tfrm_trans_nota.mskedt_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
      if Sender = mskedt_cd_cliente then SpeedButton6Click(nil);
  end;
end;

procedure Tfrm_trans_nota.edt_chave1Change(Sender: TObject);
begin
  Localiza(datm_trans_nota.qry_lista_, edt_chave.Text, a_str_indices1[cb_ordem.ItemIndex] );
end;

procedure Tfrm_trans_nota.cb_ordem1Click(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  Application.ProcessMessages;

  edt_chave.Text := '';

  datm_trans_nota.qry_lista_.SQL[5] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];

  datm_trans_nota.qry_lista_.Close;
  datm_trans_nota.qry_lista_.Open;

  edt_chave.SetFocus;
  Screen.Cursor:=crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_trans_nota.mn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_trans_nota.ValCodEdt( Edit_Codigo : TMaskEdit );
Var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin
  lDigitouLetras := False;

  nFim := length(Edit_Codigo.Text)-1;

  If Length(Trim(Edit_Codigo.Text)) > 0 Then
  begin
    // VERIFICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO
    nLoop := 0;
    Repeat
      If (Edit_Codigo.Text[nLoop]
      In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras = True) or ( nLoop > nFim );

    // SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO
    If Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(Edit_Codigo.Text);
      If Edit_codigo.readonly = false then
      Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.MaxLength );
    end;
  end;
end;

procedure Tfrm_trans_nota.SpeedButton6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  With frm_cliente_co Do
  Begin
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_cliente_co.Cons_OnLine_Texto <> '' ) then
  begin
    mskedt_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
    mskedt_cd_clienteExit(nil);
  end;
end;

procedure Tfrm_trans_nota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_trans_nota.qry_lista_.Close;
  datm_trans_nota.Free;
  Action:= caFree;
end;

procedure Tfrm_trans_nota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

function Tfrm_trans_nota.EnviarDadosParaNota(nr_processo : string) : string;
var
   DllHandle: THandle;
   CopiarDIBrokerDDGL : function(ProcessoBroker:PChar) : strParametro;
   retorno : strParametro;
begin
  if not FileExists('DDCopiarDIBroker.dll') then begin
    ShowMessage('DLL não encontrada!!!');
    Exit;
  end;
  retorno := '';
  DllHandle := LoadLibrary(PChar('DDCopiarDIBroker.dll'));
  if DllHandle >= 32 then begin
    @CopiarDIBrokerDDGL := GetProcAddress(DllHandle, 'CopiarDIBrokerDDGL');
    if @CopiarDIBrokerDDGL <> nil then begin
      retorno := CopiarDIBrokerDDGL(PChar(nr_processo));
    end;
    FreeLibrary(DllHandle);
    CopiarDIBrokerDDGL:=nil;
  end;
  Result := retorno;
end;

procedure Tfrm_trans_nota.mn_transmiteClick(Sender: TObject);
var
  sRetorno : strParametro;
  i: word;
begin
  if DBGrid1.SelectedRows.Count = 0 then
  begin
    ShowMessage('Nenhum Registro foi selecionado.');
    Exit;
  end;
  Refresh;
  mskedt_cd_cliente.Enabled := False;
  SpeedButton6.Enabled      := False;
  DBGrid1.Enabled           := False;

  for i:= 0 to DBGrid1.SelectedRows.Count - 1 do
  begin
    sRetorno := EnviarDadosParaNota(Trim(datm_trans_nota.qry_lista_NR_PROCESSO.AsString));
    if sRetorno <> '' then
      ShowMessage(sRetorno)
    else
      ShowMessage('Processo Transmitido');
  end;
  Cancelado                 := False;
  mskedt_cd_cliente.Enabled := True;
  SpeedButton6.Enabled      := True;
  DBGrid1.Enabled           := True;
end;

procedure Tfrm_trans_nota.btn_sairClick(Sender: TObject);
begin
  Close;  
end;

end.

