# Documentação do Projeto myExtratoDuimp

## Visão geral

Este projeto é um **robô desktop em Delphi** que:

- Usa **CEF4Delphi** para embutir o Chromium em uma aplicação VCL.
- Acessa o **Portal Único Siscomex** para consultar **DUIMP**.
- Gera e baixa o **extrato da DUIMP em PDF**.
- Move o PDF para a **pasta de digitalização** do sistema Broker e registra o documento na tabela `TPROCESSO_DOCTOS` no SQL Server.
- Executa esse fluxo **automaticamente em intervalos configuráveis**, respeitando uma janela de horário.

> Importante: o foco atual do projeto é **apenas DUIMP**. O código legado de DUE está sendo removido/adaptado.

---

## Principais units

### `[uMiniBrowser.pas]` – Formulário principal (`TMiniBrowserFrm`)

Responsável pela interface e pela automação do navegador.

- **Componentes principais**
  - `Chromium1` + `CEFWindowParent1`: navegador CEF embutido.
  - `URLCbx`, `StatusBar1`, barra de navegação (voltar/avançar/reload).
  - `Memo`: log textual.
  - Botões de controle: `btnProcessar`, `btnSettings`, `Button1` (Fechar).
  - Timers: `tmrIntegracao`, `tmrClickGrid`, `tmrClickExtrato`, `tmrExtratoDialog`.

- **Fluxo geral**
  1. `btnProcessarClick`:
     - Limpa PDFs antigos (`LimpaPastaExtrato`) e logs (`LimpaLog`).
     - Desliga `tmrIntegracao` e desabilita `btnProcessar`.
     - Chama `dmdBroker.MontaLista` para encher a fila `cdsDuimpRegistro` (processos/DUIMP).
     - Se a fila não estiver vazia:
       - Loga posição e dados da DUIMP atual.
       - Faz `cdsDuimpRegistro.First` e carrega `MINIBROWSER_HOMEPAGE` no `Chromium1`.
     - Se a fila estiver vazia:
       - Loga "Lista vazia" e reprograma `tmrIntegracao` com base em `LocalSettings.Intervalo`.

  2. `tmrIntegracaoTimer`:
     - Faz contagem regressiva em milissegundos.
     - Quando o tempo zera, verifica a janela de horário (`InicioIntegracao` / `FimIntegracao` em `Settings.pas`).
     - Se estiver dentro da janela, chama `btnProcessarClick` automaticamente.

  3. Inicialização do navegador (`FormShow` / `Timer1Timer`):
     - Cria o browser (`Chromium1.CreateBrowser`).
     - Define `Chromium1.DefaultURL` como `MINIBROWSER_HOMEPAGE`:
       - `https://portalunico.siscomex.gov.br/portal/`.
     - Inicia `tmrIntegracao` com o intervalo configurado.

---

## Fluxo de automação DUIMP

### 1. Da tela inicial até a consulta de DUIMP

- Em `Chromium1AddressChange`:
  - Quando a URL é `https://portalunico.siscomex.gov.br/portal/#/`:
    - Redireciona para `https://portalunico.siscomex.gov.br/duimp/#/consultar-duimp`.

- Em `Chromium1LoadEnd` (quando `frame.IsMain`):
  - Sobrescreve `window.open` para garantir que tudo abra na mesma aba dentro do app:

    ```pascal
    browser.MainFrame.ExecuteJavaScript(
      'window.open = function(url, name, features){' +
      '  if(url){ window.location.href = url; }' +
      '};',
      'about:blank',
      0
    );
    ```

  - Quando a URL é `consultar-duimp`, executa JS que busca o campo `inputDuimp` e faz:
    - `console.log("PGConsDUIMP|" + vnmduimp)` para sinalizar que a tela está pronta.

- Em `Chromium1ConsoleMessage`, ao receber `PGConsDUIMP`:
  - Chama `PreencheNumeroDuimp`, que:
    - Pega o número da DUIMP do dataset `dmdBroker.cdsDuimpRegistroCD_DUIMP`.
    - Injeta JS que:
      - Localiza o `inputDuimp`.
      - Simula digitação (via setter nativo e eventos `input`/`change`/`blur`).
      - Localiza e clica no botão de **Consultar**.
  - Ao final, habilita `tmrClickGrid`.

