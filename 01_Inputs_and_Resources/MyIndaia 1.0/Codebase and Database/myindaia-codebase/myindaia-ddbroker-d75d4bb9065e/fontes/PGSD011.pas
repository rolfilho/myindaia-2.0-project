unit PGSD011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, Buttons, Grids, DBGrids,
  DBCtrls, DBCGrids, Menus, ToolEdit, Funcoes,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_sda_distr = class(TForm)
    Mensagem: TStatusBar;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Label1: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    mi_menu: TMainMenu;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_distribuir: TSpeedButton;
    mi_distribuir: TMenuItem;
    btn_co_celula: TSpeedButton;
    edt_nm_celula: TEdit;
    msk_cd_celula: TMaskEdit;
    lblCelula: TLabel;
    dbgrd_sda: TDBGrid;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_distribuirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_celulaEnter(Sender: TObject);
    procedure msk_cd_celulaExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure dbgrd_sdaDblClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure dbgrd_sdaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    Pesquisa : String;
    cd_unid_neg, cd_produto, cd_celula : String[2];
    a_str_indices : Array[0..0] Of String[60];
    procedure Atualiza_Tela_SDA;
  public
    { Public declarations }
    procedure DistribuiSDA;
  end;

var
  frm_sda_distr: Tfrm_sda_distr;

implementation

uses PGGP001, PGGP017, GSMLIB, PGSD012, PGSM018, PGSM010, PGSM044;

{$R *.DFM}

procedure Tfrm_sda_distr.DistribuiSDA;
begin
  with datm_sda_distr do
  begin
    Screen.Cursor := crHourGlass;
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_distribui_sda);
      sp_distribui_sda.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      sp_distribui_sda.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      sp_distribui_sda.ParamByName('@cd_usuario').AsString  := str_cd_usuario;
      ExecStoredProc(sp_distribui_sda);
      CloseStoredProc(sp_distribui_sda);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_sda_distr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sda_distr do
  begin
    qry_processo_sda_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_cliente_.Close;
    qry_servico_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sda_distr.msk_cd_unid_negExit(Sender: TObject);
begin
  if cd_unid_neg = Trim( msk_cd_unid_neg.Text ) then
    Exit;

  if Trim( msk_cd_unid_neg.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    with datm_sda_distr do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      if Trim( edt_nm_unid_neg.Text ) = '' then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end;
      qry_unid_neg_.Close;
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_distr.msk_cd_produtoExit(Sender: TObject);
begin
  if cd_produto = Trim( msk_cd_produto.Text ) then
    Exit;

  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    with datm_sda_distr do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      if Trim( edt_nm_produto.Text ) = '' then
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
        Exit;
      end;
      qry_produto_.Close;
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_distr.FormShow(Sender: TObject);
begin
  a_str_indices[0] := 'NR_PROCESSO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;
  cb_ordem.ItemIndex := 0;

  msk_cd_unid_neg.text := str_cd_unid_neg;
  msk_cd_produto.text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  with datm_sda_distr do
  begin
    qry_usuario_.Close;
    qry_usuario_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
    if qry_usuario_.RecordCount > 0 then
    begin
      msk_cd_celula.Text := qry_usuario_.FieldByName('CD_CELULA').AsString;
      msk_cd_celulaExit( frm_celula );
    end;
    qry_usuario_.Close;
  end;
  edt_chave.SetFocus;
end;

procedure Tfrm_sda_distr.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module Distribuição de SDA}
  Application.CreateForm( Tdatm_sda_distr, datm_sda_distr );
end;

procedure Tfrm_sda_distr.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sda_distr Do
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
end;

procedure Tfrm_sda_distr.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sda_distr do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    With frm_produto Do
    Begin
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
end;

procedure Tfrm_sda_distr.btn_distribuirClick(Sender: TObject);
begin
  Mensagem.SimpleText := 'Processando a distribuição de SDA ...';

  Application.ProcessMessages;

  try
    DistribuiSDA;
  except
    Mensagem.SimpleText := 'Erro na distribuição de SDA. processamento abortado.';
    Exit;
  end;

  with datm_sda_distr do
  begin
    qry_processo_sda_.Close;
    qry_processo_sda_.Prepare;
    qry_processo_sda_.Open;
  end;

  Mensagem.SimpleText := 'Distribuição de SDA foi processada com sucesso.';
end;

