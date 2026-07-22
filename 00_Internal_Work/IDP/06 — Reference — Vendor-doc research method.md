# Vendor doc research — method & learnings

Reusable recipe for "compare N vendors/APIs from their public docs" tasks. Distilled from the DEC-01
IDP vendor sweep (Reducto · LlamaExtract · Extend), 2026-07-21. Also mirrored in project memory
(`vendor-doc-research-tinyfish`).

## Tooling that worked

- **tinyfish `fetch_content` is the right tool for doc sites** — clean markdown, handles JS-heavy docs,
  up to **10 URLs in parallel**.
- **Set `links: true` on the first overview fetch.** The returned link list exposes the entire doc
  tree (pricing, credit-usage, security, residency, response-format, on-prem), so you jump straight to
  the right pages instead of guessing URLs. This is the single biggest time-saver.
- **Subagents do get tinyfish access** (earlier uncertainty resolved). One **Sonnet** agent per vendor
  works well; all three used tinyfish, no WebFetch fallback needed. Still hand agents the
  `ToolSearch select:mcp__tinyfish__fetch_content,mcp__tinyfish__search` line plus a fallback
  instruction, and make them report which tool they actually used.

## Delegation pattern (per-vendor agent)

Give each agent: **seed URLs + a fixed criteria grid + a source URL required per claim + an explicit
GAPS list + "mark vendor-reported accuracy as such."** This produces mergeable, verifiable output.
(For what *not* to delegate, see the `agy-delegation-limits` memory: delegate reading-for-intent,
never mechanical counting.)

## The predictable high-value page set

Same shape across IDP vendors — go straight to these rather than crawling from the home page:

- `/extract` or `/extraction` **overview**
- `/pricing` **and** a **credit-usage / billing-breakdown** page (the real rates live in the latter)
- `/security` **+ data-residency + on-prem / deployment-options**
- **response-format** page (per-field confidence / citations details live here)
- a **logistics / industry vertical** page (doc-type fit: BOLs, customs, invoices)

## Gotchas (don't re-learn these)

- **Doc domains move.** LlamaIndex relocated docs.cloud.llamaindex.ai → developers.llamaindex.ai
  mid-research. tinyfish follows the redirect; don't hardcode URLs.
- **Trust Centers reliably fail to fetch.** trust.reducto.ai, security.llamaindex.ai, trust.extend.ai
  are all SPA trust-center platforms that error on fetch. Get compliance facts from the docs'
  `/security` pages instead, and plan to request the SOC 2 report + subprocessor list from sales.
- **The decision-swinging facts are almost never in the overview page.** $/credit, Brazil/region
  residency, and confidence *calibration* live in the pricing/credit and security/residency pages —
  sometimes only findable via search. Volume pricing and LGPD specifics are frequently **not public at
  all** → always end with a gaps list.
- **Verify the numbers you'll publish yourself**, in the main thread (pricing $/credit, residency).
  Cheap, and it catches stale or second-hand relays — e.g. an agent citing a GitHub issue for a
  confidence-score defect, which was downgraded to "verify in PoC" rather than stated as fact.
- **All vendor benchmarks are self-run or self-commissioned.** Treat as marketing; note methodology.
