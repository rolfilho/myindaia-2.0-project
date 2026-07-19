unit PGNM023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, DBTables, Menus, StdCtrls, Mask, Grids, DBGrids, DB, Funcoes;

type
  Tfrm_libera_sol_aberto = class(TForm)
    pnl_libarar: TPanel;
    btn_sair: TSpeedButton;
    btn_liberar: TSpeedButton;
    menu_: TMainMenu;
    mi_liberar: TMenuItem;
    mi_sair: TMenuItem;
    pnl_unid_prod: TPanel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unidade: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    Panel1: TPanel;
    dbgrid_Libera: TDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_liberarClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Pesquisa : String;
    a_str_indices : Array[0..1] Of String[60];
    procedure AbreLista;
  public
    { Public declarations }
  end;

var
  frm_libera_sol_aberto: Tfrm_libera_sol_aberto;

implementation

uses PGNM024, PGSM018, GSMLIB, PGSM010, PGGP017, PGGP001;

{$R *.DFM}

procedure Tfrm_libera_sol_aberto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_libera_sol_aberto.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i: Integer;
begin
   with datm_libera_sol_aberto do
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if Components[i] is TQuery then ( Components[i] as TQuery ).Close
         else if Components[i] is TTable then ( Components[i] as TTable ).Close;
      end;
      Free;
   end;
   Action := caFree;
end;

procedure Tfrm_libera_sol_aberto.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_libera_sol_aberto, datm_libera_sol_aberto);
end;

procedure Tfrm_libera_sol_aberto.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_libera_sol_aberto.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade );
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_unidade.Cons_OnLine_Texto <> '' ) then
  begin
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_libera_sol_aberto.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    edt_nm_unidade.Text := '';
    Exit;
  end
  else
  begin
    ValCodEdt( msk_cd_unid_neg );
    if msk_cd_unid_neg.Text <> '' then
    begin
      with datm_libera_sol_aberto do
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '"';
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unidade.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          BoxMensagem('Unidade de Negócio não cadastrada!', 2);
          msk_cd_unid_neg.SetFocus;
        end;
        qry_unid_neg_.Close;
      end;
    end;
  end;
  AbreLista;
end;

procedure Tfrm_libera_sol_aberto.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto );
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_produto.Cons_OnLine_Texto <> '' ) then
  begin
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produtoExit(nil);
  end;
end;

procedure Tfrm_libera_sol_aberto.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end
  else
  begin
    ValCodEdt( msk_cd_produto );
    if msk_cd_produto.Text <> '' then
    begin
      with datm_libera_sol_aberto do
      begin
        qry_produto_.Close;
        qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + Trim(msk_cd_produto.Text) + '"';
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        end
        else
        begin
          BoxMensagem('Produto não cadastrado!', 2);
          msk_cd_produto.SetFocus;
        end;
        qry_produto_.Close;
      end;
    end;
  end;
  AbreLista;
end;

procedure Tfrm_libera_sol_aberto.btn_liberarClick(Sender: TObject);
var erro: Boolean;
begin
  erro := False;
  if Not BoxMensagem('Libera processo ' + datm_libera_sol_aberto.qry_lista_calc_nr_processo.AsString +  ' ?', 1 ) then Exit;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  try
    datm_main.db_broker.StartTransaction;
    with datm_libera_sol_aberto do
    begin
      qry_libera_.Close;
      qry_libera_.ParamByName('CD_LIBERADOR_DI').AsString := str_cd_usuario;
      qry_libera_.ParamByName('NR_PROCESSO').AsString     := qry_lista_NR_PROCESSO.AsString;
      qry_libera_.Prepare;
      qry_libera_.ExecSQL;
      qry_libera_.UnPrepare;
      qry_libera_.Close;
    end;
    datm_main.db_broker.Commit;
  except
    Screen.Cursor := crNo;
    erro := True;
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    BoxMensagem('O processo "' + datm_libera_sol_aberto.qry_lista_calc_nr_processo.asString + '" não pôde ser liberado.', 2);
  end;

  with datm_libera_sol_aberto.qry_lista_ do
  begin
   Close;
   Prepare;
   Open;
 end;
 Screen.Cursor := crNo;
 if Not erro then BoxMensagem( 'Processo liberado com sucesso!', 3 );
end;

procedure Tfrm_libera_sol_aberto.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_libera_sol_aberto.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex= 0 then
     Localiza(datm_libera_sol_aberto.qry_lista_, msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else
     Localiza(datm_libera_sol_aberto.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_libera_sol_aberto.cb_ordemClick(Sender: TObject);
begin
  with datm_libera_sol_aberto do
  begin
    Screen.Cursor := crHourGlass;
    Pesquisa      := qry_lista_NR_PROCESSO.AsString;
    { Apaga o campo de pesquisa }
    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
    qry_lista_.ParamByName('CD_PRODUTO').AsString   := msk_cd_produto.Text;
    qry_lista_.ParamByName('CD_USUARIO').AsString   := str_cd_usuario;
    if cb_ordem.ItemIndex = 0 then
      qry_lista_.SQL[23] := 'P.' + a_str_indices[cb_ordem.ItemIndex]
    else
      qry_lista_.SQL[23] := a_str_indices[cb_ordem.ItemIndex];

    qry_lista_.Prepare;
    qry_lista_.Open;
    Localiza( qry_lista_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_libera_sol_aberto.FormShow(Sender: TObject);
begin
  vStr_cd_modulo := '06';
  str_cd_rotina := '0606';
  Caption       := 'Liberar registro de DI para solicitações em aberto';

  with datm_libera_sol_aberto do
  begin
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);
  end;

  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'NM_SERVICO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Serviço');
    ItemIndex := 0;
  end;
  edt_chave.SetFocus;
end;

procedure Tfrm_libera_sol_aberto.AbreLista;
begin
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
     ( Trim( msk_cd_produto.Text ) <> '' ) then
  begin
    with datm_libera_sol_aberto.qry_lista_ do
    begin
      Close;
      ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      ParamByName('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
      ParamByName('CD_USUARIO').AsString  := Trim( str_cd_usuario );
      Prepare;
      Open;
    end;
  end;
end;

end.
