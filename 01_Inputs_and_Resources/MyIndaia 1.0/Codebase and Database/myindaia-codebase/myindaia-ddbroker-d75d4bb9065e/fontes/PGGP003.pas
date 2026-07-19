(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP003.PAS - Segurança

AUTOR: Leandro Stipanich 

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 03/05/2002 - Followup P.O.
*************************************************************************************************)

{
CONTROLE DOS MENUS - SHORTCUT

CTRL + P  => PO
F2        => GESTAO BASICA - MANUTENCAO
F8        => GESTAO BASICA - PESQUISA
CTRL + F2 => GESTAO AVANCADA - REALIZACAO POR PROCESSO
F3        => LI
F4        => DI
CTRL + E  => EXPORTACAO - PROCESSOS
CTRL + F4 => SOLICITACAO DE NUMERARIO
CTRL + F3 => RECEBIMENTO DE NUMERARIO
CTRL + F7 => PAGTOS OPERACIONAIS
F5        => Entreposto - Pro-forma DA
F6        => Entreposto - Nacionalização
CTRL + F5 => DEBITO EM C/C
F7        => SDA - DISTRIBUICAO
F9        => FINANCEIRO - LANCAMENTOS
F10       => FATURAMENTO - LANCAMENTO C/C
F12       => FATURAMENTO - SOLICITACAO
F11       => LIQUIDACAO
CTRL + F6 => CONTAS A PAGAR
CTRL + F1 => INFORME DE RENDIMENTOS
CTRL + I  => INSTRUÇÃO DE DESEMBARAÇO
}


unit PGGP003;

interface      { segurança do Sistema }

uses WinTypes, Dialogs, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Menus, Buttons, DB, DBTables, ExtCtrls, SysUtils, PGGP001, Registry,
  RxGIF, Funcoes, IdMessage, IdSmtp,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

const
  str_Senha_Mestra = 'DOOMDOOM';

