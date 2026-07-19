unit PGPE039;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls, Funcoes, ConsOnlineEx;

type
  Tfrm_exp_saque = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    mi_salvar: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_saque: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    pnl_entrada_de_dados: TPanel;
    lbl_cd_ddbroker: TLabel;
    dbedt_cd_termo_pagto: TDBEdit;
    mi_cancelar: TMenuItem;
    dbedt_nm_termo_pagto: TDBEdit;
    btn_co_termo_pagto: TSpeedButton;
    lbl_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    lbl_nr_saque: TLabel;
    Label2: TLabel;
    dbedt_dt_emissao: TDBEdit;
    Label3: TLabel;
    dbedt_qt_dias_pagto: TDBEdit;
    dblkcbox_tp_vcto: TDBLookupComboBox;
    Label47: TLabel;
    dbedt_dt_outra: TDBEdit;
    Label5: TLabel;
    dbedt_dt_vcto_saque: TDBEdit;
    Label4: TLabel;
    dbedt_vl_total: TDBEdit;
    dbm_value: TDBMemo;
    Label6: TLabel;
    dbm_observacao: TDBMemo;
    Label7: TLabel;
    dblkcbox_tp_empresa_pagto: TDBLookupComboBox;
    Label8: TLabel;
    btn_co_value: TSpeedButton;
    btn_co_obs: TSpeedButton;
    btn_co_proc_new: TSpeedButton;
    mskedt_nr_saque: TMaskEdit;
    Label1: TLabel;
    dblckpbox_tp_indicador: TDBLookupComboBox;
    lbl_indicador: TLabel;
    Label9: TLabel;
    dbedt_nr_parcelas: TDBEdit;
    lbl_pesquisa: TLabel;
    edt_chave: TEdit;
    lbl_ordem_pesquisa: TLabel;
    cb_ordem: TComboBox;
    shp1: TShape;
    pnlAux: TPanel;
    lbl_cd_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    Label10: TLabel;
    dbedtNrFatura: TDBEdit;
    btnFat: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_saqueChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_saqueChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_obsClick(Sender: TObject);
    procedure dbm_observacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_valueClick(Sender: TObject);
    procedure dbedt_cd_termo_pagtoExit(Sender: TObject);
    procedure btn_co_termo_pagtoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure dblkcbox_tp_vctoClick(Sender: TObject);
    procedure dbedt_dt_outraExit(Sender: TObject);
    procedure mskedt_nr_saqueExit(Sender: TObject);
    procedure dbedt_qt_dias_pagtoExit(Sender: TObject);
    procedure dbedt_qt_dias_pagtoChange(Sender: TObject);
    procedure dblckpbox_tp_indicadorExit(Sender: TObject);
    procedure dbm_valueEnter(Sender: TObject);
    procedure btnFatClick(Sender: TObject);
    procedure dbedtNrFaturaExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;

    procedure Proc_Saque( lMostra : Boolean );
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto  : String;
  end;

var
  frm_exp_saque: Tfrm_exp_saque;

implementation

uses GSMLIB, PGPE040, PGGP017, PGGP001, PGSM006, PGSM018, PGGP025, PGSM136;

{$R *.DFM}

procedure Tfrm_exp_saque.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_exp_saque.btn_incluirClick(Sender: TObject);
begin
  with datm_exp_saque do
  begin
    qry_exp_saque_.DisableControls;
    qry_exp_saque_.Cancel;
    qry_exp_saque_.Append;
    qry_exp_saque_.EnableControls;
  end;
  pgctrl_saque.ActivePage := ts_dados_basicos;

  Desabilita_Entrada;

  Btn_Mi(False, True, True, False );

  lbl_processo.Enabled       := True;

  Proc_Saque( True );

  lbl_nr_saque.Enabled     := True;

  if dblkcbox_tp_vcto.KeyValue <> '2' then
  begin
    dbedt_dt_outra.Color    := clMenu;
    dbedt_dt_outra.ReadOnly := True;
    dbedt_dt_outra.TabStop  := False;
  end;

  dbedt_dt_vcto_saque.Color    := clMenu;
  dbedt_dt_vcto_saque.ReadOnly := True;
  dbedt_dt_vcto_saque.TabStop  := False;

  //dbedt_vl_total.Color    := clMenu;
  //dbedt_vl_total.ReadOnly := True;
  //dbedt_vl_total.TabStop  := False;

  msk_nr_processo.Text := '';
  mskedt_nr_saque.Text    := '';

  msk_nr_processo.SetFocus;
