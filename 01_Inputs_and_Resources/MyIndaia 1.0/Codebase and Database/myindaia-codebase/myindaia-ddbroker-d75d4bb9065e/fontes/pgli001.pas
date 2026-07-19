unit PGLI001;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, DB, DBTables,
  Buttons, ComCtrls, Funcoes, ConsOnLineEx, uWebModulo, MaskUtils, RxDBComb;

const
  ID_TABELA = '1652005462';  

type
  Tfrm_LI_capa = class(TForm)
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_capa_li: TPageControl;
    ts_basicas: TTabSheet;
    lbl_importador: TLabel;
    btn_co_importador: TSpeedButton;
    lbl_nr_registro_li: TLabel;
    lbl_dt_registro_li: TLabel;
    Label19: TLabel;
    btn_co_pais_proc: TSpeedButton;
    lbl_urf_despacho1: TLabel;
    btn_co_urf_despacho: TSpeedButton;
    Label23: TLabel;
    btn_co_urf_entrada: TSpeedButton;
    dbedt_cd_importador: TDBEdit;
    dbedt_nr_registro_li: TDBEdit;
    dbedt_dt_registro_li: TDBEdit;
    dbedt_cd_urf_despacho: TDBEdit;
    dbedt_cd_urf_entrada: TDBEdit;
    dbedt_dt_li: TDBEdit;
    dbedt_cd_pais_proc: TDBEdit;
    ts_negociacao: TTabSheet;
    gbox_reg_trib: TGroupBox;
    lbl_fund: TLabel;
    btn_co_fund_legal: TSpeedButton;
    Label2: TLabel;
    btn_co_reg_trib: TSpeedButton;
    dbedt_cd_fund_legal: TDBEdit;
    dbedt_cd_reg_trib: TDBEdit;
    gbox_acordo_tar: TGroupBox;
    lbl_tipo: TLabel;
    lbl_acordo: TLabel;
    btn_co_acordo: TSpeedButton;
    dbedt_cd_acordo_aladi: TDBEdit;
    dblkcbox_acordo_tarif: TDBLookupComboBox;
    gbox_cobertura_cambial: TGroupBox;
    btn_co_motivo: TSpeedButton;
    lbl_motivo: TLabel;
    lbl_modalidade: TLabel;
    btn_co_modalidade: TSpeedButton;
    lbl_qtde: TLabel;
    btn_co_instituicao: TSpeedButton;
    lbl_instituicao: TLabel;
    dbedt_cd_mot_sem_cobert: TDBEdit;
    dbedt_cd_modalidade_pag: TDBEdit;
    dbedt_qtde_dias_pag: TDBEdit;
    dbedt_cd_instituicao_financ: TDBEdit;
    ts_totais: TTabSheet;
    Label14: TLabel;
    Label17: TLabel;
    grpbox_1: TGroupBox;
    lbl_moeda_mle1: TLabel;
    btn_co_moeda_mle: TSpeedButton;
    lbl_vl_moeda_mle1: TLabel;
    dbedt_cd_moeda_mle: TDBEdit;
    dbedt_vl_moeda_mle: TDBEdit;
    grpbox_2: TGroupBox;
    lbl_moeda_frete1: TLabel;
    btn_co_moeda_frete: TSpeedButton;
    lbl_vl_frete_li: TLabel;
    dbedt_cd_moeda_frete: TDBEdit;
    dbedt_vl_moeda_frete_li: TDBEdit;
    dbedt_qtde_peso_liquido: TDBEdit;
    dbedt_qtde_medida_estatistica: TDBEdit;
    dbg_docto_vinc: TDBGrid;
    stxt_docto_vinculado: TStaticText;
    dbgrd_ref: TDBGrid;
    dbrg_cobertura_cambial: TDBRadioGroup;
    dbedt_nm_importador: TEdit;
    dbedt_nm_pais_proc: TEdit;
    dbedt_nm_urf_entrada: TEdit;
    dbedt_nm_urf_despacho: TEdit;
    Label21: TLabel;
    dbedt_nm_fund_legal: TEdit;
    dbedt_nm_reg_trib: TEdit;
    dbedt_nm_acordo_aladi: TEdit;
    dbedt_nm_modalidade_pag: TEdit;
    dbedt_nm_mot_sem_cobert: TEdit;
    dbedt_nm_instituicao_financ: TEdit;
    dbedt_nm_moeda_mle: TEdit;
    dbedt_nm_moeda_frete: TEdit;
    mi_excluir: TMenuItem;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_monta_li: TSpeedButton;
    btn_itens_li: TSpeedButton;
    btn_excluir: TSpeedButton;
    mi_monta_li: TMenuItem;
    mi_itens_li: TMenuItem;
    dbedt_nr_processo_basica: TDBEdit;
    lbl_nr_processo_basica: TLabel;
    bvl_negociacao: TBevel;
    lbl_nr_processo_negoc: TLabel;
    dbedt_nr_processo_negoc: TDBEdit;
    bvl_totais: TBevel;
    lbl_nr_processo_total: TLabel;
    dbedt_nr_processo_total: TDBEdit;
    dbchk_embut_frete: TDBCheckBox;
    btn_calcular: TSpeedButton;
    mi_calcular: TMenuItem;
    db_lbl_ident_siscomex: TDBText;
    Label1: TLabel;
    Label3: TLabel;
    db_lbl_dt_transmissao: TDBText;
    btn_registra_li: TSpeedButton;
    dbmemo_info_complementares: TDBMemo;
    lbl_info_comp: TLabel;
    btn_co_obs: TSpeedButton;
    lbl_incoterm: TLabel;
    btn_co_incoterm: TSpeedButton;
    dbedt_nm_incoterm: TEdit;
    GroupBox1: TGroupBox;
    cbxMaterialUsado: TDBCheckBox;
    rgpEnquadramentoMaterialUsado: TDBRadioGroup;
    RxDBComboBox1: TRxDBComboBox;
    dbedt_cd_incoterm: TDBEdit;
    lblOpcoesNacionalizacao: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbedtvl_frete_moeda_merc: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_urf_despachoExit(Sender: TObject);
    procedure btn_monta_liClick(Sender: TObject);
    procedure btn_itens_liClick(Sender: TObject);
    procedure btn_co_urf_entradaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_obsClick(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_capa_liChange(Sender: TObject);
    procedure pgctrl_capa_liChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cd_moeda_fobExit(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_pais_procClick(Sender: TObject);
    procedure dbedt_cd_pais_procExit(Sender: TObject);
    procedure btn_co_reg_tribClick(Sender: TObject);
    procedure btn_co_fund_legalClick(Sender: TObject);
    procedure btn_co_motivoClick(Sender: TObject);
    procedure dbedt_cd_reg_tribExit(Sender: TObject);
    procedure dbedt_cd_fund_legalExit(Sender: TObject);
    procedure dbedt_cd_modalidade_pagExit(Sender: TObject);
    procedure dbedt_cd_mot_sem_cobertExit(Sender: TObject);
    procedure dblkcbox_acordo_tarifExit(Sender: TObject);
    procedure btn_co_agencia_secexClick(Sender: TObject);
    procedure dbedt_cd_agencia_secexExit(Sender: TObject);
    procedure btn_co_acordoClick(Sender: TObject);
    procedure dblkcbox_acordo_tarifEnter(Sender: TObject);
    procedure rdgrp_condicaoClick(Sender: TObject);
    procedure dbedt_cd_acordo_aladiExit(Sender: TObject);
    procedure dbedt_cd_urf_entradaExit(Sender: TObject);
    procedure dbrg_cobertura_cambialClick(Sender: TObject);
    procedure dbedt_cd_importadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_urf_despachoClick(Sender: TObject);
    procedure btn_co_modalidadeClick(Sender: TObject);
    procedure btn_co_moeda_mleClick(Sender: TObject);
    procedure btn_co_moeda_freteClick(Sender: TObject);
    procedure dbedt_cd_moeda_mleExit(Sender: TObject);
    procedure dbedt_cd_moeda_freteExit(Sender: TObject);
    procedure dbgrd_refKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_calcularClick(Sender: TObject);
    procedure dbedt_cd_instituicao_financExit(Sender: TObject);
    procedure btn_registra_liClick(Sender: TObject);
    procedure cbxMaterialUsadoClick(Sender: TObject);
    procedure rgpEnquadramentoMaterialUsadoChange(Sender: TObject);

  private
    { Private declarations }
    function VerAlt : Boolean;
    function Grava  : Boolean;
    procedure Cancelar;
    procedure CodExits;

    //RegistraLI
    function NewWebBrowserRegistraLI: Tfrm_Web;
    procedure WebDocumentCompleteRegistraLI(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure WebDocumentBeginDownloadRegistraLI(Sender: TObject; var AFileName: TFileName);
    procedure WebDocumentEndDownloadRegistraLI(Sender: TObject; AFileName: TFileName);
    procedure ExecutaRegistraLI;

    //GravaExtratoLI
    function TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
    function DigitalizaDocumento(AProcesso, ADocumento, ATipoDocumento, ADescricao: String): Boolean;
    function GetNomeArquivo(AProcesso, APathDig, APrefixo: String): String;
    function GravaExtratoLI: Boolean;

    function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
    function MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
    procedure HabilitaEnquadramento(Value: Boolean);
    procedure HabilitaOpcoesEnquadramento(Value: Boolean);
  public
    { Public declarations }
    FStatusBrowser: Boolean;
    Code : integer;
    lNaoConsiste : Boolean;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;

    function Consiste : Boolean;
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;
    procedure btn_mi(s, c, e, l, m, i: Boolean);
    {verificar a necessidade dessas procedures abaixo}
    procedure Atualiza_Historico_Padrao;
    procedure ValidaRegime( nControla : Byte );
    procedure Valida_Valores(Sender: TObject);
    procedure GuardaTaxaCambial;
    procedure AtzTaxaCambialDI( Moeda : String; Campo : TFloatField );
    procedure Valores;
    procedure ChamaValidCambio( nTipo : Integer );
  end;

var
  frm_LI_capa: Tfrm_LI_capa;
  NrLI: String;

implementation

uses GSMLIB, PGGP017, PGGP001, PGLI002, PGLI004, PGLI005, DateUtils,
  StrUtils, KrQuery;

{$R *.DFM}

procedure Tfrm_LI_Capa.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( Components[i] is TSpeedButton      ) then
      TSpeedButton( Components[i] ).Enabled      := True;
    if ( Components[i] is TDBEdit           ) then
      TDBEdit( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBRadioGroup     ) then
      TDBRadioGroup( Components[i] ).Enabled     := True;
    if ( Components[i] is TRadioButton      ) then
      TRadioButton( Components[i] ).Enabled      := True;
    if ( Components[i] is TDBMemo           ) then
      TDBMemo( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBCheckBox       ) then
      TDBCheckBox( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBLookupComboBox ) then
      TDBLookupComboBox( Components[i] ).Enabled := True;
  end;
end;

procedure Tfrm_LI_Capa.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( Components[i] is TSpeedButton      ) then
      TSpeedButton( Components[i] ).Enabled      := False;
    if ( Components[i] is TDBEdit           ) then
      TDBEdit( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBRadioGroup     ) then
      TDBRadioGroup( Components[i] ).Enabled     := False;
    if ( Components[i] is TRadioButton      ) then
      TRadioButton( Components[i] ).Enabled      := False;
    if ( Components[i] is TDBMemo           ) then
      TDBMemo( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBCheckBox       ) then
      TDBCheckBox( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBLookupComboBox ) then
      TDBLookupComboBox( Components[i] ).Enabled := False;
  end;
end;

procedure Tfrm_LI_capa.btn_mi(s, c, e, l, m, i: Boolean);
begin
  btn_salvar.Enabled   := s;  mi_salvar.Enabled   := s;
  btn_cancelar.Enabled := c;  mi_cancelar.Enabled := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled  := e;
  btn_calcular.Enabled := l;  mi_calcular.Enabled := l;
  btn_monta_li.Enabled := m;  mi_monta_li.Enabled := m;
  btn_itens_li.Enabled := i;  mi_itens_li.Enabled := i;
end;

procedure Tfrm_LI_capa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_LI_Capa do
    begin
      qry_li_.Close;
      qry_anuentes_.Close;
      qry_ref_cli_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_LI_capa.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LI_capa.btn_salvarClick(Sender: TObject);
begin
  if (Trim( datm_LI_Capa.qry_li_NR_REGISTRO_LI.AsString ) = '') or (frm_LI.in_retificar) then
  begin
    if Not Consiste then Exit;
    if Not Grava    then Exit;
  end;
  btn_mi(False, False, True, True, True, True);
end;

procedure Tfrm_LI_capa.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_LI_capa.FormShow(Sender: TObject);
var
  nTipo_Cambio: Integer;
begin
  pgctrl_capa_li.ActivePage := ts_basicas;

  if Trim( str_nr_processo ) = '' then
    str_nr_processo := Trim( datm_LI.qry_li_NR_PROCESSO.AsString );
  Caption := 'Licença de Importação [ ' + Copy( str_nr_processo, 5, 14 ) + ' ] ';

  with datm_li_Capa do
  begin
    qry_li_.Close;
    qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_li_.Prepare;
    qry_li_.Open;

    qry_anuentes_.Close;
    qry_anuentes_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_anuentes_.Open;

    qry_ref_cli_.Close;
    qry_ref_cli_.ParamByName('NR_PROCESSO').AsString := Copy( str_nr_processo, 1, 14 );
    qry_ref_cli_.Prepare;
    qry_ref_cli_.Open;

    qry_tp_acordo_tarif_.Close;
    qry_tp_acordo_tarif_.Prepare;
    qry_tp_acordo_tarif_.Open;

    if frm_LI.in_abertura then
    begin
      qry_li_.Edit;

      NullToZero( qry_LI_QT_MED_ESTATISTICA);
      NullToZero( qry_LI_QT_TOTAL_PES_LIQ  );
      NullToZero( qry_LI_VL_TOTAL_MOEDA    );
      NullToZero( qry_LI_VL_DESPESA_MOEDA  );
      NullToZero( qry_LI_VL_DESCONTO_MOEDA );
      NullToZero( qry_LI_VL_FRETE_MOEDA    );
      NullToZero( qry_LI_VL_SEGURO_MOEDA   );

      qry_li_.Cancel;
    end;

    dbedt_cd_importadorExit(nil);
    nTipo_cambio := -1;
    
    if qry_li_TP_CAMBIO.AsString = '1' then nTipo_Cambio := 0;
    if qry_li_TP_CAMBIO.AsString = '2' then nTipo_Cambio := 1;
    if qry_li_TP_CAMBIO.AsString = '3' then nTipo_Cambio := 2;
    if qry_li_TP_CAMBIO.AsString = '4' then nTipo_Cambio := 3;

    dbrg_cobertura_cambial.ItemIndex := nTipo_cambio;

    if frm_LI.in_abertura then
    begin
      Habilita_Entrada;
      btn_mi(True, True, False, False, False, True);
    end
    else
    if frm_LI.in_montada then
    begin
      if frm_LI.in_retificar then
      begin
        Habilita_Entrada;
        //btn_mi(True, True, False, False, False, True);
        btn_mi(False, False, True, True, True, True);
      end
      else
      begin
        Desabilita_Entrada;
        btn_mi(False, False, False, False, False, True);
      end;
    end
    else
    begin
      Habilita_Entrada;
      btn_mi(False, False, True, True, True, True);
    end;
    dbgrd_ref.Enabled := False;

    btn_registra_li.Enabled := True;
    btn_sair.Enabled     := True;
    mi_sair.Enabled      := True;
    btn_itens_li.Enabled := True;
    mi_itens_li.Enabled  := True;
  end;
  ChamaValidCambio( dbrg_cobertura_cambial.ItemIndex );
  HabilitaEnquadramento(cbxMaterialUsado.Checked);
  HabilitaOpcoesEnquadramento(rgpEnquadramentoMaterialUsado.ItemIndex = 1);  
end;

procedure Tfrm_LI_capa.dbedt_cd_importadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_urf_despachoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_monta_liClick(Sender: TObject);
var
  nNum, Code : Integer;
begin
  with datm_LI_Capa do
  begin
    if qry_li_IN_MONTADA.AsString = '1' then
    begin
      BoxMensagem( 'LI já está montada !', 3 );
      Exit;
    end;

    Val( qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

    if (qry_li_QT_TOTAL_ITEM.IsNull) or ( nNum = 0) then
    begin
      BoxMensagem( 'LI não possui itens !', 3 );
      Exit;
    end;

    if BoxMensagem( 'Deseja montar LI ?', 1 ) then
    begin
      qry_li_.Close;

      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc( sp_li_monta_li );
        sp_li_monta_li.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc( sp_li_monta_li );
        case sp_li_monta_li.ParamByName('Result').AsInteger of
          1: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Valor Total da Mercadoria diferente!', 2);
               qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               qry_li_.Prepare;
               qry_li_.Open;
               Exit;
             end;
          2: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Total do Peso Liquido é diferente !', 2);
               qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               qry_li_.Prepare;
               qry_li_.Open;
               Exit;
             end;
          3: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Total da Quantidade é diferente!', 2);
               qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               qry_li_.Prepare;
               qry_li_.Open;
               Exit;
             end;
        end;
        CloseStoredProc( sp_li_monta_li );
        datm_main.db_broker.Commit;

        frm_LI.in_montada   := True;
        frm_LI.in_atualizar := True;

        btn_sairClick(nil);

        frm_LI.msk_nr_processoExit(nil);
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

procedure Tfrm_LI_capa.btn_itens_liClick(Sender: TObject);
begin
  Close;
  frm_LI.i_seletor := 2;
end;

procedure Tfrm_LI_capa.btn_co_urf_entradaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_URF_ENTRADA.AsString := ConsultaOnLineEx('TURF','Unidade da Receita Federal de Entrada',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_urf);
  End
  else
    dbedt_nm_urf_entrada.Text := ConsultaLookUP('TURF','CODIGO',dbedt_cd_urf_entrada.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_LI_capa, datm_LI_capa );
end;

procedure Tfrm_LI_capa.btn_co_obsClick(Sender: TObject);
begin
  if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
  datm_LI_Capa.qry_li_TX_INFO_COMPLEMENTAR.AsString := ConsultaOnLineEx('TOBSERVACOES','Observações',['CD_OBS','TX_DESCRICAO','TX_OBS'],['Código','Descrição', 'Obs.'],'TX_OBS',nil);
{
  Application.CreateForm(Tfrm_observacoes, frm_observacoes );
  frm_observacoes.Cons_OnLine := DATM_LI_capa.qry_li_TX_INFO_COMPLEMENTAR;
  with frm_observacoes do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;}
  Atualiza_Historico_Padrao;
end;

procedure Tfrm_LI_capa.dbedt_cd_incotermExit(Sender: TObject);
begin
  if datm_LI_Capa.ds_li.State in [dsInsert, dsEdit] then
    if ( dbedt_cd_incoterm.Text = 'EXW' ) or
       ( dbedt_cd_incoterm.Text = 'FAS' ) or
       ( dbedt_cd_incoterm.Text = 'FOB' ) or
       ( dbedt_cd_incoterm.Text = 'FCA' ) then
      datm_LI_Capa.qry_li_IN_EMBUT_FRT_ITENS.AsString := '0'
    else
      datm_LI_Capa.qry_li_IN_EMBUT_FRT_ITENS.AsString := '1';
  CodExits;
end;

procedure Tfrm_LI_capa.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Deseja realmente excluir a LI ' + Copy( str_nr_processo, 5, 14 ) + '?', 1 ) then
    with datm_LI_capa do
    begin
      try
        qry_li_.Close;

        datm_main.db_broker.StartTransaction;
        CloseStoredProc( sp_li_exclui );
        sp_li_exclui.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc( sp_li_exclui );
        CloseStoredProc( sp_li_exclui );
        datm_main.db_broker.Commit;

        frm_LI.in_montada   := True;
        frm_LI.in_atualizar := True;

        btn_sairClick(nil);
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          btn_cancelarClick(nil);

          BoxMensagem( 'Operação de exclusão não foi executada com sucesso.', 2 );
        end;
      end;
    end;
end;

procedure Tfrm_LI_capa.Atualiza_Historico_Padrao;
var tx_inf_compl  : AnsiString;
{
    cTexto1       : AnsiString;
    cTexto2       : AnsiString;
    cData1        : String;
    npos          : integer;
    npos1         : integer;
    n             : integer;
    i             : Byte;}
begin
  if Not ( datm_LI_Capa.qry_li_.State in [dsEdit,dsInsert] ) then Exit;

  tx_inf_compl := '';
  {
  cTexto1      := dbmemo_info_complementares.Text;
  npos         := length( cTexto1 );
  if npos > 0 then
  begin
    cTexto2 := '';
    n := 1;
    while n <= npos do
    begin
      if Ord(cTexto1[n]) <> 0 then
        cTexto2 := cTexto2 + cTexto1[n];
      n := n + 1;
    end;
    cTexto1 := cTexto2;
  end;
  npos         := length( cTexto1 );
  while npos > 0 do
  begin
    npos  := nAt ( #13 , cTexto1 );
    if npos > 0 then
    begin
      cTexto2 := Copy ( cTexto1 , 1 , ( npos + 1 ) );
      cTexto1 := Copy ( cTexto1 , ( npos + 1 ) , ( length( cTexto1 ) - npos ) );
    end
    else
    begin
      cTexto2 := cTexto1;
      cTexto1 := '';
    end;
    if Copy ( cTexto1 , 1 , 1 ) = #10 then cTexto1 := Copy ( cTexto1 , 2 , ( length (cTexto1) - 1 ) );
    npos := length( cTexto2 );
    if npos < 25 then
       cTexto := Copy ( cTexto2 , 1, npos)
    else
       cTexto := Copy ( cTexto2 , 1, 25);
    if ( cTexto = 'CONHECIMENTO MASTER.....:' ) then
    begin
       npos1 := nAt ( 'DATA..:' , cTexto2 );
       if npos1 > 0 then
          cData1 := Copy ( cTexto2, npos1 + 7 , ( length( cTexto2 ) - npos1 - 8 ) )
       else
          cData1 := ''
    end;
    if ( cTexto <> 'FATURA COMERCIAL........:' ) and
       ( cTexto <> 'NOSSA REFERENCIA........:' ) and
       ( cTexto <> 'REF.IMPORTADOR..........:' ) and
       ( cTexto <> 'CONHECIMENTO............:' ) and
       ( cTexto <> 'CONHECIMENTO MASTER.....:' ) and
       ( cTexto <> 'PRESENCA DE CARGA.......:' ) and
       ( cTexto <> 'LOCAL DE EMBARQUE.......:' ) and
       ( cTexto <> 'VEICULO.................:' ) and
       ( cTexto <> 'DATA DA CHEGADA.........:' ) and
       ( cTexto <> 'VMLE....................:' ) and
       ( cTexto <> 'FRETE + SEGURO..........:' ) and
       ( cTexto <> 'VMLE + FRETE + SEGURO...:' ) and
       ( cTexto <> 'TAXA CAMBIAL............:' ) then
    begin
      tx_inf_compl := tx_inf_compl + cTexto2;
    end;
  end;
  if Copy(tx_inf_compl, length(tx_inf_compl)-1, 2) <> #13#10 then
     tx_inf_compl := tx_inf_compl + #13#10;
  if str_hist_fatura   <> '' then
     tx_inf_compl := tx_inf_compl + 'FATURA COMERCIAL........: ' + str_hist_fatura  + #13#10;
  if str_hist_n_ref    <> '' then
     tx_inf_compl := tx_inf_compl + 'NOSSA REFERENCIA........: ' + str_hist_n_ref   + #13#10;
  if str_hist_s_ref    <> '' then
     tx_inf_compl := tx_inf_compl + 'REF.IMPORTADOR..........: ' + str_hist_s_ref   + #13#10;
  if str_hist_conh     <> '' then
     tx_inf_compl := tx_inf_compl + 'CONHECIMENTO............: ' + str_hist_conh    + '  DATA..:' + str_hist_dt_emb + #13#10;
  if str_hist_conh_m   <> '' then
     tx_inf_compl := tx_inf_compl + 'CONHECIMENTO MASTER.....: ' + str_hist_conh_m  + '  DATA..:' + cData1 + #13#10;
  if str_hist_pcarga   <> '' then
     tx_inf_compl := tx_inf_compl + 'PRESENCA DE CARGA.......: ' + str_hist_pcarga  + #13#10;
  if str_hist_loc_emb  <> '' then
     tx_inf_compl := tx_inf_compl + 'LOCAL DE EMBARQUE.......: ' + str_hist_loc_emb + #13#10;
  if str_hist_veiculo  <> '' then
     tx_inf_compl := tx_inf_compl + 'VEICULO.................: ' + str_hist_veiculo + #13#10;
  if str_hist_dt_cheg  <> '' then
     tx_inf_compl := tx_inf_compl + 'DATA DA CHEGADA.........: ' + str_hist_dt_cheg + #13#10;
  if str_hist_vmle     <> '' then
     tx_inf_compl := tx_inf_compl + 'VMLE....................: ' + str_hist_vmle    + #13#10;
  if str_hist_fr_seg   <> '' then
     tx_inf_compl := tx_inf_compl + 'FRETE + SEGURO..........: ' + str_hist_fr_seg  + #13#10;
  if str_hist_cif      <> '' then
     tx_inf_compl := tx_inf_compl + 'VMLE + FRETE + SEGURO...: ' + str_hist_cif     + #13#10;
  for i := 1 to 10 do
  begin
    if str_hist_taxa[i]  <> '' then
      tx_inf_compl := tx_inf_compl + 'TAXA CAMBIAL............: ' + str_hist_taxa[i] + #13#10
    else
      break;
  end;
  DATM_LI_Capa.qry_li_TX_INFO_COMPL.AsString := tx_inf_compl;
  }
end;

procedure Tfrm_LI_capa.GuardaTaxaCambial;
{var str_cd_moeda :string;
    i :Integer;}
begin
  {
  with DATM_LI_Capa do
  begin
    for i:=1 to 4 do
    begin
      aMoedas[i] := '';
      aTaxas[i]  := 0;
    end;

    for i:=1 to 10 do
    begin
      str_hist_taxa[i] := '';
    end;
    str_cd_moeda := '(220)';

    aMoedas[1] := '220';
    // aTaxas[1]  := qry_li_TX_DOLAR.AsFloat;

    str_hist_taxa[1] := FFloatToMsk ( '#,###,##0.0000000', qry_li_TX_DOLAR.AsFloat ) + '(220)';
    i := (Pos(qry_li_CD_MOEDA_MLE.AsString, str_cd_moeda)+3) div 5;
    if qry_li_CD_MOEDA_MLE.AsString <> '' then
    begin
      aMoedas[2] := qry_li_CD_MOEDA_MLE.AsString;
      aTaxas[2]  := qry_li_TX_MLE.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_li_TX_MLE.AsFloat ) + '(' + qry_li_CD_MOEDA_MLE.AsString + ') VMLE';
        str_cd_moeda := str_cd_moeda + '(' + qry_li_CD_MOEDA_MLE.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' VMLE';
    end;
    i := (Pos(qry_li_CD_MOEDA_FRETE.AsString, str_cd_moeda)+3) div 5;
    if qry_li_CD_MOEDA_FRETE.AsString <> '' then
    begin
      aMoedas[3] := qry_li_CD_MOEDA_FRETE.AsString;
      aTaxas[3]  := qry_li_TX_FRETE.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_li_TX_FRETE.AsFloat ) + '(' + qry_li_CD_MOEDA_FRETE.AsString + ') FRETE';
        str_cd_moeda := str_cd_moeda + '(' + qry_li_CD_MOEDA_FRETE.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' FRETE';
    end;
    i := (Pos(qry_li_CD_MOEDA_SEGURO.AsString, str_cd_moeda)+3) div 5;
    if qry_li_CD_MOEDA_SEGURO.AsString <> '' then
    begin
      aMoedas[4] := qry_li_CD_MOEDA_SEGURO.AsString;
      aTaxas[4]  := qry_li_TX_SEGURO.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_li_TX_MLE.AsFloat ) + '(' + qry_li_CD_MOEDA_SEGURO.AsString + ') SEGURO';
        str_cd_moeda := str_cd_moeda + '(' + qry_li_CD_MOEDA_SEGURO.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' SEGURO';
    end;
    if not qry_li_IN_MOEDA_UNICA.AsBoolean then
    begin
      qry_adicao_taxa_.Close;
      qry_adicao_taxa_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_adicao_taxa_.Prepare;
      qry_adicao_taxa_.Open;
      while not qry_adicao_taxa_.EOF do
      begin
        i := (pos(qry_adicao_taxa_CD_MOEDA_MLE.AsString, str_cd_moeda)+3) div 5;
        if ( qry_adicao_taxa_CD_MOEDA_MLE.AsString <> '' ) then
        begin
          if i = 0 then
          begin
            if (((length(str_cd_moeda) div 5)+1) < 10 ) then
            begin
              str_hist_taxa[((length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_adicao_taxa_TX_MLE.AsFloat ) + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')  VMLE';
              str_cd_moeda := str_cd_moeda + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')';
            end;
          end
          else
          begin
            if pos(str_hist_taxa[i], 'VMLE') = 0 then
              str_hist_taxa[i] := str_hist_taxa[i] + ' VMLE';
          end;
        end;
        qry_adicao_taxa_.Next;
      end;
      qry_adicao_taxa_.Close;
    end;
  end;
  }
end;

function GetQtdTotalItens(const Nr_Processo: string): Double;
var
  Q: TLocalQuery;
begin
  Q := AutoQuery.Query('SELECT ROUND( ISNULL( SUM( QT_MERC_UN_ESTAT ), 0 ), 5 ) as nQtdeUnit '+
                       'FROM   TLICENCA_ITENS ( NOLOCK ) '+
                       'WHERE  NR_PROCESSO = :NR_PROCESSO');
  Q.ParamByName('NR_PROCESSO').AsString := Nr_Processo;
  Q.Open;
  Result := Q.Fields[0].AsFloat;
end;

function Tfrm_LI_capa.Grava;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    with datm_LI_Capa do
    begin
      if qry_li_.State in [dsEdit,dsInsert] then
      begin
        {
        if dbchkbox_mesma_moeda1.Checked then
        begin
          qry_li_VL_TOTAL_MLE_MN.AsFloat    := qry_li_Calc_VL_TOT_MLE_MN.AsFloat;
          qry_li_VL_TOT_DESPS_MN.AsFloat    := qry_li_Calc_VL_TOT_DESPESA_MN.AsFloat;
        end;
        qry_li_VL_TOTAL_FRETE_MN.AsFloat    := qry_li_Calc_VL_TOT_FRETE_MN.AsFloat;
        qry_li_VL_TOTAL_SEG_MN.AsFloat      := qry_li_Calc_VL_TOT_SEGURO_MN.AsFloat;

        qry_li_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );
        qry_li_IN_RISC_ATUALIZADO.AsString  := '0';

        Valores;
        GuardaTaxaCambial;
        Atualiza_Historico_Padrao;
        }
        qry_li_QT_MED_ESTATISTICA.AsFloat := GetQtdTotalItens(qry_li_NR_PROCESSO.AsString);
        qry_li_DT_PROCESSO_LI.AsDateTime := StrToDate( DateToStr( qry_li_DT_PROCESSO_LI.AsDateTime ) );
        qry_li_.Post;

        frm_LI.in_abertura := False;

        datm_main.db_broker.Commit;
      end;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;

procedure Tfrm_LI_capa.pgctrl_capa_liChange(Sender: TObject);
begin
  //
end;

procedure Tfrm_LI_capa.pgctrl_capa_liChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

function Tfrm_LI_capa.Consiste: Boolean;
begin
  if Trim( datm_LI_Capa.qry_li_NR_REGISTRO_LI.AsString ) <> '' then
  begin
    Consiste := True;
    Exit;
  end;

  if datm_LI_Capa.qry_li_.State in [dsInsert, dsEdit] then
  begin
    {Importador}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_importador.Text = '' then
      begin
        BoxMensagem('Campo Importador deve ser preenchido!', 2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_importador.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_importador );
    if dbedt_cd_importador.Text <> '' then
    begin
      if ( dbedt_nm_importador.Text = '' ) then
      begin
        BoxMensagem('Código do Importador inválido ou inativo!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_importador.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {País de Procedência}
    ValidCodigo( dbedt_cd_pais_proc );
    if dbedt_cd_pais_proc.Text <> '' then
    begin
      if ( dbedt_nm_pais_proc.Text = '' ) then
      begin
        BoxMensagem('Código do País de Procedência inválido!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_pais_proc.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {URF de Despacho}
    ValidCodigo( dbedt_cd_urf_despacho );
    if dbedt_cd_urf_despacho.Text <> '' then
    begin
      if ( dbedt_nm_urf_despacho.Text = '' ) then
      begin
        BoxMensagem('Código da URF de Despacho inválido!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_urf_despacho.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {URF de Entrada}
    ValidCodigo( dbedt_cd_urf_entrada );
    if dbedt_cd_urf_entrada.Text <> '' then
    begin
      if ( dbedt_nm_urf_entrada.Text = '' ) then
      begin
        BoxMensagem('Código da URF de Entrada inválido!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_urf_entrada.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Incoterm}
    ValidCodigo( dbedt_cd_incoterm );
    if dbedt_cd_incoterm.Text <> '' then
    begin
      if ( dbedt_nm_incoterm.Text = '' ) then
      begin
        BoxMensagem('Código do Incoterm inválido!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_incoterm.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Moeda FOB}
    {ValidCodigo( dbedt_cd_moeda_fob );
    if dbedt_cd_moeda_fob.Text <> '' then
    begin
      if ( dbedt_nm_moeda_fob.Text = '' ) then
      begin
        BoxMensagem('Código da Moeda inválido!',2);
        pgctrl_capa_li.ActivePage := ts_basicas;
        dbedt_cd_moeda_fob.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    }
    {Regime Tributação}
    ValidCodigo( dbedt_cd_reg_trib );
    if dbedt_cd_reg_trib.Text <> '' then
    begin
      if ( dbedt_nm_reg_trib.Text = '' ) then
      begin
        BoxMensagem('Código do Regime de Tributação inválido!',2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_reg_trib.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Fundamento Legal}
    datm_LI_Capa.qry_fund_legal_.Close;
    datm_LI_Capa.qry_fund_legal_.ParamByName('CD_REGIME_TRIB').AsString := dbedt_cd_reg_trib.Text;
    datm_LI_Capa.qry_fund_legal_.Prepare;
    datm_LI_Capa.qry_fund_legal_.Open;

    ValidCodigo( dbedt_cd_fund_legal );
    if dbedt_cd_fund_legal.Text <> '' then
    begin
      if ( dbedt_nm_fund_legal.Text = '' ) then
      begin
        BoxMensagem('Código do Fundamento Legal inválido!',2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_fund_legal.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Agência SECEX}
    {Marcio
    ValidCodigo( dbedt_cd_agencia_secex );
    if dbedt_cd_agencia_secex.Text <> '' then
    begin
      if ( dbedt_nm_agencia_secex.Text = '' ) then
      begin
        BoxMensagem('Código da Agência SECEX inválido!',2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_agencia_secex.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    }
    {Acordo ALADI}
    ValidCodigo( dbedt_cd_acordo_aladi );
    if dbedt_cd_acordo_aladi.Text <> '' then
    begin
      if ( dbedt_nm_acordo_aladi.Text = '' ) then
      begin
        BoxMensagem('Código da acordo ALADI inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_acordo_aladi.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Modalidade de Pagamento}
    ValidCodigo( dbedt_cd_modalidade_pag );
    if dbedt_cd_modalidade_pag.Text <> '' then
    begin
      if ( dbedt_nm_modalidade_pag.Text = '' ) then
      begin
        BoxMensagem('Código da Modalidade de Pagamento inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_modalidade_pag.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Instituição Financeira}
    ValidCodigo( dbedt_cd_instituicao_financ );
    if dbedt_cd_instituicao_financ.Text <> '' then
    begin
      if ( dbedt_nm_instituicao_financ.Text = '' ) then
      begin
        BoxMensagem('Código da Instituição Financeira inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_instituicao_financ.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Motivo sem Cobertura}
    ValidCodigo( dbedt_cd_mot_sem_cobert );
    if dbedt_cd_mot_sem_cobert.Text <> '' then
    begin
      if ( dbedt_nm_mot_sem_cobert.Text = '' ) then
      begin
        BoxMensagem('Código do Motivo sem Cobertura inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_negociacao;
        dbedt_cd_mot_sem_cobert.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Moeda MLE}
    ValidCodigo( dbedt_cd_moeda_mle );
    if dbedt_cd_moeda_mle.Text <> '' then
    begin
      if ( dbedt_nm_moeda_mle.Text = '' ) then
      begin
        BoxMensagem('Código da Moeda no Local de Embarque inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_totais;
        dbedt_cd_moeda_mle.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Moeda Frete}
    ValidCodigo( dbedt_cd_moeda_frete );
    if dbedt_cd_moeda_frete.Text <> '' then
    begin
      if ( dbedt_nm_moeda_frete.Text = '' ) then
      begin
        BoxMensagem('Código da Moeda do Frete inválido!', 2);
        pgctrl_capa_li.ActivePage := ts_totais;
        dbedt_cd_moeda_frete.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

  end;
  Consiste := True;
end;

procedure Tfrm_LI_capa.Valores;
begin
  {
  with DATM_LI_Capa do
  begin
    dbl_vmle_mn      := qry_li_VL_TOTAL_MLE_MN.AsFloat +
                        qry_li_VL_TOT_DESPS_MN.AsFloat;
    if qry_li_CD_MOEDA_MLE.AsString = '220' then
      dbl_vmle_mneg  := qry_li_VL_TOT_MLE_MNEG.AsFloat +
                        qry_li_VL_TOT_DESPS_MNEG.AsFloat
    else
    begin
      if qry_li_TX_DOLAR.AsFloat <> 0 then
        dbl_vmle_mneg   := dbl_vmle_mn / qry_li_TX_DOLAR.AsFloat
      else
        dbl_vmle_mneg   := 0
    end;

    dbl_fr_seg_mn     := qry_li_VL_TOTAL_FRETE_MN.AsFloat +
                         qry_li_VL_TOTAL_SEG_MN.AsFloat;
    if qry_li_CD_MOEDA_FRETE.AsString = '220' then
    begin
      dbl_fr_seg_mneg := qry_li_VL_TOT_FRT_COLLECT.AsFloat +
                         qry_li_VL_TOT_FRT_PREPAID.AsFloat -
                         qry_li_VL_FRETE_TNAC_MNEG.AsFloat;
      if qry_li_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_li_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_li_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               (qry_li_VL_TOTAL_SEG_MN.AsFloat / qry_li_TX_DOLAR.AsFloat)
    end
    else
    begin
      if qry_li_TX_DOLAR.AsFloat <> 0 then
         dbl_fr_seg_mneg := (qry_li_VL_TOTAL_FRETE_MN.AsFloat / qry_li_TX_DOLAR.AsFloat)
      else
         dbl_fr_seg_mneg := 0;
      if qry_li_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_li_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_li_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               (qry_li_VL_TOTAL_SEG_MN.AsFloat / qry_li_TX_DOLAR.AsFloat)
    end;
  end;

  dbl_cif_mn   := dbl_vmle_mn   + dbl_fr_seg_mn;
  dbl_cif_mneg := dbl_vmle_mneg + dbl_fr_seg_mneg;

  str_hist_vmle   := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg ) +
                     '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn );
  str_hist_fr_seg := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mneg ) +
                     '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mn );
  str_hist_cif    := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mneg ) +
                     '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mn );
  }
end;

procedure Tfrm_LI_capa.AtzTaxaCambialDI( Moeda : String; Campo : TFloatField );
var
  i : Integer;
  TaxaOk : Boolean;
begin
  TaxaOk := False;
  for i := 1 to 4 do {Tenta localizar taxa dentre as moedas utilizadas no processo}
  begin
    if Moeda = aMoedas[i] then
    begin
      Campo.AsFloat := aTaxas[i];
      TaxaOk := True;
    end;
  end;
  if Not TaxaOk then {Tenta localizar taxa no Histórico de Taxas de Câmbio no dia do Registro da DI}
  begin
    with datm_LI_Capa do
    begin
      {
      qry_taxa_cambio_.Close;
      qry_taxa_cambio_.ParamByName('CD_MOEDA').AsString  := Moeda;
      qry_taxa_cambio_.ParamByName('DT_REGISTRO').AsDate :=
         StrToDate( Copy( qry_li_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
                    Copy( qry_li_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
                    Copy( qry_li_DT_REGISTRO_DI.AsString, 5, 4) );
      qry_taxa_cambio_.Prepare;
      qry_taxa_cambio_.Open;
      if qry_taxa_cambio_.RecordCount > 0 then
         Campo.AsFloat := qry_taxa_cambio_TX_CAMBIO.AsFloat
      else
      begin
        Campo.AsFloat := 0;
        BoxMensagem('Taxa de Câmbio para moeda ' + Moeda + ' não cadastrada em ' +
           Copy( qry_li_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
           Copy( qry_li_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
           Copy( qry_li_DT_REGISTRO_DI.AsString, 5, 4) + '!', 2);
      end;
      qry_taxa_cambio_.Close;
      }
    end;
  end;
end;

procedure Tfrm_LI_capa.btn_co_incotermClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA','Incoterms',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_incoterm.Text := ConsultaLookUP('TINCOTERMS_VENDA','CODIGO',dbedt_cd_incoterm.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.btn_co_moedaClick(Sender: TObject);
begin
{  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_MOEDA_FOB.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda);
  End
  else
    dbedt_nm_moeda_fob.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_fob.Text,'NM_MOEDA');
}
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_fobExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_co_importadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_capa.qry_LI_CD_IMPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Empresa',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_est);
  End
  else
    dbedt_nm_importador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_importador.Text,'NM_EMPRESA');
end;

procedure Tfrm_LI_capa.btn_co_pais_procClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_PAIS_PROCEDENCIA .AsString := ConsultaOnLineEx('TPAIS','País',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_pais);
  End
  else
    dbedt_nm_pais_proc.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_proc.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.dbedt_cd_pais_procExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_co_reg_tribClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_REGIME_TRIBUTACAO.AsString := ConsultaOnLineEx('TREG_TRIBUTARIO','Regime Tributário',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_reg_trib.Text := ConsultaLookUP('TREG_TRIBUTARIO','CODIGO',dbedt_cd_reg_trib.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.btn_co_fund_legalClick(Sender: TObject);
begin
  If datm_LI_capa.qry_li_CD_REGIME_TRIBUTACAO.AsString <> '' Then
  Begin
    If Sender is TSpeedButton Then
    Begin
      if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
      datm_LI_capa.qry_li_CD_FUND_LEGAL.AsString := ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO FROM TFUND_LEG_REG_TRIBUT WHERE CODIGO IN ( SELECT CD_FUND_LEGAL FROM TTP_FUND_LEGAL T WHERE CD_REGIME_TRIB = "' + dbedt_cd_reg_trib.Text + '")','Fundamento Legal',['CODIGO','DESCRICAO'],['Codigo','Descrição'],'CODIGO',nil);
    End
    Else
      dbedt_nm_fund_legal.Text := ConsultaLookUP('TFUND_LEG_REG_TRIBUT','CODIGO',dbedt_cd_fund_legal.Text,'DESCRICAO');
  End;
end;

procedure Tfrm_LI_capa.btn_co_motivoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_capa.qry_li_CD_MOT_SEM_COBERTURA.AsString := ConsultaOnLineEx('TMOT_SEM_COBERT_CAMBIAL','Motivo Sem Cobertura Cambial',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_mot_sem_cobert.Text := ConsultaLookUP('TMOT_SEM_COBERT_CAMBIAL','CODIGO',dbedt_cd_mot_sem_cobert.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.dbedt_cd_reg_tribExit(Sender: TObject);
begin
  if dbedt_cd_reg_trib.Text <> '' then
  begin
    ValidaRegime( StrToInt( dbedt_cd_reg_trib.Text ) );
  end;
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_fund_legalExit(Sender: TObject);
begin
{Marcio
  if ( ( datm_LI_Capa.qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '3' ) or
       ( datm_LI_Capa.qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '5' ) ) and
     ( datm_LI_Capa.qry_li_.FieldByName('CD_FUND_LEGAL').AsString = '16' ) then
  begin
    dbedt_cd_agencia_secex.Enabled  := True;
    dbedt_cd_agencia_secex.Color    := clWindow;
    dbedt_cd_agencia_secex.ReadOnly := False;

    dbedt_cd_numero_ato.Enabled     := True;
    dbedt_cd_numero_ato.Color       := clWindow;
    dbedt_cd_numero_ato.ReadOnly    := False;
  end
  else
  begin
    dbedt_cd_agencia_secex.Enabled  := False;
    dbedt_cd_agencia_secex.Color    := clMenu;
    dbedt_cd_agencia_secex.ReadOnly := True;

    dbedt_cd_numero_ato.Enabled     := False;
    dbedt_cd_numero_ato.Color       := clMenu;
    dbedt_cd_numero_ato.ReadOnly    := True;
    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_AGENCIA_SECEX').AsString := '';
      datm_LI_Capa.qry_li_.FieldByName('NR_ATO_DRAWBACK').AsString  := '';
    end;
  end;
  CodExits;
  }
end;

procedure Tfrm_LI_capa.dbedt_cd_modalidade_pagExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_mot_sem_cobertExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dblkcbox_acordo_tarifExit(Sender: TObject);
begin
  if datm_LI_Capa.qry_li_.State in [dsInsert, dsEdit] then
  begin
    if datm_li_capa.qry_li_TP_ACORDO_ALADI.AsString <> '2' then
    begin
      lbl_Acordo.Enabled             := False;
      dbedt_cd_acordo_aladi.Enabled  := False;
      dbedt_cd_acordo_aladi.Color    := clMenu;
      dbedt_cd_acordo_aladi.ReadOnly := True;
      btn_co_acordo.Enabled          := False;
      datm_LI_Capa.qry_li_.FieldByName('CD_ACORDO_ALADI').AsString := '';
      if pgctrl_capa_li.ActivePage = ts_negociacao then dbrg_cobertura_cambial.SetFocus
    end
    else
    begin
      lbl_Acordo.Enabled             := True;
      dbedt_cd_acordo_aladi.Enabled  := True;
      dbedt_cd_acordo_aladi.Color    := clWindow;
      dbedt_cd_acordo_aladi.ReadOnly := False;
      btn_co_acordo.Enabled          := True;

      if pgctrl_capa_li.ActivePage = ts_negociacao then dbedt_cd_acordo_aladi.SetFocus
    end;
  end;
end;

procedure Tfrm_LI_capa.btn_co_agencia_secexClick(Sender: TObject);
begin
{Marcio
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_capa.qry_li_CD_AGENCIA_SECEX.AsString := ConsultaOnLineEx('TAB_AGENCIA_SECEX','Agência Secex',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_agencia_secex.Text := ConsultaLookUP('TAB_AGENCIA_SECEX','CODIGO',dbedt_cd_agencia_secex.Text,'DESCRICAO');
}
end;

procedure Tfrm_LI_capa.dbedt_cd_agencia_secexExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Capa.Cancelar;
begin
  with datm_LI_Capa do
  begin
    if qry_li_.State       in [dsEdit,dsInsert] then qry_li_.Cancel;
    if qry_anuentes_.State in [dsEdit,dsInsert] then qry_anuentes_.Cancel;

    frm_LI.in_abertura := False;

    FormShow(nil);
  end;
end;

procedure Tfrm_LI_Capa.ValidaRegime( nControla : Byte );
begin
  {Fundamento Legal}
  if nControla in [1] then
  begin
    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_FUND_LEGAL').AsString    := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_AGENCIA_SECEX').AsString := '';
      datm_LI_Capa.qry_li_.FieldByName('NR_ATO_DRAWBACK').AsString  := '';
    end;

    btn_co_fund_legal.Enabled       := False;
//Marcio    btn_co_agencia_secex.Enabled    := False;

    dbedt_cd_fund_legal.Enabled     := False;
    dbedt_cd_fund_legal.Color       := clMenu;
    dbedt_cd_fund_legal.ReadOnly    := True;
{Marcio
    dbedt_cd_agencia_secex.Enabled  := False;
    dbedt_cd_agencia_secex.Color    := clMenu;
    dbedt_cd_agencia_secex.Readonly := True;

    dbedt_cd_numero_ato.Enabled     := False;
    dbedt_cd_numero_ato.Color       := clMenu;
    dbedt_cd_numero_ato.Readonly    := True;
}    
  end;

  if nControla in [2..6] then
  begin
    btn_co_fund_legal.Enabled      := True;

    dbedt_cd_fund_legal.Enabled    := True;
    dbedt_cd_fund_legal.Color      := clWindow;
    dbedt_cd_fund_legal.ReadOnly   := False;

    if pgctrl_capa_li.ActivePage = ts_negociacao then
      dbedt_cd_fund_legal.SetFocus;
  end;

  {Acordo}
  if nControla in [2,3,6] then
  begin
    lbl_tipo.Enabled               := False;
    lbl_acordo.Enabled             := False;

    btn_co_acordo.Enabled          := False;

    dblkcbox_acordo_tarif.Enabled  := False;
    dblkcbox_acordo_tarif.Color    := clMenu;
    dblkcbox_acordo_tarif.ReadOnly := True;

    dbedt_cd_acordo_aladi.Enabled  := False;
    dbedt_cd_acordo_aladi.Color    := clMenu;
    dbedt_cd_acordo_aladi.ReadOnly := True;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('TP_ACORDO_ALADI').AsString  := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_ACORDO_ALADI').AsString  := '';
    end;

    if pgctrl_capa_li.ActivePage = ts_negociacao then
      dbedt_cd_fund_legal.SetFocus;
  end
  else
  begin
    lbl_tipo.Enabled               := True;
    lbl_acordo.Enabled             := True;

    btn_co_acordo.Enabled          := True;
    
    dblkcbox_acordo_tarif.Enabled  := True;
    dblkcbox_acordo_tarif.Color    := clWindow;
    dblkcbox_acordo_tarif.ReadOnly := False;

    dbedt_cd_acordo_aladi.Enabled  := True;
    dbedt_cd_acordo_aladi.Color    := clWindow;
    dbedt_cd_acordo_aladi.ReadOnly := False;

    if pgctrl_capa_li.ActivePage = ts_negociacao then
      dblkcbox_acordo_tarif.SetFocus;
  end;
end;

procedure Tfrm_LI_capa.btn_co_acordoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_capa.qry_li_CD_ACORDO_ALADI.AsString := ConsultaOnLineEx('TAB_ALADI','Acordo Aladi',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_acordo_aladi.Text := ConsultaLookUP('TAB_ALADI','CODIGO',dbedt_cd_acordo_aladi.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.dblkcbox_acordo_tarifEnter(Sender: TObject);
begin
  lbl_Acordo.Enabled            := True;
  dbedt_cd_acordo_aladi.Enabled := True;
  btn_co_acordo.Enabled         := True;
end;

procedure Tfrm_LI_capa.rdgrp_condicaoClick(Sender: TObject);
begin
  datm_LI_Capa.qry_li_.Edit;
end;

procedure Tfrm_LI_capa.dbedt_cd_acordo_aladiExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_urf_entradaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.ChamaValidCambio( nTipo : Integer );
  procedure HabilitaModalidadePagamento(Value: Boolean);
  begin
    lbl_modalidade.Enabled := Value;
    dbedt_cd_modalidade_pag.Enabled := Value;
    dbedt_nm_modalidade_pag.Enabled := Value;
    btn_co_modalidade.Enabled := Value;
  end;
  procedure HabilitaQtdDiasPagar(Value: Boolean);
  begin
    lbl_qtde.Enabled := Value;
    dbedt_qtde_dias_pag.Enabled := Value;
  end;
  procedure HabilitarInstituicaoFianceira(Value: Boolean);
  begin
    lbl_instituicao.Enabled := Value;
    dbedt_cd_instituicao_financ.Enabled := Value;
    dbedt_nm_instituicao_financ.Enabled := Value;
    btn_co_instituicao.Enabled := Value;
  end;
  procedure HabilitaMotivo(Value: Boolean);
  begin
    lbl_motivo.Enabled := Value;
    dbedt_cd_mot_sem_cobert.Enabled := Value;
    dbedt_nm_mot_sem_cobert.Enabled := Value;
    btn_co_motivo.Enabled := Value;
  end;
begin
  HabilitaModalidadePagamento(False);
  HabilitaQtdDiasPagar(False);
  HabilitarInstituicaoFianceira(False);
  HabilitaMotivo(False);
  case nTipo of
    0:
    begin
      HabilitaModalidadePagamento(True);
      HabilitaQtdDiasPagar(True);
      if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
      begin
        datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').Clear;
        datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').Clear;
      end;
    end;
    1:
    begin
      HabilitaModalidadePagamento(True);
      if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
      begin
        datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').Clear;
        datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').Clear;
        datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').Clear;
      end;
    end;
    2:
    begin
      HabilitarInstituicaoFianceira(True);
      if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
      begin
        datm_LI_Capa.qry_li_.FieldByName('CD_MOD_PAGAMENTO').Clear;
        datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').Clear;
        datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').Clear;
      end;
    end;
    3:
    begin
      HabilitaMotivo(True);
      if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
      begin
        datm_LI_Capa.qry_li_.FieldByName('CD_MOD_PAGAMENTO').Clear;
        datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').Clear;
        datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').Clear;
      end;
    end;
  end;
end;

procedure Tfrm_LI_capa.dbrg_cobertura_cambialClick(Sender: TObject);
begin
  ChamaValidCambio( dbrg_cobertura_cambial.ItemIndex );
end;

function Tfrm_LI_capa.VerAlt;
begin
  VerAlt := True;

  if ( ( datm_LI_Capa.qry_li_.State in [dsEdit] ) {and st_modificar} ) or
      ( datm_LI_Capa.qry_li_.State in [dsInsert] ) then
  begin
    if BoxMensagem('A Capa da LI foi alterada.' + #13#10 +
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

procedure Tfrm_LI_capa.dbedt_cd_importadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_importador         then btn_co_importadorClick(btn_co_importador);
    if Sender = dbedt_cd_pais_proc          then btn_co_pais_procClick(btn_co_pais_proc);
    if Sender = dbedt_cd_urf_despacho       then btn_co_urf_despachoClick(btn_co_urf_despacho);
    if Sender = dbedt_cd_urf_entrada        then btn_co_urf_entradaClick(btn_co_urf_entrada);
    if Sender = dbedt_cd_incoterm           then btn_co_incotermClick(btn_co_incoterm);
    //if Sender = dbedt_cd_moeda_fob          then btn_co_moedaClick(btn_co_moeda);
    if Sender = dbedt_cd_reg_trib           then btn_co_reg_tribClick(btn_co_reg_trib);
    if Sender = dbedt_cd_fund_legal         then btn_co_fund_legalClick(btn_co_fund_legal);
    //if Sender = dbedt_cd_agencia_secex      then btn_co_agencia_secexClick(btn_co_agencia_secex);
    if Sender = dbedt_cd_acordo_aladi       then btn_co_acordoClick(btn_co_acordo);
    if Sender = dbedt_cd_modalidade_pag     then btn_co_modalidadeClick(btn_co_modalidade);
    if Sender = dbedt_cd_mot_sem_cobert     then btn_co_motivoClick(btn_co_motivo);
    if Sender = dbedt_cd_moeda_mle          then btn_co_moeda_mleClick(btn_co_moeda_mle);
    if Sender = dbedt_cd_moeda_frete        then btn_co_moeda_freteClick(btn_co_moeda_frete);
    if Sender = dbmemo_info_complementares  then btn_co_obsClick(btn_co_obs);
  end;
end;

procedure Tfrm_LI_capa.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_LI_capa.btn_co_urf_despachoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_URF_DESPACHO.AsString := ConsultaOnLineEx('TURF','Unidade da Receita Federal de Despacho',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_urf);
  End
  else
    dbedt_nm_urf_despacho.Text := ConsultaLookUP('TURF','CODIGO',dbedt_cd_urf_despacho.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.btn_co_modalidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_MOD_PAGAMENTO.AsString := ConsultaOnLineEx('TMODALID_PAGAMENTO','Modalidade de Pagamento',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_modalidade_pag.Text := ConsultaLookUP('TMODALID_PAGAMENTO','CODIGO',dbedt_cd_modalidade_pag.Text,'DESCRICAO');
end;

procedure Tfrm_LI_capa.btn_co_moeda_mleClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda);
  End
  else
    dbedt_nm_moeda_mle.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_mle.Text,'NM_MOEDA');
end;

procedure Tfrm_LI_capa.btn_co_moeda_freteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    if not PoeEmEdicao(datm_LI_capa.qry_LI_) then exit;
    datm_LI_Capa.qry_li_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda);
  End
  else
    dbedt_nm_moeda_frete.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete.Text,'NM_MOEDA');
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_mleExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_freteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbgrd_refKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( ssShift in Shift ) and ( Key = 9 ) and ( pgctrl_capa_li.ActivePage = ts_basicas ) then
     pgctrl_capa_li.SetFocus
  else
  if ( Key = 9 ) and ( pgctrl_capa_li.ActivePage = ts_basicas ) then
     dbedt_dt_li.SetFocus;
end;

procedure Tfrm_LI_capa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure Tfrm_LI_capa.Valida_Valores(Sender: TObject);
begin
  {
  If datm_LI_Capa.qry_li_.State in [dsEdit,dsInsert] then
  begin
    datm_LI_Capa.qry_li_QT_MED_ESTATISTICA.AsFloat := Arredondar( datm_LI_Capa.qry_li_QT_MED_ESTATISTICA.AsFloat, 5 );
    datm_LI_Capa.qry_li_QT_TOTAL_PES_LIQ.AsFloat   := Arredondar( datm_LI_Capa.qry_li_QT_TOTAL_PES_LIQ.AsFloat, 5 );
    datm_LI_Capa.qry_li_VL_TOTAL_MOEDA.AsFloat     := Arredondar( datm_LI_Capa.qry_li_VL_TOTAL_MOEDA.AsFloat, 2 );
    datm_LI_Capa.qry_li_VL_DESPESA_MOEDA.AsFloat   := Arredondar( datm_LI_Capa.qry_li_VL_DESPESA_MOEDA.AsFloat, 2 );
    datm_LI_Capa.qry_li_VL_DESCONTO_MOEDA.AsFloat  := Arredondar( datm_LI_Capa.qry_li_VL_DESCONTO_MOEDA.AsFloat, 2 );
    datm_LI_Capa.qry_li_VL_FRETE_MOEDA.AsFloat     := Arredondar( datm_LI_Capa.qry_li_VL_FRETE_MOEDA.AsFloat, 2 );
  end;
  }
end;

procedure Tfrm_LI_capa.btn_calcularClick(Sender: TObject);
var
  nNum, Code : Integer;
begin
  with datm_LI_Capa do
  begin
    Val( qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

    if ( qry_li_QT_TOTAL_ITEM.IsNull) or ( nNum = 0) then
    begin
      BoxMensagem( 'LI não possui itens !', 3 );
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;

      if qry_li_.State in [dsInsert, dsEdit] then qry_li_.Post;

      CloseStoredProc( sp_li_calculo );
      sp_li_calculo.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc( sp_li_calculo );
      case sp_li_calculo.ParamByName('Result').AsInteger of
        1: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             BoxMensagem( 'Valor Total da Mercadoria é diferente!', 2 );
             Exit;
           end;
        2: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                BoxMensagem( 'Total do Peso Liquido é diferente !', 2 );
             Exit;
           end;
        3: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                BoxMensagem( 'Total da Quantidade é diferente!', 2 );
             Exit;
           end;
        4: begin
              BoxMensagem( 'Valor do frete maior que o valor da mercadoria.', 2 );
           end;
      end;

        CloseStoredProc( sp_li_calculo );
        datm_main.db_broker.Commit;

        BoxMensagem( 'Cálculo concluído com sucesso!' , 3);

        qry_li_.Close;
        qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_li_.Prepare;
        qry_li_.Open;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_LI_capa.dbedt_cd_instituicao_financExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_LI_capa.NewWebBrowserRegistraLI: Tfrm_Web;
begin
  Application.CreateForm(Tfrm_Web, Result);
  Result.WindowState := wsNormal;
  Result.OnDocumentComplete  := WebDocumentCompleteRegistraLI;
  Result.OnBeginDownloadFile := WebDocumentBeginDownloadRegistraLI;
  Result.OnEndDownloadFile   := WebDocumentEndDownloadRegistraLI;
  FStatusBrowser := True;
end;

procedure Tfrm_LI_capa.WebDocumentCompleteRegistraLI(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  tabela_linha_li: OleVariant;
  DataLI: String;
begin
  with frm_Web do
  begin
    if AnsiContainsText(URL, 'login_cert.jsp') then
      Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
    else if AnsiContainsText(URL, 'private_siscomeximpweb_inicio.do') then
    begin
      Navegar(URL_Imp + 'li_web-7/liweb_menu_consultar_solicitacoes.do');
      NrLI := '';
    end
    else if AnsiContainsText(URL, URL_Imp + 'li_web-7/liweb_menu_consultar_solicitacoes.do') then
    begin
      //if BoxMensagem('Deseja salvar o Extrato desta LI?', 1) then
      //  Navegar('https://www4c.receita.fazenda.gov.br/li_web-7/liweb_menu_imprimir_li_filtro.do')
      OleDocument.getElementById('identificacao').value := db_lbl_ident_siscomex.Caption;
      OleDocument.getElementById('enviar').click();
    end
    else
    if AnsiContainsText(URL, URL_Imp + 'li_web-7/liweb_diagnostico_li.do') then
    begin
      Application.ProcessMessages;
      tabela_linha_li  := OleDocument.getElementById('TABLE_2').getElementsByTagName('tbody').item(0);
      NrLI             := trim(tabela_linha_li.getElementsByTagName('tr').item(2).getElementsByTagName('th').item(1).textContent);
      DataLI           := trim(tabela_linha_li.getElementsByTagName('tr').item(3).getElementsByTagName('th').item(1).textContent);
      NrLI             := StringReplace(StringReplace(NrLI, '/', '', []), '-', '', []);

      with datm_li_capa, datm_li_capa.SqlAuxiliar do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TLICENCA_IMPORTACAO SET NR_REGISTRO_LI = ''' + NrLI + ''', DT_REGISTRO_LI = CONVERT(DATETIME, ''' + DataLI + ''', 103), CD_USUARIO_REGISTRO = ''' + str_cd_usuario + ''' WHERE NR_PROCESSO = :PROCESSO');
        ParamByName('PROCESSO').AsString := qry_li_NR_PROCESSO.AsString;
        ExecSQL;
      end;
      ShowMessage('ATENÇÃO: Informações de capa recuperadas com sucesso!'#13'Você receberá um email quando todas as informações forem recuperadas.');
      if BoxMensagem('Deseja salvar o Extrato desta LI?', 1) then
        Navegar(URL_Imp + 'li_web-7/liweb_menu_imprimir_li_filtro.do')
    end
    else if AnsiContainsText(URL, URL_Imp + 'li_web-7/liweb_menu_imprimir_li_filtro.do') then
    begin
      OleDocument.getElementById('numeroLI').value := NrLI;
      OleDocument.getElementById('enviar').click();
      //frm_Web.DownloadEnabled := True;
    end
    else if AnsiContainsText(URL, URL_Imp + 'li_web-7/liweb_imprimir_filtro_li.do') then
    begin
    //  OleDocument.getElementById('itensSelecionados').checked  := True;
      ExecutaScript('document.getElementsByName("itensSelecionados")[0].checked = true;');    
      OleDocument.getElementById('imprimir').click();
      frm_Web.DownloadEnabled := True;
    end;
  end;
end;

procedure Tfrm_LI_capa.WebDocumentBeginDownloadRegistraLI(Sender: TObject; var AFileName: TFileName);
begin
  if AnsiContainsText(frm_Web.GetPageName, 'liweb_menu_imprimir_li_filtro.do') then
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Downloads\') then
      ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Downloads\');
    AFileName := ExtractFilePath(Application.ExeName)  + 'Downloads\LI_' + Trim(datm_li_capa.qry_li_NR_PROCESSO.AsString) + '.pdf';
    if FileExists(AFileName) then
      DeleteFile(AFileName);
  end;
end;

procedure Tfrm_LI_capa.WebDocumentEndDownloadRegistraLI(Sender: TObject; AFileName: TFileName);
begin
  if AnsiContainsText(frm_Web.GetPageName, 'liweb_menu_imprimir_li_filtro.do') then
  begin
    frm_Web.DownloadEnabled := False;
    GravaExtratoLI;
  end;
end;

procedure Tfrm_LI_capa.ExecutaRegistraLI;
begin
  frm_web := NewWebBrowserRegistraLI;
  with frm_Web do
  begin
    WebBrowser1.Silent := False;
    Navegar(URL_imp +  'siscomexImpweb-7/inicio.html');
  end;
end;

procedure Tfrm_LI_capa.btn_registra_liClick(Sender: TObject);
begin
  if Trim(db_lbl_ident_siscomex.Caption) <> '' then
  begin
    ExecutaRegistraLI;
    QueryExec('UPDATE TPROCESSO_LI SET IN_FILA_RECUPERAR = ''1'' WHERE NR_PROCESSO = '+
      QuotedStr(Copy(str_nr_processo, 1, 16)) + ' AND NR_LI = '+ QuotedStr(NrLI));
  end;
end;

function Tfrm_LI_capa.GetNomeArquivo(AProcesso, APathDig, APrefixo: String): String;
var
  A: Integer;
  S, N: String;
begin
  with datm_li_capa.SqlAuxiliar do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT ISNULL(MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, :NM_PREFIXO )), 0) ' +
                    ' FROM TPROCESSO_DOCTOS ' +
                    ' WHERE NR_PROCESSO = :NR_PROCESSO' +
                    '   AND ID_TABELA = :ID_TABELA' +
                    '   AND NM_ARQUIVO LIKE :NM_PREFIXO');
    ParamByName('NR_PROCESSO').AsString := AProcesso;
    ParamByName('ID_TABELA').AsString := ID_TABELA;
    ParamByName('NM_PREFIXO').AsString := APrefixo;
    Open;
    try
      First;
      if Eof then
        A := 0
      else
      begin
        S := Fields[0].AsString;
        N := S;
        A := StrToInt(N);
      end;
      Close;
    finally
      Free;
    end;
  end;
  repeat
    Inc(A);
    Result := APrefixo + FormatFloat('00', A);
  until not FileExists(APathDig + Result + '.pdf');
  Result := AnsiUpperCase(Result + '.pdf');
end;

function Tfrm_LI_capa.DigitalizaDocumento(AProcesso, ADocumento, ATipoDocumento, ADescricao: String): Boolean;
var
  APath, Prefixo, AArquivoDestino: String;
begin
  AProcesso := LeftStr(Trim(AProcesso), Length(Trim(AProcesso)) - 4);
  APath := Trim(ConsultaLookUPSQL('SELECT DBO.FN_PATH_DIGITALIZACAO(:NR_PROCESSO, :IN_LOCAL) PATH', 'PATH', [AProcesso, '1']));
  if Copy(APath, Length(APath), 1) <> '\' then
    APath := APath + '\';
  Result := DirectoryExists(APath);
  if Result then
  begin
    APath := APath + 'TPROCESSO\' + AProcesso + '\';
    Prefixo := Trim(ConsultaLookUPSQL(' SELECT NM_PREFIXO_ARQ FROM TTP_DOCTO_DIGITALIZADO WHERE ID_TABELA = :ID_TABELA AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO', 'NM_PREFIXO_ARQ', [ID_TABELA, ATipoDocumento]));
    if Pos('\', ADocumento) = 0 then
      ADocumento := APath + 'TPROCESSO\' + AProcesso + '\' + ADocumento;
    Result := FileExists(ADocumento);
    if Result then
    begin
      AArquivoDestino := APath + GetNomeArquivo(AProcesso, APath, Prefixo);
      if MoveFile(ADocumento, AArquivoDestino) then
        FastExecSQL(' INSERT INTO TPROCESSO_DOCTOS (NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, ID_TABELA) ' +
                    ' VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :ID_TABELA) ',
                    [AProcesso, ATipoDocumento, ADescricao, ExtractFileName(AArquivoDestino), str_cd_usuario, ID_TABELA])
      else
        Result := False;
    end;
  end;
end;


function Tfrm_LI_capa.TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
begin
  if AIncluirInativos then
    Result := ConsultaLookUPSQL('SELECT COUNT(*) CONTADOR ' +
                          'FROM TPROCESSO_DOCTOS ' +
                          'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                          '  AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO', 'CONTADOR', [AProcesso, ATipoDocumento]) > '0'
  else
    Result := ConsultaLookUPSQL('SELECT COUNT(*) CONTADOR ' +
                          'FROM TPROCESSO_DOCTOS ' +
                          'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                          '  AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO ' +
                          '  AND IN_ATIVO = :IN_ATIVO', 'CONTADOR', [AProcesso, ATipoDocumento, '1']) > '0';
end;

function Tfrm_LI_capa.GravaExtratoLI: Boolean;
begin
  Result := True;
  with datm_main.db_broker, datm_li_capa  do
  begin
    StartTransaction;
    begin
      try
        if TemDocumento(qry_li_NR_PROCESSO.AsString, '8') or
           ((not TemDocumento(qry_li_NR_PROCESSO.AsString, '8')) and DigitalizaDocumento(qry_li_NR_PROCESSO.AsString,  ExtractFilePath(Application.ExeName)  + 'Downloads\LI_' + Trim(datm_li_capa.qry_li_NR_PROCESSO.AsString) + '.pdf', '8', 'EXTRATO DA LI ' + FormatMaskText('99/9999999-9;0;_', NrLI))) then
          Commit
        else
          raise Exception.Create('Erro digitalizando arquivo.');
      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;
          Result := False;
        end; // Exception
      end; // Try Except
    end; // DigitalizaDocumento
  end; // With
end;

function Tfrm_LI_capa.MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
begin
  Result := CopyFile(AExistingFileName, ANewFileName, AFailIfExists);
  if Result then
  begin
    if GetFileAttributes(PAnsiChar(AExistingFileName)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
      SetFileAttributes(PAnsiChar(AExistingFileName), GetFileAttributes(PAnsiChar(AExistingFileName)) - SysUtils.faReadOnly);
    DeleteFile(PAnsiChar(AExistingFileName));
  end;
end;

function Tfrm_LI_capa.CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

procedure Tfrm_LI_capa.HabilitaOpcoesEnquadramento(Value: Boolean);
begin
  rgpEnquadramentoMaterialUsado.Enabled := Value;
  lblOpcoesNacionalizacao.Enabled := Value;
end;

procedure Tfrm_LI_capa.HabilitaEnquadramento(Value: Boolean);
begin
  rgpEnquadramentoMaterialUsado.Enabled := Value;
  rgpEnquadramentoMaterialUsado.ItemIndex := -1;
end;

procedure Tfrm_LI_capa.cbxMaterialUsadoClick(Sender: TObject);
begin
  HabilitaEnquadramento(cbxMaterialUsado.Checked);
end;

procedure Tfrm_LI_capa.rgpEnquadramentoMaterialUsadoChange(
  Sender: TObject);
begin
  HabilitaOpcoesEnquadramento(rgpEnquadramentoMaterialUsado.ItemIndex = 1);
end;

end.
