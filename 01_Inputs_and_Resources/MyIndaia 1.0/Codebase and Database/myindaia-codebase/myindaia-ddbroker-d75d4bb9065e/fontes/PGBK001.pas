unit PGLI001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids;

type
  Tfrm_LI_capa = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_monta_li: TSpeedButton;
    btn_itens_li: TSpeedButton;
    btn_excluir: TSpeedButton;
    Label10: TLabel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label16: TLabel;
    pgctrl_capa_li: TPageControl;
    tbsht_basicas_TL01: TTabSheet;
    lbl_importador2: TLabel;
    btn_co_importador: TSpeedButton;
    lbl_nr_registro_di2: TLabel;
    bl_dt_registro_di2: TLabel;
    Label19: TLabel;
    btn_co_pais_proc: TSpeedButton;
    lbl_urf_despacho1: TLabel;
    btn_co_urf_despacho: TSpeedButton;
    Label23: TLabel;
    btn_co_urf_entrada: TSpeedButton;
    Label1: TLabel;
    btn_co_incoterm: TSpeedButton;
    lbl_cd_moeda_cond_venda: TLabel;
    btn_co_moeda: TSpeedButton;
    dbedt_cd_importador: TDBEdit;
    dbedt_nr_registro_li: TDBEdit;
    dbedt_dt_registro_li: TDBEdit;
    dbedt_cd_urf_despacho: TDBEdit;
    dbedt_cd_urf_entrada: TDBEdit;
    dbedt_dt_li: TDBEdit;
    dbedt_cd_pais_proc: TDBEdit;
    dbedt_cd_incoterm: TDBEdit;
    dbedt_cd_moeda_fob: TDBEdit;
    tbsht_Negociacao_TL02: TTabSheet;
    lbl_doc_chegada_carga2: TLabel;
    gbox_reg_trib: TGroupBox;
    lbl_fund: TLabel;
    btn_co_fund_legal: TSpeedButton;
    Label2: TLabel;
    btn_co_reg_trib: TSpeedButton;
    lbl_agencia: TLabel;
    btn_co_agencia_secex: TSpeedButton;
    lbl_numero: TLabel;
    dbedt_cd_fund_legal: TDBEdit;
    dbedt_cd_reg_trib: TDBEdit;
    dbedt_cd_agencia_secex: TDBEdit;
    dbedt_cd_numero_ato: TDBEdit;
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
    tbsht_totais_TL03: TTabSheet;
    Label14: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    grpbox_1: TGroupBox;
    lbl_moeda_mle1: TLabel;
    btn_co_moeda_mle: TSpeedButton;
    lbl_vl_moeda_mle1: TLabel;
    Label12: TLabel;
    dbedt_cd_moeda_mle: TDBEdit;
    dbedt_vl_moeda_mle: TDBEdit;
    dbedt_vl_moeda_desconto: TDBEdit;
    grpbox_2: TGroupBox;
    lbl_moeda_frete1: TLabel;
    btn_co_moeda_frete: TSpeedButton;
    lbl_vl_frete_li: TLabel;
    lbl_moeda_seguro1: TLabel;
    btn_co_moeda_seguro: TSpeedButton;
    lbl_vl_moeda_seguro1: TLabel;
    dbedt_cd_moeda_frete: TDBEdit;
    dbedt_vl_moeda_frete_li: TDBEdit;
    dbedt_cd_moeda_seguro: TDBEdit;
    dbedt_vl_moeda_seguro_li: TDBEdit;
    dbedt_qtde_peso_liquido: TDBEdit;
    dbedt_qtde_medida_estatistica: TDBEdit;
    dbedt_vl_numero_comunicado: TDBEdit;
    dbg_docto_vinc: TDBGrid;
    stxt_docto_vinculado: TStaticText;
    TbSht_Complementares_TL05: TTabSheet;
    Label87: TLabel;
    btn_co_obs: TSpeedButton;
    dbmemo_info_complementares: TDBMemo;
    Label3: TLabel;
    dbgrd_ref: TDBGrid;
    dbrg_cobertura_cambial: TDBRadioGroup;
    dbedt_nm_importador: TDBEdit;
    dbedt_nm_pais_proc: TDBEdit;
    dbedt_nm_urf_entrada: TDBEdit;
    dbedt_nm_urf_despacho: TDBEdit;
    dbedt_nm_incoterm: TDBEdit;
    dbedt_nm_moeda_fob: TDBEdit;
    Label21: TLabel;
    dbedt_nm_fund_legal: TDBEdit;
    dbedt_nm_reg_trib: TDBEdit;
    dbedt_nm_agencia_secex: TDBEdit;
    dbedt_nm_acordo_aladi: TDBEdit;
    dbedt_nm_modalidade_pag: TDBEdit;
    dbedt_nm_mot_sem_cobert: TDBEdit;
    dbedt_nm_instituicao_financ: TDBEdit;
    dbedt_nm_moeda_mle: TDBEdit;
    dbedt_nm_moeda_frete: TDBEdit;
    dbedt_nm_moeda_seguro: TDBEdit;
    dbrdgrp_cond_merc: TDBRadioGroup;
    dbedt_vl_moeda_despesa: TDBEdit;
    lbl_vl_moeda_despesa: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbchkbox_mesma_moeda1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbtn_pessoa_juridica2Click(Sender: TObject);
    procedure rbtn_modalidade_despacho_normal1Click(Sender: TObject);
    procedure rbtn_Contratante_prop_impo1Click(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_urf_despachoExit(Sender: TObject);
    procedure dbedt_cd_recinto_alfandegado1Exit(Sender: TObject);
    procedure dbedt_cd_setor1Exit(Sender: TObject);
    procedure dbedt_cd_mot_sem_cobExit(Sender: TObject);
    procedure btn_monta_liClick(Sender: TObject);
    procedure btn_itens_liClick(Sender: TObject);
    procedure btn_co_urf_entradaClick(Sender: TObject);
    procedure dbedt_pc_seguroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_obsClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure Atualiza_Historico_Padrao;
    procedure tbsht_outros_complementos_TL04Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rbtn_BL1Click(Sender: TObject);
    procedure dbchkbox_op_fundap1Click(Sender: TObject);
    procedure dbedt_cd_local_embarque2Exit(Sender: TObject);
    procedure btn_co_inst_financClick(Sender: TObject);
    procedure dbedt_cd_inst_financExit(Sender: TObject);
    procedure dbedt_dt_embarque2Exit(Sender: TObject);
    procedure pgctrl_capa_liChanging(Sender: TObject;
      var AllowChange: Boolean);
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
    procedure ValidaRegime( nControla : Byte );
    procedure btn_co_acordoClick(Sender: TObject);
    procedure dblkcbox_acordo_tarifEnter(Sender: TObject);
    procedure rdgrp_condicaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbedt_cd_acordo_aladiExit(Sender: TObject);
    procedure dbedt_cd_urf_entradaExit(Sender: TObject);
    procedure dbrg_cobertura_cambialClick(Sender: TObject);
    procedure dbedt_cd_importadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_urf_despachoClick(Sender: TObject);
    procedure btn_co_modalidadeClick(Sender: TObject);
    procedure btn_co_moeda_mleClick(Sender: TObject);
    procedure btn_co_moeda_freteClick(Sender: TObject);
    procedure btn_co_moeda_seguroClick(Sender: TObject);
    procedure dbedt_cd_moeda_mleExit(Sender: TObject);
    procedure dbedt_cd_moeda_freteExit(Sender: TObject);
    procedure dbedt_cd_moeda_seguroExit(Sender: TObject);
    procedure dbgrd_refKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    function VerAlt            : Boolean;
    function Grava             : Boolean;
    procedure Cancelar;
    procedure CodExits;
  public
    { Public declarations }
    un_pd_nr_processo : string[11];
    Code : integer;
    in_reb : String[1];
    Tab_Ativa : TTabSheet;
    lNaoConsiste, in_banco, in_calculo, in_forca_calculo, in_excluiu, in_abrindo_via, in_li_abrindo : Boolean;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;

    function Consiste : Boolean;
    procedure LimpaConhecimento;
    procedure LimpaChecks;
    procedure HabilitaContratoCambio;
    procedure DesabilitaContratoCambio;
    procedure HabilitaAgente;
    procedure DesabilitaAgente;
    procedure Write_Carga2;
    procedure Write_CD_MOT_SEM_COB;
    procedure Write_CD_TIPO_IMPORTADOR;
    procedure Write_CD_MODALIDADE_DESP;

    procedure Via_de_Transporte;
    procedure Desativa_transporte;
    procedure Write_CD_VIA_TRANSPORTE;

    procedure Write_IN_OPERACAO_FUNDAP;
    procedure Write_CONTRATANTE_CAMBIO;
    procedure Atualiza_Nome_Setor;
    procedure GuardaTaxaCambial;
    procedure AtzTaxaCambialDI( Moeda : String; Campo : TFloatField );
    procedure Valores;
    procedure ValidaCobertura;
    procedure ChamaValidCambio( nTipo : Integer );

  end;

var
  frm_LI_capa: Tfrm_LI_capa;

implementation

uses GSMLIB,  PGGP017, PGSM096, PGSM104, PGSM019, PGSM014, PGSM006,
     PGSM064, PGGP001, PGLI005, PGLI002, PGLI003, PGLI004;

{$R *.DFM}

procedure Tfrm_LI_capa.HabilitaContratoCambio;
begin
  {
  cd_forma_pagamento := 0;
  if ( DATM_LI_Capa.qry_li_CD_FORMA_PAGAMENTO.AsString <> '' ) and
     Not ( DATM_LI_Capa.qry_li_.State in [dsInsert, dsEdit] ) then
  begin
    Val(DATM_LI_Capa.qry_li_CD_FORMA_PAGAMENTO.AsString, cd_forma_pagamento, Code);
    case cd_forma_pagamento of
    1: dbrdg_contrato_cambio.ItemIndex := 0;
    2: dbrdg_contrato_cambio.ItemIndex := 1;
    3: dbrdg_contrato_cambio.ItemIndex := 2;
    end;
  end;

  lbl_Contrato_Cambio.Visible := True;
  Bevel2.Visible := True;
  dbrdg_contrato_cambio.Visible := True;
  if cd_forma_pagamento <> 3 then
  begin
    dblkpcbox_moeda_nac.Visible    := True;
    EditNR_OP_CAMBIO.Visible       := True;
    EditCD_BANCO_PAGAMENTO.Visible := True;
    EditCD_PRACA_PAGAMENTO.Visible := True;
    EditNR_COMPR_CAMBIO.Visible    := True;
    lbl_moeda_nac.Visible          := True;
    lblNR_OP_CAMBIO.Visible        := True;
    lblCD_BANCO_PAGAMENTO.Visible  := True;
    lblCD_PRACA_PAGAMENTO.Visible  := True;
    lblNR_COMPR_CAMBIO.Visible     := True;
  end;
  }
end;

procedure Tfrm_LI_capa.DesabilitaContratoCambio;
begin
  {
  lbl_Contrato_Cambio.Visible      := False;
  Bevel2.Visible                   := False;
  dbrdg_contrato_cambio.Visible    := False;
  dblkpcbox_moeda_nac.Visible      := False;
  EditNR_OP_CAMBIO.Visible         := False;
  EditCD_BANCO_PAGAMENTO.Visible   := False;
  EditCD_PRACA_PAGAMENTO.Visible   := False;
  EditNR_COMPR_CAMBIO.Visible      := False;
  lbl_moeda_nac.Visible            := False;
  lblNR_OP_CAMBIO.Visible          := False;
  lblCD_BANCO_PAGAMENTO.Visible    := False;
  lblCD_PRACA_PAGAMENTO.Visible    := False;
  lblNR_COMPR_CAMBIO.Visible       := False;

  if DATM_LI_capa.qry_li_.State in [dsEdit,dsInsert] then
  begin
    with DATM_LI_Capa do
    begin
      qry_li_CD_FORMA_PAGAMENTO.AsString := '3';
      qry_li_IN_MOEDA_NACIONAL.AsBoolean := False;
      qry_li_NR_CONTRATO_CAMBIO.AsString := '';
      qry_li_NR_BANCO_PAGAMENTO.AsString := '';
      qry_li_NR_PRACA_PAGAMENTO.AsString := '';
      qry_li_NR_COMPRADOR_ME.AsString    := '';
    end;
  end;
  }
end;

procedure Tfrm_LI_capa.HabilitaAgente;
begin
  {
  Bevel4.Visible                        := True;
  lblComissao.Visible                   := True;
  lbl_pc_comissao_agente.Visible        := True;
  lbl_nr_identificacao_agente.Visible   := True;
  lbl_nr_banco.Visible                  := True;
  lbl_nr_praca.Visible                  := True;
  dbedt_pc_comissao_agente.Visible      := True;
  dbedt_nr_identificacao_agente.Visible := True;
  dbedt_nr_banco.Visible                := True;
  dbedt_nr_praca.Visible                := True;
  }
end;

procedure Tfrm_LI_capa.DesabilitaAgente;
begin
  {
  Bevel4.Visible                        := False;
  lblComissao.Visible                   := False;
  lbl_pc_comissao_agente.Visible        := False;
  lbl_nr_identificacao_agente.Visible   := False;
  lbl_nr_banco.Visible                  := False;
  lbl_nr_praca.Visible                  := False;
  dbedt_pc_comissao_agente.Visible      := False;
  dbedt_nr_identificacao_agente.Visible := False;
  dbedt_nr_banco.Visible                := False;
  dbedt_nr_praca.Visible                := False;

  if DATM_LI_capa.qry_li_.State in [dsEdit,dsInsert] then
  begin
    with DATM_LI_Capa do
    begin
      qry_li_PC_COMISSAO.AsFloat           := 0;
      qry_li_NR_IDENTifICACAO_COM.AsString := '';
      qry_li_NR_BANCO_COM.AsString         := '';
      qry_li_NR_PRACA_COM.AsString         := '';
    end;
  end;
  }
end;

procedure Tfrm_LI_capa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_LI_Capa do
    begin
      qry_li_.Close;
      qry_ref_cli_.Close;
      qry_anuentes_.Close;
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

procedure Tfrm_LI_capa.Write_CONTRATANTE_CAMBIO;
begin
end;

procedure Tfrm_LI_capa.Write_IN_OPERACAO_FUNDAP;
begin
end;


procedure Tfrm_LI_capa.Write_CD_TIPO_IMPORTADOR;
begin
end;

procedure Tfrm_LI_capa.Write_CD_MODALIDADE_DESP;
begin
end;

procedure Tfrm_LI_capa.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  datm_LI_Capa.VerificaEstado(False);
end;

procedure Tfrm_LI_capa.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_LI_capa.Via_de_Transporte;
begin
end;

procedure Tfrm_LI_capa.Desativa_transporte;
begin
end;



procedure Tfrm_LI_capa.Write_CD_VIA_TRANSPORTE;
begin
end;


procedure Tfrm_LI_capa.dbchkbox_mesma_moeda1Click(Sender: TObject);
begin
  Write_Carga2;
end;

procedure Tfrm_LI_capa.FormShow(Sender: TObject);
var
  nTipo_Cambio     : Integer;

begin

  in_excluiu        := False;
  in_li_abrindo     := False;

  frm_LI_capa.Caption := 'Licença de Importação [ ' + Trim( Copy( str_nr_processo, 5, 14 ) ) + ' ] ';

  datm_LI_Capa.qry_tp_acordo_tarif_.Close;
  datm_LI_Capa.qry_tp_acordo_tarif_.Prepare;
  datm_LI_Capa.qry_tp_acordo_tarif_.Open;

  datm_LI_capa.qry_li_.Close;
  datm_LI_capa.qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_LI_capa.qry_li_.Prepare;
  datm_LI_capa.qry_li_.Open;

  with datm_li_Capa do
  begin
     qry_ref_cli_.Close;
     qry_ref_cli_.SQL[2] := 'NR_PROCESSO = "' + str_nr_processo + '"';
     qry_ref_cli_.Prepare;
     qry_ref_cli_.Open;

     qry_anuentes_.Close;
     qry_anuentes_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
     qry_anuentes_.Open;

  end;

  with datm_LI_Capa do
  begin
    NullToZero( qry_LI_QT_MED_ESTATISTICA);
    NullToZero( qry_LI_QT_TOTAL_PES_LIQ  );
    NullToZero( qry_LI_VL_TOTAL_MOEDA    );
    NullToZero( qry_LI_VL_DESPESA_MOEDA  );
    NullToZero( qry_LI_VL_DESCONTO_MOEDA );
    NullToZero( qry_LI_VL_FRETE_MOEDA    );
    NullToZero( qry_LI_VL_SEGURO_MOEDA   );
  end;

  datm_LI_Capa.qry_li_.Edit;
  dbedt_cd_importadorExit(nil);

  nTipo_cambio := -1;
  if datm_LI_capa.qry_li_TP_CAMBIO.AsString = '1' then nTipo_Cambio := 0;
  if datm_LI_capa.qry_li_TP_CAMBIO.AsString = '2' then nTipo_Cambio := 1;
  if datm_LI_capa.qry_li_TP_CAMBIO.AsString = '3' then nTipo_Cambio := 2;
  if datm_LI_capa.qry_li_TP_CAMBIO.AsString = '4' then nTipo_Cambio := 3;

  datm_LI_Capa.qry_li_.Cancel;


  dbrg_cobertura_cambial.itemindex := nTipo_cambio;

  datm_LI_Capa.VerificaEstado(False);

end;

procedure Tfrm_LI_capa.rbtn_pessoa_juridica2Click(Sender: TObject);
begin
  Write_CD_TIPO_IMPORTADOR;
end;

procedure Tfrm_LI_capa.rbtn_modalidade_despacho_normal1Click(
  Sender: TObject);
begin
  Write_CD_MODALIDADE_DESP;
end;

procedure Tfrm_LI_capa.rbtn_Contratante_prop_impo1Click(Sender: TObject);
begin
  Write_CONTRATANTE_CAMBIO;
end;

procedure Tfrm_LI_capa.dbedt_cd_importadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_urf_despachoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_recinto_alfandegado1Exit(Sender: TObject);
begin
  {
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
     Not ( DATM_LI_capa.qry_li_.State in [dsEdit,dsInsert] ) or
     ( dbedt_cd_recinto_alfandegado1.Text = '' ) then Exit;

  ValidCodigo( dbedt_cd_recinto_alfandegado1 );

  if dbedt_cd_urf_despacho1.text = '' then
  begin
    BoxMensagem( 'URF de Entrada não informada.', 3 );
    Exit;
  end;


  DATM_LI_capa.Query3.close;
  DATM_LI_capa.Query3.SQL.clear;
  DATM_LI_capa.Query3.SQL.add( 'SELECT CODIGO FROM TREC_ALFANDEGADO WHERE ' );
  DATM_LI_capa.Query3.SQL.add( 'CODIGO = "'+dbedt_cd_recinto_alfandegado1.text+'" AND ' );
  DATM_LI_capa.Query3.SQL.add( 'COD_ORGAO_REC = "'+dbedt_cd_urf_despacho1.text+'"' );

  DATM_LI_capa.Query3.Prepare;
  DATM_LI_capa.Query3.Open;

  if DATM_LI_capa.Query3.RecordCount = 0 then
  begin
    DATM_LI_capa.Query3.close;
    BoxMensagem( 'Este Recinto não pertence a U.R.F. de Despacho.', 2 );
  end;

  DATM_LI_capa.Query3.close;
  }
end;

procedure Tfrm_LI_capa.dbedt_cd_setor1Exit(Sender: TObject);
begin
  if ( in_li_abrindo or in_calculo ) then Exit;
  Atualiza_Nome_Setor ;
end;

procedure Tfrm_LI_capa.Atualiza_Nome_Setor;
begin
end;

procedure Tfrm_LI_capa.dbedt_cd_mot_sem_cobExit(Sender: TObject);
begin
  if DATM_LI_Capa.qry_li_.State in [dsEdit, dsInsert] then Write_CD_MOT_SEM_COB;
end;

procedure Tfrm_LI_capa.btn_monta_liClick(Sender: TObject);
begin
  BoxMensagem( 'Aguarde próxima versão !!', 3 )
  {
  if DATM_LI_Capa.qry_li_QT_ADICOES.AsFloat <= 0 then
  begin
    BoxMensagem('Não existem adições' + #10#13 + 'para este processo!', 3);
    Exit;
  end;
  Close;
  }
end;

procedure Tfrm_LI_capa.btn_itens_liClick(Sender: TObject);
begin
  Close;
  frm_LI.i_seletor := 2;
end;

procedure Tfrm_LI_capa.btn_co_urf_entradaClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TURF',
                datm_LI_Capa.qry_li_CD_URF_ENTRADA ,
                'Unidade da Receita Federal de Entrada', 1, '','TTable');
  dbedt_cd_urf_entradaExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_pc_seguroExit(Sender: TObject);
begin
  Write_Carga2;
end;

procedure Tfrm_LI_capa.FormCreate(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_LI_capa, Datm_LI_capa );

end;

procedure Tfrm_LI_capa.btn_co_obsClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_observacoes, frm_observacoes );
  frm_observacoes.Cons_OnLine := DATM_LI_capa.qry_li_TX_INFO_COMPLEMENTAR;
  with frm_observacoes do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  Atualiza_Historico_Padrao;