procedure Tfrm_sda_distr.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sda_distr.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_sda_distr.qry_processo_sda_,  msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_sda_distr.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_sda_distr.qry_processo_sda_NR_PROCESSO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_sda_distr.qry_processo_sda_.Close;
  datm_sda_distr.qry_processo_sda_.Prepare;
  datm_sda_distr.qry_processo_sda_.Open;
  Localiza(datm_sda_distr.qry_processo_sda_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_sda_distr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_sda_distr.msk_cd_celulaEnter(Sender: TObject);
begin
  cd_celula := Trim( msk_cd_celula.Text );
end;

procedure Tfrm_sda_distr.msk_cd_celulaExit(Sender: TObject);
begin
  if cd_celula = Trim( msk_cd_celula.Text ) then
    Exit;

  if Trim( msk_cd_celula.Text ) <> '' then
  begin
    ValCodEdt(msk_cd_celula);
    with datm_sda_distr do
    begin
      qry_celula_.Close;
      qry_celula_.ParamByName('CD_CELULA').AsString := msk_cd_celula.Text;
      qry_celula_.Prepare;
      qry_celula_.Open;
      edt_nm_celula.Text := qry_celula_.FieldByName('NM_CELULA').AsString;
      if Trim( edt_nm_celula.Text ) = '' then
      begin
        BoxMensagem( 'Célula incorreta ou inexistente!', 2 );
        msk_cd_celula.SetFocus;
        qry_celula_.Close;
        Exit;
      end;
      qry_celula_.Close;
    end;
  end
  else
  begin
    edt_nm_celula.Text := '';
  end;

  Atualiza_Tela_SDA;
end;

procedure Tfrm_sda_distr.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_celula   then btn_co_celulaClick(nil);
  end;
end;

procedure Tfrm_sda_distr.btn_co_celulaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2218';

  Application.CreateForm( Tfrm_celula, frm_celula );
  with frm_celula do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_celula.Text := Cons_OnLine_Texto;
  end;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0901';

  msk_cd_celulaExit(nil);
end;

procedure Tfrm_sda_distr.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg := Trim( msk_cd_unid_neg.Text );
end;

procedure Tfrm_sda_distr.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto := Trim( msk_cd_produto.Text );
end;

procedure Tfrm_sda_distr.Atualiza_Tela_SDA;
begin
  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
     ( Trim( msk_cd_produto.Text ) <> '' ) and
     ( Trim( msk_cd_celula.Text ) <> '' ) then
  begin
    with datm_sda_distr do
    begin
      qry_processo_sda_.Close;
      qry_processo_sda_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_processo_sda_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_processo_sda_.ParamByName('CD_CELULA').AsString   := msk_cd_celula.Text;
      qry_processo_sda_.Prepare;
      qry_processo_sda_.Open;
    end;
  end;
end;

procedure Tfrm_sda_distr.dbgrd_sdaDblClick(Sender: TObject);
var in_distr : String;
    nr_processo_sda : String[18];
    cd_usuario_distr : String[4];
begin
  with datm_sda_distr do
  begin
    if ( qry_processo_sda_.FieldByName('IN_DISTR').AsString = '1' ) then
    begin
      in_distr         := '0';
      cd_usuario_distr := '';
    end
    else
    begin
      in_distr         := '1';
      cd_usuario_distr := str_cd_usuario;
    end;

    Cria_SQL( 'UPDATE TPROCESSO_SDA SET IN_DISTR = ' + QuotedStr( in_distr ) +
              ', CD_USUARIO_DISTR = ' + QuotedStr( cd_usuario_distr ) + ' WHERE NR_PROCESSO = ' +
              QuotedStr( qry_processo_sda_.FieldByName('NR_PROCESSO').AsString ) );

    nr_processo_sda := qry_processo_sda_.FieldByName('NR_PROCESSO').AsString;
    Atualiza_Tela_SDA;
    qry_processo_sda_.Locate( 'NR_PROCESSO', nr_processo_sda, [] );
  end;
end;

procedure Tfrm_sda_distr.btn_marca_todasClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with datm_sda_distr do
  begin
    btn_marca_todas.Visible    := False;
    btn_desmarca_todas.Visible := True;
    mi_desmarca.Visible        := True;
    mi_marca.Visible           := False;
    btn_desmarca_todas.Left    := btn_marca_todas.Left;

    qry_atz_todos_.Close;
    qry_atz_todos_.ParamByName('CD_UNID_NEG').AsString      := msk_cd_unid_neg.Text;
    qry_atz_todos_.ParamByName('CD_PRODUTO').AsString       := msk_cd_produto.Text;
    qry_atz_todos_.ParamByName('CD_CELULA').AsString        := msk_cd_celula.Text;
    qry_atz_todos_.ParamByName('CD_USUARIO_DISTR').AsString := msk_cd_celula.Text;
    qry_atz_todos_.ParamByName('IN_DISTR').AsString         := '1';
    qry_atz_todos_.Prepare;
    qry_atz_todos_.ExecSQL;

    Atualiza_Tela_SDA;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sda_distr.btn_desmarca_todasClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with datm_sda_distr do
  begin
    btn_marca_todas.Visible    := True;
    btn_desmarca_todas.Visible := False;
    mi_marca.Visible           := True;
    mi_desmarca.Visible        := False;

    qry_atz_todos_.Close;
    qry_atz_todos_.ParamByName('CD_UNID_NEG').AsString      := msk_cd_unid_neg.Text;
    qry_atz_todos_.ParamByName('CD_PRODUTO').AsString       := msk_cd_produto.Text;
    qry_atz_todos_.ParamByName('CD_CELULA').AsString        := msk_cd_celula.Text;
    qry_atz_todos_.ParamByName('CD_USUARIO_DISTR').AsString := '';
    qry_atz_todos_.ParamByName('IN_DISTR').AsString         := '0';
    qry_atz_todos_.Prepare;
    qry_atz_todos_.ExecSQL;

    Atualiza_Tela_SDA;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sda_distr.dbgrd_sdaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    dbgrd_sdaDblClick(nil);
end;

end.
