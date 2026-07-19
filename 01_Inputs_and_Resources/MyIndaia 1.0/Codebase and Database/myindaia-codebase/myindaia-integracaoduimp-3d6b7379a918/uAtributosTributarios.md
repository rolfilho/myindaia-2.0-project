# uAtributosTributarios

- Arquivo: `uAtributosTributarios.pas`
- Linhas: 1779
- SHA (12): `5f44eaa64677`

## Propósito (inferido)

- Unit de Form (VCL): tela e eventos de UI.

## Tipos públicos (detectados na seção interface)

- Classes: `TfrmAtributosTributarios`
- Records: `TAtributoPreenchido`

## Rotinas públicas (free functions/procedures na interface)

- `procedure btnSalvarClick(Sender: TObject);`
- `procedure btnSairClick(Sender: TObject);`
- `procedure grdItensCellClick(Column: TColumn);`
- `procedure btnConsultarClick(Sender: TObject);`
- `function GetAtributosTributarios(pTipoConsulta: TTipoConsulta): String;`
- `procedure CriarCamposDinamicosMult(const JsonNormal, JsonOpcional: string; painel: TScrollBox);`
- `function ObterAtributosPreenchidos(const JSON: string; painel: TScrollBox): TArray<TAtributoPreenchido>;`
- `procedure Fechar;`
- `procedure InserirAtributosNoBanco(const JSON: string);`
- `procedure SalvarAtributosDigitados;`
- `procedure CarregarAtributosDoBanco;`
- `procedure ProcessarUmJSON(const JSON: string; painel: TScrollBox; var yPos: Integer; TipoConsulta: String);`
- `function PostApi(uri, JsonText: String; var ResultText: String): Boolean;`
- `procedure ConsultarAtributosTributarios;`

## Uses

### Interface uses
`Winapi.Windows`, `Winapi.Messages`, `System.SysUtils`, `System.StrUtils`, `System.Variants`, `System.Classes`, `Vcl.Graphics`, `Vcl.Controls`, `Vcl.Forms`, `Vcl.Dialogs`, `Vcl.StdCtrls`, `Vcl.ExtCtrls`, `System.JSON`, `FireDAC.Stan.Intf`, `FireDAC.Stan.Option`, `FireDAC.Stan.Param`, `FireDAC.Stan.Error`, `FireDAC.DatS`, `FireDAC.Phys.Intf`, `FireDAC.DApt.Intf`, `FireDAC.Stan.Async`, `FireDAC.DApt`, `Data.DB`, `FireDAC.Comp.DataSet`, `FireDAC.Comp.Client`, `dmDuimp`, `IdIOHandler`, `IdIOHandlerSocket`, `IdIOHandlerStack`, `IdSSL`, `IdSSLOpenSSL`, `IdBaseComponent`, `IdComponent`, `IdTCPConnection`, `IdTCPClient`, `IdHTTP`, `Vcl.Grids`, `Vcl.DBGrids`, `uIntegracaoAPIs`

### Implementation uses
`System.Generics.Collections`

## Dependências internas do projeto

- `dmDuimp`, `uIntegracaoAPIs`

## Regras de dependência entre atributos (Base → Dependentes)

Esta tela cria **campos dinâmicos** a partir do JSON de Atributos Tributários e aplica regras de dependência (ex.: um atributo “depende” do valor selecionado em outro).

### Conceito

- **TratKey**: chave do tratamento tributário no formato `Tributo|Regime|Fundamento`.
- **BaseCodigo**: atributo “base” (index 1 / primeiro combo do tratamento).
- **Dependentes**: atributos que **só existem** para determinados valores do atributo base.

### Estruturas em memória (por tratamento)

- `FBaseCodigoPorTrat`: `TratKey -> BaseCodigo`
- `FDeps`: `TratKey -> BaseCodigo -> BaseValor -> DepCodigo -> ListaOpcoes`
  - ListaOpcoes: `TStringList` com itens no formato `valor | descricao`.

