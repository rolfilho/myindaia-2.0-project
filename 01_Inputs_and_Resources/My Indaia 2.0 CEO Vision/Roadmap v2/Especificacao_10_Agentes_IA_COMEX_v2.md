> **ESPECIFICAÇÃO TÉCNICA**
> **10 Agentes de Inteligência Artificial**
> Sistema COMEX AI-First  |  INDAIA Logística Internacional
> LangGraph + Claude API (Anthropic) + Python 3.12  |  Março 2026
> **v2.0 — Documento único consolidado: 10 agentes completos**


> **⚡ O que mudou na v2.0 deste documento**
> - Documento consolidado: todos os 10 agentes em arquivo único (antes eram 2 documentos separados)
> - DI Legada eliminada: referências a PGDI/DI removidas — Agentes de Importação focam 100% em DUIMP
> - Agentes 09 (Booking Marítimo) e 10 (Gestão de Allocation/MQC) incluídos com especificação completa
> - Verticais explicitadas: cada agente agora indica sua vertical (Transversal / Exportação / Importação)
> - Numeração corrigida: Agente 09 = Booking, Agente 10 = Allocation (sem duplicação)


# 1. Índice de Agentes


| **#** | **Agente** | **Vertical** | **Aprovação Humana?** |
| --- | --- | --- | --- |
| 01 | ORQUESTRADOR | TRANSVERSAL | Não (coordena) |
| 02 | INGESTÃO DOCUMENTAL | TRANSVERSAL | Se confiança < 80% |
| 03 | VERIFICAÇÃO DE ACURACIDADE | IMPORTAÇÃO | Se divergência crítica |
| 04 | CLASSIFICAÇÃO NCM | TRANSVERSAL | Threshold configurável |
| 05 | COMPLIANCE / ÓRGÃOS ANUENTES | IMPORTAÇÃO | Para LI não-automática |
| 06 | RASTREAMENTO LOGÍSTICO | TRANSVERSAL | Não (monitoramento) |
| 07 | EMISSÃO DOCUMENTAL | EXPORTAÇÃO | Sempre para DU-E / Draft B/L |
| 08 | COMUNICAÇÃO | TRANSVERSAL | Não (automático) |
| 09 | BOOKING MARÍTIMO | EXPORTAÇÃO | Exceções e recusas de armador |
| 10 | GESTÃO DE ALLOCATION / MQC | EXPORTAÇÃO | Alertas críticos de shortfall |


> **🔒 Princípio de Segurança — Válido para TODOS os Agentes**
> - DUIMP e DU-E NUNCA são transmitidos automaticamente — sempre exigem aprovação humana + certificado digital A3
> - Toda decisão de agente gera registro em agent_audit (process_id, agente, input, output, confiança, usuário aprovador)
> - Threshold de confiança é configurável por tipo de ação na tabela confidence_threshold
> - Em caso de erro ou timeout, o agente escalona para humano via notificação urgente — nunca falha silenciosamente
> - Todos os prompts enviados ao LLM são logados no Langfuse para auditoria e análise de custo


# 2. Agentes Transversais


Os agentes transversais são utilizados por ambas as verticais (Exportação e Importação). Devem ser desenvolvidos primeiro, pois são dependências dos agentes especializados.

## 2.1 Agente 01 — Orquestrador


| **AGENTE 01: ORQUESTRADOR**<br>Vertical: TRANSVERSAL   \|   Aprovação Humana: Não (coordena) |  |
| --- | --- |
| **GATILHO** | Abertura de novo processo (IMP ou EXP) via API, evento externo (webhook Portal Único, EDI armador) ou upload de documento |
| **ENTRADAS** | - NR_PROCESSO + tipo (IMP/EXP/FEX)<br>- Documentos anexados pelo usuário ou recebidos por SFTP/e-mail<br>- Instrução de embarque / PO do cliente<br>- Histórico do cliente em TPROCESSO (via pyodbc) |
| **SAÍDAS** | - Plano de execução: sequência de agentes a acionar<br>- Thresholds de confiança para cada etapa<br>- Notificações para a equipe sobre decisões pendentes<br>- Registro de auditoria de todas as ações |
| **FERRAMENTAS** | - LangGraph StateGraph<br>- PostgreSQL (leitura de TPROCESSO via pyodbc)<br>- Redis (fila de tarefas)<br>- Webhook receiver (Portal Único, INTTRA) |
| **IMPL.** | - Define o grafo de execução com base no tipo de processo e serviço (IM, EM, ER, FE, IA, EA)<br>- Implementa modelo de confiança configurável: threshold alto para DUIMP/DU-E, médio para followup, baixo para notificações<br>- Monitora SLAs e escalona para humano se agente não conclui em tempo configurável<br>- Mantém compatibilidade com padrão NR_PROCESSO: UUPPSS-NNNNNN-AA<br>- Substitui a lógica distribuída entre SP_CRIA_FOLLOWUP e módulo PGGP do ddbroker |


