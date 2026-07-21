# Glossary & Translation Dictionary — English to PT-BR

**Context:** MyINDAIA Modernization Project — Internal Work Reference  
**Purpose:** Standardize the translation and framing of key technical, strategic, governance, and domain terms from internal English documentation (`00_Internal_Work/`) into Portuguese (PT-BR) for client-facing deliverables, executive pre-reads, and team communications.  
**Audience:** Ricardo Leite & Rodrigo Zayit (Internal Reference).

---

## 1. Principles of Translation & Client Framing

1. **Dual-Audience Communication:**
   - **Executive / Client-Facing (Fabricio & René):** Focus on business impact, risk reduction, operational continuity, and clarity. Avoid overly dense software engineering jargon where clear Portuguese equivalents exist (e.g., prefer *"Migração Gradual"* over *"Strangler Fig Pattern"*).
   - **Technical / Engineering Team (Wagner, Leandro, Devs):** Use standard industry technical terms (e.g., *mTLS*, *RBAC*, *Feature Flags*, *Docker/FastAPI*), accompanied by explicit context on operational rules.

2. **Non-Translational Acronyms (Keep as standard):**
   - Domain acronyms such as **DUIMP**, **DU-E**, **DI**, **NCM**, **SISCOMEX**, **A1/A3** are official Brazilian customs terms and must never be translated into English or altered.
   - Core technical standards such as **mTLS**, **RBAC**, **OCR**, **IDP**, **API**, **OpEx** should maintain their acronyms, with Portuguese descriptions provided on first reference.

3. **Strict Binding Terms:**
   - Terms tied to contractual constraints (Anexo I) or binding principles (AGENTS.md) must be translated with exact precision so no ambiguity is introduced during client ratification.

---

## 2. Core Translation Matrix

### A. Delivery Strategy & Migration Patterns

| English Term | Standard PT-BR Translation | Executive / Client-Facing Framing (Fabricio/René) | Technical / Operational Framing (Wagner/Devs) | Notes & Context |
| :--- | :--- | :--- | :--- | :--- |
| **Discovery** | Diagnóstico Técnico e Mapeamento de Solução | Fase de Diagnóstico e Definição da Arquitetura | Sprint de Mapeamento, Análise e Benchmarking | Refere-se à fase atual de 2 a 4 semanas para definir *o que construir, como e quanto custa*. |
| **Strangler Fig Pattern** | Padrão Estrangulador / Migração Gradual por Camadas | Migração Gradual e Segura por Etapas (sem parada do sistema) | Strangler Fig Pattern com fluxo de dados unidirecional | Substituição do sistema legado Delphi aos poucos, sem virada de chave única e de alto risco. |
| **Walking Skeleton** | Esqueleto Operacional Ponta a Ponta | Estrutura Mínima Funcional Integrada de Ponta a Ponta | End-to-end Walking Skeleton (Fluxo mínimo vertical) | Primeira versão mínima conectada (ex: leitura do BROKER -> notificação ao cliente no Zap/E-mail). |
| **Tracer Bullet** | Disparo de Sonda / Teste de Viabilidade Crítica | Teste Prático de Viabilidade Técnica Integrada | Tracer Bullet (Prova de conceito pontual em ambiente real) | Pequeno teste de validação para sanar incertezas binárias (ex: alcance INTTRA, mTLS com A1/A3). |
| **Vertical Slice** | Fatia Vertical de Funcionalidade | Entrega Completa de uma Funcionalidade | Vertical Slice (Front + Back + BD + Integração) | Entrega que atravessa todas as camadas do sistema para um caso de uso específico. |
| **MECE-complete "done" block** | Bloco Entregue Completo e Independente | Bloco de Entrega 100% Concluído e Sem Dependências Pendentes | Bloco MECE Finalizado (Escopo fechado e sem retrabalho) | Unidade de entrega que encerra completamente uma capacidade ou grupo de clientes. |
| **Cutover** | Virada de Chave Operacional | Virada de Chave Operacional (Transição por Cliente) | Virada de Chave por Cliente com Plano de Retorno (Cutover) | Ato de migrar a operação real de um cliente do Delphi para a nova plataforma. |
| **Rollback / Rollback Path** | Plano de Reversão / Retorno ao Legado | Mecanismo de Reversão Imediata em Caso de Anomalia | Rollback Plan (Retorno seguro ao banco BROKER) | Garantia de que qualquer migração pode ser desfeita sem perda de dados ou parada operacional. |
| **Write-back Boundary** | Fronteira de Escrita no Banco Legado | Limite Segregado de Gravação de Dados | Fronteira de Write-back no SQL Server `BROKER` | Mapeamento estrito de quais funções gravam no banco legado vs. apenas no novo sistema. |
| **System of Record (SoR)** | Sistema Fonte da Verdade / Registro Oficial | Sistema Principal de Registro e Gravação Oficial | System of Record (SoR) / Base Oficial de Dados | O banco/sistema que detém o estado definitivo da informação em determinado momento. |
| **Capability Layer** | Camada de Funcionalidades e Agentes | Camada de Serviços e Inteligência Operacional | Capability Layer (Agentes + Notificações + Dashboards) | Funcionalidades agregadas *sobre* o sistema legado antes da substituição do núcleo. |
| **Stage-1 Read-Only Bridge** | Ponte de Leitura da Fase 1 | Conector de Leitura Segura do Banco Atual | Stage-1 Read-Only Bridge (Interface de consulta ao BROKER) | Ponte somente-leitura para extrair dados do SQL Server sem risco de corrupção do legado. |
| **Pilot Client** | Cliente Piloto | Operação Piloto (Cliente Selecionado para Primeira Fase) | Cliente Piloto / Ambiente de Validação Real | Cliente com perfil comunicativo e tolerante escolhido para estrear novas funcionalidades. |

