unit PGGA009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBTables, Db, PGGP001,
  DBCtrls, Menus, Funcoes, PGGP017;

type
  Tfrm_evento_inspec = class(TForm)
    dbg_processos: TDBGrid;
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    Panel1: TPanel;
    lbl_nm_usuario: TLabel;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    Label1: TLabel;
    btn_processo: TSpeedButton;
    Label6: TLabel;
    btn_cd_produto: TSpeedButton;
    Label7: TLabel;
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
    Label8: TLabel;
    msk_cd_evento: TMaskEdit;
    btn_co_evento: TSpeedButton;
    edt_nm_evento: TEdit;
    msk_dt_inspecao: TMaskEdit;
    Label2: TLabel;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    lbl_nr_rcn: TLabel;
    msk_nr_rnc: TMaskEdit;
    Label3: TLabel;
    edt_nm_usuario: TEdit;
    btn_salvar: TSpeedButton;
    ckbx_conforme: TCheckBox;
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ckbx_conformeClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure msk_cd_eventoEnter(Sender: TObject);
    procedure msk_cd_eventoExit(Sender: TObject);
    function Habilita_campo_processo:Boolean;
    procedure msk_dt_inspecaoExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure msk_dt_inspecaoEnter(Sender: TObject);
    procedure habilita_followup;
    procedure dbg_processosDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    st_modificar, st_excluir, st_incluir: Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina, st_nr_processo, st_cd_cliente, st_cd_servico, st_cd_evento, st_dt_inspecao: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_evento_inspec: Tfrm_evento_inspec;

implementation

Uses PGSM039, PGSM018, PGSM010, PGGP015, PGSM036, GSMLIB, PGGA010, PGSM136;

{$R *.DFM}

procedure Tfrm_evento_inspec.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_inspec.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_evento_inspec.msk_cd_unid_negExit(Sender: TObject);
begin
  if Not (st_unid_neg = msk_cd_unid_neg.Text) then
  begin
    with datm_evento_inspec do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
      end
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
      end;
      qry_unid_neg_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end;
  if habilita_campo_processo then habilita_followup;
end;

procedure Tfrm_evento_inspec.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_evento_inspec.msk_cd_produtoExit(Sender: TObject);
var foco: Boolean;
begin
  if Not (st_produto = msk_cd_produto.Text) then
  begin
    with datm_evento_inspec do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := True;
      end;
      qry_produto_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then msk_cd_produto.SetFocus;
  end;
  if habilita_campo_processo then habilita_followup;
end;

procedure Tfrm_evento_inspec.msk_nr_processoExit(Sender: TObject);
begin
  msk_nr_processo.Text := UpperCase( msk_nr_processo.Text );
  btn_salvar.Enabled   := False;
  if ( msk_dt_inspecao.Text = '  /  /    ') or ( Trim( msk_cd_evento.Text ) = '' ) or
     ( Trim( msk_nr_processo.Text ) = ''  ) then Exit;
  habilita_followup;
  if processo_nulo( msk_nr_processo.Text ) then
  begin
    ShowMessage('Código Inválido.');
    datm_evento_inspec.qry_processo_.Close;
    Exit;
  end;

  with datm_evento_inspec do
  begin
    qry_processo_.Close;
    qry_empresa_nac_.Close;
    if not processo_nulo( msk_nr_processo.Text ) then
    begin
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        BoxMensagem( 'Processo não encontrado!', 2 );
        msk_nr_processo.Text := '';
        qry_processo_.Close;
        qry_empresa_nac_.Close;
        btn_salvar.Enabled   := False;
        msk_nr_processo.SetFocus;
        Exit;
      end
      else
      begin
        if qry_processo_IN_LIBERADO.AsString <> '1' then
          BoxMensagem( 'Processo não está liberado!', 2 )
        else
          if qry_processo_IN_CANCELADO.AsString <> '0' then
            BoxMensagem( 'Processo está cancelado!', 2 )
          else
            if qry_processo_IN_PRODUCAO.AsString <> '1' then
              BoxMensagem( 'Processo não está em produção!', 2 );
        if (qry_processo_IN_LIBERADO.AsString <> '1' ) or
           (qry_processo_IN_CANCELADO.AsString <> '0' ) or
           (qry_processo_IN_PRODUCAO.AsString <> '1' ) then
        begin
          msk_nr_processo.Text := '';
          qry_processo_.Close;
          qry_empresa_nac_.Close;
          btn_salvar.Enabled := False;
          Exit;
        end
        else
        begin
          btn_salvar.Enabled := st_modificar;
        end;
      end;
    end;

  end {with};
  {Verifica a existencia de um evento em um processo com data igual ou diferente}
  with datm_evento_inspec.qry_tfollowup_1_ do
  begin
    Close;
    ParamByName('CD_EVENTO').AsString   := msk_cd_evento.Text;
    ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
    Prepare;
    Open;
    if RecordCount > 0 then
    begin
      if FieldByName('DT_REALIZACAO').AsString = '' then
      begin
        BoxMensagem('Este evento ainda não foi realizado.', 2);
        btn_salvar.Enabled := False;
        msk_nr_processo.SetFocus;
        Exit;
      end;

      if FieldByName('DT_INSPECAO').AsString <> '' then
      begin
        if BoxMensagem( 'Este evento foi inspecionado no ' +
                        'dia ' + FieldByName('DT_INSPECAO').AsString +
                        '. ' + #13 + 'Deseja alterá-la para o dia ' + msk_dt_inspecao.Text +
                        ' ?', 1 ) then
        begin
          Edit;
          FieldByName('DT_INSPECAO').AsString := msk_dt_inspecao.Text;
          if ckbx_conforme.Checked then FieldByName('CD_RESULT_INSPECAO').AsString := 'C'
          else FieldByName('CD_RESULT_INSPECAO').AsString := 'N';
          FieldByName('NR_RNC').AsString := msk_nr_rnc.Text;
          Post;
          datm_evento_inspec.qry_tfollowup_.Close;
          datm_evento_inspec.qry_tfollowup_.Prepare;
          datm_evento_inspec.qry_tfollowup_.Open;
        end;
      end;
      Exit;
    end
    else
    begin
      BoxMensagem('Evento não encontrado', 2);
      msk_nr_processo.SetFocus;
      btn_salvar.Enabled := False;
      msk_nr_processo.SetFocus;
      Exit;
    end;
  end;
