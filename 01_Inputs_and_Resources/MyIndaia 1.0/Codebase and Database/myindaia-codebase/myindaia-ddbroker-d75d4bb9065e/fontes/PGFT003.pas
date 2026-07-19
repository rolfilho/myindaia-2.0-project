(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGFT003.PAS - Solicitação de Faturamento - frm_fat_sol
Manutenção:
Data Manutenção: 28/06/2006
*************************************************************************************************)
unit PGFT003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ComCtrls, StdCtrls, Db, DBCtrls, Buttons, ExtCtrls, Menus, Grids,
  DBGrids, DBTables, DateUtils, Funcoes;

  type
  Tfrm_fat_sol = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_fat_sol: TPageControl;
    ts_solicitacao: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_selecao: TPanel;
    Label3: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_dt_movimento: TMaskEdit;
    lbl_dt_solic_ch: TLabel;
    DBEdit2: TDBEdit;
    ts_processo: TTabSheet;
    dbg_processo: TDBGrid;
    dbg_faturamento_cc: TDBGrid;
    ts_item: TTabSheet;
    dbg_item: TDBGrid;
    lbl_cd_cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    lbl_cd_servico: TLabel;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    msk_vl_cred_proc: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    msk_vl_saldo_proc: TMaskEdit;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    Label17: TLabel;
    dbg_solicitacao: TDBGrid;
    Label18: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    Label22: TLabel;
    pnl_item: TPanel;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    btn_co_item: TSpeedButton;
    dbedt_vl_inf: TDBEdit;
    lbl_vl_lanc_fatur: TLabel;
    dbedt_vl_calc: TDBEdit;
    btn_calculo: TSpeedButton;
    mi_calcular: TMenuItem;
    msk_vl_deb_proc: TMaskEdit;
    btn_canc_sol: TSpeedButton;
    mi_canc_sol: TMenuItem;
    Label23: TLabel;
    btn_fechar: TSpeedButton;
    mi_fechar: TMenuItem;
    dbedt_nr_processo: TDBEdit;
    dblkpcbox_restitui: TDBLookupComboBox;
    lblAtivo: TLabel;
    Label24: TLabel;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    btn_co_favorecido: TSpeedButton;
    Label26: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label27: TLabel;
    msk_dt_inicio: TMaskEdit;
    msk_dt_termino: TMaskEdit;
    Label28: TLabel;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    dbchk_cliente: TDBCheckBox;
    dbedt_nr_relatorio: TDBEdit;
    dbedt_nr_ano: TDBEdit;
    Label7: TLabel;
    Label29: TLabel;
    mi_refat: TMenuItem;
    btn_refat: TSpeedButton;
    btn_duplicar: TSpeedButton;
    mi_duplicar: TMenuItem;
    mi_solicitacao: TMenuItem;
    mi_emissao: TMenuItem;
    mi_nf_serv: TMenuItem;
    mi_nota_deb_cred: TMenuItem;
    ts_calculo: TTabSheet;
    dbgrd_item_area: TDBGrid;
    btn_item: TButton;
    pnl_botoes: TPanel;
    ts_docto: TTabSheet;
    DBGrid1: TDBGrid;
    pnl_documento: TPanel;
    lbl_documento: TLabel;
    btn_co_documento: TSpeedButton;
    lbl_nr_docto: TLabel;
    lbl_forma: TLabel;
    dbedt_cd_documento: TDBEdit;
    dbedt_nm_documento: TDBEdit;
    dbedt_nr_docto: TDBEdit;
    dblckpbox_forma_docto: TDBLookupComboBox;
    DemonstrativoDespesas1: TMenuItem;
    chkProcessos: TCheckBox;
    Label31: TLabel;
    btn_centro_custo: TSpeedButton;
    dbedt_cd_ct_custo: TDBEdit;
    dbedt_nm_ct_custo: TEdit;
    btnPreviewCalc: TSpeedButton;
    pnl_dados_basicos: TPanel;
    lbl_doc_hist: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    btn_co_hist: TSpeedButton;
    Label30: TLabel;
    dbm_tx_observacao: TDBMemo;
    dbrg_tp_fatura: TDBRadioGroup;
    dbedt_nr_nota: TDBEdit;
    dbedt_data_fatura: TDBEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    db_nr_solicitacao: TDBEdit;
    dbedt_dt_solicitacao: TDBEdit;
    dbedt_nm_solicitante: TDBEdit;
    dbcb_calculado: TDBCheckBox;
    msk_vl_cred_sol: TMaskEdit;
    msk_vl_deb_sol: TMaskEdit;
    msk_vl_saldo_sol: TMaskEdit;
    dbedt_dt_calculo: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dbedt_dt_impressao: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    dbedt_dt_cancelamento: TDBEdit;
    dbedt_nm_cancelador: TDBEdit;
    db_dt_venc_fat_: TDBEdit;
    dblckpbox_in_liq_aut: TDBLookupComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_manut_proc: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure pgctrl_fat_solChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure AbreFatur( Unidade : String; Produto : String ; Data : TDate);
    procedure msk_dt_movimentoExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_fat_solChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbrg_tp_faturaClick(Sender: TObject);
    procedure dbm_tx_observacaoChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure btn_canc_solClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure btn_fecharClick(Sender: TObject);
    procedure dbm_tx_observacaoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure db_dt_venc_fat_KeyPress(Sender: TObject; var Key: Char);
    procedure HabilitaProc( Hab : Boolean );
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_terminoExit(Sender: TObject);
    procedure msk_dt_movimentoEnter(Sender: TObject);
    procedure btn_co_histClick(Sender: TObject);
    procedure dbg_faturamento_ccDblClick(Sender: TObject);
    procedure btn_refatClick(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure mi_nf_servClick(Sender: TObject);
    procedure mi_nota_deb_credClick(Sender: TObject);
    procedure dbedt_nr_notaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_itemClick(Sender: TObject);
    procedure dbedt_cd_documentoChange(Sender: TObject);
    procedure dbedt_cd_documentoExit(Sender: TObject);
    procedure btn_co_documentoClick(Sender: TObject);
    procedure DemonstrativoDespesas1Click(Sender: TObject);
    procedure btn_centro_custoClick(Sender: TObject);
    procedure btnPreviewCalcClick(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
  private
    DataInicial, DataFinal : TDateTime;
    Pesquisa, cd_documento, nr_processo, nr_solicitacao, cd_item, st_modulo, st_rotina, dt_movimento_fat : String;
    cd_unid_neg_fat, cd_produto_fat : String[2];
    dt_inicio, dt_termino : TDate;
    function RetornaDias: Integer;
    function AvisoRetencao: String;
    function TotalRetencao: String;
    function NFAcumulada: String;
    function Remessa: String;
    function VerAlt : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure DataVenctoFat;
    procedure Cancelar;
    procedure CodExits;
    procedure Botoes;
    procedure CalculaItens;
    procedure InserePagosCli;
    procedure InsereDoctosCli;
    procedure ExcluiDoctosCli;
    procedure CalculaData;
    function VerificaRetencao: Boolean;
    procedure CalculaSolic(const pFlagPreview : Boolean);
  public
    cd_grupo : String;
    cd_cliente : String;
    st_exc, st_calculo, st_canc_sol, st_fechar, st_abrindo, lNaoConsiste : Boolean;
    st_modificar,  st_incluir, st_excluir, st_modificar_nr_fatura : Boolean;
    function VerificaRetencaoFinal : Boolean;
    procedure btn_mi_excluir;
  end;

var
  frm_fat_sol: Tfrm_fat_sol;
  cDiaUtilEmissaoFatura : String[1];

implementation

uses GSMLIB,  PGGP001, PGGP015, PGGP017, PGFT004, PGSM010, PGSM018, PGSM059,
     PGSM104, PGSM119, PGSM146, PGSM174, PGSM090, PGSM136, PGSM208,
     PGPE021, ConsOnLineEx, PGGP018;

{$R *.DFM}


function Tfrm_fat_sol.RetornaDias: Integer;
begin
  cDiaUtilEmissaoFatura := '';

  with datm_fat_sol.qry_cliente_habil_ do
  begin
     Close;
     ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
     ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
     ParamByName('CD_PRODUTO').AsString  := datm_fat_sol.qry_processo_CD_PRODUTO.AsString;
     Prepare;
     Open;
     if Not EOF then
     begin
       cDiaUtilEmissaoFatura := FieldByName('IN_DIA_UTIL_EMISSAO_FAT').AsString;
       Result := FieldByName('NR_DIAS_VENCTO_FATURA').AsInteger;
     end
     else Result := 0;
     Close;
  end;
end;


function cli_responsavel( processo: String ): Boolean;
var qry: TQuery;
    cliente, unidade, produto: String;
begin
  result := false;
  qry := TQuery.Create( frm_fat_sol );
  with qry do
  begin
    Close;
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('Select CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO from TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ processo + '"');
    Open;
    if RecordCount = 0 then Exit
    else
    begin
      cliente := qry.FieldByName('CD_CLIENTE').AsString;
      unidade := qry.FieldByName('CD_UNID_NEG').AsString;
      produto := qry.FieldByName('CD_PRODUTO').AsString;
    end;
    Close;
    Free;
  end;
  with datm_fat_sol.qry_cliente_habil_ do
  begin
     Close;
     ParamByName('CD_CLIENTE').asString  := cliente;
     ParamByname('CD_UNID_NEG').asString := unidade;
     ParamByName('CD_PRODUTO').asString  := produto;
     Prepare;
     Open;
     if FieldByName('CD_RESPONSAVEL').asString = 'C' then result := true
     else result := false;
     Close;
  end;
end;

procedure Tfrm_fat_sol.FormCreate(Sender: TObject);
begin
  st_modulo     := vStr_cd_modulo;
  st_rotina     := str_cd_rotina;

  vStr_cd_modulo := '11';
  str_cd_rotina := '1140';

  AtribuiDireitos( st_modificar_nr_fatura, st_incluir, st_excluir );

  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;

  st_modificar  := False;
  st_incluir    := False;
  st_excluir    := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );


  //Rodrigo Capra - Modo Preview - Faturamento 09/06/2008
  if ConsultaLookUPSQL('select ISNULL(IN_MODO_PREVIEW,''0'') IN_MODO_PREVIEW FROM TUSUARIO where CD_USUARIO = ''' + str_cd_usuario + '''','IN_MODO_PREVIEW') = '1' then
  begin
    btnPreviewCalc.Visible := True;
    btn_calculo.Visible    := not(btnPreviewCalc.Visible);
    btn_canc_sol.Visible   := not(btnPreviewCalc.Visible);
  end
  else
  begin
    btnPreviewCalc.Visible := True;
    btn_calculo.Visible    := True;
    btn_canc_sol.Visible   := True;
  end;

  // Cria o DataModule de Dados do módulo Solicitação de Faturamento
  Application.CreateForm( Tdatm_fat_sol, datm_fat_sol );
end;


procedure Tfrm_fat_sol.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled   := Inc;   mi_incluir.Enabled     := Inc;
  btn_salvar.Enabled    := Salv;  mi_salvar.Enabled      := Salv;
  btn_Cancelar.Enabled  := Canc;  mi_Cancelar.Enabled    := Canc;
  btn_canc_sol.Enabled  := st_excluir;   mi_Cancelar.Enabled    := Exc;
  btn_excluir.Enabled   := st_excluir;   mi_excluir.Enabled    := Exc;
end;


procedure Tfrm_fat_sol.pgctrl_fat_solChange(Sender: TObject);
var
Tp_Retencao : string;
begin
  btn_manut_proc.Enabled := False;
  datm_fat_sol.qry_fat_proc_AfterScroll(nil);

  if ts_calculo.TabVisible then
  begin
    ts_calculo.TabVisible := False;
  end;

  btn_mi_excluir;

  if ( pgctrl_fat_sol.ActivePage = ts_dados_basicos ) then
  begin
    HabDes( dbedt_nr_nota, st_modificar_nr_fatura );
  end;

  if ( pgctrl_fat_sol.ActivePage = ts_dados_basicos ) or ( pgctrl_fat_sol.ActivePage = ts_solicitacao ) then
  begin
    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;
    dbrg_tp_fatura.Enabled := dbedt_nr_nota.Text = '';
//    Tp_Retencao:= ConsultaLookUPSQL('select IN_TP_RETENCAO_IR from  TCLIENTE_HABILITACAO TC where CD_UNID_NEG='''+ datm_fat_sol.qry_processo_CD_UNID_NEG.AsString +''' and cd_produto = '''+ datm_fat_sol.qry_processo_CD_PRODUTO.AsString +''' and cd_cliente= '''+ datm_fat_sol.qry_processo_CD_CLIENTE.AsString +'''   ','IN_TP_RETENCAO_IR');
    //acrescentado para habilitar a data se o tp_retenção for não reter ou sempre reter --Andressa
{    if (trim(Tp_Retencao) = '0') or (trim(Tp_Retencao)='3') or (dbedt_nr_nota.Text = '') then
      db_dt_venc_fat_.Enabled :=true
    else
      db_dt_venc_fat_.Enabled :=false;}
    //db_dt_venc_fat_.Enabled := dbedt_nr_nota.Text = '';

    if VerificaRetencaoFinal = False then
      db_dt_venc_fat_.Enabled := False
    else
      db_dt_venc_fat_.Enabled := True;

    dblckpbox_in_liq_aut.Enabled := dbedt_nr_nota.Text = '';
  end;

  if ( pgctrl_fat_sol.ActivePage = ts_processo ) then
  begin
    if ( datm_fat_sol.qry_fat_.RecordCount <= 0 ) or ( datm_fat_sol.qry_fat_IN_CANCELADO.AsString = '1' ) then
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end
    else
    begin
      btn_incluir.Enabled := True;
      mi_incluir.Enabled  := True;
      btn_manut_proc.Enabled := True;      
    end;
  end;

  if ( pgctrl_fat_sol.ActivePage = ts_item ) then
  begin
    if ( datm_fat_sol.qry_fat_proc_.RecordCount <= 0 ) then
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end
    else
    begin
      btn_incluir.Enabled := True;
      mi_incluir.Enabled  := True;
    end;
    pnl_item.Enabled := dbedt_nr_nota.Text = '';    
  end;

  // Documentos
  if ( pgctrl_fat_sol.ActivePage = ts_docto ) then
  begin
    if ( datm_fat_sol.qry_fat_.RecordCount <= 0 ) then
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end
    else
    begin
      btn_incluir.Enabled := True;
      mi_incluir.Enabled  := True;
      if ( datm_fat_sol.qry_fat_docto_.RecordCount > 0 ) then
      begin
        btn_excluir.Enabled := True;
        mi_excluir.Enabled  := True;
      end
    end;
  end;

  if pgctrl_fat_sol.ActivePage = ts_solicitacao then
    dbnvg.Enabled := True
  else
    dbnvg.Enabled := False;

  //solicitação: incluir, alterar somente tipo de faturamento (quando não calculado) e observação(sempre), cancelar
  //processo: incluir e excluir somente quando não calculado
  //item: incluir, alterar, excluir somente quando não POSSUI VALOR calculado
  //documento: incluir, alterar, excluir
end;


procedure Tfrm_fat_sol.FormShow(Sender: TObject);
begin
  pnl_botoes.Color := clMenuBroker;
  ts_calculo.TabVisible := false;
  with datm_fat_sol do
  begin
    ds_fat.AutoEdit           := st_modificar;
    ds_fat_proc.AutoEdit      := st_modificar;
    ds_fat_proc_item.AutoEdit := st_modificar;

    qry_tp_forma_doc_.Close;
    qry_tp_forma_doc_.Prepare;
    qry_tp_forma_doc_.Open;

    a_str_indices[0] := 'NR_SOLICITACAO';
    a_str_indices[1] := 'NR_NOTA_FATURA';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Nº Solicitação');
      Items.Add('Nº Nota/Fatura');
      ItemIndex := 0;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );

  lNaoConsiste := False;
  msk_cd_unid_neg.Text   := str_cd_unid_neg;
  msk_cd_produto.Text    := str_cd_produto;

  st_calculo := True;
  st_canc_sol := True;
  st_fechar := True;

  with datm_fat_sol do
  begin
    qry_controle_.Close;
    qry_controle_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_controle_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_controle_.Prepare;
    qry_controle_.Open;
    btn_mi( st_incluir, False, False, False );
    if qry_controle_.RecordCount <= 0 then
    begin
      msk_dt_movimento.Text  := FormatDateTime('dd/mm/yyyy', dt_server );
    end
    else
    begin
      qry_controle_.Last;
      if qry_controle_IN_FECHADO.AsString = '0' then
      begin
        msk_dt_movimento.Text := FormatDateTime('dd/mm/yyyy', qry_controle_DT_MOVIMENTO.AsDateTime );
      end
      else
      begin
        if Date > ( qry_controle_DT_MOVIMENTO.AsDateTime + 1 ) then
            msk_dt_movimento.Text  := FormatDateTime('dd/mm/yyyy', Date)
        else
        begin
          Btn_mi(True, False, False, False);
          msk_dt_movimento.Text := FormatDateTime('dd/mm/yyyy', ( qry_controle_DT_MOVIMENTO.AsDateTime + 1 ) );
        end;
      end;
    end;
  end;

  AbreFatur( str_cd_unid_neg, str_cd_produto, StrToDate( msk_dt_movimento.Text ) );

  st_abrindo := True;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  st_abrindo := False;

  pgctrl_fat_sol.ActivePage := ts_solicitacao;
  dbnvg.Enabled             := True;
  dbnvg.DataSource          := datm_fat_sol.ds_fat;
  btn_canc_sol.Enabled := st_excluir;
end;


procedure Tfrm_fat_sol.msk_cd_unid_negExit(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit, dsInsert] ) or
     ( cd_unid_neg_fat = msk_cd_unid_neg.Text ) then Exit;
  if Not VerAlt then Exit;
  with datm_fat_sol do
  begin
    if ( Not ( qry_fat_.State in [dsInsert, dsEdit] ) ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      if ( msk_cd_produto.Text <> '' ) and ( msk_cd_produto.Text <> '' ) then
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;

          if Not st_abrindo then
          begin
            nr_solicitacao := qry_fat_NR_SOLICITACAO.AsString;
            nr_processo    := qry_fat_proc_NR_PROCESSO.AsString;
            cd_item        := qry_fat_proc_item_CD_ITEM.AsString;
            cd_documento   := qry_fat_docto_CD_DOCUMENTO.AsString;

            if msk_dt_movimento.Text <> '  /  /    ' then
              AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  StrToDate( msk_dt_movimento.Text ) )
            else
              AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  dt_server );

            qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_proc_item_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO;CD_ITEM',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo, cd_item]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_docto_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;CD_DOCUMENTO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, cd_documento]),
                          [loCaseInsensitive, loPartialKey]);
          end;
        end
        else
        begin                                              
          BoxMensagem( 'Unidade de Negócio inválida!', 2 );
          edt_nm_unid_neg.Text := '';
          msk_cd_unid_neg.SetFocus;
          Exit;
        end;
      end
      else
      begin
        edt_nm_unid_neg.Text := '';
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_fat_sol do
    begin
      qry_fat_.Close;
      qry_fat_proc_.Close;
      qry_fat_proc_item_.Close;
      qry_fat_docto_.Close;
      qry_fat_cc_.Close;
      qry_tipo_item_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;


procedure Tfrm_fat_sol.msk_cd_produtoExit(Sender: TObject);
begin
  if ( cd_produto_fat = msk_cd_produto.Text ) then Exit;
  if Not VerAlt then Exit;
  with datm_fat_sol do
  begin
    if ( Not ( qry_fat_.State in [dsInsert, dsEdit] ) ) then
    begin
      ValCodEdt( msk_cd_produto );
      if ( msk_cd_produto.Text <> '' ) and ( msk_cd_produto.Text <> '' ) then
      begin
        qry_produto_.Close;
        qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;

          if Not st_abrindo then
          begin
            nr_solicitacao := qry_fat_proc_item_NR_SOLICITACAO.AsString;
            nr_processo    := qry_fat_proc_item_NR_PROCESSO.AsString;
            cd_item        := qry_fat_proc_item_CD_ITEM.AsString;
            cd_documento   := qry_fat_docto_CD_DOCUMENTO.AsString;

            if msk_dt_movimento.Text <> '  /  /    ' then
              AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  StrToDate( msk_dt_movimento.Text ) )
            else
              AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  dt_server );

            qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_proc_item_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO;CD_ITEM',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo, cd_item]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_docto_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;CD_DOCUMENTO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, cd_documento]),
                          [loCaseInsensitive, loPartialKey]);
          end;
        end
        else
        begin
          BoxMensagem('Produto inválido!', 2);
          edt_nm_produto.Text := '';
          msk_cd_produto.SetFocus;
          Exit;
        end;
      end
      else
      begin
        edt_nm_produto.Text := '';
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.AbreFatur( Unidade : String; Produto : String; Data : TDate);
begin
  with datm_fat_sol do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := Unidade;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := Produto;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_.RecordCount > 0  then
    begin
      qry_docto_.Close;
      qry_docto_.ParamByName('CD_UNID_NEG').AsString := Unidade;
      qry_docto_.ParamByName('CD_PRODUTO').AsString  := Produto;
      qry_docto_.Prepare;
      qry_docto_.Open;

      qry_tipo_item_.Close;
      qry_tipo_item_.Prepare;
      qry_tipo_item_.Open;

      qry_fat_.Close;
      qry_fat_.ParamByName('CD_UNID_NEG').AsString := Unidade;
      qry_fat_.ParamByName('CD_PRODUTO').AsString  := Produto;
      qry_fat_.ParamByName('DT_FATURA').AsDateTime := Data;
      qry_fat_.Prepare;
      qry_fat_.Open;

      qry_fat_proc_.Close;
      qry_fat_proc_.Prepare;
      qry_fat_proc_.Open;

      qry_processo_.Close;
      qry_processo_.Prepare;
      qry_processo_.Open;

      qry_fat_proc_item_.Close;
      qry_fat_proc_item_.Prepare;
      qry_fat_proc_item_.Open;

      qry_fat_docto_.Close;
      qry_fat_docto_.Prepare;
      qry_fat_docto_.Open;
    end
    else
    begin
      BoxMensagem( 'Usuário não possui habilitação para esta Unidade/Produto!', 2 );
    end;
    qry_usuario_habilitacao_.Close;
    Exit;
  end;
end;


procedure Tfrm_fat_sol.msk_dt_movimentoExit(Sender: TObject);
begin
  if dt_movimento_fat = msk_dt_movimento.Text then Exit;
  if Not VerAlt then Exit;
  with datm_fat_sol do
  begin
    if ( Not ( qry_fat_.State in [dsInsert, dsEdit] ) ) then
    begin
      if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text <> '' ) then
      begin
        nr_solicitacao := qry_fat_proc_item_NR_SOLICITACAO.AsString;
        nr_processo    := qry_fat_proc_item_NR_PROCESSO.AsString;
        cd_item        := qry_fat_proc_item_CD_ITEM.AsString;
        cd_documento   := qry_fat_docto_CD_DOCUMENTO.AsString;

        if msk_dt_movimento.Text <> '  /  /    ' then
          AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) )
        else
          AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, dt_server );

        qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                        [loCaseInsensitive, loPartialKey]);

        qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                        [loCaseInsensitive, loPartialKey]);

        qry_fat_proc_item_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO;CD_ITEM',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo, cd_item]),
                        [loCaseInsensitive, loPartialKey]);

        qry_fat_docto_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;CD_DOCUMENTO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, cd_documento]),
                        [loCaseInsensitive, loPartialKey]);

        qry_controle_.Close;
        qry_controle_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_controle_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_controle_.Prepare;
        qry_controle_.Open;
        if qry_controle_.Locate('CD_UNID_NEG;CD_PRODUTO;DT_MOVIMENTO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate(msk_dt_movimento.Text)]),
                      [loCaseInsensitive, loPartialKey]) then
        begin
          if qry_controle_IN_FECHADO.AsString = '0' then
          begin
            mi_incluir.Enabled        := True;
            btn_incluir.Enabled       := True;
            if ( pgctrl_fat_sol.ActivePage = ts_processo ) or
               ( pgctrl_fat_sol.ActivePage = ts_item ) then
            begin
              btn_excluir.Enabled     := True;
              mi_excluir.Enabled      := True;
            end;
            mi_calcular.Enabled       := True;
            btn_calculo.Enabled       := True;
            btnPreviewCalc.Enabled    := True;
            mi_fechar.Enabled         := True;
            btn_fechar.Enabled        := True;
            mi_duplicar.Enabled       := True;
            btn_duplicar.Enabled      := True;
            ds_fat.AutoEdit           := True;
            ds_fat_proc.AutoEdit      := True;
            ds_fat_proc_item.AutoEdit := True;
          end
          else
          begin
            mi_incluir.Enabled        := False;
            btn_incluir.Enabled       := False;
            mi_salvar.Enabled         := False;
            btn_salvar.Enabled        := False;
            mi_cancelar.Enabled       := False;
            btn_cancelar.Enabled      := False;
            mi_excluir.Enabled        := False;
            btn_excluir.Enabled       := False;
            mi_calcular.Enabled       := False;
            btn_calculo.Enabled       := False;
            btnPreviewCalc.Enabled    := False;
            mi_fechar.Enabled         := False;
            btn_fechar.Enabled        := False;
            mi_duplicar.Enabled       := False;
            btn_duplicar.Enabled      := False;
            mi_canc_sol.Enabled       := False;
            btn_canc_sol.Enabled      := False;
            ds_fat_proc.AutoEdit      := False;
            ds_fat_proc_item.AutoEdit := False;
          end;
        end
        else
        begin
          mi_incluir.Enabled        := True;
          btn_incluir.Enabled       := True;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.btn_cd_unid_negClick(Sender: TObject);
begin
  with datm_fat_sol do
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

procedure Tfrm_fat_sol.btn_cd_produtoClick(Sender: TObject);
begin
  with datm_fat_sol do
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
end;


procedure Tfrm_fat_sol.btn_incluirClick(Sender: TObject);
var
  vPrefixo : String;
begin
  msk_dt_movimento.Enabled := False;

  if btn_excluir.Enabled then
    st_exc := True
  else
    st_exc := False;
  if btn_calculo.Enabled then
    st_calculo := True
  else
    st_calculo := False;

  if btn_canc_sol.Enabled then
    st_canc_sol := True
  else
    st_canc_sol := False;
  if btn_fechar.Enabled then
    st_fechar := True
  else
    st_fechar := False;

  if ( pgctrl_fat_sol.ActivePage = ts_solicitacao ) or
     ( pgctrl_fat_sol.ActivePage = ts_dados_basicos ) then
  begin
    with datm_fat_sol do
    begin
      qry_controle_.Close;
      qry_controle_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_controle_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_controle_.Prepare;
      qry_controle_.Open;
      if Not qry_controle_.Locate('CD_UNID_NEG;CD_PRODUTO;DT_MOVIMENTO',
         VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate(msk_dt_movimento.Text)]),
                    [loCaseInsensitive, loPartialKey]) then
      begin
        qry_controle_.Append;
        qry_controle_CD_UNID_NEG.AsString    := msk_cd_unid_neg.Text;
        qry_controle_CD_PRODUTO.AsString     := msk_cd_produto.Text;
        qry_controle_DT_MOVIMENTO.AsDateTime := StrToDate(msk_dt_movimento.Text);
        qry_controle_IN_FECHADO.AsString     := '0';
        qry_controle_CD_USUARIO.AsString     := str_cd_usuario;
      end;

      if ConsultaLookUPSQL(' SELECT MAX(NR_SOLICITACAO) BLA FROM TS_FATURA (NOLOCK) WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+'''  AND'+
                           ' CD_PRODUTO = '''+msk_cd_produto.Text+'''  AND'+
                           ' SUBSTRING( NR_SOLICITACAO, 1, 2 ) = '''+Copy(msk_dt_movimento.Text, 9, 2)+'''', 'BLA') = Copy(msk_dt_movimento.Text, 9, 2)+ '9999' then
        if ConsultaLookUPSQL(' SELECT MAX(NR_SOLICITACAO) BLA FROM TS_FATURA (NOLOCK) WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+'''  AND'+
                             ' CD_PRODUTO = '''+msk_cd_produto.Text+'''  AND'+
                             ' SUBSTRING( NR_SOLICITACAO, 1, 2 ) = ''A9''', 'BLA') = 'A'+Copy(msk_dt_movimento.Text, 10, 1)+ '9999'  then
          vPrefixo := 'B'
        else
          vPrefixo := 'A'
      else
        vPrefixo := Copy(msk_dt_movimento.Text, 9, 1);

      qry_fat_ult_.Close;
      qry_fat_ult_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
      qry_fat_ult_.ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
//NUMERAÇÃO ORIGINAL      qry_fat_ult_.ParamByName('SOLIC').AsString          := FormatDateTime('yy', StrToDate(msk_dt_movimento.Text));
      qry_fat_ult_.ParamByName('SOLIC').AsString          := vPrefixo + Copy( msk_dt_movimento.Text, 10, 1 ); //NUMERAÇÃO ALTERADA
      qry_fat_ult_.ParamByName('PREFIXO').AsString        := vPrefixo + Copy( msk_dt_movimento.Text, 10, 1 );
      qry_fat_ult_.Prepare;
      qry_fat_ult_.Open;
      if qry_fat_ult_.RecordCount <= 0 then
         nr_solicitacao := Copy( msk_dt_movimento.Text, 9, 2 ) + '0001'
      else
      begin
        qry_fat_ult_.Last;
        //Numeração original 17/11/2005
//NUMERAÇÃO ORIGINAL        nr_solicitacao := Copy( msk_dt_movimento.Text, 9, 2 ) +
//NUMERAÇÃO ORIGINAL                          StrZero( StrToInt( Copy( qry_fat_ult_NR_ULT_SOLICITACAO.AsString, 3, 4 ) ) + 1, 4 );
        // Numeração com letra e que soma 1 no A5/1000 - 21/12/2005
        //   SELECT ISNULL( MAX(NR_SOLICITACAO), 'A00000' ) NR_ULT_SOLICITACAO
        //   FROM   TS_FATURA (NOLOCK)
        //   WHERE ( CD_UNID_NEG = :CD_UNID_NEG ) AND
        //  ( CD_PRODUTO = :CD_PRODUTO ) AND
        //  SUBSTRING( NR_SOLICITACAO, 1, 2 ) = ( SELECT SUBSTRING( CONVERT( char(4), DATEPART( yyyy, :DT_MOVIMENTO ) ), 3, 2 )) AND
        //   ( ( ( SUBSTRING( NR_SOLICITACAO, 1, 2 ) = '02' ) AND ( SUBSTRING( NR_SOLICITACAO, 3, 4 ) < '9284' ) ) OR
        //   ( SUBSTRING( NR_SOLICITACAO, 1, 2 ) <> '02' ) )
        //nr_solicitacao := FormatDateTime('yy', StrToDate(msk_dt_movimento.Text)) + //'A' + Copy( msk_dt_movimento.Text, 10, 1 ) +
          //                StrZero( StrToInt( Copy( qry_fat_ult_NR_ULT_SOLICITACAO.AsString, 3, 4 ) ) + 1, 4 );
        nr_solicitacao := vPrefixo + Copy( msk_dt_movimento.Text, 10, 1 ) +
                  StrZero( StrToInt( Copy( qry_fat_ult_NR_ULT_SOLICITACAO.AsString, 3, 4 ) ) + 1, 4 );

      end;
      qry_fat_ult_.Close;

      qry_fat_.DisableControls;
      qry_fat_.Cancel;
      qry_fat_.Append;
      qry_fat_.EnableControls;

      qry_fat_CD_UNID_NEG.AsString        :=   msk_cd_unid_neg.Text;
      qry_fat_CD_PRODUTO.AsString         :=   msk_cd_produto.Text;
      qry_fat_NR_SOLICITACAO.AsString     :=   nr_solicitacao;
      qry_fat_DT_SOLICITACAO.AsDateTime   :=   Date;
      qry_fat_CD_USUARIO.AsString         :=   str_cd_usuario;
      qry_fat_TP_TIPO_FAT.AsString        :=   'F';
      qry_fat_DT_FATURA.AsDateTime        :=   StrToDate(msk_dt_movimento.Text);
      qry_fat_IN_CALCULADO.AsString       :=   '0';
      qry_fat_IN_CANCELADO.AsString       :=   '0';
      qry_fat_IN_IMP_NF_SERV.AsString     :=   '0';
      qry_fat_IN_LIQ_AUT.AsString         :=   '0';
      qry_fat_IN_PREVIEW.AsString         :=   '0';
    end;
    pgctrl_fat_sol.ActivePage := ts_dados_basicos;
    dbm_tx_observacao.SetFocus;
  end;

  if ( pgctrl_fat_sol.ActivePage = ts_processo ) then
  begin
    with datm_fat_sol do
    begin
      if qry_fat_IN_CALCULADO.AsString = '1' then
      begin
        BoxMensagem('Solicitação já foi calculada!', 3);
        msk_dt_movimento.Enabled := True;
        Exit;
      end;
      if not qry_fat_proc_.Active then
        AbreFatur( str_cd_unid_neg, str_cd_produto, StrToDate( msk_dt_movimento.Text ) );
      qry_fat_proc_.DisableControls;
      qry_fat_proc_.Cancel;
      qry_fat_proc_.Append;
      qry_fat_proc_.EnableControls;
      qry_fat_proc_CD_UNID_NEG.AsString    := qry_fat_CD_UNID_NEG.AsString;
      qry_fat_proc_CD_PRODUTO.AsString     := qry_fat_CD_PRODUTO.AsString;
      qry_fat_proc_NR_SOLICITACAO.AsString := qry_fat_NR_SOLICITACAO.AsString;

      HabilitaProc( True );
      msk_nr_processo.Text := '';
      msk_cd_grupo.Text    := '';
      msk_cd_grupoExit(nil);
      msk_cd_cliente.Text  := '';
      msk_cd_clienteExit(nil);
      msk_dt_inicio.Text   := '  /  /    ';
      msk_dt_termino.Text  := '  /  /    ';

      msk_nr_processo.SetFocus;
    end;
  end;

  if ( pgctrl_fat_sol.ActivePage = ts_item ) then
  begin
    with datm_fat_sol do
    begin
      if qry_fat_IN_CALCULADO.AsString = '1' then
      begin
        BoxMensagem('Solicitação já foi calculada!', 3);
        msk_dt_movimento.Enabled := True;
        Exit;
      end;

      qry_fat_proc_item_.DisableControls;
      qry_fat_proc_item_.Cancel;
      qry_fat_proc_item_.Append;
      qry_fat_proc_item_.EnableControls;
      qry_fat_proc_item_CD_UNID_NEG.AsString    := qry_fat_proc_CD_UNID_NEG.AsString;
      qry_fat_proc_item_CD_PRODUTO.AsString     := qry_fat_proc_CD_PRODUTO.AsString;
      qry_fat_proc_item_NR_SOLICITACAO.AsString := qry_fat_proc_NR_SOLICITACAO.AsString;
      qry_fat_proc_item_NR_PROCESSO.AsString    := qry_fat_proc_NR_PROCESSO.AsString;
      qry_fat_proc_item_VL_INFORMADO.AsFloat    := 0;
      qry_fat_proc_item_IN_RESTITUI.AsString    := '0';
      qry_fat_proc_item_IN_NAO_FAT.AsString     := '0';
      qry_fat_proc_item_IN_MANUAL.AsString      := '1';
      pnl_item.Enabled := True;
      dbedt_cd_item.SetFocus;
    end;
  end;

  // Documentos
  if ( pgctrl_fat_sol.ActivePage = ts_docto ) then
  begin
    with datm_fat_sol do
    begin
      qry_fat_docto_.DisableControls;
      qry_fat_docto_.Cancel;
      qry_fat_docto_.Append;
      qry_fat_docto_.EnableControls;
      qry_fat_docto_CD_UNID_NEG.AsString    := qry_fat_CD_UNID_NEG.AsString;
      qry_fat_docto_CD_PRODUTO.AsString     := qry_fat_CD_PRODUTO.AsString;
      qry_fat_docto_NR_SOLICITACAO.AsString := qry_fat_NR_SOLICITACAO.AsString;
      qry_fat_docto_CD_FORMA_DOC.AsString   := '0';
      pnl_documento.Enabled := True;
      dbedt_cd_documento.SetFocus;
    end;
  end;

  btn_mi(False, True, True, False );
  btn_excluir.Enabled    := False;
  mi_excluir.Enabled     := False;
  btn_calculo.Enabled    := False;
  btnPreviewCalc.Enabled := False;
  mi_calcular.Enabled    := False;
  btn_canc_sol.Enabled   := False;
  mi_canc_sol.Enabled    := False;
  btn_fechar.Enabled     := False;
  mi_fechar.Enabled      := False;

  msk_dt_movimento.Enabled := True;
end;


procedure Tfrm_fat_sol.btn_sairClick(Sender: TObject);
begin
  Close;
end;

function Tfrm_fat_sol.VerAlt;
begin
  VerAlt := True;
 if ( ( datm_fat_sol.qry_fat_.State in [dsEdit] ) and st_modificar ) or
      ( datm_fat_sol.qry_fat_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Solicitações do Faturamento foi alterado.' + #13#10 +
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

  if datm_fat_sol.qry_fat_proc_.State in [dsInsert, dsEdit] then
  begin
    if ( ( datm_fat_sol.qry_fat_proc_.State in [dsEdit] ) and st_modificar ) or
       ( datm_fat_sol.qry_fat_proc_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Processos do Faturamento foi alterado.' + #13#10 +
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

  if datm_fat_sol.qry_fat_proc_item_.State in [dsInsert, dsEdit] then
  begin
    if ( ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit] ) and st_modificar ) or
       ( datm_fat_sol.qry_fat_proc_item_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Itens do Faturamento foi alterado.' + #13#10 +
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

  // Documentos
  if datm_fat_sol.qry_fat_docto_.State in [dsInsert, dsEdit] then
  begin
    if ( ( datm_fat_sol.qry_fat_docto_.State in [dsEdit] ) and st_modificar ) or
       ( datm_fat_sol.qry_fat_docto_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Documentos do Faturamento foi alterado.' + #13#10 +
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
end;


function Tfrm_fat_sol.Consiste : Boolean;
begin
  Consiste := True;

  //Consistências para Processo
  if datm_fat_sol.qry_fat_proc_.State in [dsInsert, dsEdit] then
  begin
    //Nº Processo
    if Not lNaoConsiste then
    begin
      if ( msk_nr_processo.Text = '' ) and
         ( msk_cd_grupo.Text = '' ) and
         ( msk_cd_cliente.Text = '' ) and
         ( msk_dt_inicio.Text = '  /  /    ' ) and
         ( msk_dt_termino.Text = '  /  /    ' ) then
      begin
        BoxMensagem('Campo Nº processo deve ser preenchido!', 2);
        pgctrl_fat_sol.ActivePage := ts_processo;
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if msk_nr_processo.Text <> '' then
    begin
      with datm_fat_sol do
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString :=
           msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if Not qry_processo_.EOF then
        begin
          qry_tot_fat_proc_.Close;
          qry_tot_fat_proc_.Prepare;
          qry_tot_fat_proc_.Open;
          if qry_tot_fat_proc_.FieldByName('TOT_PROCESSO').AsInteger = 0 then
          begin
            qry_tot_fat_proc_.Close;
          end
          else
          begin
            qry_tot_fat_proc_.Close;
            qry_distinct_cliente_por_fatura_.Close;
            qry_distinct_cliente_por_fatura_.Prepare;
            qry_distinct_cliente_por_fatura_.Open;
            if Not qry_distinct_cliente_por_fatura_.Locate( 'CD_CLIENTE', qry_processo_CD_CLIENTE.AsString, [loCaseInsensitive] ) then
            begin
              BoxMensagem( 'Processo não cadastrado para este cliente!', 2 );
              pgctrl_fat_sol.ActivePage := ts_processo;
              msk_nr_processo.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
          //ok - Processo existente do mesmo cliente
          if Not lNaoConsiste then
          begin
            if ( qry_fat_TP_TIPO_FAT.AsString = 'F' ) then
            begin
              qry_proc_fat_.Close;
              qry_proc_fat_.Prepare;
              qry_proc_fat_.Open;
              if ( qry_proc_fat_.RecordCount ) > 0 then
              begin
                if Not(BoxMensagem('Esse processo já foi faturado. ' + #13 +
                                   'Última Solicitação ' + qry_proc_fat_NR_SOLICITACAO.AsString + #13 +
                                   'Data da Fatura ' + DateToStr(qry_proc_fat_DT_FATURA.AsDateTime) + #13 +
                                   'Deseja incluí-lo mesmo assim? ', 1)) then
                begin
                  pgctrl_fat_sol.ActivePage := ts_processo;
                  msk_nr_processo.SetFocus;
                  Consiste := False;
                  qry_proc_fat_.Close;
                  Exit;
                end
                else
                  qry_proc_fat_.Close;
              end
              else
                qry_proc_fat_.Close;
            end;
            // Se parâmetro IN_ND = '1', não verifica se eventos foram realizados
//            qry_verif_nd_.Close;
//            qry_verif_nd_.ParamByName('CD_CLIENTE').asString  := qry_processo_CD_CLIENTE.AsString;
//            qry_verif_nd_.ParamByname('CD_UNID_NEG').asString := msk_cd_unid_neg.Text;
//            qry_verif_nd_.ParamByName('CD_PRODUTO').asString  := msk_cd_produto.Text;
//            qry_verif_nd_.Prepare;
//            qry_verif_nd_.Open;
//            if qry_verif_nd_IN_ND.AsString = '0' then
//            begin
//              qry_pend_followup_.Close;
//              qry_pend_followup_.Prepare;
//              qry_pend_followup_.Open;
//              if qry_pend_followup_TOT_PEND.AsInteger > 0 then
//              begin
//                BoxMensagem('Os eventos desse processo não estão atualizados,' + #13 +
//                            'Favor atualiza-los antes do faturamento!', 2);
//                pgctrl_fat_sol.ActivePage := ts_processo;
//                msk_nr_processo.SetFocus;
//                Consiste := False;
//                Exit;
//              end;
//            end;

            if Not (qry_fat_proc_.State in [dsInsert, dsEdit]) then
            begin
              qry_fat_proc_.Edit;
            end;
            qry_fat_proc_NR_PROCESSO.AsString :=
              msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
          end
        end
        else
        begin
          msk_nr_processo.Text := '';
          BoxMensagem('Processo não cadastrado ou não liberado ou para esta Unidade/Produto!', 2);
          pgctrl_fat_sol.ActivePage := ts_processo;
          msk_nr_processo.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end
    else
    begin
      if Not lNaoConsiste then
      begin
        if ( msk_cd_grupo.Text = '' ) and
           ( msk_cd_cliente.Text = '' ) then
        begin
          BoxMensagem('Campo Grupo ou Cliente devem ser preenchidos!', 2);
          pgctrl_fat_sol.ActivePage := ts_processo;
          msk_cd_grupo.SetFocus;
          Consiste := False;
          Exit;
        end;

        if ( msk_dt_inicio.Text = '  /  /    ' ) then
        begin
          BoxMensagem('Campo Data de Início deve ser preenchida!', 2);
          pgctrl_fat_sol.ActivePage := ts_processo;
          msk_dt_inicio.SetFocus;
          Consiste := False;
          Exit;
        end;

        if ( msk_dt_termino.Text = '  /  /    ' ) then
        begin
          BoxMensagem('Campo Data de Término deve ser preenchida!', 2);
          pgctrl_fat_sol.ActivePage := ts_processo;
          msk_dt_termino.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  //Consistência para item
  if datm_fat_sol.qry_fat_proc_item_.State in [dsInsert, dsEdit] then
  begin
    //Item
    if Not lNaoConsiste then
    begin
      if dbedt_cd_item.Text = '' then
      begin
        BoxMensagem('Campo Item deve ser preenchido!', 2);
        pgctrl_fat_sol.ActivePage := ts_item;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if dbedt_cd_item.Text <> '' Then
    begin
      ValidCodigo( dbedt_cd_item );
      if dbedt_nm_item.Text = '' Then
      begin
        BoxMensagem('Código do Item inválido!',2);
        pgctrl_fat_sol.ActivePage := ts_item;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    //Valor Informado
    if Not lNaoConsiste then
    begin
      if StrToFloat( TiraPic ( dbedt_vl_inf.Text ) ) <= 0 then
      begin
        BoxMensagem('Campo Valor Informado deve ser maior que zero!', 2);
        pgctrl_fat_sol.ActivePage := ts_item;
        dbedt_vl_inf.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    //Favorecido
    if dbedt_cd_favorecido.Text <> '' Then
    begin
      ValidCodigo( dbedt_cd_favorecido );
      if dbedt_nm_favorecido.Text = '' Then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        pgctrl_fat_sol.ActivePage := ts_item;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Consistência para Documentos
  if datm_fat_sol.qry_fat_docto_.State in [dsInsert, dsEdit] then
  begin
    // Documento
    if Not lNaoConsiste then
    begin
      if dbedt_cd_documento.Text = '' then
      begin
        BoxMensagem( 'Campo Documento deve ser preenchido!', 2 );
        pgctrl_fat_sol.ActivePage := ts_docto;
        dbedt_cd_documento.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if dbedt_cd_documento.Text <> '' Then
    begin
      ValidCodigo( dbedt_cd_documento );
      if dbedt_nm_documento.Text = '' Then
      begin
        BoxMensagem( 'Código do Documento inválido!', 2 );
        pgctrl_fat_sol.ActivePage := ts_docto;
        dbedt_cd_documento.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Verifica se cliente possui documento cadastrado
    with datm_fat_sol do
    begin
      qry_cliente_doc_.Close;
      qry_cliente_doc_.ParamByName('CD_CLIENTE').AsString := dbedt_cd_cliente.Text;
      qry_cliente_doc_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_cliente_doc_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_cliente_doc_.ParamByName('CD_DOCUMENTO').AsString := dbedt_cd_documento.Text;
      qry_cliente_doc_.Prepare;
      qry_cliente_doc_.Open;
      if ( qry_cliente_doc_.Recordcount ) = 0 then
      begin
        BoxMensagem( 'Cliente não possui esse documento cadastrado. Cadastre-o em Empresa Nacional!', 2 );
        pgctrl_fat_sol.ActivePage := ts_docto;
        dbedt_cd_documento.SetFocus;
        Consiste := False;
        Exit;
      end;
      qry_cliente_doc_.Close;
    end;
  end;
end;


procedure Tfrm_fat_sol.Cancelar;
begin
  try
    if datm_fat_sol.qry_controle_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_sol.qry_controle_.Cancel;
      pgctrl_fat_sol.ActivePage := ts_solicitacao;
    end;

    if datm_fat_sol.qry_fat_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_sol.qry_fat_.Cancel;
      pgctrl_fat_sol.ActivePage := ts_solicitacao;
    end;

    if datm_fat_sol.qry_fat_proc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_sol.qry_fat_proc_.Cancel;
      pgctrl_fat_sol.ActivePage := ts_processo;
    end;

    if datm_fat_sol.qry_fat_proc_item_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_sol.qry_fat_proc_item_.Cancel;
      pgctrl_fat_sol.ActivePage := ts_item;
    end;

    // Documentos
    if datm_fat_sol.qry_fat_docto_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_sol.qry_fat_docto_.Cancel;
      pgctrl_fat_sol.ActivePage := ts_docto;
    end;

    btn_mi_excluir;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_mi(st_incluir, False, False, False );
  Botoes;
end;


function Tfrm_fat_sol.Grava : Boolean;
var Query: TQuery;
    vInNaoFat: string[1];
begin
  Grava := False;

  //Solicitação
  if datm_fat_sol.qry_fat_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_fat_sol do
      begin
        if qry_controle_.State in [dsInsert] then
        begin
          qry_controle_.Post;
        end;

        nr_solicitacao := qry_fat_NR_SOLICITACAO.AsString;
        qry_fat_.Post;
        datm_main.db_broker.Commit;
        Grava := True;

        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

        qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                      [loCaseInsensitive, loPartialKey]);
      end;

    except
      on E: Exception do
      begin
        datm_fat_sol.qry_fat_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  //Processo
  if datm_fat_sol.qry_fat_proc_.State in [dsInsert, dsEdit] then
  begin
    try
      with datm_fat_sol do
      begin
        if ( pgctrl_fat_sol.ActivePage = ts_processo ) and
           ( ( msk_cd_grupo.Text <> '' ) or
             ( msk_cd_cliente.Text <> '' ) ) then
        begin
          qry_fat_cliente_.Close;
          qry_fat_cliente_.ParamByName('CD_GRUPO').AsString   := msk_cd_grupo.Text;
          qry_fat_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
          qry_fat_cliente_.ParamByName('DT_INICIO').AsString  := msk_dt_inicio.Text;
          qry_fat_cliente_.ParamByName('DT_TERMINO').AsString := msk_dt_termino.Text;
          qry_fat_cliente_.Prepare;
          qry_fat_cliente_.Open;

          qry_fat_proc_.Cancel;
          qry_fat_cliente_.First;
          while Not ( qry_fat_cliente_.EOF ) do
          begin
            datm_main.db_broker.StartTransaction;
            qry_fat_proc_.DisableControls;
            qry_fat_proc_.Cancel;
            qry_fat_proc_.Append;
            qry_fat_proc_.EnableControls;
            qry_fat_proc_CD_UNID_NEG.AsString    := qry_fat_cliente_CD_UNID_NEG.AsString;
            qry_fat_proc_CD_PRODUTO.AsString     := qry_fat_cliente_CD_PRODUTO.AsString;
            qry_fat_proc_NR_SOLICITACAO.AsString := qry_fat_NR_SOLICITACAO.AsString;
            qry_fat_proc_NR_PROCESSO.AsString    := qry_fat_cliente_NR_PROCESSO.AsString;

            nr_solicitacao := qry_fat_proc_NR_SOLICITACAO.AsString;
            nr_processo    := qry_fat_proc_NR_PROCESSO.AsString;
            cd_cliente     := dbedt_cd_cliente.Text;

            qry_fat_proc_.Post;
            InserePagosCli;
            InsereDoctosCli;
            datm_main.db_broker.Commit;

            Grava := True;
            st_calculo := True;

            DataVenctoFat;
            CalculaItens;

            AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

            qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
               VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                          [loCaseInsensitive, loPartialKey]);

            qry_fat_cliente_.Next;
          end; //While
        end
        else
        begin

          datm_main.db_broker.StartTransaction;
          nr_solicitacao := qry_fat_proc_NR_SOLICITACAO.AsString;
          nr_processo    := qry_fat_proc_NR_PROCESSO.AsString;
          cd_cliente     := dbedt_cd_cliente.Text;

          qry_fat_proc_.Post;
          InserePagosCli;
          InsereDoctosCli;
          datm_main.db_broker.Commit;

          Grava := True;
          st_calculo := True;
          Query := TQuery.Create(nil);

          with Query do
          begin
            if cd_cliente = '00932' then
              vInNaoFat := '*'
            else
              vInNaoFat := '0';
          // Insere na TS_FATURA_PROCESSO_ITEM os itens de tipo destino 1(Débito Conta) e 5 (Borderô). Quando os itens aparecem mais
          // de uma vez na TSOLIC_PAGTO, seus valores são somados e então esse item é adicionado na TS_FATURA_PROCESSO_ITEM
            DatabaseName := 'DBBroker';
            SQL.Text := (
            ' INSERT INTO TS_FATURA_PROCESSO_ITEM ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, NR_PROCESSO, CD_ITEM, VL_CALCULADO,' +
            '  VL_INFORMADO, IN_RESTITUI, CD_FAVORECIDO, IN_NAO_FAT, IN_MANUAL ) ' +
            'SELECT "' + qry_fat_proc_CD_UNID_NEG.AsString + '", "' +  qry_fat_proc_CD_PRODUTO.AsString + '", ' + #13#10 +
            '"' + qry_fat_proc_NR_SOLICITACAO.AsString + '", "' + qry_fat_proc_NR_PROCESSO.AsString + '",' + #13#10 +
            ' CD_ITEM, VL_PAGTO, VL_PAGTO, "0", CD_FAVORECIDO, "' + vInNaoFat + '", "1" ' + #13#10 +
            'FROM TSOLIC_PAGTO ' + #13#10 +
            'WHERE NR_PROCESSO = "' + qry_fat_proc_NR_PROCESSO.AsString + '" AND TP_DESTINO IN ( "1", "5" ) AND '+ #13#10 +
            '      LTRIM( RTRIM( CD_STATUS ) ) NOT IN ( "4" ) AND ' + #13#10 +
            '      CD_ITEM NOT IN (SELECT CD_ITEM '+ #13#10 +
            '                      FROM TSOLIC_PAGTO ' + #13#10 +
            '                      WHERE NR_PROCESSO ="' + qry_fat_proc_NR_PROCESSO.AsString + '" AND TP_DESTINO IN ( "1", "5" ) AND ' + #13#10 +
            '                      LTRIM( RTRIM( CD_STATUS ) ) NOT IN ( "4" ) ' + #13#10 +
            '                      GROUP BY CD_ITEM, CD_FAVORECIDO ' + #13#10 +
            '                      HAVING COUNT(CD_ITEM)> 1 ) AND ' + #13#10 +
            '                      CD_ITEM NOT IN (SELECT CD_ITEM FROM TS_FATURA_PROCESSO_ITEM ' + #13#10 +
            '                      WHERE NR_PROCESSO = "' + qry_fat_proc_NR_PROCESSO.AsString + '" AND ' + #13#10 +
            '                      CD_UNID_NEG = "'+ qry_fat_proc_CD_UNID_NEG.AsString + '" AND ' +  #13#10 +
            '                      CD_PRODUTO = "' + qry_fat_proc_CD_PRODUTO.AsString + '" AND ' + #13#10 +
            '                      NR_SOLICITACAO = "'+ qry_fat_proc_NR_SOLICITACAO.AsString +'" )' + #13#10 +
            'GROUP BY CD_ITEM, CD_FAVORECIDO, VL_PAGTO ' + #13#10 +
            'HAVING COUNT(CD_ITEM)< 2 ' + #13#10 +
            'UNION ' + #13#10 +
            'SELECT "' + qry_fat_proc_CD_UNID_NEG.AsString + '", "' +  qry_fat_proc_CD_PRODUTO.AsString + '", ' + #13#10 +
            '"' +  qry_fat_proc_NR_SOLICITACAO.AsString + '", "' + qry_fat_proc_NR_PROCESSO.AsString + '", CD_ITEM, '+ #13#10 +
            'SUM( VL_PAGTO) AS VL_INFORMADO, SUM( VL_PAGTO) AS VL_CALCULADO, "0", CD_FAVORECIDO, "' + vInNaoFat + '", "1" ' + #13#10 +
            'FROM TSOLIC_PAGTO '+ #13#10 +
            'WHERE NR_PROCESSO = "' + qry_fat_proc_NR_PROCESSO.AsString + '" AND TP_DESTINO IN ( "1", "5" ) AND ' + #13#10 +
            '      LTRIM( RTRIM( CD_STATUS ) ) NOT IN ( "4" ) AND ' + #13#10 +
            '      CD_ITEM NOT IN (SELECT CD_ITEM FROM TS_FATURA_PROCESSO_ITEM ' + #13#10 +
            '      WHERE NR_PROCESSO = "' + qry_fat_proc_NR_PROCESSO.AsString + '" AND ' + #13#10 +
            '            CD_UNID_NEG = "'+ qry_fat_proc_CD_UNID_NEG.AsString + '" AND ' + #13#10 +
            '            CD_PRODUTO = "' + qry_fat_proc_CD_PRODUTO.AsString + '" AND ' + #13#10 +
            '            NR_SOLICITACAO = "'+ qry_fat_proc_NR_SOLICITACAO.AsString +'" )'+ #13#10 +
            'GROUP BY CD_ITEM, CD_FAVORECIDO ' + #13#10 +
            'HAVING COUNT(CD_ITEM)> 1');
             Query.Prepare;
             Query.ExecSQL;
          end;
 
          DataVenctoFat;
          CalculaItens;

          AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

          qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                        [loCaseInsensitive, loPartialKey]);

          qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                        [loCaseInsensitive, loPartialKey]);

        end; // Unico ou Varios
      end; //with

    except
      on E: Exception do
      begin
        datm_fat_sol.qry_fat_proc_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end; //Processo

  //Item
  if datm_fat_sol.qry_fat_proc_item_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_fat_sol do
      begin
        qry_fat_proc_item_NR_PROCESSO.AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text +
                                                  dbedt_nr_processo.Text;
        qry_fat_proc_item_.Post;

        datm_main.db_broker.Commit;
        Grava := True;

        nr_solicitacao := qry_fat_proc_item_NR_SOLICITACAO.AsString;
        nr_processo    := qry_fat_proc_item_NR_PROCESSO.AsString;
        cd_item        := qry_fat_proc_item_CD_ITEM.AsString;

        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

        qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                      [loCaseInsensitive, loPartialKey]);

        qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                      [loCaseInsensitive, loPartialKey]);

        qry_fat_proc_item_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO;CD_ITEM',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo, cd_item]),
                      [loCaseInsensitive, loPartialKey]);
      end;

    except
      on E: Exception do
      begin
        datm_fat_sol.qry_fat_proc_item_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  // Documento
  if datm_fat_sol.qry_fat_docto_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_fat_sol do
      begin
        qry_fat_docto_.Post;

        datm_main.db_broker.Commit;
        Grava := True;

        nr_processo    := qry_fat_proc_NR_PROCESSO.AsString;
        nr_solicitacao := qry_fat_docto_NR_SOLICITACAO.AsString;
        cd_documento   := qry_fat_docto_CD_DOCUMENTO.AsString;

        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

        qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                      [loCaseInsensitive, loPartialKey]);

        qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                      [loCaseInsensitive, loPartialKey]);

        qry_fat_docto_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;CD_DOCUMENTO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, cd_documento]),
                      [loCaseInsensitive, loPartialKey]);

        st_calculo     := qry_fat_DT_CALCULO.IsNull;
      end;

    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_fat_sol.qry_fat_docto_.Cancel;
        Grava := False;
        TrataErro(E);
      end;
    end;
  end;

  btn_mi( st_incluir, False, False, False );
  btn_mi_excluir;
