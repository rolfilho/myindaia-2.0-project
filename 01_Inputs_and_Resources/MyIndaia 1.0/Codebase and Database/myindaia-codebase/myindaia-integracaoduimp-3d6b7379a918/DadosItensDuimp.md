# DadosItensDuimp

- Arquivo: `DadosItensDuimp.pas`
- Linhas: 712
- SHA (12): `13caa9160306`

## Propósito (inferido)

- Define modelos/records/classes de dados para DUIMP.

## Tipos públicos (detectados na seção interface)

- Classes: `TAcrescimosDeducoes`, `TAtributos`, `TAtributosDuimp`, `TAtributosFundamentoLegalDuimp`, `TCaracterizacaoImportacao`, `TCertificadoMercosul`, `TCoberturaCambial`, `TCondicaoVenda`, `TDadosCambiais`, `TDadosItensDuimp`, `TDeclaracoesVinculadas`, `TDenominacao`, `TExportador`, `TFabricante`, `TFrete`, `TFundamento`, `TIdentificacao`, `TIncoterm`, `TIndicadorCompradorVendedor`, `TIndicadorExportadorFabricante`

## Rotinas públicas (free functions/procedures na interface)

- `function GetAtributos: TObjectList<TAtributos>;`
- `function GetAsJson: string;`
- `function GetAcrescimosDeducoes: TObjectList<TAcrescimosDeducoes>;`
- `function GetAsJson: string;`
- `function GetAtributosDuimp: TObjectList<TAtributosDuimp>;`
- `function GetAtributosFundamentoLegalDuimp: TObjectList<TAtributosFundamentoLegalDuimp>;`
- `function GetCertificadoMercosul: TObjectList<TCertificadoMercosul>;`
- `function GetDeclaracoesVinculadas: TObjectList<TDeclaracoesVinculadas>;`
- `function GetLpcos: TObjectList<TLpcos>;`
- `function GetTributos: TObjectList<TTributos>;`
- `function GetAsJson: string;`
- `function GetItems: TObjectList<TItems>;`
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
