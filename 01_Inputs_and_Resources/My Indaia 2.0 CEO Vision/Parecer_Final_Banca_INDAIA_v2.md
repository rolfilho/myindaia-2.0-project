> **PARECER FINAL DA BANCA**
> **Entrega de Valor Incremental**
> Estratégia baseada em Martin Fowler
> INDAIA Logística Internacional  |  Sistema COMEX AI-First
> Assinado por:  Sofia Arantes (Arq. Sistemas)  |  Lucas Mendes (Dev)  |  Rafael Costa (Infra)
> Ana Ferreira (BD)  |  Pedro Souza (Micro-serviços)  |  Carla Nunes (Refatoração)


| **Versão** | **Data** | **Status** | **Objetivo central** |
| --- | --- | --- | --- |
| 2.0 | Março 2026 | Aprovado por unanimidade — revisão v2 | Incorporar decisões: DI Legada eliminada, Agentes 09+10, 2 times paralelos. Roadmap incremental de sprints atualizado. |
| 1.0 | Março 2026 | Aprovado por unanimidade | Entregar valor ao cliente o mais rápido possível, sem big bang, filosofia Fowler |


> **⚡ O que muda na v2.0 deste Parecer**
> - Seção 2 (Walking Skeleton): tabela atualizada — Agentes 09 e 10 incluídos como parte do skeleton expandido
> - Seção 4 (Roadmap de Sprints): todos os sprints revisados para refletir DUIMP-only, Ag 09+10, 2 verticais
> - Sprint 3 expandido: booking automático via Agente 09 e compliance MQC via Agente 10 incluídos
> - Sprint 6 revisado: customs-service DUIMP (14 sem) — nunca di-service (risco CRÍTICO eliminado)
> - Sprint 7 expandido: 2 verticais paralelas (Time A Exportação + Time B Importação)
> - Métricas de sucesso: compliance MQC e booking automático adicionados como indicadores
> - Princípios e vozes da banca: inalterados — continuam plenamente válidos


# Prefácio — A Pergunta Certa


A banca foi convocada com uma premissa clara: o maior desejo do Fabricio é entregar valor aos clientes da INDAIA o mais rápido possível, sem um big bang de implantação. Essa é a pergunta certa. E ela muda tudo sobre como pensar o projeto.

> *"The key to making evolutionary architecture work is to make architectural decisions that allow you to change your mind later, rather than trying to make the perfect decision now."*
> — Martin Fowler, Evolutionary Architecture


O que a banca constatou: os documentos anteriores estavam corretos na direção, mas organizados em torno de um roadmap técnico — fases de infra, fases de reescrita de módulos. Fowler inverte essa lógica. A pergunta não é 'quando consigo reescrever o PGDI?'. A pergunta é: 'o que posso entregar ao cliente da INDAIA na próxima semana?'.

> **Descoberta central da banca — confirmada na v2.0**
> O sistema Delphi já está em produção e funcionando. Os clientes já têm acesso ao webapp.
> A oportunidade não é substituir o que existe — é expandir as capacidades do sistema com IA enquanto o Delphi continua operando.
> Isso é o Walking Skeleton: uma implementação end-to-end mínima que atravessa todas as camadas sem quebrar nada.
> 
> A decisão de eliminar a DI Legada (PGDI) do escopo é a maior confirmação desse princípio:
> a INDAIA já opera 100% em DUIMP — reescrever o PGDI seria trabalho para o passado, não para o futuro.


# 1. Os 8 Princípios de Fowler Aplicados à INDAIA


A banca mapeou os princípios de Martin Fowler diretamente para a realidade do sistema INDAIA. Cada princípio tem uma aplicação prática imediata. Estes princípios são inalterados na v2.0 — permanecem como o norte estratégico do projeto.

| **P1** | **Evolutionary Architecture**<br>Evolua a arquitetura em pequenos passos reversíveis. Não projete para o futuro imaginado.<br>**Na INDAIA:** Não esperar ter toda a arquitetura de micro-serviços pronta para começar. Cada sprint adiciona uma capacidade nova sem remover o que já funciona. |
| --- | --- |