end;

procedure Tfrm_fat_sol.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_fat_sol.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
  if ( datm_fat_sol.qry_tipo_item_.Locate('CD_TIPO_ITEM',
       datm_fat_sol.qry_fat_proc_item_look_cd_tipo_item.AsString ,[loCaseInsensitive]) ) and
     ( datm_fat_sol.qry_tipo_item_IN_RESTITUI.AsString = '1' ) then
  begin
    dblkpcbox_restitui.Enabled  := True;
    dblkpcbox_restitui.Color    := clWindow;
    dblkpcbox_restitui.ReadOnly := False;
  end
  else
  begin
    dblkpcbox_restitui.Enabled  := False;
    dblkpcbox_restitui.Color    := clMenu;
    dblkpcbox_restitui.ReadOnly := True;
    if ( datm_fat_sol.qry_fat_proc_item_IN_RESTITUI.AsString <> '0' ) then
    begin
      if Not ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit, dsInsert] ) then datm_fat_sol.qry_fat_proc_item_.Edit;
      datm_fat_sol.qry_fat_proc_item_IN_RESTITUI.AsString := '0';
      dbedt_cd_itemChange(nil);
    end;
  end;
  if (datm_fat_sol.qry_fat_proc_item_look_in_fat_sol.AsString <> '1') then
  begin
    BoxMensagem ('Esse Item não pode ser utilizado', 2);
    dbedt_cd_item.SetFocus;
  end;
