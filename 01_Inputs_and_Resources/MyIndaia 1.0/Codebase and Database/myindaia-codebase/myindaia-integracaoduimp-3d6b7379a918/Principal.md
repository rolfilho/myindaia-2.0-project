# Principal

- Arquivo: `Principal.pas`
- Linhas: 4956
- SHA (12): `4289826f2512`

## Propósito (inferido)

- Unit de Form (VCL): tela e eventos de UI.

## Tipos públicos (detectados na seção interface)

- Classes: `TForm1`
- Records: `TAdicaoItem`, `TCarga`, `TDuimp`, `TError`, `TFrete`, `TIdentificacao`, `TItemInfo`, `TLink`, `TMercadoriaLocalEmbarque`, `TMultiStatus`, `TRetornoItem`, `TRootRecord`, `TSeguro`, `TTributoCalculado`, `TValoresBRL`

## Rotinas públicas (free functions/procedures na interface)

- `procedure btnGerarJsonClick(Sender: TObject);`
- `procedure btnConectarClick(Sender: TObject);`
- `procedure btnEnviarCapaClick(Sender: TObject);`
- `procedure btntiposDocumentosClick(Sender: TObject);`
- `procedure BitBtn2Click(Sender: TObject);`
- `procedure btnGerarJsonItensClick(Sender: TObject);`
- `procedure FormCreate(Sender: TObject);`
- `procedure btnEnviarItensClick(Sender: TObject);`
- `procedure btnPesquisarClick(Sender: TObject);`
- `procedure btnPreencherDadosClick(Sender: TObject);`
- `procedure btnConsultarTributosClick(Sender: TObject);`
- `procedure btnRegistrarClick(Sender: TObject);`
- `procedure btnDiagnosticoClick(Sender: TObject);`
- `procedure btnEnviarDuimpClick(Sender: TObject);`
- `procedure btnEnviarItensDuimpClick(Sender: TObject);`
- `procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);`
- `procedure btnAbrirClick(Sender: TObject);`
- `procedure btnVoltarClick(Sender: TObject);`
- `procedure btnDiagnosticoDuimpClick(Sender: TObject);`
- `procedure btnRegistrarDuimpClick(Sender: TObject);`
- `procedure btnSalvarClick(Sender: TObject);`
- `procedure btnRestaurarClick(Sender: TObject);`
- `procedure btnAlterarDuimpClick(Sender: TObject);`
- `procedure btnAlterarDuimpItensClick(Sender: TObject);`
- `procedure btnAvancadoClick(Sender: TObject);`
- `procedure FormActivate(Sender: TObject);`
- `procedure btnAtributosDuimpClick(Sender: TObject);`
- `procedure btnEnviarDuimpItemClick(Sender: TObject);`
- `procedure btnRegistrarDuimpUsuarioClick(Sender: TObject);`
- `procedure Timer1Timer(Sender: TObject);`
- `procedure btnEnviarDuimpLateralClick(Sender: TObject);`
- `procedure btnDiagnosticarDuimpLateralClick(Sender: TObject);`
- `procedure btnRegistrarDuimpLateralClick(Sender: TObject);`
- `procedure imgExcluirItensClick(Sender: TObject);`
- `procedure Button1Click(Sender: TObject);`
- `procedure imgExcluirCapaClick(Sender: TObject);`
- `procedure btnTelaAtributosTributosClick(Sender: TObject);`
- `procedure btnEnviarDuimpTesteClick(Sender: TObject);`
- `procedure btnConsultarNotificacaoClick(Sender: TObject);`
- `procedure PreencheObjetoItens;`

## Uses

### Interface uses
`Winapi.Windows`, `Winapi.Messages`, `System.SysUtils`, `System.Variants`, `System.Classes`, `Vcl.Graphics`, `Vcl.Controls`, `Vcl.Forms`, `Data.DB`, `Vcl.Grids`, `Vcl.DBGrids`, `Vcl.StdCtrls`, `Vcl.Buttons`, `FireDAC.Stan.Intf`, `FireDAC.Stan.Option`, `FireDAC.Stan.Error`, `FireDAC.UI.Intf`, `FireDAC.Phys.Intf`, `FireDAC.Stan.Def`, `FireDAC.Stan.Pool`, `FireDAC.Stan.Async`, `FireDAC.Phys`, `FireDAC.Phys.MSSQL`, `FireDAC.Phys.MSSQLDef`, `FireDAC.VCLUI.Wait`, `FireDAC.Stan.Param`, `FireDAC.DatS`, `FireDAC.DApt.Intf`, `FireDAC.DApt`, `FireDAC.Comp.DataSet`, `FireDAC.Comp.Client`, `IdIOHandler`, `IdIOHandlerSocket`, `IdIOHandlerStack`, `IdSSL`, `IdSSLOpenSSL`, `IdBaseComponent`, `IdComponent`, `IdExceptionCore`, `IdTCPConnection`, `IdTCPClient`, `IdHTTP`, `DadosGeraisDuimp`, `DadosItensDuimp`, `Vcl.ExtCtrls`, `Vcl.ComCtrls`, `System.JSON`, `System.JSON.Writers`, `Diagnostics`, `IniFiles`, `System.JSON.Serializers`, `Pkg.Json.DTO`, `uFormDuimpView`, `ActiveX`, `MSHTML`, `dmDuimp`, `IdException`, `IdGlobal`, `IdStack`, `System.ImageList`, `Vcl.ImgList`, `dxGDIPlusClasses`, `uIntegracaoAPIs`

### Implementation uses
`uAtributosDuimp`, `uAtributosTributo`, `uAtributosFundamento`, `Vcl.Dialogs`, `SHDocVw`, `MyDialog`, `uAtributosTributarios`

## Dependências internas do projeto

- `DadosGeraisDuimp`, `DadosItensDuimp`, `MyDialog`, `Pkg.Json.DTO`, `dmDuimp`, `uAtributosDuimp`, `uAtributosFundamento`, `uAtributosTributarios`, `uAtributosTributo`, `uFormDuimpView`, `uIntegracaoAPIs`

## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.