end;

procedure Tfrm_LI_capa.btn_calculoClick(Sender: TObject);
begin

  Grava;

  {Genéricas}
  DATM_LI_capa.qry_li_.Close;

  {
  MessageDlg( sp_di_calculo(str_nr_processo, False), mtInformation, [mbOK], 0);

  Tab_Ativa := pgctrl_capa_di.ActivePage;
  pgctrl_capa_di.ActivePage := tbsht_importador_TD01;
  pgctrl_capa_di.Refresh;
  in_calculo := True;
  FormShow(Sender);
  pgctrl_capa_di.ActivePage := Tab_Ativa;
  }
  in_calculo := False;
end;

procedure Tfrm_LI_capa.dbedt_cd_incotermExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_excluirClick(Sender: TObject);
begin
  BoxMensagem( 'Aguarde próxima versão !!', 3 )
{
  if BoxMensagem( 'Deseja realmente excluir a LI ' + Processo( str_nr_processo ) + '?', 1 ) then

  try
    datm_LI_capa.qry_li_.Close;
    FechaTabelas;
    try
      datm_main.db_li.StartTransaction;
      datm_LI_Capa.sp_exclui_di.Active := False;
      datm_LI_Capa.sp_exclui_di.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      datm_LI_Capa.sp_exclui_di.ExecProc;
      datm_LI_Capa.sp_exclui_di.Active := False;
      datm_main.db_di.Commit;
      datm_LI_Capa.VerificaEstado(False);
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_di.InTransaction then datm_main.db_di.Rollback;
        frm_DI_capa.btn_cancelarClick(nil);
      end;
    end;
    in_excluiu := True;
    Close;
  except
    BoxMensagem( 'Operação de exclusão não foi executada com sucesso.', 2 );
  end
  }
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
  if Not ( DATM_LI_capa.qry_li_.State in [dsEdit,dsInsert] ) then Exit;

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

