# Pkg.Json.DTO

- Arquivo: `Pkg.Json.DTO.pas`
- Linhas: 291
- SHA (12): `2ab4a32ca6a0`

## Propósito (inferido)

- Infra de DTO JSON baseada em RTTI/atributos (mapeamento JSON↔objeto).

## Tipos públicos (detectados na seção interface)

- Classes: `TArrayMapper`, `TJsonDTO`

## Rotinas públicas (free functions/procedures na interface)

- `function GetAsJson: string;`
- `procedure SetAsJson(aValue: string);`
- `function ToString: string;`

## Uses

### Interface uses
`System.Classes`, `System.Json`, `Rest.Json`, `System.Generics.Collections`, `Rest.JsonReflect`

### Implementation uses
`System.Sysutils`, `System.JSONConsts`, `System.Rtti`, `System.DateUtils`

## Dependências internas do projeto

- *(nenhuma)*

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
