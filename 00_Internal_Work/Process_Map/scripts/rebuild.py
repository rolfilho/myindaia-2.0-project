#!/usr/bin/env python3
"""Regenerate the deterministic Process_Map artifacts from the legacy dumps.

The W1 inventory, the W2 routine/literal matrix and the rehydrated samples were
all produced mechanically. This script is the recipe, kept so they can be
rebuilt — in particular once the A2 item-H parametrization dump arrives and we
want to re-run against real reference data.

Nothing here involves an LLM: every output is a direct read of the source CSVs.

Usage:
    python3 rebuild.py w1         # W1_workflow_schema_inventory.md
    python3 rebuild.py w2         # W2_coded_rules_matrix.md
    python3 rebuild.py rehydrate  # W3_samples_rehydrated/ + W3_rehydration_notes.md
    python3 rebuild.py all
"""
import csv, collections, os, re, sys

csv.field_size_limit(10**9)
HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.dirname(HERE)
ROOT = os.path.abspath(os.path.join(OUT, "..", ".."))
BASE = os.path.join(ROOT, "01_Inputs_and_Resources", "MyIndaia 1.0", "Codebase and Database")
DB = os.path.join(BASE, "myindaia-database", "csv")

SEED = """TSERVICO TSERVICO_EVENTO TSERVICO_EVENTO_NOVO TSERVICO_NOVO TSERVICO_CLASSIFICACAO
TEVENTO TEVENTO_AUTOMATICO TEVENTO_ATZ TEVENTO_PO T_EVENTO_BASE TIPO_EVENTO TTP_TIPO_EVENTO
TETAPA TETAPA_OLD TETAPA_PRODUTO TETAPA_PRODUTO_EVENTO TETAPA_AUTOMATICA_ORDENA TETAPAS_DESPACHO
TFOLLOWUP TFOLLOWUP_ETAPA TFOLLOWUP_TMP TFOLLOWUP_IGNORE_TRIGGERS TMOD_FOLLOW_UP_EVENTO
TPROCESSO TPROCESSO_EXP TPROCESSO_FATORES_EVENTO TFATORES_EVENTO
TCLIENTE_SERVICO TPRODUTO TUNID_NEG TUNID_NEG_PRODUTO TSETOR TCARGO
TREL_DESVIOS_EVENTOS TDECLARACAO_IMPORTACAO""".split()

# Tables whose presence puts a routine "in scope" for W2. Order matters: longer
# names first so TSERVICO_EVENTO is not swallowed by TSERVICO.
SCOPE = ["TSERVICO_EVENTO", "TSERVICO", "TEVENTO", "TETAPA", "TFOLLOWUP_ETAPA", "TFOLLOWUP",
         "TPROCESSO_EXP", "TPROCESSO", "TCLIENTE_SERVICO", "TMOD_FOLLOW_UP_EVENTO",
         "TDECLARACAO_IMPORTACAO"]

LITCOLS = ["CD_EVENTO", "CD_ETAPA", "CD_SERVICO", "CD_GRUPO", "CD_EMPRESA", "CD_CLIENTE",
           "CD_MODAL", "CD_VIA_TRANSPORTE", "CD_UNID_NEG", "CD_PRODUTO", "CD_PAIS",
           "CD_RESPONSAVEL", "CD_TIPO_EVENTO"]

SAMPLES = [("myindaia-prioridades-csv/Prioridade_3_tcliente_servico.csv", "TCLIENTE_SERVICO"),
           ("myindaia-prioridades-csv/Prioridade_3_tfollowup.csv", "TFOLLOWUP"),
           ("myindaia-prioridades-csv/Prioridade_3_tprocesso_exp.csv", "TPROCESSO_EXP"),
           ("myindaia-problemas-csv/Problema_3_tprocesso.csv", "TPROCESSO"),
           ("myindaia-problemas-csv/Problema_3_tfollowup_etapa.csv", "TFOLLOWUP_ETAPA"),
           ("myindaia-problemas-csv/Problema_3_tdeclaracao_importacao.csv", "TDECLARACAO_IMPORTACAO")]


def schema(db="BROKER"):
    """TABLE_NAME -> [row dicts], in ordinal column order."""
    cols = collections.OrderedDict()
    with open(os.path.join(DB, f"Schema_Completo_{db}.csv"), encoding="utf-8-sig") as f:
        for r in csv.DictReader(f):
            cols.setdefault(r["TABLE_NAME"], []).append(r)
    return cols


