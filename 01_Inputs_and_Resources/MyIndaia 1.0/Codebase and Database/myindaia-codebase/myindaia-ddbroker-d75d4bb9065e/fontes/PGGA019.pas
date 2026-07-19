(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGA019.PAS - Repasse de Dados - frm_repassa_dados

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 29/10/2001

*************************************************************************************************)
unit PGGA019;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBTables, Db, PGGP001,
  DBCtrls, Menus, ComCtrls, Funcoes;

type
  Tfrm_repassa_dados = class(TForm)
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;
    Panel1: TPanel;
    lbl_nm_usuario: TLabel;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    edt_nm_usuario: TEdit;
    btn_salvar: TSpeedButton;
    mi_salvar: TMenuItem;
    btn_limpar: TSpeedButton;
    mi_limpa: TMenuItem;
    pgctrl_pesq_proc: TPageControl;
    ts_filtros: TTabSheet;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label4: TLabel;
    btn_co_cliente: TSpeedButton;
    Label5: TLabel;
    btn_co_servico: TSpeedButton;
    Label2: TLabel;
    btn_co_navio: TSpeedButton;
    Label3: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    btn_co_local_emb: TSpeedButton;
    btn_co_local_desemb: TSpeedButton;
    btn_co_pais_dest: TSpeedButton;
    btn_co_pais_origem: TSpeedButton;
    lbl_di_da: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btn_co_armazem_atracacao: TSpeedButton;
    btn_co_armazem_descarga: TSpeedButton;
    btn_co_agente: TSpeedButton;
    lbl_viagem: TLabel;
    lbl_cntr: TLabel;
    lbl_fatura: TLabel;
    Label15: TLabel;
    lbl_transp_rod: TLabel;
    btn_co_transp_nac: TSpeedButton;
    lbl_conhecimento: TLabel;
    lbl_nr_conhecimento_master: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    msk_cd_navio: TMaskEdit;
    edt_nm_navio: TEdit;
    msk_nr_voo: TMaskEdit;
    msk_nr_di: TMaskEdit;
    msk_nr_dde: TMaskEdit;
    msk_nr_li: TMaskEdit;
    msk_cd_local_emb: TMaskEdit;
    msk_cd_local_desemb: TMaskEdit;
    msk_cd_pais_dest: TMaskEdit;
    msk_cd_pais_origem: TMaskEdit;
    edt_nm_local_emb: TEdit;
    edt_nm_local_desemb: TEdit;
    edt_nm_pais_dest: TEdit;
    edt_nm_pais_origem: TEdit;
    msk_nr_re: TMaskEdit;
    msk_cd_ref: TMaskEdit;
    msk_cd_armazem_atracacao: TMaskEdit;
    msk_cd_armazem_descarga: TMaskEdit;
    msk_cd_agente: TMaskEdit;
    edt_nm_armazem_atracacao: TEdit;
    edt_nm_armazem_descarga: TEdit;
    edt_nm_agente: TEdit;
    msk_nr_viagem: TMaskEdit;
    msk_nr_cntr: TMaskEdit;
    msk_nr_fatura: TMaskEdit;
    dblckpbox_tp_canal_filtro: TDBLookupComboBox;
    msk_cd_transp_nac: TMaskEdit;
    edt_nm_transp_nac: TEdit;
    msk_nr_conhecimento: TMaskEdit;
    msk_nr_conhecimento_master: TMaskEdit;
    ts_lista: TTabSheet;
    pnl_selecao: TPanel;
    Label1: TLabel;
    btn_processo: TSpeedButton;
    Label6: TLabel;
    btn_cd_produto2: TSpeedButton;
    Label7: TLabel;
    btn_cd_unid_neg2: TSpeedButton;
    Label18: TLabel;
    lbl_canal: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_produto2: TMaskEdit;
    edt_nm_produto2: TEdit;
    msk_cd_unid_neg2: TMaskEdit;
    edt_nm_unid_neg2: TEdit;
    dblkpcbox_canal: TDBLookupComboBox;
    msk_tx_frete: TMaskEdit;
    dbg_processos: TDBGrid;
    Label16: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    lbl_manifesto: TLabel;
    msk_nr_manifesto: TMaskEdit;
    Label17: TLabel;
    btn_co_armazem_atracacao2: TSpeedButton;
    msk_cd_armazem_atracacao2: TMaskEdit;
    edt_nm_armazem_atracacao2: TEdit;
    dblckpbox_aplicavel: TDBLookupComboBox;
    lbl_aplicavel: TLabel;
    lbl_embarcacao2: TLabel;
    btn_co_navio2: TSpeedButton;
    msk_cd_navio2: TMaskEdit;
    edt_nm_navio2: TEdit;
    lbl_viagem2: TLabel;
    msk_nr_viagem2: TMaskEdit;
    btn_co_viagem: TSpeedButton;
    btn_co_viagem2: TSpeedButton;
    procedure btn_fecharClick(Sender: TObject);
    procedure msk_cd_unid_neg2Enter(Sender: TObject);
    procedure msk_cd_unid_neg2Exit(Sender: TObject);
    procedure msk_cd_produto2Enter(Sender: TObject);
    procedure msk_cd_produto2Exit(Sender: TObject);
    function habilitacao : Boolean;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_cd_unid_neg2Click(Sender: TObject);
    procedure btn_cd_produto2Click(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Habilita_campo_processo;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_neg2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_tx_freteExit(Sender: TObject);
    procedure msk_tx_freteChange(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure pgctrl_pesq_procChange(Sender: TObject);
    procedure pgctrl_pesq_procChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure msk_cd_transp_nacExit(Sender: TObject);
    procedure msk_cd_navioExit(Sender: TObject);
    procedure msk_cd_local_embExit(Sender: TObject);
    procedure msk_cd_local_desembExit(Sender: TObject);
    procedure msk_cd_pais_destExit(Sender: TObject);
    procedure msk_cd_pais_origemExit(Sender: TObject);
    procedure msk_cd_armazem_atracacaoExit(Sender: TObject);
    procedure msk_cd_armazem_descargaExit(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure HabilitaPesq(Hab : Boolean);
    procedure msk_cd_eventoExit(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_armazem_descargaClick(Sender: TObject);
    procedure btn_co_armazem_atracacaoClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_pais_destClick(Sender: TObject);
    procedure btn_co_local_desembClick(Sender: TObject);
    procedure btn_co_local_embClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_transp_nacClick(Sender: TObject);
    procedure btn_co_navioClick(Sender: TObject);
    procedure msk_cd_armazem_atracacao2Exit(Sender: TObject);
    procedure btn_co_armazem_atracacao2Click(Sender: TObject);
    procedure btn_co_navio2Click(Sender: TObject);
    procedure msk_cd_navio2Exit(Sender: TObject);
    procedure btn_co_viagemClick(Sender: TObject);
    procedure btn_co_viagem2Click(Sender: TObject);
    procedure msk_nr_viagemExit(Sender: TObject);
    procedure msk_nr_viagem2Exit(Sender: TObject);
  private
    st_modificar, st_excluir, st_incluir: Boolean;
    st_produto, st_unid_neg, st_cd_modulo, st_cd_rotina: String;
    vl_tx_frete : Double;
    procedure RepassaDados;
    procedure GeraSqlStr;
    function Consiste : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_repassa_dados: Tfrm_repassa_dados;

implementation

uses PGSM018, PGSM010, PGGP015, GSMLIB, PGGA020, PGGP017, PGSM136, PGSM036,
     PGSM014, PGSM104, PGSM022, PGSM051, PGSM064, PGSM088, PGSM096, uAg,
     PGSM240;

{$R *.DFM}

procedure Tfrm_repassa_dados.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_repassa_dados.msk_cd_unid_neg2Enter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg2.Text;
end;

procedure Tfrm_repassa_dados.msk_cd_unid_neg2Exit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg2 );
  if Not ( st_unid_neg = msk_cd_unid_neg2.Text ) then
  begin
    with datm_repassa_dados do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg2.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg2.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
      end
      else
      begin
        edt_nm_unid_neg2.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
      end;
      qry_unid_neg_.Close;
    end;
    msk_nr_processo.Text := '';
  end;
  habilita_campo_processo;
end;

procedure Tfrm_repassa_dados.msk_cd_produto2Enter(Sender: TObject);
begin
  st_produto := msk_cd_produto2.Text;
end;

procedure Tfrm_repassa_dados.msk_cd_produto2Exit(Sender: TObject);
var foco: Boolean;
begin
  ValCodEdt( msk_cd_produto2 );
  if Not ( st_produto = msk_cd_produto2.Text ) then
  begin
    with datm_repassa_dados do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto2.Text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto2.Text := qry_produto_AP_PRODUTO.AsString;
        foco := Not Habilitacao;
      end
      else
      begin
        edt_nm_produto2.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := True;
      end;
      qry_produto_.Close;
    end;
    msk_nr_processo.Text := '';
    if foco then msk_cd_produto2.SetFocus;
  end;
  habilita_campo_processo;
end;

function Tfrm_repassa_dados.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if (msk_cd_unid_neg2.Text <> '') and
     (msk_cd_produto2.Text <> '') then
  with datm_repassa_dados do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg2.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto2.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := False;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_repassa_dados.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_repassa_dados.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_repassa_dados.btn_cd_unid_neg2Click(Sender: TObject);
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
    msk_cd_unid_neg2.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_neg2Exit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg2.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_neg2Exit(nil);
    end;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_repassa_dados.btn_cd_produto2Click(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto2.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto2.Text := frm_produto.Cons_OnLine_Texto;
    msk_cd_produto2Exit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_repassa_dados.btn_processoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg2.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto2.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
  end;
end;

procedure Tfrm_repassa_dados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_repassa_dados do
  begin
    qry_amz_.Close;
    qry_yes_no_.Close;
    qry_tp_canal_.Close;
    qry_tp_canal_filtro_.Close;
    qry_proc_limpa_.Close;
    qry_proc_limpa_.ParamByName('CD_USUARIO_REPASSA').AsString := str_cd_usuario;
    qry_proc_limpa_.ExecSQL;
  end;
  datm_repassa_dados.Free;
  Action := cafree;
end;

procedure Tfrm_repassa_dados.FormShow(Sender: TObject);
begin
  Application.CreateForm(Tdatm_repassa_dados, datm_repassa_dados );
  st_cd_modulo := vStr_cd_modulo;
  st_cd_rotina := vStr_cd_modulo;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  with datm_repassa_dados do
  begin
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;

    qry_tp_canal_.Close;
    qry_tp_canal_.Prepare;
    qry_tp_canal_.Open;

    qry_tp_canal_filtro_.Close;
    qry_tp_canal_filtro_.Prepare;
    qry_tp_canal_filtro_.Open;

    qry_amz_.Close;
    qry_amz_.Prepare;
    qry_amz_.Open;

    if (Trim(str_cd_usuario) <> '') and (Trim(str_cd_unid_neg) <> '') and (Trim(str_cd_produto) <> '') then
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
      qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := str_cd_produto;
      qry_usuario_habilitacao_.Open;
    end;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_transp_rod_.Close;
    qry_transp_rod_.Prepare;
    qry_transp_rod_.Open;

    qry_embarc_.Close;
    qry_embarc_.Prepare;
    qry_embarc_.Open;

    qry_local_emb_.Close;
    qry_local_emb_.Prepare;
    qry_local_emb_.Open;

    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;

    qry_agente_.Close;
    qry_agente_.Prepare;
    qry_agente_.Open;

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;

  end;

  edt_nm_usuario.Text    := str_nm_usuario;

end;

procedure Tfrm_repassa_dados.Habilita_campo_processo;
var libera:Boolean;
begin
  libera := True;
  if edt_nm_unid_neg2.Text   = '' then libera := False;
  if edt_nm_produto2.Text    = '' then libera := False;

  msk_nr_processo.Enabled := Libera;
  btn_processo.Enabled    := Libera;
  if libera then
  begin
    msk_nr_processo.Color := clwindow;
  end
  else
  begin
    msk_nr_processo.Color := clmenu;
  end;
end;

procedure Tfrm_repassa_dados.btn_salvarClick(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    try
      datm_main.db_broker.StartTransaction;
      qry_proc_lista_.First;
      while Not qry_proc_lista_.EOF do
      begin
        qry_proc_altera_.Close;
        qry_proc_altera_.ParamByName('NR_PROCESSO').AsString := qry_proc_lista_NR_PROCESSO.AsString;
        qry_proc_altera_.Prepare;
        qry_proc_altera_.Open;
        if Not qry_proc_altera_.EOF then
        begin
          RepassaDados;
        end;
        qry_proc_altera_.Close;

        qry_proc_lista_.Next;
      end;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    end;
{
    qry_tp_canal_.Close;
    dblkpcbox_canal.ListField  := '';
    dblkpcbox_canal.KeyField   := '';
    dblkpcbox_canal.ListSource := datm_repassa_dados.ds_yesno;
    qry_tp_canal_.Prepare;
    qry_tp_canal_.Open;
    qry_tp_canal_.First;

    qry_tp_canal_.Close;
    dblkpcbox_canal.ListSource := datm_repassa_dados.ds_tp_canal;
    dblkpcbox_canal.ListField  := 'NM_CANAL';
    dblkpcbox_canal.KeyField   := 'CD_CANAL';
    qry_tp_canal_.Prepare;
    qry_tp_canal_.Open;
    }
  end;
  ActiveControl := nil;
  msk_nr_processo.Text := '';
  mi_salvar.Enabled    := False;
  btn_salvar.Enabled   := False;
end;

procedure Tfrm_repassa_dados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_repassa_dados.msk_cd_unid_neg2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg           then btn_co_unid_negClick(nil);
    if Sender = msk_cd_unid_neg2          then btn_cd_unid_neg2Click(nil);
    if Sender = msk_cd_produto            then btn_co_produtoClick(nil);
    if Sender = msk_cd_produto2           then btn_cd_produto2Click(nil);
    if Sender = msk_nr_processo           then btn_processoClick(nil);
    if Sender = msk_cd_cliente            then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico            then btn_co_servicoClick(nil);
    if Sender = msk_cd_navio              then btn_co_navioClick(nil);
    if Sender = msk_cd_navio2             then btn_co_navio2Click(nil);
    if Sender = msk_nr_viagem             then btn_co_viagemClick(nil);
    if Sender = msk_nr_viagem2            then btn_co_viagem2Click(nil);
    if Sender = msk_cd_local_emb          then btn_co_local_embClick(nil);
    if Sender = msk_cd_local_desemb       then btn_co_local_desembClick(nil);
    if Sender = msk_cd_pais_dest          then btn_co_pais_destClick(nil);
    if Sender = msk_cd_pais_origem        then btn_co_pais_origemClick(nil);
    if Sender = msk_cd_transp_nac         then btn_co_transp_nacClick(nil);
    if Sender = msk_cd_armazem_atracacao  then btn_co_armazem_atracacaoClick(nil);
    if Sender = msk_cd_armazem_atracacao2 then btn_co_armazem_atracacao2Click(nil);
    if Sender = msk_cd_armazem_descarga   then btn_co_armazem_descargaClick(nil);
    if Sender = msk_cd_agente             then btn_co_agenteClick(nil);
    if Sender = msk_cd_evento             then btn_co_eventoClick(nil);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg2.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_neg2Exit(nil);
      msk_cd_produto2.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produto2Exit(nil);
      msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_repassa_dados.msk_nr_processoExit(Sender: TObject);
begin
  mi_salvar.Enabled  := False;
  btn_salvar.Enabled := False;

  if msk_nr_processo.Text = '' then Exit;

  if Sender = msk_nr_processo then
  begin
    if processo_nulo( msk_nr_processo.Text ) then
    begin
      BoxMensagem('Processo Inválido.', 2);
      datm_repassa_dados.qry_processo_.Close;
      Exit;
    end;
  end;

  with datm_repassa_dados do
  begin
    qry_processo_.Close;
    qry_empresa_nac_.Close;
    qry_servico.Close;
    if Not processo_nulo( msk_nr_processo.Text ) then
    begin
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg2.Text + msk_cd_produto2.Text + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        BoxMensagem('Processo não encontrado!', 2);
        qry_processo_.Close;
        qry_empresa_nac_.Close;
        qry_servico.Close;
        msk_nr_processo.Text := '';
        mi_salvar.Enabled    := False;
        btn_salvar.Enabled   := False;
        Exit;
      end
      else
      begin
        if qry_processo_IN_LIBERADO.AsString <> '1' then
          BoxMensagem('Processo não está liberado!', 2)
        else
          if qry_processo_IN_CANCELADO.AsString <> '0' then
            BoxMensagem('Processo está cancelado!', 2)
          else
            if qry_processo_IN_PRODUCAO.AsString <> '1' then
              BoxMensagem('Processo não está em produção!', 2);
        if ( qry_processo_IN_LIBERADO.AsString <> '1' )  or
           ( qry_processo_IN_CANCELADO.AsString <> '0' ) or
           ( qry_processo_IN_PRODUCAO.AsString <> '1' )  then
        begin
          msk_nr_processo.Text := '';
          qry_processo_.Close;
          qry_empresa_nac_.Close;
          qry_servico.Close;
          mi_salvar.Enabled  := False;
          btn_salvar.Enabled := False;
          msk_nr_processo.SetFocus;
          Exit;
        end
        else
        begin
          mi_salvar.Enabled  := st_modificar;
          btn_salvar.Enabled := st_modificar;
          try
            datm_main.db_broker.StartTransaction;
            qry_proc_usuario_.Close;
            qry_proc_usuario_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg2.Text ) + Trim( msk_cd_produto2.Text ) + Trim( msk_nr_processo.Text );
            qry_proc_usuario_.Prepare;
            qry_proc_usuario_.Open;
            qry_proc_usuario_.Edit;
            {
            qry_proc_usuario_CD_UNID_NEG.AsString := msk_cd_unid_neg2.Text;
            qry_proc_usuario_CD_PRODUTO.AsString  := msk_cd_produto2.Text;
            }
            qry_proc_usuario_CD_USUARIO_REPASSA.AsString := str_cd_usuario;
            qry_proc_usuario_.Post;
            qry_proc_usuario_.Close;

            qry_proc_altera_.Close;
            qry_proc_altera_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg2.Text ) + Trim( msk_cd_produto2.Text ) + Trim( msk_nr_processo.Text );
            qry_proc_altera_.Prepare;
            qry_proc_altera_.Open;
            if Not qry_proc_altera_.EOF then
            begin
              RepassaDados;
            end;
            qry_proc_altera_.Close;
            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          end;

          qry_proc_lista_.Close;
          qry_proc_lista_.SQL.Clear;
          qry_proc_lista_.SQL.Add('SELECT P.NR_PROCESSO, C.AP_EMPRESA, S.NM_SERVICO');
          qry_proc_lista_.SQL.Add('FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S');
          qry_proc_lista_.SQL.Add('WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND');
          qry_proc_lista_.SQL.Add('(P.CD_SERVICO *= S.CD_SERVICO) AND ' );
          qry_proc_lista_.SQL.Add('(P.CD_USUARIO_REPASSA = "' + str_cd_usuario + '")' );
          qry_proc_lista_.Prepare;
          qry_proc_lista_.Open;
          msk_nr_processo.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_repassa_dados.msk_tx_freteExit(Sender: TObject);
begin
  if msk_tx_frete.Text = '' then Exit;
  vl_tx_frete := StrToFloat( msk_tx_frete.Text );
  msk_tx_frete.Text := FormatFloat('0.0000', vl_tx_frete);
end;

procedure Tfrm_repassa_dados.msk_tx_freteChange(Sender: TObject);
begin
  mi_salvar.Enabled  := st_modificar;
  btn_salvar.Enabled := st_modificar;
end;


procedure Tfrm_repassa_dados.btn_limparClick(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    qry_proc_limpa_.Close;
    qry_proc_limpa_.ParamByName('CD_USUARIO_REPASSA').AsString := str_cd_usuario;
    qry_proc_limpa_.ExecSQL;
    qry_proc_lista_.Close;
    qry_proc_lista_.Prepare;
    qry_proc_lista_.Open;
  end;
  mi_salvar.Enabled    := False;
  btn_salvar.Enabled   := False;
end;

procedure Tfrm_repassa_dados.pgctrl_pesq_procChange(Sender: TObject);
begin
  if pgctrl_pesq_proc.Activepage = ts_lista then
  begin
    if Trim(msk_cd_unid_neg.Text) <> '' then
    begin
      msk_cd_unid_neg2.Enabled := False;
      msk_cd_unid_neg2.Text := msk_cd_unid_neg.Text;
      btn_cd_unid_neg2.Enabled := False;
    end
    else
    begin
      msk_cd_unid_neg2.Enabled := True;
      msk_cd_unid_neg2.Text := str_cd_unid_neg;
      btn_cd_unid_neg2.Enabled := True;
    end;
    msk_cd_unid_neg2Exit(nil);

    if Trim(msk_cd_produto.Text) <> '' then
    begin
      msk_cd_produto2.Enabled := False;
      msk_cd_produto2.Text := msk_cd_produto.Text;
      msk_cd_produto2Exit(nil);
      btn_cd_produto2.Enabled := False;
    end
    else
    begin
      msk_cd_produto2.Enabled := True;
      msk_cd_produto2.Text := str_cd_produto;
      btn_cd_produto2.Enabled := True;
    end;
    msk_cd_produto2Exit(nil);

  end;

  if pgctrl_pesq_proc.Activepage = ts_lista then
  begin
    GeraSqlStr;
    HabilitaPesq(True);
  end
  else
  begin
    HabilitaPesq(False);
  end;
  if Trim( msk_cd_evento.Text ) = '' then
  begin
    lbl_aplicavel.Visible       := False;
    dblckpbox_aplicavel.Visible := False;
  end
  else
  begin
    lbl_aplicavel.Visible       := True;
    dblckpbox_aplicavel.Visible := True;
  end;

end;

procedure Tfrm_repassa_dados.HabilitaPesq(Hab: Boolean);
begin
  btn_limpar.Enabled := Hab;
  mi_limpa.Enabled   := Hab;
end;

procedure Tfrm_repassa_dados.GeraSqlStr;
var
  sqlstr : string;

begin
  sqlstr := '';

  if ( Trim( msk_cd_unid_neg.Text ) = '') and  ( Trim( msk_cd_produto.Text ) = '') and
     ( Trim( msk_cd_cliente.Text ) = '') and  ( Trim( msk_cd_servico.Text ) = '') and
     ( Trim( msk_cd_transp_nac.Text ) = '') and ( Trim( msk_cd_navio.Text ) = '') and
     ( Trim( msk_cd_local_emb.Text ) = '') and ( Trim( msk_cd_local_desemb.Text ) = '') and
     ( Trim( msk_cd_pais_dest.Text ) = '') and ( Trim( msk_cd_pais_origem.Text ) = '') and
     ( Trim( msk_cd_armazem_atracacao.Text ) = '') and ( Trim( msk_cd_armazem_descarga.Text ) = '') and
     ( Trim( msk_cd_agente.Text ) = '') and ( Trim( msk_nr_viagem.Text ) = '' ) and
     ( Trim( msk_nr_voo.Text ) = '') and ( Trim( msk_nr_di.Text ) = '' ) and
     ( Trim( msk_nr_li.Text ) = '') and ( Trim( msk_cd_ref.Text ) = '' ) and
     ( Trim( msk_nr_fatura.Text ) = '') and ( Trim( msk_nr_conhecimento.Text ) = '' ) and
     ( Trim( msk_nr_conhecimento_master.Text ) = '') and ( Trim( msk_nr_cntr.Text ) = '' ) and
     ( Trim( datm_repassa_dados.qry_tp_canal_filtro_NM_CANAL.AsString ) = '' ) and
     ( Trim( msk_nr_dde.Text ) = '' ) and ( Trim( msk_nr_re.Text ) = '' ) then
  begin
    sqlstr := sqlstr + 'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO, ' +
                       'P.CD_CLIENTE, E.AP_EMPRESA, P.CD_SERVICO, S.NM_SERVICO ';
    sqlstr := sqlstr + 'FROM TPROCESSO P, TEMPRESA_NAC E, TSERVICO S, TUNID_NEG U, TPRODUTO PR ';
    sqlstr := sqlstr + 'WHERE 1 = 0 ';
  end
  else
  begin
    sqlstr := sqlstr + 'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO, ' +
                       'P.CD_CLIENTE, E.AP_EMPRESA, P.CD_SERVICO, S.NM_SERVICO ';
    sqlstr := sqlstr + 'FROM TPROCESSO P, TEMPRESA_NAC E, TSERVICO S, TUNID_NEG U, TPRODUTO PR ';
    sqlstr := sqlstr + 'WHERE ';
    sqlstr := sqlstr + 'P.CD_UNID_NEG = U.CD_UNID_NEG AND ' +
                       'P.CD_PRODUTO = PR.CD_PRODUTO AND ' +
                       'P.CD_CLIENTE *= E.CD_EMPRESA AND ' +
                       'P.CD_SERVICO *= S.CD_SERVICO AND ' +
                       'P.IN_LIBERADO = "1" AND ' +
                       'P.IN_CANCELADO = "0" AND ' +
                       'P.IN_PRODUCAO = "1" AND ' +
                       '(P.CD_UNID_NEG+P.CD_PRODUTO) IN ' +
                       '(SELECT CD_UNID_NEG+CD_PRODUTO ' +
                       'FROM TUSUARIO_HABILITACAO ' +
                       'WHERE CD_USUARIO='''+str_cd_usuario+''' ' +
                       'AND IN_ATIVO=''1'') ';

    if (msk_cd_unid_neg.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_UNID_NEG=''' + msk_cd_unid_neg.Text + ''' ';
    end;

    if (msk_cd_produto.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_PRODUTO=''' + msk_cd_produto.Text + ''' ';
    end;

    if (msk_cd_cliente.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_CLIENTE=''' + msk_cd_cliente.Text + ''' ';
    end;

    if (msk_cd_servico.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_SERVICO=''' + msk_cd_servico.Text + ''' ';
    end;

    if (msk_cd_transp_nac.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_TRANSP_NAC=''' + msk_cd_transp_nac.Text + ''' ';
    end;

    if (msk_cd_navio.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_EMBARCACAO=''' + msk_cd_navio.Text + ''' ';
    end;

    if (msk_cd_local_emb.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_LOCAL_EMBARQUE=''' + msk_cd_local_emb.Text + ''' ';
    end;

    if (msk_cd_local_desemb.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_LOCAL_DESEMBARQUE=''' + msk_cd_local_desemb.Text + ''' ';
    end;

    if (msk_cd_pais_dest.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_PAIS_DESTINO=''' + msk_cd_pais_dest.Text + ''' ';
    end;

    if (msk_cd_pais_origem.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_PAIS_ORIGEM=''' + msk_cd_pais_origem.Text + ''' ';
    end;

    if (msk_cd_armazem_atracacao.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_ARMAZEM_ATRACACAO=''' + msk_cd_armazem_atracacao.Text + ''' ';
    end;

    if (msk_cd_armazem_descarga.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_ARMAZEM_DESCARGA=''' + msk_cd_armazem_descarga.Text + ''' ';
    end;

    if (msk_cd_agente.Text <> '') then
    begin
      sqlstr := sqlstr + ' AND P.CD_AGENTE=''' + msk_cd_agente.Text + ''' ';
    end;

    if (Trim(msk_nr_viagem.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_VIAGEM LIKE ''%' + Trim(msk_nr_viagem.Text) + '%'')';
    end;

    if (Trim(msk_nr_voo.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_VOO LIKE ''%' + Trim(msk_nr_voo.Text) + '%'')';
    end;

    if (Trim(msk_nr_di.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_DI LIKE ''%' + Trim(msk_nr_di.Text) + '%'')';
    end;

    if (Trim(msk_nr_li.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT PLI.NR_PROCESSO FROM TPROCESSO_LI PLI ' +
      'WHERE P.NR_PROCESSO=PLI.NR_PROCESSO AND PLI.NR_LI LIKE ''%' + Trim(msk_nr_li.Text) + '%'')';
    end;

    if (Trim(msk_cd_ref.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC ' +
      'WHERE P.NR_PROCESSO=RC.NR_PROCESSO AND RC.CD_REFERENCIA LIKE ''%' + Trim(msk_cd_ref.Text) + '%'')';
    end;

    if (Trim(msk_nr_fatura.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT FAT.NR_PROCESSO FROM TDOCUMENTO_INSTRUCAO FAT ' +
      'WHERE P.NR_PROCESSO=FAT.NR_PROCESSO AND FAT.CD_TIPO_DCTO_INSTR = "01" AND FAT.NR_DCTO_INSTRUCAO LIKE ''%' + Trim(msk_nr_fatura.Text) + '%'')';
    end;

    if (Trim(msk_nr_conhecimento.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_CONHECIMENTO LIKE ''%' + Trim(msk_nr_conhecimento.Text) + '%'')';
    end;

    if (Trim(msk_nr_conhecimento_master.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_CONHECIMENTO_MASTER LIKE ''%' + Trim(msk_nr_conhecimento_master.Text) + '%'')';
    end;

    if (Trim(msk_nr_cntr.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT CNTR.NR_PROCESSO FROM TPROCESSO_CNTR CNTR ' +
      'WHERE P.NR_PROCESSO=CNTR.NR_PROCESSO AND CNTR.NR_CNTR LIKE ''%' + Trim(msk_nr_cntr.Text) + '%'')';
    end;

    if (Trim( datm_repassa_dados.qry_tp_canal_filtro_NM_CANAL.AsString ) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE CD_CANAL = "' + Trim(datm_repassa_dados.qry_tp_canal_filtro_CD_CANAL.AsString ) + '")';
    end;

    if (Trim(msk_nr_dde.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT NR_PROCESSO FROM TPROCESSO ' +
      'WHERE NR_DDE LIKE ''%' + Trim(msk_nr_dde.Text) + '%'')';
    end;

    if (Trim(msk_nr_re.Text) <> '') then
    begin
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT RE.NR_PROCESSO FROM TPROCESSO_RE RE ' +
      'WHERE P.NR_PROCESSO=RE.NR_PROCESSO AND RE.NR_RE LIKE ''%' + Trim(msk_nr_re.Text) + '%'')';
    end;
{
    if (Trim(msk_cd_evento.Text) <> '') then
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT F.NR_PROCESSO FROM TFOLLOWUP F ' +
      'WHERE P.NR_PROCESSO=F.NR_PROCESSO AND F.CD_EVENTO "' + Trim( msk_cd_evento.Text ) + '")';
}
  end;

  with datm_repassa_dados do
  begin
    try
      datm_main.db_broker.StartTransaction;
      qry_pesq_.Close;
      qry_pesq_.SQL.Clear;
      qry_pesq_.SQL.Add(sqlstr);
      qry_pesq_.Prepare;
      qry_pesq_.Open;

      while Not qry_pesq_.EOF do
      begin
        qry_proc_usuario_.Close;
        qry_proc_usuario_.ParamByName('NR_PROCESSO').AsString := qry_pesq_NR_PROCESSO.AsString;
        qry_proc_usuario_.Prepare;
        qry_proc_usuario_.Open;
        if Not qry_proc_usuario_.EOF then
        begin
          qry_proc_usuario_.Edit;
          {
          qry_proc_usuario_CD_UNID_NEG.AsString := msk_cd_unid_neg2.Text;
          qry_proc_usuario_CD_PRODUTO.AsString  := msk_cd_produto2.Text;
          }
          qry_proc_usuario_CD_USUARIO_REPASSA.AsString := str_cd_usuario;
          qry_proc_usuario_.Post;
          qry_pesq_.Next;
        end;
        qry_proc_usuario_.Close;
      end;
      qry_pesq_.Close;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    end;
    qry_proc_lista_.Close;
    qry_proc_lista_.SQL.Clear;
    qry_proc_lista_.SQL.Add('SELECT P.NR_PROCESSO, C.AP_EMPRESA, S.NM_SERVICO');
    qry_proc_lista_.SQL.Add('FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S');
    qry_proc_lista_.SQL.Add('WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND');
    qry_proc_lista_.SQL.Add('(P.CD_SERVICO *= S.CD_SERVICO) AND ' );
    qry_proc_lista_.SQL.Add('(P.CD_USUARIO_REPASSA = "' + str_cd_usuario + '")' );
    qry_proc_lista_.Prepare;
    qry_proc_lista_.Open;
  end;
end;

procedure Tfrm_repassa_dados.pgctrl_pesq_procChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

function Tfrm_repassa_dados.Consiste : Boolean;
begin
  Consiste := True;
  with datm_repassa_dados do
  begin
    {Unidade}
    if (Trim(msk_cd_unid_neg.Text) <> '') then
    // if (msk_cd_unid_neg.Text <> '') and (msk_cd_produto.Text = '') then
    begin
      ValCodEdt( msk_cd_unid_neg );

      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive, loPartialKey]) then
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString
      else
      begin
        edt_nm_unid_neg.Clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
      end;
      qry_unid_neg_.Close;

      {
      if not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Unidade não encontrada!', 2);
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_usuario_habilitacao_LookUnidNeg.AsString;
        edt_nm_produto.Text      := '';
      end;
      }

    end;

    {Produto}
    if (Trim(msk_cd_produto.Text) <> '') then
//    if (msk_cd_unid_neg.Text = '') and (msk_cd_produto.Text <> '') then
    begin
      ValCodEdt( msk_cd_produto );

      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]) then
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString
      else
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
      end;
      qry_produto_.Close;
      {
      if not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Produto não encontrado!', 2);
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        edt_nm_unid_neg.Text     := '';
        Consiste                 := False;
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := qry_usuario_habilitacao_LookProduto.AsString;
      end;
      }

    end;

    {Unidade - Produto}
    if (Trim(msk_cd_unid_neg.Text) <> '') and (Trim(msk_cd_produto.Text) <> '')  then
    begin
      ValCodEdt( msk_cd_unid_neg );
      ValCodEdt( msk_cd_produto );
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_usuario_habilitacao_.Open;
      if not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Unidade x Produto não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        //edt_nm_unid_neg.Text     := qry_usuario_habilitacao_LookUnidNeg.AsString;
        //edt_nm_produto.Text      := qry_usuario_habilitacao_LookProduto.AsString;
      end;
    end;

    if (Trim(msk_cd_unid_neg.Text) = '') and (Trim(msk_cd_produto.Text) = '')  then
    begin
      edt_nm_unid_neg.Text       := '';
      edt_nm_produto.Text        := '';
    end;

    {Cliente}
    if (Trim(msk_cd_cliente.Text) <> '') then
    begin
      ValCodEdt( msk_cd_cliente );
      if not ( qry_empresa_nac_.Locate('CD_EMPRESA', msk_cd_cliente.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Cliente inexistente!', 2);
        msk_cd_cliente.Text      := '';
        edt_nm_cliente.Text      := '';
        Consiste                 := False;
        msk_cd_cliente.SetFocus;
      end
      else
      begin
        edt_nm_cliente.Text      := qry_empresa_nac_NM_EMPRESA.AsString;
        {Cliente X Habilitação}
        qry_cliente_habilitacao_.Close;
        qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
        qry_cliente_habilitacao_.Prepare;
        qry_cliente_habilitacao_.Open;
      end;
    end
    else
    begin
      edt_nm_cliente.Text        :='';
    end;

    {Serviço}
    if (Trim(msk_cd_servico.Text) <> '') then
    begin
      ValCodEdt( msk_cd_servico );
      if not ( qry_servico_.Locate('CD_SERVICO', msk_cd_servico.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Serviço inexistente!', 2);
        msk_cd_servico.Text      := '';
        edt_nm_servico.Text      := '';
        Consiste                 := False;
        msk_cd_servico.SetFocus;
      end
      else
      begin
        edt_nm_servico.Text      := qry_servico_NM_SERVICO.AsString;
        {Cliente X Serviço}
        if msk_cd_cliente.Text <> '' then
        begin
          qry_cliente_servico_.Close;
          qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
          qry_cliente_servico_.Prepare;
          qry_cliente_servico_.Open;
        end;
      end;
    end
    else
    begin
      edt_nm_servico.Text        := '';
    end;

    {Transportadora}
    if (Trim(msk_cd_transp_nac.Text) <> '') then
    begin
      ValCodEdt( msk_cd_transp_nac );
      if not ( qry_transp_rod_.Locate('CD_TRANSP_ROD', msk_cd_transp_nac.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Transportador inexistente!', 2);
        msk_cd_transp_nac.Text := '';
        edt_nm_transp_nac.Text := '';
        Consiste               := False;
        msk_cd_transp_nac.SetFocus;
      end
      else
      begin
        edt_nm_transp_nac.Text := qry_transp_rod_NM_TRANSP_ROD.AsString;
      end;
    end
    else
    begin
      edt_nm_transp_nac.Text   := '';
    end;

    {Embarcação}
    if (Trim(msk_cd_navio.Text) <> '') then
    begin
      ValCodEdt( msk_cd_navio );
      if not ( qry_embarc_.Locate('CD_EMBARCACAO', msk_cd_navio.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Embarcação inexistente!', 2);
        msk_cd_navio.Text        := '';
        edt_nm_navio.Text        := '';
        Consiste                 := False;
        msk_cd_navio.SetFocus;
      end
      else
      begin
        edt_nm_navio.Text        := qry_embarc_NM_EMBARCACAO.AsString;
      end;
    end
    else
    begin
      edt_nm_navio.Text          := '';
    end;

    {Local de Embarque}
    if (Trim(msk_cd_local_emb.Text) <> '') then
    begin
      ValCodEdt( msk_cd_local_emb );
      if not ( qry_local_emb_.Locate('CODIGO', msk_cd_local_emb.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Local de embarque inexistente!', 2);
        msk_cd_local_emb.Text    := '';
        edt_nm_local_emb.Text    := '';
        Consiste                 := False;
        msk_cd_local_emb.SetFocus;
      end
      else
      begin
        edt_nm_local_emb.Text    := qry_local_emb_DESCRICAO.AsString;
      end;
    end
    else
    begin
      edt_nm_local_emb.Text      := '';
    end;

    {Local de Desembarque}
    if (Trim(msk_cd_local_desemb.Text) <> '') then
    begin
      ValCodEdt( msk_cd_local_desemb );
      if not ( qry_local_emb_.Locate('CODIGO', msk_cd_local_desemb.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Local de desembarque inexistente!', 2);
        msk_cd_local_desemb.Text := '';
        edt_nm_local_desemb.Text := '';
        Consiste                 := False;
        msk_cd_local_desemb.SetFocus;
      end
      else
      begin
        edt_nm_local_desemb.Text := qry_local_emb_DESCRICAO.AsString;
      end;
    end
    else
    begin
      edt_nm_local_desemb.Text   := '';
    end;

    {País Destino}
    if (Trim(msk_cd_pais_dest.Text) <> '') then
    begin
      ValCodEdt( msk_cd_pais_dest );
      if not ( qry_pais_.Locate('CODIGO', msk_cd_pais_dest.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('País destino inexistente!', 2);
        msk_cd_pais_dest.Text    := '';
        edt_nm_pais_dest.Text    := '';
        Consiste                 := False;
        msk_cd_pais_dest.SetFocus;
      end
      else
      begin
        edt_nm_pais_dest.Text    := qry_pais_DESCRICAO.AsString;
      end;
    end
    else
    begin
      edt_nm_pais_dest.Text      := '';
    end;

    {País de Origem}
    if (Trim(msk_cd_pais_origem.Text) <> '') then
    begin
      ValCodEdt( msk_cd_pais_origem );
      if not ( qry_pais_.Locate('CODIGO', msk_cd_pais_origem.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('País origem inexistente!', 2);
        msk_cd_pais_origem.Text  := '';
        edt_nm_pais_origem.Text  := '';
        Consiste                 := False;
        msk_cd_pais_origem.SetFocus;
      end
      else
      begin
        edt_nm_pais_origem.Text  := qry_pais_DESCRICAO.AsString;
      end;
    end
    else
    begin
      edt_nm_pais_origem.Text    := '';
    end;

    {Armazém de Atracação}
    if (Trim(msk_cd_armazem_atracacao.Text) <> '') then
    begin
      ValCodEdt( msk_cd_armazem_atracacao );
      if not ( qry_amz_.Locate('CD_ARMAZEM', msk_cd_armazem_atracacao.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Armazém de Atracação inexistente!', 2);
        msk_cd_armazem_atracacao.Text := '';
        edt_nm_armazem_atracacao.Text := '';
        Consiste                      := False;
        msk_cd_armazem_atracacao.SetFocus;
      end
      else
      begin
        edt_nm_armazem_atracacao.Text := qry_amz_NM_ARMAZEM.AsString;
      end;
    end
    else
    begin
      edt_nm_armazem_atracacao.Text   := '';
    end;

    {Armazém de Descarga}
    if (Trim(msk_cd_armazem_descarga.Text) <> '') then
    begin
      ValCodEdt( msk_cd_armazem_descarga );
      if not ( qry_amz_.Locate('CD_ARMAZEM', msk_cd_armazem_descarga.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Armazém de Descarga inexistente!', 2);
        msk_cd_armazem_descarga.Text := '';
        edt_nm_armazem_descarga.Text := '';
        Consiste                     := False;
        msk_cd_armazem_descarga.SetFocus;
      end
      else
      begin
        edt_nm_armazem_descarga.Text := qry_amz_NM_ARMAZEM.AsString;
      end;
    end
    else
    begin
      edt_nm_armazem_descarga.Text   := '';
    end;

    {Agente}
    if (Trim(msk_cd_agente.Text) <> '') then
    begin
      ValCodEdt( msk_cd_agente );
      if not ( qry_agente_.Locate('CD_AGENTE', msk_cd_agente.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Agente inexistente!', 2);
        msk_cd_agente.Text := '';
        edt_nm_agente.Text := '';
        Consiste           := False;
        msk_cd_agente.SetFocus;
      end
      else
      begin
        edt_nm_agente.Text := qry_amz_NM_ARMAZEM.AsString;
      end;
    end
    else
    begin
      edt_nm_agente.Text   := '';
    end;

    {Evento}
    if (Trim(msk_cd_evento.Text) <> '') then
    begin
      ValCodEdt( msk_cd_evento );
      qry_evento_.Close;
      qry_evento_.Prepare;
      qry_evento_.Open;
      if not ( qry_evento_.Locate('CD_EVENTO', msk_cd_evento.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Evento inexistente!', 2 );
        msk_cd_evento.Text    := '';
        edt_nm_evento.Text    := '';
        Consiste              := False;
        msk_cd_evento.SetFocus;
      end
      else
      begin
        edt_nm_evento.Text    := qry_evento_NM_EVENTO.AsString;
      end;
      qry_evento_.Close;
    end
    else
    begin
      edt_nm_evento.Text      := '';
    end;
  end;
end;

procedure Tfrm_repassa_dados.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_produtoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_clienteExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_servicoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_transp_nacExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_navioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_local_embExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_local_desembExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_pais_destExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_pais_origemExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_armazem_atracacaoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_armazem_descargaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.msk_cd_agenteExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.btn_co_unid_negClick(Sender: TObject);
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
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_produtoExit(nil);
end;

procedure Tfrm_repassa_dados.msk_cd_eventoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_repassa_dados.btn_co_eventoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';

  Application.CreateForm(Tfrm_evento, frm_evento);

  with frm_evento do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_evento.Text := frm_evento.Cons_OnLine_Texto;
  vStr_cd_modulo      := '01';
  str_cd_rotina      := '0117';

  msk_cd_eventoExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_agenteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2229';

  Application.CreateForm(Tfrm_ag, frm_ag);

  with frm_ag do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_agente.Text := frm_ag.Cons_OnLine_Texto;
  vStr_cd_modulo      := '01';
  str_cd_rotina      := '0117';

  msk_cd_agenteExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_armazem_descargaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';

  Application.CreateForm(Tfrm_amz, frm_amz);

  with frm_amz do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_armazem_descarga.Text := frm_amz.Cons_OnLine_Texto;
  vStr_cd_modulo                := '01';
  str_cd_rotina                := '0102';

  msk_cd_armazem_descargaExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_armazem_atracacaoClick(
  Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';

  Application.CreateForm(Tfrm_amz, frm_amz);

  with frm_amz do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_armazem_atracacao.Text := frm_amz.Cons_OnLine_Texto;
  vStr_cd_modulo                 := '01';
  str_cd_rotina                 := '0102';

  msk_cd_armazem_atracacaoExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_pais_origemClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TPAIS', msk_cd_pais_origem, 'País', 1, '' );
  msk_cd_pais_origemExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_pais_destClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TPAIS', msk_cd_pais_dest, 'País', 1, '' );
  msk_cd_pais_destExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_local_desembClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2206';

  Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);

  with frm_local_embarque do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_local_desemb.Text:=frm_local_embarque.Cons_OnLine_Texto;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_local_desembExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_local_embClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2206';

  Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);

  with frm_local_embarque do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_local_emb.Text := frm_local_embarque.Cons_OnLine_Texto;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_local_embExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';

  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);

  with frm_cliente_co do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_clienteExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_servicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';

  Application.CreateForm(Tfrm_servico, frm_servico);

  with frm_servico do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_servicoExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_transp_nacClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2211';

  Application.CreateForm(Tfrm_transp_rod, frm_transp_rod);

  with frm_transp_rod do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_transp_nac.Text := frm_transp_rod.Cons_OnLine_Texto;
  vStr_cd_modulo          := '01';
  str_cd_rotina          := '0102';

  msk_cd_transp_nacExit(nil);
end;

procedure Tfrm_repassa_dados.btn_co_navioClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2225';

  Application.CreateForm(Tfrm_emb, frm_emb);

  with frm_emb do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_navio.Text  := frm_emb.Cons_OnLine_Texto;

  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_navioExit(nil);
end;

procedure Tfrm_repassa_dados.msk_cd_armazem_atracacao2Exit(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    {Armazém de Atracação}
    if (msk_cd_armazem_atracacao2.Text <> '') then
    begin
      ValCodEdt( msk_cd_armazem_atracacao2 );
      if not ( qry_amz_.Locate('CD_ARMAZEM', msk_cd_armazem_atracacao2.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Armazém de Atracação inexistente!', 2);
        msk_cd_armazem_atracacao2.Text := '';
        edt_nm_armazem_atracacao2.Text := '';
        msk_cd_armazem_atracacao2.SetFocus;
      end
      else
      begin
        edt_nm_armazem_atracacao2.Text := qry_amz_NM_ARMAZEM.AsString;
      end;
    end
    else
    begin
      edt_nm_armazem_atracacao2.Text   := '';
    end;
  end;
end;

procedure Tfrm_repassa_dados.btn_co_armazem_atracacao2Click(
  Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';

  Application.CreateForm(Tfrm_amz, frm_amz);

  with frm_amz do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_armazem_atracacao2.Text := frm_amz.Cons_OnLine_Texto;
  vStr_cd_modulo                 := '01';
  str_cd_rotina                 := '0117';

  msk_cd_armazem_atracacao2Exit(nil);
end;

procedure Tfrm_repassa_dados.RepassaDados;
begin
  with datm_repassa_dados do
  begin
    qry_proc_altera_.Edit;
    try
      if Trim(msk_tx_frete.Text) <> '' then
      begin
         StrToFloat( msk_tx_frete.Text );
         qry_proc_altera_VL_TAXA_FRETE.AsFloat := StrToFloat( msk_tx_frete.Text );
      end;
    except
    end;
    if ( qry_tp_canal_NM_CANAL.AsString <> '' ) then
       qry_proc_altera_CD_CANAL.AsString := qry_tp_canal_CD_CANAL.AsString;
    if Trim( msk_cd_armazem_atracacao2.Text ) <> '' then
       qry_proc_altera_CD_ARMAZEM_ATRACACAO.AsString := msk_cd_armazem_atracacao2.Text;
    if ( Trim( msk_nr_manifesto.Text ) <> '' ) and
       ( Trim( qry_proc_altera_NR_MANIFESTO.AsString ) = '' ) then
       qry_proc_altera_NR_MANIFESTO.AsString         := msk_nr_manifesto.Text;
    if Trim( msk_cd_navio2.Text ) <> '' then
       qry_proc_altera_CD_EMBARCACAO.AsString        := msk_cd_navio2.Text;
    if Trim( msk_nr_viagem2.Text ) <> '' then
       qry_proc_altera_NR_VIAGEM.AsString            := msk_nr_viagem2.Text;
    qry_proc_altera_.Post;

    if Trim( msk_nr_manifesto.Text ) <> '' then
    begin
      qry_di_altera_.Close;
      qry_di_altera_.ParamByName('NR_PROCESSO').AsString := qry_proc_altera_NR_PROCESSO.AsString;
      qry_di_altera_.Prepare;
      qry_di_altera_.Open;
      if Not qry_di_altera_.EOF then
      begin
        qry_di_altera_.Edit;
        qry_di_altera_NR_MANIFESTO.AsString := msk_nr_manifesto.Text;
        qry_di_altera_.Post;
      end;
      qry_di_altera_.Close;
    end;

    if ( Trim( msk_cd_evento.Text ) <> '' ) and
       ( qry_yes_no_CD_YESNO.AsString <> '' ) then
    begin
      qry_flp_altera_.Close;
      qry_flp_altera_.ParamByName('NR_PROCESSO').AsString := qry_proc_altera_NR_PROCESSO.AsString;
      qry_flp_altera_.ParamByName('CD_EVENTO').AsString   := Trim( msk_cd_evento.Text );
      qry_flp_altera_.Prepare;
      qry_flp_altera_.Open;
      if Not qry_flp_altera_.EOF then
      begin
        qry_flp_altera_.Edit;
        qry_flp_altera_IN_APLICAVEL.AsString := qry_yes_no_CD_YESNO.AsString;
        qry_flp_altera_.Post;
      end;
      qry_flp_altera_.Close;
    end;
    {Atualiza Processo}
    CloseStoredProc( sp_atualiza_processo );
    sp_atualiza_processo.ParamByName('@NR_PROCESSO').AsString := qry_proc_altera_NR_PROCESSO.AsString;
    ExecStoredProc( sp_atualiza_processo );
    CloseStoredProc( sp_atualiza_processo );
  end;
end;

procedure Tfrm_repassa_dados.btn_co_navio2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2225';

  Application.CreateForm( Tfrm_emb, frm_emb );

  with frm_emb do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_navio2.Text := frm_emb.Cons_OnLine_Texto;
  vStr_cd_modulo                 := '01';
  str_cd_rotina                 := '0117';

  msk_cd_navio2Exit(nil);
end;

procedure Tfrm_repassa_dados.msk_cd_navio2Exit(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    {Navio}
    if (msk_cd_navio2.Text <> '') then
    begin
      ValCodEdt( msk_cd_navio2 );
      if not ( qry_embarc_.Locate( 'CD_EMBARCACAO', msk_cd_navio2.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem('Embarcação de Atracação inexistente!', 2);
        msk_cd_navio2.Text := '';
        edt_nm_navio2.Text := '';
        msk_cd_navio2.SetFocus;
      end
      else
      begin
        edt_nm_navio2.Text := qry_embarc_NM_EMBARCACAO.AsString;
      end;
    end
    else
    begin
      edt_nm_navio2.Text   := '';
    end;
  end;
end;

procedure Tfrm_repassa_dados.btn_co_viagemClick(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    if Trim( msk_cd_navio.Text ) = '' then
    begin
      BoxMensagem( 'Informe um Navio', 3 );
      msk_cd_navio.SetFocus;
      Exit;
    end;
    vStr_cd_modulo := '01';
    str_cd_rotina := '0124';
    Application.CreateForm( Tfrm_viagem, frm_viagem );
    with frm_viagem do
    begin
      co_cd_unid_neg    := frm_repassa_dados.msk_cd_unid_neg.Text;
      co_cd_produto     := frm_repassa_dados.msk_cd_produto.Text;
      co_cd_embarcacao  := frm_repassa_dados.msk_cd_navio.Text;
      lCons_OnLine      := True;
      ShowModal;
      lCons_OnLine      := False;
      if ( Cons_OnLine_Texto <> '' ) then
      begin
        msk_nr_viagem.Text := Cons_OnLine_Texto;
        msk_nr_viagemExit(nil);
      end;
    end;
    vStr_cd_modulo := st_cd_modulo;
    str_cd_rotina := st_cd_rotina;
  end;
end;

procedure Tfrm_repassa_dados.btn_co_viagem2Click(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    if Trim( msk_cd_navio2.Text ) = '' then
    begin
      BoxMensagem( 'Informe um Navio!', 3 );
      msk_cd_navio2.SetFocus;
      Exit;
    end;
    vStr_cd_modulo := '01';
    str_cd_rotina := '0124';
    Application.CreateForm( Tfrm_viagem, frm_viagem );
    with frm_viagem do
    begin
      co_cd_unid_neg    := frm_repassa_dados.msk_cd_unid_neg2.Text;
      co_cd_produto     := frm_repassa_dados.msk_cd_produto2.Text;
      co_cd_embarcacao  := frm_repassa_dados.msk_cd_navio2.Text;
      lCons_OnLine      := True;
      ShowModal;
      lCons_OnLine      := False;
      if ( Cons_OnLine_Texto <> '' ) then
      begin
        msk_nr_viagem2.Text := Cons_OnLine_Texto;
        msk_nr_viagem2Exit(nil);
      end;
    end;
    vStr_cd_modulo := st_cd_modulo;
    str_cd_rotina := st_cd_rotina;
  end;
end;

procedure Tfrm_repassa_dados.msk_nr_viagemExit(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    if Trim( msk_nr_viagem.Text ) <> '' then
    begin
      qry_viagem_.Close;
      qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
      qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := msk_cd_navio.Text;
      qry_viagem_.ParamByName('NR_VIAGEM').AsString     := msk_nr_viagem.Text;
      qry_viagem_.Prepare;
      qry_viagem_.Open;
      if qry_viagem_.RecordCount = 0 then
      begin
        BoxMensagem( 'Nº da Viagem inválido!', 2 );
        pgctrl_pesq_proc.ActivePage := ts_filtros;
        msk_nr_viagem.SetFocus;
        Exit;
      end;
      qry_viagem_.Close;
    end;
  end;
end;

procedure Tfrm_repassa_dados.msk_nr_viagem2Exit(Sender: TObject);
begin
  with datm_repassa_dados do
  begin
    if Trim( msk_nr_viagem2.Text ) <> '' then
    begin
      qry_viagem_.Close;
      qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg2.Text;
      qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto2.Text;
      qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := msk_cd_navio2.Text;
      qry_viagem_.ParamByName('NR_VIAGEM').AsString     := msk_nr_viagem2.Text;
      qry_viagem_.Prepare;
      qry_viagem_.Open;
      if qry_viagem_.RecordCount = 0 then
      begin
        BoxMensagem( 'Nº da Viagem inválido!', 2 );
        pgctrl_pesq_proc.ActivePage := ts_lista;
        msk_nr_viagem2.SetFocus;
        Exit;
      end;
      qry_viagem_.Close;
    end;
  end;
end;

end.