## 2.2 Agente 02 — Ingestão Documental


| **AGENTE 02: INGESTÃO DOCUMENTAL**<br>Vertical: TRANSVERSAL   \|   Aprovação Humana: Se confiança < 80% |  |
| --- | --- |
| **GATILHO** | Chegada de documento (PDF, imagem, XML, EDI) por e-mail, SFTP, upload manual ou webhook |
| **ENTRADAS** | - Arquivo do documento (PDF/imagem/XML/EDI)<br>- Tipo esperado (Invoice, Packing List, BL, CE-Mercante, XML DUIMP/DU-E RFB)<br>- NR_PROCESSO vinculado |
| **SAÍDAS** | - JSON estruturado com todos os campos extraídos<br>- Score de confiança por campo (0–100%)<br>- Flag de campos ausentes ou suspeitos<br>- Vinculação ao processo no PostgreSQL<br>- Embedding do documento armazenado em pgvector |
| **FERRAMENTAS** | - Claude Vision API (OCR + extração estruturada)<br>- extratordadossiscomex (para XML oficial DUIMP/DU-E)<br>- Regras de validação por tipo de documento<br>- myfilemanager (gestão de arquivos por processo) |
| **IMPL.** | - Para XML Siscomex: usar lógica do extratordadossiscomex (DiLeituraXML.pas) portada para Python<br>- Para documentos escaneados: Claude Vision com prompt chain — primeiro identifica o tipo, depois extrai campos<br>- Campos obrigatórios variam por tipo: Invoice (valor, INCOTERM, NCM, exportador), BL (número, containers, navios)<br>- Armazenar embedding do documento em pgvector para busca semântica futura |


## 2.3 Agente 04 — Classificação NCM


| **AGENTE 04: CLASSIFICAÇÃO NCM**<br>Vertical: TRANSVERSAL   \|   Aprovação Humana: Threshold configurável (padrão: sempre para novo produto) |  |
| --- | --- |
| **GATILHO** | Novo produto sem NCM histórico, ou revisão de NCM solicitada |
| **ENTRADAS** | - Descrição da mercadoria (texto livre + ficha técnica)<br>- NCM anterior (se houver)<br>- País de origem<br>- Exportador/fabricante |
| **SAÍDAS** | - NCM sugerido (8 dígitos) com justificativa<br>- Alíquotas II, IPI, PIS, COFINS, ICMS calculadas<br>- Acordos ALADI aplicáveis<br>- Drawback / ex-tarifário identificados<br>- Flag se requer LI (TNCM.IN_LI) |
| **FERRAMENTAS** | - Claude API (classificação por descrição + few-shot)<br>- Tabela TNCM (24 colunas de alíquotas)<br>- TIPI atualizada (importada via Siscomex)<br>- Histórico de NCMs em TDETALHE_MERCADORIA |
| **IMPL.** | - Usar 26 anos de classificações em TDETALHE_MERCADORIA como base few-shot<br>- Calcular impostos consultando lógica das stored procedures sp_calc_ii, sp_calc_ipi, sp_calc_icms, sp_calc_pis, sp_calc_cofins<br>- Threshold configurável: NCM com confiança > 90% vai direto; abaixo apresenta top-3 para humano escolher<br>- Identificar automaticamente se produto tem LI obrigatória com base em TNCM.IN_LI e órgãos anuentes |


## 2.4 Agente 06 — Rastreamento Logístico