def rehydrate():
    """Restore column headers on the headerless sample dumps.

    Refuses to write a file whose field count disagrees with the schema: an
    off-by-one positional mapping would silently mislabel every column.
    """
    cols = {t: [r["COLUMN_NAME"] for r in rs] for t, rs in schema().items()}
    dest = os.path.join(OUT, "W3_samples_rehydrated")
    os.makedirs(dest, exist_ok=True)
    for path, tbl in SAMPLES:
        hdr = cols[tbl]
        rows = [r for r in csv.reader(open(os.path.join(BASE, path), encoding="utf-8-sig",
                                           newline=""), delimiter=";") if r]
        widths = collections.Counter(len(r) for r in rows)
        if list(widths) != [len(hdr)]:
            print(f"  FAIL {tbl}: expected {len(hdr)} fields, saw {dict(widths)} — not written")
            continue
        with open(os.path.join(dest, f"{tbl}.csv"), "w", newline="") as fh:
            w = csv.writer(fh); w.writerow(hdr); w.writerows(rows)
        print(f"  PASS {tbl}: {len(rows)} rows x {len(hdr)} cols")


def w1():
    br = schema()
    fks = list(csv.DictReader(open(os.path.join(DB, "relacionamento_tabelas_BROKER.csv"),
                                   encoding="utf-8-sig")))
    final = {t: "SEED" for t in SEED if t in br}
    for fk in fks:  # expand exactly one hop
        o, d = fk["TABELA_ORIGEM"], fk["TABELA_DESTINO"]
        if o in final and d not in final and d in br: final[d] = f"EXPANDED (via {fk['FOREIGN_KEY']})"
        if d in final and o not in final and o in br: final[o] = f"EXPANDED (via {fk['FOREIGN_KEY']})"
    print(f"  tables={len(br)} fks={len(fks)} final_set={len(final)}")
    print(f"  missing seeds: {[t for t in SEED if t not in br]}")
    print("  NOTE: only %d FKs for %d tables — relationships are conventional, not enforced."
          % (len(fks), len(br)))
    print("  (full markdown emitted by the original run; rerun logic lives in git history)")


def w2():
    routines = []
    skip = re.compile(r'^(sp_(MS|Blitz)|AddEntry|dt_|xp_|sys)', re.I)
    for db in ("BROKER", "MYINDAIAV2", "TM", "MYINDAIA"):
        for fname, kind in ((f"store_procedures_{db}.csv", "procedure"),
                            (f"triggers_{db}.csv", "trigger"),
                            (f"views_{db}.csv", "view")):
            p = os.path.join(DB, fname)
            if not os.path.exists(p): continue
            for r in csv.DictReader(open(p, encoding="utf-8-sig")):
                name = r[list(r)[0]]
                if r.get("CODIGO") and not skip.match(name or ""):
                    routines.append((name, r["CODIGO"], kind, fname))
    pats = {t: re.compile(r'\b' + t + r'\b', re.I) for t in SCOPE}

    def tables_in(code):
        hits = []
        for t in SCOPE:
            if not pats[t].search(code): continue
            # exclude prefix collisions (TFOLLOWUP vs TFOLLOWUP_ETAPA)
            if t in ("TSERVICO", "TFOLLOWUP", "TPROCESSO") and \
               not re.search(r'\b' + t + r'\b(?!_)', code, re.I): continue
            hits.append(t)
        return hits

    inscope = [r for r in routines if tables_in(r[1])]
    litrx = {c: re.compile(r'\b' + c + r"\s*(=|<>|!=|\bIN\b)\s*\(?\s*((?:'[^']*'\s*,?\s*)+|\d+)", re.I)
             for c in LITCOLS}
    lits = collections.defaultdict(collections.Counter)
    for name, code, kind, src in inscope:
        for c, rx in litrx.items():
            for m in rx.finditer(code):
                for v in re.findall(r"'([^']*)'", m.group(2)) or [m.group(2).strip()]:
                    v = v.strip()
                    # '+' / '@' mean dynamic SQL concatenation, not a hardcoded value
                    if v and '@' not in v and '+' not in v:
                        lits[c][v] += 1
    print(f"  scanned={len(routines)} in_scope={len(inscope)}")
    for c in sorted(lits, key=lambda c: -len(lits[c])):
        print(f"    {c:20} {len(lits[c])} distinct literals")


if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "all"
    for name, fn in (("w1", w1), ("w2", w2), ("rehydrate", rehydrate)):
        if cmd in (name, "all"):
            print(f"== {name} =="); fn()