end;


procedure Tfrm_fat_sol.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_fat_sol.qry_fat_proc_item_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       begin
         datm_fat_sol.qry_fat_proc_item_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_sol do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  st_modulo := vStr_cd_modulo;
  st_rotina := str_cd_rotina;
  dbedt_cd_itemChange(nil);
  dbedt_cd_itemExit(nil);
end;


procedure Tfrm_fat_sol.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then
  begin
    Botoes;
    Exit;
  end;
  if Not Grava then
  begin
    Botoes;
    Exit;
  end;
  Botoes;
end;

procedure Tfrm_fat_sol.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_fat_sol.pgctrl_fat_solChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_fat_sol.dbrg_tp_faturaClick(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_.State in [ dsInsert, dsEdit ] ) then
    btn_mi(False, True, True, False);
end;

procedure Tfrm_fat_sol.dbm_tx_observacaoChange(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_fat_sol.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
  processo: string;
begin
  Screen.Cursor := crHourGlass;
  with datm_fat_sol do
  begin
    qry_cliente_fat_proc_.Close;
    qry_cliente_fat_proc_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
    qry_cliente_fat_proc_.ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
    qry_cliente_fat_proc_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_NR_SOLICITACAO.AsString;
    qry_cliente_fat_proc_.Prepare;
    qry_cliente_fat_proc_.Open;
    if qry_cliente_fat_proc_.EOF then
    begin
      cd_cliente := '';
      qry_cliente_fat_proc_.Close;
    end
    else
    begin
      cd_cliente := qry_cliente_fat_proc_CD_CLIENTE.AsString;
      qry_cliente_fat_proc_.Close;
    end;
  end;

  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND ((PR.CD_CLIENTE = ''' + cd_cliente + ''') OR (''' + cd_cliente + ''' = '''')) ' );
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  processo := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  msk_nr_processo.Text := processo;
  msk_nr_processoExit(nil);
  datm_fat_sol.qry_fat_proc_NR_PROCESSO.AsString := Trim(msk_cd_unid_neg.Text + msk_cd_produto.Text + processo);

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
end;


procedure Tfrm_fat_sol.msk_nr_processoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_fat_sol.btn_excluirClick(Sender: TObject);
begin
  // Processo
  if pgctrl_fat_sol.ActivePage = ts_processo then
  begin
    if ( datm_fat_sol.qry_fat_proc_.RecordCount <= 0 ) then Exit;

    if ( datm_fat_sol.qry_fat_IN_CALCULADO.AsString = '1' ) then
    begin
      BoxMensagem('Solicitação já foi calculada!', 3);
      Exit;
    end;

    if BoxMensagem( 'Este Processo será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    begin
      try
        with datm_fat_sol do
        begin
          datm_main.db_broker.StartTransaction;
          nr_solicitacao := datm_fat_sol.qry_fat_NR_SOLICITACAO.AsString;
          datm_fat_sol.qry_fat_proc_.Delete;
          ExcluiDoctosCli;
          datm_main.db_broker.Commit;

          AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

          qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                        [loCaseInsensitive, loPartialKey]);
        end;
      except
        on E: Exception do
        begin
          datm_fat_sol.qry_fat_proc_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  // Item
  if pgctrl_fat_sol.ActivePage = ts_item then
  begin
    if ( datm_fat_sol.qry_fat_proc_item_.RecordCount <= 0 ) then Exit;

    if datm_fat_sol.qry_fat_IN_CALCULADO.AsString = '1' then
    begin
      BoxMensagem('Solicitação já foi calculada!', 3);
      Exit;
    end;

    if BoxMensagem( 'Este Item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    begin
      try
        with datm_fat_sol do
        begin
          datm_main.db_broker.StartTransaction;
          nr_solicitacao := datm_fat_sol.qry_fat_proc_item_NR_SOLICITACAO.AsString;
          nr_processo    := datm_fat_sol.qry_fat_proc_item_NR_PROCESSO.AsString;

          datm_fat_sol.qry_fat_proc_item_.Delete;
          datm_main.db_broker.Commit;

          AbreFatur(msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

          qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                        [loCaseInsensitive, loPartialKey]);
          qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                        [loCaseInsensitive, loPartialKey]);
        end;
      except
        on E: Exception do
        begin
          datm_fat_sol.qry_fat_proc_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  // Documentos
  if pgctrl_fat_sol.ActivePage = ts_docto then
  begin
    if ( datm_fat_sol.qry_fat_docto_.EOF ) then Exit;

    if BoxMensagem( 'Este Documento será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    begin
      try
        with datm_fat_sol do
        begin
          datm_main.db_broker.StartTransaction;
          nr_solicitacao := datm_fat_sol.qry_fat_NR_SOLICITACAO.AsString;
          nr_processo    := datm_fat_sol.qry_fat_proc_NR_PROCESSO.AsString;

          datm_fat_sol.qry_fat_docto_.Delete;
          datm_main.db_broker.Commit;

          AbreFatur(msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

          qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                        [loCaseInsensitive, loPartialKey]);
          qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
             VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                        [loCaseInsensitive, loPartialKey]);
        end;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_fat_sol.qry_fat_proc_.Cancel;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.dbedt_cd_itemChange(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_proc_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi(False, True, True, False);
end;

procedure Tfrm_fat_sol.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_fat_sol.qry_fat_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_fat_sol.cb_ordemClick(Sender: TObject);
begin
  with datm_fat_sol do
  begin
    Pesquisa := qry_fat_NR_SOLICITACAO.AsString;
    // Apaga o campo de pesquisa
    edt_chave.Text := '';
    qry_fat_.Close;
    qry_fat_.SQL[9] := a_str_indices[cb_ordem.ItemIndex];
    qry_fat_.Prepare;
    qry_fat_.Open;
    Localiza( qry_fat_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_fat_sol.CalculaSolic(const pFlagPreview : Boolean);
var
  cd_unid_neg, cd_produto : String [2];
  vTpRetencaoIr, vTpRetencaoCofins, tipo_fat : String [1];
  nr_identificador : integer;
  procedure AtualizaFlagPreview;
  begin
    //Rodrigo Capra - 06/06/2008
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('update TS_FATURA set IN_PREVIEW = ''1''');
      SQL.Add('WHERE');
      SQL.Add('   CD_UNID_NEG    =:CD_UNID_NEG  AND');
      SQL.Add('   CD_PRODUTO     =:CD_PRODUTO   AND');
      SQL.Add('   NR_SOLICITACAO =:NR_SOLICITACAO  ');
      ParamByName('CD_UNID_NEG').AsString     := msk_cd_unid_neg.Text;
      ParamByName('CD_PRODUTO').AsString      := msk_cd_produto.Text;
      ParamByName('NR_SOLICITACAO').AsString  := nr_solicitacao;
      ExecSQL;
      Close;
      Free;
    end;
  end;
begin
  nr_identificador := 0;
  ts_calculo.TabVisible := false;
  with datm_fat_sol do
  begin
    if qry_fat_IN_CALCULADO.AsString = '1' then
    begin
      BoxMensagem('Solicitação já foi calculada!', 3);
      Exit;
    end;

    if qry_fat_proc_.RecordCount > 0 then
    begin

      Screen.Cursor := crHourGlass;

      nr_solicitacao := qry_fat_proc_NR_SOLICITACAO.AsString;
      cd_unid_neg    := qry_fat_proc_CD_UNID_NEG.AsString;
      cd_produto     := qry_fat_proc_CD_PRODUTO.AsString;
      tipo_fat       := qry_fat_TP_TIPO_FAT.AsString;

      // Verifica se cliente imprime remessa em todas as faturas
      {if Remessa = '0' then
      begin
        // Verifica se cliente acumula
        if AvisoRetencao = '1' then
        begin
          // Verifica se ainda não foi impressa/acumulada nota com retenção > 5000
          if NFAcumulada = '0' then
          begin
            // Verifica se o total de retenção do cliente mais essa nota ultrapassam 5000 no mês
            if TotalRetencao = '1' then
            begin
              if BoxMensagem('Deseja acumular os R$ 5.000,00 nessa Nota?', 1) then
              begin
                acumula := 2;     // Cliente acumula e usuário quer acumular
              end
              else
                acumula := 1;   // Cliente acumula mas usuário não quer acumular
              end
            else
              acumula := 4  // Cliente acumula mas ainda não chegou no limite de 5000 no mês
          end
          else
            acumula := 3  // Cliente acumula e já foi impressa uma nota com 5000 no mês
        end
        else
        begin
          acumula := 0;   // Cliente que não acumula
        end;
      end
      else
      begin
        acumula := 5;   // Cliente imprime em todas as notas o valor da remessa
      end;

      // Quando for Demonstrativo ou Demonstrativo Complementar não acumula, não aparece retenção na Fatura Demonstrativo - 28/06/2006
      if ( tipo_fat = 'D' ) OR ( tipo_fat = 'C' ) then
        acumula := 0;}

//Novo Acumulo de PIS/COFINS - Rodrigo Capra
{0-Cliente não acumula
 1-Cliente acumula e vai ser salvo na tabela TRETENCAO
 2-Passou de 5000, acumula e mostra o total acumulado
 3-Já foi acumulado nota com valor acima de 5000, apenas mostra o da nota atual}


{Novo Acumulo de IRRF e PIS/COFINS - André 26/09/2008
      // Verifica se o cliente da fatura vai reter o IRRF e o COFINS por data da fatura ou data de vencimento da fatura
      vTpRetencaoIr := ConsultaLookUPSQL('select ISNULL(IN_TP_RETENCAO_IR,''0'')IN_TP_RETENCAO_IR from TCLIENTE_HABILITACAO ' +
                                         'where CD_CLIENTE = ''' + datm_fat_sol.qry_processo_CD_CLIENTE.AsString + ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ',
                                         'IN_TP_RETENCAO_COFINS');

      vTpRetencaoCofins := ConsultaLookUPSQL('select ISNULL(IN_TP_RETENCAO_COFINS,''0'')IN_TP_RETENCAO_COFINS from TCLIENTE_HABILITACAO ' +
                                         'where CD_CLIENTE = ''' + datm_fat_sol.qry_processo_CD_CLIENTE.AsString + ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ',
                                         'IN_TP_RETENCAO_COFINS');

      //Calcula as datas para retencão do IRRF e COFINS
      if vTpRetencaoIr = '1' then
        CalculaData
      else if vTpRetencaoIr = '2' then
      begin
        DataInicial := EncodeDate(
                       StrToInt( Copy( db_dt_venc_fat_.Text, 7, 4 ) ),
                       StrToInt( Copy( db_dt_venc_fat_.Text, 4, 2 ) ), 1);

        DataFinal := EncodeDate ( StrToInt( Copy( db_dt_venc_fat_.Text, 7, 4 ) ),
                       StrToInt( Copy( db_dt_venc_fat_.Text, 4, 2 ) ),
                       DaysInAMonth(StrToInt(Copy( db_dt_venc_fat_.Text, 7, 4 )),StrToInt(Copy( db_dt_venc_fat_.Text, 4, 2 ))) );
      end;

      if vTpRetencaoCofins = '1' then
        CalculaData
      else if vTpRetencaoCofins = '2' then
      begin
        DataInicial := EncodeDate(
                       StrToInt( Copy( db_dt_venc_fat_.Text, 7, 4 ) ),
                       StrToInt( Copy( db_dt_venc_fat_.Text, 4, 2 ) ), 1);

        DataFinal := EncodeDate ( StrToInt( Copy( db_dt_venc_fat_.Text, 7, 4 ) ),
                       StrToInt( Copy( db_dt_venc_fat_.Text, 4, 2 ) ),
                       DaysInAMonth(StrToInt(Copy( db_dt_venc_fat_.Text, 7, 4 )),StrToInt(Copy( db_dt_venc_fat_.Text, 4, 2 ))) );
      end; }

      qry_fat_.Close;
      qry_fat_proc_.Close;
      qry_fat_proc_item_.Close;
      qry_fat_cc_.Close;


{      if (vTipoControle = '1') or (vTipoControle = '2') then     // Verifica se o cliente acumula
      begin
        if NFAcumulada = '0' then //Verifica qtos já foram retidos no mês para o cliente
        begin
          if not VerificaRetencao then //se False então é pq não chegou nos 5000
            acumula := 1                                                        // Cliente acumula mas usuário não quer acumular
          else //se TRUE é pq passou de 5000
            acumula := 2;                                                        // Cliente acumula e usuário quer acumular
        end
        else
          acumula := 3;  // Cliente acumula e já foi impressa uma nota com 5000 no mês
      end
      else
      begin
          if (vTipoControle = '0') then acumula := 0;   // Cliente que não acumula e nunca retem
          if (vTipoControle = '3') then acumula := 4;   // Cliente que não acumula e nunca retem
      end;}

      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_fat_calculo);
        sp_fat_calculo.ParamByName('@CD_UNID_NEG').AsString    := cd_unid_neg;
        sp_fat_calculo.ParamByName('@CD_PRODUTO').AsString     := cd_produto;
        sp_fat_calculo.ParamByName('@NR_SOLICITACAO').AsString := nr_solicitacao;
//        sp_fat_calculo.ParamByName('@DT_INICIO').AsDateTime    := DataInicial;
//        sp_fat_calculo.ParamByName('@DT_FIM').AsDateTime       := DataFinal;
//        sp_fat_calculo.ParamByName('@IN_ACUMULA').AsInteger    := acumula;  retirei a declaração da variavel in_acumula

        ExecStoredProc(sp_fat_calculo);
        nr_identificador := sp_fat_calculo.ParamByName('@NR_IDENTIFICADOR').AsInteger;

        if sp_fat_calculo.ParamByName('Result').AsString = '6' then
        begin
          qry_calculo_rateio_desp_.Close;
          qry_calculo_rateio_desp_.Prepare;
          qry_calculo_rateio_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_calculo_rateio_desp_.Open;

          ts_calculo.TabVisible := True;
          pgctrl_fat_sol.ActivePage := ts_calculo;
        end;

        Screen.Cursor := crDefault;
        if sp_fat_calculo.ParamByName('Result').AsInteger > 0 then
          ExibeErro( 'sp_fat_calculo', sp_fat_calculo.ParamByName('Result').AsInteger, '', sp_fat_calculo.ParamByName( '@VL_SD_FAT_ZERO' ).Value );


        if pFlagPreview then      //Muda a FLAG PREVIEW para SIM
          AtualizaFlagPreview;

        if sp_fat_calculo.ParamByName('Result').AsInteger in [6,4,5] then
           datm_main.db_broker.Rollback
        else
           datm_main.db_broker.Commit;

        CloseStoredProc(sp_fat_calculo);

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      Screen.Cursor := crHourGlass;
      AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

      qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
         VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                    [loCaseInsensitive, loPartialKey]);
      Screen.Cursor := crDefault;
    end
    else
    begin
      BoxMensagem( 'Não existem processos a faturar!', 2 );
    end;
  end;
  ApagaDados( 'TCALCULO_RATEIO_DESP', nr_identificador );
