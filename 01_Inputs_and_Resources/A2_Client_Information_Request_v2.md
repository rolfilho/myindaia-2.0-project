# A2 — Solicitação de Insumos do Cliente (Discovery MyINDAIA)

**Para:** Fabricio Motta Paulella — CEO, Indaiá Logística Internacional
**De:** Ricardo Leite
**Data:** Julho de 2026
**Contexto:** Preparação para a Fase de Discovery — MyINDAIA Modernization

---

## 1. Contexto e objetivo

Já concluímos a análise técnica estrutural do MyINDAIA legado (varredura de 48 repositórios e dos esquemas do banco `BROKER`). Esse material nos dá o **esqueleto do sistema** — as tabelas, os eventos de status e as integrações automáticas —, mas **não revela a realidade operacional humana**: o trabalho manual, as planilhas de controle paralelo, os handoffs por e-mail/WhatsApp e o tempo gasto em cada etapa.

Para desenhar o novo sistema de forma enxuta e focada em ganho de eficiência (ROI), precisamos preencher essas lacunas do "mundo real". Seguindo o princípio de **Pareto (80% do impacto com 20% do esforço)**, solicitamos apenas o essencial — concentrado no que a tecnologia não consegue deduzir sozinha — para **não sobrecarregar sua equipe**.

Este documento é o **detalhamento completo** dos insumos. A proposta traz um resumo de alto nível e aponta para cá.

---

## 2. O que já mapeamos (não é necessário enviar)

| Item | Já coberto pela nossa análise |
| --- | --- |
| **Etapas sistêmicas** | Abertura de processos, registro de DU-E/DUIMP via robôs e telas, consultas ao Mercante e fechamento de faturamento. |
| **Integrações de dados** | Fluxo técnico de troca de arquivos (planilhas/XML/API) com Nestlé, Pirelli, BASF, Cebrace e Croda. |
| **Marcos de status (follow-up)** | Lógica automática de gatilhos do banco (ex.: trigger `TR_FOLLOWUP`). |

---

## 3. Resumo dos insumos solicitados

Legenda de prioridade: **[Bloqueante]** = necessário para o Discovery começar/avançar · **[Desejável]** = enriquece a análise, mas não trava o cronograma.

| # | Insumo | Por que precisamos | Responsável sugerido | Formato | Prioridade |
| --- | --- | --- | --- | --- | --- |
| A | Acesso ao repositório do sistema de exportação | Base para validar o build real e o plano de migração | TI / Wagner | Acesso Git (leitura) | **Bloqueante** |
| B | Lote de documentos reais + *ground truth* para a PoC de OCR | Medir acurácia e custo do motor de extração — decisão nº 1 do Discovery | Operação (1 cliente, ex.: BASF) | PDFs + valores esperados | **Bloqueante** |
| C | Workflow "offline" e handoffs manuais | Entender o que ocorre fora do MyINDAIA | Wagner + analistas líderes | Sessão ou notas | **Bloqueante** |
| D | Métricas estimadas de esforço | Base do ROI de tempo (ordem de grandeza) | Wagner + analistas | Estimativas | Desejável |
| E | Regras de exceção (contas-chave / cargas especiais) | Onde o fluxo padrão quebra | Analistas líderes | Notas ou sessão | Desejável |
| F | Os 3 maiores gargalos operacionais | A dor de quem usa o sistema | Analistas | Notas ou sessão | Desejável |
| G | Sessões com Wagner e time + CEO | Walkthrough, validação de backlog e checkpoints | Wagner / CEO | Reuniões | **Bloqueante** |

> Os itens **C a F** podem ser cobertos por documentos já existentes (fluxogramas, POPs, onboarding de clientes) **ou** por sessões rápidas de 30 minutos com Wagner e os analistas líderes. Foco nos fluxos centrais de **Exportação (DU-E)** e **Importação (DUIMP/DI)**.

---

## 4. Detalhamento

### A. Acesso ao repositório do sistema de exportação **[Bloqueante]**

- **O que precisamos:** acesso de leitura ao repositório do vertical de Exportação já em construção (Wagner e equipe).
- **Por quê:** é a fonte real do build. Permite validar o v0 do plano de migração, o reuso de código e as estimativas firmes.
- **Formato/owner:** acesso Git concedido pela TI. Um ponto de contato técnico para dúvidas de setup.