| **P2** | **Walking Skeleton**<br>Construa uma implementação end-to-end mínima que atravessa todas as camadas do sistema antes de otimizar qualquer parte.<br>**Na INDAIA:** Sprint 1: notification-service + logistics-service rodando sobre o mywebapi Delphi existente. Atravessa UI → API → Agente → Banco → Notificação em produção real. |
| --- | --- |


| **P3** | **Strangler Fig**<br>Construa o novo sistema em volta do legado. Quando o novo estiver pronto, o legado murcha naturalmente.<br>**Na INDAIA:** O Python não substitui o Delphi — ele cresce ao redor. O mywebapi Delphi continua respondendo para o webapp enquanto o Python adiciona capacidades novas ao lado. Os Agentes 09 e 10 operam SOBRE o minibrowser Delphi existente antes de substituí-lo. |
| --- | --- |


| **P4** | **Branch by Abstraction**<br>Introduza uma camada de abstração que permite ao novo código conviver com o legado sem duplicação.<br>**Na INDAIA:** O API Gateway FastAPI é essa camada. Ele decide se a requisição vai para Python ou para Delphi. O cliente não percebe a diferença. A tabela de roteamento configurável permite cutover por endpoint, por cliente, sem deploy. |
| --- | --- |


| **P5** | **Parallel Run**<br>Rode o sistema novo em paralelo com o legado, comparando resultados antes de migrar.<br>**Na INDAIA:** Quando o customs-service Python processar DUIMP, comparar resultado com o que o Delphi faria. Só migrar quando zero divergências por 4 semanas consecutivas. |
| --- | --- |


| **P6** | **Seams — Costura pelo Comportamento**<br>Identifique as costuras do sistema — pontos onde você pode inserir novo comportamento sem alterar o código ao redor.<br>**Na INDAIA:** TFOLLOWUP_ETAPA é uma costura perfeita: o Agente de Comunicação escuta eventos novos nessa tabela e aciona notificações. TBID é outra costura: o Agente 10 (Allocation) lê contratos MQC sem o Delphi saber que existe um monitorador. |
| --- | --- |


| **P7** | **Feature Toggles**<br>Use flags de funcionalidade para ativar o novo comportamento gradualmente, cliente por cliente.<br>**Na INDAIA:** Começar com 1 cliente piloto (o mais tolerante a mudanças). Validar. Expandir para os outros gradualmente. Nunca migrar todos de uma vez. O Agente 09 (Booking) pode ser ativado por analista, não por todos simultaneamente. |
| --- | --- |


| **P8** | **Continuous Delivery**<br>Cada commit deve poder ir para produção. Sem branches longos, sem fases de integração.<br>**Na INDAIA:** CI/CD desde o primeiro dia. O Sprint 1 já inclui pipeline de deploy automático. Sem acumular código que não está em produção. |
| --- | --- |


# 2. O Walking Skeleton — O que Entregar Primeiro


A maior discordância da banca foi resolvida com este conceito. Carla Nunes (Refatoração) e Pedro Souza (Micro-serviços) estavam certos: não se começa pelo centro do domínio — começa-se pela periferia que entrega valor.

> **Definição do Walking Skeleton para a INDAIA — v2.0**
> Um processo de exportação entra no sistema. O Agente 10 verifica que há allocation disponível no contrato MQC.
> O Agente 09 submete o booking ao armador via INTTRA API e confirma datas em 30 minutos.
> O cliente recebe um push: 'Booking confirmado para o MSC Maeva, ETD 15/04. VGM cutoff: 12/04.'
> — Isso acontece sem o analista entrar no sistema INTTRA. Esse é o Walking Skeleton da exportação.
> 
> Ou para importação: um processo chega. O Agente de Rastreamento detecta que o navio chegou.
> O Agente de Comunicação envia push: 'Seu carregamento chegou ao porto de Santos. Desembaraço previsto para amanhã.'
> — Fim-a-fim, em produção, em 8 semanas.


## 2.1 O que compõe o Walking Skeleton — v2.0