### 2. Seleção da DUIMP na grid de resultados

- `tmrClickGridTimer`:
  - Roda JS que procura o link da DUIMP na grid:

    ```js
    var lnk = document.querySelector(
      '.ui-grid-cell div[ng-click*="abrirDuimp"] a.ng-binding'
    ) || document.querySelector('.ui-grid-cell a.ng-binding');
    if(lnk){ console.log("PgGrdDuimp|1"); return; }
    ```

- Em `Chromium1ConsoleMessage`, ao receber `PgGrdDuimp|1`:
  - Espera alguns segundos (`Esperar(2)`).
  - Executa JS que:
    - Localiza `div[ng-click*="abrirDuimp"]` ou o `a.ng-binding` interno.
    - Usa `scrollIntoView` + `click` para abrir o **detalhe da DUIMP**.
  - Desabilita `tmrClickGrid` e habilita `tmrClickExtrato`.

### 3. Detalhe da DUIMP e botão “Gerar Extrato”

- Em `Chromium1AddressChange`:
  - Quando a URL contém `https://portalunico.siscomex.gov.br/duimp/v2/#/detalhar-duimp`:
    - Habilita `tmrClickExtrato`.

- `tmrClickExtratoTimer`:
  - Após 1 segundo, roda JS que:
    - Procura o botão `"Gerar Extrato"` na tela principal:

      ```js
      var btnDuimp = document.querySelector(
        'p-button[label="Gerar Extrato"] button'
      ) || Array.from(
        document.querySelectorAll('button, a, [role="button"], span, p-button')
      ).find(function(el){
        var t = (el.innerText || el.textContent || "").trim().toLowerCase();
        return t.indexOf("gerar extrato") >= 0;
      });

      if(btnDuimp){ console.log("BtnExtratoDuimp|1"); return; }
      ```

    - Mantém ainda um fallback para o fluxo antigo de DUE (`BtnExtrato`).

- Em `Chromium1ConsoleMessage`, ao receber `BtnExtratoDuimp|1`:
  - JS clica no botão `"Gerar Extrato"` da tela principal.
  - Desliga `tmrClickExtrato` e **liga `tmrExtratoDialog`**.

### 4. Modal “Gerar extrato da Duimp”

Quando o botão “Gerar Extrato” é clicado, o portal abre um modal com:

- Campo `#faixa` (Faixa de itens).
- Um seletor de versão (`Versão`).
- Botão `"Gerar Extrato"` (type submit) dentro do dialog.

- **`tmrExtratoDialogTimer`**:
  - A cada segundo executa JS que:

    ```js
    var dlg = document.querySelector('div[role="dialog"] .pucx-modal-title');
    var faixa = document.getElementById("faixa");
    var btnOk = document.querySelector(
      'div[role="dialog"] p-button[type="submit"][label="Gerar Extrato"] button[type="submit"]'
    );

    if(!(dlg && faixa && btnOk)) return;

    faixa.value = "1";
    faixa.dispatchEvent(new Event("input", {bubbles:true}));

    btnOk.scrollIntoView({block:"center"});
    btnOk.click();
    ```

  - Após executar esse JS, desliga `tmrExtratoDialog`.
  - Por enquanto a **versão** é mantida como a default exibida na tela (não estamos alterando o seletor).

> Observação: por decisão atual, tanto a faixa de itens quanto a versão da DUIMP são preenchidas sempre com `1` (ou mantidas no default da UI). No futuro, isso pode ser ligado a campos do banco, se necessário.

### 5. Download do PDF e ciclo da fila

- `Chromium1BeforeDownload`:
  - Define o nome do arquivo a partir de `cdsDuimpRegistroNR_PROCESSO`:
    - `TempName := <NR_PROCESSO> + '.pdf'`.
  - Define o caminho da pasta `download` (`GetLocalPath + 'download'`).
  - Chama `callback.cont(TempFullPath, False);` para gravar o arquivo.