end;

procedure Tfrm_fat_sol.btn_calculoClick(Sender: TObject);
begin
  CalculaSolic(False);
end;


procedure Tfrm_fat_sol.btn_mi_excluir;
begin
  with datm_fat_sol do
  begin
    if ( qry_fat_.RecordCount > 0 ) and
       ( qry_fat_proc_.RecordCount > 0 ) then
    begin
      if ( qry_fat_IN_CALCULADO.AsString    = '0' ) and
         ( qry_controle_IN_FECHADO.AsString = '0' ) and
         ( qry_fat_IN_IMP_NF_SERV.AsString  = '0' ) and
         ( qry_fat_IN_CANCELADO.AsString    = '0' ) then
      begin
        if ( pgctrl_fat_sol.ActivePage = ts_processo ) or
           ( pgctrl_fat_sol.ActivePage = ts_item ) then
        begin
          btn_excluir.Enabled := True;
          mi_excluir.Enabled  := True;
        end
        else
        begin
          if pgctrl_fat_sol.ActivePage = ts_docto then
          begin
            if ( Not qry_fat_docto_.EOF ) then
            begin
              btn_excluir.Enabled := True;
              mi_excluir.Enabled  := True;
            end;
          end;
        end;
      end
      else
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end;
    end;
  end;
