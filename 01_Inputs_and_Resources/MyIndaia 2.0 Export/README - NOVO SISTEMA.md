# indaia — Sistema de Gestão de Comércio Exterior

> Plataforma SaaS completa para gestão de processos de importação e exportação, com assistente de IA integrado.

---

## Visão Geral

O **indaia** é um sistema web voltado para operações de comércio exterior (COMEX). Centraliza o gerenciamento de processos, clientes, documentos e digitalização de arquivos, com painel de BI em tempo real e assistente inteligente (**indaIA**) para suporte operacional.

---

## Stack Tecnológica

### Frontend
| Tecnologia | Versão | Uso |
|---|---|---|
| React | 19 | UI Framework |
| TypeScript | 5.8 | Tipagem estática |
| Vite | 6.2 | Build tool |
| Tailwind CSS | 4.1 | Estilização |
| shadcn/ui (base-nova) | — | Componentes |
| React Router | 7 | Roteamento SPA |
| Recharts | 3.8 | Gráficos e dashboards |
| Motion | 12 | Animações |
| Lucide React | — | Ícones |

### Backend
| Tecnologia | Versão | Uso |
|---|---|---|
| FastAPI | 0.115 | API REST |
| Uvicorn | 0.30 | Servidor ASGI |
| Supabase Python | 2.7 | Banco de dados e autenticação |
| Pydantic | 2.8 | Validação de dados |

### Infraestrutura
- **Banco de dados & Auth:** Supabase (PostgreSQL)
- **IA:** OpenAI Responses API (com fallback local no backend quando não houver chave)
- **Deploy Frontend:** Netlify
- **Deploy Backend:** Render (ASGI/Uvicorn)

---

## Funcionalidades

### Dashboard BI
- KPIs de processos ativos, faturamento mensal, clientes e documentos
- Gráfico de evolução de processos vs faturamento (6 meses)
- Distribuição de processos por tipo de serviço (pizza chart)
- Filtros por unidade e período

### Processos
- Cadastro e acompanhamento de processos de importação/exportação
- Numeração automática (`PRC-YYYY-NNN`)
- Vinculação com clientes, serviços e documentos
- Modal de edição completo com múltiplas abas

### Digitalização
- Upload e organização de arquivos por processo, pedido ou outros
- Filemanager integrado
- Controle de arquivos excluídos
- Registro de criador, data de criação e último alterador

### Clientes
- Cadastro completo de importadores, exportadores e parceiros
- CNPJ/CPF com formatação automática
- Endereço completo com busca por CEP
- Papéis configuráveis (Comprador, Seguradora, Agente, etc.)

### Serviços
- Catálogo de serviços prestados com preço base
- Status ativo/inativo
- Tipos pré-definidos de COMEX (Exportação Marítima, Aérea, Rodoviária, Importação, etc.)

### Documentos
- Gestão de arquivos vinculados a processos
- Suporte a PDF, imagens e outros formatos
- Controle de tipo, tamanho e data de upload

### indaIA (Assistente Inteligente)
- Chat integrado com OpenAI (com fallback local no backend)
- Respostas sobre o sistema e operações COMEX
- Nova conversa a qualquer momento

### Usuários & Controle de Acesso
- 5 níveis de permissão: `admin`, `gestor`, `analista`, `assistente`, `auxiliar`
- Controle granular por seção do sistema
- Troca de senha obrigatória no primeiro acesso
- Bloqueio de conta por tentativas falhas

---

## Estrutura do Projeto

```text
indaia/
├── frontend/                      # Aplicacao React (Vite)
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Agentes.tsx
│   │   │   ├── Areas.tsx
│   │   │   ├── Clientes.tsx
│   │   │   ├── Configuracoes.tsx
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Despachantes.tsx
│   │   │   ├── Digitalizacao.tsx
│   │   │   ├── Documentos.tsx
│   │   │   ├── EmpresaEstrangeira.tsx
│   │   │   ├── GrupoClientes.tsx
│   │   │   ├── IndaIA.tsx
│   │   │   ├── Login.tsx
│   │   │   ├── Processos.tsx
│   │   │   ├── Servicos.tsx
│   │   │   ├── Tabelas.tsx
│   │   │   ├── TransportadorRodoviario.tsx
│   │   │   ├── Usuarios.tsx
│   │   │   ├── scene-sea-bg.jpg
│   │   │   ├── sea-ship.png
│   │   │   ├── scene-road-bg.jpg
│   │   │   ├── road-truck.png
│   │   │   ├── scene-sky-bg.jpg
│   │   │   └── sky-plane.png
│   │   ├── lib/
│   │   │   ├── api.ts
│   │   │   ├── AuthContext.tsx
│   │   │   ├── brasil.ts
│   │   │   ├── cadastros.ts
│   │   │   ├── formats.ts
│   │   │   ├── pageCache.ts
│   │   │   ├── permissions.ts
│   │   │   ├── SettingsContext.tsx
│   │   │   ├── supabase.ts
│   │   │   └── utils.ts
│   │   ├── components/
│   │   │   └── DynamicTable.tsx
│   │   ├── App.tsx
│   │   └── index.css
│   ├── netlify.toml
│   ├── vite.config.ts
│   ├── package.json
│   └── package-lock.json
│
├── backend/                       # API FastAPI
│   ├── main.py
│   ├── permissions.py
│   ├── security.py
│   ├── routes/
│   │   ├── assistente.py
│   │   ├── clientes.py
│   │   ├── dashboard.py
│   │   ├── documentos.py
│   │   ├── eventos.py
│   │   ├── processos.py
│   │   ├── servicos.py
│   │   └── usuarios.py
│   ├── models/
│   ├── services/
│   ├── sql/
│   └── requirements.txt
│
├── docs/
├── Processos.tsx                  # arquivo legado na raiz
├── Tabelas.tsx                    # arquivo legado na raiz
└── README.md
```

---

## Configuração e Instalação

