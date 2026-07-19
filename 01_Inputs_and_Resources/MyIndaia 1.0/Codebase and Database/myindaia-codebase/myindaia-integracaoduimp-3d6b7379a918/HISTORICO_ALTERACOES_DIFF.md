# Histórico de Alterações (por diff) — IntegracaoDuimp

Este arquivo é um **log permanente** para manter contexto de longo prazo.
A ideia é que cada mudança relevante seja registrada com:
- **motivo**
- **impacto**
- **arquivos alterados**
- **trechos de diff (curtos)**
- **riscos e passos de validação**

> Regra prática: se a mudança passou de ~30 minutos de trabalho, registre aqui.

---

## Como registrar

Para cada alteração:
1. Crie uma nova seção com data **YYYY-MM-DD**
2. Use um identificador (ex.: `CHG-0001`)
3. Inclua:
   - contexto do problema
   - decisão técnica
   - diff (resumo) + pontos críticos
   - como testar
   - rollback (se aplicável)

---

## Template

### 2026-01-12 — CHG-0001 — <título curto>

**Contexto / problema**
-

**Decisão técnica**
-

**Arquivos alterados**
-

**Diff (resumo)**
```diff
- linha antiga
+ linha nova
```

**Impacto / compatibilidade**
-

**Riscos**
-

**Como validar (checklist)**
- [ ] Compila
- [ ] Fluxo principal funciona
- [ ] Logs OK
- [ ] Cenários de erro cobertos

**Rollback**
-

---

## Entradas
*(adicione novas entradas acima deste separador, mantendo as mais recentes no topo)*