| **AGENTE 06: RASTREAMENTO LOGÍSTICO**<br>Vertical: TRANSVERSAL   \|   Aprovação Humana: Não (monitoramento automático) |  |
| --- | --- |
| **GATILHO** | Polling programado (a cada 2h) ou evento de ETA recebido via EDI/webhook armador |
| **ENTRADAS** | - NR_PROCESSO com navios/containers vinculados<br>- Número CE-Mercante<br>- Booking INTTRA confirmado<br>- ETAs esperados vs. confirmados |
| **SAÍDAS** | - Atualização de datas previstas em TPROCESSO<br>- Eventos de followup criados automaticamente<br>- Alertas de desvio de ETA para cliente e equipe<br>- Dados de frete AFRMM calculados |
| **FERRAMENTAS** | - INTTRA API (status booking)<br>- consultamercante (CE-Mercante portado para Python)<br>- tmserviceapi (status entrega pós-desembaraço)<br>- APIs de armadores: MSC=0031, Maersk=0023, Hapag=0338, CMA-CGM=0624 |
| **IMPL.** | - Substituir módulo EDI (edi.pas) em Delphi BDE obsoleto<br>- Monitorar TFOLLOWUP_ETAPA: eventos 021 (chegada navio), 082 (presença carga), 131/132 (BL liberado), 161/164/168 (desembaraço)<br>- CE-Mercante: extrair código embarcação, data operação, porto descarga, componentes do frete (AFRMM)<br>- TM pós-desembaraço: consumir tmserviceapi para acompanhar ChegadaSaida, PresencaCarga, EfetivaEntrega |


## 2.5 Agente 08 — Comunicação e Notificações


| **AGENTE 08: COMUNICAÇÃO E NOTIFICAÇÕES**<br>Vertical: TRANSVERSAL   \|   Aprovação Humana: Não (automático) |  |
| --- | --- |
| **GATILHO** | Qualquer evento relevante no processo (novo documento, status mudou, prazo próximo, erro detectado) |
| **ENTRADAS** | - Evento e contexto do processo<br>- Preferências de notificação do cliente<br>- Idioma do cliente (PT/EN/ES)<br>- Canal preferido (e-mail, PWA push, WhatsApp) |
| **SAÍDAS** | - Notificação enviada pelo canal correto<br>- Registro no TFOLLOWUP do evento comunicado<br>- Dashboard do cliente atualizado em tempo real<br>- Relatório periódico (diário/semanal) conforme configurado |
| **FERRAMENTAS** | - mysendmail.dll portado para Python SMTP<br>- Firebase Cloud Messaging (gcm_sender_id: 667613920608 — já configurado no webapp)<br>- Claude API (geração de mensagens contextualizadas)<br>- webapp PWA REST API (/indaia/api/Service/Notificacao e /SetDevice) |
| **IMPL.** | - Substituir sistema de e-mails do ddbroker (InterfacesEmail.pas)<br>- Push notifications: Firebase já configurado no webapp com service worker<br>- Multilingue: migrar arrays PT/EN/ES do portal legado para banco de strings<br>- Para clientes BASF/Nestlé: manter integrações EDI/SFTP específicas mas enriquecer com contexto IA |


# 3. Vertical Exportação — Agentes 07, 09 e 10


Os agentes da vertical de Exportação cobrem: emissão de documentos (Fatura, Packing List, Draft B/L, DU-E), booking marítimo via INTTRA/APIs diretas, e gestão de contratos MQC de allocation.

> **Dependências da Vertical Exportação**
> → Agente 02 (Ingestão) deve estar operacional antes dos Agentes 07, 09, 10
> → Agente 09 (Booking) depende do Agente 10 (Allocation) para verificar saldo disponível antes de submeter
> → Agente 10 (Allocation) atualiza automaticamente ao receber confirmação do Agente 09
> → minibroker deve ter endpoints REST expostos para DU-E, Draft B/L e TPROCESSO_EXP antes da Fase 3


## 3.1 Agente 07 — Emissão Documental (Exportação)