type
  Tfrm_senha = class(TForm)
    Panel1: TPanel;
    bvl_senha: TBevel;
    lbl_senha: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    btn_cancelar: TSpeedButton;
    btn_Ok: TSpeedButton;
    edt_nome_usuario: TEdit;
    edt_senha: TEdit;
    edt_senha_nova: TEdit;
    edt_confirma_senha: TEdit;
    Panel2: TPanel;
    Image1: TImage;
    shp1: TShape;
    Bevel2: TBevel;
    procedure btn_OkClick( Sender: TObject );
    procedure btn_cancelarClick( Sender: TObject );
    procedure FormKeyDown( Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose( Sender: TObject; var Action: TCloseAction );
    procedure FormCreate(Sender: TObject);
    procedure edt_senhaEnter(Sender: TObject);
    procedure edt_nome_usuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure AtribuiDireitos( Sender: TObject );
    procedure HabilitaMenu(Sender:TObject);
//    procedure AtivaDesativaMenu( Sender: TObject; obj_MenuItem: TMenuItem );
    procedure Rotina_Senha_Mestra;
    procedure EnviaEmail ( vNm_usuario, vSenhaAntiga , vSenhaNova: String );
    function ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;    

  public
    cItemMenu : TMenuItem;
    Menu: TMainMenu;
//    Esq : Integer;
    { Public declarations }
  end;

var
  frm_senha: Tfrm_senha;
  nTentativas : integer;

implementation

uses GSMLIB, PGSM100, PGGP017, PGGP018, PGSM250, ConsOnLineEx, Windows;

{$R *.DFM}

procedure Tfrm_senha.Rotina_Senha_Mestra;
begin

  with frm_main do
  begin
    lControleAcesso := True;
    lManutProc      := True;
    mi_movimentos.Visible                   := True; // movimentos

    mi_menu_PO.Visible                      := True;       { Pedido de Importação  1801 - 1899 }
      mi_gestao_po.Visible                  := True;
      mi_po_ev_critico.Visible              := True;
      mi_PO.Visible                         := True;
      mi_po_flp.Visible                     := True;
      mi_prepara.Visible                    := True;
      mi_estorno.Visible                    := True;
      mi_po_consulta_itens.Visible          := True;
      mi_po_consulta_prod.Visible           := True;
      mi_po_relat.Visible                   := True;
      mi_imp_po.Visible                     := True;
      mi_po_imp_mod2.Visible                := True;
      mi_po_imp_mod3.Visible                := True;
      mi_po_rel_saldo_merc.Visible          := True;
      mi_po_rel_proc.Visible                := True;
      mi_po_rel_flp.Visible                 := True;
      mi_po_rel_lead_time.Visible           := True;
      mi_po_rel_emb.Visible                 := True;
      mi_po_rel_emb_prev.Visible            := True;
      pnl_po.Visible                        := True;
      mi_po_rel_nivel_servico.Visible       := True;
      mi_po_at_basf.Visible                 := True;
      mi_po_at_basf_cad.Visible             := True;
      mi_po_at_basf_rel.Visible             := True;
      mi_po_rel_prev_nacion.Visible         := True;
      mi_po_rel_gestao.Visible              := True;

      mi_menu_PE.Visible                    := True;       { Pedido de Exportacao  1901 - 1999 }
      mi_PE.Visible                         := True;
      mi_pe_prepara.Visible                 := True;
      mi_pe_estorno.Visible                 := True;
      mi_pe_consulta_itens.Visible          := True;
      mi_pe_consulta_prod.Visible           := True;
      mi_imp_pe.Visible                     := True;
      pnl_pe.Visible                        := True;
      pnl_InstrucaoDesemb.Visible           := True;

    mi_menu_Exp.Visible                     := True;       { Exportação  2001 - 2099 }
      mi_Exp.Visible                        := True;
      mi_Exp_saque.Visible                  := True;
      mi_exp_carta_cred.Visible             := True;
      mi_Exp_doc_fat_com.Visible            := True;
      mi_Exp_doc_cert_orig.Visible          := True;
      mi_Exp_doc_packing_list.Visible       := True;
      mi_Exp_doc_cert_seguro.Visible        := True;
      mi_Exp_doc_instr_emb.Visible          := True;
      mi_exp_doc_saque.Visible              := True;
      mi_Exp_imp.Visible                    := True;
      mi_exp_bordero.Visible                := True;
      mi_exp_doc_bordero.Visible            := True;
      mi_exp_prep_re.Visible                := True;
      pnl_re.Visible                        := True;

    mi_gp.Visible                           := True;       { Gestão do Processo  0101 - 0199 }
      mi_gb.Visible                         := True;     { Gestão Basica }
        mi_abertura_processo.Visible        := True;
        mi_manutencao_processo.Visible      := True;
        mi_cancelamento_processo.Visible    := True;
        mi_liberacao_processo.Visible       := True;
        mi_espelho_processo.Visible         := True;
        mi_gp_gb_rel_proc_mod1.Visible      := True;

    pnl_manut_proc.Visible                  := True;
      mi_ga.Visible                         := True;     { Gestão Avançada }
        mi_aplicabilidade_evento.Visible    := True;
        mi_realizacao_evento.Visible        := True;
        mi_realizacao_processo.Visible      := True;
        mi_realizacao_veiculo.Visible       := True;
        mi_inspecao_evento.Visible          := True;
        mi_inspecao_processo.Visible        := True;
        mi_pesquisa_processo.Visible        := True;
        mi_gp_ga_cad_viagem.Visible         := True;
        mi_li_gestao_av.Visible             := True;
        mi_li_trans_LI.Visible              := True;
        mi_relacao_nao_realizacao.Visible   := True;
        mi_relacao_nao_inspecao.Visible     := True;
        mi_relacao_realizados.Visible       := True;
        mi_bloqueio_evento.Visible          := True;
        mi_repasse_dados.Visible            := True;
        mi_realizacao_veiculo.Visible       := True;
        mi_relatriodecontrolededescarga.Visible := True;
        mi_relacao_ev_critico.Visible       := True;
        mi_relacao_ev_critico_po.Visible    := True;

    pnl_proc_realiza.Visible                := True;

      mi_gd.Visible                         := True;     { Gestão Demurrage }
        mi_gd_cntr.Visible                  := True;
        mi_gd_fat.Visible                   := True;
        mi_gp_dem_rel.Visible               := True;
        mi_gp_gd_rel_cont_nao_devol.Visible := True;
        mi_gp_gd_rel_ger.Visible            := True;
        mi_gp_gd_rel_ger2.Visible           := True;
        mi_gp_gd_rel_est.Visible            := True;

    mi_menu_di.Visible                      := True;       { Declaração de Importação  0201 - 0299 }
      mi_di.Visible                         := True;
      mi_di_trans.Visible                   := True;
      mi_di_recupera.Visible                := True;
      mi_di_lib_alto_valor.Visible          := True;
      mi_di_icms_online.Visible             := True;
      mi_imp_di.Visible                     := True;
      mi_imp_itens.Visible                  := True;
      mi_di_recalculo.Visible               := True;
      mi_di_retif_di.Visible                := True;
      mi_di_imprime_darf.Visible            := True;

      pnl_di.Visible                        := True;


    mi_menu_LI.Visible                      := True;       { Licença de Importação  0301 - 0399 }
      mi_LI.Visible                         := True;
      mi_integracao_li.Visible              := True;
      mi_imp_li.Visible                     := True;
      pnl_li.Visible                        := True;

    mi_mov_db.Visible                       := True;      { Drawback  0401 - 0499 }
      mi_db_susp.Visible                    := True;
      mi_db_flp.Visible                     := True;

    mi_sol_num.Visible                      := True;      { Solicitacao Numerário  0501 - 0599 }
      pnl_solinum.Visible                   := True;
      mi_solicitacao_numerario.Visible      := True;
      mi_emi_sol_num.Visible                := True;
      mi_emi_sol_liberacao.Visible          := True;
//      pnl_solinum.Visible                   := True;

    mi_rec_num.Visible                      := True;      { Recebimento Numerário  0601 - 0699 }
      mi_rec_num_solicitado.Visible         := True;
      mi_rec_num_dev.Visible                := True;
      mi_li_recebimento.Visible             := True;
      mi_rec_num_rel_nao_rec.Visible        := True;
      mi_rec_num_rel_rec_dev.Visible        := True;
      mi_rec_num_rel_tot.Visible            := True;
      pnl_recnum.Visible                    := True;
      mi_emi_sol_liberacao.Visible          := True;

    mi_sda.Visible                          := True;       { SDA     0901 - 0999}
      mi_li_sda.Visible                     := True;
      mi_sda_distr.Visible                  := True;
      mi_sda_emissao.Visible                := True;
      mi_sda_cancel.Visible                 := True;
      mi_sda_pesq.Visible                   := True;
      mi_ext_hon_sda.Visible                := True;
    pnl_sda.Visible                         := True;

    mi_fat.Visible                          := True;      { Faturamento  1101 - 1199 }
      mi_fat_lanc.Visible                   := True;
      mi_fat_sol.Visible                    := True;
      mi_fat_emi_nf_fat.Visible             := True;
      mi_adiant_pend_fat.Visible            := True;
      mi_fat_emi_nota.Visible               := True;
      mi_fat_emi_nf_serv.Visible            := True;
      mi_fat_emi_nf_serv_fat.Visible        := True;
      mi_fat_relat.Visible                  := True;
      mi_fat_rel_livro_fiscal.Visible       := True;
      mi_fat_rel_saldos.Visible             := True;
      mi_fat_rel_comissao.Visible           := True;
      mi_fat_rel_comparativo.Visible        := True;
      mi_fat_rel_abfat.Visible              := True;
      mi_fat_rel_demo_cc.Visible            := True;
      mi_fat_rel_cc_cli.Visible             := True;
      mi_fat_rel_resumo_fat.Visible         := True;
      mi_fat_rel_pago_cli.Visible           := True;
      mi_fat_rel_nf_rec.Visible             := True;
      mi_fat_rel_livro_fisc_nf.Visible      := True;
      mi_fat_rel_livro_fisc_capa.Visible    := True;
      pnl_fat_cc.Visible                    := True;
      pnl_fat_sol.Visible                   := True;
      mi_fat_rel_proc_fat_prefixo.Visible   := True;
      mi_fat_rel_fat_nf_nota_emit_canc.Visible := True;
      mi_fat_rel_rent_proc.Visible          := True;
      mi_fat_rel_ret.Visible                := True;

    mi_fin.Visible                          := True;   { Financeiro  1201 - 1299 }
      mi_fin_lanc.Visible                   := True;
      mi_li_financeiro.Visible              := True;
      mi_cheque_avulso.Visible              := True;
      mi_fin_pesq.Visible                   := True;
      mi_fin_rel_ext_cc.Visible             := True;
      mi_fin_manut_rel_reemb_fin.Visible    := True;
      mi_fin_rel_desemb.Visible             := True;
      mi_fin_rel_tab_juros.Visible          := True;
      mi_fin_transf_pagto.Visible           := True;
      pnl_fin.Visible                       := True;

    mi_ch_br.Visible                        := True;   { Cheques em Branco  1301 - 1399 }
      mi_entrega_ch_br.Visible              := True;
      mi_rel_pend_ch_br.Visible             := True;
      mi_rel_prestados_conta_ch_br.Visible  := True;
      pnl_ch_branco.Visible                 := True;

    mi_liq.Visible                          := True;     {Liquidações 1401 - 1499}
      mi_liquidacao.Visible                 := True;
      mi_rel_saldos_pend.Visible            := True;
      mi_rel_liquidacao.Visible             := True;
      mi_liq_rel_tot.Visible                := True;
      pnl_liq.Visible                       := True;

    mi_rel.Visible                          := True;     {Relatorios 1501 - 1599}
      mi_rel_est.Visible                    := True;
      mi_rel_est_lead_time.Visible          := True;
      mi_rel_es_desvios.Visible             := True;
      mi_rel_es_realizado.Visible           := True;
      mi_rel_es_arealizar.Visible           := True;
      mi_rel_es_saldo_cli.Visible           := True;
      mi_rel_es_desp.Visible                := True;
      mi_rel_es_rec_desp_op.Visible         := True;
      mi_rel_es_rank_rec.Visible            := True;
      mi_rel_es_periodo.Visible             := True;
      mi_rel_es_vencto_cartao.Visible       := True;
      mi_rel_es_gastos_processo.Visible     := True;
      mi_rel_es_gastos_porto.Visible        := True;
      mi_rel_es_gastos_amz.Visible          := True;
      mi_rel_es_vl_cif.Visible              := True;
      mi_rel_es_cli_ativo.Visible           := True;
      mi_rel_es_cli_nao_ativo.Visible       := True;
      mi_rel_es_cli_ativo_nao_ativo.Visible := True;
      mi_rel_es_cli_nao_ativo_ativo.Visible := True;
      mi_rel_es_tot_serv_cli.Visible        := True;
      mi_rel_es_tot_serv_cli_an.Visible     := True;
      mi_rel_es_ensaio_rec.Visible          := True;
      mi_rel_cont_emb.Visible               := True;
      mi_rel_est_cntr.Visible               := True;
      mi_rel_est_qt_cntr.Visible            := True;
      mi_rel_est_cntr_vl_cif.Visible        := True;
      mi_rel_est_volumes.Visible            := True;
      mi_rel_est_volumes2.Visible           := True;
      mi_rel_est_desp.Visible               := True;
      mi_rel_est_merc.Visible               := True;
      mi_rel_est_arm_demurrage.Visible      := True;
      mi_rel_est_arm_prefixo.Visible        := True;

      mi_rel_imp.Visible                    := True;
      mi_rel_imp_proc_pg_des_di.Visible     := True;
      mi_rel_imp_proc_pg_des_li.Visible     := True;
      mi_rel_imp_mov_proc.Visible           := True;
      mi_rel_imp_andamento.Visible          := True;
      mi_rel_imp_and_servico.Visible        := True;
      mi_rel_imp_flp_plan.Visible           := True;
      mi_rel_imp_map_seg.Visible            := True;
      mi_rel_imp_prev_custo.Visible         := True;
      mi_rel_imp_followup.Visible           := True;
      mi_rel_imp_lead_time.Visible          := True;
      mi_rel_imp_performance.Visible        := True;
      mi_rel_imp_plan_custo.Visible         := True;
      mi_rel_imp_docto_rec.Visible          := True;
      mi_rel_imp_desp_mensais.Visible       := True;
      mi_rel_imp_pos_veiculos.Visible       := True;
      mi_rel_imp_desp_nao_desemb_di.Visible := True;
      mi_rel_imp_followup_navio.Visible     := True;
      mi_rel_imp_desp_arm.Visible           := True;
      mi_rel_imp_desp_pagto.Visible         := True;
      mi_rel_imp_minuta_transp.Visible      := True;
      mi_rel_imp_ctrl_demurrage.Visible     := True;
      mi_rel_imp_ctrl_cliente_arm.Visible   := True;
      mi_rel_imp_demurrage.Visible          := True;
      mi_rel_imp_reg.Visible                := True;
      mi_rel_imp_desemb.Visible             := True;
      mi_rel_imp_imp_sap.Visible            := True;
      mi_rel_imp_canal_mes.Visible          := True;
      mi_rel_imp_canal_mes_mod_2.Visible    := True;

      mi_rel_exp.Visible                    := True;
      mi_rel_exp_emb_averb.Visible          := True;
      mi_rel_exp_proc_pend_averb.Visible    := True;
      mi_rel_exp_proc_averb.Visible         := True;
      mi_rel_exp_pos_veiculos.Visible       := True;
      mi_rel_exp_flp.Visible                := True;
      mi_rel_exp_andamento.Visible          := True;
      mi_rel_exp_contr_averb.Visible        := True;
      mi_rel_exp_est_cambial.Visible        := True;
      mi_rel_exp_re.Visible                 := True;
      mi_rel_exp_kpi.Visible                := True;
      mi_rel_exp_custos.Visible             := True;

      mi_rel_com_imp_exp.Visible            := True;
      mi_rel_com_ind_por.Visible            := True;
      mi_n1.Visible                         := True;

      mi_rel_cad.Visible                    := True;
      mi_rel_cad_merc_imp.Visible           := True;
      mi_rel_cad_merc_exp.Visible           := True;
      mi_rel_imp_ctrl_requerimento.Visible  := True;
      mi_rel_imp_lead_time2.Visible         := True;
      mi_rel_imp_proc_and.Visible           := True;
      mi_rel_imp_proc_desemb.Visible        := True;

    mi_cadastros.Visible                      := True;  // Cadastros  2201 - 2299
      mi_tx.Visible                           := True; //  Taxas por enquanto esta em cadastro
      mi_cad_cli.Visible                      := True;
      mi_cad_emp_nac.Visible                  := True;
      mi_cad_emp_est.Visible                  := True;
      mi_cad_desp.Visible                     := True;
      mi_cad_prop_merc.Visible                := True;
      mi_cad_local_emb.Visible                := True;
      mi_cad_obs.Visible                      := True;
      mi_cad_transp_itl.Visible               := True;
      mi_cad_amz.Visible                      := True;
      mi_cad_merc.Visible                     := True;
      mi_cad_merc_pesq.Visible                := True;
      mi_cad_merc_exp.Visible                 := True;
      mi_cad_familia_prod.Visible             := True;
      mi_cad_finalidade_merc.Visible          := True;
      mi_cad_transp_rod.Visible               := True;
      mi_cad_via_transp.Visible               := True;
      mi_cad_hab_desp.Visible                 := True;
      mi_cad_moeda.Visible                    := True;
      mi_cad_pais.Visible                     := True;
      mi_tx_sda.Visible                       := True;
      mi_out_celula.Visible                   := True;
      mi_tx_exp.Visible                       := True;
      mi_tx_darf.Visible                      := True;
      mi_tx_codesp.Visible                    := True;
      mi_tx_tra.Visible                       := True;
      //mi_tx_amz.Visible                       := True;
      mi_tx_teca.Visible                      := True;
      mi_cad_empresas.Visible                 := True;
      mi_cad_embar.Visible                    := True;
      mi_cad_embal.Visible                    := True;
      mi_agentes.Visible                      := True;
      mi_mod_followup.Visible                 := True;
      mi_cad_unid_medida.Visible              := True;
      mi_cad_disp_legal.Visible               := True;
      mi_cad_feriado.Visible                  := True;
      mi_cad_ncm.Visible                      := True;
      mi_cad_documento.Visible                := True;
      mi_cad_fin.Visible                      := True;
      mi_cad_fin_fav.Visible                  := True;
      mi_cad_fin_grupo_item.Visible           := True;
      mi_cad_fin_item.Visible                 := True;
      mi_cad_fin_priori_itens.Visible         := True;
      mi_cad_fin_contas_caixa.Visible         := True;
      mi_cad_fin_conta_banc.Visible           := True;
      mi_cad_fin_conta_contabil.Visible       := True;
      mi_cad_fin_conta_custo.Visible          := True;
      mi_cad_fin_conta_gerencial.Visible      := True;
      mi_cad_fin_hist_padrao.Visible          := True;
      mi_cad_scx_exp_acordo.Visible           := True;
      mi_cad_scx_exp_cabecalho.Visible        := True;
      mi_cad_scx_exp_local_emis.Visible       := True;
      mi_cad_scx_exp_ncm.Visible              := True;
      mi_cad_scx_exp_naladincca.Visible       := True;
      mi_cad_scx_exp_naladish.Visible         := True;
      mi_cad_scx_exp.Visible                  := True;
      mi_cad_scx_exp_acesso.Visible           := True;
      mi_cad_scx_exp_inst_negoc.Visible       := True;
      mi_cad_scx_exp_urf.Visible              := True;
      mi_cad_scx_exp_enquad_op.Visible        := True;
      mi_cad_urf.Visible                      := True;
      mi_cad_area.Visible                     := True;
      mi_cad_termo_pagto.Visible              := True;
      mi_cad_mod_trans.Visible                := True;
      mi_cad_delegacia.Visible                := True;
      mi_cad_ncm_pis_cofins.Visible           := True;

    mi_tabelas.Visible                        := True;   { Tabelas  2301 - 2399 }
      mi_tabela_unid_neg.Visible              := True;
      mi_tabela_produto.Visible               := True;
      mi_tabela_grupo_servico.Visible         := True;
      mi_tabela_servico.Visible               := True;
      mi_tabela_evento.Visible                := True;
      mi_tabela_evento_po.Visible             := True;
      mi_tabela_etapa.Visible                 := True;
      mi_tabela_modulo.Visible                := True;
      mi_tabela_arm_rec.Visible               := True;
      mi_tabela_de_para.Visible               := True;

    mi_outros.Visible                         := True;    { Outros  2401 - 2499 }
      mi_tabela_cargo.Visible                 := True;
      mi_cadastro_usuario.Visible             := True;
      mi_muda_usuario.Visible                 := True;
      mi_parametros_sistema.Visible           := True;
      mi_ajuste_impressao_sda_rgs.Visible     := True;
      mi_ajuste_impressao_sda_sp.Visible      := True;
      mi_ajuste_impressao_sda_sts.Visible     := True;
      mi_ajuste_impressao_sda_rj.Visible      := True;
      mi_ajuste_impressao_icms_rgs.Visible    := True;
      mi_ajuste_impressao_icms_sp.Visible     := True;
      mi_ajuste_impressao_exoneracao.Visible  := True;
      mi_ajuste_impressao_gnre.Visible        := True;
      mi_ajuste_impressao_darf.Visible        := True;
      mi_out_ajuste_boleto.Visible            := True;
      mi_out_ajuste_nf_servico.Visible        := True;
      mi_out_integr_contab.Visible            := True;
      mi_out_recontab_fat.Visible             := True;
      mi_out_recontab_fin.Visible             := True;
      mi_out_recontab_ctaapagar.Visible       := True;
      mi_out_nf.Visible                       := True;
      mi_out_release.Visible                  := True;
      mi_out_pesq_log.Visible                 := True;
      mi_out_Atualiza_SISCOMEX.Visible        := True;
      mi_out_integr_po.Visible                := True;
      mi_out_Leitura_PO.Visible               := True;
      mi_out_nf_broker_sap.Visible            := True;
      mi_out_po_sap_broker.Visible            := True;
      mi_out_exp_brok_sap.Visible             := True;
      mi_out_imp_nf_proc.Visible              := True;
      mi_out_exp_retorno.Visible              := True;
      mi_out_edit_doc.Visible                 := True;
      mi_out_integr_di.Visible                := True;
      mi_out_di_padrao.Visible                := True;
      mi_out_di_ddimport.Visible              := True;
      mi_integrao_basf.Visible                := True;
      mi_atualizao_ncm.Visible                := True;
      mi_int_mesquita.Visible                 := True;
      mi_out_ddbroker_ddimport.Visible        := True;
      mi_out_saida_ddimport_followup.Visible  := True;
      mi_out_saida_ddimport_custo.Visible     := True;

    mi_pagto.Visible                          := True;    { Pagamentos 2601 - 2699 }
      mi_pagto_solic.Visible                  := True;
      mi_pagto_montagem.Visible               := True;
      mi_pagto_lib.Visible                    := True;
      mi_pagto_lib_ted.Visible                := True;
      mi_pagto_gera_ted.Visible               := True;
      mi_pagto_imp_cheque.Visible             := True;
      mi_pagto_rel_copia_cheque.Visible       := True;
      mi_pagto_rel_sol_nao_emitidas.Visible   := True;
      mi_pagto_rel_pend.Visible               := True;
      mi_pagto_rel_pagto_pend.Visible         := True;
      mi_pagto_rel_razao.Visible              := True;
      mi_pagto_pesquisa.Visible               := True;
      mi_pagto_rel_pagto.Visible              := True;

    mi_adm.Visible                            := True;    { Pagamentos Administrativos 2701 - 2799 }
      mi_adm_solic.Visible                    := True;
      mi_adm_montagem.Visible                 := True;
      mi_adm_imp_cheque.Visible               := True;
      mi_adm_copias_cheque.Visible            := True;
      mi_adm_pesquisa.Visible                 := True;
      mi_adm_lib_ted.Visible                  := True;
      mi_adm_gera_ted.Visible                 := True;

   mi_integracoes.Visible                     := True;    { Integrações 3201 - 3299}
      mi_int_work_im.Visible                  := True;

   mi_entreposto.Visible                      := True;    { Entreposto 3501 - 3599}
      mi_ent_da.Visible                       := True;
      mi_ent_nac.Visible                      := True;
      mi_ent_ret_da.Visible                   := True;
      mi_ent_ret_da.Visible                   := True;
      mi_ent_rel.Visible                      := True;
      mi_ent_rel_sol_des.Visible              := True;
      mi_ent_rel_sol_desu.Visible             := True;
      mi_ent_rel_plan_des.Visible             := True;

   mi_wallet.visible                          := true;
    miWalletCadastros.visible                 := true;
  end;
end;

procedure Tfrm_senha.HabilitaMenu(Sender:TObject);
var
  vCompMenu : TComponent;
begin
  with frm_main, datm_senha do
  begin
    if ( qry_direitos_IN_ACESSO.AsBoolean ) then
    begin
      // habilita os menus conforme controle de acesso - vitor zanin
      if Trim(qry_direitos_NM_MENU.AsString) <> '' then begin
        if frm_main.FindComponent(qry_direitos_NM_MENU.AsString) <> nil then begin
          TMenuItem(frm_main.FindComponent(qry_direitos_NM_MENU.AsString)).Visible := True;
          vCompMenu := TMenuItem(frm_main.FindComponent(qry_direitos_NM_MENU.AsString)).Parent;
          while TMenuItem(vCompMenu).Parent is TMenuItem do begin
            TMenuItem(vCompMenu).Visible := True;
            vCompMenu := TMenuItem(vCompMenu).Parent
          end;
        end;
      end;

      // botões (não tinha como ser diferente, a não ser que exista tbm um campo para o nome do botao de cada rotina)
      case qry_direitos_CD_ROTINA.AsInteger of
        1834 : begin
                 pnl_InstrucaoDesemb.Visible         := True;
                 mi_Instrucao_desemb.ShortCut        := ShortCut(Word('I'), [ssCtrl]);
               end;
        1801 : begin
                 pnl_po.Visible                      := True;
                 mi_PO.ShortCut:= ShortCut(Word('P'), [ssCtrl]);
               end;
        1901 : begin
                 pnl_pe.Visible                      := True;
               end;
        0102 : begin
                 mi_manutencao_processo.ShortCut:= ShortCut(VK_F2,[]);
                 pnl_manut_proc.Visible              := True;
                 lManutProc                          := True;
                 Application.CreateForm(Tfrm_manut_proc, frm_manut_proc);
               end;
        0110 : begin
                 mi_realizacao_processo.ShortCut:= ShortCut(VK_F2, [ssCtrl]);
                 pnl_proc_realiza.Visible            := True;
               end;
        0201 : begin
                 mi_di.ShortCut:= ShortCut(VK_F4,[]);

                 pnl_di.Visible                      := True;
               end;
        2001 : begin
                 mi_Exp.ShortCut:= ShortCut(Word('E'),[ssCtrl]);
               end;
        0303 : begin
                 mi_li.ShortCut:= ShortCut(VK_F3,[]);
                 pnl_li.Visible                      := True;
               end;
        0504 : begin
                 mi_notificacao.ShortCut := ShortCut(VK_F4,[ssCtrl]);
                 pnl_solinum.Visible                 := True;
               end;
        0601 : begin
                 mi_rec_num_solicitado.ShortCut:= ShortCut(VK_F3,[ssCtrl]);
                 pnl_recnum.Visible                  := True;
               end;
        0901 : begin
                 mi_sda_distr.ShortCut               := ShortCut(VK_F7,[]);
                 pnl_sda.Visible                     := True;
               end;
        1101 : begin
                 mi_fat_lanc.ShortCut:= ShortCut(VK_F10,[]);
                 pnl_fat_cc.Visible                  := True;
               end;
        1102 : begin
                 mi_fat_sol.ShortCut:= ShortCut(VK_F12,[]);
                 pnl_fat_sol.Visible                 := True;
               end;
        1201 : begin
                 mi_fin_lanc.ShortCut:= ShortCut(VK_F9,[]);
                 pnl_fin.Visible                     := True;
               end;
        1301 : begin
                 pnl_ch_branco.Visible               := True;
               end;
        1401 : begin
                 mi_liquidacao.ShortCut:= ShortCut(VK_F11,[]);
                 pnl_liq.Visible                     := True;
               end;
        0204 : begin
                  pnl_di_conferencia. Visible        := True;
               end;

        2022 : begin
                  pnl_dde.Visible                    := True;
               end;
        2017 : begin
                  pnl_re.Visible                    := True;
               end;
        2413 : mi_out_edit_doc.Visible               := FileExists( cDir_Rpt + '\DDEDITMOD.EXE' );
        2494 : mi_out_nf.Visible                     := FileExists( cDir_Rpt + '\NFEXPORT.EXE' );
        2601 : begin
                 mi_pagto_solic.ShortCut:= ShortCut(VK_F7,[ssCtrl]);
                 pnl_pagto.Visible                   := True;
               end;
      end;
    end;
  end;
end;

procedure Tfrm_senha.AtribuiDireitos(Sender: TObject);
begin
  with datm_senha do
  begin
    qry_direitos_.Close;
    qry_direitos_.Prepare;
    qry_direitos_.Open;
    if qry_direitos_.Recordcount = 1 then
      if BoxMensagem( 'Você não recebeu habilitação para as rotinas do sistema!!!'+
                      #13+'Procure o supervisor do sistema.', 3 ) then
        begin
          edt_senha.Text := '';
          lControle_Acesso := False;
        end;

    qry_direitos_po_.Close;
    qry_direitos_po_.ParamByName('CD_CARGO').AsString := qry_direitos_CD_CARGO.AsString;
    qry_direitos_po_.Prepare;
    qry_direitos_po_.Open;

//    if qry_direitos_po_.RecordCount > 0 then
//       Esq := 45;

    qry_direitos_pe_.Close;
    qry_direitos_pe_.ParamByName('CD_CARGO').AsString := qry_direitos_CD_CARGO.AsString;
    qry_direitos_pe_.Prepare;
    qry_direitos_pe_.Open;

    if qry_direitos_pe_.RecordCount > 0 then
    begin
//      If Esq = 45 then
//         Esq := 85
//      Else
//         Esq := 45
    end;

    qry_direitos_.First;
    while Not qry_direitos_.EOF do
    begin
      HabilitaMenu( Sender );
      qry_direitos_.Next;
    end;

    qry_direitos_.Close;
    qry_direitos_po_.Close;
    qry_direitos_pe_.Close;

  end;
end;

procedure Tfrm_senha.btn_OkClick(Sender: TObject);
var
  Reg   : TRegistry;
  Versao, Arquivo: String;
  login, qtTentativas : Integer;
begin

  if ( UpperCase( edt_nome_usuario.Text ) = 'SA' ) and ( edt_senha.Text <> str_Senha_Mestra ) then
  begin
    BoxMensagem( 'Usuário não permitido' , 2 );
    Close;
    Exit;
  end;

  Reg := TRegistry.Create;           //Consulta de registro no Regedit, retorna ( True ou False )
  with Reg do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey( '\SOFTWARE\DDBROKER\NOVAVERSAO', False ) then
    begin
      Versao := Reg.ReadString(nr_versao);
      if Versao = '' then
        WriteString(nr_versao, 'True')
      else if Versao = 'True' then
        frm_main.pnlRelease.Color := $00F4FF28
    end
    else
      frm_main.pnlRelease.ParentColor := True;
    CloseKey;
  end;

  frm_main.btn_release.Visible := True;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  { default - usuario não acessa o BROKER }
  lControle_Acesso := False;

  { Tira a visibilidade da Senha de entrada de senha. }
  Hide;

  Application.ProcessMessages;

// verificação de senha

  with datm_main, datm_senha do
  begin
    with db_broker do
    begin
      if Connected then
        Connected := False;

      db_broker.Params[0] := 'USER NAME=SA';
      db_broker.Params[1] := 'PASSWORD=123';
    end;

   { if UpperCase( edt_nome_usuario.Text ) <> 'SA' then
    begin
      CloseStoredProc(sp_verifica_login);
      sp_verifica_login.ParamByName('@login').AsString := edt_nome_usuario.Text;
      ExecStoredProc(sp_verifica_login);
      login := sp_verifica_login.ParamByName('Result').AsInteger;
      CloseStoredProc(sp_verifica_login);

      if login <> 0 then
      begin
        BoxMensagem( 'Este Usuário já está utilizando o sistema!!!' , 2 );
        Show;
        Exit;
      end;
    end;}

   // with db_broker do
   //   if Connected then
   //     Connected := False;

    if   ( UpperCase( edt_nome_usuario.Text ) = 'SA' )
     and ( UpperCase( edt_senha.Text ) = str_Senha_Mestra ) then
    begin
      db_broker.Params[0]  := 'USER NAME=SA';
      db_broker.Params[1]  := 'PASSWORD=123';
    end
    else
    begin
      db_broker.Params[0]  := 'USER NAME=' + edt_nome_usuario.Text;
      db_broker.Params[1]  := 'PASSWORD='  + edt_senha.Text;
    end;

    try
      Application.ProcessMessages;
      if ( UpperCase( edt_nome_usuario.Text ) = 'SA' ) and
         ( UpperCase( edt_senha.Text ) = str_Senha_Mestra ) then
      begin
        Rotina_Senha_Mestra;
        str_cd_usuario                   := '0000';
        str_senha_usuario                := '123';
        str_nm_usuario                   := 'Supervisor Geral';
        str_ap_usuario                   := 'SA';
        str_cd_cargo                     := '000';
        str_cd_unid_neg                  := '01';
        str_cd_produto                   := '01';
        in_aviso_po                      := '0';
        frm_main.lbl_nm_unid_neg.Caption := 'São Paulo';
        frm_main.lbl_nm_usuario.Caption  := 'Super-Usuário';
        lControle_Acesso                 := True;

        Close;

        if Not db_broker.Connected then
          db_broker.Connected := True;

        Exit;
      end;

        if Not db_broker.Connected then
          db_broker.Connected := True;      

      qry_usuario_.Close;
      qry_usuario_.ParamByName('AP_USUARIO').AsString := UpperCase( edt_nome_usuario.Text ) ;
      qry_usuario_.Prepare;
      qry_usuario_.Open;

      //verifica se o usuario está bloqueado
      qtTentativas := ((qry_usuario_.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger -
                        qry_usuario_.FieldByName('QT_SENHA_INCORRETA').asinteger));

      if qtTentativas <= 0 then
      begin
        MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtInformation, [mbOk], 0);
        Show;
        Exit;
      end;


      qry_habilitacao_.Close;
      qry_habilitacao_.Prepare;
      qry_habilitacao_.Open;

      Application.ProcessMessages;

      // Alteração de senha
      if edt_senha_nova.Text <> '' then
      begin
        if ( edt_senha_nova.Text = edt_confirma_senha.Text ) and ( str_cd_usuario = '' ) then
        begin
          if ( edt_senha_nova.Text = edt_senha.Text ) then
          begin
            BoxMensagem ('A nova senha deve ser diferente da senha atual!', 2);
            edt_senha_nova.text     := '';
            edt_confirma_senha.text := '';
            Show;
            Exit;
          end
          else
          if length(edt_senha_nova.Text) < 10  then
          begin
            MessageDlg('A senha deve ter pelo menos 10 caracteres.', mtInformation, [mbOk], 0);
            Show;
            edt_senha_nova.SetFocus;
            Exit;
          end
          else
          if not ValidaCaracteresSenha(edt_senha_nova.Text, 'Upper') then
          begin
            MessageDlg('A senha deve conter pelo menos um caracter maiúsculo.', mtInformation, [mbOk], 0);
            Show;
            edt_senha_nova.SetFocus;
            Exit;
          end
          else
          if not ValidaCaracteresSenha(edt_senha_nova.Text, 'Lower') then
          begin
            MessageDlg('A senha deve conter pelo menos um caracter minúsculo.', mtInformation, [mbOk], 0);
            Show;
            edt_senha_nova.SetFocus;
            Exit;
          end
          else
          if not ValidaCaracteresSenha(edt_senha_nova.Text, 'Numero') then
          begin
            MessageDlg('A senha deve conter pelo menos um numero.', mtInformation, [mbOk], 0);
            Show;
            edt_senha_nova.SetFocus;
            Exit;
          end
          else
          if not ValidaCaracteresSenha(edt_senha_nova.Text, 'Especial') then
          begin
            MessageDlg('A senha deve conter pelo menos um caracter especial.', mtInformation, [mbOk], 0);
            Show;
            edt_senha_nova.SetFocus;
            Exit;
          end
          else
          begin
            try
              with datm_main.db_broker do
              begin
                if Connected then Connected := False;
                Params[0] := 'USER NAME=SA';
                Params[1] := 'PASSWORD=123';
              end;

              CloseStoredProc(datm_senha.sp_password);
              datm_senha.sp_password.ParamByName('@senha_old').AsString := edt_senha.Text;
              datm_senha.sp_password.ParamByName('@senha_new').AsString := edt_senha_nova.Text;
              datm_senha.sp_password.ParamByName('@usuario').AsString   := edt_nome_usuario.Text;
              ExecStoredProc(datm_senha.sp_password);
              CloseStoredProc(datm_senha.sp_password);

              with TQuery.Create(application) do
              begin
                Databasename := 'DBBROKER';
                SQL.Clear;
                SQL.Add('UPDATE TUSUARIO SET DT_ULT_ALT_SENHA = GETDATE() WHERE AP_USUARIO = ''' + edt_nome_usuario.Text + '''');
                ExecSQL;
                Free;
              end;
            except
              on E: Exception do
              begin
                TrataErro(E);
              end;
            end;
            //envia email
            EnviaEmail(edt_nome_usuario.Text, edt_senha.Text, edt_senha_nova.Text);
            edt_senha.Text := edt_senha_nova.Text;
          end
        end
        else
        begin
          if str_cd_usuario <> '' then
          begin
             BoxMensagem('Não é permitido alterar a senha estando já logado.',2);
             edt_senha_nova.text     := '';
             edt_confirma_senha.text := '';
             Show;
             Exit;
          end;

          BoxMensagem ('A confirmação da nova senha está errada, tente novamente!', 2);
          edt_confirma_senha.text := '';
          Show;
          Exit;
        end;
      end;
      // fim alteração de senha
    except
      on e: Exception do
      begin
      //se cair aqui, é porque deu erro na conexao
      with datm_main.db_broker do
      begin
        if Connected then
          Connected := False;

        Params[0] := 'USER NAME=SA';
        Params[1] := 'PASSWORD=123';
      end;

      qry_usuario_.Close;
      qry_usuario_.ParamByName('AP_USUARIO').AsString := UpperCase( edt_nome_usuario.Text ) ;
      qry_usuario_.Prepare;
      qry_usuario_.Open;

      //verifica se o usuario está bloqueado
      qtTentativas := ((qry_usuario_.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger -
                        qry_usuario_.FieldByName('QT_SENHA_INCORRETA').asinteger));

      if qttentativas > 0 then
      begin
        with TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Add(' UPDATE TUSUARIO                                       '+
                  '    SET QT_SENHA_INCORRETA = QT_SENHA_INCORRETA + 1    '+
                  '   FROM TUSUARIO (NOLOCK)                              '+
                  '  WHERE AP_USUARIO = '''+ UpperCase( edt_nome_usuario.Text ) +''' ');
          prepare;
          ExecSql;
          Free;
        end;
      end;

      if qtTentativas-1 <= 0 then
      begin
        MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtInformation, [mbOk], 0);
        Show;
        Exit;
      end
      else
      begin
        MessageDlg('Erro efetuando login.'+#13+
                   'Verifique seu login e senha.'+#13+
                   'Quantidade de tentativas restantes: '+inttostr(qtTentativas-1) +#13+ e.Message, mtError, [mbOk], 0);
        Show;
        exit;
      end;
     { if nTentativas < 2 then
      begin
        BoxMensagem( 'Senha atual inválida.' + #13 + 'Tente novamente !!!' , 2 );
        Inc( nTentativas );
        Show;
        Exit;
      end
      else
      begin
        BoxMensagem( 'Senha inválida.' + #13 + 'Número de tentativas esgotou!' , 3 );
        Close;
        Exit;
      end; }
      end;
    end;

    if Not db_broker.Connected then
      db_broker.Connected := True;
    { A Query traz o direitos de acesso do usuário }

    qry_usuario_.Close;
    qry_usuario_.ParamByName('AP_USUARIO').AsString := UpperCase( edt_nome_usuario.Text ) ;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    //verifica se o usuario está bloqueado
    qtTentativas := ((qry_usuario_.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger -
                      qry_usuario_.FieldByName('QT_SENHA_INCORRETA').asinteger));

    if qtTentativas <= 0 then
    begin
      MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtInformation, [mbOk], 0);
      Show;
      Exit;
    end
    else
    begin
      if qtTentativas <> qry_usuario_.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger then
        with TQuery.Create(Application) do
        begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Add(' UPDATE TUSUARIO                '+
                  '    SET QT_SENHA_INCORRETA = 0  '+
                  '   FROM TUSUARIO (NOLOCK)       '+
                  '  WHERE AP_USUARIO = '''+ UpperCase( edt_nome_usuario.Text ) +''' ');
          prepare;
          ExecSql;
          Free;
        end;
    end;

    qry_habilitacao_.Close;
    qry_habilitacao_.Prepare;
    qry_habilitacao_.Open;
    Application.ProcessMessages;

    if qry_usuario_.Recordcount > 0 then
    begin
      // IF abaixo comentado para não fazer mais a validação de alteração de senha,
      //o myIndaiá Login faz esta validação agora - Michel - 18/05/2011
      //if qry_usuario_.FieldByName('EXPIROU').AsString = '0' then
      begin
        { Verifica se o usuário esta ativo no GSM }
        if qry_usuario_IN_ATIVO.AsString = '1' then
        begin
          { Verifica se existe Habilitação Ativa }
          if qry_habilitacao_.RecordCount >  0 then
          begin
            Application.ProcessMessages;
            with frm_main do
            begin
              { Salva informações do usuário nas variáveis globais do sistema }
              str_cd_usuario          := qry_usuario_CD_USUARIO.AsString;
              if edt_confirma_senha.Text <> '' then
                 str_senha_usuario    := edt_confirma_senha.Text
              else
                 str_senha_usuario    := edt_senha.Text;
              str_cd_cargo            := qry_usuario_CD_CARGO.AsString;
              str_nm_usuario          := qry_usuario_NM_USUARIO.AsString;
              str_ap_usuario          := qry_usuario_AP_USUARIO.AsString;
              in_aviso_po             := qry_usuario_IN_AVISO_PO.AsString;
              str_cd_unid_neg         := qry_habilitacao_CD_UNID_NEG.AsString;
              str_nm_unid_neg         := qry_habilitacao_AP_UNID_NEG.AsString;
              str_cd_produto          := qry_habilitacao_CD_PRODUTO.AsString;
              lbl_nm_unid_neg.Caption := str_nm_unid_neg;
              lbl_nm_usuario.Caption  := str_ap_usuario;
              lbl_data_atual.Caption  := Copy( DateTimeToStr( dt_server ), 1, 10 );
  //            lbl_hora_atual.Caption  := Copy( TimeToStr( hr_server ), 1, 5 );

              {Parametros da Unidade Padrão}
              with datm_main do
              begin
                qry_param_unid_neg_.Close;
                qry_param_unid_neg_.ParamByName('CD_UNID_NEG').asString := str_cd_unid_neg;
                qry_param_unid_neg_.Prepare;
                qry_param_unid_neg_.Open;

                cDir_Rpt := Trim( qry_param_unid_neg_PATH_RELATORIOS.AsString );
                cDir_Scx := Trim( qry_param_unid_neg_PATH_SISCOMEX.AsString );
                cDir_Rei := Trim( qry_param_unid_neg_PATH_REI.AsString );

                qry_param_unid_neg_.Close;
              end;

              { Esta rotina habilita os itens do menu que o usuário pode ver }
              AtribuiDireitos(Sender);
              Application.ProcessMessages;

              {Avisos PO}
              if in_aviso_po = '1' then
              begin
                Application.CreateForm( Tfrm_lembrete_po, frm_lembrete_po );
                frm_lembrete_po.Show;
              end;
            end;
            lControle_Acesso := True;
          end
          else
            BoxMensagem( 'Usuário não tem habilitação ativa.', 3 );
        end
        else
          BoxMensagem( 'Usuário está inativo.', 3 );
      end
      // ELSE abaixo comentado para não fazer mais a validação de alteração de senha,
      // o myIndaiá Login faz esta validação agora - Michel - 18/05/2011
      {else
      begin
        BoxMensagem( 'Sua senha não foi alterada nos últimos ' + ConsultaLookUPSQL('SELECT QT_DIAS_SENHA FROM TPARAMETROS','QT_DIAS_SENHA') + ' dias.' + #13 + 'Para prosseguir, evitando futuros problemas, favor alterá-la imediatamente!' + #13 + 'Essa alteração servirá também para o seu acesso ao myIndaiáWeb!' , 3 );
        db_broker.Connected := False;
        Show;
        Exit
      end}
    end
    else
    begin
      //agatha- acho dificil entrar nesse else. só se o usuario nao existir na tabela, mas existir no banco.

      if nTentativas < 2 then
      begin
        BoxMensagem( 'Senha inválida.' + #13 + 'Tente novamente !!!' , 2 );
        Inc( nTentativas );
        Show;
        Exit
      end
      else
        BoxMensagem( 'Senha inválida.' + #13 + 'Número de tentativas esgotou!' , 3 );
    end;
    qry_usuario_.Close;
  end;

  Application.ProcessMessages;
  btn_ok.Enabled := False;
  Close;
  vLogado := True; // Adicionado para não exibir a tela de login quando logado - Michel - 01/12/2008
  SetForegroundWindow(frm_main.Handle);
  frm_main.ReiniciaCloser;
end;

procedure Tfrm_senha.btn_cancelarClick(Sender: TObject);
begin
  lControle_Acesso := False;
  Close;
end;

procedure Tfrm_senha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  begin
    lControle_ACesso := False;
    Close;
  end;
end;

procedure Tfrm_senha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_senha.Destroy;
  Action := caFree;
end;

procedure Tfrm_senha.FormCreate(Sender: TObject);
begin
  { Passa controle ao Windows }
  Application.ProcessMessages;
  { Inicializa o Data Module para Senha }
  Application.CreateForm(Tdatm_senha, datm_senha);
  { Inicializa o numero de digitações erradas da senha permitidas. }
  nTentativas := 0; 
//  Esq := 5;
  vLogado := False; // Adicionado para não exibir a tela de login quando logado - Michel - 01/12/2008
end;

procedure Tfrm_senha.edt_senhaEnter(Sender: TObject);
begin
  edt_senha.Text := '';
end;

procedure Tfrm_senha.edt_nome_usuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
    btn_OkClick(btn_Ok);
end;

procedure Tfrm_senha.EnviaEmail(vNm_usuario, vSenhaAntiga, vSenhaNova: String);
{var
  vIdMessage : TIdMessage;
  vIdSmtp    : TIdSMTP;
  vData       : String;}
begin
  GSMLIB.EnviaEmail(' [MyIndaiá] Alteração de Senha - ' + vNm_usuario,
     ' '#13 +
     ' Dados do Usuário '#13 +
     ' Usuário: ' + vNm_usuario + ''#13 +
     ' Senha Antiga: ' + vSenhaAntiga + ''#13 +
     ' Senha Nova: ' + vSenhaNova + ''#13 +
     ' Data da Alteração: ' + DatetoStr(Date) + '', 'myindaia@myindaia.com.br', []);

  {vIdMessage := TIdMessage.Create(Application);
  vIdSmtp    := TIdSMTP.Create(Application);
  vData      := DatetoStr(date);

  with vIdMessage do
  begin
    Body.Add(' ');
    Body.Add(' Dados do Usuário ');
    Body.Add(' Usuário: ' + vNm_usuario + '');
    Body.Add(' Senha Antiga: ' + vSenhaAntiga + '');
    Body.Add(' Senha Nova: ' + vSenhaNova + '');
    Body.Add(' Data da Alteração: ' + vData + '');
    From.Text := 'ti@myindaia.com.br';
    ReplyTo.EMailAddresses := 'ti@myindaia.com.br';
    Recipients.EMailAddresses := 'myindaia@myindaia.com.br';
    Subject :=  ' [MyIndaiá] Alteração de Senha - ' + vNm_usuario;
    vIdSmtp.Host := 'mail.indaialogistica.com.br';
    vIdSmtp.Port := 25;
    vIdSmtp.Connect;
    vIdSmtp.Send(vIdMessage);
    vIdSmtp.Disconnect;
    MessageParts.Clear;
    Clear;
  end;
  vIdMessage.Free;}
end;

function Tfrm_senha.ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;
var
  i: integer;
  achou : Boolean;
begin
  achou := false;
  for i := 1 to Length(s) do
  begin
    case s[i] of
      'A'..'Z':begin
                  if tipoValida = 'Upper' then
                    achou := true
               end;

      'a'..'z': begin
                  if tipoValida = 'Lower' then
                    achou := true
                end;

      '0'..'9': begin
                  if tipoValida = 'Numero' then
                    achou := true;
                end;

      '[', ']', '!', '@',
      '#', '$', '%', '^',
      '&', '*', '(', ')',
      '_', '+', '-', '=',
      '{', '}', ';', '''',
      ':', '"', '\', '/',
      '|', ',', '<', '>',
      '.', '?' : begin
                   if tipoValida = 'Especial' then
                    achou := true;
                 end;
    end;
    
    if achou then
      break;
  end;

  Result := achou;
end;
end.