---

### B. Governance, Governance & Decision Framework

| English Term | Standard PT-BR Translation | Executive / Client-Facing Framing | Technical / Operational Framing | Notes & Context |
| :--- | :--- | :--- | :--- | :--- |
| **Working Agreement** | Acordo de Governança e Trabalho | Regras de Engajamento e Condução do Projeto | Acordo de Trabalho e Matriz de Responsabilidades | Define papéis (Ricardo vs. Rodrigo), ritos de decisão e entregáveis. |
| **Decision Register / Log** | Registro de Decisões Técnicas e Estratégicas | Painel de Decisões e Recomendação de Arquitetura | Decision Register (Log de Decisões Tier-1 e Tier-2) | Documento vivo com as 9 decisões principais, métodos, justificativas e aprovações. |
| **Tier-1 Decision** | Decisão Estratégica de Alto Impacto | Decisão Estratégica Direcionadora | Decisão Arquitetural Tier-1 | Decisões fundamentais que moldam todo o projeto (ex: banco de dados, motor de IA, estratégia de entrega). |
| **Empirical Method** | Método Empírico (Testado na Prática) | Validação Prática por Meio de Experimento/PoC | Teste Empírico / Prova de Conceito Técnica | Decisão baseada em testes práticos (ex: OCR de documentos em Anexo I §1.3). |
| **Analytical Method** | Método Analítico (Avaliado por Trade-offs) | Análise Técnica Comparativa com Trade-offs | Estudo Analítico Arquitetural | Decisão resolvida por análise estruturada de prós, contras, custos e riscos. |
| **Ratified / Ratification** | Ratificado / Homologado pelo Cliente | Decisão Ratificada pela Diretoria/CEO | Status: Ratified (Aprovado e Formalizado) | Estágio final de uma decisão após apresentação dos trade-offs e aceite do cliente. |
| **Kickoff Brief / Pre-read** | Documento de Alinhamento Inicial (Pré-Leitura) | Briefing de Alinhamento Estratégico (Pré-Leitura) | Kickoff Brief / Sumário de Premissas | Documento sintético enviado antes de reuniões-chave para acelerar decisões. |
| **What would change my mind** | Gatilhos para Mudar a Recomendação | Condições e Cenários para Reavaliação da Decisão | Trigger de Mudança de Orientação Arquitetural | Evidências específicas que justificariam alterar uma recomendação feita. |
| **Confidence Level** | Nível de Confiança da Recomendação | Nível de Convicção Técnica (Alto / Médio / Baixo) | Confidence Score (Grau de Certeza da Hipótese) | Grau de certeza baseado nos insumos disponíveis (Alta, Média ou Baixa). |
| **OpEx Model (IT OpEx)** | Modelo de Custo Recorrente de TI | Estimativa de Custo Operacional Recorrente de TI | Modelo de OpEx Cloud / Custos Recorrentes | Modelo financeiro dos custos mensais da nova infraestrutura (nuvem, APIs, licenças). |

