# uNFeService

> Arquivo: `uNFeService.pas`

## Visão geral

Esta unit implementa a classe `TNFeService`, responsável por **orquestrar a geração dos XMLs de NF-e** a partir dos datasets preparados pelo `TdmNFe`. O serviço monta uma **nota pai** e **notas filhas** (por adição/contêiner), calcula totais e grava os XMLs em disco.

### Observações importantes de integração

* O projeto utiliza **ACBr em versão antiga (≈ 2020)**.
* Algumas exigências da central integradora **não são atendidas apenas pela serialização padrão do ACBr**.
* Por esse motivo, existem **regras explícitas no código** que garantem compatibilidade.

---

## Regras Especiais – IPI

### Contexto

A central integradora **rejeita XML de NF-e que não contenha a tag `<IPI>`**, mesmo quando não há cobrança de imposto.

Em versões antigas do ACBr, a tag `<IPI>` **só é gerada se o objeto `Imposto.IPI` for explicitamente preenchido**.

### Regra adotada

* A tag `<IPI>` é **sempre gerada** para os itens da NF-e.
* Quando não houver cobrança de IPI:

  * `CST = 99`
  * `vBC = 0`
  * `pIPI = 0`
  * `vIPI = 0`

Essa regra garante compatibilidade com a central sem necessidade de pós-processamento textual do XML.

### Implementação

A lógica está concentrada no método:

* `TNFeService.PreencherImpostosDoItem`

O método:

* Inicializa `IPIpIPI` com valor padrão `0`.
* Preenche explicitamente os campos do objeto `Imposto.IPI`.
* Utiliza RTTI para definir o `CST`, garantindo compatibilidade entre diferentes versões do ACBr.

---

## Ajuste da Ordem da Tag `<infNFe>`

### Problema

O ACBr antigo serializa a abertura da tag `<infNFe>` da seguinte forma:

```xml
<infNFe versao="4.00" Id="NFe...">
```

Entretanto, a central integradora **exige a ordem inversa**:

```xml
<infNFe Id="NFe..." versao="4.00">
```

### Solução adotada

* Após cada chamada a `GravarXML`, o arquivo XML é reaberto.
* Apenas a **linha de abertura da tag `<infNFe>`** é ajustada.
* Nenhuma outra parte do XML é modificada.

### Implementação

* Helper interno na unit `uNFeService.pas`.
* Chamado imediatamente após:

  * `GravarXML` da nota filha
  * `GravarXML` da nota pai

Essa abordagem garante compatibilidade sem necessidade de atualização do ACBr.

---

## Observações finais

* As regras acima **não são opcionais** e existem para atender exigências externas.
* Antes de remover ou alterar qualquer uma delas, é necessário validar novamente a integração com a central.