procedure Tfrm_LI_capa.tbsht_outros_complementos_TL04Exit(Sender: TObject);
begin
  Atualiza_Historico_Padrao;
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

procedure Tfrm_LI_capa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_LI_capa.rbtn_BL1Click(Sender: TObject);
begin
  if ( Not in_abrindo_via ) then Write_CD_VIA_TRANSPORTE;
end;

procedure Tfrm_LI_capa.LimpaConhecimento;
begin
end;

procedure Tfrm_LI_capa.LimpaChecks;
begin
end;


procedure Tfrm_LI_capa.Write_Carga2;
begin
end;


procedure Tfrm_LI_capa.dbchkbox_op_fundap1Click(Sender: TObject);
begin
  Write_IN_OPERACAO_FUNDAP;
end;


procedure Tfrm_LI_capa.Write_CD_MOT_SEM_COB;
begin
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

        qry_li_.Post;

        datm_main.db_broker.Commit;

      end;
    end;
  except
    on E: Exception do
    begin
      TrataErro(E);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      Grava := False;
    end;
  end;
end;

procedure Tfrm_LI_capa.dbedt_cd_local_embarque2Exit(Sender: TObject);
begin
  if ( Not ( DATM_LI_Capa.qry_li_.State in [dsInsert, dsEdit] ) ) and in_li_abrindo and in_calculo then
  begin
    DATM_LI_Capa.qry_li_.Edit;
    ValidCodigo( TDbEdit(Sender) );
  end;
