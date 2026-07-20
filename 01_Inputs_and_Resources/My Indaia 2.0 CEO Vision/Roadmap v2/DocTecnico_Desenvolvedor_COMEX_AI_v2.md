> **DOCUMENTO TÉCNICO**
> **Para o Desenvolvedor**
> Sistema COMEX AI-First
> INDAIA Logística Internacional  |  v2.0  |  Março 2026


| **Servidor produção** | **INDAIA10 (SQL Server)** |
| --- | --- |
| Servidor homologação | SQLHOMOLOG |
| JWT Secret (mywebapi + tmserviceapi) | 2d013705c915  (rotacionar na Fase 8) |
| Firebase Sender ID (webapp) | 667613920608 |
| Portal Único URL | https://portalunico.siscomex.gov.br |
| Repositórios analisados | 42 (Bitbucket — grupo myindaia) |
| Linguagem legado | Delphi (ddbroker: 1.025 arquivos .pas) |
| ORM moderno (Delphi) | TMS Aurelius (mypatterns / minibroker) |
| Arquitetura nova | Python 3.12 + LangGraph + Claude API + PostgreSQL + Redis + React |
| Escopo importação | 100% DUIMP — DI Legada (PGDI) eliminada do escopo |
| Agentes | 10 agentes (incl. Ag 09 Booking + Ag 10 Allocation) |


> **🔴 LEIA PRIMEIRO — Segurança Crítica**
> O portal ASP legado contém 'User ID=sa;Password=123' hardcoded em pelo menos 15 arquivos.
> O SA é o super-admin do SQL Server INDAIA10. Rotacione esta credencial ANTES de qualquer desenvolvimento.
> Arquivos afetados: followup_principal.aspx, mbf_apresentacao.aspx, mbf_desvios.aspx e ~12 outros.
> Passos: criar conta SQL mínima → atualizar inc_utils.asp → bloquear acesso externo ao INDAIA10.