- `Chromium1DownloadUpdated`:
  - Durante o download, atualiza a barra de status com o progresso.
  - Quando `downloadItem.IsComplete`:
    - Chama `dmdBroker.GravaArquivo`, passando:
      - Pasta de origem: `GetLocalPath + 'download'`,
      - Nome do arquivo baixado,
      - `NR_PROCESSO` atual,
      - Descrição `Extrato Siscomex`.
    - Avança `cdsDuimpRegistro.Next`.
    - Se não chegou ao fim da fila:
      - Aguarda 2 segundos.
      - Loga posição e DUIMP atual.
      - Volta para a homepage (`Chromium1.LoadURL(MINIBROWSER_HOMEPAGE)`) para reiniciar o fluxo.
    - Se chegou ao final:
      - Loga "Fim da fila".
      - Carrega `about:blank`.
      - Reabilita `btnProcessar` e religa `tmrIntegracao` com o próximo intervalo.

---

## `[DmBroker.pas]` – Integração com banco/digitalização

`TdmdBroker` encapsula:

- Conexão FireDAC com SQL Server (`dbBroker: TFDConnection`).
- Fila de DUIMPs a processar (`qryDuimpRegistro` + `cdsDuimpRegistro`).
- Integração com a área de digitalização:
  - Descoberta da pasta de digitalização via função SQL `BROKER.DBO.FN_PATH_DIGITALIZACAO`.
  - Cálculo do nome de arquivo numérico sequencial (`GetNomeArquivo` + `TTP_DOCTO_DIGITALIZADO`).
  - Cópia do PDF para a pasta final (`CopiaArquivo`) e registro em `TPROCESSO_DOCTOS` (`IncluirArquivo`).

### Métodos principais

- `ConfiguraConexao(Servidor, Banco, Usuario, Senha)`
  - Ajusta `dbBroker.Params` e abre a conexão (`DriverID = 'MSSQL'`).

- `MontaLista`
  - Abre `cdsDuimpRegistro`, que é alimentado pelo `qryDuimpRegistro` (`SELECT` de processos/DUIMP com regras de eventos).

- `GravaArquivo(PathArquivo, NomeArquivo, NR_Processo, Descricao)`
  - Determina a pasta de digitalização (`GetDigitalizacaoPath`).
  - Calcula o nome final (`GetNomeArquivo`) e copia o arquivo PDF da pasta `download` para lá.
  - Registra (se novo) em `TPROCESSO_DOCTOS` com tipo de documento fixo (`164`) e `ID_TABELA` fixo (`1652005462`).
  - Apaga o arquivo da pasta `download` após o sucesso.

---

## `[Settings.pas]` – Configuração local

A unit `Settings.pas` define `TLocalSettings` (`LocalSettings` global), que armazena e persiste:

- `Servidor`, `Banco`, `Usuario`, `Senha` (usados em `ConfiguraConexao`).
- `Intervalo` (minutos entre integrações).
- Janela de horário:
  - `InicioIntegracao`, `FimIntegracao`.

Persistência:

- Usa **registro** (`HKLM\Software\MarcioMartins\Settings`) ou arquivo `Config.cfg` na pasta do executável.
- Em `initialization`:
  - Cria `LocalSettings` e chama `ReadConfig`.

---

## TODOs e próximos passos

- [ ] Remover código residual de DUE que não for mais necessário.
- [ ] (Opcional) Parametrizar faixa de itens e versão de DUIMP via banco de dados ao invés de valores fixos.
- [ ] Criar documentação específica de como configurar o ambiente (dependências CEF4Delphi, libs do Chromium etc.).

---

## Dica para portar para outra pasta

Se o projeto for movido para outra pasta (por exemplo, `C:\Projetos\Delphi\myextratoduimp`):

- Certifique-se de copiar também este `README.md` e todos os binários/pastas de suporte (`bin`, `download`, `log` etc.).
- No Delphi, abra o `.dpr`/`.dproj` a partir da nova pasta.
- Se surgirem erros de caminho (DLLs do CEF, por exemplo), revise os diretórios relativos no projeto ou nos scripts de build.