### B. Documentos reais para a PoC de OCR **[Bloqueante]**

- **O que precisamos:** um lote de *invoices* / *packing lists* de **um único tipo de documento ou um único cliente** (ex.: BASF), acompanhados do respectivo **_ground truth_** (os valores corretos esperados).
- **Por quê:** a extração documental (OCR) é a decisão de maior impacto em custo mensal e cronograma — a única testada na prática nesta fase. O *ground truth* é o que permite medir **acurácia** ("acerta quanto?") e **custo** ("custa quanto por documento?").
- **Quantidade:** dezenas de exemplos bastam.
- **Observação de calendário:** pode exigir arranjo em torno do aviso prévio do Nelson — sinalizar cedo para não virar risco de cronograma.
- **Formato/owner:** PDFs originais + planilha simples com os valores esperados por documento. Operação, com apoio de quem hoje confere esses documentos.

### C. Workflow "offline" e handoffs manuais **[Bloqueante]**

*O que ocorre fora do MyINDAIA — como a informação chega e para onde vai antes/depois de entrar no sistema.*

1. **Recebimento de documentos:** como o cliente envia a *Invoice* e o *Packing List* (e-mail, pasta compartilhada, portal)? Há validação manual de recebimento?
2. **Handoffs entre áreas:** como a operação avisa o financeiro que um processo está pronto para faturamento ou pagamento de taxas (ex.: impostos no Mercante)? Por e-mail, planilha paralela, aviso verbal?
3. **Comunicação externa:** como são coordenadas as correções de documentos com clientes ou transportadores?

### D. Métricas estimadas de esforço **[Desejável]**

*Para o cálculo do ROI de tempo. Buscamos ordem de grandeza (médias/intervalos), não precisão científica.*

1. **Tempo por operação:** quanto tempo (min/horas) um analista gasta, somando todas as etapas, para processar uma Exportação padrão? E uma Importação padrão?
2. **Retrabalho:** qual o percentual aproximado de processos que exigem correção (redigitação/retificação) por erros em documentos dos clientes?
3. **Volume por analista:** quantos processos ativos cada analista consegue gerenciar simultaneamente hoje?

### E. Regras de exceção — contas-chave e cargas especiais **[Desejável]**

*Onde o fluxo "padrão" quebra e exige caminhos alternativos ou validações extras.*

1. **Tratamento químico / ISO-Tanks (BASF):** quais validações, licenças (ex.: Polícia Federal, Exército, ANVISA) ou documentos adicionais são exigidos para cargas químicas/hazmat que não ocorrem em cargas gerais?
2. **Especificidades de clientes:** há cliente (ex.: Nestlé, Pirelli) que exija validação manual de dados em sistemas próprios antes do registro da declaração no Siscomex?

### F. Os 3 maiores gargalos operacionais **[Desejável]**

*A perspectiva de quem usa o sistema diariamente.*

1. Quais tarefas repetitivas mais consomem tempo dos analistas? (Ex.: digitar manualmente dados de *invoices* extensas; preencher planilhas de controle paralelo por cliente.)
2. Onde ocorrem os maiores atrasos que dependem de aprovações internas ou de respostas de terceiros (órgãos anuentes, portos)?

### G. Sessões com o time e com o CEO **[Bloqueante]**

- **Wagner e time:** 2 sessões (walkthrough de código; validação do backlog/reuso) + Q&A assíncrono.
- **CEO:** 1–2 sessões de alinhamento + checkpoints de decisão.

---

## 5. Formato de resposta (pragmático e flexível)

Não queremos gerar trabalho de redação de manuais para sua equipe. Aceitamos os insumos em qualquer um dos formatos abaixo:

1. **Documentos existentes:** fluxogramas Visio/Bizagi, PDFs de treinamento interno ou apresentações comerciais/operacionais.
2. **Notas em tópicos:** um e-mail simples respondendo às perguntas das seções C a F.
3. **Reunião de walkthrough (recomendado):** uma call gravada de 30–45 min com Wagner (ou analista sênior) navegando na tela e explicando um processo real do início ao fim, com foco no que ele faz "por fora" do sistema.

---

*Dúvidas ou ajustes de prioridade podem ser tratados diretamente com Ricardo Leite.*
