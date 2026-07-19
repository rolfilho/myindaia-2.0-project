unit uControleArmaz;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBTables, Db, PGGP001,
  DBCtrls, Menus, DBCGrids, Funcoes;

type
  Tfrm_controle_armazenagem = class(TForm)
    pnl_selecao: TPanel;
    Label6: TLabel;
    btn_cd_produto: TSpeedButton;
    Label7: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    btn_co_armazem: TSpeedButton;
    lbl_embarcacao: TLabel;
    msk_cd_armazem: TMaskEdit;
    edt_nm_armazem: TEdit;
    mi_prorrogar: TMenuItem;
    dbgrdCtrlArm: TDBGrid;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    Label1: TLabel;
    mi_pagto: TMenuItem;
    Gr_dt_vencto: TGroupBox;
    msk_data_inicio: TMaskEdit;
    msk_data_fim: TMaskEdit;
    Label3: TLabel;
    pnl_manut_cadastro: TPanel;
    lbl_nm_usuario: TLabel;
    edt_nm_usuario: TEdit;
    btn_sair: TSpeedButton;
    btn_prorrogar: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_pagto: TSpeedButton;
    Label2: TLabel;
    msk_data_pagto: TMaskEdit;
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_prorrogarClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_co_armazemClick(Sender: TObject);
    procedure msk_cd_armazemExit(Sender: TObject);
    procedure msk_cd_armazemEnter(Sender: TObject);
    procedure msk_data_inicioExit(Sender: TObject);
    procedure btn_pagtoClick(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir: Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina, str_armazem : String;
    { Private declarations }
  public
    procedure Armazem_venc;
    { Public declarations }
  end;

var
  frm_controle_armazenagem: Tfrm_controle_armazenagem;

implementation

uses PGSM039, PGSM018, PGSM010, PGGP015, PGSM036, GSMLIB,  PGSM088, ConsOnLineEx,
  pgsm241, PGSM064, PGGP017, dControleArmaz;

{$R *.DFM}

{      for i := 0 to dbgrdCtrlArm.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdCtrlArm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdCtrlArm.SelectedRows[i]));

        str_nr_processo := qry_arm_vencido_NR_PROCESSO.AsString;
        int_nr_periodo  := qry_arm_vencido_NR_PERIODO.AsInteger;
        qry_armazem_processo_.Close;
        qry_armazem_processo_.parambyname('NR_PROCESSO').AsString := str_nr_processo;
        qry_armazem_processo_.open;

        qry_armazem_processo_.locate('NR_PROCESSO;NR_PERIODO', VarArrayOf ([str_nr_processo, int_nr_periodo]), [loCaseInsensitive]);

        qry_armazem_processo_.Edit;
        qry_armazem_processo_DT_PAGTO.AsDateTime  := StrtodateTime (msk_data_vencto.text);
        qry_armazem_processo_.Post;
      end;
               }