| **AGENTE 07: EMISSÃO DOCUMENTAL**<br>Vertical: EXPORTAÇÃO   \|   Aprovação Humana: OBRIGATÓRIA para DU-E e Draft B/L final |  |
| --- | --- |
| **GATILHO** | Processo de exportação pronto para embarque — gerar documentos de exportação |
| **ENTRADAS** | - Dados do processo TPROCESSO_EXP<br>- Dados do cliente exportador<br>- Instrução de embarque confirmada<br>- Booking confirmado (número INTTRA) — do Agente 09 |
| **SAÍDAS** | - Fatura Comercial (PDF + XML)<br>- Packing List (PDF)<br>- Draft B/L (enviado ao armador via FTP INTTRA)<br>- DU-E rascunho para revisão humana (NUNCA transmitido automaticamente) |
| **FERRAMENTAS** | - Claude API (geração de texto estruturado)<br>- minibroker FrmDraftBL (via API REST)<br>- FTP INTTRA (DraftEndFtpProducao / DraftEndFtpHomologacao)<br>- ClassesXMLDUE (XSD oficial RFB — já implementado no minibroker) |
| **IMPL.** | - Draft B/L: usar lógica do minibroker FrmDraftBL — campos adsMainAgenteCdInttra, adsMainBookingArmador, adsMainNmNavio, containers, mercadorias<br>- Envio ao armador por FTP INTTRA: replicar uGerarArquivosDraft.pas — gerar PDF + enviar por e-mail + digitalizar no processo<br>- DU-E: usar ClassesXMLDUE.pas — tipos idEnviar, idRetificarCargaAntecipada, idRetificarNormal (mapeados em TIntegracaoDue)<br>- DU-E NUNCA transmitido automaticamente — sempre revisão + aprovação humana + certificado digital A3<br>- Controlar número de amendment (adsMainNrAmend) com histórico de versões |


## 3.2 Agente 09 — Booking Marítimo


| **AGENTE 09: BOOKING MARÍTIMO**<br>Vertical: EXPORTAÇÃO   \|   Aprovação Humana: Exceções e recusas de armador |  |
| --- | --- |
| **GATILHO** | Instrução de embarque confirmada recebida + allocation disponível verificada pelo Agente 10 |
| **ENTRADAS** | - Instrução de embarque (shipper, consignee, POL/POD, commodity, containers)<br>- Resultado de availability do Agente 10 (allocation disponível por armador)<br>- Contratos TBID ativos (armador preferencial por rota)<br>- Histórico de bookings do cliente em TPROCESSO_EXP |
| **SAÍDAS** | - Número de booking confirmado pelo armador (via INTTRA ou API direta)<br>- Confirmação de datas: CY opening, VGM cutoff, SI cutoff, ETD/ETA<br>- Atualização de TPROCESSO_EXP (booking_armador, nm_navio, dt_embarque)<br>- Trigger para Agente 07 (emitir Draft B/L + instruções de embarque)<br>- Alerta ao Agente 10 para atualizar consumo de allocation |
| **FERRAMENTAS** | - INTTRA API REST (substitui RPA minibrowser/Chromium — prioridade migração)<br>- Maersk Booking API (REST)<br>- CMA-CGM eSolutions API (REST)<br>- Hapag-Lloyd QuickQuotes API (REST)<br>- MSC via INTTRA EDI<br>- RPA/Playwright (fallback para armadores sem API)<br>- myconsultaretornointtra (polling SFTP para confirmação de booking) |
| **IMPL.** | - Ranqueamento de armadores: allocation pendente > menor transit time > menor frete (baseado em TBID)<br>- Submissão via INTTRA EDI (padrão multi-armador) ou API direta para Maersk, CMA-CGM, Hapag-Lloyd<br>- Polling de confirmação a cada 30min (máx 24h) via myconsultaretornointtra<br>- Fluxo de recusa: notifica analista, sugere alternativas de armador/roteirização com base em TBID<br>- RPA como fallback para ZIM e outros sem API (portado do minibrowser.pas para Python/Playwright) |


### Fluxo Completo em 8 Etapas — Agente 09