| **Componente** | **Tecnologia** | **Origem** | **Tempo para Produção** |
| --- | --- | --- | --- |
| mywebapi Delphi (já existe) | XData REST + JWT | Legado — não tocar | Já em produção |
| webapp PWA (já existe) | Firebase PWA | Legado — expandir | Já em produção |
| logistics-service (Python) | FastAPI + Celery Beat | Novo — substitui edi.pas | Sprint 1-2 (4 semanas) |
| notification-service (Python) | FastAPI + Firebase FCM | Novo — substitui mysendmail | Sprint 1-2 (4 semanas) |
| Agente 06 Rastreamento (LangGraph) | Python + Claude API | Novo — sobre o legado | Sprint 3-4 (4 semanas) |
| Agente 08 Comunicação (LangGraph) | Python + Claude API | Novo — sobre o legado | Sprint 3-4 (4 semanas) |
| Agente 10 Allocation/MQC (LangGraph) | Python + Claude API | Novo — lê TBID do Delphi | Sprint 3 (3 semanas) ✦ |
| Agente 09 Booking Marítimo (LangGraph) | Python + INTTRA API REST | Novo — substitui RPA minibrowser | Sprint 3-4 (4 semanas) ✦ |
| PostgreSQL (mínimo) | AWS RDS ou EC2 Docker | Novo — apenas tabelas Walking Skeleton | Sprint 1 (1 semana) |
| API Gateway (mínimo) | FastAPI | Novo — roteia Delphi ou Python | Sprint 1 (1 semana) |


✦ Os Agentes 09 e 10 foram incluídos no Walking Skeleton v2.0 porque o valor que entregam é imediato e independe de reescrita de módulos Delphi. O Agente 09 opera sobre o minibrowser existente como wrapper interim enquanto a migração INTTRA API REST não conclui.

Total: 8 semanas (Walking Skeleton base) + 4 semanas adicionais para Ag 09+10 = 12 semanas. 1 desenvolvedor Python sênior. O cliente sente o valor na semana 8.

# 3. Vozes da Banca — As Decisões Mais Importantes


A banca registra aqui as decisões que geraram mais debate e como chegou ao consenso. As vozes são inalteradas na v2.0 — os princípios continuam válidos e foram reforçados pelas decisões de escopo.

> **Arquiteto de Infraestrutura**
> Rafael Costa
> *Minha contribuição mais importante: não construa a infra para o futuro imaginado. EC2 + Docker Compose resolve os primeiros 6 meses. Quando tiver carga real para justificar ECS Fargate e RDS Multi-AZ, você migra. Pagar por escala que não existe é desperdício que atrasa a entrega de valor.*


> **Arquiteta de Sistemas**
> Sofia Arantes
> *O ponto que defendi com mais força: os certificados A3 dos despachantes ficam onde estão — na máquina local, gerenciados pelo apiproxyportalunico Delphi. O Python chama o proxy Delphi via HTTP interno. Isso parece* *gambiarra* *mas é exatamente o que Fowler recomenda: solução pragmática hoje, solução perfeita quando tiver orçamento para HSM.*


> **Expert em Refatoração de Aplicações**
> Carla Nunes
> *A ordem de reescrita dos módulos Delphi é de fora para dentro, sempre. Periféricos primeiro: EDI, integrações, portal web. Núcleo operacional (processos, DUIMP, financeiro) por último. Quem inverte essa ordem — começando pelo módulo de processos porque parece mais importante — está escolhendo o caminho mais lento e mais arriscado. A decisão de eliminar o PGDI do escopo é a melhor confirmação desse princípio que já vi neste projeto.*


> **Expert em Desenvolvimento de Software**
> Lucas Mendes
> *O Walking Skeleton deve estar em produção antes de qualquer discussão sobre reescrita de módulos Delphi. Até o Walking Skeleton estar estável por 4 semanas, você não sabe o que está pronto para o próximo passo. A tentação de planejar demais antes de ter feedback real de produção é o maior risco do projeto. Os Agentes 09 e 10 são exemplos perfeitos disso: entregam valor imediato sem esperar a Fase 6 do roadmap.*


