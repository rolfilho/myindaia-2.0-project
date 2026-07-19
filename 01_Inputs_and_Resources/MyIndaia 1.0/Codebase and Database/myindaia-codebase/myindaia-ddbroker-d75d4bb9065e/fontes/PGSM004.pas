unit PGSM004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, Menus, DBCtrls, Buttons, ExtCtrls, DB;

type
  Tfrm_pesq_log = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    msk_cd_usuario: TMaskEdit;
    edt_nm_usuario: TEdit;
    btn_co_usuario: TSpeedButton;
    Label2: TLabel;
    msk_cd_tabela: TMaskEdit;
    edt_nm_tabela: TEdit;
    btn_co_tabela: TSpeedButton;
    Label3: TLabel;
    msk_cd_modulo: TMaskEdit;
    edt_nm_modulo: TEdit;
    btn_co_modulo: TSpeedButton;
    msk_cd_rotina: TMaskEdit;
    Label4: TLabel;
    edt_nm_rotina: TEdit;
    btn_co_rotina: TSpeedButton;
    Label5: TLabel;
    edt_nm_mov: TEdit;
    btn_co_mov: TSpeedButton;
    Label6: TLabel;
    msk_chave: TMaskEdit;
    lbl_periodo: TLabel;
    msk_dt_inicio: TMaskEdit;
    lbl_a: TLabel;
    msk_dt_fim: TMaskEdit;
    mi_pesquisar: TMenuItem;
    btn_pesquisa: TSpeedButton;
    msk_cd_mov: TMaskEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure msk_cd_usuarioExit(Sender: TObject);
    function Consiste : Boolean;
    procedure msk_cd_moduloExit(Sender: TObject);
    procedure msk_cd_movExit(Sender: TObject);
    procedure msk_cd_tabelaExit(Sender: TObject);
    procedure msk_cd_rotinaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_tabelaClick(Sender: TObject);
    procedure btn_co_moduloClick(Sender: TObject);
    procedure btn_co_rotinaClick(Sender: TObject);
    procedure btn_co_movClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_cd_usuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consulta_On_line( cNomeDB : String; cNomeTabela : String; fcampo : TMaskEdit; cCaption : String; cCodigo : integer );

  end;

var
  frm_pesq_log: Tfrm_pesq_log;

implementation

uses PGSM005, PGSM096, PGSM016, PGSM148, GSMLIB;

{$R *.DFM}