| **#** | **Etapa** | **O que o Agente faz** | **Human****-in-****the****-Loop** |
| --- | --- | --- | --- |
| **1** | **Ingestão da Solicitação** | OCR + LLM extraem: exportador, consignatário, POL, POD, mercadoria, qtd./tipo de container (20DC, 40DC, 40HC, Reefer), peso, CY cutoff, data de embarque. Aceita planilha Excel, PO em PDF ou e-mail em texto livre. | Revisão se campos críticos ausentes |
| **2** | **Consulta da Tabela de Roteirização** | Cruza POL + POD com tabela configurada. Identifica armador preferencial, serviço, transit time, frequência e contrato ativo. Ranqueia: allocation pendente > menor transit time > menor frete. | Aprovação do gestor se nenhum armador elegível |
| **3** | **Verificação de** **Allocation** | Consulta o Agente 10 para verificar saldo disponível no contrato com o armador selecionado. Se esgotado ou em nível crítico, busca alternativa ou alerta o gestor. | Aprovação obrigatória se desvio do contrato MQC |
| **4** | **Consolidação do** **Payload** | Monta payload completo: shipper/consignee/notify, descrição, HS Code, peso/volume, instruções especiais (DG, Reefer, OOG), POL/POD/POT, vessel/voyage. Valida contra regras do armador antes de enviar. | Nenhuma (automático) |
| **5** | **Submissão via INTTRA ou API Direta** | Transmite via INTTRA EDI (padrão) ou API direta do armador (Maersk Spot, MSC, CMA-CGM eSolutions, Hapag QuickQuotes). Registra booking provisório e timestamp de submissão. | Nenhuma (automático) |
| **6** | **Monitoramento de Confirmação** | Polling a cada 30 minutos no sistema do armador. Ao confirmar: registra booking number definitivo, vessel/voyage e deadlines (SI cutoff, VGM cutoff, CY opening/closing). | Nenhuma (automático) |
| **7** | **Disparo das Próximas Etapas** | Notifica cliente com dados do embarque. Aciona Agente 07 (Emissão Documental) para Draft B/L. Atualiza TPROCESSO_EXP com booking confirmado. Notifica Agente 10 para decrementar saldo MQC. | Nenhuma (automático) |
| **8** | **Gestão de Recusas e Alterações** | Se armador recusar ou alterar dados (vessel, ETD), avalia automaticamente se a alternativa é aceitável (tolerância de dias configurável). Se não, escala para o analista com contexto completo e sugestões. | Aprovação do analista se fora da tolerância |


### Matriz de Integração por Armador — Agente 09


| **Armador** | **Código INTTRA** | **Sistema / API** | **Protocolo** | **Maturidade API** | **Canal** |
| --- | --- | --- | --- | --- | --- |
| Maersk | 0023 | Maersk Booking API | REST / JSON | Alta | Nativo |
| MSC | 0031 | INTTRA EDI | EDI EDIFACT | Média | INTTRA |
| CMA-CGM | 0624 | eSolutions API | REST / JSON | Alta | Nativo |
| Hapag-Lloyd | 0338 | QuickQuotes API | REST / JSON | Média | Nativo |
| Evergreen | — | INTTRA EDI | EDI EDIFACT | Média | INTTRA |
| Yang Ming | — | INTTRA EDI | EDI EDIFACT | Baixa | INTTRA |
| ZIM | — | MyZIM Portal | Web / RPA | Baixa | RPA Fallback |
| Hamburg Süd | — | INTTRA EDI | EDI EDIFACT | Média | INTTRA |


## 3.3 Agente 10 — Gestão de Allocation / MQC


| **AGENTE 10: GESTÃO DE ALLOCATION / MQC**<br>Vertical: EXPORTAÇÃO   \|   Aprovação Humana: Alertas críticos escalam para humano (gestor comercial) |  |
| --- | --- |
| **GATILHO** | Novo booking confirmado pelo Agente 09, ou cancelamento de booking, ou polling semanal de compliance de contratos MQC |
| **ENTRADAS** | - Bookings confirmados (via Agente 09 — tempo real)<br>- Tabela de contratos MQC (cliente × armador × período — TBID)<br>- Histórico de embarques TPROCESSO_EXP<br>- Configuração de thresholds de alerta por contrato |
| **SAÍDAS** | - Saldo de allocation disponível (resposta em tempo real ao Agente 09)<br>- Dashboard de compliance por contrato MQC (% utilizado, shortfall projetado, prazo)<br>- Alertas: ATENÇÃO / ALERTA / CRÍTICO / SOBRE-USO<br>- Sugestão de armador alternativo quando saldo esgotado<br>- Relatório PDF de fechamento de período |
| **FERRAMENTAS** | - PostgreSQL — tabelas: mq_contract, booking, allocation_tracking<br>- Claude API (análise de tendências, redação de alertas contextualizados)<br>- Agente 08 (Comunicação) para envio de alertas críticos<br>- React Dashboard em tempo real |
| **IMPL.** | - Calcular % utilização: bookings_realizados / volume_MQC_comprometido × 100 por armador/rota/período<br>- Projeção de shortfall: se pipeline atual < MQC restante, alertar com antecedência configurável (padrão: 30 dias)<br>- Integração bidirecional com Agente 09: Agente 10 informa availability → Agente 09 prioriza armadores em subuso<br>- Suporte a contratos escalonados (ex.: 30 TEUs/mês 1º semestre → 50 TEUs/mês 2º)<br>- Bookings cancelados revertem saldo automaticamente com registro de auditoria<br>- Relatório de fechamento: volumes por armador, compliance %, penalidades projetadas |


