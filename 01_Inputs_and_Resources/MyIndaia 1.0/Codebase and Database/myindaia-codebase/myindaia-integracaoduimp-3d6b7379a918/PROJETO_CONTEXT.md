# IntegracaoDuimp — Contexto do Projeto

Data de geração: **2026-01-12**

Este documento foi gerado automaticamente a partir do código-fonte contido no ZIP.
Ele serve como **visão arquitetural** (nível de sistema) para orientar manutenção e evolução do projeto.

## Objetivo aparente do sistema

Pelo conjunto de units, nomes e dependências, o projeto parece focar em **integração e apoio ao fluxo de DUIMP**
(atributos, tributos e fundamentos), com:
- **UI em VCL** (forms)
- **DataModule** para acesso a dados/serviços internos (provável conexão/consultas)
- **Módulo de Integração de APIs** (uIntegracaoAPIs)
- **DTO/serialização JSON** (Pkg.Json.DTO e units `uJson*`)
- **Modelos** `Dados*` para estruturar informação consumida/produzida

> Observação: como o ZIP não inclui documentação funcional, esta leitura é inferida do código e nomes.

## Estrutura por camadas (sugerida)

- **UI (VCL / Forms)**
  - `Principal` (provável form principal / orquestração do fluxo)
  - `uFormDuimpView` (view específica)
  - `uAtributos*` (telas/fluxos de atributos, tributos e fundamentos)
  - `MyDialog` (diálogos/utilitários visuais)
- **Domínio / DTO**
  - `DadosGeraisDuimp`, `DadosItensDuimp` (modelos de dados)
  - `uJsonAtributosAdicionaisTributos` (modelos/estruturas JSON)
  - `Pkg.Json.DTO` (infra de serialização via atributos/RTTI)
- **Infra**
  - `dmDuimp` (DataModule)
  - `uIntegracaoAPIs` (integração HTTP/APIs / endpoints)

## Fluxos (macro)

1. Usuário interage com **telas** (`Principal` / `uAtributos*` / `uFormDuimpView`)
2. Telas consultam/atualizam dados via `dmDuimp` e chamam integrações via `uIntegracaoAPIs`
3. Payloads e respostas são estruturados em `Dados*` / `uJson*` e serializados por `Pkg.Json.DTO`

## Dependências internas (alto nível)

- `Principal` depende de quase todas as units (orquestrador)
- `uAtributosDuimp` e `uAtributosTributo` dependem de `dmDuimp`, `uIntegracaoAPIs` e JSON helpers
- `Dados*` dependem apenas de `Pkg.Json.DTO`

## Pontos de atenção arquitetural (recomendações)

- **Separar responsabilidades**: `Principal` está centralizando muitas dependências; considere introduzir uma camada de *service/facade* (sem VCL) para reduzir acoplamento UI→Infra.
- **Contratos estáveis**: isolar DTOs e *mappers* em um package/pasta de `DTO` para evitar espalhar JSON por telas.
- **Testabilidade**: `uIntegracaoAPIs` pode expor interfaces (ex.: `IIntegracaoPortal`) e permitir *mock* em testes.
- **Evolução segura**: manter um arquivo de “mudanças por diff” (ver `HISTORICO_ALTERACOES_DIFF.md`) para preservar contexto de longo prazo.

## Inventário rápido

- Total de units (.pas): **13**
- Total de forms (.dfm): **7**
- Project: `IntegracaoDuimp.dpr`
- DPROJ: `IntegracaoDuimp.dproj`