end;

function Tfrm_evento_inspec.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_evento_inspec do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não está ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_evento_inspec.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_inspec.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_evento_inspec.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_inspec.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  With frm_produto Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_inspec.btn_processoClick(Sender: TObject);
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
    ckbx_conforme.SetFocus;
  end;
  habilita_followup;
end;

procedure Tfrm_evento_inspec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_evento_inspec.Free;
  Action := cafree;
end;

procedure Tfrm_evento_inspec.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tdatm_evento_inspec, datm_evento_inspec );
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text  := str_nm_usuario;
  msk_cd_unid_neg.text := str_cd_unid_neg;
  msk_cd_produto.text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros then
     msk_nr_processo.Text := str_nr_processo;
  datm_evento_inspec.ds_tfollowup.AutoEdit := st_modificar;
  msk_cd_evento.setfocus;
end;

procedure Tfrm_evento_inspec.ckbx_conformeClick(Sender: TObject);
begin
  msk_nr_rnc.Enabled := Not ckbx_conforme.Checked;
  if msk_nr_rnc.Enabled then
  begin
    msk_nr_rnc.Color   := clwindow;
    msk_nr_rnc.TabStop := True;
  end
  else
  begin
    msk_nr_rnc.Color   := clmenu;
    msk_nr_rnc.Clear;
    msk_nr_rnc.TabStop := False;
  end;
end;

procedure Tfrm_evento_inspec.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  Application.CreateForm(Tfrm_evento, frm_evento);
  with frm_evento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
    msk_cd_eventoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_evento_inspec.msk_cd_eventoEnter(Sender: TObject);
begin
  st_cd_evento:= msk_cd_evento.Text;
end;

procedure Tfrm_evento_inspec.msk_cd_eventoExit(Sender: TObject);
var st_cd_evento_l:String;
begin
  st_cd_evento_l := st_cd_evento;
  try
    msk_cd_evento.Text := StrZero(StrToInt(msk_cd_evento.Text), 3);
  except
  on EConvertError do
  end;
  if (st_cd_evento <> msk_cd_evento.Text) then
  begin
    with datm_evento_inspec do
    begin
      qry_tevento_.Close;
      qry_tevento_.ParamByName('CD_EVENTO').AsString:= msk_cd_evento.Text;
      qry_tevento_.Prepare;
      qry_tevento_.Open;
      if qry_tevento_.Recordcount > 0 then
      begin
        if qry_tevento_IN_INSPECIONAVEL.Value = '1' then
           edt_nm_evento.Text := qry_tevento_nm_evento.AsString
        else
        begin
          BoxMensagem('Evento não inspecionável.', 2);
          edt_nm_evento.Clear;
          msk_cd_evento.SetFocus;
          st_cd_evento:= st_cd_evento_l;
        end;
      end;
      if qry_tevento_.Recordcount = 0 then
      begin
        BoxMensagem('Evento não encontrado.', 2);
        edt_nm_evento.Clear;
        msk_cd_evento.SetFocus;
        st_cd_evento := st_cd_evento_l;
      end;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
  end;
  if habilita_campo_processo then habilita_followup;
