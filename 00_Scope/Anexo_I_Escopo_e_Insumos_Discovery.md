# Anexo I — Escopo e Insumos

**Discovery MyINDAIA — Fases 1 e 2**

> **DRAFT v1 — 2026-07-17.** Este Anexo integra o *Contrato de Prestação de Serviços de Apoio Técnico à Decisão* e detalha o **escopo dos serviços** e os **insumos** a serem fornecidos pela Contratante. É uma versão enxuta da Proposta Discovery MyINDAIA (v5), limitada ao que o Contrato delega ao Anexo. Em caso de divergência quanto a **prazos, preços e condições comerciais**, prevalece o corpo do Contrato (cl. 1.4); referências a fases ou valores futuros têm caráter meramente indicativo.

---

## 1. Fase 1 — Discovery

Duração estimada de 2 (duas) semanas. Objetivo: definir **o que construir, como, por quanto e em quanto tempo**, concentrado no núcleo de maior risco e maior valor da modernização da plataforma MyINDAIA.

### 1.1 Entregáveis

**a) Plano técnico (arquitetura, stack, infraestrutura, riscos)**, conciliando num plano único:

- a [visão de produto do CEO para o MyINDAIA](../01_Inputs_and_Resources/My%20Indaia%202.0%20CEO%20Vision/README.md) (roadmap vigente e documentação do produto);
- o [trabalho da vertical de exportação](../01_Inputs_and_Resources/MyIndaia%202.0%20Export/README%20-%20NOVO%20SISTEMA.md) já em andamento pela equipe interna (`MyIndaia 2.0 Export`);
- a [versão inicial (v0) do plano de migração](../01_Inputs_and_Resources/My%20Indaia%202.0%20Export%20+%20Import%20v0%20plan/Migration_plan_index.md) elaborada pela Contratada.

Com **recomendações — racional e trade-offs** — para as principais pendências que derivam desses planos:

- **Extração documental / OCR** — serviço pronto (API) vs. solução própria (validação empírica de um provedor nesta fase; ver 1.3);
- **Motor cognitivo dos agentes** — alternativas de orquestração e roadmap de construção ao longo do tempo;
- **Infraestrutura de banco de dados** — comparação das opções;
- **Modelo de controle de acesso (RBAC)**;
- **Hospedagem de integração/scraping e certificado digital** (A1 vs. A3).

**b) Riscos, segurança e transição**:

- **Registro de riscos inicial** — principais riscos (técnicos, de calendário, de equipe), cada um com responsável e mitigação;
- **Plano de correção de segurança / LGPD do legado** — mais do que apontar as vulnerabilidades identificadas no ambiente pré-existente, entregar **a ação recomendada** para cada exposição, com prioridade e sequência de execução no início da construção;
- **Design de validação em *shadow-mode* do cutover (Export)** — método para virar o sistema novo com risco controlado: operação paralela ao legado sobre transações reais, critérios de aceite e decisão de go/no-go. Foco no Export (primeiro a virar); os mesmos princípios se aplicam ao Import na sequência.

**c) Modelo de OpEx de TI** — estimativa do custo mensal recorrente para operar o sistema novo (OCR/LLM por volume, hospedagem, banco, certificados). *Não* inclui business case / ROI de negócio.

**d) Cronograma estimado de desenvolvimento** — plano firme das semanas 1–4 e esboço das 5–12, com estimativas em modelo híbrido (ver 1.4).

### 1.2 Abordagem

1. **Alinhamento com o CEO** (1–2 sessões) — prioridades, preocupações e apostas de diferenciação.
2. **Análise técnica** — repositório, build de exportação e decisões técnicas pendentes.
3. **Decisão guiada com o cliente** — cada decisão de primeira ordem apresentada com racional e trade-offs, para acordo conjunto.
4. **Consolidação** — convergência para um backlog único, priorizado e estimado.

### 1.3 Método das decisões técnicas

- **Extração documental / OCR** — única decisão testada **na prática** nesta fase. Escolhe-se, por análise de alto nível, **um** provedor de API externa e mede-se sua **acurácia** e **custo** sobre **um único tipo de documento** ou **um único cliente**. A escolha final do provedor e a decisão entre serviço pronto e solução própria ficam para depois, já embasadas por este resultado.
- **Demais decisões** — fundamentadas em análise técnica e de negócio e no build real, sem prototipação nesta fase; registradas no *decision log*.

### 1.4 Estimativas — modelo híbrido

Estimativa **firme** para o escopo determinístico e **faixa (mín.–máx.)** para o escopo de IA (OCR, agentes cognitivos), que **estreita a cada sprint** conforme a velocidade real do time aparece.

---

## 2. Fase 2 — Acompanhamento (60 dias)

Acompanhamento consultivo de **~4h/semana** — advisory (revisão, direção e arbitragem de decisão), **não produção**.

### 2.1 Cadências

- **Semanal** — revisão assíncrona do board, PRs/diffs e *decision log*; uma call com o time técnico (planejamento, arbitragem, captura de riscos); nota de status ao CEO.
- **Quinzenal** — call com o CEO.
- **Marcos mensais** — leitura de capacidade do time (~dia 30); re-baseline do cronograma (~dia 45); pacote de fechamento (dia 60).

### 2.2 Entregáveis dos 60 dias

- **Plano de execução de 12 semanas firmado**, refinado a cada sprint;
- **Decision log e registro de riscos** mantidos como fonte de verdade do time;
- **Leitura de capacidade do time** (~dia 30) e **re-baseline do cronograma** (~dia 45);
- **Pacote de fechamento (dia 60)** — plano firme consolidado, avaliação da capacidade da equipe e recomendação de continuidade.

---

## 3. Insumos a serem fornecidos pela Contratante

Os prazos da Fase 1 estão condicionados ao fornecimento tempestivo dos seguintes insumos (cl. 2.3 do Contrato):

- **Acesso ao repositório** do sistema de exportação (leitura), para validar o build real e o plano de migração;
- **Lote de documentos reais com *ground truth*** (ex.: invoices/packing lists de um cliente) para a prova de conceito de OCR — permite medir acurácia e custo (ver 1.3);
- **Validação do mapa de processos de alto nível** (export + import) — workflow offline, handoffs manuais, métricas de esforço, regras de exceção e principais gargalos (ordem de grandeza), via documentos existentes ou sessões curtas;
- **Sessões de trabalho** com a equipe técnica (walkthrough de código; validação do backlog/reuso) e com o CEO (alinhamento + checkpoints de decisão), além de Q&A assíncrono.

---

*Escopo expressamente fora do objeto: desenvolvimento ou execução de software, business case/ROI de negócio e operação pós-implantação (cl. 1.3 do Contrato).*
