# MyDialog

- Arquivo: `MyDialog.pas`
- Linhas: 94
- SHA (12): `ad0c722ebdfd`

## Propósito (inferido)

- Utilitário visual para mensagens/diálogos customizados.

## Tipos públicos (detectados na seção interface)

- *(nenhum tipo público detectado na seção interface)*

## Rotinas públicas (free functions/procedures na interface)

- `function Confirm(const Msg: string): Boolean;`
- `procedure Warning(const Msg: string);`
- `procedure Information(const Msg: string);`
- `procedure Error(const Msg: string);`
- `procedure Reject(const Msg: string);`

## Uses

### Interface uses
`Vcl.Controls`, `Vcl.Dialogs`, `Vcl.Forms`, `Vcl.Buttons`, `Vcl.StdCtrls`, `System.SysUtils`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- *(nenhuma)*

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
