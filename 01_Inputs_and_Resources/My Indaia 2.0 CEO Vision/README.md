> **VISÃO DO PROJETO — NÍVEL EXECUTIVO**
> Sistema COMEX AI-First
> INDAIA Logística Internacional
> Consolidado a partir do conjunto documental (PVD v4.0 + Roadmap v3.0 + Parecer da Banca v2.0)

---

## Nota sobre este documento

O PVD v4.0 é um bom documento de produto, mas não é um documento de visão completo: ele carrega **o quê** será construído e omite **por que nesta ordem** — a camada estratégica que está no Parecer Final da Banca v2.0 (Martin Fowler / Walking Skeleton).

Este arquivo consolida apenas a camada de visão. Detalhe técnico permanece nos documentos de origem:

| Camada | Documento | Status |
| --- | --- | --- |
| Visão executiva | **este arquivo** | consolidado |
| Produto / agentes | [PVD_COMEX_AI_INDAIA_v4.md](PVD_COMEX_AI_INDAIA_v4.md) | vigente |
| Estratégia de entrega | [Parecer_Final_Banca_INDAIA_v2.md](Roadmap%20v2/Parecer_Final_Banca_INDAIA_v2.md) | vigente — **não refletido no v4** |
| Especificação dos agentes | [Especificacao_10_Agentes_IA_COMEX_v2.md](Roadmap%20v2/Especificacao_10_Agentes_IA_COMEX_v2.md) | vigente — detalhe operacional |
| Arquitetura de Transição | [Arquitetura_Transicao_Delphi_Python_v2.md](Roadmap%20v2/Arquitetura_Transicao_Delphi_Python_v2.md) | vigente — coexistência e roteamento |
| Modelo Relacional | [DiagramaER_PostgreSQL_COMEX_AI_v2.md](Roadmap%20v2/DiagramaER_PostgreSQL_COMEX_AI_v2.md) | vigente — diagrama ER e tabelas |
| Guia do Desenvolvedor | [DocTecnico_Desenvolvedor_COMEX_AI_v2.md](Roadmap%20v2/DocTecnico_Desenvolvedor_COMEX_AI_v2.md) | vigente — setup, integrações e SPs |
| Domínios e Sprints | [Dominios_Negocio_Roadmap_Python_v2.md](Roadmap%20v2/Dominios_Negocio_Roadmap_Python_v2.md) | vigente — domínios de negócio e roadmap |

⚠️ Os arquivos rotulados "v2" **não são versões antigas** — a numeração é por documento, não uma sequência única. `Especificacao_10_Agentes` (§4) e `Dominios_Negocio` (§5) citam explicitamente a "Decisão v4.0", ou seja, foram revisados **depois** do v4. O Parecer da Banca não cita v4.0, mas é da mesma data e sua revisão v2.0 já incorpora as três decisões que o v4 anuncia — é contemporâneo, não anterior.

---

# 1. A tese

A INDAIA opera há 26 anos como despachante aduaneira em Santos e Rio de Janeiro, com 800+ processos ativos simultâneos para BASF, Nestlé, Pirelli, Cargill, Whirlpool, Ferrero, Saint-Gobain e +50 outros clientes.

O sistema que sustenta essa operação é um monolito Delphi + SQL Server com 1.205 tabelas, 727 stored procedures e 40+ microaplicativos satélites.

> **A decisão estratégica**
> Não reescrever o sistema. Construir uma camada de orquestração com IA **em volta** dele.
> Agentes de IA assumem 80% das tarefas operacionais; a equipe migra de execução para supervisão de exceções, relacionamento e estratégia.

O diferencial competitivo não é a tecnologia — é o dado. 26 anos de classificações NCM, cálculos e followup são a base de treinamento que nenhum concorrente tem.

---

# 2. O princípio que organiza tudo

> *"A pergunta não é 'quando consigo reescrever o PGDI?'. A pergunta é: 'o que posso entregar ao cliente da INDAIA na próxima semana?'"*
> — Parecer Final da Banca, aplicando Martin Fowler

Esta inversão é a decisão mais importante do projeto, e é a que se perde quando o roadmap é lido apenas como uma sequência de fases técnicas.

