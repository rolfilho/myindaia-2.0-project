# DadosGeraisDuimp

- Arquivo: `DadosGeraisDuimp.pas`
- Linhas: 304
- SHA (12): `1b43a235e84d`

## Propósito (inferido)

- Define modelos/records/classes de dados para DUIMP.

## Tipos públicos (detectados na seção interface)

- Classes: `TCarga`, `TDeclaracoesExportacaoEstrangeira`, `TDocumentos`, `TDocumentosInstrucao`, `TFrete`, `TIdentificacao`, `TImportador`, `TPaisProcedencia`, `TPalavrasChave`, `TProcessos`, `TRoot`, `TSeguro`, `TTipo`, `TUnidadeDeclarada`

## Rotinas públicas (free functions/procedures na interface)

- `function GetPalavrasChave: TObjectList<TPalavrasChave>;`
- `function GetAsJson: string;`
- `function GetDeclaracoesExportacaoEstrangeira: TObjectList<TDeclaracoesExportacaoEstrangeira>;`
- `function GetDocumentosInstrucao: TObjectList<TDocumentosInstrucao>;`
- `function GetProcessos: TObjectList<TProcessos>;`
- `function GetAsJson: string;`

## Uses

### Interface uses
`Pkg.Json.DTO`, `System.Generics.Collections`, `REST.Json.Types`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- `Pkg.Json.DTO`

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
