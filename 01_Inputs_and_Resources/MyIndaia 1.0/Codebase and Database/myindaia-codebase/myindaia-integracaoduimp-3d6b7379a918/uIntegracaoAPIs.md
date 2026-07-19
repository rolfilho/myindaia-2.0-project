# uIntegracaoAPIs

- Arquivo: `uIntegracaoAPIs.pas`
- Linhas: 595
- SHA (12): `541cab98cc16`

## Propósito (inferido)

- Centraliza chamadas de integração com APIs (provável Portal Único / endpoints DUIMP).

## Tipos públicos (detectados na seção interface)

- *(nenhum tipo público detectado na seção interface)*

## Rotinas públicas (free functions/procedures na interface)

- `function ObterTokensIndaia(const Despachante: string): Boolean;`
- `function Conectar(var vMensagem: String): Boolean;`
- `function Api_(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;`
- `function GetApi(uri: String): String overload;`

## Uses

### Interface uses
`System.Classes`, `IdIOHandler`, `IdIOHandlerSocket`, `System.SysUtils`, `IdIOHandlerStack`, `IdSSL`, `IdSSLOpenSSL`, `IdBaseComponent`, `IdComponent`, `IdTCPConnection`, `IdTCPClient`, `IdHTTP`, `IdExceptionCore`, `IdException`, `IdGlobal`, `IdStack`, `IdURI`, `System.JSON`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- *(nenhuma)*

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
