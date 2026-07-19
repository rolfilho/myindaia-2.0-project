# Mapa de Units — IntegracaoDuimp

Data de geração: **2026-01-12**

## Resumo por categoria

### Domínio - Modelos de Dados

- `DadosGeraisDuimp`  
  - Arquivo: `DadosGeraisDuimp.pas`  
  - Linhas: 304  
  - SHA (12): `1b43a235e84d`
- `DadosItensDuimp`  
  - Arquivo: `DadosItensDuimp.pas`  
  - Linhas: 712  
  - SHA (12): `13caa9160306`

### Domínio/DTO - Serialização JSON

- `Pkg.Json.DTO`  
  - Arquivo: `Pkg.Json.DTO.pas`  
  - Linhas: 291  
  - SHA (12): `2ab4a32ca6a0`
- `uJsonAtributosAdicionaisTributos`  
  - Arquivo: `uJsonAtributosAdicionaisTributos.pas`  
  - Linhas: 116  
  - SHA (12): `12ad1e3a5f3a`

### Infra - Dados (DataModule)

- `dmDuimp`  
  - Arquivo: `dmDuimp.pas`  
  - Linhas: 32  
  - SHA (12): `a6ed6355ca6d`

### Infra - Integração (HTTP/APIs)

- `uIntegracaoAPIs`  
  - Arquivo: `uIntegracaoAPIs.pas`  
  - Linhas: 595  
  - SHA (12): `541cab98cc16`

### UI - Componentes/Utilitários

- `MyDialog`  
  - Arquivo: `MyDialog.pas`  
  - Linhas: 94  
  - SHA (12): `ad0c722ebdfd`

### UI - Forms/Fluxo

- `uFormDuimpView`  
  - Arquivo: `uFormDuimpView.pas`  
  - Linhas: 26  
  - SHA (12): `b888d6ff83fa`
- `uAtributosFundamento`  
  - Arquivo: `uAtributosFundamento.pas`  
  - Linhas: 940  
  - SHA (12): `90119db98415`
- `uAtributosTributarios`  
  - Arquivo: `uAtributosTributarios.pas`  
  - Linhas: 1779  
  - SHA (12): `5f44eaa64677`
- `uAtributosDuimp`  
  - Arquivo: `uAtributosDuimp.pas`  
  - Linhas: 984  
  - SHA (12): `24e3ed3dc31a`
- `uAtributosTributo`  
  - Arquivo: `uAtributosTributo.pas`  
  - Linhas: 1096  
  - SHA (12): `d34f6c179445`
- `Principal`  
  - Arquivo: `Principal.pas`  
  - Linhas: 4956  
  - SHA (12): `4289826f2512`

## Grafo de dependências internas (uses entre units do projeto)

- `DadosGeraisDuimp` → `Pkg.Json.DTO`
- `DadosItensDuimp` → `Pkg.Json.DTO`
- `dmDuimp` → *(sem dependências internas)*
- `MyDialog` → *(sem dependências internas)*
- `Pkg.Json.DTO` → *(sem dependências internas)*
- `Principal` → `DadosGeraisDuimp`, `DadosItensDuimp`, `MyDialog`, `Pkg.Json.DTO`, `dmDuimp`, `uAtributosDuimp`, `uAtributosFundamento`, `uAtributosTributarios`, `uAtributosTributo`, `uFormDuimpView`, `uIntegracaoAPIs`
- `uAtributosDuimp` → `MyDialog`, `dmDuimp`, `uIntegracaoAPIs`, `uJsonAtributosAdicionaisTributos`
- `uAtributosFundamento` → `dmDuimp`, `uIntegracaoAPIs`
- `uAtributosTributarios` → `dmDuimp`, `uIntegracaoAPIs`
- `uAtributosTributo` → `MyDialog`, `dmDuimp`, `uIntegracaoAPIs`, `uJsonAtributosAdicionaisTributos`
- `uFormDuimpView` → *(sem dependências internas)*
- `uIntegracaoAPIs` → *(sem dependências internas)*
- `uJsonAtributosAdicionaisTributos` → *(sem dependências internas)*

## Ordem sugerida de leitura (do menos dependente ao mais dependente)

1. `dmDuimp`
2. `MyDialog`
3. `Pkg.Json.DTO`
4. `uFormDuimpView`
5. `uIntegracaoAPIs`
6. `uJsonAtributosAdicionaisTributos`
7. `DadosGeraisDuimp`
8. `DadosItensDuimp`
9. `uAtributosFundamento`
10. `uAtributosTributarios`
11. `uAtributosDuimp`
12. `uAtributosTributo`
13. `Principal`

## Índice de documentação por unit

- [DadosGeraisDuimp](units/DadosGeraisDuimp.md)
- [DadosItensDuimp](units/DadosItensDuimp.md)
- [dmDuimp](units/dmDuimp.md)
- [MyDialog](units/MyDialog.md)
- [Pkg.Json.DTO](units/Pkg.Json.DTO.md)
- [Principal](units/Principal.md)
- [uAtributosDuimp](units/uAtributosDuimp.md)
- [uAtributosFundamento](units/uAtributosFundamento.md)
- [uAtributosTributarios](units/uAtributosTributarios.md)
- [uAtributosTributo](units/uAtributosTributo.md)
- [uFormDuimpView](units/uFormDuimpView.md)
- [uIntegracaoAPIs](units/uIntegracaoAPIs.md)
- [uJsonAtributosAdicionaisTributos](units/uJsonAtributosAdicionaisTributos.md)