---

### C. AI, Agents & Technical Architecture

| English Term | Standard PT-BR Translation | Executive / Client-Facing Framing | Technical / Operational Framing | Notes & Context |
| :--- | :--- | :--- | :--- | :--- |
| **Agent Cognitive Engine** | Motor Cognitivo de Agentes de IA | Plataforma Orquestradora de Inteligência Artificial | Motor de Orquestração de Agentes IA (LangGraph/n8n) | Infraestrutura que executa e coordena os agentes autônomos/especialistas. |
| **Auditable Agent Decision** | Decisão de Agente IA Auditável | Decisão de IA 100% Rastreável e Auditável | Audit Log de Decisão do Agente (Input, Output, Confiança) | Princípio rígido: toda ação de IA registra entradas, saídas, nível de confiança e aprovador. |
| **Human-in-the-Loop (HITL)** | Supervisão Humana Obrigatória (Alça Humana) | Validação Humana Obrigatória antes da Assinatura | Pattern Human-in-the-Loop / Intervenção Humana | Garantia de que atos aduaneiros nunca são assinados/enviados sem revisão humana. |
| **Intelligent Document Processing (IDP)** | Processamento Inteligente de Documentos | Extração Inteligente e Automática de Dados de Documentos | IDP / OCR com Validação Regrada de Dados | Tecnologia para extrair e validar dados de Invoices, Packing Lists e Bls. |
| **Role-Based Access Control (RBAC)** | Controle de Acesso Baseado em Papéis | Matriz de Permissões e Perfis de Acesso de Usuários | RBAC (Matriz de Funções, Permissões e Tenants) | Modelo de segurança para restringir ações e visualização de dados por perfil. |
| **A1 Software Certificate** | Certificado Digital A1 (Software) | Certificado Digital A1 (Instalado em Nuvem com Automação) | Certificado A1 em arquivo (.pfx / mTLS na nuvem) | Permite automação em servidor/nuvem sem dependência de hardware físico. |
| **A3 Hardware Token** | Certificado Digital A3 (Token/Cartão Físico) | Certificado Digital A3 (Token Físico Obrigatório para Assinatura) | Certificado A3 em HSM / Leitora Física local | Exige dispositivo físico acoplado e senha para efetivar atos aduaneiros não automatizáveis. |
| **mTLS (Mutual TLS)** | Autenticação Mútua por Certificado Digital | Conexão Segura por Certificado Digital Bilateral | Mutual TLS (mTLS via API Gateway / NGINX) | Protocolo de segurança exigido pelos sistemas do governo e armadores. |
| **Web Scraping / Minibrowser** | Coleta Automatizada de Dados Web | Automação de Consulta e Captura de Dados Externos | Web Scraping / Minibrowser Headless (Playwright/Selenium) | Captura automatizada de informações em portais de armadores, recintos e governo. |

---

### D. Customs Brokerage & COMEX Domain Terms