end;

procedure Tfrm_LI_capa.btn_co_inst_financClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TINST_FINANC_INTERNACIONAL',
                datm_LI_Capa.qry_li_CD_INSTITUICAO_FINANC ,
                'Instituição Financeira', 1, '','TTable');
  dbedt_cd_inst_financExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_cd_inst_financExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_dt_embarque2Exit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_LI_capa.pgctrl_capa_liChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

function Tfrm_LI_capa.Consiste:Boolean;
begin
  if datm_LI_Capa.qry_li_.State in [dsInsert, dsEdit] then
  begin
    {Importador}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_importador.Text = '' then
      begin
        BoxMensagem('Campo Importador deve ser preenchido!', 2);
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
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
        BoxMensagem('Código do Importador inválido!',2);
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
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
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
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
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
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
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
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
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
        dbedt_cd_incoterm.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Moeda FOB}
    ValidCodigo( dbedt_cd_moeda_fob );
    if dbedt_cd_moeda_fob.Text <> '' then
    begin
      if ( dbedt_nm_moeda_fob.Text = '' ) then
      begin
        BoxMensagem('Código da Moeda inválido!',2);
        pgctrl_capa_li.ActivePage := tbsht_basicas_TL01;
        dbedt_cd_moeda_fob.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Regime Tributação}
    ValidCodigo( dbedt_cd_reg_trib );
    if dbedt_cd_reg_trib.Text <> '' then
    begin
      if ( dbedt_nm_reg_trib.Text = '' ) then
      begin
        BoxMensagem('Código do Regime de Tributação inválido!',2);
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
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
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
        dbedt_cd_fund_legal.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Agência SECEX}
    ValidCodigo( dbedt_cd_agencia_secex );
    if dbedt_cd_agencia_secex.Text <> '' then
    begin
      if ( dbedt_nm_agencia_secex.Text = '' ) then
      begin
        BoxMensagem('Código da Agência SECEX inválido!',2);
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
        dbedt_cd_agencia_secex.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Acordo ALADI}
    ValidCodigo( dbedt_cd_acordo_aladi );
    if dbedt_cd_acordo_aladi.Text <> '' then
    begin
      if ( dbedt_nm_acordo_aladi.Text = '' ) then
      begin
        BoxMensagem('Código da acordo ALADI inválido!', 2);
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
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
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
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
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
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
        pgctrl_capa_li.ActivePage := tbsht_Negociacao_TL02;
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
        pgctrl_capa_li.ActivePage := tbsht_totais_TL03;
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
        pgctrl_capa_li.ActivePage := tbsht_totais_TL03;
        dbedt_cd_moeda_frete.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Moeda Seguro}
    ValidCodigo( dbedt_cd_moeda_seguro );
    if dbedt_cd_moeda_seguro.Text <> '' then
    begin
      if ( dbedt_nm_moeda_seguro.Text = '' ) then
      begin
        BoxMensagem('Código da Moeda do Seguro inválido!', 2);
        pgctrl_capa_li.ActivePage := tbsht_totais_TL03;
        dbedt_cd_moeda_seguro.SetFocus;
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
  Cons_On_line( 'DBBROKER', 'TINCOTERMS_VENDA',
                datm_LI_Capa.qry_li_CD_INCOTERM ,
                'Incoterms', 1, '','TTable');
  dbedt_cd_incotermExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_moedaClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOEDA',
                datm_LI_Capa.qry_li_CD_MOEDA_FOB ,
                'Moedas', 1, '','TTable');
  dbedt_cd_moeda_fobExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_fobExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_co_importadorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  frm_cliente_co.Cons_OnLine := datm_LI_capa.qry_LI_CD_IMPORTADOR;
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_importadorExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_pais_procClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_LI_Capa.qry_li_CD_PAIS_PROCEDENCIA ,
                'Países', 1, '', 'TTable');
  dbedt_cd_pais_procExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_cd_pais_procExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.btn_co_reg_tribClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TREG_TRIBUTARIO',
                datm_LI_Capa.qry_li_CD_REGIME_TRIBUTACAO,
                'Regime Tributário', 1, '','TTable');
  dbedt_cd_reg_tribExit(nil)