end;

procedure Tfrm_fat_sol.btn_canc_solClick(Sender: TObject);
var
  vNrNota, vDtFatura, vCgcEmpresa : String;
begin
  with datm_fat_sol do
  begin
{    // verifica se é tipo fatura
    if (ConsultaLookUPSQL('SELECT TP_TIPO_FAT AS TP_TIPO_FAT FROM TS_FATURA WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                         ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'TP_TIPO_FAT') = 'F') then
      // verifica se é está nas tabelas de retenção
      if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') or
         (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') then
      begin
        vNrNota := ConsultaLookUPSQL('SELECT NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA');
        vCgcEmpresa := ConsultaLookUPSQL('SELECT CGC_EMPRESA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'CGC_EMPRESA');

       //IR
        vDtFatura := ConsultaLookUPSQL('SELECT DT_FATURA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'DT_FATURA');

        // Se sim verifica se uma é uma nota totalizadora
        if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text +
                              ''' AND IN_IR_RETIDO_ATUAL = ''1''', 'NR_NOTA') = '1') then
        begin
          // Se sim verifica se EM SEGUIDA foram impressas outras notas no mesmo DIA
          if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                ''' AND CONVERT(INT, NR_NOTA) > CONVERT(INT, ''' + vNrNota + ''') AND CGC_EMPRESA = '''+vCgcEmpresa+''''+
                                ' AND CONVERT(VARCHAR, DT_FATURA,103) = '''+ vDtFatura+'''', 'NR_NOTA') <> '0') then
          begin
            BoxMensagem('Fatura não pode ser cancelada devido a retenção de IR!', 2);
            Exit;
          end
        end
        else
          // se não é uma nota totalizadora verifica se é uma nota que reteve IR
          if (ConsultaLookUPSQL('SELECT IN_IR_RETIDO FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' and CD_PRODUTO = '''+msk_cd_produto.Text+'''', 'IN_IR_RETIDO') = '0') then
            //se não é uma nota totalizadora e não reteve IR verifica se já foi impressa uma nota totalizadora no DIA
            if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_IR WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                  ''' AND IN_IR_RETIDO_ATUAL = ''1'' AND CGC_EMPRESA = '''+vCgcEmpresa+''' AND CONVERT(VARCHAR, DT_FATURA,103) = '''+ vDtFatura+
                                  '''', 'NR_NOTA') = '1') then
            begin
              BoxMensagem('Fatura não pode ser cancelada devido a retenção de IR!', 2);
              Exit;
            end;
       //FIM IR

       //COFINS
        vDtFatura := ConsultaLookUPSQL('SELECT DT_FATURA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                  ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'DT_FATURA');

        // Se sim verifica se uma é uma nota totalizadora
        if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text +
                              ''' AND IN_COFINS_RETIDO_ATUAL = ''1''', 'NR_NOTA') = '1') then
        begin
          // Se sim verifica se EM SEGUIDA foram impressas outras notas no mesmo MÊS
          if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_COFINS WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                ''' AND CONVERT(INT, NR_NOTA) > CONVERT(INT, ''' +vNrNota+''') AND CGC_EMPRESA = '''+vCgcEmpresa+''''+
                                ' AND CONVERT(VARCHAR,MONTH(DT_FATURA))+''/''+CONVERT(VARCHAR,YEAR(DT_FATURA)) = '''+ Copy(vDtFatura,5,6) +'''', 'NR_NOTA') <> '0') then
          begin
            BoxMensagem('Fatura não pode ser cancelada devido a retenção de Cofins!', 2);
            Exit;
          end
        end
        else
          // se não é uma nota totalizadora verifica se é uma nota que reteve COFINS
          if (ConsultaLookUPSQL('SELECT IN_COFINS_RETIDO FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' and CD_PRODUTO = '''+msk_cd_produto.Text+'''', 'IN_COFINS_RETIDO') = '0') then
            //se não é uma nota totalizadora e não reteve COFINS verifica se já foi impressa uma nota totalizadora no MÊS
            if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_COFINS WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                  ''' AND IN_COFINS_RETIDO_ATUAL = ''1'' AND CGC_EMPRESA = '''+vCgcEmpresa+
                                  ''' AND CONVERT(VARCHAR,MONTH(DT_FATURA))+''/''+CONVERT(VARCHAR,YEAR(DT_FATURA)) = '''+Copy(vDtFatura,5,6)+'''', 'NR_NOTA') = '1') then
            begin
              BoxMensagem('Fatura não pode ser cancelada devido a retenção de Cofins!', 2);
              Exit;
            end;
       //FIM COFINS
      end; // verifica se é está nas tabelas de retenção     }

    if VerificaRetencaoFinal = False then
      Exit;

    if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                        ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') or
       (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                        ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') then
    begin
      FastExecSQL(' DELETE TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                  ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''');
      FastExecSQL(' DELETE TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                  ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''');
    end;


    if qry_fat_IN_LIQUIDADO.AsString = '1' then
    begin
      qry_cli_hab_.Close;
      qry_cli_hab_.ParamByName('CD_UNID_NEG').AsString    := qry_fat_proc_CD_UNID_NEG.AsString;
      qry_cli_hab_.ParamByName('CD_PRODUTO').AsString     := qry_fat_proc_CD_PRODUTO.AsString;
      qry_cli_hab_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_proc_NR_SOLICITACAO.AsString;
      qry_cli_hab_.Prepare;
      qry_cli_hab_.Open;
      if qry_cli_hab_IN_NOTA_LIQ.AsString = '0' then
      begin
        BoxMensagem( 'Fatura/Nota já liquidada!', 2 );
        qry_cli_hab_.Close;
        Exit;
      end;
      qry_cli_hab_.Close;
    end;

    if BoxMensagem( 'Confirma cancelamento desta Solicitação?', 1 ) then
    begin
      qry_bol_fatura_.Close;
      qry_bol_fatura_.ParamByName('CD_UNID_NEG').AsString := qry_fat_CD_UNID_NEG.AsString;
      qry_bol_fatura_.ParamByName('CD_PRODUTO').AsString  := qry_fat_CD_PRODUTO.AsString;
      qry_bol_fatura_.ParamByName('NR_FATURA').AsString   := qry_fat_NR_NOTA_FATURA.AsString;
      qry_bol_fatura_.Prepare;
      qry_bol_fatura_.Open;
      if ( Trim( qry_bol_fatura_NR_BOLETO.AsString ) <> '') OR (qry_bol_fatura_IN_CANCELADO.AsString = '1') then
      begin
        BoxMensagem('Fatura/Nota não possui Boleto cancelado !!', 2);
        qry_bol_fatura_.Close;
        Exit;
      end;

      qry_param_.Close;
      qry_param_.Prepare;
      qry_param_.Open;
      if qry_param_CD_SISTEMA_CONTABIL.AsString = '3' then //Jump - Eichenberg
      begin
        if Trim( qry_fat_NR_RELATORIO.AsString ) <> '' then
        begin
          BoxMensagem('Fatura/Nota não possui Rel. Cobrança em Carteira cancelado!!', 2);
          Exit;
        end;
      end;

      qry_rel_liq_.Close;
      qry_rel_liq_.ParamByName('CD_UNID_NEG').AsString    := qry_fat_CD_UNID_NEG.AsString;
      qry_rel_liq_.ParamByName('CD_PRODUTO').AsString     := qry_fat_CD_PRODUTO.AsString;
      qry_rel_liq_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_NR_SOLICITACAO.AsString;
      qry_rel_liq_.Prepare;
      qry_rel_liq_.Open;
      if qry_rel_liq_TOT_LIQ.AsInteger > 0 then
      begin
        BoxMensagem('Fatura/Nota pertence a relatório de reembolso já liquidado!', 2);
        qry_rel_liq_.Close;
        Exit;
      end;
      qry_rel_liq_.Close;

      //Verifica se fatura foi acumulativa de outras
      qry_status_.Close;
      qry_status_.ParamByName('CD_UNID_NEG').AsString    := qry_fat_CD_UNID_NEG.AsString;
      qry_status_.ParamByName('CD_PRODUTO').AsString     := qry_fat_CD_PRODUTO.AsString;
      qry_status_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_NR_SOLICITACAO.AsString;
      qry_status_.Prepare;
      qry_status_.Open;
      if qry_status_IN_STATUS.AsString = 'T' then
      begin
        BoxMensagem('Fatura/Nota foi acumulativa de outras para Retenção - não pode ser cancelada!', 2);
        qry_status_.Close;
        Exit;
      end;
      qry_status_.Close;

      nr_solicitacao := qry_fat_NR_SOLICITACAO.AsString;
      nr_processo    := qry_fat_proc_NR_PROCESSO.AsString;
      cd_item        := qry_fat_proc_item_CD_ITEM.AsString;
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_fat_canc);
        sp_fat_canc.ParamByName('@CD_UNID_NEG').AsString    := qry_fat_CD_UNID_NEG.AsString;
        sp_fat_canc.ParamByName('@CD_PRODUTO').AsString     := qry_fat_CD_PRODUTO.AsString;
        sp_fat_canc.ParamByName('@NR_SOLICITACAO').AsString := qry_fat_NR_SOLICITACAO.AsString;
        sp_fat_canc.ParamByName('@CD_USUARIO').AsString     := str_cd_usuario;
        ExecStoredProc(sp_fat_canc);
        CloseStoredProc(sp_fat_canc);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      if msk_dt_movimento.Text <> '  /  /    ' then
        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  StrToDate( msk_dt_movimento.Text ) )
      else
        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text,  dt_server );

      qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
         VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                    [loCaseInsensitive, loPartialKey]);

      qry_fat_proc_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO',
         VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo]),
                    [loCaseInsensitive, loPartialKey]);

      qry_fat_proc_item_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO;NR_PROCESSO;CD_ITEM',
         VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao, nr_processo, cd_item]),
                    [loCaseInsensitive, loPartialKey]);
    end;
  end