> **Expert em Banco de Dados**
> Ana Ferreira
> *SQL Server BROKER é sagrado. Nenhuma migração massiva antes de 6 meses de Python estável. O PostgreSQL cresce em paralelo, recebe dados novos, e o SQL Server continua sendo a fonte de verdade histórica. A DI histórica — TDECLARACAO_IMPORTACAO e TADICAO_DE_IMPORTACAO — fica no SQL Server para sempre como arquivo. A view read-only que o Python usa é o padrão certo. Simples, seguro, reversível.*


> **Expert em Micro-serviços**
> Pedro Souza
> *Cada micro-serviço deve ser justificado por uma capacidade de negócio que ele habilita, não por um módulo Delphi que ele substitui. O booking-service não existe para substituir o minibrowser.pas — ele existe para responder: 'Posso garantir que vamos cumprir o contrato MQC com a Maersk este mês?' Se você organiza os serviços em torno de perguntas que a operação faz, nunca vai errar a prioridade.*


# 4. Roadmap Incremental — Entrega de Valor por Sprint (v2.0)


Este é o roadmap revisado pela banca na v2.0. Cada sprint entrega algo que um cliente da INDAIA consegue ver ou sentir. Nenhum sprint é de 'fundação invisível' por mais de 2 semanas.

> **Princípio guia**
> Antes de começar qualquer sprint, pergunte: 'Se eu entregar isso na sexta-feira, o que meu cliente vai poder fazer na segunda-feira que não conseguia fazer antes?'
> Se a resposta for 'nada visível ainda', o sprint está errado.


> **Sprint 0 — Segurança** **Imediata**  •  1–2 semanas
> 🎯 Valor entregue: Eliminação de risco crítico — não visível ao cliente, mas necessário para continuar
> Rotacionar senha SA do SQL Server INDAIA10 (sa/Password=123 hardcoded em 15+ arquivos) — Dia 1, sem negociação
> Criar conta SQL myindaia_app com privilégios mínimos (SELECT/INSERT/UPDATE/EXEC apenas)
> Atualizar inc_utils.asp e todos os .aspx com a nova conta
> Configurar firewall SQL Server: apenas rede interna, zero acesso externo direto
> Criar conta broker_pyodbc_ro (somente leitura) para o Python ler TPROCESSO, TBID, TFOLLOWUP_ETAPA
> Auditoria completa de credenciais hardcoded em todos os repositórios


> **Sprint 1 — Fundação Mínima** **Viável**  •  3–4 semanas
> 🎯 Valor entregue: Infra pronta para receber o Walking Skeleton — ainda nada visível ao cliente
> EC2 + Docker Compose (não ECS ainda): PostgreSQL 16 + pgvector + Redis 7
> FastAPI API Gateway mínimo: autenticação JWT (mesmo secret do Delphi: 2d013705c915)
> CI/CD básico: GitHub Actions → Docker → EC2 em < 10 minutos
> Conexão pyodbc read-only ao SQLHOMOLOG/BROKER (testar TPROCESSO, TPROCESSO_EXP, TBID, TFOLLOWUP_ETAPA)
> Schema inicial PostgreSQL: apenas tabelas do Walking Skeleton (process_event, notification, booking, mq_contract)
> Langfuse configurado: rastreamento de chamadas LLM desde o primeiro agente


> **Sprint 2 — Walking Skeleton: Rastreamento +** **Booking**  •  5–12 semanas
> 🎯 Valor entregue: Cliente recebe notificação automática quando navio chega. Analista para de fazer booking manual no INTTRA.
> logistics-service: polling INTTRA API a cada 2h para processos ativos
> logistics-service: escuta TFOLLOWUP_ETAPA via pyodbc — detecta eventos 021 (chegada navio), 082 (presença carga), 168 (canal)
> notification-service: Firebase FCM push para webapp + email via aiosmtplib — mensagens geradas pelo Claude API em PT/EN/ES
> Agente 08 (Comunicação): primeiro agente LangGraph em produção — notificação contextualizada por processo
> Agente 10 (Allocation/MQC): lê TBID via pyodbc, cria tabelas mq_contract + allocation_tracking, calcula compliance, emite alertas — sem tocar no Delphi
> Agente 09 (Booking): wrapper interim via minibroker REST. Submete booking, faz polling de confirmação, registra deadlines (VGM/SI/CY). Analista ativa via painel React.
> Substituir edi.pas (BDE obsoleto) — Python asyncio + FastAPI webhook
> RESULTADO 1: cliente recebe 'Seu carregamento chegou ao porto de Santos' sem ninguém fazer nada
> RESULTADO 2: analista para de entrar no INTTRA para fazer booking — Agente 09 em operação
> RESULTADO 3: gestor vê dashboard MQC com compliance em tempo real — sem planilha Excel