end;

procedure Tfrm_exp_saque.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  with datm_exp_saque do
  begin
    qry_proc_exp_.Close;
    qry_emp_nac_.Close;
    qry_exp_saque_.Close;
    qry_ttp_data_.Close;
    qry_ttp_para_.Close;

    Free;

  end;

  Action := caFree;

end;

procedure Tfrm_exp_saque.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module}
  Application.CreateForm( Tdatm_exp_saque, datm_exp_saque );

  with datm_exp_saque do
  begin
    ds_proc_exp.AutoEdit := st_modificar;
    qry_proc_exp_.Close;
    qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
    qry_proc_exp_.Prepare;
    qry_proc_exp_.Open;
  end;

  a_str_indices[0] := 'NR_PROCESSO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  datm_exp_saque.qry_exp_saque_.Close;
  datm_exp_saque.qry_exp_saque_.Prepare;
  datm_exp_saque.qry_exp_saque_.Open;

  datm_exp_saque.qry_ttp_data_.Close;
  datm_exp_saque.qry_ttp_data_.Prepare;
  datm_exp_saque.qry_ttp_data_.Open;

  datm_exp_saque.qry_ttp_para_.Close;
  datm_exp_saque.qry_ttp_para_.Prepare;
  datm_exp_saque.qry_ttp_para_.Open;

  datm_exp_saque.qry_tp_indicador_periodo_.Close;
  datm_exp_saque.qry_tp_indicador_periodo_.Prepare;
  datm_exp_saque.qry_tp_indicador_periodo_.Open;

  datm_exp_saque.qry_termo_pagto_.Close;
  datm_exp_saque.qry_termo_pagto_.Prepare;
  datm_exp_saque.qry_termo_pagto_.Open;

end;

procedure Tfrm_exp_saque.btn_excluirClick(Sender: TObject);
var
 cProcesso : String[18];
 cNrSaque  : String[10];