> **⚡ O que muda na v2.0 deste documento**
> - DI Legada eliminada: referências ao PGDI e di-service removidas — escopo de importação é 100% DUIMP
> - Agente 09 (Booking Marítimo) e Agente 10 (Allocation/MQC) adicionados com guia de implementação
> - Estrutura de pastas atualizada: pasta booking/ e allocation/ adicionadas em agents/
> - Endpoints API atualizados: /api/v1/booking/* e /api/v1/allocation/* documentados
> - Tabela de regras de negócio: sp_di_calculo marcada como READ-ONLY histórico (não reimplementar)
> - Checklist atualizado: itens de INTTRA API e MQC adicionados
> - Testes: casos de teste para Agentes 09 e 10 adicionados


# 1. Visão Geral do Projeto


Você está construindo a camada de orquestração AI-First sobre uma plataforma de comércio exterior que já opera há 26 anos. Não é uma reescrita do zero — é uma integração inteligente sobre sistemas que já existem e funcionam.

> **Princípio Central**
> O minibroker já tem DU-E, Draft B/L e Wallet implementados em Delphi moderno.
> O sistema novo NÃO reimplementa esses módulos — os agentes chamam as APIs existentes via REST.
> O minibrowser.pas faz booking no INTTRA via RPA (Chromium). O Agente 09 substitui esse RPA por INTTRA API REST.
> Sua tarefa é conectar, orquestrar e tornar inteligente.


## 1.1 O que já existe e funciona


| **Sistema** | **O que já faz** | **Como usar no novo sistema** |
| --- | --- | --- |
| minibroker | DU-E (ClassesXMLDUE gerado do XSD RFB), Draft B/L com envio FTP INTTRA, Wallet financeiro (16 módulos), auditoria de alterações | Expor via REST API — agentes chamam endpoints do minibroker para ler/gravar dados |
| mywebapi | REST+JWT: Login, ProcessosImpo, ProcessosExpo, ProcessosPorStatus, Notificacao, SetDevice. XData + Aurelius. | Base da API pública. Adicionar novos endpoints para os agentes AI. |
| tmserviceapi | Recebe dados de transportadoras pós-desembaraço: ChegadaSaida, PresencaCarga, EfetivaLiberacaoDoc, ProgramacaoEntrega, EfetivaEntrega | Consumir no Agente 06 (Rastreamento) para tracking de last-mile |
| apiproxyportalunico | Proxy mTLS para Portal Único RFB — gerencia token CSRF e renovação automática por despachante | Portar lógica para Python (httpx + ssl). Ver seção 4.2. |
| minibrowser.pas | Booking INTTRA via RPA Chromium — FRÁGIL (mudança de layout quebra) | Expor via REST wrapper no minibroker como fallback. Migrar para INTTRA API REST (Agente 09 — Fase 4). |
| webapp (PWA) | Portal cliente com Firebase push, offline-first, 5 telas. Consome mywebapi. | Manter e expandir — adicionar chat com processo e notificações AI |
| MYINDAIAV2 | Banco moderno: Account, Bank, Billing, PaymentRequested, CashRequested, CustomClearance, Customer... 38 entidades em MyEntitiesV2.pas | Fonte de verdade para dados financeiros. PostgreSQL novo vai espelhar/migrar este banco. |


# 2. Setup Inicial — Ambiente de Desenvolvimento


## 2.1 Ação Imediata de Segurança


> **🔴 CRÍTICO — Fazer HOJE**
> Antes de qualquer código novo, rotacione a senha SA.
> Encontramos 'sa;Password=123' em: followup_principal.aspx, mbf_apresentacao.aspx e pelo menos 12 outros arquivos.


> -- Criar conta SQL com privilégios mínimos:
> CREATE LOGIN myindaia_api WITH PASSWORD = '<senha_forte>';
> GRANT SELECT, INSERT, UPDATE, EXECUTE ON SCHEMA::dbo TO myindaia_api;
> -- Criar conta read-only para Python:
> CREATE LOGIN broker_pyodbc_ro WITH PASSWORD = '<senha_forte>';
> GRANT SELECT ON SCHEMA::dbo TO broker_pyodbc_ro;  -- somente leitura


## 2.2 Requisitos do Ambiente


| **Componente** | **Versão** | **Notas** |
| --- | --- | --- |
| Python | 3.12+ | Para os agentes AI e API FastAPI |
| Node.js | 18+ | Para ferramentas de build do frontend React |
| PostgreSQL | 16 | Com extensão pgvector habilitada — ver seção 5 |
| Redis | 7+ | Cache e fila de tarefas dos agentes |
| Docker / Docker Compose | Atual | Para ambiente local de desenvolvimento |
| Delphi | Berlin 10.1 ou Sydney 11 | Para manter/compilar minibroker e mywebapi |
| SQL Server | Acesso ao SQLHOMOLOG | NÃO desenvolver diretamente em INDAIA10 (produção) |


## 2.3 Variáveis de Ambiente


```
# .env — NUNCA commitar para o repositório
DATABASE_URL=postgresql://indaia_ai:SENHA@localhost:5432/indaia_comex
REDIS_URL=redis://localhost:6379/0
ANTHROPIC_API_KEY=sk-ant-...
JWT_SECRET=2d013705c915  # mesmo secret do mywebapi/tmserviceapi
SQLSERVER_HOST=SQLHOMOLOG
SQLSERVER_DB=BROKER
SQLSERVER_USER=broker_pyodbc_ro
SQLSERVER_PASS=<senha_rotacionada>
PORTAL_UNICO_URL=https://portalunico.siscomex.gov.br
INTTRA_EDI_HOST=<host_producao>
INTTRA_FTP_HOST=<host_ftp>
INTTRA_FTP_USER=<usuario>
INTTRA_FTP_PASS=<senha>
MAERSK_API_KEY=<chave_maersk>
CMA_API_KEY=<chave_cma>
HAPAG_API_KEY=<chave_hapag>
FIREBASE_SERVER_KEY=<chave_fcm>
CERT_PATH=/certs  # Pasta com Fabricio.pem, Edgar.pem, Vanessa.pem, etc.
LANGFUSE_PUBLIC_KEY=<chave_publica>
LANGFUSE_SECRET_KEY=<chave_secreta>
```


# 3. Arquitetura do Novo Sistema


## 3.1 Estrutura de Pastas Recomendada


> indaia-ai/
> ├── agents/
> │   ├── orchestrator.py      # Agente 01 — Orquestrador (LangGraph StateGraph)
> │   ├── ingestion.py         # Agente 02 — Ingestão Documental
> │   ├── verification.py      # Agente 03 — Verificação Acuracidade (Importação)
> │   ├── ncm_classifier.py    # Agente 04 — Classificação NCM
> │   ├── compliance.py        # Agente 05 — Compliance/Órgãos Anuentes (Importação)
> │   ├── logistics.py         # Agente 06 — Rastreamento Logístico
> │   ├── documents.py         # Agente 07 — Emissão Documental
> │   ├── communication.py     # Agente 08 — Comunicação
> │   ├── booking.py           # Agente 09 — Booking Marítimo (NOVO)
> │   └── allocation.py        # Agente 10 — Gestão de Allocation/MQC (NOVO)
> ├── api/
> │   ├── routers/
> │   │   ├── auth.py          # OAuth2 + JWT + A3
> │   │   ├── processes.py     # CRUD de processos IMP/EXP
> │   │   ├── booking.py       # Endpoints Agente 09
> │   │   ├── allocation.py    # Endpoints Agente 10
> │   │   └── webhooks.py      # Portal Único, INTTRA, EDI
> │   └── main.py
> ├── integrations/
> │   ├── portal_unico.py      # mTLS (portar apiproxyportalunico)
> │   ├── inttra_api.py        # INTTRA EDI + APIs diretas armadores (NOVO)
> │   ├── inttra_ftp.py        # FTP INTTRA (Draft B/L)
> │   ├── senior_erp.py        # SOAP Senior (faturamento)
> │   ├── mercante.py          # CE-Mercante (portar consultamercante)
> │   └── mywebapi_client.py   # Cliente REST do mywebapi existente
> ├── db/
> │   ├── models.py            # SQLAlchemy + pgvector
> │   ├── migrations/          # Alembic
> │   └── legacy_broker.py     # Queries somente-leitura no BROKER legado
> ├── frontend/                # React 18 + TypeScript
> │   ├── components/
> │   │   ├── BookingPanel/    # Integração Agente 09 (NOVO)
> │   │   └── AllocationDash/  # Dashboard MQC Agente 10 (NOVO)
> ├── tests/
> └── docker-compose.yml


## 3.2 Grafo de Agentes — LangGraph (Exportação)


```python
# agents/orchestrator.py — Grafo de exportação
from langgraph.graph import StateGraph, END
from typing import TypedDict, List, Optional
class ExportState(TypedDict):
    nr_processo: str
    tipo: str  # 'EXP'
    documentos: List[dict]
    booking_id: Optional[str]
    allocation_ok: bool
    requires_human: bool
    events: List[str]
def build_export_graph():
    graph = StateGraph(ExportState)
    graph.add_node('ingest', ingest_documents)       # Agente 02
    graph.add_node('verify', verify_accuracy)        # Agente 03
    graph.add_node('classify_ncm', classify_ncm)    # Agente 04
    graph.add_node('allocation', check_allocation)   # Agente 10
    graph.add_node('booking', submit_booking)        # Agente 09
    graph.add_node('documents', emit_documents)      # Agente 07
    graph.add_node('notify', send_notifications)     # Agente 08
    graph.add_node('human_review', human_review_node)
    graph.set_entry_point('ingest')
    graph.add_conditional_edges('ingest', route_after_ingest, {
        'verify': 'verify', 'human_review': 'human_review'
    })
    graph.add_edge('verify', 'classify_ncm')
    graph.add_edge('classify_ncm', 'allocation')    # verifica saldo MQC
    graph.add_edge('allocation', 'booking')          # submete booking
    graph.add_edge('booking', 'documents')           # gera documentos
    graph.add_edge('documents', 'notify')
    graph.add_edge('notify', END)
    return graph.compile(checkpointer=redis_checkpointer)
```


# 4. Integrações Críticas — Guia de Implementação


## 4.1 Banco de Dados Legado — Conexão Read-Only


O banco BROKER no INDAIA10 é a fonte de verdade do legado. Você vai LER dados dele para contexto dos agentes, mas NUNCA escrever diretamente. Toda escrita continua indo pelo sistema Delphi ou pelo mywebapi.

```python
# db/legacy_broker.py
import pyodbc
import os
def get_broker_connection():
    conn_str = (
        f"DRIVER={{ODBC Driver 18 for SQL Server}};"
        f"SERVER={os.getenv('SQLSERVER_HOST')};"
        f"DATABASE=BROKER;"
        f"UID={os.getenv('SQLSERVER_USER')};"
        f"PWD={os.getenv('SQLSERVER_PASS')};"
        "TrustServerCertificate=yes"
    )
    return pyodbc.connect(conn_str)
def get_process_context(nr_processo: str) -> dict:
    conn = get_broker_connection()
    cursor = conn.cursor()
    cursor.execute("""
        SELECT TOP 1 P.NR_PROCESSO, P.CD_CLIENTE, P.CD_SERVICO,
               P.NR_CONHECIMENTO, P.NM_EMBARCACAO, P.DT_ABERTURA,
               P.VL_CIF_DOLAR, P.CD_PAIS_ORIGEM, C.NM_CLIENTE
        FROM TPROCESSO P (NOLOCK)
        LEFT JOIN TCLIENTE C (NOLOCK) ON C.CD_CLIENTE = P.CD_CLIENTE
        WHERE P.NR_PROCESSO = ?
    """, nr_processo)
    row = cursor.fetchone()
    if not row: return {}
    return dict(zip([c[0] for c in cursor.description], row))
def get_tbid_contracts(pol: str, pod: str) -> list:
    """Contratos MQC por rota — para o Agente 10 (Allocation)"""
    conn = get_broker_connection()
    cursor = conn.cursor()
    cursor.execute("""
        SELECT CD_ARMADOR, NR_CONTRATO, VL_TEUS, DT_INICIO, DT_FIM
        FROM TBID (NOLOCK)
        WHERE CD_POL = ? AND CD_POD = ? AND DT_FIM >= GETDATE()
    """, pol, pod)
    return [dict(zip([c[0] for c in cursor.description], r)) for r in cursor.fetchall()]
```


## 4.2 Portal Único — mTLS em Python


```python
# integrations/portal_unico.py
import httpx, ssl, os
from pathlib import Path
class PortalUnicoClient:
    BASE_URL = 'https://portalunico.siscomex.gov.br'
    CERTIFICADOS = {'003': 'Luiz', '031': 'Edgar', '042': 'Vanessa',
                    '027': 'Mello', '028': 'Cristiano', '001': 'Fabricio'}
    def __init__(self, cd_despachante: str):
        nome = self.CERTIFICADOS.get(cd_despachante, 'Fabricio')
        cert_path = Path(os.getenv('CERT_PATH', '/certs'))
        self.ssl_ctx = ssl.create_default_context()
        self.ssl_ctx.load_cert_chain(
            certfile=str(cert_path / f'{nome}.pem'),
            keyfile=str(cert_path / f'{nome}.key')
        )
        self.token = None
        self.csrf = None
    async def transmit_duimp(self, xml_content: str) -> dict:
        url = f'{self.BASE_URL}/duimp/ext/api/duimp'
        await self._connect(url)
        async with httpx.AsyncClient(verify=self.ssl_ctx) as client:
            resp = await client.post(url, content=xml_content, headers={
                'Content-Type': 'application/xml',
                'Set-Token': self.token or '',
                'X-CSRF-Token': self.csrf or '',
            })
            return {'status': resp.status_code, 'body': resp.text}
    async def transmit_due(self, xml_content: str) -> dict:
        url = f'{self.BASE_URL}/due/ext/api/due'
        await self._connect(url)
        async with httpx.AsyncClient(verify=self.ssl_ctx) as client:
            resp = await client.post(url, content=xml_content, headers={
                'Content-Type': 'application/xml',
                'Set-Token': self.token or '',
            })
            return {'status': resp.status_code, 'body': resp.text}
```


## 4.3 INTTRA API REST — Agente 09 (Booking)


```python
# integrations/inttra_api.py
import httpx, os
DIRECT_API_CARRIERS = {
    'MAERSK': {'url': 'https://api.maersk.com/bookings', 'key_env': 'MAERSK_API_KEY'},
    'CMA':    {'url': 'https://apis.cma-cgm.com/bookings', 'key_env': 'CMA_API_KEY'},
    'HAPAG':  {'url': 'https://api.hapag-lloyd.com/bookings', 'key_env': 'HAPAG_API_KEY'},
}
async def submit_booking(process_data: dict) -> dict:
    """Agente 09: submete booking via INTTRA EDI ou API direta do armador"""
    carrier = process_data['cd_armador']
    if carrier in DIRECT_API_CARRIERS:
        return await _submit_direct_api(carrier, process_data)
    else:  # MSC, Evergreen, Yang Ming → INTTRA EDI
        return await _submit_inttra_edi(process_data)
async def _submit_direct_api(carrier: str, data: dict) -> dict:
    cfg = DIRECT_API_CARRIERS[carrier]
    payload = {
        'shipper': data['nm_exportador'],
        'consignee': data['nm_importador'],
        'pol': data['pol'],
        'pod': data['pod'],
        'commodity': data['ds_mercadoria'],
        'containers': data['containers'],  # [{type:'40HC', qty:1}]
        'etd': data['dt_embarque'],
    }
    async with httpx.AsyncClient() as client:
        resp = await client.post(cfg['url'], json=payload,
            headers={'Authorization': f"Bearer {os.getenv(cfg['key_env'])}"
        })
    return resp.json()
async def poll_booking_confirmation(booking_ref: str, max_polls=48) -> dict:
    """Polling a cada 30min (máx 24h) via myconsultaretornointtra"""
    import asyncio
    for _ in range(max_polls):
        result = await _check_inttra_return(booking_ref)
        if result['status'] in ('CONFIRMED', 'REJECTED', 'AMENDED'):
            return result
        await asyncio.sleep(1800)  # 30 minutos
    return {'status': 'TIMEOUT', 'booking_ref': booking_ref}
```


## 4.4 Agente 10 — Allocation/MQC


```python
# agents/allocation.py
from db.legacy_broker import get_tbid_contracts
from sqlalchemy.orm import Session
async def check_allocation(state: dict, db: Session) -> dict:
    """Agente 10: verifica saldo MQC disponível para o booking solicitado"""
    pol = state.get('pol')
    pod = state.get('pod')
    cd_armador = state.get('cd_armador_preferencial')
    # Buscar contrato ativo
    contract = db.query(MqContract).filter(
        MqContract.cd_armador == cd_armador,
        MqContract.pol == pol,
        MqContract.pod == pod,
        MqContract.dt_fim >= date.today()
    ).first()
    if not contract:
        state['allocation_ok'] = True  # sem contrato MQC = sem restrição
        return state
    saldo_disponivel = contract.vl_teus_comprometidos - contract.vl_teus_realizados
    qt_teus_solicitados = state.get('qt_teus', 1)
    if saldo_disponivel < qt_teus_solicitados:
        state['allocation_ok'] = False
        state['requires_human'] = True
        state['human_review_reason'] = f'Saldo MQC insuficiente: {saldo_disponivel:.1f} TEUs disponíveis'
    else:
        state['allocation_ok'] = True
        state['mq_contract_id'] = str(contract.id)
    # Calcular nível de alerta
    pct = (contract.vl_teus_realizados / contract.vl_teus_comprometidos) * 100
    if pct >= 95: contract.cd_nivel_alerta = 'CRITICO'
    elif pct >= 80: contract.cd_nivel_alerta = 'ALERTA'
    elif pct < 50: contract.cd_nivel_alerta = 'ATENCAO'
    else: contract.cd_nivel_alerta = 'NORMAL'
    db.commit()
    return state
```


## 4.5 Agente NCM — Classificação com Claude


```python
# agents/ncm_classifier.py
import anthropic, json
from db.legacy_broker import get_ncm_history
client = anthropic.Anthropic()
def classify_ncm(state: dict) -> dict:
    cd_cliente = state.get('cd_cliente')
    descricao = state.get('ds_mercadoria', '')
    historico = get_ncm_history(cd_cliente, limit=20)
    few_shot = '\n'.join([f"- '{i['DS_MERCADORIA']}' -> NCM {i['CD_NCM']}" for i in historico[:5]])
    prompt = f"""Você é especialista em classificação aduaneira brasileira (NCM/TIPI).
HISTÓRICO DE CLASSIFICAÇÕES ANTERIORES DESTE CLIENTE:
{few_shot}
MERCADORIA A CLASSIFICAR: {descricao}
País de origem: {state.get('cd_pais_origem', 'não informado')}
Retorne JSON com: {{"ncm": "12345678", "descricao_ncm": "...", "justificativa": "...",
"confidence": 0.92, "alternativas": [], "tem_li": true, "orgaos_anuentes": ["ANVISA"]}}"""
    message = client.messages.create(
        model='claude-sonnet-4-20250514', max_tokens=1000,
        messages=[{'role': 'user', 'content': prompt}]
    )
    result = json.loads(message.content[0].text)
    state['ncm_sugerido'] = result['ncm']
    state['ncm_confidence'] = result['confidence']
    if result['confidence'] < 0.85:
        state['requires_human'] = True
        state['human_review_reason'] = f"NCM com confiança {result['confidence']:.0%}"
    return state
```


## 4.6 Formato NR_PROCESSO — Manter Compatibilidade Total


```python
# utils/process_number.py
import re
def parse_nr_processo(nr: str) -> dict:
    # Formato: UUPPSS-NNNNNN-AA
    # UU = Unidade de negócio | PP = Produto (01=imp, 02=exp) | SS = Serviço
    # NNNNNN = Sequencial 6 dígitos | AA = Ano 2 dígitos
    # Exemplos:
    # 0101IM-000123-24 = Santos/Importação, processo 123, 2024
    # 0202ER-000456-24 = Santos/Exportação/ER, processo 456, 2024
    # 0301FE-000789-24 = RJ/Frete/FE, processo 789, 2024
    pattern = r'^(\w{2})(\d{2})(\w{2})-(\d{6})-(\d{2})$'
    m = re.match(pattern, nr)
    if not m: raise ValueError(f'NR_PROCESSO inválido: {nr}')
    return {
        'cd_unid_neg': m.group(1), 'cd_produto': m.group(2),
        'cd_servico': m.group(3), 'nr_seq': m.group(4), 'ano': m.group(5),
        'tipo': {'01':'importacao','02':'exportacao','06':'frete'}.get(m.group(2))
    }
```


# 5. Banco de Dados PostgreSQL — Schema Inicial


## 5.1 Instalação do pgvector


> -- Habilitar extensões
> CREATE EXTENSION IF NOT EXISTS vector;
> CREATE EXTENSION IF NOT EXISTS 'uuid-ossp';
> CREATE SCHEMA IF NOT EXISTS comex;
> SET search_path TO comex, public;


## 5.2 Tabelas Core + DUIMP + Booking + Allocation


```sql
-- 1. process (núcleo)
CREATE TABLE process (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nr_processo VARCHAR(20) UNIQUE NOT NULL,
    cd_unid_neg CHAR(2) NOT NULL,
    cd_produto CHAR(2) NOT NULL,  -- 01=imp, 02=exp
    cd_servico CHAR(2) NOT NULL,
    cd_cliente INTEGER,
    cd_status VARCHAR(20) DEFAULT 'aberto',
    nr_duimp VARCHAR(20),  -- DUIMP registrada (v2.0)
    nr_due VARCHAR(20),
    ai_confidence_score NUMERIC(5,2) DEFAULT 0,
    ai_last_agent VARCHAR(50),
    ai_requires_review BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
-- 2. duimp_declaration (NOVO v2.0 — importação)
CREATE TABLE duimp_declaration (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    process_id UUID REFERENCES process(id),
    nr_duimp VARCHAR(20),
    cd_status VARCHAR(20),  -- 10=Registrada, 20=Parametrizada, 50=Desembaraçada
    cd_canal VARCHAR(10),
    fl_aprovacao_humana BOOLEAN DEFAULT false,
    xml_payload TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
-- 3. mq_contract (NOVO v2.0 — Agente 10)
CREATE TABLE mq_contract (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cd_armador VARCHAR(10) NOT NULL,
    pol VARCHAR(5) NOT NULL,
    pod VARCHAR(5) NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE NOT NULL,
    vl_teus_comprometidos NUMERIC(10,2) NOT NULL,
    vl_teus_realizados NUMERIC(10,2) DEFAULT 0,
    pct_compliance NUMERIC(5,2) DEFAULT 0,
    cd_nivel_alerta VARCHAR(20) DEFAULT 'NORMAL'
);
-- 4. booking (NOVO v2.0 — Agente 09)
CREATE TABLE booking (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    process_id UUID REFERENCES process(id),
    mq_contract_id UUID REFERENCES mq_contract(id),
    cd_armador VARCHAR(10),
    nr_booking_inttra VARCHAR(50),
    nr_booking_armador VARCHAR(50),
    pol VARCHAR(5), pod VARCHAR(5),
    dt_cy_opening TIMESTAMPTZ,
    dt_vgm_cutoff TIMESTAMPTZ,
    dt_si_cutoff TIMESTAMPTZ,
    dt_etd TIMESTAMPTZ, dt_eta TIMESTAMPTZ,
    cd_status VARCHAR(20),
    fl_confirmado BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
-- 5. document (embeddings)
CREATE TABLE document (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    process_id UUID REFERENCES process(id),
    tipo VARCHAR(50) NOT NULL,
    embedding vector(1536),
    extracted_fields JSONB,
    confidence_score NUMERIC(5,2),
    storage_path VARCHAR(500),
    created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX idx_doc_embed ON document USING hnsw (embedding vector_cosine_ops);
```


## 5.3 Migração do MYINDAIAV2 — Tabelas Financeiras


| **Tabela MYINDAIAV2** | **Tabela PostgreSQL** | **Campos Chave** |
| --- | --- | --- |
| Billing | billing | akey (chave Senior), type, status, due_date, total, ir, cofins, senior_key |
| ItemInvoiced | item_invoiced | billing_id FK, price, name, senior_key, type |
| PaymentRequested | payment_requested | billing_id FK, senior_key, senior_subkey, valor, tipo, destino |
| CashRequested | cash_requested | billing_id FK, tipo, status, valor, cidade, data_solicitacao |
| CustomClearance | custom_clearance | nr_processo, cd_servico, status, valor_total, senior_ref |
| Customer / CustomerGroup | customer / customer_group | Sincronizar com TCLIENTE do BROKER via cd_cliente |
| Organization | organization | cd_unid_neg — compatibilidade TUNID_NEG |


# 6. API Gateway FastAPI — Endpoints


## 6.1 Novos Endpoints para Agentes 09 e 10


```python
# api/routers/booking.py
from fastapi import APIRouter, Depends
router = APIRouter(prefix='/api/v1/booking', tags=['booking'])
@router.post('/{nr_processo}/submit')
async def submit_booking_endpoint(nr_processo: str, payload: BookingRequest):
    """Aciona Agente 09 — submete booking via INTTRA ou API direta"""
    pass
@router.get('/{nr_processo}/status')
async def get_booking_status(nr_processo: str):
    """Status do booking (provisório/confirmado/recusado/alterado)"""
    pass
@router.post('/webhook/inttra')
async def inttra_booking_webhook(payload: dict):
    """Recebe confirmações INTTRA (polling + webhook)"""
    pass
# api/routers/allocation.py
router_alloc = APIRouter(prefix='/api/v1/allocation', tags=['allocation'])
@router_alloc.get('/dashboard')
async def get_allocation_dashboard():
    """Dashboard MQC — todos os contratos + compliance + alertas"""
    pass
@router_alloc.get('/contracts/{cd_armador}/saldo')
async def get_saldo_allocation(cd_armador: str, pol: str, pod: str):
    """Saldo disponível por armador/rota — chamado pelo Agente 09"""
    pass
@router_alloc.post('/contracts')
async def create_mq_contract(payload: MqContractCreate):
    """Cadastrar novo contrato MQC"""
    pass
```


## 6.2 Autenticação JWT (Mesmo Secret do Sistema Atual)


```python
# api/auth.py
import jwt, os
from datetime import datetime, timedelta
# IMPORTANTE: usar o mesmo JWT_SECRET do mywebapi e tmserviceapi
# Garante que tokens Delphi são aceitos pelo Python e vice-versa
JWT_SECRET = os.getenv('JWT_SECRET', '2d013705c915')
JWT_ALGORITHM = 'HS256'
def create_token(user_id: int, username: str, cnpj: str, tipo: str) -> str:
    payload = {
        'id': user_id, 'username': username, 'cnpj': cnpj,
        'tipo': tipo,  # 'interno' ou código de cargo
        'exp': datetime.utcnow() + timedelta(hours=24)
    }
    return jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGORITHM)
```


# 7. Regras de Negócio Críticas — Não Reimplementar


## 7.1 Stored Procedures — Escopo v2.0 (DUIMP-Only)


| **Stored** **Procedure** | **Função** | **Como usar no novo sistema (v2.0)** |
| --- | --- | --- |
| sp_di_calculo | Cálculo completo da DI (todos os impostos) | READ-ONLY para histórico. NÃO reimplementar. DUIMP usa Portal Único para calcular. |
| sp_calc_ii / ipi / icms / pis / cofins | Cálculos individuais de impostos | READ-ONLY para histórico de DIs antigas. NÃO reimplementar. |
| SP_PRE_CALCULO | Pré-cálculo antes de registrar a DI | READ-ONLY para histórico. Novos processos: DUIMP calcula. |
| sp_li_calculo / sp_monta_li | Cálculo e montagem da LI | Usar no Agente 05 (Compliance) para LIs de processos em andamento. |
| sp_exp_calcula | Cálculo de exportação | Usar no Agente 07 (Emissão Documental) se necessário. |
| sp_fat_calculo / sp_fat_exp | Cálculo de faturamento | Usar no módulo financeiro (billing-service Fase 7). |
| SP_CRIA_FOLLOWUP | Cria evento de followup | Chamar via pyodbc para manter compatibilidade com ddbroker. |


## 7.2 Códigos de Evento TFOLLOWUP_ETAPA — Críticos para o Agente 06


| **Código** | **Evento** | **Ação do Agente** |
| --- | --- | --- |
| 021 | Chegada do navio no porto | Atualizar DT_CHEGADA, notificar cliente |
| 082 | Presença de carga confirmada | Iniciar contagem de free time, alertar para DUIMP |
| 131 | BL liberado pelo armador | Acionar Draft B/L review, notificar cliente |
| 161 | Desembaraço solicitado | Acionar Agente Compliance + Agente Registro DUIMP |
| 164 | Registro da DUIMP | Confirmar número DUIMP, iniciar monitoramento canal |
| 168 | Canal parametrizado | Alertar verde/amarelo/vermelho — vermelho = prioridade máxima |
| 215 | DUIMP desembaraçada | Liberar para faturamento, notificar cliente |
| 219 | Saída do recinto | Acionar Agente 06 para rastreamento TM |
| 333 | Nota fiscal emitida | Confirmar NFS-e, atualizar billing |
| 350 | Entrega realizada | Encerrar processo, gerar KPIs, notificar cliente |
| 421 | SDA transmitida | Confirmar pagamento ao sindicato (Santos ou RJ) |
| 506 | Averbação DU-E | Confirmar exportação concluída, liberar faturamento |


# 8. Frontend React — Portal do Cliente


## 8.1 Manter Compatibilidade com webapp Atual


O webapp PWA existente consome o mywebapi. Para a transição zero downtime, o novo backend deve expor os mesmos endpoints com os mesmos campos de resposta.

```
// Contrato atual do webapp (NÃO QUEBRAR):
// POST /indaia/api/Service/ProcessosEmAndamento
// Response: { value: [ {
//   NumeroProcesso, RefEmbarque, NomeCliente, Mercadoria,
//   DataCarregamentoFabrica, DataCarregamentoFabricaPrevisao,
//   DataDesembaraco, DataDesembaracoPrevisao,
//   DataSaida, DataSaidaPrevisao,
//   DataEnvioDocumentos, DataEnvioDocumentosPrevisao,
//   DataChegadaDestino, DataChegadaDestinoPrevisao
// } ] }
//
// Filtros aceitos pelo webapp:
// Pedido, Numero, Container, DiDUImp, Mercadoria, Exportador, BL, Cliente, StatusAtual
```


## 8.2 Novos Componentes React — Agentes 09 e 10


| **Componente** | **Descrição** | **Prioridade** | **Fase** |
| --- | --- | --- | --- |
| BookingPanel | Integração Agente 09 — booking inline na tela de PE. Mostra status INTTRA em tempo real, deadlines (VGM/SI/CY), alertas de recusa. | Alta | F6 |
| AllocationDashboard | Visualização MQC por armador/rota — % compliance, saldo disponível, alertas ATENÇÃO/ALERTA/CRÍTICO/SOBRE-USO com cores. | Alta | F6 |
| ProcessTimeline | Timeline visual do processo com todos os eventos — substitui MBF legado. | Alta | F3 |
| DocumentUploader | Upload com preview do que o Agente 02 extraiu — confirmação em 1 click. | Alta | F3 |
| NCMSuggestion | Mostra NCM sugerido + alternativas + justificativa — humano confirma. | Alta | F2 |
| DUIMPPanel | Fluxo de revisão DUIMP + aprovação com A3 integrado. | Alta | F4/F5 |
| AgentStatus | Painel interno mostrando quais agentes estão rodando e seu status. | Média | F2 |
| KPIDashboard | Substitui MBF legado — lead times, custo por NCM, taxa canal verde, compliance MQC. | Baixa (V2) | F8 |


# 9. Testes e Validação


## 9.1 Dados de Teste


> **Regra de Ouro**
> NUNCA testar em INDAIA10 (produção). Usar SQLHOMOLOG para todos os testes.
> Criar processos de teste com prefixo '99' no cd_unid_neg para facilitar limpeza.
> Para INTTRA: usar ambiente de homologação da INTTRA antes de qualquer chamada à produção.
> Para Portal Único (DUIMP/DU-E): usar ambiente de homologação do Siscomex.


## 9.2 Testes por Agente — incluindo 09 e 10


| **Agente** | **Caso de Teste Principal** | **Critério de Aceitação** |
| --- | --- | --- |
| 02 Ingestão | Invoice PDF com valores FOB + seguro + frete para calcular CIF | Todos os campos extraídos com confidence > 85% |
| 03 Verificação | Invoice com valor diferente do PO em 5% | Divergência detectada e classificada como 'atenção' |
| 04 NCM | Produto já classificado anteriormente pelo cliente | NCM correto com confidence > 90% (histórico do cliente) |
| 05 Compliance | NCM que requer LI ANVISA (alimentos, medicamentos) | LI identificada + órgão correto + instruções parametrização |
| 06 Rastreamento | Container com ETA atrasado 3 dias | Alerta enviado para equipe e cliente automaticamente |
| 07 Documental | Gerar Draft B/L para processo de exportação completo | PDF gerado + enviado ao armador via FTP INTTRA |
| 08 Comunicação | Qualquer evento crítico no processo | Notificação enviada em < 5 minutos por canal correto |
| 09 Booking | Booking para rota BRSSZ→CNSHA com 2x40HC via MSC | Booking confirmado com número INTTRA + deadlines registrados |
| 10 Allocation | Booking que leva MQC acima de 80% do comprometido | Alerta ALERTA disparado + dashboard atualizado em tempo real |


## 9.3 Testes de Integração com Legado


Verificar que eventos de followup criados pelo Python aparecem corretamente no ddbroker

Confirmar que tokens JWT do mywebapi Delphi são aceitos pelo FastAPI Python

Validar que todos os NR_PROCESSO seguem o formato UUPPSS-NNNNNN-AA

Confirmar que booking criado pelo Agente 09 atualiza TPROCESSO_EXP via minibroker REST

Confirmar que saldo MQC no Agente 10 é consistente com TBID lido via pyodbc

# 10. Checklist do Desenvolvedor


> **Semana 1 — Obrigatório**
> ☐  Rotacionar senha SA do INDAIA10 (CRÍTICO — não adiar)
> ☐  Setup ambiente: Python 3.12, Docker, PostgreSQL local com pgvector
> ☐  Conectar ao SQLHOMOLOG via pyodbc (conta broker_pyodbc_ro)
> ☐  Verificar acesso ao minibroker via REST local
> ☐  Clonar repositórios: minibroker, mywebapi, mypatterns (Bitbucket grupo myindaia)
> ☐  Configurar .env com todas as variáveis (ver seção 2.3)


> **Mês 1 — Fundação**
> ☐  PostgreSQL + pgvector na AWS + schema base criado
> ☐  auth-service funcional com JWT compatível com mywebapi
> ☐  API Gateway FastAPI roteando para Delphi mywebapi existente
> ☐  Primeiro agente: Ingestão Documental (Claude Vision) — prova de conceito
> ☐  Langfuse configurado para rastrear chamadas LLM
> ☐  CI/CD: push → test → deploy em staging


> **Meses 2–3 — Agentes Core**
> ☐  Orquestrador LangGraph (grafo importação + grafo exportação)
> ☐  Agente NCM com histórico de 26 anos como few-shot
> ☐  Agente 10 (Allocation/MQC) — tabelas mq_contract + booking criadas
> ☐  Agente 09 (Booking) — wrapper interim via minibroker REST enquanto INTTRA API não migra
> ☐  Dashboard allocation em React (AllocationDashboard)
> ☐  Conectar webapp ao novo backend (manter contrato /ProcessosEmAndamento)
> ☐  Integrar Portal Único mTLS em Python (portar apiproxyportalunico)


| **Item** | **Status** | **Responsável** |
| --- | --- | --- |
| Rotacionar senha SA (CRÍTICO) | Pendente | Fabricio + TI |
| Setup PostgreSQL + pgvector | Pendente | Dev |
| Criar conta SQL broker_pyodbc_ro | Pendente | TI |
| Portar mTLS apiproxyportalunico para Python | Pendente | Dev |
| Expor minibroker via REST endpoint local | Pendente | Dev Delphi |
| Obter credenciais INTTRA API REST | Pendente | Fabricio |
| Obter API keys Maersk / CMA-CGM / Hapag-Lloyd | Pendente | Fabricio |
| Cadastrar contratos MQC iniciais no mq_contract | Pendente | Operações |
| Configurar Langfuse para observabilidade | Pendente | Dev |
| Definir certificados A3 para ambiente de teste | Pendente | Fabricio |
| Migrar contrato de API webapp | Pendente | Dev |
| Primeiro agente: Ingestão Documental | Pendente | Dev |


> **Documento gerado automaticamente —** **DocTécnico** **Desenvolvedor COMEX AI v2.0 | INDAIA**
> Substitui DocTecnico_Desenvolvedor_COMEX_AI.docx.
> v2.0: DI Legada removida, Agentes 09+10 documentados, endpoints booking/allocation adicionados.