> **Sprint 3 — NCM Inteligente + Ingestão** **Documental**  •  13–20 semanas
> 🎯 Valor entregue: Analista classifica NCM em 30 segundos com sugestão automática. Invoice extrai campos automaticamente.
> Agente 04 (NCM): classificação com histórico de 26 anos do TDETALHE_MERCADORIA — acurácia > 90% para produtos conhecidos
> Few-shot com as últimas 20 classificações do cliente — feedback loop: aprovações/rejeições melhoram o agente
> Interface React simples: analista vê NCM sugerido + justificativa + 3 alternativas
> tax-service v1: classificação NCM only — SEM cálculo de impostos (Portal Único calcula via DUIMP)
> document-service: upload de documentos + armazenamento S3
> Agente 02 (Ingestão): Claude Vision extrai campos de Invoice, BL, Packing List
> Agente 03 (Verificação): compara campos extraídos vs PO do cliente — detecta divergências com severidade
> Embedding dos documentos em pgvector: busca semântica para auditoria
> RESULTADO: analista libera 2–3 horas/dia de pesquisa de NCM manual + 80% da digitação de documentos eliminada


> **Sprint 4 — Portal do Cliente** **Moderno**  •  21–28 semanas
> 🎯 Valor entregue: Cliente tem timeline visual, pode fazer perguntas em linguagem natural e recebe alertas proativos
> React SPA substituindo portal ASP legado (374 páginas) para novos usuários
> Timeline visual de processo: todos os eventos com datas previstas vs realizadas
> Chat com o processo: 'Quando vai desembaraçar?' → Agente responde com contexto real
> Dashboard MBF moderno: KPIs de lead time, custo médio, taxa de canal verde, compliance MQC
> AllocationDashboard: visualização MQC por armador/rota com alertas visuais (Agente 10)
> BookingPanel: status de booking em tempo real, deadlines VGM/SI/CY na tela do analista (Agente 09)
> Migrar clientes gradualmente usando Feature Toggles — começar pelo mais tolerante
> Firebase push integrado: alertas proativos sem o cliente precisar abrir o portal
> RESULTADO: cliente deixa de ligar para o analista para saber status — acessa sozinho. Gestor monitora MQC sem planilha.


> **Sprint 5 — Integrações Governamentais +** **DUIMP**  •  29–36 semanas
> 🎯 Valor entregue: Transmissão DUIMP mais rápida e com menos erros — analista foca em revisão, não em preenchimento
> gov-integration-service: Portal Único mTLS portado para Python (httpx + ssl)
> customs-service: DUIMP completo — preenchimento automático pelo Agente 07 (14 semanas, risco MÉDIO)
> NÃO reimplementar sp_di_calculo nem sp_calc_* — Portal Único (RFB) calcula os impostos
> Webhook DUIMP: status atualizado em tempo real via duimpwebhook Python
> Agente 05 (Compliance): identifica LI, órgãos anuentes, drawback automaticamente
> Certificados A3: manter proxy Delphi local por enquanto (pragmatismo Fowler). Migrar para HSM em sprint futuro.
> SDA Santos e Rio de Janeiro portados para Python (myprocessasda)
> View read-only v_di_historica: TDECLARACAO + TADICAO acessíveis via pyodbc para consultas históricas
> RESULTADO: DUIMP preenchida em 5 minutos com IA vs 45 minutos manualmente


