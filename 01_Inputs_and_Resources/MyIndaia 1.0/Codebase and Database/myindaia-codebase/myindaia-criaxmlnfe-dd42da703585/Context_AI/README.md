# CriaXmlNfe — Documentação (Markdown)

Esta pasta contém documentação detalhada do projeto **CriaXmlNfe** e de cada unit.

## Arquivos do projeto

- **Entrada:** `CriaXmlNfe.dpr`
- **UI:** `uFrmNFe.pas/.dfm`
- **Infra + Dados + ACBr:** `uDmNFe.pas/.dfm`
- **Regra/Orquestração:** `uNFeService.pas`

## Fluxo principal

```mermaid
flowchart TD
  A[Usuário informa NR_PROCESSO] --> B[TfrmNfe.btnGerarClick]
  B --> C[Cria TNFeService(dmNFe)]
  C --> D[TNFeService.GerarNFe]
  D --> E[TdmNFe.PrepararConsultas]
  D --> F[TNFeService.ValidarContainersObrigatorios]
  D --> G[TNFeService.CriarPastaProcesso]
  D --> H[Inicializa Nota Pai no ACBr]
  H --> I[TNFeService.PreencherCabecalhoDaNota (Pai)]
  I --> J[TNFeService.ZerarTotais (Pai)]
  J --> K{Para cada Adição (QCab)}
  K --> L{Para cada Contêiner (QCntr)}
  L --> M[TNFeService.AbrirQDet]
  M --> N{QDet tem itens?}
  N -- Não --> L
  N -- Sim --> O[Cria Nota Filha no ACBr]
  O --> P[TNFeService.PreencherCabecalhoDaNota (Filha)]
  P --> Q[Loop itens: AdicionarItemNaNota + PreencherImpostosDoItem]
  Q --> R[TNFeService.SomarTotaisDoDet (Filha e Pai)]
  R --> S[TNFeService.PreencherInfAdic (Filha)]
  S --> T[TNFeService.CalcularTotaisManuais (Filha)]
  T --> U[GravarXML da Filha]
  U --> L
  K --> V[Fim das adições]
  V --> W[TNFeService.CalcularTotaisManuais (Pai)]
  W --> X[GravarXML da Pai]
  X --> Y[Retorna lista de arquivos gerados]
  Y --> Z[TfrmNfe.Log/Exibe resultado]
```

## Documentação por unit

- [`uFrmNFe.md`](uFrmNFe.md) — UI e disparo do fluxo
- [`uDmNFe.md`](uDmNFe.md) — Conexão/consultas/config do ACBr
- [`uNFeService.md`](uNFeService.md) — Orquestração e montagem da NF-e
