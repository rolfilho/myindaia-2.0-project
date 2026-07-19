# uAtributosFundamento

- Arquivo: `uAtributosFundamento.pas`
- Linhas: 940
- SHA (12): `90119db98415`

## Propósito (inferido)

- Unit de Form (VCL): tela e eventos de UI.

## Tipos públicos (detectados na seção interface)

- Classes: `TfrmAtributosFundamento`
- Records: `TAtributoPreenchido`

## Rotinas públicas (free functions/procedures na interface)

- `procedure btnSalvarClick(Sender: TObject);`
- `procedure btnSairClick(Sender: TObject);`
- `procedure grdItensCellClick(Column: TColumn);`
- `procedure btnConsultarClick(Sender: TObject);`
- `function GetAtributosFundamento: String;`
- `function Conectar_old(var vMensagem: String): Boolean;`
- `function GetApi_old(uri: String): String;`
- `procedure CriarCamposDinamicos(const JSON: string; painel: TScrollBox);`
- `procedure Fechar;`
- `procedure InserirAtributosNoBanco(const JSON: string);`
- `procedure SalvarAtributo;`
- `procedure ConsultarAtributosFundamento;`

## Uses

### Interface uses
`Winapi.Windows`, `Winapi.Messages`, `System.SysUtils`, `System.StrUtils`, `System.Variants`, `System.Classes`, `Vcl.Graphics`, `Vcl.Controls`, `Vcl.Forms`, `Vcl.Dialogs`, `Vcl.StdCtrls`, `Vcl.ExtCtrls`, `System.JSON`, `FireDAC.Stan.Intf`, `FireDAC.Stan.Option`, `FireDAC.Stan.Param`, `FireDAC.Stan.Error`, `FireDAC.DatS`, `FireDAC.Phys.Intf`, `FireDAC.DApt.Intf`, `FireDAC.Stan.Async`, `FireDAC.DApt`, `Data.DB`, `FireDAC.Comp.DataSet`, `FireDAC.Comp.Client`, `dmDuimp`, `IdIOHandler`, `IdIOHandlerSocket`, `IdIOHandlerStack`, `IdSSL`, `IdSSLOpenSSL`, `IdBaseComponent`, `IdComponent`, `IdTCPConnection`, `IdTCPClient`, `IdHTTP`, `Vcl.Grids`, `Vcl.DBGrids`, `uIntegracaoAPIs`

### Implementation uses
`System.Generics.Collections`

## Dependências internas do projeto

- `dmDuimp`, `uIntegracaoAPIs`

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