procedure Tfrm_controle_armazenagem.btn_pagtoClick(Sender: TObject);
var i: integer;
begin
  with datm_controle_armazenagem do
  begin
    try
      datm_main.db_broker.StartTransaction;

      for i := 0 to dbgrdCtrlArm.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdCtrlArm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdCtrlArm.SelectedRows[i]));

        qry_armazem_processo_.Close;
        qry_armazem_processo_.parambyname('NR_PROCESSO').AsString := qry_arm_vencido_NR_PROCESSO.AsString;
        qry_armazem_processo_.open;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE TPROCESSO_ARMAZENAGEM SET IN_PRORROG = ''1'' WHERE NR_PROCESSO = ''' + qry_arm_vencido_NR_PROCESSO.AsString + '''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('UPDATE TPROCESSO_ARMAZENAGEM SET IN_PRORROG = ''0'', DT_PAGTO = ''' + msk_data_pagto.text + ''' WHERE NR_PROCESSO = ''' + qry_arm_vencido_NR_PROCESSO.AsString + ''' AND NR_PERIODO = ''' + qry_arm_vencido_NR_PERIODO.AsString + '''');
          ExecSQL;
          Free;
        end;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    Armazem_venc;
  end;
end;


procedure Tfrm_controle_armazenagem.Armazem_venc;
begin
  with datm_controle_armazenagem do
  begin
    qry_arm_vencido_.close;

    if msk_cd_unid_neg.Text = '' then
      qry_arm_vencido_.parambyname('CD_UNID_NEG').AsString := 'X'
    else
      qry_arm_vencido_.parambyname('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;

    if msk_cd_produto.Text = '' then
      qry_arm_vencido_.parambyname('CD_PRODUTO').AsString := 'X'
    else
      qry_arm_vencido_.parambyname('CD_PRODUTO').AsString := msk_cd_produto.Text;

    if msk_cd_armazem.Text = '' then
      qry_arm_vencido_.parambyname('CD_ARMAZEM').AsString := 'X'
    else
      qry_arm_vencido_.parambyname('CD_ARMAZEM').AsString := msk_cd_armazem.Text;

    qry_arm_vencido_.parambyname('DT_INICIO').AsDate:= strtodate(msk_data_inicio.Text);
    qry_arm_vencido_.parambyname('DT_FIM').AsDate:= strtodate(msk_data_fim.Text);
    qry_arm_vencido_.open;
    dbgrdCtrlArm.DataSource := ds_arm_vencido;
    btn_prorrogar.Enabled := qry_arm_vencido_.RecordCount > 0;
    mi_prorrogar.Enabled  := qry_arm_vencido_.RecordCount > 0;
    btn_pagto.Enabled := qry_arm_vencido_.RecordCount > 0;
    mi_pagto.Enabled  := qry_arm_vencido_.RecordCount > 0;

  end;
end;

procedure Tfrm_controle_armazenagem.btn_fecharClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_controle_armazenagem.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;
procedure Tfrm_controle_armazenagem.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text = '' then
  begin
     edt_nm_unid_neg.Text := 'Todas';
     exit;
  end;
  if Not ( st_unid_neg = msk_cd_unid_neg.Text ) then
  begin
    with datm_controle_armazenagem do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.text, [loCaseInsensitive, loPartialKey]) then
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
  end;
  Armazem_venc;
end;

procedure Tfrm_controle_armazenagem.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_controle_armazenagem.msk_cd_produtoExit(Sender: TObject);
var foco: Boolean;
begin
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text = '' then
  begin
     edt_nm_produto.Text := 'Todas';
     exit;
  end;
  if Not ( st_produto = msk_cd_produto.Text ) then
  begin
    with datm_controle_armazenagem do
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
    if foco then msk_cd_produto.SetFocus;
  end;
  Armazem_venc;
end;

function Tfrm_controle_armazenagem.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_controle_armazenagem do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_controle_armazenagem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_controle_armazenagem.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_controle_armazenagem.btn_cd_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_controle_armazenagem.btn_cd_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  End
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_controle_armazenagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_controle_armazenagem.Free;
  Action := cafree;
end;

procedure Tfrm_controle_armazenagem.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tdatm_controle_armazenagem, datm_controle_armazenagem );
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  edt_nm_usuario.Text    := str_nm_usuario;
  msk_cd_unid_neg.Text   := str_cd_unid_neg;
  msk_cd_produto.Text    := str_cd_produto;

  msk_data_inicio.Text   := datetostr(now);
  msk_data_fim.Text      := datetostr(now);

{  if str_in_ctrl_armazenagem = '1' then
  begin
    if int_nr_dias_armazenagem  > 0 then
      msk_data_fim.Text := datetostr(now + int_nr_dias_armazenagem);
  end;}

  msk_data_pagto.Text    := datetostr(now);
  msk_cd_armazem.Text    := '';
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);

  msk_cd_armazemExit(nil);


end;

procedure Tfrm_controle_armazenagem.btn_co_eventoClick(Sender: TObject);
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
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_controle_armazenagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_controle_armazenagem.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_cd_unid_negClick(btn_cd_unid_neg);
    if Sender = msk_cd_produto    then btn_cd_produtoClick(btn_cd_produto);
    if Sender = msk_cd_armazem    then btn_co_armazemClick(btn_co_armazem);
  end;
end;

procedure Tfrm_controle_armazenagem.btn_prorrogarClick(Sender: TObject);
Var
  i:integer;
  str_cd_tabela : String[3];
  str_cd_armazem : String[4];
  int_nr_periodo : Integer;
  int_nr_periodo_ant : Integer;
  str_nr_processo : String [18];
  str_sabdom : String[1];
  str_feriado : String[1];
  int_qtd_dias : Integer;
  dt_vencto : tdateTime;
begin
  with datm_controle_armazenagem do
  begin
    try
      datm_main.db_broker.StartTransaction;

      for i := 0 to dbgrdCtrlArm.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdCtrlArm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdCtrlArm.SelectedRows[i]));


        str_nr_processo := qry_arm_vencido_NR_PROCESSO.AsString;
        int_nr_periodo_ant  := qry_arm_vencido_NR_PERIODO.AsInteger;
        str_cd_tabela   := qry_arm_vencido_CD_TABELA.AsString;
        str_cd_armazem  := qry_arm_vencido_CD_ARMAZEM_DESCARGA.AsString;

        qry_arm_tabela_.Close;
        qry_arm_tabela_.parambyname('CD_ARMAZEM').AsString := str_cd_armazem;
        qry_arm_tabela_.parambyname('CD_TABELA').AsString := str_cd_tabela;
        qry_arm_tabela_.Open;

        str_sabdom := qry_arm_tabela_IN_SABDOM.AsString;
        str_feriado := qry_arm_tabela_IN_FERIADO.AsString;
        qry_arm_tabela_.Close;

        qry_arm_tab_periodo_.Close;
        qry_arm_tab_periodo_.parambyname('CD_ARMAZEM').AsString := str_cd_armazem;
        qry_arm_tab_periodo_.parambyname('CD_TABELA').AsString := str_cd_tabela;
        qry_arm_tab_periodo_.Open;

        int_nr_periodo := int_nr_periodo_ant + 1;

        if qry_arm_tab_periodo_.Locate('CD_ARMAZEM;CD_TABELA;NR_PERIODO', VarArrayOf ([str_cd_armazem, str_cd_tabela, int_nr_periodo_ant]), [loCaseInsensitive]) then
        begin

          int_qtd_dias := qry_arm_tab_periodo_QT_DIAS.AsInteger;
          dt_vencto := qry_arm_vencido_DT_VENCTO.Asdatetime;

          while  int_qtd_dias > 0 do
          begin
            dt_vencto := dt_vencto + 1;
            if str_sabdom = '0' then
            begin
              if (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'SAT') or (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'SAB') or (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'SÁB')or (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'SáB') Then
                int_qtd_dias := int_qtd_dias + 1;
              if (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'DOM' ) or (UpperCase(FormatDateTime ('ddd', dt_vencto))= 'SUN' ) Then
                int_qtd_dias := int_qtd_dias + 1;
            end;
            if str_feriado = '0' then
            begin
              qry_feriado_.close;
              qry_feriado_.parambyname('DATA').AsDateTime :=dt_vencto;
              qry_feriado_.open;
              if qry_feriado_NM_FERIADO.AsString <> '' then
                int_qtd_dias := int_qtd_dias + 1;
            end;
            int_qtd_dias := int_qtd_dias -1;
          end;
          qry_armazem_processo_.Close;
          qry_armazem_processo_.parambyname('NR_PROCESSO').AsString := str_nr_processo;
          qry_armazem_processo_.open;

          qry_armazem_processo_.locate('NR_PROCESSO;NR_PERIODO', VarArrayOf ([str_nr_processo, int_nr_periodo_ant]), [loCaseInsensitive]);
          qry_armazem_processo_.Edit;
          qry_armazem_processo_IN_PRORROG.AsString  := '1';
          qry_armazem_processo_.Post;

          if not qry_armazem_processo_.locate('NR_PROCESSO;NR_PERIODO', VarArrayOf ([str_nr_processo, int_nr_periodo]), [loCaseInsensitive]) then
          begin
            qry_armazem_processo_.Append;
            qry_armazem_processo_NR_PROCESSO.AsString := str_nr_processo;
            qry_armazem_processo_NR_PERIODO.AsInteger := int_nr_periodo;
            qry_armazem_processo_DT_VENCTO.AsDateTime := dt_vencto;
            qry_armazem_processo_CD_TABELA.AsString   := str_cd_tabela;
            qry_armazem_processo_.Post;
          end;


          qry_armazem_processo_.Close;
        end;
        qry_arm_tab_periodo_.close;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    Armazem_venc;
  end;
end;

procedure Tfrm_controle_armazenagem.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
 // mi_prorrogar.Enabled          := False;
 // btn_prorrogar.Enabled         := False;
  btn_marca_todas.Visible    := True;
  btn_desmarca_todas.Visible := False;
  mi_marca.Visible           := True;
  mi_desmarca.Visible        := False;
  if dbgrdCtrlArm.SelectedRows.Count > 0 then
     TTable(dbgrdCtrlArm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdCtrlArm.SelectedRows[0]));
  for i := 0 to dbgrdCtrlArm.SelectedRows.Count - 1 do
  begin
    dbgrdCtrlArm.SelectedRows.CurrentRowSelected := False;
    if dbgrdCtrlArm.SelectedRows.Count > 0 then
      TTable(dbgrdCtrlArm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdCtrlArm.SelectedRows[0]))
    else Break;
  end;
end;

procedure Tfrm_controle_armazenagem.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  mi_prorrogar.Enabled       := True;
  btn_prorrogar.Enabled      := True;
  mi_pagto.Enabled           := True;
  btn_pagto.Enabled          := True;
  btn_marca_todas.Visible    := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca.Visible        := True;
  mi_marca.Visible           := False;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if Not ( datm_controle_armazenagem.qry_arm_vencido_.RecordCount > 0 ) then Exit;
  datm_controle_armazenagem.qry_arm_vencido_.First;
  for i := 0 to datm_controle_armazenagem.qry_arm_vencido_.RecordCount - 1 do
  begin
    dbgrdCtrlArm.SelectedRows.CurrentRowSelected := True;
    datm_controle_armazenagem.qry_arm_vencido_.Next;
  end;
end;

procedure Tfrm_controle_armazenagem.btn_co_armazemClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    msk_cd_armazem.Text := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Descrição'],'CD_ARMAZEM',frm_main.mi_cad_amz);
    msk_cd_armazemExit(nil);
  End
  Else
    edt_nm_armazem.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',msk_cd_armazem.Text,'NM_ARMAZEM');
end;

procedure Tfrm_controle_armazenagem.msk_cd_armazemExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_armazem );
  if msk_cd_armazem.Text = '' then
  begin
     edt_nm_armazem.Text := 'Todos';
     datm_controle_armazenagem.qry_armazem_.Close;
     datm_controle_armazenagem.qry_armazem_.sql[2] := '';
     datm_controle_armazenagem.qry_armazem_.Open;
     exit;
  end;
  if Not ( str_armazem = msk_cd_armazem.Text ) then
  begin
    with datm_controle_armazenagem do
    begin
      qry_armazem_.Close;
      qry_armazem_.sql[2] := 'WHERE CD_ARMAZEM=:CD_ARMAZEM ';
      qry_armazem_.parambyname('CD_ARMAZEM').AsString := msk_cd_armazem.text;
      qry_armazem_.Open;
      edt_nm_armazem.Text := qry_armazem_NM_ARMAZEM.AsString;
      if edt_nm_armazem.Text = '' then
      begin
        edt_nm_armazem.Clear;
        BoxMensagem('Armazém não habilitado/ativo!', 2);
        msk_cd_armazem.SetFocus;
      end;
      qry_armazem_.Close;
    end;
  end;
  Armazem_venc;
end;

procedure Tfrm_controle_armazenagem.msk_cd_armazemEnter(Sender: TObject);
begin
 str_armazem := msk_cd_armazem.Text;
end;

procedure Tfrm_controle_armazenagem.msk_data_inicioExit(Sender: TObject);
begin
 Armazem_venc;
end;







end.