end;

procedure Tfrm_LI_capa.btn_co_fund_legalClick(Sender: TObject);
begin
  if dbedt_cd_reg_trib.Text <> '' then
  begin
    Cons_On_line( 'DBBROKER', 'TFUND_LEG_REG_TRIBUT',
                  datm_LI_capa.qry_li_CD_FUND_LEGAL,
                  'Fundamento Legal', 1,
                  'SELECT * FROM TFUND_LEG_REG_TRIBUT WHERE CODIGO IN ( SELECT CD_FUND_LEGAL FROM TTP_FUND_LEGAL T WHERE CD_REGIME_TRIB = "' + dbedt_cd_reg_trib.Text + '")',
                  'TQuery');
    dbedt_cd_fund_legalExit(nil);
  end;
end;

procedure Tfrm_LI_capa.btn_co_motivoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOT_SEM_COBERT_CAMBIAL',
                datm_LI_capa.qry_li_CD_MOT_SEM_COBERTURA,
                'Motivo Sem Cobertura Cambial', 1, '','TTable');
  dbedt_cd_mot_sem_cobertExit(nil);
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
  if ( datm_LI_Capa.qry_li_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '5' ) and
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
  if datm_li_capa.qry_li_TP_ACORDO_ALADI.AsString <> '1' then
  begin
    lbl_Acordo.Enabled             := False;
    dbedt_cd_acordo_aladi.Enabled  := False;
    dbedt_cd_acordo_aladi.Color    := clMenu;
    dbedt_cd_acordo_aladi.ReadOnly := True;
    btn_co_acordo.Enabled          := False;
    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_ACORDO_ALADI').AsString := '';
    end;

    if pgctrl_capa_li.ActivePage = tbsht_Negociacao_TL02 then dbrg_cobertura_cambial.SetFocus
  end
  else
  begin
    lbl_Acordo.Enabled             := True;
    dbedt_cd_acordo_aladi.Enabled  := True;
    dbedt_cd_acordo_aladi.Color    := clWindow;
    dbedt_cd_acordo_aladi.ReadOnly := False;
    btn_co_acordo.Enabled          := True;

    if pgctrl_capa_li.ActivePage = tbsht_Negociacao_TL02 then dbedt_cd_acordo_aladi.SetFocus
  end;
