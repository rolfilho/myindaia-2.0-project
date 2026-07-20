> **ARQUITETURA DE TRANSIÇÃO**
> **Delphi + Python**
> **Coexistência, Gateway e Migração Gradual**
> Strangler Fig Pattern  |  2 Verticais Paralelas  |  INDAIA Logística Internacional  |  v2.0  |  Março 2026


> **⚡ O que muda na v2.0**
> - Tabela de roteamento atualizada: /customs/* (DUIMP) para Time B; /booking/* e /allocation/* novos (Agente 09+10)
> - Camada Python agora mostra 10 agentes (era 8)
> - Componentes Python expandidos: customs-service, booking-service, allocation-service, export-service
> - Estratégia dual de banco atualizada: DI histórica como view read-only (não migrar TDECLARACAO)
> - Padrão de migração por módulo: inclui etapa de rollback e validação paralela
> - Stack tecnológica: inclui INTTRA API REST como nova integração do Time A


# 1. Arquitetura de Coexistência


Durante a transição — que dura ~24 meses — Delphi e Python rodam simultaneamente. Um API Gateway FastAPI atua como fachada única: o cliente (webapp, portal, integrações) nunca sabe qual sistema está respondendo.

> **CLIENTES E SISTEMAS EXTERNOS**
> webapp PWA  |  Portal Web  |  BASF/Nestlé/Pirelli SFTP  |  Portal Único  |  INTTRA
> **API GATEWAY (****FastAPI** **Python) — FACHADA ÚNICA**
> Autenticação JWT  |  Rate Limiting  |  Roteamento  |  Observabilidade  |  HTTPS/TLS


| **SISTEMA LEGADO (Delphi)**<br>- ddbroker.exe \| mywebapi \| minibroker<br>- SQL Server BROKER (INDAIA10)<br>- Módulos ainda não migrados<br>- minibrowser.pas (Booking RPA — fallback) | **SISTEMA NOVO (Python)**<br>- 10 Agentes IA \| Serviços por módulo<br>- PostgreSQL + Redis (AWS Brasil)<br>- customs-service (DUIMP) \| export-service<br>- booking-service (Ag 09) \| allocation-service (Ag 10) |
| --- | --- |


> **CAMADA DE DADOS COMPARTILHADA**
> SQL Server BROKER (leitura Python via pyodbc)  |  PostgreSQL MYINDAIAV2 (leitura/escrita ambos)  |  Redis (cache compartilhado)


## 1.1 Lógica de Roteamento do Gateway — v2.0


O API Gateway decide para onde rotear cada requisição baseado em uma tabela de roteamento configurável. A tabela v2.0 reflete as 2 verticais e os novos endpoints de booking/allocation.

| **Endpoint** **/ Módulo** | **Fase 1-2** | **Fase 3-4** | **Fase 5-6** | **Fase 7-8** |
| --- | --- | --- | --- | --- |
| /auth/login | Delphi mywebapi | Python FastAPI | Python FastAPI | Python FastAPI |
| /processos/importacao | Delphi mywebapi | Delphi mywebapi | Python customs-service | Python customs-service |
| /processos/exportacao | Delphi mywebapi | Delphi mywebapi | Delphi mywebapi | Python export-service |
| /customs/* (DUIMP) | Python (NOVO) | Python | Python | Python |
| /booking/* (Ag 09) | Python (NOVO) | Python | Python | Python |
| /allocation/* (Ag 10) | Python (NOVO) | Python | Python | Python |
| /ai/* (agentes) | Python (NOVO) | Python | Python | Python |
| /financeiro/* | Delphi | Delphi | Delphi | Python billing-service |
| /documentos/* | Delphi digitalizacao | Python doc-service | Python doc-service | Python doc-service |
| /notificacoes | Delphi mysendmail | Python CommAgent | Python CommAgent | Python CommAgent |


```python
# api/gateway/router.py — Roteamento configurável v2.0
ROUTING_TABLE = {
    'processos_importacao': {
        'legacy': 'http://localhost:8080/indaia/api/Service/ProcessosImpo',
        'python': 'http://customs-service:8003/api/v1/customs',
        'current': 'legacy',  # <- alterar para 'python' no cutover da Fase 5
        'rollback_window': 7,  # dias para reverter
    },
    'processos_exportacao': {
        'legacy': 'http://localhost:8080/indaia/api/Service/ProcessosExpo',
        'python': 'http://export-service:8004/api/v1/export',
        'current': 'legacy',  # <- alterar para 'python' no cutover da Fase 6
    },
    'booking': {
        'legacy': None,  # não existe no legado (era RPA manual)
        'python': 'http://ai-service:8002/api/v1/booking',
        'current': 'python',  # NOVO — sempre Python desde Fase 2
    },
    'allocation': {
        'legacy': None,  # não existe no legado
        'python': 'http://ai-service:8002/api/v1/allocation',
        'current': 'python',  # NOVO — sempre Python desde Fase 2
    },
    'agentes_ia': {
        'legacy': None,
        'python': 'http://ai-service:8002/ai',
        'current': 'python',
    },
}
```


# 2. Componentes da Arquitetura Python — v2.0


| **Serviço** | **Descrição** | **Fase** | **Time** |
| --- | --- | --- | --- |
| API Gateway (FastAPI) | Ponto de entrada único. Auth JWT. Rate limiting. Logging. Roteamento Delphi↔Python. Feature flags para cutover. | F1 | Ambos |
| auth-service | OAuth2 + JWT (mesmo secret do Delphi). RBAC por perfil. Suporte a certificado A3. | F1 | Ambos |
| AI Service (LangGraph) | 10 agentes de IA. Orquestrador, Ingestão, Verificação, NCM, Compliance, Rastreamento, Documental, Comunicação, Booking, Allocation. State persistido no Redis. | F2 | Time A + B |
| customs-service | FastAPI + SQLAlchemy. Fluxo DUIMP completo (substitui PGDI). NÃO reimplementa cálculos — Portal Único calcula. DUIMP-only. | F5 | Time B |
| export-service | FastAPI + SQLAlchemy. Gestão de exportação (substitui PGPE). DU-E, Draft B/L (delega ao minibroker), fatura, packing list. Agentes 09+10 já em produção. | F6 | Time A |
| booking-service (Agente 09) | FastAPI. Substitui minibrowser.pas RPA. INTTRA API REST + APIs diretas Maersk/CMA/Hapag. Gestão de recusas. Polling confirmação. | F2 | Time A |
| allocation-service (Agente 10) | FastAPI. Monitora contratos MQC. Calcula compliance em tempo real. Alertas ATENÇÃO/ALERTA/CRÍTICO/SOBRE-USO. Dashboard React. | F2 | Time A |
| process-service | FastAPI + SQLAlchemy. Gestão de processos IMP+EXP (substitui PGGP). Hub central. | F5/F6 | Ambos |
| billing-service | FastAPI + Celery. Faturamento (substitui PGFT/PGPG). Integra Senior ERP via SOAP. NFS-e multi-município. Wallet do minibroker. | F7 | Ambos |
| gov-integration-service | FastAPI + Celery. Portal Único mTLS, INTTRA API/FTP, CE-Mercante, SDA Santos/RJ, Siscomex LI, Senior SOAP, SFTP clientes. | F4 | Ambos |
| document-service | FastAPI + S3 + pgvector. Upload, OCR Claude Vision, indexação semântica. | F3 | Ambos |
| notification-service | FastAPI + Celery + Firebase FCM. Push/email/SMS. Multilingue PT/EN/ES. | F2 | Ambos |


# 3. Banco de Dados — Estratégia Dual


Durante a transição, dois bancos coexistem. O Python lê do SQL Server para contexto histórico, e escreve no PostgreSQL para dados novos. A DI histórica permanece no SQL Server — nunca migrar.

| **SQL Server — BROKER (LEGADO)**<br>INDAIA10 — Produção<br>- 1.205 tabelas, 26 anos de dados<br>- Acesso Python: SOMENTE LEITURA via pyodbc<br>- Escrita: apenas pelo ddbroker Delphi<br>- Migrado para PostgreSQL na Fase 8<br>**Tabelas críticas lidas pelo Python:**<br>- TPROCESSO (316 cols) — contexto<br>- TPROCESSO_EXP (124 cols) — exportação<br>- TDETALHE_MERCADORIA — NCM histórico<br>- TFOLLOWUP_ETAPA — eventos<br>- TNCM — alíquotas e regras fiscais<br>- TBID — contratos MQC armadores<br>**DI HISTÓRICA — Nunca migrar:**<br>- TDECLARACAO_IMPORTACAO (156 cols)<br>- TADICAO_DE_IMPORTACAO (177 cols)<br>→ Acesso via VIEW read-only no PostgreSQL | **PostgreSQL 16 — NOVO SISTEMA**<br>AWS RDS — Produção<br>- Schema: comex + extensão pgvector<br>- Leitura E escrita pelo Python<br>- Leitura pelo minibroker Delphi (Aurelius)<br>- MYINDAIAV2 migrado aqui na Fase 1<br>**Tabelas novas v2.0 (sem equivalente legado):**<br>- duimp_declaration — fluxo DUIMP<br>- duimp_addition — adições DUIMP<br>- booking — Agente 09 (Booking)<br>- mq_contract — Agente 10 (MQC)<br>- allocation_tracking — rastreamento<br>- agent_run — auditoria dos agentes<br>- document — documentos + embeddings<br>**VIEW** **read-only****:**<br>- v_di_historica — espelha DI via pyodbc |
| --- | --- |


## 3.1 Sincronização Bidirecional — Processos Novos


Para processos novos criados no Python, os dados precisam estar disponíveis também no Delphi durante a transição:

```python
# db/sync/process_sync.py — sincronização Python → SQL Server
async def sync_new_process_to_broker(process):
    """Replicar processo novo do PostgreSQL para o BROKER SQL Server"""
    conn = get_broker_connection()  # conta com permissão de escrita em TPROCESSO
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO TPROCESSO (NR_PROCESSO, CD_CLIENTE, CD_SERVICO,
                               CD_UNID_NEG, DT_ABERTURA, CD_STATUS,
                               NR_CONHECIMENTO, CD_PAIS_ORIGEM)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """, process.nr_processo, process.cd_cliente, process.cd_servico,
           process.cd_unid_neg, process.dt_abertura, process.cd_status,
           process.nr_conhecimento, process.cd_pais_origem)
    conn.commit()
    # Registrar evento de criação no followup (para ddbroker ver)
    cursor.execute("EXEC SP_CRIA_FOLLOWUP @NR_PROCESSO=?, @CD_EVENTO='001'",
                   process.nr_processo)
    conn.commit()
```


# 4. Padrão de Migração por Módulo


Cada módulo Delphi segue o mesmo padrão de 6 passos para ser migrado para Python. Este padrão garante zero downtime e rollback seguro em qualquer etapa.

| **Passo** | **Atividade** | **Duração** | **Entregável** |
| --- | --- | --- | --- |
| 1 | Engenharia Reversa: documentar todas as regras de negócio do código Delphi | 1–2 sem | Documento de regras + casos de teste |
| 2 | Criar serviço Python com endpoints equivalentes (sem lógica ainda — retorna mock) | 1 sem | Serviço rodando com contrato de API definido |
| 3 | Implementar lógica de negócio em Python com testes unitários | 2–4 sem | Código com 90%+ cobertura de testes |
| 4 | Configurar gateway para rotear 10% do tráfego para Python (canary) | 1 sem | Gateway com roteamento 10/90 |
| 5 | Monitorar por 1–2 semanas, aumentar para 50%, depois 100% | 1–2 sem | Gráficos de comparação Delphi vs Python |
| 6 | Desligar endpoint Delphi, remover do gateway | 1 dia | Módulo migrado confirmado |


> **Regra de** **Rollback**
> Se em qualquer passo o Python apresentar erro em produção, o gateway reverte para Delphi em < 5 minutos.
> O Delphi NUNCA é desligado antes do Python estar estável por pelo menos 4 semanas em 100% do tráfego.
> Feature flags no ROUTING_TABLE permitem rollback sem deploy: alterar 'current': 'python' para 'current': 'legacy'.


## 4.1 Migração Especial — minibrowser.pas (Booking INTTRA RPA)


> **🔴 Prioridade:** **minibrowser.pas** **→ INTTRA API REST (Fase 4, Time A)**
> O minibrowser.pas faz booking no INTTRA via automação de navegador (RPA Chromium).
> É FRÁGIL: qualquer mudança de layout do portal INTTRA quebra o processo.
> Enquanto não migra: Agente 09 usa wrapper REST do minibroker como fallback (abordagem interim).
> Após a migração: INTTRA API REST oficial — estável, com SFTP de confirmação via myconsultaretornointtra.
> Prazo: 4 semanas. Complexidade alta — autenticação INTTRA, mapeamento EDI EDIFACT/X12, acknowledgments.


# 5. Stack Tecnológica Completa — v2.0


| **Camada** | **Tecnologia** | **Versão** | **Justificativa** |
| --- | --- | --- | --- |
| Linguagem | Python | 3.12 | Ecossistema IA nativo. FastAPI, LangGraph, pyodbc. |
| API Framework | FastAPI | 0.110+ | Async nativo, OpenAPI auto-gerado, performance. |
| Orquestração IA | LangGraph | 0.1+ | Grafos de estado, interrupt/resume, Redis checkpoint. |
| LLM | Claude Sonnet 4 (Anthropic API) | claude-sonnet-4-20250514 | Melhor custo/benefício para tarefas COMEX. |
| Banco (novo) | PostgreSQL 16 + pgvector | 16 | SQL robusto + busca semântica para documentos. |
| Cache / Fila | Redis 7 | 7 | Cache de resultados, fila de jobs, pub/sub agentes. |
| ORM (Python) | SQLAlchemy | 2.0+ | Async, migrations Alembic, PostgreSQL+pyodbc. |
| ORM (Delphi) | TMS Aurelius | Atual | Mantém compatibilidade com MYINDAIAV2. |
| Auth | OAuth2 + JWT + cert A3 | — | JWT interoperável com mywebapi. A3 para atos aduaneiros. |
| Booking/INTTRA | INTTRA API REST + EDI EDIFACT | — | Substitui RPA minibrowser. Fallback: wrapper REST minibroker. |
| Portal Único | httpx + SSL/mTLS | — | Porta apiproxyportalunico.pas para Python. |
| Frontend | React 18 + TypeScript + Tailwind | 18 | SPA moderna com notificações em tempo real. |
| Infra | AWS Brasil (sa-east-1) | — | LGPD, latência, SLA. |
| Observabilidade | Langfuse | — | Rastreamento de chamadas LLM, custo, qualidade. |
| Containerização | Docker + Docker Compose | — | Ambiente local + ECS em produção. |
| CI/CD | Bitbucket Pipelines / GitHub Actions | — | Build, test, deploy automático em staging. |


# 6. Serviços Python — Detalhamento por Vertical


## 6.1 Vertical Exportação — Novos Serviços v2.0


| **Serviço** | **Porta** | **Responsabilidade principal** | **Fase** |
| --- | --- | --- | --- |
| ai-service (Ag 09 Booking) | 8002/booking | INTTRA API REST + APIs diretas (Maersk/CMA/Hapag) + polling confirmação + gestão recusas | F2 (Time A) |
| ai-service (Ag 10 Allocation) | 8002/allocation | Monitorar contratos MQC, calcular compliance, alertas proativos, dashboard | F2 (Time A) |
| export-service | 8004 | PGPE completo, DU-E, Draft B/L, fatura, packing list. Expõe Ag 09+10 via REST interno. | F6 (Time A) |
| gov-integration (DU-E) | 8005/due | Portal Único mTLS — DU-E: ClassesXMLDUE + aprovação A3 + monitoramento robodue | F4 (Time A) |


## 6.2 Vertical Importação — Serviços v2.0


| **Serviço** | **Porta** | **Responsabilidade principal** | **Fase** |
| --- | --- | --- | --- |
| customs-service | 8003 | Fluxo DUIMP completo — 14 semanas. NÃO reimplementa cálculos de impostos. DUIMP-only. | F5 (Time B) |
| gov-integration (DUIMP) | 8005/duimp | Portal Único mTLS — DUIMP: integracaoduimp + duimpwebhook + aprovação A3 | F4 (Time B) |
| gov-integration (LI) | 8005/li | Siscomex LI — myparametrizacaoli + myconsultalilote + drawback isenção | F4 (Time B) |


# 7. Cutover por Cliente — Estratégia Gradual


O cutover não é feito de uma vez para todos os clientes. A migração é gradual, começando pelos processos de menor risco:

| **Fase do** **Cutover** | **Clientes / Processos** | **Critério** | **Rollback** |
| --- | --- | --- | --- |
| Pilot (Fase 2) | Processos internos de teste (prefixo 99) | Sem impacto em produção | Imediato — apenas desligar feature flag |
| Beta fechado (Fase 3) | 2–3 clientes menores sem integrações especiais | Voluntários — validar com operações | Feature flag por cd_cliente |
| Rollout gradual (Fase 5/6) | 10% → 50% → 100% dos processos novos | Monitorar por 2 semanas em cada etapa | Reverter feature flag em < 5 min |
| Cutover por cliente premium | BASF, Nestlé, Pirelli, Cargill | Apenas após 4 semanas de estabilidade em 100% | Delphi fica disponível como fallback |
| Descomissionamento (Fase 8) | Todos os clientes em Python | Sistema Delphi desligado módulo a módulo | SQL Server BROKER permanece como arquivo |


> **Nota sobre migração**
> O banco BROKER (SQL Server) NÃO é migrado de uma vez. O PostgreSQL novo recebe dados via API durante a operação.
> Usar tabela 'process' com campo 'nr_processo' como chave de sincronização com o Delphi legado.
> Consultas de contexto histórico continuam indo ao BROKER via pyodbc (somente leitura).
> DI histórica (TDECLARACAO + TADICAO): permanece no SQL Server — NUNCA migrar para PostgreSQL.


> **Documento gerado automaticamente — Arquitetura de Transição** **Delphi→Python** **v2.0 | INDAIA**
> Substitui Arquitetura_Transicao_Delphi_Python.docx.
> v2.0: tabela de roteamento inclui /booking/* e /allocation/*; 10 agentes; DI histórica como VIEW read-only.