> **Sprint 6 — Núcleo Operacional: 2 Verticais em** **Paralelo**  •  37–50 semanas
> 🎯 Valor entregue: Sistema Python assume gestão de processos e exportação (Time A) e importação DUIMP completa (Time B)
> TIME A (Exportação): export-service — PGPE completo (44 arquivos), DU-E, Draft B/L via minibroker REST
> TIME A: migração INTTRA API REST oficial (substituir minibrowser.pas RPA — 4 semanas, complexidade alta)
> TIME A: Agente 09 passa a usar INTTRA API REST ao invés do wrapper interim
> TIME A: Agente 07 (Emissão Documental): Fatura + Packing List + Draft B/L automáticos
> TIME B (Importação): customs-service DUIMP em produção plena para todos os clientes
> TIME B: integrações LI/Siscomex completas (myparametrizacaoli portado para Python + Playwright)
> Parallel Run para ambas as verticais: Python e Delphi rodando simultaneamente
> Feature Toggles: migrar clientes um a um quando Python tiver 4 semanas sem divergências
> Integrações BASF, Nestlé, Pirelli portadas para Python
> RESULTADO: analista opera inteiramente no novo sistema para processos novos — Delphi como fallback silencioso


> **Sprint 7 — Financeiro +** **Descomissionamento**  •  51–62 semanas
> 🎯 Valor entregue: Sistema 100% Python em produção — SQL Server BROKER vira arquivo histórico
> billing-service: faturamento completo, NFS-e multi-município (DDENFSe portado), integração Senior ERP (SOAP)
> Wallet minibroker migrado para billing-service Python
> Agente 08 Comunicação completo: todos os canais, todos os eventos
> Migração de dados MYINDAIAV2 → PostgreSQL (dados modernos, não histórico BROKER)
> Descomissionar portal ASP legado e portal ASPX — 374 páginas substituídas por React
> Descomissionar edi.pas, mysendmail, microaplicativos satélites
> SQL Server BROKER: manter como arquivo histórico somente leitura — NÃO desligar
> ddbroker.exe: desativar módulo a módulo, não de uma vez
> Fine-tuning com histórico de 26 anos de processos — melhorar acurácia dos agentes
> RESULTADO: operação 100% Python. Delphi em modo arquivo. Booking automático + compliance MQC como norma.


# 5. Como Medir o Valor Entregue — v2.0


A banca rejeita métricas técnicas como critério primário de sucesso. As métricas que importam são as que o cliente da INDAIA sente. A v2.0 adiciona métricas de booking e compliance MQC.

| **Métrica** | **Como Medir** | **Meta Sprint 2** | **Meta Sprint 4** | **Meta Sprint 7** |
| --- | --- | --- | --- | --- |
| Tempo médio de resposta a eventos | Minutos entre evento e analista/cliente saber | < 30 min (hoje: horas) | < 5 min (push automático) | < 1 min (tempo real) |
| Notificações proativas por semana | Quantas vezes o cliente foi avisado sem ligar | 0 → >10/semana | 50+ por semana | 500+ por semana |
| Tempo de classificação NCM | Minutos por produto novo | 30–45 min (hoje manual) | < 5 min (com sugestão IA) | < 1 min (auto-aprovado) |
| Horas de digitação manual por dia | Horas digitando dados de documentos | 8h/analista/dia | 3h/analista/dia | < 1h/analista/dia |
| Chamadas inbound de clientes | Ligações para saber status do processo | Baseline a medir | –40% | –80% |
| Tempo de preenchimento DUIMP | Minutos para preencher e transmitir | 45–60 min (hoje) | 20 min (com assistência) | 5 min (preenchimento IA) |
| Bookings via Agente 09 (%) | % de bookings feitos pelo agente vs. manual | 0% → >30% | >70% | >95% |
| Compliance MQC (% contratos em dia) | % contratos acima de 70% de utilização | Sem visibilidade (hoje) | Dashboard em tempo real | Alertas preditivos 30 dias |
| NPS dos clientes INDAIA | Pesquisa trimestral de satisfação | Baseline a medir | + 10 pontos | + 25 pontos |


# 6. Riscos que a Banca Identificou — v2.0