end;

function Tfrm_evento_inspec.Habilita_campo_processo:Boolean;
var libera: Boolean;
begin
  libera := True;
  if edt_nm_unid_neg.Text = '' then libera := False;
  if edt_nm_produto.Text  = '' then libera := False;
  if msk_cd_evento.Text   = '' then libera := False;
  if msk_dt_inspecao.text = '  /  /    ' then libera := False;

  msk_nr_processo.Enabled := Libera;
  btn_processo.Enabled    := Libera;
  ckbx_conforme.Enabled   := Libera;
  msk_nr_rnc.Enabled      := Libera;
  if libera then
  begin
    msk_nr_processo.Color := clwindow;
    msk_nr_rnc.Color      := clwindow;
  end
  else
  begin
    msk_nr_processo.Color := clmenu;
    msk_nr_rnc.Color      := clmenu;
    msk_nr_rnc.Text       := '';
  end;
  Habilita_campo_processo := Libera;
  if msk_nr_processo.Enabled then msk_nr_processo.SetFocus;
end;

procedure Tfrm_evento_inspec.msk_dt_inspecaoExit(Sender: TObject);
begin
  habilita_campo_processo;
  if (msk_dt_inspecao.text = '  /  /    ') then
  begin
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    Exit;
  end;
  try
    StrToDate(msk_dt_inspecao.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data inválida.',2);
      msk_nr_processo.Text := '';
      msk_nr_processoExit(nil);
      Exit;
    end;
  end;
  if (st_dt_inspecao <> msk_dt_inspecao.Text) then
  begin
    msk_nr_processo.Text := '';
  end;
  msk_nr_processoExit(nil);
  if habilita_campo_processo then habilita_followup;
end;

procedure Tfrm_evento_inspec.btn_salvarClick(Sender: TObject);
begin
  if processo_nulo( msk_nr_processo.Text ) then
  begin
    BoxMensagem('Número de processo inválido.',2);
    ActiveControl := nil;
    msk_nr_processo.SetFocus;
    Exit;
  end;

  with datm_evento_inspec.qry_tfollowup_1_ do
  begin
    Edit;
    FieldByName('DT_INSPECAO').AsString := msk_dt_inspecao.Text;
    if ckbx_conforme.Checked then FieldByName('CD_RESULT_INSPECAO').AsString := 'C'
    else FieldByName('CD_RESULT_INSPECAO').AsString := 'N';
    FieldByName('NR_RNC').AsString := msk_nr_rnc.Text;
    Post;
    Close;
    Prepare;
    Open;
    datm_evento_inspec.qry_tfollowup_.Close;
    datm_evento_inspec.qry_tfollowup_.Prepare;
    datm_evento_inspec.qry_tfollowup_.Open;
  end;
  msk_nr_processo.Text := '';
  msk_nr_rnc.Text      := '';
  btn_salvar.Enabled   := False;
end;

procedure Tfrm_evento_inspec.msk_dt_inspecaoEnter(Sender: TObject);
begin
  st_dt_inspecao := msk_dt_inspecao.Text;
end;

procedure Tfrm_evento_inspec.habilita_followup;
begin
  {Habilita a tabela TFOLLOWUP}
  with datm_evento_inspec do
  begin
    qry_tevento_.Close;
    qry_empresa_nac_.Close;
    qry_tfollowup_.Close;
    qry_tfollowup_.ParamByName('DT_INSPECAO').AsDate := StrToDate(msk_dt_inspecao.Text);
    qry_tfollowup_.ParamByName('CD_EVENTO').AsString := msk_cd_evento.Text;
    qry_tfollowup_.Prepare;
    qry_tfollowup_.Open;
  end;
end;

procedure Tfrm_evento_inspec.dbg_processosDblClick(Sender: TObject);
begin
  if Not datm_evento_inspec.qry_tfollowup_.Active then Exit;
  Application.CreateForm(Tfrm_observacoes_processo, frm_observacoes_processo);
  with datm_evento_inspec do
  begin
    st_nr_processo := qry_tfollowup_NR_PROCESSO.Value;
    st_cd_cliente  := qry_tfollowup_Look_cd_cliente.Value;
    st_cd_servico  := qry_tfollowup_CD_SERVICO.Value;
  end;

  frm_observacoes_processo.Configura('310', st_nr_processo, st_cd_cliente, st_cd_servico);
  frm_observacoes_processo.ShowModal;
end;

procedure Tfrm_evento_inspec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_evento_inspec.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(nil);
    if Sender = msk_cd_evento   then btn_co_eventoClick(nil);
    if Sender = msk_nr_processo then btn_processoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

end.