### Níveis de Alerta — Agente 10


| **Nível** | **Cor** | **Condição** | **Ação do Agente** | **Destinatário** |
| --- | --- | --- | --- | --- |
| ATENÇÃO | Azul | Ritmo insuficiente para cumprir MQC até o fim do período | Notificação informativa no dashboard | Analista de exportação |
| ALERTA | Amarelo | Allocation ≥ 80% do MQC — risco de esgotar antes do fim do período | E-mail + push notification | Analista + Supervisor |
| CRÍTICO | Vermelho | Allocation ≥ 95% ou projeção de shortfall confirmada | Alerta urgente + bloqueio de novos bookings no armador | Gestor comercial |
| SOBRE-USO | Roxo | Bookings excedem MQC comprometido | Alerta imediato + relatório de penalidades projetadas | Gestor + Diretoria |
| VENCIMENTO | Laranja | Contrato MQC vence em menos de 60 dias | Lembrete semanal para renegociação | Gestor comercial |


# 4. Vertical Importação — Agentes 03 e 05 (DUIMP)


Os agentes da vertical de Importação cobrem verificação de acuracidade de documentos e compliance com órgãos anuentes. O escopo é 100% DUIMP — a DI Legada (PGDI) foi eliminada do escopo em v4.0.

> **⚠️ Escopo DUIMP-Only — Decisão v4.0**
> - DI Legada (PGDI) eliminada do escopo de reescrita — INDAIA opera 100% em DUIMP
> - Dados históricos de DIs (TDECLARACAO_IMPORTACAO, TADICAO_DE_IMPORTACAO) acessíveis via view read-only
> - sp_di_calculo e sp_calc_* são consultadas apenas para leitura de histórico — não reescritas em Python
> - Agente 07 (Emissão Documental) na importação gera apenas DUIMP — nunca DI XML legada


## 4.1 Agente 03 — Verificação de Acuracidade


| **AGENTE 03: VERIFICAÇÃO DE ACURACIDADE**<br>Vertical: IMPORTAÇÃO   \|   Aprovação Humana: Se divergência crítica |  |
| --- | --- |
| **GATILHO** | Após ingestão de documento — verificar consistência entre documentos e instruções do cliente |
| **ENTRADAS** | - JSON do Agente 02 (Ingestão)<br>- PO / instrução de embarque do cliente<br>- Dados do processo em TPROCESSO<br>- Histórico de divergências do cliente |
| **SAÍDAS** | - Relatório de conformidade (campos OK / divergentes / ausentes)<br>- Lista de itens que requerem ação humana<br>- Sugestão de correção quando possível<br>- Evento de followup criado automaticamente |
| **FERRAMENTAS** | - Claude API (comparação semântica)<br>- Regras configuradas em TCLIENTE_SERVICO<br>- Acesso a TPROCESSO via mywebapi REST<br>- SP_CRIA_FOLLOWUP (via API ou port Python) |
| **IMPL.** | - Verificar: valores Invoice vs. PO, peso Packing List vs. BL, NCM declarado vs. NCM histórico do produto<br>- Divergências classificadas por severidade: crítica (bloqueia), atenção (alerta), informativa (log)<br>- Aprender com histórico: se divergência foi aceita 3x para mesmo cliente/produto, reduzir severidade automaticamente<br>- Substituir verificação manual que hoje ocorre no módulo PGDI do ddbroker (portado para fluxo DUIMP) |


## 4.2 Agente 05 — Compliance / Órgãos Anuentes


| **AGENTE 05: COMPLIANCE / ÓRGÃOS ANUENTES**<br>Vertical: IMPORTAÇÃO   \|   Aprovação Humana: Para LI não-automática |  |
| --- | --- |
| **GATILHO** | Após classificação NCM confirmada, verificar obrigações regulatórias |
| **ENTRADAS** | - NCM classificado (do Agente 04)<br>- País de origem<br>- Tipo de mercadoria (alimento, medicamento, químico, etc.)<br>- CNPJ do importador |
| **SAÍDAS** | - Lista de órgãos anuentes requeridos (Anvisa, Mapa, INMETRO, etc.)<br>- Status de LI: necessária / dispensada / já obtida<br>- Alertas de licenças próximas ao vencimento<br>- Instruções de parametrização no Siscomex |
| **FERRAMENTAS** | - Claude API (análise de obrigações)<br>- myparametrizacao / myparametrizacaoli (lógica de LI portada para Python)<br>- APIs Siscomex (consulta LI) — myconsultalilote<br>- Base de regras TNCM + tabela de órgãos anuentes |
| **IMPL.** | - Replicar lógica do myparametrizacaoli em Python: identificar TIPO de LI (automática vs. não-automática)<br>- Integrar com myconsultalilote para consulta em lote de status de LIs no Siscomex<br>- Alertar proativamente sobre LIs próximas ao vencimento (hoje feito manualmente no ctrl_li do portal web)<br>- Para drawback isenção: integrar com integracaodrawbackisencao (XML via Portal Único mTLS)<br>- Campos chave: NumeroLI, DtValidade, Licenciamento, LISubstitutivo — mapeados no myparametrizacaoli |