begin
  if BoxMensagem( 'Este Processo/Saque será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;

    cProcesso := datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString;
    cNrSaque  := datm_exp_saque.qry_proc_exp_NR_SAQUE.AsString;

    datm_exp_saque.qry_proc_exp_.Close;
    datm_exp_saque.qry_exp_saque_.Close;

    datm_exp_saque.qry_exec_sp_.SQL.Clear;
    datm_exp_saque.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_saque_exclui "' + cProcesso + '","' + cNrSaque + '"' );
    datm_exp_saque.qry_exec_sp_.ExecSQL;

    datm_main.db_broker.Commit;

    datm_exp_saque.qry_proc_exp_.Close;
    datm_exp_saque.qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    datm_exp_saque.qry_proc_exp_.Prepare;
    datm_exp_saque.qry_proc_exp_.Open;

    datm_exp_saque.qry_exp_saque_.Close;
    datm_exp_saque.qry_exp_saque_.Prepare;
    datm_exp_saque.qry_exp_saque_.Open;

    if datm_exp_saque.qry_proc_exp_.EOF then
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;

  except
    on E: Exception do
    begin
      datm_exp_saque.qry_proc_exp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_saque.ActivePage := ts_lista;
  pgctrl_saqueChange(nil);
end;

procedure Tfrm_exp_saque.FormShow(Sender: TObject);
begin
  pgctrl_saque.ActivePage := ts_lista;
  edt_chave.SetFocus;
  lNaoConsiste := False;

  datm_exp_saque.qry_unid_neg_.Close;
  datm_exp_saque.qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
  datm_exp_saque.qry_unid_neg_.Prepare;
  datm_exp_saque.qry_unid_neg_.Open;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  edt_nm_unid_neg.Text := datm_exp_saque.qry_unid_neg_NM_UNID_NEG.AsString;
end;

procedure Tfrm_exp_saque.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  dbedt_dt_outraExit(nil);
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_exp_saque.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_exp_saque.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString;

  edt_chave.Text := '';
  datm_exp_saque.qry_proc_exp_.Close;
  datm_exp_saque.qry_proc_exp_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_exp_saque.qry_proc_exp_.Prepare;
  datm_exp_saque.qry_proc_exp_.Open;
  Localiza(datm_exp_saque.qry_proc_exp_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_exp_saque.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_exp_saque.qry_proc_exp_, Trim( msk_cd_unid_neg.Text ) + '02' + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_exp_saque.Consiste : Boolean;
var
  P: Integer;
  S1, S2: String;
begin
  if datm_exp_saque.qry_exp_saque_.State in [dsEdit, dsInsert] then
  begin
    if Not lNaoConsiste then
    begin
      if msk_nr_processo.Text = '' then
      begin
        BoxMensagem('Processo deve ser preenchido!', 2);
        pgctrl_saque.ActivePage := ts_dados_basicos;
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if not (dbedt_cd_termo_pagto.Text = '') then
    begin
      ValidCodigo( dbedt_cd_termo_pagto );
      if dbedt_nm_termo_pagto.Text = '' then
      begin
        BoxMensagem('Código do Termo de Pagamento inválido !',2);
        pgctrl_saque.ActivePage := ts_dados_basicos;
        dbedt_cd_termo_pagto.SetFocus;
        Consiste := False;
        Exit;
      end;

    end;

    if (dbedtNrFatura.Text <> '') and (ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_GRUPO') = '028') then
    begin
      S1 := dbedtNrFatura.Text;
      while S1 <> '' do
      begin
        P := Pos(',', S1);
        if P < 1 then
          P:= Length(S1) +1;
        S2:= Copy(S1, 1, P-1);
        Delete(S1, 1, P);
        //if (ConsultaLookUpSQL('SELECT NR_FATURA FROM TPROCESSO_EXP_PEDIDO (NOLOCK) WHERE NR_PROCESSO = "' + str_nr_processo + '" AND NR_FATURA = "' + Trim(dbedtNrFatura.Text) + '" ',
        if (ConsultaLookUpSQL('SELECT NR_FATURA FROM TPROCESSO_EXP_PEDIDO (NOLOCK) WHERE NR_PROCESSO = "' + str_nr_processo + '" AND NR_FATURA = "' + Trim(S2) + '" ',
            'NR_FATURA') = '') and
           (dbedtNrFatura.Text <> datm_exp_saque.qry_processo_NR_FATURA.AsString) then
        begin
          ShowMessage('Nr. Fatura ''' + S2 + ''' inválida !');
          pgctrl_saque.ActivePage := ts_dados_basicos;
          dbedtNrFatura.SetFocus;
          dbedtNrFatura.SelStart  := Length(dbedtNrFatura.Text) - Length(S1);
          dbedtNrFatura.SelLength := Length(S2);
          Consiste := False;
          Exit;
        end;
      end;

    end;

    if Not lNaoConsiste then
    begin
      if datm_exp_saque.qry_exp_saque_TP_EMPRESA_PAGTO.AsString = '' then
      begin
        BoxMensagem('Campo Para deve ser preenchido !',2);
        pgctrl_saque.ActivePage := ts_dados_basicos;
        dblkcbox_tp_empresa_pagto.SetFocus;
        Consiste := False;
        Exit;
      end;

      if dbm_value.text = '' then
      begin
        BoxMensagem('Campo Value deve ser preenchido!', 2);
        pgctrl_saque.ActivePage := ts_dados_basicos;
        dbm_value.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

function Tfrm_exp_saque.Grava : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    with datm_exp_saque do
    begin
      if ( qry_exp_saque_.State in [dsInsert, dsEdit] ) then
        qry_exp_saque_.Post;

      datm_main.db_broker.Commit;
      Grava := True;

      qry_proc_exp_.Close;
      qry_proc_exp_.Prepare;
      qry_proc_exp_.Open;
      qry_proc_exp_.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive]);

      qry_exp_saque_.Close;
      qry_exp_saque_.Prepare;
      qry_exp_saque_.Open;
    end;

  except
    on E: Exception do
    begin
      datm_exp_saque.qry_exp_saque_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

  pgctrl_saque.SetFocus;
end;

function Tfrm_exp_saque.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_exp_saque.qry_exp_saque_.State in [dsEdit] ) and st_modificar ) or
     ( datm_exp_saque.qry_exp_saque_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Saque foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_exp_saque.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_exp_saque.Cancelar;
begin
  try
    if datm_exp_saque.qry_exp_saque_.State in [dsInsert, dsEdit] then
    begin
      datm_exp_saque.qry_exp_saque_.Cancel;
      pgctrl_saque.ActivePage := ts_lista;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_exp_saque.pgctrl_saqueChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_exp_saque.pgctrl_saqueChange(Sender: TObject);
begin
  if (pgctrl_saque.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled           := True;
    edt_chave.Enabled       := True;
    cb_ordem.Enabled        := True;
    lbl_cd_unid_neg.Enabled := True;
    btn_co_unid_neg.Enabled := True;
    msk_cd_unid_neg.Enabled := True;
    edt_nm_unid_neg.Enabled := True;
    btn_incluir.Enabled     := True;
    mi_incluir.Enabled      := True;

    if Not ( datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString = '' ) then
    begin
      btn_excluir.Enabled := True;
      mi_excluir.Enabled  := True;
    end
    else
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;
  end
  else
  begin
    msk_nr_processo.Text := Copy( datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString, 5, 14);
    mskedt_nr_saque.Text := datm_exp_saque.qry_proc_exp_NR_SAQUE.AsString;
    str_nr_processo      := datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString;
    datm_exp_saque.qry_exp_saque_.Close;
    datm_exp_saque.qry_exp_saque_.ParamByName('NR_PROCESSO').AsString := datm_exp_saque.qry_proc_exp_NR_PROCESSO.AsString;
    datm_exp_saque.qry_exp_saque_.ParamByName('NR_SAQUE').AsString    := datm_exp_saque.qry_proc_exp_NR_SAQUE.AsString;
    datm_exp_saque.qry_exp_saque_.Prepare;
    datm_exp_saque.qry_exp_saque_.Open;

    datm_exp_saque.qry_processo_.Close;
    datm_exp_saque.qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_saque.qry_processo_.Prepare;
    datm_exp_saque.qry_processo_.Open;

    if Not ( datm_exp_saque.qry_exp_saque_NR_PROCESSO.AsString = '' ) then
    begin
      Habilita_Entrada;
      dbedtNrFatura.Enabled := (ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_GRUPO') = '028');
      btnFat.Enabled :=  (dbedtNrFatura.Enabled);
      if dbedtNrFatura.Enabled then
        dbedtNrFatura.Color := clWindow
      else
        dbedtNrFatura.Color := clMenu;


      dbnvg.Enabled           := False;
      edt_chave.Enabled       := False;
      cb_ordem.Enabled        := False;

      btn_salvar.Enabled      := False;
      mi_salvar.Enabled       := False;
      btn_cancelar.Enabled    := False;
      mi_cancelar.Enabled     := False;

      btn_incluir.Enabled     := True;
      mi_incluir.Enabled      := True;
      btn_excluir.Enabled     := True;
      mi_excluir.Enabled      := True;

      Proc_Saque( False );
    end
    else
      Desabilita_Entrada;
  end;
end;

procedure Tfrm_exp_saque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;


procedure Tfrm_exp_saque.btn_co_obsClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if datm_exp_saque.qry_exp_saque_.State in [dsBrowse, dsInactive] then datm_exp_saque.qry_exp_saque_.Edit;
    datm_exp_saque.qry_exp_saque_TX_OBSERVACAO.AsString := ConsultaOnlineEx('TOBSERVACOES', 'Observações', ['CD_OBS', 'TX_DESCRICAO'],
                                                           ['Código', 'Descrição'], 'TX_OBS', nil, 1, dbm_value.Text);
  end;

end;

procedure Tfrm_exp_saque.dbm_observacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo      then btn_co_proc_newClick(btn_co_proc_new);
    if Sender = dbedt_cd_termo_pagto then btn_co_termo_pagtoClick(btn_co_termo_pagto);
    if Sender = dbm_value            then btn_co_valueClick(btn_co_value);
    if Sender = dbm_observacao       then btn_co_obsClick(btn_co_obs);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      str_nr_processo := frm_pesq_proc.PesqNrProcesso;
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_exp_saque.btn_co_valueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if datm_exp_saque.qry_exp_saque_.State in [dsBrowse, dsInactive] then datm_exp_saque.qry_exp_saque_.Edit;
    datm_exp_saque.qry_exp_saque_TX_VALUE.AsString := ConsultaOnlineEx('TOBSERVACOES', 'Observações', ['CD_OBS', 'TX_DESCRICAO'],
                                                      ['Código', 'Descrição'], 'TX_OBS', nil, 1, dbm_value.Text);
  end;

end;

procedure Tfrm_exp_saque.dbedt_cd_termo_pagtoExit(Sender: TObject);
begin
  with datm_exp_saque do
  begin
    if datm_exp_saque.qry_exp_saque_.State in [dsEdit, dsInsert] then
    begin
      if Not ( dbedt_cd_termo_pagto.Text = '') then
        ValidCodigo( dbedt_cd_termo_pagto );

      lNaoConsiste := True;
      Consiste;
      lNaoConsiste := False;

      if Trim( dbedt_nm_termo_pagto.Text ) <> '' then
      begin
        qry_termo_pagto_.Locate( 'CD_TERMO_PAGTO', dbedt_cd_termo_pagto.Text, [loCaseInsensitive] );
        if not (qry_termo_pagto_.EOF) then
        begin
          qry_exp_saque_QT_DIAS_PAGTO.AsString := qry_termo_pagto_NR_PERIODICIDADE.AsString;
          qry_exp_saque_TP_INDICADOR.AsString  := qry_termo_pagto_TP_INDICADOR.AsString;
          qry_exp_saque_NR_PARCELAS.AsString   := qry_termo_pagto_NR_PARCELAS.AsString;
        end;
      end;
    end;
  end;
  dblkcbox_tp_vctoClick(nil);
end;

procedure Tfrm_exp_saque.btn_co_termo_pagtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if datm_exp_saque.qry_exp_saque_.State in [dsBrowse, dsInactive] then datm_exp_saque.qry_exp_saque_.Edit;
    datm_exp_saque.qry_exp_saque_CD_TERMO_PAGTO.AsString := ConsultaOnlineEx('TTERMO_PAGTO', 'Termo de Pagamento',
                                                   ['CD_TERMO_PAGTO', 'NM_TERMO_PAGTO'],
                                                   ['Código', 'Descrição'], 'CD_TERMO_PAGTO', nil, 1, dbedt_cd_termo_pagto.Text);
  end else
    dbedt_nm_termo_pagto.Text := ConsultaLookUp('TTERMO_PAGTO', 'CD_TERMO_PAGTO', datm_exp_saque.qry_exp_saque_CD_TERMO_PAGTO.AsString, 'NM_TERMO_PAGTO');
  dbedt_cd_termo_pagtoExit(nil);
end;

procedure Tfrm_exp_saque.msk_cd_unid_negExit(Sender: TObject);
var
   nNumero : Double;
   bAchou  : Boolean;

begin
  nNumero := 0;

  with datm_exp_saque do
  begin
    msk_cd_unid_neg.Text := Trim( msk_cd_unid_neg.Text );
    if Trim( msk_cd_unid_neg.Text ) <> '' then
       nNumero := StrToFloat(msk_cd_unid_neg.Text);

    msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
    if ( msk_cd_unid_neg.Text <> '' ) then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      bAchou := qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;

        if not (qry_unid_neg_.EOF) then
           edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' )  then
      edt_nm_unid_neg.Text := '';

    qry_proc_exp_.Close;
    qry_proc_exp_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_proc_exp_.Prepare;
    qry_proc_exp_.Open;

  end;
end;

procedure Tfrm_exp_saque.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
  end;

end;

procedure Tfrm_exp_saque.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo        := '23';
  str_cd_rotina        := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  vStr_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_unid_negExit(nil);

end;

procedure Tfrm_exp_saque.btn_co_proc_newClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE ');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP PE ( NOLOCK ) ON PE.NR_PROCESSO = PR.NR_PROCESSO ');
  vListAux.Add('WHERE CD_PRODUTO  = "02" ');
  vListAux.Add('  AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ');
  vListAux.Add('  AND PR.IN_CANCELADO = "0" ');
  str_nr_processo := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  msk_nr_processo.Text := Copy( str_nr_processo, 5, 14 );
  vListAux.Free;
end;

procedure Tfrm_exp_saque.msk_nr_processoExit(Sender: TObject);
var
  vQryAux : TQuery;
begin
  if msk_nr_processo.ReadOnly then Exit;

  if msk_nr_processo.Text <> '' then  begin
    try
      vQryAux := TQuery.Create(application);
      vQryAux.DatabaseName := 'DBBroker';
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT PR.NR_PROCESSO FROM TPROCESSO PR ( NOLOCK ) ');
      vQryAux.SQL.Add('  INNER JOIN TPROCESSO_EXP PE ( NOLOCK ) ON PE.NR_PROCESSO = PR.NR_PROCESSO ');
      vQryAux.SQL.Add('WHERE PR.NR_PROCESSO = "' + Trim( msk_cd_unid_neg.Text ) + '02' + msk_nr_processo.Text + '" ');
      vQryAux.SQL.Add('  AND PR.IN_CANCELADO = "0" ');
      vQryAux.Open;
      //verifica existência de processo
      if vQryAux.IsEmpty then
      begin
        ShowMessage( 'Nr. Processo não existente! ');
        msk_nr_processo.Text := '';
        Cancelar;
        Exit;
      end;
      str_nr_processo := vQryAux.Fields[0].AsString;
      msk_nr_processo.Text := Copy( str_nr_processo, 5, 14 );
      //abre qry de processo
      datm_exp_saque.qry_processo_.Close;
      datm_exp_saque.qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_saque.qry_processo_.Prepare;
      datm_exp_saque.qry_processo_.Open;

    finally
      vQryAux.Free;
    end;
  end;
end;

procedure Tfrm_exp_saque.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       := True;
  end;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := True;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;

  if dblkcbox_tp_vcto.KeyValue <> '2' then
  begin
    dbedt_dt_outra.ReadOnly := True;
    dbedt_dt_outra.TabStop := False;
  end;

  lbl_cd_unid_neg.Enabled := False;
  btn_co_unid_neg.Enabled := False;
  msk_cd_unid_neg.Enabled := False;
  edt_nm_unid_neg.Enabled := False;

  dbedt_dt_vcto_saque.ReadOnly := True;
  dbedt_dt_vcto_saque.TabStop := False;

end;


procedure Tfrm_exp_saque.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TComboBox ) then
       TComboBox( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
    if ( Components[i] is  TDBMemo ) then
       TDbMemo( Components[i] ).Enabled       :=  False;
  end;

  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := btn_sair.Enabled;
end;


procedure Tfrm_exp_saque.dblkcbox_tp_vctoClick(Sender: TObject);
begin
  if (datm_exp_saque.qry_exp_saque_.State in [dsEdit, dsInsert]) and
     (pgctrl_saque.ActivePage = ts_dados_basicos) then
  begin
    dbedt_dt_outra.TabStop := False;
    dbedt_dt_outra.ReadOnly := True;
    datm_exp_saque.qry_exp_saque_DT_VCTO_SAQUE.AsString := '';

    if dblkcbox_tp_vcto.KeyValue = '0' then
    begin
      datm_exp_saque.qry_processo_.Close;
      datm_exp_saque.qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_saque.qry_processo_.Prepare;
      datm_exp_saque.qry_processo_.Open;
      datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString := datm_exp_saque.qry_processo_DT_FATURA.AsString;
    end
    else if dblkcbox_tp_vcto.KeyValue = '1' then
    begin
      datm_exp_saque.qry_ret_data_.Close;
      datm_exp_saque.qry_ret_data_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_saque.qry_ret_data_.Prepare;
      datm_exp_saque.qry_ret_data_.Open;
      datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString := datm_exp_saque.qry_ret_data_DT_REALIZACAO.AsString;
    end
    else if dblkcbox_tp_vcto.KeyValue = '2' then
    begin
      datm_exp_saque.qry_ret_prev_carregamento_.Close;
      datm_exp_saque.qry_ret_prev_carregamento_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_saque.qry_ret_prev_carregamento_.Prepare;
      datm_exp_saque.qry_ret_prev_carregamento_.Open;
      datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString := datm_exp_saque.qry_ret_prev_carregamento_DT_REALIZACAO.AsString;
    end
    else if dblkcbox_tp_vcto.KeyValue = '3' then
    begin
      dbedt_dt_outra.Color := clWindow;
      dbedt_dt_outra.TabStop := True;
      dbedt_dt_outra.ReadOnly := False;
      datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString := '';
    end;

    if (dblkcbox_tp_vcto.KeyValue = '0') or (dblkcbox_tp_vcto.KeyValue = '1') then
    begin

      if (Trim(datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString) <> '') then
      begin
        if ( datm_exp_saque.qry_exp_saque_TP_INDICADOR.AsString = '0' ) then    // Dias
           datm_exp_saque.qry_exp_saque_DT_VCTO_SAQUE.AsString := DateToStr( StrtoDate(dbedt_dt_outra.Text) + StrToInt(dbedt_qt_dias_pagto.Text) );
        if datm_exp_saque.qry_exp_saque_TP_INDICADOR.AsString = '1' then    // Meses
          datm_exp_saque.qry_exp_saque_DT_VCTO_SAQUE.AsString := DateToStr( IncMonth( StrtoDate(dbedt_dt_outra.Text), StrToInt(dbedt_qt_dias_pagto.Text) ) );
      end;
    end;
  end;

end;

procedure Tfrm_exp_saque.dbedt_dt_outraExit(Sender: TObject);
begin
  if dblkcbox_tp_vcto.KeyValue = '2' then
  begin
    if (Trim(datm_exp_saque.qry_exp_saque_DT_INICIAL.AsString) <> '') and
       (Trim(datm_exp_saque.qry_exp_saque_DT_VCTO_SAQUE.AsString) = '') then
    begin
      Btn_Mi(False, True, True, False );
      datm_exp_saque.qry_exp_saque_.Edit;
      datm_exp_saque.qry_exp_saque_DT_VCTO_SAQUE.AsString := DateToStr( StrtoDate(dbedt_dt_outra.Text) + StrToInt(dbedt_qt_dias_pagto.Text) );
    end;
  end;

end;

procedure Tfrm_exp_saque.mskedt_nr_saqueExit(Sender: TObject);
begin
  with datm_exp_saque do
  begin
    qry_exp_saque_.Cancel;
    qry_exp_saque_.Close;
    qry_exp_saque_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_saque_.ParamByName('NR_SAQUE').AsString := mskedt_nr_saque.Text;
    qry_exp_saque_.Prepare;
    qry_exp_saque_.Open;

    if not (qry_exp_saque_.EOF) then
    begin
      BoxMensagem( 'Nr. Processo e Nr. Saque já existentes !! ', 3 );
      Cancelar;
      pgctrl_saque.ActivePage := ts_lista;
      Exit;
    end;

    qry_exp_saque_.Append;
    qry_exp_saque_NR_PROCESSO.AsString  := Trim(str_nr_processo);
    qry_exp_saque_NR_SAQUE.AsString  := mskedt_nr_saque.Text;
    qry_exp_saque_DT_EMISSAO.AsDateTime := StrToDate( DateToStr( Date ) );
    qry_exp_saque_NR_FATURA.AsString := qry_processo_NR_FATURA.AsString;

    Habilita_Entrada;

    dbedtNrFatura.Enabled := (ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_GRUPO') = '028');
    btnFat.Enabled :=  (dbedtNrFatura.Enabled);
    if dbedtNrFatura.Enabled then
      dbedtNrFatura.Color := clWindow
    else
      dbedtNrFatura.Color := clMenu;


    Proc_Saque( False );

    NullToZero( qry_exp_saque_VL_TOT_SAQUE );

    qry_exp_saque_CD_TERMO_PAGTO.AsString := qry_processo_CD_TERMO_PAGTO.AsString;
    qry_exp_saque_VL_TOT_SAQUE.AsFloat    := qry_processo_VL_TOT_MCV.AsFloat;

    if Trim(qry_exp_saque_CD_TERMO_PAGTO.AsString) <> '' then
    begin
      qry_termo_pagto_.Locate( 'CD_TERMO_PAGTO', qry_processo_CD_TERMO_PAGTO.AsString, [] );
      if not (qry_termo_pagto_.EOF) then
      begin
        qry_exp_saque_QT_DIAS_PAGTO.AsString := qry_termo_pagto_NR_PERIODICIDADE.AsString;
        qry_exp_saque_TP_INDICADOR.AsString  := qry_termo_pagto_TP_INDICADOR.AsString;
        qry_exp_saque_NR_PARCELAS.AsString   := qry_termo_pagto_NR_PARCELAS.AsString;
      end;
    end;

    Btn_Mi(False, True, True, False );
    dbedt_dt_emissao.SetFocus;
  end;

end;


procedure Tfrm_exp_saque.Proc_Saque( lMostra : Boolean );
begin

  if not (lMostra) then
  begin
    msk_nr_processo.Color := clMenu;
    mskedt_nr_saque.Color    := clMenu;
  end
  else
  begin
    msk_nr_processo.Color := clWindow;
    mskedt_nr_saque.Color    := clWindow;
  end;

  msk_nr_processo.ReadOnly := not lMostra;
  msk_nr_processo.Enabled  := lMostra;
  msk_nr_processo.TabStop  := lMostra;
  btn_co_proc_new.Enabled     := lMostra;

  mskedt_nr_saque.ReadOnly := not lMostra;
  mskedt_nr_saque.Enabled  := lMostra;
  mskedt_nr_saque.TabStop  := lMostra;

  if dblkcbox_tp_vcto.KeyValue <> '2' then
  begin
    dbedt_dt_outra.Color := clMenu;
    dbedt_dt_outra.ReadOnly := True;
    dbedt_dt_outra.TabStop := False;
  end
  else
  begin
    dbedt_dt_outra.Color := clWindow;
    dbedt_dt_outra.ReadOnly := False;
    dbedt_dt_outra.TabStop := True;
  end;

  dbedt_dt_vcto_saque.Color := clMenu;
  dbedt_dt_vcto_saque.ReadOnly := True;
  dbedt_dt_vcto_saque.TabStop := False;
end;

procedure Tfrm_exp_saque.dbedt_qt_dias_pagtoExit(Sender: TObject);
begin
  if Trim(dbedt_qt_dias_pagto.Text) = '' then
     dbedt_qt_dias_pagto.Text := '000'
end;

procedure Tfrm_exp_saque.dbedt_qt_dias_pagtoChange(Sender: TObject);
begin
  dblkcbox_tp_vctoClick(nil);
end;


procedure Tfrm_exp_saque.dblckpbox_tp_indicadorExit(Sender: TObject);
begin
  dblkcbox_tp_vctoClick(nil);
end;

procedure Tfrm_exp_saque.dbm_valueEnter(Sender: TObject);
begin
  with datm_exp_saque do
  begin
    if Trim( qry_exp_saque_TX_VALUE.AsString ) = '' then
    begin
      if qry_exp_saque_.State in [dsEdit, dsInsert] then
      begin
        Btn_Mi(False, True, True, False );
        qry_exp_saque_.Edit;
        if Trim(qry_exp_saque_NR_FATURA.AsString) <> '' then
          qry_exp_saque_TX_VALUE.AsString := 'COVERING OUR COMMERCIAL INVOICE Nº ' + Trim(qry_exp_saque_NR_FATURA.AsString)
        else
          qry_exp_saque_TX_VALUE.AsString := 'COVERING OUR COMMERCIAL INVOICE Nº ' + Trim( qry_processo_NR_FATURA.AsString );

        if Not qry_processo_DT_FATURA.IsNull then
           qry_exp_saque_TX_VALUE.AsString := qry_exp_saque_TX_VALUE.AsString + ' DATED ' + qry_processo_STR_DT_FATURA.AsString;
      end;
    end;
  end;
end;

procedure Tfrm_exp_saque.btnFatClick(Sender: TObject);
var
  Item: String;
begin
  if Sender is TSpeedButton then begin
    if datm_exp_saque.qry_exp_saque_.State in [dsBrowse, dsInactive] then datm_exp_saque.qry_exp_saque_.Edit;
    begin
      Item := Trim(ConsultaOnLineExFiltro('TPROCESSO_EXP_PEDIDO', 'Pedidos - Processo de Exportação',
         ['NR_PEDIDO', 'NR_FATURA'], ['Pedido', 'Fatura'], 'NR_FATURA',' NR_PROCESSO = "' +  str_nr_processo + '" ',
         nil, dbedtnrFatura.Text));

      if Item = '' then
        Exit;

      if Pos(Item, dbedtNrFatura.Text) > 0 then
      begin
        MessageDlg('O item selecionado já está na lista.', mtInformation, [mbOk], 0);
        dbedtNrFatura.SelStart := Pos(Item, dbedtNrFatura.Text) -1;
        dbedtNrFatura.SelLength := Length(Item);
        dbedtNrFatura.SetFocus;
      end
      else
      begin
        if dbedtNrFatura.Text = '' then
          datm_exp_saque.qry_exp_saque_NR_FATURA.AsString := Item
        else
          datm_exp_saque.qry_exp_saque_NR_FATURA.AsString:= dbedtNrFatura.Text + ', ' + Item;
      end;
    end;
  end;
end;

procedure Tfrm_exp_saque.dbedtNrFaturaExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

end.