### Fluxo (alto nível)

1. `ProcessarUmJSON(...)` monta mapas e cria os controles (labels + combos/edits/radios).
2. O **campo base** recebe `OnChange := BaseComboChange`.
3. `BaseComboChange` extrai `TratKey`, `BaseCodigo` e o `BaseValor` selecionado e chama `AtualizarDependentes(...)`.
4. `AtualizarDependentes`:
   - atua **somente** nos controles do mesmo `TratKey`
   - mantém o **base sempre visível**
   - mostra/oculta e popula os dependentes conforme `FDeps`
   - pareia **label ↔ campo via `Tag`** (robustez; evita dependência de `FindChildControl`).

### Persistência e envio ao Portal

- Regra operacional adotada: **`NULL`/vazio = não exibir e não enviar**.
- Na gravação, use `CampoAplicavel(TratKey, CodigoAttr)` para:
  - não validar campos não aplicáveis
  - limpar valor/descrição quando o atributo deixar de ser aplicável
  - manter a tabela simples (sem coluna extra de visibilidade).

### Observações de UI

- Dependentes devem nascer **ocultos** (combo e label) e serem exibidos apenas quando aplicáveis.
- Ao mudar o valor do base, `AtualizarDependentes` ajusta UI e opções dinamicamente.


## Pontos de extensão / riscos comuns

- **Acoplamento**: evite chamar diretamente UI a partir de Infra/DTO.
- **Tratamento de erros**: padronize exceções/retornos em integrações (timeouts, HTTP status, parsing).
- **Logs**: preferir um logger central (mesmo que simples) para rastrear req/resp e correlação.
- **Evolução**: ao alterar esta unit, registre em `HISTORICO_ALTERACOES_DIFF.md`.

## Atualização (dependências genéricas): ComboBox + Edit + RadioGroup

**Data:** 2026-02-05

### Contexto
Ao evoluir a regra de dependência genérica (Base → Dependentes), identificamos que alguns atributos dependentes **não são Domínio dinâmico** (ex.: `ATT_2986` do tipo *Número real*), portanto são renderizados como `TEdit` (ou eventualmente `TRadioGroup`), e não como `TComboBox`.

Quando a rotina de dependência atualizava apenas `TComboBox`, os campos dependentes `TEdit`/`TRadioGroup` permaneciam **sempre ocultos** (ou sempre visíveis, dependendo da visibilidade inicial), mesmo quando o valor do campo base indicava que eles eram aplicáveis.

### Decisão
A procedure `AtualizarDependentes(TratKey, BaseCodigo, BaseValor)` foi generalizada para percorrer e tratar:

- `TComboBox` (dependentes de Domínio dinâmico)
- `TEdit` (número/texto)
- `TRadioGroup` (booleano/lógico)

A aplicabilidade continua sendo determinada por `FDeps`:

- **Aplicável**: `DepPorDepCodigo.ContainsKey(CodigoAtributo)`
- **Não aplicável**: oculta o controle e limpa seu valor (combo: limpa itens e `ItemIndex`, edit: limpa `Text`, radio: `ItemIndex := -1`).

### Pareamento Label ↔ Campo
Mantém-se a solução robusta via `Tag`:

- No momento da criação do controle, o `Tag` recebe o ponteiro do label correspondente:
  - `Combo.Tag := NativeInt(lbl);`
  - `Edit.Tag := NativeInt(lbl);`
  - `Radio.Tag := NativeInt(lbl);`

Assim, `AtualizarDependentes` não depende de `FindChildControl` nem de `Name` dos componentes.

### Impacto prático
- Atributos dependentes como `ATT_2986` passam a aparecer/desaparecer corretamente conforme o valor do campo base, em tributos como **CIDE, PIS, COFINS**, etc.
- Labels acompanham o controle de forma consistente.