# 5. Fluxo Integrado — 10 Agentes em Operação


## 5.1 Exportação — Fluxo Completo


| **#** | **Etapa** | **O que o Agente faz** | **Human****-in-****the****-Loop** |
| --- | --- | --- | --- |
| **1** | **Abertura do processo** | Analista abre processo de exportação via mywebapi. Agente 01 (Orquestrador) detecta evento e aciona pipeline de exportação. | Não |
| **2** | **Ingestão da instrução** | Agente 02 faz OCR da instrução de embarque (PDF/Excel). Extrai exportador, produtos, NCMs, containers, POL/POD. | Se confiança < 80% |
| **3** | **Classificação NCM (EXP)** | Agente 04 classifica NCMs dos produtos para exportação. Identifica alíquotas de exportação e acordos ALADI. | Threshold configurável |
| **4** | **Verificação de** **allocation** | Agente 10 verifica saldo MQC disponível por armador para a rota POL/POD solicitada. Retorna disponibilidade ao Agente 01. | Não (informativo) |
| **5** | **Booking marítimo** | Agente 09 submete booking ao armador via INTTRA API REST ou API direta. Faz polling até confirmação (máx 24h). | Exceções e recusas |
| **6** | **Atualização de** **allocation** | Agente 10 debita booking confirmado do saldo MQC. Atualiza dashboard de compliance. Emite alerta se nível crítico. | Alertas críticos |
| **7** | **Emissão documental** | Agente 07 gera Fatura Comercial, Packing List e Draft B/L. Envia Draft B/L ao armador via FTP INTTRA. Gera DU-E rascunho. | OBRIGATÓRIA para DU-E |
| **8** | **Registro DU-E** | Analista revisa DU-E gerado + assina com certificado A3 + transmite ao Portal Único. Agente 06 monitora status. | OBRIGATÓRIA (A3) |
| **9** | **Averbação DU-E** | robodue monitora status DU-E (10=Registrada → 20=Canal Verde → 70=Averbada). Agente 08 notifica cliente. | Não (automático) |
| **10** | **Faturamento** | Wallet minibroker calcula custos. Agente 08 envia pré-fatura para aprovação. Integração ERP Senior via SOAP. | Aprovação do valor |


## 5.2 Importação — Fluxo DUIMP Completo


| **#** | **Etapa** | **O que o Agente faz** | **Human****-in-****the****-Loop** |
| --- | --- | --- | --- |
| **1** | **Abertura do processo** | Analista abre processo de importação via mywebapi. Agente 01 (Orquestrador) detecta e aciona pipeline de importação. | Não |
| **2** | **Ingestão de documentos** | Agente 02 faz OCR de Invoice, Packing List, BL, CE-Mercante. Extrai campos e armazena embeddings em pgvector. | Se confiança < 80% |
| **3** | **Verificação** **Invoice****/PO** | Agente 03 compara documentos recebidos com PO/instrução do cliente. Classifica divergências por severidade. | Se divergência crítica |
| **4** | **Classificação NCM** | Agente 04 sugere NCM com justificativa + alíquotas + drawback + LI. Usa histórico de 26 anos como few-shot. | Threshold configurável |
| **5** | **Verificação LI/Órgãos** | Agente 05 verifica órgãos anuentes, status de LI no Siscomex, alertas de vencimento, drawback isenção. | Para LI não-automática |
| **6** | **Registro DUIMP** | Agente 07 preenche campos DUIMP automaticamente. Analista revisa + assina com A3 + transmite ao Portal Único. | OBRIGATÓRIA (A3) |
| **7** | **Acompanhamento do navio** | Agente 06 monitora ETAs via APIs de armadores e CE-Mercante. Cria eventos de followup automaticamente. | Não |
| **8** | **Desembaraço** | Agente 06 monitora canal aduaneiro. Analista trata exigências. Agente 08 notifica cliente sobre mudanças de status. | Decisões no canal |
| **9** | **Entrega TM** | Agente 06 consume tmserviceapi para rastrear entrega pós-desembaraço. Notificações automáticas ao cliente. | Não |
| **10** | **Faturamento** | Wallet minibroker calcula custos. Pré-fatura via Agente 08. Integração ERP Senior via SOAP AtualizarTitulosProcessos. | Aprovação do valor |