end;

procedure Tfrm_LI_capa.btn_co_agencia_secexClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TAB_AGENCIA_SECEX',
                datm_LI_capa.qry_li_CD_AGENCIA_SECEX,
                'Agência Secex', 1, '','TTable');
  dbedt_cd_agencia_secexExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_cd_agencia_secexExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Capa.Cancelar;
begin
  with datm_LI_Capa do
  begin
    if qry_li_.State      in [dsEdit,dsInsert] then qry_li_.Cancel;
    if qry_ref_cli_.State in [dsEdit,dsInsert] then qry_ref_cli_.Cancel;
    if qry_anuentes_.State in [dsEdit,dsInsert] then qry_anuentes_.Cancel;

    qry_li_.Close;
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

    btn_co_fund_legal.Enabled      := False;

    dbedt_cd_fund_legal.Enabled    := False;
    dbedt_cd_fund_legal.Color      := clMenu;
    dbedt_cd_fund_legal.ReadOnly   := True;

    dbedt_cd_agencia_secex.Enabled  := False;
    dbedt_cd_agencia_secex.Color    := clMenu;
    dbedt_cd_agencia_secex.Readonly := True;
    btn_co_agencia_secex.Enabled    := True;

    dbedt_cd_numero_ato.Enabled     := False;
    dbedt_cd_numero_ato.Color       := clMenu;
    dbedt_cd_numero_ato.Readonly    := True;

    lbl_acordo.Enabled             := True;
    dblkcbox_acordo_tarif.Enabled  := True;
    dblkcbox_acordo_tarif.Color    := clWindow;
    dblkcbox_acordo_tarif.ReadOnly := False;

    btn_co_acordo.Enabled          := True;

    dbedt_cd_acordo_aladi.Enabled  := True;
    dbedt_cd_acordo_aladi.Color    := clWindow;
    dbedt_cd_acordo_aladi.ReadOnly := False;

    if pgctrl_capa_li.ActivePage = tbsht_Negociacao_TL02 then
       dblkcbox_acordo_tarif.SetFocus;
  end;

  if nControla in [2..6] then
  begin
    dbedt_cd_fund_legal.Enabled    := True;
    dbedt_cd_fund_legal.Color      := clWindow;
    dbedt_cd_fund_legal.ReadOnly   := False;

    btn_co_fund_legal.Enabled      := True;

    if pgctrl_capa_li.ActivePage = tbsht_Negociacao_TL02 then
       dbedt_cd_fund_legal.SetFocus;
  end;

  {Acordo}
  if nControla in [2,3,6] then
  begin
    lbl_acordo.Enabled             := False;
    dblkcbox_acordo_tarif.Enabled  := False;
    dblkcbox_acordo_tarif.Color    := clMenu;
    dblkcbox_acordo_tarif.ReadOnly := True;

    btn_co_acordo.Enabled          := False;

    dbedt_cd_acordo_aladi.Enabled  := False;
    dbedt_cd_acordo_aladi.Color    := clMenu;
    dbedt_cd_acordo_aladi.ReadOnly := True;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('TP_ACORDO_ALADI').AsString  := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_ACORDO_ALADI').AsString  := '';
    end;

    if pgctrl_capa_li.ActivePage = tbsht_Negociacao_TL02 then
       dbedt_cd_fund_legal.SetFocus;

  end
  else
  begin
    lbl_acordo.Enabled             := True;
    dblkcbox_acordo_tarif.Enabled  := True;
    dblkcbox_acordo_tarif.Color    := clWindow;
    dblkcbox_acordo_tarif.ReadOnly := False;

    btn_co_acordo.Enabled          := True;

    dbedt_cd_acordo_aladi.Enabled  := True;
    dbedt_cd_acordo_aladi.Color    := clWindow;
    dbedt_cd_acordo_aladi.ReadOnly := False;

  end;