**Walking Skeleton** — antes de qualquer reescrita de módulo, colocar em produção uma implementação end-to-end mínima que atravessa todas as camadas sem quebrar nada:

> Um processo de exportação entra. O Agente 10 confirma que há allocation no contrato MQC. O Agente 09 submete o booking ao armador via INTTRA e confirma em 30 minutos. O cliente recebe um push: *"Booking confirmado para o MSC Maeva, ETD 15/04. VGM cutoff: 12/04."*
> — sem o analista abrir o INTTRA. **Semana 8.**

Regra de corte para qualquer sprint: *se eu entregar isso na sexta, o que o cliente consegue fazer na segunda que não conseguia antes?* Se a resposta for "nada visível ainda", o sprint está errado. Nenhum sprint de fundação invisível por mais de 2 semanas.

---

# 3. As quatro decisões de escopo — e por quê

**1. DUIMP-only. A DI legada sai do escopo.**
A INDAIA já opera 100% em DUIMP. Reescrever o PGDI seria trabalho para o passado. Elimina ~36 semanas (~9 meses), ~R$ 230.000, e o maior risco fiscal do projeto — o Portal Único (RFB) calcula os impostos, o Python nunca reimplementa `sp_di_calculo`. Histórico de DIs permanece acessível como arquivo somente leitura.

**2. Booking (Ag 09) e Allocation/MQC (Ag 10) entram na Fase 2, não na Fase 6.**
Agentes e núcleo de exportação são camadas distintas. Os agentes automatizam o fluxo **sobre** o Delphi existente — não substituem nada. Na Fase 6 eles já estarão maduros; a integração será só exposição REST, sem retrabalho. O analista para de fazer booking manual 18+ meses antes do que no plano original.

**3. Duas verticais paralelas — Exportação e Importação.**
Times independentes a partir da fundação. Reduz o caminho crítico e deixa claro para cada dev o que é do seu time.

**4. Strangler Fig — o Delphi nunca para.**
Cada módulo Python nasce em paralelo, é testado, e o cutover é feito **cliente por cliente**, com rollback possível em menos de 5 minutos via feature flag. O Delphi desliga quando a equipe preferir o Python — não por decreto nem por data.

> **O enquadramento correto de cada serviço** (Pedro Souza, banca):
> O booking-service não existe para substituir o `minibrowser.pas`. Ele existe para responder: *"posso garantir que vamos cumprir o contrato MQC com a Maersk este mês?"*
> Serviços organizados em torno de perguntas que a operação faz — nunca em torno de módulos legados que eles substituem.

---

# 4. O que o cliente percebe, e quando

Os clientes da INDAIA não precisam saber que existe uma migração de Delphi para Python. Cada marco abaixo é uma conversa comercial: *"olha o que a INDAIA passou a fazer pelo seu processo."*

| Semana | O cliente passa a... |
| --- | --- |
| 8 | receber push quando o navio chega, sem ter ligado pedindo |
| 12 | ter o booking de exportação confirmado sem o analista entrar no INTTRA |
| 14 | ter NCM de produto novo classificado em 1 minuto |
| 18 | fazer upload de Invoice e ver os campos preenchidos sozinhos |
| 24 | acessar timeline visual e perguntar em linguagem natural |
| 28 | (gestor) ver compliance MQC por armador em tempo real, sem Excel |
| 32 | ter DUIMP transmitida com preenchimento assistido por IA |

---

# 5. Como medir

A banca rejeita métrica técnica como critério primário. O que conta é o que o cliente sente.

| Métrica | Hoje | Meta 12 meses | Meta 24 meses |
| --- | --- | --- | --- |
| Chamadas inbound de clientes pedindo status | baseline a medir | −40% | −80% |
| Notificações proativas por semana | 0 | 50+ | 500+ |
| Bookings feitos pelo Agente 09 | 0% | >70% | >95% |
| Compliance MQC | sem visibilidade | dashboard tempo real | alertas preditivos 30 dias |
| Tempo de abertura DUIMP | 45–60 min | < 15 min | < 5 min |
| Horas de digitação manual / analista / dia | 8h | 3h | < 1h |
| Taxa de erro em NCM | ~3% | < 1% | < 0,3% |
| NPS dos clientes | baseline a medir | +10 pontos | +25 pontos |
| Credenciais expostas | SA/123 hardcoded | ZERO | ZERO |