### Pré-requisitos
- Node.js 18+
- Python 3.11+
- Conta no [Supabase](https://supabase.com)
- Chave de API da OpenAI (opcional, recomendada para respostas avançadas do indaIA)

### Frontend

```bash
cd frontend
npm install
```

Crie o arquivo `.env` na pasta `frontend/`:

```env
VITE_API_URL=http://localhost:8000
VITE_SUPABASE_URL=https://sua-url.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon
```

```bash
npm run dev       # Desenvolvimento (porta 3000)
npm run build     # Build de produção
```

### Backend

```bash
cd backend
pip install -r requirements.txt
```

Crie o arquivo `.env` na pasta `backend/`:

```env
APP_ENV=development
FRONTEND_URL=http://localhost:3000
ALLOWED_ORIGINS=http://localhost:3000,http://127.0.0.1:3000
LOG_LEVEL=INFO

SUPABASE_URL=https://sua-url.supabase.co
SUPABASE_SERVICE_KEY=sua-service-role-key
SUPABASE_DOCUMENTOS_BUCKET=documentos

OPENAI_API_KEY=sua-chave-openai
OPENAI_MODEL=gpt-4o-mini
OPENAI_TIMEOUT_SECONDS=20
```

```bash
uvicorn main:app --reload --port 8000
```

### Observação para PowerShell no Windows

Se o `npm` falhar com erro de `ExecutionPolicy`, rode:

```bash
cmd /c npm run dev
```

Esse projeto já está validado com frontend em `http://localhost:3000` e backend em `http://localhost:8000/docs`.

---

## Deploy

### Frontend — Netlify

O projeto já possui `netlify.toml` configurado. Basta conectar o repositório no Netlify:

- **Base directory:** `frontend`
- **Build command:** `npm install && npm run build`
- **Publish directory:** `dist`

Configure as variáveis de ambiente no painel do Netlify (**Site Settings → Environment Variables**).

### Backend

Suba o backend no Render (servico Python com ASGI/Uvicorn):

```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

---

## Controle de Acesso

| Seção | admin | gestor | analista | assistente | auxiliar |
|---|:---:|:---:|:---:|:---:|:---:|
| Dashboard | ✅ | ✅ | ✅ | ✅ | ✅ |
| indaIA | ✅ | ✅ | ✅ | ✅ | ✅ |
| Processos | ✅ | ✅ | ✅ | ✅ | — |
| Digitalização | ✅ | ✅ | ✅ | ✅ | ✅ |
| Clientes | ✅ | ✅ | ✅ | — | — |
| Serviços | ✅ | ✅ | ✅ | — | — |
| Documentos | ✅ | ✅ | ✅ | ✅ | ✅ |
| Usuários | ✅ | ✅ | — | — | — |
| Configurações | ✅ | ✅ | ✅ | ✅ | ✅ |

---

## Tema

O sistema utiliza tema **escuro por padrão**, com paleta própria:

| Token | Cor | Uso |
|---|---|---|
| `indaia-navy` | `#0a1128` | Sidebar, fundo |
| `indaia-blue` | `#6fa8dc` | Destaque, botões, links ativos |

O modo claro também está disponível via **Configurações** do sistema.

---

## Atualizações Recentes (31/03/2026)

- Menu lateral reorganizado:
  - `Digitalização` removido do menu lateral.
  - `Documentos` removido do menu lateral.
  - `Tabelas` removido de dentro de `Cadastros` (permanece como item do menu pai).
  - `Relatórios` reativado como módulo placeholder (sem backend), com mensagem padrão de módulo preparado.
- Tabelas > Fatores:
  - Aba `Fatores` deixou de ser apenas texto explicativo.
  - Inclusão de layout ilustrado com criação de regra, tabela de regras e blocos visuais de condições/ações.
- Eventos:
  - Correções de títulos com problemas de OCR/acentuação em `cadastros.ts`.
  - Estrutura de dados de eventos atualizada para suportar `observacao_followup`.
  - Tela de `Eventos > Dados Básicos` ajustada para o padrão operacional (código, ativo, descrições, observação automática e flag ativar).
- Processos (Dark Mode):
  - Refino visual para contraste e legibilidade da janela de abertura de processo no modo escuro (`process-modal-dark`).
- Estabilidade de sessão/rede:
  - `apiFetch` agora possui timeout global de 15s e erro amigável para evitar spinner infinito em telas como Processos quando a sessão/conexão fica inconsistente.
- Menu atualizado:
  - `Taxas` removido do menu pai e movido para dentro do grupo `Cadastros`.
- Cadastros > Tabelas:
  - Layout refatorado para workflow visual conforme estrutura enviada:
    - Empresas (Agentes, Áreas, Empresa Nacional, Empresa Estrangeira, Despachantes, Grupo Clientes, Transportador)
    - Enquadramento
    - Local de Embarque/Desembarque
    - Armazéns
    - Embarcação
    - Família de Produtos
    - Feriados
    - Mercadorias (Exportação)
    - Moeda
    - NCM
    - Observações DUE
    - País
    - Via de Transporte
    - Cadastro de Viagens
    - Posição de Navios
  - Painel direito com formulário ilustrado e fluxo visual para cada item do workflow.
- Correção:
  - `Tabelas.tsx` restaurado para o layout funcional de Tabelas (abas Unidades, Produtos, Serviços, Eventos e Fatores), removendo a implementação equivocada de workflow de páginas individuais dentro desta tela.
- Menu Cadastros refatorado para workflow em páginas individuais (fora de Tabelas):
  - `Empresas` (submenu): Agentes, Áreas, Empresa Nacional, Empresa Estrangeira, Despachantes, Grupo Clientes, Transportador.
  - Itens diretos: Enquadramento, Local de Embarque/Desembarque, Armazéns, Embarcação, Família de Produtos, Feriados, Mercadorias (Exportação), Moeda, NCM, Observações DUE, País, Via de Transporte, Cadastro de Viagens, Posição de Navios.
  - Todos os itens de `/cadastros/*` navegam para páginas individuais placeholder no layout atual.
- Cadastros (páginas individuais):
  - Adicionada opção de visualização `Kanban` além do modo `Padrão` nas páginas placeholder de `/cadastros/*`.
- Visualização global de módulos (SaaS):
  - Modo `Padrão` e `Kanban` agora reutilizável via componente único (`ModuleViewPage`).
  - Persistência em `localStorage` (`indaia_saas_view_mode`) para manter preferência entre módulos.
  - Aplicado aos módulos placeholder: Movimentos, Relatórios, Taxas, Outros, Integrações, Wallet, Ajuda e páginas individuais de `/cadastros/*`.

## Atualizações Recentes (01/04/2026)

- Menu `Cadastros`:
  - `Clientes` mantido/recolocado dentro do submenu de `Cadastros` (atalho para rota `/clientes`).
  - Ajuste de consistência para evitar divergência entre ambiente local e deploy.
- Tabelas no menu lateral:
  - `Tabelas` convertido para grupo com submenu igual aos demais módulos.
  - Subitens: `Unidades`, `Produtos`, `Serviços`, `Eventos`, `Fatores`.
  - Navegação por URL com `?tab=` para abrir diretamente cada subaba (ex.: `/tabelas?tab=eventos`).
- Navegação principal refatorada para menu horizontal fixo no topo (estilo legado em cascata):
  - Itens pai exibidos em barra superior fixa.
  - Submenus em cascata por hover/click (incluindo 3º nível em `Cadastros > Empresas`).
  - Estrutura funcional preservada (apenas alteração de layout/navegação).
- Correção do menu horizontal (01/04/2026):
  - Reativados os acessos de `Configurações` e `Sair` no topo.
  - Ajustado comportamento do menu cascata para permitir clique consistente nos submenus.
- Correção de funcionamento dos menus em cascata (01/04/2026):
  - Ajustado container da barra superior para não cortar/bloquear os dropdowns.
  - Submenus agora funcionam com clique e hover de forma estável (incluindo 3º nível).

- Refatoração final do menu superior (01/04/2026):
  - Reescrito o componente de navegação horizontal para comportamento estável e profissional.
  - Menus em cascata com abertura por hover/click e fechamento ao clicar fora.
  - Links de todos os níveis corrigidos para navegação consistente.


- Ajuste final do menu superior (01/04/2026):
  - Correção de acentuação e textos do menu (Relatórios, Integrações, Áreas, etc.).
  - Menu pai em comportamento de cascata profissional (abre submenu); itens finais fazem a navegação.

- Ajuste de cascata estilo clássico (01/04/2026):
  - Removido corte do container do menu topo (overflow) para não ocultar submenus.
  - Submenus em bloco retangular com abertura contínua para a direita (comportamento estilo Windows antigo).

- Tema Dark unificado pela paleta da Digitalização (01/04/2026):
  - Definida paleta global azul escuro para todo o sistema (background, superfícies, bordas e textos).
  - Overwrites de classes slate/zinc/white ajustados para manter consistência visual no modo dark.

- Ajuste de posicionamento e identidade no topo (01/04/2026):
  - Menu horizontal movido para logo abaixo do header, removendo o espaço vazio entre barras.
  - Logo/identidade da empresa reintroduzida no header (indaia + logística internacional).

- Ajuste de posicionamento na tela de Clientes (01/04/2026):
  - Conteúdo inicial da página deslocado para baixo (pt-3 sm:pt-4) para evitar sobreposição do botão principal com a barra fixa do topo.

- Correção global de sobreposição com menu topo (01/04/2026):
  - Espaçamento superior do conteúdo principal ajustado no layout global (main) para evitar que a barra de menu cubra botões/títulos em qualquer módulo.
  - Removido ajuste local de Clientes para centralizar a solução no layout.

- Ajuste de Tabelas com seleção por menu superior (01/04/2026):
  - Correção de textos com acentuação na tela de Tabelas.
  - Quando a tela é aberta por ?tab= (menu topo), o painel lateral interno de Tabelas é ocultado e só o conteúdo da aba selecionada é exibido.

- Tema Dark neutro profissional (01/04/2026):
  - Removida dominante azul do modo escuro com paleta grafite global.
  - Superfícies, bordas, hovers e modal de processos ajustados para dark neutro com melhor legibilidade.
- Tabelas com páginas específicas (01/04/2026):
  - Novas rotas: /tabelas/unidades, /tabelas/produtos, /tabelas/servicos, /tabelas/eventos, /tabelas/fatores.
  - Menu superior de Tabelas aponta para as rotas específicas.
  - Ao entrar por rota específica, a tela mostra somente o conteúdo da seção selecionada (sem painel lateral duplicado).

- Dark mode estilo premium (01/04/2026):
  - Página indaIA reestilizada com fundo grafite escuro e superfícies de alto contraste (sem cinza lavado).
  - Ajuste global de classes com opacidade (`bg-slate-50/40`, `bg-white/10`, etc.) para impedir tons claros no modo dark.

- Dark mode global (01/04/2026):
  - Tema escuro aplicado de forma sistêmica no frontend (não apenas no módulo indaIA).
  - Paleta dark neutralizada em `index.css` para todas as páginas: fundos, cards, tabelas, modais, menus e formulários.
  - Incluídos overrides adicionais para variações com opacidade e classes legadas em hexadecimal, evitando superfícies acinzentadas no dark.

- Kanban em módulos com backend (01/04/2026):
  - Modo `Padrão/Kanban` habilitado também em telas com dados reais da API.
  - Aplicado em: `Processos`, `Clientes`, `Serviços` e `Documentos`.
  - Preferência de visualização persistida em `localStorage` (`indaia_backend_view_mode`).

- Menu cascata com rolagem (01/04/2026):
  - Submenus extensos do topo agora possuem barra de rolagem vertical no lado direito.
  - Aplicado no 1º e 2º níveis de dropdown para permitir acesso aos itens finais sem corte.
  - Ajustado para evitar barra horizontal no rodapé do menu (scroll apenas vertical no painel de lista).
  - Corrigida herança de `whitespace-nowrap` no dropdown, eliminando overflow horizontal em itens longos.
  - Estrutura do cascata refinada: painel rolável principal e submenu lateral desacoplados, preservando abertura de `Empresas` sem bloquear a navegação dos demais itens.
  - Ajuste final de estabilidade: altura máxima fixa com `overflow-y-auto` no menu principal e submenu lateral (`max-h: 420px`), com `scrollbar-gutter: stable` para manter a barra no lado direito sem quebrar navegação.
  - Correção do hover/click em item com filho (`Empresas`) para abrir submenu lateral de forma consistente, com cálculo de posição pelo item real e sem dependência de evento global.
  - Lista principal com rolagem vertical forçada e comportamento contido (`overflow-y-scroll` + `overscroll-behavior: contain`) para manter a barra visível no lado direito.


- Clientes - navegacao por abas (02/04/2026):
  - Tela de cadastro de Clientes saiu do modo unificado e voltou para modo por abas.
  - Abas ativas no topo do formulario: `Lista`, `Dados Basicos`, `Obs.Particulares`, `Habilitacao`, `Armazenagem`, `Despachantes Responsaveis`, `DI - Parametros`, `Extras`.
  - Inclusa secao inicial de `Despachantes Responsaveis` no layout novo para seguir o fluxo legado.

- Clientes - Aba Dados Basicos alinhada ao print legado (02/04/2026):
  - Mantidos apenas os campos visiveis no print de referencia da aba `Dados Basicos`.
  - Removidos da lateral os blocos extras que estavam fora do escopo (MP164, confere NF, emissao de fatura e opcoes adicionais).
  - Lateral da aba com marcacoes: `Cliente`, `Nao Cliente`, `Importador`, `Exportador` e `Representante`.

- Clientes - Aba Obs.Particulares ajustada ao modelo legado (02/04/2026):
  - Bloco superior `Cliente` com codigo e nome/apelido em campos somente leitura.
  - Area grande de `Observacoes` logo abaixo, sem elementos extras na aba.

- Clientes - Aba Habilitacao (02/04/2026):
  - Estrutura refeita para sub-abas internas: `Lista`, `Dados Basicos`, `Cobranca / Fatura`, `Outros`.
  - Na sub-aba `Lista`: bloco de cliente no topo, checkbox `Mostrar Inativos` e grade `Unidade de Negocio / Produto / Ativo`.
  - Sub-abas `Dados Basicos`, `Cobranca / Fatura` e `Outros` deixadas no layout para preenchimento da proxima etapa.

- Clientes - Habilitacao > Dados Basicos (02/04/2026):
  - Campos incorporados conforme print legado (ignorando blocos em preto): Cliente, Atendente, Ativo, Unidade, Produto, Tab.SDA, Modelo de Numerario, Procuracoes/E-cac (validade), RADAR Val.
  - Botoes `Servico` e `Contato` implementados na sub-aba para abrir janelas dedicadas.
  - Janelas `Vincular Servico` e `Vincular Usuario de Contato` adicionadas como base visual para a proxima etapa de regras.

- Clientes - Habilitacao > janela Servico e Representante (02/04/2026):
  - Janela `Vincular Servico` refeita no padrao do legado com abas `Lista` e `Dados Basicos`.
  - Na aba `Lista`: grade `Cod. / Servico / Ativo`, bloco de observacao e filtro `Mostrar Inativos`.
  - Na aba `Dados Basicos`: campos visiveis do anexo (Servico, Incide SDA, Ativo, Prefixo p/ Processo), ignorando areas em preto.
  - Botao `Representante` no rodape da janela de servico abrindo popup de vinculo de empresas.
  - Popup de representante lista somente clientes com flag `Representante` marcada.

- Cadastros -> Empresas -> Empresa Estrangeira (02/04/2026):
  - Nova pagina dedicada em /cadastros/empresas/empresa-estrangeira, mantendo o fluxo dentro de Cadastros -> Empresas.
  - Visual incorporado no padrao legado do anexo: barra superior de acoes (Incluir/Salvar/Cancelar/Excluir/Sair), abas Lista e Dados Basicos, filtro de Produto, checkbox Mostrar Inativos e grade principal.
  - Grade da Lista com colunas: Codigo, Descricao, Apelido, Ativo e Cod. no Cliente.
- Empresa Estrangeira - acao Novo/Incluir (02/04/2026):
  - Ao clicar em `Incluir`, a tela abre o formulario detalhado na aba `Dados Basicos` conforme anexo legado.
  - Campos incorporados (ignorando areas em preto): codigo, descricao, ativo, apelido, pais, endereco, numero, complemento, cidade, estado, telefone, contato, data inclusao, RUC, NIT, CUIT, tipo do cadastro e cod. no cliente.
  - Mantido bloco inferior de grupos vinculados no layout.
- Cadastros -> Empresas -> Despachantes (02/04/2026):
  - Pagina dedicada criada para /cadastros/empresas/despachantes com visual legado do anexo (abas Lista e Dados Basicos, barra superior de acoes e pesquisa/ordem).
  - Aba Lista com grade: Codigo, Nome, Apelido e Ativo.
  - Ao clicar em Incluir/Novo, a aba Dados Basicos abre com os campos do segundo anexo (ignorando blocos em preto): Codigo, Nome, Apelido, Ativo, Valor Minimo SDA, Valor Maximo SDA, Cod. Despachante, CPF e Modelo de SDA.
- Empresa Estrangeira - botao Sair (02/04/2026):
  - Botao `Sair` corrigido para executar navegacao e retornar para `/clientes`.
- Login - background animado com identidade visual (02/04/2026):
  - Fundo da tela de login atualizado para visual claro com animacao em ciclo (mar/navio, estrada/caminhao e ceu/aviao).
  - Movimento continuo e nao estatico, mantendo tons de azul alinhados ao sistema e foco de legibilidade no card de acesso.
- Login - melhoria visual com imagens reais (02/04/2026):
  - Cenarios em transicao substituidos por fotos reais (navio no mar, caminhao na estrada e aviao em voo).
  - Mantida a transicao em ciclo e adicionado efeito cinematografico suave (ken burns), preservando identidade em tons de azul.
- Login - cenarios cartoon com assets locais (02/04/2026):
  - Cenarios do login convertidos para ilustracao/cartoon (mar/navio, estrada/caminhao e ceu/aviao) em SVG local.
  - Mantida a transicao em ciclo com movimento suave e sem dependencia de imagens externas.
- Login - troca de background do oceano (02/04/2026):
  - Cenario de mar no ciclo do login atualizado para usar imagem fornecida pelo usuario (`scene-sea.jpg`).
- Login - troca de background da estrada (02/04/2026):
  - Cenario de estrada no ciclo do login atualizado para usar imagem fornecida pelo usuario (`scene-road.jpg`).
- Login - troca de background do aeroporto (02/04/2026):
  - Cenario de aeroporto/aviao no ciclo do login atualizado para usar imagem fornecida pelo usuario (`scene-sky.jpg`).
- Login - estrada e caminhao customizados (02/04/2026):
  - Cenario de estrada atualizado para imagem fornecida pelo usuario (`scene-road-bg.jpg`).
  - Caminhao da estrada atualizado para asset fornecido pelo usuario (`road-truck.jpg`) com animacao horizontal continua na cena road.
- Login - aeroporto e aviao customizados (02/04/2026):
  - Cenario de aeroporto atualizado para imagem fornecida pelo usuario (`scene-sky-bg.jpg`).
  - Aviao da cena sky atualizado para asset fornecido pelo usuario (`sky-plane.jpg`) com animacao horizontal continua.
- Login - oceano e navio atualizados (02/04/2026):
  - Cenario de mar atualizado para imagem enviada pelo usuario (`scene-sea-bg.jpg`).
  - Navio da cena sea atualizado para asset enviado pelo usuario (`sea-ship.jpg`) com animacao horizontal continua.
- Login - ajuste para upload manual no GitHub (02/04/2026):
  - Assets de login movidos de `frontend/public/login` para `frontend/public` para facilitar upload por arquivo no GitHub web.
  - Referencias de caminho atualizadas no `index.css`.
- Login - assets sem dependencia de pasta public (02/04/2026):
  - Cenarios e veiculos do login passaram a ser importados diretamente em `Login.tsx` a partir de `frontend/src/pages`.
  - Removida dependencia de caminhos absolutos `/public` para facilitar upload via GitHub web sem criar pastas novas.
- Login - ajuste de formato dos veiculos (02/04/2026):
  - Imports de navio, caminhao e aviao atualizados de JPG para PNG com fundo removido.
- Login - card de acesso fixo e escuro (02/04/2026):
  - Painel de login (usuario/senha) alterado para fundo escuro solido, sem acompanhar visualmente a transicao dos cenarios.
- Cadastros -> Empresas -> Agentes (06/04/2026):
  - Pagina dedicada criada em `/cadastros/empresas/agentes` com abas `Lista`, `Dados Basicos` e `Contato` no padrao legado.
  - Campos implementados conforme solicitacao (ignorando areas em preto): CNPJ (ate 14 alfanumerico), Razao Social, Apelido, Endereco, Cidade, U.F. (2 caracteres), Ativo e Observacoes.
  - Tentativa de auto-preenchimento habilitada para CNPJ numerico de 14 digitos via consulta externa (fallback para preenchimento manual em caso de indisponibilidade).
- Cadastros -> Empresas -> Areas (06/04/2026):
  - Pagina dedicada criada em `/cadastros/empresas/areas` com abas `Lista` e `Dados Basicos` no padrao legado.
  - Campos implementados conforme solicitacao: Descricao e Grupo Cliente (vinculo por selecao).
  - Regra de codigo da area aplicada: 2 digitos alfanumericos (A-Z/0-9), com letras sempre em maiusculo e geracao automatica no `Incluir`.
- Infra/Deploy (06/04/2026):
  - Backend oficial da aplicacao hospedado no Render.




- Cadastros -> Empresas -> Grupo de Clientes (08/04/2026):
  - Pagina dedicada criada em /cadastros/empresas/grupo-clientes no frontend, saindo do modulo generico.
  - Abas implementadas conforme anexo e orientacao: Lista, Dados Basicos, Gestao, Conta Bancaria (desconsiderada) e Disparo Automatico Email (com sub-abas Lista, Dados, Usuarios e subdivisao Email/Parametros).
  - Lista com colunas Codigo, Descricao, Ativo, filtro Mostrar Inativos, pesquisa e ordenacao.
  - Regra inicial de codigo para novo grupo habilitada no formato 1 letra + 2 numeros.
  - Dados Basicos com campos visiveis do anexo (codigo, inclusao, ativo, descricao, CNPJ, referencia padrao expo/impo).
  - Gestao com coordenadores, gestor de contas, flag de contrato e grade de reajuste de contrato.
  - Disparo Automatico de Email com estrutura de configuracao de assunto, modelo, anexos, parametros de regra e usuarios/horarios de envio.


- Cadastros -> Empresas -> Transportador Rodoviario (08/04/2026):
  - Pagina dedicada criada em /cadastros/empresas/transportador, saindo do modulo generico.
  - Abas implementadas conforme solicitado: Lista e Dados Basicos (demais desconsideradas).
  - Aba Lista com colunas Codigo, Nome, Nome Resumido, Ativo, incluindo pesquisa e ordenacao.
  - Aba Dados Basicos com campos visiveis do anexo (ignorando blocos em preto): codigo, nome, ativo, nome resumido, CNPJ, inscricao estadual, endereco, cidade, UF, pais e e-mail.



### 09/04/2026
- Inclusao de datasets em Enquadramento, Pais, Moeda, NCM e Embarcacoes.
- Embarcacao renomeada para Embarcacoes.
- Inclusao de Vias de Transporte.

### 10/04/2026
- Taxas em modelo de consulta estilo BACEN.
- Observacoes DUE operacional.
- Cadastro de Viagens operacional com DeadLines.
- Usuarios no fluxo de Configuracoes.

### 14/04/2026
- Integracao de ambiente: Netlify + Render + Supabase.
- Eventos em migracao para fonte backend/API.

### 15/04/2026
- Ajustes em modais de Clientes/Habilitacao.
- Busca local de apoio em Tabelas > Eventos.

### 16/04/2026
- Revisao geral de README para manter padrao completo e acumulado.
- Correcao de codificacao para evitar caracteres quebrados.

### 17/04/2026
- Eventos consolidados no backend FastAPI com rota dedicada (`/eventos`) e operacoes de listagem, criacao e atualizacao.
- Ajustes de SQL para cobertura de eventos legados em `backend/sql/2026-04-17_eventos_legado_faltantes.sql`.
- CORS e seguranca centralizados no backend com configuracao por variaveis de ambiente.

### 20/04/2026
- README atualizado para refletir o estado real do projeto:
  - variaveis de ambiente revisadas (frontend e backend);
  - stack de IA corrigida para OpenAI com fallback local;
  - estrutura do backend atualizada (rotas, SQL, seguranca e permissoes);
  - observacao de execucao para PowerShell no Windows.
- Frontend (`Empresa Nacional` via `Clientes.tsx`) padronizado visualmente:
  - aba `Habilitacao` revisada por completo (`Lista`, `Dados Basicos`, `Cobranca / Fatura`, `Outros`);
  - modais internos de vinculo ampliados para area util maior (quase tela cheia);
  - rolagens internas de grades corrigidas para funcionamento consistente;
  - criados tokens de classe reutilizaveis para manter padrao entre secoes, abas e botoes.
- Tabelas -> Eventos integrado ao backend/banco:
  - botao `Adicionar evento` agora depende de persistencia real (POST) e nao salva apenas localmente;
  - erros da API deixam de ser silenciosos e passam a ser exibidos na tela;
  - `Salvar` em `Dados Basicos` passou a atualizar por `id` do evento (compatível com backend atual);
  - tipo de evento no frontend atualizado para suportar `id` e `ordem`.
- Performance de carregamento em `Processos` otimizada:
  - cache de processos/clientes/servicos ampliado para reduzir reloads frequentes;
  - carregamento inicial prioriza `/processos` e adia chamadas auxiliares para reduzir concorrencia no cold start;
  - catalogo de eventos movido para carregamento sob demanda ao abrir modal;
  - buscas/render da lista passaram a usar mapas em memoria (`clientesById`/`servicosById`) para reduzir custo de render.
- Correcao de UX em `Editar Processo`:
  - coluna `Eventos / Follow-up` recebeu scroll interno funcional (nao estatico);
  - ajuste de `overflow`/`min-height` no modal para separar o scroll do corpo principal e o scroll da coluna lateral.
- Revisao gramatical e de acentuacao no frontend (Clientes / Empresa Nacional):
  - corrigidos rótulos e textos com codificação quebrada (ex.: `Razão Social`, `Papéis`, `Ações`, `Dados Básicos`, `Habilitação`, `Despachantes Responsáveis`);
  - normalizados labels, placeholders, mensagens de validação e nomes de serviços com acentuação correta em PT-BR;
  - padronizada a escrita das sub-abas e dos modais de vínculo para manter consistência visual e textual.
- Empresa Nacional - legibilidade e tela cheia (20/04/2026):
  - estrutura de `Cadastro de Empresa Nacional` ajustada para ocupar tela cheia real (`100vw` x `100vh`) no modal principal e nas sub-janelas de vínculo;
  - contraste reforçado em `Habilitação` (sub-abas, cabeçalho, grade e linhas), com tipografia maior para leitura;
  - botões e tabs internos padronizados para melhor clareza visual e consistência entre `Lista`, `Dados Básicos`, `Cobrança / Fatura` e `Outros`.
- Empresa Nacional - uso total da área útil nas guias (20/04/2026):
  - removida reserva lateral vazia nas abas sem sidebar (a largura total do modal agora é usada no conteúdo da guia ativa);
  - `Habilitação > Dados Básicos` expandido para preencher toda a largura disponível (campos e blocos sem coluna ociosa à direita);
  - barra de ações dessa sub-aba ancorada no rodapé do painel para manter ocupação vertical consistente.
- Cadastros -> Embarcações (22/04/2026):
  - adicionada coluna `Cód. Navio` para identificar cada embarcação com código próprio, separado do `Cód. Bandeira - País`;
  - código de navio gerado automaticamente no formato `NAV-00001`, `NAV-00002`, etc. para registros que ainda não possuíam identificador;
  - ordenação da listagem priorizada por `Navio / Embarcação`.
- Empresa Nacional -> Habilitação -> Dados Básicos (22/04/2026):
  - layout ajustado para seguir o print de referência;
  - primeira linha mantém `Cliente` + descrição, com `Mostrar Inativos` posicionado à direita;
  - segunda linha corrigida de `Cliente` para `Apelido`, mantendo `Atendente` e `Ativo` no mesmo alinhamento da referência.

### 22/04/2026
- Cadastros -> Embarcações:
  - inclusão da coluna `Cód. Navio` na grade;
  - geração automática de código por navio no padrão `NAV-00001`, `NAV-00002`, etc.;
  - separação explícita entre `Cód. Navio` e `Cód. Bandeira - País`.
- Empresa Nacional -> Habilitação -> Dados Básicos:
  - correção do layout conforme print de referência;
  - ajuste da segunda linha para `Apelido` (no lugar de `Cliente`), com `Atendente` e `Ativo` alinhados;
  - reposicionamento de `Mostrar Inativos` na primeira linha, à direita, no padrão esperado.
- Empresa Nacional (estrutura geral de modal):
  - correções de aproveitamento de área útil nas guias;
  - ajustes de legibilidade (contraste e tipografia) em Habilitação e sub-abas.
- Empresa Nacional -> Habilitação -> Lista (legibilidade):
  - grade da sub-aba `Lista` recebeu ajuste de contraste alto (cabeçalho, linhas e fundo da área da tabela);
  - texto das linhas e coluna `Ativo` reforçados para leitura em tema escuro.
- Empresa Nacional -> Habilitação -> Dados Básicos (correção de duplicidade):
  - removido bloco duplicado de `Cliente` e `Mostrar Inativos` que aparecia duas vezes na tela;
  - mantido apenas um cabeçalho de `Cliente` no topo da sub-aba, conforme fluxo esperado.
- Empresa Nacional -> Habilitação -> Dados Básicos (organização de layout):
  - removido o campo vazio/placeholder extra na linha de `Apelido`;
  - reorganizada a linha para melhor aproveitamento da largura (`Apelido`, `Atendente` e `Ativo` no mesmo bloco útil);
  - redução de “linhas mortas” para deixar a tela mais limpa em resoluções amplas.
- Cadastros -> Empresas -> Grupo de Clientes (Lista / Dados Básicos / Gestão):
  - corrigido fluxo de edição para não depender apenas de `Incluir`;
  - seleção de linha da `Lista` agora abre contexto real de edição em `Dados Básicos` e `Gestão`;
  - botões superiores `Salvar` e `Excluir` passaram a operar sobre os dados da grade local da tela;
  - `Disparo Automático de Email` também libera o formulário ao selecionar item existente (além de novo registro).
- Padronização global de CNPJ (22/04/2026):
  - todos os campos editáveis de CNPJ no frontend passaram a aceitar apenas números com máscara visual `00.000.000/0000-00`;
  - ajuste aplicado nos módulos `Clientes`, `Agentes`, `Transportador Rodoviário` e `Grupo de Clientes`;
  - consulta automática de CNPJ em `Agentes` agora valida estritamente 14 dígitos numéricos.
- Outros -> Usuários (22/04/2026):
  - tela de `Usuários` refeita no padrão legado (abas `Lista`, `Dados Básicos` e `Habilitação`);
  - `Dados Básicos` com suporte a `código` de usuário, apelido/login, cargo, supervisor, aprovador, flags de operação e campos de grupo/idioma;
  - `Habilitação` com sub-abas `Lista`, `Dados Básicos` e `Permissões - myIndaia Web`;
  - inclusão de sincronização de códigos para usuários existentes (`POST /usuarios/sincronizar-codigos`);
  - novas rotas de backend para habilitações e permissões web:
    - `GET/POST /usuarios/{user_id}/habilitacoes`
    - `PUT/DELETE /usuarios/{user_id}/habilitacoes/{habilitacao_id}`
    - `GET/PUT /usuarios/{user_id}/permissoes-web`
  - migração SQL adicionada para banco Supabase: `backend/sql/2026-04-22_usuarios_legado_habilitacao.sql`.
  - código fixo do usuário `wagner.junior` configurado como `2330` (regra no backend + update na migração SQL).
  - navegação principal ajustada para fluxo em cascata `Outros -> Usuários` (menu lateral e menu horizontal), sem mover `Configurações` para dentro de `Outros`.
  - listagem de usuários ajustada para aplicar código fixo do `wagner.junior` (`2330`) mesmo quando o campo vier vazio no banco, garantindo exibição imediata na grade.

### 26/04/2026
- Tabelas -> Serviços -> Eventos Padrão:
  - adicionada visão de Eventos Selecionados com ordenação por arrastar e soltar;
  - ordem definida pelo administrador agora é persistida no backend para cada serviço;
  - comportamento visual de drag/drop refinado para padrão mais clean e estável.
- Backend de Serviços/Follow-up:
  - ao salvar eventos padrão de um serviço, processos já existentes desse serviço passam por sincronização automática de follow-up;
  - sincronização cobre: reordenação, inclusão de novos eventos e remoção de eventos retirados do padrão;
  - dados já preenchidos dos eventos mantidos (data, usuário e status) são preservados durante a sincronização.
- Processos -> Gestão de Processos (UX e densidade visual):
  - coluna de Follow-up compactada para reduzir altura de linhas e melhorar aproveitamento da tela;
  - data e usuário no Follow-up ajustados para evitar corte e manter alinhamento horizontal consistente;
  - área de dados do processo ampliada no layout, reduzindo necessidade de rolagem vertical;
  - campos de identificação/cliente/serviço refinados com grid alinhado (incluindo Código Cliente, Rep. Cód., Área e Tipo de Estufagem).
- Processos -> Modal:
  - criado modo compacto de formulário (process-modal-compact) com redução de altura/padding de inputs, selects e textareas;
  - labels e espaçamentos ajustados para manter legibilidade com maior densidade de informação.
- Navegação principal:
  - item indaIA reposicionado para ficar após Wallet e antes de Ajuda (menu superior e menu lateral).
- Login (ambiente local):
  - configuração de .env do frontend alinhada para evitar falha de sessão por chave anon ausente/placeholder.

### 27/04/2026
- Cadastros -> Empresas -> Empresa Nacional:
  - campo `Grupo` da aba `Dados Básicos` transformado em um combobox moderno/busca inteligente (autocomplete).
  - usuários agora podem digitar o código ou a descrição do grupo para realizar uma busca em tempo real.
  - resultados de busca e seleção interligados com a base de dados de `Grupo de Clientes`.
  - estilização aprimorada (destaque em pill para o código) descartando a interface de "dropdown" nativo do navegador para maior fluidez e design profissional.
- Clientes (Inativação / Reativação):
  - adicionada alternativa segura ao delete para clientes vinculados a processos legados via constraint FK.
  - implementados botões `Inativar` / `Ativar` em cards e linhas da tabela de clientes (conforme status `ativo`).
  - campo `ativo` já suportado pelo backend (`PUT /clientes/{id}`) agora totalmente integrado ao frontend.
  - modal de cadastro mantém-se aberta após salvar dados, permitindo edição continuada e acesso ao toggle de status.
  - formulário detecta automaticamente mudanças (dirty state) e habilita o botão salvar para novas empresas nacionais.
  - ícones e cores dinâmicas para visual claro de status ativo (verde) e inativo (cinza) nos clientes.

### 28/04/2026
- Legibilidade visual global (Light + Rose):
  - ajustes de contraste aplicados de forma sistêmica no frontend via `frontend/src/index.css`, cobrindo textos (`slate/zinc`), bordas, superfícies e placeholders;
  - tema `rose` refinado para reduzir aparência "lavada", com melhor leitura em textos secundários e elementos de formulário;
  - criada camada adaptativa para telas menores/monitores de menor qualidade, elevando tamanho mínimo efetivo de tipografia utilitária (`9px/10px/11px/text-xs`) e melhorando altura mínima de campos.
  - reforço adicional de contornos para monitores antigos/LCD (linhas de tabela, bordas de cards/painéis e separadores);
  - reforço específico do modo `pink/rose` com aumento de contraste em bordas, cabeçalhos de tabela e textos secundários.
- Correções de execução local (backend/frontend):
  - backend validado em `http://127.0.0.1:8000/health` e frontend em `http://127.0.0.1:3000`;
  - tratamento de execução fora do sandbox para o frontend (`Vite/esbuild`) quando ocorre `spawn EPERM`;
  - ajustes no fluxo de autenticação/permissões para reduzir falhas genéricas em cenários de sessão master local.
- Consolidação adicional das mudanças de hoje (README externo):
  - estrutura do backend revisada para refletir rotas, SQL, segurança e permissões no estado atual;
  - otimizações de carregamento em `Processos` consolidadas (cache ampliado e carregamento sob demanda de catálogos auxiliares);
  - ajuste de UX no modal `Editar Processo` com scroll interno funcional na coluna de `Eventos / Follow-up`.

### 29/04/2026
- Cadastros -> Empresa Estrangeira:
  - `Dados Básicos` passou a ter seletor pesquisável de `País`, usando a base de países do sistema (`frontend/src/lib/paises.json`);
  - `Grupo de Cliente` passou a ter seletor pesquisável usando a mesma base/cache da tela `Grupo de Clientes`;
  - a grade `Grupos que utilizam a empresa` agora mostra o grupo selecionado no formulário, removendo o valor fixo anterior.
- Sistema:
  - título da guia do navegador ajustado para `MyIndaiá`.

---

## Licença

Uso interno - Indaia Logistica Internacional Ltda.

### 29/04/2026 (continuação)
- Favicon e identidade na aba do navegador:
  - padronização para uso de `faviconMy.png` com geração de variações (`favicon-16.png`, `favicon-32.png`, `favicon-48.png`, `apple-touch-icon.png`);
  - correções de referência/compatibilidade para evitar erro de arquivo ausente em ambiente local;
  - ajustes iterativos de recorte/escala/transparência para melhorar leitura em tamanho de aba.
- Login:
  - redução proporcional da box de login, mantendo estrutura funcional e comportamento de autenticação.
- Dashboard (Painel BI):
  - ajustes de densidade visual e responsividade para melhor encaixe em zoom 100%;
  - refinamento de espaçamentos e alturas de painéis/gráficos para reduzir corte vertical.
- Processos (Gestão + Exportação + Follow-up):
  - compactação adicional da aba Exportação (labels, gaps e altura de campos) para caber mais informação na tela;
  - reforço de legibilidade nas abas internas de Gestão de Processos;
  - Follow-up com destaque visual: datas em negrito e legenda de status (`Realizado`, `Em atraso`, `Pendente`) em negrito.
- Escopo:
  - mudanças somente no frontend (sem alteração de backend ou regras de negócio).

### 29/04/2026 (ajustes finais UI/UX)
- Processos -> Eventos / Follow-up:
  - refinamento visual compacto da coluna de follow-up (densidade maior com legibilidade preservada);
  - correção do indicador de status para bolinha (realizado verde, pendente cinza; atraso temporariamente cinza);
  - remoção do rótulo técnico no evento `000` (sem exibir `sistema`);
  - restauração do título para `Eventos / Follow-up`;
  - campo de data reabilitado para digitação com máscara e preenchimento rápido por double click.
- Tema Rose:
  - remoção da borda indesejada em volta da logo do header no tema Rose.
- Configurações:
  - nome do tema atualizado de `Rose` para `Rosé`.
- Tabelas -> Unidades / Produtos (somente frontend):
  - adicionada navegação de registros (anterior/próximo + contador);
  - inclusão de ação visual de `Novo` e `Excluir`;
  - inclusão de modo `Modificar` para habilitar edição dos campos apenas quando desejado.

### 30/04/2026
- Clientes -> Lista padrao e API local:
  - adicionado badge `Ativo`/`Inativo` por linha e resumo de visualizacao da lista de clientes;
  - corrigido localhost para usar `X-Local-Dev-Auth` antes de qualquer fluxo `X-Master-Admin`;
  - backend passou a aceitar `X-Local-Dev-Auth` no CORS e liberar bypass apenas fora de producao;
  - cliente Supabase passou a ignorar proxies locais invalidos, evitando falha de conexao com o banco.

### 30/04/2026
- Favicon MyIndaia:
  - favicon redesenhado em badge azul corporativo arredondado, com monograma branco para melhor leitura;
  - versao 16px usa `M` simplificado e versoes maiores usam `My` para manter elegancia em tamanhos pequenos.

### 30/04/2026 (commit d81e7035 - CRUD Cadastros/Tabelas)
- Processos:
  - ajustes estruturais na tela para continuidade da migracao visual e funcional.
- Cadastros > Empresas:
  - `Agentes`: CRUD completo integrado (incluir, salvar, cancelar, excluir), padrao de codigo sequencial e consulta de CNPJ via backend;
  - `Areas`: CRUD completo integrado com codigo sequencial;
  - `Despachantes`: CRUD completo integrado;
  - `Transportador Rodoviario`: CRUD completo integrado, codigo sequencial e consulta de CNPJ via backend.
- Cadastros > Tabelas:
  - `Armazens`: CRUD integrado + layout padrao em grade editavel;
  - `Local de Embarque/Desembarque`: CRUD integrado + layout padrao em grade editavel;
  - `Embarcacoes`: CRUD integrado + layout padrao em grade editavel (com codificacao de navio no front);
  - `Moeda`, `NCM` e `Observacoes DUE`: padronizadas para o mesmo fluxo visual/operacional (barra de acoes + grade editavel + pesquisa + paginacao).
- Backend:
  - novas rotas FastAPI para os cadastros: agentes, areas, despachantes, transportadores, armazens, locais de embarque/desembarque e embarcacoes;
  - novos services de persistencia com suporte a Supabase + fallback local para continuidade de operacao;
  - schemas Pydantic ampliados para os novos modulos.
- Banco/SQL:
  - scripts SQL adicionados para criacao das tabelas:
    - `cad_agentes`
    - `cad_areas`
    - `cad_despachantes`
    - `cad_transportadores_rodoviarios`
    - `cad_armazens`
    - `cad_locais_embarque_desembarque`
    - `cad_embarcacoes`
- Infra local:
  - pasta `supabase/` inicializada no repositorio para fluxo local de integracao.

---

## Atualizacoes recentes (2026-05-01)

Resumo do que foi implementado nesta rodada no frontend:

- Processos (aba de edicao):
  - Ajustes de layout para elevar e alinhar melhor o bloco `Eventos / Follow-up`.
  - Campos do topo reorganizados (Cod Cliente, Razao Social, Canal e Status) com melhor alinhamento horizontal.
  - Campo `Cod Cliente` mantido em uma linha.

- Follow-up:
  - Evento `000` padronizado como `Abertura do Processo`.
  - Data do evento `000` vinculada a data de criacao do processo (`created_at`), ficando fixa por processo.

- Nota Fiscal:
  - Layout dos campos compactado para ficar em uma linha no desktop.
  - Campo `Valor` com prefixo visual `R$`.
  - Campo `Serie` reduzido e `Chave NF-e` ampliada.
  - Titulo dos blocos alterado de `Nota X` para `NF-e X`.
  - Importacao de XML em lote implementada (multiplos arquivos), com criacao automatica de varios blocos de NF-e.
  - Fluxo simplificado para botao unico `Importar XML` com suporte a lote.

- Estufagem:
  - Validacao local ISO 6346 para numero de conteiner (sem API).
  - Normalizacao automatica do conteiner (maiusculas e limpeza de caracteres invalidos).
  - Bloqueio de salvamento quando conteiner invalido.
  - Mensagem de erro ajustada para nao exibir digito esperado.
  - Limpeza automatica do erro ao sair da aba Estufagem.

- Tipos de estufagem:
  - Na aba `Estufagem`: lista de tipos ampliada com opcoes legadas e seletor em lista com exibicao de 8 itens por vez.
  - Na aba `Processo`: campo `Tipo de Estufagem` corrigido para apenas `FCL`, `LCL` e `Carga Solta`.

- Tabelas > Unidades e Produtos (frontend):
  - Ao modificar, `Codigo` agora e somente leitura.
  - Edicao restrita a `Descricao`.
  - Botao unico `Modificar`/`Salvar` no mesmo lugar.
  - Remocao do contador `1 / N` e das setas de navegacao.
  - Estilo do botao ajustado ao tema do usuario.

- Estabilidade visual:
  - Removidas as integracoes globais de Anime.js aplicadas em testes para evitar distorcoes de layout em telas complexas.
  - Hook global de anime removido do App.

- Correcao operacional:
  - Restauracao de `favicon.svg` para evitar erro de carregamento/white screen no Vite.

Observacao:
- As alteracoes desta rodada foram focadas em UX/UI e comportamento de formularios no frontend, sem alterar regras de negocio de backend.

---

## Atualizacoes recentes (2026-05-04)

Resumo da rodada de consistencia operacional, valores monetarios e seguranca:

- indaIA:
  - contexto ampliado para conhecer melhor os modulos, fluxos e permissoes do sistema;
  - respostas sobre criacao de processo passaram a orientar pela navegacao real: `Movimentos -> Novo Processo`;
  - fallback local ganhou respostas mais completas sobre Dashboard, Clientes, Processos, Documentos, Digitalizacao, Servicos, Eventos, Usuarios e Tabelas/Cadastros.

- Processos:
  - corrigida a abertura de `Novo Processo` apos os commits remotos;
  - ajustada lista de Areas para evitar quebra da tela por referencia inexistente;
  - campos de valor da fatura e valor de NF-e passaram a usar mascara monetaria por centavos;
  - campos de taxa, peso e volume passaram a bloquear caracteres invalidos no teclado.

- Campos monetarios e numericos:
  - criado helper central em `frontend/src/lib/formats.ts` para mascara monetaria brasileira e bloqueio de teclas invalidas;
  - `Servicos -> Preco Base` agora aceita somente numeros e formata como moeda;
  - `Despachantes -> Valor Minimo/Maximo SDA` agora aceita somente numeros e formata como moeda;
  - `Clientes -> Free Time` passou a aceitar somente digitos;
  - backend passou a validar valores monetarios de Clientes e Despachantes, recusando payloads diretos com letras/simbolos indevidos.

- Seguranca local:
  - rotas protegidas testadas sem autenticacao retornando `401`;
  - headers de seguranca confirmados (`X-Frame-Options`, `nosniff`, CSP e Referrer Policy);
  - CORS testado sem liberar origem externa indevida;
  - rate limit de login testado, retornando `429` apos tentativas invalidas;
  - payloads monetarios invalidos testados diretamente na API.

- Higiene de repositorio:
  - adicionada regra para ignorar `frontend/backend/`, evitando envio acidental de copia local de backend, `.env` e `__pycache__`.

---

## Atualizacoes recentes (2026-05-04 - cadastros e processos)

Resumo da rodada de correcao dos fluxos de cadastros, empresa estrangeira e processos:

- Empresa Nacional / Clientes:
  - selecao de grupo de cliente passou a exibir codigo e nome do grupo selecionado no campo apos marcar o checkbox;
  - lista de servicos vinculaveis mantem importacao e exportacao vindas do cadastro base.

- Empresa Estrangeira:
  - tela passou a carregar, salvar, atualizar e excluir pelo backend/Supabase em vez de depender apenas de dados locais;
  - campo `Cod. Pais` agora aceita pesquisa direta por codigo e preenche a descricao do pais;
  - tipos `Exportador / Fornecedor` e `Importador / Cliente` passaram a ser enviados no salvamento;
  - grupo de cliente, pais, endereco e dados fiscais foram mapeados para o payload da API.

- Usuarios:
  - corrigido controle de alteracoes pendentes do formulario, removendo a falha que impedia o cadastro/edicao de usuarios de linkar corretamente com o salvamento.

- Processos:
  - `Novo Processo` voltou a marcar alteracao ao selecionar cliente/servico, liberando o botao de salvar;
  - servico padrao passou a iniciar em importacao e o produto muda automaticamente conforme o servico escolhido;
  - numero do processo na listagem ficou clicavel para abrir a edicao;
  - aba `Fatores` foi removida do fluxo de novo processo;
  - DU-E deixou de ser somente leitura;
  - referencias, estufagens, notas fiscais, DU-E, observacoes e campos principais da exportacao passaram a ser enviados no salvamento;
  - clique acidental na linha de estufagem nao sobrescreve mais o rascunho enquanto estiver editando.

- Tabelas atreladas em Processos:
  - campos de armazem, embarcacao, agente, empresa estrangeira, local de embarque e representante receberam listas ligadas aos cadastros existentes.

- Validacao:
  - build do frontend executado com sucesso;
  - criacao real de processo testada via API local e o registro de teste foi removido em seguida;
  - endpoints de empresa estrangeira, armazens, embarcacoes, agentes e locais foram consultados pela API local.

---

## Atualizacoes recentes (2026-05-04 - servicos e eventos padrao)

Resumo da rodada de alinhamento entre Servicos, Areas e Eventos Padrao:

- Servicos:
  - cadastro de servico ganhou campos de `Codigo`, `Area` e `Area Codigo`;
  - tela de Servicos passou a carregar as areas de `Cadastros -> Empresas -> Areas`;
  - listagem de Servicos agora exibe codigo e area junto do nome, descricao, preco e status.

- Backend de Servicos:
  - modelos e normalizacao passaram a reconhecer `codigo`, `area` e `area_codigo`;
  - criado fallback para bases antigas que ainda nao tenham essas colunas;
  - adicionada migration `backend/sql/2026-05-04_servicos_area_codigo.sql` para incluir as colunas no Supabase.

- Eventos Padrao:
  - vinculo de eventos padrao passou a salvar pelo codigo do servico, o mesmo codigo usado em Processos para carregar o follow-up;
  - lista de servicos em Eventos Padrao agora prioriza o nome real vindo do cadastro de Servicos, em vez de substituir pelo nome fixo local quando houver divergencia.

- Validacao:
  - build do frontend executado com sucesso;
  - backend compilado e reiniciado;
  - endpoint `/servicos/02/eventos-padrao` validado usando o codigo do servico.

---

## Atualizacoes recentes (2026-05-04 - comandos por aba)

Resumo da rodada de padronizacao de comandos em telas com abas:

- Cadastros com abas:
  - `Incluir` e `Excluir` passaram a aparecer apenas quando a aba ativa for `Lista`;
  - nas abas `Dados Basicos`, `Contato`, `Gestao`, `Habilitacao` e equivalentes, a barra fica focada em `Salvar`, `Cancelar` e `Sair`.
  - em Usuarios, a exclusao de habilitacao ficou disponivel na propria lista de habilitacoes, sem aparecer dentro de `Dados Basicos`.

- Telas ajustadas:
  - Areas;
  - Agentes;
  - Despachantes;
  - Empresa Estrangeira;
  - Grupo de Clientes;
  - Transportador Rodoviario;
  - Usuarios;
  - Cadastro de Viagens.

- Validacao:
  - build do frontend executado com sucesso apos a mudanca.

---

## Atualizacoes recentes (2026-05-04 - usuarios em grupo de clientes)

Resumo da rodada em `Cadastros -> Grupo de Clientes -> Gestao`:

- Campos de responsaveis:
  - Coordenador Importacao, Coordenador Exportacao e Gestor de Contas passaram a carregar usuarios cadastrados em `Cadastros -> Usuarios`;
  - ao informar o codigo do usuario, o nome e preenchido automaticamente;
  - o campo de nome tambem permite buscar pela lista de usuarios e manter o codigo alinhado.

---

## Atualizacoes recentes (2026-05-04 - abertura de processo)

Resumo da rodada em `Movimentos -> Novo Processo`:

- Produto e servico:
  - o codigo do produto passou a acompanhar Importacao/Exportacao corretamente;
  - ao selecionar servico por codigo, o produto e recalculado pelo codigo do servico, evitando `02 - Exportacao` aparecer como Importacao.

- Processo criado:
  - o retorno do salvamento agora preenche `Processo(s) Criado(s)`;
  - apos criar, o sistema abre o processo gerado em modo de gestao.

- Local de Embarque:
  - lista de locais passou a usar fallback do cadastro local quando a API nao devolver dados;
  - limite de locais carregados foi ampliado para permitir buscar cidades/portos que ficavam fora da primeira pagina.

---

## Atualizacoes recentes (2026-05-05 - seletores em processo)

Resumo da rodada em `Movimentos -> Novo Processo`:

- Representante e Local de Embarque:
  - campos deixaram de usar lista nativa do navegador;
  - foi criado seletor pesquisavel com campo de busca, lista compacta de codigo/nome e indicador de selecao;
  - o mesmo padrao foi aplicado na abertura do processo e nas abas de gestao onde esses campos aparecem.

---

## Atualizacoes recentes (2026-05-05 - vinculos da aba exportacao)

Resumo da rodada em `Processos -> Exportacao`:

- Campos interligados:
  - Atendente passou a buscar usuarios cadastrados;
  - Armazem Atracacao, Armazem Estocagem e Depot buscam o cadastro de armazens;
  - Local Embarque, Local Transbordo, Local Desembarque e Local Entrega buscam o cadastro de locais;
  - Pais de Destino Final busca o cadastro de paises;
  - Embarcacao, Agente e Importador buscam seus respectivos cadastros;
  - Moeda FOB e Moeda Frete buscam o cadastro de moedas.

- Varredura:
  - removidos os campos soltos da aba Exportacao que deveriam depender de cadastro/lista do sistema;
  - verificados os `datalist` restantes em Clientes, Digitalizacao e Grupo de Clientes: eles continuam ligados a fontes de dados existentes.

---

## Atualizacoes recentes (2026-05-05 - auditoria de cadastros)

Resumo da rodada de auditoria em Empresa Nacional, Empresa Estrangeira e Grupo de Clientes:

- Empresa Estrangeira:
  - `Pais` e `Grupo de Cliente` ja estavam interligados e funcionais;
  - campos livres como endereco, cidade, contato e documentos fiscais continuam livres por nao dependerem de cadastro especifico do sistema.

- Empresa Nacional:
  - responsavel, cidade/UF, grupos, servicos, transportes e representantes foram verificados como vinculados a fontes de dados/listas existentes.

- Grupo de Clientes:
  - `Gestao` ja buscava usuarios para coordenadores e gestor de contas;
  - `Disparo Automatico Email -> Dados -> Parametros` passou a usar seletores vinculados para evento, unidade, produto, cliente, exportador/importador, grupo, usuarios, representante, servico, armazens, agente e local.

---

## Atualizacoes recentes (2026-05-05 - padrao de selecao em grupo)

Resumo da rodada em `Cadastros -> Grupo de Clientes -> Gestao`:

- Coordenadores e gestor de contas:
  - removido o `datalist` nativo do navegador que abria dropdown fora do visual do sistema;
  - incluido seletor proprio com campo de codigo, seta, busca e lista flutuante compacta;
  - ao selecionar usuario, codigo e nome sao preenchidos juntos mantendo o vinculo correto.

---

## Atualizacoes recentes (2026-05-05 - cadastro de usuarios)

Resumo da rodada em `Outros -> Usuarios`:

- Criacao de usuarios:
  - removida a senha fixa escondida no frontend;
  - inclusos campos de senha, confirmacao de senha e opcao para trocar senha no primeiro login;
  - frontend valida senha minima antes de enviar ao backend.

- Lista e seguranca:
  - usuarios bloqueados/inativos passam a aparecer por padrao na lista para evitar impressao de cadastro desaparecido;
  - backend impede exclusao de usuario fixo do sistema, como `wagner.junior`;
  - verificado no backend que `wagner.junior` existe e esta com status `blocked`.

---

## Atualizacoes recentes (2026-05-05 - flags de usuarios)

Resumo da rodada em `Outros -> Usuarios`:

- Lista de usuarios:
  - removido o filtro que escondia usuarios inativos/bloqueados;
  - todos os usuarios cadastrados permanecem visiveis na lista;
  - adicionadas colunas separadas para `Ativo` e `Bloqueado`.

- Dados basicos:
  - `Ativo` e `Bloqueado` passaram a ser campos separados;
  - status `inactive` representa usuario inativo;
  - status `blocked` representa usuario bloqueado;
  - login passa a bloquear tanto usuario inativo quanto usuario bloqueado.

---

## Atualizacoes recentes (2026-05-05 - permissoes por usuario)

Resumo da rodada em `Outros -> Usuarios`:

- Dados Basicos:
  - removidos os checkboxes operacionais soltos da tela principal do usuario;
  - mantidos os campos cadastrais do usuario e as flags separadas de ativo/bloqueado.

- Permissoes:
  - criada aba principal `Permissoes`;
  - a lista passa a contemplar as principais areas/telas do SaaS, incluindo Dashboard, Movimentos, Cadastros, Tabelas, Outros, Integracoes, Wallet, indaIA e Ajuda;
  - cada item pode ser liberado ou bloqueado manualmente por usuario com opcoes Sim/Nao;
  - o menu superior passa a considerar as permissoes manuais carregadas para o usuario logado.

---

## Atualizacoes recentes (2026-05-05 - referencias e DU-E)

Resumo da rodada em `Cadastros -> Referencias` e `Processos`:

- Cadastros:
  - criada a tela `Cadastros -> Referencias`;
  - o cadastro possui codigo numerico de 3 digitos e nome do tipo de referencia;
  - foram carregadas as referencias iniciais `001 - Pedido`, `002 - Fatura`, `003 - Booking`, `004 - Main Leg` e `005 - Booking Co-Loader`;
  - a tela foi incluida no menu, nas rotas e na lista de permissoes.

- Processos:
  - o campo `Tipo Ref.` da aba `Referencia` passou a buscar os tipos cadastrados em `Cadastros -> Referencias`;
  - novos registros de referencia usam o primeiro tipo cadastrado como padrao quando nenhum tipo foi escolhido;
  - os valores antigos ainda aparecem quando um processo ja tiver um tipo salvo fora do novo cadastro.

- DU-E:
  - campo `DU-E` passou a aceitar somente letras e numeros, formatando no padrao `26BR000379917-2`;
  - campo `Chave DU-E` passou a aceitar somente letras e numeros no padrao `26RLT162682666`;
  - campo `RUC` passou a aceitar somente letras e numeros com limite de 44 caracteres.

---

## Atualizacoes recentes (2026-05-05 - area em processos)

Resumo da rodada em `Movimentos -> Novo Processo` e `Processos -> Dados`:

- Area:
  - removida a lista fixa local que trazia valores desatualizados;
  - o campo passou a carregar o cadastro real de `Cadastros -> Areas`;
  - a selecao passou a usar o mesmo seletor pesquisavel padrao do sistema, exibindo codigo e descricao;
  - valores antigos ja salvos continuam aparecendo para nao apagar informacao existente.

---

## Atualizacoes recentes (2026-05-05 - embarcacao em processos)

Resumo da rodada em `Processos -> Exportacao`:

- Embarcacao:
  - o campo continua buscando `Cadastros -> Tabelas -> Embarcacoes` pela API;
  - quando a API retorna vazia ou falha, o sistema usa a base local de embarcacoes como fallback;
  - corrigida a leitura das colunas acentuadas da base local para preencher navio, codigo de bandeira e pais;
  - o seletor de embarcacao passa a ter opcoes mesmo quando a tabela remota ainda nao estiver populada.

---

## Atualizacoes recentes (2026-05-05 - tipo de referencia selecionavel)

Resumo da rodada em `Processos -> Referencia`:

- Tipo Ref.:
  - o cadastro de referencias agora sempre recompõe os tipos padrao quando o armazenamento local estiver vazio ou incompleto;
  - o campo deixa de ficar preso ao valor antigo do processo e volta a oferecer `Pedido`, `Fatura`, `Booking`, `Main Leg` e `Booking Co-Loader`;
  - valores historicos ja gravados continuam aparecendo para preservar processos existentes.

---

## Atualizacoes recentes (2026-05-05 - valores e pesos)

Resumo da rodada em `Processos -> Exportacao -> Valores e Pesos`:

- Campos monetarios:
  - `FOB M. Neg.`, `Total MCV` e `Vl. Seguro` passam a ser normalizados ao abrir o processo;
  - a digitacao continua restrita a numeros e a exibicao segue o padrao monetario brasileiro com duas casas.

- Pesos:
  - `Peso Bruto` e `Peso Liquido` passam a usar mascara numerica fixa com cinco casas decimais;
  - o formato exibido fica no padrao `23.444.555,12345`.

---

## Atualizacoes recentes (2026-05-05 - servicos lista x dados basicos)

Resumo da rodada em `Cadastros -> Tabelas -> Servicos`:

- Regressao corrigida:
  - a aba `Lista` voltou a exibir os servicos padrao da tabela de cadastro, sem substituir pelo conjunto da aba de dados/eventos;
  - os dados de backend continuam disponiveis para composicao em `Eventos Padrao`, sem sobrescrever a base exibida na `Lista`;
  - os conjuntos foram separados para evitar nova mistura entre as duas visoes.

---

## Atualizacoes recentes (2026-05-05 - rolagem de servicos em empresa nacional)

Resumo da rodada em `Cadastros -> Empresa Nacional -> Vincular Servico`:

- Rolagem da lista:
  - ajustado layout do modal para usar `flex` com `min-h-0` no corpo e na area da grade;
  - removida a limitacao fixa que causava corte no fim da lista;
  - a rolagem vertical agora fica aplicada diretamente na grade de servicos ate o ultimo item.

---

## Atualizacoes recentes (2026-05-05 - placeholders da aba DU-E)

Resumo da rodada em `Processos -> DU-E`:

- Campos de DU-E:
  - removidos os placeholders com numeracao de exemplo dos campos `DU-E`, `Chave DU-E` e `RUC`;
  - os campos permanecem com validacao e mascara, mas agora sem texto de fundo para evitar impressao de preenchimento previo.

---

## Atualizacoes recentes (2026-05-05 - navegacao por numero no header do processo)

Resumo da rodada em `Processos -> Gestao`:

- Navegacao rapida:
  - o campo do numero do processo no header passou de badge estatico para entrada navegavel;
  - ao digitar outro numero e pressionar `Enter` (ou sair do campo), a tela carrega o processo correspondente na mesma pagina;
  - a busca tenta primeiro na lista carregada e depois consulta a API em paginas para localizar processos fora da lista inicial;
  - se o numero nao existir, a tela mostra aviso e restaura o numero atual.

---

## Atualizacoes recentes (2026-05-06 - incoterms)

Resumo da rodada em `Outros -> Incoterms` e `Processos -> Exportacao`:

- Outros:
  - criada a nova tela `Outros -> Incoterms` com fluxo de `Incluir`, `Salvar`, `Cancelar` e `Excluir`;
  - cadastro com campos `Codigo` (3 digitos), `Descricao` e `Ativo` para permitir incluir, alterar e desativar.

- Backend:
  - criada API de Incoterms em `GET/POST/PUT/DELETE /outros/incoterms`;
  - adicionados seed inicial e fallback com os 11 Incoterms: `EXW, FCA, FAS, FOB, CFR, CIF, CPT, CIP, DAP, DPU, DDP`;
  - adicionada migration `backend/sql/2026-05-06_incoterms.sql`.

- Processos:
  - campo `Incoterm` na aba `Exportacao` deixou de ser texto livre e virou seletor;
  - seletor carrega os Incoterms ativos do novo cadastro, com fallback para lista padrao.

- Permissoes:
  - novo item de permissao web `Outros - Incoterms` incluido no cadastro de permissoes por usuario;
  - criada a rota `GET /usuarios/me/permissoes-web` para o usuario autenticado carregar as proprias permissoes sem depender de permissao administrativa de usuarios;
  - frontend passou a buscar as permissoes pela rota do proprio usuario durante o carregamento do perfil;
  - redirecionamento inicial passa a respeitar as permissoes salvas: se `Dashboard` estiver como `Nao`, o sistema abre a primeira tela permitida;
  - usuario `admin` permanece com acesso total independente das permissoes manuais.

---

## Atualizacoes recentes (2026-05-06 - servicos, prefixo e salvar por abas)

- Servicos / Prefixo de processo:
  - backend de servicos passou a aceitar e normalizar `prefixo_processo` com aliases (`prefixo`, `prefixo_proc`);
  - geracao do numero de processo passou a buscar dados do servico por `id` e fallback por `codigo`, priorizando prefixo quando disponivel.

- Incoterms (resiliencia):
  - quando a tabela `public.incoterms` nao existe, listagem usa fallback padrao para nao quebrar tela;
  - operacoes de criar/editar/excluir retornam erro orientativo para aplicar migration `backend/sql/2026-05-06_incoterms.sql`.

- Empresa Nacional / Habilitacao / Vincular Servico:
  - modal de vinculo abre sem pre-selecao automatica de servicos, deixando a selecao manual pelo usuario.

- Processos:
  - removidos valores fixos de exemplo em `Referencias` e em `CNTR/Lacres`; os campos mostram apenas dados reais ou vazio.

- Salvar por abas:
  - `CadastroViagens`: ajuste no fluxo de salvar para nao ficar preso a uma unica aba;
  - `Usuarios`: botao principal `Salvar` passou a respeitar a aba atual (`Dados Basicos`, `Habilitacao`, `Permissoes`).

- Banco de dados:
  - adicionada migration `backend/sql/2026-05-06_servicos_prefixo_processo.sql` para criar a coluna `prefixo_processo` em `public.servicos`.

---

## Atualizacoes recentes (2026-05-07 - numeracao de processo por prefixo do servico)

Resumo da rodada em `Processos -> Abertura`:

- Numeracao de processo:
  - a geracao passou a usar o `prefixo_processo` cadastrado no servico da Empresa Nacional;
  - o formato passou a ser `UNIDADE + CODIGO_SERVICO + PREFIXO`, por exemplo: `0102EX-000001-26`;
  - o sequenciamento passou a procurar o ultimo numero com a mesma base e mesmo ano para incrementar corretamente (`...000002...`, `...000003...`).

- Regra de consistencia:
  - se o servico nao tiver `prefixo_processo` preenchido, a abertura retorna erro orientativo para cadastrar o prefixo antes de abrir processo.

---

## Atualizacoes recentes (2026-05-07 - performance backend/clientes)

Resumo da rodada de performance em `Backend`, `Clientes`, `Processos`, `Grupo Clientes` e `Digitalizacao`:

- Observabilidade de latencia:
  - adicionada instrumentacao de tempo por requisicao com header `X-Response-Time-Ms`;
  - criado endpoint `GET /health/perf` com consolidado de `avg`, `p95`, `max` e contagem de lentas por rota e por query.

- Supabase:
  - criado proxy de medicao para consultas `.execute()` com agrupamento por tabela;
  - habilitado reuse do cliente Supabase (`SUPABASE_CLIENT_REUSE=true`) para reduzir overhead de inicializacao por request.

- Clientes (backend):
  - `GET /clientes/` passou a aceitar `resumo`, `somente_ativos`, `limit` e `offset`;
  - adicionada lista de colunas resumidas para telas que nao precisam do payload completo;
  - adicionado cache em memoria para listagem de clientes (TTL curto, padrao 20s) com invalidacao automatica em criar/editar/excluir/ativar/inativar e atualizacao de prefixos.

- Frontend:
  - `Processos`, `GrupoClientes` e `Digitalizacao` passaram a consumir `GET /clientes/?resumo=true&somente_ativos=true&limit=1000` para reduzir carga e tamanho de resposta.

- Resultado observado:
  - houve reducao relevante da latencia, principalmente em consultas repetidas de clientes;
  - primeira chamada continua sujeita ao custo de acesso remoto/infra, mas chamadas subsequentes ficam muito mais rapidas com cache.

---

## Atualizacoes recentes (2026-05-08 - servicos operacionais por evento e exibicao em processos)

Resumo da rodada em `Cadastro Empresa Nacional` e `Processos`:

- Empresa Nacional / Servicos Operacionais:
  - nova aba `Servicos Operacionais` no cadastro;
  - suporte a eventos em cascata com quantidade por evento;
  - ajuste de valor monetario em formato BR (`1.234,56`);
  - selecao de evento com busca para melhorar fluidez do preenchimento.

- Processos:
  - exibicao dos Servicos Operacionais do cliente em `Abertura de Processo`;
  - exibicao dos Servicos Operacionais do cliente em `Gestao de Processos` (aba `Processo`);
  - compatibilidade com formato antigo (`evento_codigo` + `quantidade_itens`) e novo (`evento_quantidades[]`).

---

## Atualizacoes recentes (2026-05-11 - servicos operacionais: persistencia e fluxo sem evento no cadastro)

Resumo da rodada em `Cadastro Empresa Nacional` e `Processos`:

- Empresa Nacional / Servicos Operacionais:
  - removida a configuracao de `evento` da aba de cadastro;
  - mantido cadastro em multiplas linhas com `Item`, `Valor` e `Servico`;
  - corrigido bug de persistencia ao reabrir o cliente: os itens agora recarregam do `extras_info` bruto salvo no banco.

- Processos:
  - quadro de quantidades por evento permanece no follow-up;
  - o quadro passa a usar os itens de Servicos Operacionais cadastrados no cliente, filtrados pelo servico do processo;
  - lancamentos continuam sendo gravados em `servicos_operacionais_lancamentos`.