end;


procedure Tfrm_fat_sol.btn_fecharClick(Sender: TObject);
begin
  if BoxMensagem('Confirma o Fechamento do Movimento?', 1) then
  begin
    try
      datm_main.db_broker.StartTransaction;

      // Grava usuário/data/hora do fechamento do movimento
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('INSERT INTO TMOVIMENTO (CD_USUARIO, DT_ACAO, HR_ACAO, CD_MODULO, NM_ACAO) ');
        SQL.Add(' VALUES (:CD_USUARIO, :DT_ACAO, :HR_ACAO, :CD_MODULO, :NM_ACAO)');
        ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
        ParamByName('DT_ACAO').AsDateTime  := dt_server;
        ParamByName('HR_ACAO').AsDateTime  := hr_server;
        ParamByName('CD_MODULO').AsString  := '11';
        ParamByName('NM_ACAO').AsString  := 'Fechamento';
        ExecSQL;
        Close;
        Free;
      end;

      with datm_fat_sol do
      begin
        qry_controle_.Close;
        qry_controle_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_controle_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_controle_.Prepare;
        qry_controle_.Open;
        if qry_controle_.Locate('CD_UNID_NEG;CD_PRODUTO;DT_MOVIMENTO',
           VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate(msk_dt_movimento.Text)]),
                      [loCaseInsensitive, loPartialKey]) then
        begin
          qry_controle_.Edit;
          qry_controle_IN_FECHADO.AsString      := '1';
          qry_controle_CD_USUARIO.AsString      := str_cd_usuario;
          qry_controle_DT_FECHAMENTO.AsDateTime := Date;
          qry_controle_.Post;
          btn_fechar.Enabled     := False;
          mi_fechar.Enabled      := False;
          btn_incluir.Enabled    := False;
          mi_incluir.Enabled     := False;
          btn_salvar.Enabled     := False;
          mi_salvar.Enabled      := False;
          btn_calculo.Enabled    := False;
          btnPreviewCalc.Enabled := False;
          mi_calcular.Enabled    := False;
          btn_excluir.Enabled    := False;
          mi_excluir.Enabled     := False;
          btn_canc_sol.Enabled   := False;
          mi_canc_sol.Enabled    := False;
        end;

        // Contabilização
        qry_param_.Close;
        qry_param_.Prepare;
        qry_param_.Open;
        if qry_param_CD_SISTEMA_CONTABIL.AsString = '4' then // RM Saldus
        begin
          CloseStoredProc(sp_contabiliza);
          sp_contabiliza.ParamByName('@CD_COLIGADA').AsString := str_cd_coligada;
          sp_contabiliza.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          sp_contabiliza.ParamByName('@CD_PRODUTO').AsString  := msk_cd_produto.Text;
          sp_contabiliza.ParamByName('@DT_MOVIMENTO').AsDate  := StrToDate(msk_dt_movimento.Text);
          sp_contabiliza.ParamByName('@TP_CONTAB').AsString   := 'F';
          sp_contabiliza.ParamByName('@CD_USUARIO').AsString  := str_cd_usuario;
          ExecStoredProc(sp_contabiliza);
          Contabiliza( qry_contab_, qry_contab_lanc_, qry_contab_gerencial_ ,
                       sp_contabiliza.ParamByName('@NR_CONT').AsString, str_cd_coligada );
          CloseStoredProc(sp_contabiliza);
        end;
        qry_param_.Close;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.dbm_tx_observacaoExit(Sender: TObject);
begin
  if datm_fat_sol.qry_fat_.State in [ dsInsert, dsEdit ] then
    FormataMemo( datm_fat_sol.qry_fat_TX_OBSERVACOES, 40);
end;

procedure Tfrm_fat_sol.Botoes;
begin
  btn_excluir.Enabled    := st_exc;
  mi_excluir.Enabled     := st_exc;
  btn_calculo.Enabled    := st_calculo;
  btnPreviewCalc.Enabled := st_calculo;
  mi_calcular.Enabled    := st_calculo;
  btn_canc_sol.Enabled   := st_exc;
  mi_canc_sol.Enabled    := st_exc;
  btn_fechar.Enabled     := st_fechar;
  mi_fechar.Enabled      := st_fechar;
end;


procedure Tfrm_fat_sol.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg     then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_cd_produtoClick(nil);
    if Sender = msk_cd_grupo        then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente      then btn_co_clienteClick(nil);
    if Sender = msk_nr_processo     then btn_co_processoClick(nil);
    if Sender = dbedt_cd_item       then btn_co_itemClick(nil);
    if Sender = dbedt_cd_favorecido then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_documento  then btn_co_documentoClick(nil);
    if Sender = dbedt_cd_ct_custo   then btn_centro_custoClick(nil);
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

procedure Tfrm_fat_sol.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_fat := msk_cd_unid_neg.Text;
end;

procedure Tfrm_fat_sol.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_fat := msk_cd_produto.Text;
end;

procedure Tfrm_fat_sol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then close;
end;


procedure Tfrm_fat_sol.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.Cons_OnLine := datm_fat_sol.qry_fat_proc_item_CD_FAVORECIDO;
  with frm_favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
    begin
      datm_fat_sol.qry_fat_proc_item_.Edit;
    end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_sol do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := st_modulo;
  str_cd_rotina := st_rotina;
  dbedt_cd_favorecidoExit(Sender);
end;

procedure Tfrm_fat_sol.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_fat_sol.db_dt_venc_fat_KeyPress(Sender: TObject; var Key: Char);
begin
  if datm_fat_sol.qry_fat_proc_.RecordCount = 0 then
     BoxMensagem( 'Para poder informar uma data de vencimento, será necessário que ao menos um' + #13#10 +
                  'processo de importação esteja incluso na solicitação de fatura!', 2 );
end;

procedure Tfrm_fat_sol.HabilitaProc( Hab : Boolean );
begin
  msk_nr_processo.ReadOnly := Not Hab;
  msk_cd_grupo.ReadOnly    := Not Hab;
  msk_cd_cliente.ReadOnly  := Not Hab;
  msk_dt_inicio.ReadOnly   := Not Hab;
  msk_dt_termino.ReadOnly  := Not Hab;

  msk_nr_processo.TabStop  := Hab;
  msk_cd_grupo.TabStop     := Hab;
  msk_cd_cliente.TabStop   := Hab;
  msk_dt_inicio.TabStop    := Hab;
  msk_dt_termino.TabStop   := Hab;

  msk_nr_processo.Enabled  := Hab;
  msk_cd_grupo.Enabled     := Hab;
  msk_cd_cliente.Enabled   := Hab;
  msk_dt_inicio.Enabled    := Hab;
  msk_dt_termino.Enabled   := Hab;
  btn_co_processo.Enabled  := Hab;
  btn_co_grupo.Enabled     := Hab;
  btn_co_cliente.Enabled   := Hab;

  if Hab then
  begin
    msk_nr_processo.Color    := clWindow;
    msk_cd_grupo.Color       := clWindow;
    msk_cd_cliente.Color     := clWindow;
    msk_dt_inicio.Color      := clWindow;
    msk_dt_termino.Color     := clWindow;
  end
  else
  begin
    msk_nr_processo.Color    := clMenu;
    msk_cd_grupo.Color       := clMenu;
    msk_cd_cliente.Color     := clMenu;
    msk_dt_inicio.Color      := clMenu;
    msk_dt_termino.Color     := clMenu;
  end;
end;

procedure Tfrm_fat_sol.msk_cd_grupoChange(Sender: TObject);
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


procedure Tfrm_fat_sol.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then Exit;
  ValCodEdt(msk_cd_grupo);
  with datm_fat_sol.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Grupo não encontrado!',2);
      msk_cd_grupo.Clear;
      edt_nm_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
  CodExits;
end;

procedure Tfrm_fat_sol.msk_cd_clienteChange(Sender: TObject);
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


procedure Tfrm_fat_sol.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then Exit;
  ValCodEdt(msk_cd_cliente);
  with datm_fat_sol.qry_cliente_ do
  begin
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Cliente não encontrado!',2);
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else edt_nm_cliente.Text := FieldByName('AP_EMPRESA').AsString;
    Close;
  end;
  CodExits;
end;

procedure Tfrm_fat_sol.btn_co_grupoClick(Sender: TObject);
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


procedure Tfrm_fat_sol.btn_co_clienteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_cliente_co.Cons_OnLine_Texto := msk_cd_cliente.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_fat_sol.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then
    begin
      dt_inicio := StrToDate( msk_dt_inicio.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;
  CodExits;
end;

procedure Tfrm_fat_sol.msk_dt_terminoExit(Sender: TObject);
begin
  try
    if msk_dt_termino.Text <> '  /  /    ' then
    begin
      dt_termino := StrToDate( msk_dt_termino.Text );
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      msk_dt_termino.SetFocus;
      Exit;
    end;
  end;
  CodExits;
end;

procedure Tfrm_fat_sol.InserePagosCli;
begin
  with datm_fat_sol do
  begin
    if qry_fat_TP_TIPO_FAT.AsString <> 'N' then
    begin
      CloseStoredProc( sp_fat_pagos_cli );
      sp_fat_pagos_cli.ParamByName('@CD_UNID_NEG').AsString    := qry_fat_proc_CD_UNID_NEG.AsString;
      sp_fat_pagos_cli.ParamByName('@CD_PRODUTO').AsString     := qry_fat_proc_CD_PRODUTO.AsString;
      sp_fat_pagos_cli.ParamByName('@NR_SOLICITACAO').AsString := nr_solicitacao;
      sp_fat_pagos_cli.ParamByName('@NR_PROCESSO').AsString    := nr_processo;
      ExecStoredProc( sp_fat_pagos_cli );
      CloseStoredProc( sp_fat_pagos_cli );

      qry_fat_proc_item_.Close;
      qry_fat_proc_item_.Prepare;
      qry_fat_proc_item_.Open;

    end;
  end;
end;


procedure Tfrm_fat_sol.CalculaItens;
begin
  with datm_fat_sol do
  begin
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_fat_calc_padrao);
      sp_fat_calc_padrao.ParamByName('@NR_PROCESSO').AsString    := nr_processo;
      sp_fat_calc_padrao.ParamByName('@NR_SOLICITACAO').AsString := nr_solicitacao;
      ExecStoredProc(sp_fat_calc_padrao);
      CloseStoredProc(sp_fat_calc_padrao);
      datm_main.db_broker.Commit;
      // Exibir registros de erro de calculo
      qry_tot_erro_.Close;
      qry_tot_erro_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_tot_erro_.Prepare;
      qry_tot_erro_.Open;
      if qry_tot_erro_TOT_ERRO.AsInteger > 0 then
      begin
        Application.CreateForm( Tfrm_log_erro_calculo, frm_log_erro_calculo );
        frm_log_erro_calculo.ShowModal;
      end;
      // Limpar registros de erro de cálculo
      qry_log_erro_calculo_.Close;
      qry_log_erro_calculo_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_log_erro_calculo_.Prepare;
      qry_log_erro_calculo_.ExecSQL;
      qry_log_erro_calculo_.Close;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_fat_sol.msk_dt_movimentoEnter(Sender: TObject);
begin
  dt_movimento_fat := msk_dt_movimento.Text;
end;

procedure Tfrm_fat_sol.DataVenctoFat;
var
  Valida : Boolean;
  vNrDiaVencto : Integer;