> **Indicador norte**
> Quantas vezes um cliente da INDAIA foi avisado sobre algo **antes** de precisar ligar para saber?
> Hoje esse número é zero. Na semana 8 deve ser maior que zero. Na semana 52 deve ser a norma.

---

# 6. Limites inegociáveis

- **Nenhum ato aduaneiro é automático.** DUIMP e DU-E sempre exigem revisão humana + certificado digital A3. Sem threshold, sem exceção.
- **Toda decisão de agente é auditável** — input, output, confiança, aprovador.
- **Nunca falha em silêncio.** Erro ou timeout escalona para humano.
- **A credencial SA (`sa`/`123`, hardcoded em 15+ arquivos ASP) é rotacionada na Semana 1.** Sem negociação de prazo.
- **Migração cliente a cliente**, sempre com rollback. Nunca todos de uma vez.

---

# 7. O que NÃO fazer

- Não planejar a arquitetura final antes do Walking Skeleton estar em produção. Todo planejamento anterior a feedback real é especulação.
- Não contratar time grande antes de validar o Walking Skeleton. 1 dev Python sênior cobre os 3 primeiros sprints.
- Não migrar todos os clientes de uma vez. O risco de 1 cliente reclamar é 100x menor que o de todos reclamarem juntos.
- Não desligar o Delphi por data.
- Não reimplementar `sp_di_calculo` ou `sp_calc_*` em Python. Nunca tente replicar 26 anos de regras fiscais em código.

---

# 8. Prazo e custo

~100 semanas (~24 meses) com 2 desenvolvedores Python sênior; ~R$ 640.000. Contra o plano original com DI legada: ~136 semanas e ~R$ 870.000 — economia de ~36 semanas e ~R$ 230.000.

⚠️ **Divergência a reconciliar:** as fases detalhadas no §9 do PVD v4 somam ~90 semanas, não as ~100 declaradas no próprio quadro comparativo do documento. Provável mistura de semanas-calendário com semanas-homem de 2 times em paralelo. **Fechar esse número antes de usar em proposta comercial.**

---

# 9. As 5 ações desta semana

1. **Rotacionar a senha SA do SQL Server INDAIA10.** Hoje. Único item sem negociação.
2. **Contratar 1 desenvolvedor Python sênior** (FastAPI + LangGraph). O projeto inteiro depende dessa pessoa.
3. **Contatar a INTTRA** para credenciais de API REST. A dependência de RPA é o maior risco técnico atual.
4. **Definir o cliente piloto** do Walking Skeleton — o mais comunicativo e tolerante a bugs.
5. **Sessão de 2h com os analistas operacionais**: quais processos de exportação hoje exigem acesso manual ao INTTRA? Essa lista vira o backlog do Agente 09.

---

# Anexo — Inconsistências detectadas no PVD v4.0

Para correção na próxima revisão do PVD:

1. **§5.2** tem o cabeçalho "Agentes da Vertical Exportação" mas contém o Agente 04 (NCM), que a tabela-índice do próprio v4 (§4.1) marca como TRANSVERSAL.
2. **§5.3** "Vertical Importação" contém o Agente 03, que o índice do v4 (§4.1) marca TRANSVERSAL. Índice e corpo se contradizem — a `Especificacao_10_Agentes_IA_COMEX_v2` desempata: Agente 03 é IMPORTAÇÃO, ou seja, o corpo está certo e o índice errado.
3. **Fases 0 e 1 sobrepostas:** §9.1 põe a Fase 0 na "Semana 1" e §9.2 põe a Fase 1 em "Semanas 1–10".
4. **Fase 5:** §9.6 indica semanas 47–62 (16 semanas) enquanto o texto da mesma seção diz "14 semanas (era 20 sem com DI Legada)".
5. **Total de semanas:** as fases de §9 somam ~90 semanas; o quadro comparativo ao fim de §9 declara ~100.
6. **A camada estratégica (Fowler / Walking Skeleton / entrega por valor) não aparece no v4** — é a lacuna que motivou este documento.