| **Risco** | **Probabilidade** | **Impacto** | **Mitigação da Banca** |
| --- | --- | --- | --- |
| Credencial SA exposta em produção (confirmada) | CONFIRMADA | CRÍTICO | Sprint 0, Dia 1. Não adiar. |
| Over-engineering antes de ter feedback real | ALTA | ALTO | Walking Skeleton em produção antes de qualquer arquitetura grande. Fowler: feedback beats prediction. |
| Certificados A3 bloqueando cloud | MÉDIA | ALTO | Manter proxy Delphi local. Decisão pragmática deliberada. Revisitar em 12 meses. |
| Equipe resistente a mudança | MÉDIA | MÉDIO | Feature Toggles: ninguém é forçado a migrar. O novo sistema convive até ser preferido naturalmente. |
| Agente 09 dependente de RPA frágil (minibrowser) | ALTA (RPA quebra com layout) | MÉDIO | Wrapper interim via minibroker REST. Migrar para INTTRA API REST na Fase 4 como prioridade máxima. |
| Shortfall MQC por falta de visibilidade | MÉDIA | ALTO | Agente 10 monitora em tempo real desde Sprint 2. Alertas proativos com 30 dias de antecedência. |
| Agente NCM com sugestão errada | BAIXA | MÉDIO | Threshold configurável. Abaixo de 85% de confiança: sempre vai para humano. Zero auto-aprovação para NCM de produto novo. |
| Latência do LLM em horário de pico | MÉDIA | MÉDIO | Cache de respostas frequentes no Redis. Timeout configurado. Fallback para regras deterministas. |
| Escopo expandindo sem controle (scope creep) | ALTA | ALTO | Cada sprint tem critério de 'feito' definido por valor ao cliente. Sem adicionar ao sprint sem remover algo. |


# 7. Recomendações Práticas para o Fabricio


## 7.1 As 5 coisas para fazer esta semana


Rotacionar a senha SA do SQL Server INDAIA10. É o único item sem negociação de prazo. Fazer hoje.

Contratar 1 desenvolvedor Python sênior com experiência em FastAPI e LangGraph. O projeto inteiro depende dessa pessoa.

Entrar em contato com a INTTRA para obter credenciais de API REST. O Agente 09 (Booking) é uma das entregas de mais impacto imediato — a dependência de RPA é o maior risco técnico atual.

Definir qual cliente será o piloto do Walking Skeleton. Idealmente: o mais comunicativo, que dá feedback rápido, e tolerante a eventuais bugs.

Marcar uma sessão de 2 horas com os analistas operacionais para mapear: quais processos de exportação hoje exigem acesso manual ao INTTRA? Essa lista vira o backlog do Agente 09.

## 7.2 O que NÃO fazer


> Não planejar a arquitetura final antes de ter o Walking Skeleton em produção. Todo planejamento feito antes de feedback real é especulação. Fowler chama isso de YAGNI: You Aren't Gonna Need It.


> Não migrar todos os clientes de uma vez para o novo portal. Usar Feature Toggles. Migrar um cliente por vez, validar, escalar. O risco de um cliente reclamar é 100x menor que o risco de todos reclamarem ao mesmo tempo.


> Não contratar um time grande antes de ter o Walking Skeleton validado. 1 desenvolvedor Python sênior é suficiente para os primeiros 3 sprints. Time grande antes de clareza de arquitetura gera complexidade, não velocidade.


> Não desligar o Delphi por data. O Delphi desliga quando o Python for preferido pela equipe operacional — não por decreto. Fowler: o Strangler Fig mata o host naturalmente, não por cirurgia.


> Não reimplementar sp_di_calculo ou sp_calc_* em Python. A decisão de usar DUIMP-only eliminou esse risco — o Portal Único (RFB) calcula os impostos. Nunca tente replicar 26 anos de regras fiscais em código Python.


## 7.3 Como apresentar para os clientes


Os clientes da INDAIA não precisam saber que existe uma migração de Delphi para Python. O que eles vão perceber é:

Semana 8: receber uma notificação push quando o navio chega, sem ter ligado pedindo.

