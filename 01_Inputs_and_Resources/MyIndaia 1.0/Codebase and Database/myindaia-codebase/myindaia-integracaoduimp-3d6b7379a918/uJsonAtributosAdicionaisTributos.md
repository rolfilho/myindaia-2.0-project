# uJsonAtributosAdicionaisTributos

- Arquivo: `uJsonAtributosAdicionaisTributos.pas`
- Linhas: 116
- SHA (12): `12ad1e3a5f3a`

## Propósito (inferido)

- Define estruturas DTO voltadas a JSON (serialização/desserialização).

## Tipos públicos (detectados na seção interface)

- Classes: `TAtributo`, `TAtributoTributo`, `TFundamentoLegal`, `TMercadoria`, `TRegime`, `TTratamentoTributario`, `TTributo`

## Rotinas públicas (free functions/procedures na interface)

- *(nenhuma assinatura de rotina livre detectada na seção interface — pode ser tudo orientado a classes/forms)*

## Uses

### Interface uses
`System.SysUtils`, `System.JSON`, `REST.Json`, `REST.Json.Types`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- *(nenhuma)*

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
