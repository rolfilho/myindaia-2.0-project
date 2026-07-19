> **PRODUCT VISION DOCUMENT**
> **v4.0**
> **Sistema COMEX AI-****First**
> INDAIA Logística Internacional
> Santos, SP  |  Março 2026


| **Campo** | **Valor** |
| --- | --- |
| Versão | 4.0 — Remove DI Legada, adiciona Agentes 09 (Allocation) e 10 (Booking), separa verticais Exportação / Importação |
| Versão anterior | 3.0 — Análise completa de 42 repositórios |
| Data | Março 2026 |
| Status | Em validação com stakeholders |
| Autor | Fabricio / Equipe INDAIA |
| Revisado por | Análise AI-First — Claude (Anthropic) |
| Confidencialidade | Restrito — uso interno INDAIA |


> **⚡ O que muda na v4.0**
> 1. DI Legada (PGDI) eliminada do escopo — INDAIA opera 100% em DUIMP. Elimina ~36 semanas de risco CRÍTICO.
> 2. Agente 09 (Booking Marítimo) adicionado — cobre INTTRA EDI, APIs diretas de armadores, gestão de recusas.
> 3. Agente 10 (Gestão de Allocation/MQC) adicionado — monitora contratos, calcula compliance, alertas shortfall.
> 4. Roadmap reestruturado em 2 verticais paralelas: Exportação e Importação — permite times independentes.


# 1. Sumário Executivo


A INDAIA Logística Internacional opera há 26 anos como despachante aduaneiro em Santos (SP) e Rio de Janeiro (RJ), gerenciando centenas de processos mensais de importação e exportação para clientes multinacionais como BASF, Nestlé, Pirelli, Cargill, Whirlpool, Ferrero e Saint-Gobain.

O sistema operacional atual é um monolito Delphi + SQL Server desenvolvido ao longo de duas décadas, com 1.205 tabelas, 727 stored procedures e mais de 40 microaplicativos satélites. Apesar de funcional e profundamente customizado para as regras do comércio exterior brasileiro, o sistema apresenta limitações críticas de escalabilidade, integração e experiência de uso.

> **Decisão Estratégica**
> Redesenhar a plataforma operacional sob o paradigma AI-First, preservando 26 anos de regras de negócio e transformando agentes humanos em supervisores de fluxos inteligentes — não substituindo a expertise da equipe, mas amplificando sua capacidade.


A análise completa de 42 repositórios de código-fonte revelou que a equipe já iniciou a modernização: o minibroker implementa DU-E, Draft B/L e módulo financeiro (Wallet) em arquitetura moderna com Aurelius ORM. O novo sistema AI-First deve ser construído como camada de orquestração inteligente sobre o que já existe, não uma reescrita do zero.

| **Métrica** | **Valor** |
| --- | --- |
| Processos mensais | 800+ processos ativos simultâneos |
| Clientes atendidos | Multinacionais de grande porte (BASF, Nestlé, Pirelli, Cargill e +50 outros) |
| Anos de histórico | 26 anos (2000–2026) — base de treinamento rica para IA |
| Repositórios analisados | 42 repositórios (1.025+ arquivos Delphi) |
| Filiais aduaneiras | Santos (SP) e Rio de Janeiro (RJ) |
| Sistema legado | SQL Server INDAIA10 \| BROKER (1.205 tabelas) \| 727 stored procedures |
| Escopo de importação | 100% DUIMP — DI Legada eliminada do escopo de reescrita (v4.0) |


# 2. Contexto e Diagnóstico do Sistema Atual


## 2.1 Arquitetura Atual


| **Camada** | **Componentes** | **Status** |
| --- | --- | --- |
| Sistema Principal | ddbroker (1.025 módulos Delphi) — operações, exportação, faturamento, pagamentos | Produção — legado |
| Sistema Moderno | minibroker (DU-E, Draft B/L, Wallet), mywebapi (REST+JWT), tmserviceapi, mypatterns | Em construção — base do novo sistema |
| Portal Web | webapp (PWA Firebase), portal ASP legado (374 páginas), myindaiaweb (ASPX) | Produção — todos ativos |
| Integrações Gov. | apiproxyportalunico, robodue, integracaoduimp, extratordadossiscomex, drawback, SDA | Produção crítica |
| Integrações Clientes | BASF, Nestlé, Pirelli, Croda, AGC, Cebrace (SFTP/EDI/REST) | Produção crítica |


## 2.2 Decisão v4.0 — DI Legada Eliminada do Escopo


> **⚠️ Decisão Estratégica Confirmada**
> A INDAIA já opera 100% em DUIMP. O módulo DI legado (PGDI — 34 arquivos, risco CRÍTICO) é eliminado do escopo de reescrita.
> Esta decisão reduz o prazo em ~36 semanas (~9 meses) e elimina o maior risco fiscal do projeto.
> Dados históricos de DIs (TDECLARACAO_IMPORTACAO, TADICAO_DE_IMPORTACAO) permanecem acessíveis via view read-only no PostgreSQL para consulta e relatórios.
> Stored procedures sp_di_calculo e sp_calc_* são acessadas apenas para leitura de histórico — não reescritas em Python.


