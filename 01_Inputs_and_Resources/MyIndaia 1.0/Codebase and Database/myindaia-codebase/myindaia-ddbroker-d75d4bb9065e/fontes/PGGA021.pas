unit PGGA021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls, DBTABLES, Grids,
  DBGrids, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_bloqueio_evento = class(TForm)
    menu_manut: TMainMenu;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    bvl_nm_usuario: TBevel;
    dbg_evento_aplicavel: TDBCtrlGrid;
    bvl_cabecalho_grid: TBevel;
    lbl_cd_evento: TLabel;
    lbl_Evento: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    Label3: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    dbchk_aplic: TDBCheckBox;
    lbl_bloqueio: TLabel;
    Label1: TLabel;
    lbl_nm_usuario: TLabel;
    edt_nm_usuario: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure Grava;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_realizaExit(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir : Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina: String;
    { Private declarations }
  public
    cState : String[1];
    { Public declarations }
  end;

var
  frm_bloqueio_evento: Tfrm_bloqueio_evento;

implementation

uses GSMLIB, PGGA022, PGSM018, PGSM010, PGGP015, PGGP017, PGGP018, PGSM136;

{$R *.DFM}

procedure Tfrm_bloqueio_evento.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_bloqueio_evento.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_bloqueio_evento.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_bloqueio_evento, datm_bloqueio_evento );
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text  := str_nm_usuario;
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros then
     msk_nr_processo.Text := str_nr_processo;
  datm_bloqueio_evento.ds_tfollowup.AutoEdit := st_modificar;
end;

procedure Tfrm_bloqueio_evento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grava;
  datm_bloqueio_evento.Free;
  Action:= cafree;
end;

procedure Tfrm_bloqueio_evento.msk_nr_processoExit(Sender: TObject);
begin
  with datm_bloqueio_evento do
  begin
    Grava;
    qry_processo_.Close;
    qry_tfollowup_.Close;
    qry_tevento_.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
         begin
           BoxMensagem( 'Processo não encontrado!', 2 );
         end
      else
        begin
          {Habilita a tabela TFOLLOWUP}
          qry_tfollowup_.Close;
          qry_tfollowup_.ParamByName('nr_processo').AsString :=
                         msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          qry_tfollowup_.ParamByName('cd_servico').AsString  := dbedt_cd_servico.Text;
          qry_tfollowup_.Prepare;
          qry_tfollowup_.Open;
      end;
      if qry_processo_IN_LIBERADO.AsString <> '1' then
      begin
        BoxMensagem( 'Processo não está liberado!', 2 );
        msk_nr_processo.SetFocus;
      end;
      if qry_processo_IN_CANCELADO.AsString <> '0' then
      begin
        BoxMensagem( 'Processo está cancelado!', 2 );
        msk_nr_processo.SetFocus;
      end;
      if qry_processo_IN_PRODUCAO.AsString <> '1' then
      begin
        BoxMensagem( 'Processo não está em produção!', 2 );
        msk_nr_processo.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_bloqueio_evento.msk_cd_unid_negExit(Sender: TObject);
begin
  Grava;
  ValCodEdt( msk_cd_unid_neg );
  if Not ( st_unid_neg = msk_cd_unid_neg.Text ) then
  begin
    with datm_bloqueio_evento do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
        qry_unid_neg_.Close;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
      end;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end
end;

procedure Tfrm_bloqueio_evento.msk_cd_produtoExit(Sender: TObject);
begin
  Grava;
  ValCodEdt(msk_cd_produto);
  if Not ( st_produto = msk_cd_produto.Text ) then
  begin
    with datm_bloqueio_evento do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        qry_produto_.Close;
      end
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
      end;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_bloqueio_evento.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_bloqueio_evento.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

function Tfrm_bloqueio_evento.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_bloqueio_evento do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.UnPrepare;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem( 'A habilitação não esta ativa!', 2 );
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_bloqueio_evento.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    frm_bloqueio_evento.msk_cd_unid_negExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_bloqueio_evento.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    frm_bloqueio_evento.msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_bloqueio_evento.btn_processoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit (nil);
  end;
end;

procedure Tfrm_bloqueio_evento.Grava;
begin
  with datm_bloqueio_evento do
  begin
    if qry_tfollowup_.State in [dsEdit]  then qry_tfollowup_.Post;
  end;
end;

procedure Tfrm_bloqueio_evento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_bloqueio_evento.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo then btn_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_bloqueio_evento.dbedt_realizaExit(Sender: TObject);
begin
  Grava;
end;

end.
