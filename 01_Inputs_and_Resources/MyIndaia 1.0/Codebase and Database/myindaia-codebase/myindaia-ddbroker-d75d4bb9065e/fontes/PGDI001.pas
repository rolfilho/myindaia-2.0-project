(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGDI001.PAS - Capa da Declaração de Importação
AUTOR: Leandro Stipanich
DATA: dd/mm/yyyy                     0101IM-7645-08
Manutenção: Vítor Zanin - Sandra Jardim - Rodrigo Capra - Alexandre Neto
*************************************************************************************************)

unit PGDI001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids, Tabs, Funcoes, cxControls, cxContainer,
  cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit, StrUtils, ServicoNovo,
  FormsLog, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, KrUtil; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tfrm_DI_capa = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pgctrl_capa_di: TPageControl;
    tbsht_importador_TD01: TTabSheet;
    tbsht_importador_TD14: TTabSheet;
    tbsht_basicas_TD01: TTabSheet;
    lbl_urf_despacho1: TLabel;
    btn_co_urf_despacho1: TSpeedButton;
    dbedt_cd_urf_despacho1: TDBEdit;
    dbedt_nm_urf_despacho1: TDBEdit;
    tbsht_Transporte_aereo: TTabSheet;
    lbl_transportador1: TLabel;
    btn_co_transportador1: TSpeedButton;
    lbl_bandeira1: TLabel;
    lbl_doc_chegada_carga1: TLabel;
    dbedt_cd_transportador1: TDBEdit;
    dbedt_nm_transportador1: TDBEdit;
    grpbox_conhecimento_transporte1: TGroupBox;
    lbl_identif_master1: TLabel;
    lbl_identif_conhecimento1: TLabel;
    lbl_dt_embarque1: TLabel;
    lbl_local_embarque1: TLabel;
    dbedt_nr_doc_carga1: TDBEdit;
    dbedt_nr_doc_carga_master1: TDBEdit;
    dbedt_dt_embarque1: TDBEdit;
    rbtn_termo_entrada1: TRadioButton;
    rbtn_dta1: TRadioButton;
    dbedt_identificacao1: TDBEdit;
    tbsht_Transporte_Maritimo: TTabSheet;
    lbl_transportador2: TLabel;
    btn_co_transportador2: TSpeedButton;
    lbl_nm_embarcacao2: TLabel;
    lbl_doc_chegada_carga2: TLabel;
    dbedt_cd_transportador2: TDBEdit;
    dbedt_nm_transportador2: TDBEdit;
    dbedt_nm_embarcacao2: TDBEdit;
    grpbox_conhecimento_transporte2: TGroupBox;
    lbl_identif_master2: TLabel;
    lbl_identif_conhecimento2: TLabel;
    lbl_dt_embarque2: TLabel;
    lbl_local_embarque2: TLabel;
    dbedt_nr_doc_carga2: TDBEdit;
    dbedt_nr_doc_carga_master2: TDBEdit;
    dbedt_dt_embarque2: TDBEdit;
    tbsht_Transporte_Rodoviario: TTabSheet;
    lbl_placa_veiculo3: TLabel;
    dbedt_nr_placa_veiculo3: TDBEdit;
    grpbox_conhecimento_transporte3: TGroupBox;
    lbl_identif_CRT3: TLabel;
    lbl_dt_embarque3: TLabel;
    lbl_local_embarque3: TLabel;
    dbedt_nr_doc_carga3: TDBEdit;
    dbedt_dt_embarque3: TDBEdit;
    tbsht_Transporte_Ferroviario: TTabSheet;
    btn_co_transportador4: TSpeedButton;
    lbl_transportador4: TLabel;
    dbedt_nm_transportador4: TDBEdit;
    dbedt_cd_transportador4: TDBEdit;
    grpbox_conhecimento_transporte4: TGroupBox;
    lbl_identif_master4: TLabel;
    lbl_identif_conhecimento4: TLabel;
    lbl_dt_embarque4: TLabel;
    lbl_local_embarque4: TLabel;
    dbedt_nr_doc_carga4: TDBEdit;
    dbedt_nr_doc_carga_master4: TDBEdit;
    dbedt_dt_embarque4: TDBEdit;
    tbsht_Transporte_Postal: TTabSheet;
    bvl_postal5: TBevel;
    lbl_codigo_barra5: TLabel;
    lbl_dt_postagem5: TLabel;
    lbl_local_postagem: TLabel;
    lbl_obs5: TLabel;
    dbedt_cd_barra5: TDBEdit;
    dbedt_dt_postagem5: TDBEdit;
    tbsht_Transporte_Fluvial: TTabSheet;
    lbl_cd_transportador6: TLabel;
    btn_co_transportador6: TSpeedButton;
    dbedt_cd_transportador6: TDBEdit;
    dbedt_nm_transportador6: TDBEdit;
    grpbox_conhecimento_transporte6: TGroupBox;
    lbl_identif_master6: TLabel;
    lbl_identif_conhecimento6: TLabel;
    lbl_dt_embarque6: TLabel;
    lbl_local_embarque6: TLabel;
    tbsht_Transporte_Lacustre: TTabSheet;
    lbl_transportador7: TLabel;
    btn_co_transportador7: TSpeedButton;
    dbedt_cd_transportador7: TDBEdit;
    dbedt_nm_transportador7: TDBEdit;
    grpbox_conhecimento_transporte7: TGroupBox;
    lbl_identif_master7: TLabel;
    lbl_identif_conhecimento7: TLabel;
    lbl_dt_embarque7: TLabel;
    lbl_local_embarque7: TLabel;
    dbedt_nr_doc_carga7: TDBEdit;
    dbedt_nr_doc_carga_master7: TDBEdit;
    dbedt_dt_embarque7: TDBEdit;
    tbsht_Transporte_Meios_Proprios: TTabSheet;
    lbl_local_embarque8: TLabel;
    lbl_dt_embarque8: TLabel;
    lbl_obs8: TLabel;
    bvl_meios_proprios8: TBevel;
    tbsht_Transporte_Tubo_Coduto: TTabSheet;
    bvl_tubo_conduto9: TBevel;
    lbl_local_embarque9: TLabel;
    lbl_dt_embarque9: TLabel;
    lbl_obs9: TLabel;
    dbedt_dt_embarque9: TDBEdit;
    tbsht_basicas_TD02: TTabSheet;
    lbl_urf_despacho2: TLabel;
    dbedt_cd_urf_despacho2: TDBEdit;
    dbedt_nm_urf_despacho2: TDBEdit;
    btn_co_urf_despacho2: TSpeedButton;
    tbsht_basicas_TD13: TTabSheet;
    lbl_urf_despacho3: TLabel;
    dbedt_cd_urf_despacho3: TDBEdit;
    dbedt_nm_urf_despacho3: TDBEdit;
    btn_co_urf_despacho3: TSpeedButton;
    tbsht_carga_TD01: TTabSheet;
    pgctrl_carga1: TPageControl;
    tbsht_carga_TD01_Page11: TTabSheet;
    tbsht_carga_Page2: TTabSheet;
    lbl_pais_procedencia1: TLabel;
    dbedt_cd_pais_procedencia1: TDBEdit;
    dbedt_nm_pais_procedencia1: TDBEdit;
    btn_co_pais_procedencia1: TSpeedButton;
    lbl_urf_entrada_pais1: TLabel;
    dbedt_cd_urf_entrada_pais1: TDBEdit;
    dbedt_nm_urf_entrada_pais1: TDBEdit;
    btn_co_urf_entrada1: TSpeedButton;
    lbl_dt_chegada1: TLabel;
    dbedt_dt_chegada1: TDBEdit;
    lbl_agente_transportador1: TLabel;
    dbedt_agente_transportador1: TDBEdit;
    lbl_peso_bruto1: TLabel;
    dbedt_peso_bruto1: TDBEdit;
    lbl_peso_liquido1: TLabel;
    dbedt_peso_liquido1: TDBEdit;
    grpbox_op_fundap1: TGroupBox;
    grpbox_op_cambial1: TGroupBox;
    lbl_cnpj_op_cambial1: TLabel;
    dbedt_cnpj_consignatario1: TDBEdit;
    grpbox_vl_tot_mle1: TGroupBox;
    lbl_moeda_mle1: TLabel;
    dbedt_cd_moeda_mle1: TDBEdit;
    btn_co_moeda_mle1: TSpeedButton;
    lbl_vl_real_mle1: TLabel;
    dbedt_vl_real_mle1: TDBEdit;
    lbl_vl_moeda_mle1: TLabel;
    dbedt_vl_moeda_mle1: TDBEdit;
    grpbox_frete_tot1: TGroupBox;
    lbl_moeda_frete1: TLabel;
    btn_co_moeda_frete1: TSpeedButton;
    lbl_frete_collect: TLabel;
    lbl_frete_prepaid: TLabel;
    dbedt_cd_moeda_frete1: TDBEdit;
    dbedt_vl_frete_collect1: TDBEdit;
    dbedt_vl_frete_prepaid1: TDBEdit;
    lbl_frete_terr_nacional: TLabel;
    dbedt_vl_frete_terr_nacional1: TDBEdit;
    dbedt_vl_real_frete_collect1: TDBEdit;
    lbl_vl_real_frete_collect1: TLabel;
    grpbox_seguro_tot1: TGroupBox;
    lbl_moeda_seguro1: TLabel;
    dbedt_cd_moeda_seguro1: TDBEdit;
    btn_co_moeda_seguro1: TSpeedButton;
    lbl_vl_moeda_seguro1: TLabel;
    dbedt_vl_moeda_seguro1: TDBEdit;
    lbl_vl_real_seguro1: TLabel;
    dbedt_vl_real_seguro1: TDBEdit;
    tbsht_carga_TD16: TTabSheet;
    tbsht_carga_TD18: TTabSheet;
    tbsht_pagamento: TTabSheet;
    tbsht_informacoes_complementares: TTabSheet;
    tbsht_importador_TD05: TTabSheet;
    lbl_importador1: TLabel;
    dbedt_cd_importador1: TDBEdit;
    dbedt_nm_importador1: TDBEdit;
    btn_co_importador1: TSpeedButton;
    lbl_tipo_declaracao1: TLabel;
    dbedt_cd_tipo_declaracao1: TDBEdit;
    dbedt_nm_tipo_declaracao1: TDBEdit;
    btn_co_tipo_declaracao1: TSpeedButton;
    lbl_tipo_declaracao2: TLabel;
    dbedt_cd_tipo_declaracao2: TDBEdit;
    dbedt_nm_tipo_declaracao2: TDBEdit;
    btn_co_tipo_declaracao2: TSpeedButton;
    lbl_importador2: TLabel;
    dbedt_cd_importador2: TDBEdit;
    dbedt_nm_importador2: TDBEdit;
    btn_co_importador2: TSpeedButton;
    lbl_tipo_declaracao3: TLabel;
    dbedt_cd_tipo_declaracao3: TDBEdit;
    dbedt_nm_tipo_declaracao3: TDBEdit;
    btn_co_tipo_declaracao3: TSpeedButton;
    lbl_importador3: TLabel;
    dbedt_cd_importador3: TDBEdit;
    dbedt_nm_importador3: TDBEdit;
    btn_co_importador3: TSpeedButton;
    tbsht_importador_TD04: TTabSheet;
    lbl_tipo_declaracao4: TLabel;
    dbedt_cd_tipo_declaracao4: TDBEdit;
    dbedt_nm_tipo_declaracao4: TDBEdit;
    btn_co_tipo_declaracao4: TSpeedButton;
    lbl_importador4: TLabel;
    dbedt_cd_importador4: TDBEdit;
    dbedt_nm_importador4: TDBEdit;
    btn_co_importador4: TSpeedButton;
    dbchkbox_transporte_multimodal1: TDBCheckBox;
    dbchkbox_transporte_multimodal2: TDBCheckBox;
    dbchkbox_transporte_multimodal3: TDBCheckBox;
    dbchkbox_transporte_multimodal4: TDBCheckBox;
    dbchkbox_transporte_multimodal6: TDBCheckBox;
    dbchkbox_transporte_multimodal7: TDBCheckBox;
    lbl_transportador3: TLabel;
    dbedt_cd_transportador3: TDBEdit;
    dbedt_nm_transportador3: TDBEdit;
    btn_co_transportador3: TSpeedButton;
    dbchkbox_op_fundap1: TDBCheckBox;
    grpbox_tipo_importador1: TGroupBox;
    rbtn_pessoa_juridica1: TRadioButton;
    rbtn_pessoa_fisica_pais1: TRadioButton;
    rbtn_pessoa_fisica_exterior1: TRadioButton;
    rbtn_missao_diplomatica1: TRadioButton;
    grpbox_tipo_importador2: TGroupBox;
    rbtn_pessoa_juridica2: TRadioButton;
    rbtn_pessoa_fisica_pais2: TRadioButton;
    rbtn_missao_diplomatica2: TRadioButton;
    grpbox_tipo_importador3: TGroupBox;
    rbtn_pessoa_juridica3: TRadioButton;
    rbtn_missao_diplomatica3: TRadioButton;
    Label1: TLabel;
    dbg_doc_instrucao_despacho1: TDBGrid;
    Label2: TLabel;
    dbg_proc_vinculado1: TDBGrid;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    DBGrid3: TDBGrid;
    Label6: TLabel;
    DBGrid4: TDBGrid;
    dbedt_cd_bandeira_transp_itl: TDBEdit;
    dbedt_nm_bandeira_transp_itl: TDBEdit;
    btn_co_pais4: TSpeedButton;
    dbedt_cd_local_embarque1: TDBEdit;
    dbedt_nm_local_embarque1: TDBEdit;
    btn_co_local_embarque1: TSpeedButton;
    Label7: TLabel;
    dbedt_cd_bandeira_transp_itl2: TDBEdit;
    dbedt_nm_bandeira_transp_itl2: TDBEdit;
    btn_co_pais1: TSpeedButton;
    dbedt_cd_local_embarque2: TDBEdit;
    dbedt_nm_local_embarque2: TDBEdit;
    btn_co_local_embarque2: TSpeedButton;
    dbedt_nm_embarcacao6: TDBEdit;
    dbedt_nr_doc_carga6: TDBEdit;
    dbedt_nr_doc_carga_master6: TDBEdit;
    dbedt_cd_local_embarque6: TDBEdit;
    dbedt_nm_local_embarque6: TDBEdit;
    btn_co_local_embarque6: TSpeedButton;
    dbedt_dt_embarque6: TDBEdit;
    Label11: TLabel;
    dbedt_nm_embarcacao7: TDBEdit;
    dbg_transporte_fluvial: TDBGrid;
    dbg_transporte_lacustre: TDBGrid;
    dbg_transporte_aereo: TDBGrid;
    dbg_transporte_postal: TDBGrid;
    dbg_transporte_ferroviario: TDBGrid;
    dbg_transporte_rodoviario: TDBGrid;
    dbg_transporte_tubo_conduto: TDBGrid;
    dbg_transporte_meios_proprios: TDBGrid;
    dbedt_cd_local_postagem5: TDBEdit;
    dbedt_nm_local_postagem5: TDBEdit;
    btn_co_local_postagem5: TSpeedButton;
    dbedt_cd_local_embarque7: TDBEdit;
    dbedt_nm_local_embarque7: TDBEdit;
    btn_co_local_embarque7: TSpeedButton;
    dbedt_cd_local_embarque4: TDBEdit;
    dbedt_nm_local_embarque4: TDBEdit;
    btn_co_local_embarque4: TSpeedButton;
    dbedt_cd_local_embarque3: TDBEdit;
    dbedt_nm_local_embarque3: TDBEdit;
    btn_co_local_embarque3: TSpeedButton;
    dbedt_cd_local_embarque9: TDBEdit;
    dbedt_nm_local_embarque9: TDBEdit;
    btn_co_local_embarque9: TSpeedButton;
    dbedt_cd_local_embarque8: TDBEdit;
    dbedt_nm_local_embarque8: TDBEdit;
    btn_co_local_embarque8: TSpeedButton;
    dbedt_dt_embarque8: TDBEdit;
    dbg_volumes: TDBGrid;
    Label12: TLabel;
    dbg_armazem1: TDBGrid;
    lbl_recinto_alfandegado1: TLabel;
    dbedt_cd_recinto_alfandegado1: TDBEdit;
    dbedt_nm_recinto_alfandegado1: TDBEdit;
    btn_co_recinto_alfandegado1: TSpeedButton;
    lbl_setor1: TLabel;
    dbedt_cd_setor1: TDBEdit;
    btn_co_setor1: TSpeedButton;
    Label13: TLabel;
    dbg_DARF: TDBGrid;
    Label14: TLabel;
    dbg_compensacao_tributos: TDBGrid;
    Label51: TLabel;
    DBEdit53: TDBEdit;
    Label52: TLabel;
    DBEdit54: TDBEdit;
    Label53: TLabel;
    DBGrid9: TDBGrid;
    Label54: TLabel;
    dbedt_cd_recinto_alfandegado4: TDBEdit;
    dbedt_nm_recinto_alfandegado4: TDBEdit;
    btn_co_recinto_alfandegado4: TSpeedButton;
    DBGrid10: TDBGrid;
    dbedt_cd_setor4: TDBEdit;
    Label55: TLabel;
    btn_co_setor4: TSpeedButton;
    Label56: TLabel;
    DBEdit59: TDBEdit;
    Label57: TLabel;
    DBEdit60: TDBEdit;
    Label58: TLabel;
    DBGrid11: TDBGrid;
    Label59: TLabel;
    dbedt_cd_recinto_alfandegado5: TDBEdit;
    dbedt_nm_recinto_alfandegado5: TDBEdit;
    DBGrid12: TDBGrid;
    Label60: TLabel;
    dbedt_cd_setor5: TDBEdit;
    btn_co_setor5: TSpeedButton;
    btn_co_recinto_alfandegado5: TSpeedButton;
    GroupBox11: TGroupBox;
    rbtn_modalidade_despacho_normal1: TRadioButton;
    rbtn_modalidade_despacho_antecipado1: TRadioButton;
    rbtn_modalidade_despacho_ant_simp1: TRadioButton;
    rbtn_modalidade_despacho_ent_frac1: TRadioButton;
    rbtn_modalidade_despacho_ant_ent_frac1: TRadioButton;
    GroupBox12: TGroupBox;
    rbtn_modalidade_despacho_normal2: TRadioButton;
    rbtn_modalidade_despacho_antecipado2: TRadioButton;
    rbtn_modalidade_despacho_simplificado1: TRadioButton;
    GroupBox14: TGroupBox;
    rbtn_BL2: TRadioButton;
    rbtn_House_BL2: TRadioButton;
    GroupBox15: TGroupBox;
    rbtn_BL3: TRadioButton;
    rbtn_House_BL3: TRadioButton;
    GroupBox16: TGroupBox;
    rbtn_AWB: TRadioButton;
    rbtn_House_AWB: TRadioButton;
    rbtn_DSIC: TRadioButton;
    GroupBox17: TGroupBox;
    rbtn_RWB: TRadioButton;
    rbtn_House_RWB: TRadioButton;
    rbtn_Tif_DTA: TRadioButton;
    rbtn_Contratante_prop_impo1: TRadioButton;
    rbtn_contratante_outro1: TRadioButton;
    GroupBox9: TGroupBox;
    grpbox_op_cambial5: TGroupBox;
    lbl_cnpj_op_cambial5: TLabel;
    dbedt_cnpj_consignatario5: TDBEdit;
    rbtn_Contratante_prop_impo5: TRadioButton;
    rbtn_contratante_outro5: TRadioButton;
    dbchkbox_op_fundap5: TDBCheckBox;
    edt_nm_setor4: TEdit;
    edt_nm_setor5: TEdit;
    lbl_nr_registro_di2: TLabel;
    dbedt_nr_registro_di2: TDBEdit;
    bl_dt_registro_di2: TLabel;
    dbedt_dt_registro_di2: TDBEdit;
    lbl_nr_registro_di1: TLabel;
    dbedt_nr_registro_di1: TDBEdit;
    lbl_dt_registro_di1: TLabel;
    dbedt_dt_registro_di1: TDBEdit;
    lbl_nr_registro_di3: TLabel;
    dbedt_nr_registro_di3: TDBEdit;
    lbl_dt_registro_di3: TLabel;
    dbedt_dt_registro_di3: TDBEdit;
    lbl_nr_registro_di4: TLabel;
    dbedt_nr_registro_di4: TDBEdit;
    lbl_dt_registro_di4: TLabel;
    dbedt_dt_registro_di4: TDBEdit;
    DBGrid13: TDBGrid;
    tbsht_aux: TTabSheet;
    Label18: TLabel;
    dbedt_nr_adicoes: TDBEdit;
    Bevel1: TBevel;
    dbchkbox_mesma_moeda1: TDBCheckBox;
    dblkpcbox_vinc_comp_vend: TDBLookupComboBox;
    lbl_vinculacao_comp_vend: TLabel;
    lbl_metodo_valoracao: TLabel;
    dbedt_cd_metodo_valoracao: TDBEdit;
    dbedt_nm_metodo_valoracao: TDBEdit;
    Label66: TLabel;
    dbedt_cd_reg_trib_ii: TDBEdit;
    DBEdit18: TDBEdit;
    btn_co_reg_trib1: TSpeedButton;
    Label67: TLabel;
    dbedt_fund_legal_ii: TDBEdit;
    DBEdit41: TDBEdit;
    btn_co_fund_legal1: TSpeedButton;
    dbrgrp_aplicacao: TDBRadioGroup;
    grpbox_cond_mercadoria: TGroupBox;
    rbtn_Bem_sob_encomenda: TRadioButton;
    rbtn_material_usado: TRadioButton;
    lbl_cd_incoterm: TLabel;
    TabSheet2: TTabSheet;
    Bevel3: TBevel;
    lbl_perc_icms: TLabel;
    dbedt_pc_icms: TDBEdit;
    lbl_reducao_icms: TLabel;
    dbedt_pc_reducao_icms: TDBEdit;
    Label73: TLabel;
    dbedt_destaque_ncm: TDBEdit;
    dbrg_reg_tributacao: TDBRadioGroup;
    lbl_pc_comissao_agente: TLabel;
    dbedt_pc_comissao_agente: TDBEdit;
    lbl_nr_banco: TLabel;
    dbedt_nr_banco: TDBEdit;
    lbl_nr_praca: TLabel;
    dbedt_nr_praca: TDBEdit;
    lbl_nr_identificacao_agente: TLabel;
    dbedt_nr_identificacao_agente: TDBEdit;
    lbl_nr_rof: TLabel;
    dbedt_nr_rof: TDBEdit;
    dbg_cobertura_cambial: TDBRadioGroup;
    Bevel2: TBevel;
    Bevel4: TBevel;
    lblComissao: TLabel;
    lbl_Contrato_Cambio: TLabel;
    lbl_cd_mod_pagto_2: TLabel;
    dbedt_cd_mod_pagto_2: TDBEdit;
    dbedt_nm_mod_pagto2: TDBEdit;
    btn_co_mod_pagto1: TSpeedButton;
    lbl_cd_mot_sem_cob: TLabel;
    dbedt_cd_mot_sem_cob: TDBEdit;
    DBEdit74: TDBEdit;
    btn_co_motivo_sem_cob1: TSpeedButton;
    DBCheckBox3: TDBCheckBox;
    dbrdg_contrato_cambio: TDBRadioGroup;
    btn_adicao_di: TSpeedButton;
    btn_itens_di: TSpeedButton;
    Label70: TLabel;
    dbedt_pc_seguro: TDBEdit;
    Label82: TLabel;
    Label87: TLabel;
    dbmemo_info_complementares: TDBMemo;
    dbchkbox_REB: TDBCheckBox;
    btn_co_obs: TSpeedButton;
    dbtxt_vl_ii: TDBText;
    dbtxt_vl_ipi: TDBText;
    dbtxt_vl_ad: TDBText;
    dbtxt_vl_icms: TDBText;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Bevel5: TBevel;
    dbedt_vl_moeda_despesa: TDBEdit;
    lbl_vl_moeda_despesa: TLabel;
    lbl_vl_real_despesa: TLabel;
    dbedt_vl_real_despesa: TDBEdit;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    dbedt_nr_conta_pagto_trib: TDBEdit;
    MskEdt_cd_banco: TMaskEdit;
    MskEdt_cd_agencia: TMaskEdit;
    gbox_doc_chegada_carga7: TGroupBox;
    gbox_doc_chegada_carga4: TGroupBox;
    gbox_doc_chegada_carga3: TGroupBox;
    btn_co_armazens: TSpeedButton;
    tbsht_carga_TD01_Page12: TTabSheet;
    lbl_pais_procedencia2: TLabel;
    dbedt_cd_pais_procedencia2: TDBEdit;
    dbedt_nm_pais_procedencia2: TDBEdit;
    btn_co_pais_procedencia2: TSpeedButton;
    lbl_peso_bruto2: TLabel;
    dbedt_peso_bruto2: TDBEdit;
    lbl_peso_liquido2: TLabel;
    dbedt_peso_liquido2: TDBEdit;
    lbl_urf_entrada_pais2: TLabel;
    dbedt_cd_urf_entrada_pais2: TDBEdit;
    btn_co_urf_entrada2: TSpeedButton;
    dbedt_nm_urf_entrada_pais2: TDBEdit;
    Label17: TLabel;
    DBGrid6: TDBGrid;
    Label15: TLabel;
    dbedt_cd_recinto_alfandegado2: TDBEdit;
    btn_co_recinto_alfandegado2: TSpeedButton;
    dbedt_nm_recinto_alfandegado2: TDBEdit;
    DBGrid5: TDBGrid;
    Label16: TLabel;
    dbedt_cd_setor2: TDBEdit;
    btn_co_setor2: TSpeedButton;
    dbchkbox_op_fundap2: TDBCheckBox;
    GroupBox1: TGroupBox;                       
    grpbox_op_cambial2: TGroupBox;
    lbl_cnpj_op_cambial2: TLabel;
    dbedt_cnpj_consignatario2: TDBEdit;
    rbtn_Contratante_prop_impo2: TRadioButton;
    rbtn_contratante_outro2: TRadioButton;
    tbsht_carga_TD01_Page13: TTabSheet;
    Label30: TLabel;
    dbedt_cd_pais_procedencia3: TDBEdit;
    dbedt_nm_pais_procedencia3: TDBEdit;
    btn_co_pais_procedencia3: TSpeedButton;
    Label34: TLabel;
    DBEdit36: TDBEdit;
    Label35: TLabel;
    DBEdit37: TDBEdit;
    Label31: TLabel;
    dbedt_cd_urf_entrada_pais3: TDBEdit;
    SpeedButton18: TSpeedButton;
    DBEdit33: TDBEdit;
    Label32: TLabel;
    DBEdit34: TDBEdit;
    Label33: TLabel;
    dbedt_agente_transp: TDBEdit;
    Label39: TLabel;
    DBGrid8: TDBGrid;
    Label36: TLabel;
    dbedt_cd_recinto_alfandegado3: TDBEdit;
    btn_co_recinto_alfandegado3: TSpeedButton;
    dbedt_nm_recinto_alfandegado3: TDBEdit;
    DBGrid7: TDBGrid;
    Label37: TLabel;
    dbedt_cd_setor3: TDBEdit;
    btn_co_setor3: TSpeedButton;
    btn_calculo: TSpeedButton;
    dbedt_cd_incoterm: TDBEdit;
    btn_excluir: TSpeedButton;
    dbrdgrp_cd_util_dcto_carga_mar: TDBRadioGroup;
    dbrdgrp_cd_util_dcto_carga_fluvial: TDBRadioGroup;
    dbrdgrp_cd_util_dcto_carga_lacustre: TDBRadioGroup;
    dbrdgrp_cd_util_dcto_carga_aereo: TDBRadioGroup;
    dbrdgrp_cd_util_dcto_carga_ferr: TDBRadioGroup;
    dbrdgrp_cd_util_dcto_carga_rod: TDBRadioGroup;
    GroupBox13: TGroupBox;
    rbtn_BL1: TRadioButton;
    rbtn_House_BL1: TRadioButton;
    gbox_doc_chegada_carga1: TGroupBox;
    lbl_identificacao1: TLabel;
    gbox_doc_chegada_carga2: TGroupBox;
    rbtn_manifesto_carga2: TRadioButton;
    rbtn_dta2: TRadioButton;
    dbedt_identificacao2: TDBEdit;
    lbl_identificacao2: TLabel;
    gbox_doc_chegada_carga6: TGroupBox;
    rbtn_manifesto_carga6: TRadioButton;
    rbtn_dta6: TRadioButton;
    lbl_identificacao6: TLabel;
    dbedt_identificacao6: TDBEdit;
    rbtn_manifesto_carga7: TRadioButton;
    rbtn_dta7: TRadioButton;
    lbl_identificacao7: TLabel;
    dbedt_identificacao7: TDBEdit;
    rbtn_manifesto_carga4: TRadioButton;
    rbtn_dta4: TRadioButton;
    lbl_identificacao4: TLabel;
    dbedt_identificacao4: TDBEdit;
    rbtn_manifesto_carga3: TRadioButton;
    rbtn_dta3: TRadioButton;
    rbtn_MIC_DTA3: TRadioButton;
    lbl_identificacao3: TLabel;
    dbedt_identificacao3: TDBEdit;
    dbchkbox_repasse: TDBCheckBox;
    btn_co_inst_financ: TSpeedButton;
    dbedt_inst_financ: TDBEdit;
    dbedt_cd_inst_financ: TDBEdit;
    lbl_inst_financ: TLabel;
    lbl_nr_presenca_carga2: TLabel;
    dbedt_nr_presenca_carga2: TDBEdit;
    grpbox_retif1: TGroupBox;
    lbl_nr_retif1: TLabel;
    lbl_dt_retif1: TLabel;
    lbl_motivo_retif1: TLabel;
    btn_co_motivo_retif1: TSpeedButton;
    dbedt_nr_seq_retif1: TDBEdit;
    dbedt_cd_motivo_retif1: TDBEdit;
    dbedt_nm_motivo_retif1: TDBEdit;
    dbedt_dt_retif1: TDBEdit;
    grpbox_retif2: TGroupBox;
    lbl_nr_retif2: TLabel;
    lbl_dt_retif2: TLabel;
    lbl_motivo_retif2: TLabel;
    btn_co_motivo_retif2: TSpeedButton;
    dbedt_nr_seq_retif2: TDBEdit;
    dbedt_cd_motivo_retif2: TDBEdit;
    dbedt_nm_motivo_retif2: TDBEdit;
    dbedt_dt_retif2: TDBEdit;
    grpbox_retif3: TGroupBox;
    lbl_nr_retif3: TLabel;
    lbl_dt_retif3: TLabel;
    lbl_motivo_retif3: TLabel;
    btn_co_motivo_retif3: TSpeedButton;
    dbedt_nr_seq_retif3: TDBEdit;
    dbedt_cd_motivo_retif3: TDBEdit;
    dbedt_nm_motivo_retif3: TDBEdit;
    dbedt_dt_retif3: TDBEdit;
    grpbox_retif4: TGroupBox;
    lbl_nr_retif4: TLabel;
    lbl_dt_retif4: TLabel;
    lbl_motivo_retif4: TLabel;
    btn_co_motivo_retif4: TSpeedButton;
    dbedt_nr_seq_retif4: TDBEdit;
    dbedt_cd_motivo_retif4: TDBEdit;
    dbedt_nm_motivo_retif4: TDBEdit;
    dbedt_dt_retif4: TDBEdit;
    Label8: TLabel;
    btn_co_tributacao_icms: TSpeedButton;
    Label10: TLabel;
    btn_co_fund_legal_icms: TSpeedButton;
    dbedt_cd_tributacao_icms: TDBEdit;
    dbedt_nm_tributacao_icms: TDBEdit;
    dbedt_cd_fund_legal_icms: TDBEdit;
    dbedt_nm_fund_legal_icms: TDBEdit;
    lbl_fabricante: TLabel;
    dbedt_fabricante: TDBEdit;
    lbl_pais_origem: TLabel;
    dbedt_pais_orig: TDBEdit;
    lbl_exportador: TLabel;
    dbedt_exportador: TDBEdit;
    lbl_pais_exportador: TLabel;
    dbedt_pais_fornec: TDBEdit;
    dbedt_nm_fabricante: TDBEdit;
    dbedt_nm_fornecedor: TDBEdit;
    dbedt_pais_origem_: TDBEdit;
    dbedt_pais_export: TDBEdit;
    btn_co_nm_fabric: TSpeedButton;
    btn_co_pais_orig: TSpeedButton;
    btn_co_nm_export: TSpeedButton;
    btn_co_pais_export: TSpeedButton;
    dbrgrp_fabr_expo: TDBRadioGroup;
    btn_ag_transp: TSpeedButton;
    dbedt_nm_agente_transp: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    btn_agente_transp: TSpeedButton;
    dbedt_nm_setor_: TDBEdit;
    lbl_total_cambio: TLabel;
    dbedt_vl_tot_cambio: TDBEdit;
    dbcheck_embut_frete: TDBCheckBox;
    dbcheck_embut_seg: TDBCheckBox;
    dbedt_nm_setor2: TDBEdit;
    DBEdit1: TDBEdit;
    btn_co_metodo_valoracao: TSpeedButton;
    ntbk_cambio: TNotebook;
    lbl_moeda_nac: TLabel;
    lblNR_OP_CAMBIO: TLabel;
    lblCD_BANCO_PAGAMENTO: TLabel;
    lblCD_PRACA_PAGAMENTO: TLabel;
    dblkpcbox_moeda_nac: TDBLookupComboBox;
    EditNR_OP_CAMBIO: TDBEdit;
    EditCD_BANCO_PAGAMENTO: TDBEdit;
    EditCD_PRACA_PAGAMENTO: TDBEdit;
    lblNR_COMPR_CAMBIO: TLabel;
    EditNR_COMPR_CAMBIO: TDBEdit;
    lbl_NRparcelas: TLabel;
    lbl_periodicidade: TLabel;
    lbl_indicador: TLabel;
    dbedt_nr_Parcelas: TDBEdit;
    dbedt_periodicidade: TDBEdit;
    rbtn_ind_per_diaria1: TRadioButton;
    rbtn_ind_per_mensal1: TRadioButton;
    DBGrid14: TDBGrid;
    dbrgrp_parcelas: TDBRadioGroup;
    lbl_nr_presenca_carga4: TLabel;
    dbedt_nr_presenca_carga4: TDBEdit;
    lbl_nr_presenca_carga3: TLabel;
    dbedt_nr_presenca_carga3: TDBEdit;
    Label19: TLabel;
    dbedt_pc_reducao_ipt_bli: TDBEdit;
    btn_co_embarcacao2: TSpeedButton;
    dbedt_cd_embarcacao2: TDBEdit;
    Label20: TLabel;
    dbedt_cd_embarcacao6: TDBEdit;
    btn_co_embarcacao6: TSpeedButton;
    dbedt_cd_embarcacao7: TDBEdit;
    btn_co_embarcacao7: TSpeedButton;
    Label9: TLabel;
    dbtxt_vl_pis_cofins: TDBText;
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_armazem: TMenuItem;
    mi_excluir: TMenuItem;
    mi_adicao_di: TMenuItem;
    mi_itens_di: TMenuItem;
    mi_calculo: TMenuItem;
    mi_sair: TMenuItem;
    pnlClaro: TPanel;
    Label92: TLabel;
    dbedt_cd_tipo_declaracao: TDBEdit;
    dbedt_nm_declaracao: TDBEdit;
    Shape1: TShape;
    Bevel6: TBevel;
    tbsht_carga_Page3: TTabSheet;
    Panel1: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    Label21: TLabel;
    Label22: TLabel;
    ntbPage3: TNotebook;
    TabSet1: TTabSet;
    Panel3: TPanel;
    dbg_acrescimos: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    dbg_deducoes: TDBGrid;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    Label23: TLabel;
    dbedt_dt_chegada_pg12: TDBEdit;
    btn_trans_DI: TSpeedButton;
    btn_Retificar: TSpeedButton;
    dbrdg_tipo_seguro: TcxDBRadioGroup;
    tbsDE: TTabSheet;
    dbgDE: TDBGrid;
    btnExcluirDE: TSpeedButton;
    GroupBox2: TGroupBox;
    grpbox_op_cambial3: TGroupBox;
    lbl_cnpj_op_cambial3: TLabel;
    dbedt_cnpj_consignatario3: TDBEdit;
    rbtn_Contratante_prop_impo3: TRadioButton;
    rbtn_contratante_outro3: TRadioButton;
    GroupBox3: TGroupBox;
    cxdbedtDT_PAGAMENTO_DARF: TcxDBDateEdit;
    Label113: TLabel;
    dbchkIN_FMA: TDBCheckBox;
    rbtn_modalidade_despacho_SobreAguasOEA: TRadioButton;
    btnObsAutomatica: TBitBtn;
    dbmemo_info_complementares_auto: TDBMemo;
    Label24: TLabel;
    btnLimpar: TBitBtn;
    edtCNPJImportador: TMaskEdit;
    Label25: TLabel;
    btnEnvioDuimp: TSpeedButton;
    rbtn_contratante_por_encomenda3: TRadioButton;
    rbtn_contratante_por_encomenda1: TRadioButton;
    rbtn_contratante_por_encomenda2: TRadioButton;
    rbtn_contratante_por_encomenda5: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_cd_tipo_declaracao2Exit(Sender: TObject);
    procedure dbchkbox_mesma_moeda1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbtn_pessoa_juridica2Click(Sender: TObject);
    procedure rbtn_modalidade_despacho_normal1Click(Sender: TObject);
    procedure rbtn_Contratante_prop_impo1Click(Sender: TObject);
    procedure dbedt_cd_importador2Exit(Sender: TObject);
    procedure dbedt_cd_urf_despacho1Exit(Sender: TObject);
    procedure dbedt_cd_transportador2Exit(Sender: TObject);
    procedure dbedt_cd_transportador3Exit(Sender: TObject);
    procedure dbedt_cd_bandeira_transp_itl2Exit(Sender: TObject);
    procedure dbedt_cd_pais_procedencia12Exit(Sender: TObject);
    procedure dbedt_cd_urf_entrada_pais1Exit(Sender: TObject);
    procedure dbedt_cd_recinto_alfandegado1Exit(Sender: TObject);
    procedure dbedt_cd_setor1Exit(Sender: TObject);
    procedure rbtn_manifesto_carga6DblClick(Sender: TObject);
    procedure rbtn_manifesto_carga7DblClick(Sender: TObject);
    procedure rbtn_manifesto_carga4DblClick(Sender: TObject);
    procedure rbtn_dta4DblClick(Sender: TObject);
    procedure dbedt_cd_bandeira_transp_itl2Enter(Sender: TObject);
    procedure dbedt_agente_transportador1Exit(Sender: TObject);
    procedure dbedt_agente_transportador1Enter(Sender: TObject);
    procedure dbedt_identificacao1Exit(Sender: TObject);
    procedure dbedt_identificacao1Enter(Sender: TObject);
    procedure pgctrl_capa_diChange(Sender: TObject);
    procedure dbedt_cd_mot_sem_cobExit(Sender: TObject);
    procedure dbg_cobertura_cambialClick(Sender: TObject);
    procedure rbtn_material_usadoClick(Sender: TObject);
    procedure btn_adicao_diClick(Sender: TObject);
    procedure btn_itens_diClick(Sender: TObject);
    procedure btn_co_importador1Click(Sender: TObject);
    procedure btn_co_tipo_declaracao1Click(Sender: TObject);
    procedure btn_co_urf_despacho1Click(Sender: TObject);
    procedure btn_co_urf_entrada1Click(Sender: TObject);
    procedure btn_co_pais1Click(Sender: TObject);
    procedure btn_co_pais_procedencia1Click(Sender: TObject);
    procedure btn_co_recinto_alfandegado1Click(Sender: TObject);
    procedure btn_co_setor1Click(Sender: TObject);
    procedure btn_co_moeda_mle1Click(Sender: TObject);
    procedure btn_co_moeda_frete1Click(Sender: TObject);
    procedure btn_co_moeda_seguro1Click(Sender: TObject);
    procedure btn_co_motivo_sem_cob1Click(Sender: TObject);
    procedure btn_co_mod_pagto1Click(Sender: TObject);
    procedure btn_co_transportador1Click(Sender: TObject);
    procedure btn_co_local_embarque1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dbedt_pc_seguroExit(Sender: TObject);
    procedure dbchkbox_repasseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbchkbox_REBClick(Sender: TObject);
    procedure btn_co_obsClick(Sender: TObject);
    procedure btn_co_armazensClick(Sender: TObject);
    procedure MskEdt_cd_bancoExit(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure dbedt_cd_moeda_mle1Exit(Sender: TObject);
    procedure dbedt_cd_moeda_frete1Exit(Sender: TObject);
    procedure dbedt_cd_moeda_seguro1Exit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbrdg_contrato_cambioChange(Sender: TObject);
    procedure pgctrl_carga1Change(Sender: TObject);
    procedure tbsht_carga_Page2Exit(Sender: TObject);
    procedure tbsht_informacoes_complementaresExit(Sender: TObject);
    procedure btn_co_urf_despacho2Click(Sender: TObject);
    procedure btn_co_urf_despacho3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_tipo_declaracao2Enter(Sender: TObject);
    procedure rbtn_termo_entrada1DblClick(Sender: TObject);
    procedure rbtn_BL1Click(Sender: TObject);
    procedure rbtn_RWBDblClick(Sender: TObject);
    procedure rbtn_House_RWBDblClick(Sender: TObject);
    procedure rbtn_Tif_DTADblClick(Sender: TObject);
    procedure rbtn_BL1DblClick(Sender: TObject);
    procedure rbtn_House_BL1DblClick(Sender: TObject);
    procedure rbtn_BL2DblClick(Sender: TObject);
    procedure rbtn_House_BL2DblClick(Sender: TObject);
    procedure rbtn_BL3DblClick(Sender: TObject);
    procedure rbtn_House_BL3DblClick(Sender: TObject);
    procedure rbtn_AWBDblClick(Sender: TObject);
    procedure rbtn_House_AWBDblClick(Sender: TObject);
    procedure rbtn_DSICDblClick(Sender: TObject);
    procedure rbtn_manifesto_carga2DblClick(Sender: TObject);
    procedure rbtn_dta2DblClick(Sender: TObject);
    procedure rbtn_manifesto_carga2Click(Sender: TObject);
    procedure rbtn_dta6DblClick(Sender: TObject);
    procedure rbtn_dta7DblClick(Sender: TObject);
    procedure rbtn_dta1DblClick(Sender: TObject);
    procedure rbtn_manifesto_carga3DblClick(Sender: TObject);
    procedure rbtn_dta3DblClick(Sender: TObject);
    procedure rbtn_MIC_DTA3DblClick(Sender: TObject);
    procedure dbchkbox_op_fundap1Click(Sender: TObject);
    procedure Grava(Sender : TObject);
    procedure Cancela(Sender : TObject);
    procedure dbedt_cd_local_embarque2Exit(Sender: TObject);
    procedure btn_co_inst_financClick(Sender: TObject);
    procedure dbedt_cd_inst_financExit(Sender: TObject);
    procedure dbedt_dt_embarque2Exit(Sender: TObject);
    procedure pgctrl_capa_diChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure EditNR_COMPR_CAMBIOExit(Sender: TObject);
    procedure dbedt_cd_motivo_retif1Exit(Sender: TObject);
    procedure dbedt_cd_motivo_retif2Exit(Sender: TObject);
    procedure dbedt_cd_motivo_retif3Exit(Sender: TObject);
    procedure dbedt_cd_motivo_retif4Exit(Sender: TObject);
    procedure btn_co_motivo_retif2Click(Sender: TObject);
    procedure btn_co_motivo_retif3Click(Sender: TObject);
    procedure btn_co_motivo_retif4Click(Sender: TObject);
    procedure btn_co_motivo_retif1Click(Sender: TObject);
    procedure dbedt_cd_reg_trib_iiChange(Sender: TObject);
    procedure dbedt_cd_reg_trib_iiExit(Sender: TObject);
    procedure btn_co_tributacao_icmsClick(Sender: TObject);
    procedure btn_co_fund_legal_icmsClick(Sender: TObject);
    procedure btn_co_reg_trib1Click(Sender: TObject);
    procedure btn_co_fund_legal1Click(Sender: TObject);
    procedure dbedt_cd_fund_legal_icmsExit(Sender: TObject);
    procedure dbedt_cd_incotermChange(Sender: TObject);
    procedure dbedt_cd_mot_sem_cobChange(Sender: TObject);
    procedure btn_co_nm_exportClick(Sender: TObject);
    procedure btn_co_nm_fabricClick(Sender: TObject);
    procedure btn_co_pais_origClick(Sender: TObject);
    procedure btn_co_pais_exportClick(Sender: TObject);
    procedure dbedt_fabricanteExit(Sender: TObject);
    procedure dbedt_exportadorExit(Sender: TObject);
    procedure dbedt_pais_origExit(Sender: TObject);
    procedure dbedt_pais_fornecExit(Sender: TObject);
    procedure btn_ag_transpClick(Sender: TObject);
    procedure dbedt_agente_transpExit(Sender: TObject);
    procedure DBCheckBox3Enter(Sender: TObject);
    procedure dbchkbox_repasseEnter(Sender: TObject);
    procedure rbtn_ind_per_diaria1Click(Sender: TObject);
    procedure rbtn_ind_per_mensal1Click(Sender: TObject);
    procedure btn_co_metodo_valoracaoClick(Sender: TObject);
    procedure dbedt_dt_registro_di2Exit(Sender: TObject);
    procedure dbrgrp_parcelasChange(Sender: TObject);
    procedure DBGrid14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_embarcacao2Click(Sender: TObject);
    procedure dbedt_cd_embarcacao2Exit(Sender: TObject);
    procedure pgctrl_carga1Changing(Sender: TObject;
      var AllowChange: Boolean);
    
    procedure TabSet1Click(Sender: TObject);
    procedure dbg_acrescimosDblClick(Sender: TObject);
    procedure dbg_acrescimosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_deducoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_deducoesDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure dbg_acrescimosExit(Sender: TObject);
    procedure dbg_deducoesExit(Sender: TObject);
    procedure dbedt_dt_chegada1Exit(Sender: TObject);
    procedure tbsht_Transporte_MaritimoShow(Sender: TObject);
    procedure dbedt_cd_pais_procedencia1Exit(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure btn_RetificarClick(Sender: TObject);
    procedure btnExcluirDEClick(Sender: TObject);
    procedure btnObsAutomaticaClick(Sender: TObject);
    procedure dbmemo_info_complementaresKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
    procedure dbedt_cd_importador2Change(Sender: TObject);
    procedure btnEnvioDuimpClick(Sender: TObject);

  private
    vAFRMMencontrado : String;
    procedure LancaImpostos(pProcesso: string);
    function VerificaRepetidos: Boolean;
    function CompararNomesVinculacao(nomeImportador,
      NomeExportador: string): Boolean;
    function ValidarVinculacao(const pNr_processo: string): Boolean;
    procedure PreencheCodOpeEstrangeiros;
    { Private declarations }
  public
    { Public declarations }
    un_pd_nr_processo : string[11];
    Code : integer;
    i_cod_via_transp : Byte;
    in_reb : String[1];
    Tab_Ativa : TTabSheet;
    in_banco, in_calculo, in_forca_calculo, in_DI_Registrada, in_excluiu, in_abrindo_via, in_di_abrindo : Boolean;
    str_hist_fatura,  str_hist_n_ref,  str_hist_s_ref,   str_hist_conh,    str_hist_conh_m,
    str_hist_loc_emb, str_hist_dt_emb, str_hist_veiculo, str_hist_dt_cheg, str_hist_vmle, str_hist_vmle_moeda,
    str_hist_fr_seg,  str_hist_cif,    str_hist_pcarga,  str_hist_cntr,    str_hist_especie, str_tx_siscomex,
    str_nm_transp, str_cnpj_transp, str_vl_acrescimo, str_vl_deducao, str_hist_placa_veiculo : String;
    str_hist_taxa : array [1..10] of string;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;
    i_cd_tipo_di : Byte;
    in_altera_tipo_DI, in_repassa_dados_adicao, in_repassa_dados_cambio : Boolean;
    dbl_vmle_mneg, dbl_vmle_mn, dbl_fr_seg_mneg, dbl_fr_seg_mn, dbl_cif_mneg, dbl_cif_mn, dbl_tx_sicomex,
    dbl_acrescimo, dbl_deducao: Double;

    function Consiste : Boolean;
    function Busca_amz_atracacao( nr_proc: String ): String;
    function Busca_amz_descarga( nr_proc: String ): String;
    procedure LimpaConhecimento;
    procedure LimpaChecks;
    procedure HabilitaContratoCambio;
    procedure DesabilitaContratoCambio;
    procedure HabilitaAgente;
    procedure DesabilitaAgente;
    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure ReadUpdateWindow_Carga2;
    procedure Write_Carga2;
    procedure ReadUpdateWindow_CD_MOT_SEM_COB;
    procedure Write_CD_MOT_SEM_COB;
    procedure ReadUpdateWindow_CD_TIPO_DECLARACAO;
    procedure ReadUpdateWindow_CD_COBERTURA_CAMBIAL;
    procedure ReadUpdateWindow_CD_TIPO_IMPORTADOR;
    procedure ReadUpdateWindow_Retificacao;
    procedure Write_CD_TIPO_IMPORTADOR;
    procedure ReadUpdateWindow_CD_MODALIDADE_DESP;
    procedure Write_CD_MODALIDADE_DESP;

    procedure Via_de_Transporte;
    procedure Desativa_transporte;
    procedure ReadUpdateWindow_CD_VIA_TRANSPORTE;
    procedure Write_CD_VIA_TRANSPORTE;

    procedure ReadUpdateWindow_IN_OPERACAO_FUNDAP;
    procedure Write_IN_OPERACAO_FUNDAP;
    procedure ReadUpdateWindow_CONTRATANTE_CAMBIO;
    procedure Write_CONTRATANTE_CAMBIO;
    procedure Atualiza_Nome_Setor;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    procedure TrocaNullToZero;
    procedure GuardaTaxaCambial;
    procedure AtzTaxaCambialDI( Moeda : String; Campo : TFloatField );
    procedure Valores;

    function PodeFocar(Componente: TWinControl): Boolean;
    function AtualizaVolumes: Boolean;
    function GrupoPrometeon(Grupo : String) : Boolean;

  //  procedure Atualiza_Historico_Padrao;
  //  function HistoricoMP164 : string;

    procedure Atualiza_Historico_Padrao_Novo;
    function HistoricoMP164_Novo: String;
  end;

var
  frm_DI_capa: Tfrm_DI_capa;
  cd_servico: string;
  in_afrmm: String;

implementation

uses GSMLIB,  PGGP017, PGDI018, PGSM096, PGDI003, PGSM104, PGSM019, PGSM014, PGSM006,
     PGDI019, PGSM048, PGSM064, uAg, PGSM148, PGGP001, PGSM088, PGSM103, ConsOnLineEx,
  PGDI038, PGDI039, uRetificaDI_Adm_Temp;

{$R *.DFM}

procedure Tfrm_DI_capa.AbreTabelas;
begin
  if datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.AsString <> '' then
  begin
    datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.ReadOnly := True;
    datm_DI_Capa.qry_di_DT_REGISTRO_DI.ReadOnly    := True;
    if frm_di.in_DI_Retificacao = True then
    begin
      datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.ReadOnly := False;
      datm_DI_Capa.qry_di_DT_REGISTRO_DI.ReadOnly    := False;
    end;
  end;

  if in_DI_Registrada then
  begin
    if Not datm_DI_capa.tbl_di_armazem_.Active then
       datm_DI_capa.tbl_di_armazem_.ReadOnly         := True;
    if Not datm_DI_capa.tbl_di_volumes_.Active then
       datm_DI_capa.tbl_di_volumes_.ReadOnly         := True;
    if Not datm_DI_capa.tbl_di_doc_instr_emb_.Active then
      datm_DI_capa.tbl_di_doc_instr_emb_.ReadOnly   := True;
    if Not datm_DI_capa.tbl_di_volumes_.Active then
      datm_DI_capa.tbl_di_proc_vinc_.ReadOnly       := True;
  end;

  if Not datm_DI_capa.tbl_di_armazem_.Active then
     datm_DI_capa.tbl_di_armazem_.Open;
  if Not datm_DI_capa.tbl_di_volumes_.Active then
     datm_DI_capa.tbl_di_volumes_.Open;
  if Not datm_DI_capa.tbl_di_doc_instr_emb_.Active then
     datm_DI_capa.tbl_di_doc_instr_emb_.Open;
  if Not datm_DI_capa.tbl_di_volumes_.Active then
     datm_DI_capa.tbl_di_volumes_.Open;

  //Transporte
  if Not datm_DI_capa.tbl_via_transporte_.Active then
    datm_DI_capa.tbl_via_transporte_.Open;

  //Basicas
  if ( pgctrl_capa_di.ActivePage = tbsht_basicas_TD01) or
     ( pgctrl_capa_di.ActivePage = tbsht_basicas_TD02) or
     ( pgctrl_capa_di.ActivePage = tbsht_basicas_TD13) then
  begin
    if in_DI_Registrada then
    begin
      if Not datm_DI_capa.tbl_di_proc_vinc_.Active then
         datm_DI_capa.tbl_di_proc_vinc_.ReadOnly      := True;
      if Not datm_DI_capa.tbl_di_doc_instr_emb_.Active then
         datm_DI_capa.tbl_di_doc_instr_emb_.ReadOnly  := True;
    end;
    if Not datm_DI_capa.tbl_di_proc_vinc_.Active then
      datm_DI_capa.tbl_di_proc_vinc_.Open;
    if Not datm_DI_capa.tbl_di_doc_instr_emb_.Active then
      datm_DI_capa.tbl_di_doc_instr_emb_.Open;
  end;

  //Carga
  if ( pgctrl_capa_di.ActivePage = tbsht_carga_TD01 ) or
     ( pgctrl_capa_di.ActivePage = tbsht_carga_TD16 ) or
     ( pgctrl_capa_di.ActivePage = tbsht_carga_TD18 ) then
  begin
    if in_DI_Registrada then
    begin
      if Not datm_DI_capa.tbl_taxa_cambio_.Active then
         datm_DI_capa.tbl_taxa_cambio_.ReadOnly        := True;
      if Not datm_DI_capa.tbl_di_armazem_.Active then
         datm_DI_capa.tbl_di_armazem_.ReadOnly         := True;
      if Not datm_DI_capa.tbl_di_volumes_.Active then
         datm_DI_capa.tbl_di_volumes_.ReadOnly         := True;
    end;
    if Not datm_DI_capa.tbl_taxa_cambio_.Active then
       datm_DI_capa.tbl_taxa_cambio_.Open;
    if Not datm_DI_capa.tbl_di_armazem_.Active then
       datm_DI_capa.tbl_di_armazem_.Open;
    if Not datm_DI_capa.tbl_di_volumes_.Active then
       datm_DI_capa.tbl_di_volumes_.Open;
  end;

  //Auxiliar
  if ( pgctrl_capa_di.ActivePage = tbsht_aux) then
  begin
    if in_DI_Registrada then
    begin
      if Not datm_DI_capa.tbl_tp_vinc_expo_impo_.Active then
         datm_DI_capa.tbl_tp_vinc_expo_impo_.ReadOnly  := True;
      if Not datm_DI_capa.tbl_incoterms_.Active then
         datm_DI_Capa.tbl_incoterms_.ReadOnly          := True;
    end;
    if Not datm_DI_capa.tbl_tp_vinc_expo_impo_.Active then
       datm_DI_capa.tbl_tp_vinc_expo_impo_.Open;
    if Not datm_DI_capa.tbl_incoterms_.Active then
       datm_DI_Capa.tbl_incoterms_.Open;
  end;

  //Pagamento
  if ( pgctrl_capa_di.ActivePage = tbsht_pagamento ) then
  begin
    if in_DI_Registrada then
    begin
      if Not datm_DI_capa.tbl_di_DARF_.Active then
         datm_DI_capa.tbl_di_DARF_.ReadOnly           := True;
      if Not datm_DI_capa.tbl_di_comp_trib_.Active then
         datm_DI_capa.tbl_di_comp_trib_.ReadOnly      := True;
    end;
    if Not datm_DI_capa.tbl_di_DARF_.Active then
       datm_DI_capa.tbl_di_DARF_.Open;
    if Not datm_DI_capa.tbl_di_comp_trib_.Active then
       datm_DI_capa.tbl_di_comp_trib_.Open;

    if not datm_DI_capa.qry_di_DARF_.Active then
    begin
      datm_DI_capa.qry_di_DARF_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_capa.qry_di_DARF_.Open;
    end;

    if {(str_cd_cargo = '001') and} not in_DI_Registrada then
      dbg_DARF.Enabled := True;
  end;

  //Câmbio
  if ( pgctrl_capa_di.ActivePage = TabSheet2 ) then
  begin
    if in_DI_Registrada then
    begin
      if Not datm_DI_capa.tbl_yesno_.Active then
         datm_DI_capa.tbl_yesno_.ReadOnly := True;
    end;
    if Not datm_DI_capa.tbl_yesno_.Active then
       datm_DI_capa.tbl_yesno_.Open;
  end;

  datm_DI_Capa.qry_pagto_cambio_prev_.Close;
  datm_DI_Capa.qry_pagto_cambio_prev_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI_Capa.qry_pagto_cambio_prev_.Prepare;
  datm_DI_Capa.qry_pagto_cambio_prev_.Open;
  if ( pgctrl_capa_di.ActivePage = tbsht_informacoes_complementares ) then
  begin
    if in_DI_Registrada then
    begin
      btnObsAutomatica.enabled :=false;
      btnLimpar.enabled        :=false;
      btn_co_obs.enabled       :=false;
    end
    else
    begin
      btnObsAutomatica.enabled :=true;
      btnLimpar.enabled        :=true;
      btn_co_obs.enabled       :=true;
    end;
  end;  
end;

procedure Tfrm_DI_capa.FechaTabelas;
begin
  with datm_DI_capa do
  begin

    if datm_DI_capa.tbl_di_armazem_.State  in [dsEdit,dsInsert] then tbl_di_armazem_.Post;
    if tbl_di_armazem_.Active       then tbl_di_armazem_.Close;

    if datm_DI_capa.tbl_di_volumes_.State  in [dsEdit,dsInsert] then tbl_di_volumes_.Post;
    if tbl_di_volumes_.Active       then tbl_di_volumes_.Close;

    if tbl_di_DARF_.Active          then tbl_di_DARF_.Close;
    if tbl_di_comp_trib_.Active     then tbl_di_comp_trib_.Close;

    if tbl_via_transporte_.Active   then tbl_via_transporte_.Close;

    if tbl_di_proc_vinc_.State in [dsEdit,dsInsert] then tbl_di_proc_vinc_.Post;
    if tbl_di_proc_vinc_.Active     then tbl_di_proc_vinc_.Close;

    if tbl_di_doc_instr_emb_.State in [dsEdit,dsInsert] then tbl_di_doc_instr_emb_.Post;
    if tbl_di_doc_instr_emb_.Active then tbl_di_doc_instr_emb_.Close;
    if tbl_incoterms_.Active        then tbl_incoterms_.Close;

    if tbl_taxa_cambio_.Active then tbl_taxa_cambio_.Close;
    if tbl_tp_vinc_expo_impo_.Active then tbl_tp_vinc_expo_impo_.Close;
    if tbl_yesno_.Active then tbl_yesno_.Close;

    if qry_pagto_cambio_prev_.Active then qry_pagto_cambio_prev_.Close;
  end;
end;

procedure Tfrm_DI_capa.HabilitaContratoCambio;
var
  cd_forma_pagamento: integer;
begin
  cd_forma_pagamento := 0;
  if ( datm_DI_Capa.qry_di_CD_FORMA_PAGAMENTO.AsString <> '' ) and
     Not ( datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] ) then
  begin
    Val(datm_DI_Capa.qry_di_CD_FORMA_PAGAMENTO.AsString, cd_forma_pagamento, Code);
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
end;

procedure Tfrm_DI_capa.DesabilitaContratoCambio;
begin
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

  if datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] then
  begin
    with datm_DI_Capa do
    begin
      qry_di_CD_FORMA_PAGAMENTO.AsString := '3';
      qry_di_IN_MOEDA_NACIONAL.AsBoolean := False;
      qry_di_NR_CONTRATO_CAMBIO.AsString := '';
      qry_di_NR_BANCO_PAGAMENTO.AsString := '';
      qry_di_NR_PRACA_PAGAMENTO.AsString := '';
      qry_di_NR_COMPRADOR_ME.AsString    := '';
    end;
  end;
end;

procedure Tfrm_DI_capa.HabilitaAgente;
begin
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
end;

procedure Tfrm_DI_capa.DesabilitaAgente;
begin
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
  if datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] then
  begin
    with datm_DI_Capa do
    begin
      qry_di_PC_COMISSAO.AsFloat           := 0;
      qry_di_NR_IDENTifICACAO_COM.AsString := '';
      qry_di_NR_BANCO_COM.AsString         := '';
      qry_di_NR_PRACA_COM.AsString         := '';
    end;
  end;
end;

procedure Tfrm_DI_capa.TrocaNullToZero;
begin
  with datm_DI_Capa do
  begin
    NullToZero( qry_di_VL_TOT_FRT_PREPAID );
    NullToZero( qry_di_VL_TOT_FRT_COLLECT );
    NullToZero( qry_di_VL_FRETE_TNAC_MNEG );
    NullToZero( qry_di_VL_TOTAL_FRETE_MN );
    NullToZero( qry_di_VL_TOT_SEGURO_MNEG );
    NullToZero( qry_di_VL_TOTAL_SEG_MN );
    NullToZero( qry_di_VL_TOT_DESPS_MNEG );
    NullToZero( qry_di_VL_TOT_DESPS_MN );
    NullToZero( qry_di_VL_TOT_MLE_MNEG );
    NullToZero( qry_di_VL_TOTAL_MLE_MN );
    NullToZero( qry_di_IN_MOEDA_UNICA );
    NullToZero( qry_di_PB_CARGA );
    NullToZero( qry_di_PL_CARGA );
    NullToZero( qry_di_Calc_VL_TOT_MLE_MN );
    NullToZero( qry_di_Calc_VL_TOT_FRETE_MN );
    NullToZero( qry_di_Calc_VL_TOT_SEGURO_MN );
    NullToZero( qry_di_Calc_TOT_FRETE_MNEG );
    NullToZero( qry_di_QT_ADICOES );
    NullToZero( qry_di_PC_ICMS );
    NullToZero( qry_di_PC_REDUCAO_ICMS );
    NullToZero( qry_di_PC_COMISSAO );
    NullToZero( qry_di_PC_SEGURO_MLE );
    NullToZero( qry_di_VL_TOTAL_II );
    NullToZero( qry_di_VL_TOTAL_IPI );
    NullToZero( qry_di_VL_TOTAL_AD );
    NullToZero( qry_di_VL_TOT_ICMS );
    NullToZero( qry_di_Calc_VL_TOT_DESPESA_MN );
    NullToZero( qry_di_VL_TOT_PIS_COFINS );
  end;
end;

procedure Tfrm_DI_capa.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  if nCodigo = 2 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'COD_ORGAO_REC = '+datm_DI_capa.qry_di_CD_URF_DESPACHO.AsString;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;

  if nCodigo = 3 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'ORGAO = '+datm_DI_capa.qry_di_CD_URF_DESPACHO.AsString+' AND '+
                                            'RECINTO = '+datm_DI_capa.qry_di_CD_RECINTO_ALFAND.AsString;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine        := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

end;

procedure Tfrm_DI_capa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btn_salvar.Enabled then
     if BoxMensagem('A Capa da DI foi alterada.' + #13#10 + 'Deseja salvar as alterações?', 1) then
       btn_salvarClick(nil)
     else btn_cancelarClick(nil);
//  datm_DI_capa.qry_di_.Edit;
//  Atualiza_Historico_Padrao;
//  datm_DI_capa.qry_di_.Post;
  FechaTabelas;
  datm_DI_capa.qry_recinto_setores_importacao_.Close;
  //Genéricas
  datm_DI_capa.qry_di_.Close;
  datm_DI_capa.Free;
  Action := caFree;
  Application.ProcessMessages;
end;

procedure Tfrm_DI_capa.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CONTRATANTE_CAMBIO;
begin
  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1, 12:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '1' then
        begin
          rbtn_contratante_prop_impo1.Checked := True;
          dbedt_cnpj_consignatario1.Clear;
          lbl_cnpj_op_cambial1.Enabled        := False;
          dbedt_cnpj_consignatario1.Enabled   := False;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '2' then
        begin
          rbtn_contratante_outro1.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial1.Enabled      := True;
            dbedt_cnpj_consignatario1.Enabled := True;
          end;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '3' then
        begin
          rbtn_contratante_por_encomenda1.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial1.Enabled      := True;
            dbedt_cnpj_consignatario1.Enabled := True;
          end;
        end;
      end;
      13, 14, 15:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '1' then
        begin
          rbtn_contratante_prop_impo2.Checked := True;
          dbedt_cnpj_consignatario2.Clear;
          lbl_cnpj_op_cambial2.Enabled        := False;
          dbedt_cnpj_consignatario2.Enabled   := False;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '2' then
        begin
          rbtn_contratante_outro2.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial2.Enabled      := True;
            dbedt_cnpj_consignatario2.Enabled := True;
          end;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '3' then
        begin
          rbtn_contratante_por_encomenda3.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial2.Enabled      := True;
            dbedt_cnpj_consignatario2.Enabled := True;
          end;
        end;
      end;
      2, 5:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '1' then
        begin
          rbtn_contratante_prop_impo3.Checked := True;
          dbedt_cnpj_consignatario3.Clear;
          lbl_cnpj_op_cambial5.Enabled        := False;
          dbedt_cnpj_consignatario3.Enabled   := False;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '2' then
        begin
          rbtn_contratante_outro3.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario3.Enabled := True;
          end;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '3' then
        begin
          rbtn_contratante_por_encomenda3.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario3.Enabled := True;
          end;
        end;
      end;
      17, 18:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '1' then
        begin
          rbtn_contratante_prop_impo5.Checked := True;
          dbedt_cnpj_consignatario5.Clear;
          lbl_cnpj_op_cambial5.Enabled        := False;
          dbedt_cnpj_consignatario5.Enabled   := False;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '2' then
        begin
          rbtn_contratante_outro5.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end;
        end
        else
        if datm_DI_capa.qry_di_CD_TIPO_CONSIG.AsString = '3' then
        begin
          rbtn_contratante_por_encomenda5.Checked     := True;
          if Not in_DI_Registrada then
          begin
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.Write_CONTRATANTE_CAMBIO;
begin
  with datm_DI_Capa do
  begin
    if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
    if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_Capa.qry_di_.Edit;
    if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
    begin
      case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
        1, 12:
        begin
          if rbtn_contratante_prop_impo1.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString := '1';
            dbedt_cnpj_consignatario1.Clear;
            lbl_cnpj_op_cambial1.Enabled      := False;
            dbedt_cnpj_consignatario1.Enabled := False;
          end
          else
          if rbtn_contratante_outro1.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '2';
            lbl_cnpj_op_cambial1.Enabled      := True;
            dbedt_cnpj_consignatario1.Enabled := True;
          end
          else
          if rbtn_contratante_por_encomenda1.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '3';
            lbl_cnpj_op_cambial1.Enabled      := True;
            dbedt_cnpj_consignatario1.Enabled := True;
          end;
        end;

        13, 14, 15:
        begin
          if rbtn_contratante_prop_impo2.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '1';
            dbedt_cnpj_consignatario2.Clear;
            lbl_cnpj_op_cambial2.Enabled      := False;
            dbedt_cnpj_consignatario2.Enabled := False;
          end
          else
          if rbtn_contratante_outro2.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '2';
            lbl_cnpj_op_cambial2.Enabled      := True;
            dbedt_cnpj_consignatario2.Enabled := True;
          end
          else
          if rbtn_contratante_por_encomenda2.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '3';
            lbl_cnpj_op_cambial2.Enabled      := True;
            dbedt_cnpj_consignatario2.Enabled := True;
          end;
        end;

        2, 5:
        begin
          if rbtn_contratante_prop_impo3.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '1';
            dbedt_cnpj_consignatario5.Clear;
            lbl_cnpj_op_cambial1.Enabled      := False;
            dbedt_cnpj_consignatario5.Enabled := False;
          end
          else
          if rbtn_contratante_outro3.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '2';
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end
          else
          if rbtn_contratante_por_encomenda3.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '3';
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end;          
        end;

        17, 18:
        begin
          if rbtn_contratante_prop_impo5.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '1';
            dbedt_cnpj_consignatario5.Clear;
            lbl_cnpj_op_cambial1.Enabled      := False;
            dbedt_cnpj_consignatario5.Enabled := False;
          end
          else
          if rbtn_contratante_outro5.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '2';
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end
          else
          if rbtn_contratante_por_encomenda5.Checked then
          begin
            qry_di_CD_TIPO_CONSIG.AsString    := '3';
            lbl_cnpj_op_cambial5.Enabled      := True;
            dbedt_cnpj_consignatario5.Enabled := True;
          end;
        end;
        else
        begin
          qry_di_CD_TIPO_CONSIG.AsString      := '';
          dbedt_cnpj_consignatario1.Clear;
          qry_di_IN_OPERACAO_FUNDAP.AsBoolean := False;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.Write_IN_OPERACAO_FUNDAP;
begin
  with datm_DI_Capa do
  begin
    if ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
       Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then Exit;
    if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
    begin
      case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
        1, 12:
        begin
          if dbchkbox_op_fundap1.Checked then
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := True;
            //rbtn_contratante_prop_impo1.Enabled := True;
            //rbtn_contratante_outro1.Enabled     := True;
            //lbl_cnpj_op_cambial1.Enabled        := True;
            //dbedt_cnpj_consignatario1.Enabled   := True;
            //grpbox_op_cambial1.Enabled          := True;
            //grpbox_op_cambial1.font.Color       := clWindowText;
            //rbtn_contratante_prop_impo1.Checked := True;
          end
          else
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := False;
            //qry_di_CD_TIPO_CONSIG.AsString      := '';
            //rbtn_contratante_prop_impo1.Checked := False;
            //rbtn_contratante_outro1.Checked     := False;
            //dbedt_cnpj_consignatario1.Clear;
            //rbtn_contratante_prop_impo1.Enabled := False;
            //rbtn_contratante_outro1.Enabled     := False;
            //lbl_cnpj_op_cambial1.Enabled        := False;
            //dbedt_cnpj_consignatario1.Enabled   := False;
            //grpbox_op_cambial1.font.Color       := clInactiveCaption;
            //grpbox_op_cambial1.Enabled          := False;
          end;
        end;
        13, 14, 15:
        begin
          if dbchkbox_op_fundap2.Checked then
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := True;
            //rbtn_contratante_prop_impo2.Enabled := True;
            //rbtn_contratante_outro2.Enabled     := True;
            //lbl_cnpj_op_cambial2.Enabled        := True;
            //dbedt_cnpj_consignatario2.Enabled   := True;
            //grpbox_op_cambial2.Enabled          := True;
            //grpbox_op_cambial2.font.Color       := clWindowText;
            //rbtn_contratante_prop_impo2.Checked := True;
          end
          else
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := False;
            //qry_di_CD_TIPO_CONSIG.AsString      := '';
            //rbtn_contratante_prop_impo2.Checked := False;
            //rbtn_contratante_outro2.Checked     := False;
            //dbedt_cnpj_consignatario2.clear;
            //rbtn_contratante_prop_impo2.Enabled := False;
            //rbtn_contratante_outro2.Enabled     := False;
            //lbl_cnpj_op_cambial2.Enabled        := False;
            //dbedt_cnpj_consignatario2.Enabled   := False;
            //grpbox_op_cambial2.font.Color       := clInactiveCaption;
            //grpbox_op_cambial2.Enabled          := False;
          end;
        end;
        17, 18:
        begin
          if dbchkbox_op_fundap5.Checked then
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := True;
            //rbtn_contratante_prop_impo5.Enabled := True;
            //rbtn_contratante_outro5.Enabled     := True;
            //lbl_cnpj_op_cambial5.Enabled        := True;
            //dbedt_cnpj_consignatario5.Enabled   := True;
            //grpbox_op_cambial5.Enabled          := True;
            //grpbox_op_cambial5.font.Color       := clWindowText;
            //rbtn_contratante_prop_impo5.Checked := True;
          end
          else
          begin
            qry_di_IN_OPERACAO_FUNDAP.AsBoolean := False;
            //qry_di_CD_TIPO_CONSIG.AsString      := '';
            //rbtn_contratante_prop_impo5.Checked := False;
            //rbtn_contratante_outro5.Checked     := False;
            //dbedt_cnpj_consignatario5.clear;
            //rbtn_contratante_prop_impo5.Enabled := False;
            //rbtn_contratante_outro5.Enabled     := False;
            //lbl_cnpj_op_cambial5.Enabled        := False;
            //dbedt_cnpj_consignatario5.Enabled   := False;
            //grpbox_op_cambial5.font.Color       := clInactiveCaption;
            //grpbox_op_cambial5.Enabled          := False;
          end;
        end;
        else //case
        begin
          qry_di_IN_OPERACAO_FUNDAP.AsBoolean   := False;
          //qry_di_CD_TIPO_CONSIG.AsString        := '';
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_IN_OPERACAO_FUNDAP;
begin
  with datm_DI_Capa do
  begin
    if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
    begin
      case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
        1, 12:
        begin
          if qry_di_IN_OPERACAO_FUNDAP.AsBoolean then
          begin
            if Not in_DI_Registrada then
            begin
              rbtn_contratante_prop_impo1.Enabled := True;
              rbtn_contratante_outro1.Enabled     := True;
              rbtn_contratante_por_encomenda1.Enabled     := True;
              lbl_cnpj_op_cambial1.Enabled        := True;
              dbedt_cnpj_consignatario1.Enabled   := True;
              grpbox_op_cambial1.Enabled          := True
            end;
            grpbox_op_cambial1.font.Color         := clWindowText;
          end
          else
          begin
            rbtn_contratante_prop_impo1.Checked   := False;
            rbtn_contratante_outro1.Checked       := False;
            rbtn_contratante_por_encomenda1.Checked       := False;
            dbedt_cnpj_consignatario1.text        := '';
            rbtn_contratante_prop_impo1.Enabled   := False;
            rbtn_contratante_outro1.Enabled       := False;
            rbtn_contratante_por_encomenda1.Enabled       := False;
            lbl_cnpj_op_cambial1.Enabled          := False;
            dbedt_cnpj_consignatario1.Enabled     := False;
            grpbox_op_cambial1.font.Color         := clInactiveCaption;
            grpbox_op_cambial1.Enabled            := False;
          end;
        end;
        13, 14, 15:
        begin
          if qry_di_IN_OPERACAO_FUNDAP.AsBoolean then
          begin
            if Not in_DI_Registrada then
            begin
              rbtn_contratante_prop_impo2.Enabled := True;
              rbtn_contratante_outro2.Enabled     := True;
              rbtn_contratante_por_encomenda2.Enabled     := True;
              lbl_cnpj_op_cambial2.Enabled        := True;
              dbedt_cnpj_consignatario2.Enabled   := True;
              grpbox_op_cambial2.Enabled          := True
            end;
            grpbox_op_cambial2.font.Color         := clWindowText;
          end
          else
          begin
            rbtn_contratante_prop_impo2.Checked   := False;
            rbtn_contratante_outro2.Checked       := False;
            rbtn_contratante_por_encomenda2.Checked       := False;
            dbedt_cnpj_consignatario2.text        := '';
            rbtn_contratante_prop_impo2.Enabled   := False;
            rbtn_contratante_outro2.Enabled       := False;
            rbtn_contratante_por_encomenda2.Enabled       := False;            
            lbl_cnpj_op_cambial2.Enabled          := False;
            dbedt_cnpj_consignatario2.Enabled     := False;
            grpbox_op_cambial2.font.Color         := clInactiveCaption;
            grpbox_op_cambial2.Enabled            := False;
          end;
        end;
        17, 18:
        begin
          if qry_di_IN_OPERACAO_FUNDAP.AsBoolean then
          begin
            if Not in_DI_Registrada then
            begin
              rbtn_contratante_prop_impo5.Enabled := True;
              rbtn_contratante_outro5.Enabled     := True;
              rbtn_contratante_por_encomenda5.Enabled     := True;              
              lbl_cnpj_op_cambial5.Enabled        := True;
              dbedt_cnpj_consignatario5.Enabled   := True;
              grpbox_op_cambial5.Enabled          := True
            end;
            grpbox_op_cambial5.font.Color         := clWindowText;
          end
          else
          begin
            rbtn_contratante_prop_impo5.Checked   := False;
            rbtn_contratante_outro5.Checked       := False;
            rbtn_contratante_por_encomenda5.Checked       := False;            
            dbedt_cnpj_consignatario5.text        := '';
            rbtn_contratante_prop_impo5.Enabled   := False;
            rbtn_contratante_outro5.Enabled       := False;
            rbtn_contratante_por_encomenda5.Enabled       := False;            
            lbl_cnpj_op_cambial5.Enabled          := False;
            dbedt_cnpj_consignatario5.Enabled     := False;
            grpbox_op_cambial5.font.Color         := clInactiveCaption;
            grpbox_op_cambial5.Enabled            := False;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.Write_CD_TIPO_IMPORTADOR;
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
  if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_Capa.qry_di_.Edit;
  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      5:
      begin
        if rbtn_Pessoa_juridica1.Checked        then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString := '1';
        if rbtn_pessoa_fisica_pais1.Checked     then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString := '2';
        if rbtn_pessoa_fisica_exterior1.Checked then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString := '3';
        if rbtn_missao_diplomatica1.Checked     then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString := '4';
      end;
      1, 2, 3, 6, 8, 12, 13, 15, 19, 20, 21:
      begin
        if rbtn_Pessoa_juridica2.Checked       then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString  := '1';
        if rbtn_pessoa_fisica_pais2.Checked    then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString  := '2';
        if rbtn_missao_diplomatica2.Checked    then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString  := '4';
      end;
      4, 7, 9, 10, 16, 17, 18:
      begin
        datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString := '1';
      end;
      14:
      begin
        if rbtn_Pessoa_juridica3.Checked       then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString  := '1';
        if rbtn_missao_diplomatica3.Checked    then datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString  := '4';
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.Write_CD_MODALIDADE_DESP;
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
  if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_Capa.qry_di_.Edit;
  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1, 12:
      begin
        if rbtn_modalidade_despacho_normal1.Checked       then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '1';
        if rbtn_modalidade_despacho_antecipado1.Checked   then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '2';
        if rbtn_modalidade_despacho_simplificado1.Checked then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '3';
        if rbtn_modalidade_despacho_ant_simp1.Checked     then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '4';
        if rbtn_modalidade_despacho_ent_frac1.Checked     then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '5';
        if rbtn_modalidade_despacho_ant_ent_frac1.Checked then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '6';
        if rbtn_modalidade_despacho_SobreAguasOEA.Checked then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '7';
      end;
      2, 3, 4, 5, 6, 7, 8, 9, 10:
      begin
        if rbtn_modalidade_despacho_normal2.Checked       then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '1';
        if rbtn_modalidade_despacho_antecipado2.Checked   then datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString := '2';
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  try
    Grava(Sender);
  except
    on e : exception do
    begin
      // Verifica se houve erro de divisão por zero na gravação ou no cancelamento - Michel - 24/10/2008
      if (e is EDivByZero) or (e is EAccessViolation) then
        Application.MessageBox('Houve um erro de cálculo.'#13'Verifique os valores e moedas cadastradas.',
                               'Ocorreu um erro no myIndaiá !', MB_OK + MB_ICONSTOP)
      else
        Application.MessageBox(PChar('Ocorreu o seguinte erro no myIndaiá:' + #13#10 + E.Message + #13#10 +
                               'Fvr informar imediatamente ao suporte.'),
                               'Ocorreu um erro no myIndaiá !', MB_OK + MB_ICONSTOP);
      TrataErro(E);
    end;
  end;
  // se o campo de número e data do registro da DI estiverem preenchidos
  // e o representante for 01045 ( E-COMEX ), deve lançar os impostos.
  if ( Trim(datm_di_capa.qry_di_NR_DECLARACAO_IMP.AsString) <> '' ) and
     ( Trim(datm_di_capa.qry_di_DT_REGISTRO_DI.AsString)    <> '' ) then
 //and  by Carlos e Vitor ( desnecessaria a validação , pois a mesma já é feita no onshow do form)
 //
 //    ( ( Trim(ConsultaLookupSQL(' SELECT CD_REPRESENTANTE ' +
 //                               ' FROM TPROCESSO ' +
 //                               ' WHERE NR_PROCESSO = ''' + str_nr_processo + '''','CD_REPRESENTANTE'))   <> '' ) or
 //    ( Trim(ConsultaLookupSQL('select c.CD_CARGO from TCARGO c where c.IN_MANAGER="1" and c.CD_CARGO="'+str_cd_cargo+'"','CD_CARGO') )<>''  ) or
 //    ( str_cd_cargo = '001' ) ) then
     LancaImpostos(str_nr_processo)


end;

procedure tfrm_di_capa.LancaImpostos( pProcesso : string );
begin

  with datm_di_capa do
  begin

    { atualiza NR. DA apenas se for processo IE - kleber guedes 24/01/2006 }
    if datm_di_capa.qry_di_CD_TIPO_DECLARACAO.AsString = '02' then //tipo da declaração (processo IE)
      Cria_SQL( 'UPDATE TPROCESSO SET NR_DI = ' + QuotedStr( datm_di_capa.qry_di_NR_DECLARACAO_IMP.AsString ) +
                ', NR_DA = ' + QuotedStr( datm_di_capa.qry_di_NR_DECLARACAO_IMP.AsString ) +
                ' WHERE NR_PROCESSO = ' + QuotedStr( pProcesso ) )
    else
      Cria_SQL( 'UPDATE TPROCESSO SET NR_DI = ' + QuotedStr( datm_di_capa.qry_di_NR_DECLARACAO_IMP.AsString ) +
                ' WHERE NR_PROCESSO = ' + QuotedStr( pProcesso ) );

    // Atualiza FUP
    //Cria_SQL( ' Exec sp_atz_evento ''' + pProcesso + ''', ''CD_EV_REG_DI'', ''' + Copy( datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 1, 2 ) + '/' +
    //                                                                              Copy( datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 3, 2 ) + '/' +
    //                                                                              Copy( datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 5, 4 ) + '''');

    // Funcionava da forma acima, mas estava gerando erro em alguns momentos devido as configurações regionais - Michel - 22/05/2009
    //Realizar evento Registro da DI
    CloseStoredProc(sp_atz_evento);
    sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_di_NR_PROCESSO.AsString;
    sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_REG_DI';
    sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate(Copy(datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
                                                                        Copy(datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
                                                                        Copy(datm_di_capa.qry_di_DT_REGISTRO_DI.AsString, 5, 4));
    ExecStoredProc(sp_atz_evento);
    CloseStoredProc(sp_atz_evento);

    {Distribui S.D.A. Automaticamente}
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_INCIDE_SDA' +
              '  FROM TCLIENTE_SERVICO (NOLOCK) ' +
              ' WHERE CD_CLIENTE  = ''' + datm_di_capa.qry_di_CD_IMPORTADOR.AsString + ''' AND' +
              '       CD_UNID_NEG = ''' + Copy(pProcesso,1,2) + ''' AND' +
              '       CD_PRODUTO  = ''01'' AND' +
              '       CD_SERVICO  = (SELECT CD_SERVICO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + ''')');
      Open;
      if not IsEmpty then
      begin
        if FieldByName('IN_INCIDE_SDA').AsString = '1' then
        begin
          Cria_SQL( 'UPDATE TPROCESSO_SDA SET IN_DISTR = "1", CD_USUARIO_DISTR = ' + QuotedStr( str_cd_usuario ) +
                    ' WHERE NR_PROCESSO = ' + QuotedStr( pProcesso ) );
          Cria_SQL( ' Exec sp_distribui_sda ''' + Copy(pProcesso,1,2) + ''',''01'', ''' + str_cd_usuario + '''');
        end;
      end;
      Free;
    end;

    // lança impostos
    Cria_SQL( ' Exec sp_di_distribui_deb_com ''' + pProcesso + '''');
  end;
end;

procedure Tfrm_DI_capa.btn_cancelarClick(Sender: TObject);
begin
  try
    if Sender = btn_cancelar then
    begin
      if Application.MessageBox('Deseja cancelar as alterações?', 'Confirmação - Cancelamento', MB_YESNO + MB_ICONQUESTION) = mrYes then
        Cancela(Sender);
    end else
      Cancela(Sender);
  except
    on e : exception do
    begin
      // Verifica se houve erro de divisão por zero na gravação ou no cancelamento - Michel - 24/10/2008
      if (e is EDivByZero) or (e is EAccessViolation) then
        Application.MessageBox('Houve um erro de cálculo.'#13'Verifique os valores e moedas cadastradas.',
                               'Ocorreu um erro no myIndaiá !', MB_OK + MB_ICONSTOP)
      else
        Application.MessageBox(PChar('Ocorreu o seguinte erro no myIndaiá:' + #13#10 + E.Message + #13#10 +
                             'Fvr informar imediatamente ao suporte.'),
                             'Ocorreu um erro no myIndaiá !', MB_OK + MB_ICONSTOP);
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_DI_capa.Via_de_Transporte;
var
  i : integer;
begin
//  Val(datm_DI_capa.qry_di_CD_VIA_TRANSP_CARG.AsString, i_cod_via_transp, Code);
  if i_cod_via_transp = 0 then
  begin
     i_cod_via_transp := 4;
  end;
  With datm_DI_capa.tbl_via_transporte_ Do
  begin
    in_abrindo_via := True;
    IndexFieldNames := 'CD_VIA_TRANSPORTE';
    FindKey([ StrZero( i_cod_via_transp, 2) ]);
    IndexFieldNames := 'NM_VIA_TRANSPORTE';
    in_abrindo_via := False;
  end;
  if in_DI_Registrada then
  for i := 0 to ComponentCount - 1 do
  begin
    if ( Components[i] is TDBGrid ) then
       TDBGrid( Components[i] ).Enabled := False;
  end;
end;

procedure Tfrm_DI_capa.Desativa_transporte;
begin
  tbsht_Transporte_maritimo.TabVisible       := False;
  tbsht_Transporte_Fluvial.TabVisible        := False;
  tbsht_Transporte_Lacustre.TabVisible       := False;
  tbsht_Transporte_aereo.TabVisible          := False;
  tbsht_Transporte_Postal.TabVisible         := False;
  tbsht_Transporte_Ferroviario.TabVisible    := False;
  tbsht_Transporte_Rodoviario.TabVisible     := False;
  tbsht_Transporte_Tubo_Coduto.TabVisible    := False;
  tbsht_Transporte_Meios_Proprios.TabVisible := False;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_TIPO_IMPORTADOR;
begin
  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      5:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '1' then rbtn_Pessoa_juridica1.Checked        := True
        else
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '2' then rbtn_pessoa_fisica_pais1.Checked     := True
        else
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '3' then rbtn_pessoa_fisica_exterior1.Checked := True
        else
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '4' then rbtn_missao_diplomatica1.Checked     := True
        else
        // Default - Pessoa Jurírica 
        rbtn_Pessoa_juridica1.Checked        := True;
      end;
      1, 2, 3, 6, 8, 12, 13, 15, 19, 20, 21:
      begin
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '1' then rbtn_Pessoa_juridica2.Checked    := True
        else
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '2' then rbtn_pessoa_fisica_pais2.Checked := True
        else
        if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '4' then rbtn_missao_diplomatica2.Checked := True
        else
        //Default - Pessoa Jurírica 
        rbtn_Pessoa_juridica2.Checked    := True;
      end;
     14:
     begin
       if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '1' then rbtn_Pessoa_juridica3.Checked    := True
       else
       if datm_DI_capa.qry_di_CD_TIPO_IMPORTADOR.AsString = '4' then rbtn_missao_diplomatica3.Checked := True
       else
       //Default - Pessoa Jurírica 
       rbtn_Pessoa_juridica3.Checked    := True;
     end;
    end;
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_MODALIDADE_DESP;
begin
  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1, 12:
      begin
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '1' then rbtn_modalidade_despacho_normal1.Checked       := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '2' then rbtn_modalidade_despacho_antecipado1.Checked   := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '3' then rbtn_modalidade_despacho_simplificado1.Checked := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '4' then rbtn_modalidade_despacho_ant_simp1.Checked     := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '5' then rbtn_modalidade_despacho_ent_frac1.Checked     := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '6' then rbtn_modalidade_despacho_ant_ent_frac1.Checked := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '7' then rbtn_modalidade_despacho_SobreAguasOEA.Checked := True
        else
        // Default - Normal 
        rbtn_modalidade_despacho_normal1.Checked       := True
      end;
      2, 3, 4, 5, 6, 7, 8, 9, 10:
      begin
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '1' then rbtn_modalidade_despacho_normal2.Checked       := True
        else
        if datm_DI_capa.qry_di_CD_MODALIDADE_DESP.AsString = '2' then rbtn_modalidade_despacho_antecipado2.Checked   := True
        else
        // Default - Normal 
        rbtn_modalidade_despacho_normal2.Checked       := True;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_VIA_TRANSPORTE;
var
  varOK : Boolean;
begin
  varOK := Not ( in_DI_Registrada or ( dbedt_cd_tipo_declaracao.Text = '') );

  in_abrindo_via := True;

  tbsht_Transporte_maritimo.TabVisible       := False;
  tbsht_Transporte_Fluvial.TabVisible        := False;
  tbsht_Transporte_Lacustre.TabVisible       := False;
  tbsht_Transporte_aereo.TabVisible          := False;
  tbsht_Transporte_Postal.TabVisible         := False;
  tbsht_Transporte_Ferroviario.TabVisible    := False;
  tbsht_Transporte_Rodoviario.TabVisible     := False;
  tbsht_Transporte_Tubo_Coduto.TabVisible    := False;
  tbsht_Transporte_Meios_Proprios.TabVisible := False;

  if i_cod_via_transp = 0 then i_cod_via_transp := 4;
  if Not ( i_cod_via_transp in [16..21] ) then
  begin
    tbsht_Transporte_maritimo.TabVisible       := (i_cod_via_transp = 1);
    tbsht_Transporte_Fluvial.TabVisible        := (i_cod_via_transp = 2);
    tbsht_Transporte_Lacustre.TabVisible       := (i_cod_via_transp = 3);
    tbsht_Transporte_aereo.TabVisible          := (i_cod_via_transp = 4);
    tbsht_Transporte_Postal.TabVisible         := (i_cod_via_transp = 5);
    tbsht_Transporte_Ferroviario.TabVisible    := (i_cod_via_transp = 6);
    tbsht_Transporte_Rodoviario.TabVisible     := (i_cod_via_transp = 7);
    tbsht_Transporte_Tubo_Coduto.TabVisible    := (i_cod_via_transp = 8);
    tbsht_Transporte_Meios_Proprios.TabVisible := (i_cod_via_transp = 9);
  end;

  if varOK then datm_DI_capa.qry_di_NR_DCTO_CARGA.EditMask := '';

  case i_cod_via_transp of
    1:
    begin //Marítimo
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '10'  then
      begin
        if varOK then dbedt_nr_doc_carga_master2.Clear;
        HabDes( dbedt_nr_doc_carga_master2, False);
        rbtn_BL1.Checked                    := True;
        rbtn_House_BL1.Checked              := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '12'  then
      begin
        HabDes( dbedt_nr_doc_carga_master2, True );
        rbtn_BL1.Checked                    := False;
        rbtn_House_BL1.Checked              := True;
      end
      else
      begin
        rbtn_BL1.Checked                    := False;
        rbtn_House_BL1.Checked              := False;
        HabDes( dbedt_nr_doc_carga2,        False );
        HabDes( dbedt_nr_doc_carga_master2, False );
        HabDes( dbedt_cd_local_embarque2,   False );
        HabDes( btn_co_local_embarque2,     False );
        HabDes( dbedt_dt_embarque2,         False );
      end;

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '1' then
      begin
        rbtn_manifesto_carga2.Checked := True;
        rbtn_dta2.Checked             := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_manifesto_carga2.Checked := False;
        rbtn_dta2.Checked             := True;
      end
      else
      begin
        rbtn_manifesto_carga2.Checked := False;
        rbtn_dta2.Checked             := False;
        lbl_identificacao2.Enabled    := False;
        HabDes( dbedt_identificacao2, False);
        dbedt_identificacao2.Clear;
      end;
    end;

    2:
    begin //Fluvial
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '10'  then
      begin
        dbedt_nr_doc_carga_master6.Clear;
        HabDes( dbedt_nr_doc_carga_master6, False );
        rbtn_BL2.Checked                    := True;
        rbtn_House_BL2.Checked              := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '12'  then
      begin
        HabDes( dbedt_nr_doc_carga_master6, True);
        rbtn_BL2.Checked                    := False;
        rbtn_House_BL2.Checked              := True;
      end
      else
      begin
        rbtn_BL2.Checked                    := False;
        rbtn_House_BL2.Checked              := False;
        HabDes( dbedt_nr_doc_carga6,        False );
        HabDes( dbedt_nr_doc_carga_master6, False );
        HabDes( dbedt_cd_local_embarque6,   False );
        HabDes( btn_co_local_embarque6,     False );
        HabDes( dbedt_dt_embarque6,         False );
      end;

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '1' then
      begin
        rbtn_manifesto_carga6.Checked := True;
        rbtn_dta6.Checked             := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_manifesto_carga6.Checked := False;
        rbtn_dta6.Checked             := True;
      end
      else
      begin
        rbtn_manifesto_carga6.Checked := False;
        rbtn_dta6.Checked             := False;
        lbl_identificacao6.Enabled    := False;
        HabDes( dbedt_identificacao6, False);
        dbedt_identificacao6.Clear;
      end;
    end;

    3:
    begin //Lacustre
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '10'  then
      begin
        dbedt_nr_doc_carga_master7.Clear;
        HabDes( dbedt_nr_doc_carga_master7, False );
        rbtn_BL3.Checked                    := True;
        rbtn_House_BL3.Checked              := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '12'  then
      begin
        HabDes( dbedt_nr_doc_carga_master7, True );
        rbtn_BL3.Checked                    := False;
        rbtn_House_BL3.Checked              := True;
      end
      else
      begin
        rbtn_BL3.Checked                    := False;
        rbtn_House_BL3.Checked              := False;
        HabDes( dbedt_nr_doc_carga7,        False );
        HabDes( dbedt_nr_doc_carga_master7, False );
        HabDes( dbedt_cd_local_embarque7,   False );
        HabDes( btn_co_local_embarque7,     False );
        HabDes( dbedt_dt_embarque7,         False );
        dbedt_identificacao7.Clear;
      end;

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '1' then
      begin
        rbtn_manifesto_carga7.Checked := True;
        rbtn_dta7.Checked             := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_manifesto_carga7.Checked := False;
        rbtn_dta7.Checked             := True;
      end
      else
      begin
        rbtn_manifesto_carga7.Checked := False;
        rbtn_dta7.Checked             := False;
        lbl_identificacao7.Enabled    := False;
        HabDes( dbedt_identificacao7, False);
        dbedt_identificacao7.Clear;
      end;
    end;

    4:
    begin //Aérea
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '01'  then
      begin
        dbedt_nr_doc_carga_master1.Clear;
        HabDes( dbedt_nr_doc_carga_master1, False);
        rbtn_AWB.Checked                    := True;
        rbtn_House_AWB.Checked              := False;
        rbtn_DSIC.Checked                   := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '03'  then
      begin
        HabDes( dbedt_nr_doc_carga_master1, True);
        rbtn_AWB.Checked                    := False;
        rbtn_House_AWB.Checked              := True;
        rbtn_DSIC.Checked                   := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '14'  then
      begin
        dbedt_nr_doc_carga_master1.Clear;
        HabDes( dbedt_nr_doc_carga_master1, False);
        rbtn_AWB.Checked                    := False;
        rbtn_House_AWB.Checked              := False;
        rbtn_DSIC.Checked                   := True;
      end
      else
      begin
        rbtn_AWB.Checked                    := False;
        rbtn_House_AWB.Checked              := False;
        rbtn_DSIC.Checked                   := False;
        HabDes( dbedt_nr_doc_carga1,        False );
        HabDes( dbedt_nr_doc_carga_master1, False );
        HabDes( dbedt_cd_local_embarque1,   False );
        HabDes( btn_co_local_embarque1,     False );
        HabDes( dbedt_dt_embarque1,         False );
      end;

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '2' then
      begin
        rbtn_termo_entrada1.Checked := True;
        rbtn_dta1.Checked           := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_termo_entrada1.Checked := False;
        rbtn_dta1.Checked           := True;
      end
      else
      begin
        rbtn_termo_entrada1.Checked := False;
        rbtn_dta1.Checked           := False;
        lbl_identificacao1.Enabled  := False;
        HabDes( dbedt_identificacao1, False);
        dbedt_identificacao1.Clear;
      end;
    end;

    6:
    begin  //Ferroviário
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '17'  then
      begin
        dbedt_nr_doc_carga_master4.Clear;
        HabDes( dbedt_nr_doc_carga_master4, False );
        rbtn_RWB.Checked                    := True;
        rbtn_House_RWB.Checked              := False;
        rbtn_Tif_DTA.Checked                := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '18'  then
      begin
        HabDes( dbedt_nr_doc_carga_master4, True );
        rbtn_RWB.Checked                    := False;
        rbtn_House_RWB.Checked              := True;
        rbtn_Tif_DTA.Checked                := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString = '19'  then
      begin
        dbedt_nr_doc_carga_master4.Clear;
        HabDes( dbedt_nr_doc_carga_master4, False );
        rbtn_RWB.Checked                    := False;
        rbtn_House_RWB.Checked              := False;
        rbtn_Tif_DTA.Checked                := True;
      end
      else
      begin
        rbtn_RWB.Checked                    := False;
        rbtn_House_RWB.Checked              := False;
        rbtn_Tif_DTA.Checked                := False;
        HabDes( dbedt_nr_doc_carga4,        False );
        HabDes( dbedt_nr_doc_carga_master4, False );
        HabDes( dbedt_cd_local_embarque4,   False );
        HabDes( btn_co_local_embarque4,     False );
        HabDes( dbedt_dt_embarque4,         False );
      end;

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '1' then
      begin
        rbtn_manifesto_carga4.Checked := True;
        rbtn_dta4.Checked             := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_manifesto_carga4.Checked := False;
        rbtn_dta4.Checked             := True;
      end
      else
      begin
        rbtn_manifesto_carga4.Checked := False;
        rbtn_dta4.Checked             := False;
        lbl_identificacao4.Enabled    := False;
        HabDes( dbedt_identificacao4, False);
        dbedt_identificacao4.Clear;
      end;
    end;

    7:
    begin //Rodoviário
      datm_DI_capa.qry_di_NR_DCTO_CARGA.EditMask := '';

      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '1' then
      begin
        rbtn_manifesto_carga3.Checked := True;
        rbtn_dta3.Checked             := False;
        rbtn_mic_dta3.Checked         := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '3' then
      begin
        rbtn_manifesto_carga3.Checked := False;
        rbtn_dta3.Checked             := True;
        rbtn_mic_dta3.Checked         := False;
      end
      else
      if datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString = '4' then
      begin
        rbtn_manifesto_carga3.Checked := False;
        rbtn_dta3.Checked             := False;
        rbtn_mic_dta3.Checked         := True;
      end
      else
      begin
        rbtn_manifesto_carga3.Checked := False;
        rbtn_dta3.Checked             := False;
        rbtn_mic_dta3.Checked         := False;
        lbl_identificacao3.Enabled    := False;
        HabDes( dbedt_identificacao3, False);
        dbedt_identificacao3.Clear;
      end;
    end;
  end;
  in_abrindo_via := False;
end;

procedure Tfrm_DI_capa.Write_CD_VIA_TRANSPORTE;
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
  if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_Capa.qry_di_.Edit;

//  Val(datm_DI_capa.tbl_via_transporte_CD_VIA_TRANSPORTE.AsString, i_cod_via_transp, Code);
  if i_cod_via_transp in [1..9] then
  begin
    datm_DI_capa.qry_di_CD_VIA_TRANSP_CARG.AsString := StrZero( i_cod_via_transp, 2 );
  end;

  case i_cod_via_transp of
    1:
    begin //Marítimo
      if ( ( rbtn_BL1.Checked ) or ( rbtn_House_BL1.Checked ) ) and ( dbedt_nr_doc_carga2.ReadOnly ) then
      begin
        HabDes( dbedt_nr_doc_carga2,        True );
        HabDes( dbedt_cd_local_embarque2,   True );
        HabDes( btn_co_local_embarque2,     True );
        HabDes( dbedt_dt_embarque2,         True );
      end;

      if rbtn_BL1.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master2, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '10';
      end
      else
      if rbtn_House_BL1.Checked then
      begin
        HabDes( dbedt_nr_doc_carga_master2, True);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '12';
      end
      else
      begin
        LimpaConhecimento;
        HabDes( dbedt_nr_doc_carga2,        False );
        HabDes( dbedt_nr_doc_carga_master2, False );
        HabDes( dbedt_cd_local_embarque2,   False );
        HabDes( btn_co_local_embarque2,     False );
        HabDes( dbedt_dt_embarque2,         False );
      end;

      if rbtn_manifesto_carga2.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '1';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao2.Enabled                   := True;
          HabDes( dbedt_identificacao2, True);
        end;
      end
      else
      if rbtn_dta2.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao2.Enabled                   := True;
          HabDes( dbedt_identificacao2, True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao2.Enabled                     := False;
        HabDes( dbedt_identificacao2, False );
      end;
    end;

    2:
    begin //Fluvial
      if ( ( rbtn_BL2.Checked ) or ( rbtn_House_BL2.Checked ) ) and ( dbedt_nr_doc_carga6.ReadOnly ) then
      begin
        HabDes( dbedt_nr_doc_carga6,        True );
        HabDes( dbedt_cd_local_embarque6,   True );
        HabDes( btn_co_local_embarque6,     True );
        HabDes( dbedt_dt_embarque6,         True );
      end;

      if rbtn_BL2.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master6, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '10'
      end
      else
      if rbtn_House_BL2.Checked then
      begin
        HabDes( dbedt_nr_doc_carga_master6, True);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '12';
      end
      else
      begin
        LimpaConhecimento;
        HabDes( dbedt_nr_doc_carga6,        False );
        HabDes( dbedt_nr_doc_carga_master6, False );
        HabDes( dbedt_cd_local_embarque6,   False );
        HabDes( btn_co_local_embarque6,     False );
        HabDes( dbedt_dt_embarque6,         False );
      end;

      if rbtn_manifesto_carga6.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '1';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao6.Enabled                   := True;
          HabDes( dbedt_identificacao6, True );
        end;
      end
      else
      if rbtn_dta6.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao6.Enabled                   := True;
          HabDes( dbedt_identificacao6, True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao6.Enabled                     := False;
        HabDes( dbedt_identificacao6, False );
      end;
    end;

    3:
    begin //Lacustre
      if ( ( rbtn_BL3.Checked ) or ( rbtn_House_BL3.Checked ) ) and ( dbedt_nr_doc_carga7.ReadOnly ) then
      begin
        HabDes( dbedt_nr_doc_carga7,        True );
        HabDes( dbedt_cd_local_embarque7,   True );
        HabDes( btn_co_local_embarque7,     True );
        HabDes( dbedt_dt_embarque7,         True );
      end;

      if rbtn_BL3.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master7, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '10'
      end
      else
      if rbtn_House_BL3.Checked then
      begin
        HabDes( dbedt_nr_doc_carga_master7, True);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '12';
      end
      else
      begin
        LimpaConhecimento;
        HabDes( dbedt_nr_doc_carga7,        False );
        HabDes( dbedt_nr_doc_carga_master7, False );
        HabDes( dbedt_cd_local_embarque7,   False );
        HabDes( btn_co_local_embarque7,     False );
        HabDes( dbedt_dt_embarque7,         False );
      end;

      if rbtn_manifesto_carga7.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '1';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao7.Enabled                   := True;
          HabDes( dbedt_identificacao7, True );
        end;
      end
      else
      if rbtn_dta7.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao7.Enabled                   := True;
          HabDes( dbedt_identificacao7,  True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao7.Enabled                     := False;
        HabDes( dbedt_identificacao7, False);
      end;
    end;

    4:
    begin //Aéreo
      if ( ( rbtn_AWB.Checked ) or ( rbtn_House_AWB.Checked ) or ( rbtn_DSIC.Checked ) )
         and ( dbedt_nr_doc_carga1.ReadOnly ) then
      begin
        HabDes( dbedt_nr_doc_carga1,        True );
        HabDes( dbedt_cd_local_embarque1,   True );
        HabDes( btn_co_local_embarque1,     True );
        HabDes( dbedt_dt_embarque1,         True );
      end;

      if rbtn_AWB.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master1, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '01'
      end
      else
      if rbtn_House_AWB.Checked then
      begin
        HabDes( dbedt_nr_doc_carga_master1, True);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '03';
      end
      else
      if rbtn_DSIC.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master1, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '14';
      end
      else
      begin
        LimpaConhecimento;
        HabDes( dbedt_nr_doc_carga1,        False );
        HabDes( dbedt_nr_doc_carga_master1, False );
        HabDes( dbedt_cd_local_embarque1,   False );
        HabDes( btn_co_local_embarque1,     False );
        HabDes( dbedt_dt_embarque1,         False );
      end;

      if rbtn_termo_entrada1.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '2';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao1.Enabled                   := True;
          HabDes( dbedt_identificacao1, True);
        end;
      end
      else
      if rbtn_dta1.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao1.Enabled                   := True;
          HabDes( dbedt_identificacao1, True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao1.Enabled                     := False;
        HabDes( dbedt_identificacao1, False);
      end;
    end;

    5:
    begin  //Postal
      datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '20';
    end;

    6:
    begin  //Ferroviário
      if ( ( rbtn_RWB.Checked ) or ( rbtn_House_RWB.Checked ) or ( rbtn_Tif_DTA.Checked ) )
         and ( dbedt_nr_doc_carga4.ReadOnly ) then
      begin
        HabDes( dbedt_nr_doc_carga4,        True );
        HabDes( dbedt_cd_local_embarque4,   True );
        HabDes( btn_co_local_embarque4,     True );
        HabDes( dbedt_dt_embarque4,         True );
      end;

      if rbtn_RWB.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master4, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '17'
      end
      else
      if rbtn_House_RWB.Checked then
      begin
        HabDes( dbedt_nr_doc_carga_master4, True);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '18';
      end
      else
      if rbtn_Tif_DTA.Checked then
      begin
        datm_DI_capa.qry_di_NR_DCTO_CARGA_MAST.AsString := '';
        HabDes( dbedt_nr_doc_carga_master4, False);
        datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '19';
      end
      else
      begin
        LimpaConhecimento;
        HabDes( dbedt_nr_doc_carga4,        False );
        HabDes( dbedt_nr_doc_carga_master4, False );
        HabDes( dbedt_cd_local_embarque4,   False );
        HabDes( btn_co_local_embarque4,     False );
        HabDes( dbedt_dt_embarque4,         False );
      end;

      if rbtn_manifesto_carga4.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '1';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao4.Enabled                   := True;
          HabDes( dbedt_identificacao4, True);
        end;
      end
      else
      if rbtn_dta4.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao4.Enabled                   := True;
          HabDes( dbedt_identificacao4, True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao2.Enabled                     := False;
        HabDes( dbedt_identificacao4, False);
      end;
    end;

    7:
    begin //Rodoviário
      datm_DI_capa.qry_di_CD_TIPO_DCTO_CARGA.AsString := '13';

      if rbtn_manifesto_carga3.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '1';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao3.Enabled                   := True;
          HabDes( dbedt_identificacao3, True);
        end;
      end
      else
      if rbtn_dta3.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '3';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao3.Enabled                   := True;
          HabDes( dbedt_identificacao3, True);
        end;
      end
      else
      if rbtn_mic_dta3.Checked then
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '4';
        if Not in_DI_Registrada then
        begin
          lbl_identificacao3.Enabled                   := True;
          HabDes( dbedt_identificacao3, True);
        end;
      end
      else
      begin
        datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
        lbl_identificacao3.Enabled                     := False;
        HabDes( dbedt_identificacao3, False);
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_TIPO_DECLARACAO;
begin
  tbsht_importador_TD01.TabVisible   := False;
  tbsht_importador_TD04.TabVisible   := False;
  tbsht_importador_TD05.TabVisible   := False;
  tbsht_importador_TD14.TabVisible   := False;

  tbsht_basicas_TD01.TabVisible      := False;
  tbsht_basicas_TD02.TabVisible      := False;
  tbsht_basicas_TD13.TabVisible      := False;

  tbsht_carga_TD01.TabVisible        := False;
  tbsht_carga_TD01_Page11.TabVisible := False;
  tbsht_carga_TD01_Page12.TabVisible := False;
  tbsht_carga_TD01_Page13.TabVisible := False;

  tbsht_carga_TD16.TabVisible        := False;
  tbsht_carga_TD18.TabVisible        := False;

  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1: begin //Consumo
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD01.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page11.TabVisible := True;
         end;
      2: begin //Admissão em Entreposto Aduaneiro
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      3: begin //Admissão em EIZOF - Entreposto Internacional da ZFM
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      4: begin //Admissão em Entreposto Industrial
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      5: begin //Admissão Temporária
           tbsht_importador_TD05.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      6: begin //Admissão na ZFM - Zona Franca de Manaus
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      7: begin //Admissão em Loja Franca
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      8: begin //Admissão em ALC - Área livre de comércio
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
      9: begin //Admissão em DAD - Depósito Aduaneiro de Distribuição 
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
     10: begin //Admissão em DEA - Depósito Especial Alfandegado
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD02.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page13.TabVisible := True;
         end;
     11: begin //Admissão em ZPE - Zona de Processamento de Exportação
           // nao esta sendo usada ate o momento 04/12/1997 - Henrique 
         end;
     12: begin //Consumo e Admissão Temporária
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD01.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page11.TabVisible := True;
         end;
     13: begin //Nacionalização de Admissão Temporária
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page12.TabVisible := True;
         end;
     14: begin //Nacionalização de Entreposto Aduaneiro
           tbsht_importador_TD14.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page12.TabVisible := True;
         end;
     15: begin //Saída EIZOF - Entreposto Internacional da ZFM
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD01.TabVisible        := True;
           tbsht_carga_TD01_Page12.TabVisible := True;
         end;
     16: begin //Saída de Entreposto Industrial
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD18.TabVisible        := True;
         end;
     17: begin //Nacionalização de DEA - Depósito Especial Alfandegado
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD18.TabVisible        := True;
         end;
     18: begin //Nacionalização de DAD - Depósito Aduaneiro de Distribuição
           tbsht_importador_TD04.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD18.TabVisible        := True;
         end;
     19: begin //Internação de ZFM - PI (Produto Industrializado)
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD16.TabVisible        := True;
         end;
     20: begin //Internação da ZFM - PE (Produto Estrangeiro)
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD16.TabVisible        := True;
         end;
     21: begin //Internação de ALC - Área livre de comércio
           tbsht_importador_TD01.TabVisible   := True;
           tbsht_basicas_TD13.TabVisible      := True;
           tbsht_carga_TD16.TabVisible        := True;
         end;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_tipo_declaracao2Exit(Sender: TObject);
begin
  if ( datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] ) then ValidCodigo( dbedt_cd_tipo_declaracao2 );

  if (Not datm_DI_Capa.tbl_tipo_declaracao_.FindKey([dbedt_cd_tipo_declaracao2.Text])) then
  begin
    BoxMensagem( 'Tipo de Declaração não encontrada!', 2 );
    dbedt_cd_tipo_declaracao2.Text := '';
    if PodeFocar(dbedt_cd_tipo_declaracao2) then
      dbedt_cd_tipo_declaracao2.Setfocus;
    btn_salvar.Enabled := False;
    Exit;
  end;
{
  if Trim(dbedt_cd_tipo_declaracao2.Text) = '02' then
  begin
    dbedt_cd_reg_trib_ii.Text       := '5';
    dbedt_fund_legal_ii.Text        := '52';
    dbedt_cd_mot_sem_cob.Text       := '52';
    dbrg_reg_tributacao.ItemIndex   := 1;
    dbg_cobertura_cambial.ItemIndex := 3;
    dbg_cobertura_cambial.OnClick(Sender)
  end;
}
  if (in_di_abrindo or in_calculo or in_DI_Registrada) or
     Not ( datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] ) then Exit;
  begin
    Screen.Cursor := crHourGlass;
    ValidCodigo( dbedt_cd_tipo_declaracao2 );
    if Trim( dbedt_cd_tipo_declaracao2.Text ) <> '' then
    begin
      if StrToInt( Trim( dbedt_cd_tipo_declaracao2.Text ) ) <> i_cd_tipo_di then //Alterou o Tipo de DI
      begin
        i_cd_tipo_di := StrToInt( Trim( dbedt_cd_tipo_declaracao2.Text) );
        with datm_DI_Capa do
        begin
          if ( i_cd_tipo_di = 13 ) or
             ( i_cd_tipo_di = 14 ) or
             ( i_cd_tipo_di = 15 ) then
          begin
            str_hist_dt_cheg := '';
            if Not ( qry_di_.State in [dsInsert, dsEdit] ) then qry_di_.Edit;
            frm_DI_capa.Atualiza_Historico_Padrao_novo;
          end;

          in_altera_tipo_DI:= True;
          btn_salvarClick(nil);
          FechaTabelas;
          qry_di_.Close;

          try
            datm_main.db_broker.StartTransaction;
            CloseStoredProc(sp_di_atz_tipo_di);
            sp_di_atz_tipo_di.ParamByName('@nr_processo').AsString := str_nr_processo;
            sp_di_atz_tipo_di.ParamByName('@cd_tipo_di').AsInteger := i_cd_tipo_di;
            ExecStoredProc(sp_di_atz_tipo_di);
            CloseStoredProc(sp_di_atz_tipo_di);
            datm_main.db_broker.Commit;
          except
            on E: Exception do
            begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
          end;

          in_di_abrindo := True;
          qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_di_.Prepare;
          qry_di_.Open;
          AbreTabelas;
          in_di_abrindo := False;
        end;
      end;
    end;
  end;

  if dbedt_nm_tipo_declaracao2.Text = '' then
  begin
    BoxMensagem( 'Tipo de Declaração inválido!', 2 );
    if PodeFocar(dbedt_cd_tipo_declaracao2) then
      dbedt_cd_tipo_declaracao2.SetFocus;
    Screen.Cursor := crDefault;
    Exit;
  end;

  ReadUpdateWindow_CD_TIPO_DECLARACAO;
  ReadUpdateWindow_CD_TIPO_IMPORTADOR;
  ReadUpdateWindow_CD_MODALIDADE_DESP;
  ReadUpdateWindow_CD_VIA_TRANSPORTE;
//  ReadUpdateWindow_IN_OPERACAO_FUNDAP;
  ReadUpdateWindow_CONTRATANTE_CAMBIO;
  ReadUpdateWindow_CD_COBERTURA_CAMBIAL;
  ReadUpdateWindow_Carga2;
  dbedt_cd_setor1Exit(nil);
  dbedt_agente_transportador1Exit(nil);

  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1, 2, 3, 6, 8, 12, 13, 15, 19, 20, 21:
         pgctrl_capa_di.activePage := tbsht_importador_TD01;
      4, 7, 9, 10, 16, 17, 18:
         pgctrl_capa_di.activePage := tbsht_importador_TD04;
      5: pgctrl_capa_di.activePage := tbsht_importador_TD05;
     14: pgctrl_capa_di.activePage := tbsht_importador_TD14;
    end;
  end;
  in_di_abrindo := False;

  Screen.Cursor := crDefault;
end;

procedure Tfrm_DI_capa.dbchkbox_mesma_moeda1Click(Sender: TObject);
begin
  Write_Carga2;
end;

procedure Tfrm_DI_capa.FormShow(Sender: TObject);
var
  nr_proc_caption  : String[14];
  i                : Integer;
  inicio_linha_cntr, ln_hist_cntr, nm_cntr: String;
begin
  // Para a RADICI incluir também uma opção de Impostos no valor do Seguro - Michel - 16/08/2010
  if (dbrdg_tipo_seguro.Properties.Items.Count < 4) and
     (ConsultaLookUPSQL(' SELECT CASE WHEN E.CD_GRUPO IN ("A05", "009") THEN "1"  ' +
                        '             ELSE "0"  ' +
                        '        END AS IN_VMLE_FRETE_IMPOSTOS  ' +
                        '   FROM TPROCESSO P (NOLOCK) '+
                        '  INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                        ' WHERE NR_PROCESSO = "' + str_nr_processo + '"',
                        'IN_VMLE_FRETE_IMPOSTOS') = '1') then
  begin
    dbrdg_tipo_seguro.Properties.Columns := 4;
    dbrdg_tipo_seguro.Properties.Items.Add;
    with dbrdg_tipo_seguro.Properties.Items[3] do
    begin
      Caption := 'VMLE + Frete + Impostos';
      Value   := '3';
    end;
    dbrdg_tipo_seguro.Width := dbrdg_tipo_seguro.Width + 130;
    //dbrdg_tipo_seguro.Width := 337;
    //dbedt_pc_seguro.Left    := 559;
    //Label82.Left            := 638;
  end;

  dbedt_pc_seguro.Left    := dbrdg_tipo_seguro.Left + dbrdg_tipo_seguro.Width + 10;
  Label82.Left            := dbedt_pc_seguro.Left + dbedt_pc_seguro.Width + 5;

  pnl_cadastro.Color := clMenuBroker;
  pnlClaro.Color := clPnlClaroBroker;
  panel2.Color := clPnlClaroBroker;
  panel5.Color := clPnlClaroBroker;
  in_DI_Registrada  := frm_DI.in_DI_Registrada;
  in_excluiu        := False;
  in_abrindo_via    := False;
  in_di_abrindo     := False;
  in_altera_tipo_DI := False;
  if in_DI_Registrada then
  begin
    btn_salvar.Enabled      := False;
    btn_cancelar.Enabled    := False;
    btn_excluir.Enabled     := False;
    mi_excluir.Enabled      := False;
    btn_co_armazens.Enabled := False;
    mi_armazem.Enabled      := False;
    btn_calculo.Enabled     := False;
    mi_calculo.Enabled      := False;
    mi_salvar.Enabled       := False;
    mi_cancelar.Enabled     := False;

    for i := 0 to componentcount - 1 do
    begin
      if ( Components[i] is TRadioButton ) then
         TRadioButton( Components[i] ).Enabled := False;
      if ( Components[i] is TEdit ) then
         TEdit( Components[i] ).Enabled := False;
      if ( Components[i] is TDBRadioGroup ) then
         TDBRadioGroup( Components[i] ).Enabled := False;
      if ( Components[i] is TDBLookupComboBox ) then
         TDBLookupComboBox( Components[i] ).Enabled := False;
      if ( Components[i] is  TMaskEdit ) then
         TMaskEdit( Components[i] ).Enabled := False;
    end;
  end;

  if in_DI_Registrada then
  begin
    datm_DI_capa.qry_di_.RequestLive := False;
    datm_DI_capa.ds_di.AutoEdit      := False;
  end
  else
  begin
    datm_DI_capa.qry_di_.RequestLive := True;
    datm_DI_capa.ds_di.AutoEdit      := True;
  end;

  in_di_abrindo := True;
  datm_DI_Capa.qry_di_.DisableControls;
  datm_DI_Capa.qry_di_.Close;
  datm_DI_Capa.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI_Capa.qry_di_.Prepare;
  datm_DI_Capa.qry_di_.Open;
  datm_DI_Capa.qry_di_.EnableControls;  

  AbreTabelas;
  // Para casos de DI Registradas e Retificação não atualizar as taxas
  if ( ( datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.AsString = '' ) or
       ( datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.IsNull ) and not (in_DI_Registrada) ) then
  begin
    try
      if not datm_main.db_broker.InTransaction then
        datm_main.db_broker.StartTransaction;
      if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_capa.qry_di_.Edit;
      if Not datm_DI_capa.tbl_taxa_cambio_.Active then datm_DI_capa.tbl_taxa_cambio_.Open;
      //Atualizar taxas de cambio para capa caso nao possua
      if ( datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString <> '' ) and
         Not ( datm_DI_Capa.qry_di_TX_MLE.AsFloat > 0 ) then //Taxa MLE
           if datm_DI_Capa.tbl_taxa_cambio_.findkey([datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString]) then
            datm_DI_Capa.qry_di_TX_MLE.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;

      if ( datm_DI_Capa.qry_di_CD_MOEDA_FRETE.AsString <> '' ) and
         Not ( datm_DI_Capa.qry_di_TX_FRETE.AsFloat > 0 ) then //Taxa Frete
         if datm_DI_Capa.tbl_taxa_cambio_.findkey([datm_DI_Capa.qry_di_CD_MOEDA_FRETE.AsString]) then
            datm_DI_Capa.qry_di_TX_FRETE.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;

      if ( datm_DI_Capa.qry_di_CD_MOEDA_SEGURO.AsString <> '' ) and
          Not ( datm_DI_Capa.qry_di_TX_SEGURO.AsFloat > 0 ) then //Taxa Seguro
         if datm_DI_Capa.tbl_taxa_cambio_.findkey([datm_DI_Capa.qry_di_CD_MOEDA_SEGURO.AsString]) then
            datm_DI_Capa.qry_di_TX_SEGURO.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;

      if Not ( datm_DI_Capa.qry_di_TX_DOLAR.AsFloat > 0 ) then //Taxa Dolar
         if datm_DI_Capa.tbl_taxa_cambio_.findkey(['220']) then
            datm_DI_Capa.qry_di_TX_DOLAR.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;

      datm_DI_capa.qry_di_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );
      datm_DI_capa.qry_di_IN_RISC_ATUALIZADO.AsString  := '0';
      datm_DI_capa.qry_di_.Post;

      datm_main.db_broker.Commit;
      datm_DI_capa.VerificaEstado(False);
    except
      on E: Exception do
      begin
        frm_DI_capa.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  ReadUpdateWindow_CD_TIPO_DECLARACAO;
  ReadUpdateWindow_CD_TIPO_IMPORTADOR;
  if frm_di <> nil then
    ReadUpdateWindow_Retificacao;
  ReadUpdateWindow_CD_MODALIDADE_DESP;
  if Not in_calculo then
     Val(datm_DI_capa.qry_di_CD_VIA_TRANSP_CARG.AsString, i_cod_via_transp, Code);
  ReadUpdateWindow_CD_VIA_TRANSPORTE;
//  ReadUpdateWindow_IN_OPERACAO_FUNDAP;
  ReadUpdateWindow_CONTRATANTE_CAMBIO;
  ReadUpdateWindow_CD_COBERTURA_CAMBIAL;
  ReadUpdateWindow_Carga2;

  dbedt_cd_setor1Exit(nil);
  dbedt_agente_transportador1Exit(nil);

  tbsht_importador_TD01.Visible := False;
  tbsht_importador_TD04.Visible := False;
  tbsht_importador_TD05.Visible := False;
  tbsht_importador_TD14.Visible := False;

  if Trim( dbedt_cd_tipo_declaracao.Text ) <> '' then
  begin
    case StrToInt( dbedt_cd_tipo_declaracao.Text ) of
      1, 2, 3, 6, 8, 12, 13, 15, 19, 20, 21: begin
                                               tbsht_importador_TD01.Visible := True;
                                               pgctrl_capa_di.ActivePage := tbsht_importador_TD01;
                                             end;

      4, 7, 9, 10, 16, 17, 18: begin
                                 tbsht_importador_TD04.Visible := True;
                                 pgctrl_capa_di.ActivePage := tbsht_importador_TD04;
                               end;
      5: begin
           tbsht_importador_TD05.Visible := True;
           pgctrl_capa_di.ActivePage := tbsht_importador_TD05;
         end;
     14: begin
           tbsht_importador_TD14.Visible := True;
           pgctrl_capa_di.ActivePage := tbsht_importador_TD14;
         end;
    end;
  end;

  // trava número da DI e data da DI em casos que não sejam DSI ( preliminar )
  if ( ( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO_DI (NOLOCK) WHERE NR_PROCESSO = ''' + str_nr_processo + ''' AND CD_TIPO_PROCESSO = ''3''','BLABLA') = '0' ) and
       ( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ''' + str_nr_processo + ''' AND CD_SERVICO IN (''442'',''443'',''444'')','BLABLA') = '0' ) ) and
     ( Trim(ConsultaLookupSQL('SELECT CD_REPRESENTANTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ''' + str_nr_processo + '''','CD_REPRESENTANTE')) = '' ) and
//     ( str_cd_cargo <> '047' ) and ( str_cd_cargo <> '001' ) then  by Carlos 22/06/2010
     ( Trim(ConsultaLookupSQL('select c.CD_CARGO from TCARGO c (NOLOCK) where c.IN_MANAGER="1" and c.CD_CARGO="'+str_cd_cargo+'"','CD_CARGO') )='' ) and ( str_cd_cargo <> '001' ) and
     ( str_cd_cargo <> '096' ) and ( str_cd_cargo <> '099' ) then // 096 e 099 incluídos por Michel a pedido do Nelson, 05/03/2014

  begin
    dbedt_nr_registro_di1.Enabled := False;
    dbedt_nr_registro_di2.Enabled := False;
    dbedt_nr_registro_di3.Enabled := False;
    dbedt_nr_registro_di4.Enabled := False;
    dbedt_dt_registro_di1.Enabled := False;
    dbedt_dt_registro_di2.Enabled := False;
    dbedt_dt_registro_di3.Enabled := False;
    dbedt_dt_registro_di4.Enabled := False;
  end else begin
    dbedt_nr_registro_di1.Enabled := True;
    dbedt_nr_registro_di2.Enabled := True;
    dbedt_nr_registro_di3.Enabled := True;
    dbedt_nr_registro_di4.Enabled := True;
    dbedt_dt_registro_di1.Enabled := True;
    dbedt_dt_registro_di2.Enabled := True;
    dbedt_dt_registro_di3.Enabled := True;
    dbedt_dt_registro_di4.Enabled := True;
  end;

  nr_proc_caption := Copy( str_nr_processo, 5, 14 );

  Caption := 'Declaração de Importação [ '+ nr_proc_caption + ' ] - Capa';

  if datm_DI_capa.qry_di_IN_MATERIAL_USADO.AsBoolean then
  begin
    rbtn_material_usado.Checked    := True;
    rbtn_Bem_sob_encomenda.Checked := False;
  end
  else
  begin
    if datm_DI_capa.qry_di_IN_BEM_ENCOMENDA.AsBoolean then
    begin
      rbtn_material_usado.Checked    := False;
      rbtn_Bem_sob_encomenda.Checked := True;
    end
    else
    begin
      rbtn_material_usado.Checked    := False;
      rbtn_Bem_sob_encomenda.Checked := False;
    end;
  end;

  Valores;
  if Not in_DI_Registrada then
  begin
    //Atualizando variáveis para Histórico Padrão
    with datm_DI_Capa do
    begin
      in_reb := qry_di_IN_REB.AsString;

      str_hist_s_ref := '';
      qry_ref_cliente_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
      qry_ref_cliente_.Open;
      while not (qry_ref_cliente_.EOF) do
      begin
        if str_hist_s_ref <> '' then str_hist_s_ref := str_hist_s_ref + ', ';
        str_hist_s_ref := str_hist_s_ref + qry_ref_cliente_CD_REFERENCIA.AsString + '/' + qry_ref_cliente_NR_ITEM_PO.AsString;
        qry_ref_cliente_.Next;
      end;
      qry_ref_cliente_.Close;
      

      str_hist_cntr := '';
      qry_proc_cntr_.Close;
      qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
      qry_proc_cntr_.Prepare;
      qry_proc_cntr_.Open;
      inicio_linha_cntr := 'CONTEINERES.............: ';
      while not (qry_proc_cntr_.EOF) do
      begin
        if qry_proc_cntr_IN_DESOVA.AsString = '0' then
        begin
          {if str_hist_cntr <> '' then
            str_hist_cntr := str_hist_cntr + ', ';
          str_hist_cntr := str_hist_cntr +
                             Copy( qry_proc_cntr_NR_CNTR.AsString, 1, 4 ) + '-' +
                             Copy( qry_proc_cntr_NR_CNTR.AsString, 5, 3 ) + '-' +
                             Copy( qry_proc_cntr_NR_CNTR.AsString, 8, 3 ) + '-' +
                             Copy( qry_proc_cntr_NR_CNTR.AsString, 11, 1 ) + ' - ' +
                             qry_proc_cntr_NM_TP_CNTR.AsString;}
          if ln_hist_cntr <> '' then
            ln_hist_cntr := ln_hist_cntr + ', ';
          nm_cntr := Copy( qry_proc_cntr_NR_CNTR.AsString, 1, 4 ) + '-' +
                     Copy( qry_proc_cntr_NR_CNTR.AsString, 5, 3 ) + '-' +
                     Copy( qry_proc_cntr_NR_CNTR.AsString, 8, 3 ) + '-' +
                     Copy( qry_proc_cntr_NR_CNTR.AsString, 11, 1 ) + ' - ' +
                     qry_proc_cntr_NM_TP_CNTR.AsString;
          if Length(inicio_linha_cntr + ln_hist_cntr + nm_cntr) > 68 then
          begin
            while Length(inicio_linha_cntr + ln_hist_cntr) < 68 do
              ln_hist_cntr := ln_hist_cntr + ' ';
            ln_hist_cntr      := ln_hist_cntr + '| ';
            if inicio_linha_cntr = '  ' then
              str_hist_cntr     := str_hist_cntr + '  ' + ln_hist_cntr
            else
              str_hist_cntr     := str_hist_cntr + ln_hist_cntr;
            ln_hist_cntr      := nm_cntr;
            inicio_linha_cntr := '  ';
          end
          else
            ln_hist_cntr := ln_hist_cntr + nm_cntr;
        end;
        qry_proc_cntr_.Next;
      end;
      qry_proc_cntr_.Close;

      if ln_hist_cntr <> '' then
      begin
        while Length(inicio_linha_cntr + ln_hist_cntr) < 68 do
          ln_hist_cntr := ln_hist_cntr + ' ';
        ln_hist_cntr      := ln_hist_cntr + '|';
        if str_hist_cntr = '' then
          str_hist_cntr     := str_hist_cntr + ln_hist_cntr
        else
          str_hist_cntr     := str_hist_cntr + '  ' + ln_hist_cntr;
      end;

      str_hist_especie := '';
      qry_proc_carga_solta_.Close;
      qry_proc_carga_solta_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
      qry_proc_carga_solta_.Prepare;
      qry_proc_carga_solta_.Open;
      while not (qry_proc_carga_solta_.EOF) do
      begin
        if str_hist_especie <> '' then str_hist_especie := str_hist_especie + ', ';
        str_hist_especie := str_hist_especie + IntToStr( qry_proc_carga_solta_VL_QTDE.AsInteger ) + '-' +
                            Trim( qry_proc_carga_solta_NM_ESPECIE.AsString );
        qry_proc_carga_solta_.Next;
      end;
      qry_proc_carga_solta_.Close;

      str_hist_n_ref := '';
      qry_processo_.ParamByName('NR_PROCESSO').AsString  := str_nr_processo;
      qry_processo_.Open;
      str_hist_n_ref := copy(qry_processo_NR_PROCESSO.AsString,5,18);
      cd_servico := qry_processo_CD_SERVICO.AsString;
      qry_processo_.Close;
      str_hist_fatura := '';
      tbl_di_doc_instr_emb_.Open;
      tbl_di_doc_instr_emb_.First;
      while not (tbl_di_doc_instr_emb_.EOF) do
      begin
        if tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR.AsString = '01' then
        begin
           if str_hist_fatura <> '' then
             str_hist_fatura := str_hist_fatura + ', ';

           str_hist_fatura := str_hist_fatura + tbl_di_doc_instr_emb_NR_DCTO_INSTRUCAO.AsString;
        end;
        tbl_di_doc_instr_emb_.Next;
      end;
      tbl_di_doc_instr_emb_.Close;

      if qry_di_CD_VIA_TRANSP_CARG.AsString = '01' then //Maritima
      begin
        dbedt_dt_chegada1.Enabled := False;
        dbedt_dt_chegada1.Color := clMenu;
      end;
      //Retirada a mascara crt rodoviario - Andressa 
     // if qry_di_CD_VIA_TRANSP_CARG.AsString = '07' then //Rodoviário
     //    str_hist_conh := Copy( qry_di_NR_DCTO_CARGA.AsString, 1, 2 ) + '-' +
     //                     Copy( qry_di_NR_DCTO_CARGA.AsString, 3, 10 )
     // else
         str_hist_conh := qry_di_NR_DCTO_CARGA.AsString;
      str_hist_conh_m  := qry_di_NR_DCTO_CARGA_MAST.AsString;
      str_hist_pcarga  := qry_di_CD_PRESENCA_CARGA.AsString;
      str_hist_loc_emb := qry_di_Look_local_Embarque.AsString;
      str_hist_dt_emb  := Copy( qry_di_DT_EMBARQUE.AsString, 1, 2) + '/' +
                          Copy( qry_di_DT_EMBARQUE.AsString, 3, 2) + '/' +
                          Copy( qry_di_DT_EMBARQUE.AsString, 5, 4);
      str_hist_veiculo := qry_di_NM_VEICULO_TRANSP.AsString;
      str_hist_placa_veiculo := qry_di_NR_VEICULO_TRANSP.AsString;

      if ( dbedt_cd_tipo_declaracao.Text <> '13' ) and
         ( dbedt_cd_tipo_declaracao.Text <> '14' ) and
         ( dbedt_cd_tipo_declaracao.Text <> '15' ) then
         str_hist_dt_cheg := Copy( qry_di_DT_CHEGADA_CARGA.AsString, 1, 2 ) + '/' +
                             Copy( qry_di_DT_CHEGADA_CARGA.AsString, 3, 2 ) + '/' +
                             Copy( qry_di_DT_CHEGADA_CARGA.AsString, 5, 4 )
      else
         str_hist_dt_cheg := '';

      str_nm_transp   := '';
      str_cnpj_transp := '';

      {if (qry_di_CD_VIA_TRANSP_CARG.AsString = '04') or //Aérea
         (qry_di_CD_VIA_TRANSP_CARG.AsString = '01')  then //Marítima}
      begin
        qry_transp_nac_.Close;
        qry_transp_nac_.ParamByName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
        qry_transp_nac_.Prepare;
        qry_transp_nac_.Open;
        if Not qry_transp_nac_.EOF then
        begin
          str_nm_transp   := UpperCase( Trim( qry_transp_nac_.FieldByName('NM_TRANSP_ROD').AsString ) );
          if Trim( qry_transp_nac_.FieldByName('NM_TRANSP_ROD').AsString ) <> '' then
            str_cnpj_transp := Copy( Trim( qry_transp_nac_.FieldByName('CNPJ_TRANSP_ROD').AsString ), 1, 2 ) + '.' +
                               Copy( Trim( qry_transp_nac_.FieldByName('CNPJ_TRANSP_ROD').AsString ), 3, 3 ) + '.' +
                               Copy( Trim( qry_transp_nac_.FieldByName('CNPJ_TRANSP_ROD').AsString ), 6, 3 ) + '/' +
                               Copy( Trim( qry_transp_nac_.FieldByName('CNPJ_TRANSP_ROD').AsString ), 9, 4 ) + '-' +
                               Copy( Trim( qry_transp_nac_.FieldByName('CNPJ_TRANSP_ROD').AsString ), 13, 2 );
        end;
        qry_transp_nac_.Close;
      end;

//      Valores;
    end;

    GuardaTaxaCambial;

    try
      datm_main.db_broker.StartTransaction;
      if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_capa.qry_di_.Edit;
        Atualiza_Historico_Padrao_novo;

      datm_DI_Capa.qry_di_.Post;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        frm_DI_capa.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
  datm_DI_Capa.VerificaEstado(False);
  in_di_abrindo    := False;
end;

procedure Tfrm_DI_capa.rbtn_pessoa_juridica2Click(Sender: TObject);
begin
  Write_CD_TIPO_IMPORTADOR;
end;

procedure Tfrm_DI_capa.rbtn_modalidade_despacho_normal1Click(
  Sender: TObject);
begin
  Write_CD_MODALIDADE_DESP;
end;

procedure Tfrm_DI_capa.rbtn_Contratante_prop_impo1Click(Sender: TObject);
begin                       
  Write_CONTRATANTE_CAMBIO;
end;

procedure Tfrm_DI_capa.dbedt_cd_importador2Exit(Sender: TObject);
begin
  if (in_di_abrindo or in_calculo or in_DI_Registrada) or
     Not ( datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] ) then Exit;
  begin
    if dbedt_cd_importador2.Text <> '' then ValidCodigo( dbedt_cd_importador2 );

    if datm_DI_capa.qry_di_Look_Importador.AsString <> '' then
    begin
      if datm_DI_capa.tbl_empresa_nac_.FindKey([datm_DI_capa.qry_di_CD_IMPORTADOR.AsString]) then
         datm_DI_capa.qry_di_NR_COMPRADOR_ME.AsString := datm_DI_capa.tbl_empresa_nac_CGC_EMPRESA.AsString;
    end
    else
    begin
      if (pgctrl_capa_di.ActivePage = tbsht_importador_TD01) and PodeFocar(dbedt_cd_importador2) then
         dbedt_cd_importador2.SetFocus
      else
        if (pgctrl_capa_di.ActivePage = tbsht_importador_TD05) and PodeFocar(dbedt_cd_importador1) then
           dbedt_cd_importador1.SetFocus
        else
          if (pgctrl_capa_di.ActivePage = tbsht_importador_TD14) and PodeFocar(dbedt_cd_importador3) then
             dbedt_cd_importador3.SetFocus
          else
            if (pgctrl_capa_di.ActivePage = tbsht_importador_TD04) and PodeFocar(dbedt_cd_importador4) then
               dbedt_cd_importador4.SetFocus;
      BoxMensagem( 'Importador não cadastrado, tente novamente', 3 );
    end;
  end;

end;

procedure Tfrm_DI_capa.PreencheCodOpeEstrangeiros;
begin
  if datm_DI_Capa.qry_di_CD_IMPORTADOR.AsString <> '' then
  begin
    edtCNPJImportador.Text := ConsultaLookUPSQL('SELECT CGC_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = :CD_EMPRESA '
                                               , 'CGC_EMPRESA'
                                               , [datm_DI_Capa.qry_di_CD_IMPORTADOR.AsString]);
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_urf_despacho1Exit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
    ValidCodigo( dbedt_cd_urf_despacho1 );
end;

procedure Tfrm_DI_capa.dbedt_cd_transportador2Exit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_transportador2 );
end;

procedure Tfrm_DI_capa.dbedt_cd_transportador3Exit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_transportador3 );
end;

procedure Tfrm_DI_capa.dbedt_cd_bandeira_transp_itl2Exit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
    ValidCodigo( dbedt_cd_bandeira_transp_itl2 );
end;

procedure Tfrm_DI_capa.dbedt_cd_pais_procedencia12Exit(Sender: TObject);
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
    dbedt_nm_pais_procedencia1.Text := ConsultaLookUP('TPAIS','CODIGO', dbedt_cd_pais_procedencia1.Text,'DESCRICAO')
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
    dbedt_nm_pais_procedencia2.Text := ConsultaLookUP('TPAIS','CODIGO', dbedt_cd_pais_procedencia3.Text,'DESCRICAO')
  else
    dbedt_nm_pais_procedencia2.Text := ConsultaLookUP('TPAIS','CODIGO', dbedt_cd_pais_procedencia3.Text,'DESCRICAO');
end;

procedure Tfrm_DI_capa.dbedt_cd_urf_entrada_pais1Exit(Sender: TObject);
var
  DBEditURF, DBEditNM: TDBEdit;
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
  begin
    DBEditURF := dbedt_cd_urf_entrada_pais1;
    DBEditNM  := dbedt_nm_urf_entrada_pais1;
  end
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
  begin
    DBEditURF := dbedt_cd_urf_entrada_pais2;
    DBEditNM  := dbedt_nm_urf_entrada_pais2;
  end
  else
  begin
    DBEditURF := dbedt_cd_urf_entrada_pais3;
    DBEditNM  := DBEdit33;
  end;
  ValidCodigo(DBEditURF);
  DBEditNM.Text := ConsultaLookUP('TURF','CODIGO', DBEditURF.Text,'DESCRICAO');
end;

procedure Tfrm_DI_capa.dbedt_cd_recinto_alfandegado1Exit(Sender: TObject);
var
  DBEditURF, DBEditRec: TDBEdit;
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
  begin
    DBEditURF := dbedt_cd_urf_despacho1;
    DBEditRec := dbedt_cd_recinto_alfandegado1;
  end
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
  begin
    DBEditURF := dbedt_cd_urf_despacho2;
    DBEditRec := dbedt_cd_recinto_alfandegado2;
  end
  else
  begin
    DBEditURF := dbedt_cd_urf_despacho3;
    DBEditRec := dbedt_cd_recinto_alfandegado3;
  end;

  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
     Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) or
     ( DBEditRec.Text = '' ) then Exit;

  ValidCodigo( DBEditRec );

  if DBEditURF.text = '' then
  begin
    BoxMensagem( 'URF de Entrada não informada.', 3 );
    Exit;
  end;

  // fechar consulta
  datm_DI_capa.Query3.close;
  datm_DI_capa.Query3.SQL.clear;
  datm_DI_capa.Query3.SQL.add( 'SELECT CODIGO FROM TREC_ALFANDEGADO (NOLOCK) WHERE ' );
  datm_DI_capa.Query3.SQL.add( 'CODIGO = "' + DBEditRec.text + '" AND ' );
  datm_DI_capa.Query3.SQL.add( 'COD_ORGAO_REC = "' + DBEditURF.text + '"' );
  // faz a chamada e abre a consulta
  datm_DI_capa.Query3.Prepare;
  datm_DI_capa.Query3.Open;

  if datm_DI_capa.Query3.RecordCount = 0 then
  begin
    datm_DI_capa.Query3.close;
    BoxMensagem( 'Este Recinto não pertence a U.R.F. de Despacho.', 2 );
  end;

  datm_DI_capa.Query3.close;

end;

procedure Tfrm_DI_capa.dbedt_cd_setor1Exit(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
  Atualiza_Nome_Setor ;
end;

procedure Tfrm_DI_capa.Atualiza_Nome_Setor;
begin
  if ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then
     ValidCodigo( dbedt_cd_setor1 );

  if datm_DI_capa.qry_di_CD_SETOR_ARMAZENAM.AsString = '' then Exit;

  if dbedt_cd_recinto_alfandegado1.text = '' then Exit;

  // fechar consulta 
  datm_DI_capa.Query3.Close;
  datm_DI_capa.Query3.SQL.Clear;
  datm_DI_capa.Query3.SQL.Add( 'SELECT Setor, Nome FROM TRECINTO_SETORES_IMPORTACAO (NOLOCK) WHERE ' );
  datm_DI_capa.Query3.SQL.Add( 'Setor = "'+datm_DI_capa.qry_di_CD_SETOR_ARMAZENAM.AsString+'" AND ' );
  datm_DI_capa.Query3.SQL.Add( 'Recinto = "'+dbedt_cd_recinto_alfandegado1.text+'"' );
  // faz a chamada e abre a consulta
  datm_DI_capa.Query3.Prepare;
  datm_DI_capa.Query3.Open;

  if datm_DI_capa.Query3.RecordCount = 0 then
  begin
    datm_DI_capa.Query3.close;
    if ( pgctrl_capa_di.ActivePage = tbsht_carga_TD01 ) or
       ( pgctrl_capa_di.ActivePage = tbsht_carga_TD16 ) or
       ( pgctrl_capa_di.ActivePage = tbsht_carga_TD18 ) then
      BoxMensagem( 'Este Setor não pertence ao Recinto Alfandegado.', 2 );

  end;
  datm_DI_capa.Query3.Close;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga6DblClick(Sender: TObject);
begin
  if rbtn_manifesto_carga6.Checked then
  begin
    rbtn_manifesto_carga6.Checked                  := False;
    lbl_identificacao6.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao6, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga7DblClick(Sender: TObject);
begin
  if rbtn_manifesto_carga7.Checked then
  begin
    rbtn_manifesto_carga7.Checked                  := False;
    lbl_identificacao7.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao7, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga4DblClick(Sender: TObject);
begin
  if rbtn_manifesto_carga4.Checked then
  begin
    rbtn_manifesto_carga4.Checked                  := False;
    lbl_identificacao4.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao4, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_dta4DblClick(Sender: TObject);
begin
  if rbtn_dta4.Checked then
  begin
    rbtn_dta4.Checked                              := False;
    lbl_identificacao4.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao4, False);
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_bandeira_transp_itl2Enter(Sender: TObject);
begin
//  if ( dbedt_cd_Bandeira_transp_itl2.Text = '' ) and ( datm_DI_Capa.qry_di_CD_VIA_TRANSP_CARG.AsString = '01' ) then
//    dbedt_cd_Bandeira_transp_itl2.Text := datm_DI_capa.qry_di_Look_Band_cad_Transp.AsString;
end;

procedure Tfrm_DI_capa.dbedt_agente_transportador1Exit(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;

  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then

  if tbsht_carga_TD01_Page11.TabVisible then
  begin
    if ( dbedt_nm_agente_transp.Text = '') and ( Trim( dbedt_agente_transportador1.Text ) <> '' ) then
    begin
       BoxMensagem('Agente do transportador inválido.', 2);
       pgctrl_capa_di.ActivePage := tbsht_carga_TD01;
       pgctrl_carga1.ActivePage  := tbsht_carga_TD01_Page11;
       dbedt_agente_transportador1.Text := '';
       if PodeFocar(dbedt_agente_transportador1) then
         dbedt_agente_transportador1.SetFocus;
    end;
  end;

  if tbsht_carga_TD01_Page13.TabVisible then
  begin
    if ( dbedt_nm_agente.Text = '') and ( Trim( dbedt_agente_transp.Text ) <> '' ) then
    begin
       BoxMensagem('Agente do transportador inválido.', 2);
       pgctrl_capa_di.ActivePage := tbsht_carga_TD01;
       pgctrl_carga1.ActivePage  := tbsht_carga_TD01_Page13;
       dbedt_agente_transp.Text := '';
       if PodeFocar(dbedt_agente_transp) then
         dbedt_agente_transp.SetFocus;
    end;
  end;

  //if dbedt_agente_transportador1.GetTextLen = 11 then
  //   datm_DI_capa.qry_di_NR_AGENTE_CARGA.EditMask := '999.999.999-99;0; '
  //else
  //if dbedt_agente_transportador1.getTextLen = 14 then
  //   datm_DI_capa.qry_di_NR_AGENTE_CARGA.EditMask := '99.999.999/9999-99;0; ';
end;

procedure Tfrm_DI_capa.dbedt_agente_transportador1Enter(Sender: TObject);
begin
  datm_DI_capa.qry_di_NR_AGENTE_CARGA.EditMask := '';
end;

procedure Tfrm_DI_capa.dbedt_identificacao1Exit(Sender: TObject);
begin
  if i_cod_via_transp = 4 then
  if rbtn_termo_entrada1.checked then
     datm_DI_capa.qry_di_NR_MANIFESTO.EditMask := '99999999-9;0; '
  else
     datm_DI_capa.qry_di_NR_MANIFESTO.EditMask := '';
end;

procedure Tfrm_DI_capa.dbedt_identificacao1Enter(Sender: TObject);
begin
  if i_cod_via_transp = 4 then
  if rbtn_termo_entrada1.checked then
     datm_DI_capa.qry_di_NR_MANIFESTO.EditMask := '99999999-9;0; '
  else
     datm_DI_capa.qry_di_NR_MANIFESTO.EditMask := '';
end;

procedure Tfrm_DI_capa.pgctrl_capa_diChange(Sender: TObject);
var
  latualiza_banco : Boolean;
begin
  FechaTabelas;
  AbreTabelas;
  dbrdg_contrato_cambioChange(nil);
  if ( pgctrl_capa_di.ActivePage = tbsht_pagamento ) then
  begin
    latualiza_banco := False;
    with datm_DI_Capa do
    begin

      qry_banco_servico_.Close;
      qry_banco_servico_.Prepare;
      qry_banco_servico_.Open;

      qry_banco_.Close;
      if qry_banco_servico_CD_RESPONSAVEL.AsString = 'D' then
        qry_banco_.ParamByName('CD_BANCO').AsString := qry_banco_servico_CD_BANCO_DEB_COM.AsString
      else
        qry_banco_.ParamByName('CD_BANCO').AsString := qry_banco_servico_CD_BANCO_DEB_CC.AsString;
      qry_banco_.Prepare;
      qry_banco_.Open;
    end;

//Rodrigo Capra
    //Banco
    in_banco := True;
    if Trim(MskEdt_cd_banco.Text) = '' then
    begin
      if datm_DI_Capa.qry_banco_.RecordCount > 0 then
      begin
        MskEdt_cd_banco.Text := datm_DI_capa.qry_banco_NR_BANCO.AsString;
      end;
      latualiza_banco := True;
    end;

    //Agência
    if Trim(MskEdt_cd_agencia.Text) = '' then
    begin
      if datm_DI_Capa.qry_banco_.RecordCount > 0 then
      begin
        MskEdt_cd_agencia.Text := Copy(datm_DI_capa.qry_banco_CD_AGENCIA.AsString,1,4);
      end;
      latualiza_banco := True;
    end;
    //Conta
    if ( datm_DI_Capa.qry_di_NR_CONTA_PGTO_TRIB.AsString = '' ) then
    begin
      if datm_DI_Capa.qry_banco_.RecordCount > 0 then
      begin
        // Atualiza Conta
        with datm_DI_Capa do
        begin
          try
            datm_main.db_broker.StartTransaction;
            if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then qry_di_.Edit;
            qry_di_NR_CONTA_PGTO_TRIB.AsString := qry_banco_NR_CONTA.AsString;
            qry_di_.Post;
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
    end;

    if latualiza_banco then
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(datm_DI_capa.sp_atualiza_bco_ag);
        datm_DI_capa.sp_atualiza_bco_ag.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        datm_DI_capa.sp_atualiza_bco_ag.ParamByName('@CD_BANCO').AsString    := MskEdt_cd_banco.Text;
        datm_DI_capa.sp_atualiza_bco_ag.ParamByName('@NR_AGENC').AsString    := MskEdt_cd_agencia.Text;
        ExecStoredProc(datm_DI_capa.sp_atualiza_bco_ag);
        CloseStoredProc(datm_DI_capa.sp_atualiza_bco_ag);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    datm_DI_Capa.qry_banco_.Close;
    in_banco := False;
  end;

  if pgctrl_capa_di.ActivePage = TabSheet2 then
     dbg_cobertura_cambialClick(nil);

  if pgctrl_capa_di.ActivePage = tbsht_carga_TD01 then
  begin
    with pgctrl_carga1 do
    begin
      if tbsht_carga_TD01_Page11.TabVisible then ActivePage := tbsht_carga_TD01_Page11;
      if tbsht_carga_TD01_Page12.TabVisible then ActivePage := tbsht_carga_TD01_Page12;
      if tbsht_carga_TD01_Page13.TabVisible then ActivePage := tbsht_carga_TD01_Page13;
      if tbsht_carga_TD16.TabVisible then pgctrl_capa_di.ActivePage := tbsht_carga_TD16;
      if tbsht_carga_TD18.TabVisible then pgctrl_capa_di.ActivePage := tbsht_carga_TD18;
    end;
  end;

{  if pgctrl_capa_di.ActivePage = TabSheet2 then //Câmbio
  begin
    if datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString = '02' then
    begin
      dbg_cobertura_cambial.ItemIndex := 3;
      dbedt_cd_mot_sem_cob.Text       := '52';
      dbg_cobertura_cambial.OnClick(Sender)
    end;
  end;
}
  if pgctrl_capa_di.ActivePage = tbsht_aux then //Auxiliar
  begin
    if datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString = '19' then
    begin
      lbl_cd_incoterm.Visible           := False;
      dbedt_cd_incoterm.Visible         := False;
      lbl_vinculacao_comp_vend.Visible  := False;
      dblkpcbox_vinc_comp_vend.Visible  := False;
      lbl_metodo_valoracao.Visible      := False;
      dbedt_cd_metodo_valoracao.Visible := False;
      dbedt_nm_metodo_valoracao.Visible := False;
      dbrg_reg_tributacao.Visible       := False;
      lbl_perc_icms.Visible             := False;
      dbedt_pc_icms.Visible             := False;
      lbl_reducao_icms.Visible          := False;
      dbedt_pc_reducao_icms.Visible     := False;
    end
    else if datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString = '02' then
    begin
      dbedt_cd_reg_trib_ii.Text       := '5';
      dbedt_fund_legal_ii.Text        := '52';
      dbrg_reg_tributacao.ItemIndex   := 1;
    end
    else
    begin
      lbl_cd_incoterm.Visible           := True;
      dbedt_cd_incoterm.Visible         := True;
      lbl_vinculacao_comp_vend.Visible  := True;
      dblkpcbox_vinc_comp_vend.Visible  := True;
      lbl_metodo_valoracao.Visible      := True;
      dbedt_cd_metodo_valoracao.Visible := True;
      dbedt_nm_metodo_valoracao.Visible := True;
      dbrg_reg_tributacao.Visible       := True;
      lbl_perc_icms.Visible             := True;
      dbedt_pc_icms.Visible             := True;
      lbl_reducao_icms.Visible          := True;
      dbedt_pc_reducao_icms.Visible     := True;
    end;

    {if Trim( datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString ) <> '' then
    begin
      if StrToInt( datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString ) in [2..10] then
        dbrgrp_aplicacao.Visible        := False
      else
        dbrgrp_aplicacao.Visible        := True;
    end
    else}
       dbrgrp_aplicacao.Visible         := True;

    if Trim( datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString ) <> '' then
    begin
      if StrToInt( datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO.AsString) in [3, 6, 7, 15, 19] then
      begin
        grpbox_cond_mercadoria.Visible    := False;
        rbtn_material_usado.Visible       := False;
        rbtn_Bem_sob_encomenda.Visible    := False;
      end
      else
      begin
        grpbox_cond_mercadoria.Visible    := True;
        rbtn_material_usado.Visible       := True;
        rbtn_Bem_sob_encomenda.Visible    := True;
      end;
    end
    else
    begin
      grpbox_cond_mercadoria.Visible    := True;
      rbtn_material_usado.Visible       := True;
      rbtn_Bem_sob_encomenda.Visible    := True;
    end;
  end;

  if pgctrl_capa_di.ActivePage = tbsht_informacoes_complementares then
  begin
    HistoricoMP164_Novo;
    with datm_di_capa do
    begin
      if qry_di_CD_VIA_TRANSP_CARG.AsString = '07' then //Rodoviário
        str_hist_conh := Copy( qry_di_NR_DCTO_CARGA.AsString, 1, 2 ) + '-' + Copy( qry_di_NR_DCTO_CARGA.AsString, 3, 10 )
      else str_hist_conh := qry_di_NR_DCTO_CARGA.AsString;
      str_hist_conh_m  := qry_di_NR_DCTO_CARGA_MAST.AsString;
    end;

    if Not in_DI_Registrada then
    begin
      try
        datm_main.db_broker.StartTransaction;
        if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_capa.qry_di_.Edit;
        Atualiza_Historico_Padrao_novo;
        datm_DI_Capa.qry_di_.Post;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          frm_DI_capa.btn_cancelarClick(nil);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_mot_sem_cobExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then Write_CD_MOT_SEM_COB;
end;

procedure Tfrm_DI_capa.dbg_cobertura_cambialClick(Sender: TObject);
begin
  if (in_di_abrindo or in_calculo or in_DI_Registrada) then exit;

  dbrgrp_parcelas.Visible := False;
  if dbrdg_contrato_cambio.ItemIndex = 2 then
  begin
    dbrgrp_parcelas.Visible := True;
    if dbrgrp_parcelas.ItemIndex = 1 then
       ntbk_cambio.PageIndex := 2
    else
       ntbk_cambio.PageIndex := 1;
  end;

  lbl_total_cambio.Visible := True;
  dbedt_vl_tot_cambio.Visible := True;

  if ( datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] ) then
    case dbg_cobertura_cambial.ItemIndex of
      0: datm_DI_capa.qry_di_CD_COBERTURA_CAMBIAL.AsString := '1';
      1: datm_DI_capa.qry_di_CD_COBERTURA_CAMBIAL.AsString := '2';
      2: datm_DI_capa.qry_di_CD_COBERTURA_CAMBIAL.AsString := '3';
      3: datm_DI_capa.qry_di_CD_COBERTURA_CAMBIAL.AsString := '4';
    end;
  case dbg_cobertura_cambial.ItemIndex of
    0, 1: begin
        lbl_cd_mot_sem_cob.Visible     := False;
        dbedt_cd_mot_sem_cob.Visible   := False;
        DBEdit74.Visible               := False;
        btn_co_motivo_sem_cob1.Visible := False;
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
        then datm_DI_Capa.qry_di_CD_MOTIVO_SEM_COBERTURA.AsString := '';

        dbedt_nr_rof.Visible := False;
        lbl_nr_rof.Visible   := False;
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
        then datm_DI_Capa.qry_di_NR_ROF.AsString := '';

        lbl_inst_financ.Visible        := False;
        dbedt_cd_inst_financ.Visible   := False;
        dbedt_inst_financ.Visible      := False;
        btn_co_inst_financ.Visible     := False;
        dbedt_cd_inst_financ.text      := '';

        lbl_cd_mod_pagto_2.Visible   := True;
        dbedt_cd_mod_pagto_2.Visible := True;
        dbedt_nm_mod_pagto2.Visible  := True;
        btn_co_mod_pagto1.Visible    := True;

        HabilitaContratoCambio;
        HabilitaAgente;
      end;
    2: begin
        lbl_cd_mot_sem_cob.Visible     := False;
        dbedt_cd_mot_sem_cob.Visible   := False;
        DBEdit74.Visible               := False;
        btn_co_motivo_sem_cob1.Visible := False;
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
        then datm_DI_Capa.qry_di_CD_MOTIVO_SEM_COBERTURA.AsString := '';

        dbedt_nr_rof.Visible           := True;
        lbl_nr_rof.Visible             := True;

        lbl_inst_financ.Visible        := True;
        dbedt_cd_inst_financ.Visible   := True;
        dbedt_inst_financ.Visible      := True;
        btn_co_inst_financ.Visible     := True;
        dbedt_cd_inst_financExit(nil);

        lbl_cd_mod_pagto_2.Visible     := False;
        dbedt_cd_mod_pagto_2.Visible   := False;
        dbedt_nm_mod_pagto2.Visible    := False;
        btn_co_mod_pagto1.Visible      := False;
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
        then datm_DI_Capa.qry_di_CD_MODALIDADE_PAGTO.AsString := '';

        HabilitaContratoCambio;
        HabilitaAgente;

        rbtn_ind_per_diaria1.Checked   := False;
        rbtn_ind_per_mensal1.Checked   := False;

      end;
    3: begin
        lbl_total_cambio.Visible       := False;
        dbedt_vl_tot_cambio.Visible    := False;

        lbl_cd_mot_sem_cob.Visible     := True;
        dbedt_cd_mot_sem_cob.Visible   := True;
        DBEdit74.Visible               := True;
        btn_co_motivo_sem_cob1.Visible := True;
        Write_CD_MOT_SEM_COB;

        lbl_inst_financ.Visible        := False;
        dbedt_cd_inst_financ.Visible   := False;
        dbedt_inst_financ.Visible      := False;
        btn_co_inst_financ.Visible     := False;
        dbedt_cd_inst_financ.text      := '';

        if dbedt_cd_mot_sem_cob.Text = '32' then
        begin
          HabilitaContratoCambio;
          lbl_cd_mod_pagto_2.Visible   := True;
          dbedt_cd_mod_pagto_2.Visible := True;
          dbedt_nm_mod_pagto2.Visible  := True;
          btn_co_mod_pagto1.Visible    := True;
          rbtn_ind_per_diaria1.Checked := False;
          rbtn_ind_per_mensal1.Checked := False;
          HabilitaAgente;
        end
        else
        begin
          DesabilitaContratoCambio;
          lbl_cd_mod_pagto_2.Visible   := False;
          dbedt_cd_mod_pagto_2.Visible := False;
          dbedt_nm_mod_pagto2.Visible  := False;
          btn_co_mod_pagto1.Visible    := False;
          if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
          then datm_DI_Capa.qry_di_CD_MODALIDADE_PAGTO.AsString := '';
          DesabilitaAgente;
        end;
        //se for 30, o campo NR_ROF  tem que ficar visível
        dbedt_nr_rof.Visible := dbedt_cd_mot_sem_cob.Text = '30';
        lbl_nr_rof.Visible   := dbedt_cd_mot_sem_cob.Text = '30';
        if not dbedt_nr_rof.Visible then
        begin
          if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
            datm_DI_Capa.qry_di_NR_ROF.AsString := '';
        end;
//        dbedt_nr_rof.Visible := False;
//        lbl_nr_rof.Visible   := False;
//        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert]
//        then datm_DI_Capa.qry_di_NR_ROF.AsString := '';
      end;
  end;
  dbrdg_contrato_cambioChange(nil);
end;


procedure Tfrm_DI_capa.rbtn_material_usadoClick(Sender: TObject);
begin
  if (in_di_abrindo or in_DI_Registrada or in_calculo) then Exit;
  if Not( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_capa.qry_di_.Edit;
  if rbtn_material_usado.Checked then
  begin
    datm_DI_capa.qry_di_IN_MATERIAL_USADO.AsBoolean := True;
    datm_DI_capa.qry_di_IN_BEM_ENCOMendA.AsBoolean  := False;
  end
  else
  if rbtn_Bem_sob_encomenda.Checked then
  begin
    datm_DI_capa.qry_di_IN_MATERIAL_USADO.AsBoolean := False;
    datm_DI_capa.qry_di_IN_BEM_ENCOMendA.AsBoolean  := True;
  end
  else
  begin
    datm_DI_capa.qry_di_IN_MATERIAL_USADO.AsBoolean := False;
    datm_DI_capa.qry_di_IN_BEM_ENCOMendA.AsBoolean  := False;
  end;
  dbedt_cd_incotermChange(nil);  
end;

procedure Tfrm_DI_capa.btn_adicao_diClick(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_QT_ADICOES.AsFloat <= 0 then
  begin
    BoxMensagem('Não existem adições' + #10#13 + 'para este processo!', 3);
    Exit;
  end;
  Close;
  frm_DI.i_seletor := 2;
end;

procedure Tfrm_DI_capa.btn_itens_diClick(Sender: TObject);
begin
  close;
  frm_DI.i_seletor := 3;
end;

procedure Tfrm_DI_capa.btn_co_importador1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  frm_cliente_co.Cons_OnLine := datm_DI_capa.qry_di_CD_IMPORTADOR;
  with frm_cliente_co do
  begin
    Caption := Caption;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_capa.btn_co_tipo_declaracao1Click(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTIPO_DECLARACAO',
                datm_DI_Capa.qry_di_CD_TIPO_DECLARACAO,
                'Tipo da Declaração de Importação', 2, '','TTable');
  dbedt_cd_tipo_declaracao2Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_urf_despacho1Click(Sender: TObject);
begin
  Consulta_On_line( 'TURF', datm_DI_capa.qry_di_CD_URF_DESPACHO, 'Unidade da Receita Federal', 1 );
  dbedt_cd_urf_despacho1Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_urf_entrada1Click(Sender: TObject);
var
  DBEditURF: TDBEdit;
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
    DBEditURF := dbedt_cd_urf_entrada_pais1
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
    DBEditURF := dbedt_cd_urf_entrada_pais2
  else
    DBEditURF := dbedt_cd_urf_entrada_pais3;
  DBEditURF.SetFocus;

  if not (datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit]) then datm_DI_Capa.qry_di_.Edit;
  if Sender is TSpeedButton then
    DBEditURF.Text :=  ConsultaOnLineEx('TURF', 'Unidade da Receita Federal', ['CODIGO', 'DESCRICAO'], ['Código','Descrição'],'CODIGO',nil, 1, DBEditURF.Text);
  DBEditURF.OnExit(nil);
end;

procedure Tfrm_DI_capa.btn_co_pais1Click(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_capa.qry_di_CD_BANDEIRA_TRANSP, 'Países', 1 );
  dbedt_cd_bandeira_transp_itl2Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_pais_procedencia1Click(Sender: TObject);
var
  DBEditPais: TDBEdit;
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
    DBEditPais := dbedt_cd_pais_procedencia1
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
    DBEditPais := dbedt_cd_pais_procedencia2
  else
    DBEditPais := dbedt_cd_pais_procedencia3;
  DBEditPais.SetFocus;
  if not (datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit]) then
    datm_DI_Capa.qry_di_.Edit;
  if Sender is TSpeedButton then
    DBEditPais.Text :=  ConsultaOnLineEx('TPAIS', 'Países', ['CODIGO', 'DESCRICAO'], ['Código','Descrição'],'CODIGO',nil, 1, DBEditPais.Text);
  DBEditPais.OnExit(nil);
end;

procedure Tfrm_DI_capa.btn_co_recinto_alfandegado1Click(Sender: TObject);
var
  DBEditRec, DBEditURF: TDBEdit;
begin
  // Criado por Michel porque estava sendo chamado de vários componentes e dando erro quando não estava visivel o componente original - 28/05/2009
  if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
  begin
    DBEditURF := dbedt_cd_urf_despacho1;
    DBEditRec := dbedt_cd_recinto_alfandegado1;
  end
  else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
  begin
    DBEditURF := dbedt_cd_urf_despacho2;
    DBEditRec := dbedt_cd_recinto_alfandegado2;
  end
  else
  begin
    DBEditURF := dbedt_cd_urf_despacho3;
    DBEditRec := dbedt_cd_recinto_alfandegado3;
  end;
  if DBEditURF.text <> '' then
  begin
    Consulta_On_line( 'TREC_ALFANDEGADO', datm_DI_capa.qry_di_CD_RECINTO_ALFAND, 'Recinto Alfandegado', 2 );
    DBEditRec.OnExit(nil);
  end
  else
    BoxMensagem( 'URF de Despacho não informada.', 3 );
end;

procedure Tfrm_DI_capa.btn_co_setor1Click(Sender: TObject);
begin
  if dbedt_cd_recinto_alfandegado1.text <> '' then
  begin
     Consulta_On_line( 'TRECINTO_SETORES_IMPORTACAO', datm_DI_capa.qry_di_CD_SETOR_ARMAZENAM, 'Recinto x Setores de Importação', 3 );
     dbedt_cd_setor1Exit(nil);
  end
  else
    BoxMensagem( 'Código do Recinto Alfandegado não informado.', 3 );
  Atualiza_Nome_Setor;
end;

procedure Tfrm_DI_capa.btn_co_moeda_mle1Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_DI_capa.qry_di_CD_MOEDA_MLE;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_moeda_mle1Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_moeda_frete1Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_DI_capa.qry_di_CD_MOEDA_FRETE;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_moeda_frete1Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_moeda_seguro1Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_DI_capa.qry_di_CD_MOEDA_SEGURO;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_moeda_seguro1Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_motivo_sem_cob1Click(Sender: TObject);
begin
  Consulta_On_line( 'TMOT_SEM_COBERT_CAMBIAL', datm_DI_capa.qry_di_CD_MOTIVO_SEM_COBERTURA, 'Motivo Sem Cobertura Cambial', 1 );
  Write_CD_MOT_SEM_COB;
end;

procedure Tfrm_DI_capa.btn_co_mod_pagto1Click(Sender: TObject);
begin
  Consulta_On_line( 'TMODALID_PAGAMENTO', datm_DI_capa.qry_di_CD_MODALIDADE_PAGTO, 'Modalidade de Pagamento', 1 );
  //Não possui Exit - Verificar
end;

procedure Tfrm_DI_capa.btn_co_transportador1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    Cons_OnLine := datm_DI_capa.qry_di_CD_TRANSPORTADOR;
    if Not ( datm_DI_Capa.qry_di_.State in [dsEdit] ) then
       datm_DI_Capa.qry_di_.Edit;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_capa.btn_co_local_embarque1Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2206';
  Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);
  frm_local_embarque.Cons_OnLine := datm_DI_capa.qry_di_CD_LOCAL_EMBARQUE;
  with frm_local_embarque do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_capa.Button3Click(Sender: TObject);
begin
  if datm_DI_capa.qry_di_VL_TOTAL_AD.AsFloat > 0 then
  begin
    datm_DI_capa.tbl_di_darf_.Insert;
    datm_DI_capa.tbl_di_darf_CD_RECEITA_PGTO.AsString    := '9999';
    datm_DI_capa.tbl_di_darf_CD_BANCO_PGTO_TRIB.AsString := MskEdt_cd_banco.Text;
    datm_DI_capa.tbl_di_darf_NR_AGENC_PGTO_TRIB.AsString := MskEdt_cd_agencia.Text;
    datm_DI_capa.tbl_di_darf_VL_TRIBUTO_PAGO.AsFloat     := datm_DI_capa.qry_di_VL_TOTAL_AD.AsFloat;
  end;
end;

procedure Tfrm_DI_capa.dbedt_pc_seguroExit(Sender: TObject);
begin
  Write_Carga2;
end;

procedure Tfrm_DI_capa.dbchkbox_repasseClick(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo) then Exit;

  if dbchkbox_repasse.Checked then
    if datm_DI_capa.qry_di_Look_Importador.AsString <> '' then
      if datm_DI_capa.qry_di_NR_COMPRADOR_ME.AsString = '' then
      begin
        if Not( datm_DI_capa.qry_di_.State in [dsEdit, dsInsert] ) then datm_DI_capa.qry_di_.Edit;
        if datm_DI_capa.tbl_empresa_nac_.FindKey([datm_DI_capa.qry_di_CD_IMPORTADOR.AsString]) then
           datm_DI_capa.qry_di_NR_COMPRADOR_ME.AsString := datm_DI_capa.tbl_empresa_nac_CGC_EMPRESA.AsString;
      end;
end;

procedure Tfrm_DI_capa.FormCreate(Sender: TObject);
var
  vCdDuimp: String;
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  btn_trans_DI.Enabled  := frm_DI.btn_trans_DI.Enabled;
  btn_Retificar.Visible := frm_DI.btn_Retificar.Visible;
  btn_Retificar.Enabled := frm_DI.btn_Retificar.Enabled;

  // Inicializa o Data Module para Senha
  Application.CreateForm( Tdatm_DI_capa, datm_DI_capa );

  datm_DI_capa.qry_recinto_setores_importacao_.Close;
  datm_DI_capa.qry_recinto_setores_importacao_.Prepare;
  datm_DI_capa.qry_recinto_setores_importacao_.Open;

  in_repassa_dados_adicao := False;
  in_repassa_dados_cambio := False;

  Tab_Ativa := tbsht_importador_TD01;

  vCdDuimp := ConsultaLookUPSQL('SELECT CD_DUIMP FROM TPROCESSO WHERE NR_PROCESSO = :NR_PROCESSO ', 'CD_DUIMP', [str_nr_processo]);
  if vCdDuimp <> '' then
    dbedt_nr_registro_di2.DataSource.DataSet.FieldByName('NR_DECLARACAO_IMP').EditMask := '';

end;

procedure Tfrm_DI_capa.dbchkbox_REBClick(Sender: TObject);
begin
  if ( pgctrl_capa_di.ActivePage = tbsht_carga_TD01 )  and
     ( pgctrl_carga1.ActivePage  = tbsht_carga_Page2 ) then //LUIZ 25/08
     if PodeFocar(dbedt_cd_moeda_frete1) then
       dbedt_cd_moeda_frete1.SetFocus;
end;

procedure Tfrm_DI_capa.btn_co_obsClick(Sender: TObject);
var
  vSelStart: Integer;
  vCodigo, vTexto: String;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_DI_capa.qry_di_) then
      Exit;
    //dbmemo_info_complementares.Text := ConsultaLookUp('TOBSERVACOES','CD_OBS',
    //   ConsultaOnLineEx('TOBSERVACOES', 'Observações', ['CD_OBS', 'TX_DESCRICAO'],
    //      ['Código', 'Descrição'], 'CD_OBS', frm_main.mi_cad_obs), 'TX_OBS') + dbmemo_info_complementares.Text;

    // Era utilizado o comando acima, mas agora é necessário passar o produto - Michel - 20/05/2009

    vCodigo := ConsultaOnLineExSQL(' SELECT CD_OBS, TX_DESCRICAO ' +
                                   ' FROM TOBSERVACOES (NOLOCK)           ' +
                                   ' WHERE CD_PRODUTO = "01"     ',
       'Observações', ['CD_OBS', 'TX_DESCRICAO'], ['Código', 'Descrição'],
       'CD_OBS', frm_main.mi_cad_obs);
    vTexto := ConsultaLookUp('TOBSERVACOES','CD_OBS', vCodigo, 'TX_OBS');
    if vTexto <> '' then
    begin
      if vCodigo = '0204' then // Admissão Temporária - Colocar o Processo Administrativo - Michel - 25/03/2010
        vTexto := vTexto + ConsultaLookUPSQL(' SELECT NR_PROCESSO_INSTR ' +
                                             ' FROM TPROCESSO_DI (NOLOCK) ' +
                                             ' WHERE NR_PROCESSO = ' + QuotedStr(str_nr_processo) +
                                             '   AND CD_TIPO_PROCESSO = 1 ', 'NR_PROCESSO_INSTR');
      dbmemo_info_complementares.SelText   := vTexto;
      dbmemo_info_complementares.SelLength := - Length(vTexto);
    end;

    //datm_DI_Capa.qry_di_TX_INFO_COMPL.AsString := dbmemo_info_complementares.Text;
  end;
(*  vStr_cd_modulo := '22';
  str_cd_rotina := '2205';
  Application.CreateForm(Tfrm_observacoes, frm_observacoes );
  frm_observacoes.Cons_OnLine := datm_DI_capa.qry_di_TX_INFO_COMPL;
  with frm_observacoes do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  Atualiza_Historico_Padrao;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0201'; *)
end;

procedure Tfrm_DI_capa.btn_co_armazensClick(Sender: TObject);
begin
//  Application.CreateForm(Tfrm_armazens, frm_armazens );
  Application.CreateForm(Tfrm_amz, frm_amz );
  frm_amz.qry_di_CD_URF_DESPACHO := datm_DI_capa.qry_di_CD_URF_DESPACHO;
  frm_amz.qry_di_CD_URF_ENTR_CARGA := datm_DI_capa.qry_di_CD_URF_ENTR_CARGA;
  frm_amz.qry_di_CD_SETOR_ARMAZENAM := datm_DI_capa.qry_di_CD_SETOR_ARMAZENAM;
  frm_amz.qry_di_CD_RECINTO_ALFAND := datm_DI_capa.qry_di_CD_RECINTO_ALFAND;
  frm_amz.tbl_Armazem_:= datm_DI_capa.tbl_di_armazem_NM_ARMAZEM_CARGA.DataSet;
  with frm_amz do
  begin
    Caption := Caption + ' [Consulta On-Line]';
//    lCons_OnLine := True;
    lDI_Armazem:= True;
    ShowModal;
//    lCons_OnLine := False;
  end;
  dbedt_cd_recinto_alfandegado1Exit(nil);
  dbedt_cd_setor1Exit(nil);
end;

procedure Tfrm_DI_capa.MskEdt_cd_bancoExit(Sender: TObject);
begin
  with datm_DI_Capa do
  begin
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_atualiza_bco_ag);
      sp_atualiza_bco_ag.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      sp_atualiza_bco_ag.ParamByName('@CD_BANCO').AsString    := mskEdt_cd_banco.Text;
      sp_atualiza_bco_ag.ParamByName('@NR_AGENC').AsString    := mskEdt_cd_agencia.Text;
      ExecStoredProc(sp_atualiza_bco_ag);
      CloseStoredProc(sp_atualiza_bco_ag);
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

procedure Tfrm_DI_capa.btn_calculoClick(Sender: TObject);
var                     
  vQryItensAux : TQuery;
  vReferenciaErrada : Boolean;
  vInConferencia : string[1];
  MoedasSemTaxa: String;
  vPorto :string;
  mensagemCalculo:String;
begin

  if not ValidarVinculacao(str_nr_processo) then
    exit;

  vInConferencia   := ConsultaLookUPSQL('select B.IN_CONFERE_REFERENCIA from TPROCESSO A (NOLOCK), TGRUPO B (NOLOCK) where ' +
                                        'A.NR_PROCESSO = '''  + str_nr_processo + ''' and B.CD_GRUPO = A.CD_GRUPO','IN_CONFERE_REFERENCIA');
  vReferenciaErrada := VerifReferenciaDI(str_nr_processo, vInConferencia);

  if not vReferenciaErrada then
    Exit;

  Grava(Sender);
  FechaTabelas; //Genéricas

  if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                       ' FROM TPROCESSO       P (NOLOCK) ' +
                       ' INNER JOIN TGRUPO    G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO ' +
                       ' WHERE P.NR_PROCESSO = ' + QuotedStr(str_nr_processo) +
                       '   AND G.TX_LUCRO_ESTIMADO IS NULL', 'QTD') <> '0' then
  begin
    MessageDlg('Taxa de Lucro Estimado não cadastrado para o Grupo de Cliente.', mtInformation, [mbOK], 0);
    Exit;
  end;

  datm_DI_capa.qry_di_.DisableControls;
  datm_DI_capa.qry_di_.Close;
  datm_di_capa.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_di_capa.qry_di_.Prepare;
  datm_di_capa.qry_di_.Open;
  datm_DI_capa.qry_di_.enableControls;

  if datm_di_capa.RateioAcreDeduc then
  begin
    if datm_di_capa.qryMoedasTaxas.Active then
      datm_di_capa.qryMoedasTaxas.Close;

    datm_di_capa.qryMoedasTaxas.ParamByName('NR_PROCESSO').AsString := datm_di_capa.qry_di_NR_PROCESSO.AsString;
    datm_di_capa.qryMoedasTaxas.Open;
    if not datm_di_capa.qryMoedasTaxas.Eof then
    begin
      MoedasSemTaxa := '';
      datm_di_capa.qryMoedasTaxas.First;
      while not datm_di_capa.qryMoedasTaxas.Eof do
      begin
        MoedasSemTaxa := MoedasSemTaxa + ', ' + datm_di_capa.qryMoedasTaxasCD_MOEDA.AsString;
        datm_di_capa.qryMoedasTaxas.Next;
      end;
      Delete(MoedasSemTaxa, 1, 2);
      ShowMessage('Não há taxa cadastrada para a data informada para as seguintes moedas: ' + MoedasSemTaxa + '.'#13 +
         'Favor verificar as taxas e tentar novamente.');
      Exit;
    end;

    if not AtualizaVolumes then // Tem Carga sem o tipo definido - Michel - 12/08/2009 - Ocorrencia 10800/09
    begin
      BoxMensagem('Há Carga Solta sem preenchimento para o campo ''Espécie (SISCOMEX)''.'#13 +
                  'Preencha essas informações antes de continuar.'#13'Processo abortado.', 2);
      Exit;
    end;

    vPorto := ConsultaLookUPSQL(' SELECT CD_URF_DESPACHO                  ' +
                                ' FROM TDECLARACAO_IMPORTACAO DI (NOLOCK) ' +
                                ' WHERE DI.NR_PROCESSO = ' + QuotedStr(str_nr_processo)
                                , 'CD_URF_DESPACHO');

    if (vPorto <> '0817800') and (vPorto <> '') then
    begin
      if (MessageDlg('Conferir volume informado. O porto de desembarque informado não é o porto de Santos.',
                    mtConfirmation, [mbOK,mbCancel], 0)) = mrCancel then
        Abort;
    end;

    {***calculo aqui****}
    mensagemCalculo := '';
    mensagemCalculo := fsp_di_calculo( str_nr_processo, False );
    if mensagemCalculo <> '' then
      BoxMensagem(mensagemCalculo, 3);
    {***calculo aqui****}

    
    // Fecha e Abre para não sobrescrever dados - Michel - 28/05/2009
    datm_DI_capa.qry_di_.DisableControls;
    datm_DI_capa.qry_di_.Close;
    datm_di_capa.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_di_capa.qry_di_.Prepare;
    datm_di_capa.qry_di_.Open;
    datm_DI_capa.qry_di_.enableControls;

    // Colocado em edição para efetuar Write_Carga2 - Michel - 20/05/2009
    datm_di_capa.qry_di_.Edit;
    in_calculo := True;
    Write_Carga2;

    // Post para efetivar as alterações criadas pelo Write_Carga2, e se não foi feita, apenas para tirar do modo de edição - Michel - 20/05/2009
    datm_di_capa.qry_di_.Post;

    Tab_Ativa := pgctrl_capa_di.ActivePage;
    FormShow(Sender);
    pgctrl_capa_di.ActivePage := Tab_Ativa;
    in_calculo := False;
  end
  else
    MessageDlg('Cálculo cancelado.', mtInformation, [mbOk], 0);
end;

procedure Tfrm_DI_capa.dbedt_cd_incotermExit(Sender: TObject);
begin
  if ( Not datm_DI_Capa.tbl_incoterms_.FindKey([dbedt_cd_incoterm.Text]) ) and (dbedt_cd_incoterm.Text <> '') then
  begin
    BoxMensagem('Código do INCOTERM inválido!',2);
    if PodeFocar(dbedt_cd_incoterm) then
      dbedt_cd_incoterm.SetFocus;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_moeda_mle1Exit(Sender: TObject);
begin
  if dbedt_cd_moeda_mle1.Text <> '' then
  begin
    if frm_DI.in_DI_Retificacao then
    begin
      AtzTaxaCambialDI( dbedt_cd_moeda_mle1.Text, datm_DI_Capa.qry_di_TX_MLE );
    end
    else
    begin
      if datm_DI_Capa.tbl_taxa_cambio_.FindKey([dbedt_cd_moeda_mle1.Text]) then
      begin
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
           datm_DI_Capa.qry_di_TX_MLE.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;
      end;
    end;
    Write_Carga2;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_moeda_frete1Exit(Sender: TObject);
begin
  if dbedt_cd_moeda_frete1.Text <> '' then
  begin
    if frm_DI.in_DI_Retificacao then
    begin
      AtzTaxaCambialDI( dbedt_cd_moeda_frete1.Text, datm_DI_Capa.qry_di_TX_FRETE );
    end
    else
    begin
      if datm_DI_Capa.tbl_taxa_cambio_.FindKey([dbedt_cd_moeda_frete1.Text]) then
      begin
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
           datm_DI_Capa.qry_di_TX_FRETE.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;
      end;
    end;
    Write_Carga2;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_moeda_seguro1Exit(Sender: TObject);
begin
  if dbedt_cd_moeda_seguro1.Text <> ''  then
  begin
    if frm_DI.in_DI_Retificacao then
    begin
      AtzTaxaCambialDI( dbedt_cd_moeda_seguro1.Text, datm_DI_Capa.qry_di_TX_SEGURO );
    end
    else
    begin
      if datm_DI_Capa.tbl_taxa_cambio_.FindKey([dbedt_cd_moeda_seguro1.Text]) then
      begin
        if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
           datm_DI_Capa.qry_di_TX_SEGURO.AsFloat := datm_DI_Capa.tbl_taxa_cambio_taxa_conversao.AsFloat;
      end;
    end;
    Write_Carga2;
  end
  else
    if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
       datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat := 0;
end;

procedure Tfrm_DI_capa.btn_excluirClick(Sender: TObject);
begin
  with datm_DI_Capa do
  begin
    if BoxMensagem( 'Deseja realmente excluir a DI ' + Copy( str_nr_processo, 5, 14 ) + '?', 1 ) then
    try
      qry_di_.Close;
      FechaTabelas;
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_exclui_di);
        sp_exclui_di.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc(sp_exclui_di);
        CloseStoredProc(sp_exclui_di);
        datm_main.db_broker.Commit;
        VerificaEstado(False);
      except
        on E: Exception do
        begin
          btn_cancelarClick(nil);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      in_excluiu := True;
      Close;
    except
      BoxMensagem( 'Operação de exclusão não foi executada com sucesso.', 2 );
    end;
  end;
end;

procedure Tfrm_DI_capa.dbrdg_contrato_cambioChange(Sender: TObject);
begin

  ntbk_cambio.Visible := True;
  dbrgrp_parcelas.Visible := False;

  if ( dbg_cobertura_cambial.ItemIndex = 3 ) or
     ( datm_DI_Capa.qry_di_CD_COBERTURA_CAMBIAL.AsString = '4' ) then
  begin
    ntbk_cambio.Visible := False;
    Exit;
  end; //Sem Cobertura

  if ( dbrdg_contrato_cambio.ItemIndex = 2 ) then
  begin
    lbl_total_cambio.Visible := False;
    dbedt_vl_tot_cambio.Visible := False;

    dbrgrp_parcelas.Visible := True;
    if dbrgrp_parcelas.ItemIndex = 1 then
       ntbk_cambio.PageIndex := 2
    else
       ntbk_cambio.PageIndex := 1;
  end
  else
  begin
    lbl_total_cambio.Visible := True;
    dbedt_vl_tot_cambio.Visible := True;
    ntbk_cambio.PageIndex := 0;
  end;

  dbedt_cd_mot_sem_cobChange(nil);
end;

procedure Tfrm_DI_capa.pgctrl_carga1Change(Sender: TObject);
begin
  with datm_di_capa do
  begin
    if pgctrl_carga1.ActivePage = tbsDE then
    begin
      if qry_DE_DI.Active then
        qry_DE_DI.Close;
      qry_DE_DI.ParambyName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
      qry_DE_DI.Open;
    end
    else if pgctrl_carga1.ActivePage = tbsht_carga_Page3 then
    begin
      tbl_acrescimos.open;
      tbl_deducoes.open;
      tbl_tp_acres_.open;
      tbl_tp_dedu_.open;
    end
    else
    begin
      tbl_acrescimos.Close;
      tbl_deducoes.Close;
      tbl_tp_acres_.Close;
      tbl_tp_dedu_.Close;
    end;
  end;
//  if pgctrl_carga1.ActivePage = tbsht_carga_Page2 then dbedt_pc_seguroExit(nil);
end;

{
procedure Tfrm_DI_capa.Atualiza_Historico_Padrao;
var
  tx_inf_compl, cTexto1, cTexto2        : AnsiString;
  cTexto, cData1, servico, vURF, vTexto : string;
  npos, npos1, n                        : integer;
  i, indice                             : Byte;
  vCapatazia                            : Real;
  vEscreverLinha                        : Boolean;
  vQryInstEmb                           : TQuery;
begin
  //abre query que verifica os documentos da instrução de embarque
  Atualiza_Historico_Padrao_Novo;  // REMOVER - MICHEL
  Exit;
  // Executa o Padrão novo acima - Michel - 27/07/2011
  vQryInstEmb := TQuery.Create(application);
  vQryInstEmb.DataBaseName := 'DBBROKER';
  vQryInstEmb.Close;
  vQryInstEmb.SQL.Clear;
  vQryInstEmb.SQL.Add('SELECT TX_DECL_ADIC FROM TDOC_INSTRUCAO_DESPACHO (NOLOCK) WHERE CODIGO NOT IN (''01'', ''17'', ''28'') ORDER BY DESCRICAO');
  vQryInstEmb.Open;

  if in_DI_Registrada or not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then
    Exit;
  indice := 68;
  tx_inf_compl := '';
  if dbmemo_info_complementares.Text = '' then
    cTexto1 := datm_DI_capa.qry_di_.FieldByName('TX_INFO_COMPL').AsString
  else
    cTexto1 := dbmemo_info_complementares.Text;
  npos := length( cTexto1 );
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
  npos := length( cTexto1 );
  vAFRMMencontrado := '';
  while npos > 0 do
  begin
    npos := nAt ( #13 , cTexto1 );
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
    if Copy ( cTexto1 , 1 , 1 ) = #10 then
      cTexto1 := Copy ( cTexto1 , 2 , ( length (cTexto1) - 1 ) );
    npos := length( cTexto2 );
    if npos < 17 then
      cTexto := Copy ( cTexto2 , 1, npos)
    else cTexto := Copy ( cTexto2 , 1, 17);
    if ( cTexto = 'CONHECIMENTO MAST' ) then
    begin
      npos1 := nAt ( 'DATA..:' , cTexto2 );
      if npos1 > 0 then
        cData1 := Copy ( cTexto2, npos1 + 7 , ( length( cTexto2 ) - npos1 - 9 ) )
      else cData1 := ''
    end;
    if ( cTexto = 'A.F.R.M.M........' ) (*or ( vURF = '0417800' )*) then
      vAFRMMencontrado := 'A.F.R.M.M...............: R$ ';

    // Substituir os textos antigos pelos novos - Michel - 25/05/2009 - Ocorrência 09274/09
    if (cTexto = 'NOSSA REFERENCIA.') then
      cTexto := 'REF. REPRESENTANT'
    else if (cTexto = 'REF.IMPORTADOR...') then
      cTexto := 'REF. IMPORTADOR..'
    else if (cTexto = 'VALOR VA.........') then
      cTexto := 'VALOR ADUANEIRO..';

    //verifica se linha não é linha incluída automaticamente da Instrução de Embarque, se for não escreve agora para atualizar daqui a pouco...
    vEscreverLinha := True;
    vQryInstEmb.First;
    while not vQryInstEmb.Eof do
    begin
      if (cTexto = Copy(vQryInstEmb.Fields[0].AsString, 1, 17)) then
      begin
        vEscreverLinha := False;
        Break;
      end;
      vQryInstEmb.Next;
    end;

    if ( ( Copy( str_nr_processo, 5, 2 ) = 'IE' ) and ( cd_servico = '016' ) ) then
    begin
      if ( cTexto <> 'FATURA PRO-FORMA.' ) and ( cTexto <> 'REF. REPRESENTANT' ) and ( cTexto <> 'REF. IMPORTADOR..' ) and
         ( cTexto <> 'CONHECIMENTO.....' ) and ( cTexto <> 'CONHECIMENTO MAST' ) and ( cTexto <> 'PRESENCA DE CARGA' ) and
         ( cTexto <> 'RAZ. SOCIAL TRANS' ) and ( cTexto <> 'C.N.P.J. TRANSP..' ) and ( cTexto <> 'CONTEINERES......' ) and
         ( cTexto <> 'ESPECIE..........' ) and ( cTexto <> 'LOCAL DE EMBARQUE' ) and ( cTexto <> 'VEICULO..........' ) and
         ( cTexto <> 'DATA DA CHEGADA..' ) and ( cTexto <> 'VMLE.............' ) and ( cTexto <> 'FRETE + SEGURO...' ) and
         ( cTexto <> 'VMLE + FRETE + SE' ) and ( cTexto <> 'TAXA SISCOMEX....' ) and ( cTexto <> 'ACRÉSCIMOS.......' ) and
         ( cTexto <> 'ACR+SCIMOS.......' ) and ( cTexto <> 'DEDUÇÕES.........' ) and ( cTexto <> 'TAXA CAMBIAL.....' ) and
         ( cTexto <> '-----------------' ) and ( cTexto <> 'ADICAO...........' ) and ( cTexto <> 'VALOR ADUANEIRO..' ) and
         ( cTexto <> 'VALOR ICMS DEVIDO' ) and ( cTexto <> 'PIS / PASEP......' ) and ( cTexto <> 'COFINS ..........' ) and
         ( cTexto <> 'PIS / PASEP SUSPE' ) and ( cTexto <> 'COFINS SUSPENSO..' ) and ( cTexto <> 'ALIQUOTA PIS.....' ) and
         ( cTexto <> 'ALIQUOTA COFINS..' ) and ( cTexto <> 'I.P.I. ..........' ) and ( cTexto <> 'I.I. ............' ) and
         //( cTexto <> 'O VALOR DA CAPATA' ) and ( cTexto <> 'CALCULO DO SEGURO' ) and ( cTexto <> 'DEMONSTRATIVO DE ' ) and
         //( cTexto <> 'VALOR DA MERCADOR' ) and ( cTexto <> 'VALOR CFR DA MERC' ) and ( cTexto <> 'VALOR DO SEGURO..' ) and ( cTexto <> 'VALOR FRETE+CAPAT' )
         ( cTexto <> '------------- -- ' ) and ( cTexto <> 'A.F.R.M.M........' ) and ( cTexto <> 'BASE PIS / COFINS' ) and
         ( cTexto <> 'APLICACAO........' ) and ( cTexto <> 'BASE ICMS........') and
         // Comparações para Admissão Temporária - Michel - 22/03/2010
         ( cTexto <> '*****************' ) and
         ( Copy(cTexto, 1, 14) <> 'I.I. CALCULADO' )   and ( cTexto <> 'I.I. PROPORCIONAL' ) and ( Copy(cTexto, 1, 13) <> 'I.I. SUSPENSO' ) and
         ( Copy(cTexto, 1, 13) <> 'IPI CALCULADO' )    and ( cTexto <> 'IPI PROPORCIONAL ' ) and ( Copy(cTexto, 1, 12) <> 'IPI SUSPENSO' ) and
         ( Copy(cTexto, 1, 13) <> 'PIS CALCULADO' )    and ( cTexto <> 'PIS PROPORCIONAL ' ) and ( Copy(cTexto, 1, 12) <> 'PIS SUSPENSO' ) and
         ( cTexto <> 'COFINS CALCULADO ' )             and ( cTexto <> 'COFINS  PROPORCIO' ) and ( Copy(cTexto, 1, 15) <> 'COFINS SUSPENSO' ) and
         ( Copy(cTexto, 1, 14) <> 'ICMS CALCULADO' ) and ( cTexto <> 'ICMS PROPORCIONAL' ) and ( Copy(cTexto, 1, 13) <> 'ICMS SUSPENSO' ) and
         ( cTexto <> 'VALOR ADUANEIRO R' )             and ( cTexto <> 'VALOR SUSPENSO TO' ) and ( cTexto <> 'DEMOSTRATIVO DO C' ) and
         ( cTexto <> 'DEMONSTRATIVO DO C' ) and( cTexto <> 'FECP.............') and (vEscreverLinha) then
      begin
        if not ( ( tx_inf_compl = '' ) and ( cTexto2 = #13#10 ) ) then
          tx_inf_compl := tx_inf_compl + cTexto2;
      end;
    end
    else
    begin
      if ( cTexto <> 'FATURA COMERCIAL.' ) and ( cTexto <> 'REF. REPRESENTANT' ) and ( cTexto <> 'REF. IMPORTADOR..' ) and
         ( cTexto <> 'CONHECIMENTO.....' ) and ( cTexto <> 'CONHECIMENTO MAST' ) and ( cTexto <> 'PRESENCA DE CARGA' ) and
         ( cTexto <> 'RAZ. SOCIAL TRANS' ) and ( cTexto <> 'C.N.P.J. TRANSP..' ) and ( cTexto <> 'CONTEINERES......' ) and
         ( cTexto <> 'ESPECIE..........' ) and ( cTexto <> 'LOCAL DE EMBARQUE' ) and ( cTexto <> 'VEICULO..........' ) and
         ( cTexto <> 'DATA DA CHEGADA..' ) and ( cTexto <> 'VMLE.............' ) and ( cTexto <> 'FRETE + SEGURO...' ) and
         ( cTexto <> 'VMLE + FRETE + SE' ) and ( cTexto <> 'TAXA SISCOMEX....' ) and ( cTexto <> 'ACRÉSCIMOS.......' ) and
         ( cTexto <> 'ACR+SCIMOS.......' ) and ( cTexto <> 'DEDUÇÕES.........' ) and ( cTexto <> 'TAXA CAMBIAL.....' ) and
         ( cTexto <> '-----------------' ) and ( cTexto <> 'ADICAO...........' ) and ( cTexto <> 'VALOR ADUANEIRO..' ) and
         ( cTexto <> 'VALOR ICMS DEVIDO' ) and ( cTexto <> 'PIS / PASEP......' ) and ( cTexto <> 'COFINS ..........' ) and
         ( cTexto <> 'PIS / PASEP SUSPE' ) and ( cTexto <> 'COFINS SUSPENSO..' ) and ( cTexto <> 'ALIQUOTA PIS.....' ) and
         ( cTexto <> 'ALIQUOTA COFINS..' ) and ( cTexto <> 'I.P.I. ..........' ) and ( cTexto <> 'I.I. ............' ) and
         //( cTexto <> 'O VALOR DA CAPATA' ) and ( cTexto <> 'CALCULO DO SEGURO' ) and ( cTexto <> 'DEMONSTRATIVO DE ' ) and
         //( cTexto <> 'VALOR DA MERCADOR' ) and ( cTexto <> 'VALOR CFR DA MERC' ) and ( cTexto <> 'VALOR DO SEGURO..' ) and ( cTexto <> 'VALOR FRETE+CAPAT' )
         ( cTexto <> '------------- -- ' )  and ( cTexto <> 'A.F.R.M.M........' ) and ( cTexto <> 'BASE PIS / COFINS' ) and
         ( cTexto <> 'APLICACAO........' ) and ( cTexto <> 'BASE ICMS........') and
         // Comparações para Admissão Temporária - Michel - 22/03/2010
         ( cTexto <> '*****************' ) and
         ( Copy(cTexto, 1, 14) <> 'I.I. CALCULADO' )   and ( cTexto <> 'I.I. PROPORCIONAL' ) and ( Copy(cTexto, 1, 13) <> 'I.I. SUSPENSO' ) and
         ( Copy(cTexto, 1, 13) <> 'IPI CALCULADO' )    and ( cTexto <> 'IPI PROPORCIONAL ' ) and ( Copy(cTexto, 1, 12) <> 'IPI SUSPENSO' ) and
         ( Copy(cTexto, 1, 13) <> 'PIS CALCULADO' )    and ( cTexto <> 'PIS PROPORCIONAL ' ) and ( Copy(cTexto, 1, 12) <> 'PIS SUSPENSO' ) and
         ( cTexto <> 'COFINS CALCULADO ' )             and ( cTexto <> 'COFINS PROPORCION' ) and ( Copy(cTexto, 1, 15) <> 'COFINS SUSPENSO' ) and
         ( Copy(cTexto, 1, 14) <> 'ICMS CALCULADO' ) and ( cTexto <> 'ICMS PROPORCIONAL' ) and ( Copy(cTexto, 1, 13) <> 'ICMS SUSPENSO' ) and
         ( cTexto <> 'VALOR ADUANEIRO R' )             and ( cTexto <> 'VALOR SUSPENSO TO' ) and ( cTexto <> 'DEMOSTRATIVO DO C' ) and
         ( cTexto <> 'DEMONSTRATIVO DO C' ) and( cTexto <> 'FECP.............') and (vEscreverLinha) then
      begin
        if not ( ( tx_inf_compl = '' ) and ( cTexto2 = #13#10 ) ) then
          tx_inf_compl := tx_inf_compl + cTexto2;
      end;
    end;
  end;

  if ( Copy(tx_inf_compl, length(tx_inf_compl)-1, 2) <> #13#10 ) and ( Length( tx_inf_compl ) <> 0 )  then
    tx_inf_compl := tx_inf_compl + #13#10;
  vURF := datm_DI_Capa.qry_di_CD_URF_ENTR_CARGA.AsString;

  // Condicional comentada porque estava excluindo detalhes das adições na guia Complementares - Michel - 03/02/2009 - Ocorrência 00504/09
  //if ( vURF <> '0417800' ) then
  begin
    (*if vURF = '0417800' then
    begin
      vCapatazia := StrToFloatDef(ConsultaLookupSQL('SELECT convert(DECIMAL(16,2),VL_MOEDA) VL_MOEDA FROM TACRESCIMO_DEDUCAO WHERE NR_PROCESSO = ''' + str_nr_processo + ''' AND CD_DESPESA = ''9''','VL_MOEDA'),0);
      vTexto := '---------------------------------------------------------------';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'O VALOR DA CAPATAZIA DE R$ ' + FormatFloat('#0.,00', vCapatazia) +
                ', ESTÁ NO CAMPO DE ACRÉSCIMOS';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'CALCULO DO SEGURO.......: ' +
                FormatFloat('#0.,00',datm_DI_Capa.qry_di_PC_SEGURO_MLE.AsFloat) +
                '% SOBRE O VALOR CFR DA MERCADORIA';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'DEMONSTRATIVO DE CALCULO DO SEGURO :';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := '------------- -- ------- -- ------';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'VALOR DA MERCADORIA.....: ' + ConsultaLookup('TMOEDA_BROKER','CD_MOEDA',datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString,'AP_MOEDA') + ' ' +
                FormatFloat('#0.,00',datm_DI_Capa.qry_di_VL_TOT_MLE_MNEG.AsFloat-datm_DI_Capa.qry_di_VL_TOT_FRT_COLLECT.AsFloat);
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'VALOR FRETE+CAPATAZIA...:  R$ ' + FormatFloat('#0.,00',vCapatazia+datm_DI_Capa.qry_di_Calc_VL_TOT_FRETE_MN.AsFloat);
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'VALOR CFR DA MERCADORIA.: ' + ConsultaLookup('TMOEDA_BROKER','CD_MOEDA',datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString,'AP_MOEDA') + ' ' +
                FormatFloat('#0.,00',datm_DI_Capa.qry_di_VL_TOT_MLE_MNEG.AsFloat);
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'VALOR DO SEGURO.........: ' + ConsultaLookup('TMOEDA_BROKER','CD_MOEDA',datm_DI_Capa.qry_di_CD_MOEDA_SEGURO.AsString,'AP_MOEDA') + ' ' +
                FormatFloat('#0.,00',datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat);
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := 'VALOR DO SEGURO.........:  R$ ' + FormatFloat('#0.,00',datm_DI_Capa.qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat);
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
      vTexto := '---------------------------------------------------------------';
      tx_inf_compl := tx_inf_compl + vTexto + Space( indice - Length( vTexto ) ) + '|' + #13#10;
    end;*)

    if ( str_hist_fatura <> '' ) (*and ( vURF <> '0417800' )*) then
    begin
      servico := '';
      datm_DI_capa.qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_capa.qry_processo_.Open;
      servico := datm_DI_capa.qry_processo_CD_SERVICO.AsString;
      datm_DI_capa.qry_processo_.Close;

      (* by Carlos em 15/06/2010 - Tentativa em evitar a duplicação da fatura *)
      if pos(str_hist_fatura,tx_inf_compl)=0 then begin
         if ( ( Copy( str_nr_processo, 5, 2 ) = 'IE' ) and ( servico = '016' ) ) then
           tx_inf_compl := tx_inf_compl + 'FATURA PRO-FORMA........: ' + str_hist_fatura  +
                           Space( indice - Length( 'FATURA PRO-FORMA........: ' + str_hist_fatura ) ) + '|' + #13#10
         else
           tx_inf_compl := tx_inf_compl + 'FATURA COMERCIAL........: ' + str_hist_fatura  +
                           Space( indice - Length( 'FATURA COMERCIAL........: ' + str_hist_fatura ) ) + '|' + #13#10;
      end;

    end;

    //documentos preenchidos na tela de Instrução de Embarque
    vQryInstEmb.Close;
    vQryInstEmb.SQL.Clear;
    vQryInstEmb.SQL.Add(' SELECT ISNULL(DID.TX_DECL_ADIC, ''''), ISNULL(NR_DCTO_INSTRUCAO, '''') ');
    vQryInstEmb.SQL.Add(' FROM TDOCUMENTO_INSTRUCAO I (NOLOCK) ');
    vQryInstEmb.SQL.Add(' INNER JOIN TDOC_INSTRUCAO_DESPACHO DID (NOLOCK) ON DID.CODIGO = I.CD_TIPO_DCTO_INSTR ');
    vQryInstEmb.SQL.Add(' WHERE I.NR_PROCESSO = ''' + str_nr_processo + ''' ');
    vQryInstEmb.SQL.Add('   AND DID.CODIGO NOT IN (''01'', ''17'', ''28'') ');
    vQryInstEmb.SQL.Add(' ORDER BY DID.TX_DECL_ADIC ');
    vQryInstEmb.Open;
    while not vQryInstEmb.Eof do
    begin
      tx_inf_compl := tx_inf_compl + vQryInstEmb.Fields[0].AsString + ': ' + vQryInstEmb.Fields[1].AsString + Space(indice - Length(vQryInstEmb.Fields[0].AsString + ': ' + vQryInstEmb.Fields[1].AsString)) + '|' + #13#10;

      vQryInstEmb.Next;
    end;
    vQryInstEmb.Close;

    if ( str_hist_n_ref    <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'REF. REPRESENTANTE......: ' + str_hist_n_ref   +
                      Space( indice - Length( 'REF. REPRESENTANTE......: ' + str_hist_n_ref ) ) + '|' + #13#10;
    if ( str_hist_s_ref    <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'REF. IMPORTADOR.........: ' + str_hist_s_ref   +
                      Space( indice - Length( 'REF. IMPORTADOR.........: ' + str_hist_s_ref ) ) + '|' + #13#10;
    if str_hist_conh     <> '' then
      tx_inf_compl := tx_inf_compl + 'CONHECIMENTO............: ' + str_hist_conh    + '  DATA..:' + str_hist_dt_emb +
                      Space( indice - Length( 'CONHECIMENTO............: ' + str_hist_conh    + '  DATA..:' + str_hist_dt_emb ) ) + '|' + #13#10;
    if str_hist_conh_m   <> '' then
      tx_inf_compl := tx_inf_compl + 'CONHECIMENTO MASTER.....: ' + str_hist_conh_m  + '  DATA..:' + cData1 +
                      Space( indice - Length( 'CONHECIMENTO MASTER.....: ' + str_hist_conh_m  + '  DATA..:' + cData1 ) ) + '|' + #13#10;
    if ( str_hist_pcarga   <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'PRESENCA DE CARGA.......: ' + str_hist_pcarga  +
                      Space( indice - Length( 'PRESENCA DE CARGA.......: ' + str_hist_pcarga ) ) + '|' + #13#10;
    if ( str_nm_transp     <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'RAZ. SOCIAL TRANSP......: ' + str_nm_transp    +
                      Space( indice - Length( 'RAZ. SOCIAL TRANSP......: ' + str_nm_transp ) ) + '|' + #13#10;
    if ( str_cnpj_transp   <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'C.N.P.J. TRANSP.........: ' + str_cnpj_transp  +
                      Space( indice - Length( 'C.N.P.J. TRANSP.........: ' + str_cnpj_transp ) ) + '|' + #13#10;
    if str_hist_cntr     <> '' then
      tx_inf_compl := tx_inf_compl + 'CONTEINERES.............: ' + str_hist_cntr    +
                      Space( indice - Length( 'CONTEINERES.............: ' + str_hist_cntr ) ) + '|' + #13#10;
    if ( str_hist_especie  <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'ESPECIE.................: ' + str_hist_especie +
                      Space( indice - Length( 'ESPECIE.................: ' + str_hist_especie ) ) + '|' + #13#10;
    if ( str_hist_loc_emb  <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'LOCAL DE EMBARQUE.......: ' + str_hist_loc_emb +
                      Space( indice - Length( 'LOCAL DE EMBARQUE.......: ' + str_hist_loc_emb ) ) + '|' + #13#10;
    if ( str_hist_veiculo  <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'VEICULO.................: ' + str_hist_veiculo +
                      Space( indice - Length( 'VEICULO.................: ' + str_hist_veiculo ) ) + '|' + #13#10;
    if ( Trim( str_hist_dt_cheg ) <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'DATA DA CHEGADA.........: ' + str_hist_dt_cheg +
                      Space( indice - Length( 'DATA DA CHEGADA.........: ' + str_hist_dt_cheg ) ) + '|' + #13#10;


   (* if ( str_hist_vmle_moeda     <> '' ) then //and ( vURF <> '0417800' )
      tx_inf_compl := tx_inf_compl + 'VMLE na Moeda...........: ' + str_hist_vmle_moeda    +
                      Space( indice - Length( 'VMLE na Moeda...........: ' + str_hist_vmle_moeda ) ) + '|' + #13#10;

    if ( str_hist_vmle     <> '' )  then and ( vURF <> '0417800' )
      tx_inf_compl := tx_inf_compl + 'VMLE....................: ' + str_hist_vmle    +
                      Space( indice - Length( 'VMLE....................: ' + str_hist_vmle ) ) + '|' + #13#10;   *)


    if ( str_hist_fr_seg   <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'FRETE + SEGURO..........: ' + str_hist_fr_seg  +
                      Space( indice - Length( 'FRETE + SEGURO..........: ' + str_hist_fr_seg ) ) + '|' + #13#10;
    if ( str_hist_cif      <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'VMLE + FRETE + SEGURO...: ' + str_hist_cif     +
                      Space( indice - Length( 'VMLE + FRETE + SEGURO...: ' + str_hist_cif ) ) + '|' + #13#10;
    if ( str_tx_siscomex   <> '' ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'TAXA SISCOMEX...........: ' + str_tx_siscomex +
                      Space( indice - Length( 'TAXA SISCOMEX...........: ' + str_tx_siscomex ) ) +'|'+ #13#10;
    if ( dbl_acrescimo > 0 ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'ACRÉSCIMOS..............: ' + str_vl_acrescimo +
                      Space( indice - Length( 'ACRÉSCIMOS..............: ' + str_vl_acrescimo )) + '|' + #13#10;
    if ( dbl_deducao > 0 ) (*and ( vURF <> '0417800' )*) then
      tx_inf_compl := tx_inf_compl + 'DEDUÇÕES................: ' + str_vl_deducao +
                      Space( indice - Length( 'DEDUÇÕES................: ' + str_vl_deducao )) + '|' + #13#10;


    for i := 1 to 10 do
    begin
      if str_hist_taxa[i]  <> '' then
        tx_inf_compl := tx_inf_compl + 'TAXA CAMBIAL............: ' + str_hist_taxa[i] +
                        Space( indice - Length( 'TAXA CAMBIAL............: ' + str_hist_taxa[i] ) ) + '|' + #13#10
      else break;
    end;

    tx_inf_compl := tx_inf_compl + HistoricoMP164;
  end;

  datm_DI_Capa.qry_di_TX_INFO_COMPL.AsString := StringReplace(tx_inf_compl, '|', ' ', [rfReplaceAll]);

  vQryInstEmb.Free;
end;

}

procedure Tfrm_DI_capa.tbsht_carga_Page2Exit(Sender: TObject);
var dbl_vmle_mneg    : double;
    dbl_vmle_mn      : double;
    dbl_fr_seg_mneg  : double;
    dbl_fr_seg_mn    : double;
    dbl_cif_mneg     : double;
    dbl_cif_mn       : double;
begin

  with datm_DI_Capa do
  begin
(*    qry_acrescimo_valoracao_.Close;
    qry_acrescimo_valoracao_.ParamByName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
    qry_acrescimo_valoracao_.Prepare;
    qry_acrescimo_valoracao_.Open;

    qry_adicao_importacao_.Close;
    qry_adicao_importacao_.ParamByName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
    qry_adicao_importacao_.Prepare;
    qry_adicao_importacao_.Open;
*)
    if dbchkbox_mesma_moeda1.Checked then
      dbl_vmle_mn := qry_di_Calc_VL_TOT_MLE_MN.AsFloat + qry_di_Calc_VL_TOT_DESPESA_MN.AsFloat
    else dbl_vmle_mn := qry_di_VL_TOTAL_MLE_MN.AsFloat + qry_di_VL_TOT_DESPS_MN.AsFloat;

    //Alexandre 26/06 - pedido Claudemir
    if datm_DI_Capa.qry_di_IN_EMBUT_FRT_ITENS.AsBoolean then
       dbl_vmle_mn := dbl_vmle_mn - datm_DI_Capa.qry_di_VL_TOTAL_FRETE_MN.asFloat;
    if datm_DI_Capa.qry_di_IN_EMBUT_SEG_ITENS.AsBoolean then
       dbl_vmle_mn := dbl_vmle_mn - datm_DI_Capa.qry_di_VL_TOTAL_SEG_MN.AsFloat;

    if qry_di_CD_MOEDA_MLE.AsString = '220' then
    begin
      dbl_vmle_mneg   := qry_di_VL_TOT_MLE_MNEG.AsFloat + qry_di_VL_TOT_DESPS_MNEG.AsFloat;
    end
    else
    begin
      if qry_di_TX_DOLAR.AsFloat <> 0 then
        dbl_vmle_mneg := dbl_vmle_mn / qry_di_TX_DOLAR.AsFloat
      else
        dbl_vmle_mneg := 0
    end;

    if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
       ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat > 0 ) and
       ( qry_di_.FieldByName('TX_MLE').AsFloat > 0 ) then
    begin
      if ( qry_di_.FieldByName('CD_MOEDA_FRETE').AsString =
           qry_di_.FieldByName('CD_MOEDA_MLE').AsString ) and
         ( qry_di_CD_MOEDA_FRETE.AsString = '220' ) then
      begin
        dbl_vmle_mneg := dbl_vmle_mneg - qry_di_Calc_TOT_FRETE_MNEG.AsFloat;
      end
      else
      begin
        if qry_di_.FieldByName('TX_DOLAR').AsFloat > 0 then
          dbl_vmle_mneg := dbl_vmle_mneg - ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat /
                                             qry_di_.FieldByName('TX_DOLAR').AsFloat )
        else
          dbl_vmle_mneg := 0;
      end;
    end;

    if qry_di_IN_EMBUT_SEG_ITENS.AsBoolean then
    begin
      if ( qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString =
           qry_di_.FieldByName('CD_MOEDA_MLE').AsString ) and
         ( qry_di_CD_MOEDA_SEGURO.AsString = '220' ) then
      begin
        dbl_vmle_mneg := dbl_vmle_mneg - qry_di_VL_TOT_SEGURO_MNEG.AsFloat;
      end
      else
      begin
        if qry_di_.FieldByName('TX_DOLAR').AsFloat > 0 then
          dbl_vmle_mneg := dbl_vmle_mneg - ( qry_di_.FieldByName('VL_TOTAL_SEGURO_MN').AsFloat /
                                             qry_di_.FieldByName('TX_DOLAR').AsFloat )
        else
          dbl_vmle_mneg := 0;
      end;
    end;

    dbl_fr_seg_mn := qry_di_Calc_VL_TOT_FRETE_MN.AsFloat +
                     qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat;
    if qry_di_CD_MOEDA_FRETE.AsString = '220' then
    begin
      dbl_fr_seg_mneg := qry_di_VL_TOT_FRT_COLLECT.AsFloat +
                         qry_di_VL_TOT_FRT_PREPAID.AsFloat -
                         qry_di_VL_FRETE_TNAC_MNEG.AsFloat;
      if qry_di_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_VL_TOT_SEGURO_MNEG.AsFloat
      else
      begin
        if qry_di_TX_DOLAR.AsFloat <> 0 then
          dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                             (qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat / qry_di_TX_DOLAR.AsFloat)
      end;
    end
    else
    begin
      if qry_di_TX_DOLAR.AsFloat <> 0 then
         dbl_fr_seg_mneg := (qry_di_Calc_VL_TOT_FRETE_MN.AsFloat / qry_di_TX_DOLAR.AsFloat)
      else
         dbl_fr_seg_mneg := 0;
      if qry_di_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_VL_TOT_SEGURO_MNEG.AsFloat
      else
      begin
        if qry_di_TX_DOLAR.AsFloat <> 0 then
        begin
          dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                            (qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat / qry_di_TX_DOLAR.AsFloat);
        end;
      end;
    end;

    dbl_cif_mn   := dbl_vmle_mn   + dbl_fr_seg_mn;
    dbl_cif_mneg := dbl_vmle_mneg + dbl_fr_seg_mneg ;//+ (qry_acrescimo_valoracao_VL_ACRESCIMO_MN.AsFloat / qry_adicao_importacao_TX_DOLAR.AsFloat );

  end;
  {str_hist_vmle   := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg ) +
                     '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn ); }

  str_hist_vmle_moeda := '    ' +FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg );
  str_hist_vmle       := 'R$  ' + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn );

  str_hist_fr_seg     := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mneg ) +
                         '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mn );
  str_hist_cif        := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mneg ) +
                         '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mn );
  Atualiza_Historico_Padrao_novo;
end;

procedure Tfrm_DI_capa.tbsht_informacoes_complementaresExit(Sender: TObject);
begin
  Atualiza_Historico_Padrao_novo;
end;

procedure Tfrm_DI_capa.btn_co_urf_despacho2Click(Sender: TObject);
begin
  Consulta_On_line( 'TURF', datm_DI_capa.qry_di_CD_URF_DESPACHO, 'Unidade da Receita Federal', 1 );
  dbedt_cd_urf_despacho1Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_urf_despacho3Click(Sender: TObject);
begin
  Consulta_On_line( 'TURF', datm_DI_capa.qry_di_CD_URF_DESPACHO, 'Unidade da Receita Federal', 1 );
  dbedt_cd_urf_despacho1Exit(nil);
end;

procedure Tfrm_DI_Capa.GuardaTaxaCambial;
var str_cd_moeda : String;
    i :Integer;
begin
  with datm_DI_Capa do
  begin
    for i := 1 to 4 do
    begin
      aMoedas[i] := '';
      aTaxas[i]  := 0;
    end;

    for i := 1 to 10 do
    begin
      str_hist_taxa[i] := '';
    end;
    str_cd_moeda := '(220)';

    aMoedas[1] := '220';
    aTaxas[1]  := qry_di_TX_DOLAR.AsFloat;

    str_hist_taxa[1] := FFloatToMsk ( '#,###,##0.0000000', qry_di_TX_DOLAR.AsFloat ) + '(220)';
    
    i := (Pos(qry_di_CD_MOEDA_MLE.AsString, str_cd_moeda)+3) div 5;
    if qry_di_CD_MOEDA_MLE.AsString <> '' then
    begin
      aMoedas[2] := qry_di_CD_MOEDA_MLE.AsString;
      aTaxas[2]  := qry_di_TX_MLE.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_TX_MLE.AsFloat ) + '(' + qry_di_CD_MOEDA_MLE.AsString + ') VMLE';
        str_cd_moeda := str_cd_moeda + '(' + qry_di_CD_MOEDA_MLE.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' VMLE';
    end;
    i := (Pos(qry_di_CD_MOEDA_FRETE.AsString, str_cd_moeda)+3) div 5;
    if qry_di_CD_MOEDA_FRETE.AsString <> '' then
    begin
      aMoedas[3] := qry_di_CD_MOEDA_FRETE.AsString;
      aTaxas[3]  := qry_di_TX_FRETE.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_TX_FRETE.AsFloat ) + '(' + qry_di_CD_MOEDA_FRETE.AsString + ') FRETE';
        str_cd_moeda := str_cd_moeda + '(' + qry_di_CD_MOEDA_FRETE.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' FRETE';
    end;
    i := (Pos(qry_di_CD_MOEDA_SEGURO.AsString, str_cd_moeda)+3) div 5;
    if qry_di_CD_MOEDA_SEGURO.AsString <> '' then
    begin
      aMoedas[4] := qry_di_CD_MOEDA_SEGURO.AsString;
      aTaxas[4]  := qry_di_TX_SEGURO.AsFloat;
      if i = 0 then
      begin
        str_hist_taxa[((Length(str_cd_moeda) div 5)+1)] := FFloatToMsk ( '#,###,##0.0000000', qry_di_TX_MLE.AsFloat ) + '(' + qry_di_CD_MOEDA_SEGURO.AsString + ') SEGURO';
        str_cd_moeda := str_cd_moeda + '(' + qry_di_CD_MOEDA_SEGURO.AsString + ')';
      end
      else
        str_hist_taxa[i] := str_hist_taxa[i] + ' SEGURO';
    end;
    if not qry_di_IN_MOEDA_UNICA.AsBoolean then
    begin
      qry_adicao_taxa_.Close;
      qry_adicao_taxa_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_adicao_taxa_.Prepare;
      qry_adicao_taxa_.Open;
      while not qry_adicao_taxa_.EOF do
      begin
        i := ( Pos( qry_adicao_taxa_CD_MOEDA_MLE.AsString, str_cd_moeda ) + 3 ) div 5;
        if ( qry_adicao_taxa_CD_MOEDA_MLE.AsString <> '' ) then
        begin
          if i = 0 then
          begin
            if ( ( ( Length( str_cd_moeda ) div 5 ) + 1 ) < 10 ) then
            begin
              str_hist_taxa[ ( ( Length( str_cd_moeda ) div 5 ) + 1 ) ] := FFloatToMsk ( '#,###,##0.0000000', qry_adicao_taxa_TX_MLE.AsFloat ) + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')  VMLE';
              str_cd_moeda := str_cd_moeda + '(' + qry_adicao_taxa_CD_MOEDA_MLE.AsString + ')';
            end;
          end
          else
          begin
            if Pos( 'VMLE', str_hist_taxa[i] ) = 0 then
              str_hist_taxa[i] := str_hist_taxa[i] + ' VMLE';
          end;
        end;
        qry_adicao_taxa_.Next;
      end;
      qry_adicao_taxa_.Close;
    end;
  end;
end;

procedure Tfrm_DI_capa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_DI_capa.dbedt_cd_tipo_declaracao2Enter(Sender: TObject);
begin
  if Trim( dbedt_cd_tipo_declaracao2.Text ) <> '' then
    i_cd_tipo_di := StrToInt( Trim( dbedt_cd_tipo_declaracao2.Text) );
end;

procedure Tfrm_DI_capa.rbtn_termo_entrada1DblClick(Sender: TObject);
begin
  if rbtn_termo_entrada1.Checked then
  begin
    rbtn_termo_entrada1.Checked                    := False;
    lbl_identificacao1.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao1, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_BL1Click(Sender: TObject);
begin
  if ( Not in_abrindo_via ) then Write_CD_VIA_TRANSPORTE;
end;

procedure Tfrm_DI_capa.LimpaConhecimento;
begin
  with datm_DI_capa do
  begin
    qry_di_CD_TIPO_DCTO_CARGA.AsString := '';
    qry_di_NR_DCTO_CARGA.AsString      := '';
    qry_di_NR_DCTO_CARGA_MAST.AsString := '';
    qry_di_CD_LOCAL_EMBARQUE.AsString  := '';
    qry_di_DT_EMBARQUE.AsVariant       := NULL;
  end;
end;

procedure Tfrm_DI_capa.rbtn_RWBDblClick(Sender: TObject);
begin
  if rbtn_RWB.Checked then
  begin
    rbtn_RWB.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_House_RWBDblClick(Sender: TObject);
begin
  if rbtn_House_RWB.Checked then
  begin
    rbtn_House_RWB.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_Tif_DTADblClick(Sender: TObject);
begin
  if rbtn_Tif_DTA.Checked then
  begin
    rbtn_Tif_DTA.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_BL1DblClick(Sender: TObject);
begin
  if rbtn_BL1.Checked then
  begin
    rbtn_BL1.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end
end;

procedure Tfrm_DI_capa.rbtn_House_BL1DblClick(Sender: TObject);
begin
  if rbtn_House_BL1.Checked then
  begin
    rbtn_House_BL1.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_BL2DblClick(Sender: TObject);
begin
  if rbtn_BL2.Checked then
  begin
    rbtn_BL2.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_House_BL2DblClick(Sender: TObject);
begin
  if rbtn_House_BL2.Checked then
  begin
    rbtn_House_BL2.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_BL3DblClick(Sender: TObject);
begin
  if rbtn_BL3.Checked then
  begin
    rbtn_BL3.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_House_BL3DblClick(Sender: TObject);
begin
  if rbtn_House_BL3.Checked then
  begin
    rbtn_House_BL3.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_AWBDblClick(Sender: TObject);
begin
  if rbtn_AWB.Checked then
  begin
    rbtn_AWB.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_House_AWBDblClick(Sender: TObject);
begin
  if rbtn_House_AWB.Checked then
  begin
    rbtn_House_AWB.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_DSICDblClick(Sender: TObject);
begin
  if rbtn_DSIC.Checked then
  begin
    rbtn_DSIC.Checked := False;
    Write_CD_VIA_TRANSPORTE;
  end;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga2DblClick(Sender: TObject);
begin
  if rbtn_manifesto_carga2.Checked then
  begin
    rbtn_manifesto_carga2.Checked                  := False;
    lbl_identificacao2.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao2, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_dta2DblClick(Sender: TObject);
begin
  if rbtn_dta2.Checked then
  begin
    rbtn_dta2.Checked                              := False;
    lbl_identificacao2.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao2, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga2Click(Sender: TObject);
begin
  if ( Not in_abrindo_via ) then Write_CD_VIA_TRANSPORTE;
end;

procedure Tfrm_DI_capa.LimpaChecks;
begin
  rbtn_BL1.Checked              := False;
  rbtn_BL2.Checked              := False;
  rbtn_BL3.Checked              := False;

  rbtn_House_BL1.Checked        := False;
  rbtn_House_BL2.Checked        := False;
  rbtn_House_BL3.Checked        := False;
  rbtn_House_AWB.Checked        := False;
  rbtn_House_RWB.Checked        := False;

  rbtn_dta1.Checked             := False;
  rbtn_dta2.Checked             := False;
  rbtn_dta3.Checked             := False;
  rbtn_dta4.Checked             := False;
  rbtn_dta6.Checked             := False;
  rbtn_dta7.Checked             := False;

  rbtn_manifesto_carga2.Checked := False;
  rbtn_manifesto_carga3.Checked := False;
  rbtn_manifesto_carga4.Checked := False;
  rbtn_manifesto_carga6.Checked := False;
  rbtn_manifesto_carga7.Checked := False;
  rbtn_termo_entrada1.Checked   := False;

  rbtn_AWB.Checked              := False;
  rbtn_RWB.Checked              := False;
  rbtn_DSIC.Checked             := False;

  rbtn_Tif_DTA.Checked          := False;
  rbtn_MIC_DTA3.Checked         := False;
end;

procedure Tfrm_DI_capa.rbtn_dta6DblClick(Sender: TObject);
begin
  if rbtn_dta6.Checked then
  begin
    rbtn_dta6.Checked                              := False;
    lbl_identificacao6.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao6, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_dta7DblClick(Sender: TObject);
begin
  if rbtn_dta7.Checked then
  begin
    rbtn_dta7.Checked                              := False;
    lbl_identificacao7.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao7, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_dta1DblClick(Sender: TObject);
begin
  if rbtn_dta1.Checked then
  begin
    rbtn_dta1.Checked                              := False;
    lbl_identificacao1.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao1, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_manifesto_carga3DblClick(Sender: TObject);
begin
  if rbtn_manifesto_carga3.Checked then
  begin
    rbtn_manifesto_carga3.Checked                  := False;
    lbl_identificacao3.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao3, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_dta3DblClick(Sender: TObject);
begin
  if rbtn_dta3.Checked then
  begin
    rbtn_dta3.Checked                              := False;
    lbl_identificacao3.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao3, False);
  end;
end;

procedure Tfrm_DI_capa.rbtn_MIC_DTA3DblClick(Sender: TObject);
begin
  if rbtn_MIC_DTA3.Checked then
  begin
    rbtn_MIC_DTA3.Checked                          := False;
    lbl_identificacao3.Enabled                     := False;
    datm_DI_capa.qry_di_NR_MANIFESTO.AsString      := '';
    datm_DI_capa.qry_di_CD_TIPO_MANIFESTO.AsString := '';
    HabDes( dbedt_identificacao3, False);
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_COBERTURA_CAMBIAL;
begin
  if Not datm_DI_Capa.qry_di_CD_COBERTURA_CAMBIAL.IsNull then
  begin
    case datm_DI_Capa.qry_di_CD_COBERTURA_CAMBIAL.AsInteger of
      1, 2:
      begin
        lbl_cd_mot_sem_cob.Visible     := False;
        dbedt_cd_mot_sem_cob.Visible   := False;
        DBEdit74.Visible               := False;
        btn_co_motivo_sem_cob1.Visible := False;

        dbedt_nr_rof.Visible := False;
        lbl_nr_rof.Visible   := False;

        lbl_cd_mod_pagto_2.Visible   := True;
        dbedt_cd_mod_pagto_2.Visible := True;
        dbedt_nm_mod_pagto2.Visible  := True;
        btn_co_mod_pagto1.Visible    := True;

        HabilitaContratoCambio;
        HabilitaAgente;
      end;
      3:
      begin
        lbl_cd_mot_sem_cob.Visible     := False;
        dbedt_cd_mot_sem_cob.Visible   := False;
        DBEdit74.Visible               := False;
        btn_co_motivo_sem_cob1.Visible := False;

        dbedt_nr_rof.Visible := True;
        lbl_nr_rof.Visible   := True;

        lbl_cd_mod_pagto_2.Visible   := False;
        dbedt_cd_mod_pagto_2.Visible := False;
        dbedt_nm_mod_pagto2.Visible  := False;
        btn_co_mod_pagto1.Visible    := False;

        HabilitaContratoCambio;
        HabilitaAgente;
      end;
      4:
      begin
       lbl_cd_mot_sem_cob.Visible     := True;
       dbedt_cd_mot_sem_cob.Visible   := True;
       DBEdit74.Visible               := True;
       btn_co_motivo_sem_cob1.Visible := True;
       ReadUpdateWindow_CD_MOT_SEM_COB;

       if dbedt_cd_mot_sem_cob.Text = '32' then
       begin
         HabilitaContratoCambio;
         lbl_cd_mod_pagto_2.Visible   := True;
         dbedt_cd_mod_pagto_2.Visible := True;
         dbedt_nm_mod_pagto2.Visible  := True;
         btn_co_mod_pagto1.Visible    := True;
         HabilitaAgente;
       end
       else
       begin
         DesabilitaContratoCambio;
         lbl_cd_mod_pagto_2.Visible   := False;
         dbedt_cd_mod_pagto_2.Visible := False;
         dbedt_nm_mod_pagto2.Visible  := False;
         btn_co_mod_pagto1.Visible    := False;
         DesabilitaAgente;
       end;
     end;
    end;
  end;
end;

procedure Tfrm_DI_capa.Write_Carga2;
var
  nBase_Calc : Double;
  n1, n2, n3, n4 : Double;
  vl_seguro_mn, vl_seguro_mneg: Double;
  cd_tipo_seguro: String;
  I: Integer;
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
     Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then Exit;

  if ( datm_DI_capa.qry_di_PC_SEGURO_MLE.AsFloat > 0 ) then
  begin
    dbedt_vl_moeda_seguro1.ReadOnly := True;
    dbedt_vl_moeda_seguro1.Color    := clMenu;
    dbedt_vl_moeda_seguro1.TabStop  := False;

    cd_tipo_seguro := '';
    for I := 0 to dbrdg_tipo_seguro.ControlCount - 1 do
      if (dbrdg_tipo_seguro.Controls[I] is TRadioButton) and TRadioButton(dbrdg_tipo_seguro.Controls[I]).Checked then
      begin
        cd_tipo_seguro := dbrdg_tipo_seguro.Properties.Items[I].Value;
        Break;
      end;

    if (cd_tipo_seguro = '3') then
    begin
      if not in_calculo then
      begin
        datm_DI_Capa.qry_di_VL_TOTAL_SEGURO_MN.AsFloat := 0;
        datm_DI_Capa.qry_di_VL_TOTAL_SEG_MN.AsFloat    := 0;
        datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat := 0;
      end;
    end
    else
    begin
      vl_seguro_mn   := datm_DI_Capa.qry_di_VL_TOTAL_SEGURO_MN.AsFloat;
      vl_seguro_mneg := datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat;
      if datm_DI_Capa.SP_CALCULO_SEGURO.Active then
        datm_DI_Capa.SP_CALCULO_SEGURO.Close;

      datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@NR_PROCESSO').AsString         := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
      datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MN').AsFloat         := vl_seguro_mn;
      datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MNEG').AsFloat       := vl_seguro_mneg;
      datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@CD_TIPO_BASE_SEGURO').AsString := cd_tipo_seguro;
      datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@PC_SEGURO_MLE').AsFloat        := datm_DI_Capa.qry_di_PC_SEGURO_MLE.AsFloat;
      datm_DI_Capa.SP_CALCULO_SEGURO.ExecProc;

      if datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MN').AsFloat <> vl_seguro_mn then
      begin
        datm_DI_Capa.qry_di_VL_TOTAL_SEGURO_MN.AsFloat := datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MN').AsFloat;
        datm_DI_Capa.qry_di_VL_TOTAL_SEG_MN.AsFloat    := datm_DI_Capa.qry_di_VL_TOTAL_SEGURO_MN.AsFloat;
      end;
      if datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MNEG').AsFloat <> vl_seguro_mneg then
        datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat := datm_DI_Capa.SP_CALCULO_SEGURO.ParamByName('@VL_SEGURO_MNEG').AsFloat;
    end;
  end
  else
  begin
    dbedt_vl_moeda_seguro1.ReadOnly   := False;
    dbedt_vl_moeda_seguro1.color      := clWindow;
    dbedt_vl_moeda_seguro1.TabStop    := True;
  end;

  btn_co_moeda_mle1.Enabled           := dbchkbox_mesma_moeda1.Checked;
  dbedt_cd_moeda_mle1.Enabled         := dbchkbox_mesma_moeda1.Checked;

  lbl_moeda_mle1.Enabled              := dbchkbox_mesma_moeda1.Checked;
  lbl_vl_moeda_mle1.Enabled           := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_mle1.Enabled         := dbchkbox_mesma_moeda1.Checked;

  dbedt_vl_moeda_mle1.Tabstop         := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_mle1.ReadOnly        := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_mle1.Tabstop          := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_mle1.ReadOnly         := dbchkbox_mesma_moeda1.Checked;

  lbl_vl_moeda_despesa.Enabled        := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_despesa.Enabled      := dbchkbox_mesma_moeda1.Checked;

  dbedt_vl_moeda_despesa.Tabstop      := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_despesa.ReadOnly     := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_despesa.Tabstop       := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_despesa.ReadOnly      := dbchkbox_mesma_moeda1.Checked;

  if dbchkbox_mesma_moeda1.Checked then
  begin
    dbedt_vl_moeda_mle1.Color         := clWindow;
    dbedt_vl_real_mle1.DataField      := 'Calc_VL_TOT_MLE_MN';
    dbedt_vl_real_mle1.Color          := clMenu;

    dbedt_vl_moeda_despesa.Color      := clWindow;
    dbedt_vl_real_despesa.DataField   := 'Calc_VL_TOT_DESPESA_MN';
    dbedt_vl_real_despesa.Color       := clMenu;
  end
  else
  begin
    dbedt_vl_moeda_mle1.Color                   := clMenu;
    dbedt_vl_real_mle1.DataField                := 'VL_TOTAL_MLE_MN';
    dbedt_vl_real_mle1.Color                    := clWindow;
    datm_DI_capa.qry_di_VL_TOT_MLE_MNEG.AsFloat := 0;
    datm_DI_capa.qry_di_CD_MOEDA_MLE.Clear;

    dbedt_vl_moeda_despesa.Color                  := clMenu;
    dbedt_vl_real_despesa.DataField               := 'VL_TOT_DESPS_MN';
    dbedt_vl_real_despesa.Color                   := clWindow;
    datm_DI_capa.qry_di_VL_TOT_DESPS_MNEG.AsFloat := 0;
  end;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_Carga2;
begin
  btn_co_moeda_mle1.Enabled       := dbchkbox_mesma_moeda1.Checked;
  dbedt_cd_moeda_mle1.Enabled     := dbchkbox_mesma_moeda1.Checked;

  lbl_moeda_mle1.Enabled          := dbchkbox_mesma_moeda1.Checked;
  lbl_vl_moeda_mle1.Enabled       := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_mle1.Enabled     := dbchkbox_mesma_moeda1.Checked;

  dbedt_vl_moeda_mle1.Tabstop     := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_mle1.ReadOnly    := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_mle1.Tabstop      := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_mle1.ReadOnly     := dbchkbox_mesma_moeda1.Checked;

  lbl_vl_moeda_despesa.Enabled    := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_despesa.Enabled  := dbchkbox_mesma_moeda1.Checked;

  dbedt_vl_moeda_despesa.Tabstop  := dbchkbox_mesma_moeda1.Checked;
  dbedt_vl_moeda_despesa.ReadOnly := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_despesa.Tabstop   := Not ( dbchkbox_mesma_moeda1.Checked );
  dbedt_vl_real_despesa.ReadOnly  := dbchkbox_mesma_moeda1.Checked;

  if dbchkbox_mesma_moeda1.Checked then
  begin
    dbedt_vl_moeda_mle1.Color      := clWindow;
    dbedt_vl_real_mle1.DataField   := 'Calc_VL_TOT_MLE_MN';
    dbedt_vl_real_mle1.Color       := clMenu;

    dbedt_vl_moeda_despesa.Color      := clWindow;
    dbedt_vl_real_despesa.DataField   := 'Calc_VL_TOT_DESPESA_MN';
    dbedt_vl_real_despesa.Color       := clMenu;
  end
  else
  begin
    dbedt_vl_moeda_mle1.Color                   := clMenu;
    dbedt_vl_real_mle1.DataField                := 'VL_TOTAL_MLE_MN';
    dbedt_vl_real_mle1.Color                    := clWindow;

    dbedt_vl_moeda_despesa.Color                := clMenu;
    dbedt_vl_real_despesa.DataField             := 'VL_TOT_DESPS_MN';
    dbedt_vl_real_despesa.Color                 := clWindow;
  end;

  if ( datm_DI_capa.qry_di_PC_SEGURO_MLE.AsFloat > 0 ) then
  begin
    dbedt_vl_moeda_seguro1.ReadOnly := True;
    dbedt_vl_moeda_seguro1.color    := clMenu;
    dbedt_vl_moeda_seguro1.TabStop  := False;
  end
  else
  begin
    dbedt_vl_moeda_seguro1.ReadOnly := False;
    dbedt_vl_moeda_seguro1.color    := clWindow;
    dbedt_vl_moeda_seguro1.TabStop  := True;
  end;

//  if datm_DI_Capa.qry_di_CD_VIA_TRANSP_CARG.AsString = '01' then
//    dbchkbox_REB.Visible := True
//  else
//    dbchkbox_REB.Visible := False;
end;

procedure Tfrm_DI_capa.dbchkbox_op_fundap1Click(Sender: TObject);
begin
  Write_IN_OPERACAO_FUNDAP;
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_CD_MOT_SEM_COB;
begin
  if At( dbedt_cd_mot_sem_cob.Text, '31-39-40-41-42-43-44-45-46-47-48-50-51-52-54-55-56-58-67-71-99' ) then
  begin
    dbedt_nr_rof.Visible                             := False;
    lbl_nr_rof.Visible                               := False;
    lbl_cd_mod_pagto_2.Visible                       := False;
    dbedt_cd_mod_pagto_2.Visible                     := False;
    dbedt_nm_mod_pagto2.Visible                      := False;
    btn_co_mod_pagto1.Visible                        := False;

    DesabilitaContratoCambio;
    DesabilitaAgente;
    Exit;
  end;

  if At( dbedt_cd_mot_sem_cob.Text, '30-57-66-70' ) then
  begin
    dbedt_nr_rof.Visible         := True;
    lbl_nr_rof.Visible           := True;

    lbl_cd_mod_pagto_2.Visible   := False;
    dbedt_cd_mod_pagto_2.Visible := False;
    dbedt_nm_mod_pagto2.Visible  := False;
    btn_co_mod_pagto1.Visible    := False;

    DesabilitaContratoCambio;
    DesabilitaAgente;
    Exit;
  end;

  if dbedt_cd_mot_sem_cob.Text = '32' then
  begin
    dbedt_nr_rof.Visible := False;
    lbl_nr_rof.Visible   := False;

    lbl_cd_mod_pagto_2.Visible   := True;
    dbedt_cd_mod_pagto_2.Visible := True;
    dbedt_nm_mod_pagto2.Visible  := True;
    btn_co_mod_pagto1.Visible    := True;

    HabilitaContratoCambio;
    HabilitaAgente;
    Exit;
  end;
end;

procedure Tfrm_DI_capa.Write_CD_MOT_SEM_COB;
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;
  if Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) then datm_DI_Capa.qry_di_.Edit;

  if At( dbedt_cd_mot_sem_cob.Text, '31-39-40-41-42-43-44-45-46-47-48-50-51-52-54-55-56-58-67-71-99' ) then
  begin
    dbedt_nr_rof.Visible                             := False;
    lbl_nr_rof.Visible                               := False;
    datm_DI_Capa.qry_di_NR_ROF.AsString              := '';

    lbl_cd_mod_pagto_2.Visible                       := False;
    dbedt_cd_mod_pagto_2.Visible                     := False;
    dbedt_nm_mod_pagto2.Visible                      := False;
    btn_co_mod_pagto1.Visible                        := False;
    datm_DI_Capa.qry_di_CD_MODALIDADE_PAGTO.AsString := '';

    DesabilitaContratoCambio;
    DesabilitaAgente;
    Exit;
  end;

  if At( dbedt_cd_mot_sem_cob.Text, '30-57-66-70' ) then
  begin
    dbedt_nr_rof.Visible         := True;
    lbl_nr_rof.Visible           := True;

    lbl_cd_mod_pagto_2.Visible   := False;
    dbedt_cd_mod_pagto_2.Visible := False;
    dbedt_nm_mod_pagto2.Visible  := False;
    btn_co_mod_pagto1.Visible    := False;
    datm_DI_Capa.qry_di_CD_MODALIDADE_PAGTO.AsString := '';

    DesabilitaContratoCambio;
    DesabilitaAgente;
    Exit;
  end;

  if dbedt_cd_mot_sem_cob.Text = '32' then
  begin
    dbedt_nr_rof.Visible := False;
    lbl_nr_rof.Visible   := False;
    datm_DI_Capa.qry_di_NR_ROF.AsString := '';

    lbl_cd_mod_pagto_2.Visible   := True;
    dbedt_cd_mod_pagto_2.Visible := True;
    dbedt_nm_mod_pagto2.Visible  := True;
    btn_co_mod_pagto1.Visible    := True;

    HabilitaContratoCambio;
    HabilitaAgente;
    Exit;
  end;
end;

function Tfrm_DI_capa.Busca_amz_atracacao( nr_proc: String ): String;
var qry: TQuery;
begin
  qry := TQuery.Create( frm_DI_capa );
  with qry do
  begin
    Close;
    SQL.Clear;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_ARMAZEM_ATRACACAO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ str_nr_processo + '"');
    Open;
    Result := FieldByname('CD_ARMAZEM_ATRACACAO').AsString;
    Close;
    Free;
  end;
end;

function Tfrm_DI_capa.Busca_amz_descarga( nr_proc: String ): String;
var qry: TQuery;
begin
  qry := TQuery.Create( frm_DI_capa );
  with qry do
  begin
    Close;
    SQL.Clear;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_ARMAZEM_DESCARGA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ str_nr_processo + '"');
    Open;
    Result := FieldByname('CD_ARMAZEM_DESCARGA').asString;
    Close;
    Free;
  end;
end;

procedure Tfrm_DI_capa.Grava(Sender : TObject);
begin
  try
    if PodeFocar(pgctrl_capa_di) then
      pgctrl_capa_di.SetFocus;
    datm_main.db_broker.StartTransaction;
    with datm_DI_Capa do
    begin
      if tbl_di_armazem_.State        in [dsEdit,dsInsert] then tbl_di_armazem_.Post;
      if tbl_di_volumes_.State        in [dsEdit,dsInsert] then tbl_di_volumes_.Post;
      if tbl_di_DARF_.State           in [dsEdit,dsInsert] then tbl_di_DARF_.Post;
      if tbl_di_comp_trib_.State      in [dsEdit,dsInsert] then tbl_di_comp_trib_.Post;
      if tbl_di_proc_vinc_.State      in [dsEdit,dsInsert] then tbl_di_proc_vinc_.Post;
      if tbl_di_doc_instr_emb_.State  in [dsEdit,dsInsert] then tbl_di_doc_instr_emb_.Post;
      if qry_pagto_cambio_prev_.State in [dsEdit,dsInsert] then qry_pagto_cambio_prev_.Post;

      if (qry_di_.State in [dsEdit,dsInsert]) then
      begin
        Write_CD_MOT_SEM_COB;
        Write_IN_OPERACAO_FUNDAP;
        Write_CONTRATANTE_CAMBIO;
        Write_CD_TIPO_IMPORTADOR;
        Write_CD_MODALIDADE_DESP;
        Write_CD_VIA_TRANSPORTE;
        Write_Carga2;

        if dbchkbox_mesma_moeda1.Checked then
        begin
          qry_di_VL_TOTAL_MLE_MN.AsFloat    := qry_di_Calc_VL_TOT_MLE_MN.AsFloat;
          qry_di_VL_TOT_DESPS_MN.AsFloat    := qry_di_Calc_VL_TOT_DESPESA_MN.AsFloat;
        end;
        qry_di_VL_TOTAL_FRETE_MN.AsFloat    := qry_di_Calc_VL_TOT_FRETE_MN.AsFloat;
        qry_di_VL_TOTAL_SEG_MN.AsFloat      := qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat;

        TrocaNullToZero;
        qry_di_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );

        Valores;
        GuardaTaxaCambial;
        Atualiza_Historico_Padrao_novo;

        qry_di_.Post;

        // Ficava no exit dos campos dt_embarque, mas em alguns casos gerava data em branco e gerava update toda vez que saia do campo - Michel - 23/06/2009
        if Trim(qry_di_DT_EMBARQUE.AsString) <> '' then
          FastExecSQL(' UPDATE TPROCESSO ' +
                      ' SET DT_CONHECIMENTO = CONVERT( datetime, SUBSTRING( ''' + qry_di_DT_EMBARQUE.AsString + ''' , 1, 2 ) + ''/'' ' +
                          ' + SUBSTRING(''' + qry_di_DT_EMBARQUE.AsString + ''' , 3, 2 ) + ''/'' +  SUBSTRING( ''' + qry_di_DT_EMBARQUE.AsString + ''', 5, 4 ), 103 ) ' +
                      ' WHERE  NR_PROCESSO = ''' + str_nr_processo + ''' ');

        CloseStoredProc(sp_atz_arm_di);
        sp_atz_arm_di.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        sp_atz_arm_di.ParamByName('@CD_AMZ_ATRACACAO').AsString := Busca_amz_atracacao( str_nr_processo );
        sp_atz_arm_di.ParamByName('@CD_AMZ_DESCARGA').AsString  := Busca_amz_descarga( str_nr_processo );
        ExecStoredProc(sp_atz_arm_di);
        CloseStoredProc(sp_atz_arm_di);

        if in_repassa_dados_adicao then
        begin
          if BoxMensagem('As informações da tela Auxiliar serão repassadas para TODAS as Adições.'+#13#10+
                         'Confirma?', 1) then
          begin
            CloseStoredProc(sp_di_repassa_dados_adicao);
            sp_di_repassa_dados_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
            ExecStoredProc(sp_di_repassa_dados_adicao);
            CloseStoredProc(sp_di_repassa_dados_adicao);
            in_repassa_dados_adicao := False;
          end;
        end;

        if in_repassa_dados_cambio then
        begin
          if BoxMensagem('As informações da tela Câmbio serão repassadas para TODAS as Adições.'+#13#10+
                         'Confirma?', 1) then
          begin
            CloseStoredProc(sp_di_repassa_dados_cambio);
            sp_di_repassa_dados_cambio.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
            ExecStoredProc(sp_di_repassa_dados_cambio);
            CloseStoredProc(sp_di_repassa_dados_cambio);
            in_repassa_dados_cambio := False;
          end;
        end;

        CloseStoredProc(sp_atz_proc);
        sp_atz_proc.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc(sp_atz_proc);
        CloseStoredProc(sp_atz_proc);
      end;
      datm_main.db_broker.Commit;
      datm_DI_Capa.VerificaEstado(False);
      FechaTabelas;
      if datm_DI_Capa.qry_di_NR_DECLARACAO_IMP.AsString <> '' then
      begin
        if frm_DI.in_DI_Retificacao then
        begin
          in_DI_Registrada        := False;
          frm_DI.in_DI_Registrada := False;
        end
        else
        begin
          in_DI_Registrada        := True;
          frm_DI.in_DI_Registrada := True;
        end;
      end;
      qry_di_.Cancel;
      qry_di_.Close;
      in_di_abrindo := True;
      datm_DI_Capa.qry_di_.DisableControls;
      datm_DI_Capa.qry_di_.Close;
      datm_DI_Capa.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_Capa.qry_di_.Prepare;
      datm_DI_Capa.qry_di_.Open;
      datm_DI_Capa.qry_di_.enableControls;

      AbreTabelas;
      datm_DI_Capa.VerificaEstado(False);
      in_di_abrindo    := False;
    end;
  except
    on E: Exception do
    begin
      frm_DI_capa.btn_cancelarClick(nil);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  with frm_DI do
  begin
    mskedt_cd_tipo_declaracao.Text := datm_DI_capa.qry_di_CD_TIPO_DECLARACAO.AsString;
    edt_nm_tipo_declaracao.Text    := datm_DI_capa.qry_di_Look_tipo_declaracao.AsString;
  end;
end;

procedure Tfrm_DI_capa.Cancela(Sender : TObject);
begin
  with datm_DI_Capa do
  begin
    if tbl_di_armazem_.State       in [dsEdit,dsInsert] then tbl_di_armazem_.Cancel;
    if tbl_di_volumes_.State       in [dsEdit,dsInsert] then tbl_di_volumes_.Cancel;
    if tbl_di_DARF_.State          in [dsEdit,dsInsert] then tbl_di_DARF_.Cancel;
    if tbl_di_comp_trib_.State     in [dsEdit,dsInsert] then tbl_di_comp_trib_.Cancel;
    if tbl_di_proc_vinc_.State     in [dsEdit,dsInsert] then tbl_di_proc_vinc_.Cancel;
    if tbl_di_doc_instr_emb_.State in [dsEdit,dsInsert] then tbl_di_doc_instr_emb_.Cancel;

    if qry_di_.State               in [dsEdit,dsInsert] then qry_di_.Cancel;
    MskEdt_cd_banco.Clear;
    MskEdt_cd_agencia.Clear;
    FechaTabelas;
    qry_di_.Close;
    FormShow(Sender);
    datm_DI_Capa.VerificaEstado(False);
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_local_embarque2Exit(Sender: TObject);
begin
  if Not ( ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
           Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) ) then
  begin
    datm_DI_Capa.qry_di_.Edit;
    ValidCodigo( TDbEdit(Sender) );
  end;
end;

procedure Tfrm_DI_capa.btn_co_inst_financClick(Sender: TObject);
begin
  Consulta_On_line( 'TINST_FINANC_INTERNACIONAL', datm_DI_Capa.qry_di_CD_ORGAO_FIN_INTER, 'Instituição Financiadora Internacional', 1 );
  dbedt_cd_inst_financExit(nil);
end;

procedure Tfrm_DI_capa.dbedt_cd_inst_financExit(Sender: TObject);
begin
  with datm_DI_Capa do
  begin
    if Not ( ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
             Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) ) then
    begin
      datm_DI_Capa.qry_di_.Edit;
      ValidCodigo( dbedt_cd_inst_financ );
    end;

    qry_inst_financ_.Close;
    qry_inst_financ_.ParamByName('CODIGO').AsString := dbedt_cd_inst_financ.text;
    qry_inst_financ_.Prepare;
    qry_inst_financ_.Open;
  end;
end;

procedure Tfrm_DI_capa.dbedt_dt_embarque2Exit(Sender: TObject);
begin
  Consiste;
  //if Consiste = True then
  //FastExecSQL('UPDATE TPROCESSO SET DT_CONHECIMENTO = CONVERT( datetime, SUBSTRING( ''' + dbedt_dt_embarque2.text + ''' , 1, 2 ) + ''/'' ' +
  //                                                   ' + SUBSTRING(''' + dbedt_dt_embarque2.text + ''' , 3, 2 ) + ''/'' +  SUBSTRING( ''' + dbedt_dt_embarque2.text + ''', 5, 4 ), 103 )' +
  //                                                   ' WHERE  NR_PROCESSO = ''' + str_nr_processo + ''' ');
end;

procedure Tfrm_DI_capa.pgctrl_capa_diChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( pgctrl_capa_di.ActivePage = tbsht_aux ) or
     ( pgctrl_capa_di.ActivePage = TabSheet2 ) then btn_salvarClick(nil);
  AllowChange := Consiste;
end;

function Tfrm_DI_capa.Consiste:Boolean;
var
  str_date : String[10];
  Foco     : TObject;
  viatransp : string;
begin
  Consiste := True;
  Foco := nil;
  if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_aereo          ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Maritimo       ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Rodoviario     ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Ferroviario    ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Fluvial        ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Lacustre       ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Meios_Proprios ) or
     ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Tubo_Coduto    ) then
  begin
    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_aereo          ) then
    begin
      str_date := dbedt_dt_embarque1.Text;
      Foco     := dbedt_dt_embarque1;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Maritimo       ) then
    begin
      str_date := dbedt_dt_embarque2.Text;
      Foco     := dbedt_dt_embarque2;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Rodoviario     ) then
    begin
      str_date := dbedt_dt_embarque3.Text;
      Foco     := dbedt_dt_embarque3;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Ferroviario    ) then
    begin
      str_date := dbedt_dt_embarque4.Text;
      Foco     := dbedt_dt_embarque4;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Fluvial        ) then
    begin
      str_date := dbedt_dt_embarque6.Text;
      Foco     := dbedt_dt_embarque6;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Lacustre       ) then
    begin
      str_date := dbedt_dt_embarque7.Text;
      Foco     := dbedt_dt_embarque7;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Meios_Proprios ) then
    begin
      str_date := dbedt_dt_embarque8.Text;
      Foco     := dbedt_dt_embarque8;
    end;

    if ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Tubo_Coduto    ) then
    begin
      str_date := dbedt_dt_embarque9.Text;
      Foco     := dbedt_dt_embarque9;
    end;

    if Trim(str_date) <> '' then
    begin
      try
        StrToDate( Copy( str_date, 1, 2 ) + '/' + Copy( str_date, 3, 2 ) + '/' + Copy( str_date, 5, 4 ) );
      except
        on EConvertError do
        begin
          Consiste   := False;
          BoxMensagem('Data de Embarque inválida!',2);
          if Foco = dbedt_dt_embarque1 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_aereo;
            dbedt_dt_embarque1.Clear;
            if PodeFocar(dbedt_dt_embarque1) then
              dbedt_dt_embarque1.SetFocus;
          end;
          if Foco = dbedt_dt_embarque2 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Maritimo;
            dbedt_dt_embarque2.Clear;
            if PodeFocar(dbedt_dt_embarque2) then
              dbedt_dt_embarque2.SetFocus;
          end;
          if Foco = dbedt_dt_embarque3 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Rodoviario;
            dbedt_dt_embarque3.Clear;
            if PodeFocar(dbedt_dt_embarque3) then
              dbedt_dt_embarque3.SetFocus;
          end;
          if Foco = dbedt_dt_embarque4 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Ferroviario;
            dbedt_dt_embarque4.Clear;
            if PodeFocar(dbedt_dt_embarque4) then
              dbedt_dt_embarque4.SetFocus;
          end;
          if Foco = dbedt_dt_embarque6 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Fluvial;
            dbedt_dt_embarque6.Clear;
            if PodeFocar(dbedt_dt_embarque6) then
              dbedt_dt_embarque6.SetFocus;
          end;
          if Foco = dbedt_dt_embarque7 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Lacustre;
            dbedt_dt_embarque7.Clear;
            if PodeFocar(dbedt_dt_embarque7) then
              dbedt_dt_embarque7.SetFocus;
          end;
          if Foco = dbedt_dt_embarque8 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Meios_Proprios;
            dbedt_dt_embarque8.Clear;
            if PodeFocar(dbedt_dt_embarque8) then
              dbedt_dt_embarque8.SetFocus;
          end;
          if Foco = dbedt_dt_embarque9 then
          begin
            pgctrl_capa_di.ActivePage := tbsht_Transporte_Tubo_Coduto;
            dbedt_dt_embarque9.Clear;
            if PodeFocar(dbedt_dt_embarque9) then
              dbedt_dt_embarque9.SetFocus;
          end;
        end;
      end;
    end;
  end
  else
  begin
    if pgctrl_capa_di.ActivePage = tbsht_carga_TD01 then
    begin
      if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page11 then
      begin
        if ( datm_DI_Capa.qry_di_PB_CARGA.asFloat < datm_DI_Capa.qry_di_PL_CARGA.asFloat ) then
        begin
          BoxMensagem('O peso bruto não poderá ser menor que o peso líquido.',2);
          Consiste := false;
          if PodeFocar(dbedt_peso_bruto1) then
            dbedt_peso_bruto1.SetFocus;
        end;
      end
      else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page12 then
      begin
        if ( datm_DI_Capa.qry_di_PB_CARGA.asFloat < datm_DI_Capa.qry_di_PL_CARGA.asFloat ) then
        begin
          BoxMensagem('O peso bruto não poderá ser menor que o peso líquido.',2);
          Consiste := false;
          if PodeFocar(dbedt_peso_bruto2) then
            dbedt_peso_bruto2.SetFocus;
        end;
      end
      else if pgctrl_carga1.ActivePage = tbsht_carga_TD01_Page13 then
      begin
        if ( datm_DI_Capa.qry_di_PB_CARGA.asFloat < datm_DI_Capa.qry_di_PL_CARGA.asFloat ) then
        begin
          BoxMensagem('O peso bruto não poderá ser menor que o peso líquido.',2);
          Consiste := false;
          if PodeFocar(DBEdit36) then
            DBEdit36.SetFocus;
        end;
      end;
    end;
  end;

  if pgctrl_carga1.ActivePage = tbsht_carga_Page2 then
  begin
    with datm_DI_Capa do
    begin
      qry_parametros_.Close;
      qry_parametros_.Prepare;
      qry_parametros_.Open;
      if ( qry_di_PC_SEGURO_MLE.AsFloat > qry_parametros_PC_MAX_SEGURO_DI.AsFloat ) then
      begin
        BoxMensagem( 'O % de Seguro está acima do Valor Máximo permitido.', 2 );
        Consiste := False;
        if PodeFocar(dbedt_pc_seguro) then
          dbedt_pc_seguro.SetFocus;
      end;
    end;
  end;
  //FERNANDA E ERIC 30/12/2011

  viatransp :=  ConsultaLookUPSQL(' SELECT S.CD_VIA_TRANSPORTE ' +
                      ' FROM TPROCESSO P (NOLOCK) ' +
                      ' INNER JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                      ' WHERE NR_PROCESSO = ' + QuotedStr(datm_DI_Capa.qry_di_NR_PROCESSO.AsString),'CD_VIA_TRANSPORTE');


  if (viatransp = '04') and  (AnsiIndexText(datm_DI_Capa.qry_di_CD_INCOTERM.AsString, ['FOB', 'CFR', 'CIF']) >= 0) and
     (pgctrl_capa_di.ActivePage = tbsht_aux) then
  begin
    BoxMensagem('Erro! Os incoterms FOB, CFR ou CIF não podem ser aplicados quando a via de transporte for aérea. Por favor, verificar.', 2);
    Consiste := False;
  end;
end;

procedure Tfrm_DI_capa.EditNR_COMPR_CAMBIOExit(Sender: TObject);
begin
  if (Not CNPJ(EditNR_COMPR_CAMBIO.Text)) and PodeFocar(EditNR_COMPR_CAMBIO) then
    EditNR_COMPR_CAMBIO.SetFocus;
end;

procedure Tfrm_DI_capa.Valores;
var
  complemento : double;
begin
  with datm_DI_Capa do
  begin
    datm_DI_capa.qry_acrescimo_valoracao_.Close;
    datm_DI_capa.qry_acrescimo_valoracao_.ParamByName('NR_PROCESSO').AsString := datm_DI_capa.qry_di_NR_PROCESSO.AsString;
    datm_DI_capa.qry_acrescimo_valoracao_.Prepare;
    datm_DI_capa.qry_acrescimo_valoracao_.Open;

    datm_DI_capa.qry_deducao_valoracao_.Close;
    datm_DI_capa.qry_deducao_valoracao_.ParamByName('NR_PROCESSO').AsString := datm_DI_capa.qry_di_NR_PROCESSO.AsString;
    datm_DI_capa.qry_deducao_valoracao_.Prepare;
    datm_DI_capa.qry_deducao_valoracao_.Open;

    datm_DI_capa.qry_adicao_importacao_.Close;
    datm_DI_capa.qry_adicao_importacao_.ParamByName('NR_PROCESSO').AsString := datm_DI_capa.qry_di_NR_PROCESSO.AsString;
    datm_DI_capa.qry_adicao_importacao_.Prepare;
    datm_DI_capa.qry_adicao_importacao_.Open;

    dbl_vmle_mn      := datm_DI_capa.qry_di_VL_TOTAL_MLE_MN.AsFloat +
                        datm_DI_capa.qry_di_VL_TOT_DESPS_MN.AsFloat;

    if qry_di_CD_MOEDA_MLE.AsString = '220' then
    begin
      dbl_vmle_mneg  := datm_DI_capa.qry_di_VL_TOT_MLE_MNEG.AsFloat +
                        datm_DI_capa.qry_di_VL_TOT_DESPS_MNEG.AsFloat;
    end
    else
    begin
      if qry_di_TX_DOLAR.AsFloat <> 0 then
        dbl_vmle_mneg   := dbl_vmle_mn / qry_di_TX_DOLAR.AsFloat
      else
        dbl_vmle_mneg   := 0
    end;

    // Alexandre
    if datm_DI_Capa.qry_di_IN_EMBUT_FRT_ITENS.AsBoolean then
       dbl_vmle_mn := dbl_vmle_mn - datm_DI_Capa.qry_di_VL_TOTAL_FRETE_MN.AsFloat;
    if datm_DI_Capa.qry_di_IN_EMBUT_SEG_ITENS.AsBoolean then
       dbl_vmle_mn := dbl_vmle_mn - datm_DI_Capa.qry_di_VL_TOTAL_SEG_MN.AsFloat;

    dbl_fr_seg_mn     := qry_di_VL_TOTAL_FRETE_MN.AsFloat +
                         qry_di_VL_TOTAL_SEG_MN.AsFloat;

    if qry_di_CD_MOEDA_FRETE.AsString = '220' then
    begin
      dbl_fr_seg_mneg := qry_di_VL_TOT_FRT_COLLECT.AsFloat +
                         qry_di_VL_TOT_FRT_PREPAID.AsFloat -
                         qry_di_VL_FRETE_TNAC_MNEG.AsFloat;
      if qry_di_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_di_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               (qry_di_VL_TOTAL_SEG_MN.AsFloat / datm_DI_capa.qry_di_TX_DOLAR.AsFloat)
    end
    else
    begin
      if qry_di_TX_DOLAR.AsFloat <> 0 then
         dbl_fr_seg_mneg := (qry_di_VL_TOTAL_FRETE_MN.AsFloat / qry_di_TX_DOLAR.AsFloat)
      else
         dbl_fr_seg_mneg := 0;
      if qry_di_CD_MOEDA_SEGURO.AsString = '220' then
         dbl_fr_seg_mneg := dbl_fr_seg_mneg + qry_di_VL_TOT_SEGURO_MNEG.AsFloat
      else
         if qry_di_TX_DOLAR.AsFloat <> 0 then
            dbl_fr_seg_mneg := dbl_fr_seg_mneg +
                               ( qry_di_VL_TOTAL_SEG_MN.AsFloat / qry_di_TX_DOLAR.AsFloat )
    end;

    if ( qry_di_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
       ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat > 0 ) and
       ( qry_di_.FieldByName('TX_MLE').AsFloat > 0 ) then
    begin
      if ( qry_di_.FieldByName('CD_MOEDA_FRETE').AsString =
           qry_di_.FieldByName('CD_MOEDA_MLE').AsString ) and
         ( qry_di_CD_MOEDA_FRETE.AsString = '220' ) then
      begin
        dbl_vmle_mneg := dbl_vmle_mneg - qry_di_Calc_TOT_FRETE_MNEG.AsFloat;
      end
      else
      begin
        if qry_di_TX_DOLAR.AsFloat > 0 then
          dbl_vmle_mneg := dbl_vmle_mneg - ( qry_di_.FieldByName('VL_TOTAL_FRETE_MN').AsFloat /
                                             qry_di_.FieldByName('TX_DOLAR').AsFloat )
        else
          dbl_vmle_mneg := 0;
      end;
    end;

    if qry_di_.FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean then
    begin
      if ( qry_di_.FieldByName('CD_MOEDA_SEGURO').AsString =
           qry_di_.FieldByName('CD_MOEDA_MLE').AsString ) and
         ( qry_di_CD_MOEDA_SEGURO.AsString = '220' ) then
      begin
        dbl_vmle_mneg := dbl_vmle_mneg - qry_di_VL_TOT_SEGURO_MNEG.AsFloat;
      end
      else
      begin
        if qry_di_CD_MOEDA_MLE.AsString = '220' then
          dbl_vmle_mneg := dbl_vmle_mneg - ( qry_di_.FieldByName('VL_TOTAL_SEG_MN').AsFloat /
                                             qry_di_.FieldByName('TX_DOLAR').AsFloat )
        else
          dbl_vmle_mneg := 0;
      end;
    end;
  end;

  dbl_cif_mn   := dbl_vmle_mn   + dbl_fr_seg_mn;
  dbl_cif_mneg := dbl_vmle_mneg + dbl_fr_seg_mneg;

  // Pega o valor siscomex
  datm_DI_capa.tbl_di_darf_.Open;
  while not (datm_DI_Capa.tbl_di_darf_.EOF) do
  begin
    if datm_DI_Capa.tbl_di_darf_CD_RECEITA_PGTO.Value = '7811' then
      dbl_tx_sicomex :=  datm_DI_Capa.tbl_di_darf_VL_TRIBUTO_PAGO.AsFloat;
      datm_DI_Capa.tbl_di_darf_.Next;
  end;

  if ( datm_DI_capa.qry_adicao_importacao_TX_DOLAR.AsFloat <> 0 ) and (dbl_tx_sicomex <> 0) then
  begin
   str_tx_siscomex :=  'R$  ' + FFloatToMsk ( '#,###,###,##0.00', dbl_tx_sicomex );
  end;

  // Deduções
   dbl_deducao  := datm_DI_capa.qry_deducao_valoracao_VL_TOT_REAL.Value;
   str_vl_deducao := 'R$  ' + FFloatToMsk ( '#,###,###,##0.00', dbl_deducao );

  //Acréscimos
  dbl_acrescimo:= datm_DI_capa.qry_acrescimo_valoracao_TOTAL_VL_ACRESCIMO.Value;
  str_vl_acrescimo    := 'R$  ' + FFloatToMsk ( '#,###,###,##0.00', dbl_acrescimo );

  {str_hist_vmle   := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg ) +
                     '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn  );}
  str_hist_vmle       := 'R$  ' +FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mn );

  str_hist_vmle_moeda := '    ' +FFloatToMsk ( '#,###,###,##0.00', dbl_vmle_mneg );

  str_hist_fr_seg     := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mneg ) +
                         '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_fr_seg_mn );

  complemento := ( datm_DI_capa.qry_acrescimo_valoracao_TOTAL_VL_ACRESCIMO.AsFloat - datm_DI_capa.qry_adicao_importacao_VL_DESPESAS_MN.AsFloat );
  if ( complemento <> 0 ) and ( datm_DI_capa.qry_adicao_importacao_TX_DOLAR.AsFloat <> 0 ) then
  begin
    complemento := ( complemento / datm_DI_capa.qry_adicao_importacao_TX_DOLAR.AsFloat );
  end;
  str_hist_cif  := 'US$ '  + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mneg )//+ complemento )
                    + '  R$ ' + FFloatToMsk ( '#,###,###,##0.00', dbl_cif_mn );
end;

procedure Tfrm_DI_Capa.AtzTaxaCambialDI( Moeda : String; Campo : TFloatField );
var
  i : Integer;
  TaxaOk : Boolean;
begin
  TaxaOk := False;
  for i := 1 to 4 do //Tenta localizar taxa dentre as moedas utilizadas no processo
  begin
    if Moeda = aMoedas[i] then
    begin
      Campo.AsFloat := aTaxas[i];
      TaxaOk := True;
    end;
  end;
  if Not TaxaOk then //Tenta localizar taxa no Histórico de Taxas de Câmbio no dia do Registro da DI
  begin
    with datm_DI_Capa do
    begin
      qry_taxa_cambio_.Close;
      qry_taxa_cambio_.ParamByName('CD_MOEDA').AsString  := Moeda;
      qry_taxa_cambio_.ParamByName('DT_REGISTRO').AsDate :=
         StrToDate( Copy( qry_di_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
                    Copy( qry_di_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
                    Copy( qry_di_DT_REGISTRO_DI.AsString, 5, 4) );
      qry_taxa_cambio_.Prepare;
      qry_taxa_cambio_.Open;
      if qry_taxa_cambio_.RecordCount > 0 then
         Campo.AsFloat := qry_taxa_cambio_TX_CAMBIO.AsFloat
      else
      begin
        Campo.AsFloat := 0;
        BoxMensagem('Taxa de Câmbio para moeda ' + Moeda + ' não cadastrada em ' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 5, 4) + '!', 2);
      end;
      qry_taxa_cambio_.Close;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_motivo_retif1Exit(Sender: TObject);
begin
  //Item
  ValidCodigo( dbedt_cd_motivo_retif1 );
  if dbedt_cd_motivo_retif1.Text <> '' then
  begin
    if dbedt_nm_motivo_retif1.Text = '' then
    begin
      BoxMensagem('Código do Motivo da Retificação inválido!', 2);
      pgctrl_capa_di.ActivePage := tbsht_importador_TD01;
      if PodeFocar(dbedt_cd_motivo_retif1) then
        dbedt_cd_motivo_retif1.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_motivo_retif2Exit(Sender: TObject);
begin
  //Item
  ValidCodigo( dbedt_cd_motivo_retif2 );
  if dbedt_cd_motivo_retif2.Text <> '' then
  begin
    if dbedt_nm_motivo_retif2.Text = '' then
    begin
      BoxMensagem('Código do Motivo da Retificação inválido!', 2);
      pgctrl_capa_di.ActivePage := tbsht_importador_TD05;
      if PodeFocar(dbedt_cd_motivo_retif2) then
        dbedt_cd_motivo_retif2.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_motivo_retif3Exit(Sender: TObject);
begin
  //Item
  ValidCodigo( dbedt_cd_motivo_retif3 );
  if dbedt_cd_motivo_retif3.Text <> '' then
  begin
    if dbedt_nm_motivo_retif3.Text = '' then
    begin
      BoxMensagem('Código do Motivo da Retificação inválido!', 2);
      pgctrl_capa_di.ActivePage := tbsht_importador_TD14;
      if PodeFocar(dbedt_cd_motivo_retif3) then
        dbedt_cd_motivo_retif3.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_motivo_retif4Exit(Sender: TObject);
begin
  //Item
  ValidCodigo( dbedt_cd_motivo_retif4 );
  if dbedt_cd_motivo_retif4.Text <> '' then
  begin
    if dbedt_nm_motivo_retif4.Text = '' then
    begin
      BoxMensagem('Código do Motivo da Retificação inválido!', 2);
      pgctrl_capa_di.ActivePage := tbsht_importador_TD04;
      if PodeFocar(dbedt_cd_motivo_retif4) then
        dbedt_cd_motivo_retif4.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_DI_capa.btn_co_motivo_retif2Click(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOTIVO_RETif',
                datm_DI_Capa.qry_di_CD_MOTIVO_RETif,
                'Motivo da Retificação', 20, '','TTable');
  dbedt_cd_motivo_retif2Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_motivo_retif3Click(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOTIVO_RETif',
                datm_DI_Capa.qry_di_CD_MOTIVO_RETif,
                'Motivo da Retificação', 20, '','TTable');
  dbedt_cd_motivo_retif3Exit(nil);
end;

procedure Tfrm_DI_capa.btn_co_motivo_retif4Click(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOTIVO_RETif',
                datm_DI_Capa.qry_di_CD_MOTIVO_RETif,
                'Motivo da Retificação', 20, '','TTable');
  dbedt_cd_motivo_retif4Exit(nil);
end;

procedure Tfrm_DI_capa.ReadUpdateWindow_Retificacao;
begin
  if frm_DI.in_DI_Retificacao or in_DI_Registrada then
  begin
    if tbsht_importador_TD01.Visible then
    begin
      grpbox_retif1.Visible := True;
      if frm_DI.in_DI_Retificacao then
      begin
        dbedt_cd_motivo_retif1.ReadOnly := False;
        dbedt_cd_motivo_retif1.TabStop  := True;
        dbedt_cd_motivo_retif1.Color    := clWindow;
        btn_co_motivo_retif1.Enabled    := True;
      end
      else
      begin
        dbedt_cd_motivo_retif1.ReadOnly := True;
        dbedt_cd_motivo_retif1.TabStop  := False;
        dbedt_cd_motivo_retif1.Color    := clMenu;
        btn_co_motivo_retif1.Enabled    := False;
      end;
    end;
    if tbsht_importador_TD05.Visible then
    begin
      grpbox_retif2.Visible := True;
      if frm_DI.in_DI_Retificacao then
      begin
        dbedt_cd_motivo_retif2.ReadOnly := False;
        dbedt_cd_motivo_retif2.TabStop  := True;
        dbedt_cd_motivo_retif2.Color    := clWindow;
        btn_co_motivo_retif2.Enabled    := True;
      end
      else
      begin
        dbedt_cd_motivo_retif2.ReadOnly := True;
        dbedt_cd_motivo_retif2.TabStop  := False;
        dbedt_cd_motivo_retif2.Color    := clMenu;
        btn_co_motivo_retif2.Enabled    := False;
      end;
    end;
    if tbsht_importador_TD14.Visible then
    begin
      grpbox_retif3.Visible := True;
      if frm_DI.in_DI_Retificacao then
      begin
        dbedt_cd_motivo_retif3.ReadOnly := False;
        dbedt_cd_motivo_retif3.TabStop  := True;
        dbedt_cd_motivo_retif3.Color    := clWindow;
        btn_co_motivo_retif3.Enabled    := True;
      end
      else
      begin
        dbedt_cd_motivo_retif3.ReadOnly := True;
        dbedt_cd_motivo_retif3.TabStop  := False;
        dbedt_cd_motivo_retif3.Color    := clMenu;
        btn_co_motivo_retif3.Enabled    := False;
      end;
    end;
    if tbsht_importador_TD04.Visible then
    begin
      grpbox_retif4.Visible := True;
      if frm_DI.in_DI_Retificacao then
      begin
        dbedt_cd_motivo_retif4.ReadOnly := False;
        dbedt_cd_motivo_retif4.TabStop  := True;
        dbedt_cd_motivo_retif4.Color    := clWindow;
        btn_co_motivo_retif4.Enabled    := True;
      end
      else
      begin
        dbedt_cd_motivo_retif4.ReadOnly := True;
        dbedt_cd_motivo_retif4.TabStop  := False;
        dbedt_cd_motivo_retif4.Color    := clMenu;
        btn_co_motivo_retif4.Enabled    := False;
      end;
    end;
  end
  else                                                            
  begin
    if tbsht_importador_TD01.Visible then grpbox_retif1.Visible := False;
    if tbsht_importador_TD05.Visible then grpbox_retif2.Visible := False;
    if tbsht_importador_TD14.Visible then grpbox_retif3.Visible := False;
    if tbsht_importador_TD04.Visible then grpbox_retif4.Visible := False;
  end;
end;
procedure Tfrm_DI_capa.btn_co_motivo_retif1Click(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOTIVO_RETIF',
                datm_DI_Capa.qry_di_CD_MOTIVO_RETif,
                'Motivo da Retificação', 20, '','TTable');
  dbedt_cd_motivo_retif1Exit(nil);
end;

procedure Tfrm_DI_capa.dbedt_cd_reg_trib_iiChange(Sender: TObject);
begin
  if Trim( dbedt_cd_reg_trib_ii.Text ) = '1' then
  begin
    dbedt_fund_legal_ii.Enabled := False;
    dbedt_fund_legal_ii.Text    := '';
    DBEdit41.Text               := '';
    DBEdit41.Enabled            := False;
    btn_co_fund_legal1.Enabled  := False;
  end
  else
  begin
    dbedt_fund_legal_ii.Enabled := True;
    DBEdit41.Enabled            := True;
    btn_co_fund_legal1.Enabled  := True;
  end;
  dbedt_cd_incotermChange(nil);
end;

procedure Tfrm_DI_capa.dbedt_cd_reg_trib_iiExit(Sender: TObject);
begin
  if Trim( dbedt_cd_reg_trib_ii.Text ) = '5' then
  dbrg_reg_tributacao.ItemIndex := 1;
  dbrg_reg_tributacao.Enabled := not( (Trim( dbedt_cd_reg_trib_ii.Text ) = '2') or (Trim( dbedt_cd_reg_trib_ii.Text ) = '6'));
  if not dbrg_reg_tributacao.Enabled then
    dbrg_reg_tributacao.ItemIndex := -1;
end;

procedure Tfrm_DI_capa.btn_co_tributacao_icmsClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTRIBUTACAO_ICMS',
                datm_DI_Capa.qry_di_CD_TRIBUTACAO_ICMS,
                'Tributação ICMS', 18, '' ,'TTable');
end;

procedure Tfrm_DI_capa.btn_co_fund_legal_icmsClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTP_EXONERACAO',
                datm_DI_Capa.qry_di_CD_FUND_LEGAL_ICMS,
                'Dispositivo Legal', 31, '','TQuery');
end;

procedure Tfrm_DI_capa.btn_co_reg_trib1Click(Sender: TObject);
begin
  Consulta_On_line( 'TREG_TRIBUTARIO', datm_DI_capa.qry_di_CD_REG_TRIB_II, 'Regime Tributário', 1 );
end;

procedure Tfrm_DI_capa.btn_co_fund_legal1Click(Sender: TObject);
begin
  Consulta_On_line( 'TFUND_LEG_REG_TRIBUT', datm_DI_capa.qry_di_CD_FUND_LEGAL_II, 'Fundamento Legal', 1 );
end;

procedure Tfrm_DI_capa.dbedt_cd_fund_legal_icmsExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_fund_legal_icms );
end;

procedure Tfrm_DI_capa.dbedt_cd_incotermChange(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_IN_REPASSA_DADOS_ADICAO.AsBoolean and
     ( pgctrl_capa_di.ActivePage = tbsht_aux ) then
     in_repassa_dados_adicao := True
  else
     in_repassa_dados_adicao := False;
  case dbrgrp_fabr_expo.ItemIndex of
   0: begin
        dbedt_fabricante.Color := clBtnFace;
        dbedt_fabricante.ReadOnly := true;
        dbedt_fabricante.TabStop := false;
        btn_co_nm_fabric.Enabled := false;
        dbedt_pais_orig.Color := clBtnFace;
        dbedt_pais_orig.ReadOnly := true;
        dbedt_pais_orig.TabStop := false;
        btn_co_pais_orig.Enabled := false;
        if datm_DI_Capa.qry_di_.State in [dsInsert,dsEdit] then
        begin
           datm_DI_Capa.qry_di_CD_FABRICANTE.asString := '';
           datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC.asString := '';
        end;
   end;
   1: begin
        dbedt_fabricante.Color := clWindow;
        dbedt_fabricante.ReadOnly := false;
        dbedt_fabricante.TabStop := true;
        btn_co_nm_fabric.Enabled := true;
        dbedt_pais_orig.Color := clWindow;
        dbedt_pais_orig.ReadOnly := false;
        dbedt_pais_orig.TabStop := true;
        btn_co_pais_orig.Enabled := true;
   end;
   2: begin
        dbedt_fabricante.Color := clBtnFace;
        dbedt_fabricante.ReadOnly := true;
        dbedt_fabricante.TabStop := false;
        btn_co_nm_fabric.Enabled := false;
        dbedt_pais_orig.Color := clWindow;
        dbedt_pais_orig.ReadOnly := false;
        dbedt_pais_orig.TabStop := true;
        btn_co_pais_orig.Enabled := true;
        if datm_DI_Capa.qry_di_.State in [dsInsert,dsEdit] then
        datm_DI_Capa.qry_di_CD_FABRICANTE.asString := '';
   end;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_mot_sem_cobChange(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then
    Exit;
  if ( datm_DI_Capa.qry_di_IN_REPASSA_DADOS_CAMBIO.AsBoolean ) and
     ( pgctrl_capa_di.ActivePage = TabSheet2 ) then
  begin
    in_repassa_dados_cambio := True;
  end
  else
  begin
    in_repassa_dados_cambio := False;
  end;
  if Length(dbedt_nr_Parcelas.text) > 0 then
  begin
     rbtn_ind_per_diaria1.Enabled := true;
     rbtn_ind_per_mensal1.Enabled := true;
  end
  else
  begin
     rbtn_ind_per_diaria1.Enabled := false;
     rbtn_ind_per_mensal1.Enabled := false;
  end;
end;

procedure Tfrm_DI_capa.btn_co_nm_exportClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Capa.qry_di_CD_FORNECEDOR ;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_exportadorExit(nil);
end;

procedure Tfrm_DI_capa.btn_co_nm_fabricClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Capa.qry_di_CD_FABRICANTE ;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_capa.btn_co_pais_origClick(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC ,'Países', 1 );
end;

procedure Tfrm_DI_capa.btn_co_pais_exportClick(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC, 'Países', 1 );
end;

procedure Tfrm_DI_capa.dbedt_fabricanteExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
  begin
    ValidCodigo( dbedt_fabricante );
    datm_DI_Capa.qry_emp_estrangeira_.Close;
    datm_DI_Capa.qry_emp_estrangeira_.ParamByName('CD_EMPRESA').AsString := dbedt_fabricante.Text;
    datm_DI_Capa.qry_emp_estrangeira_.Prepare;
    datm_DI_Capa.qry_emp_estrangeira_.Open;
    if ( datm_DI_Capa.qry_emp_estrangeira_.RecordCount > 0 ) and ( length( datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC.AsString ) = 0 ) then
      datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC.AsString := datm_DI_Capa.qry_emp_estrangeira_.FieldByName('CD_PAIS').AsString;
    datm_DI_Capa.qry_emp_estrangeira_.Close;
    dbedt_pais_origExit(nil);
  end;
end;

procedure Tfrm_DI_capa.dbedt_exportadorExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
  begin
    ValidCodigo( dbedt_exportador );
    datm_DI_Capa.qry_emp_estrangeira_.Close;
    datm_DI_Capa.qry_emp_estrangeira_.ParamByName('CD_EMPRESA').AsString := dbedt_exportador.Text;
    datm_DI_Capa.qry_emp_estrangeira_.Prepare;
    datm_DI_Capa.qry_emp_estrangeira_.Open;
    if ( datm_DI_Capa.qry_emp_estrangeira_.RecordCount > 0 ) then //comentado André 04512/08 08/08/2008 and ( length( datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC.AsString ) = 0 ) then
      datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC.AsString := datm_DI_Capa.qry_emp_estrangeira_.FieldByName('CD_PAIS').AsString
    else
      datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC.AsString := '';
    datm_DI_Capa.qry_emp_estrangeira_.Close;
    dbedt_pais_fornecExit(nil);
  end;
end;

procedure Tfrm_DI_capa.dbedt_pais_origExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
    ValidCodigo( dbedt_pais_orig );
  datm_DI_Capa.qry_emp_estrangeira_.Close;
  datm_DI_Capa.qry_emp_estrangeira_.ParamByName('CD_EMPRESA').AsString := dbedt_fabricante.Text;
  datm_DI_Capa.qry_emp_estrangeira_.Prepare;
  datm_DI_Capa.qry_emp_estrangeira_.Open;
  if ( datm_DI_Capa.qry_emp_estrangeira_.RecordCount > 0 ) and ( length( datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC.AsString ) = 0 ) then
    datm_DI_Capa.qry_di_CD_PAIS_ORIG_MERC.AsString := datm_DI_Capa.qry_emp_estrangeira_.FieldByName('CD_PAIS').AsString;
  datm_DI_Capa.qry_emp_estrangeira_.Close;
end;

procedure Tfrm_DI_capa.dbedt_pais_fornecExit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
    ValidCodigo( dbedt_pais_fornec );
  datm_DI_Capa.qry_emp_estrangeira_.Close;
  datm_DI_Capa.qry_emp_estrangeira_.ParamByName('CD_EMPRESA').AsString := dbedt_exportador.Text;
  datm_DI_Capa.qry_emp_estrangeira_.Prepare;
  datm_DI_Capa.qry_emp_estrangeira_.Open;
  if ( datm_DI_Capa.qry_emp_estrangeira_.RecordCount > 0 ) and ( length( datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC.AsString ) = 0 ) then
    datm_DI_Capa.qry_di_CD_PAIS_AQUIS_MERC.AsString := datm_DI_Capa.qry_emp_estrangeira_.FieldByName('CD_PAIS').AsString;
  datm_DI_Capa.qry_emp_estrangeira_.Close;
end;

procedure Tfrm_DI_capa.btn_ag_transpClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_DI_Capa.qry_di_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_DI_Capa.qry_di_NR_AGENTE_CARGA.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NR_CGC_AGENTE'],['Código','Nome','CGC'],'NR_CGC_AGENTE',frm_main.mi_agentes, 1 ,dbedt_agente_transportador1.text)
  end
  else
    dbedt_nm_agente_transp.Text := ConsultaLookUP('TAGENTE','NR_CGC_AGENTE',dbedt_agente_transportador1.Text,'NM_AGENTE');

{  vStr_cd_modulo := '22';
  str_cd_rotina := '2229';
  Application.CreateForm(Tfrm_ag, frm_ag);
  frm_ag.lDi := True;
  frm_ag.Cons_OnLine := datm_DI_Capa.qry_di_NR_AGENTE_CARGA;
  with frm_ag do
  begin
    lCons_OnLine := True;
    if Not (datm_DI_Capa.qry_di_.State in [dsEdit]) then
      datm_DI_Capa.qry_di_.Edit;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0201';
  dbedt_agente_transportador1Exit(nil);}
end;

procedure Tfrm_DI_capa.dbedt_agente_transpExit(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_calculo ) then Exit;

  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
  if ( dbedt_nm_agente.Text = '') and ( dbedt_agente_transp.text <> '' ) then
  begin
     BoxMensagem('Agente do transportador inválido.', 2);
     dbedt_agente_transp.Text := '';
     if PodeFocar(dbedt_agente_transp) then
       dbedt_agente_transp.SetFocus;
  end;
end;


procedure Tfrm_DI_capa.DBCheckBox3Enter(Sender: TObject);
begin
//  if DBCheckBox3.Checked then BoxMensagem('Checado', 3)
//  else BoxMensagem('Não Checado', 3);
end;

procedure Tfrm_DI_capa.dbchkbox_repasseEnter(Sender: TObject);
begin
//  if dbchkbox_repasse.Checked then BoxMensagem('Câmbio Checado', 3)
//  else BoxMensagem('Câmbio Não Checado', 3);
end;

procedure Tfrm_DI_capa.rbtn_ind_per_diaria1Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_calculo ) then
  begin
    if Not (datm_DI_Capa.qry_di_.State in [dsEdit,dsInsert]) then datm_DI_Capa.qry_di_.Edit;
  end;
  if (datm_DI_Capa.qry_di_.state in [dsEdit,dsInsert]) then
     datm_DI_Capa.qry_di_CD_PERIOD_PGTO_360.AsString := '1';
  dbedt_cd_mot_sem_cobChange( nil );
end;

procedure Tfrm_DI_capa.rbtn_ind_per_mensal1Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_calculo ) then
  begin
    if Not (datm_DI_Capa.qry_di_.State in [dsEdit,dsInsert]) then datm_DI_Capa.qry_di_.Edit;
  end;
  if (datm_DI_Capa.qry_di_.state in [dsEdit,dsInsert]) then
     datm_DI_Capa.qry_di_CD_PERIOD_PGTO_360.AsString := '2';
  dbedt_cd_mot_sem_cobChange( nil );
end;

procedure Tfrm_DI_capa.btn_co_metodo_valoracaoClick(Sender: TObject);
begin
  Consulta_On_line( 'TMETODO_VALOR_ADUANEIRA', datm_DI_Capa.qry_di_CD_METODO_VALORACAO, 'Método de Valoração Aduaneira', 1 );
end;

procedure Tfrm_DI_capa.dbedt_dt_registro_di2Exit(Sender: TObject);
//var dt_registro_di : String[10];
begin
//  with datm_DI_Capa do
//  begin
//    try
//      if Sender = dbedt_dt_registro_di1 then
//        dt_registro_di := dbedt_dt_registro_di1.Text;
//      if Sender = dbedt_dt_registro_di2 then
//        dt_registro_di := dbedt_dt_registro_di2.Text;
//      if Sender = dbedt_dt_registro_di3 then
//        dt_registro_di := dbedt_dt_registro_di3.Text;
//      if Sender = dbedt_dt_registro_di4 then
//        dt_registro_di := dbedt_dt_registro_di4.Text;
//
//      StrToDate( Copy( dt_registro_di, 1, 2 ) + '/' +
//                 Copy( dt_registro_di, 3, 2 ) + '/' +
//                 Copy( dt_registro_di, 5, 4 ) );
//
//      CloseStoredProc(sp_di_distribui_deb_com);
//      sp_di_distribui_deb_com.ParamByName('@nr_processo').AsString := str_nr_processo;
//      ExecStoredProc(sp_di_distribui_deb_com);
//      CloseStoredProc(sp_di_distribui_deb_com);
//
//      //Realizar evento Registro da DI
//      CloseStoredProc(sp_atz_evento);
//      sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_di_NR_PROCESSO.AsString;
//      sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_REG_DI';
//      sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( Copy( dt_registro_di, 1, 2 ) + '/' +
//                                                                           Copy( dt_registro_di, 3, 2 ) + '/' +
//                                                                           Copy( dt_registro_di, 5, 4 ) );
//      ExecStoredProc(sp_atz_evento);
//      CloseStoredProc(sp_atz_evento);
//
//    except
//    end;
//  end;
//  dbedt_cd_importador2Exit(nil);
end;

procedure Tfrm_DI_capa.dbrgrp_parcelasChange(Sender: TObject);
begin

  lbl_total_cambio.Visible := False;
  dbedt_vl_tot_cambio.Visible := False;

  if dbrgrp_parcelas.ItemIndex = 0 then
  begin
    ntbk_cambio.PageIndex := 1;

    if ( Not ( datm_DI_Capa.qry_di_CD_PERIOD_PGTO_360.IsNull ) ) and
       ( datm_DI_Capa.qry_di_CD_PERIOD_PGTO_360.AsString <> '' ) then
    begin
      case datm_DI_Capa.qry_di_CD_PERIOD_PGTO_360.AsInteger of
      1 : begin
            rbtn_ind_per_diaria1.Checked := True;
            rbtn_ind_per_mensal1.Checked := False;
          end;
      2 : begin
            rbtn_ind_per_diaria1.Checked := False;
            rbtn_ind_per_mensal1.Checked := True;
          end;
      end;
    end
    else
    begin
      rbtn_ind_per_diaria1.Checked := False;
      rbtn_ind_per_mensal1.Checked := False;
    end;
    if in_DI_Registrada then
    begin
      rbtn_ind_per_diaria1.Enabled := False;
      rbtn_ind_per_mensal1.Enabled := False;
    end;
  end
  else if dbrgrp_parcelas.ItemIndex = 1 then
    ntbk_cambio.PageIndex := 2;

  if datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] then
  begin
    With datm_DI_Capa do
    begin
      qry_di_CD_FORMA_PAGAMENTO.AsString := '3';
      qry_di_IN_MOEDA_NACIONAL.AsBoolean := False;
      qry_di_NR_CONTRATO_CAMBIO.AsString := '';
      qry_di_NR_BANCO_PAGAMENTO.AsString := '';
      qry_di_NR_PRACA_PAGAMENTO.AsString := '';
      qry_di_NR_COMPRADOR_ME.AsString    := '';
    end;
  end;

end;

procedure Tfrm_DI_capa.DBGrid14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    in_repassa_dados_cambio := True;
    datm_DI_capa.VerificaEstado(True);
    datm_DI_Capa.qry_pagto_cambio_prev_.Delete;
  end;
end;

procedure Tfrm_DI_capa.btn_co_embarcacao2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2225';
  Application.CreateForm(Tfrm_emb, frm_emb);
  with frm_emb do
  begin
    Cons_OnLine := datm_DI_capa.qry_di_CD_VEICULO_TRANSP;
    if Not ( datm_DI_Capa.qry_di_.State in [dsEdit] ) then
       datm_DI_Capa.qry_di_.Edit;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_embarcacao2Exit(nil);
end;

procedure Tfrm_DI_capa.dbedt_cd_embarcacao2Exit(Sender: TObject);
begin
  if datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_embarcacao2 );
  Application.ProcessMessages;
end;

procedure Tfrm_DI_capa.pgctrl_carga1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

{
function Tfrm_DI_capa.HistoricoMP164 : string;
var
  ListaAuxMP164 : TStringList;
  tipo : string;
  aliq_ii, aliq_ipi : string;
  indice : Byte;
  Linha, sSql: String;
  IICalculadoTotal, IIProporcionalTotal, IISuspensoTotal,
  IPICalculadoTotal, IPIProporcionalTotal, IPISuspensoTotal,
  PISCalculadoTotal, PISProporcionalTotal, PISSuspensoTotal,
  COFINSCalculadoTotal, COFINSProporcionalTotal, COFINSSuspensoTotal,
  BaseICMS, ICMSCalculadoTotal, ICMSProporcionalTotal, ICMSSuspensoTotal,
  ValorAduaneiroCalculadoTotal, ValorAduaneiroProporcionalTotal, ValorAduaneiroSuspensoTotal,
  ValorSuspensoAdicao, ValorSuspensoTotal: Double;
begin
  tipo := '0001';
  indice := 68;

  // Repassar os dados dos artigos da MP, das adicoes para informacoes complementares.
  ListaAuxMP164 := TStringList.Create;
  ListaAuxMP164.Clear;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    sSql :=
       'SELECT A.NR_PROCESSO,                                                        '+ slinebreak +
       '       A.CD_REGIME_TRIBUTAR,                                                 '+ slinebreak +
       '       A.CD_FUND_LEG_REGIME,                                                 '+ slinebreak +
       '       A.CD_MERCADORIA_NCM,                                                  '+ slinebreak +
       '       A.NR_ADICAO,                                                          '+ slinebreak +
       '       CONVERT(NUMERIC(15, 2), A.ALIQ_PIS) AS ALIQ_PIS,                      '+ slinebreak +
       '       CONVERT(NUMERIC(15, 2), A.ALIQ_COFINS) AS ALIQ_COFINS,                '+ slinebreak ;

    if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', datm_DI_Capa.qry_di_NR_PROCESSO.AsString, 'CD_GRUPO') = '082' then
      sSql := sSql +
      '       CONVERT(NUMERIC(15, 2), ISNULL(VL_ICMS_DEVIDO_AFRMM, A.VL_ICMS_CALCULADO)) AS VL_ICMS_CALC, '+ slinebreak
    else
      sSql := sSql +
      '       CONVERT(NUMERIC(15, 2), A.VL_ICMS_CALCULADO) AS VL_ICMS_CALC,                               '+ slinebreak ;

      sSql := sSql +
      '       A.TX_PIS_COFINS                                                               AS TX_PIS_COFINS,               '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), A.VL_PIS)                                             AS VL_PIS_REC,                  '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), A.VL_COFINS)                                          AS VL_COFINS_REC,               '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), IPI.PC_ALIQ_NORM_ADVAL)                               AS PC_IPI,                      '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), IPI.VL_CALC_IPT_ADVAL)                                AS VL_IPI_CALC,                 '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), IPI.VL_IPT_A_RECOLHER)                                AS VL_IPI_REC,                  '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), II.VL_BASE_CALC_ADVAL)                                AS VL_AD,                       '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), II.PC_ALIQ_NORM_ADVAL)                                AS PC_II,                       '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), II.VL_CALC_IPT_ADVAL)                                 AS VL_II_CALC,                  '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), II.VL_IPT_A_RECOLHER)                                 AS VL_II_REC,                   '+ slinebreak +
      '       A.CD_TIPO_BENEF_PIS_COFINS                                                    AS CD_TIPO_BENEF_PIS_COFINS,    '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), A.VL_TX_SCX_AD)                                       AS VL_TX_SCX,                   '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), A.PC_ICMS)                                            AS ALIQ_ICMS,                   '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), VL_BASE_PIS)                                          AS VL_BASE_PIS,                 '+ slinebreak +
      '       A.CD_NCM_SH                                                                   AS CD_NCM_SH,                   '+ slinebreak +
      '       CASE ISNULL(A.CD_APLICACAO_MERC, '''')                                                                        '+ slinebreak +
      '           WHEN ''1'' THEN ''Consumo''                                                                               '+ slinebreak +
      '           WHEN ''2'' THEN ''Revenda''                                                                               '+ slinebreak +
      '       ELSE ''''                                                                                                     '+ slinebreak +
      '       END                                                                           AS APLIC_MERC,                  '+ slinebreak +
      '       A.QT_MESES_ADM_TEMP                                                           AS QT_MESES_ADM_TEMP,           '+ slinebreak +
      '       ROUND(A.VL_PIS_CALCULADO, 2)                                                  AS VL_PIS_CALC,                 '+ slinebreak +
      '       ROUND(A.VL_COFINS_CALCULADO, 2)                                               AS VL_COFINS_CALC,              '+ slinebreak +
      '       A.VL_ICMS_CALCULADO                                                           AS VL_ICMS_CALC,                '+ slinebreak +
      '       A.VL_ICMS_A_RECOLHER                                                          AS VL_ICMS_REC,                 '+ slinebreak +
      '       A.VL_TX_SCX_AD                                                                AS VL_TX_SCX_AD,                '+ slinebreak +
      '       A.IN_FUNDO_POBREZA                                                            AS IN_FUNDO_POBREZA,            '+ slinebreak +
      '       P.PC_FUNDO_POBREZA_RJ                                                         AS PC_FUNDO_POBREZA_RJ,         '+ slinebreak +
      '       CONVERT(NUMERIC(15, 2), (A.VL_ICMS_CALCULADO / CASE ISNULL(A.PC_ICMS, 0)                                      '+ slinebreak +
      '                                                           WHEN 0 THEN 1                                             '+ slinebreak +
      '                                                           ELSE A.PC_ICMS                                            '+ slinebreak +
      '                                                      END) * P.PC_FUNDO_POBREZA_RJ)  AS VL_FUNDO_POBREZA,            '+ slinebreak +
      '       A.VL_BASE_CALC_ICMS                                                           AS VL_BASE_CALC_ICMS            '+ slinebreak +
      ' FROM      TADICAO_DE_IMPORTACAO A   (NOLOCK)                                                                        '+ slinebreak +
      ' LEFT JOIN TRIBUTO               IPI (NOLOCK) ON IPI.NR_PROCESSO = A.NR_PROCESSO                                     '+ slinebreak +
      '                                             AND IPI.NR_ADICAO   = A.NR_ADICAO                                       '+ slinebreak +
      '                                             AND IPI.CD_RECEITA_IMPOSTO = ''0002''                                   '+ slinebreak +
      ' LEFT JOIN TRIBUTO               II  (NOLOCK) ON II.NR_PROCESSO  = A.NR_PROCESSO                                     '+ slinebreak +
      '                                             AND II.NR_ADICAO    = A.NR_ADICAO                                       '+ slinebreak +
      '                                             AND II.CD_RECEITA_IMPOSTO = ''0001'',                                   '+ slinebreak +
      '           TPARAMETROS           P   (NOLOCK)                                                                        '+ slinebreak +
      ' WHERE A.NR_PROCESSO = ' + QuotedStr(datm_DI_Capa.qry_di_NR_PROCESSO.AsString) + slinebreak +
      ' ORDER BY A.NR_ADICAO ';

    Sql.Text := sSql;
    Open;
    First;

    // Suspensão com Admissão Temporária - Michel - 23/02/2010
    IICalculadoTotal                := 0;
    IIProporcionalTotal             := 0;
    IISuspensoTotal                 := 0;
    IPICalculadoTotal               := 0;
    IPIProporcionalTotal            := 0;
    IPISuspensoTotal                := 0;
    PISCalculadoTotal               := 0;
    PISProporcionalTotal            := 0;
    PISSuspensoTotal                := 0;
    COFINSCalculadoTotal            := 0;
    COFINSProporcionalTotal         := 0;
    COFINSSuspensoTotal             := 0;
    ICMSCalculadoTotal              := 0;
    ICMSProporcionalTotal           := 0;
    ICMSSuspensoTotal               := 0;
    ValorAduaneiroCalculadoTotal    := 0;
    ValorAduaneiroProporcionalTotal := 0;
    ValorAduaneiroSuspensoTotal     := 0;
    ValorSuspensoAdicao             := 0;
    ValorSuspensoTotal              := 0;

    while not EOF do
    begin
      ListaAuxMP164.Add('---------------------------------------------------------------');
      ListaAuxMP164.Add('ADICAO..................: ' + FieldByName('NR_ADICAO').AsString + Space( indice - Length('ADICAO..................: ' + FieldByName('NR_ADICAO').AsString ) ) + '|') ;
      ListaAuxMP164.Add('VALOR ADUANEIRO.........: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_AD').AsFloat) + Space( indice - Length('VALOR ADUANEIRO.........: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_AD').AsFloat) ) ) + '|' );

      // Suspensão com Admissão Temporária - Michel - 23/02/2010
      if (FieldByName('CD_REGIME_TRIBUTAR').AsString = '5') and (FieldByName('CD_FUND_LEG_REGIME').AsString = '37') then
      begin
        // Aplicação da Mercadoria
        Linha := 'APLICACAO...............: ' + FieldByName('APLIC_MERC').AsString;
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        // Taxa do SISCOMEX
        Linha := 'TAXA SISCOMEX...........: ' + FieldByName('VL_TX_SCX_AD').AsString;
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        // II
        Linha := 'I.I. CALCULADO (' + FormatFloat('0.00', FieldByName('PC_II').AsFloat) + '%) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_II_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'I.I. PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_II_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'I.I. SUSPENSO = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_II_CALC').AsFloat - FieldByName('VL_II_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        ListaAuxMP164.Add('**************************************************************');

        // IPI
        Linha := 'IPI CALCULADO (' + FormatFloat('0.00', FieldByName('PC_IPI').AsFloat) + '%) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_IPI_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'IPI PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_IPI_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'IPI SUSPENSO = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_IPI_CALC').AsFloat - FieldByName('VL_IPI_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        ListaAuxMP164.Add('**************************************************************');

        // PIS
        Linha := 'PIS CALCULADO (' + FormatFloat('0.00', FieldByName('ALIQ_PIS').AsFloat) + '%) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_PIS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'PIS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_PIS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'PIS SUSPENSO = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_PIS_CALC').AsFloat - FieldByName('VL_PIS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        ListaAuxMP164.Add('**************************************************************');

        // COFINS
        Linha := 'COFINS CALCULADO (' + FormatFloat('0.00', FieldByName('ALIQ_COFINS').AsFloat) + '%) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_COFINS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'COFINS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_COFINS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'COFINS SUSPENSO = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_COFINS_CALC').AsFloat - FieldByName('VL_COFINS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        ListaAuxMP164.Add('**************************************************************');

        // ICMS
        Linha := 'ICMS CALCULADO (' + FormatFloat('0.00', FieldByName('ALIQ_ICMS').AsFloat) + '%) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_ICMS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'ICMS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES) = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_ICMS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        Linha := 'ICMS SUSPENSO = ' + 'R$' + FormatFloat('###,###,###,##0.00', FieldByName('VL_ICMS_CALC').AsFloat - FieldByName('VL_ICMS_REC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
        ListaAuxMP164.Add('**************************************************************');

        // Valor Aduaneiro
        Linha := 'VALOR ADUANEIRO REDUZIDO = R$' + FormatFloat('###,###,###,##0.00', (FieldByName('VL_AD').AsFloat / 100) * FieldByName('QT_MESES_ADM_TEMP').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        IICalculadoTotal                := IICalculadoTotal + FieldByName('VL_II_CALC').AsFloat;
        IIProporcionalTotal             := IIProporcionalTotal + FieldByName('VL_II_REC').AsFloat;
        IPICalculadoTotal               := IPICalculadoTotal + FieldByName('VL_IPI_CALC').AsFloat;
        IPIProporcionalTotal            := IPIProporcionalTotal + FieldByName('VL_IPI_REC').AsFloat;
        PISCalculadoTotal               := PISCalculadoTotal + FieldByName('VL_PIS_CALC').AsFloat;
        PISProporcionalTotal            := PISProporcionalTotal + FieldByName('VL_PIS_REC').AsFloat;
        COFINSCalculadoTotal            := COFINSCalculadoTotal + FieldByName('VL_COFINS_CALC').AsFloat;
        COFINSProporcionalTotal         := COFINSProporcionalTotal + FieldByName('VL_COFINS_REC').AsFloat;
        ICMSCalculadoTotal              := ICMSCalculadoTotal + FieldByName('VL_ICMS_CALC').AsFloat;
        ICMSProporcionalTotal           := ICMSProporcionalTotal + FieldByName('VL_ICMS_REC').AsFloat;
        ValorAduaneiroCalculadoTotal    := ValorAduaneiroCalculadoTotal + FieldByName('VL_AD').AsFloat;
        ValorSuspensoAdicao             := (FieldByName('VL_II_CALC').AsFloat - FieldByName('VL_II_REC').AsFloat) +
                                           (FieldByName('VL_IPI_CALC').AsFloat - FieldByName('VL_IPI_REC').AsFloat) +
                                           (FieldByName('VL_PIS_CALC').AsFloat - FieldByName('VL_PIS_REC').AsFloat) +
                                           (FieldByName('VL_COFINS_CALC').AsFloat - FieldByName('VL_COFINS_REC').AsFloat) +
                                           (FieldByName('VL_ICMS_CALC').AsFloat - FieldByName('VL_ICMS_REC').AsFloat);
        ValorAduaneiroProporcionalTotal := ValorAduaneiroProporcionalTotal + ((FieldByName('VL_AD').AsFloat / 100) * FieldByName('QT_MESES_ADM_TEMP').AsFloat);

        // Total Suspenso
        Linha := 'VALOR SUSPENSO TOTAL = R$' + FormatFloat('###,###,###,##0.00', ValorSuspensoAdicao);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
      end
      else
      begin
        ListaAuxMP164.Add('VALOR ICMS DEVIDO.' + FormatFloat('0.00',FieldByName('ALIQ_ICMS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_ICMS_CALC').AsFloat) + Space( indice - Length( 'VALOR ICMS DEVIDO.' + FormatFloat('0.00',FieldByName('ALIQ_ICMS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_ICMS_CALC').AsFloat) ) ) + '|');
        // FECP - Michel - 06/04/2010
        if (FieldByName('IN_FUNDO_POBREZA').AsString = '1') then
          ListaAuxMP164.Add('FECP..............' + FormatFloat('0.00',FieldByName('PC_FUNDO_POBREZA_RJ').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_FUNDO_POBREZA').AsFloat) + Space( indice - Length( 'FECP..............' + FormatFloat('0.00',FieldByName('PC_FUNDO_POBREZA_RJ').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_FUNDO_POBREZA').AsFloat) ) ) + '|');

        // PIS/COFINS - Integral, Redução
        if ( FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '1' ) or ( FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '2' ) then
        begin
          //ListaAuxMP164.Add('PIS / PASEP.............: '   +FormatFloat('0.00',FieldByName('ALIQ_PIS').AsFloat) + ' = R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS').AsFloat));
          //ListaAuxMP164.Add('COFINS .................: '   +FormatFloat('0.00',FieldByName('ALIQ_COFINS').AsFloat) + ' = R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS').AsFloat));
          ListaAuxMP164.Add('BASE PIS / COFINS.......: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_BASE_PIS').AsFloat) + Space( indice - Length('BASE PIS / COFINS.......:' + ' R$ ' + FormatFloat('###,###,###,##0.00',FieldByName('VL_BASE_PIS').AsFloat)) ) + '|');
          ListaAuxMP164.Add('PIS / PASEP........' + FormatFloat('0.00',FieldByName('ALIQ_PIS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS_REC').AsFloat) + Space( indice - Length('PIS / PASEP........' + FormatFloat('0.00',FieldByName('ALIQ_PIS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS_REC').AsFloat)) ) + '|');
          ListaAuxMP164.Add('COFINS ............' + FormatFloat('0.00',FieldByName('ALIQ_COFINS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS_REC').AsFloat) + Space( indice - Length('COFINS ............' + FormatFloat('0.00',FieldByName('ALIQ_COFINS').AsFloat) + '%: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS_REC').AsFloat)) ) + '|');
        end;
        // PIS/COFINS - Suspensão
        if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '4' then
        begin
          //ListaAuxMP164.Add('PIS / PASEP SUSPENSO....: '   +FormatFloat('0.00',FieldByName('ALIQ_PIS').AsFloat) + ' = R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS').AsFloat));
          //ListaAuxMP164.Add('COFINS SUSPENSO.........: '   +FormatFloat('0.00',FieldByName('ALIQ_COFINS').AsFloat) + ' = R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS').AsFloat));
          ListaAuxMP164.Add('BASE PIS / COFINS.......: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_BASE_PIS').AsFloat) + Space( indice - Length('BASE PIS / COFINS.......:' + ' R$ ' + FormatFloat('###,###,###,##0.00',FieldByName('VL_BASE_PIS').AsFloat)) ) + '|');
          ListaAuxMP164.Add('PIS / PASEP SUSPENSO....: ' + 'R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS_REC').AsFloat) + Space( indice - Length('PIS / PASEP SUSPENSO....: ' + 'R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_PIS_REC').AsFloat)) ) + '|');
          ListaAuxMP164.Add('COFINS SUSPENSO.........: ' + 'R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS_REC').AsFloat) + Space( indice - Length ('COFINS SUSPENSO.........: ' + 'R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_COFINS_REC').AsFloat)) ) + '|');
        end;

        // Verifica as alíquotas do II e IPI da adição
        datm_DI_capa.Query3.close;
        datm_DI_capa.Query3.SQL.clear;
        datm_DI_capa.Query3.SQL.add( 'SELECT ALIQUOTA_II, ALIQUOTA_IPI FROM TNCM (NOLOCK) WHERE ' );
        datm_DI_capa.Query3.SQL.add( 'CODIGO = "'+FieldByName('CD_NCM_SH').AsString+'"' );
        datm_DI_capa.Query3.Prepare;
        datm_DI_capa.Query3.Open;
        if datm_DI_capa.Query3.RecordCount <> 0 then
        begin
          aliq_ii := FormatFloat('0.00',datm_DI_capa.Query3.FieldByName('ALIQUOTA_II').AsFloat);
          if datm_DI_capa.Query3.FieldByName('ALIQUOTA_IPI').AsString <> 'NT' then
            aliq_ipi := FormatFloat('0.00',datm_DI_capa.Query3.FieldByName('ALIQUOTA_IPI').AsFloat)
          else
            aliq_ipi := '0';
        end;
        datm_DI_capa.Query3.close;

        // II
        with datm_DI_Capa do
        begin
          TIMP.Close;
          TIMP.ParamByName('NR_PROCESSO').AsString := FieldByName('NR_PROCESSO').AsString;
          TIMP.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
          TIMP.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0001';
          TIMP.Prepare;
          TIMP.Open;
          ListaAuxMP164.Add('I.I. .............' + aliq_ii + '%: R$ '+FormatFloat('###,###,###,##0.00',TIMP.FieldByName('VL_IMP').AsFloat) + Space( indice - Length('I.I. .............' + aliq_ii + '%: R$ '+FormatFloat('###,###,###,##0.00',TIMP.FieldByName('VL_IMP').AsFloat)) ) + '|');
          TIMP.Close;
        end;

        // IPI
        with datm_DI_Capa do
        begin
          TIMP.Close;
          TIMP.ParamByName('NR_PROCESSO').AsString := FieldByName('NR_PROCESSO').AsString;
          TIMP.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
          TIMP.ParamByName('CD_RECEITA_IMPOSTO').AsString := '0002';
          TIMP.Prepare;
          TIMP.Open;
          ListaAuxMP164.Add('I.P.I. ...........' + aliq_ipi + '%: R$ '+FormatFloat('###,###,###,##0.00',TIMP.FieldByName('VL_IMP').AsFloat) + Space( indice - Length('I.P.I. ...........' + aliq_ipi + '%: R$ '+FormatFloat('###,###,###,##0.00',TIMP.FieldByName('VL_IMP').AsFloat)) ) + '|');
          TIMP.Close;
        end;
        // Taxa Siscomex
        ListaAuxMP164.Add('TAXA SISCOMEX...........: R$ ' + FormatFloat('###,###,###,##0.00',FieldByName('VL_TX_SCX').AsFloat) + Space( indice - Length('TAXA SISCOMEX...........: R$ '+FormatFloat('###,###,###,##0.00',FieldByName('VL_TX_SCX').AsFloat)) ) + '|');
        if vAFRMMencontrado <> '' then
          ListaAuxMP164.Add(vAFRMMencontrado);
        //  ListaAuxMP164.Add('ARTIGO..................: ' + FieldByName('TX_PIS_COFINS').AsString  + '|' );

        //Aplicação de mercadoria
        ListaAuxMP164.Add('APLICACAO...............: ' + FieldByName('APLIC_MERC').AsString + Space( indice - Length('APLICACACAO.............: ' + FieldByName('APLIC_MERC').AsString) ) + '|');
      end;

      Next;
    end;
    Close;
    Free;
  end;

  // Suspensão com Admissão Temporária - Michel - 23/02/2010
  IISuspensoTotal                 := IICalculadoTotal - IIProporcionalTotal;
  IPISuspensoTotal                := IPICalculadoTotal - IPIProporcionalTotal;
  PISSuspensoTotal                := PISCalculadoTotal - PISProporcionalTotal;
  COFINSSuspensoTotal             := COFINSCalculadoTotal - COFINSProporcionalTotal;
  ICMSSuspensoTotal               := ICMSCalculadoTotal - ICMSProporcionalTotal;
  ValorAduaneiroSuspensoTotal     := ValorAduaneiroCalculadoTotal - ValorAduaneiroProporcionalTotal;
  ValorSuspensoTotal              := IISuspensoTotal + IPISuspensoTotal + PISSuspensoTotal + COFINSSuspensoTotal + ICMSSuspensoTotal
                                    (* + ValorAduaneiroSuspensoTotal*;

  if ValorAduaneiroCalculadoTotal > 0 then
  begin
    ListaAuxMP164.Add('---------------------------------------------------------------');
    Linha := 'DEMONSTRATIVO DO CALCULO DOS TRIBUTOS TOTAIS PROPORCIONAIS PAGOS';
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    // II
    Linha := 'I.I. CALCULADO = R$' + FormatFloat('###,###,###,##0.00', IICalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'I.I. PROPORCIONAL = R$' + FormatFloat('###,###,###,##0.00', IIProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'I.I. SUSPENSO = R$' + FormatFloat('###,###,###,##0.00', IISuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    ListaAuxMP164.Add('**************************************************************');

    // IPI
    Linha := 'IPI CALCULADO = R$' + FormatFloat('###,###,###,##0.00', IPICalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'IPI PROPORCIONAL = R$' + FormatFloat('###,###,###,##0.00', IPIProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'IPI SUSPENSO = R$' + FormatFloat('###,###,###,##0.00', IPISuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    ListaAuxMP164.Add('**************************************************************');

    // PIS
    Linha := 'PIS CALCULADO = R$' + FormatFloat('###,###,###,##0.00', PISCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'PIS PROPORCIONAL = R$' + FormatFloat('###,###,###,##0.00', PISProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'PIS SUSPENSO = R$' + FormatFloat('###,###,###,##0.00', PISSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    ListaAuxMP164.Add('**************************************************************');

    // COFINS
    Linha := 'COFINS CALCULADO = R$' + FormatFloat('###,###,###,##0.00', COFINSCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'COFINS PROPORCIONAL = R$' + FormatFloat('###,###,###,##0.00', COFINSProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'COFINS SUSPENSO = R$' + FormatFloat('###,###,###,##0.00', COFINSSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    ListaAuxMP164.Add('**************************************************************');

    // ICMS
    Linha := 'ICMS CALCULADO = R$' + FormatFloat('###,###,###,##0.00', ICMSCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'ICMS PROPORCIONAL = R$' + FormatFloat('###,###,###,##0.00', ICMSProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'ICMS SUSPENSO = R$' + FormatFloat('###,###,###,##0.00', ICMSSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    ListaAuxMP164.Add('**************************************************************');

    // Valor Aduaneiro
    Linha := 'VALOR ADUANEIRO REDUZIDO = R$' + FormatFloat('###,###,###,##0.00', ValorAduaneiroProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'VALOR SUSPENSO TOTAL = R$' + FormatFloat('###,###,###,##0.00', ValorSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
  end;

  if ListaAuxMP164.Count > 0 then
  begin
    //if not(datm_DI_Capa.qry_di_.State in [dsEdit,dsInsert]) then
      //datm_DI_Capa.qry_di_.Edit;
      //datm_DI_Capa.qry_di_TX_INFO_COMPL.AsString := datm_DI_Capa.qry_di_TX_INFO_COMPL.AsString +#13#10+ ListaAuxMP164.Text;
      //Result := #13#10+ListaAuxMP164.Text+#13#10;
      Result := ListaAuxMP164.Text;
  end
  else
  begin
    Result := '';
  end;
end;
}

procedure Tfrm_DI_capa.TabSet1Click(Sender: TObject);
begin
  ntbPage3.PageIndex := TabSet1.TabIndex;
end;

procedure Tfrm_DI_capa.dbg_acrescimosDblClick(Sender: TObject);
begin
  datm_di_capa.tbl_acrescimos.Edit;
  if dbg_acrescimos.Columns.Grid.SelectedIndex = 3 then
  begin
    if datm_di_capa.tbl_acrescimos.FieldByName('TP_BASE').AsString = 'Valor' then
      datm_di_capa.tbl_acrescimos.FieldByName('TP_BASE').AsString := 'Peso'
    else
      datm_di_capa.tbl_acrescimos.FieldByName('TP_BASE').AsString := 'Valor';
  end
  else if dbg_acrescimos.Columns.Grid.SelectedIndex = 1 then
    datm_di_capa.tbl_acrescimos.FieldByName('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA','NM_MOEDA'], ['Código','Descrição'], 'CD_MOEDA', frm_main.mi_cad_moeda);
  dbg_acrescimos.Refresh;
end;

procedure Tfrm_DI_capa.dbg_acrescimosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_TAB, VK_PRIOR, VK_NEXT] then
    Key := VK_RETURN;
  if (Key in [VK_UP, VK_DOWN]) and
     (datm_di_capa.tbl_acrescimos.state in [dsEdit,dsInsert]) and
     ((datm_di_capa.tbl_acrescimosCD_MOEDA.Value = '') and
     (datm_di_capa.tbl_acrescimosTP_BASE.Value = '') and
     (datm_di_capa.tbl_acrescimosCD_DESPESA.Value = '') and
     (datm_di_capa.tbl_acrescimosVL_MOEDA.Value = 0)) then
  begin
    datm_di_capa.tbl_acrescimos.Cancel;
  end
  else
  begin
    if (Key in [VK_UP, VK_DOWN]) and
       (datm_di_capa.tbl_acrescimos.state in [dsEdit,dsInsert]) and
       ((datm_di_capa.tbl_acrescimosCD_MOEDA.Value = '') or
       (datm_di_capa.tbl_acrescimosTP_BASE.Value = '') or
       (datm_di_capa.tbl_acrescimosCD_DESPESA.Value = '') or
       (datm_di_capa.tbl_acrescimosVL_MOEDA.Value = 0)) then
    begin
      Key := 0;
      BoxMensagem('Preencha todos os campos antes de salvar',3);
    end;
  end;
  // Inserido para não permitir exclusão de registro - Michel - 11/05/2009 - Ocorrência 09005/09
  if (Key in [VK_DELETE]) and (ssCtrl in Shift) then
    Abort;
end;

procedure Tfrm_DI_capa.dbg_deducoesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_TAB, VK_PRIOR, VK_NEXT] then
    Key := VK_RETURN;
  if (Key in [VK_UP, VK_DOWN]) and
     (datm_di_capa.tbl_deducoes.state in [dsEdit,dsInsert]) and
     ((datm_di_capa.tbl_deducoesCD_MOEDA.Value = '') and
     (datm_di_capa.tbl_deducoesTP_BASE.Value = '') and
     (datm_di_capa.tbl_deducoesCD_DESPESA.Value = '') and
     (datm_di_capa.tbl_deducoesVL_MOEDA.Value = 0)) then
  begin
    datm_di_capa.tbl_deducoes.Cancel;
  end
  else
    if (Key in [VK_UP, VK_DOWN]) and
       (datm_di_capa.tbl_deducoes.state in [dsEdit,dsInsert]) and
       ((datm_di_capa.tbl_deducoesCD_MOEDA.Value = '') or
       (datm_di_capa.tbl_deducoesTP_BASE.Value = '') or
       (datm_di_capa.tbl_deducoesCD_DESPESA.Value = '') or
       (datm_di_capa.tbl_deducoesVL_MOEDA.Value = 0)) then
    begin
      Key := 0;
      BoxMensagem('Preencha todos os campos antes de salvar',3);
    end;
  // Inserido para não permitir exclusão de registro - Michel - 11/05/2009 - Ocorrência 09005/09
  if (Key in [VK_DELETE]) and (ssCtrl in Shift) then
    Abort;
end;

procedure Tfrm_DI_capa.dbg_deducoesDblClick(Sender: TObject);
begin
  datm_di_capa.tbl_deducoes.Edit;
  if dbg_deducoes.Columns.Grid.SelectedIndex = 3 then
  begin
    if datm_di_capa.tbl_deducoes.FieldByName('TP_BASE').AsString = 'Valor' then
      datm_di_capa.tbl_deducoes.FieldByName('TP_BASE').AsString := 'Peso'
    else
      datm_di_capa.tbl_deducoes.FieldByName('TP_BASE').AsString := 'Valor';
  end
  else if dbg_deducoes.Columns.Grid.SelectedIndex = 1 then
    datm_di_capa.tbl_deducoes.FieldByName('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA','NM_MOEDA'], ['Código','Descrição'], 'CD_MOEDA', frm_main.mi_cad_moeda);
//  datm_di_capa.tbl_deducoes.Post;
  dbg_deducoes.Refresh;
end;

procedure Tfrm_DI_capa.SpeedButton5Click(Sender: TObject);
begin
  if ntbPage3.ActivePage = 'ntbAcrescimos' then
  begin
    if MessageDlg('Confirma exclusão deste registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      //Delete acréscimos adição
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('Delete from tacrescimo_valoracao where nr_processo = ''' + datm_DI_Capa.tbl_acrescimosNR_PROCESSO.AsString + ''' and CD_MET_ACRES_VALOR = ''' + datm_di_capa.tbl_acrescimosCD_DESPESA.AsString + '''');
        ExecSQL;
        Free;
      end;
      //Delete acréscimos itens
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('Delete from TACRESCIMO_VALORACAO_ITEM where nr_processo = ''' + datm_DI_Capa.tbl_acrescimosNR_PROCESSO.AsString + ''' and CD_MET_ACRES_VALOR = ''' + datm_di_capa.tbl_acrescimosCD_DESPESA.AsString + '''');
        ExecSQL;
        Free;
      end;
      //Delete acréscimos Capa
      datm_DI_Capa.Tbl_acrescimos.Delete;
    end;
    dbg_acrescimos.Refresh;
  end
  else
  if ntbPage3.ActivePage = 'ntbDeducoes' then
  begin
    if MessageDlg('Confirma exclusão deste registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      //Delete dedução adição
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('delete from tdeducao_valoracao where nr_processo = ''' + datm_DI_Capa.tbl_deducoesNR_PROCESSO.AsString + ''' and CD_MET_DEDUC_VALOR = ''' + datm_di_capa.tbl_deducoesCD_DESPESA.AsString + '''');
        ExecSQL;
        Free;
      end;
      //Delete dedução itens
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('delete from TDEDUCAO_VALORACAO_ITEM where nr_processo = ''' + datm_DI_Capa.tbl_deducoesNR_PROCESSO.AsString + ''' and CD_MET_DEDUC_VALOR = ''' + datm_di_capa.tbl_deducoesCD_DESPESA.AsString + '''');
        ExecSQL;
        Free;
      end;
      //Delete dedução Capa
      datm_DI_Capa.tbl_deducoes.delete;
    end;
    dbg_deducoes.Refresh;
  end;
end;

procedure Tfrm_DI_capa.dbg_acrescimosExit(Sender: TObject);
begin
  if datm_di_capa.tbl_acrescimos.State in [dsInsert, dsEdit] then
    datm_di_capa.tbl_acrescimos.Post;
end;

procedure Tfrm_DI_capa.dbg_deducoesExit(Sender: TObject);
begin
  if datm_di_capa.tbl_deducoes.State in [dsInsert, dsEdit] then
    datm_di_capa.tbl_deducoes.Post;
end;

function Tfrm_DI_capa.VerificaRepetidos : Boolean;
begin
  Result := False;
  with TQuery.Create(Self) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Add('select count(*) TOTAL from TACRESCIMO_DEDUCAO (NOLOCK) ');
    Sql.Add('where NR_PROCESSO = ''' + datm_DI_Capa.tbl_acrescimosNR_PROCESSO.AsString + ''' and CD_DESPESA = ''' + datm_DI_Capa.tbl_acrescimosCD_DESPESA.AsString + '''');
    Open;

    if FieldByName('TOTAL').AsInteger = 1 then
//    if not IsEmpty then
    begin
      ShowMessage('já existe');
      Result := True;
    end;
    Free;
  end;
end;


procedure Tfrm_DI_capa.dbedt_dt_chegada1Exit(Sender: TObject);
begin
(*  if datm_DI_Capa.ds_di.State in [dsInsert, dsEdit] then
      //Realizar evento 162
      CloseStoredProc(datm_di_capa.sp_atz_evento);
      datm_di_capa.sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
      datm_di_capa.sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := '162';
      datm_di_capa.sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate(Copy( datm_di_capa.qry_di_DT_CHEGADA_CARGA.AsString, 1, 2 ) + '/' +
                                                                                       Copy( datm_di_capa.qry_di_DT_CHEGADA_CARGA.AsString, 3, 2 ) + '/' +
                                                                                       Copy( datm_di_capa.qry_di_DT_CHEGADA_CARGA.AsString, 5, 4 ));
      ExecStoredProc(datm_di_capa.sp_atz_evento);
      CloseStoredProc(datm_di_capa.sp_atz_evento);  *)
end;

procedure Tfrm_DI_capa.tbsht_Transporte_MaritimoShow(Sender: TObject);
begin
  // Se DTA está preenchido desabilita o Manifesto
  if ConsultaLookUPSQL(' SELECT ISNULL(NR_DTA, '''') NR_DTA' +
                       ' FROM TPROCESSO (NOLOCK) ' +
                       ' WHERE NR_PROCESSO = ''' + str_nr_processo + '''', 'NR_DTA') <> '' then
  begin
    rbtn_manifesto_carga2.Enabled := False;
    //rbtn_dta2.Checked := True;
    //rbtn_dta2.OnClick(rbtn_dta2);
  end
  else
  begin
    rbtn_manifesto_carga2.Enabled := True and rbtn_manifesto_carga2.Enabled;
    //rbtn_manifesto_carga2.Checked := False;
    //rbtn_dta2.Checked := False;
  end;
end;

function Tfrm_DI_capa.PodeFocar(Componente: TWinControl): Boolean;
begin
  Result := Self.Visible and Componente.CanFocus;
end;

procedure Tfrm_DI_capa.dbedt_cd_pais_procedencia1Exit(Sender: TObject);
begin
  dbedt_nm_pais_procedencia1.Text := ConsultaLookUP('TPAIS','CODIGO', dbedt_cd_pais_procedencia1.Text,'DESCRICAO');
end;

function Tfrm_DI_capa.AtualizaVolumes: Boolean;
begin
  CloseStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
  datm_DI_Capa.sp_di_atualiza_volumes.ParamByName('@NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
  ExecStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
  Result := datm_DI_Capa.sp_di_atualiza_volumes.ParamByName('Result').AsInteger <> 1;
  CloseStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
end;

procedure Tfrm_DI_capa.btn_trans_DIClick(Sender: TObject);
begin
 { if MessageDlg('Deseja atualizar as observações automáticas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    btnObsAutomatica.Click;
  }
  
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a transmissão.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;

  if btn_salvar.Enabled then
    Exit;

  Application.CreateForm(Tfrm_trans_DI, frm_trans_DI);
  // Desabilitar as opções de alterar a consulta
  frm_trans_di.msk_cd_unid_neg.Enabled := False;
  frm_trans_di.btn_co_unid_neg.Enabled := False;
  frm_trans_di.msk_cd_grupo.Enabled    := False;
  frm_trans_di.btn_co_grupo.Enabled    := False;
  frm_trans_di.msk_cd_cliente.Enabled  := False;
  frm_trans_di.btn_co_cliente.Enabled  := False;
  // Preenche os campos
  frm_trans_DI.msk_cd_unid_neg.Text := Copy(str_nr_processo, 1, 2);
  frm_trans_DI.msk_cd_unid_negExit(frm_trans_DI.msk_cd_unid_neg);
  frm_trans_DI.msk_cd_cliente.Text := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_CLIENTE');
  frm_trans_DI.msk_cd_clienteExit(frm_trans_DI.msk_cd_cliente);
  // Preencher parâmetro com o processo e exibir a janela
  datm_trans_di.qry_grd_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  frm_trans_DI.ShowModal;
  FreeAndNil(frm_trans_DI);
end;

procedure Tfrm_DI_capa.btn_RetificarClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a retificação.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_RetificaDI_Adm_Temp, frm_RetificaDI_Adm_Temp);
  frm_RetificaDI_Adm_Temp.ShowModal('', '', '', str_nr_processo);
end;

function Tfrm_DI_capa.HistoricoMP164_Novo: String;
const
  _FILL = '..................................................';
var
  ListaAuxMP164 : TStringList;
  tipo : string;
  aliq_ii, aliq_ipi : string;
  indice : Byte;
  Linha: String;
  IICalculadoTotal, IIProporcionalTotal, IISuspensoTotal,
  IPICalculadoTotal, IPIProporcionalTotal, IPISuspensoTotal,
  PISCalculadoTotal, PISProporcionalTotal, PISSuspensoTotal,
  COFINSCalculadoTotal, COFINSProporcionalTotal, COFINSSuspensoTotal,
  ICMSCalculadoTotal, ICMSProporcionalTotal, ICMSSuspensoTotal,
  ValorAduaneiroCalculadoTotal, ValorAduaneiroProporcionalTotal, ValorAduaneiroSuspensoTotal, ValorSomaAdicoes, ValorAdicao,
  ValorSuspensoAdicao, ValorSuspensoTotal, ValorMercLocalEmb_Adicao, ValorMLE_MoedaNeg_Adicao: Double;
  str_pc_fecp, str_nm_cfop, ssql: String;
  Processo, Adicao, SiglaMoedaAdicao: String;
  QueryCambio: TQuery;

  function PipeFinal(AStr: String): String;
  var
    vLinha, vPalavra: String;
  begin
    vLinha := '';

    Result := '';
    while (AStr <> '') do
    begin
      vLinha := '';
      while (AStr <> '') and (AStr[1] in [#13, #10, #32, #9]) and (Length(vLinha) < indice) do
      begin
        vLinha := vLinha + AStr[1];
        System.Delete(AStr, 1, 1);
      end;
      vPalavra := '';
      if (AStr <> '') and (not (AStr[1] in [#13, #10, #32, #9])) and (Length(vLinha) < indice) then
      begin
        while (AStr <> '') and (not (AStr[1] in [#13, #10, #32, #9])) do
        begin
          while (AStr <> '') and (not (AStr[1] in [#13, #10, #32, #9])) do
          begin
            vPalavra := vPalavra + AStr[1];
            System.Delete(AStr, 1, 1);
          end;
          if (Length(vLinha + vPalavra) < indice) then
          begin
            vLinha := vLinha + vPalavra;
            vPalavra := '';
            while (AStr <> '') and (AStr[1] in [#13, #10, #32, #9]) and (Length(vLinha) < indice) do
            begin
              vLinha := vLinha + AStr[1];
              System.Delete(AStr, 1, 1);
            end;
          end
          else
          begin
            AStr := vPalavra + AStr;
            vPalavra := '';
            Break;
          end;
        end;
      end;
      if AStr = '' then
        Result := Result + vLinha + Space(indice - Length(vLinha)) + '|'
      else
        Result := Result + vLinha + Space(indice - Length(vLinha));
    end;
  end;
begin
  tipo := '0001';
  indice := 68;

  // Repassar os dados dos artigos da MP, das adicoes para informacoes complementares.
  ListaAuxMP164 := TStringList.Create;
  ListaAuxMP164.Clear;
  QueryCambio := TQuery.Create(Application);
  QueryCambio.DataBaseName := 'DBBROKER';

  with TQuery.Create(Application) do
  try
    DataBaseName := 'DBBROKER';
    ssql :=
            'SELECT AI.NR_ADICAO                                                       AS NR_ADICAO,                           ' + slinebreak +
            '       P.CD_GRUPO                                                         AS CD_GRUPO,                            ' + slinebreak +
            '       AI.CD_REGIME_TRIBUTAR                                              AS CD_REGIME_TRIBUTAR,                  ' + slinebreak +
            '       AI.CD_FUND_LEG_REGIME                                              AS CD_FUND_LEG_REGIME,                  ' + slinebreak +
            '       ISNULL(II.VL_BASE_CALC_ADVAL, 0)                                   AS VL_ADUANEIRO,                        ' + slinebreak +
            '       (ISNULL(II.VL_BASE_CALC_ADVAL, 0) / ISNULL(DI.TX_DOLAR, 1))        AS VL_ADUANEIRO_USD,                    ' + slinebreak +
            '       ISNULL(II.VL_IPT_A_RECOLHER,  0)                                   AS VL_II,                               ' + slinebreak +
            '       ISNULL(II.VL_CALC_IPT_ADVAL,  0)                                   AS VL_II_CALC,                          ' + slinebreak +
            '       ISNULL(IPI.VL_IPT_A_RECOLHER, 0)                                   AS VL_IPI,                              ' + slinebreak +
            '       ISNULL(IPI.VL_CALC_IPT_ADVAL, 0)                                   AS VL_IPI_CALC,                         ' + slinebreak +
            '       ISNULL(AI.VL_TX_SCX_AD, 0)                                         AS VL_SISCOMEX,                         ' + slinebreak +
            '       AI.VL_AFRMM                                                        AS VL_AFRMM,                            ' + slinebreak +
            '       AI.QT_PERIOD_PGTO_360                                              AS QT_PERIOD_PGTO_360,                  ' + slinebreak +
            '       AI.VL_TOT_FINANC_360                                               AS VL_TOT_FINANC_360,                   ' + slinebreak ;


    if in_afrmm = '1' then
    begin
    ssql := ssql +
            '       ISNULL(AI.VL_ICMS_A_RECOLHER_AFRMM, 0)                             AS VL_ICMS,                             ' + slinebreak +
            '       CONVERT(NUMERIC(15, 2),                                                                                    ' + slinebreak +
            '       ISNULL(AI.VL_ICMS_DEVIDO_AFRMM, AI.VL_ICMS_CALCULADO))             AS VL_ICMS_CALC,                        ' + slinebreak +
            '       AI.VL_BASE_CALC_ICMS_AFRMM                                         AS VL_BASE_CALC_ICMS,                   ' + slinebreak +
            '       ISNULL(AI.IN_FUNDO_POBREZA, "0")                                   AS IN_FUNDO_POBREZA,                    ' + slinebreak +
            '       PA.PC_FUNDO_POBREZA_RJ                                             AS PC_FUNDO_POBREZA,                    ' + slinebreak +
            '       ISNULL(CONVERT(NUMERIC(15, 2), (AI.VL_ICMS_A_RECOLHER_AFRMM /                                              ' + slinebreak +
            '                                       CASE ISNULL(AI.PC_ICMS, 0)                                                 ' + slinebreak +
            '                                             WHEN 0 THEN 1                                                        ' + slinebreak +
            '                                             ELSE AI.PC_ICMS                                                      ' + slinebreak +
            '                                       END) * PA.PC_FUNDO_POBREZA_RJ), 0) AS VL_FUNDO_POBREZA,                    ' + slinebreak
    end
    else
    begin
    ssql := ssql +
            '       ISNULL(AI.VL_ICMS_A_RECOLHER, 0)                                   AS VL_ICMS,                             ' + slinebreak +
            '       CONVERT(NUMERIC(15, 2), AI.VL_ICMS_CALCULADO)                      AS VL_ICMS_CALC,                        ' + slinebreak +
            '       AI.VL_BASE_CALC_ICMS                                               AS VL_BASE_CALC_ICMS,                   ' + slinebreak +
            '       ISNULL(AI.IN_FUNDO_POBREZA, "0")                                   AS IN_FUNDO_POBREZA,                    ' + slinebreak +
            '       PA.PC_FUNDO_POBREZA_RJ                                             AS PC_FUNDO_POBREZA,                    ' + slinebreak +
            '       ISNULL(CONVERT(NUMERIC(15, 2), (AI.VL_ICMS_CALCULADO /                                                     ' + slinebreak +
            '                                       CASE ISNULL(AI.PC_ICMS, 0)                                                 ' + slinebreak +
            '                                            WHEN 0 THEN 1                                                         ' + slinebreak +
            '                                            ELSE AI.PC_ICMS                                                       ' + slinebreak +
            '                                       END) * PA.PC_FUNDO_POBREZA_RJ), 0) AS VL_FUNDO_POBREZA,                    ' + slinebreak ;
    end;
    ssql := ssql +
            '       AI.CD_TIPO_BENEF_PIS_COFINS                                        AS CD_TIPO_BENEF_PIS_COFINS,            ' + slinebreak +
            '       AI.TX_PIS_COFINS                                                   AS TX_PIS_COFINS,                       ' + slinebreak +
            '       ISNULL(AI.VL_BASE_PIS, 0)                                          AS VL_BASE_PIS_COFINS,                  ' + slinebreak +
            '       ISNULL(AI.VL_PIS, 0)                                               AS VL_PIS,                              ' + slinebreak +
            '       ISNULL(AI.VL_PIS_CALCULADO, 0)                                     AS VL_PIS_CALC,                         ' + slinebreak +
            '       ISNULL(AI.VL_COFINS, 0)                                            AS VL_COFINS,                           ' + slinebreak +
            '       ISNULL(AI.VL_COFINS_CALCULADO, 0)                                  AS VL_COFINS_CALC,                      ' + slinebreak +
            '       CASE ISNULL(AI.CD_APLICACAO_MERC, "")                                                                      ' + slinebreak +
            '           WHEN "1" THEN "Consumo"                                                                                ' + slinebreak +
            '           WHEN "2" THEN "Revenda"                                                                                ' + slinebreak +
            '       ELSE ""                                                                                                    ' + slinebreak +
            '       END                                                                AS NM_APLICACAO,                        ' + slinebreak +
            '       CASE AI.CD_REGIME_TRIBUTAR                                                                                 ' + slinebreak +
            '           WHEN 1 THEN "INTEGRAL"                                                                                 ' + slinebreak +
            '           WHEN 2 THEN "IMUNIDADE"                                                                                ' + slinebreak +
            '           WHEN 3 THEN "ISENTO"                                                                                   ' + slinebreak +
            '           WHEN 4 THEN "REDUZIDO"                                                                                 ' + slinebreak +
            '           WHEN 5 THEN "SUSPENSO"                                                                                 ' + slinebreak +
            '           WHEN 6 THEN "NÃO INCIDENTE"                                                                            ' + slinebreak +
            '       ELSE ""                                                                                                    ' + slinebreak +
            '       END                                                                AS NM_TIPO_II,                          ' + slinebreak +
            '       II.PC_ALIQ_NORM_ADVAL AS PC_II,                                                                            ' + slinebreak +
            '       CASE IPI.CD_TIPO_BENEF_IPI                                                                                 ' + slinebreak +
            '           WHEN 1 THEN "ISENTO"                                                                                   ' + slinebreak +
            '           WHEN 2 THEN "REDUZIDO"                                                                                 ' + slinebreak +
            '           WHEN 4 THEN "INTEGRAL"                                                                                 ' + slinebreak +
            '           WHEN 5 THEN "SUSPENSO"                                                                                 ' + slinebreak +
            '       ELSE ""                                                                                                    ' + slinebreak +
            '       END                                                                AS NM_TIPO_IPI,                         ' + slinebreak +
            '       IPI.PC_ALIQ_NORM_ADVAL                                             AS PC_IPI,                              ' + slinebreak +
            '       CASE AI.CD_TRIBUTACAO_ICMS                                                                                 ' + slinebreak +
            '           WHEN 1 THEN "INTEGRAL"                                                                                 ' + slinebreak +
            '           WHEN 3 THEN "ISENTO"                                                                                   ' + slinebreak +
            '           WHEN 4 THEN "REDUZIDO"                                                                                 ' + slinebreak +
            '           WHEN 5 THEN "REG ESPECIAL"                                                                             ' + slinebreak +
            '           WHEN 6 THEN "NÃO INCIDENTE"                                                                            ' + slinebreak +
            '           WHEN 7 THEN "DIFERIDO"                                                                                 ' + slinebreak +
            '       ELSE ""                                                                                                    ' + slinebreak +
            '       END                                                                AS NM_TIPO_ICMS,                        ' + slinebreak +
            '       ISNULL(AI.PC_ICMS, 0)                                              AS PC_ICMS,                             ' + slinebreak +
            '       CASE AI.CD_TIPO_BENEF_PIS_COFINS                                                                           ' + slinebreak +
            '           WHEN 1 THEN "INTEGRAL"                                                                                 ' + slinebreak +
            '           WHEN 2 THEN "ISENTO"                                                                                   ' + slinebreak +
            '           WHEN 3 THEN "REDUZIDO"                                                                                 ' + slinebreak +
            '           WHEN 4 THEN "SUSPENSO"                                                                                 ' + slinebreak +
            '           WHEN 5 THEN "NÃO INCIDENTE"                                                                            ' + slinebreak +
            '       ELSE ""                                                                                                    ' + slinebreak +
            '       END                                                                AS NM_TIPO_PIS_COFINS,                  ' + slinebreak +
            '       ISNULL(AI.ALIQ_PIS, 0)                                             AS PC_PIS,                              ' + slinebreak +
            '       ISNULL(AI.ALIQ_COFINS, 0)                                          AS PC_COFINS,                           ' + slinebreak +
            '       ISNULL(AI.QT_MESES_ADM_TEMP, 0)                                    AS QT_MESES_ADM_TEMP,                   ' + slinebreak +
            '       AI.CD_CFOP                                                         AS CD_CFOP,                             ' + slinebreak +
            '       CFOP.NM_CFOP                                                       AS NM_CFOP,                             ' + slinebreak +
            '       MI.CD_SIGLA                                                        AS CD_SIGLA_MOEDA,                      ' + slinebreak +
            '       AI.VL_FRETE_MERC_MN                                                AS VL_FRETE_MERC_MN,                    ' + slinebreak +
            '       AI.VL_SEG_MERC_MN                                                  AS VL_SEG_MERC_MN,                       ' + slinebreak +
            '      (SUM(ii.VL_BASE_CALC_ADVAL) OVER(PARTITION BY AI.NR_PROCESSO))       AS SOMA_ADICOES                         ' + slinebreak +
            '  FROM TADICAO_DE_IMPORTACAO              AI   (NOLOCK)                                                           ' + slinebreak +
            '     INNER JOIN TPROCESSO                 P    (NOLOCK) ON P.NR_PROCESSO          = AI.NR_PROCESSO                ' + slinebreak +
            '     LEFT  JOIN TCFOP                     CFOP (NOLOCK) ON AI.CD_CFOP             = CFOP.CD_CFOP                  ' + slinebreak +
            '     INNER JOIN TDECLARACAO_IMPORTACAO    DI   (NOLOCK) ON DI.NR_PROCESSO         = AI.NR_PROCESSO                ' + slinebreak +
            '     LEFT  JOIN TMOEDAS_ISO               MI   (NOLOCK) ON MI.CD_MOEDA = ISNULL(AI.CD_MOEDA_MLE, DI.CD_MOEDA_MLE) ' + slinebreak +
            '     LEFT  JOIN TRIBUTO                   II   (NOLOCK) ON II.NR_PROCESSO         = AI.NR_PROCESSO                ' + slinebreak +
            '                                                       AND II.NR_ADICAO           = AI.NR_ADICAO                  ' + slinebreak +
            '                                                       AND II.CD_RECEITA_IMPOSTO  = "0001"                        ' + slinebreak +
            '     LEFT  JOIN TRIBUTO                   IPI  (NOLOCK) ON IPI.NR_PROCESSO        = AI.NR_PROCESSO                ' + slinebreak +
            '                                                       AND IPI.NR_ADICAO          = AI.NR_ADICAO                  ' + slinebreak +
            '                                                       AND IPI.CD_RECEITA_IMPOSTO = "0002",                       ' + slinebreak +
            '     TPARAMETROS                          PA   (NOLOCK)                                                           ' + slinebreak +
            '  WHERE AI.NR_PROCESSO = :NR_PROCESSO                                                                             ' + slinebreak +
            '  ORDER BY AI.NR_ADICAO                                                                                           ' + slinebreak ;

    Sql.text := ssql;
    ParamByName('NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
    Open;
    First;

    // Suspensão com Admissão Temporária - Michel - 23/02/2010
    IICalculadoTotal                := 0;
    IIProporcionalTotal             := 0;
    IISuspensoTotal                 := 0;
    IPICalculadoTotal               := 0;
    IPIProporcionalTotal            := 0;
    IPISuspensoTotal                := 0;
    PISCalculadoTotal               := 0;
    PISProporcionalTotal            := 0;
    PISSuspensoTotal                := 0;
    COFINSCalculadoTotal            := 0;
    COFINSProporcionalTotal         := 0;
    COFINSSuspensoTotal             := 0;
    ICMSCalculadoTotal              := 0;
    ICMSProporcionalTotal           := 0;
    ICMSSuspensoTotal               := 0;
    ValorAduaneiroCalculadoTotal    := 0;
    ValorAduaneiroProporcionalTotal := 0;
    ValorAduaneiroSuspensoTotal     := 0;
    ValorSuspensoAdicao             := 0;
    ValorSuspensoTotal              := 0;
    ValorMercLocalEmb_Adicao        := 0;
    ValorMLE_MoedaNeg_Adicao        := 0;
    ValorSomaAdicoes                := 0;
    ValorAdicao                     := 0;

    str_pc_fecp                     := FFloatToMsk ('#0.00', FieldByName('PC_FUNDO_POBREZA').AsFloat) + '%';
    try
    while not EOF do
    begin
      Processo := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
      Adicao   := FieldByName('NR_ADICAO').AsString;
      SiglaMoedaAdicao := LeftStr(FieldByName('CD_SIGLA_MOEDA').AsString + '   ', 3);

      ValorSomaAdicoes := FieldByName('SOMA_ADICOES').AsFloat;
      ValorAdicao      := FieldByName('VL_ADUANEIRO').AsFloat;

      if ValorSomaAdicoes = 0 then
        ValorSomaAdicoes := 1 ;

      if ValorAdicao = 0 then
        ValorAdicao := 1;

      ValorMercLocalEmb_Adicao := ((dbl_vmle_mn    /ValorSomaAdicoes)*ValorAdicao);
      ValorMLE_MoedaNeg_Adicao := ((dbl_vmle_mneg  /ValorSomaAdicoes)*ValorAdicao);

      if ConsultaLookUP('TGRUPO', 'CD_GRUPO', FieldByName('cd_grupo').AsString, 'IN_PREENCHE_COMPLEMENTAR_AD') = '1' then
      begin
        ListaAuxMP164.Add('--------------------------------------------------------------------');
        Linha := LeftStr('ADICAO' + _FILL, 35) + ': ' + FieldByName('NR_ADICAO').AsString;
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        //DESCRICAO DO CFOP
        str_nm_cfop := PipeFinal(LeftStr('CFOP' + _FILL, 35) + ': ' + FieldbyName('CD_CFOP').AsString);
        Linha := str_nm_cfop;
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)));
      end;

      (* //retirada do quadro complementar por adição
      ListaAuxMP164.Add('--------------------------------------------------------------------');
      Linha := LeftStr('ADICAO' + _FILL, 35) + ': ' + FieldByName('NR_ADICAO').AsString;
      ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

      Linha := LeftStr('VALOR ADUANEIRO' + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ADUANEIRO').AsFloat);
      ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

      Linha := LeftStr('VALOR ADUANEIRO' + _FILL, 35) + ': USD' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ADUANEIRO_USD').AsFloat);
      ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

      //Linha := LeftStr('VMLE na Moeda' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', ValorMLE_MoedaNeg_Adicao);
      //ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

      //Linha := LeftStr('VMLE' + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', ValorMercLocalEmb_Adicao);
      //ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

      //VALOR FRETE
      Linha := LeftStr('FRETE INTERNACIONAL' + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_FRETE_MERC_MN').AsFloat);
      ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');
      
      //VALOR SEGURO
      Linha := LeftStr('SEGURO INTERNACIONAL' + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_SEG_MERC_MN').AsFloat);
      ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

      // Suspensão com Admissão Temporária
      if (FieldByName('CD_REGIME_TRIBUTAR').AsString = '5') and (FieldByName('CD_FUND_LEG_REGIME').AsString = '37') then
      begin
        // Valor Aduaneiro
        Linha := LeftStr('VALOR ADUANEIRO REDUZIDO' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', (FieldByName('VL_ADUANEIRO').AsFloat / 100) * FieldByName('QT_MESES_ADM_TEMP').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        // II
        Linha := 'I.I. CALCULADO (' + FormatFloat('0.00', FieldByName('PC_II').AsFloat) + '%)';
        Linha := LeftStr(Linha + _FILL, 35) + ': ' + 'R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_II_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'I.I. PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_II').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'I.I. SUSPENSO';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_II_CALC').AsFloat - FieldByName('VL_II').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        ListaAuxMP164.Add('********************************************************************');

        // IPI
        Linha := 'IPI CALCULADO (' + FormatFloat('0.00', FieldByName('PC_IPI').AsFloat) + '%)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_IPI_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'IPI PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_IPI').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := LeftStr('IPI SUSPENSO' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_IPI_CALC').AsFloat - FieldByName('VL_IPI').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        ListaAuxMP164.Add('********************************************************************');

        // Taxa do SISCOMEX
        Linha := LeftStr('TAXA SISCOMEX' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_SISCOMEX').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        // PIS
        Linha := 'PIS CALCULADO (' + FormatFloat('0.00', FieldByName('PC_PIS').AsFloat) + '%)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_PIS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'PIS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_PIS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := LeftStr('PIS SUSPENSO' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_PIS_CALC').AsFloat - FieldByName('VL_PIS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        ListaAuxMP164.Add('********************************************************************');

        // COFINS
        Linha := 'COFINS CALCULADO (' + FormatFloat('0.00', FieldByName('PC_COFINS').AsFloat) + '%)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_COFINS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'COFINS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_COFINS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := LeftStr('COFINS SUSPENSO' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_COFINS_CALC').AsFloat - FieldByName('VL_COFINS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        ListaAuxMP164.Add('********************************************************************');

        // ICMS
        Linha := 'BASE ICMS ';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'ICMS CALCULADO (' + FormatFloat('0.00', FieldByName('PC_ICMS').AsFloat) + '%)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ICMS_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'ICMS PROPORCIONAL (' + IntToStr(FieldByName('QT_MESES_ADM_TEMP').AsInteger) + ' MESES)';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ICMS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := LeftStr('ICMS SUSPENSO' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ICMS_CALC').AsFloat - FieldByName('VL_ICMS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        // AFRMM
        if (Trim(in_afrmm) = '1') and (FieldByName('VL_AFRMM').AsFloat > 0) then
          Linha := LeftStr('A.F.R.M.M.' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', FieldByName('VL_AFRMM').AsFloat);

        // FECP
        if FieldByName('IN_FUNDO_POBREZA').AsString = '1' then
        begin
          Linha := 'FECP (' + str_pc_fecp + ') ';
          Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_FUNDO_POBREZA').AsFloat);
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        end;

        ListaAuxMP164.Add('********************************************************************');

        IICalculadoTotal                := IICalculadoTotal + FieldByName('VL_II_CALC').AsFloat;
        IIProporcionalTotal             := IIProporcionalTotal + FieldByName('VL_II').AsFloat;
        IPICalculadoTotal               := IPICalculadoTotal + FieldByName('VL_IPI_CALC').AsFloat;
        IPIProporcionalTotal            := IPIProporcionalTotal + FieldByName('VL_IPI').AsFloat;
        PISCalculadoTotal               := PISCalculadoTotal + FieldByName('VL_PIS_CALC').AsFloat;
        PISProporcionalTotal            := PISProporcionalTotal + FieldByName('VL_PIS').AsFloat;
        COFINSCalculadoTotal            := COFINSCalculadoTotal + FieldByName('VL_COFINS_CALC').AsFloat;
        COFINSProporcionalTotal         := COFINSProporcionalTotal + FieldByName('VL_COFINS').AsFloat;
        ICMSCalculadoTotal              := ICMSCalculadoTotal + FieldByName('VL_ICMS_CALC').AsFloat;
        ICMSProporcionalTotal           := ICMSProporcionalTotal + FieldByName('VL_ICMS').AsFloat;
        ValorAduaneiroCalculadoTotal    := ValorAduaneiroCalculadoTotal + FieldByName('VL_ADUANEIRO').AsFloat;
        ValorSuspensoAdicao             := (FieldByName('VL_II_CALC').AsFloat - FieldByName('VL_II').AsFloat) +
                                           (FieldByName('VL_IPI_CALC').AsFloat - FieldByName('VL_IPI').AsFloat) +
                                           (FieldByName('VL_PIS_CALC').AsFloat - FieldByName('VL_PIS').AsFloat) +
                                           (FieldByName('VL_COFINS_CALC').AsFloat - FieldByName('VL_COFINS').AsFloat) +
                                           (FieldByName('VL_ICMS_CALC').AsFloat - FieldByName('VL_ICMS').AsFloat);
        ValorAduaneiroProporcionalTotal := ValorAduaneiroProporcionalTotal + ((FieldByName('VL_ADUANEIRO').AsFloat / 100) * FieldByName('QT_MESES_ADM_TEMP').AsFloat);

        // Total Suspenso
        Linha := LeftStr('VALOR SUSPENSO TOTAL' + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', ValorSuspensoAdicao);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        // Cambio Antecipado
        QueryCambio.SQL.Clear;
        QueryCambio.SQL.Add('SELECT *');
        QueryCambio.SQL.Add('FROM TPAGAMENTO_VINCULADO (NOLOCK)');
        QueryCambio.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        QueryCambio.SQL.Add('  AND NR_ADICAO = :NR_ADICAO');
        QueryCambio.SQL.Add('  AND CD_FORMA_PAGAMENTO = :CD_FORMA_PAGAMENTO');
        QueryCambio.ParamByName('NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
        QueryCambio.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
        QueryCambio.ParamByName('CD_FORMA_PAGAMENTO').AsString := '1';
        QueryCambio.Open;

        if not QueryCambio.Eof then
          while not QueryCambio.Eof do
          begin
            Linha := LeftStr('CAMBIO ANTECIPADO' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('NR_OP_CAMBIO').AsString);
            ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

            Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_VINC_MD_CAMBIO').AsFloat);
            ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

            QueryCambio.Next;
          end
        else
        begin
          // Cambio A Vista
          QueryCambio.Close;
          QueryCambio.ParamByName('CD_FORMA_PAGAMENTO').AsString := '2';
          QueryCambio.Open;

          if not QueryCambio.Eof then
            while not QueryCambio.Eof do
            begin
              Linha := LeftStr('CAMBIO A VISTA' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('NR_OP_CAMBIO').AsString);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_VINC_MD_CAMBIO').AsFloat);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              QueryCambio.Next;
            end
          else  // Cambio Variável
          begin
            QueryCambio.SQL.Clear;
            QueryCambio.SQL.Add('SELECT SUBSTRING(DT_PREV_PGTO_360, 1, 2) + "/" + SUBSTRING(DT_PREV_PGTO_360, 3, 4) AS DT_PREV_PGTO_360, VL_PREV_PGTO_360');
            QueryCambio.SQL.Add('FROM TPAGAMENTO_PREVISTO (nolock)');
            QueryCambio.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            QueryCambio.SQL.Add('  AND NR_ADICAO = :NR_ADICAO');
            QueryCambio.SQL.Add('ORDER BY NR_SEQUENCIA');
            QueryCambio.ParamByName('NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
            QueryCambio.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
            QueryCambio.Open;

            if not QueryCambio.Eof then
              while not QueryCambio.Eof do
              begin
                Linha := LeftStr('CAMBIO VARIAVEL' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('DT_PREV_PGTO_360').AsString);
                ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

                Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_PREV_PGTO_360').AsFloat);
                ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

                QueryCambio.Next;
              end
            else // Cambio Fixo
            begin
              Linha := LeftStr('PERIODICIDADE CAMBIO' + _FILL, 35) + ': ' + FieldByName('QT_PERIOD_PGTO_360').AsString + ' dias';
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', FieldByName('VL_TOT_FINANC_360').AsFloat);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');
            end;
          end; // Cambio A Vista
        end; // Cambio Antecipado
        QueryCambio.Close;

        if not GrupoPrometeon(FieldByName('cd_grupo').AsString) then
        begin
          // Aplicação da Mercadoria
          Linha := LeftStr('APLICACAO' + _FILL, 35) + ': ' + FieldByName('NM_APLICACAO').AsString;
          ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

          //DESCRICAO DO CFOP
          str_nm_cfop := PipeFinal(LeftStr('CFOP' + _FILL, 35) + ': ' + FieldbyName('CD_CFOP').AsString);
          Linha := str_nm_cfop;
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)));
        end;

      end
      else    


      begin
        // II
        Linha := 'I.I. - ' + FieldByName('NM_TIPO_II').AsString + ' - ' + FFloatToMsk('0.00', FieldByName('PC_II').AsFloat) + '%';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_II').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        if (FieldByName('CD_REGIME_TRIBUTAR').AsString = '5') then
        begin
          Linha := 'I.I. CALCULADO';
          Linha := LeftStr(Linha + _FILL, 35) +': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_II_CALC').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        end;

        // IPI
        Linha := 'I.P.I. - ' + FieldByName('NM_TIPO_II').AsString + ' - ' + FFloatToMsk('0.00', FieldByName('PC_IPI').AsFloat) + '%';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_IPI').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');
        if (FieldByName('CD_REGIME_TRIBUTAR').AsString = '5') then
        begin
          Linha := 'I.P.I. - CALCULADO';
          Linha := LeftStr(Linha + _FILL, 35) +': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_IPI_CALC').AsFloat);
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');
        end;

        // SISCOMEX
        Linha := 'TAXA SISCOMEX';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_SISCOMEX').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        // ICMS
        Linha := 'BASE ICMS ';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

        Linha := 'VALOR ICMS - ' + FieldByName('NM_TIPO_ICMS').AsString + ' - ' + FFloatToMsk('0.00', FieldByName('PC_ICMS').AsFloat) + '%';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_ICMS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        Linha := 'VALOR ICMS CALCULADO ';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_BASE_CALC_ICMS').AsFloat * (FieldByName('PC_ICMS').AsFloat/100));
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        // AFRMM
        if (Trim(in_afrmm) = '1') and (FieldByName('VL_AFRMM').AsFloat > 0) then
        begin
          Linha := LeftStr('A.F.R.M.M.' + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_AFRMM').AsFloat);
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        end;

        // FECP
        if FieldByName('IN_FUNDO_POBREZA').AsString = '1' then
        begin
          Linha := 'FECP (' + str_pc_fecp + ') ';
          Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_FUNDO_POBREZA').AsFloat);
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;
        end;

        // BASE PIS/COFINS
        Linha := 'BASE PIS / COFINS';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_BASE_PIS_COFINS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        // PIS
        Linha := 'PIS / PASEP - ' + FieldByName('NM_TIPO_PIS_COFINS').AsString + ' - ' + FFloatToMsk('0.00', FieldByName('PC_PIS').AsFloat) + '%';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_PIS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        // COFINS
        Linha := 'COFINS - ' + FieldByName('NM_TIPO_PIS_COFINS').AsString + ' - ' + FFloatToMsk('0.00', FieldByName('PC_COFINS').AsFloat) + '%';
        Linha := LeftStr(Linha + _FILL, 35) + ': R$ ' + FFloatToMsk('#,###,##0.00', FieldByName('VL_COFINS').AsFloat);
        ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

        // Cambio Antecipado
        QueryCambio.SQL.Clear;
        QueryCambio.SQL.Add('SELECT *');
        QueryCambio.SQL.Add('FROM TPAGAMENTO_VINCULADO (nolock)');
        QueryCambio.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        QueryCambio.SQL.Add('  AND NR_ADICAO = :NR_ADICAO');
        QueryCambio.SQL.Add('  AND CD_FORMA_PAGAMENTO = :CD_FORMA_PAGAMENTO');
        QueryCambio.ParamByName('NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
        QueryCambio.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
        QueryCambio.ParamByName('CD_FORMA_PAGAMENTO').AsString := '1';
        QueryCambio.Open;

        if not QueryCambio.Eof then
          while not QueryCambio.Eof do
          begin
            Linha := LeftStr('CAMBIO ANTECIPADO' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('NR_OP_CAMBIO').AsString);
            ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

            Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_VINC_MD_CAMBIO').AsFloat);
            ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

            QueryCambio.Next;
          end
        else
        begin
          // Cambio A Vista
          QueryCambio.Close;
          QueryCambio.ParamByName('CD_FORMA_PAGAMENTO').AsString := '2';
          QueryCambio.Open;

          if not QueryCambio.Eof then
            while not QueryCambio.Eof do
            begin
              Linha := LeftStr('CAMBIO A VISTA' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('NR_OP_CAMBIO').AsString);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_VINC_MD_CAMBIO').AsFloat);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              QueryCambio.Next;
            end
          else  // Cambio Variável
          begin
            QueryCambio.SQL.Clear;
            QueryCambio.SQL.Add('SELECT SUBSTRING(DT_PREV_PGTO_360, 1, 2) + "/" + SUBSTRING(DT_PREV_PGTO_360, 3, 4) AS DT_PREV_PGTO_360, VL_PREV_PGTO_360');
            QueryCambio.SQL.Add('FROM TPAGAMENTO_PREVISTO (nolock)');
            QueryCambio.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            QueryCambio.SQL.Add('  AND NR_ADICAO = :NR_ADICAO');
            QueryCambio.SQL.Add('ORDER BY NR_SEQUENCIA');
            QueryCambio.ParamByName('NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
            QueryCambio.ParamByName('NR_ADICAO').AsString := FieldByName('NR_ADICAO').AsString;
            QueryCambio.Open;

            if not QueryCambio.Eof then
              while not QueryCambio.Eof do
              begin
                Linha := LeftStr('CAMBIO VARIAVEL' + _FILL, 35) + ': ' + Trim(QueryCambio.FieldByName('DT_PREV_PGTO_360').AsString);
                ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

                Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', QueryCambio.FieldByName('VL_PREV_PGTO_360').AsFloat);
                ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

                QueryCambio.Next;
              end
            else // Cambio Fixo
            begin
              Linha := LeftStr('PERIODICIDADE CAMBIO' + _FILL, 35) + ': ' + FieldByName('QT_PERIOD_PGTO_360').AsString + ' dias';
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');

              Linha := LeftStr('VALOR CAMBIO' + _FILL, 35) + ': ' + SiglaMoedaAdicao + FFloatToMsk('#,###,##0.00', FieldByName('VL_TOT_FINANC_360').AsFloat);
              ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|');
            end;
          end; // Cambio A Vista
        end; // Cambio Antecipado
        QueryCambio.Close;


        // APLICAÇÃO
        if not GrupoPrometeon(FieldByName('cd_grupo').AsString) then
        begin
          Linha := 'APLICACAO';
          Linha := LeftStr(Linha + _FILL, 35) + ': ' + FieldByName('NM_APLICACAO').AsString;
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha)) + '|') ;

          //DESCRICAO DO CFOP                                                            Eric 20/08/2012          11:24h
          //str_nm_cfop := PipeFinal(LeftStr('DESCRICAO DO CFOP' + _FILL, 35) + ': ' + FieldbyName('CD_CFOP').AsString + ' - ' + FieldbyName('NM_CFOP').AsString);
          //Descomentado e alterado para apenas o código da CFOP por Leandro 08/04/2016. Jira: IMPO-151
          str_nm_cfop := PipeFinal(LeftStr('CFOP' + _FILL, 35) + ': ' + FieldbyName('CD_CFOP').AsString);
          Linha := str_nm_cfop;
          ListaAuxMP164.Add(Linha + Space(indice - Length(Linha))); // Comentado a pedido da Andrea Alves - Michel - 22/02/2013
        end;

      end;   *)

      Next;
    end;


    except on e:exception do
    begin
      ShowMessage(e.message);
    end;
    end;
    Close;
  finally
    Free;
    FreeAndNil(QueryCambio);
  end;


  // Suspensão com Admissão Temporária - Michel - 23/02/2010
  IISuspensoTotal                 := IICalculadoTotal - IIProporcionalTotal;
  IPISuspensoTotal                := IPICalculadoTotal - IPIProporcionalTotal;
  PISSuspensoTotal                := PISCalculadoTotal - PISProporcionalTotal;
  COFINSSuspensoTotal             := COFINSCalculadoTotal - COFINSProporcionalTotal;
  ICMSSuspensoTotal               := ICMSCalculadoTotal - ICMSProporcionalTotal;
  ValorAduaneiroSuspensoTotal     := ValorAduaneiroCalculadoTotal - ValorAduaneiroProporcionalTotal;
  ValorSuspensoTotal              := IISuspensoTotal + IPISuspensoTotal + PISSuspensoTotal + COFINSSuspensoTotal + ICMSSuspensoTotal{ + ValorAduaneiroSuspensoTotal};

  if ValorAduaneiroCalculadoTotal > 0 then
  begin
    ListaAuxMP164.Add('---------------------------------------------------------------');
    Linha := 'DEMONSTRATIVO DO CALCULO DOS TRIBUTOS TOTAIS PROPORCIONAIS PAGOS';
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    // II
    Linha := 'I.I. CALCULADO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IICalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'I.I. PROPORCIONAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IIProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'I.I. SUSPENSO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IISuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    ListaAuxMP164.Add('**************************************************************');

    // IPI
    Linha := 'IPI CALCULADO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IPICalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'IPI PROPORCIONAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IPIProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'IPI SUSPENSO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', IPISuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    ListaAuxMP164.Add('**************************************************************');

    // PIS
    Linha := 'PIS CALCULADO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', PISCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'PIS PROPORCIONAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', PISProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'PIS SUSPENSO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', PISSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    ListaAuxMP164.Add('**************************************************************');

    // COFINS
    Linha := 'COFINS CALCULADO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', COFINSCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'COFINS PROPORCIONAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', COFINSProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'COFINS SUSPENSO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', COFINSSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    ListaAuxMP164.Add('**************************************************************');

    // ICMS
    Linha := 'ICMS CALCULADO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', ICMSCalculadoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'ICMS PROPORCIONAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', ICMSProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    Linha := 'ICMS SUSPENSO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', ICMSSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');

    ListaAuxMP164.Add('**************************************************************');

    // Valor Aduaneiro
    Linha := 'VALOR ADUANEIRO REDUZIDO';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,##0.00', ValorAduaneiroProporcionalTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
    Linha := 'VALOR SUSPENSO TOTAL';
    Linha := LeftStr(Linha + _FILL, 35) + ': R$' + FFloatToMsk('#,###,###,##0.00', ValorSuspensoTotal);
    ListaAuxMP164.Add(Linha + Space(Indice - Length(Linha)) + '|');
  end;


  if ListaAuxMP164.Count > 0 then
    Result := ListaAuxMP164.Text
  else
    Result := '';
end;


procedure Tfrm_DI_capa.Atualiza_Historico_Padrao_Novo;
const
  _LINHAS_REFAZER: array[0..147] of String = ('FATURA PRO-FORMA.', 'REF. REPRESENTANT', 'REF. IMPORTADOR..', 'CONHECIMENTO.....', 'CONHECIMENTO MAST',
                                              'PRESENCA DE CARGA', 'RAZ. SOCIAL TRANS', 'C.N.P.J. TRANSP..', 'CONTEINERES......', 'ESPECIE..........',
                                              'LOCAL DE EMBARQUE', 'VEICULO..........', 'DATA DA CHEGADA..', 'VMLE.............', 'FRETE + SEGURO...',
                                              'VMLE + FRETE + SE', 'TAXA SISCOMEX....', 'ACRÉSCIMOS.......', 'ACR+SCIMOS.......', 'DEDUÇÕES.........',
                                              'TAXA CAMBIAL.....', '-----------------', 'ADICAO...........', 'VALOR ADUANEIRO..', 'VALOR ICMS DEVIDO',
                                              'PIS / PASEP......', 'COFINS ..........', 'PIS / PASEP SUSPE', 'COFINS SUSPENSO..', 'ALIQUOTA PIS.....',
                                              'ALIQUOTA COFINS..', 'I.P.I. ..........', 'I.I. ............', '------------- -- ', 'A.F.R.M.M........',
                                              'BASE PIS / COFINS', 'APLICACAO........', '*****************', 'I.I. CALCULADO'   , 'I.I. PROPORCIONAL',
                                              'I.I. SUSPENSO'    , 'IPI CALCULADO'    , 'IPI PROPORCIONAL ', 'IPI SUSPENSO'     , 'PIS CALCULADO'    ,
                                              'PIS PROPORCIONAL ', 'PIS SUSPENSO'     , 'COFINS CALCULADO ', 'COFINS  PROPORCIO', 'COFINS PROPORCION',
                                              'COFINS SUSPENSO'  , 'ICMS CALCULADO'   , 'ICMS PROPORCIONAL', 'ICMS SUSPENSO'    , 'VALOR ADUANEIRO R',
                                              'VALOR SUSPENSO TO', 'DEMOSTRATIVO DO C', 'DEMONSTRATIVO DO ', 'FECP.............',
                                              // Novos
                                              'DEMONSTRATIVO DE ', 'DEMOSTRATIVO DE C',
                                              'VALOR ICMS ......', 'VALOR ICMS - INTE', 'VALOR ICMS - SUSP', 'VALOR ICMS - ISEN', 'VALOR ICMS - REDU',
                                              'I.I.', //'I.I.  - INTEGRAL ', 'I.I.  - SUSPENSO ', 'I.I.  - ISENTO - ', 'I.I.  - REDUZIDO ',
                                              'I.P.I.', //'I.P.I. - INTEGRAL', 'I.P.I. - SUSPENSO', 'I.P.I. - ISENTO -', 'I.P.I. - REDUZIDO',
                                              'BASE PIS / COFINS', //'PIS / PASEP - SUS', 'COFINS - SUSPENSO', 'COFINS - REDUZIDO',
                                              'PIS / PASEP', 'COFINS', 'VALOR ICMS', 'BASE ICMS',
                                              'FECP (', 'VALOR ADUANEIRO .', 'TAXA SISCOMEX ...', 'VALOR ICMS + AFRM', 'CFOP',
                                              // Incluídos por Michel em 11/04/2013 porque estava saindo coisa errada e duplicada
                                              'FATURA COMERCIAL.', 'REF. REPRESENTANT', 'REF. IMPORTADOR..', 'CONHECIMENTO.....',
                                              'CONHECIMENTO MAST', 'PRESENCA DE CARGA', 'RAZ. SOCIAL TRANS', 'C.N.P.J. TRANSP..',
                                              'CONTEINERES......', 'ESPECIE..........', 'LOCAL DE EMBARQUE', 'VEICULO..........',
                                              'DATA DA CHEGADA..', 'VMLE.............', 'FRETE + SEGURO...', 'VMLE + FRETE + SE',
                                              'TAXA SISCOMEX....', 'ACRÉSCIMOS.......', 'ACR+SCIMOS.......', 'DEDUÇÕES.........',
                                              'TAXA CAMBIAL.....', '-----------------', 'ADICAO...........', 'VALOR ADUANEIRO..',
                                              'VALOR ICMS DEVIDO', 'PIS / PASEP......', 'COFINS ..........', 'PIS / PASEP SUSPE',
                                              'COFINS SUSPENSO..', 'ALIQUOTA PIS.....', 'ALIQUOTA COFINS..', 'I.P.I. ..........',
                                              'I.I. ............', '------------- -- ', 'A.F.R.M.M........', 'BASE PIS / COFINS',
                                              'APLICACAO........', '*****************', 'I.I. CALCULADO',    'I.I. PROPORCIONAL',
                                              'I.I. SUSPENSO',     'IPI CALCULADO',     'IPI PROPORCIONAL ', 'IPI SUSPENSO',
                                              'PIS CALCULADO',     'PIS PROPORCIONAL ', 'PIS SUSPENSO',      'COFINS CALCULADO ',
                                              'COFINS PROPORCION', 'COFINS SUSPENSO',   'ICMS CALCULADO',    'ICMS PROPORCIONAL',
                                              'ICMS SUSPENSO',     'VALOR ADUANEIRO R', 'VALOR SUSPENSO TO', 'DEMOSTRATIVO DO C',
                                              'DEMONSTRATIVO DO C','FECP.............', 'VALOR CAMBIO.....', 'CAMBIO ANTECIPADO',
                                              'CAMBIO A VISTA...', 'PERIODICIDADE CAM', 'CAMBIO VARIAVEL..', 'PLACA DO VEICULO',
                                              'FRETE INTERNACION', 'SEGURO INTERNACIO','VMLE na Moeda....' , 'VALOR ADUANEIRO ........: USD',
                                              'FRETE ...........', 'SEGURO ..........');
  _FILL = '..................................................';

  function TextoExiste(ATexto: String): Boolean;
  var
    Idx: Integer;
  begin
    Idx := 0;
    Result := False;
    while (Idx <= High(_LINHAS_REFAZER)) and not Result do
      if CompareText(Copy(ATexto, 1, Length(_LINHAS_REFAZER[Idx])), _LINHAS_REFAZER[Idx]) = 0 then
        Result := True
      else
        Inc(Idx);
  end;

var
  tx_inf_compl,
  cTexto1{Guarda texto estante para análise},
  cTexto2{Linha(texto) completa}        : AnsiString;
  cTexto{Linha(texto) com 17 caracteres}: string;
  cData1, servico, vURF, vTexto         : string;
  Linha                                 : String;
  npos, npos1, n                        : integer;
  i, indice                             : Byte;
  vCapatazia                            : Real;
  vEscreverLinha                        : Boolean;
  vQryInstEmb                           : TQuery;
  str_valor_aduaneiro,
  str_valor_ii, str_valor_ipi,
  str_taxa_siscomex, str_valor_icms,
  str_icms_calculado,
  str_base_icms,
  str_valor_icms_afrmm,
  str_valor_afrmm,
  str_valor_base_pis_cofins,
  str_valor_pis, str_valor_cofins,
  str_pc_fecp, str_valor_aduaneiroUSD  : String;
  str_valor_frete_moeda, str_valor_frete, str_moeda_frete,
  str_valor_seguro_moeda, str_valor_seguro, str_moeda_seguro: String;
  valor_aduaneiro: Double;
  base_icms: Double;
  valor_icms_afrmm: Double;
  icms_calculado: Double;
  valor_afrmm: Double;
  valor_base_pis_cofins: Double;
  valor_pis: Double;
  valor_cofins, vl_tx_dolar: Double;
  cd_grupo: String;
  sSql : String;
begin
  //abre query que verifica os documentos da instrução de embarque
  vQryInstEmb := TQuery.Create(application);
  try
    vQryInstEmb.DataBaseName := 'DBBROKER';
    vQryInstEmb.Close;
    vQryInstEmb.SQL.Clear;
    vQryInstEmb.SQL.text := ' SELECT TX_DECL_ADIC                            ' + sLineBreak +
                            '   FROM TDOC_INSTRUCAO_DESPACHO (NOLOCK)        ' + sLineBreak +
                            '  WHERE CODIGO NOT IN (''01'', ''17'', ''28'')  ' + sLineBreak +
                            '  ORDER BY DESCRICAO                            ' + sLineBreak ;
    vQryInstEmb.Open;

    if in_DI_Registrada or not (datm_DI_capa.qry_di_.State in [dsEdit,dsInsert]) then
      Exit;

    indice := 68;
    tx_inf_compl := '';
    if (dbmemo_info_complementares.Text = '') or (pgctrl_capa_di.ActivePage <> tbsht_informacoes_complementares) then
      {Pega texto gravado no banco}
      cTexto1 := datm_DI_capa.qry_di_TX_INFO_COMPL.AsString
    else
      {Pega texto do campo da tela}
      cTexto1 := dbmemo_info_complementares.Text;

    {Tira caracteres Nulos(#0), pois não é aceito na string list}
    npos := Length(cTexto1);
    if npos > 0 then
    begin
      cTexto2 := '';
      n := 1;
      while n <= npos do
      begin
        if cTexto1[n] <> #0 then
          cTexto2 := cTexto2 + cTexto1[n];
        Inc(n);
      end;
      cTexto1 := cTexto2;
    end;
    npos := Length(cTexto1);

    vAFRMMencontrado := '';
    {Varre todo o texto, e reescreve os textos 'Fixos'(Diferentes daqueles que estão no array: _LINHAS_REFAZER)}
    while npos > 0 do
    begin

      npos := Pos(#13, cTexto1);

      {Verifica se tem próxima linha}
      if npos > 0 then
      begin
         {Pega a primeira linha}
         cTexto2 := Copy(cTexto1, 1, (npos + 1));
         {Guarda o restante do texto}
         cTexto1 := Copy(cTexto1, (npos + 1), (Length(cTexto1) - npos));
      end
      else
      begin
        cTexto2 := cTexto1;
        cTexto1 := '';
      end;

      if Copy(cTexto1, 1, 1) = #10 then
        Delete(cTexto1, 1, 1);

      {Valida Linha, Inicio}
      npos := Length(cTexto2);
      if npos < 17 then
        cTexto := Copy (cTexto2, 1, npos)
      else
        cTexto := Copy (cTexto2, 1, 17);

      if (cTexto = 'CONHECIMENTO MAST') then
      begin
        {Pega a Data no campo cData1}
        npos1 := Pos('DATA..:', cTexto2);
        if npos1 > 0 then
          cData1 := Copy (cTexto2, npos1 + 7 , (Length(cTexto2) - npos1 - 9))
        else
          cData1 := '';
      end;
      if (cTexto = 'A.F.R.M.M........') then
        vAFRMMencontrado := 'A.F.R.M.M...............: R$ ';

      // Substituir os textos antigos pelos novos - Michel - 25/05/2009 - Ocorrência 09274/09
      {Utilizado em D.I. antiga ...}
      if (cTexto = 'NOSSA REFERENCIA.') then
        cTexto := 'REF. REPRESENTANT'
      else if (cTexto = 'REF.IMPORTADOR...') then
        cTexto := 'REF. IMPORTADOR..'
      else if (cTexto = 'VALOR VA.........') then
        cTexto := 'VALOR ADUANEIRO..';

      //verifica se linha não é linha incluída automaticamente da Instrução de Embarque, se for não escreve agora para atualizar daqui a pouco...
      vEscreverLinha := True;
      vQryInstEmb.First;
      while not vQryInstEmb.Eof do
      begin
        if CompareText(cTexto, Copy(vQryInstEmb.Fields[0].AsString, 1, 17)) = 0 then
        begin
          vEscreverLinha := False;
          Break;
        end;
        vQryInstEmb.Next;
      end;

      if ((Copy(str_nr_processo, 5, 2) = 'IE') and (cd_servico = '016')) then
      begin
        {Alimenta campo tx_inf_compl(texto) se o cTexto não existir na lista no inicio da função 'Reescreve'}
        if (not TextoExiste(cTexto)) and vEscreverLinha and ((tx_inf_compl <> '') or (cTexto2 <> #13#10)) then
          tx_inf_compl := tx_inf_compl + cTexto2;
      end
      else
      begin
        if (not TextoExiste(cTexto)) and vEscreverLinha and ((tx_inf_compl <> '') or (cTexto2 <> #13#10)) then
            tx_inf_compl := tx_inf_compl + cTexto2;
      end;
    end;
    {Fim - validação do texto(nome dos despachantes)}

    while (Copy(tx_inf_compl, Length(tx_inf_compl)-1, 2) = #$D#$A) do
    begin
      Delete(tx_inf_compl, Length(tx_inf_compl)-1, 2);
    end;

    {Próxima linha para os próximos textos}
    if (Copy(tx_inf_compl, Length(tx_inf_compl)-1, 2) <> #13#10) and (Length(tx_inf_compl) <> 0) AND
       (Copy(tx_inf_compl, Length(tx_inf_compl)-1, 2) <> #$D#$A)  then
      tx_inf_compl := tx_inf_compl + #13#10 + #13#10;

    vURF := datm_DI_Capa.qry_di_CD_URF_ENTR_CARGA.AsString;

    if (str_hist_fatura <> '') then
    begin
      servico := '';
      datm_DI_capa.qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_capa.qry_processo_.Open;
      servico := datm_DI_capa.qry_processo_CD_SERVICO.AsString;
      datm_DI_capa.qry_processo_.Close;

      { by Carlos em 15/06/2010 - Tentativa em evitar a duplicação da fatura }
      if Pos(str_hist_fatura, tx_inf_compl) = 0 then
      begin
         if (Copy(str_nr_processo, 5, 2) = 'IE') and (servico = '016') then
           tx_inf_compl := tx_inf_compl + 'FATURA PRO-FORMA........: ' + str_hist_fatura + Space(indice - Length('FATURA PRO-FORMA........: ' + str_hist_fatura)) + '|' + #13#10
         else
           tx_inf_compl := tx_inf_compl + 'FATURA COMERCIAL........: ' + str_hist_fatura + Space(indice - Length('FATURA COMERCIAL........: ' + str_hist_fatura)) + '|' + #13#10;
      end;
    end;

    //documentos preenchidos na tela de Instrução de Embarque
    vQryInstEmb.Close;
    vQryInstEmb.SQL.Clear;
    vQryInstEmb.SQL.text := ' SELECT ISNULL(DID.TX_DECL_ADIC, ''''), ISNULL(NR_DCTO_INSTRUCAO, '''')                ' + sLineBreak +
                            '   FROM TDOCUMENTO_INSTRUCAO         I   (NOLOCK)                                      ' + sLineBreak +
                            '  INNER JOIN TDOC_INSTRUCAO_DESPACHO DID (NOLOCK) ON DID.CODIGO = I.CD_TIPO_DCTO_INSTR ' + sLineBreak +
                            '  WHERE I.NR_PROCESSO = '+QuotedStr(str_nr_processo)+'                                 ' + sLineBreak +
                            '    AND DID.CODIGO NOT IN (''01'', ''17'', ''28'')                                     ' + sLineBreak +
                            ' ORDER BY DID.TX_DECL_ADIC                                                             ' + sLineBreak ;
    vQryInstEmb.Open;
    while not vQryInstEmb.Eof do
    begin
      tx_inf_compl := tx_inf_compl + vQryInstEmb.Fields[0].AsString + ': ' + vQryInstEmb.Fields[1].AsString + Space(indice - Length(vQryInstEmb.Fields[0].AsString + ': ' + vQryInstEmb.Fields[1].AsString)) + '|' + #13#10;

      vQryInstEmb.Next;
    end;
    vQryInstEmb.Close;

    if (str_hist_n_ref <> '') then
      tx_inf_compl := tx_inf_compl + 'REF. REPRESENTANTE......: ' + str_hist_n_ref + Space(indice - Length('REF. REPRESENTANTE......: ' + str_hist_n_ref)) + '|' + #13#10;
    if (str_hist_s_ref <> '') then
      tx_inf_compl := tx_inf_compl + 'REF. IMPORTADOR.........: ' + str_hist_s_ref + Space(indice - Length('REF. IMPORTADOR.........: ' + str_hist_s_ref)) + '|' + #13#10;
    if str_hist_conh <> '' then
      tx_inf_compl := tx_inf_compl + 'CONHECIMENTO............: ' + str_hist_conh  + '  DATA..:' + str_hist_dt_emb + Space(indice - Length('CONHECIMENTO............: ' + str_hist_conh    + '  DATA..:' + str_hist_dt_emb)) + '|' + #13#10;
    if str_hist_conh_m <> '' then
      tx_inf_compl := tx_inf_compl + 'CONHECIMENTO MASTER.....: ' + str_hist_conh_m + '  DATA..:' + cData1 + Space(indice - Length('CONHECIMENTO MASTER.....: ' + str_hist_conh_m  + '  DATA..:' + cData1)) + '|' + #13#10;
    if (str_hist_pcarga <> '') then
      tx_inf_compl := tx_inf_compl + 'PRESENCA DE CARGA.......: ' + str_hist_pcarga + Space(indice - Length('PRESENCA DE CARGA.......: ' + str_hist_pcarga)) + '|' + #13#10;
    if (str_nm_transp <> '') then
      tx_inf_compl := tx_inf_compl + 'RAZ. SOCIAL TRANSP......: ' + str_nm_transp + Space(indice - Length('RAZ. SOCIAL TRANSP......: ' + str_nm_transp)) + '|' + #13#10;
    if (str_cnpj_transp <> '') then
      tx_inf_compl := tx_inf_compl + 'C.N.P.J. TRANSP.........: ' + str_cnpj_transp + Space(indice - Length('C.N.P.J. TRANSP.........: ' + str_cnpj_transp)) + '|' + #13#10;
    {if str_hist_cntr <> '' then
      tx_inf_compl := tx_inf_compl + 'CONTEINERES.............: ' + str_hist_cntr + Space(indice - Length('CONTEINERES.............: ' + str_hist_cntr)) + '|' + #13#10;}
    if str_hist_cntr <> '' then
      tx_inf_compl := tx_inf_compl + 'CONTEINERES.............: ' + str_hist_cntr + #13#10;
    if (str_hist_especie <> '') then
      tx_inf_compl := tx_inf_compl + 'ESPECIE.................: ' + str_hist_especie + Space(indice - Length('ESPECIE.................: ' + str_hist_especie)) + '|' + #13#10;
    if (str_hist_loc_emb <> '') then
      tx_inf_compl := tx_inf_compl + 'LOCAL DE EMBARQUE.......: ' + str_hist_loc_emb + Space(indice - Length('LOCAL DE EMBARQUE.......: ' + str_hist_loc_emb)) + '|' + #13#10;
    if (str_hist_veiculo <> '') then
      tx_inf_compl := tx_inf_compl + 'VEICULO.................: ' + str_hist_veiculo + Space(indice - Length('VEICULO.................: ' + str_hist_veiculo)) + '|' + #13#10;
    if (Trim(str_hist_placa_veiculo) <> '') then
      tx_inf_compl := tx_inf_compl + 'PLACA DO VEICULO........: ' + str_hist_placa_veiculo + Space(indice - Length('PLACA DO VEICULO........: ' + str_hist_placa_veiculo)) + '|' + #13#10;
    if (Trim(str_hist_dt_cheg) <> '') then
      tx_inf_compl := tx_inf_compl + 'DATA DA CHEGADA.........: ' + str_hist_dt_cheg + Space(indice - Length('DATA DA CHEGADA.........: ' + str_hist_dt_cheg)) + '|' + #13#10;
   {
    if (str_hist_vmle <> '') then
      tx_inf_compl := tx_inf_compl + 'VMLE....................: ' + str_hist_vmle + Space(indice - Length('VMLE....................: ' + str_hist_vmle)) + '|' + #13#10;

   if (str_hist_fr_seg <> '') then
      tx_inf_compl := tx_inf_compl + 'FRETE + SEGURO..........: ' + str_hist_fr_seg + Space(indice - Length('FRETE + SEGURO..........: ' + str_hist_fr_seg)) + '|' + #13#10;
    if (str_hist_cif <> '') then
      tx_inf_compl := tx_inf_compl + 'VMLE + FRETE + SEGURO...: ' + str_hist_cif + Space(indice - Length('VMLE + FRETE + SEGURO...: ' + str_hist_cif)) + '|' + #13#10;
    if (str_tx_siscomex <> '') then
      tx_inf_compl := tx_inf_compl + 'TAXA SISCOMEX...........: ' + str_tx_siscomex + Space(indice - Length('TAXA SISCOMEX...........: ' + str_tx_siscomex)) +'|'+ #13#10;
    if (dbl_acrescimo > 0) then
      tx_inf_compl := tx_inf_compl + 'ACRÉSCIMOS..............: ' + str_vl_acrescimo + Space(indice - Length('ACRÉSCIMOS..............: ' + str_vl_acrescimo)) + '|' + #13#10;
    if (dbl_deducao > 0) then
      tx_inf_compl := tx_inf_compl + 'DEDUÇÕES................: ' + str_vl_deducao + Space(indice - Length('DEDUÇÕES................: ' + str_vl_deducao)) + '|' + #13#10;
    }

    {Próxima linha para os próximos textos}
    while (Copy(tx_inf_compl, Length(tx_inf_compl)-1, 2) = #13#10) and (Length(tx_inf_compl) <> 0)  do
    begin
      tx_inf_compl := Copy(tx_inf_compl, 1, Length(tx_inf_compl)-2)
    end;

    tx_inf_compl := tx_inf_compl + #13#10 + #13#10 + 'DEMONSTRATIVO DE CÁLCULOS' + Space(indice - Length('DEMONSTRATIVO DE CÁLCULOS')) + '|' + #13#10;
    if (dbl_acrescimo > 0) then
      tx_inf_compl := tx_inf_compl   + 'ACRÉSCIMOS..............: ' + str_vl_acrescimo + Space(indice - Length('ACRÉSCIMOS..............: ' + str_vl_acrescimo)) + '|' + #13#10;

    for i := 1 to 10 do
    begin
      if str_hist_taxa[i]  <> '' then
        tx_inf_compl := tx_inf_compl + 'TAXA CAMBIAL............:    ' + str_hist_taxa[i] + Space(indice - Length('TAXA CAMBIAL............:    ' + str_hist_taxa[i])) + '|' + #13#10
      else
        Break;
    end;

    if datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString <> '' then
    if (str_hist_vmle_moeda <> '') then
        tx_inf_compl := tx_inf_compl   + 'VMLE na Moeda...........: ' + str_hist_vmle_moeda + '(220)' +//'(' + datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString + ')' +
                                       Space(indice - Length('VMLE na Moeda...........: ' + str_hist_vmle_moeda+ '(220)')) +//'(' + datm_DI_Capa.qry_di_CD_MOEDA_MLE.AsString + ')')) +
                                        '|' + #13#10;   {Leandro - 06/12/19 - O valor do campo str_hist_vmle_moeda está sempre pegando o valor de dolar, então não tem pq imprimir outro código de moeda }

    if (str_hist_vmle <> '') then
      tx_inf_compl := tx_inf_compl   + 'VMLE....................: ' + str_hist_vmle + Space(indice - Length('VMLE....................: ' + str_hist_vmle)) + '|' + #13#10;


    vQryInstEmb.Close;
    vQryInstEmb.SQL.Clear;
          sSql := 'SELECT --DI.IN_CALCULOU_COM_AFRMM,                                                                                 '+ sLineBreak +
                  '       ISNULL(EN.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_CALCULOU_COM_AFRMM,                   '+ sLineBreak +
                  '       SUM(ISNULL(II.VL_BASE_CALC_ADVAL, 0))                           AS VL_ADUANEIRO,                            '+ sLineBreak +
                  '       SUM(ISNULL(AI.VL_BASE_PIS, 0))                                  AS VL_BASE_PIS_COFINS,                      '+ sLineBreak +
                  '       SUM(ISNULL(AI.VL_PIS, 0))                                       AS VL_PIS,                                  '+ sLineBreak +
                  '       SUM(ISNULL(AI.VL_COFINS, 0))                                    AS VL_COFINS,                               '+ sLineBreak +
                  '       SUM(AI.VL_BASE_CALC_ICMS)                                       AS VL_BASE_CALC_ICMS,                       '+ sLineBreak +
                  '       SUM(AI.VL_BASE_CALC_ICMS_AFRMM)                                 AS VL_BASE_CALC_ICMS_AFRMM,                 '+ sLineBreak +
                  '       SUM(AI.VL_ICMS_A_RECOLHER_AFRMM)                                AS VL_ICMS_A_RECOLHER_AFRMM,                '+ sLineBreak +
                  '     --SUM(ROUND((AI.VL_BASE_CALC_ICMS_AFRMM - AI.VL_BASE_CALC_ICMS) * (1 - (AI.PC_ICMS / 100)), 2)) AS VL_AFRMM,  '+ sLineBreak +
                  '       SUM(AI.VL_AFRMM)                                                AS VL_AFRMM,                                '+ sLineBreak +
                  '       PR.PC_FUNDO_POBREZA_RJ                                          AS PC_FECP,                                 '+ sLineBreak +
                  '       AI.PC_ICMS                                                      AS PC_ICMS,                                 '+ sLineBreak +
                  '       G.CD_GRUPO                                                      AS CD_GRUPO,                                '+ sLineBreak +
                  '       SUM(ROUND(CASE ISNULL(AI.IN_FUNDO_POBREZA, "0")                                                             '+ sLineBreak ;
    if in_afrmm = '1' then
      sSql := sSql+
                  '                      WHEN "1" THEN (AI.VL_BASE_CALC_ICMS_AFRMM * PR.PC_FUNDO_POBREZA_RJ) / 100                    '+ sLineBreak
    else
      sSql := sSql+
                  '                      WHEN "1" THEN (AI.VL_BASE_CALC_ICMS * PR.PC_FUNDO_POBREZA_RJ) / 100                          '+ sLineBreak ;
    sSql := sSql+
                  '                      ELSE 0                                                                                       '+ sLineBreak +
                  '                 END, 2))                                              AS VL_FECP,                                 '+ sLineBreak +
                  '       DI.TX_DOLAR                                                     AS TX_DOLAR                                 '+ sLineBreak +
                  '    FROM TDECLARACAO_IMPORTACAO DI (NOLOCK)                                                                        '+ sLineBreak +
                  '   INNER JOIN TADICAO_DE_IMPORTACAO AI    (NOLOCK) ON AI.NR_PROCESSO          = DI.NR_PROCESSO                     '+ sLineBreak +
                  '   LEFT  JOIN TRIBUTO               II    (NOLOCK) ON II.NR_PROCESSO          = AI.NR_PROCESSO                     '+ sLineBreak +
                  '                                                  AND II.NR_ADICAO            = AI.NR_ADICAO                       '+ sLineBreak +
                  '                                                  AND II.CD_RECEITA_IMPOSTO   = ''0001''                           '+ sLineBreak +
                  '   LEFT  JOIN TRIBUTO               IPI   (NOLOCK) ON IPI.NR_PROCESSO         = AI.NR_PROCESSO                     '+ sLineBreak +
                  '                                                  AND IPI.NR_ADICAO           = AI.NR_ADICAO                       '+ sLineBreak +
                  '                                                  AND IPI.CD_RECEITA_IMPOSTO  = ''0002''                           '+ sLineBreak +
                  '   LEFT  JOIN TPROCESSO             P     (NOLOCK) ON P.NR_PROCESSO           = DI.NR_PROCESSO                     '+ sLineBreak +
                  '   LEFT  JOIN TEMPRESA_NAC          EN    (NOLOCK) ON EN.CD_EMPRESA           = P.CD_CLIENTE                       '+ sLineBreak +
                  '   LEFT  JOIN TGRUPO                G     (NOLOCK) ON G.CD_GRUPO              = EN.CD_GRUPO,                       '+ sLineBreak +
                  '              TPARAMETROS           PR    (NOLOCK)                                                                 '+ sLineBreak +
                  ' WHERE AI.NR_PROCESSO = :NR_PROCESSO                                                                               '+ sLineBreak +
                  ' GROUP BY ISNULL(EN.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS),                                         '+ sLineBreak +
                  '          PR.PC_FUNDO_POBREZA_RJ, AI.PC_ICMS , DI.TX_DOLAR , G.CD_GRUPO                                            '+ sLineBreak ;

    vQryInstEmb.SQL.Text :=  sSql;
    vQryInstEmb.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    vQryInstEmb.Open;

    valor_aduaneiro        := 0;
    base_icms              := 0;
    valor_icms_afrmm       := 0;
    icms_calculado         := 0;
    valor_afrmm            := 0;
    valor_base_pis_cofins  := 0;
    valor_pis              := 0;
    valor_cofins           := 0;
    cd_grupo               := vQryInstEmb.FieldByName('CD_GRUPO').AsString;
    while not vQryInstEmb.Eof do
    begin
      valor_aduaneiro := valor_aduaneiro + vQryInstEmb.FieldByName('VL_ADUANEIRO').AsFloat;

      if in_afrmm = '1' then
        base_icms := base_icms + vQryInstEmb.FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat
      else
        base_icms := base_icms +vQryInstEmb.FieldByName('VL_BASE_CALC_ICMS').AsFloat;

      valor_icms_afrmm      := valor_icms_afrmm       + vQryInstEmb.FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat;
      icms_calculado        := icms_calculado         + vQryInstEmb.FieldByName('VL_BASE_CALC_ICMS').AsFloat * (vQryInstEmb.FieldByName('PC_ICMS').AsFloat/100);
      valor_afrmm           := valor_afrmm            + vQryInstEmb.FieldByName('VL_AFRMM').AsFloat;
      valor_base_pis_cofins := valor_base_pis_cofins  + vQryInstEmb.FieldByName('VL_BASE_PIS_COFINS').AsFloat;
      valor_pis             := valor_pis              + vQryInstEmb.FieldByName('VL_PIS').AsFloat;
      valor_cofins          := valor_cofins           + vQryInstEmb.FieldByName('VL_COFINS').AsFloat;
      vl_tx_dolar           := vQryInstEmb.FieldByName('TX_DOLAR').AsFloat;
      vQryInstEmb.Next;
    end;

    if vl_tx_dolar = 0 then
      vl_tx_dolar := 1;

    str_valor_aduaneiroUSD    := FFloatToMsk ('#,###,###,##0.00', (valor_aduaneiro / vl_tx_dolar));
    str_valor_aduaneiro       := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_aduaneiro);
    str_valor_ii              := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_VL_TOTAL_II.AsFloat);
    str_valor_ipi             := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_VL_TOTAL_IPI.AsFloat);
    str_taxa_siscomex         := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_VL_TOTAL_TX_SCX.AsFloat);
    str_valor_icms            := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_VL_TOT_ICMS.AsFloat);
    in_afrmm                  := vQryInstEmb.FieldByName('IN_CALCULOU_COM_AFRMM').AsString;
    str_base_icms             := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', base_icms);
    str_valor_icms_afrmm      := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_icms_afrmm);
    str_icms_calculado        := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', icms_calculado);
    str_valor_afrmm           := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_afrmm);
    str_valor_base_pis_cofins := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_base_pis_cofins);
    str_valor_pis             := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_pis);
    str_valor_cofins          := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', valor_cofins);
    str_pc_fecp               := FFloatToMsk ('#0.00', vQryInstEmb.FieldByName('PC_FECP').AsFloat) + '%';

    tx_inf_compl := tx_inf_compl + 'VALOR ADUANEIRO ........: '     + str_valor_aduaneiro + Space(indice - Length('VALOR ADUANEIRO ........: ' + str_valor_aduaneiro)) + '|' + #13#10;
    tx_inf_compl := tx_inf_compl + 'VALOR ADUANEIRO ........: USD ' + str_valor_aduaneiroUSD + Space(indice - Length('VALOR ADUANEIRO ........: USD ' + str_valor_aduaneiroUSD)) + '|' + #13#10;

    if cd_grupo = 'C84' then
    begin
      str_valor_frete_moeda      := FFloatToMsk ('#,###,###,##0.00', (datm_DI_Capa.qry_di_VL_TOTAL_FRETE_MN.AsFloat / datm_DI_Capa.qry_di_TX_FRETE.AsFloat));
      str_valor_frete          := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_VL_TOTAL_FRETE_MN.AsFloat);
      str_moeda_frete          := datm_DI_Capa.qry_di_CD_MOEDA_FRETE.AsString; //qry_di_CD_MOEDA_FRETE.AsString
      str_valor_seguro_moeda     := FFloatToMsk ('#,###,###,##0.00', (datm_DI_Capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat));
      str_valor_seguro         := 'R$  ' + FFloatToMsk ('#,###,###,##0.00', datm_DI_Capa.qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat);
      str_moeda_seguro         := datm_DI_Capa.qry_di_CD_MOEDA_SEGURO.AsString; //qry_di_CD_MOEDA_SEGURO.AsString

      tx_inf_compl := tx_inf_compl + 'FRETE ..................: '     + str_valor_frete + Space(indice - Length('FRETE ..................: ' + str_valor_frete)) + '|' + #13#10;
      tx_inf_compl := tx_inf_compl + 'FRETE ..................: '     +str_moeda_frete+' ' + str_valor_frete_moeda + Space(indice - Length('FRETE ..................: '+str_moeda_frete+' ' + str_valor_frete_moeda)) + '|' + #13#10;

      tx_inf_compl := tx_inf_compl + 'SEGURO .................: '     + str_valor_seguro + Space(indice - Length('SEGURO .................: ' + str_valor_seguro)) + '|' + #13#10;
      tx_inf_compl := tx_inf_compl + 'SEGURO .................: '     +str_moeda_seguro+' ' + str_valor_seguro_moeda + Space(indice - Length('SEGURO .................: '+str_moeda_seguro+' ' + str_valor_seguro_moeda)) + '|' + #13#10;
    end;

    tx_inf_compl := tx_inf_compl + 'I.I. ...................: ' + str_valor_ii + Space(indice - Length('I.I. ...................: ' + str_valor_ii)) + '|' + #13#10;
    tx_inf_compl := tx_inf_compl + 'I.P.I. .................: ' + str_valor_ipi + Space(indice - Length('I.P.I. .................: ' + str_valor_ipi)) + '|' + #13#10;
    tx_inf_compl := tx_inf_compl + 'TAXA SISCOMEX ..........: ' + str_taxa_siscomex + Space(indice - Length('TAXA SISCOMEX ..........: ' + str_taxa_siscomex)) + '|' + #13#10;
    //tx_inf_compl := tx_inf_compl + 'VALOR ICMS .............: ' + str_valor_icms + Space(indice - Length('VALOR ICMS .............: ' + str_valor_icms)) + '|' + #13#10;

    tx_inf_compl := tx_inf_compl + 'BASE ICMS ..............: ' + str_base_icms + Space(indice - Length('BASE ICMS ..............: ' + str_base_icms)) + '|' + #13#10;

    if Trim(in_afrmm) = '1' then
      tx_inf_compl := tx_inf_compl + 'VALOR ICMS .............: ' + str_valor_icms_afrmm + Space(indice - Length('VALOR ICMS .............: ' + str_valor_icms_afrmm)) + '|' + #13#10
    else
      tx_inf_compl := tx_inf_compl + 'VALOR ICMS .............: ' + str_valor_icms + Space(indice - Length('VALOR ICMS .............: ' + str_valor_icms)) + '|' + #13#10;

    tx_inf_compl := tx_inf_compl + 'ICMS CALCULADO .........: ' + str_icms_calculado + Space(indice - Length('ICMS CALCULADO .........: ' + str_icms_calculado)) + '|' + #13#10;

    if (Trim(in_afrmm) = '1') and (vQryInstEmb.FieldByName('VL_AFRMM').AsFloat > 0) then
      tx_inf_compl := tx_inf_compl + 'A.F.R.M.M...............: ' + str_valor_afrmm + Space(indice - Length('A.F.R.M.M...............: ' + str_valor_afrmm)) + '|' + #13#10;

    if vQryInstEmb.FieldByName('VL_FECP').AsFloat > 0 then
    begin
      Linha := LeftStr('FECP (' + str_pc_fecp + ') ' + _FILL, 24) + ': R$ ' + FFloatToMsk ('#,###,###,##0.00', vQryInstEmb.FieldByName('VL_FECP').AsFloat);
      tx_inf_compl := tx_inf_compl + Linha + Space(indice - Length(Linha)) + '|' + #13#10;
    end;
    tx_inf_compl := tx_inf_compl + 'BASE PIS / COFINS ......: ' + str_valor_base_pis_cofins + Space(indice - Length('BASE PIS / COFINS ......: ' + str_valor_base_pis_cofins)) + '|' + #13#10;
    tx_inf_compl := tx_inf_compl + 'PIS / PASEP ............: ' + str_valor_pis + Space(indice - Length('PIS / PASEP ............: ' + str_valor_pis)) + '|' + #13#10;
    tx_inf_compl := tx_inf_compl + 'COFINS .................: ' + str_valor_cofins + Space(indice - Length('COFINS .................: ' + str_valor_cofins)) + '|' + #13#10;

    tx_inf_compl := tx_inf_compl + HistoricoMP164_Novo;

    datm_DI_Capa.qry_di_TX_INFO_COMPL.AsString := StringReplace(tx_inf_compl, '|', ' ', [rfReplaceAll]);
  finally
    vQryInstEmb.Free;
  end;
end;

procedure Tfrm_DI_capa.btnExcluirDEClick(Sender: TObject);
begin
  if not datm_DI_Capa.qry_DE_DI.Eof then
    if MessageDlg('Deseja realmente excluir a DE ' + datm_DI_Capa.qry_DE_DINR_DE_MERCOSUL.AsString + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      datm_DI_Capa.qry_DE_DI.Delete;
end;

procedure Tfrm_DI_capa.btnObsAutomaticaClick(Sender: TObject);
var
  TxObsAutomatica : String;
begin
  CloseStoredProc(datm_DI_Capa.sp_observacoes_di_regras);
  datm_DI_Capa.sp_observacoes_di_regras.StoredProcName := 'dbo.sp_observacoes_di_regras';
  datm_DI_Capa.sp_observacoes_di_regras.ParamByName('@NR_PROCESSO').ParamType := ptInput;
  datm_DI_Capa.sp_observacoes_di_regras.ParamByName('@NR_PROCESSO').DataType  := ftString;
  datm_DI_Capa.sp_observacoes_di_regras.ParamByName('@NR_PROCESSO').AsString  := str_nr_processo;
  datm_DI_Capa.cdssp_observacoes_di_regras.Close;
  datm_DI_Capa.cdssp_observacoes_di_regras.FetchParams;
  datm_DI_Capa.cdssp_observacoes_di_regras.Params.ParamByName('@NR_PROCESSO').ASsTRING := str_nr_processo;
  datm_DI_Capa.cdssp_observacoes_di_regras.Open;

  datm_DI_Capa.cdssp_observacoes_di_regras.first;
  while not datm_DI_Capa.cdssp_observacoes_di_regras.eof do
  begin

    TxObsAutomatica := TxObsAutomatica +
                       datm_DI_Capa.cdssp_observacoes_di_regras.FieldByName('TX_OBS').asstring + slinebreak;
    datm_DI_Capa.cdssp_observacoes_di_regras.next;
  end;
  if Not ( datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] ) then
    datm_DI_Capa.qry_di_.edit;

  datm_DI_Capa.qry_di_TX_INFO_COMPL_AUTO.AsString := TxObsAutomatica;

  CloseStoredProc(datm_DI_Capa.sp_observacoes_di_regras);
  datm_DI_Capa.cdssp_observacoes_di_regras.close;
end;

procedure Tfrm_DI_capa.dbmemo_info_complementaresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Not ( ( in_di_abrindo or in_DI_Registrada or in_calculo ) or
           Not ( datm_DI_capa.qry_di_.State in [dsEdit,dsInsert] ) ) then
  begin
    datm_DI_Capa.qry_di_.Edit;
  end;
end;


procedure Tfrm_DI_capa.btnLimparClick(Sender: TObject);
begin
  if Not ( datm_DI_Capa.qry_di_.State in [dsInsert, dsEdit] ) then
    datm_DI_Capa.qry_di_.edit;

  datm_DI_Capa.qry_di_TX_INFO_COMPL_AUTO.AsString := '';
end;

function Tfrm_DI_capa.GrupoPrometeon(Grupo : String) : Boolean;
begin
  result := Grupo = 'C11';
end;

function Tfrm_DI_capa.ValidarVinculacao(const pNr_processo : string) : Boolean;
var
  vqryAdicoes: TQuery;
  vMensagem: String;
begin
  vMensagem :=  'Não foi possível continuar o cálculo da Di, '+#13#10+
                'pois está cadastrado "Sem vinculação" no campo "Vinculação entre o comprador e o vendedor", '+#13#10+
                'porém foi encontrado no exportador o mesmo nome do importador. '+#13#10+
                'Verifique! Caso esteja correto, peça para um supervisor realizar o cálculo! ';
  Result := true;

  if datm_DI_Capa.qry_di_CD_VINC_IMPO_EXPO.AsString = '4' then
  begin
    ShowMessage('Favor selecionar uma opção de "Vinculação entre o comprador e o vendedor".');
    result := false;
    Exit;
  end;

  if CompararNomesVinculacao(datm_DI_Capa.qry_di_Look_Importador.AsString, datm_DI_Capa.qry_di_LookExportador.AsString) and
     not (strToInt(datm_DI_Capa.qry_di_CD_VINC_IMPO_EXPO.AsString) in [2, 3]) then
  begin
    ShowMessage(vMensagem);
    result := (str_cd_cargo = '001'); //Permitir calcular apenas se for supervisor.
    Exit;
  end;

  vqryAdicoes := TQuery.Create(Application);
  try
    vqryAdicoes.DatabaseName := 'DBBROKER';
    vqryAdicoes.SQL.Clear;
    vqryAdicoes.SQL.Add('SELECT  CD_VINC_IMPO_EXPO, EXPO.NM_EMPRESA FROM TADICAO_DE_IMPORTACAO AD');
    vqryAdicoes.SQL.Add('LEFT JOIN TEMPRESA_EST EXPO ON EXPO.CD_EMPRESA = AD.CD_FORNECEDOR');
    vqryAdicoes.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
    vqryAdicoes.ParamByName('NR_PROCESSO').Asstring := pNr_processo;
    vqryAdicoes.Open;

    while not vqryAdicoes.EOF do
    begin
      if CompararNomesVinculacao(datm_DI_Capa.qry_di_Look_Importador.AsString, vqryAdicoes.FieldByName('NM_EMPRESA').AsString) and
         not (StrToInt(vqryAdicoes.FieldByName('CD_VINC_IMPO_EXPO').AsString) in [2, 3]) then
      begin
        ShowMessage(vMensagem);
        result := (str_cd_cargo = '001');
        Exit;
      end;
      vqryAdicoes.Next;
    end;
  finally
    vqryAdicoes.Free;
  end;
end;

function Tfrm_DI_capa.CompararNomesVinculacao(nomeImportador, NomeExportador : string) : Boolean;
var
  PartesNomeImportador: TStringList;
begin
  result := False;

  PartesNomeImportador := TStringList.Create;
  try
    ExtractStrings([' '], [], PChar(nomeImportador), PartesNomeImportador);
    if Pos(UpperCase(PartesNomeImportador[0]), UpperCase(NomeExportador)) > 0 then
      result := True;
  finally
    PartesNomeImportador.Free;
  end;
end;

procedure Tfrm_DI_capa.dbedt_cd_importador2Change(Sender: TObject);
begin
  PreencheCodOpeEstrangeiros;
end;

procedure Tfrm_DI_capa.btnEnvioDuimpClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso := str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' TransmissaoDuimp ' + vNrProcesso), PChar(Pasta), SW_SHOW);
end;

end.