## 2.3 Problemas Identificados


Monolito Delphi com 1.025 módulos — impossível escalar ou modularizar sem reescrita

Lógica de negócio distribuída entre stored procedures, código Delphi e páginas ASP

BDE (Borland Database Engine) ainda em uso no módulo EDI — tecnologia descontinuada

Automação por RPA (minibrowser/Chromium) frágil para booking INTTRA — prioridade migrar para INTTRA API REST

Portal web legado com 374 páginas ASP rodando em IIS sem autenticação moderna

Credencial SA hardcoded no portal ASP legado — RISCO CRÍTICO — ação imediata necessária

Sem API unificada — cada integração é um aplicativo separado

# 3. Visão do Produto


## 3.1 Declaração de Visão


> "Transformar a INDAIA na primeira despachante aduaneira do Brasil com operação AI-First,
> onde agentes de IA cuidam de 80% das tarefas operacionais e a equipe foca em exceções, relacionamento e estratégia."


## 3.2 Princípios de Construção


| **Princípio** | **Descrição** |
| --- | --- |
| Camada, não reescrita | O novo sistema é uma camada de orquestração IA sobre o minibroker e MYINDAIAV2. Não substituir o que já funciona. |
| Human-in-the-loop obrigatório | Nenhum ato aduaneiro (DUIMP, DU-E, LPCO) é transmitido sem aprovação humana + certificado digital A3. |
| Confiança configurável | Cada tipo de decisão tem threshold de confiança configurável — não uma barra única para tudo. |
| Dados próprios como vantagem | 26 anos de NCMs, cálculos de impostos e followup são o diferencial competitivo. Usar para fine-tuning. |
| Zero downtime na migração | Sistema legado continua rodando em paralelo. Migração gradual por módulo, não big bang. |
| Segurança por design | JWT, OAuth2, certificados A3, zero hardcoded credentials, auditoria de todas as ações de agentes. |
| DUIMP-Only em importação | Novos processos de importação são 100% DUIMP. DI legada é somente leitura histórica. |


# 4. Arquitetura AI-First — 10 Agentes em 2 Verticais


## 4.1 Visão Geral das Verticais


O sistema é organizado em duas verticais operacionais independentes, permitindo desenvolvimento paralelo por times distintos, mais um conjunto de agentes transversais compartilhados por ambas as verticais.

| **#** | **Agente** | **Vertical** | **Aprovação Humana?** |
| --- | --- | --- | --- |
| 01 | ORQUESTRADOR | TRANSVERSAL | Não (coordena) |
| 02 | INGESTÃO DOCUMENTAL | TRANSVERSAL | Se confiança < 80% |
| 03 | VERIFICAÇÃO DE ACURACIDADE | TRANSVERSAL | Se divergência crítica |
| 04 | CLASSIFICAÇÃO NCM | TRANSVERSAL | Threshold configurável |
| 05 | COMPLIANCE / ÓRGÃOS ANUENTES | IMPORTAÇÃO | Para LI não-automática |
| 06 | RASTREAMENTO LOGÍSTICO | TRANSVERSAL | Não (monitoramento) |
| 07 | EMISSÃO DOCUMENTAL | EXPORTAÇÃO | Sempre para DU-E / Draft B/L |
| 08 | COMUNICAÇÃO | TRANSVERSAL | Não (automático) |
| 09 | BOOKING MARÍTIMO | EXPORTAÇÃO | Exceções e recusas |
| 10 | GESTÃO DE ALLOCATION/MQC | EXPORTAÇÃO | Alertas críticos |


> **🔒 Princípio de Segurança — Válido para TODOS os Agentes**
> - DUIMP e DU-E NUNCA são transmitidos automaticamente — sempre exigem aprovação humana + certificado digital A3
> - Toda decisão de agente gera registro em agent_audit (process_id, agente, input, output, confiança, usuário aprovador)
> - Threshold de confiança é configurável por tipo de ação na tabela confidence_threshold
> - Em caso de erro ou timeout, o agente escalona para humano via notificação urgente — nunca falha silenciosamente
> - Todos os prompts enviados ao LLM são logados no Langfuse para auditoria e análise de custo


## 4.2 Stack Tecnológica


| **Camada** | **Tecnologia** | **Justificativa** |
| --- | --- | --- |
| Orquestração de Agentes | Python 3.12 + LangGraph | Suporte a grafo de estados, retry, human-in-the-loop nativo |
| LLM Principal | Claude Sonnet 4 (Anthropic API) | Melhor custo/benefício para tarefas COMEX estruturadas |
| Banco Principal (novo) | PostgreSQL 16 + pgvector | SQL robusto + busca semântica para documentos |
| Cache / Fila | Redis 7 | Cache de resultados, fila de jobs, pub/sub entre agentes |
| API Gateway | Python FastAPI | REST + WebSocket para frontend e integrações |
| Frontend | React 18 + TypeScript + Tailwind | SPA moderna com notificações em tempo real |
| Auth | OAuth2 + JWT + certificado A3 | Segurança corporativa + requisito legal RFB |
| Infra | AWS Brasil (sa-east-1) | LGPD, latência, SLA |
| Observabilidade | Langfuse | Rastreamento de chamadas LLM, custo, qualidade |