begin
  with datm_fat_sol do
  begin
    qry_fat_.Edit;
    CloseStoredProc( sp_rel_fin_controle_num );
    sp_rel_fin_controle_num.ParamByName('@cd_unid_neg').AsString := qry_fat_CD_UNID_NEG.AsString;
    sp_rel_fin_controle_num.ParamByName('@cd_produto').AsString := qry_fat_CD_PRODUTO.AsString;
    sp_rel_fin_controle_num.ParamByName('@cd_grupo').AsString    := '';
    sp_rel_fin_controle_num.ParamByName('@cd_cliente').AsString  := dbedt_cd_cliente.Text;
    ExecStoredProc( sp_rel_fin_controle_num );
    if sp_rel_fin_controle_num.ParamByName('@dt_vencto').IsNull then
    begin
      qry_fat_DT_VENCTO_FATURA.asDateTime := qry_fat_DT_SOLICITACAO.AsDateTime + RetornaDias;

      if cDiaUtilEmissaoFatura = '1' then
      begin

        Valida := True;
        while Valida = True do
        begin
          if DayOfWeek(qry_fat_DT_VENCTO_FATURA.asDateTime) = 7 then
             qry_fat_DT_VENCTO_FATURA.asDateTime := qry_fat_DT_VENCTO_FATURA.asDateTime + 2
          else if DayOfWeek(qry_fat_DT_VENCTO_FATURA.asDateTime) = 1 then
             qry_fat_DT_VENCTO_FATURA.asDateTime := qry_fat_DT_VENCTO_FATURA.asDateTime + 1;

          qry_feriado_.Close;
          qry_feriado_.ParamByName('DT_FERIADO').AsDateTime := qry_fat_DT_VENCTO_FATURA.asDateTime;
          qry_feriado_.Prepare;
          qry_feriado_.Open;
          if Not qry_feriado_.EOF then
             qry_fat_DT_VENCTO_FATURA.asDateTime := qry_fat_DT_VENCTO_FATURA.asDateTime + 1
          else
             Valida := False;
        end;
      end;
    end
    else
    begin
      qry_fat_DT_VENCTO_FATURA.AsDateTime := sp_rel_fin_controle_num.ParamByName('@dt_vencto').AsDateTime + 1;
      qry_fat_NR_RELATORIO.AsString       := sp_rel_fin_controle_num.ParamByName('@nr_relatorio').AsString;
      qry_fat_NR_ANO.AsString             := sp_rel_fin_controle_num.ParamByName('@nr_ano').AsString;
    end;

    vNrDiaVencto := StrToInt(ConsultaLookUPSQL(' SELECT CASE NR_DIA_VENCTO WHEN '''' THEN ''0'' ELSE ISNULL(NR_DIA_VENCTO, ''0'') END NR_DIA_VENCTO FROM TCLIENTE_HABILITACAO '+
                         ' WHERE CD_CLIENTE = '''+dbedt_cd_cliente.Text+''' AND'+
                         ' CD_UNID_NEG = '''+qry_fat_CD_UNID_NEG.AsString+''' AND CD_PRODUTO = '''+qry_fat_CD_PRODUTO.AsString+''' ','NR_DIA_VENCTO'));
    if vNrDiaVencto > 0 then
    begin
      if DayOf(Date) > StrToInt(ConsultaLookUPSQL(' SELECT CASE NR_DIA_VENCTO_BASE WHEN '''' THEN ''0'' ELSE ISNULL(NR_DIA_VENCTO_BASE, ''0'') END NR_DIA_VENCTO_BASE FROM TCLIENTE_HABILITACAO WHERE CD_CLIENTE = '''+dbedt_cd_cliente.Text+''' AND'+
                         ' CD_UNID_NEG = '''+qry_fat_CD_UNID_NEG.AsString+''' AND CD_PRODUTO = '''+qry_fat_CD_PRODUTO.AsString+''' ', 'NR_DIA_VENCTO_BASE')) then
        qry_fat_DT_VENCTO_FATURA.AsDateTime := IncMonth(EncodeDate(YearOf(Date), MonthOf(Date), vNrDiaVencto), 1)
      else
      begin
        if ((MonthOf(Date) = 2) and (vNrDiaVencto = 30)) then
          qry_fat_DT_VENCTO_FATURA.AsDateTime := EncodeDate(YearOf(Date), MonthOf(Date), 28)
        else
          qry_fat_DT_VENCTO_FATURA.AsDateTime := EncodeDate(YearOf(Date), MonthOf(Date), vNrDiaVencto);
      end
    end;
    CloseStoredProc( sp_rel_fin_controle_num );
    qry_fat_.Post;
  end;
end;


procedure Tfrm_fat_sol.btn_co_histClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_hist_padrao, frm_hist_padrao );
  frm_hist_padrao.Cons_OnLineMemo := datm_fat_sol.qry_fat_TX_OBSERVACOES;
  with frm_hist_padrao do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine     := False;
    lCons_OnLineMemo := True;
    ShowModal;
    lCons_OnLineMemo := False;
  end;
end;

procedure Tfrm_fat_sol.dbg_faturamento_ccDblClick(Sender: TObject);
var
  fat_cc_nr_processo, fat_cc_nr_lancamento, fat_cc_in_sel_fat : String;
begin
  with datm_fat_sol do
  begin
    fat_cc_nr_processo   := qry_fat_cc_NR_PROCESSO.AsString;
    fat_cc_nr_lancamento := qry_fat_cc_NR_LANCAMENTO.AsString;
    fat_cc_in_sel_fat    := qry_fat_cc_IN_SEL_FAT.AsString;
    qry_atz_fat_cc_.ParamByName('NR_PROCESSO').AsString   := fat_cc_nr_processo;
    qry_atz_fat_cc_.ParamByName('NR_LANCAMENTO').AsString := fat_cc_nr_lancamento;
    if fat_cc_in_sel_fat = '0' then
       qry_atz_fat_cc_.ParamByName('IN_SEL_FAT').AsString := '1'
    else
       qry_atz_fat_cc_.ParamByName('IN_SEL_FAT').AsString := '0';
    qry_atz_fat_cc_.Prepare;
    qry_atz_fat_cc_.ExecSQL;

    qry_fat_cc_.Close;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    qry_fat_cc_.Locate( 'NR_PROCESSO;NR_LANCAMENTO',
                        VarArrayOf ( [ fat_cc_nr_processo, fat_cc_nr_lancamento ] ), [loCaseInsensitive] );
    qry_fat_proc_AfterScroll(nil);
  end;
end;


procedure Tfrm_fat_sol.btn_refatClick(Sender: TObject);
var
  cd_unid_neg, cd_produto : String [2];
begin
  try
    with datm_fat_sol do
    begin
  if (ConsultaLookUPSQL('SELECT COUNT (NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '0')
    or (ConsultaLookUPSQL('SELECT TP_TIPO_FAT AS TP_TIPO_FAT FROM TS_FATURA WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                         ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'TP_TIPO_FAT') <> 'F') then
//    begin
//   vTipoControle := ConsultaLookUPSQL('select ISNULL(IN_TIPO_CONTROLE_RETENCAO,''0'')IN_TIPO_CONTROLE_RETENCAO from TEMPRESA_NAC ' +
//                                       'where CD_EMPRESA = ''' + datm_fat_sol.qry_processo_CD_CLIENTE.AsString + '''',
//                                     'IN_TIPO_CONTROLE_RETENCAO');
//    if (ConsultaLookUPSQL('SELECT COUNT(*) AS COUNT FROM TRETENCAO WHERE ((IN_RETIDO_TOTAL = ''0'' AND VL_RETENCAO = 0 AND IN_JA_RETIDO = ''0'') OR (IN_RETIDO_TOTAL = ''0'' AND IN_JA_RETIDO = ''1'' AND VL_RETENCAO > 0))'
//    + 'AND ((IN_IR_RETIDO_ATUAL = ''0'' AND VL_IR_RETIDO = 0 AND IN_RETIDO_IR = ''0'') OR (IN_IR_RETIDO_ATUAL = ''0'' AND VL_IR_RETIDO > 0 AND IN_RETIDO_IR = ''1''))'
//   + ' AND NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString + '''', 'COUNT') = '1') or (vTipoControle = '0') then
        if qry_fat_proc_.RecordCount > 0 then
        begin
          datm_main.db_broker.StartTransaction;
          nr_solicitacao := qry_fat_proc_NR_SOLICITACAO.AsString;
          cd_unid_neg := qry_fat_proc_CD_UNID_NEG.AsString;
          cd_produto := qry_fat_proc_CD_PRODUTO.AsString;

          qry_fat_.Close;
          qry_fat_proc_.Close;
          qry_fat_proc_item_.Close;
          qry_fat_cc_.Close;

          CloseStoredProc(sp_fat_refat);
          sp_fat_refat.ParamByName('@CD_UNID_NEG').AsString    := cd_unid_neg;
          sp_fat_refat.ParamByName('@CD_PRODUTO').AsString     := cd_produto;
          sp_fat_refat.ParamByName('@NR_SOLICITACAO').AsString := nr_solicitacao;
          ExecStoredProc(sp_fat_refat);

          datm_main.db_broker.Commit;

          CloseStoredProc(sp_fat_refat);

          AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );

          qry_fat_.Locate('CD_UNID_NEG;CD_PRODUTO;NR_SOLICITACAO',
              VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text, nr_solicitacao]),
                         [loCaseInsensitive, loPartialKey]);
        end
        else BoxMensagem('Não existem processos a refaturar!', 2)
      else
        BoxMensagem('O processo não pode ser refaturado!', 2);
    end;

  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;


procedure Tfrm_fat_sol.btn_duplicarClick(Sender: TObject);
begin
  with datm_fat_sol do
  begin
    if qry_fat_proc_.RecordCount > 0 then
    begin
      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc(sp_fat_duplica);
        sp_fat_duplica.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
        sp_fat_duplica.ParamByName('@CD_PRODUTO').AsString     := msk_cd_produto.Text;
        sp_fat_duplica.ParamByName('@NR_SOLICITACAO').AsString := qry_fat_NR_SOLICITACAO.AsString;
        sp_fat_duplica.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate( msk_dt_movimento.Text );
        ExecStoredProc(sp_fat_duplica);
        CloseStoredProc(sp_fat_duplica);

        datm_main.db_broker.Commit;

        AbreFatur( msk_cd_unid_neg.Text, msk_cd_produto.Text, StrToDate( msk_dt_movimento.Text ) );
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.mi_nf_servClick(Sender: TObject);
begin
  vStr_cd_modulo := '11';
  str_cd_rotina := '1120';
  btn_sairClick(nil);
end;

procedure Tfrm_fat_sol.mi_nota_deb_credClick(Sender: TObject);
begin
  vStr_cd_modulo := '11';
  str_cd_rotina := '1105';
  btn_sairClick(nil);
end;

procedure Tfrm_fat_sol.dbedt_nr_notaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with datm_fat_sol do
  begin
    if ( ssCtrl in Shift ) and ( Key = 96 ) and ( Trim( qry_fat_NR_NOTA_FATURA.AsString ) <> '' ) then
    begin
      if BoxMensagem( 'Deseja apagar o nº na Nota?', 1 ) then
      begin
        if qry_fat_.State in [dsEdit, dsInsert] then
        begin
          qry_fat_NR_NOTA_FATURA.AsString := '';
          qry_fat_NR_NF_SERV.AsString     := '';
        end
        else
        begin
          qry_fat_.Edit;
          qry_fat_NR_NOTA_FATURA.AsString := '';
          qry_fat_NR_NF_SERV.AsString     := '';
          btn_salvarClick(nil);
        end;
      end;
    end;
  end;
end;


procedure Tfrm_fat_sol.btn_itemClick(Sender: TObject);
begin
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_item, frm_item );
  frm_item.ShowModal;
end;

function Tfrm_fat_sol.AvisoRetencao: String;
begin
  // Verifica parâmetro no cadastro de Empresa Nacional para saber se cliente acumula ou não a retenção
  Result := '0';
  with datm_fat_sol.qry_cliente_habil_ do
  begin
     Close;
     ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
     ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
     ParamByName('CD_PRODUTO').AsString  := datm_fat_sol.qry_processo_CD_PRODUTO.AsString;
     Prepare;
     Open;
     if not EOF then
     begin
       Result := FieldByName('IN_AVISO_RETENCAO').AsString;
     end
     else
       Result := '0';
     //Close;
  end;
end;


function Tfrm_fat_sol.TotalRetencao: String;
var
   valor_tributavel, valor_comissao, vl_remessa : Double;
begin
  Result := '0';
  valor_tributavel := 0;
  valor_comissao := 0 ;
  // Códigos Status Retenção - campo IN_STATUS tabela TNF_RETENCAO
  // C - nota cancelada
  // - - nota não acumulou, nem foi acumulada em outra, nem passou de 5000
  // S - nota não acumulou nem foi acumulada em outra, nem passou de 5000 MAS no mês cliente/grupo já teve
  //     nota de 5000
  // A - nota cujo valor foi acumulado em outra
  // N - nota acima de 5000
  // T - nota totalizadora
  // R - nota de cliente que imprime sempre o valor ( não acumula )

  with datm_fat_sol do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    vl_remessa := qry_param_VL_REMESSA.AsFloat;
    qry_param_.Close;

    with qry_tot_tributavel_ do
    begin
      // Verifica valor total tributavel - PROCESSO CORRENTE
      Close;
      ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
      Prepare;
      Open;
      if Not EOF then
      begin
        valor_tributavel := FieldByName('VL_TRIBUTAVEL').AsFloat;
      end;
      Close;
    end;

    with qry_comissao_ do
    begin
      // Verifica valor comissão - PROCESSO CORRENTE
      Close;
      ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
      Prepare;
      Open;
      if Not EOF then
      begin
        valor_comissao := FieldByName('VL_COMISSAO').AsFloat;
      end;
      Close;
    end;

    valor_tributavel := valor_tributavel + valor_comissao;
    if valor_tributavel > vl_remessa then
    begin
      Result := '1';
      Close;
      Exit;
    end;

    // Verifica valor que já foi retido no mês
    with qry_retencao_ do
    begin
      Close;
      CalculaData;
      ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
      ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
      ParamByName('DT_INICIO').AsDateTime := DataInicial;
      ParamByname('DT_FIM').AsDateTime    := DataFinal;
      Prepare;
      Open;

      if not EOF then
      begin
        if ( FieldByName('VL_TRIBUTAVEL').AsFloat + valor_tributavel ) > vl_remessa then
          Result := '1'
        else
          Result := '0';
      end;
      Close;
    end;
  end;
end;


function Tfrm_fat_sol.NFAcumulada: String;
begin
  Result := '0';
//  CalculaData; hj
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select count(*) QTD from TRETENCAO');
    SQL.Add(' where');
    SQL.Add('     CD_UNID_NEG =:CD_UNID_NEG and CD_PRODUTO =:CD_PRODUTO AND CD_CLIENTE =:CD_CLIENTE AND');
    SQL.Add('     DT_FATURA between :DT_INI and :DT_FIM and IN_JA_RETIDO = ''1''');

    ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
    ParamByName('CD_PRODUTO').AsString  := datm_fat_sol.qry_processo_CD_PRODUTO.AsString;
    ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
    ParamByName('DT_INI').AsDateTime    := DataInicial;
    ParamByname('DT_FIM').AsDateTime    := DataFinal;
    Open;
    if FieldByName('QTD').AsInteger > 0 then //cliente já reteve nota com valor maior que 5000
      Result := '1'
    else
      Result := '0';
    Free;
  end;


{ Comentado por André Borges

   with datm_fat_sol.qry_nf_impressa_ do
  begin
     Close;
     CalculaData;
     ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
     ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
     ParamByName('DT_INICIO').AsDateTime := DataInicial;
     ParamByname('DT_FIM').AsDateTime    := DataFinal;
     Prepare;
     Open;
     if Not EOF then
     begin
       if FieldByName('QTDE').AsInteger > 0 then
       begin
         Result := '1';
       end
       else
       begin
         with datm_fat_sol.qry_nf_impressa_grupo_ do
         begin
           Close;
           ParamByName('CD_GRUPO').AsString  := datm_fat_sol.qry_processo_CD_GRUPO.AsString;
           ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
           ParamByName('DT_INICIO').AsDateTime := DataInicial;
           ParamByname('DT_FIM').AsDateTime    := DataFinal;
           Prepare;
           Open;
           if Not EOF then
           begin
             if FieldByName('QTDE').AsInteger > 0 then
             begin
               Result := '1';
              end
             else Result := '0';
           end;
           Close;
         end;
       end;
     end
     else
     begin
       with datm_fat_sol.qry_nf_impressa_grupo_ do
       begin
         Close;
         ParamByName('CD_GRUPO').AsString  := datm_fat_sol.qry_processo_CD_GRUPO.AsString;
         ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
         ParamByName('DT_INICIO').AsDateTime := DataInicial;
         ParamByname('DT_FIM').AsDateTime    := DataFinal;
         Prepare;
         Open;
         if Not EOF then
         begin
           if FieldByName('QTDE').AsInteger > 0 then
           begin
             Result := '1';
           end
           else
             Result := '0';
         end;
         Close;
       end;
     end;
     Close;
  end;}
end;


function Tfrm_fat_sol.Remessa: String;
begin
  // Verifica parâmetro no cadastro de Empresa Nacional para saber se cliente sempre imprime remessa
  Result := '0';
  with datm_fat_sol.qry_cliente_habil_ do
  begin
     Close;
     ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
     ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
     ParamByName('CD_PRODUTO').AsString  := datm_fat_sol.qry_processo_CD_PRODUTO.AsString;
     Prepare;
     Open;
     if Not EOF then
     begin
       Result := FieldByName('IN_REMESSA').AsString;
     end
     else Result := '0';
     Close;
  end;
end;


procedure Tfrm_fat_sol.CalculaData;
begin
  DataInicial := EncodeDate(
                 StrToInt( Copy( msk_dt_movimento.Text, 7, 4 ) ),
                 StrToInt( Copy( msk_dt_movimento.Text, 4, 2 ) ), 1);

  DataFinal := EncodeDate ( StrToInt( Copy( msk_dt_movimento.Text, 7, 4 ) ),
                            StrToInt( Copy( msk_dt_movimento.Text, 4, 2 ) ),
                            DaysInAMonth(StrToInt(Copy( msk_dt_movimento.Text, 7, 4 )),StrToInt(Copy( msk_dt_movimento.Text, 4, 2 ))) );
end;