# 6. Arquitetura Técnica dos Agentes


## 6.1 Stack Compartilhada


| **Camada** | **Tecnologia** | **Uso nos Agentes** |
| --- | --- | --- |
| Orquestração | Python 3.12 + LangGraph StateGraph | Todos os agentes — grafo de estados, retry, human-in-the-loop |
| LLM | Claude Sonnet 4 (Anthropic API) | Todos os agentes — extração, classificação, geração, análise |
| Banco de dados | PostgreSQL 16 + pgvector | Todos os agentes — estado, embeddings, auditoria |
| Cache / Fila | Redis 7 | Orquestrador — fila de tarefas, cache de resultados |
| API Gateway | FastAPI Python | Todos — interface com Delphi/minibroker e clientes externos |
| Observabilidade | Langfuse | Todos — rastreamento de chamadas LLM, custo, qualidade |
| Legado DB | pyodbc → SQL Server INDAIA10 | Agentes 01, 03, 06 — leitura de TPROCESSO, TPROCESSO_EXP |


## 6.2 Tabelas PostgreSQL por Agente


| **Agente** | **Tabelas Lidas** | **Tabelas Escritas** |
| --- | --- | --- |
| 01 Orquestrador | process, confidence_threshold, event_code | agent_run, agent_decision, process_stage |
| 02 Ingestão | process, document | document, document_field, document_embedding |
| 03 Verificação | document_field, process (via pyodbc TPROCESSO) | agent_decision, process_stage |
| 04 NCM | ncm, ncm_tax (via pyodbc TNCM) | agent_decision, merchandise_detail |
| 05 Compliance | ncm_tax, li_license | li_license, agent_decision |
| 06 Rastreamento | process, shipment, container (via pyodbc) | process (datas), process_stage, agent_run |
| 07 Documental | process, document_field, booking | due_declaration, duimp_declaration, bl_draft |
| 08 Comunicação | process, customer, process_stage | agent_run (log de notificações) |
| 09 Booking | process_export (pyodbc TPROCESSO_EXP), mq_contract | booking, process_export |
| 10 Allocation | booking, mq_contract, process_export (pyodbc) | mq_contract (atualização saldo), allocation_tracking |


## 6.3 Configuração de Thresholds


| **Tipo de Ação** | **Threshold** **Padrão** | **Agente Responsável** | **Comportamento abaixo do** **threshold** |
| --- | --- | --- | --- |
| Ingestão de documento | 80% | 02 Ingestão | Apresenta campos para revisão humana |
| Classificação NCM (produto novo) | 90% | 04 NCM | Apresenta top-3 NCMs para humano escolher |
| Classificação NCM (produto histórico) | 95% | 04 NCM | Aplica automaticamente com log |
| Verificação de acuracidade (crítica) | — | 03 Verificação | Sempre escalona para humano se divergência crítica |
| Registro DUIMP | — | 07 Documental | Sempre revisão humana + A3 — sem threshold |
| Registro DU-E | — | 07 Documental | Sempre revisão humana + A3 — sem threshold |
| Booking (recusa armador) | — | 09 Booking | Escalona para analista se recusa ou alteração fora da tolerância |
| Alerta MQC crítico | 95% | 10 Allocation | Bloqueia novos bookings no armador e notifica gestor |


> **Documento gerado automaticamente — Especificação Técnica** **10 Agentes IA** **COMEX v2.0**
> Substitui os documentos Especificacao_8_Agentes_IA_COMEX.docx e Especificacao_10_Agentes_IA_COMEX.docx.
> Consolida todos os 10 agentes em documento único, com DI Legada eliminada e verticais explicitadas.
> Para detalhes de código Python e exemplos de prompts, consultar DocTecnico_Desenvolvedor_COMEX_AI_v2.docx.