# 5. Especificação Resumida dos 10 Agentes


## 5.1 Agentes Transversais (Exportação + Importação)


| **AGENTE 01:** **ORQUESTRADOR**  **[****TRANSVERSAL]** |  |
| --- | --- |
| **GATILHO** | Abertura de novo processo (IMP ou EXP) via API, evento externo (webhook Portal Único, EDI armador, upload de documento) |
| **ENTRADAS** | - NR_PROCESSO + tipo (IMP/EXP)<br>- Documentos anexados<br>- Instrução de embarque / PO do cliente<br>- Histórico do cliente em TPROCESSO (via pyodbc) |
| **SAÍDAS** | - Plano de execução: sequência de agentes a acionar<br>- Thresholds de confiança para cada etapa<br>- Notificações para equipe sobre decisões pendentes<br>- Registro de auditoria de todas as ações |
| **FERRAMENTAS** | - LangGraph StateGraph<br>- PostgreSQL (leitura de TPROCESSO via API)<br>- Redis (fila de tarefas)<br>- Webhook receiver (Portal Único, INTTRA) |
| **IMPL.** | - Define o grafo de execução com base no tipo de processo e serviço (IM, EM, ER, FE, IA, EA)<br>- Implementa modelo de confiança configurável: threshold alto para DUIMP, médio para followup, baixo para notificações<br>- Monitora SLAs e escalona para humano se agente não conclui em tempo configurável<br>- Mantém compatibilidade com padrão NR_PROCESSO: UUPPSS-NNNNNN-AA |


| **AGENTE 02: INGESTÃO** **DOCUMENTAL**  **[****TRANSVERSAL]** |  |
| --- | --- |
| **GATILHO** | Chegada de documento (PDF, imagem, XML, EDI) por e-mail, SFTP, upload manual ou webhook |
| **ENTRADAS** | - Arquivo do documento (PDF/imagem/XML/EDI)<br>- Tipo esperado (Invoice, Packing List, BL, CE-Mercante, XML DUIMP RFB)<br>- NR_PROCESSO vinculado |
| **SAÍDAS** | - JSON estruturado com todos os campos extraídos<br>- Score de confiança por campo (0–100%)<br>- Flag de campos ausentes ou suspeitos<br>- Vinculação ao processo no PostgreSQL |
| **FERRAMENTAS** | - Claude Vision API (OCR + extração estruturada)<br>- extratordadossiscomex (para XML oficial)<br>- Regras de validação por tipo de documento |
| **IMPL.** | - Para XML Siscomex: usar lógica do extratordadossiscomex portada para Python<br>- Para escaneados: Claude Vision com prompt chain — primeiro identifica o tipo, depois extrai campos<br>- Armazenar embedding do documento em pgvector para busca semântica futura |


| **AGENTE 06: RASTREAMENTO** **LOGÍSTICO**  **[****TRANSVERSAL]** |  |
| --- | --- |
| **GATILHO** | Polling programado (a cada 2h) ou evento de ETA recebido via EDI/webhook armador |
| **ENTRADAS** | - NR_PROCESSO com navios/containers vinculados<br>- Número CE-Mercante<br>- Booking INTTRA<br>- ETAs esperados vs. confirmados |
| **SAÍDAS** | - Atualização de datas previstas em TPROCESSO<br>- Eventos de followup criados automaticamente<br>- Alertas de desvio de ETA para cliente e equipe<br>- Dados de frete AFRMM calculados |
| **FERRAMENTAS** | - INTTRA API (status booking)<br>- consultamercante (CE-Mercante portado)<br>- tmserviceapi (status entrega pós-desembaraço)<br>- APIs de armadores (MSC, Maersk, Hapag, CMA-CGM) |
| **IMPL.** | - Substituir módulo EDI (edi.pas) em Delphi BDE obsoleto<br>- Monitorar TFOLLOWUP_ETAPA: eventos 021, 082, 131/132, 161/164/168 e +500 outros códigos<br>- TM pós-desembaraço: consumir tmserviceapi para rastreamento de entrega |


