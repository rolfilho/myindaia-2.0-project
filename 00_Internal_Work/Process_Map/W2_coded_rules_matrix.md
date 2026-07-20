# W2 — Coded rules: routine→table matrix and hardcoded literals

**Generated deterministically** by regex over the T-SQL bodies (parsed with Python's `csv` module). 
Nothing here is an LLM's paraphrase of what a routine *probably* does — every row is a pattern match with its source. 
Interpretation of each rule's business meaning is deliberately **not** in this file.

- Routines scanned: **1077** (system/vendor objects excluded)
- In scope (touch a workflow table): **528**
- Hardcoded literal occurrences: **1908**


## Part 1 — Routine → table matrix

Write operations are what matter for the migration write-back boundary (T-54).

| Routine | Kind | Source | Tables touched | Writes |
|---|---|---|---|---|
| `SP_ATUALIZA_FOLLOWUP` | procedure | store_procedures_BROKER.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | UPDATE `TFOLLOWUP` |
| `SP_CRIA_FOLLOWUP` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | INSERT `TFOLLOWUP`, DELETE `TFOLLOWUP` |
| `SP_LIMPA_PROCESSOS` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | DELETE `TFOLLOWUP_ETAPA`, DELETE `TFOLLOWUP`, DELETE `TPROCESSO_EXP`, DELETE `TPROCESSO`, DELETE `TDECLARACAO_IMPORTACAO` |
| `SP_NR_FATURA_NESTLE` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TPROCESSO_EXP` |
| `SP_RE_ALIMENTA_MANUTENCAO` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `TR_ATZ_DT_ENT_FABR` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `TR_EMBALAGEM` | trigger | triggers_MYINDAIA.csv | `TPROCESSO_EXP` | UPDATE `TPROCESSO_EXP` |
| `TR_ETAPA_AUTOMATICA` | trigger | triggers_BROKER.csv | `TFOLLOWUP_ETAPA`, `TFOLLOWUP` | DELETE `TFOLLOWUP_ETAPA` |
| `TR_FLP_PROCESSO_CNTR` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `TR_FOLLOWUP` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TFOLLOWUP`, UPDATE `TPROCESSO_EXP`, UPDATE `TPROCESSO` |
| `TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE` | trigger | triggers_BROKER.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `TR_INS_PROC` | trigger | triggers_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | UPDATE `TPROCESSO` |
| `TR_PROC` | trigger | triggers_BROKER.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TFOLLOWUP`, UPDATE `TPROCESSO`, UPDATE `TDECLARACAO_IMPORTACAO` |
| `TR_PROCESSO_CNTR` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | UPDATE `TFOLLOWUP` |
| `TR_PROCESSO_EXP` | trigger | triggers_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TPROCESSO_EXP`, UPDATE `TPROCESSO` |
| `TR_TDI` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `TR_TEXPORTADOR_DI` | trigger | triggers_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `TR_TNAC` | trigger | triggers_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `TR_TPROCESSO_EXP_NF_IUD_A` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `TR_TPROCESSO_NAVIO` | trigger | triggers_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `TR_UNID_NEG` | trigger | triggers_BROKER.csv | `TCLIENTE_SERVICO` | DELETE `TCLIENTE_SERVICO` |
| `TR_VIAGEM_DEADLINE` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `TR_VIAGEM_REPASSE` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TFOLLOWUP`, UPDATE `TPROCESSO` |
| `sp_atualiza_armazem` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_atualiza_deadline` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `sp_atualiza_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `sp_atz_da_di` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `sp_atz_devolucao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_atz_di` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_atz_ent_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO`, UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_atz_evento` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `sp_atz_followup` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TSERVICO`, `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | UPDATE `TFOLLOWUP` |
| `sp_atz_myindaia_followup` | procedure | store_procedures_BROKER.csv | `TEVENTO`, `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO` | INSERT `TFOLLOWUP_ETAPA`, INSERT `TFOLLOWUP` |
| `sp_atz_myindaia_followup2` | procedure | store_procedures_BROKER.csv | `TEVENTO`, `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO` | INSERT `TFOLLOWUP_ETAPA`, DELETE `TFOLLOWUP_ETAPA`, INSERT `TFOLLOWUP` |
| `sp_atz_myindaia_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | INSERT `TDECLARACAO_IMPORTACAO` |
| `sp_atz_myindaia_processo2` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | INSERT `TDECLARACAO_IMPORTACAO` |
| `sp_atz_myindaia_processo2_bkp_20180323` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | INSERT `TDECLARACAO_IMPORTACAO` |
| `sp_atz_obs_flwup` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `sp_atz_obs_followup` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_atz_recebimento` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_atz_sda_pago` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_atz_tipo_icms` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_atz_veiculo` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `sp_broker_reg` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_calc_vmle_mn` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_calcula_sda` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `sp_calculo_sda_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_cancela_distr_sda` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_da_gera_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_adicao_com_li` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_atz_tipo_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_atz_via_transp` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_calculo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_calculo2` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_classifica_item` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_classifica_item_2` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_gera_base_calc` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_gera_base_calc_x` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_libera_cc_propria` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_di_reclassifica_item` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_reclassifica_item2` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_reclassifica_item_2` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_renumera_itens_adicao` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_di_repassa_dados_adicao` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_duplica_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | INSERT `TDECLARACAO_IMPORTACAO` |
| `sp_duplica_eventos` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | INSERT `TSERVICO_EVENTO` |
| `sp_duplica_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | INSERT `TPROCESSO` |
| `sp_duplica_unidade` | procedure | store_procedures_BROKER.csv | `TCLIENTE_SERVICO` | INSERT `TCLIENTE_SERVICO` |
| `sp_ev_prev_emb` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `sp_ev_prev_fabrica` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `sp_ev_prev_fabrica_viagem` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP` |
| `sp_exclui_adicao` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_exclui_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | DELETE `TDECLARACAO_IMPORTACAO` |
| `sp_exclui_servico_evento` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | UPDATE `TSERVICO_EVENTO`, DELETE `TSERVICO_EVENTO` |
| `sp_exp_apaga_renum_itens` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | UPDATE `TPROCESSO_EXP` |
| `sp_exp_calcula` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TPROCESSO_EXP`, UPDATE `TPROCESSO` |
| `sp_exp_duplica` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | INSERT `TPROCESSO_EXP` |
| `sp_exp_exclui` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | DELETE `TPROCESSO_EXP` |
| `sp_exp_insere_gestao` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TPROCESSO_EXP` |
| `sp_exp_monta_re` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | UPDATE `TPROCESSO_EXP` |
| `sp_fat_canc` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | UPDATE `TFOLLOWUP` |
| `sp_gerar_master` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_integracao` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP`, UPDATE `TPROCESSO` |
| `sp_integracao_automatica` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | UPDATE `TFOLLOWUP`, UPDATE `TPROCESSO` |
| `sp_marca_transferencia_risc` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_muda_servico` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | UPDATE `TFOLLOWUP`, DELETE `TFOLLOWUP` |
| `sp_nac_gera_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_ordena_eventos` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | UPDATE `TSERVICO_EVENTO` |
| `sp_origina_recebimento_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | UPDATE `TPROCESSO` |
| `sp_pe_estorno_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | UPDATE `TPROCESSO_EXP`, DELETE `TPROCESSO_EXP` |
| `sp_pe_monta_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | INSERT `TPROCESSO_EXP`, UPDATE `TPROCESSO_EXP` |
| `sp_po_estorno_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO`, DELETE `TDECLARACAO_IMPORTACAO` |
| `sp_po_monta_di` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO`, INSERT `TDECLARACAO_IMPORTACAO`, UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_rateia_cambio` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `sp_rel_desp_arm` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `sp_rel_desp_arm2` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | UPDATE `TPROCESSO` |
| `sp_soma_tributos` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | UPDATE `TDECLARACAO_IMPORTACAO` |
| `INSERE_RE_MANTENCAO` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `SP_ALIMENTA_ITENS_DI_REF_CLIENTE` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_ALIMENTA_REF_CLIENTE` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_ATUALIZA_DASHBOARD` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_ATUALIZA_FUP_DEMURRAGE_PROCESSOS_VIAGEM` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_ATUALIZA_PROCESSOS_SERVICO` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `SP_ATZ_CONHECIMENTO_CARGA_DI` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_ATZ_MYINDAIA_AUX_2` | procedure | store_procedures_BROKER.csv | `TETAPA` | — read only |
| `SP_ATZ_MYINDAIA_ESTAGIO_DES2_` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_ATZ_MYINDAIA_ESTAGIO_DES2_1` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_CRIA_REF_CLIENTE_PADRAO` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_DI_ATUALIZA_VOLUMES` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_GRAVA_HISTORICO_CALCULO_DI` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_GRAVA_LOG_CALCULO_DI` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_INSERE_PGMTO_MERCANTE_WALLET` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_INSERE_PGMTO_MERCANTE_WALLET` | procedure | store_procedures_MYINDAIAV2.csv | `TPROCESSO` | — read only |
| `SP_INSERE_PGMTO_SDA_WALLET` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_INSERE_REF_OIC_NESTLE` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `SP_LISTA_EVENTOS_PROCESSO` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `SP_MAIL_PENDENTES_AGENTE` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_MAIL_PENDENTES_ARMAZEM` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_MAIL_PENDENTES_CLIENTE` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_MAIL_PENDENTES_PO_COMUM` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TPROCESSO` | — read only |
| `SP_MAIL_PENDENTES_PO_ESPECIFICO` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TPROCESSO` | — read only |
| `SP_MAIL_PROC_NAO_FAT` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `SP_MUDA_SERVICO_PO_ITEM` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `SP_OBSERVACOES_DI_REGRAS` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_ORDENA_EVENTOS_NOVO` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `SP_RATEIO_ACRESCIMOS_DEDUCOES` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `SP_RE_CLASSIFICA_ANEXOS` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `SP_RE_CLASSIFICA_ANEXO_NOVOEX` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `SP_VALIDA_RETORNO_FATOR` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `TR_ADICAO_A_I` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_ALERTA_ENVIADO` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | — read only |
| `TR_ATZ_MYINDAIA_DI` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | triggers_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `TR_ATZ_MYINDAIA_FOLLOWUP_ETAPA` | trigger | triggers_BROKER.csv | `TFOLLOWUP_ETAPA`, `TFOLLOWUP` | — read only |
| `TR_ATZ_MYINDAIA_PROCESSO` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_ATZ_MYINDAIA_PROCESSO_EXP` | trigger | triggers_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `TR_ATZ_VISUALCUE` | trigger | triggers_BROKER.csv | `TSERVICO`, `TFOLLOWUP` | — read only |
| `TR_ETAPA_AUTOMATICA_PO` | trigger | triggers_BROKER.csv | `TSERVICO` | — read only |
| `TR_ETAPA_AUTOMATICA_PO_ITEM` | trigger | triggers_BROKER.csv | `TSERVICO` | — read only |
| `TR_EVENTO_012` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | — read only |
| `TR_GERA_TESTAGIO_PROCESSO_PO_ITEM` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_LI_PRE_JA_EMBARCADO` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_NCM` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `TR_NOTIFICACAO` | trigger | triggers_BROKER.csv | `TEVENTO`, `TFOLLOWUP` | — read only |
| `TR_NUM` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_OBS_AUT` | trigger | triggers_BROKER.csv | `TEVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `TR_PO_ITEM` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_PROCESSO_SDA_A_U` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_REALIZACAO_EFETIVA` | trigger | triggers_BROKER.csv | `TFOLLOWUP` | — read only |
| `TR_SERVICO_EVENTO_DASHBOARD` | trigger | triggers_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `TR_TCLIENTE_BANCO_T` | trigger | triggers_BROKER.csv | `TCLIENTE_SERVICO` | — read only |
| `TR_TDA` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `TR_TDECLARACAO_IMPORTACAO_EXPORTADOR` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `TR_TDECLARACAO_IMPORTACAO_LOG` | trigger | triggers_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `TR_TFATORES_CAMPOS` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TFATORES_TRIGGERS` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TPO_ITEM_URGENTE_CRODA` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TPROCESSO_EXP_FATORES` | trigger | triggers_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `TR_TPROCESSO_FATORES` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TPROCESSO_FILA_ERP` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TPROCESSO_LOG` | trigger | triggers_BROKER.csv | `TPROCESSO` | — read only |
| `TR_TSERVICO_EVENTO_FOLLOWUP` | trigger | triggers_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `VW_DI_RETIFICADA` | view | views_MYINDAIA.csv | `TPROCESSO` | — read only |
| `VW_DT_AVERBACAO` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_CHEGADA` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_DESCARGA` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_DESEMB` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_DESOVA` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_EMBARQUE` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_EMB_DESEMB` | view | views_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `VW_DT_ENT` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_ENTREGA_MERC` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_ESPERA_NAVIO` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_LIB_BL` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_NF_TRANSP` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_PAGTO` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_PAGTO_LI` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_PAGTO_SDA` | view | views_BROKER.csv | `TPROCESSO` | — read only |
| `VW_DT_PREV_CHEGADA` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_PREV_EMBARQUE` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_RECEB_DOC` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_RECEP_ANALISE` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_REG_DI` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_REMOCAO` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_DT_RET_BL` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_FATO_IMPO` | view | views_BROKER.csv | `TFOLLOWUP` | — read only |
| `VW_LI_STATUS` | view | views_BROKER.csv | `TPROCESSO` | — read only |
| `VW_MOEDAS_DI` | view | views_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `VW_PROCESSO` | view | views_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `VW_PROC_FAT` | view | views_BROKER.csv | `TPROCESSO` | — read only |
| `VW_PROC_FAT_VENCTO` | view | views_BROKER.csv | `TPROCESSO` | — read only |
| `VW_PROC_SIT_FAT` | view | views_BROKER.csv | `TPROCESSO` | — read only |
| `VW_REL_DFF` | view | views_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `VW_REL_DFT` | view | views_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `VW_SERVICO_EVENTO_GERAL` | view | views_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `VW_SERVICO_GERAL` | view | views_BROKER.csv | `TSERVICO` | — read only |
| `VW_SERVICO_GERAL` | view | views_MYINDAIA.csv | `TSERVICO` | — read only |
| `VW_ULTIMA_ETAPA` | view | views_MYINDAIA.csv | `TETAPA`, `TFOLLOWUP_ETAPA` | — read only |
| `VW_ULTIMA_ETAPA_ITEM` | view | views_MYINDAIA.csv | `TETAPA` | — read only |
| `sea_sp_processo_new` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_Importacao_Custeio2` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_Importacao_Custeio3` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_abertura_processo_eadi` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_abre_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_atualiza_dados_nota` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atualiza_proc_armazem` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_da_lote` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `sp_atz_dt_vencto_da` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atz_ev_flp_po` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `sp_atz_ev_flp_po_item` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `sp_atz_ev_nao_real` | procedure | store_procedures_BROKER.csv | `TEVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_evento_po_di` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_fat_cc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_fat_cc_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_fat_cc_solic` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_flp_po` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TPROCESSO` | — read only |
| `sp_atz_flp_po` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO_EVENTO`, `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_atz_flp_po_item` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_flp_po_item` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO_EVENTO`, `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_atz_liq_vl_acresc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_liq_vl_desc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_myindaia_aux` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TSERVICO`, `TEVENTO`, `TETAPA` | — read only |
| `sp_atz_myindaia_aux_bkp_20180320` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TSERVICO`, `TEVENTO`, `TETAPA` | — read only |
| `sp_atz_myindaia_cash_flow` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atz_myindaia_estagio_adm` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_myindaia_estagio_adm2` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_myindaia_estagio_des` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_myindaia_estagio_des2` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_myindaia_estagio_des2_bkp_20180323` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_myindaia_rateio` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_myindaia_rateio_bkp_20180323` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_nac` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atz_num_cpmf` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_atz_num_cpmf_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_atz_num_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_num_usd` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_atz_obs_rel` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_po_item_des` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `sp_atz_prev_custo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atz_ref_cliente` | procedure | store_procedures_BROKER.csv | `TEVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_atz_solic_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_atz_tdocumento_instrucao` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_aux_adicao_itens` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_arm_codesp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_arm_padrao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_arm_teca` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_arm_tra` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_armazenagem` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_capatazias` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_carregamento` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_carregamento_tra` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_clv` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_cobranca_dta` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_comissao` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_drawback` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_dt_demurrage` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `sp_calc_energia` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_energia_tra` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_ensaios_exp` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_calc_ensaios_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_frete_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_icms` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_ii` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_ipi` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_laticionio` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_calc_liberacao_bl` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_marinha` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_marinha_com_frete_prep` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_movimentacao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_nr_li` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_ordens` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_padrao` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_calc_padrao_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_calc_padrao_base_icms_sul` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_receitas_exp` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_calc_receitas_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_retificacao_di` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_sda_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_taxa_siscomex` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_calc_thc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calc_thc_tra` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_calculo_fatura_master` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_canc_recebimento_vinculado` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancel_rel` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_boleto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_item_solic_ch` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_item_solic_pagamento` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_item_solic_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_solic_ch` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cancela_solic_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_conciliacao` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `sp_cons_db_susp_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_contabiliza` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_contabiliza_contmaster` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_contabiliza_rm_tito` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_contabiliza_si` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_cria_ensaios` | procedure | store_procedures_BROKER.csv | `TCLIENTE_SERVICO` | — read only |
| `sp_cria_mbf_resultado` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_cria_mbf_resultado_urgente` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_custos_job` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_db_inclui_laudo` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport_custo` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport_custo_job` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport_flp` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport_flp_job` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_ddimport_flp_sea` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_dem_emails` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_despesa_grupo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_di_atz_taxa_cambio` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_di_calculo_2` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_di_ded_cpt` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_di_distribui_deb_com` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_di_gera_adm_temp` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_di_repassa_dados_cambio` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_distribui_liquidacao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_distribui_numerario` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_distribui_pagamento` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_distribui_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_distribui_remessa_AG` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_distribui_sda` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_dropa_cria_indices` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_dropa_cria_indices` | procedure | store_procedures_MYINDAIA.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_exp_atz_ref` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_exp_calc_naladi` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_exp_calc_ncm` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_exp_carta_cred` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_exp_repassa_ncm_naladi_doc` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_fat_atz_rateio_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_calc_item_complementar` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_calc_padrao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_calculo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_calculo_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_calculo_rateio_despesas` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_fat_calculo_rateio_despesas_money` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_fat_calculo_rateio_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_fat_consiste_rateio` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_consiste_rateio_money` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_extrato` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_item_complementar` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_pagos_cli` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fat_rateio_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_fat_rateio_exp_money` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_fat_rateio_imp` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_fat_rateio_imp_money` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_fat_saldos` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fecha_caixa` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_fin_gera_tab_juros` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_flp_po` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `sp_flp_po_item` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO` | — read only |
| `sp_follow_up` | procedure | store_procedures_BROKER.csv | `TSERVICO_EVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_followup_job` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_gastos_armazenagem` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_gera_kpi_resultado` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_gera_solic_ch_devol` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_gera_solic_ch_liq` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_gera_solic_ch_sda` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_gera_solic_ch_sm` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_inclui_da` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_int_saldos_periodo` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_integra_jump` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_liq_cancel_grupo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_liq_grupo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_liq_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_liq_rel` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_mapa_mensal` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_nf_serv_op` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_notificacao` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_ordena_cliente_receita` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_ordena_rank_receita` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_po_planilha` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_po_repassa_itens` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_prev_calculo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_proc_ab_fat` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_proc_itens_monta_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_proc_itens_monta_pagto_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_proc_itens_solic_ch` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_proc_pag_desemb` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_proc_pag_desemb_li` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_proc_pagto` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_proc_solic_pagto_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rap_monta_palet` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO` | — read only |
| `sp_rateia_di` | procedure | store_procedures_BROKER.csv | `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_re_prepara_anexo` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP` | — read only |
| `sp_rel_Importador_track` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_acomp_proc` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_alerta` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO_EVENTO`, `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_and_processo_exp` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_and_servico` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_rel_armaz_rem` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_bol_port` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_canal_mes` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_canal_mes_mod2` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_cli_cc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_cli_cc_resumo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_cliente_arm` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_cntr_nao_dev` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_cntr_origem` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_com_imp_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_cont_averb` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_cont_emb` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_controle_emb` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_controle_proc` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_ctrl_demurrage` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_dem_cliente` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_dem_est` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_dem_gerencial` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_dem_gerencial2` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_demo_cc` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_rel_desp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_desp_pagto` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_desvios` | procedure | store_procedures_BROKER.csv | `TEVENTO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_di_reg_desemb` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_emitido_cancelado` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_ensaio` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_est_arm_demurrage` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_est_arm_prefixo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_est_armz_carga` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_est_cntr_vl_cif` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_est_demurrage` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_est_desp` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_est_mercadoria` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_est_volumes` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_est_volumes_mod2` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO`, `TCLIENTE_SERVICO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_ev_critico` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_ev_critico_po` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_exp_alerta` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_alerta_2` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_bordero` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_emb_averb` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_flp` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_exp_kpi` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_re` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_exp_track` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_exp_track[ORIGINAL]` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_extrato_cc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_cash_flow` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_ciclo_money` | procedure | store_procedures_MYINDAIA.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_livro_fiscal` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_livro_fiscalteste` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_notas_fiscais_money` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_num_desp` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_num_desp_money` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_pago_cli` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_pend_boleto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fat_saldo_cli` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_saldos` | procedure | store_procedures_BROKER.csv | `TPROCESSO`, `TCLIENTE_SERVICO` | — read only |
| `sp_rel_fat_solic_num` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_solic_num_money` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fat_volumes` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fin` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_flp_aut_envio` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_flp_ind` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fluxo_caixa` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fluxo_caixa_gerencial` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fluxo_caixa_op` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_fluxo_op` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_flx_cx` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP` | — read only |
| `sp_rel_followup_aut` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_followup_navio` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_fup_dia` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_imp_alerta` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_imp_alerta_2` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_imp_ctrl_li` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_ctrl_li_novo` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO` | — read only |
| `sp_rel_imp_custo` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_demurrage` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_demurrage` | procedure | store_procedures_MYINDAIA.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_kpi` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_lead` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_liantes` | procedure | store_procedures_MYINDAIA.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_imp_mapa` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TETAPA`, `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_imp_mapa_bkp_19072018` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TETAPA`, `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_imp_track_Buscador` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TPROCESSO` | — read only |
| `sp_rel_kpi_exportacao` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_kpi_exportacao1` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_lead_time` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_lead_time2` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_lead_time_teste` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_liquidacao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_mapa_an` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO_EXP`, `TPROCESSO` | — read only |
| `sp_rel_nao_desemb_di` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_nr_processos` | procedure | store_procedures_BROKER.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_num_nao_rec` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_pagto` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_pagto_basf` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_pagto_pend` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_pagto_razao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_pendencias` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TPROCESSO` | — read only |
| `sp_rel_po_flp` | procedure | store_procedures_BROKER.csv | `TEVENTO` | — read only |
| `sp_rel_po_saldo_mercadoria` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_previsao_po_nacionalizar` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_proc_andamento` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_proc_desembaracados` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_rel_processo_po` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_qt_processos` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_rec_liq` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_rent_proc` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_req_pagtos` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_requerimento` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_resumo_fat` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_resumo_fat_itens` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_retencao` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_sda_extrato` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_rel_serv_transp` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_serv_transp_exp` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_serv_transp_prog` | procedure | store_procedures_MYINDAIA.csv | `TSERVICO`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_rel_viagem` | procedure | store_procedures_MYINDAIA.csv | `TPROCESSO` | — read only |
| `sp_relacao_clientes` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_repassa_dt_vecto_fat` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_saldo_drawback` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TDECLARACAO_IMPORTACAO` | — read only |
| `sp_saldo_fluxo_cx` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_solic_pagto_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_solic_pagto_vinc_ag` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_temp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_tot_serv_cli_periodo` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_valores_cif_fob` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_verif_rateio_desp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_verif_rateio_exp` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_web_verifica_estagio` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_web_verifica_followup` | procedure | store_procedures_BROKER.csv | `TFOLLOWUP_ETAPA`, `TFOLLOWUP`, `TPROCESSO` | — read only |
| `sp_web_verifica_pedido` | procedure | store_procedures_BROKER.csv | `TPROCESSO` | — read only |
| `sp_web_verifica_processo` | procedure | store_procedures_BROKER.csv | `TPROCESSO_EXP`, `TPROCESSO`, `TDECLARACAO_IMPORTACAO` | — read only |
| `vw_Event` | view | views_MYINDAIAV2.csv | `TEVENTO` | — read only |
| `vw_Processo_Resumo` | view | views_MYINDAIAV2.csv | `TFOLLOWUP`, `TPROCESSO` | — read only |

**98 of 528 in-scope routines write to a workflow table.**


## Part 2 — Hardcoded literals (the exception layer)

Each row is a place where the general process gives way to a specific case. **These are what the client must confirm or deny.** Code meanings are left blank on purpose — we do not yet have the reference-table contents (item H of A2).

| Column | Literal | Routine | Kind | Matched condition |
|---|---|---|---|---|
| `CD_CLIENTE` | `) <>` | `sp_cria_mbf_resultado` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `) <>` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `*` | `sp_fat_extrato` | procedure | `cd_cliente = '*'` |
| `CD_CLIENTE` | `*` | `sp_fat_extrato` | procedure | `cd_cliente = '*'` |
| `CD_CLIENTE` | `+ @CD_CLIENTE +` | `sp_cria_mbf_resultado` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `+ @CD_CLIENTE +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `+@tx_filtro+` | `sp_rel_imp_ctrl_li_novo` | procedure | `CD_CLIENTE = '''+@tx_filtro+''' ` |
| `CD_CLIENTE` | `0` | `TR_TCLIENTE_BANCO_T` | trigger | `CD_CLIENTE IN (0` |
| `CD_CLIENTE` | `0` | `sp_integracao` | procedure | `cd_cliente = '0' ` |
| `CD_CLIENTE` | `0` | `sp_integracao_automatica` | procedure | `cd_cliente = '0' ` |
| `CD_CLIENTE` | `00001` | `sp_proc_ab_fat` | procedure | `cd_cliente = '00001' ` |
| `CD_CLIENTE` | `00001` | `sp_rel_fat_pend_boleto` | procedure | `cd_cliente = '00001' ` |
| `CD_CLIENTE` | `00002` | `sp_rel_rent_proc` | procedure | `cd_cliente = '00002' ` |
| `CD_CLIENTE` | `00005` | `sp_atz_ev_nao_real` | procedure | `cd_cliente = '00005' ` |
| `CD_CLIENTE` | `00005` | `sp_atz_ref_cliente` | procedure | `cd_cliente = '00005' ` |
| `CD_CLIENTE` | `00006` | `sp_rel_armaz_rem` | procedure | `cd_cliente = '00006' ` |
| `CD_CLIENTE` | `00006` | `sp_rel_flp_ind` | procedure | `cd_cliente = '00006' ` |
| `CD_CLIENTE` | `00006` | `sp_rel_fup_dia` | procedure | `cd_cliente = '00006' ` |
| `CD_CLIENTE` | `00013` | `sp_rel_dem_cliente` | procedure | `cd_cliente = '00013' ` |
| `CD_CLIENTE` | `00020` | `sp_rel_est_desp` | procedure | `cd_cliente = '00020' ` |
| `CD_CLIENTE` | `00022` | `sp_ddimport` | procedure | `cd_cliente = '00022' ` |
| `CD_CLIENTE` | `00022` | `sp_fat_item_complementar` | procedure | `cd_cliente = '00022' ` |
| `CD_CLIENTE` | `00022` | `sp_rel_cli_cc_resumo` | procedure | `cd_cliente = '00022' ` |
| `CD_CLIENTE` | `00022` | `sp_rel_requerimento` | procedure | `cd_cliente = '00022', ` |
| `CD_CLIENTE` | `00055` | `sp_atz_num_imp` | procedure | `cd_cliente = '00055' ` |
| `CD_CLIENTE` | `00105` | `sp_atz_num_imp` | procedure | `CD_CLIENTE = '00105' ` |
| `CD_CLIENTE` | `00128` | `sp_rel_ensaio` | procedure | `cd_cliente = '00128' ` |
| `CD_CLIENTE` | `00415` | `sp_rel_controle_emb` | procedure | `cd_cliente = '00415', ` |
| `CD_CLIENTE` | `00662` | `sp_origina_recebimento_ag` | procedure | `cd_cliente = '00662' ` |
| `CD_CLIENTE` | `00932` | `sp_fat_calculo` | procedure | `cd_cliente <> '00932' ` |
| `CD_CLIENTE` | `02274` | `sp_di_adicao_com_li` | procedure | `CD_CLIENTE IN ('02274'` |
| `CD_CLIENTE` | `BEGIN          SET @TXT_SQL_AUX =` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `BEGIN        SET @TXT_SQL_AUX =` | `sp_cria_mbf_resultado` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `END                    IF ISNULL(@CD_AREA_INFO,` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `END                IF ISNULL(@CD_AREA_INFO,` | `sp_cria_mbf_resultado` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `SET @TXT_SQL_AUX2 =` | `sp_cria_mbf_resultado` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `SET @TXT_SQL_AUX2 =` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_CLIENTE = ''' + @CD_CLIENTE + '''' SET @TXT_SQL_AUX2 = '' END IF ISNULL(@CD_AREA_INFO, '') <> '' BEGIN SET ` |
| `CD_CLIENTE` | `X` | `sp_cancel_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_cancel_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_cancel_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_cancel_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_custo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_custo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_flp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_flp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_cancel_grupo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_grupo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_processo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_liq_rel` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_mapa_mensal` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_po_planilha` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_proc_pag_desemb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_proc_pag_desemb_li` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_acomp_proc` | procedure | `cd_cliente = 'X', ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_bol_port` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_canal_mes` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_canal_mes_mod2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_canal_mes_mod2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cli_cc` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cliente_arm` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_origem` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_origem` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_origem` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cntr_origem` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_cliente = 'X', ` |
| `CD_CLIENTE` | `X` | `sp_rel_cont_averb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cont_averb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cont_averb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_cont_averb` | procedure | `cd_cliente = 'X', ` |
| `CD_CLIENTE` | `X` | `sp_rel_controle_proc` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_ctrl_demurrage` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_est` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_est` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_gerencial` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_gerencial` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_demo_cc` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_desvios` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_di_reg_desemb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_emitido_cancelado` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_arm_demurrage` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_arm_prefixo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_armz_carga` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_demurrage` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_demurrage` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_desp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_mercadoria` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_mercadoria` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_volumes` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_volumes` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_volumes` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_est_volumes_mod2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_ev_critico` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_ev_critico_po` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_exp_emb_averb` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_exp_flp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_exp_re` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fat_pago_cli` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fat_pend_boleto` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fat_saldos` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fin` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_fluxo_op` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_followup_navio` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_imp_demurrage` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_kpi_exportacao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_kpi_exportacao1` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_kpi_exportacao1` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_lead_time` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_lead_time2` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_lead_time_teste` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_lead_time_teste` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_liquidacao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_liquidacao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_liquidacao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_mapa_an` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_nao_desemb_di` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_nr_processos` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_num_nao_rec` | procedure | `cd_cliente = 'X'` |
| `CD_CLIENTE` | `X` | `sp_rel_num_nao_rec` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto_basf` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto_pend` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto_pend` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto_razao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_pagto_razao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_po_flp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_po_flp` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_previsao_po_nacionalizar` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_proc_andamento` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_proc_desembaracados` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_qt_processos` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_rec_liq` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_rent_proc` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_rent_proc` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_resumo_fat` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_resumo_fat_itens` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_retencao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_rel_retencao` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `X` | `sp_tot_serv_cli_periodo` | procedure | `cd_cliente = 'X' ` |
| `CD_CLIENTE` | `XXXXX` | `sp_atz_ref_cliente` | procedure | `cd_cliente = 'XXXXX' ` |
| `CD_CLIENTE` | `XXXXX` | `sp_atz_ref_cliente` | procedure | `cd_cliente = 'XXXXX' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_Importador_track` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_Importador_track` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_alerta_2` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_alerta_2` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_bordero` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_bordero` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_kpi` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_kpi` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_track` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_track` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_track[ORIGINAL]` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_exp_track[ORIGINAL]` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_cash_flow` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_cash_flow` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_num_desp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_num_desp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_num_desp_money` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_num_desp_money` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_saldo_cli` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_saldo_cli` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_solic_num` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_solic_num` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_solic_num_money` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_solic_num_money` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_volumes` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_fat_volumes` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_alerta` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_alerta_2` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_alerta_2` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_ctrl_li` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_ctrl_li` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_custo` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_custo` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_demurrage` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_demurrage` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_kpi` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_kpi` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_lead` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_lead` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_liantes` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_liantes` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_track_Buscador` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_imp_track_Buscador` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_pendencias` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_pendencias` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp_exp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp_exp` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp_prog` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_serv_transp_prog` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_viagem` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00001` | `sp_rel_viagem` | procedure | `CD_EMPRESA <> '00001' ` |
| `CD_EMPRESA` | `00061` | `sp_flp_po_item` | procedure | `cd_empresa = '00061', ` |
| `CD_EMPRESA` | `00309` | `SP_MUDA_SERVICO_PO_ITEM` | procedure | `CD_EMPRESA = '00309' ` |
| `CD_EMPRESA` | `00500` | `TR_FOLLOWUP` | trigger | `CD_EMPRESA IN ('03185', '00500'` |
| `CD_EMPRESA` | `00500` | `TR_PO_ITEM` | trigger | `CD_EMPRESA = '00500' ` |
| `CD_EMPRESA` | `03185` | `TR_FOLLOWUP` | trigger | `CD_EMPRESA IN ('03185', '00500'` |
| `CD_EVENTO` | `+ @CD_EVENTO_1 +` | `sp_cria_mbf_resultado` | procedure | `CD_EVENTO = '''+ @CD_EVENTO_1 +'''` |
| `CD_EVENTO` | `+ @CD_EVENTO_1 +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_EVENTO = '''+ @CD_EVENTO_1 +'''` |
| `CD_EVENTO` | `+ @CD_EVENTO_2 +` | `sp_cria_mbf_resultado` | procedure | `CD_EVENTO = '''+ @CD_EVENTO_2 + '''` |
| `CD_EVENTO` | `+ @CD_EVENTO_2 +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_EVENTO = '''+ @CD_EVENTO_2 + '''` |
| `CD_EVENTO` | `+ @CD_EVENTO_SELECIONADO +` | `sp_cria_mbf_resultado` | procedure | `CD_EVENTO = ''' + @CD_EVENTO_SELECIONADO + '''` |
| `CD_EVENTO` | `+ @CD_EVENTO_SELECIONADO +` | `sp_cria_mbf_resultado` | procedure | `CD_EVENTO = ''' + @CD_EVENTO_SELECIONADO + '''` |
| `CD_EVENTO` | `+ @CD_EVENTO_SELECIONADO +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_EVENTO = ''' + @CD_EVENTO_SELECIONADO + '''` |
| `CD_EVENTO` | `+ @CD_EVENTO_SELECIONADO +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_EVENTO = ''' + @CD_EVENTO_SELECIONADO + '''` |
| `CD_EVENTO` | `+ @sql_0269 +` | `sp_rel_imp_alerta` | procedure | `CD_EVENTO = '''+@cd_evento+''' ' + @sql_0269 + '` |
| `CD_EVENTO` | `+ @sql_0269 +` | `sp_rel_imp_alerta_2` | procedure | `CD_EVENTO = '''+@cd_evento+''' ' + @sql_0269 + '` |
| `CD_EVENTO` | `+@CDBROKER+` | `SP_ATZ_MYINDAIA_ESTAGIO_DES2_` | procedure | `CD_EVENTO = '''+@CDBROKER+'''` |
| `CD_EVENTO` | `+@CDBROKER+` | `SP_ATZ_MYINDAIA_ESTAGIO_DES2_1` | procedure | `CD_EVENTO = '''+@CDBROKER+'''` |
| `CD_EVENTO` | `+@CDBROKER+` | `sp_atz_myindaia_estagio_des2` | procedure | `CD_EVENTO = '''+@CDBROKER+'''` |
| `CD_EVENTO` | `+@CDBROKER+` | `sp_atz_myindaia_followup2` | procedure | `CD_EVENTO = '''+@CDBROKER+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm2` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm2` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_adm2` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_des` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_estagio_des2_bkp_20180323` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_atz_myindaia_followup` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_rel_exp_kpi` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_rel_imp_kpi` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_web_verifica_estagio` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cdBroker+` | `sp_web_verifica_followup` | procedure | `CD_EVENTO = '''+@cdBroker+'''` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_Importador_track` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_alerta` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_alerta` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_alerta` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_alerta_2` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_bordero` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_kpi` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_track` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_exp_track[ORIGINAL]` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_cash_flow` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_num_desp` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_num_desp_money` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_saldo_cli` | procedure | `CD_EVENTO = '''+@cd_evento+'''` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_solic_num` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_solic_num_money` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_fat_volumes` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_alerta` | procedure | `CD_EVENTO = '''+@cd_evento+''' ' + @sql_0269 + '` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_alerta_2` | procedure | `CD_EVENTO = '''+@cd_evento+''' ' + @sql_0269 + '` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_ctrl_li` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_custo` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_demurrage` | procedure | `CD_EVENTO = '''+@cd_evento+'''` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_kpi` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_lead` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_liantes` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_imp_track_Buscador` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_pendencias` | procedure | `CD_EVENTO = '''+@cd_evento+''' ` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_serv_transp` | procedure | `CD_EVENTO = '''+@cd_evento+'''` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_serv_transp_exp` | procedure | `CD_EVENTO = '''+@cd_evento+'''` |
| `CD_EVENTO` | `+@cd_evento+` | `sp_rel_serv_transp_prog` | procedure | `CD_EVENTO = '''+@cd_evento+'''` |
| `CD_EVENTO` | `001` | `VW_FATO_IMPO` | view | `CD_EVENTO = '001'` |
| `CD_EVENTO` | `001` | `sp_po_planilha` | procedure | `CD_EVENTO = '001' ` |
| `CD_EVENTO` | `003` | `TR_OBS_AUT` | trigger | `CD_EVENTO = '003' ` |
| `CD_EVENTO` | `003` | `VW_FATO_IMPO` | view | `CD_EVENTO = '003'` |
| `CD_EVENTO` | `003` | `sp_rel_flp_ind` | procedure | `cd_evento = '003' ` |
| `CD_EVENTO` | `003` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `003` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `003` | `vw_Processo_Resumo` | view | `CD_EVENTO = '003' ` |
| `CD_EVENTO` | `008` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '008' ` |
| `CD_EVENTO` | `008` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '008' ` |
| `CD_EVENTO` | `012` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `012` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `012` | `TR_EVENTO_012` | trigger | `CD_EVENTO = '012'` |
| `CD_EVENTO` | `012` | `TR_EVENTO_012` | trigger | `CD_EVENTO = '012' ` |
| `CD_EVENTO` | `012` | `VW_FATO_IMPO` | view | `CD_EVENTO = '012'` |
| `CD_EVENTO` | `012` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('012'` |
| `CD_EVENTO` | `012` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('012'` |
| `CD_EVENTO` | `012` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('012'` |
| `CD_EVENTO` | `012` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('012'` |
| `CD_EVENTO` | `012` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('012'` |
| `CD_EVENTO` | `018` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `020` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `021` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `021` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `021` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `VW_FATO_IMPO` | view | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_calcula_sda` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_calcula_sda` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_calcula_sda` | procedure | `CD_EVENTO IN ('021'` |
| `CD_EVENTO` | `021` | `sp_calcula_sda` | procedure | `CD_EVENTO IN ('021'` |
| `CD_EVENTO` | `021` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = '021'` |
| `CD_EVENTO` | `021` | `sp_rel_nao_desemb_di` | procedure | `CD_EVENTO= '021' ` |
| `CD_EVENTO` | `021` | `sp_rel_nao_desemb_di` | procedure | `CD_EVENTO= '021' ` |
| `CD_EVENTO` | `021` | `sp_rel_nao_desemb_di` | procedure | `cd_evento= '021' ` |
| `CD_EVENTO` | `022` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `TR_GERA_TESTAGIO_PROCESSO_REF_CLIENTE` | trigger | `CD_EVENTO <> '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_myindaia_followup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_myindaia_followup2` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_flwup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_flwup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_flwup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_flwup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_followup` | procedure | `CD_EVENTO = '022'` |
| `CD_EVENTO` | `022` | `sp_atz_obs_followup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_atz_obs_followup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_po_planilha` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `022` | `sp_web_verifica_followup` | procedure | `CD_EVENTO = '022' ` |
| `CD_EVENTO` | `032` | `sp_atz_da_lote` | procedure | `CD_EVENTO = '032' ` |
| `CD_EVENTO` | `035` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '035' ` |
| `CD_EVENTO` | `041` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `041` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `041` | `TR_FOLLOWUP` | trigger | `CD_EVENTO IN ('161', '041', '297'` |
| `CD_EVENTO` | `041` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO IN ('161','257','041'` |
| `CD_EVENTO` | `041` | `VW_FATO_IMPO` | view | `CD_EVENTO = '041'` |
| `CD_EVENTO` | `041` | `sp_atz_followup` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `sp_atz_followup` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `sp_atz_followup` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `sp_atz_followup` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '041' ` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `041` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('041'` |
| `CD_EVENTO` | `050` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `050` | `sp_rel_proc_andamento` | procedure | `CD_EVENTO = '050' ` |
| `CD_EVENTO` | `052` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '052' ` |
| `CD_EVENTO` | `052` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO IN ('052'` |
| `CD_EVENTO` | `052` | `sp_rel_proc_andamento` | procedure | `CD_EVENTO = '052' ` |
| `CD_EVENTO` | `060` | `TR_OBS_AUT` | trigger | `CD_EVENTO = '060' ` |
| `CD_EVENTO` | `060` | `TR_OBS_AUT` | trigger | `CD_EVENTO = '060' ` |
| `CD_EVENTO` | `076` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `082` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `082` | `VW_FATO_IMPO` | view | `CD_EVENTO = '082'` |
| `CD_EVENTO` | `088` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `088` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `088` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `088` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '088'` |
| `CD_EVENTO` | `088` | `VW_FATO_IMPO` | view | `CD_EVENTO = '088'` |
| `CD_EVENTO` | `088` | `sp_calcula_sda` | procedure | `CD_EVENTO = '088'` |
| `CD_EVENTO` | `088` | `sp_calcula_sda` | procedure | `CD_EVENTO IN ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_flp_ind` | procedure | `cd_evento = '088' ` |
| `CD_EVENTO` | `088` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `088` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `088` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '088' ` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time` | procedure | `CD_EVENTO = '088' ` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_lead_time2` | procedure | `CD_EVENTO = ('088'` |
| `CD_EVENTO` | `088` | `sp_rel_nao_desemb_di` | procedure | `CD_EVENTO = '088' ` |
| `CD_EVENTO` | `088` | `sp_rel_nao_desemb_di` | procedure | `CD_EVENTO = '088' ` |
| `CD_EVENTO` | `088` | `sp_rel_nao_desemb_di` | procedure | `cd_evento = '088' ` |
| `CD_EVENTO` | `088` | `vw_Processo_Resumo` | view | `CD_EVENTO = '088' ` |
| `CD_EVENTO` | `092` | `SP_ATUALIZA_PROCESSOS_SERVICO` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `SP_CRIA_FOLLOWUP` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `SP_CRIA_FOLLOWUP` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `SP_LIMPA_PROCESSOS` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `SP_MAIL_PROC_NAO_FAT` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `SP_MAIL_PROC_NAO_FAT` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `092` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `092` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `VW_PROCESSO` | view | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `sp_atz_ev_nao_real` | procedure | `cd_evento = '092' ` |
| `CD_EVENTO` | `092` | `sp_fat_canc` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `sp_rel_ev_critico` | procedure | `cd_evento = '092' ` |
| `CD_EVENTO` | `092` | `sp_rel_ev_critico_po` | procedure | `cd_evento = '092' ` |
| `CD_EVENTO` | `092` | `sp_rel_flp_ind` | procedure | `cd_evento = '092' ` |
| `CD_EVENTO` | `092` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `092` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `092` | `sp_rel_flx_cx` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `092` | `sp_rel_flx_cx` | procedure | `CD_EVENTO = '092' ` |
| `CD_EVENTO` | `100` | `sp_po_planilha` | procedure | `CD_EVENTO = '100' ` |
| `CD_EVENTO` | `100` | `sp_po_planilha` | procedure | `CD_EVENTO = '100' ` |
| `CD_EVENTO` | `113` | `SP_LISTA_EVENTOS_PROCESSO` | procedure | `CD_EVENTO = '113' ` |
| `CD_EVENTO` | `113` | `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | `CD_EVENTO = '113' ` |
| `CD_EVENTO` | `113` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `113` | `sp_rel_flp_ind` | procedure | `cd_evento = '113' ` |
| `CD_EVENTO` | `113` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `113` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `114` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `114` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '114' ` |
| `CD_EVENTO` | `115` | `sp_rel_flp_ind` | procedure | `cd_evento = '115' ` |
| `CD_EVENTO` | `115` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `115` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `117` | `sp_rel_flp_ind` | procedure | `cd_evento = '117' ` |
| `CD_EVENTO` | `117` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `117` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `118` | `sp_rel_flp_ind` | procedure | `cd_evento = '118' ` |
| `CD_EVENTO` | `118` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `118` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `119` | `sp_rel_flp_ind` | procedure | `cd_evento = '119' ` |
| `CD_EVENTO` | `119` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `119` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `120` | `sp_rel_flp_ind` | procedure | `cd_evento = '120' ` |
| `CD_EVENTO` | `120` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `120` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `121` | `sp_rel_flp_ind` | procedure | `cd_evento = '121' ` |
| `CD_EVENTO` | `121` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `121` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `122` | `sp_rel_flp_ind` | procedure | `cd_evento = '122' ` |
| `CD_EVENTO` | `122` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `122` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `123` | `sp_rel_flp_ind` | procedure | `cd_evento = '123' ` |
| `CD_EVENTO` | `123` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `123` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `124` | `sp_rel_flp_ind` | procedure | `cd_evento = '124' ` |
| `CD_EVENTO` | `124` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `124` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `130` | `TR_VIAGEM_DEADLINE` | trigger | `CD_EVENTO = '130' ` |
| `CD_EVENTO` | `130` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '130' ` |
| `CD_EVENTO` | `130` | `sp_rel_flp_ind` | procedure | `cd_evento = '130' ` |
| `CD_EVENTO` | `130` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `130` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `131` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '131'` |
| `CD_EVENTO` | `131` | `TR_PROC` | trigger | `CD_EVENTO = '131'` |
| `CD_EVENTO` | `131` | `sp_rel_flp_ind` | procedure | `cd_evento = '131' ` |
| `CD_EVENTO` | `131` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `131` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `132` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '132'` |
| `CD_EVENTO` | `132` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `132` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '132'` |
| `CD_EVENTO` | `132` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '132'` |
| `CD_EVENTO` | `132` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '132' ` |
| `CD_EVENTO` | `132` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '132' ` |
| `CD_EVENTO` | `132` | `sp_rel_exp_bordero` | procedure | `CD_EVENTO = '132'` |
| `CD_EVENTO` | `132` | `sp_rel_flp_ind` | procedure | `cd_evento = '132' ` |
| `CD_EVENTO` | `132` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `132` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `132` | `vw_Processo_Resumo` | view | `CD_EVENTO = '132' ` |
| `CD_EVENTO` | `133` | `sp_rel_flp_ind` | procedure | `cd_evento = '133' ` |
| `CD_EVENTO` | `133` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `133` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `135` | `sp_rel_flp_ind` | procedure | `cd_evento = '135' ` |
| `CD_EVENTO` | `135` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `135` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `136` | `sp_rel_flp_ind` | procedure | `cd_evento = '136' ` |
| `CD_EVENTO` | `136` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `136` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `139` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `140` | `sp_rel_flp_ind` | procedure | `cd_evento = '140' ` |
| `CD_EVENTO` | `140` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `140` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `141` | `sp_rel_flp_ind` | procedure | `cd_evento = '141' ` |
| `CD_EVENTO` | `141` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `141` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `143` | `sp_rel_flp_ind` | procedure | `cd_evento = '143' ` |
| `CD_EVENTO` | `143` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `143` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `145` | `sp_rel_flp_ind` | procedure | `cd_evento = '145' ` |
| `CD_EVENTO` | `145` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `145` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `146` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `146` | `TR_FOLLOWUP` | trigger | `CD_EVENTO IN ('146'` |
| `CD_EVENTO` | `146` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '146' ` |
| `CD_EVENTO` | `146` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '146' ` |
| `CD_EVENTO` | `147` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '147' ` |
| `CD_EVENTO` | `147` | `SP_NR_FATURA_NESTLE` | procedure | `CD_EVENTO = '147' ` |
| `CD_EVENTO` | `147` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '147'` |
| `CD_EVENTO` | `147` | `sp_atz_followup` | procedure | `CD_EVENTO = '147' ` |
| `CD_EVENTO` | `149` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `154` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '154' ` |
| `CD_EVENTO` | `154` | `sp_rel_lead_time2` | procedure | `CD_EVENTO IN ('154'` |
| `CD_EVENTO` | `161` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `161` | `TR_FOLLOWUP` | trigger | `CD_EVENTO IN ('161', '041', '297'` |
| `CD_EVENTO` | `161` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '161' ` |
| `CD_EVENTO` | `161` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '161' ` |
| `CD_EVENTO` | `161` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO IN ('161','257','041'` |
| `CD_EVENTO` | `161` | `sp_atz_myindaia_cash_flow` | procedure | `CD_EVENTO = '161' ` |
| `CD_EVENTO` | `161` | `sp_po_planilha` | procedure | `CD_EVENTO = '161' ` |
| `CD_EVENTO` | `162` | `SP_GRAVA_HISTORICO_CALCULO_DI` | procedure | `CD_EVENTO = '162'` |
| `CD_EVENTO` | `162` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_EVENTO = '162' ` |
| `CD_EVENTO` | `162` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `162` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `162` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '162'` |
| `CD_EVENTO` | `162` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '162'` |
| `CD_EVENTO` | `162` | `VW_FATO_IMPO` | view | `CD_EVENTO = '162'` |
| `CD_EVENTO` | `162` | `sp_calc_dt_demurrage` | procedure | `CD_EVENTO = '162' ` |
| `CD_EVENTO` | `162` | `sp_ev_prev_fabrica` | procedure | `cd_evento = '162' ` |
| `CD_EVENTO` | `162` | `sp_integracao` | procedure | `CD_EVENTO = 162` |
| `CD_EVENTO` | `162` | `sp_integracao` | procedure | `CD_EVENTO = 162` |
| `CD_EVENTO` | `162` | `sp_integracao_automatica` | procedure | `CD_EVENTO = 162` |
| `CD_EVENTO` | `162` | `sp_integracao_automatica` | procedure | `CD_EVENTO = 162` |
| `CD_EVENTO` | `162` | `sp_rel_acomp_proc` | procedure | `CD_EVENTO = '162' ` |
| `CD_EVENTO` | `162` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '162' ` |
| `CD_EVENTO` | `162` | `sp_rel_lead_time2` | procedure | `CD_EVENTO IN ('162'` |
| `CD_EVENTO` | `162` | `sp_rel_lead_time2` | procedure | `CD_EVENTO IN ('162'` |
| `CD_EVENTO` | `162` | `sp_rel_lead_time2` | procedure | `CD_EVENTO IN ('162'` |
| `CD_EVENTO` | `162` | `vw_Processo_Resumo` | view | `CD_EVENTO = '162' ` |
| `CD_EVENTO` | `164` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `164` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '164' ` |
| `CD_EVENTO` | `164` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '164' ` |
| `CD_EVENTO` | `164` | `sp_web_verifica_pedido` | procedure | `CD_EVENTO = '164' ` |
| `CD_EVENTO` | `165` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `168` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '168'` |
| `CD_EVENTO` | `170` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '170'` |
| `CD_EVENTO` | `170` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '170' ` |
| `CD_EVENTO` | `181` | `sp_rel_flp_ind` | procedure | `cd_evento = '181' ` |
| `CD_EVENTO` | `181` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `181` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `188` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '188' ` |
| `CD_EVENTO` | `188` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '188' ` |
| `CD_EVENTO` | `188` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '188' ` |
| `CD_EVENTO` | `188` | `sp_rel_flp_ind` | procedure | `cd_evento = '188' ` |
| `CD_EVENTO` | `188` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `188` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `189` | `sp_rel_flp_ind` | procedure | `cd_evento = '189' ` |
| `CD_EVENTO` | `189` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `189` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `204` | `sp_rel_flp_ind` | procedure | `cd_evento = '204' ` |
| `CD_EVENTO` | `204` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `204` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `207` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `214` | `sp_rel_flp_ind` | procedure | `cd_evento = '214' ` |
| `CD_EVENTO` | `214` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `214` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `216` | `VW_FATO_IMPO` | view | `CD_EVENTO = '216'` |
| `CD_EVENTO` | `217` | `sp_rel_flp_ind` | procedure | `cd_evento = '217' ` |
| `CD_EVENTO` | `217` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `217` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `219` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `233` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '233' ` |
| `CD_EVENTO` | `235` | `sp_rel_flp_ind` | procedure | `cd_evento = '235' ` |
| `CD_EVENTO` | `235` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `235` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `235` | `sp_rel_kpi_exportacao` | procedure | `CD_EVENTO = '235' ` |
| `CD_EVENTO` | `251` | `sp_rel_flp_ind` | procedure | `cd_evento = '251' ` |
| `CD_EVENTO` | `251` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `251` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `252` | `sp_rel_flp_ind` | procedure | `cd_evento = '252' ` |
| `CD_EVENTO` | `252` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `252` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `255` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '255' ` |
| `CD_EVENTO` | `256` | `sp_rel_fup_dia` | procedure | `CD_EVENTO = '256' ` |
| `CD_EVENTO` | `257` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO IN ('161','257','041'` |
| `CD_EVENTO` | `257` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_EVENTO = '257' ` |
| `CD_EVENTO` | `257` | `sp_rel_proc_andamento` | procedure | `CD_EVENTO = '257' ` |
| `CD_EVENTO` | `259` | `sp_rel_lead_time2` | procedure | `CD_EVENTO IN ('259'` |
| `CD_EVENTO` | `260` | `sp_rel_flp_ind` | procedure | `cd_evento = '260' ` |
| `CD_EVENTO` | `260` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `260` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `260` | `sp_rel_mapa_an` | procedure | `CD_EVENTO = '260' ` |
| `CD_EVENTO` | `261` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `261` | `sp_rel_mapa_an` | procedure | `CD_EVENTO = '261' ` |
| `CD_EVENTO` | `262` | `sp_rel_flp_ind` | procedure | `cd_evento = '262' ` |
| `CD_EVENTO` | `262` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `262` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `263` | `sp_po_planilha` | procedure | `CD_EVENTO = '263' ` |
| `CD_EVENTO` | `263` | `sp_rel_flp_ind` | procedure | `cd_evento = '263' ` |
| `CD_EVENTO` | `263` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `263` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `264` | `sp_rel_flp_ind` | procedure | `cd_evento = '264' ` |
| `CD_EVENTO` | `264` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `264` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `265` | `sp_rel_flp_ind` | procedure | `cd_evento = '265' ` |
| `CD_EVENTO` | `265` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `265` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `266` | `sp_rel_flp_ind` | procedure | `cd_evento = '266' ` |
| `CD_EVENTO` | `266` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `266` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `267` | `sp_rel_flp_ind` | procedure | `cd_evento = '267' ` |
| `CD_EVENTO` | `267` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `267` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `268` | `sp_rel_flp_ind` | procedure | `cd_evento = '268' ` |
| `CD_EVENTO` | `268` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `268` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `269` | `sp_rel_flp_ind` | procedure | `cd_evento = '269' ` |
| `CD_EVENTO` | `269` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `269` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '262', '252', '263', '113', '003', '119', '120', '264', '265', '266', '267', '268', '269` |
| `CD_EVENTO` | `270` | `TR_PROC` | trigger | `CD_EVENTO = '270' ` |
| `CD_EVENTO` | `270` | `TR_PROC` | trigger | `CD_EVENTO = '270' ` |
| `CD_EVENTO` | `270` | `TR_VIAGEM_DEADLINE` | trigger | `CD_EVENTO = '270' ` |
| `CD_EVENTO` | `270` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '270' ` |
| `CD_EVENTO` | `270` | `sp_atualiza_deadline` | procedure | `CD_EVENTO = '270' ` |
| `CD_EVENTO` | `270` | `sp_rel_flp_ind` | procedure | `cd_evento = '270' ` |
| `CD_EVENTO` | `270` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `270` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `271` | `TR_PROC` | trigger | `CD_EVENTO = '271' ` |
| `CD_EVENTO` | `271` | `TR_PROC` | trigger | `CD_EVENTO = '271' ` |
| `CD_EVENTO` | `271` | `TR_VIAGEM_DEADLINE` | trigger | `CD_EVENTO = '271' ` |
| `CD_EVENTO` | `271` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '271' ` |
| `CD_EVENTO` | `271` | `sp_atualiza_deadline` | procedure | `CD_EVENTO = '271' ` |
| `CD_EVENTO` | `271` | `sp_rel_flp_ind` | procedure | `cd_evento = '271' ` |
| `CD_EVENTO` | `271` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `271` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `272` | `sp_rel_flp_ind` | procedure | `cd_evento = '272' ` |
| `CD_EVENTO` | `272` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `272` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `273` | `sp_rel_flp_ind` | procedure | `cd_evento = '273' ` |
| `CD_EVENTO` | `273` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `273` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `274` | `sp_rel_flp_ind` | procedure | `cd_evento = '274' ` |
| `CD_EVENTO` | `274` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `274` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `275` | `sp_rel_flp_ind` | procedure | `cd_evento = '275' ` |
| `CD_EVENTO` | `275` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `275` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `276` | `sp_rel_flp_ind` | procedure | `cd_evento = '276' ` |
| `CD_EVENTO` | `276` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `276` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `277` | `sp_rel_flp_ind` | procedure | `cd_evento = '277' ` |
| `CD_EVENTO` | `277` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `277` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '270', '271', '272', '273', '274', '275', '131', '276', '277', '188', '189', '132', '260', '136` |
| `CD_EVENTO` | `278` | `sp_rel_flp_ind` | procedure | `cd_evento = '278' ` |
| `CD_EVENTO` | `278` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `278` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `279` | `sp_rel_flp_ind` | procedure | `cd_evento = '279' ` |
| `CD_EVENTO` | `279` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '113', '003', '267', '130', '270', '271', '272', '273', '274', '275', '277', '188', '189', '115` |
| `CD_EVENTO` | `279` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `280` | `sp_rel_flp_ind` | procedure | `cd_evento = '280' ` |
| `CD_EVENTO` | `280` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `280` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `281` | `sp_rel_flp_ind` | procedure | `cd_evento = '281' ` |
| `CD_EVENTO` | `281` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '251', '252', '119', '265', '269', '131', '276', '132', '260', '136', '204', '281', '214', '217` |
| `CD_EVENTO` | `281` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `282` | `sp_rel_flp_ind` | procedure | `cd_evento = '282' ` |
| `CD_EVENTO` | `282` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `282` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '278', '279', '117', '280', '118', '123', '121', '122', '235', '124', '088', '133', '204', '281` |
| `CD_EVENTO` | `283` | `sp_rel_flp_ind` | procedure | `cd_evento = '283' ` |
| `CD_EVENTO` | `283` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `283` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `284` | `sp_rel_flp_ind` | procedure | `cd_evento = '284' ` |
| `CD_EVENTO` | `284` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `284` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `285` | `sp_rel_flp_ind` | procedure | `cd_evento = '285' ` |
| `CD_EVENTO` | `285` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '120', '264', '266', '268', '118', '123', '282', '135', '143', '145', '283', '284', '285', '181` |
| `CD_EVENTO` | `285` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `286` | `sp_rel_flp_ind` | procedure | `cd_evento = '286' ` |
| `CD_EVENTO` | `286` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `286` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `287` | `sp_rel_flp_ind` | procedure | `cd_evento = '287' ` |
| `CD_EVENTO` | `287` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '135', '143', '145', '283', '284', '285', '181', '140', '214', '141', '217', '286', '092', '287` |
| `CD_EVENTO` | `287` | `sp_rel_flp_ind` | procedure | `cd_evento IN ( '262', '263', '117', '280', '141', '286', '092', '287' ` |
| `CD_EVENTO` | `289` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `289` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `289` | `sp_atz_followup` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `289` | `sp_atz_followup` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `289` | `sp_atz_followup` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `289` | `sp_atz_followup` | procedure | `CD_EVENTO = '289' ` |
| `CD_EVENTO` | `297` | `TR_FOLLOWUP` | trigger | `CD_EVENTO IN ('161', '041', '297'` |
| `CD_EVENTO` | `297` | `TR_PROC` | trigger | `CD_EVENTO = '297' ` |
| `CD_EVENTO` | `297` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '297' ` |
| `CD_EVENTO` | `300` | `sp_po_planilha` | procedure | `CD_EVENTO = '300' ` |
| `CD_EVENTO` | `313` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '313' ` |
| `CD_EVENTO` | `313` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '313' ` |
| `CD_EVENTO` | `314` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `314` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '314' ` |
| `CD_EVENTO` | `314` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '314' ` |
| `CD_EVENTO` | `314` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '314'` |
| `CD_EVENTO` | `314` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '314'` |
| `CD_EVENTO` | `314` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '314'` |
| `CD_EVENTO` | `314` | `VW_REL_DFF` | view | `CD_EVENTO = '314'` |
| `CD_EVENTO` | `315` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '315' ` |
| `CD_EVENTO` | `315` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '315' ` |
| `CD_EVENTO` | `315` | `VW_REL_DFT` | view | `CD_EVENTO = '315'` |
| `CD_EVENTO` | `333` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `333` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '333'` |
| `CD_EVENTO` | `333` | `TR_PROC` | trigger | `CD_EVENTO = '333'` |
| `CD_EVENTO` | `333` | `TR_PROC` | trigger | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `TR_PROC` | trigger | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `sp_atz_followup` | procedure | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `sp_atz_followup` | procedure | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `sp_atz_followup` | procedure | `CD_EVENTO = '333' ` |
| `CD_EVENTO` | `333` | `sp_rel_exp_bordero` | procedure | `CD_EVENTO = '333'` |
| `CD_EVENTO` | `351` | `sp_po_planilha` | procedure | `CD_EVENTO = '351' ` |
| `CD_EVENTO` | `354` | `sp_po_planilha` | procedure | `CD_EVENTO = '354' ` |
| `CD_EVENTO` | `355` | `sp_po_planilha` | procedure | `CD_EVENTO = '355' ` |
| `CD_EVENTO` | `359` | `sp_po_planilha` | procedure | `CD_EVENTO = '359' ` |
| `CD_EVENTO` | `375` | `sp_calc_laticionio` | procedure | `CD_EVENTO = '375' ` |
| `CD_EVENTO` | `381` | `VW_FATO_IMPO` | view | `CD_EVENTO = '381'` |
| `CD_EVENTO` | `387` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '387' ` |
| `CD_EVENTO` | `397` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '397'` |
| `CD_EVENTO` | `397` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '397' ` |
| `CD_EVENTO` | `397` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_EVENTO IN ('012', '018', '021', '041', '076', '088', '146', '161', '162', '164', '207', '050', '397'` |
| `CD_EVENTO` | `397` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `409` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '409' ` |
| `CD_EVENTO` | `409` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO IN ('409'` |
| `CD_EVENTO` | `416` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `416` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `416` | `VW_FATO_IMPO` | view | `CD_EVENTO = '416'` |
| `CD_EVENTO` | `421` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '421' ` |
| `CD_EVENTO` | `425` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `431` | `TR_VIAGEM_DEADLINE` | trigger | `CD_EVENTO = '431' ` |
| `CD_EVENTO` | `431` | `sp_atualiza_deadline` | procedure | `CD_EVENTO = '431' ` |
| `CD_EVENTO` | `486` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '486' ` |
| `CD_EVENTO` | `486` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_EVENTO = '486' ` |
| `CD_EVENTO` | `486` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_EVENTO = '486' ` |
| `CD_EVENTO` | `489` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `492` | `TR_TPROCESSO_EXP_NF_IUD_A` | trigger | `CD_EVENTO = '492'` |
| `CD_EVENTO` | `492` | `TR_TPROCESSO_EXP_NF_IUD_A` | trigger | `CD_EVENTO = '492' ` |
| `CD_EVENTO` | `497` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '497' ` |
| `CD_EVENTO` | `497` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '497' ` |
| `CD_EVENTO` | `500` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '500' ` |
| `CD_EVENTO` | `500` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '500' ` |
| `CD_EVENTO` | `500` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '500' ` |
| `CD_EVENTO` | `500` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '500' ` |
| `CD_EVENTO` | `500` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_EVENTO = '500' ` |
| `CD_EVENTO` | `506` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '506' ` |
| `CD_EVENTO` | `520` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '520' ` |
| `CD_EVENTO` | `520` | `sp_atz_followup` | procedure | `CD_EVENTO = '520' ` |
| `CD_EVENTO` | `522` | `VW_FATO_IMPO` | view | `CD_EVENTO = '522'` |
| `CD_EVENTO` | `528` | `TR_PROC` | trigger | `CD_EVENTO = '528' ` |
| `CD_EVENTO` | `528` | `TR_VIAGEM_DEADLINE` | trigger | `CD_EVENTO = '528' ` |
| `CD_EVENTO` | `528` | `TR_VIAGEM_REPASSE` | trigger | `CD_EVENTO = '528' ` |
| `CD_EVENTO` | `551` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `551` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `551` | `TR_PROC` | trigger | `CD_EVENTO = '551'` |
| `CD_EVENTO` | `551` | `TR_PROC` | trigger | `CD_EVENTO = '551' ` |
| `CD_EVENTO` | `555` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '555' ` |
| `CD_EVENTO` | `555` | `TR_FLP_PROCESSO_CNTR` | trigger | `CD_EVENTO = '555' ` |
| `CD_EVENTO` | `574` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `600` | `VW_FATO_IMPO` | view | `CD_EVENTO = '600'` |
| `CD_EVENTO` | `616` | `VW_FATO_IMPO` | view | `CD_EVENTO = '616'` |
| `CD_EVENTO` | `620` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '620' ` |
| `CD_EVENTO` | `621` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '621' ` |
| `CD_EVENTO` | `622` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '622' ` |
| `CD_EVENTO` | `622` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '622' ` |
| `CD_EVENTO` | `622` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '622' ` |
| `CD_EVENTO` | `653` | `sp_atz_myindaia_followup2` | procedure | `CD_EVENTO = '653' ` |
| `CD_EVENTO` | `668` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '668'` |
| `CD_EVENTO` | `668` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_EVENTO = '668' ` |
| `CD_EVENTO` | `668` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '668' ` |
| `CD_EVENTO` | `668` | `sp_atz_followup` | procedure | `CD_EVENTO = '668'` |
| `CD_EVENTO` | `668` | `sp_atz_followup` | procedure | `CD_EVENTO = '668' ` |
| `CD_EVENTO` | `668` | `sp_atz_followup` | procedure | `CD_EVENTO = '668' ` |
| `CD_EVENTO` | `720` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '720'` |
| `CD_EVENTO` | `720` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '720'` |
| `CD_EVENTO` | `720` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '720' ` |
| `CD_EVENTO` | `798` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('798','551','416','021','088','041','114','092','574','333','113','489','088','132','165','139',` |
| `CD_EVENTO` | `800` | `TR_ATZ_VISUALCUE` | trigger | `CD_EVENTO IN ('020','425','219','800','551','082','162','416','012','397', ` |
| `CD_EVENTO` | `838` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '838'` |
| `CD_EVENTO` | `848` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '848' ` |
| `CD_EVENTO` | `896` | `VW_FATO_IMPO` | view | `CD_EVENTO = '896'` |
| `CD_EVENTO` | `912` | `TR_FOLLOWUP` | trigger | `CD_EVENTO = '912' ` |
| `CD_EVENTO` | `931` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '931'` |
| `CD_EVENTO` | `931` | `TPROCESSO_LI_ORGAO_ANUENTE_ATZ_FOLLOWUP` | trigger | `CD_EVENTO = '931' ` |
| `CD_EVENTO` | `947` | `VW_FATO_IMPO` | view | `CD_EVENTO = '947'` |
| `CD_EVENTO` | `972` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '972'` |
| `CD_EVENTO` | `972` | `TR_PROCESSO_CNTR` | trigger | `CD_EVENTO = '972' ` |
| `CD_EVENTO` | `X` | `sp_ev_prev_fabrica` | procedure | `cd_evento = 'X' ` |
| `CD_EVENTO` | `X` | `sp_rel_po_flp` | procedure | `cd_evento = 'X' ` |
| `CD_EVENTO` | `X` | `sp_rel_po_flp` | procedure | `cd_evento = 'X' ` |
| `CD_EVENTO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_evento = 'XXX' ` |
| `CD_EVENTO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_evento = 'XXX' ` |
| `CD_EVENTO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_evento = 'XXX' ` |
| `CD_GRUPO` | `+ @CD_GRUPO  +` | `sp_cria_mbf_resultado` | procedure | `CD_GRUPO = ''' + @CD_GRUPO + ''' ` |
| `CD_GRUPO` | `+ @CD_GRUPO  +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_GRUPO = ''' + @CD_GRUPO + ''' ` |
| `CD_GRUPO` | `+ @CD_GRUPO +` | `sp_cria_mbf_resultado` | procedure | `CD_GRUPO = ''' + @CD_GRUPO + ''' ` |
| `CD_GRUPO` | `+ @CD_GRUPO +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_GRUPO = ''' + @CD_GRUPO + ''' ` |
| `CD_GRUPO` | `+@tx_filtro+` | `sp_rel_fat_ciclo_money` | procedure | `CD_GRUPO = '''+@tx_filtro+''' ` |
| `CD_GRUPO` | `+@tx_filtro+` | `sp_rel_fat_notas_fiscais_money` | procedure | `CD_GRUPO IN ('''+@tx_filtro+''',''` |
| `CD_GRUPO` | `+@tx_filtro+` | `sp_rel_imp_ctrl_li_novo` | procedure | `CD_GRUPO = '''+@tx_filtro+''' ` |
| `CD_GRUPO` | `001` | `sp_proc_pag_desemb` | procedure | `cd_grupo = '001' ` |
| `CD_GRUPO` | `001` | `sp_proc_pag_desemb_li` | procedure | `cd_grupo = '001' ` |
| `CD_GRUPO` | `002` | `sp_atz_tdocumento_instrucao` | procedure | `CD_GRUPO IN ('002', '005', '008', '013'` |
| `CD_GRUPO` | `002` | `sp_fin_gera_tab_juros` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_po_planilha` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_canal_mes` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_canal_mes_mod2` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_cli_cc` | procedure | `CD_GRUPO <> '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_cli_cc` | procedure | `CD_GRUPO = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_cntr_nao_dev` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_controle_proc` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_dem_est` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_dem_gerencial` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_dem_gerencial2` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_desvios` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_est_armz_carga` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_est_demurrage` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_est_mercadoria` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_est_volumes_mod2` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_ev_critico` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_ev_critico_po` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_exp_flp` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_exp_re` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_imp_demurrage` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_kpi_exportacao` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_kpi_exportacao1` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_lead_time` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_lead_time_teste` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_num_nao_rec` | procedure | `cd_GRUPO = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_pagto_basf` | procedure | `CD_GRUPO = '002' ` |
| `CD_GRUPO` | `002` | `sp_rel_previsao_po_nacionalizar` | procedure | `cd_grupo = '002' ` |
| `CD_GRUPO` | `003` | `sp_rel_demo_cc` | procedure | `cd_grupo = '003' ` |
| `CD_GRUPO` | `003` | `sp_rel_fat_saldos` | procedure | `cd_grupo = '003' ` |
| `CD_GRUPO` | `005` | `sp_atz_tdocumento_instrucao` | procedure | `CD_GRUPO IN ('002', '005', '008', '013'` |
| `CD_GRUPO` | `006` | `sp_ddimport_custo_job` | procedure | `CD_GRUPO = '006' ` |
| `CD_GRUPO` | `006` | `sp_ddimport_flp_job` | procedure | `CD_GRUPO = '006' ` |
| `CD_GRUPO` | `008` | `sp_atz_tdocumento_instrucao` | procedure | `CD_GRUPO IN ('002', '005', '008', '013'` |
| `CD_GRUPO` | `008` | `sp_cancel_rel` | procedure | `cd_grupo = '008' ` |
| `CD_GRUPO` | `008` | `sp_liq_rel` | procedure | `cd_grupo = '008' ` |
| `CD_GRUPO` | `010` | `sp_gastos_armazenagem` | procedure | `cd_grupo = '010' ` |
| `CD_GRUPO` | `013` | `sp_atz_tdocumento_instrucao` | procedure | `CD_GRUPO IN ('002', '005', '008', '013'` |
| `CD_GRUPO` | `013` | `sp_rel_fin` | procedure | `cd_grupo = '013' ` |
| `CD_GRUPO` | `018` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO IN ('C82','018'` |
| `CD_GRUPO` | `028` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_GRUPO IN ('028','069','152'` |
| `CD_GRUPO` | `028` | `TR_TPROCESSO_EXP_NF_IUD_A` | trigger | `CD_GRUPO IN ('028'` |
| `CD_GRUPO` | `028` | `TR_TPROCESSO_EXP_NF_IUD_A` | trigger | `CD_GRUPO IN ('028'` |
| `CD_GRUPO` | `028` | `sp_calcula_sda` | procedure | `CD_GRUPO IN ('028', '329', '923', '106'` |
| `CD_GRUPO` | `028` | `sp_liq_processo` | procedure | `cd_grupo = '028' ` |
| `CD_GRUPO` | `036` | `sp_rel_acomp_proc` | procedure | `cd_grupo = '036', ` |
| `CD_GRUPO` | `036` | `sp_rel_mapa_an` | procedure | `cd_grupo = '036' ` |
| `CD_GRUPO` | `036` | `sp_rel_proc_andamento` | procedure | `cd_grupo = '036' ` |
| `CD_GRUPO` | `036` | `sp_rel_proc_desembaracados` | procedure | `cd_grupo = '036' ` |
| `CD_GRUPO` | `065` | `sp_custos_job` | procedure | `CD_GRUPO = '065' ` |
| `CD_GRUPO` | `065` | `sp_followup_job` | procedure | `CD_GRUPO = '065' ` |
| `CD_GRUPO` | `069` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_GRUPO IN ('028','069','152'` |
| `CD_GRUPO` | `070` | `sp_rel_desp` | procedure | `cd_grupo = '070' ` |
| `CD_GRUPO` | `083` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TFLP_PO_ITEM_EV500_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `083` | `TR_TPO_ITEM_URGENTE_CRODA` | trigger | `CD_GRUPO = '083' ` |
| `CD_GRUPO` | `106` | `sp_calcula_sda` | procedure | `CD_GRUPO IN ('028', '329', '923', '106'` |
| `CD_GRUPO` | `118` | `sp_exp_calcula` | procedure | `CD_GRUPO = '118' ` |
| `CD_GRUPO` | `118` | `sp_exp_calcula` | procedure | `CD_GRUPO = '118' ` |
| `CD_GRUPO` | `152` | `TR_ATZ_MYINDAIA_FOLLOWUP` | trigger | `CD_GRUPO IN ('028','069','152'` |
| `CD_GRUPO` | `155` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `SP_NR_FATURA_NESTLE` | procedure | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155'` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_FOLLOWUP` | trigger | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `155` | `TR_PROC` | trigger | `CD_GRUPO != '155' ` |
| `CD_GRUPO` | `155` | `TR_PROC` | trigger | `CD_GRUPO = '155'` |
| `CD_GRUPO` | `155` | `sp_exp_calcula` | procedure | `CD_GRUPO = '155' ` |
| `CD_GRUPO` | `329` | `sp_calcula_sda` | procedure | `CD_GRUPO IN ('028', '329', '923', '106'` |
| `CD_GRUPO` | `480` | `sp_rel_lead_time2` | procedure | `cd_grupo = '480' ` |
| `CD_GRUPO` | `560` | `sp_exp_monta_re` | procedure | `CD_GRUPO = '560' ` |
| `CD_GRUPO` | `923` | `sp_calcula_sda` | procedure | `CD_GRUPO IN ('028', '329', '923', '106'` |
| `CD_GRUPO` | `986` | `INSERE_RE_MANTENCAO` | trigger | `CD_GRUPO = '986' ` |
| `CD_GRUPO` | `986` | `SP_RE_CLASSIFICA_ANEXO_NOVOEX` | procedure | `CD_GRUPO = '986' ` |
| `CD_GRUPO` | `B31` | `SP_RE_CLASSIFICA_ANEXO_NOVOEX` | procedure | `CD_GRUPO = 'B31' ` |
| `CD_GRUPO` | `B31Z` | `sp_exp_monta_re` | procedure | `CD_GRUPO = 'B31Z' ` |
| `CD_GRUPO` | `B77` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO = 'B77' ` |
| `CD_GRUPO` | `C68` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO IN ('C68','C69'` |
| `CD_GRUPO` | `C69` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO IN ('C68','C69'` |
| `CD_GRUPO` | `C82` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO IN ('C82','018'` |
| `CD_GRUPO` | `C90` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO IN ('C90'` |
| `CD_GRUPO` | `D03` | `SP_OBSERVACOES_DI_REGRAS` | procedure | `CD_GRUPO = 'D03' ` |
| `CD_GRUPO` | `X` | `sp_cancel_rel` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_cancel_rel` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_cancel_rel` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_cancel_rel` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_custo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_custo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_flp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_flp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_cancel_grupo` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_cancel_grupo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_grupo` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_grupo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_rel` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_rel` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_liq_rel` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_mapa_mensal` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_armaz_rem` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_bol_port` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_canal_mes_mod2` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cli_cc_resumo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cliente_arm` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_grupo = 'X', ` |
| `CD_GRUPO` | `X` | `sp_rel_cont_averb` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cont_averb` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cont_averb` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_cont_averb` | procedure | `cd_grupo = 'X', ` |
| `CD_GRUPO` | `X` | `sp_rel_controle_emb` | procedure | `cd_grupo = 'X', ` |
| `CD_GRUPO` | `X` | `sp_rel_ctrl_demurrage` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_dem_cliente` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_dem_est` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_dem_gerencial` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_di_reg_desemb` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_emitido_cancelado` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_arm_demurrage` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_arm_prefixo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_demurrage` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_desp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_mercadoria` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_volumes` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_volumes` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_est_volumes` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_exp_emb_averb` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fat_pago_cli` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fat_pend_boleto` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fat_pend_boleto` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fin` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fin` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fin` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fin` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fin` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_flp_ind` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fluxo_op` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fluxo_op` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_followup_navio` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_fup_dia` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_kpi_exportacao1` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_lead_time_teste` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_liquidacao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_liquidacao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_liquidacao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_mapa_an` | procedure | `cd_grupo = 'X'` |
| `CD_GRUPO` | `X` | `sp_rel_nao_desemb_di` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_nr_processos` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_num_nao_rec` | procedure | `cd_grupo = 'X'` |
| `CD_GRUPO` | `X` | `sp_rel_pagto` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto_basf` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto_pend` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto_pend` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto_razao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_pagto_razao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_po_flp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_po_flp` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_qt_processos` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_rec_liq` | procedure | `cd_grupo <> 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_rec_liq` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_rent_proc` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_rent_proc` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_rent_proc` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_requerimento` | procedure | `cd_grupo = 'X', ` |
| `CD_GRUPO` | `X` | `sp_rel_resumo_fat` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_resumo_fat_itens` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_retencao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_rel_retencao` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `X` | `sp_tot_serv_cli_periodo` | procedure | `cd_grupo = 'X' ` |
| `CD_GRUPO` | `XXX` | `SP_LISTA_EVENTOS_PROCESSO` | procedure | `CD_GRUPO IN ('XXX', ` |
| `CD_GRUPO` | `XXX` | `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | `CD_GRUPO IN ('XXX', ` |
| `CD_GRUPO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_grupo = 'XXX' ` |
| `CD_GRUPO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_grupo = 'XXX' ` |
| `CD_GRUPO` | `XXX` | `sp_atz_ref_cliente` | procedure | `cd_grupo = 'XXX' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '01' ` |
| `CD_MODAL` | `01` | `TR_FOLLOWUP` | trigger | `CD_MODAL IN ('01', '04'` |
| `CD_MODAL` | `04` | `TR_FOLLOWUP` | trigger | `CD_MODAL <> '04'` |
| `CD_MODAL` | `04` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '04' ` |
| `CD_MODAL` | `04` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '04' ` |
| `CD_MODAL` | `04` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '04' ` |
| `CD_MODAL` | `04` | `TR_FOLLOWUP` | trigger | `CD_MODAL IN ('01', '04'` |
| `CD_MODAL` | `07` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '07' ` |
| `CD_MODAL` | `07` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '07' ` |
| `CD_MODAL` | `07` | `TR_FOLLOWUP` | trigger | `CD_MODAL = '07' ` |
| `CD_MODAL` | `X` | `sp_rel_mapa_an` | procedure | `cd_modal = 'X' ` |
| `CD_MODAL` | `X` | `sp_rel_nr_processos` | procedure | `cd_modal = 'X' ` |
| `CD_MODAL` | `X` | `sp_rel_qt_processos` | procedure | `cd_modal = 'X' ` |
| `CD_PAIS` | `X` | `sp_rel_controle_proc` | procedure | `cd_pais = 'X' ` |
| `CD_PRODUTO` | `+ @CD_PRODUTO +` | `sp_cria_mbf_resultado` | procedure | `CD_PRODUTO = ' + @CD_PRODUTO + ' ` |
| `CD_PRODUTO` | `+ @CD_PRODUTO +` | `sp_cria_mbf_resultado` | procedure | `CD_PRODUTO = ''' + @CD_PRODUTO + ''' ` |
| `CD_PRODUTO` | `+ @CD_PRODUTO +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_PRODUTO = ' + @CD_PRODUTO + ' ` |
| `CD_PRODUTO` | `+ @CD_PRODUTO +` | `sp_cria_mbf_resultado_urgente` | procedure | `CD_PRODUTO = ''' + @CD_PRODUTO + ''' ` |
| `CD_PRODUTO` | `+@cd_produto+` | `sp_nf_serv_op` | procedure | `CD_PRODUTO = '''+@cd_produto+''' ` |
| `CD_PRODUTO` | `+@cd_produto+` | `sp_nf_serv_op` | procedure | `CD_PRODUTO = '''+@cd_produto+''' ` |
| `CD_PRODUTO` | `+@tx_filtro+` | `sp_rel_fat_ciclo_money` | procedure | `CD_PRODUTO = '''+@tx_filtro+''' ` |
| `CD_PRODUTO` | `01` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `01` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `01` | `TR_NUM` | trigger | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `TR_PROC` | trigger | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `TR_PROC` | trigger | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `TR_PROC` | trigger | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `TR_PROC` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `01` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `01` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `01` | `sp_atz_ev_nao_real` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_flp_po` | procedure | `CD_PRODUTO <> '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_flp_po_item` | procedure | `CD_PRODUTO <> '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('01'` |
| `CD_PRODUTO` | `01` | `sp_atz_myindaia_cash_flow` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_myindaia_rateio` | procedure | `CD_PRODUTO IN ('01','03'` |
| `CD_PRODUTO` | `01` | `sp_atz_myindaia_rateio_bkp_20180323` | procedure | `CD_PRODUTO IN ('01','03'` |
| `CD_PRODUTO` | `01` | `sp_atz_num_imp` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_num_imp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_atz_recebimento` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_atz_ref_cliente` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_calc_sda_imp` | procedure | `CD_PRODUTO = '01', ` |
| `CD_PRODUTO` | `01` | `sp_calcula_sda` | procedure | `CD_PRODUTO = '01'` |
| `CD_PRODUTO` | `01` | `sp_calcula_sda` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_calcula_sda` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_cancela_distr_sda` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_cria_ensaios` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_custos_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_custo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_custo` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_custo_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_flp` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_flp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_flp_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_flp_sea` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ddimport_flp_sea` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_despesa_grupo` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_atz_rateio_imp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_calc_item_complementar` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_calculo` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_calculo_exp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_calculo_rateio_despesas` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_calculo_rateio_exp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_canc` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_consiste_rateio_money` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_item_complementar` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_pagos_cli` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_rateio_exp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_rateio_imp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fat_saldos` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_fin_gera_tab_juros` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_follow_up` | procedure | `CD_PRODUTO IN ('01'` |
| `CD_PRODUTO` | `01` | `sp_followup_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_gerar_master` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_mapa_mensal` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_mapa_mensal` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_nf_serv_op` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_po_planilha` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_proc_ab_fat` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_proc_pag_desemb` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_proc_pag_desemb` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_proc_pag_desemb_li` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_proc_pag_desemb_li` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_acomp_proc` | procedure | `cd_produto = '01', ` |
| `CD_PRODUTO` | `01` | `sp_rel_and_servico` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_armaz_rem` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_bol_port` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_cliente_arm` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_cntr_nao_dev` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_cntr_origem` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_cntr_origem` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_com_imp_exp` | procedure | `cd_produto = '01', ` |
| `CD_PRODUTO` | `01` | `sp_rel_dem_cliente` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_dem_est` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_dem_gerencial` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_dem_gerencial2` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_demo_cc` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_desp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_desp_pagto` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_desvios` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_di_reg_desemb` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_ensaio` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_ensaio` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_est_armz_carga` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_est_cntr_vl_cif` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_est_demurrage` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_est_mercadoria` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_ev_critico` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_ev_critico_po` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_fat_pend_boleto` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_fat_saldos` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_fin` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '01', '02' ` |
| `CD_PRODUTO` | `01` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `01` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `01` | `sp_rel_followup_navio` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_fup_dia` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_imp_demurrage` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_lead_time` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_lead_time_teste` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_liquidacao` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_nao_desemb_di` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_num_nao_rec` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_pagto` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_pagto_basf` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_pagto_basf` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_proc_andamento` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_qt_processos` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_rent_proc` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_req_pagtos` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_requerimento` | procedure | `cd_produto = '01', ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '06'` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '06', '17'` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_relacao_clientes` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_tot_serv_cli_periodo` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_valores_cif_fob` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_valores_cif_fob` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `01` | `sp_verif_rateio_desp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_verif_rateio_desp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_verif_rateio_exp` | procedure | `cd_produto = '01' ` |
| `CD_PRODUTO` | `01` | `sp_web_verifica_estagio` | procedure | `CD_PRODUTO = '01' ` |
| `CD_PRODUTO` | `02` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `SP_ATUALIZA_FUP_DEMURRAGE_PROCESSOS_VIAGEM` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_NUM` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_PROC` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_PROC` | trigger | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_DEADLINE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_DEADLINE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_DEADLINE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_DEADLINE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_DEADLINE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sea_sp_processo_new` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sea_sp_processo_new` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_abre_processo` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_atualiza_deadline` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_atualiza_deadline` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_atualiza_deadline` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `sp_atz_recebimento` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_calc_vmle_mn` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_calcula_sda` | procedure | `CD_PRODUTO = '02'` |
| `CD_PRODUTO` | `02` | `sp_calcula_sda` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_cria_ensaios` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_despesa_grupo` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_despesa_grupo` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_fat_consiste_rateio` | procedure | `cd_produto = '02'` |
| `CD_PRODUTO` | `02` | `sp_fat_consiste_rateio` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_follow_up` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_gastos_armazenagem` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_nf_serv_op` | procedure | `cd_produto <> '02' ` |
| `CD_PRODUTO` | `02` | `sp_nf_serv_op` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_nf_serv_op` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_cntr_origem` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_cntr_origem` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_controle_proc` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_controle_proc` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_controle_proc` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_ensaio` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_cntr_vl_cif` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_mercadoria` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_est_mercadoria` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_emb_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_exp_flp` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_flp_ind` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_flp_ind` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '01', '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_kpi_exportacao` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_kpi_exportacao1` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_mapa_an` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_mapa_an` | procedure | `cd_produto = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO = '02' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `02` | `sp_web_verifica_followup` | procedure | `CD_PRODUTO IN ('02','10'` |
| `CD_PRODUTO` | `03` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `03` | `TR_FOLLOWUP` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `03` | `TR_PROC` | trigger | `CD_PRODUTO = '03'` |
| `CD_PRODUTO` | `03` | `TR_PROC` | trigger | `CD_PRODUTO IN ('01', '03'` |
| `CD_PRODUTO` | `03` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `03` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `03` | `sp_atz_myindaia_rateio` | procedure | `CD_PRODUTO IN ('01','03'` |
| `CD_PRODUTO` | `03` | `sp_atz_myindaia_rateio_bkp_20180323` | procedure | `CD_PRODUTO IN ('01','03'` |
| `CD_PRODUTO` | `03` | `sp_atz_recebimento` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_calcula_sda` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_cria_ensaios` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_custos_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport_custo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport_custo_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport_flp` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport_flp_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ddimport_flp_sea` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_despesa_grupo` | procedure | `CD_PRODUTO = '03' ` |
| `CD_PRODUTO` | `03` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_produto = '03' ` |
| `CD_PRODUTO` | `03` | `sp_followup_job` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_gerar_master` | procedure | `cd_produto = '03' ` |
| `CD_PRODUTO` | `03` | `sp_nf_serv_op` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_proc_pag_desemb` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_proc_pag_desemb_li` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_cntr_origem` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_cntr_origem` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_controle_emb` | procedure | `cd_produto = '03', ` |
| `CD_PRODUTO` | `03` | `sp_rel_ensaio` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_est_cntr_vl_cif` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_est_mercadoria` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '03', '10' ` |
| `CD_PRODUTO` | `03` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '03', '10' ` |
| `CD_PRODUTO` | `03` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `03` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `03` | `sp_rel_imp_demurrage` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_pagto_basf` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_valores_cif_fob` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_valores_cif_fob` | procedure | `cd_produto IN ( '01', '03' ` |
| `CD_PRODUTO` | `03` | `sp_verif_rateio_desp` | procedure | `cd_produto = '03' ` |
| `CD_PRODUTO` | `06` | `TR_PROC` | trigger | `CD_PRODUTO = '06' ` |
| `CD_PRODUTO` | `06` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `06` | `TR_VIAGEM_REPASSE` | trigger | `CD_PRODUTO IN ('01','03','06'` |
| `CD_PRODUTO` | `06` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '06'` |
| `CD_PRODUTO` | `06` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '06', '17'` |
| `CD_PRODUTO` | `06` | `sp_web_verifica_estagio` | procedure | `CD_PRODUTO = '06' ` |
| `CD_PRODUTO` | `10` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `TR_PROC` | trigger | `CD_PRODUTO = '10'` |
| `CD_PRODUTO` | `10` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `TR_PROC` | trigger | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `sea_sp_processo_new` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sea_sp_processo_new` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_abre_processo` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `sp_atz_followup` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `sp_atz_recebimento` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_cria_ensaios` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_despesa_grupo` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_produto = '10' ` |
| `CD_PRODUTO` | `10` | `sp_fat_consiste_rateio` | procedure | `cd_produto = '10'` |
| `CD_PRODUTO` | `10` | `sp_nf_serv_op` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_and_processo_exp` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_cntr_origem` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_cntr_origem` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_cont_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_ensaio` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_est_cntr_vl_cif` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_est_mercadoria` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_est_mercadoria` | procedure | `cd_produto IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_exp_emb_averb` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_flp_aut_envio` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '03', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_flx_cx` | procedure | `CD_PRODUTO IN ( '03', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_followup_aut` | procedure | `CD_PRODUTO IN ( '01', '02', '03', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_kpi_exportacao` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_kpi_exportacao1` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '10'` |
| `CD_PRODUTO` | `10` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_rel_resumo_fat_itens` | procedure | `CD_PRODUTO IN ( '02', '10' ` |
| `CD_PRODUTO` | `10` | `sp_web_verifica_followup` | procedure | `CD_PRODUTO IN ('02','10'` |
| `CD_PRODUTO` | `17` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '06', '17'` |
| `CD_PRODUTO` | `17` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `17` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `17` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('01', '17'` |
| `CD_PRODUTO` | `18` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `18` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `18` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `18` | `sp_rel_resumo_fat` | procedure | `CD_PRODUTO IN ('02', '18'` |
| `CD_PRODUTO` | `X` | `sp_ddimport_custo` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_ddimport_flp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_fin_gera_tab_juros` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_ordena_rank_receita` | procedure | `cd_produto = 'X'` |
| `CD_PRODUTO` | `X` | `sp_ordena_rank_receita` | procedure | `cd_produto = 'X'` |
| `CD_PRODUTO` | `X` | `sp_ordena_rank_receita` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_acomp_proc` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_bol_port` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_cntr_origem` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_ctrl_demurrage` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_dem_est` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_dem_gerencial` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_arm_demurrage` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_arm_prefixo` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_desp` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_mercadoria` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_mercadoria` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_volumes` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_volumes` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_volumes` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_est_volumes_mod2` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_fat_pago_cli` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_fat_pend_boleto` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_fin` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_fluxo_op` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_lead_time2` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_lead_time_teste` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_liquidacao` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_liquidacao` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_nr_processos` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_num_nao_rec` | procedure | `cd_produto = 'X'` |
| `CD_PRODUTO` | `X` | `sp_rel_pagto` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_pagto_pend` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_pagto_pend` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_rec_liq` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_rent_proc` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_rent_proc` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_req_pagtos` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_retencao` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `X` | `sp_rel_retencao` | procedure | `cd_produto = 'X' ` |
| `CD_PRODUTO` | `XX` | `SP_LISTA_EVENTOS_PROCESSO` | procedure | `CD_PRODUTO IN ('XX', ` |
| `CD_PRODUTO` | `XX` | `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | `CD_PRODUTO IN ('XX', ` |
| `CD_RESPONSAVEL` | `D` | `sp_atz_ref_cliente` | procedure | `cd_responsavel = 'D' ` |
| `CD_RESPONSAVEL` | `X` | `sp_atz_ev_nao_real` | procedure | `cd_responsavel = 'X' ` |
| `CD_RESPONSAVEL` | `X` | `sp_atz_ref_cliente` | procedure | `cd_responsavel = 'X' ` |
| `CD_RESPONSAVEL` | `X` | `sp_atz_ref_cliente` | procedure | `cd_responsavel = 'X' ` |
| `CD_SERVICO` | `+ @CD_SERVICO +` | `TR_SERVICO_EVENTO_DASHBOARD` | trigger | `CD_SERVICO = ''' + @CD_SERVICO + '''` |
| `CD_SERVICO` | `0` | `SP_LISTA_EVENTOS_PROCESSO` | procedure | `CD_SERVICO IN (0` |
| `CD_SERVICO` | `0` | `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | `CD_SERVICO IN (0` |
| `CD_SERVICO` | `001` | `sp_fat_item_complementar` | procedure | `cd_servico = '001' ` |
| `CD_SERVICO` | `016` | `sp_rel_followup_navio` | procedure | `cd_servico = '016' ` |
| `CD_SERVICO` | `261` | `sp_flp_po` | procedure | `cd_servico = '261' ` |
| `CD_SERVICO` | `4` | `TR_PROC` | trigger | `CD_SERVICO <> 4` |
| `CD_SERVICO` | `4` | `TR_PROC` | trigger | `CD_SERVICO = 4` |
| `CD_SERVICO` | `445` | `sp_flp_po_item` | procedure | `cd_servico = '445', ` |
| `CD_SERVICO` | `6` | `TR_FOLLOWUP` | trigger | `CD_SERVICO = '6' ` |
| `CD_SERVICO` | `706` | `SP_GRAVA_HISTORICO_CALCULO_DI` | procedure | `CD_SERVICO = '706'` |
| `CD_SERVICO` | `706` | `SP_GRAVA_HISTORICO_CALCULO_DI` | procedure | `CD_SERVICO = '706'` |
| `CD_SERVICO` | `X` | `sp_rel_cliente_arm` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_servico = 'X', ` |
| `CD_SERVICO` | `X` | `sp_rel_cont_averb` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_cont_averb` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_cont_averb` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_cont_averb` | procedure | `cd_servico = 'X', ` |
| `CD_SERVICO` | `X` | `sp_rel_po_flp` | procedure | `cd_servico = 'X' ` |
| `CD_SERVICO` | `X` | `sp_rel_po_flp` | procedure | `cd_servico = 'X' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_atz_ev_flp_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_flp_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `00` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '00' ` |
| `CD_TIPO_EVENTO` | `01` | `sp_flp_po_item` | procedure | `CD_TIPO_EVENTO = '01' ` |
| `CD_TIPO_EVENTO` | `01` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '01' ` |
| `CD_TIPO_EVENTO` | `01` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '01' ` |
| `CD_TIPO_EVENTO` | `01` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '01' ` |
| `CD_TIPO_EVENTO` | `01` | `sp_rel_ev_critico_po` | procedure | `CD_TIPO_EVENTO = '01' ` |
| `CD_UNID_NEG` | `*` | `sp_fat_extrato` | procedure | `cd_unid_neg = '*'` |
| `CD_UNID_NEG` | `*` | `sp_fat_extrato` | procedure | `cd_unid_neg = '*'` |
| `CD_UNID_NEG` | `+@cd_unid_neg+` | `sp_nf_serv_op` | procedure | `CD_UNID_NEG = '''+@cd_unid_neg+''' ` |
| `CD_UNID_NEG` | `+@cd_unid_neg+` | `sp_nf_serv_op` | procedure | `CD_UNID_NEG = '''+@cd_unid_neg+''' ` |
| `CD_UNID_NEG` | `01` | `SP_ATUALIZA_FUP_DEMURRAGE_PROCESSOS_VIAGEM` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_ev_nao_real` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_liq_vl_acresc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_liq_vl_desc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_num_imp` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_num_imp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_atz_ref_cliente` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_cancel_rel` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_conciliacao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_rm_tito` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_si` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_si` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_si` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_si` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_contabiliza_si` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_ddimport` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_ddimport_custo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_ddimport_flp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_ddimport_flp_sea` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_despesa_grupo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_distribui_liquidacao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_ev_prev_fabrica_viagem` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_atz_rateio_imp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_calc_item_complementar` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_calculo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_calculo_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_calculo_rateio_despesas` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_calculo_rateio_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_canc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_consiste_rateio` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_item_complementar` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_pagos_cli` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_rateio_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_rateio_imp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fat_saldos` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fecha_caixa` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_fin_gera_tab_juros` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_gastos_armazenagem` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_gerar_master` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_liq_cancel_grupo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_liq_grupo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_liq_rel` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_mapa_mensal` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_nf_serv_op` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_origina_recebimento_ag` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_pe_monta_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_po_planilha` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_proc_ab_fat` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_proc_pag_desemb` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_proc_pag_desemb_li` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_acomp_proc` | procedure | `cd_unid_neg = '01', ` |
| `CD_UNID_NEG` | `01` | `sp_rel_and_processo_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_and_servico` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_armaz_rem` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_bol_port` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_canal_mes` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_canal_mes_mod2` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_cli_cc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_cli_cc_resumo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_cliente_arm` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_cntr_nao_dev` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_cntr_origem` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_com_imp_exp` | procedure | `cd_unid_neg = '01', ` |
| `CD_UNID_NEG` | `01` | `sp_rel_controle_emb` | procedure | `cd_unid_neg = '01', ` |
| `CD_UNID_NEG` | `01` | `sp_rel_controle_proc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_dem_cliente` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_dem_est` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_dem_gerencial` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_dem_gerencial2` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_demo_cc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_desp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_desp_pagto` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_desvios` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_ensaio` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_arm_demurrage` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_arm_prefixo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_armz_carga` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_demurrage` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_desp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_mercadoria` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_volumes` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_est_volumes_mod2` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_ev_critico` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_ev_critico_po` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_exp_emb_averb` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_exp_flp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_exp_re` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscal` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscal` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscal` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscal` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscalteste` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscalteste` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscalteste` | procedure | `CD_UNID_NEG = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_livro_fiscalteste` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_pago_cli` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_pend_boleto` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fat_saldos` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fin` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_flp_ind` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '01'` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fluxo_op` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_flx_cx` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_followup_navio` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_fup_dia` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_imp_demurrage` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_kpi_exportacao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_kpi_exportacao1` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_lead_time` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_lead_time_teste` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_liquidacao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_mapa_an` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_nao_desemb_di` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_nr_processos` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_num_nao_rec` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_pagto` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_pagto_basf` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_pagto_razao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_po_flp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_previsao_po_nacionalizar` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_proc_andamento` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_proc_desembaracados` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_qt_processos` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_rec_liq` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_rent_proc` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_req_pagtos` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_requerimento` | procedure | `cd_unid_neg = '01', ` |
| `CD_UNID_NEG` | `01` | `sp_rel_resumo_fat` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_resumo_fat_itens` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_retencao` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_rel_sda_extrato` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_relacao_clientes` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_tot_serv_cli_periodo` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_verif_rateio_desp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `01` | `sp_verif_rateio_exp` | procedure | `cd_unid_neg = '01' ` |
| `CD_UNID_NEG` | `02` | `sp_di_adicao_com_li` | procedure | `CD_UNID_NEG = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_fat_calculo` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_fat_calculo_exp` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_nf_serv_op` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_di_reg_desemb` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `02` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '02' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `CD_UNID_NEG IN ( '01', '02', '03' ` |
| `CD_UNID_NEG` | `03` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = '03' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `TR_VIAGEM_REPASSE` | trigger | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `CD_UNID_NEG = '07' ` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `cd_unid_neg = '07'` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `cd_unid_neg = '07'` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `cd_unid_neg = '07'` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `cd_unid_neg = '07'` |
| `CD_UNID_NEG` | `07` | `sp_distribui_sda` | procedure | `cd_unid_neg = '07'` |
| `CD_UNID_NEG` | `40` | `sp_ordena_rank_receita` | procedure | `cd_unid_neg = '40' ` |
| `CD_UNID_NEG` | `X` | `sp_ddimport` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_ddimport_custo` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_ddimport_flp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_ddimport_flp_sea` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_ordena_rank_receita` | procedure | `cd_unid_neg = 'X'` |
| `CD_UNID_NEG` | `X` | `sp_ordena_rank_receita` | procedure | `cd_unid_neg = 'X'` |
| `CD_UNID_NEG` | `X` | `sp_rel_acomp_proc` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_bol_port` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_canal_mes_mod2` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cntr_nao_dev` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cntr_origem` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cntr_origem` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_com_imp_exp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cont_averb` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cont_averb` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cont_averb` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_cont_averb` | procedure | `cd_unid_neg = 'X', ` |
| `CD_UNID_NEG` | `X` | `sp_rel_ctrl_demurrage` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_dem_est` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_dem_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_dem_gerencial2` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_desp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_desp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_desp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_desp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_emitido_cancelado` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_est_cntr_vl_cif` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_est_demurrage` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_est_desp` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_est_volumes` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_est_volumes` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fat_pend_boleto` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_kpi_exportacao1` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_lead_time2` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_lead_time_teste` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_liquidacao` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_liquidacao` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_num_nao_rec` | procedure | `cd_unid_neg = 'X'` |
| `CD_UNID_NEG` | `X` | `sp_rel_pagto_pend` | procedure | `cd_unid_neg = 'X'` |
| `CD_UNID_NEG` | `X` | `sp_rel_pagto_pend` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_rent_proc` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_rel_rent_proc` | procedure | `cd_unid_neg = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_saldo_fluxo_cx` | procedure | `CD_UNID_NEG = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_saldo_fluxo_cx` | procedure | `CD_UNID_NEG = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_saldo_fluxo_cx` | procedure | `CD_UNID_NEG = 'X' ` |
| `CD_UNID_NEG` | `X` | `sp_saldo_fluxo_cx` | procedure | `CD_UNID_NEG = 'X' ` |
| `CD_UNID_NEG` | `XX` | `SP_LISTA_EVENTOS_PROCESSO` | procedure | `CD_UNID_NEG IN ('XX', ` |
| `CD_UNID_NEG` | `XX` | `SP_LISTA_EVENTOS_PROCESSO_BKP` | procedure | `CD_UNID_NEG IN ('XX', ` |
| `CD_UNID_NEG` | `XX` | `sp_rel_fluxo_caixa` | procedure | `CD_UNID_NEG = 'XX' ` |
| `CD_UNID_NEG` | `XX` | `sp_rel_fluxo_caixa` | procedure | `CD_UNID_NEG = 'XX' ` |
| `CD_UNID_NEG` | `XX` | `sp_rel_fluxo_caixa_gerencial` | procedure | `cd_unid_neg = 'XX' ` |
| `CD_VIA_TRANSPORTE` | `01` | `sp_rel_controle_proc` | procedure | `cd_via_transporte = '01' ` |
| `CD_VIA_TRANSPORTE` | `01` | `sp_rel_exp_flp` | procedure | `cd_via_transporte = '01' ` |
| `CD_VIA_TRANSPORTE` | `01` | `sp_rel_flp_ind` | procedure | `cd_via_transporte = '01' ` |
| `CD_VIA_TRANSPORTE` | `01` | `sp_rel_proc_desembaracados` | procedure | `CD_VIA_TRANSPORTE = '01' ` |
| `CD_VIA_TRANSPORTE` | `04` | `sp_atualiza_armazem` | procedure | `CD_VIA_TRANSPORTE <> '04' ` |
| `CD_VIA_TRANSPORTE` | `04` | `sp_rel_proc_desembaracados` | procedure | `CD_VIA_TRANSPORTE = '04' ` |
| `CD_VIA_TRANSPORTE` | `07` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_VIA_TRANSPORTE = '07'` |
| `CD_VIA_TRANSPORTE` | `07` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_VIA_TRANSPORTE = '07' ` |
| `CD_VIA_TRANSPORTE` | `07` | `SP_ATUALIZA_FOLLOWUP` | procedure | `CD_VIA_TRANSPORTE = '07' ` |
| `CD_VIA_TRANSPORTE` | `07` | `sp_atz_followup` | procedure | `CD_VIA_TRANSPORTE = '07'` |
| `CD_VIA_TRANSPORTE` | `07` | `sp_atz_followup` | procedure | `CD_VIA_TRANSPORTE = '07' ` |
| `CD_VIA_TRANSPORTE` | `07` | `sp_rel_proc_desembaracados` | procedure | `CD_VIA_TRANSPORTE = '07' ` |

### Distinct values per column, by frequency

| Column | # distinct | Values (occurrences) |
|---|--:|---|
| `CD_EVENTO` | 154 | `+@cd_evento+`×29, `041`×23, `088`×21, `092`×20, `162`×19, `022`×18, `021`×16, `+@cdBroker+`×13, `333`×12, `132`×11, `012`×10, `270`×8, `271`×8, `161`×7, `314`×7, `668`×6, `289`×6, `113`×6, `003`×6, `188`×6, `130`×5, `131`×5, `500`×5, `147`×4, `+@CDBROKER+`×4, `+ @CD_EVENTO_SELECIONADO +`×4, `263`×4, `235`×4, `260`×4, `164`×4, `146`×4, `551`×4, `397`×4, `XXX`×3, `X`×3, `262`×3, `117`×3, `280`×3, `141`×3, `286`×3 |
| `CD_GRUPO` | 37 | `X`×125, `002`×29, `155`×14, `083`×8, `XXX`×5, `028`×5, `036`×4, `008`×3, `+@tx_filtro+`×3, `013`×2, `+ @CD_GRUPO  +`×2, `+ @CD_GRUPO +`×2, `065`×2, `006`×2, `118`×2, `001`×2, `986`×2, `003`×2, `005`×1, `329`×1, `923`×1, `106`×1, `560`×1, `B31Z`×1, `010`×1, `B77`×1, `C68`×1, `C69`×1, `C90`×1, `C82`×1, `018`×1, `D03`×1, `B31`×1, `070`×1, `480`×1, `069`×1, `152`×1 |
| `CD_CLIENTE` | 26 | `X`×145, `00022`×4, `0`×3, `00006`×3, `00005`×2, `XXXXX`×2, `+ @CD_CLIENTE +`×2, `SET @TXT_SQL_AUX2 =`×2, `) <>`×2, `*`×2, `00001`×2, `00055`×1, `00105`×1, `END                IF ISNULL(@CD_AREA_INFO,`×1, `BEGIN        SET @TXT_SQL_AUX =`×1, `END                    IF ISNULL(@CD_AREA_INFO,`×1, `BEGIN          SET @TXT_SQL_AUX =`×1, `02274`×1, `00932`×1, `00662`×1, `00415`×1, `00013`×1, `00128`×1, `00020`×1, `00002`×1, `+@tx_filtro+`×1 |
| `CD_PRODUTO` | 12 | `01`×156, `02`×113, `X`×69, `03`×49, `10`×45, `06`×6, `+ @CD_PRODUTO +`×4, `17`×4, `18`×4, `XX`×2, `+@cd_produto+`×2, `+@tx_filtro+`×1 |
| `CD_SERVICO` | 10 | `X`×9, `706`×2, `0`×2, `4`×2, `001`×1, `261`×1, `445`×1, `016`×1, `6`×1, `+ @CD_SERVICO +`×1 |
| `CD_UNID_NEG` | 9 | `01`×159, `X`×91, `02`×27, `07`×24, `03`×21, `XX`×5, `*`×2, `+@cd_unid_neg+`×2, `40`×1 |
| `CD_EMPRESA` | 5 | `00001`×58, `00500`×2, `00061`×1, `00309`×1, `03185`×1 |
| `CD_MODAL` | 4 | `01`×17, `04`×5, `X`×3, `07`×3 |
| `CD_VIA_TRANSPORTE` | 3 | `07`×6, `01`×4, `04`×2 |
| `CD_TIPO_EVENTO` | 2 | `00`×6, `01`×5 |
| `CD_RESPONSAVEL` | 2 | `X`×3, `D`×1 |
| `CD_PAIS` | 1 | `X`×1 |
---

## Part 3 — Known extraction caveat (read before using Part 2)

The literal matcher also catches **dynamic-SQL string concatenation** (`... CD_GRUPO = ' + @CD_GRUPO + '`),
which is a *variable*, not a hardcoded value. These are identifiable by `@` or `+` in the literal column
and must be excluded before counting.

After filtering them out, the genuine hardcoded values are:

| Column | Distinct real literals | Dynamic-SQL artifacts excluded |
|---|--:|--:|
| `CD_EVENTO` | 147 | 56 |
| `CD_GRUPO` | 34 | 7 |
| `CD_CLIENTE` | 19 | 9 |
| `CD_SERVICO` | 9 | 1 |
| `CD_PRODUTO` | 9 | 7 |
| `CD_UNID_NEG` | 8 | 2 |
| `CD_EMPRESA` | 5 | 0 |
| `CD_MODAL` | 4 | 0 |
| `CD_VIA_TRANSPORTE` | 3 | 0 |
| `CD_TIPO_EVENTO` | 2 | 0 |
| `CD_RESPONSAVEL` | 2 | 0 |
| `CD_PAIS` | 1 | 0 |

**Cross-validation of the extraction.** The most frequent hardcoded `CD_EVENTO` values include
`003`, `088`, `132`, `162` — which the prior codebase audit independently identified as
Abertura, Desembaraço, Saída and Chegada in `vw_Processo_Resumo`. `CD_GRUPO = '155'` likewise matches
the Nestlé group named in the `TR_FOLLOWUP` analysis. The extraction agrees with a separately-derived
source, which is meaningful evidence it is reading the code correctly.

**The finding to carry forward:** 147 distinct event codes are written *directly into T-SQL*.
The workflow engine is parametrized in `TSERVICO_EVENTO`, but a large amount of process logic
bypasses that parametrization and lives in code. Any claim that the process can be reconfigured
through the parametrization tables alone is, on this evidence, false — and that has direct
consequences for how much of the new system can be data-driven.