| English Term | Standard PT-BR Translation | Executive / Client-Facing Framing | Technical / Operational Framing | Notes & Context |
| :--- | :--- | :--- | :--- | :--- |
| **Customs Act** | Ato Aduaneiro / Etapa de Despacho | Etapa Oficial de Despacho Aduaneiro no Governo | Registro/Protocolo de Ato Aduaneiro no Siscomex | Ações jurídicas e fiscais vinculantes no Siscomex/Portal Único. |
| **DUIMP** | Declaração Única de Importação | DUIMP (Novo Processo de Importação no Portal Único) | Processo DUIMP / Integração API Portal Único | O foco total do MyINDAIA 2.0 na importação (substitui a antiga DI). |
| **DI (Legacy)** | Declaração de Importação Legada | DI Antiga / Processo Legado de Importação | Registro DI no BROKER (Tabelas de Calculo/DI) | Processo antigo de importação mantido apenas para consulta/histórico. |
| **DU-E** | Declaração Única de Exportação | DU-E (Processo Unificado de Exportação) | Módulo DU-E / Integração Siscomex Exportação | Processo de exportação já em modernização no MyINDAIA 2.0. |
| **NCM Classification** | Classificação Fiscal NCM | Classificação Fiscal de Mercadorias (NCM) | Validação NCM / Tabela Harmonizada do Mercosul | Identificação fiscal de produtos com impacto direto na tributação. |
| **Booking** | Reserva de Praça / Alocação de Espaço | Reserva de Praça / Alocação de Contêineres no Armador | Módulo de Booking / Integração INTTRA & Armadores | Processo de contratação de espaço em navios de carga. |
| **MQC (Minimum Quantity Commitment)** | Compromisso Mínimo de Volume | Meta de Volume Contratado com Armadores (MQC) | MQC Tracker / Monitoramento de Cota de Contêineres | Contratos de volume mínimo garantido com companhias marítimas. |
| **Proactive Client Notification** | Notificação Proativa ao Cliente | Informativo Proativo de Status para o Cliente | System Trigger / Push Notification Proativo | Alerta enviado ao cliente *antes* que ele precise ligar cobrando posição. |
| **BROKER Database** | Banco de Dados Legado BROKER | Base de Dados Atual do Sistema INDAIA | Banco SQL Server `BROKER` (~1.205 tabelas) | A base legada que sustenta as operações atuais há 26 anos. |

---

## 3. Glossary of Acronyms & Key Concepts

- **A1 / A3:** Tipos de Certificado Digital ICP-Brasil. A1 é em arquivo de software (validez 1 ano, altamente automatizável em nuvem); A3 é em hardware físico/token (validez 3 anos, requer leitora/intervenção).
- **DUIMP:** Declaração Única de Importação (Portal Único Siscomex).
- **DU-E:** Declaração Única de Exportação (Portal Único Siscomex).
- **HITL (Human-in-the-Loop):** Arquitetura de software onde a IA prepara, analisa e sugere, mas o ser humano obrigatoriamente valida e assina a ação final.
- **IDP (Intelligent Document Processing):** Uso de IA e OCR avançado para ler, estruturar e extrair dados de documentos não estruturados ou PDF (Invoices, Packing Lists, Conhecimentos de Embarque).
- **MECE (Mutually Exclusive, Collectively Exhaustive):** Princípio de estruturação de escopo: blocos que não se sobrepõem entre si (mutuamente exclusivos) e que juntos cobrem 100% da solução (coletivamente exaustivos).
- **mTLS (Mutual Transport Layer Security):** Conexão criptografada onde tanto o cliente quanto o servidor apresentam certificados digitais para autenticar a comunicação.
- **OpEx (Operational Expenditure):** Custos de operação recorrentes (mensais/anuais), como servidores em nuvem, consumo de APIs de IA e licenças de software.
- **RBAC (Role-Based Access Control):** Mecanismo de controle de acesso onde as permissões são atribuídas a papéis (ex: Despachante, Operador, Cliente, Administrador) e os usuários recebem esses papéis.
- **SoR (System of Record):** O repositório ou banco de dados que é a autoridade máxima e oficial sobre um conjunto de dados.

---

## 4. Summary of Translation Recommendations by Target Document

1. **For CEO Pre-Reads & Presentations (Fabricio / René):**
   - Translate engineering metaphors into business assurance vocabulary (*"Migração Gradual com Garantia de Retorno"*, *"Arquitetura com Validação Humana Obrigatória"*, *"Evolução em Blocos MECE sem Parada Operacional"*).
   - Use **"Virada de Chave Operacional"** for Cutover (more intuitive for business executives).
   - Use **hybrid names** for the 10 Cognitive AI Agents that preserve the English codename alongside the Portuguese description (e.g., *Agente NCM / Booking Agent / Agente DUIMP*).
   - Maintain focus on the primary metric: *"Notificação Proativa antes da Cobrança do Cliente"*.

2. **For Operational Alignments (Andrea / Teams):**
   - Use clear operational terms: *"Virada de Chave por Cliente"*, *"Reserva de Praça"*, *"Conferência de Documentos por IA com Validação do Operador"*.

3. **For Engineering Guidelines (Wagner / Internal Devs):**
   - Preserve standardized technical terms in English when discussing implementation: *FastAPI*, *React 19*, *LangGraph*, *PostgreSQL*, *RBAC*, *mTLS*, *Docker*, *OCR PoC*, *Cutover*.