| **AGENTE 08: COMUNICAÇÃO E** **NOTIFICAÇÕES**  **[****TRANSVERSAL]** |  |
| --- | --- |
| **GATILHO** | Qualquer evento relevante no processo (novo documento, status mudou, prazo próximo, erro detectado) |
| **ENTRADAS** | - Evento e contexto do processo<br>- Preferências de notificação do cliente<br>- Idioma do cliente (PT/EN/ES)<br>- Canal preferido (e-mail, PWA push, WhatsApp) |
| **SAÍDAS** | - Notificação enviada pelo canal correto<br>- Registro no TFOLLOWUP do evento comunicado<br>- Dashboard do cliente atualizado em tempo real<br>- Relatório periódico (diário/semanal) conforme configurado |
| **FERRAMENTAS** | - mysendmail.dll portado para Python SMTP<br>- Firebase Cloud Messaging (gcm_sender_id: 667613920608)<br>- Claude API (geração de mensagens contextualizadas) |
| **IMPL.** | - Substituir sistema de e-mails do ddbroker (InterfacesEmail.pas)<br>- Push notifications: Firebase já configurado no webapp<br>- Multilingue: migrar arrays PT/EN/ES do portal legado para banco de strings |


## 5.2 Agentes da Vertical Exportação


| **AGENTE 04: CLASSIFICAÇÃO** **NCM**  **[****EXPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Novo produto sem NCM histórico, ou revisão de NCM solicitada |
| **ENTRADAS** | - Descrição da mercadoria (texto livre + ficha técnica)<br>- NCM anterior (se houver)<br>- País de origem<br>- Exportador |
| **SAÍDAS** | - NCM sugerido (8 dígitos) com justificativa<br>- Alíquotas II, IPI, PIS, COFINS, ICMS calculadas<br>- Acordos ALADI aplicáveis<br>- Drawback / ex-tarifário identificados |
| **FERRAMENTAS** | - Claude API (classificação por descrição)<br>- Tabela TNCM (24 colunas de alíquotas)<br>- TIPI atualizada (importada via Siscomex)<br>- Histórico de NCMs da empresa |
| **IMPL.** | - Usar 26 anos de classificações em TDETALHE_MERCADORIA como base few-shot<br>- Threshold configurável: NCM com confiança > 90% vai direto; abaixo disso apresenta top-3 para humano |


| **AGENTE 07: EMISSÃO DOCUMENTAL (****EXPORTAÇÃO)**  **[****EXPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Processo de exportação pronto para embarque — gerar documentos de exportação |
| **ENTRADAS** | - Dados do processo TPROCESSO_EXP<br>- Instrução de embarque confirmada<br>- Booking confirmado (número INTTRA) |
| **SAÍDAS** | - Fatura Comercial (PDF + XML)<br>- Packing List (PDF)<br>- Draft B/L (enviado ao armador via FTP INTTRA)<br>- DU-E rascunho para revisão humana (NUNCA automático) |
| **FERRAMENTAS** | - Claude API (geração de texto estruturado)<br>- minibroker FrmDraftBL (via API REST)<br>- FTP INTTRA (DraftEndFtpProducao)<br>- ClassesXMLDUE (XSD oficial RFB já implementado) |
| **IMPL.** | - Draft B/L: usar lógica do minibroker FrmDraftBL — campos adsMainAgenteCdInttra, adsMainBookingArmador, containers<br>- DU-E: usar ClassesXMLDUE.pas — NUNCA transmitir automaticamente, sempre revisão + aprovação humana + A3<br>- Controlar número de amendment (adsMainNrAmend) com histórico de versões |


| **AGENTE 09: BOOKING** **MARÍTIMO**  **[****EXPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Solicitação de booking recebida (instrução de embarque confirmada, espaço disponível identificado pelo Agente 10) |
| **ENTRADAS** | - Instrução de embarque (shipper, consignee, POL/POD, commodity, containers)<br>- Resultado de availability do Agente 10 (allocation disponível)<br>- Contratos TBID ativos (armador preferencial por rota)<br>- Histórico de bookings do cliente em TPROCESSO_EXP |
| **SAÍDAS** | - Número de booking confirmado pelo armador (via INTTRA ou API direta)<br>- Confirmação de datas: CY opening, VGM cutoff, SI cutoff, ETD/ETA<br>- Registro no processo (TPROCESSO_EXP + PostgreSQL)<br>- Alerta ao Agente 10 para atualizar consumo de allocation |
| **FERRAMENTAS** | - INTTRA API REST (substitui RPA minibrowser/Chromium)<br>- APIs diretas: Maersk=0023, MSC=0031, Hapag-Lloyd=0338, CMA-CGM=0624<br>- LangGraph StateGraph (fluxo: solicitar → confirmar → tratar recusa)<br>- myconsultaretornointtra (polling SFTP para confirmação de booking) |
| **IMPL.** | - Migração do RPA minibrowser para INTTRA API REST é prioridade — RPA é frágil a mudanças de layout<br>- Fluxo de recusa: Agente notifica analista, sugere alternativas de armador/roteirização com base em TBID<br>- Tipos de container mapeados para códigos INTTRA (20DC, 40DC, 40HC, etc.)<br>- Human-in-the-loop para exceções: espaço negado, armador sem availability, datas incompatíveis |


| **AGENTE 10: GESTÃO DE ALLOCATION /** **MQC**  **[****EXPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Novo processo de exportação aberto, ou polling semanal de compliance de contratos MQC |
| **ENTRADAS** | - Contratos MQC ativos (TBID — armador, rota POL/POD, volume comprometido, período)<br>- Bookings realizados no período (consumo atual por armador/rota)<br>- Projeção de embarques futuros (pipeline de processos em aberto) |
| **SAÍDAS** | - Dashboard de compliance por contrato MQC (% utilizado, shortfall projetado, prazo)<br>- Alerta crítico se shortfall > threshold configurável (ex.: < 70% do MQC com < 30 dias para vencer)<br>- Sugestão de redistribuição: processos que podem migrar de armador para recuperar compliance<br>- Feed de disponibilidade para o Agente 09 (qual armador tem allocation disponível agora) |
| **FERRAMENTAS** | - PostgreSQL (leitura TBID + contagem bookings)<br>- Claude API (análise de padrões, sugestões de redistribuição)<br>- Dashboard React em tempo real<br>- Notificação via Agente 08 (alertas críticos para gestores) |
| **IMPL.** | - Calcular % de utilização por contrato: bookings_realizados / volume_mQC_comprometido × 100<br>- Projeção de shortfall: se pipeline atual < MQC restante, alertar com antecedência configurável<br>- Integração bidirecional com Agente 09: Agente 10 informa availability → Agente 09 prioriza armadores em subuso<br>- Alertas críticos escalam para humano (gestor comercial) — decisão de redistribuição é humana |


## 5.3 Agentes da Vertical Importação


| **AGENTE 03: VERIFICAÇÃO DE** **ACURACIDADE**  **[****IMPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Após ingestão de documento — verificar consistência entre documentos e instruções do cliente |
| **ENTRADAS** | - JSON do Agente de Ingestão<br>- PO / instrução de embarque do cliente<br>- Dados do processo em TPROCESSO<br>- Histórico de divergências do cliente |
| **SAÍDAS** | - Relatório de conformidade (campos OK / divergentes / ausentes)<br>- Lista de itens que requerem ação humana<br>- Sugestão de correção quando possível<br>- Evento de followup criado automaticamente |
| **FERRAMENTAS** | - Claude API (comparação semântica)<br>- Regras configuradas em TCLIENTE_SERVICO<br>- Acesso a TPROCESSO via mywebapi REST |
| **IMPL.** | - Verificar: valores Invoice vs. PO, peso Packing List vs. BL, NCM declarado vs. NCM histórico<br>- Divergências classificadas por severidade: crítica (bloqueia), atenção (alerta), informativa (log)<br>- Aprender com histórico: se divergência foi aceita 3x para mesmo cliente/produto, reduzir severidade |


| **AGENTE 05: COMPLIANCE / ÓRGÃOS** **ANUENTES**  **[****IMPORTAÇÃO]** |  |
| --- | --- |
| **GATILHO** | Após classificação NCM confirmada, verificar obrigações regulatórias (somente importação) |
| **ENTRADAS** | - NCM classificado<br>- País de origem<br>- Tipo de mercadoria (alimento, medicamento, químico, etc.)<br>- CNPJ do importador |
| **SAÍDAS** | - Lista de órgãos anuentes requeridos (Anvisa, Mapa, INMETRO, etc.)<br>- Status de LI: necessária / dispensada / já obtida<br>- Alertas de licenças próximas ao vencimento<br>- Instruções de parametrização no Siscomex |
| **FERRAMENTAS** | - Claude API (análise de obrigações)<br>- myparametrizacao / myparametrizacaoli (lógica de LI portada)<br>- APIs Siscomex (consulta LI)<br>- Base de regras TNCM + tabela de órgãos anuentes |
| **IMPL.** | - Replicar lógica do myparametrizacaoli em Python: identificar TIPO de LI (automática vs. não-automática)<br>- Integrar com myconsultalilote para consulta em lote de status de LIs no Siscomex<br>- Para drawback isenção: integrar com integracaodrawbackisencao (XML via Portal Único mTLS) |


# 6. Macro Processos Operacionais


## 6.1 Importação — Fluxo DUIMP (v4.0 — SEM DI Legada)


| **Etapa** | **Responsável** | **Automação IA** | **Aprovação Humana** |
| --- | --- | --- | --- |
| 1. Abertura do processo | Analista ou EDI | Orquestrador cria processo, aciona agentes | Não necessária |
| 2. Recepção documentos | Agente 02 Ingestão | OCR + extração + validação automática | Se confiança < 80% |
| 3. Verificação Invoice/PO | Agente 03 Verificação | Comparação semântica automática | Se divergência crítica |
| 4. Classificação NCM | Agente 04 NCM | Sugestão NCM + alíquotas | Threshold configurável |
| 5. Verificação LI/Órgãos | Agente 05 Compliance | Identificação automática de obrigações | Para LI não-automática |
| 6. Registro DUIMP | Agente 07 + Analista | Preenchimento automático dos campos DUIMP | OBRIGATÓRIA — certificado A3 |
| 7. Acompanhamento navio | Agente 06 Rastreamento | Polling ETAs, alertas automáticos | Não necessária |
| 8. Desembaraço | Analista + Agente 06 | Monitoramento canal, alertas prioridade | Decisões no canal |
| 9. Entrega (TM) | Agente 06 Rastreamento | Tracking transportadora via tmserviceapi | Não necessária |
| 10. Faturamento | Agente 08 + Financeiro | Pré-faturamento via Wallet minibroker | Aprovação do valor final |


> **📌 Dados Históricos de DI — Estratégia v4.0**
> - TDECLARACAO_IMPORTACAO e TADICAO_DE_IMPORTACAO permanecem no SQL Server BROKER como arquivo histórico (26 anos de dados)
> - View read-only no PostgreSQL espelha as tabelas para consultas e relatórios via pyodbc
> - sp_di_calculo e sp_calc_* são acessadas apenas para leitura de histórico de impostos — não reescritas
> - Novos processos: 100% via DUIMP no Portal Único — customs-service cuida do fluxo completo


## 6.2 Exportação — Fluxo DU-E + Booking + Allocation


| **Etapa** | **Responsável** | **Automação IA** | **Aprovação Humana** |
| --- | --- | --- | --- |
| 1. Abertura do processo | Analista ou cliente | Orquestrador cria processo, aciona agentes | Não necessária |
| 2. Instrução de embarque | Agente 02 Ingestão | OCR + extração + validação | Se confiança < 80% |
| 3. Verificação documentos | Agente 03 Verificação | Comparação com PO/instrução | Se divergência crítica |
| 4. Classificação NCM (EXP) | Agente 04 NCM | NCM + alíquotas de exportação | Threshold configurável |
| 5. Verificação allocation | Agente 10 Allocation | Consulta MQC disponível por armador/rota | Não (informativo) |
| 6. Booking marítimo | Agente 09 Booking | Submissão INTTRA API / API direta armador | Exceções e recusas |
| 7. Emissão documentos | Agente 07 Documental | Fatura, Packing List, Draft B/L | Sempre para DU-E |
| 8. Registro DU-E | Agente 07 + Analista | Preenchimento via ClassesXMLDUE | OBRIGATÓRIA — certificado A3 |
| 9. Averbação DU-E | robodue + Agente 06 | Monitoramento status (canal, canal verde, averbação) | Averbação: automática |
| 10. Faturamento | Agente 08 + Financeiro | Pré-faturamento via Wallet | Aprovação do valor final |


# 7. Modelo de Dados — PostgreSQL


## 7.1 Grupos de Tabelas


| **Grupo** | **Tabelas Principais** | **Origem Legado** |
| --- | --- | --- |
| Processos | process, process_export, process_stage | TPROCESSO, TPROCESSO_EXP, TFOLLOWUP_ETAPA |
| Documentos | document, document_field, document_embedding | NOVO — sem equivalente direto |
| Fiscal / DUIMP | ncm, ncm_tax, li_license, duimp_declaration, duimp_addition | TNCM, TADICAO_DE_IMPORTACAO (somente leitura), TDETALHE_MERCADORIA |
| DI Histórica | v_di_historica (VIEW read-only via pyodbc) | TDECLARACAO_IMPORTACAO, TADICAO_DE_IMPORTACAO — somente leitura, sem reescrita |
| Exportação | due_declaration, booking, shipment, container, bl_draft, mq_contract | TPROCESSO_EXP, TPROCESSO_DRAFT_BL, TBID |
| Financeiro | billing, payment_requested, cash_requested, item_invoiced | MYINDAIAV2 (manter estrutura atual) |
| Clientes | customer, customer_service, customer_group | TCLIENTE, TCLIENTE_SERVICO |
| Agentes IA | agent_run, agent_decision, agent_audit | NOVO — sem equivalente |
| Configuração | confidence_threshold, event_code, organization | TSERVICO, TUNID_NEG, M10_DADOS |


## 7.2 Tabelas Novas em v4.0 (Booking + Allocation)


| **Tabela** | **Campos Principais** | **Fonte Legado** |
| --- | --- | --- |
| booking | id UUID, nr_processo FK, cd_armador, nr_booking_inttra, nr_booking_armador, dt_cy_opening, dt_vgm_cutoff, dt_si_cutoff, dt_etd, dt_eta, cd_status, fl_confirmado | TBID + minibrowser |
| mq_contract | id UUID, cd_armador, pol, pod, dt_inicio, dt_fim, vl_teus_comprometidos, vl_teus_realizados, vl_teus_projetados, pct_compliance, fl_alerta_ativo | TBID (novo: campos de compliance) |
| due_declaration | id UUID, nr_processo FK, nr_due, cd_status_due (10=Registrada,20=Canal Verde,70=Averbada,80=Cancelada), dt_registro, dt_averbacao, cd_despachante, xml_payload | robodue + ClassesXMLDUE |
| duimp_declaration | id UUID, nr_processo FK, nr_duimp, cd_canal, dt_registro, cd_despachante, xml_payload, fl_aprovacao_humana | integracaoduimp + PGDI011 |


# 8. Integrações Externas


## 8.1 Portal Único da Receita Federal


| **Componente** | **Detalhes** |
| --- | --- |
| Proxy mTLS | apiproxyportalunico — já implementado em Delphi, portar para Python (httpx + certificado PEM) |
| Despachantes cadastrados | 003=Luiz, 031=Edgar, 042=Vanessa, 027=Mello, 028=Cristiano, 001=Fabricio |
| DUIMP | URL: https://portalunico.siscomex.gov.br — webhook de retorno via duimpwebhook |
| DU-E | Status: 10=Registrada, 20=Canal Verde, 70=Averbada, 80=Cancelada — monitorado via robodue |
| Drawback | XML transmitido via REST+mTLS — integracaodrawbackisencao (certificados Fabricio.pem / Edgar.pem) |


## 8.2 INTTRA (Booking — Vertical Exportação)


| **Componente** | **Detalhes** |
| --- | --- |
| Situação atual | RPA via Chromium (minibrowser) — FRÁGIL — prioridade migrar para INTTRA API REST |
| Armadores mapeados | Maersk=0023, MSC=0031, Hapag-Lloyd=0338, CMA-CGM=0624 |
| Draft B/L | FTP INTTRA (produção: DraftEndFtpProducao, homologação: DraftEndFtpHomologacao) |
| Retorno booking | myconsultaretornointtra — polling SFTP para confirmação de número de booking |
| Agente responsável | Agente 09 (Booking Marítimo) — substituirá minibrowser completamente |


# 9. Roadmap de Implementação — 2 Verticais


O roadmap v4.0 é estruturado em 2 verticais paralelas (Exportação e Importação) mais uma camada transversal. As verticais podem ser desenvolvidas por times independentes após a fundação ser estabelecida.

> **📌 Princípio** **Strangler** **Fig** **— Regra de Ouro**
> O sistema Delphi NUNCA para. Cada módulo Python é construído em paralelo, testado exaustivamente, e o cutover é feito cliente por cliente.
> O rollback é sempre possível. Nenhum processo de cliente é interrompido durante a migração.
> Os Agentes 09 e 10 operam sobre o sistema Delphi existente desde a Fase 2 — sem substituir nada, apenas adicionando inteligência ao fluxo de exportação.


## 9.1 Fase 0 — Segurança Imediata (Semana 1) — AMBOS OS TIMES


**CRÍTICO: Rotacionar senha SA do SQL Server INDAIA10**

CRÍTICO: Isolar ou desativar portal ASP legado com credencial hardcoded

Mapear todos os arquivos com User ID=sa;Password=123 e substituir por conta com privilégios mínimos

## 9.2 Fase 1 — Fundação Compartilhada (Semanas 1–10)


Setup infraestrutura AWS Brasil (VPC, RDS PostgreSQL, ElastiCache Redis, ECS)

PostgreSQL com pgvector — schema inicial baseado no MYINDAIAV2 + tabelas DUIMP + tabelas Booking/Allocation

API Gateway FastAPI com OAuth2 + JWT

Portar lógica mTLS do apiproxyportalunico para Python

Configurar LangGraph + integração Claude API + Langfuse

Pipeline CI/CD

## 9.3 Fase 2 — Agentes Transversais + Início das Verticais (Semanas 11–26)


| **Agente** | **Vertical** | **Prazo** | **Entrega de Valor** |
| --- | --- | --- | --- |
| 02 — Ingestão Documental | Transversal | 3 sem | OCR automático — elimina digitação manual |
| 01 — Orquestrador (básico) | Transversal | 2 sem | Pipeline automático para novos processos |
| 04 — Classificação NCM | Transversal | 3 sem | Sugestão NCM com 85%+ acurácia |
| 06 — Rastreamento Logístico | Transversal | 3 sem | Alertas automáticos de ETA |
| 03 — Verificação Acuracidade | Importação | 2 sem | Detecta divergências Invoice/PO automaticamente |
| 10 — Gestão de Allocation/MQC | Exportação | 3 sem | Dashboard MQC compliance em tempo real |
| 09 — Booking Marítimo (INTTRA API) | Exportação | 4 sem | Substitui RPA frágil — booking via API oficial |
| 08 — Comunicação | Transversal | 2 sem | Notificações automáticas multicanal |


## 9.4 Fase 3 — Portais Web + Integrações (Semanas 27–34)


Interface React interna — painel do analista (ambas as verticais)

Portal do cliente — webapp migrado para novo backend

Conectar agentes ao minibroker via REST (DU-E, Draft B/L, Wallet)

## 9.5 Fase 4 — Integrações Governamentais (Semanas 35–46)


Vertical Exportação: gov-integration-service (DU-E + Portal Único + INTTRA)

Vertical Importação: customs-service (DUIMP completo + Portal Único)

Agente 05 — Compliance/LI (importação)

Agente 07 — Emissão Documental (exportação)

## 9.6 Fase 5 — Núcleo de Importação (Semanas 47–62)


customs-service: fluxo DUIMP completo — 14 semanas (era 20 sem com DI Legada)

Integração DUIMP + Portal Único com aprovação humana + A3

View read-only de DI histórica no PostgreSQL (pyodbc → SQL Server BROKER)

## 9.7 Fase 6 — Núcleo de Exportação (Semanas 47–58)


export-service: fluxo DU-E + Draft B/L completo

Agentes 09 e 10 já em produção desde Fase 2 — Fase 6 completa a reescrita do export-service

Booking via INTTRA API REST totalmente operacional

## 9.8 Fase 7 — Financeiro (Semanas 63–78)


billing-service: faturamento, NFS-e multi-município, integração Senior ERP (SOAP)

Wallet: migrar módulo financeiro do minibroker

## 9.9 Fase 8 — Descomissionamento (Semanas 79–90)


Cutover gradual por cliente — começando pelos menores

Desligar módulos Delphi substituídos (mais simples sem PGDI)

Fine-tuning com histórico de 26 anos de processos

> **Comparativo Antes vs. Depois da Decisão DUIMP-Only**
> Total de semanas: ~136 sem (com DI)  →  ~100 sem (só DUIMP)  →  Economia: ~36 semanas (~9 meses)
> Custo estimado (2 devs): ~R$ 870.000  →  ~R$ 640.000  →  Economia: ~R$ 230.000
> Risco fiscal: CRÍTICO (reimplementar SPs)  →  BAIXO (RFB calcula)  →  Risco de autuação eliminado
> Fases críticas: Fase 5 + Fase 7 (cálculos)  →  Fase 5 (só DUIMP)  →  Uma fase crítica a menos


# 10. Riscos e Mitigações


| **Risco** | **Prob****.** | **Impacto** | **Mitigação** |
| --- | --- | --- | --- |
| Credencial SA exposta em produção | Alta (confirmada) | CRÍTICO | Rotacionar imediatamente — Fase 0 |
| Perda de regras de negócio na migração | Média | Alto | Manter legado em paralelo 12 meses. Testes de regressão extensivos. |
| Resistência da equipe | Média | Médio | Treinamento, gamificação, mostrar ROI rápido (menos digitação) |
| Latência LLM em operações críticas | Baixa | Alto | Cache de resultados no Redis. Fallback para regras deterministas. |
| Falha no mTLS Portal Único | Baixa | Alto | Certificados de backup. Rotação automática. Health checks a cada 5 min. |
| Mudança de layout INTTRA (RPA) | Alta (RPA frágil) | Médio | Migrar para INTTRA API REST oficial como PRIORIDADE (Agente 09) |
| Dado incorreto de LLM em DUIMP/DU-E | Média | CRÍTICO | NUNCA automático — sempre revisão + assinatura digital A3 |
| Shortfall MQC por falta de visibilidade | Média | Alto | Agente 10 monitora em tempo real — alertas configuráveis com antecedência |


# 11. Critérios de Sucesso


| **Métrica** | **Baseline Atual** | **Meta 12 Meses** | **Meta 24 Meses** |
| --- | --- | --- | --- |
| Tempo médio de abertura DUIMP | 45–60 min (manual) | < 15 min (IA-assistido) | < 5 min (90% automático) |
| Taxa de erro em NCM | ~3% (estimado) | < 1% | < 0.3% |
| Processos por analista/dia | Baseline a medir | +40% | +100% |
| Tempo de notificação ao cliente | Variável (manual) | < 30 min após evento | Tempo real (< 5 min) |
| Compliance MQC (média contratos) | Sem monitoramento | Visibilidade em tempo real | Alertas preditivos 30 dias |
| Taxa de sucesso booking (1a tentativa) | Sem métrica | > 85% | > 95% |
| Uptime sistema | Sem SLA formal | 99.5% | 99.9% |
| Credenciais expostas | SA/123 hardcoded | ZERO | ZERO |


# 12. Próximos Passos Imediatos


**Rotacionar credencial SA imediatamente (Semana 1 — não adiar)**

Contratar desenvolvedor Python/IA sênior — Vertical Exportação (LangGraph + FastAPI + INTTRA)

Contratar desenvolvedor Python/IA sênior — Vertical Importação (LangGraph + FastAPI + Portal Único DUIMP)

Setup infraestrutura AWS Brasil (Fase 1)

Iniciar Agente de Ingestão Documental como prova de conceito rápida (6–10 semanas)

Definir responsável por Agente 09 (Booking): contato com INTTRA para acesso API REST

> **Documento gerado automaticamente como parte do projeto** **MyINDAIA** **v4 — COMEX AI-****First**
> Este documento (PVD v4.0) substitui o PVD v3.0 e incorpora: eliminação da DI Legada do escopo,
> adição dos Agentes 09 (Booking Marítimo) e 10 (Gestão de Allocation/MQC), e reestruturação
> do roadmap em 2 verticais independentes (Exportação e Importação).
