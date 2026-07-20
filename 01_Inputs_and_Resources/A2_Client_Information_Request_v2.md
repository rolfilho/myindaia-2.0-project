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


| Item                             | Já coberto pela nossa análise                                                                                      |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Etapas sistêmicas**           | Abertura de processos, registro de DU-E/DUIMP via robôs e telas, consultas ao Mercante e fechamento de faturamento. |
| **Integrações de dados**       | Fluxo técnico de troca de arquivos (planilhas/XML/API) com Nestlé, Pirelli, BASF, Cebrace e Croda.                 |
| **Marcos de status (follow-up)** | Lógica automática de gatilhos do banco (ex.: trigger`TR_FOLLOWUP`).                                                |

> **Uma ressalva importante.** Temos a **estrutura** do motor de processos do MyINDAIA (as tabelas que definem serviços, etapas, eventos e prazos), mas **não o conteúdo** dela — ou seja, sabemos como um processo é descrito no sistema, mas não quais processos existem, como se chamam nem quais prazos e responsáveis estão configurados. É exatamente isso que o item **H** pede, e é o insumo de maior retorno por esforço desta lista.

---

## 3. Resumo dos insumos solicitados

Legenda de prioridade: **[Bloqueante]** = necessário para o Discovery começar/avançar · **[Desejável]** = enriquece a análise, mas não trava o cronograma.


| # | Insumo                                                     | Por que precisamos                                                            | Responsável sugerido             | Formato                   | Prioridade     |
| - | ---------------------------------------------------------- | ----------------------------------------------------------------------------- | --------------------------------- | ------------------------- | -------------- |
| A | Acesso ao repositório do sistema de exportação          | Base para validar o build real e o plano de migração                        | TI / Wagner                       | Acesso Git (leitura)      | **Bloqueante** |
| B | Lote de documentos reais +*ground truth* para a PoC de OCR | Medir acurácia e custo do motor de extração — decisão nº 1 do Discovery | Operação (1 cliente, ex.: BASF) | PDFs + valores esperados  | **Bloqueante** |
| C | Workflow "offline" e handoffs manuais                      | Entender o que ocorre fora do MyINDAIA                                        | Wagner + analistas líderes       | Sessão ou notas          | **Bloqueante** |
| D | Métricas estimadas de esforço                            | Base do ROI de tempo (ordem de grandeza)                                      | Wagner + analistas                | Estimativas               | Desejável     |
| E | Regras de exceção (contas-chave / cargas especiais)      | Onde o fluxo padrão quebra                                                   | Analistas líderes                | Notas ou sessão          | Desejável     |
| F | Os 3 maiores gargalos operacionais                         | A dor de quem usa o sistema                                                   | Analistas                         | Notas ou sessão          | Desejável     |
| G | Sessões com Wagner e time + CEO                           | Walkthrough, validação de backlog e checkpoints                             | Wagner / CEO                      | Reuniões                 | **Bloqueante** |
| H | Extração das tabelas de parametrização do`BROKER`      | Nos dá o mapa de processos que hoje só conseguimos ver "em branco"          | Leandro / DBA                     | CSV ou Excel              | **Bloqueante** |
| I | Planilha da Andrea + 30 min de conversa                    | A metade**humana** do mapa de processos — o que o sistema não registra      | Andrea (Operações)              | Planilha existente + call | **Desejável** |

> **O item H custa minutos.** É um `SELECT` em tabelas pequenas de configuração — não é dado transacional de cliente e não depende da negociação de acesso ao `BROKER`. Está marcado como bloqueante pelo impacto, não pelo esforço.

> Os itens **C a F** podem ser cobertos por documentos já existentes (fluxogramas, POPs, onboarding de clientes) **ou** por sessões rápidas de 30 minutos com Wagner e os analistas líderes. Foco nos fluxos centrais de **Exportação (DU-E)** e **Importação (DUIMP/DI)**.

---

## 4. Detalhamento

### A. Acesso ao repositório do sistema de exportação **[Bloqueante]**

- **O que precisamos:** acesso de leitura ao repositório do vertical de Exportação já em construção (Wagner e equipe).
- **Por quê:** é a fonte real do build. Permite validar o v0 do plano de migração, o reuso de código e as estimativas firmes.
- **Formato/owner:** acesso Git concedido pela TI. Um ponto de contato técnico para dúvidas de setup.