Semana 12: o analista confirmar o booking de exportação sem precisar entrar no portal INTTRA.

Semana 14: o analista classificar o NCM do produto novo em 1 minuto com sugestão automática.

Semana 18: fazer upload de uma Invoice e ter os campos preenchidos automaticamente.

Semana 24: acessar uma timeline visual do processo e fazer perguntas em linguagem natural.

Semana 28: gestor ver o dashboard MQC com compliance por armador em tempo real — sem planilha Excel.

Semana 32: DUIMP transmitida com preenchimento assistido por IA.

Cada um desses momentos é uma conversa comercial com o cliente: 'Olha o que a INDAIA passou a fazer pelo seu processo.' Isso é diferencial competitivo real, não arquitetura de software.

## 7.4 O indicador mais importante do projeto


> *"The real measure of success is not whether you deployed new software — it is whether your customers are doing things they could not do before."*
> — Martin Fowler, paráfrase de Continuous Delivery


> **Indicador norte do projeto**
> Todo sprint, pergunte: quantas vezes um cliente da INDAIA foi avisado sobre algo antes de precisar ligar para saber?
> Esse número é zero hoje.
> Na semana 8 deve ser maior que zero.
> Na semana 52 deve ser a norma, não a exceção.
> 
> E para o gestor operacional: quantos bookings de exportação foram feitos pelo sistema sem o analista entrar no INTTRA?
> Esse número também é zero hoje. Na semana 12 deve ser maior que zero.


# 8. Consenso e Assinaturas da Banca


A banca chegou a consenso unânime após 5 rodadas de debate na v1.0, e reafirmou por unanimidade as adições da v2.0. Os pontos abaixo representam a posição consolidada de todos os 6 especialistas:

| **Consenso** | **Aprovado por** |
| --- | --- |
| Walking Skeleton em 8 semanas é o primeiro passo — antes de qualquer reescrita de módulo Delphi | Unânime (6/6) |
| Agentes 09 (Booking) e 10 (Allocation/MQC) integram o Walking Skeleton v2.0 — entrega de valor imediata | Unânime (6/6) — adicionado v2.0 |
| DI Legada (PGDI) eliminada do escopo — customs-service foca 100% em DUIMP | Unânime (6/6) — adicionado v2.0 |
| Infra mínima (EC2 + Docker Compose) para os primeiros 6 meses — sem ECS/RDS ainda | Unânime (6/6) |
| Certificados A3 ficam no proxy Delphi local — não mover para cloud sem orçamento para HSM | Unânime (6/6) |
| Reescrita de fora para dentro: periféricos primeiro, núcleo operacional por último | Unânime (6/6) |
| SQL Server BROKER: somente leitura sagrado — DI histórica nunca migrar para PostgreSQL | Unânime (6/6) |
| Feature Toggles: migração de clientes um a um, nunca todos de uma vez | Unânime (6/6) |
| Cada sprint define valor ao cliente como critério de 'feito' — sem sprints de fundação > 2 semanas | Unânime (6/6) |
| O objetivo não é reescrever o Delphi — é expandir capacidades do sistema com IA | Unânime (6/6) |
| sp_di_calculo e sp_calc_* NÃO serão reimplementadas em Python — Portal Único calcula | Unânime (6/6) — adicionado v2.0 |
| 2 times paralelos a partir da Fase 3: Time A Exportação + Time B Importação | Unânime (6/6) — adicionado v2.0 |


> **Parecer aprovado por unanimidade**
> Sofia Arantes  |  Lucas Mendes  |  Rafael Costa
> Ana Ferreira  |  Pedro Souza  |  Carla Nunes
> v2.0  —  Março 2026  |  INDAIA Logística Internacional


> **Documento gerado automaticamente — Parecer Final da Banca v2.0 | INDAIA COMEX AI-First**
> Substitui Parecer_Final_Banca_INDAIA.docx (v1.0).
> v2.0: Walking Skeleton expandido com Ag 09+10; sprints atualizados para DUIMP-only e 2 verticais paralelas;
> métricas de booking automático e compliance MQC adicionadas; consenso da banca expandido.
