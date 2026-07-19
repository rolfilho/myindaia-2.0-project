# dmDuimp

- Arquivo: `dmDuimp.pas`
- Linhas: 32
- SHA (12): `a6ed6355ca6d`

## Propósito (inferido)

- DataModule: concentra acesso a dados/consultas/conexões compartilhadas.
- Unit de Form (VCL): tela e eventos de UI.

## Tipos públicos (detectados na seção interface)

- Classes: `TdtmDuimp`

## Rotinas públicas (free functions/procedures na interface)

- *(nenhuma assinatura de rotina livre detectada na seção interface — pode ser tudo orientado a classes/forms)*

## Uses

### Interface uses
`System.SysUtils`, `System.Classes`, `FireDAC.Stan.Intf`, `FireDAC.Stan.Option`, `FireDAC.Stan.Error`, `FireDAC.UI.Intf`, `FireDAC.Phys.Intf`, `FireDAC.Stan.Def`, `FireDAC.Stan.Pool`, `FireDAC.Stan.Async`, `FireDAC.Phys`, `FireDAC.Phys.MSSQL`, `FireDAC.Phys.MSSQLDef`, `FireDAC.VCLUI.Wait`, `FireDAC.Stan.Param`, `FireDAC.DatS`, `FireDAC.DApt.Intf`, `FireDAC.DApt`, `Data.DB`, `FireDAC.Comp.DataSet`, `FireDAC.Comp.Client`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- *(nenhuma)*

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