function Tfrm_pesq_log.Consiste : Boolean;
begin
  Consiste := True;
  {Usuário}
  if msk_cd_usuario.Text <> '' then
  begin
    ValCodEdt( msk_cd_usuario );
    with datm_pesq_log do
    begin
      qry_usuario_.Close;
      qry_usuario_.SQL[2] := 'WHERE CD_USUARIO = "' + msk_cd_usuario.Text + '"';
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if ( qry_usuario_.Locate('CD_USUARIO', msk_cd_usuario.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_usuario.Text := qry_usuario_NM_USUARIO.AsString;
      end
      else
      begin
        BoxMensagem('Usuário não cadastrado!', 2);
        msk_cd_usuario.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_usuario_.Close;
      qry_usuario_.SQL[2] := 'WHERE CD_USUARIO <> ""';
      qry_usuario_.Prepare;
      qry_usuario_.Open;
    end;
  end
  else
  begin
    edt_nm_usuario.Text := '';
  end;

  {Tabela}
  if msk_cd_tabela.Text <> '' then
  begin
    ValCodEdt( msk_cd_tabela );
    with datm_pesq_log do
    begin
      qry_tabela_.Close;
      qry_tabela_.SQL[2] := 'WHERE CD_TABELA = "' + msk_cd_tabela.Text + '"';
      qry_tabela_.Prepare;
      qry_tabela_.Open;
      if ( qry_tabela_.Locate('CD_TABELA', msk_cd_tabela.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_tabela.Text := qry_tabela_NM_TABELA.AsString;
      end
      else
      begin
        BoxMensagem('Tabela não cadastrado!', 2);
        msk_cd_tabela.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_tabela_.Close;
      qry_tabela_.SQL[2] := 'WHERE CD_TABELA <> ""';
      qry_tabela_.Prepare;
      qry_tabela_.Open;
    end;
  end
  else
  begin
    edt_nm_tabela.Text := '';
  end;

  {Módulo}
  if msk_cd_modulo.Text <> '' then
  begin
    ValCodEdt( msk_cd_modulo );
    with datm_pesq_log do
    begin
      qry_modulo_.Close;
      qry_modulo_.SQL[2] := 'WHERE CD_MODULO = "' + msk_cd_modulo.Text + '"';
      qry_modulo_.Prepare;
      qry_modulo_.Open;
      if ( qry_modulo_.Locate('CD_MODULO', msk_cd_modulo.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_modulo.Text := qry_modulo_NM_MODULO.AsString;
      end
      else
      begin
        BoxMensagem('Módulo não cadastrado!', 2);
        msk_cd_modulo.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_modulo_.Close;
      qry_modulo_.SQL[2] := 'WHERE CD_MODULO <> ""';
      qry_modulo_.Prepare;
      qry_modulo_.Open;
    end;
  end
  else
  begin
    edt_nm_modulo.Text := '';
  end;

  {Rotina}
  if msk_cd_rotina.Text <> '' then
  begin
    ValCodEdt( msk_cd_rotina );
    with datm_pesq_log do
    begin
      qry_rotina_.Close;
      qry_rotina_.SQL[2] := 'WHERE CD_ROTINA = "' + msk_cd_rotina.Text + '"';
      qry_rotina_.Prepare;
      qry_rotina_.Open;
      if ( qry_rotina_.Locate('CD_ROTINA', msk_cd_rotina.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_rotina.Text := qry_rotina_NM_ROTINA.AsString;
      end
      else
      begin
        BoxMensagem('Rotina não cadastrado!', 2);
        msk_cd_rotina.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_rotina_.Close;
      qry_rotina_.SQL[2] := 'WHERE CD_ROTINA <> ""';
      qry_rotina_.Prepare;
      qry_rotina_.Open;
    end;
  end
  else
  begin
    edt_nm_rotina.Text := '';
  end;

  {Movimentação}
  if msk_cd_mov.Text <> '' then
  begin
    with datm_pesq_log do
    begin
      qry_mov_log_.Close;
      qry_mov_log_.SQL[2] := 'WHERE CD_MOVIMENTO = "' + msk_cd_mov.Text + '"';
      qry_mov_log_.Prepare;
      qry_mov_log_.Open;
      if ( qry_mov_log_.Locate('CD_MOVIMENTO', msk_cd_mov.Text, [loCaseInsensitive]) ) then
      begin
        edt_nm_mov.Text := qry_mov_log_NM_MOVIMENTO.AsString;
      end
      else
      begin
        BoxMensagem('Movimento não cadastrado!', 2);
        msk_cd_mov.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_mov_log_.Close;
      qry_mov_log_.SQL[2] := 'WHERE CD_MOVIMENTO <> ""';
      qry_mov_log_.Prepare;
      qry_mov_log_.Open;
    end;
  end
  else
  begin
    edt_nm_mov.Text := '';
  end;

  {Periodo inicio}
  try
    if msk_dt_inicio.Text <> '  /  /    ' then StrToDate(msk_dt_inicio.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.Clear;
    end;
  end;

  {Periodo fim}
  try
    if msk_dt_fim.Text <> '  /  /    ' then StrToDate(msk_dt_fim.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.Clear;
    end;
  end;

end;

procedure Tfrm_pesq_log.msk_cd_usuarioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_cd_moduloExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_cd_movExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_cd_tabelaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_cd_rotinaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_pesq_log, datm_pesq_log );
end;

procedure Tfrm_pesq_log.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pesq_log Do
  begin
    qry_log_.Close;
    qry_modulo_.Close;
    qry_mov_log_.Close;
    qry_rotina_.Close;
    qry_tabela_.Close;
    qry_usuario_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_pesq_log.btn_co_usuarioClick(Sender: TObject);
begin
  with datm_pesq_log Do
  begin
    Application.CreateForm(Tfrm_usuario, frm_usuario );
    With frm_usuario Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_usuario.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_usuario.Text := frm_usuario.Cons_OnLine_Texto;  
      msk_cd_usuarioExit(Sender);
    end;
  end;
end;

procedure Tfrm_pesq_log.Consulta_On_line( cNomeDB : String; cNomeTabela : String; fcampo : TMaskEdit; cCaption : String; cCodigo : Integer );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := cCodigo;
  datm_consulta_padrao.Tabela.DatabaseName := cNomeDB;
  datm_consulta_padrao.Tabela.TableName    := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    fcampo.Text := Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_pesq_log.btn_co_tabelaClick(Sender: TObject);
begin
  Consulta_On_line( 'DBBROKER', 'TTABELA', msk_cd_tabela, 'Tabela', 21);
  msk_cd_tabelaExit(nil);
end;

procedure Tfrm_pesq_log.btn_co_moduloClick(Sender: TObject);
begin
  Consulta_On_line( 'DBBROKER', 'TMODULO', msk_cd_modulo, 'Modulo', 22);
  msk_cd_moduloExit(nil);
end;

procedure Tfrm_pesq_log.btn_co_rotinaClick(Sender: TObject);
begin
  Consulta_On_line( 'DBBROKER', 'TMODULO_ROTINA', msk_cd_rotina, 'Rotina', 23);
  msk_cd_rotinaExit(nil);
end;

procedure Tfrm_pesq_log.btn_co_movClick(Sender: TObject);
begin
  Consulta_On_line( 'DBBROKER', 'TTP_MOV_LOG', msk_cd_mov, 'Movimentação', 24);
  msk_cd_movExit(nil);
end;

procedure Tfrm_pesq_log.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pesq_log.btn_pesquisaClick(Sender: TObject);
var str_sql : string;
begin
  if not Consiste then
    exit;
  if msk_cd_usuario.Text <> '' then
  begin
    str_sql := 'CD_USUARIO = "' + msk_cd_usuario.Text + '"';
  end;
  if msk_cd_tabela.Text <> '' then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'CD_TABELA = "' + msk_cd_tabela.Text + '"';
  end;
  if msk_cd_modulo.Text <> '' then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'CD_MODULO = "' + msk_cd_modulo.Text + '"';
  end;
  if msk_cd_rotina.Text <> '' then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'CD_ROTINA = "' + msk_cd_rotina.Text + '"';
  end;
  if msk_cd_mov.Text <> '' then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'CD_MOVIMENTO = "' + msk_cd_mov.Text + '"';
  end;
  if msk_chave.Text <> '' then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'CD_CHAVE LIKE "%' + msk_chave.Text + '%"';
  end;
  if ( msk_dt_inicio.Text <> '' ) and ( msk_dt_inicio.Text <> '  /  /    ' ) then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'DT_MOVIMENTO >= CONVERT(DATETIME, "' + msk_dt_inicio.Text+ '", 103)';
  end;
  if ( msk_dt_fim.Text <> '' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
  begin
    if str_sql <> '' then
      str_sql := str_sql + ' AND ';
    str_sql := str_sql + 'DT_MOVIMENTO <= DATEADD(DAY,1,CONVERT(DATETIME, "' + msk_dt_fim.Text + '", 103))';
  end;
  if str_sql = '' then
    str_sql := 'CD_USUARIO <> ""';
  Screen.Cursor := crHourGlass;
  with datm_pesq_log do
  begin
    qry_log_.Close;
    qry_log_.SQL[3] := str_sql;
    qry_log_.Prepare;
    qry_log_.Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_pesq_log.msk_dt_inicioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_dt_fimExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_log.msk_cd_usuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_modulo  then btn_co_moduloClick(nil);
    if Sender = msk_cd_mov     then btn_co_movClick(nil);
    if Sender = msk_cd_rotina  then btn_co_rotinaClick(nil);
    if Sender = msk_cd_tabela  then btn_co_tabelaClick(nil);
    if Sender = msk_cd_usuario then btn_co_usuarioClick(nil);
  end;
end;

end.