### B. Documentos reais para a PoC de OCR **[Bloqueante]**

- **O que precisamos:** um lote de *invoices* / *packing lists* de **um único tipo de documento ou um único cliente** (ex.: BASF), acompanhados do respectivo ***ground truth*** (os valores corretos esperados).
- **Por quê:** a extração documental (OCR) é a decisão de maior impacto em custo mensal e cronograma — a única testada na prática nesta fase. O *ground truth* é o que permite medir **acurácia** ("acerta quanto?") e **custo** ("custa quanto por documento?").
- **Quantidade:** dezenas de exemplos bastam.
- **Observação de calendário:** pode exigir arranjo em torno do aviso prévio do Nelson — sinalizar cedo para não virar risco de cronograma.
- **Formato/owner:** PDFs originais + planilha simples com os valores esperados por documento. Operação, com apoio de quem hoje confere esses documentos.

### C. Workflow "offline" e handoffs manuais **[Bloqueante]**

*O que ocorre fora do MyINDAIA — como a informação chega e para onde vai antes/depois de entrar no sistema.*

O objetivo é ter uma mapeamento completo dos processos com informações que não podem ser inferidas pelo proóprio sistema MyIndaia: que processos rodam no sistema MyIndaia e fora dele? Exemplos:

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

### H. Extração das tabelas de parametrização do `BROKER` **[Bloqueante — esforço de minutos]**

*O insumo de maior retorno por esforço desta lista.*

- **O que precisamos:** um `SELECT *` das tabelas de configuração abaixo, exportado em CSV ou Excel:

  ```
  TSERVICO              TSERVICO_EVENTO         TSERVICO_CLASSIFICACAO
  TEVENTO               TEVENTO_AUTOMATICO
  TETAPA                TETAPA_PRODUTO
  TPRODUTO              TUNID_NEG               TUNID_NEG_PRODUTO
  TSETOR                TCARGO
  TCLIENTE_SERVICO      (completa, não amostra)
  ```
- **Por quê:** essas tabelas **são** o mapa de processos da Indaiá, escrito pela própria Indaiá ao longo dos anos. `TSERVICO` define cada processo (evento de início, evento de fim, prazo-alvo, modal); `TSERVICO_EVENTO` define as etapas de cada um, na ordem, com o prazo de cada etapa; `TEVENTO` diz o que é cada atividade e **qual cargo é responsável por ela**; `TETAPA` agrupa em macroetapas por unidade de negócio e por produto; `TCLIENTE_SERVICO` diz qual cliente contrata qual processo.

  Com esse conteúdo em mãos, chegamos ao Discovery com **um mapa de processos preenchido para vocês corrigirem**, em vez de um formulário em branco para vocês preencherem. Isso reduz drasticamente o tempo que pediremos da equipe de operação nos itens C a F — as perguntas passam a ser específicas e verificáveis, e não abertas.
- **Sensibilidade:** é **parametrização, não dado de cliente**. Não contém informação comercial, fiscal ou pessoal — apenas a configuração do fluxo de trabalho. Se preferirem, `TCLIENTE_SERVICO` pode vir com o código do cliente anonimizado; perdemos a leitura por conta-chave, mas mantemos a estrutura.
- **Independência:** não depende do acesso de leitura ao `BROKER` (que segue em discussão à parte). É uma extração pontual, feita uma vez.
- **Formato/owner:** Leandro ou quem responde pelo banco. CSV com cabeçalho, um arquivo por tabela.

> **Complemento útil, se for trivial:** um `GROUP BY` com a **contagem de processos por serviço, por produto e por cliente nos últimos 12 meses** (sobre `TPROCESSO` e `TPROCESSO_EXP`). Transforma um mapa de processos plano em um mapa **priorizado** — e é o que nos permite recomendar com base em volume real qual cliente e qual fluxo devem ser o piloto.

### H2. Histórico de follow-up de ~20 processos reais **[Bloqueante]**

*Pequeno, e sem ele não conseguimos verificar se o processo configurado é o processo praticado.*