end;

procedure Tfrm_LI_capa.ValidaCobertura;
begin
  lbl_modalidade.Enabled                 := True;
  lbl_qtde.Enabled                       := True;
  lbl_instituicao.Enabled                := True;
  lbl_motivo.Enabled                     := True;

  dbedt_cd_modalidade_pag.Enabled        := True;
  dbedt_qtde_dias_pag.Enabled            := True;
  dbedt_cd_instituicao_financ.Enabled    := True;
  dbedt_cd_mot_sem_cobert.Enabled        := True;

  btn_co_modalidade.Enabled              := True;
  btn_co_instituicao.Enabled             := True;
  btn_co_motivo.Enabled                  := True;
end;

procedure Tfrm_LI_capa.btn_co_acordoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TAB_ALADI',
                datm_LI_capa.qry_li_CD_ACORDO_ALADI,
                'Acordo Aladi', 1, '','TTable');
  dbedt_cd_acordo_aladiExit(nil);
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

procedure Tfrm_LI_capa.Button1Click(Sender: TObject);
begin
  datm_li_capa.qry_anuentes_.Append;
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
begin
  if nTipo = 0 then
  begin
    // 180 dias
    ValidaCobertura;

    lbl_instituicao.Enabled := False;
    lbl_motivo.Enabled      := False;

    dbedt_cd_instituicao_financ.Enabled := False;
    dbedt_cd_mot_sem_cobert.Enabled     := False;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').AsString := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').AsString  := '';
    end;

    btn_co_instituicao.Enabled := False;
    btn_co_motivo.Enabled      := False;
  end
  else
  if nTipo = 1 then
  begin
    // 180 a 360 dias

    ValidaCobertura;

    lbl_qtde.Enabled        := False;
    lbl_instituicao.Enabled := False;
    lbl_motivo.Enabled      := False;

    dbedt_qtde_dias_pag.Enabled         := False;
    dbedt_cd_instituicao_financ.Enabled := False;
    dbedt_cd_mot_sem_cobert.Enabled     := False;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').AsString := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').AsString  := '';
      datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').AsInteger    := 0;
    end;

    btn_co_instituicao.Enabled := False;
    btn_co_motivo.Enabled      := False;
  end
  else
  if nTipo = 2 then
  begin
    // 360 dias

    ValidaCobertura;

    lbl_modalidade.Enabled := False;
    lbl_qtde.Enabled       := False;
    lbl_motivo.Enabled     := False;

    dbedt_cd_modalidade_pag.Enabled := False;
    dbedt_qtde_dias_pag.Enabled     := False;
    dbedt_cd_mot_sem_cobert.Enabled := False;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_MOD_PAGAMENTO').AsString      := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_MOT_SEM_COBERTURA').AsString  := '';
      datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').AsInteger    := 0;
    end;

    btn_co_modalidade.Enabled := False;
    btn_co_motivo.Enabled     := False;
  end
  else
  if nTipo = 3 then
  begin
    // s/ cobertura

    ValidaCobertura;

    lbl_modalidade.Enabled  := False;
    lbl_qtde.Enabled        := False;
    lbl_instituicao.Enabled := False;

    dbedt_cd_modalidade_pag.Enabled      := False;
    dbedt_qtde_dias_pag.Enabled          := False;
    dbedt_cd_instituicao_financ.Enabled  := False;

    if datm_LI_Capa.qry_li_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Capa.qry_li_.FieldByName('CD_MOD_PAGAMENTO').AsString      := '';
      datm_LI_Capa.qry_li_.FieldByName('CD_INSTITUICAO_FINANC').AsString := '';
      datm_LI_Capa.qry_li_.FieldByName('QT_DIAS_COBERTURA').AsInteger    := 0;
    end;

    btn_co_modalidade.Enabled            := False;
    btn_co_instituicao.Enabled           := False;
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
    if Sender = dbedt_cd_importador         then btn_co_importadorClick(nil);
    if Sender = dbedt_cd_pais_proc          then btn_co_pais_procClick(nil);
    if Sender = dbedt_cd_urf_despacho       then btn_co_urf_despachoClick(nil);
    if Sender = dbedt_cd_urf_entrada        then btn_co_urf_entradaClick(nil);
    if Sender = dbedt_cd_incoterm           then btn_co_incotermClick(nil);
    if Sender = dbedt_cd_moeda_fob          then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_reg_trib           then btn_co_reg_tribClick(nil);
    if Sender = dbedt_cd_fund_legal         then btn_co_fund_legalClick(nil);
    if Sender = dbedt_cd_agencia_secex      then btn_co_agencia_secexClick(nil);
    if Sender = dbedt_cd_acordo_aladi       then btn_co_acordoClick(nil);
    if Sender = dbedt_cd_modalidade_pag     then btn_co_modalidadeClick(nil);
    if Sender = dbedt_cd_instituicao_financ then btn_co_inst_financClick(nil);
    if Sender = dbedt_cd_mot_sem_cobert     then btn_co_motivoClick(nil);
    if Sender = dbedt_cd_moeda_mle          then btn_co_moeda_mleClick(nil);
    if Sender = dbedt_cd_moeda_frete        then btn_co_moeda_freteClick(nil);
    if Sender = dbedt_cd_moeda_seguro       then btn_co_moeda_seguroClick(nil);
    if Sender = dbmemo_info_complementares  then btn_co_obsClick(nil);
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
  Cons_On_line( 'DBBROKER', 'TURF',
                datm_LI_Capa.qry_li_CD_URF_DESPACHO ,
                'Unidade da Receita Federal de Despacho', 1, '','TTable');
  dbedt_cd_urf_despachoExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_modalidadeClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMODALIDAD_PAGMENTO',
                datm_LI_Capa.qry_li_CD_MOD_PAGAMENTO ,
                'Modalidade de Pagamento', 1, '', 'TTable');
  dbedt_cd_modalidade_pagExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_moeda_mleClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOEDA',
                datm_LI_Capa.qry_li_CD_MOEDA_MLE ,
                'Moedas', 1, '','TTable');
  dbedt_cd_moeda_mleExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_moeda_freteClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOEDA',
                datm_LI_Capa.qry_li_CD_MOEDA_FRETE ,
                'Moedas', 1, '','TTable');
  dbedt_cd_moeda_freteExit(nil);
end;

procedure Tfrm_LI_capa.btn_co_moeda_seguroClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOEDA',
                datm_LI_Capa.qry_li_CD_MOEDA_SEGURO ,
                'Moedas', 1, '','TTable');
  dbedt_cd_moeda_seguroExit(nil);
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_mleExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_freteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbedt_cd_moeda_seguroExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_capa.dbgrd_refKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  ( ssShift in Shift ) and ( Key = 9 ) and ( pgctrl_capa_li.ActivePage = tbsht_basicas_TL01 ) then
     pgctrl_capa_li.SetFocus
  else
  if ( Key = 9 ) and ( pgctrl_capa_li.ActivePage = tbsht_basicas_TL01 ) then
     dbedt_dt_li.SetFocus;
end;



end.


