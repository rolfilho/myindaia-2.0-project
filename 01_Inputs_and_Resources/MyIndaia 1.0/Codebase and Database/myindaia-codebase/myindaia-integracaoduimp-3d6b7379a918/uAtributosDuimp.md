# uAtributosDuimp

- Arquivo: `uAtributosDuimp.pas`
- Linhas: 984
- SHA (12): `24e3ed3dc31a`

## Propósito (inferido)

- Unit de Form (VCL): tela e eventos de UI.

## Tipos públicos (detectados na seção interface)

- Classes: `TfrmAtributosDuimp`
- Records: `TAtributo`, `TAtributoCondicionado`, `TAtributosNCM`, `TCondicao`, `TCondicionado`, `TDominio`, `TListaAtributo`, `TNcm`, `TObjetivo`

## Rotinas públicas (free functions/procedures na interface)

- `procedure btnNcmClick(Sender: TObject);`
- `procedure BitBtn1Click(Sender: TObject);`
- `procedure BitBtn2Click(Sender: TObject);`
- `procedure btnTentarNovamenteClick(Sender: TObject);`
- `function GetApi(uri: String): String;`
- `function Conectar(var vMensagem: String): Boolean;`
- `function GetAtributosDaDuimp(ncm: String): TAtributosNCM;`
- `procedure GravarRecordNoBanco(const RecordEstrutura: TAtributosNCM);`
- `function GetAtributosAdicionaisTributos(ncm: String): TAtributosNCM;`
- `function ConsultarItensProcesso(nrProcesso: String): Boolean;`
- `procedure InserirItemNumeroDuimp(nrProcesso: String);`

## Uses

### Interface uses
`Winapi.Windows`, `Winapi.Messages`, `System.SysUtils`, `System.Variants`, `System.Classes`, `Vcl.Graphics`, `Vcl.Controls`, `Vcl.Forms`, `Vcl.Dialogs`, `IdIOHandler`, `IdIOHandlerSocket`, `IdIOHandlerStack`, `IdSSL`, `IdSSLOpenSSL`, `IdBaseComponent`, `IdComponent`, `IdTCPConnection`, `IdTCPClient`, `IdHTTP`, `Vcl.StdCtrls`, `Vcl.Buttons`, `Vcl.ExtCtrls`, `System.JSON`, `System.Generics.Collections`, `FireDAC.Stan.Intf`, `FireDAC.Stan.Option`, `FireDAC.Stan.Error`, `FireDAC.UI.Intf`, `FireDAC.Phys.Intf`, `FireDAC.Stan.Def`, `FireDAC.Stan.Pool`, `FireDAC.Stan.Async`, `FireDAC.Phys`, `FireDAC.Phys.MSSQL`, `FireDAC.Phys.MSSQLDef`, `FireDAC.VCLUI.Wait`, `FireDAC.Stan.Param`, `FireDAC.DatS`, `FireDAC.DApt.Intf`, `FireDAC.DApt`, `Data.DB`, `FireDAC.Comp.DataSet`, `FireDAC.Comp.Client`, `dmDuimp`, `MyDialog`, `uJsonAtributosAdicionaisTributos`, `uIntegracaoAPIs`

### Implementation uses
*(vazio / não encontrado)*

## Dependências internas do projeto

- `MyDialog`, `dmDuimp`, `uIntegracaoAPIs`, `uJsonAtributosAdicionaisTributos`

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