- **O que precisamos:** **todas** as linhas de `TFOLLOWUP` (e de `TFOLLOWUP_ETAPA`) referentes a **cerca de 20 processos já encerrados**, escolhidos para cobrir importação e exportação e os diferentes modais (marítimo, aéreo, rodoviário). Ou seja: `SELECT * FROM TFOLLOWUP WHERE NR_PROCESSO IN (<lista de 20>)`.
- **Por quê:** as amostras que temos hoje contêm 200 processos **diferentes**, com **um evento cada** — servem para entender a estrutura das tabelas, mas **não permitem reconstruir a sequência de nenhum processo**. Com o histórico completo de 20 processos conseguimos comparar o fluxo **configurado** no sistema com o fluxo **efetivamente executado**, incluindo os prazos reais entre etapas. É essa comparação que revela onde o processo real diverge do processo desenhado — normalmente o achado mais útil de todo o mapeamento.
- **Formato/owner:** Leandro / DBA. CSV com cabeçalho. Não precisa ser uma seleção cuidadosa: 20 processos encerrados quaisquer, desde que cubram os dois sentidos e os três modais.

### I. Planilha da Andrea e conversa com Operações **[Desejável]**

*Os itens H e H2 nos dão o processo como o **sistema** o registra. Este item dá o processo como as **pessoas** o executam. Um sem o outro produz um mapa pela metade.*

- **O que precisamos:**

  1. A **planilha mantida pela Andrea**, com o mapeamento dos principais **grupos/tipos de clientes** e de **quais partes do processo e do sistema cada um utiliza ou necessita**. Basta o arquivo como está hoje — não é preciso limpar, formatar nem documentar nada.
  2. Uma **conversa de ~30 minutos com a Andrea**, para cobrir o que nenhum sistema registra.
- **Por que este item pode ser decisivo:** esse mapeamento é a leitura mais direta que existe de **quem precisa de quê** — e é por isso que ele influencia não só o desenho do sistema, mas a **estratégia de desenvolvimento e de implantação**: qual vertical entra primeiro, qual cliente serve de piloto e em que ordem as funcionalidades entram em produção. É o insumo que conecta o mapa de processos à sequência de entrega.
- **Por quê:** nossa varredura do MyINDAIA mostra cada passo que alguém se deu ao trabalho de registrar no sistema — e **nada** sobre o que acontece entre um registro e outro. O trabalho manual, os handoffs por e-mail e WhatsApp, os controles paralelos em planilha e o retrabalho são, por definição, invisíveis para nós. Encontramos inclusive um campo `IN_RETRABALHO` nas tabelas de etapas: alguém modelou retrabalho deliberadamente, o que sugere que ele era frequente o bastante para merecer um campo próprio. Só uma pessoa da operação pode explicar isso.
- **Perguntas que pretendemos levar à conversa** (enviadas antes, para não gastar a call descobrindo o óbvio):

  1. Entre quais etapas registradas no sistema acontece trabalho manual relevante — e qual é esse trabalho?
  2. Quais etapas são registradas **depois do fato**, de modo que a data no sistema é lançamento contábil e não o momento real?
  3. Quais processos rodam **inteiramente fora** do MyINDAIA?
  4. De onde vem o retrabalho, na prática?
  5. Dos serviços cadastrados no sistema, quais estão de fato **mortos** — ativos no cadastro, mas sem operação há anos?
  6. Como vocês agrupam clientes hoje (porte, complexidade, exigências próprias)? É a leitura mais direta para escolher o **cliente-piloto**.
- **Sobre o papel da Andrea:** ela ainda não consta da nossa tabela de stakeholders. Se a leitura sobre o conteúdo da planilha estiver equivocada, a correção já é uma informação útil — e continua valendo a conversa.
- **Formato/owner:** Andrea (Operações). Planilha no formato em que estiver + uma call de 30 min. Se preferir, a call pode substituir integralmente o envio da planilha.

---

## 5. Formato de resposta

Não queremos gerar trabalho de redação de manuais para sua equipe. Aceitamos os insumos em qualquer um dos formatos abaixo:

1. **Documentos existentes:** fluxogramas Visio/Bizagi, PDFs de treinamento interno ou apresentações comerciais/operacionais.
2. **Notas em tópicos:** um e-mail simples respondendo às perguntas das seções C a F.
3. **Reunião de walkthrough (recomendado):** uma call gravada de 30–45 min com Wagner (ou analista sênior) navegando na tela e explicando um processo real do início ao fim, com foco no que ele faz "por fora" do sistema.

---

*Dúvidas ou ajustes de prioridade podem ser tratados diretamente com Ricardo Leite.*