procedure Tfrm_fat_sol.dbedt_cd_documentoChange(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_docto_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_fat_sol.dbedt_cd_documentoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  CodExits;
  lNaoConsiste := False;
end;

procedure Tfrm_fat_sol.btn_co_documentoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT CODIGO, DESCRICAO ');
  vListAux.Add('       FROM   TTP_DOCUMENTO ( NOLOCK ) ');
  vListAux.Add('WHERE CD_UNID_NEG  = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND CD_PRODUTO = ''' + msk_cd_produto.Text + '''');
  dbedt_cd_documento.Text := ConsultaOnLineExSQLList(vListAux,'Documentos',['CODIGO', 'DESCRICAO'],['Código', 'Documento'],'CODIGO',nil);
  vListAux.Free;
  dblckpbox_forma_docto.setfocus;
end;


procedure Tfrm_fat_sol.DemonstrativoDespesas1Click(Sender: TObject);
begin
  vStr_cd_modulo := '11';
  str_cd_rotina := '1104';
  btn_sairClick(nil);
end;


procedure Tfrm_fat_sol.InsereDoctosCli;
var
  vQry : TQuery;
  vNrDocto : String;
begin
  // Se o cliente não é do grupo DuPont sai
  vQry := TQuery.Create(Application);
  vQry.DataBaseName := 'DBBROKER';
  vQry.SQL.Clear;
  vQry.SQL.Add( 'SELECT IN_DOCTO_SOLIC FROM TCLIENTE_HABILITACAO (NOLOCK) ' );
  vQry.SQL.Add( 'WHERE CD_CLIENTE = :CD_CLIENTE AND CD_UNID_NEG = :CD_UNID_NEG ' );
  vQry.SQL.Add( ' AND CD_PRODUTO = :CD_PRODUTO ' );
  VQry.ParamByName('CD_CLIENTE').AsString := cd_cliente;
  VQry.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  VQry.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
  vQry.Open;
  with TQuery.Create(Application) do
  begin
    if vQry.Fields[0].AsString = '0' then
    begin
      VQry.Close;
      Free;
      Exit;
    end;
    Free;
  end;
  VQry.Close;

  // Grava Invoices nos Documentos
  vQry := TQuery.Create(Application);
  vQry.DataBaseName := 'DBBROKER';
  vQry.SQL.Clear;
  //distinct impede a inclusão de documentos com memso nome! kleber 23/05/2007
  vQry.SQL.Add( 'SELECT DISTINCT NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUCAO (NOLOCK) ' );
  vQry.SQL.Add( 'WHERE NR_PROCESSO = ''' + nr_processo + '''' );
  vQry.Open;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    while not vQry.EOF do
    begin
      SQL.Clear;
      SQL.Add( ' INSERT INTO TS_FATURA_DOCUMENTO ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, CD_DOCUMENTO, CD_FORMA_DOC, NR_DOCTO ) ' );
      SQL.Add( ' VALUES ( :CD_UNID_NEG, :CD_PRODUTO, :NR_SOLICITACAO, :CD_DOCUMENTO, :CD_FORMA_DOC, :NR_DOCTO )' );
      ParamByName('CD_UNID_NEG').AsString    := Copy( nr_processo, 1, 2 );
      ParamByName('CD_PRODUTO').AsString     := Copy( nr_processo, 3, 2 );
      ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
      ParamByName('CD_DOCUMENTO').AsString   := '062';  // Invoice
      ParamByName('CD_FORMA_DOC').AsString   := '1';
      ParamByName('NR_DOCTO').AsString       := vQry.Fields[0].AsString;
      ExecSQL;
      vQry.Next;
    end;
    Free;
  end;
  vQry.Close;

  // Grava Nota Fiscal de Entrada nos Documentos
  vQry := TQuery.Create(Application);
  vQry.DataBaseName := 'DBBROKER';
  vQry.SQL.Clear;
  vQry.SQL.Add( 'SELECT NR_NOTA FROM TPROCESSO_NF (NOLOCK) ' );
  vQry.SQL.Add( 'WHERE IN_CANCELADO = ''0''' );
  vQry.SQL.Add( ' AND NR_PROCESSO = ''' + nr_processo + '''' );
  vQry.Open;
  vNrDocto := '';
  while not vQry.EOF do
  begin
    vNrDocto := vNrDocto + vQry.Fields[0].AsString + ', ';
    vQry.Next;
  end;
  vQry.Close;

  if vNrDocto <> '' then
  begin
    vNrDocto := Copy( vNrDocto, 1, length( vNrDocto ) - 2 );
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( ' INSERT INTO TS_FATURA_DOCUMENTO ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, CD_DOCUMENTO, CD_FORMA_DOC, NR_DOCTO ) ' );
      SQL.Add( ' VALUES ( :CD_UNID_NEG, :CD_PRODUTO, :NR_SOLICITACAO, :CD_DOCUMENTO, :CD_FORMA_DOC, :NR_DOCTO )' );
      ParamByName('CD_UNID_NEG').AsString    := Copy( nr_processo, 1, 2 );
      ParamByName('CD_PRODUTO').AsString     := Copy( nr_processo, 3, 2 );
      ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
      ParamByName('CD_DOCUMENTO').AsString   := '063';  // NFE
      ParamByName('CD_FORMA_DOC').AsString   := '1';
      ParamByName('NR_DOCTO').AsString       := vNrDocto;
      ExecSQL;
      Free;
    end
  end;
  vQry.Close;

  // Grava todos os Outros Documentos
  vQry := TQuery.Create(Application);
  vQry.DataBaseName := 'DBBROKER';
  vQry.SQL.Clear;
  vQry.SQL.Add( 'SELECT CD_DOCUMENTO, CD_FORMA_DOC FROM TCLIENTE_DOCUMENTO (NOLOCK) ' );
  vQry.SQL.Add( 'WHERE CD_CLIENTE = ''' + cd_cliente + '''' );
  vQry.SQL.Add( 'AND CD_UNID_NEG = ''' + Copy( nr_processo, 1, 2 ) + '''' );
  vQry.SQL.Add( 'AND CD_PRODUTO = ''' + Copy( nr_processo, 3, 2 ) + '''' );
  vQry.SQL.Add( 'AND CD_DOCUMENTO NOT IN ( 062, 063 ) ' );       // não entram INVOICE e NFE
  vQry.Open;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    while not vQry.EOF do
    begin
      SQL.Clear;
      SQL.Add( ' INSERT INTO TS_FATURA_DOCUMENTO ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, CD_DOCUMENTO, CD_FORMA_DOC, NR_DOCTO ) ' );
      SQL.Add( ' VALUES ( :CD_UNID_NEG, :CD_PRODUTO, :NR_SOLICITACAO, :CD_DOCUMENTO, :CD_FORMA_DOC, :NR_DOCTO )' );
      ParamByName('CD_UNID_NEG').AsString    := Copy( nr_processo, 1, 2 );
      ParamByName('CD_PRODUTO').AsString     := Copy( nr_processo, 3, 2 );
      ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
      ParamByName('CD_DOCUMENTO').AsString   := vQry.Fields[0].AsString;  // Outros Documentos
      ParamByName('CD_FORMA_DOC').AsString   := vQry.Fields[1].AsString;
      ParamByName('NR_DOCTO').AsString       := '';
      ExecSQL;
      vQry.Next;
    end;
    Free;
  end;
  vQry.Close;
end;

procedure Tfrm_fat_sol.ExcluiDoctosCli;
begin
  // Exclui registros da tabela
  nr_solicitacao := Copy( DBEdit1.TEXT, 1, 2 ) + '' + Copy( DBEdit1.TEXT, 4, 4 );
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add( ' DELETE FROM TS_FATURA_DOCUMENTO ' );
    SQL.Add( ' WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''' );
    SQL.Add( ' AND  CD_PRODUTO = ''' + msk_cd_produto.Text + '''' );
    SQL.Add( ' AND  NR_SOLICITACAO = ''' + nr_solicitacao + '''' );
    ExecSQL;
    Free;
  end;
end;


procedure Tfrm_fat_sol.btn_centro_custoClick(Sender: TObject);
begin
  if ( datm_fat_sol.qry_fat_proc_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi(False, True, True, False);

  if Sender is TSpeedButton then
  begin
    if not ( datm_fat_sol.qry_fat_proc_item_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_fat_sol.qry_fat_proc_item_.Edit;

    datm_fat_sol.qry_fat_proc_item_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro de Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',frm_main.mi_cad_fin_conta_gerencial, 0)
  end
  else
  begin
    dbedt_nm_ct_custo.Text := ConsultaLookUPSQL('select CD_CT_CUSTO, NM_CT_CUSTO FROM TCONTABIL_CUSTO where IN_ATIVO = 1 and CD_CT_CUSTO = ''' + dbedt_cd_ct_custo.Text + '''','NM_CT_CUSTO');
  end;
end;

function Tfrm_fat_sol.VerificaRetencao : Boolean;
var
  valor_tributavel, vValorComissao : Real;
begin
  valor_tributavel := 0;
  vValorComissao   := 0;
  with datm_fat_sol do
  begin
    // Verifica valor total tributavel - PROCESSO CORRENTE
    qry_tot_tributavel_.Close;
    qry_tot_tributavel_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_tot_tributavel_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_tot_tributavel_.ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
    qry_tot_tributavel_.Prepare;
    qry_tot_tributavel_.Open;
    if not qry_tot_tributavel_.EOF then
      valor_tributavel := qry_tot_tributavel_.FieldByName('VL_TRIBUTAVEL').AsFloat;
    qry_tot_tributavel_.Close;

    // Verifica valor comissão - PROCESSO CORRENTE
    qry_comissao_.Close;
    qry_comissao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_comissao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_comissao_.ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
    qry_comissao_.Prepare;
    qry_comissao_.Open;
    if not qry_comissao_.EOF then
      vValorComissao := datm_fat_sol.qry_comissao_.FieldByName('VL_COMISSAO').AsFloat;
    qry_comissao_.Close;

    valor_tributavel := valor_tributavel + vValorComissao;

    //Verifica o qto que já foi retido no mês para o cliente
    qry_retencao_.Close;
//    CalculaData; hj
    qry_retencao_.ParamByName('CD_CLIENTE').AsString  := datm_fat_sol.qry_processo_CD_CLIENTE.AsString;
    qry_retencao_.ParamByname('CD_UNID_NEG').AsString := datm_fat_sol.qry_processo_CD_UNID_NEG.AsString;
//    qry_retencao_.ParamByName('CD_PRODUTO').AsString  := datm_fat_sol.qry_processo_CD_PRODUTO.AsString;
    qry_retencao_.ParamByName('DT_INICIO').AsDateTime := DataInicial;
    qry_retencao_.ParamByname('DT_FIM').AsDateTime    := DataFinal;
    qry_retencao_.Prepare;
    qry_retencao_.Open;

    if not qry_retencao_.EOF then
    begin
      if ( qry_retencao_.FieldByName('VL_TRIBUTAVEL').AsFloat + valor_tributavel ) > 5000 then
        Result := True
      else
        Result := False;
    end;
  end;
end;

procedure Tfrm_fat_sol.btnPreviewCalcClick(Sender: TObject);
begin
  if BoxMensagem('Deseja calcular a Fatura em modo Preview ?', 1) then
    CalculaSolic(True);
end;

procedure Tfrm_fat_sol.btn_manut_procClick(Sender: TObject);
begin
  if datm_fat_sol.qry_fat_proc_.State in [dsEdit, dsInsert] then
    btn_cancelarClick(nil);
  vStr_cd_modulo := '01';
  str_cd_rotina := '0102';
  frm_manut_proc.pesq_cd_unid_neg := msk_cd_unid_neg.Text;
  frm_manut_proc.pesq_cd_prod     := msk_cd_produto.Text;
  frm_manut_proc.pesq_nr_proc     := msk_cd_unid_neg.Text + msk_cd_produto.Text + datm_fat_sol.qry_fat_proc_Calc_Nr_Processo.AsString;
  frm_manut_proc.ShowModal;
end;

function Tfrm_fat_sol.VerificaRetencaoFinal : Boolean;
var
  vNrNota, vDtFatura, vCgcEmpresa : String;
begin
  with datm_fat_sol do
  begin
    Result := False;
    // verifica se é tipo fatura
    if (ConsultaLookUPSQL('SELECT TP_TIPO_FAT AS TP_TIPO_FAT FROM TS_FATURA WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                         ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'TP_TIPO_FAT') = 'F') then
      // verifica se é está nas tabelas de retenção
      if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') or
         (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA') = '1') then
      begin
        vNrNota := ConsultaLookUPSQL('SELECT NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'NR_NOTA');
        vCgcEmpresa := ConsultaLookUPSQL('SELECT CGC_EMPRESA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'CGC_EMPRESA');

       //IR
        vDtFatura := ConsultaLookUPSQL('SELECT DT_FATURA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                          ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'DT_FATURA');

        // Se sim verifica se uma é uma nota totalizadora
        if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text +
                              ''' AND IN_IR_RETIDO_ATUAL = ''1''', 'NR_NOTA') = '1') then
        begin
          // Se sim verifica se EM SEGUIDA foram impressas outras notas no mesmo DIA
          if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_IR WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                ''' AND CONVERT(INT, NR_NOTA) > CONVERT(INT, ''' + vNrNota + ''') AND CGC_EMPRESA = '''+vCgcEmpresa+''''+
                                ' AND CONVERT(VARCHAR, DT_FATURA,103) = '''+ vDtFatura+'''', 'NR_NOTA') <> '0') then
          begin
//            BoxMensagem('Fatura não pode ser cancelada devido a retenção de IR!', 2);
            Exit;
          end
        end
        else
          // se não é uma nota totalizadora verifica se é uma nota que reteve IR
          if (ConsultaLookUPSQL('SELECT IN_IR_RETIDO FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' and CD_PRODUTO = '''+msk_cd_produto.Text+'''', 'IN_IR_RETIDO') = '0') then
            //se não é uma nota totalizadora e não reteve IR verifica se já foi impressa uma nota totalizadora no DIA
            if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_IR WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                  ''' AND IN_IR_RETIDO_ATUAL = ''1'' AND CGC_EMPRESA = '''+vCgcEmpresa+''' AND CONVERT(VARCHAR, DT_FATURA,103) = '''+ vDtFatura+
                                  '''', 'NR_NOTA') = '1') then
            begin
//              BoxMensagem('Fatura não pode ser cancelada devido a retenção de IR!', 2);
              Exit;
            end;
       //FIM IR

       //COFINS
        vDtFatura := ConsultaLookUPSQL('SELECT DT_FATURA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                  ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + '''', 'DT_FATURA');

        // Se sim verifica se uma é uma nota totalizadora
        if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text +
                              ''' AND IN_COFINS_RETIDO_ATUAL = ''1''', 'NR_NOTA') = '1') then
        begin
          // Se sim verifica se EM SEGUIDA foram impressas outras notas no mesmo MÊS
          if (ConsultaLookUPSQL('SELECT COUNT(NR_NOTA) AS NR_NOTA FROM TRETENCAO_COFINS WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                ''' AND CONVERT(INT, NR_NOTA) > CONVERT(INT, ''' +vNrNota+''') AND CGC_EMPRESA = '''+vCgcEmpresa+''''+
                                ' AND CONVERT(VARCHAR,MONTH(DT_FATURA))+''/''+CONVERT(VARCHAR,YEAR(DT_FATURA)) = '''+ Copy(vDtFatura,5,6) +'''', 'NR_NOTA') <> '0') then
          begin
//            BoxMensagem('Fatura não pode ser cancelada devido a retenção de Cofins!', 2);
            Exit;
          end
        end
        else
          // se não é uma nota totalizadora verifica se é uma nota que reteve COFINS
          if (ConsultaLookUPSQL('SELECT IN_COFINS_RETIDO FROM TRETENCAO_COFINS WHERE NR_SOLICITACAO = ''' + qry_fat_proc_NR_SOLICITACAO.AsString +
                              ''' AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' and CD_PRODUTO = '''+msk_cd_produto.Text+'''', 'IN_COFINS_RETIDO') = '0') then
            //se não é uma nota totalizadora e não reteve COFINS verifica se já foi impressa uma nota totalizadora no MÊS
            if (ConsultaLookUPSQL('SELECT COUNT(*) AS NR_NOTA FROM TRETENCAO_COFINS WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+
                                  ''' AND IN_COFINS_RETIDO_ATUAL = ''1'' AND CGC_EMPRESA = '''+vCgcEmpresa+
                                  ''' AND CONVERT(VARCHAR,MONTH(DT_FATURA))+''/''+CONVERT(VARCHAR,YEAR(DT_FATURA)) = '''+Copy(vDtFatura,5,6)+'''', 'NR_NOTA') = '1') then
            begin
//              BoxMensagem('Fatura não pode ser cancelada devido a retenção de Cofins!', 2);
              Exit;
            end;
       //FIM COFINS
      end; // verifica se é está nas tabelas de retenção
  end;
  Result := True;
end;

end.

